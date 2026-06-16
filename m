Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vQZmL7orMWqNdAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:55:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A35968E860
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:55:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=q7tgZ8P8;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=dl6ejMDA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1339116.1600246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRSA-0000iB-Ss; Tue, 16 Jun 2026 10:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339116.1600246; Tue, 16 Jun 2026 10:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRSA-0000fP-QJ; Tue, 16 Jun 2026 10:55:34 +0000
Received: by outflank-mailman (input) for mailman id 1339116;
 Tue, 16 Jun 2026 10:55:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wZRSA-0000fJ-6R
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:55:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZRS8-009JU9-EK
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:55:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a312ba1-2eae-0a2a0a5409dd-0a2a450389f2-18
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:55:32 +0200
Received: from [103.168.172.145] (helo=fout-a2-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a312ba2-672d-0a2a45030019-67a8ac91db69-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:55:31 +0200
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id 9CC47EC0166;
 Tue, 16 Jun 2026 06:55:30 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Tue, 16 Jun 2026 06:55:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 06:55:28 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781607330;
	 x=1781693730; bh=paT4oalcm3KOO+TaIPxpERxBbPk+7kKl52VqJtXXlQU=; b=
	q7tgZ8P8hHlY7xQkIlUHkerUbu43n8FeqxbkK7VL9D21DBzrF5SvhoTBZtfpifXo
	fzxi9EAjVaGEtPowtJAN0z1r6NuQRY46HXcguI1b88oNCjNfbf7G4T6sR4N0WucE
	ChP6LagOJa3lz6mR35IAfhOfQLWumb8IDNHsSULuBG3quuEECl4gK8Z4GzmENPnU
	Ld1YSVmEuqu1cgOYfkQXL2Tpp2uLrM+dcAXzvgTdtbXMlxqrltIpXy7gAPXyir44
	poSFfrNp7jlBe6v4fHs66OeC63C2+fE8oS7BLJgRSlZG/UOWD05EqIAt35tnk6sU
	q7c0uJjwcF8FKRZzultIeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781607330; x=1781693730; bh=paT4oalcm3KOO+TaIPxpERxBbPk+7kKl52V
	qJtXXlQU=; b=dl6ejMDANGFmZLjCKkM0yCXwLVK8TxaxMGlFkmvuB89WGalTPw9
	waJDxRTySZAJ23hHCdvnE4atM+gXiIvp59ey/1fCLkR/Aq1cezYGN236UlzHaJex
	2Xyq8UyrH+V2ErOjGa8XHb41f9+3vh/cRb4fAa3AReGz7AXbXwXsiTUuzrZFGnor
	aPtZABpFPGd6w1OVIeALK4kzbLQftqA+j/eTJ7EobdQuC4Of6SmzY9su/PjfZdcS
	j/JlxwHSVMs9NV53y3pIhPefCbehGzeDXmkX7avpY5Zxoo+Sl7YqCZLY8WMlSyqA
	Rtikn4yDLv0bRVwXapXskW8kL7EvGAHPbGQ==
X-ME-Sender: <xms:oisxaiOgS1bJvbMpdGgcHHC8q-vNaornW-hDbc3ZBx1r4plub83OCw>
    <xme:oisxajOlJKl9upKoSdVT3l2tA9zNI08VBZRXaFvZ6FUfsMOI_9tuzi1ljD7MKwB8C
    y46h5td49BKH4pIhmlHSMpuBYUBHR-en-tkPMHMWNh9RBEvTA>
X-ME-Received: <xmr:oisxargETmEJhYMSMNKMcmzLw6eseK-a-SGlQTlv9gVDmhZEK8p4sA5nJhd3xlNot8g3siMglQdFWHajot6GkPQjU4BrIzOi8Ns>
X-ME-Proxy-Cause: dmFkZTFIBdxZZI9HwBwEPpwXLArSUIuLIB3Pgm+0sMnMpqnyHQPQdLGzG/0fw8vNw9didC
    FcW5/Y+D77ln7A/XADHSrmpqD3DpuTE3vZswAGz9RR/OAYAFouJjIfS1t0OpQkY25eaHrt
    4qnZpEmwDcVM5ukv4sRXjsvv1vBk1h3K+Eike4/UTD7Jnnhmuj/fvtTTCh4KCE21JW/lXX
    RtXhjL9RjYPgOHLa0TCgvYSvFd1iqiISZJki9t9AjmcfxzdkkVXfNmHBvM2bmAF7Wn09QE
    yBAKx+hOpGwAI40Lg0NcXF99oMFd7JZqmEd4rgM/VnwT0vD/2lZvgoBfEgVvDfhhDa3AVO
    vksiQDwqNYNnsnbDsa5kYMS7QigOX9On/tWPuNmTQJIIyQNy0iRntGCGAMYVssWS0ptEjM
    QCUTrb1TEmMU6j7ueKP8Z+v37TjVq0a886bHzhxBwC8k1SJDjfqGtPtzRpkmCMiIwKsKYH
    E/F8zs1/txgYGDerhPeHQ3ePb9N4n7P4au7LvRxM1ov677bXqFbh91k7vZjwTQ+CBwWR73
    aEPw4T2xwEvjv76Ka8yTXsuLyKGE81CNqFcq1zzZ4zXB1oyME1gLiZ1vtBo5dmrxJMQsHJ
    i/TzwaNBm+r+Jh9lH1Lhb2//F9tJ22Lh0vVZKsNO01tHoavlWUbZiEmeG0qQ
X-ME-Proxy: <xmx:oisxaovAxP5kdQvQcZtXmxVrUUGFZ3alTUCrizrfCetz1udnQEHYzg>
    <xmx:oisxapSxm5D-0vno8AH7SfGgMXnjTLfkufQ628vEAF-HVmARB0RQCg>
    <xmx:oisxas3zktKcNALghyOOXsCC9szDzkJRyouUa3ZZXldljZv9KqBUAw>
    <xmx:oisxautXcqrPlCY3Mun7cFE9xngCc7YPn9KQxAd5VxbOj7OpzB65hQ>
    <xmx:oisxaiStYptsU1VK4iAZKvCQBYHcSo18agVqFYBjf4DOD_MKuVtWnRb5>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 16 Jun 2026 12:55:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 2/4] x86/efi: discard multiboot support for PE binary
Message-ID: <ajErn-h80lsmnpuZ@mail-itl>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-3-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uT8HW5cgl2WL0tf0"
Content-Disposition: inline
In-Reply-To: <20260616101336.44009-3-frediano.ziglio@citrix.com>
X-purgate-ID: tlsNG-33051d/1781607332-41B92938-812D4C12/0/0
X-purgate-type: clean
X-purgate-size: 4665
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,mail-itl:mid,citrix.com:email];
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
X-Rspamd-Queue-Id: 1A35968E860


--uT8HW5cgl2WL0tf0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 12:55:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 2/4] x86/efi: discard multiboot support for PE binary

On Tue, Jun 16, 2026 at 11:13:34AM +0100, Frediano Ziglio wrote:
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

> --
> Changes since v1:
> - improve commit message;
> - change section orders to avoid changing code order in final executable;
> - merge 2 commits;
> - removed deprecated documentation section.
>=20
> Changes since v2:
> - Update commit message, join 2 sentences together.
> ---
>  docs/hypervisor-guide/x86/how-xen-boots.rst | 6 ------
>  xen/arch/x86/boot/head.S                    | 3 ++-
>  xen/arch/x86/xen.lds.S                      | 5 +++++
>  3 files changed, 7 insertions(+), 7 deletions(-)
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
> index 77bb7a9e21..90faf411b9 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -152,7 +152,7 @@ vga_text_buffer:
>  efi_platform:
>          .byte   0
> =20
> -        .section .init.text, "ax", @progbits
> +        .section .init.multiboot, "ax", @progbits
> =20
>  early_error: /* Here to improve the disassembly. */
> =20
> @@ -710,6 +710,7 @@ trampoline_setup:
>          /* Jump into the relocated trampoline. */
>          lret
> =20
> +        .section .init.text, "ax", @progbits
>  ENTRY(trampoline_start)
>  #include "trampoline.S"
>  ENTRY(trampoline_end)
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index f758940674..749d9719cc 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -57,6 +57,10 @@ SECTIONS
>    __image_base__ =3D .;
>  #else
>    . =3D __image_base__;
> +  /DISCARD/ : {
> +    *(.text.header)
> +    *(.init.multiboot)
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
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--uT8HW5cgl2WL0tf0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoxK58ACgkQ24/THMrX
1yxd5ggAgS15x0i4cOosIwJAKctVzahpyZdm5Ve0QDmZ9c8GIm9LJzimn1tvEmPA
6hNtc7vCKE8bgq+rgKgz8XIj6cxufZQjCs1FwxW2cHcp0UguqWBxD5n4YelIcHaK
7gf9dVQxsPLJEySIz48aH4+dQ7HkwEoTJZgtY+Az0zFUizRWYqdXOhpVODhcJV1i
sl9OcVI7hf1EacGl6uYANAerwfyZ+KY11OTLi8Ko7MZYVxSosJFGWZQmJhSHhAd0
Zyjxp8nvrT8fB4k5A3EBmZNLmy2rc4fGWTMs323bD9ZrsdW8YThbjGZmztsLtyqG
1DHR3L9bp6N1w3YLDqgrH3vngOmL9A==
=RGls
-----END PGP SIGNATURE-----

--uT8HW5cgl2WL0tf0--

