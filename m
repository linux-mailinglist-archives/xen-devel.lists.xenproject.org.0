Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P8kAafW1GnuxwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:04:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CCE3AC7BE
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274787.1560779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3I4-00011k-P6; Tue, 07 Apr 2026 10:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274787.1560779; Tue, 07 Apr 2026 10:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3I4-000103-MI; Tue, 07 Apr 2026 10:04:12 +0000
Received: by outflank-mailman (input) for mailman id 1274787;
 Tue, 07 Apr 2026 10:04:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wA3I2-0000zx-Pq
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:04:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3I2-004oas-5L
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:04:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d4d699-5cb7-0a2a0a5109dd-0a2a450cede4-2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:04:10 +0200
Received: from [103.168.172.152] (helo=fhigh-a1-smtp.messagingengine.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d4d699-f40c-0a2a450c0019-67a8ac989a81-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:04:10 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id F24ED1400034;
 Tue,  7 Apr 2026 06:04:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 07 Apr 2026 06:04:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Apr 2026 06:04:07 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1775556248;
	 x=1775642648; bh=Nh4qJ5MqF9xl0Ctu8zGw5G2TJN1cNUVOeabiaHX1EFI=; b=
	htR/Ijjpdv2NrFKA+fYLwqeaSa1HMYk6RCuvcPCDxj7kzuc/ApZc54umjOVGwkOA
	3HZ4O6btShbhpjeygIVFVHft8fVQ4ErYRsl44uQk9Cv4XY0jQEddAhmuxfCio1CM
	D5OOqXH1iN50IDse2jyCg3Uf5gWR0NMfytSBM2sJMWcDMebkkPN4ONVbL8ywrIag
	rs3jti4P55meLHFSNm0gST0ifk49Mahm0Vn7mtQLwWviEvS75C8QnNHS8NIpWtrt
	zBwk3h4DdMFoJSHALM6AgcW5tFpyvTA1V4dwn0GTLLSqvNxHZViN+k0CHxzrVjON
	92T/s3sh9zONwTs0c3hjLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775556248; x=1775642648; bh=Nh4qJ5MqF9xl0Ctu8zGw5G2TJN1cNUVOeab
	iaHX1EFI=; b=CvJTKSz1NgekoDbnQ/ctFw+G1poOegr3mHFEl7FyC8zSictISav
	bweNdtit55oAQ5PjzT9yKzyGTTjT1q+xQ+oFLGq6m5dxOMGCu3Wq6QFwjUNr09Dj
	+1FBBLRBeDVrUFPQhQjzGvPqmBMDSFSfoXDpGDbJw4VuWSs+RkMoHtrgIwqOvmmi
	C831Ll9NL7Fn+5cnWfBFXvPhkTtak9nyW9bysw35dBwnH7b42WPvi25gf2A3v/cg
	cn0Yho2qqOGUbDThyjkZqZgImfLRAkpq3A8D5mOobOwTa9Q8OM32G8cNpArhiidq
	fSWkAOfVNTaKesPRGwgvOsTJU1drjpzy+2A==
X-ME-Sender: <xms:mNbUaYZ8dmf3O0-GzAmSPNnGHbv_0siX7eoXIV-5ogsO4pIbaABC0g>
    <xme:mNbUaaYpCuR4u7lokhSQMwuJxO3vsC6QeF_BNDX4UoHB9eUFsFeIj4kn8JiEWrL5A
    oUnIbOJjdKeeeKpnNOOg_ofaRKnDXvJ-mihH_quRy3kIsiw>
X-ME-Received: <xmr:mNbUaX_tsADuyTc74BdajrX-KitG822qKr4cZYLNibg8XHIJQr87LKSohRrHgXlr9_OYpTf3izDsKzNVirKDuu7llhKvRez-qz0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvtdefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgkedutdffteethfeiueehffek
    ueffledvffdutdetteeltdevkeefkeelheejgfenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvght
    hhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohep
    gigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpth
    htoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthho
    pehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:mNbUaRhH6SzNiRN8R-ttnS_RYPjwDKaP_fM1bqa4P9M6advtgV5fYg>
    <xmx:mNbUafcKlLz1hGCoNvxlf4ONTPvIKvNUmhQj6GE3gOXS_42qcsincQ>
    <xmx:mNbUaQrjLOnSrBkniXaFJxPop3LeOu3fgKbOq86_0R_ZSzFRfMwYPQ>
    <xmx:mNbUacC6Oh0Ijc99VnkpT2ExXCTh6sTDR_li1LUUsZ_unx4kVzunRw>
    <xmx:mNbUaVViZb-A6QFaYh6H9Oc4p9ARmQEuSU4dhfsUbiphtKeB_JgBVV2w>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 7 Apr 2026 12:04:05 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/cpu-policy: set up host policy earlier
Message-ID: <adTWlb-6VDl1BY51@mail-itl>
References: <6dccae5f-fe09-4f35-9e4a-7a38fb21e8d1@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cjd2LFgO4eOZHcdQ"
Content-Disposition: inline
In-Reply-To: <6dccae5f-fe09-4f35-9e4a-7a38fb21e8d1@suse.com>
X-purgate-ID: tlsNG-d25034/1775556250-81557A3D-F6E7FC3D/0/0
X-purgate-type: clean
X-purgate-size: 3613
X-Spamd-Result: default: False [-2.79 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:dkim,invisiblethingslab.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 61CCE3AC7BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--cjd2LFgO4eOZHcdQ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 7 Apr 2026 12:04:05 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/cpu-policy: set up host policy earlier

On Tue, Apr 07, 2026 at 08:46:39AM +0200, Jan Beulich wrote:
> In order to use cpu_has_* expanding to host_cpu_policy.*, the host policy
> needs setting up alongside boot_cpu_data.x86_capability[]. Arrange for
> that towards the end of identify_cpu().
>=20
> Fixes: 894bd7617924 ("x86/Intel: use host CPU policy for ARAT checking")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> In the longer run we may need to (also) update the host policy from
> setup_{force,clear}_cpu_cap().
>=20
> This really was part of one of the XSTATE cleanup patches at the head of
> the AMX series. This explains the specific placement ahead of the call to
> xstate_init()). Likely anything from there downwards shouldn't really
> live in identify_cpu() anyway.
>=20
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -586,6 +586,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
>  	}
> =20
>  	/* Now the feature flags better reflect actual CPU features! */
> +	if (c =3D=3D &boot_cpu_data)
> +		calculate_host_policy();
> =20
>  	xstate_init(c);
> =20
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -359,7 +359,7 @@ void calculate_raw_cpu_policy(void)
>      /* Was already added by probe_cpuid_faulting() */
>  }
> =20
> -static void __init calculate_host_policy(void)
> +void __init calculate_host_policy(void)
>  {
>      struct cpu_policy *p =3D &host_cpu_policy;
>      unsigned int max_extd_leaf;
> @@ -904,6 +904,7 @@ static void __init calculate_hvm_def_pol
> =20
>  void __init init_guest_cpu_policies(void)
>  {
> +    /* Do this a 2nd time to account for setup_{clear,force}_cpu_cap() u=
ses. */
>      calculate_host_policy();
> =20
>      if ( IS_ENABLED(CONFIG_PV) )
> --- a/xen/arch/x86/include/asm/cpu-policy.h
> +++ b/xen/arch/x86/include/asm/cpu-policy.h
> @@ -30,4 +30,10 @@ void recalculate_cpuid_policy(struct dom
>   */
>  void calculate_raw_cpu_policy(void);
> =20
> +/*
> + * Collect the host CPU policy.  Called after collecting enough CPUID ou=
tput,
> + * and again after all feature overrides have been put in place.
> + */
> +void calculate_host_policy(void);
> +
>  #endif /* X86_CPU_POLICY_H */

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--cjd2LFgO4eOZHcdQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnU1pUACgkQ24/THMrX
1yyRNwf5AaCNJWlZelP3p1Zxxjnvpi55wsCFEkSrysaDmsxbUr+X7cNNEPo9mv/p
g4f4OzfIuHPj7CRdJmBFaJhi2xD/dwjZ7c+3o5yDUVF6nBJi87NQouCARg3nEobF
Te3QbhCI72hDOfei6W2KIydS3EEWJDBRYCjvvIj7Ol0JuF4vGcckQBi9EFJ3txZp
wiXnBvw1mAVL1NTNrcN+geaUeksthzA9TVlPx4ZxX4pVzv8R8/GKwI1s4xlLuqQA
JWeU8Ggy8SuESpvxsQ54ivntWx7da2Z3y4++y47bs4p8qXjEooNLtzEPPDhgPVOO
rlHtqaNELadnG5C0iovEUF+xg/p07g==
=kwlA
-----END PGP SIGNATURE-----

--cjd2LFgO4eOZHcdQ--

