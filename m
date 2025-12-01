Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822B1C96A27
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 11:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175651.1500279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ14y-0004L9-5b; Mon, 01 Dec 2025 10:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175651.1500279; Mon, 01 Dec 2025 10:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ14y-0004IE-1d; Mon, 01 Dec 2025 10:24:24 +0000
Received: by outflank-mailman (input) for mailman id 1175651;
 Mon, 01 Dec 2025 10:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tSLg=6H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vQ14w-00041l-UJ
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 10:24:22 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7155d20-ce9f-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 11:24:22 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-644fcafdce9so6322263a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 02:24:22 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647510508e1sm12104724a12.27.2025.12.01.02.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 02:24:20 -0800 (PST)
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
X-Inumbo-ID: e7155d20-ce9f-11f0-9d19-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764584661; x=1765189461; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/5qXPCww7DpyOeKc5W7T3oZxeoVMBH7UuUZDrfemqE=;
        b=Z+HYFSTYsE29amSMV37ZLmgpDfuAcll5PfoSEa13APGB3tmj6magZISfgc95kfA7/1
         NYulz22kA36sxYWxVUvGQ+joKDN/lOInMbAOX7SOmeoz5RLjBme9Tl709vLny2LgPtmj
         Co0D07gNk+kN1LOG8VSyQp939QUnAxbKNrl7CCQ93XwcOnQktK6GoDtlmX0RDcBXKze9
         EnDDu+MbiuedHwjcEhp0DrVZkQoN2hX4RHKE/ZKlvRc4AlVQaD60XjwbJObLrXPOzbCM
         dfGxBZiR/rivysntjGBj/9swbcxk3FqCiDCpeVHgGE9wfcwFVYEOMMchWlJ4cz4B3p8l
         xWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584661; x=1765189461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5/5qXPCww7DpyOeKc5W7T3oZxeoVMBH7UuUZDrfemqE=;
        b=uqq6qCNmbVLMDgXQIEs/HmAoLBgj9GCrZ55/wzX97s0kB2smsLsIicuhrnJgtGFtsk
         6zWuoO7X9hRwUFpM07DqBnjQzzF3qdbYkKD6K9ne8ywGrHO+6mceCmQyPC3yUKkz062c
         vj5DjXSpwhqEFmVHEHbsZiSZSra9nVRPKfnc+LD6xPquL4RPpA397+Uem3BtaLiVrzEs
         O1Y5xeyT/E6g0IKAIRG4YeLWrjEcg+vZiP/CSsXIz9nkOVRYaq8A1cSTRpCzDm5lwFk3
         YYZJd5dfYWNjZRnozyJzjW+yyljD7ZhbOrILRmNOJGl39SqEhMVEhoFaM3oizBISfhLp
         AFmg==
X-Gm-Message-State: AOJu0YxtUU+6F4wPacoqYftBUA87/ze2au2pSsyX5AXiE/NzL0wzj91i
	pOjXdbnwx2YeiCzjtVEwz46ILsjMQYYWb23j3E9LW0v+PWy+1FsVRdVCSQXTen3v
X-Gm-Gg: ASbGncszJqmG334mY/scY1gDf3rOSXt2tzZwJEagJN+ZXf1jPFWQcw5Ka1ysBLumKd7
	e7qUpO+GqQiBQDUmHKLi+ArlN1C/OThgar4Ffe9mvGxxRI1hg3jCYPnN94FcLoT0HmQDfF71i+8
	edcIMjwNIAnA/u9vRdMWMHoi8En8i5/f4Rs/Ys90TLfFzz+ChQob/k6iHF9bHWowLeeTAHJwSHE
	2bJ9fLM2qVlMRm7I9n/GS2aXIa2sXFd4MpGSBwyMjpSjv0iveqUoNFzY3ADQ4xXB7Av0LzyUYu7
	4i0lEY3M9+7ZJi/mmCZUUqc53qZz0j7r0XaY31C+dgaptbilTPiAoew8H5/6M8Bs3KDkkLtxEiU
	AsVWjY5FXLqKNqTnAVM1dpfyq5NuWKITGmeFgHocnJeVSLPYBskKrKlvUPmyrIFtO/W+8nJwXYj
	pgLsrRK7rQQzV9lNZknLNx7ROSXty8Cqgsmj26PnkacnxUtbzqmG0GVdk=
X-Google-Smtp-Source: AGHT+IEHAkAjsx+AcYiFj6bbDfNxh05DgLlgcigwBuGP4ZsrHTsIk7PkL/MRnY4TibUboiviSfvm3Q==
X-Received: by 2002:a05:6402:1d50:b0:640:ebe3:dd55 with SMTP id 4fb4d7f45d1cf-645eb23f84emr21307302a12.6.1764584661090;
        Mon, 01 Dec 2025 02:24:21 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 3/3] xen/riscv: add RISC-V virtual SBI base extension support for guests
Date: Mon,  1 Dec 2025 11:24:10 +0100
Message-ID: <d17dcac47752681eed6703360389dd542433ab3e.1764582112.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764582112.git.oleksii.kurochko@gmail.com>
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support of virtual SBI base extension calls for RISC-V guests, delegating
hardware-specific queries to the underlying SBI and handling version and
firmware ID queries directly.

The changes include:
1. Define new SBI base extension function IDs (SBI_EXT_BASE_GET_MVENDORID,
   SBI_EXT_BASE_GET_MARCHID, SBI_EXT_BASE_GET_MIMPID).
2. Make sbi_spec_version, sbi_fw_id, and sbi_fw_version global variables for
   use in virtual SBI handling, removing redundant local declarations in
   sbi_init.
3. Implement handling of SBI base extension functions, including version,
   firmware ID, and machine-specific queries.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/sbi.h          |  3 ++
 xen/arch/riscv/sbi.c                      |  8 ++--
 xen/arch/riscv/vsbi/Makefile              |  1 +
 xen/arch/riscv/vsbi/vsbi-base-extension.c | 52 +++++++++++++++++++++++
 4 files changed, 61 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/riscv/vsbi/vsbi-base-extension.c

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index e7d5d707b1..98ba872ef3 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -32,6 +32,9 @@
 #define SBI_EXT_BASE_GET_IMP_ID         0x1
 #define SBI_EXT_BASE_GET_IMP_VERSION    0x2
 #define SBI_EXT_BASE_PROBE_EXT          0x3
+#define SBI_EXT_BASE_GET_MVENDORID      0x4
+#define SBI_EXT_BASE_GET_MARCHID        0x5
+#define SBI_EXT_BASE_GET_MIMPID         0x6
 
 /* SBI function IDs for RFENCE extension */
 #define SBI_EXT_RFENCE_REMOTE_FENCE_I           0x0
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
index 425dce44c6..97cbf84c21 100644
--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -23,7 +23,9 @@
 #include <asm/processor.h>
 #include <asm/sbi.h>
 
-static unsigned long __ro_after_init sbi_spec_version = SBI_SPEC_VERSION_DEFAULT;
+unsigned long __ro_after_init sbi_spec_version = SBI_SPEC_VERSION_DEFAULT;
+long __ro_after_init sbi_fw_id;
+long __ro_after_init sbi_fw_version;
 
 struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
                         unsigned long arg0, unsigned long arg1,
@@ -313,8 +315,8 @@ int __init sbi_init(void)
 
     if ( !sbi_spec_is_0_1() )
     {
-        long sbi_fw_id = sbi_get_firmware_id();
-        long sbi_fw_version = sbi_get_firmware_version();
+        sbi_fw_id = sbi_get_firmware_id();
+        sbi_fw_version = sbi_get_firmware_version();
 
         BUG_ON((sbi_fw_id < 0) || (sbi_fw_version < 0));
 
diff --git a/xen/arch/riscv/vsbi/Makefile b/xen/arch/riscv/vsbi/Makefile
index 4da625db9a..07ae27b99e 100644
--- a/xen/arch/riscv/vsbi/Makefile
+++ b/xen/arch/riscv/vsbi/Makefile
@@ -1,2 +1,3 @@
 obj-y += vsbi.o
+obj-y += vsbi-base-extension.o
 obj-y += vsbi-legacy-extension.o
diff --git a/xen/arch/riscv/vsbi/vsbi-base-extension.c b/xen/arch/riscv/vsbi/vsbi-base-extension.c
new file mode 100644
index 0000000000..88f4567cb1
--- /dev/null
+++ b/xen/arch/riscv/vsbi/vsbi-base-extension.c
@@ -0,0 +1,52 @@
+
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/lib.h>
+#include <xen/sched.h>
+
+#include <asm/processor.h>
+#include <asm/sbi.h>
+#include <asm/vsbi.h>
+
+extern unsigned long __ro_after_init sbi_spec_version;
+extern long __ro_after_init sbi_fw_id;
+extern long __ro_after_init sbi_fw_version;
+
+static int vsbi_base_ecall_handler(struct vcpu *vcpu, unsigned long eid,
+                                   unsigned long fid,
+                                   struct cpu_user_regs *regs)
+{
+    int ret = 0;
+    struct sbiret sbi_ret;
+
+    switch ( fid ) {
+    case SBI_EXT_BASE_GET_SPEC_VERSION:
+        regs->a1 = sbi_spec_version;
+        break;
+    case SBI_EXT_BASE_GET_IMP_ID:
+        regs->a1 = sbi_fw_id;
+        break;
+    case SBI_EXT_BASE_GET_IMP_VERSION:
+        regs->a1 = sbi_fw_version;
+        break;
+    case SBI_EXT_BASE_GET_MVENDORID:
+    case SBI_EXT_BASE_GET_MARCHID:
+    case SBI_EXT_BASE_GET_MIMPID:
+        sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
+        ret = sbi_ret.error;
+        regs->a1 = sbi_ret.value;
+        break;
+    case SBI_EXT_BASE_PROBE_EXT:
+        regs->a1 = vsbi_find_extension(regs->a0) ? 1 : 0;
+        break;
+    default:
+        panic("%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",
+              __func__, fid, eid);
+        break;
+    }
+
+    return ret;
+}
+
+VSBI_EXT_START(base, SBI_EXT_BASE, SBI_EXT_BASE, vsbi_base_ecall_handler)
+VSBI_EXT_END
-- 
2.52.0


