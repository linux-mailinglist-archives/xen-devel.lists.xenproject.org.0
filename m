Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895AC85AF9C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 00:11:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683142.1062502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcCnE-0005HV-FX; Mon, 19 Feb 2024 23:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683142.1062502; Mon, 19 Feb 2024 23:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcCnE-0005F5-Cm; Mon, 19 Feb 2024 23:11:24 +0000
Received: by outflank-mailman (input) for mailman id 683142;
 Mon, 19 Feb 2024 23:11:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP9f=J4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rcCnD-0005Ex-6l
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 23:11:23 +0000
Received: from wfout8-smtp.messagingengine.com
 (wfout8-smtp.messagingengine.com [64.147.123.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 309e029e-cf7c-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 00:11:20 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.west.internal (Postfix) with ESMTP id B166D1C00095;
 Mon, 19 Feb 2024 18:11:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 19 Feb 2024 18:11:18 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Feb 2024 18:11:15 -0500 (EST)
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
X-Inumbo-ID: 309e029e-cf7c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1708384277;
	 x=1708470677; bh=Thq8OY4uzS1G1pUBHrfS8cOVBxJ5ohRbMVTjwhO7kj4=; b=
	Qlitb0wwu7LoRtajcaY3iLHuZvf6SsJpB8EXsd474NXjIWEDzER8hLyXdg3d/y6r
	tQ51yCgP7kw3CpQ5sYoydmCyN1juG02IZ5cFoBusNk6XTUK+onR2HTikL2H6dTjP
	Y4VnWPINwinpqZ3Y6kQsh85H+i5UBg0WBlpEE0zntIV12oOfDC9Qeg7jdhHO5ttn
	h2nQOu822yfptbbVTZE+j4mXwpLhdNFEU2eGuttA0w5KjYMriKhayQIQivIaUzK3
	/OrymSAp7DENI2HUgu3euDEENo14OAwBr5rR2OkLzKHDpE8Xx4KIg7WHl5O4UZ5k
	IDb1B8WfMJdM7hD5chCQqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1708384277; x=1708470677; bh=Thq8OY4uzS1G1pUBHrfS8cOVBxJ5
	ohRbMVTjwhO7kj4=; b=YD9cq3zj8CCUWDO4b49FeYPn9XWumXQlHYiulxnw6CgG
	DjLjvU4XDzyOKO1CKvFVPzB6dxaWVBAeGsmJQjRQlez9VFxb7SX8y7iOb9WraCwy
	rj7V1yWrtItzemdO2aG7TXoDr9NHKxTYFO3Mli/39pwWLjpYb6cOqYkCAJXm36wp
	tmjphinEbH5OKl3Z6HrBlQKeHOkfFbm1BKgJ5XXLZN7/1DmMVnhPZ6x4/F7vZf2B
	IvXS4AAz3Nau8RTGNr5+W+LYNDCqP7blLKTSmkubs1eDzK9NvG3oNAfmnp5sDecr
	IMFuYJWM009jgb4mShURqWjDCn96wriQpXfYQbTbQw==
X-ME-Sender: <xms:FeDTZdqfb3IIWs4Nx2IX0vPVnopERgspMQOqV8rHTcLb-7WYXuVelg>
    <xme:FeDTZfoHE7R5aQ2V0B2aGBa4HQyY9H39xIrh-byLNOsNJnWc7cDum8ATGRkSl03fK
    7vgsXHa8rze_w>
X-ME-Received: <xmr:FeDTZaNZHePu4tjjEYxDGdpCpMf5AWe0EXTtw16fO1ZuflMD7SSYWhyjF9OzYgRPPa_e_rG_dxgZxV6GX57ibq3MkLdQZwth8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelgddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:FeDTZY4IL1MmpX3TibwKOwrv4pO5YvGTfpFf3WQTxfmTx0PJdpXxlA>
    <xmx:FeDTZc784e-wPr2Bio4sO3KtZZcW7rdUUXyq059FC8hpQFvRsiZ2gQ>
    <xmx:FeDTZQhUKF-0G0uCcphsagau6mTa3wzN2gCG-_vd2rRmhupBMErYMw>
    <xmx:FeDTZZuvzMeR9AxW8wIVm6LCsB-SZaOFpPXEgmXu3IRzm568LVj0akPhPgc>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 20 Feb 2024 00:11:13 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550: add Asix AX99100 serial card
Message-ID: <ZdPgEjt9qg8UMx_Q@mail-itl>
References: <20240218013431.274451-1-marmarek@invisiblethingslab.com>
 <7b60cf83-4d08-46ef-a937-911e42fd9e5d@suse.com>
 <ZdM30PNnmlkwW2ZG@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="muf7oRsE++MJz+xe"
Content-Disposition: inline
In-Reply-To: <ZdM30PNnmlkwW2ZG@mail-itl>


--muf7oRsE++MJz+xe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Feb 2024 00:11:13 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550: add Asix AX99100 serial card

On Mon, Feb 19, 2024 at 12:13:18PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, Feb 19, 2024 at 09:57:49AM +0100, Jan Beulich wrote:
> > On 18.02.2024 02:34, Marek Marczykowski-G=C3=B3recki wrote:
> > > @@ -1170,6 +1177,11 @@ static const struct ns16550_config __initconst=
 uart_config[] =3D
> > >          .dev_id =3D 0x7adc,
> > >          .param =3D param_intel_lpss
> > >      },
> > > +    {
> > > +        .vendor_id =3D PCI_VENDOR_ID_ASIX,
> > > +        .dev_id =3D 9100,
> >=20
> > As per Linux this is 0x9100.
>=20
> Right... but then, maybe the patch isn't needed at all, as it does work
> for me. Maybe what's needed instead is some other patch already in
> staging. Initial attempt that did not work was with 4.17.something.
> I guess setting the fifo size isn't that important.

Indeed, the patch is not needed after all, plain "master" from today
works.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--muf7oRsE++MJz+xe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXT4BEACgkQ24/THMrX
1yzDmwf+LOad0J29GJEzHfT6KwDPabxwhfRJKcUREDQ8QJ1F3wJRseDmZj+R58jp
zfQnUC6DtW6d7XWOF1EyHeFN7avYo/xCbxoZBBAJp6MOHZdICTKGnZAgB5dW5K/l
/B6A7whFMYvrGHuc1zy++7kEGkwFBLpmXjk48U9ots3BocF8tDiUXsnwK8Rj19Y9
rjeFEsuL2saNGwgjx0DqpIuVHdpnMtlvTZTxQqHiRmCSyZJ4/OqiXzjL7ryEe8J+
LOrnFDi4MYTV3Qhwt3ibBXEoBC1mu1TjcImkmykPrQ/eYx6cruba0SMpDfQ/PX15
ce4m9BY+xSpQwNkooarbyMoJHNf15A==
=IBoA
-----END PGP SIGNATURE-----

--muf7oRsE++MJz+xe--

