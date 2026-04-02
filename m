Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLX3GAiDzmmDoAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 16:54:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C916538ADAE
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 16:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272050.1559953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8JQN-0001z1-Sg; Thu, 02 Apr 2026 14:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272050.1559953; Thu, 02 Apr 2026 14:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8JQN-0001x0-PF; Thu, 02 Apr 2026 14:53:35 +0000
Received: by outflank-mailman (input) for mailman id 1272050;
 Thu, 02 Apr 2026 14:53:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8JQM-0001wu-Nk
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 14:53:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8JQM-00G5ny-0F
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 16:53:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce82df-5cb7-0a2a0a5109dd-0a2a4501bd88-34
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 16:53:33 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce82ed-6fc9-0a2a45010019-d155802fcdd8-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 16:53:33 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso1965735e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 07:53:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a63c963sm75853905e9.4.2026.04.02.07.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 07:53:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1775141613; x=1775746413; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7dQsPxzGMnU0cJkFn26xNgt7cwiaPetYYEyXRgo4A4w=;
        b=fCS4c3ZWh7AZM6ZDj0+ot8FrT79yRuVi3KZadM2gxCtlUEL20Q/DAPSQ9A3ds+Ku0z
         j5/cOtod2sLiMQz7mi6kA+kv9ohPu2hc1a8ry6+dQz/rMVa/wLk8GRwfjYN1bt63eu9U
         9/rOzR+gNFzay8WM8Mebk9SlXRXGQPq/raNOwBndlSquFF/OGkmaVDdE5AJDGlqjz9nE
         YV1beLoyyI33clTMnijkI5M0X7fx85gjuOl6Co5S3kVJ0S8yqE5+bJulX6pz6iQ261Mh
         9Y9m4KbjN2ACTYE2jZEdEev+SkR7hr3jEr8g8dTjCgBWxEMUUeDiRdhfG39A6oUaE2iI
         xKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141613; x=1775746413;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dQsPxzGMnU0cJkFn26xNgt7cwiaPetYYEyXRgo4A4w=;
        b=LT1qZ0QBoxU7mo9W12nTv/8rqYtOWzyjaFbzlAEMWjv/h5nVdt+ExylqVhii+H0+H8
         nO8oCjccvqIr6da5Uzgm1CwSGpjR+Lba2vDhpe36VxYj0miM3cAtL3ybyYI/CcUscxYS
         WNrxxLIZw1dbp7uL1Az8KB1Y8Cu4QygYvSwbQTZaIvqX9MzJTvhkZBfdQuqxBC7WSjsq
         P43TxATb854U1YVCGDJbEuv+qY6iBVS0jdOgvBmReBXgUUJaLE/J7y1D8UNExxVz1bjn
         e0XgJn1aaCcc0/Df8KXKuBVJdOumymkoU68guvY8Uf1gv5buKVyMeABv7p5K5MAvv0Qt
         bozw==
X-Gm-Message-State: AOJu0YyCDHFANuQyWSFA+uVHDVECqrnSRQFXjj3dVGw50pP45iKPS6kk
	FZ2el6GVS2uPG37NvdB+sLLWOh9fsoKQxVJJXzfwQVjMuzlyJD0YSzRCxBtoh4c1OJVu1HlLfpB
	TJiReLA==
X-Gm-Gg: ATEYQzwwtnNrQ2kh8K057dufTley86fzqgSzpV6Lcw+x2B7GIJ5x85lBx93lOn71i1u
	7TqUckm3XNfnHcKgFWf9dlC5gWU4KRn6aLpHuXN9DrCD7Xfoe961pZaJomkwsPvxH/m8RxIwkDg
	ByFgx27AXxPuGwqjDUHjyJCFxqnmJgh9pIiK1hs0dB/OYU4jM3JcoWNq4BJm5Hx7//JESgMj8kz
	mlAI2j2+o+wrhb9z0nexzKmV0kD9GzWPIhyd95U9Ju8kDQ86g6ekymh4Tifr1OPXnTf9gau9S7G
	GXilH0KK6mO+XAvugvU5BvnMTqroQrphOXgDFqnAEMTaCPBt6nLrty0KP46UUj9RgLoiTj3SLVc
	rHxTkR8V08Xh+/djiEhrjkopqRsXYYybvJJzWYKK+wDcDA/r7HMAuZ52fTkE4FAQQ8Um0Ijn+TT
	TLDoJw5rZlfIxw0xS1bEvW/dkCBbsoktRfacCEfaM0fMLv/8TNoVpkS2WlmnA5CMseAy0RmZhJU
	rlwL13+BhtLlAs=
X-Received: by 2002:a05:600c:818f:b0:485:3423:727d with SMTP id 5b1f17b1804b1-48883595de9mr129217095e9.26.1775141613115;
        Thu, 02 Apr 2026 07:53:33 -0700 (PDT)
Message-ID: <92e0151b-3fb1-4108-9788-f0fbac43512b@suse.com>
Date: Thu, 2 Apr 2026 16:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com> <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com> <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com> <ac44SVW1cPhKYFKU@mail-itl>
 <2caff339-4ce9-42ea-9b78-afeac42b6f0f@suse.com> <ac6Bg21hMLBRDNdm@mail-itl>
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
In-Reply-To: <ac6Bg21hMLBRDNdm@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1775141613-B62E9185-6D6F6108/0/0
X-purgate-type: clean
X-purgate-size: 2778
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C916538ADAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02.04.2026 16:47, Marek Marczykowski-Górecki wrote:
> On Thu, Apr 02, 2026 at 12:48:14PM +0200, Jan Beulich wrote:
>> On 02.04.2026 11:35, Marek Marczykowski-Górecki wrote:
>>> On Thu, Apr 02, 2026 at 10:39:41AM +0200, Jan Beulich wrote:
>>>> On 02.04.2026 10:08, Marek Marczykowski-Górecki wrote:
>>>>> The xl dmesg output (from MTL this time):
>>>>>
>>>>>     (XEN) [  123.477511] Entering ACPI S3 state.
>>>>>     (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
>>>>>     (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
>>>
>>>> Hmm, but what you didn't log is whether __hpet_setup_msi_irq() actually
>>>> succeeded everywhere. (And if it did, also logging HPET_Tn_ROUTE() values
>>>> might be a good idea, if only to double check.)
>>>
>>> Updated output:
>>>
>>>     (XEN) [18446743899.720395] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
>>>     (XEN) [18446743899.720409] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
>>>     (XEN) [18446743899.720420] _disable_pit_irq:2662: init: 0
>>>     (XEN) [18446743899.720431] hpet_broadcast_resume:663: hpet_events: ffff83046bc1f080
>>>     (XEN) [18446743899.720579] hpet_broadcast_resume:674: num_hpets_used: 8
>>>     (XEN) [18446743899.720587] hpet_broadcast_resume:692: cfg: 0x1
>>>     (XEN) [18446743899.720599] hpet_broadcast_resume:697: i:0, hpet_events[i].msi.irq: 122, hpet_events[i].flags: 0
>>>     (XEN) [18446743899.720612] hpet_msi_write:283: iommu_intremap: 2 (iommu_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x110
>>>     (XEN) [18446743899.720638] hpet_msi_write:287: iommu_update_ire_from_msi rc: 0
>>
>> So it succeeds, and the low half of HPET_Tn_ROUTE also looks plausible. The high
>> half is, however, the address that the low half value is written to. It's hard
>> to imagine that it would be zero when the low half isn't, but it is about the
>> last thing I can think of which could explain observed behavior. (Yet then, all
>> of this is pretty meaningless; see below.)
>>
>>> And the current debug diff attached.
>>
>> Hmm, you log HPET_Tn_ROUTE _before_ our update. That's not very useful. You want
>> to move that part of logging to the bottom of hpet_msi_write(), or maybe to
>> where you also log the per-channel cfg value in hpet_broadcast_resume() (thus
>> making the logging overall less verbose).
> 
> This test is with the updated patch (attached) + your extra
> calculate_host_policy() call and "no-arat" on cmdline:

And IOMMU faults still occurring as before, I expect.

Sadly you now log the low halves of HPET_Tn_ROUTE twice, while you don't log
the high halves at all.

Jan

