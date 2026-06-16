Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nILYMC4yMWo+dwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 13:23:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B367B68EC1D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 13:23:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=hO8ug4TE;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="IWZ/y0Mn";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1339153.1600291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRsv-00005d-T2; Tue, 16 Jun 2026 11:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339153.1600291; Tue, 16 Jun 2026 11:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRsv-0008UZ-P3; Tue, 16 Jun 2026 11:23:13 +0000
Received: by outflank-mailman (input) for mailman id 1339153;
 Tue, 16 Jun 2026 11:23:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wZRsu-0008UT-DY
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:23:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZRst-005doa-QR
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 13:23:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3131ef-5cb7-0a2a0a5109dd-0a2a450ac746-42
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 13:23:11 +0200
Received: from [103.168.172.145] (helo=fout-a2-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a31321e-56b3-0a2a450a0019-67a8ac91db21-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 13:23:11 +0200
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id 785D4EC02CA;
 Tue, 16 Jun 2026 07:23:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Tue, 16 Jun 2026 07:23:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 07:23:09 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781608990;
	 x=1781695390; bh=L94oZqLQDzjg4nJDYD2RiW04u89Y9yEDmBqUpdeLw8U=; b=
	hO8ug4TEeB+kcJOLLyknEm1h2DVaW1X36uTIvkQLUt2JEzYZM58+oK73MSx+wgnp
	MZR29OpqE2pEae7Aji17Wb1yVCfPOoG9GfeAto3XUN+Zh9QOtrTqk6uQk9y+l4bs
	FZ0aIIlKR4SM4ZkiuXz53YPaEkuqdiFyz5nJRCAFPaa6cPc+2ix3s7l2+q/dvqv+
	nMUw4kHHAirlgiHuYd49V+0iyg2fTV0XTItxbTYE6v4iqtJkb1gN2lr3u8u27wBX
	0as9Veg3z04OxfuRadM+TIoNO2xyVnflcCSgDWo3yqcUClu5KiNN0s0zBexTCmYj
	c9kt4CfnbvfOxOWZtSp69w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781608990; x=1781695390; bh=L94oZqLQDzjg4nJDYD2RiW04u89Y9yEDmBq
	UpdeLw8U=; b=IWZ/y0Mnyf4gAfPvNDCXt/XbJOgbb7lPxpmLtZ0h8cWWZ65IQWq
	EgDy5ep+5t6k5o07oKjwn7LxLy2No2wn2bCUNuu6ZQNGirvEEthCnrVZsqtPbOuN
	ZSJBOvCZypyZzfkgF1A6waClp7CfjB+VwBKq5jX39Ahkj9TGhKGMJXNj/MURMdON
	yUoNL0KA7bFXBD69LRZVCNPNc6UKF+FnbRDeZrMvrMpxea9zLUO+6CB1Igu9N9On
	qW02DGnTNkyaDMNoGxL/r7En42zc14Y5HMI0iHzQZTnKM0VvI5rfVYEgo4hHoo/V
	r5KFurcbF9Mh5XDuEaHXedYjwPxY6bQIhTA==
X-ME-Sender: <xms:HjIxauE9vQI1UFl03ltr6EZB1IS1_fVrZkcgVyCTirLo4-mxLROqDA>
    <xme:HjIxamNlxHQUb0OyouIRDONAf_pwP_Sz9_x4ix2mePUdP6zv-AWMsqfLUB23oEyvQ
    uG6E2wJfcvNyReN54Vg7AChw0wyrieVollIKErPQiDJSz9Z7A>
X-ME-Received: <xmr:HjIxagewDB9mFZYRD1z4YVQzaGx5zoFnWy4wGAU1TwCBFCceudszk9RrnomHsoy7dcMhSw5_SrCV8U7mNqckMZvIcZbw3ghqAfw>
X-ME-Proxy-Cause: dmFkZTGn5d1D8Ob4o+Bz/SeMMs/Ld6CtPeMgXzsAMjTQE2LAPDyG6Ip4w8PCfAN2ap9bJe
    tq80d63J8IuDhwVkFQynLepZfP/C7s7+tgCIHS+V1iCt4Yl4I0KlCAR89d/NAZJLaSsfln
    2etoJ4RJpwUukLBoxEKpfwLODZXh4E1W7KfsB4z9+4uG9QzT/4e+g0T4uuw4pFzPiD+Zx0
    PFKDztiVZdNigGSyDBUrIEygJ5ZruiCaLbb94ZzB2Tgyx6TopFpk+V2xFSMRWX7qFieXYq
    7qYbgOoiqFSZcRpI4nfPrA8Fg+ITjGnLvg3Cg/ej3TIi/tDOCRrIpcXYF9pxtnmMr8XjcS
    aRfwVPC/ya+Z61YqVLEVPzG9pTrcGLLOf47XNTIq1sAzbXCX6uBCfQ7Uapkv2kZZV0fbzk
    24izBI2XLXj9mTPMmsgGbgoAmmOaj3nWZA5yiU1MDqTbh2bNldyDt1a9F2U4cK8a9y27v/
    x+q3priHa4lhfj1QXIuJw0Tye9gH+Z5MxQRI/h25kuYkfiaLjGL0b9TqLdk9v4/RiNp2Qx
    6IgEDYFEfkmRktNej7qz6b2Ng7TbZqosHYm8QgzOGV7mIJA+ZD7rhTFil57nZCmFLSrv0u
    w7Mnd38lc1RGuh9vNArKfHGdSJarLrlrzt3p4vQoUe1+nyarC32Z0I4jfZRA
X-ME-Proxy: <xmx:HjIxajtnonziyNx0miLlsZTFEVdBWK-X_GcaNHj8T6D05jpcOspyxg>
    <xmx:HjIxahmzXoOaNX2n3Z9RhpXcKFgCzrANDYjtcNh3l7cUikTAsYW3Kg>
    <xmx:HjIxalwRQ9FW_bf-joCM9LiKCFzAb2qPYBjzRiT7EIkmY-xG0SA1fA>
    <xmx:HjIxajNUMHpJ2bMdBc9wSzUfKZU3yRQJYZkgkfPCNUuI5RQVF2alzQ>
    <xmx:HjIxah1riXKjdK173isvFYlaXNwuOOY9dP-puKEkxgjtv--v0UfOOlre>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 16 Jun 2026 13:23:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/efi: Skip FPU save/restore for idle vCPU in EFI
 runtime path
Message-ID: <ajEyG295L0Oig5eu@mail-itl>
References: <8de2649558826621d49b404cae7a874f504e6b86.1781282640.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="14laCjCiMwiZqfk0"
Content-Disposition: inline
In-Reply-To: <8de2649558826621d49b404cae7a874f504e6b86.1781282640.git.bernhard.kaindl@citrix.com>
X-purgate-ID: tlsNG-4011c0/1781608991-711628B7-34D0B179/0/0
X-purgate-type: clean
X-purgate-size: 4746
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.79 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,mail-itl:mid,citrix.com:email,vates.tech:email,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:from_mime,suse.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B367B68EC1D


--14laCjCiMwiZqfk0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 13:23:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/efi: Skip FPU save/restore for idle vCPU in EFI
 runtime path

On Fri, Jun 12, 2026 at 05:54:36PM +0100, Bernhard Kaindl wrote:
> Anthony reported a boot-time assertion in init_xen_time() via efi_get_tim=
e()
> -> efi_rs_enter() in vcpu_save_fpu() on a Broadwell-D system:
>=20
>   Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
>=20
> This became fragile after the lazy-FPU removal cleanup series:
>=20
> In 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling"),
> efi_rs_enter() was changed from save_fpu_enable() to vcpu_save_fpu(curr),
> which unconditionally asserts !is_idle_vcpu(v)
> so an EFI runtime call in idle context now asserts.
>=20
> Likewise, in dba44e051209 ("x86: Remove fully_eager_fpu"),
> efi_rs_leave() was changed to call vcpu_restore_fpu(curr),
> which has the same assertion and can fail for the same reason.
>=20
> Guard both EFI runtime FPU calls with !is_idle_vcpu() to skip save/restore
> for idle vCPUs, which don't have an FPU context to save/restore,
> much like the calls are guarded in __context_switch(),
> where save/restore is done only for non-idle vCPUs.
>=20
> Fixes: 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling")
> Fixes: dba44e051209 ("x86: Remove fully_eager_fpu")
> Reported-by: Anthony PERARD <anthony.perard@vates.tech>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  xen/common/efi/runtime.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> Jan Beulich's suggestion to guard the calls to vcpu_save_fpu() and
> vcpu_restore_fpu() in the EFI runtime path with is_idle_vcpu() checks
> seems to be the right approach to fix the assertion failure for idle vCPU=
s:
>=20
> > The thinko looks to be in 4b9851c64522 ("x86: Remove fpu_initialised/fp=
u_dirty"):
> > While vcpu_restore_fpu() indeed unconditionally set the two boolean fie=
lds to
> > true at that point, idle vCPU-s may never make it through that function=
, and
> > hence ->fpu_dirtied would have remained false, triggering the (original=
) early
> > exit from _vcpu_save_fpu(). Perhaps all we can do now is guard the call=
 to
> > vcpu_save_fpu() (and also the one to vcpu_restore_fpu() out of efi_rs_l=
eave())
> > by explicit is_idle_vcpu() checks. Much like the calls are guarded in
> > __context_switch().
>=20
> Anthony, could you test this with the 'cmos-rtc-probe' workaround you just
> added removed to check if guarding the assertions as Jan suggested is eno=
ugh
> to fix the issues triggered on your machine?
>=20
> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> index a23fa75e3740..596f2710fb21 100644
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -98,7 +98,8 @@ struct efi_rs_state efi_rs_enter(void)
>       */
>      sync_local_execstate();
>      state.cr3 =3D read_cr3();
> -    vcpu_save_fpu(current);
> +    if ( !is_idle_vcpu(current) )
> +        vcpu_save_fpu(current);
>      asm volatile ( "fnclex; fldcw %0" :: "m" (fcw) );
>      asm volatile ( "ldmxcsr %0" :: "m" (mxcsr) );
> =20
> @@ -159,7 +160,8 @@ void efi_rs_leave(struct efi_rs_state *state)
>      }
>      irq_exit();
>      spin_unlock(&efi_rs_lock);
> -    vcpu_restore_fpu(curr);
> +    if ( !is_idle_vcpu(curr) )
> +        vcpu_restore_fpu(curr);
>  }
> =20
>  unsigned long efi_get_time(void)
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--14laCjCiMwiZqfk0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoxMhsACgkQ24/THMrX
1yxh2wf+O3UauBL72NT/GarN63IQlpXXEu7uIrQSro9NXl4kcnQBwX7ic1NQ24N+
yVzvtVSWoi9OYLoYic1pTFV2t0kaosAPuOz0mHDr/Qkww+AE7pPNzJ+gyx+8V0d+
+7kF+17bxTk2PptcWXlZQQ4896GnMLtSbann2zSSXlnHA5kahcMv3mTuI+UiPibE
dNOqTA9brRBeWSPJ3Q01ARJ54bMbNoQ+CFVN1nOEoBPFwcU2oyZaAr6vixaQhaQZ
bVs+DwXS31IHGfE2X8gy//MDgWtiBg/euxNU+AFFszoTbLcgL19v/NlqKqXwPb1B
iCpXp59HglZpbNMTTm2QNERvojLuoQ==
=a6SZ
-----END PGP SIGNATURE-----

--14laCjCiMwiZqfk0--

