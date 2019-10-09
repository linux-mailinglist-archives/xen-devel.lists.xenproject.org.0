Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B293D1D1A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 02:02:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iILpn-0000rM-Pf; Wed, 09 Oct 2019 23:57:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RT5Q=YC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iILpl-0000rH-V0
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 23:57:34 +0000
X-Inumbo-ID: 8f0ca3e0-eaf0-11e9-8c93-bc764e2007e4
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f0ca3e0-eaf0-11e9-8c93-bc764e2007e4;
 Wed, 09 Oct 2019 23:57:32 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id AEBBF580;
 Wed,  9 Oct 2019 19:57:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 09 Oct 2019 19:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RV9cDl
 g5kb1gu+RPkjQmxhom8TGDHlet3k2cjfso0LI=; b=lY0q8pta6OuafEYdKhXTcH
 vF7G2GQPS6Gwz630ll5eZu4VE3JuxBCfxthb//EPiMKB07LMULLozIimXJboYQfR
 eWKC18xwQR33PLjIC5o9/kpzlvzGBjrp19/oxDd5jH8k8QUhMd+BUJrOEMcSqgqN
 6El6pl77eM6nVd9shqG+yZNdVO6aEKqFMdC4UcPd3wd0YaQ3Rqll9MIxAT638zVb
 6E5sVR4JXjaeV8rBcGW9sbvgtWglsB7EYTcyRvU6K6X/NdY1kLRogdhRTQVwRdWd
 K132+wTd7On2XsJF5OxUThLLV1MJZZygbMx0ZqMpSbqRBy+/7nngkY6mxc0l4aQA
 ==
X-ME-Sender: <xms:6nOeXQqybHO0dfYnvUJt85EBflKJvS_3JeECejQ8S0en463LdrRatQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedvgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeekledrieegrdduledruddu
 vdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:6nOeXdqKo_2T6Si5GC2AB7ix3vQMwkayHSU4Urr98D0FClj3glpSqg>
 <xmx:6nOeXaMIRGj9IwKQ-TDRthR8gdVeZL9Z5pjZLjYSsBic08jacFHhtA>
 <xmx:6nOeXWwtHq7H0uO2CNkYyA_9CP5dDJex8Dw9sLrHDMTNYLWMuvp8-w>
 <xmx:63OeXZpAVbc6mncdRn7dKnxM7s5xsnvjp5lKemswOdiliDCyXHEmXg>
Received: from mail-itl (89-64-19-112.dynamic.chello.pl [89.64.19.112])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9C40ED60057;
 Wed,  9 Oct 2019 19:57:29 -0400 (EDT)
Date: Thu, 10 Oct 2019 01:57:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191009235725.GT8065@mail-itl>
References: <20191009103153.GO8065@mail-itl>
 <13c61616-25eb-019d-75fd-7ac72f8bf133@suse.com>
 <20191009110051.GP8065@mail-itl>
 <3a75989f-d655-3bb7-4a71-5421c6f8a625@suse.com>
 <20191009115254.GQ8065@mail-itl>
 <26a97d5f-5100-19ea-a945-f2954a3d9d09@suse.com>
 <20191009122109.GR8065@mail-itl>
 <bddff3b2-a0cc-1a7e-8702-86bea33c9e16@suse.com>
 <20191009122702.GS8065@mail-itl>
 <7a598f3a-ccad-62f7-acc7-1d00953feef6@suse.com>
MIME-Version: 1.0
In-Reply-To: <7a598f3a-ccad-62f7-acc7-1d00953feef6@suse.com>
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============1174113649110847354=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1174113649110847354==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CCmQVJrPYwbn/Str"
Content-Disposition: inline


--CCmQVJrPYwbn/Str
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it

On Wed, Oct 09, 2019 at 03:31:49PM +0200, Jan Beulich wrote:
> On 09.10.2019 14:27, Marek Marczykowski-G=C3=B3recki  wrote:
> > But then, Linux won't have EFI system table pointer either, no? I don't
> > see Xen passing it over in any way.
>=20
> Making the system table pointer available e.g. to kexec userspace
> (so it can pass it in whatever suitable way) would be an easy
> addition. Use of SetVirtualAddressMap(), otoh, would have been a
> hard to undo step if I had made Xen's EFI boot path rely on it.
> The kexec situation wrt EFI was very much in flux back then, and
> hence I didn't want to take unnecessary risks of future
> complications. Any step changing the current state of affairs
> wants to provide assurance that it doesn't close roads which we
> may need to go at some point.

I don't agree with the above being a problem - as we can see, expanding
the kexec mechanism to pass EFI system table isn't really necessary to
make it usable for Linux doing crash dump (this is the use case of kexec
here, right?). But even if it would be, we're talking about some new
(possibly Linux-specific) mechanism - in that case, I don't see why it
couldn't also pass over memory map for the runtime services (as set via
SetVirtualAddressMap()) - similar as Linux->Linux kexec does.
On the other hand, lack of SetVirtualAddressMap() do cause real problems
now, making Xen unbootable on some machines. Or noticeably limited (with
efi=3Dno-rs workaround) - while RS aren't that useful for the crash kernel,
they are useful for the main system.

Anyway, it's your call, as the maintainer. The patch series I've sent
implements the approach by your preference.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--CCmQVJrPYwbn/Str
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2ec+UACgkQ24/THMrX
1ywfQAf+MK4SCQD8xr2NdCsI5v4/BZ8AuQzaEJmSIEMljLsRyRLUgEZ4yo8KEl9y
2lvRWAX2CrndOMBlfotQFveu1/xahzkUE5nncqNRp78gn6JPHGCO73EdNcL/ewJM
++nCPDjijbsugaCgf8cpVaouTTN3AqmgtCg9gbPUXfK+YTBSC3g9AvzDVNVFVY2P
kv6rzAT5HletVdOM791c6nnVc1yDYAfh2PUH+TNbyYWcJM+xn+dAytKtOkb4HQEW
ZMhzToQAwPoRnff1vPxR7xzayHrA0n/E/5mpeYsEFw6P2kQyxIiIPQ9RZQwLfR3N
J3GgRTSjZ/fPClTxNfOZ3bUGNM6ieg==
=onYU
-----END PGP SIGNATURE-----

--CCmQVJrPYwbn/Str--


--===============1174113649110847354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1174113649110847354==--

