Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIXrKXuDsWmjCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 16:00:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C4D265E6E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 16:00:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251252.1548470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0L2T-0007Nn-MK; Wed, 11 Mar 2026 14:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251252.1548470; Wed, 11 Mar 2026 14:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0L2T-0007LY-Jf; Wed, 11 Mar 2026 14:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1251252;
 Wed, 11 Mar 2026 14:59:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0L2S-0007LS-RI
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 14:59:56 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f65f2a3a-1d5a-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 15:59:54 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4853fd7b59aso21159235e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 07:59:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b6f6b7sm202625995e9.9.2026.03.11.07.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 07:59:53 -0700 (PDT)
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
X-Inumbo-ID: f65f2a3a-1d5a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773241194; x=1773845994; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qgx4FhloQI16wj6SD7UudbddpkdRbcgUSx8DPO4fSDs=;
        b=BH5OPGUURir5LkSUKLtOyCsk/Q/adGbCRdX7jMj65CWiBwXL5zPtaLdklXX6H8EtxE
         ejyuE+i9w2ybWeywA83Jows+M+5VsaqXR+v1z0CC2wJTAdFlUY/kG/B+w0Otc1HNGVYf
         wDH0U5z+FxNU19quvTzpc5kTYPvRACBnqsY/jEd7DpK16vNdoOzXJ/VW5ZUPJq7XB8jO
         MbzwuQqsPlPN8NdkYgQFNg8eC6w9O6NsW7mcxCq9ejNyOdOnk2OvUkxa9P0djvhYQbEv
         +HxfyeTJHxxW2Ne0YSwMg7MYpJMRhXY3MyFRkYMNuc7Pk8uDZJHSGKVeY+QwXOpPNSlP
         qHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773241194; x=1773845994;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgx4FhloQI16wj6SD7UudbddpkdRbcgUSx8DPO4fSDs=;
        b=b8WUDxlBmHzwnGS25wIbSR+WDoxeYiobmr9qq4EHeHW7oce54MKuR7d9dBZvq5JxT4
         ltBmwoPknlU0cXZ5u5ZZocTW+F247YGTsUHgeApf6MU3MWGvmjgJiMuZTwvhUB7xk8H3
         i97F1WdE8OG8LTiXBr17Iw7lBL9jB2KgTksi5/pf0URmrONcoPasFxmZKrzVagVqXdUo
         KpAhkwjtOzbMOgxDk6Hsxd1appug4YEGzlajvigpSdFuU/jOkYtvaPLgIqh7BkOy3Ov7
         X6R+Icu4tLxAdQ4laRJLqt6jDpoiIWf2B64/hoEIRRC8Uqsugx7t2jKTDyyTkpX9m84c
         Wxhg==
X-Forwarded-Encrypted: i=1; AJvYcCW3RzGi4nMmk46OMmWQS1AVbNlTZWhAqiIWJx6KheNeeJDsvxbYoV/H8Q96j893cPTWI1a0W/UVgOc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmGJPeA/P78Oa9GWVIsAytllRgX7x1BfHIdyDlsaiA6AWuDhlo
	teh1yBGoBwq7rdrKWUeoH7wL6T4ZsDKU2IcdrwMtXMXtF/HmesUuJTuc0v6qD5A67w==
X-Gm-Gg: ATEYQzzAGtr8NSkXGam4v+sWuW7X9BnM/tNCR1dR+LAcpj9FysEEH1ynOkZ52aPSwaE
	7nVPp1MXdVculGgJfprGL1T5XTh39uwH76BroU6vU2zdt1lcWhLaYgAJ04slklwscgC2DGosAef
	cN6h14NN8mdGzEUv2EiS21YJsWRArwd9UaU1THXArTZv+UOnrp0jmI0z9vTlr1aJZlTme8g2dVv
	SLB4dsS01JN7JGZuUJmZSXSzv4ThcPU2ICupADHeaQ5FNYv53ZwmI2n9dDNCtF1RrU6ynbtzKtE
	69Bjf+/n45ZTj3EuqeagzvQiUwbYDeId2nyno/DxVGJ/f3S7xs47kn3+APgvYBc06UUfZbhOk2z
	cJynzTkGvlZwzgs3XA/gMFwo5q637JtGDKP97GDowPK4vAfIaFwDxyIXdunbiYsiLYF4oJPinY5
	3YIrVbowBlWol08jbe/Ex7eep3cITCa4tpkkbWgQOG8r1+Rqx9R9UFu3ERM3f7znZjzdf2mzR9q
	wJfJQLLaRYz2GQ=
X-Received: by 2002:a05:600c:8b38:b0:485:3fc8:de9c with SMTP id 5b1f17b1804b1-4854b0be1b5mr49753765e9.12.1773241193656;
        Wed, 11 Mar 2026 07:59:53 -0700 (PDT)
Message-ID: <d76d6c2c-b81a-417b-9d4e-07f301e35dbc@suse.com>
Date: Wed, 11 Mar 2026 15:59:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] x86/hvm: Disable cross-vendor handling in #UD
 handler
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260311142711.16754-1-alejandro.garciavallejo@amd.com>
 <20260311142711.16754-3-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260311142711.16754-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,amd.com:email];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 16C4D265E6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 11.03.2026 15:27, Alejandro Vallejo wrote:
> Remove cross-vendor support now that VMs can no longer have a different
> vendor than the host.
> 
> While at it, refactor the function to exit early and skip initialising
> the emulation context when FEP is not enabled.
> 
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> v4:
>   * Reverted refactor of the `walk` variable assignment

"Revert" as in "move it even farther away from the original". As said, you
want re-indentation, so please do just that, nothing else that isn't
explicitly justified (like the moving of hvm_emulate_init_once() is). With
this put back in its original shape (can do while committing, I suppose):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3832,67 +3832,50 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
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
> +    uint32_t walk;
> +    unsigned long addr;
> +    char sig[5]; /* ud2; .ascii "xen" */
>  
> -    hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, regs);
> -
> -    if ( opt_hvm_fep )
> +    if ( !opt_hvm_fep )
>      {
> -        const struct segment_register *cs = &ctxt.seg_reg[x86_seg_cs];
> -        uint32_t walk = ((ctxt.seg_reg[x86_seg_ss].dpl == 3)
> -                         ? PFEC_user_mode : 0) | PFEC_insn_fetch;
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
> -
> -            /* Zero the upper 32 bits of %rip if not in 64bit mode. */
> -            if ( !(hvm_long_mode_active(cur) && cs->l) )
> -                regs->rip = (uint32_t)regs->rip;
> +        ASSERT_UNREACHABLE();
> +        goto reinject;
> +    }
>  
> -            add_taint(TAINT_HVM_FEP);
> +    hvm_emulate_init_once(&ctxt, NULL, regs);
>  
> -            should_emulate = true;
> -        }
> -    }
> +    walk = ((ctxt.seg_reg[x86_seg_ss].dpl == 3)
> +            ? PFEC_user_mode : 0) | PFEC_insn_fetch;
>  
> -    if ( !should_emulate )
> +    if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
> +                                    sizeof(sig), hvm_access_insn_fetch,
> +                                    cs, &addr) &&
> +         (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
> +                                     walk, NULL) == HVMTRANS_okay) &&
> +         (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )
>      {
> -        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
> -        return;
> +        regs->rip += sizeof(sig);
> +        regs->eflags &= ~X86_EFLAGS_RF;
> +
> +        /* Zero the upper 32 bits of %rip if not in 64bit mode. */
> +        if ( !(hvm_long_mode_active(cur) && cs->l) )
> +            regs->rip = (uint32_t)regs->rip;
> +
> +        add_taint(TAINT_HVM_FEP);
>      }
> +    else
> +        goto reinject;
>  
>      switch ( hvm_emulate_one(&ctxt, VIO_no_completion) )
>      {
>      case X86EMUL_UNHANDLEABLE:
>      case X86EMUL_UNIMPLEMENTED:
> + reinject:

I'm inclined to suggest to indent this the same as the case labels.

Jan

