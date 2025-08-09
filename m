Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B112B1F569
	for <lists+xen-devel@lfdr.de>; Sat,  9 Aug 2025 18:23:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076038.1437763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukmLM-0005j8-2R; Sat, 09 Aug 2025 16:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076038.1437763; Sat, 09 Aug 2025 16:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukmLL-0005gv-Vw; Sat, 09 Aug 2025 16:22:51 +0000
Received: by outflank-mailman (input) for mailman id 1076038;
 Sat, 09 Aug 2025 16:22:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNAa=2V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ukmLK-0005fV-D9
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 16:22:50 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10067afa-753d-11f0-b898-0df219b8e170;
 Sat, 09 Aug 2025 18:22:37 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 9925CEC0102;
 Sat,  9 Aug 2025 12:22:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Sat, 09 Aug 2025 12:22:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Aug 2025 12:22:34 -0400 (EDT)
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
X-Inumbo-ID: 10067afa-753d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1754756556;
	 x=1754842956; bh=Bvpb9bB3+tIQeHs3qb+fmGsq3zBTrrLusZFuVbT98pk=; b=
	BpzEl5nIeGVmtXbxqeMvu3NwNUSk/SmMxP82lFoAhNGYMkukvNZCvm9LGQLABJ5w
	dYpaB99SFTqdBizXtBxONC0riUmXUJSuGBTR9qFcz9Yoseh7n63g3U8a6YWNh9Cv
	icD4BRehM/kRog594Kjoxzp6TPpBUgEfT2cGy7DSdyhFlS1724nhc5kztcFRXP/h
	AGWRu+2K3yWM3FpgVJFudMWYcS0qgyCOrG9/jzV4FkkMV1kM+yJhiTV21keJSeJ0
	E+bWqHDjV4Nn7uxgoc3WJs0RFgYPcud2q+X6/+HQWjHBljQFaY4MeeLp9YHLAECT
	44/dW4wNQYBWoAC7PboWeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1754756556; x=1754842956; bh=Bvpb9bB3+tIQeHs3qb+fmGsq3zBTrrLusZF
	uVbT98pk=; b=GWt6XrYbv3F0g3WY8XtK/OfjEEmlBc9y4rBmgJ//QVl1xok34l2
	puE2ocIt1zdwCG0ZztHlX3lIRUn0+o5n+e7SY2To/Vt7hwUURSlSpJ9LQrxF43PQ
	ISH9iVAMFM2+kKSj9VphuS7tZHyud5iM6ALmGjjGGyOFDwZSCznkMGckswasP1em
	soRe56XL0yTDHonezXAjXZQ1iZNzT9R1ya4QEsN9bmmr6xG2faPVYXbqvgWi2qj9
	3mOq1Uja9dvaS77XRWgFmiA4UXH7zd++SqOf+tMhzdAf3Zev3+5mHhy6SqVYIVxr
	1lcjoBzmh4Dytca1M6wNBz5IlLBA3zeKt3A==
X-ME-Sender: <xms:y3WXaI5pkmQBwDOYdw5Io4kkh2Er7aoqNFgExSAJ3zY60Wu_mShoqA>
    <xme:y3WXaCXg1xhq7MDOLGD3btlg4M8RXUyA8entaZ_IAraQaiffnOLNsYbxiaFpUXzE9
    sIkUAa9pZJwGw>
X-ME-Received: <xmr:y3WXaH4dVSO4yAQqAoWblI4UmLqE1XO8_w4upxzA6Iw-Fg19Xp5orb5M_BabZjLMrC2AvMME9FRQANpVjIRjRVtMdpTPFbMpbis>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdejudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeujeet
    geelleetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomhgrih
    hnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrnhhthhhonhihseigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopeigvg
    hnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthho
    pegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoheprg
    hnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopegtrghr
    ughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:y3WXaNqRWl4n9P0eOiz93OMAlAZiSqJ3u-ZsSXnpxsubWsseX5zw9g>
    <xmx:y3WXaKkUwptJIzLY8QDjlYpJv5QPpMfpksuQrvztH80ve1778Ex5Hw>
    <xmx:y3WXaJMYB1i8JKbZmFKSdpNMzcldUtnQ053emHK_bB901ylV9A4u4g>
    <xmx:y3WXaOOMa_uyQqGbv2yS-vS84cVmW6VCWJLKrKAZUGsHlM1_QASM1Q>
    <xmx:zHWXaE_sdxdruzVW2NYR07Oh8kn1Dipmi75vjDRBy5i0KHuqEnbsxkv7>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 9 Aug 2025 18:22:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 1/3] CI: Rework run-tools-test exit path
Message-ID: <aJd1yaBFSjTx_wsl@mail-itl>
References: <20250730152602.45436-1-anthony@xenproject.org>
 <20250730152602.45436-2-anthony@xenproject.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aMZBcusYaCrcvdhH"
Content-Disposition: inline
In-Reply-To: <20250730152602.45436-2-anthony@xenproject.org>


--aMZBcusYaCrcvdhH
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 9 Aug 2025 18:22:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 1/3] CI: Rework run-tools-test exit path

On Wed, Jul 30, 2025 at 05:26:00PM +0200, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>=20
> The main script expect to find the string "$passed" or it just timeout
> and doesn't try to download the junit file in this case. So we ignore
> the return value of run-tools-test to always print "$passed" and
> instead look for failure in the generated junit file. If the junit
> report is incomplete, this will also result in a failure of the job.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> ---
>=20
> Notes:
>     Changes in v2:
>     - This squash both patch "CI: Ignore run-tools-test return value" and
>       "CI: Have the gitlab job fail on tools/tests failure"
>     - grep for '<failure type=3D"failure"' instead of '</failure>'
>=20
>  automation/scripts/qubes-x86-64.sh | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qube=
s-x86-64.sh
> index 2750d24eba..21dcd9b063 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -135,10 +135,11 @@ done
>      ### tests: tools-tests-pv, tools-tests-pvh
>      "tools-tests-pv"|"tools-tests-pvh")
>          retrieve_xml=3D1
> -        passed=3D"test passed"
> +        passed=3D"run-tools-test over"
>          domU_check=3D""
>          dom0_check=3D"
> -/root/run-tools-tests /usr/lib/xen/tests /tmp/tests-junit.xml && echo \"=
${passed}\"
> +/root/run-tools-tests /usr/lib/xen/tests /tmp/tests-junit.xml ||:
> +echo \"${passed}\"
>  nc -l -p 8080 < /tmp/tests-junit.xml >/dev/null &
>  "
>          if [ "${test_variant}" =3D "tools-tests-pvh" ]; then
> @@ -297,6 +298,14 @@ TEST_RESULT=3D$?
> =20
>  if [ -n "$retrieve_xml" ]; then
>      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> +    # Findout if one of the test failed
> +    if ! grep -q '</testsuites>' tests-junit.xml; then
> +        echo "ERROR: tests-junit.xml is incomplete or missing."
> +        TEST_RESULT=3D1
> +    # Only match "type=3Dfailure" to allow to "tolerable" for example.
> +    elif grep -q '<failure type=3D"failure"' tests-junit.xml; then

Maybe drop -q here, or add some message? Otherwise it's not obvious why it =
failed. See for example:
https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10968674458

Yes, you can click "Test summary" link, but it isn't obvious by looking
at the final part of the log. Alternatively, this can be combined with
my "CI: list failed tests at the end of tools job" patch (already
reviewed by Andrew), but I had an impression this series is supposed to
be included instead of that one.

> +        TEST_RESULT=3D1
> +    fi
>  fi
> =20
>  exit "$TEST_RESULT"
> --=20
> Anthony PERARD
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--aMZBcusYaCrcvdhH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiXdckACgkQ24/THMrX
1yzGmAf/fyBtLTHmu1SFvpckPQHZ7F6xvSFcBmB5/8VRt8QUKOFn99AnngJLOYsK
qN9B7QgCMbnP4N8R/ioVgyofHArAuz71Ad+GXM1uw4M+fSTGe8Q7w83ecno1CzVO
8T1l7f15ExbK5cHTON65KJnMsBoMnMzcaqqbGjU5krSbfQHrKGCfz9mjyLe8NTc5
UVxpm9yrIjn1bk5xsOyKrkMRiuOdlano0tkOPmCsjuUpm8kqZitt0WHb7aQHBPdQ
PQlT9+1QkKuf5Ki52TsjmbU2jUH1sTdifxQENfCePyQHdflEI7mBaS9d5BXmfv3m
Z+/VAHeKgFxStgQ4zYSOpwNtJSRifA==
=fIyO
-----END PGP SIGNATURE-----

--aMZBcusYaCrcvdhH--

