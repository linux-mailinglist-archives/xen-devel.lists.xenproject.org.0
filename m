Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B8087A80B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 14:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692426.1079533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkOIy-0004mq-2s; Wed, 13 Mar 2024 13:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692426.1079533; Wed, 13 Mar 2024 13:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkOIy-0004kd-00; Wed, 13 Mar 2024 13:06:00 +0000
Received: by outflank-mailman (input) for mailman id 692426;
 Wed, 13 Mar 2024 13:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bR7k=KT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkOIw-0004kX-Qs
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 13:05:58 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e13c694-e13a-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 14:05:56 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a4663b29334so49924066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 06:05:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b00a46647b6496sm216421ejb.155.2024.03.13.06.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 06:05:55 -0700 (PDT)
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
X-Inumbo-ID: 6e13c694-e13a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710335156; x=1710939956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PG9X11rAKz0pdL4PSeFP3B9ILmrSKoHnHWalOxkEruY=;
        b=G3dpIAfMJf4q17muPSyuer7i4Kky7O+nrRfb8i8YBcidsgdLe27aNj6oDvv6ProDBo
         Z9IUDNtSwBArYlyYSXEG8AzymyUrFkGZ9Fck17X8rZrqQ0Y0nh0nbVOf7MWFkUYBBOnA
         bpHRGoNTNLD+T7xN/vJwUqKdYCqUOivqRbsw7TV+At5D7a20wTBWPH3/RodJtPcr+SZ8
         PoV4SJ2/5gjHypXQf5ntZ7qIHW95zbPuCt4AivkIef9natxBdqWBTJqvA4EjfJMhFUh7
         +3J9xX2ec7Xm+OhynfOwbL6Vb42aMUFou3nVMc+tB11zITA2W53t79uIcQp9ll8GfizP
         FLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710335156; x=1710939956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PG9X11rAKz0pdL4PSeFP3B9ILmrSKoHnHWalOxkEruY=;
        b=LbYXscX5JYvVYu4ct6IHXHtBHnezu8EoJD++9tW/RprjgjJGKlAYFJfqnLYFNaxmuH
         BdmndGErJvI4M7MV8lH5ZeeKQDk6ioeVp2Vk3azNUnuaB35IS3BrIsgyqf5JgY7K7vMe
         gSxXyEXSYfMqOmclcdpz19QI1MUAzki+pI2CnYSVb6M008e+caHUkSxh6/wdUYnOt90Z
         CXNzBMqiLY38gv3gKaLDv8oqbb1gnYN4Edpfmh2DEZE/oN0QKStUefAdM5gBiLtM5g8M
         e2YeXJkcj3gJUkNYYqjQvdeV3uU0Yg43J0viQoNBtrkPLoqvk9pcxvE2y5/cjuiMz8vv
         lmSg==
X-Forwarded-Encrypted: i=1; AJvYcCU0MZajachFBWqwO1LjtOLPPuElP9If26h0HT3uvbDjFC1ey+A+Ni8X+4PpSYfkEioML6pmWZSFhMr7QieW7nlAvToarxczVn6ZudBFPE8=
X-Gm-Message-State: AOJu0Yz9puQOFt7zT8TqK5J/z27o1/Yz6kYBf+mKQboQ92A4FKORp2X1
	gHp9QgYX0iHLO0WvWAQFqA+AWVqSCFvtLUOwu/GT1oOA5euYpE1HZox1PVHiSA==
X-Google-Smtp-Source: AGHT+IFkPMIZPIjhqYKbN/rjm5UbUFqyY38iqfvwMq0FV0MP1LKRlOeUm5DaFRmKkA+18ctxNHZVsw==
X-Received: by 2002:a17:907:367:b0:a46:637c:db67 with SMTP id rs7-20020a170907036700b00a46637cdb67mr547853ejb.5.1710335156115;
        Wed, 13 Mar 2024 06:05:56 -0700 (PDT)
Message-ID: <84ae44c0-7812-4532-a367-4763d9b44198@suse.com>
Date: Wed, 13 Mar 2024 14:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/9] x86/smp: call x2apic_ap_setup() earlier
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <7c13554e60cc76516922992b7faf911b91f99a2a.1699982111.git.krystian.hebel@3mdeb.com>
 <a9a44e5d-80cf-404a-abe0-985a11f6d668@suse.com>
 <e131471c-9fe2-4b64-9f6f-81a0ac087874@3mdeb.com>
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
In-Reply-To: <e131471c-9fe2-4b64-9f6f-81a0ac087874@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2024 17:02, Krystian Hebel wrote:
> 
> On 7.02.2024 18:02, Jan Beulich wrote:
>> On 14.11.2023 18:50, Krystian Hebel wrote:
>>> It used to be called from smp_callin(), however BUG_ON() was invoked on
>>> multiple occasions before that. It may end up calling machine_restart()
>>> which tries to get APIC ID for CPU running this code. If BSP detected
>>> that x2APIC is enabled, get_apic_id() will try to use it for all CPUs.
>>> Enabling x2APIC on secondary CPUs earlier protects against an endless
>>> loop of #GP exceptions caused by attempts to read IA32_X2APIC_APICID
>>> MSR while x2APIC is disabled in IA32_APIC_BASE.
>>>
>>> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
>>> ---
>>>   xen/arch/x86/smpboot.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
>>> index 8ae65ab1769f..a3895dafa267 100644
>>> --- a/xen/arch/x86/smpboot.c
>>> +++ b/xen/arch/x86/smpboot.c
>>> @@ -184,7 +184,6 @@ static void smp_callin(void)
>>>        * update until we finish. We are free to set up this CPU: first the APIC.
>>>        */
>>>       Dprintk("CALLIN, before setup_local_APIC().\n");
>>> -    x2apic_ap_setup();
>>>       setup_local_APIC(false);
>>>   
>>>       /* Save our processor parameters. */
>>> @@ -351,6 +350,14 @@ void start_secondary(void *unused)
>>>       get_cpu_info()->xen_cr3 = 0;
>>>       get_cpu_info()->pv_cr3 = 0;
>>>   
>>> +    /*
>>> +     * BUG_ON() used in load_system_tables() and later code may end up calling
>>> +     * machine_restart() which tries to get APIC ID for CPU running this code.
>>> +     * If BSP detected that x2APIC is enabled, get_apic_id() will try to use it
>>> +     * for _all_ CPUs. Enable x2APIC on secondary CPUs now so we won't end up
>>> +     * with endless #GP loop.
>>> +     */
>>> +    x2apic_ap_setup();
>>>       load_system_tables();
>> While I find the argument convincing, I seem to recall that there was a
>> firm plan to have load_system_tables() as early as possible. Andrew?
> This is where the code failed for me during testing. How about moving
> x2apic_ap_setup() into load_system_tables(),

How does a call to x2apic_ap_setup() fit in a function named
load_system_tables()?

> just before BUG_ON? Or maybe
> move those BUG_ON one level higher, after load_system_tables() returns?

But they're there for a reason.

> Either way some code will end up in place it doesn't belong, but I'd 
> argue that
> BUG_ON is only useful if it itself doesn't crash.

I guess I don't understand this: That BUG_ON() is already guarded by a
system_state check, to prevent it uselessly hanging the system.

In any event - besides you still wanting to get input from Andrew, it
ought to be clear that anything unusual / unexpected will require extra
justification in the description.

Jan

