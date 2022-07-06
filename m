Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7095680A1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361926.591706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zuv-0006EG-T3; Wed, 06 Jul 2022 07:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361926.591706; Wed, 06 Jul 2022 07:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zuv-0006B8-Pj; Wed, 06 Jul 2022 07:57:49 +0000
Received: by outflank-mailman (input) for mailman id 361926;
 Wed, 06 Jul 2022 07:57:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91kg=XL=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o8zut-0006B2-W9
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:57:48 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51a92cb2-fd01-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 09:57:46 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8157E5C00DA;
 Wed,  6 Jul 2022 03:57:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 06 Jul 2022 03:57:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 03:57:44 -0400 (EDT)
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
X-Inumbo-ID: 51a92cb2-fd01-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1657094264; x=
	1657180664; bh=dmjeI/GdbrlvLGdBYBq9CWM2/S9Mp4pyroeHZljMJHQ=; b=K
	sPlJ1qx2QCQ953UZhTVD6QA2qPie2OdvziAG7gfue8CjreWXcaWI7Dkaa9AGHUkl
	Jcd0xdvaMyN31o+TjT86bbol6Wz91m2LFzSByHLBTIk1KLhbUJgh16X8KwWSZUl9
	oNLhyy/FNiaqcyPpKVpF1yY0EJ423uHQNvYqfjsrHClYWl+P3TgOfQ+pUCw3D+VW
	SnDAi19WaH3lK3wy24aKrSWbckd4krfv6iSL2fAOmxtdPelf88PaUNfdEzzi0xPj
	+3DXyGaBbfR0EYNfoRrflwCEnjfphaGMVKk4IiCmsKaDuZq6aDjPXB3Dxsd1zKo+
	/W7zBflyihrQSD3A0qGSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657094264; x=1657180664; bh=dmjeI/GdbrlvLGdBYBq9CWM2/S9M
	p4pyroeHZljMJHQ=; b=FG/tB1sNY6xmhZ7UoL7kHBezV+CYmu36YHcHGtplQcSB
	0gCKGtlN3bsXZBS9tB8azxlVeQyER8AuVaFwRGSaetuIt8ArQh7ggfMVOfJe+XNB
	wVZHMRWHbXuRb9y5QSrHY1UCIAzXtar2lZVFT9rUzIz+02pzG1SIlb5ZZnoKov6s
	AetL2+3LccLmGcEcRwo8FG6dheyK9fgDMXAf01e2vS7/TFs3+zRKUGpP9HP9WLh6
	bhEVIiRw4SjNFpPZ2QRNq15uUPj51bfDken6kon/s1uNZRXyFttufYPZQX0or7RI
	z0eWgHcB40K7YLJCGjkNubXNajY42ZAGyMw2Ipp67g==
X-ME-Sender: <xms:eEDFYqrbFI3VgOE56X0u8V74hbClAadoBF3e2qqzxh-KJAGsEQ5iBw>
    <xme:eEDFYopf6gMVeqFnMBaye4QlgZ8--rlkQRJ6ZllP0NFpKUWSKRIN7s7AVLC7Zsi_4
    ZPNf-9ROg5W1CM>
X-ME-Received: <xmr:eEDFYvMBOfNqbtFAoZbYxKt7fmLspgUK2Snz4Dd_kTT244avxGDu2F3bNEw_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeivddguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefkefgkedvtefguedtffejlefh
    leetveekhefgfeetvefgtdektedtkeeuiedtfeenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    uggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:eEDFYp6S7ZFnRPRuJW54gkJhCl0P_jXbD12jo6mcaGtVIrXhvTS9rQ>
    <xmx:eEDFYp4lzf1nK4Enfllbtf-jvoCbw124ZjnjIFe-GWDjJBq8nxuk6w>
    <xmx:eEDFYpiUs5IRKHMxh2zvWVol0dfZ7mpiB0J0sDNqbFae_DTJlYxKHA>
    <xmx:eEDFYmhK-x9TDtgm2XQK6jFV8t2myOhpAM9yD0hXn3DXTJft26VJtA>
Feedback-ID: iac594737:Fastmail
Date: Wed, 6 Jul 2022 03:26:35 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable-smoke test] 171511: regressions - FAIL
Message-ID: <YsVAdvzTshaijALW@itl-email>
References: <osstest-171511-mainreport@xen.org>
 <a9a8276f-725a-db6e-8223-a9e6060f7700@suse.com>
 <YsUyUCv7IAbXYwaB@itl-email>
 <12374e16-8f58-ebc1-fa78-16c9eb6f1d0b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9QU2mazQtCSQEbPT"
Content-Disposition: inline
In-Reply-To: <12374e16-8f58-ebc1-fa78-16c9eb6f1d0b@suse.com>


--9QU2mazQtCSQEbPT
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 6 Jul 2022 03:26:35 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable-smoke test] 171511: regressions - FAIL

On Wed, Jul 06, 2022 at 09:02:47AM +0200, Jan Beulich wrote:
> On 06.07.2022 08:56, Demi Marie Obenour wrote:
> >>> commit 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
> >>> Author: Demi Marie Obenour <demi@invisiblethingslab.com>
> >>> Date:   Tue Jul 5 13:10:46 2022 +0200
> >>>
> >>>     EFI: preserve the System Resource Table for dom0
> >>>    =20
> >>>     The EFI System Resource Table (ESRT) is necessary for fwupd to id=
entify
> >>>     firmware updates to install.  According to the UEFI specification=
 =C2=A723.4,
> >>>     the ESRT shall be stored in memory of type EfiBootServicesData.  =
However,
> >>>     memory of type EfiBootServicesData is considered general-purpose =
memory
> >>>     by Xen, so the ESRT needs to be moved somewhere where Xen will not
> >>>     overwrite it.  Copy the ESRT to memory of type EfiRuntimeServices=
Data,
> >>>     which Xen will not reuse.  dom0 can use the ESRT if (and only if)=
 it is
> >>>     in memory of type EfiRuntimeServicesData.
> >>>    =20
> >>>     Earlier versions of this patch reserved the memory in which the E=
SRT was
> >>>     located.  This created awkward alignment problems, and required e=
ither
> >>>     splitting the E820 table or wasting memory.  It also would have r=
equired
> >>>     a new platform op for dom0 to use to indicate if the ESRT is rese=
rved.
> >>>     By copying the ESRT into EfiRuntimeServicesData memory, the E820 =
table
> >>>     does not need to be modified, and dom0 can just check the type of=
 the
> >>>     memory region containing the ESRT.  The copy is only done if the =
ESRT is
> >>>     not already in EfiRuntimeServicesData memory, avoiding memory lea=
ks on
> >>>     repeated kexec.
> >>>    =20
> >>>     See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-=
itl/T/
> >>>     for details.
> >>>    =20
> >>>     Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> >>>     Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> ... this is the most likely candidate, considering in the log all we
> >> see is:
> >>
> >> Xen 4.17-unstable (c/s Mon Jun 27 15:15:39 2022 +0200 git:61ff273322-d=
irty) EFI loader
> >> Jul  5 23:09:15.692859 Using configuration file 'xen.cfg'
> >> Jul  5 23:09:15.704878 vmlinuz: 0x00000083fb1ac000-0x00000083fc880a00
> >> Jul  5 23:09:15.704931 initrd.gz: 0x00000083f94b7000-0x00000083fb1ab6e8
> >> Jul  5 23:09:15.836836 xenpolicy: 0x00000083f94b4000-0x00000083f94b6a5f
> >> Jul  5 23:09:15.980866 Using bootargs from Xen configuration file.
> >=20
> > This would not surprise me at all.  I was hoping that Jan would be able
> > to test this before he merged it, especially the ARM-specific stuff.
>=20
> Jan (i.e. me)? I've never done any testing on Arm; all I do is build-test
> things there. Also if you suspected there might be issues, I think you
> should have arranged for someone to test this, i.e. at the very least
> indicate so in a post-commit-message remark targeted at the eventual
> committer.

I don't have access to an ARM64 machine (other than a mobile device)
myself, so I can't test anything on that platform.  I did not *expect*
there to be any issues, but I am not surprised that there are.  I should
have done a basic smoke test on x86, though.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--9QU2mazQtCSQEbPT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmLFOUYACgkQsoi1X/+c
IsF5ww/+MpL+dLCGIcFZxLwuSkevBR0p89ufuOJ1heCxbyY7CiPbfTjhNGyrD+bw
SPBIACbxKIatJu3Mqlb7CfLpQHCF/fgcpe/6XOynDEblc1DGDpaAoie0vVDYRYwK
l97nh19F6wy/xlRESGPaFRW2aAfPz4lnL7udYfs/fIM72pb3BWUpThGahe6vucDt
aQtVFe7yBBjtZ3KfLSpCOohsX1LfTIpUH8aUrMF/ph6fSEqmmgqzmMrEj57T9Glp
xslBTW50HF8CdyTSUNgu0UcApfr+FuROqdXjyMw5N29cdz+ep2YIZ97oULu77DX/
xwgQrE6IL7tnHrIkBliHD1WytZ4iOOCLIP0fb4X1rmrNCxHJIerI3VceC2uJ4HG4
TD7x8HitF7ie2RVuKtojIMkmwesb9+zqRzUt22Sj8CZHOc1blAnxaH7rJo/VUldL
EOQQLkBj/xMXU+c9Jf7q0NK8lyn9WXU+QkPK8Ov/mjyRim/M9qLPBuyJ5NbefJmK
713aeZn+ImfZNt1wd9XMdpyEvOaEP45oT0KjcmDyOShG+ESTzhVUab8hZ3BMejMx
5aspG8WfL1GVj7kZqi/JOa8CYzjfz6niww/bsnRwzMpqAi8y9hWV4riak5TaQHW8
AzOq63MctQycywQX6/Buks9qO3EMYhJzbDuOwbg1Nh+LyWBpJrg=
=jJsH
-----END PGP SIGNATURE-----

--9QU2mazQtCSQEbPT--

