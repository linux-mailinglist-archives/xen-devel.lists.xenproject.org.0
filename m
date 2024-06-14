Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74736908AAE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 13:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740608.1147715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI4r8-0006wW-Rq; Fri, 14 Jun 2024 11:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740608.1147715; Fri, 14 Jun 2024 11:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI4r8-0006un-O3; Fri, 14 Jun 2024 11:12:30 +0000
Received: by outflank-mailman (input) for mailman id 740608;
 Fri, 14 Jun 2024 11:12:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sI4r6-0006uh-NB
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 11:12:28 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb99dce2-2a3e-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 13:12:27 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57c73a3b3d7so2205189a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 04:12:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb741e911sm2137500a12.78.2024.06.14.04.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 04:12:26 -0700 (PDT)
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
X-Inumbo-ID: fb99dce2-2a3e-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718363546; x=1718968346; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Owchbm2U97lLtQQNHjQ0o8i+EjNvSM498LpnXbTgqyc=;
        b=Rn7Y4Ds+Mb6ZqyUhfT8RZ6yLSzRd2VDaGGQgSehOWod3v5BtVX4Plz2w8I5CbzqRFE
         MluYq8rhmEKg1yW5m3NgqgEm7uvw7SXICZwFzsxhZuHIeDpRBadc4irMsvuhJmrkQ8yG
         pXAVzlZFkXDKGxnsf/96c5Sr1gor1bovG3XmXBrDxWlB+SDJHuTaeeLeKvCty35ZevxV
         SUOHaZHncM1Fbd9MIwbMXkEKGqx5yzFu1M0Zat5zaGP9J2JzmpTWxeBOEd6xsE6/QWuQ
         8rRYAc/ha1N/TW8R/TvajDPNPKSsJpNerugWHVd9On+RmjhMGOWdSFC6n9qn1JnISbbK
         G6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718363546; x=1718968346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Owchbm2U97lLtQQNHjQ0o8i+EjNvSM498LpnXbTgqyc=;
        b=iHi517DTYfnoXjSue4bKw/r4vzu2lBIojPnWjNEEZnqv1IUg2RkWIJjv5grh+nBRFG
         CkOg0sWjbb70GX0W8xuETFfNRSA8mOl1SnmHZhP7L5raTFxSyxc5LFvrqUQ4a8LNcCY2
         H2mVeBia8w5lkswMMpxMCeKctpOixnyqYSgLqDzJ8aPGlMITKeZZbbXYocKlHjYXl8go
         gbAiPtnRX/pbq5FMEQGSi7+lczecTI36m+hyhZzTwxwiFO9Vb7OdtPbotnQkNyyshwn7
         6E79mR7ZBA6/EFDN6q8tnUcl/Nx3w3H7sSOg6sdZeuOt1q59AW1WjWWmX0xdq7BVykKE
         RP5g==
X-Forwarded-Encrypted: i=1; AJvYcCUu0epGHMOshw44ogChlhPFsfapdHS15c5sHHnRZ03huvlRQY6pRPzho/0u1LMK31crntBCYRQYm/wihRwJMZ5jYFoAGNX6lHRmg3C5TEs=
X-Gm-Message-State: AOJu0Yw2xOO39xK645g4oGEjUzObRBGQymkC2ph64PajomyZfFuInODS
	HffQihEoK7ehujL3ayoQGtYe/Kl4bDHFIawSWq529bSp1Cf1u1uURcMNQSVc6Q==
X-Google-Smtp-Source: AGHT+IFWDdHRGBWsAYUDiWFCQxeZgX9gxbejOPifd2ExsNWRlj1Py4l8R51hIRnu6aL/z5A0Pfad6Q==
X-Received: by 2002:a50:d65a:0:b0:572:1589:eb98 with SMTP id 4fb4d7f45d1cf-57cbd6641dfmr1606003a12.12.1718363546419;
        Fri, 14 Jun 2024 04:12:26 -0700 (PDT)
Message-ID: <d3f9ae64-fb85-47b2-bb69-153c7734a0a3@suse.com>
Date: Fri, 14 Jun 2024 13:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.19?] x86/Intel: unlock CPUID earlier for the BSP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <82277592-ea96-47c8-a991-7afd97d7a7bc@suse.com>
 <f51b2240-03da-4aee-8972-a72b53916ce1@citrix.com>
 <e493035c-2954-418e-96fb-add1577df59f@suse.com>
 <8fb21b45-c803-4d37-8df8-3a1afa677ef7@citrix.com>
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
In-Reply-To: <8fb21b45-c803-4d37-8df8-3a1afa677ef7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.06.2024 12:14, Andrew Cooper wrote:
> On 14/06/2024 7:27 am, Jan Beulich wrote:
>> On 13.06.2024 18:17, Andrew Cooper wrote:
>>> On 13/06/2024 9:19 am, Jan Beulich wrote:
>>>> Intel CPUs have a MSR bit to limit CPUID enumeration to leaf two. If
>>>> this bit is set by the BIOS then CPUID evaluation does not work when
>>>> data from any leaf greater than two is needed; early_cpu_init() in
>>>> particular wants to collect leaf 7 data.
>>>>
>>>> Cure this by unlocking CPUID right before evaluating anything which
>>>> depends on the maximum CPUID leaf being greater than two.
>>>>
>>>> Inspired by (and description cloned from) Linux commit 0c2f6d04619e
>>>> ("x86/topology/intel: Unlock CPUID before evaluating anything").
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> While I couldn't spot anything, it kind of feels as if I'm overlooking
>>>> further places where we might be inspecting in particular leaf 7 yet
>>>> earlier.
>>>>
>>>> No Fixes: tag(s), as imo it would be too many that would want
>>>> enumerating.
>>> I also saw that go by, but concluded that Xen doesn't need it, hence why
>>> I left it alone.
>>>
>>> The truth is that only the BSP needs it.  APs sort it out in the
>>> trampoline via trampoline_misc_enable_off, because they need to clear
>>> XD_DISABLE in prior to enabling paging, so we should be taking it out of
>>> early_init_intel().
>> Except for the (odd) case also mentioned to Roger, where the BSP might have
>> the bit clear but some (or all) AP(s) have it set.
> 
> Fine I suppose.  It's a single MSR adjustment once per CPU.
> 
>>
>>> But, we don't have an early BSP-only early hook, and I'm not overwhelmed
>>> at the idea of exporting it from intel.c
>>>
>>> I was intending to leave it alone until I can burn this whole
>>> infrastructure to the ground and make it work nicely with policies, but
>>> that's not a job for this point in the release...
>> This last part reads like the rest of your reply isn't an objection to me
>> putting this in with Roger's R-b, but it would be nice if you could
>> confirm this understanding of mine. Without this last part it, especially
>> the 2nd from last paragraph, certainly reads a little like an objection.
> 
> I'm -1 to this generally.  It's churn without fixing anything AFAICT,

How that? We clearly do the adjustment too late right now for the BSP.
All the leaf-7 stuff added to early_cpu_init() (iirc in part in the course
of speculation work) is useless on a system where firmware set that flag.

Jan

> and is moving in a direction which will need undoing in the future.
> 
> But, because it doesn't fix anything, I don't think it's appropriate to
> be tagged as 4.19 even if you and roger feel strongly enough to put it
> into 4.20.
> 
> ~Andrew


