Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34982658CC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 07:32:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGbe4-000857-Ta; Fri, 11 Sep 2020 05:30:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DvaW=CU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kGbe3-000852-Kp
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 05:30:47 +0000
X-Inumbo-ID: 041637f0-069f-4110-9499-3c88b1aa74dd
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 041637f0-069f-4110-9499-3c88b1aa74dd;
 Fri, 11 Sep 2020 05:30:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40676B37D;
 Fri, 11 Sep 2020 05:31:01 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/hypfs: fix writing of custom parameter
Date: Fri, 11 Sep 2020 07:30:43 +0200
Message-Id: <20200911053043.29445-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Today the maximum allowed data length for writing a hypfs node is
tested in the generic hypfs_write() function. For custom runtime
parameters this might be wrong, as the maximum allowed size is derived
from the buffer holding the current setting, while there might be ways
to set the parameter needing more characters than the minimal
representation of that value.

One example for this is the "ept" parameter. Its value buffer is sized
to be able to hold the string "exec-sp=0" or "exec-sp=1", while it is
allowed to use e.g. "no-exec-sp" or "exec-sp=yes" for setting it.

Fix that by moving the length check one level down to the type
specific write function.

In order to avoid allocation of arbitrary sized buffers use a new
MAX_PARAM_SIZE macro as an upper limit for custom writes. The value
of MAX_PARAM_SIZE is the same as the limit in parse_params() for a
single parameter.

Fixes: 5b5ccafb0c42 ("xen: add basic hypervisor filesystem support")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/hypfs.c      | 11 +++++++----
 xen/common/kernel.c     |  2 +-
 xen/include/xen/param.h |  3 +++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index b74c228191..8e932b5cf9 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -297,7 +297,9 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
     int ret;
 
     ASSERT(this_cpu(hypfs_locked) == hypfs_write_locked);
-    ASSERT(ulen <= leaf->e.max_size);
+
+    if ( ulen > leaf->e.max_size )
+        return -ENOSPC;
 
     if ( leaf->e.type != XEN_HYPFS_TYPE_STRING &&
          leaf->e.type != XEN_HYPFS_TYPE_BLOB && ulen != leaf->e.size )
@@ -356,6 +358,10 @@ int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
 
     ASSERT(this_cpu(hypfs_locked) == hypfs_write_locked);
 
+    /* Avoid oversized buffer allocation. */
+    if ( ulen > MAX_PARAM_SIZE )
+        return -ENOSPC;
+
     buf = xzalloc_array(char, ulen);
     if ( !buf )
         return -ENOMEM;
@@ -386,9 +392,6 @@ static int hypfs_write(struct hypfs_entry *entry,
 
     ASSERT(entry->max_size);
 
-    if ( ulen > entry->max_size )
-        return -ENOSPC;
-
     l = container_of(entry, struct hypfs_entry_leaf, e);
 
     return entry->write(l, uaddr, ulen);
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 9de07b7ac5..c3a943f077 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -57,7 +57,7 @@ static int assign_integer_param(const struct kernel_param *param, uint64_t val)
 static int parse_params(const char *cmdline, const struct kernel_param *start,
                         const struct kernel_param *end)
 {
-    char opt[128], *optval, *optkey, *q;
+    char opt[MAX_PARAM_SIZE], *optval, *optkey, *q;
     const char *p = cmdline, *key;
     const struct kernel_param *param;
     int rc, final_rc = 0;
diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index f4be944248..d0409d3a0e 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -26,6 +26,9 @@ struct kernel_param {
     } par;
 };
 
+/* Maximum length of a single parameter string. */
+#define MAX_PARAM_SIZE 128
+
 extern const struct kernel_param __setup_start[], __setup_end[];
 
 #define __param(att)      static const att \
-- 
2.26.2


