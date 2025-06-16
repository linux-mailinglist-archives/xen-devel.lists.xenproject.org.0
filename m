Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FB7ADAB0C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016888.1393892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5UJ-0000DF-W1; Mon, 16 Jun 2025 08:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016888.1393892; Mon, 16 Jun 2025 08:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5UJ-0000As-S4; Mon, 16 Jun 2025 08:46:43 +0000
Received: by outflank-mailman (input) for mailman id 1016888;
 Mon, 16 Jun 2025 08:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR5UI-0007hV-U9
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:46:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c289f1f-4a8e-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 10:46:41 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C6B0A2118C;
 Mon, 16 Jun 2025 08:46:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90F76139E2;
 Mon, 16 Jun 2025 08:46:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EfPvIejZT2jpPwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 16 Jun 2025 08:46:32 +0000
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
X-Inumbo-ID: 6c289f1f-4a8e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2H0qWHO5jB15jbB7hAMsbxc9Fi6ipKfWjIbEbuSKCeQ=;
	b=NeAmfA7S9fIDRKkgzKVn9X+cNEBpZmm/+MEtqjZMNR0ycHN2YxdYXQXV/9y+Lfv54S0xAE
	j5zIC63cOCV0aSlTw/ITmkUpJXD7a6Cyuw55QtKa/TqWxoXs/JGgEFbKYxIR4zi42ZWZJQ
	foKRyKDHZL2eWOGt9ZtvtWu5PkQbzBE=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2H0qWHO5jB15jbB7hAMsbxc9Fi6ipKfWjIbEbuSKCeQ=;
	b=NeAmfA7S9fIDRKkgzKVn9X+cNEBpZmm/+MEtqjZMNR0ycHN2YxdYXQXV/9y+Lfv54S0xAE
	j5zIC63cOCV0aSlTw/ITmkUpJXD7a6Cyuw55QtKa/TqWxoXs/JGgEFbKYxIR4zi42ZWZJQ
	foKRyKDHZL2eWOGt9ZtvtWu5PkQbzBE=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH v2 02/12] Mini-OS: add final kexec stage
Date: Mon, 16 Jun 2025 10:46:09 +0200
Message-ID: <20250616084619.11112-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616084619.11112-1-jgross@suse.com>
References: <20250616084619.11112-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

Add the code and data definitions of the final kexec stage.

Put the code and related data into a dedicated section in order to be
able to copy it to another location. For this reason there must be no
absolute relocations being used in the code or data.

Being functionally related, add a function for adding a final kexec
action.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add ASSERT() to linker script (Jason Andryuk)
- fix asm() input/output parameter bug (Jason Andryuk)
---
 arch/x86/kexec.c          | 107 ++++++++++++++++++++++++++++++++++++++
 arch/x86/minios-x86.lds.S |   9 ++++
 arch/x86/x86_hvm.S        |  46 ++++++++++++++++
 include/kexec.h           |  27 ++++++++++
 include/x86/os.h          |   5 ++
 kexec.c                   |  22 ++++++++
 6 files changed, 216 insertions(+)
 create mode 100644 arch/x86/kexec.c

diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
new file mode 100644
index 00000000..a8a2fa97
--- /dev/null
+++ b/arch/x86/kexec.c
@@ -0,0 +1,107 @@
+/******************************************************************************
+ * kexec.c
+ *
+ * Support of kexec (reboot locally into new mini-os kernel).
+ *
+ * Copyright (c) 2024, Juergen Gross, SUSE Linux GmbH
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#ifdef CONFIG_KEXEC
+
+#include <mini-os/os.h>
+#include <mini-os/lib.h>
+#include <mini-os/kexec.h>
+
+/*
+ * Final stage of kexec. Copies all data to the final destinations, zeroes
+ * .bss and activates new kernel.
+ * Must be called with interrupts off. Stack, code and data must be
+ * accessible via identity mapped virtual addresses (virt == phys). Copying
+ * and zeroing is done using virtual addresses.
+ * No relocations inside the function are allowed, as it is copied to an
+ * allocated page before being executed.
+ */
+static void __attribute__((__section__(".text.kexec")))
+    kexec_final(struct kexec_action *actions, unsigned long real)
+{
+    char *src, *dest;
+    unsigned int a, cnt;
+
+    for ( a = 0; ; a++ )
+    {
+        switch ( actions[a].action )
+        {
+        case KEXEC_COPY:
+            dest = actions[a].dest;
+            src = actions[a].src;
+            for ( cnt = 0; cnt < actions[a].len; cnt++ )
+                *dest++ = *src++;
+            break;
+
+        case KEXEC_ZERO:
+            dest = actions[a].dest;
+            for ( cnt = 0; cnt < actions[a].len; cnt++ )
+                *dest++ = 0;
+            break;
+
+        case KEXEC_CALL:
+            asm("movl %0, %%ebx\n\t"
+                "movl %1, %%edi\n\t"
+                "jmp *%2"
+                : :"m" (actions[a].src), "m" (actions[a].dest), "m" (real));
+            break;
+        }
+    }
+}
+
+#define KEXEC_STACK_LONGS  8
+static unsigned long __attribute__((__section__(".data.kexec")))
+    kexec_stack[KEXEC_STACK_LONGS];
+
+static unsigned long get_kexec_addr(void *kexec_page, void *addr)
+{
+    unsigned long off = (unsigned long)addr - (unsigned long)_kexec_start;
+
+    return (unsigned long)kexec_page + off;
+}
+
+void do_kexec(void *kexec_page)
+{
+    unsigned long actions;
+    unsigned long stack;
+    unsigned long final;
+    unsigned long phys;
+
+    actions = get_kexec_addr(kexec_page, kexec_actions);
+    stack = get_kexec_addr(kexec_page, kexec_stack + KEXEC_STACK_LONGS);
+    final = get_kexec_addr(kexec_page, kexec_final);
+    phys = get_kexec_addr(kexec_page, kexec_phys);
+
+    memcpy(kexec_page, _kexec_start, KEXEC_SECSIZE);
+    asm("cli\n\t"
+        "mov %0, %%"ASM_SP"\n\t"
+        "mov %1, %%"ASM_ARG1"\n\t"
+        "mov %2, %%"ASM_ARG2"\n\t"
+        "jmp *%3"
+        : :"m" (stack), "m" (actions), "m" (phys), "m" (final));
+}
+
+#endif /* CONFIG_KEXEC */
diff --git a/arch/x86/minios-x86.lds.S b/arch/x86/minios-x86.lds.S
index 8aae2fd6..8a1db7d4 100644
--- a/arch/x86/minios-x86.lds.S
+++ b/arch/x86/minios-x86.lds.S
@@ -87,6 +87,15 @@ SECTIONS
 
         _edata = .;			/* End of data section */
 
+        . = ALIGN(8);
+        _kexec_start = .;		/* Kexec relocatable code/data */
+        .kexec : {
+                *(.text.kexec)
+                *(.data.kexec)
+        }
+        _kexec_end = .;
+        ASSERT(_kexec_end - _kexec_start <= 4096, "kexec code/data > 1 page")
+
         __bss_start = .;		/* BSS */
         .bss : {
                 *(.bss)
diff --git a/arch/x86/x86_hvm.S b/arch/x86/x86_hvm.S
index 42a5f02e..e2f82e96 100644
--- a/arch/x86/x86_hvm.S
+++ b/arch/x86/x86_hvm.S
@@ -85,4 +85,50 @@ page_table_l2:
 #endif
         .align __PAGE_SIZE, 0
 
+#ifdef CONFIG_KEXEC
+.section .text.kexec, "ax", @progbits
+
+/*
+ * Switch off paging and call new OS for kexec.
+ * %ebx holds the physical address of the start_info structure
+ * %edi holds the physical address of the entry point to call
+ */
+.globl kexec_phys
+kexec_phys:
+        /* Set DS, ES, SS to 0...ffffffff. */
+        mov $(GDTE_DS32_DPL0 * 8), %eax
+        mov %eax, %ds
+        mov %eax, %es
+        mov %eax, %ss
+
+#ifdef __x86_64__
+        /* Switch to 32-bit mode. */
+        pushq $(GDTE_CS32_DPL0 * 8)
+        lea cs32_switch(%rip),%edx
+        push %rdx
+        lretq
+
+        .code32
+cs32_switch:
+#endif
+        /* Set %cr0 and %cr4 (disables paging). */
+        mov $X86_CR0_PE, %eax
+        mov %eax, %cr0
+        mov $0, %eax
+        mov %eax, %cr4
+#ifdef __x86_64__
+        /* Disable 64-bit mode. */
+        mov $MSR_EFER, %ecx
+        rdmsr
+        btr $_EFER_LME, %eax
+        wrmsr
+#endif
+
+        jmp *%edi
+
+#ifdef __x86_64__
+        .code64
+#endif
+#endif /* CONFIG_KEXEC */
+
 .text
diff --git a/include/kexec.h b/include/kexec.h
index 6fd96774..722be456 100644
--- a/include/kexec.h
+++ b/include/kexec.h
@@ -1,7 +1,34 @@
 #ifndef _KEXEC_H
 #define _KEXEC_H
 
+/* One element of kexec actions (last element must have action KEXEC_CALL): */
+struct kexec_action {
+    enum {
+        KEXEC_COPY,   /* Copy len bytes from src to dest. */
+        KEXEC_ZERO,   /* Zero len bytes at dest. */
+        KEXEC_CALL    /* Call dest with paging turned off, param is src. */
+    } action;
+    unsigned int len;
+    void *dest;
+    void *src;
+};
+
+#define KEXEC_MAX_ACTIONS  16
+
+extern char _kexec_start[], _kexec_end[];
+extern struct kexec_action kexec_actions[KEXEC_MAX_ACTIONS];
+
+int kexec_add_action(int action, void *dest, void *src, unsigned int len);
+
+#define KEXEC_SECSIZE ((unsigned long)_kexec_end - (unsigned long)_kexec_start)
+
 int kexec(void *kernel, unsigned long kernel_size,
           const char *cmdline);
 
+/* Initiate final kexec stage. */
+void do_kexec(void *kexec_page);
+
+/* Assembler code for switching off paging and passing execution to new OS. */
+void kexec_phys(void);
+
 #endif /* _KEXEC_H */
diff --git a/include/x86/os.h b/include/x86/os.h
index 0095be13..8a057d81 100644
--- a/include/x86/os.h
+++ b/include/x86/os.h
@@ -27,6 +27,7 @@
 #define MSR_EFER          0xc0000080
 #define _EFER_LME         8             /* Long mode enable */
 
+#define X86_CR0_PE        0x00000001    /* Protected mode enable */
 #define X86_CR0_WP        0x00010000    /* Write protect */
 #define X86_CR0_PG        0x80000000    /* Paging */
 #define X86_CR4_PAE       0x00000020    /* enable physical address extensions */
@@ -64,9 +65,13 @@
 #if defined(__i386__)
 #define __SZ    "l"
 #define __REG   "e"
+#define ASM_ARG1 "eax"
+#define ASM_ARG2 "edx"
 #else
 #define __SZ    "q"
 #define __REG   "r"
+#define ASM_ARG1 "rdi"
+#define ASM_ARG2 "rsi"
 #endif
 
 #define ASM_SP  __REG"sp"
diff --git a/kexec.c b/kexec.c
index 7fcc5c6b..b69e145b 100644
--- a/kexec.c
+++ b/kexec.c
@@ -58,3 +58,25 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
     return ENOSYS;
 }
 EXPORT_SYMBOL(kexec);
+
+struct kexec_action __attribute__((__section__(".data.kexec")))
+    kexec_actions[KEXEC_MAX_ACTIONS];
+static unsigned int act_idx;
+
+int kexec_add_action(int action, void *dest, void *src, unsigned int len)
+{
+    struct kexec_action *act;
+
+    if ( act_idx == KEXEC_MAX_ACTIONS )
+        return -ENOSPC;
+
+    act = kexec_actions + act_idx;
+    act_idx++;
+
+    act->action = action;
+    act->len = len;
+    act->dest = dest;
+    act->src = src;
+
+    return 0;
+}
-- 
2.43.0


