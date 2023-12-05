Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730228058DA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648042.1011963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXRG-0002io-5O; Tue, 05 Dec 2023 15:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648042.1011963; Tue, 05 Dec 2023 15:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXRG-0002gW-2f; Tue, 05 Dec 2023 15:34:22 +0000
Received: by outflank-mailman (input) for mailman id 648042;
 Tue, 05 Dec 2023 15:34:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAXRE-0002gO-3m
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:34:20 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0cbf102-9383-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 16:34:18 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c09f5a7cfso28648805e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:34:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fc12-20020a05600c524c00b0040b400711f5sm22906462wmb.7.2023.12.05.07.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:34:17 -0800 (PST)
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
X-Inumbo-ID: c0cbf102-9383-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701790457; x=1702395257; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhrwPA7Segs02S9MBf4Fzb4Jivz7Fg6+BncEXy8zs0Q=;
        b=Et75QUDBrDdi4+lGy9HPkwJFagYqOxxDoZMeaDcqmjkdFdhL1BhliYgQecIw9tNZMT
         Gal/7azWkF9LFVapdy516d8+WTP1bW3vD6LBwoFR1/MN41pYRazfYpvTL6kzAN3+Jbkd
         M/EILon0mpPhzDE7MNHfGuV/utDtwrnfziZRKgtt2SY0cEYkVAKPiySIIwi37W7Pkn0B
         9kE1RXjCMZsaY/XwBP0JwK4y6I9Z8EvsmXSU9fmh8bWST/7UYnAtEGr+cRKp2UNkZdB2
         dljG2kmGyBSEUGajNdWMwfj15sZpyrjP6ze1khy1Yj2cth1DKdNMDIxEIu2w+rp79b4j
         ggbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701790457; x=1702395257;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhrwPA7Segs02S9MBf4Fzb4Jivz7Fg6+BncEXy8zs0Q=;
        b=GhS7lAKkgYAX5C64uXXr+7ZYmW5Ff+po7pNQ1RiJ+H4xLRW1mVJRsjb6+oHBUky3bD
         3QBjztZ8RWCTCyH4GFpsG9S0XI1oaRmCto+qjOCSzUIfsrLHwL/tPlfAXwczysv2Akyr
         nhE2R+JE7gEsBPgH6SnWilYS+PrfJgj9FvXsP6nbq1/hmvupGYZAXdPA485alzlKpLWg
         +YIvqFav1UhaVEqS5BrBw4NxPITbXbjent8gpuF12ijx9welaZtjbHaztPMPOx5Vl+14
         s54LvYojMd+MlEg9ICY44vMKfxH/uvbRE6o2Ch89CBKd8MPZ2d1OLo0HSrhnPrVaJQPd
         dKpw==
X-Gm-Message-State: AOJu0Yy4PpKxRz65uW53b5HF/SKzmNcMARDhXMxJN0RoqUN9ACdVzQ/M
	Ya0WqmQ5Y60iWwZzGitClJXJaPTZnaEL8WFlkbBx
X-Google-Smtp-Source: AGHT+IEJGbblyuPE91lPMwyGwbT8C3ttzJZDdOLv0Vi/BV2BVC91DKQaJKMMFwdpwM+W7aGaZlEJbA==
X-Received: by 2002:a7b:c394:0:b0:40b:5e21:ec2b with SMTP id s20-20020a7bc394000000b0040b5e21ec2bmr619893wmj.93.1701790457527;
        Tue, 05 Dec 2023 07:34:17 -0800 (PST)
Message-ID: <046856f4-3bce-4760-ac0b-0e3feb65cc64@suse.com>
Date: Tue, 5 Dec 2023 16:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] x86/iommu: remove regions not to be mapped
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-5-roger.pau@citrix.com>
 <d94a20ea-67fa-4219-9184-3d7dd9bcf646@suse.com> <ZW9CWe3p_8BLUXs9@macbook>
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
In-Reply-To: <ZW9CWe3p_8BLUXs9@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 16:31, Roger Pau Monné wrote:
> On Tue, Dec 05, 2023 at 04:11:21PM +0100, Jan Beulich wrote:
>> On 04.12.2023 10:43, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -2136,6 +2136,54 @@ int __hwdom_init xen_in_range(unsigned long mfn)
>>>      return 0;
>>>  }
>>>  
>>> +int __hwdom_init remove_xen_ranges(struct rangeset *r)
>>> +{
>>> +    paddr_t start, end;
>>> +    int rc;
>>> +
>>> +    /* S3 resume code (and other real mode trampoline code) */
>>> +    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
>>> +                               PFN_DOWN(bootsym_phys(trampoline_end)));
>>> +    if ( rc )
>>> +        return rc;
>>> +
>>> +    /*
>>> +     * This needs to remain in sync with the uses of the same symbols in
>>> +     * - __start_xen()
>>> +     * - is_xen_fixed_mfn()
>>> +     * - tboot_shutdown()
>>> +     */
>>
>> As you're duplicating this comment from xen_in_range(), you want to
>> - also mention xen_in_range() here,
>> - also update xen_in_range()'s comment,
> 
> xen_in_range() is going away in the last patch, hence I did bother tyo
> update it.
> 
>> - also update the respective comments in __start_xen() that also mention
>>   xen_in_range().
> 
> That's done in patch 6/6.
> 
>> Everything else here looks good to me.
> 
> Let me know if doing such changes in a later patch is OK.

If xen_in_range() is indeed going to go away (see my question there), I'd be
okay-ish with that.

Jan

