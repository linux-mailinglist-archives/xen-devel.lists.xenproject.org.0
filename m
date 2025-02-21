Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ACCA400A3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 21:20:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894633.1303352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZVW-0001p1-UA; Fri, 21 Feb 2025 20:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894633.1303352; Fri, 21 Feb 2025 20:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZVW-0001mv-RC; Fri, 21 Feb 2025 20:20:22 +0000
Received: by outflank-mailman (input) for mailman id 894633;
 Fri, 21 Feb 2025 20:20:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RpDQ=VM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tlZVV-0001mp-68
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 20:20:21 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 440f4a2f-f091-11ef-9aa9-95dc52dad729;
 Fri, 21 Feb 2025 21:20:18 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id CED981380A34;
 Fri, 21 Feb 2025 15:20:16 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Fri, 21 Feb 2025 15:20:16 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Feb 2025 15:20:15 -0500 (EST)
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
X-Inumbo-ID: 440f4a2f-f091-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740169216;
	 x=1740255616; bh=4nx5OsEQ1aCYueNT1AuN3Ch8m17bxtEXktqO1d3x9Hc=; b=
	HyRc0jDfpWVBgpNPtua5AEqZbCxYjoiJ9vgG3Z233RSzjUmd2mNiHJw/ElOnQe8c
	RTXWiTqgAL7q/tgt8AqY9lnAP/xi+/b4kBNqGV+tO6xLOfbeP2rORTyr39uoN7dW
	6aI+auDjL86I7Kgt1s2t/+L1mHetW0ZzfXI39TbR7PkpylQOxdowt5k802+j9GCL
	9islfUT3SqB8kdUtIJUb2gD2Fg4yAeIBiKfdmL5z6q4sEB7JUPePdMWPgMy196CH
	Gu7WwSv1YyfwuTyKw9PxNvgmKJVBO+SsdxxsHG5wxtGZSMETdFnTghnoZXj4SFwU
	zUo8K1NY6fdYUsXN8OzwfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740169216; x=1740255616; bh=4nx5OsEQ1aCYueNT1AuN3Ch8m17bxtEXktq
	O1d3x9Hc=; b=Y4IGkbN/TxsoFZT2+pTlpkBaCz7sK6MLTmk94mMRJp8XrGa1tFZ
	bGmKf5SYT9JirbVDSoAgEFs+7cQG6uTHDA8fxFWs69HG5AN+A5RuWyboChVOK3WM
	x8zRVGW6sr4AZzikAysxRahvLJ+Y3cSKcUpoTDxNv8cEJDBwilWQPhZr7iAb46KX
	w1R54UxUzM5bzR5OIKPatk9LRhCAvzLTCFxEKxYj3l/yqIMoAMJzQNKu1GMSblvG
	Zov/RrVKRbGkLszHNANyhzmiRyAXT2qYWA3RcSCNyoracYJf4+Tm4HauFEFWL0nl
	WSTi29Ft+h0w48dPsRMmE9Ty5GyPi3Jyu7w==
X-ME-Sender: <xms:AOC4Z7ETOdUSlPvwK-ZtpFHKdGsMhG0zvIvu4INfZ-hEDcVcYEjnCA>
    <xme:AOC4Z4WEIP6ntLWGnjQDBGTsn7lgvlcnhaUSR2MYfqazgw8hWuF16jGNud7lDxt_n
    I4TI94eKwsgvA>
X-ME-Received: <xmr:AOC4Z9JC5OKbuA8DOzKHxxAA8PXTMPgcTOXeWTFiJn132RTE_MnNT5JJay9e1_AG5klg4PCLte3WZpkD0jC85GYdF_9pnwVBgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejtdelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeevueejteegleelteduueevhfetgfffjeevtddvgfeiveehteehle
    egueelvdejveenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepfhhrvgguihgrnhhordiiihhglhhiohestghloh
    huugdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhr
    ohhjvggtthdrohhrghdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholh
    huthhiohhnshdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhm
X-ME-Proxy: <xmx:AOC4Z5GLtKlmGiBFvoZUpl4c48PHrtZXWy5_kBC5mK0hEw4OAXqs-Q>
    <xmx:AOC4ZxV3MxuMS4eYegCTu_D_HjKIJkc6815JVZknkKWFP-59IOu79w>
    <xmx:AOC4Z0MuKVDSwBoa3y2zD7vU339afGviaEHg8nfEwwQTIVGeehk6Iw>
    <xmx:AOC4Zw12elPd9xiLe2gUI-QwBcagoKx7fnngX6BJGKJhRKt_ds1G6A>
    <xmx:AOC4Z3zZ7UkbaURBWItLPzZlVqgRrGjp3_-BV3of30Oast2qginU98Y3>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 21 Feb 2025 21:20:13 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
Message-ID: <Z7jf_YojU9tQ1Or7@mail-itl>
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P6iS3y5q3eGVPXcj"
Content-Disposition: inline
In-Reply-To: <20250217162659.151232-1-frediano.ziglio@cloud.com>


--P6iS3y5q3eGVPXcj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Feb 2025 21:20:13 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2

On Mon, Feb 17, 2025 at 04:26:59PM +0000, Frediano Ziglio wrote:
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

I tried testing this patch, but it seems I cannot reproduce the original
failure...

I did as the commit message suggests here:
https://gitlab.com/xen-project/people/marmarek/xen/-/commit/ca3d6911c448eb8=
86990f33d4380b5646617a982

With blexit() in PrintErrMesg(), it went back to the bootloader, so I'm
sure this code path was reached. But with blexit() commented out, Xen
started correctly both with and without this patch... The branch I used
is here:
https://gitlab.com/xen-project/people/marmarek/xen/-/commits/automation-tes=
ts?ref_type=3Dheads

Are there some extra condition to reproduce the issue? Maybe it depends
on the compiler version? I guess I can try also on QEMU, but based on
the description, I would expect it to crash in any case.

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
> 2.34.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--P6iS3y5q3eGVPXcj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAme43/0ACgkQ24/THMrX
1yzwMQf+Ix3Nt+8oiBRKW/DBPwaCCvWZwXbn0vH4cHwvJew99bfVHIZOYMDZamK6
sp8uPk3RMYrXC3XRQCVpl93/RSuuJdJnvsqu0WHEOm3KBIgcIxEAeUglkAS4Wy5g
qXKRWQBvW+zHWMvRI+o3n2aMbL1zo9lFC1yi2uHcTKx7v8qPOQc/EhucD/DMHf1O
HhqKe0QiI8q2SYXJTVmlVLKFjq1Da+ZMAvY4I1JX1ceAbihhi5vvK77wN7UJOCNe
Ne4sRCu5sCUXg00vf/xIv/Z+vNZG1A0QBzOYU1/jqgomX2FUa+fz2IA//LRh9d81
gvpNyAAMHtIDMI2EErtlqPsoOAF6wQ==
=cPSM
-----END PGP SIGNATURE-----

--P6iS3y5q3eGVPXcj--

