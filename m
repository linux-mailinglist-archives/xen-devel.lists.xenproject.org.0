Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6189B79BE
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 12:34:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828629.1243582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6TR8-00062t-BY; Thu, 31 Oct 2024 11:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828629.1243582; Thu, 31 Oct 2024 11:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6TR8-00060R-8G; Thu, 31 Oct 2024 11:33:58 +0000
Received: by outflank-mailman (input) for mailman id 828629;
 Thu, 31 Oct 2024 11:33:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6TR6-00060J-Bc
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 11:33:56 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 018d8446-977c-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 12:33:53 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-37d462c91a9so535399f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 04:33:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7c08sm1852248f8f.17.2024.10.31.04.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 04:33:52 -0700 (PDT)
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
X-Inumbo-ID: 018d8446-977c-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzMiLCJoZWxvIjoibWFpbC13cjEteDQzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAxOGQ4NDQ2LTk3N2MtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzc0NDMzLjE1NTEyMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730374432; x=1730979232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AGZawdrmFZ3Pnq2rK0/jBp8T9Jdapq0vEH2+KmRzTZ8=;
        b=MEPUgB7QvBdA7j+0QMFlC2iStE/Viv9om+eGG6SghFrQrV+nwtQJ+u01NAiMvczo2p
         9WJ6eFpho8PLcvAGDrlcuzN9nQ3JehHnL0bKmfbFCK6hIj9HWClaf4VYO/tpLA/xBec4
         UFtCzM5BXn6VF1tQ4LQ2sNqFw0yYEe6+Igpt/ufZS8JulCjLOQAfbd9sTcxig6iX6haB
         4vo9ZFHmcAbP7glPZt5HGFcslMcdRPhgFlE/DLAGBgqPoydGUuchx1p3KVs/R3+H/btp
         SZ56GQEqsCnAzDCeC0A7zq+dRNibBrksD/JlDQJfyF415RvjeJ6uybMjBTr6B7abOUP0
         y97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730374432; x=1730979232;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGZawdrmFZ3Pnq2rK0/jBp8T9Jdapq0vEH2+KmRzTZ8=;
        b=oO3AwIHERpzSQKKEB03Epvr7eK6u/zpnZCpIQRlaGcbVEU8l60s7Uq5e6Knm8Lt4Ix
         /aFlDALeNntZRuJjg/dce2WrsYxVO+50ieJ3K628AMNwTyNSoAtNNZe2v3tRIOuHztMS
         ffI3XezDVuVXvFZymkIIwGfcDN6Qf5z2tu+D+z07RstAd7ZkcOGjnZkfybINerbBflAq
         LOWpIhhxXKl5X06FpYUNL1fkHvmAWbiF22NtyAG+zsrawGpdG7fNgUA3vJzxx5Qu1DYx
         9JYzQa48+jO/DvP7HU32hHpoH8La7Bl45UesgycOjuCpxyaSunGUCeq6Y/XOAFeckY0v
         Ke9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfEjtiyynYJAHDNusIeBHuRlhx05tqHJZj39NcsRN4LoU/XTrcUBAySvnr0/DF9bavb4n7sChzmVY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKFhhPCnF9WWZuE8V6Nyaa7Ra/UEy4ynxWadnMl/InrEnRYi+V
	9sdFxjric7CCnjyFTNOI+sEZ2LycJ+qGdMlnoF7JFwCeg7anSapCQYYNKe/zrg==
X-Google-Smtp-Source: AGHT+IFZMsXE1JMntHnsAjT68px+ELbbRnrxpHMipnal3B7pTkwSrugub8tDlED5WuF26MSale2low==
X-Received: by 2002:a5d:6388:0:b0:374:c059:f2c5 with SMTP id ffacd0b85a97d-381b7076de7mr4297529f8f.22.1730374432406;
        Thu, 31 Oct 2024 04:33:52 -0700 (PDT)
Message-ID: <ab469fd2-158a-48fd-b6e7-22c6e1c84c82@suse.com>
Date: Thu, 31 Oct 2024 12:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] NUMA: Introduce NODE_DATA->node_present_pages(RAM
 pages)
From: Jan Beulich <jbeulich@suse.com>
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20241027144305.1839348-1-bernhardkaindl7@gmail.com>
 <edab5ea3-1f69-49f3-8b1d-b3376c3f6027@suse.com>
Content-Language: en-US
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
In-Reply-To: <edab5ea3-1f69-49f3-8b1d-b3376c3f6027@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2024 16:53, Jan Beulich wrote:
> On 27.10.2024 15:43, Bernhard Kaindl wrote:
>> From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
>>
>> At the moment, Xen keeps track of the spans of PFNs of the NUMA nodes.
>> But the PFN span sometimes includes large MMIO holes, so these values
>> might not be an exact representation of the total usable RAM of nodes.
>>
>> Xen does not need it, but the size of the NUMA node's memory can be
>> helpful for management tools and HW information tools like hwloc/lstopo
>> with its Xen backend for Dom0: https://github.com/xenserver-next/hwloc/
>>
>> First, introduce NODE_DATA(nodeid)->node_present_pages to node_data[],
>> determine the sum of usable PFNs at boot and update them on memory_add().
>>
>> (The Linux kernel handles NODE_DATA->node_present_pages likewise)
>>
>> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
>> ---
>> Changes in v3:
>> - Use PFN_UP/DOWN, refactored further to simplify the code while leaving
>>   compiler-level optimisations to the compiler's optimisation passes.
>> Changes in v4:
>> - Refactored code and doxygen documentation according to the review.
>> ---
>>  xen/arch/x86/numa.c      | 13 +++++++++++++
>>  xen/arch/x86/x86_64/mm.c |  3 +++
>>  xen/common/numa.c        | 36 +++++++++++++++++++++++++++++++++---
>>  xen/include/xen/numa.h   | 21 +++++++++++++++++++++
>>  4 files changed, 70 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
>> index 4b0b297c7e..3c0574f773 100644
>> --- a/xen/arch/x86/numa.c
>> +++ b/xen/arch/x86/numa.c
>> @@ -100,6 +100,19 @@ unsigned int __init arch_get_dma_bitsize(void)
>>                   + PAGE_SHIFT, 32);
>>  }
>>  
>> +/**
>> + * @brief Retrieves the RAM range for a given index from the e820 memory map.
>> + *
>> + * This function fetches the start and end address (exclusive) of a RAM range
>> + * specified by the given index idx from the e820 memory map.
> 
> I think the use of (exclusive) here leaves room for ambiguity (as it may,
> unusually, apply to start as well then). Imo it would better be put ...
> 
>> + * @param idx The index of the RAM range in the e820 memory map to retrieve.
>> + * @param start Pointer to store the start address of the RAM range.
>> + * @param end Pointer to store the end address of the RAM range.
> 
> ... here, just like you have it ...
> 
>> + * @return 0 on success, -ENOENT if the index is out of bounds,
>> + *         or -ENODATA if the memory map at index idx is not of type E820_RAM.
>> + */
>>  int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
>>  {
>>      if ( idx >= e820.nr_map )
>> --- a/xen/common/numa.c
>> +++ b/xen/common/numa.c
>> @@ -4,6 +4,7 @@
>>   * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
>>   */
>>  
>> +#include "xen/pfn.h"
>>  #include <xen/init.h>
>>  #include <xen/keyhandler.h>
>>  #include <xen/mm.h>
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
> 
> ... here.
> 
>> + */
>>  void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
>>  {
>>      unsigned long start_pfn = paddr_to_pfn(start);
>>      unsigned long end_pfn = paddr_to_pfn(end);
>> +    struct node_data *numa_node = NODE_DATA(nodeid);
>> +    paddr_t start_ram, end_ram;
>> +    unsigned int idx = 0;
>> +    unsigned long *pages = &numa_node->node_present_pages;
>>  
>> -    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
>> -    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
>> +    numa_node->node_start_pfn = start_pfn;
>> +    numa_node->node_spanned_pages = end_pfn - start_pfn;
>> +
>> +    /* Calculate the number of present RAM pages within the node: */
>> +    *pages = 0;
>> +    do {
>> +        int err = arch_get_ram_range(idx++, &start_ram, &end_ram);
>> +
>> +        if (err == -ENOENT)
>> +            break;
>> +        if ( err || start_ram >= end || end_ram <= start )
>> +            continue;  /* range is outside of the node, or not usable RAM */
>>  
>> +        *pages += PFN_DOWN(min(end_ram, end)) - PFN_UP(max(start_ram, start));
>> +    } while (1);
> 
> Nit: While we have ample bad examples, I think even in such while() uses style
> ought to be followed (i.e. "while ( 1 )"). Personally, since this looks a little
> odd to me, I generally prefer "for ( ; ; )" in such cases.
> 
> With respective adjustments (which I'm happy to make while committing, so long
> as you agree):

Ah, no, I take that back. Alejandro's comments also want addressing, one way or
another.

Jan

