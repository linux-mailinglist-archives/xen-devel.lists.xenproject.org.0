Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IYOF9wSzmmnkgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 08:55:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B408E384C70
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 08:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271151.1559429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8BxJ-00070h-Bo; Thu, 02 Apr 2026 06:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271151.1559429; Thu, 02 Apr 2026 06:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8BxJ-0006xe-9A; Thu, 02 Apr 2026 06:55:05 +0000
Received: by outflank-mailman (input) for mailman id 1271151;
 Thu, 02 Apr 2026 06:55:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8BxI-0006xY-GQ
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 06:55:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8BxH-000n5B-T7
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:55:03 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce12b4-e002-0a2a0a5209dd-0a2a450887b0-42
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:55:03 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce12c7-fab6-0a2a45080019-d155802da46c-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:55:03 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4887ca8e529so3381565e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 23:55:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e829c43sm155359695e9.5.2026.04.01.23.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 23:55:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1775112903; x=1775717703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DgXxlUTwDNFLGpbDaypQWXDu0GRnlJmHE1ZauKGwKAk=;
        b=PJ0jIo0rvCoJV1d5Cer3cKFe6WybRX1S2GOOOZkCpZcyNAeCogpWeG7rYUcWMGMhaW
         5RtWM7n+zaDFqEGa+VvAeLQHHpUuYz94Sm9nICwwyNJ8NCs8tOU/S9AcynHt7jy/9TgX
         t2mtsIu13ZordiGU5fFFPoyk6JHE0jkw7kNy22vHjniF5Cnw/cZdWY27A2Xqw2LWoL7g
         BcToOaRgLM597PYTKTYKsbx2mKTo1Y0YUdS+IVT2csRWaZPS4++Zkdh/w8DujfEJLJAm
         edxrmfkgY2MNsIGDFypajflv1h/uiz0c/cA4TlKXLVluZ08EiH4OVYqLvfyU8WqJ6r27
         /7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775112903; x=1775717703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgXxlUTwDNFLGpbDaypQWXDu0GRnlJmHE1ZauKGwKAk=;
        b=krAj7wJNFQGVP6RtEzRJpj937pKbT334yFHb4vk420I7Uq0UG3CW8fx3lyqyK7Fcyl
         amLDLrB0lGkVmLOl5QL9f5m3U/XZbQOyzsx73Xo6mflu0/Da/OLmR93eg6bRv6nBptVm
         lhsf6Zv6cntBdP62T6JepGrHxoWhtT9MzlfogUKJSwk92TLJBCwR/2Ks2oQqVv3jMTA7
         Ia3SdvjB7wqv05II74b40VC3mNiUjqTbpRLpcFc2WuRA7RVEy2+DR9oP96YOq5LEJ6Ya
         dG3BwKH47qxR+tH343UIFw8lXUShtX58uNJ0oEaGkm1tFgzr7/i+Q0rIOMBMZBCCG4d1
         KufQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsTQ1aGBWMvryJn7uX7VrKmDCgUvecrVRDPN6oSIF3Rfpduwqr+mZo95o3WA4qe3rWV6juooTtaCs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKMlGk7rMaaqZlB1bR5/4d3GiByMwl8maWSGM11YsnrziaYA/n
	3LwTlMcPvoDrKEk/9PmWCOzGohJ2xIKrvvYbhQVdp9Uq7E3okytEnJheaD5hN0bORA==
X-Gm-Gg: ATEYQzxqOG0EaYWOMPNhD/wgpbV/OhlFrsJvesU8tZoMtNYbtOrLF7yEPXbg973WLye
	IFD4rqqWFLFYMsZf6OA6llGt5ookpV0sY9TR5L+blmUIMHc22peJqYWXUOGao5rPWERoytFVsjx
	ImAPeLuZT9FXHCbWNw8rMa5pvXhlJJX54bI5w0IuMtNwOPF1SoR7hdzbKGjMt8yIcBTzGRgoVuZ
	cTRjaejoPGpqm2uL+IlGTaneE3O+YJuUMLkmc06e4LEhDgihaYdNtVd5VtY/pzkoj2rl+3b2cN2
	3hthH4hxUFgLlStbcqriqJpXxSKvob3tItbXy+I/rCuG9kmR/dJmPpnFSIifn43XDn4T8cvGnd7
	abvtlWZL/o5hktcwJyaYKhSuWmkfPl8R3u33nOmX7O8CPrS3sHwO+8DcO6thb+9ChqI8upA+bCr
	IizbNMp5HZB0SBIY/vUauXKN/Olcutw+ew0rNKdl6t6WJ7e8Sp7Wdr7Z9j92TJ17MKgH8SBXE5O
	N/iCjzebJODgxU=
X-Received: by 2002:a05:600c:c107:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4888e0b0022mr13699165e9.11.1775112902781;
        Wed, 01 Apr 2026 23:55:02 -0700 (PDT)
Message-ID: <93c147b2-1fbf-4afd-badd-cc3ba475e006@suse.com>
Date: Thu, 2 Apr 2026 08:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <913f75e3-0039-4a7e-9884-7564c329557f@citrix.com>
 <6020226f-5e38-42f5-923e-2692d17bc4e9@suse.com> <ac2AUoNaEUDIJ-J8@mail-itl>
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
In-Reply-To: <ac2AUoNaEUDIJ-J8@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1775112903-76D4B497-D672ED31/0/0
X-purgate-type: clean
X-purgate-size: 5829
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B408E384C70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 22:30, Marek Marczykowski-Górecki wrote:
> On Wed, Apr 01, 2026 at 10:11:12AM +0200, Jan Beulich wrote:
>> On 01.04.2026 09:20, Andrew Cooper wrote:
>>> On 01/04/2026 9:14 am, Jan Beulich wrote:
>>>> On 27.03.2026 11:19, Marek Marczykowski-Górecki wrote:
>>>>> I noticed that on some systems, there are a lot of IOMMU faults after
>>>>> S3. I can see it also on a laptop with MTL, but it affects also the ADL
>>>>> gitlab runner:
>>>>>
>>>>>     https://gitlab.com/xen-project/hardware/xen/-/jobs/13661033722
>>>>>     (XEN) [   37.201160] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
>>>>>     (XEN) [   37.201164] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
>>>>>     (XEN) [   37.202332] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
>>>>>     (XEN) [   37.202339] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
>>>>>
>>>>> Interestingly, the 0000:00:1e.6 device is not even listed by lspci.
>>>>>
>>>>> The issue is present only on staging, not staging-4.21.
>>>>>
>>>>> Bisect says:
>>>>>
>>>>> 5ec93b2f19ff8873fca65d38c1164b0a56d3898b is the first bad commit
>>>>> commit 5ec93b2f19ff8873fca65d38c1164b0a56d3898b
>>>>> Author: Jan Beulich <jbeulich@suse.com>
>>>>> Date:   Thu Jan 22 14:13:35 2026 +0100
>>>>>
>>>>>     x86/HPET: drop .set_affinity hook
>>>> Looking into this, I find several things I can't quite understand (yet).
>>>> First there is
>>>>
>>>> (XEN) [000000456c0fe39f] Disabling HPET for being unreliable
>>>>
>>>> which looks to only affect clocksource selection, but not use as
>>>> broadcast source for CPU-idle management. (This may be an independent
>>>> issue.)
>>>>
>>>> Then there is
>>>>
>>>> (XEN) [    2.760248] HPET: 8 timers usable for broadcast (8 total)
>>>>
>>>> which should only occur on ARAT-incapable systems. That should only be
>>>> older hardware.
>>>
>>> I'm not sure that's a reasonable assertion to draw.  The number of HPET
>>> channels is down to the HPET alone, not anything to do with the CPU
>>> capabilities.
>>
>> My statement was about the mere presence of that message, not the number
>> of channels that are reported.
>>
>>>>  (On my much older Skylake I don't see this line, for
>>>> example.) What does CPUID leaf 6 have on this system? Sadly xen-cpuid
>>>> is purely featureset based, and hence doesn't expose info about that
>>>> leaf.
>>>
>>> xen-cpuid -p
>>>
>>> That will get you leaf 6, but there's no human-readable decode of it.
>>
>> Raw numbers is good enough here. How did I miss that option when looking
>> at --help output? Oh, simply because it isn't shown there.
>>
>> Marek, that'll be better than bare metal kernel data, as it gives us both
>> raw and host policies.
> 
> Here is the output from ADL runner:
> 
> Xen reports there are maximum 120 leaves and 2 MSRs
> Raw policy: 48 leaves, 2 MSRs
>  CPUID:
>   leaf     subleaf  -> eax      ebx      ecx      edx     
>   00000000:ffffffff -> 00000020:756e6547:6c65746e:49656e69
>   00000001:ffffffff -> 00090672:00800800:77fafbff:bfebfbff
>   00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
>   00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
>   00000004:00000001 -> fc004122:01c0003f:0000003f:00000000
>   00000004:00000002 -> fc01c143:0240003f:000007ff:00000000
>   00000004:00000003 -> fc1fc163:0240003f:00007fff:00000004
>   00000005:ffffffff -> 00000040:00000040:00000003:10102020
>   00000006:ffffffff -> 00df8ff7:00000002:00000409:00000003
>   00000007:00000000 -> 00000002:239c27eb:98c027ac:fc1cc410
>   00000007:00000001 -> 00400810:00000000:00000000:00040000
>   00000007:00000002 -> 00000000:00000000:00000000:00000017
>   0000000a:ffffffff -> 07300605:00000000:00000007:00008603
>   0000000b:00000000 -> 00000001:00000002:00000100:00000000
>   0000000b:00000001 -> 00000007:00000010:00000201:00000000
>   0000000d:00000000 -> 00000207:00000000:00000a88:00000000
>   0000000d:00000001 -> 0000000f:00000000:00019900:00000000
>   0000000d:00000002 -> 00000100:00000240:00000000:00000000
>   0000000d:00000008 -> 00000080:00000000:00000001:00000000
>   0000000d:00000009 -> 00000008:00000a80:00000000:00000000
>   0000000d:0000000b -> 00000010:00000000:00000001:00000000
>   0000000d:0000000c -> 00000018:00000000:00000001:00000000
>   0000000d:0000000f -> 00000328:00000000:00000001:00000000
>   0000000d:00000010 -> 00000008:00000000:00000001:00000000
>   80000000:ffffffff -> 80000008:00000000:00000000:00000000
>   80000001:ffffffff -> 00000000:00000000:00000121:2c100800
>   80000002:ffffffff -> 68743231:6e654720:746e4920:52286c65
>   80000003:ffffffff -> 6f432029:54286572:6920294d:32312d35
>   80000004:ffffffff -> 4b303036:00000000:00000000:00000000
>   80000006:ffffffff -> 00000000:00000000:05007040:00000000
>   80000007:ffffffff -> 00000000:00000000:00000000:00000100
>   80000008:ffffffff -> 0000302e:00000000:00000000:00000000
>  MSRs:
>   index    -> value           
>   000000ce -> 0000000080000000
>   0000010a -> 000000001488fd6b
> Host policy: 41 leaves, 2 MSRs
>  CPUID:
>   leaf     subleaf  -> eax      ebx      ecx      edx     
>   00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
>   00000001:ffffffff -> 00090672:00800800:77fafbff:bfebfbff
>   00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
>   00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
>   00000004:00000001 -> fc004122:01c0003f:0000003f:00000000
>   00000004:00000002 -> fc01c143:0240003f:000007ff:00000000
>   00000004:00000003 -> fc1fc163:0240003f:00007fff:00000004
>   00000005:ffffffff -> 00000040:00000040:00000003:10102020
>   00000006:ffffffff -> 00df8ff7:00000002:00000409:00000003

And everything as expected: The ARAT bit is set.

Jan

