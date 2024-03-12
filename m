Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B26318794D0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691846.1078321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1sm-0002pg-PU; Tue, 12 Mar 2024 13:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691846.1078321; Tue, 12 Mar 2024 13:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1sm-0002mn-Mc; Tue, 12 Mar 2024 13:09:28 +0000
Received: by outflank-mailman (input) for mailman id 691846;
 Tue, 12 Mar 2024 13:09:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jUN=KS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rk1sk-0002mh-Kg
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:09:26 +0000
Received: from wfout1-smtp.messagingengine.com
 (wfout1-smtp.messagingengine.com [64.147.123.144])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bde097a7-e071-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 14:09:23 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfout.west.internal (Postfix) with ESMTP id 7B4221C000CE;
 Tue, 12 Mar 2024 09:09:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 12 Mar 2024 09:09:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Mar 2024 09:09:17 -0400 (EDT)
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
X-Inumbo-ID: bde097a7-e071-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710248959;
	 x=1710335359; bh=hOUvcrBST3DiEsqfYi4i5If3YrOMAB7V91NZAHLgPZ8=; b=
	B31FrC5HddRmeVwhElG4ZfE2vOA2fCi4IjeUxEiNXkfMqukb2JMorMB/h+WN+xaQ
	ClsuXnAeBH3OK4LyI1XfcBDo2l26bvOEEvug4uuC7vb9+23UE4EdQNQj+gBFU5aE
	gm+arBuSz3pKHjLwhveTTzz9KNPb11EX0NrK/GDTpXaBxDGVmiOoWdm633SQG+kP
	zrC8ZZT9WpC5yfCILPraYPBqwriD6PjTU9WarTuM3hxyuAOCmQbIVULk26WANDOt
	9Cy5OX44cpvWSALx6QErmS7MN+K4Xks9JatGxlHqixnXKBI/okPu8Rca6z8yeVXT
	4qXM3Rl4a1Mlfzmw+v48nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710248959; x=1710335359; bh=hOUvcrBST3DiEsqfYi4i5If3YrOM
	AB7V91NZAHLgPZ8=; b=ahGXG1a0OnD5HFcfkyHYuByhxGWKDkcqj7VnRPN3vi9O
	MCUuwGQSEHyvbgVK4ORx3Uxi20sXho3xBJSWkFxOvtOG8qG3UsTkSrH1ZlflCV5j
	Rc6DptZyXAB/hIwpdS1P0Es86kyXFVaFOfbpQMT80F5YNkyQ8wtcu2OV84YXyPtw
	HsT2JfonWGwfwhkaItXYKvxEYfC/phlOkry4sfdnXOXUFIfZmybbswcq0QRueS+N
	GwO2lZwAHNMPnapUiN+907fOx4lbcLZqF1E4zY62efg3Z3WbgyLOXtpjlRECPO8h
	++/xb41Na9/Hl8mhcZLMJOF7uv477bNYS+BMPwcEBg==
X-ME-Sender: <xms:_lPwZfgZd9LyQuu8dxwQA-J805V5G4fvbBaqMzGcf9PmcfhOYZb5Lw>
    <xme:_lPwZcD6oObxvsPkg8zJH_F8dXgyTF100y0-Hyk_t1jQBIwpdmSN5h-l_wUqilXLG
    S-XGYDzMlcmpA>
X-ME-Received: <xmr:_lPwZfGbM3RSWZFg4r4osISYImbppPvQKbNhRuDrkwRU7EshnxQyPVbDxPUnILeb7aRmFZ1vdrxOI7VGtcUxJJdW0NLUk6C2BQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:_lPwZcRXI91cqWzUxQukQzYqjay3wTfK9CvURCnTA70mfhLi3lLFHQ>
    <xmx:_lPwZcw62gUPnCB4b5Jjhn1mPfG1CZphvNvzbm4-JWVu7xWbUMR8zw>
    <xmx:_lPwZS7ttCtg9AI_Mxk1pbSp2y54M9_vfvd0cvc0lLVg4hM7wshX4Q>
    <xmx:_lPwZRziJSZU8KAkpc0tcCkLWyIyW7msnE9EO2gKh9Sh3cu6TZntkg>
    <xmx:_1PwZbliNSkJCTTTUhuc_5yf4mdV4i681FCjhUJzDnFC28rEfekD1nw4ANM>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 12 Mar 2024 14:09:14 +0100
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
Message-ID: <ZfBT-xwmKCugJQVy@mail-itl>
References: <20240311203431.342530-1-marmarek@invisiblethingslab.com>
 <ZfAtahcXWGqckQFW@macbook>
 <6a80ceb6-cc2a-4d8f-9a66-70063923b0ea@suse.com>
 <ZfBERyqQ7Ous3nGE@mail-itl>
 <2a04315c-7bb8-4985-8aca-bece9d0d535e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MB7jhg/fn8N9WInN"
Content-Disposition: inline
In-Reply-To: <2a04315c-7bb8-4985-8aca-bece9d0d535e@suse.com>


--MB7jhg/fn8N9WInN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Mar 2024 14:09:14 +0100
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

On Tue, Mar 12, 2024 at 01:38:53PM +0100, Jan Beulich wrote:
> On 12.03.2024 13:02, Marek Marczykowski-G=C3=B3recki wrote:
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
> >=20
> > In that case, is the approach with
> > iommu_get_extra_reserved_device_memory() okay (and a comment that it
> > will have a side effect...) ?
>=20
> Counter question: You not having gone that route despite our talking
> about it on Matrix must have a reason. When seeing this approach I
> concluded something got in the way. What's the deal?

I added a note about that in the patch (below commit message):
> As an alternative implementation I have considered changing
> iommu_get_extra_reserved_device_memory() to modify memory map. But that
> may hide (or cause) some other issues when this API will gain some more
> users in the future.

More specifically, if some future use would be on a non-RAM area, or
already reserved area. But if we can ignore those cases for now, I'm
fine with that approach.

> >>> but I'm
> >>> unsure whether the intention is for the interface to always be used
> >>> against RAM.
> >>
> >> I think we can work from that assumption for now.
> >=20
> > Ok, I'll add a comment about that. I guess, if needed in the future,
> > iommu_add_extra_reserved_device_memory() can gain an extra parameter to
> > distinguish RAM from non-RAM mappings.
> >=20
> > BTW should e820_change_range_type() return 1 in case of mapping already
> > having the right type? Otherwise, if one wants to use
> > iommu_add_extra_reserved_device_memory() on already reserved memory, the
> > e820_change_range_type() would fail.
>=20
> You raised that question on Matrix yesterday, iirc, and I left it
> unanswered there because it takes archeology to find the answer (or at
> least get closer to one). And, please don't get me wrong, you could as
> well do that yourself. (My vague recollection from having dealt with
> similar code in Linux is that yes, in the example given the function
> ought to indeed have failed back then. Depending on present uses etc
> it may well be that we could reconsider, though.)

I sure can do some archaeology there, I was just hoping any of you would
know the answer already.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--MB7jhg/fn8N9WInN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXwU/sACgkQ24/THMrX
1ywYNgf+KpFDyE2eKOTdY91SPxAEi+YcDQvKZaX5b01EbbT9pBVgOOOrcxCmIb05
uLGFU7mYjvbOT4SV6KmX/qFkTP9PcuPe2l8531P3QQKV6te5eA6qCQ5B9rxooxiS
6Ma/LZhWv7Dws9BdoXH/6xpoDw74AWD6EnyPHrNgbaO1glnIXo7k20PKtc0RMGrL
+TPiLyYOgRIQQhW0UyNQyEa8KE1rpigSkTomtMWtaoEEUFDOUnsy6KGDDE8MZNyW
hjlvzO4GlLTHYB7rVvZwfp7GPLdYW2CzcU5/Df1DPBeT0F6Q0r+Py5kfJkQhICDs
WRbKuDWwHnMLYmNApfaiMOS/4a37xA==
=v4V7
-----END PGP SIGNATURE-----

--MB7jhg/fn8N9WInN--

