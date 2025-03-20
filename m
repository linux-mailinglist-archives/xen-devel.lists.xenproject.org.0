Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFC0A6A6DF
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 14:08:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922028.1325931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvFcp-0004Uf-QT; Thu, 20 Mar 2025 13:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922028.1325931; Thu, 20 Mar 2025 13:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvFcp-0004Rr-Nm; Thu, 20 Mar 2025 13:07:55 +0000
Received: by outflank-mailman (input) for mailman id 922028;
 Thu, 20 Mar 2025 13:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KE28=WH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1tvFco-0004Rl-Oa
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 13:07:54 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 555181cf-058c-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 14:07:53 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-547bcef2f96so1034173e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 06:07:53 -0700 (PDT)
Received: from [10.17.76.224] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba86507csm2217896e87.120.2025.03.20.06.07.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 06:07:51 -0700 (PDT)
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
X-Inumbo-ID: 555181cf-058c-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742476073; x=1743080873; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hFL38tYOMAGFkTuQyKobvF8QCwuTFhE4nWOXO7hJtdA=;
        b=C9t60HxXxiXgs8VDVAWFMFxtttYSKEuyxBRXWcxK9EUkYLLb+YHv7eiTfwz/F44GGz
         rZlQsCSJt9Zf9rmTSFHY1VfgaWO1ar3oCSTAKKMVL6K5FuhAuBd3se3kn0jV2DzurV3j
         lFo6O2GuiyoYlU+HKsO4c8TCOAJsYiO5GOhGuqVaquHv4gygupWpKb6I/dqYqZ9kaAag
         JLTU28wb/vQXr79o1ZWvQaFnt5C6wbUYxnRLTeipzphssSD6T2trz1xsWXiAbMDc4H6b
         /y032TyZJPmKYD7pJFvEiMmxBWfXUf5anE5WCSqmvwiChmj+DJS91Pogw4YO0dlZkDpc
         M6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742476073; x=1743080873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFL38tYOMAGFkTuQyKobvF8QCwuTFhE4nWOXO7hJtdA=;
        b=ECf1YLJC+5fTfShGVyu3p5oB7TgSYsky0Rpr6/bN8GbGezWVazAXV8VPYuVK5zVbyT
         +5V1+3iUwWUGYwR/2bqgHV5d3JyeoD4s1dFMmsI5zXoE3B6K0EDCqiUB1wn+/WicdswR
         nM0s9202DT8woeuKjSoFktGRB+P4/CE0kleJdmGjJ7qfZZAZb4O4DYWwSIMUSuDDNLJ8
         0StV+GL5APJKIbHK0uUac+1XhnEKWo3hkYK8OkF37GrX/BOKxS83T9x+GPghOaAle+A9
         NdacmtBYxiFyHoTNM4s9ItysX2q6mPnhDWsSqwASxzoeY8vaMoi/4MEdAdtuKdTxDlKV
         keIg==
X-Forwarded-Encrypted: i=1; AJvYcCXkqfbYHL928eMqe8fJ7J7UHboey5hansfo7UKjJcr0nHmykoecbuyPrhjoRphF+oR6YFjcTZMZxfg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyykViBZQwCVbVH8w76W74Yh27vUvu92D5Ho2GHkk+0kcFTozQC
	s1QaGBSytzZnjUr/nAbsQGxfdX5eYsSftEsyEhxKst9rG5D6yuTD
X-Gm-Gg: ASbGnctbluFzd/aqb9KJRTda0fuxeel4nF4shPIn/ULFkp98aHWZqENiriJmKElsF4n
	8rPSA2/swee8TMF1RDxCnv2Ur6CpoIW+5YqNG0b+As9Y0JppDFhi7EQeJ/+U7OPbNW3DSmL9O5S
	OVIcKCdk96gaXd9FoKOtkYLhQbxLE1xwFEBODpdlhYFq1lDYv2BY65PojiDvi3FppLSyIXCH9Q4
	XX2VGw7BPmqLC8myUSnhBraMsgrp/2SFXNPIosEEyKQIZOG6DVflgRmCOm6VuntjdDsGQHXTs40
	AacKwU8ckgtIEeIqz4IVlY/By5HYn60+E1vWPj8Tfe1KD8gN93vzcnER9cZ5XeHui2waW0BY/4s
	mhQ==
X-Google-Smtp-Source: AGHT+IFIY0Xgnmjd3Kjd2qniqdI1VGjW3QnfMzsMYTdaAS0xEh7IlJpOSWpoKWdOREbuOGq2F8HSNQ==
X-Received: by 2002:a05:6512:ea5:b0:549:8cbb:5443 with SMTP id 2adb3069b0e04-54acb224221mr2065143e87.47.1742476072115;
        Thu, 20 Mar 2025 06:07:52 -0700 (PDT)
Message-ID: <deafe2cc-df6c-42d3-9639-abd7b41ede69@gmail.com>
Date: Thu, 20 Mar 2025 15:07:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
To: Jan Beulich <jbeulich@suse.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
 <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
 <1793f158-ed83-46f9-be12-68c5ce86e4c4@suse.com>
 <495906c3-9937-4b54-ae3a-8e8ad2b9814f@epam.com>
 <a738e3d9-bfd3-46be-8f66-cbbe4353f93a@suse.com>
 <7b3a5232-c17e-49d8-8719-a42745144338@epam.com>
 <65f0072f-33c0-4436-8e34-3544d25c9568@suse.com>
 <19d8224a-04e0-45bb-9471-abeb684e9cad@epam.com>
 <7f523597-cf70-4673-b4a2-fac602253a9e@suse.com>
 <0f54652b-3af2-4d52-b3a1-76a5dbeddb14@gmail.com>
 <432b0b6e-2e89-4e95-8237-811e5e55517b@suse.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <432b0b6e-2e89-4e95-8237-811e5e55517b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20.03.25 09:30, Jan Beulich wrote:

Hello Jan, Mykyta, all


> On 19.03.2025 21:42, Oleksandr Tyshchenko wrote:
>> On 19.03.25 14:37, Jan Beulich wrote:
>>> On 19.03.2025 13:05, Mykyta Poturai wrote:
>>>> On 18.03.25 16:26, Jan Beulich wrote:
>>>>> On 18.03.2025 14:31, Mykyta Poturai wrote:
>>>>>> On 18.03.25 12:11, Jan Beulich wrote:
>>>>>>> On 18.03.2025 10:10, Mykyta Poturai wrote:
>>>>>>>> On 15.01.24 11:35, Jan Beulich wrote:
>>>>>>>>> On 14.01.2024 11:01, Mykyta Poturai wrote:
>>>>>>>>>> --- a/xen/include/public/hvm/dm_op.h
>>>>>>>>>> +++ b/xen/include/public/hvm/dm_op.h
>>>>>>>>>> @@ -444,6 +444,17 @@ struct xen_dm_op_nr_vcpus {
>>>>>>>>>>       };
>>>>>>>>>>       typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>>>>>>>>>>
>>>>>>>>>> +#define XEN_DMOP_inject_msi2 21
>>>>>>>>>> +#define XEN_DMOP_MSI_SOURCE_ID_VALID (1u << 0)
>>>>>>>>>> +
>>>>>>>>>> +struct xen_dm_op_inject_msi2 {
>>>>>>>>>> +    uint64_aligned_t addr;
>>>>>>>>>> +    uint32_t data;
>>>>>>>>>> +    uint32_t source_id; /* PCI SBDF */
>>>>>>>>>
>>>>>>>>> Since the comment says SBDF (not BDF), how are multiple segments handled
>>>>>>>>> here? At least on x86 (VT-d and V-i) source IDs are only 16 bits iirc,
>>>>>>>>> and are local to the respective segment. It would feel wrong to use a
>>>>>>>>> 32-bit quantity there; IOW I'd rather see this as being two 16-bit fields
>>>>>>>>> (segment and source_id).
>>>>>>>>
>>>>>>>> I'm planning on resuming this series in the near future and want to
>>>>>>>> clarify the DM op interface.
>>>>>>>>
>>>>>>>> Wouldn't it be better to keep things consistent and use
>>>>>>>> XEN_DMOP_PCI_SBDF as it's done in xen_dm_op_ioreq_server_range? Also
>>>>>>>> with this, the value can be easily casted to pci_sbdf_t later and split
>>>>>>>> to segment and BDF if needed.
>>>>>>>
>>>>>>> The essence of my earlier comment is: Naming, contents, and comments need
>>>>>>> to be in sync.
>>>>>>>
>>>>>>> I question though that "casting to pci_sbdf_t" is technically possible.
>>>>>>> Nor am I convinced that it would be desirable to do so if it was possible
>>>>>>> (or if "casting" was intended to mean something else than what this is in
>>>>>>> C). See my recent comments on some of Andrii's patches [1][2].
>>>>>>>
>>>>>>> Jan
>>>>>>>
>>>>>>> [1] https://lists.xen.org/archives/html/xen-devel/2025-03/msg01294.html
>>>>>>> [2] https://lists.xen.org/archives/html/xen-devel/2025-03/msg01301.html
>>>>>>
>>>>>> Would something like this be okay then?
>>>>>>
>>>>>> struct xen_dm_op_inject_msi2 {
>>>>>>         /* IN - MSI data (lower 32 bits) */
>>>>>>         uint32_t data;
>>>>>>         /* IN - ITS devid of the device triggering the interrupt */
>>>>>>         uint32_t source_id;
>>>>>>         uint32_t flags;
>>>>>>         uint32_t pad;
>>>>>>         /* IN - MSI address */
>>>>>>         uint64_aligned_t addr;
>>>>>> };
>>>>>>
>>>>>> Added padding and explained source_id purpose better.
>>>>>
>>>>> I fear the comment is far from making clear what layout source_id is to
>>>>> have, hence also leaving open whether a segment number is included there.
>>>>> Of course the issue here may be that I have no clue what "ITS devid"
>>>>> means or implies. What is clear is that "ITS devid" is meaningless on
>>>>> x86, for example.
>>>>
>>>> ITS devid is implementation defined. Its size is also implementation
>>>> defined but up to 32 bits.
>>>>
>>>> Quotes from Arm Base System Architecture[1]:
>>>>    > The system designer assigns a requester a unique StreamID to device
>>>> traffic input to the SMMU.
>>>>    > If a requester is a bridge from a different interconnect with an
>>>> originator ID, like a PCIe RequesterID, and devices on that interconnect
>>>> might need to send MSIs, the originator ID is used to generate a
>>>> DeviceID. The function to generate the DeviceID should be an identity or
>>>> a simple offset.
>>>>
>>>> On the Xen's side it is used as an offset into the ITS translation
>>>> tables and is sourced from msi-map nodes in the device tree.
>>>>
>>>> Practically for PCI the requester ID is usually the SBDF. Where the
>>>> segment is used to find the host bridge node that contains the msi-map
>>>> node with defined offsets but it is also included as part of an id.
>>>> That's why it was originally called SBDF in the comment. I don't know if
>>>> there is a better way to describe what it is concisely in the comments.
>>>
>>> If this is to be usable for other architectures too, it may need to be
>>> a union to put there. With appropriate comments for each member.
>>
>>
>> If I got correctly what is wrote in current thread (and in RFC version
>> where it was an attempt to create just Arm64's counterpart of
>> XEN_DMOP_inject_msi), my understanding (maybe not precise/correct, since
>> I am not quite familiar with x86 details) that we would need something
>> like that:
>>
>>
>> /*
>>    * XEN_DMOP_inject_msi2: An enhanced version of the sub-ob to inject an MSI
>>    *                       for an emulated device, which allows specifying
>>    *                       the ID of the device triggering the MSI
>> (source ID).
>>    *
>>    * The source ID is specified by a pair of <segment> and <source_id>.
>>    * If <flags> does not contain XEN_DMOP_MSI_SOURCE_ID_VALID then source ID
>>    * is invalid and should be ignored.
>>    */
>> #define XEN_DMOP_inject_msi 21
>>
>> struct xen_dm_op_inject_msi2 {
>>        /* IN - MSI data */
>>        uint32_t data;
>>        /* IN - next two fields form an ID of the device triggering the MSI */
>>        uint16_t segment; /* The segment number */
>>        uint16_t source_id; /* The source ID that is local to segment (PCI
>> BDF) */
>>        /* IN - types of source ID */
>>        uint32_t flags;
>> #define XEN_DMOP_MSI_SOURCE_ID_VALID (1u << 0)
>>        uint32_t pad;
>>        /* IN - MSI address */
>>        uint64_aligned_t addr;
>> };
>>
>>
>> This is arch agnostic sub-op without the (obvious) specifics of the
>> underlying MSI controller. The sub-ob, I hope, will be suitable on both
>> Arm64 soon (segment + source_id provide vSBDF, then it will possible to
>> locate vITS and devid) and on x86 in future (for the vIOMMU needs).
>>
>> Would you be ok with that in general? Please share you opinion.
> 
> Yes, this looks plausible.

Jan, thanks


  In the context of things like VMD (using
> software established segment numbers wider than 16 bits) I wonder
> though whether we wouldn't better make segment and source ID 32-bit
> fields from the beginning.

Keeping in mind that dm_op hypercall is stable and segment can be >= 
0x10000, probably yes, makes sense to use 32-bit from the very beginning.


  Out-of-range values would of course need
> rejecting then.

yes, sure

***

Mykyta, are you ok with the proposed adjustments to the sub-op structure?


> 
> Jan

