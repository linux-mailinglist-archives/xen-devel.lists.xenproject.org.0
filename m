Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OC/QJ+nr1GkjywcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 13:35:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49273ADC42
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 13:35:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274925.1560897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA4hm-0002rs-74; Tue, 07 Apr 2026 11:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274925.1560897; Tue, 07 Apr 2026 11:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA4hm-0002pt-2O; Tue, 07 Apr 2026 11:34:50 +0000
Received: by outflank-mailman (input) for mailman id 1274925;
 Tue, 07 Apr 2026 11:34:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wA4hk-0002pn-Od
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 11:34:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA4hk-0057zs-2g
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 13:34:48 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d4ebd4-e002-0a2a0a5209dd-0a2a450cadce-14
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 13:34:48 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d4ebd6-f40c-0a2a450c0019-67a8ac95bd29-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 13:34:47 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 383B2EC00B6;
 Tue,  7 Apr 2026 07:34:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 07 Apr 2026 07:34:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Apr 2026 07:34:45 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1775561686;
	 x=1775648086; bh=Wts+sXnqpczM3cjxSRJ9r4kNO8gj2nxg9clRBSD9IIs=; b=
	dNT0NG5eE1MQo96zpgODYXttrDTh/XFaIRB6sbST8Vu9fofZAw9pGvtJU6bIUip+
	5Jk9O0+8qj+mOOKl6l0xWHdz7DwaacleG9Qv6H616nSmvmk7kz7Q9+uSdI49izcy
	i8ES3Eqf/UP+EU2n4/20mXzipdooqSehOWztCgNg/ZUKs11ew14SpaXSLToG+YSa
	HRH8VbUbIyteGO4BxgTPpI22oHlMnFZSuJOY0d5gG7gbYZK+Phvem5RD955bv/Pm
	sH2pLJUJ43ns3dsXtp4Bu7m/71Mn1WnjPS10YBTOmo/pcQLUyhMkqz0kIW9eoOT/
	mMOSnLcam2XfUL6KnjTSxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775561686; x=1775648086; bh=Wts+sXnqpczM3cjxSRJ9r4kNO8gj2nxg9cl
	RBSD9IIs=; b=DYcVnDUolWQ2UC8UdXA9GDdScvpHojUfNM4x77nrn4qs3h5eaIO
	mPjO2OW91WoBjGmPVDMfroEJBOM3CGbH8m6Cox3Q8/aGhvA9yIDAe7pruNoei7bL
	KsearPRs2wwdQ28wYnLeJDN2gX9dCnvX9xP4vg2TMdHzoOGAs8mbq4aAsmWm+oMJ
	NEmJMpHIJl2/pj9SR3fINH+kMqiIfhLvM+GTwRHU05uJuf/2EAFOkDfVG1hOzOnn
	sFST1Ux5t5fhEpGeyMapfad4529804SQSMvL1B6ZnocvIQfES7DW1X07bpf8ODZR
	kHTAkKkNUlPpKhnkcD/lmy+A32t+J9+4jlA==
X-ME-Sender: <xms:1evUaeKhuBjWM6e_2pAhL1Wpd5P6cACD6elZoYYay4OjVYNE0-kn0w>
    <xme:1evUacKY-Xh3Z8Xxu6_bCueH0H4klKjx5mEZGbMcs2P7wNTJ4Vif-mTouDs8h8Dkz
    N2-8JYLWIbxg1zl22M71nwUe_nMGGls3SU6ZlHZyvQHykrlQA>
X-ME-Received: <xmr:1evUacVMpQQY_0yaFWivGeo27yex6heQjN47F2Tpd034fhPqVqqOYKERTDEMYsGI6nwFtd_aTxQ5YaMGlIWyz34Isvb6Shnru9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvtdehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedvpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhm
    pdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrd
    horhhg
X-ME-Proxy: <xmx:1uvUaej20EDiYjazaU0Og66-o9SmsaLvIN9LY_QybLHE3FHJcn_maA>
    <xmx:1uvUaX8OdA5LUL-kAh0k_XFdkQi97VsmkXDuy1S6hsmg9lPFZqbRZQ>
    <xmx:1uvUaYAxHIn66Cidvuv8SA-JmFD52xNhqXUeajh0hhR_cRsjHM8yiA>
    <xmx:1uvUaULGDjPYBkuCMAX-nldUe828kU2YTRc72MTedEWlEXlfab6aMw>
    <xmx:1uvUaWfqLoYMd1mPBp-nu1-wMQSk520Cxc8VKsz6W0_KVJvHRc1HKEyY>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 7 Apr 2026 13:34:43 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3
Message-ID: <adTr0_IwZXcGgUI1@mail-itl>
References: <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com>
 <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
 <ac44SVW1cPhKYFKU@mail-itl>
 <2caff339-4ce9-42ea-9b78-afeac42b6f0f@suse.com>
 <ac6Bg21hMLBRDNdm@mail-itl>
 <92e0151b-3fb1-4108-9788-f0fbac43512b@suse.com>
 <ac72dp3yEHikJzw2@mail-itl>
 <47b140b2-596b-47db-9c0c-43672f445036@suse.com>
 <8c9e5404-24bf-410d-a2e8-551cb87c6400@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r45afIgNHStFFFQy"
Content-Disposition: inline
In-Reply-To: <8c9e5404-24bf-410d-a2e8-551cb87c6400@suse.com>
X-purgate-ID: tlsNG-d25034/1775561687-8274EA3D-2A28951C/0/0
X-purgate-type: clean
X-purgate-size: 9874
X-Spamd-Result: default: False [-2.23 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,messagingengine.com:dkim];
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
X-Rspamd-Queue-Id: C49273ADC42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--r45afIgNHStFFFQy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 7 Apr 2026 13:34:43 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3

On Tue, Apr 07, 2026 at 12:23:16PM +0200, Jan Beulich wrote:
> On 07.04.2026 08:29, Jan Beulich wrote:
> > On 03.04.2026 01:06, Marek Marczykowski-G=C3=B3recki wrote:
> >> On Thu, Apr 02, 2026 at 04:53:31PM +0200, Jan Beulich wrote:
> >>> Sadly you now log the low halves of HPET_Tn_ROUTE twice, while you do=
n't log
> >>> the high halves at all.
> >>
> >> I was missing hpet_read32 there...
> >>
> >> Updated:
> >> (XEN) [  116.921573] Entering ACPI S3 state.
> >> (XEN) [18446743895.088893] _disable_pit_irq:2649: using_pit: 0, cpu_ha=
s_apic: 1
> >> (XEN) [18446743895.088907] _disable_pit_irq:2659: cpuidle_using_deep_c=
state: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> >> (XEN) [18446743895.088918] _disable_pit_irq:2662: init: 0
> >> (XEN) [18446743895.088928] hpet_broadcast_resume:662: hpet_events: fff=
f83046bc1f080
> >> (XEN) [18446743895.089072] hpet_broadcast_resume:673: num_hpets_used: 8
> >> (XEN) [18446743895.089081] hpet_broadcast_resume:691: cfg: 0x1
> >> (XEN) [18446743895.089092] hpet_broadcast_resume:696: i:0, hpet_events=
[i].msi.irq: 122, hpet_events[i].flags: 0
> >> (XEN) [18446743895.089122] hpet_msi_write:286: iommu_update_ire_from_m=
si rc: 0
> >> (XEN) [18446743895.089132] hpet_broadcast_resume:700: i:0, __hpet_setu=
p_msi_irq ret: 0
> >> (XEN) [18446743895.089168] hpet_broadcast_resume:710: i:0, cfg: 0xc134=
, hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_RO=
UTE(hpet_events[i].idx) + 4): 0xf18
> >=20
> > Okay, this would appear to clarify that the address really isn't correc=
t. Yet I'm
> > confused now by the low half values: In your earlier log there was
> >=20
> > hpet_broadcast_resume:710: i:0, cfg: 0xc134, HPET_Tn_ROUTE(hpet_events[=
i].idx): 0x110
> >=20
> > and alike, i.e. clearly a non-zero value. Now all low halves are zero. =
I'll try
> > to figure how the logged values here could result, but consistent data =
(or an
> > explantation for the apparent inconsistency) would help.
>=20
> Could you give the patch below a try?
>=20
> Jan
>=20
> x86/HPET: channel handling in hpet_broadcast_resume()
>=20
> The per-channel ENABLE bit is to solely be driven by hpet_enable_channel()
> and hpet_msi_{,un}mask(). It doesn't need setting immediately. Except for
> the (possible) channel put in legacy mode we don't do so during boot
> either.
>=20
> Instead reset ->arch.cpu_mask, to avoid msi_compose_msg() yielding an
> all-zero message (when the passed in CPU mask has no online CPUs). Nothing
> would later call msi_compose_msg() / hpet_msi_write(), and hence nothing
> would later produce a well-formed message template in
> hpet_events[].msi.msg.
>=20
> Fixes: 15aa6c67486c ("amd iommu: use base platform MSI implementation")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This appears to fix the IOMMU faults.
Started with no-arat, the debug output is now this:

(XEN) [18446743900.509455] _disable_pit_irq:2649: using_pit: 0, cpu_has_api=
c: 1
(XEN) [18446743900.509470] _disable_pit_irq:2659: cpuidle_using_deep_cstate=
: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
(XEN) [18446743900.509480] _disable_pit_irq:2662: init: 0
(XEN) [18446743900.509491] hpet_broadcast_resume:662: hpet_events: ffff8304=
61b3f080
(XEN) [18446743900.509636] hpet_broadcast_resume:673: num_hpets_used: 8
(XEN) [18446743900.509644] hpet_broadcast_resume:691: cfg: 0x1
(XEN) [18446743900.509656] hpet_broadcast_resume:696: i:0, hpet_events[i].m=
si.irq: 122, hpet_events[i].flags: 0
(XEN) [18446743900.509687] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743900.509698] hpet_broadcast_resume:705: i:0, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743900.509728] hpet_broadcast_resume:715: i:0, cfg: 0xc130, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xfee00f18
(XEN) [18446743900.509739] hpet_broadcast_resume:696: i:1, hpet_events[i].m=
si.irq: 123, hpet_events[i].flags: 0
(XEN) [18446743900.509762] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743900.509772] hpet_broadcast_resume:705: i:1, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743900.509803] hpet_broadcast_resume:715: i:1, cfg: 0xc100, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xfee00f38
(XEN) [18446743900.509814] hpet_broadcast_resume:696: i:2, hpet_events[i].m=
si.irq: 124, hpet_events[i].flags: 0
(XEN) [18446743900.509838] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743900.509848] hpet_broadcast_resume:705: i:2, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743900.509877] hpet_broadcast_resume:715: i:2, cfg: 0xc100, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xfee00f58
(XEN) [18446743900.509888] hpet_broadcast_resume:696: i:3, hpet_events[i].m=
si.irq: 125, hpet_events[i].flags: 0
(XEN) [18446743900.509912] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743900.509922] hpet_broadcast_resume:705: i:3, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743900.509952] hpet_broadcast_resume:715: i:3, cfg: 0xc100, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xfee00f78
(XEN) [18446743900.509963] hpet_broadcast_resume:696: i:4, hpet_events[i].m=
si.irq: 126, hpet_events[i].flags: 0
(XEN) [18446743900.509987] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743900.509997] hpet_broadcast_resume:705: i:4, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743900.510027] hpet_broadcast_resume:715: i:4, cfg: 0xc100, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xfee00f98
(XEN) [18446743900.510038] hpet_broadcast_resume:696: i:5, hpet_events[i].m=
si.irq: 127, hpet_events[i].flags: 0
(XEN) [18446743900.510062] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743900.510072] hpet_broadcast_resume:705: i:5, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743900.510102] hpet_broadcast_resume:715: i:5, cfg: 0xc100, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xfee00fb8
(XEN) [18446743900.510113] hpet_broadcast_resume:696: i:6, hpet_events[i].m=
si.irq: 128, hpet_events[i].flags: 0
(XEN) [18446743900.510138] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743900.510149] hpet_broadcast_resume:705: i:6, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743900.510179] hpet_broadcast_resume:715: i:6, cfg: 0xc100, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xfee00fd8
(XEN) [18446743900.510191] hpet_broadcast_resume:696: i:7, hpet_events[i].m=
si.irq: 129, hpet_events[i].flags: 0
(XEN) [18446743900.510214] hpet_msi_write:286: iommu_update_ire_from_msi rc=
: 0
(XEN) [18446743900.510224] hpet_broadcast_resume:705: i:7, __hpet_setup_msi=
_irq ret: 0
(XEN) [18446743900.510253] hpet_broadcast_resume:715: i:7, cfg: 0xc100, hpe=
t_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROUTE(h=
pet_events[i].idx) + 4): 0xfee00ff8


> ---
> As to the Fixes: tag: The issue for the HPET resume case is the
> cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) check in
> msi_compose_msg(). The earlier cpumask_empty() wasn't a problem, as
> cpu_mask_to_apicid() returning a bogus (offline) value didn't have any bad
> effect: Before use, a valid destination would have been put in place, but
> other parts of .msg were properly set up. Furthermore we also didn't clear
> the entire message prior to that change.
>=20
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -685,12 +685,18 @@ void hpet_broadcast_resume(void)
>      for ( i =3D 0; i < n; i++ )
>      {
>          if ( hpet_events[i].msi.irq >=3D 0 )
> +        {
> +            struct irq_desc *desc =3D irq_to_desc(hpet_events[i].msi.irq=
);
> +
> +            cpumask_copy(desc->arch.cpu_mask, cpumask_of(smp_processor_i=
d()));
> +
>              __hpet_setup_msi_irq(irq_to_desc(hpet_events[i].msi.irq));
> +        }
> =20
>          /* set HPET Tn as oneshot */
>          cfg =3D hpet_read32(HPET_Tn_CFG(hpet_events[i].idx));
>          cfg &=3D ~(HPET_TN_LEVEL | HPET_TN_PERIODIC);
> -        cfg |=3D HPET_TN_ENABLE | HPET_TN_32BIT;
> +        cfg |=3D HPET_TN_32BIT;
>          if ( !(hpet_events[i].flags & HPET_EVT_LEGACY) )
>              cfg |=3D HPET_TN_FSB;
>          hpet_write32(cfg, HPET_Tn_CFG(hpet_events[i].idx));
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--r45afIgNHStFFFQy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnU69MACgkQ24/THMrX
1yzXvAf7B0UW9UyjQV7OjCvh48ZppaP+IhfIwk44lYnzr5XBxaYw8ciZHmA7ejYg
dweE0Np/WVgZcN+54TkDoc7nVKcABG7OvW11itmFhqTsUmljWwXSETQEqexgQb9m
Hu2LtbKIuUCn3yCOfEblwSmrs6VLie0g68isAXnA1KkiuNMAIIuUBty4PrRMm3g+
CVsuLLNYZ8/oFQNgAdPm90VxHDk5Kq2SvNiOEk4aFRSTh00TJp9g/edof4h+Q8dq
rrZMMdXUaKWJpAhrNNnHNkrbTLQjiHuDpX+JMTx/he9p7wv+GY8AIdxfIYCJZ12y
hMGhfX86/B/M8hxllmrJOAl4Z0XXIw==
=wqQI
-----END PGP SIGNATURE-----

--r45afIgNHStFFFQy--

