Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id p785LsL2zmnqsAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 01:07:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A0138EF66
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 01:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272433.1560061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8R7W-0005Nc-BP; Thu, 02 Apr 2026 23:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272433.1560061; Thu, 02 Apr 2026 23:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8R7W-0005LY-8o; Thu, 02 Apr 2026 23:06:38 +0000
Received: by outflank-mailman (input) for mailman id 1272433;
 Thu, 02 Apr 2026 23:06:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w8R7U-0005LS-Lq
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 23:06:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8R7T-007pBR-07
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 01:06:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cef65d-2eae-0a2a0a5409dd-0a2a450cbe9a-46
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 01:06:34 +0200
Received: from [103.168.172.159] (helo=fhigh-a8-smtp.messagingengine.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cef677-f40c-0a2a450c0019-67a8ac9fd733-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 01:06:33 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 5D23D14003B3;
 Thu,  2 Apr 2026 19:06:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 02 Apr 2026 19:06:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Apr 2026 19:06:30 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775171191;
	 x=1775257591; bh=X+clZ5enQvBxtYJdPEKxn/+Re5Vq6l3RFjkF4cyvR4g=; b=
	ZESAzYbcrUvnFJKk/B9Uk5SjgMtqdNkonBA6XQDKuLd8ivKTAf5/04NnHW3h0kZO
	rLnWqloDCGPy1xKg6KZ3x+mMX4aekxBHPqFcfHPojIee1Lg50SPnCYROKzCRjx9w
	9tZxJNgMT589BD38l1zNnU7ocIuMqHn3ekPP0vAypn61RI+btDwdvRtLxftZ/g2l
	jZjkcJDLW3hfU/yu5Eo4uQC2aK3HsaP7nkYf3ecDjfOaD8IvtJq9yRBd1eUqc5Zg
	Tc5KFpj3ggag1MNJK+pYew9rdUpRxLPGrcXMaHygWCdgsCFleqci7S+rS6hyHLXe
	amEXj55otP36A2HMHS0SJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775171191; x=1775257591; bh=X+clZ5enQvBxtYJdPEKxn/+Re5Vq6l3RFjk
	F4cyvR4g=; b=P0uzHr9q/2Bhymle34GnK+JFsoN/tG8IUFkt2j8wa+SJft6ynlI
	/EcOx46MxfxYDY6Bs5o+CRfxn8lyjR9lYgQz3YRsMQjirUyX1IuJ6PJk8RIuK7FN
	hRoE8dYlMSDmwdlZqsh3wvV9KMkNIsY4R5z6XYa9MCZoA3FpHMiLyXVuiJuQW4fp
	z3krpLKtJ43L2lzdCKZewseukD196lW95uV3CfCUBRM3KkSkq4zhaEtP0ea8ntmh
	qEkS5NeFTWaBwVsibi+eVVxofpOIUA2W8k/zWghuzC4ELlIFQ4M8EKN+nH+7/QKU
	bNg0FYBRiEoPvjnswvMdCJxSrS0yv5L/vrQ==
X-ME-Sender: <xms:d_bOadJkBqNseM0tsNe3S4308IDJ4tUmPepspyGjtAEKQO03pBU7AA>
    <xme:d_bOafI4eQ57688lbF0gUOcO2vVLT8ZzSoOP_HJryuokR9DKoirtoId4oOT7yFG6b
    dy2DwbqWMAf75dQMNtmKmfpO9xtuBlSsbpj5Aq5bsB6moNlmuo>
X-ME-Received: <xmr:d_bOaTWhJ6Jf7WSV8T9W5rLh5gOsJx-uGB_yeNs2JiB3AeNGPG3hqMUI8KC2dSdRf4avdKXMaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleetfeev
    hfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepvddpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdroh
    hrgh
X-ME-Proxy: <xmx:d_bOaZiKa2CcwZwhm6QCoItOK3c9RqdyOeys80bMaTiaDI9HZIrk8Q>
    <xmx:d_bOaW8QNSoTOU3n1qUzeLhHdR5lGtwotW99aU-41l6DMY86nZf2bA>
    <xmx:d_bOabCkR6tQaeBYQOKnycDz4sqKHnw_UEYXtgv0Cwa5derhaT4Nrg>
    <xmx:d_bOabLxS5mVp0B7L18kwU19PEFN_Of3Vv86WCzFMRA0v8E9vPZzQw>
    <xmx:d_bOaVc3ZtTINPSGFpOS20xTq0cWer2kZMi6tSI5M8YJmfRWulWYNBKA>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 3 Apr 2026 01:06:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3
Message-ID: <ac72dp3yEHikJzw2@mail-itl>
References: <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com>
 <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com>
 <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
 <ac44SVW1cPhKYFKU@mail-itl>
 <2caff339-4ce9-42ea-9b78-afeac42b6f0f@suse.com>
 <ac6Bg21hMLBRDNdm@mail-itl>
 <92e0151b-3fb1-4108-9788-f0fbac43512b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fbsx/PxUsQ8mae8A"
Content-Disposition: inline
In-Reply-To: <92e0151b-3fb1-4108-9788-f0fbac43512b@suse.com>
X-purgate-ID: tlsNG-d25034/1775171194-80D5BA3D-E652C045/0/0
X-purgate-type: clean
X-purgate-size: 8514
X-Spamd-Result: default: False [-2.23 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: E6A0138EF66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--fbsx/PxUsQ8mae8A
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 3 Apr 2026 01:06:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3

On Thu, Apr 02, 2026 at 04:53:31PM +0200, Jan Beulich wrote:
> On 02.04.2026 16:47, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Apr 02, 2026 at 12:48:14PM +0200, Jan Beulich wrote:
> >> On 02.04.2026 11:35, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Thu, Apr 02, 2026 at 10:39:41AM +0200, Jan Beulich wrote:
> >>>> On 02.04.2026 10:08, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>> The xl dmesg output (from MTL this time):
> >>>>>
> >>>>>     (XEN) [  123.477511] Entering ACPI S3 state.
> >>>>>     (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: 0,=
 cpu_has_apic: 1
> >>>>>     (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_using=
_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> >>>
> >>>> Hmm, but what you didn't log is whether __hpet_setup_msi_irq() actua=
lly
> >>>> succeeded everywhere. (And if it did, also logging HPET_Tn_ROUTE() v=
alues
> >>>> might be a good idea, if only to double check.)
> >>>
> >>> Updated output:
> >>>
> >>>     (XEN) [18446743899.720395] _disable_pit_irq:2649: using_pit: 0, c=
pu_has_apic: 1
> >>>     (XEN) [18446743899.720409] _disable_pit_irq:2659: cpuidle_using_d=
eep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> >>>     (XEN) [18446743899.720420] _disable_pit_irq:2662: init: 0
> >>>     (XEN) [18446743899.720431] hpet_broadcast_resume:663: hpet_events=
: ffff83046bc1f080
> >>>     (XEN) [18446743899.720579] hpet_broadcast_resume:674: num_hpets_u=
sed: 8
> >>>     (XEN) [18446743899.720587] hpet_broadcast_resume:692: cfg: 0x1
> >>>     (XEN) [18446743899.720599] hpet_broadcast_resume:697: i:0, hpet_e=
vents[i].msi.irq: 122, hpet_events[i].flags: 0
> >>>     (XEN) [18446743899.720612] hpet_msi_write:283: iommu_intremap: 2 =
(iommu_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x110
> >>>     (XEN) [18446743899.720638] hpet_msi_write:287: iommu_update_ire_f=
rom_msi rc: 0
> >>
> >> So it succeeds, and the low half of HPET_Tn_ROUTE also looks plausible=
=2E The high
> >> half is, however, the address that the low half value is written to. I=
t's hard
> >> to imagine that it would be zero when the low half isn't, but it is ab=
out the
> >> last thing I can think of which could explain observed behavior. (Yet =
then, all
> >> of this is pretty meaningless; see below.)
> >>
> >>> And the current debug diff attached.
> >>
> >> Hmm, you log HPET_Tn_ROUTE _before_ our update. That's not very useful=
=2E You want
> >> to move that part of logging to the bottom of hpet_msi_write(), or may=
be to
> >> where you also log the per-channel cfg value in hpet_broadcast_resume(=
) (thus
> >> making the logging overall less verbose).
> >=20
> > This test is with the updated patch (attached) + your extra
> > calculate_host_policy() call and "no-arat" on cmdline:
>=20
> And IOMMU faults still occurring as before, I expect.
>=20
> Sadly you now log the low halves of HPET_Tn_ROUTE twice, while you don't =
log
> the high halves at all.

I was missing hpet_read32 there...

Updated:
(XEN) [  116.921573] Entering ACPI S3 state.
(XEN) [18446743895.088893] _disable_pit_irq:2649: using_pit: 0, cpu_has_api=
c: 1
(XEN) [18446743895.088907] _disable_pit_irq:2659: cpuidle_using_deep_cstate=
: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
(XEN) [18446743895.088918] _disable_pit_irq:2662: init: 0
(XEN) [18446743895.088928] hpet_broadcast_resume:662: hpet_events: ffff8304=
6bc1f080
(XEN) [18446743895.089072] hpet_broadcast_resume:673: num_hpets_used: 8
(XEN) [18446743895.089081] hpet_broadcast_resume:691: cfg: 0x1
(XEN) [18446743895.089092] hpet_broadcast_resume:696: i:0, hpet_events[i].m=
si.irq: 122, hpet_events[i].flags: 0
(XEN) [18446743895.089122] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743895.089132] hpet_broadcast_resume:700: i:0, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743895.089168] hpet_broadcast_resume:710: i:0, cfg: 0xc134, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xf18
(XEN) [18446743895.089180] hpet_broadcast_resume:696: i:1, hpet_events[i].m=
si.irq: 123, hpet_events[i].flags: 0
(XEN) [18446743895.089203] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743895.089213] hpet_broadcast_resume:700: i:1, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743895.089242] hpet_broadcast_resume:710: i:1, cfg: 0xc104, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xf38
(XEN) [18446743895.089254] hpet_broadcast_resume:696: i:2, hpet_events[i].m=
si.irq: 124, hpet_events[i].flags: 0
(XEN) [18446743895.089278] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743895.089288] hpet_broadcast_resume:700: i:2, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743895.089316] hpet_broadcast_resume:710: i:2, cfg: 0xc104, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xf58
(XEN) [18446743895.089327] hpet_broadcast_resume:696: i:3, hpet_events[i].m=
si.irq: 125, hpet_events[i].flags: 0
(XEN) [18446743895.089350] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743895.089361] hpet_broadcast_resume:700: i:3, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743895.089390] hpet_broadcast_resume:710: i:3, cfg: 0xc104, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xf78
(XEN) [18446743895.089401] hpet_broadcast_resume:696: i:4, hpet_events[i].m=
si.irq: 126, hpet_events[i].flags: 0
(XEN) [18446743895.089425] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743895.089436] hpet_broadcast_resume:700: i:4, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743895.089465] hpet_broadcast_resume:710: i:4, cfg: 0xc104, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xf98
(XEN) [18446743895.089476] hpet_broadcast_resume:696: i:5, hpet_events[i].m=
si.irq: 127, hpet_events[i].flags: 0
(XEN) [18446743895.089499] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743895.089509] hpet_broadcast_resume:700: i:5, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743895.089540] hpet_broadcast_resume:710: i:5, cfg: 0xc104, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xfb8
(XEN) [18446743895.089551] hpet_broadcast_resume:696: i:6, hpet_events[i].m=
si.irq: 128, hpet_events[i].flags: 0
(XEN) [18446743895.089574] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743895.089584] hpet_broadcast_resume:700: i:6, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743895.089622] hpet_broadcast_resume:710: i:6, cfg: 0xc104, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xfd8
(XEN) [18446743895.089633] hpet_broadcast_resume:696: i:7, hpet_events[i].m=
si.irq: 129, hpet_events[i].flags: 0
(XEN) [18446743895.089655] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743895.089665] hpet_broadcast_resume:700: i:7, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743895.089702] hpet_broadcast_resume:710: i:7, cfg: 0xc104, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xff8




--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fbsx/PxUsQ8mae8A
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnO9nYACgkQ24/THMrX
1yw4+ggAjeBgaIS4YoxfNLIVVP+1oVkX3F6I6XhD3x1yiZ/zciW6Cm1NxHRdiUVu
78pZSaK9adlOW5I6XQ2Dr02J152I1N12a8nWyYurUcbrKQzecJ70kKIPm/hCEszv
RCrrPreY1WoLrhsgxSXQV0txJ3R/gRfsELJEgOwK3aXZ6ZmiO8ZJchA1KDzb4lzS
u+Y/ypQ6PFXi2lc/EMDVItBT+guBaQs5ByS1Tw/P1+zM+ZmhFH9EUuGoL04gi4Lr
H48uFWzirwwTIwNgCVcf6SBHhsHDLfmLSzSM42bHfkpeXOTYH1JgSuzwGHEnfzAc
xXi5E3locUdzihMNYmMGFMxOs9YBdw==
=MpIb
-----END PGP SIGNATURE-----

--fbsx/PxUsQ8mae8A--

