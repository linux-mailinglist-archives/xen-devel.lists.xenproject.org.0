Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 718B6B1F56E
	for <lists+xen-devel@lfdr.de>; Sat,  9 Aug 2025 18:25:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076054.1437784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukmNy-0006oR-PF; Sat, 09 Aug 2025 16:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076054.1437784; Sat, 09 Aug 2025 16:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukmNy-0006lu-MU; Sat, 09 Aug 2025 16:25:34 +0000
Received: by outflank-mailman (input) for mailman id 1076054;
 Sat, 09 Aug 2025 16:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNAa=2V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ukmNw-0006lg-Ro
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 16:25:32 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77eb4ae9-753d-11f0-a325-13f23c93f187;
 Sat, 09 Aug 2025 18:25:32 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 38BB8EC0692;
 Sat,  9 Aug 2025 12:25:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Sat, 09 Aug 2025 12:25:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Aug 2025 12:25:29 -0400 (EDT)
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
X-Inumbo-ID: 77eb4ae9-753d-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1754756731;
	 x=1754843131; bh=zS+8Cb70qLjojvObOhXUZtr4XGKJjLy7vzLKSXHxvec=; b=
	lpeDdCIB/+LMT5AmxOcnKJKV+5wZ9B5Ra7VlmHyE8T3ZozSxMiyLianyZ70/YqaA
	56KGsF08+/DLX+KEkfb/V6+UTFvaUmPXGjAFGG42W7tUzA/FLDMSoJ1+T7yuXCPP
	5P7vtFw4Ii5hmmyXGRlBb5/mQxrFOLkVJPacnDOv4M/Ot7fAG2m0ECatbr2FN0Zu
	K3ZszImj+M2B0JnHuyAeq6huit3pPOJbViDAimE556jWk3qs+YUv3c9E5T03J9Ef
	NSNo10nL7r5HOvuBrKo7S4Yvv1a4GqNPRbc/t6UTwVAr6pzIg7dCR0C2vo9pIsk5
	N75sbv071hePx6axgvttNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1754756731; x=1754843131; bh=zS+8Cb70qLjojvObOhXUZtr4XGKJjLy7vzL
	KSXHxvec=; b=SOfatopEcc0ZZW0brlJmejXym7QQcP9DnDhconLJ1XLgu97W2vK
	rycsqLfsXN2xNa8hvhUtam2zswED0sEiFsfY/TQz1mHjHuujbmucCi8bZSYZ6hLt
	C4wWgRpCZX+1JN1Cb1bfotrFfgIHw+BrQoz95Dh2SnenXNg2xy/nVL6SdQt+Yhol
	z6+GCNF/0lmVZs2ToaCZdW0K8LlJWTY6cpluV62wa47ACPKhbTchG8/zx7IvLFIK
	YzgXoBTzFQsDvbxKYodqCRnjzyCX4Fy/Ir3Mgf79XfjU7eZuKDzHoOxYpIm/VZfb
	3iznyPJHCQLUnSvczPMKsz8RJgAFw/5sUZA==
X-ME-Sender: <xms:enaXaPmhNMM0RzB_Cc-SL3l3-VnwDmehofJ6ILv6S2GP5Pn0VxqQ6g>
    <xme:enaXaLQHPu_ZYOKgVE9dYVUaDj8_qUOP0-xsc0w9V-SC8pZrxWnAkKy8Rm2vz3RsW
    oyTEB0Etz-cmw>
X-ME-Received: <xmr:enaXaGFvMq5-vs8ZpBQNggMB4f-mudAdpzKKn0xTj2kjlc7y2kCGrSCrhSXWZXBEPmHER7BQC6DNOOM0Nxc34tAPaltWYPXeCxI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdejudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepiedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnthhhohhnhiesgigvnhhprhhojhgv
    tghtrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprh
    hojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihht
    rhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvsh
    drthgvtghhpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphht
    thhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:enaXaIFhbK0HAr3Skm3C1YE6PZDUcSoXSbJg2Q58FWqgD096tx2u2w>
    <xmx:enaXaMSI24aAbfJHJ0fndMeXsWoHQ-dppgEgs8aPpTlrD6obfoXzrQ>
    <xmx:enaXaBLKEcMr1SB_DP9yfpc3vBNgyApysreLooq-3U9CWRyoZMWRWg>
    <xmx:enaXaPY5he2oT22-JIAKqQghVBsI0vzG_-1pzzgLfVwbn8xkzmpa6Q>
    <xmx:e3aXaMJeMiPhoZSNNEZOMx2fK3DWJengmhR4PGtcvkV2zxxdkyilPVNI>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 9 Aug 2025 18:25:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 3/3] CI: Workaround extra content in junit
Message-ID: <aJd2eHFgiLBNiWCy@mail-itl>
References: <20250730152602.45436-1-anthony@xenproject.org>
 <20250730152602.45436-4-anthony@xenproject.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ixp8jPEmCs6W2s3B"
Content-Disposition: inline
In-Reply-To: <20250730152602.45436-4-anthony@xenproject.org>


--ixp8jPEmCs6W2s3B
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 9 Aug 2025 18:25:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 3/3] CI: Workaround extra content in junit

On Wed, Jul 30, 2025 at 05:26:02PM +0200, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Is it still an issue? AFAIR similar issue was fixed together with fixing
xml upload hanging.

> ---
>  automation/scripts/qubes-x86-64.sh | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qube=
s-x86-64.sh
> index 21dcd9b063..f1b7e02e63 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -298,6 +298,12 @@ TEST_RESULT=3D$?
> =20
>  if [ -n "$retrieve_xml" ]; then
>      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> +    # Workaround duplicated data been received
> +    sed -i.old '/^<\/testsuites>/q' tests-junit.xml > /dev/null
> +    extra_line_in_junit=3D$(($(wc -l < tests-junit.xml.old) - $(wc -l < =
tests-junit.xml)))
> +    if [ $extra_line_in_junit -gt 0 ]; then
> +        echo "WARNING: Found $extra_line_in_junit too many lines in juni=
t."
> +    fi
>      # Findout if one of the test failed
>      if ! grep -q '</testsuites>' tests-junit.xml; then
>          echo "ERROR: tests-junit.xml is incomplete or missing."
> --=20
> Anthony PERARD
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ixp8jPEmCs6W2s3B
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiXdngACgkQ24/THMrX
1ywVxAf/VyXVYyff+VxZWa1rxo3PwObk3mzOS4TcOZQMOcBVDuMXzZuIu79A/jC2
2ZcOCO0pjx6+/6siW6vAJm4ROA6W8rGGyGfc23SqfIcDJpNqArgB4w2Y6pEKJP4O
cWZDTucxY7aWyUElWRqsEsgkD8X7vcls4/6l1th+rzbSaEwTibWBo07plKpoW6rc
No34PV65SpL3EX7yIbHeuAJLL1jc+zkRYC1+w4KTqOvZ+BiSYne6CqwZPrWc8ZKx
PtnTtzalOIpiARVc5SXoN02h1919Yh/gD2rBPm/iM5ax4G6RR2j09tQKGzbD/v29
P1z/e8kD7JozMsiyQ0v1PQqGwIG8Zg==
=kSx7
-----END PGP SIGNATURE-----

--ixp8jPEmCs6W2s3B--

