Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PfqbDxzLS2p6aQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:34:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9005712A83
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:34:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=C+kXMHjB;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355441.1610237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglKz-0001c1-Tj; Mon, 06 Jul 2026 15:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355441.1610237; Mon, 06 Jul 2026 15:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglKz-0001Zp-Q8; Mon, 06 Jul 2026 15:34:25 +0000
Received: by outflank-mailman (input) for mailman id 1355441;
 Mon, 06 Jul 2026 15:34:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wglKy-0001H7-0t
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:34:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wglKx-000YCn-Ds
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:34:23 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4bcafc-5cb7-0a2a0a5109dd-0a2a4507a422-10
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:34:23 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4bcaff-9c8e-0a2a45070019-d155802cac51-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:34:23 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-493b6f1b14bso12808335e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:34:23 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63bfba1sm433726505e9.15.2026.07.06.08.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:34:21 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1783352063; x=1783956863; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGuAPt56hrdactPgDfC0/MnL6+HEGuvGVBAIpjdl8Bg=;
        b=C+kXMHjBzNqWr5Di+/OAr7z7Yx2gFIGYbnUUxXk75/bLXNMZjlsUczRAtL2EzTfMT1
         DHcpmoJkMdQ/NafDLRwgi9ZIRZRx25x6kQbo7TQR7bKuw1gdEaUV1yvQFDGUkGUv3CrI
         fBs9aRAjGj8WwIeVsEF+5jNzqztcT2sYDg9lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352063; x=1783956863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tGuAPt56hrdactPgDfC0/MnL6+HEGuvGVBAIpjdl8Bg=;
        b=Cf1lEPxWq0+aYP09H1GVa97l8I8OhhQQE0N1zY+gWG3JHNgdAMOrnrQMn19hk0xe7I
         DsSaglQG5w9015qzgXZ5gr3V5s9QjVKwR1R4ELJlC0brMEYmGGzECW/+cf41ibDZ6DmO
         u2xQYcEmDzntHSCK8IhaiYdxO5rsEHeTtk+pu30yfhKzWDvsqUYBC5t5aEXUfy011t4q
         CxtT7i4XC6MSuhWaWtVt/X5glJ+SbP3UlLA1Ph63jhlY+JIkTuHb3Efd8bMGaf6qVq/H
         fYxbMYfW+b1t5+ii0XpqCnDv7bA4SBs1EOTAv+YzWR3O1FVLnh19GrCGr2ja1V6/FsmK
         t+hg==
X-Gm-Message-State: AOJu0YwYWEtxeRkLyl5Fbi9KbrMLlVvvSKVYvlpD1UYZVj7moFASnVs2
	ng4uppaPhF98Xkn6nINFurvVAb6Mp4RRZaVSvraZvTQZVwjUFNcunBMV/lS2Uy5yfWoxYpX7EAF
	h3c/k
X-Gm-Gg: AfdE7clR7rjEkECHTx4Kab+oZwDvYki10UzOKI+nRSdIyJMOC+Tq57VLatwk+KFX8m4
	GaY8c6vIfKOYcEpd/ho4yR8/rvobAKmDqr4HwyQiZrNCcj4glZOVoz7SCeZK0YellLTHrPUlh9/
	9x0FnkXLzP41BpL5ktT5ugj2GNPBkLV+jqe2piKXVBdFR04zJezJnGYFPHryxz9aB9r/ZxFodil
	HupLLAu+sVr4+dhPddeaWuqQoaDVr8mFKJCARVXv9OBxdln3xay1SXyzq78TTG5tD8IBYL6nSYl
	D7iFaFYBQYMFe4oXafAa1Ewm7MmLIB+DtYbibQrppTLoOjACP2zJedjGKTuU6pVCM639jhyYEv4
	5WV//9YdWPZIv/xReLuxcvTrBrmGZlO0nmN/baggfN5kOKdrjcLR/vJQmpinHp+jtSsK6OoJ4/l
	c9arqMsf3jjvp178gPfEgiwO2/kNZpAUXryHcJoE+KQcaKX5gkRFFfaC9QyzUhNio=
X-Received: by 2002:a05:600c:6c07:b0:493:bc4a:9547 with SMTP id 5b1f17b1804b1-493df0a08dcmr8960075e9.39.1783352062251;
        Mon, 06 Jul 2026 08:34:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 3/3] x86/entry: Use PUSH_AND_CLEAR_GPRS and drop SAVE_ALL
Date: Mon,  6 Jul 2026 16:34:15 +0100
Message-Id: <20260706153415.1264750-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260706153415.1264750-1-andrew.cooper3@citrix.com>
References: <20260706153415.1264750-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1783352063-FCF2D25E-888F2648/0/0
X-purgate-type: clean
X-purgate-size: 6974
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:from_mime,citrix.com:email,citrix.com:mid,citrix.com:dkim,suse.com:email,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9005712A83

PUSH_AND_CLEAR_GPRS is shorter than SAVE_ALL in terms of emitted code.

lstar_enter() and cstar_enter() do not need CLD.  The SYSCALL instruction
sanitises flags based on MSR_SYSCALL_MASK.  For all other cases, place the CLD
instruction next to STAC/CLAC so the flag handling is together.

Get rid of the compat=1 special case for PV32.  It's not obviously a win, and
PV32 is getting increasingly rare these days.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

Bloat-o-meter reports:
  add/remove: 0/0 grow/shrink: 0/12 up/down: 0/-518 (-518)
  Function                                     old     new   delta
  symbols_names                             135277  135276      -1
  symbols_offsets                            53664   53660      -4
  entry_int82                                  229     213     -16
  sysenter_entry                               383     328     -55
  handle_ist_exception                         450     395     -55
  handle_exception                             683     628     -55
  entry_int80                                  432     377     -55
  entry_DF                                     294     239     -55
  early_page_fault                             139      84     -55
  common_interrupt                             327     272     -55
  lstar_enter                                  322     266     -56
  cstar_enter                                  323     267     -56
---
 xen/arch/x86/include/asm/asm_defns.h | 45 ----------------------------
 xen/arch/x86/x86_64/compat/entry.S   |  3 +-
 xen/arch/x86/x86_64/entry.S          | 25 ++++++++++------
 3 files changed, 18 insertions(+), 55 deletions(-)

diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index d1b80186c14c..6c65acd08366 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -219,51 +219,6 @@ static always_inline void stac(void)
 #endif
 
 #ifdef __ASSEMBLER__
-.macro SAVE_ALL compat=0
-        addq  $-(UREGS_error_code-UREGS_r15), %rsp
-        cld
-        movq  %rdi,UREGS_rdi(%rsp)
-        xor   %edi, %edi
-        movq  %rsi,UREGS_rsi(%rsp)
-        xor   %esi, %esi
-        movq  %rdx,UREGS_rdx(%rsp)
-        xor   %edx, %edx
-        movq  %rcx,UREGS_rcx(%rsp)
-        xor   %ecx, %ecx
-        movq  %rax,UREGS_rax(%rsp)
-        xor   %eax, %eax
-.if !\compat
-        movq  %r8,UREGS_r8(%rsp)
-        movq  %r9,UREGS_r9(%rsp)
-        movq  %r10,UREGS_r10(%rsp)
-        movq  %r11,UREGS_r11(%rsp)
-.endif
-        xor   %r8d, %r8d
-        xor   %r9d, %r9d
-        xor   %r10d, %r10d
-        xor   %r11d, %r11d
-        movq  %rbx,UREGS_rbx(%rsp)
-        xor   %ebx, %ebx
-        movq  %rbp,UREGS_rbp(%rsp)
-#ifdef CONFIG_FRAME_POINTER
-/* Indicate special exception stack frame by inverting the frame pointer. */
-        leaq  UREGS_rbp(%rsp), %rbp
-        notq  %rbp
-#else
-        xor   %ebp, %ebp
-#endif
-.if !\compat
-        movq  %r12,UREGS_r12(%rsp)
-        movq  %r13,UREGS_r13(%rsp)
-        movq  %r14,UREGS_r14(%rsp)
-        movq  %r15,UREGS_r15(%rsp)
-.endif
-        xor   %r12d, %r12d
-        xor   %r13d, %r13d
-        xor   %r14d, %r14d
-        xor   %r15d, %r15d
-.endm
-
 /*
  * Push and clear GPRs
  */
diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index 4bf4ee7c944c..2503a973ffc2 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -13,10 +13,11 @@
 
 FUNC(entry_int82)
         ENDBR64
+        cld
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movb  $HYPERCALL_VECTOR, EFRAME_entry_vector(%rsp)
-        SAVE_ALL compat=1 /* DPL1 gate, restricted to 32bit PV guests only. */
+        PUSH_AND_CLEAR_GPRS
 
         GET_STACK_END(14)
 
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index cd3532d7d174..22729b1f43b8 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -305,7 +305,7 @@ FUNC(lstar_enter)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        SAVE_ALL
+        PUSH_AND_CLEAR_GPRS
 
         GET_STACK_END(14)
 
@@ -345,7 +345,7 @@ FUNC(cstar_enter)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        SAVE_ALL
+        PUSH_AND_CLEAR_GPRS
 
         GET_STACK_END(14)
 
@@ -383,13 +383,14 @@ FUNC(sysenter_entry)
         pushq $0
         pushfq
 LABEL(sysenter_eflags_saved, 0)
+        cld
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $3 /* ring 3 null cs */
         pushq $0 /* null rip */
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        SAVE_ALL
+        PUSH_AND_CLEAR_GPRS
 
         GET_STACK_END(14)
 
@@ -442,10 +443,11 @@ END(sysenter_entry)
 
 FUNC(entry_int80)
         ENDBR64
+        cld
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movb  $0x80, EFRAME_entry_vector(%rsp)
-        SAVE_ALL
+        PUSH_AND_CLEAR_GPRS
 
         GET_STACK_END(14)
 
@@ -722,8 +724,9 @@ END(ret_from_intr)
         .section .init.text, "ax", @progbits
 FUNC(early_page_fault)
         ENDBR64
+        cld
         movb  $X86_EXC_PF, EFRAME_entry_vector(%rsp)
-        SAVE_ALL
+        PUSH_AND_CLEAR_GPRS
         movq  %rsp, %rdi
         call  do_early_page_fault
         jmp   restore_all_xen
@@ -769,8 +772,9 @@ UNLIKELY_END(exit_cr3)
 END(restore_all_xen)
 
 FUNC(common_interrupt)
+        cld
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
-        SAVE_ALL
+        PUSH_AND_CLEAR_GPRS
 
         GET_STACK_END(14)
 
@@ -805,8 +809,9 @@ FUNC(entry_PF)
 END(entry_PF)
 /* No special register assumptions. */
 FUNC(handle_exception, 0)
+        cld
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
-        SAVE_ALL
+        PUSH_AND_CLEAR_GPRS
 
         GET_STACK_END(14)
 
@@ -1103,9 +1108,10 @@ END(entry_CP)
 FUNC(entry_DF)
         ENDBR64
         movb  $X86_EXC_DF, EFRAME_entry_vector(%rsp)
+        cld
         /* Set AC to reduce chance of further SMAP faults */
         ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
-        SAVE_ALL
+        PUSH_AND_CLEAR_GPRS
 
         GET_STACK_END(14)
 
@@ -1132,8 +1138,9 @@ FUNC(entry_NMI)
 END(entry_NMI)
 
 FUNC(handle_ist_exception)
+        cld
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
-        SAVE_ALL
+        PUSH_AND_CLEAR_GPRS
 
         GET_STACK_END(14)
 
-- 
2.39.5


