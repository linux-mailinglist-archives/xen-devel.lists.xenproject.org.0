Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27980B1B38F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 14:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070448.1434071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujGwE-0000Lt-Er; Tue, 05 Aug 2025 12:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070448.1434071; Tue, 05 Aug 2025 12:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujGwE-0000K6-B2; Tue, 05 Aug 2025 12:38:42 +0000
Received: by outflank-mailman (input) for mailman id 1070448;
 Tue, 05 Aug 2025 12:38:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujGwD-0000K0-5S
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 12:38:41 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d2ad7ca-71f9-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 14:38:40 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ae9c2754a00so1331809666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 05:38:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a374dsm894375866b.36.2025.08.05.05.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 05:38:38 -0700 (PDT)
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
X-Inumbo-ID: 1d2ad7ca-71f9-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754397519; x=1755002319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QYZ7QGDlmbeF1trPU2u4ZnWo60by1o6NYPdsjjOkmxY=;
        b=EltHORhx+X78AHBhswjQzADvlwulFvG9146WkODi012+wwo0Wk31fwPrWhGZdcFYVD
         HDf0jPoKESM0kmsMfLkFQEG25UlqLqdcMgUA2q5sHqrzwkZWJAHrHvFi1sWj1Y+eykzS
         QpQLzjLVE1+OBFbSZWoaF+3C+2vqkypFCRIQov9HCJbBPPccavxtYCkESiaTAgASciUS
         TGaVSHebIlbg/ce0XLazbSipWnzFfXN9YrEtWwJE2AcVR4/98Ul4gKnxfTKqXctIOTkk
         Gav1ubjrFv899hJipKYMsEugNilx5X+iCBZX19o01pw7PDYRVpbwvYK30QLIwMArVMn7
         XhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754397519; x=1755002319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYZ7QGDlmbeF1trPU2u4ZnWo60by1o6NYPdsjjOkmxY=;
        b=PIApSnkqScOk0bmqrm6RdP4wk0Pje1CnxcDGFYW1fCBv6ue8vwoBSO2KjhQKktLdOu
         0x+AdfLJ8vMq3uxa2c4ATVES+kZkdzsNUzTX92bNqYe91TVxTD3FhjaHgtrWzFy4gD1e
         fUoF598nPU5OzX0yg77vjgWJ5fqQCSc3OI3dS5L4vCV+PfzomZyo2zZRfYJwVHXI9cGp
         b4ySxsvPJqenJErpC/jfJdcpmSyp+pKVcKp2Cw/bfxUybRVBaRSpyQGhY6XXtYdysXc0
         JkEuhOkpZzGf4nB4g7Mkjm9sRA4KeaNKrPesfPadTzMoflM/hlWEHGNoMqCwzvywlao5
         qRzg==
X-Forwarded-Encrypted: i=1; AJvYcCVaZUeqgcPEFyfRe5y6EoYvfaKiRfjZtHDgjUtsAmqe5VcmwMncdBviTQW2mGe4PwmLjERTHrEsCtA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6SfT8Q/PxVQgMaWyNlElw+1chBWqHuea2QBJVciuHiaz6SFz0
	xRVcj9lPVY54ImxSuA6V74Q6nmocTtl48Ko3NA6mwjaHlMvkgt4grI7OW8wJ3pbGcw==
X-Gm-Gg: ASbGnct3pDQd4c2FL0F0L6esVo7wPJ8/QzYIb4C4fhJJNoFbw0WJ9hhuXsoZI7h0Ymp
	Yjy4e8yhzN8k45fsLb2srDmFpje2TYi19DW5NloGHlN5kFk8c93sulDboFwAUssM8HNxW0h6hnM
	ACSCOwukb2tK1jRAiuur0Z95aXAlc8MS/BkJJsiQ1XESLAR67dMZkRKAb0PPjJpSuxyUkCF3Tb5
	yA/r/Z5ufKibEpdveqqjhz2sSuzydKLfB7EQOnZG9iHiIVIM6o4rgq7/QlwjlwOSGoW1WoIUZVr
	tc/Te3yBNhktRi6XvLOUa+H7T1K1IbPkJViimPkMCc0W8NCXU5ynRn9ll2uCwolOs2FrKtxWSHM
	WcFPJJUt0LAJhses04zPsZk7ss5zWJDL01SzoAKrUtt/y9RF516H88khd+DcyndZCPDz9GNqR3q
	WJErzkCAo=
X-Google-Smtp-Source: AGHT+IHOv1R5V2V5WFwL2uIF0SIdgAGB3vfWPJYc7XsXRonx/W6A9FFapYwDzdrZkqUsmyOEfsYcEg==
X-Received: by 2002:a17:907:9405:b0:ae3:7113:d6ac with SMTP id a640c23a62f3a-af940209185mr1355646066b.58.1754397519206;
        Tue, 05 Aug 2025 05:38:39 -0700 (PDT)
Message-ID: <31691bf7-94bf-4f73-b04c-a32f86bb0e37@suse.com>
Date: Tue, 5 Aug 2025 14:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] x86/mm: adjust loop in arch_init_memory() to
 iterate over the PDX space
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250805095257.74975-1-roger.pau@citrix.com>
 <20250805095257.74975-9-roger.pau@citrix.com>
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
In-Reply-To: <20250805095257.74975-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.08.2025 11:52, Roger Pau Monne wrote:
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
> @@ -328,9 +328,20 @@ void __init arch_init_memory(void)
>              destroy_xen_mappings((unsigned long)mfn_to_virt(iostart_pfn),
>                                   (unsigned long)mfn_to_virt(ioend_pfn));
>  
> -        /* Mark as I/O up to next RAM region. */
> -        for ( ; pfn < rstart_pfn; pfn++ )
> +        /*
> +         * Mark as I/O up to next RAM region.  Iterate over the PDX space to
> +         * skip holes which would always fail the mfn_valid() check.
> +         *
> +         * pfn_to_pdx() requires a valid (iow: RAM) PFN to convert to PDX,
> +         * hence provide pfn - 1, which is the tailing PFN from the last RAM
> +         * range, or pdx 0 if the input pfn is 0.
> +         */
> +        for ( pdx = pfn ? pfn_to_pdx(pfn - 1) + 1 : 0;
> +              pdx < pfn_to_pdx(rstart_pfn);
> +              pdx++ )
>          {
> +            pfn = pdx_to_pfn(pdx);
> +
>              if ( !mfn_valid(_mfn(pfn)) )
>                  continue;
>  

As much as I would have liked to ack this, I fear there's another caveat here:
At the top of the loop we check not only for RAM, but also for UNUSABLE. The
latter, like RAM, shouldn't be marked I/O, but we also can't use PFN <-> PDX
transformations on any such page.

Jan

