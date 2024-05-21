Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB5E8CA801
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 08:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726599.1130932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Iw5-0005qc-90; Tue, 21 May 2024 06:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726599.1130932; Tue, 21 May 2024 06:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Iw5-0005ok-6I; Tue, 21 May 2024 06:25:21 +0000
Received: by outflank-mailman (input) for mailman id 726599;
 Tue, 21 May 2024 06:25:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9Iw4-0005oe-6x
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 06:25:20 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e45bf144-173a-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 08:25:18 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a59c0a6415fso854627266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 23:25:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d350sm1564244766b.23.2024.05.20.23.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 23:25:17 -0700 (PDT)
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
X-Inumbo-ID: e45bf144-173a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716272717; x=1716877517; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jWAMIsl7OjzznvuQYy7NRnhhpXRz3kn+3K3LTHeRdGw=;
        b=fLJiXtVE4DPdg+rBMAVWg1cq04+mOjbwB+iLqIPsRz2wNpfvkrjbog/mQCm7dAxAet
         KENCMngvQCSN0SRiOBtWYS8KKPGhFccdVQn18bQHtvwcRaPlZz5eUlz56EqnTajYWIDo
         LmYxw9T4rxGe7HmvLWT0MW+gPIhFWBkeFCW+RukEPnm9hrkV+pA/NS1cSO2muJK9S6Uu
         pbdew+uz9hbzTH6FSCtJFuavGQ2qI3orbLpoy0j6eJeTCxMzYcpmfRr4UHUrZWUPGbJW
         d77dAUP4k3RdM57y+1KHwHzeBJGlyBJBxbCgypAvV5hoUtnnAKrFcJEwiL5BRiO9mdE+
         W8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716272717; x=1716877517;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jWAMIsl7OjzznvuQYy7NRnhhpXRz3kn+3K3LTHeRdGw=;
        b=XNK2QlA1nf4hjcDkAaL245J17iaqCdOxWeKVlP4KL7veAO45pXZVlmINridUryoyX8
         F6GO7v0hvcoKa0zH264J/shK6Du/D9Yb2+CQU70SJpDoRinI0Ag3xEG99ierywgmoEtq
         wKWC7lEA4akuDGgvdX8gWrZS+mS+SjhOTbC3W/OzS+Ma9zv8n4MgB5W9wE9VqjxAqkyz
         PX2BX6mHaiwUZ/rBO7cA6qEOzkwtDvJ6Sx0/K8sQeOOcUbnkTbk1OksLCiJUl4QTxn8X
         ArRTJ+fSHA09N6EyWHk145SG/uN5vXhySm9+IGTaw6NvjBN/NFDEgMITpOsMq4u/E67W
         J+bg==
X-Gm-Message-State: AOJu0Yw3/YT1KuTi+79nIBe+jG02bWBAGK/DAYpYS19+C69SBfcMa34z
	BRDzlVH4e9hVpHN4vC3aEWtnNeu1nrX6x2D38213nt5j0EwrbgBeFt99yYxIeg==
X-Google-Smtp-Source: AGHT+IGoxVyobR84bSt31y4HWaxgJJ2uJL3R8jBQ17KG3/avDB18+dYliQcbQf3ur6RffFwKxHHHaw==
X-Received: by 2002:a17:906:9e08:b0:a5a:8b17:d851 with SMTP id a640c23a62f3a-a5a8b17db00mr1048558566b.20.1716272717523;
        Mon, 20 May 2024 23:25:17 -0700 (PDT)
Message-ID: <fd5334e0-d54d-48fa-bf7d-c34f9f1a78ab@suse.com>
Date: Tue, 21 May 2024 08:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] VT-d: respect ACPI SATC's ATC_REQUIRED flag
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <e98daa41-c6b6-4f4e-b41d-84006011068d@suse.com> <ZjjdZRPluS0YIazc@macbook>
 <e9281523-a807-4889-80f0-a13804188af9@suse.com> <Zks1qFNsQdLkOCAs@macbook>
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
In-Reply-To: <Zks1qFNsQdLkOCAs@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.05.2024 13:36, Roger Pau Monné wrote:
> On Wed, May 15, 2024 at 12:42:40PM +0200, Jan Beulich wrote:
>> On 06.05.2024 15:38, Roger Pau Monné wrote:
>>> On Thu, Feb 15, 2024 at 11:16:11AM +0100, Jan Beulich wrote:
>>>> When the flag is set, permit Dom0 to control the device (no worse than
>>>> what we had before and in line with other "best effort" behavior we use
>>>> when it comes to Dom0),
>>>
>>> I think we should somehow be able to signal dom0 that this device
>>> might not operate as expected, otherwise dom0 might use it and the
>>> device could silently malfunction due to ATS not being enabled.
>>
>> Whatever signaling we invented, no Dom0 would be required to respect it,
>> and for (perhaps quite) some time no Dom0 kernel would even exist to query
>> that property.
>>
>>> Otherwise we should just hide the device from dom0.
>>
>> This would feel wrong to me, almost like a regression from what we had
>> before.
> 
> Exposing a device to dom0 that won't be functional doesn't seem like a
> very wise choice from Xen TBH.

Yes but. That's what we're doing right now, after all.

>>> I assume setting the IOMMU context entry to passthrough mode would
>>> also be fine for such devices that require ATS?
>>
>> I'm afraid I'm lacking the connection of the question to what is being
>> done here. Can you perhaps provide some more context? To provide some
>> context from my side: Using pass-through mode would be excluded when Dom0
>> is PVH. Hence why I'm not getting why we would want to even just consider
>> doing so.
>>
>> Yet, looking at the spec, in pass-through mode translation requests are
>> treated as UR. So maybe your question was towards there needing to be
>> handling (whichever way) for the case where pass-through mode was
>> requested for PV Dom0? The only half-way sensible thing to do in that case
>> that I can think of right now would be to ignore that command line option,
> 
> Hm, maybe I'm confused, but if the IOMMU device context entry is set
> in pass-through mode ATS won't be enabled and hence no translation
> requests would be send from the device?
> 
> IOW, devices listed in the SATC can only mandate ATS enabled when the
> IOMMU is enforcing translation.   IF the IOMMU is not enabled or if
> the device is in passthrough mode then the requirement for having ATS
> enabled no longer applies.

Oh, I think I now get what your original question was about: Instead of
enabling ATS on such devices, we might run them in pass-through mode.
For PV that would appear to be an option, yes. But with PVH (presumably)
being the future I'd be rather hesitant to go that route.

Jan

