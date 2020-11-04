Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940E82A6C41
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 18:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19495.44676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaMzg-0007uk-4C; Wed, 04 Nov 2020 17:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19495.44676; Wed, 04 Nov 2020 17:54:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaMzg-0007uK-18; Wed, 04 Nov 2020 17:54:48 +0000
Received: by outflank-mailman (input) for mailman id 19495;
 Wed, 04 Nov 2020 17:54:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UAnB=EK=kaod.org=groug@srs-us1.protection.inumbo.net>)
 id 1kaMze-0007uF-A8
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 17:54:46 +0000
Received: from smtpout1.mo804.mail-out.ovh.net (unknown [79.137.123.220])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5447aa65-15d6-4d2b-aa36-09d0fe60705f;
 Wed, 04 Nov 2020 17:54:44 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.197])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id A972570EF28F;
 Wed,  4 Nov 2020 18:54:41 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 4 Nov 2020
 18:54:40 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UAnB=EK=kaod.org=groug@srs-us1.protection.inumbo.net>)
	id 1kaMze-0007uF-A8
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 17:54:46 +0000
X-Inumbo-ID: 5447aa65-15d6-4d2b-aa36-09d0fe60705f
Received: from smtpout1.mo804.mail-out.ovh.net (unknown [79.137.123.220])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5447aa65-15d6-4d2b-aa36-09d0fe60705f;
	Wed, 04 Nov 2020 17:54:44 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.197])
	by mo804.mail-out.ovh.net (Postfix) with ESMTPS id A972570EF28F;
	Wed,  4 Nov 2020 18:54:41 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 4 Nov 2020
 18:54:40 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-97G002a60b9b55-a377-4b09-8ef1-53f1e0dae1a2,
                    B675344909C57F45DE6B9FBDE8367EDF8CA03E23) smtp.auth=groug@kaod.org
Date: Wed, 4 Nov 2020 18:54:39 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
CC: <qemu-devel@nongnu.org>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
	<philmd@redhat.com>, Fam Zheng <fam@euphon.net>, Thomas Huth
	<thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel P .
 Berrange" <berrange@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
	<alex.bennee@linaro.org>, Cornelia Huck <cohuck@redhat.com>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, <qemu-s390x@nongnu.org>,
	<xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, "Richard
 Henderson" <rth@twiddle.net>
Subject: Re: [PATCH-for-5.2 v3 2/4] hw/9pfs: Fix Kconfig dependency problem
 between 9pfs and Xen
Message-ID: <20201104185439.41e9ddb3@bahia.lan>
In-Reply-To: <8965407.pN9RvXrJQ9@silver>
References: <20201104115706.3101190-1-philmd@redhat.com>
	<20201104115706.3101190-3-philmd@redhat.com>
	<8965407.pN9RvXrJQ9@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 003e621b-1e17-4f77-9185-fd9f201e51e8
X-Ovh-Tracer-Id: 16924808878257838352
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedruddthedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheprhhthhesthifihguughlvgdrnhgvth

On Wed, 04 Nov 2020 13:18:09 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 4. November 2020 12:57:04 CET Philippe Mathieu-Daud=C3=A9 wr=
ote:
> > Commit b2c00bce54c ("meson: convert hw/9pfs, cleanup") introduced
> > CONFIG_9PFS (probably a wrong conflict resolution). This config is
> > not used anywhere. Backends depend on CONFIG_FSDEV_9P which itself
> > depends on CONFIG_VIRTFS.
> >=20
> > Remove the invalid CONFIG_9PFS and use CONFIG_FSDEV_9P instead, to
> > fix the './configure --without-default-devices --enable-xen' build:
> >=20
> >   /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function
> > `xen_be_register_common': hw/xen/xen-legacy-backend.c:754: undefined
> > reference to `xen_9pfs_ops' /usr/bin/ld:
> > libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x8): undefined referenc=
e to
> > `local_ops' /usr/bin/ld:
> > libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x20): undefined referen=
ce
> > to `synth_ops' /usr/bin/ld:
> > libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x38): undefined referen=
ce
> > to `proxy_ops' collect2: error: ld returned 1 exit status
> >=20
> > Fixes: b2c00bce54c ("meson: convert hw/9pfs, cleanup")
> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > Acked-by: Greg Kurz <groug@kaod.org>
> > Tested-by: Greg Kurz <groug@kaod.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>=20

Phil,

Same questioning as Connie. Do you intend to get this merged or should
Christian or I take care of that ?

> > ---
> > v2: Reworded description (Greg)
> >=20
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Anthony Perard <anthony.perard@citrix.com>
> > Cc: Paul Durrant <paul@xen.org>
> > Cc: xen-devel@lists.xenproject.org
> > Cc: Greg Kurz <groug@kaod.org>
> > Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >  hw/9pfs/Kconfig     | 4 ----
> >  hw/9pfs/meson.build | 2 +-
> >  2 files changed, 1 insertion(+), 5 deletions(-)
> >=20
> > diff --git a/hw/9pfs/Kconfig b/hw/9pfs/Kconfig
> > index d3ebd737301..3ae57496613 100644
> > --- a/hw/9pfs/Kconfig
> > +++ b/hw/9pfs/Kconfig
> > @@ -2,12 +2,8 @@ config FSDEV_9P
> >      bool
> >      depends on VIRTFS
> >=20
> > -config 9PFS
> > -    bool
> > -
> >  config VIRTIO_9P
> >      bool
> >      default y
> >      depends on VIRTFS && VIRTIO
> >      select FSDEV_9P
> > -    select 9PFS
> > diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
> > index cc094262122..99be5d91196 100644
> > --- a/hw/9pfs/meson.build
> > +++ b/hw/9pfs/meson.build
> > @@ -15,6 +15,6 @@
> >    'coxattr.c',
> >  ))
> >  fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
> > -softmmu_ss.add_all(when: 'CONFIG_9PFS', if_true: fs_ss)
> > +softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
> >=20
> >  specific_ss.add(when: 'CONFIG_VIRTIO_9P', if_true:
> > files('virtio-9p-device.c'))
>=20
> Best regards,
> Christian Schoenebeck
>=20
>=20


