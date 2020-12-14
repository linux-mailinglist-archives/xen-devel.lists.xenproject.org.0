Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CDA2D9D06
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 17:57:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52447.91501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1korAT-0000sc-0C; Mon, 14 Dec 2020 16:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52447.91501; Mon, 14 Dec 2020 16:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1korAS-0000sD-Sp; Mon, 14 Dec 2020 16:57:48 +0000
Received: by outflank-mailman (input) for mailman id 52447;
 Mon, 14 Dec 2020 16:57:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yspo=FS=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1korAR-0000s6-2Q
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:57:47 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a11fc9f2-d671-4fbf-ad33-77c01b78d4ec;
 Mon, 14 Dec 2020 16:57:46 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-dOTt1Uv3MgeXrCvhXQnztA-1; Mon, 14 Dec 2020 11:57:42 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 007DB1006C85;
 Mon, 14 Dec 2020 16:57:41 +0000 (UTC)
Received: from localhost (ovpn-113-200.ams2.redhat.com [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6D352BCD0;
 Mon, 14 Dec 2020 16:57:32 +0000 (UTC)
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
X-Inumbo-ID: a11fc9f2-d671-4fbf-ad33-77c01b78d4ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607965066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nzkkrxNsf/tKSpJy0Ol/DYhuNPJEQyRqILQRkCfzVFw=;
	b=OKK/22HEkZddUhpVI8gVNgUxzULUXeTxVv5VsJNn4NTD38eTo/2ird+4hsow3bojQmk7yX
	HbnylFKtpr1NuTIP2qW3otBjWniwyljBnV+T5Z8cC4gDoVvvUY3FjCgAUVVE/ARgYnDtyl
	+ABU5mG15gwtO5BhkPfhN0acSUgFOr8=
X-MC-Unique: dOTt1Uv3MgeXrCvhXQnztA-1
Date: Mon, 14 Dec 2020 16:57:31 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, philmd@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>, Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org, Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 06/13] virtiofsd: replace _Static_assert with
 QEMU_BUILD_BUG_ON
Message-ID: <20201214165731.GH620320@stefanha-x1.localdomain>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-7-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-7-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Enx9fNJ0XV5HaWRu"
Content-Disposition: inline

--Enx9fNJ0XV5HaWRu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 05:47:45PM +0400, marcandre.lureau@redhat.com wrote=
:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> This allows to get rid of a check for older GCC version (which was a bit
> bogus too since it was falling back on c++ version..)
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tools/virtiofsd/fuse_common.h | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Enx9fNJ0XV5HaWRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/XmXsACgkQnKSrs4Gr
c8hM/QgAo7goQSbSjtniQApqy5STJw15VfReJdpV17jhRtfEYUPuLzhVUULS8G8b
WI0xMh1L83QCQmaFxogrLPGI+zXM+slDrmn/zPcX3tyVXcs6UfJw6hbV2gk1y8fA
kOCUVF1aTRe5M2SezgchbA6badCZ+Wv28xdAqvVbARJXOKKDWP3lZwaKsUESu9Os
JyzoFCOajcEZru/pMKpd3DYKKjmHyr+AWMaY3+LEXAjJYi2SZfuTNDb30aiomP9N
9ArM4OFuww0DmiKzYaOA8IurGv3KSXFbxMyckl05OKHW18iAjX2e9o7lXe3OFFOO
LI+MK8lFJx1vbKX7lBL8Li1tsThXnA==
=jtpu
-----END PGP SIGNATURE-----

--Enx9fNJ0XV5HaWRu--


