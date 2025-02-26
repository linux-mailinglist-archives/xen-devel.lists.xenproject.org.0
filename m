Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6CCA451BF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 01:51:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896086.1304757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn5cr-00068n-Gq; Wed, 26 Feb 2025 00:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896086.1304757; Wed, 26 Feb 2025 00:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn5cr-00066I-EF; Wed, 26 Feb 2025 00:50:13 +0000
Received: by outflank-mailman (input) for mailman id 896086;
 Wed, 26 Feb 2025 00:50:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cat0=VR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tn5cp-00066A-G4
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 00:50:11 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d97bf57-f3db-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 01:50:04 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 607211380EC2;
 Tue, 25 Feb 2025 19:50:03 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Tue, 25 Feb 2025 19:50:03 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Feb 2025 19:50:01 -0500 (EST)
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
X-Inumbo-ID: 9d97bf57-f3db-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740531003;
	 x=1740617403; bh=ryeOacmhi3T2sFf8TyDDKaTDfbe73PMUdjxY9XHea38=; b=
	Cy5Z6W914usfiNb6uSXraRooaj9CYPcpMoO326LP0NdF3LUQqnwMaOJFLKzAcLGB
	L4XOW9SQOt6XHsDYDsrsEfjak3CpBYagVxQc6rEm2D7dVB6QAfQg5mweDxYCzBbL
	t+DVYUdc1K7bNzM1N5J7e0RAuN+nCoDMknlN0MtBxLGp9nB6DXTOcK3ex2tqhBuB
	8VguAljT92YF/LB+J4u+r6UmGj2Wze6zw7QAhkT+6lp/uYCsqqNKCS/NvQWX+kaV
	utnPZo4qbdeMhUEPVFKcpHbD0sXw189Kq574cG2kOXjVDN8iLXUfi0iZLVjG2Xa5
	bZ7VfrQbcVWTLWKvMv1ZIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740531003; x=1740617403; bh=ryeOacmhi3T2sFf8TyDDKaTDfbe73PMUdjx
	Y9XHea38=; b=AoinUBoU2JzxFz4Xz9Ho1HME21Bje4Ko28Wp2af8Mb0ujpVi6c1
	wzLfFxa0uHVlOJ88ZAe5KlfjLRayuJqK6G9fLfteQSgPm++UHhai1RJho4XDyGRI
	1AglxbKd0r4/+XBSl+iFH69xhkPMiOBfKNHSqUNrbKvHpI9E9sFHJ9z0lUi5VkkC
	Xu2XDyvKrKHE0xeZfhsrzJKNeJy+bJK7HlqbVOtkdC2c/0eT92M54Qc9fu5oEu6y
	7t1dQcORsXVbizpWbdBpm3BuSbLiSgpumvroPoM21iTESejcKyLzC0flNwMMIKjS
	dYLCKHSZrCr339SKIALNoDH8aCDnXOVvJ3w==
X-ME-Sender: <xms:OmW-ZzsI_gYtLvDmZWe8yKILoGRCiWuKx9mMitU_Q9rjgPuF_6Y-VQ>
    <xme:OmW-Z0ef6D21A5vOuUgWcZHGuakNj9lw8RIqCYjRsiu3aYvwmLsg5fvoTjHEl8XEz
    7mS0MGOdnl5og>
X-ME-Received: <xmr:OmW-Z2zz-bmmSfZQRsLXg4TW1KUjoMI0UPxDO0GUjmroK9JM7cZFZxAk6Kh1XbWGe1rahAmbPqsb6VchzpGOwe3JA4sDNa8tVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekfedulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvd
    egueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifudgs
    vghnnhihsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvg
    drtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgv
    tghhpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomh
    dprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdr
    ohhrgh
X-ME-Proxy: <xmx:OmW-ZyMZkxT5ozAmFUkebCOYbRwWWRipOtt-7aw6_ADGeCSj72NVMA>
    <xmx:OmW-Zz_qvq2XZBFPtwI_PSCtiGcXAf0LLFwR-r4h2phTDzmKXvjHVg>
    <xmx:OmW-ZyXzuJXYiFSUrLJQswm3WWYFMvH4NTD_Lzg4pmToqB9_XShlZQ>
    <xmx:OmW-Z0dW7Jh6Pbzmv03Jwk6enrbOjO2Y5lO51Upsw-n8ldiSdjp3qA>
    <xmx:O2W-Z-mw05Xt_nBTJM0IfVheiZD3xq-Q0rPnkWk40CDiisUOa5EfFsKg>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 26 Feb 2025 01:49:58 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Petr =?utf-8?B?QmVuZcWh?= <w1benny@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: xl create/save throwing errors
Message-ID: <Z75lN_ShrXUGiT5e@mail-itl>
References: <CAKBKdXhaQLj01Kn06xMBsHExT1xNMKnHxTB+Hu33jtpySr-few@mail.gmail.com>
 <be2314bd-d212-4b9b-a50c-1b86b42ab861@suse.com>
 <CAKBKdXgMn90_R6_rKWAzrQdkpPXL1-ZxAKM8n8RPXiOeY7VtJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YNcMDSZhhzmOpYHi"
Content-Disposition: inline
In-Reply-To: <CAKBKdXgMn90_R6_rKWAzrQdkpPXL1-ZxAKM8n8RPXiOeY7VtJQ@mail.gmail.com>


--YNcMDSZhhzmOpYHi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Feb 2025 01:49:58 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Petr =?utf-8?B?QmVuZcWh?= <w1benny@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: xl create/save throwing errors

On Tue, Feb 25, 2025 at 11:59:38PM +0100, Petr Bene=C5=A1 wrote:
> On Thu, Feb 20, 2025 at 9:14=E2=80=AFAM Jan Beulich <jbeulich@suse.com> w=
rote:
> >
> > Just one thing - to (hopefully) get a better understanding of the origi=
n of
> > those errors, you may want to increase verbosity of the "xl save", e.g.
> > "xl -vvv save".
> >
> > Jan
>=20
> Here's an output of this command, that failed:
> xl -vvv save win10-18362-103 /opt/ramdisk/vms/clones/win10-18362-103/state
>=20
> libxl: debug: libxl_dom_suspend.c:348:suspend_common_wait_guest_check:
> Domain 90:guest we were suspending has shut down with unexpected
> reason code 3

This is domain crash.
Anything interesting on the console log of that domain (if it has some
debug logs there...), or maybe in xl dmesg?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YNcMDSZhhzmOpYHi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAme+ZTcACgkQ24/THMrX
1yyA+gf9FIFnTEEdV3WbZKTZ4TsKL5VODeh/OA90LGyQ3MSpSGseO/oK8rZbUNEv
fTd5i6a4pimJIDCAkeoD4Vc/Hxk+KN9syvCd6dRwpxskEmiu9E6kJ9TfCoOdsUNb
Gefdv817QrVSTmKB5VQaMPhP9wxyx52P7W6vRQVa0El1pn4kI5VvZFfltkYOsXNX
vK8bXl6PzGLtci4mdHzewv6defLBLcgWDsYpaTupaYdf2+y9Y7gbuAJjABD7rTTs
u3FlpdMg2jbFAdvD4LZahNgk7gUoGuqRu+aFhKOYi4Dm9Rhr+WtdQXu0DacAxseU
RB96I+/petFWyY6XpgZ+FVUwR7NQjg==
=CX4L
-----END PGP SIGNATURE-----

--YNcMDSZhhzmOpYHi--

