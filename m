Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id C2QELJhI1mkFDQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:22:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1E63BBF11
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275949.1561607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARvX-0004f2-W9; Wed, 08 Apr 2026 12:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275949.1561607; Wed, 08 Apr 2026 12:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARvX-0004c1-Sp; Wed, 08 Apr 2026 12:22:35 +0000
Received: by outflank-mailman (input) for mailman id 1275949;
 Wed, 08 Apr 2026 12:22:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wARvW-0004bv-Hv
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:22:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wARvV-008ck7-GF
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:22:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d64879-2eae-0a2a0a5409dd-0a2a450ab392-28
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:22:33 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d64889-ee98-0a2a450a0019-d155802ead89-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:22:33 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488a041eae5so32881585e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:22:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488a952a03asm306545885e9.0.2026.04.08.05.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 05:22:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775650953; x=1776255753; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VKAaggtmontqKYJrxM1/7VOgp7GYQIjiE3kyRKWFHUo=;
        b=IWQO+QGn+b/IPP5ChoSKSodFtg/++sQUfe00LdJe/uErJUf2uNSYJw9PV1K+nSkN2F
         Su+/MARSy+OOuY8IC3pVNq7WMULZTnlIHzApQ+Yz9iyFB9SgLZSmRGQYVxiNxlqp6NzM
         k1GoH1yenIiXy1HpaoOmiZIB1zkM34vKq5EaKPl0aKHJ9udqicWO+xFl4DSvgN+Inwui
         q/SE3BndR1WM7nP6jNEKT4ClxW5ndFq3K50qlTuz98FgvVRXQEAbyPsD9EGZf+MR+Giz
         KWiKsjvEw8NlRFn+Da7ZgCFsLnkzkm4qtfFoUS97x35irM8LIij9QfmjAPwmNz2todY3
         fFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775650953; x=1776255753;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKAaggtmontqKYJrxM1/7VOgp7GYQIjiE3kyRKWFHUo=;
        b=lo6xk5nQZ84T5l5iCPMNnMlAgRV8Ay83usHOr1HeufD3L4D1F/4xhOEeYDAHoC4AB5
         ANYnhj1jFe3DMiMCXJwbHMcRIXtiFWdjPyHGYG4Bpwx1VpTf4jZU1AYIrIbxvkMJEK1V
         Q6FvpkRN4cKqY+2WyOFwZ8QueCrB+Qw67ADeBDMziI09Z+TD7gVIXTirif5GgIDbBCMa
         8gu/A3I1300vYmCBv7CftBxSZZSOLFQVUVArQ+SiVDqGLDq3+YPIJxNpw9gkoJDVAdi9
         YwlydVMcaIhDJgj0phEqNH3rdVnFXa2FTMWjvIH3xqJzzEVzC6no9pwr2+IpjNtmzFSZ
         gs+Q==
X-Gm-Message-State: AOJu0Yz0cqNQway1JV0pGaIbqIzz152j2dqIS7qL8mU2+T7RruB3bKwm
	00Wn54XcqIQ9d2NRW2ozr7lLGPa9nGHSC4lVpiycaIVlHW/Vf0DJ/gu6SajYmfqMf+RJjvpGihR
	ZI9Lt8w==
X-Gm-Gg: AeBDietWlk9cQqDMZFBXNMwbj3jCDpZA8sewWkQDMV2UdOYyPFSs7eTvi1PCUqnFL+g
	mf12awkGmBGlhiFO/ZDlK3qp46LMgQR2O1Nx0ZqHdMboiGUEq3Eht+liG4lJZpuZtp4d/czu/gT
	+cuLz4IgDMVYOVlVqTuvAnRAAxDujZuR7K9PNSozToOPF7aovLgDPdQC8RJi1BAD1VIvxMUNQ2c
	smIrutaBd78LY9vmEKjycVzZ0L283Z7gXzcGdsa0cprrkPvQSAbHsbWcLUBOx8iPsWemisWNpM/
	CDMXkH1OxBHjNoDdnBODEpLF9byToXKpKdzcS5+8yPAvBlPu5iZ9DeuPsffSajvaLZJCfYJimn9
	J5odBsRqiHNDDkVw1Jy5kKg+8svwsrokJ3Fdr9jTw31FtAkFJ1qDv2nsvGq9CSNUhd34QJMTq/d
	/fKWOlP9nGtrcGJs+vFyoGi5Rvz9Y8NTpYS85V32NnFZgnPHmYOUohBQqb7yfoss+ib9Lt17+3W
	r7+xQ8yw4rE3K0=
X-Received: by 2002:a05:600c:1d1c:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-488997d0012mr278324835e9.21.1775650952724;
        Wed, 08 Apr 2026 05:22:32 -0700 (PDT)
Message-ID: <de873764-c803-4f56-b88a-936cb948c382@suse.com>
Date: Wed, 8 Apr 2026 14:22:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/3] x86: record SSP at non-guest entry points
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1775650953-0F9440B1-E8CC9AC6/0/0
X-purgate-type: clean
X-purgate-size: 6855
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0A1E63BBF11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We will want to use that value for call trace generation, and likely
also to eliminate the somewhat fragile shadow stack searching done in
fixup_exception_return(). For those purposes, guest-only entry points do
not need to record that value.

To keep the saving code simple, record our own SSP that corresponds to
an exception frame, pointing to the top of the shadow stack counterpart
of what the CPU has saved on the regular stack. Consuming code can then
work its way from there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
For PUSH_AND_CLEAR_GPRS and POP_GPRS, putting the new field right next to
the error code isn't entirely nice; putting it ahead of %r15 would entail
other changes, though. An option may be to not make SSP handling part of
the macros in the first place. Thoughts?

For POP_GPRS, does it really matter that it doesn't alter EFLAGS? Neither
of the two currene uses relies on it, and without that requirement we
could use ADD in place of LEA. (Of course there are also POP-based ways of
getting rid of the SSP slot.)
---
v2: Add comment ahead of SAVE_ALL. Add comma between its parameters.
    Re-base.

--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -103,7 +103,7 @@ __UNLIKELY_END(nsvm_hap)
 
         vmrun
 
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         GET_CURRENT(bx)
 
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -22,7 +22,7 @@
 #include <asm/page.h>
 
 FUNC(vmx_asm_vmexit_handler)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         mov  %cr2,%rax
         GET_CURRENT(bx)
@@ -171,7 +171,7 @@ UNLIKELY_END(realmode)
 
 .Lvmx_vmentry_fail:
         sti
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         /*
          * SPEC_CTRL_ENTRY notes
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -219,7 +219,11 @@ static always_inline void stac(void)
 #endif
 
 #ifdef __ASSEMBLER__
-.macro SAVE_ALL compat=0
+/*
+ * Use sites may override ssp to 0. It should never be overridden to 1.
+ * NB: compat=1 implies ssp=0.
+ */
+.macro SAVE_ALL compat=0, ssp=IS_ENABLED(CONFIG_XEN_SHSTK)
         addq  $-(UREGS_error_code-UREGS_r15), %rsp
         cld
         movq  %rdi,UREGS_rdi(%rsp)
@@ -233,6 +237,9 @@ static always_inline void stac(void)
         movq  %rax,UREGS_rax(%rsp)
         xor   %eax, %eax
 .if !\compat
+.if \ssp
+        rdsspq %rcx
+.endif
         movq  %r8,UREGS_r8(%rsp)
         movq  %r9,UREGS_r9(%rsp)
         movq  %r10,UREGS_r10(%rsp)
@@ -262,6 +269,9 @@ static always_inline void stac(void)
         xor   %r13d, %r13d
         xor   %r14d, %r14d
         xor   %r15d, %r15d
+#ifdef CONFIG_XEN_SHSTK
+        mov   %rcx, UREGS_entry_ssp(%rsp)
+#endif
 .endm
 
 #define LOAD_ONE_REG(reg, compat) \
@@ -313,9 +323,14 @@ static always_inline void stac(void)
 .endm
 
 /*
- * Push and clear GPRs
+ * Push and clear GPRs.
+ *
+ * Use sites may override ssp to 0. It should never be overridden to 1.
  */
-.macro PUSH_AND_CLEAR_GPRS
+.macro PUSH_AND_CLEAR_GPRS ssp=IS_ENABLED(CONFIG_XEN_SHSTK)
+#ifdef CONFIG_XEN_SHSTK
+        push  $0
+#endif
         push  %rdi
         xor   %edi, %edi
         push  %rsi
@@ -326,6 +341,9 @@ static always_inline void stac(void)
         xor   %ecx, %ecx
         push  %rax
         xor   %eax, %eax
+ .if \ssp
+        rdsspq %rcx
+ .endif
         push  %r8
         xor   %r8d, %r8d
         push  %r9
@@ -352,6 +370,9 @@ static always_inline void stac(void)
         xor   %r14d, %r14d
         push  %r15
         xor   %r15d, %r15d
+ .if \ssp
+        mov   %rcx, UREGS_entry_ssp(%rsp)
+ .endif
 .endm
 
 /*
@@ -373,6 +394,9 @@ static always_inline void stac(void)
         pop   %rdx
         pop   %rsi
         pop   %rdi
+#ifdef CONFIG_XEN_SHSTK
+        lea   8(%rsp), %rsp
+#endif
 .endm
 
 #ifdef CONFIG_PV32
--- a/xen/arch/x86/include/asm/cpu-user-regs.h
+++ b/xen/arch/x86/include/asm/cpu-user-regs.h
@@ -27,6 +27,15 @@ struct cpu_user_regs
     union { uint64_t rsi;    uint32_t esi;    uint16_t si;    uint8_t sil;  };
     union { uint64_t rdi;    uint32_t edi;    uint16_t di;    uint8_t dil;  };
 
+#ifdef CONFIG_XEN_SHSTK
+    /*
+     * This points _at_ the corresponding shadow stack frame; it is _not_ the
+     * outer context's SSP.  That, if the outer context has CET-SS enabled,
+     * is stored in the top slot of the pointed to shadow stack frame.
+     */
+    uint64_t entry_ssp;
+#endif
+
     /*
      * During IDT delivery for exceptions with an error code, hardware pushes
      * to this point.  Entry_vector is filled in by software.
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -53,6 +53,9 @@ void __dummy__(void)
     OFFSET(UREGS_eflags, struct cpu_user_regs, rflags);
     OFFSET(UREGS_rsp, struct cpu_user_regs, rsp);
     OFFSET(UREGS_ss, struct cpu_user_regs, ss);
+#ifdef CONFIG_XEN_SHSTK
+    OFFSET(UREGS_entry_ssp, struct cpu_user_regs, entry_ssp);
+#endif
     DEFINE(UREGS_kernel_sizeof, sizeof(struct cpu_user_regs));
     BLANK();
 
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -275,7 +275,7 @@ FUNC(lstar_enter)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         GET_STACK_END(14)
 
@@ -315,7 +315,7 @@ FUNC(cstar_enter)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         GET_STACK_END(14)
 
@@ -359,7 +359,7 @@ LABEL(sysenter_eflags_saved, 0)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         GET_STACK_END(14)
 
@@ -415,7 +415,7 @@ FUNC(entry_int80)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movb  $0x80, EFRAME_entry_vector(%rsp)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         GET_STACK_END(14)
 
--- a/xen/arch/x86/x86_64/entry-fred.S
+++ b/xen/arch/x86/x86_64/entry-fred.S
@@ -10,7 +10,7 @@
         /* The Ring3 entry point is required to be 4k aligned. */
 
 FUNC(entry_FRED_R3, 4096)
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
 
         mov     %rsp, %rdi
         call    entry_from_pv
@@ -38,7 +38,7 @@ LABEL(eretu, 0)
 END(eretu_exit_to_guest)
 
 FUNC(eretu_error_dom_crash)
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
         sti
         call    asm_domain_crash_synchronous  /* Does not return */
 END(eretu_error_dom_crash)


