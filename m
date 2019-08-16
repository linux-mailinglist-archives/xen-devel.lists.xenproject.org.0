Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EACE90118
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:08:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyayX-0007vI-R1; Fri, 16 Aug 2019 12:04:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y8AI=WM=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
 id 1hyayW-0007v2-8D
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 12:04:56 +0000
X-Inumbo-ID: 0d058648-c01e-11e9-aee9-bc764e2007e4
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d058648-c01e-11e9-aee9-bc764e2007e4;
 Fri, 16 Aug 2019 12:04:53 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46927M0thdz9sML; Fri, 16 Aug 2019 22:04:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565957087;
 bh=1OQXK0o9OvoNPapWpbimPbhqPrE5Qa0PGQHKlRYcMkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wekzw6zxxq4IvC7+Zbnwqdia1xVqewDn7eX7Ht9Y83gQasjzBhjYu5PoAd/WiLpW0
 0PKntAaqTZcpID4Z8EVVQ0BYFf4MjOJ+3toNPAxMyQTRRcgQcAbv4eU/EBfCSgFmWB
 Crykn4dJVY56dnF3V1Dz6Ofl/uRZ25H6HxZL3I/0=
Date: Fri, 16 Aug 2019 21:43:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190816114305.GB2259@umbus.fritz.box>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
 SPARCv9 MMU TTE
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, balrogg@gmail.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 amarkovic@wavecomp.com, jan.kiszka@web.de, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 robh@kernel.org, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, lersek@redhat.com,
 Andrew.Baumann@microsoft.com, mreitz@redhat.com, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, jslaby@suse.cz, marex@denx.de, proljc@gmail.com,
 marcandre.lureau@redhat.com, alistair@alistair23.me, paul.durrant@citrix.com,
 tony.nguyen@bt.com, xiaoguangrong.eric@gmail.com, huth@tuxfamily.org,
 jcd@tribudubois.net, pbonzini@redhat.com, stefanb@linux.ibm.com
Content-Type: multipart/mixed; boundary="===============8967198967169135979=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8967198967169135979==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2019 at 11:58:05AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Tony,
>=20
> On 8/16/19 8:28 AM, tony.nguyen@bt.com wrote:
> > This patchset implements the IE (Invert Endian) bit in SPARCv9 MMU TTE.
> >=20
> > v7:
> [...]
> > - Re-declared many native endian devices as little or big endian. This =
is why
> >   v7 has +16 patches.
>=20
> Why are you doing that? What is the rational?
>=20
> Anyhow if this not required by your series, you should split it out of
> it, and send it on your principal changes are merged.
> I'm worried because this these new patches involve many subsystems (thus
> maintainers) and reviewing them will now take a fair amount of time.
>=20
> > For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
> > targets from the set of target/hw/*/device.o.
> >
> > If the set of targets are all little or all big endian, re-declare
> > the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
> > respectively.
>=20
> If only little endian targets use a device, that doesn't mean the device
> is designed in little endian...
>=20
> Then if a big endian target plan to use this device, it will require
> more work and you might have introduced regressions...

Uh.. only if they make the version of the device on a big endian
target big endian.  Which is a terrible idea - if you know a hardware
designer planning to do this, please slap them.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1WlskACgkQbDjKyiDZ
s5K9oQ//Uuo9cWWmd396i/MdQyddqKELOko009vf2k8wlEaysKrMpuKkkj7EV4Lz
x+MQYyqEBAZMLC5KoTeSRYHynyRTPSBOURxhQNkH4Nqj3Skxr9buvX4pqhNLhmLE
A8tSn3paa4N5GKXbgt4fOiNwBXxnrcAQgmruCbyvO7NKXPmZyTSQxJkR8VHE/qxK
LWKEgA/bjyloFI7OwpWW0rc0LdqmDljy4NKmfHsFxlZdc+TlcM2PgkYPBdRMf5SH
Nlj3YvXrsxa1gfrGLou/tlS9WHyKxl7K1DSbh42ObtrBKtc6z9aPY9+mi1moAJLi
/CpHM3SbdY4j1mGPk5/TZBul+m7spkoJfDB0A/mwb5pTLsZKO0fIOThUkjlCD32D
It90f2Y2I+omAnGOs8nX52SOoNfUwB6vtA4ThBEXzKSOOepPuL5dgSmJ8sGUn1GY
eckRx2z4Emap23L0WavytQ+oaQW8PrhfMFUBWS1DSh/uPVUs1m4Zcs2Q8siBRXZJ
J70alEhGvbhch2+S5q69iYIvljVoMcA1DjHc06WTwZOatjUdjJAQpMLidpH03+UC
AKeSvwpEA5yvuxCfLuThYD+6MeEGyVtH/IEKqSLE7IFVp2VBeqZ4tNKN41Fw/aQH
t3Q5LKmwmLKiyzHZSFM5JmNuyjmdwG56N4INLGlLEAPy9F40PR0=
=nw08
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--


--===============8967198967169135979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8967198967169135979==--

