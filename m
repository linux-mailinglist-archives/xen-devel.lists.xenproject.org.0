Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF3883604D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 12:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669758.1042154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRs4u-000769-AU; Mon, 22 Jan 2024 11:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669758.1042154; Mon, 22 Jan 2024 11:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRs4u-00074P-7k; Mon, 22 Jan 2024 11:02:56 +0000
Received: by outflank-mailman (input) for mailman id 669758;
 Mon, 22 Jan 2024 11:02:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2apV=JA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rRs4s-00074J-SY
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 11:02:54 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca762fca-b915-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 12:02:53 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e76626170so34830495e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 03:02:53 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c45c800b0040e527602c8sm42877281wmo.9.2024.01.22.03.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 03:02:52 -0800 (PST)
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
X-Inumbo-ID: ca762fca-b915-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705921373; x=1706526173; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fIQcrOAipQawnooqTPYzNxRkpNNdJhFZxAVg9KPUrA=;
        b=R4gjUXmMFw60g9eKMLrG+/R+GucDca9cyTtqGc6iKHtch1VlV3dZ4u8EkNjq0M97YM
         UEGxPynALyhf4dX1yLXxEaS1q4wq7k7Wc06VByQi5HVSeV8503CkNeAdS2DpVfM3ZTLs
         TRSzrBKMIBmNta5BUOH10p6SP+g/dtyjJb1fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921373; x=1706526173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fIQcrOAipQawnooqTPYzNxRkpNNdJhFZxAVg9KPUrA=;
        b=tsU2cTrk45XJYBQ3py8bekfB1WE/+AL3MxyE5XIW1sygHkVYnveEzTc/6FjnNPxh8b
         sZ1uDKydZsYKPr+8sLREqOcs1KrfAFV6N3/5BpYECkYAaprnyWwUrCRkVircFd7bDyAX
         dln+cVH2KhY7rk0JddtLcwZqzZl0YsFBKqQWEqIK1Tgq7ohCpctLZp01tuTu8eeus6Ri
         3UHVaI9UptNt4z5nMCHV5Rb/xSwHhwXbohM9Qankv4WzCBwxsop5IPbR/5znGcJgmnYg
         vN4X+uGWgPhn9z/rYIXe71IB0QobGph8e7VtyR79AvyEtE1Oi2FvkIC22s7ctYMKt4Uv
         JAgA==
X-Gm-Message-State: AOJu0YzwJ0kzX7kAAuy95cMp8tv+WKSyikb+GVHjffeMX8oPvR5+KrC7
	IntH2x6lEOIXQOWrNM3fLgstXWowa8QYl6GyUPabeQKGDa0JKaYzW1mUgu+0VAAPH3sV4PhPlZe
	4
X-Google-Smtp-Source: AGHT+IFArCo09vSFTHWhQNfpyvzgz65yo4m+nxBMYvpxaW12C0hhChCHi4K9ChQEWsUSST1YAFhnAQ==
X-Received: by 2002:a05:600c:498a:b0:40e:5a80:6177 with SMTP id h10-20020a05600c498a00b0040e5a806177mr2142863wmp.69.1705921373022;
        Mon, 22 Jan 2024 03:02:53 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5] x86/livepatch: align functions to ensure minimal distance between entry points
Date: Mon, 22 Jan 2024 12:02:44 +0100
Message-ID: <20240122110244.14091-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The minimal function size requirements for an x86 livepatch are either 5 bytes
(for jmp) or 9 bytes (for endbr + jmp), and always 4 bytes on Arm.  Ensure that
distance between functions entry points is always at least of the minimal
required size for livepatch instruction replacement to be successful.

Add an additional align directive to the linker script, in order to ensure that
the next section placed after the .text.* (per-function sections) is also
aligned to the required boundary, so that the distance of the last function
entry point with the next symbol is also of minimal size.

Note that it's possible for the compiler to end up using a higher function
alignment regardless of the passed value, so this change just make sure that
the minimum required for livepatch to work is present.  Different compilers
handle the option differently, as clang will ignore -falign-functions value
if it's smaller than the one that would be set by the optimization level, while
gcc seems to always honor the function alignment passed in -falign-functions.
In order to cope with this behavior and avoid that setting -falign-functions
results in an alignment inferior to what the optimization level would have
selected force x86 release builds to use a function alignment of 16 bytes.
For Arm the default compiler selection of function alignment matches the
requirements of livepatch, which are 4 bytes.

The compiler option -falign-functions is not available on at least clang 3.8,
so introduce a Kconfig check for it and make the livepatch option depend on the
compiler supporting the option.

The naming of the option(s) CONFIG_FUNCTION_ALIGNMENT is explicitly not
mentioning CC in preparation for the option also being used by assembly code.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - Split from the rest of the livepatch testing series.
 - Reword and expand a bit the commit message.
 - Add a comment about falign-functions clang version requirement.

Changes since v3:
 - Test for compiler option with -falign-functions.
 - Make FUNCTION_ALIGNMENT depend on CC_HAS_FUNCTION_ALIGNMENT.
 - Set 16byte function alignment for x86 release builds.

Changes since v2:
 - Add Arm side.
 - Align end of section in the linker script to ensure enough padding for the
   last function.
 - Expand commit message and subject.
 - Rework Kconfig options.
 - Check that the compiler supports the option.

Changes since v1:
 - New in this version.
---
 xen/Kconfig              | 21 +++++++++++++++++++++
 xen/Makefile             |  3 +++
 xen/arch/arm/livepatch.c |  2 ++
 xen/arch/arm/xen.lds.S   |  4 ++++
 xen/arch/x86/Kconfig     |  1 +
 xen/arch/x86/livepatch.c |  4 ++++
 xen/arch/x86/xen.lds.S   |  4 ++++
 xen/common/Kconfig       |  5 ++++-
 8 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 134e6e68ad84..feb5fa5ecb0a 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -37,6 +37,27 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
 config CC_SPLIT_SECTIONS
 	bool
 
+# Set function alignment.
+#
+# Allow setting on a boolean basis, and then convert such selection to an
+# integer for the build system and code to consume more easily.
+#
+# Requires clang >= 7.0.0
+config CC_HAS_FUNCTION_ALIGNMENT
+	def_bool $(cc-option,-falign-functions)
+config FUNCTION_ALIGNMENT_4B
+	bool
+config FUNCTION_ALIGNMENT_8B
+	bool
+config FUNCTION_ALIGNMENT_16B
+	bool
+config FUNCTION_ALIGNMENT
+	int
+	depends on CC_HAS_FUNCTION_ALIGNMENT
+	default 16 if FUNCTION_ALIGNMENT_16B
+	default  8 if  FUNCTION_ALIGNMENT_8B
+	default  4 if  FUNCTION_ALIGNMENT_4B
+
 source "arch/$(SRCARCH)/Kconfig"
 
 config DEFCONFIG_LIST
diff --git a/xen/Makefile b/xen/Makefile
index 21832d640225..162cb2bda1c5 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -390,6 +390,9 @@ CFLAGS += -fomit-frame-pointer
 endif
 
 CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
+ifdef CONFIG_FUNCTION_ALIGNMENT
+CFLAGS += -falign-functions=$(CONFIG_FUNCTION_ALIGNMENT)
+endif
 
 CFLAGS += -nostdinc -fno-builtin -fno-common
 CFLAGS += -Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith
diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
index bbca1e5a5ed3..aa8ae8c38d28 100644
--- a/xen/arch/arm/livepatch.c
+++ b/xen/arch/arm/livepatch.c
@@ -68,6 +68,8 @@ void arch_livepatch_revive(void)
 
 int arch_livepatch_verify_func(const struct livepatch_func *func)
 {
+    BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE > CONFIG_FUNCTION_ALIGNMENT);
+
     /* If NOPing only do up to maximum amount we can put in the ->opaque. */
     if ( !func->new_addr && (func->new_size > LIVEPATCH_OPAQUE_SIZE ||
          func->new_size % ARCH_PATCH_INSN_SIZE) )
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 59b80d122fd0..afaf1e996b0e 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -44,6 +44,10 @@ SECTIONS
 #ifdef CONFIG_CC_SPLIT_SECTIONS
        *(.text.*)
 #endif
+#ifdef CONFIG_FUNCTION_ALIGNMENT
+       /* Ensure enough distance with the next placed section. */
+       . = ALIGN(CONFIG_FUNCTION_ALIGNMENT);
+#endif
 
        *(.fixup)
        *(.gnu.warning)
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 1acdffc51c22..0cd741be5b6f 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -29,6 +29,7 @@ config X86
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
+	select FUNCTION_ALIGNMENT_16B if !DEBUG
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index ee539f001b73..b00ad7120da9 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -109,6 +109,10 @@ int arch_livepatch_verify_func(const struct livepatch_func *func)
          */
         uint8_t needed = ARCH_PATCH_INSN_SIZE;
 
+        BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE +
+                     (IS_ENABLED(CONIFG_XEN_IBT) ? ENDBR64_LEN : 0) >
+                     CONFIG_FUNCTION_ALIGNMENT);
+
         if ( is_endbr64(func->old_addr) || is_endbr64_poison(func->old_addr) )
             needed += ENDBR64_LEN;
 
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 8930e14fc40e..5b3332300d44 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -99,6 +99,10 @@ SECTIONS
        *(.text)
 #ifdef CONFIG_CC_SPLIT_SECTIONS
        *(.text.*)
+#endif
+#ifdef CONFIG_FUNCTION_ALIGNMENT
+       /* Ensure enough distance with the next placed section. */
+       . = ALIGN(CONFIG_FUNCTION_ALIGNMENT);
 #endif
        *(.text.__x86_indirect_thunk_*)
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 310ad4229cdf..c9a21c3c8a07 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -395,8 +395,11 @@ config CRYPTO
 config LIVEPATCH
 	bool "Live patching support"
 	default X86
-	depends on "$(XEN_HAS_BUILD_ID)" = "y"
+	depends on "$(XEN_HAS_BUILD_ID)" = "y" && CC_HAS_FUNCTION_ALIGNMENT
 	select CC_SPLIT_SECTIONS
+	select FUNCTION_ALIGNMENT_16B if XEN_IBT
+	select FUNCTION_ALIGNMENT_8B  if X86
+	select FUNCTION_ALIGNMENT_4B
 	---help---
 	  Allows a running Xen hypervisor to be dynamically patched using
 	  binary patches without rebooting. This is primarily used to binarily
-- 
2.43.0


