Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AFF88181A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 20:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696138.1086789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn1rR-0002td-EE; Wed, 20 Mar 2024 19:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696138.1086789; Wed, 20 Mar 2024 19:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn1rR-0002qQ-AN; Wed, 20 Mar 2024 19:44:29 +0000
Received: by outflank-mailman (input) for mailman id 696138;
 Wed, 20 Mar 2024 19:44:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3RsG=K2=kernel.org=conor@srs-se1.protection.inumbo.net>)
 id 1rn1rP-0002qK-Sl
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 19:44:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41d1eb03-e6f2-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 20:44:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3F161610A1;
 Wed, 20 Mar 2024 19:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A8BC433C7;
 Wed, 20 Mar 2024 19:44:22 +0000 (UTC)
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
X-Inumbo-ID: 41d1eb03-e6f2-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710963865;
	bh=nchtvu7FyrnG5+8ZjCxOdqbxijBRFgG29pgMUueefj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dq+2KQVqqpBQnXoimBBcfhDTj7RoP+EYdG/aEQxrd8VN3TCYgUMycznOe7BltO6S3
	 N++IciqUkRWvqTrkDQkYOLfX9FWUiAd1VqgNg6d5Eb3ojixm7PWzOaRAD9IbmcWFvq
	 4X0I8mGtuZs8j/bppsRWlm21GBWcFd6ViKjO2CQ/JbrRn0NVTdC+unMY0Bv9W3chHg
	 uyAdBHjBPFL5UIHIiTcavY7TcEvPM2BjUt0+H0p15mLE+61ttnifHo+6kDQHRJe2x5
	 hVma6Lfx2JrO1CbRkVFwagrrkYx7dfehIHKmkPQOFkSAHfJbBS/DfAnAyOWh3PFgrw
	 nSTaZnLV+sHOg==
Date: Wed, 20 Mar 2024 19:44:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 03/20] xen/riscv: introduce extenstion support check
 by compiler
Message-ID: <20240320-oak-uprising-db787f501695@spud>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <d4df95eb7a30df3f882b67f200964232fee9d6c1.1710517542.git.oleksii.kurochko@gmail.com>
 <6ddc9d8a-20e7-4e4d-ae1a-d2ea01479b38@suse.com>
 <04c1424cec1342dcfb849d361f5eb9f3e7f34734.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WuXc4XOhTO1ZLXjC"
Content-Disposition: inline
In-Reply-To: <04c1424cec1342dcfb849d361f5eb9f3e7f34734.camel@gmail.com>


--WuXc4XOhTO1ZLXjC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 07:58:05PM +0100, Oleksii wrote:
> On Mon, 2024-03-18 at 17:58 +0100, Jan Beulich wrote:
> > On 15.03.2024 19:05, Oleksii Kurochko wrote:
> > > Currently, RISC-V requires two extensions: _zbb and _zihintpause.
> >=20
> > Do we really require Zbb already?
> After an introduction of Andrew C. patches [1] it is requited for
> __builtin_ffs{l}
>=20
> [1]
> https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.cooper3=
@citrix.com/T/#t
> >=20
> > > This patch introduces a compiler check to check if these extensions
> > > are supported.
> > > Additionally, it introduces the riscv/booting.txt file, which
> > > contains
> > > information about the extensions that should be supported by the
> > > platform.
> > >=20
> > > In the future, a feature will be introduced to check whether an
> > > extension
> > > is supported at runtime.
> > > However, this feature requires functionality for parsing device
> > > tree
> > > source (DTS), which is not yet available.
> >=20
> > Can't you query the CPU for its features?
> I couldn't find such reg ( or SBI call ) in the spec.

There isn't.

> SBI call sbi_probe_extension() exists, but it doesn't check for every
> possible extension. As far as I understand it checks only for that one
> which are present in SBI spec.

Yeah, it only checks for SBI extensions, not ISA extensions.

> The most closest thing I see how to check that without dts is how it is
> done in OpenSBI:

IIRC this only "works" because the OpenSBI devs assume that there are no
non-normative behaviours and all CSRs have their ~God~ RVI defined
meanings. Reading a CSR to see if it traps is not behaviour you can really
rely on unless the platform claims to support Sstrict - but Sstrict you'd
have to detect from the DT so chicken and egg for you! It's one of these
new "extensions" from the profiles spec, so it doesn't even have support
in Linux's dt-bindings yet. Up to Xen devs if you guys want to make the
same assumptions as OpenSBI. Linux doesn't and when we discussed this
not too long ago on the U-Boot ML in the context of the rng CSR it was
also decided not to do make the assumption there either.

Personally I wonder if you can just apply the same policy here as you
did with Zbb in the other thread and assume that something with H will
have Zihintpause and leave implementing a "fake" pause as an exercise
for someone that introduces such a system?
If Jess is correct, and I do remember testing this, it's actually
"always" safe to call the pause instruction on CPUs where the extension
is not supported as it uses an encoding of fence that effectively makes
it a into a nop:
https://lore.kernel.org/linux-riscv/2E96A836-764D-4D07-AB79-3861B9CC2B1F@jr=
tc27.com/
At worst, that'd make cpu_relax() a nop if someone didn't meet that
requirement.

FWIW, Linux's cpu_relax() on RISC-V looks like:
	static inline void cpu_relax(void)
	{
	#ifdef __riscv_muldiv
		int dummy;
		/* In lieu of a halt instruction, induce a long-latency stall. */
		__asm__ __volatile__ ("div %0, %0, zero" : "=3Dr" (dummy));
	#endif
=09
	#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
		/*
		 * Reduce instruction retirement.
		 * This assumes the PC changes.
		 */
		__asm__ __volatile__ ("pause");
	#else
		/* Encoding of the pause instruction */
		__asm__ __volatile__ (".4byte 0x100000F");
	#endif
		barrier();
	}

I figure having div is part of your base requirements, so maybe you can
just do something similar in the !zihintpause case if making that
extension a requirement is problematic?=20
Doing that invalid div used to be conditional, but cpu_relax() is in the
vdso so the static branch it used to be gated with got removed and its
now unconditional. Probably that's not a constraint on Xen's cpu_relax()?

Oh ye, and we do the .4byte crap so that toolchain support wasn't needed
for Zihintpause given we are using it in exactly one place.

Cheers,
Conor.

> #define csr_read_allowed(csr_num, trap)				\
> 	({							\
> 	register ulong tinfo asm("a3") =3D (ulong)trap;		\
> 	register ulong ttmp asm("a4");				\
> 	register ulong mtvec =3D sbi_hart_expected_trap_addr();	\
> 	register ulong ret =3D
> 0;					\
> 	((struct sbi_trap_info *)(trap))->cause =3D 0;		\
> 	asm volatile(						\
> 		"add %[ttmp], %[tinfo],
> zero\n"			\
> 		"csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"\
> 		"csrr %[ret],
> %[csr]\n"				\
> 		"csrw " STR(CSR_MTVEC) ", %[mtvec]"		\
> 	    : [mtvec] "+&r"(mtvec), [tinfo] "+&r"(tinfo),	\
> 	      [ttmp] "+&r"(ttmp), [ret] "=3D&r" (ret)		\
> 	    : [csr] "i" (csr_num)				\
> 	    : "memory");					\
> 	ret;							\
> 	})							\
> ...
> 	/* Detect if hart supports stimecmp CSR(Sstc extension) */
> 	if (hfeatures->priv_version >=3D SBI_HART_PRIV_VER_1_12) {
> 		csr_read_allowed(CSR_STIMECMP, (unsigned long)&trap);
> 		if (!trap.cause)
> 			__sbi_hart_update_extension(hfeatures,
> 					SBI_HART_EXT_SSTC, true);
> 	}

--WuXc4XOhTO1ZLXjC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfs8lAAKCRB4tDGHoIJi
0r3/AP4/vBGX2iN5mwOMnv3lpuWA8BP/zws5AN71Fjuw9yy97gEAretmOJDJLMZl
Y91Kogw5xVnQZFa9xmdM5VeRdsseKQ0=
=YKEu
-----END PGP SIGNATURE-----

--WuXc4XOhTO1ZLXjC--

