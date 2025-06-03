Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A403AACC828
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004499.1384231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRwQ-0002yh-Pf; Tue, 03 Jun 2025 13:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004499.1384231; Tue, 03 Jun 2025 13:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRwQ-0002wz-Lo; Tue, 03 Jun 2025 13:44:34 +0000
Received: by outflank-mailman (input) for mailman id 1004499;
 Tue, 03 Jun 2025 13:44:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zlp/=YS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uMRwO-0002wq-PV
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 13:44:32 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd1b599d-4080-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 15:44:26 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 9936D114011B;
 Tue,  3 Jun 2025 09:44:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 03 Jun 2025 09:44:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jun 2025 09:44:27 -0400 (EDT)
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
X-Inumbo-ID: dd1b599d-4080-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1748958268;
	 x=1749044668; bh=vnCuflfvJh5fbWIYpTtpEzKQDNyFvkkxEfvULtRVjyw=; b=
	aBBtAUHK4NZ8mIa2GuEQ8NmQZ3yKFATDd1fg8+PcjrJfjaKJvJS9V/aZxfXP78kj
	UM/TzcsmNBidkTmuaRRz5ou3t+Ej34TQkdexY/enWJvBXyAy5lrVkFU0HTAq6ywl
	dVqV4sDEvu/3QvXnVphzsA3Hdexng6lLLxmzqKT1TR1h6OXveh6q9AUC2QQ+OnFT
	YOi2c7Hfr0lP3YiyojjeDmh2rpY6n8x98wDr4MTCklEzVdt6j19FjjNFJsqc3UFk
	cmE+GBSW1sQX1jr6Io4H0XOnbDjE1/qaFVUZrtyjhc1YcpdhBOn40YGBLPCMvkjg
	1UbkZ5lZNeCUdApO98k3Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748958268; x=1749044668; bh=vnCuflfvJh5fbWIYpTtpEzKQDNyFvkkxEfv
	ULtRVjyw=; b=PVmAb8umEAe7X6DJ3xUz5y6+ZO1Y3TxG22thNc5ZsSVWm1go4Uw
	9HKlQoPYRjfwecdlhdefaY3iiSV1LAFoPpH3R2J0yNumgWC9kACtp4oEx/0/oKPY
	gvJYPWjCyo/fJukStWibfGADif3tg66WvYS0FA4l5s9zdFPq3GrkggfU3jNgJvtT
	zh6+6gU7urMGIaZq20E/BDfvFmprC69lqiTaV6HSpyL4KgluMsHXUB7UvVFKoF1D
	A6jW7lA3x+UFOHhYanSQsItx1Y28jKOpuxnfLWchpgdMIlXEQcFYQeYZXybkMEG9
	uWhp2RXbB96cCwuO9C0Ue+EwP0hZgN4drdA==
X-ME-Sender: <xms:PPw-aDJ7ZL5Y2g85LhX4IRlge2xvs9o_7oKMusV685RK6njPfQxN3g>
    <xme:PPw-aHJ8hY0dLBu7pKReneKDszvR4EB64YGNjBgknUt9oXhtR6IbKEzlTPTiYijFV
    wNxbOHxpI6AWQ>
X-ME-Received: <xmr:PPw-aLvAHLymUtS9BTi6z-KxtBjx4gPiCINgFcnjaipkF8x9efMR5lIZi1c7XhrHDx9C_dvjkgmEYG4UNlAbLTjPYsAERDVo5U4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeflecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpeevueejteegleelteduueevhfetgfffjeevtddvgfeiveehteehleegue
    elvdejveenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigi
    drtghomhdprhgtphhtthhopegrnhhthhhonhihseigvghnphhrohhjvggtthdrohhrghdp
    rhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdroh
    hrghdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghh
    pdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehssh
    htrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PPw-aMZ9rQhN38UvVBGMio1ZwtEqj7vbyuBcTbwJ_1EvOTJ1PLk6KQ>
    <xmx:PPw-aKY1qnNstKFXmU0hglqrHH7gmIexpMdTGvoBqHMLu3_YYOfskA>
    <xmx:PPw-aACYmhWjRLOEHB3Xpow1KuWKKeM00nEQd32RIhvqylgacz-8Lw>
    <xmx:PPw-aIZJAKqRLTetOSY4suGeDqWXDNEjMQsNmRyDhRDf3t_tkhp_Cg>
    <xmx:PPw-aL7yV4KJzbw5R-jac8-Dzlm9BFEDaNUH0b030J11eJm9JtC0-s9h>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 3 Jun 2025 15:44:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 5/9] CI: Have the gitlab job fail on tools/tests
 failure
Message-ID: <aD78OU9fF5rqbHBh@mail-itl>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-6-anthony@xenproject.org>
 <ba57188a-77b9-4386-bd5a-073903062864@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Mr2DUhFd65wkulsj"
Content-Disposition: inline
In-Reply-To: <ba57188a-77b9-4386-bd5a-073903062864@citrix.com>


--Mr2DUhFd65wkulsj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 3 Jun 2025 15:44:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 5/9] CI: Have the gitlab job fail on tools/tests
 failure

On Tue, Jun 03, 2025 at 02:41:50PM +0100, Andrew Cooper wrote:
> On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> >
> > We can't rely on an exit value from `run-tools-tests` since we only
> > have the console output. `console.exp` only look for success or it
> > times out. We could parse the console output, but the junit is more
> > concise. Also check if we have it or fail as well.
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> > ---
> >  automation/scripts/qubes-x86-64.sh | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qu=
bes-x86-64.sh
> > index 046137a4a6..7a4c5ae489 100755
> > --- a/automation/scripts/qubes-x86-64.sh
> > +++ b/automation/scripts/qubes-x86-64.sh
> > @@ -298,6 +298,13 @@ TEST_RESULT=3D$?
> > =20
> >  if [ -n "$retrieve_xml" ]; then
> >      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> > +    # Findout if one of the test failed
> > +    if ! grep -q '</testsuites>' tests-junit.xml; then
> > +        echo "ERROR: tests-junit.xml is incomplete or missing."
> > +        TEST_RESULT=3D1
> > +    elif grep -q '</failure>' tests-junit.xml; then
> > +        TEST_RESULT=3D1
> > +    fi
> >  fi
> > =20
> >  exit "$TEST_RESULT"
>=20
> A couple of things.
>=20
> From my experimentation with junit,
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/184934222=
2/test_report?job_name=3Dkbl-xtf-x86-64-gcc-debug
> we can also use </error> for classification.=C2=A0 I'm also very disappoi=
nted
> in Gitlab classifying <warning> as success.
>=20
> Not for this patch, but for XTF I need to be able to express "tolerable
> failure".=C2=A0 (All branches of Xen will run the same tests, and we don't
> have OSSTest to deem "fail never passed" as non-blocking.)
>=20
> Even if the job passes overall, I want tolerable failures to show up in
> the UI, so I have to use <failure> in junit.xml.=C2=A0 But that means nee=
ding
> to be more selective, and I don't have a good idea of how to do this.=C2=
=A0
> (I have one terrible idea, which is </failure type=3Dtolerable"> which
> will escape that grep, but it feels like (ab)buse of XML.)

But that automation/ dir (including the run-tools-tests script) is
per-branch, so you can specify there which tests should be considered
failure and which just warning, no? It will require few more bits in the
script, but fundamentally shouldn't be a problem?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Mr2DUhFd65wkulsj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmg+/DkACgkQ24/THMrX
1yzqtwf/dXxEpoK1ZgAqLd2T+rmMmkC1Sgzevk9Gsy0FG3twjrRbYJ6tXhkeGSFD
JjdFHR9+Nkcr32zAlonr/i2E4PLicYURPHsDXHyG7HFc/7vDPg4GPBsrzdDdDAc2
Lc5F2q1RQSSAXmkSAsxqHHFhY+0mrw5JZEA7KTdWCElUpzDPq/f7/iji+0/BLakb
1VCgGVD8a5SCuVxX7VqRNjfrZPH73OyrSAjlIPhwmKgdtWy0OAGgjmyoscNrz8f5
6+mZZ4wQj0nyiQckwD3igckbHVXYaZQpqa2AEqK6JVgobeMEPpFeK8BQCFd6HyAm
egOsOL9oxmEzr9bLvsMUn9UiCI11AA==
=R2pf
-----END PGP SIGNATURE-----

--Mr2DUhFd65wkulsj--

