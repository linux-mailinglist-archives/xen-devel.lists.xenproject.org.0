Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y/RJBKQxMWrkdgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 13:21:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E1468EBDF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 13:21:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=j1XQaE4H;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=bDfalGzz;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1339145.1600282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRqc-0007lz-DQ; Tue, 16 Jun 2026 11:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339145.1600282; Tue, 16 Jun 2026 11:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRqc-0007jq-AV; Tue, 16 Jun 2026 11:20:50 +0000
Received: by outflank-mailman (input) for mailman id 1339145;
 Tue, 16 Jun 2026 11:20:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wZRqa-0007jk-Om
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:20:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZRqZ-00GUJ1-FI
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 13:20:47 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a313183-2eae-0a2a0a5409dd-0a2a450886e6-26
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 13:20:47 +0200
Received: from [103.168.172.145] (helo=fout-a2-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a31318e-63b5-0a2a45080019-67a8ac91a451-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 13:20:47 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 3C486EC008F;
 Tue, 16 Jun 2026 07:20:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 16 Jun 2026 07:20:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 07:20:44 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781608846;
	 x=1781695246; bh=RPQdNjDUvjtcaC/RTETCswwWzqrRVABhOgSAwdQ5qiA=; b=
	j1XQaE4H0D9s0MFKRTY4vPEskB9n6vCGJMHcsRdLu2W8WeiuQMzhJzVkTJz/xx4o
	sP6Bti2dea87FZqaJo+vZjx5sES8CIJdLpU4NChxvi1DjaCet8G/YDqjxmNdIQCd
	yDOg+Vp3jWtuYtFsr+m1RnHwOTYhcuA9H9WjLzmCy1N864NnyAdCoEKlVnjCeIKh
	Qe0ZiSc3A5/pO5iHFGYQeuSZ+HNMs+WnXo8XzxIDxDk8EIdXP6FOB+7U+KcucgBN
	F8qqPgzZ0FRBYdyuyPVExZHGXuvF1ib6x1QYqKIfZkl+KfqzLbYsXWVPv0pTcbkT
	yaISJkGoWUnSGgjEcQEtVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781608846; x=1781695246; bh=RPQdNjDUvjtcaC/RTETCswwWzqrRVABhOgS
	AwdQ5qiA=; b=bDfalGzzL87V+1nq875y6MbmgKgKUy2RSSzmUFlopmkb8R60qCU
	bBb3e4eW0XFP2fLYgzbShR5RsyIOwblf1IEJZ7fFCVc7mnX6lXE2M4YEvqWE8GW5
	HM6qEO5WwT+rZicIHXq5TezXgowjSKumYnfavfPe/M3N2Zst500k4GCvIXVvwAx4
	zKLA7voJ2vIQzDYLYBqPTGmHsg5pAD2FBKQ7EPDY33RCicoEHIHucby8w+yXz1Eh
	VsgS/eV3UyLVpjUZkX5AYDFUuk4SGdljOXPA2UUjobpEC+TvKlBzTbUyO4a3KYEe
	RaamJEhYL0m6cem50OzDcR85hGT6hb1rFdQ==
X-ME-Sender: <xms:jTExamUoLtyRJFu1jQ5x-2FFWdi09juJ9vurgemGcUOMKPCplJ_fhA>
    <xme:jTExahrsdpnsm-7eoCZhJnvDnNAcztoclg2CI74KIyL_LPvWd0MJYOsPCdmrlqRIz
    EgVkxLoCbxIr14p-og0Gn-uO2Vuoy4lz8TOEbQETLsOt8TS4WY>
X-ME-Received: <xmr:jTExagmhRvcWXNRKFto19Xq9BsGa_mzLt8xxTtppBAm4wsx7FnAyglbC2rGEUKapiMfrTg7myuq29Xi14kQQsLRl8LVL-8Bm_HQ>
X-ME-Proxy-Cause: dmFkZTEkrrqRpWaCIDmYhut2VKG1b/RvNyhOodqTNL02VRec+8vK5+F9DdNqiSzETyARKC
    DmcLB30m2ffc37OkHJRwiDGflm10eMhFaP2JI0Fl+rJhY+iq+0EavrVKkjSnhxzRQ2O1Hw
    jddi1guBhFtJk+N+ZrqzmvtpozncLa6PN7IlWwgY2KLT2nm8ayG1rVwJ6BIPe5jQWgFvNQ
    /isH1Ltl7gASxEpPn+tN1wYrODugAYLDL2wPRHpVwdVllr6rlF0xR6hmL9eLAW9v6jdUNX
    p4kSrJrRw1tg19+QKTp4sYiODsKTfxxtA2bJdSiM5fxaOLDAymFey1PLl3WyGQ/7VazZht
    A/XE4uZJJBiJxBiGzQV6mHifUk9Jg9UgZH5rw8LdVB/or+dc4SIysbBbyxuBcU5crhC4/k
    79ZibSGi5ofZN6XxF4amh2Dz0Hufg4I2Cb8SCes6T0sXrq77GOhvGO7YU3bu2TQfszsGLr
    8IHHPAcmHnup/RTZqH/wQ4hb5y6u6kDhDfbzUGh165uj+nQfO6gxsPXCCk3L86ShK8IQZD
    U0Mt9hedTZupBic4B/qh0/gsBHM5uoZ+Dua12rWRaO03mLWFFfPo6HX1sTNN9Tt9eRN/VZ
    s9gP2qqsaIoy4yB8Oe1hSPdLDWuf590cd1VYZrhcuD8Qh1rKLjhQJKup7lLg
X-ME-Proxy: <xmx:jTExap3E9XQy2xAJLEUQ28H-_LWABMgC8Eg86mpG8werQRgnYP5fnw>
    <xmx:jTExalRTRCprBNohBo-qOPRdb-FgYcjHTATazW3qT79zgDzz2fpABA>
    <xmx:jTExaqzwHOy8ocIIslx3GuBdXdof-JDwbwsgrTZ6hLuB-OxF06oIMA>
    <xmx:jTExatBR4BEDcL8NFzdFW9s0oKteZ0f9wpSD2RmopYQU-E8WE-TIJw>
    <xmx:jjExau5_4h9kyGg7idDLfZ_eRxRmZfZse8XjRH2H2UDzVeigwheiKeHG>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 16 Jun 2026 13:20:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 4/4] x86: Split .init section to satisfy UEFI CA
 memory mitigation
Message-ID: <ajExivEwb88pcOxT@mail-itl>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-5-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EqzQ/UqIYj/JQguo"
Content-Disposition: inline
In-Reply-To: <20260616101336.44009-5-frediano.ziglio@citrix.com>
X-purgate-ID: tlsNG-c1860d/1781608847-BFD7BDB1-5D6E1986/0/0
X-purgate-type: clean
X-purgate-size: 3685
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail-itl:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
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
X-Rspamd-Queue-Id: 01E1468EBDF


--EqzQ/UqIYj/JQguo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 13:20:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 4/4] x86: Split .init section to satisfy UEFI CA
 memory mitigation

On Tue, Jun 16, 2026 at 11:13:36AM +0100, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>=20
> Currently .init section is both writeable and executable, split data and =
code
> to have 2 sections satisfying W^X rule.
>=20
> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
> in the pagetables.
>=20
> NX_COMPAT is a requirement from shim-review,
> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-=
shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-yo=
u-done-to-ensure-such-compatibility
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

Is that the last piece necessary to satisfy the NX_COMPAT requirement? If
so, I suppose a subsequent patch should actually set the
IMAGE_DLLCHARACTERISTICS_NX_COMPAT bit (IIUC ld --nxcompat option), right?

> --
> Change since v1:
> - update comment style.
> ---
>  xen/arch/x86/xen.lds.S | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 749d9719cc..8fefda1816 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -193,11 +193,7 @@ SECTIONS
>    __2M_init_start =3D .;         /* Start of 2M superpages, mapped RWX (=
boot only). */
>    . =3D ALIGN(PAGE_SIZE);             /* Init code and data */
>    __init_begin =3D .;
> -#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
> -  DECL_SECTION(.init) {
> -#else
>    DECL_SECTION(.init.text) {
> -#endif
>         _sinittext =3D .;
>         *(.init.multiboot)
>         *(.init.text)
> @@ -210,12 +206,12 @@ SECTIONS
>          */
>         *(.altinstr_replacement)
> =20
> -#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
> -       . =3D ALIGN(SMP_CACHE_BYTES);
> -#else
>    } PHDR(text)
> -  DECL_SECTION(.init.data) {
> +#ifdef EFI
> +  /* Align to satisfy UEFI CA memory mitigation. */
> +  . =3D ALIGN(SECTION_ALIGN);
>  #endif
> +  DECL_SECTION(.init.data) {
>         *(.init.bss.stack_aligned)
>         *(.init.data.page_aligned)
> =20
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--EqzQ/UqIYj/JQguo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoxMYoACgkQ24/THMrX
1yxucQf8DzRsHDDqWcbUgv1bZ1QlGCDEJKmdFkRBRI3sX3WKXZGoChtnOmaAwHVo
JnWqQzjFlUCLW8Ppxihi9YuSae8zBxr8aND/BnVQDtS1EXc172TfsDOARbrn16LF
6c6JuFN6qa92S36OFTBjzFgT0AY4HXXjuHpiTjpfExeEEUVFYUcDmKXJ/9E9iZuk
EGd8BbO2gjzZuXaZNxV18Uuo9LxZC7kY6uXbwEXcTn8gXDqpw6RKVPwrpiKCAhzF
3C3uNMLUiU9fTv7v33tLHfIkONfl4U2HIJbJHkHxWUjnvpVSrpzY21uChBDIDHsJ
+X3Jk1LKSJ+L1v6QewkYGCHJ3KEwAg==
=H6ag
-----END PGP SIGNATURE-----

--EqzQ/UqIYj/JQguo--

