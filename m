Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68026B15873
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 07:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063386.1429116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugzPQ-0003mB-6R; Wed, 30 Jul 2025 05:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063386.1429116; Wed, 30 Jul 2025 05:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugzPQ-0003j7-1J; Wed, 30 Jul 2025 05:31:24 +0000
Received: by outflank-mailman (input) for mailman id 1063386;
 Wed, 30 Jul 2025 05:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugzPO-0003iZ-Gj
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 05:31:22 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cae2b93-6d06-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 07:31:21 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45610582d07so40457055e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 22:31:21 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f23f:1903:a31c:2815:3201?
 (p200300cab711f23f1903a31c28153201.dip0.t-ipconnect.de.
 [2003:ca:b711:f23f:1903:a31c:2815:3201])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b793519f3asm3483187f8f.36.2025.07.29.22.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 22:31:19 -0700 (PDT)
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
X-Inumbo-ID: 6cae2b93-6d06-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753853480; x=1754458280; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3/dG4Ldq2quASGr23nYWEZYrmbQ7Y9Rl/BX1kT6A51M=;
        b=QWPBprmD9D+PQENaAb8kXTv+feeCaibkC4Zmuag67X9vaVcMVj0QI41QiBFLiIGY0G
         WGCAjtIPdmq74a1pobiDRJH8cV9kKItXKDw8nhTW53AkZy5D2+PXu3MyebPq6M+JGN+k
         CAVMWrQKTIbU+zpISr6D2oJKLAODe0NFuEvRJ3GAQjHmPUUqP+E3K4LhQ15IUG/EYq+9
         QGuH9GZLL164P7n4sZvyybf0DGmn0NmJH58bLDt5nVmpU1T/EYDH/1fiGfA1LAygtgLX
         uywpqqEUfriibRY7+TN2zeFhahqTzHVuWTrwpWBZmYm5QjbXJmtHpYifxK8qMQ5hNOje
         jGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753853480; x=1754458280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/dG4Ldq2quASGr23nYWEZYrmbQ7Y9Rl/BX1kT6A51M=;
        b=YS3iziBv0QCAzh7DPLkaCFmoyNcrG9PcAZe+CuU4ZcwBwDG4kjA5DhBmIkI24z76Nu
         cchRJa7KI3rfGu/3HaLBwK1eES7enEkARrnzR14bH5O6L2Q9e992lSyuSGOy4wTH8xL3
         QmCK9+8CgGFETokc8OE67Rqb9+CHb3NMXYT0vgtqdVGECB5sbKF0xwktA2GsCPJY2rjL
         CRY53cGQfJipZuxmsHPA+7mbj4+xpEgtEe4pJqIhaGwyR4LeUwDvF+ab3xHOBIAb9T91
         +BejmqtFDJLv3lsuzYxk5gV2p0Zz4yhCUxVuZSI9LSK2dZR7cok5Xp45Ss/F+ajG2EG9
         YVxg==
X-Forwarded-Encrypted: i=1; AJvYcCXixaXXTlxyEFAIyKtZHWmPcv0MP8+Ys1ajR/uU4IO/XwlbLgMco2N5D/OKY0csrDSeoD1BsNjGtsA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrrJuV0OLgWyhS6xFrII9lldFEW+CY9/NQIp413FCvqndQZbl2
	tb1fNHGzXsKuZsPJ/OCPqEk0kTRLBNENUFtHF+t1GfcrfUKXTN/DA+bseq7CtYXsxrJzoSanBSM
	uCEI=
X-Gm-Gg: ASbGncuEaNVeGsPAwcgvxv22qR8K2qW1TKYEKTXlbfKtWdl2ziQanehq2rSVj+KdN9o
	FSH4/3BDqbdPgZ+UfqaDZuez0VGFRUoxo5EgfFDWJWElqx6CFkXSJk523GZDsG1HYbO0IWDXJnG
	35UxMFrFrePvfD3tOKuJ3NCc79qsUXLhSAspkWV/OsJV3YRoGwNvqjlsghbKoYNQicKMRuxNk4z
	W1Old4Y8tDNnlYxuKRyLnAp8Hn9+rkkPnAOV9+7MieeBZQSr9tbg0ZlJsK8l+PDt0B2g6eydAwt
	fYEXFVSWZm5p6Tp59fDxI8QbFtVJyiE8e2pwsSLeOd4KO7J2VpiOx28qPDo/MLGgpZ0wi6jShB0
	exy1pMgsZnVQsABY+4lvwfIgAKK7P8dPF/0fy5+Qt0W3dck39D2hcKiaEr2LFKrkp/THY0ddfaQ
	j0NKAuXcvcAHuBmKpPCBv9jD9v8Zbof7ckBw+GHpwNXwa+CqxKMCbTmaL0
X-Google-Smtp-Source: AGHT+IGSn1c61vz4E8Lp67N9P3VM1JyODp1qkVUWFM5p4kUlCwp7L1hcuP7W+VbbaBDlZ/OI+FsaJA==
X-Received: by 2002:a05:600c:4685:b0:456:11db:2f0f with SMTP id 5b1f17b1804b1-45892bc6698mr18716645e9.16.1753853480383;
        Tue, 29 Jul 2025 22:31:20 -0700 (PDT)
Message-ID: <a6b87a23-f69c-4e23-957d-9de6fd6818b3@suse.com>
Date: Wed, 30 Jul 2025 07:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] x86/mm: adjust loop in arch_init_memory() to
 iterate over the PDX space
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250724110416.2081-1-roger.pau@citrix.com>
 <20250724110416.2081-9-roger.pau@citrix.com>
 <690b5769-3602-4514-bd26-8119697b32f6@suse.com>
 <aIj8uzIa-wcpmvOH@macbook.local>
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
In-Reply-To: <aIj8uzIa-wcpmvOH@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.07.2025 18:54, Roger Pau Monné wrote:
> On Tue, Jul 29, 2025 at 04:33:53PM +0200, Jan Beulich wrote:
>> On 24.07.2025 13:04, Roger Pau Monne wrote:
>>> There's a loop in arch_init_memory() that iterates over holes and non-RAM
>>> regions to possibly mark any page_info structures matching those addresses
>>> as IO.  The looping there is done over the PFN space.
>>>
>>> PFNs not covered by the PDX space will always fail the mfn_valid() check,
>>> hence re-write the loop to iterate over the PDX space and avoid checking
>>> any holes that are not covered by the PDX translation.
>>>
>>> On a system with a ~6TiB hole this change together with using PDX
>>> compression reduces boot time in approximately 20 seconds.  Xen boot time
>>> without the change is ~50s, with the change it's ~30s.
>>
>> That's nice, and I agree what we currently do isn't very efficient, but ...
>>
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -275,7 +275,7 @@ static void __init assign_io_page(struct page_info *page)
>>>  
>>>  void __init arch_init_memory(void)
>>>  {
>>> -    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn;
>>> +    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn, pdx;
>>>  
>>>      /*
>>>       * Basic guest-accessible flags:
>>> @@ -328,9 +328,14 @@ void __init arch_init_memory(void)
>>>              destroy_xen_mappings((unsigned long)mfn_to_virt(iostart_pfn),
>>>                                   (unsigned long)mfn_to_virt(ioend_pfn));
>>>  
>>> -        /* Mark as I/O up to next RAM region. */
>>> -        for ( ; pfn < rstart_pfn; pfn++ )
>>> +        /*
>>> +         * Mark as I/O up to next RAM region.  Iterate over the PDX space to
>>> +         * skip holes which would always fail the mfn_valid() check.
>>> +         */
>>> +        for ( pdx = pfn_to_pdx(pfn); pdx < pfn_to_pdx(rstart_pfn); pdx++ )
>>
>> ... pfn_to_pdx() isn't well-defined for a non-RAM PFN, or more precisely for any
>> PFN that fails the mfn_valid() check. That is, I think, particularly noticeable
>> with the new offset compression you introduce.
> 
> rstart_pfn will always point to the start of the next RAM region (or
> the end of the current region if it's the last one).  So for that case
> pfn_to_pdx() is always provided a RAM PFN as input parameter.
> 
> However for the pfn parameter, we would need to do pfn_to_pdx(pfn -
> 1), as that's the last address in the previous RAM range.  The loop
> would then possibly be:
> 
> for ( pdx = pfn_to_pdx((pfn ?: 1) - 1) + 1; pdx < pfn_to_pdx(rstart_pfn); pdx++ )
> {
>     ...
> 
> This also assumes that PFN 0 will always have a valid PDX translation,
> regardless of whether it's RAM or not (which is the case given the PDX
> code currently used).

Looks good to me. The caveat may then want mentioning in the comment as
well.

Jan

