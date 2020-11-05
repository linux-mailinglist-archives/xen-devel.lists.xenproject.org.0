Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193FA2A7E7E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 13:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19765.45107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaeJ0-00038Z-Hg; Thu, 05 Nov 2020 12:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19765.45107; Thu, 05 Nov 2020 12:23:54 +0000
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
	id 1kaeJ0-00038A-E8; Thu, 05 Nov 2020 12:23:54 +0000
Received: by outflank-mailman (input) for mailman id 19765;
 Thu, 05 Nov 2020 12:23:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t/Oa=EL=kaod.org=groug@srs-us1.protection.inumbo.net>)
 id 1kaeIz-000385-3U
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 12:23:53 +0000
Received: from smtpout1.mo529.mail-out.ovh.net (unknown [178.32.125.2])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1169807e-1fa0-48f7-a66a-e466d77f328d;
 Thu, 05 Nov 2020 12:23:50 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 632D06A9D11B;
 Thu,  5 Nov 2020 13:23:48 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 5 Nov 2020
 13:23:47 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=t/Oa=EL=kaod.org=groug@srs-us1.protection.inumbo.net>)
	id 1kaeIz-000385-3U
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 12:23:53 +0000
X-Inumbo-ID: 1169807e-1fa0-48f7-a66a-e466d77f328d
Received: from smtpout1.mo529.mail-out.ovh.net (unknown [178.32.125.2])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1169807e-1fa0-48f7-a66a-e466d77f328d;
	Thu, 05 Nov 2020 12:23:50 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
	by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 632D06A9D11B;
	Thu,  5 Nov 2020 13:23:48 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 5 Nov 2020
 13:23:47 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-98R002f4d6e030-ceec-415c-9026-00fee129f7cd,
                    5D04B6D4EAACA18D9EDEF493C42F41A1D3896549) smtp.auth=groug@kaod.org
Date: Thu, 5 Nov 2020 13:23:46 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
CC: Christian Schoenebeck <qemu_oss@crudebyte.com>, <qemu-devel@nongnu.org>,
	Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Daniel P . Berrange"
	<berrange@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>, "David
 Hildenbrand" <david@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
	<alex.bennee@linaro.org>, Cornelia Huck <cohuck@redhat.com>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, <qemu-s390x@nongnu.org>,
	<xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, "Richard
 Henderson" <rth@twiddle.net>
Subject: Re: [PATCH-for-5.2 v3 2/4] hw/9pfs: Fix Kconfig dependency problem
 between 9pfs and Xen
Message-ID: <20201105132346.5e0adf94@bahia.lan>
In-Reply-To: <17370310-d69c-91ff-763d-52a1355ad605@redhat.com>
References: <20201104115706.3101190-1-philmd@redhat.com>
	<20201104115706.3101190-3-philmd@redhat.com>
	<8965407.pN9RvXrJQ9@silver>
	<20201104185439.41e9ddb3@bahia.lan>
	<17370310-d69c-91ff-763d-52a1355ad605@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: b0c3b55b-f88a-4045-9165-58d4c97a7207
X-Ovh-Tracer-Id: 17209380080369375504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedruddtjedggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehrthhhsehtfihiuggulhgvrdhnvght

On Thu, 5 Nov 2020 13:15:59 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 11/4/20 6:54 PM, Greg Kurz wrote:
> > On Wed, 04 Nov 2020 13:18:09 +0100
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> >=20
> >> On Mittwoch, 4. November 2020 12:57:04 CET Philippe Mathieu-Daud=C3=A9=
 wrote:
> >>> Commit b2c00bce54c ("meson: convert hw/9pfs, cleanup") introduced
> >>> CONFIG_9PFS (probably a wrong conflict resolution). This config is
> >>> not used anywhere. Backends depend on CONFIG_FSDEV_9P which itself
> >>> depends on CONFIG_VIRTFS.
> >>>
> >>> Remove the invalid CONFIG_9PFS and use CONFIG_FSDEV_9P instead, to
> >>> fix the './configure --without-default-devices --enable-xen' build:
> >>>
> >>>   /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in funct=
ion
> >>> `xen_be_register_common': hw/xen/xen-legacy-backend.c:754: undefined
> >>> reference to `xen_9pfs_ops' /usr/bin/ld:
> >>> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x8): undefined refere=
nce to
> >>> `local_ops' /usr/bin/ld:
> >>> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x20): undefined refer=
ence
> >>> to `synth_ops' /usr/bin/ld:
> >>> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x38): undefined refer=
ence
> >>> to `proxy_ops' collect2: error: ld returned 1 exit status
> >>>
> >>> Fixes: b2c00bce54c ("meson: convert hw/9pfs, cleanup")
> >>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> >>> Acked-by: Greg Kurz <groug@kaod.org>
> >>> Tested-by: Greg Kurz <groug@kaod.org>
> >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >>
> >> Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >>
> >=20
> > Phil,
> >=20
> > Same questioning as Connie. Do you intend to get this merged or should
> > Christian or I take care of that ?
>=20
> Same answer too =3D) If you are preparing a pull request, please go ahead!
>=20

Heh I've just seen your answer.

Christian,

Maybe you can add this patch in your next PR ?

> Thanks,
>=20
> Phil.
>=20


