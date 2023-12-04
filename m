Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F6A803784
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647083.1009795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAHu-0001S5-N8; Mon, 04 Dec 2023 14:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647083.1009795; Mon, 04 Dec 2023 14:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAHu-0001QM-KY; Mon, 04 Dec 2023 14:51:10 +0000
Received: by outflank-mailman (input) for mailman id 647083;
 Mon, 04 Dec 2023 14:51:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PgPa=HP=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAAHt-0001Q8-48
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:51:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8df6a82c-92b4-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 15:51:08 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-7kVZWR21Pym7Nfk5yaUfnQ-1; Mon, 04 Dec 2023 09:51:04 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6976685A59D;
 Mon,  4 Dec 2023 14:51:03 +0000 (UTC)
Received: from localhost (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C43E440C6EB9;
 Mon,  4 Dec 2023 14:51:02 +0000 (UTC)
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
X-Inumbo-ID: 8df6a82c-92b4-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701701466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xEOIXWa0DaRIIsxxh+p/yqRV4ny33fxYNbdSCdVwz7E=;
	b=JJ0te5dURjetktuKM6aa8Gm4BKdjtXzGlSRyL8wQ/7txs8PI216obBMk/jCrf5Gy2ENO+4
	lNxKZBwXYbnIZVl3om3C6cwH7oXHwWoiSCJxPM1XhMZzt+6OGy7Oy3dHCmzC1JAEzGZHGx
	LW0URNtHrAhuTwSGrgBSm+FSblEt/7E=
X-MC-Unique: 7kVZWR21Pym7Nfk5yaUfnQ-1
Date: Mon, 4 Dec 2023 09:51:01 -0500
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
Subject: Re: [PATCH 01/12] virtio-scsi: replace AioContext lock with
 tmf_bh_lock
Message-ID: <20231204145101.GB1492005@fedora>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-2-stefanha@redhat.com>
 <ZW3KFQ3PsdbVFymi@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mjl6rdY6Uz2gkcPm"
Content-Disposition: inline
In-Reply-To: <ZW3KFQ3PsdbVFymi@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2


--mjl6rdY6Uz2gkcPm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 01:46:13PM +0100, Kevin Wolf wrote:
> Am 29.11.2023 um 20:55 hat Stefan Hajnoczi geschrieben:
> > Protect the Task Management Function BH state with a lock. The TMF BH
> > runs in the main loop thread. An IOThread might process a TMF at the
> > same time as the TMF BH is running. Therefore tmf_bh_list and tmf_bh
> > must be protected by a lock.
> >=20
> > Run TMF request completion in the IOThread using aio_wait_bh_oneshot().
> > This avoids more locking to protect the virtqueue and SCSI layer state.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> The second part reminds me that the implicit protection of the virtqueue
> and SCSI data structures by having all accesses in a single thread is
> hard to review and I think we wanted to put some assertions there to
> check that we're really running in the right thread. I don't think we
> have done that so far, so I suppose after this patch would be the place
> in the series to add them, before we remove the protection by the
> AioContext lock?

Thanks for reminding me. I will add assertions in the next revision of
this series.

Stefan

--mjl6rdY6Uz2gkcPm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVt51UACgkQnKSrs4Gr
c8hFWgf+I5YP/4aOTKFaILLn7G6zRxMS0IOYp/agq08hZZX5uuODZdNJUtpvigRH
223SAFBeEWaIbzUlnbaUtw7/jucFuBfA6WsxCM9wwr/iL0AH9pHzDjnfY3XbJIyp
JsKSmTxS18OXWoK+mhrD6avFK8h9UKa+L5VV74gzbnjSmpQIBwXsSVzBjmton24v
c2tQIyRtBQiwZkgRJSa8GgzB4OPrXIQ9u0WfjXx0tOOJAXcIrTOPu6TYFDM/BbWH
6DP0WCKwetByfeC8aMEnU4F1weafWWk5xEeX5cQRWsECNbgyqIgfBTK8PgOSqC0M
bO4Kx4X2LBokyHJOzdsOT29Qh9pNvQ==
=xK/8
-----END PGP SIGNATURE-----

--mjl6rdY6Uz2gkcPm--


