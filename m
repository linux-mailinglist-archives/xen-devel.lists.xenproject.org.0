Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC41A85853
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 04:56:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvYYV-0008Au-Vg; Thu, 08 Aug 2019 02:53:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o++3=WE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hvYYT-0008Al-OL
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 02:53:30 +0000
X-Inumbo-ID: b24fb9ed-b987-11e9-8980-bc764e045a96
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b24fb9ed-b987-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 02:53:28 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id D62FB367;
 Wed,  7 Aug 2019 22:53:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 07 Aug 2019 22:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=P/9bc+
 DmGTKhwozAzx7wheeWCBF8LQjiWI4n+CWkbyA=; b=QtMl3o/hDu83VI+vR/137C
 mIByS9308WXW2rs742hrW7XBcCScdCATJ1XjfTmFDfnZt7ITbZxNHXe9A3RWE7Cu
 b5mXlCQht8I88xIdjd9TsKmvKuUUrVOuEByhm9hi2jURwAwgaATAapuUIjhjG/1R
 qnhvDXH0HCBX3lrTBZW5kd1QLqibcDnQEx1vpq/fJlqbIg5mleMMX/fepX0J6xPM
 CYIt6wvjq496d5252qAhWC5WIws5TVoIlbLQ/eibLXb5uK4cCOnCWkCiM1Ua7+ZV
 AmuNJ26o7aBK4/7OyEJ+gmldqgth/8Mc3aFLLYSzBl00cbKMU9PL+ulkAWfqa1kA
 ==
X-ME-Sender: <xms:po5LXcbF-gxFh4J5_h1cGJ-NmBcYU7opzJEcaKa39n9Oy2mO_4S3mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddugedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepvghfihdrihgu
 necukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhs
 thgvrhfuihiivgeptd
X-ME-Proxy: <xmx:po5LXe0Q0IxFfqB0D_YrsERJjoE5-7MqfADCpQtTdihiVz2rrPkM_Q>
 <xmx:po5LXUUrxjjn-PgLO9uggMBEWmH7lqN5TlmxRxJ5FXxBL-rEg4G4PQ>
 <xmx:po5LXQXuptnx8d-Sf91oB9XK7pv6no-YXdFWyp-BXMBQoNVhiS3x1w>
 <xmx:po5LXSjU2RgKr8y0G6mvVUHdlNA7VbI26kjCQjZrE7FB_PbJxojMHg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55A35380079;
 Wed,  7 Aug 2019 22:53:25 -0400 (EDT)
Date: Thu, 8 Aug 2019 04:53:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190808025321.GF3257@mail-itl>
References: <20190807132657.GA2852@mail-itl>
 <7e7da376-462f-9bd0-5b82-137c059feb13@suse.com>
 <20190807151703.GA2659@mail-itl>
 <59f6c90b-3dbb-b0eb-ff45-0f8fd4c915de@suse.com>
 <20190807155112.GA3257@mail-itl>
 <642fe1a7-741d-2b42-f810-7c9cdb9c5120@suse.com>
 <20190807160451.GB3257@mail-itl>
 <f8f28f3a-0fad-cbd2-44e0-9a0ecf8ac06d@suse.com>
 <20190807192557.GC3257@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20190807192557.GC3257@mail-itl>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============5859237883722104686=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5859237883722104686==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3oCie2+XPXTnK5a5"
Content-Disposition: inline


--3oCie2+XPXTnK5a5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2019 at 09:26:00PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Wed, Aug 07, 2019 at 06:34:09PM +0200, Jan Beulich wrote:
> > On 07.08.2019 18:04, Marek Marczykowski-G=C3=B3recki  wrote:
> > > On Wed, Aug 07, 2019 at 05:58:59PM +0200, Jan Beulich wrote:
> > > > On 07.08.2019 17:51, Marek Marczykowski-G=C3=B3recki  wrote:
> > > > > On Wed, Aug 07, 2019 at 05:33:05PM +0200, Jan Beulich wrote:
> > > > > > On 07.08.2019 17:17, Marek Marczykowski-G=C3=B3recki  wrote:
> > > > > > > Actually, I've already tried, but every other build I try, I =
get even
> > > > > > > less useful call trace, for example debug unstable build:
> > > > > > >=20
> > > > > > >        Xen call trace:
> > > > > > >           [<000000007b751c09>] 000000007b751c09
> > > > > > >           [<8c2b0398e0000daa>] 8c2b0398e0000daa
> > > > > > > ...
> > > > > > >        GENERAL PROTECTION FAULT
> > > > > > >        [error_code=3D0000]
> > > > > >=20
> > > > > > But this makes reasonable sense: The faulting insn is "call *0x=
18(%rax)"
> > > > > > and %rax is 6954b2b0, which points into a block of type
> > > > > > EfiBootServicesData (and hence likely reused by the time of the=
 crash
> > > > > > for other purposes). Hence the "/mapbs" option of xen.efi might=
 help
> > > > > > here too, but iirc there's no equivalent for it in the MB2 case.
> > > > >=20
> > > > > Oh, yes, indeed in Qubes we have /mapbs enabled by default with x=
en.efi.
> > > > > I'd like to add it to MB2 case too. Is command line parsed at thi=
s point
> > > > > (efi_exit_boot()) already?
> > > >=20
> > > > I'm struggling a little how to reply, considering that I've already
> > > > said "iirc there's no equivalent for it in the MB2 case". So I guess
> > > > I'm simply not understanding your question, or more specifically
> > > > where you want to get with it.
> > >=20
> > > /mapbs option is very specific to xen.efi. I'd like to add a means to
> > > set map_bs variable in MB2 case too. I'm asking whether I can use
> > > standard command line parser, or do I need something special extracti=
ng
> > > it from MB2 structures directly.
> >=20
> > Well, efi_multiboot2() gets called from head.S, even before the
> > (non-EFI only) cmdline_parse_early. I don't suppose there's a way
> > to avoid mixing this new option into the "normal" command line,
> > and hence there's also no way around peeking into the command
> > line early. Of course there's the option to see whether what
> > efi_arch_process_memory_map() could be deferred until later. But
> > likely that would be a far more intrusive change than what you're
> > considering to carry out.
>=20
> Ok, regardless of adding proper option for that, I've hardcoded map_bs=3D1
> and it still crashes, just slightly differently:
>=20
>     Xen call trace:
>        [<0000000000000080>] 0000000000000080
>        [<8c2b0398e0000daa>] 8c2b0398e0000daa
>=20
>     Pagetable walk from ffffffff858483a1:
>        L4[0x1ff] =3D 0000000000000000 ffffffffffffffff
>=20
>     ****************************************
>     Panic on CPU 0:
>     FATAL PAGE FAULT
>     [error_code=3D0002]
>     Faulting linear address: ffffffff858483a1
>     ****************************************
>=20
> Full message attached.

After playing more with it and also know workarounds for various EFI
issues, I've found a way to boot it: avoid calling Exit BootServices.
There was a patch from Konrad adding /noexit option, that never get
committed. Similar to efi=3Dmapbs option, I'd add efi=3Dno-exitboot too
(once efi=3Dmapbs patch is accepted).

Anyway, I'm curious what exactly is wrong here. Is it that the firmware
is not happy about lack of SetVirtualAddressMap call? FWIW, the crash is
during GetVariable RS call. I've verified that the function itself is
within EfiRuntimeServicesCode, but I don't feel like tracing Lenovo
UEFI...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--3oCie2+XPXTnK5a5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1LjqEACgkQ24/THMrX
1yy8QQf+NIu46PrMsLeRT9Hd8ruiZdN4BqqHE8nMh/RbppYwhvaurFMQ7zym5WUr
/IEoDdJIXZ5bhydCH5KP4YTyZOAmhrJDvo6H0Vtl9a8wQwFL/XlBGoyofRlWHUCZ
TvedLiD55HRGvlzVqzPHEJlLUKOY2BSHMfdymUzJ5c0tYkIArackLf95ftvgd/kj
KGWrpd6L4pwtxb6oxlwgcnT+omOoefNdPeDqgGC4rGqJf6ehtd/5yUvJnaRZ0+qi
tegaAaf6nvGIIXSfuMUIEvbCnP0TkC78uBXhtlzLmHwVlAboiOV8oHNhZRrhO8tc
xmire6sRb0ERrDglwaablCyjmnmt+Q==
=LBc6
-----END PGP SIGNATURE-----

--3oCie2+XPXTnK5a5--


--===============5859237883722104686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5859237883722104686==--

