Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0765FA893A8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 08:07:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951917.1347529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ZQo-0001vw-KV; Tue, 15 Apr 2025 06:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951917.1347529; Tue, 15 Apr 2025 06:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ZQo-0001tZ-Gp; Tue, 15 Apr 2025 06:06:02 +0000
Received: by outflank-mailman (input) for mailman id 951917;
 Tue, 15 Apr 2025 06:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4ZQm-0001tT-Sb
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 06:06:01 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b34e4928-19bf-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 08:05:58 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so4524065f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 23:05:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f36558b21sm148163895e9.18.2025.04.14.23.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 23:05:57 -0700 (PDT)
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
X-Inumbo-ID: b34e4928-19bf-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744697158; x=1745301958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUNOt4EhV9FfWY4vo0xFRNPFQhGXwy9DFCI0tMVJXkM=;
        b=R5vIT7f3XaV3rebID2xpvf/OanGJQHRgB7aj1RpERvRHRhI+gMvaEtAZcELhYYswXo
         UwMF0I0NGSZSHYamBaHDT7uauxPeTxyeiG2dIkWCR6fCsjosNzB92eJjvLvS8rsuyqte
         UMMhnfox5e/TVChJDoEZYFgIyK3u0sZtAWoX24G95oNw14u0JzvZ7JJ78LHcZ1PWjshn
         RRiKViAqZ68Rcf7xWjLGCTAtRQibUvq8eupPP6Gpvn0sDUZeJ6PugTBubD9Zsizedhtj
         hiL1t9YNuFcBvGsCFwH1dtaTPwnru75sTFjFpjGZvWqSqVEfS1l1TFa4ofzJTjRqdM+u
         Xqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744697158; x=1745301958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUNOt4EhV9FfWY4vo0xFRNPFQhGXwy9DFCI0tMVJXkM=;
        b=WMaKE9VXGh7sr1Wfe3oolRZtoMgfaY72XHj2UiwiGvHxivtftftnoXKZG8HMc23htM
         UMxNIeGJ+3LMr0GxzQSOoN9WSdOlU3z2afwEPpBiJnKDmdF+i09y1jHFZLTZcTItkH+i
         aV4Ni67M6SNc2xIVdogdIRV4zz3Kg8W0/alMzivTQjmrLrTl9KIGcxfBXIFBL34UU6Ql
         u7EHCCBh07SlI39OTwckqzyC4EjtgKSGAyXBCBFhrpSZ7GlcKVLxHOfpCbo4o2gjHImJ
         d+tocQCndXyaKif5Mfl4zjpiqo998zTG8J6zQjcVm4kslm7CX/yCpn/foxlSXc6sxltK
         p7qA==
X-Forwarded-Encrypted: i=1; AJvYcCUDceyS4Ehoix0UWXyuBK9moq54mi28vh9cOSbPIOVv4AZeQtrf1gsqvCMKK0xH5VaAqsMhO0Q48zE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHyU/upkBC3xzRAfGdg7iizgBbPXiSCj9x4r+iMvhLuob2yr9e
	t47XZI2DHtkTshQu7pX/amXkES5w7sbvFJfESujWy3eBLbP+jDILJXha7nNFCQ==
X-Gm-Gg: ASbGncv9tG0Uj+Idyjmtd7iT32uoytUhxUcGL6SHDjTVkybhDE+4U0JbwEhIwEqt0/C
	vxmHcfQXoUBnxKgEVq6TZVStr/FoqwwaDM2LoUqh+ILEVPou5ztYKaTq/sZvVaNMMoXcUSKTggg
	FrWvgbOtFxZhyrGvMcNntZQ1wwUVrPd/oM0ud9nJ2lqo1n+8zuBRyKdt0n7oqRytdakxtxvv8o9
	wA2efoi4/GraqRNBk6uBEwSn4bea08AmJm11Mlu0CSQ9/r2NLvfveSWPr8trPYJB9wm87WOPILg
	mqKC2JzUi6N8W4GsU7b8CH4PwBgkPIk6MJXkz89yLbDVDpESz4zUpOJjPUhZKFy0Xzd4It+H8wG
	9a/on34+ckOPa20pPH0c3LHFLuw==
X-Google-Smtp-Source: AGHT+IGf9urRi3ji9AG/IMdXp5P2nIGMruR6Pp1yHrCxAHr+GSM+uYO1kIOvsypYMZWkhhCoIRWQkQ==
X-Received: by 2002:a05:6000:1acf:b0:38d:d0ca:fbad with SMTP id ffacd0b85a97d-39ea51f46d0mr12046448f8f.14.1744697158148;
        Mon, 14 Apr 2025 23:05:58 -0700 (PDT)
Message-ID: <ea28d057-5fd5-4cc2-8833-5427015a4190@suse.com>
Date: Tue, 15 Apr 2025 08:05:56 +0200
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
 <3d2aa870-a1cb-4e33-841d-aee7b6b6db83@suse.com>
 <D96K3ZYDCY4D.11Q4T2TZLNNEU@amd.com>
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
In-Reply-To: <D96K3ZYDCY4D.11Q4T2TZLNNEU@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 20:01, Alejandro Vallejo wrote:
> On Mon Apr 14, 2025 at 4:05 PM BST, Jan Beulich wrote:
>> On 14.04.2025 15:37, Alejandro Vallejo wrote:
>>> On Thu Apr 10, 2025 at 11:42 AM BST, Jan Beulich wrote:
>>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>>> +/*
>>>>> + * Locate a multiboot module given its node offset in the FDT.
>>>>> + *
>>>>> + * The module location may be given via either FDT property:
>>>>> + *     * reg = <address, size>
>>>>> + *         * Mutates `bi` to append the module.
>>>>> + *     * module-index = <idx>
>>>>> + *         * Leaves `bi` unchanged.
>>>>> + *
>>>>> + * @param fdt           Pointer to the full FDT.
>>>>> + * @param node          Offset for the module node.
>>>>> + * @param address_cells Number of 4-octet cells that make up an "address".
>>>>> + * @param size_cells    Number of 4-octet cells that make up a "size".
>>>>> + * @param bi[inout]     Xen's representation of the boot parameters.
>>>>> + * @return              -EINVAL on malformed nodes, otherwise
>>>>> + *                      index inside `bi->mods`
>>>>> + */
>>>>> +int __init fdt_read_multiboot_module(const void *fdt, int node,
>>>>> +                                     int address_cells, int size_cells,
>>>>> +                                     struct boot_info *bi)
>>>>
>>>> Functions without callers and non-static ones without declarations are
>>>> disliked by Misra.
>>>
>>> Can't do much about it if I want them to stand alone in a single patch.
>>> Otherwise the following ones become quite unwieldy to look at. All I can
>>> say is that this function becomes static and with a caller on the next
>>> patch.
>>
>> Which means you need to touch this again anyway. Perhaps we need a Misra
>> deviation for __maybe_unused functions / data, in which case you could
>> use that here and strip it along with making the function static. Cc-ing
>> Bugseng folks.
> 
> It's a transient violation, sure. Do we care about transient MISRA
> violations though? I understand the importance of bisectability, but
> AUIU MISRA compliance matters to the extent that that the tip is
> compliant rather than the intermediate steps?

Thing is that quite a few rules are blocking now. I haven't checked whether
the one here (already) is; if it isn't, we can't exclude it will be by the
time this patch is committed. If then the next patch isn't committed
together with it, we'd face a CI failure.

> Another option would be to fold them this patch and the next together
> after both get their R-by. As I said, I assumed you'd rather see them in
> isolation for purposes of review.

As it looks it's all plain code additions, so reviewability would merely
mildly suffer from patch size. But afaict there would be no loss of clarity.

>>>>> +    /* Otherwise location given as a `reg` property. */
>>>>> +    prop = fdt_get_property(fdt, node, "reg", NULL);
>>>>> +
>>>>> +    if ( !prop )
>>>>> +    {
>>>>> +        printk("  No location for multiboot,module\n");
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +    if ( fdt_get_property(fdt, node, "module-index", NULL) )
>>>>> +    {
>>>>> +        printk("  Location of multiboot,module defined multiple times\n");
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>> +    ret = read_fdt_prop_as_reg(prop, address_cells, size_cells, &addr, &size);
>>>>> +
>>>>> +    if ( ret < 0 )
>>>>> +    {
>>>>> +        printk("  Failed reading reg for multiboot,module\n");
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>> +    idx = bi->nr_modules + 1;
>>>>
>>>> This at least looks like an off-by-one. If the addition of 1 is really
>>>> intended, I think it needs commenting on.
>>>
>>> Seems to be, yes. The underlying array is a bit bizarre. It's sizes as
>>> MAX_NR_BOOTMODS + 1, with the first one being the DTB itself. I guess
>>> the intent was to take it into account, but bi->nr_modules is
>>> initialised to the number of multiboot modules, so it SHOULD be already
>>> taking it into account.
>>>
>>> Also, the logic for bounds checking seems... off (because of the + 1 I
>>> mentioned before). Or at least confusing, so I've moved to using
>>> ARRAY_SIZE(bi->mods) rather than explicitly comparing against
>>> MAX_NR_BOOTMODS.
>>>
>>> The array is MAX_NR_BOOTMODS + 1 in length, so it's just more cognitive
>>> load than I'm comfortable with.
>>
>> If I'm not mistaken the +1 is inherited from the modules array we had in
>> the past, where we wanted 1 extra slot for Xen itself. Hence before you
>> move to using ARRAY_SIZE() everywhere it needs to really be clear what
>> the +1 here is used for.
> 
> Ew.  Ok, just looked at the code in multiboot_fill_boot_info and indeed
> the arrangement is for all multiboot modules to be in front, and Xen to
> be appended. But bi->nr_modules only lists multiboot modules, so
> increasing that value is therefore not enough (or
> next_boot_module_index() would fail).
> 
> I need to have a proper read on how this is all stitched together.  I
> may simply swap BOOTMOD_XEN with the next entry on append. Though my
> preference would be to _not_ have Xen as part of the module list to
> begin with. Before boot_info that was probably a place as good as any,
> but this would be much better off in a dedicated field.
> 
> I don't see much in terms of usage though. Why is it being added at all?

For hyperlaunch I fear it's you who needs to answer this question. For
pre-hyperlaunch it's (primarily?) for consider_modules(), iirc. See two
of the three comments ahead of its non-recursive invocations.

Jan

