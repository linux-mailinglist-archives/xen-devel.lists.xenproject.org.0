Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5005C849E80
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:38:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676261.1052388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX12b-0002lN-5b; Mon, 05 Feb 2024 15:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676261.1052388; Mon, 05 Feb 2024 15:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX12b-0002fR-1l; Mon, 05 Feb 2024 15:37:49 +0000
Received: by outflank-mailman (input) for mailman id 676261;
 Mon, 05 Feb 2024 15:37:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0y5-0007I6-SU
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:09 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc634284-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:33:07 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51032e62171so7141623e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:33:07 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:33:06 -0800 (PST)
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
X-Inumbo-ID: dc634284-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147187; x=1707751987; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7brBIk5MysXO16VnJHkZ93Jfj50NOxcYHO448pB7ag=;
        b=fe7mh46Xyrq6i5QD/11j0xHs6PptfKuUnHsugcVOR24T8My0RU6nizwVVfpUmoSeuB
         BtlOBnH0vwhS7UGJ3+L5txy7u+qSJk3Ml5VCiZhYOJMDqB9S+A273YFRdkipHwRqmF8Y
         yeDU9USZ7PkhFHK7qE3NN/Z+X9f7g+CZ7nNUg+8PGyL+80HMAgCmuqrBp+gct02QK8PU
         82K5eKj2PmhRdBAp0TQIWVXqutytQiLXvAO9HoXLiPs+hezQaS9j4C8g9Oxs8lqlNYIs
         GLcUQgTNQ5zYADs2limQ4nc2DOCedsh/dXt1Tl9wIeXgqkbYODOF2ZjYzzaZRUsHM155
         nAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147187; x=1707751987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7brBIk5MysXO16VnJHkZ93Jfj50NOxcYHO448pB7ag=;
        b=aJcnTHL5sWYe/8UecIKtGFMG8mxX3/x0NcWx7VS9BZi4lCfxG4rWtaSzfj8U36ie9y
         UzYyVT+73H5wGcSUxG+3XXRhxWR4tC+YN1e/KCscHN6i5kVOJrBGi8gRR9MpxGYQwFwz
         B1DNiiK6N+zolfoPvwTDDRkAu/xO+p7LJVLqfidYsrCyKUb2e9QgEbvhs1jOqvnTpO1U
         PHYs5pTbWk5V7rQOyUa4WCl2VfF2T54XT7Hy3rUBbj6LukxZ8yYUTN0DOkIHOvT3jsUn
         aom12p80kNlW6J5akE8WXP+Lg1NuFBJGdZgnA6wAAORIUSQy4ZBmq103ESMGobB/Du6S
         lrKg==
X-Gm-Message-State: AOJu0Yz7njnfImFwMreJ1YfbpeAf1AmGZhWww3OKc/RpChQHu7Oz+f4x
	sp/y/mB3uL7bKseEpk8UhPEQX5o4YnCZThiRPBBXCrbrBPE2eMfAY4PhlE+Y
X-Google-Smtp-Source: AGHT+IGrGY9dXD4pPSfu5iE7VQQMzy81yEw7tzqQsibUYMqVTWoJSX/R/n24juQ1uTbrQLCHkrNi3g==
X-Received: by 2002:a05:6512:3086:b0:511:454e:6032 with SMTP id z6-20020a056512308600b00511454e6032mr4547401lfd.63.1707147186804;
        Mon, 05 Feb 2024 07:33:06 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUT+G1Wcy19fjqdydwn2cz2uc6BFNnClMwDyYcDUt+dwrwULDfpu8oNQtWL8YSKKi/bKFdRjSwkuwwTZhKqIZaAj4pDC2SBZV9QaTgxjIoftws95qEgJRbT5lUE03IuwsGmtpcz2OmfMTONKVvAFGAebyQxIb1JBflv9bp8sFFAqwo+zxVPdF++r6lqnP8gZDIp2tPHo1OlDLVPqATrhfUHJiZWNDtiMheV/UIQJ3fSIQTWubpWHBVP192SZGVd3EbuClbVhRcSQnRCeKHqwO4nbNu+I4nVJQcV0Ag52861SIc4S+9w2FE5k1/0qnbdtmAbvVZX
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 25/30] xen/riscv: add minimal stuff to processor.h to build full Xen
Date: Mon,  5 Feb 2024 16:32:32 +0100
Message-ID: <9efbc232f64b6192cf83f865b8987846fe082720.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Change message -> subject in "Changes in V3"
 - Documentation about system requirement was added. In the future, it can be checked if the extension is supported
   by system __riscv_isa_extension_available() ( https://gitlab.com/xen-project/people/olkur/xen/-/commit/737998e89ed305eb92059300c374dfa53d2143fa )
 - update cpu_relax() function to check if __riscv_zihintpause is supported by a toolchain
 - add conditional _zihintpause to -march if it is supported by a toolchain
Changes in V3:
 - update the commit subject
 - rename get_processor_id to smp_processor_id
 - code style fixes
 - update the cpu_relax instruction: use pause instruction instead of div %0, %0, zero
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 docs/misc/riscv/booting.txt            |  8 ++++++++
 xen/arch/riscv/Kconfig                 |  7 +++++++
 xen/arch/riscv/arch.mk                 |  1 +
 xen/arch/riscv/include/asm/processor.h | 23 +++++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 docs/misc/riscv/booting.txt

diff --git a/docs/misc/riscv/booting.txt b/docs/misc/riscv/booting.txt
new file mode 100644
index 0000000000..38fad74956
--- /dev/null
+++ b/docs/misc/riscv/booting.txt
@@ -0,0 +1,8 @@
+System requirements
+===================
+
+The following extensions are expected to be supported by a system on which
+Xen is run:
+- Zihintpause:
+  On a system that doesn't have this extension, cpu_relax() should be
+  implemented properly. Otherwise, an illegal instruction exception will arise.
diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index f382b36f6c..383ce06771 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -45,6 +45,13 @@ config RISCV_ISA_C
 
 	  If unsure, say Y.
 
+config TOOLCHAIN_HAS_ZIHINTPAUSE
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zihintpause)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zihintpause)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23600
+
 endmenu
 
 source "common/Kconfig"
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 8403f96b6f..a4b53adaf7 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -7,6 +7,7 @@ CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
 
 riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
 riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 
 # Note that -mcmodel=medany is used so that Xen can be mapped
 # into the upper half _or_ the lower half of the address space.
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 6db681d805..289dc35ea0 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -12,6 +12,9 @@
 
 #ifndef __ASSEMBLY__
 
+/* TODO: need to be implemeted */
+#define smp_processor_id() 0
+
 /* On stack VCPU state */
 struct cpu_user_regs
 {
@@ -53,6 +56,26 @@ struct cpu_user_regs
     unsigned long pregs;
 };
 
+/* TODO: need to implement */
+#define cpu_to_core(cpu)   (0)
+#define cpu_to_socket(cpu) (0)
+
+static inline void cpu_relax(void)
+{
+#ifdef __riscv_zihintpause
+    /*
+     * Reduce instruction retirement.
+     * This assumes the PC changes.
+     */
+    __asm__ __volatile__ ("pause");
+#else
+    /* Encoding of the pause instruction */
+    __asm__ __volatile__ (".insn 0x100000F");
+#endif
+
+    barrier();
+}
+
 static inline void wfi(void)
 {
     __asm__ __volatile__ ("wfi");
-- 
2.43.0


