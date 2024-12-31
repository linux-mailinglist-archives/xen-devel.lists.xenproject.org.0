Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E959FF1EA
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2024 23:26:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863679.1275062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSkgF-0002yL-Jy; Tue, 31 Dec 2024 22:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863679.1275062; Tue, 31 Dec 2024 22:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSkgF-0002wC-HJ; Tue, 31 Dec 2024 22:25:39 +0000
Received: by outflank-mailman (input) for mailman id 863679;
 Tue, 31 Dec 2024 22:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQG7=TY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tSkgE-0002w6-87
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2024 22:25:38 +0000
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25f1a222-c7c6-11ef-99a4-01e77a169b0f;
 Tue, 31 Dec 2024 23:25:33 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id E72C01140128;
 Tue, 31 Dec 2024 17:25:31 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Tue, 31 Dec 2024 17:25:32 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Dec 2024 17:25:30 -0500 (EST)
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
X-Inumbo-ID: 25f1a222-c7c6-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1735683931;
	 x=1735770331; bh=JTYvv1OPwK4BF7/ea9Q0WGY/bCj2Y9mzyQeLFZdQUxU=; b=
	IHnslYvuopyM9QAXkATiLkNgs2Ux54QYKjxmouiQzQbhNC0p5XRbIfnpMI+M1IFQ
	jwquAkLyconwXYoZykwNubltf77oQQ/FaV3x/eezc/FMkd2PboaZCTQLV768cNcD
	G/fV/9T/pXboYKa2aT8jcaMNUv01KQw38T4/rJivpff34BSDtJrd2Y7YQSEI854M
	1XWonmcvpvtCjjOVYZEPw+TNo/euWXP22BxTH9XxlYJthtiVUJhw1O8Du/wz/C1l
	bI8TakUA/7GiqWoaz8yfE+Toy5Y+MD1EvgaVux/sau5vZMqQn7NfZWTFHTqvoJ1h
	kSM27LclBs4EEl4SIwoyAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1735683931; x=1735770331; bh=JTYvv1OPwK4BF7/ea9Q0WGY/bCj2Y9mzyQe
	LFZdQUxU=; b=qb+Dc4dBQlpy00QtTdgBI7jYA8UJvI1RiwqOaTG25C1WqYsOTFl
	5wIVZUstxOL7A1mHpP3stcdHkRrBKNBilvW144KrkZOl1GnEj6sl+hIZ3lBQVfer
	NHtR3LsAKVIyGwqqss68QYmLwA6csC6MtKbN5pg1tE7ICVg65zbZQeJUupKB8v7U
	Vm2cgbn5E8sqbQWpjTwdkFeqkX1S49pXDk/e+F/JgPNqnxsnz2pn3uIRRl+rhSUu
	wzHiBDcR9BZHh/7rLiZ+kcqJD8v5wyTSAqHsr45t8q3mVUARSsPvY0uz/EuE7xuB
	z5I00I26QoScy4iLw7WaO38JHQRDwtpn6Fw==
X-ME-Sender: <xms:W290Zy13WzimfeI3kj6m3v-va_uyiRXOV2OtWgtlsOAHRZXTZFW4qQ>
    <xme:W290Z1FIdld9aqkWl0r0FGa2_4nbuatpqITfWzJLOVPTOQTNOU4ena7_cicnf-xrJ
    8pD9RJ4_XeKyA>
X-ME-Received: <xmr:W290Z67oYWKfL3N1GM9XaPSnX-4LjMeQfAPd1NGHHDz5tQSxSo4UGJv87x2FMCSRL7z41HsinzUHTuKvZ6jOux06p1kCJu1kEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddvkedgudeiudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvd
    egueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgu
    rhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdqug
    gvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepjhgs
    vghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtih
    htrhhigidrtghomhdprhgtphhtthhopeholhgvkhhsihhirdhkuhhrohgthhhkohesghhm
    rghilhdrtghomh
X-ME-Proxy: <xmx:W290Zz3SB4Rgm0dUejt2yq3KvPl4oF_SzsUhBvhpIm8ohUXSLkcmqQ>
    <xmx:W290Z1EWtzBfF9PJbANEzT-8KRup2anLL7kMoltYa67HbU19cKhpdw>
    <xmx:W290Z8_ik41cmLv0-P-PeGQFbIn9xCyz6yJGW_NItSGBndn1rd6wyg>
    <xmx:W290Z6kdLzHCESZrVmVLbfOAIe8xK02kc4K0fJETeLtixLNzCF8kOw>
    <xmx:W290Z-M-QO8CCsnnHsF9ULpYdBZpGj2ydk6FD6dk40AYfLH9Uj0Fsw2A>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 31 Dec 2024 23:25:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20] x86/traps: Rework LER initialisation and
 support Zen5/Diamond Rapids
Message-ID: <Z3RvWJvdB68sVhqZ@mail-itl>
References: <20241231192002.1753737-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+B+Fr2JDn72RbV1s"
Content-Disposition: inline
In-Reply-To: <20241231192002.1753737-1-andrew.cooper3@citrix.com>


--+B+Fr2JDn72RbV1s
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 31 Dec 2024 23:25:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20] x86/traps: Rework LER initialisation and
 support Zen5/Diamond Rapids

On Tue, Dec 31, 2024 at 07:20:02PM +0000, Andrew Cooper wrote:
> AMD have always used the architectural MSRs for LER.  As the first proces=
sor
> to support LER was the K7 (which was 32bit), we can assume it's presence
> unconditionally in 64bit mode.
>=20
> Intel are about to run out of space in Family 6 and start using 19.  It is
> only the Pentium 4 which uses non-architectural LER MSRs.
>=20
> percpu_traps_init(), which runs on every CPU, contains a lot of code which
> should be init-only, and is the only reason why opt_ler can't be in initd=
ata.
>=20
> Write a brand new init_ler() which expects all future Intel and AMD CPUs =
to
> continue using the architectural MSRs, and does all setup together.  Call=
 it
> from trap_init(), and remove the setup logic percpu_traps_init() except f=
or
> the single path configuring MSR_IA32_DEBUGCTLMSR.
>=20
> Leave behind a warning if the user asked for LER and Xen couldn't enable =
it.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> For 4.20.  This is needed for Zen5 CPUs (already available) as well as In=
tel
> CPUs coming shortly.  It also moves some non-init logic to being init-onl=
y.
> ---

=2E..

> @@ -2201,6 +2155,42 @@ void __init init_idt_traps(void)
>          this_cpu(compat_gdt) =3D boot_compat_gdt;
>  }
> =20
> +static void __init init_ler(void)
> +{
> +    unsigned int msr =3D 0;
> +
> +    if ( !opt_ler )
> +        return;
> +
> +    /*
> +     * Intel Pentium 4 is the only known CPU to not use the architectura=
l MSR
> +     * indicies.
> +     */
> +    switch ( boot_cpu_data.x86_vendor )
> +    {
> +    case X86_VENDOR_INTEL:
> +        if ( boot_cpu_data.x86 =3D=3D 0xf )
> +        {
> +            ler_msr =3D MSR_P4_LER_FROM_LIP;

msr =3D=20

and ...

> +            break;
> +        }
> +        fallthrough;
> +    case X86_VENDOR_AMD:
> +    case X86_VENDOR_HYGON:
> +        ler_msr =3D MSR_IA32_LASTINTFROMIP;

=2E.. here?

But also, why temporary variable? Is there something else that would set
non-zero value that should be preserved?

> +        break;
> +    }
> +
> +    if ( msr =3D=3D 0 )
> +    {
> +        printk(XENLOG_WARNING "LER disabled: failed to identy MSRs\n");
> +        return;
> +    }
> +
> +    ler_msr =3D msr;
> +    setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
> +}
> +
>  extern void (*const autogen_entrypoints[X86_NR_VECTORS])(void);
>  void __init trap_init(void)
>  {
> @@ -2226,6 +2216,8 @@ void __init trap_init(void)
>          }
>      }
> =20
> +    init_ler();
> +
>      /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
>      this_cpu(gdt_l1e) =3D
>          l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
> --=20
> 2.39.5
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+B+Fr2JDn72RbV1s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmd0b1gACgkQ24/THMrX
1yyVeggAmwTLccLYJPqWeHZJeVsYN+ScgmS1fdJXJ/U5TYclQVo/nA/dtkB9LJPl
eKkVYrD628OgSA8FQGkwgBpNSTtYXfIPwCmUu6+RluSwT4M2bkB5vTGkqhnglJjm
9KV3DksIVqeeY2/cwB9RSS5jmDOzyuOJjrv/qNGqx/BkHpbCv+mxfIJvJQ+ZBYwS
R2IGIWawUyydxktpIuueavddpAP75j+i1lq9rR8OY1sXF/P17Bnd5uVqrWLjkRwe
XtbEdu91EUddXnlxK0gq2BICuferSVRPvWZIBD7a0TlNQbXDDPK8WW/qJje5mi/D
u2MU7SlBNlQgCZzYJiTAuBLjh7Q+kQ==
=mHi6
-----END PGP SIGNATURE-----

--+B+Fr2JDn72RbV1s--

