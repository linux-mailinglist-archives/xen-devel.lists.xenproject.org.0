Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP+LDpupDWox1QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:31:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8040C58DB1E
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313918.1583939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPg4f-0004hv-OZ; Wed, 20 May 2026 12:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313918.1583939; Wed, 20 May 2026 12:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPg4f-0004fg-Lw; Wed, 20 May 2026 12:30:57 +0000
Received: by outflank-mailman (input) for mailman id 1313918;
 Wed, 20 May 2026 12:30:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPg4f-0004fa-1Y
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:30:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPg4e-00H5Oa-Di
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:30:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0da97a-bab6-0a2a0a5309dd-0a2a4503bdc0-30
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:30:56 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0da980-672d-0a2a45030019-d1558030b49f-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:30:56 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so51998425e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:30:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ed2f738sm52371893f8f.16.2026.05.20.05.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 05:30:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1779280255; x=1779885055; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DyrjVMz/CBFQOrBzEWGj1Z+FYpZqcVY8M5LwV9dqMSM=;
        b=SdSAEV+IEEPJoI2rRi6+IVx4fb+/8ZYvWIMstZIWpmV92TNJOojXs72JCxXyLB2+VJ
         eXLZWkh8OTd84qsIlvethWbc9a9tvrs8eGp22IXlk61wxksi+zklSiLyiBetBTRHAW7w
         NMEPWs2s4iYCiMrykcKEfpTIhPLagTcFjpc5PhhH2CQWl11ImNb44UX3u8Xd8IpR2Cnb
         mmeiLcwhRj8gJ6M8x+joSPLrTJP6nUNHhP0s6uq2CHTCU9wFrtPR/XdvFYvCo/sQ5oEG
         uqayOIu1Yps+f4MMmkQ0gW7yermi/yzvm200lJRiwre+rGGPw2yJAJynbdQVRkVnmBM8
         FFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280255; x=1779885055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyrjVMz/CBFQOrBzEWGj1Z+FYpZqcVY8M5LwV9dqMSM=;
        b=Y1w9nYTGvJrWi2Cz8F0uwVqckdUH77IJ0nGZxzPcnFOWl+cT6JLhtoz9eQN+nbSXJ/
         n/26CfZoCDkN68gMXs7EnM8CUwd/E7DUJ70mQZ/pwaFwJR2nAKKBs8fm4DRdNvqcpu25
         zUgocjY9cEUyrPAS/lCRcLTcahvlthR2N3XoZgw+4FbDb72tsdIBtw2vQu24Fwq77L+6
         zlu2tyv3+1zo+RZ5K7XK+a2kSxIwhA3Frt/nNAt+QNnRXUXH8zFCMiwNhgb3zN4JYNGx
         xnjArI+cwkrhI/rfdsS5LCeq/U0zetE2w0Nuaos3gekGpsu4XGHQ1VPBiU+3hbxr5ZaQ
         UNRA==
X-Gm-Message-State: AOJu0YxEnK8kJald4uxzue5c7ecmBBFdguko3QtYamNUVDkWCFgi/gb7
	XE4kKUH/2zDNEfcrgMFBw8TLy2FGHd5gsWpKcFEWDjeAf2yLy0iZAhRay7QpfVv8hMERsV49wx+
	WtBU=
X-Gm-Gg: Acq92OGd7dSKEreIDyt+JBFKDFqMpk6XfhLj8gDlAZnRNITzEo/rJgG3AnPiCTcGPu2
	V/xMZLXwutprTrlNZEMnZ7MiWly/9X5kE/VtDqR15I08ccQ6tkBkdKeBTbYdhYr7f+u/CXPKMSP
	iZq+AAX0RjeAteR74ZKXbsIk4NzxjJtEuedZINa5TFCHh1rVjZycVSAKhZubKTi+6x9OlNWUWsY
	Z5qdd5+B15lE7AId+zPERXj9Pu0kCgS3hHP0BKV9TRLT6U/Yy21b00ewSQrQRVzSOXDGBxWhFfb
	MDTAsv/mYn6TcqA8iMEoVCtk6/O2u7JVeeJrPE2jCB6YlZF4uOtT7LqLtPlDjbUVsmM2+uthc3Y
	IHMzhcgV9PFHHBuiXPPqh1FFlhgA2EXcrMJppHS+Pvgw8GMjDwnt8o27nl2YzfTLrNYU2efQ0Su
	/Vsrhno/s4ebinA9v+g4+7HILhAopAeqMQysRdFSXgMGs/O6WepQXNZ2Ry8Qk93B/k52g6UjvcD
	hwf2MrrL5aaKZI=
X-Received: by 2002:a05:600c:4504:b0:48f:d1b8:9a9c with SMTP id 5b1f17b1804b1-48fe60e14bamr350630225e9.7.1779280255553;
        Wed, 20 May 2026 05:30:55 -0700 (PDT)
Message-ID: <02d7f002-dc14-497e-bae9-a8c0c9460fac@suse.com>
Date: Wed, 20 May 2026 14:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RFC] x86/time: avoid early uses of NOW() to return zero
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <68b1607a-f2a1-4f53-84c5-43c61eeb1869@suse.com>
 <agXwsshLlV50dcnV@macbook.local>
 <8fbab1f4-3078-4ac3-b147-84d1b5f5abd1@suse.com>
 <agcb1WAGLWDRYZ06@macbook.local>
 <547161b2-2fea-4576-a635-62838ffa2d33@suse.com>
 <ag2GzXm-yg12DQY5@macbook.local>
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
In-Reply-To: <ag2GzXm-yg12DQY5@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779280256-3754F938-9332087E/0/0
X-purgate-type: clean
X-purgate-size: 3325
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8040C58DB1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.05.2026 12:02, Roger Pau Monné wrote:
> On Mon, May 18, 2026 at 10:05:41AM +0200, Jan Beulich wrote:
>> On 15.05.2026 15:12, Roger Pau Monné wrote:
>>> On Fri, May 15, 2026 at 09:15:40AM +0200, Jan Beulich wrote:
>>>> On 14.05.2026 17:56, Roger Pau Monné wrote:
>>>>> On Wed, May 13, 2026 at 08:44:46AM +0200, Jan Beulich wrote:
>>>>>> @@ -2623,6 +2640,21 @@ int __init init_xen_time(void)
>>>>>>      return 0;
>>>>>>  }
>>>>>>  
>>>>>> +/* BSP-only function to pre-set an approximate TSC scale. */
>>>>>> +void __init preset_tsc_scale(unsigned long freq)
>>>>>> +{
>>>>>> +    struct cpu_time *t = &this_cpu(cpu_time);
>>>>>> +
>>>>>> +    /*
>>>>>> +     * The incoming frequency is only approximate (nominal).  Increase it by
>>>>>> +     * 1% to make NOW() output rather a little too slow than too fast, thus
>>>>>> +     * avoiding a possible backwards jump once the final scale is set.
>>>>>> +     */
>>>>>> +    freq += DIV_ROUND_UP(freq, 100);
>>>>>
>>>>> To avoid such possible jump backwards, won't it safer to also update
>>>>> the ->local_stime and ->local_tsc fields at the time the new scale is
>>>>> set?  Updatign those ahead of setting the new scale should avoid any
>>>>> backward jumps.
>>>>
>>>> ->stamp.local_tsc does get updated; you merely dropped that line from reply
>>>> context. As to local_stime - how could we possibly set that, when we didn't
>>>> get through init_platform_timer() yet? Leaving it at 0 is the correct
>>>> match for setting local_tsc to boot_tsc_stamp.
>>>
>>> Please bear with me, maybe I'm not understanding exactly to what the
>>> code comment refers to as "possible backwards jump once the final
>>> scale is set".  I assume you refer to the setting of scale
>>> early_time_init()?  The ->stamp.local_tsc value also gets updated at
>>> that point, so it's not possible for the timer going backwards?
>>
>> It is updated there, but only to boot_tsc_stamp. I.e. no change at all
>> if preset_tsc_scale() set the field already.
> 
> Couldn't we do the following in early_init_time() to ensure time
> doesn't go backwards:
> 
>     if ( t->tsc_scale.mul_frac )
>     {
>         /*
>          * Update time snapshot to ensure time doesn't go backwards as a
>          * result of the scale change done below.
>          */
>         t->stamp.local_tsc = rdtsc_ordered();
>         t->stamp.local_stime = get_s_time_fixed(t->stamp.local_tsc);
>     }
>     else
>         t->stamp.local_tsc = boot_tsc_stamp;
> 
>     set_time_scale(&t->tsc_scale, tmp);
>     init_percpu_time();

Yes, this would prevent stime going backwards. But at the same time it
would latch the imprecise calculations done initially. The farther off
the initial scale (e.g. when using "high" in case "nominal" isn't
available, as discussed previously), the bigger the error. That may be
mainly (only?) a cosmetic thing, but still.

Actually, if we did that, what would prevent stime going backwards by
the update done in init_percpu_time()? Aiui we really want .local_stime
to be written there for the very first time.

> That's kind of the same logic that's used in cpu_frequency_change()
> ahead of calling set_time_scale().

That function is ripe for removal anyway, so I'm hesitant to derive
anything from it.

Jan

