Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1CF227FEB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 14:27:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxrMD-00007s-2I; Tue, 21 Jul 2020 12:26:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FhFK=BA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1jxrMB-00006K-9S
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 12:26:51 +0000
X-Inumbo-ID: 737aa13e-cb4d-11ea-850b-bc764e2007e4
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 737aa13e-cb4d-11ea-850b-bc764e2007e4;
 Tue, 21 Jul 2020 12:26:50 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id h22so23831018lji.9
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 05:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=2Ln5ZtR9WdMPrbDe6t/l/6q1wU4V/hxBQeF49jsssf0=;
 b=UafC2psq0akwJM4oDjkNSdG1wfOdeXAFcy+Dn2R4xr47DVc3DPO1BsAjBMuZLRNrI8
 PA21WJekE9jzoVtmzNOGAP7+r5taZYvyZsqOKVn7+Wsskma5NeIdL7zWM1e+0QgIbsxJ
 YmzDoXndddm5EpuZI93LTBmUmFsZSluxTUquzOMwwXVNI7miTbG8Qevzm6oQ5vT8K0L8
 FjKRfGJsCHlaT/YswPTZSvq0WLujeniSEcmiXkhnz6ApCrpRNWaQdQ0smgQgpQ3huHhf
 SwY1A5ENgRR0EO6xbKaCObVfmTl7loezu4ybLxMpNW4K2cSJ7mURkFGzAOuOyXvwpzHl
 /u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2Ln5ZtR9WdMPrbDe6t/l/6q1wU4V/hxBQeF49jsssf0=;
 b=GcGnyxKg+oRKWRsMlXH2j1+jYJcBTHBYCGjvywyC+gkEuw5kgSdnY+lr5Lje0Skeor
 BsrOTRfmIac5XrdbbyAtsMld7Mm9y6S1wKlBfXmf2DAteddzuZ9qBoIb8OjZi8AFxnEV
 Ijz8JChL9FoymhCdQF+Sp0+mVbQXqVouyysNxTy3CCunyKtJf6GPVc8FcOm+r7gpQvMY
 8cSbyTVVsRKwcBxlNbvwxE7b9LuNToR3HOS+vqGLWR8Oh55HoVrvMHEtvlTzeIc+Bvzx
 mxDb6euQ7tNBWhPvXRhd1Np/6V+Q9wNv4FmDZLTpBN880T06qDU/dgEnmwXuOMNKdCP/
 0NCQ==
X-Gm-Message-State: AOAM533f+vpRSomQrJxOmQ8CyZC68zFpo0faTpkkf5I7y70RDDNvvPLl
 87BPSSGH97IsIrMNVr6h/FY=
X-Google-Smtp-Source: ABdhPJzVyRRe1SQBiA9ephoVzxBUoNlmt/84lr+A1kn7IDvcF/w9tkC3TyyChLFYt4Tm4Qyr0fP5kw==
X-Received: by 2002:a2e:b00a:: with SMTP id y10mr1984553ljk.266.1595334409315; 
 Tue, 21 Jul 2020 05:26:49 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j19sm1689407lfe.91.2020.07.21.05.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 05:26:48 -0700 (PDT)
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <alpine.DEB.2.21.2007201326060.32544@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4454c70e-47fa-46e8-90bf-1904b11318b1@gmail.com>
Date: Tue, 21 Jul 2020 15:26:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007201326060.32544@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Julien Grall <julien@xen.org>, Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 alex.bennee@linaro.org, Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 20.07.20 23:38, Stefano Stabellini wrote:

Hello Stefano

> On Fri, 17 Jul 2020, Oleksandr wrote:
>>>> *A few word about solution:*
>>>> As it was mentioned at [1], in order to implement virtio-mmio Xen on Arm
>>> Any plans for virtio-pci? Arm seems to be moving to the PCI bus, and
>>> it would be very interesting from a x86 PoV, as I don't think
>>> virtio-mmio is something that you can easily use on x86 (or even use
>>> at all).
>> Being honest I didn't consider virtio-pci so far. Julien's PoC (we are based
>> on) provides support for the virtio-mmio transport
>>
>> which is enough to start working around VirtIO and is not as complex as
>> virtio-pci. But it doesn't mean there is no way for virtio-pci in Xen.
>>
>> I think, this could be added in next steps. But the nearest target is
>> virtio-mmio approach (of course if the community agrees on that).
> Hi Julien, Oleksandr,
>
> Aside from complexity and easy-of-development, are there any other
> architectural reasons for using virtio-mmio?
>
> I am not asking because I intend to suggest to do something different
> (virtio-mmio is fine as far as I can tell.) I am asking because recently
> there was a virtio-pci/virtio-mmio discussion recently in Linaro and I
> would like to understand if there are any implications from a Xen point
> of view that I don't yet know.
Unfortunately, I can't say anything regarding virtio-pci/MSI. Could the 
virtio-pci work in virtual environment without PCI support (various 
embedded platforms)?

It feels to me that both transports (easy and lightweight virtio-mmio 
and complex and powerfull virtio-pci) will have their consumer demand 
and worth being implemented in Xen.


>
> For instance, what's your take on notifications with virtio-mmio? How
> are they modelled today? Are they good enough or do we need MSIs?

Notifications are sent from device (backend) to the driver (frontend) 
using interrupts. Additional DM function was introduced for that purpose 
xendevicemodel_set_irq_level() which results in vgic_inject_irq() call.

Currently, if device wants to notify a driver it should trigger the 
interrupt by calling that function twice (high level at first, then low 
level).


-- 
Regards,

Oleksandr Tyshchenko


