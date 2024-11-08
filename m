Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8537B9C1763
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 09:02:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832259.1247670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Jwg-0007Wt-Pm; Fri, 08 Nov 2024 08:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832259.1247670; Fri, 08 Nov 2024 08:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Jwg-0007U4-Mb; Fri, 08 Nov 2024 08:02:18 +0000
Received: by outflank-mailman (input) for mailman id 832259;
 Fri, 08 Nov 2024 08:02:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t9Jwe-0007Ty-Rd
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 08:02:16 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2f28b55-9da7-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 09:02:12 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-539f2b95775so2221132e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 00:02:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177de0428sm24721545ad.105.2024.11.08.00.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 00:02:11 -0800 (PST)
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
X-Inumbo-ID: c2f28b55-9da7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMjkiLCJoZWxvIjoibWFpbC1sZjEteDEyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMyZjI4YjU1LTlkYTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDUyOTMyLjkxMjYyNCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731052932; x=1731657732; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2BlHD35Knz/aC0dFL0tPw1OQ7PsCeak2NV8LlDj7bJE=;
        b=SBT6BIhoVSE7XKjoWZ91+ngAfYRy5DizhYUi+N7Nyqe1OoON5D0Z+trYjLgM/MuCR0
         Zxux4Gqd4IZ0TjdvKzoVEEDuH9vOs4LSPlRTO+9+oMRMPMhTcdEcsp+Yg82Q+bRZZIv+
         k1v2NzP9RYdIhNs/Acn31MCVxhBsiaaE9epcvb2Um73XYztB1dogfwQyP67dYyrB9xJn
         0zmVps5e8jai63BTnM54gj5n8biO048xZSTXxHUIK7uW19TGrdZO+iMOJ7dRRpiunBjW
         uzQH1RTC01yGUjxB91NxkDrElNZaW2YNUv/nwwwglJ5stMVo1JO7iftm39Q1WhHEN9e8
         +zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731052932; x=1731657732;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BlHD35Knz/aC0dFL0tPw1OQ7PsCeak2NV8LlDj7bJE=;
        b=MxX6HmJeDPuNOIHwzfb5NyjQjcX3KxWdIdkfJRNCbETZTe9t6w2oAPA/vyxyxc2c3T
         9Q08MVub1isQkFkBef3vWb26PyPP18UhW38RytVnzd7ceOYS9ranVa/HOpyl/RtPpDAC
         gxpqZL66NtrIT+jWeOyVOkAJO/6tOunEY9Y3W69mZW1dxH3xYbk8zrH8balGBJQkeAfC
         9CMPNZ2Vhtp13iMUgpFEAxpgUt0ZL3LJIEnZoJl8SoLlTdqBEvjYS4zPOjKlnkiUbBuE
         siwuP5cH/FUNVhfgBoatUefHoIX16oeNGVkEiUVFMFgrBGn67ENRCAzJ9xWeVPI3tSyB
         QR8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUR0TZvNpM0qwmqV4mxhNlSf77I2tEsaeycmX+a7ij3ENZ/oPTZg6tRWBv/AE0d1zzXvScSY8ZdluI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweGP8FyKbU6FVIdIgeEhnTxEHAxaFTJLiw25ikdlElSP9rproH
	ZQtigv1EqsCoyfblEG6VaYaR9t3FPsOde6ToaXoS97rWe7bTz/Rqb0GzefPodQ==
X-Google-Smtp-Source: AGHT+IFPtu9iSTUNO23Cpz+rGBBTTtc7gw2BvHJxka/znWI5SDwqxE8GJ6oi848DUpzmpWPMaLMcgw==
X-Received: by 2002:a05:6512:1594:b0:539:8f68:e036 with SMTP id 2adb3069b0e04-53d862cd727mr1544281e87.34.1731052932145;
        Fri, 08 Nov 2024 00:02:12 -0800 (PST)
Message-ID: <991049e4-124f-4957-af4a-f01d32a41eb5@suse.com>
Date: Fri, 8 Nov 2024 09:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_mm()
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1730465154.git.oleksii.kurochko@gmail.com>
 <0f7cd809e848607408ff4615e55b847f5a524559.1730465154.git.oleksii.kurochko@gmail.com>
 <9e22b5ad-634f-48b7-b64c-fc44319a1d4d@suse.com>
 <8380261d24388e453e74514dad8216c97e3bebee.camel@gmail.com>
 <15f8c4d9-bd90-4b1e-9cea-53e62d601a58@suse.com>
 <779e315475c8fcbe6226767f96f67c88a0ad4eb7.camel@gmail.com>
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
In-Reply-To: <779e315475c8fcbe6226767f96f67c88a0ad4eb7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.11.2024 13:32, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-11-07 at 10:19 +0100, Jan Beulich wrote:
>> On 06.11.2024 13:44, oleksii.kurochko@gmail.com wrote:
>>> On Tue, 2024-11-05 at 16:20 +0100, Jan Beulich wrote:
>>>> On 01.11.2024 14:16, Oleksii Kurochko wrote:> @@ -423,3 +429,138
>>>> Plus, unless I'm mistaken, the function continues to rely on ps
>>>> == 0
>>>> as
>>>> input. Just that the dependency is now better hidden.
>>>> Specifically if
>>>> you
>>>> calculate nr_mfns from the difference, and then use that for
>>>> allocation,
>>>> then you need to offset the start of the mapping you create
>>>> accordingly.
>>> I'm not quite understanding why the method of calculating nr_mfns
>>> affects how the frame_table is mapped. Isn’t it only necessary to
>>> calculate the correct size of the frame_table that needs to be
>>> allocated?
>>
>> Assume there's 4G of memory actually starting at 16G. Afaict you'll
>> allocate a frame table for those 4G, but you'll map it right at
>> FRAMETABLE_VIRT_START. Hence it'll cover the first 4G of physical
>> addresses, but _none_ of the actual memory you've got.
> I need to clarify some basics about the frame table.
> 
> Does Xen expect that frame_table[0] = 0 (PA), frame_table[1] = 4k (PA),
> ..., frame_table[x] = RAM_START_PA, frame_table[x+1] = RAM_START_PA +
> 4k, and so on?

Not strictly, no. You'll find that common code has very few uses of
frame_table, so many aspects are fully up to the arch. However, there
is the assumption you mention above in PDX space. When PDX == PFN
clearly that assumption would then also hold for PFNs.

> My understanding is that it could be done as follows: frame_table[0] =
> RAM_START_PA, frame_table[1] = RAM_START_PA + 4k, and so on, taking
> into account mfn_to_page() and page_to_mfn() logic. (And yes, in that
> case, the current implementations of mfn_to_page() and page_to_mfn()
> aren't correct and should be updated as suggested here:
> https://lore.kernel.org/xen-devel/cover.1730465154.git.oleksii.kurochko@gmail.com/T/#me2fc410f3d4758b71a9974d0be18a36f50d683b1as
> as these implementations are based on that ps == 0). With this setup,
> mapping FRAMETABLE_VIRT_START to base_mfn should be correct, shouldn’t
> it?

Yes.

> With the current implementations of mfn_to_page() and page_to_mfn(), we
> either need to allocate a larger frame_table to cover the [0, ram_end)
> range (in which case mapping FRAMETABLE_VIRT_START to base_mfn would
> work), or change the mapping to frame_table=( FRAMETABLE_VIRT_START +
> PFN_DOWN(ram_start) ) -> base_mfn. Or to not loose virtual addrees
> space of FRAMETABLE ( so the mapping will still be
> FRAMETABLE_VIRT_START -> base_mfn ) to do the similar to directmap
> mapping ( or what the changes suggested in the link above). Is my
> understanding correct?

Largely yes. There's one more aspect to consider: Even when frame_table[0]
maps MFN 0, the initial part of frame_table[] doesn't necessarily need
mapping to any memory when RAM starts at a much higher address. Valid
struct page_info instances only need to exist for any MFN for which
mfn_valid() returns true.

>>>>  At
>>>> which point you may need to apply extra care to cover the case
>>>> where
>>>> sizeof(*frame_table) is not a power of two, and hence e.g. the
>>>> first
>>>> valid
>>>> page might have a struct instance straddling a page boundary.
>>> The first valid page is aligned_ps ( which is aligned on a page
>>> boundary ) so assuming that sizeof(*frame_table) < PAGE_SIZE we
>>> can't
>>> straddle a page boundary, can we?
>>
>> But sizeof(*frame_table) < PAGE_SIZE means nothing as to the
>> alignment
>> of an individual struct instance in memory. Iirc sizeof(*frame_table)
>> is 48 for RISC-V, so the common alignment across struct instances
>> isn't
>> going to be better than 8, and there _will_ be instances straddling
>> page boundaries.
> If we speak about the alignment of an individual struct instance in
> memory, what is the issue with that, except that it could be less
> efficient when accessing this memory? This inefficiency could
> potentially be addressed by adding some padding to the struct page_info
> but then we will have bigger frame table size.
> Another issue I can see is that the size of the frame table could be
> calculated incorrectly. It may require an additional page to cover the
> case when the frame table size isn't aligned to PAGE_SIZE, but this is
> accounted for by rounding up the frame table size to 2MB
> (frametable_size = ROUNDUP(frametable_size, MB(2));) before allocating
> the frame table (base_mfn = alloc_boot_pages(frametable_size >>
> PAGE_SHIFT, PFN_DOWN(MB(2)));).
> 
> Something else should be considered?

Much depends on what your decision is as to the earlier aspect. If
you map [0,end), then what you have ought to be fine (except for
being wasteful).

Jan

