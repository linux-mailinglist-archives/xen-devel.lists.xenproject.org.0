Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OHpHbqopWmpDgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:11:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8AB1DB88F
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:11:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244302.1543740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx4vR-00073W-1k; Mon, 02 Mar 2026 15:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244302.1543740; Mon, 02 Mar 2026 15:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx4vQ-00071T-VC; Mon, 02 Mar 2026 15:11:12 +0000
Received: by outflank-mailman (input) for mailman id 1244302;
 Mon, 02 Mar 2026 15:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cp9A=BC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vx4vQ-00071N-0N
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:11:12 +0000
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09dfad83-164a-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 16:11:08 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 4C57C1D00231;
 Mon,  2 Mar 2026 10:11:06 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Mon, 02 Mar 2026 10:11:06 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Mar 2026 10:11:04 -0500 (EST)
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
X-Inumbo-ID: 09dfad83-164a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772464266;
	 x=1772550666; bh=G24RGZBjHPFOcShGwGjtJ8caC1FzHlA/t0hF5wZgn9c=; b=
	bv1cihPJhnbx3v8DhHB79R5TJpJVuiU8OxBRgcisWXPnWAzwq7uBh/hdDfN4Ae3X
	C2seMVC7kxmEO9BbMEQu80P/Dnj+NttxSLMlNdBGypCOpAmedaXG6N0lUUUpB+Cj
	q43QNt1hnX7nkxtns4wkWVjc7C+VGAj3Wgz896nEM5xoHflPY5hspRRKBxDLAVXG
	z3hyGypHxksDyYAQO2lSRnaqluqgHGoQysr/2HZuS4S7UrCuNYpchPT3IYYd15rW
	GfK++/ZJrCa/B1N/aEaIc9+Cb92iIFeLKhqviT+TPYj91s8JkXL7XeOH64thER+H
	xEebQpaFpIhU/6yJCZu8Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772464266; x=1772550666; bh=G24RGZBjHPFOcShGwGjtJ8caC1FzHlA/t0h
	F5wZgn9c=; b=RzaYC7Vh/wmZhzD40BszbqWPqEsg6FNcOJ3gDqILrdiCUd3De62
	oBk0QpWJFrhJfBQRWs3GywP8gYLaLD0EFuoLv2bm/To7bthv6/vIrdPB6AypB7ga
	jy5gXdHL9D7R9uMtaS3ZCjvV8vTHbPb5KXT0icjeGMGu9bc5Msp5Xq3i/K0AEc25
	UiBIFdICkA4FkWPjbM0naS5AnHHVhlR0giMSohwJKG0dcWDYsEqaRonnvXvk6Y/j
	UbYwGtzcWfMDB+3iT6tn+0nwQHUfd+BQSgfg1hzijj4AEeAfxKB8HSYNZVKCDiQj
	8YhRUZjAOXZ1oZGxLREmdSJT3b0yXD1if9g==
X-ME-Sender: <xms:iailaeDZpghtf44tYRwCqGWLaodyWbf0EqSgh1ziUadKBZETYPOJxg>
    <xme:iailaawIGLDLCQMf2Ogvf4tEZx66Bz2AoMLz39YyoqYdHw4wBAut7UqKAMUs1rhCs
    VWxtM3zoTkpTwxFyx5Qso4vCGC-EPTrsKPadIvEugq-LlZgKA>
X-ME-Received: <xmr:iailaT0V2qNAShIpa2T78FrSl4oThmckKSJbVUG_zo-6lDeure62MdJXAprRZ4ztMQVJheMdF6TTb2yqzW70MfS5P40iKSHdI08>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheektddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegs
    ohhrihhsrdhoshhtrhhovhhskhihsehorhgrtghlvgdrtghomhdprhgtphhtthhopegrkh
    hpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepvhgsrggs
    khgrsehsuhhsvgdrtgiipdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorh
    hg
X-ME-Proxy: <xmx:iailaSxH27vpVDLkqdCVspOgFPwiPOpM4qNXirK0raRbIqF2uMIusw>
    <xmx:iailaSGqkwoKZ1RmBj433ikmczZCAUHBNAh3887YfgivKuw__GrQIw>
    <xmx:iailadZ1cvLoKdtL8fvkm7dSCh4A9DVKEgYEwbkEfVPw0sVzS6Lt3w>
    <xmx:iailacDLvLk-EPzP9Gw_sa0I_ZHT2y9ellDxAdphOKSSnBObA-4ZXg>
    <xmx:iqilaY0HnQb33ioVr7cH80GymHby5IbQVsy_teNrOWas96u321-31s9f>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 2 Mar 2026 16:11:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
Subject: Re: Excluding init_on_free for pages for initial balloon down (Xen)
Message-ID: <aaWohimzb5P8n0YU@mail-itl>
References: <aaRVcVmtv2UBD-GF@mail-itl>
 <513e624f-35c1-4d43-ba3f-c96af613d400@suse.com>
 <224968e6-7236-4efe-bcc0-ab39ac0c6c45@kernel.org>
 <aaVuB3x3y4ROr5XA@mail-itl>
 <663cff60-8181-4a47-beff-204bfe01bb06@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MpPnWTvKkkn2ESlm"
Content-Disposition: inline
In-Reply-To: <663cff60-8181-4a47-beff-204bfe01bb06@kernel.org>
X-Rspamd-Queue-Id: CE8AB1DB88F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,m:akpm@linux-foundation.org,m:vbabka@suse.cz,m:linux-mm@kvack.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action


--MpPnWTvKkkn2ESlm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 Mar 2026 16:11:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
Subject: Re: Excluding init_on_free for pages for initial balloon down (Xen)

On Mon, Mar 02, 2026 at 03:54:12PM +0100, David Hildenbrand (Arm) wrote:
> >=20
> >> Whatever leaves the buddy shall be zeroed out. If there is a
> >> double-zeroing happen, the latter could get optimized out by checking
> >> something like user_alloc_needs_zeroing().
> >>
> >> See mm/huge_memory.c:vma_alloc_anon_folio_pmd() as an example where we
> >> avoid double-zeroing.
> >=20
> > It isn't just reducing double-zeroing to single zeroing. It's about
> > avoiding zeroing such pages at all. If a domU is started with
> > populate-on-demand, many (sometimes most) of its pages are populated in
> > EPT. The idea of PoD is to start guest with high static memory size, but
> > low actual allocation and fake it until balloon driver kicks in and make
> > the domU really not use more pages than it has. When balloon driver try
> > to return those pages to the hypervisor, normally it would just take
> > unallocated page one by one and made Linux not use them. But if _any_
> > zeroing is happening, each page first needs to be mapped to the guest by
> > the hypervisor (one trip through EPT), just to be removed from them a
> > moment later...
>=20
> The same is true for most balloon drivers, including virtio-balloon.
>=20
> So far nobody really cared about that, though, as init_on_free usually
> comes with such a high performance price tag that people in cheap VMs
> (where you overcommit etc) don't enable it.
>=20
> __GFP_BALLOON_OUT is just nasty.
>=20
> We could probably have a special allocation interface (not exposed to
> arbitrary kernel modules) and have things like mm/balloon.c consume that.
>=20
>=20
> IIUC, xen balloon does not use the memory balloon infrastructure,
> though.

Is there some fundamental reason for that? By looking at the code, the
migration to use mm/balloon.c shouldn't be that hard (famous last
words...).

> So we'd need some EXPORT_SYMBOL_FOR_MODULES() magic.

Then this wouldn't be necessary.

> Like an
>=20
> 	struct page *alloc_balloon_pages(gfp_t gfp, unsigned int order);
>=20
> Where we only support a subset of gfp flags, for example, to now having
> to deal with mempolicy.
>=20
> But it needs a bit of code to make it fly, so I am not sure if the page
> allocator wants to support that.


PS adding linux-mm, which I forgot initially...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--MpPnWTvKkkn2ESlm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmlqIYACgkQ24/THMrX
1yzgLAf/ZIEUT6k9z5/fgbuUUNXHUz/cYZVPQQ7+FxWEUSulVLSDU11knsr8AE8V
KxL6265ebqfUlsCxJC/wi4zFN29L+Dy9JHUy5hMAPUSoQF2DPjKjG6JKvFYixjiA
pT/r6IV65IORZtyKlkkhrcoXI/hKSWclI05axyUwS1xvtEtEmoS1Mb8bZy3jlOue
N9tMSkq7MECf8cTg6CXK+koIG3A3WZDS1ZN3jZy7sF9/tKhQILstDQnsBsm8unfb
+vOUYUGxftpEGYeJLBHcq/ExwQS9E6FX4aaDF/ISzt8Z06KWRxyROBQYFXvPkftN
zhM67qb2vVV2kFIVpKHV6mat3UONCg==
=sXTT
-----END PGP SIGNATURE-----

--MpPnWTvKkkn2ESlm--

