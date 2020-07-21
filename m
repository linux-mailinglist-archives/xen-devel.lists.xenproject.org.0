Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE112284FD
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 18:10:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxupq-0004ua-Bh; Tue, 21 Jul 2020 16:09:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FhFK=BA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1jxupn-0004uV-VS
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 16:09:40 +0000
X-Inumbo-ID: 936607ef-cb6c-11ea-856b-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 936607ef-cb6c-11ea-856b-bc764e2007e4;
 Tue, 21 Jul 2020 16:09:38 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r19so24598501ljn.12
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 09:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=lWQom+B3YtchGFEgygjEdlRRiIvq78MqoOwISWJ7CTc=;
 b=Fdyxv1+usZFnher7O4ZpbX7ZMj+sVeKhNalikZdeK9IpRZylW0vlzKJm8664Ky9woq
 wuLDKJ2wLD6E9I1leXUfv8mjzViYE2oahWuOi1AmxLPNk2c8uWaAfXOct81sM98ijigX
 w0BquUi3Bl2Q6DaxiakuoT+453xT4F7Zo0bZ4PGuWOZ1mcI+zQdyyPxtfY94LBP7OvPL
 kgGCq6N4tqx1vsN74iF20fqvD6oMch/1lpBd5dBPAXhsAVLBEY07imU8WVZKCoegtmpY
 bF8Sd0uk2f7WW4IdKI3uGeIj1gfhJdhNUvkL0p9zWBReIwU/rd0nkp5LY8OzZGuzoaSX
 zDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lWQom+B3YtchGFEgygjEdlRRiIvq78MqoOwISWJ7CTc=;
 b=UNI9lIiRo9X4UENu8D1+C8ne/XMwpH8Y8Rh6jRwQ82p3C8Dx5L4HWLyfujHZ63Iw9h
 2ivKpX4fpqDNdduK0xvC4DZ+GwK1AOaj4bN+KE0f6c0APPhS7S/u9O4LCVm4lcgvoZjd
 u/BWXTPpW1aurO4fqWvU2rAYnMEk8BpMKjxj09jioShuyeHjkOEFk+G5XL7BwkEvLQJB
 bN/8+YM3t+v/B6yniNGv3x1jYPgLjHWEQ7FmXVJp/3zfJzptpy0+Vyx3759yadfJhKp0
 Rm7bxuLgE+sISqWjaKUU3n6r2hhhdTkxoXVEsnHLtz33S3jPpPvn63bgRfiF2w7n70FB
 MwzQ==
X-Gm-Message-State: AOAM530KkWavB/pK1JMjmJppCdF27YPLcQTdZAVlhqJc/BwTt7El/guH
 jA8HmoMeA0yFZUNrQ7yivhU=
X-Google-Smtp-Source: ABdhPJzFbjSZXGlgCPNabTWcMPAgK37S3srZJxHj5+jkWwnpAb23e33U4K0OXf3Sg3URv46BEzah1A==
X-Received: by 2002:a2e:b5b7:: with SMTP id f23mr11764896ljn.380.1595347777269; 
 Tue, 21 Jul 2020 09:09:37 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l14sm5450304lfj.13.2020.07.21.09.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 09:09:36 -0700 (PDT)
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>,
 Julien Grall <julien@xen.org>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <alpine.DEB.2.21.2007201326060.32544@sstabellini-ThinkPad-T480s>
 <4454c70e-47fa-46e8-90bf-1904b11318b1@gmail.com>
 <048c27bf-a9ab-054c-8955-6e75fb6c6ea5@xen.org>
 <2c249585-aaba-1065-95df-be772861e9a8@arm.com>
 <e44d6826-643f-77c6-a821-77dc0abf4cbc@gmail.com>
 <1811dd15-4009-f78c-674c-177709cf2a22@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e7bbc9d6-648e-4d2a-e981-15743a628b1f@gmail.com>
Date: Tue, 21 Jul 2020 19:09:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1811dd15-4009-f78c-674c-177709cf2a22@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 alex.bennee@linaro.org, Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 21.07.20 17:58, André Przywara wrote:
> On 21/07/2020 15:52, Oleksandr wrote:
>> On 21.07.20 17:32, André Przywara wrote:
>>> On 21/07/2020 14:43, Julien Grall wrote:
>> Hello Andre, Julien
>>
>>
>>>> (+ Andre)
>>>>
>>>> Hi Oleksandr,
>>>>
>>>> On 21/07/2020 13:26, Oleksandr wrote:
>>>>> On 20.07.20 23:38, Stefano Stabellini wrote:
>>>>>> For instance, what's your take on notifications with virtio-mmio? How
>>>>>> are they modelled today? Are they good enough or do we need MSIs?
>>>>> Notifications are sent from device (backend) to the driver (frontend)
>>>>> using interrupts. Additional DM function was introduced for that
>>>>> purpose xendevicemodel_set_irq_level() which results in
>>>>> vgic_inject_irq() call.
>>>>>
>>>>> Currently, if device wants to notify a driver it should trigger the
>>>>> interrupt by calling that function twice (high level at first, then
>>>>> low level).
>>>> This doesn't look right to me. Assuming the interrupt is trigger when
>>>> the line is high-level, the backend should only issue the hypercall once
>>>> to set the level to high. Once the guest has finish to process all the
>>>> notifications the backend would then call the hypercall to lower the
>>>> interrupt line.
>>>>
>>>> This means the interrupts should keep firing as long as the interrupt
>>>> line is high.
>>>>
>>>> It is quite possible that I took some shortcut when implementing the
>>>> hypercall, so this should be corrected before anyone start to rely on
>>>> it.
>>> So I think the key question is: are virtio interrupts level or edge
>>> triggered? Both QEMU and kvmtool advertise virtio-mmio interrupts as
>>> edge-triggered.
>>>   From skimming through the virtio spec I can't find any explicit
>>> mentioning of the type of IRQ, but the usage of MSIs indeed hints at
>>> using an edge property. Apparently reading the PCI ISR status register
>>> clears it, which again sounds like edge. For virtio-mmio the driver
>>> needs to explicitly clear the interrupt status register, which again
>>> says: edge (as it's not the device clearing the status).
>>>
>>> So the device should just notify the driver once, which would cause one
>>> vgic_inject_irq() call. It would be then up to the driver to clear up
>>> that status, by reading PCI ISR status or writing to virtio-mmio's
>>> interrupt-acknowledge register.
>>>
>>> Does that make sense?
>> When implementing Xen backend, I didn't have an already working example
>> so only guessed. I looked how kvmtool behaved when actually triggering
>> the interrupt on Arm [1].
>>
>> Taking into the account that Xen PoC on Arm advertises [2] the same irq
>> type (TYPE_EDGE_RISING) as kvmtool [3] I decided to follow the model of
>> triggering an interrupt. Could you please explain, is this wrong?
> Yes, kvmtool does a double call needlessly (on x86, ppc and arm, mips is
> correct).
> I just chased it down in the kernel, a KVM_IRQ_LINE ioctl with level=low
> is ignored when the target IRQ is configured as edge (which it is,
> because the DT says so), check vgic_validate_injection() in the kernel.
>
> So you should only ever need one call to set the line "high" (actually:
> trigger the edge pulse).

Got it, thanks for the explanation. Have just removed an extra action 
(setting low level) and checked.


-- 
Regards,

Oleksandr Tyshchenko


