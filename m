Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3D884CD69
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 15:56:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677725.1054546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjLS-0007UX-Ag; Wed, 07 Feb 2024 14:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677725.1054546; Wed, 07 Feb 2024 14:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjLS-0007RU-65; Wed, 07 Feb 2024 14:56:14 +0000
Received: by outflank-mailman (input) for mailman id 677725;
 Wed, 07 Feb 2024 14:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvxy=JQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rXjLQ-0006gr-VN
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 14:56:12 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08e3c0cd-c5c9-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 15:56:12 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-511531f03f6so895010e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 06:56:12 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 tb21-20020a1709078b9500b00a380a1ee2b0sm840342ejc.25.2024.02.07.06.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 06:56:10 -0800 (PST)
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
X-Inumbo-ID: 08e3c0cd-c5c9-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707317771; x=1707922571; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ed76aC18yY98YVZXZt7AsqWqpjS5eaKS4tBHEoatpQ=;
        b=ffgy3MgAIwcB4+vvmMZL30pvZFqJ2ua4eoco8+OCeuirQid7bs9n4JkBX+p67QxzIi
         yKvKM2BDgOAYPLP2j+CQA48J0qRjoZXFeJ0ZSZ9NIG5fPlBbqxkhxadXDGe7cRviqbVd
         Tc+rLC06Fz1E516rLfOAY3EkTY7VWnhdEr3dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707317771; x=1707922571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ed76aC18yY98YVZXZt7AsqWqpjS5eaKS4tBHEoatpQ=;
        b=gqkeeJqiYkIO8bldNb2bSrb/Z0H8Y1wTwOtYk0/6D/4f8H5YMh8tj8zUCjFTucqpEm
         gmiOE3pwJfHPN4xo1jV2XG6lZLfBWkuW7f7nqw5bhPqkHnrp70OWvx9odoiN/6+bNFba
         pT/RaxPELe5IYK8e9XORp0HCsx31vEy64niHmwAlA1MykJuxoUhb2RAOJlfq+tI6s4Nn
         Ls7zjj7cKyUNipDKY74gNZtIeLrVKxmT12UFC+IDBqJS4QFy9dyu2dk4AVr37SXJIA1p
         b2q3EraLA0jzcscxUCiAsPprbBvrsFwxNvhGUxW8LItJWNBxU5cof4rFzrmFN8Yod0q+
         /AOQ==
X-Gm-Message-State: AOJu0YyHovjPoU62jeVyUrQZk8amfhdlIXTlXVGClBg75yq9ZsJDZNCI
	1RsYSyBkirGB3aa1zVoiDiAwSXqmtKq79zGjAISKHUd3CE+ZIML9XYbwyEyjAX/IeMvguJ2TlNq
	j
X-Google-Smtp-Source: AGHT+IFjeD8qDT4xiVr2PUwhzlFFk5FQqMJQTzmBOSuqXkY85fRKeoE9V31qv2BMZZ3sUhl7/cnDgQ==
X-Received: by 2002:a05:6512:64:b0:511:32cc:1c4c with SMTP id i4-20020a056512006400b0051132cc1c4cmr4090745lfo.40.1707317771143;
        Wed, 07 Feb 2024 06:56:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWZDc68kXxHbMNCiBjGEn/a0QM3LIn8rfYvRUQUi478C0UQqxSFN/K6AnPu1utTjEZmyXBs3qYeNFZSI7mn0fqdTkFnxCYLLJYmgFbSbdFQl0ic0LQoaALVUDGoWngQPjWDi+vKi019BuUPLzADdEX3+5oyjBA3pwz3/jqOTaKUq/tQjAdxY9WM+vLvrDtGvXPtDYc4XLRciPOXtNqEzcYVEcirEx5ueeXM+VMEcxha4hhp7TQfVuHoH2OcHGO9D9zGMdDWTb1EpuwXe4CFR5YxlbZrDTt4zOjr4XYXsY/99oH7YjUgI9Vi40MJyk3eZm2wcHJOTR81mGIbajLbX0iY02r5Pk3vxwB4dvW6CUegfJISvC4QMt3cetooXA1/Qn+5ns6RQH3fpZQnLik5g7llzi4ve2vMqAteT56qVl4JoOyr94FjXjy30YTh56Hoe60wp/wbBUkxNwF8DNs7ohgW4JT3iteWCChBm288x8oPy3ea/+skvN7auSrTHns+FDOtH8OmFXenfIAqT/es0zW/xEESneQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 3/3] xen/livepatch: align functions to ensure minimal distance between entry points
Date: Wed,  7 Feb 2024 15:55:47 +0100
Message-ID: <20240207145547.89689-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207145547.89689-1-roger.pau@citrix.com>
References: <20240207145547.89689-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The minimal function size requirements for an x86 livepatch are either 5 bytes
(for jmp) or 9 bytes (for endbr + jmp), and always 4 bytes on Arm.  Ensure that
distance between functions entry points is always at least of the minimal
required size for livepatch instruction replacement to be successful.

Add an additional align directive to the linker scripts, in order to ensure that
the next section placed after the .text.* (per-function sections) is also
aligned to the required boundary, so that the distance of the last function
entry point with the next symbol is also of minimal size.

Note that livepatch-build-tools will take into account each per-function
section alignment in order to decide whether there's enough padding.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v5:
 - Split chunks into pre-patches to make review easier.

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
 xen/arch/arm/livepatch.c | 2 ++
 xen/arch/arm/xen.lds.S   | 4 ++++
 xen/arch/ppc/xen.lds.S   | 4 ++++
 xen/arch/riscv/xen.lds.S | 4 ++++
 xen/arch/x86/livepatch.c | 4 ++++
 xen/arch/x86/xen.lds.S   | 4 ++++
 xen/common/Kconfig       | 5 ++++-
 7 files changed, 26 insertions(+), 1 deletion(-)

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
index 470c8f22084f..0126a3afae53 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -46,6 +46,10 @@ SECTIONS
 #ifdef CONFIG_CC_SPLIT_SECTIONS
        *(.text.*)
 #endif
+#ifdef CONFIG_LIVEPATCH
+       /* Ensure enough distance with the next placed section. */
+       . = ALIGN(CONFIG_FUNCTION_ALIGNMENT);
+#endif
 
        *(.fixup)
        *(.gnu.warning)
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 030e1ee37b55..f300c03a666f 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -32,6 +32,10 @@ SECTIONS
 #ifdef CONFIG_CC_SPLIT_SECTIONS
         *(.text.*)
 #endif
+#ifdef CONFIG_LIVEPATCH
+       /* Ensure enough distance with the next placed section. */
+       . = ALIGN(CONFIG_FUNCTION_ALIGNMENT);
+#endif
 
         *(.fixup)
         *(.gnu.warning)
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 8510a87c4d06..1fb9af11c1cc 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -27,6 +27,10 @@ SECTIONS
 #ifdef CONFIG_CC_SPLIT_SECTIONS
         *(.text.*)
 #endif
+#ifdef CONFIG_LIVEPATCH
+       /* Ensure enough distance with the next placed section. */
+       . = ALIGN(CONFIG_FUNCTION_ALIGNMENT);
+#endif
 
         . = ALIGN(IDENT_AREA_SIZE);
         _ident_start = .;
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
index 8930e14fc40e..6649bc16dc48 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -101,6 +101,10 @@ SECTIONS
        *(.text.*)
 #endif
        *(.text.__x86_indirect_thunk_*)
+#ifdef CONFIG_LIVEPATCH
+       /* Ensure enough distance with the next placed section. */
+       . = ALIGN(CONFIG_FUNCTION_ALIGNMENT);
+#endif
 
        *(.fixup)
        *(.gnu.warning)
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 310ad4229cdf..63fba175c99f 100644
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
+	select FUNCTION_ALIGNMENT_4B  if ARM
 	---help---
 	  Allows a running Xen hypervisor to be dynamically patched using
 	  binary patches without rebooting. This is primarily used to binarily
-- 
2.43.0


