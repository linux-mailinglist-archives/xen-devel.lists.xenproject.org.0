Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B11A714AE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 11:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927543.1330269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNtc-000757-3r; Wed, 26 Mar 2025 10:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927543.1330269; Wed, 26 Mar 2025 10:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNtc-00072Y-0n; Wed, 26 Mar 2025 10:22:04 +0000
Received: by outflank-mailman (input) for mailman id 927543;
 Wed, 26 Mar 2025 10:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txNta-00072S-0z
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 10:22:02 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26fe2649-0a2c-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 11:21:59 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3912e96c8e8so3690856f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 03:21:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b3dd5sm16301209f8f.45.2025.03.26.03.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 03:21:58 -0700 (PDT)
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
X-Inumbo-ID: 26fe2649-0a2c-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742984519; x=1743589319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/rgV5CtnLpn7fsYlkMLP7xCHIAzzSp95q3bpwITenQ=;
        b=K4V44EmbmVqiMhFet4ObgJXvAdenGS0yv9RQm/y4GGBMrAqPYkmvDaeODJkzBoZjV5
         8UkrAyUzO8sqVu4r3vtSr7TlY+HtZhXTxS3RP6dgSdeqxdzb8k6Pz4cUmzLf8zazeszW
         XLDDMpXzLCbp38pv6z/O5wwTFGlEj2Y5BTkKGb6G+ISi6Hm3PU6XahAmaaYC8FBtPCw9
         lmMf2a+dtLJSpIVOk8n0HBsnIpw4Ls/0Ra3gfX0B2iyn80MznHV3hR8Rp8kwRqlGcnxw
         k7N9nvYB2LF095Sj6mfxk7/8Bbqf+FVE1fJhwcaoxkD1JFe65YUooWQ8sTDzCp+vISZ3
         6NGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742984519; x=1743589319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/rgV5CtnLpn7fsYlkMLP7xCHIAzzSp95q3bpwITenQ=;
        b=EQc/5Iho+gFuOgp6ostTjTkd9t9rEChZJZLOYvXBWICeZNWGCBDbM3m20ZfVE27Zne
         6XkQuwlc7AKnVGcX657v4sq3LrfkiDMwBpVN1AiW/U96yxRUv/owYjKlI3GSzdXoq5Wc
         LfldP4pejJQgtsOZOkQkxs4/36tOiMpRpyHNVHJ6wFEmd6sVlCClhrgzNHZjlO3ZW2kl
         iic+0HNTTyebRml5sTDuGdN7h8RC7APQ7nqyz5dQlWHKOwl5SW5bCCObpYUXy5vcoTod
         YuHtA+ZHBqcorTiocTnDIRAWEYPfFrZXHPffoRMDdNe06WBpOc6ap+V/LaPX+tMWWOPr
         NATQ==
X-Gm-Message-State: AOJu0YxhNt6Ccmfgn0Ep2T6DwGdXP3MZnGrRx3BI4wR01QwwMQC9gWIn
	7UuV07EpYYxzE4DhyX3G6K7AYOqia+ViXhMAP7KNtnFZ50EWTnjqeVUCsbFTfQ==
X-Gm-Gg: ASbGncu8L05IgYIMzmbc/3aY4FSHDWHpaxduRO2MXEZ/Lr4KIFiP7e5uuK1wD3tdKT9
	Yx+xF3X/8vf/vW1IBHYnU5beWC5oCYfBF0NNvnawK1zg801WhTDsyNT+WXzyV+Udxt/sOLqA2YY
	VeiO2NOJYmvudu7XISp0FaxrxBCjFsSTKRvOAkVT+lcjJ7RL/Eqkssnz8kd8jI4YoAQ5JBHpvG7
	S9A2n4uHkSR0xhApN6ehYhZ5uAyTpBndiZlO6GAmOw4IkMqpzdSNdnhF/XJdiwwjYGlSDfdCDpb
	i8BQAUMEOONMKtq5rbEt8Gii0LDeR+fxCprjKWNguVyWcQQU8QCDmHQdurPj2tuO/aHpMuY9OSm
	Lw7B/+YmGGHhEHs9mkkFCnEgP2iCsVA==
X-Google-Smtp-Source: AGHT+IHa5kBjj5lsbuhtuhBkH9mH58JhlP2OOdMLEvLxGLEONIcewoVcJv/QdsW2e+baLs1opV2G/w==
X-Received: by 2002:a05:6000:2110:b0:39a:ca04:3dff with SMTP id ffacd0b85a97d-39aca043e21mr3968202f8f.40.1742984519197;
        Wed, 26 Mar 2025 03:21:59 -0700 (PDT)
Message-ID: <5fa59cc5-2072-4cee-b6f9-7d9cc6be9074@suse.com>
Date: Wed, 26 Mar 2025 11:21:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PVH: expose OEMx ACPI tables to Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <c9365d42-c15d-4d93-acd8-106ca46cb7f3@suse.com>
 <Z-PHJk8GT-y1NnHl@macbook.local>
 <59685c88-44c6-43fe-9f6e-1121d51fd76f@suse.com>
 <Z-PUhO3C1qp3L8-l@macbook.local>
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
In-Reply-To: <Z-PUhO3C1qp3L8-l@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.03.2025 11:18, Roger Pau Monné wrote:
> On Wed, Mar 26, 2025 at 10:45:18AM +0100, Jan Beulich wrote:
>> On 26.03.2025 10:21, Roger Pau Monné wrote:
>>> On Wed, Mar 26, 2025 at 09:45:09AM +0100, Jan Beulich wrote:
>>>> Further tables on said system
>>>> which weren't blacklisted prior to that commit, yet which also aren't
>>>> whitelisted are DBGP, DBG2, FIDT, LPIT, MIGT, MSCT, NITR, PCCT, RASF,
>>>> SVOS, UEFI, WDDT, and WSMT. Even without diving into the details of any
>>>> of them it seems pretty clear to me that at least some would want
>>>> whitelisting, too.
>>>
>>> I cannot find any reference about: FIDT, MIGT, NITR, SVOS and WDDT in
>>> the ACPI spec.
>>
>> WDDT - Watchdog Descriptor Table (Table 5.6 in spec version 6.5)
>>
>>> The MSCT I think we don't want to expose, as it's related to topology
>>> data.
>>>
>>> Regarding RASF I would be slightly worried about the patrol scrub
>>> feature.  The memory map exposed to dom0 will be different from the
>>> native one, and there's also the interposed p2m.
>>
>> Thing is - either kind of Dom0 needs to have a sufficient level of insight
>> into the host memory map to support memory-related RAS features. Which may
>> mean that RASF may only be exposed if the Dom0 kernel declares itself as
>> aware of the need to consider data there to refer to a separate address
>> space.
> 
> Yes, but then, how is a PVH dom0 going to be aware of such addresses?
> Given the automatic translation of gfn -> mfn that's completely hidden
> from dom0.

Right, but the knowledge is going to be necessary there, I expect.

> I'm not saying it can't be done, but I think RASF shouldn't be exposed
> to a PVH dom0 until we understand how such feature is supposed to work
> with the interposed p2m and the fabricated memory map available to a
> PVH dom0.  Note a PVH dom0 can still get the host memory map from the
> XENMEM_machine_memory_map hypercall.

Oh, of course I agree we can't expose such without first having dealt with
the implications.

Jan

