Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FDB2C3B5C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 09:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37459.69836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khqVq-0004Ca-QH; Wed, 25 Nov 2020 08:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37459.69836; Wed, 25 Nov 2020 08:50:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khqVq-0004C9-Mp; Wed, 25 Nov 2020 08:50:54 +0000
Received: by outflank-mailman (input) for mailman id 37459;
 Wed, 25 Nov 2020 08:50:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khqVp-0004C0-0c
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:50:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa96e47c-ac95-4a20-80ef-a7338010c0fd;
 Wed, 25 Nov 2020 08:50:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B11EAE49;
 Wed, 25 Nov 2020 08:50:51 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khqVp-0004C0-0c
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:50:53 +0000
X-Inumbo-ID: fa96e47c-ac95-4a20-80ef-a7338010c0fd
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fa96e47c-ac95-4a20-80ef-a7338010c0fd;
	Wed, 25 Nov 2020 08:50:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606294251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LsItoclm9UZflz8LqerEuyT3QzAOSbWBnrz1h3p2SlE=;
	b=S4y3k5bSM5ZUK6lymocUpyjo8fcTdX3tlaTaueT5xC6+8O5uTW8pVa8M/97/4CsK2VbEpu
	Jf2wBSMyUUCmifV5EN0p/UsFofwAD9h/p67R8mEvevmDhRNfUtOnvPZsn2Bq8MvHn8/91U
	s4tc0+7P0IFHInHK3FAz3JshwQVXB0M=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4B11EAE49;
	Wed, 25 Nov 2020 08:50:51 +0000 (UTC)
Subject: [PATCH 4/5] x86: hypercall vector is unused when !PV32
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
Message-ID: <6505bcc4-0cb3-42de-9fd5-50da133d6d99@suse.com>
Date: Wed, 25 Nov 2020 09:50:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This vector can be used as an ordinary interrupt handling one in this
case. To be sure no references are left, make the #define itself
conditional.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -436,8 +436,12 @@ int __init init_irq_data(void)
         irq_to_desc(irq)->irq = irq;
 
 #ifdef CONFIG_PV
-    /* Never allocate the hypercall vector or Linux/BSD fast-trap vector. */
+    /* Never allocate the Linux/BSD fast-trap vector. */
     set_bit(LEGACY_SYSCALL_VECTOR, used_vectors);
+#endif
+
+#ifdef CONFIG_PV32
+    /* Never allocate the hypercall vector. */
     set_bit(HYPERCALL_VECTOR, used_vectors);
 #endif
     
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -30,6 +30,7 @@
 #include <asm/traps.h>
 #include <irq_vectors.h>
 
+#ifdef CONFIG_PV32
 void do_entry_int82(struct cpu_user_regs *regs)
 {
     if ( unlikely(untrusted_msi) )
@@ -37,6 +38,7 @@ void do_entry_int82(struct cpu_user_regs
 
     pv_hypercall(regs);
 }
+#endif
 
 void pv_inject_event(const struct x86_event *event)
 {
@@ -155,9 +157,11 @@ static void nmi_softirq(void)
 
 void __init pv_trap_init(void)
 {
+#ifdef CONFIG_PV32
     /* The 32-on-64 hypercall vector is only accessible from ring 1. */
     _set_gate(idt_table + HYPERCALL_VECTOR,
               SYS_DESC_trap_gate, 1, entry_int82);
+#endif
 
     /* Fast trap for int80 (faster than taking the #GP-fixup path). */
     _set_gate(idt_table + LEGACY_SYSCALL_VECTOR, SYS_DESC_trap_gate, 3,
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -11,6 +11,8 @@
 #include <public/xen.h>
 #include <irq_vectors.h>
 
+#ifdef CONFIG_PV32
+
 ENTRY(entry_int82)
         ASM_CLAC
         pushq $0
@@ -27,6 +29,8 @@ ENTRY(entry_int82)
         mov   %rsp, %rdi
         call  do_entry_int82
 
+#endif /* CONFIG_PV32 */
+
 /* %rbx: struct vcpu */
 ENTRY(compat_test_all_events)
         ASSERT_NOT_IN_ATOMIC
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -982,8 +982,10 @@ autogen_stubs: /* Automatically generate
         .rept X86_NR_VECTORS
 
         /* Common interrupts, heading towards do_IRQ(). */
-#ifdef CONFIG_PV
+#if defined(CONFIG_PV32)
         .if vec >= FIRST_IRQ_VECTOR && vec != HYPERCALL_VECTOR && vec != LEGACY_SYSCALL_VECTOR
+#elif defined(CONFIG_PV)
+        .if vec >= FIRST_IRQ_VECTOR && vec != LEGACY_SYSCALL_VECTOR
 #else
         .if vec >= FIRST_IRQ_VECTOR
 #endif
--- a/xen/include/asm-x86/mach-default/irq_vectors.h
+++ b/xen/include/asm-x86/mach-default/irq_vectors.h
@@ -22,7 +22,10 @@
 #define FIRST_LEGACY_VECTOR     FIRST_DYNAMIC_VECTOR
 #define LAST_LEGACY_VECTOR      (FIRST_LEGACY_VECTOR + 0xf)
 
-#define HYPERCALL_VECTOR	0x82
+#ifdef CONFIG_PV32
+#define HYPERCALL_VECTOR        0x82
+#endif
+
 #define LEGACY_SYSCALL_VECTOR   0x80
 
 /*


