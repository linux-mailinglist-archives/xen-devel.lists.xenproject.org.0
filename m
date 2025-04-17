Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A28CAA911EE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 05:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956894.1350141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5FgQ-00007F-5c; Thu, 17 Apr 2025 03:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956894.1350141; Thu, 17 Apr 2025 03:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5FgP-00005N-WA; Thu, 17 Apr 2025 03:12:58 +0000
Received: by outflank-mailman (input) for mailman id 956894;
 Thu, 17 Apr 2025 03:12:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bAEg=XD=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u5FgO-00005H-G4
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 03:12:56 +0000
Received: from fout-a6-smtp.messagingengine.com
 (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d92761c2-1b39-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 05:12:52 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 4BA0B138021B;
 Wed, 16 Apr 2025 23:12:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Wed, 16 Apr 2025 23:12:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Apr 2025 23:12:49 -0400 (EDT)
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
X-Inumbo-ID: d92761c2-1b39-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744859571;
	 x=1744945971; bh=2GjRPS+ddX8pS6zlcgaNUhaltUO8C3UPVOnIlT9jlMo=; b=
	Z7L0Hx0k0yJ4gLCuZbvCc3vYPVxjiuJ9kqEhLdRuE3BFzBavYZPx6BsFUP25ZjY7
	/uoM7820oSJp59ZsdnEybtBiVsyNwPSsnl5hmD/04OQgaYeJkrCWR+JCr+v9lfNL
	+JEol4vP/Y/sUWiYVarehkuLPHu8dWYREE5QTeZss0LjQjCCZjttVhn10ja4SFj/
	vOW1WNR/EBWO+pOY4fP0sykz5z26oYOBkTvjULfwI6f/ckuLOgGu7nhyNN8bU/4c
	FRRW6DWkmS86muE1HHKM3Lw731pLkXuc7y0Xme8YIN8UVLeCl0/RVtbkfOVLpiGo
	JpxaEjWI5xnycxks8fPP4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744859571; x=1744945971; bh=2GjRPS+ddX8pS6zlcgaNUhaltUO8C3UPVOn
	IlT9jlMo=; b=wCsvJ4tBDG+wq9pLDmHb/n62t3wLuW6lHSmKXt1ziokFTAvFTfT
	cEDo8eAf1IgywlNuG8rSN7J9saUqwANjoa3M8OuS5k8QXLDiH9UCGIx/8vdEsCmn
	wF0xiT+KAgQtsEiYx8Gwqy4pfuYX4VVJ+smbscYA3m7IlnCszv2+eGuLQJY0DW0V
	TnXIsJ0+aYhMLDPm7XnO6sCHxRGAFNDWZLFmbEkozVTMu8ppYZNcAuCYGCxykErJ
	KraEdmS0EDAfe//XWrrGo6YfzRsOnEeZ/lejm309OMSRxiXgRhlvd5B/w54EmNgl
	Gy71hh+qXWXfAlEXhkbPsielUzP+UbP9+7Q==
X-ME-Sender: <xms:snEAaNgXNfgGJ7vb5qL_uMGT5QUo-wWTWNOg33xl5sY74GTsqg2lCw>
    <xme:snEAaCBTHfXgVXGZeGtor6EukMOpqAsbiTBeT8ByqyKwOtt1qFVmPxd8xTfPZpJZk
    xZ15E_wtc3QyA>
X-ME-Received: <xmr:snEAaNF8Cw-tOYWez3B-cS9_4gvfbd8c9uvjHn5Rz1Jrod_J-RfiJ4m4cbFSLJf00fIDDFfO_4jkrniJ-6PSzH9Y3XwD63mTRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdekudegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhr
    vgguihgrnhhordiiihhglhhiohestghlohhuugdrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegu
    phhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtghomhdprhgtphhtthhope
    hjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohho
    phgvrhefsegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:snEAaCRXl01J9RiHO0ThgEWmwyRPKd0QJrl1wfLFLCCu7Ugugs0LBg>
    <xmx:snEAaKw2Lss0yHR2KmAZmlLpZxhlREwTh4_a5TANK4iwX5dotxKnhg>
    <xmx:snEAaI5rQhc3qJdzKFhEOkG-4T54YuzVdjwklvCrOhO9PgND5XxOxQ>
    <xmx:snEAaPzwblEp_x20C1dezhaz3oUIqtaoFh_zUtZo9kedPM2MiZPvhQ>
    <xmx:s3EAaN0zcB703rUvmdBblyJoC4BzqoMISfdC4PG3TK3wtOUHv_tTYUFQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 17 Apr 2025 05:12:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7] Avoid crash calling PrintErrMesg from efi_multiboot2
Message-ID: <aABxr9W8_L3sQBHh@mail-itl>
References: <20250321103258.37425-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TCI/ONZ83qF/8yz1"
Content-Disposition: inline
In-Reply-To: <20250321103258.37425-1-frediano.ziglio@cloud.com>


--TCI/ONZ83qF/8yz1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Apr 2025 05:12:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7] Avoid crash calling PrintErrMesg from efi_multiboot2

On Fri, Mar 21, 2025 at 10:32:58AM +0000, Frediano Ziglio wrote:
> Although code is compiled with -fpic option data is not position
> independent. This causes data pointer to become invalid if
> code is not relocated properly which is what happens for
> efi_multiboot2 which is called by multiboot entry code.
>=20
> Code tested adding
>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> in efi_multiboot2 before calling efi_arch_edd (this function
> can potentially call PrintErrMesg).
>=20
> Before the patch (XenServer installation on Qemu, xen replaced
> with vanilla xen.gz):
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic =
ID - 00000000 !!!!
>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
>   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 0000000000210=
246
>   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 0000000000000010
>   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0C210
>   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
>   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 0000000000000000
>   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0C1B8
>   R14  - 000000007EA33328, R15 - 000000007EA332D8
>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>   GS   - 0000000000000030, SS  - 0000000000000030
>   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC01000
>   CR4  - 0000000000000668, CR8 - 0000000000000000
>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>   GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
>   IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
>   FXSAVE_STATE - 000000007FF0BDE0
>   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=3D00000000=
7EE20000, EntryPoint=3D000000007EE23935) !!!!
>=20
> After the patch:
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: Buffer too small
>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF=
6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4A=
F6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>=20
> This partially rollback commit 00d5d5ce23e6.
>=20
> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platfo=
rms")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

-no-jump-tables is available since clang 3.9.0 (and since GCC 4.1.0), so
with upgraded base toolchain requirements it's safe to commit this now.

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Changes since v1:
> - added "Fixes:" tag;
> - fixed cast style change.
>=20
> Changes since v2:
> - wrap long line.
>=20
> Changes since v3:
> - fixed "Fixes:" tag.
>=20
> Changes since v4:
> - use switch instead of tables.
>=20
> Changes since v5:
> - added -fno-jump-tables option.
>=20
> Changes since v6:
> - rebased.
> ---
>  xen/common/efi/boot.c        | 58 ++++++++++++++++++++++++------------
>  xen/common/efi/efi-common.mk |  1 +
>  2 files changed, 40 insertions(+), 19 deletions(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index efbec00af9..143b5681ba 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -287,33 +287,53 @@ static bool __init match_guid(const EFI_GUID *guid1=
, const EFI_GUID *guid2)
>  /* generic routine for printing error messages */
>  static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
>  {
> -    static const CHAR16* const ErrCodeToStr[] __initconstrel =3D {
> -        [~EFI_ERROR_MASK & EFI_NOT_FOUND]           =3D L"Not found",
> -        [~EFI_ERROR_MASK & EFI_NO_MEDIA]            =3D L"The device has=
 no media",
> -        [~EFI_ERROR_MASK & EFI_MEDIA_CHANGED]       =3D L"Media changed",
> -        [~EFI_ERROR_MASK & EFI_DEVICE_ERROR]        =3D L"Device error",
> -        [~EFI_ERROR_MASK & EFI_VOLUME_CORRUPTED]    =3D L"Volume corrupt=
ed",
> -        [~EFI_ERROR_MASK & EFI_ACCESS_DENIED]       =3D L"Access denied",
> -        [~EFI_ERROR_MASK & EFI_OUT_OF_RESOURCES]    =3D L"Out of resourc=
es",
> -        [~EFI_ERROR_MASK & EFI_VOLUME_FULL]         =3D L"Volume is full=
",
> -        [~EFI_ERROR_MASK & EFI_SECURITY_VIOLATION]  =3D L"Security viola=
tion",
> -        [~EFI_ERROR_MASK & EFI_CRC_ERROR]           =3D L"CRC error",
> -        [~EFI_ERROR_MASK & EFI_COMPROMISED_DATA]    =3D L"Compromised da=
ta",
> -        [~EFI_ERROR_MASK & EFI_BUFFER_TOO_SMALL]    =3D L"Buffer too sma=
ll",
> -    };
> -    EFI_STATUS ErrIdx =3D ErrCode & ~EFI_ERROR_MASK;
> -
>      StdOut =3D StdErr;
>      PrintErr(mesg);
>      PrintErr(L": ");
> =20
> -    if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
> -        mesg =3D ErrCodeToStr[ErrIdx];
> -    else
> +    switch (ErrCode)
>      {
> +    case EFI_NOT_FOUND:
> +        mesg =3D L"Not found";
> +        break;
> +    case EFI_NO_MEDIA:
> +        mesg =3D L"The device has no media";
> +        break;
> +    case EFI_MEDIA_CHANGED:
> +        mesg =3D L"Media changed";
> +        break;
> +    case EFI_DEVICE_ERROR:
> +        mesg =3D L"Device error";
> +        break;
> +    case EFI_VOLUME_CORRUPTED:
> +        mesg =3D L"Volume corrupted";
> +        break;
> +    case EFI_ACCESS_DENIED:
> +        mesg =3D L"Access denied";
> +        break;
> +    case EFI_OUT_OF_RESOURCES:
> +        mesg =3D L"Out of resources";
> +        break;
> +    case EFI_VOLUME_FULL:
> +        mesg =3D L"Volume is full";
> +        break;
> +    case EFI_SECURITY_VIOLATION:
> +        mesg =3D L"Security violation";
> +        break;
> +    case EFI_CRC_ERROR:
> +        mesg =3D L"CRC error";
> +        break;
> +    case EFI_COMPROMISED_DATA:
> +        mesg =3D L"Compromised data";
> +        break;
> +    case EFI_BUFFER_TOO_SMALL:
> +        mesg =3D L"Buffer too small";
> +        break;
> +    default:
>          PrintErr(L"ErrCode: ");
>          DisplayUint(ErrCode, 0);
>          mesg =3D NULL;
> +        break;
>      }
>      blexit(mesg);
>  }
> diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
> index 23cafcf20c..06b1c19674 100644
> --- a/xen/common/efi/efi-common.mk
> +++ b/xen/common/efi/efi-common.mk
> @@ -2,6 +2,7 @@ EFIOBJ-y :=3D boot.init.o pe.init.o ebmalloc.o runtime.o
>  EFIOBJ-$(CONFIG_COMPAT) +=3D compat.o
> =20
>  CFLAGS-y +=3D -fshort-wchar
> +CFLAGS-y +=3D -fno-jump-tables
>  CFLAGS-y +=3D -iquote $(srctree)/common/efi
>  CFLAGS-y +=3D -iquote $(srcdir)
> =20
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TCI/ONZ83qF/8yz1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgAca8ACgkQ24/THMrX
1yxXBgf+PTSXlLpxQfxCbYlKEJb/lMXA9xdvm5vI4Z+mnDTpn7TkkIoMoj+q03BY
l0YK0MsAVdzUl0cz8Em5ZyshY5WKa48pqB6gH5YU4ANQW1UVrCiOQTu9njt4mJyv
0tPUT4QIOLGyUWFl4Yx19IvNVo3ujOz1I750Yh8ZqMRLaDpIjzHl9GqMaY97Mj8f
DoL4rx2xrOf6N8xPE7tNuallhuvDl8x52sAWU8y/LMc/UGBOwZTZOMJAAIUC8S+o
JYuG5swUVfKYliJaKX3S455/Lggd7ZG6CQUS7Td1emr+dHHFtbAtkRy5GOWHod14
KKnkNhlQcXGvzp4GtMcBdvPFuM7nUA==
=lZKB
-----END PGP SIGNATURE-----

--TCI/ONZ83qF/8yz1--

