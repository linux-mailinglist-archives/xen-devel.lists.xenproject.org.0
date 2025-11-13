Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74011C576C7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:31:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161227.1489224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWTg-0004st-QK; Thu, 13 Nov 2025 12:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161227.1489224; Thu, 13 Nov 2025 12:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWTg-0004rS-Nd; Thu, 13 Nov 2025 12:31:04 +0000
Received: by outflank-mailman (input) for mailman id 1161227;
 Thu, 13 Nov 2025 12:31:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJWTe-0004rL-PD
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:31:02 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cc5c549-c08c-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:31:00 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b71397df721so91336666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 04:31:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad44b4sm157516766b.28.2025.11.13.04.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 04:30:59 -0800 (PST)
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
X-Inumbo-ID: 9cc5c549-c08c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763037060; x=1763641860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eDQfQek4rgm+3GFZH/xjpXfLMTgp5wnGTmSxfT+Rv/o=;
        b=WOnsHWAGghjlfOilg7Z6k85Bk0SPdWHPiMjlpHvm+ipXZ8WoZtqyZ/8Qejx14Zfao7
         qI9L7EUGASbH+qH0jvgMjqLaTJL0Sa2mQMjPjt0yFr5CDnDS9PzPb2q9m8Z5yVk2EqK4
         WnKHJQNJTulIa11+Fr9O/PThYMjpr0GR300zsk1l6R/zp/BiYfeJ3ZbnCACcj6Rn6G+i
         HvcCLSbRifLiUHUMtSafYHaOuO73FXsCx53GXWuLuUoSztpYdzZOXxxMR/O71az2JM5Z
         DRmy4iIEovIvPTqPjz0htvUjNNJ+BNFtVsPGf5vRNz/f6+qY/CoKTyxtMSS/VkLx9qYq
         Xnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763037060; x=1763641860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDQfQek4rgm+3GFZH/xjpXfLMTgp5wnGTmSxfT+Rv/o=;
        b=opN/IzVmZuByF9c5BZvxJ2U7vX7Z5Ry0sWYjeaZL4Z8wpwvDdRgloCazLt4S/HsDzq
         v9G39vOhmsJmH6NSX9IohKwl3ukq8O5AmY8RYT7mnayJJFWJwJRd3hEZFKmh24TqxvQD
         vrBXHxNul4wAPSOpIuYDPx7v2hEzI6J8HFInNUTFfgREielAQjVB+RXCHcsBYNyyGSxZ
         KTtIxnbsY+R+kbtv1O9ghreHAlE9jrN8li/1PS7MkS+hoiJoi1eKqjLGpUQIbPIM/5RI
         TXkt3Z11AC9/qUj/412/zlorgv5zWEf7oUV97/frBzhK+scMbXcDgwmUtHRty41J/4GQ
         eVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkcI0MEhw1wLfVjXCsTjlINTlKRgLDzzEVLfYP3MVXGMgTuT3+DFhlXHfpZsPD4cxmCvPGvqFDH3w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIozM1bO51pc32WJ3cK9vJmzmHACDDT9azqR4EMxgTCR52zZ22
	scZNUBfoUT8gvPtA8k+rhz7n6xqZsHCO1IGjI4JJKWll2WAHn9ssm7MN87J1LaZNiA==
X-Gm-Gg: ASbGnct6H09b/eaIyb2Xmk4TvV8jo+jbBM2gCKTpS1/6jsMjLmvT0+nAlJO17lHoTb1
	UKUbzHkFx/0e3UCKq59Y5JdZIk1GmNHs2hgwSAFatpoyOXXfl5TdqCuek9FxMZxF8woeDmUG/W8
	TAdcJuKn2xcw2Sm/4f0pQt2HjGJ6ZP5zl6tDdiitL9hDL1426Y5GjpqizIQKnx6ea49PG+5fb5p
	zbK9huPuqHECJOFnWL71s+o7h93fvLKQoKDH5FKKFEeX+fd0jxz8+IJWWoOBAco+dSDGXJuz5ed
	GQvAelNBsbzlQOqOSjHC9+mHUk1fbUH9Gg5V0o9ZoNFN1vpArn6v8ceE83dvNImQuqKXt+rwUQ6
	BwzxbBeCMZN6LfCf2tIeE2ZMntxIS6fZ0u8fcSQD1peVGw9WqHRDkmtQ8NArtAHmkJPdAtFt3Hy
	djq2uhacYytaPilDS3DOHrJtyE/bxNKMTLNjZAtbZ+BV5RCtPJxR8PMOWMPlSsHBIPsL9JzzxML
	B4=
X-Google-Smtp-Source: AGHT+IEN5AH/89fGK9JXULHpEpKoiMX67ZdDLlH+hC+X6qcbVhYyesBJcwHg8mRjFPZ1J01UEXgcrA==
X-Received: by 2002:a17:907:2d28:b0:b70:499b:4f0c with SMTP id a640c23a62f3a-b7331aa95ebmr533842066b.45.1763037060154;
        Thu, 13 Nov 2025 04:31:00 -0800 (PST)
Message-ID: <af736490-5f04-4fa8-9b73-4071b72e1c33@suse.com>
Date: Thu, 13 Nov 2025 13:30:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 3/5] x86: hvm: factor out compat code under ifdefs
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-4-grygorii_strashko@epam.com>
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
In-Reply-To: <20251111175413.3540690-4-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2025 18:54, Grygorii Strashko wrote:
> @@ -3991,7 +3995,7 @@ static void hvm_latch_shinfo_size(struct domain *d)
>       */
>      if ( current->domain == d )
>      {
> -        d->arch.has_32bit_shinfo =
> +        d->arch.has_32bit_shinfo = IS_ENABLED(CONFIG_COMPAT) &&
>              hvm_guest_x86_mode(current) != X86_MODE_64BIT;

I think this could need commenting on if we really want to put it in this shape.
But why would we retain the has_32bit_shinfo field in the first place when
COMPAT=n?

> @@ -4965,6 +4969,7 @@ static int do_altp2m_op(
>  #endif /* CONFIG_ALTP2M */
>  }
>  
> +#ifdef CONFIG_COMPAT
>  DEFINE_XEN_GUEST_HANDLE(compat_hvm_altp2m_op_t);
>  
>  /*
> @@ -5064,6 +5069,12 @@ static int compat_altp2m_op(
>  
>      return rc;
>  }
> +#else
> +static int compat_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif /* CONFIG_COMPAT */

I'm not in favor of repeating the function "header". Imo such #ifdef-s better
go inside respective functions' bodies.

> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -29,10 +29,12 @@ long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          return -ENOSYS;
>      }
>  
> -    if ( !vcpu_is_hcall_compat(current) )
> -        rc = do_memory_op(cmd, arg);
> -    else
> +#ifdef CONFIG_COMPAT
> +    if ( vcpu_is_hcall_compat(current) )
>          rc = compat_memory_op(cmd, arg);
> +    else
> +#endif
> +        rc = do_memory_op(cmd, arg);

Why would this be needed when vcpu_is_hcall_compat() already honors CONFIG_COMPAT?
(Same question then applies elsewhere, of course.)

> @@ -171,6 +177,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>          HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%x, %x, %x, %x, %x)", eax,
>                      regs->ebx, regs->ecx, regs->edx, regs->esi, regs->edi);
>  
> +#ifdef CONFIG_COMPAT
>          curr->hcall_compat = true;
>          call_handlers_hvm32(eax, regs->eax, regs->ebx, regs->ecx, regs->edx,
>                              regs->esi, regs->edi);
> @@ -178,6 +185,9 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>  
>          if ( !curr->hcall_preempted && regs->eax != -ENOSYS )
>              clobber_regs(regs, eax, hvm, 32);
> +#else
> +        regs->eax = -EOPNOTSUPP;
> +#endif

I'm generally against most attempts to use ENOSYS, but here it should be used:
The top-level hypercalls are (effectively) unimplemented in this mode.

> @@ -208,10 +218,19 @@ enum mc_disposition hvm_do_multicall_call(struct mc_state *state)
>      }
>      else
>      {
> +#ifdef CONFIG_COMPAT
>          struct compat_multicall_entry *call = &state->compat_call;
>  
>          call_handlers_hvm32(call->op, call->result, call->args[0], call->args[1],
>                              call->args[2], call->args[3], call->args[4]);
> +#else
> +        /*
> +         * code should never reach here in case !CONFIG_COMPAT as any
> +         * 32-bit hypercall should bail out earlier from hvm_hypercall()
> +         * with -EOPNOTSUPP
> +         */
> +        unreachable();

I.e. you rather mean ASSERT_UNREACHABLE()?

Jan

