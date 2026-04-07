Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMsSMG6k1GmkwAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:30:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA073AA48A
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274467.1560571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9zwY-0005cb-VH; Tue, 07 Apr 2026 06:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274467.1560571; Tue, 07 Apr 2026 06:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9zwY-0005Zv-Sa; Tue, 07 Apr 2026 06:29:46 +0000
Received: by outflank-mailman (input) for mailman id 1274467;
 Tue, 07 Apr 2026 06:29:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w9zwX-0005Zn-TI
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 06:29:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9zwW-002wGl-Oa
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 08:29:44 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d4a453-e002-0a2a0a5209dd-0a2a4507c196-12
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:29:44 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d4a458-ba2d-0a2a45070019-d1558035b044-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:29:44 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-483487335c2so46425025e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 23:29:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488a952a03asm208520745e9.0.2026.04.06.23.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 23:29:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1775543384; x=1776148184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WmBu01omlfL0EofBvdpIQmLKev+Oe6Ag+IYd2qaMnWU=;
        b=JusGcv3M23qZwRPggxasE/Pt38RJdSJkzmgYRa3B9ezNw7oHBLvzMWQLTkWRHQ4a6U
         WBTeUlzrzcHKqguE67jiAMT+9aHfJxNQtyIHu/xVhG3prB1/B6qy0ERVuZjzE0tZUckj
         BGLIXG7H5uYjBSNJGKkr+oMyCM5MfI/gOXHaqrTbzCqiEGJwVMo6Ed4BTTKnEV2cyp+y
         iklEGsIjnAACEO/3Tn7rtxqRi2I7Y2wcinHKWVs7mj5rCvDaH5pWky5sERrV7hnv92is
         Fqh1B+dKOYCtaMFQ64I0OYhuRCePLpcZMT/QA+0QORu4kecrYjureJt1HrvE6nb3ANy6
         0MWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775543384; x=1776148184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmBu01omlfL0EofBvdpIQmLKev+Oe6Ag+IYd2qaMnWU=;
        b=aVqDvXQencNXol3OQ2/R36MNv8t4+JU3ehO60WiXiwrLMGi9982oRHkkOFrJKBkOaX
         ytDH7m/damgSpmVjhGaCFik+YbzVyrTRJADN0AGjox7+/PKeVh+ycz3pv5f+8viC/5Yg
         37/8DAODwIzqgvzPz6G8cX5taEYXSYExjMQ3ZXGh+uVvUkc1xZuoQjATyPaFAd1d/pOw
         oXM+RYedO6BRMIusywwmtqr8b1Wsxdlqospg39zDgz2Pe7lvEwiSq9KozgTD7JT7eONc
         AHm/lAdithL4r7Aw8dNsC/02RZ9yurDqYaRUdwUvGV4SFmN1w9x00okFqR/ENAvbNebJ
         LvSQ==
X-Gm-Message-State: AOJu0Yx71bisqK137nhtcoofTmt+at4GqfQ9VpBxDSwWVGXcqBa935/z
	1DEdQyvpqjJXjsQH0ybFhqmymLLUi7MNdC753GSePehWGxakLJWC7VQcjVW73CqxGw==
X-Gm-Gg: AeBDiev8uSQdByR1eDWTWkeucTHyZHrqna+b6n/KFM1HzOYBtlCrys0iZD6fkHGfx7a
	t0cspodfy8XLgLKYjoyvHqy1dn0zn9G6MBSGqiOXXK1go6xy2ykdPOX8CImuEl4ObFrPBBrm6Fe
	wZ0JdqhUzPUtaXTNd1Zi9axCHvlrvm+0Tk2O49G18OeCCTt0WuFesYt2hGGh3bsqecI3Hd+tSsd
	2SyAhb4TSXrkErOjoIoNBX0ERHuDEiwt8GnWtUiWV3ODuSPmnU3e4UXmSBjs4GEbD3v/s7uxiB9
	KRF2NMYcdboGOtUdYdrlYlmCpmQyVRFuO5lpI07ZFIv5h2cXGib9fB0c9rBxD4FvNzOKd1NnCU8
	UDbK5sXk1vBhbbcujAzGpxSoWl5cOpLL4VK2J6KUg6DTvctkN5C8s9uhta/aNHCH4MxB6kyh4/B
	Pm4yFpHJ76cGy9bHVedSnkz0FW2ZcWNsKVJlwx1SVWfDR5VXjGZ9kPv+DgkIk567BTyDkH2ntRa
	hWO8sFKF5foEUBMCG6JlTuLXA==
X-Received: by 2002:a05:600c:5292:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-488996e0ce0mr234267685e9.2.1775543383656;
        Mon, 06 Apr 2026 23:29:43 -0700 (PDT)
Message-ID: <47b140b2-596b-47db-9c0c-43672f445036@suse.com>
Date: Tue, 7 Apr 2026 08:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com> <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com> <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com> <ac44SVW1cPhKYFKU@mail-itl>
 <2caff339-4ce9-42ea-9b78-afeac42b6f0f@suse.com> <ac6Bg21hMLBRDNdm@mail-itl>
 <92e0151b-3fb1-4108-9788-f0fbac43512b@suse.com> <ac72dp3yEHikJzw2@mail-itl>
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
In-Reply-To: <ac72dp3yEHikJzw2@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1775543384-10D5F41E-EBD2CF76/0/0
X-purgate-type: clean
X-purgate-size: 7845
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
X-Rspamd-Queue-Id: 2FA073AA48A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 03.04.2026 01:06, Marek Marczykowski-Górecki wrote:
> On Thu, Apr 02, 2026 at 04:53:31PM +0200, Jan Beulich wrote:
>> On 02.04.2026 16:47, Marek Marczykowski-Górecki wrote:
>>> On Thu, Apr 02, 2026 at 12:48:14PM +0200, Jan Beulich wrote:
>>>> On 02.04.2026 11:35, Marek Marczykowski-Górecki wrote:
>>>>> On Thu, Apr 02, 2026 at 10:39:41AM +0200, Jan Beulich wrote:
>>>>>> On 02.04.2026 10:08, Marek Marczykowski-Górecki wrote:
>>>>>>> The xl dmesg output (from MTL this time):
>>>>>>>
>>>>>>>     (XEN) [  123.477511] Entering ACPI S3 state.
>>>>>>>     (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
>>>>>>>     (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
>>>>>
>>>>>> Hmm, but what you didn't log is whether __hpet_setup_msi_irq() actually
>>>>>> succeeded everywhere. (And if it did, also logging HPET_Tn_ROUTE() values
>>>>>> might be a good idea, if only to double check.)
>>>>>
>>>>> Updated output:
>>>>>
>>>>>     (XEN) [18446743899.720395] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
>>>>>     (XEN) [18446743899.720409] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
>>>>>     (XEN) [18446743899.720420] _disable_pit_irq:2662: init: 0
>>>>>     (XEN) [18446743899.720431] hpet_broadcast_resume:663: hpet_events: ffff83046bc1f080
>>>>>     (XEN) [18446743899.720579] hpet_broadcast_resume:674: num_hpets_used: 8
>>>>>     (XEN) [18446743899.720587] hpet_broadcast_resume:692: cfg: 0x1
>>>>>     (XEN) [18446743899.720599] hpet_broadcast_resume:697: i:0, hpet_events[i].msi.irq: 122, hpet_events[i].flags: 0
>>>>>     (XEN) [18446743899.720612] hpet_msi_write:283: iommu_intremap: 2 (iommu_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x110
>>>>>     (XEN) [18446743899.720638] hpet_msi_write:287: iommu_update_ire_from_msi rc: 0
>>>>
>>>> So it succeeds, and the low half of HPET_Tn_ROUTE also looks plausible. The high
>>>> half is, however, the address that the low half value is written to. It's hard
>>>> to imagine that it would be zero when the low half isn't, but it is about the
>>>> last thing I can think of which could explain observed behavior. (Yet then, all
>>>> of this is pretty meaningless; see below.)
>>>>
>>>>> And the current debug diff attached.
>>>>
>>>> Hmm, you log HPET_Tn_ROUTE _before_ our update. That's not very useful. You want
>>>> to move that part of logging to the bottom of hpet_msi_write(), or maybe to
>>>> where you also log the per-channel cfg value in hpet_broadcast_resume() (thus
>>>> making the logging overall less verbose).
>>>
>>> This test is with the updated patch (attached) + your extra
>>> calculate_host_policy() call and "no-arat" on cmdline:
>>
>> And IOMMU faults still occurring as before, I expect.
>>
>> Sadly you now log the low halves of HPET_Tn_ROUTE twice, while you don't log
>> the high halves at all.
> 
> I was missing hpet_read32 there...
> 
> Updated:
> (XEN) [  116.921573] Entering ACPI S3 state.
> (XEN) [18446743895.088893] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
> (XEN) [18446743895.088907] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> (XEN) [18446743895.088918] _disable_pit_irq:2662: init: 0
> (XEN) [18446743895.088928] hpet_broadcast_resume:662: hpet_events: ffff83046bc1f080
> (XEN) [18446743895.089072] hpet_broadcast_resume:673: num_hpets_used: 8
> (XEN) [18446743895.089081] hpet_broadcast_resume:691: cfg: 0x1
> (XEN) [18446743895.089092] hpet_broadcast_resume:696: i:0, hpet_events[i].msi.irq: 122, hpet_events[i].flags: 0
> (XEN) [18446743895.089122] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743895.089132] hpet_broadcast_resume:700: i:0, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743895.089168] hpet_broadcast_resume:710: i:0, cfg: 0xc134, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xf18

Okay, this would appear to clarify that the address really isn't correct. Yet I'm
confused now by the low half values: In your earlier log there was

hpet_broadcast_resume:710: i:0, cfg: 0xc134, HPET_Tn_ROUTE(hpet_events[i].idx): 0x110

and alike, i.e. clearly a non-zero value. Now all low halves are zero. I'll try
to figure how the logged values here could result, but consistent data (or an
explantation for the apparent inconsistency) would help.

Jan

> (XEN) [18446743895.089180] hpet_broadcast_resume:696: i:1, hpet_events[i].msi.irq: 123, hpet_events[i].flags: 0
> (XEN) [18446743895.089203] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743895.089213] hpet_broadcast_resume:700: i:1, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743895.089242] hpet_broadcast_resume:710: i:1, cfg: 0xc104, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xf38
> (XEN) [18446743895.089254] hpet_broadcast_resume:696: i:2, hpet_events[i].msi.irq: 124, hpet_events[i].flags: 0
> (XEN) [18446743895.089278] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743895.089288] hpet_broadcast_resume:700: i:2, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743895.089316] hpet_broadcast_resume:710: i:2, cfg: 0xc104, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xf58
> (XEN) [18446743895.089327] hpet_broadcast_resume:696: i:3, hpet_events[i].msi.irq: 125, hpet_events[i].flags: 0
> (XEN) [18446743895.089350] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743895.089361] hpet_broadcast_resume:700: i:3, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743895.089390] hpet_broadcast_resume:710: i:3, cfg: 0xc104, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xf78
> (XEN) [18446743895.089401] hpet_broadcast_resume:696: i:4, hpet_events[i].msi.irq: 126, hpet_events[i].flags: 0
> (XEN) [18446743895.089425] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743895.089436] hpet_broadcast_resume:700: i:4, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743895.089465] hpet_broadcast_resume:710: i:4, cfg: 0xc104, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xf98
> (XEN) [18446743895.089476] hpet_broadcast_resume:696: i:5, hpet_events[i].msi.irq: 127, hpet_events[i].flags: 0
> (XEN) [18446743895.089499] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743895.089509] hpet_broadcast_resume:700: i:5, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743895.089540] hpet_broadcast_resume:710: i:5, cfg: 0xc104, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xfb8
> (XEN) [18446743895.089551] hpet_broadcast_resume:696: i:6, hpet_events[i].msi.irq: 128, hpet_events[i].flags: 0
> (XEN) [18446743895.089574] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743895.089584] hpet_broadcast_resume:700: i:6, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743895.089622] hpet_broadcast_resume:710: i:6, cfg: 0xc104, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xfd8
> (XEN) [18446743895.089633] hpet_broadcast_resume:696: i:7, hpet_events[i].msi.irq: 129, hpet_events[i].flags: 0
> (XEN) [18446743895.089655] hpet_msi_write:286: iommu_update_ire_from_msi rc: 0
> (XEN) [18446743895.089665] hpet_broadcast_resume:700: i:7, __hpet_setup_msi_irq ret: 0
> (XEN) [18446743895.089702] hpet_broadcast_resume:710: i:7, cfg: 0xc104, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx) + 4): 0xff8
> 
> 
> 
> 


