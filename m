Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DAC8796D2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 15:49:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691892.1078434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3RJ-0005mr-BP; Tue, 12 Mar 2024 14:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691892.1078434; Tue, 12 Mar 2024 14:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3RJ-0005ky-7e; Tue, 12 Mar 2024 14:49:13 +0000
Received: by outflank-mailman (input) for mailman id 691892;
 Tue, 12 Mar 2024 14:49:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jUN=KS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rk3RH-0005kp-Av
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 14:49:11 +0000
Received: from wfout2-smtp.messagingengine.com
 (wfout2-smtp.messagingengine.com [64.147.123.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae08bf3f-e07f-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 15:49:09 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.west.internal (Postfix) with ESMTP id 343261C000BB;
 Tue, 12 Mar 2024 10:49:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 12 Mar 2024 10:49:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Mar 2024 10:49:04 -0400 (EDT)
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
X-Inumbo-ID: ae08bf3f-e07f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710254945;
	 x=1710341345; bh=T2Q+WJNq02k8Pv37K1fkr0orQ6W/GMwWl8daG0xqNw8=; b=
	fqHiRT1T1moNt8HzPm5woPiHmtgdfSwlVf3ubddIu7Or98nHRyjVdOUgVk/BJoG8
	aYZgBgerqrmh0ikPheM/lpZT4kzxWSZeos6dI2X8V7/pZgsYQMNgyfu6kLZxXVUs
	zBy0X/Yib6W/87xYMZFXx4E8RfiriaZlAOgIlKQ17S0R3ZxizNIDNWSOUuqzlgRf
	mgLPnks3JMEP+REHf++7feFG4xMHhx6LZIhtArZgyIRQ8+7UXdux0ctHY4ctjNCZ
	aQolwSluH4cnv7C/D0SF9BT1QzS9k3PQ/EAJ//icLXDEcCNNEI3V8ZzYGi4sKOCK
	gD9Bcok8zDaOyKl7lfyUpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710254945; x=1710341345; bh=T2Q+WJNq02k8Pv37K1fkr0orQ6W/
	GMwWl8daG0xqNw8=; b=BduQHtMVqr5fHWrpefVzU34cYyn11fLtJjNQvbS6n+Lq
	/OeGekwTuM7NBJlgCDP5B540HDg3rYEvkw5cqAifFmknmSgGWRWsIw9yRoU2XHfI
	CxWUSlS26crrlJz1jOK7eSzfn9iDDj6wE9ty+gm3FrQwl1NGqoo15CmthRSkunTh
	hShn4nl8CwwqIXpAH/hq9yo4RgaO673lLpv2ltA8TBDqFYHNOS3+rjneQAE7wxZ9
	NRDLx5Tg5IBbuPC9qwWp7jhOyfmxAsOrc7Sw2wDw7nG5nSCFzuUBPk2qiJFbdgCE
	LWEO8r2uYkOLpk+d5W4MAkhqfCHf0YVd8TslV/E4dQ==
X-ME-Sender: <xms:YWvwZZQe5ePJdO2Y0QH1ydlKjDaVTrauddNRjY-w0GRgXuEge4ox9g>
    <xme:YWvwZSwZbbIhaJtMgjvVUua6rDEP76EuWGux8VOtNPtRLQmDY9Gv6ozcIYlKLO74h
    d4vrzd_SEvTzA>
X-ME-Received: <xmr:YWvwZe2XAVGvXc97VD7lmzwy15H5sznR1YmrSn14KrVwX4MZT12zn47wOmVSW2JL52Iv4CZOUkvI4RYBxj-Lsyf_aX63aLySYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdeikecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:YWvwZRAKjMWEvlfZUIe8kxkvzH-NENuiCcVvqIVq3nRzyteuK9rvyw>
    <xmx:YWvwZShtrlBBBFZ77HxAJRRsY3JxEtFlP87tmHcazv5eR7t5zdNNzg>
    <xmx:YWvwZVoGHeI-P-CHiis1W2Q5b-V_hS_o56ufhCt-HUmptbL0U6R1Uw>
    <xmx:YWvwZdghprNswQAGTimE7cnoXRABOokPzxfIooJGMZOjw9gJrjNYHg>
    <xmx:YWvwZbVVqoOow3V_sQtzupmehwjK5EjetAN2YEisIs7wttNH6Q5jiZ6PIMk>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 12 Mar 2024 15:49:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] drivers/char: mark XHCI DMA buffers reserved in memory
 map
Message-ID: <ZfBrXqn_Sr_g4Hnr@mail-itl>
References: <20240311203431.342530-1-marmarek@invisiblethingslab.com>
 <ZfAtahcXWGqckQFW@macbook>
 <6a80ceb6-cc2a-4d8f-9a66-70063923b0ea@suse.com>
 <ZfBlklSndB3djVJ2@mail-itl>
 <6286d582-ef92-47c3-8bb1-b8f2d3270a4f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PnjxCYIQ+rRJIJpx"
Content-Disposition: inline
In-Reply-To: <6286d582-ef92-47c3-8bb1-b8f2d3270a4f@suse.com>


--PnjxCYIQ+rRJIJpx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Mar 2024 15:49:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] drivers/char: mark XHCI DMA buffers reserved in memory
 map

On Tue, Mar 12, 2024 at 03:37:15PM +0100, Jan Beulich wrote:
> On 12.03.2024 15:24, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Mar 12, 2024 at 11:53:46AM +0100, Jan Beulich wrote:
> >> On 12.03.2024 11:24, Roger Pau Monn=C3=A9 wrote:
> >>>> --- a/xen/arch/x86/setup.c
> >>>> +++ b/xen/arch/x86/setup.c
> >>>> @@ -1806,6 +1806,9 @@ void asmlinkage __init noreturn __start_xen(un=
signed long mbi_p)
> >>>>      mmio_ro_ranges =3D rangeset_new(NULL, "r/o mmio ranges",
> >>>>                                    RANGESETF_prettyprint_hex);
> >>>> =20
> >>>> +    /* Needs to happen after E820 processing but before IOMMU init =
*/
> >>>> +    xhci_dbc_uart_reserve_ram();
> >>>
> >>> Overall it might be better if some generic solution for all users of
> >>> iommu_add_extra_reserved_device_memory() could be implemented,
> >>
> >> +1
> >>
> >>> but I'm
> >>> unsure whether the intention is for the interface to always be used
> >>> against RAM.
> >>
> >> I think we can work from that assumption for now.
> >=20
> > One more question - what should be the error handling in this case?
>=20
> My first reaction here is - please first propose something that's
> sensible from your perspective, and then we can go from there. That's
> generally easier that discussion without seeing involved code.
> However, ...
>=20
> > At
> > this stage, if reserving fails, I can still skip giving this range to
> > the IOMMU driver, which (most likely) will result in IOMMU faults and
> > in-operational device (xhci console). Since I don't know (theoretically)
> > what driver requested the range, the error message can only contain an
> > address and device, so will be a bit less actionable for the user
> > (although it should be quite easy to notice the BDF being the XHCI one).
> >=20
> > Panic surely is safer option, but less user friendly, especially since
> > (due to the above) I cannot give explicit hint to disable XHCI console.
>=20
> ... reading this I was meaning to ...
>=20
> > And kinda independently - I'm tempted to add another field to `struct
> > extra_reserved_range` (and an argument to
> > `iommu_add_extra_reserved_device_memory()`) - textual description, for
> > the error reporting purpose.
>=20
> ... suggest minimally this. We may want to go farther, though: The party
> registering the range could also supply a callback, to be invoked in
> case registration fails. That callback could then undo whatever is
> necessary in order to not use the memory range in question.
>=20
> That said - isn't all of this over-engineering, as the allocated memory
> range must have come from a valid RAM region? In which case a simple
> BUG_ON() may be all that's needed (and will never trigger in practice,
> unless we truly screwed up somewhere)?

In this case (with a single use of
iommu_add_extra_reserved_device_memory()), it will be valid RAM. But
reserving may fail for other reasons too, for example overflow of the
E820 map.

Undoing things certainly is possible, but quite complicated (none of the
involved serial console APIs support disabling/unregistering a console).
Given the simplicity of the workaround user can do (not enabling xhci
console), I don't think it's worth going this route.

Anyway, I'll post v2 with some version of the above and we can continue
discussion there.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--PnjxCYIQ+rRJIJpx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXwa14ACgkQ24/THMrX
1yyqAgf/R53YqHxmnYPijYE6YRdufBlcewDX5yJybHcZ2BMxy2hDSgLhngVQp1hS
kBDJBYKPXPzr+F9DbRQq4ZHU1MdG3G80j0LS5niGiVYlpMhfE9dBJvg1QhC3zeTF
Yy8QBH/FAtICCEE13X1dFIo+VFC5UFiTOQF8GsWSsFHcLpCdPIOaDTyfr8Kr0J3o
B4Ap/W9Cz5FrWBDchKkl85DetONvxN7k0z+NpbkDNhqXZvOLpYSHiXB8JRcx4MEg
yjCAHpJiAUbO5TYEtun2rWypfifAp3zJYCcf/LA19BsAvPaCb2E//C8ioOPVAfHp
3hrHcOPRF9ewFdzg91b0XcLZP9nOVQ==
=wHrp
-----END PGP SIGNATURE-----

--PnjxCYIQ+rRJIJpx--

