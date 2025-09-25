Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69636B9DE1F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 09:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130104.1469735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gbi-0000xR-ST; Thu, 25 Sep 2025 07:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130104.1469735; Thu, 25 Sep 2025 07:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gbi-0000v5-Pg; Thu, 25 Sep 2025 07:41:38 +0000
Received: by outflank-mailman (input) for mailman id 1130104;
 Thu, 25 Sep 2025 07:41:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1gbh-00008I-2q
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 07:41:37 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ffaa0f2-99e3-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 09:41:35 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b3164978f11so117022466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 00:41:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353f772528sm109967866b.37.2025.09.25.00.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 00:41:34 -0700 (PDT)
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
X-Inumbo-ID: 0ffaa0f2-99e3-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758786095; x=1759390895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tXaai3UohyP+lHt/qeEGBbGZ9Pgak2DrtpXTUW/RqNo=;
        b=N4kX8bHdGX5J8eTKANDuc6m2qg3zcUQwy9gcPiqag8qaR3YgGTHBFZx4AMAqqY+1Wk
         DzQ2RlKioiAUN8iXMVH217G8Sf4CHddpYBZE41ud5dmehPydYhSZu2hzRtMd6gy22c2M
         KwIl9ZPyDFHRMqwFMJai5Sj7g4QwrNPsxVkcr39CD2QCs2s3eyNLORLP8NP9nCv+8IuJ
         gid9Xx5YcNlolVAJ70n4ImXXx4wH2pSnnE9F30IW/D5BBhz2FXaT9rWLyx2KQbsgVbY/
         PPmssMc7MXhpIh4OGaeQFXBltNsAP1o5wVOlIjJ5h+ZTQUl3pVo2BcVrmk0Abz0uQITG
         K99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786095; x=1759390895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXaai3UohyP+lHt/qeEGBbGZ9Pgak2DrtpXTUW/RqNo=;
        b=l1aLmMxA38Z9OKnKb2dnGyjnKwHAx1KOZipGXcPS/6Fvx0WoWi0s2KXjIHB1rp6BJY
         5TMbWHmsZUAj0NMYnosf7F4ACmNiXAclyAqYfhIAncThPS/87TFqrONvQNq1vNJSRJxS
         z+rZBpUXc/P0IRDcBpe+SdNhu1//lYrGkKZChvetUPgdMDj8UaiLbAHnp6VHvpJZ/iUI
         vDxQ7cpPNOza+Zn8MMsz27RcGZWDIm/gq5S+K0ifivyfJMKi2vqpFDheVcxvBpvShV2E
         hSianUTml17XCLsQk5Okj2Ny51WrS64/CqqYvUzgCS5ACpgRBHb/jlokKV3cmxPNV29E
         ivOw==
X-Gm-Message-State: AOJu0YwHkx+uQw90OKxovW8JYOh8Ms+K6RSFmK2zixDbv2tDkYZlKSkw
	98okx8FBF2GTB5cWTlNf9f/4dAw0OmA5r6/iN7sUI8QlsKru++MybVXbstS3a/a8d5ig8zPX/rb
	qkSQ=
X-Gm-Gg: ASbGncvQgHyIBLW4Cvk76UWMAADoeexhQn25s9Jd11SgGymmOMVWGtKP8Xclfsl9loY
	t2R3DNpIrsEVyXe+8gGj6PlBLBuCPGiA+Jg75PBrGZvMYf7wg3XN2jssX388aepT4qa9gHxUHb1
	jFojke4NRN5FPOVOVgyUUT/nw28A0sa9dEx8gGD00+LZDmzZulUg9adhxbUWrlYFrmesIQ5tLat
	Tt3hwNWVjfMAmko4mt1ufFQ4YBs96Henkb69XARVacJCPUYXnT343s02RwTnuAyABk4MaTC5/Os
	j5ZjjbOd9aJThIl3/5A9azDLENUy+bVBKNUiBN0+hu8XY0qk0SNhKZzhmYxrKXzh3mNBqVmZuTp
	biNVsWjvzp7jX92UTs1SmXtZ69e7+ADhi2MT2/2yOD8fJdTtRL6Ll4Kxzfjpv0rcFZlpgUpYeZ3
	eMCAWCfpo=
X-Google-Smtp-Source: AGHT+IHhhppDkxJTYjt3CYCF84J7S0MhJd4Ff5TU4ZCnZ+3EVfrPRTSULxdITOTqCdZ0qHUNMCzhCQ==
X-Received: by 2002:a17:907:940e:b0:b32:58e2:a20c with SMTP id a640c23a62f3a-b34bc8765c1mr261044766b.65.1758786094921;
        Thu, 25 Sep 2025 00:41:34 -0700 (PDT)
Message-ID: <58e5e9ae-9b57-41b0-a2d9-bdd2f312293b@suse.com>
Date: Thu, 25 Sep 2025 09:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/cpu: populate CPUID 0x1.edx features early
 for self-snoop detection
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper@citrix.com>, oleksii.kurochko@gmail.com
References: <20250924110051.2160-1-roger.pau@citrix.com>
 <2d17d2d502df489f97b51e43a2d86535@DM6PR03MB5227.namprd03.prod.outlook.com>
 <aNP0iNtp2q3342G9@Mac.lan> <3d45a9e8-a836-46bf-a3bc-321551ac755b@suse.com>
 <aNTwlR02jijpwYeC@Mac.lan> <1083faae-d565-48ab-8e41-3a5a12178a9f@suse.com>
 <aNTx1DuSIRvj7eqv@Mac.lan>
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
In-Reply-To: <aNTx1DuSIRvj7eqv@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2025 09:40, Roger Pau Monné wrote:
> On Thu, Sep 25, 2025 at 09:37:46AM +0200, Jan Beulich wrote:
>> On 25.09.2025 09:34, Roger Pau Monné wrote:
>>> On Thu, Sep 25, 2025 at 09:03:06AM +0200, Jan Beulich wrote:
>>>> On 24.09.2025 15:40, Roger Pau Monné wrote:
>>>>> On Wed, Sep 24, 2025 at 11:50:02AM +0000, Andrew Cooper wrote:
>>>>>> On 24/09/2025 4:00 am, Roger Pau Monne wrote:
>>>>>>> Otherwise the check for the SS feature in
>>>>>>> check_memory_type_self_snoop_errata() fails unconditionally, which leads to
>>>>>>> X86_FEATURE_XEN_SELFSNOOP never being set.
>>>>>>>
>>>>>>> We could also avoid this by not doing the reset_cpuinfo() for the BSP in
>>>>>>> identify_cpu(), because SS detection uses boot_cpu_data.
>>>>>>
>>>>>> Doesn't this, mean ...
>>>>>
>>>>> Well, that's the reason for the rant here.  The reset at the top of
>>>>> identify_cpu() has been there since 2005.  It's arguably to make sure
>>>>> the BSP and the APs have the same empty state in the passed
>>>>> cpuinfo_x86 struct, as for the BSP this would be already partially
>>>>> initialized due to what's done in early_cpu_init().
>>>>>
>>>>> The underlying question is whether we would rather prefer to not do
>>>>> the reset for the BSP, but that would lead to differences in the
>>>>> contents of cpuinfo_x86 struct between the BSP and the APs.  In the
>>>>> past we have arranged for leaves needed early to be populated in
>>>>> generic_identify(), like FEATURESET_e21a, hence the proposed patch
>>>>> does that for FEATURESET_1d.
>>>>>
>>>>>>>   However that
>>>>>>> creates an imbalance on the state of the BSP versus the APs in the
>>>>>>> identify_cpu() code.
>>>>>>>
>>>>>>> I've opted for the less controversial solution of populating FEATURESET_1d
>>>>>>> in generic_identify(), as the value is already there.  The same is done for
>>>>>>> the AMD faulting probe code.
>>>>>>>
>>>>>>> Fixes: f2663ca2e520 ("x86/cpu/intel: Clear cache self-snoop capability in CPUs with known errata")
>>>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>
>>>>>> ... this Fixes tag is incorrect?
>>>>>
>>>>> I think the Fixes tag is accurate; the code was OK before that change.
>>>>> Nothing in c_early_init hooks depended on (some of) the x86_capability
>>>>> fields being populated, which is required after the change.
>>>>
>>>> I agree. Hence:
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> I wonder though whether while there we wouldn't want to also store ecx if
>>>> we already have it. (Really there is the question of whether we haven't
>>>> other cpu_has_* uses which similarly come "too early".)
>>>
>>> Yeah, I was about to do it, but it's not strictly needed for
>>> c_early_init, and it's done anyway just after the call to
>>> c_early_init.  I can set that field also, but then I would need to
>>> tweak the comment ahead, something like:
>>
>> Sure, i.e. fine with me.
> 
> Oleksii, can I please get a release-ack for this to go in?

Do bug fixes actually need release-acks just yet?

Jan

