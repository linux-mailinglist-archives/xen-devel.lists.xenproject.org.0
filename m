Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D97BF871A10
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 10:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688675.1073134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhRXV-00082h-2z; Tue, 05 Mar 2024 09:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688675.1073134; Tue, 05 Mar 2024 09:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhRXV-00080R-0Q; Tue, 05 Mar 2024 09:56:49 +0000
Received: by outflank-mailman (input) for mailman id 688675;
 Tue, 05 Mar 2024 09:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhRXT-0007xL-Oy
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 09:56:47 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adc78e06-dad6-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 10:56:46 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so448465966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 01:56:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r2-20020a170906c28200b00a412d3d509fsm5873123ejz.181.2024.03.05.01.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 01:56:46 -0800 (PST)
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
X-Inumbo-ID: adc78e06-dad6-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709632606; x=1710237406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ucFQ0xxCbouAJ2JDdMP92CVuZCUdBlts7gkBrPP6vYI=;
        b=Al2s5bnNlzov5YlgnyqbvdcVimc5R97IeOcNJz97CoHJ2gwbhax57W+a42QL297HFb
         WlowQEeO0q1NxrrHA3cdko2+7DK1saNpxxKXScJfdxUA315qCIaJsxivPTMjJnsrNYAa
         W6R4E+ZP/XiiwUQSM8Lr7aZUavA9JQaiuIiu3q9rFKxPAQ8ktbmV0522qSoqt7B7VH3U
         evRrNvbM2tL2W+dMgqOppn/6toX8mgB4FKfKv6mLw56uIil2AGHb8n2byD4Kw9XBLBdb
         jb6tIG89vOF19Ixbpxw2Twd7fuic2CzVRAAsWNNdoMuqEmhEoQB7JsZsHKp9uyc/fora
         kwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709632606; x=1710237406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ucFQ0xxCbouAJ2JDdMP92CVuZCUdBlts7gkBrPP6vYI=;
        b=deFYw2szFrBprS4jMw2ovg00NLY5mbYzCfrcrnxoWsoADajHiC7I0nE+BBCO0FJDhz
         CL9zFauTBuhHrRZrhr20/5u6a0ENs2YLpXbNP/lC4doma2QIxf2njDaKh61kGaEguITO
         +GmmPe4vWhnkHIYFjRriYDL6jaVCZWVX2jw2B2O3+S4+tWj58Bcd/NuVjB7SYrbW6hB2
         9+2iaUw4R85RGHBBW95HvBmiv+9MRwZsQiX3jSv+o5qykQePMLkUxRWegEYhFZY81LMJ
         KfpMdnSIspecJXPvQ5Vgn5omEMxKntj9SnHRWgjU5Ecs2FEmJaOUKYAExuJFJEdjg8lY
         2kQg==
X-Gm-Message-State: AOJu0YzjyuAhKAg1qM1eUGe+sPooMjZag4L/B62I5zq63+FXaspbGkbG
	spG+q+Q/9losmyVkvJGEV8vNsBoWvU9fhRdEdNrYuLmyKSUD5FRL20KCbQA6BQ==
X-Google-Smtp-Source: AGHT+IHhh0YA00ouU8CyEgFMWh7iODFy5vSvFtvwL9rmrLJ9gcqhWiJGkarRd02AO5b1rO2s/YJR/g==
X-Received: by 2002:a17:906:1155:b0:a45:7451:d255 with SMTP id i21-20020a170906115500b00a457451d255mr2890254eja.29.1709632606446;
        Tue, 05 Mar 2024 01:56:46 -0800 (PST)
Message-ID: <da9d6a89-edd5-4127-aab2-758e19b7790c@suse.com>
Date: Tue, 5 Mar 2024 10:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader/PCI: skip huge BARs in certain calculations
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Neowutran <xen@neowutran.ovh>
References: <090d572c-5196-46b2-9d6b-741b7cb66d97@suse.com>
 <ZeWcNGRsjGgUosJY@macbook> <06cce36e-5936-4374-9b56-1cb166c2b8b7@suse.com>
 <Zebk-SiGk07Lj4FZ@macbook>
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
In-Reply-To: <Zebk-SiGk07Lj4FZ@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.03.2024 10:25, Roger Pau Monné wrote:
> On Mon, Mar 04, 2024 at 02:25:45PM +0100, Jan Beulich wrote:
>> On 04.03.2024 11:02, Roger Pau Monné wrote:
>>>> --- a/tools/firmware/hvmloader/pci.c
>>>> +++ b/tools/firmware/hvmloader/pci.c
>>>> @@ -33,6 +33,13 @@ uint32_t pci_mem_start = HVM_BELOW_4G_MM
>>>>  const uint32_t pci_mem_end = RESERVED_MEMBASE;
>>>>  uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
>>>>  
>>>> +/*
>>>> + * BARs larger than this value are put in 64-bit space unconditionally.  That
>>>> + * is, such BARs also don't play into the determination of how big the lowmem
>>>> + * MMIO hole needs to be.
>>>> + */
>>>> +#define HUGE_BAR_THRESH GB(1)
>>>
>>> I would be fine with defining this to an even lower number, like
>>> 256Mb, as to avoid as much as possible memory relocation in order to
>>> make the MMIO hole bigger.
>>
>> As suggested in a post-commit-message remark, the main question then is
>> how to justify this.
> 
> I think the justification is to avoid having to relocate memory in
> order to attempt to make the hole below 4Gb larger.

Upon further thinking about it, I'm now pretty convinced that any lowering
of the boundary would better be a separate change. Right here I'd like to
stick to just the technically implied boundary.

>>>> @@ -446,8 +455,9 @@ void pci_setup(void)
>>>>           *   the code here assumes it to be.)
>>>>           * Should either of those two conditions change, this code will break.
>>>>           */
>>>> -        using_64bar = bars[i].is_64bar && bar64_relocate
>>>> -            && (mmio_total > (mem_resource.max - mem_resource.base));
>>>> +        using_64bar = bars[i].is_64bar && bar64_relocate &&
>>>> +            (mmio_total > (mem_resource.max - mem_resource.base) ||
>>>> +             bar_sz > HUGE_BAR_THRESH);
>>>>          bar_data = pci_readl(devfn, bar_reg);
>>>>  
>>>>          if ( (bar_data & PCI_BASE_ADDRESS_SPACE) ==
>>>> @@ -467,7 +477,8 @@ void pci_setup(void)
>>>>                  resource = &mem_resource;
>>>>                  bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
>>>>              }
>>>> -            mmio_total -= bar_sz;
>>>> +            if ( bar_sz <= HUGE_BAR_THRESH )
>>>> +                mmio_total -= bar_sz;
>>>
>>> I'm missing the part where hvmloader notifies QEMU of the possibly
>>> expanded base and size memory PCI MMIO regions, so that those are
>>> reflected in the PCI root complex registers?
>>
>> I don't understand this comment: I'm not changing the interaction
>> with qemu at all. Whatever the new calculation it'll be communicated
>> to qemu just as before.
> 
> That wasn't a complain about the patch, just me failing to see where
> this is done.

I see. Is there any such needed though? There's nothing root-complex-ish
in PIIX4 after all, for not knowing of PCIe yet. The only datasheet I
have readily available is for a slightly older variant of the 82371AB,
yet I can't spot any registers there which would need updating (to
inform qemu).

>>> Overall I think we could simplify the code by having a hardcoded 1Gb
>>> PCI MMIO hole below 4Gb, fill it with all the 32bit BARs and
>>> (re)locate all 64bit BARs above 4Gb (not that I'm requesting you to do
>>> it here).
>>
>> I'm afraid that would not work very well with OSes which aren't 64-bit
>> BAR / PA aware (first and foremost non-PAE 32-bit ones). Iirc that's
>> the reason why it wasn't done like you suggest back at the time.
> 
> There will still be a ~1Gb window < 4Gb, so quite a bit of space.

Yet not enough to fit a single 1Gb BAR.

> I'm unsure whether such OSes will have drivers to manage devices with
> that huge BARs in the first place.

Assuming at least basic functionality of gfx cards is backwards
compatible, I see nothing wrong with an old driver successfully attaching
to a modern card surfacing, say, a 256Mb BAR.

I'm afraid we need to be conservative here and keep configurations working
which in principle can work without using any 64-bit addresses.

Jan

