Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B0A939001
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 15:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761959.1172033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtFQ-0001qD-0y; Mon, 22 Jul 2024 13:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761959.1172033; Mon, 22 Jul 2024 13:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtFP-0001np-Tg; Mon, 22 Jul 2024 13:38:39 +0000
Received: by outflank-mailman (input) for mailman id 761959;
 Mon, 22 Jul 2024 13:38:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIMA=OW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sVtFO-0001ne-Ag
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 13:38:38 +0000
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afb3ed3d-482f-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 15:38:33 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 2DED211400DE;
 Mon, 22 Jul 2024 09:38:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 22 Jul 2024 09:38:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jul 2024 09:38:28 -0400 (EDT)
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
X-Inumbo-ID: afb3ed3d-482f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721655511;
	 x=1721741911; bh=jgQJxlvXDuS5mZp0nJOMfiNWvQE2RX0V+FJhfKM1XPg=; b=
	dzgoHv9zimFSlFsyAM4rGkfOFRKXi1Xnauko+2F1Zjfufm+uLQklUIvJkU+oopfT
	nWoPXucUehBFbDQ3w3F9a5I3jBEtC+C7hxlIhIAWShOVXj7+RDzALRryYUN5BWnw
	iKnMtJ+cXKihh8KsGByF8yrP9fZAR7URC5WqnyRfG0agIkCpNwwgqhUwTX8bu4Ct
	7Q8UhGEMAZJhi4M8n9nKIJ9ypNh+8Hs0qbdmISgxOpQNQFXEKoNiAYGZNgdPiAZV
	y1cs80f+3OzHGMoQi5nI8sz0hylVyxTBsI0ZdmuPTCPvOucBb7+GOJuLBBqFKY/y
	TcB69IpmloicT6vtWeXC+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721655511; x=1721741911; bh=jgQJxlvXDuS5mZp0nJOMfiNWvQE2
	RX0V+FJhfKM1XPg=; b=id+JScuTnwNvyaphpar2XiaF7qhLw/MOJI+WsrF0ymNy
	pQnXqK2KEJw7gM37BEpXV8kpN7Pub0ZCAxPyb6lxRu3QTmkWAFsrS6hfLwG3+w/Y
	AgRvugI/+aQtNKGXB7KC3oxf3eg0+yguu/oUSJUCW22+uVdcLa9SkyZluGy++qfo
	JUIRcTG6hxLCvBn0uH06Q8YFLBFQHsgPAZExHDZzmnqdoMONdvEZupc9BvE6MYj6
	tZ8OXCFIDMmtSO/u8FH1j13CzN2R4T+bGzOIl7Zaeiq0NM1XQV5mq+APSn1Nljos
	T+UXIP/IolCUBOdL2Zu4VCayoXHq/M82PyQJC9RsuQ==
X-ME-Sender: <xms:1mCeZp6tJTVLoehaDuyeRrHH5eFT3T-hg2QFw5smVqt76u8ZZHzmMA>
    <xme:1mCeZm78pNSDaC-1R_89hcmFk1Z64bdtx9WkoTPGdiAjB_nr8cwQM1j51VVKn-cDK
    0AdQu73aDfyog>
X-ME-Received: <xmr:1mCeZgen0tWU_rexAgCYKmCNacFRMX7yMqVNghoqjWKt0VZbTHTjV9PEZapcIV_eTG3ySgeCpVkmMda7HGn_l430VzK_ISu7Zw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheejgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:1mCeZiLUGJ7ViW-9dwU_WN6WDCXpLkkNO7aYULKrZUyeEgc5fkBw6A>
    <xmx:1mCeZtKixOY3kmm1mIkmRUJzrVqF8o6naC7o-n_f9C5U6LMxg2ioCw>
    <xmx:1mCeZrybgKJ4shOO8PXiM4if11hhpTGOdn-zYL0rASnJzubiW_qrGA>
    <xmx:1mCeZpLImsiVUWw_zN7aOkM5l6ti91KRT8jXWWqrUUWUOA46rlIvDw>
    <xmx:12CeZt08Iv_2258xZhpNM34BGxiVC7j2XGtTS5X0Q6DB9U4vDpEthXur>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 22 Jul 2024 15:38:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/3] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <Zp5g0hflalnM1bfa@mail-itl>
References: <cover.8c9972382c46fce22682bcec2ee28fe2501dd18f.1721356393.git-series.marmarek@invisiblethingslab.com>
 <f0b36fb78b87d2f06c0d33da28ba16cd1d2fa8b9.1721356393.git-series.marmarek@invisiblethingslab.com>
 <dce600a3-4b1c-47e9-b336-42ca32e309c5@suse.com>
 <Zp5SQlB_QR47NmtY@mail-itl>
 <767482e3-3132-4a7f-81ba-6ce0ebea675e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/eDYpcvw0G/vQAOi"
Content-Disposition: inline
In-Reply-To: <767482e3-3132-4a7f-81ba-6ce0ebea675e@suse.com>


--/eDYpcvw0G/vQAOi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jul 2024 15:38:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/3] x86/mm: add API for marking only part of a MMIO
 page read only

On Mon, Jul 22, 2024 at 03:01:45PM +0200, Jan Beulich wrote:
> On 22.07.2024 14:36, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Jul 22, 2024 at 02:09:15PM +0200, Jan Beulich wrote:
> >> On 19.07.2024 04:33, Marek Marczykowski-G=C3=B3recki wrote:
> >>> +int __init subpage_mmio_ro_add(
> >>> +    paddr_t start,
> >>> +    size_t size)
> >>> +{
> >>> +    mfn_t mfn_start =3D maddr_to_mfn(start);
> >>> +    paddr_t end =3D start + size - 1;
> >>> +    mfn_t mfn_end =3D maddr_to_mfn(end);
> >>> +    unsigned int offset_end =3D 0;
> >>> +    int rc;
> >>> +    bool subpage_start, subpage_end;
> >>> +
> >>> +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
> >>> +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
> >>> +    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
> >>> +        return -EINVAL;
> >>
> >> I think I had asked before: Why is misaligned size something that want=
s a
> >> release build fallback to the assertion, but not misaligned start?
> >=20
> > Misaligned start will lead to protecting larger area, not smaller, so it
> > is not unsafe thing to do. But I can also make it return an error, it
> > shouldn't happen after all.
>=20
> Well, I wouldn't mind if you kept what you have, just with a (brief) comm=
ent
> making clear why there is a difference in treatment. After all you could
> treat mis-aligned size similarly, making the protected area larger, too.

Ok.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/eDYpcvw0G/vQAOi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmaeYNIACgkQ24/THMrX
1yxAIgf8Da4R5SRZ7CHY7lPa9AeKiWCN4OzpejYHqYV0wqFSDcefTVlpSusAB0uo
CiNuUWJPDGmrwOdGZtqZo+SeoK3iHf9CCGIFedwowCkNiqt3f53kUrx/g2lERMfJ
bTAhoMFmcShOAbqWdawR/NXFPtWSyAzJ5+2S7sjUjy4CS5/kuD9Ek0k07Pfuhm5C
JAn5sVWaEH/3SyrfEwpyrSbKt8px5wfr0tf39A7B6xXRaP+lXf/QbOeRuPJlJMNq
ZoSttMDi2TYoF+DmFLcg4E0tnbEWYcYP/vfnElnO7mCWFlSHUn7UiGAgrIdpbcES
n/J/bzWYO1Rj3jGzwYfAQDe1XosqCg==
=2sNg
-----END PGP SIGNATURE-----

--/eDYpcvw0G/vQAOi--

