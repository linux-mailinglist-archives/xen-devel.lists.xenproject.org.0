Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A780638BF5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 15:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448186.705090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyZVE-0002Ga-Ud; Fri, 25 Nov 2022 14:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448186.705090; Fri, 25 Nov 2022 14:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyZVE-0002E0-Rj; Fri, 25 Nov 2022 14:16:28 +0000
Received: by outflank-mailman (input) for mailman id 448186;
 Fri, 25 Nov 2022 14:16:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PVcF=3Z=citrix.com=prvs=321964b5d=Per.Bilse@srs-se1.protection.inumbo.net>)
 id 1oyZVD-0002Du-5k
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 14:16:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdd11c59-6ccb-11ed-91b6-6bf2151ebd3b;
 Fri, 25 Nov 2022 15:16:25 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: bdd11c59-6ccb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669385785;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LZdooToHmw2SHxLUqVij15j9Jm3Upn7vZo/DVkK81SA=;
  b=HrP3Et47+S1MXIfbjISyVaJNL6J9plS0Wji9kZl5nYX+9uBJTuTwnxQg
   eSH+3eFuDhn/3UuMkWr7XKpogB/pUmmpYMd1OwCx4E3eqU4Z5Xa4BVYaR
   pxWD49xW6C2HmRzBikPksD8hsmtlFjLPBjTZwGWBFPt1H0N2rs78HdsX7
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84605283
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TKwoT6Ou9Q8hzWTvrR2hl8FynXyQoLVcMsEvi/4bfWQNrUol0WQOy
 WIaDGGCPf6LYjf9etgib4vnoUsP7cLRnYAyGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5AFmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vd3JWVPs
 uJGEzZXSEmZjsOZ4OqjFPY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTIKozhqGCh33kfhVTqU6PpLpx6G/WpOB0+OixboKIIIzRLSlTtkmDi
 W3H3kn5PkklFvjP9GCgriyKr8aayEsXX6pNTeblp5aGmma72Wg7GBAQE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpcNU7sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewcVTS8B4p79/ro11DSWVN9CP47tloPqTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4umkWyKRBaJxsldrVj
 Kj752tsCGd7ZifCUEOOS9vZ5gRD5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgT68yxFwwfxuZ
 M7BGSpJMZr9If03pAdaus9HieN7rszA7T27qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Mm
 +uy9qKilX1ibQEJSnSNqN5DcwxaRZX5bLivw/Fqmie4ClIOMAkc5zX5mNvNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:+JDjsatDUKt0EiND1FVXMsHK7skDfNV00zEX/kB9WHVpmszxra
 +TdZMgpHrJYVcqKRYdcL+7WZVoLUmwyXcX2/hyAV7BZmnbUQKTRekIh7cKqweQfxEWndQy6U
 4PScRD4aXLfDtHsfo=
X-IronPort-AV: E=Sophos;i="5.96,193,1665460800"; 
   d="scan'208";a="84605283"
From: Per Bilse <per.bilse@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Per Bilse <per.bilse@citrix.com>, Paul Durrant <paul@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] ioreq_broadcast(): accept partial broadcast success
Date: Fri, 25 Nov 2022 14:15:57 +0000
Message-ID: <06ad4b3a67a15192fc986b35e3f2fcd35b2f4c2f.1669383767.git.per.bilse@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

A change to XAPI varstored causes an unnecessary error message
to be logged in hypervisor.log whenever an RTC timeoffset update
is broadcast.  In extreme cases this could flood the log file.
This patch modifies ioreq_broadcast() to allow partial success.

Signed-off-by: Per Bilse <per.bilse@citrix.com>
---
 xen/arch/x86/hvm/io.c   | 2 +-
 xen/common/ioreq.c      | 9 +++++----
 xen/include/xen/ioreq.h | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 0309d05cfd..c4022bf7c2 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -60,7 +60,7 @@ void send_timeoffset_req(unsigned long timeoff)
     if ( timeoff == 0 )
         return;
 
-    if ( ioreq_broadcast(&p, true) != 0 )
+    if ( !ioreq_broadcast(&p, true, true) )
         gprintk(XENLOG_ERR, "Unsuccessful timeoffset update\n");
 }
 
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 4617aef29b..1d6ca4d1ac 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -54,7 +54,7 @@ void ioreq_signal_mapcache_invalidate(void)
         .data = ~0UL, /* flush all */
     };
 
-    if ( ioreq_broadcast(&p, false) != 0 )
+    if ( !ioreq_broadcast(&p, false, false) )
         gprintk(XENLOG_ERR, "Unsuccessful map-cache invalidate\n");
 }
 
@@ -1309,11 +1309,11 @@ int ioreq_send(struct ioreq_server *s, ioreq_t *proto_p,
     return IOREQ_STATUS_UNHANDLED;
 }
 
-unsigned int ioreq_broadcast(ioreq_t *p, bool buffered)
+bool ioreq_broadcast(ioreq_t *p, bool buffered, bool partial)
 {
     struct domain *d = current->domain;
     struct ioreq_server *s;
-    unsigned int id, failed = 0;
+    unsigned int id, sent = 0, failed = 0;
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
@@ -1322,9 +1322,10 @@ unsigned int ioreq_broadcast(ioreq_t *p, bool buffered)
 
         if ( ioreq_send(s, p, buffered) == IOREQ_STATUS_UNHANDLED )
             failed++;
+        sent++;
     }
 
-    return failed;
+    return failed == 0 || (partial && failed < sent);
 }
 
 void ioreq_domain_init(struct domain *d)
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index a26614d331..65457ca5ba 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -102,7 +102,7 @@ struct ioreq_server *ioreq_server_select(struct domain *d,
                                          ioreq_t *p);
 int ioreq_send(struct ioreq_server *s, ioreq_t *proto_p,
                bool buffered);
-unsigned int ioreq_broadcast(ioreq_t *p, bool buffered);
+bool ioreq_broadcast(ioreq_t *p, bool buffered, bool partial);
 void ioreq_request_mapcache_invalidate(const struct domain *d);
 void ioreq_signal_mapcache_invalidate(void);
 
-- 
2.31.1


