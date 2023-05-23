Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE9670E0EA
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 17:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538536.838548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1UGE-0007pm-9H; Tue, 23 May 2023 15:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538536.838548; Tue, 23 May 2023 15:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1UGE-0007mh-5w; Tue, 23 May 2023 15:49:18 +0000
Received: by outflank-mailman (input) for mailman id 538536;
 Tue, 23 May 2023 15:49:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZ9c=BM=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q1UGC-0005mv-CU
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 15:49:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dcc5c3e-f981-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 17:49:14 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-ydMYk082PL-T9DEkukad9A-1; Tue, 23 May 2023 11:48:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8706629AA3B0;
 Tue, 23 May 2023 15:48:20 +0000 (UTC)
Received: from localhost (unknown [10.39.195.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06F37C5146F;
 Tue, 23 May 2023 15:48:19 +0000 (UTC)
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
X-Inumbo-ID: 5dcc5c3e-f981-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684856953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rQ6nlvqTSvY4+s9JAwczIEJjWTozdr3kOea/XsYr2bY=;
	b=XybKL35SLveJARaInMFrMuAvJbKeTnEBrbouGBp0fZNkg9B9HLjbns0MWwe2iy168Kn7bF
	Gn1iNTehKw+VupZ53Kg4Gih6+FKlMdEgB3KcjWJWn64He2oUQNXWrjtUeprnlYmfKKKbih
	6HPF0rpGq4r/uUqNy2IAbDARSu8EmqQ=
X-MC-Unique: ydMYk082PL-T9DEkukad9A-1
Date: Tue, 23 May 2023 11:48:18 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	Julia Suvorova <jusual@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 3/6] block/blkio: convert to blk_io_plug_call() API
Message-ID: <20230523154818.GE96478@fedora>
References: <20230517221022.325091-1-stefanha@redhat.com>
 <20230517221022.325091-4-stefanha@redhat.com>
 <wtyut5kd4v5vapon7fzpvi3kghvpplokcas5ovcwnjhiwyuccb@rm6eb6jjhhp5>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y9sI4btH/QqT9qV/"
Content-Disposition: inline
In-Reply-To: <wtyut5kd4v5vapon7fzpvi3kghvpplokcas5ovcwnjhiwyuccb@rm6eb6jjhhp5>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8


--y9sI4btH/QqT9qV/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 10:47:00AM +0200, Stefano Garzarella wrote:
> On Wed, May 17, 2023 at 06:10:19PM -0400, Stefan Hajnoczi wrote:
> > Stop using the .bdrv_co_io_plug() API because it is not multi-queue
> > block layer friendly. Use the new blk_io_plug_call() API to batch I/O
> > submission instead.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > block/blkio.c | 40 +++++++++++++++++++++-------------------
> > 1 file changed, 21 insertions(+), 19 deletions(-)
>=20
> With this patch, the build fails in several places, maybe it's an old
> version:
>=20
> ../block/blkio.c:347:5: error: implicit declaration of function
> =E2=80=98blk_io_plug_call=E2=80=99 [-Werror=3Dimplicit-function-declarati=
on]
>   347 |     blk_io_plug_call(blkio_unplug_fn, bs);

Will fix, thanks!

Stefan

--y9sI4btH/QqT9qV/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRs4EIACgkQnKSrs4Gr
c8jxMgf/ZdgG8aDCuwHwEH9aJ8kuEqAjFKKDKa/eAzlnouLXNCYig1RhfL9cDWaZ
4Zd/vBacIMN9YdG/gtrMl8iJlbz8fzNj9XqZnQuEByHQg82r/8+ehKP1tP+lhLWY
92jI+7BiJGCzg7nmFPW9CnADyWDmDvkWgmpXuLOZNGn9O3VTFLlmSjGv0BXi7kUT
pAIPfTrIanIJgLykGqSe606MCIo0aAefJ5zqAUhxT5jAk3R49722wMXYNbG2huFC
gWm3wH6hcTqRYpfbHZNo2hgz0PwEBqETuoH6VpylmcU8PLp54faw7euHo7eEqF1R
rJs7BnbeXR/04nOSnMfHWnLiql1OZw==
=duel
-----END PGP SIGNATURE-----

--y9sI4btH/QqT9qV/--


