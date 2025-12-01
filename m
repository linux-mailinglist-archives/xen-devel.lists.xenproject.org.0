Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759EAC96A22
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 11:25:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175652.1500292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ14z-0004iV-C3; Mon, 01 Dec 2025 10:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175652.1500292; Mon, 01 Dec 2025 10:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ14z-0004ge-8d; Mon, 01 Dec 2025 10:24:25 +0000
Received: by outflank-mailman (input) for mailman id 1175652;
 Mon, 01 Dec 2025 10:24:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tSLg=6H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vQ14x-00041l-Mz
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 10:24:23 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6704ee7-ce9f-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 11:24:21 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-640d0ec9651so7209124a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 02:24:21 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647510508e1sm12104724a12.27.2025.12.01.02.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 02:24:19 -0800 (PST)
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
X-Inumbo-ID: e6704ee7-ce9f-11f0-9d19-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764584660; x=1765189460; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lf+N5X3ZZ5bsc0bBTkOsHsGSk6FHfGVMZrI5qCr7EEo=;
        b=Nz1lIuNWZ23GQzNT7uPS2A4nWBLgSYss4y63rNkQNbIZfJaP/TugtdiEDZw7FAR2wI
         kL6MS9F4SixHugsD+k09TDJeljwIBnzDUxVL+dfsEPVAdmMcDqMhH7wjIgCdzQg4ILir
         VuT3at7qQJEWm1R0wxzjB/uGeca/+gzsYmFbH0D69vwImwpo02g5BNbqT0d3bbHVp1em
         1BPTOUprAxYyboY7fIyKdvFyjp55YoX2LScgAkednHqkSYTQLeVEvMA3cgumSEHIU2Yg
         T8xBrDoMlFxwmtxOJtGL+3kzCTRI9getG03dNavNCJzoatTwvvFa/jrYXhdvalt2Tit6
         V2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584660; x=1765189460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lf+N5X3ZZ5bsc0bBTkOsHsGSk6FHfGVMZrI5qCr7EEo=;
        b=jIvMyYZmdin1jz1rBSO/iWK+zMxxTBMgQdsU0e03WJ4Je0XwMhtUKsVdPIS/M61CNP
         TrMsC9nWQ7j/qc/vKzCsZyflxaMjorkmardVSthNMFLMD/fIXZxcUrsxNyDuFL/50FZL
         mMkYjK+NbhABxYQ/alvD4bScNBCUoiHHPj4mWROuEOPKcNeBbW+xoqmRwpkfQ9JErRU9
         d/mHEEAayJBcfwV6VegrmLpPTwkAv52rZqLvkbCVXWHN1rV7krtbbbGXfX/Smi1mhskd
         XyUbs+o2hx+faPnD0wCzlx5cPT519w4hcQ9qbd37GmMsmWvK7mazo1PePqvgQzpCSW2S
         mMfA==
X-Gm-Message-State: AOJu0YxOkp5JPr29spwSbCRECsgTjgVyx9wA/H2Eo7JpncWyq0a8EuFc
	utD6Ag8hQkcFxlJR3lpTAtXhyNooiBRq6KQIzv/VzIBjItj4jOqHsra67jaidIpc
X-Gm-Gg: ASbGnctz1xabEtIGqo5m8/kNhRT2CeQnCINUrxAjJkZwA0xo9kde1+rRuzDdSfO3jbM
	n65pOGP1sNaNeYzfoIGsnuvNPzmOgE/sW/GaaA2E81nl47rRrKHeJJvmzKU2XRAcGHPJgfBYQ79
	5ec/gZjA72bSlhtzwb2WWqW1mwzUrvPBaS/MRyEnZulwRKqUgZg8asec69dnEuet1s2VFdxL5z+
	BkZwkM+9lSBPuLqn7fS+CrXmLX9ORWm0am6YllmOSAcXvyV1dQvt4SIQ2QhwTklLRLRXPU6AAaV
	JsnKLuJYm8kfrPN62Tk98bnRImAGrpul1F/cZR8qToIKGs34KrZbIby2/WcbYpmXbLAbrUDNoHd
	Y6Xf9XR7uKQlHWEN/jAYdJ+pthmN+5s28wyUAd6yltQMo1hJmwqPy8miqHhvgEadJSq5wIU9wh6
	v8rVAg/U84yweCTpJq8KAc+SPF8MRiHr9zUPjx+9TJCbvcYrP0MXPxoKX6ICiH3xSTkA==
X-Google-Smtp-Source: AGHT+IESPE5BRtDHOM0mPf44z/DvKR1KHQLIzguXTRd2Az3sSheaMmSW8ev4MCk0ZNllhessoEZqYw==
X-Received: by 2002:a05:6402:42c7:b0:640:e791:df67 with SMTP id 4fb4d7f45d1cf-64555b9bebbmr36232781a12.10.1764584660077;
        Mon, 01 Dec 2025 02:24:20 -0800 (PST)
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
Subject: [PATCH v1 2/3] xen/riscv: add RISC-V legacy SBI extension support for guests
Date: Mon,  1 Dec 2025 11:24:09 +0100
Message-ID: <f4e4dc9beef4618ffaabe1c6caec3e10cf78fd5d.1764582112.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764582112.git.oleksii.kurochko@gmail.com>
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds support for legacy SBI extensions (version 0.1) in Xen
for guest domains.

The changes include:
1. Define all legacy SBI extension IDs (0x0 to 0x8) for better clarity and
   completeness.
2. Implement handling of legacy SBI extensions, starting with support for
   SBI_EXT_0_1_CONSOLE_{PUT,GET}CHAR.

The implementation uses the existing virtual SBI framework to handle legacy
SBI ecalls, ensuring compatibility with older SBI specifications in
RISC-V guests.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/sbi.h            | 11 ++++--
 xen/arch/riscv/vsbi/Makefile                |  1 +
 xen/arch/riscv/vsbi/vsbi-legacy-extension.c | 37 +++++++++++++++++++++
 3 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/vsbi/vsbi-legacy-extension.c

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index ade24a572d..e7d5d707b1 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -14,8 +14,15 @@
 
 #include <xen/cpumask.h>
 
-#define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
-#define SBI_EXT_0_1_SHUTDOWN			0x8
+#define SBI_EXT_0_1_SET_TIMER           0x0
+#define SBI_EXT_0_1_CONSOLE_PUTCHAR     0x1
+#define SBI_EXT_0_1_CONSOLE_GETCHAR     0x2
+#define SBI_EXT_0_1_CLEAR_IPI           0x3
+#define SBI_EXT_0_1_SEND_IPI            0x4
+#define SBI_EXT_0_1_REMOTE_FENCE_I      0x5
+#define SBI_EXT_0_1_REMOTE_SFENCE_VMA   0x6
+#define SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID  0x7
+#define SBI_EXT_0_1_SHUTDOWN            0x8
 
 #define SBI_EXT_BASE                    0x10
 #define SBI_EXT_RFENCE                  0x52464E43
diff --git a/xen/arch/riscv/vsbi/Makefile b/xen/arch/riscv/vsbi/Makefile
index 574c8ff78d..4da625db9a 100644
--- a/xen/arch/riscv/vsbi/Makefile
+++ b/xen/arch/riscv/vsbi/Makefile
@@ -1 +1,2 @@
 obj-y += vsbi.o
+obj-y += vsbi-legacy-extension.o
diff --git a/xen/arch/riscv/vsbi/vsbi-legacy-extension.c b/xen/arch/riscv/vsbi/vsbi-legacy-extension.c
new file mode 100644
index 0000000000..39d65931b1
--- /dev/null
+++ b/xen/arch/riscv/vsbi/vsbi-legacy-extension.c
@@ -0,0 +1,37 @@
+
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/lib.h>
+#include <xen/sched.h>
+
+#include <asm/processor.h>
+#include <asm/vsbi.h>
+
+static int vsbi_legacy_ecall_handler(struct vcpu *vcpu, unsigned long eid,
+                                     unsigned long fid,
+                                     struct cpu_user_regs *regs)
+{
+    int ret = 0;
+
+    switch ( eid )
+    {
+    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
+        printk("%c", (char)regs->a0);
+        break;
+
+    case SBI_EXT_0_1_CONSOLE_GETCHAR:
+        regs->a0 = SBI_ERR_NOT_SUPPORTED;
+        break;
+
+    default:
+        panic("%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",
+              __func__, fid, eid);
+		break;
+    }
+
+    return ret;
+}
+
+VSBI_EXT_START(legacy, SBI_EXT_0_1_SET_TIMER, SBI_EXT_0_1_SHUTDOWN,
+               vsbi_legacy_ecall_handler)
+VSBI_EXT_END
-- 
2.52.0


