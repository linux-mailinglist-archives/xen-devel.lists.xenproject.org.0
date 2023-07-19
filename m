Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A940C759466
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 13:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565780.884270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5Vo-0008HK-5o; Wed, 19 Jul 2023 11:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565780.884270; Wed, 19 Jul 2023 11:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5Vo-0008Ee-1m; Wed, 19 Jul 2023 11:38:32 +0000
Received: by outflank-mailman (input) for mailman id 565780;
 Wed, 19 Jul 2023 11:38:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fyAl=DF=citrix.com=prvs=55726f7b7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qM5Vm-0008EU-3a
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 11:38:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c62b4d83-2628-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 13:38:27 +0200 (CEST)
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
X-Inumbo-ID: c62b4d83-2628-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689766707;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cdykyWCvhm1VHiDSC7vriJlmZ/kQcwKm2xlZFrfOK2c=;
  b=HsfB+65Cr7bKV9GbwDHIz/pwGcBZ6L05WgK57FBdxnifGjb0IWNA8ZLW
   GXMtBo4X0UrPdKa+9c+FPku03NCwFQVeoxfF83V+1YqwP3i0aZsWT38Km
   V82b0V68c3v4/HmavGTkgZdmpVfmPMaNXWkscLH7xjZWI093z6+h5AEvH
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116016133
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:exH2Pqp1MmxoxR/M5BpEm3cb4cxeBmKBZRIvgKrLsJaIsI4StFCzt
 garIBmDMq7cazDxf9Fyb9jnpBsPuMLcyN9jHVY+qSEzQikVo5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzihNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGtVQSqfgeOK+e+qUPgwr+gSIM3aJ6pK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jufoTygXEhBb7RzzxKg4DGD2eHuzBnQRaMJSKG88MZzhwWckzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNQtWTUg2
 1uNntXoLT9iqruYTTSa7Lj8hSy2ETgYKykFfyBsZQkY59jupqkjgxSJScxseIaLidnyFSD10
 iq9hiE0jLUOjuYGz6y+u1vAhlqErJXTUhQ84AmRW2u/9x54f6asfYnu4l/ehd5aK4yUVEWG+
 nINlM6X9ukmB4yCjyGLT6MGG7TBz/CEOzrYiBhxEoU79jKs03S+cptd5j44L0BsWvvoYhewP
 hWV41kIosYOYj3zN/Qfj5+N59oClvDPL8jjV8ztM8tUc8RYWD6L+BB1TBvFt4zyq3TAgZ3TK
 L/CL5b9UitAWfw6pNalb7xDiOF2n0jS0UuWHMmmlEr/jNJycVbPEd843E2ygvfVBU9uiCHc6
 J5hOsSD0H2zu8WuM3CMoeb/wb3nREXX5KwaSOQNLIZv2iI8RAkc5wb5mNvNgbBNkaVPjfvv9
 XqgQEJew1eXrSSZeVTVMi07NOywB8sXQZcH0coEZwrAN58LONvH0UviX8FvIelPGBJLkZaYs
 MXpi+3fW68SG1wrChwWbIXnrZwKSfhYrVvmAsZRWxBmJ8QIb1WQqrfZkv7HqHFm4tyf6ZFv/
 NVNF2rzHfI+euiVJJ+JOaz3kwvr4CF1dSAbdxKgH+S/sX7EqOBCQxEdRNdsSy3QAX0vHgen6
 js=
IronPort-HdrOrdr: A9a23:1cjE0aEDkXc85cmHpLqE5seALOsnbusQ8zAXPhZKOHhom62j5q
 KTdZsgvyMc5Ax9ZJhko7690cq7MBDhHPxOjrX5Zo3SOzUO0VHAROpfBMnZogEIcBefygcy78
 tdm6YXMqyUMWRH
X-Talos-CUID: 9a23:VxdgfGFFYS0DlKMTqmI8rGEuBsYkTkSA3W3Bf2aUOGpteaa8HAo=
X-Talos-MUID: 9a23:e/gxWAlWS0Hz7P5GbP35dnpHJoRHvKqPWXomjLQd59WAMxRpPG+S2WE=
X-IronPort-AV: E=Sophos;i="6.01,216,1684814400"; 
   d="scan'208";a="116016133"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
Subject: [RFC REPOST] xen: Enable -Wwrite-strings
Date: Wed, 19 Jul 2023 12:38:10 +0100
Message-ID: <20230719113810.4066290-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is the remainder change to get x86 compiling with -Wwrite-strings.  ARM
still has some cleanup to go.

There are two swamps left.

  1) efi_arch_handle_cmdline().  Swapping name.s for name.cs makes the code
     compile, but only because the underlying union launders the pointer back
     to being mutable.

  2) dom0 cmdline.  There are various string literals which get moved/copied
     around but even with this const-ing, it only compiles because of a
     pointer laundered through strstr().

I think we do want to get Xen to a point where we can compile with
-Wwrite-strings unilaterally active, because it covers a lot of obvious and
simple cases, but that will involve fixing these two swaps and I don't think
we want to just take this patch and call it done.

For ARM, here is a gitlab run from a while back:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/931418508

There's one breakage here:

  In file included from arch/arm/efi/boot.c:700:
  arch/arm/efi/efi-boot.h: In function 'efi_arch_handle_cmdline':
  arch/arm/efi/efi-boot.h:482:16: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
    482 |         name.s = "xen";
        |                ^

which which mirrors the x86 side, but others such as:

  drivers/char/arm-uart.c: In function 'dt_uart_init':
  drivers/char/arm-uart.c:81:17: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
     81 |         options = "";
        |                 ^

which will need looking in to.  Please can someone else look into the ARM
side.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/Makefile                          | 2 ++
 xen/arch/x86/dom0_build.c             | 2 +-
 xen/arch/x86/efi/efi-boot.h           | 2 +-
 xen/arch/x86/hvm/dom0_build.c         | 4 ++--
 xen/arch/x86/include/asm/dom0_build.h | 4 ++--
 xen/arch/x86/include/asm/setup.h      | 2 +-
 xen/arch/x86/pv/dom0_build.c          | 2 +-
 xen/arch/x86/setup.c                  | 7 ++++---
 8 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index e8aa66378168..4424460a690a 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -380,6 +380,8 @@ else
 CFLAGS += -fomit-frame-pointer
 endif
 
+CFLAGS += -Wwrite-strings
+
 CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
 
 CFLAGS += -nostdinc -fno-builtin -fno-common
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
 
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 92f4cfe8bd11..fb64413e6b39 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -324,7 +324,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
         w2s(&name);
     }
     else
-        name.s = "xen";
+        name.cs = "xen";
     place_string(&mbi.cmdline, name.s);
 
     if ( mbi.cmdline )
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
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2dbe9857aa60..7cdbe595daf7 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -835,7 +835,7 @@ static bool __init loader_is_grub2(const char *loader_name)
     return (p != NULL) && (p[5] != '0');
 }
 
-static char * __init cmdline_cook(char *p, const char *loader_name)
+static const char *__init cmdline_cook(const char *p, const char *loader_name)
 {
     p = p ? : "";
 
@@ -883,7 +883,7 @@ static struct domain *__init create_dom0(const module_t *image,
         },
     };
     struct domain *d;
-    char *cmdline;
+    const char *cmdline;
     domid_t domid;
 
     if ( opt_dom0_pvh )
@@ -969,7 +969,8 @@ static struct domain *__init create_dom0(const module_t *image,
 void __init noreturn __start_xen(unsigned long mbi_p)
 {
     const char *memmap_type = NULL;
-    char *cmdline, *kextra, *loader;
+    const char *cmdline, *loader;
+    char *kextra;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
     unsigned int initrdidx, num_parked = 0;

base-commit: b1c16800e52743d9afd9af62c810f03af16dd942
prerequisite-patch-id: 4c64676f65b22476813ddf3241f1c71c024da970
prerequisite-patch-id: 7a565eba5d6054aef78ea9226a6bdeaeab207405
-- 
2.30.2


