Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3445C322477
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 04:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88553.166548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEO39-0008Fs-U8; Tue, 23 Feb 2021 03:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88553.166548; Tue, 23 Feb 2021 03:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEO39-0008FX-Qc; Tue, 23 Feb 2021 03:07:47 +0000
Received: by outflank-mailman (input) for mailman id 88553;
 Tue, 23 Feb 2021 03:07:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+Io=HZ=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
 id 1lEO37-0008FN-OK
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 03:07:46 +0000
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3df86e6-ed50-437b-9eca-e4f2df1545a8;
 Tue, 23 Feb 2021 03:07:43 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl3rS5NJnz9sTD; Tue, 23 Feb 2021 14:07:36 +1100 (AEDT)
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
X-Inumbo-ID: b3df86e6-ed50-437b-9eca-e4f2df1545a8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1614049656;
	bh=lB2qhVhVvCNwKnLEP9cyVRt4kgQq0RQXnIPlpk7dq2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KFOWhcID0dtdiNAomEpDaPts1jSJ82Ytxndpt+d2goQHThz6ePo193JIsAGJiwYUo
	 P86LbDcu1xNkh2QLXqPt/+rGLma2RlyYfZGg3c2dZ4Rw4FNWTs8HtM/WMOo8D/0hW2
	 WkZKKs7NJTNCZUbJTm/cdhZcKb3yIEEd5MCTIJEI=
Date: Tue, 23 Feb 2021 10:37:01 +1100
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
Message-ID: <YDRAHW1ds1eh0Lav@yekko.fritz.box>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-2-philmd@redhat.com>
 <20210222182405.3e6e9a6f.cohuck@redhat.com>
 <bc37276d-74cc-22f0-fcc0-4ee5e62cf1df@redhat.com>
 <20210222185044.23fccecc.cohuck@redhat.com>
 <YDQ/Y1KozPSyNGjo@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iHciYgIJJ+RNzZ6R"
Content-Disposition: inline
In-Reply-To: <YDQ/Y1KozPSyNGjo@yekko.fritz.box>


--iHciYgIJJ+RNzZ6R
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 10:33:55AM +1100, David Gibson wrote:
> On Mon, Feb 22, 2021 at 06:50:44PM +0100, Cornelia Huck wrote:
> > On Mon, 22 Feb 2021 18:41:07 +0100
> > Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrote:
> >=20
> > > On 2/22/21 6:24 PM, Cornelia Huck wrote:
> > > > On Fri, 19 Feb 2021 18:38:37 +0100
> > > > Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrote:
> > > >  =20
> > > >> MachineClass::kvm_type() can return -1 on failure.
> > > >> Document it, and add a check in kvm_init().
> > > >>
> > > >> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > >> ---
> > > >>  include/hw/boards.h | 3 ++-
> > > >>  accel/kvm/kvm-all.c | 6 ++++++
> > > >>  2 files changed, 8 insertions(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/include/hw/boards.h b/include/hw/boards.h
> > > >> index a46dfe5d1a6..68d3d10f6b0 100644
> > > >> --- a/include/hw/boards.h
> > > >> +++ b/include/hw/boards.h
> > > >> @@ -127,7 +127,8 @@ typedef struct {
> > > >>   *    implement and a stub device is required.
> > > >>   * @kvm_type:
> > > >>   *    Return the type of KVM corresponding to the kvm-type string=
 option or
> > > >> - *    computed based on other criteria such as the host kernel ca=
pabilities.
> > > >> + *    computed based on other criteria such as the host kernel ca=
pabilities
> > > >> + *    (which can't be negative), or -1 on error.
> > > >>   * @numa_mem_supported:
> > > >>   *    true if '--numa node.mem' option is supported and false oth=
erwise
> > > >>   * @smp_parse:
> > > >> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > > >> index 84c943fcdb2..b069938d881 100644
> > > >> --- a/accel/kvm/kvm-all.c
> > > >> +++ b/accel/kvm/kvm-all.c
> > > >> @@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
> > > >>                                                              "kvm-=
type",
> > > >>                                                              &erro=
r_abort);
> > > >>          type =3D mc->kvm_type(ms, kvm_type);
> > > >> +        if (type < 0) {
> > > >> +            ret =3D -EINVAL;
> > > >> +            fprintf(stderr, "Failed to detect kvm-type for machin=
e '%s'\n",
> > > >> +                    mc->name);
> > > >> +            goto err;
> > > >> +        }
> > > >>      }
> > > >> =20
> > > >>      do { =20
> > > >=20
> > > > No objection to this patch; but I'm wondering why some non-pseries
> > > > machines implement the kvm_type callback, when I see the kvm-type
> > > > property only for pseries? Am I holding my git grep wrong? =20
> > >=20
> > > Can it be what David commented here?
> > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg784508.html
> > >=20
> >=20
> > Ok, I might be confused about the other ppc machines; but I'm wondering
> > about the kvm_type callback for mips and arm/virt. Maybe I'm just
> > confused by the whole mechanism?
>=20
> For ppc at least, not sure about in general, pseries is the only
> machine type that can possibly work under more than one KVM flavour
> (HV or PR).  So, it's the only one where it's actually useful to be
> able to configure this.

Wait... I'm not sure that's true.  At least theoretically, some of the
Book3E platforms could work with either PR or the Book3E specific
KVM.  Not sure if KVM PR supports all the BookE instructions it would
need to in practice.

Possibly pseries is just the platform where there's been enough people
interested in setting the KVM flavour so far.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--iHciYgIJJ+RNzZ6R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0QB0ACgkQbDjKyiDZ
s5JQqBAA2HMmkpdhk4iK7XRStsDCbxBXZysxhFDBM0qLWfKEbOKqcRzv9BiIFbRb
Ioh4AG1Vvt/cxatFBRkKOOIML8ICtAm/hhBBo3A/6gwi5ogzlRO54Jkr+GIWiRSH
0iY9VKPGnsjTaf6SrE7GKxdYiPdGTR+6+2snq/f0EUjcz15LsWujsrB2Vyr/F/Oe
KEYH+S+Pwot39s3mGSOIR0QYHsfN4+oYLPajZXdmcrGjBsTNM6s7+fDGb6oAC7Yg
7cvOCbL6EAOJ1P3wmYySwu1rVM/vU6IFW7LUfZcP33JynhPYWWh7J84zCTBwNgJF
IQvlIEQU3Qta+SieLJma+ZTwALAiYSDKSJ1n4vIEWQ21FoQLSbzP4oxqDMiTZha+
LW5mzqPTQuF/MZg+B+dZtpCKWiLhkG7SWVB7Gb8hq7wat+AZONUJU/BaqQq2QVdN
a7YiR95k/6rsUFyN0I8NYsrIIMbR6IlI+ivVCukvurwo3iP9m+4/UyM/gM3XRBNc
ekYjyglLGj9pztFIC0JVBPodTG/8OSkAuvVDh2fVaefjfj0nckXJ9oxJDc1D6LH2
vocCjxis9Dv2YgQgzem8pUAQ//Z1WGIiiyWD1gPDt/A3EDbvjxHPZK0w7ZOxKLYR
cagHb4ijSlK6htqbMaqOJ3zM7FOgPwHvc0xLzUttBEolVXQia1E=
=kPBL
-----END PGP SIGNATURE-----

--iHciYgIJJ+RNzZ6R--

