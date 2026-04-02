Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDdUG24UzmmnkgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 09:02:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97307384DBC
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 09:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271164.1559438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8C3J-0000Ef-01; Thu, 02 Apr 2026 07:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271164.1559438; Thu, 02 Apr 2026 07:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8C3I-0000D0-Sq; Thu, 02 Apr 2026 07:01:16 +0000
Received: by outflank-mailman (input) for mailman id 1271164;
 Thu, 02 Apr 2026 07:01:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8C3H-0000Ct-8Y
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 07:01:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8C3G-003mJV-H0
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 09:01:14 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce1439-bab6-0a2a0a5309dd-0a2a4509cb64-4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 09:01:14 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce143a-bf79-0a2a45090019-d1558032d072-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 09:01:14 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48702d51cd0so6150715e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 00:01:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a63esm223399785e9.3.2026.04.02.00.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 00:01:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1775113274; x=1775718074; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RXj4wQc0dD5YbepVx6YL3xGwKLgJdWHMNwkXvgvjak4=;
        b=D6hU9a9tGEZvCnG6RMvi33x7sLOw6WV2npjTWsWSG0B47beBj7YHiGH11TIjn24ly+
         y0tWcQndb++ekM1hID3W3/27ve1oB1R5EhHEJQ83EPr5VvR1/uWJ5v5iipxHyMFWZYWR
         82EFdoWxhGFGkjYw4jGMvz9q3sACkizCGKNBXsXGVzdWaHB5GvRdR/v7vXYH6tuBSlIz
         XupmOhFauvv3ui2QRWNe3jbtHoSXKk6f/3FBcpqfdoGiJjM8N2HLMA9hyYbjSdsL6Pj6
         fMunXK4fTt3L939HSenAl+vlGUmse8T1NLzsv44iev5Wzduq3wDiKnly0Uh5Zo4iqBE8
         Y9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113274; x=1775718074;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXj4wQc0dD5YbepVx6YL3xGwKLgJdWHMNwkXvgvjak4=;
        b=XKtP483Pdh5rpTtDmI4kaCnn1PzVOvoo4rqvsmTroWGNSmKNlJRuFxynbuo1i5Mafb
         dVMIK0sUfooPtzi39uiNorM6gKIEbEmm0OenWqiNSZW59TgQ39rasSCvxNow3qEQzQhN
         +3BmQrqwnaZnRiAgnpyHhXI+Bk0es/KiHtNugjPfpWLl6dWie/wp2SGmzGj5mHV8h1Qx
         ocdRNsbWXGJJZDMU88uv4qieTzzdt8kAilDQjQhI7agdomh6MZ3+Mv0o9rr4QWwm0c0T
         XGJLvbviqyKiJN2yd5KxbZkdNI+4bqo4va1Nb86HkAzcfcaWuuUj+LXEz/ymbxJErWNm
         x+lw==
X-Gm-Message-State: AOJu0Yw/5Mg2A8JgKdccd0DKmcKAcbpV5LrG+J04keNHBUaiCCdLoHYe
	U1l6khDpI/ec7X1IQQGNWHT7KmqIrHBNWuRd7PSJs+WG6T41xX6jTwVtMoR9ZBxQ1A==
X-Gm-Gg: ATEYQzwQbrwksJxHNnbuhNKNxG2fw+ozflaJNL5ShQ/FDYOQHtQtk+WVkyv6wam9RW7
	qSup3/22QstiTJcFUz9+DxZqmL+cWObprikk+dWgWbv5MOxi1Y6nlY9NyjpEpNGBPeIdpCve8PP
	ub08Rfg9moavYw2iF41h+HR7Wz10YWEM9Wi6WLBnsENsgvSGI7rqPdmaRolxcHxzTa+zK+5M3VM
	OOHV73b5/7SS498IZDGF0yOkvF/lxSm0lcZIdJo+pHTwHvRI8oPFb2x9Rzzb8Ne1Ch3sBSB/4/+
	77LDNAISInFT8RXgTee7GsNJ9r5G0xNznububpupGXkgqhMEM9Vn2EPL/CFMzf1EGG6VPedZrfZ
	JxVkcNZKB0KumCyHDg+zlNvTB8cse6HpELqlRo0yOUr6ju8rHSKMvNxazxsBD+U1M6srAqqkT/A
	8NTcFuLeFc2CIPYd+fnxoUXfdo3hXfnA/yeXkG3nD3xBGvRTe/ZcpYqup52jYcr3eHIg2NJASIe
	ifMT2/8HceqSHT48QGrbhWntg==
X-Received: by 2002:a05:600c:818f:b0:485:3423:727d with SMTP id 5b1f17b1804b1-48883595de9mr102907305e9.26.1775113273211;
        Thu, 02 Apr 2026 00:01:13 -0700 (PDT)
Message-ID: <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com>
Date: Thu, 2 Apr 2026 09:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com> <ac2nibFfvGm_7elv@mail-itl>
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
In-Reply-To: <ac2nibFfvGm_7elv@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1775113274-2DD57152-703E4107/0/0
X-purgate-type: clean
X-purgate-size: 4693
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 97307384DBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02.04.2026 01:17, Marek Marczykowski-Górecki wrote:
> On Wed, Apr 01, 2026 at 10:52:37AM +0200, Jan Beulich wrote:
>> On 01.04.2026 09:14, Jan Beulich wrote:
>>> On 27.03.2026 11:19, Marek Marczykowski-Górecki wrote:
>>>> I noticed that on some systems, there are a lot of IOMMU faults after
>>>> S3. I can see it also on a laptop with MTL, but it affects also the ADL
>>>> gitlab runner:
>>>>
>>>>     https://gitlab.com/xen-project/hardware/xen/-/jobs/13661033722
>>>>     (XEN) [   37.201160] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
>>>>     (XEN) [   37.201164] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
>>>>     (XEN) [   37.202332] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
>>>>     (XEN) [   37.202339] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
>>>>
>>>> Interestingly, the 0000:00:1e.6 device is not even listed by lspci.
>>>>
>>>> The issue is present only on staging, not staging-4.21.
>>>>
>>>> Bisect says:
>>>>
>>>> 5ec93b2f19ff8873fca65d38c1164b0a56d3898b is the first bad commit
>>>> commit 5ec93b2f19ff8873fca65d38c1164b0a56d3898b
>>>> Author: Jan Beulich <jbeulich@suse.com>
>>>> Date:   Thu Jan 22 14:13:35 2026 +0100
>>>>
>>>>     x86/HPET: drop .set_affinity hook
>>>
>>> Looking into this, I find several things I can't quite understand (yet).
>>> First there is
>>>
>>> (XEN) [000000456c0fe39f] Disabling HPET for being unreliable
>>>
>>> which looks to only affect clocksource selection, but not use as
>>> broadcast source for CPU-idle management. (This may be an independent
>>> issue.)
>>>
>>> Then there is
>>>
>>> (XEN) [    2.760248] HPET: 8 timers usable for broadcast (8 total)
>>>
>>> which should only occur on ARAT-incapable systems. That should only be
>>> older hardware. (On my much older Skylake I don't see this line, for
>>> example.) What does CPUID leaf 6 have on this system? Sadly xen-cpuid
>>> is purely featureset based, and hence doesn't expose info about that
>>> leaf. The leaf also isn't exposed to domains, so CPUID output in Dom0
>>> isn't useful to look at either. It would need to be CPUID output on a
>>> bare metal kernel.
>>>
>>> Further I suspect the fingered commit may only have uncovered an issue
>>> elsewhere. I don't think we clear any context table entries during
>>> suspend or resume. Hence in
>>>
>>> (XEN) [   20.554813] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
>>> (XEN) [   20.554819] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
>>>
>>> the latter message is confusing me.
>>>
>>> The fault address being zero may, otoh, be a hint of hpet_msi_write()
>>> never having run post-resume. Which may be the connection to the
>>> dropping of hpet_msi_set_affinity(), as that did call that function.
>>
>> There clearly is an issue with the handling of the max_cstate variable,
>> but I expect you don't use xenpm to limit usable C-states (there clearly
>> is no respective command line option in the log you referenced)?
> 
> No, I don't think so.
> 
>> From what the log has, I conclude hpet_broadcast_resume() is called.
> 
> I don't think so... I applied changes as attached and got this on
> resume:
> 
> (XEN) [   69.486120] Enabling non-boot CPUs  ...
> (XEN) [   69.486404] mwait-idle: state C1 is disabled
> (XEN) [   69.587869] mwait-idle: state C1 is disabled
> (XEN) [   69.588008] mwait-idle: state C1 is disabled
> (XEN) [   69.689438] mwait-idle: state C1 is disabled
> (XEN) [   69.689608] mwait-idle: state C1 is disabled
> (XEN) [   69.791066] mwait-idle: state C1 is disabled
> (XEN) [   69.791334] mwait-idle: state C1 is disabled
> (XEN) [   69.892938] mwait-idle: state C1 is disabled
> (XEN) [   69.893209] mwait-idle: state C1 is disabled
> (XEN) [   69.994890] mwait-idle: state C1 is disabled
> (XEN) [   69.995096] mwait-idle: state C1 is disabled
> (XEN) [   70.096638] mwait-idle: state C1 is disabled
> (XEN) [   70.096915] mwait-idle: state C1 is disabled
> (XEN) [   70.097093] mwait-idle: state C1 is disabled
> (XEN) [   70.097272] mwait-idle: state C1 is disabled
> (XEN) [   70.203357] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
> (XEN) [   70.203363] [VT-D]DMAR: reason 02 - Present bit in context entry is clear

That was on the serial console or from xl dmesg? I ask because console_resume()
runs after time_resume(), so nothing appearing on the serial console would be
expected (I think).

Without hpet_broadcast_resume() running, I don't think I could explain how the
channels (and their FSB interrupts) would get enabled.

Jan

