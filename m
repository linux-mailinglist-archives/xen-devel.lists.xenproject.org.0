Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEf/HLWBzmkqoAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 16:48:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C86C138ACC3
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 16:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272036.1559944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8JKb-0000QG-79; Thu, 02 Apr 2026 14:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272036.1559944; Thu, 02 Apr 2026 14:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8JKb-0000Ne-2w; Thu, 02 Apr 2026 14:47:37 +0000
Received: by outflank-mailman (input) for mailman id 1272036;
 Thu, 02 Apr 2026 14:47:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w8JKZ-0000NY-Lu
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 14:47:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8JKZ-00FZxd-0l
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 16:47:35 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce8173-2eae-0a2a0a5409dd-0a2a45018934-32
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 16:47:34 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce8185-6fc9-0a2a45010019-67a8ac95aaeb-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 16:47:34 +0200
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
 by mailfout.phl.internal (Postfix) with ESMTP id 89645EC016E;
 Thu,  2 Apr 2026 10:47:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Thu, 02 Apr 2026 10:47:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Apr 2026 10:47:32 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775141253;
	 x=1775227653; bh=Nalez2hzKJmYtxPhZ2f0O/FHVE9aXYFcgl08Ai4+JtA=; b=
	gs3SrGnWaanBkcPrEClsUS/MMJTe/6LWzChuDvGST/NRxndaM7hRds9lR9eYN0wi
	HDkOz9Bm4wobTII9YYYjObVF5+qcjHx0e/Vaa1Xu2MIAXPd0xmb9mW6AJHEwmeMq
	NW2I86WQbomoPaTxq/sDm71vuM+zNqDln2FWh9flbn2nBgz8HpgH8oJb8TnQ1Z2y
	vap5cSJyKmZfwK2ixOXtClEOsTkNNG8+U6R/qjXbRh331gTayMG6ciMVBktXOsXJ
	SQhlycVyCUEzCD5ZxZOBfJP0nF0Z+0gQ2LIkRfELLK67e+VQorAzQyRda8ibh0q9
	TWb2A7KRqbTc/Pti9D3X7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775141253; x=1775227653; bh=Nalez2hzKJmYtxPhZ2f0O/FHVE9aXYFcgl0
	8Ai4+JtA=; b=E2tOvpG7P82HWs+97bEBSzLJ5oAeJFf1mxL7fIcS5EIwUfaFhqS
	DuTxxXAjMsk2Y1nlKQS8fvpeVeafVvVjArb256jgdyCbDVg39auf17yiA3CZu9bK
	/CjnNmfSHy/ZqSpKkJ7GL3qlf9gxH0TvOv1I1ZU87jQebelZe0atuuiAJ+o2gVSL
	BpmY4x+BabZ5ZIAVgstsevoQ5s9V4scLDlc4c4u7l5rndfPUEq/sJOtUVvNRw6FM
	+nL1aygHVdYp5XpegDFwKJPjI4RUelsoc5Q/BIIrW3myvB7K2PMDYFy/GIb2ftxu
	Wjr7xWIbnPWrpULT1I1BQbd9DmpXJZzSsJQ==
X-ME-Sender: <xms:hYHOae2miEhb5B1t6lS707pbSgEbK2eWv3MuKfzrwJ7glXMmhIe7qA>
    <xme:hYHOaXGgN-kNAlyLQnTfHmZ6nap2rksgJvor-niE1riL9j1eYZsoN-1CfdCg4HPhf
    rYKvBT1hlolphLxtsJCVZO88fZiT_qlYOOGBAnqV5pOMAQ7EA>
X-ME-Received: <xmr:hYHOaUjMSWFyvOysrbd4hMEuYjl0hTvjCgITwerALXCJa6jbMORiL4nGXGE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeifeduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:hYHOaa_zLqS1iEhNsIFYnVn4IJN3zK1tYNmtypJPjPLtGHAKRMlz4g>
    <xmx:hYHOaTp5B2iKUd6xFbKvfTztwa1GDCODzRLHWptfj7iwQBNmzY-gdg>
    <xmx:hYHOaR-lKK2ujtO2GSCCUfd6omMgVcqGYxOQFoqz5yoUtwkKwFnbZA>
    <xmx:hYHOafXa0DRvfCGzx7CMr3zi9e1KJtMArPpGXt5yrtY1Lw-tkWDKeQ>
    <xmx:hYHOaZIWirSqz_WJDF_eiJQ_sgxPYcbYQKpfVKD2O3FYoGyt9uiZTYMR>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Apr 2026 16:47:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3
Message-ID: <ac6Bg21hMLBRDNdm@mail-itl>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com>
 <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com>
 <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
 <ac44SVW1cPhKYFKU@mail-itl>
 <2caff339-4ce9-42ea-9b78-afeac42b6f0f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ISpOtCzGrGc4UBsj"
Content-Disposition: inline
In-Reply-To: <2caff339-4ce9-42ea-9b78-afeac42b6f0f@suse.com>
X-purgate-ID: tlsNG-d62444/1775141254-168F4185-1F0BEAB7/0/0
X-purgate-type: clean
X-purgate-size: 14224
X-Spamd-Result: default: False [-2.23 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:email];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: C86C138ACC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ISpOtCzGrGc4UBsj
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="XVDyUL3T4K294TsS"
Content-Disposition: inline
Date: Thu, 2 Apr 2026 16:47:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3


--XVDyUL3T4K294TsS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 12:48:14PM +0200, Jan Beulich wrote:
> On 02.04.2026 11:35, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Apr 02, 2026 at 10:39:41AM +0200, Jan Beulich wrote:
> >> On 02.04.2026 10:08, Marek Marczykowski-G=C3=B3recki wrote:
> >>> The xl dmesg output (from MTL this time):
> >>>
> >>>     (XEN) [  123.477511] Entering ACPI S3 state.
> >>>     (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: 0, c=
pu_has_apic: 1
> >>>     (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_using_d=
eep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> >=20
> >> Hmm, but what you didn't log is whether __hpet_setup_msi_irq() actually
> >> succeeded everywhere. (And if it did, also logging HPET_Tn_ROUTE() val=
ues
> >> might be a good idea, if only to double check.)
> >=20
> > Updated output:
> >=20
> >     (XEN) [18446743899.720395] _disable_pit_irq:2649: using_pit: 0, cpu=
_has_apic: 1
> >     (XEN) [18446743899.720409] _disable_pit_irq:2659: cpuidle_using_dee=
p_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> >     (XEN) [18446743899.720420] _disable_pit_irq:2662: init: 0
> >     (XEN) [18446743899.720431] hpet_broadcast_resume:663: hpet_events: =
ffff83046bc1f080
> >     (XEN) [18446743899.720579] hpet_broadcast_resume:674: num_hpets_use=
d: 8
> >     (XEN) [18446743899.720587] hpet_broadcast_resume:692: cfg: 0x1
> >     (XEN) [18446743899.720599] hpet_broadcast_resume:697: i:0, hpet_eve=
nts[i].msi.irq: 122, hpet_events[i].flags: 0
> >     (XEN) [18446743899.720612] hpet_msi_write:283: iommu_intremap: 2 (i=
ommu_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x110
> >     (XEN) [18446743899.720638] hpet_msi_write:287: iommu_update_ire_fro=
m_msi rc: 0
>=20
> So it succeeds, and the low half of HPET_Tn_ROUTE also looks plausible. T=
he high
> half is, however, the address that the low half value is written to. It's=
 hard
> to imagine that it would be zero when the low half isn't, but it is about=
 the
> last thing I can think of which could explain observed behavior. (Yet the=
n, all
> of this is pretty meaningless; see below.)
>=20
> > And the current debug diff attached.
>=20
> Hmm, you log HPET_Tn_ROUTE _before_ our update. That's not very useful. Y=
ou want
> to move that part of logging to the bottom of hpet_msi_write(), or maybe =
to
> where you also log the per-channel cfg value in hpet_broadcast_resume() (=
thus
> making the logging overall less verbose).

This test is with the updated patch (attached) + your extra
calculate_host_policy() call and "no-arat" on cmdline:

    (XEN) [18446743900.569705] _disable_pit_irq:2649: using_pit: 0, cpu_has=
_apic: 1
    (XEN) [18446743900.569720] _disable_pit_irq:2659: cpuidle_using_deep_cs=
tate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
    (XEN) [18446743900.569730] _disable_pit_irq:2662: init: 0
    (XEN) [18446743900.569741] hpet_broadcast_resume:662: hpet_events: ffff=
83046bc1f080
    (XEN) [18446743900.569885] hpet_broadcast_resume:673: num_hpets_used: 8
    (XEN) [18446743900.569893] hpet_broadcast_resume:691: cfg: 0x1
    (XEN) [18446743900.569905] hpet_broadcast_resume:696: i:0, hpet_events[=
i].msi.irq: 122, hpet_events[i].flags: 0
    (XEN) [18446743900.569935] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743900.569946] hpet_broadcast_resume:700: i:0, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743900.569970] hpet_broadcast_resume:710: i:0, cfg: 0xc134,=
 HPET_Tn_ROUTE(hpet_events[i].idx): 0x110
    (XEN) [18446743900.569980] hpet_broadcast_resume:713: HPET_Tn_ROUTE(hpe=
t_events[i].idx): 0x110
    (XEN) [18446743900.569989] hpet_broadcast_resume:696: i:1, hpet_events[=
i].msi.irq: 123, hpet_events[i].flags: 0
    (XEN) [18446743900.570012] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743900.570022] hpet_broadcast_resume:700: i:1, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743900.570040] hpet_broadcast_resume:710: i:1, cfg: 0xc104,=
 HPET_Tn_ROUTE(hpet_events[i].idx): 0x130
    (XEN) [18446743900.570050] hpet_broadcast_resume:713: HPET_Tn_ROUTE(hpe=
t_events[i].idx): 0x130
    (XEN) [18446743900.570059] hpet_broadcast_resume:696: i:2, hpet_events[=
i].msi.irq: 124, hpet_events[i].flags: 0
    (XEN) [18446743900.570082] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743900.570092] hpet_broadcast_resume:700: i:2, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743900.570105] hpet_broadcast_resume:710: i:2, cfg: 0xc104,=
 HPET_Tn_ROUTE(hpet_events[i].idx): 0x150
    (XEN) [18446743900.570114] hpet_broadcast_resume:713: HPET_Tn_ROUTE(hpe=
t_events[i].idx): 0x150
    (XEN) [18446743900.570123] hpet_broadcast_resume:696: i:3, hpet_events[=
i].msi.irq: 125, hpet_events[i].flags: 0
    (XEN) [18446743900.570145] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743900.570155] hpet_broadcast_resume:700: i:3, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743900.570172] hpet_broadcast_resume:710: i:3, cfg: 0xc104,=
 HPET_Tn_ROUTE(hpet_events[i].idx): 0x170
    (XEN) [18446743900.570181] hpet_broadcast_resume:713: HPET_Tn_ROUTE(hpe=
t_events[i].idx): 0x170
    (XEN) [18446743900.570191] hpet_broadcast_resume:696: i:4, hpet_events[=
i].msi.irq: 126, hpet_events[i].flags: 0
    (XEN) [18446743900.570214] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743900.570225] hpet_broadcast_resume:700: i:4, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743900.570242] hpet_broadcast_resume:710: i:4, cfg: 0xc104,=
 HPET_Tn_ROUTE(hpet_events[i].idx): 0x190
    (XEN) [18446743900.570251] hpet_broadcast_resume:713: HPET_Tn_ROUTE(hpe=
t_events[i].idx): 0x190
    (XEN) [18446743900.570260] hpet_broadcast_resume:696: i:5, hpet_events[=
i].msi.irq: 127, hpet_events[i].flags: 0
    (XEN) [18446743900.570282] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743900.570292] hpet_broadcast_resume:700: i:5, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743900.570309] hpet_broadcast_resume:710: i:5, cfg: 0xc104,=
 HPET_Tn_ROUTE(hpet_events[i].idx): 0x1b0
    (XEN) [18446743900.570318] hpet_broadcast_resume:713: HPET_Tn_ROUTE(hpe=
t_events[i].idx): 0x1b0
    (XEN) [18446743900.570327] hpet_broadcast_resume:696: i:6, hpet_events[=
i].msi.irq: 128, hpet_events[i].flags: 0
    (XEN) [18446743900.570351] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743900.570361] hpet_broadcast_resume:700: i:6, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743900.570374] hpet_broadcast_resume:710: i:6, cfg: 0xc104,=
 HPET_Tn_ROUTE(hpet_events[i].idx): 0x1d0
    (XEN) [18446743900.570383] hpet_broadcast_resume:713: HPET_Tn_ROUTE(hpe=
t_events[i].idx): 0x1d0
    (XEN) [18446743900.570392] hpet_broadcast_resume:696: i:7, hpet_events[=
i].msi.irq: 129, hpet_events[i].flags: 0
    (XEN) [18446743900.570415] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743900.570425] hpet_broadcast_resume:700: i:7, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743900.570442] hpet_broadcast_resume:710: i:7, cfg: 0xc104,=
 HPET_Tn_ROUTE(hpet_events[i].idx): 0x1f0
    (XEN) [18446743900.570451] hpet_broadcast_resume:713: HPET_Tn_ROUTE(hpe=
t_events[i].idx): 0x1f0


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--XVDyUL3T4K294TsS
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=0001-DEBUG.patch
Content-Transfer-Encoding: quoted-printable

=46rom 34e6a34cf0504233776337ace8ac69a92297984e Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Marek=3D20Marczykowski-G=3DC3=3DB3recki?=3D
 <marmarek@invisiblethingslab.com>
Date: Thu, 2 Apr 2026 11:09:32 +0200
Subject: [PATCH] DEBUG

---
 xen/arch/x86/cpu-policy.c |  1 +
 xen/arch/x86/cpu/intel.c  |  1 +
 xen/arch/x86/hpet.c       | 17 ++++++++++++++++-
 xen/arch/x86/time.c       |  3 +++
 xen/source                |  1 +
 5 files changed, 22 insertions(+), 1 deletion(-)
 create mode 120000 xen/source

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 5273fe0ae435..9916afd5ed68 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -364,6 +364,7 @@ static void __init calculate_host_policy(void)
     struct cpu_policy *p =3D &host_cpu_policy;
     unsigned int max_extd_leaf;
=20
+    printk("%s:%d\n", __func__, __LINE__);
     *p =3D raw_cpu_policy;
=20
     p->basic.max_leaf =3D
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 18b3c79dc97f..51a3d1c4b5f3 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -671,6 +671,7 @@ const struct cpu_dev __initconst_cf_clobber intel_cpu_d=
ev =3D {
=20
 void __init intel_init_arat(void)
 {
+    printk("%s:%d: opt_arat: %d, cpu_has_arat: %d\n", __func__, __LINE__, =
opt_arat, cpu_has_arat);
     if ( opt_arat && cpu_has_arat )
         setup_force_cpu_cap(X86_FEATURE_XEN_ARAT);
 }
diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 1ea8ae457424..cef060cb18bb 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -283,6 +283,7 @@ static int hpet_msi_write(struct hpet_event_channel *ch=
, struct msi_msg *msg)
     if ( iommu_intremap !=3D iommu_intremap_off )
     {
         int rc =3D iommu_update_ire_from_msi(&ch->msi, msg);
+        printk("%s:%d: iommu_update_ire_from_msi rc: %d\n", __func__, __LI=
NE__, rc);
=20
         if ( rc < 0 )
             return rc;
@@ -658,6 +659,8 @@ void hpet_broadcast_resume(void)
     u32 cfg;
     unsigned int i, n;
=20
+    printk("%s:%d: hpet_events: %p\n", __func__, __LINE__, hpet_events);
+
     if ( !hpet_events )
         return;
=20
@@ -667,25 +670,35 @@ void hpet_broadcast_resume(void)
=20
     if ( num_hpets_used > 0 )
     {
+        printk("%s:%d: num_hpets_used: %d\n", __func__, __LINE__, num_hpet=
s_used);
         /* Stop HPET legacy interrupts */
         cfg &=3D ~HPET_CFG_LEGACY;
         n =3D num_hpets_used;
     }
     else if ( hpet_events->flags & HPET_EVT_DISABLE )
+    {
+        printk("%s:%d: hpet_events->flags: %#x\n", __func__, __LINE__, hpe=
t_events->flags);
         return;
+    }
     else
     {
         /* Start HPET legacy interrupts */
+        printk("%s:%d\n", __func__, __LINE__);
         cfg |=3D HPET_CFG_LEGACY;
         n =3D 1;
     }
=20
+    printk("%s:%d: cfg: %#x\n", __func__, __LINE__, cfg);
     hpet_write32(cfg, HPET_CFG);
=20
     for ( i =3D 0; i < n; i++ )
     {
+        printk("%s:%d: i:%d, hpet_events[i].msi.irq: %d, hpet_events[i].fl=
ags: %#x\n", __func__, __LINE__, i, hpet_events[i].msi.irq, hpet_events[i].=
flags);
         if ( hpet_events[i].msi.irq >=3D 0 )
-            __hpet_setup_msi_irq(irq_to_desc(hpet_events[i].msi.irq));
+        {
+            int ret =3D __hpet_setup_msi_irq(irq_to_desc(hpet_events[i].ms=
i.irq));
+            printk("%s:%d: i:%d, __hpet_setup_msi_irq ret: %d\n", __func__=
, __LINE__, i, ret);
+        }
=20
         /* set HPET Tn as oneshot */
         cfg =3D hpet_read32(HPET_Tn_CFG(hpet_events[i].idx));
@@ -694,8 +707,10 @@ void hpet_broadcast_resume(void)
         if ( !(hpet_events[i].flags & HPET_EVT_LEGACY) )
             cfg |=3D HPET_TN_FSB;
         hpet_write32(cfg, HPET_Tn_CFG(hpet_events[i].idx));
+        printk("%s:%d: i:%d, cfg: %#x, HPET_Tn_ROUTE(hpet_events[i].idx): =
%#x\n", __func__, __LINE__, i, cfg, HPET_Tn_ROUTE(hpet_events[i].idx));
=20
         hpet_events[i].next_event =3D STIME_MAX;
+        printk("%s:%d: HPET_Tn_ROUTE(hpet_events[i].idx): %#x\n", __func__=
, __LINE__, HPET_Tn_ROUTE(hpet_events[i].idx));
     }
 }
=20
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index fed30a919d2c..15113ebdfb6c 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2646,6 +2646,7 @@ static int _disable_pit_irq(bool init)
 {
     int ret =3D 1;
=20
+    printk("%s:%d: using_pit: %d, cpu_has_apic: %d\n", __func__, __LINE__,=
 using_pit, cpu_has_apic);
     if ( using_pit || !cpu_has_apic )
         return -1;
=20
@@ -2655,8 +2656,10 @@ static int _disable_pit_irq(bool init)
      * XXX dom0 may rely on RTC interrupt delivery, so only enable
      * hpet_broadcast if FSB mode available or if force_hpet_broadcast.
      */
+    printk("%s:%d: cpuidle_using_deep_cstate: %d, boot_cpu_has(X86_FEATURE=
_XEN_ARAT): %d\n", __func__, __LINE__, cpuidle_using_deep_cstate(), boot_cp=
u_has(X86_FEATURE_XEN_ARAT));
     if ( cpuidle_using_deep_cstate() && !boot_cpu_has(X86_FEATURE_XEN_ARAT=
) )
     {
+        printk("%s:%d: init: %d\n", __func__, __LINE__, init);
         init ? hpet_broadcast_init() : hpet_broadcast_resume();
         if ( !hpet_broadcast_is_available() )
         {
diff --git a/xen/source b/xen/source
new file mode 120000
index 000000000000..945c9b46d684
--- /dev/null
+++ b/xen/source
@@ -0,0 +1 @@
+.
\ No newline at end of file
--=20
2.53.0


--XVDyUL3T4K294TsS--

--ISpOtCzGrGc4UBsj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnOgYMACgkQ24/THMrX
1yxBTAf/atqaW9Tw6fqQ8dOiUs/f30vfa+hLXJhauCGlVPjPDQIy96tY58CsgbYK
vYcdG6Le4eHD7Xe3sif7HSUlXHIrta8EJ/se01eEdpSmm5162gVjBIkZ4e7/qo24
Ox2WXlwPtwLs16rfSXv5X5kzLJd6sXTCqRVYLqNEfchhYER+egwXZiVQxRq5E2dZ
gEZQQLU7I4J+FIC6zgvoq3gXxddxbwByHvWH7rTft2pjdujKC+x/g+lNyX13Rem5
WZjOu4lYVbA4sR5EHGyyK0DWiPVHi+IltcUPNHcoMZbBxKMUNB55vhtmTFK+bmuO
xluur8JBZrdYc0Qt3dmkzD9LC1i6dw==
=zN8b
-----END PGP SIGNATURE-----

--ISpOtCzGrGc4UBsj--

