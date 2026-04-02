Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEW1Bt57zmnBnwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 16:23:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7911D38A718
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 16:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272001.1559934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Ix0-0005qh-7b; Thu, 02 Apr 2026 14:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272001.1559934; Thu, 02 Apr 2026 14:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Ix0-0005o4-4W; Thu, 02 Apr 2026 14:23:14 +0000
Received: by outflank-mailman (input) for mailman id 1272001;
 Thu, 02 Apr 2026 14:23:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8Iwy-0005ny-Tz
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 14:23:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Iww-005Vl2-Or
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 16:23:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce7bc5-bab6-0a2a0a5309dd-0a2a4505d22a-26
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 16:23:12 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce7bd0-3760-0a2a45050019-d1558029b976-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 16:23:12 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48374014a77so11730105e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 07:23:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a720dsm8483584f8f.4.2026.04.02.07.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 07:23:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1775139792; x=1775744592; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sI/pGzzCdA2riNjxS8Wnwz+LjiRpIcPmJ6cB/3wcj6Q=;
        b=OeWEF8iVjoH/aFfm2gQYAYlokhmH8yS/WWiF7/RYmnQIp6x1sIw906Po+UFnWE2u1N
         6KeUnLsYsDulJ5EFlpfHt+DPCYIS75J51whQ6bkbiqyk62O2zJVzrNS/P0oiDRlvKYuK
         SXq9dvB49A5DbsFQA6vcuuwRYVJZZ9a+EBYf7yhXB6LsZDg/pq0XNIDLMGQZl3IacFHq
         3IvvN8ZCAdnznfuqE1+bEx88tJmqIU4nV0EagBJtAIqe3iMRuzqbLi34c6jkSJnW1qt3
         Zd5YBqMO8hB6rWCaWDyo7//9WFuGbMnN8GpIy/jk0caP3pygfkqVDFrg18iCwsZuHKK4
         hGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139792; x=1775744592;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI/pGzzCdA2riNjxS8Wnwz+LjiRpIcPmJ6cB/3wcj6Q=;
        b=W2XOE1WxkEfVhYUt7/8IRdN3jqVUTkc1AZK8aIPQd3thzqfc1bkXzkzuSHVajErpah
         g6lD2yc5duKRrg07z2QwtPqs+FyJPsSghcziAlFLPBHybi5+qbjg8bitfDUO31X5tXID
         gc1LWVeHa9er62UHYKq9nr0MUNBLXViKxqU9/Nqus2rfQ5nYWw6Ow5r3xsymx+lm6vcj
         +tfFjZO9l0L5uq+IYqpBcG0IR79uOXo25+QfNlP5h4QwBTQDCj1NsmUBQ1kIQSYfBgb3
         4xLYo4JHc91iSrbkUZEUvTZ1M0MgToyTaL51UiwDCyglGNgHNK5q8XyLuCiUda44R/eN
         ERcg==
X-Forwarded-Encrypted: i=1; AJvYcCVBb/JtqeHVGxGVmgxth5eFgow5CFLa9UTLBu2kRXSSOnPZWtk2dFPd8mKv0WEeivgwSydM6Rx92OU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyWjmYjYP83vbFBTeRfB+fO1kOl+u6KwigCshKkICRUfqffi62
	pnAGK+mFpr+/Oy8KSJBnDF583Vzj1PCsuKIAb+xWYPszFVjn3cj/VTrOc5lwmLEOlA==
X-Gm-Gg: ATEYQzww3dAsl9sarOvdPuULrkdGrzKia/75YvmkYvOR983iq9TsKmUWYaqg3pBidAU
	FI7Wqgf/HeGVT0wRuQi6Lz7Fo6EzMNJ55QcUG6/1pwJAdR1IWXQpALce4zETnfOJMUveZiuxlbv
	nQnkQ64Yv5PsUPTsSI2pdvV76qgaMzLp0dBN1f4A3/vqjLSMGhiu8/wzxB/Ns0lf+IHHOuephDo
	07waOO1eAKiqMT6yNZN75OYV314hod7dRsxbDlDpKEOhHIBmhcKKzkwj44h7T5qRhMm8cLrZ4j2
	wzIqdD0pU4E+aFSqQ6VxN8i61/Ooc4bjmPFX0kYprjd2YKlHYADac80f8k0rcSjK8XJ2wmZKQCr
	OaGnPV6vQZbfJL4fSOzRcaEfrg7VNqI1IvcTdJiAtStEi4FKRVwFqo8dVsDv/mkGlxHzO3oqwl+
	WVnAZTzgbQTAl8ROGy3K+qvoZlQbvFv6BlldwJ/7Oh4LleH6HIhS4ZgcBBOLe8YIJ3xcerm+jo6
	DMEN/dQtphZFJY=
X-Received: by 2002:a05:600c:a30a:b0:488:8577:d9c2 with SMTP id 5b1f17b1804b1-4888b7866c3mr45233235e9.22.1775139791692;
        Thu, 02 Apr 2026 07:23:11 -0700 (PDT)
Message-ID: <fe50ff8f-1ac6-427d-8db9-3e19a6dd6734@suse.com>
Date: Thu, 2 Apr 2026 16:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com> <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com> <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
 <97bfb299-a465-48a3-a036-f217de683c2c@suse.com> <ac46HK_KiUaLdK4N@mail-itl>
 <0b284c32-4dd3-4663-881b-834c47070328@suse.com> <ac523jvUdQ7hw0Ts@mail-itl>
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
In-Reply-To: <ac523jvUdQ7hw0Ts@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1775139792-2272296F-242D17DB/0/0
X-purgate-type: clean
X-purgate-size: 3379
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 7911D38A718
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02.04.2026 16:02, Marek Marczykowski-Górecki wrote:
> On Thu, Apr 02, 2026 at 12:23:08PM +0200, Jan Beulich wrote:
>> On 02.04.2026 11:42, Marek Marczykowski-Górecki wrote:
>>> On Thu, Apr 02, 2026 at 10:47:53AM +0200, Jan Beulich wrote:
>>>> On 02.04.2026 10:39, Jan Beulich wrote:
>>>>> On 02.04.2026 10:08, Marek Marczykowski-Górecki wrote:
>>>>>> The xl dmesg output (from MTL this time):
>>>>>>
>>>>>>     (XEN) [  123.477511] Entering ACPI S3 state.
>>>>>>     (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
>>>>>>     (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
>>>>>
>>>>> XEN_ARAT being off is the one odd aspect here. That'll want tracking down
>>>>> separately. As per xen-cpuid output (below) ARAT is available.
>>>>
>>>> For this you may want to also add logging to intel_init_arat(): Since opt_arat
>>>> can be false only due to command line option use, it can only be the function
>>>> not being called (which looks impossible on plain staging code), or cpu_has_arat
>>>> being false despite the xen-cpuid output that you supplied earlier (inexplicable
>>>> as well, at least for now).
>>>
>>> Hm, I got this:
>>>
>>>     (XEN) [   11.403340] intel_init_arat:674: opt_arat: 1, cpu_has_arat: 0
>>>
>>> so, cpu_has_arat=0 ...
>>> next lines are those, to hint when it happened in the boot process:
>>>
>>>     (XEN) [   11.409754] mwait-idle: MWAIT substates: 0x11112020
>>>     (XEN) [   11.416130] mwait-idle: v0.4.1 model 0xaa
>>>     (XEN) [   11.422396] mwait-idle: lapic_timer_reliable_states 0x2
>>>
>>> Looks like calculate_host_policy() runs much later...
>>
>> Hmm, yes, and that's the problem. The reason I don't see this is that a newer
>> version of [1] has this
>>
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -628,6 +628,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
>>  	}
>>  
>>  	/* Now the feature flags better reflect actual CPU features! */
>> +	if (c == &boot_cpu_data)
>> +		calculate_host_policy();
>>  
>>  	xstate_init(c);
>>  
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -384,7 +384,7 @@ void calculate_raw_cpu_policy(void)
>>      /* Was already added by probe_cpuid_faulting() */
>>  }
>>  
>> -static void __init calculate_host_policy(void)
>> +void __init calculate_host_policy(void)
>>  {
>>      struct cpu_policy *p = &host_cpu_policy;
>>  
>> @@ -959,6 +959,7 @@ static void __init calculate_hvm_def_pol
>>  
>>  void __init init_guest_cpu_policies(void)
>>  {
>> +    /* Do this a 2nd time to account for setup_{clear,force}_cpu_cap() uses. */
>>      calculate_host_policy();
>>  
>>      if ( IS_ENABLED(CONFIG_PV) )
>>
>> and of course I'm doing my work (and my analysis) with that in place.
> 
> FWIW, with this patch applied I get:
> (XEN) [18446743899.051851] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
> (XEN) [18446743899.051865] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 1
> 
> And no IOMMU faults anymore.

Right, because then - as intended - HPET broadcast isn't used. You'd see them
again if you put "no-arat" on the command line. (And we really want to figure
out that issue, if at all possible.)

Jan

