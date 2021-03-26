Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F3234A99F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 15:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101861.195117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnNL-0005eE-7D; Fri, 26 Mar 2021 14:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101861.195117; Fri, 26 Mar 2021 14:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnNL-0005dp-3Z; Fri, 26 Mar 2021 14:23:47 +0000
Received: by outflank-mailman (input) for mailman id 101861;
 Fri, 26 Mar 2021 14:23:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3UtC=IY=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lPnNJ-0005dk-H7
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:23:45 +0000
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2db2a846-a461-44cf-a28c-8edefa33ab27;
 Fri, 26 Mar 2021 14:23:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C791C1DDF;
 Fri, 26 Mar 2021 10:23:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 26 Mar 2021 10:23:43 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id D2D821080069;
 Fri, 26 Mar 2021 10:23:40 -0400 (EDT)
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
X-Inumbo-ID: 2db2a846-a461-44cf-a28c-8edefa33ab27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=B+PWZz
	GIGZMcZCasGPOutLgZCgy2i6mExlUGj4BuK6U=; b=M8KdocXrmy7tizpAKdTdLV
	TZFFsZrJz6znzg/mU/UXEpddX8r4DLlWXuA4/8nop8rQfXvtbaxq0qVIHZDa3eJV
	F/uD0X2sOevZ0rqlGI6zKmX8n3UrOo4aesTUV5m4noJ7altpHmfUJN5OzQe6VB6w
	yp26G+SfLR+Xx/KIzd1DRGSYcD5DbIFDiYt3WXbK6O556rTdyrst9wA3T8M0IhLR
	uHJSSVCXeB819dN+SEZZ/aJ00Qadv3C1daz7lbktQEvRE2jaPDbHk1s7+k6lhK7i
	EFJRCGGqWdRxv83mC7b52eYrYhyMwYY8MS6NPzHnyu3YsOUnL24uH4UOEywCpbow
	==
X-ME-Sender: <xms:be5dYB_meH1tLeudJdJG-Lar9_0K_o3_eLbcd4EP4R8476YdgK2Utg>
    <xme:be5dYDodB2irvR5ej_aBzXh2FlPyTzZCGcTpBaniLIn5iEmmEUTI-_uT1ZOpALgVE
    Vf-EG2JvguSNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehvddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
    durdeijedrjeelrdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homh
X-ME-Proxy: <xmx:be5dYBXPMuSAEEVj2QmpQYQNT1AFxc0dZ8kA1YhrdG-1hvWQnu-q-A>
    <xmx:be5dYKBkzjXwS51uln_8Drsl4pQW0zvK4tSjlvUvRRjdeeyzqmyWXw>
    <xmx:be5dYN0Htr6SL5iXFiblDjSFor7MCxLtJjvbD5JLF2NKmHWBP42BzA>
    <xmx:bu5dYC_VvVn5sJWhEAZ8JjOrs7fpLA4LUNBbkagHCPWepEnJnOrNVg>
Date: Fri, 26 Mar 2021 15:23:37 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?RnLDqWTDqXJpYw==?= Pierret <frederic.pierret@qubes-os.org>
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
Message-ID: <YF3uacPGPq1AqlZ9@mail-itl>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com>
 <24669.52641.499147.88002@mariner.uk.xensource.com>
 <24669.54213.173154.400771@mariner.uk.xensource.com>
 <CABfawh=O1hdycEr0+=JXU6USZ8DAzQvKoXQOnRnoWL643FTa+g@mail.gmail.com>
 <24669.56958.383583.53595@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pTHhN0EPPVJ3qMme"
Content-Disposition: inline
In-Reply-To: <24669.56958.383583.53595@mariner.uk.xensource.com>


--pTHhN0EPPVJ3qMme
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 01:15:42PM +0000, Ian Jackson wrote:
> Tamas K Lengyel writes ("Re: [PATCH v1.1 2/2] x86/hpet: Don't enable lega=
cy replacement mode unconditionally"):
> > The problem from my perspective is that the end-users have no way to
> > determine when that boot option is needing to be set. Having an
> > installation step of "check if things explode when you reboot" is just
> > plain bad. Many times you don't even have access to a remote serial
> > console to check why Xen didn't boot. So that's not a realistic route
> > that can be taken. If Jan's patch is applied then the only thing I'll
> > be able to do is make all installations always-enable this option even
> > on systems that would have booted fine otherwise without it. It is
> > unclear if that has any downsides of its own and could very well just
> > kick the can down the road and lead to other issues.
>=20
> Thanks for the clear explanation.
>=20
> I think our options are:
>=20
>  1. What is currently in xen.git#staging-4.15: some different set of
>     machines do not work (reliably? at all?), constituting a
>     regression on older hardware.
>=20
>  2. Jan's patch, with the consequences you describe.  Constituing a
>     continued failure to properly support the newer hardware.
>=20
>  3. Andy's patches which are not finished yet and are therefore high
>     risk.  Ie, delay the release.

I do have several confirmations that the "x86/timer: Fix boot on Intel
systems using ITSSPRC static PIT clock gating" patch indeed unbreaks
several Intel systems. And only one report about it causing a regression
on some AMD (although I may miss some others on the list).
Reverting to the previous default behavior I would also call a
regression.

I have tested Andy's patches on several machines and I can confirm they
fixed the issue - both keep the original issue fixed and fixes the
regression.
I see also Fr=C3=A9d=C3=A9ric (who originally reported the regression) also
confirms it fixes it for him.

> Please let me know if you think this characterisation of the situation
> is inaccurate or misleading.

Both versions (with "x86/timer: Fix boot on Intel systems using ITSSPRC
static PIT clock gating" and without it) got significant testing and
results are as you summarize - each of those variants alone is broken on
some subset of hardware. What Andrew's patches do is to combine both
versions into one, to choose the right behavior depending on the
hardware. Specifically, apply the workaround in place of direct panic.
This isn't some completely new behavior. I think it is reasonably safe
to have it included in the release, even at such late time.

> This is not a good set of options.
>=20
> Of them, I still think I would choose (2).  But I would love it if
> someone were to come up with a better suggestion (perhaps a variant on
> one of the above).


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--pTHhN0EPPVJ3qMme
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmBd7mkACgkQ24/THMrX
1yzZXwf1HJXU3Z2L2lG2TCKfBbh0y5hH/Ehy8X7iyma+zE7OZylcSnuKju55xKCm
pR8YMdzLWBj1r1QozBfNcpnOis/uQq+egF+VdrHL6ukyNyJw/gNX3WbrOwhwDuD3
2NZBz3RyfrxGwyzuOdxAev9+j13Q6Q4sd8hZ+0Lqp8beKXsKBt5L9jBL4Ye5a++U
i6Y1qg3k4MBvXjxhBFN9iAQr3RtNY4dIz0e1chbyp0b4j91yHacErAwjpuwdnQkR
jU3OlFoctMfWrJ4W8H1A360YFec1oIHJCJEGpDWy9GC+Ymduv6Unqf7jUYkiFSV6
Ds0cyVSgmQTMsAQnvKVSIqcMdexf
=Xc10
-----END PGP SIGNATURE-----

--pTHhN0EPPVJ3qMme--

