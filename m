Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D597F538905
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 00:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338919.563767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvoEk-0003LK-29; Mon, 30 May 2022 22:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338919.563767; Mon, 30 May 2022 22:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvoEj-0003F9-Se; Mon, 30 May 2022 22:51:45 +0000
Received: by outflank-mailman (input) for mailman id 338919;
 Mon, 30 May 2022 22:51:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epuh=WG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvo5R-000799-AV
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 22:42:09 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbc29904-e069-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 00:42:08 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653950519242310.60530902135247;
 Mon, 30 May 2022 15:41:59 -0700 (PDT)
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
X-Inumbo-ID: bbc29904-e069-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1653950521; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RxB74e1r1rnfOsVx9gK0CxQZgO3Hu8VtwZUSf6IgJAc5PflyNI0fbvpv6GEZ/XYjkBE6KpH5pn8JZiS22UvSHzHErKXuYSOVMb/dJzbw7T7NN1Hk4QJaOYk/q/YO+dZXGyKuLehkA6w5jSOn34FLnXVlCSTY2K0q7o2r4nm0FXI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653950521; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=2+etTsXf8iWllebDioWmtCtaWII0LrkP35ocYWHoB/I=; 
	b=hJFyPSqkOUVI3H9q3eLvGA8dISVN/rM4xp/FSaAavtGnhMFJlTSmXAsRSEam5Mx8sONqIc7l4HGKdaIV2NJ0PVFrKBbEscWNb4phcnBbguW1dUG5fcca+EU2iiXR2YC48Dk9gjYrUJCK0ycH7RSGogz123fS2/GPBMvrHOCgv98=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653950521;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=2+etTsXf8iWllebDioWmtCtaWII0LrkP35ocYWHoB/I=;
	b=SxokjebdsIBmtYMxINXGexQDmrmm+sA2AyKe9T8m8htkd01gX7wnCaIPF00Is+K8
	2wVnU4N+Eu5KyDztbTzgknca93xGh1G9b/yUFFueDxjthJCuu87mAoIUk6gSxXDatPP
	c1K4ez9khzvVrRGSvjVietSCeHREaba6n2cFtGXk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	sstabellini@kernel.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
Date: Mon, 30 May 2022 22:41:23 -0400
Message-Id: <20220531024127.23669-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220531024127.23669-1-dpsmith@apertussolutions.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

For x86 the number of allowable multiboot modules varies between the different
entry points, non-efi boot, pvh boot, and efi boot. In the case of both Arm and
x86 this value is fixed to values based on generalized assumptions. With
hyperlaunch for x86 and dom0less on Arm, use of static sizes results in large
allocations compiled into the hypervisor that will go unused by many use cases.

This commit introduces a Kconfig variable that is set with sane defaults based
on configuration selection. This variable is in turned used as the array size
for the cases where a static allocated array of boot modules is declared.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/Kconfig                  | 12 ++++++++++++
 xen/arch/arm/include/asm/setup.h  |  5 +++--
 xen/arch/x86/efi/efi-boot.h       |  2 +-
 xen/arch/x86/guest/xen/pvh-boot.c |  2 +-
 xen/arch/x86/setup.c              |  4 ++--
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index f16eb0df43..57b14e22c9 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -17,3 +17,15 @@ config NR_CPUS
 	  For CPU cores which support Simultaneous Multi-Threading or similar
 	  technologies, this the number of logical threads which Xen will
 	  support.
+
+config NR_BOOTMODS
+	int "Maximum number of boot modules that a loader can pass"
+	range 1 64
+	default "8" if X86
+	default "32" if ARM
+	help
+	  Controls the build-time size of various arrays allocated for
+	  parsing the boot modules passed by a loader when starting Xen.
+
+	  This is of particular interest when using Xen's hypervisor domain
+	  capabilities such as dom0less.
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 2bb01ecfa8..312a3e4209 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -10,7 +10,8 @@
 
 #define NR_MEM_BANKS 256
 
-#define MAX_MODULES 32 /* Current maximum useful modules */
+/* Current maximum useful modules */
+#define MAX_MODULES CONFIG_NR_BOOTMODS
 
 typedef enum {
     BOOTMOD_XEN,
@@ -38,7 +39,7 @@ struct meminfo {
  * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
  * The purpose of the domU flag is to avoid getting confused in
  * kernel_probe, where we try to guess which is the dom0 kernel and
- * initrd to be compatible with all versions of the multiboot spec. 
+ * initrd to be compatible with all versions of the multiboot spec.
  */
 #define BOOTMOD_MAX_CMDLINE 1024
 struct bootmodule {
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 6e65b569b0..4e1a799749 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -18,7 +18,7 @@ static multiboot_info_t __initdata mbi = {
  * The array size needs to be one larger than the number of modules we
  * support - see __start_xen().
  */
-static module_t __initdata mb_modules[5];
+static module_t __initdata mb_modules[CONFIG_NR_BOOTMODS + 1];
 
 static void __init edd_put_string(u8 *dst, size_t n, const char *src)
 {
diff --git a/xen/arch/x86/guest/xen/pvh-boot.c b/xen/arch/x86/guest/xen/pvh-boot.c
index 498625eae0..834b1ad16b 100644
--- a/xen/arch/x86/guest/xen/pvh-boot.c
+++ b/xen/arch/x86/guest/xen/pvh-boot.c
@@ -32,7 +32,7 @@ bool __initdata pvh_boot;
 uint32_t __initdata pvh_start_info_pa;
 
 static multiboot_info_t __initdata pvh_mbi;
-static module_t __initdata pvh_mbi_mods[8];
+static module_t __initdata pvh_mbi_mods[CONFIG_NR_BOOTMOD + 1];
 static const char *__initdata pvh_loader = "PVH Directboot";
 
 static void __init convert_pvh_info(multiboot_info_t **mbi,
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index ed67b50c9d..3f5e602e00 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1017,9 +1017,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         panic("dom0 kernel not specified. Check bootloader configuration\n");
 
     /* Check that we don't have a silly number of modules. */
-    if ( mbi->mods_count > sizeof(module_map) * 8 )
+    if ( mbi->mods_count > CONFIG_NR_BOOTMODS )
     {
-        mbi->mods_count = sizeof(module_map) * 8;
+        mbi->mods_count = CONFIG_NR_BOOTMODS;
         printk("Excessive multiboot modules - using the first %u only\n",
                mbi->mods_count);
     }
-- 
2.20.1


