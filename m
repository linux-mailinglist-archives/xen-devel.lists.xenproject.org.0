Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E750A9C6DDF
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 12:29:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835447.1251322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBYk-0003AT-Eu; Wed, 13 Nov 2024 11:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835447.1251322; Wed, 13 Nov 2024 11:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBYk-00037q-B2; Wed, 13 Nov 2024 11:29:18 +0000
Received: by outflank-mailman (input) for mailman id 835447;
 Wed, 13 Nov 2024 11:29:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBBYi-00037k-Sr
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 11:29:16 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 821a0d6f-a1b2-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 12:29:13 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so1167625e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 03:29:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d552ea45sm21192935e9.44.2024.11.13.03.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 03:29:12 -0800 (PST)
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
X-Inumbo-ID: 821a0d6f-a1b2-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzYiLCJoZWxvIjoibWFpbC13bTEteDMzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjgyMWEwZDZmLWExYjItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDk3MzUzLjI3NDYwNCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731497353; x=1732102153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=orbMKzBD7FhsHtlhVVfwtzvmTEiApwEUwrrXOLf68C8=;
        b=f0rZH8Dh2Owwqk4bkgiwoyhtmT2W58Gbtszp+vYV143rI6R+aIdNaCLI7e6btIURvk
         EEDuecuTQDqMMAAz29PT8/tFocX7vwoevveSlMoCeEZm8yKguqR4rswN7MgoEwSQk0gW
         JOZH6eFHPPhGqVtmVBHcOSm7DU7VhhSxrhroFXvM0zN5qOkdbfiiEtRPOYBx+7l3C/GW
         M6PnWPAeKrw/9R9f0eT+/J+TUzUUKScsEqpWoYsG9jKTk3iUzaRkLXt47KWCnRG2o8Ia
         0Pa+ckbvABLpt9jlD/PQqcIxBS4wtqtk1T9zkh/OoCo9sy/R870aJ1OdPg3dpB4gIc2u
         6Emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731497353; x=1732102153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orbMKzBD7FhsHtlhVVfwtzvmTEiApwEUwrrXOLf68C8=;
        b=bMzf45GyQaOVyvYSCQNbXjwIXT5ZdUZ1Y9X8tALIBiw7ch4desz3TS0N/JDFmoKfYg
         ihlLTvGR2wnpADF5YSkxSsRMlJlfa2HM8x4AjLkPEpSLNhLbCUl92Emz26yR2wmAKwVO
         GEcVAlVM4SO4RHshZF4PkHf6SeewS/y6tB/evyYU+Bag2dsAHxxpffqxqZAzizxR6NHG
         NaIZBpAGefP0kqskH50ubs3uvtwJLx1dg4S2tNDeF0R5dd0EqidOTAtp8tDmavBafUO3
         DWPlS6EV5stO/gh30J5Lafa8oksBctpy8JNOaTNdUdzUGidocdyHGqH35pBcm9Jw/nJj
         1UZw==
X-Forwarded-Encrypted: i=1; AJvYcCVt43dIBgBu0fb1FUL60kkAbQDkvZgK0l10ILqtaPu9pZ2ELpBPs4NWYbqlJD+3maRPS/8+/hl91RU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8hZbyQ72ASW/BYfFJzymRkTJn7UCIodanbMBeX+C5PeAcjWzR
	YxiE0hiq/5qsGD0v1R1xXdEoMaOIEsDmxQA3eTbb2t/4dktfJ0XuZGsDNPGDDzz7VRSgj8Is4Rk
	=
X-Google-Smtp-Source: AGHT+IHe9eZkxeucb5cZ8khgP6X5k5NhmkwVKHVx1xZWpBPk6sUmXSpAs07Z0ToQkSgtWOhGlYf+8w==
X-Received: by 2002:a05:600c:a04:b0:428:1b0d:8657 with SMTP id 5b1f17b1804b1-432b7517a5cmr169816645e9.22.1731497352619;
        Wed, 13 Nov 2024 03:29:12 -0800 (PST)
Message-ID: <4f75dc1d-a9f9-4ef9-b26a-77668dd6d3f2@suse.com>
Date: Wed, 13 Nov 2024 12:29:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vpci: Add resizable bar support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzRxqO3_GEgs7W1I@macbook>
 <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzR_wlY0wXjqec8T@macbook> <6adc29fc-c6a6-460b-b034-62400e8c193b@suse.com>
 <ZzSF4es4NJnd3-JP@macbook> <38aa85ae-b398-4d23-82bb-6586457126f2@suse.com>
 <ZzSMemXEhJu21Id3@macbook>
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
In-Reply-To: <ZzSMemXEhJu21Id3@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2024 12:24, Roger Pau Monné wrote:
> On Wed, Nov 13, 2024 at 12:01:23PM +0100, Jan Beulich wrote:
>> On 13.11.2024 11:56, Roger Pau Monné wrote:
>>> On Wed, Nov 13, 2024 at 11:36:46AM +0100, Jan Beulich wrote:
>>>> On 13.11.2024 11:30, Roger Pau Monné wrote:
>>>>> On Wed, Nov 13, 2024 at 10:00:33AM +0000, Chen, Jiqian wrote:
>>>>>> On 2024/11/13 17:30, Roger Pau Monné wrote:
>>>>>>> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
>>>>>>>> Some devices, like discrete GPU of amd, support resizable bar capability,
>>>>>>>> but vpci of Xen doesn't support this feature, so they fail to resize bars
>>>>>>>> and then cause probing failure.
>>>>>>>>
>>>>>>>> According to PCIe spec, each bar that support resizing has two registers,
>>>>>>>> PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
>>>>>>>> corresponding handler into vpci.
>>>>>>>>
>>>>>>>> PCI_REBAR_CAP is RO, only provide reading.
>>>>>>>>
>>>>>>>> PCI_REBAR_CTRL only has bar size is RW, so add write function to support
>>>>>>>> setting the new size.
>>>>>>>
>>>>>>> I think the logic to handle resizable BAR could be much simpler.  Some
>>>>>>> time ago I've made a patch to add support for it, but due to lack of
>>>>>>> hardware on my side to test it I've never submitted it.
>>>>>>>
>>>>>>> My approach would be to detect the presence of the
>>>>>>> PCI_EXT_CAP_ID_REBAR capability in init_header(), and if the
>>>>>>> capability is present force the sizing of BARs each time they are
>>>>>>> mapped in modify_bars().  I don't think we need to trap accesses to
>>>>>>> the capability itself, as resizing can only happen when memory
>>>>>>> decoding is not enabled for the device.  It's enough to fetch the size
>>>>>>> of the BARs ahead of each enabling of memory decoding.
>>>>>>>
>>>>>>> Note that memory decoding implies mapping the BARs into the p2m, which
>>>>>>> is already an expensive operation, the extra sizing is unlikely to
>>>>>>> make much of a difference performance wise.
>>>>>>>
>>>>>>> I've found the following on my git tree and rebased on top of staging:
>>>>>> OK.
>>>>>> Do you need me to validate your patch in my environment?
>>>>>
>>>>> Yes please, I have no way to test it.  Let's see what others think
>>>>> about the different approaches.
>>>>
>>>> I'd certainly prefer your simpler form, if it's safe and fits the needs.
>>>>
>>>>>> And I have one question: where does your patch do writing the resizing size into hardware?
>>>>>
>>>>> dom0 has unrestricted access to the resize capability, so the value
>>>>> written by dom0 is propagated to the hardware without modification.
>>>>>
>>>>> I would be wary of exposing the resize capability to untrusted
>>>>> domains, as allowing a domU to change the size of BARs can lead to
>>>>> overlapping if the hardware domain hasn't accounted for the increase
>>>>> in BAR size.
>>>>
>>>> Question is how the feature is used in practice: If it was a driver to
>>>> request the re-size, I'd have a hard time seeing how we could make that
>>>> work without intercepting accesses to the capability for DomU-s (implying
>>>> to expose it in the first place, of course).
>>>
>>> Question is also whether the capability is required for guests, as in
>>> OS drivers requesting it to be present for proper operation.
>>>
>>> I haven't given much thought about how to expose to domUs.  The
>>> current patch doesn't attempt to expose to domUs either, as the
>>> capability is not added to the 'supported_caps' array.
>>
>> Hmm, I see. Yet then adding support to vPCI, but limited to Dom0, ends up
>> odd in two ways: Another aspect that'll need dealing with for DomU-s, and
>> the same functionality remaining unavailable (or at least not properly
>> available, with all possible side effects) to PV Dom0.
> 
> I think resizable BARs should just work for PV dom0, as Xen allows PV
> dom0 to map almost all physical memory.  Xen doesn't require knowing
> the BAR positions and sizes like it does for PVH dom0.

Does it really not need to know in any (corner) case? Are there guarantees
that e.g. MSI-X table or PBA can't move when the size of the BAR covering
them changes?

> Note that resizable BAR capability is not exposed to domUs now either
> when using QEMU based pci-passthrough.

Of course.

Jan

