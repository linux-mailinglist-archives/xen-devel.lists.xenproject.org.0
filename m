Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120D8CC8E3A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 17:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188964.1509973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVunL-0003SS-7t; Wed, 17 Dec 2025 16:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188964.1509973; Wed, 17 Dec 2025 16:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVunL-0003Qs-3b; Wed, 17 Dec 2025 16:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1188964;
 Wed, 17 Dec 2025 16:54:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddEZ=6X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVunJ-0003An-3A
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 16:54:33 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e3aa4cc-db69-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 17:54:30 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-649820b4b3aso4427797a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Dec 2025 08:54:30 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d1e89sm2015077966b.69.2025.12.17.08.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 08:54:29 -0800 (PST)
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
X-Inumbo-ID: 0e3aa4cc-db69-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765990470; x=1766595270; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xk8VLGfP89HNwQj29hZGIP9LR5h0D6fyBDqrK9XH7AU=;
        b=nqeXuKJc5XiRRMXRIuSwfH6pDZnvgwy3bJWCn/Jgisazc9SWBYiaKmxBzuQAUrM+U5
         vOl/LfTZLPvywLmEDihU1peIxZgTqbTfZeKcR8l0tGeg1drbyH8W9rezyt7Uql+GYmmK
         UtYvR/SUGCp0YwfDAxTHQiwK56l6CfvAEACrsDS6YVRUw7vcMKxXnbC7iUFNyA//6PPO
         7GwKelkH8rx8oide/KBCTELO2icz7Ept60DVm/euSaq9WMn1xl8uXrtcw4guhRpd1QGg
         vg4iAE3ZSGBLg8P5+AfeflfJ0GMulCBb9C1j0K/npFnT++yWKb75dViEH4Iyn46KrDFh
         6VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765990470; x=1766595270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xk8VLGfP89HNwQj29hZGIP9LR5h0D6fyBDqrK9XH7AU=;
        b=CM6VZzHxC7MbnNb1agOwZUIT4x8cOHgJ/PAy50DFbh2NpD+hMT/yCSITkBTJFI1lFd
         iEpG9WHmvfTDipXVHniJ8luVFkJ7GKlufjp7qOFkvEnLVAjOctsPZjmZ2whU5bVxh5Qn
         Fyo21EFNn14iwznUIIQ4yCPOdImWOR1YnnZ58uuODtIzZecL9fpFN7kuXjviSW+H+k99
         5ta1YcvIGPlcmWxdxaZdQQCtY93QfJ24zHXq/DMgLpq9V4L6Hh5v0s0p6QVLBX9hvLrk
         yQdXw2WVTWcVrztznhgKeJymNs+Wvn6rZ9NWF87UkLv1pssLewnSK/zgRezHbZFwyZey
         6/Hw==
X-Gm-Message-State: AOJu0Yy9WdgaWtZNLUr9hLxFGwBE3JT5Z4A/xPBwOSgqyr8rYXCChAJS
	oWTTbm18auy1d5M8S3MY1DiDnqoAkXv02AnlHouZ1dwKqeEAHqPcnzv0SXQFSg==
X-Gm-Gg: AY/fxX5HNwywoQ/tdiwWys8Zdr4EJMEKl9G8bRnecp+lbvOUArGMMeYn91eHKHVDGui
	KkFcHIUzgpI9+so8zhLlRywOLMNzaGeeZ4MsMr3Jj/0utg5v9cgyWCXyJBaEBZfULNtI7m3SjCn
	ICFR2cGaZDj9ODcP+3YROqq2xm/u+WVGiZt9njcw0QhDMni/0vmOZAqtszEOvdJvyv/3P1esXnE
	4EMqSpqVMj9yWyUwNn3IFBdVm/fKUWtnZojf7oAejruCMfE/rTccvxxhK0d2zxRV6EvJGjvpi3s
	MF1XfNWPWoz7SPPgZ0qGgc9lVCCExVu22D7xR6Xt8NCD7OQc2b3DaIU1UXtfBbKgGtxf4G+g8J8
	9wB8HVHYUjyJAcZPk/m5EtbfPlVhCfRANfwYOssa+PAYeH5FwF1og0JGG3/U85GqY7ecZsSf9ZJ
	Nd56+KYXgQ8Ov18rhyOlMy+m6QvBQB03kARwidV+gmLFgldrezFGqyh5o=
X-Google-Smtp-Source: AGHT+IEMdu2XSHa6enoreBym9vX+fgimxJ1D+uQFmMT9LBHk2c/NxVbfJe3zJelR1wqkCmuusah+pw==
X-Received: by 2002:a17:907:68a2:b0:b80:448:37f1 with SMTP id a640c23a62f3a-b800448e482mr297467166b.10.1765990469724;
        Wed, 17 Dec 2025 08:54:29 -0800 (PST)
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
Subject: [PATCH v2 2/3] xen/riscv: add RISC-V legacy SBI extension support for guests
Date: Wed, 17 Dec 2025 17:54:19 +0100
Message-ID: <df7a7e94fba79265138d6cc8d23b1f6b958f5bd5.1765888425.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765888425.git.oleksii.kurochko@gmail.com>
References: <cover.1765888425.git.oleksii.kurochko@gmail.com>
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
Changes in v2:
 - s/vsbi-legacy-extension.*/legacy-extension.*
 - Correct padding for SBI_EXT_0_1_* macros.
 - Set ret = SBI_ERR_NOT_SUPPORTED; in the case of vsbi_legacy_ecall_handler()
   instead of regs->a0 = ... as regs->a0 will be overwritten in
   vsbi_handle_ecall().
 - Use domain_crash() instead of panic() in vsbi_legacy_ecall_handler() and
   add TODO.
 - Use newly introduced VSBI_EXT macros instead of VSBI_EXT_{START,END}.
 - Introduce vsbi_print_line() and use it instead of plain printk() in the
   handler of SBI_EXT_0_1_CONSOLE_PUTCHAR.
---
 xen/arch/riscv/include/asm/sbi.h       | 11 ++++-
 xen/arch/riscv/vsbi/Makefile           |  1 +
 xen/arch/riscv/vsbi/legacy-extension.c | 65 ++++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/vsbi/legacy-extension.c

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index ade24a572d..751bae6d66 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -14,8 +14,15 @@
 
 #include <xen/cpumask.h>
 
-#define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
-#define SBI_EXT_0_1_SHUTDOWN			0x8
+#define SBI_EXT_0_1_SET_TIMER               0x0
+#define SBI_EXT_0_1_CONSOLE_PUTCHAR         0x1
+#define SBI_EXT_0_1_CONSOLE_GETCHAR         0x2
+#define SBI_EXT_0_1_CLEAR_IPI               0x3
+#define SBI_EXT_0_1_SEND_IPI                0x4
+#define SBI_EXT_0_1_REMOTE_FENCE_I          0x5
+#define SBI_EXT_0_1_REMOTE_SFENCE_VMA       0x6
+#define SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID  0x7
+#define SBI_EXT_0_1_SHUTDOWN                0x8
 
 #define SBI_EXT_BASE                    0x10
 #define SBI_EXT_RFENCE                  0x52464E43
diff --git a/xen/arch/riscv/vsbi/Makefile b/xen/arch/riscv/vsbi/Makefile
index 820eb10ac2..bc5755cb13 100644
--- a/xen/arch/riscv/vsbi/Makefile
+++ b/xen/arch/riscv/vsbi/Makefile
@@ -1 +1,2 @@
 obj-y += core.o
+obj-y += legacy-extension.o
diff --git a/xen/arch/riscv/vsbi/legacy-extension.c b/xen/arch/riscv/vsbi/legacy-extension.c
new file mode 100644
index 0000000000..75280de3bc
--- /dev/null
+++ b/xen/arch/riscv/vsbi/legacy-extension.c
@@ -0,0 +1,65 @@
+
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/console.h>
+#include <xen/lib.h>
+#include <xen/sched.h>
+
+#include <asm/processor.h>
+#include <asm/vsbi.h>
+
+static void vsbi_print_line(char c)
+{
+    struct domain *cd = current->domain;
+    struct domain_console *cons = cd->console;
+
+    if ( !is_console_printable(c) )
+        return;
+
+    spin_lock(&cons->lock);
+    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
+    if ( c != '\n' )
+        cons->buf[cons->idx++] = c;
+    if ( (cons->idx == (ARRAY_SIZE(cons->buf) - 1)) || (c == '\n') )
+    {
+        cons->buf[cons->idx] = '\0';
+        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cons->buf);
+        cons->idx = 0;
+    }
+    spin_unlock(&cons->lock);
+}
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
+        vsbi_print_line((char)regs->a0);
+        break;
+
+    case SBI_EXT_0_1_CONSOLE_GETCHAR:
+        ret = SBI_ERR_NOT_SUPPORTED;
+        break;
+
+    default:
+        /*
+         * TODO: domain_crash() is acceptable here while things are still under
+         * development.
+         * It shouldn't stay like this in the end though: guests should not
+         * be punished like this for something Xen hasn't implemented.
+         */
+        domain_crash(vcpu->domain,
+                     "%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",
+                     __func__, fid, eid);
+        break;
+    }
+
+    return ret;
+}
+
+VSBI_EXT(legacy, SBI_EXT_0_1_SET_TIMER, SBI_EXT_0_1_SHUTDOWN,
+         vsbi_legacy_ecall_handler);
-- 
2.52.0


