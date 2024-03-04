Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924568702A5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 14:26:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688402.1072442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh8KD-0004e3-JR; Mon, 04 Mar 2024 13:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688402.1072442; Mon, 04 Mar 2024 13:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh8KD-0004ar-GU; Mon, 04 Mar 2024 13:25:49 +0000
Received: by outflank-mailman (input) for mailman id 688402;
 Mon, 04 Mar 2024 13:25:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh8KC-0004al-HC
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 13:25:48 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5e14cb7-da2a-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 14:25:47 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a449c5411e1so377288766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 05:25:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ld1-20020a170906f94100b00a451e507cfcsm1681285ejb.52.2024.03.04.05.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 05:25:46 -0800 (PST)
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
X-Inumbo-ID: b5e14cb7-da2a-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709558746; x=1710163546; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBRkDZl/hRPgm+MdfM2Cf9hQXBSzf/1JP8gvjIGtFYY=;
        b=Zlmq21H4RSK43407xQR62leZSjDnA1iQe/MhPGxvkdD53Whbk5UyxG0VK+w2c78XQX
         AvOApAFjV5iMGpZtqHUCRndvWvyHYUc8Os0+MA6PFmYco5y1cmXmV/LorCWPjwPMC4i/
         NgoMJ4sFv+y/rKNWRYMTKsxdoqH6mtsN5scEfVVxJJ8bpM7RTZMX81oQ9eLkC853O6sq
         z26LI1uPV50SlW5/CPiAZBcCHvecfvamDLUuF/yfrZP3J82J/kRSef6lODGJ5lxk3YsG
         dPaEsmF1Vwl5Bnk4LfSzjitSFDZ3hIL+idW2fiBj+AIeM2FaBtSiiLtz/y3tmAQDwu9O
         v1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709558746; x=1710163546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBRkDZl/hRPgm+MdfM2Cf9hQXBSzf/1JP8gvjIGtFYY=;
        b=X2qWJoF4Qv3nFztqF3W6sEyLcIR5nR6qlVm7nOjKF+yn7mQPzlRg1rl9kM6l7Y9GFc
         iVEj//pCk3Il0jzASXuWAAcLE8PwMJVLPo7Io1EGf+dbW3sGPN8wYVSrooa70ipSeDrN
         /I6tYMuLMlOjWeKCJOwiKKqDlkZ2U6evpg/d1X9z4ykPtr2bKOJ34B+pesPLz5FAyenU
         7vXvldCLRPMV68LWWij8ZUevyZpJ8dwGdq4mF684BTLYLM0OBmMZGJYCZCfaRpVglV5d
         b9NIc/Wxa+DktoIQf4PM/T5bASxeQAsSQASiMqksTSkvH/iWKs2vUKfeDXocpx9S5Xla
         QP5Q==
X-Gm-Message-State: AOJu0YwJz93sr/W7fdtyqTuGHdQ6TXIknvCMeZsdSTPAZmQuRqzthuMD
	YQg5je4FXV5r9sOaML5B/L1egGDyniOmyZftA2x87cVCARGLq7hZW5K3yMrk0w==
X-Google-Smtp-Source: AGHT+IGiN48i6QsPxuG/DmaaqxhEzgLW5tbYV/M8xAU5FI+8xLs3Cuk+VK0jSoYu2CtDa+NpIKS1Cw==
X-Received: by 2002:a17:906:f355:b0:a3e:c738:afa2 with SMTP id hg21-20020a170906f35500b00a3ec738afa2mr6649775ejb.76.1709558746586;
        Mon, 04 Mar 2024 05:25:46 -0800 (PST)
Message-ID: <06cce36e-5936-4374-9b56-1cb166c2b8b7@suse.com>
Date: Mon, 4 Mar 2024 14:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader/PCI: skip huge BARs in certain calculations
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Neowutran <xen@neowutran.ovh>
References: <090d572c-5196-46b2-9d6b-741b7cb66d97@suse.com>
 <ZeWcNGRsjGgUosJY@macbook>
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
In-Reply-To: <ZeWcNGRsjGgUosJY@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.03.2024 11:02, Roger Pau Monné wrote:
> On Mon, Mar 04, 2024 at 08:32:22AM +0100, Jan Beulich wrote:
>> BARs of size 2Gb and up can't possibly fit below 4Gb: Both the bottom of
>> the lower 2Gb range and the top of the higher 2Gb range have special
>> purpose. Don't even have them influence whether to (perhaps) relocate
>> low RAM.
> 
> Here you mention 2Gb BARs, yet the code below sets the maximum BAR
> size supported below 4Gb to 1Gb.

Hmm, I'm puzzled: There are no other BAR sizes between 1Gb and 2Gb.
Anything up to 1Gb continues to work as is, while everything 2Gb and
up has behavior changed.

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
> I would be fine with defining this to an even lower number, like
> 256Mb, as to avoid as much as possible memory relocation in order to
> make the MMIO hole bigger.

As suggested in a post-commit-message remark, the main question then is
how to justify this.

>> @@ -367,7 +376,7 @@ void pci_setup(void)
>>              pci_mem_start = hvm_info->low_mem_pgend << PAGE_SHIFT;
>>      }
>>  
>> -    if ( mmio_total > (pci_mem_end - pci_mem_start) )
>> +    if ( mmio_total > (pci_mem_end - pci_mem_start) || bar64_relocate )
>>      {
>>          printf("Low MMIO hole not large enough for all devices,"
>>                 " relocating some BARs to 64-bit\n");
> 
> Is the above message now accurate?  Given the current code the low
> MMIO could be expanded up to 2Gb, yet BAR relocation will happen
> unconditionally once a 1Gb BAR is found.

Well, "all" may not be quite accurate anymore, yet would making it e.g.
"all applicable" really much more meaningful?

>> @@ -446,8 +455,9 @@ void pci_setup(void)
>>           *   the code here assumes it to be.)
>>           * Should either of those two conditions change, this code will break.
>>           */
>> -        using_64bar = bars[i].is_64bar && bar64_relocate
>> -            && (mmio_total > (mem_resource.max - mem_resource.base));
>> +        using_64bar = bars[i].is_64bar && bar64_relocate &&
>> +            (mmio_total > (mem_resource.max - mem_resource.base) ||
>> +             bar_sz > HUGE_BAR_THRESH);
>>          bar_data = pci_readl(devfn, bar_reg);
>>  
>>          if ( (bar_data & PCI_BASE_ADDRESS_SPACE) ==
>> @@ -467,7 +477,8 @@ void pci_setup(void)
>>                  resource = &mem_resource;
>>                  bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
>>              }
>> -            mmio_total -= bar_sz;
>> +            if ( bar_sz <= HUGE_BAR_THRESH )
>> +                mmio_total -= bar_sz;
> 
> I'm missing the part where hvmloader notifies QEMU of the possibly
> expanded base and size memory PCI MMIO regions, so that those are
> reflected in the PCI root complex registers?

I don't understand this comment: I'm not changing the interaction
with qemu at all. Whatever the new calculation it'll be communicated
to qemu just as before.

> Overall I think we could simplify the code by having a hardcoded 1Gb
> PCI MMIO hole below 4Gb, fill it with all the 32bit BARs and
> (re)locate all 64bit BARs above 4Gb (not that I'm requesting you to do
> it here).

I'm afraid that would not work very well with OSes which aren't 64-bit
BAR / PA aware (first and foremost non-PAE 32-bit ones). Iirc that's
the reason why it wasn't done like you suggest back at the time.

Jan

