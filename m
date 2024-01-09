Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ABF82834A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 10:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664343.1034483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN8VW-0007Tc-F0; Tue, 09 Jan 2024 09:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664343.1034483; Tue, 09 Jan 2024 09:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN8VW-0007Ra-CT; Tue, 09 Jan 2024 09:34:50 +0000
Received: by outflank-mailman (input) for mailman id 664343;
 Tue, 09 Jan 2024 09:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTBC=IT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rN8VU-0007RU-8e
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 09:34:48 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53cbedb1-aed2-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 10:34:46 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50e7ddd999bso2911253e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 01:34:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w20-20020a056e0213f400b0035fffb69deasm497862ilj.81.2024.01.09.01.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 01:34:45 -0800 (PST)
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
X-Inumbo-ID: 53cbedb1-aed2-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704792886; x=1705397686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JWzlqt/ChhG0DRTHJ3OjWahudJZgniNMgs+f+5XcAH4=;
        b=UFqHnySQF+jUAB4EsmFlelEw6flL4FMnEVU3/EA4tu4m1QyCWrPAScLJlP6o59KY5Z
         vqNxq+lz1Pq//FjWe4fmUcjOf7mN1lWrcfUV0ZRQNZMKDbE+TN7h1c6Vqo4EeiMkbRV6
         xtGc7v5UtOx2ukWy3iJ6gGkJvdu7PReJSH8ZM+j0SYWfpvGFF8xVYvASOcf5QXc/4HL3
         swfXWYtoCckKW8Z4PzZkrj/61ZQ+vjdAB+jdmoxMnWdhacb0uQqBdJoZpfDeotGTt5dP
         hwxI2nogXuluhLLgFObOlcWk+4kdtBIkQ7mdMArjPyejR3YvIp9+E1LI2rCwIy6bur+U
         koag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704792886; x=1705397686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JWzlqt/ChhG0DRTHJ3OjWahudJZgniNMgs+f+5XcAH4=;
        b=eRNWIe2E7udGt1HQ4x1e7GlyGfAzq4it3gmLmcwY58aaknPWXfr2v0YqLueDkrrTMf
         S18flv6CGOmhrsHfqr0NhG6rGWfgwvHPYEfUyYJXey39ODZfxGlikwmKbqaYtrA5SkJr
         haqh6/2mxzTdjqAMUqkbf+bsZ5/r7Xsw+ks6f0GPfA9qrXVlnjy7R2Vg9Loh0VDXiOWB
         CIwflLLujBcGaX+U3DAklpQdfKYFecNTG9FIVCkYKv79FQBBAMISdV2DmDbAevPY/Won
         S5+AznKSaVdqmCkaDFRaxhqUF4yCvB+VSbe9RUvvCNm3+8U+Q2NZU2RoAIO732FlLNzm
         wDog==
X-Gm-Message-State: AOJu0Yzf9OxPccRcFBznix9EQiXH7TaLa5iPo+bgZMTQ8moorEG3HQ2S
	8/Bp0jIGkk/u2Q0L9fT6kWNHdMhyVDYG
X-Google-Smtp-Source: AGHT+IELC0ajPR0xL7JyDmRk07Mg53xaev20PFWPXQQwFKqzOtr6P4eDBIX9/dkHiJPsZaXbm5o0Jg==
X-Received: by 2002:a19:2d1d:0:b0:50e:9a0d:d402 with SMTP id k29-20020a192d1d000000b0050e9a0dd402mr2017002lfj.105.1704792886264;
        Tue, 09 Jan 2024 01:34:46 -0800 (PST)
Message-ID: <9f96d2ef-62fe-4197-b96d-45a6a828bc26@suse.com>
Date: Tue, 9 Jan 2024 10:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] xen: extend domctl interface for cache coloring
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, Julien Grall <julien@xen.org>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-5-carlo.nonato@minervasys.tech>
 <99295edf-6c9c-4d06-ba20-86db67100561@xen.org>
 <CAG+AhRWd9E5sQPY-sxN+WGTSWtvRXGN2FnZC2Vy6LPyynKGLcQ@mail.gmail.com>
 <4675a541-b9dc-476a-a6ff-0247a4403292@xen.org>
 <CAG+AhRX6Y2U6A1v=27KgUeWip115R1o+csEWcyCCooxE2Tac6w@mail.gmail.com>
 <33061994-0b49-4e4e-8698-d6901b9130dc@xen.org>
 <CAG+AhRXPt_e4+OUxbRLhf6W0reH1nmO7cC9-XoFKe_G8BVxt7w@mail.gmail.com>
 <e7029592-57e6-4c2a-ab11-f843047ce7f2@xen.org>
 <CAG+AhRV8B4dcoVHXbP2KW5xsB8BQRt4NpPuXsmjc1X149GZRRw@mail.gmail.com>
 <08b7535e-da40-4578-b865-9b350ace379c@suse.com>
 <CAG+AhRXAY1TX-z2Aw0F1oEOKY=pjU9dV+C+hu4aPjF8H2Uj=Ng@mail.gmail.com>
 <alpine.DEB.2.22.394.2401081319130.3675@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2401081319130.3675@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.01.2024 22:21, Stefano Stabellini wrote:
> On Mon, 8 Jan 2024, Carlo Nonato wrote:
>> Hi Jan,
>>
>> On Mon, Jan 8, 2024 at 5:40 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 08.01.2024 17:31, Carlo Nonato wrote:
>>>> On Mon, Jan 8, 2024 at 4:32 PM Julien Grall <julien@xen.org> wrote:
>>>>> On 08/01/2024 15:18, Carlo Nonato wrote:
>>>>>>> No. I am saying that that we should not be able to allow changing the
>>>>>>> colors after the memory has been allocated. To give an example, your
>>>>>>> current code would allow:
>>>>>>>
>>>>>>>     1) Setup the P2M pools or allocate RAM
>>>>>>>     2) Set the color
>>>>>>>
>>>>>>> This would render the coloring configuration moot.
>>>>>>>
>>>>>>> Whether we want to allow changing the coloring before hand is a
>>>>>>> different question and as I wrote earlier on, I don't mind if you want
>>>>>>> to forbid that.
>>>>>>
>>>>>> At the moment I'm relying on the toolstack in the sense that I know that it
>>>>>> will set colors right after domain creation and before memory allocation.
>>>>>> Calling alloc_domheap_pages() without a coloring configuration makes Xen
>>>>>> crash, so it's mandatory to have the configuration done before any allocation.
>>>>>> I know that we shouldn't rely on the toolstack this much, but I didn't
>>>>>> find a better way. Given this assumption, looking for an already existing
>>>>>> color configuration of a domain is sufficient to avoid what you are saying.
>>>>>>
>>>>>> Is it possible to enforce such a constraint with domctl? > I mean to be sure that this domctl will be called at a precise time.
>>>>>
>>>>> Yes. You can...
>>>>>
>>>>>>
>>>>>> Thanks.
>>>>>>
>>>>>>>> I don't know what to check that.
>>>>>>>
>>>>>>> You can check the size of the P2M pool (d->arch.paging.p2m_total_pages)
>>>>>>> is still 0. I think for RAM, you can check d->tot_pages == 0.
>>>>>
>>>>> ... reject the call if either of the two fields are not zero.
>>>>
>>>> What I'm saying is that Xen would crash before even reaching this point if no
>>>> colors were provided. Let's say that the toolstack or whatever hypercall user
>>>> isn't calling this domctl at all (or not at the right time), then the domain
>>>> colored allocator would always return null pages since there are no colors.
>>>> We would have a crash and your if (or mine) would be useless.
>>>
>>> Why is it that you can't simply allocated arbitrary memory if coloring
>>> information wasn't set up front? Aiui that'll be required anyway, as
>>> there shouldn't be a restriction that all domains have to use coloring.
>>
>> If coloring is enabled all domains are colored. It's one of our first
>> assumptions. We haven't developed something that works hybridly and supporting
>> that would require some rework.
> 
> I think that's a good assumption and I wouldn't go in the direction of
> supporting a mix of colored and non-colored. To benefit from cache
> coloring, all domains need to be colored, otherwise a single non-colored
> domain could thrash the cache of everyone else.

In which case the tool stack not having set up coloring data first should
lead to all allocation attempts failing. No crashes whatsoever.

Jan

