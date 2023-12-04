Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEAD80377D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:50:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647078.1009774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAGw-0000Lv-61; Mon, 04 Dec 2023 14:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647078.1009774; Mon, 04 Dec 2023 14:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAGw-0000KY-3C; Mon, 04 Dec 2023 14:50:10 +0000
Received: by outflank-mailman (input) for mailman id 647078;
 Mon, 04 Dec 2023 14:50:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PgPa=HP=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAAGu-0007Vk-9r
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:50:08 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 691e95ec-92b4-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 15:50:06 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-5wDKJD6mPs27fxPG3prMrg-1; Mon, 04 Dec 2023 09:49:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B74B811E8F;
 Mon,  4 Dec 2023 14:49:57 +0000 (UTC)
Received: from localhost (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3903240C6EB9;
 Mon,  4 Dec 2023 14:49:55 +0000 (UTC)
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
X-Inumbo-ID: 691e95ec-92b4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701701404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q15/3BVVyOaihcucEucNKs/jzap+i7xs4+FWf0/CsZk=;
	b=Ost3AWy/dHsq1RQsEKl+UDWP48e3cYiFMOCYJmO/kVxeipKWOo/Lkw5lyJB0XEROYe8m6r
	0Zb7jCnWL2u8CMMTtCzcKd3uIyN/1QpkxzOo6w781FOzVSw0yh19E8f3Ey+ULesqDedV+p
	qvgcGNnoGXlcMx++HIzYKuYizMf6YEg=
X-MC-Unique: 5wDKJD6mPs27fxPG3prMrg-1
Date: Mon, 4 Dec 2023 09:49:54 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Alberto Garcia <berto@igalia.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
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
Subject: Re: [PATCH 01/12] virtio-scsi: replace AioContext lock with
 tmf_bh_lock
Message-ID: <20231204144954.GA1492005@fedora>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-2-stefanha@redhat.com>
 <tng432xox5h3zwi7vkc7nbuu2bckkackqtdifqt2dtsn7t2eti@m2jwhopket2s>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xuVVbWEiWN36eeYa"
Content-Disposition: inline
In-Reply-To: <tng432xox5h3zwi7vkc7nbuu2bckkackqtdifqt2dtsn7t2eti@m2jwhopket2s>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2


--xuVVbWEiWN36eeYa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 09:25:52AM -0600, Eric Blake wrote:
> On Wed, Nov 29, 2023 at 02:55:42PM -0500, Stefan Hajnoczi wrote:
> > Protect the Task Management Function BH state with a lock. The TMF BH
> > runs in the main loop thread. An IOThread might process a TMF at the
> > same time as the TMF BH is running. Therefore tmf_bh_list and tmf_bh
> > must be protected by a lock.
> >=20
> > Run TMF request completion in the IOThread using aio_wait_bh_oneshot().
> > This avoids more locking to protect the virtqueue and SCSI layer state.
>=20
> Are we trying to get this into 8.2?

No. 8.2 still has the AioContext lock is therefore safe without this
patch.

Stefan

>=20
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  include/hw/virtio/virtio-scsi.h |  3 +-
> >  hw/scsi/virtio-scsi.c           | 62 ++++++++++++++++++++++-----------
> >  2 files changed, 43 insertions(+), 22 deletions(-)
> >
>=20
> Reviewed-by: Eric Blake <eblake@redhat.com>
>=20
> --=20
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.
> Virtualization:  qemu.org | libguestfs.org
>=20

--xuVVbWEiWN36eeYa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVt5xIACgkQnKSrs4Gr
c8jrKAgAi9Ez+xTcPA2/0XgPvi0dsAshvngJFgGPGKyor2T6HSiEfY5fZnA+zl/Z
6RqIc79YvldlUyqQVTXHU/H0yF/UW4h9d2gz0nlaCBx/1H0xzbAmLUTMW5bGQ/vT
N5SCBl6RSfDRmU/eZcbrIqHOaphPCeBt4v6mnfrCF5F9XAS/Iarz7MybbHWnZEq3
93KGFY1LBRQIwp/IhNA+lkMxrysBl5fYLCoKaVxj03r5DSP3c/QwSKcy2jyubAG1
SQS2QRmPHmOOK5jyL2mMs6cnUk8spfmqH9BJl/46nXpvYpJ63m/6ujHjfxGbp9EJ
dJdPCfP8N/qcMJGUlSGyGL7UfQp3cQ==
=UZuA
-----END PGP SIGNATURE-----

--xuVVbWEiWN36eeYa--


