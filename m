Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 723027CACDC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617714.960598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsP8F-0000WZ-HY; Mon, 16 Oct 2023 15:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617714.960598; Mon, 16 Oct 2023 15:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsP8F-0000UC-EJ; Mon, 16 Oct 2023 15:03:47 +0000
Received: by outflank-mailman (input) for mailman id 617714;
 Mon, 16 Oct 2023 15:03:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mfEW=F6=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1qsP8D-0008Sj-4x
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:03:45 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 324ca225-6c35-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:03:44 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-cvyhrphrOLKsjjGo8ZE-0g-1; Mon, 16 Oct 2023 11:03:41 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4B883857B7E;
 Mon, 16 Oct 2023 15:03:39 +0000 (UTC)
Received: from localhost (unknown [10.39.195.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AEA6C15BBC;
 Mon, 16 Oct 2023 15:03:39 +0000 (UTC)
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
X-Inumbo-ID: 324ca225-6c35-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697468622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KpFM4UZyH7tZRzTQzd5Hyyt0ytNKx//41Woy1RTOBjA=;
	b=WD6anzBcFw+fE0jAhh8ilxQhpqk8IZenqx8hkEWdudsMuD6rRRa8369fuslUy+d+IFvgkV
	eOuMw8rIaWsJJvDlsx7BbiE6BOOvN9vaqp7bbRb14Dy7nxLuhj+90/0f7+3sg/x+sM61sz
	NyiKfnCiNKJwfDNGEvdcO6MjRmT5bak=
X-MC-Unique: cvyhrphrOLKsjjGo8ZE-0g-1
Date: Mon, 16 Oct 2023 11:03:38 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	"open list:virtio-blk" <qemu-block@nongnu.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v3 08/78] hw/block: add fallthrough pseudo-keyword
Message-ID: <20231016150338.GD119987@fedora>
References: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
 <88122696480ffb58fa39af81d254aa656afbcd64.1697186560.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3conpdxF4cvXWRP+"
Content-Disposition: inline
In-Reply-To: <88122696480ffb58fa39af81d254aa656afbcd64.1697186560.git.manos.pitsidianakis@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8


--3conpdxF4cvXWRP+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 11:45:36AM +0300, Emmanouil Pitsidianakis wrote:
> In preparation of raising -Wimplicit-fallthrough to 5, replace all
> fall-through comments with the fallthrough attribute pseudo-keyword.
>=20
> Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>  hw/block/dataplane/xen-block.c | 4 ++--
>  hw/block/m25p80.c              | 2 +-
>  hw/block/onenand.c             | 2 +-
>  hw/block/pflash_cfi01.c        | 1 +
>  hw/block/pflash_cfi02.c        | 6 ++++--
>  5 files changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--3conpdxF4cvXWRP+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmUtUMoACgkQnKSrs4Gr
c8j40wf/awIDxB9laWEOFCQZHWk3FLEdHGSb5a0XyPLDAhHe95yPrieUeYNV0Nr+
mjV5cB1GPAE7kPJzirSUlcC5+fvGDB6QnkI3DjUPTulDd8YHZ9LN1CXggaDF7TNh
0Z/Du1IG66k1DND6MxIO5ebtFjUJvMyjxzQCS6iJ6jqF8vG8ahY4oFJGvgNYLEI2
g0JFu2cpN3TdHTKB/GrxQj6xhVkPvnCBa1eapzZ2jSaQuWPt5mv0VCQO9f5LxNHR
nBb+mn7F2uqka3C69tiZF2LfSZThzR3bww4VBC7Z+HBCm42JirMNpQvyIUROpgh2
OInCVpsRPcrQPRmKgGpCQGpdSXo6ew==
=tcx5
-----END PGP SIGNATURE-----

--3conpdxF4cvXWRP+--


