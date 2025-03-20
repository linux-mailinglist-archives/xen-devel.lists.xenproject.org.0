Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F95A6A06C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 08:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921329.1325188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAMD-0008Hc-6T; Thu, 20 Mar 2025 07:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921329.1325188; Thu, 20 Mar 2025 07:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAMD-0008F7-3U; Thu, 20 Mar 2025 07:30:25 +0000
Received: by outflank-mailman (input) for mailman id 921329;
 Thu, 20 Mar 2025 07:30:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvAMB-0008Ez-SV
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 07:30:23 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ef9a124-055d-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 08:30:22 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso3493785e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 00:30:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f55c3dsm40214805e9.23.2025.03.20.00.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 00:30:21 -0700 (PDT)
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
X-Inumbo-ID: 2ef9a124-055d-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742455822; x=1743060622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vQq5jnK2lO+zCCXUIDq/i/Jlukd84YXojhttu/lx0QQ=;
        b=dgtn95Gbh1r+Oupyd4d5haUY0aWEa9zv82rnTUsYTQEm+PSjC9L6seDUpqUFc2c0Tl
         MzbgZ1qXQQ+6yOSHJThAd7Ad5qw1lEXX+83PNmq3GotRHdkmIZl86+y6vQxGyU9pqg4j
         kVyOLXxvP6rA5Tr04dbpMoOzcTt8CffKtS+CyFrLrUUAho06S2iwJot0X/1aVFkRAT0F
         vKs2RpcFhT45KyZynVYYwwOsjwpjlNvqx0CTzCRElG9CE01VTduj0XbBNqeHqaQJOjvi
         gEVVmS+j0d2SW8O9m2j6pPAsPv65hEqumHN0zEuFA6pg/4FLcIGuH3jFVFAt09r4IxE0
         R6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742455822; x=1743060622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQq5jnK2lO+zCCXUIDq/i/Jlukd84YXojhttu/lx0QQ=;
        b=jhxml3SamOjhUFoR6cm8B25tqKQqhmIkpWMNj4BbLLyI4V62lUELe3CiJyhvmR5DeH
         /epf2cRbs/ShFjQekFn2P2K/q40h68JEiFMRF3N+7lIrMDplNifqQA5SFpAK3FryzxJM
         MtxOlfLwJg4/FVKoBXU6LfabwAWX2/8wvTNGKxG31NFqnFdA0fQsHjNJ7Sl7BjhSt3N4
         HQ/gDufen4IWd9YCFpojUNuIwnPYvzqnFImQAFW2ZCYB/BFLc6G4nLxWhCvcTpVLU/mi
         noUUKwp5K5TcaqxWSbVgLBAzTvutQQ+hnWwIpXPgXyfjrEBobyOQU8ZyOx85H9C7Tlmf
         k85g==
X-Forwarded-Encrypted: i=1; AJvYcCWlatDu7ZMHiPRimxTtxBskUA3Qkf9mcKCLFxoFjWDNuB3pg+rddtZ+OPGadoL5CydCnnOKc6lYOws=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrrO9SC0GowAFTt9tnbG6D/uIfDXPusoNWsUQ0Lh44+ShRxzBh
	ezC7Q49/8X+ASeZegKjBbeyBlFFe2RzQ98mhaKUyLWVdA2v5+Ar/4GMgVg4UhA==
X-Gm-Gg: ASbGnctPtrJ9OD2grgon484/zBTVhfcziB/GnZg83yGGdqXaBgER8+DdQ78Ln1cShv3
	2v8grww4SfuFIi/lGQ4TVOBcboHLvxioDDSzgDlKyTH1WdB8ML+dfLh5LeLua3ve7oyjNAbDg+K
	5F993WtXQkYs8+5V1NUFvTRIlzI+Ir30RjrLIFZL2UGriiATvHiw28v03Uq688V5eEcO7FTVJ1m
	u66L0EfERrvBBDVp92OAD3pyzmxcj5czXZI1I2/2UF63Jda/i8lbzE0xz4JKG1BV2gSOaNCXEFe
	urTSC4xrg562lg9ELb3g6HQ5tMkCwWprIcsi85c7DjA3B2l+DUXb4Z9bfPnfJsD8SjewBgyFjsc
	KyhRLLGfadBfFpsYs+eh7x9gLJg1oBKbpaOXDsyFD
X-Google-Smtp-Source: AGHT+IGeCLnrOHWtl+xE1U1+BB5dxMxg6qcAbbxr/FswGTGECvPMwif5AaftU8xQVkkh8jEvHjemrA==
X-Received: by 2002:a05:600c:3b92:b0:439:9a40:aa0b with SMTP id 5b1f17b1804b1-43d43882ebcmr45407045e9.25.1742455821908;
        Thu, 20 Mar 2025 00:30:21 -0700 (PDT)
Message-ID: <432b0b6e-2e89-4e95-8237-811e5e55517b@suse.com>
Date: Thu, 20 Mar 2025 08:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
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
In-Reply-To: <0f54652b-3af2-4d52-b3a1-76a5dbeddb14@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 21:42, Oleksandr Tyshchenko wrote:
> On 19.03.25 14:37, Jan Beulich wrote:
>> On 19.03.2025 13:05, Mykyta Poturai wrote:
>>> On 18.03.25 16:26, Jan Beulich wrote:
>>>> On 18.03.2025 14:31, Mykyta Poturai wrote:
>>>>> On 18.03.25 12:11, Jan Beulich wrote:
>>>>>> On 18.03.2025 10:10, Mykyta Poturai wrote:
>>>>>>> On 15.01.24 11:35, Jan Beulich wrote:
>>>>>>>> On 14.01.2024 11:01, Mykyta Poturai wrote:
>>>>>>>>> --- a/xen/include/public/hvm/dm_op.h
>>>>>>>>> +++ b/xen/include/public/hvm/dm_op.h
>>>>>>>>> @@ -444,6 +444,17 @@ struct xen_dm_op_nr_vcpus {
>>>>>>>>>      };
>>>>>>>>>      typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>>>>>>>>>
>>>>>>>>> +#define XEN_DMOP_inject_msi2 21
>>>>>>>>> +#define XEN_DMOP_MSI_SOURCE_ID_VALID (1u << 0)
>>>>>>>>> +
>>>>>>>>> +struct xen_dm_op_inject_msi2 {
>>>>>>>>> +    uint64_aligned_t addr;
>>>>>>>>> +    uint32_t data;
>>>>>>>>> +    uint32_t source_id; /* PCI SBDF */
>>>>>>>>
>>>>>>>> Since the comment says SBDF (not BDF), how are multiple segments handled
>>>>>>>> here? At least on x86 (VT-d and V-i) source IDs are only 16 bits iirc,
>>>>>>>> and are local to the respective segment. It would feel wrong to use a
>>>>>>>> 32-bit quantity there; IOW I'd rather see this as being two 16-bit fields
>>>>>>>> (segment and source_id).
>>>>>>>
>>>>>>> I'm planning on resuming this series in the near future and want to
>>>>>>> clarify the DM op interface.
>>>>>>>
>>>>>>> Wouldn't it be better to keep things consistent and use
>>>>>>> XEN_DMOP_PCI_SBDF as it's done in xen_dm_op_ioreq_server_range? Also
>>>>>>> with this, the value can be easily casted to pci_sbdf_t later and split
>>>>>>> to segment and BDF if needed.
>>>>>>
>>>>>> The essence of my earlier comment is: Naming, contents, and comments need
>>>>>> to be in sync.
>>>>>>
>>>>>> I question though that "casting to pci_sbdf_t" is technically possible.
>>>>>> Nor am I convinced that it would be desirable to do so if it was possible
>>>>>> (or if "casting" was intended to mean something else than what this is in
>>>>>> C). See my recent comments on some of Andrii's patches [1][2].
>>>>>>
>>>>>> Jan
>>>>>>
>>>>>> [1] https://lists.xen.org/archives/html/xen-devel/2025-03/msg01294.html
>>>>>> [2] https://lists.xen.org/archives/html/xen-devel/2025-03/msg01301.html
>>>>>
>>>>> Would something like this be okay then?
>>>>>
>>>>> struct xen_dm_op_inject_msi2 {
>>>>>        /* IN - MSI data (lower 32 bits) */
>>>>>        uint32_t data;
>>>>>        /* IN - ITS devid of the device triggering the interrupt */
>>>>>        uint32_t source_id;
>>>>>        uint32_t flags;
>>>>>        uint32_t pad;
>>>>>        /* IN - MSI address */
>>>>>        uint64_aligned_t addr;
>>>>> };
>>>>>
>>>>> Added padding and explained source_id purpose better.
>>>>
>>>> I fear the comment is far from making clear what layout source_id is to
>>>> have, hence also leaving open whether a segment number is included there.
>>>> Of course the issue here may be that I have no clue what "ITS devid"
>>>> means or implies. What is clear is that "ITS devid" is meaningless on
>>>> x86, for example.
>>>
>>> ITS devid is implementation defined. Its size is also implementation
>>> defined but up to 32 bits.
>>>
>>> Quotes from Arm Base System Architecture[1]:
>>>   > The system designer assigns a requester a unique StreamID to device
>>> traffic input to the SMMU.
>>>   > If a requester is a bridge from a different interconnect with an
>>> originator ID, like a PCIe RequesterID, and devices on that interconnect
>>> might need to send MSIs, the originator ID is used to generate a
>>> DeviceID. The function to generate the DeviceID should be an identity or
>>> a simple offset.
>>>
>>> On the Xen's side it is used as an offset into the ITS translation
>>> tables and is sourced from msi-map nodes in the device tree.
>>>
>>> Practically for PCI the requester ID is usually the SBDF. Where the
>>> segment is used to find the host bridge node that contains the msi-map
>>> node with defined offsets but it is also included as part of an id.
>>> That's why it was originally called SBDF in the comment. I don't know if
>>> there is a better way to describe what it is concisely in the comments.
>>
>> If this is to be usable for other architectures too, it may need to be
>> a union to put there. With appropriate comments for each member.
> 
> 
> If I got correctly what is wrote in current thread (and in RFC version 
> where it was an attempt to create just Arm64's counterpart of 
> XEN_DMOP_inject_msi), my understanding (maybe not precise/correct, since 
> I am not quite familiar with x86 details) that we would need something 
> like that:
> 
> 
> /*
>   * XEN_DMOP_inject_msi2: An enhanced version of the sub-ob to inject an MSI
>   *                       for an emulated device, which allows specifying
>   *                       the ID of the device triggering the MSI 
> (source ID).
>   *
>   * The source ID is specified by a pair of <segment> and <source_id>.
>   * If <flags> does not contain XEN_DMOP_MSI_SOURCE_ID_VALID then source ID
>   * is invalid and should be ignored.
>   */
> #define XEN_DMOP_inject_msi 21
> 
> struct xen_dm_op_inject_msi2 {
>       /* IN - MSI data */
>       uint32_t data;
>       /* IN - next two fields form an ID of the device triggering the MSI */
>       uint16_t segment; /* The segment number */
>       uint16_t source_id; /* The source ID that is local to segment (PCI 
> BDF) */
>       /* IN - types of source ID */
>       uint32_t flags;
> #define XEN_DMOP_MSI_SOURCE_ID_VALID (1u << 0)
>       uint32_t pad;
>       /* IN - MSI address */
>       uint64_aligned_t addr;
> };
> 
> 
> This is arch agnostic sub-op without the (obvious) specifics of the 
> underlying MSI controller. The sub-ob, I hope, will be suitable on both 
> Arm64 soon (segment + source_id provide vSBDF, then it will possible to 
> locate vITS and devid) and on x86 in future (for the vIOMMU needs).
> 
> Would you be ok with that in general? Please share you opinion.

Yes, this looks plausible. In the context of things like VMD (using
software established segment numbers wider than 16 bits) I wonder
though whether we wouldn't better make segment and source ID 32-bit
fields from the beginning. Out-of-range values would of course need
rejecting then.

Jan

