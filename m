Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2120993B144
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 15:02:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764192.1174541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWbcz-0005WW-U7; Wed, 24 Jul 2024 13:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764192.1174541; Wed, 24 Jul 2024 13:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWbcz-0005UK-Qw; Wed, 24 Jul 2024 13:01:57 +0000
Received: by outflank-mailman (input) for mailman id 764192;
 Wed, 24 Jul 2024 13:01:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWbcy-0005UE-Eq
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 13:01:56 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6b38d93-49bc-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 15:01:54 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7a9e25008aso216254366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 06:01:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7ab62c1989sm48110766b.77.2024.07.24.06.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 06:01:53 -0700 (PDT)
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
X-Inumbo-ID: e6b38d93-49bc-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721826114; x=1722430914; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4NmojNIdBgxJjJ5EY3OKSHBCa67OGBh1hKMW6lmTPnQ=;
        b=AG5nPVhblmdH7MXExjohyIRUr5LVZooG0V2XlExu3ylu2MNFlo+3IzXzjdwpRHiOqF
         zgF8KR2K83/yzZZ5XljFIkLYySOGn5BG9knVUhHdfjuDWq6GEGXtRtmVaCM6urbSt0f0
         D/BNpOZg3SQUHaEXynf2BiMXtxT1+DvdYsNcMR5aWawyFsndc03e+jpp8IRQ5R3LKIdy
         igTc9QmGw/hnatYsRywyBBX/PRjgSCFpVLCpNSmO7eMPYWUdjUtxyaY1QkrsUcK7mvH8
         C3azNR1DojqL+8tWjmp54LkItaYSz0hdwhWWKK9B3hT8wA+EjdiFdoghxXHO8uL5n2m/
         57aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721826114; x=1722430914;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NmojNIdBgxJjJ5EY3OKSHBCa67OGBh1hKMW6lmTPnQ=;
        b=jIu7C/SHQvZmeqoIxEO2MH9zglJpBrKsf4hIo2XvROEf4ForaRtQ2geOOfDlvbRaN5
         LYkc26oeMRlFr233KVRQIkn6wl8kUDyuqe0tFeWiI4HHId3k4omONBLw3jS7nKCLAzQu
         kXQhxPSW/U+5+zek4HeLFTXMRs64+cjgcT3WFl5WfdIbOrl+dIVFlRgAIhIPRDJA2B21
         IIwMzsKx6EPTBgwkOX9w5RH2seoK1pMA8Gb+27w0mp1EGGtMC/nroshCQIE5xf4QzU0f
         LsBbQ3rzScvL9sY07XkiOG+4Z5N0wHy1T2HuZ50TwLsJgw+rAbpU1r5EKd8Euf1lOVf1
         8azg==
X-Gm-Message-State: AOJu0YyBE3ReeFh9MmTVt2MUYVAOotI5Pi98TxwbP27vwZeQuYpVsv27
	8uxxe/gN+AEgoPKczGgC950nTJLtJEDDvD3t+AjIijD/QKWZnz7WLf0q3YfUwA==
X-Google-Smtp-Source: AGHT+IFrPj3dMW6dkqoxNWmC2oFXfF+gGx/H1v+V4nhERDei3QF0LDsMNVT/RE4Iwpryjftaxyj+hQ==
X-Received: by 2002:a17:907:7296:b0:a72:8296:ca1f with SMTP id a640c23a62f3a-a7ab0fa460dmr157134966b.50.1721826113545;
        Wed, 24 Jul 2024 06:01:53 -0700 (PDT)
Message-ID: <a67ef182-b62b-4d0b-9532-a2356f145af5@suse.com>
Date: Wed, 24 Jul 2024 15:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v2] x86/cpuid: Expose max_vcpus field in HVM
 hypervisor leaf
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <fa24cd3b232e8865eb6451e5f7af9cd203ce52ab.1721224079.git.matthew.barnes@cloud.com>
 <12e2c7b2-6d0b-4427-ac30-257bfea2aeab@suse.com>
 <669fa8ad.170a0220.843bc.3a17@mx.google.com>
 <a08d0d27-1d7b-4453-807c-3670cb4f05aa@suse.com>
 <66a0f8c9.050a0220.879ba.9673@mx.google.com>
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
In-Reply-To: <66a0f8c9.050a0220.879ba.9673@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 14:51, Matthew Barnes wrote:
> On Wed, Jul 24, 2024 at 07:42:19AM +0200, Jan Beulich wrote:
>> (re-adding xen-devel@)
>>
>> On 23.07.2024 14:57, Matthew Barnes wrote:
>>> On Mon, Jul 22, 2024 at 01:37:11PM +0200, Jan Beulich wrote:
>>>> On 19.07.2024 16:21, Matthew Barnes wrote:
>>>>> Currently, OVMF is hard-coded to set up a maximum of 64 vCPUs on
>>>>> startup.
>>>>>
>>>>> There are efforts to support a maximum of 128 vCPUs, which would involve
>>>>> bumping the OVMF constant from 64 to 128.
>>>>>
>>>>> However, it would be more future-proof for OVMF to access the maximum
>>>>> number of vCPUs for a domain and set itself up appropriately at
>>>>> run-time.
>>>>>
>>>>> GitLab ticket: https://gitlab.com/xen-project/xen/-/issues/191
>>>>>
>>>>> For OVMF to access the maximum vCPU count, this patch has Xen expose
>>>>> the maximum vCPU ID via cpuid on the HVM hypervisor leaf in edx.
>>>>>
>>>>> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Tweak value from "maximum vcpu count" to "maximum vcpu id"
>>>>> - Reword commit message to avoid "have to" wording
>>>>> - Fix vpcus -> vcpus typo
>>>>> ---
>>>>
>>>> Yet still HVM-only?
>>>
>>> This field is only used when the guest is HVM, so I decided it should
>>> only be present to HVM guests.
>>>
>>> If not, where else would you suggest to put this field?
>>
>> In a presently unused leaf? Or one of the unused registers of leaf x01
>> (with the gating flag in leaf x02 ECX)?
> 
> I could establish leaf x06 as a 'domain info' leaf for both HVM and PV,
> have EAX as a features bitmap, and EBX as the max_vcpu_id field.
> 
> Is this satisfactory?

Hmm. Personally I think that all new leaves would better permit for multiple
sub-leaves. Hence EAX is already unavailable. Additionally I'm told that
there are internal discussions (supposed to be) going on at your end, which
makes me wonder whether the above is the outcome of those discussions (in
particular having at least tentative buy-off by Andrew).

For the particular data to expose here, I would prefer the indicated re-use
of an existing leaf. I haven't seen counter-arguments to that so far.

Jan

