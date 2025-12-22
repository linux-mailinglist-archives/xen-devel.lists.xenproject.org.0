Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1113ECD6ADA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 17:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192148.1511478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXiuf-0008Og-MM; Mon, 22 Dec 2025 16:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192148.1511478; Mon, 22 Dec 2025 16:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXiuf-0008MV-HT; Mon, 22 Dec 2025 16:37:37 +0000
Received: by outflank-mailman (input) for mailman id 1192148;
 Mon, 22 Dec 2025 16:37:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACBk=64=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXiud-00085h-VX
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 16:37:35 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 843eda7d-df54-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 17:37:33 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-64d0d41404cso2993940a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 08:37:33 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b9105655asm10977819a12.9.2025.12.22.08.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 08:37:32 -0800 (PST)
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
X-Inumbo-ID: 843eda7d-df54-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421453; x=1767026253; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rKcl3RMTLtuAlPIfvhLTYtcdM8WDD2kedJ0JOBzWzo=;
        b=J8g1nQLX9XXt9/Tcgf6qFUEBlnPhmV2JpVVLLsUYMlRkbDQKkksTdChw4HDgTxoH9/
         Cwc4Ug4iV2TkLQLAkGkARXHSdG1x7uAadx4oLME5tDJSOadYm0DH9pzkIbID4tXeF9oW
         xL/9iHSz10vDt6cztPatlfpuSZ8R/9EUah2jWm71Gvxsx1ZvefYfziAAzPkX7L86G1mT
         TzBz9skHDaGiW8QlD65OPlVQ9rjxFkgoL780iT96zJ2K63e9a2fJOzYg3rgLkgcRzZT5
         v7DO91WKwM86uhEIPYy8+RROIfhyN+jfN1pfa9M+NUH5KhKkBhU2Kx21MUuRdavJPhFQ
         JXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421453; x=1767026253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2rKcl3RMTLtuAlPIfvhLTYtcdM8WDD2kedJ0JOBzWzo=;
        b=TgAZbOthGh6WaMmkS8HeNXzQL1zRPwi8y2+fpzjhjSfdT+XxjxjjRVIFT5KSmMW6YN
         4g/12I4rSD5nFIU81vp/qwz3KZQ1HomNmRyuw1aNH2/x1Gb9bReNL5/ugmgPG+KtYLQY
         AYkGpRliGEZu+ck3K1mdqCoCgmqCzWfDzVsWkBBJcckoncSi/QwgzvF5EzntPFpQ4xk8
         5npkv4IF3I5BCdv+Xy7CvhvLcoYPKsfIGi+++gGHXWyy6WUDIx9dJu8KXPJqWCD5hEET
         C1c2OfRafL+Dv6x9x7vyOcf1wNsPHAZp7sAkXwCgbCD7wkKXnTePdCb5FMAMazEHM6ku
         HD6w==
X-Gm-Message-State: AOJu0YygFzRLsEW8Moc2LbqWt2eAwmjji+vh3XsanpAdNUT8OLfovGyy
	KxV56CuIWRbbDl0WEEOsWRTF5+vy6Lrml2W+S5YfIEcpbsGspMxG5SpZhdDdEQ==
X-Gm-Gg: AY/fxX4NsFFec/9a8QWFBrnWYfFOog+oqoByYahip7rvyK9BoaTUNqcpAyCwvnnmaw/
	sjzRw+lLZjP+Tbh4koEPcD96yL3gZKkeMnQ5IAxg42dvGQ0pE71ojbMH4+IEP5z7MvAlenLaFHU
	KLSr6qyxhnYtkU+lfRrpQ835BiGYi0OJzVYcSRkUmC6NNs9FT++quRp9pXUhMdSB72DtE5tWLBL
	JcTqWx8ZUZWlpCHnMDqfYsbC0yMeTxuZ1D5WJeOenxyD9SmuuU08AOqT+SeQvRmVRam8UqJHP5x
	HqhmloVIVwqllwXAUGVHtKjCfL6NB+5dHe8F8Y/VFh44oMl1qwHckhZs1u0JD6MX7oHsI3VjvE4
	S98kRtNMJXwb7tNDQ3w5RdjncKEYrVnFS8t6WvkFubbxgAuftYKzgcnAaqA8aC5HGjO3u313LA/
	tPgPp6SR1YKktx01S1zaq+2VDxZMr79aPSWUJAxCR4e+df7H67xQ4l7SQ=
X-Google-Smtp-Source: AGHT+IGPf73v97oueoSNdWbJxBDcUT+vi+tzYguW3tnDofwvUiMHekiIbwqEyjqbVeRfAjbk2WiGpQ==
X-Received: by 2002:a05:6402:510d:b0:649:cb54:b7a9 with SMTP id 4fb4d7f45d1cf-64b8ec6c534mr9436702a12.21.1766421452828;
        Mon, 22 Dec 2025 08:37:32 -0800 (PST)
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
Subject: [PATCH v3 2/3] xen/riscv: add RISC-V legacy SBI extension support for guests
Date: Mon, 22 Dec 2025 17:37:20 +0100
Message-ID: <f4225d3134ec12a392a2e5d91414bfdf9d0665a1.1766399205.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766399205.git.oleksii.kurochko@gmail.com>
References: <cover.1766399205.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds support for legacy SBI extensions (version 0.1) in Xen
for guest domains.

The changes include:
1. Define all legacy SBI extension IDs (0x0 to 0x8) for better clarity and
   completeness.
2. Implement handling of legacy SBI extensions, starting with support for
   SBI_EXT_0_1_CONSOLE_PUTCHAR. SBI_EXT_0_1_CONSOLE_GETCHAR is marked as
   not supported as legacy SBI console related stuff is expected to be used
   only for early debugging of guest.

The implementation uses the existing virtual SBI framework to handle legacy
SBI ecalls, ensuring compatibility with older SBI specifications in
RISC-V guests.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - s/vsbi_print_line/vsbi_print_char.
 - s/cd/currd in vsbi_print_char().
 - Drop a cast of regs->a0 when vsbi_print_line() is called.
 - Use current instead of `vcpu` argument as it was dropped from
   vsbi_base_ecall_handler() prototype.
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
 xen/arch/riscv/vsbi/legacy-extension.c | 64 ++++++++++++++++++++++++++
 3 files changed, 74 insertions(+), 2 deletions(-)
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
index 0000000000..ca869942d6
--- /dev/null
+++ b/xen/arch/riscv/vsbi/legacy-extension.c
@@ -0,0 +1,64 @@
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
+static void vsbi_print_char(char c)
+{
+    struct domain *currd = current->domain;
+    struct domain_console *cons = currd->console;
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
+        guest_printk(currd, XENLOG_G_DEBUG "%s\n", cons->buf);
+        cons->idx = 0;
+    }
+    spin_unlock(&cons->lock);
+}
+
+static int vsbi_legacy_ecall_handler(unsigned long eid, unsigned long fid,
+                                     struct cpu_user_regs *regs)
+{
+    int ret = 0;
+
+    switch ( eid )
+    {
+    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
+        vsbi_print_char(regs->a0);
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
+        domain_crash(current->domain,
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


