Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAD96FD2E5
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 01:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532581.828791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwWIG-0002NN-9U; Tue, 09 May 2023 22:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532581.828791; Tue, 09 May 2023 22:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwWIG-0002Ke-6I; Tue, 09 May 2023 22:58:52 +0000
Received: by outflank-mailman (input) for mailman id 532581;
 Tue, 09 May 2023 22:58:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jxqG=A6=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pwWIE-0002KX-Rx
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 22:58:51 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e6d2a48-eebd-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 00:58:48 +0200 (CEST)
Received: from aepfle.de by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz49MwU7VE
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 10 May 2023 00:58:30 +0200 (CEST)
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
X-Inumbo-ID: 0e6d2a48-eebd-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1683673110; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=eZ1Xom1Goq0t0rDLQFjHxTIvR8GF9UFHiztm7ZLPmDIP0fFpWB3eD2NmIGqoeIwoFl
    UIvVVvwMZm+zPF2ghgAfQa6p89Yr741UO+3SCTQHVgF0va0TR4wCIxmUxgPQERrnKJam
    RfVyy5p89WDEWSh6bSZIpSrQ5VL8E6N8eIUJeP0EZ23CRJbmmfDPgVzXv7yDDtb+upXv
    zuJfmNGVD5SyN/6Xg4cHokERLz+EWafb9iM7/J051UboDX/LqCtP0ZEIoSL01qkViGlJ
    EmA/DVDBV1QlL8xJit6aaZgt4ADEvjNJDaTnUTPaj9u3pfbVHL0fVdgNPMylUWHGDGEr
    oxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683673110;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=GCP5/CljJD+CfipxX1GkhTK2QgMNJf/4Nny5lGr0f04=;
    b=cRUuD9cGfKlEtCzb7BlTSVPbFMUF6G907RL/iPoIp69Vw+i0bHc3oRsTKY7Ko/I8JK
    V9tJ4LT5VJcWimcyKS99DKQt6pc5kitto/mKV/Yoir34iWXaEPXRQiqBGQUgoooIBVYn
    8s2w+ULF6ZPquxMRsa+NmJwJJtVX4+/WMmhKekyvDjQoBlEq4tcUxDklqpB159Q1Nsgp
    KkHLz1a2nUxlushsIreIUEpTvF7vh9okq9o6TvZSUfWymTsTQRErIqkPMip27sJmXSw9
    r+FpPX4wSwfzzoNJ0pqH9LMFMDokbYBRKAflW6qorO8B3Y7DCRjcKWU4DRXQpHz2NXYr
    fOBQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683673110;
    s=strato-dkim-0002; d=aepfle.de;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=GCP5/CljJD+CfipxX1GkhTK2QgMNJf/4Nny5lGr0f04=;
    b=dAwxwnZPL9D6YZ3nj2hZLhNIw7LYa0niHD7BslvqySjsORmQlsHXffrdCKc0FRIqFg
    1n4ytzZwPDHFNx4sgX6zyw4P518WcHaOj7FYXe/ci8rRdtva4e3ScdW5CA8A9x9Svy9H
    F19ukFWXMPC2YuZxY3IpiAHduyJ1+gHjQZ2SaZuTc16yO9IATobnvtQ9WeLeC1lzDTvr
    wqgKkHrqW6+2aDLlPZxPB18tGCVM5R/12AXAe0WmS8nXuz4Gm2CbbgoqLRIfYIRPVC9+
    rs46q/8Vro/tykWVupZ8g1LjgjXIixcrnMCEk22cp6xuBatTEtORKuKGWK2bYkB5x+RN
    46+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683673110;
    s=strato-dkim-0003; d=aepfle.de;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=GCP5/CljJD+CfipxX1GkhTK2QgMNJf/4Nny5lGr0f04=;
    b=nJCegGckozv2Rmq6r9oY9NISiqdVzUEISVzj5dczOpyX/FcHtlOkJY/hs6aw+JYzti
    I4MybNJ0EfHeeKOHSXAQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QDiZbDmui9LcK/RdXt7GAQpV1nK0bLkUAKSOj2nbrD7pC72l5quxWIls5ia2dFakLOv3Iu"
Date: Wed, 10 May 2023 00:58:27 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: John Snow <jsnow@redhat.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
Message-ID: <20230509225818.GA16290@aepfle.de>
References: <20210317070046.17860-1-olaf@aepfle.de>
 <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
 <20210325121219.7b5daf76.olaf@aepfle.de>
 <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Transfer-Encoding: 7bit


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Resuming this old thread about an unfixed bug, which was introduced in qemu=
-4.2:

qemu ends up in piix_ide_reset from pci_unplug_disks.
This was not the case prior 4.2, the removed call to
qemu_register_reset(piix3_reset, d) in
ee358e919e385fdc79d59d0d47b4a81e349cd5c9 did apparently nothing.

In my debugging (with v8.0.0) it turned out the three pci_set_word
causes the domU to hang. In fact, it is just the last one:

   pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */

It changes the value from 0xc121 to 0x1.

The question is: what does this do in practice?

Starting with recent qemu (like 7.2), the domU sometimes proceeds with
these messages:

    [    1.631161] uhci_hcd 0000:00:01.2: host system error, PCI problems?
    [    1.634965] uhci_hcd 0000:00:01.2: host controller process error, so=
mething bad happened!
    [    1.634965] uhci_hcd 0000:00:01.2: host controller halted, very bad!
    [    1.634965] uhci_hcd 0000:00:01.2: HC died; cleaning up
    Loading basic drivers...[    2.398048] Disabling IRQ #23

Is anyone familiar enough with PIIX3 and knows how these devices are
interacting?

00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)
00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton I=
I]
00:01.2 USB controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton =
II] (rev 01)
00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
00:02.0 Unassigned class [ff80]: XenSource, Inc. Xen Platform Device (rev 0=
1)
00:03.0 VGA compatible controller: Cirrus Logic GD 5446


Thanks,
Olaf

On Thu, Mar 25, Paolo Bonzini wrote:

> On 25/03/21 12:12, Olaf Hering wrote:
> > Am Mon, 22 Mar 2021 18:09:17 -0400
> > schrieb John Snow <jsnow@redhat.com>:
> >=20
> > > My understanding is that XEN has some extra disks that it unplugs when
> > > it later figures out it doesn't need them. How exactly this works is
> > > something I've not looked into too closely.
> >=20
> > It has no extra disks, why would it?
> >=20
> > I assume each virtualization variant has some sort of unplug if it has =
to support guests that lack PV/virtio/enlightened/whatever drivers.
>=20
> No, it's Xen only and really should be legacy.  Ideally one would just ha=
ve
> devices supported at all levels from firmware to kernel.
>=20
> > > So if these IDE devices have been "unplugged" already, we avoid
> > > resetting them here. What about this reset causes the bug you describe
> > > in the commit message?
> > >=20
> > > Does this reset now happen earlier/later as compared to what it did
> > > prior to ee358e91 ?
> >=20
> > Prior this commit, piix_ide_reset was only called when the entire
> > emulated machine was reset. Like: never. With this commit,
> > piix_ide_reset will be called from pci_piix3_xen_ide_unplug. For some
> > reason it confuses the emulated USB hardware. Why it does confused
> > it, no idea.
>=20
> > I wonder what the purpose of the qdev_reset_all() call really is. It
> > is 10 years old. It might be stale.
>=20
> piix_ide_reset is only calling ide_bus_reset, and from there ide_reset and
> bmdma_reset.  All of these functions do just two things: reset internal
> registers and ensure pending I/O is completed or canceled.  The latter is
> indeed unnecessary; drain/flush/detach is already done before the call to
> qdev_reset_all.
>=20
> But the fact that it breaks USB is weird.  That's the part that needs to =
be
> debugged, because changing IDE to unbreak USB needs an explanation even if
> it's the right thing to do.
>=20
> If you don't want to debug it, removing the qdev_reset_all call might do =
the
> job; you'll have to see what the Xen maintainers think of it.  But if you
> don't debug the USB issue now, it will come back later almost surely.
>=20
> Paolo

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRa0AUACgkQ86SN7mm1
DoDskBAAmoEFUprqfEqC/CGSWwEP9PGpwslHV/gA+3OQTGCY33DFWwSFhpCEs/o4
pc1cGyq3sTYNLJNHO14XOMMQ+q0EGMaJ3CcWj4i0/aYYerXLgpcsMSAQbt6kaZWC
11j/9XIrBvpg6wGDeZz1RHO2qUoBycVvamv4rWKWcBEyS/YqtgF9m3YRa5HKY69x
WkdAB2D9SMJGlSoe3+q6iH9yQ0jPrfHlDnxZvOxXQzx9VohdxqftxSknZtNR6bsZ
8k/M3krPuNIPhoz72VT5dWUcai5xmxpqdXCenztnk1lync/7550d0mC10vFCKIGu
QWs7eDgwJFLqZCWKGT2NR7p0+rLaUwh04GtDQoeHFlQGlkBJ1tCZ/cUpuTPgz4yu
fWXnrno78j6jvGEeifAEJXcY+tqvdr8kvOEwxcQTx/Pdgb2va8+x6WkIdU6xYQkC
mgwleaTC8Pud+1Q55dojJZVk/lfS2gQoC8VXvsocFuloQxTQCdgzIYSBANNgubVg
tFeTnDA8OXoANHxZa6TfdcPkCESe5u6q6+ug3bFvbzC1gpROv0mcQamBChXyk3OC
2ou0V5Fvm2IAN4j30v+C5KVCvRMOaA/jpz/9ia4XfqkJGiaAF5VMKYVboGOJTErE
OgKsASt88TF85smm5qMpmEhqsM7xlX6cyygCDyNSVoyjzKdXqE8=
=2FAJ
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--

