Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DA91EB58F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 08:00:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfzyN-0002nm-C4; Tue, 02 Jun 2020 06:00:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jfzyL-0002nh-Ll
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 06:00:25 +0000
X-Inumbo-ID: 599ed8f8-a496-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 599ed8f8-a496-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 06:00:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 09BD5AFA7;
 Tue,  2 Jun 2020 06:00:25 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH-for-4.14 1/2] tools: check return value of asprintf() in
 xenhypfs
Date: Tue,  2 Jun 2020 08:00:20 +0200
Message-Id: <20200602060021.23289-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200602060021.23289-1-jgross@suse.com>
References: <20200602060021.23289-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

asprintf() can fail, so check its return value. Additionally fix a
memory leak in xenhypfs.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/misc/xenhypfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xenhypfs.c b/tools/misc/xenhypfs.c
index 158b901f42..5145b8969f 100644
--- a/tools/misc/xenhypfs.c
+++ b/tools/misc/xenhypfs.c
@@ -148,9 +148,14 @@ static int xenhypfs_tree_sub(char *path, unsigned int depth)
         printf("%*s%s%s\n", depth * 2, "", ent[i].name,
                ent[i].type == xenhypfs_type_dir ? "/" : "");
         if (ent[i].type == xenhypfs_type_dir) {
-            asprintf(&p, "%s%s%s", path, (depth == 1) ? "" : "/", ent[i].name);
+            if (asprintf(&p, "%s%s%s", path, (depth == 1) ? "" : "/",
+                         ent[i].name) < 0) {
+                ret = 2;
+                break;
+            }
             if (xenhypfs_tree_sub(p, depth + 1))
                 ret = 2;
+            free(p);
         }
     }
 
-- 
2.26.2


