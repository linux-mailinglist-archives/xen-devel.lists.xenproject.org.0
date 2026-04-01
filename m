Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INeWOujczGm0XAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:52:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A113771A0
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270025.1558857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7rJZ-0001Hx-U7; Wed, 01 Apr 2026 08:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270025.1558857; Wed, 01 Apr 2026 08:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7rJZ-0001G7-RW; Wed, 01 Apr 2026 08:52:41 +0000
Received: by outflank-mailman (input) for mailman id 1270025;
 Wed, 01 Apr 2026 08:52:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7rJY-0001G1-3D
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:52:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7rJV-000i76-Ti
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 10:52:39 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ccdcd4-2eae-0a2a0a5409dd-0a2a450496b4-18
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:52:39 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ccdcd7-bb33-0a2a45040019-d155802ad1a9-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:52:39 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so81441185e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:52:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21e265fsm35928746f8f.1.2026.04.01.01.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 01:52:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775033559; x=1775638359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F3XXD4t95daMHDkYOgQ1NzCXzD43KbIUUcpMFxOeYh0=;
        b=St99gkx5OwrnMcihlB+EGbEakxMd9FoiWuNRO6si1Ulsm5oQEk8QqKfG6wPqgpmIh6
         2w6I4L+nV2S2XJ8kca3Yjd+KFpzmnxIoJ7sljY04Hu4bnnS7ooYnLRLvl4qn/oJHO52M
         ot0MwbCp93uZ+vn4Gpx2F5y/3oPAMgPJGaV92rl48v0qQpawpb3YUtQWuyxOoH7l3bky
         j4jgSNFKRRKjJ95xSvJpM6hNdUK6Qd5Y7UqOmfOEcNiU8i9OLf4cPreN4zXqdCJ2CNw6
         XaDxZ0gNTj2XAWC1RRL3Vf5FpxkXm5aE6QrOE7q9INW6LY28sOXDIkRSCSy+bcbqUh1H
         A0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033559; x=1775638359;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3XXD4t95daMHDkYOgQ1NzCXzD43KbIUUcpMFxOeYh0=;
        b=nyXKXGNMjERc864nZu1KlfEW/8GNCdAwzxxegJSPNUSBBdj4qF/4yMv2Ux9LwnbO/S
         kVUfI/XHDfoctDS71cKBIbwEyOKOyHtF0fZ1QgZ0qJMPrTK6hdgeZkdh4UHx2aA0GDr7
         Ny1/I1IApRz2ZB6k+m67j9g6t8dH/GrKuvDQzkGsPWHly+TJlSr35cFdDXhcA10ixU11
         7auuf8chXqsURvAEuebHiJjSH/42zZwroZejTKInhodcxuoBYebr+KtDoZDfN+2ybwnl
         D8iPB6fjFuoih/AUgrPRvIYKN+8EDJoWmeR9pMdo+bkKjDRpmu1cyJIUIN2FtdKXRcMG
         mOhg==
X-Gm-Message-State: AOJu0YxR8eMUN7ztxD8t5zIyLsLxh+Jp6/usms4VLMPwn+xuZn3bl5zT
	j333w1B7BuvMRunjfJXbPvLA0RnbqSfUnDF+I8m4HPTKi9e+ImVLdlW7oyZX3QS0q+FLcUCf+iL
	cjh3GNQ==
X-Gm-Gg: ATEYQzzyom4EpJnegD9JwtQa4ulBLdbCRuY5E1sB0jnsxH5j6eAojzdIRQm0J8VibaX
	aMpOrsSfLau6WYBuA9ELgu+tir9QsF3SVxo5Unyhwlw8MaGVlSWDGoXrnBAPtRzyW8OuMwD4wmQ
	7rjASKfTUQU1OQ4Va3vOOT9FAxuoJQx3dgTAy54KsPy0pog1kHB9zT04Nn8/ZY3pOOuOTGY9nAV
	SReKguSX6tQr6SUwMwoE9BBD217taVVY7lnsr2ycLeGLvXEUPYaNGQpCQj27EqMaNBffi4s7xLD
	xkokYqR+vVG4+P32jDGwgY1TAbPDJbiMgin6G9gncRcC6fvIhXkoLlCglJVIOCEsqbuFxGryMXn
	ftNOMscI3+eusUN/2EcZWIaK3sq38FC7QdeTKwytf7DoHvhVnHJj81HnseF7Y1KR/lT1i8zRhdT
	FSfMrrr1qvy9luY8a3TFX/Ybaxgxi+yOFGbLHtDPw1nWla7BJWCukmAk9D8JJIuIgWhtjbGbWb9
	BvMIcvfnlvTzyE=
X-Received: by 2002:a05:6000:4201:b0:43c:f66e:f24 with SMTP id ffacd0b85a97d-43d150d5c14mr5405444f8f.35.1775033558669;
        Wed, 01 Apr 2026 01:52:38 -0700 (PDT)
Message-ID: <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com>
Date: Wed, 1 Apr 2026 10:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
Content-Language: en-US
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
In-Reply-To: <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1775033559-B253B51B-6B86F8DE/0/0
X-purgate-type: clean
X-purgate-size: 3397
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,gitlab.com:url];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 62A113771A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 09:14, Jan Beulich wrote:
> On 27.03.2026 11:19, Marek Marczykowski-Górecki wrote:
>> I noticed that on some systems, there are a lot of IOMMU faults after
>> S3. I can see it also on a laptop with MTL, but it affects also the ADL
>> gitlab runner:
>>
>>     https://gitlab.com/xen-project/hardware/xen/-/jobs/13661033722
>>     (XEN) [   37.201160] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
>>     (XEN) [   37.201164] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
>>     (XEN) [   37.202332] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
>>     (XEN) [   37.202339] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
>>
>> Interestingly, the 0000:00:1e.6 device is not even listed by lspci.
>>
>> The issue is present only on staging, not staging-4.21.
>>
>> Bisect says:
>>
>> 5ec93b2f19ff8873fca65d38c1164b0a56d3898b is the first bad commit
>> commit 5ec93b2f19ff8873fca65d38c1164b0a56d3898b
>> Author: Jan Beulich <jbeulich@suse.com>
>> Date:   Thu Jan 22 14:13:35 2026 +0100
>>
>>     x86/HPET: drop .set_affinity hook
> 
> Looking into this, I find several things I can't quite understand (yet).
> First there is
> 
> (XEN) [000000456c0fe39f] Disabling HPET for being unreliable
> 
> which looks to only affect clocksource selection, but not use as
> broadcast source for CPU-idle management. (This may be an independent
> issue.)
> 
> Then there is
> 
> (XEN) [    2.760248] HPET: 8 timers usable for broadcast (8 total)
> 
> which should only occur on ARAT-incapable systems. That should only be
> older hardware. (On my much older Skylake I don't see this line, for
> example.) What does CPUID leaf 6 have on this system? Sadly xen-cpuid
> is purely featureset based, and hence doesn't expose info about that
> leaf. The leaf also isn't exposed to domains, so CPUID output in Dom0
> isn't useful to look at either. It would need to be CPUID output on a
> bare metal kernel.
> 
> Further I suspect the fingered commit may only have uncovered an issue
> elsewhere. I don't think we clear any context table entries during
> suspend or resume. Hence in
> 
> (XEN) [   20.554813] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
> (XEN) [   20.554819] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
> 
> the latter message is confusing me.
> 
> The fault address being zero may, otoh, be a hint of hpet_msi_write()
> never having run post-resume. Which may be the connection to the
> dropping of hpet_msi_set_affinity(), as that did call that function.

There clearly is an issue with the handling of the max_cstate variable,
but I expect you don't use xenpm to limit usable C-states (there clearly
is no respective command line option in the log you referenced)?

From what the log has, I conclude hpet_broadcast_resume() is called.
Question is whether it does what we want it to. Could you instrument it
some, so we have confirmation that it is called, and we also know whether
__hpet_setup_msi_irq() is not only called on all 8 channels, but also
succeeds there? (If it failed, I suppose we better wouldn't set
HPET_TN_FSB and/or HPET_TN_ENABLE.) If, however, it succeeds, I couldn't
explain why the fault address would be reported as 0, as then we
definitely must have written HPET_Tn_ROUTE.

Jan

