Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384329B4AE9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 14:28:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827413.1242013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5mGc-0005E9-3F; Tue, 29 Oct 2024 13:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827413.1242013; Tue, 29 Oct 2024 13:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5mGc-0005CH-0b; Tue, 29 Oct 2024 13:28:14 +0000
Received: by outflank-mailman (input) for mailman id 827413;
 Tue, 29 Oct 2024 13:28:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5mGa-0005C9-TJ
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 13:28:12 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3672828-95f9-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 14:28:09 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-37d4c1b1455so3527731f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 06:28:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b6f838sm12526320f8f.83.2024.10.29.06.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 06:28:08 -0700 (PDT)
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
X-Inumbo-ID: a3672828-95f9-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MjkiLCJoZWxvIjoibWFpbC13cjEteDQyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImEzNjcyODI4LTk1ZjktMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjA4NDg5LjQ1NzkxOSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730208489; x=1730813289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WxafaKkcAGBbYXv7l+JTuwdeBefGYTnOBt0bJZslrj8=;
        b=ICq2RGcdaoN42bffLbY6zhKLVI/GCviTeDr5f5k80gY2w0iRQGyBJ77jdlSm6kgXHt
         jDX6rHtz24YtwpM5Vr89aSTEfLqujtQWEDURIxsD/RwxOh2BnJ/AS8hSzKs5BHGuioNj
         7OE+pPktMVfsV81TKZcE7DKDG/LhUM2MXDcHiJvV4Liqp5CX9e11W4TvjoqxJAY/PXW3
         /K0MeiqjTqS8ICdbr8ULviYp70d7qh2f9oBQsKMZqbR/DqRZue2nVRdLcq1kjzmDKNqX
         rsqJ27lAPFmbjk5RwNV7vrrDomL+CVIhSopIrpoehaYB1Q5oCAToZjZgmgqwVE0Uhn7L
         sgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730208489; x=1730813289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxafaKkcAGBbYXv7l+JTuwdeBefGYTnOBt0bJZslrj8=;
        b=psgp1djBmq53z9gyeMczYyppmnN4WCP8eYfsID/kBuSAWeG72nNjgeGHNKkjkkoOuW
         uwJgK2g0EFXq10YXvUgNEx4fvqN9uXD7jwKxN1QvWm8X83p8uCoonDM+sb/dMDbEUCgE
         1sXDwEWQwV+k+3R6Tncmg2F7/BSa0L4pEW9DVFSROXxvFHftTSOv+YEUANRFF9PGTXao
         7T9OY9qHi3vGmNtaAF6VfKTqiMJHG6J0WI86TidVcRKet+ANNakjXYWy58yoS6ldXl0y
         cTxLFY/al85HAENXqQ1ihRcIm592ZdiABlpdzASKOMr27wUdtEp7QsQTTRKT6e3ecBb2
         IwPw==
X-Forwarded-Encrypted: i=1; AJvYcCUpQ/Y3farlZZFUX7lrl1nTLZjo9/oK7rvTeS9KlzxWDnPy9BSrN5mIULa9BffXTUI6i96+KdYlPPU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhxcIinCqD6u1lc7JevmS6SN1iQaYmPXM4jfxQG1vCzbhehIbd
	rWVfYBr9Nt0GNGBEsDiMPYlSKPs5eACiz8VIn9SBQ8+6Iz9IC43Ef2SOFuS1og==
X-Google-Smtp-Source: AGHT+IFsTJBXpZVEWE4thCUAIsMWFwo7DkCgTwoDuy3C0i4SHYTx/5+u1bKCNJ8fordMxSqibEptSQ==
X-Received: by 2002:a5d:4f92:0:b0:374:b35e:ea6c with SMTP id ffacd0b85a97d-380611dc6e9mr8970777f8f.40.1730208488731;
        Tue, 29 Oct 2024 06:28:08 -0700 (PDT)
Message-ID: <6064d51b-f1df-4119-8c38-0f63f888c7af@suse.com>
Date: Tue, 29 Oct 2024 14:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] x86/xstate: Create map/unmap primitives for xsave
 areas
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-3-alejandro.vallejo@cloud.com>
 <0a644e0d-b7dc-49b5-b4ba-943f809286a8@citrix.com>
 <D589SQ8Y0WGU.2MM4HPFUKJYGT@cloud.com>
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
In-Reply-To: <D589SQ8Y0WGU.2MM4HPFUKJYGT@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2024 12:57, Alejandro Vallejo wrote:
> On Mon Oct 28, 2024 at 5:20 PM GMT, Andrew Cooper wrote:
>> On 28/10/2024 3:49 pm, Alejandro Vallejo wrote:
>>> diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
>>> index 07017cc4edfd..36260459667c 100644
>>> --- a/xen/arch/x86/include/asm/xstate.h
>>> +++ b/xen/arch/x86/include/asm/xstate.h
>>> @@ -143,4 +143,24 @@ static inline bool xstate_all(const struct vcpu *v)
>>>             (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
>>>  }
>>>  
>>> +/*
>>> + * Fetch a pointer to the XSAVE area of a vCPU
>>> + *
>>> + * If ASI is enabled for the domain, this mapping is pCPU-local.
>>> + *
>>> + * @param v Owner of the XSAVE area
>>> + */
>>> +#define vcpu_map_xsave_area(v) ((v)->arch.xsave_area)
>>> +
>>> +/*
>>> + * Drops the XSAVE area of a vCPU and nullifies its pointer on exit.
>>> + *
>>> + * If ASI is enabled and v is not the currently scheduled vCPU then the
>>> + * per-pCPU mapping is removed from the address space.
>>> + *
>>> + * @param v           vCPU logically owning xsave_area
>>> + * @param xsave_area  XSAVE blob of v
>>> + */
>>> +#define vcpu_unmap_xsave_area(v, x) ({ (x) = NULL; })
>>> +
>>
>> Is there a preview of how these will end up looking with the real ASI
>> bits in place?
> 
> I expect the contents to be something along these lines (in function form for
> clarity):
> 
>   struct xsave_struct *vcpu_map_xsave_area(struct vcpu *v)
>   {
>       if ( !v->domain->asi )
>           return v->arch.xsave_area;
> 
>       if ( likely(v == current) )
>           return percpu_fixmap(v, PCPU_FIX_XSAVE_AREA);
> 
>       /* Likely some new vmap-like abstraction after AMX */
>       return map_domain_page(v->arch.xsave_area_pg);
>   }

I'd like to ask that map_domain_page() be avoided here from the beginning, to
take AMX into account right away. I've been sitting on the AMX series for
years, and I'd consider it pretty unfair if it was me to take care of such an
aspect, when instead the series should (imo) long have landed.

Jan

