Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7E3B14F4C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 16:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062794.1428527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uglP1-0002eM-3a; Tue, 29 Jul 2025 14:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062794.1428527; Tue, 29 Jul 2025 14:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uglP1-0002cg-0b; Tue, 29 Jul 2025 14:34:03 +0000
Received: by outflank-mailman (input) for mailman id 1062794;
 Tue, 29 Jul 2025 14:34:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uglP0-0002cY-Dk
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 14:34:02 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11866d3c-6c89-11f0-a31f-13f23c93f187;
 Tue, 29 Jul 2025 16:34:01 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b785a69454so1683959f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 07:34:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2403cdaae8dsm41339975ad.20.2025.07.29.07.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 07:33:59 -0700 (PDT)
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
X-Inumbo-ID: 11866d3c-6c89-11f0-a31f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753799640; x=1754404440; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/qYMD/X0Os0c2Pg6gSE8WLmMZKCRxV6FAoOu/pt4ZBc=;
        b=Fpk0cQVaur17lwE1q2ruRhDJIGcdrBLN69r0tTlQPJhPGcjjaKIltcbXAqc9CnUkLt
         InsxesSwThS96PkodltcIg1YoB0jc+gNfySWb2480J3zgS9UkVfaAgBmt8S2DhmWEkES
         TaYdzzzxHxFEX7YJpQ/XDFylF55haAsYbFHxFiO/BAblieo2PbI1kHA1ewCKlzraWVRH
         8+DlwM6P5N4Q1KC8g0QGpZMD7ckb9WPAqEQ2vWB+3Orq5fVDCKAiIVyPVm3Szjq3HOJj
         6rNMu583oNYSpcorLsGJuxAvEA1gEo0ukvfcBWBTX/Yql/tAdcF7/VmmUQ3uIS3sfh2H
         /Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753799640; x=1754404440;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qYMD/X0Os0c2Pg6gSE8WLmMZKCRxV6FAoOu/pt4ZBc=;
        b=fL9aw6QfAyPvunccVlWZN6XXnuIIGICVki7YjbhpQDt2PFwsXsu/AqgT1ijWG9p5/I
         V09OQS1Pn+ORb7uawR4bnIJeutQ6CEt5VEfMedtRAXYh55xhED2AZBWeyI5Ag0bsv5pu
         Ked5Hn1UVTVa6tx9FuWeiJzUGz0kNvIUE+6kz3FRmBLqBrOiY8a1DP/boRCV4vvsIES8
         jHPyhh4J0QiOWdb9GebG52MIXlBmGqCl+868oQXZ8eZZp3cybyo4ErVhf3VcAZgpqKC3
         Lzr29xgRbPjj5eKlAGrQBosIiTVs5MZV81ozTlziwgODIxNNetYc2b/I1HjLLlfj53xk
         ezpA==
X-Forwarded-Encrypted: i=1; AJvYcCXOrWXInc0vQ9rzbgoFE/VBrE9nn4lzyYEV8gCQ+vDXiPlWXJ45yb6awkH/oG/7mdl58pZXnhBJHIs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqeawxKmAHZOQC9AVP+FGkhoCwcwOWu2Z2emKT4ScjCj+hzz52
	7uAx9cvYy12yPa7VTiGR8SLKzYx6vRqKz1UV/5iJ2dtWD7yRtOY2a0Xyu4t0OJrWCA==
X-Gm-Gg: ASbGncvG6XeTgCPr5X48SeIgCmWBoknxfbcGhbm9P6LFcKurFey+Dm2158TOycVdszQ
	YqOyYoEOBGRVs1KZj5S/BQTcymRC4MTYmdLml82JCOh1OFlaFf8R1vW3mmqpA824biliacxS676
	s2TjjlPV1iFY7blMIfYe+KO5h+8MZoNtRqy+KgVuN0TWGsEtM/JN/iLq7n1+QrYX4UtIoL0sRQs
	/aLh8VF4g89arIRjujIBVoiXPfamt53XygKl2lZ4hSbzpdUjDhFe4W4mBbcD3YI6gglj/9bWoTS
	knlfX/jkc4Nd4o1yM6+yapPabcQtwzV8709iXaRMNIw6b6FoE0qEQZkoG907ijQOf2LqBsvEkPw
	gQPuIMsnBpd/o/f4Er8uxVfBGk5ch/twgvGIMqKqvPKbh2GvjVAPcx/sjuKqHsi/pXxBiRdsmgQ
	m4TryaLQesavX16pYu2w==
X-Google-Smtp-Source: AGHT+IGABp/HaIzA/Fiocayo/OaUJlR2qftm3+KLlewytUs2pcpr+nGhReM/AZckhGSlRFrHf1Rzww==
X-Received: by 2002:a05:6000:3113:b0:3b4:9721:2b16 with SMTP id ffacd0b85a97d-3b776644006mr10810453f8f.36.1753799640381;
        Tue, 29 Jul 2025 07:34:00 -0700 (PDT)
Message-ID: <690b5769-3602-4514-bd26-8119697b32f6@suse.com>
Date: Tue, 29 Jul 2025 16:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] x86/mm: adjust loop in arch_init_memory() to
 iterate over the PDX space
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250724110416.2081-1-roger.pau@citrix.com>
 <20250724110416.2081-9-roger.pau@citrix.com>
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
In-Reply-To: <20250724110416.2081-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 13:04, Roger Pau Monne wrote:
> There's a loop in arch_init_memory() that iterates over holes and non-RAM
> regions to possibly mark any page_info structures matching those addresses
> as IO.  The looping there is done over the PFN space.
> 
> PFNs not covered by the PDX space will always fail the mfn_valid() check,
> hence re-write the loop to iterate over the PDX space and avoid checking
> any holes that are not covered by the PDX translation.
> 
> On a system with a ~6TiB hole this change together with using PDX
> compression reduces boot time in approximately 20 seconds.  Xen boot time
> without the change is ~50s, with the change it's ~30s.

That's nice, and I agree what we currently do isn't very efficient, but ...

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -275,7 +275,7 @@ static void __init assign_io_page(struct page_info *page)
>  
>  void __init arch_init_memory(void)
>  {
> -    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn;
> +    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn, pdx;
>  
>      /*
>       * Basic guest-accessible flags:
> @@ -328,9 +328,14 @@ void __init arch_init_memory(void)
>              destroy_xen_mappings((unsigned long)mfn_to_virt(iostart_pfn),
>                                   (unsigned long)mfn_to_virt(ioend_pfn));
>  
> -        /* Mark as I/O up to next RAM region. */
> -        for ( ; pfn < rstart_pfn; pfn++ )
> +        /*
> +         * Mark as I/O up to next RAM region.  Iterate over the PDX space to
> +         * skip holes which would always fail the mfn_valid() check.
> +         */
> +        for ( pdx = pfn_to_pdx(pfn); pdx < pfn_to_pdx(rstart_pfn); pdx++ )

... pfn_to_pdx() isn't well-defined for a non-RAM PFN, or more precisely for any
PFN that fails the mfn_valid() check. That is, I think, particularly noticeable
with the new offset compression you introduce.

Jan

