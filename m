Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF3E8D2DD7
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731478.1136980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDRo-0008Rs-C9; Wed, 29 May 2024 07:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731478.1136980; Wed, 29 May 2024 07:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDRo-0008Px-8K; Wed, 29 May 2024 07:10:08 +0000
Received: by outflank-mailman (input) for mailman id 731478;
 Wed, 29 May 2024 07:10:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCDRn-0008Kk-59
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:10:07 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77879a61-1d8a-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 09:10:03 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a653972487fso11436466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:10:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a63559d155csm103602966b.11.2024.05.29.00.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 00:10:02 -0700 (PDT)
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
X-Inumbo-ID: 77879a61-1d8a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716966603; x=1717571403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CQaycxxtR0oc9cSmzquAVtKXqxUU6P8ER3m5NLBKLqI=;
        b=JCdt1X3p4ZTWsrQ/4P1kAzhihcv1YwMi9st3EQYc6/HJNsugEi33cd6D7LvMbDtDhf
         nXRjkavIWa9oCGgxWr+1ABbTZs9sk/Tnjucl3Jcwuso9jV0e48FcypC+EnYn5V98NCJo
         Si7xEeyi69hA6L5vOCL/qIPOwpSaBB8dmKIuv/3B6b7syQAb85oA4oop9p0R2aB54tbp
         t88GQ7Ahf1yoOsW0OyqwXzUUhPqDU56o6jFFy2OOblrdKbj+GFEk/WvBpCU0n1xulrEK
         k+MWsOQrzW51Jjx6VdLiIq9qQK9nYPRUclIqxDTH5JsrUTiLQAKrucMjs07G5ErZrkCT
         t8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716966603; x=1717571403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQaycxxtR0oc9cSmzquAVtKXqxUU6P8ER3m5NLBKLqI=;
        b=YFrxnruv7uG5oX4UsQo/QXdKWJMHV2tXR+YPz8pWGLfsxYeFPFpCbCCUdD/ibq8x7u
         O94MPqv0iVXgOAuSvupjnamhvNLS7fy8JoZAUVczv+JjSk+SIE3COidu3WqKB/hfESco
         i58HmoNZ/xJ8xGRvrW9Q2QtffhPld7SVMa6yO8QoQ56Yebh78/cm/UVCljJfWyB9nkh4
         VyVP1IaYn37OZuti9C3iwyvHvF32L4/1B/J5QCJtcoKKJq08aj/Zif1Y5G0Rz/hZ4MMj
         6Fb1sNCTZuEj+kmmYTJz1coatVwsupYO+JPLgP9M4gGHJajWBR0iDb+nTvwK3pTfPY4g
         Xadg==
X-Forwarded-Encrypted: i=1; AJvYcCUFRPZ3z+1nz9OmjilceHtubX48jAPxFAMlmgftCBrp+XYrcbZLQVBZTB7RtqOxtJeFrVmPMR3tTpAElX1AYPGrGeGxwbetQbOpLmD9p+U=
X-Gm-Message-State: AOJu0YzFPXKoUa/30xtP4PGj8sIRcVnzjF9vicmDqeSkQ1w0d58hJCsn
	OQs2+PPPJljU3wgligj7twP5IXfxddijm9ruKT2dAK5gBYPXkfe+ViG/9ndjQA==
X-Google-Smtp-Source: AGHT+IFjyfM2m9iGVPw4RpPjemlzR0fgkzoilKpt2Qpic4+3MgSCUJZJMvdFAmzuY4q0BpFvPRG4WA==
X-Received: by 2002:a17:907:72c4:b0:a62:c215:9c20 with SMTP id a640c23a62f3a-a62c2159dc6mr700542066b.77.1716966602960;
        Wed, 29 May 2024 00:10:02 -0700 (PDT)
Message-ID: <7cdff236-bb7d-4dad-9a83-47faaa6dc15f@suse.com>
Date: Wed, 29 May 2024 09:10:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-6-Jiqian.Chen@amd.com>
 <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
 <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b10e68e2-3279-471d-a089-c40934050737@suse.com>
 <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
 <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.05.2024 08:56, Chen, Jiqian wrote:
> On 2024/5/29 14:31, Jan Beulich wrote:
>> On 29.05.2024 04:41, Chen, Jiqian wrote:
>>> Hi,
>>> On 2024/5/17 19:50, Jan Beulich wrote:
>>>> On 17.05.2024 13:14, Chen, Jiqian wrote:
>>>>> On 2024/5/17 18:51, Jan Beulich wrote:
>>>>>> On 17.05.2024 12:45, Chen, Jiqian wrote:
>>>>>>> On 2024/5/16 22:01, Jan Beulich wrote:
>>>>>>>> On 16.05.2024 11:52, Jiqian Chen wrote:
>>>>>>>>> +        if ( gsi >= nr_irqs_gsi )
>>>>>>>>> +        {
>>>>>>>>> +            ret = -EINVAL;
>>>>>>>>> +            break;
>>>>>>>>> +        }
>>>>>>>>> +
>>>>>>>>> +        if ( !irq_access_permitted(current->domain, gsi) ||
>>>>>>>>
>>>>>>>> I.e. assuming IRQ == GSI? Is that a valid assumption when any number of
>>>>>>>> source overrides may be surfaced by ACPI?
>>>>>>> All irqs smaller than nr_irqs_gsi are gsi, aren't they?
>>>>>>
>>>>>> They are, but there's not necessarily a 1:1 mapping.
>>>>> Oh, so do I need to add a new gsi_caps to store granted gsi?
>>>>
>>>> Probably not. You ought to be able to translate between GSI and IRQ,
>>>> and then continue to record in / check against IRQ permissions.
>>> But I found in function init_irq_data:
>>>     for ( irq = 0; irq < nr_irqs_gsi; irq++ )
>>>     {
>>>         int rc;
>>>
>>>         desc = irq_to_desc(irq);
>>>         desc->irq = irq;
>>>
>>>         rc = init_one_irq_desc(desc);
>>>         if ( rc )
>>>             return rc;
>>>     }
>>> Does it mean that when irq < nr_irqs_gsi, the gsi and irq is a 1:1 mapping?
>>
>> No, as explained before. I also don't see how you would derive that from the code above.
> Because here set desc->irq = irq, and it seems there is no other place to change this desc->irq, so, gsi 1 is considered to irq 1.

What are you taking this from? The loop bound isn't nr_gsis, and the iteration
variable isn't in GSI space either; it's in IRQ numbering space. In this loop
we're merely leveraging that every GSI has a corresponding IRQ; there are no
assumptions made about the mapping between the two. Afaics at least.

>> "nr_irqs_gsi" describes what its name says: The number of
>> IRQs mapping to a (_some_) GSI. That's to tell them from the non-GSI (i.e.
>> mainly MSI) ones. There's no implication whatsoever on the IRQ <-> GSI
>> mapping.
>>
>>> What's more, when using PHYSDEVOP_setup_gsi, it calls mp_register_gsi,
>>> and in mp_register_gsi, it uses " desc = irq_to_desc(gsi); " to get irq_desc directly.
>>
>> Which may be wrong, while that wrong-ness may not have hit anyone in
>> practice (for reasons that would need working out).
>>
>>> Combining above, can we consider "gsi == irq" when irq < nr_irqs_gsi ?
>>
>> Again - no.
> Since you are certain that they are not equal, could you tell me where show they are not equal or where build their mappings,
> so that I can know how to do a conversion gsi from irq.

I did point you at the ACPI Interrupt Source Override structure before.
We're parsing those in acpi_parse_int_src_ovr(), to give you a place to
start going from.

Jan

