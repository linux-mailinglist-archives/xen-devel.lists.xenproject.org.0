Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC390759668
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 15:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565848.884420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM74J-0003Uf-8P; Wed, 19 Jul 2023 13:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565848.884420; Wed, 19 Jul 2023 13:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM74J-0003SX-5V; Wed, 19 Jul 2023 13:18:15 +0000
Received: by outflank-mailman (input) for mailman id 565848;
 Wed, 19 Jul 2023 13:18:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fyAl=DF=citrix.com=prvs=55726f7b7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qM74I-0003SR-7U
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 13:18:14 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4369fb9-2636-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 15:18:10 +0200 (CEST)
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
X-Inumbo-ID: b4369fb9-2636-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689772690;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PhhiL3zHUc0ntYLcK5me8bbKiX1aq/Dnmbcveep3Abc=;
  b=Bkh0HETqy1jnimWNkqQjOmc5oQHlSPdR0xaJn+X6eBZ2tWkguEA6L4fM
   ByrJAcPHF28Dbq7S0zJ0JKX+THr3C7QWtkx9KyQiYC9Pj26rQ87siCTE7
   Xnex+bBRxyW4IvbUZnIs3IP5rB/LkSMwgoog9ye6Acynq8SshNAQ2zLGp
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116752627
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:CkRIj6OiRiAggQbvrR2bl8FynXyQoLVcMsEvi/4bfWQNrUp3gzYHz
 WQXW2jTPqqMZWr2LtFwbYW08U5Q7JHdnddhGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5w1mP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0v1cPWRxp
 c0eEhMEQDqens+Z+KL8ceY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXTG5oIxBjC+
 Qoq+UzyBQw8BsKRxgapyWOA3daUu3ygfKErQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebTAyz
 VqIg9PBDCRiqqGIUmma8qqIrDS0Im4eKmpqTSQEVwoe/977oIwpphTCXthiCui+ididJN3r6
 2nU9m5k3exV1JNVkfzhpjgrng5AuLDSZTIw2VXmWFiG5y1TeZeISLS4rmPUuKMowJmicrWRg
 JQVs5HAvLFRUMvdzHHlrPYlR+/wuavcWNHIqRs2RsR6qWzwk5K2VdoIiAySMnuFJSrtldXBR
 EbI8T1c65ZIVJdBRf8mOtnhYyjGIEWJKDgEahw3RoAUCnSJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTmFrhFjOd3mX9kmAs/oKwXKTz9jdJyg1bMFN843KamNLhlvMtoXi2Jm
 zqgCyd640oGC7CvCsUm2YUSMUoLPRAG6WPe8qRqmhq4ClM+QgkJUqaBqY7NjqQ5x8y5YM+Up
 CDiMqKZoXKj7UD6xfKiNikyOeu/BMYm9BrW/0UEZD6V5pTqWq73hI93Snf9VeJPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:Z75Q56gm/sOlyhUnyzYr6SpoCHBQXt4ji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZslndMhy72ulB1b
 pxN4hSYeeAamSSVPyKgjVQxexQpeW6zA==
X-Talos-CUID: =?us-ascii?q?9a23=3AmbZfamhdRxWvQ1bqcOchYfXngzJuaVbhyUiAEkm?=
 =?us-ascii?q?CKm9HYqCMZHCo6ORfnJ87?=
X-Talos-MUID: 9a23:UjxoUAVmMotSk97q/DTrmRdQKsln34iVGWxWqM4g5JKgFhUlbg==
X-IronPort-AV: E=Sophos;i="6.01,216,1684814400"; 
   d="scan'208";a="116752627"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Daniel Smith
	<dpsmith@apertussolutions.com>, Christopher Clark <christopher@nexfir.com>
Subject: [PATCH RFC] x86/boot: Update construct_dom0() to take a const char *cmdline
Date: Wed, 19 Jul 2023 14:18:02 +0100
Message-ID: <20230719131802.4078609-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With hvm_copy_to_guest_*() able to use const sources, update construct_dom0()
and friends to pass a const cmdline pointer.  Nothing in these paths have a
reason to be modifying the command line passed in.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Daniel Smith <dpsmith@apertussolutions.com>
CC: Christopher Clark <christopher@nexfir.com>

Slightly RFC.

I'm confused as to why image is const, but the initrd isn't.

Also, I suspect this will interfere with the Hyperlauch work, and I'd be happy
to leave it alone if all of this is being fixed differently anyway.

This is necessary to make the -Wwrite-strings bodge compile, but I'm hoping
that a less-bad solution to the cmdline literals problem would avoid the need
to propagate const through this callpath.
---
 xen/arch/x86/dom0_build.c             | 2 +-
 xen/arch/x86/hvm/dom0_build.c         | 4 ++--
 xen/arch/x86/include/asm/dom0_build.h | 4 ++--
 xen/arch/x86/include/asm/setup.h      | 2 +-
 xen/arch/x86/pv/dom0_build.c          | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 9f5300a3efbb..8b1fcc6471d8 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -564,7 +564,7 @@ int __init dom0_setup_permissions(struct domain *d)
 
 int __init construct_dom0(struct domain *d, const module_t *image,
                           unsigned long image_headroom, module_t *initrd,
-                          char *cmdline)
+                          const char *cmdline)
 {
     int rc;
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index fd2cbf68bc62..a7ae9c3b046e 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -532,7 +532,7 @@ static paddr_t __init find_memory(
 static int __init pvh_load_kernel(struct domain *d, const module_t *image,
                                   unsigned long image_headroom,
                                   module_t *initrd, void *image_base,
-                                  char *cmdline, paddr_t *entry,
+                                  const char *cmdline, paddr_t *entry,
                                   paddr_t *start_info_addr)
 {
     void *image_start = image_base + image_headroom;
@@ -1177,7 +1177,7 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
 int __init dom0_construct_pvh(struct domain *d, const module_t *image,
                               unsigned long image_headroom,
                               module_t *initrd,
-                              char *cmdline)
+                              const char *cmdline)
 {
     paddr_t entry, start_info;
     int rc;
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index a5f8c9e67f68..107c1ff98367 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -16,12 +16,12 @@ int dom0_setup_permissions(struct domain *d);
 int dom0_construct_pv(struct domain *d, const module_t *image,
                       unsigned long image_headroom,
                       module_t *initrd,
-                      char *cmdline);
+                      const char *cmdline);
 
 int dom0_construct_pvh(struct domain *d, const module_t *image,
                        unsigned long image_headroom,
                        module_t *initrd,
-                       char *cmdline);
+                       const char *cmdline);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index ae0dd3915a61..51fce66607dc 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -35,7 +35,7 @@ int construct_dom0(
     struct domain *d,
     const module_t *kernel, unsigned long kernel_headroom,
     module_t *initrd,
-    char *cmdline);
+    const char *cmdline);
 void setup_io_bitmap(struct domain *d);
 
 unsigned long initial_images_nrpages(nodeid_t node);
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index c99135a5522f..909ee9a899a4 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -358,7 +358,7 @@ int __init dom0_construct_pv(struct domain *d,
                              const module_t *image,
                              unsigned long image_headroom,
                              module_t *initrd,
-                             char *cmdline)
+                             const char *cmdline)
 {
     int i, rc, order, machine;
     bool compatible, compat;
-- 
2.30.2


