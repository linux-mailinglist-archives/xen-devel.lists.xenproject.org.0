Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C8A6A9F6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922627.1326510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHsj-0008RE-Ev; Thu, 20 Mar 2025 15:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922627.1326510; Thu, 20 Mar 2025 15:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHsj-0008PA-CA; Thu, 20 Mar 2025 15:32:29 +0000
Received: by outflank-mailman (input) for mailman id 922627;
 Thu, 20 Mar 2025 15:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W2V2=WH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tvHsh-0007l8-S9
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:32:27 +0000
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 861d0fc5-05a0-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 16:32:26 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 8DF3311401DE;
 Thu, 20 Mar 2025 11:32:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Thu, 20 Mar 2025 11:32:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 11:32:22 -0400 (EDT)
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
X-Inumbo-ID: 861d0fc5-05a0-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742484744;
	 x=1742571144; bh=fqgH0GUHZJKXkPmZ9sH7FeUmih6lgLKzWuYTncUXMzM=; b=
	lqsqakxo+e8Fjfd16od8cP0fKiasxBLzVL/Drc+1sGilYgLlSrU2MCAK34t0NeW0
	ETTeA/+XOUhdqgTfbK7mOeIxj+a8SP3Oojkn+45sJor9yBEPA37K/ngHkxkTlRuk
	+bl7Qj7Lyq9Vp49NUI60dwvEKv3E9kdfhCGCGs2KJJhRcMn9azvlAtL+T9kyERTr
	Sz4pUxvuIuWmCuJP1+GbPgTt8NRhdr6WY1MmggsST+0BwluKiVi5Xxn4m5SHKSJm
	7gZUQbuTvrx/mD2z2guaGlO01TnMz/OITp2GW4BGtbqtEBWZfqkiAfx0w5h4M0PG
	M6hchJTzWcY1VuKmwCdVcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742484744; x=1742571144; bh=fqgH0GUHZJKXkPmZ9sH7FeUmih6lgLKzWuY
	TncUXMzM=; b=u8jaItw+uPw4sStMke3lZ9sHHKKR44k6gFaECOLxbz0nABNwZkO
	DhHWXOQ/ovQGvKrGmC15DaMaL8bmwGOZRggkiZc9PKSQgnxNyMCTxYbHwUByUqKl
	ct+Ysh6NislMRo1HVSmsCBCXhgSVgarAS7HPyPlVD3UV7dp/zf01Iw36k5vsNRwP
	BUsWEzP8bSwYwIS6Oo4GE1aVsInPNJ80ZbGggrFKUifYY8DD3a3WgAFduUy57hvu
	2FTUH1Zqnnan5nX3HBNKn3nXaLsQLafz5Ib/b3AN+qBZ7Zz1YO/GPTwkhpzimKzp
	8O4WquCsmPzVnbyRIHIIO0CxRCKjs3/Z5jw==
X-ME-Sender: <xms:CDXcZxjcWdAfWxkqzDIQjs7EVUcCAlsqsA34s57X7MtLKjNY-PCGTw>
    <xme:CDXcZ2BiFnDMw0WYJxl7g_kgttmfsu_0aHyAkIL2LYPIS5rmabyxs7HrkacT5IOS3
    TSejGMKZqTEPA>
X-ME-Received: <xmr:CDXcZxF7yr2asMQkUT-PdQBFl_FLP-z0nH7MhAXiNlK6jghWjeSskfao5aMKOQJ6UU5CfX1R0E7z7H39HMPQVyoxZByzbngxNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekheejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:CDXcZ2QYVzCrWMZ5bosX1IJ3jsvnfCJV_GMQxibzqJMbvPACrMSUsg>
    <xmx:CDXcZ-z-ckXICek8U8OTG6Hrr01QOTzT1rEKkJQdnpoCrVvWQI1XEw>
    <xmx:CDXcZ84udQ0n9eJGCZqWU-Ivi-B6jKMvv5Jltiq7vyiix8Rxg9FYnA>
    <xmx:CDXcZzyTdz-q6w1HxIaRqOV0T8IlaxWHOdd4e_RTXt8xrtfXwO1f8w>
    <xmx:CDXcZycas56zD2rnFIaSDM6x2kVV0vpgYT6QF3kzxgKmLbb92waxZtF8>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 20 Mar 2025 16:32:20 +0100
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
Message-ID: <Z9w1BLntGv4ksws0@mail-itl>
References: <Z9qxcRtap-k-wW8B@mail-itl>
 <943644a3-45f2-46ef-a54b-6dd0bc6171ed@suse.com>
 <Z9rJUWCARMQYqNXr@mail-itl>
 <Z9vrc1Xvm5OEy8rM@l14>
 <Z9wPVGd0fEsbaO_s@mail-itl>
 <a9831a95-2828-4b46-8cae-58b2c531f507@suse.com>
 <Z9wfKB0vdngn3xXX@mail-itl>
 <Z9wnzRbwb3HQaSMu@l14>
 <Z9wxcYapF5eno29b@mail-itl>
 <7698a70a-db0a-4d5d-b5ad-8c0636bc5a33@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hTCwn0V0LUlaKRIt"
Content-Disposition: inline
In-Reply-To: <7698a70a-db0a-4d5d-b5ad-8c0636bc5a33@suse.com>


--hTCwn0V0LUlaKRIt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Mar 2025 16:32:20 +0100
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

On Thu, Mar 20, 2025 at 04:21:18PM +0100, Jan Beulich wrote:
> On 20.03.2025 16:17, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Mar 20, 2025 at 02:35:59PM +0000, Anthony PERARD wrote:
> >> On Thu, Mar 20, 2025 at 02:59:04PM +0100, Marek Marczykowski-G=C3=B3re=
cki wrote:
> >>> On Thu, Mar 20, 2025 at 02:49:27PM +0100, Jan Beulich wrote:
> >>>> On 20.03.2025 13:51, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>> On Thu, Mar 20, 2025 at 10:18:28AM +0000, Anthony PERARD wrote:
> >>>>>> On Wed, Mar 19, 2025 at 02:40:33PM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> >>>>>>> There are clearly some build path embedding left. And
> >>>>>>> -ffile-prefix-map=3D/-fdebug-prefix-map=3D doesn't work correctly=
 with
> >>>>>>> XEN_ROOT having xen/.. at the end.
> >>>>>>> BTW, would it be acceptable to have this?
> >>>>>>>
> >>>>>>>     $(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(realpat=
h $(XEN_ROOT))=3D.)
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> Could you avoid using $(XEN_ROOT) in hypervisor build system? (It'=
s fine
> >>>>>> in "tools/"). In "xen/", there's a few variables you can use if th=
ey are
> >>>>>> needed: $(abs_objtree) $(abs_srctree) for absolutes path, and $(sr=
ctree)
> >>>>>> $(objtree) for relative path. That also should avoid the need to u=
se
> >>>>>> $(realpath ).
> >>>>>
> >>>>> XEN_ROOT is literally "$(abs_srctree)/..". And I need to resolve it=
 to
> >>>>> not have /.. for prefix-map to work correctly. Would it be better t=
o use
> >>>>> literal $(realpath $(abs_srctree)/..)? Or use just $(abs_srctree) a=
nd
> >>>>> have paths in debug symbols relative to hypervisor source dir, inst=
ead
> >>>>> of xen repo root? I'm not sure if that wouldn't confuse some tools.=
=2E.
> >>>>
> >>>> abs_srctree being computed using realpath, can't we replace
> >>>>
> >>>> export XEN_ROOT :=3D $(abs_srctree)/..
> >>>>
> >>>> by something as simpl{e,istic} as
> >>>>
> >>>> export XEN_ROOT :=3D $(patsubst %/xen,%,$(abs_srctree))
> >>>>
> >>>> ?
> >>>
> >>> That works too. It's slightly less robust, but I don't expect "xen"
> >>> directory to be renamed, so shouldn't be an issue. I'll leave also a
> >>> comment there why not /.. .
> >>
> >> I don't think $(XEN_ROOT) is present in the binaries produce by the
> >> hypervisor's build system. There's only a few use if that variable: to
> >> load some makefile, to execute makefile that build xsm policy and to
> >> generate cpuid-autogen.h. Otherwise I don't think the compile have this
> >> path in the command line. What is going to be in the binary is
> >> $(abs_srctree), which you can replace by "./xen" if you want; which me=
an
> >> it doesn't matter if the directory is renamed or not. You might want to
> >> also take care of $(abs_objtree) which seems to also be in `xen-syms`
> >> when doing out-of-tree build.
> >=20
> > So, you suggest to do -fdebug-prefix-map=3D$(abs_srctree)=3D./xen ? That
> > appears to work for in-tree builds too.
>=20
> And why ./xen (question to Anthony)? Just . is quite fine, isn't it?

It makes paths in debug symbols relative to xen/ subdir, not the
repository root. I'm not sure if that is a problem, but it may be for
some tools.

> > But now I actually tested how it looks with out-of-tree builds, and
> > indeed $(abs_objtree) is embedded there too. Adding
> > -fdebug-prefix-map=3D$(abs_objtree)=3D./xen appears to help for this. B=
ut,
> > -fdebug-prefix-map doesn't help with abs_srctree in out-of-tree builds
> > for some reason. -ffile-prefix-map does. And so does -fdebug-prefix-map
> > + -fmacro-prefix-map. Is there any preference which one to use? It
> > appears as -fmacro-prefix-map and -ffile-prefix-map have the same
> > availability in both GCC (8) and Clang (10).
>=20
> Then the simpler -ffile-prefix-map is better, imo. Question then is
> whether any of the options is actually needed at all for in-tree builds.

Yes, without any of those options, both xen-syms and xen.efi contain
full source path.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--hTCwn0V0LUlaKRIt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfcNQQACgkQ24/THMrX
1yz0bgf/d8TzAAeS4fcZHHpwOUgvL+TXLNJyARUlnPYBTfXz0SlgXc/cgD9Bv2KY
n0mnbNx86IWcPrPYyvmldRdBbbTDKcvzhmsdYwPTS3tCxAyqgnG/6Rq8ohBw0n8P
sC29sAkHiV1zmVL98NsxOmkhY957mqwHSA7SQ7QTa577eu2CDd9dcPWbTwLDqUOt
Lqx2sL1BXaTW/wWcVPHh3VPqQySQT1bmXXoRQDMNmYdsABf+MBoHLHJUU4sTEBWl
f54jdesUxL7crEZw4vI9YmZhXbRG+iSfxVE9V7P3bmzr4pZP/9S6FMyRaA/WCh46
V3H5BUj7VppbhPUopLTPQ5Mk6/Ci+A==
=oFcf
-----END PGP SIGNATURE-----

--hTCwn0V0LUlaKRIt--

