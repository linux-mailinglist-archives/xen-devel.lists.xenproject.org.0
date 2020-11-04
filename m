Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29A02A649F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 13:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19099.44310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaIBZ-0002YK-Jz; Wed, 04 Nov 2020 12:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19099.44310; Wed, 04 Nov 2020 12:46:45 +0000
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
	id 1kaIBZ-0002Xv-Gq; Wed, 04 Nov 2020 12:46:45 +0000
Received: by outflank-mailman (input) for mailman id 19099;
 Wed, 04 Nov 2020 12:46:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZaG=EK=crudebyte.com=qemu_oss@srs-us1.protection.inumbo.net>)
 id 1kaIBX-0002Xq-8m
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 12:46:43 +0000
Received: from lizzy.crudebyte.com (unknown [91.194.90.13])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adad4ea0-f79b-49c5-b9bb-862930ad7a1d;
 Wed, 04 Nov 2020 12:46:41 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=NZaG=EK=crudebyte.com=qemu_oss@srs-us1.protection.inumbo.net>)
	id 1kaIBX-0002Xq-8m
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 12:46:43 +0000
X-Inumbo-ID: adad4ea0-f79b-49c5-b9bb-862930ad7a1d
Received: from lizzy.crudebyte.com (unknown [91.194.90.13])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id adad4ea0-f79b-49c5-b9bb-862930ad7a1d;
	Wed, 04 Nov 2020 12:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=/krue73RQvdTWcIblo1I9y7H3d6eOwA1QW3W+4qPpfE=; b=UHh3nTAHNFB2zk0OC/yuN81pAX
	CS3ZhcW/5BcC89K1b2ChCpUquZyD+PzyaUgL8Ho7EDpDwJWA4IZVim23uFNMgtdvecrENGVrtNs2s
	01CK686+wZcKvd7lPZ4BljzXHhOrbVziSz4mYY3VQhU3yOXXGKCChQqqoT2rcJmAmr2UXXkkkV5YI
	nEEBDTWC5LDAqsGp0wZ54FJwoMtufRgdiU+Q8GSfgHfUx2o/UucIDGu5/lFc3X6JJWD/K6rFc0p3x
	3W0m4ixzxQyWOR/ZZ6nRUGTW5O/CaDlLZDTngBRDb28ytW7EQURadvxENGyH+Lk6t++V7qYkPetk7
	UcDWglqg==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>, Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel P . Berrange" <berrange@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH-for-5.2 v3 2/4] hw/9pfs: Fix Kconfig dependency problem between 9pfs and Xen
Date: Wed, 04 Nov 2020 13:18:09 +0100
Message-ID: <8965407.pN9RvXrJQ9@silver>
In-Reply-To: <20201104115706.3101190-3-philmd@redhat.com>
References: <20201104115706.3101190-1-philmd@redhat.com> <20201104115706.3101190-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Mittwoch, 4. November 2020 12:57:04 CET Philippe Mathieu-Daud=E9 wrote:
> Commit b2c00bce54c ("meson: convert hw/9pfs, cleanup") introduced
> CONFIG_9PFS (probably a wrong conflict resolution). This config is
> not used anywhere. Backends depend on CONFIG_FSDEV_9P which itself
> depends on CONFIG_VIRTFS.
>=20
> Remove the invalid CONFIG_9PFS and use CONFIG_FSDEV_9P instead, to
> fix the './configure --without-default-devices --enable-xen' build:
>=20
>   /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function
> `xen_be_register_common': hw/xen/xen-legacy-backend.c:754: undefined
> reference to `xen_9pfs_ops' /usr/bin/ld:
> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x8): undefined reference =
to
> `local_ops' /usr/bin/ld:
> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x20): undefined reference
> to `synth_ops' /usr/bin/ld:
> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x38): undefined reference
> to `proxy_ops' collect2: error: ld returned 1 exit status
>=20
> Fixes: b2c00bce54c ("meson: convert hw/9pfs, cleanup")
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Acked-by: Greg Kurz <groug@kaod.org>
> Tested-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

> ---
> v2: Reworded description (Greg)
>=20
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
>=20
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
>=20
>  specific_ss.add(when: 'CONFIG_VIRTIO_9P', if_true:
> files('virtio-9p-device.c'))

Best regards,
Christian Schoenebeck



