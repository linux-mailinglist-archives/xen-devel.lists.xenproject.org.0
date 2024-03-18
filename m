Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F3787E57B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 10:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694555.1083383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm93u-0006QX-1H; Mon, 18 Mar 2024 09:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694555.1083383; Mon, 18 Mar 2024 09:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm93t-0006Np-Tz; Mon, 18 Mar 2024 09:13:41 +0000
Received: by outflank-mailman (input) for mailman id 694555;
 Mon, 18 Mar 2024 09:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rm93s-0006Nj-JV
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 09:13:40 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce6771ce-e507-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 10:13:38 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56a2b881911so735688a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 02:13:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ko6-20020a170906aa0600b00a46a9c38a64sm2301711ejb.65.2024.03.18.02.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 02:13:37 -0700 (PDT)
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
X-Inumbo-ID: ce6771ce-e507-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710753218; x=1711358018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FzxNvNLNHvnL98ErJsYdzvurFiNavMb6GDLPsMwaO4k=;
        b=OOYUhqEdF/hYOD/PwsKN0ZPP+DK1B1UMangK3/A36KSvlj/KpA7Hb2ti36og8GL1D/
         onFvjdqqN5sz2yCpRo/ssDnfS0F40xvikrejCFA6xY+Z3a+XB78Rgon3MEri0w0ToSvK
         e8cAVoqJ4QB8nZbp4OaRcqkQ+xlCLVla7lS4zhK3e8GzcIP26kEgdrobFHJmA7qGDdDL
         qO/NmBqwhL7FbbyQfkY3LY4aM8zUbB2LMuADvk0z4HFiDog/4bO5xGd8wC957Ym48+RR
         B95vjMIjZkYao7keTYw4ZiOlGuVJFcK9g7vBtrdcU7i79v1pEEXNrIyAtPeG8rLI0gd/
         q9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710753218; x=1711358018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzxNvNLNHvnL98ErJsYdzvurFiNavMb6GDLPsMwaO4k=;
        b=aJ5Vd57V7RXId/zuokPZXztd1qnh8SgazdznPPt/10ttvyUnU9OoBeUaNQA+a3Lzlq
         PXcgMIJ/N2GzFNvN7Jfg7xplEh3s6jJwqafmjXc04EheG8lDT6xd//xZCZdL/oWFxzTF
         HITqaGkqxzrkoyp/XmPQ6SFrsRHRgwvSzkjaWh5ffCOIRA2Pu0GRYAu2HTRXUt6Mfdce
         0tnm9ux2lN5z0rCfo7sjrBX0wxS6LScexw8j+eGOMIro2L1Tw2/mht5qBuAx8ST4LYmn
         UCJvrfDA/bPeBYmI3GBqRm0n36XoG1DvP8/sjDwcMzWzNGmH5pRfh/2mAP3nnQVOzMux
         t+oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJV5TfFTiICTJ7PJD4nFLlv64vulcnqni5RHYWOYuYMcED9DXG2cCKdKcwXX4meMqOjszMMoSC1QBCcQO+22vBQsUNYtU59U5/f4Grspc=
X-Gm-Message-State: AOJu0Ywumiu6TqI1JvfrVacOpidTHWsOj5bRARbDt0Xxf+bWwUVFBWYV
	b1PUnGZ37FF1bxuJstYU8RJ1YJkbmXhFy5u+4cSlcbwNbSkJrf/0KsGcbYPrqg==
X-Google-Smtp-Source: AGHT+IEZYzPAWMXU4xehCEXy5woTKeEXJhZaerU86HdYBn8dglzctLbR7090UcIdiWu/FGihzaC5kQ==
X-Received: by 2002:a17:906:8406:b0:a46:7384:3233 with SMTP id n6-20020a170906840600b00a4673843233mr6610762ejx.57.1710753218100;
        Mon, 18 Mar 2024 02:13:38 -0700 (PDT)
Message-ID: <f088d9ac-fded-495e-9cc2-8514f7eb3e31@suse.com>
Date: Mon, 18 Mar 2024 10:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] xen: Swap find_first_set_bit() for ffsl() - 1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-7-andrew.cooper3@citrix.com>
 <ba0552cc-10eb-460d-89a1-ffc43fe75542@suse.com>
 <1356dd16-03e1-4c01-9aac-597a127dea85@citrix.com>
 <cc3c0484-a896-4100-8400-50036d1e8c71@citrix.com>
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
In-Reply-To: <cc3c0484-a896-4100-8400-50036d1e8c71@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2024 19:51, Andrew Cooper wrote:
> On 14/03/2024 6:47 pm, Andrew Cooper wrote:
>> On 14/03/2024 2:30 pm, Jan Beulich wrote:
>>> On 13.03.2024 18:27, Andrew Cooper wrote:
>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>> @@ -641,7 +641,7 @@ struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
>>>>      if ( contig_mask )
>>>>      {
>>>>          /* See pt-contig-markers.h for a description of the marker scheme. */
>>>> -        unsigned int i, shift = find_first_set_bit(contig_mask);
>>>> +        unsigned int i, shift = ffsl(contig_mask) - 1;
>>> The need for subtracting 1 is why personally I dislike ffs() / ffsl() (and
>>> why I think find_first_set_bit() and __ffs() (but no __ffsl()) were
>>> introduced).
>> It's sad that there are competing APIs with different bit-labelling, but
>> the optimiser does cancel the -1 with arch_ffs() (for at least x86 and
>> ARM that I studied in detail).
>>
>> I firmly believe that fewer APIs which are fully well defined (and can
>> optimise based on the compiler's idea of safety) is still better than a
>> maze of APIs with different behaviours.

I agree here. The anomaly (as I would call it) with ffs(), though, is what
makes me wonder whether we might not be better off introducing ctz() and
clz() instead. Unlike ffs() their name says exactly what is meant. This is
then also a clear hint, for Arm and RISC-V at least, what underlying
instruction is used. Plus there are matching builtins (unlike for e.g.
fls()).

>>> But what I first of all would like to have clarification on is what your
>>> (perhaps just abstract at this point) plans are wrt ffz() / ffzl().
>>> Potential side-by-side uses would be odd now, and would continue to be odd
>>> if the difference in bit labeling was retained. Since we're switching to
>>> a consolidated set of basic helpers, such an anomaly would better not
>>> survive imo.
>> I honestly hadn't got that far yet.  I was mainly trying to dis-entangle
>> the existing mess so RISC-V wasn't making it yet-worse.
>>
>> But yes - it warrants thinking about.
>>
>>
>> I was intending to do the fls() next then popcnt().   The latter has
>> quite a lot of cleanup wanting to come with it, and is more
>> architecturally invasive, and I know I've got a years-old outstanding
>> piece of work to try and do popcnt more nicely on x86.
>>
>> I have wanted ffz() in the past.  I think I just went with explicit ~
>> because I didn't want to continue this debate at the time.
>>
>> However, I (very much more) do not want a situation where ffs() and
>> ffz() have different bit-labellings.
>>
>>
>> There are no builtins, and having now studied the architectures we care
>> about... https://godbolt.org/z/KasP41n1e ...not even x86 has a "count
>> leading/trailing zeros" instruction.
> 
> Hopefully obviously, I meant ones here.   My point is that the compiler
> emitted code always has a NOT in it somewhere.

Right; I was about to ask but then remembered there was another mail from
you on this thread.

>> So using ffs(~val) really will get you the best code generation
>> available, and seeing as it halves the number of bitops to maintain, I
>> think this is the best tradeoff overall.
>>
>> I intend to put ffz() and __ffs() into linux-compat.h and leave them
>> there to discourage their use generally.

I'm okay with this plan. As per above I'd prefer if ffs() moved there, too.

Jan

