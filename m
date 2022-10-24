Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC25E60B466
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 19:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429304.680246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on1S8-0005Zp-CL; Mon, 24 Oct 2022 17:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429304.680246; Mon, 24 Oct 2022 17:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on1S8-0005XE-9M; Mon, 24 Oct 2022 17:41:32 +0000
Received: by outflank-mailman (input) for mailman id 429304;
 Mon, 24 Oct 2022 17:41:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3GNr=2Z=denx.de=pavel@srs-se1.protection.inumbo.net>)
 id 1on1S7-0005X8-3y
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 17:41:31 +0000
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 173309e3-53c3-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 19:41:29 +0200 (CEST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 23CFA1C0040; Mon, 24 Oct 2022 19:41:28 +0200 (CEST)
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
X-Inumbo-ID: 173309e3-53c3-11ed-8fd0-01056ac49cbb
Date: Mon, 24 Oct 2022 19:41:27 +0200
From: Pavel Machek <pavel@denx.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	Kees Cook <keescook@chromium.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 4.19 174/229] x86/entry: Work around Clang __bdos() bug
Message-ID: <20221024174127.GC25198@duo.ucw.cz>
References: <20221024112959.085534368@linuxfoundation.org>
 <20221024113004.718917343@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
Content-Disposition: inline
In-Reply-To: <20221024113004.718917343@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)


--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Kees Cook <keescook@chromium.org>
>=20
> [ Upstream commit 3e1730842f142add55dc658929221521a9ea62b6 ]
>=20
> Clang produces a false positive when building with CONFIG_FORTIFY_SOURCE=
=3Dy
> and CONFIG_UBSAN_BOUNDS=3Dy when operating on an array with a dynamic
> offset. Work around this by using a direct assignment of an empty
> instance. Avoids this warning:
>=20
> ../include/linux/fortify-string.h:309:4: warning: call to __write_overflo=
w_field declared with 'warn
> ing' attribute: detected write beyond size of field (1st parameter); mayb=
e use struct_group()? [-Wat
> tribute-warning]
>                         __write_overflow_field(p_size_field, size);
>                         ^
>=20
> which was isolated to the memset() call in xen_load_idt().
>=20
> Note that this looks very much like another bug that was worked around:
> https://github.com/ClangBuiltLinux/linux/issues/1592

We don't have CONFIG_UBSAN_BOUNDS in 4.19, so maybe we don't need this
one?

Best regards,
								Pavel
							=09
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -752,6 +752,7 @@ static void xen_load_idt(const struct desc_ptr *desc)
>  {
>  	static DEFINE_SPINLOCK(lock);
>  	static struct trap_info traps[257];
> +	static const struct trap_info zero =3D { };
>  	unsigned out;
> =20
>  	trace_xen_cpu_load_idt(desc);
> @@ -761,7 +762,7 @@ static void xen_load_idt(const struct desc_ptr *desc)
>  	memcpy(this_cpu_ptr(&idt_desc), desc, sizeof(idt_desc));
> =20
>  	out =3D xen_convert_trap_info(desc, traps, false);
> -	memset(&traps[out], 0, sizeof(traps[0]));
> +	traps[out] =3D zero;
> =20
>  	xen_mc_flush();
>  	if (HYPERVISOR_set_trap_table(traps))
> --=20
> 2.35.1
>=20
>=20

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY1bORwAKCRAw5/Bqldv6
8ncbAJ9IUs8w/7hTCthPKhWGY8O+PVF6zACglL4ohEfyPjuKQnuAt70ZrDtKMoA=
=ONRr
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--

