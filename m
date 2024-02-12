Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C63851893
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 17:00:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679673.1057267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZYij-0007bZ-AV; Mon, 12 Feb 2024 15:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679673.1057267; Mon, 12 Feb 2024 15:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZYij-0007a2-6v; Mon, 12 Feb 2024 15:59:49 +0000
Received: by outflank-mailman (input) for mailman id 679673;
 Mon, 12 Feb 2024 15:59:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZYii-0007Zw-EL
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 15:59:48 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be3b6f15-c9bf-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 16:59:46 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso2613140f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 07:59:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f5-20020a5d58e5000000b0033b44456463sm7107513wrd.106.2024.02.12.07.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 07:59:45 -0800 (PST)
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
X-Inumbo-ID: be3b6f15-c9bf-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707753586; x=1708358386; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w1pAg6FxT+cR1Eho1V2+i3gOiEnvQ3J3KTlL22Urghc=;
        b=DPWCA6C8F+q+v41PtAriQSO5lhCG441DFZ+wpnm1HPKaDrxiBS98SV6i5n8oh9iaXc
         h1c58Y/yAQlQyuU8eIqfJddc2apkidAnKHpCjuKRHul5XCRa+kYSqUJrXlZgj9uueC2q
         Fbz6cs9kpuxkwRVpNVWGTFzhaO7mDqYfl4lwjrc+AX1H54s3Sc8iBpH91zuhs+LMcbM/
         LijvmGHYhbYl3kgnwlQ53X9zmLkmpIH4gYH9tm+JquPiZjSPa1fZLpjI+xutp0T+Nr4P
         yRE1U/4ujTiXrqfFQcUJutRjE/eCsaMZDU8QSMAtp7YLIsg4nEuam1f1CD/RP2RWksdu
         7hcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707753586; x=1708358386;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1pAg6FxT+cR1Eho1V2+i3gOiEnvQ3J3KTlL22Urghc=;
        b=fHdV1fZ8YaGAEwIDaZ1tpM1LMZrycP5dOPO7AKL/C51F0BYUn/TTuDq9m6Q8nv+BfF
         wvvRshmmXu0QbdD41CbrmCy2e6xHb7KXTMRJIKwnV5WIDeT0uypRuTykffjEfVxlkaOp
         ijEpP8Uf1jEdlQkdZb0boESxsU9Yib08lRqUMmmyJI1T9FaTEu45clCdRGUcakTjWWbs
         Ug/nEojbwPeQnmBDe8r89tJrqp64mPRCzgNRND6C0e0BJHaXZd/JiI1FqkIioFpOzWJ7
         gKfR64YTobAMuQfNr3U5YDiHYoijJvnmjYnBaQrLQyrKdghrFU8o9xn4G2p2Z4JggaO0
         kGFA==
X-Gm-Message-State: AOJu0YzfMKS9zbZhGbk0FovKYsj1jZjsIqRVlTp70ix2qFDQQQ69gXRH
	o5ZU3xpRX2irqV/BVEmOq2nL8m6l+il4elGAr6PFza9ElVnYO9N88OBHqKCHwA==
X-Google-Smtp-Source: AGHT+IHyW/vf9JlvmfcD4f49Dw3hRIsdCTempaarV+B70ZaAiZ6y5Qai+ON4+VqNJhbra3/YjGZQsw==
X-Received: by 2002:adf:f2c6:0:b0:33b:17cd:d252 with SMTP id d6-20020adff2c6000000b0033b17cdd252mr5843803wrp.19.1707753585900;
        Mon, 12 Feb 2024 07:59:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmif11QdnilgWxubBlobrTI+uGsson6BKpUFbSFGthgf6MGEufqEnXPhTvD2dcXrGNKQC9yOROW4aVdd6Ge0OmXDynZfDk8rb+3JNCryLsdzxrZ1v3ibCbylDdzjbAmoBVZeUe9534F1YvHDXr
Message-ID: <6689fa15-a155-4771-bb65-dae57ee4dcf8@suse.com>
Date: Mon, 12 Feb 2024 16:59:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] IOMMU: rename and re-type ats_enabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <467d24e1-8ed3-4dda-a334-70ff747bf94b@suse.com> <ZcS_uC2t96Lh720Y@macbook>
 <4179ded9-36b8-4d47-997b-40d056e033af@suse.com> <ZcnnautuDD2qluQm@macbook>
 <2fccd004-b35a-4cde-afbb-722cb2413902@suse.com> <Zco7fvp1nPVlLtRy@macbook>
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
In-Reply-To: <Zco7fvp1nPVlLtRy@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.02.2024 16:38, Roger Pau Monné wrote:
> On Mon, Feb 12, 2024 at 11:45:33AM +0100, Jan Beulich wrote:
>> On 12.02.2024 10:39, Roger Pau Monné wrote:
>>> On Thu, Feb 08, 2024 at 04:49:46PM +0100, Jan Beulich wrote:
>>>> On 08.02.2024 12:49, Roger Pau Monné wrote:
>>>>> On Mon, Feb 05, 2024 at 02:55:43PM +0100, Jan Beulich wrote:
>>>>>> Make the variable a tristate, with (as done elsewhere) a negative value
>>>>>> meaning "default". Since all use sites need looking at, also rename it
>>>>>> to match our usual "opt_*" pattern. While touching it, also move it to
>>>>>> .data.ro_after_init.
>>>>>>
>>>>>> The only place it retains boolean nature is pci_ats_device(), for now.
>>>>>
>>>>> Why does it retain the boolean nature in pci_ats_device()?
>>>>>
>>>>> I assume this is to avoid having to touch the line again in a further
>>>>> patch, as given the current logic pci_ats_device() would also want to
>>>>> treat -1 as ATS disabled.
>>>>
>>>> No, then I would need to touch the line. The function wants to treat
>>>> -1 as "maybe enabled", so the caller can know whether a device is an
>>>> ATS device regardless of whether ATS use is fully off, or only
>>>> "soft-off".
>>>
>>> I have to admit I'm slightly concerned about this soft-off.  Given the
>>> current status of ATS itself in Xen, and the technology itself, I
>>> think a user should always opt-in to ATS usage.
>>
>> The plan is to follow your suggestion in patch 3 and require explicit
>> enabling for passing through of such devices. For Dom0, however, I
>> think it is important that we respect the firmware request by default.
>> The only viable(?!) alternative would be to panic() instead.
> 
> Or assign to domIO?

Not behind Dom0's back - I can't see how that would work if then Dom0
tried to load a driver for the device.

Jan

