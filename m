Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B0F275536
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 12:10:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL1ik-0003xH-Ry; Wed, 23 Sep 2020 10:09:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqUk=DA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kL1ij-0003xC-KQ
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 10:09:53 +0000
X-Inumbo-ID: 4b241e75-14d5-40ec-85d6-b542298d48d6
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b241e75-14d5-40ec-85d6-b542298d48d6;
 Wed, 23 Sep 2020 10:09:52 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e16so20395068wrm.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2020 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=x+3m3n8U5OsI/sLGAVfkyE/FOiRauGXl+CT0uwYQU5I=;
 b=QjEUUjNqPZIlPWN65yAlRq05F/0L70INBwp4g1zys84cl3VA05YwMKaMhbw8lC3Oe1
 L0i5oNydlMjymLfEbz8QvHsD2RQgaLkqEeV1/wb/bB/o23A5389FmYbbpRgkQXJx5GfZ
 NzcXcwTWwZjqTnIzmSnrcyYnGRY96h9PwawGpzizltR1sn1gOaIYPBk1sFtTdUkU/Crd
 q3zWWmhwWVKZWU6u75EGjtZz1E5iGH9++tRhpVjAoAOgBZmOFZm8Pcqh0hJ9wkErvNK8
 NjZtADw/NBQunRxum0PPYFuSvlKnncox1+dzWh8Tf398cVn4BJudN0XhuY1Yb3jdsQak
 8f2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=x+3m3n8U5OsI/sLGAVfkyE/FOiRauGXl+CT0uwYQU5I=;
 b=aranVoWqKc/YNirBRbAVIFkklg7mtIlwxtIfO0k0EHNOJ5bgcMH7yUdYdR2tPK0vY+
 UCDa3kfRu8yEnHYHs/CLGQ71jwpaTv/h3fSM2UtzlcKyDkzAeANSizPmqCTe9nrSoMqI
 nb17NnEG82XFU9GS2AW2RrVDfMbG8lJOeWqzeGhVMbcVjkU8I1LSVkKAo7ZRnmPP7ZRO
 grfeW2FQhtbKr3p68oEkYUsCfDFCgnN0rbEWi6OkY6GW3HAQUN8BidphJAhhWJjC+MCD
 vVSqKPvsJypTLldzN7pYV23yLYLouyuz2I/7FIFzxysE4/kf0WmG/8zic+KO0S/7epHk
 iifQ==
X-Gm-Message-State: AOAM532mVqX+J4tmwYVtDYkauRq1EuTks5K4Us40zJKjHSNj8dFcayF0
 DD6zrOq6e23WSMSHFHArPZ4=
X-Google-Smtp-Source: ABdhPJyYsYXW2nEM4+SkNX23xxDczIRW6li6BcUT7TEIPuoq1URkQ3MIrgmu1MGpYChO0VkEit1ZMg==
X-Received: by 2002:adf:9b8b:: with SMTP id d11mr10884702wrc.71.1600855791590; 
 Wed, 23 Sep 2020 03:09:51 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id o4sm28998483wrv.86.2020.09.23.03.09.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Sep 2020 03:09:50 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	"'Simon Leiner'" <simon@leiner.me>
Cc: <xen-devel@lists.xenproject.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Bertrand Marquis'" <Bertrand.Marquis@arm.com>,
 "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>
References: <32922E87-9F50-41B3-A321-3212697CF7DB@leiner.me>
 <b45a40e3-ea9d-0eef-ea99-88201be83511@xen.org>
 <44f2d486-e3bd-6a44-042d-f05b5d0c0732@leiner.me>
 <9bbea2a9-76f8-6384-3cff-3ae65e0475fa@xen.org>
 <9AFF0FE3-F808-453F-91B1-74F9C7426FE7@leiner.me>
 <2c296fa0-d4f1-3f9a-00d8-99d401615799@xen.org>
In-Reply-To: <2c296fa0-d4f1-3f9a-00d8-99d401615799@xen.org>
Subject: RE: Virtio Xen (WAS: Re: [Linux] [ARM] Granting memory obtained from
 the DMA API)
Date: Wed, 23 Sep 2020 11:09:49 +0100
Message-ID: <010301d69191$ac6146b0$0523d410$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGaCU1HUL3nw11kTXDXOy4dScys3gGxoQM+AgyZNcUBdVe1qwECFO4RATkNYLyps5pEcA==
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
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Julien Grall
> Sent: 23 September 2020 10:04
> To: Simon Leiner <simon@leiner.me>
> Cc: xen-devel@lists.xenproject.org; Stefano Stabellini =
<sstabellini@kernel.org>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>; Oleksandr Tyshchenko <olekstysh@gmail.com>
> Subject: Re: Virtio Xen (WAS: Re: [Linux] [ARM] Granting memory =
obtained from the DMA API)
>=20
> On 29/08/2020 11:38, Simon Leiner wrote:
> > Hi Julien,
>=20
> Hi Simon,
>=20
> Apologies for the late answer.
>=20
> > On 25.08.20 15:02, Julien Grall wrote:
> >> May I ask why did you create a new transport rather than using the
> >> existing one?
> >
> > We wanted a mechanism for dynamically creating virtio devices at
> > runtime. I looked at virtio-mmio briefly and it seemed to me that a =
lot
> > of things would have to be known in advance (how many devices are
> > there? How much memory do they need? Where does the memory range for
> > virtio-mmio start on the device domain?). So after reading a bit =
about
> > Xen and how the classic split drivers work, I figured building a =
split
> > driver for virtio was the way to go. The basic principle is really
> > simple:
> >
> >   - Using grants to share memory for the virtqueues
> >   - Using event channels as a queue notification mechanism
> >   - All state handling and other information exchange (like number =
of
> >     queues, grant refs, event channel numbers etc.) is done through =
the
> >     Xenbus.
> >
> > On the Linux side, this is implemented as a kernel module. No =
patches
> > to the kernel itself (apart from the ones I sent in earlier) or to =
Xen
> > itself are required.
> >
> >> So far, there is an RFC to implement virtio-mmio for Xen on Arm
> >
> > I did not see that before. Also, I'm not familiar with the ioreq
> > mechanism. But from skimming the patch, it seems like it achieves =
the
> > same thing (dynamic creation of virtio devices at runtime). Is that
> > right?
>=20
> I am not aware of any mechanism with virtio-mmio to notify a new =
device
> after the OS booted. But virtio-pci should allow you to do as as this =
is
> just a PCI device.
>=20
> However, you will still need to size the PCI hostbridge I/O region
> correctly when the domain creation. Not sure if this would be an issue
> in your use case.
>=20
> >
> >> But the idea of a Xen specific transport is discussed on the =
mailing
> >> list time to time. It would be more secure than existing transport,
> >> but I am worried about the adoption of the transport.
> >
> > What are the security issues with the existing transport mechanisms?
> In the Xen PV model, a backend cannot access the frontend memory =
unless
> the latter did explictly grant.
>=20
> In the default virtio-{mmio, pci} model, a backend must have full =
access
> to the frontend memory. This can be an issue if you don't trust your
> backend or it can get compromised.

Is 'full access' required? The virtio device implementation would =
essentially be performing DMA so and vIOMMU implementation could =
restrict memory access on a per-PCI-device basis.

>=20
> > I'm quite new to the Xen community, so I have no idea about adoption
> > rates.
> >
> >> A new transport requires to modify all the OSes so they can work on
> >> Xen.
> >
> > Just to be clear: They would need to be modified in order to support
> > that mechanism, but it changes nothing about the interface between
> > hypervisor and guest.
>=20
> Right, this is the first bit I am more concerned about. IMHO, the main
> goal of virtio is to allow moving from one hypervisor to another =
without
> (or possibly limited) changing the guest OS code.
>=20
> Adding a new transport open source OS for a new transport is fairly
> easy, but it may be harder to justify for proprietary OS if it only
> benefits Xen.
>=20
> That said, if we can convince other hypervisor vendors to adopt it =
then
> most of my concern are moot :).
>=20
> >
> > However, supporting the same use case with an already existing
> > transport mechanism is more elegant than building another transport
> > mechanism specifically for that case IMO. The only technical =
difference
> > between my implementation and the virtio-mmio approach in actually
> > running the virtio device is that I'm using event channels for queue
> > notification while virtio-mmio uses some bytes in memory for that. I =
do
> > not have any measurements indicating whether or not this makes a
> > difference.
>=20
> The virtio-mmio notification is potentially going to be expensive on =
Xen
> because the guest because a vCPU will be blocked until the I/O has =
been
> handled by the IOREQ server.
>=20
> The notification would look like:
>      1) Frontend write in notification address
>      2) Trap in Xen
>      3) Pause the vCPU and forward the I/O to the IOREQ server (e.g.
> your virtio backend)
>      4) Schedule the domain where the IOREQ server resides
>      5) Wait for the I/O completion
>      6) Unpause the vCPU
>      7) Return to guest
>=20
> We may be able to optimize as there is no need to wait for the I/O to
> complete when we notify.

Perhaps take a look at the 'bufioreq' ring in the implementation?

  Paul

>=20
> Cheers,
>=20
> --
> Julien Grall



