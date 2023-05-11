Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CFE6FFBD4
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 23:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533640.830461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxDm5-0001v6-Iz; Thu, 11 May 2023 21:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533640.830461; Thu, 11 May 2023 21:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxDm5-0001se-FT; Thu, 11 May 2023 21:24:33 +0000
Received: by outflank-mailman (input) for mailman id 533640;
 Thu, 11 May 2023 21:24:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hqDu=BA=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pxDm3-0001sQ-Ku
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 21:24:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35f1b70f-f042-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 23:24:29 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-MZoc4K02OLOSuJDjxdWiuQ-1; Thu, 11 May 2023 17:24:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E2BA101A54F;
 Thu, 11 May 2023 21:24:23 +0000 (UTC)
Received: from localhost (unknown [10.39.194.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7EF32026D16;
 Thu, 11 May 2023 21:24:22 +0000 (UTC)
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
X-Inumbo-ID: 35f1b70f-f042-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683840268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iunu2OSen4SsTvAlKu71PnM2BjLBjTVmzME/01ZQY0I=;
	b=aTM6/LKYQB/D7hSik0h6o3A7dNeh7On3hNy0DR4Xt5CqSREDWKQT0e+Az9C2l4ldzAJ/cU
	si7CQOo8krO36juMg5Ff95oKa21n+5BEc8ju1FMYhMzQlyTxO803ZolWW0BadaYzoKGtSq
	kb/LakLtcs5oY87MpyN9G6g85r8F4QE=
X-MC-Unique: MZoc4K02OLOSuJDjxdWiuQ-1
Date: Thu, 11 May 2023 17:24:21 -0400
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
	Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH v4 20/20] aio: remove aio_disable_external() API
Message-ID: <20230511212421.GD1425915@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-21-stefanha@redhat.com>
 <ZFQk2TdhZ6DiwM4t@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hOsvZoyrJ+/f+ltH"
Content-Disposition: inline
In-Reply-To: <ZFQk2TdhZ6DiwM4t@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4


--hOsvZoyrJ+/f+ltH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 11:34:17PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > All callers now pass is_external=3Dfalse to aio_set_fd_handler() and
> > aio_set_event_notifier(). The aio_disable_external() API that
> > temporarily disables fd handlers that were registered is_external=3Dtrue
> > is therefore dead code.
> >=20
> > Remove aio_disable_external(), aio_enable_external(), and the
> > is_external arguments to aio_set_fd_handler() and
> > aio_set_event_notifier().
> >=20
> > The entire test-fdmon-epoll test is removed because its sole purpose was
> > testing aio_disable_external().
> >=20
> > Parts of this patch were generated using the following coccinelle
> > (https://coccinelle.lip6.fr/) semantic patch:
> >=20
> >   @@
> >   expression ctx, fd, is_external, io_read, io_write, io_poll, io_poll_=
ready, opaque;
> >   @@
> >   - aio_set_fd_handler(ctx, fd, is_external, io_read, io_write, io_poll=
, io_poll_ready, opaque)
> >   + aio_set_fd_handler(ctx, fd, io_read, io_write, io_poll, io_poll_rea=
dy, opaque)
> >=20
> >   @@
> >   expression ctx, notifier, is_external, io_read, io_poll, io_poll_read=
y;
> >   @@
> >   - aio_set_event_notifier(ctx, notifier, is_external, io_read, io_poll=
, io_poll_ready)
> >   + aio_set_event_notifier(ctx, notifier, io_read, io_poll, io_poll_rea=
dy)
> >=20
> > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> > diff --git a/util/fdmon-epoll.c b/util/fdmon-epoll.c
> > index 1683aa1105..6b6a1a91f8 100644
> > --- a/util/fdmon-epoll.c
> > +++ b/util/fdmon-epoll.c
> > @@ -133,13 +128,12 @@ bool fdmon_epoll_try_upgrade(AioContext *ctx, uns=
igned npfd)
> >          return false;
> >      }
> > =20
> > -    /* Do not upgrade while external clients are disabled */
> > -    if (qatomic_read(&ctx->external_disable_cnt)) {
> > -        return false;
> > -    }
> > -
> > -    if (npfd < EPOLL_ENABLE_THRESHOLD) {
> > -        return false;
> > +    if (npfd >=3D EPOLL_ENABLE_THRESHOLD) {
> > +        if (fdmon_epoll_try_enable(ctx)) {
> > +            return true;
> > +        } else {
> > +            fdmon_epoll_disable(ctx);
> > +        }
> >      }
> > =20
> >      /* The list must not change while we add fds to epoll */
>=20
> I don't understand this hunk. Why are you changing more than just
> deleting the external_disable_cnt check?
>=20
> Is this a mismerge with your own commit e62da985?

Yes, it's a mismerge. Thanks for catching that!

Stefan

--hOsvZoyrJ+/f+ltH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRdXQUACgkQnKSrs4Gr
c8jCAwgArfC5LraGY8jVq0rjlhqjo+1t+A8cy3ybRhi7AWg9HlCzom9EknmlRBb2
IFwC4528xXBwjj+W116JsMihzmJzH1z/QhcAfG9yuv5yRM0clnkYit5zYrajIIFW
4r37+T7TPpfIDfJce3jOBhB3or0bTez/YKmkfUE3E0vXwn8W4kvnP3rHUdm0XHN3
z/oTO5uOWntYkSzEsc5mUsTaMmeYuNUJEEFeNeOn9OVioSm2cbyWjFWcv37/K5RA
DTIzgFmxW0VHQGRfp9HanBR7feVw2SkC6yLeh5s1Q6qrRVYiXYVlWzDI87H6GtHp
fFBXo0mv/tcQgnU27cWMn0RHw2xGQQ==
=yBNf
-----END PGP SIGNATURE-----

--hOsvZoyrJ+/f+ltH--


