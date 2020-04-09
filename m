Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13691A3587
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 16:13:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMXvF-0002nv-9I; Thu, 09 Apr 2020 14:12:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jMXvD-0002nk-T3
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:12:47 +0000
X-Inumbo-ID: 2f0d72f6-7a6c-11ea-82d6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f0d72f6-7a6c-11ea-82d6-12813bfff9fa;
 Thu, 09 Apr 2020 14:12:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0607EAE59;
 Thu,  9 Apr 2020 14:12:43 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/3] mini-os: fix double free() in xenbus
Date: Thu,  9 Apr 2020 16:12:39 +0200
Message-Id: <20200409141240.28876-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200409141240.28876-1-jgross@suse.com>
References: <20200409141240.28876-1-jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, samuel.thibault@ens-lyon.org, wl@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit 973ad0c4de1b48 ("Save/Restore Support: Add suspend/restore
support for xenbus") introduced a double free of some memory and leaked
another memory allocation.

Fix those.

Coverity-ID: 1433640
Fixes: 973ad0c4de1b48 ("Save/Restore Support: Add suspend/restore support for xenbus")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xenbus/xenbus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xenbus/xenbus.c b/xenbus/xenbus.c
index d72dc3a..b12cef7 100644
--- a/xenbus/xenbus.c
+++ b/xenbus/xenbus.c
@@ -413,9 +413,11 @@ void resume_xenbus(int canceled)
 
             rep = xenbus_msg_reply(XS_WATCH, XBT_NIL, req, ARRAY_SIZE(req));
             msg = errmsg(rep);
-            if (msg)
+            if (msg) {
                 xprintk("error on XS_WATCH: %s\n", msg);
-            free(rep);
+                free(msg);
+            } else
+                free(rep);
         }
     }
 
-- 
2.16.4


