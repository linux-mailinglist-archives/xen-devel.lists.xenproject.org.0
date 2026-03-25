Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELFaAiIAxGmlvQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:32:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472EE3280AF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:32:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262643.1555071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QDn-0005Wh-AL; Wed, 25 Mar 2026 15:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262643.1555071; Wed, 25 Mar 2026 15:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QDn-0005VH-7l; Wed, 25 Mar 2026 15:32:39 +0000
Received: by outflank-mailman (input) for mailman id 1262643;
 Wed, 25 Mar 2026 15:32:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w5QDl-0005V5-TP
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:32:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5QDl-005Us2-93
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:32:37 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c40015-e002-0a2a0a5209dd-0a2a4507a83e-2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:32:37 +0100
Received: from [103.168.172.145] (helo=fout-a2-smtp.messagingengine.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c40012-fd74-0a2a45070019-67a8ac91e5e1-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:32:35 +0100
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id 70A3EEC0230;
 Wed, 25 Mar 2026 11:32:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Wed, 25 Mar 2026 11:32:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Mar 2026 11:32:31 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774452753;
	 x=1774539153; bh=bi0KmjW0NjZi8YPs0MLZpFRH/I6FhGD+iMHvjkZWXzc=; b=
	D7a2iQ+zM05W9otpFkCZzS5n/qFh0d/SZb3yi2TgWfFTaHJ9GV1Uxa6e4HN0nWpr
	IsyQNCUjxetyJzlZpxKcXRPLGNj6SdsNZ2Qn6Nec2n1cM7qqcfZ8atkL4kpdhe2V
	cgO3xjHB6SIeuJqMIYHLM6Iq8omhTRbW7j/uqpVUowsMPDfGuTVYm+0xEIgb6aQt
	+/XJ+866JnwjVcFYotCPh1RQHCWs203wZagxwWOxWOdPsiPoSnM7xeKGw+yVDykx
	rY5vKmT8Uym+OfADMWGdCLBHMnwRpoYOt9F+zBZByS47a7FMX33l2nijlZK8WHHj
	cNzFWJ7ZoMoW/ie+GEPZgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774452753; x=1774539153; bh=bi0KmjW0NjZi8YPs0MLZpFRH/I6FhGD+iMH
	vjkZWXzc=; b=jTcqzRzS7/uHiV38QuXZY8kNvbvuLQO/XwPyM5M+eX32ymdSF3V
	0ds7+WXqvPVjHpBgSFDzuMHP49HW2smLVWs836SPvxX+AJX2fsyN6l/EPrjn3y0G
	yezm8jnHDyhjj6rvvWppMgULgPtGi+IUjVo9p6mAoAk1D9WUL+jA9WDW0DvjWB2s
	CDE1UpoZ2u3Sill5DsfY8OzKWAy10XO6RE/ero+KZVHPIWPbZSqvmBJ42sSL7rLc
	IYa0QLsPulNKGMExr1QUr3pujVA7aScCuQkLLQhyeIx/tISMjRvJ4LjoYtMF7Z51
	EPGTyaLi7QSe+9m+MItBC2faBNzIOpaO/5w==
X-ME-Sender: <xms:EADEaaOevVHIgsFnqb2zU0NeIH8KMRBVhI18m2Hj-qEY96IIcRhScQ>
    <xme:EADEaWjZyq0whSwq7WZRqXH517Lf0VKUQOTN0nIHw60Ccg6bojnrIu02eAb_fay7_
    fawmXXpxZPCB8CINP_kEVDC5DxsekTHSPgV4KMtHVsYsmYteg>
X-ME-Received: <xmr:EADEaXtvQWl6xVTIUyD2Om70uDur2_IGOIHPCJ8B-F8VJ-dJOWXhNVCfEyohY4SG8ElRHyfvVRpWyq8V8ZPQr-3YjN_ZeySm9zM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdegkeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopehsohhumhihrghjhihothhishgrrhhkrghrvdefsehgmhgrihhlrd
    gtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtgho
    mhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtg
    homhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphht
    thhopehsrghrkhgrrhhsohhumhihrghjhihothhivdefsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:EADEacTNHVKpRiJGZyv0lVKM319V2OrisZeEnp0QplTbyesVJaQ2eg>
    <xmx:EADEaT0UjLiiz_6g2fm0ducEYQ5gNR4FMdFOZ2rt6S16KApINGPHDw>
    <xmx:EADEaZvH6W9T1Sz8oinmgXsCrsP-Lg38ZvX1kgAkJtaJD73AQiIxPA>
    <xmx:EADEaRg6LKs5vIdIL9SweW14ad3LCENQuvR6V0HmRXmJaMHktXrMjQ>
    <xmx:EQDEab6oouuimYr9L8biqHaDDfxEr7QSbMY7N__y6oekIjmhgBPMMT1F>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 25 Mar 2026 16:32:29 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	sarkarsoumyajyoti23@gmail.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/3] x86/acpi: Integrate BGRT preservation with status
 reporting
Message-ID: <acQADhcNzkVBm3C3@mail-itl>
References: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
 <20260324123312.11076-3-soumyajyotisarkar23@gmail.com>
 <751e1d3e-d95a-4129-8baa-450a53d15efa@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZBEFYMWGX+DlEeZ/"
Content-Disposition: inline
In-Reply-To: <751e1d3e-d95a-4129-8baa-450a53d15efa@suse.com>
X-purgate-ID: tlsNG-ef75cf/1774452755-578A4303-8DB9859E/0/0
X-purgate-type: clean
X-purgate-size: 3678
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,apertussolutions.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:soumyajyotisarkar23@gmail.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:sarkarsoumyajyoti23@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 472EE3280AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ZBEFYMWGX+DlEeZ/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Mar 2026 16:32:29 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	sarkarsoumyajyoti23@gmail.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/3] x86/acpi: Integrate BGRT preservation with status
 reporting

On Wed, Mar 25, 2026 at 04:16:25PM +0100, Jan Beulich wrote:
> On 24.03.2026 13:33, Soumyajyotii Ssarkar wrote:
> > @@ -327,6 +328,11 @@ static int __init cf_check acpi_parse_hpet(struct =
acpi_table_header *table)
> >  	return 0;
> >  }
> >=20
> > +/*
> > + * Invalidate BGRT if image is in conventional RAM (preservation faile=
d).
> > + * If preservation succeeded, image is in EfiACPIReclaimMemory, which
> > + * won't match RAM_TYPE_CONVENTIONAL check, so table remains valid.
> > + */
> >  static int __init cf_check acpi_invalidate_bgrt(struct acpi_table_head=
er *table)
> >  {
> >  	struct acpi_table_bgrt *bgrt_tbl =3D
> > @@ -754,5 +760,7 @@ int __init acpi_boot_init(void)
> >=20
> >  	acpi_table_parse(ACPI_SIG_BGRT, acpi_invalidate_bgrt);
> >=20
> > +	efi_bgrt_status_info();
> > +
> >  	return 0;
> >  }
>=20
> Does this really need doing from here? If you called it ...
>=20
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -1911,6 +1911,22 @@ static bool __init cf_check rt_range_valid(unsig=
ned long smfn, unsigned long emf
> >      return true;
> >  }
> >=20
> > +void __init efi_bgrt_status_info(void)
> > +{
> > +    if ( !efi_enabled(EFI_BOOT) )
> > +        return;
> > +
> > +    if ( bgrt_info.preserved )
> > +    {
> > +        printk(XENLOG_INFO "EFI: BGRT image preserved: %lu KB\n",
> > +               bgrt_info.size / 1024);
> > +        printk(XENLOG_INFO "EFI: BGRT relocated from %p to %p\n",
> > +               bgrt_info.old_addr, bgrt_info.new_addr);
> > +    }
> > +    else if ( bgrt_info.failure_reason[0] )
> > +        printk(XENLOG_WARNING "EFI: BGRT preservation failed: %s\n",
> > +               bgrt_info.failure_reason);
> > +}
> >=20
> >  void __init efi_init_memory(void)
> >  {
>=20
> ... out of this function, it could be static and no stub (misplaced in
> the earlier patch) would be needed either.

It was here before, and I complained about it, because it printed the
invalidation reason way later than the actual invalidation.

> Furthermore, is the EFI_BOOT check really needed? Without taking either
> of the EFI boot paths, neither bgrt_info.preserved nor
> bgrt_info.failure_reason[0] would have been altered from their initial
> values.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ZBEFYMWGX+DlEeZ/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnEAA4ACgkQ24/THMrX
1ywjXAf/U3cDCgX6UIk/F81aZu5KdGwE4xEeIb9MvH1RT/37z+7h6bQOwM6ip6bb
vzZgFXseF+Hb6vnCo65ZDeleBVnehDFGxtsPfVFtiZPOdKtuuncPHQMD12f5Rq/8
KnjFIEG7ZLdseQPdIS4OfDuZvyQtObfldW9SdYNJpSWGV9tWlR7xvKCRiLEYRrlv
PKtRBTmLIjbzkg6SiY+1O3yfvegrD1idNqmUzWCDjvRAIZcECRsul1r4z2v3gC6W
EjxMAgFK8uteM2hpV1ST0LEEyL3npysVKajcrkFK13DWLcPUSQYsoSiFb2bwQVVd
WqBYVWBR0/JaAlfy2UbTPysC7eTBoQ==
=oI9H
-----END PGP SIGNATURE-----

--ZBEFYMWGX+DlEeZ/--

