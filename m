Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E3AA4204A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 14:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895158.1303752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmYKR-0002C0-98; Mon, 24 Feb 2025 13:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895158.1303752; Mon, 24 Feb 2025 13:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmYKR-00028z-5i; Mon, 24 Feb 2025 13:16:59 +0000
Received: by outflank-mailman (input) for mailman id 895158;
 Mon, 24 Feb 2025 13:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0/+e=VP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tmYKP-00028t-8D
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 13:16:57 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c863948-f2b1-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 14:16:52 +0100 (CET)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id 7C8161380861;
 Mon, 24 Feb 2025 08:16:51 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Mon, 24 Feb 2025 08:16:51 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Feb 2025 08:16:50 -0500 (EST)
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
X-Inumbo-ID: 9c863948-f2b1-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740403011;
	 x=1740489411; bh=0fq7ZhcANcc8jWqX+efK/V4kMVWhc7vDZc6noEDQrQU=; b=
	GCxeaivRvZEwReg7DQJN8bdELGzGVu/y3/oBs2We5eVmkb9pRSVV+kXEAA8Mhpe8
	tbkMoubK4ALta3i8KMk2ru5MR0u5jCIPYcSaUrooJGmtxBfd8psxP4BTE51k9831
	M8p/Rg8VRo24QxRYMyKwYL9KmB+1xt/GxN52A+MPObkVBOpSa/teRIr1oqouQoSs
	H1InqPxC88yrUpMEsYO5I8zlBHGARMPMnjBuOf57xPyuCu5i52cbc9ADhkCMsZri
	ao3YFqv6tmDRW5O3M8RM8/R1353MnfcFzyPUeADb/7L5a1ySuYTYFShQXozRZ0Oo
	l5XjQBbBTzcK/NPin5Re+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740403011; x=1740489411; bh=0fq7ZhcANcc8jWqX+efK/V4kMVWhc7vDZc6
	noEDQrQU=; b=qGFXls0J+Iey4A1PSEEbJQDhYy9t046aUulDe4EtjIqwhLJbMcm
	0hP+ukCb5L5nb3ycUa07LWdhX+wk6zQIpj3BP3LUBgWIDRWN0BfqA/ZIMQe++zg6
	AiXBrc2uxa1PZAQ0WhngwJkxI+W2+ZE6EYxuVT5EBUsqdJKjxMUkC7xangMk0Z4C
	sVEplZt8gIZKUDToA1E436o5ZKUEhWQyeF0LUQggebx5s7tzAOdxUTlJd5ecQ8Q0
	TT1DmYfncEuqV6r/kDQE9mRplYZCFOjLYuRy/RYx3wj77e/ePS9Va9vYMhwc2tie
	j4wOMlhw01Bab+7NoV8NifBjWsMiHbyFsVQ==
X-ME-Sender: <xms:Q3G8ZzfQVkJiHgEBakFiXxIwbPgHEcxS-ALsXv8ubigH7iFeGLrZjQ>
    <xme:Q3G8Z5MtsiohtUzRocJnYwyicHvscwL4QLvqQCjJ7kUSEbRyhrmNKvopkboJT_ZSv
    kdyMxtZHhwnBQ>
X-ME-Received: <xmr:Q3G8Z8jRs7f7WAUGU-WqBtFOlu-RaHQMB8Afk7-Ljrz-jmck8pL6Io8hsj48iUOVwdUUhZvknPQMrYI65D19bSqdNyo9kypIFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeekkecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Q3G8Z09uTd_4VoF6Ogwq55CEtNjoyEYWnuum3wEg3WX8iHJrvFlEgg>
    <xmx:Q3G8Z_u1KhTMClZY-iEoEs1tf88IhT4VjtrQLxVRyhbf3R7fBUhvxQ>
    <xmx:Q3G8ZzGa-eM_bfENYtnzCLDh90OCtln6UTWG9s9_KY9b1iG1soBTSQ>
    <xmx:Q3G8Z2M-mGeR_H2baNXuyBWUYIukJRwjEDBe3TlJw8o4LeBKIt4R5w>
    <xmx:Q3G8Z5IWoL8CsxehqTW3wAjsq-h09yrCAuFzZ3Eoco_8fx1xah8i5Dpl>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 24 Feb 2025 14:16:47 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
Message-ID: <Z7xxQHVdSGwig4hb@mail-itl>
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <Z7jf_YojU9tQ1Or7@mail-itl>
 <CACHz=Zierjby+_Q93dFeO5mjMG1aiSpyHvDshRK6=ZHY5bH-6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bq6ATYFyOvEH179D"
Content-Disposition: inline
In-Reply-To: <CACHz=Zierjby+_Q93dFeO5mjMG1aiSpyHvDshRK6=ZHY5bH-6A@mail.gmail.com>


--Bq6ATYFyOvEH179D
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Feb 2025 14:16:47 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2

On Mon, Feb 24, 2025 at 12:57:13PM +0000, Frediano Ziglio wrote:
> On Fri, Feb 21, 2025 at 8:20=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Mon, Feb 17, 2025 at 04:26:59PM +0000, Frediano Ziglio wrote:
> > > Although code is compiled with -fpic option data is not position
> > > independent. This causes data pointer to become invalid if
> > > code is not relocated properly which is what happens for
> > > efi_multiboot2 which is called by multiboot entry code.
> > >
> > > Code tested adding
> > >    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> > > in efi_multiboot2 before calling efi_arch_edd (this function
> > > can potentially call PrintErrMesg).
> > >
> > > Before the patch (XenServer installation on Qemu, xen replaced
> > > with vanilla xen.gz):
> > >   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> > >   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU A=
pic ID - 00000000 !!!!
> > >   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX=
:0
> > >   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 000000000=
0210246
> > >   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 000000000000=
0010
> > >   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0=
C210
> > >   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
> > >   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 000000000000=
0000
> > >   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0=
C1B8
> > >   R14  - 000000007EA33328, R15 - 000000007EA332D8
> > >   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 000000000000=
0030
> > >   GS   - 0000000000000030, SS  - 0000000000000030
> > >   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC0=
1000
> > >   CR4  - 0000000000000668, CR8 - 0000000000000000
> > >   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 000000000000=
0000
> > >   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 000000000000=
0400
> > >   GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
> > >   IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
> > >   FXSAVE_STATE - 000000007FF0BDE0
> > >   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=3D0000=
00007EE20000, EntryPoint=3D000000007EE23935) !!!!
> > >
> > > After the patch:
> > >   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> > >   Test message: Buffer too small
> > >   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3E=
E4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> > >   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3=
EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> > >
> > > This partially rollback commit 00d5d5ce23e6.
> > >
> > > Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI pl=
atforms")
> > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >
> > I tried testing this patch, but it seems I cannot reproduce the original
> > failure...
> >
> > I did as the commit message suggests here:
> > https://gitlab.com/xen-project/people/marmarek/xen/-/commit/ca3d6911c44=
8eb886990f33d4380b5646617a982
> >
> > With blexit() in PrintErrMesg(), it went back to the bootloader, so I'm
> > sure this code path was reached. But with blexit() commented out, Xen
> > started correctly both with and without this patch... The branch I used
> > is here:
> > https://gitlab.com/xen-project/people/marmarek/xen/-/commits/automation=
-tests?ref_type=3Dheads
> >
> > Are there some extra condition to reproduce the issue? Maybe it depends
> > on the compiler version? I guess I can try also on QEMU, but based on
> > the description, I would expect it to crash in any case.
> >
>=20
> Did you see the correct message in both cases?
> Did you use Grub or direct EFI?
>=20
> With Grub and without this patch you won't see the message, with grub
> with the patch you see the correct message.

I did use grub, and I didn't see the message indeed.
But in the case it was supposed to crash (with added PrintErrMesg(),
commented out blexit and without your patch) it did _not_ crashed and
continued to normal boot. Is that #PF non-fatal here?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Bq6ATYFyOvEH179D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAme8cT8ACgkQ24/THMrX
1yyVtwf6A3CaymPYS4AnsCMhMBCgGEjutEk7aXRyEeIipyQVruf0T5mZkV1+T4if
cEG9u+c6WmznZ4kFalZp2WsjFQt/29/Vul8L9DZ0jePptN7OlNaQiBYud0wJ4vmz
mxKA/TT2LDge+5FZog0tePit1LnjLvQWrFX4jQNtcFrB+eH1GQocanYHAVQtBqXW
7fiXmEFq2kKZswirYi3sJvPF7po285YdT3HKE+8/jpCntokIgHuBoWUcsIF2+KR2
Xk3nrmmsIaCodx4R6T5KSNeDSht7dZkpaoIThcHCHk00QDJl6XY5sVq1QEN4ruWo
sVJjdMCJmNY11r7soEqlgGZyMxmx8g==
=CBnj
-----END PGP SIGNATURE-----

--Bq6ATYFyOvEH179D--

