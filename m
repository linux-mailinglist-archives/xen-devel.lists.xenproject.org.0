Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EA78038CE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 16:29:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647134.1009895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAsQ-0001pT-Pr; Mon, 04 Dec 2023 15:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647134.1009895; Mon, 04 Dec 2023 15:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAsQ-0001nj-LH; Mon, 04 Dec 2023 15:28:54 +0000
Received: by outflank-mailman (input) for mailman id 647134;
 Mon, 04 Dec 2023 15:28:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PgPa=HP=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAAsP-0001XU-Ql
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 15:28:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3bab602-92b9-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 16:28:52 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-428-0j3kj1VvMKy-e8MFdpknvw-1; Mon,
 04 Dec 2023 10:28:47 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E55F929AA3AC;
 Mon,  4 Dec 2023 15:28:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EDB210F44;
 Mon,  4 Dec 2023 15:28:44 +0000 (UTC)
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
X-Inumbo-ID: d3bab602-92b9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701703731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IjZQ/pcxJi6moEy2NVEzJM5HAt5V3Rf3SCpNVckP6Fg=;
	b=VC2qaEOXgNXMTfo47CgcQa5mkxiVuZGtnXCC5lcyqxB51NbgMhi1vtpoBEy6f7S+Ssu12Q
	visEr/8ZVmGfBSHXpfYHEtr6r6rPasJ/thHm3/IfeEI3jkfRb8w965r5MedePZYGv4CqAH
	UnTg2L28Sp0kIREUYnWSZdXi/Ght7P0=
X-MC-Unique: 0j3kj1VvMKy-e8MFdpknvw-1
Date: Mon, 4 Dec 2023 10:28:42 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Alberto Garcia <berto@igalia.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, Coiby Xu <Coiby.Xu@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Ari Sundholm <ari@tuxera.com>, Li Zhijian <lizhijian@fujitsu.com>,
	Cleber Rosa <crosa@redhat.com>, Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Zhang Chen <chen.zhang@intel.com>, Peter Xu <peterx@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Leonardo Bras <leobras@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Fam Zheng <fam@euphon.net>, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH 06/12] scsi: remove AioContext locking
Message-ID: <20231204152842.GE1492005@fedora>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-7-stefanha@redhat.com>
 <ZW3ErXZ2ZOo_kX2x@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HT+PqrFVEZkfTlWB"
Content-Disposition: inline
In-Reply-To: <ZW3ErXZ2ZOo_kX2x@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5


--HT+PqrFVEZkfTlWB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 01:23:09PM +0100, Kevin Wolf wrote:
> Am 29.11.2023 um 20:55 hat Stefan Hajnoczi geschrieben:
> > The AioContext lock no longer has any effect. Remove it.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  include/hw/virtio/virtio-scsi.h | 14 --------------
> >  hw/scsi/scsi-bus.c              |  2 --
> >  hw/scsi/scsi-disk.c             | 28 ++++------------------------
> >  hw/scsi/virtio-scsi.c           | 18 ------------------
> >  4 files changed, 4 insertions(+), 58 deletions(-)
>=20
> > @@ -2531,13 +2527,11 @@ static void scsi_unrealize(SCSIDevice *dev)
> >  static void scsi_hd_realize(SCSIDevice *dev, Error **errp)
> >  {
> >      SCSIDiskState *s =3D DO_UPCAST(SCSIDiskState, qdev, dev);
> > -    AioContext *ctx =3D NULL;
> > +
> >      /* can happen for devices without drive. The error message for mis=
sing
> >       * backend will be issued in scsi_realize
> >       */
> >      if (s->qdev.conf.blk) {
> > -        ctx =3D blk_get_aio_context(s->qdev.conf.blk);
> > -        aio_context_acquire(ctx);
> >          if (!blkconf_blocksizes(&s->qdev.conf, errp)) {
> >              goto out;
> >          }
> > @@ -2549,15 +2543,11 @@ static void scsi_hd_realize(SCSIDevice *dev, Er=
ror **errp)
> >      }
> >      scsi_realize(&s->qdev, errp);
> >  out:
> > -    if (ctx) {
> > -        aio_context_release(ctx);
> > -    }
> >  }
>=20
> This doesn't build for me:
>=20
> ../hw/scsi/scsi-disk.c:2545:1: error: label at end of compound statement =
is a C2x extension [-Werror,-Wc2x-extensions]
> }
> ^
> 1 error generated.

Will fix in v2. Thanks!

Stefan

--HT+PqrFVEZkfTlWB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVt8CoACgkQnKSrs4Gr
c8jc8wf/ZyGml3wk5T11oOQ1CpoCFpwfa/2Opfc5agssTpQ0CYaFXlM5ArdLiF4K
mMIdqI8vMbqF+Zvg7A67ETjSCE7idXIKcKdpFmG2ee1e8GDx1Piy0I1S48p4aMN4
TXmCfUeYeRf7F2gLPd5kuHQ/dp0tCN4qcghpkH627y3q4J3SykkLdza7elISopVA
z+B/Cvm9kyktQCV3yv5ezFE0bjeQH4c50T08WhpGsHUh2+k96DFMf1+30v0jmTSX
xRXpAFQeGdseABg0If6kZtso29BXOQMoZx4dIWUowTydjeTGDr6rOKtr6zseQFlm
6sC6sMotxD64mB1uyHE2/8Zo/Tlh7A==
=ToER
-----END PGP SIGNATURE-----

--HT+PqrFVEZkfTlWB--


