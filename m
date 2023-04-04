Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC0C6D6E9C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 23:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518152.804395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjnpl-0005Rr-A9; Tue, 04 Apr 2023 21:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518152.804395; Tue, 04 Apr 2023 21:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjnpl-0005P9-7Q; Tue, 04 Apr 2023 21:04:53 +0000
Received: by outflank-mailman (input) for mailman id 518152;
 Tue, 04 Apr 2023 21:04:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z4sN=73=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pjnpk-0005P1-3e
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 21:04:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56876968-d32c-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 23:04:51 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-DimVpMkPOYuLTzIRXxdNzg-1; Tue, 04 Apr 2023 17:04:45 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74F9B887400;
 Tue,  4 Apr 2023 21:04:44 +0000 (UTC)
Received: from localhost (unknown [10.39.194.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEA78C35999;
 Tue,  4 Apr 2023 21:04:43 +0000 (UTC)
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
X-Inumbo-ID: 56876968-d32c-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680642290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nzP6fmPsLpxmtr/dHctXT699XVp9501+3aNzUwPLVNM=;
	b=cYMzFtJ+W6fEGyny5QnxWoAs17dHAjvd/g+STtG7QlTGiiYriSWNJaj6fITNe69asaYeft
	0QXhIbI9B9rcDw+yCL9/yx9lVhU7i6mEA5wRcr5GOZW65eHKLLfIylle4SMA/gWAeRsWwx
	9/jgU39MnuojQP+GPqr/uv7OZAymb1M=
X-MC-Unique: DimVpMkPOYuLTzIRXxdNzg-1
Date: Tue, 4 Apr 2023 17:04:42 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Julia Suvorova <jusual@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
	Coiby Xu <Coiby.Xu@gmail.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
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
Subject: Re: [PATCH 00/13] block: remove aio_disable_external() API
Message-ID: <20230404210442.GC603232@fedora>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <261efade-683e-84dc-d402-7143be7199c3@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="snMIsWYZfG/EJhXo"
Content-Disposition: inline
In-Reply-To: <261efade-683e-84dc-d402-7143be7199c3@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8


--snMIsWYZfG/EJhXo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 03:43:20PM +0200, Paolo Bonzini wrote:
> On 4/3/23 20:29, Stefan Hajnoczi wrote:
> > The aio_disable_external() API temporarily suspends file descriptor mon=
itoring
> > in the event loop. The block layer uses this to prevent new I/O request=
s being
> > submitted from the guest and elsewhere between bdrv_drained_begin() and
> > bdrv_drained_end().
> >=20
> > While the block layer still needs to prevent new I/O requests in drained
> > sections, the aio_disable_external() API can be replaced with
> > .drained_begin/end/poll() callbacks that have been added to BdrvChildCl=
ass and
> > BlockDevOps.
> >=20
> > This newer .bdrained_begin/end/poll() approach is attractive because it=
 works
> > without specifying a specific AioContext. The block layer is moving tow=
ards
> > multi-queue and that means multiple AioContexts may be processing I/O
> > simultaneously.
> >=20
> > The aio_disable_external() was always somewhat hacky. It suspends all f=
ile
> > descriptors that were registered with is_external=3Dtrue, even if they =
have
> > nothing to do with the BlockDriverState graph nodes that are being drai=
ned.
> > It's better to solve a block layer problem in the block layer than to h=
ave an
> > odd event loop API solution.
> >=20
> > That covers the motivation for this change, now on to the specifics of =
this
> > series:
> >=20
> > While it would be nice if a single conceptual approach could be applied=
 to all
> > is_external=3Dtrue file descriptors, I ended up looking at callers on a
> > case-by-case basis. There are two general ways I migrated code away from
> > is_external=3Dtrue:
> >=20
> > 1. Block exports are typically best off unregistering fds in .drained_b=
egin()
> >     and registering them again in .drained_end(). The .drained_poll() f=
unction
> >     waits for in-flight requests to finish using a reference counter.
> >=20
> > 2. Emulated storage controllers like virtio-blk and virtio-scsi are a l=
ittle
> >     simpler. They can rely on BlockBackend's request queuing during dra=
in
> >     feature. Guest I/O request coroutines are suspended in a drained se=
ction and
> >     resume upon the end of the drained section.
>=20
> Sorry, I disagree with this.
>=20
> Request queuing was shown to cause deadlocks; Hanna's latest patch is pil=
ing
> another hack upon it, instead in my opinion we should go in the direction=
 of
> relying _less_ (or not at all) on request queuing.
>=20
> I am strongly convinced that request queuing must apply only after
> bdrv_drained_begin has returned, which would also fix the IDE TRIM bug
> reported by Fiona Ebner.  The possible livelock scenario is generally not=
 a
> problem because 1) outside an iothread you have anyway the BQL that preve=
nts
> a vCPU from issuing more I/O operations during bdrv_drained_begin 2) in
> iothreads you have aio_disable_external() instead of .drained_begin().
>=20
> It is also less tidy to start a request during the drained_begin phase,
> because a request that has been submitted has to be completed (cancel
> doesn't really work).
>=20
> So in an ideal world, request queuing would not only apply only after
> bdrv_drained_begin has returned, it would log a warning and .drained_begi=
n()
> should set up things so that there are no such warnings.

That's fine, I will give .drained_begin/end/poll() a try with virtio-blk
and virtio-scsi in the next revision.

Stefan

--snMIsWYZfG/EJhXo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQskOoACgkQnKSrs4Gr
c8jsQAf+PJyaSj96NmHb9lkSsM0rDSEoQ56fJV7vTR+eUUuvgwbRl1u07Nrka9s6
mwJjQLVUZpsLuOTCC1ZOvePeeo0daHHZ6pkLMI9xTh2noy8/ka3KUSkbYAE2y8+/
CYqbu19QuEIEEjjPEXl7xda50dSz16N27J+A367ZKS2jcB+p4hr73gII1vLwCnbi
3xuLsNRy/f9mcOiv+30w/fiGLxmVDYlq/5msaY5JlLkNzbeAWC4s06Pcvoxa71Jr
RgB1YLWcwI5x+AIZQ6Je1bZyK5beUHJGxIKEkAq5CyiaDaBCwRpoiuFAbI4lXz4X
2Pwa17IPZ6Zgqvf4L6E9LAMB/nCygA==
=UdcK
-----END PGP SIGNATURE-----

--snMIsWYZfG/EJhXo--


