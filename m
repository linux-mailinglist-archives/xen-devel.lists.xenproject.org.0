Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fCHlH6ZDRmqUNAsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 12:55:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C736F644D
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 12:55:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=PmLNavic;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351643.1608756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfF4o-0004ob-9j; Thu, 02 Jul 2026 10:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351643.1608756; Thu, 02 Jul 2026 10:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfF4o-0004li-5a; Thu, 02 Jul 2026 10:55:26 +0000
Received: by outflank-mailman (input) for mailman id 1351643;
 Thu, 02 Jul 2026 10:55:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfF4l-0004id-Vd
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 10:55:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfF4l-005SNi-Bz
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 12:55:23 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a464398-bab6-0a2a0a5309dd-0a2a4507b412-24
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:55:23 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a46439b-9c8e-0a2a45070019-d155dd2dace7-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:55:23 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47122683cf3so1234215f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 03:55:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477ddf0f310sm7709053f8f.31.2026.07.02.03.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 03:55:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1782989722; x=1783594522; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LVZ9L1TPFh7mEp2xecv7V5O5RSUvEp2Ng8R7qCS66ME=;
        b=PmLNavicnZHp8i3D+d8nIzbEowiVuG2MUXaJiMrxQtk7cuWHYWWXkpvHH4BUgN9dW7
         Kx23DbEk+wq91PGnjxwYLos+biErTJa91Kb4psDd7GM4NHk0GB9wF4dtxCe7FjR3bd0I
         OH6uFLfWB26eb+lEUbTxH7ocpeYu1GG2QFpV3w4s6cy6mVmYAcLGXLx0GjUNGKaoHLEm
         ZeJNrB3mcc3pYmdKryyWany7OfX26vS8wAnBjXe1zS+f9/rrCYKwd9QHVjNHJKhI+Zjj
         BmI7kPRbSq+M/U8PLfetVLVRiGBiVgkedGpaHek+lw28RehDL6HO85stcRP78AcNbCD8
         ksdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989722; x=1783594522;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVZ9L1TPFh7mEp2xecv7V5O5RSUvEp2Ng8R7qCS66ME=;
        b=cyahNBXJv6Abm+x+64YIL8+7fnDX5S1pOrFe+WTOAe7L+ZbUH4ya9zIunSWtRLIt9D
         XPNQ0PL7jMYQ4ie6Cwxj57SJXneY3U0VaIs4GYrUkUlEczpe2PxNgHx6NhYoEQJ6Vcdk
         qa3p3slzmJT0Is67GVmjdfWTJP8awr6zEX9h5i1QWA2YEjApv5o5JeJTSay/ri3rVlm5
         siEg7FtydwWTYAL1Sv2LN6UFH1EE+9x0xLSJMQ7CCSAn+O2zJUmLgsZMDqtB+k5yTwvZ
         nge/c1FE7tf2Ot8IJoEI/dEMR/BH/U5Rpbz+ems+E6PA9mp0eA3WRGMj9j8pdtCyEVRU
         CrnQ==
X-Gm-Message-State: AOJu0YxyNCq/1Ncoc7VRW3v0DdenPDGDAgOKIgNf0y8qXF1H+iM7GPOv
	gpsEuzIqu1GnaGPwbAaD2xcltOEX7pWBgkLXk3bbD01T1erzqYsCajzYJp+etT0m0a/Q9SM8jEe
	diJX/vA==
X-Gm-Gg: AfdE7cmXcJBstqcssbxGTDzKIdoNN3nCdJdaOkOIFlF4/KqaEPucmPzsWoKeLNMtSNO
	w6FTXaw4LMFKKCWgu17PiLHwFmlzGN/kLRyLZOCzCFuxyK8coOZXJN0tscZ9P4fsW2SH2zDyiNL
	mfb+1nL/gkGy9xewWB8HlA8zjyUboONTD/C8v7iZzVvI1d4qyYuFoxNdWv6zBOR1PxSzaLvwtjy
	YOuU7L4YKieXlef/OX9lPxSqDCP1OJJqjJb2VGehK+6Jhh72F7U9fMeekS9ObAfpS8Qxuuxl+8B
	94YzEVuQpw+VcIRUvTpJOrG5aQtmeSG52WeaO3ROPK2njyWnoSCqtmMzir0G+zmOwfo4jAFnM/c
	ow0keIrbgXe1Nz/kw3TplNfgzZ3I1f+PuBT/KiP9ZEl3Ni/an8gAJKA5q0jR+nwXEtKBVQeRqje
	6pjJigJk+0PiJ80zUmnH9O0FC+XrkdeVWCDVEFD6KCCU5uZfu5bx/C/jF/155/RhIoVAARXZloV
	x1v
X-Received: by 2002:a05:6000:240c:b0:46e:6210:ad4a with SMTP id ffacd0b85a97d-47757e57e77mr8219284f8f.5.1782989722576;
        Thu, 02 Jul 2026 03:55:22 -0700 (PDT)
Message-ID: <eb380ba2-cea7-4433-a692-9c233f6503ca@suse.com>
Date: Thu, 2 Jul 2026 12:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/4] x86: record SSP at non-guest entry points
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
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
In-Reply-To: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782989723-FDB2325E-7A3E1B2E/0/0
X-purgate-type: clean
X-purgate-size: 6838
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
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
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0C736F644D

We will want to use that value for call trace generation, and likely
also to eliminate the somewhat fragile shadow stack searching done in
fixup_exception_return(). For those purposes, guest-only entry points do
not need to record that value.

To keep the saving code simple, record our own SSP that corresponds to
an exception frame, pointing to the top of the shadow stack counterpart
of what the CPU has saved on the regular stack. Consuming code can then
work its way from there.

In SAVE_ALL / RESTORE_ALL simply drop the use of UREGS_r15. We want the
full size in all cases, so what exactly the top-of-stack field is going
to be (whose UREGS_* is 0 anyway) doesn't matter this much there. This
way we don't need to distinguish between XEN_SHSTK=y and XEN_SHSTK=n.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Put new field at the front of struct cpu_user_regs.
v2: Add comment ahead of SAVE_ALL. Add comma between its parameters.
    Re-base.

--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -89,7 +89,7 @@ __UNLIKELY_END(nsvm_hap)
 
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
@@ -157,7 +157,7 @@ UNLIKELY_END(realmode)
 
 .Lvmx_vmentry_fail:
         sti
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         /*
          * SPEC_CTRL_ENTRY notes
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -219,8 +219,12 @@ static always_inline void stac(void)
 #endif
 
 #ifdef __ASSEMBLER__
-.macro SAVE_ALL compat=0
-        addq  $-(UREGS_error_code-UREGS_r15), %rsp
+/*
+ * Use sites may override ssp to 0. It should never be overridden to 1.
+ * NB: compat=1 implies ssp=0.
+ */
+.macro SAVE_ALL compat=0, ssp=IS_ENABLED(CONFIG_XEN_SHSTK)
+        addq  $-UREGS_error_code, %rsp
         cld
         movq  %rdi,UREGS_rdi(%rsp)
         xor   %edi, %edi
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
@@ -309,13 +319,15 @@ static always_inline void stac(void)
         LOAD_ONE_REG(dx, \compat)
         LOAD_ONE_REG(si, \compat)
         LOAD_ONE_REG(di, \compat)
-        subq  $-(UREGS_error_code-UREGS_r15+\adj), %rsp
+        subq  $-(UREGS_error_code + \adj), %rsp
 .endm
 
 /*
- * Push and clear GPRs
+ * Push and clear GPRs.
+ *
+ * Use sites may override ssp to 0. It should never be overridden to 1.
  */
-.macro PUSH_AND_CLEAR_GPRS
+.macro PUSH_AND_CLEAR_GPRS ssp=IS_ENABLED(CONFIG_XEN_SHSTK)
         push  %rdi
         xor   %edi, %edi
         push  %rsi
@@ -326,6 +338,9 @@ static always_inline void stac(void)
         xor   %ecx, %ecx
         push  %rax
         xor   %eax, %eax
+ .if \ssp
+        rdsspq %rcx
+ .endif
         push  %r8
         xor   %r8d, %r8d
         push  %r9
@@ -352,12 +367,18 @@ static always_inline void stac(void)
         xor   %r14d, %r14d
         push  %r15
         xor   %r15d, %r15d
+#ifdef CONFIG_XEN_SHSTK
+        push  %rcx
+#endif
 .endm
 
 /*
  * POP GPRs from a UREGS_* frame on the stack.  Does not modify flags.
  */
 .macro POP_GPRS skip_rax=0
+#ifdef CONFIG_XEN_SHSTK
+        pop   %rcx
+#endif
         pop   %r15
         pop   %r14
         pop   %r13
--- a/xen/arch/x86/include/asm/cpu-user-regs.h
+++ b/xen/arch/x86/include/asm/cpu-user-regs.h
@@ -11,6 +11,15 @@
  */
 struct cpu_user_regs
 {
+#ifdef CONFIG_XEN_SHSTK
+    /*
+     * This points _at_ the corresponding shadow stack frame; it is _not_ the
+     * outer context's SSP.  That, if the outer context has CET-SS enabled,
+     * is stored in the top slot of the pointed to shadow stack.
+     */
+    uint64_t entry_ssp;
+#endif
+
     union { uint64_t r15;    uint32_t r15d;   uint16_t r15w;  uint8_t r15b; };
     union { uint64_t r14;    uint32_t r14d;   uint16_t r14w;  uint8_t r14b; };
     union { uint64_t r13;    uint32_t r13d;   uint16_t r13w;  uint8_t r13b; };
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
@@ -304,7 +304,7 @@ FUNC(lstar_enter)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         GET_STACK_END(14)
 
@@ -344,7 +344,7 @@ FUNC(cstar_enter)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         GET_STACK_END(14)
 
@@ -388,7 +388,7 @@ LABEL(sysenter_eflags_saved, 0)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         GET_STACK_END(14)
 
@@ -444,7 +444,7 @@ FUNC(entry_int80)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movb  $0x80, EFRAME_entry_vector(%rsp)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         GET_STACK_END(14)
 
--- a/xen/arch/x86/x86_64/entry-fred.S
+++ b/xen/arch/x86/x86_64/entry-fred.S
@@ -11,7 +11,7 @@
         /* The Ring3 entry point is required to be 4k aligned. */
 
 FUNC(entry_FRED_R3, 4096)
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
 
         mov     %rsp, %rdi
         call    entry_from_pv
@@ -54,7 +54,7 @@ LABEL(eretu, 0)
 END(eretu_exit_to_guest)
 
 FUNC(eretu_error_dom_crash)
-        PUSH_AND_CLEAR_GPRS
+        PUSH_AND_CLEAR_GPRS ssp=0
         sti
         call    asm_domain_crash_synchronous  /* Does not return */
 END(eretu_error_dom_crash)


