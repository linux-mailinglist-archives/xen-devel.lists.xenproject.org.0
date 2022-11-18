Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24D862F574
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 14:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445735.701074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0yu-0003kJ-Nq; Fri, 18 Nov 2022 13:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445735.701074; Fri, 18 Nov 2022 13:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0yu-0003iJ-Kz; Fri, 18 Nov 2022 13:00:32 +0000
Received: by outflank-mailman (input) for mailman id 445735;
 Fri, 18 Nov 2022 13:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0R6=3S=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ow0ys-0003iB-VS
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 13:00:30 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9f18eea-6740-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 14:00:29 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 449653200C19;
 Fri, 18 Nov 2022 08:00:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 18 Nov 2022 08:00:27 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Nov 2022 08:00:25 -0500 (EST)
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
X-Inumbo-ID: f9f18eea-6740-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1668776426; x=
	1668862826; bh=4EHC9MKw629pycdLTqwfH+QKLCKS3aENIW6Fnu+Z/Ms=; b=H
	WCTJ1p7Ur0q1kOZOuKVB8DYeMDH7nSRlIewqZN0yWF33pZTrDjkUnyQsckgzwlMu
	9xnBAybNi8LlLq4l5M3ayfkRukXi7fTdpdd+g2jjKBG8QZqevACN2ODXqptyfiE6
	2GO1Agd7LcWh1hh7+v8/COEjzDtxDWOlgpvXoAg4IhC2+Q882Qa1nYkkJHQigX5U
	eDG5Tl+ErH38JtfAcL6CNbkTjY4Z/WqnY4GZr5ZPcygj7bvLGUw2lD5wlhqvlEof
	JE6ofFJCbvln5ar2DpNIiz7Z2euA/JnJ01XzPivmLNg6fXLg3qZMbqLunur+nbe9
	WDd06l20aSQrPkVUONj9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668776426; x=1668862826; bh=4EHC9MKw629pycdLTqwfH+QKLCKS
	3aENIW6Fnu+Z/Ms=; b=EPoZ8lQFM7WnkD2kn0+DJaKIC/I4Doa5nNO8dv9j1wpe
	lAUBu58kfgh1TEe3UUUl3PagVLy8pilWuqq69VerOFyVzjsb8iNKnzTEJKQBISwV
	OeGnDRbNAxAparwTpuK+VZ3VrDc3UVAioRNtWOdVv9kCa5qkYfKGEEg6gZ1OpFKg
	XrIiIqGnkSurdZRAp7p0BKNo2wfDg/is2w7q4398LIbm53PaPpz8WLJxAiB8R/58
	xooGdbXh71IqjXJ6kD+vBkI2UQZ4Hr171Uo11dzx+yn17EL95+fqlgp2aYwqKdAH
	npDYSs4PfHsOMsUCTqv607FyWarOQgf/GlKQbw55+g==
X-ME-Sender: <xms:6oF3YypE4akRlzQ0z_ozuPxWF4_cMbnKCHgTwumJipB5mbdoN3Ze5g>
    <xme:6oF3Ywre1UK6LtKfBPE5G4MSqsmaNRuinDWZl8RqBDTM6njZbkSxUFgGMh4InxdYn
    C3WiYYMad0hzA>
X-ME-Received: <xmr:6oF3Y3PeJO-_qOEn55Pr2fSHHax6jA_uQAf0LWLIx67ECt1_lSrJxO1RulhkWFIofORJUp1ulPHuhFIwQLEa9-oCx1N8izQ1IA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrhedtgdegjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:6oF3Yx51dQOXU-97y2AX2BJWgHIlmGRCZhIwqlB1yfzxxKWIqh4SJg>
    <xmx:6oF3Yx6WJziDMNi2Se_HR9TvokSdLSsgtlwp--xdU9YLio7qaz_L6w>
    <xmx:6oF3Yxh7SGKKxp6Dw7i96Z9pUYzfjjWVbKWfD7aTwRKunC1l4anLwg>
    <xmx:6oF3YxEJeORKTl9AC_F4pW5gZC9FtKYfsuwK4HzYIt5jAhPglVIzTA>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 18 Nov 2022 14:00:23 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/msi: Allow writes to registers on the same page
 as MSI-X table
Message-ID: <Y3eB5+GEQ36X9LnR@mail-itl>
References: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
 <20221114192100.1539267-2-marmarek@invisiblethingslab.com>
 <15138618-5cb0-8304-a56b-cb787e187772@suse.com>
 <Y3ZwAJITlD/rSf/n@mail-itl>
 <cc75d927-b936-0716-bf36-70bb65be7a1e@suse.com>
 <Y3d4aW4LjYwEZ85Z@mail-itl>
 <9d034957-822c-74ba-9aea-0944cc456870@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GusqaJC/8lAeSwP9"
Content-Disposition: inline
In-Reply-To: <9d034957-822c-74ba-9aea-0944cc456870@suse.com>


--GusqaJC/8lAeSwP9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Nov 2022 14:00:23 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/msi: Allow writes to registers on the same page
 as MSI-X table

On Fri, Nov 18, 2022 at 01:33:39PM +0100, Jan Beulich wrote:
> On 18.11.2022 13:19, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Nov 18, 2022 at 08:20:14AM +0100, Jan Beulich wrote:
> >> On 17.11.2022 18:31, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Thu, Nov 17, 2022 at 05:34:36PM +0100, Jan Beulich wrote:
> >>>> Which in turn raises the question: Do you need to handle reads
> >>>> in the new code in the first place?
> >>>
> >>> The page not being mapped is also the reason why I do need to handle
> >>> reads too.
> >>
> >> Just for my own clarity: You mean "not mapped to qemu" here?
> >=20
> > No, to the HVM domain (in p2m). Xen (outside of MSI-X specific code for
> > HVM) doesn't know where those reads should be from.
>=20
> Hmm, I was expecting them to be mapped r/o to the guest, but perhaps I'm
> misremembering. Clearly both ept_p2m_type_to_flags() and
> p2m_type_to_flags() take mmio_ro_ranges into consideration, which is
> what I was basing my understanding on (without having looked at other
> places in detail).

Qemu doesn't map the page (using xc_domain_memory_mapping()) where MSI-X
table lives. I tried to modify this part, but it resulted in EPT
violation on write attempt (and my emulation code wasn't called at all).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--GusqaJC/8lAeSwP9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmN3gecACgkQ24/THMrX
1yz9yQf/QS1FJclofzjtQVr6ZaCqzuNX4dMjEJKWEjojyd4EvPlWBZ2qs+IDtKjS
hEAn+pfKe/2y089giG+Dh5wvZwnONZobxeQ14Vg2jTeV7rIgSG5SVmPhZkfU4KIQ
1ABhPg+EAdRXklbCb6SoIWSYcLHRg44VsYURuMrazXbT3/VKGhT5eLd6xgc1LttK
2P1gy4J76x1rLGoPF5YMCMpD19tczQcQdKWtGMoZFI9d/Lu6YlntHwllf+AUkShe
CbMrauSkNajQrqOt6vCDifavzJur6khROYRVV8FEypgy+FTgWgkIbeWWYB2dbDlu
uwS1bzatLFE3SnW42Fyqyfdr0IAxtA==
=eYPR
-----END PGP SIGNATURE-----

--GusqaJC/8lAeSwP9--

