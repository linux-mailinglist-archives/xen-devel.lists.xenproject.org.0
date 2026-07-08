Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dijqI133TWpgAwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 09:08:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5FC7227AB
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 09:08:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=CDLsEHaI;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356632.1611205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whMNe-0000j1-Ik; Wed, 08 Jul 2026 07:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356632.1611205; Wed, 08 Jul 2026 07:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whMNe-0000iD-ES; Wed, 08 Jul 2026 07:07:38 +0000
Received: by outflank-mailman (input) for mailman id 1356632;
 Wed, 08 Jul 2026 07:07:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whMNd-0000go-5m
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 07:07:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whMNb-00GZJo-Ub
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 09:07:35 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4df737-5cb7-0a2a0a5109dd-0a2a4502c76c-0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 09:07:35 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4df737-5a27-0a2a45020019-d1558033ddc9-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 09:07:35 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493c2c0b9a8so2353635e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 00:07:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f51193sm116283825e9.12.2026.07.08.00.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 00:07:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1783494455; x=1784099255; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IlgP6o8P3+QTU56avtjZ6NtN6wrlyE7EMZj2/RyLlxA=;
        b=CDLsEHaIjZoh/XTStGfjSV1eMz5lMLBoVaZQV0fBHU1RF7boX5yyngrAHdT0lzAoJ9
         rdcQJdoC4qTst94wkY1rjxmvjZwLKIryO06PEHP4NWw1htQdYdbCAwcUY6euGfhQNoMt
         M7U2zLNk+T3t8m/WLGebcxiCOYsO6sYLb42XKtUtMSsREoqRLMa5TtEIGL9zF35NxNop
         7SbzdkLjvmrhXnpbpgQg/JDMwHcDsiNxGIcoR9Hc0BsffLMVIuaspKCCLdcTqoXn4Oes
         aQB08LUGsEHA5gsZWfwi1GmWhPLCgXfJUhatfREE7i7q0zg5E1nuBG4S36aLX3CKrj8J
         J8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783494455; x=1784099255;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlgP6o8P3+QTU56avtjZ6NtN6wrlyE7EMZj2/RyLlxA=;
        b=PybGLOWWwbU5zkeV0lSpN2yVnB5xKmFqSPhCouhke+idHNJezMlj/o+TcdNGQ/eoJr
         ecYl9aj/Ig2Ps3guIR+MICY5hy/NGGk07EISCsXZhIKnQnZy50ZKiLFUQjPIpSqb9FI9
         nuTHqOB5k85SmBwBpBBNz3isanmcQKYK3br79X41q+r0sQxweY3TwHwOz2CARP/016+x
         DFJ70VpqzVBJFp4jamDsiWGvC73gBA9VILfs0U32VD2RtkeeB458wDDWzLoh9+OmbLrj
         hUixPTjRAcImkENw27S+CXebTY30WA7uP2oGTBXm+E2fJ5FsHkcSfdpvr1vuxtwjNpUK
         9tiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1+16fqISmHBcDy5rRU48Lo7oJquepCRKq7/+BGX7PoDq9gcxSa9OwjVoqmwDEJIo9Jjm1D7y+T2E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxacE09JbBRz83L/k3Re5SAX2qiz2sEuwo6t6iJhrrhsm5Y6c0A
	vgcZ4x8l29tA4Fq2LthruE2R0C2IrHrbNW2Mt73RgbMsGFEftRddQCKb2oIxsxXhgA==
X-Gm-Gg: AfdE7ckZgQur+oHh6e8/w9Ak0dQULAzeRsssMfSDXbizszqQ79XBr8OXCZ3jc0rU+k0
	u7XVLhiyIPgk14qxi+rCC01/h1zlddqeDL9Zipa1xvV8UaLjdEwkXOlZ8v9Wi6tc0j2YD4htVZ8
	F2Ns+V59/Jud+Q0afHlysO18cjXLHPsE84sovSWAMZbmqjbkVuEw6B7HoKlAFolJZIgyI6zQBlt
	TDAK/C6BAD9IBsZbftMjFLIgk0EK35S051A0XgdD9CuH8I+fY3C6/FmMlJ3Oh/J091x26I5fSxl
	m0x08DoCZ6l5+HubAdBI+CzEl6cMEp/m/5bJ+RNmm9oCSO1dvTp8RpsYbxLqeyPHT/yN38yNiAH
	7JOrlr0SkB7A6ud2Bvg/0lcXaoz6EUpi6/gN9wVP1b80JGs4tSYYH0xHzXUBloUQ0VRiLOaBFNr
	vXKFMQXLeUCV+duz4OWepKxSoCimGCER72aMDI70VljZSrTr0QaKIw3+ZLRRFVxfxiMgTVaxBmP
	+R4
X-Received: by 2002:a05:600d:8444:10b0:493:de4b:de17 with SMTP id 5b1f17b1804b1-493e68c5ee4mr8020315e9.14.1783494454996;
        Wed, 08 Jul 2026 00:07:34 -0700 (PDT)
Message-ID: <7b6e99b4-f2be-4bbe-b29f-98a02b0a231f@suse.com>
Date: Wed, 8 Jul 2026 09:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmx: Fix cascade crash in vmx_vmentry_failure()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260707193521.1423908-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20260707193521.1423908-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1783494455-4F51C7C5-46867C5E/0/0
X-purgate-type: clean
X-purgate-size: 7159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC5FC7227AB

On 07.07.2026 21:35, Andrew Cooper wrote:
> The VMEntry failure handling does not distinguish VMFail Valid vs Invalid.  In
> the latter case, vmx_vmentry_failure() will hit a BUG() when trying to look up
> VM_INSTRUCTION_ERROR.

That's the BUG() in __vmread(), I expect? I suppose this is also connected to ...

> Slightly RFC - it's fairly hard to these these.  It came from code inspection
> rather than encountering a VMFailInvalid case in practice.

... this. (Presumably the first "these" also was meant to be "observe" or "hit"
or some such.) What I'm having difficulty with is seeing how we would make it
as far: If said __vmread() hit its BUG(), wouldn't all earlier VMCS accesses
(reads or writes) have hit that, too? I.e. would this be guarding us merely
against a pretty narrow window where memory corruption might occur? And
wouldn't that then be as little or as much of a reason for crashing as any
other failed VM{READ,WRITE}?

> --- a/xen/arch/x86/hvm/vmx/entry.S
> +++ b/xen/arch/x86/hvm/vmx/entry.S
> @@ -154,21 +154,7 @@ UNLIKELY_END(realmode)
>  
>  .Lvmx_launch:
>          vmlaunch
> -
> -.Lvmx_vmentry_fail:
> -        sti
> -        PUSH_AND_CLEAR_GPRS
> -
> -        /*
> -         * SPEC_CTRL_ENTRY notes
> -         *
> -         * If we end up here, no guest code has executed.  The MSR lists have
> -         * not been processed, so we still have Xen's choice of MSR_SPEC_CTRL
> -         * in context, and the RSB is unchanged.
> -         */
> -
> -        call vmx_vmentry_failure
> -        jmp  .Lvmx_process_softirqs
> +        jmp  .Lvmx_vmentry_fail
>  
>  LABEL(vmx_asm_do_vmentry)
>          GET_CURRENT(bx)
> @@ -189,3 +175,30 @@ LABEL(vmx_asm_do_vmentry)
>          call do_softirq
>          jmp  .Lvmx_do_vmentry
>  END(vmx_asm_vmexit_handler)
> +
> +        .section .text.cold, "ax", @progbits
> +
> +FUNC(vmx_asm_vmexit_handler.cold)

Is this doing what you want when CC_SPLIT_SECTIONS=y (and assuming my patch
to extend this to assembly code would finally land)?

> +.Lvmx_vmentry_fail:
> +        /*
> +         * SPEC_CTRL_ENTRY notes
> +         *
> +         * If we end up here, no guest code has executed.  The MSR lists have
> +         * not been processed, so we still have Xen's choice of MSR_SPEC_CTRL
> +         * in context, and the RSB is unchanged.

How do we know the MSR lists haven't been processed? VM entry can fail because
of that processing. Afaict we only know this in the "VMfail invalid" case. For
SPEC_CTRL (in the "VMfail valid" case) this means we only have Xen's choice
still in context if that's the last entry on the list.

> +         * The guest registers are live, and the on-stack copy is up-to-date.
> +         * PUSH_AND_CLEAR_GPRS clobbers flags and can't reasonably be made not
> +         * to.  The Carry flag (VMFail Invalid vs Valid) needs preserving.

Define "reasonably". What about (with my CET-SS part included)

.macro PUSH_AND_CLEAR_GPRS ssp=IS_ENABLED(CONFIG_XEN_SHSTK)
        push  %rdi
        mov   $0, %edi
        push  %rsi
        mov   %edi, %esi
        push  %rdx
        mov   %edi, %edx
        push  %rcx
        mov   %edi, %ecx
        push  %rax
        mov   %edi, %eax
 .if \ssp
        rdsspq %rcx
 .endif
        push  %r8
        mov   %edi, %r8d
        push  %r9
        mov   %edi, %r9d
        push  %r10
        mov   %edi, %r10d
        push  %r11
        mov   %edi, %r11d
        push  %rbx
        mov   %edi, %ebx
        push  %rbp
#ifdef CONFIG_FRAME_POINTER
/* Indicate special exception stack frame by inverting the frame pointer. */
        mov   %rsp, %rbp
        not   %rbp
#else
        mov   %edi, %ebp
#endif
        push  %r12
        mov   %edi, %r12d
        push  %r13
        mov   %edi, %r13d
        push  %r14
        mov   %edi, %r14d
        push  %r15
        mov   %edi, %r15d
#ifdef CONFIG_XEN_SHSTK
        push  %rcx
#endif
.endm

? Whether we'd accept the slightly longer form everywhere, or whether we'd
prefer to add a parameter is TBD.

> +         * We could opencode PUSH_AND_CLEAR_GPRS but that's fragile to stack
> +         * layout changes.  Instead, use a spare byte in the cpuinfo block.
> +         */
> +        setnc   STK_REL(CPUINFO_vmx_vmfail_valid, CPUINFO_error_code)(%rsp)
> +
> +        PUSH_AND_CLEAR_GPRS
> +        sti

Any reason you have re-ordered these two? Can't STI still be the very first
insn after the label? (Of course, if - as per above - SPEC_CTRL would first
need restoring, that would likely need to be ahead of STI.)

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -1833,18 +1833,53 @@ void vmx_destroy_vmcs(struct vcpu *v)
>      free_xenheap_page(v->arch.hvm.vmx.msr_bitmap);
>  }
>  
> -void vmx_vmentry_failure(void)
> +static const char *vmx_error_str(unsigned int error)
> +{
> +    switch ( error )
> +    {
> +    case VMX_INSN_VMLAUNCH_NONCLEAR_VMCS:
> +        return "VMLAUNCH with non-clear VMCS";
> +
> +    case VMX_INSN_VMRESUME_NONLAUNCHED_VMCS:
> +        return "VMRESUME with non-launched VMCS";
> +
> +    case VMX_INSN_VMRESUME_AFTER_VMXOFF:
> +        return "VMRESUME after VMXOFF";
> +
> +    case VMX_INSN_INVALID_CONTROL_STATE:
> +        return "Invalid control state";
> +
> +    case VMX_INSN_INVALID_HOST_STATE:
> +        return "Invalid host state";
> +
> +    case VMX_INSN_VMENTRY_BLOCKED_BY_MOV_SS:
> +        return "Blocked by MOV-SS";
> +
> +    default:
> +        return "Unknown";
> +    }
> +}
> +
> +void asmlinkage __cold vmx_vmentry_failure(void)
>  {
>      struct vcpu *curr = current;
> -    unsigned long error;
> +    bool valid = get_cpu_info()->vmx_vmfail_valid;
>  
> -    __vmread(VM_INSTRUCTION_ERROR, &error);
> -    gprintk(XENLOG_ERR, "VM%s error: %#lx\n",
> -            curr->arch.hvm.vmx.launched ? "RESUME" : "LAUNCH", error);
> +    gprintk(XENLOG_ERR, "VM%s Failure, VMCS %svalid\n",
> +            curr->arch.hvm.vmx.launched ? "RESUME" : "LAUNCH",
> +            valid ? "" : "not ");
>  
> -    if ( error == VMX_INSN_INVALID_CONTROL_STATE ||
> -         error == VMX_INSN_INVALID_HOST_STATE )
> -        vmcs_dump_vcpu(curr);
> +    if ( valid )
> +    {
> +        unsigned int error = vmread(VM_INSTRUCTION_ERROR);
> +
> +        gprintk(XENLOG_ERR, "  Instruction Error %u, %s\n",
> +                error, vmx_error_str(error));

With this being the only call to vmx_error_str(), would that better also be
__cold (despite the compiler almost certainly inlining it, unless __cold
triggered some special inlining decisions)?

> --- a/xen/arch/x86/include/asm/current.h
> +++ b/xen/arch/x86/include/asm/current.h
> @@ -80,6 +80,9 @@ struct cpu_info {
>       */
>      bool         use_pv_cr3;
>  
> +    /* Scratch space for the VT-x logic.  See users. */
> +    uint8_t      vmx_vmfail_valid;

Any reason this isn't bool? No use of the field wants it differently afaics.

Should we - mostly for doc purposes - also wrap this in #ifdef CONFIG_VMX?

Jan

