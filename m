Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124001ECD95
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 12:31:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgQgF-0003Do-Ig; Wed, 03 Jun 2020 10:31:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnGI=7Q=redhat.com=phrdina@srs-us1.protection.inumbo.net>)
 id 1jgQgE-0003Dj-K1
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 10:31:30 +0000
X-Inumbo-ID: 619c62b0-a585-11ea-acd7-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 619c62b0-a585-11ea-acd7-12813bfff9fa;
 Wed, 03 Jun 2020 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591180287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eplq3qDmNGcf1W708KD7q7ueZA7JgQRUtchbp+fE59Q=;
 b=Ib2MylZ4H4Yc7b9gjOf5OT4Z/oLNiiVp+JdOUdZkO9evXR0etpq0ymBAmQnmwIwI2v/Zhj
 thOD7+RPOs136QmXKWmxKfI5ySMb/zf3HojUkgzQDgz883p/xxrpQQNVQfjS8/uc4/jNKq
 KiCSR2EUoY8zTqi7BwMIAxLjww+s/qY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-Os11wg3GOE67oqNX6TQE1g-1; Wed, 03 Jun 2020 06:31:17 -0400
X-MC-Unique: Os11wg3GOE67oqNX6TQE1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CB5F1005510;
 Wed,  3 Jun 2020 10:31:16 +0000 (UTC)
Received: from antique-laptop (unknown [10.40.194.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4098C5117E;
 Wed,  3 Jun 2020 10:31:12 +0000 (UTC)
Date: Wed, 3 Jun 2020 12:31:09 +0200
From: Pavel Hrdina <phrdina@redhat.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH] autogen.sh: Restore --no-git (avoid git submodule update)
Message-ID: <20200603103109.GA11390@antique-laptop>
References: <20200602154745.15054-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
In-Reply-To: <20200602154745.15054-1-ian.jackson@eu.citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
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

--45Z9DzgjV8m4Oswq
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

To be honest I don't understand why would anyone want to keep track of
all submodules of all projects for any CI and update it manually every
time the upstream project changes these submodules. Sounds like a lot
of unnecessary work but maybe I'm missing something.

> Despite to the old documentation comments referring only to gnulib,
> the --no-git feature is required not only because of gnulib but also
> because of the other submodule, src/keycodemapdb.
>=20
> (And in any case, even if it were no longer required because all the
> submodules were removed, it ought ideally to have been retained as a
> no-op for compaibility reasons.)

Well, we will break a lot more by switching to Meson build system where
everyone building libvirt will have to change their scripts as it will
not be compatible at all.

Pavel

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
> +fi
> =20
>  autoreconf --verbose --force --install || exit 1
> =20
> --=20
> 2.11.0
>=20

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEcbzs91ho/coWWY7aUi1kczAH4YwFAl7Xe+0ACgkQUi1kczAH
4Yw/eQ//VI3yZCI1HsDahzC2XRk1jJnfstDdfa9DtytOqHhS8QuTRg10y7NGBl1Q
QbdOH/fmBnMUPKyl/eYZSFumu8q8CDjw6LvFpcjFad2poh16QF2y8qNbn8yr+mCp
wvI2mqTgymvrBfP9MENZzkgJBNe9GFsESnPW7iuSzSfVlICoF9bWRTQZFVbR8PvD
xRw3Mun8I7ocisqDQglsu5zyFpKlZP8IuvBQXvg10vxZE5tPojraLmPNhnigMQmh
wdSBP0ENZiCJoBRdf7j2ZhHoOCnoyxiXlFzCHg48sZa8BUI2qiaWb6I2yU8lQEpF
4WUxM+T6Q/IfRUBXYzvDz/GI41WTHAu9qSGf8GSrHHTAXUHpqmndsAngdqRwTfhH
T+sNpVSU1D87vnDJCD0X+J8JnBQ89SNf83pU3VvnrjwAHvuEmxqUmpTY2isjKJbd
HCzduU3WoiZr9dB/VH9pIBlTbk4OwIHc8DB/k2Dwh8P9kRl5QU964/fTj/lYU715
Nvuw8MN2CibaVDu1F37JYJQYmi1NVJn+hxee3YLNbgDPMODTalbKg5XfDy9lOfGu
luWY1Ucdy2sjVdVffkOrZMP9e5AvL9AM/8fDGGBWhfsydYFZPZuddzweLSTHYWIw
gUeJ+XwUztir7/cZmia4b2UC+RJm8pHpxjUgwkBtUXCEj9zPgvU=
=46Cx
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--


