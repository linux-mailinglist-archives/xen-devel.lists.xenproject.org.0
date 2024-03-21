Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0636A885CE6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 17:04:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696468.1087442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnKtg-0000tf-5R; Thu, 21 Mar 2024 16:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696468.1087442; Thu, 21 Mar 2024 16:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnKtg-0000s4-2T; Thu, 21 Mar 2024 16:04:04 +0000
Received: by outflank-mailman (input) for mailman id 696468;
 Thu, 21 Mar 2024 16:04:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnKte-0000ru-NN
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 16:04:02 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1747b28-e79c-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 17:04:00 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56bcede226eso874514a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 09:04:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m22-20020a50ef16000000b00569a2f698d7sm26271eds.49.2024.03.21.09.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 09:03:59 -0700 (PDT)
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
X-Inumbo-ID: a1747b28-e79c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711037040; x=1711641840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2AFIdCcA/T9XPCpHDgu1ZX7Nv4mvO8XCX39UZzBP9A=;
        b=f+BQ772FzYoHpCevAho7XgSWtL7Vd0GVjNbQwSTeWW5rZSvGsT0xjzMC/oh8nTiJAW
         PX71/aV0EGL9FGPkzAIdOsAprbxrDtNcjYBw3pxLXRWFqprho+M3dFfNAwWHETxG0/kj
         zhgVty68XQ9O152UiK2YBHW1xH/ApfAnDFRN/e8XVJy5wd6txk2zVWJBxKwOH/r8yE0H
         1p2XRekWpTD5IC6aNZOtXA+hiHCU1y3Sls5ZEHgptPjioAvClv2PHaupJcGMwpoieX/N
         F4KzVX4dxkcGyLOVrQ1+eZQREl23t7ek4xD0O9OulrVLYOkcLKrwWvhwebJOtDVlEKUQ
         2OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711037040; x=1711641840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2AFIdCcA/T9XPCpHDgu1ZX7Nv4mvO8XCX39UZzBP9A=;
        b=ZarebplZyU30ejYznLWos3Mgi8xT0W8fLSbEuf1gU6Ip1l7Gjsm5Jhn858gi9J8598
         SMHb7TLR8OygmcFr+CRpV/Xbx6sryIQhEauoyycnqUuOQXRmMPCcM13ozy3MCGeFI+R8
         /v6uAHr385AYwpvhdm6fbYMbE5oOT0xwuvhtYQiBaijHcB3JWFB2F1ThXCnv8rR/rxHT
         qXtPKoLBaox5AT1nfEiee/RbUkjJ2TsO4XAaGieCkbemWPC3Lr5q/1DTemSRbDYy3qxs
         jRuWXvgL4mhdGuvl384AW1YRm4NtjG3TNjYh7uRjODnItozcOO++FhxObgm58nuNEO2Z
         7Bmg==
X-Forwarded-Encrypted: i=1; AJvYcCXxlmGLn2tmdo5tjBtjgfbKJ07XvvLQfRx/F8QSOyx/yZfGzoMB3EDnTz/G3BytpKeh05/Rzb/4bblgeR2xVExLVTjOyc8EbfHzAJ1NM3s=
X-Gm-Message-State: AOJu0YztYpCC6mmfM3hOTdah/1Xnkmfe2E+YPSqsRVtbW4erMgGG1Gov
	OPKLUoxCuZ19CSpZ62PXSE5W2iaNVSZSwTwtFvyu0B5m5Uo4xl1LefqYtFXfeA==
X-Google-Smtp-Source: AGHT+IEmDNwTz7WhbmompA0vh5i1mDCstUqa5eMSQCWUVWuFG2LhylHKAbSdd4T+nMB0ZEupkVYjJg==
X-Received: by 2002:a05:6402:2219:b0:568:cec0:2f84 with SMTP id cq25-20020a056402221900b00568cec02f84mr3417791edb.22.1711037040135;
        Thu, 21 Mar 2024 09:04:00 -0700 (PDT)
Message-ID: <4e1f10e3-c2b5-49b9-830d-e7582c714d43@suse.com>
Date: Thu, 21 Mar 2024 17:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/14] xen: add cache coloring allocator for domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-11-carlo.nonato@minervasys.tech>
 <fee07e30-e73a-4c1f-92f3-3e4ef7bc707a@suse.com>
 <CAG+AhRXx-TL_Fto0TevZB5d1gc3iOq9OG8Ev1jTdELf1x4PJXQ@mail.gmail.com>
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
In-Reply-To: <CAG+AhRXx-TL_Fto0TevZB5d1gc3iOq9OG8Ev1jTdELf1x4PJXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2024 16:36, Carlo Nonato wrote:
> On Tue, Mar 19, 2024 at 5:43 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.03.2024 11:58, Carlo Nonato wrote:
>>> +static void __init init_color_heap_pages(struct page_info *pg,
>>> +                                         unsigned long nr_pages)
>>> +{
>>> +    unsigned int i;
>>> +    bool need_scrub = opt_bootscrub == BOOTSCRUB_IDLE;
>>> +
>>> +    if ( buddy_alloc_size )
>>> +    {
>>> +        unsigned long buddy_pages = min(PFN_DOWN(buddy_alloc_size), nr_pages);
>>> +
>>> +        init_heap_pages(pg, buddy_pages);
>>
>> There's a corner case where init_heap_pages() would break when passed 0
>> as 2nd argument.
> 
> I don't see it. There's just a for-loop that would be skipped in that case...

Look at the first comment in the function and the if() following it. I
don't think that code would work very well when nr_pages == 0.

>>> +static void dump_color_heap(void)
>>> +{
>>> +    unsigned int color;
>>> +
>>> +    printk("Dumping color heap info\n");
>>> +    for ( color = 0; color < get_max_nr_llc_colors(); color++ )
>>> +        if ( free_colored_pages[color] > 0 )
>>> +            printk("Color heap[%u]: %lu pages\n",
>>> +                   color, free_colored_pages[color]);
>>> +}
>>
>> While having all of the code above from here outside of any #ifdef is
>> helpful to prevent unintended breakage when changes are made and tested
>> only on non-Arm64 targets, I'd still like to ask: Halfway recent
>> compilers manage to eliminate everything? I'd like to avoid e.g. x86
>> being left with traces of coloring despite not being able at all to use
>> it.
> 
> I don't know the answer to this, sorry.

Yet it is important to have.

Jan

