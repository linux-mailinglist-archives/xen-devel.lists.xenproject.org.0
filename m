Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B1A860DF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 13:34:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvgdD-00081c-Ip; Thu, 08 Aug 2019 11:30:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o++3=WE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hvgdB-00081C-Kq
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 11:30:53 +0000
X-Inumbo-ID: f9db101e-b9cf-11e9-9be0-6fd2df22ac64
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9db101e-b9cf-11e9-9be0-6fd2df22ac64;
 Thu, 08 Aug 2019 11:30:51 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 26EE727FF;
 Thu,  8 Aug 2019 07:30:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 08 Aug 2019 07:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/XavKX
 hy7PIc8TQWaN19W6bfCSDVnx6QWwFEsu/pNd8=; b=1QYLWJMjSgNzMRtdYNJqOO
 h+tQAGc9ZfueoS1PAZ7k7apNaLaKKvZOgwQgM9fjGp3tnwshYXgkg8mdsxJu8zCz
 g9uzKCH5xRE+QM5s6tONdspitPMHEO8+m/5M57l4SjbsBUHyn/gkWYlYD4qWQQCB
 2nX8zNJQzqZCo5Rsn9FPFg0vF5RpW+6b3/N+Ia2T7VRXdw3Y++z+rLwLiwq/IFaj
 yff5fzr6tOI9ChY8x3NoJmLc9Udtly/T+nRwsS7ga8thMh17wAJz/vIT1fz1Rhjd
 SxZho1nWyARQ72lQCl6LZHFDYD9NiG33vly0cQsusWres7e0TbkJqqhK5mpQoV6Q
 ==
X-ME-Sender: <xms:6QdMXVVCjK7mQggHXsNYopdj2DBTM7vDpK5oR1z6aMXQ5tcmOtgedg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduhedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepkeefrdeljedrvdefrddv
 leenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:6QdMXcKlUkeOGld---Gqn2DQNp-yWOXO1APmuL_dc3RFoDJiNaBFvA>
 <xmx:6QdMXTE92L7Q8pJ5Q8ExNCZh618sy4R36sVivk54Myi_Ky1QU3GvrA>
 <xmx:6QdMXRxmJyKI6vxxf9RDzu8TgZY6upjz0_Lm9Da0Y_aZKWaTE_Kp8A>
 <xmx:6wdMXV5_bCLF6yYOzs0XuU5vM_vGzgd2J77Wx5lkLLl2t0SRe18tiA>
Received: from mail-itl (unknown [83.97.23.29])
 by mail.messagingengine.com (Postfix) with ESMTPA id DD14A80059;
 Thu,  8 Aug 2019 07:30:46 -0400 (EDT)
Date: Thu, 8 Aug 2019 13:30:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190808113042.GH3257@mail-itl>
References: <20190808003158.5256-1-marmarek@invisiblethingslab.com>
 <22d9c709-129b-d7c9-ba44-72ec930c655a@citrix.com>
MIME-Version: 1.0
In-Reply-To: <22d9c709-129b-d7c9-ba44-72ec930c655a@citrix.com>
Subject: Re: [Xen-devel] [PATCH] EFI: add efi=mapbs option and parse efi=
 early
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============6863801174917219757=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6863801174917219757==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5vjQsMS/9MbKYGLq"
Content-Disposition: inline


--5vjQsMS/9MbKYGLq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 10:40:36AM +0100, Andrew Cooper wrote:
> On 08/08/2019 01:31, Marek Marczykowski-G=C3=B3recki wrote:
> > When booting Xen via xen.efi, there is /mapbs option to workaround
> > certain platform issues (added in f36886bdf4 "EFI/early: add /mapbs to
> > map EfiBootServices{Code,Data}"). Add support for efi=3Dmapbs on Xen
> > cmdline for the same effect and parse it very early in the
> > multiboot2+EFI boot path.
> >
> > Normally cmdline is parsed after relocating MB2 structure, which happens
> > too late. To have efi=3D parsed early enough, save cmdline pointer in
> > head.S and pass it as yet another argument to efi_multiboot2(). This
> > way we avoid introducing yet another MB2 structure parser.
> >
> > To keep consistency, handle efi=3D parameter early in xen.efi too, both=
 in
> > xen.efi command line and cfg file.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> I'm very sorry to do this to you, but I'm going to object to the patch
> (in principle.=C2=A0 I think the command line option itself is fine but..=
=2E)
>=20
> What does Linux do differently here?

I've found this comment:
/*
 * The UEFI specification makes it clear that the operating system is
 * free to do whatever it wants with boot services code after
 * ExitBootServices() has been called. Ignoring this recommendation a
 * significant bunch of EFI implementations continue calling into boot
 * services code (SetVirtualAddressMap). In order to work around such
 * buggy implementations we reserve boot services region during EFI
 * init and make sure it stays executable. Then, after
 * SetVirtualAddressMap(), it is discarded.
 *
 * However, some boot services regions contain data that is required
 * by drivers, so we need to track which memory ranges can never be
 * freed. This is done by tagging those regions with the
 * EFI_MEMORY_RUNTIME attribute.
 *
 * Any driver that wants to mark a region as reserved must use
 * efi_mem_reserve() which will insert a new EFI memory descriptor
 * into efi.memmap (splitting existing regions if necessary) and tag
 * it with EFI_MEMORY_RUNTIME.
 */

So, for start, Linux has "/mapbs" enabled by default. But as you see in
the other thread, it isn't enough. Given the above comment, I more and
more think it is also about SetVirtualAddressMap() call. According to a
git log, SetVirtualAddressMap is not called in Xen, as it's incompatible
with kexec (can be called only once). Looking at Linux code, this is
worked around by passing efi memory regions from the old map to the new
one - at least this is my understanding of kexec_enter_virtual_mode() in
arch/x86/platform/efi/efi.c. For example this comment:

    /*
    * Map efi regions which were passed via setup_data. The virt_addr is a
    * fixed addr which was used in first kernel of a kexec boot.
    */

For my use case, I don't care about kexec, so I'd happily enable
SetVirtualAddressMap() call (it's under #ifdef), but according to
comments and that it wasn't touched since 2011, I don't expect it work
anymore.


> It is actively damaging to the Xen community to users to force users
> tweak command lines in order to boot/recover their system, and it looks
> especially embarrassing when other OSes cope automatically.=C2=A0 We have
> compatibility for all kinds of other firmware screw-ups, except EFI it
> seems, and this needs to change.

I _guess_ calling SetVirtualAddressMap() would help here, but it is much
more complex change than I'd like to do now.
What do you think about adding this option _and_ a heuristic when to
enable it automatically? In this case I'd say to start with
vendor=3DLenovo based on my experience...

> So while I have no objection to the option per say, I don't think this
> patch is reasonable as a "fix" to the problem as far as end users are
> concerned.
>=20
> ~Andrew

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--5vjQsMS/9MbKYGLq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1MB+IACgkQ24/THMrX
1yxeHAf8DnTuVAknbOw3qZUADNfg+AgwGzK3g3RBDTHjtJSvPHap8MFi6R4G48oj
8cEHogJRgoEFJCVZlDavX2AhUj31sk07H2ykI32f/dkNG2q9hrtgjqfEbbEcfoDK
8B1BWD10OrWspu/UTiNu/K8Q+DAHUDxBbI5zd1Nq0uKzJ4sTRZbho519GmAoLuAW
SaZspJp2DP7XFTarO1A+zJcnNESXt5xWozgOCfqFiRn1NLD8w1qRtSX3Xv7YTf7Q
N2zN7QySx34GyByN7MJAplQAPDQfK7XrHB172zkz7gVUPcudEKD2ZeT0KXMI/Hs4
bH0u6io+9iDbaEdLGOrudT/deyav5Q==
=sub3
-----END PGP SIGNATURE-----

--5vjQsMS/9MbKYGLq--


--===============6863801174917219757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6863801174917219757==--

