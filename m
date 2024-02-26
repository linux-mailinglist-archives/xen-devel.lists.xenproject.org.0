Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A1E867F53
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685754.1067043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ref8y-0006ng-SF; Mon, 26 Feb 2024 17:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685754.1067043; Mon, 26 Feb 2024 17:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ref8y-0006kw-OV; Mon, 26 Feb 2024 17:52:00 +0000
Received: by outflank-mailman (input) for mailman id 685754;
 Mon, 26 Feb 2024 17:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewx-0007o5-Sk
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:35 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00810cc9-d4ce-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:33 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d180d6bd32so49108011fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:33 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:31 -0800 (PST)
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
X-Inumbo-ID: 00810cc9-d4ce-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969172; x=1709573972; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCwX2BCVLI3lXZG2aWqhyu9yA4jHT6KSlCqY/yiMy5E=;
        b=K/kySB9bH365FzkmKtciJtjl/bChluXtD5NzaZUBJOnrbnsA13m1v/u0lm3yFwmVdT
         cI8MzwEZDkBcSS2shR7UwfxYY2iilMxrx4aegYCn1sIJRU9Nt9y/sAYAE/DT6G/FJxyX
         pVryFglifIHpUKh2cioHqHHS2KCPgZHxxuCAHwUZ8a9oGoQQ562d3kGLcddz5otTujyZ
         mYamKUxar86TzD4ESrMbBgSNrnvaPxcnJ1PkaTWAH1VvrJQsnnABpQDBVvlDZs4xcHtY
         R/m6BRuoufVY6/fDHvzmkfVT+zu8HrZF5RAnmtP5uxCOD/Bbq13a5/AqZvGVL+bE6h2/
         AxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969172; x=1709573972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCwX2BCVLI3lXZG2aWqhyu9yA4jHT6KSlCqY/yiMy5E=;
        b=XWQrz3KhfBvE03ETxFDFUqPzOUAaN1RM7/vEGftFCc3VO/KSdOv8iEvdS5F6p/orft
         NAD/sONDJT8RnE8Zh8e0XM0004OH4V9HLH4dfEsG0DA+3G1VApTZd+07AUGrZMUKTC1F
         Sf7vw4jVNhO9zFCMOg5ihq+EyMGxs+vr8k0EpmGtpd86eG4gvPV98gzw+28xFcEBhWi1
         GH4pxjKEEtTO7UXbJeV+yAiq7rYc5jdve0TsW+9SCCeDW/e9R7WJgiuMbasXo1xfuUk+
         DDpsbAa5vQRlIC3baJWA4F7b/VtHYs5Mlguiq9WwnANhBPoSQHj2KWbrRJYuJeGAswos
         jc0g==
X-Gm-Message-State: AOJu0YzJs+LhGhInKPNcXf1m+Hj9/1DkmFYaCsXsKvwZs6D27Sq+czz2
	74QCbwnSYvKhzbIh2S7Xq+SriFeUzG9yX+tQBPluqjg98H/qhytkx05lWfSX
X-Google-Smtp-Source: AGHT+IEahFH9d60CghpPN5UMUuIMNVwUJdv5YNlsA9M0tIHLvik4uJbaD6X9+1X5KU3flXH9J58e1g==
X-Received: by 2002:a05:651c:2019:b0:2d2:29c2:e7ea with SMTP id s25-20020a05651c201900b002d229c2e7eamr4101847ljo.24.1708969172528;
        Mon, 26 Feb 2024 09:39:32 -0800 (PST)
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
Subject: [PATCH v5 18/23] xen/riscv: add minimal stuff to processor.h to build full Xen
Date: Mon, 26 Feb 2024 18:39:00 +0100
Message-ID: <4e1ee99a9ad71015b5e8860d20b63337b526d0e9.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - Code style fixes.
 - drop introduced TOOLCHAIN_HAS_ZIHINTPAUSE and use as-insn instead and use
   as-insn istead.
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
 xen/arch/riscv/arch.mk                 |  8 +++++++-
 xen/arch/riscv/include/asm/processor.h | 23 +++++++++++++++++++++++
 3 files changed, 38 insertions(+), 1 deletion(-)
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
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 8403f96b6f..fabe323ec5 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -5,6 +5,12 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
 CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
 
+ifeq ($(CONFIG_RISCV_64),y)
+has_zihintpause = $(call as-insn,$(CC) -mabi=lp64 -march=rv64i_zihintpause, "pause",_zihintpause,)
+else
+has_zihintpause = $(call as-insn,$(CC) -mabi=ilp32 -march=rv32i_zihintpause, "pause",_zihintpause,)
+endif
+
 riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
 riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 
@@ -12,7 +18,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 # into the upper half _or_ the lower half of the address space.
 # -mcmodel=medlow would force Xen into the lower half.
 
-CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
+CFLAGS += -march=$(riscv-march-y)$(has_zihintpause) -mstrict-align -mcmodel=medany
 
 # TODO: Drop override when more of the build is working
 override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 6db681d805..b96af07660 100644
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
+    __asm__ __volatile__ ( "pause" );
+#else
+    /* Encoding of the pause instruction */
+    __asm__ __volatile__ ( ".insn 0x100000F" );
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


