Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBBD2282F8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 17:00:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxtkY-000793-Mz; Tue, 21 Jul 2020 15:00:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3aL=BA=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1jxtkX-00078s-9N
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 15:00:09 +0000
X-Inumbo-ID: ddcae048-cb62-11ea-854f-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ddcae048-cb62-11ea-854f-bc764e2007e4;
 Tue, 21 Jul 2020 15:00:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68AB6101E;
 Tue, 21 Jul 2020 08:00:07 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2823D3F718;
 Tue, 21 Jul 2020 08:00:06 -0700 (PDT)
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: Oleksandr <olekstysh@gmail.com>, Julien Grall <julien@xen.org>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <alpine.DEB.2.21.2007201326060.32544@sstabellini-ThinkPad-T480s>
 <4454c70e-47fa-46e8-90bf-1904b11318b1@gmail.com>
 <048c27bf-a9ab-054c-8955-6e75fb6c6ea5@xen.org>
 <2c249585-aaba-1065-95df-be772861e9a8@arm.com>
 <e44d6826-643f-77c6-a821-77dc0abf4cbc@gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <1811dd15-4009-f78c-674c-177709cf2a22@arm.com>
Date: Tue, 21 Jul 2020 15:58:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e44d6826-643f-77c6-a821-77dc0abf4cbc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 21/07/2020 15:52, Oleksandr wrote:
> 
> On 21.07.20 17:32, André Przywara wrote:
>> On 21/07/2020 14:43, Julien Grall wrote:
> 
> Hello Andre, Julien
> 
> 
>>> (+ Andre)
>>>
>>> Hi Oleksandr,
>>>
>>> On 21/07/2020 13:26, Oleksandr wrote:
>>>> On 20.07.20 23:38, Stefano Stabellini wrote:
>>>>> For instance, what's your take on notifications with virtio-mmio? How
>>>>> are they modelled today? Are they good enough or do we need MSIs?
>>>> Notifications are sent from device (backend) to the driver (frontend)
>>>> using interrupts. Additional DM function was introduced for that
>>>> purpose xendevicemodel_set_irq_level() which results in
>>>> vgic_inject_irq() call.
>>>>
>>>> Currently, if device wants to notify a driver it should trigger the
>>>> interrupt by calling that function twice (high level at first, then
>>>> low level).
>>> This doesn't look right to me. Assuming the interrupt is trigger when
>>> the line is high-level, the backend should only issue the hypercall once
>>> to set the level to high. Once the guest has finish to process all the
>>> notifications the backend would then call the hypercall to lower the
>>> interrupt line.
>>>
>>> This means the interrupts should keep firing as long as the interrupt
>>> line is high.
>>>
>>> It is quite possible that I took some shortcut when implementing the
>>> hypercall, so this should be corrected before anyone start to rely on
>>> it.
>> So I think the key question is: are virtio interrupts level or edge
>> triggered? Both QEMU and kvmtool advertise virtio-mmio interrupts as
>> edge-triggered.
>>  From skimming through the virtio spec I can't find any explicit
>> mentioning of the type of IRQ, but the usage of MSIs indeed hints at
>> using an edge property. Apparently reading the PCI ISR status register
>> clears it, which again sounds like edge. For virtio-mmio the driver
>> needs to explicitly clear the interrupt status register, which again
>> says: edge (as it's not the device clearing the status).
>>
>> So the device should just notify the driver once, which would cause one
>> vgic_inject_irq() call. It would be then up to the driver to clear up
>> that status, by reading PCI ISR status or writing to virtio-mmio's
>> interrupt-acknowledge register.
>>
>> Does that make sense?
> When implementing Xen backend, I didn't have an already working example
> so only guessed. I looked how kvmtool behaved when actually triggering
> the interrupt on Arm [1].
> 
> Taking into the account that Xen PoC on Arm advertises [2] the same irq
> type (TYPE_EDGE_RISING) as kvmtool [3] I decided to follow the model of
> triggering an interrupt. Could you please explain, is this wrong?

Yes, kvmtool does a double call needlessly (on x86, ppc and arm, mips is
correct).
I just chased it down in the kernel, a KVM_IRQ_LINE ioctl with level=low
is ignored when the target IRQ is configured as edge (which it is,
because the DT says so), check vgic_validate_injection() in the kernel.

So you should only ever need one call to set the line "high" (actually:
trigger the edge pulse).

Cheers,
Andre.

> 
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/tree/arm/gic.c#n418
> 
> 
> [2]
> https://github.com/xen-troops/xen/blob/ioreq_4.14_ml/tools/libxl/libxl_arm.c#L727
> 
> 
> [3]
> https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/tree/virtio/mmio.c#n270
> 
> 


