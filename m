Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fnj8CcptVmpv5QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 19:11:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 354267573A6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 19:11:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm2 header.b="A/isoBtb";
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=lZPoiOwE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1362459.1614288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjgeX-0004tr-2T; Tue, 14 Jul 2026 17:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362459.1614288; Tue, 14 Jul 2026 17:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjgeW-0004s1-VO; Tue, 14 Jul 2026 17:10:40 +0000
Received: by outflank-mailman (input) for mailman id 1362459;
 Tue, 14 Jul 2026 17:10:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wjgeU-0004rv-T0
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 17:10:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjgeU-000jh1-9N
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 19:10:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a566d74-bab6-0a2a0a5309dd-0a2a45098fd2-44
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 19:10:38 +0200
Received: from [202.12.124.153] (helo=fhigh-b2-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a566d8c-be1a-0a2a45090019-ca0c7c99b267-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 19:10:37 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 2359A7A0055;
 Tue, 14 Jul 2026 13:10:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Tue, 14 Jul 2026 13:10:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 13:10:33 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784049035;
	 x=1784135435; bh=2aTPHzGnmUjn0RwopJKNfMCfH2eaZYN+yBpqwJp4Rkg=; b=
	A/isoBtbokFMKyFC1fKwImKpMUQxnK1n3H1jGJ2z30dS+Oty7Y1kp1z6rWiuECXv
	8Oxyap3nEvkqO0LLZNd+fisn0hfb5anGd9eAa7EZ1hD/6o5BdMfgdvDAtTEifzNx
	HX62z1GINU8qpGEfg6btTqLpGgGEjTQdCE33C9JVplw+the+68i/a14o3ltvfL9a
	e4KdaePzuk62ukl8eIBcEDp5DVOKHDIECIqHnajDILTCuKnU7tIT95p+kAPBnaUp
	nW0W4SS/A4iS7x7sdzK+FyzQg5eEdqKMLqpoqpvrkJuWIh4hDmeYgozFOWzP3yLH
	x3u7kUCrmc3OvUdKuTvqxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784049035; x=1784135435; bh=2aTPHzGnmUjn0RwopJKNfMCfH2eaZYN+yBp
	qwJp4Rkg=; b=lZPoiOwEKgLdw6pIgMuRLcSTiIreDJccERIPP5S2jOSPSXQmQpy
	Jhs2781UOko/C3EUDtADdSKEVDdd37nGbgCfDAJPV8DQtZTPdV5nzm6q3x2+owQA
	6burTlrHqK0kmYMBSQUOvFJQnzJ0+MvKxAGfRhxSZObbh3HLx4cv2D7iyGhxGp4q
	Bci1Abdal2wSeElpwFQK4TC+cEs4YB8P1QvLJrm+rFU3VGg7nQM/GdPrNa9foChH
	/Hd8dUcSixTW/PDjuLJ3HF+y/QuEJmYaj3eakJwO/XqxyyB8LJ1io3ST8UG6KHrs
	ykd9D+wPOivgNCh/XPBCSslRRZR7x3VyhoQ==
X-ME-Sender: <xms:i21Wam54Ft_QJKNW4ThQ2TCFPqLSP8R0VSBSG2rc_AQM8xMmapKAKA>
    <xme:i21WaiIf-pTWkm0JfAiHsJMAA5Mq8a6bmQzl_3WhJSB4xUKGLmFyjq8mm9wOWmIDO
    Qyqc70kCMZYozW4JOxVStvtLGXF4bCCd23Jii9sBpT3SO4A3g>
X-ME-Received: <xmr:i21WanupE0HAeMQ_fx4pibz_lk0eBdw7ZDgKOnmgIbjMgQNymErmNnv8ae1SNb_Pu_NB5pU33bAAJd4OUGkzlxOCzMsEZastiDY>
X-ME-Proxy-Cause: dmFkZTFmIYFv6LSMkaln0wGafLbxL38DcrNEeYdHl6Djzp0zL610NkQyEOAR2js04RoUod
    hYpc8QbwH/urieFqQ3TrwFg3fnZjVKlHYlfyHcvBvg6LgNHrtUT/GmHqD3LeE4ylUtFbfl
    i+LuJ6ywjp2VugzaA04wMs8zkqSBDv4XEZ/KiEhFvssLeAWOvgYXKVklfX+5fKA3qoPmm+
    VSUReqEMI1Qw/A4u7PAwfs+9urzyVtd2kkFx4QmmxNbJ1MH5nt+SdHMDVNBiWKyCIw5wj/
    dJuUTr2aYU8Pxw1O0tyHmSUkfmeXmbS4Gu/yy4XyfohnPL+d7Mm953AU0gCoXFXj+SJDHm
    /wjkASeFXKSDaVTy1qEoQeLH9aq+Ligt3VUae738ihXxVeoGRyzJTU/yP43XzCdEFlgDhA
    W++4wiav5xuBFwjlw0Fbz86KPAFZa2LmvdwILAC29hcvV6nO+8pcq26vre6oJ4aW0O7JYS
    tjZVYFcI6s1BGsmg8bAEs1l7IwnwBj7I2OGRtYiI3NZmFZn40epbg37OsJO/lEn0ElUMHz
    URR9rng3HcnBw6lKAWSEzXIYP7NKhV7pBq2jhn0IFN9mqqHob6RLbj7MS3IXZntVE4MRjq
    3I5+rsA44DzCB1ppjMWP1MBCSzOk80+BlyNNznpQSGuu7qblfVjE2mYPSAzw
X-ME-Proxy: <xmx:i21WapIZt9Xrw6OEFLY_88d7gCOMkGzR0_IAVGgW7iGn2RmJMkoqLA>
    <xmx:i21Wao_jO_Ze4apnhg9TuGtvmz_XLp4UhcHb_7adZp0yNAZTkCHOAw>
    <xmx:i21Waqy9E8KZ9VT-RDcvLCXnHTHGsZYjI-jFTt3qSPNR617SQf7Cew>
    <xmx:i21Wat6lOtUv_E2LFbC03AIH-CoodhRr1qetFehsdp2eMaDNaE4A0Q>
    <xmx:i21WaqN4Xv1cmdfOh_1iimWnAZAHYHIp_nMEicl2Z3ln4QHtOHR72FSg>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 14 Jul 2026 19:10:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v7 2/4] x86/efi: discard multiboot and PVH support for PE
 binary
Message-ID: <alZth4ETay5AL-1T@mail-itl>
References: <20260706104557.430097-1-frediano.ziglio@citrix.com>
 <20260706104557.430097-3-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M+dZevWwTgEMElMU"
Content-Disposition: inline
In-Reply-To: <20260706104557.430097-3-frediano.ziglio@citrix.com>
X-purgate-ID: tlsNG-bad1c0/1784049038-39AC0034-18FB42E5/0/0
X-purgate-type: clean
X-purgate-size: 6978
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,citrix.com:email];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 354267573A6


--M+dZevWwTgEMElMU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 19:10:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v7 2/4] x86/efi: discard multiboot and PVH support for PE
 binary

On Mon, Jul 06, 2026 at 11:45:55AM +0100, Frediano Ziglio wrote:
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Multiboot and PVH booting are not supported for PE, hence discards them
> in the linker script when doing a PE build.
>=20
> That removes some relocations that otherwise appear due to the usage of t=
he
> start and __efi64_mb2_start symbols in the multiboot2 header.
>=20
> Section discarding is not done updating DISCARD_SECTIONS definition as the
> change is specific for x86.
>=20
> No functional change intended.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Changes since v1:
> - improve commit message;
> - change section orders to avoid changing code order in final executable;
> - merge 2 commits;
> - removed deprecated documentation section.
>=20
> Changes since v2:
> - Update commit message, join 2 sentences together.
>=20
> Changes since v3:
> - Added Acked-by.
>=20
> Changes since v4:
> - more clear subject;
> - removed more code/data from EFI output;
> - removed Acked-by.
>=20
> Changes since v5:
> - simplify section exclusion using more wildcard;
> - exclude more multiboot functions.
> ---
>  docs/hypervisor-guide/x86/how-xen-boots.rst | 6 ------
>  xen/arch/x86/boot/head.S                    | 8 ++++----
>  xen/arch/x86/xen.lds.S                      | 7 +++++++
>  xen/tools/combine_two_binaries.py           | 2 +-
>  4 files changed, 12 insertions(+), 11 deletions(-)
>=20
> diff --git a/docs/hypervisor-guide/x86/how-xen-boots.rst b/docs/hyperviso=
r-guide/x86/how-xen-boots.rst
> index 8b3229005c..b6d852050a 100644
> --- a/docs/hypervisor-guide/x86/how-xen-boots.rst
> +++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
> @@ -82,12 +82,6 @@ When a PEI-capable toolchain is found, the objects are=
 linked together and a
>  PE32+ binary is created.  It can be run directly from the EFI shell, and=
 has
>  ``efi_start`` as its entry symbol.
> =20
> -.. note::
> -
> -   xen.efi does contain all MB1/MB2/PVH tags included in the rest of the
> -   build.  However, entry via anything other than the EFI64 protocol is
> -   unsupported, and won't work.
> -
> =20
>  Boot
>  ----
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 68b963ce6f..981f262b5e 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -126,7 +126,7 @@ multiboot2_header:
>          .size multiboot2_header, . - multiboot2_header
>          .type multiboot2_header, @object
> =20
> -        .section .init.rodata, "a", @progbits
> +        .section .init.rodata.multiboot, "a", @progbits
> =20
>  .Lbad_cpu_msg: .asciz "ERR: Not a 64-bit CPU!"
>  .Lbad_ldr_msg: .asciz "ERR: Not a Multiboot bootloader!"
> @@ -137,8 +137,7 @@ multiboot2_header:
>  .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
>  #endif
> =20
> -        .section .init.data, "aw", @progbits
> -        .subsection 1 /* Put data here after the page tables (in x86_64.=
S). */
> +        .section .init.data.multiboot, "aw", @progbits
>          .align 4
> =20
>          .word   0
> @@ -154,7 +153,7 @@ vga_text_buffer:
>  efi_platform:
>          .byte   0
> =20
> -        .section .init.text, "ax", @progbits
> +        .section .init.multiboot, "ax", @progbits
> =20
>  early_error: /* Here to improve the disassembly. */
> =20
> @@ -712,6 +711,7 @@ trampoline_setup:
>          /* Jump into the relocated trampoline. */
>          lret
> =20
> +        .section .init.text, "ax", @progbits
>  ENTRY(trampoline_start)
>  #include "trampoline.S"
>  ENTRY(trampoline_end)
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 8e63cf5bc2..4ed1d2bec1 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -57,6 +57,10 @@ SECTIONS
>    __image_base__ =3D .;
>  #else
>    . =3D __image_base__;
> +  /DISCARD/ : {
> +    *(.text.header)
> +    *(.init.*multiboot)
> +  }
>  #endif
> =20
>  #if 0
> @@ -195,6 +199,7 @@ SECTIONS
>    DECL_SECTION(.init.text) {
>  #endif
>         _sinittext =3D .;
> +       *(.init.multiboot)
>         *(.init.text)
>         *(.text.startup)
>         _einittext =3D .;
> @@ -220,6 +225,7 @@ SECTIONS
>         *(.init.rodata.cf_clobber)
>         __initdata_cf_clobber_end =3D .;
> =20
> +       *(.init.rodata.multiboot)
>         *(.init.rodata)
>         *(.init.rodata.*)
> =20
> @@ -234,6 +240,7 @@ SECTIONS
>         *(.initcall1.init)
>         __initcall_end =3D .;
> =20
> +       *(.init.data.multiboot)
>         *(.init.data)
>         *(.init.data.rel)
>         *(.init.data.rel.*)
> diff --git a/xen/tools/combine_two_binaries.py b/xen/tools/combine_two_bi=
naries.py
> index 581e57cbc0..5f0433dcad 100755
> --- a/xen/tools/combine_two_binaries.py
> +++ b/xen/tools/combine_two_binaries.py
> @@ -33,7 +33,7 @@ parser.add_argument('--map', dest=3D'mapfile',
>  parser.add_argument('--exports', dest=3D'exports',
>                      help=3D'Symbols to export')
>  parser.add_argument('--section-header', dest=3D'section_header',
> -                    default=3D'.section .init.text, "ax", @progbits',
> +                    default=3D'.section .init.multiboot, "ax", @progbits=
',
>                      help=3D'Section header declaration')
>  parser.add_argument('-v', '--verbose',
>                      action=3D'store_true')
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--M+dZevWwTgEMElMU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpWbYcACgkQ24/THMrX
1ywWRwf/a1B5n14oOlc7zpSlBBP/1d8plEPq52NKU0GDbWMCPhS5u+SFfC/nVppe
BQia/4F44ZY1wwQXTUjc6nahUMedPrAw0uUFQHZyrTzwZiN2fOa2dO5aspEeIgH8
HuSEOS4F4SmCac6qi91aYVCIfdAR6ULVO3SrfE4EvidumRZIHTGFF+cEubaf6T+j
8WsqlNT0RiOmj0UIL8L1px1hEt28J7S3jUzRZrOMUtaBfF4kWmTLPS4hdfqfTJ8r
R3OsfHfV/PSPv5SLQxIqeanHv4+oIIuWLnPX2h3ueNDTAESJ6r8PEq0Pu4bsmin3
pqCvjROjHza+OWuiqOomrjjk2YyrvQ==
=3CFy
-----END PGP SIGNATURE-----

--M+dZevWwTgEMElMU--

