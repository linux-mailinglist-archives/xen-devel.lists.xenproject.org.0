Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9584F6FCFC5
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 22:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532570.828781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwUBW-0005ck-Un; Tue, 09 May 2023 20:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532570.828781; Tue, 09 May 2023 20:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwUBW-0005Zs-S7; Tue, 09 May 2023 20:43:46 +0000
Received: by outflank-mailman (input) for mailman id 532570;
 Tue, 09 May 2023 20:43:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hm7m=A6=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pwUBV-0005Zj-5X
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 20:43:45 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2df323d5-eeaa-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 22:43:41 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-h2450ozEN8ukawalTzR5Sg-1; Tue, 09 May 2023 16:43:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42C0F80C8C4;
 Tue,  9 May 2023 20:43:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 394F41121314;
 Tue,  9 May 2023 20:43:34 +0000 (UTC)
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
X-Inumbo-ID: 2df323d5-eeaa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683665019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=73rXAUSbDMMD9aLijjtyw6szEUieY4YD79d0W2REdQU=;
	b=JdltbhtyPtZpUTxq+FUe7F1Pl4hU/F0+3zOkt4niyRjJ8BhDMqtnQJbZXuuEa9iY0nqSJg
	OJ7lBdq9HM6BkhBJARaQMeoHuCCGnzNNBGsmXgHpq1V2jTrYr7ksOBr3XMfXdLUigRYkhy
	FWMkqEr9j/vuxJ2OU9FUs+vSxXX5pUI=
X-MC-Unique: h2450ozEN8ukawalTzR5Sg-1
Date: Tue, 9 May 2023 16:43:32 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Peter Lieven <pl@kamp.de>, Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
	eesposit@redhat.com, Juan Quintela <quintela@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Zhengui Li <lizhengui@huawei.com>,
	Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: Re: [PATCH v5 05/21] virtio-scsi: stop using aio_disable_external()
 during unplug
Message-ID: <20230509204332.GB1165676@fedora>
References: <20230504195327.695107-1-stefanha@redhat.com>
 <20230504195327.695107-6-stefanha@redhat.com>
 <ZFqXEihzG18me26X@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pP+x37X0vy9h+g7D"
Content-Disposition: inline
In-Reply-To: <ZFqXEihzG18me26X@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3


--pP+x37X0vy9h+g7D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 08:55:14PM +0200, Kevin Wolf wrote:
> Am 04.05.2023 um 21:53 hat Stefan Hajnoczi geschrieben:
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
> > 2. scsi_device_unrealize() already contains a call to
>=20
> I think you mean scsi_qdev_unrealize(). Can be fixed while applying.

Yes, it should be scsi_qdev_unrealize(). I'll review your other comments
and fix this if I need to respin.

Stefan

--pP+x37X0vy9h+g7D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRasHQACgkQnKSrs4Gr
c8idhggAxwT1miphed6iDRzm0lcoIB+ERb0L9uu4SUcMFT6DDuoxIYBkdVwfzFye
/+ZEEQZrR0wW4GassEZR0evyH6N86XQCcbxZieYhvMS4vOlMtn6TLPOBO1kuV7bk
P/c4/aESmuRlERwSQ2xzmc3NsVc6jZI0onjQLNuC4wmEuWszLPfVNJ/oH46QjMOd
n9/RU5gOM/yajjrNHCnCE71xPsWQaP608ibSbsCzLbq9ByeaEqivhU7knUEQFcCC
KWWLL57nVhG2Lvvrjb1NiYDxq4NmadDxVFMQNm8jcqzuxLhZOwTqn1oxQk6A8P/x
A4btIkywXTRHK/EuAXKBCrBh+/7lSw==
=776u
-----END PGP SIGNATURE-----

--pP+x37X0vy9h+g7D--


