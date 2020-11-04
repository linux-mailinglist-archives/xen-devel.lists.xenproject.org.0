Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE42A60CE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 10:43:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18961.44124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaFJv-00023L-B8; Wed, 04 Nov 2020 09:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18961.44124; Wed, 04 Nov 2020 09:43:11 +0000
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
	id 1kaFJv-00022n-72; Wed, 04 Nov 2020 09:43:11 +0000
Received: by outflank-mailman (input) for mailman id 18961;
 Wed, 04 Nov 2020 09:43:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UAnB=EK=kaod.org=groug@srs-us1.protection.inumbo.net>)
 id 1kaFJt-000225-HQ
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:43:09 +0000
Received: from 9.mo51.mail-out.ovh.net (unknown [46.105.48.137])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7b5b7d7-64f8-47e1-a909-648d7b9d2e5a;
 Wed, 04 Nov 2020 09:43:07 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 389B1232EDE;
 Wed,  4 Nov 2020 10:43:04 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 4 Nov 2020
 10:43:03 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UAnB=EK=kaod.org=groug@srs-us1.protection.inumbo.net>)
	id 1kaFJt-000225-HQ
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:43:09 +0000
X-Inumbo-ID: d7b5b7d7-64f8-47e1-a909-648d7b9d2e5a
Received: from 9.mo51.mail-out.ovh.net (unknown [46.105.48.137])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d7b5b7d7-64f8-47e1-a909-648d7b9d2e5a;
	Wed, 04 Nov 2020 09:43:07 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
	by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 389B1232EDE;
	Wed,  4 Nov 2020 10:43:04 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 4 Nov 2020
 10:43:03 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-97G00225ad514c-a9bd-4a8c-ab32-ef9d4c5470ae,
                    B675344909C57F45DE6B9FBDE8367EDF8CA03E23) smtp.auth=groug@kaod.org
Date: Wed, 4 Nov 2020 10:43:01 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
CC: <qemu-devel@nongnu.org>, Christian Borntraeger <borntraeger@de.ibm.com>,
	Fam Zheng <fam@euphon.net>, Richard Henderson <rth@twiddle.net>, "Cornelia
 Huck" <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	<qemu-s390x@nongnu.org>, Matthew Rosato <mjrosato@linux.ibm.com>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>, Wainer
 dos Santos Moschetta <wainersm@redhat.com>, "Daniel P . Berrange"
	<berrange@redhat.com>, David Hildenbrand <david@redhat.com>, Thomas Huth
	<thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH-for-5.2 v2 2/4] hw/9pfs: Fix Kconfig dependency problem
 between 9pfs and Xen
Message-ID: <20201104104301.6a6e0009@bahia.lan>
In-Reply-To: <20201104084327.3010593-3-philmd@redhat.com>
References: <20201104084327.3010593-1-philmd@redhat.com>
	<20201104084327.3010593-3-philmd@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: aae0851a-7046-4d90-b8af-7274b98f0a0c
X-Ovh-Tracer-Id: 8622141487906920720
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedruddthedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh

On Wed,  4 Nov 2020 09:43:25 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Fixes './configure --without-default-devices --enable-xen' build:
>=20
>   /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function =
`xen_be_register_common':
>   hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'
>   /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x8): undef=
ined reference to `local_ops'
>   /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x20): unde=
fined reference to `synth_ops'
>   /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x38): unde=
fined reference to `proxy_ops'
>   collect2: error: ld returned 1 exit status
>=20
> Fixes: b2c00bce54c ("meson: convert hw/9pfs, cleanup")
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> I'm not sure b2c00bce54c is the real culprit
>=20

FWIW this commit introduced the 9PFS config which isn't used
anywhere. Backends depend on FSDEV_9P which itself depends
on VIRTFS. So I tend to think b2c00bce54c is the culprit
but _of couse_ I could be wrong :)

Anyway, this patch (+ patch 1) fix the build break mentioned
in the changelog so:

Acked-by: Greg Kurz <groug@kaod.org>
Tested-by: Greg Kurz <groug@kaod.org>

> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/Kconfig     | 4 ----
>  hw/9pfs/meson.build | 2 +-
>  2 files changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/hw/9pfs/Kconfig b/hw/9pfs/Kconfig
> index d3ebd737301..3ae57496613 100644
> --- a/hw/9pfs/Kconfig
> +++ b/hw/9pfs/Kconfig
> @@ -2,12 +2,8 @@ config FSDEV_9P
>      bool
>      depends on VIRTFS
> =20
> -config 9PFS
> -    bool
> -
>  config VIRTIO_9P
>      bool
>      default y
>      depends on VIRTFS && VIRTIO
>      select FSDEV_9P
> -    select 9PFS
> diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
> index cc094262122..99be5d91196 100644
> --- a/hw/9pfs/meson.build
> +++ b/hw/9pfs/meson.build
> @@ -15,6 +15,6 @@
>    'coxattr.c',
>  ))
>  fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
> -softmmu_ss.add_all(when: 'CONFIG_9PFS', if_true: fs_ss)
> +softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
> =20
>  specific_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-9p-devi=
ce.c'))


