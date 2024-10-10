Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DCD998669
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 14:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816098.1230269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sysY9-0008E7-1u; Thu, 10 Oct 2024 12:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816098.1230269; Thu, 10 Oct 2024 12:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sysY8-0008CE-Tw; Thu, 10 Oct 2024 12:45:48 +0000
Received: by outflank-mailman (input) for mailman id 816098;
 Thu, 10 Oct 2024 12:45:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r4X1=RG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sysY7-0008C5-DC
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 12:45:47 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f466f7c-8705-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 14:45:42 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 7EC6B13804EA;
 Thu, 10 Oct 2024 08:45:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Thu, 10 Oct 2024 08:45:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Oct 2024 08:45:39 -0400 (EDT)
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
X-Inumbo-ID: 8f466f7c-8705-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1728564341;
	 x=1728650741; bh=L/H89HNNJ4FeSrRJKvOK8MzlFC+DI4qB3f3nzqw95fg=; b=
	f0xm3r6cQlhPBX/ecIrqVOB+exGR3i1rmh62w4McZ3T52GeiPToTmKKogNvDUxWh
	udFSrVoHXtYYTA8CbpvXm46g/M3jeDp938QFGcnrVJiEb2HrP/iHm32UZEXCWhPF
	hKSaGJKEMDXPQLvqsSfvmfCKIWiR852TUqxsa/R0EV/V5W0JV/pzGIC6XPGb8BnG
	hUCrU5jd9EYr8hAoV/om37/iqZGuVRP3AZd9cxXXzumzX3EovXWeibKnm5fP6J7H
	RsG/LgOiYNwyUo9j0YtqSC7xNRWbRzgXsShdq/z2AUKodIarXqxfNhYkDBL+nTwv
	VX/J5/PITM/4VyMVC7DoYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728564341; x=1728650741; bh=L/H89HNNJ4FeSrRJKvOK8MzlFC+D
	I4qB3f3nzqw95fg=; b=aUkUBLRvcALnBvY9Cer0qkAE1gOtkxxR8ZL36VUc4S1Z
	hRvYjNVzpr0mdsbD5jJet49xE49/zNMzGw62z/3Mny2ZpIlj8I3jPUmb7UXZOR45
	nLZK5b6y+R9/Wb7X85TXZjc3c6i5+3S/8CAdGoN6yz0AcJv+/ApdkmC341VHIhod
	fE9hhkwe8LdJNrb4ZdP89pQq5NDIU0ZzlNXouL7zZPTb3JPbInrVY1OYmvybmRnW
	UQD/MzME0h+N+LNJOX6NKxOUryxMQ8jD0SaVp3BePxs4etBAMswmdKSyzSvfS1QM
	+jFVI7+/PhZa2r5PxIgqvn9QvNAk/5AsTZ+Gium1VA==
X-ME-Sender: <xms:dMwHZ1fL0Iq1i58umSOgWnZOGNFWX9vitycpkAuZgEFAf8tfssR-XQ>
    <xme:dMwHZzPawN-Ss71XmOkHZKopIPvPI4_edaynJKBSQPP3c6NlPKNJoKXdhYA_vMa4T
    wtc9XZIKgz-OA>
X-ME-Received: <xmr:dMwHZ-gRi-EFX63x3qPsxOC6EZomkGH_KCKGFIoY1X-Kw9Qc-AVM8BOMtGebIX4QLySejsANakm08gf3OvDIogPIPyS9RxkRPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefhedgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgv
    rhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuh
    hsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihig
    rdgtohhmpdhrtghpthhtohepgigvnhhprhhojhgvtghtseihmhihrdgsvgdprhgtphhtth
    hopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:dMwHZ-97EPFpLnCc-OJqtlttphSRzygBEM8ntaL4DirwArTICf6Y7Q>
    <xmx:dMwHZxtD9THEeRoHyvZ3oJbPttDpB1OsgYc27kpGtsWOisxxNN6S-A>
    <xmx:dMwHZ9FwgmcEsn3xuGLfnh5TYo3_cwjVINraZtycjMuSKmz9ylC_JQ>
    <xmx:dMwHZ4NgL_VM2zfr2JFzoUdt95RrXJZDFz2grwaV5bOfnbZCyPj49A>
    <xmx:dcwHZ7Jc7awB1rWpO_3IX-yim6irwbeiNQrCUtYyok_cPPdtHsm4_D5n>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 10 Oct 2024 14:45:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] iommu/amd-vi: do not error if device referenced in IVMD
 is not behind any IOMMU
Message-ID: <ZwfMcfT6oN2PAjcR@mail-itl>
References: <20241008104706.74001-1-roger.pau@citrix.com>
 <d6489e43-2cfe-4ad7-824e-a3212367dbca@suse.com>
 <ZwY4ym2Gnlx4tytP@macbook.local>
 <5a2a4ff4-a2c7-46f6-bd18-a4837fe8d4c1@suse.com>
 <ZwZlVlU2nHkBedyo@macbook.local>
 <703fa416-c7d5-4862-a871-5831125c2e25@suse.com>
 <ZwZtR6ZTl2gUWN2T@macbook.local>
 <34f73ec6-0e10-41f4-8894-c367264afefc@suse.com>
 <ZwaHAqVGeeJNu4Dp@macbook.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AoL969Bsqkrm68QS"
Content-Disposition: inline
In-Reply-To: <ZwaHAqVGeeJNu4Dp@macbook.local>


--AoL969Bsqkrm68QS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Oct 2024 14:45:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] iommu/amd-vi: do not error if device referenced in IVMD
 is not behind any IOMMU

On Wed, Oct 09, 2024 at 03:37:06PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, Oct 09, 2024 at 02:09:33PM +0200, Jan Beulich wrote:
> > On 09.10.2024 13:47, Roger Pau Monn=C3=A9 wrote:
> > > On Wed, Oct 09, 2024 at 01:28:19PM +0200, Jan Beulich wrote:
> > >> On 09.10.2024 13:13, Roger Pau Monn=C3=A9 wrote:
> > >>> I also think returning an error when no device in the IVMD range is
> > >>> covered by an IOMMU is dubious.  Xen will already print warning
> > >>> messages about such firmware inconsistencies, but refusing to boot =
is
> > >>> too strict.
> > >>
> > >> I disagree. We shouldn't enable DMA remapping in such an event. Wher=
eas
> > >=20
> > > I'm not sure I understand why you would go as far as refusing to
> > > enable DMA remapping.  How is a IVMD block having references to some
> > > devices not assigned to any IOMMU different to all devices referenced
> > > not assigned to any IOMMU?  We should deal with both in the same
> > > way.
> >=20
> > Precisely because of ...
> >=20
> > > If all devices in the IVMD block are not covered by an IOMMU, the
> > > IVMD block is useless.
> >=20
> > ... this. We simply can't judge whether such a useless block really was
> > meant to cover something. If it was, we're hosed. Or maybe we screwed up
> > and wrongly conclude it's useless.
>=20
> The same could be stated about devices in a IVMD block that are not
> assigned to an IOMMU: it could also be Xen that screwed up and wrongly
> concluded they are not assigned to an IOMMU.
>=20
> > >  But there's nothing for Xen to action, due to
> > > the devices not having an IOMMU assigned.  IOW: it would be the same
> > > as booting natively without parsing the IVRS in the first place.
> >=20
> > Not really, no. Not parsing IVRS means not turning on any IOMMU. We
> > then know we can't pass through any devices. We can't assess the
> > security of passing through devices (as far as it's under our control)
> > if we enable the IOMMU in perhaps a flawed way.
> >=20
> > A formally valid IVMD we can't make sense of is imo no different from
> > a formally invalid IVMD, for which we would return ENODEV as well (and
> > hence fail to enable the IOMMU). Whereas what you're suggesting is, if
> > I take it further, to basically ignore (almost) all errors in table
> > parsing, and enable the IOMMU(s) in a best effort manner, no matter
> > whether that leads to a functional (let alone secure [to the degree
> > possible]) system.
>=20
> No, don't take it further: not ignore all errors, I think we should
> ignore errors when the device in the IVMD is not behind an IOMMU.  And
> I think that should apply globally, regardless of whether all devices
> in the IVMD block fall in that category.
>=20
> That will bring AMD-Vi inline with VT-d RMRR, as from what I can see
> acpi_parse_one_rmrr() doesn't care whether the device scope in the
> entry is behind an IOMMU or not, or whether the whole RMRR doesn't
> effectively apply to any device because none of them is covered by an
> IOMMU.
>=20
> > What I don't really understand is why you want to relax our checking
> > beyond what's necessary for the one issue at hand.
>=20
> This issue has been reported to us and we have been able to debug.
> However, I worry what other malformed IVMD blocks might be out there,
> for example an IVMD block that applies to a single device (type 21h),
> but such single device doesn't exist (or it's not behind an IOMMU).
> Maybe next time we simply won't get a report, the user will try Xen,
> see it's not working and move to something else.
>=20
> I've taken a quick look at Linux, and when parsing the IVMD blocks
> there's no checking that referred devices are behind an IOMMU, the
> regions are just added to a list.

It seems Jan's concern is about passthrough of a device that Xen
incorrectly ignored IVMD entry for. But that doesn't really happen - if
the device doesn't exist (at least according to Xen) or isn't behind an
IOMMU (at least according to Xen), it surely won't be used with
passthorugh, no? So, it should be safe to not fail on either of those
cases, as long as given IVMD is applied to other devices (that are
eligible for passthrough) in its range.

Just my 2c.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--AoL969Bsqkrm68QS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcHzHEACgkQ24/THMrX
1yzZCQgAhEvz5KuLYLiZc3E8uuATRrPjuKzpsvrDCwM2Dr2w1+ERECvnr/rWDSNf
vbhaS3Ba1DGp+IRJZlUnf4jU41kPM2JPhVsxs4llPKl0PCyE2Y3dnhyQYsI0iQBN
iL8EMfE+XBgUZUuJ9KIQS+cCOJ56H+I5NN9/77acTL5I0Z301o02GVzzpCq0Bu0o
im1Ti7owQvmUNjpfO81uLBvTCBx+AaU//JDl8pnLOrBgXE+64hKwTzpImOkeEuK4
0k0y6x1O+doRYOXCAgyc91Qje0R4vBW3UfoHabwpdhCYm3QthrJMKBcnd1m7MqNF
vrn7UqLNi/xGY+GfhWZIYef+f+Efuw==
=slVL
-----END PGP SIGNATURE-----

--AoL969Bsqkrm68QS--

