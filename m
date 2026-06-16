Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dpUMJbotMWp4dQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 13:04:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C919268E9D1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 13:04:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=bDgSM74t;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=O7tz276L;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1339133.1600264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRaX-0003eq-VS; Tue, 16 Jun 2026 11:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339133.1600264; Tue, 16 Jun 2026 11:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRaX-0003dD-SW; Tue, 16 Jun 2026 11:04:13 +0000
Received: by outflank-mailman (input) for mailman id 1339133;
 Tue, 16 Jun 2026 11:04:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wZRaW-0003d7-JT
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:04:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZRaV-004LXc-RF
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 13:04:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a312da2-2eae-0a2a0a5409dd-0a2a4509d79e-42
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 13:04:11 +0200
Received: from [103.168.172.145] (helo=fout-a2-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a312daa-2497-0a2a45090019-67a8ac9194cb-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 13:04:11 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 6965AEC0187;
 Tue, 16 Jun 2026 07:04:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Tue, 16 Jun 2026 07:04:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 07:04:08 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781607850;
	 x=1781694250; bh=jwGpoLYUTWbvo+6XSv+bwCK4L5tijGXbFsJMgzgmhLw=; b=
	bDgSM74tewsYr9ExbXudum67u44V1s0XmbCBtO3yxK8OhJk6JqAqjdVRE+Pzd+Th
	69JAu8K2VJtfjL+Bh9nU6OQ94x0db5gBYmZm4oyaB/EXaZ24c/qEAEFkEwjrxbOo
	v420Nidha1v/CV2pc++1qJhwJ/chE3apHt5DY7GT1U2zR/EW5nSMbnzCX1fPBJFS
	iJFAJArcP2zzvhByCLjwBHMMhg9T/WPyxSkBfyVWch5W153wY723FxkQ9ZRNH5G6
	zQuziBCQ6RVEa5INnvaEmmLRkSnyh6wQ9WFx80nFX7uV/9jf9jewteHKl8pKXGOD
	iGOjqpt+EuDcqedFObBmtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781607850; x=1781694250; bh=jwGpoLYUTWbvo+6XSv+bwCK4L5tijGXbFsJ
	MgzgmhLw=; b=O7tz276LVtUuT+Cyq3EmKRkFCvgBXsvoKiswkeKOcLIkkYOZw0x
	HetmDS7EyHLkfdmGI00Fyghxk8r+0U3v6sA2SsN0GRxmSEp09pc8JgGTfns7vJ64
	OzIJEwESGP4A1lt4raq3A/6CsLfLX51Ee7H9Q2l7B8oQk7so0eCkHyWhYtaFBNGF
	kqJ0SahDUJ7v50C11CgDKGxz1Ds5Q2jZLilL4rmDEORTlZdipCG4ibFsS3O7F1k/
	7sswSX8iTyY5JjuGVw4ZZHkdWTBKspphOkjf64h9gDwmjwPMJtv3Vz7z6QMkwXN9
	05T20Wgm/RQchMzp4UYLoRoceNnjoq+erhg==
X-ME-Sender: <xms:qi0xagUvqP7gQm0bCR7HGH0-8bk-EAaMs0qUpfzH2DsAqcV3s-gGsQ>
    <xme:qi0xajp-38S6x70jJYSz_A22OikG_GlSfQhXaF5fYSqzbmvAKlpddK7C72o0Ful4Z
    fBkeZwSrrpTjrHGSPfvymRnkZMmdFjza1Zjcg8Ksrphr_CSdQ>
X-ME-Received: <xmr:qi0xaqmYldtB8mkmBnOt6iKX2M_zAtqDuk5vh9G9J7Ej0gFUAgl-umlgShMTPt6vLr0qq3uwoQ4m_UoEeWqeNJmUVLpvfDaWvkA>
X-ME-Proxy-Cause: dmFkZTEhNBi7ctDgzZKjD3+AgGPLhB/HU0GG79cL3CBw+NI8NYRmER54++Aq+C//hlo5BA
    w+zsuRGZIgQ3ZT6CTID6bjhb4G+4Ub6sTLGKebjMG3Xu8mhQsmD/gYvplG9gO10PWovHh6
    yRsZ85zg4DygAr8ket88u8wfyO8H2th+ajI2xInzCZRItS09aHGvSiHRewp2eEKRUo08df
    /Q0P6xn741B4fj53fQqcEEmcS/NxpuHtdLAGezmq/Qemi2QPzciXbcBekBrkUqphkPBtUe
    IvBwnFQYyWZ3zXG93410E+O/i8fxCDY+fafhDeNifnMZtfkoJWOHur9LhcnhxsulRHRVrc
    5T0r+gtEWT6ubYg/GyiVqvtbvBOFQXJGlB3qviKqxLjuPO9PxzzzqF67uVLtSUwyaB1cmQ
    rGZW0RNReiirJ2j4ZSwco2GeifUYaFqbPlyb0/dsjw7VjFb0okQOu56/OqrzegP2zgZ21V
    Pswn9PC2QpCvkQ/n/wUJ9jb1V8YsUBVh2YeeBOTOS9yuv90HfWuNQhLAZpLH0RoxIXf8f1
    qj9LNv/nQUrroNJyldk2qitEPbe7FCVCdW6n+yZIPvhXF6r1MRJd5eAOyxEeCCp1VZvRNF
    kbPoX1MpYaNdsIUG8zRT4FbtNCXkVD2F/zHZlmsU2Jp+yfdFdeidvo82EpGA
X-ME-Proxy: <xmx:qi0xar3zjqTwVm9lfCDMVMF1L2jrJA0eju5c5Rq42MF63XR40HKEiA>
    <xmx:qi0xavQjVEDwrzg-qZ_a9Ui29opJQ1jPjfOEI5MJjGHqqaZ327A-Dw>
    <xmx:qi0xasyEyJnkVGCZfYtkm6losbz9mcHiqZconSEpgH8Kdzf8JTR7GA>
    <xmx:qi0xanAjg3gunmBCkOxd_6ppesfuLuosJ9Tkd-M06Q-MpucVeC_Ttg>
    <xmx:qi0xalY1fEWINNYfukiozcr0ODVDi72KZ4L1qkKQZFw7l2jJRnqsMBlh>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 16 Jun 2026 13:04:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 3/4] x86/efi: avoid a relocation in
 efi_arch_post_exit_boot()
Message-ID: <ajEtpzab5jcKoep8@mail-itl>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-4-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dPIIzr3NfGvlTQyR"
Content-Disposition: inline
In-Reply-To: <20260616101336.44009-4-frediano.ziglio@citrix.com>
X-purgate-ID: tlsNG-bad1c0/1781607851-40B60A53-5FB2B39B/0/0
X-purgate-type: clean
X-purgate-size: 3496
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail-itl:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C919268E9D1


--dPIIzr3NfGvlTQyR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 13:04:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 3/4] x86/efi: avoid a relocation in
 efi_arch_post_exit_boot()

On Tue, Jun 16, 2026 at 11:13:35AM +0100, Frediano Ziglio wrote:
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Instead of using the absolute __start_xen address, calculate it as an
> offset from the current instruction pointer.  The relocation would be
> problematic if the generated PE binary had .init.text as a standalone
> section with just read and execute permissions."
>=20
> Removing this relocation is necessary to make it safe to split .init.
>=20
> No functional change intended.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> --
> Changes since v1:
> - Improve commit message.
> ---
>  xen/arch/x86/efi/efi-boot.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index d738b839ee..b983f054b5 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -270,7 +270,9 @@ static void __init noreturn efi_arch_post_exit_boot(v=
oid)
> =20
>                     /* Jump to higher mappings. */
>                     "mov    stack_start(%%rip), %%rsp\n\t"
> -                   "movabs $__start_xen, %[rip]\n\t"
> +                   "lea    __start_xen(%%rip), %[rip]\n\t"
> +                   "add    %[offset], %[rip]\n\t"
> +
>                     "push   %[cs]\n\t"
>                     "push   %[rip]\n\t"
>                     "lretq"
> @@ -278,7 +280,8 @@ static void __init noreturn efi_arch_post_exit_boot(v=
oid)
>                       [cr4] "+&r" (cr4)
>                     : [cr3] "r" (idle_pg_table),
>                       [cs] "i" (__HYPERVISOR_CS),
> -                     [ds] "r" (__HYPERVISOR_DS)
> +                     [ds] "r" (__HYPERVISOR_DS),
> +                     [offset] "r" (__XEN_VIRT_START - xen_phys_start)
>                     : "memory" );
>      unreachable();
>  }
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dPIIzr3NfGvlTQyR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoxLacACgkQ24/THMrX
1yxuQAf/dl6OgowU+ziY8HQizRIU5n/h4T49M4CvjmsjVaJBBGSDbD/yCnBQgAbL
hoMk+tYXDS6tErZY/s7KzJNSIMxhAV+JlN8LpOsnxHTrbUtEqcdXNtS+ydRBMi2i
QBZnQVO++ePmSo0scyBsH1FxT6nCoIsPzmlS+nPk5NiLlmxkXl4umPYNzRmRxwtu
n88T8qwbZYXnv5rmcqq2iBDgK+PG5sA5TZ6sXXB9CmuMjZCwMk4nt5o9kdGllwYA
hd5Uu/Zq51jVN3e9u6HVFY/xP18ketTGiFVCLILh+gTJG2NayQmRjW+HkKDunHXv
rN0oFJX3kpx2lV4iI7DgMtX5YYA1sQ==
=oNt/
-----END PGP SIGNATURE-----

--dPIIzr3NfGvlTQyR--

