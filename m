Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D02585365
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 18:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377646.610923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHSoz-0002Sh-Es; Fri, 29 Jul 2022 16:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377646.610923; Fri, 29 Jul 2022 16:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHSoz-0002Pb-BT; Fri, 29 Jul 2022 16:26:41 +0000
Received: by outflank-mailman (input) for mailman id 377646;
 Fri, 29 Jul 2022 16:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QCuC=YC=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oHSox-0002MD-7h
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 16:26:39 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36b4108b-0f5b-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 18:26:36 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id m12so8062014lfj.4
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 09:26:36 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a2ea4ba000000b0025dc0e5a970sm713898ljm.23.2022.07.29.09.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 09:26:34 -0700 (PDT)
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
X-Inumbo-ID: 36b4108b-0f5b-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3g1AF9WXfiIY+8VM95YjO9u0MndshK3UeuyEIvoiYW4=;
        b=MIgXuMRlBfKMsNpnkKOVLYWnp+Q6cryOzWbvyPYhOpzhZujBJ0PmelHgYRbdd7a+1x
         5OUgdcXXRv96SI72yAFEO7TGw+GNJ40b3HEuUB9dwC+WX/MzseODAOvzIbsATzafpzpv
         swBZ6zmAGJjHz90IQuEVZ8PAqM31JZ8BQgwPPJkmpquUC1wi2O5Tv5dULBKpZNtpQVxO
         No6dCAB/ApuKi5KzpCZcv9vNFOKqDJyeP4ewb2UrSCMZIF3gvhqBAa6SYz6XVi9rZD3R
         Ne7RUjXYYDypAdNpOrWFoCqYv/OXGMNVR62sX/iKt/QT4jqfeinmh0a3ghbcZD7O7jaq
         RFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3g1AF9WXfiIY+8VM95YjO9u0MndshK3UeuyEIvoiYW4=;
        b=2KVRgsSx61xRmGRdAebwwc3wA1/a16E2dovtKVxiVDGXLY69BuNzymLdJr3noKWg9I
         LfMH9eOvFx2/hqQoODMA26ZYssCRVWr2iXg5d3sI+ycgSKShK+4FGWubzRIpFH0yUpJQ
         o2KvHuO+bNgrYP3nN4VynUSRdOS1Ud7tiC6+cv6qjmG2JlRRdY+cuBJxf39lLX4h/tXo
         i5KS2rrcdQBFl0yC4UM/gYQr9FubOPVGsnuIaHgHcGLF5zUkVPql7GKmzTbhe1CQS6Zx
         zzYmuzg51G039YgUXWfOi6ON+YPLNdC220UGkI3vfyzFVXm8zCkyKGXHSPB3Jbipb+Bq
         ieGw==
X-Gm-Message-State: ACgBeo1imf/aMMnEGHeiruB1oXXY6h8kFE0ljna4njyLPvuHPMAr+6oF
	HxoEMVDlSUMXp+mEEjCvb/0=
X-Google-Smtp-Source: AGRyM1trjz5ONt+W0mNCqwlKGSaIUsFp/EmRwDfRRFcbR6NZ9QXp0HAIuxAen7WdLrVmjtVw8ADLgA==
X-Received: by 2002:a19:7b1d:0:b0:48a:7137:38d5 with SMTP id w29-20020a197b1d000000b0048a713738d5mr1444034lfc.171.1659111995552;
        Fri, 29 Jul 2022 09:26:35 -0700 (PDT)
Message-ID: <195d8ba7-fe62-c1de-98a0-843360b69a43@gmail.com>
Date: Fri, 29 Jul 2022 19:26:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 10/11] xen/arm: translate virtual PCI bus topology for
 guests
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-11-olekstysh@gmail.com>
 <6e1a842f-e577-0f01-5046-f96c3c75db5b@suse.com>
 <b0f69f8b-d163-f984-e5ec-88a0a158eafc@gmail.com>
 <8e839472-f49d-a464-34aa-c7b26b9c50de@gmail.com>
 <cfc6488d-c06e-e943-fc8c-7b12d330f263@suse.com>
 <3752a158-85a1-e758-36eb-2feb0c5be954@gmail.com>
 <c1286f79-65be-a7fb-0661-2b682ab3d4a8@suse.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <c1286f79-65be-a7fb-0661-2b682ab3d4a8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 29.07.22 09:06, Jan Beulich wrote:

Hello Jan

> On 28.07.2022 18:35, Oleksandr wrote:
>> On 28.07.22 10:15, Jan Beulich wrote:
>>> On 27.07.2022 21:39, Oleksandr wrote:
>>>> On 27.07.22 20:54, Oleksandr wrote:
>>>>> On 26.07.22 18:16, Jan Beulich wrote:
>>>>>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>>>>>> --- a/xen/arch/arm/vpci.c
>>>>>>> +++ b/xen/arch/arm/vpci.c
>>>>>>> @@ -41,6 +41,16 @@ static int vpci_mmio_read(struct vcpu *v,
>>>>>>> mmio_info_t *info,
>>>>>>>         /* data is needed to prevent a pointer cast on 32bit */
>>>>>>>         unsigned long data;
>>>>>>>     +    /*
>>>>>>> +     * For the passed through devices we need to map their virtual
>>>>>>> SBDF
>>>>>>> +     * to the physical PCI device being passed through.
>>>>>>> +     */
>>>>>>> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
>>>>>>> +    {
>>>>>>> +        *r = ~0ul;
>>>>>>> +        return 1;
>>>>>>> +    }
>>>>>> I'm probably simply lacking specific Arm-side knowledge, but it strikes
>>>>>> me as odd that the need for translation would be dependent upon
>>>>>> "bridge".
>>>>> I am afraid I cannot answer immediately.
>>>>>
>>>>> I will analyze that question and provide an answer later on.
>>>> Well, most likely that "valid" bridge pointer here is just used as an
>>>> indicator of hwdom currently, so no need to perform virt->phys
>>>> translation for sbdf.
>>>>
>>>> You can see that domain_vpci_init() passes a valid value for hwdom and
>>>> NULL for other domains when setting up vpci_mmio* callbacks.
>>> Oh, I see.
>>>
>>>> Alternatively, I guess we could use "!is_hardware_domain(v->domain)"
>>>> instead of "!bridge" in the first part of that check. Shall I?
>>> Maybe simply add a comment? Surely checking "bridge" is cheaper than
>>> using is_hardware_domain(), so I can see the benefit. But the larger
>>> arm/vpci.c grows, the less obvious the connection will be without a
>>> comment.
>>
>> Agree the connection is worth a comment ...
>>
>>
>>
>>>    (Instead of a comment, an alternative may be a suitable
>>> assertion, which then documents the connection at the same time, e.g.
>>> ASSERT(!bridge == !is_hardware_domain(v->domain)). But that won't be
>>> possible in e.g. vpci_sbdf_from_gpa(), where apparently a similar
>>> assumption is being made.)
>>
>>      ... or indeed to put such ASSERT _before_ vpci_sbdf_from_gpa().
>>
>> This will cover assumption being made in both places.
>>
>>
>> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
>> index a9fc5817f9..1d4b1ef39e 100644
>> --- a/xen/arch/arm/vpci.c
>> +++ b/xen/arch/arm/vpci.c
>> @@ -37,10 +37,24 @@ static int vpci_mmio_read(struct vcpu *v,
>> mmio_info_t *info,
>>                              register_t *r, void *p)
>>    {
>>        struct pci_host_bridge *bridge = p;
>> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>> +    pci_sbdf_t sbdf;
>>        /* data is needed to prevent a pointer cast on 32bit */
>>        unsigned long data;
>>
>> +    ASSERT(!bridge == !is_hardware_domain(v->domain));
>> +
>> +    sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>> +
>> +    /*
>> +     * For the passed through devices we need to map their virtual SBDF
>> +     * to the physical PCI device being passed through.
>> +     */
>> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
>> +    {
>> +        *r = ~0ul;
>> +        return 1;
>> +    }
>> +
>>        if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>>                            1U << info->dabt.size, &data) )
>>        {
>> @@ -57,7 +71,18 @@ static int vpci_mmio_write(struct vcpu *v,
>> mmio_info_t *info,
>>                               register_t r, void *p)
>>    {
>>        struct pci_host_bridge *bridge = p;
>> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>> +    pci_sbdf_t sbdf;
>> +
>> +    ASSERT(!bridge == !is_hardware_domain(v->domain));
>> +
>> +    sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>> +
>> +    /*
>> +     * For the passed through devices we need to map their virtual SBDF
>> +     * to the physical PCI device being passed through.
>> +     */
>> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
>> +        return 1;
>>
>>        return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
>>                               1U << info->dabt.size, r);
>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>> index d4601ecf9b..fc2c51dc3e 100644
>>
>>
>> Any preference here?
>>
>>
>> Personally, I think that such ASSERT will better explain the connection
>> than the comment will do.
> Indeed I'd also prefer ASSERT()s being put there.

good


>   But my opinion is
> secondary here, as I'm not a maintainer of this code.


sure, let's see what the Arm maintainers will say


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


