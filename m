Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C239CB10A8
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 21:46:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182178.1505097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT4aB-00042u-Ef; Tue, 09 Dec 2025 20:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182178.1505097; Tue, 09 Dec 2025 20:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT4aB-00040a-Aq; Tue, 09 Dec 2025 20:45:15 +0000
Received: by outflank-mailman (input) for mailman id 1182178;
 Tue, 09 Dec 2025 20:45:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=omc8=6P=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vT4a9-00040S-2j
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 20:45:13 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2eaca66-d53f-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 21:45:09 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id B20727A0142;
 Tue,  9 Dec 2025 15:45:07 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Tue, 09 Dec 2025 15:45:07 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Dec 2025 15:45:05 -0500 (EST)
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
X-Inumbo-ID: f2eaca66-d53f-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1765313107;
	 x=1765399507; bh=0N4XCRLiGS86gU5LpO1DbjTF8CqEyMR4G+09xB38BqI=; b=
	wVjVycSXQydYE5trke5qHvZH1R1a6ZPvH8/l/a82l5odiqbYLIqJYcvVFni3Dl1s
	xDO41tdL39XZFam2AOeZ59bNgdSbNW/Gvm5gyPzK8dXAPAm3J0RZWVdRnyfiDVb/
	WZMOLtlc7MjEN1fhl8QcXLiZ67ZgEjgyn3tI3p8GLEdUi+7hra8t/WX0NMhuX0bq
	PjO0v1jzlK2kmi/ICFp2+Y0Vv2dZ2Ap2VsdfyQiuffAYd7D/E1aFH4S9ke3ZHn+9
	praN6PHxozYBxNqSVdbvgztLbrPobP+3sGNMQkOVAIIY83k6DPt/vAeKoSluphuz
	q5k3FxUAHpkB8kwS3K4Qvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765313107; x=1765399507; bh=0N4XCRLiGS86gU5LpO1DbjTF8CqEyMR4G+0
	9xB38BqI=; b=tBXUjlXUR/oAqUnKDuKGoSSArXXMx8lrv16r65zqnmiKomCfV5F
	fW7QFP9Zeu9CTUHjvYR3HOhGJauR1SQrQmagInyADo1tuEgWDr2AdzBcfqT3e73G
	PzuQG9/ikL4LR+VE3RQxJc2NssnaUWtrJSpxgb1RQ2WocbujUCSYyfRN/0FnWYaN
	hUJ+nQ0O4bpzWMiJ/kPD7eZitkHme05nlXdUe/47quPgokojXuNJt1UQxlUPCJW7
	AqCKDO3NWdLhWDiEKSTvUijnb+AE6VnFU4mp0fBdf3MiaVWhPi4zkJyGlBo13617
	f/CIkge2Dn91yR3lXhOVUDWsojBwtAtIqSw==
X-ME-Sender: <xms:Uoo4acT76c76nGTgjloRBRS9DDWwHRBAtpDNL0xNb_J-QyLbpYhwJA>
    <xme:Uoo4ac1L95Km1XtGWi3_vVsZSw5XWOrzUmvp8caK22EFr28e5yQ8nWKuotF__WyLg
    HGg0jA_k85iepGP3kGEF3skaBln5oCrkFh91UMfdJUxPTD3zA>
X-ME-Received: <xmr:Uoo4aUdMf8SxSxBUTHwz_lADaFul0pX2DYzDX0eDFsYnKVEE6o_H_Tuk3qYAqfF6z6Iw9TRty05YWVUNuwkXVO2CXNkrU-vxcNY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedutddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghrihgrughnvgesrghrihgrughnvgdr
    shhprggtvgdprhgtphhtthhopehvlehfsheslhhishhtshdrlhhinhhugidruggvvhdprh
    gtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhr
    ghdprhgtphhtthhopegrshhmrgguvghushestghouggvfihrvggtkhdrohhrghdprhgtph
    htthhopehlihhnuhigpghoshhssegtrhhuuggvsgihthgvrdgtohhmpdhrtghpthhtohep
    lhhutghhohesihhonhhkohhvrdhnvghtpdhrtghpthhtohepvghrihgtvhhhsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthht
    ohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Uoo4acO7McXj0OqI6Rw8pxTptYHTFnUYzD5tn684xs12Tr1NftuTPQ>
    <xmx:Uoo4aQWNYmqn6IMIMSiB9rW-E2T6gPw5npbXOHqB8VIFvEn-vcRibQ>
    <xmx:Uoo4acyZtu-ZwEPnR5PTpomsZflRNEUoUPU9b8mYcItKWunRV-yR6A>
    <xmx:Uoo4af-Fd1jyi5QPX4VIAJHkKdI_C9jgj4A-tzUg7D-qpcN1lynqsg>
    <xmx:U4o4aXvQuSzCvlM4BBL-UltJnLcgZs7RrY-b1abd7zCJPE5-XAmC2Opm>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 9 Dec 2025 21:45:03 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ariadne Conill <ariadne@ariadne.space>
Cc: v9fs@lists.linux.dev, xen-devel@lists.xenproject.org,
	asmadeus@codewreck.org, linux_oss@crudebyte.com, lucho@ionkov.net,
	ericvh@kernel.org, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alex Zenla <alex@edera.dev>
Subject: Re: [PATCH] 9p/xen: mark 9p transport device as closing when
 removing it
Message-ID: <aTiKT9qOS-cQO_L5@mail-itl>
References: <20251208195155.27473-1-ariadne@ariadne.space>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MSfjrwLz2Q9UiVY0"
Content-Disposition: inline
In-Reply-To: <20251208195155.27473-1-ariadne@ariadne.space>


--MSfjrwLz2Q9UiVY0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 9 Dec 2025 21:45:03 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ariadne Conill <ariadne@ariadne.space>
Cc: v9fs@lists.linux.dev, xen-devel@lists.xenproject.org,
	asmadeus@codewreck.org, linux_oss@crudebyte.com, lucho@ionkov.net,
	ericvh@kernel.org, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alex Zenla <alex@edera.dev>
Subject: Re: [PATCH] 9p/xen: mark 9p transport device as closing when
 removing it

On Mon, Dec 08, 2025 at 11:51:55AM -0800, Ariadne Conill wrote:
> We need to do this so that we can signal to the other end that the
> device is being removed, so that it will release its claim on the
> underlying memory allocation.  Otherwise releasing the grant-table
> entries is deferred resulting in a kernel oops since the pages have
> already been freed.
>=20
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Fixes: 71ebd71921e45 ("xen/9pfs: connect to the backend")
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> Signed-off-by: Alex Zenla <alex@edera.dev>
> ---
>  net/9p/trans_xen.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
> index b9ff69c7522a..cde283c42dc6 100644
> --- a/net/9p/trans_xen.c
> +++ b/net/9p/trans_xen.c
> @@ -312,6 +312,7 @@ static void xen_9pfs_front_remove(struct xenbus_devic=
e *dev)
>  {
>  	struct xen_9pfs_front_priv *priv =3D dev_get_drvdata(&dev->dev);
> =20
> +	xenbus_switch_state(dev, XenbusStateClosing);

I think you need to wait for the backend to acknowledge it by switching
its state, before continuing. See for example
xennet_remove()->xennet_bus_close() in drivers/net/xen-netfront.c.

>  	dev_set_drvdata(&dev->dev, NULL);
>  	xen_9pfs_front_free(priv);
>  }
> --=20
> 2.52.0
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--MSfjrwLz2Q9UiVY0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmk4ik8ACgkQ24/THMrX
1yxxdwf9EtdVm4vHKrR6Wilq1Fv0h4VXkAx3qT3t0DLPbOJ19GflMTaV5cVPgUQA
OzoCxGYOPjZHIDSkUDjoPrmWWs1al22S8jwB5JtD6ep/i5XX0tWY06SeuwEouXvt
DxFnZDg9DD7LzMd5MC4DDjv1y1TuR7tP7QYjKYrX6sFxRn0lQqEcS7YLZRdDRGXk
LZtgL9hb4LjG5EChL+i9ipHk2FhXbj8McsnwbhLQDgSoIM7BFUQ3m2Qk8gDKAagy
fYVXlkhwy+quQFJoirM7qKsuUkkMPTbdxtmbJTSRTf7VM+DxK57KMghL8Ocsmmn2
jBYyH9svOnzBj/ZJL4iIIAfnjxndwg==
=VcHR
-----END PGP SIGNATURE-----

--MSfjrwLz2Q9UiVY0--

