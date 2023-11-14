Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D117EAA22
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 06:30:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632124.986148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2m07-0004Jl-FJ; Tue, 14 Nov 2023 05:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632124.986148; Tue, 14 Nov 2023 05:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2m07-0004HC-Cd; Tue, 14 Nov 2023 05:30:15 +0000
Received: by outflank-mailman (input) for mailman id 632124;
 Tue, 14 Nov 2023 05:30:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CgNs=G3=redhat.com=jasowang@srs-se1.protection.inumbo.net>)
 id 1r2m05-0004H6-Pz
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 05:30:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1875252-82ae-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 06:30:12 +0100 (CET)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-0WtkBS_7MBqTbeITGyVh6g-1; Tue, 14 Nov 2023 00:30:09 -0500
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2c8321310b6so30008571fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 21:30:09 -0800 (PST)
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
X-Inumbo-ID: e1875252-82ae-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699939811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KYdz1LdDqXxrg73NymxfuIwXOLaJadgVCvKcNkIZIj8=;
	b=PtfvZl+pDw4skMZygKSuKVVtopAnoP8+eFjbjKG+FoB075D1INf5T29iXmyEAIc4d2LUjI
	E9vGQSQh1+VqQ2XazTOrmrC8PPpH+DTseefgg2d8lmD1wOkqMscl6aq75NKS/kihrj5IG4
	ONbMDIMHSYdZQs3lI2plChX+w+fynAs=
X-MC-Unique: 0WtkBS_7MBqTbeITGyVh6g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699939808; x=1700544608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYdz1LdDqXxrg73NymxfuIwXOLaJadgVCvKcNkIZIj8=;
        b=OxndCen+Is4Lz+ih7VEVHymiaywuVXdkPdY3gtlvEG7MpMM0OSrjh1BbzRnD+qgJL8
         ALWrs4Ku5PLSVO1R9JplIF5HssurMiV3+Vy5+2xrPFMEGuJ0jKRdq5b7xci1IlJfAau/
         IjhhJLb+How6ODHf3UtfEMbejanTjwoeszRwvk901atVeI/Mcj4ZXPMgJruUjjx1q21p
         9VrpRJuzLFZoEJLtEdQ8U+OapB0j0giGVi3ohTDzQUvE2cZmVJfaHt+kPSE4Rn7t+WdD
         U0fnMDqEN/PZWdrJZE20lotdvxj4YhxHduyOMblHax9eAicuZj25OuenXw1aEaLe8AHO
         nSuQ==
X-Gm-Message-State: AOJu0Ywx9NI9fTMZJxUgSuG75E1NklBjijlK/DMVxkx1Z8U88Ealru38
	eMQgTfKAOgjvM9BcigAushnaUQjja/k17ehAiTkZfBpE0x+cRZFoN44aiZ04JR6ziCS7huGNjG2
	uLG9vtSIBhkDjpsveqk4Nahpo8G25b6JiqKkmXuAbL+8=
X-Received: by 2002:ac2:511e:0:b0:508:1470:6168 with SMTP id q30-20020ac2511e000000b0050814706168mr5922319lfb.57.1699939808111;
        Mon, 13 Nov 2023 21:30:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVzxMxMFRb/9BGu0XUCejJsg/lJk8N17qIa17Ji8ZsHjPqnEaNS9GtTK1pB5fVqnN+UCm2mLbSIvyvoP8kV/A=
X-Received: by 2002:ac2:511e:0:b0:508:1470:6168 with SMTP id
 q30-20020ac2511e000000b0050814706168mr5922308lfb.57.1699939807729; Mon, 13
 Nov 2023 21:30:07 -0800 (PST)
MIME-Version: 1.0
References: <20230601031859.7115-1-akihiko.odaki@daynix.com> <a2cb6356-18b1-44d1-90a8-d137e8a25227@daynix.com>
In-Reply-To: <a2cb6356-18b1-44d1-90a8-d137e8a25227@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 14 Nov 2023 13:29:55 +0800
Message-ID: <CACGkMEvyDitD-5d_mzK0LxjidcT7ZXfw_qzK_WbMPt6dd+McKQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] net: Update MemReentrancyGuard for NIC
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, P J P <pj.pandit@yahoo.co.in>, 
	Alexander Bulekov <alxndr@bu.edu>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>, 
	Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
	Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>, 
	Sriram Yagnaraman <sriram.yagnaraman@est.tech>, Thomas Huth <huth@tuxfamily.org>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
	Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, 
	Greg Kurz <groug@kaod.org>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
	Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
	xen-devel@lists.xenproject.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 3:16=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2023/06/01 12:18, Akihiko Odaki wrote:
> > Recently MemReentrancyGuard was added to DeviceState to record that the
> > device is engaging in I/O. The network device backend needs to update i=
t
> > when delivering a packet to a device.
> >
> > This implementation follows what bottom half does, but it does not add
> > a tracepoint for the case that the network device backend started
> > delivering a packet to a device which is already engaging in I/O. This
> > is because such reentrancy frequently happens for
> > qemu_flush_queued_packets() and is insignificant.
> >
> > This series consists of two patches. The first patch makes a bulk chang=
e to
> > add a new parameter to qemu_new_nic() and does not contain behavioral c=
hanges.
> > The second patch actually implements MemReentrancyGuard update.
> >
> > V1 -> V2: Added the 'Fixes: CVE-2023-3019' tag
> >
> > Akihiko Odaki (2):
> >    net: Provide MemReentrancyGuard * to qemu_new_nic()
> >    net: Update MemReentrancyGuard for NIC
> >
> >   include/net/net.h             |  2 ++
> >   hw/net/allwinner-sun8i-emac.c |  3 ++-
> >   hw/net/allwinner_emac.c       |  3 ++-
> >   hw/net/cadence_gem.c          |  3 ++-
> >   hw/net/dp8393x.c              |  3 ++-
> >   hw/net/e1000.c                |  3 ++-
> >   hw/net/e1000e.c               |  2 +-
> >   hw/net/eepro100.c             |  4 +++-
> >   hw/net/etraxfs_eth.c          |  3 ++-
> >   hw/net/fsl_etsec/etsec.c      |  3 ++-
> >   hw/net/ftgmac100.c            |  3 ++-
> >   hw/net/i82596.c               |  2 +-
> >   hw/net/igb.c                  |  2 +-
> >   hw/net/imx_fec.c              |  2 +-
> >   hw/net/lan9118.c              |  3 ++-
> >   hw/net/mcf_fec.c              |  3 ++-
> >   hw/net/mipsnet.c              |  3 ++-
> >   hw/net/msf2-emac.c            |  3 ++-
> >   hw/net/mv88w8618_eth.c        |  3 ++-
> >   hw/net/ne2000-isa.c           |  3 ++-
> >   hw/net/ne2000-pci.c           |  3 ++-
> >   hw/net/npcm7xx_emc.c          |  3 ++-
> >   hw/net/opencores_eth.c        |  3 ++-
> >   hw/net/pcnet.c                |  3 ++-
> >   hw/net/rocker/rocker_fp.c     |  4 ++--
> >   hw/net/rtl8139.c              |  3 ++-
> >   hw/net/smc91c111.c            |  3 ++-
> >   hw/net/spapr_llan.c           |  3 ++-
> >   hw/net/stellaris_enet.c       |  3 ++-
> >   hw/net/sungem.c               |  2 +-
> >   hw/net/sunhme.c               |  3 ++-
> >   hw/net/tulip.c                |  3 ++-
> >   hw/net/virtio-net.c           |  6 ++++--
> >   hw/net/vmxnet3.c              |  2 +-
> >   hw/net/xen_nic.c              |  4 ++--
> >   hw/net/xgmac.c                |  3 ++-
> >   hw/net/xilinx_axienet.c       |  3 ++-
> >   hw/net/xilinx_ethlite.c       |  3 ++-
> >   hw/usb/dev-network.c          |  3 ++-
> >   net/net.c                     | 15 +++++++++++++++
> >   40 files changed, 90 insertions(+), 41 deletions(-)
> >
>
> Hi Jason,
>
> Can you review this series?

For some reason it falls through the cracks.

I've queued this for rc1.

Thanks

>
> Regards,
> Akihiko Odaki
>


