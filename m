Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A10E6D61D0
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 15:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517844.803732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjgNU-0005kx-Pf; Tue, 04 Apr 2023 13:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517844.803732; Tue, 04 Apr 2023 13:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjgNU-0005iO-Mk; Tue, 04 Apr 2023 13:07:12 +0000
Received: by outflank-mailman (input) for mailman id 517844;
 Tue, 04 Apr 2023 13:07:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z4sN=73=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pjgNT-0005iI-7p
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 13:07:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ac532a6-d2e9-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 15:07:09 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-aEEHYlrtMj-0qGW-NiOQLQ-1; Tue, 04 Apr 2023 09:07:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CE59101A54F;
 Tue,  4 Apr 2023 13:07:01 +0000 (UTC)
Received: from localhost (unknown [10.39.194.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DFB4440BC;
 Tue,  4 Apr 2023 13:07:00 +0000 (UTC)
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
X-Inumbo-ID: 9ac532a6-d2e9-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680613628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oHqf0BVn2cr4iUWHULKZ+lPM/LaK6kyDq2wLGk1dnWI=;
	b=N5XFXZU8AK5znY3a3LiDnV5C4UIohAhrK99Ia21wBSIh4FlIQzeEfbTqLwpqnG/D5Xp18b
	uw0MYWXlRdxTUn1jQw2Kp6Vqn/FjOPrJA9xMizsiPYyFxZ0h5ah+uEo0ETQIgh05k3MLqt
	ArncaLxKJ1Hyaso00fg/HEF+YI/bxS0=
X-MC-Unique: aEEHYlrtMj-0qGW-NiOQLQ-1
Date: Tue, 4 Apr 2023 09:06:58 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Peter Lieven <pl@kamp.de>, Coiby Xu <Coiby.Xu@gmail.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>, Paul Durrant <paul@xen.org>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Fam Zheng <fam@euphon.net>, David Woodhouse <dwmw2@infradead.org>,
	Stefan Weil <sw@weilnetz.de>, Juan Quintela <quintela@redhat.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, eesposit@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 01/13] virtio-scsi: avoid race between unplug and
 transport event
Message-ID: <20230404130658.GG428487@fedora>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-2-stefanha@redhat.com>
 <2bbe988c-0802-55c3-b2a3-05e3f94e2f04@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a21Ii3lSZbeXw64P"
Content-Disposition: inline
In-Reply-To: <2bbe988c-0802-55c3-b2a3-05e3f94e2f04@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5


--a21Ii3lSZbeXw64P
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2023 at 10:47:11PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 3/4/23 20:29, Stefan Hajnoczi wrote:
> > Only report a transport reset event to the guest after the SCSIDevice
> > has been unrealized by qdev_simple_device_unplug_cb().
> >=20
> > qdev_simple_device_unplug_cb() sets the SCSIDevice's qdev.realized field
> > to false so that scsi_device_find/get() no longer see it.
> >=20
> > scsi_target_emulate_report_luns() also needs to be updated to filter out
> > SCSIDevices that are unrealized.
> >=20
> > These changes ensure that the guest driver does not see the SCSIDevice
> > that's being unplugged if it responds very quickly to the transport
> > reset event.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   hw/scsi/scsi-bus.c    |  3 ++-
> >   hw/scsi/virtio-scsi.c | 18 +++++++++---------
> >   2 files changed, 11 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> > index c97176110c..f9bd064833 100644
> > --- a/hw/scsi/scsi-bus.c
> > +++ b/hw/scsi/scsi-bus.c
> > @@ -487,7 +487,8 @@ static bool scsi_target_emulate_report_luns(SCSITar=
getReq *r)
> >               DeviceState *qdev =3D kid->child;
> >               SCSIDevice *dev =3D SCSI_DEVICE(qdev);
> > -            if (dev->channel =3D=3D channel && dev->id =3D=3D id && de=
v->lun !=3D 0) {
> > +            if (dev->channel =3D=3D channel && dev->id =3D=3D id && de=
v->lun !=3D 0 &&
> > +                qatomic_load_acquire(&dev->qdev.realized)) {
>=20
> Would this be more useful as a qdev_is_realized() helper?

Yes. There are no other users, but I think a helper makes sense.

Stefan

--a21Ii3lSZbeXw64P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQsIPIACgkQnKSrs4Gr
c8iK9gf/TFi/RWboEn8yEQ4zpL0td9Nd4+0XYH85P9acscF+6TcA+W70ehstRChY
twRsDr7bNxiglT+w01MBLdladQFM/J7c58OUZQ9OdEgkhFY1iP3DEIod+7sHIb/D
kkxW8D3uzTtzVRBGt+bIiFI44sBkukGcHVSrIyk3Rc57amd0T9ceSmGuXanmq0sp
kOpaQ/yt4dmAACGfJfcBYXfQE9QMr465W/YJQDjH+wrT49e9SkDbgw3MYjo6zYcm
BTH9t6XKAHp8b7OKZ8F8ibkALAXU553zogaq2j5Qlra0fzk/PsgyYwkni8qaTw8V
AUhiPKNh5ppuxq6VEfzReJrAyoIS5g==
=Pths
-----END PGP SIGNATURE-----

--a21Ii3lSZbeXw64P--


