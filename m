Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAB52282C9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 16:52:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxtcn-00068u-CX; Tue, 21 Jul 2020 14:52:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FhFK=BA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1jxtcm-00068p-PW
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 14:52:08 +0000
X-Inumbo-ID: bf59c0e4-cb61-11ea-854b-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf59c0e4-cb61-11ea-854b-bc764e2007e4;
 Tue, 21 Jul 2020 14:52:07 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h22so24374360lji.9
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 07:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5L6mWnfWczvZIDlfcDmsAQ4aNqg8ljvSp66nbmLeIiQ=;
 b=TxnJzhM4/oxQ3rFRSjVWdu29lrpmFSac4RCywh2ch2fSCUc8QXLJPnTL1k3lCbdavq
 8V7u9Ax4F+5uPyWq8mFM/YsrKjEQd+2eRxgMIj2ZdTLEx3tjzQkYhro3Q5O9cys27FpQ
 eMKGyQBLh0MwjvI/4GcpTr3RVETpu/yo3Q4tbYYJR6eM04hC7890b8qnZ+pAD9DhKC7M
 z5UrnGlKjWOUHYHTs2bZE2aOveVc4gByPgYgryRBuY6v8sTEjOTZUobq6hrGHZt6nnB+
 X3xPWNdpaoppk6dPDkkH+oWsoWNtbcL5NUcsjFM0iJ7vrJbBSWPAzCyAT0Bx2Rq5H7SL
 c4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5L6mWnfWczvZIDlfcDmsAQ4aNqg8ljvSp66nbmLeIiQ=;
 b=nyklji8CNWLc+5gYk37DFuik8XMd1ZWeL7ZOPp1lKMdp25sfs4kgjWhLpyv4voZhsa
 B9pKNJf70a1qvFDrST7PdG4iImzY1OstYWL/c1nS/rv7rXCuhwpJ/+/T+aBX+WPNwnY+
 EFQ2fpGakizR1S6m3PCIRRy3H+4CfmLcvS7QIPYG9FSb5sHxGZEnPZzBkgJ0sjRJ6Hx8
 QHPO2oFKrNQCD4wJM0/55RgXPMU80Xs1QG/5pW8RP6/QzOq50fStqxSE+IO43dCU3ht9
 xp956G3puw7PvR7SoRof7LtpG54Rn+3XRe4qCfy11KrcPCK1+gvhXz8CiOzpNS4vx6lX
 lK3g==
X-Gm-Message-State: AOAM530La2NeQHoXGhkG1d/3wG7JhRNn6YfBkeJmVdvxhVpe8N+/kwXQ
 YMUsRzRzTavp7AJttXMf7vY=
X-Google-Smtp-Source: ABdhPJz1NzNOJplgrkOHOVmskypLkyIfl0UeHUB05GBpabzm0LV3utn89PzGBEiIpMgjkcNKQdrdQQ==
X-Received: by 2002:a2e:7c07:: with SMTP id x7mr13224484ljc.166.1595343126526; 
 Tue, 21 Jul 2020 07:52:06 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id e18sm1352907ljn.135.2020.07.21.07.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 07:52:06 -0700 (PDT)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e44d6826-643f-77c6-a821-77dc0abf4cbc@gmail.com>
Date: Tue, 21 Jul 2020 17:52:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2c249585-aaba-1065-95df-be772861e9a8@arm.com>
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


On 21.07.20 17:32, André Przywara wrote:
> On 21/07/2020 14:43, Julien Grall wrote:

Hello Andre, Julien


>> (+ Andre)
>>
>> Hi Oleksandr,
>>
>> On 21/07/2020 13:26, Oleksandr wrote:
>>> On 20.07.20 23:38, Stefano Stabellini wrote:
>>>> For instance, what's your take on notifications with virtio-mmio? How
>>>> are they modelled today? Are they good enough or do we need MSIs?
>>> Notifications are sent from device (backend) to the driver (frontend)
>>> using interrupts. Additional DM function was introduced for that
>>> purpose xendevicemodel_set_irq_level() which results in
>>> vgic_inject_irq() call.
>>>
>>> Currently, if device wants to notify a driver it should trigger the
>>> interrupt by calling that function twice (high level at first, then
>>> low level).
>> This doesn't look right to me. Assuming the interrupt is trigger when
>> the line is high-level, the backend should only issue the hypercall once
>> to set the level to high. Once the guest has finish to process all the
>> notifications the backend would then call the hypercall to lower the
>> interrupt line.
>>
>> This means the interrupts should keep firing as long as the interrupt
>> line is high.
>>
>> It is quite possible that I took some shortcut when implementing the
>> hypercall, so this should be corrected before anyone start to rely on it.
> So I think the key question is: are virtio interrupts level or edge
> triggered? Both QEMU and kvmtool advertise virtio-mmio interrupts as
> edge-triggered.
>  From skimming through the virtio spec I can't find any explicit
> mentioning of the type of IRQ, but the usage of MSIs indeed hints at
> using an edge property. Apparently reading the PCI ISR status register
> clears it, which again sounds like edge. For virtio-mmio the driver
> needs to explicitly clear the interrupt status register, which again
> says: edge (as it's not the device clearing the status).
>
> So the device should just notify the driver once, which would cause one
> vgic_inject_irq() call. It would be then up to the driver to clear up
> that status, by reading PCI ISR status or writing to virtio-mmio's
> interrupt-acknowledge register.
>
> Does that make sense?
When implementing Xen backend, I didn't have an already working example 
so only guessed. I looked how kvmtool behaved when actually triggering 
the interrupt on Arm [1].

Taking into the account that Xen PoC on Arm advertises [2] the same irq 
type (TYPE_EDGE_RISING) as kvmtool [3] I decided to follow the model of 
triggering an interrupt. Could you please explain, is this wrong?


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/tree/arm/gic.c#n418

[2] 
https://github.com/xen-troops/xen/blob/ioreq_4.14_ml/tools/libxl/libxl_arm.c#L727

[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/tree/virtio/mmio.c#n270

-- 
Regards,

Oleksandr Tyshchenko


