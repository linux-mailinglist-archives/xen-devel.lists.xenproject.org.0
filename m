Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F48146A7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 12:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655030.1022683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6DW-0002LI-7Y; Fri, 15 Dec 2023 11:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655030.1022683; Fri, 15 Dec 2023 11:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6DW-0002JY-4b; Fri, 15 Dec 2023 11:18:54 +0000
Received: by outflank-mailman (input) for mailman id 655030;
 Fri, 15 Dec 2023 11:18:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE6DU-00024C-Dj
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 11:18:52 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9b3ba33-9b3b-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 12:18:51 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33638e7f71aso269965f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 03:18:51 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 t6-20020a5d6906000000b003364c7a8f2csm2414842wru.60.2023.12.15.03.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 03:18:49 -0800 (PST)
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
X-Inumbo-ID: b9b3ba33-9b3b-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702639130; x=1703243930; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZC9Vxss+k2nEc+pnvf7NZ+INbsOVxJbzC5jLly5PWRM=;
        b=cIG0B2tXACsBh1SIt0wsXQQ5Ecw5r11Zn7lo6gZp6JF/jAVpo7zddcG0u+SZrIs5mF
         ykAKZJy1g7bb+8rv1K8ipAT/by7xy2vUfR/FTeni4RHcFRJroRB024LaibOHWa7xz2yx
         Xf50vQDIJrEB90CwgSgj0QRoL/mHqd48qciKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702639130; x=1703243930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC9Vxss+k2nEc+pnvf7NZ+INbsOVxJbzC5jLly5PWRM=;
        b=YbkEs2pNgDcPvrO8wO02ZVkwpuCwYnfrRuZ430q3PYFtGyydWDW6xdqBviqeu7FHf3
         +AuOz9rQ7xs0RK065R3kcmArnhZyTOx6pRFCXcDSF7zIBm/nIh2CrBsmjbw+iVs46lyL
         gmCCCJiYKs2F+YoUrLVkE436t1i6/gorsxdgQWCKeKxknF3CR3FaL8xJKmwhtYSX9DX3
         hvXGipnqxNdavdzXGcOx9RtKFbbYr/DVYTl0nt1u4IG35nT91LrudeDVgB5O5C/iMYTc
         5fqOiz1McfPt0JjVJLHCusUSTNlLM3z02uOu+6GdX2KvPAzdwh1vWE231bxd8Ki7qm0U
         gJkw==
X-Gm-Message-State: AOJu0Yzk4MZ2WDDiLjonSlu73CZVDdfRvsb0Erwk2qV2CiKKz1Wi2rcG
	LFuBWCu8JUQ0EJP9q9LlvGI3xx0D9YSELWr6TyQ=
X-Google-Smtp-Source: AGHT+IH0M+5D/QAwXYgxAkDN+ZljJ81WuOOU4uJQ0nLNU+3BWqfooFuQ8OidqkMHCnkLGDT3PC0FAA==
X-Received: by 2002:a5d:458c:0:b0:336:44f0:6427 with SMTP id p12-20020a5d458c000000b0033644f06427mr1507783wrq.28.1702639130458;
        Fri, 15 Dec 2023 03:18:50 -0800 (PST)
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
Subject: [PATCH v4 1/4] x86/livepatch: align functions to ensure minimal distance between entry points
Date: Fri, 15 Dec 2023 12:18:39 +0100
Message-ID: <20231215111842.8009-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215111842.8009-1-roger.pau@citrix.com>
References: <20231215111842.8009-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The minimal function size requirements for livepatch are either 5 bytes (for
jmp) or 9 bytes (for endbr + jmp) on x86, and always 4 bytes on Arm.  Ensure
that distance between functions entry points is always at least of the minimal
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

The compiler option -falign-functions is not available on at least clang 3.8,
so introduce a Kconfig check for it and make the livepatch option depend on the
compiler supporting the option.

The naming of the option(s) CONFIG_FUNCTION_ALIGNMENT is explicitly not
mentioning CC in preparation for the option also being used by assembly code.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
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
 xen/Kconfig              | 19 +++++++++++++++++++
 xen/Makefile             |  3 +++
 xen/arch/arm/livepatch.c |  2 ++
 xen/arch/arm/xen.lds.S   |  4 ++++
 xen/arch/x86/Kconfig     |  1 +
 xen/arch/x86/livepatch.c |  4 ++++
 xen/arch/x86/xen.lds.S   |  4 ++++
 xen/common/Kconfig       |  5 ++++-
 8 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 134e6e68ad84..c2cc3fe165eb 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -37,6 +37,25 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
 config CC_SPLIT_SECTIONS
 	bool
 
+# Set function alignment.
+#
+# Allow setting on a boolean basis, and then convert such selection to an
+# integer for the build system and code to consume more easily.
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


