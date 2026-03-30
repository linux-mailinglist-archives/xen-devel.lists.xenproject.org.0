Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPp1AaZPymmb7QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 12:25:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7283592FE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 12:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267394.1556899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w79oG-0001hx-0u; Mon, 30 Mar 2026 10:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267394.1556899; Mon, 30 Mar 2026 10:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w79oF-0001eu-UN; Mon, 30 Mar 2026 10:25:27 +0000
Received: by outflank-mailman (input) for mailman id 1267394;
 Mon, 30 Mar 2026 10:25:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w79oE-0001eo-ID
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 10:25:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w79oD-00G4Fw-TT
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 12:25:25 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca4f92-2eae-0a2a0a5409dd-0a2a4504c648-22
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 12:25:25 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca4f95-c823-0a2a45040019-d1558032c4c5-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 12:25:25 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-486fe2024a9so30603755e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 03:25:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487270e7248sm123961175e9.6.2026.03.30.03.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 03:25:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774866325; x=1775471125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk9iPA4aEAPWdzSPecO+wqcTKPBLIZIOOXlz3adrPoA=;
        b=gIrPmYOF3kwfxQ6CSH3E0SQL+990TVuk7awmEHckpbBJc1FTyS5zAsavQFCow3O74t
         CeKp9E0c3S01T2v9cJFeTaqOvGk4uCYpvdNpvJz3P0SlGMIuQ2M3wLf1v2NYedNEQiIE
         0vdh6Z9T7eJsYqfHt30l17kMgwqrLKCrat3cGb0WX+o8IbIH/HzTNTGnQafw7Xof7nLh
         3IfNDwgIriLEW+5w5QpI91nNlyDFI6teIw1PGmga54COOmjuGLf6V0LBAKwzyO2ydCHY
         qV16hZNVfOVy9UTLPYlCMFhsBnxyJycJx/NfZA9kfAPdw/wlN0srKJuNzxGynknuCCwb
         BuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866325; x=1775471125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bk9iPA4aEAPWdzSPecO+wqcTKPBLIZIOOXlz3adrPoA=;
        b=lfupm5pPJlOnMpGBsaSYiwv0BnFUza2O6NfHrepSOqBXuLUsWb8ofUOPSCUi6VSlBY
         PvAWPCVQl52+VRZS+OoF7VAybrQy9xBWlKiDchQMMxjtsOhLB7z4xX5rIE8bn+Ibn9Fk
         uAQYpqbnbZsVqn1CJqX/4Nx3+cCCdmaroRUaH1jHtCrHfJJt2sVQAKcvJNzZlRPHP7zQ
         QuOEXK23aGoxadnXQ60+HBD8aQ2XkHiJsGIszAwIUyRddJHXx54Kp0vHVWInzq6ySFlt
         IvJMGGulsQAgZKOCldM3R9VufilkfECHwkqmecXonQLNaphYDjgAaftCFo1LzV+2PT6q
         U9Dw==
X-Gm-Message-State: AOJu0YycopJ5f8XXAd6awffTKSU1vm26j5Obb5YKg/gmrQL8ZWCKK5/W
	lBFxtnqxipd8FANyYgOHv2qXJtBjy2GOzhc8b9jCUlnot/VXhDMXePc3fyC8LyuGgWif2BpzCq5
	l0ws+Ug==
X-Gm-Gg: ATEYQzy0e9noT3TVDg6ZGVfYxMAIVElf5AJ/Rsu2Gqoh/OPPRLjnEsMq2KMQR35gOOY
	CIrpqjgDTAS4AB3cdYMMuJyhwQ5zrbDNs3I2z4aDvdgaZKszFBzkpG+NVqm+UXhEOT8iwS/trQH
	IHokvZpG42LTU7MzMlgRupk2Yi+AAbYkksh2k79RUSHsta7Q4EIhaL/S6I2vccFRXQPni9goU+N
	2QoZyDFPX7Qkvef0gPP0RvaGTf2d7ftwSajMcOfcdntogJhx6NFxXIhPmrNq71oaOoyticmGR/z
	0vxJcouYYxkqMMhB2u6KFiJvInJ9hYVCafAvnUtYC3eSrFQfi7NZDzREmTFIxINdVmW7SDzUCVk
	t6vT5GCTqKjXL94zWZcZfR+cOi8UYbNYAqCJy1e9ml4BrtJlqoPFJhSOWulfEgZHXAqrlDt4YtP
	OzPTMM6GAu3yIEsWW4rUKqQ1t05tPdTZCoRXzCgPc5StMAHbSV+J95x9wk2ekyXkZWpcQaEkZLc
	g3fTSAF2UPhChg=
X-Received: by 2002:a05:600c:a408:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48727d735a7mr152106215e9.8.1774866325041;
        Mon, 30 Mar 2026 03:25:25 -0700 (PDT)
Message-ID: <cf54e793-63d6-417c-b7c5-3301455fcf33@suse.com>
Date: Mon, 30 Mar 2026 12:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Why memory lending is needed for GPU acceleration
To: Teddy Astie <teddy.astie@vates.tech>,
 Demi Marie Obenour <demiobenour@gmail.com>
References: <84462c4b-7813-4ad1-aeb2-862ae4f3a627@gmail.com>
 <c38387fe-beef-4f50-b928-74f96b881b7a@gmail.com>
 <ce114f02-f45e-4638-84ee-a8fd86ce1c5d@vates.tech>
Content-Language: en-US
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Val Packett <val@invisiblethingslab.com>,
 Ariadne Conill <ariadne@ariadne.space>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
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
In-Reply-To: <ce114f02-f45e-4638-84ee-a8fd86ce1c5d@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1774866325-BB29A9D1-F81F165E/0/0
X-purgate-type: clean
X-purgate-size: 5519
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,vates.tech:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:demiobenour@gmail.com,m:xen-devel@lists.xenproject.org,m:dri-devel@lists.freedesktop.org,m:linux-mm@kvack.org,m:val@invisiblethingslab.com,m:ariadne@ariadne.space,m:andrew.cooper3@citrix.com,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[vates.tech,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5C7283592FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 12:15, Teddy Astie wrote:
> Le 29/03/2026 à 19:32, Demi Marie Obenour a écrit :

May I ask that the two of you please properly separate To: vs Cc:?

Thanks, Jan

>> On 3/24/26 10:17, Demi Marie Obenour wrote:
>>> Here is a proposed design document for supporting mapping GPU VRAM
>>> and/or file-backed memory into other domains.  It's not in the form of
>>> a patch because the leading + characters would just make it harder to
>>> read for no particular gain, and because this is still RFC right now.
>>> Once it is ready to merge, I'll send a proper patch.  Nevertheless,
>>> you can consider this to be
>>>
>>> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
>>>
>>> This approach is very different from the "frontend-allocates"
>>> approach used elsewhere in Xen.  It is very much Linux-centric,
>>> rather than Xen-centric.  In fact, MMU notifiers were invented for
>>> KVM, and this approach is exactly the same as the one KVM implements.
>>> However, to the best of my understanding, the design described here is
>>> the only viable one.  Linux MM and GPU drivers require it, and changes
>>> to either to relax this requirement will not be accepted upstream.
>>
>> Teddy Astie (CCd) proposed a couple of alternatives on Matrix:
>>
>> 1. Create dma-bufs for guest pages and import them into the host.
>>
>>     This is a win not only for Xen, but also for KVM.  Right now, shared
>>     (CPU) memory buffers must be copied from the guest to the host,
>>     which is pointless.  So fixing that is a good thing!  That said,
>>     I'm still concerned about triggering GPU driver code-paths that
>>     are not tested on bare metal.
>>     
>> 2. Use PASID and 2-stage translation so that the GPU can operate in
>>     guest physical memory.
>>     
>>     This is also a win.  AMD XDNA absolutely requires PASID support,
>>     and apparently AMD GPUs can also use PASID.  So being able to use
>>     PASID is certainly helpful.
>>
>> However, I don't think either approach is sufficient for two reasons.
>>
>> First, discrete GPUs have dedicated VRAM, which Xen knows nothing about.
>> Only dom0's GPU drivers can manage VRAM, and they will insist on being
>> able to migrate it between the CPU and the GPU.  Furthermore, VRAM
>> can only be allocated using GPU driver ioctls, which will allocate
>> it from dom0-owned memory.
>>
>> Second, Certain Wayland protocols, such as screencapture, require programs
>> to be able to import dmabufs.  Both of the above solutions would
>> require that the pages be pinned.  I don't think this is an option,
>> as IIUC pin_user_pages() fails on mappings of these dmabufs.  It's why
>> direct I/O to dmabufs doesn't work.
>>
> 
> I suppose it fails because of the RAM/VRAM constraint you said 
> previously. If the location of the memory stays the same (i.e guest 
> memory mapping), pin should be almost "no-op".
> 
> (though, having dma-buf buffers coming from GPU drivers failing to pin 
> is probably not a good thing in term of stability; some stuff like 
> cameras probably break as a result; but I'm not a expert on that subject)
> 
>> To the best of my knowledge, these problems mean that lending memory
>> is the only way to get robust GPU acceleration for both graphics and
>> compute workloads under Xen.  Simpler approaches might work for pure
>> compute workloads, for iGPUs, or for drivers that have Xen-specific
>> changes.  None of them, however, support graphics workloads on dGPUs
>> while using the GPU driver the same way bare metal workloads do.
>>
>> Linux's graphics stack is massive, and trying to adapt it to work with
>> Xen isn't going to be sustainable in the long term.  Adapting Xen to
>> fit the graphics stack is probably more work up front, but it has the
>> advantage of working with all GPU drivers, including ones that have not
>> been written yet.  It also means that the testing done on bare metal is
>> still applicable, and that bugs found when using this driver can either
>> be reproduced on bare metal or can be fixed without driver changes.
> 
> One of my main concerns was about whether dma-buf can be used as 
> "general purpose" GPU buffers; what I read in driver code suggest it 
> should be fine, but it's a bit on the edge.
> 
>>
>> Finally, I'm not actually attached to memory lending at all.  It's a
>> lot of complexity, and it's not at all similar to how the rest of
>> Xen works.  If someone else can come up with a better solution that
>> doesn't require GPU driver changes, I'd be all for it.  Unfortunately,
>> I suspect none exists.  One can make almost anything work if one is
>> willing to patch the drivers, but I am virtually certain that this
>> will not be long-term sustainable.
>>
> 
> There's also the virtio-gpu side to consider. Blob mechanism appears to 
> insist that GPU memory to come from the host by allowing buffers that 
> aren't bound to virtio-gpu BAR yet (that also complexifies the KVM 
> situation).
> 
> You can have GPU memory that exists in virtio-gpu, without being 
> guest-visible, then the guest can map it on its own BAR.
> 
>> If Xen had its own GPU drivers, the situation would be totally
>> different.  However, Xen must rely on Linux's GPU drivers, and that
>> means it must play by their rules.
> 
> 
> 
> 
> --
> Teddy Astie | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 
> 


