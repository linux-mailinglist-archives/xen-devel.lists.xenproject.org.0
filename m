Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE32F5693D3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362517.592566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CCz-0003az-Pt; Wed, 06 Jul 2022 21:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362517.592566; Wed, 06 Jul 2022 21:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CCz-0003Xp-Mg; Wed, 06 Jul 2022 21:05:17 +0000
Received: by outflank-mailman (input) for mailman id 362517;
 Wed, 06 Jul 2022 21:05:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CCy-0003HV-Cm
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:05:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54544701-fd6f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 23:05:15 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141504075850.5089371575083;
 Wed, 6 Jul 2022 14:05:04 -0700 (PDT)
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
X-Inumbo-ID: 54544701-fd6f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1657141506; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BjNz+vhtn7JZ5oNQY7AaCvfLF5xunP4mzu+LiWjrFMTtB3Ri1YD/I59SoR6a+VYGP40lFvuDZIoIeAFqkOM8qGMrtmEYAKutRzGblzu8U6e5jIZPRS0fSlWK3Zk7JffUEB4bz7WtnbF0QfeAbn7OV797ZCoc0+yoIz6MTRpFtjc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141506; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=L/WuBmkg15fArIYdTBpQjhnYAJp4Q8ksywWw6j7y7O8=; 
	b=BMboqLQtUVXQKRboHj9iTOqC8mgYY3YdmkeTrUDYeRvSO4qZq7EZM5yDTY8+Dj5T47Qi+H2OHuek5SQHssJmEkiUrN5uln8SiSJo41diIH0BQrbn6kJIWAyrOqq3rl51Z2LI5FfP+jTPl7LaX2jngGVvhfn1577XTP3LSjlMRM8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141506;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=L/WuBmkg15fArIYdTBpQjhnYAJp4Q8ksywWw6j7y7O8=;
	b=KLftkx3bZqqDYrLUBhhP6M3pnGw4ilhiAar0WywhdGCFvn+xvKFDlx/Ye9/i623n
	e8THaiTSFzoZ53ZxWoTei+e8B/Fg9ehMnHIOnjb58IHArhBmvOKsCFGq2m10n+THzqJ
	WibxvAosMfuzhxBgJBu5hw+LKsmkYiLa+9sxuxpA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 01/18] kconfig: allow configuration of maximum modules
Date: Wed,  6 Jul 2022 17:04:36 -0400
Message-Id: <20220706210454.30096-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
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
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/Kconfig                  | 12 ++++++++++++
 xen/arch/arm/include/asm/setup.h  |  5 +++--
 xen/arch/x86/efi/efi-boot.h       |  2 +-
 xen/arch/x86/guest/xen/pvh-boot.c |  2 +-
 xen/arch/x86/setup.c              |  4 ++--
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index f16eb0df43..24139057be 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -17,3 +17,15 @@ config NR_CPUS
 	  For CPU cores which support Simultaneous Multi-Threading or similar
 	  technologies, this the number of logical threads which Xen will
 	  support.
+
+config NR_BOOTMODS
+	int "Maximum number of boot modules that a loader can pass"
+	range 1 32768
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
index f08b07b8de..2aa1e28c8f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1020,9 +1020,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
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


