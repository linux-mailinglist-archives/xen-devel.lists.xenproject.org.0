Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3626EA6AA75
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922804.1326620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIIO-0004Ex-04; Thu, 20 Mar 2025 15:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922804.1326620; Thu, 20 Mar 2025 15:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIIN-0004Bp-TC; Thu, 20 Mar 2025 15:58:59 +0000
Received: by outflank-mailman (input) for mailman id 922804;
 Thu, 20 Mar 2025 15:58:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W2V2=WH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tvIIM-0004Bj-Lx
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:58:58 +0000
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ac0b82d-05a4-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:58:57 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 17B4725400A2;
 Thu, 20 Mar 2025 11:58:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Thu, 20 Mar 2025 11:58:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 11:58:54 -0400 (EDT)
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
X-Inumbo-ID: 3ac0b82d-05a4-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742486335;
	 x=1742572735; bh=vs77XISaEyknKglVuewdgR/XEMyZar3p3vMvSfKLGHg=; b=
	JdC7XDW/5JkDGiGqav7PYauHr5mqPTrq64gQNV3UAHW75zoCG73VDI2huwUIhp9L
	R3B0xz8R+dhEJNoMHawV+MlLOYXbteG9GPVSJc9MxepSUSx9H4mkZ+Pae1xzCNdC
	aYudUTAd7wCtadk2KV2p4fMQSBbzF2rHpti5rI2ESrmdI0o021FFukO6XvKrLEba
	+nhl7/KMQK5sKOtWhISvTBG08q3spLCfcHriZTnMic8lR/izziyGeMgM+L0OEIRg
	AzRqkgkUWkRoBPA5bp8dcJxRlF6yXNCk2hwQ4u9WAd8IDNd1xHjI3fbRyl2UHECg
	pvCPGCUQzZoJVp/stgta+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742486335; x=1742572735; bh=vs77XISaEyknKglVuewdgR/XEMyZar3p3vM
	vSfKLGHg=; b=b+9uJrHkk3BXkDk1feCO9uONulhwr6GOCQqQKqSN8Kr+IT8/LW0
	Q1FpmjEoeDypqiNZDs3SymKFDd71ZoephpgZS/wAlSAmv55EGNayO/TiX+P4Eerc
	3ptmTXKreat2PGkoa5+vOqI0MVc0futEyqzcQLY60T3AIMxTKNYXigIPXeOH8RhB
	fY5RQDD0aPiKaOhDo/0WeMoVgY0SUkRWam/Nfi+KRUHyp+2j5UcsfVd9kLA5YpFd
	N7tqQGsb1dummGIEB/+kTJcxdP/nM5mrDT9lwXRv4c+n0kwJSYWNn1AK8sC1kZTw
	pXNW9pb3qr4zkLrBRq9J0OOjpHj6zIBat9A==
X-ME-Sender: <xms:PzvcZ-95CYO68b-sC6cVVWGS8nWfjZKtvzAIdiPY1de3rDK1KGbB4Q>
    <xme:PzvcZ-vA30BCxBgO9qx-t1-mx1yn-TB9adPaWFS-b0Pp0Z7OSeIDduI3y7GW7QJgE
    8MecQMI3fP-BQ>
X-ME-Received: <xmr:PzvcZ0CenEA9gQENf6OqU23zR5EzLQ_EJ2dPOuyK7ImxXQM_IgPV5N8NJ9v3O5XXoJAcA6nzq2Y4UWPvk5HlFiK4wLlvi6V-YQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgs
    vghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrg
    hrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepfhhrvgguvghrihgtrdhpihgvrhhr
    vghtsehquhgsvghsqdhoshdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvg
    hrfeestghithhrihigrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegr
    mhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtoh
    eprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:PzvcZ2dNwOAT693ZMNw1Wwhsqu9oSDdn3pohZuJpAj_lMJuUB8cC3w>
    <xmx:PzvcZzNDo2CaPnslQTR5YrN8wXKFqt5ZkdJsoCtqNy1di_F3WJ7FqA>
    <xmx:PzvcZwkLzoFgLJ7onRr6uINsDncNrOGjMJ7Dn1XTh53C5Z-1H-nO1A>
    <xmx:PzvcZ1tajs9aFsgfx6guA33ExScWnvd0wPRGU1sh7B5L4LZMotGuUQ>
    <xmx:PzvcZ-qVL2Fdrn3QvreuFaidw_ll-LfjtWj4k7f_JBokn96ynRHMvUgi>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 20 Mar 2025 16:58:51 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
Message-ID: <Z9w7PPEbF1STQNBt@mail-itl>
References: <Z9rJUWCARMQYqNXr@mail-itl>
 <Z9vrc1Xvm5OEy8rM@l14>
 <Z9wPVGd0fEsbaO_s@mail-itl>
 <a9831a95-2828-4b46-8cae-58b2c531f507@suse.com>
 <Z9wfKB0vdngn3xXX@mail-itl>
 <Z9wnzRbwb3HQaSMu@l14>
 <Z9wxcYapF5eno29b@mail-itl>
 <7698a70a-db0a-4d5d-b5ad-8c0636bc5a33@suse.com>
 <Z9w1BLntGv4ksws0@mail-itl>
 <fb116d7e-e678-4ac9-920a-de7e5b227417@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jK6+AJvn7uqndI3R"
Content-Disposition: inline
In-Reply-To: <fb116d7e-e678-4ac9-920a-de7e5b227417@suse.com>


--jK6+AJvn7uqndI3R
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Mar 2025 16:58:51 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86

On Thu, Mar 20, 2025 at 04:48:02PM +0100, Jan Beulich wrote:
> On 20.03.2025 16:32, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Mar 20, 2025 at 04:21:18PM +0100, Jan Beulich wrote:
> >> On 20.03.2025 16:17, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Thu, Mar 20, 2025 at 02:35:59PM +0000, Anthony PERARD wrote:
> >>>> On Thu, Mar 20, 2025 at 02:59:04PM +0100, Marek Marczykowski-G=C3=B3=
recki wrote:
> >>>>> On Thu, Mar 20, 2025 at 02:49:27PM +0100, Jan Beulich wrote:
> >>>>>> On 20.03.2025 13:51, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>>>> On Thu, Mar 20, 2025 at 10:18:28AM +0000, Anthony PERARD wrote:
> >>>>>>>> On Wed, Mar 19, 2025 at 02:40:33PM +0100, Marek Marczykowski-G=
=C3=B3recki wrote:
> >>>>>>>>> There are clearly some build path embedding left. And
> >>>>>>>>> -ffile-prefix-map=3D/-fdebug-prefix-map=3D doesn't work correct=
ly with
> >>>>>>>>> XEN_ROOT having xen/.. at the end.
> >>>>>>>>> BTW, would it be acceptable to have this?
> >>>>>>>>>
> >>>>>>>>>     $(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(realp=
ath $(XEN_ROOT))=3D.)
> >>>>>>>>
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> Could you avoid using $(XEN_ROOT) in hypervisor build system? (I=
t's fine
> >>>>>>>> in "tools/"). In "xen/", there's a few variables you can use if =
they are
> >>>>>>>> needed: $(abs_objtree) $(abs_srctree) for absolutes path, and $(=
srctree)
> >>>>>>>> $(objtree) for relative path. That also should avoid the need to=
 use
> >>>>>>>> $(realpath ).
> >>>>>>>
> >>>>>>> XEN_ROOT is literally "$(abs_srctree)/..". And I need to resolve =
it to
> >>>>>>> not have /.. for prefix-map to work correctly. Would it be better=
 to use
> >>>>>>> literal $(realpath $(abs_srctree)/..)? Or use just $(abs_srctree)=
 and
> >>>>>>> have paths in debug symbols relative to hypervisor source dir, in=
stead
> >>>>>>> of xen repo root? I'm not sure if that wouldn't confuse some tool=
s...
> >>>>>>
> >>>>>> abs_srctree being computed using realpath, can't we replace
> >>>>>>
> >>>>>> export XEN_ROOT :=3D $(abs_srctree)/..
> >>>>>>
> >>>>>> by something as simpl{e,istic} as
> >>>>>>
> >>>>>> export XEN_ROOT :=3D $(patsubst %/xen,%,$(abs_srctree))
> >>>>>>
> >>>>>> ?
> >>>>>
> >>>>> That works too. It's slightly less robust, but I don't expect "xen"
> >>>>> directory to be renamed, so shouldn't be an issue. I'll leave also a
> >>>>> comment there why not /.. .
> >>>>
> >>>> I don't think $(XEN_ROOT) is present in the binaries produce by the
> >>>> hypervisor's build system. There's only a few use if that variable: =
to
> >>>> load some makefile, to execute makefile that build xsm policy and to
> >>>> generate cpuid-autogen.h. Otherwise I don't think the compile have t=
his
> >>>> path in the command line. What is going to be in the binary is
> >>>> $(abs_srctree), which you can replace by "./xen" if you want; which =
mean
> >>>> it doesn't matter if the directory is renamed or not. You might want=
 to
> >>>> also take care of $(abs_objtree) which seems to also be in `xen-syms`
> >>>> when doing out-of-tree build.
> >>>
> >>> So, you suggest to do -fdebug-prefix-map=3D$(abs_srctree)=3D./xen ? T=
hat
> >>> appears to work for in-tree builds too.
> >>
> >> And why ./xen (question to Anthony)? Just . is quite fine, isn't it?
> >=20
> > It makes paths in debug symbols relative to xen/ subdir, not the
> > repository root. I'm not sure if that is a problem, but it may be for
> > some tools.
>=20
> Yet especially in the symbol table (and hence in strack traces) that's
> unnecessary extra space it takes up.
>=20
> >>> But now I actually tested how it looks with out-of-tree builds, and
> >>> indeed $(abs_objtree) is embedded there too. Adding
> >>> -fdebug-prefix-map=3D$(abs_objtree)=3D./xen appears to help for this.=
 But,
> >>> -fdebug-prefix-map doesn't help with abs_srctree in out-of-tree builds
> >>> for some reason. -ffile-prefix-map does. And so does -fdebug-prefix-m=
ap
> >>> + -fmacro-prefix-map. Is there any preference which one to use? It
> >>> appears as -fmacro-prefix-map and -ffile-prefix-map have the same
> >>> availability in both GCC (8) and Clang (10).
> >>
> >> Then the simpler -ffile-prefix-map is better, imo. Question then is
> >> whether any of the options is actually needed at all for in-tree build=
s.
> >=20
> > Yes, without any of those options, both xen-syms and xen.efi contain
> > full source path.
>=20
> Even in builds without debug info?=20

For in-tree build without debug info, it appears no. But with debug
info, something is needed even for in-tree build.
And BTW, IIUC out-of-tree builds will become relevant even for in-tree
build at some point, due to pvshim.

> Imo a goal ought to be to specify the
> weakest possible of these options for any particular build mode. I.e.
> possibly -ffile-prefix-map=3D for out of tree builds, else
> -fdebug-prefix-map=3D when DEBUG_INFO=3Dy, else nothing (if possible).

Is it? I don't really see why making the selection overly complex if the
option is supported (and cc-option-add covers that case).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--jK6+AJvn7uqndI3R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfcOzwACgkQ24/THMrX
1yz35Af9HPkDjLIdxtznK3YyMS9FWWfZV1rqVbuMD724nAxTO4US3FuDKmz3PcOx
1ZdbzhERATg6KmzPJ1Y6ScfHB5k/vhuKbAGwMzRXaij6PGEVc/aO3E5eanQtjnpi
tvoIGUfEWFmd8A3FAXpxNdkUimDFiwVU25wntAzaY0OSyGRTXOFoKWrXQygsALPS
dkyq68XDIdyccrMQw+4WgLR3VhaowFz/FtqpA7xHFzY6LN2AHMR9xCvNbyvZ6RjL
pyuHzTu7Zn2znUcwUtE2qlhemOFkkdGZutkG1UB/O2XN3kKox+cd7FkYzicfG7uA
TyMfOqM/iqo6eGGaBLGc6+oRhaJpcg==
=LdrI
-----END PGP SIGNATURE-----

--jK6+AJvn7uqndI3R--

