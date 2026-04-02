Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNUVBQ9pzmmpngYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 15:03:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6283895B2
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 15:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271874.1559872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Hgk-0001Em-Rb; Thu, 02 Apr 2026 13:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271874.1559872; Thu, 02 Apr 2026 13:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Hgk-0001Cu-Nz; Thu, 02 Apr 2026 13:02:22 +0000
Received: by outflank-mailman (input) for mailman id 1271874;
 Thu, 02 Apr 2026 13:02:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w8Hgi-0001CY-9G
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 13:02:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Hgh-008C1P-1f
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 15:02:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce68d8-5cb7-0a2a0a5109dd-0a2a450c930a-16
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 15:02:18 +0200
Received: from [103.168.172.152] (helo=fhigh-a1-smtp.messagingengine.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce68d9-f40c-0a2a450c0019-67a8ac98be9d-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 15:02:18 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 319DE14000A4;
 Thu,  2 Apr 2026 09:02:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 02 Apr 2026 09:02:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Apr 2026 09:02:16 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775134937;
	 x=1775221337; bh=ym2eMeFIoCCsFKppruamwrkn//7rVgTN9+G1lJzgWJY=; b=
	PcjLSVGIg//O9ZtDedZ8Sm2/vvgO1KrCfzTcl4XZ+G+PNtQfGSdHS2U6qQ7xz/8m
	jX1MW91du/DL0j9MzyptdBITcalDp6UFTx2O1zzI3j5XkQmSVlqLTFVPyLI2E/oH
	GRhcjABMRgGcRlc+5FzdFw+KbC6XmjQG/PsmUEAEOVGDCdi47W4jM9xPzIMbLyr4
	bzrrFvGYYkgYHExZ1XdQq24E4dwwHX3phePjnatA2zEbV5MgEzUiP6iWcaIQy4bq
	1N+486DUDQW1URhf0YB6YDan0O1/bOZzFFX2qRaqMDNA0OrHw+qlwAfJYhl6Dro2
	k75eo0AJFksTcVcxeTWbxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775134937; x=1775221337; bh=ym2eMeFIoCCsFKppruamwrkn//7rVgTN9+G
	1lJzgWJY=; b=CNc8RMcKq9X20+Pz2d5UpoNOnts65Q6T6c9LxXzYxModTUq6+t0
	NklTrTU9NzGbt6H1ZYC+E77TgXSbCbeX81Uxj0n7WU3czJtNPfawOM+7tGlpSq07
	Yz2YvOuRZKp7BOEO3wSJErnos6KP5Kbga8fpNGo2bFueD8GHX0fO/vcA+YJcamdb
	XkoFF/9Y7P4rAMXKUxoFqh3rsEfviwzUni5dpKGR69FgMh/PSP/o+2ioXAc4FZG4
	Mc123cTsLIAZ7/LBDpSyGiK8A6u5KONnUgoMswqlLXpq2kFjsByuX1yaxfer7diz
	9EFn6WIwHHnuMCInQxrB4iLaet8+G/FKHXQ==
X-ME-Sender: <xms:2GjOaUE_R0SdmcR_MYD2rLjG52DA8tUPFAy9UjMwwGjoHWA-CDYT1A>
    <xme:2GjOaUUVRSaCLg3b_dY6-ufiQnWliZcnZmlzsCM1g9mJZcXz_r9ZgPNnv7Gf2wOn-
    Sc7d9O7kz0Rs8o8ps6c3MEDwubC1AlcryTsfi6m3dvtaPPW>
X-ME-Received: <xmr:2GjOaTIaDDwIXcDmruTPCVZAxKhjwkCSDQWcBrdSmLGmdWBGOaPWISjlXMAN8XsxvGtQnqqBg2lUyd5UlqO0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleetfeev
    hfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdroh
    hrghdprhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtoheprhho
    ghgvrhdrphgruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:2GjOaU8h6Mtb4dpzYqItgGfS3YRwM8HqMzros09IryU-iiPgWE98Ww>
    <xmx:2WjOaWJe2EM4ViUiqk_wuqD2fnzFDfN98SWm1aPvzbmGC5Ete0bQ5w>
    <xmx:2WjOaZmJ2pTDA7E9ubCygKjAUIIarwIqfEXPd5I5vCdzyBNgRdFkNg>
    <xmx:2WjOaaMfo8e8msSec6aAKWkT1Z3GQMFTyKkYnCBP-wOWL58F65ka8g>
    <xmx:2WjOaUDHZudgnSpxX0WEqcSdSZTltpnz5JS348-MPOxSnLN_2yzuNLJp>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Apr 2026 15:02:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
Message-ID: <ac5l-HgbDRcVkiWb@mail-itl>
References: <aPzBO_eW8mQHM66u@mail-itl>
 <acQzzlXNDxNq885V@mail-itl>
 <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com>
 <acUqOL232lp-Lw1v@mail-itl>
 <cbed767b-4ac4-4989-8778-43ff321ae977@suse.com>
 <acVWX8vkhZiFfonP@mail-itl>
 <88c65ec7-b7f7-4d8b-a453-d707440b43cb@suse.com>
 <acZ8ez4dmQay1JSw@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fej7YXlfo2xZKE7n"
Content-Disposition: inline
In-Reply-To: <acZ8ez4dmQay1JSw@mail-itl>
X-purgate-ID: tlsNG-d25034/1775134938-8254FA3D-92A60490/0/0
X-purgate-type: clean
X-purgate-size: 9770
X-Spamd-Result: default: False [-1.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 9E6283895B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--fej7YXlfo2xZKE7n
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Apr 2026 15:02:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?

On Fri, Mar 27, 2026 at 01:47:55PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> Some further observation, this time regarding timers:

In the meantime Roger suggested it might be about C-states. So, I just
tried booting with max_cstate=3D0. I got this:

    [2026-04-02 11:41:57] (XEN) [    4.327519] mwait-idle: disabled

But then xenpm reports C1 is still used:

    # xenpm get-cpuidle-states=20
    Max possible C-state: C0

    cpu id               : 0
    total C-states       : 2
    idle time(ms)        : 3727115
    C0                   : transition [                   0]
                           residency  [             3769835 ms]
    C1                   : transition [                   0]
                           residency  [                   0 ms]

    cpu id               : 1
    total C-states       : 2
    idle time(ms)        : 3763654
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769838 ms]

    cpu id               : 2
    total C-states       : 2
    idle time(ms)        : 3729168
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769838 ms]

    cpu id               : 3
    total C-states       : 2
    idle time(ms)        : 3750226
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769840 ms]

    cpu id               : 4
    total C-states       : 2
    idle time(ms)        : 3726369
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769840 ms]

    cpu id               : 5
    total C-states       : 2
    idle time(ms)        : 3755733
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769840 ms]

    cpu id               : 6
    total C-states       : 2
    idle time(ms)        : 3725747
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769841 ms]

    cpu id               : 7
    total C-states       : 2
    idle time(ms)        : 3730190
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769841 ms]

    cpu id               : 8
    total C-states       : 2
    idle time(ms)        : 3716485
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769841 ms]

    cpu id               : 9
    total C-states       : 2
    idle time(ms)        : 3710830
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769842 ms]

    cpu id               : 10
    total C-states       : 2
    idle time(ms)        : 3704881
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769842 ms]

    cpu id               : 11
    total C-states       : 2
    idle time(ms)        : 3719333
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769842 ms]

    cpu id               : 12
    total C-states       : 2
    idle time(ms)        : 3715059
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769842 ms]

    cpu id               : 13
    total C-states       : 2
    idle time(ms)        : 3711681
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769843 ms]

    cpu id               : 14
    total C-states       : 2
    idle time(ms)        : 3709380
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769843 ms]

    cpu id               : 15
    total C-states       : 2
    idle time(ms)        : 3720119
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769843 ms]

    cpu id               : 16
    total C-states       : 2
    idle time(ms)        : 3737637
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769844 ms]

    cpu id               : 17
    total C-states       : 2
    idle time(ms)        : 3737662
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769844 ms]

    cpu id               : 18
    total C-states       : 2
    idle time(ms)        : 3729870
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769844 ms]

    cpu id               : 19
    total C-states       : 2
    idle time(ms)        : 3745564
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769845 ms]

    cpu id               : 20
    total C-states       : 2
    idle time(ms)        : 3717089
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769845 ms]

    cpu id               : 21
    total C-states       : 2
    idle time(ms)        : 3590257
    C0                   : transition [                   1]
                           residency  [                   0 ms]
    C1                   : transition [                   1]
                           residency  [             3769845 ms]

And the issue still happens...

Honestly, I'm confused about the above output. The system is mostly
idle, but I wouldn't expect it to be _that_ idle - there is xenstored +
xenconsoled running, plus occasional xl create for testing with
short-lived domU. Does it really all happen only on CPU0 here?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fej7YXlfo2xZKE7n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnOaNcACgkQ24/THMrX
1yyp+AgAj4GAG/xT8PTinO9+JGlXbFwmYWi9ykBHcTslns7tHSyNirLLKjlnA1sP
TIboxm6BrjOxHIdpQJK5AXfSGVX2Lms3JFCW1J235h7eKSqh+XxVhYR9hzRNTQBo
G1FxX3vd00WMx+AoWC2GCCK124j/Yha5Fw8WRbIC4ba1SkluScUmlCytstUkp+Sj
c1GBYjaDgOIn2DXnXVxjSwz2QBb92MpJdMQ+RaICtYEbaXGGIfAd4yaBdIdtIYT+
S3ajEsLVWJ8lMHKWF4ejEaWUpc6rkgVkFzslaLz8Y2eUEIfsfpZ+yl+vrkguflaf
KRvz9J5Iab4ZoR0Eh3qBqJnaFihz8Q==
=HOe2
-----END PGP SIGNATURE-----

--fej7YXlfo2xZKE7n--

