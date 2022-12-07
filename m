Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4A16463FF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 23:25:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456664.714443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p32qg-0002MT-C0; Wed, 07 Dec 2022 22:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456664.714443; Wed, 07 Dec 2022 22:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p32qg-0002K7-9E; Wed, 07 Dec 2022 22:25:06 +0000
Received: by outflank-mailman (input) for mailman id 456664;
 Wed, 07 Dec 2022 22:25:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sV5z=4F=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p32qe-0002Jz-Lm
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 22:25:04 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc0d4bb4-767d-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 23:25:02 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B9BA05C0193;
 Wed,  7 Dec 2022 17:24:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 07 Dec 2022 17:24:58 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 17:24:57 -0500 (EST)
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
X-Inumbo-ID: fc0d4bb4-767d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670451898; x=
	1670538298; bh=YCrBg7+FJXj+8+PsDfNntjcnGfyViKRN/i3g3VvzRoU=; b=b
	NaX6TgqKM35LEfiHikpKZP5ATr03U/FLVquaM31jG5fAICKpfOJ7C9NiqK0JHp5H
	/4hlaICZg0gDYwEjDJLFby4Z7BHC+0VkjZIs7Rjr1g/JvHQYk59yvHA/pqdWWRJJ
	TZmA3cgUk/nUzG4zbmPDG55FEFPUvt+gPgDVRSnie9DSjhtev6Bk5NWXwcUqp50u
	w76a+rd4EJRiOfwpyEQl5eJiTxJ71QOo6ECyrd4EIG8zeEN69a1uDayQYPnLh+9K
	hUa2wyvpo++VqxDRHrd/QgwDEqmluHcTUpAqXe85xEPpmkD50HrE7OYvV0M2t3Cd
	pnv4LscIJ5FrAzLxz85GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670451898; x=1670538298; bh=YCrBg7+FJXj+8+PsDfNntjcnGfyV
	iKRN/i3g3VvzRoU=; b=xLDpMHLgF+EVXJ6p4x8QsRyIX2k183FvGPUhuBpt+t9X
	wBdvuJpBXygejLKYttb163t3PdklN6xUvYx99jUgmPLEZ34nzJpOLkAQB2KZGF0Z
	spWadySXGxJ5SO27WExwMoup8DEfjOWpskD0Viwbdxic7+f8VXlJjsg3A/cZdS9F
	1QbQZTYVmA0e9fr+xvze2vvziuAqaqIFcC2Dl7t/lyvCgiD+NgcfvHJIQHPqkmCt
	3w6GpaYTBofxUwPieBwAZdd31n2cVywn9TEkXgPSh6aaJpzJxR627rag+eQFU6x7
	JHCDZ9mIvq0SjGd69OpQYFitTDfMglzdTw8eRC5hYA==
X-ME-Sender: <xms:uhKRY3KNsHlNvGkI7N4UMUqGpFCLb90ETzIMVq7Vg2D_QjaUNCPG5g>
    <xme:uhKRY7LBTvi8pMVNw7EbE-D1kmQDNop3eelKxU2AfiWsrLdhTWc2D1GT0vuwZWh-P
    tquvloWINtv_Pc>
X-ME-Received: <xmr:uhKRY_u8Bl99FZRPoVOF8O_TqcGmJPP7tTPCdpMLBqZFhoX1rLuHlwKHK-RE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdduiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:uhKRYwZl76nkJRD3EBb_VaaVi3_N5VzSI7cfbwW8ZJifSRETNI2kwA>
    <xmx:uhKRY-YrfQEru3RBdQwwwBnmA1TgWwQR1s5plBu-7p5_k83pIs-WHg>
    <xmx:uhKRY0DxqoTfQ8BETnwpgWfudAsl5b-g9oXPGHsGJ--0dL4StdobhA>
    <xmx:uhKRYzMzBMrUYgiqmO-s7zdJ8TmhOiBCZ0zajIaQfVipOmyt56_P0Q>
Feedback-ID: iac594737:Fastmail
Date: Wed, 7 Dec 2022 17:23:49 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ard Biesheuvel <ardb@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Validate EFI memory descriptors
Message-ID: <Y5ESt70ylfow4WcQ@itl-email>
References: <6936d67461716d8ba37ea8cc78743035c3e54e2d.1668832785.git.demi@invisiblethingslab.com>
 <24a8fb2d-b2a7-b319-ffa9-c5f4e0eca06c@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LY+QlSqvdJc8beX4"
Content-Disposition: inline
In-Reply-To: <24a8fb2d-b2a7-b319-ffa9-c5f4e0eca06c@suse.com>


--LY+QlSqvdJc8beX4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 7 Dec 2022 17:23:49 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ard Biesheuvel <ardb@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Validate EFI memory descriptors

On Wed, Dec 07, 2022 at 11:04:05AM +0100, Jan Beulich wrote:
> On 07.12.2022 00:57, Demi Marie Obenour wrote:
> > It turns out that these can be invalid in various ways.  Based on code
> > Ard Biesheuvel contributed for Linux.
> >=20
> > Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>=20
> This comes with the risk of breaking something that was previously workin=
g,
> despite a descriptor being bogus. This _may_ be deemed acceptable, but it
> needs calling out and reasoning about in the description. Even more so th=
at
> elsewhere we're aiming at relaxing things (by default or via command line
> overrides) to remain compatible with all kinds of flawed implementations.

I decided to match Ard=E2=80=99s kernel patch, except for ignoring (as oppo=
sed
to using) descriptors that cover the entire 64-bit address space (and
thus have a length in bytes that overflows uint64_t).

What do you propose Xen do instead?  A broken memory map is a rather
serious problem; it means that the actual physical address space is
unknown.  For Linux I am considering tainting the kernel (with
TAINT_FIRMWARE_WORKAROUND) if it detects an invalid memory descriptor.

> > --- a/xen/common/efi/efi.h
> > +++ b/xen/common/efi/efi.h
> > @@ -51,3 +51,17 @@ void free_ebmalloc_unused_mem(void);
> > =20
> >  const void *pe_find_section(const void *image_base, const size_t image=
_size,
> >                              const CHAR16 *section_name, UINTN *size_ou=
t);
> > +
> > +static inline UINT64
> > +efi_memory_descriptor_len(const EFI_MEMORY_DESCRIPTOR *desc)
> > +{
> > +    uint64_t remaining_space =3D UINT64_MAX - desc->PhysicalStart;
>=20
> This wants to derive from PADDR_BITS (or even paddr_bits) rather than
> using UINT64_MAX.

paddr_bits is not available yet, but I can use PADDR_BITS.  That does
require an explicit overflow check, but that is fine.

> > --- a/xen/common/efi/runtime.c
> > +++ b/xen/common/efi/runtime.c
> > @@ -270,18 +270,17 @@ int efi_get_info(uint32_t idx, union xenpf_efi_in=
fo *info)
> >          for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
> >          {
> >              EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
> > -            u64 len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
> > +            uint64_t size, len =3D efi_memory_descriptor_len(desc);
> > =20
> >              if ( info->mem.addr >=3D desc->PhysicalStart &&
> > -                 info->mem.addr < desc->PhysicalStart + len )
> > +                 info->mem.addr - desc->PhysicalStart < len )
>=20
> With what efi_memory_descriptor_len() does I don't see why this expression
> would need transformation - there's no overflow possible anymore.

You are correct, but the new version is more idiomatic, IMO.

> >              {
> >                  info->mem.type =3D desc->Type;
> >                  info->mem.attr =3D desc->Attribute;
> > -                if ( info->mem.addr + info->mem.size < info->mem.addr =
||
>=20
> This overflow check is not superseded by the use of
> efi_memory_descriptor_len(), so if you think it is not (or no longer)
> needed, you will need to justify that in the description.

The justification is that info->mem.size is no longer used except in
comparison and assignment, so the overflow check is now redundant.

> > -                     info->mem.addr + info->mem.size >
> > -                     desc->PhysicalStart + len )
> > -                    info->mem.size =3D desc->PhysicalStart + len -
> > -                                     info->mem.addr;
> > +                size =3D desc->PhysicalStart + len - info->mem.addr;
> > +                if ( info->mem.size > size )
> > +                    info->mem.size =3D size;
> > +
> >                  return 0;
> >              }
>=20
> Is there any functional change in here that I'm overlooking, or are you
> merely converting this code to meet your personal taste? In the latter
> case I'd prefer if you left the code untouched, with the 2nd best option
> being to split it to a separate (style only) patch, and the 3rd option
> being to at least mention this as a no-op (style only) transformation in
> the description.

There should be no functional change here, but IMO the new version is
much easier to read: first compute the actual size, and if the provided
size is larger, clamp it.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--LY+QlSqvdJc8beX4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmORErcACgkQsoi1X/+c
IsG9sA/9HM3GTy6dx+ZdtZjxpUhX1z8pacDI+ASVDnL65IsY4X/8wVVlzLmSg53r
rrjtIGBk3riFSlwj9kMy1OKxz528zNLHq806ml1o7VxJ5ctrtgyiw8FknSY1EtGP
ep/FUb+/SwQ1Ktf3l7KqCbfIdk2nXwtC8Zca9WcPQkDzyVjzcPjErFeV11h5S11f
Pe4gpQlR+zz0ogT4eiQ+q758QmNMtIWbi0h4W0lBKs8uCwEtCgVV+6G2GbvOg73j
t33Mkgsx6dNjjIMqoK4VBcJH5sjHH6XSIRKNxGzDjAV8AiKkS/uTgvvopb87hx3Y
nY1B7UAjYlhFYcfPwh45qpgoz2HBRkd4emfIlUgr115bivo8YN1YpuqnqZw10AIr
8PfmKSwulE9vlQ5shC5e/i0fnvFFpzLjStDmxLWCaYrhwQy2q7k2JOgmvWGJGivJ
j2fhdeKlmG/li6eEerK4B4WebVGzBy5g3Phc9Qtelnn+804qoN5u1fXeWa0PrU4o
/2gISoEePv1EhDfj85GURlHm7+4bn8buI7SE2r5FOLucPjTENb0wgtR1TVuEugd8
9MmatNey8DshIVJuroXD39VMkVDWm9M9rqdR6NZClCmGjojm7XqVzD/i0nVzvl1i
gP7Mlg1plLoySHHSw1ZefttmZWJY//uA0mD9JwHbGa54LktTz9Y=
=ST60
-----END PGP SIGNATURE-----

--LY+QlSqvdJc8beX4--

