Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED31E2035
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJAI-000355-Ht; Wed, 23 Oct 2019 16:07:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bla1=YQ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iNJAG-000350-GS
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:07:12 +0000
X-Inumbo-ID: 2bdec1c6-f5af-11e9-8aca-bc764e2007e4
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bdec1c6-f5af-11e9-8aca-bc764e2007e4;
 Wed, 23 Oct 2019 16:07:11 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0EF2021D75;
 Wed, 23 Oct 2019 12:07:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 23 Oct 2019 12:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DiL1Z6
 m5uQFCky1AbHsjVQ30kO4QCEJqC90cIcVGxR8=; b=hcIKAvO/6mAKh7Eqxm8Jgs
 YRvnfwKKgAhaURGLZRr2PFAH0wXfDrrHRMQlY/ligVa68vVH4AqZIqbAYRKYmyzR
 YFN93hhIzqzo+/3/zQEOY7ILa1bmIPXgU7zIy4zWj2YI8uJOnVBviB7jQS+5dyyw
 dYhFF+USQuaYZedz9pynzrqcuBgfHDAC0BfY0KABgvUHFhVzJK2b1L/OSgrbmsHq
 TlafV2p4B2oz3nqWDF3yWRprHSLmnows4rgHbkBFnm6beqizhiesZPd78zPJYweK
 XeYAijj0DBo6LvHTOUIovhoGopSpvUCb8c4T2t/B8VJ80uDRXt9+3ScsPXP0fJvg
 ==
X-ME-Sender: <xms:rnqwXa6N8Ga3GXJqzzReGppKBqfYtZzJzsIs9NKcbDkNm4VzncH-ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeelgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeekfedrleejrddvfedrvdel
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:rnqwXYKcQxVJV-kCf-yynnhE6gUxwbADOWml2W1Fpv0xrqmxKbIrcQ>
 <xmx:rnqwXUdc6ZHT8leWxhyHjexlc9p3O_sQ-4x7QhhzKz6JX2PSXD-NQA>
 <xmx:rnqwXbcdt3usKrtiRuEg38cxqNXm5z8K-Tt0Hzc-3xG7c3fkYvDVkg>
 <xmx:r3qwXSiPGllRNrP_Rv3UV8mCRIH4tgCUTANtavuMtCZ2H689OPwsjQ>
Received: from mail-itl (unknown [83.97.23.29])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D8F380060;
 Wed, 23 Oct 2019 12:07:08 -0400 (EDT)
Date: Wed, 23 Oct 2019 18:07:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191023160705.GJ1410@mail-itl>
References: <cover.b80738fa53144bc6e5e32c048ccf4e4b95355844.1570918263.git-series.marmarek@invisiblethingslab.com>
 <aedda92afd26caac474870d44504074d3b2ff6d0.1570918263.git-series.marmarek@invisiblethingslab.com>
 <24d8f989-92e6-d6a0-7c77-f02ae6a4ef54@suse.com>
MIME-Version: 1.0
In-Reply-To: <24d8f989-92e6-d6a0-7c77-f02ae6a4ef54@suse.com>
Subject: Re: [Xen-devel] [PATCH v3 2/2] xen/efi: optionally call
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============3797697862347234658=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3797697862347234658==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3U8TY7m7wOx7RL1F"
Content-Disposition: inline


--3U8TY7m7wOx7RL1F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/2] xen/efi: optionally call SetVirtualAddressMap()

On Wed, Oct 23, 2019 at 05:37:33PM +0200, Jan Beulich wrote:
> On 13.10.2019 00:11, Marek Marczykowski-G=C3=B3recki  wrote:
> > Some UEFI implementations are not happy about running in 1:1 addressing,
> > but really virtual address space.
>=20
> I have to admit that I find this misleading. There's no true "physical
> mode" on x86-64 anyway. What I assume happens is that people abuse the
> address map change notification to do things beyond the necessary
> ConvertPointer(() calls.

That would indeed match the behaviour. I'll add it to commit message.

> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -88,6 +88,19 @@ config KEXEC
> > =20
> >  	  If unsure, say Y.
> > =20
> > +config SET_VIRTUAL_ADDRESS_MAP
>=20
> I'm of the strong opinion that this wants to have an EFI_ prefix.

Ok.

> > +    bool "EFI: call SetVirtualAddressMap()" if EXPERT =3D "y"
> > +    default n
>=20
> I don't think you need this line.
>=20
> > @@ -1094,6 +1100,26 @@ static void __init efi_exit_boot(EFI_HANDLE Imag=
eHandle, EFI_SYSTEM_TABLE *Syste
> >      if ( EFI_ERROR(status) )
> >          PrintErrMesg(L"Cannot exit boot services", status);
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
> > +        __clear_bit(EFI_RS, &efi_flags);
> > +    }
> > +#endif
>=20
> This new placement undermines (or at least complicates afaict) the
> original intention to allow picking virtual addresses which don't
> match the directmap.

If I read it right, the original intention was to specifically use
directmap, not some other virtual addresses. Which is flawed, because
directmap is mapped with NX, so at least EfiRuntimeServicesCode will
break. This means, even when using directmap, Xen would need to switch
page tables for the runtime call time to allow executing that code.

There is of course an option to rewrite it completely differently,
mapping EFI runtime regions somewhere else (not 1:1 and not re-use
directmap). But I don't think it worth the effort, and also is definitely
too complex this far in 4.13 release cycle.

> I can accept this as an intended tradeoff (as
> you validly mention in the other patch we don't honor the 1:1 map
> requirement at the time of the call with its original placement),
> but it should be mentioned in one of the two patch descriptions.

This is one of the reason why I've decided to split this change into two
parts - remove the old one and add the new one. It is really not "fixing
the old approach", but doing this very differently. I think this patch
description referencing old, never working and never even enabled
approach would be misleading at least. The patch removing the old
approach do list reasons why it was broken.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--3U8TY7m7wOx7RL1F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2weqcACgkQ24/THMrX
1yy4aggAgfC/Qa4pnSfe4bZXcZ7dBq/rvuZmewbdmwrH4LQ1ROAOXutfbqaQrDVQ
WanfIAVAn90w+q4c5bkHd3R/w0Uh9+3IoFL8ePtxHQ3AUN7qLWLjkX9Dmh6W+3NU
AtQK9rUHv+cZUdlTCjPAW7ei1f5eWE0wuh3YILns4bITFrYVmXOyYeAsUjCuMKP2
2Cpzj3/CJYP4QraMKNlOb+f89adJLswjq+hYNeU+DhY6i4cnBtM2+a8HoXJqaVwI
nH+7T5/Qc3OSkRkPCXkEsPrtEqAg+eekfseXkvlCs2BjNY9ZitoPZVH2/t5gna32
jyDNb0p5cXm5HFpIjwVUnnNxNlo78g==
=LKPo
-----END PGP SIGNATURE-----

--3U8TY7m7wOx7RL1F--


--===============3797697862347234658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3797697862347234658==--

