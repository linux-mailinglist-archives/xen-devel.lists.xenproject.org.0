Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A28C1EB15
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 08:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153304.1483675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEMkx-0007zc-4R; Thu, 30 Oct 2025 07:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153304.1483675; Thu, 30 Oct 2025 07:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEMkx-0007xK-0u; Thu, 30 Oct 2025 07:07:35 +0000
Received: by outflank-mailman (input) for mailman id 1153304;
 Thu, 30 Oct 2025 07:07:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEMkv-0007xE-DF
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 07:07:33 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16f3b256-b55f-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 08:07:26 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-475dd559b0bso8887025e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 00:07:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477184e4006sm60679185e9.5.2025.10.30.00.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 00:07:25 -0700 (PDT)
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
X-Inumbo-ID: 16f3b256-b55f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761808045; x=1762412845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9iZjI0P7ftXkav8ZxePrwZCEDtCSfW8ehW0AO/NvPsM=;
        b=bQ5yBTi9ItgG1VCV1ci+TYLL0/0exj2+/pTuxMkZPSI8Rfnf+7IE7nl78UHfXJLhW8
         V3QxLpdb9bXF0gcHpGtvVL3t1VcoHhJwrpjCK5i9JFRa/OxhnheJ90EFXK1KT5SpaYZ4
         8KHQ/pqbA0xrwfmyvzrlNok+IvOmKbbs1nTUk75wJyF50Nha4+A/oAF1cR4hFihB2Fl+
         EixMDj3Nu6LCm20w9fcelnb1sbLuFiQVW0QUML/dzHQFZVtEfmRw9rkxmZCNRZWXxRlv
         5UbFtvFkD729uo65+UbqOGydvP9oQ4cq29v0+sPe01obp6m3Qc5YzSEpKugjG/pzxgo8
         lesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761808045; x=1762412845;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iZjI0P7ftXkav8ZxePrwZCEDtCSfW8ehW0AO/NvPsM=;
        b=iKedzGiWdf6XAKgF5obZcr9omdWhI6MKSFCpyRtnyX7cMCzaV2MaLcQWJhf4gOxLah
         eYzIGBhf4S2cLS5Cgrrr5X2wT0Z2hFYBmmTwkm60rKo0TM7R3Z8t0zOF6ENDpawJSlE/
         uwxrTWddbZCJxGBYpmeHVMj/FxbOTD0h/FIFgkIgogk57TtOv+rKPi4JcKahccebycPm
         AqIePp7KUBIp1diyb9LmuJJ989vVeY91rdu6yIBc+BYcz2pw9gnkgR4YMIJ8+b+cXY3F
         9dIAAz42kSInV+meAqicrBfieVpug99zyA/+km1f19JKpIG0OtVwJ22nfWga0p+Nl11w
         r7zg==
X-Forwarded-Encrypted: i=1; AJvYcCV46pLFUdYIKwjAwQG68c+0E84kd8ccNBu3+ndqZ3ui1t6p55iIPMuk1nGOr5TsgHiRe0HJckr6rHI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYThkycUa8meaXZm2VFWsoCmNmazBpfBNl4ycJq6ZGO2BH+/+3
	2aivlJFokTUX6vudqCacevvrnK6zh/xnVKeAfd34PEjyVCSB8GX38TThjNMLabD+FA==
X-Gm-Gg: ASbGncu2ZiqyHmF53zsIuhO8fcPptI5NasfYosIiYx9yiGTTNVUkWZ2SO38XiDDI4Bx
	IhuK1wx4sCms5N5/ZjILQcHp0oOfakuNFMG/DzrbzIpBu2JEJUYQdB+JtoGvicloD7UbRFVnDwy
	hyCRGGBQlkxH9GQifo6uw3SggqBwHI7M1SCNXimpiuk+UoB6aNZ6TOKX+hXuU9BAQanvLGvMowD
	fY+hekImHUIw1LUC2joJo9fPhhqc67pTlkii7FLZ324iI+godcXln/z+nbsVxcN+jnZfzsxtbg/
	+VyaqPkEz2/hS+dCF5Ve/S22QfqlYJoyHRxp/Y2sZGgttk0aHsA7gdLIAfnS290OOPGGmPAIPMY
	5eytQt8rFb33BtoF194I6rvTU1ebDsYbQupzDpwbtexVgQyInhBYUGAp5rlqZA1Uh4T/KjHGF91
	vvtfy675e0n9Zgi9fIkoMY1n24qk8GztM7dAQesOSGgnL+pIM/yNdUiFmCIWbUctU6JC3250G6L
	V15FEwWfQ==
X-Google-Smtp-Source: AGHT+IGLFim965i82Gmx+JgBNej1BHF0E4OkUBTvjg/p29Y58jAlw2tTlnt5P/nF4Qf3PtddnS6rWg==
X-Received: by 2002:a05:600d:8394:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-47726021821mr15008525e9.19.1761808045466;
        Thu, 30 Oct 2025 00:07:25 -0700 (PDT)
Message-ID: <06207703-caaa-4e81-b218-838609e3cc52@suse.com>
Date: Thu, 30 Oct 2025 08:07:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22 1/2] x86/platform: Expose DTS sensors MSR
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Teddy Astie <teddy.astie@vates.tech>
References: <cover.1761585640.git.teddy.astie@vates.tech>
 <48b15617f248852560a0e0674eea65d25330c605.1761585640.git.teddy.astie@vates.tech>
 <83712d12-08ec-46a4-b215-18f7ea1c1069@citrix.com>
 <78fe46d2-f21a-46d2-bcb5-a54d7cd86e91@suse.com>
 <aa6cc0c3-87e1-4a25-8ae0-d30f3c067c78@citrix.com>
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
In-Reply-To: <aa6cc0c3-87e1-4a25-8ae0-d30f3c067c78@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.10.2025 17:06, Andrew Cooper wrote:
> On 28/10/2025 9:20 am, Jan Beulich wrote:
>> On 27.10.2025 20:38, Andrew Cooper wrote:
>>> On 27/10/2025 5:26 pm, Teddy Astie wrote:
>>>> I'm not a fan of doing a inline cpuid check here, but I don't have a
>>>> better approach in mind.
>>> I'm not sure if there's enough information in leaf 6 to justify putting
>>> it fully into the CPUID infrastructure.
>>>
>>> But, if you do something like this:
>>>
>>> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
>>> index f94f23e159d2..d02fe4d22151 100644
>>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>>> @@ -121,7 +121,13 @@ struct cpu_policy
>>>              uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>>>              uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>>>              uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
>>> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
>>> +
>>> +            /* Leaf 0x6 - Thermal and Perf. */
>>> +            struct {
>>> +                bool /* a */ dts:1;
>>> +                uint32_t /* b */:32, /* c */:32, /* d */:32;
>>> +            };
>>> +
>>>              uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
>>>              uint64_t :64, :64; /* Leaf 0x8 - rsvd */
>>>              uint64_t :64, :64; /* Leaf 0x9 - DCA */
>> Just to mention, below a patch I have pending as part of a series to
>> e.g. replace the various CPUID6_* values we presently use. As you did
>> indicate when we talked about this, a prereq to then use respective
>> bits from host_policy is an adjustment to cpu-policy.c, which is also
>> part of that series. If we weren't in freeze right now, I would have
>> posted the series already.
>>
>> Jan
>>
>> x86/cpu-policy: define bits of leaf 6
>>
>> ... as far as we presently use them in the codebase.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Or should we make both parts proper featureset elements? At least
>> APERFMPERF could likely be made visible to guests (in principle).
>>
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -128,7 +128,31 @@ struct cpu_policy
>>              uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>>              uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>>              uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
>> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
>> +
>> +            /* Leaf 0x6 - Therm/Perf. */
>> +            struct {
>> +                uint32_t /* a */:1,
>> +                    turbo:1,
>> +                    arat:1,
>> +                    :4,
>> +                    hwp:1,
>> +                    hwp_notification:1,
>> +                    hwp_activity_window:1,
>> +                    hwp_epp:1,
>> +                    hwp_plr:1,
>> +                    :1,
>> +                    hdc:1,
>> +                    :2,
>> +                    hwp_peci:1,
>> +                    :2,
>> +                    hw_feedback:1,
>> +                    :12;
>> +                uint32_t /* b */:32;
>> +                uint32_t /* c */ aperfmperf:1,
>> +                    :31;
>> +                uint32_t /* d */:32;
>> +            } pm;
> 
> This works too, although we don't have 'pm' equivalents elsewhere in
> this part of the union.
> 
> APERF/MPERF is a disaster of an interface.  It can't safely be read even
> in root mode, because an NMI/SMI breaks the algorithm in a way that
> isn't easy to spot and retry.  On AMD, it's marginally better because
> GIF can be used to exclude NMIs and non-fatal MCEs while sampling the
> register pair.
> 
> In a VM, it's simply unusable.  Any VMExit, and even a vCPU reschedule,
> breaks reading the pair.
> 
> Until the CPU vendors produce a way of reading the two counters together
> (i.e. atomically, which has been asked for, repeatedly), there's no
> point considering it for use in a VM.

Right now none of this is meant for exposure. It's solely for us to use
the bits in the host policy.

Jan

