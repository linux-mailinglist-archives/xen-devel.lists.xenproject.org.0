Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id maqCLUcpMWrCcwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:45:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F13868E6AD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:45:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=ia0JtE7W;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=DDkSg2S2;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1339101.1600228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRI4-00067u-Rc; Tue, 16 Jun 2026 10:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339101.1600228; Tue, 16 Jun 2026 10:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRI4-00065q-Nm; Tue, 16 Jun 2026 10:45:08 +0000
Received: by outflank-mailman (input) for mailman id 1339101;
 Tue, 16 Jun 2026 10:45:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wZRI3-00065R-Af
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:45:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZRI1-00GLzT-FE
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:45:05 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a31292b-2eae-0a2a0a5409dd-0a2a4504ba0e-18
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:45:05 +0200
Received: from [103.168.172.156] (helo=fhigh-a5-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a312930-1dec-0a2a45040019-67a8ac9c9fcf-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:45:05 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id ED856140014F;
 Tue, 16 Jun 2026 06:45:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Tue, 16 Jun 2026 06:45:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 06:45:00 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781606703;
	 x=1781693103; bh=NaLuUNbId44MtYuD6WuLs2HYXlOO5ZupT+0ImB0gTGg=; b=
	ia0JtE7WRVWUsr+jdmgIFaBuetRRUY15SHmBmSFbflsA4D3eDwyLzxutL60/1XUO
	zeYQfj6VwGhNwBW8yJtJmNBbsCsqPpM3xCevgCgGruYbdBGYEPvK0+yfXqM7mPsl
	hSlLGdhl96FcNM1wM+esZgw5Djv/quAUG1a0kPHotTacfa8hc/Z0G/PZxORGAkfj
	2H1IU7uiPpV6OetOP+9HkpMjpgjD+7zG85wsxlFXKptrfvk+LYV4HLC/J0PhohLI
	rsogAtuGgcAQD49eElIAHubPE+MAKmfAUOwqhxqgi79CwIH9+y36tb5pmr4pU356
	Dk+hAfIP0fFJ+httR1mEXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781606703; x=1781693103; bh=NaLuUNbId44MtYuD6WuLs2HYXlOO5ZupT+0
	ImB0gTGg=; b=DDkSg2S2FoyhRwFi8pmSR/cc7d/0qKwfyHG+UQXnYbHnnB+x4Ii
	erVWpp6rFK8rB542KzaS/rY25Nq1/cxAP9DLRfkPDFgxWxagnoYzY/BnqgeMkvRh
	7BK0A01cUKoItTfxcue1LZT5xBvyTwuvabqKN79piWhtCJAYy5QM2prNAb5J5G9A
	UWlxnh+1sf+ERnpsRqHe9Xag+6zpkVaxZm269/B5lZuIYA8Y/mjewVCQc20qJHqH
	zx8ZoevliNPRUq4IPFSzuCQbkTwQNDuvjPidA10INPzLbtO2+4pcfZ/DjF5DxhrS
	1nqqjrA9n67L09RELW3qEumCHAgmMirtOKQ==
X-ME-Sender: <xms:Lykxai9dSs5-7B6DirG2K93vx8CkrSMz-RyUiybIdo0cZENSSEpRnA>
    <xme:LykxahziHt3Le3RTOVOU41BBeDvgldqOYPyHqJRhbk_gDrF_v65py6Ot2NuTd3mjP
    L9RP6ly39c1XP_kXZZq0MKnWfGcreenFMmi3WtkH4nnkQRkbO8>
X-ME-Received: <xmr:LykxauMrqDLcRYFuStyb04w8kK3K7rdd7x3Re2gHl9D0X3Av6j0hJsrhKalUEO85F4T7CrcnpKNCzY8LF_wdnabqc47y1XNBm0A>
X-ME-Proxy-Cause: dmFkZTGY7Z9jmGa2+aGtWmkJ6P7gvTnJn0JJoC8QAnKrKY5wY8eR61XouW5oy6AOCchx3J
    z1vWPLRrRchgyl/bBj/m5h3Pu1XAOwo9iJDR/OK1YoVglt4MbEgnXWwbe2m2U5lBBk3OSV
    MT6OGK91OkhDxvklW8Wiyj87XPJ0xZd7uPvVL1mcj5lDS2+kn2KkYWz6/e5CFioiistVgc
    P27N5s/gP2zIwBiMTEIRa2eWooQd18ELmExWWfxN6Z6ypJUn7iS2SZvXUEzvLgZomSVVqK
    xIOqeIERmxQYRM1dRcnElxCTeRwMBfVlCcjYhneVq8Rj0YCi7o/NhkkQUqanLC5DR4uzJG
    6Hxbyg0SZYWw5AqFqxxtigVoH4HOMbwuCeOb18Jsq7OztpLFucJGX04JIGnMqV0LcEHhmi
    b0x4elul5rAerjqBfMox8vpXagdBPOhRUl0WWS4ZQCIohzGHOv6Ny5UcoJOrLw3NZ5caiZ
    JrcFZYsWH/G6vzdCAqUGXqeXf+j+7RUhPuRBk3EZc3R+j5djsE1+cfUFzidvtS8OqFxOzR
    NX8ztY7rT0VDa1SeddWg4aw/DvQzz+PvJrVFOXAtq0JvecdlYeVgbSMNmC4HWtT26+urtE
    Cl12H4NBssSrzuJixmzQekViEGIsuGapyMFbUpio1Na40PncGjAJy35XJxog
X-ME-Proxy: <xmx:Lykxam-_NW11NqMa7QPxTOqCWsuhvmEP_iPhxsXOWvLVYaVZWQwnww>
    <xmx:Lykxar7Kcq5uKZqk8YZ4Pjq8opaVhBH5098RkG7LRQD99nTj7amxdw>
    <xmx:Lykxas4E5_RPKdlwfxbTNisaQi3AboneBzfSe9Jrxt-SVUI4flatOA>
    <xmx:LykxakpwWWljMspGCMg-HMXO1cA_yP9cR8H0od02KpfAk6WrNXoPqg>
    <xmx:LykxaljrZxJWxWouiPfrE_faxLPu6LgimqRp1QyAymeeVWIeNGGWEjIl>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 16 Jun 2026 12:44:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 1/4] Align relevant sections to 4KB
Message-ID: <ajEpKusm_Um2_acj@mail-itl>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-2-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zx7VUxsfvZUqjHQo"
Content-Disposition: inline
In-Reply-To: <20260616101336.44009-2-frediano.ziglio@citrix.com>
X-purgate-ID: tlsNG-ebf023/1781606705-2BD6C3FF-6B28B3A8/0/0
X-purgate-type: clean
X-purgate-size: 3277
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail-itl:mid,messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:email,citrix.com:email];
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
X-Rspamd-Queue-Id: 1F13868E6AD


--Zx7VUxsfvZUqjHQo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 12:44:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 1/4] Align relevant sections to 4KB

On Tue, Jun 16, 2026 at 11:13:33AM +0100, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>=20
> Required by UEFI CA memory mitigation.
>=20
> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
> in the pagetables.
>=20
> NX_COMPAT is a requirement from shim-review,
> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-=
shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-yo=
u-done-to-ensure-such-compatibility
>=20
> Sections with different permissions must be in separate pages.
> In the case of debug sections they are contiguous and have the same
> permissions so it's not an issue if they are not aligned to the page.
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> --
> Changes since v1:
> - Change subject.
>=20
> Changes since v2:
> - Improved commit message and subject.
> ---
>  xen/arch/x86/xen.lds.S | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index b9e888e596..f758940674 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -162,8 +162,8 @@ SECTIONS
>         __note_gnu_build_id_end =3D .;
>    } PHDR(note) PHDR(text)
>  #elif defined(BUILD_ID_EFI)
> -  /* Workaround bug in binutils < 2.36 */
> -  . =3D ALIGN(32);
> +  /* Align to satisfy UEFI CA memory mitigation. */
> +  . =3D ALIGN(PAGE_SIZE);
>    DECL_SECTION(.buildid) {
>         __note_gnu_build_id_start =3D .;
>         *(.buildid)
> @@ -330,6 +330,7 @@ SECTIONS
>    __2M_rwdata_end =3D ALIGN(SECTION_ALIGN);
> =20
>  #ifdef EFI
> +  . =3D ALIGN(PAGE_SIZE);
>    .reloc ALIGN(4) : {
>      __base_relocs_start =3D .;
>      *(.reloc)
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Zx7VUxsfvZUqjHQo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoxKSoACgkQ24/THMrX
1yyDUQf/fkB5FPNxB5IQto4U6LzRvBzSElebdq4QVipEgSWjTyv8dEqVF99lx1QL
mW6fBFVrw0wNt7ep/8B7gioyvx6iHFLWqrfnKf/dIgqqIQlG0bLNVPvpP4aPAn4H
pfgit8QYgxBG3NI1H1/DL1SPgIOhKECBFkr98umhKWHc3xJTLsBy7fjGLLdG7Pze
GWWVLSfEMnDI4fSjrjA75su8mzfNbsAhslL60P0gGVyZvIkJ3C9Rk7IkHYdDArTj
sbNe1jNbBgIG4r13aQxm9Jo4Vf7lL3z8Z3qmm6vImZIHiZFgzJCVn1uSJYbcjElU
KqmZDO6ho5YScy3mdxhBkFKbhefQwQ==
=/fEy
-----END PGP SIGNATURE-----

--Zx7VUxsfvZUqjHQo--

