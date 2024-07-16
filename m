Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0D89332AA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 22:11:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759792.1169475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sToVZ-0007Tc-Fd; Tue, 16 Jul 2024 20:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759792.1169475; Tue, 16 Jul 2024 20:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sToVZ-0007Rb-CZ; Tue, 16 Jul 2024 20:10:45 +0000
Received: by outflank-mailman (input) for mailman id 759792;
 Tue, 16 Jul 2024 20:10:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p5km=OQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sToVX-0007RV-LP
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 20:10:43 +0000
Received: from fhigh1-smtp.messagingengine.com
 (fhigh1-smtp.messagingengine.com [103.168.172.152])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78e0ed86-43af-11ef-bbfc-fd08da9f4363;
 Tue, 16 Jul 2024 22:10:41 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 4FFB11147E7F;
 Tue, 16 Jul 2024 16:10:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 16 Jul 2024 16:10:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jul 2024 16:10:37 -0400 (EDT)
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
X-Inumbo-ID: 78e0ed86-43af-11ef-bbfc-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721160639;
	 x=1721247039; bh=T7Z0H2aovgHGC23SSHYjTkRh3NWYsc7H320q89t1lAs=; b=
	d6l3vXbJz9+RTmMRA7Vz6CzSWhbjNJhD51o0QmtzvVxYQIk57kwiSxlHKPsAvcwK
	4X9OFH35ACAkV21tUijiJdliLqhjIqJBseC9v30QyK5UI2dEJ2F9BWlvUYO009Xn
	CkkaZHiBpbJvPtmRzJxy8Si8McY0fulh1W2k/PHyDmV/ptkg9ndKmylXPAdyhWoF
	1hssrPv7EjRr/erFFRaJMZnLGyYgivMTbt8TQi/0mPpFZigOt8IKAuQwSwtrMNDQ
	dUjIVU9G0iYuE9JevMw7JJf2VG7jNSED6PZrtWkz0l91wudwLyPlKgv5znPYT476
	9NrMzAVEQFSmvGtg7t3Wyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721160639; x=1721247039; bh=T7Z0H2aovgHGC23SSHYjTkRh3NWY
	sc7H320q89t1lAs=; b=mJtepLaOVMQF6qQ3c610rI4tjZsnpQEAU1fopmKTOZHV
	/osD1gqQwR4NbVB8Dy6z9Z2o9yCYOLc1NFtf7c0YKd43diC2qMpkk4O+wByobROv
	SkiDH366eLSB8u2Cjm5bUoRf2DF7RtBZCyd54Cmh1HcyCNuJj/WxpubN25bQmexf
	dPVbTIB+i4CL68dUdt+zljozOc5WEf/LNCAloDPEGxJYd7XWXlf9WhyM2iRYQswy
	V4QeAc1zm4zJi9AA+Nwml4BYKTr93B0JTPnoY4QsiOGrezRVeW2IiehG1UeudB5p
	TqUrHZeeTu5b6LvZfK5EV5fxOzCAkwoRiGmSyWn92Q==
X-ME-Sender: <xms:vtOWZgW5WTm8mSqcmdTtXw-rkFmJIPZR1nHV9Jwu2c87A7uA5tZFLw>
    <xme:vtOWZklhADaKNskDx8poQtRNV6DrRgQhdZMMAFwZi_s3oUD0hkU11qUf7SGKDIyJV
    3FaeRj9r2cfsw>
X-ME-Received: <xmr:vtOWZkZaPUo3HZmrHBKfSRaEGSBdgaGJkl3MQIbPcxBeCUIBf2zBrY9SIwjpzhj1EWf2kGpFb1ZPT74wz-9aMCD_h0ZzKzfxeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeeggddugeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdei
    tdefkeehueegkeetvefhheettefgieeigeejheelgffhjefgiedtudevkedvnecuffhomh
    grihhnpehfvgguohhrrghprhhojhgvtghtrdhorhhgpdgrrhgthhhlihhnuhigrdhorhhg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrh
    hmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:vtOWZvW_peyjQh7OVZsmK-ftmD36sXtr4BYDpFu3Q1UApejNeBItaw>
    <xmx:vtOWZqmdKFVs3vgi85NNYUZ3hChIUFk65kP0P4vwbuxFn9QqWYecpg>
    <xmx:vtOWZkeToybQCUUEK2VMQWnr8aQ-WiD90GYOrOmEND46UPBoxxnGIA>
    <xmx:vtOWZsEQCTTr_lHUl9m2eMtfWsBOTImb-uiZhQVM0N6Dzp8rixkwtQ>
    <xmx:v9OWZsXPWB59PZC4zfY44qHb6z36Z6Hd8x5WkLPGuGj6bTR3-E_91J4r>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 16 Jul 2024 22:10:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <tony@aperard.fr>
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.19] docs/checklist: Fix XEN_EXTRAVERSION
 inconsistency for release candidates
Message-ID: <ZpbTuxLaaXDHnRYb@mail-itl>
References: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
 <3b188f84-50f7-4e13-bcde-1d6076e5cc2d@xen.org>
 <423412a9-e969-4126-8e39-7e77e67d2fd8@suse.com>
 <884ea922-946c-4344-ab29-6f2eb4be69f7@xen.org>
 <94edb2c8-1d40-49c1-b29f-151418eb5c11@suse.com>
 <7920f364-d07d-4004-b2b8-fa43b754e9b9@xen.org>
 <94722620-dc9f-4ace-9e3e-070c362d10df@suse.com>
 <2bdf382a-cbad-454f-82ce-0b0d30d2e8ef@suse.com>
 <ZpZ77uJ/wuhoxR2p@l14>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xD08BN9kpkQOfhTD"
Content-Disposition: inline
In-Reply-To: <ZpZ77uJ/wuhoxR2p@l14>


--xD08BN9kpkQOfhTD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jul 2024 22:10:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <tony@aperard.fr>
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.19] docs/checklist: Fix XEN_EXTRAVERSION
 inconsistency for release candidates

On Tue, Jul 16, 2024 at 03:55:58PM +0200, Anthony PERARD wrote:
> On Tue, Jul 16, 2024 at 10:22:18AM +0200, Juergen Gross wrote:
> > On 16.07.24 09:46, Jan Beulich wrote:
> > > On 16.07.2024 09:33, Julien Grall wrote:
> > > > Hi,
> > > >=20
> > > > On 16/07/2024 08:24, Jan Beulich wrote:
> > > > > On 16.07.2024 09:22, Julien Grall wrote:
> > > > > > On 16/07/2024 07:47, Jan Beulich wrote:
> > > > > > > On 15.07.2024 18:56, Julien Grall wrote:
> > > > > > > > On 15/07/2024 16:50, Andrew Cooper wrote:
> > > > > > > > > An earlier part of the checklist states:
> > > > > > > > >=20
> > > > > > > > >       * change xen-unstable README. The banner (generated=
 using figlet) should say:
> > > > > > > > >           - "Xen 4.5" in releases and on stable branches
> > > > > > > > >           - "Xen 4.5-unstable" on unstable
> > > > > > > > >           - "Xen 4.5-rc" for release candidate
> > > > > > > > >=20
> > > > > > > > > Update the notes about XEN_EXTRAVERSION to match.
> > > > >=20
> > > > > When this is the purpose of the patch, ...
> > > > >=20
> > > > > > > > We have been tagging the tree with 4.5.0-rcX. So I think it=
 would be
> > > > > > > > better to update the wording so we use a consistent naming.
> > > > > > >=20
> > > > > > > I find:
> > > > > > >=20
> > > > > > > 4.18-rc
> > > > > > > 4.17-rc
> > > > > > > 4.16-rc
> > > > > > > 4.15-rc
> > > > > >=20
> > > > > > Hmmm... I don't think we are looking at the same thing. I was
> > > > > > specifically looking at the tag and *not* XEN_EXTRAVERSION.
> > > > >=20
> > > > > ... why would we be looking at tags?
> > > >=20
> > > > As I wrote, consistency across the naming scheme we use.
> > > >=20
> > > > > The tags (necessarily) have RC numbers,
> > > >=20
> > > > Right but they also *have* the .0.
> > > >=20
> > > > > so are going to be different from XEN_EXTRAVERSION in any event.
> > > >=20
> > > > Sure they are not going to be 100% the same. However, they could ha=
ve
> > > > some similarity.
> > > >=20
> > > > As I pointed out multiple times now, to me it is odd we are tagging=
 the
> > > > tree with 4.19.0-rcX, but we use 4.19-rc.
> > > >=20
> > > > Furthermore, if you look at the history of the document. It is quite
> > > > clear that the goal was consistency (the commit mentioned by Andrew
> > > > happened after). Yes it wasn't respected but I can't tell exactly w=
hy.
> > > >=20
> > > > So as we try to correct the documentation, I think we should also l=
ook
> > > > at consistency. If you *really* want to drop the .0, then I think it
> > > > should happen for the tag as well (again for consistency).
> > >=20
> > > I don't see why (but I also wouldn't mind the dropping from the tag).
> > > They are going to be different. Whether they're different in one or t=
wo
> > > aspects is secondary to me. I rather view the consistency goal to be
> > > with what we've been doing in the last so many releases.
> >=20
> > Another aspect to look at would be version sorting. This will be intere=
sting
> > when e.g. having a Xen rpm package installed and upgrading it with a la=
ter
> > version. I don't think we want to regard replacing an -rc version with =
the
> > .0 version to be a downgrade, so the the version numbers should be sort=
ed by
> > "sort -V" in the correct order.
>=20
> Packages version from distribution is not something we have to deal with
> upstream. It's for the one writing the package version to make sure
> that -rc are older than actual release.
>=20
> While trying to to find if SPEC files where dealing with "-rc" suffix,
> I found a doc for fedora telling how to deal with RCs:
> https://docs.fedoraproject.org/en-US/packaging-guidelines/Versioning/
> They say to replace the dash with a tilde, so "-rc" become "~rc", and
> package manager know what to do with it.
>=20
> Some other distribution know how to deal with "rc" suffix, but the dash
> "-" isn't actually allowed in the version string:
> https://man.archlinux.org/man/vercmp.8
>=20
> So unless we forgo "-rc" in tags, there's no way we can take into
> account how distributions package manager sorts version numbers. Also,
> there's no need to, it is the job of the packager to deal with version
> number, we just need to make is simple enough and consistent.

XEN_EXTRAVERSION isn't only about version for packaging (where indeed
some changes for -rc will likely be needed anyway, as different packages
have different ways of dealing with it). It's also about version
reported by Xen in various places like `xl info xen_version`. IMO it
makes sense to have consistent format there (always 3 parts separated by
a dot). It makes live easier for any tooling making use of this value.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--xD08BN9kpkQOfhTD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmaW07sACgkQ24/THMrX
1yzD3Qf/fz5HXKJSMM1619iY5VHNiCSoKKrRl4BG0WaiTlShsuM17aD6n6Temo9T
gL8uU8yoNjmfWK3sVqkq8Fk/Oo6WcBbnMy4QWtlu+VCjds7LWPCRsIMXqKhMU3F/
jLL0vpBoSRfw6AawS7ReRftOndWNlGXp7cjyhMpMkSEWvGNY085IKdZRAqOemgQ2
LXZnx5eeCRvdDTAfC03ZTeuLGzpk+VYr2MdR5BciV7FXrWZewV4sdZfii12EmcED
oGHRilH/jOcpxOyK4v0LrnZ3yPDyQR/ywpdkR1Ao81tGi60avHFTPC1sDu5kTU8e
YBEkbm2euYEwJmzwaFZwnMa++Ayt7Q==
=Terd
-----END PGP SIGNATURE-----

--xD08BN9kpkQOfhTD--

