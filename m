Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177D2ACAD31
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 13:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003222.1382718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM3KR-0003gb-8X; Mon, 02 Jun 2025 11:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003222.1382718; Mon, 02 Jun 2025 11:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM3KR-0003eF-5H; Mon, 02 Jun 2025 11:27:43 +0000
Received: by outflank-mailman (input) for mailman id 1003222;
 Mon, 02 Jun 2025 11:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uM3KP-0003e8-Ew
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 11:27:41 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9673eeb1-3fa4-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 13:27:38 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 89ACF1380359;
 Mon,  2 Jun 2025 07:27:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Mon, 02 Jun 2025 07:27:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jun 2025 07:27:35 -0400 (EDT)
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
X-Inumbo-ID: 9673eeb1-3fa4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1748863657;
	 x=1748950057; bh=mMvL2rtjw+i9KmkxaJdZzgLgxjqBmDMDRwPbP2wBerI=; b=
	PigVAwpTFCJ0F60l/TurgSQOBxnZDRB5L9ODITkdWMZOCJDv/F+X/4OoJtBmuE7/
	/fO5UEag9+UA4Rd8KE69rqP46SqR23szN/E/gEx3f2pYfd6MS7eZfD/uC+OKZ97b
	vwzRqANMmmagMGUXqbOUuSRz1yY20lAbqFnGCfw3tqj8iFlUam/jZ71QcblAUEMq
	LxU2wDQSYf+Lv/ffIVB0YfZReqb2N67xejJnI/TS/4UuWffltu2lFVENAllmsNbi
	Bu0FSQjy9XTIYrKk/QH60cujxOMbOZpjEiol2F7PttKu3k7LzWOhExSQ1uiEj1eq
	pS76/PsDPstoM+0yHY5kfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748863657; x=1748950057; bh=mMvL2rtjw+i9KmkxaJdZzgLgxjqBmDMDRwP
	bP2wBerI=; b=OuDdZ3w4+di4UbBv3xbUXGVRno0baVAwpatOkqF7ThcbD7id0Hz
	QnzH5YL3jlIqFQpWBhfINdjpG8JQ2pEnr6StEsvQx1WMGGNQnMSN4sbaoBR7muN/
	A8JyJokOSfW1HjU1yM2Wkg1/J3m7rNIQj+4p6fgVmNnezoqI/vh3MWVwrSprWjHc
	tW/IlxJMWzzq9CEvG/r2Y0k5Pz1FeppAGmq7hcqN87mV546Z6udR6b4dWZco2DeI
	FCRt692vjzS05Xlhi+onsrm/g4J8RuLnQlkxaB5P90+9mIp9mcWjQw6mSF/L1cYX
	tf1RKsD2QGY9IP6gHhwcTLiqeOm8QdwzffQ==
X-ME-Sender: <xms:qYo9aJBngtsOfIUvvHJZ8r6MumVb10wpGH7gLsM-CyTWnqbifoh3_Q>
    <xme:qYo9aHiUR0A5yEwZE6lICJOhPR_3zSZCw1_4mc-s-TruVjVZI8m5a8pxLVfyz6utZ
    uuXfz5oP7Yv9w>
X-ME-Received: <xmr:qYo9aElf3pO5hfIpA5Euxp9VO1IEWGjc6QaMj9v5i0DMYiaP3wlnoVZmbH-k1bEJqQa50dxU2LFxYacssBMO0a6xCPeesPPmMsY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeehgeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifsh
    hkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihf
    ejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpd
    hrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdho
    rhhgpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthh
    dprhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhm
X-ME-Proxy: <xmx:qYo9aDyUeSkbPU7mJ0saZle33d0twtDAmVL_B5AQe6tiefo8RYxm7A>
    <xmx:qYo9aOTJhc_UMd4HWsgPPIsCfx-LeZPR1Z4TOXstQXIl2-G7k77Haw>
    <xmx:qYo9aGZqcObxeMG_TnQQn3p-E01Jx42MseIlw--SuMBgChYqEkwXog>
    <xmx:qYo9aPSCGhpswmPw96KoV6oqRzE8YkGF02Yvy5MirZ-HRc6o8tdiAw>
    <xmx:qYo9aA04-R4AzGmmO-WmDqkYiaC4oYfTUkAtoVAXEaJXGV8FXMv_O-_G>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 2 Jun 2025 13:27:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] Revert tools/python part of "tools: remove support for
 running a guest with qemu-traditional"
Message-ID: <aD2KpLtC257hlUj8@mail-itl>
References: <20250602112253.2628571-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M/HnU77sO5JUw4/c"
Content-Disposition: inline
In-Reply-To: <20250602112253.2628571-1-andrew.cooper3@citrix.com>


--M/HnU77sO5JUw4/c
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 Jun 2025 13:27:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] Revert tools/python part of "tools: remove support for
 running a guest with qemu-traditional"

On Mon, Jun 02, 2025 at 12:22:53PM +0100, Andrew Cooper wrote:
> The migration stream is a stable ABI.  What this does is break the abilit=
y to
> inspection and operate on pre-Xen-4.21 streams.

Do you mean Xen 4.21 should be able to accept migration of a domU with
qemu trad? I don't think it's a desirable feature...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Juergen Gross <jgross@suse.com>
> ---
>  tools/python/xen/migration/libxl.py | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tools/python/xen/migration/libxl.py b/tools/python/xen/migra=
tion/libxl.py
> index dc5c7ac3550c..5dcb50fe0207 100644
> --- a/tools/python/xen/migration/libxl.py
> +++ b/tools/python/xen/migration/libxl.py
> @@ -51,10 +51,12 @@ rec_type_to_str =3D {
>  EMULATOR_HEADER_FORMAT =3D "II"
> =20
>  EMULATOR_ID_unknown       =3D 0x00000000
> +EMULATOR_ID_qemu_trad     =3D 0x00000001
>  EMULATOR_ID_qemu_upstream =3D 0x00000002
> =20
>  emulator_id_to_str =3D {
>      EMULATOR_ID_unknown       : "Unknown",
> +    EMULATOR_ID_qemu_trad     : "Qemu Traditional",
>      EMULATOR_ID_qemu_upstream : "Qemu Upstream",
>  }
> =20
>=20
> base-commit: 286c4cc267005f73aba831d22d65abe6874ceaea
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--M/HnU77sO5JUw4/c
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmg9iqQACgkQ24/THMrX
1yxQkQgAiFicjWZbKDc1nduGygRW6117SSwtaeksBGvpBETN3lzPJFTnvBdDUB6o
aflaVg/frCTB8r8RHU2GZbqUUZ4VvjczssETQaBGejvACD6rU5pEZIqbbJ6q9JMa
xBA27D1eX/qLNpO4IYuSWnBzO+K8+p+UHQHxXExFapFzivM/ea4+W2qF/T+3iQHV
4y4GLP4cBpHiX3Nvi38s4lsOlJ/3Ftalqoe3iLZkKBmF1tOBnbNj3NaWrXjU56Un
0uaex9gYWMeFWVXdSyu2KgA/8J0jEdJVK6XCOC4+egE62jMDUmZ8C2DMUpAcvAKQ
4Kz6voN7SVsIt0voSabOqhNAR2L1+w==
=sn8e
-----END PGP SIGNATURE-----

--M/HnU77sO5JUw4/c--

