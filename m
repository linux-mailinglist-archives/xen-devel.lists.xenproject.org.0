Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EFB6F588A
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 15:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529205.823340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puCBK-0003sY-TY; Wed, 03 May 2023 13:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529205.823340; Wed, 03 May 2023 13:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puCBK-0003qs-Qj; Wed, 03 May 2023 13:06:06 +0000
Received: by outflank-mailman (input) for mailman id 529205;
 Wed, 03 May 2023 13:06:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hrU=AY=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puCBK-0003qm-2x
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 13:06:06 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 421be6c3-e9b3-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 15:06:04 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-PTV4Sh6-PaqKGLOW2cNEKg-1; Wed, 03 May 2023 09:05:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92E9A885627;
 Wed,  3 May 2023 13:05:58 +0000 (UTC)
Received: from localhost (unknown [10.39.195.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C56C2026D16;
 Wed,  3 May 2023 13:05:57 +0000 (UTC)
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
X-Inumbo-ID: 421be6c3-e9b3-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683119163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Phu2rUngwbJv3O5WPwObndw41FS7BwEFsVdpGZ12G2o=;
	b=MjA20ljRzl3jfPkuzyrEiCNfJLcmHX/6jllIzT490eNt2wn9EfbF9ct9YQSFlt2X0MyVTZ
	9a6mweYEbJ5dp/PimhVeyFCFWBOJ6//VGgHlnnyafyNtWDQLk696kSaLrDqeBGrs2P1Tp1
	wkZfWXvflCgv1uuFEiEYnGsr30sofGs=
X-MC-Unique: PTV4Sh6-PaqKGLOW2cNEKg-1
Date: Wed, 3 May 2023 09:05:50 -0400
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
Message-ID: <20230503130550.GA757667@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-5-stefanha@redhat.com>
 <ZEvWv8dF78Jpb6CQ@redhat.com>
 <20230501150934.GA14869@fedora>
 <ZFEN+KY8JViTDtv/@redhat.com>
 <20230502200243.GD535070@fedora>
 <ZFJIQW6RpndfCcXR@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SX9dxWjHVceQRg4J"
Content-Disposition: inline
In-Reply-To: <ZFJIQW6RpndfCcXR@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4


--SX9dxWjHVceQRg4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2023 at 01:40:49PM +0200, Kevin Wolf wrote:
> Am 02.05.2023 um 22:02 hat Stefan Hajnoczi geschrieben:
> > On Tue, May 02, 2023 at 03:19:52PM +0200, Kevin Wolf wrote:
> > > Am 01.05.2023 um 17:09 hat Stefan Hajnoczi geschrieben:
> > > > On Fri, Apr 28, 2023 at 04:22:55PM +0200, Kevin Wolf wrote:
> > > > > Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > > > > > This patch is part of an effort to remove the aio_disable_exter=
nal()
> > > > > > API because it does not fit in a multi-queue block layer world =
where
> > > > > > many AioContexts may be submitting requests to the same disk.
> > > > > >=20
> > > > > > The SCSI emulation code is already in good shape to stop using
> > > > > > aio_disable_external(). It was only used by commit 9c5aad84da1c
> > > > > > ("virtio-scsi: fixed virtio_scsi_ctx_check failed when detachin=
g scsi
> > > > > > disk") to ensure that virtio_scsi_hotunplug() works while the g=
uest
> > > > > > driver is submitting I/O.
> > > > > >=20
> > > > > > Ensure virtio_scsi_hotunplug() is safe as follows:
> > > > > >=20
> > > > > > 1. qdev_simple_device_unplug_cb() -> qdev_unrealize() ->
> > > > > >    device_set_realized() calls qatomic_set(&dev->realized, fals=
e) so
> > > > > >    that future scsi_device_get() calls return NULL because they=
 exclude
> > > > > >    SCSIDevices with realized=3Dfalse.
> > > > > >=20
> > > > > >    That means virtio-scsi will reject new I/O requests to this
> > > > > >    SCSIDevice with VIRTIO_SCSI_S_BAD_TARGET even while
> > > > > >    virtio_scsi_hotunplug() is still executing. We are protected=
 against
> > > > > >    new requests!
> > > > > >=20
> > > > > > 2. Add a call to scsi_device_purge_requests() from scsi_unreali=
ze() so
> > > > > >    that in-flight requests are cancelled synchronously. This en=
sures
> > > > > >    that no in-flight requests remain once qdev_simple_device_un=
plug_cb()
> > > > > >    returns.
> > > > > >=20
> > > > > > Thanks to these two conditions we don't need aio_disable_extern=
al()
> > > > > > anymore.
> > > > > >=20
> > > > > > Cc: Zhengui Li <lizhengui@huawei.com>
> > > > > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > > > > > Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> > > > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > >=20
> > > > > qemu-iotests 040 starts failing for me after this patch, with wha=
t looks
> > > > > like a use-after-free error of some kind.
> > > > >=20
> > > > > (gdb) bt
> > > > > #0  0x000055b6e3e1f31c in job_type (job=3D0xe3e3e3e3e3e3e3e3) at =
=2E./job.c:238
> > > > > #1  0x000055b6e3e1cee5 in is_block_job (job=3D0xe3e3e3e3e3e3e3e3)=
 at ../blockjob.c:41
> > > > > #2  0x000055b6e3e1ce7d in block_job_next_locked (bjob=3D0x55b6e72=
b7570) at ../blockjob.c:54
> > > > > #3  0x000055b6e3df6370 in blockdev_mark_auto_del (blk=3D0x55b6e74=
af0a0) at ../blockdev.c:157
> > > > > #4  0x000055b6e393e23b in scsi_qdev_unrealize (qdev=3D0x55b6e7c04=
d40) at ../hw/scsi/scsi-bus.c:303
> > > > > #5  0x000055b6e3db0d0e in device_set_realized (obj=3D0x55b6e7c04d=
40, value=3Dfalse, errp=3D0x55b6e497c918 <error_abort>) at ../hw/core/qdev.=
c:599
> > > > > #6  0x000055b6e3dba36e in property_set_bool (obj=3D0x55b6e7c04d40=
, v=3D0x55b6e7d7f290, name=3D0x55b6e41bd6d8 "realized", opaque=3D0x55b6e724=
6d20, errp=3D0x55b6e497c918 <error_abort>)
> > > > >     at ../qom/object.c:2285
> > > > > #7  0x000055b6e3db7e65 in object_property_set (obj=3D0x55b6e7c04d=
40, name=3D0x55b6e41bd6d8 "realized", v=3D0x55b6e7d7f290, errp=3D0x55b6e497=
c918 <error_abort>) at ../qom/object.c:1420
> > > > > #8  0x000055b6e3dbd84a in object_property_set_qobject (obj=3D0x55=
b6e7c04d40, name=3D0x55b6e41bd6d8 "realized", value=3D0x55b6e74c1890, errp=
=3D0x55b6e497c918 <error_abort>)
> > > > >     at ../qom/qom-qobject.c:28
> > > > > #9  0x000055b6e3db8570 in object_property_set_bool (obj=3D0x55b6e=
7c04d40, name=3D0x55b6e41bd6d8 "realized", value=3Dfalse, errp=3D0x55b6e497=
c918 <error_abort>) at ../qom/object.c:1489
> > > > > #10 0x000055b6e3daf2b5 in qdev_unrealize (dev=3D0x55b6e7c04d40) a=
t ../hw/core/qdev.c:306
> > > > > #11 0x000055b6e3db509d in qdev_simple_device_unplug_cb (hotplug_d=
ev=3D0x55b6e81c3630, dev=3D0x55b6e7c04d40, errp=3D0x7ffec5519200) at ../hw/=
core/qdev-hotplug.c:72
> > > > > #12 0x000055b6e3c520f9 in virtio_scsi_hotunplug (hotplug_dev=3D0x=
55b6e81c3630, dev=3D0x55b6e7c04d40, errp=3D0x7ffec5519200) at ../hw/scsi/vi=
rtio-scsi.c:1065
> > > > > #13 0x000055b6e3db4dec in hotplug_handler_unplug (plug_handler=3D=
0x55b6e81c3630, plugged_dev=3D0x55b6e7c04d40, errp=3D0x7ffec5519200) at ../=
hw/core/hotplug.c:56
> > > > > #14 0x000055b6e3a28f84 in qdev_unplug (dev=3D0x55b6e7c04d40, errp=
=3D0x7ffec55192e0) at ../softmmu/qdev-monitor.c:935
> > > > > #15 0x000055b6e3a290fa in qmp_device_del (id=3D0x55b6e74c1760 "sc=
si0", errp=3D0x7ffec55192e0) at ../softmmu/qdev-monitor.c:955
> > > > > #16 0x000055b6e3fb0a5f in qmp_marshal_device_del (args=3D0x7f61cc=
005eb0, ret=3D0x7f61d5a8ae38, errp=3D0x7f61d5a8ae40) at qapi/qapi-commands-=
qdev.c:114
> > > > > #17 0x000055b6e3fd52e1 in do_qmp_dispatch_bh (opaque=3D0x7f61d5a8=
ae08) at ../qapi/qmp-dispatch.c:128
> > > > > #18 0x000055b6e4007b9e in aio_bh_call (bh=3D0x55b6e7dea730) at ..=
/util/async.c:155
> > > > > #19 0x000055b6e4007d2e in aio_bh_poll (ctx=3D0x55b6e72447c0) at .=
=2E/util/async.c:184
> > > > > #20 0x000055b6e3fe3b45 in aio_dispatch (ctx=3D0x55b6e72447c0) at =
=2E./util/aio-posix.c:421
> > > > > #21 0x000055b6e4009544 in aio_ctx_dispatch (source=3D0x55b6e72447=
c0, callback=3D0x0, user_data=3D0x0) at ../util/async.c:326
> > > > > #22 0x00007f61ddc14c7f in g_main_dispatch (context=3D0x55b6e7244b=
20) at ../glib/gmain.c:3454
> > > > > #23 g_main_context_dispatch (context=3D0x55b6e7244b20) at ../glib=
/gmain.c:4172
> > > > > #24 0x000055b6e400a7e8 in glib_pollfds_poll () at ../util/main-lo=
op.c:290
> > > > > #25 0x000055b6e400a0c2 in os_host_main_loop_wait (timeout=3D0) at=
 ../util/main-loop.c:313
> > > > > #26 0x000055b6e4009fa2 in main_loop_wait (nonblocking=3D0) at ../=
util/main-loop.c:592
> > > > > #27 0x000055b6e3a3047b in qemu_main_loop () at ../softmmu/runstat=
e.c:731
> > > > > #28 0x000055b6e3dab27d in qemu_default_main () at ../softmmu/main=
=2Ec:37
> > > > > #29 0x000055b6e3dab2b8 in main (argc=3D24, argv=3D0x7ffec55196a8)=
 at ../softmmu/main.c:48
> > > > > (gdb) p jobs
> > > > > $4 =3D {lh_first =3D 0x0}
> > > >=20
> > > > I wasn't able to reproduce this with gcc 13.1.1 or clang 16.0.1:
> > > >=20
> > > >   $ tests/qemu-iotests/check -qcow2 040
> > > >=20
> > > > Any suggestions on how to reproduce the issue?
> > >=20
> > > It happens consistently for me with the same command line, both with =
gcc
> > > and clang.
> > >=20
> > > gcc (GCC) 12.2.1 20221121 (Red Hat 12.2.1-4)
> > > clang version 15.0.7 (Fedora 15.0.7-2.fc37)
> > >=20
> > > Maybe there is a semantic merge conflict? I have applied the series on
> > > top of master (05d50ba2d4) and my block branch (88f81f7bc8).
> >=20
> > I can't find 88f81f7bc8 but rebased on repo.or.cz/qemu/kevin.git block
> > (4514dac7f2e9) and the test passes here.
> >=20
> > I rebased on qemu.git/master (05d50ba2d4) and it also passes.
> >=20
> > Please let me know if the following tree (a0ff680a72f6) works on your
> > machine:
> > https://gitlab.com/stefanha/qemu/-/tree/remove-aio_disable_external
>=20
> Fails in the same way.
>=20
> So I tried to debug this myself now. The problem is that iterating the
> jobs in blockdev_mark_auto_del() is incorrect: job_cancel_locked()
> frees the job and then block_job_next_locked() is a use after free.
>=20
> It also drops job_mutex temporarily and polls, so even switching to a
> *_FOREACH_SAFE style loop won't fix this. I guess we have to restart
> the whole search from the start after a job_cancel_locked() because the
> list might look very different after the call.
>=20
> Now, of course, how this is related to your patch and why it doesn't
> trigger before it, is still less than clear. What I found out is that
> adding the scsi_device_purge_requests() is enough to crash it. Maybe
> it's related to the blk_drain() inside of it. That the job finishes
> earlier during the unplug now or something like that.
>=20
> Anyway, changing blockdev_mark_auto_del() fixes it. I'll send a patch.

Thanks, and sorry for taking your time with debugging it!

Stefan

--SX9dxWjHVceQRg4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRSXC4ACgkQnKSrs4Gr
c8i74Qf6AklkO6aWrRBz6XAZ8dK/EiYL1W+TDr0RyrsU7nCVkvdlyP7AlGvIyjcs
YrK8FIjM+cjgHKnMkRqFBMn0xVQMrnSNZ2cLDZaVY4DlgVlmYmmt0RNnQWlftAuc
UJkymWg5dZV6hw/TI7ku1+pRnZRx32fxLiMIn+R1tkD8+OX+JMeN7WG3cAhvpPUI
m24TcHXZrqNO0kV4qXoM4GJNkDkYLaF1pXQ4MsZpPHcr8Zzhyn+5vlVmo+FEp7iX
ozXdMSGcA+fQ3yUGEIUISvZMrc3f8aIfaV29gti8Sj+ekULPGAS9It/2ZJuZTRos
Rbou/5fwuiQX6myLLQCGj7HQuwlZ+g==
=GY3E
-----END PGP SIGNATURE-----

--SX9dxWjHVceQRg4J--


