Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2D6871A2C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 11:06:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688697.1073148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhRgF-0001vZ-Uq; Tue, 05 Mar 2024 10:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688697.1073148; Tue, 05 Mar 2024 10:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhRgF-0001sr-SA; Tue, 05 Mar 2024 10:05:51 +0000
Received: by outflank-mailman (input) for mailman id 688697;
 Tue, 05 Mar 2024 10:05:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhRgE-0001sj-VX
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 10:05:50 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0bd292d-dad7-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 11:05:48 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a4499ef8b5aso396596466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 02:05:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o26-20020a1709061d5a00b00a44f6ce3e7fsm3340941ejh.77.2024.03.05.02.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 02:05:48 -0800 (PST)
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
X-Inumbo-ID: f0bd292d-dad7-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709633148; x=1710237948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7SmU9pewJHYbAF4aPkfQlh+Gg13jFRqwbbVdgo9MU2o=;
        b=RNUan2BbbHj696u4YCI4coGcoeJgBXQUvgvOXg0e6SbpQZ5PODrTYY9Ecygvcc4UPl
         eUa9PK/z5RYXqUo2u8LSbjXBbSrg7skwD+yzdxbG6hPkBuQsSJ1Co7Qb2AJw1CrhMhS7
         kvxikduHeZzDI9OZRsk/JQsdf2HPb2W9EwQv6BLbEkTWY3auF+qCifKpS0XEBGFOs7mG
         uWXCcd/xH3aDWMhOHXg1gGA4Ox9sFU7egInFKoowf5F3HRYb/qR3DEK5rkRdAE4PjkmD
         fH/i9i0ktONhyewki+6OBRDgVbOsssniRXeACq9if/nxLA+kWb5CVXYhruVNBVxwZrIv
         VmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709633148; x=1710237948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SmU9pewJHYbAF4aPkfQlh+Gg13jFRqwbbVdgo9MU2o=;
        b=UIFbThBTNmuZ+mFHaFw7KlpydZAoGtiX19Ef6YaV+c2RF6KyDbLyB6k7FZDV9P8BqW
         vtw3CRXwgZKYw8Da0n3m8sfGctxgVFTQwpjsZv5meXhywyusycgjHDVtQj9M//3UvrMe
         4JlYg6solA8BEqV+XIqQFZOLEU/cA5JiIs0rFZMzL9i295cC0/E0ZeMvyNl0vKbiSgSP
         XOycAffpu6iAskNS2IElHNcyHXZD0yxRP4yK9D3cVJ+u5j5lOmg1eo32uCiTUmjGobZG
         FAaRbH19WF+Sdrx1UP/gQOZVo+v6J4Om0b/rP+xAsftDtjPbhMPGtk6D3q828WKEMcg9
         74Lg==
X-Gm-Message-State: AOJu0YwIgQfOnF7nHtrrt7XoRQclsFvQ/6aJM9hFtDYJvOGpZMaByxDj
	yHcy7u8n3IwGNWXj6e4fftwiBpbXqi0mH5EwEs//tFt/f6H5NajN2QDbsr53wQ==
X-Google-Smtp-Source: AGHT+IGGThR46eccxaXipKrE+fr3QWJm27ZfeIXFowA+lhRA7Tp2qyXCtv91a6HKjZLep5/Yj+7p1A==
X-Received: by 2002:a17:906:ccc8:b0:a44:1a51:a1fd with SMTP id ot8-20020a170906ccc800b00a441a51a1fdmr7267817ejb.64.1709633148281;
        Tue, 05 Mar 2024 02:05:48 -0800 (PST)
Message-ID: <e1d70dbd-c012-45a7-b122-b3e92af89bbe@suse.com>
Date: Tue, 5 Mar 2024 11:05:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader/PCI: skip huge BARs in certain calculations
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Neowutran <xen@neowutran.ovh>
References: <090d572c-5196-46b2-9d6b-741b7cb66d97@suse.com>
 <ZebmhBHpFasxFfiW@macbook>
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
In-Reply-To: <ZebmhBHpFasxFfiW@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.03.2024 10:31, Roger Pau Monné wrote:
> On Mon, Mar 04, 2024 at 08:32:22AM +0100, Jan Beulich wrote:
>> BARs of size 2Gb and up can't possibly fit below 4Gb: Both the bottom of
>> the lower 2Gb range and the top of the higher 2Gb range have special
>> purpose. Don't even have them influence whether to (perhaps) relocate
>> low RAM.
>>
>> Reported-by: Neowutran <xen@neowutran.ovh>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/tools/firmware/hvmloader/pci.c
>> +++ b/tools/firmware/hvmloader/pci.c
>> @@ -33,6 +33,13 @@ uint32_t pci_mem_start = HVM_BELOW_4G_MM
>>  const uint32_t pci_mem_end = RESERVED_MEMBASE;
>>  uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
>>  
>> +/*
>> + * BARs larger than this value are put in 64-bit space unconditionally.  That
>> + * is, such BARs also don't play into the determination of how big the lowmem
>> + * MMIO hole needs to be.
>> + */
>> +#define HUGE_BAR_THRESH GB(1)
> 
> I would maybe name this `BAR_RELOCATE_THRESH, `HUGE_BAR` is too
> generic IMO.

BAR_RELOC_THRESH it is then.

> And also use 256Mb instead of 1GB, but just having a limit is good
> enough, we can further tune it afterwards.

As indicated in an earlier reply, I now firmly think that if we want to
do so, it wants doing separately / incrementally.

>> @@ -446,8 +455,9 @@ void pci_setup(void)
>>           *   the code here assumes it to be.)
>>           * Should either of those two conditions change, this code will break.
>>           */
>> -        using_64bar = bars[i].is_64bar && bar64_relocate
>> -            && (mmio_total > (mem_resource.max - mem_resource.base));
>> +        using_64bar = bars[i].is_64bar && bar64_relocate &&
>> +            (mmio_total > (mem_resource.max - mem_resource.base) ||
>> +             bar_sz > HUGE_BAR_THRESH);
> 
> There's a comment above this that starts with:
> 
> "Relocate to high memory if the total amount of MMIO needed is more
> than the low MMIO available."
> 
> I would slightly reword it to:
> 
> "Relocate to high memory if the total amount of MMIO needed is more
> than the low MMIO available or BARs bigger that HUGE_BAR_THRESH are
> present."

Hmm, yes, done.

Jan

