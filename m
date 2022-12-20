Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22566525B9
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 18:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467258.726299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ggH-0004Sj-RD; Tue, 20 Dec 2022 17:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467258.726299; Tue, 20 Dec 2022 17:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ggH-0004Pr-Nd; Tue, 20 Dec 2022 17:45:33 +0000
Received: by outflank-mailman (input) for mailman id 467258;
 Tue, 20 Dec 2022 17:45:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFeQ=4S=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p7ggF-0004Pl-CF
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 17:45:31 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 168e412e-808e-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 18:45:29 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 4CF25320097B;
 Tue, 20 Dec 2022 12:45:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 20 Dec 2022 12:45:25 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Dec 2022 12:45:23 -0500 (EST)
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
X-Inumbo-ID: 168e412e-808e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1671558324; x=
	1671644724; bh=DQJzCP4AKUy4oxeWY9ErxXgLb3RKTyC8+uXNkcTKiXc=; b=s
	JQqnNDn/WLbdOlLItOQUSX1g0MnK/HQWE6UX0fRsXcX6swE1MueyLyOkkgG6HqDG
	lfEbAv8Du5TfWrAXnxid5222oB6+ZSpdWUQL+bb4xfsojlC9xKMMmJHFDNCPJi87
	4+c8OR/lLD4Y3lZGQqp2utKwGtPw8xSKeIllNNvlj6gEh+ZUcaJ4t67V13eF6gmN
	8fky6Sp0+cW9GAAIG+LDhKkdi4INaqCz1DDssdwIKl+Mk+ZPBxBQcxche746Fp0T
	JKfwnMdAl7fY/5u/djRhr44I0NltkPak2bJh05IsOS5iZb6i2RV4spjc/C7z4OSF
	14ldvkPxZx+g9VJauwO7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671558324; x=1671644724; bh=DQJzCP4AKUy4oxeWY9ErxXgLb3RK
	TyC8+uXNkcTKiXc=; b=FmIZbI+A9qb4oJFkTiCo0Kr6d0vAg0zdQzs8CEVI9Pw7
	S/RojXmwpFQlXRjZFao92jObTy20hLB7Vh2muvN2dgH6F2McvD+hnqZnBcGsJShy
	cTbcJvUFYIPTWncHo1mf5/TDIcIfvvyfEU4ny19evbIfrbh6s9L3oRzAeOe5DdyS
	2KIEfqju5gV4ikulmrbYZWeIfN1tV747VhkLAZ2coWfKO3MRpqlPZzg3yyOGckAL
	uSXy7Sjhl/QjQFIDNPPstyjsQUEH/eyW8JPwc/r/7tseV8k8VWX3SssFOSLpBhtN
	fVMchUFnneyBOu4+q7PQMlEVoNkpuoMT/2iMC+4q1w==
X-ME-Sender: <xms:tPShY0d9GTIxAhsy_lAY3Sn9Q2RNJ2wka0m4Ep_osO0Y9NkeWm5-hQ>
    <xme:tPShY2M90pJ5wg-y_EF4_PbD21ng7W5JfzJ2p3X41BcnkrF6XfiKg3QlNXEVUPBAU
    333RTe8x2BJW7k>
X-ME-Received: <xmr:tPShY1htT88ZLrK0vCML1_a9GfAWMB4l5UBNtyK-DaI7OBh_tHk9W516mr4X>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeigdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:tPShY58KEgMQZsmqdFySgcod4TXJ9AjCbqIw0fOK4s6Y7cP7KVfOqg>
    <xmx:tPShYwskEW0OcFEQstGFX0RFHI-_KesVMKL3wApGnp5ZPePgKjJ8-w>
    <xmx:tPShYwHXuBserQrE5ywX-nNzG34c-cyf7hPF64GhLoHBMF38ghqrkw>
    <xmx:tPShY56H-nvCVzqZWQ35vOcfzTXy9zgXOBc9wwAQNCfpXSXwIBqiAw>
Feedback-ID: iac594737:Fastmail
Date: Tue, 20 Dec 2022 12:45:14 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 11/10] hvmloader: use memory type constants
Message-ID: <Y6H0siXlkOwASOdk@itl-email>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <24461a6b-b118-aad9-6407-d215d07a2924@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1V8L5AtfQjXI+Vj/"
Content-Disposition: inline
In-Reply-To: <24461a6b-b118-aad9-6407-d215d07a2924@suse.com>


--1V8L5AtfQjXI+Vj/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Dec 2022 12:45:14 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 11/10] hvmloader: use memory type constants

On Tue, Dec 20, 2022 at 05:13:04PM +0100, Jan Beulich wrote:
> Now that we have them available in a header which is okay to use from
> hvmloader sources, do away with respective literal numbers and silent
> assumptions.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/tools/firmware/hvmloader/cacheattr.c
> +++ b/tools/firmware/hvmloader/cacheattr.c
> @@ -22,6 +22,8 @@
>  #include "util.h"
>  #include "config.h"
> =20
> +#include <xen/asm/x86-defns.h>
> +
>  #define MSR_MTRRphysBase(reg) (0x200 + 2 * (reg))
>  #define MSR_MTRRphysMask(reg) (0x200 + 2 * (reg) + 1)
>  #define MSR_MTRRcap          0x00fe
> @@ -71,23 +73,32 @@ void cacheattr_init(void)
> =20
>      addr_mask =3D ((1ull << phys_bits) - 1) & ~((1ull << 12) - 1);
>      mtrr_cap =3D rdmsr(MSR_MTRRcap);
> -    mtrr_def =3D (1u << 11) | 6; /* E, default type WB */
> +    mtrr_def =3D (1u << 11) | X86_MT_WB; /* E, default type WB */
> =20
>      /* Fixed-range MTRRs supported? */
>      if ( mtrr_cap & (1u << 8) )
>      {
> +#define BCST2(mt) ((mt) | ((mt) << 8))
> +#define BCST4(mt) (BCST2(mt) | (BCST2(mt) << 16))

This should include a cast to uint32_t, just like BCST8 includes a cast
to uint64_t.  It doesn=E2=80=99t have any functional impact since none of t=
he
memory types have the high bit set, but it makes the correctness of the
code much more obvious to readers.

> +#define BCST8(mt) (BCST4(mt) | ((uint64_t)BCST4(mt) << 32))
>          /* 0x00000-0x9ffff: Write Back (WB) */
> -        content =3D 0x0606060606060606ull;
> +        content =3D BCST8(X86_MT_WB);
>          wrmsr(MSR_MTRRfix64K_00000, content);
>          wrmsr(MSR_MTRRfix16K_80000, content);
> +
>          /* 0xa0000-0xbffff: Write Combining (WC) */
>          if ( mtrr_cap & (1u << 10) ) /* WC supported? */
> -            content =3D 0x0101010101010101ull;
> +            content =3D BCST8(X86_MT_WC);
>          wrmsr(MSR_MTRRfix16K_A0000, content);
> +
>          /* 0xc0000-0xfffff: Write Back (WB) */
> -        content =3D 0x0606060606060606ull;
> +        content =3D BCST8(X86_MT_WB);
>          for ( i =3D 0; i < 8; i++ )
>              wrmsr(MSR_MTRRfix4K_C0000 + i, content);
> +#undef BCST8
> +#undef BCST4
> +#undef BCST2
> +
>          mtrr_def |=3D 1u << 10; /* FE */
>          printf("fixed MTRRs ... ");
>      }
> @@ -106,7 +117,7 @@ void cacheattr_init(void)
>              while ( ((base + size) < base) || ((base + size) > pci_mem_e=
nd) )
>                  size >>=3D 1;
> =20
> -            wrmsr(MSR_MTRRphysBase(i), base);
> +            wrmsr(MSR_MTRRphysBase(i), base | X86_MT_UC);
>              wrmsr(MSR_MTRRphysMask(i), (~(size - 1) & addr_mask) | (1u <=
< 11));
> =20
>              base +=3D size;
> @@ -121,7 +132,7 @@ void cacheattr_init(void)
>              while ( (base + size < base) || (base + size > pci_hi_mem_en=
d) )
>                  size >>=3D 1;
> =20
> -            wrmsr(MSR_MTRRphysBase(i), base);
> +            wrmsr(MSR_MTRRphysBase(i), base | X86_MT_UC);
>              wrmsr(MSR_MTRRphysMask(i), (~(size - 1) & addr_mask) | (1u <=
< 11));
> =20
>              base +=3D size;
>=20

With the suggested change:

Acked-by: Demi Marie Obenour <demi@invisiblethingslab.com>
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--1V8L5AtfQjXI+Vj/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOh9LEACgkQsoi1X/+c
IsHVeg/+KQRDqNFuqzdA4R0fte19aXw28ldUCYezDQf3IUTo2wlhB4CYfYhnTx/Q
yXFg983NSiHsK0DsRiFnVIOX1QCEl9tdLal38xhcC5feXZc+CuGj5yL/5AxVyVbc
RS72w6OjKKP/5GyY13wxYjaJChgAcznQ2g/qmPVaQTsxXe/5eBJLkwhFSFHxFIuU
6PFCArt2Qqpf3tyRo9sTcxa70476fqCLtpBmozyvNPofEmjUSrf6BYcGOFkALyiC
IVelBdcOUJtbvWr6CzwyKsRmgrhGYSMibjXTQ9I5r/akQiRJCQVybmn26eFetz/B
woz5L6h9JLVyNIqR8KN+HddwFe4Tc/HDWDPOgJ3x0mI0vvGn9uIgzYZVfilSmx1G
MbT5KiQBc0p3pDmxSQaG9IFGIRiRMfyJ9fJOK8mZNf5m7pDIE9QXWCdQPvLXWUE9
CrE0AmQhKBXQmHqeMkfHXeNHBDMymFgZ+50tIbFwlfrIJ7G0jtBLFIPAYVycpaeM
vJ8zDcWQ8GrXqIANvbIfq6TRVjv4pk2EzcOjXI6VcMycpsDLqFfQnZrf7//bE1Sc
+1eEkldnlUFU3wLNLrtCVMFj1g3i05DgnwzAac0piBk9fzrMYgcp334kLQ8dKNMn
LCn4WR3wYyIHyNOD1XGey6C6iBQeWMhC9bGcXMaGNxo6ZdnpcBE=
=zL5F
-----END PGP SIGNATURE-----

--1V8L5AtfQjXI+Vj/--

