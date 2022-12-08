Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB229646C04
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 10:37:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456980.714790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3DKd-0005tZ-DG; Thu, 08 Dec 2022 09:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456980.714790; Thu, 08 Dec 2022 09:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3DKd-0005qT-9z; Thu, 08 Dec 2022 09:36:43 +0000
Received: by outflank-mailman (input) for mailman id 456980;
 Thu, 08 Dec 2022 09:36:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cZLP=4G=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p3DKb-0005qJ-AQ
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 09:36:41 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf8869c9-76db-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 10:36:39 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 025BA320093A;
 Thu,  8 Dec 2022 04:36:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 08 Dec 2022 04:36:35 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 04:36:33 -0500 (EST)
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
X-Inumbo-ID: cf8869c9-76db-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670492194; x=
	1670578594; bh=axTHPjCYIY7v4hk+IL1iyoNxN1SQsTLkjsr3Ouv2Kpk=; b=m
	lnbRwu5fg92kbIsN3cmLWI/Ert+e/OFNvcZ8EGASh9mZbtiKW8ljC7vpy55vz2WH
	CLT5sX0x7SKXgcJdWsfw/3BAGiQRqCL/H9NdbKItvCoz+G3ghmImlRoAxiFS7JPY
	2yS8hCPIIyMWPLuZJdtwtc03PJm44OjCD26PlyV+Wo3PNnd5nMTwELkQVVULBH/b
	vzUsaNOwVBmXTBVaSiAYTClKZwIBcIT97wYA7FkdIEvIWg21+iAr4VPsoiZ3plhw
	yZFSmkAiZIpgK9GLAb7EMLAwP1Mgebrc1frxNmvv5/AQPiEFD+Pe4FAG4GyNMkK2
	3tuvEdRYwl01mzeZp1tOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670492194; x=1670578594; bh=axTHPjCYIY7v4hk+IL1iyoNxN1SQ
	sTLkjsr3Ouv2Kpk=; b=BTGyEWC1e30J/qZG+ykFwZ1Ni33g2K7BC7S614NeVHBs
	DMnxoYCv+GrQOVNbGsgJpPglbpyyoYFdXsl/PLzpZcnbg42VYH5YnckcKNnOjHcY
	VFFpg6iq2hzfm/CI64wbvdO/WePS0frj5vj4HC+rh6b5pqfuwKH2MHO7cvp3LdZK
	ndPwGK/1LpiLQK5HHiqkEGg5phMDKgMDuMxRtLjA5zzlllpxW/+JwDBk2ezOmaAc
	gupZE0BxJYnT5eyApkbuKQGUXPdNpwR4y16zu0iqG/L07vYyKTTLx8byk/2nAjPs
	YLPhoEO4YYvNtPd5WwtMOMeLTTgTES77LhIZZ/7YGw==
X-ME-Sender: <xms:IrCRY1B-t_JAQlquwm2nvq1s_CODqtvAKi6lkVhoTNfiRg8oaugY6w>
    <xme:IrCRYzjEUk2KsAbw5CzCGHxz74_TdsSHEUm_Hg76qnE3tzV8GZmvyDTcxB7ZCBymo
    SghDyk4SWrdiTI>
X-ME-Received: <xmr:IrCRYwk0iLNJAveJioVK1oPjNc0i2UFrR_8FHkDB86kRUiKsS2jVLVSEi9yA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:IrCRY_yp7dpKjy2IyQ7tZ2BTxyTp8SkBXLKS_Nmh5RW1bAUS5WXfCg>
    <xmx:IrCRY6SMfTbiLRhdZjDGOGh-9iaFJ2kUgy21CqRG_h1tGFKvRxlcPQ>
    <xmx:IrCRYybW5l_KriSwYiDuLhctzoUlJkp1N3iw03nCbTrSGC7NxQrqUw>
    <xmx:IrCRY5EXQfdxXB2_-d-mtN-WPwedq3qPRH7f6P3t5p8tL34KiNIGKA>
Feedback-ID: iac594737:Fastmail
Date: Thu, 8 Dec 2022 04:36:27 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ard Biesheuvel <ardb@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Validate EFI memory descriptors
Message-ID: <Y5GwH41ipgN7J7Lg@itl-email>
References: <6936d67461716d8ba37ea8cc78743035c3e54e2d.1668832785.git.demi@invisiblethingslab.com>
 <24a8fb2d-b2a7-b319-ffa9-c5f4e0eca06c@suse.com>
 <Y5ESt70ylfow4WcQ@itl-email>
 <ea19b0b5-93b1-0608-b771-fdddb275f01b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6NWtnDPzVMF3PTMu"
Content-Disposition: inline
In-Reply-To: <ea19b0b5-93b1-0608-b771-fdddb275f01b@suse.com>


--6NWtnDPzVMF3PTMu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 8 Dec 2022 04:36:27 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ard Biesheuvel <ardb@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Validate EFI memory descriptors

On Thu, Dec 08, 2022 at 09:02:57AM +0100, Jan Beulich wrote:
> On 07.12.2022 23:23, Demi Marie Obenour wrote:
> > On Wed, Dec 07, 2022 at 11:04:05AM +0100, Jan Beulich wrote:
> >> On 07.12.2022 00:57, Demi Marie Obenour wrote:
> >>> It turns out that these can be invalid in various ways.  Based on code
> >>> Ard Biesheuvel contributed for Linux.
> >>>
> >>> Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
> >>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> >>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>
> >> This comes with the risk of breaking something that was previously wor=
king,
> >> despite a descriptor being bogus. This _may_ be deemed acceptable, but=
 it
> >> needs calling out and reasoning about in the description. Even more so=
 that
> >> elsewhere we're aiming at relaxing things (by default or via command l=
ine
> >> overrides) to remain compatible with all kinds of flawed implementatio=
ns.
> >=20
> > I decided to match Ard=E2=80=99s kernel patch, except for ignoring (as =
opposed
> > to using) descriptors that cover the entire 64-bit address space (and
> > thus have a length in bytes that overflows uint64_t).
> >=20
> > What do you propose Xen do instead?  A broken memory map is a rather
> > serious problem; it means that the actual physical address space is
> > unknown.  For Linux I am considering tainting the kernel (with
> > TAINT_FIRMWARE_WORKAROUND) if it detects an invalid memory descriptor.
>=20
> Much here depends on what brokenness we find in practice. I've been
> flamed more than once for insisting on strict spec compliance. I'd
> be fine with you making things more strict here, but then - as said -
> the risks need to be called out in the description, and once you've
> done so you'll likely realize yourself that hence there then needs
> to be a way out for systems where the new checking turns out too
> strict.

The purpose of these checks is actually to work around broken firmware.
If firmware were bug-free, there would be no point in validating the
data it provides.  That said, I am not sure if ignoring the broken
entries is the correct answer.  Could Xen fall back to getting the
information from ACPI?  Or could Xen somehow try to make sense of the
broken table?  For instance, Xen could sort the entries by start address
and force the end of each entry to at or before the start of the next.
This patch has the advantage that it closely matches what Linux will be
doing.  I trust Ard=E2=80=99s judgement on this better than my own.

> Tainting the hypervisor in the event of finding an issue is certainly
> an option.

I probably will not add such a mechanism, but if one exists I would be
happy to use it.

> >>> --- a/xen/common/efi/efi.h
> >>> +++ b/xen/common/efi/efi.h
> >>> @@ -51,3 +51,17 @@ void free_ebmalloc_unused_mem(void);
> >>> =20
> >>>  const void *pe_find_section(const void *image_base, const size_t ima=
ge_size,
> >>>                              const CHAR16 *section_name, UINTN *size_=
out);
> >>> +
> >>> +static inline UINT64
> >>> +efi_memory_descriptor_len(const EFI_MEMORY_DESCRIPTOR *desc)
> >>> +{
> >>> +    uint64_t remaining_space =3D UINT64_MAX - desc->PhysicalStart;
> >>
> >> This wants to derive from PADDR_BITS (or even paddr_bits) rather than
> >> using UINT64_MAX.
> >=20
> > paddr_bits is not available yet, but I can use PADDR_BITS.  That does
> > require an explicit overflow check, but that is fine.
>=20
> paddr_bits may or may not be available yet; it certainly is ...
>=20
> >>> --- a/xen/common/efi/runtime.c
> >>> +++ b/xen/common/efi/runtime.c
> >>> @@ -270,18 +270,17 @@ int efi_get_info(uint32_t idx, union xenpf_efi_=
info *info)
> >>>          for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
> >>>          {
> >>>              EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
> >>> -            u64 len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
> >>> +            uint64_t size, len =3D efi_memory_descriptor_len(desc);
>=20
> ... for this use.
>=20
> >>>              if ( info->mem.addr >=3D desc->PhysicalStart &&
> >>> -                 info->mem.addr < desc->PhysicalStart + len )
> >>> +                 info->mem.addr - desc->PhysicalStart < len )
> >>
> >> With what efi_memory_descriptor_len() does I don't see why this expres=
sion
> >> would need transformation - there's no overflow possible anymore.
> >=20
> > You are correct, but the new version is more idiomatic, IMO.
> >=20
> >>>              {
> >>>                  info->mem.type =3D desc->Type;
> >>>                  info->mem.attr =3D desc->Attribute;
> >>> -                if ( info->mem.addr + info->mem.size < info->mem.add=
r ||
> >>
> >> This overflow check is not superseded by the use of
> >> efi_memory_descriptor_len(), so if you think it is not (or no longer)
> >> needed, you will need to justify that in the description.
> >=20
> > The justification is that info->mem.size is no longer used except in
> > comparison and assignment, so the overflow check is now redundant.
>=20
> I don't see what "no longer" refers to - nothing changes in this regard
> before and after your patch, afaics.

The purpose of this check is to catch the case where info->mem.size +
info->mem.addr overflows.  In the new code, there is no need to
explicitly check for this situation, because info->mem.size +
info->mem.addr is never actually computed.  Instead, the size is
computed first, and if info->mem.size is larger than this, it is clamped
to the actual value.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--6NWtnDPzVMF3PTMu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmORsB8ACgkQsoi1X/+c
IsFxCQ//QioO011V5SCYmRykcoTw68CuPVM8Jh2JALw1izX5hPEzxSzoNT0nddBG
9nqEYZWkjpfCeomYB/ZRjo/jYSl5wkU30p1pJ4Ox33dKvfaIPzmeGZhIvIIuf5zN
DKh8j42G57+iUopJnUyKg9/02AL29uwcBa1H6PciLDS7JV4u2HNW4BDcZ13wRS/2
QrIvWt/HKab6uJQk4yEBlsvBpL7IcR6wrtnHiyc/egL4APF4TtVnVReZbCEwTU6L
t/QPYa2xaCj8nfLQQe2cQNKuHHSJXkxRCekH+795/NOD/sY86nOUfzs2/1pQqQzv
R0jwIF1IOybJyZJVES0rzOAKxcz2VvR8I32DDckJhrvno2cQ1u1gj90RlT7R7gKf
U9o1k7gF2+Z2+UoZKifLJjQuOMP9532wk0LKVkbLtgqkjgzFjuAV929c0CWT8ihC
nEq4s+cfgIsQ/C4V0WeuBFtOg4klFHaHi2vwH6750/fDFrOz9gpus3scdYMRyhqr
Mszxq9ziQahpiJwuRkV+IxiGY62YvJS4Yj91ly7rPCs/a2ws3x1GGsvE3BQO1JO6
11KDPTaO4TFWFNNH18URocQr9bCtIHv3zPYKRaOxhYpXP36SmlTxCmOZj1nF10u5
Ix2WecsWuwN4KAi1wj18ctmF5BXP7Dg3Nso1fQKAgeSMuSgj+t8=
=zywj
-----END PGP SIGNATURE-----

--6NWtnDPzVMF3PTMu--

