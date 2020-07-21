Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A56882281B8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 16:15:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxt2z-0002Pj-V2; Tue, 21 Jul 2020 14:15:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GCg/=BA=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1jxt2y-0002Pe-Gz
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 14:15:08 +0000
X-Inumbo-ID: 94077da0-cb5c-11ea-852c-bc764e2007e4
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94077da0-cb5c-11ea-852c-bc764e2007e4;
 Tue, 21 Jul 2020 14:15:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s10so21313561wrw.12
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=5vGTsT2Jt71t9KbvAU+gXKWROTB/VrPHRbh3rS5Klho=;
 b=lwRVFWheFnDMj/wHVQyPfaAkmnE56tgVu6YCVdSBueR87O58tbrKtxEUMI2eBV5/74
 eu0TjXH5AJiFPTXhYiptPlYWi1F3xtakY4FWSXF65PXIYcU+HeUEjS5SGm/ys4mWwWWO
 veYFC2RoFi/q2oi5Wy5KQgSgDFdDANo7uKQ5gYS7dz4vzSwELzFWnEdQUkvgCC52VRJn
 1/RrPvspI7UKJlq/NvdHYGcO5srqkGr9vSZ+FFtlDxq/uKzRrHy+qX8gGM3u12gTg1s0
 /SUxMgQs9UsUz+pABnhOD4gEF8Bai98rKq2RaxoiJamnhXWnhWD7ZPuGjIrUNMpGQDre
 Bo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=5vGTsT2Jt71t9KbvAU+gXKWROTB/VrPHRbh3rS5Klho=;
 b=dt/aaze0Kj1b7DskvqUqutO97NBw8cP5KzRxYoea3hQk9l/cMwNbdHfe/kOf7WQCjX
 pF2MH9mXjKJIzn0EE7ca26cjN7aYWg5+QwO5WAZ8fq8gvDbQhruPlJAv7zWqlixdCdxe
 GP7pfctZGD8CKufT1relZUFlxUt4OuxqcivDjVZ7EeiAQM96zAL2lVqrVUgfxs1aNPK6
 9VNsGlNUPxoEuHEbj6D+4Z6CBmbdq3agRCnJABTl8qXqKaULZIxrFN0lt9lh0R1ITgam
 eBQe7Zh4n9ImcOIQ0WQKOqbEFFK1CxsR87F8Lr/Itf6yJsF8XuHJhX8ds7VWNmI/EQUM
 zaAA==
X-Gm-Message-State: AOAM531KmG1hp4MGj/TeK0j93eHKNObu6VAD5QITD73GwrqjlrYIl0vZ
 LidJnTrBeLp7kkOGb/OqqvBUYg==
X-Google-Smtp-Source: ABdhPJw5fGSJ10ahCVKuaNcUsB8yM1W7RZPHRoLthPVbZHNXtlYUvd+3O0kPiTv0HGRuzINGo2/hSQ==
X-Received: by 2002:adf:df91:: with SMTP id z17mr383795wrl.149.1595340906402; 
 Tue, 21 Jul 2020 07:15:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j14sm37763343wrs.75.2020.07.21.07.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 07:15:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D522F1FF7E;
 Tue, 21 Jul 2020 15:15:02 +0100 (BST)
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <alpine.DEB.2.21.2007201326060.32544@sstabellini-ThinkPad-T480s>
 <56e512af-993b-1364-be56-fc4be5d88519@xen.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
In-reply-to: <56e512af-993b-1364-be56-fc4be5d88519@xen.org>
Date: Tue, 21 Jul 2020 15:15:02 +0100
Message-ID: <87k0yxuf89.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Andre Przywara <andre.przywara@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr <olekstysh@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


Julien Grall <julien@xen.org> writes:

> (+ Andree for the vGIC).
>
> Hi Stefano,
>
> On 20/07/2020 21:38, Stefano Stabellini wrote:
>> On Fri, 17 Jul 2020, Oleksandr wrote:
>>>>> *A few word about solution:*
>>>>> As it was mentioned at [1], in order to implement virtio-mmio Xen on =
Arm
>>>> Any plans for virtio-pci? Arm seems to be moving to the PCI bus, and
>>>> it would be very interesting from a x86 PoV, as I don't think
>>>> virtio-mmio is something that you can easily use on x86 (or even use
>>>> at all).
>>>
>>> Being honest I didn't consider virtio-pci so far. Julien's PoC (we are =
based
>>> on) provides support for the virtio-mmio transport
>>>
>>> which is enough to start working around VirtIO and is not as complex as
>>> virtio-pci. But it doesn't mean there is no way for virtio-pci in Xen.
>>>
>>> I think, this could be added in next steps. But the nearest target is
>>> virtio-mmio approach (of course if the community agrees on that).
>
>> Aside from complexity and easy-of-development, are there any other
>> architectural reasons for using virtio-mmio?
>
<snip>
>>=20
>> For instance, what's your take on notifications with virtio-mmio? How
>> are they modelled today?
>
> The backend will notify the frontend using an SPI. The other way around=20
> (frontend -> backend) is based on an MMIO write.
>
> We have an interface to allow the backend to control whether the=20
> interrupt level (i.e. low, high). However, the "old" vGIC doesn't handle=
=20
> properly level interrupts. So we would end up to treat level interrupts=20
> as edge.
>
> Technically, the problem is already existing with HW interrupts, but the=
=20
> HW should fire it again if the interrupt line is still asserted. Another=
=20
> issue is the interrupt may fire even if the interrupt line was=20
> deasserted (IIRC this caused some interesting problem with the Arch timer=
).
>
> I am a bit concerned that the issue will be more proeminent for virtual=20
> interrupts. I know that we have some gross hack in the vpl011 to handle=20
> a level interrupts. So maybe it is time to switch to the new vGIC?
>
>> Are they good enough or do we need MSIs?
>
> I am not sure whether virtio-mmio supports MSIs. However for virtio-pci,=
=20
> MSIs is going to be useful to improve performance. This may mean to=20
> expose an ITS, so we would need to add support for guest.

virtio-mmio doesn't support MSI's at the moment although there have been
proposals to update the spec to allow them. At the moment the cost of
reading the ISR value and then writing an ack in vm_interrupt:

	/* Read and acknowledge interrupts */
	status =3D readl(vm_dev->base + VIRTIO_MMIO_INTERRUPT_STATUS);
	writel(status, vm_dev->base + VIRTIO_MMIO_INTERRUPT_ACK);

puts an extra vmexit cost to trap an emulate each exit. Getting an MSI
via an exitless access to the GIC would be better I think. I'm not quite
sure what the path to IRQs from Xen is.


>
> Cheers,


--=20
Alex Benn=C3=A9e

