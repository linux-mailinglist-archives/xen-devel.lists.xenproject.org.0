Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E654ACCD2C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 20:37:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004801.1384520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMWVj-0006NI-5E; Tue, 03 Jun 2025 18:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004801.1384520; Tue, 03 Jun 2025 18:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMWVj-0006Lt-1i; Tue, 03 Jun 2025 18:37:19 +0000
Received: by outflank-mailman (input) for mailman id 1004801;
 Tue, 03 Jun 2025 18:37:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zlp/=YS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uMWVh-0006Ll-Ja
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 18:37:17 +0000
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4a9dd31-40a9-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 20:37:15 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 963F22540109;
 Tue,  3 Jun 2025 14:37:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Tue, 03 Jun 2025 14:37:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jun 2025 14:37:11 -0400 (EDT)
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
X-Inumbo-ID: c4a9dd31-40a9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1748975833;
	 x=1749062233; bh=nEuiz3ufLBAGsi6VBBkny6n5Ky9dEu0DhzDGeZ8X354=; b=
	JZZSZwEEUAgbAMkubWCPRyuEStKzdvfNIY/Ic7E+i/7pFsiB5ZsPDUToO4rSPBiK
	+M6JuI2N2GXSnRdEklmRUwkwGrGlrPpNzjD8nX6SFaU5Rq5OcOk53jrH0e4aXI6i
	UkLTjRddyen7fAwZWxyQYZrAnpmK9Xf3feGHtvDo5qvhpKxWQvmWMFUPMSjSlp5x
	XAL8q/jb/SPJ9KLE2U0APfqOJSk91hCpwljumtTJlcc6Bm48ZLv+4Qnjum7nG9lA
	G7dYBqSMMg7PpqdFjGvznTARv9Wf491CrMr4lvBgXqbHMaBsuANqvK+WLWoegfPl
	KlLlBt86sb7apsx11dtVVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748975833; x=1749062233; bh=nEuiz3ufLBAGsi6VBBkny6n5Ky9dEu0DhzD
	GeZ8X354=; b=bh6pOf+LulZkdPbvmT0ypIhqTQ+aDr07DJg7YS+j8Ij0DfkASPC
	QmUHo76XhnpbpMFrh9V2o/z6cQqbZu+43PiPjtz/t3/MDDCYNLl/yngKqATYZBjW
	zuBJ58vdDln13MiGqL5IvF60hUyTmnPhKL+8lxfl4JJUOBP2FnxCUCcmvnJOti1x
	HBRuY68LZnQEkxyyfttES7eawKa4ruTLPNhxmlysRyLIQub+iW5+zu/5g/2D28sT
	e87T0NW6BIWCumVjFiCyimrB8Fl1V0eD14Qzbwh2grjccX1aqAW+coADH1VQQvte
	7fj0Xf/Gjh+9C77bKomMOzRtpwEzK/iTAFg==
X-ME-Sender: <xms:2EA_aDC0dIq4gYMUv2CI93duJdKcTeKqXIF4KLSgjrrxwziJkkVGlw>
    <xme:2EA_aJj0ydGMgprYQP_XVJ_5Y2fdHJURBBHgR7mrtXNq6cWDzk3L9lSjQFujMWswD
    BYzNFzmODooVA>
X-ME-Received: <xmr:2EA_aOkMPgjWjn98DIYK7Wdej5qSRK2ME0qssRSrhNmPOyD0GGUWQgdac3hmd3YDujJmOu_DPMk2p669AtGxEXTT36v9x0Eyrss>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpeevueejteegleelteduueevhfetgfffjeevtddvgfeiveehteehleegue
    elvdejveenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprghnthhhohhnhiesgigvnhhprhhojhgvtghtrdhorhhgpdhrtghp
    thhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtth
    hopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgt
    phhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpth
    htoheptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:2EA_aFxBtHtzWEScDnCydZMHNU7hklGw353aXx6KWl5ll3f7NZ-c1w>
    <xmx:2EA_aIRAjOOI8byWGbe3IP5zRJjdgMoSUlzw6GaLuK4EG_G3M6n8tQ>
    <xmx:2EA_aIasRFdJcBIYBmI6X17Pp4HULXmTkJraUygfn5zzrOJOmKjxtg>
    <xmx:2EA_aJRqY41-LSW9nXhvQ1C7EVGJLR8_mzARdEQ85_HcsOdET6n_nw>
    <xmx:2UA_aNoxMJzTmP6tcislpc-R57RKPUXKAKcW1SCmgvp0V0KuluFYNa-r>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 3 Jun 2025 20:37:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 8/9] CI: Workaround extra content in junit
Message-ID: <aD9A1QizkG3ZT3gb@mail-itl>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-9-anthony@xenproject.org>
 <86d3655f-f541-441e-bb6c-1dda0b03540f@citrix.com>
 <aD8hjZNt-iwbO4_-@l14>
 <alpine.DEB.2.22.394.2506031128440.1147082@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J8Or3Pad7ufB5OFK"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2506031128440.1147082@ubuntu-linux-20-04-desktop>


--J8Or3Pad7ufB5OFK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 3 Jun 2025 20:37:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 8/9] CI: Workaround extra content in junit

On Tue, Jun 03, 2025 at 11:29:11AM -0700, Stefano Stabellini wrote:
> On Tue, 3 Jun 2025, Anthony PERARD wrote:
> > On Tue, Jun 03, 2025 at 03:12:32PM +0100, Andrew Cooper wrote:
> > > On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> > > >  if [ -n "$retrieve_xml" ]; then
> > > >      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> > > > +    # Workaround duplicated data been received
> > > > +    sed -i.old '/^<\/testsuites>/q' tests-junit.xml > /dev/null
> > > > +    extra_line_in_junit=3D$(($(wc -l < tests-junit.xml.old) - $(wc=
 -l < tests-junit.xml)))
> > > > +    if [ $extra_line_in_junit -gt 0 ]; then
> > > > +        echo "WARNING: Found $extra_line_in_junit too many lines i=
n junit."
> > > > +    fi
> > >=20
> > > Is this the cause of
> > > https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/18493=
42222/test_report
> > > getting a row of 0's for ADL ?
> >=20
> > Well, the error I had was this one:
> > "FATAL: Extra content at the end of the document"
> > https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1848598=
740/test_report
> >=20
> > And indeed, when I managed to dl the junit.xml, there were the end of
> > the document duplicated many times.
>=20
> Wouldn't it better to do |sort|uniq to dedup the file?

I don't think XML structure will survive it...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--J8Or3Pad7ufB5OFK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmg/QNUACgkQ24/THMrX
1yx2oAf/dBzm8uVNHbYdwmGDmrNF2f1svf1qAAErBd9u1+OKXzzxs3GmrlwaqLDf
ImChEhME6A4bgPpMgyaA7aBob7z7ChGJU8g16mSmkjIklytx0ecXrDxT3tYDi5oS
bBPc0lXz5ns58WEcdAw/BHMy1DJmCfPKIUBB0mChSwneENdR7AzIT1j7mXBDracU
PAuoLIZgZEhRR1Yso8y1iZrkchFSZPEyFi0fzqptYY1FG2v3UusLz9PffhAvH0Ng
/Ky043iauM8jvzln2CgILeONILvu++9ANG4mVGftT2qSbleZ4ua5EAQ3Uk6eO71J
Wi3D/UvdHkPWk0rIX+ceChsWkDDpEA==
=h837
-----END PGP SIGNATURE-----

--J8Or3Pad7ufB5OFK--

