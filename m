Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E250E1F86
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 17:39:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNIgu-000830-U2; Wed, 23 Oct 2019 15:36:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bla1=YQ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iNIgs-00082u-O7
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 15:36:50 +0000
X-Inumbo-ID: ee278e2a-f5aa-11e9-9484-12813bfff9fa
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee278e2a-f5aa-11e9-9484-12813bfff9fa;
 Wed, 23 Oct 2019 15:36:50 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id DED5B21E5B;
 Wed, 23 Oct 2019 11:36:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 23 Oct 2019 11:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=b22D5rWCvJCz8yzqk
 QjJ6QqHOjkwEvZldpYmBpXhOVs=; b=faWuFXKH1hHYT6OYmyFUJsAXnqeAx5W0P
 GM2GZ0ANvsT3yTmr7FP9LLzS1mvq4K37BqDJucCGJYucElraiS2b9U+/btpodc3s
 7Ta7uERIDK5Za3ppZGztBMac8YdxaBYznk9J/sDLQ1CuBCgynqP42brllo5pC0bL
 Nps84+1vtayWW688aUTs9UgHLi4ZDyfjb/oe4eOtx07eeKF2soHKHo7k8TRzVC0C
 3Wz5zvck1620Cpxx5D/hIjDcZfnQimtWpyCOhWta3eeC/xBasPqmV5bE+RhfS94z
 5rTkLgSOuui8J8wsgyuoFVMW5rQ+lT9K8YxSGXYzKSjYh/enEkb3w==
X-ME-Sender: <xms:kXOwXWT9-zrHgxVuj_phu2EBfUIsxIP2ISfVr3VEVYQ3_WupPAqChA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeelgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
 rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepkeefrdeljedrvdefrddvleen
 ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
 hhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:kXOwXSRbkDg3_7SMbkHEMXCFhLHNWm4KIp-HmFFhUIiXq1YACpdnhQ>
 <xmx:kXOwXR0xc50rBF9UlrN2ariUrsD94sB-RQlLOwxJ5Z6BrutPxZXj2A>
 <xmx:kXOwXUxDkgJWh7CjDAFs8PVSdCavrQpQrPZe15qz01wuRuTYRg9wZw>
 <xmx:kXOwXYZjj4VPfn4hN3Ufmwk6cHQrFewTMoAA9xeVVucuq6FIu6x6IQ>
Received: from mail-itl (unknown [83.97.23.29])
 by mail.messagingengine.com (Postfix) with ESMTPA id 030DB8005A;
 Wed, 23 Oct 2019 11:36:47 -0400 (EDT)
Date: Wed, 23 Oct 2019 17:36:43 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191023153643.GI1410@mail-itl>
MIME-Version: 1.0
In-Reply-To: <4dd2a6de-75dd-c9bc-f699-28a53d9e83fa@suse.com>
 <7637d382-e237-be08-1d7b-6b5819f52bea@suse.com>
Subject: Re: [Xen-devel] [PATCH v3 1/2] efi: remove old
 SetVirtualAddressMap() arrangement
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============7379812387428280033=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7379812387428280033==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tcC6YSqBgqqkz7Sb"
Content-Disposition: inline


--tcC6YSqBgqqkz7Sb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] efi: remove old SetVirtualAddressMap() arrangement

On Wed, Oct 23, 2019 at 05:15:42PM +0200, Jan Beulich wrote:
> On 13.10.2019 00:11, Marek Marczykowski-G=C3=B3recki  wrote:
> > @@ -1099,9 +1096,6 @@ static void __init efi_exit_boot(EFI_HANDLE Image=
Handle, EFI_SYSTEM_TABLE *Syste
> > =20
> >      /* Adjust pointers into EFI. */
> >      efi_ct =3D (void *)efi_ct + DIRECTMAP_VIRT_START;
> > -#ifdef USE_SET_VIRTUAL_ADDRESS_MAP
> > -    efi_rs =3D (void *)efi_rs + DIRECTMAP_VIRT_START;
> > -#endif
>=20
> This doesn't get re-instated in any way by patch 2.=20

This commit remove dead code.

> How come you
> get away without?=20

The second patch doesn't just fix what was under #ifdef
USE_SET_VIRTUAL_ADDRESS_MAP. It does a completely different approach to
using SetVirtualAddressMap. See below.

On Wed, Oct 23, 2019 at 05:26:48PM +0200, Jan Beulich wrote:
> On 13.10.2019 00:11, Marek Marczykowski-G=C3=B3recki  wrote:
> > @@ -1591,10 +1576,6 @@ void __init efi_init_memory(void)
> >          return;
> >      }
> > =20
> > -#ifdef USE_SET_VIRTUAL_ADDRESS_MAP
> > -    efi_rs->SetVirtualAddressMap(efi_memmap_size, efi_mdesc_size,
> > -                                 mdesc_ver, efi_memmap);
> > -#else
> >      /* Set up 1:1 page tables to do runtime calls in "physical" mode. =
*/
>=20
> This comment, btw, also wants either adjusting or removing.

No, it still setup 1:1 page tables for the runtime calls, exactly as it
was before. This is also why I don't need to adjust efi_rs. The only
difference is now (with patch 2) we tell UEFI about it. But the actual
address space layout for the runtime calls is exactly as it was before.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--tcC6YSqBgqqkz7Sb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2wc4sACgkQ24/THMrX
1yyu9Af+KSOpEi7P+TMs/wUd0srcyaMWMGV/mkZEfkMd9JLrzJwf1gweF9tRW7DK
efTSXr3D+xGzgwqec2VMyFeBMA2UPutQUMH+qOp5tsQDXTdZvM8yXOkemZyecZOQ
8ADngrIAJ23OTihdADuDy7CElgqv44zb9Su7pWvEm2NMcw/2NwtrGLISjZvAG7Zt
uPZ365vW61Vw7pvXpqM5F6N6fbXsDtiZxgVlmJTxMQhQIrwZkVuhGJOFAXoinNI/
bCGDw6WAEND4iMx94WbVZeDxFXT2Iz+YBNntLDH0eB/vRnQy2/cLkTokGPpnh0mp
H6gm0+8kQATTEdURkKKpyIP+fIagXg==
=NPM6
-----END PGP SIGNATURE-----

--tcC6YSqBgqqkz7Sb--


--===============7379812387428280033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7379812387428280033==--

