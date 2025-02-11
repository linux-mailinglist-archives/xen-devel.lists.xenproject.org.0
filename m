Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B314A3147A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 19:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885880.1295680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thvPW-0008Mc-EZ; Tue, 11 Feb 2025 18:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885880.1295680; Tue, 11 Feb 2025 18:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thvPW-0008L1-Am; Tue, 11 Feb 2025 18:55:06 +0000
Received: by outflank-mailman (input) for mailman id 885880;
 Tue, 11 Feb 2025 18:55:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wx1N=VC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1thvPU-0008Kv-Sv
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 18:55:05 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b10c6673-e8a9-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 19:54:59 +0100 (CET)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.stl.internal (Postfix) with ESMTP id 2BC33114015D;
 Tue, 11 Feb 2025 13:54:58 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Tue, 11 Feb 2025 13:54:58 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Feb 2025 13:54:55 -0500 (EST)
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
X-Inumbo-ID: b10c6673-e8a9-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739300098;
	 x=1739386498; bh=9y+mjVW5GHKOBd3NRWoZ1PeRpYeJSaSg/rs9IIXw0Tg=; b=
	X6a3IKncyvC+dBbx8kpO9uk8cRv+j6iiZvHu/mBzm6Z0R9gNdec7bWThYotQddyO
	HjyFVNMJYAfa6elTp2wM2TDRAHjjPO39STyOdXU1FFiH4pUVo3Rmd5+G47Ewks2t
	fNlelFnS4ivDwTWYLsyIpPxGyLlshVQyOG/v/O9VBgC/gEmVsKz3EN1yGgn8NX+O
	26awqspdB3PMpwiGQgJ3GpJQy07Xxdua3D6XirjQx+Ta6baL/iT5bBXJ/O9QIGfr
	QHhnjKu77Xm3sDNzJn5xHNZuWLsD0oM12OqITsxqxktv6qbXKmJEN0BMGCdnLtgv
	G3MHaQk1R/5fdIsANnvDAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739300098; x=1739386498; bh=9y+mjVW5GHKOBd3NRWoZ1PeRpYeJSaSg/rs
	9IIXw0Tg=; b=o4/7yG5pU+CfXKwiUlqdgswV6mBxCqhauknZB3mwhxqTDVg8zN9
	tMx5+Rk52l3fdZtOvbiM7Hud/HilJi8LHcIoRELEZaNT9w55b3KQ+9a6z/iYqo3Y
	tEaGOMABlvUkgk5ykhBi6NFj3ZPIMnlC1xoOTAv5oK3otdzh8eUAQwCWjzHN8JJO
	oiHX3iE11vYcapbgTgR7anRjw8KuhRbFTJxdpBgTi8XugLpQUUxwBTHquKp/SJFX
	WwM9IjI1fKgmHgOYrcRHn7xDmV/5Dz91dH4nooOtA9hxIJFAHPDqaMB7VfKCjiH7
	LxNnWQ+WSYOWdWpJsbVzOdjIGDlpo7tbq7g==
X-ME-Sender: <xms:AZ2rZ9UYheulBthviwS2cP0o3v3zM6AGMgEl77Pde1ypuz312jDJIg>
    <xme:AZ2rZ9kMTb4ke59yeY4o-XF8Jhgs10wnZau6f70v2Vp0swjddWVHb49UG2_o2UE-z
    sQ2fsRjlaHvOQ>
X-ME-Received: <xmr:AZ2rZ5bGxT3WHtbJxQo17uEmQ1qB2ccXiMyPe5g_plRAlb88XqoFHDHN6uVUBQ0XRWpw8qJ79Tp-hfJ2EkUoPHHDJZe13J_kWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvd
    egueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhho
    ghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhse
    hsuhhsvgdrtghomhdprhgtphhtthhopehluhgtrgdrfhgrnhgtvghllhhusegrrhhmrdgt
    ohhmpdhrtghpthhtohepsggvrhhtrhgrnhgurdhmrghrqhhuihhssegrrhhmrdgtohhmpd
    hrtghpthhtoheprghnughrvddttddtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepgigv
    nhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoh
    eprghrthgvmhgpmhihghgrihgvvhesvghprghmrdgtohhmpdhrtghpthhtohepshhsthgr
    sggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhulhhivghnseigvg
    hnrdhorhhg
X-ME-Proxy: <xmx:AZ2rZwW-y2jYBix4Phh_N8XwnbqOxVF4fosbRW7Oi5ViNiEQuZY03A>
    <xmx:AZ2rZ3kqWGrhaT2jK9e6kcy82zhkWwwdNWEXsEDeAIdCLXKO1ykG8g>
    <xmx:AZ2rZ9dnJRQtEIFy3ae8L7gfwwGK1x1ZRx2xHT8N7JjKRX4bBHR5GA>
    <xmx:AZ2rZxHyCc7n9baB8-HXp8r2wPLR3AEGeUGKELvLveNauAWpmw_6tA>
    <xmx:Ap2rZ6-Yyho5-qxpsFZJbABbFrE_xAcMvwmcKSeja40tYUpkZGzN0WdV>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 11 Feb 2025 19:54:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Oleksandr Andrushchenko <andr2000@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: Coding Style Review and Automation
Message-ID: <Z6uc_eN-LLmgOmxJ@mail-itl>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <Z6sR87FrKcOhgEqX@macbook.local>
 <4677686F-97C4-4D35-A113-0D8A1C0BC328@arm.com>
 <55c4d9e0-77b2-408b-9bb1-8efed95891c1@suse.com>
 <Z6tZUKiqYARWuk8N@macbook.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CvuhJgxd2R/raIEn"
Content-Disposition: inline
In-Reply-To: <Z6tZUKiqYARWuk8N@macbook.local>


--CvuhJgxd2R/raIEn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Feb 2025 19:54:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Oleksandr Andrushchenko <andr2000@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: Coding Style Review and Automation

On Tue, Feb 11, 2025 at 03:06:08PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Tue, Feb 11, 2025 at 11:19:23AM +0100, Jan Beulich wrote:
> > On 11.02.2025 10:10, Luca Fancellu wrote:
> > >>> 3) The size of the patch after applying clang-format is huge. Reall=
y. Something
> > >>> like 9 MB. Even if everyone agrees that the approach is good and we=
 can proceed
> > >>> with it, it is highly unlikely anyone will be able to review it. Co=
nsidering
> > >>> that new patches are being added to the upstream during such a revi=
ew, it may
> > >>> also lead to new code style violations or require a new review of t=
hat huge
> > >>> patch.
> > >>
> > >> I think this approach is difficult.  It would likely introduce a lot
> > >> of noise when using `git blame` (I know, it's just one extra jump,
> > >> but...), plus would likely break every patch that we currently have
> > >> in-flight.
> > >=20
> > > I think we already discussed this in the past and having some churn w=
as accepted,
> > > also about breaking existing patches, every change merged has the pot=
ential to do
> > > that, this one is more likely but it=E2=80=99s the game I guess?
> >=20
> > That's easy to say if you have just a few patches in flight, yet I'm wo=
rried
> > about this when considering the hundreds of mine that are awaiting revi=
ew.
>=20
> There are also downstreams (including distros) with varying length of
> patch queues on top of Xen.  Arguably they have to rebase the queue
> every time they update, but a wide change in coding style will likely
> be fairly disruptive to them.
>=20
> Don't take this as a reason to reject clang-format.  As mentioned
> elsewhere I think the format supported by clang-format would need to
> be fairly similar to the current Xen one (up to the point that chunks
> of code using the new and the old style could live together).  Then we
> would enforce it only for newly added chunks of code initially IMO.

While clang-format surely will force some changes (the earlier 9MB patch
is a data point here...), I generally expect it should match fairly
close to the current code style, and so the rebase shouldn't be _that_
painful. In some cases git likely will handle large part of the work
already.

It surely is a cost of introducing such a change, but IMO it's a cost
worth paying.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--CvuhJgxd2R/raIEn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmernP0ACgkQ24/THMrX
1yzKoQf9H++0A91uQUqa32YbCIqAAs8Ytkrnp9gVilCKlrDA6fviJ6kIngO9zgjl
MNrWIocbPR8hUB9o+TEkfOpOnkd07aKFdc5DcHGDO0kETGEwV/bZY2LPnjxuqBFK
0m7zqWXE97t49g1lJCPrgluyaSl/z4vsHAvH0FARzzauyvSSecRC7f0Ao54B6UOm
WC+xu/r4e61lTyi04fGq72Zi1sbhmLYUt0v4O13L4bn9OI78sVcdyK/IYYYyOeUH
YKrx8w/rrQzr4v61SvAKP38Tib1zi0lEoMDmc5QigsAIish6LOrunWuOqcBFgRl5
uC5AOZt7O6h8q1vpnAe4oinB0zMrtw==
=Y5vq
-----END PGP SIGNATURE-----

--CvuhJgxd2R/raIEn--

