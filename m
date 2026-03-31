Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI++HtEazGnHPgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 21:04:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D4C370575
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 21:04:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269258.1558350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7eO7-0004ms-Vj; Tue, 31 Mar 2026 19:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269258.1558350; Tue, 31 Mar 2026 19:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7eO7-0004kf-Sl; Tue, 31 Mar 2026 19:04:31 +0000
Received: by outflank-mailman (input) for mailman id 1269258;
 Tue, 31 Mar 2026 19:04:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7eO6-0004XO-9p
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 19:04:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7eO5-0042Cg-IU
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 21:04:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cc1a93-5cb7-0a2a0a5109dd-0a2a4505ed50-44
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 21:04:29 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cc1abd-5aeb-0a2a45050019-d155802dd169-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 21:04:29 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so74749095e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 12:04:29 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a6ebsm66704905e9.6.2026.03.31.12.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 12:04:28 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774983869; x=1775588669; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt869+EoqKBeJ1+vQp/e7NBob2COQX9inHC/KN2XaZ0=;
        b=UMkObwboCxrUBhe1t0ckBDjMcYVnKr9kZOB1iJA9J/h9QJVbP1yTi+2HPacA7M+9zv
         7Q+Fj2TSakAwckXIzjAv2Y17uCdTtCVHXJPtOQQnD9NhW8nVmzi3Aeoo2T4iEVBpzaTm
         WHkx9ee29l/NJ4jyRJhRCfZpPY8FH8BVpW1P4MWhqRMBFSiA0vy3Fr9RHTg0XWKWNXUx
         gcUknjGbN0urpQ6wyzVvQVPDnsR60x7O591+JFhlNAnGetx0rfPeEOBpSBDICyzmjwO7
         lkPqcLx6Q6mUPOsbCk8RPyxAonp3JN34eFJWgYiFvpyFVbVi4XiuVWcsjONiuwx4Jf8r
         xJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774983869; x=1775588669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nt869+EoqKBeJ1+vQp/e7NBob2COQX9inHC/KN2XaZ0=;
        b=aBKxJB/BHyy5U/JrVbnsCJFZqp9x4EkwB0iisVXWt2t7E0nFZMrpON2Fi7KUWfqzMO
         k/CnWwxa88rRtS4GV3bf7e0TYOYKERFcnuJJc/cG8ODmXJX4HK9SjwhwcUQsclKwJ4zb
         +XqQ3suAqdp+4HOJamBLK8HhBhZUk7lW3Zy0lAj1eMvbqDDwTB22XNCyxyrundm3vNCH
         mpUc8Bm9nhUHAPbcwdkShExkP8rGO0uHMGw5iQSvVmpmtP+kd2NI0JQ45/n/EochtLr2
         V/EYEhYuE9KxfWRHYOifiZfL8ip5zkH9F+qhcqWhEPSxVVTKbpax/exBGgFOKEJCh37N
         BRHA==
X-Gm-Message-State: AOJu0YyuvaHCryNGeF1TkvjZBEgIcS+QVBUwP/AQwvQE7KFE64IsM+po
	jnPFW3EnEM6eOzpkc6SZVzLslf46Kh9IiK9SQ0bSxjQyy+rZgb7gMAdpiqiNsg==
X-Gm-Gg: ATEYQzx/EDp/4F1L90xKzfCRbhboYsDJHSIxP8b1I9KsL+TBmWcBWDughPMCQm091dJ
	kX99EgyZ0LYAJ0rd3S0JK9jw4u8OhhAdrRR6ErDlmyCGWEHxrimef/Oef3oGvybb5Vxo3hXQRAi
	tB/69GTtdjNEvbHJQVC9X2/ikSPSOUaMOMyHLxvX7Aqt1CmeqKR2xM80Qv7J6iSZoTcgcaGlk6e
	oGh3fj2JL+9afoVPYiiWD3KfZeCAnym11/0/tfUywiOwrA0DwuvBhc0hfN4qKhjcJq2qwrNo68J
	GfVrYwh1LjAUfSQnf5cd8paI3BfS6GNuSmPVu8p7j92kG2Nlbu+SNyOgKDYq8xzQXDIvpqrXPNG
	pzE3NVS6M6NzGpYyAKPODMVwV9xN1olata061MF1k2OUx59jfyBWO2XcVH05seEw87Q4PL2fPgz
	HygbM19xsbt059Sh+Jk/Tjrxg7IQ5IzB02v7ko1Zu/tLhwxGrLzALuaAm6ZyDYl40+Yw==
X-Received: by 2002:a05:600c:5303:b0:485:34b3:8587 with SMTP id 5b1f17b1804b1-48883562deamr9647415e9.10.1774983868536;
        Tue, 31 Mar 2026 12:04:28 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/4] xen/riscv: add exception table support
Date: Tue, 31 Mar 2026 21:04:16 +0200
Message-ID: <dcf5786b4ec99edcec6554a338904c52f0c3b03f.1774863161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774863161.git.oleksii.kurochko@gmail.com>
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1774983869-22484488-AF78F8D6/10/73395122804
X-purgate-type: spam
X-purgate-size: 11353
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C8D4C370575
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce exception table handling for RISC-V so faults from selected
instructions can be recovered via fixup handlers instead of being
treated as fatal.

Add the RISC-V exception table format, sorting at boot to allow binary
search used furthuer, and lookup from the trap handler. Update the
linker script to emit the .ex_table section using introduced common
EX_TABLE macro shared with other architectures.

Also, reduce __start___ex_table alignment from 8 to 4 bytes to
match the natural alignment of struct exception_table_entry,
which contains two int32_t fields.

Add inclusion of asm/extable.h to asm/bug.h to deal with compilation
issue of common/virtual_region.c, which require declaration of
__start___ex_table and __stop___ex_table.

This implementation is based on Linux 6.16.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Corrected the name for __start_ex_table identifier in the commit message.
 - Droped plural where extables is used.
 - Added inclusuion of <asm/extable.h> to deal with compilation (nothing
   declares __start___ex_table and __stop___ex_table) of common/virtual_region.c.
 - Use long for delta variable inside swap_ex in extable.c.
 - To take into acoount live-patching code:
   - s/sort_extable/sort_exception_tables.
   - Introduce sort_exception_table() as liveaptch code requires it and
     re-use it inside sort_exception_tables().
- Drop cmp_ex_search() and rename cmp_ex_sort() to cmp_ex().
  Rename local variable l and r inside cmp_ex().
- Identation fixes.
- prefer sizeof(<expression>) over sizeof(<type>) in calls of bsearch() and
  sort().
- Return back defintion of asm_extable() for __ASSEMBLER__ case.
- Correct the comment above declaration of struct exception_table_entry.
- Drop else in do_trap() before "if ( fixup_exception() )" to visually separate
  the set of checks.
- Align start of exception table section by 4-bytes as exception table struct
  contains two 4 bytes integers.
- Make extable.o compile unconditionally.
- Drop ifdef HAS_EX_TABLE in extable.h as extable.o is always compiled.
- Drop ifdef around defintion of EX_TABLE.
- Drop __init for cmp_ex as it is now used in fixup_exception() which isn't
  marked as __init.
- Return void instead of bool for ex_handler_fixup() as this function always
  returns true.
- Update the comment above defintion of struct exception_table_entry() to be
  more accurate.
- Add inclusion of asm/extable.h to asm/bug.h to deal with compilation issue
  of common/virtual_region.c, which require declaration of __start___ex_table
  and __stop___ex_table.
---
 xen/arch/riscv/Kconfig               |  1 +
 xen/arch/riscv/Makefile              |  1 +
 xen/arch/riscv/extable.c             | 85 ++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/bug.h     |  2 +
 xen/arch/riscv/include/asm/extable.h | 58 +++++++++++++++++++
 xen/arch/riscv/setup.c               |  3 +
 xen/arch/riscv/traps.c               |  5 ++
 xen/arch/riscv/xen.lds.S             |  3 +
 xen/arch/x86/xen.lds.S               |  6 +-
 xen/include/xen/xen.lds.h            |  6 ++
 10 files changed, 165 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/riscv/extable.c
 create mode 100644 xen/arch/riscv/include/asm/extable.h

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 89876b32175d..a5e87c1757f7 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -4,6 +4,7 @@ config RISCV
 	select GENERIC_BUG_FRAME
 	select GENERIC_UART_INIT
 	select HAS_DEVICE_TREE_DISCOVERY
+	select HAS_EX_TABLE
 	select HAS_PMAP
 	select HAS_UBSAN
 	select HAS_VMAP
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index ffbd7062e214..04f02ad89cba 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -3,6 +3,7 @@ obj-y += cpufeature.o
 obj-y += domain.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
+obj-y += extable.o
 obj-y += imsic.o
 obj-y += intc.o
 obj-y += irq.o
diff --git a/xen/arch/riscv/extable.c b/xen/arch/riscv/extable.c
new file mode 100644
index 000000000000..882ae9508d19
--- /dev/null
+++ b/xen/arch/riscv/extable.c
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/init.h>
+#include <xen/bsearch.h>
+#include <xen/lib.h>
+#include <xen/livepatch.h>
+#include <xen/sort.h>
+#include <xen/virtual_region.h>
+
+#include <asm/extable.h>
+#include <asm/processor.h>
+
+#define EX_FIELD(ptr, field) ((unsigned long)&(ptr)->field + (ptr)->field)
+
+static inline unsigned long ex_insn(const struct exception_table_entry *ex)
+{
+    return EX_FIELD(ex, insn);
+}
+
+static inline unsigned long ex_fixup(const struct exception_table_entry *ex)
+{
+    return EX_FIELD(ex, fixup);
+}
+
+static void __init cf_check swap_ex(void *a, void *b)
+{
+    struct exception_table_entry *x = a, *y = b, tmp;
+    long delta = b - a;
+
+    tmp = *x;
+    x->insn = y->insn + delta;
+    y->insn = tmp.insn - delta;
+
+    x->fixup = y->fixup + delta;
+    y->fixup = tmp.fixup - delta;
+}
+
+static int cf_check cmp_ex(const void *a, const void *b)
+{
+    const unsigned long insn_a = ex_insn(a);
+    const unsigned long insn_b = ex_insn(b);
+
+    /* avoid overflow */
+    return (insn_a > insn_b) - (insn_a < insn_b);
+}
+
+void init_or_livepatch sort_exception_table(struct exception_table_entry *start,
+                                 const struct exception_table_entry *stop)
+{
+    sort(start, stop - start, sizeof(*start), cmp_ex, swap_ex);
+}
+
+void __init sort_exception_tables(void)
+{
+    sort_exception_table(__start___ex_table, __stop___ex_table);
+}
+
+static void ex_handler_fixup(const struct exception_table_entry *ex,
+                             struct cpu_user_regs *regs)
+{
+    regs->sepc = ex_fixup(ex);
+}
+
+bool fixup_exception(struct cpu_user_regs *regs)
+{
+    unsigned long pc = regs->sepc;
+    const struct virtual_region *region = find_text_region(pc);
+    const struct exception_table_entry *ex;
+    struct exception_table_entry key;
+
+    if ( !region || !region->ex )
+        return false;
+
+    key.insn = pc - (unsigned long)&key.insn;
+
+    ex = bsearch(&key, region->ex, region->ex_end - region->ex, sizeof(key),
+                 cmp_ex);
+
+    if ( !ex )
+        return false;
+
+    ex_handler_fixup(ex, regs);
+
+    return true;
+}
diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
index 6ec8adc528a9..e6f286881662 100644
--- a/xen/arch/riscv/include/asm/bug.h
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -9,6 +9,8 @@
 
 #ifndef __ASSEMBLER__
 
+#include <asm/extable.h>
+
 #define BUG_INSTR "unimp"
 
 /*
diff --git a/xen/arch/riscv/include/asm/extable.h b/xen/arch/riscv/include/asm/extable.h
new file mode 100644
index 000000000000..4f50f84e69f2
--- /dev/null
+++ b/xen/arch/riscv/include/asm/extable.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM__RISCV__ASM_EXTABLE_H
+#define ASM__RISCV__ASM_EXTABLE_H
+
+#ifdef __ASSEMBLER__
+
+#define ASM_EXTABLE(insn, fixup)    \
+    .pushsection .ex_table, "a";    \
+    .balign     4;                  \
+    .long       ((insn) - .);       \
+    .long       ((fixup) - .);      \
+    .popsection;
+
+.macro asm_extable, insn, fixup
+    ASM_EXTABLE(\insn, \fixup)
+.endm
+
+#else /* __ASSEMBLER__ */
+
+#include <xen/stringify.h>
+#include <xen/types.h>
+
+struct cpu_user_regs;
+
+#define ASM_EXTABLE(insn, fixup)        \
+    ".pushsection .ex_table, \"a\"\n"   \
+    ".balign    4\n"                    \
+    ".long      ((" #insn ") - .)\n"    \
+    ".long      ((" #fixup ") - .)\n"   \
+    ".popsection\n"
+
+/*
+ * The exception table consists of pairs of relative offsets: the first
+ * is the relative offset to an instruction that is allowed to fault,
+ * and the second is the relative offset at which the program should
+ * continue. No general-purpose registers are modified by the exception
+ * handling mechanism itself, so it is up to the fixup code to handle
+ * any necessary state cleanup.
+ *
+ * The exception table and fixup code live out of line with the main
+ * instruction path. This means when everything is well, we don't even
+ * have to jump over them. Further, they do not intrude on our cache or
+ * tlb entries.
+ */
+struct exception_table_entry {
+    int32_t insn, fixup;
+};
+
+extern struct exception_table_entry __start___ex_table[];
+extern struct exception_table_entry __stop___ex_table[];
+
+void sort_exception_tables(void);
+bool fixup_exception(struct cpu_user_regs *regs);
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* ASM__RISCV__ASM_EXTABLE_H */
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index cae49bb29626..56a0907a855f 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -19,6 +19,7 @@
 
 #include <public/version.h>
 
+#include <asm/extable.h>
 #include <asm/cpufeature.h>
 #include <asm/early_printk.h>
 #include <asm/fixmap.h>
@@ -81,6 +82,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     smp_prepare_boot_cpu();
 
+    sort_exception_tables();
+
     set_cpuid_to_hartid(0, bootcpu_id);
 
     trap_init();
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 326f2be62823..d35c013e1399 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -12,6 +12,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
+#include <asm/extable.h>
 #include <asm/cpufeature.h>
 #include <asm/intc.h>
 #include <asm/processor.h>
@@ -217,6 +218,10 @@ void do_trap(struct cpu_user_regs *cpu_regs)
 
             break;
         }
+
+        if ( fixup_exception(cpu_regs) )
+            break;
+
         fallthrough;
     default:
         if ( cause & CAUSE_IRQ_FLAG )
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 331a7d63d3c9..65f136dce9f7 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -74,6 +74,9 @@ SECTIONS
     .data.ro_after_init : {
         __ro_after_init_start = .;
         *(.data.ro_after_init)
+
+        EX_TABLE
+
         . = ALIGN(PAGE_SIZE);
         __ro_after_init_end = .;
     } : text
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index c326538ebbb2..b9e888e5962f 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -113,11 +113,7 @@ SECTIONS
        __ro_after_init_start = .;
        *(.data.ro_after_init)
 
-       . = ALIGN(8);
-       /* Exception table */
-       __start___ex_table = .;
-       *(.ex_table)
-       __stop___ex_table = .;
+       EX_TABLE
 
        . = ALIGN(PAGE_SIZE);
        __ro_after_init_end = .;
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 136849ecd515..ea11e3fb6213 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -219,4 +219,10 @@
 #define VPCI_ARRAY
 #endif
 
+#define EX_TABLE                  \
+        . = ALIGN(4);             \
+        __start___ex_table = .;   \
+        *(.ex_table)              \
+        __stop___ex_table = .;
+
 #endif /* __XEN_LDS_H__ */
-- 
2.53.0


