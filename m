Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC7ADB3A0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 16:24:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017330.1394312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRAkb-000611-2I; Mon, 16 Jun 2025 14:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017330.1394312; Mon, 16 Jun 2025 14:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRAka-0005yI-Un; Mon, 16 Jun 2025 14:23:52 +0000
Received: by outflank-mailman (input) for mailman id 1017330;
 Mon, 16 Jun 2025 14:23:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRAkZ-0005yC-HB
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 14:23:51 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 853915bd-4abd-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 16:23:49 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso1269574f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 07:23:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365dea7d74sm61591235ad.152.2025.06.16.07.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 07:23:48 -0700 (PDT)
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
X-Inumbo-ID: 853915bd-4abd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750083829; x=1750688629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ikZ+uy/7321zHy987ZD8U0JK5yqsJpmJtPIaQKmwP1Y=;
        b=OGHIJyoPzyTqLA0LGjDwXKlcv8M5B7w8uY+SCcO68XrjlfhjgWyZbpfocRMglmEtEI
         4RNntweAZDktcakGZoF/ZCN/hxjcieXDtv0iwtFoMyVq464NfB6KJEm8FUcwnDP5Pxdt
         dyfRYXOtAIl8ELgb9RtwCCWnpQYmjUg/Ql8AP0rBiMdI3QLEHNbGJcUFZcdZFM9sOl/5
         L+kD5xEqz5oPKsfUlPCUCrOaRPybHRwsy9EJ1pYvo/aGGTuE67Kfsvkqz+cTHI627LXC
         /XBXRB6UqFmULsi8iQ+f3gS8pba/1u5rAgu+5k04x9bg0oP0OqYscAiYFPY9oBOTsf/x
         sg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083829; x=1750688629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikZ+uy/7321zHy987ZD8U0JK5yqsJpmJtPIaQKmwP1Y=;
        b=SjZHaSPB+k9qTvZak28JuKb0DziOAnC3hoFPctelG4/UUt1QWaL1aR3QdGL6aEMH/I
         GUZttUW4uBeOMsoSvb7qwxaiwKWSzOxSRG/A6qb8BKv6DLtkjY/A2YCSuWw0/Y774x5R
         nfCHo/xVf9Uk5wdFQ8omi6kawCn8/UBVGFtSutgswINkRoA65K3nHhAryLev8agpH4pg
         qlO1jMkZjH789rP6ah/YECHd2rGYghkKESoFUS07JFx37dz0LzBKU9I+KI7ejykn9dlq
         La5bUwwbiBMWYCMQeD96UMglOugl0GIK/0kZJ7/GSnTaeme7We5ECxjSiupsKm8mWDG+
         m16g==
X-Gm-Message-State: AOJu0YzUG4c/8tZXPYm17c0MqDoEW16CPd6iEZTkBfwtZfMydXn2h4X7
	lbUFCk/H7AMjxzJhWI3tG1WLVBA2q3t0teXvrv4Mkpj45I3s5AuxU0GjF8KlC+ChFQ==
X-Gm-Gg: ASbGncvMNFx1CF2DsqwzORIsDjLOSZBlyVTt19ZheArb3GxdRSpDkE2mBclDbcOHVZm
	bFiccQxcR8ghWKVHxtEjyfeANsbHUWG+uFn4M4yHK+PUhKYFzaqROHfPP1CllpRBYsY1I/iYvZJ
	y7tAMlG3oXSy1B7GPaRlUkTQJ9Hpu1LxgOc2mEBr5MDL+g8vKnm6jEfAHyZjApzIKC665AkoLEE
	bH7Jw9IQ1UPmy4k5M04LA+f2FED15DPce0Qa+51GjJ1/f+vnxP57YdrPl9U2rqOuFA05+Xdd0aS
	qx5WYtyw5djPMnugCAtWx48V1OqfMYB4QB6UQmwMUxNJcHYUwGGpmuku0DYOipDKxLJmlCpRVRE
	7Uvj1Yr028KWB24Tgqq8MZSZQLilMea6l9WyFvZ8z7sdG656MfcyXrz292A==
X-Google-Smtp-Source: AGHT+IEw2+wFCttQxw8V67O46a2FNE+XdbiKrmlps/8wTagcFGcIM/mUbskwuAs/l5hBtSdglPploQ==
X-Received: by 2002:a05:6000:2507:b0:3a4:efc0:c90b with SMTP id ffacd0b85a97d-3a5723974e2mr8459803f8f.15.1750083828819;
        Mon, 16 Jun 2025 07:23:48 -0700 (PDT)
Message-ID: <9b036f26-f275-48d0-9a33-7cef38b29f48@suse.com>
Date: Mon, 16 Jun 2025 16:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: arrange to conserve on DMA reservation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <6565e881-ec59-4db4-834a-f694bf1b9427@suse.com>
 <aFAbqhfmM_GBxjVC@macbook.local>
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
In-Reply-To: <aFAbqhfmM_GBxjVC@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.06.2025 15:27, Roger Pau Monné wrote:
> On Tue, Feb 25, 2025 at 03:58:34PM +0100, Jan Beulich wrote:
>> Entities building domains are expected to deal with higher order
>> allocation attempts (for populating a new domain) failing. If we set
>> aside a reservation for DMA, try to avoid taking higher order pages from
>> that reserve pool.
>>
>> Instead favor order-0 ones which often can still be
>> supplied from higher addressed memory, even if we've run out of
>> large/huge pages there.
> 
> I would maybe write that last sentence as:  force non zero order
> allocations to use the non-DMA region, and if the region cannot
> fulfill the request return an error to the caller for it to retry with
> a smaller order.  Effectively this limits allocations from the DMA
> region to only be of order 0 during physmap domain population.

I can take this text, sure.

>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -192,6 +192,14 @@ static void populate_physmap(struct memo
>>           * delayed.
>>           */
>>          a->memflags |= MEMF_no_icache_flush;
>> +
>> +        /*
>> +         * Heuristically assume that during domain construction the caller is
>> +         * capable of falling back to order-0 allocations, allowing us to
>> +         * conserve on memory otherwise held back for DMA purposes.
>> +         */
>> +        if ( a->extent_order )
>> +            a->memflags |= MEMF_no_dma;
> 
> For PV domains: is it possible for toolstack to try to allocate a
> certain amount of pages from the DMA pool for the benefit of the
> domain?

Not directly at least. To benefit the domain, it would also need to be
told where in PFN space those pages would have ended up.

> I also wonder if it would make sense to attempt to implement the
> logic on the toolstack side: meminit_{hvm,pv}()?
> 
> No strong opinion, but slightly less logic in the hypervisor, and
> won't change the interface for possibly existing toolstacks that don't
> pass MEMF_no_dma on purpose.

MEMF_no_dma isn't exposed outside of the hypervisor.

Jan

