Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1097AC5784E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:02:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161374.1489345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWxS-00080Q-Pb; Thu, 13 Nov 2025 13:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161374.1489345; Thu, 13 Nov 2025 13:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWxS-0007y8-Mc; Thu, 13 Nov 2025 13:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1161374;
 Thu, 13 Nov 2025 13:01:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25e8=5V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vJWxS-0007t1-5e
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:01:50 +0000
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea68abf2-c090-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 14:01:49 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id B883E1400176;
 Thu, 13 Nov 2025 08:01:48 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 13 Nov 2025 08:01:48 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 08:01:46 -0500 (EST)
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
X-Inumbo-ID: ea68abf2-c090-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763038908;
	 x=1763125308; bh=EpyucTV9893hEPcqC3Vw8drGs9gW+neBOWqOSSthy3A=; b=
	J5p6snExtqVZ/XK74qjBAsMpTKFua7D4Geqxjb88HoVsEVeXdN+HvylecZB5XLu4
	1CT/kkNSdCnHxk6yfjjKUh/G55o/OH7g3mAmO3x9ErTarbHH5Rguym/Lq5PHGInF
	79QznRoOdEydWciRGHOAvvPxLh6neJMyPnEE0c2sX3eS2aXLG6Z+1OePF7F+YX6D
	+jvxEN4apRP/x/d09gCKOE5z+arfRZsEMxrVsUXGXjZN5aLxEvqyjkNzWs/QcBF4
	k2K3M5tpyinqGmF/PHJhUthZYVFvM7OZIgCaW9O8+cpDPTStrVt+Iy2uObx0r6hP
	hCxC919qh1ZK0YeoDNVzpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763038908; x=1763125308; bh=EpyucTV9893hEPcqC3Vw8drGs9gW+neBOWq
	OSSthy3A=; b=ggKQ5tQk8XPipe29jr/LRPRXcvgZMv83cjOghewxLFb9eb/X9Fu
	xPsgQgCgSDQ9mnYgN4+gt63vkH7scrlzhGa6F/2L/vV+dNKWjdZGyRqJ6AAdXxUj
	xE53lHLhXQDmE/7JJhFikM0SbmigzP5AIkrm0PP7D2f8435VaKP1ug7SC5gwgZt4
	2wcxoLq1aceFdysaiUiIFHzsm8codItG5ZmBG/NpnKXOtAfgcpOIGLxKk6jw/8gf
	re4zrQb38mHjaoq/a3snzJU0030lpAmqajbVs0ifksfVgb8gvjv2GMx8GUuDcCsL
	Gj16ql0a56m0w5nNyk6GcUpayIWl4ZCJGEg==
X-ME-Sender: <xms:vNYVafjnioHRTiU2JbIy2SQJF7e9HhVrGEmbsicGmfAzUkHkJSz_VA>
    <xme:vNYVael04Q-_5IGtDvCsE0trJM_fpBTStHbwJwf-a96UrqG0bTRm_o2HKUWYcvzo-
    0nkIlv_ITxLE7T2CoFT7Q6wMSnl7_ymXQYG_7hBgMNWeqiftg>
X-ME-Received: <xmr:vNYVaSvy8a3h2EyeCW34rtlfrUnBKaPZvgH8dxLgIkbhgkGThX0aNBvZuAEMnMtu1mxsX07ZSwxL3mfxbtSNnZzSwMkiqYepiug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdejtdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeufeegvddvieejhfefkefh
    teekfeehhffgveelveffueegvdegffefieefteffnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgv
    thhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthho
    peigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtph
    htthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtghomhdprhgt
    phhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpth
    htohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhn
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhguse
    hvrghtvghsrdhtvggthhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdr
    tghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:vNYVacZzxwZgU-ImFR8F002Tjku8VHfi5QJSJSxAS8AYj7xeapOCqQ>
    <xmx:vNYVaSBf-ASQrFYxjwv5ifG871w8Blw0KYhadfgsm-0lvQGqrlT2Xg>
    <xmx:vNYVac_2WMbihffGmYVrxWJ8PLk9eK4Syy6rLFZ_GgdcnNSMjb-ogg>
    <xmx:vNYVaWQMejPTHfWc1HJBOdXX1CRqiWy3J9CfSYRhzexKwsUE5HiJoA>
    <xmx:vNYVae2mwXewD4Pc4WzVpingTotWyb9zDN7_RA_IYSXp6STPMTnPieuv>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 13 Nov 2025 14:01:44 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] x86/EFI: replace ebmalloc()
Message-ID: <aRXWucYrjiejVSKW@mail-itl>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
 <452fdf1f-646a-4bb1-83ea-ac4c998a096b@suse.com>
 <aRXRtY10cFN38d02@mail-itl>
 <d027f21e-f2cc-4c63-9ebd-8f563d72c993@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8WlVeWfNBAhEVcW2"
Content-Disposition: inline
In-Reply-To: <d027f21e-f2cc-4c63-9ebd-8f563d72c993@suse.com>


--8WlVeWfNBAhEVcW2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Nov 2025 14:01:44 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] x86/EFI: replace ebmalloc()

On Thu, Nov 13, 2025 at 01:53:40PM +0100, Jan Beulich wrote:
> On 13.11.2025 13:40, Marek Marczykowski wrote:
> > On Thu, Nov 13, 2025 at 12:09:37PM +0100, Jan Beulich wrote:
> >> Use the new brk_alloc() instead, with ebmalloc() merely being a thin
> >> wrapper.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I'm not quite certain whether we ought to permit non-page-granular
> >> reservations. The in-memory image being somewhat larger due to possibly
> >> excessive padding isn't really a big problem, I think.
> >=20
> > My grep says ebmalloc is used in just two places:
> > 1. For efi_memmap (via efi_arch_allocate_mmap_buffer())
> > 2. For various cmdline options and module names (via aplace_string())
> >=20
> > The second one is probably undesirable to allocate full page for each
> > one. On the other hand, the current approach (putting small allocations
> > at the same page as an earlier page-aligned one) also has its issues -
> > see comments on 3/3 patch.
>=20
> Imo if such sharing of a page is unwanted, then it's the side caring about
> the non-sharing which ought to request an exact multiple of pages. Wasting
> space due to doing this in the BRK implementation is undesirable.

Makes sense.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--8WlVeWfNBAhEVcW2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkV1rkACgkQ24/THMrX
1yx4Hwf/Xg7tXPN3yQhVIO4k38XpYMaf8pqcs++stYVlJCyY7q6JeF/I/q1Y6Aj1
zdysVMXoWOMuw5UGDuL9+C7hk4HihXigY9NnriO8b8xWcwnPR44kpDxmL6h3+Vg4
bcFk/8YtfdBlQ1pB7i+T0nHINstBJETkt+w/sNKjKSzlJlGLGYTJy9nfEdqf6nk9
aNTf8XnbRuKuIVfQgmIi2TUiXazChl1hwoLUjxYJhBsLXoxmE9IpTto5JDpehImN
2WquPbo11F1nXWhgbf7SYKoBIEZJxIPnV5aZx0ihyf81WExKuV7XMbH8bTsB4WL8
uNK0h8y4R7VRNGvSAkbZqG9NxVKWEA==
=EeZ3
-----END PGP SIGNATURE-----

--8WlVeWfNBAhEVcW2--

