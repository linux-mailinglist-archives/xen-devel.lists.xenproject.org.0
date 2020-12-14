Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD092D9D00
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 17:57:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52442.91489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kor9k-0000mk-LL; Mon, 14 Dec 2020 16:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52442.91489; Mon, 14 Dec 2020 16:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kor9k-0000mL-He; Mon, 14 Dec 2020 16:57:04 +0000
Received: by outflank-mailman (input) for mailman id 52442;
 Mon, 14 Dec 2020 16:57:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yspo=FS=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1kor9j-0000mG-EK
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:57:03 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c89a3f52-eed2-49d5-9abc-09d5230136e7;
 Mon, 14 Dec 2020 16:57:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-UWI2jJIwONaDWDAti9D55g-1; Mon, 14 Dec 2020 11:57:00 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54F83800400;
 Mon, 14 Dec 2020 16:56:58 +0000 (UTC)
Received: from localhost (ovpn-113-200.ams2.redhat.com [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5116977BE1;
 Mon, 14 Dec 2020 16:56:50 +0000 (UTC)
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
X-Inumbo-ID: c89a3f52-eed2-49d5-9abc-09d5230136e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607965022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vy11eL4SPTpFH8ha19SW6rVhq3mxfKeo6GeSoh9uImw=;
	b=Shi8lbdXJZmo2UuY9w55nS4kZkJQcCrUUtGrleD9p0liMR7q6ZMYo9/T5XgXUY2bZ/0Vmc
	AsgjuY8nruRQ+ilzNVs7rU5xDBbgeXEFUJOgLTkokT+v1ch1IamCFe4q/fs/y199vKcrdO
	14B2pewe7InDRoWZ/+EGhhYyl/iaB/U=
X-MC-Unique: UWI2jJIwONaDWDAti9D55g-1
Date: Mon, 14 Dec 2020 16:56:50 +0000
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
Subject: Re: [PATCH v3 01/13] qemu/atomic: Drop special case for unsupported
 compiler
Message-ID: <20201214165650.GG620320@stefanha-x1.localdomain>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-2-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iJXiJc/TAIT2rh2r"
Content-Disposition: inline

--iJXiJc/TAIT2rh2r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 05:47:40PM +0400, marcandre.lureau@redhat.com wrote=
:
> From: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20
> Since commit efc6c070aca ("configure: Add a test for the
> minimum compiler version") the minimum compiler version
> required for GCC is 4.8, which has the GCC BZ#36793 bug fixed.
>=20
> We can safely remove the special case introduced in commit
> a281ebc11a6 ("virtio: add missing mb() on notification").
>=20
> With clang 3.4, __ATOMIC_RELAXED is defined, so the chunk to
> remove (which is x86-specific), isn't reached either.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Reviewed-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/atomic.h | 17 -----------------
>  1 file changed, 17 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--iJXiJc/TAIT2rh2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/XmVEACgkQnKSrs4Gr
c8jjJQgAo8d7/t5LGnL7hwWSSveWGkFFsOOGo/SVqa4OJ7XBEP26SZ7KCL5QIHYz
WGIKZI+jjROvOYI0wqtxkv/4VVxbD8Dbd5XsndSAKWBq/LPt18XYuFhmO2pLWOGy
r6zWizooyUsOPqvkOt4Oud3AWqCiWyDykKtnRhYOV07sv2TAnaR0LpoB6c0khohS
6hjCjj2GK2KuajUtwaVGbF/C12RYeAbnpy0bwzU+rKDFNcqII4VCEhkmYXZ5hhd5
aPASx3NU4L3cCK3RM7yhlHNsyk8fP/eeQhSarqTQy/uBQQvFHudI9xpk2fkDWbo5
7+NeGO0qXKCzVz6wmVob7FXMYCJK0Q==
=BDgQ
-----END PGP SIGNATURE-----

--iJXiJc/TAIT2rh2r--


