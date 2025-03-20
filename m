Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53970A6A985
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:17:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922489.1326400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHdy-0006V9-BQ; Thu, 20 Mar 2025 15:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922489.1326400; Thu, 20 Mar 2025 15:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHdy-0006Th-8O; Thu, 20 Mar 2025 15:17:14 +0000
Received: by outflank-mailman (input) for mailman id 922489;
 Thu, 20 Mar 2025 15:17:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W2V2=WH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tvHdw-0006Tb-GG
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:17:12 +0000
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64ad83ca-059e-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:17:10 +0100 (CET)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 683C42540189;
 Thu, 20 Mar 2025 11:17:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Thu, 20 Mar 2025 11:17:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 11:17:07 -0400 (EDT)
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
X-Inumbo-ID: 64ad83ca-059e-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742483829;
	 x=1742570229; bh=JFjPC7UuvrmpO6kvEFfFIsFr34AFX1dkwhwYtXWoUVk=; b=
	sEj0tXep/WJlUOgv68MKwAEJJYGu84EazD2MGy+N2AJCRwuwIwjGdeIVXEkkLmnm
	uxywzYtnHt3qnwxf5SGPxXeStZbGTFrOro4BmWNoflOBIbvL6+058SJ9GD/2ynFs
	GuFezWTrfwmYHZBIdCmkdEeggWBaigQw5jBwuED4PFS+A3RZMgkd6kzlm6QLhiL9
	7EOOuCXAyHGEj2aKO9kqfKL2hINheo1pNU+yiXbNGDNiUvaOHkM2JmJb4bYTMKaG
	10lVz+rQKzesYthSN5Ho9X3dksu+MWMWMa2P/5d4w/N4kH0RmLV95kKw1t7nknH3
	fkV4700Yej11fYrXBOf5Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742483829; x=1742570229; bh=JFjPC7UuvrmpO6kvEFfFIsFr34AFX1dkwhw
	YtXWoUVk=; b=K2rbdYc2veEpPajBDxOeAI1b7/1erddJuLZGi/Kt+o0GNoZSGSZ
	R88++wEX8UD8V1d1lS+GeNnCvq3k9yMbjeF6fxiBNgXjfZBNbCtWRks8taFtHXty
	mygVb6BAp+7SdvpDhCfjT7R3U3EhooSAvQt7Fbo3s/TUTCLghrgNNvFhxwUJc0HI
	fdPWQGcOyneFFfVDdMU7jeLt8HXFCLgKf146XYZb9GI0WeNfdNMFOKWlo9VE/owq
	pXfYj9arpwSQDKt9JeGntBMqOCHEb4EPUGJidgfbgm9gtMkcAAzty5ZASImDlhXa
	5K04cUDLjCapfFZ+hiEuSoZuGq9pM/zeM1A==
X-ME-Sender: <xms:dDHcZyVuq_bAow3PIa-23Mifi7F22LhXbsMYGv5TE0iPkoBZNOqPgA>
    <xme:dDHcZ-k_BfQsgc-XC4U26-dsvNTsvpHxHSO70aeAmIWcBwu65jlIxHaXP8icoFYMo
    2pflszl8zUqNg>
X-ME-Received: <xmr:dDHcZ2bk042rbUKXRfaMPp0mJpwDWB8A7D8iZglAEH4uDGd3yucrnOOCvTmWKprtOHQMW0a1vRSQLqCey0dDKlgoBQKq9xq6vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    thhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopehjsggvuh
    hlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepfhhrvgguvghrihgtrdhpihgvrhhr
    vghtsehquhgsvghsqdhoshdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvg
    hrfeestghithhrihigrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegr
    mhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtoh
    eprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:dDHcZ5VPVwlMejemV1vF3N6Vy8jQbTgHLt7ieo691rcdOGlz0iObRw>
    <xmx:dDHcZ8mETDthmyxTp4rN6BgT6khdZNYH_PO-X1ptVkVTYsP8GHrN4g>
    <xmx:dDHcZ-e7EzeBTKccLsShaxfB2w0cqnLaGfvdwH8gwglYokFrBm0E7A>
    <xmx:dDHcZ-EcyislxaCC1XceMgYGKVgp7uHXhSZ87CxYNHP6GFmI3bb7bA>
    <xmx:dTHcZ5h_YxrRRBEBiL8j2MjOzH13hMYx4dekJZJf7MZ9pFrL8-noSBQx>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 20 Mar 2025 16:17:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>,
	=?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
Message-ID: <Z9wxcYapF5eno29b@mail-itl>
References: <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com>
 <e112ecca-b891-4c23-ace1-8128e586cb94@suse.com>
 <Z9qxcRtap-k-wW8B@mail-itl>
 <943644a3-45f2-46ef-a54b-6dd0bc6171ed@suse.com>
 <Z9rJUWCARMQYqNXr@mail-itl>
 <Z9vrc1Xvm5OEy8rM@l14>
 <Z9wPVGd0fEsbaO_s@mail-itl>
 <a9831a95-2828-4b46-8cae-58b2c531f507@suse.com>
 <Z9wfKB0vdngn3xXX@mail-itl>
 <Z9wnzRbwb3HQaSMu@l14>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fbynnOhQxpl+hxud"
Content-Disposition: inline
In-Reply-To: <Z9wnzRbwb3HQaSMu@l14>


--fbynnOhQxpl+hxud
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Mar 2025 16:17:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>,
	=?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86

On Thu, Mar 20, 2025 at 02:35:59PM +0000, Anthony PERARD wrote:
> On Thu, Mar 20, 2025 at 02:59:04PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Mar 20, 2025 at 02:49:27PM +0100, Jan Beulich wrote:
> > > On 20.03.2025 13:51, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Thu, Mar 20, 2025 at 10:18:28AM +0000, Anthony PERARD wrote:
> > > >> On Wed, Mar 19, 2025 at 02:40:33PM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > >>> There are clearly some build path embedding left. And
> > > >>> -ffile-prefix-map=3D/-fdebug-prefix-map=3D doesn't work correctly=
 with
> > > >>> XEN_ROOT having xen/.. at the end.
> > > >>> BTW, would it be acceptable to have this?
> > > >>>
> > > >>>     $(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(realpat=
h $(XEN_ROOT))=3D.)
> > > >>
> > > >> Hi,
> > > >>
> > > >> Could you avoid using $(XEN_ROOT) in hypervisor build system? (It'=
s fine
> > > >> in "tools/"). In "xen/", there's a few variables you can use if th=
ey are
> > > >> needed: $(abs_objtree) $(abs_srctree) for absolutes path, and $(sr=
ctree)
> > > >> $(objtree) for relative path. That also should avoid the need to u=
se
> > > >> $(realpath ).
> > > >
> > > > XEN_ROOT is literally "$(abs_srctree)/..". And I need to resolve it=
 to
> > > > not have /.. for prefix-map to work correctly. Would it be better t=
o use
> > > > literal $(realpath $(abs_srctree)/..)? Or use just $(abs_srctree) a=
nd
> > > > have paths in debug symbols relative to hypervisor source dir, inst=
ead
> > > > of xen repo root? I'm not sure if that wouldn't confuse some tools.=
=2E.
> > >
> > > abs_srctree being computed using realpath, can't we replace
> > >
> > > export XEN_ROOT :=3D $(abs_srctree)/..
> > >
> > > by something as simpl{e,istic} as
> > >
> > > export XEN_ROOT :=3D $(patsubst %/xen,%,$(abs_srctree))
> > >
> > > ?
> >
> > That works too. It's slightly less robust, but I don't expect "xen"
> > directory to be renamed, so shouldn't be an issue. I'll leave also a
> > comment there why not /.. .
>=20
> I don't think $(XEN_ROOT) is present in the binaries produce by the
> hypervisor's build system. There's only a few use if that variable: to
> load some makefile, to execute makefile that build xsm policy and to
> generate cpuid-autogen.h. Otherwise I don't think the compile have this
> path in the command line. What is going to be in the binary is
> $(abs_srctree), which you can replace by "./xen" if you want; which mean
> it doesn't matter if the directory is renamed or not. You might want to
> also take care of $(abs_objtree) which seems to also be in `xen-syms`
> when doing out-of-tree build.

So, you suggest to do -fdebug-prefix-map=3D$(abs_srctree)=3D./xen ? That
appears to work for in-tree builds too.
But now I actually tested how it looks with out-of-tree builds, and
indeed $(abs_objtree) is embedded there too. Adding
-fdebug-prefix-map=3D$(abs_objtree)=3D./xen appears to help for this. But,
-fdebug-prefix-map doesn't help with abs_srctree in out-of-tree builds
for some reason. -ffile-prefix-map does. And so does -fdebug-prefix-map
+ -fmacro-prefix-map. Is there any preference which one to use? It
appears as -fmacro-prefix-map and -ffile-prefix-map have the same
availability in both GCC (8) and Clang (10).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fbynnOhQxpl+hxud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfcMXEACgkQ24/THMrX
1yyQtgf/Rkj/YixjwoGFAbxdC+VJwf7LVAru/wx+XO+qPACLZ7PBZODGIdfEGo4P
eKe0woOFM0CrM5bBkxyAmKjurlo2ZhAyuPIfRGjcRSP6ezBs8Gid2MoNKGI7BDgI
7HARzKtlqdaqY/WX4AJCZm39spuQvqwzLnIyeowaox7ITVw5ZRwnVjwardMn/9Kq
Gs/PJ2igbP1gB0zm33/ZrCkxJXOyKH1SqqLyUbyGdVALY7DDPLvfgMvgel+pC45V
SJv3CODUK8v8uLSDZ0y8KdqZx8e+TEcJ1EEgM3bn5jJNNG9LfleGzNfE3g/6mzzv
0XShTReCbWMquHWhspnYkXpLtkKxFA==
=zhjn
-----END PGP SIGNATURE-----

--fbynnOhQxpl+hxud--

