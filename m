Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47026337558
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:22:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96569.182805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMCg-0003Rw-Um; Thu, 11 Mar 2021 14:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96569.182805; Thu, 11 Mar 2021 14:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMCg-0003RZ-RL; Thu, 11 Mar 2021 14:22:18 +0000
Received: by outflank-mailman (input) for mailman id 96569;
 Thu, 11 Mar 2021 14:22:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cYX0=IJ=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lKMCf-0003RU-QL
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:22:17 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7da69c1c-e585-488f-b41e-4a9634814bf5;
 Thu, 11 Mar 2021 14:22:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 823601FB;
 Thu, 11 Mar 2021 06:22:15 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.15.166])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C979A3F800;
 Thu, 11 Mar 2021 06:22:12 -0800 (PST)
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
X-Inumbo-ID: 7da69c1c-e585-488f-b41e-4a9634814bf5
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	bertrand.marquis@arm.com
Subject: [PATCH v5] arm: Add Kconfig entry to select CONFIG_DTB_FILE
Date: Thu, 11 Mar 2021 15:22:07 +0100
Message-Id: <20210311142207.25556-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently in order to link existing DTB into Xen image
we need to either specify option CONFIG_DTB_FILE on the
command line or manually add it into .config.
Add Kconfig entry: CONFIG_DTB_FILE
to be able to provide the path to DTB we want to embed
into Xen image. If no path provided - the dtb will not
be embedded.

Remove the line: AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
as it is not needed since Kconfig will define it in a header
with all the other config options.

Make a change in the linker script from:
_sdtb = .;
to:
PROVIDE(_sdtb = .);
to avoid creation of _sdtb if there is no reference to it.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/Makefile     | 5 ++---
 xen/arch/arm/arm32/head.S | 4 ++--
 xen/arch/arm/arm64/head.S | 4 ++--
 xen/arch/arm/xen.lds.S    | 2 +-
 xen/common/Kconfig        | 8 ++++++++
 5 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 16e6523e2c..46e6a95fec 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -68,9 +68,8 @@ extra-y += $(TARGET_SUBARCH)/head.o
 
 #obj-bin-y += ....o
 
-ifdef CONFIG_DTB_FILE
+ifneq ($(CONFIG_DTB_FILE),"")
 obj-y += dtb.o
-AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
 endif
 
 ALL_OBJS := $(TARGET_SUBARCH)/head.o $(ALL_OBJS)
@@ -137,7 +136,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
 xen.lds: xen.lds.S
 	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
 
-dtb.o: $(CONFIG_DTB_FILE)
+dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
 
 .PHONY: clean
 clean::
diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index c404fa973e..50f019ed98 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -156,10 +156,10 @@ past_zImage:
         sub   r10, r9, r0            /* r10 := phys-offset */
 
         /* Using the DTB in the .dtb section? */
-#ifdef CONFIG_DTB_FILE
+.ifnes CONFIG_DTB_FILE,""
         ldr   r8, =_sdtb
         add   r8, r10                /* r8 := paddr(DTB) */
-#endif
+.endif
 
         /* Initialize the UART if earlyprintk has been enabled. */
 #ifdef CONFIG_EARLY_PRINTK
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 5d44667bd8..f38a8dfca7 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -296,9 +296,9 @@ real_start_efi:
         sub   x20, x19, x0           /* x20 := phys-offset */
 
         /* Using the DTB in the .dtb section? */
-#ifdef CONFIG_DTB_FILE
+.ifnes CONFIG_DTB_FILE,""
         load_paddr x21, _sdtb
-#endif
+.endif
 
         /* Initialize the UART if earlyprintk has been enabled. */
 #ifdef CONFIG_EARLY_PRINTK
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 004b182acb..78af2af504 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -222,7 +222,7 @@ SECTIONS
 
 #ifdef CONFIG_DTB_FILE
   /* Section for the device tree blob (if any). */
-  _sdtb = .;
+  PROVIDE(_sdtb = .);
   .dtb : { *(.dtb) } :text
 #endif
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index eb953d171e..71fc9e00cb 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -400,6 +400,14 @@ config DOM0_MEM
 
 	  Leave empty if you are not sure what to specify.
 
+config DTB_FILE
+	string "Absolute path to device tree blob"
+	depends on HAS_DEVICE_TREE
+	help
+	  When using a bootloader that has no device tree support or when there
+	  is no bootloader at all, use this option to specify the absolute path
+	  to a device tree that will be linked directly inside Xen binary.
+
 config TRACEBUFFER
 	bool "Enable tracing infrastructure" if EXPERT
 	default y
-- 
2.29.0


