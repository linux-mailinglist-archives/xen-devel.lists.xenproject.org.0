Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1037D9EE4F9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 12:27:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855798.1268609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhKO-0005Bb-Ld; Thu, 12 Dec 2024 11:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855798.1268609; Thu, 12 Dec 2024 11:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhKO-00059a-Hr; Thu, 12 Dec 2024 11:25:56 +0000
Received: by outflank-mailman (input) for mailman id 855798;
 Thu, 12 Dec 2024 11:25:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLhKN-00059U-6p
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 11:25:55 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5c715d3-b87b-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 12:25:48 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d4e2aa7ea9so876425a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 03:25:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa657abb2fbsm804438366b.128.2024.12.12.03.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 03:25:52 -0800 (PST)
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
X-Inumbo-ID: d5c715d3-b87b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734002752; x=1734607552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qFPq8rKVGUuN+3GpuxpNkTnkf4SZpT0mkh7MtnBixjU=;
        b=O1WiEy46IBq5IkijiuOJ3yEQBYwBWCA94cf0jFWZ2MjDnO0iz2cq679Mu+0Xzjali5
         SXIjrXMn8RxSNXE56GMsGeknb870oicsixMCD0h97NuRYT52+KxFJ9Zm8WMrigTHOG7O
         RucsalXFqA5FGMq4/UZxCABOH56bo/5/n6W5wy1euR+1oP+ZAUPWv1Ifz5FoS6hq7UNT
         2ClJXOCn+e5PpVJJt04NAM36RLTritNZI0TALdyHCIbUlUxenp6lIxIfyL8JODAzu0+y
         ZH3MmLCOhK24V2ns1VYKJb+842Dmahbo+nbEoC/BUkkH85xwudsJkFxrsbx+eUGVGJ/R
         uYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734002752; x=1734607552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFPq8rKVGUuN+3GpuxpNkTnkf4SZpT0mkh7MtnBixjU=;
        b=vsy2O4gwMopDbQr56Ca4M6IQFwHcg/APWHJDSakOf0Aqw6PEpRH0oc4t27/wpuwbbb
         e045d7EwIkTTohaaH7VYDI4bitfvxOX0KszRj/f076Nyzy0+o6zaqC0Ed9DEWT6mXa6f
         KDoJ9fAo6YTiY2uI5DvO9En/pe4+P98AEom2zumZ4kbvj6fCw1JgD4f4QLd4xLj9a3Lo
         6BR4OTZx8KcxeYobqAT8HcUXqRvjV7KxU5iztdFedPBRibtDnIcwOjDqKqWluy4gy5Cm
         GuVSFGzJfq67GDZsJxux3JPQf3uoO8dYKZb4dQic5+bDBQls/sod1iwe2VaC/XQMOl3G
         36nA==
X-Forwarded-Encrypted: i=1; AJvYcCVR3V/b0/xvkPfAgtdCTjYIHWa8+i3YFe+82kSCZF2Tk792FiUQgOWMjyJUBbn400D/UFreypVSLbY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXUzNJkWeEyDJx0eigqI/UgJASbCpMRFgExJQsn6J5IzvzODba
	4BQgqgybH432skiHX45wmni4Oz690FraCknlbIn1jpxi62hojYNrpAstOb2M+w==
X-Gm-Gg: ASbGncsck/4T101xX0W8YR5A6OZWwQVdlK82kLwSnSF2lVP8oKdSN8LscT6Z4BFvufD
	0Fh0Jgb2J3V7/QDM1z5QdBrZxylwMzNfs9E0oN/uPwLmyhVnSbAAIcQ1oCJj3o9eQdZwd3eExrJ
	LhWBpUHs8R5+Oid2pd5fHnY656PK3nHoQAPCvB1rLQuBPMkMIN9Rsxh87rCB9QSfGlYZA2FPLkZ
	mBAJ680WtFSuKRjcdGvuqLm09PsqteJv/M5BaR95QpXV14n4baHrL8gMfkNUMLR6c54qUkQojFP
	hAlqwFJvgnjoCGmZRGjIllU2DeuDSb+FKB2LRNxfFQ==
X-Google-Smtp-Source: AGHT+IFdA2i+dXeQCNHkpAvhiPTXjDW8HN1buKKiehnTX9lyBY4AzY/DLH/wxWwGXkITqTMR9QGjvQ==
X-Received: by 2002:a17:907:7628:b0:aa6:824c:4ae5 with SMTP id a640c23a62f3a-aa6c1d131d8mr331515966b.56.1734002752329;
        Thu, 12 Dec 2024 03:25:52 -0800 (PST)
Message-ID: <361c68de-eda8-49f7-a743-ddd4ad63a0ff@suse.com>
Date: Thu, 12 Dec 2024 12:25:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-9-dpsmith@apertussolutions.com>
 <91e6d4e7-b4ff-4e13-8814-95eaac891cf4@suse.com>
 <b9f1396d-7675-404e-b04e-4344143fcc57@apertussolutions.com>
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
In-Reply-To: <b9f1396d-7675-404e-b04e-4344143fcc57@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 16:41, Daniel P. Smith wrote:
> On 12/2/24 06:53, Jan Beulich wrote:
>> On 23.11.2024 19:20, Daniel P. Smith wrote:
>>> Look for a subnode of type `multiboot,kernel` within a domain node. If found,
>>> process the reg property for the MB1 module index. If the bootargs property is
>>> present and there was not an MB1 string, then use the command line from the
>>> device tree definition.
>>
>> Why specifically MB1?
> 
> Because Xen converts MB2 into an MB1 chain very early in the entry 
> points that take MB2. By the time HL code is executed, it will only ever 
> see a list of MB1 modules.

Yet that's all Xen's internal representation, which merely is kind of
originating from MB1. That origin is, afaict, irrelevant here, and is
instead, imo, confusing.

>>> --- a/xen/arch/x86/domain_builder/fdt.c
>>> +++ b/xen/arch/x86/domain_builder/fdt.c
>>> @@ -14,6 +14,122 @@
>>>   
>>>   #include "fdt.h"
>>>   
>>> +static inline int __init fdt_get_prop_as_reg(
>>
>> What does "reg" stand for here?
> 
> Device Tree defines a two field "prop-encoded=array" property type 
> called reg.

Okay, this explains where you took it from, yet I remain curious what it
actually stands for. Just from the letters I would derive "register", yet
that seems unlikely here.

>>> +    const void *fdt, int node, const char *name, unsigned int ssize,
>>> +    unsigned int asize, uint64_t *size, uint64_t *addr)
>>> +{
>>> +    int ret;
>>> +    const struct fdt_property *prop;
>>> +    fdt32_t *cell;
>>> +
>>> +    /* FDT spec max size is 4 (128bit int), but largest arch int size is 64 */
>>> +    if ( ssize > 2 || asize > 2 )
>>> +        return -EINVAL;
>>> +
>>> +    prop = fdt_get_property(fdt, node, name, &ret);
>>> +    if ( !prop || ret < sizeof(u32) )
>>> +        return ret < 0 ? ret : -EINVAL;
>>> +
>>> +    /* read address field */
>>> +    cell = (fdt32_t *)prop->data;
>>> +
>>> +    if ( asize == 1 )
>>> +    {
>>> +        uint32_t val;
>>> +        fdt_cell_as_u32(cell, &val);
>>> +        *addr = (uint64_t)val;
>>
>> No need for a cast here nor ...
>>
>>> +    }
>>> +    else
>>> +        fdt_cell_as_u64(cell, addr);
>>> +
>>> +    /* read size field */
>>> +    cell += asize;
>>> +
>>> +    if ( ssize == 1 )
>>> +    {
>>> +        uint32_t val;
>>> +        fdt_cell_as_u32(cell, &val);
>>> +        *size = (uint64_t)val;
>>
>> ... here?
> 
> No the compiler does not need the cast, placed to remind readers what 
> was being done. Can/will drop.
> 
>>> +    }
>>> +    else
>>> +        fdt_cell_as_u64(cell, size);
>>> +
>>> +    return 0;
>>> +}
>>
>> This whole function reads very much like a library one. Does it really need
>> adding here, rather than to the FDT library code we already have? In any
>> event there's nothing x86-specific about it, afaics.
> 
> This is where it gets complicated. Most of the higher order functions 
> exposed by xen/device_tree.h are written to work with FDT indexing 
> structures, referred to as the unflattened tree. Deconflicting the mixed 
> use of FDT and FDT index in device_tree.h is beyond the scope of this 
> series.

Going that far also wasn't my request. Yet it's still library-like code,
which seems odd to introduce as x86-specific when later it may very well
want using by other architectures as well. If the FDT library code isn't
a good place, then put it somewhere under xen/lib/?

>>> +                                  &size, &addr);
>>> +    /* An FDT error value may have been returned, translate to -EINVAL */
>>> +    if ( ret < 0 )
>>> +        return -EINVAL;
>>> +
>>> +    if ( size != 0 )
>>> +        return -EOPNOTSUPP;
>>
>> Not knowing much about DT: What does 0 represent here?
> 
> The libfdt code treats 0 as a valid value, whether zero is a valid value 
> is driven by the contextual usage of the property.

And 0 is the _only_ valid value here? Another comment may be on order, to
at least briefly indicate why this is.

>>> +    if ( addr > MAX_NR_BOOTMODS )
>>> +        return -ERANGE;
>>> +
>>> +    /*
>>> +     * MAX_NR_BOOTMODS cannot exceed the max for MB1, represented by a u32,
>>> +     * thus the cast down to a u32 will be safe due to the prior check.
>>> +     */
>>> +    return (int)addr;
>>
>> Comment and cast contradict one another. DYM u32 (really: uint32_t), or plain
>> int? If you mean to return a plain int (for the sake of the -errno values
>> further up), MAX_NR_BOOTMODS needs to stay below 2**31.
> 
> Good point, we cannot artificially impose 2^31 limit when 2^32 is the 
> legitimate upper bound supported by the MB1 protocol. Even if that value 
> is impractical. At the same time, it is beneficial to be able to 
> communicate failures along with some delineation of the failure. Let me 
> think about this, and in the meantime suggestions are welcomed.

    BUILD_BUG_ON(MAX_NR_BOOTMODS > INT_MAX);

deferring the thinking about the "bigger than this" aspect until a (perhaps
much) later time?

>>> +static int __init process_domain_node(
>>> +    struct boot_info *bi, void *fdt, int dom_node)
>>> +{
>>> +    int node;
>>> +    struct boot_domain *bd = &bi->domains[bi->nr_domains];
>>> +    const char *name = fdt_get_name(fdt, dom_node, NULL);
>>> +    int address_size = fdt_address_cells(fdt, dom_node);
>>> +    int size_size = fdt_size_cells(fdt, dom_node);
>>> +
>>> +    if ( address_size < 0 || size_size < 0 )
>>> +    {
>>> +        printk("  failed processing #address or #size for domain %s)\n",
>>> +               name == NULL ? "unknown" : name);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    fdt_for_each_subnode(node, fdt, dom_node)
>>> +    {
>>> +        if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
>>> +        {
>>> +            int idx = dom0less_module_node(fdt, node, size_size, address_size);
>>> +            if ( idx < 0 )
>>> +            {
>>> +                printk("  failed processing kernel module for domain %s)\n",
>>> +                       name == NULL ? "unknown" : name);
>>> +                return idx;
>>> +            }
>>> +
>>> +            if ( idx > bi->nr_modules )
>>> +            {
>>> +                printk("  invalid kernel module index for domain node (%d)\n",
>>> +                       bi->nr_domains);
>>> +                return -EINVAL;
>>> +            }
>>> +
>>> +            printk("  kernel: boot module %d\n", idx);
>>> +            bi->mods[idx].type = BOOTMOD_KERNEL;
>>> +            bd->kernel = &bi->mods[idx];
>>> +        }
>>> +    }
>>
>> What if you find two?
> 
> No different than if someone accidentally duplicated the module line for 
> the kernel in grub.cfg. It's a violation of the boot convention with the 
> resulting behavior being indeterminate, which may or may not result in 
> failure/panic when the domain attempts to boot. It might be worth adding 
> a warning if a duplicate kernel entry is detected. It is possible that 
> such a configuration would boot if it was a duplicate paste situation. 
> So I would not feel right panicking, when there is a possibility that 
> the configuration could boot.

I agree with not panic()ing, and I didn't mean to ask that you do so. A
warning ought to be enough indeed.

Jan

