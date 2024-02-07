Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A230B84CD67
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 15:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677723.1054526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjLP-0006xx-QN; Wed, 07 Feb 2024 14:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677723.1054526; Wed, 07 Feb 2024 14:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjLP-0006w6-Mw; Wed, 07 Feb 2024 14:56:11 +0000
Received: by outflank-mailman (input) for mailman id 677723;
 Wed, 07 Feb 2024 14:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvxy=JQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rXjLO-0006gr-ES
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 14:56:10 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07532507-c5c9-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 15:56:09 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a30f7c9574eso100317366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 06:56:09 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 y13-20020a170906070d00b00a386a32a9d9sm834614ejb.194.2024.02.07.06.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 06:56:08 -0800 (PST)
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
X-Inumbo-ID: 07532507-c5c9-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707317768; x=1707922568; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvhvJ0mk4ckYFEcAiyKPBpKqoDXebryxKX/EJIJcbn4=;
        b=g6B46dlfp7q0nunTllR8NB5f4f3IRonaTzlX53W1RlNhcEIWLz90iDqNiMpBJMqNgQ
         S1NC4U6I9d0nmcVIHR5U3fE13l1ff/p+sv+q8FkgtAc6dOXaovzTjTQM7MRXTSk0rfvE
         iIFLzs5U4vHcVK1NsdIHF7Nhr8GbOPh6WFXSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707317768; x=1707922568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvhvJ0mk4ckYFEcAiyKPBpKqoDXebryxKX/EJIJcbn4=;
        b=qNHXlDGViVIHBNMFpfNtvHiRsr4T/ia41xI7GyXmIGasd1S6kUgp+y+ZFICbXi4IbL
         2BTsGbKJMu9UD7fm9h2tGmN33MPPgD+6rVR/5+E28AyqIX035h/gdvd1RNxttGkefNVb
         44I3zjU+8yDCgDowFGuzefL4BpP/ZUffhOO48DBFwz4ApOkKjBueJJo2KLwup4xU46u/
         g9N8zAuG1tx3kvxLhFlY2eQWFgTtDUAJIHIZxMJ/v3FHrXL9KhtfQaCHF+DbRCu33iO8
         Q4xE5gUBkWBCX5tA91OwpQHjsz9ZiQNNGkhRaEnHb6l2IpyNuux5B7rDuVs2tq+lLEt4
         dB2w==
X-Gm-Message-State: AOJu0YwkxDK+Z6liLxr2KKaQqxZEM0iZ6DommNGqhvz+dikyCI3FErVH
	IV8s5TmgYtmLtKc0XEw+2nWA25lo5ATni5HQ8s+BaoHEIxxtNi3hxPVuZ2ZMYc9vtydv4FBC9kP
	+
X-Google-Smtp-Source: AGHT+IEf//jnO6+wwgVwFq/WbrfkwQt0EVuxuJU/7OLvjKJPip3WS7InnQyd8gBn9YlqnI5vxEk4Nw==
X-Received: by 2002:a17:906:cc1:b0:a38:5c3c:9d1e with SMTP id l1-20020a1709060cc100b00a385c3c9d1emr1744877ejh.18.1707317768593;
        Wed, 07 Feb 2024 06:56:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtnfQ4fJ1r4TYx1lFl0J8JNHk10d6cWkSfoq5n/yZRh5p5FxCnDmCFAljj8VyeWsf1vl9b16Ni+7hOCHfm/OaCfd/2bDdIpCQ+3V7O+jfokzkfiST9xH5EBMQJh3/mtrtR4PC0tXSJ/9VQzFrIg8e+BDzDEoVUbXXo6CFax+lo7fwEgCXwmOSpOMkHD2tIaTU8uSwQvg/V0vI7REPXfqnIX6WCoZmKZ0CUzfDx3nN56R6Br1EJU3WByChBz7um5utykJgmp0PqzD4r5WI/Nis9yyh/8ymQkgLQiThHwDBqKthf+cpgh6zNTwGv1shcC6SJx3dKft3Y63g49diiN2ZR05QOFfZCwn3pqQEdtIo78ydvw50BUmLlJDw0rWsn+tgTZt4gZEf08HetDF9UhjMZS7rOT38bQIq9mzHHRE2BN4ARc6kXqKmUZ+NFQqMIhvq5aZ1keLiDIbbpfmuYqgG+nrI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 1/3] xen: introduce Kconfig function alignment option
Date: Wed,  7 Feb 2024 15:55:45 +0100
Message-ID: <20240207145547.89689-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207145547.89689-1-roger.pau@citrix.com>
References: <20240207145547.89689-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

And use it to replace CODE_ALIGN in assembly.  This allows to generalize the
way the code alignment gets set across all architectures.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v5:
 - New in this version.
---
 xen/Kconfig                         | 17 +++++++++++++++++
 xen/arch/arm/Kconfig                |  1 +
 xen/arch/arm/include/asm/config.h   |  3 +--
 xen/arch/ppc/Kconfig                |  1 +
 xen/arch/ppc/include/asm/config.h   |  3 ---
 xen/arch/riscv/Kconfig              |  1 +
 xen/arch/riscv/include/asm/config.h |  1 -
 xen/arch/x86/Kconfig                |  1 +
 xen/arch/x86/include/asm/config.h   |  3 +--
 xen/include/xen/linkage.h           |  5 +++--
 10 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 134e6e68ad84..1e1b041fd52f 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -37,6 +37,23 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
 config CC_SPLIT_SECTIONS
 	bool
 
+# Set code alignment.
+#
+# Allow setting on a boolean basis, and then convert such selection to an
+# integer for the build system and code to consume more easily.
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
+	default  0
+
 source "arch/$(SRCARCH)/Kconfig"
 
 config DEFCONFIG_LIST
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 50e9bfae1ac8..80fb5b14f04e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -16,6 +16,7 @@ config ARM
 	select HAS_PASSTHROUGH
 	select HAS_UBSAN
 	select IOMMU_FORCE_PT_SHARE
+	select FUNCTION_ALIGNMENT_4B
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 3b6d829197a4..a2e22b659d53 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -53,8 +53,7 @@
 
 /* Linkage for ARM */
 #ifdef __ASSEMBLY__
-#define CODE_ALIGN 4
-#define ALIGN .balign CODE_ALIGN
+#define ALIGN .balign CONFIG_FUNCTION_ALIGNMENT
 #define ENTRY(name)                             \
   .globl name;                                  \
   ALIGN;                                        \
diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
index ab116ffb2a70..6b3b2bb95f56 100644
--- a/xen/arch/ppc/Kconfig
+++ b/xen/arch/ppc/Kconfig
@@ -1,6 +1,7 @@
 config PPC
 	def_bool y
 	select HAS_DEVICE_TREE
+	select FUNCTION_ALIGNMENT_4B
 
 config PPC64
 	def_bool y
diff --git a/xen/arch/ppc/include/asm/config.h b/xen/arch/ppc/include/asm/config.h
index e5d201e16c50..e0a0abfeb408 100644
--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -31,9 +31,6 @@
 #define INVALID_VCPU_ID MAX_VIRT_CPUS
 
 /* Linkage for PPC */
-#ifdef __ASSEMBLY__
-#define CODE_ALIGN 4
-#endif
 
 #define XEN_VIRT_START _AC(0xc000000000000000, UL)
 
diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index f382b36f6c82..b4b354a7786e 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -1,5 +1,6 @@
 config RISCV
 	def_bool y
+	select FUNCTION_ALIGNMENT_16B
 
 config RISCV_64
 	def_bool y
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index a80cdd4f857c..99ea5635208b 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -69,7 +69,6 @@
 
 /* Linkage for RISCV */
 #ifdef __ASSEMBLY__
-#define CODE_ALIGN 16
 #define CODE_FILL /* empty */
 #endif
 
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 1acdffc51c22..3dd8f18b46ef 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -29,6 +29,7 @@ config X86
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
+	select FUNCTION_ALIGNMENT_16B
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 660246d1dae5..ab7288cb3682 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -43,9 +43,8 @@
 
 /* Linkage for x86 */
 #ifdef __ASSEMBLY__
-#define CODE_ALIGN 16
 #define CODE_FILL 0x90
-#define ALIGN .align CODE_ALIGN, CODE_FILL
+#define ALIGN .align CONFIG_FUNCTION_ALIGNMENT, CODE_FILL
 #define ENTRY(name)                             \
   ALIGN;                                        \
   GLOBAL(name)
diff --git a/xen/include/xen/linkage.h b/xen/include/xen/linkage.h
index 0997e16810b2..770ae49963b8 100644
--- a/xen/include/xen/linkage.h
+++ b/xen/include/xen/linkage.h
@@ -41,9 +41,10 @@
  */
 #define count_args_exp(args...) count_args(args)
 #if count_args_exp(CODE_FILL)
-# define DO_CODE_ALIGN(align...) LASTARG(CODE_ALIGN, ## align), CODE_FILL
+# define DO_CODE_ALIGN(align...) LASTARG(CONFIG_FUNCTION_ALIGNMENT, ## align), \
+                                 CODE_FILL
 #else
-# define DO_CODE_ALIGN(align...) LASTARG(CODE_ALIGN, ## align)
+# define DO_CODE_ALIGN(align...) LASTARG(CONFIG_FUNCTION_ALIGNMENT, ## align)
 #endif
 
 #define FUNC(name, align...) \
-- 
2.43.0


