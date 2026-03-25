Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKiOCBDgw2kgugQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:16:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828D73258B9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:15:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262292.1554856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5O56-0007YH-1B; Wed, 25 Mar 2026 13:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262292.1554856; Wed, 25 Mar 2026 13:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5O55-0007VE-UZ; Wed, 25 Mar 2026 13:15:31 +0000
Received: by outflank-mailman (input) for mailman id 1262292;
 Wed, 25 Mar 2026 13:15:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5O54-0007V7-89
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:15:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5O53-00GmDx-K7
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:15:29 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3dfea-2eae-0a2a0a5409dd-0a2a450aa876-22
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:15:29 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3dff1-1772-0a2a450a0019-d155802fc51b-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:15:29 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-486fd3a577eso45240585e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 06:15:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487116d82e4sm267048175e9.12.2026.03.25.06.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 06:15:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774444529; x=1775049329; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RkH9AR3j/hJ32hms72OZj0/BvkDSHLrYYwhfZ0YTeEo=;
        b=StYE+NcSyZSmg8beEzjmDGxY7F23zKwHyVOQyZN1ppf6alnE3q+eMUnqK8UYmbJ8T8
         rEwsx4H+IzQCR7+mSPmXktHwNDVsX7Tj03rzR6C7PImvn4kFGLDdPkT50/NcoyXpyMtD
         LT1wGScKPzHStmRIkmkyUAQrgxq3UjWStdUNwbYtUEzxmVxEfmpymiIBYzEttmO3MACP
         GcTo/AmIC6NfHcAGjnpeyA1k5O6kbmv4KAgy/qA2/lg6KPHSPP8X9LOZvBTm/jJJReIU
         F2el3GIGp+kYTHdCZPq7moNU/MYuc6TbuJ9HA+hG3JLaURO5MCMbsuV+pctA56kA2Ldt
         Sw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444529; x=1775049329;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkH9AR3j/hJ32hms72OZj0/BvkDSHLrYYwhfZ0YTeEo=;
        b=IlO6xLkHC5tZLN5k38kl8AOb5UPSOuQ7yzwYPwF5FaEcrwF8mzTAhDHPatImm0p0OX
         YTM2vXyFMSqFO1N5jcz0jKP+fcWk40YqlEsE9z94u2c31y7tNc1HU+puaOxYCwiLBW9o
         gqXayUSspLpI9VJYmutbE64CXQtHuvPmLnLY6d29nr1mMPuAlltHGA/lAunBn7yTwuTY
         Z5QC06ov7f5h+KCehLS9UfBVJfxBZ2OmaeAUeGI1zzFSQz/u36iUUOLTi6dK+87XSlxT
         AreM3F5eMF5uDgohTHfq/U/NYiqxX4NVBmXIiOhln4CexryOUwdAIlyqpW9icQL/gul3
         +dcA==
X-Forwarded-Encrypted: i=1; AJvYcCX5pZeNsjU9zA4R+ygd3rTmM+vOZ/uYfBEvD08sY7bBMQoqBKcV/A0Il1U/QewuLilJgqgqN+YwaqQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNOAhhEMlhWCetK5BAOXwg9r74L0o051DqYqJ1TwM/FmgSsG5c
	5Xdx4PNBiH4weatm5kPu0wCpQ0ClfJEqGDxIVLGybN9za/V2X6GYLOAgYPL9KKDNLA==
X-Gm-Gg: ATEYQzx9J33Jl1kF8kaeF8Q97+twZIdft8FaFTb2FALEWqB+RP1l1kzdjbd+NLiRtCE
	nvVO1KY5y0Xx4638nifyhpO9nUnfH8xY+hjUubhBevwo3iNHiQ3RXMby1PStMLOxzCUz96jciXt
	k0rXWMa0nA5rFj+ThUD1yfV/ZQ6BKsRBCj9eOYhsu7WThK/wCrKvFyE4I7OwktvXY+4/pR5FVFK
	F7ie4OtrFntO07Kfn6drtMSLKCGoP42aNO/+LUOEtWUiQ/BU3aGZPU8JAcnHpCh4XZMqmRQZNkR
	6Ed1M6InqZYzr4EAyflV9xViZ+a8XK4Xz70A4IpWi2h+x/Mol921iTnRoT2mYQyzpnaMEXiW6x3
	7Km1gWkYs9jD7XTs6OIWfKUB5SF4UUl8F+QDcRMc21owBXFXqs40TaGj4y9otvGGH0O7BOtpxAG
	S7F15uIqft/1YBnqhissfpVo8qMepRgVmmWNW16kKeYntNR4XDp1gZEhkFybRrYpYMHJOWrN71K
	at/g7/bClkjXlaP3M1/CuRx0A==
X-Received: by 2002:a05:600d:8453:b0:486:ffa3:594 with SMTP id 5b1f17b1804b1-4871604c8d4mr37395835e9.23.1774444528697;
        Wed, 25 Mar 2026 06:15:28 -0700 (PDT)
Message-ID: <566dfb38-f7fe-4d01-8056-0f823e88de71@suse.com>
Date: Wed, 25 Mar 2026 14:15:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] x86: Define some Intel vPMU leafs
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1773160025.git.teddy.astie@vates.tech>
 <83a573dcb365761c0f089325365090b6f963fb03.1773160025.git.teddy.astie@vates.tech>
 <d7438af9-1aad-446b-bd80-7d9e8f955cdc@suse.com>
 <690ad4c0-d9b1-45ec-8634-f8c002c0282a@vates.tech>
 <ab2802f8-1253-4be4-a4c8-5094d7378a8f@suse.com>
 <fcad4b7f-b3db-4835-9c95-dd5a801f0690@vates.tech>
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
In-Reply-To: <fcad4b7f-b3db-4835-9c95-dd5a801f0690@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1774444529-52C94900-F90D27F6/0/0
X-purgate-type: clean
X-purgate-size: 2131
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 828D73258B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 14:05, Teddy Astie wrote:
> Le 25/03/2026 à 12:43, Jan Beulich a écrit :
>> On 25.03.2026 10:48, Teddy Astie wrote:
>>> Le 24/03/2026 à 10:25, Jan Beulich a écrit :
>>>> On 10.03.2026 17:44, Teddy Astie wrote:
>>>>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>>>>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>>>>> @@ -162,7 +162,15 @@ struct cpu_policy
>>>>>                uint64_t :64, :64; /* Leaf 0x9 - DCA */
>>>>>    
>>>>>                /* Leaf 0xa - Intel PMU. */
>>>>> -            uint8_t pmu_version, _pmu[15];
>>>>> +            struct {
>>>>> +                uint8_t /* a */ version, num_gp_ctrs, gp_ctr_width,
>>>>> +                                event_enum_length;
>>>>> +                uint32_t /* b */:32;
>>>>> +                uint32_t /* c */ fixed_ctr_mask;
>>>>> +                uint32_t /* d */ num_fixed_ctr:5, fixed_ctr_width:8, :1,
>>>>> +                                 anythread_depreciation:1, slots_per_cyc:4,
>>>>> +                                 :13;
>>>>> +            } pmu;
>>>>
>>>> Style-wise this looks to follow e.g. the cache leaf, so perhaps okay, even
>>>> if I would have preferred you to follow what we did for leaf 6.
>>>
>>> My idea was to put all that as .pmu.*, so I wouldn't need to prefix
>>> everything with "pmu_". I'm not sure if you're talking about a different
>>> approach.
>>
>> The "pmu" is fine. I'm talking of what's inside the struct {}.
>>
> 
> Is it regarding having union and _aa, _ab, (...) fields or prefixing 
> fields with pmu_ ?

As said, the "pmu" name of the containing struct is fine. Obviously then there
is no need for pmu_ prefixes. The differences between the cache leaf and leaf
6 go beyond the union aspect though, and I really mean all differences there.
As Andrew wasn't overly happy with the _6a and _6c union members, I wouldn't
insist on the introduction of counterparts here (and if they were omitted,
unions wouldn't be needed either). I think it's advisable though, allowing to
omit the trailing unnamed bitfield (the size of which you've now corrected a
2nd time).

Jan

