Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F738B9DDF8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 09:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130063.1469706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gXs-0006lp-VG; Thu, 25 Sep 2025 07:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130063.1469706; Thu, 25 Sep 2025 07:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gXs-0006kG-Ry; Thu, 25 Sep 2025 07:37:40 +0000
Received: by outflank-mailman (input) for mailman id 1130063;
 Thu, 25 Sep 2025 07:37:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1gXr-0006jh-Oe
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 07:37:39 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82d9d2ac-99e2-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 09:37:38 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b2e0513433bso109453366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 00:37:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f7506sm107325966b.52.2025.09.25.00.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 00:37:37 -0700 (PDT)
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
X-Inumbo-ID: 82d9d2ac-99e2-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758785858; x=1759390658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Xvx4s58dldW+GlipghvEvDWsOe4ZLY/FBatQDA7RN8=;
        b=N/AeIbE90ehi52GduOunb1hFw22N+uxvC1Wtqf8LO1rAMgcVsaUfR9fjU/YhL8eWjv
         w5XR/ffhPmMbXb7cxek3UIgXBTBHIR3GtCK0RTt08yPWFN+jsatPk7BHrvuOH8vFz+YY
         vpmWiIS9ws2E5Mu6bxjZeAC7l44yZUF+SwXDkb4Z+XZ408azn0JTPrj0Fs2w607hSGDm
         oz7mBujhxVmdrYoIDwI6PQ9KS749UmOO83MA3fh8aXhSAPbkeK9gs5Vpen75eRJbF4QJ
         Dqf6LppfEzRneutCjzU/ltcYaL5X25zkN4zX+qH7A3Ig6m5XVkf/Qe/83MHjDgHAOsS0
         guQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758785858; x=1759390658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Xvx4s58dldW+GlipghvEvDWsOe4ZLY/FBatQDA7RN8=;
        b=dl2tPVyjUUQV0wt5KD+OSdl9uviJu9nyfqpsj3QEo7fwQ27tNKdJHAQr5K2774dy+r
         MuTdfX9tG/7zeW+82lOLzCOx6Lo3t3dvTlYeilOwvSfVuGrVBsRkmwrUcxJibC/c85ir
         25LrFrXKfTdNDSf35qalcZamARbOFVRU6liVBsqHN9g3pALIuZM+G+N98p04kLqu4vOw
         JedBZUVGE1kGTeLp0rD6Nu3ydkqnQmJ91qk9TQVX7L1UB6+NmkYg6q8vyPXkEAEC3/Uk
         +8z8nziQ2VldK7+HRlE/f+hKkKOe1rnOrJQHqi8eGAL0hziz6kAIif9q0IoY9MC+kA/b
         5WWw==
X-Gm-Message-State: AOJu0YzjVtgYzrlZGCoCIGwC+HfCKT+UyonJnxs4j0qH6PSb0JNkR3uW
	YVA18zIAo1iGJQT/QnJCaO7H9TKaar3x9QdwKH3IdkLufRqRi0IcfXVrHoabmW3tww==
X-Gm-Gg: ASbGncv9sXpRhp7Af51dzcI1mMfywWmDULYzMXWwWbhng74oZL+WAMACh9LB5b8pOhL
	qvXFMbKr8zsg6svOGnwuhCyonAaZgWU92nCqhDaOg57Yi2diDQmG/xoCauv+brfBafiZVLr2wl+
	g8un/QBRN8J8JqWeXEfPF90NqTMdO5TyjwHobKnq53anV3z0zLrWWe4kuQa+YOYe8ygjJNzoCSO
	RpuGH+6yCUxCh1qy6Jq/ziEb0LC+GuJduiGWUSioCuJ4Y82vbTvgOjGi1IzHLRBADmnxECzlpb1
	WH5k1HZUsNHTJ/Do55OpozWl9by9wyhidTYMKWru/TvqlXFWqLvRkDZHiTHK8O09PeXZ6ZGXekb
	6H9XiI1yqES9jNUDYVjePIF7/eaqYZ1d7jepQQnByIR1vHQBeEfGxtNZ5ineZp3Dcv33xtDAUDw
	u6bEKA3Ws=
X-Google-Smtp-Source: AGHT+IENSUcX3TmRxiupZ7nlZ5fxcIh1147qMW3Yztr4ZA8VNammjLuiigVsM6EhOPa83h459kHx3A==
X-Received: by 2002:a17:907:97d3:b0:b07:da17:79fd with SMTP id a640c23a62f3a-b34b9e59f5bmr247281166b.17.1758785857936;
        Thu, 25 Sep 2025 00:37:37 -0700 (PDT)
Message-ID: <1083faae-d565-48ab-8e41-3a5a12178a9f@suse.com>
Date: Thu, 25 Sep 2025 09:37:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/cpu: populate CPUID 0x1.edx features early
 for self-snoop detection
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "oleksii.kurochko@gmail.com" <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper@citrix.com>
References: <20250924110051.2160-1-roger.pau@citrix.com>
 <2d17d2d502df489f97b51e43a2d86535@DM6PR03MB5227.namprd03.prod.outlook.com>
 <aNP0iNtp2q3342G9@Mac.lan> <3d45a9e8-a836-46bf-a3bc-321551ac755b@suse.com>
 <aNTwlR02jijpwYeC@Mac.lan>
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
In-Reply-To: <aNTwlR02jijpwYeC@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2025 09:34, Roger Pau Monné wrote:
> On Thu, Sep 25, 2025 at 09:03:06AM +0200, Jan Beulich wrote:
>> On 24.09.2025 15:40, Roger Pau Monné wrote:
>>> On Wed, Sep 24, 2025 at 11:50:02AM +0000, Andrew Cooper wrote:
>>>> On 24/09/2025 4:00 am, Roger Pau Monne wrote:
>>>>> Otherwise the check for the SS feature in
>>>>> check_memory_type_self_snoop_errata() fails unconditionally, which leads to
>>>>> X86_FEATURE_XEN_SELFSNOOP never being set.
>>>>>
>>>>> We could also avoid this by not doing the reset_cpuinfo() for the BSP in
>>>>> identify_cpu(), because SS detection uses boot_cpu_data.
>>>>
>>>> Doesn't this, mean ...
>>>
>>> Well, that's the reason for the rant here.  The reset at the top of
>>> identify_cpu() has been there since 2005.  It's arguably to make sure
>>> the BSP and the APs have the same empty state in the passed
>>> cpuinfo_x86 struct, as for the BSP this would be already partially
>>> initialized due to what's done in early_cpu_init().
>>>
>>> The underlying question is whether we would rather prefer to not do
>>> the reset for the BSP, but that would lead to differences in the
>>> contents of cpuinfo_x86 struct between the BSP and the APs.  In the
>>> past we have arranged for leaves needed early to be populated in
>>> generic_identify(), like FEATURESET_e21a, hence the proposed patch
>>> does that for FEATURESET_1d.
>>>
>>>>>   However that
>>>>> creates an imbalance on the state of the BSP versus the APs in the
>>>>> identify_cpu() code.
>>>>>
>>>>> I've opted for the less controversial solution of populating FEATURESET_1d
>>>>> in generic_identify(), as the value is already there.  The same is done for
>>>>> the AMD faulting probe code.
>>>>>
>>>>> Fixes: f2663ca2e520 ("x86/cpu/intel: Clear cache self-snoop capability in CPUs with known errata")
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> ... this Fixes tag is incorrect?
>>>
>>> I think the Fixes tag is accurate; the code was OK before that change.
>>> Nothing in c_early_init hooks depended on (some of) the x86_capability
>>> fields being populated, which is required after the change.
>>
>> I agree. Hence:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> I wonder though whether while there we wouldn't want to also store ecx if
>> we already have it. (Really there is the question of whether we haven't
>> other cpu_has_* uses which similarly come "too early".)
> 
> Yeah, I was about to do it, but it's not strictly needed for
> c_early_init, and it's done anyway just after the call to
> c_early_init.  I can set that field also, but then I would need to
> tweak the comment ahead, something like:

Sure, i.e. fine with me.

Jan

> 	/*
> 	 * Early init of Self Snoop support requires 0x1.edx, while
> 	 * there also set 0x1.ecx as the value is already in context.
> 	 */
> 	c->x86_capability[FEATURESET_1d] = edx;
> 	c->x86_capability[FEATURESET_1c] = ecx;
> 
> Thanks, Roger.


