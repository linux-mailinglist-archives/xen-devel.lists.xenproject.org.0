Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPV/HJzYiWlUCQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 13:52:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE30510F1E1
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 13:52:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225317.1531791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpQkT-0003kN-9Y; Mon, 09 Feb 2026 12:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225317.1531791; Mon, 09 Feb 2026 12:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpQkT-0003hI-6D; Mon, 09 Feb 2026 12:52:17 +0000
Received: by outflank-mailman (input) for mailman id 1225317;
 Mon, 09 Feb 2026 12:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpQkR-0003hC-9D
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 12:52:15 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27d989ff-05b6-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 13:52:13 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43284ed32a0so2958031f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 04:52:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436297455eesm26933995f8f.29.2026.02.09.04.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 04:52:12 -0800 (PST)
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
X-Inumbo-ID: 27d989ff-05b6-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770641533; x=1771246333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vhYC04O8gKnRQo3Pv4jv/kK6x8je3ndyIe2MaJiJ3eY=;
        b=FsQyxy/iPFRhdkr99pJE09oIDsDMbf0FEcPdT8Bp+v5ohG6sLf+PQlwE7exARoauER
         WYkHmdmf3ZShViOr2h4G4AYRH5un4uYAG52JGxEyuXkDz4YVKeZrDTaRREBlvxASnX6d
         whWZ34ozi0KDVpgN808U8erolkBP3FyRMHkyppdZeo96zthGl/75XAc23hShoVBuq+sl
         Gey15Biwof0q2WfNugChl367dNGXfL/TUNCBaXc0qjbuRxEMXHTbNO61ALIrjoZXV2fK
         /ITM922zPN4+8R3ls9ojKpcVS1bYxbBh4Qh2DRDVI1zyj5ZV/0a9+wY7TxuBzK7yRPqQ
         f1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770641533; x=1771246333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhYC04O8gKnRQo3Pv4jv/kK6x8je3ndyIe2MaJiJ3eY=;
        b=VFli2yYnqkEjX0lzwz2IPr4MgJehwwP9JJ2Ik8RxCvh1tYZjBh2WpWU/SXBcZn6hxu
         3fEu5FyVI2n1zg1bLQ1CGmXTcH/x5qkUNDgFxdxTxmkN1nWEIkIAfpZIvcIIF7lgl9kj
         KsFpeCQ3Zg7CO5kteskqXWT4rQ/6CB73rt3anMZ0l3UjB/52E0+HfAoLCzF8xSwK9ufm
         uRKxBX1N05TxrtwPtgakcYuY312OgfKaDwudSRM4qKMHFN2cMMxVyG1d94cIwfVrfw+E
         6RAZBY3EYYUr/ITAZvBA3Stq9qI578AutSDnGBaB8TLCB3e/DJxDdaHZ8MoYs3NEWgqt
         SUIA==
X-Forwarded-Encrypted: i=1; AJvYcCWNqyiDuIMgpmaVtyg/w8PimfBwpP2RroDNu6GEAER9qnxK/IEFmvADplCuUQbEBFC5vL7E3LnP6nI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yznlr3x7JEUlTXs9w5GfWNnJV9XrIgkwyYQS9lxAI2vv/+eWlUD
	HVd7J7iAFRCNyftSnef1j3hdkQ5ZT45A9sqnYg1Ckxsu6FCZ+Wzvf/gx+3UDBEK33w==
X-Gm-Gg: AZuq6aI3pLQQz6WdN7KtCeweepd9uaTpGwdCSpZRStwUf55kXX1QsQfJCL8VuA+lLIK
	GJWf0hpmY27wBdD35uyYGq8rjllzSNqNfPL/Sw0BBUgQm3EKNsm9lbLAzKF+m4hxYqpzdafnlAv
	+roidSOw/QPmqmtCH8PxYGANRrKy+sKmMh0ZPXBaEOb0/rtNoX08A1KpkoDM9RYqBsN1nR6xld0
	a26KtJKWnFfI34gnqh7mhJ4KtKZRRUlwGbl0iJTQrn39rUE44/XO42Kv1H+zAiiFd00nFR1Gtci
	o1+7QQOLN31imI9GhEGVpwj0fy3I4yTlEHWENR5nl3yd2GkeenScwMBrWF+VswRmJk8cyxZNN6/
	yWjvjoEVLFnPr/kvki9OGroIS4b7Zqdj0gMAIUqr7YxMMmgNQF6vmbbkn6qLmutcOx44zcqYDaz
	tQoBGKxqyxII+wj1KW60H1ZlPQ2cjcSK9doULUFf2ZnSEIvk9voFauO2OJ7JxW3bobHE1rc8XXV
	zw=
X-Received: by 2002:a05:6000:4301:b0:435:a7fa:249a with SMTP id ffacd0b85a97d-436293b326bmr17072170f8f.61.1770641533160;
        Mon, 09 Feb 2026 04:52:13 -0800 (PST)
Message-ID: <57c4d4d5-5588-40cf-919c-1e337328858f@suse.com>
Date: Mon, 9 Feb 2026 13:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] const-ify vendor checks
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <608472d0-517c-4bc5-b5c1-c278c4f6620b@suse.com>
 <DGACI1R7MGDO.1SB7OMQQZ1NC3@amd.com>
 <836c1ef7-4ec3-4c4a-b527-17066327ff19@suse.com>
 <DGAEV1NFZF2A.2ATDMEFZAIZ5S@amd.com>
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
In-Reply-To: <DGAEV1NFZF2A.2ATDMEFZAIZ5S@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BE30510F1E1
X-Rspamd-Action: no action

On 09.02.2026 12:56, Alejandro Vallejo wrote:
> On Mon Feb 9, 2026 at 11:15 AM CET, Jan Beulich wrote:
>> On 09.02.2026 11:05, Alejandro Vallejo wrote:
>>> On Mon Feb 9, 2026 at 10:21 AM CET, Jan Beulich wrote:
>>>> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>>>>> High level description
>>>>> ======================
>>>>>
>>>>> When compared to the RFC this makes a different approach The series introduces
>>>>> cpu_vendor() which maps to a constant in the single vendor case and to
>>>>> (boot_cpu_data.vendor & X86_ENABLED_VENDORS), where X86_ENABLED_VENDORS is a
>>>>> mask of the compile-time chosen vendors. This enables the compiler to detect
>>>>> dead-code at the uses and remove all unreachable branches, including in
>>>>> switches.
>>>>>
>>>>> When compared to the x86_vendor_is() macro introduced in the RFC, this is
>>>>> simpler. It achieves MOST of what the older macro did without touching the
>>>>> switches, with a few caveats:
>>>>>
>>>>>   1. Compiled-out vendors cause a panic, they don't fallback onto the unknown
>>>>>      vendor case. In retrospect, this is a much saner thing to do.
>>>>
>>>> I'm unconvinced here. Especially our Centaur and Shanghai support is at best
>>>> rudimentary. Treating those worse when configured-out than when configured-in
>>>> feels questionable.
>>>
>>> Isn't that the point of configuring out?
>>
>> That's what I'm unsure about.
> 
> I'm really missing what you're trying to make, sorry. How, if at all, is it
> helpful for a hypervisor with a compiled out vendor to be bootable on a machine
> of that vendor?

No more and no less than for a system with CPUs from a vendor we don't have
support for at all. Let's assume someone wants to start adding support for
a new vendor. They may first try Xen as-is. This wouldn't panic. Depending
on how exactly they would start adding stuff, Xen might suddenly panic,
despite functionally nothing having changed.

>>> Besides the philosophical matter of whether or not a compiled-out vendor
>>> should be allowed to run there's the more practical matter of what to do
>>> with the x86_vendor field of boot_cpu_data. Because at that point our take
>>> that cross-vendor support is forbidden is a lot weaker. If I can run an
>>> AMD-hypervisor on an Intel host, what then? What policies would be allowed? If I
>>> wipe x86_vendor then policies with some unknown vendor would be fine. Should the
>>> leaves match too? If I do not wipe the field, should I do black magic to ensure
>>> the behaviour is different depending on whether the vendor is compiled in or
>>> not? What if I want to migrate a VM currently running in this hypothetical
>>> hypervisor? The rules becomes seriously complex.
>>>
>>> It's just a lot cleaner to take the stance that compiled out vendors can't run.
>>> Then everything else is crystal clear and we avoid a universe's worth of corner
>>> cases. I expect upstream Xen to support all cases (I'm skeptical about the
>>> utility of the unknown vendor path, but oh well), but many downstreams might
>>> benefit from killing off support for vendors they really will never touch.
>>
>> To them, will panic()ing (or not) make a difference?
> 
> One would hope not because the're compiling them out for a reason.
> But for upstream, not panicking brings a sea of corner cases. The ones I
> mentioned above is not the whole list.
> 
> Turning the question around. Who benefits from not panicking?

Certain things may work. But more generally - see above. Turning this
question around also isn't quite appropriate imo: You want to introduce
the panic(), so it's on you to justify doing so (which includes making
clear why omitting that small piece of code would be a bad idea).

Jan

