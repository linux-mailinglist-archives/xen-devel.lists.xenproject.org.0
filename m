Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B691322476
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 04:08:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88554.166558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEO3A-0008Gc-Aa; Tue, 23 Feb 2021 03:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88554.166558; Tue, 23 Feb 2021 03:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEO3A-0008Fv-4L; Tue, 23 Feb 2021 03:07:48 +0000
Received: by outflank-mailman (input) for mailman id 88554;
 Tue, 23 Feb 2021 03:07:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+Io=HZ=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
 id 1lEO38-0008FS-WC
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 03:07:47 +0000
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0ba089a-7c14-43ae-bf12-77ddea2a4cb9;
 Tue, 23 Feb 2021 03:07:43 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl3rT035vz9sVS; Tue, 23 Feb 2021 14:07:36 +1100 (AEDT)
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
X-Inumbo-ID: c0ba089a-7c14-43ae-bf12-77ddea2a4cb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1614049657;
	bh=1gsrnS8Yqt+OMMNcD8PjrztykA2+tSkcf0+GKbiU8J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OaRH20fHuFVRaWzIJ0EKlAlwQzA+spug1Y4CvlwH/1BYnvoBmPyrKN9ZCnfZ6dGH4
	 uERupAmFnK6R3GPbAYmEtGTzB5U/4LqeJb4KS+9xzi+6s28WmcwSneWRiBHGBy0pkl
	 JZGPIZzI8QcPFt7g813NNMI+x6yC4rJk2ZS6ZCJM=
Date: Tue, 23 Feb 2021 10:33:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Leif Lindholm <leif@nuviainc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Durrant <paul@xen.org>, Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Greg Kurz <groug@kaod.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type() return
 value
Message-ID: <YDQ/Y1KozPSyNGjo@yekko.fritz.box>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-2-philmd@redhat.com>
 <20210222182405.3e6e9a6f.cohuck@redhat.com>
 <bc37276d-74cc-22f0-fcc0-4ee5e62cf1df@redhat.com>
 <20210222185044.23fccecc.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="10TahfdR2kVaNh/t"
Content-Disposition: inline
In-Reply-To: <20210222185044.23fccecc.cohuck@redhat.com>


--10TahfdR2kVaNh/t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 06:50:44PM +0100, Cornelia Huck wrote:
> On Mon, 22 Feb 2021 18:41:07 +0100
> Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrote:
>=20
> > On 2/22/21 6:24 PM, Cornelia Huck wrote:
> > > On Fri, 19 Feb 2021 18:38:37 +0100
> > > Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrote:
> > >  =20
> > >> MachineClass::kvm_type() can return -1 on failure.
> > >> Document it, and add a check in kvm_init().
> > >>
> > >> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > >> ---
> > >>  include/hw/boards.h | 3 ++-
> > >>  accel/kvm/kvm-all.c | 6 ++++++
> > >>  2 files changed, 8 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/include/hw/boards.h b/include/hw/boards.h
> > >> index a46dfe5d1a6..68d3d10f6b0 100644
> > >> --- a/include/hw/boards.h
> > >> +++ b/include/hw/boards.h
> > >> @@ -127,7 +127,8 @@ typedef struct {
> > >>   *    implement and a stub device is required.
> > >>   * @kvm_type:
> > >>   *    Return the type of KVM corresponding to the kvm-type string o=
ption or
> > >> - *    computed based on other criteria such as the host kernel capa=
bilities.
> > >> + *    computed based on other criteria such as the host kernel capa=
bilities
> > >> + *    (which can't be negative), or -1 on error.
> > >>   * @numa_mem_supported:
> > >>   *    true if '--numa node.mem' option is supported and false other=
wise
> > >>   * @smp_parse:
> > >> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > >> index 84c943fcdb2..b069938d881 100644
> > >> --- a/accel/kvm/kvm-all.c
> > >> +++ b/accel/kvm/kvm-all.c
> > >> @@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
> > >>                                                              "kvm-ty=
pe",
> > >>                                                              &error_=
abort);
> > >>          type =3D mc->kvm_type(ms, kvm_type);
> > >> +        if (type < 0) {
> > >> +            ret =3D -EINVAL;
> > >> +            fprintf(stderr, "Failed to detect kvm-type for machine =
'%s'\n",
> > >> +                    mc->name);
> > >> +            goto err;
> > >> +        }
> > >>      }
> > >> =20
> > >>      do { =20
> > >=20
> > > No objection to this patch; but I'm wondering why some non-pseries
> > > machines implement the kvm_type callback, when I see the kvm-type
> > > property only for pseries? Am I holding my git grep wrong? =20
> >=20
> > Can it be what David commented here?
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg784508.html
> >=20
>=20
> Ok, I might be confused about the other ppc machines; but I'm wondering
> about the kvm_type callback for mips and arm/virt. Maybe I'm just
> confused by the whole mechanism?

For ppc at least, not sure about in general, pseries is the only
machine type that can possibly work under more than one KVM flavour
(HV or PR).  So, it's the only one where it's actually useful to be
able to configure this.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--10TahfdR2kVaNh/t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0P2MACgkQbDjKyiDZ
s5IPEw/9Gpfn9x9Uti+grFwBeMIAyCQKsB6yi7YPWIht5HgE4QAKDTgqk/WE1TLr
ZvHKBDOP1v+s0qWO2itu5zE4Sqk1sHgjWurqWMGF1vDq1VT6OKrJ61CSVRhUBS4p
a61Psz/2lnHubEnHTLyo6I8i5PKgvnSxicB5MeoUNOGR+TPZKCF5gVvFLJfrCxF3
tRIhxfFHfP97ykZyO1koej1Dyqt18TW0aDisTC+ID9MoE0hejalyAeBCfX9ooFMM
c7TCcGKwau5nZVm6/Oph8DJftpP4/H2GhlEHYm/BFCHBPTjGiTN26bmxljFojud9
JUNhdDvqeNBmuc1aKrKKblr947BMu5tW3SDfgffU8jrdEK9YBcYuTnM8u2EexX65
SeOmEk8AnZwvBs/fvTIlaPEjLPucNI7YuFATay5Wr0BV8QzPVE8A61bqSPFNE+zG
1hQmfuoXGsUJ4xGazBpJV1P6GAY4TQ8hTfvqDa41+QGkFQjhlpAZ7WFuTAXPLrBL
/7Pnvvlt218Tw02YBkqslu0zFDBn3WVFvphIhIJf5rcvoUeVsZ+ArB593v8YVNEg
cKi9iVZnZH+G8ni6IGkujisqBKea0cvdKmCDu+Poo/ilEGCGKmKxhwgKZaNN7TQe
o1VTLUyFi22ySs0dEdVD3bDFPozkNpYY53nyZNafAVFfsqBmz+M=
=IT+B
-----END PGP SIGNATURE-----

--10TahfdR2kVaNh/t--

