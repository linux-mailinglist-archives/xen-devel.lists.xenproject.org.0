Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B800A88642
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:05:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950588.1346860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LMw-0005ha-5v; Mon, 14 Apr 2025 15:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950588.1346860; Mon, 14 Apr 2025 15:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LMw-0005g5-0k; Mon, 14 Apr 2025 15:05:06 +0000
Received: by outflank-mailman (input) for mailman id 950588;
 Mon, 14 Apr 2025 15:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4LMu-0005fz-HP
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:05:04 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d732ca55-1941-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 17:05:02 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso32422005e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 08:05:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20625592sm181899245e9.10.2025.04.14.08.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 08:05:00 -0700 (PDT)
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
X-Inumbo-ID: d732ca55-1941-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744643102; x=1745247902; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=10HvP2AvrbKid+VqXPQLkxNVZRQw5YvJvqRZW+lYFKw=;
        b=PfpL1yTjpPvkQ3+11DCEJNaaLCv+z/8wAAElO5q9s3L6l282q/B8NsEj1MPsSxnTzU
         LCRmAytjQzm/AeauSJ0yanb5CbTFWEuZF+gaIa873QD9OhJTXkiJLh0Aoboe/8854Q1h
         Lf8MVkRmkLk0X0P6l23mLbnNKrcXoa/oQgdSLpJN1B5rIrdLA2J6m9nzTR5HDvnqvcG3
         cbKqblf3H+1CjseHAh1FHXKKlcQhO2wjbXwtnzLWndoLTjTnLT3ArYVvL1fuzXxDriXD
         psJhmN0tfn/3SptCfFkqnk+ifWkV251+ouQVI/Zm2mrLins54pOzTuHa+IxXkA38lnSC
         iY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744643102; x=1745247902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10HvP2AvrbKid+VqXPQLkxNVZRQw5YvJvqRZW+lYFKw=;
        b=dD9O37c8t9IaKv9tRCsO2ugbQWUqsKRlNnm3h9hDKWAVyQVJHEv4HDAJ79D03KKRMf
         xnH9mzOq7HRlcg2ETa311fcWeYIf9Xv+W42S64TczOhXy8RcKFJRXp2++AtXCFp5zgyp
         CnUt2v4cm9Eiug9m1ti3F32zNSLcFR+34+XaOHT2B3zXr5vne1roD8OPPsDWLzDh8c8v
         /T1ACPFeV+zN8vefHQykNyEdA4u1aOemV+f5OiduqqCkX7jj9RFqYhpgpeCa1p+SZBJB
         uU2yGO4TiReyM39OiqSqGSL2Ff0XD7n2z5/aT1DfFZ17H+0TLMuIyZ4sflU9q/nsaqha
         tc9g==
X-Forwarded-Encrypted: i=1; AJvYcCU4q9omErtpu8j3J20A02g2g4gCweGN3RIeuSj83XflIM06naHEnElL/Z+0TYegfBOHaN0XfLzORsw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbCrCYWTO1bC1EDq2echEhcfKLOXjzxga7VPsfgRqz/32rQtSp
	GVDLrw8YB9VG46MGs8Ap8ylISAnAAaLyzL5C5MyvQdet9ccXTj8CXxqLG89OAg==
X-Gm-Gg: ASbGncti5cSYZj7j6UdU9/X84uGaHG0a9hJEo8JGb5obs6kr1oP73s/WhDnQ2rSG5+U
	pX4GEYedM++d4IDlsqE3m9sX0Scpe/JLEYoFvYeU2t8C5LzPvIAkQcknCwxh0qGKRueBNv4TkGv
	Mi+KX4EM/xdkVCRKVS9rRKMv/n92NhRIcQWgfFbGAIJ/MCTqst3BgPHnnuEEB/B0334SurN6GAP
	O/9PCAt1iVKkKQPnMHqW5/VK7wSWVQtPhBwE/FjaqzZB+q1unIz0GL8h0ryQqzmFZkqa7itfM7j
	aUPEiVRxr+Y9VSz7Ccc3DjP8An2b9a5muW6V9xvlS8Gyu1MxBR4cq7L8V6V7dzLWeWpi2e5YnQ7
	Co1svj+AlhDcRX0HsfExfLjnNgQ==
X-Google-Smtp-Source: AGHT+IEpd4v6mazVBuJkZrHBoMZai40BSoUmHIdSCdM4Kzdg6y1iJO+yV8iF7NyI6ueJVBL6NTYMdg==
X-Received: by 2002:a05:600c:a43:b0:43d:bb9:ad00 with SMTP id 5b1f17b1804b1-43f3a959edemr116396215e9.15.1744643101095;
        Mon, 14 Apr 2025 08:05:01 -0700 (PDT)
Message-ID: <3d2aa870-a1cb-4e33-841d-aee7b6b6db83@suse.com>
Date: Mon, 14 Apr 2025 17:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/16] x86/hyperlaunch: Add helpers to locate multiboot
 modules
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-9-agarciav@amd.com>
 <fe282aa0-fe2d-49b8-a2aa-325c9825304b@suse.com>
 <D96EI9O4XII2.195QNQNT1T3FG@amd.com>
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
In-Reply-To: <D96EI9O4XII2.195QNQNT1T3FG@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 15:37, Alejandro Vallejo wrote:
> On Thu Apr 10, 2025 at 11:42 AM BST, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> +/*
>>> + * Locate a multiboot module given its node offset in the FDT.
>>> + *
>>> + * The module location may be given via either FDT property:
>>> + *     * reg = <address, size>
>>> + *         * Mutates `bi` to append the module.
>>> + *     * module-index = <idx>
>>> + *         * Leaves `bi` unchanged.
>>> + *
>>> + * @param fdt           Pointer to the full FDT.
>>> + * @param node          Offset for the module node.
>>> + * @param address_cells Number of 4-octet cells that make up an "address".
>>> + * @param size_cells    Number of 4-octet cells that make up a "size".
>>> + * @param bi[inout]     Xen's representation of the boot parameters.
>>> + * @return              -EINVAL on malformed nodes, otherwise
>>> + *                      index inside `bi->mods`
>>> + */
>>> +int __init fdt_read_multiboot_module(const void *fdt, int node,
>>> +                                     int address_cells, int size_cells,
>>> +                                     struct boot_info *bi)
>>
>> Functions without callers and non-static ones without declarations are
>> disliked by Misra.
> 
> Can't do much about it if I want them to stand alone in a single patch.
> Otherwise the following ones become quite unwieldy to look at. All I can
> say is that this function becomes static and with a caller on the next
> patch.

Which means you need to touch this again anyway. Perhaps we need a Misra
deviation for __maybe_unused functions / data, in which case you could
use that here and strip it along with making the function static. Cc-ing
Bugseng folks.

>>> +    /* Otherwise location given as a `reg` property. */
>>> +    prop = fdt_get_property(fdt, node, "reg", NULL);
>>> +
>>> +    if ( !prop )
>>> +    {
>>> +        printk("  No location for multiboot,module\n");
>>> +        return -EINVAL;
>>> +    }
>>> +    if ( fdt_get_property(fdt, node, "module-index", NULL) )
>>> +    {
>>> +        printk("  Location of multiboot,module defined multiple times\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    ret = read_fdt_prop_as_reg(prop, address_cells, size_cells, &addr, &size);
>>> +
>>> +    if ( ret < 0 )
>>> +    {
>>> +        printk("  Failed reading reg for multiboot,module\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    idx = bi->nr_modules + 1;
>>
>> This at least looks like an off-by-one. If the addition of 1 is really
>> intended, I think it needs commenting on.
> 
> Seems to be, yes. The underlying array is a bit bizarre. It's sizes as
> MAX_NR_BOOTMODS + 1, with the first one being the DTB itself. I guess
> the intent was to take it into account, but bi->nr_modules is
> initialised to the number of multiboot modules, so it SHOULD be already
> taking it into account.
> 
> Also, the logic for bounds checking seems... off (because of the + 1 I
> mentioned before). Or at least confusing, so I've moved to using
> ARRAY_SIZE(bi->mods) rather than explicitly comparing against
> MAX_NR_BOOTMODS.
> 
> The array is MAX_NR_BOOTMODS + 1 in length, so it's just more cognitive
> load than I'm comfortable with.

If I'm not mistaken the +1 is inherited from the modules array we had in
the past, where we wanted 1 extra slot for Xen itself. Hence before you
move to using ARRAY_SIZE() everywhere it needs to really be clear what
the +1 here is used for.

>>> --- a/xen/include/xen/libfdt/libfdt-xen.h
>>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>>> @@ -13,6 +13,63 @@kkk
>>>  
>>>  #include <xen/libfdt/libfdt.h>
>>>  
>>> +static inline int __init fdt_cell_as_u32(const fdt32_t *cell)
>>
>> Why plain int here, but ...
>>
>>> +{
>>> +    return fdt32_to_cpu(*cell);
>>> +}
>>> +
>>> +static inline uint64_t  __init fdt_cell_as_u64(const fdt32_t *cell)
>>
>> ... a fixed-width and unsigned type here? Question is whether the former
>> helper is really warranted.
>>
>> Also nit: Stray double blank.
>>
>>> +{
>>> +    return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | fdt32_to_cpu(cell[1]);
>>
>> That is - uniformly big endian?
> 
> These helpers are disappearing, so it doesn't matter. This is basically
> an open coded:
> 
>   fdt64_to_cpu(*(const fdt64_t *)fdt32)
> 
> And, yes. DTBs are standardised as having big-endian properties, for
> better or worse :/
> 
>>
>>> +}
>>
>> Marking such relatively generic inline functions __init is also somewhat
>> risky. 
> 
> They were originally in domain-builder/fdt.c and moved here as a result
> of a request to have them on libfdt. libfdt proved to be somewhat
> annoying because it would be hard to distinguish accessors for the
> flattened and the unflattened tree.
> 
> I'd personally have them in domain-builder instead, where they are used.
> Should they be needed somewhere else, we can always fator them out
> somewhere else.
> 
> Thoughts?

As long as they're needed only by domain-builder, it's probably fine to have
them just there.

Jan

