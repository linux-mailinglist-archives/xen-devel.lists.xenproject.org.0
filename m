Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C19D0B1C1E1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 10:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071354.1434827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZFN-0007vD-7f; Wed, 06 Aug 2025 08:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071354.1434827; Wed, 06 Aug 2025 08:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZFN-0007tY-4m; Wed, 06 Aug 2025 08:11:41 +0000
Received: by outflank-mailman (input) for mailman id 1071354;
 Wed, 06 Aug 2025 08:11:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujZFL-0007Yx-K8
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 08:11:39 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9b18d0d-729c-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 10:11:37 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-615378b42ecso9306705a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 01:11:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7970sm9557650a12.31.2025.08.06.01.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 01:11:36 -0700 (PDT)
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
X-Inumbo-ID: f9b18d0d-729c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754467897; x=1755072697; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bGISvtOa2MnUFsQ0A7k3q8FWescVysfVmbKZGuxHwhY=;
        b=g+SsWRFY6DKsaA7QGaTsN9tk4rdMyXpZGQadVgOjDooQpIkQ1a28Pa8w8AfxNgH5EE
         KCcmQK6PoG0JwF0afoS74pJWhsuHNzZAdnCb7kZDIeASuLHCMWkSFxtvG3sYMfroWukJ
         phr89cT5iwFWb5OohrtPWarmRd5gY/IpXPexKeJYWiA4OM+v5Cy92fwlM4ObfWMVLNFu
         4NCPRnrOYppY8bZ1nqLCZFiwCyQD34RhiP2LEIDMqdM89N2rRuw058B6ifXqIK0dbzD4
         u9WLY+xGNE4o5aWqGlQRwuUIwjcSQEkDg6AhvrwJ8KaJyOPi5HlU2kXgpmmowW6KKbHO
         uLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754467897; x=1755072697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGISvtOa2MnUFsQ0A7k3q8FWescVysfVmbKZGuxHwhY=;
        b=Ta+Qz3uTlJUl/i5LDf48Fo5Ie3MxOfh3X+jh3c/92TcGjtIRGPG7foF0pA+5dL6BLz
         esls+QTszbqU8pAva8axZK0Rw1/DOJ6WRFKNaHME8uGZoZJkQ5Ilzh7DlXUsOwF8YsKN
         tz7oeSJkXEvLIZxR2nuM09MylJDBwHqyxxdMYit3DV9+58ye+4r5XHp3Ff5bYhHof13Q
         6Qsat6WuvkNRW8f17Ur25unpgiXejrbryoad2rrbhs4acmP+em0/uEJ5T4fJSHhmld9M
         TIG8/6dsvttwg/Rsk2QW6Uc4cVEr+YKFshzXGp63R3O94NsNg18pCCcNys6mHSw89+Ud
         RFbA==
X-Forwarded-Encrypted: i=1; AJvYcCXrIM6V1EJcNHv1EFzfETF4QELzA8p6qCFVJXe6woXv/63ukBWhofkZ9+byTzqmjeEoHlijdEBuang=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBnCO2awu3c+8IPIJAmhprZqffJAC2gfAI9tD+pvC69fAgDwj+
	twrFc1INRWzTcUMKXC8vH3u0Xc7kgDQ7enzMuzbrL8MuDsGK/d8EV8jdMs0hlUKnNQ==
X-Gm-Gg: ASbGncvy1z9JXL2DWpzE+12HpNjd1tXcz6hZVpK5HHa9VzOfFBekuRPKqXA/mNH3Ti4
	0RcPV7jSTGbtkb83Ngb0LIM6tmf0Np1ztz0n2gd8zm0OJOE3x29PmxXIn7bGtGCXBd09nqihmSq
	nOxkpgqtvTwyN1EoA35ecE63klI0I4cFn1++GfxRop4DuK4oC+ayol9XRcKzaAi1bKMOtRT6zc5
	ulUIGfE6rWHaihWeM55Tc99s9XN7IaTHmYe24lv7CIo5TRo/Rws82VfOl/djtoaG8pGhk7N/sE9
	H7Da7zZV+ANoSeLalLrN00wxwDo/qhmyV8CgU29S6OulSDzX1KU0hNR2X5DTB0FvDWvjjAWfT9l
	jdBT0qVk6E//LpjMwGsy7VgEDJ9Q+tKgbT9w/i5NZgiYsqa/TZm/GSFycoUsuRnNnmcxYPWRXQK
	6wk21Lbx4=
X-Google-Smtp-Source: AGHT+IHkOXaUanvV5voduasXoNjNwoouw7JANXJw2EBEeMA6KiJt2+1DDCCppr13YU2fPNZa/h+fBw==
X-Received: by 2002:a05:6402:1e90:b0:615:5dbd:ccba with SMTP id 4fb4d7f45d1cf-61797c8cc2bmr1388703a12.11.1754467897172;
        Wed, 06 Aug 2025 01:11:37 -0700 (PDT)
Message-ID: <68da529e-7fd7-4ca5-b6ef-4c1f95423246@suse.com>
Date: Wed, 6 Aug 2025 10:11:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] x86/mm: adjust loop in arch_init_memory() to
 iterate over the PDX space
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250805095257.74975-1-roger.pau@citrix.com>
 <20250805095257.74975-9-roger.pau@citrix.com>
 <31691bf7-94bf-4f73-b04c-a32f86bb0e37@suse.com>
 <aJIi6wrNZck1DSU_@macbook.local>
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
In-Reply-To: <aJIi6wrNZck1DSU_@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.08.2025 17:27, Roger Pau Monné wrote:
> On Tue, Aug 05, 2025 at 02:38:38PM +0200, Jan Beulich wrote:
>> On 05.08.2025 11:52, Roger Pau Monne wrote:
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
>>> @@ -328,9 +328,20 @@ void __init arch_init_memory(void)
>>>              destroy_xen_mappings((unsigned long)mfn_to_virt(iostart_pfn),
>>>                                   (unsigned long)mfn_to_virt(ioend_pfn));
>>>  
>>> -        /* Mark as I/O up to next RAM region. */
>>> -        for ( ; pfn < rstart_pfn; pfn++ )
>>> +        /*
>>> +         * Mark as I/O up to next RAM region.  Iterate over the PDX space to
>>> +         * skip holes which would always fail the mfn_valid() check.
>>> +         *
>>> +         * pfn_to_pdx() requires a valid (iow: RAM) PFN to convert to PDX,
>>> +         * hence provide pfn - 1, which is the tailing PFN from the last RAM
>>> +         * range, or pdx 0 if the input pfn is 0.
>>> +         */
>>> +        for ( pdx = pfn ? pfn_to_pdx(pfn - 1) + 1 : 0;
>>> +              pdx < pfn_to_pdx(rstart_pfn);
>>> +              pdx++ )
>>>          {
>>> +            pfn = pdx_to_pfn(pdx);
>>> +
>>>              if ( !mfn_valid(_mfn(pfn)) )
>>>                  continue;
>>>  
>>
>> As much as I would have liked to ack this, I fear there's another caveat here:
>> At the top of the loop we check not only for RAM, but also for UNUSABLE. The
>> latter, like RAM, shouldn't be marked I/O, but we also can't use PFN <-> PDX
>> transformations on any such page.
> 
> Right you are.  I'm not sure however why we do this - won't we want
> the mappings of UNUSABLE regions also be removed from the Xen
> page-tables? (but not marked as IO)

Yes, I think this is a flaw in current code. Perhaps it was (wrongly) assumed
that no UNUSABLE regions would ever exist this low in a memory map? Imo we want
to deal with this in two steps - first sort the UNUSABLE issue, then improve
the dealing with what is passed to assign_io_page().

While there we may also want to find a way to tie together the 16Mb boundary
checks - the 16UL isn't properly connected to the BOOTSTRAP_MAP_BASE definition
in setup.c. Yet then: Am I overlooking something, or is the 16Mb boundary not
really special anymore? I.e. could e.g. BOOTSTRAP_MAP_BASE perhaps be moved (at
least in principle), either almost arbitrarily up (within the low 4Gb), or down
as much as to the 2Mb boundary? The relevant aspect here would be that the
comment saying "the statically-initialised 1-16MB mapping area" looks to be
stale, as of 7cd7f2f5e116 ("x86/boot: Remove the preconstructed low 16M
superpage mappings"). If there are excess mappings to worry about, those may
nowadays well live above the 16Mb boundary (because of it being 2Mb mappings
that head.S inserts into l2_directmap[]).

If I was to sensibly make changes to that code, I guess I first ought to find
a system which actually surfaces any (ideally "interesting") UNUSABLE ranges.
In any event, I think the cleanest thing we can do is split the loop in two,
one to deal with the removal of mappings between RAM regions up to the 4Gb
boundary, and the other to invoke assign_io_page() for holes between RAM ||
UNUSABLE ones. The latter would then be subject to your optimization. The
former could ignore the PDX aspect due to being limited to the low 4Gb, where
we never compress.

Jan

