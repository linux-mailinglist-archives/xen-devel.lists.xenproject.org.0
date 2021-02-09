Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AD231583F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 22:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83430.155267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9aBP-0001QW-HZ; Tue, 09 Feb 2021 21:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83430.155267; Tue, 09 Feb 2021 21:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9aBP-0001Q7-E0; Tue, 09 Feb 2021 21:04:27 +0000
Received: by outflank-mailman (input) for mailman id 83430;
 Tue, 09 Feb 2021 21:04:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6s4x=HL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l9aBO-0001Q2-Au
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 21:04:26 +0000
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91943110-4ddf-4638-bfdf-626979fdfc35;
 Tue, 09 Feb 2021 21:04:25 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id f19so24268158ljn.5
 for <xen-devel@lists.xenproject.org>; Tue, 09 Feb 2021 13:04:25 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n16sm1377521lfe.13.2021.02.09.13.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 13:04:23 -0800 (PST)
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
X-Inumbo-ID: 91943110-4ddf-4638-bfdf-626979fdfc35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QNfZ7ERkEtbflrh2FEFxojUnUn1/h5mtDJeWPD/s4vk=;
        b=uRuiqgMYzEuPo+sv1PXWynMzZ1c/V6ZsIJ63cWjUiBlfVzACzmuj/2f9NJKzIvftGa
         voGrPwBi0a36ZURvseLYcKHxRzPmv3mWfXwzbQlGmfl2AGZr/fpiCIdLYF9C3OFq6q/i
         +5vxb5e51BLXkBDncjYdFRlUJzaoRVfz4OdFPDK2E0XZRJsdclj5Nc70EcFyafRLuWpB
         td6BaF3kDjHF8XG7PhgF+fcOHwz0aZEfaZ66uLgTL7VtpKpY/cYk+u1z2i5rNdPiatkb
         Fwv6S+I2lnZBCq3Vcbgfr3PYt8g6MGaDPB8WkknLEseuwHGlGIDfElRaFtIaUFV42zEJ
         Hjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QNfZ7ERkEtbflrh2FEFxojUnUn1/h5mtDJeWPD/s4vk=;
        b=Lkpz78vfpUauMzbmhH+hruJjOfA4z3Q/dnrCJi/FpeMP0B5XlBIggbI24vTnDuug5m
         +9101A8nekQUjbG8Ui871LPvzKImkrtjTJNpt0d5NC6S3riL80esfpsDxxvrAELdGQhJ
         OLoTy29ZvrQwzzDLovBVEGhOkgFAaNYVk5k54/uYdaMRnzD8SY0jyPSvw+gc7tBggwAA
         IOW/LOnZFY2ZGajU2yrIh4bRpJ0ML6Qu750NUHBXq+NlxMiuQWVZvXtR+VJ02XofK3de
         J33vOe3eZQYx9mM8bHygnTOl4nIfeOwCGT/JU5wg6HnZ7F0W6NyKO74a6kEAVuoIHFO6
         FqNg==
X-Gm-Message-State: AOAM532tSdUo+eBol8C/PHi58X0TKWCXJuRNk9508Nm9xTIbsfyepW6z
	NRITKaAu7nkAnjyh6SnIY3c=
X-Google-Smtp-Source: ABdhPJzTW1JpTYIYTggwJCty+7QItjLgOsTwoXvE0DnB37AghFoJ1KFLHmJkR3h6UrhQFxQp5jCHqg==
X-Received: by 2002:a2e:8541:: with SMTP id u1mr752874ljj.338.1612904664185;
        Tue, 09 Feb 2021 13:04:24 -0800 (PST)
Subject: Re: [PATCH V4 23/24] libxl: Introduce basic virtio-mmio support on
 Arm
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-24-git-send-email-olekstysh@gmail.com>
 <25b62097-9ea9-31f3-0f8f-92a7f0d01d7c@xen.org>
 <51d44085-f178-3985-9324-da6494cd9d2e@gmail.com>
 <58c9da23-ef6a-1d33-b2ec-30e3425da2f3@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d1e4d2bc-af88-d91a-ec43-d5055b37bc96@gmail.com>
Date: Tue, 9 Feb 2021 23:04:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <58c9da23-ef6a-1d33-b2ec-30e3425da2f3@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 20.01.21 18:40, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien


Sorry for the late response.


>
> On 17/01/2021 22:22, Oleksandr wrote:
>> On 15.01.21 23:30, Julien Grall wrote:
>>> On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
>>>> From: Julien Grall <julien.grall@arm.com>
>>> So I am not quite too sure how this new parameter can be used. Could 
>>> you expand it?
>> The original idea was to set it if we are going to assign virtio 
>> device(s) to the guest.
>> Being honest, I have a plan to remove this extra parameter. It might 
>> not be obvious looking at the current patch, but next patch will show 
>> that we can avoid introducing it at all.
>
> Right, so I think we want to avoid introducing the parameter. I have 
> suggested in patch #24 a different way to split code introduced by #23 
> and #24.

Got it. Will take it into the account for the next version.


>
>
> [...]
>
>>>
>>>> +#define GUEST_VIRTIO_MMIO_SIZE xen_mk_ullong(0x200)
>>>
>>> AFAICT, the size of the virtio mmio region should be 0x100. So why 
>>> is it 0x200?
>>
>>
>> I didn't find the total size requirement for the mmio region in 
>> virtio specification v1.1 (the size of control registers is indeed 
>> 0x100 and device-specific configuration registers starts at the 
>> offset 0x100, however it's size depends on the device and the driver).
>>
>> kvmtool uses 0x200 [1], in some Linux device-trees we can see 0x200 
>> [2] (however, device-tree bindings example has 0x100 [3]), so what 
>> would be the proper value for Xen code?
>
> Hmm... I missed that fact. I would say we want to use the biggest size 
> possible so we can cover most of the devices.
>
> Although, as you pointed out, this may not cover all the devices. So 
> maybe we want to allow the user to configure the size via xl.cfg for 
> the one not conforming with 0x200.
>
> This could be implemented in the future. Stefano/Ian, what do you think?

I see that Stefano has already agreed on that, so let's leave 0x200 for now.


>
>
>>> Most likely, you will want to reserve a range
>>
>> it seems yes, good point. BTW, the range is needed for the mmio 
>> region as well, correct?
>
> I would reserve 1MB (just for the sake of avoid region size in KB).
>
> For the SPIs, I would consider to reserve 10-20 interrupts. Do you 
> think this will cover your use cases?

Yes, I think it would be enough for now.


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


