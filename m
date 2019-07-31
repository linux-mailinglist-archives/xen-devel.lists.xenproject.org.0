Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1321A7B72A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 02:25:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hscOi-0005SG-1S; Wed, 31 Jul 2019 00:23:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=onjf=V4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hscOg-0005S5-Si
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 00:23:14 +0000
X-Inumbo-ID: 60719f30-b329-11e9-8d33-c378b4b289ec
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60719f30-b329-11e9-8d33-c378b4b289ec;
 Wed, 31 Jul 2019 00:23:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB855AFEF;
 Wed, 31 Jul 2019 00:23:09 +0000 (UTC)
Message-ID: <eb67ee53b467f292a3f8986b6fc77d23c3d1727f.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>,  "christopher.w.clark@gmail.com"
 <christopher.w.clark@gmail.com>
In-Reply-To: <5e1fadcd-e383-3142-e39b-56bae19c87fb@citrix.com>
References: <20190725005326.3553-1-christopher.w.clark@gmail.com>
 <6166d236-b3ae-e3d6-3a3c-101063d07701@suse.com>
 <5e1fadcd-e383-3142-e39b-56bae19c87fb@citrix.com>
Organization: SUSE
MIME-Version: 1.0
Date: Wed, 31 Jul 2019 02:22:57 +0200
User-Agent: Evolution 3.32.3 
Subject: Re: [Xen-devel] [PATCH] tests/cpu-policy: fix format-overflow
 warning by null terminating strings
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============2276920385273308294=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2276920385273308294==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-2ikcDGr68tapNb/S2cR1"


--=-2ikcDGr68tapNb/S2cR1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-07-30 at 17:23 +0100, Andrew Cooper wrote:
> On 30/07/2019 16:51, Jan Beulich wrote:
> > On 25.07.2019 02:53, christopher.w.clark@gmail.com wrote:
> > > From: Christopher Clark <christopher.w.clark@gmail.com>
> > >=20
> > > gcc 9.1.0 reports:
> > >=20
> > > > test-cpu-policy.c:64:18: error: '%.12s' directive argument is
> > > > not a nul-terminated string [-Werror=3Dformat-overflow=3D]
> > > >    64 |             fail("  Test '%.12s', expected vendor %u,
> > > > got %u\n",
> > > >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > ~~~~~~~~
> > > > test-cpu-policy.c:20:12: note: in definition of macro 'fail'
> > > >    20 |     printf(fmt, ##__VA_ARGS__);                 \
> > > >       |            ^~~
> > > > test-cpu-policy.c:64:27: note: format string is defined here
> > > >    64 |             fail("  Test '%.12s', expected vendor %u,
> > > > got %u\n",
> > > >       |                           ^~~~~
> > > > test-cpu-policy.c:44:7: note: referenced argument declared here
> > > >    44 |     } tests[] =3D {
> > > >       |       ^~~~~
> > In order to possibly create a bug report against gcc I've tried
> > this:
> >=20
> > #include <stdio.h>
> >=20
> > struct s {
> > 	char ac[12];
> > 	int i;
> > };
> >=20
> > void test(const struct s*ps) {
> > 	printf("'%.12s'\n", ps->ac);
> > }
> >=20
> > There's no warning here. Could you check whether the compiler warns
> > on
> > that simple test for you? If it does - are we talking about plain
> > upstream 9.1.0 (in which case I'd be really puzzled by the
> > difference
> > in behavior)?
>=20
> CC Dario who also reported this build failure.
>=20
Yep, this thread was on my radar already. But thanks! :-P

So, I'm using the following gcc (stock opensuse Tumbleweed provided
one):

dario@Palanthas:~/src/xen/xen.git> gcc -v
Using built-in specs.
COLLECT_GCC=3Dgcc
COLLECT_LTO_WRAPPER=3D/usr/lib64/gcc/x86_64-suse-linux/9/lto-wrapper
OFFLOAD_TARGET_NAMES=3Dhsa:nvptx-none
Target: x86_64-suse-linux
Configured with: ../configure --prefix=3D/usr --infodir=3D/usr/share/info -=
-mandir=3D/usr/share/man --libdir=3D/usr/lib64 --libexecdir=3D/usr/lib64 --=
enable-languages=3Dc,c++,objc,fortran,obj-c++,ada,go,d --enable-offload-tar=
gets=3Dhsa,nvptx-none=3D/usr/nvptx-none, --without-cuda-driver --disable-we=
rror --with-gxx-include-dir=3D/usr/include/c++/9 --enable-ssp --disable-lib=
ssp --disable-libvtv --disable-cet --disable-libcc1 --enable-plugin --with-=
bugurl=3Dhttps://bugs.opensuse.org/ --with-pkgversion=3D'SUSE Linux' --with=
-slibdir=3D/lib64 --with-system-zlib --enable-libstdcxx-allocator=3Dnew --d=
isable-libstdcxx-pch --enable-libphobos --enable-version-specific-runtime-l=
ibs --with-gcc-major-version-only --enable-linker-build-id --enable-linux-f=
utex --enable-gnu-indirect-function --program-suffix=3D-9 --without-system-=
libunwind --enable-multilib --with-arch-32=3Dx86-64 --with-tune=3Dgeneric -=
-with-build-config=3Dbootstrap-lto-lean --enable-link-mutex --build=3Dx86_6=
4-suse-linux --host=3Dx86_64-suse-linux
Thread model: posix
gcc version 9.1.1 20190703 [gcc-9-branch revision 273008] (SUSE Linux)


Jan's example above, seem to compile **without any warnings** for me as
well. If I add a main(), I can even get the code above to print the
content of the array.

And yet, building the tools without a patch like Christoper's one
(which was also what I was using locally, and raised to Andy), I get:

make[6]: Entering directory '/build/tools/tests/cpu-policy'
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall -Wstrict-proto=
types -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unuse=
d-local-typedefs   -g3 -O0 -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSIO=
N__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF .test-cpu-policy.o.d -D_LAR=
GEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror -I/build/tools/tests/cpu-poli=
cy/../../../tools/include -D__XEN_TOOLS__ -O3   -c -o test-cpu-policy.o tes=
t-cpu-policy.c=20
test-cpu-policy.c: In function 'main':
test-cpu-policy.c:64:18: error: '%.12s' directive argument is not a nul-ter=
minated string [-Werror=3Dformat-overflow=3D]
   64 |             fail("  Test '%.12s', expected vendor %u, got %u\n",
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
test-cpu-policy.c:20:12: note: in definition of macro 'fail'
   20 |     printf(fmt, ##__VA_ARGS__);                 \
      |            ^~~
test-cpu-policy.c:64:27: note: format string is defined here
   64 |             fail("  Test '%.12s', expected vendor %u, got %u\n",
      |                           ^~~~~
test-cpu-policy.c:44:7: note: referenced argument declared here
   44 |     } tests[] =3D {
      |       ^~~~~

I'm happy to do more tests.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-2ikcDGr68tapNb/S2cR1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1A31kACgkQFkJ4iaW4
c+5LtRAAh3j8jObgZY4kvLlppd4jxDDEGVintTr4YZc1lJnfaIHiZY3zM/DlP6PX
83DUFELO7jGag/C33JVPXDWQA6+2YjSACsREbq6exF9I8JbTVbV4jCURF4hiGtYt
moaWFMG+zGvzGB7TEKtyZ5o91RK5XYLXgZsv1liuJJIk6+IvBjvN13TGmpsR5p+R
GcFXKJF56sJhKksJRFRZEahHG3bm4xS8refBuRXu3prm2R9dB1q3nLROmfuaJcpi
Ta5idAjs2/67Wvdy/hIZzzy2jgbsRY6aqMluDBBzLm1GNV4gORry73g/HnOnoeRA
6jlkfO4Mg/rkeMBubJV7ykAs58bN6rQBWpnciCUFG/0/68EeRZNkaeqH5fL05TX2
mF/djrGG8deuEWbH5wh3MdugRXwlzRJV5ufSa0eAMrBJldFJfWywDqjymcPKLbv+
mJgvRSJnObEOWNXZiquWKC0Vlaz8Adbpd7t70SGgXxpvaPFRY7a1IgzaWCaz1P5f
r1oEzS55RCBsH6cDPN9xVtDCcuob8062nEG1lxOSklBxZ0XtS3fOGyRkSfDsLYvK
syzFs/SUSLCs4JKHlJVPuGdzUPInO0hRX7SI9x8VGxXGaubYRtnj1DDviM3/9X9g
Rv5u5bS0hMbY+NAozbv/nu8x/PX8uTP8QditD+ZDoPsUx/lzRf4=
=B6Z8
-----END PGP SIGNATURE-----

--=-2ikcDGr68tapNb/S2cR1--



--===============2276920385273308294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2276920385273308294==--


