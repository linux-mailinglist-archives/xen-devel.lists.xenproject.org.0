Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4803228EB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 11:37:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88697.166895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEV47-0004GO-FJ; Tue, 23 Feb 2021 10:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88697.166895; Tue, 23 Feb 2021 10:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEV47-0004G1-CD; Tue, 23 Feb 2021 10:37:15 +0000
Received: by outflank-mailman (input) for mailman id 88697;
 Tue, 23 Feb 2021 10:37:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CEda=HZ=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1lEV46-0004Fw-7S
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 10:37:14 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 807fc8fe-83dd-4a70-a909-e61e690507fd;
 Tue, 23 Feb 2021 10:37:12 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-QvMczwhUMS6WpidU3ya6Pg-1; Tue, 23 Feb 2021 05:37:06 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6226801986;
 Tue, 23 Feb 2021 10:37:01 +0000 (UTC)
Received: from gondolin (ovpn-113-126.ams2.redhat.com [10.36.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D59045D9D0;
 Tue, 23 Feb 2021 10:36:47 +0000 (UTC)
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
X-Inumbo-ID: 807fc8fe-83dd-4a70-a909-e61e690507fd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614076632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bIGzZAHT2IrR97nIWaOZh13hqXqdEEn4ZaBsZNS2Jg0=;
	b=KHxX8DKO752n5FbuHjwofIlpdWW7Z5N7UkycR4nJhVsuREEQGngoK+BXa+jsagZPSTsUTJ
	IddAdh2Fipago6Gfz2d6VIqDKVQ4b6ztkdtN27Xi0bUyVgMvy5oTiPLLyi6SaaTC6qCP3a
	J+ZZ4mBMcV4VvzXXr15YCuNQWCsqWl8=
X-MC-Unique: QvMczwhUMS6WpidU3ya6Pg-1
Date: Tue, 23 Feb 2021 11:36:34 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Peter Maydell
 <peter.maydell@linaro.org>, Anthony Perard <anthony.perard@citrix.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Halil Pasic
 <pasic@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 xen-devel@lists.xenproject.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org, Stefano Stabellini
 <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, BALATON Zoltan <balaton@eik.bme.hu>, Leif Lindholm
 <leif@nuviainc.com>, Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Alistair Francis
 <alistair@alistair23.me>, Paul Durrant <paul@xen.org>, Eduardo Habkost
 <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, =?UTF-8?B?SGVy?=
 =?UTF-8?B?dsOp?= Poussineau <hpoussin@reactos.org>, Greg Kurz
 <groug@kaod.org>, Christian Borntraeger <borntraeger@de.ibm.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>
Subject: Re: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type()
 return value
Message-ID: <20210223113634.6626c8f8.cohuck@redhat.com>
In-Reply-To: <YDRAHW1ds1eh0Lav@yekko.fritz.box>
References: <20210219173847.2054123-1-philmd@redhat.com>
	<20210219173847.2054123-2-philmd@redhat.com>
	<20210222182405.3e6e9a6f.cohuck@redhat.com>
	<bc37276d-74cc-22f0-fcc0-4ee5e62cf1df@redhat.com>
	<20210222185044.23fccecc.cohuck@redhat.com>
	<YDQ/Y1KozPSyNGjo@yekko.fritz.box>
	<YDRAHW1ds1eh0Lav@yekko.fritz.box>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nudo1.j=xV83/2pyII4Lt07";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14

--Sig_/nudo1.j=xV83/2pyII4Lt07
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Feb 2021 10:37:01 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Feb 23, 2021 at 10:33:55AM +1100, David Gibson wrote:
> > On Mon, Feb 22, 2021 at 06:50:44PM +0100, Cornelia Huck wrote: =20
> > > On Mon, 22 Feb 2021 18:41:07 +0100
> > > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> > >  =20
> > > > On 2/22/21 6:24 PM, Cornelia Huck wrote: =20
> > > > > On Fri, 19 Feb 2021 18:38:37 +0100
> > > > > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> > > > >    =20
> > > > >> MachineClass::kvm_type() can return -1 on failure.
> > > > >> Document it, and add a check in kvm_init().
> > > > >>
> > > > >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > > > >> ---
> > > > >>  include/hw/boards.h | 3 ++-
> > > > >>  accel/kvm/kvm-all.c | 6 ++++++
> > > > >>  2 files changed, 8 insertions(+), 1 deletion(-)
> > > > >>
> > > > >> diff --git a/include/hw/boards.h b/include/hw/boards.h
> > > > >> index a46dfe5d1a6..68d3d10f6b0 100644
> > > > >> --- a/include/hw/boards.h
> > > > >> +++ b/include/hw/boards.h
> > > > >> @@ -127,7 +127,8 @@ typedef struct {
> > > > >>   *    implement and a stub device is required.
> > > > >>   * @kvm_type:
> > > > >>   *    Return the type of KVM corresponding to the kvm-type stri=
ng option or
> > > > >> - *    computed based on other criteria such as the host kernel =
capabilities.
> > > > >> + *    computed based on other criteria such as the host kernel =
capabilities
> > > > >> + *    (which can't be negative), or -1 on error.
> > > > >>   * @numa_mem_supported:
> > > > >>   *    true if '--numa node.mem' option is supported and false o=
therwise
> > > > >>   * @smp_parse:
> > > > >> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > > > >> index 84c943fcdb2..b069938d881 100644
> > > > >> --- a/accel/kvm/kvm-all.c
> > > > >> +++ b/accel/kvm/kvm-all.c
> > > > >> @@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
> > > > >>                                                              "kv=
m-type",
> > > > >>                                                              &er=
ror_abort);
> > > > >>          type =3D mc->kvm_type(ms, kvm_type);
> > > > >> +        if (type < 0) {
> > > > >> +            ret =3D -EINVAL;
> > > > >> +            fprintf(stderr, "Failed to detect kvm-type for mach=
ine '%s'\n",
> > > > >> +                    mc->name);
> > > > >> +            goto err;
> > > > >> +        }
> > > > >>      }
> > > > >> =20
> > > > >>      do {   =20
> > > > >=20
> > > > > No objection to this patch; but I'm wondering why some non-pseries
> > > > > machines implement the kvm_type callback, when I see the kvm-type
> > > > > property only for pseries? Am I holding my git grep wrong?   =20
> > > >=20
> > > > Can it be what David commented here?
> > > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg784508.html
> > > >  =20
> > >=20
> > > Ok, I might be confused about the other ppc machines; but I'm wonderi=
ng
> > > about the kvm_type callback for mips and arm/virt. Maybe I'm just
> > > confused by the whole mechanism? =20
> >=20
> > For ppc at least, not sure about in general, pseries is the only
> > machine type that can possibly work under more than one KVM flavour
> > (HV or PR).  So, it's the only one where it's actually useful to be
> > able to configure this. =20
>=20
> Wait... I'm not sure that's true.  At least theoretically, some of the
> Book3E platforms could work with either PR or the Book3E specific
> KVM.  Not sure if KVM PR supports all the BookE instructions it would
> need to in practice.
>=20
> Possibly pseries is just the platform where there's been enough people
> interested in setting the KVM flavour so far.

If I'm not utterly confused by the code, it seems the pseries machines
are the only ones where you can actually get to an invocation of
->kvm_type(): You need to have a 'kvm-type' machine property, and
AFAICS only the pseries machine has that.

(Or is something hiding behind some macro magic?)

--Sig_/nudo1.j=xV83/2pyII4Lt07
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAmA02rMACgkQ3s9rk8bw
L69Sng//SPiU5hi/9Db125/S0xZG5O8UzQoag2vh8Q68aGY9pmkB5pUsF5xCYvq4
v3GT9vtpCT+urKHCNhQcPD0nLLumzQxaz3GKTHvqOWkOwGI3HJhCg9HAutC4d77k
pAQpFCiDaxRw98uRREJDiG1tM9xzhU/qb1Ujs90aYALeZ3B4wmQQTRVXTiZjto++
PqJyNULu02yA4sFyZy+iCvv8dT8Ex2uyxV0JzeNS9RV4xsOGH8jMqElRPJiioJhf
20o5RAL+tpkM71Z1OMj3mBfrdui2K6ordXZKs7OoIkrjb01l/oZXSvVSjxzbKOTn
LKQYKIZ2/0SHH1IIxovfDJYm/1iV0JHmmW7klM2U1OSmMlZx0TsRmZ6ArWAE6/7z
CJhC/PpeE8bX9fRuXzAwuBRbT3Cgp6XurESExT1BDWMF3Gym3FaiIz2FHyVnvlPR
yFcVjR7pgAKWSRI1/EddICKWb2paYhSpzZ9QjbhOISelEslzJU57WQIAUjVPnSho
lrgY/XuKSJA+ZnRQdY3LX5IADVpA0rn7W2nW0JkJN0nJn4dw3P6Ikp14W1qUC8UR
AcsnC9Xqbj9D+xRgf1yoCBez7D9kthUXY226A3DYJJcp0qfsquXw0+cxN71CqPhb
dcvq0J1IEjbx4ir/qN2R8hxfCm3vwXG+w/3ZhKx69rUI5w4PA8Q=
=u9hO
-----END PGP SIGNATURE-----

--Sig_/nudo1.j=xV83/2pyII4Lt07--


