Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0EA516B60
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 09:43:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318693.538579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlQi4-0000K2-8g; Mon, 02 May 2022 07:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318693.538579; Mon, 02 May 2022 07:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlQi4-0000HH-5b; Mon, 02 May 2022 07:43:08 +0000
Received: by outflank-mailman (input) for mailman id 318693;
 Mon, 02 May 2022 07:43:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l5GY=VK=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nlQi3-0000HB-4U
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 07:43:07 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8055b247-c9eb-11ec-a405-831a346695d4;
 Mon, 02 May 2022 09:43:05 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C290A5C0037;
 Mon,  2 May 2022 03:43:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 02 May 2022 03:43:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 May 2022 03:43:03 -0400 (EDT)
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
X-Inumbo-ID: 8055b247-c9eb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651477384; x=
	1651563784; bh=CVZC41679sufgTHuZhnba1pii/ZlnBhhFJAQJ0LBsbo=; b=W
	v4z+VyphOWClGyt3DebUzHzFJ2WYyEOO5z0VzVwrJYMFBO5ax/pdhTEyPWcqhZOn
	O3tbKEqcKqJr0DoAb0Byn085JgcHj5MCu9QhsYb7QrsIhJK50TrMvY1H1PNjn7Oz
	L9XFUj6Gyk9QoVpqffSUZw3+jOOQ8nAvfvniKbBZGuEqJAbaSMalENehvQAr+Fv3
	5+VqjhVRy+axnOTUpmgqZRL95zKDK9X73JP42zdhFUB7rTPSuSTzBE/blhbbEWWK
	1JxX1tqYGBfUWVN3JrYTCVaMWw2CAklSMY1h2RRIg3X9wk3X2eSrzym/H9Pd+wFN
	iH0XD1FKtpuDiximBf3/Q==
X-ME-Sender: <xms:iItvYo8ImPnlci_W3iD1ncA0B1KtGyKxoNEWrYoM5bEu_qzJnqWtyw>
    <xme:iItvYgs7NgsotEhLQyDLJCx-Z13EfFS2rSWgktzj7t2Q4DYU6qv2L3LuPnk7EuVy_
    9tufWVK-p1tCzo>
X-ME-Received: <xmr:iItvYuBdp25x6YPtDiBWwgb9D_yeAaIe2uESZsxcqBspeqhraYKAT86_Dr6V>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeggdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:iItvYoek_YoYS6lFzhPtOhf3SXpoXWIp5x91ee-p5mwuWFRGTRNHzA>
    <xmx:iItvYtMbiApZrvjHhkJB8wSyefChugnS88A78rCISqOgUa9Y07ceKg>
    <xmx:iItvYikHXuYSOdpBVQVXyTtqBRAPwirzeqTohaXAkWf2dcbgZ7hRbQ>
    <xmx:iItvYg2fWS8dvLZiHsLZHLkmApw2mpuoc_1JsofqyURp7_UgsQDzTw>
Date: Mon, 2 May 2022 03:42:34 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT
Message-ID: <Ym+LhfKQ2gTG4IyX@itl-email>
References: <Yl7aC2a+TtOaFtqZ@itl-email>
 <3591eec7-1299-8783-26ad-ffe27bb9fdcd@suse.com>
 <YmmUtiBkhEYvXHUB@itl-email>
 <901c11d6-92f0-89b9-8500-4947bbdcd504@suse.com>
 <YmsbD9ktQqB4U33o@itl-email>
 <c9a57c65-05f4-b566-10cb-92ce9ffe9e0d@suse.com>
 <YmwbKwJh1Fft2F1H@itl-email>
 <7ad22939-1096-3d81-f998-4eaf1d9a1d8e@suse.com>
 <Ym+ETr34j8JC55hK@itl-email>
 <d619c450-e1c3-90d8-05c7-2896ab6320bb@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ErhdjAcdLt8FbP+3"
Content-Disposition: inline
In-Reply-To: <d619c450-e1c3-90d8-05c7-2896ab6320bb@suse.com>


--ErhdjAcdLt8FbP+3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 May 2022 03:42:34 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT

On Mon, May 02, 2022 at 09:37:39AM +0200, Jan Beulich wrote:
> On 02.05.2022 09:11, Demi Marie Obenour wrote:
> > On Mon, May 02, 2022 at 08:24:30AM +0200, Jan Beulich wrote:
> >> On 29.04.2022 19:06, Demi Marie Obenour wrote:
> >>> On Fri, Apr 29, 2022 at 10:40:42AM +0200, Jan Beulich wrote:
> >>>> On 29.04.2022 00:54, Demi Marie Obenour wrote:
> >>>>> On Thu, Apr 28, 2022 at 08:47:49AM +0200, Jan Beulich wrote:
> >>>>>> On 27.04.2022 21:08, Demi Marie Obenour wrote:
> >>>>>>> On further thought, I think the hypercall approach is actually be=
tter
> >>>>>>> than reserving the ESRT.  I really do not want XEN_FW_EFI_MEM_INF=
O to
> >>>>>>> return anything other than the actual firmware-provided memory
> >>>>>>> information, and the current approach seems to require more and m=
ore
> >>>>>>> special-casing of the ESRT, not to mention potentially wasting me=
mory
> >>>>>>> and splitting a potentially large memory region into two smaller =
ones.
> >>>>>>> By copying the entire ESRT into memory owned by Xen, the logic be=
comes
> >>>>>>> significantly simpler on both the Xen and dom0 sides.
> >>>>>>
> >>>>>> I actually did consider the option of making a private copy when y=
ou did
> >>>>>> send the initial version of this, but I'm not convinced this simpl=
ifies
> >>>>>> things from a kernel perspective: They'd now need to discover the =
table
> >>>>>> by some entirely different means. In Linux at least such divergence
> >>>>>> "just for Xen" hasn't been liked in the past.
> >>>>>>
> >>>>>> There's also the question of how to propagate the information acro=
ss
> >>>>>> kexec. But I guess that question exists even outside of Xen, with =
the
> >>>>>> area living in memory which the OS is expected to recycle.
> >>>>>
> >>>>> Indeed it does.  A simple rule might be, =E2=80=9COnly trust the ES=
RT if it is
> >>>>> in memory of type EfiRuntimeServicesData.=E2=80=9D  That is easy to=
 achieve by
> >>>>> monkeypatching the config table as you suggested below.
> >>>>>
> >>>>> I *am* worried that the config table might be mapped read-only on s=
ome
> >>>>> systems, in which case the overwrite would cause a fatal page fault=
=2E  Is
> >>>>> there a way for Xen to check for this?
> >>>>
> >>>> While in boot mode, aiui page tables aren't supposed to be enforcing
> >>>> access restrictions. Recall that on other architectures EFI even runs
> >>>> with paging disabled; this simply is not possible for x86-64.
> >>>
> >>> Yikes!  No wonder firmware has nonexistent exploit mitigations.  They
> >>> really ought to start porting UEFI to Rust, with ASLR, NX, stack
> >>> canaries, a hardened allocator, and support for de-priviliged services
> >>> that run in user mode.
> >>>
> >>> That reminds me: Can Xen itself run from ROM?
> >>
> >> I guess that could be possible in principle, but would certainly requi=
re
> >> some work.
> >>
> >>>  Xen is being ported to
> >>> POWER for use in Qubes OS, and one approach under consideration is to
> >>> have Xen and a mini-dom0 be part of the firmware.  Personally, I real=
ly
> >>> like this approach, as it makes untrusted storage domains much simple=
r.
> >>> If this should be a separate email thread, let me know.
> >>
> >> It probably should be.
> >=20
> > I will make one at some point.
> >=20
> >>>> So
> >>>> portable firmware shouldn't map anything r/o. In principle the point=
er
> >>>> could still be in ROM; I consider this unlikely, but we could check
> >>>> for that (just like we could do a page table walk to figure out
> >>>> whether a r/o mapping would prevent us from updating the field).
> >>>
> >>> Is there a utility function that could be used for this?
> >>
> >> I don't think there is.
> >=20
> > Then it is good that none is necessary :)
> >=20
> > Also, should the various bug checks I added be replaced by ASSERT()?
>=20
> You mean those in the earlier patch(es)? Not sure - depends on what you
> would be doing for release builds. In the cases where you simply re-
> check what was checked earlier on, ASSERT() would probably indeed be
> preferable over BUG_ON() (and there I wouldn't even see a strong need
> to consider alternatives for release builds).

Yup, that=E2=80=99s what the BUG_ON()s were for.  I will use ASSERT() in the
next round.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--ErhdjAcdLt8FbP+3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJvi4YACgkQsoi1X/+c
IsECqA/9GiH7nC7Z+pWICgSsyo8Uqu0axtawLWSdCQXZjpMbighA5imVwkfOCJ+b
/XXRINSP7BUGZcLClCFA/kj5Efxlrs4oPc08UR9KgjClNu4dHarfBLaOOJNZGtca
b8J+9MmqESXqA+EPfxyGZmWgKarhOGuH3kBUt/Aum6Z89i5oPRfJGdgJ+T5WYBEQ
oSkOXyLLWtjMkMdVVo1yFXJeHsfuiPQ/Z6SRhtP71dFGWaJ724taQkKGtTX71WgI
W+rcnn96WGXAK/P1rbbNe4c8SWUjsfjghEK1JymsYm4sqBmb7uqJlAjHvZ9G56cM
dve2ADBsBXmyr+inLAI/dd09S5E8mp/W1x2/DAeG5eYaiWpMwQrXqxKWqilTsmrQ
STQGKSBplLxfrz4eOBS0mlil4EKwiSlsKw+O8Da0SFRBVHvAm1FN9ht2hA++iz8T
Cqzw7IEceMvMi9k/xVScZFhTBhVZLoc54xx/9ql+pSep+Gek4vsjJ3fQhhLGE4ey
Z9xsS71MLyiIf1lvhzF9TnjLDucpwUwmjxVVEZ5/N0ZncMdwTw6h40J4YN3dnhOq
U1a3XKQcYG4xGzrtHTITgJn2BIgVHm6SkxsOGTzK9e1mrz/afG0M8moRg0nTL9aR
77QFCssKQN3luLW5XpptPQgk+RNJUrLuuD5hSrVuDuB7A3w08WI=
=KXoF
-----END PGP SIGNATURE-----

--ErhdjAcdLt8FbP+3--

