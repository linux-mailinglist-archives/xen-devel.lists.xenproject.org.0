Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7067996BD8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 15:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814504.1228070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syWkS-0007nb-Cz; Wed, 09 Oct 2024 13:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814504.1228070; Wed, 09 Oct 2024 13:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syWkS-0007lH-8m; Wed, 09 Oct 2024 13:29:04 +0000
Received: by outflank-mailman (input) for mailman id 814504;
 Wed, 09 Oct 2024 13:29:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syWkQ-0007jn-IX
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 13:29:02 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71de4b0b-8642-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 15:29:00 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c928611371so664044a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 06:29:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05f3c8csm5699368a12.83.2024.10.09.06.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 06:29:00 -0700 (PDT)
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
X-Inumbo-ID: 71de4b0b-8642-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728480540; x=1729085340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VJlNpygJI8V0z2uzn3ha0JActOcXYeVEpIMmyywt14c=;
        b=MtbmFO0wjQt/HhN2SgBjkawPPUMDZI1Q70PxlAJThlphEs0dH3kbFXh6KiS87dpYVy
         Btc9sFqrHwI4azgjI2vW4qJ1WCaDWzn5U71EHmuMpmE6d9BaclS9LMd3RO8BuuUBdATQ
         eNGtD+FH7QIGZ7Ud/PzY483EYXWcjll9uLXOE9KeKf4pAFiv+Rz1uL9zOkIs4L1ibwEX
         Ja3jjJejosEzQCy+F8FWDR/tii1OASl+jd3YUulq3nkyL3ZkMJQGbUp0594V59pVK92m
         vBtXkkOEpW8OCpXHsCJ8fzdW+BDH0hgMQKlaDlUNH6nzIH7heWMTFQmtAiG5Nfm86hg3
         vb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728480540; x=1729085340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJlNpygJI8V0z2uzn3ha0JActOcXYeVEpIMmyywt14c=;
        b=ncuseSXej6L/TyXBfbhZb0ENr/m3ehD476lo4xZSOSmZxKYWh95qeB81pQFCr7z574
         1agD6BEl0G01LmTXOziGocp4tzRRoF8XNbSIzTLavqDtNihjPOJJOnt3T7E49js3t372
         N6myTdCIRWitOW8STQKYYeBd4IKZ+24XpLiHOjBbtBQuOoMPTjIktlJHM/uEqH4Xi043
         f/N+IYN2YAMbe20X07ZnV82G73DA8FKhI71fe/9dmZ7NlQjxtbG708WqpRk/FKmuiN12
         ijUW5RdFPsAziRr4uy4hRsIK94Qf491Dp3m4GYgWplteFPNZwGqq2JKTdPLppCIJa3wZ
         bJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCX7dv8RFnGJg8VYALpRmyuHf5mJ49V+qLbRjPwsAFx7KMg4MeHqZxBzBtDbaUXDBBvcHTeFpN8HE48=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmRWdTmv3l1wR0gSDyAe/gyUUr4fXhrzCv/grNKZz9mFKDJ8KH
	gXjfA5dSynxx8sKoDWeN1CncesWXO+Lp7nLKlxvok/Ggh9dYULdFcWPwOun3pQ==
X-Google-Smtp-Source: AGHT+IE+U6UURqm1SLsdhcGh0XqtqRWzPW0o3y63D9ya4Gts8cyF5UgE44APYgS4wbtU+NL50G77Fw==
X-Received: by 2002:a05:6402:43cb:b0:5c8:bb09:a9b3 with SMTP id 4fb4d7f45d1cf-5c91d58bf20mr2247930a12.10.1728480540267;
        Wed, 09 Oct 2024 06:29:00 -0700 (PDT)
Message-ID: <acb85f02-351d-4ca2-9fd2-276276ed1c8e@suse.com>
Date: Wed, 9 Oct 2024 15:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] xen/x86: Add supporting code for uploading LAPIC
 contexts during domain create
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-5-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241001123807.605-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 14:38, Alejandro Vallejo wrote:
> If toolstack were to upload LAPIC contexts as part of domain creation it

If it were to - yes. But it doesn't, an peeking ahead in the series I also
couldn't spot this changing. Hence I don#t think I see why this change
would be needed, and why ...

> would encounter a problem were the architectural state does not reflect
> the APIC ID in the hidden state. This patch ensures updates to the
> hidden state trigger an update in the architectural registers so the
> APIC ID in both is consistent.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/arch/x86/hvm/vlapic.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 02570f9dd63a..a8183c3023da 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1640,7 +1640,27 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
>  
>      s->loaded.hw = 1;
>      if ( s->loaded.regs )
> +    {
> +        /*
> +         * We already processed architectural regs in lapic_load_regs(), so
> +         * this must be a migration. Fix up inconsistencies from any older Xen.
> +         */
>          lapic_load_fixup(s);
> +    }
> +    else
> +    {
> +        /*
> +         * We haven't seen architectural regs so this could be a migration or a
> +         * plain domain create. In the domain create case it's fine to modify
> +         * the architectural state to align it to the APIC ID that was just
> +         * uploaded and in the migrate case it doesn't matter because the
> +         * architectural state will be replaced by the LAPIC_REGS ctx later on.
> +         */

... a comment would need to mention a case that never really happens, thus
only risking to cause confusion.

Jan

> +        if ( vlapic_x2apic_mode(s) )
> +            set_x2apic_id(s);
> +        else
> +            vlapic_set_reg(s, APIC_ID, SET_xAPIC_ID(s->hw.x2apic_id));
> +    }
>  
>      hvm_update_vlapic_mode(v);
>  


