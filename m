Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ABF987469
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 15:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805478.1216608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stoWR-0000ny-3J; Thu, 26 Sep 2024 13:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805478.1216608; Thu, 26 Sep 2024 13:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stoWQ-0000lO-WD; Thu, 26 Sep 2024 13:27:07 +0000
Received: by outflank-mailman (input) for mailman id 805478;
 Thu, 26 Sep 2024 13:27:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vykh=QY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1stoWP-0000lI-EO
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 13:27:05 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03e54491-7c0b-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 15:27:03 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id B7BE4138042B;
 Thu, 26 Sep 2024 09:27:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Thu, 26 Sep 2024 09:27:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Sep 2024 09:26:59 -0400 (EDT)
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
X-Inumbo-ID: 03e54491-7c0b-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1727357221;
	 x=1727443621; bh=cmQb7wdRn0sFvKcqcUC4ba/HvOwE+mgFCxX5FOdI8kA=; b=
	da8OhfYx4Yu7aT4d7ojEHZhHUjCM3qgOosg8LVJ+7gUM22b4+/jQJwcwZul8DiXw
	7Oa2lO34MOYL+NHc8QLvKVSea0HmDl/gGj/AJ2wUE9zv1FkdT0hduCe0iWJ5QKaD
	nk2SQxeSnsePywriffUBQlE73W0Ft2DGqIT3+PSDujhc4dUS8f1OmDGB0WQ8jKl+
	/XmsrTHgNWrjSHKfru2pT02CIIh612mKvhLHqhKHy3wRxzPP8bqxCUYKL3EW3ZXO
	cRIkP8BQSkQ1OxQ/wROBrVhLvPbN+D2USVaTy/1+UDlXXNneUjed2RwbMNpjxXiW
	K8qphT1DwkeHsIxv+sfHjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727357221; x=1727443621; bh=cmQb7wdRn0sFvKcqcUC4ba/HvOwE
	+mgFCxX5FOdI8kA=; b=afjmZ8j2DK98oiQXdBxiBuW6Dp6KMfdvRSsu2/xnQZXh
	6TlbcbOLtt13TyxUVPlwjUd59yHiJLYpO9Swjdfk4Mh8GGjOiJMwfgqr2rUI69+4
	jLkdbHVjmV46eXrKHHi9SHcMEHZnjdg3IVXYBSlwZI+joEXF27QKdrla5cQjOJ0n
	2/oqrL+9gocYzxDWwjY0hPWW9/3QkiS8GmnYajnngeRUXq9suufBDErNPR5jIdTy
	iCSGn2EoeerFgimOlbTgmgg/Hx6Y+/EH4nmdYyD2Iz/T/hqI2/GEtWriA7/Nqck8
	q3eHWhMVdwNI0Wu2oovFandcSIMnG8vXxR/ml/dzxQ==
X-ME-Sender: <xms:JWH1ZlNOYPTS_sBmsAg4DfXkOVxfrPojNkz0rt-kt4JYVwppzWavVw>
    <xme:JWH1Zn8H2gmCr8fEjOOtMZSaZEzHglJXb9qA9EDwqLG1pguo-AUgDE0jF5pNHr4wI
    hlf89AgXZpJQg>
X-ME-Received: <xmr:JWH1ZkSjBResPwJ2-E10_EYB8wEatRDRp6tdhMJtPIq3fRTMRhx2k8MmamJa-cFB7sNu40hpKoGXgT1J5Ay2d4jwVM_ARUIz4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtjedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepueekteetgefggfekudehteegieeljeejieeihfejgeevhfetgffgte
    euteetueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegtlhhouh
    gurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhho
    jhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhsohhluh
    htihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:JWH1ZhsIqZ3iKfGwQ4lmoTXGGp_ApYD4XEd5mzhDocKKo_cgG2L7ng>
    <xmx:JWH1Ztd5aB1OOYze0wcOb0f248coLlRXzgXb5T-CgmcTRq1zlEiflg>
    <xmx:JWH1Zt2mDaiUIpHR-40A_E7ELbj-ZeYaTMFMto3pFwqYgu5Z2PMlww>
    <xmx:JWH1Zp8rFL5ZwaNyk-wczm128MvkkPcRqGf-xBD3MWBo2biR2UElwA>
    <xmx:JWH1Zk7vnWvpKld4LGDb-PenkOKtgLvuJc-2G3Cua-zwPYAFCb9EXCTy>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 26 Sep 2024 15:26:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4] Avoid crash calling PrintErrMesg from efi_multiboot2
Message-ID: <ZvVhIYMTuRU2Erqe@mail-itl>
References: <20240819142953.415817-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yl0hxUJmFX20aVf/"
Content-Disposition: inline
In-Reply-To: <20240819142953.415817-1-frediano.ziglio@cloud.com>


--Yl0hxUJmFX20aVf/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Sep 2024 15:26:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4] Avoid crash calling PrintErrMesg from efi_multiboot2

On Mon, Aug 19, 2024 at 03:29:52PM +0100, Frediano Ziglio wrote:
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
>   RIP  - 000000007DC29E46, CS  - 0000000000000038, RFLAGS - 0000000000210=
246
>   RAX  - 0000000000000000, RCX - 0000000000000050, RDX - 0000000000000000
>   RBX  - 000000007DAB4558, RSP - 000000007EFA1200, RBP - 0000000000000000
>   RSI  - FFFF82D040467A88, RDI - 0000000000000000
>   R8   - 000000007EFA1238, R9  - 000000007EFA1230, R10 - 0000000000000000
>   R11  - 000000007CF42665, R12 - FFFF82D040467A88, R13 - 000000007EFA1228
>   R14  - 000000007EFA1225, R15 - 000000007DAB45A8
>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>   GS   - 0000000000000030, SS  - 0000000000000030
>   CR0  - 0000000080010033, CR2 - FFFF82D040467A88, CR3 - 000000007EC01000
>   CR4  - 0000000000000668, CR8 - 0000000000000000
>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>   GDTR - 000000007E9E2000 0000000000000047, LDTR - 0000000000000000
>   IDTR - 000000007E4E5018 0000000000000FFF,   TR - 0000000000000000
>   FXSAVE_STATE - 000000007EFA0E60
>   !!!! Find image based on IP(0x7DC29E46) (No PDB)  (ImageBase=3D00000000=
7DC28000, EntryPoint=3D000000007DC2B917) !!!!
>=20
> After the patch:
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: Buffer too small
>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF=
6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4A=
F6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>=20
> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platfo=
rms")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

I was hoping it would fix also an issue with xen.efi as the crash is
pretty similar
(https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-236683513=
6),
but it seems to be something different.

Anyway,=20

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  xen/common/efi/boot.c | 46 ++++++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 14 deletions(-)
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
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index efbec00af9..fdbe75005c 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -287,19 +287,36 @@ static bool __init match_guid(const EFI_GUID *guid1=
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
> +#define ERROR_MESSAGE_LIST \
> +    ERROR_MESSAGE(EFI_NOT_FOUND, "Not found") \
> +    ERROR_MESSAGE(EFI_NO_MEDIA, "The device has no media") \
> +    ERROR_MESSAGE(EFI_MEDIA_CHANGED, "Media changed") \
> +    ERROR_MESSAGE(EFI_DEVICE_ERROR, "Device error") \
> +    ERROR_MESSAGE(EFI_VOLUME_CORRUPTED, "Volume corrupted") \
> +    ERROR_MESSAGE(EFI_ACCESS_DENIED, "Access denied") \
> +    ERROR_MESSAGE(EFI_OUT_OF_RESOURCES, "Out of resources") \
> +    ERROR_MESSAGE(EFI_VOLUME_FULL, "Volume is full") \
> +    ERROR_MESSAGE(EFI_SECURITY_VIOLATION, "Security violation") \
> +    ERROR_MESSAGE(EFI_CRC_ERROR, "CRC error") \
> +    ERROR_MESSAGE(EFI_COMPROMISED_DATA, "Compromised data") \
> +    ERROR_MESSAGE(EFI_BUFFER_TOO_SMALL, "Buffer too small")
> +
> +    static const struct ErrorStrings {
> +        CHAR16 start;
> +#undef ERROR_MESSAGE
> +#define ERROR_MESSAGE(code, str) CHAR16 msg_ ## code[sizeof(str)];
> +        ERROR_MESSAGE_LIST
> +    } ErrorStrings __initconst =3D {
> +        0
> +#undef ERROR_MESSAGE
> +#define ERROR_MESSAGE(code, str) , L ## str
> +        ERROR_MESSAGE_LIST
> +    };
> +    static const uint16_t ErrCodeToStr[] __initconst =3D {
> +#undef ERROR_MESSAGE
> +#define ERROR_MESSAGE(code, str) \
> +        [~EFI_ERROR_MASK & code] =3D offsetof(struct ErrorStrings, msg_ =
## code),
> +        ERROR_MESSAGE_LIST
>      };
>      EFI_STATUS ErrIdx =3D ErrCode & ~EFI_ERROR_MASK;
> =20
> @@ -308,7 +325,8 @@ static void __init PrintErrMesg(const CHAR16 *mesg, E=
FI_STATUS ErrCode)
>      PrintErr(L": ");
> =20
>      if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
> -        mesg =3D ErrCodeToStr[ErrIdx];
> +        mesg =3D (const CHAR16 *)((const void *)&ErrorStrings +
> +                                ErrCodeToStr[ErrIdx]);
>      else
>      {
>          PrintErr(L"ErrCode: ");
> --=20
> 2.46.0
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Yl0hxUJmFX20aVf/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmb1YSEACgkQ24/THMrX
1ywApAgAh6EW15W5OTyKG+qf7EnYTM8J4Tl2PH/UZkQLWo4DHM4siC4C220PiWft
rsg3f7n44Rx4kTt8pMYekDPzMArSSKCGTv7+ZqN35uTduyLEWftr9mDOpNWWNMCG
Q9btXKAaqZDpf2j3r9rXTo4Ew4TbqllL7jn9iY41MS07KSYPORhrFj7bzA5YbMbG
IGwCMRGy6/a26btmxVCTwWpV7kN0OryT+XAnUhiShSEUsLnaApWIuupDHpJ7rWJS
H1ustehQOS04yRrwUNJZteYYV+zaTc1RIW6h8p56LtSmbVLadBipe3wsSe2i14KO
T62VvgLznnQPZnl2P+6ru5pdMs88Hw==
=tDdC
-----END PGP SIGNATURE-----

--Yl0hxUJmFX20aVf/--

