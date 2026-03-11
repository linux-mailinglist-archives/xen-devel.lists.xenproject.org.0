Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE4hCnQpsWkBrgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 09:36:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABDE25F6D5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 09:36:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250842.1548194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0F2U-0006gR-87; Wed, 11 Mar 2026 08:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250842.1548194; Wed, 11 Mar 2026 08:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0F2U-0006dW-4U; Wed, 11 Mar 2026 08:35:34 +0000
Received: by outflank-mailman (input) for mailman id 1250842;
 Wed, 11 Mar 2026 08:35:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0F2S-0006d1-KP
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 08:35:32 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42ebfdbd-1d25-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 09:35:30 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-439c9bdc1eeso4312564f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 01:35:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f818d37fsm5318550f8f.6.2026.03.11.01.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 01:35:29 -0700 (PDT)
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
X-Inumbo-ID: 42ebfdbd-1d25-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773218129; x=1773822929; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tvbgGrPtY8K4UHMB3U5NEEl1D6YAEBLJS4eiX3RElsc=;
        b=YQBiOPY0z+fAeKnUjrxP2vECyvRuWskBaxotSbgb7HrHE0Wj8ORr4MHYRZAhfwN94b
         GBS4kfSbSMUPtISvFETF5+54wuSyksy81MJz0UDoQ7Bn4L8oFu4XLSkSuGmekaifwK8Y
         tQWK6txVgpH9E9MMekPxaNCk//a7yteZSoj/mFD1erPutLt6R9yU0HScPM7rTKNgr5Np
         GilO8gNPsnbpafKV1HQmuWTA6rWU5CAT7oLGXYj4efVjmfEHqNvTU7Wcbt3nhkIkgm8D
         kDTFsUZ7KD4lWlIEdLkfJL7fI4EMJCfZ1pHfV56s9VXGjNPQQ8rwXy4ZL99cqXeWFMlL
         nPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218129; x=1773822929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvbgGrPtY8K4UHMB3U5NEEl1D6YAEBLJS4eiX3RElsc=;
        b=PaKnI7uqTADcGxwBP974CdR5kby04k86QKZSgyMuVhOt4Xh71UKcmZQg/OxnrdIxhM
         NwfedQY1qF/BZP6vbh+XXT/ZKY8s9N8DDuRqVdrFUh0KDP3yAhaWSN317XNd2PTjvPU3
         T062QetN9okawX0hl9jxyDKksSTemvvWYdaFjvH/W9PBs8klS53b5GTTyBOjT363OBI5
         ufnUK+w/6D6QhKhjSk9fGNOHmlaI4dTZ0/FCNA6Q9vE9ukgYWleb2Etqg6WicXs1QEWp
         +GyzoeHAmiTKQ94v/mbHTFTNTs6YODE+XaFKCdCxdDc/tHI+qKgIxJaTmsTA/adJDudm
         hVHw==
X-Forwarded-Encrypted: i=1; AJvYcCU1mBJZXZfb6fFkxF+eyLmP7zGNige7dpF0CPWKVlkdcZJGBv0oBHEHoQy2YeTWNe1tavoLU81QiUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxT+5tUoTLfLzS1aeEwDw687hZ/qMLdwqWTQmSmlykXTmQljR4
	29sWaiHlYBHQwWK2l4f6qGjEwjSwymQWoKht9XSQezsVlkHhvWbbodJyBX/kXUJ85A==
X-Gm-Gg: ATEYQzxaf5UGwTwQBP/Gq3BztwC4uQ0h+gnPkT37VBlrystbkWgZ0h4ws1/QTJkbx1L
	nbMhd2xk08zM4IuHQ1ZYCbZZRoANcfX9GRPs2Y1N7BzfJ3z+SD6i/TQgmZ6eu3Tmm2MO0FICas4
	ihssMbX5dwClFJELItRTxB8lZMK0QAu/RDd3VuLi6lt7lV6rdR5kMQmFdNJZRhoVfsboMctDTUd
	/p0ZLC+fH2sChoZpjOZMOGHfB1V/m2UhTcuw2yJfgxjnp/0vZOCBIgQemDO0Z2KL6f4ipdCc1u2
	lz4oNYzgITK4QEIVRN99/OcebjuKUNC3hQEQMZh+zmX38iBzy1vLEFsn4JUupsK181tHcpoBUfK
	Yq3DtnL9qI9upkAuYb2v9N/hLDNsqxI7RNIHzxd2JF6S5NB25376i6hMd6YWA3yVMQfIu+s7WYg
	2nlnAGfENElDIDHs/JrcsR+0hSq2FhIAI7RlfxACiYr34yKCnpD0KkD8e94c4IZxSPj3ExZf4Ej
	XMAzWot2xSwAws=
X-Received: by 2002:a05:6000:2283:b0:439:b886:20d3 with SMTP id ffacd0b85a97d-439f8200b9bmr3192877f8f.15.1773218129297;
        Wed, 11 Mar 2026 01:35:29 -0700 (PDT)
Message-ID: <813d3fc9-170a-4f25-872a-3688946c236d@suse.com>
Date: Wed, 11 Mar 2026 09:35:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] x86/hvm: Disable cross-vendor handling in #UD
 handler
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
 <20260213114232.42996-3-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260213114232.42996-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8ABDE25F6D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 13.02.2026 12:42, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3832,69 +3832,47 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
>      return X86EMUL_OKAY;
>  }
>  
> -static bool cf_check is_cross_vendor(
> -    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
> -{
> -    switch ( ctxt->opcode )
> -    {
> -    case X86EMUL_OPC(0x0f, 0x05): /* syscall */
> -    case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
> -    case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
> -        return true;
> -    }
> -
> -    return false;
> -}
> -
>  void hvm_ud_intercept(struct cpu_user_regs *regs)
>  {
>      struct vcpu *cur = current;
> -    bool should_emulate =
> -        cur->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor;
>      struct hvm_emulate_ctxt ctxt;
> +    const struct segment_register *cs = &ctxt.seg_reg[x86_seg_cs];
> +    uint32_t walk = PFEC_insn_fetch;
> +    unsigned long addr;
> +    char sig[5]; /* ud2; .ascii "xen" */
>  
> -    hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, regs);
> +    if ( !opt_hvm_fep )
> +        goto reinject;

Is this possible at all, i.e. shouldn't there be ASSERT_UNREACHABLE() in
addition if already the check is kept?

> -    if ( opt_hvm_fep )
> -    {
> -        const struct segment_register *cs = &ctxt.seg_reg[x86_seg_cs];
> -        uint32_t walk = ((ctxt.seg_reg[x86_seg_ss].dpl == 3)
> -                         ? PFEC_user_mode : 0) | PFEC_insn_fetch;

Why is this initializer not retained?

> -        unsigned long addr;
> -        char sig[5]; /* ud2; .ascii "xen" */
> -
> -        if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
> -                                        sizeof(sig), hvm_access_insn_fetch,
> -                                        cs, &addr) &&
> -             (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
> -                                         walk, NULL) == HVMTRANS_okay) &&
> -             (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )
> -        {
> -            regs->rip += sizeof(sig);
> -            regs->eflags &= ~X86_EFLAGS_RF;
> +    hvm_emulate_init_once(&ctxt, NULL, regs);
>  
> -            /* Zero the upper 32 bits of %rip if not in 64bit mode. */
> -            if ( !(hvm_long_mode_active(cur) && cs->l) )
> -                regs->rip = (uint32_t)regs->rip;
> +    if ( ctxt.seg_reg[x86_seg_ss].dpl == 3 )
> +        walk |= PFEC_user_mode;
>  
> -            add_taint(TAINT_HVM_FEP);
> +    if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
> +                                    sizeof(sig), hvm_access_insn_fetch,
> +                                    cs, &addr) &&
> +         (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
> +                                     walk, NULL) == HVMTRANS_okay) &&
> +         (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )
> +    {
> +        regs->rip += sizeof(sig);
> +        regs->eflags &= ~X86_EFLAGS_RF;
>  
> -            should_emulate = true;
> -        }
> -    }
> +        /* Zero the upper 32 bits of %rip if not in 64bit mode. */
> +        if ( !(hvm_long_mode_active(cur) && cs->l) )
> +            regs->rip = (uint32_t)regs->rip;
>  
> -    if ( !should_emulate )
> -    {
> -        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
> -        return;
> +        add_taint(TAINT_HVM_FEP);
>      }
> +    else
> +        goto reinject;
>  
>      switch ( hvm_emulate_one(&ctxt, VIO_no_completion) )
>      {
>      case X86EMUL_UNHANDLEABLE:
>      case X86EMUL_UNIMPLEMENTED:
> -        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
> -        break;
> +        goto reinject;

How about placing the reinject label here, along with the two case one?

Jan

>      case X86EMUL_EXCEPTION:
>          hvm_inject_event(&ctxt.ctxt.event);
>          /* fall through */
> @@ -3902,6 +3880,11 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
>          hvm_emulate_writeback(&ctxt);
>          break;
>      }
> +
> +    return;
> +
> + reinject:
> +    hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
>  }
>  
>  enum hvm_intblk hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack)

