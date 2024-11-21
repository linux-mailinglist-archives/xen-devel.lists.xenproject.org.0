Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FDF9D4BDD
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 12:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841400.1256891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5LW-0007Xs-5M; Thu, 21 Nov 2024 11:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841400.1256891; Thu, 21 Nov 2024 11:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5LW-0007Vi-2D; Thu, 21 Nov 2024 11:27:38 +0000
Received: by outflank-mailman (input) for mailman id 841400;
 Thu, 21 Nov 2024 11:27:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tE5LV-0006w5-20
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 11:27:37 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a2c008c-a7fb-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 12:27:33 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3823194a879so503909f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 03:27:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38254949cd0sm4772477f8f.107.2024.11.21.03.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 03:27:33 -0800 (PST)
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
X-Inumbo-ID: 9a2c008c-a7fb-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzEiLCJoZWxvIjoibWFpbC13cjEteDQzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlhMmMwMDhjLWE3ZmItMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTg4NDUzLjg4NzU1Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732188453; x=1732793253; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jq89gAcKR5aqlGaCYSB4+8DC2hQooPxpX2gMZb1gROY=;
        b=L0cwcwU9UY5skbM80/HXi/fUXHG4QQXJfybql+p82f45CP7OSOZcw1uqzFTVnCsPl8
         QOo0V2xsKEiefXFMZXRsT4Xva+wIkXy4h8GBZ29VeCxsEx2enAMy107KL4Wt2NQoV30T
         Pv5yzpRh6u4cD/hqP4Fy/W/5JryZCzR2P+sqS4nTFv9+rY8/Gz1Yy9MpihIviImvh1kx
         V3A1XDM0jHm8vuYnjfu1ObgjEenYbBGNY3JiDye0KxkMn4URlPQgnSYrg5mX9hVkbkrs
         rzFFdpeJimrbIW0K4SrOrjcBjygdub6hx/bENcB/psVS7XUrf5E2bHK0AvWX6DLFI448
         ONtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732188453; x=1732793253;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq89gAcKR5aqlGaCYSB4+8DC2hQooPxpX2gMZb1gROY=;
        b=T4hgfZFXvuiiew6ddmAuSm/qBG0kFjRcWNcakg+CYZ1kDbP/kxRA57qlpUwXieuGgc
         yEYdw0lOTvkXwnYSIp0GwG6ePYNi05jtzguI9wQCdM+Wy+yaCEyiOHeXXFghrQZlCut6
         RA21+T8L41vuPP0+XADqgTQr0abFwnWDlAVt/FFak7q7WDqWi9TlO2gsLcAvP0Zmie/B
         VAAIVlrHvG120AQX272ySDKmrYP9eoJj1L0uk6w9/f4yzGynYoeZWF72q//UyAtmjNUd
         KY1/9OkFU7O5k7xtSoIZyguycyD1dCCijM8D5ZDMf8lniJjCYXGBiTiDAhuR+APW6CZn
         7o8w==
X-Gm-Message-State: AOJu0YySLb9go2ffBJKC8Z95AoyRmoVWETeUk9/cxlVIFgMpNzdRN2Zv
	6407o5ptrdaJ7Qcfl8+YsdBYoII6rvSCdTWyoCk3HHK2GtD6gp7jiXkQNnmA9w==
X-Google-Smtp-Source: AGHT+IHRzCLAHhh/ekqkOng6a//shq1A0AxbLuz06GoLr6gA7TTb2mHMadBfbjPKWFS+AV1nOlSQ2Q==
X-Received: by 2002:a5d:64ab:0:b0:382:5af:e990 with SMTP id ffacd0b85a97d-38254b1c8b0mr4367048f8f.49.1732188453417;
        Thu, 21 Nov 2024 03:27:33 -0800 (PST)
Message-ID: <5bd5ded0-65fa-42db-ba73-b4fa44e2466e@suse.com>
Date: Thu, 21 Nov 2024 12:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/pvh: also print hardware domain pIRQ limit for
 PVH
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20241120113555.38146-1-roger.pau@citrix.com>
 <20241120113555.38146-3-roger.pau@citrix.com>
 <25fb7dfe-50e0-446a-9057-050fd3c2edb2@suse.com> <Zz8UsJ4nJXyExQ53@macbook>
 <28111c22-e4f6-4714-a112-f07109bb5940@citrix.com> <Zz8YUrSf-asxPGXJ@macbook>
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
In-Reply-To: <Zz8YUrSf-asxPGXJ@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.11.2024 12:24, Roger Pau Monné wrote:
> On Thu, Nov 21, 2024 at 11:14:23AM +0000, Andrew Cooper wrote:
>> On 21/11/2024 11:08 am, Roger Pau Monné wrote:
>>> On Thu, Nov 21, 2024 at 11:54:49AM +0100, Jan Beulich wrote:
>>>> On 20.11.2024 12:35, Roger Pau Monne wrote:
>>>>> Do not return early in the PVH/HVM case, so that the number of pIRQs is also
>>>>> printed.
>>>> What you're printing ...
>>>>
>>>>> Fixes: 17f6d398f765 ('cmdline: document and enforce "extra_guest_irqs" upper bounds')
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> ---
>>>>>  xen/arch/x86/io_apic.c | 12 +++++++-----
>>>>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
>>>>> index bd5ad61c85e4..d9db2efc4f58 100644
>>>>> --- a/xen/arch/x86/io_apic.c
>>>>> +++ b/xen/arch/x86/io_apic.c
>>>>> @@ -2754,11 +2754,13 @@ unsigned int __hwdom_init arch_hwdom_irqs(const struct domain *d)
>>>>>  
>>>>>      /* PVH (generally: HVM) can't use PHYSDEVOP_pirq_eoi_gmfn_v{1,2}. */
>>>>>      if ( is_hvm_domain(d) )
>>>>> -        return nr_irqs;
>>>>> -
>>>>> -    if ( !d->domain_id )
>>>>> -        n = min(n, dom0_max_vcpus());
>>>>> -    n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, max_irqs);
>>>>> +        n = nr_irqs;
>>>> ... is rather the number of IRQs we picked for the system. That may happen to
>>>> end up being the upper bound for PVH Dom0, yet not logging this at all was
>>>> because of the limited use pIRQ-s have there. Granted at the time I was still
>>>> under the impression they have no use there at all, so this isn't really an
>>>> objection to the change. I would have been nice though if the description had
>>>> mentioned why significance pIRQ-s actually have in PVH Dom0.
>>> Sure, what about adding to the commit message:
>>>
>>> "While PVH dom0 doesn't have access to the hypercalls to manage pIRQs
>>> itself, neither the knowledge to do so, pIRQs are still used by Xen to
>>> map and bind interrupts to a PVH dom0 behind its back.  Hence the
>>> pIRQ limit is still relevant for a PVH dom0."
>>
>> Minor grammar point.  You want "nor" rather than "neither" in this
>> context, because it's introducing the second of two negative things.
> 
> Thanks!  Could one of you adjust at commit if Jan agrees with adding
> the paragraph?

Sounds good, and certainly not a problem to add while committing.

Jan

