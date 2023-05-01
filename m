Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD9A6F329F
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 17:11:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528042.820600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptVAK-0002wr-Dn; Mon, 01 May 2023 15:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528042.820600; Mon, 01 May 2023 15:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptVAK-0002uC-AR; Mon, 01 May 2023 15:10:12 +0000
Received: by outflank-mailman (input) for mailman id 528042;
 Mon, 01 May 2023 15:10:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6+9=AW=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ptVAJ-0002u3-5M
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 15:10:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 420b0a69-e832-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 17:10:08 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-aITlDNxzPOCmk1dkEKuuzA-1; Mon, 01 May 2023 11:09:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32042381459C;
 Mon,  1 May 2023 15:09:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B641405DBBC;
 Mon,  1 May 2023 15:09:35 +0000 (UTC)
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
X-Inumbo-ID: 420b0a69-e832-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682953807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QPwbHvw4ANoG38uZDcwsHmZDGENhR6tztyBUqhJj/1o=;
	b=djXZWchKCi8PMRevZ9+gcZE/8i9jp69nQKiYLXQPPoa5kWHecxH+/L/N8X4LyJqlrjlp3C
	IwEQqQT4c/QRW0V08TMf0QfZtUGUXThrNZirUCMBRRmEY4xU+nRCkRuOYj/D99nmHYtaqZ
	De7RlyQGxtd4rXo+zKW4ydVwPlFD+7c=
X-MC-Unique: aITlDNxzPOCmk1dkEKuuzA-1
Date: Mon, 1 May 2023 11:09:34 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
	"Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Zhengui Li <lizhengui@huawei.com>,
	Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: Re: [PATCH v4 04/20] virtio-scsi: stop using aio_disable_external()
 during unplug
Message-ID: <20230501150934.GA14869@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-5-stefanha@redhat.com>
 <ZEvWv8dF78Jpb6CQ@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="afWx/qHB+Kz1LRw/"
Content-Disposition: inline
In-Reply-To: <ZEvWv8dF78Jpb6CQ@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1


--afWx/qHB+Kz1LRw/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 04:22:55PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > This patch is part of an effort to remove the aio_disable_external()
> > API because it does not fit in a multi-queue block layer world where
> > many AioContexts may be submitting requests to the same disk.
> >=20
> > The SCSI emulation code is already in good shape to stop using
> > aio_disable_external(). It was only used by commit 9c5aad84da1c
> > ("virtio-scsi: fixed virtio_scsi_ctx_check failed when detaching scsi
> > disk") to ensure that virtio_scsi_hotunplug() works while the guest
> > driver is submitting I/O.
> >=20
> > Ensure virtio_scsi_hotunplug() is safe as follows:
> >=20
> > 1. qdev_simple_device_unplug_cb() -> qdev_unrealize() ->
> >    device_set_realized() calls qatomic_set(&dev->realized, false) so
> >    that future scsi_device_get() calls return NULL because they exclude
> >    SCSIDevices with realized=3Dfalse.
> >=20
> >    That means virtio-scsi will reject new I/O requests to this
> >    SCSIDevice with VIRTIO_SCSI_S_BAD_TARGET even while
> >    virtio_scsi_hotunplug() is still executing. We are protected against
> >    new requests!
> >=20
> > 2. Add a call to scsi_device_purge_requests() from scsi_unrealize() so
> >    that in-flight requests are cancelled synchronously. This ensures
> >    that no in-flight requests remain once qdev_simple_device_unplug_cb()
> >    returns.
> >=20
> > Thanks to these two conditions we don't need aio_disable_external()
> > anymore.
> >=20
> > Cc: Zhengui Li <lizhengui@huawei.com>
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> qemu-iotests 040 starts failing for me after this patch, with what looks
> like a use-after-free error of some kind.
>=20
> (gdb) bt
> #0  0x000055b6e3e1f31c in job_type (job=3D0xe3e3e3e3e3e3e3e3) at ../job.c=
:238
> #1  0x000055b6e3e1cee5 in is_block_job (job=3D0xe3e3e3e3e3e3e3e3) at ../b=
lockjob.c:41
> #2  0x000055b6e3e1ce7d in block_job_next_locked (bjob=3D0x55b6e72b7570) a=
t ../blockjob.c:54
> #3  0x000055b6e3df6370 in blockdev_mark_auto_del (blk=3D0x55b6e74af0a0) a=
t ../blockdev.c:157
> #4  0x000055b6e393e23b in scsi_qdev_unrealize (qdev=3D0x55b6e7c04d40) at =
=2E./hw/scsi/scsi-bus.c:303
> #5  0x000055b6e3db0d0e in device_set_realized (obj=3D0x55b6e7c04d40, valu=
e=3Dfalse, errp=3D0x55b6e497c918 <error_abort>) at ../hw/core/qdev.c:599
> #6  0x000055b6e3dba36e in property_set_bool (obj=3D0x55b6e7c04d40, v=3D0x=
55b6e7d7f290, name=3D0x55b6e41bd6d8 "realized", opaque=3D0x55b6e7246d20, er=
rp=3D0x55b6e497c918 <error_abort>)
>     at ../qom/object.c:2285
> #7  0x000055b6e3db7e65 in object_property_set (obj=3D0x55b6e7c04d40, name=
=3D0x55b6e41bd6d8 "realized", v=3D0x55b6e7d7f290, errp=3D0x55b6e497c918 <er=
ror_abort>) at ../qom/object.c:1420
> #8  0x000055b6e3dbd84a in object_property_set_qobject (obj=3D0x55b6e7c04d=
40, name=3D0x55b6e41bd6d8 "realized", value=3D0x55b6e74c1890, errp=3D0x55b6=
e497c918 <error_abort>)
>     at ../qom/qom-qobject.c:28
> #9  0x000055b6e3db8570 in object_property_set_bool (obj=3D0x55b6e7c04d40,=
 name=3D0x55b6e41bd6d8 "realized", value=3Dfalse, errp=3D0x55b6e497c918 <er=
ror_abort>) at ../qom/object.c:1489
> #10 0x000055b6e3daf2b5 in qdev_unrealize (dev=3D0x55b6e7c04d40) at ../hw/=
core/qdev.c:306
> #11 0x000055b6e3db509d in qdev_simple_device_unplug_cb (hotplug_dev=3D0x5=
5b6e81c3630, dev=3D0x55b6e7c04d40, errp=3D0x7ffec5519200) at ../hw/core/qde=
v-hotplug.c:72
> #12 0x000055b6e3c520f9 in virtio_scsi_hotunplug (hotplug_dev=3D0x55b6e81c=
3630, dev=3D0x55b6e7c04d40, errp=3D0x7ffec5519200) at ../hw/scsi/virtio-scs=
i.c:1065
> #13 0x000055b6e3db4dec in hotplug_handler_unplug (plug_handler=3D0x55b6e8=
1c3630, plugged_dev=3D0x55b6e7c04d40, errp=3D0x7ffec5519200) at ../hw/core/=
hotplug.c:56
> #14 0x000055b6e3a28f84 in qdev_unplug (dev=3D0x55b6e7c04d40, errp=3D0x7ff=
ec55192e0) at ../softmmu/qdev-monitor.c:935
> #15 0x000055b6e3a290fa in qmp_device_del (id=3D0x55b6e74c1760 "scsi0", er=
rp=3D0x7ffec55192e0) at ../softmmu/qdev-monitor.c:955
> #16 0x000055b6e3fb0a5f in qmp_marshal_device_del (args=3D0x7f61cc005eb0, =
ret=3D0x7f61d5a8ae38, errp=3D0x7f61d5a8ae40) at qapi/qapi-commands-qdev.c:1=
14
> #17 0x000055b6e3fd52e1 in do_qmp_dispatch_bh (opaque=3D0x7f61d5a8ae08) at=
 ../qapi/qmp-dispatch.c:128
> #18 0x000055b6e4007b9e in aio_bh_call (bh=3D0x55b6e7dea730) at ../util/as=
ync.c:155
> #19 0x000055b6e4007d2e in aio_bh_poll (ctx=3D0x55b6e72447c0) at ../util/a=
sync.c:184
> #20 0x000055b6e3fe3b45 in aio_dispatch (ctx=3D0x55b6e72447c0) at ../util/=
aio-posix.c:421
> #21 0x000055b6e4009544 in aio_ctx_dispatch (source=3D0x55b6e72447c0, call=
back=3D0x0, user_data=3D0x0) at ../util/async.c:326
> #22 0x00007f61ddc14c7f in g_main_dispatch (context=3D0x55b6e7244b20) at .=
=2E/glib/gmain.c:3454
> #23 g_main_context_dispatch (context=3D0x55b6e7244b20) at ../glib/gmain.c=
:4172
> #24 0x000055b6e400a7e8 in glib_pollfds_poll () at ../util/main-loop.c:290
> #25 0x000055b6e400a0c2 in os_host_main_loop_wait (timeout=3D0) at ../util=
/main-loop.c:313
> #26 0x000055b6e4009fa2 in main_loop_wait (nonblocking=3D0) at ../util/mai=
n-loop.c:592
> #27 0x000055b6e3a3047b in qemu_main_loop () at ../softmmu/runstate.c:731
> #28 0x000055b6e3dab27d in qemu_default_main () at ../softmmu/main.c:37
> #29 0x000055b6e3dab2b8 in main (argc=3D24, argv=3D0x7ffec55196a8) at ../s=
oftmmu/main.c:48
> (gdb) p jobs
> $4 =3D {lh_first =3D 0x0}

I wasn't able to reproduce this with gcc 13.1.1 or clang 16.0.1:

  $ tests/qemu-iotests/check -qcow2 040

Any suggestions on how to reproduce the issue?

Thanks,
Stefan

--afWx/qHB+Kz1LRw/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRP1i4ACgkQnKSrs4Gr
c8jU8gf7Bsg/kploFAmdPvcQ5QvmehPNQbyu4ORQkGh9WjEiJ4fROi0dXYB9yyU6
EZMpHv+mxn82F2lSoWcqD6HuuxeUJn+LVEHUzrDgcy4z9KWY8pNQmC5tijEAWnh3
0Q9G6WC9F+3GFly99ED34Ip8UJhz7IetXKMlZ+/cD8rm8YNa17cXEzZ/nHq8+aa0
SUAcymqkoOEQ9fRPQKx5TK2PW5AsZmgQE8dlmWh2c4zaWyjmZdLjE6Dap5e4l5U8
+fR9RbHAl9hMd/+SZNGzkVvZDSYMnZ8qdoEbvQ8YaxlXXaXP9gh4Mv4UBxHlOIAS
Af2CAk1ye+2jhy7jM1N0qxVg5pu/oQ==
=v+9M
-----END PGP SIGNATURE-----

--afWx/qHB+Kz1LRw/--


