Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA006A46A3C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 19:55:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897172.1305886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnMYm-0002To-Kc; Wed, 26 Feb 2025 18:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897172.1305886; Wed, 26 Feb 2025 18:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnMYm-0002RI-I0; Wed, 26 Feb 2025 18:55:08 +0000
Received: by outflank-mailman (input) for mailman id 897172;
 Wed, 26 Feb 2025 18:55:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cat0=VR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tnMYl-0002RC-Ta
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 18:55:08 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30d01fcd-f473-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 19:55:06 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 7102F11400E1;
 Wed, 26 Feb 2025 13:55:04 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Wed, 26 Feb 2025 13:55:04 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Feb 2025 13:55:03 -0500 (EST)
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
X-Inumbo-ID: 30d01fcd-f473-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740596104;
	 x=1740682504; bh=e4u1K6bhPK/F8yzoOFojmHyNvHD7/5+SSiFI9x83loE=; b=
	ODt0Wp8ylVUCc7tmvs47Ky8obsTGGWESs9gwoJW+5hpaMJfQ6h487YttF+EKGbE7
	T634lfWYd6UWCAJcJkJ0npuFi3YZGPAdRk0VtHy8vOel77CCFCDSGQlRczxDGxTY
	fC2TX+6jOo57MVDsoscqrL5cn3PbFWmWkwZoha6e3y2AcYNrKN0c5/4LjOm+Iaor
	cX4D3JsME+pBYE57BVS0yFhB+58au371oDPIv/wWsxFHwT9SiuuAMosdt7v3UwWn
	U8ZNCjIbLOyWxnTjBo2FU1VpURG+CEJ0EzqdY6kN5Ztfsm65pC+9pYo5odFsbIZf
	WPB9wsM0VLbYOo00cC9GRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740596104; x=1740682504; bh=e4u1K6bhPK/F8yzoOFojmHyNvHD7/5+SSiF
	I9x83loE=; b=tnuu61U1XAxPYSmpAwoSkI4vI0zqrX/2aJ7Jr8wQ+9pXcUlu/Ep
	ptoKUNyKHcrA/xPOv0QJVB8x6xR89au+ICMG7Y0fGymybVnfezbpSUIxziBbMMX/
	+PRiF5ntFvZ1N5J4J2Jc+aAKDGcifCFfqmE7fnKhGfcefDUUnTFYvoQ5jkhq/ltN
	u/dF/YcVSyq0sAKEQYCqgvEalKkvzzOUIo9BYsP0PnXcfsAHDcj6GNEdX9yuhzfX
	5MdRcJESTBxzK+bwTVPaAnnnfw2UJWwM9F1nS99+XVY8IdflaPbqPE4MoKsagDDI
	icn/ZU3M1jQRmmcd2KYptS2zoUiHlpIFGbA==
X-ME-Sender: <xms:h2O_Z7uTfUx5XYA_mfdn0ivsajRELvjxkANRUR0NU87IJ0kmxfmszg>
    <xme:h2O_Z8cEjAZpl7ZN3jXKzf2vYPnkdGAAwAYarip9cXs4xMrqNXTSU5_gyjhnCm735
    c9BWLgffC1oXw>
X-ME-Received: <xmr:h2O_Z-wqvYZrMrrVqW1anfdJJ4-iBvXQH3BabBPMKWKOFHEbLFwpo06dP_q--Odl1lwIS_dZzUScb9COcJ8nuz0EmOqkNjqfgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekheefhecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:iGO_Z6O6jtFWV8wuHHN6Ay7HulujaawnqsFvwZTXpXvjdAbyS4_LsA>
    <xmx:iGO_Z7-t-xm2JNhCGrw0ArqTyM3YprnKA6PAXsNp618CvJpln7G0Tw>
    <xmx:iGO_Z6UwPX2G-SuKjtvgXqUi8Udoj31HDSUdYb9dGYqkZF8MM4AY-A>
    <xmx:iGO_Z8eFe61-a5e2CcCq9UGGsSIkh_-FkSnXM_0wnvmky_9kMd_Y5g>
    <xmx:iGO_Z3Zmt1g9zS0re2HoANpP5dmPHpkSrbxPT7UUz_y86DkKdGE-mzWu>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 26 Feb 2025 19:54:58 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
Message-ID: <Z79jhZ_BGEC6DYl4@mail-itl>
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <Z7jf_YojU9tQ1Or7@mail-itl>
 <CACHz=Zierjby+_Q93dFeO5mjMG1aiSpyHvDshRK6=ZHY5bH-6A@mail.gmail.com>
 <Z7xxQHVdSGwig4hb@mail-itl>
 <CACHz=ZgHxvCJQyJe_NJFh3YYcuW0sey+qcOEv0O-XxC8daTo+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WkdlofIomaYp0v0c"
Content-Disposition: inline
In-Reply-To: <CACHz=ZgHxvCJQyJe_NJFh3YYcuW0sey+qcOEv0O-XxC8daTo+A@mail.gmail.com>


--WkdlofIomaYp0v0c
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Feb 2025 19:54:58 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2

On Mon, Feb 24, 2025 at 02:31:00PM +0000, Frediano Ziglio wrote:
> On Mon, Feb 24, 2025 at 1:16=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Mon, Feb 24, 2025 at 12:57:13PM +0000, Frediano Ziglio wrote:
> > > On Fri, Feb 21, 2025 at 8:20=E2=80=AFPM Marek Marczykowski-G=C3=B3rec=
ki
> > > <marmarek@invisiblethingslab.com> wrote:
> > > >
> > > > On Mon, Feb 17, 2025 at 04:26:59PM +0000, Frediano Ziglio wrote:
> > > > > Although code is compiled with -fpic option data is not position
> > > > > independent. This causes data pointer to become invalid if
> > > > > code is not relocated properly which is what happens for
> > > > > efi_multiboot2 which is called by multiboot entry code.
> > > > >
> > > > > Code tested adding
> > > > >    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> > > > > in efi_multiboot2 before calling efi_arch_edd (this function
> > > > > can potentially call PrintErrMesg).
> > > > >
> > > > > Before the patch (XenServer installation on Qemu, xen replaced
> > > > > with vanilla xen.gz):
> > > > >   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> > > > >   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  C=
PU Apic ID - 00000000 !!!!
> > > > >   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0=
 SGX:0
> > > > >   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 00000=
00000210246
> > > > >   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 00000000=
00000010
> > > > >   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 00000000=
7FF0C210
> > > > >   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
> > > > >   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 00000000=
00000000
> > > > >   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 00000000=
7FF0C1B8
> > > > >   R14  - 000000007EA33328, R15 - 000000007EA332D8
> > > > >   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 00000000=
00000030
> > > > >   GS   - 0000000000000030, SS  - 0000000000000030
> > > > >   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 00000000=
7FC01000
> > > > >   CR4  - 0000000000000668, CR8 - 0000000000000000
> > > > >   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 00000000=
00000000
> > > > >   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 00000000=
00000400
> > > > >   GDTR - 000000007F9DB000 0000000000000047, LDTR - 00000000000000=
00
> > > > >   IDTR - 000000007F48E018 0000000000000FFF,   TR - 00000000000000=
00
> > > > >   FXSAVE_STATE - 000000007FF0BDE0
> > > > >   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=3D=
000000007EE20000, EntryPoint=3D000000007EE23935) !!!!
> > > > >
> > > > > After the patch:
> > > > >   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> > > > >   Test message: Buffer too small
> > > > >   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAE=
A-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> > > > >   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AA=
EA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> > > > >
> > > > > This partially rollback commit 00d5d5ce23e6.
> > > > >
> > > > > Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EF=
I platforms")
> > > > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > >
> > > > I tried testing this patch, but it seems I cannot reproduce the ori=
ginal
> > > > failure...
> > > >
> > > > I did as the commit message suggests here:
> > > > https://gitlab.com/xen-project/people/marmarek/xen/-/commit/ca3d691=
1c448eb886990f33d4380b5646617a982
> > > >
> > > > With blexit() in PrintErrMesg(), it went back to the bootloader, so=
 I'm
> > > > sure this code path was reached. But with blexit() commented out, X=
en
> > > > started correctly both with and without this patch... The branch I =
used
> > > > is here:
> > > > https://gitlab.com/xen-project/people/marmarek/xen/-/commits/automa=
tion-tests?ref_type=3Dheads
> > > >
> > > > Are there some extra condition to reproduce the issue? Maybe it dep=
ends
> > > > on the compiler version? I guess I can try also on QEMU, but based =
on
> > > > the description, I would expect it to crash in any case.
> > > >
> > >
> > > Did you see the correct message in both cases?
> > > Did you use Grub or direct EFI?
> > >
> > > With Grub and without this patch you won't see the message, with grub
> > > with the patch you see the correct message.
> >
> > I did use grub, and I didn't see the message indeed.
> > But in the case it was supposed to crash (with added PrintErrMesg(),
> > commented out blexit and without your patch) it did _not_ crashed and
> > continued to normal boot. Is that #PF non-fatal here?
> >
>=20
> Hi,
>    I tried again with my test environment.
> Added the PrintErrMesg line before efi_arch_edd call, I got a #PF, in
> my case the system hangs. With the fix patch machine is rebooting and
> I can see the message in the logs.
> I'm trying with Xen starting inside Qemu, EFI firmware, xen.gz
> compiled as ELF file. Host system is an Ubuntu 22.04.5 LTS. Gcc is
> version 11.4.

My test was wrong, commenting out blexit made "mesg" variable unused.
After fixing that, I can reproduce it on both QEMU and real hardware:
without your patch it crashes and with your patch it works just fine.
While there may be more places with similar issue, this patch clearly
improves the situation, so:

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--WkdlofIomaYp0v0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAme/Y4UACgkQ24/THMrX
1yx/bAf+MXkqge5yzU/u1WgX/y/pu5Zycs4p2Pung03rSj69Oxlpd3JtZn0L2ALi
0AS+HegGLqd/FfJ+c/psnGRkQoB3FVWBFFt7ATcCbgc1kRECVYrs3Re+RBLaxPGR
f4CWGJ95rGSmwfMSbemmM/Tqe3bchN1kQN8KkGpvx38HVlia0evaL359kZC7LSg9
4c2QvVIA+vKVORTFlr03Y/7nWW1n0SH3hfw3TKBEFIp5uuF88CREneBWztE98Xn4
3w5Cbuilvv6gZ8UP5YmwuUvFRgKPBRL78cyonz8N2emEOJxdp8pnW5GpEA/xy68f
i9oov32CWYuC2vNRpF42/o/DBGk5XA==
=8gmx
-----END PGP SIGNATURE-----

--WkdlofIomaYp0v0c--

