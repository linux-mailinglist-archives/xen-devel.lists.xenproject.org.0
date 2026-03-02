Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNXXL1VupWlXAgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:02:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB121D71C0
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244114.1543576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx11s-0001WZ-QR; Mon, 02 Mar 2026 11:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244114.1543576; Mon, 02 Mar 2026 11:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx11s-0001Tx-NI; Mon, 02 Mar 2026 11:01:36 +0000
Received: by outflank-mailman (input) for mailman id 1244114;
 Mon, 02 Mar 2026 11:01:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cp9A=BC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vx11q-0001Tr-IU
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 11:01:34 +0000
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b77b212-1627-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 12:01:32 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id C30871400023;
 Mon,  2 Mar 2026 06:01:30 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Mon, 02 Mar 2026 06:01:30 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Mar 2026 06:01:29 -0500 (EST)
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
X-Inumbo-ID: 2b77b212-1627-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772449290;
	 x=1772535690; bh=gAnUHTIVsOphxH3jyKd6jjpZxGBmcBzWVjjSXF5mb/8=; b=
	D12sCPCo9Jyzk/9pz+hZCOZyyy91Re0fRXsuhdPa2ghP0/IqgoW34U4z574+llbX
	Yj5hzl0WGL9A6aejGHFlbthF5obxHFB55HFjtCGPWpWP1onKrlDtJrC5ffg9vypP
	jUI5NFa1TgCgHtCAWGzzNIi5pqe8LIV9gHbLkNApnBVFkVrZ8+5SiXck7+ct1Wrm
	pScNRqIEy3MdwiTFLKfb6nouCroKL7e9svJPHv4XIE1xR3ZK5OoFeU1uBAlWfWIA
	my1tlkQT4LvhNRrqfnsYxksfd+NOY41eDiEG7O+YnztYQjpxTrbm072BGESAmV2h
	hs3C9LvPx/N1gmrmzd+FFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772449290; x=1772535690; bh=gAnUHTIVsOphxH3jyKd6jjpZxGBmcBzWVjj
	SXF5mb/8=; b=ILiMlA6p/wrbsSR+73ZIT/kTIAp8djEWaHUKYgWD0+6B2jt0vw1
	70ejSC6W8UHG4Gw7bmIXYXNxeT782DcdezTRQOvasCYiWboERj4kL1A0xqBV8ODG
	3mVv9BV00EMRn5LiTMoIEOpiZTmN5ltXQexW0+qevbsqZj48ulSTF+tz+JWFGijU
	8KIEnQK0p29RR6S+xM8xi2F1ssz9Yhk9/oXH5DTab4K02JYUGx0pE8ep73zH1kqX
	lQCTjM/xQOnXyGvmrdttukzJYWPFvahTEvoSQepVU5UgD71JP6rjf9btodiAjNwA
	NemKJbTWN2xqVNE6QWohm7wl9F+Qd4QVB8w==
X-ME-Sender: <xms:Cm6ladzIH2JVDwbgwGO_iZPv-5akMvI05oBd-Fxq4LVn75xfNQqnRg>
    <xme:Cm6laUIU-2M5ixi6S60dMj6w19ag24PDrwV_6gJLIrqSF28miw3c2KKcAF0WgQb-z
    Fpw3N-PNron37e8M20vm8W4DqtVEEllBA0CMmAymcriLXKr>
X-ME-Received: <xmr:Cm6lafp-BbKhnLyPEnJ3cv0nv5C91im9Y0DcUou2zL2IF8sJf4iAJH2ByUqLAGXmXrx-jSD2BEsE1FFVmI8eMNVC4dMeD4GOd7o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheejhedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegs
    ohhrihhsrdhoshhtrhhovhhskhihsehorhgrtghlvgdrtghomhdprhgtphhtthhopegrkh
    hpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:Cm6labLWhBycmDJTF3c7ZZUdXVSGaFQuwYMPMtvYz9gRHtShtmhaDA>
    <xmx:Cm6lacQSofoZb_bFr_TcbirR9lpa1BKnhSaeTU0el1Majjzmenb6MQ>
    <xmx:Cm6laStvHbZRpkecAnon90u0b80LV_xcJ5EUlINbvOxhydi4oosT6w>
    <xmx:Cm6laVY_RhjiVOXlUUG8FEQqQtTlyUY_hx4qM5R5zlzaot7Z-OsIpA>
    <xmx:Cm6laXowxVF9k1p7ZvLc79dsSm8K2dy5Rn-GopL6GSMrNcx-1YsNkO4D>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 2 Mar 2026 12:01:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: Excluding init_on_free for pages for initial balloon down (Xen)
Message-ID: <aaVuB3x3y4ROr5XA@mail-itl>
References: <aaRVcVmtv2UBD-GF@mail-itl>
 <513e624f-35c1-4d43-ba3f-c96af613d400@suse.com>
 <224968e6-7236-4efe-bcc0-ab39ac0c6c45@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3fNdNAge+ez4rrPi"
Content-Disposition: inline
In-Reply-To: <224968e6-7236-4efe-bcc0-ab39ac0c6c45@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,m:akpm@linux-foundation.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0BB121D71C0
X-Rspamd-Action: no action


--3fNdNAge+ez4rrPi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 Mar 2026 12:01:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: Excluding init_on_free for pages for initial balloon down (Xen)

On Mon, Mar 02, 2026 at 09:40:29AM +0100, David Hildenbrand (Arm) wrote:
> On 3/2/26 07:36, J=C3=BCrgen Gro=C3=9F wrote:
> > On 01.03.26 16:04, Marek Marczykowski-G=C3=B3recki wrote:
> >> Hi,
> >>
> >> Some time ago I made a change to disable scrubbing pages that are
> >> ballooned out during system boot. I'll paste the whole commit message =
as
> >> it's relevant here:
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0 197ecb3802c0 xen/balloon: add runtime control=
 for scrubbing
> >> ballooned out pages
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0 Scrubbing pages on initial balloon down can t=
ake some time,
> >> especially
> >> =C2=A0=C2=A0=C2=A0=C2=A0 in nested virtualization case (nested EPT is =
slow). When HVM/PVH
> >> guest is
> >> =C2=A0=C2=A0=C2=A0=C2=A0 started with memory=3D significantly lower th=
an maxmem=3D, all the extra
> >> =C2=A0=C2=A0=C2=A0=C2=A0 pages will be scrubbed before returning to Xe=
n. But since most of
> >> them
> >> =C2=A0=C2=A0=C2=A0=C2=A0 weren't used at all at that point, Xen needs =
to populate them first
> >> =C2=A0=C2=A0=C2=A0=C2=A0 (from populate-on-demand pool). In nested vir=
t case (Xen inside KVM)
> >> =C2=A0=C2=A0=C2=A0=C2=A0 this slows down the guest boot by 15-30s with=
 just 1.5GB needed
> >> to be
> >> =C2=A0=C2=A0=C2=A0=C2=A0 returned to Xen.
> >> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 Add runtime paramete=
r to enable/disable it, to allow
> >> initially disabling
> >> =C2=A0=C2=A0=C2=A0=C2=A0 scrubbing, then enable it back during boot (f=
or example in
> >> initramfs).
> >> =C2=A0=C2=A0=C2=A0=C2=A0 Such usage relies on assumption that a) most =
pages ballooned out
> >> during
> >> =C2=A0=C2=A0=C2=A0=C2=A0 initial boot weren't used at all, and b) even=
 if they were, very few
> >> =C2=A0=C2=A0=C2=A0=C2=A0 secrets are in the guest at that time (before=
 any serious userspace
> >> =C2=A0=C2=A0=C2=A0=C2=A0 kicks in).
> >> =C2=A0=C2=A0=C2=A0=C2=A0 Convert CONFIG_XEN_SCRUB_PAGES to CONFIG_XEN_=
SCRUB_PAGES_DEFAULT
> >> (also
> >> =C2=A0=C2=A0=C2=A0=C2=A0 enabled by default), controlling default valu=
e for the new runtime
> >> =C2=A0=C2=A0=C2=A0=C2=A0 switch.
> >>
> >> Now, I face the same issue with init_on_free/init_on_alloc (not sure
> >> which one applies here, probably the latter one), which several
> >> distributions enable by default. The result is (see timestamps):
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0 [2026-02-24 01:12:55] [=C2=A0=C2=A0=C2=A0 7.4=
85151] xen:balloon: Waiting for
> >> initial ballooning down having finished.
> >> =C2=A0=C2=A0=C2=A0=C2=A0 [2026-02-24 01:14:14] [=C2=A0=C2=A0 86.581510=
] xen:balloon: Initial
> >> ballooning down finished.
> >>
> >> But here the situation is a bit more complicated:
> >> init_on_free/init_on_alloc applies to any pages, not just those for
> >> balloon driver. I see two approaches to solve the issue:
> >> 1. Similar to xen_scrub_pages=3D, add a runtime switch for
> >> =C2=A0=C2=A0=C2=A0 init_on_free/init_on_alloc, then force them off dur=
ing boot, and
> >> =C2=A0=C2=A0=C2=A0 re-enable early in initramfs.
> >> 2. Somehow adjust balloon driver to bypass init_on_alloc when ballooni=
ng
> >> =C2=A0=C2=A0=C2=A0 a page out.
> >>
> >> The first approach is likely easier to implement, but also has some
> >> drawbacks: it may result in some kernel structures that are allocated
> >> early to remain with garbage data in uninitialized places. While it may
> >> not matter during early boot, such structures may survive for quite so=
me
> >> time, and maybe attacker can use them later on to exploit some other
> >> bug. This wasn't really a concern with xen_scrub_pages, as those pages
> >> were immediately ballooned out.
> >>
> >> The second approach sounds architecturally better, and maybe
> >> init_on_alloc could be always bypassed during balloon out? The balloon
> >> driver can scrub the page on its own already (which is enabled by
> >> default). That of course assumes the issue is only about init_on_alloc,
> >> not init_on_free (or both) - which I haven't really confirmed yet...
> >> If going this way, I see the balloon driver does basically
> >> alloc_page(GFP_BALLOON), where GFP_BALLOON is:
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0 /* When ballooning out (allocating memory to =
return to Xen) we
> >> don't really
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 want the kernel to try too =
hard since that can trigger the oom
> >> killer. */
> >> =C2=A0=C2=A0=C2=A0=C2=A0 #define GFP_BALLOON \
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (GFP_HIGHUSER | __GFP=
_NOWARN | __GFP_NORETRY | __GFP_NOMEMALLOC)
> >>
> >> Would that be about adding some new flag here? Or maybe there is alrea=
dy
> >> one for this purpose?
> >=20
> > There doesn't seem to be a flag for that.
> >=20
> > But I think adding a new flag __GFP_NO_INIT and testing that in
> > want_init_on_alloc() _before_ checking CONFIG_INIT_ON_ALLOC_DEFAULT_ON
> > would be a sensible approach.
>=20
> People argued against such flags in the past, because it will simply get
> abused by arbitrary drivers that want to be smart.

Could it be named differently to discourage such usage? Maybe
__GFP_BALLOON_OUT ?

> Whatever leaves the buddy shall be zeroed out. If there is a
> double-zeroing happen, the latter could get optimized out by checking
> something like user_alloc_needs_zeroing().
>=20
> See mm/huge_memory.c:vma_alloc_anon_folio_pmd() as an example where we
> avoid double-zeroing.

It isn't just reducing double-zeroing to single zeroing. It's about
avoiding zeroing such pages at all. If a domU is started with
populate-on-demand, many (sometimes most) of its pages are populated in
EPT. The idea of PoD is to start guest with high static memory size, but
low actual allocation and fake it until balloon driver kicks in and make
the domU really not use more pages than it has. When balloon driver try
to return those pages to the hypervisor, normally it would just take
unallocated page one by one and made Linux not use them. But if _any_
zeroing is happening, each page first needs to be mapped to the guest by
the hypervisor (one trip through EPT), just to be removed from them a
moment later...

> >> Any opinions?
> >=20
> > You are aware of the "init_on_alloc" boot parameter? So if this is fine
> > for you, you could just use approach 1 above without any kernel patches
> > needed.
>=20
> I don't think init_on_alloc can be enabled after boot. IIUC, 1) would
> require a runtime switch.

Indeed.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3fNdNAge+ez4rrPi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmlbgcACgkQ24/THMrX
1yxLgwf+K1N8BeW0SQO59+jFd9tMVnt8D5VFKACsD0lsn6Bzv/iR2EcZ78lOtwoa
LZupAST9CXhgWxCCBRtZUN9RHmg8ZcAT/sa61SBWhk/zCSabDFvYswhooU4kjJcR
yWoOpX6VNRMwnVRQCmssKYNV+JDfPCUT/YXZWsSqIkBg+VsQRBnUKJnQn44+dtTV
1vgNH8FdeMdX9l1/94Fpgj97l5mYEV/qxf+3+T4GbF+oY0KU7rSin+wvlFmLyzWa
t2AtjsGJRrCdRrvC1IzKds8vYeR0MJxNCBWDvJcKREoNcLsv6gGpuH5QZKEwR1rc
p+PPymMOfFFucm6OP1ArTYLpNM+hTw==
=PItR
-----END PGP SIGNATURE-----

--3fNdNAge+ez4rrPi--

