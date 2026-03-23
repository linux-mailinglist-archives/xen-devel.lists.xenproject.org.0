Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB3TBr5SwWkPSQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 15:48:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 760472F5388
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 15:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259383.1552687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4gZC-0005un-K5; Mon, 23 Mar 2026 14:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259383.1552687; Mon, 23 Mar 2026 14:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4gZC-0005sH-Fi; Mon, 23 Mar 2026 14:47:42 +0000
Received: by outflank-mailman (input) for mailman id 1259383;
 Mon, 23 Mar 2026 14:47:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HLc=BX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w4gZA-0005sB-Qr
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 14:47:40 +0000
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c6dabeb-26c7-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 15:47:38 +0100 (CET)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-439fe4985efso2607816f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 07:47:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm32324764f8f.32.2026.03.23.07.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2026 07:47:36 -0700 (PDT)
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
X-Inumbo-ID: 3c6dabeb-26c7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774277257; x=1774882057; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ao8LPCirbjkjXiKLWk4t0u7F/wMitX+PhEF4XtFo2E=;
        b=MOvS4rfacm70bl1kCsf4+h5nlxrQg5AxzHxqw+vIfk+Ob7TUhVZZWE5Bf7pPY1B4nb
         SfVC65g0Qq2+xZXmawUCijW05He23cjQnPvXvX4fUXrlzZtJK0eevfbUr3q4PtdVTg41
         O32uwqFHwkNAxqUwJX8hBPMv5d8tHsF61W38waimaZ2uxvpK4fUdGhMDb7LFUipcdCBj
         /BjpBaZRrNHnDMxhJapiIUTHmJkRmZT8bu8QGowLUgueYmWHsbnw3epARTf0/pa1Tyxu
         UrLQFg5rRjaeSXK5J1H75sxA+MS8QPjHQTd5KZZx+pQBv9LupG9OAK6aEbjm0kaxURsa
         pzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277257; x=1774882057;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ao8LPCirbjkjXiKLWk4t0u7F/wMitX+PhEF4XtFo2E=;
        b=aRxEmyVPzwunT9rO7jlrWAJXURqqJuLcsS4giOZ8BLpjVRWS0Ul/hbEMmpw6Nmz0Bt
         XvuEuqPO46oHyLpduh3BzbjzUKBMmVyY8HLMo+iZAc3EgvGgR0FBbfgucxM7ktettj65
         9o6dQZ2mPGyaQ8Q2r4Wxj8YusYc6dNh2r2yj1SRsNRXLdNYw+oqkIC7zsCb62N1iWYjP
         oVkNhLrrXxVcxOMxpr+f2ydaj3uN+DioEIvTz8QpFohRpeSFJ9aYV+l4N8XM1vH/xV/T
         itBAgBP2/2xSw4okq5sU5W0vk3fqdH4xNJ+S1zwTm950YXzIejyZbC0eE5ZxTIDpZIsT
         ftgg==
X-Forwarded-Encrypted: i=1; AJvYcCXbGKB/Uf5O2Ey0rwunNUwKZUBtTuStH0eF77AVA57STlv/y6iK+erBgh6FrpzcguXhwiPhqAYpyG8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9ycYfb8YZEh5b6S+w1CFEq1PT79eQWWFY87F/CATXkiLM4y6t
	LtUJ63SCvCZ06LYAlNZ/nqutpRJ0XjQbai4hUe/dz5icbIaMaNr26pTKQaGMVv4bI1QYMYo6Nub
	+i9M=
X-Gm-Gg: ATEYQzxjLW0pYEUwgXx4BNgyj00qKzSSQHKy66SVOvyUrxsyuO4A3GIWxNvi+T+Kl3D
	8YaLmsTzoXPc3G2beBxlIzjif6q08tYYMvOzR4jHgnJ/dSUOUaw/6CDQYVuEw9txFhfOPJ2Acb5
	+guoBBpemEZh3uXtzWYVzThcEmjabelv9Os76OmPYmB+UJHZDLrfAWrXtqDjtsvN3y2CS6QpSbE
	NGS/m5SwzlgPiULoMlqfMuemz62XR1qzcPsLGDxWU/AMMxV6Xi3Zqz9j3jaRFgmUXfCfNDmkj0m
	aG2iBUxJso6y6uW6zSE8BD8orx48S9oNyhsvJt7PBglNqZTMNkRzxAZOw62ifaQOBSH666vo286
	wxpsSnHnUZd317lA0nKKWNXA8GOKFWIxAv16A+5IDyVPRLj3TqBaiy4So84dbrdfW0c58/UFjfP
	oU9MZYkfrf83zLiLqQ6QX+yzMGi12Gp1aKopMG22sYndAc7oNWSBnKoGpPZRUF9ZfWMefYDVx6P
	DrRLmcc3ZPRtg4ZmzzJGC7/iw==
X-Received: by 2002:a5d:64c6:0:b0:439:c78b:cbef with SMTP id ffacd0b85a97d-43b64263ea1mr18794576f8f.25.1774277257311;
        Mon, 23 Mar 2026 07:47:37 -0700 (PDT)
Message-ID: <0f2f33d7-aac3-4bc8-8de0-d67b7d9ca0fe@suse.com>
Date: Mon, 23 Mar 2026 15:47:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] x86: Cleanup cr0.TS flag handling
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-9-ross.lagerwall@citrix.com>
 <a0674df5-41d6-4f25-a236-52390a5c506e@suse.com>
 <5945b2da-7e8d-4dca-b184-c030571cba4d@citrix.com>
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
In-Reply-To: <5945b2da-7e8d-4dca-b184-c030571cba4d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 760472F5388
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23.03.2026 15:14, Ross Lagerwall wrote:
> On 3/23/26 12:30 PM, Jan Beulich wrote:
>> On 19.03.2026 14:29, Ross Lagerwall wrote:
>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -883,9 +883,6 @@ void cpu_init(void)
>>>   	/* Install correct page table. */
>>>   	write_ptbase(current);
>>>   
>>> -	/* Ensure FPU gets initialised for each domain. */
>>> -	stts();
>>
>> I'm a little concerned by the removal of this and ...
>>
>>> @@ -193,31 +190,18 @@ void vcpu_restore_fpu(struct vcpu *v)
>>>    * On each context switch, save the necessary FPU info of VCPU being switch
>>>    * out. It dispatches saving operation based on CPU's capability.
>>>    */
>>> -static bool _vcpu_save_fpu(struct vcpu *v)
>>> +void vcpu_save_fpu(struct vcpu *v)
>>>   {
>>>       ASSERT(!is_idle_vcpu(v));
>>>   
>>>       /* This can happen, if a paravirtualised guest OS has set its CR0.TS. */
>>> -    clts();
>>> +    if ( is_pv_vcpu(v) )
>>> +        clts();
>>>   
>>>       if ( cpu_has_xsave )
>>>           fpu_xsave(v);
>>>       else
>>>           fpu_fxsave(v);
>>> -
>>> -    return true;
>>> -}
>>> -
>>> -void vcpu_save_fpu(struct vcpu *v)
>>> -{
>>> -    _vcpu_save_fpu(v);
>>> -    stts();
>>
>> ... this. At present it guards us against e.g. an idle CPU or context
>> switch code mistakenly using in particular XMM registers (but of course
>> also other extended state).
> 
> Given this concern and Andrew's comment, I could drop this patch for now.
> It can be revisited in future if needed.

We discussed this some on the x86 maintainers call earlier today. Andrew
(who wants to put together a more extensive reply) indicates that getting
rid of the stts() instances is a relevant goal of this work. If this can
be clearly stated for this patch, and if the implications are clear, then
I think this could still be okay to go in.

Jan

