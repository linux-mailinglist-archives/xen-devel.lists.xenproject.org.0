Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8EB87939A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 13:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691798.1078170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk0pw-0003O6-Oj; Tue, 12 Mar 2024 12:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691798.1078170; Tue, 12 Mar 2024 12:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk0pw-0003LQ-M7; Tue, 12 Mar 2024 12:02:28 +0000
Received: by outflank-mailman (input) for mailman id 691798;
 Tue, 12 Mar 2024 12:02:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jUN=KS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rk0pu-0003LK-Nu
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 12:02:26 +0000
Received: from wfhigh1-smtp.messagingengine.com
 (wfhigh1-smtp.messagingengine.com [64.147.123.152])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62775f14-e068-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 13:02:24 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfhigh.west.internal (Postfix) with ESMTP id AA3791800082;
 Tue, 12 Mar 2024 08:02:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 12 Mar 2024 08:02:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Mar 2024 08:02:18 -0400 (EDT)
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
X-Inumbo-ID: 62775f14-e068-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710244940;
	 x=1710331340; bh=Ma+2LP1YhgBrzbXr0JBu0zyCAyWKPMM7lw3llKmFuH4=; b=
	eCh2wtGuB0TwHgnKRYz9qxoXA/1MZ3C2bGFy7TgziQjjA+Aq6i3w+YhNpzvoWVio
	S5PlijuCHhW7KQWsgR1P7mxdJuKew/TeYJhtCoY/LyNnpMCJbmSUw58FMJq0e9ZT
	HluKNoF4U+MGiVfYp/0p1skJohuiMhupQYTcknraaUH1SHUs/+erLjvl8WdAd4W8
	FLhAcsL6oTPtje3ZUu0bHLVLe87fxw2CefcqEZmp9BAGXg/L8ccxpqJlyNzLjg7k
	hEJ0xI+OP4CmS9TTI32Kc10jRIuPgCRxBspgTMWWN0IBuwAOW1kbMw45wso9gNWx
	aKdYS7HJEhKfLEsSq912Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710244940; x=1710331340; bh=Ma+2LP1YhgBrzbXr0JBu0zyCAyWK
	PMM7lw3llKmFuH4=; b=JOSxxWgQzj5K6P4kPCpETq5A++ufHgAEL6ukiibkGteh
	MgmQwxicTQSrKopNKyIOHg70tLKc3DQuUm9m7CNQNEFBi1usNBYefynR+OTaI+bB
	N+P05k1vzKUKqD7rn/JcNebqTKFtqdlFrkoKQBxfUa+LBW6UTnkCgZsh4aZZ2Eb2
	sEvbibE8Pw+v/AXQIEZBOrt/d+fnB3r8C86QzUMSizlbu1s/8BWYIi5FIAtk35/w
	RUYWBUF+ieG2CkRDJ6Ja3+jXqBxbiM1J3oe7Jd0pzB90VAgu+y9WHsz1o2jNhd2n
	dLM16oxcpNR5uClu/3E9cZbT/XQuPeAWXwUuwx00bQ==
X-ME-Sender: <xms:S0TwZdTyLWWZ4AnwKJG8Eaicw4mnYaZ84QMgzYKvCptO1TUq5-3z5w>
    <xme:S0TwZWz4IFgQ5KaIMTTtCIopzrOnDCkci2rOL_-1JTmqD1n3pVJQnNKWazK-k0VDx
    qJPxVxwcwhiTQ>
X-ME-Received: <xmr:S0TwZS0mK8i_HhHO3Gcecn3m-paHxsCRDn3QkHMjNGO8UP_EAYq6D9B-bhDHm3QDLGlZHnkiz7jUG1i_wXFkZcPCsZ34i83fzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:S0TwZVAbC3ujLFUhzZAAzcpqrFo9rfGUWlTmdrim1NjYtV0H-6xDpA>
    <xmx:S0TwZWhFSCghLTNf7rHeB7GRy8gP9RwuA0pYbFeJV0756QrQ3bXdpQ>
    <xmx:S0TwZZqZ58FpNCrf6XGXx3KnuIXIaS59r2oYFZaPf6as5cuRyuQf3w>
    <xmx:S0TwZRhUMjy3QAAe3jUjEazjnVNCuaE0tFRhoGbdapro-HDoj1GCuA>
    <xmx:TETwZfXzU41BOPZlvCzxtbjnnc1qfqgdJuE4v9neFiwdcbQcd48ILS-RcQc>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 12 Mar 2024 13:02:14 +0100
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
Message-ID: <ZfBERyqQ7Ous3nGE@mail-itl>
References: <20240311203431.342530-1-marmarek@invisiblethingslab.com>
 <ZfAtahcXWGqckQFW@macbook>
 <6a80ceb6-cc2a-4d8f-9a66-70063923b0ea@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IuHzY/XwPjfFrxcX"
Content-Disposition: inline
In-Reply-To: <6a80ceb6-cc2a-4d8f-9a66-70063923b0ea@suse.com>


--IuHzY/XwPjfFrxcX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Mar 2024 13:02:14 +0100
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

On Tue, Mar 12, 2024 at 11:53:46AM +0100, Jan Beulich wrote:
> On 12.03.2024 11:24, Roger Pau Monn=C3=A9 wrote:
> >> --- a/xen/arch/x86/setup.c
> >> +++ b/xen/arch/x86/setup.c
> >> @@ -1806,6 +1806,9 @@ void asmlinkage __init noreturn __start_xen(unsi=
gned long mbi_p)
> >>      mmio_ro_ranges =3D rangeset_new(NULL, "r/o mmio ranges",
> >>                                    RANGESETF_prettyprint_hex);
> >> =20
> >> +    /* Needs to happen after E820 processing but before IOMMU init */
> >> +    xhci_dbc_uart_reserve_ram();
> >=20
> > Overall it might be better if some generic solution for all users of
> > iommu_add_extra_reserved_device_memory() could be implemented,
>=20
> +1

In that case, is the approach with
iommu_get_extra_reserved_device_memory() okay (and a comment that it
will have a side effect...) ?

> > but I'm
> > unsure whether the intention is for the interface to always be used
> > against RAM.
>=20
> I think we can work from that assumption for now.

Ok, I'll add a comment about that. I guess, if needed in the future,
iommu_add_extra_reserved_device_memory() can gain an extra parameter to
distinguish RAM from non-RAM mappings.

BTW should e820_change_range_type() return 1 in case of mapping already
having the right type? Otherwise, if one wants to use
iommu_add_extra_reserved_device_memory() on already reserved memory, the
e820_change_range_type() would fail.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--IuHzY/XwPjfFrxcX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXwREcACgkQ24/THMrX
1yylzAf+MIXUacgkN2SoiRmIUZUpM7Moa2VIjwXJAzVwoXyoHKfBeJTWCCZ97LzZ
sZSp6I0p9VcDNkQ1zFqzrRte0dtExSYK1gAXwZdPdNRnltRnaCuz4hksJG20jSVj
nXS18EbPAU4XjgPtARozcCu6LyZpALW7LMzD33aqz2fDTRRRtUljEIDK9Z/4R8Me
y2BdxO55JthfpD8eOFFGll+ZG4sP5fRnXbWCqOusf2edJ6B+OlPfSZYIUI4/cpps
AG0HqAUYoA1mBFbMG83lHst8+JDZHAP9WmFjxjH+kqf8LDHrcMwuDqH4hvXdvDu8
DA1Jwdzsl0PvH30tvGDb301GWu+SDA==
=9uWv
-----END PGP SIGNATURE-----

--IuHzY/XwPjfFrxcX--

