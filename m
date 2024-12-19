Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685629F7530
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 08:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860794.1272776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOAhs-0001Mz-Bp; Thu, 19 Dec 2024 07:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860794.1272776; Thu, 19 Dec 2024 07:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOAhs-0001KL-8d; Thu, 19 Dec 2024 07:12:24 +0000
Received: by outflank-mailman (input) for mailman id 860794;
 Thu, 19 Dec 2024 07:12:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOAhq-0001KF-IP
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 07:12:22 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9662d34b-bdd8-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 08:12:20 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43618283d48so2931235e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 23:12:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c493sm8841105e9.28.2024.12.18.23.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 23:12:19 -0800 (PST)
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
X-Inumbo-ID: 9662d34b-bdd8-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734592340; x=1735197140; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gkuMAuZSIqyAgN1zpPUPQDsr+zfCXjOFW09VW94ZwaY=;
        b=EHkrD+3m0bRRK/PeKbesJiPY6sDWtbuNMbXvdRDmazx1wvcJOyTNfMgt+z/lXwT2Bo
         ee+pzUaR6pl58rWlj5wnKPVnwfApvjXPlxqqrXlA0oyRQZMA6SEb0m3g0GIR9b5kmlvX
         BACIIRZod4v/Rr+IcN1B3OByW8ZNZwBbah9P85K8w4wCCayanb7icPFVxnLaMFchJlmT
         rRSVFZJ796ZIjra1yGk8BmUGdZRFkJNz6tgP+FO0EWQ+N1PZ25Vvg9fB7kP/j6pZCAzK
         QE8flJs9naYAtO/xslsXQA4WJjvaBbOSqy7QGoIyTi3R3425yevnCfwX2MQfthDDA6bG
         0wGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734592340; x=1735197140;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkuMAuZSIqyAgN1zpPUPQDsr+zfCXjOFW09VW94ZwaY=;
        b=vpwvL27zhK6XOx6MXHMDUacBtxMbo5OVuhlPySS9JomfVOrmvOfQxaM625B5O0TTLT
         WHz2r6Ll7fQ2RNJIq5yp4g2QllRd7dHTBrMYTgfT4+2G6fzcIaDHvHxqrOVVCMWRu6Tz
         pUmKw8zAkLEiaaWVIgbIfHHgtbGhmGOr3PH8wIYeNWgmVO/wNknXepfL7gZpniAUK2PJ
         wErMd7iFJPhJdxmY1xWSEQ2bEycddQIaFg0/fmvVlv6vK0lYL/MrlkgoYPu8oduaGiQt
         OYMEpf+z3kBUGnRgZGSbwDIeDiUI5H57t/fv+xc/T30g6KlbCcJWh2wGPj+IIb6LRqwT
         k5gw==
X-Forwarded-Encrypted: i=1; AJvYcCV7ZZqQ5aImbFqP/bEY1YfrwgPwkItitI/ZnC9ZQqy7IB1tx6aLCNTWLRZIreuk2g3nLSUXhm8qJsY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweR6pejg9EiPaf0O2KKA5MyvYtuDubelB+9FR3TFpdJxG3zqh2
	oqnrfr8i2iGZ8rP40e+g0N3MRntCSIUzEUyVwgnxHNJlHqXeJOjTeoBltYsRAA==
X-Gm-Gg: ASbGncsAKF+zoja14onHuQOcr0k17ACU6OUOZoGL1E0rC9ggxA7G43sQm7D5PCRJ4kV
	H3Op9IDnL10EmOpt6HeBY3fyLg2ueIFOeYys/HwGtQCAqUKt7x1KfYiUpbyypghFs0rZ+8jZxb0
	roS0Uz0vwMHnr91lu1cTUq1AUn63f2p3DIDGFBq3wsk8BGbvjntwaHxsM6CZOK3DuyJXtHs5L4+
	A6zBm5YYRhBRtdCFNlJWo3xlVWALzh0QCLxqkWJ0PfE2ChSSAxdvnWNQ560iX1XRCohMIdqWbO4
	ZH6FtScqrTDWklHHa+Xyv3PZfAt33tcswtopWhX5iQ==
X-Google-Smtp-Source: AGHT+IHtdHP3fwX5dSHFKl5Y6uCqmktGD5aMPmW5CruHMJqq40cB6k+kqq+bS+B53C1bIDa17ivwbQ==
X-Received: by 2002:a05:600c:3b9d:b0:434:a1e7:27b0 with SMTP id 5b1f17b1804b1-4365535ddedmr42076975e9.11.1734592340030;
        Wed, 18 Dec 2024 23:12:20 -0800 (PST)
Message-ID: <781a2f80-9ca6-4875-9b4a-ecef7694ae2e@suse.com>
Date: Thu, 19 Dec 2024 08:12:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen/mmu: Increase MAX_CONTIG_ORDER
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Thierry Escande <thierry.escande@vates.tech>
References: <20241204171346.458105-1-thierry.escande@vates.tech>
 <ccb28ccc-531c-4ead-9a27-76cc430f8c35@suse.com>
 <cc61bdce-47af-45ea-8ace-173adef9ae41@vates.tech>
 <cbc389e4-3b69-4681-ad66-6102b0ed0cae@suse.com>
 <8fb77778-b821-4e38-a835-54883ba14e4b@suse.com>
 <ed764807-a58b-473c-911d-b52f013f89b2@vates.tech>
 <733e95a6-dd33-422a-a25b-9f08cef5860e@suse.com>
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
In-Reply-To: <733e95a6-dd33-422a-a25b-9f08cef5860e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2024 12:24, Jürgen Groß wrote:
> On 18.12.24 12:11, Thierry Escande wrote:
>>
>>
>> On 12/12/2024 12:09, Juergen Gross wrote:
>>> On 12.12.24 11:22, Jan Beulich wrote:
>>>> On 11.12.2024 19:20, Thierry Escande wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On 09/12/2024 11:04, Jan Beulich wrote:
>>>>>> On 04.12.2024 18:14, Thierry Escande wrote:
>>>>>>> With change 9f40ec84a797 (xen/swiotlb: add alignment check for dma
>>>>>>> buffers), the driver mpt3sas fails to load because it cannot allocate
>>>>>>> its DMA pool for an allocation size of ~2,3 MBytes. This is because
>>>>>>> the
>>>>>>> alignement check added by 9f40ec84a797 fails and
>>>>>>> xen_swiotlb_alloc_coherent() ends up calling
>>>>>>> xen_create_contiguous_region() with a size order of 10 which is too
>>>>>>> high
>>>>>>> for the current max value.
>>>>>>>
>>>>>>> This patch increases the MAX_CONTIG_ORDER from 9 to 10 (4MB) to allow
>>>>>>> such allocations.
>>>>>>>
>>>>>>> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
>>>>>>> ---
>>>>>>>    arch/x86/xen/mmu_pv.c | 2 +-
>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
>>>>>>> index 55a4996d0c04..7f110740e1a2 100644
>>>>>>> --- a/arch/x86/xen/mmu_pv.c
>>>>>>> +++ b/arch/x86/xen/mmu_pv.c
>>>>>>> @@ -2200,7 +2200,7 @@ void __init xen_init_mmu_ops(void)
>>>>>>>    }
>>>>>>>      /* Protected by xen_reservation_lock. */
>>>>>>> -#define MAX_CONTIG_ORDER 9 /* 2MB */
>>>>>>> +#define MAX_CONTIG_ORDER 10 /* 4MB */
>>>>>>>    static unsigned long discontig_frames[1<<MAX_CONTIG_ORDER];
>>>>>>
>>>>>> While lacking respective commentary, bumping this value imo also
>>>>>> needs to
>>>>>> take into account Xen itself, at least commit-message-wise. The
>>>>>> bumping is
>>>>>> fine for Dom0 in any event. It is also fine for DomU-s with the
>>>>>> defaults
>>>>>> built into the hypervisor (orders 12 and 10 respectively for x86 and
>>>>>> Arm),
>>>>>> yet especially for Arm (and in the future PPC and RISC-V) any further
>>>>>> bumping would be less straightforward.
>>>>>
>>>>> Thanks for pointing this out. On the Xen side, CONFIG_CTLDOM_MAX_ORDER
>>>>> and CONFIG_HWDOM_MAX_ORDER seem big enough on all architectures. But I
>>>>> see CONFIG_DOMU_MAX_ORDER set to 9 (also all archs). Won't that be a
>>>>> problem for drivers trying to allocate more than that from a domU ?
>>>>
>>>> A driver assumes a (physical) device to be in the DomU, at which point it
>>>> is CONFIG_PTDOM_MAX_ORDER which applies (PT standing for pass-through).
>>>>
>>>>>> However - does the driver really need this big a contiguous chunk? It
>>>>>> would seem far more desirable to me to break that up some, if possible.
>>>>>
>>>>> Since this works on bare metal I'm afraid the driver maintainer (mpt
>>>>> fusion driver) will just tell me to fix Xen.
>>>>
>>>> Well. The bigger such allocations, the larger the risk that on systems
>>>> that have been up for a while such allocations can't be fulfilled anymore
>>>> even in the bare metal case.
>>>
>>> Yes. I don't think we should just work around this issue without having
>>> even tried to get the driver fixed. In case they refuse to change it, we
>>> can still increase MAX_CONTIG_ORDER.
>>
>> Thanks for the feedback. I'll try to have a look at the driver if I have
>> time to do so.
> 
> Another thought would be to change the generic DMA allocation to not require
> alignment based on the rounded up size, but on the largest power-of-2 chunk
> fitting into the requested size.
> 
> I don't see why a 2.3 MB memory allocation would need to be 4 MB aligned. It
> should be perfectly fine to align it to 2 MB only.

Yet that wouldn't make a difference here, would it? We'd still need a 4M
chunk of contiguous space, just with less alignment.

Jan

