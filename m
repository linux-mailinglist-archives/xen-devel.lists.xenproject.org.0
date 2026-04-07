Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH82AkfW1GnuxwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:02:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E8D3AC79F
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274748.1560771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3GQ-00005R-FH; Tue, 07 Apr 2026 10:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274748.1560771; Tue, 07 Apr 2026 10:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3GQ-0008Tj-CK; Tue, 07 Apr 2026 10:02:30 +0000
Received: by outflank-mailman (input) for mailman id 1274748;
 Tue, 07 Apr 2026 10:02:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wA3GO-0008Fa-Qi
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:02:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3GN-001uYO-TJ
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:02:28 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d4d62c-2eae-0a2a0a5409dd-0a2a45049c22-14
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:02:27 +0200
Received: from [103.168.172.150] (helo=fout-a7-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d4d632-bb33-0a2a45040019-67a8ac96d855-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:02:27 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 1F0FCEC013B;
 Tue,  7 Apr 2026 06:02:26 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Tue, 07 Apr 2026 06:02:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Apr 2026 06:02:25 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1775556145;
	 x=1775642545; bh=/hkEB4QDit0+/ygo+/HcMq1/SLyf2WzUJ0g2G5J/pc8=; b=
	GeZqvi5Oej9sMuOtkHgPmVUjgsjOY3FQdT1GybSWnhJPX+ja9nVDzFUH5NGWjhDX
	7D/uLpICiOc68nT1uCjMOMf/auSfpyzcz1Lop9A3/0+9pGa7S4r4Ypj0YeDG6or8
	Rf1i7mBfaOLE7sNWUH1TqCih7kw8Wyk8tf3k7dyTd93PAvVBFYKj2s3FPCXT4Ogw
	Ft8I7KlUtSkjlAjFlKCecwCrHRvlIGUIJEcp7gFEpykTWRnUnw3gxPl1zG7e2RWv
	jfMS120/mngvOjcWRcFO3aGyl7MUOeqVkxC7zveFghpMElPj4NTXCh1N86kTFjHB
	ka67bBvsp8JoHi2qfNsxWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775556145; x=1775642545; bh=/hkEB4QDit0+/ygo+/HcMq1/SLyf2WzUJ0g
	2G5J/pc8=; b=qj4yrdHvRQ7axxDpSNTacDNouV9h1yX+H1iStHaKdlfUxEfkXMo
	7KGzpnJl5BNrxqdZkEOdw7YS/hIonHLBWr5CieHvH95FT9/UTfcNtoCkU9PIHSu8
	uuOOzxxbC30RWpVYeiAkhG52h2F+wkGGic34DlhijOogaDIVylN+1P223bYN9v+T
	JB668MemquzcfAwH0UPZvmzZRqig72/mBl1N3LrEcaxD8SEqHzNenQctqZGEgohf
	rJhd6VvK7vpbefGReyqJtyt7i41Ww33S/MbDN8Nf1dlOg+xAtuhu3v+NHtuOu7mk
	vO/idebr40NZbpNOZQXdyIo4GXY4Eoxv6qg==
X-ME-Sender: <xms:MdbUaQtLkbFPtAO2VNzD9folD1eHQmjgkxLPjmE3ho6VnQbgsptSZA>
    <xme:MdbUaTd1ALUBlN-OPP02cDRsbngvST6bAAy39EAX7-iFpuVOPj6ez-ByPhtMCX_ls
    AwmQwYOtSwQlCwc9S_d_YaWTJhUfbKGCb2sEejaJkESczMj>
X-ME-Received: <xmr:MdbUaZZIfm_0fi_UyRiyuwmTNvXzK_0T250JzUuaXCmOWvidM4cK2xhruK-HgvT4Jy7-dZ_Fv69_H2_zr0F25I2QcHsK_Pqf0FQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvtdefhecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:MdbUaeX0HRSRH_6w8AdL4x_whzmpDIN_orWI9sW1_8jCYn5opiG8Gg>
    <xmx:MdbUaTiBqb0nLpf8UMqVFQvTg8BgmR35SWeQH4em6bs6FSPapj5d0w>
    <xmx:MdbUaUVAfFhKRfU0-8XxTCvH_PjvAgpB8eiO9aDSVUcmx8pdux-mdQ>
    <xmx:MdbUaSMO1j-77ZdhOYSIuEP8c4KAMz_VSaYdUDr834w8yTTGpLbgjw>
    <xmx:MdbUafATiguZ2iH6nXyAkSXoURRW15UA2ImfCEOnk4gbzkdmqhmYDe1_>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 7 Apr 2026 12:02:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3
Message-ID: <adTWL3mKyz8kxOgq@mail-itl>
References: <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com>
 <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
 <ac44SVW1cPhKYFKU@mail-itl>
 <2caff339-4ce9-42ea-9b78-afeac42b6f0f@suse.com>
 <ac6Bg21hMLBRDNdm@mail-itl>
 <92e0151b-3fb1-4108-9788-f0fbac43512b@suse.com>
 <ac72dp3yEHikJzw2@mail-itl>
 <47b140b2-596b-47db-9c0c-43672f445036@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OHzTrA9J+n9/U7Mb"
Content-Disposition: inline
In-Reply-To: <47b140b2-596b-47db-9c0c-43672f445036@suse.com>
X-purgate-ID: tlsNG-ebf023/1775556147-3052B51B-079D0E49/0/0
X-purgate-type: clean
X-purgate-size: 9550
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim];
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
X-Rspamd-Queue-Id: 29E8D3AC79F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--OHzTrA9J+n9/U7Mb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 7 Apr 2026 12:02:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3

On Tue, Apr 07, 2026 at 08:29:48AM +0200, Jan Beulich wrote:
> On 03.04.2026 01:06, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Apr 02, 2026 at 04:53:31PM +0200, Jan Beulich wrote:
> >> On 02.04.2026 16:47, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Thu, Apr 02, 2026 at 12:48:14PM +0200, Jan Beulich wrote:
> >>>> On 02.04.2026 11:35, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>> On Thu, Apr 02, 2026 at 10:39:41AM +0200, Jan Beulich wrote:
> >>>>>> On 02.04.2026 10:08, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>>>> The xl dmesg output (from MTL this time):
> >>>>>>>
> >>>>>>>     (XEN) [  123.477511] Entering ACPI S3 state.
> >>>>>>>     (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: =
0, cpu_has_apic: 1
> >>>>>>>     (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_usi=
ng_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> >>>>>
> >>>>>> Hmm, but what you didn't log is whether __hpet_setup_msi_irq() act=
ually
> >>>>>> succeeded everywhere. (And if it did, also logging HPET_Tn_ROUTE()=
 values
> >>>>>> might be a good idea, if only to double check.)
> >>>>>
> >>>>> Updated output:
> >>>>>
> >>>>>     (XEN) [18446743899.720395] _disable_pit_irq:2649: using_pit: 0,=
 cpu_has_apic: 1
> >>>>>     (XEN) [18446743899.720409] _disable_pit_irq:2659: cpuidle_using=
_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> >>>>>     (XEN) [18446743899.720420] _disable_pit_irq:2662: init: 0
> >>>>>     (XEN) [18446743899.720431] hpet_broadcast_resume:663: hpet_even=
ts: ffff83046bc1f080
> >>>>>     (XEN) [18446743899.720579] hpet_broadcast_resume:674: num_hpets=
_used: 8
> >>>>>     (XEN) [18446743899.720587] hpet_broadcast_resume:692: cfg: 0x1
> >>>>>     (XEN) [18446743899.720599] hpet_broadcast_resume:697: i:0, hpet=
_events[i].msi.irq: 122, hpet_events[i].flags: 0
> >>>>>     (XEN) [18446743899.720612] hpet_msi_write:283: iommu_intremap: =
2 (iommu_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x110
> >>>>>     (XEN) [18446743899.720638] hpet_msi_write:287: iommu_update_ire=
_from_msi rc: 0
> >>>>
> >>>> So it succeeds, and the low half of HPET_Tn_ROUTE also looks plausib=
le. The high
> >>>> half is, however, the address that the low half value is written to.=
 It's hard
> >>>> to imagine that it would be zero when the low half isn't, but it is =
about the
> >>>> last thing I can think of which could explain observed behavior. (Ye=
t then, all
> >>>> of this is pretty meaningless; see below.)
> >>>>
> >>>>> And the current debug diff attached.
> >>>>
> >>>> Hmm, you log HPET_Tn_ROUTE _before_ our update. That's not very usef=
ul. You want
> >>>> to move that part of logging to the bottom of hpet_msi_write(), or m=
aybe to
> >>>> where you also log the per-channel cfg value in hpet_broadcast_resum=
e() (thus
> >>>> making the logging overall less verbose).
> >>>
> >>> This test is with the updated patch (attached) + your extra
> >>> calculate_host_policy() call and "no-arat" on cmdline:
> >>
> >> And IOMMU faults still occurring as before, I expect.
> >>
> >> Sadly you now log the low halves of HPET_Tn_ROUTE twice, while you don=
't log
> >> the high halves at all.
> >=20
> > I was missing hpet_read32 there...
> >=20
> > Updated:
> > (XEN) [  116.921573] Entering ACPI S3 state.
> > (XEN) [18446743895.088893] _disable_pit_irq:2649: using_pit: 0, cpu_has=
_apic: 1
> > (XEN) [18446743895.088907] _disable_pit_irq:2659: cpuidle_using_deep_cs=
tate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> > (XEN) [18446743895.088918] _disable_pit_irq:2662: init: 0
> > (XEN) [18446743895.088928] hpet_broadcast_resume:662: hpet_events: ffff=
83046bc1f080
> > (XEN) [18446743895.089072] hpet_broadcast_resume:673: num_hpets_used: 8
> > (XEN) [18446743895.089081] hpet_broadcast_resume:691: cfg: 0x1
> > (XEN) [18446743895.089092] hpet_broadcast_resume:696: i:0, hpet_events[=
i].msi.irq: 122, hpet_events[i].flags: 0
> > (XEN) [18446743895.089122] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
> > (XEN) [18446743895.089132] hpet_broadcast_resume:700: i:0, __hpet_setup=
_msi_irq ret: 0
> > (XEN) [18446743895.089168] hpet_broadcast_resume:710: i:0, cfg: 0xc134,=
 hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROU=
TE(hpet_events[i].idx) + 4): 0xf18
>=20
> Okay, this would appear to clarify that the address really isn't correct.=
 Yet I'm
> confused now by the low half values: In your earlier log there was
>=20
> hpet_broadcast_resume:710: i:0, cfg: 0xc134, HPET_Tn_ROUTE(hpet_events[i]=
=2Eidx): 0x110

My earlier logging included literal HPET_Tn_ROUTE() macro output, not
hpet_read32() of it...

> and alike, i.e. clearly a non-zero value. Now all low halves are zero. I'=
ll try
> to figure how the logged values here could result, but consistent data (o=
r an
> explantation for the apparent inconsistency) would help.
>=20
> Jan
>=20
> > (XEN) [18446743895.089180] hpet_broadcast_resume:696: i:1, hpet_events[=
i].msi.irq: 123, hpet_events[i].flags: 0
> > (XEN) [18446743895.089203] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
> > (XEN) [18446743895.089213] hpet_broadcast_resume:700: i:1, __hpet_setup=
_msi_irq ret: 0
> > (XEN) [18446743895.089242] hpet_broadcast_resume:710: i:1, cfg: 0xc104,=
 hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROU=
TE(hpet_events[i].idx) + 4): 0xf38
> > (XEN) [18446743895.089254] hpet_broadcast_resume:696: i:2, hpet_events[=
i].msi.irq: 124, hpet_events[i].flags: 0
> > (XEN) [18446743895.089278] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
> > (XEN) [18446743895.089288] hpet_broadcast_resume:700: i:2, __hpet_setup=
_msi_irq ret: 0
> > (XEN) [18446743895.089316] hpet_broadcast_resume:710: i:2, cfg: 0xc104,=
 hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROU=
TE(hpet_events[i].idx) + 4): 0xf58
> > (XEN) [18446743895.089327] hpet_broadcast_resume:696: i:3, hpet_events[=
i].msi.irq: 125, hpet_events[i].flags: 0
> > (XEN) [18446743895.089350] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
> > (XEN) [18446743895.089361] hpet_broadcast_resume:700: i:3, __hpet_setup=
_msi_irq ret: 0
> > (XEN) [18446743895.089390] hpet_broadcast_resume:710: i:3, cfg: 0xc104,=
 hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROU=
TE(hpet_events[i].idx) + 4): 0xf78
> > (XEN) [18446743895.089401] hpet_broadcast_resume:696: i:4, hpet_events[=
i].msi.irq: 126, hpet_events[i].flags: 0
> > (XEN) [18446743895.089425] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
> > (XEN) [18446743895.089436] hpet_broadcast_resume:700: i:4, __hpet_setup=
_msi_irq ret: 0
> > (XEN) [18446743895.089465] hpet_broadcast_resume:710: i:4, cfg: 0xc104,=
 hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROU=
TE(hpet_events[i].idx) + 4): 0xf98
> > (XEN) [18446743895.089476] hpet_broadcast_resume:696: i:5, hpet_events[=
i].msi.irq: 127, hpet_events[i].flags: 0
> > (XEN) [18446743895.089499] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
> > (XEN) [18446743895.089509] hpet_broadcast_resume:700: i:5, __hpet_setup=
_msi_irq ret: 0
> > (XEN) [18446743895.089540] hpet_broadcast_resume:710: i:5, cfg: 0xc104,=
 hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROU=
TE(hpet_events[i].idx) + 4): 0xfb8
> > (XEN) [18446743895.089551] hpet_broadcast_resume:696: i:6, hpet_events[=
i].msi.irq: 128, hpet_events[i].flags: 0
> > (XEN) [18446743895.089574] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
> > (XEN) [18446743895.089584] hpet_broadcast_resume:700: i:6, __hpet_setup=
_msi_irq ret: 0
> > (XEN) [18446743895.089622] hpet_broadcast_resume:710: i:6, cfg: 0xc104,=
 hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROU=
TE(hpet_events[i].idx) + 4): 0xfd8
> > (XEN) [18446743895.089633] hpet_broadcast_resume:696: i:7, hpet_events[=
i].msi.irq: 129, hpet_events[i].flags: 0
> > (XEN) [18446743895.089655] hpet_msi_write:286: iommu_update_ire_from_ms=
i rc: 0
> > (XEN) [18446743895.089665] hpet_broadcast_resume:700: i:7, __hpet_setup=
_msi_irq ret: 0
> > (XEN) [18446743895.089702] hpet_broadcast_resume:710: i:7, cfg: 0xc104,=
 hpet_read32(HPET_Tn_ROUTE(hpet_events[i].idx)): 0, hpet_read32(HPET_Tn_ROU=
TE(hpet_events[i].idx) + 4): 0xff8
> >=20
> >=20
> >=20
> >=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--OHzTrA9J+n9/U7Mb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnU1i8ACgkQ24/THMrX
1yxryQf/RzYcIxmcNUqvxw9i8WJ4/+g66FzP7xLQLHpt577jA3wSTbEeb2wuEQ5H
Q+y2nDehCTiHOpUcHWbkqE7HK/BnSSgxGaEgoJhxRAo41YnKSh5kRnK/ShhXs3/K
P2uhIFXcfhSK51XGj+jbsfjdCpF9iaikhUJzB1/1+uSJEpVItNvdZb2zaqDmz4Pk
dpxgrToB7jzKsYTyIJM5eSBECE7FzyCupNGvK0RgQoHwKMI9GWBPp9a54jJiI8Wk
zF/cyY/LOg/fXIMYlAql0SSmVDkuitA/cD5vV/VHEXB/KwUG41FRZa95k2OuvXvT
d8AtuahE53dL/LaiSiwtYVQh2Dc/6Q==
=GM4u
-----END PGP SIGNATURE-----

--OHzTrA9J+n9/U7Mb--

