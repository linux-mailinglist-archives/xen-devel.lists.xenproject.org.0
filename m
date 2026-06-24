Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mjP0N1DtO2oFfggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 16:44:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FBB6BF41B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 16:44:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=XT+Dc4ul;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345055.1604058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcOpa-0005WS-8V; Wed, 24 Jun 2026 14:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345055.1604058; Wed, 24 Jun 2026 14:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcOpa-0005UB-5U; Wed, 24 Jun 2026 14:43:58 +0000
Received: by outflank-mailman (input) for mailman id 1345055;
 Wed, 24 Jun 2026 14:43:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcOpY-0005U0-V1
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 14:43:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcOpV-002SRB-Rt
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 16:43:53 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bed26-2eae-0a2a0a5409dd-0a2a4505b694-6
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:43:53 +0200
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bed29-3cb2-0a2a45050019-d155da34e01f-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:43:53 +0200
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c0bce8840b6so126939066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 07:43:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1e840f34sm7567781f8f.2.2026.06.24.07.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 07:43:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1782312233; x=1782917033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YxWEejRbGhZW/BC+XGcDAuhzmVetniJJ09WYzFcS9R0=;
        b=XT+Dc4ulqdgEHzo91GwRwtvW5DYQTo89YvcD//eHQ7tFwPfwHY76M4eB2MRa9QTU+Y
         E2zfkW7sTbbID+xafUCznrng+4KtLINED07hzEuMw7b+Vobhed9t9K8Gpwe+dQrlKcAE
         GcI+rv17UyNnfps4eox2fzQpg+Cik2f61mBABZZQFSpD0IymSjtFEfwccPgmBuDfwdbX
         zgBNbaRqzVsCtXfHiXcg6bdBOm04q/k5Y+66WSW7OnAkzg5H5iphEO0Z7XRGOXPaz3V3
         H5DJTY8yJqJsnWnLPOPwl41LpmP64wAraB58gg//QAxNoupwE6+yJjatRBA0awkBA7pi
         /h9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782312233; x=1782917033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxWEejRbGhZW/BC+XGcDAuhzmVetniJJ09WYzFcS9R0=;
        b=aNubCM9HI7qzi4itom8vQgqNEJ+PtftTde2gKQ//VsKpdlE5CGllejgopy29rgQ5jp
         qF7MUtyq1IApbeFWy8UiNMj/BQCGlYu6+qiZ7c02W2CnJs1LF7fhjuqSUS3KCI7FRanQ
         Bg8C37YJKw7DlQE/3eozQp7fpkI32hrjziX3kpnm54mT0PrepKgLO/azdbj8G6lJOXkr
         z7Gc3akQIWLWhHWvDXlq4EHuRa+AvtaUnewEPaSI3m8ViG0gHkIQYtupEjsOPQrtImtD
         gXorsrGLriVTf/7PRU9KbZk1WHkN9N8kwyBAS3avjSsEjLydMevaxrRlDy6d0cuh+EXl
         WaOw==
X-Forwarded-Encrypted: i=1; AFNElJ+IxYcfenRNmKURYCfJgG0YgxA+BYKW54E4gfIi0FC0xEnJfIimuVvp72xGmBSoSuKW0JztMNf02mw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNSsKuvaRFmllyfXDxaLxZN0rIaCyU50J+QaiogpyxWofiH5LQ
	kNefavtOXD7WJlwwyBIFLBKIB0bpM0xSQHw32pLTzrBj5yCpciOrQVpbg0x5ZMvSNA==
X-Gm-Gg: AfdE7ckPgCsOUdI4nFXvB6Wmnjy3oB9tsz1b9jwbLjjhqL3T14wF2DspEAiYFf1m/OV
	+SdbPERYho7orotg3++vmTkH6otLTnebJimDyzcVOmBYd64mCvlF0dowLBboFszZt3eABGgEKjM
	rrqegUkbiGf+u2W4kLTGSpb3WGsUEgG8MQ54w/A5yHDupxB9Bg2A1LSvHUoqDJ7/mDOUaIPcTH0
	Nc/18Fb436QdBb74TYAeh/mUF4+BmTHldNelXbhPUkBNKoI4OXVABJXpI7tFYkwH8GK4DBstvfb
	P5uFUc5a3DW9S5J1Y1SQO38ljfwPp885dqwGixZVfgo6mpH99rp1DsFQ2oecYR1CTDRF2vzcBfN
	eKpeqcbnkY6qyT1mQy7RZl3RnyEcd2abb1aXbbf0tgBajhGAFU2bz3DTITE0ugC6l2pbA0U8p3v
	EGTZ/Ik7pgu6BquGfvvjEmc2KegNixV1AazttdYf4I8rjznWh1L+s1+XtPqCR9mhytjd5GWbEyj
	NX2sMTms4Tzjas=
X-Received: by 2002:a17:907:a08:b0:c11:6b5b:70bf with SMTP id a640c23a62f3a-c119f50f4ecmr193083766b.51.1782312233152;
        Wed, 24 Jun 2026 07:43:53 -0700 (PDT)
Message-ID: <0e964293-5b38-4f80-be78-bda76706d0fe@suse.com>
Date: Wed, 24 Jun 2026 16:43:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/fred: Send an EVENT_CHECK IPI on exit from NMI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260624142338.653064-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260624142338.653064-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1782312233-559EA2B8-667B57A7/0/0
X-purgate-type: clean
X-purgate-size: 4209
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42FBB6BF41B

On 24.06.2026 16:23, Andrew Cooper wrote:
> Returning from an NMI which hits guest context needs special casing in FRED
> mode just like it does in IDT mode.
> 
> Break nmi_exit_to_guest() out of handle_ist_exception(), and use it in
> entry_FRED_R3() also.
> 
> Expand the comment a little, and invert the conditional jump to
> compat_restore_all_guest() to avoid needing an #else clause for CONFIG_PV32.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
provided of course ...

> Slightly RFC, not tested yet.  (My AMD system takes an eternity to reboot)

... the results of this won't prove it wrong.

> For 4.22.  Found during testing of FRED.  The consqeuence is that we can end
> up scheduling while still in NMI context, after which things like the watchdog
> and other diagnostics don't work properly.

May therefore want a Fixes: tag (it'll also want backporting aiui).

> --- a/xen/arch/x86/x86_64/entry-fred.S
> +++ b/xen/arch/x86/x86_64/entry-fred.S
> @@ -20,6 +20,12 @@ FUNC(entry_FRED_R3, 4096)
>          GET_STACK_END(14)
>          movq    STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
>  
> +        /* NMIs need special handling on return to guest. */
> +        movzbl  UREGS_ss + 6(%rsp), %eax
> +        and     $0xf, %eax

As you may be aware, I'm not overly happy with such literal numbers. But
well, alternatives look a little involved. So just a remark, not a request
to consider any kind of adjustment.

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -146,6 +146,35 @@ process_trap:
>          jmp  test_all_events
>  END(switch_to_kernel)
>  
> +/*
> + * When returning to guest from an NMI, we must execute an IRET/ERETU to
> + * re-enable NMIs, and must not process softirqs which can e.g. schedule
> + * rather than returning to guest context.
> + *
> + * If a softirq is pending, send ourselves an EVENT_CHECK IPI to compensate.
> + * This will cause softirq processing to occur upon leaving NMI context.
> + *
> + * %rbx: struct vcpu, %r14 stack_end
> + */
> +FUNC(nmi_exit_to_guest)
> +        mov     STACK_CPUINFO_FIELD(processor_id)(%r14), %eax
> +        shl     $IRQSTAT_shift, %eax
> +        lea     irq_stat + IRQSTAT_softirq_pending(%rip), %rcx
> +        cmpl    $0, (%rcx, %rax, 1)
> +        je      1f
> +        mov     $EVENT_CHECK_VECTOR, %edi
> +        call    send_IPI_self
> +1:
> +        /* For restore_all_guest. */
> +        mov     STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
> +#ifdef CONFIG_PV32
> +        mov     VCPU_domain(%rbx), %rax
> +        cmpb    $0, DOMAIN_is_32bit_pv(%rax)

Would you be open to a little bit of trickery here while you move the code?
The low 12 bits of %rbx are clear, so instead of $0 we could use %bl here.

> +        jne     compat_restore_all_guest
> +#endif
> +        jmp     restore_all_guest
> +END(nmi_exit_to_guest)

Much like you flipped the Jcc/JMP here, ...

> @@ -1209,25 +1238,7 @@ FUNC(handle_ist_exception)
>  #ifdef CONFIG_PV
>          testb $3,UREGS_cs(%rsp)
>          jz    restore_all_xen

... how about also making this plus ...

> -        /* Send an IPI to ourselves to cover for the lack of event checking. */
> -        mov   STACK_CPUINFO_FIELD(processor_id)(%r14), %eax
> -        shll  $IRQSTAT_shift,%eax
> -        leaq  irq_stat+IRQSTAT_softirq_pending(%rip),%rcx
> -        cmpl  $0,(%rcx,%rax,1)
> -        je    1f
> -        movl  $EVENT_CHECK_VECTOR,%edi
> -        call  send_IPI_self
> -1:
> -        /* For restore_all_guest. */
> -        mov   STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
> -#ifdef CONFIG_PV32
> -        movq  VCPU_domain(%rbx),%rax
> -        cmpb  $0,DOMAIN_is_32bit_pv(%rax)
> -        je    restore_all_guest
> -        jmp   compat_restore_all_guest
> -#else
> -        jmp   restore_all_guest
> -#endif
> +        jmp   nmi_exit_to_guest

... this

        jnz   nmi_exit_to_guest
        jmp   restore_all_xen

then allowing to fold with ...

>  #else
>          ASSERT_CONTEXT_IS_XEN
>          jmp   restore_all_xen

... this?

Jan

