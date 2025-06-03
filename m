Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202DCACC81E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004484.1384221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRts-00025P-Ct; Tue, 03 Jun 2025 13:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004484.1384221; Tue, 03 Jun 2025 13:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRts-00023k-A5; Tue, 03 Jun 2025 13:41:56 +0000
Received: by outflank-mailman (input) for mailman id 1004484;
 Tue, 03 Jun 2025 13:41:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zlp/=YS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uMRtr-0001oe-8i
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 13:41:55 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8207508b-4080-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 15:41:54 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 63F8A1140115;
 Tue,  3 Jun 2025 09:41:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 03 Jun 2025 09:41:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jun 2025 09:41:50 -0400 (EDT)
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
X-Inumbo-ID: 8207508b-4080-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1748958112;
	 x=1749044512; bh=at+V2xcJ97nR3jSRC9+8kvplrdb00UPWvByJSoMoQIY=; b=
	ZSoCRzkENDx5pA0viZnPetUD76+gQuYJAqYQ5J43/VSZ3L6B5USgFsRYnaD17fwm
	+WmAxruJRnFJaOykGirdWaAXUuSDLpoYhKMBAbtb1hdztDByKXzC9GK6MwRb4Uj1
	7ZwaPQKFEtsahf4bVx4q9TnfP75om4hlOFcJQgYPX1OeYkMCgxiCfpgg/rzLGRf/
	CPFHXbKPDEOBbX6KNXcmlUJrT8rbofzSMWLjj6yWgP8B0v7P1l0lwOlXc5UtyYxd
	ZDEy6ex9Pzd7Qok7qYDxedMw1BH4kFgHqhNfoUJoLrmHZ4g3XTjpoQjG/H3vTs/2
	asVmFSaNG/O/kFU5+GIP3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748958112; x=1749044512; bh=at+V2xcJ97nR3jSRC9+8kvplrdb00UPWvBy
	JSoMoQIY=; b=UWb7kU1EmBnmrRR5vpPj7c3yJv4tKE1uUFFyhzccT2kxd9fATdp
	hiEWFfwcCUTn2kbAvD431cE2aJZqZnsvgbqUGEwkQU/CVnXPFf1trRtkMKgSHSIU
	zDaSK00F+Dr8jkra3zfAF9Gk1TxsN/lQM8KoC3qmlasD5WoMiG4u9LpJV5TTpmCP
	9+aLBTGLz8dcDG8nP2OA7C+011zZ1f4DCr6nZ1oavgXaBMhiOGCFYreVX2PkYAJ0
	dR7rZvJevW5wCq31zaAN7q+bmPjNNzX2dy6rHJfwgxHqTo/u7fnk37KLqysF6V9f
	W08F0AxECd5y4Lg+5d2AZiYtqj7nAmto1BA==
X-ME-Sender: <xms:n_s-aPzjK4NddbB5HNOjJuE8yLquLgivP1rLN-iXxggIxzOXV7BARw>
    <xme:n_s-aHSWykTH45SIwEpfBMQ2sSzVeeqcB9MqnVK8Urn-BnRZlxxU9lxt0bhG_zzfS
    YVgvmHliKtuAw>
X-ME-Received: <xmr:n_s-aJWfvo_SjYYbN5rgvFwy7jIkov4jsopu1yDIsgzWpod6nWIjGOML1ev2B4RCWqq8Dgkg3fiy6AmWKeveB9eQdwiPq67lUao>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegue
    etfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsg
    gprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgv
    fidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoheprghnthhhohhnhi
    esgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhi
    shhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhhohhnhidrph
    gvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopegtrghrughovgestggrrhgu
    ohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:n_s-aJg8yQ-pJGPizHcMhrumO1YSdCojN8H4isgCjuFX2Q-G99SuIQ>
    <xmx:n_s-aBAhg20cdPVOxWX0_SLcRUKTJ2zBlVIoiHL8HynPm7SWGWnZeQ>
    <xmx:n_s-aCIQMEw2lhYNnwSi1vbfTw7Z83pRmVPicTmj-sfMME_Wjvh3hw>
    <xmx:n_s-aAD86myGioMtqSHbbiEHQs5sAqbXQ99eHBcPshz9XTKv_vWHzQ>
    <xmx:oPs-aMacmRlB9dkHsPo44FzxnKjVwAA6kwGFsK9g-U8PirKv_aahrpcb>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 3 Jun 2025 15:41:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 4/9] CI: Ignore run-tools-test return value
Message-ID: <aD77nBiBwgICtuka@mail-itl>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-5-anthony@xenproject.org>
 <d9ed8961-f0da-46d6-81da-7b98a12903ec@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vBNrMdv9Uf5hM5TU"
Content-Disposition: inline
In-Reply-To: <d9ed8961-f0da-46d6-81da-7b98a12903ec@citrix.com>


--vBNrMdv9Uf5hM5TU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 3 Jun 2025 15:41:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 4/9] CI: Ignore run-tools-test return value

On Tue, Jun 03, 2025 at 02:26:31PM +0100, Andrew Cooper wrote:
> On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qu=
bes-x86-64.sh
> > index 2750d24eba..046137a4a6 100755
> > --- a/automation/scripts/qubes-x86-64.sh
> > +++ b/automation/scripts/qubes-x86-64.sh
> > @@ -135,10 +135,11 @@ done
> >      ### tests: tools-tests-pv, tools-tests-pvh
> >      "tools-tests-pv"|"tools-tests-pvh")
> >          retrieve_xml=3D1
> > -        passed=3D"test passed"
> > +        passed=3D"run-tools-test over"
> >          domU_check=3D""
> >          dom0_check=3D"
> > -/root/run-tools-tests /usr/lib/xen/tests /tmp/tests-junit.xml && echo =
\"${passed}\"
> > +/root/run-tools-tests /usr/lib/xen/tests /tmp/tests-junit.xml ||:
> > +echo \"${passed}\"
> >  nc -l -p 8080 < /tmp/tests-junit.xml >/dev/null &
> >  "
> >          if [ "${test_variant}" =3D "tools-tests-pvh" ]; then
>=20
> I noticed this too while hacking on XTF support.=C2=A0 Also of note, I'm =
not
> sure we want to be saying done to the expect script before sending the
> results.

No, expect needs to be notified before, otherwise retrieving the file
won't start.

> The underlying problem is that ${passed} isn't really a pass message;
> it's a done+pass message, and there is no way to say "failed" to the
> expect script, leaving timeout as the only option of signalling a failure.

Well, that can be changed, by adding yet another message that it looks
for, and handling it with exit 1 instead of exit 0.

> I don't think we want to be ignoring errors from run-tools-tests
> specifically, but arranging this is hard.=C2=A0 You always need something=
 at
> an outer level judging whether there was a good test result.

For those tests specifically, if changing to always say success, you
need to ensure that both finding "failure" in xml and not getting the
xml at all (or getting it malformed) is treated as a failure.

> For XTF, the way I did this was to declare that anything didn't match
> "^(Success|Error|Crash|Fail).*" on the final line of the console log to
> be deemed to be Crash (because it's usually an uncaught exception).
>=20
> For this, the best I can think of is to have a fixed outer script which
> runs "./test/script && echo $success || echo $failure".=C2=A0 The internal
> set -e will cause most unexpected conditions to be an error.
>=20
> ~Andrew

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--vBNrMdv9Uf5hM5TU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmg++5wACgkQ24/THMrX
1yyqGgf+P0IsdZ6Ukj2JhQv4WKEy26UpszL8IKU2qWTu02tUIz/M7Ygr5zr2yysM
ZaT6gPl+XoZRxDX95h7APxZJc/Ce8ftW7yfuw+EN37XzO24RN9K+IMTt4y5+l2ju
Sfwp4LkR3a2Kp7wlYSKAmWIjxTmslbgVxn98uQJXaUQyEvIv0c/Vw/Z5+8ux79jr
C/llwNvy8yGns7/OrwuBBWUezWdkwDLSonMZOrFoQ1r+gew0AjFnUHbiIkvAUPSc
c9jXkj8OSZc/9faTYUo3fzakGeA6jwfflFYzvDogvX1w4QXmpYfVIT5ONHfXOSkP
aEEVIoDjcLoXIagRso8ukhHS1JNvUA==
=6eKq
-----END PGP SIGNATURE-----

--vBNrMdv9Uf5hM5TU--

