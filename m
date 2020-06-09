Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49151F3E9A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 16:49:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jifYi-0007aF-O9; Tue, 09 Jun 2020 14:49:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jifYi-0007YS-5U
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 14:49:00 +0000
X-Inumbo-ID: 56d787b2-aa60-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56d787b2-aa60-11ea-b7bb-bc764e2007e4;
 Tue, 09 Jun 2020 14:48:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DD42FAD85;
 Tue,  9 Jun 2020 14:48:56 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14 1/2] tools: fix error path of xenhypfs_open()
Date: Tue,  9 Jun 2020 16:48:49 +0200
Message-Id: <20200609144850.28619-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609144850.28619-1-jgross@suse.com>
References: <20200609144850.28619-1-jgross@suse.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In case of an error in xenhypfs_open() the error path will cause a
segmentation fault due to a wrong sequence of closing calls.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/hypfs/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/hypfs/core.c b/tools/libs/hypfs/core.c
index c91e165705..fc23b02586 100644
--- a/tools/libs/hypfs/core.c
+++ b/tools/libs/hypfs/core.c
@@ -74,8 +74,8 @@ xenhypfs_handle *xenhypfs_open(xentoollog_logger *logger,
     return fshdl;
 
 err:
-    xtl_logger_destroy(fshdl->logger_tofree);
     xencall_close(fshdl->xcall);
+    xtl_logger_destroy(fshdl->logger_tofree);
     free(fshdl);
     return NULL;
 }
-- 
2.26.2


