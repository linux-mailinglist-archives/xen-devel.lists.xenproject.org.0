Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMf8LhE/tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:45:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D4F28755B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254117.1550102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15d6-0004OE-DR; Fri, 13 Mar 2026 16:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254117.1550102; Fri, 13 Mar 2026 16:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15d6-0004Ln-9J; Fri, 13 Mar 2026 16:44:52 +0000
Received: by outflank-mailman (input) for mailman id 1254117;
 Fri, 13 Mar 2026 16:44:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p3qR=BN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w15d4-0004GG-OC
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:44:50 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2a23535-1efb-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:44:48 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-661b16ac011so4257325a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 09:44:48 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66350b86008sm1394733a12.28.2026.03.13.09.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 09:44:46 -0700 (PDT)
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
X-Inumbo-ID: f2a23535-1efb-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420287; x=1774025087; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfsWIAex3jEpm8GQ6vF4++T74O/B/5LjYy46X+zBd0E=;
        b=CC7GYogW2mcvpVF9v+qXkIgNbWXtWjm/LXSnMAHo5Qr5DyQQDsyyFufada7WvyZJBz
         O8g1uNNl6VVvSrhl9obFNJQqw6sQ6pqYMx5QLe3JU5bRxJGSmSjCOc3XMgkAl6kAAd4/
         MelV/nsty13qKMAs/VWUxR1hNltNFU2gec6vAW06fRDq+hPujeoUPAVG9MOP+FkFgrxX
         +XjWP/G1nkcUBSz4CoqfA1t3UxwxL+AtRvUqfA+v+2VdeFttiNeebvXtM9KTsUG9d+59
         +uU78SQaGogLw6XO10fHIXHyYD3HEHh18wnDb13J3ZVOPcrRp8a33BK1nYv2ERd8jHpF
         cSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420287; x=1774025087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yfsWIAex3jEpm8GQ6vF4++T74O/B/5LjYy46X+zBd0E=;
        b=I5fxY3N8SBLCVxj6XtiUKIsd0vqNepLNZWKfU1jqdofcEllAHWllk5k0DouUHmARrI
         Z/f9cGJLxQ5kE7AKPZCmtuNm+flMp9DRyrYIoKy1epRzqgG1x6hjlNDtfcyKTf1kmzTF
         B7d4FMczzu95zRVxPIrXZTnqKDAxNsHgiug58zZyMzC0eRm4wcl1oy/icMD7QFPlRQiJ
         p+IlrcNoTYOLGJs5ocTKe1e+qQIVK3YWr69UDbLKAlL2eQ7UzQsm9ORRgTdy8/uy1D2T
         7VF6x2Emwh3lorxWqRw9qNG4oikI7Q6Q1ejjUCfNOUJgoEKd1pbyAMzD/IOisr3ksqQd
         qHsA==
X-Gm-Message-State: AOJu0YxvYQi/P6hQZs/fdwwha2RpBvYeJ+F/26lyJJvcfVH8VwTDb7nv
	y7wBl4Kpk2cS9hALfEsEUT4n0caPScVhEXc3KoiSKnuBzxd3qGWR6wEsJ9vfZQ==
X-Gm-Gg: ATEYQzxgIKCa/Nv3rEadHEnoukAvuAyrPF36xxEzuUilUY+xn1ykHybXwQ9M3qfwIaf
	qStV8/CR8PVRcR9EjhdHPwAqJClqOcwSLt9kSyDJckm18HkiUW36MPqnw1ONfexuXjQFdRyDo98
	Of4KQJJuZ0bTh5zGochPX3D4VB4AML/sjbmx3fOnA0ftzyg5EGI4MKywZcbp6zYCwLt14jwBNHO
	1w901QwH8Ygfn77Uk/c59grqLlHD2kuteVVllbwiNXF+29nDu1NdYc9OWZ8MDHyw94RyulJFbRB
	jGXZlPI7vH47jeBUA/338lbBjlGVIDwmul4XqQWJCr014uxbX8SQdGJr66rOzzBD0X53GtkwSfh
	3JWHfi5gWAAGdeEWFyrX1QTcIwIC3PwABKaas+VADkzm1nX0QI0YNmrmLdv1ldhjE4gWY8jwyPo
	57hWBe6dFiyBBpkKihIkLE9H6gNzyQRZ5K/rEqcxieH4eFISQ5pot17d5QsV/uaCKGKg==
X-Received: by 2002:a05:6402:5414:b0:659:5c63:e103 with SMTP id 4fb4d7f45d1cf-663ba9b6e96mr2330711a12.11.1773420287152;
        Fri, 13 Mar 2026 09:44:47 -0700 (PDT)
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
Subject: [PATCH v1 1/4] xen/riscv: add exception table support
Date: Fri, 13 Mar 2026 17:44:35 +0100
Message-ID: <c6d30625371d56bb8345c987ac6d8095cc7301d2.1773419622.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773419622.git.oleksii.kurochko@gmail.com>
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 74D4F28755B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce exception table handling for RISC-V so faults from selected
instructions can be recovered via fixup handlers instead of being
treated as fatal.

Add the RISC-V exception table format, sorting at boot to allow binary
search used furthuer, and lookup from the trap handler. Update the
linker script to emit the .ex_table section using introduced common
EX_TABLE macro shared with other architectures.

Also, the __start___ext_table is aligned now by POINTER_ALIGN instead
of just using hard-coded 8 as there is no too much sense to align
__start___ext_table by 8 for 32-bit systems.

This implementation is based on Linux 6.16.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Open question:

With some renaming the following could be generic, at least, between
x86 and RISC-V:
 - ASM_EXTABLE() definition
 - All what is conencted with sort_extable().
 - With some change of how x86 searchs an extension this cmp_ex_search()
   could also go to common file.

Does it make sense to introduce xen/extable.h and common/extable.c?
---
 xen/arch/riscv/Kconfig                |  1 +
 xen/arch/riscv/Makefile               |  1 +
 xen/arch/riscv/extables.c             | 85 +++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/extables.h | 72 +++++++++++++++++++++++
 xen/arch/riscv/setup.c                |  3 +
 xen/arch/riscv/traps.c                |  3 +
 xen/arch/riscv/xen.lds.S              |  3 +
 xen/arch/x86/xen.lds.S                |  6 +-
 xen/include/xen/xen.lds.h             | 10 ++++
 9 files changed, 179 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/riscv/extables.c
 create mode 100644 xen/arch/riscv/include/asm/extables.h

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
index ffbd7062e214..6b3f3ed90bdb 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -3,6 +3,7 @@ obj-y += cpufeature.o
 obj-y += domain.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
+obj-$(CONFIG_HAS_EX_TABLE) += extables.o
 obj-y += imsic.o
 obj-y += intc.o
 obj-y += irq.o
diff --git a/xen/arch/riscv/extables.c b/xen/arch/riscv/extables.c
new file mode 100644
index 000000000000..5e6e453ead29
--- /dev/null
+++ b/xen/arch/riscv/extables.c
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/init.h>
+#include <xen/bsearch.h>
+#include <xen/lib.h>
+#include <xen/sort.h>
+#include <xen/virtual_region.h>
+
+#include <asm/extables.h>
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
+    int delta = b - a;
+
+    tmp = *x;
+    x->insn = y->insn + delta;
+    y->insn = tmp.insn - delta;
+
+    x->fixup = y->fixup + delta;
+    y->fixup = tmp.fixup - delta;
+}
+
+static int __init cf_check cmp_ex_sort(const void *a, const void *b)
+{
+    const unsigned long l = ex_insn(a);
+    const unsigned long r = ex_insn(b);
+
+    /* avoid overflow */
+    return (l > r) - (l < r);
+}
+
+void __init sort_extable(void)
+{
+    sort(__start___ex_table,  __stop___ex_table - __start___ex_table,
+         sizeof(struct exception_table_entry), cmp_ex_sort, swap_ex);
+}
+
+static int cf_check cmp_ex_search(const void *key, const void *elt)
+{
+    const unsigned long k = *(const unsigned long *)key;
+    const unsigned long insn = ex_insn(elt);
+
+    /* avoid overflow */
+    return (k > insn) - (k < insn);
+}
+
+static bool ex_handler_fixup(const struct exception_table_entry *ex,
+			                 struct cpu_user_regs *regs)
+{
+	regs->sepc = ex_fixup(ex);
+
+	return true;
+}
+
+bool fixup_exception(struct cpu_user_regs *regs)
+{
+    unsigned long pc = regs->sepc;
+    const struct virtual_region *region = find_text_region(pc);
+    const struct exception_table_entry *ex;
+
+    if ( !region || !region->ex )
+        return false;
+
+    ex = bsearch(&pc, region->ex, region->ex_end - region->ex,
+                 sizeof(struct exception_table_entry), cmp_ex_search);
+
+    if ( !ex )
+        return false;
+
+    return ex_handler_fixup(ex, regs);
+}
diff --git a/xen/arch/riscv/include/asm/extables.h b/xen/arch/riscv/include/asm/extables.h
new file mode 100644
index 000000000000..139764f3808d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/extables.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM__RISCV__ASM_EXTABLES_H
+#define ASM__RISCV__ASM_EXTABLES_H
+
+#ifdef __ASSEMBLER__
+
+#define ASM_EXTABLE(insn, fixup)    \
+    .pushsection .ex_table, "a";    \
+    .balign     4;                  \
+    .long		((insn) - .);       \
+    .long		((fixup) - .);      \
+    .popsection;
+.endm
+
+#else /* __ASSEMBLER__ */
+
+#include <xen/bug.h>
+#include <xen/stringify.h>
+
+struct cpu_user_regs;
+
+#define ASM_EXTABLE(insn, fixup)        \
+    ".pushsection .ex_table, \"a\"\n"   \
+    ".balign    4\n"                    \
+    ".long      ((" #insn ") - .)\n"     \
+    ".long      ((" #fixup ") - .)\n"    \
+    ".popsection\n"
+
+/*
+ * The exception table consists of pairs of relative offsets: the first
+ * is the relative offset to an instruction that is allowed to fault,
+ * and the second is the relative offset at which the program should
+ * continue. No registers are modified, so it is entirely up to the
+ * continuation code to figure out what to do.
+ *
+ * All the routines below use bits of fixup code that are out of line
+ * with the main instruction path.  This means when everything is well,
+ * we don't even have to jump over them.  Further, they do not intrude
+ * on our cache or tlb entries.
+ */
+struct exception_table_entry {
+	int32_t insn, fixup;
+};
+
+extern struct exception_table_entry __start___ex_table[];
+extern struct exception_table_entry __stop___ex_table[];
+
+#ifdef CONFIG_HAS_EX_TABLE
+
+void sort_extable(void);
+bool fixup_exception(struct cpu_user_regs *regs);
+
+#else /* CONFIG_HAS_EX_TABLE */
+
+static inline void sort_extable(void)
+{
+    printk("%s: We don't support .ex_table\n", __func__);
+}
+
+static inline bool fixup_exception(struct cpu_user_regs *regs)
+{
+    dprintk("%s: We don't support .ex_table\n", __func__);
+
+    return false;
+}
+
+#endif /* CONFIG_HAS_EX_TABLE */
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* ASM__RISCV__ASM_EXTABLES_H */
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index cae49bb29626..4be6aa5a434e 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -19,6 +19,7 @@
 
 #include <public/version.h>
 
+#include <asm/extables.h>
 #include <asm/cpufeature.h>
 #include <asm/early_printk.h>
 #include <asm/fixmap.h>
@@ -81,6 +82,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     smp_prepare_boot_cpu();
 
+    sort_extable();
+
     set_cpuid_to_hartid(0, bootcpu_id);
 
     trap_init();
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 326f2be62823..242af0a7a5f3 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -12,6 +12,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
+#include <asm/extables.h>
 #include <asm/cpufeature.h>
 #include <asm/intc.h>
 #include <asm/processor.h>
@@ -217,6 +218,8 @@ void do_trap(struct cpu_user_regs *cpu_regs)
 
             break;
         }
+        else if ( fixup_exception(cpu_regs) )
+            break;
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
index 136849ecd515..85800f942aae 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -219,4 +219,14 @@
 #define VPCI_ARRAY
 #endif
 
+#ifdef CONFIG_HAS_EX_TABLE
+#define EX_TABLE                  \
+        . = ALIGN(POINTER_ALIGN); \
+        __start___ex_table = .;   \
+        *(.ex_table)              \
+        __stop___ex_table = .;
+#else
+#define EX_TABLE
+#endif
+
 #endif /* __XEN_LDS_H__ */
-- 
2.53.0


