Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9792AB4C1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 11:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22307.48575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc4Jp-0006AZ-Jq; Mon, 09 Nov 2020 10:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22307.48575; Mon, 09 Nov 2020 10:22:37 +0000
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
	id 1kc4Jp-0006AA-G5; Mon, 09 Nov 2020 10:22:37 +0000
Received: by outflank-mailman (input) for mailman id 22307;
 Mon, 09 Nov 2020 10:22:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jc/Q=EP=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1kc4Jo-0006A5-4l
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:22:36 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6052f51f-325e-4601-9439-fd8f5ad07eed;
 Mon, 09 Nov 2020 10:22:34 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-I_sUUytpNla_sXK2O1mUPw-1; Mon, 09 Nov 2020 05:22:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C02131084C8F;
 Mon,  9 Nov 2020 10:22:26 +0000 (UTC)
Received: from localhost (ovpn-114-110.ams2.redhat.com [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D8985D9DD;
 Mon,  9 Nov 2020 10:22:10 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jc/Q=EP=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
	id 1kc4Jo-0006A5-4l
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:22:36 +0000
X-Inumbo-ID: 6052f51f-325e-4601-9439-fd8f5ad07eed
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 6052f51f-325e-4601-9439-fd8f5ad07eed;
	Mon, 09 Nov 2020 10:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604917353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fvP8UJpz4riRKthWscMZ00xlDbEYu80keBJwGqqSMOE=;
	b=aumEm1BQiWsEY/9fPJkWEcC+J3tNGAuuStz1sz061yEn2cbmbE/xFVOJ0/mGqOBUTvLMbj
	XEvSqdnEm9L0mVzFmax2+VHoPXRso+cA4kGUdLuLVB5WgcvvkchfZl6Pv+ab1WvXk2Tb1/
	kSgQDJadu/MUnB7XVvQEB0sbQGrp/mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-I_sUUytpNla_sXK2O1mUPw-1; Mon, 09 Nov 2020 05:22:29 -0500
X-MC-Unique: I_sUUytpNla_sXK2O1mUPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C02131084C8F;
	Mon,  9 Nov 2020 10:22:26 +0000 (UTC)
Received: from localhost (ovpn-114-110.ams2.redhat.com [10.36.114.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D8985D9DD;
	Mon,  9 Nov 2020 10:22:10 +0000 (UTC)
Date: Mon, 9 Nov 2020 10:22:09 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 23/24] virtio-blk: remove a spurious call to
 revalidate_disk_size
Message-ID: <20201109102209.GF783516@stefanha-x1.localdomain>
References: <20201106190337.1973127-1-hch@lst.de>
 <20201106190337.1973127-24-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201106190337.1973127-24-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7cm2iqirTL37Ot+N"
Content-Disposition: inline

--7cm2iqirTL37Ot+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2020 at 08:03:35PM +0100, Christoph Hellwig wrote:
> revalidate_disk_size just updates the block device size from the disk
> size.  Thus calling it from revalidate_disk_size doesn't actually do
> anything.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/virtio_blk.c | 1 -
>  1 file changed, 1 deletion(-)

Modulo Paolo's comment:

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--7cm2iqirTL37Ot+N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+pGFEACgkQnKSrs4Gr
c8hPvggAiEUoB55Y2NWYKmWp20Pqz66o8MfxgXahkbbIj6hWGOJZ5M8cZD5dmb6h
xlDynJx6PzDey/2EstgMWAWpt5QFnKiPDSY+t/UjxpkAXqacgWSnNXhedkDGlczW
4LP5GspHB7zun1KHAcMpcXo6Uet85t5RPsKZqqkp1hRsIMjzKScj4Kan0b65BS0V
J6vUVDQnwVqn8DI38Ebm0r6TWG3PorXZ/SanjhCB9wbuGw3dX6X9aAk2XY8Ybwa6
34P5kZN1RxaqPNFYU0r3gcIWvi8CdCB6XE1Q4OM0ahxmoN4Y4pJcGA0XDZI1N7ei
35TRtk3FCvvJK8X13zk4enPGeLZiYQ==
=JdMU
-----END PGP SIGNATURE-----

--7cm2iqirTL37Ot+N--


