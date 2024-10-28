Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ED99B3114
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 13:53:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826479.1240768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PF3-0001bP-4g; Mon, 28 Oct 2024 12:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826479.1240768; Mon, 28 Oct 2024 12:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PF3-0001Z8-25; Mon, 28 Oct 2024 12:53:05 +0000
Received: by outflank-mailman (input) for mailman id 826479;
 Mon, 28 Oct 2024 12:53:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5PF2-0001Z2-Ai
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 12:53:04 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 910ce7f6-952b-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 13:53:02 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-539fe76e802so5008884e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 05:53:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360d233sm107125945e9.45.2024.10.28.05.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 05:53:01 -0700 (PDT)
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
X-Inumbo-ID: 910ce7f6-952b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730119982; x=1730724782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hNvgeAnNnZLtnVTZBry7xRCUX2q+4a22RR4Gn5/MM70=;
        b=P0hOILfiJs9ut9BLWR0DDVpui9l0AHVXLIcWpjPKpO7P7y7vUIWAJRUslx6R2tcJzR
         NAE1wydjRR6S7QNw/LEoZB26LjZG8TJdjAT/z13g4nkurJeqwiCWEyM7UXhISgrylE9p
         LUXptGWhIoZ8XG/NlZZ75dfTqMxRJ7ofBh+GP4tsSJNVxciid2uj5VSEuxvIuEIvs1zu
         /rIX27jdd1cNT1q+YYiJu6LXxXkSAiC1IoCE5V/tGZ/XCYJt43li8jLVfjlsNVOubb4z
         GMAafyOqIgzXzEpb+k1RbFT93TbACzSUgMdACE5iwijI/PceZn8I0FoghBlCXivDCQZ6
         JLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119982; x=1730724782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNvgeAnNnZLtnVTZBry7xRCUX2q+4a22RR4Gn5/MM70=;
        b=WviLHanZFTWmJn9Q7iyGAuNfqtyNodv662kN/rCHDBbJ87DSXgeJX2MGhtJveoO9oR
         K6nHAk9cWXFzJU57+hnJHrHOL9G5M9DWIoq9qC2mo/B2rlFJGnL3/aqwd77I3++FvWSZ
         Hlp9J3m/laTCXm3m0QIVuH5RnFctDXtcYIkDhay+GFHu9seK6pDxJ0wxz9TcNVUZ+n9X
         IDe2KAqaQhalDq5p38JY56zPDNeSdVVawo6Ppi9YTySzJw8MHpVx68+Y02FlIu9D8lxc
         DrceecBbdoMhAv4JTVeir5iotlFqv0iLUnsMezpW4A7xFZT9r1Ej7VQ2CTHc7xuP1fGJ
         0Mdw==
X-Forwarded-Encrypted: i=1; AJvYcCVIgi05PtEB3vvb1Li0256/SR2cunxlBv/UYfiiJlSj53uZg2+8S3oJtQFXbfsEgcyPmA7CC2ejl0A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGHr3MUNKeqvt8cOPrDMYOhn47pIRLCYJ4Lok5PFUBLVFxpXSG
	UIB8bLw+2/ZgsoZPsgWA/gP5TnBPbVmxxik9pJhv/2m0O5i+mu2XD3yY7j5jcg==
X-Google-Smtp-Source: AGHT+IFO8G0XnpmD7Sbj9qtEUhD3rhnB31jVG+xFMP9JLoFCIo9vKFQY5WWolwfaDL1kCSc1vqZb/g==
X-Received: by 2002:a05:6512:3045:b0:533:d3e:16fe with SMTP id 2adb3069b0e04-53b3491e270mr3358384e87.38.1730119981563;
        Mon, 28 Oct 2024 05:53:01 -0700 (PDT)
Message-ID: <dd07d7b4-4d0d-4c51-a1e5-70e39223732e@suse.com>
Date: Mon, 28 Oct 2024 13:53:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] NUMA: Introduce NODE_DATA->node_present_pages(RAM
 pages)
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241027144305.1839348-1-bernhardkaindl7@gmail.com>
 <D57FBXUKL8PH.1FQRR4NJ139AX@cloud.com>
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
In-Reply-To: <D57FBXUKL8PH.1FQRR4NJ139AX@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 13:05, Alejandro Vallejo wrote:
> On Sun Oct 27, 2024 at 2:43 PM GMT, Bernhard Kaindl wrote:
>> @@ -499,15 +500,44 @@ int __init compute_hash_shift(const struct node *nodes,
>>      return shift;
>>  }
>>  
>> -/* Initialize NODE_DATA given nodeid and start/end */
>> +/**
>> + * @brief Initialize a NUMA node's node_data structure at boot.
>> + *
>> + * It is given the NUMA node's index in the node_data array as well
>> + * as the start and exclusive end address of the node's memory span
>> + * as arguments and initializes the node_data entry with this information.
>> + *
>> + * It then initializes the total number of usable memory pages within
>> + * the NUMA node's memory span using the arch_get_ram_range() function.
>> + *
>> + * @param nodeid The index into the node_data array for the node.
>> + * @param start The starting physical address of the node's memory range.
>> + * @param end The exclusive ending physical address of the node's memory range.
>> + */
>>  void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
>>  {
>>      unsigned long start_pfn = paddr_to_pfn(start);
>>      unsigned long end_pfn = paddr_to_pfn(end);
>> +    struct node_data *numa_node = NODE_DATA(nodeid);
>> +    paddr_t start_ram, end_ram;
> 
> With the loop in place and arch_get_ram_range() being called inside, these two
> can further reduce scope by being moved inside as well.
> 
>> +    unsigned int idx = 0;
>> +    unsigned long *pages = &numa_node->node_present_pages;
>>  
>> -    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
>> -    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
>> +    numa_node->node_start_pfn = start_pfn;
>> +    numa_node->node_spanned_pages = end_pfn - start_pfn;
>> +
>> +    /* Calculate the number of present RAM pages within the node: */
> 
> nit: that last ":" feels a bit out of place
> 
>> +    *pages = 0;
>> +    do {
>> +        int err = arch_get_ram_range(idx++, &start_ram, &end_ram);
>> +
>> +        if (err == -ENOENT)
> 
> Missing spaces between condition and the parenthesis of the conditional. But...
> 
>> +            break;
>> +        if ( err || start_ram >= end || end_ram <= start )
>> +            continue;  /* range is outside of the node, or not usable RAM */
>>  
>> +        *pages += PFN_DOWN(min(end_ram, end)) - PFN_UP(max(start_ram, start));
>> +    } while (1);
> 
> ... testing for validity rather than invalidity would allow the loop to be
> checked for termination on the termination condition rather than the ad-hoc
> check inside. That is...
> 
>     (untested)
> 
>     do {
>         paddr_t start_ram, end_ram;
>         int err = arch_get_ram_range(idx++, &start_ram, &end_ram);
> 
>         if ( !err && start_ram < end && end_ram > start )
>             *pages += PFN_DOWN(min(end_ram, end)) -
>                       PFN_UP(max(start_ram, start));
>     } while (err != ENOENT);

     } while ( err != -ENOENT );

> That said, take all of this with a pinch of salt. I'm not a maintainer here,
> after all, and you might want to wait for Andrew, Jan or Roger to chip in.

Apart from the small remark above I agree with the comments made, fwiw.

Jan

