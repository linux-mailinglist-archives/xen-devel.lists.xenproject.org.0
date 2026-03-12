Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PXhAsymsmnwOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:43:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707A12712ED
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:43:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252182.1548951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eRQ-0006ff-JQ; Thu, 12 Mar 2026 11:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252182.1548951; Thu, 12 Mar 2026 11:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eRQ-0006cQ-Fg; Thu, 12 Mar 2026 11:43:00 +0000
Received: by outflank-mailman (input) for mailman id 1252182;
 Thu, 12 Mar 2026 11:42:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0eRP-0005h8-7u
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:42:59 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9de79760-1e08-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:42:58 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48532925a4bso4745705e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 04:42:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854a2eeae0sm46799375e9.4.2026.03.12.04.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 04:42:57 -0700 (PDT)
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
X-Inumbo-ID: 9de79760-1e08-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773315778; x=1773920578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FsUFTaV0z01pgH4y2xJG1WKE7bJTwVlb52gmTepqVGs=;
        b=bjClDklIkBX0AHjYIU6YefG7mwVZR2jcUSJWIJmADxLwE5w2f/ULQCotFk4H7dfckG
         IR0InUl4D264KOqxP4IDueazmvpsDgPXnv3qVCitbd+Y1v9yZbQncdTg58+iEaSCrtdS
         itrjCCUv9lUZnprrPxln//Mv9PVhBf3xcirfakfOJCsbaFun1IH6b2McB4ENGaQtno5E
         XFtDsC2IsSeNVjmT+AgNw/3gfOMKAks4EceeMWo/85Cm350zT499FraBhlk070rgnxlk
         s5xJyUO3a18a4CdECTYzWzkYNurpGjzarvzB3NoRkUz15Cmq9CmKU/UwCu31GzhyARZG
         dfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315778; x=1773920578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsUFTaV0z01pgH4y2xJG1WKE7bJTwVlb52gmTepqVGs=;
        b=rSS7vtF3bPBbPE8u06edpyZblMjaKcmS49RDD1mImIhFsPQmxZWKF6jDgSpDJ4qdKA
         jO5PcxF2bzXrwncq6mDpHrB6Hn+AP6QPdfjxfGLOusec7CUNipcv97GbJwThJlHovYmU
         Wq788670COcCqD2B96lzXpQhMmn6pNh4nEDlMsfa0HOFYfoPHbINGXBbzmyQoyUAv5Pt
         D0iuPal/POE658t0aoBm04lRBDangi9fSar/qN6Yg3l3LTsusBl22qvslf/jjjt80OVA
         /u8gapFXFF8vSTWedswSF3kjq0j1U8q0ctpMaf31weGgwQ2m1pBG1TQX74J1lcfAAhTJ
         ccKw==
X-Forwarded-Encrypted: i=1; AJvYcCVZS9Kkq1HcnRm2BAghuRDULycETrkNcjy4irtelGQfF+eJmdJuxrFs+6pyucPKqAgRMu+p7M+qAWU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiwT1Rppmx9OjD8fLDLMtjTg4nW5cPncHMjv+gjMhPiLjlhD8X
	kRkUoFEUacT+xSXqVYvcvyWW/JvGN4vqR5azf+U9AbRoad66TGY6iczCBh4QDRJe/g==
X-Gm-Gg: ATEYQzyqwXEUx7OGLfpJMzNppoqv3tE0hTsvJYIP355L0BBhX6VVTALQL/IszIBrJL0
	skKqRzdRlNqkVlE/lYZW8w9uPvt7qzWVVDmVpMhNaAhiUs/C1xruslTMjQ8KYGxRDBjEdBQOvgt
	lXpqnP/EOuKS6QmRUxFdSN5j/XZfJFHcGal4VIm9w16GAhNu/WVnQHpVdLlE341JUooUl9gA2TW
	EGl/rwAt7VJxR26MdbblXwyfAEa/OJKsNs39l2VMq5mRr2yiuuqb9d6JVRqdOJ4NpgkuzvnXBGR
	uP/TCIilLhuSHcXk0zXsrNEb0lMye0twL68FnZKje/xk3sr3BB4ldzBRcyxM1anhQAEi4AkbLIO
	9mQ/CZJQfFKOqxiCd+2/E8tz6XHTA7qEhSRTVSNf6j+QcPLGlRuf87n6rIjwviZO6Odg6YoCTRm
	DDFmfHYLwv1v/iiazgeJeGkZMJ/96qSOya68RABKg1VBPNeCBmPT1BF/a+P8N1Tte5IgHFsNuOQ
	5iC1muutwAsr7k=
X-Received: by 2002:a05:600c:1d16:b0:485:35ee:f836 with SMTP id 5b1f17b1804b1-4854b0a6d74mr103111565e9.2.1773315777865;
        Thu, 12 Mar 2026 04:42:57 -0700 (PDT)
Message-ID: <12ed74c0-1ea2-4458-881e-ccb7e59e0088@suse.com>
Date: Thu, 12 Mar 2026 12:42:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] x86/hvm: Un-indent the HVM_FEP block in the #UD
 handler
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
 <20260312112116.22563-6-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260312112116.22563-6-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 707A12712ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12.03.2026 12:21, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3837,35 +3837,34 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
>      struct vcpu *cur = current;
>      bool should_emulate = false;
>      struct hvm_emulate_ctxt ctxt;
> +    const struct segment_register *cs;
> +    uint32_t walk;
> +    unsigned long addr;
> +    char sig[5]; /* ud2; .ascii "xen" */
>  
>      hvm_emulate_init_once(&ctxt, NULL, regs);
>  
> -    if ( opt_hvm_fep )
> +    cs = &ctxt.seg_reg[x86_seg_cs];
> +    walk = ((ctxt.seg_reg[x86_seg_ss].dpl == 3)
> +            ? PFEC_user_mode : 0) | PFEC_insn_fetch;

While of course functionally everything's fine this way, I'm now entirely lost:
Why are what were ...

> +    if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
> +                                    sizeof(sig), hvm_access_insn_fetch,
> +                                    cs, &addr) &&
> +         (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
> +                                     walk, NULL) == HVMTRANS_okay) &&
> +         (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )
>      {
> -        const struct segment_register *cs = &ctxt.seg_reg[x86_seg_cs];
> -        uint32_t walk = ((ctxt.seg_reg[x86_seg_ss].dpl == 3)
> -                         ? PFEC_user_mode : 0) | PFEC_insn_fetch;

... initializers before not initializers anymore, when all you're doing is
(supposedly) re-indentation (and, necessarily, moving decls up to the top of
the scope they need to live in)?

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
> +        regs->rip += sizeof(sig);
> +        regs->eflags &= ~X86_EFLAGS_RF;
>  
> -            /* Zero the upper 32 bits of %rip if not in 64bit mode. */
> -            if ( !(hvm_long_mode_active(cur) && cs->l) )
> -                regs->rip = (uint32_t)regs->rip;
> +        /* Zero the upper 32 bits of %rip if not in 64bit mode. */
> +        if ( !(hvm_long_mode_active(cur) && cs->l) )
> +            regs->rip = (uint32_t)regs->rip;
>  
> -            add_taint(TAINT_HVM_FEP);
> +        add_taint(TAINT_HVM_FEP);
>  
> -            should_emulate = true;
> -        }
> +        should_emulate = true;
>      }
>  
>      if ( !should_emulate )

With this, the purpose of the should_emulate variable effectively vanishes,
without it actually being purged (unlike you had it earlier).

Jan

