Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57D9D5141
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2019 19:06:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJKl7-0004g5-1w; Sat, 12 Oct 2019 17:00:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqvL=YF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iJKl5-0004g0-Ih
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2019 17:00:47 +0000
X-Inumbo-ID: d5a833be-ed11-11e9-beca-bc764e2007e4
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5a833be-ed11-11e9-beca-bc764e2007e4;
 Sat, 12 Oct 2019 17:00:46 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 61CA221B6B;
 Sat, 12 Oct 2019 13:00:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 12 Oct 2019 13:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FeSMbR
 kB8kSFKKYzu8qvEckX4tWjv3+DWs82tZJrSf4=; b=YGKDUnAnfXwos3FtSrZmJh
 nG7s6rkAbGtKe58sXILZ1Hd9z3Od24luVuZ06Y24f2arDBVbj560cnLiPEFD1hbt
 MEjEHGKql9SQhjZ2vUfP92GyljPHQY22EAi9lU7Ob5+iBHcFTEU8njLxrXRvI9mV
 oCCvPKZ49yiEtP/FfweT3qfaaxIuEfEavx+dtT1V9jcXF3gq7qDpjB/7U0bRXJc9
 BvnG+ZI5rmZqDNcDDjD/8BIrH2+3upmWItXdew7SOavjnF9ipTFhc1u0p840iXPq
 7TMJt0HYx3m7wZA4LU9+ugQuXetOD+g7ZiOnmlw20zGzvBQ5oICgOCdQuoyosRDg
 ==
X-ME-Sender: <xms:vQaiXSRzd_BTLe1DqmVVwq6s8Vz8AqWCLhbrsehcSKGt10KbeRHJoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrieejgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:vQaiXfCr9dgVZMHhNr7C43LY7dfxjG7-LPSAn_ZS8MMsRZpwDka8cA>
 <xmx:vQaiXasc1Opp_DtiTvcfl50LQhAKNOkW6JXv5Yb03mLGxqbTQiBEOg>
 <xmx:vQaiXd9eIGW5VgtSnnY1pDgqLQGYQklSeMJlDJVTtIF4hqX5yXi_Yg>
 <xmx:vgaiXTp6i8j-t9ZdbakL6Y3rsiIdpn3iU47KXXi1HzMAAu8A6oqbxg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 481BDD60057;
 Sat, 12 Oct 2019 13:00:44 -0400 (EDT)
Date: Sat, 12 Oct 2019 19:00:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191012170040.GB28966@mail-itl>
References: <cover.39cf5c05f6ef01e3793327a459cad5d884dc0a9c.1570890895.git-series.marmarek@invisiblethingslab.com>
 <bf29c0ca9c1622e980883f11030e21f013312d3e.1570890895.git-series.marmarek@invisiblethingslab.com>
 <272a9354-bcb4-50a4-a251-6a453221d6e3@citrix.com>
MIME-Version: 1.0
In-Reply-To: <272a9354-bcb4-50a4-a251-6a453221d6e3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/efi: optionally call
 SetVirtualAddressMap()
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
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============8615992434142911273=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8615992434142911273==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] xen/efi: optionally call SetVirtualAddressMap()

On Sat, Oct 12, 2019 at 05:29:34PM +0100, Andrew Cooper wrote:
> On 12/10/2019 15:36, Marek Marczykowski-G=C3=B3recki wrote:
> > SetVirtualAddressMap() can be called only once,
>=20
> True.
>=20
> > hence it's incompatible with kexec.
>=20
> Most certainly not.
>=20
> Linux unconditionally enters virtual mode, citing a huge slew of EFI
> firmware bugs, and is perfectly capable of kexec-ing on the resulting
> systems.
>=20
> This is how Xen should behave as well, and I suspect it will have a
> marked improvement on our ability to actually boot on EFI systems.
>=20
>=20
> Now - it may be true that Xen is missing some piece of plumbing to allow
> kexec in virtual mode to work, and that is a fine reason to leave a note
> in the text of an EXPERT option noting what what is/isn't expected to
> work (and what may or may not have been tested).
>=20
> > For this reason, make it an optional feature, depending on
> > !KEXEC.
>=20
> This presupposes (at Xen's build time) that a kexec'd kernel is going to
> want/need to use runtime services.=C2=A0 I'm not convinced this is
> universally true,

In fact, as it turned out in the discussion, right now it definitely
can't, as it doesn't get runtime services table (or efi system table or
any other info required for this). So, it looks like it should read "it
might be incompatible with some future Xen implementation of kexec".

> or a reasonable restriction to make, as kexec is the
> action of last resort to try and get something useful out.=C2=A0 (However,
> given the 4.13 timeline, and that this is off-by-default, lets not waste
> time arguing, so it can stay as it is.)
>=20
> > And to not inflate number of supported configurations, hide it
> > behind EXPERT.
>=20
> "number of supported configurations" isn't a relevant argument.=C2=A0 We =
will
> have as few or as many as are appropriate to present to user, given a
> baseline competency of "able to at read and comprehend the descriptions
> given".
>=20
> A valid reason for putting this behind EXPERT is because it is an
> interim bit of duct tape, trying to work around other breakages in Xen,

Rather in UEFI...

> and its late in the 4.13 dev cycle, and use of this option might cause
> other things to explode in weird and wonderful ways.
>=20
> > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > index 16829f6..fe98f8a 100644
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -88,6 +88,19 @@ config KEXEC
> > =20
> >  	  If unsure, say Y.
> > =20
> > +config SET_VIRTUAL_ADDRESS_MAP
> > +    bool "EFI: call SetVirtualAddressMap()" if EXPERT =3D "y"
> > +    default n
> > +    depends on !KEXEC
> > +    ---help---
> > +      Call EFI SetVirtualAddressMap() runtime service to setup memory =
map for
> > +      further runtime services. According to UEFI spec, it isn't stric=
tly
> > +      necessary, but many UEFI implementations misbehave when this cal=
l is
> > +      missing. On the other hand, this call can be made only once, whi=
ch makes
> > +      it incompatible with kexec (kexec-ing this Xen from other Xen or=
 Linux).
> > +
> > +      If unsuser, say N.
>=20
> "unsure".
>=20
> > +
> >  config XENOPROF
> >  	def_bool y
> >  	prompt "Xen Oprofile Support" if EXPERT =3D "y"
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index cddf3de..6eaabd4 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -1056,11 +1056,17 @@ static void __init efi_set_gop_mode(EFI_GRAPHIC=
S_OUTPUT_PROTOCOL *gop, UINTN gop
> >          efi_arch_video_init(gop, info_size, mode_info);
> >  }
> > =20
> > +#define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
> > +                                 (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
> > +
> >  static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TA=
BLE *SystemTable)
> >  {
> >      EFI_STATUS status;
> >      UINTN info_size =3D 0, map_key;
> >      bool retry;
> > +#ifdef CONFIG_SET_VIRTUAL_ADDRESS_MAP
> > +    unsigned int i;
> > +#endif
> > =20
> >      efi_bs->GetMemoryMap(&info_size, NULL, &map_key,
> >                           &efi_mdesc_size, &mdesc_ver);
> > @@ -1094,6 +1100,26 @@ static void __init efi_exit_boot(EFI_HANDLE Imag=
eHandle, EFI_SYSTEM_TABLE *Syste
> >      if ( EFI_ERROR(status) )
> >          PrintErrMesg(L"Cannot exit boot services", status);
>=20
> Use this example...
>=20
> > =20
> > +#ifdef CONFIG_SET_VIRTUAL_ADDRESS_MAP
> > +    for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
> > +    {
> > +        EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
> > +
> > +        if ( desc->Attribute & EFI_MEMORY_RUNTIME )
> > +            desc->VirtualStart =3D desc->PhysicalStart;
> > +        else
> > +            desc->VirtualStart =3D INVALID_VIRTUAL_ADDRESS;
> > +    }
> > +    status =3D efi_rs->SetVirtualAddressMap(efi_memmap_size, efi_mdesc=
_size,
> > +                                          mdesc_ver, efi_memmap);
> > +    if ( status !=3D EFI_SUCCESS )
> > +    {
> > +        printk(XENLOG_ERR "EFI: SetVirtualAddressMap() failed (%#lx), =
disabling runtime services\n",
> > +               status);
>=20
> ... here.=C2=A0 printk() isn't set up, and won't go anywhere useful.

I can't. It's after ExitBootServices(). Isn't it going to land in
console ring, to be printed later?

> With this, and a bit of rewording of the commit message and Kconfig
> text, I think this is fine for inclusion into 4.13.=C2=A0 It is off by
> default, so will not interfere with existing configuration, and it
> clearly improves the status quo on others.
>=20
> ~Andrew

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2iBrkACgkQ24/THMrX
1ywu2gf8DD8b76NCSEKDzo2Cn3eiYf6Etbxe4fZR8745Kan+2+cRE9YkN5YZUZ7h
cRTfZlk8LDRv9NUXdDCCm8gNUcoFHv2fSUSfxpWtCtNNE6Q48BQn5kX50l4J6PCI
JXuVW3l2YjCvIuIF8lJIzaUGPR5Qo3PRf7Y8xP5083T9ji++TWe8gBeJqBvv2jbO
Et09X63UOLrZUMY6ACP0PNrKiIManwWYE9YfON6zrT+9Jy7jNDKprHYa348pdgcl
gCmTm+shVnozBwZXNacMZnYoRxtuDHmqTsfuwDLEStWbqxiOhOvGLq+V1qUUeSws
TM3EjVKh1gNnyL7bAh0p9/IMQafJzg==
=rWRP
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--


--===============8615992434142911273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8615992434142911273==--

