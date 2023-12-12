Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9F980F13A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 16:38:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653195.1019588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4ph-0001YL-OH; Tue, 12 Dec 2023 15:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653195.1019588; Tue, 12 Dec 2023 15:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4ph-0001Uc-Jy; Tue, 12 Dec 2023 15:38:05 +0000
Received: by outflank-mailman (input) for mailman id 653195;
 Tue, 12 Dec 2023 15:38:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0UEi=HX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rD4pf-0000ZS-Kg
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 15:38:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e8d04b2-9904-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 16:38:01 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-82-60-45-193.retail.telecomitalia.it [82.60.45.193])
 by support.bugseng.com (Postfix) with ESMTPSA id 6E0734EE0C92;
 Tue, 12 Dec 2023 16:38:00 +0100 (CET)
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
X-Inumbo-ID: 6e8d04b2-9904-11ee-9b0f-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 3/4] xen/drivers: address violations of MISRA C:2012 Rule 8.2
Date: Tue, 12 Dec 2023 16:37:41 +0100
Message-Id: <6cd192af722b99323021c6f1561c5cf0178a1aaf.1702394721.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702394721.git.federico.serafini@bugseng.com>
References: <cover.1702394721.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/drivers/char/ehci-dbgp.c | 4 ++--
 xen/drivers/video/vga.c      | 2 +-
 xen/include/xen/video.h      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 72e1beabbb..0f5b41899e 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -341,7 +341,7 @@ struct ehci_dbgp {
     struct ehci_caps __iomem *ehci_caps;
 };
 
-static int ehci_dbgp_external_startup(struct ehci_dbgp *);
+static int ehci_dbgp_external_startup(struct ehci_dbgp *dbgp);
 
 static void ehci_dbgp_status(struct ehci_dbgp *dbgp, const char *str)
 {
@@ -997,7 +997,7 @@ err:
     return -ENODEV;
 }
 
-typedef void (*set_debug_port_t)(struct ehci_dbgp *, unsigned int);
+typedef void (*set_debug_port_t)(struct ehci_dbgp *dbgp, unsigned int port);
 
 static void cf_check default_set_debug_port(
     struct ehci_dbgp *dbgp, unsigned int port)
diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
index 18b590cdf0..b4d0183261 100644
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -21,7 +21,7 @@ static unsigned char *video;
 
 static void cf_check vga_text_puts(const char *s, size_t nr);
 static void cf_check vga_noop_puts(const char *s, size_t nr) {}
-void (*video_puts)(const char *, size_t nr) = vga_noop_puts;
+void (*video_puts)(const char *s, size_t nr) = vga_noop_puts;
 
 /*
  * 'vga=<mode-specifier>[,keep]' where <mode-specifier> is one of:
diff --git a/xen/include/xen/video.h b/xen/include/xen/video.h
index 96f8a50132..1ee1aa46b1 100644
--- a/xen/include/xen/video.h
+++ b/xen/include/xen/video.h
@@ -13,7 +13,7 @@
 
 #ifdef CONFIG_VIDEO
 void video_init(void);
-extern void (*video_puts)(const char *, size_t nr);
+extern void (*video_puts)(const char *s, size_t nr);
 void video_endboot(void);
 #else
 #define video_init()    ((void)0)
-- 
2.34.1


