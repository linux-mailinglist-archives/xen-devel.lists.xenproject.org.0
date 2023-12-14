Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EEB812CBF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 11:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654401.1021294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDimo-0006UP-DL; Thu, 14 Dec 2023 10:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654401.1021294; Thu, 14 Dec 2023 10:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDimo-0006Sh-6z; Thu, 14 Dec 2023 10:17:46 +0000
Received: by outflank-mailman (input) for mailman id 654401;
 Thu, 14 Dec 2023 10:17:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5bz=HZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDimm-0006DQ-81
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 10:17:44 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0456ce13-9a6a-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 11:17:42 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c9f72176cfso100225831fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 02:17:42 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 c12-20020a5d4f0c000000b00336442b3e80sm2272336wru.78.2023.12.14.02.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 02:17:41 -0800 (PST)
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
X-Inumbo-ID: 0456ce13-9a6a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702549061; x=1703153861; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//Q5HEM9v4eB3FhFejuA6Not40HTXEnc+em45fT0PEw=;
        b=CWLTEgAMiiQeDr0q8hQp6SCUU4SVcM2OiD4aS/lHmwyFZU8kAUuoXyIJ1EaigVYliQ
         QirpEurE96+QiAq7tdiSev08+vYouFh7Dsf8wGOOqUXpnIbXjUNbjbiCYZMcvfk8uw+f
         1mi65djX9Q06AnkVIKgOrtsSpU7Vd6rkOZnuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702549061; x=1703153861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//Q5HEM9v4eB3FhFejuA6Not40HTXEnc+em45fT0PEw=;
        b=ECV5QX5Swv4p1RZLya706V8boS5cRAEd2P7DikeNbWNyDjlK08+ay8G4ucXK/2cqLq
         4eDDFoExL5+JLAoJbCD1d+OrX79+vOPwHl1KjvUvzUx1w9oediMhAV/Ew/XXqDqWalVi
         6xKbk5gE9x+4u3x03Ec5BVYhZ6LM0ZEN2WTM9HqBb6SdyN20+AYB5DvDjaqFcjph3nr+
         5yvVnMSBHhEbLEXIL7mZiKUyasnHqrdIJfUj7ZZuQELNoHsxqAZCiP8LreTj8m75PrMx
         4631wDO3RcKBvUEm7Te+HImxqufSq5XPMtcL5RTyerEHQSbqVjwTTsK9xU1PP6NrCEZA
         1MDw==
X-Gm-Message-State: AOJu0YyeFnO2uHba1Wn709ORkP4hcbqFSRONzObLXtK6yrS1w6bHmRnU
	Z5srXrJlho03GXbB8CmWJZHr2qypM40gqivl6P0=
X-Google-Smtp-Source: AGHT+IHzTZTldeZBawBMC1DH1MAbS4NWQNJ/tz+riZfQmQhRnhpkb9+u9RhBmRNN8vQ1M4Q+sc5Bcw==
X-Received: by 2002:a05:651c:154b:b0:2cc:27f4:67dc with SMTP id y11-20020a05651c154b00b002cc27f467dcmr1597105ljp.48.1702549061345;
        Thu, 14 Dec 2023 02:17:41 -0800 (PST)
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
Subject: [PATCH v3 1/4] x86/livepatch: align functions to ensure minimal distance between entry points
Date: Thu, 14 Dec 2023 11:17:16 +0100
Message-ID: <20231214101719.18770-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214101719.18770-1-roger.pau@citrix.com>
References: <20231214101719.18770-1-roger.pau@citrix.com>
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
the minimum required for livepatch to work is present.

The compiler option -falign-functions is not available on at least clang 3.8,
so introduce a Kconfig check for it and make the livepatch option depend on the
compiler supporting the option.

The naming of the option(s) CONFIG_FUNCTION_ALIGNMENT is explicitly not
mentioning CC in preparation for the option also being used by assembly code.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
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
 xen/Kconfig              | 18 ++++++++++++++++++
 xen/Makefile             |  3 +++
 xen/arch/arm/livepatch.c |  2 ++
 xen/arch/arm/xen.lds.S   |  4 ++++
 xen/arch/x86/livepatch.c |  4 ++++
 xen/arch/x86/xen.lds.S   |  4 ++++
 xen/common/Kconfig       |  5 ++++-
 7 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 134e6e68ad84..7a61e130771c 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -37,6 +37,24 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
 config CC_SPLIT_SECTIONS
 	bool
 
+# Set function alignment.
+#
+# Allow setting on a boolean basis, and then convert such selection to an
+# integer for the build system and code to consume more easily.
+config CC_HAS_FUNCTION_ALIGNMENT
+	def_bool $(cc-option,-falign-functions=8)
+config FUNCTION_ALIGNMENT_4B
+	bool
+config FUNCTION_ALIGNMENT_8B
+	bool
+config FUNCTION_ALIGNMENT_16B
+	bool
+config FUNCTION_ALIGNMENT
+	int
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


