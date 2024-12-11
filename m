Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF149ECC14
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 13:30:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854735.1267865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLLr8-0004w3-8S; Wed, 11 Dec 2024 12:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854735.1267865; Wed, 11 Dec 2024 12:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLLr8-0004tl-5h; Wed, 11 Dec 2024 12:30:18 +0000
Received: by outflank-mailman (input) for mailman id 854735;
 Wed, 11 Dec 2024 12:30:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dco5=TE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tLLr6-0004tf-0E
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 12:30:16 +0000
Received: from fhigh-b2-smtp.messagingengine.com
 (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaf003f6-b7bb-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 13:30:13 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 0272C2540260;
 Wed, 11 Dec 2024 07:30:11 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Wed, 11 Dec 2024 07:30:12 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Dec 2024 07:30:10 -0500 (EST)
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
X-Inumbo-ID: aaf003f6-b7bb-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1733920211;
	 x=1734006611; bh=4bUVCNxlLLsfq6OFY06A5OLQ0L1wV01UZdhndtveAMU=; b=
	I8Eya5twAQM5obhHH7eChwe9cAz2crqW7dupEat7/fDVBRBhKgA2ris/oAlhAwTg
	hA0oDcr5C/zp2YE+xNbNiPS8k8uMnJ8A7gZpiOgFNwMm9VdNRB+LrpYCZv8PQkbQ
	OEUetmNBlLwQ5NGKd5s77RYtKaGAH4w3vppfrq5HjiWJA/rTMz8I/Vm6te2YZtbf
	EPq490v8RUskIQPmm1NLRZ7fTIjKkC+iHLLxYleMGTFrLwa+jYKQZkHHd05sh5MS
	BhMe/a4uDhzg93xqWjQPjxAIKNPguTXtMGzeCqDS9NUlezdo0XYFBy/SuTC5K/dh
	5ll482V9Zt3KgLULvp+lLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1733920211; x=1734006611; bh=4bUVCNxlLLsfq6OFY06A5OLQ0L1wV01UZdh
	ndtveAMU=; b=wLju/yEA8UQY2xaIngAa2kBrRyRCyr7U+FBTlWZ21s3lb20kn/4
	QTliJTUrnYtSj0oNjXXgLq8LDCR8JajtMKPVvuZpX2TUrB3vCGlGDyFawQvaDBvw
	ZbnMgsbbW2dGT6ZiZtJa2jZ/vNoQO1kruOgQh+A8xOtJhWprVjAx8TZ8pdSaRROo
	SqonOm+eMHyhMCSiKbVKWVesGMeUmWw3Cj6PNUCxZhzeKxzOSvwSuJG0KSLrjv3n
	Xds4k9k/kO7j6mUxV0sM9FwPyayrDPvvKzJRfb9Otjq5DuAGYuKMozlrIqyd85B0
	QhDWbH1ZZOK3k+oE6IjYbmlksppmIrYbbwg==
X-ME-Sender: <xms:04VZZ56Qh2Il86Mf7fIw3LAUvfe4pO4kKYzpiAKf9VM56FYpmB_azw>
    <xme:04VZZ26jRF2JUkjyVJmeBRzIemcNBNjHx2af0LJn0jWlhD35dSTiUxIF0srbUjc1T
    Tqh2aaLvuKUIw>
X-ME-Received: <xmr:04VZZwfC1mWvkH_KdxwA9smUju1PlBGyLHFFheTBMcau4f7XGnNNAtSjyBfwOKTLN00VPIWR1ylBlJUkpMDkPFLd5hI4_CD3rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkedtgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegue
    etfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsg
    gprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrhgusges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprh
    gtphhtthhopehjrghnughrhihukhesghhmrghilhdrtghomhdprhgtphhtthhopehsshht
    rggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeholhgvkhhsrghnug
    hrpghthihshhgthhgvnhhkohesvghprghmrdgtohhmpdhrtghpthhtoheprhgvghhrvghs
    shhiohhnsheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeigvghnqdguvg
    hvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:04VZZyJTGoT5ciliFfMXt5VdeGMxCEIRijCjQU95mzfiwb6TL5KbUw>
    <xmx:04VZZ9K1gUFFcCbci094lwAYqt8ri6GiFBRaduhlwl8_IvvyOHotDg>
    <xmx:04VZZ7yyE6jX0hO1uQ0pF_M8oA2TV_EOZ1REyql2GwmNmHGot9CyzA>
    <xmx:04VZZ5KT5YLe5yM5TPhgVATq5efxxsIfz14YGdleoPAiWmww--buZA>
    <xmx:04VZZyrl9XcRtDs9kI_WjQvz_O0crRiMBxJPJe9r2Jf8ZGY9ozI8jsiB>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 11 Dec 2024 13:30:08 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
Message-ID: <Z1mF0UZPNLjYAJI7@mail-itl>
References: <Z1l6XbHP6BTTZSwr@mail-itl>
 <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
 <CAMj1kXHSiCo7FH0Mo-_R9HjxhthddPUZfgm5c8yj7vjGvgfTPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/VG+ezqUWUhYwfd+"
Content-Disposition: inline
In-Reply-To: <CAMj1kXHSiCo7FH0Mo-_R9HjxhthddPUZfgm5c8yj7vjGvgfTPg@mail.gmail.com>


--/VG+ezqUWUhYwfd+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Dec 2024 13:30:08 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU

On Wed, Dec 11, 2024 at 01:24:08PM +0100, Ard Biesheuvel wrote:
> On Wed, 11 Dec 2024 at 12:53, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wro=
te:
> >
> > Jason, Ard,
> >
> > I guess there are some prereq patches missing in stable 6.6.y branch?
> >
> >
> > Juergen
> >
> > On 11.12.24 12:41, Marek Marczykowski-G=C3=B3recki wrote:
> > > Hi,
> > >
> > > With Linux 6.6.64 I get the following crash on domU boot:
> > >
> > > (XEN) d5v0 Triple fault - invoking HVM shutdown action 1
> > > (XEN) *** Dumping Dom5 vcpu#0 state: ***
> > > (XEN) ----[ Xen-4.19.0  x86_64  debug=3Dn  Tainted:  M     ]----
> > > (XEN) CPU:    4
> > > (XEN) RIP:    0008:[<ffffffff82b64050>]
> > > (XEN) RFLAGS: 0000000000010086   CONTEXT: hvm guest (d5v0)
> > > (XEN) rax: ffffffff82b64050   rbx: ffffffffffe00000   rcx: 00000000c0=
000101
> > > (XEN) rdx: 0000000000000000   rsi: 0000000003a00038   rdi: 0000000002=
a9bc98
> > > (XEN) rbp: 0000000000000000   rsp: 0000000002aa0ce8   r8:  0000000000=
000000
> > > (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000=
000000
> > > (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000=
000000
> > > (XEN) r15: 0000000000000000   cr0: 0000000080000011   cr4: 0000000000=
000020
> > > (XEN) cr3: 0000000002022000   cr2: 0000000000000000
> > > (XEN) fsb: 0000000000000000   gsb: 0000000002a9ccc0   gss: 0000000000=
000000
> > > (XEN) ds: 0010   es: 0010   fs: 0000   gs: 0000   ss: 0010   cs: 0008
> > >
> > > Linux 6.6.63 works fine.
> > >
> > > Looking at the changes, I suspect one of those:
> > >
> > >      83d123e27623 x86/pvh: Call C code via the kernel virtual mapping
> > >      f662b4a69e1d x86/pvh: Set phys_base when calling xen_prepare_pvh=
()
> > >
>=20
> The second patch shouldn't have been backported. It is unnecessary,
> given that in the old situation, the kernel image needs to be loaded
> at a fixed address. And it assumes  that %rbp is set to the physical
> load offset, but those patches were not backported.

It has this tag:

    Stable-dep-of: e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel virtu=
al mapping")

Does it mean neither of them should be backported?

But then, the e8fbc0d9cab6 has "Fixes:" tag (pointing at very old
commit).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/VG+ezqUWUhYwfd+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmdZhdEACgkQ24/THMrX
1yyjMQf9FzYK4Yw9Mm1IB6080FxLcOdQKmLoy8zrgu/4DPqQr+eN8jte4FbvsL18
ilp4g8VystkEOyUOA7M6TI54ottRMRdM3KPQ2Cny9LV6SPsq5PKL3DFl5pYaAbgM
BgxJye/H36pS3A7D++w88A37dd7Orc6S9r4xo/VTskL9zAx3eqTeBclA5wazsSJ+
wjOOwGxeDrfrHL+gWXL7P4lEXDSRYZsEa7W90DNqnBuKM0TFSinUeuyP8urI2yDZ
3a81wUDPuLaj3UijeFkp8lGlpBciUzvslgJWNSbp/pbZWoZdwQeZzV3yQIfZAxbw
5CAEDyZinCheMVPTB/jTfKdBb+l7RQ==
=OW2f
-----END PGP SIGNATURE-----

--/VG+ezqUWUhYwfd+--

