Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE9C1ED1FB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 16:22:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgUGz-0003D4-Ed; Wed, 03 Jun 2020 14:21:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnGI=7Q=redhat.com=phrdina@srs-us1.protection.inumbo.net>)
 id 1jgUGy-0003Cz-8L
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 14:21:40 +0000
X-Inumbo-ID: 8838b3fe-a5a5-11ea-ad2b-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8838b3fe-a5a5-11ea-ad2b-12813bfff9fa;
 Wed, 03 Jun 2020 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591194096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dG/yQ9a63s7lXKLvQbG7qj+rieUda3Umi2z626t+lmM=;
 b=K9ZWXO42oERx2aZNu46gm/rS20+NdEFVkl/9wO+7QGdyM4z6iNlquBAJBmjReLZSYvIir2
 f9ZK/yIYMpSzEfp3pWeulVuwQ4jXU0Zx7Ntf4hVA6QBkzy35+7v3svUllGGR4qo0sgBvxv
 3S6Ym6qu6Q1TXdwKh7rcgjA01+67ClA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-oCDvC9PbNs2o3V9QRXd3ag-1; Wed, 03 Jun 2020 10:21:25 -0400
X-MC-Unique: oCDvC9PbNs2o3V9QRXd3ag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3820B18A0761;
 Wed,  3 Jun 2020 14:21:24 +0000 (UTC)
Received: from antique-laptop (unknown [10.40.194.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D05A60C47;
 Wed,  3 Jun 2020 14:21:20 +0000 (UTC)
Date: Wed, 3 Jun 2020 16:21:17 +0200
From: Pavel Hrdina <phrdina@redhat.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH] autogen.sh: Restore --no-git (avoid git submodule update)
Message-ID: <20200603142117.GD11390@antique-laptop>
References: <20200602154745.15054-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
In-Reply-To: <20200602154745.15054-1-ian.jackson@eu.citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: libvir-list@redhat.com, xen-devel@lists.xenproject.org,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 04:47:45PM +0100, Ian Jackson wrote:
> Prior to 2621d48f005a "gnulib: delete all gnulib integration",
> one could pass ./autogen.sh --no-git to prevent the libvirt build
> system from running git submodule update.
>=20
> This feature is needed by systems like the Xen Project CI which want
> to explicitly control the revisions of every tree.  These will
> typically arrange to initialise the submodules check out the right
> version of everything, and then expect the build system not to mess
> with it any more.
>=20
> Despite to the old documentation comments referring only to gnulib,
> the --no-git feature is required not only because of gnulib but also
> because of the other submodule, src/keycodemapdb.
>=20
> (And in any case, even if it were no longer required because all the
> submodules were removed, it ought ideally to have been retained as a
> no-op for compaibility reasons.)
>=20
> So restore the --no-git feature.
>=20
> Because of the way the argument parsing of autogen.sh works, it is
> easiest to recognise this option only if it comes first.  This works
> for the Xen Project CI, which has always passed this option first.
>=20
> If something else is using this option (and hasn't introduced a
> different workaround in the meantime), not in the first position,
> then perhaps a more sophisticated approach will be needed.  But I
> think this will do for now.
>=20
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
> ---
>  autogen.sh | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/autogen.sh b/autogen.sh
> index 4e1bbceb0a..1c98273452 100755
> --- a/autogen.sh
> +++ b/autogen.sh
> @@ -1,5 +1,10 @@
>  #!/bin/sh
>  # Run this to generate all the initial makefiles, etc.
> +#
> +# THe following options must come first.  All other or subsequent
> +# arguments are passed to configure:
> +#   --no-git   skip `git submodule update --init`
> +
>  test -n "$srcdir" || srcdir=3D$(dirname "$0")
>  test -n "$srcdir" || srcdir=3D.
> =20
> @@ -13,7 +18,11 @@ cd "$srcdir"
>      exit 1
>  }
> =20
> -git submodule update --init || exit 1
> +if [ "x$1" =3D x--no-git ]; then
> +=09shift
> +else
> +=09git submodule update --init || exit 1

I changed the TAB into spaces.

> +fi
> =20
>  autoreconf --verbose --force --install || exit 1

Reviewed-by: Pavel Hrdina <phrdina@redhat.com>

and pushed.

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEcbzs91ho/coWWY7aUi1kczAH4YwFAl7Xsd0ACgkQUi1kczAH
4YwW0A//YKePxHaQmxH2flmbCR5i5WvXmCHbvROj6ql2lKIu9d80NLqICeb8p5UL
iS+S6e+l5L18DmCKT6XYQpIz+oKR7oj+EL/bnt8KF3B+tQS3pXLmTZ7QJeAMXw2a
8KjBH1P5BMQ1/mR8vbF0UKAW/luk1OYSlF/pH74GfK+fqlNP5rJgiIQf/X7m8FsU
2MCPko9JLYdGq959KThgR2WbbibhmhM7iDxxcYzUYpT777bBbCn53Efvdn/2khnA
l4rMe1eAPVFdVPHU62mckLOF7fZFTCicr8BU3JIX87Lx4N4I8TMl+Zd0ZYG0QOX3
lnoNSZBPOtzWPdJb3zLIWIHCm50460jw+SAThsaIa0BbzkcS/Yy40A/K0ynbRPRt
SF+N7PF3+dlOLz9RsNVgKf1/eiNBVNmzLDxYsqp7AatMEftbTnSwXtqc5/tLwWxv
lLufxuc3GBb60M0pum+xzF0CE1IfZXAxOpSTk//gVdjAPasQOJUE6nyWO4iDzPut
raCUVkaGyxazSX/Gu7atOEF6C2qO7VYYhFVsduEMcmza9lzwmjrzvmNBFRQ4RXpU
YIf4PmhdpB8bZxQl8QI8da4Kqibeq3Een0enSM4zXf8gEYDm7BRWUgh1ZAAKfwj8
zTUy5ldjjGyHEt5IMnTGLZkaFZ1mm647dTjElFKUatlPQofCOtg=
=SGHf
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--


