Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 294B958AB02
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 14:47:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381186.615758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwjW-0007PV-Fn; Fri, 05 Aug 2022 12:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381186.615758; Fri, 05 Aug 2022 12:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwjW-0007Ng-D4; Fri, 05 Aug 2022 12:47:18 +0000
Received: by outflank-mailman (input) for mailman id 381186;
 Fri, 05 Aug 2022 12:47:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gIk=YJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oJwjV-0007NS-26
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 12:47:17 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b94615c3-14bc-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 14:47:14 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 579D1320076F;
 Fri,  5 Aug 2022 08:47:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 05 Aug 2022 08:47:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Aug 2022 08:47:07 -0400 (EDT)
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
X-Inumbo-ID: b94615c3-14bc-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1659703628; x=
	1659790028; bh=HEIWCfVqrdmJkMn1gZ+2mN9K8TGGPSFErl/hguJ0iKg=; b=7
	QWZkGAcqYJpY6DejqedxoiFHTaZty0wUXoT7Dh14joobdIMY+S8a26xcSNRetDRi
	2lPCqK40UFLynYMmd+ca00MOe44g8mK0zPq7SkYO+fDus0woBwSA4aUXo9J9BvOD
	mekxNEb3MQAfNg83PaVkLzJOfT8TNHV5eu2HVWz2W6WUUm1EHfWvB3FRJ6PNGJU7
	2NAda5W2R/ScytfS2cl8AjK1F+rjsLmPnX/vS2/mhW1uoh3xFvMUBdmWobChzUds
	e/53nf/Hys3hAuuXlnTFpwLTKDiCENINaoJtTY41Y46PppiiPgikANxsgXHSgSYg
	7IcwunpxL9Q/pYT7u0v6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659703628; x=1659790028; bh=HEIWCfVqrdmJkMn1gZ+2mN9K8TGG
	PSFErl/hguJ0iKg=; b=q9Ps5ZSpf4mjgQevXGca7K+XDfWnNLYewo95voFT3C2Z
	VqlBkmBlg1UlFGZP9aVSvuipawLyYqn1UnoUlr3v0iS6AUTTPWsVf2Nt9jU6+dp3
	krpcBPnNqd2dtqoDNxjqDnbzu9rzBUvtet2iyMe+yJD4UxBObXzx2ig8y0/eWi24
	Ef/7RFPj1oIEs94x1VKsios3MVwcW0eFXgIVO0XuENWUXF35m5g8ggevgk2bhPVH
	aDJA/QRv+vk/NH70LZKwxlVKyYZ1KfHINlVzMyv/LdaizYdBjssbY42mDNZW7Xhz
	ahxJed0phcxSvYUWeu0c+XJyXUiHqwmyGKcGyPXZEw==
X-ME-Sender: <xms:TBHtYk5Uzf3xNXyWYf1s-g0HK5UHTlpMnGOSr5UkvqEF4fxQyuXp2g>
    <xme:TBHtYl4VCS75Y4Umq3JYxEz8UjbsT_ayZwZ62yXaLW2Lk-Stm3kXn0RBtUXwZ2Jo6
    2H4NYQHX5OIVw>
X-ME-Received: <xmr:TBHtYjflGPFEDyEHJrQQfbYu9_jTAVup5w-z5v8AyB70tbd-3zlJuF0ztLQefChjW2Vp664f-dzSh41KNtPMFPS9L0GMD8JQh4e3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefuddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:TBHtYpJuIEsfb4oVGaUxIWdBoLC_DVoh8sAMmENL7Zh-1hLa-f0vdg>
    <xmx:TBHtYoIEAucyzIIFAXX6FQKgHSGzOG2qmglU5Kcjpp9-3fX7kFe_lg>
    <xmx:TBHtYqxTp5DoOyN_lSrw80Zqwrpkl-6-2VMYs6Uyc8deeZFOA0ubQQ>
    <xmx:TBHtYtH-CmR3J_QSadoeuihF0aVfaCvo4gjWVcKCkadcvq9a4u01jQ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Aug 2022 14:47:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 10/10] driver/char: add RX support to the XHCI driver
Message-ID: <Yu0RSB0OwfoKX+Fp@mail-itl>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e273efdbf75cbc37b5c35798da7fde34877ac3b8.1658804819.git-series.marmarek@invisiblethingslab.com>
 <7d263ceb-3727-763b-0b9b-3b9ed82aa780@suse.com>
 <YuzpuUz5g+HtJdzy@mail-itl>
 <65f4ef5d-a174-2d23-3ed6-1c80e5f6244a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NcKBd7aDqpLIIHpe"
Content-Disposition: inline
In-Reply-To: <65f4ef5d-a174-2d23-3ed6-1c80e5f6244a@suse.com>


--NcKBd7aDqpLIIHpe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Aug 2022 14:47:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 10/10] driver/char: add RX support to the XHCI driver

On Fri, Aug 05, 2022 at 02:38:26PM +0200, Jan Beulich wrote:
> On 05.08.2022 11:58, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Aug 05, 2022 at 10:38:13AM +0200, Jan Beulich wrote:
> >> On 26.07.2022 05:23, Marek Marczykowski-G=C3=B3recki wrote:
> >>> @@ -454,6 +466,12 @@ static uint32_t xhci_trb_tfre_cc(const struct xh=
ci_trb *trb)
> >>>      return trb->status >> 24;
> >>>  }
> >>> =20
> >>> +/* Amount of data _not_ transferred */
> >>> +static uint32_t xhci_trb_tfre_len(const struct xhci_trb *trb)
> >>> +{
> >>> +    return trb->status & 0x1FFFF;
> >>> +}
> >>
> >> Same as xhci_trb_norm_len()?
> >=20
> > Yes, I was considering to use that, but technically those are different
> > packets, only incidentally using the same bits.
>=20
> I see. That's the problem with using literal numbers rather than #define-=
s.
> But for a driver like this I didn't want to be overly picky, and hence
> would have wanted to let you get away without introducing many more.

That's kind of the purpose of those helper functions - to extract
specific fields according to the xhci interface, one per function. An
alternative could be #define _instead of_ those functions, but I think
that would be worse.  What I mean, is the function name serves as
description of that those constants are about.

> >>> @@ -985,6 +1054,33 @@ static void dbc_flush(struct dbc *dbc, struct x=
hci_trb_ring *trb,
> >>>  }
> >>> =20
> >>>  /**
> >>> + * Ensure DbC has a pending transfer TRB to receive data into.
> >>> + *
> >>> + * @param dbc the dbc to flush
> >>> + * @param trb the ring for the TRBs to transfer
> >>> + * @param wrk the work ring to receive data into
> >>> + */
> >>> +static void dbc_enqueue_in(struct dbc *dbc, struct xhci_trb_ring *tr=
b,
> >>> +                           struct dbc_work_ring *wrk)
> >>
> >> I can't seem to be able to spot any use of this function - it being
> >> static, how do things build for you?
> >=20
> > It's in dbc_uart_poll().
>=20
> Oh, interesting. This then means that patch 1 on its own doesn't build.

Right, I need to move the call into this patch.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--NcKBd7aDqpLIIHpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLtEUgACgkQ24/THMrX
1yyE0Qf/WB9SGLejF1doTqJmdVoSqB1SlOyh+1pcyEIzMxgpSeriD12+JpKSbiI7
6zctZ/O2noiD+/lvVmbNOUeQV+HTwEAe4m/7H+oEBIMDicLVc6XxLhJcoTVaOlMJ
jQIL7ND6QqelDFQmbLBEDyTozittdkF88DCKO9dKuk1j4zVo1xilhU7ExT/GaguI
QUyPaRWrDiss2WXqX7H1e2MHr7GU5vQW5tMEcnC7cUQ7EzwpI8K4bzwEsm+vE0Zr
8OFQwvJ8xozyhKnxzS/4RsXvWIeE3fMkBtfNopT6zfYE3l7JwmHgFJxMetcPTwmq
5v+q3Jb8opTwGv48fENSVRSI0T1Q7Q==
=BsQf
-----END PGP SIGNATURE-----

--NcKBd7aDqpLIIHpe--

