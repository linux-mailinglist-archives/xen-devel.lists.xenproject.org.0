Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11117C593AA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 18:42:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161997.1489800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJbK2-0001l6-8J; Thu, 13 Nov 2025 17:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161997.1489800; Thu, 13 Nov 2025 17:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJbK2-0001jD-5n; Thu, 13 Nov 2025 17:41:26 +0000
Received: by outflank-mailman (input) for mailman id 1161997;
 Thu, 13 Nov 2025 17:41:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25e8=5V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vJbK1-0001j7-B7
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 17:41:25 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8598454-c0b7-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 18:41:23 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id 49D53EC0089;
 Thu, 13 Nov 2025 12:41:22 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Thu, 13 Nov 2025 12:41:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 12:41:21 -0500 (EST)
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
X-Inumbo-ID: f8598454-c0b7-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763055682;
	 x=1763142082; bh=gHKXClYYrCBco1puBbE2Urrx95U7Z2cjEpg996coTqI=; b=
	fuidTPhnWIh7daEPC4J2k9LxEUqEuAlpVDKVramc/EA6p7mgrsOlixQQfz/yeMsG
	7GgKE7ke1KDTJy9CwJ0oWcvU4cll8HeDqUUHupNK8o6DDQx7WHSgiUoaeOOzFvcC
	IVr8ftOds5gdbhbDBfPUzc1APDnS0EGFU8q7l0YltfKeTWVJ0DQV5OGhQb6huAn4
	jPru2vF2E+gh0WjshgcKS2ofij0VDsCW52qX3luVUq0LShyQkRdw+OXu0r4ABNRp
	Ydywstbu+Q69rn/XieDOm/jELtnZYZYHFvkwuqa4i+/ah9mS2LP3cAwptz0rY+CF
	jZykTs+JqGOE6KLv3jiPKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763055682; x=1763142082; bh=gHKXClYYrCBco1puBbE2Urrx95U7Z2cjEpg
	996coTqI=; b=0FeK1CMvUW1/hLN/S3j7l94xYCaePgVHD3R6Dyk2sX/AFhBkxP5
	MbIpcf+3yeHHXQU38Qlju9O1q29eR4TGv3NwodJAFsQ+O5BTmOn5gn+ts7bpXA0X
	bl/j1mTpk+Ct36dJw6XWxORrFL7scsu2tPP9N931YyiQNNa5zruRDsBQDCrJvp3k
	ri5KY6HqGeLEGjNfc0b/rxPwS30xymTIvmtBbnTw0U0nJGAyvbfi7ymaEXWU0ust
	e8CzRLv3JEXX8Z06BqvxHT8ZTD2KgTvtAM51eu0kiiQgA/QhMD4+0s9GGxWJk7GC
	OtlWPRZ7YaWNXiHOdMX9vAi5G7B8tapmhSA==
X-ME-Sender: <xms:QhgWaZBPhL1_1MA3klMnLCXZ11n55jZHZ2HATTQSuB_H7hrFP4lccw>
    <xme:QhgWaegAwCy7ObGN1HOlhsjIPd0DCECvPRjs23U2qtSlsNMfjSdxsbjSa9z8gyrjx
    koYlfqrC1v9sYSeWA93qmkZJsGgjRynD0HMSY1BZSwWP51vZw>
X-ME-Received: <xmr:QhgWaZngWgKhalDE4YjeCe5VPjZUSTAZVghDHPd60LWx6MVhmo4yGwErnKjjReqxo8gaQYooP72AU8N2uzwRA4ZmdKeZ0ClgPsU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdejheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueegvedv
    leekgedvheeviedufeduheefheekjefffeelueeihefgtdetudetieeknecuffhomhgrih
    hnpehlughsrdhssgdpsghrkhdrphgrghgvnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopeigvg
    hnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthho
    pegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoheprh
    hoghgvrhdrphgruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:QhgWaSolpzqA-ymmrmE_wAriAyrsBOhT8jen_n7YUmxs7Tms84cDcg>
    <xmx:QhgWaaHEh4Bod0vd3LWsSN_KoUVpZIfpq_CF43WD9IULt8Y4XTDFxQ>
    <xmx:QhgWaWyseeWS5kwJUGxZVgNbVXBxuPeVN-6BmJdnPMYX2kWXoB_3CA>
    <xmx:QhgWaXqFMimWyhDVitLa4JLFBAtkiwZ9SGM5-pAZLPVSQh2EgYb9Mg>
    <xmx:QhgWaRzZ8NVKU9pxXVBbA8aBcZtfiYTcnP35fLCOLlfkTGcDAeEhRSpI>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 13 Nov 2025 18:41:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/3] x86: introduce "brk" allocator
Message-ID: <aRYYP8fG9fgvGGYS@mail-itl>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
 <7a3eb7f3-db3e-4c2f-a231-cdf05a14be26@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2iEgZDYNAhp1kLmw"
Content-Disposition: inline
In-Reply-To: <7a3eb7f3-db3e-4c2f-a231-cdf05a14be26@suse.com>


--2iEgZDYNAhp1kLmw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Nov 2025 18:41:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/3] x86: introduce "brk" allocator

On Thu, Nov 13, 2025 at 12:08:18PM +0100, Jan Beulich wrote:
> ... to replace ebmalloc(), and then to find further use(s) to allow
> recovering memory which is needed very early (and hence needs setting up
> statically), but may not fully be used (or not used at all).
>=20
> Note that unlike free_ebmalloc_unused_mem(), brk_free_unused() (once
> other code is converted) will be able to free part of the BRK space even
> in the xen.efi case. That would happen if BRK space extends across a 2Mb
> boundary, and actual use stops before that boundary.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changing setup.c's reserve_e820_ram() uses would be cumbersome when done
> right here. That'll be done when ebmalloc() is replaced, and hence
> what's there can also simply be replaced.
>=20
> The xen.efi detection may want separating out into a helper.
>=20
> When linking xen.efi, ld produces a base relocation for the reference to
> __subsystem__, which is wrong (that's an absolute symbol, after all).
> While that will need fixing there, it does no harm for our purposes.
>=20
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,4 +1,5 @@
>  obj-bin-y +=3D head.o
> +obj-bin-y +=3D brk.init.o
>  obj-bin-y +=3D built-in-32.o
>  obj-bin-y +=3D $(obj64)
> =20
> --- /dev/null
> +++ b/xen/arch/x86/boot/brk.c
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/efi.h>
> +#include <xen/lib.h>
> +#include <xen/mm.h>
> +#include <xen/page-defs.h>
> +
> +#include <asm/brk.h>
> +
> +extern char __brk_start[];
> +extern const char __bss_end[];
> +
> +static unsigned long __initdata allocated;
> +static bool __initdata finished;
> +
> +void *__init brk_alloc(size_t size)
> +{
> +    void *ptr =3D __brk_start + allocated;
> +
> +    if ( finished )
> +        return NULL;
> +
> +    /* Allocations PAGE_SIZE and up will be page-aligned. */
> +    if ( size >=3D PAGE_SIZE )
> +        allocated =3D ROUNDUP(allocated, PAGE_SIZE);
> +
> +    allocated +=3D ROUNDUP(size, sizeof(void *));
> +
> +    if ( allocated > __bss_end - __brk_start )
> +        return NULL;
> +
> +    return ptr;
> +}
> +
> +unsigned long __init brk_get_unused_start(void)

It's a bit unintuitive for brk_get_* to have this significant side
effect. Maybe name it brk_finalize_get_unused_start() ?

> +{
> +    finished =3D true;
> +
> +    allocated =3D ROUNDUP(allocated, PAGE_SIZE);
> +
> +    return (unsigned long)__brk_start + allocated;
> +}
> +
> +void __init brk_free_unused(void)
> +{
> +    unsigned long start =3D brk_get_unused_start(),
> +                  end =3D (unsigned long)__bss_end;
> +    unsigned int subsys;
> +
> +    /*
> +     * Only xen.efi will have the symbol __subsystem__ available, and it=
'll
> +     * be non-zero (10) there.  In ELF the symbol will be undefined, and
> +     * hence zero will be loaded into the register.
> +     */
> +    asm ( ".weak __subsystem__; mov $__subsystem__, %0" : "=3Dr" (subsys=
) );

Is this really the best way to detect xen.efi?

> +
> +    /* using_2M_mapping() isn't available here. */
> +    if ( IS_ENABLED(CONFIG_XEN_ALIGN_2M) || subsys )
> +        start =3D PAGE_ALIGN_2M(start);
> +
> +    if ( start >=3D end )
> +        return;
> +
> +    destroy_xen_mappings(start, PAGE_ALIGN_2M(end));
> +
> +    /*
> +     * By reserving needed space early in the E820 map, excess space get=
s freed
> +     * way before we make it here. Don't free the range a 2nd time.
> +     */
> +
> +    printk(XENLOG_INFO "Freed %lukB unused BRK memory\n", (end - start) =
>> 10);
> +}
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/brk.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/types.h>
> +
> +void *brk_alloc(size_t size);
> +unsigned long brk_get_unused_start(void);
> +void brk_free_unused(void);
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -331,7 +331,11 @@ SECTIONS
>         __bss_start =3D .;
>         *(.bss.page_aligned*)
>         PERCPU_BSS
> -       *(.bss .bss.*)
> +       *(.bss .bss.[a-zA-Z0-9_]*)
> +       . =3D ALIGN(PAGE_SIZE);
> +       __brk_start =3D .;
> +       *(.bss..brk.page_aligned*)
> +       *(.bss..brk*)
>         . =3D ALIGN(POINTER_ALIGN);
>         __bss_end =3D .;
>    } PHDR(text)
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -112,6 +112,7 @@
>  #include <xen/vmap.h>
>  #include <xen/xmalloc.h>
> =20
> +#include <asm/brk.h>
>  #include <asm/e820.h>
>  #include <asm/fixmap.h>
>  #include <asm/flushtlb.h>
> @@ -337,6 +338,8 @@ void __init arch_init_memory(void)
> =20
>      efi_init_memory();
> =20
> +    brk_free_unused();
> +
>  #ifndef NDEBUG
>      if ( highmem_start )
>      {
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--2iEgZDYNAhp1kLmw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkWGD8ACgkQ24/THMrX
1yzheQgAiF7yNHN2W5CKuhIgz+OIlWwZhwMdeWKzr/f7rxLu66o9GZ1i/lfDGnhj
fTzKSN400lIqlJSVkr3LsV8Be3XEnsFfnQGyjygS+7HeLTTDC5O8kqkL1Yh0yl/A
BfM4ILVFCuUGNItZxeAbQrfWHoZSqZnEfgd69G7zrkEnJMrp6uLwOW4Xe6FdO9jg
ILecnXJ2YTK1knOsU6lIhKh54zjJm5Zt9uIcpRh/vNwlG2Ptx435o075KfdJd4C8
Ulz72j+ITC6hkMyTsPrIGuljrBOOBUWfGIai2JcNwCbf+Z20pmjzAP6Giy+s2NeE
QYQhAMdBNiiCRrVTyL/LujbDogjv7Q==
=Wzvn
-----END PGP SIGNATURE-----

--2iEgZDYNAhp1kLmw--

