Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E9B29EB8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 12:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085841.1444115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwhB-0000ko-GG; Mon, 18 Aug 2025 10:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085841.1444115; Mon, 18 Aug 2025 10:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwhB-0000jE-De; Mon, 18 Aug 2025 10:02:29 +0000
Received: by outflank-mailman (input) for mailman id 1085841;
 Mon, 18 Aug 2025 10:02:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unwh9-0000j7-S5
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 10:02:27 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 717a6e75-7c1a-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 12:02:26 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb7347e09so625133366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 03:02:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd010e7dsm769275066b.89.2025.08.18.03.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 03:02:25 -0700 (PDT)
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
X-Inumbo-ID: 717a6e75-7c1a-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755511346; x=1756116146; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qUhS2zNWmv8Hkk1Bfvmd7hGGkXraYGujN0Y27i1nbKA=;
        b=Wy/PD+m7w66JlTtn6RfVYVAeLN5ZJLfbBtFJFjFfPHBdQiAeufk3V6lOgKvBeABG19
         tFz63OCc+R1zDJ0j9B3Qdlv9Ot1VscI9OdgIuObJbqtxLSpr3rXW8aaOdxv/tnM897sq
         Y4t799mABaNcOytDYye5fpuhyJ16aKbRgTy+L0EWF5k6Jiall5rNT0PEVxA6JzjmdtZF
         D0DY3ykMkl4oV2Z6xwgV4ew33yorwAnlGG+Q8CZxW6N7oAHhJADGKHbus9oLbw+4MgPv
         EGScolbuR2lPbUFjnp5LR+rYTmEHrVI7fOPCpYXhLtSzPdjcW5n2J7F/M6EoFr1B/RC3
         i2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755511346; x=1756116146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUhS2zNWmv8Hkk1Bfvmd7hGGkXraYGujN0Y27i1nbKA=;
        b=OfWIXKj44mZYmPPBlh460WqZD47YsdMaz2ZBkAR3baeNPZeXyclx5P6YCkMdmz5L/K
         z1syqYanNNQAX/tymZrlJZm9QbaTWqlFcSa1XJr89k+gynG2c9ONBb6EiH1siQ6ufH1+
         rh74BriRj6thX60yWaqBkO8Qp45wj9UnciDjKUCcn2xgXllPvOav72yogfDU7eQnF7SL
         uahIf/fJdgon5WFu2KmwM9vE5nyunU6TjB/RBWJT9qTM3qKp2yK9Y/JWltseUo3hFH/z
         bKEse0HMBORqLFVRlllS+hfOHJQl2TJJbS7NDLvnm8IEWsiYsxFdu3Pfp74+94JFI43G
         gnWw==
X-Forwarded-Encrypted: i=1; AJvYcCUGMcEGtCopQNuQjXnqAUYblMd8dRIgX6bc3IAPG3vD8gTBS3RNnUvW1WBbWvZ7rI/LsC/RXiCYWPs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxnyo06YMbFY3FlkXpTqqUOkc/6cgANFnq732a+kImBDMK+/0nF
	o9f3p4M3/LoODEoj4jN0FTIaaKGXYgVDq0T7fun/SHfmKTIvuuSgO1bCU6rms5sE7A==
X-Gm-Gg: ASbGnctdf4Rucv0cUmGimxdnEQSRR1rhI5w4xQPiHWjU2T74uxTXLaxrJitK/jNiwtE
	jcI4EUf6lynn0OWMpyvuTYPRd48nnzUU7mEILoTUPiZt7O5yQ+Sow1sz413WzVDTrO5pNVA4w20
	AQa1xHZbn8UwFyJfSihHDd4MSULVAsyEPQUjgeF2SMAbn5Xgpu9fk2bJIdVA+Fop9ivGrKcB9br
	JKXorsetgzDZqBEraS+mRMUQ+cQ/Zhj9VxiXcZp7FhRUfh8EjsBE4pG73WD/oJcHnZyQdwRQU8I
	7Z+rAHHTViHgSQ5YvOTeJSg8gLbCl73Iwdf/NwwAMgr3jx1GJrXuNZxLjoP4rW6Ung6SkywesQ6
	G+Gh/gR5FF28IWOsI5OZhp90o9+bKMRqO8TQN9hSPTJIuvvflkxcH/hyBrracjDwIOYDOocrc82
	224p1WmYY=
X-Google-Smtp-Source: AGHT+IFM6CMpDJZyAePO1larEUv0zJsAXKjbUXIWUNqxyEYX90HIPl9mHCP4HzGIvutQBkfzk8PJ+g==
X-Received: by 2002:a17:907:970b:b0:afa:2779:c24d with SMTP id a640c23a62f3a-afcdc1a14damr1016627966b.10.1755511345692;
        Mon, 18 Aug 2025 03:02:25 -0700 (PDT)
Message-ID: <d1a49f35-250a-4db5-88f7-fd0b8e6d1a1c@suse.com>
Date: Mon, 18 Aug 2025 12:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/22] x86/vmx: Adjust NMI handling for FRED
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808234920.1214924-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808234920.1214924-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2025 01:49, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4209,8 +4209,18 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
>               ((intr_info & INTR_INFO_INTR_TYPE_MASK) ==
>                MASK_INSR(X86_ET_NMI, INTR_INFO_INTR_TYPE_MASK)) )
>          {
> -            do_nmi(regs);
> -            enable_nmis();
> +            /*
> +             * If we exited because of an NMI, NMIs are blocked in hardware,
> +             * but software is expected to invoke the handler.
> +             *
> +             * Use INT $2.  Combined with the current state, it is the correct
> +             * architectural state for the NMI handler,

Not quite, I would say: For profiling (and anything else which may want to
look at the outer context's register state from within the handler) we'd
always appear to have been in Xen when the NMI "occurred".

> and the IRET on the
> +             * way back out will unblock NMIs.
> +             *
> +             * In FRED mode, we can spot this trick and cause the ERETS to
> +             * unblock NMIs too.
> +             */
> +            asm ("int $2");
>          }
>          break;
>      case EXIT_REASON_MCE_DURING_VMENTRY:
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -2285,8 +2285,22 @@ void asmlinkage entry_from_xen(struct cpu_user_regs *regs)
>          do_nmi(regs);
>          break;
>  
> -    case X86_ET_HW_EXC:
>      case X86_ET_SW_INT:
> +        if ( regs->fred_ss.vector == 2 )
> +        {
> +            /*
> +             * Explicit request from the the VMExit handler.  Rewrite the FRED
> +             * frame to look like it was a real NMI, and go around again.
> +             */
> +            regs->fred_ss.swint = false;
> +            regs->fred_ss.nmi = true;
> +            regs->fred_ss.type = X86_ET_NMI;
> +            regs->fred_ss.insnlen = 0;
> +
> +            return entry_from_xen(regs);

Any particular reason to use recursion here (which the compiler may or may
not transform)? In fact I'm having trouble seeing why you couldn't invoke
do_nmi() here directly.

Jan

