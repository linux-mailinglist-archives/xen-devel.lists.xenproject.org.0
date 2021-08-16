Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FAB3EE07A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 01:34:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167531.305824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFm7K-0006hC-AA; Mon, 16 Aug 2021 23:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167531.305824; Mon, 16 Aug 2021 23:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFm7K-0006f4-6z; Mon, 16 Aug 2021 23:34:06 +0000
Received: by outflank-mailman (input) for mailman id 167531;
 Mon, 16 Aug 2021 23:34:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uRT6=NH=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mFm7I-0006ey-8Q
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 23:34:04 +0000
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44d45e68-3791-43b4-8837-8fab1347dda9;
 Mon, 16 Aug 2021 23:34:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B1885C0153;
 Mon, 16 Aug 2021 19:34:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 16 Aug 2021 19:34:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Aug 2021 19:34:00 -0400 (EDT)
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
X-Inumbo-ID: 44d45e68-3791-43b4-8837-8fab1347dda9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fnad3z
	RAd6NsacMqEepijg8TAb8JEH+fhFX68RPwJ3o=; b=WJu5r26jh5iw/CRQ+DHZVH
	eO3bi+/LNPdOlPwmbBV0Bsc4ormybkzbSrawUASu4Ll2m4C72Wi6rfTjJ7ZczCFa
	ezYcDqr/4cfxNLwks3RCPT00S/W5HOd1+8hmPgcGCDUTyIV/WICeFgbmR9S0L+kt
	+fi/daSOr27DR63P5ZZQZj1aseJavAALm8cxSGKslEQnwf21mgvwdR4ut320BInn
	3yMKChJN6FR/Qs6O1PT8pALBFSC3fKiPAllyviFEao8SGGcVfZoq01uvmFv5/BMq
	9iD7/mabSD9exjuPy/YqTO+6rcOqooHhVVkReDb5p0x1kmbbRCjhdfN1QaovyqAg
	==
X-ME-Sender: <xms:6fUaYW1gJkCGqaqEuAm9_YN5jWjCsMJENJn37lDm39lMoIaP1VO-4A>
    <xme:6fUaYZEYa33bC_n3yGaoKIDffZ52guL8vuz5kmJ2-WxMokns-gDq8e9pMycE3-ZrQ
    c23Rso39mB7_w>
X-ME-Received: <xmr:6fUaYe4TuPnLmYZRzV-10A2AmypZ2l_3rXEzaJYSgg5kyWMZELRckWf5w7ALQ0oslglIwyGhUErSb8uk1evHiU0K5vGc9Syk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledvgddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteekleeh
    heeiudejkeelvddtleehgffgueekkeekfeehtdevudfgtdelueejieeunecuffhomhgrih
    hnpehmrgiglhhinhgvrghrrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomh
X-ME-Proxy: <xmx:6fUaYX28k73U6mtSdJcnu7huAb_Egd-M0Wh3gZYDuk2yQYIa9SEUfQ>
    <xmx:6fUaYZFTv9hje0AZMSbUpr1JeHnJHitcUkKhBkwfvUc8i2Eh0uQr1w>
    <xmx:6fUaYQ93HXdy69f-Hv3nMUeMLXFI-HJCbPfW4Y1fcFi8qgs9Z26l8A>
    <xmx:6vUaYSMVXN_6unH5yLtlye6B_z8P6E87F6UV13YyaIGdhSrrCoItvA>
Date: Tue, 17 Aug 2021 01:33:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] ns16550: add Exar dual PCIe UART card support
Message-ID: <YRr15Z8CMur2QcNC@mail-itl>
References: <20210813183139.391546-1-marmarek@invisiblethingslab.com>
 <20210813183139.391546-2-marmarek@invisiblethingslab.com>
 <0326eebe-2ec8-1c2d-bf2c-8cb4c16312af@suse.com>
 <YRokMeJ2bMLAZFD4@mail-itl>
 <7e88f6f7-afd6-d12c-8a14-a5c3853d0a90@suse.com>
 <YRo9LrkAhkDSF1iq@mail-itl>
 <33258024-41f5-5a39-3549-df424f995513@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nAjWm3A3K1Dqo7w8"
Content-Disposition: inline
In-Reply-To: <33258024-41f5-5a39-3549-df424f995513@suse.com>


--nAjWm3A3K1Dqo7w8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Aug 2021 01:33:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] ns16550: add Exar dual PCIe UART card support

On Mon, Aug 16, 2021 at 02:18:33PM +0200, Jan Beulich wrote:
> On 16.08.2021 12:25, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Aug 16, 2021 at 11:18:31AM +0200, Jan Beulich wrote:
> >> Hard to tell without knowing whether the extra reg - as per the spec -
> >> is connected to any of these. Is the spec you have publicly available?
> >=20
> > Yes, here: https://www.maxlinear.com/document/index?id=3D1585&languagei=
d=3D1033&type=3DDatasheet&partnumber=3DXR17V352&filename=3DXR17V352.pdf&par=
t=3DXR17V352
> > (and few more links on https://www.maxlinear.com/product/interface/uart=
s/pcie-uarts/xr17v352, but mostly the above PDF)
>=20
> Ah yes, thanks.
>=20
> > Hmm, maybe I should add the link to the commit message?
>=20
> Wouldn't hurt; question is how likely it is for the link to become stale
> in the next couple of years.

No idea, but the latter URL looks nicer - likely manually chosen
instead of purely generated by some CMS, and as such, there is IMO
better chance for it to remain alive.

> > Other bits are defined and are things IMO we want to keep disabled. See=
 top
> > of the page 40 in the PDF.
>=20
> To be honest, in particular for the low 4 bits I'm not sure we should
> alter them if they turn out non-zero (e.g. due to firmware or boot
> loader action).

Given how much time I spent to find out the not working console was
because of failure to disable flow control, I tend to disagree...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--nAjWm3A3K1Dqo7w8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEa9eQACgkQ24/THMrX
1yzpAAgAhHzkqXK0JSvxyprjo8NQboBHtwX9q/JbGW6bbtxatu7YMaQZHYTQJ0la
1grb2NlVmgY8nfv0w2Ju8kWfV0s3ktWziQ05MndSPo0F9kxto8f7gH2QoHp7F5B2
wCMRdGcjBhcgdK6pUyZ70msrJ8T44bJ4al+rxsE1D0ftgKE3ZS+K5SvffUhMjNMO
CwuV0pcJeVZKjO45i3G0K+nNQge4NMly2+VvFEzRerTIsnsmK5xMGwqcGYzjysmV
pIDvhX68rSH447FT3kVpVJRJBAFkmWeucLO/lIjnkVyfBZOEc9JSuqQkVjKU3ZiW
z4NA5HzL6QmcVzTgObkvN+QydoQe9w==
=slBo
-----END PGP SIGNATURE-----

--nAjWm3A3K1Dqo7w8--

