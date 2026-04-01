Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKkbAaGAzWlveQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 22:31:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA31380313
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 22:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270829.1559321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w82Ch-0001HD-5s; Wed, 01 Apr 2026 20:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270829.1559321; Wed, 01 Apr 2026 20:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w82Ch-0001FV-2q; Wed, 01 Apr 2026 20:30:19 +0000
Received: by outflank-mailman (input) for mailman id 1270829;
 Wed, 01 Apr 2026 20:30:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w82Cf-0001FP-1w
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 20:30:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w82Ce-00HAYp-0r
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 22:30:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cd803a-2eae-0a2a0a5409dd-0a2a4505a5c0-38
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 22:30:15 +0200
Received: from [103.168.172.144] (helo=fout-a1-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cd8056-3760-0a2a45050019-67a8ac90b11b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 22:30:14 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id A8D54EC0318;
 Wed,  1 Apr 2026 16:30:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Wed, 01 Apr 2026 16:30:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Apr 2026 16:30:11 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775075413;
	 x=1775161813; bh=nWIrDkp7CaQ3Q5G2Mr+Q2/ZNmaER6IFvS4Z0xZFI/Y8=; b=
	lJevZEExgMQDimSJOgBJ/5OBVrv+gi9ZxnZ08SbI6Yh4U1ovDmfYOBtjYqf/Qf1Q
	x2WLrKrHPVhhVBrogBrDe0pcf/FJAQJgxWsHJ2cyn/PqMp9eOvRZd6O6NHT3NtH1
	AlQazrFuoTaXm2dpRMkDyCowa8intQYl/DTS5ov+14R1JSs09cjHOwHSJjVCcGSt
	fw2ArMjszmwrT55nwl/scMHWmTJnloU8whlDebBLlQf0Pm9q8GcVa3b2r6pwS6eJ
	tqb0GasEYaDxWu657imVw2yx9Z3Do4OBHQsbN6LSc4004xcy34LfgAeRr6I8wToP
	vpjVupOBfLe/duMcO82Bug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775075413; x=1775161813; bh=nWIrDkp7CaQ3Q5G2Mr+Q2/ZNmaER6IFvS4Z
	0xZFI/Y8=; b=WyeaXZ4bQQ370X4spbtizGDiQZQYpia/+eagwf2BWcKgnWD8bs3
	vTQSXr/zDoi+xN3RH852B35FjV4gTMe5HzGkLzKz0KxFuhjIIwtVIsN3+Z0YJ2yY
	MntQeM00YjaCzEgGwlSIyXATZWljRoxiFvxWlR8YohOpeHGSl2VwGuqJT5Z3wI1v
	MQNDSSqNpKxEk7kO5/UGzaO3B7A4sRhuPWyqsKtYbENHzFs7NSZQhiEw8sPW8/yH
	6V13Zb9cr7G6abIPMZ2PsMFJAlTMoOVqJ7p1FHK7lSuYh1vPLaEyzxF0S0EIKwD5
	sQF6CptAJsxERnChMDt94fvaiACg8p/fyVQ==
X-ME-Sender: <xms:VIDNaZ5JolWTfstbp-XjELNImtPCvp1inq_BhG5HYBcdnLZ6s9DtwA>
    <xme:VIDNaeVDt9fLx60FKC5qijNcjuf-voqCFe1JieMmqgSZlxWaEHPol0W4QZqobkWMa
    Z8EYncx1qCTjf7EKHqVsh7C7zNyXJf_TvujxDQvOaff_FZt8A>
X-ME-Received: <xmr:VIDNad2uoeETD4K0B3PZQfOAcPSTgRoIwrNOruTuPnZE5XJG_aJs-OcOUhZ->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeujeetgeel
    leetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomhgrihhnpe
    hgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtoh
    hophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehl
    ihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:VIDNab2FeBcVsxAUoITxfBrMUFnWTZ83wbdXsqUDioJn-Ka_TlGsNw>
    <xmx:VIDNaQ87FuFfUFt8D88eANmY01QbAnAdGF19TOooahRlbxAgWuDKNg>
    <xmx:VIDNaY0g7E2XZrgEydb5KX0vuifQYOFPitWIFP_5QlFaR92UdTPtuQ>
    <xmx:VIDNad-TlwipAJklfuW22mlpDkmtnxQvY2VbI8VdTi53SNq0UTBE4w>
    <xmx:VYDNaRPi_7S3lk8l1i-7nugeunBirScC00u0JBZRkqG_4MtoK-o5pzdI>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 1 Apr 2026 22:30:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3
Message-ID: <ac2AUoNaEUDIJ-J8@mail-itl>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <913f75e3-0039-4a7e-9884-7564c329557f@citrix.com>
 <6020226f-5e38-42f5-923e-2692d17bc4e9@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q+ZQMjZQ5VOSBjNe"
Content-Disposition: inline
In-Reply-To: <6020226f-5e38-42f5-923e-2692d17bc4e9@suse.com>
X-purgate-ID: tlsNG-c201ff/1775075415-3252396F-5A6CF06A/0/0
X-purgate-type: clean
X-purgate-size: 13805
X-Spamd-Result: default: False [-2.23 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,suse.com:email];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
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
X-Rspamd-Queue-Id: 3EA31380313
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--Q+ZQMjZQ5VOSBjNe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 1 Apr 2026 22:30:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3

On Wed, Apr 01, 2026 at 10:11:12AM +0200, Jan Beulich wrote:
> On 01.04.2026 09:20, Andrew Cooper wrote:
> > On 01/04/2026 9:14 am, Jan Beulich wrote:
> >> On 27.03.2026 11:19, Marek Marczykowski-G=C3=B3recki wrote:
> >>> I noticed that on some systems, there are a lot of IOMMU faults after
> >>> S3. I can see it also on a laptop with MTL, but it affects also the A=
DL
> >>> gitlab runner:
> >>>
> >>>     https://gitlab.com/xen-project/hardware/xen/-/jobs/13661033722
> >>>     (XEN) [   37.201160] [VT-D]DMAR:[DMA Write] Request device [0000:=
00:1e.6] fault addr 0
> >>>     (XEN) [   37.201164] [VT-D]DMAR: reason 02 - Present bit in conte=
xt entry is clear
> >>>     (XEN) [   37.202332] [VT-D]DMAR:[DMA Write] Request device [0000:=
00:1e.6] fault addr 0
> >>>     (XEN) [   37.202339] [VT-D]DMAR: reason 02 - Present bit in conte=
xt entry is clear
> >>>
> >>> Interestingly, the 0000:00:1e.6 device is not even listed by lspci.
> >>>
> >>> The issue is present only on staging, not staging-4.21.
> >>>
> >>> Bisect says:
> >>>
> >>> 5ec93b2f19ff8873fca65d38c1164b0a56d3898b is the first bad commit
> >>> commit 5ec93b2f19ff8873fca65d38c1164b0a56d3898b
> >>> Author: Jan Beulich <jbeulich@suse.com>
> >>> Date:   Thu Jan 22 14:13:35 2026 +0100
> >>>
> >>>     x86/HPET: drop .set_affinity hook
> >> Looking into this, I find several things I can't quite understand (yet=
).
> >> First there is
> >>
> >> (XEN) [000000456c0fe39f] Disabling HPET for being unreliable
> >>
> >> which looks to only affect clocksource selection, but not use as
> >> broadcast source for CPU-idle management. (This may be an independent
> >> issue.)
> >>
> >> Then there is
> >>
> >> (XEN) [    2.760248] HPET: 8 timers usable for broadcast (8 total)
> >>
> >> which should only occur on ARAT-incapable systems. That should only be
> >> older hardware.
> >=20
> > I'm not sure that's a reasonable assertion to draw.=C2=A0 The number of=
 HPET
> > channels is down to the HPET alone, not anything to do with the CPU
> > capabilities.
>=20
> My statement was about the mere presence of that message, not the number
> of channels that are reported.
>=20
> >>  (On my much older Skylake I don't see this line, for
> >> example.) What does CPUID leaf 6 have on this system? Sadly xen-cpuid
> >> is purely featureset based, and hence doesn't expose info about that
> >> leaf.
> >=20
> > xen-cpuid -p
> >=20
> > That will get you leaf 6, but there's no human-readable decode of it.
>=20
> Raw numbers is good enough here. How did I miss that option when looking
> at --help output? Oh, simply because it isn't shown there.
>=20
> Marek, that'll be better than bare metal kernel data, as it gives us both
> raw and host policies.

Here is the output from ADL runner:

Xen reports there are maximum 120 leaves and 2 MSRs
Raw policy: 48 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx    =20
  00000000:ffffffff -> 00000020:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 00090672:00800800:77fafbff:bfebfbff
  00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
  00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
  00000004:00000001 -> fc004122:01c0003f:0000003f:00000000
  00000004:00000002 -> fc01c143:0240003f:000007ff:00000000
  00000004:00000003 -> fc1fc163:0240003f:00007fff:00000004
  00000005:ffffffff -> 00000040:00000040:00000003:10102020
  00000006:ffffffff -> 00df8ff7:00000002:00000409:00000003
  00000007:00000000 -> 00000002:239c27eb:98c027ac:fc1cc410
  00000007:00000001 -> 00400810:00000000:00000000:00040000
  00000007:00000002 -> 00000000:00000000:00000000:00000017
  0000000a:ffffffff -> 07300605:00000000:00000007:00008603
  0000000b:00000000 -> 00000001:00000002:00000100:00000000
  0000000b:00000001 -> 00000007:00000010:00000201:00000000
  0000000d:00000000 -> 00000207:00000000:00000a88:00000000
  0000000d:00000001 -> 0000000f:00000000:00019900:00000000
  0000000d:00000002 -> 00000100:00000240:00000000:00000000
  0000000d:00000008 -> 00000080:00000000:00000001:00000000
  0000000d:00000009 -> 00000008:00000a80:00000000:00000000
  0000000d:0000000b -> 00000010:00000000:00000001:00000000
  0000000d:0000000c -> 00000018:00000000:00000001:00000000
  0000000d:0000000f -> 00000328:00000000:00000001:00000000
  0000000d:00000010 -> 00000008:00000000:00000001:00000000
  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000121:2c100800
  80000002:ffffffff -> 68743231:6e654720:746e4920:52286c65
  80000003:ffffffff -> 6f432029:54286572:6920294d:32312d35
  80000004:ffffffff -> 4b303036:00000000:00000000:00000000
  80000006:ffffffff -> 00000000:00000000:05007040:00000000
  80000007:ffffffff -> 00000000:00000000:00000000:00000100
  80000008:ffffffff -> 0000302e:00000000:00000000:00000000
 MSRs:
  index    -> value          =20
  000000ce -> 0000000080000000
  0000010a -> 000000001488fd6b
Host policy: 41 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx    =20
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 00090672:00800800:77fafbff:bfebfbff
  00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
  00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
  00000004:00000001 -> fc004122:01c0003f:0000003f:00000000
  00000004:00000002 -> fc01c143:0240003f:000007ff:00000000
  00000004:00000003 -> fc1fc163:0240003f:00007fff:00000004
  00000005:ffffffff -> 00000040:00000040:00000003:10102020
  00000006:ffffffff -> 00df8ff7:00000002:00000409:00000003
  00000007:00000000 -> 00000002:239c27eb:984027ac:fc1cc410
  00000007:00000001 -> 00000810:00000000:00000000:00040000
  00000007:00000002 -> 00000000:00000000:00000000:00000017
  0000000b:00000000 -> 00000001:00000002:00000100:00000000
  0000000b:00000001 -> 00000007:00000010:00000201:00000000
  0000000d:00000000 -> 00000207:00000000:00000a88:00000000
  0000000d:00000001 -> 0000000f:00000000:00000000:00000000
  0000000d:00000002 -> 00000100:00000240:00000000:00000000
  0000000d:00000009 -> 00000008:00000a80:00000000:00000000
  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000121:2c100800
  80000002:ffffffff -> 68743231:6e654720:746e4920:52286c65
  80000003:ffffffff -> 6f432029:54286572:6920294d:32312d35
  80000004:ffffffff -> 4b303036:00000000:00000000:00000000
  80000006:ffffffff -> 00000000:00000000:05007040:00000000
  80000007:ffffffff -> 00000000:00000000:00000000:00000100
  80000008:ffffffff -> 0000302e:00000000:00000000:00000000
 MSRs:
  index    -> value          =20
  000000ce -> 0000000080000000
  0000010a -> 400000001488fd6b
PV Max policy: 58 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx    =20
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 00090672:00800800:f6f83203:1fc9cbf5
  00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
  00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
  00000004:00000001 -> fc004122:01c0003f:0000003f:00000000
  00000004:00000002 -> fc01c143:0240003f:000007ff:00000000
  00000004:00000003 -> fc1fc163:0240003f:00007fff:00000004
  00000007:00000000 -> 00000002:218c0329:18400700:ac004410
  00000007:00000001 -> 00000810:00000000:00000000:00000000
  00000007:00000002 -> 00000000:00000000:00000000:00000001
  0000000d:00000000 -> 00000007:00000000:00000340:00000000
  0000000d:00000001 -> 00000007:00000000:00000000:00000000
  0000000d:00000002 -> 00000100:00000240:00000000:00000000
  80000000:ffffffff -> 80000021:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000123:28100800
  80000002:ffffffff -> 68743231:6e654720:746e4920:52286c65
  80000003:ffffffff -> 6f432029:54286572:6920294d:32312d35
  80000004:ffffffff -> 4b303036:00000000:00000000:00000000
  80000006:ffffffff -> 00000000:00000000:05007040:00000000
  80000007:ffffffff -> 00000000:00000000:00000000:00000100
  80000008:ffffffff -> 0000302e:00001000:00000000:00000000
 MSRs:
  index    -> value          =20
  000000ce -> 0000000080000000
  0000010a -> 40000000140ae167
HVM Max policy: 65 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx    =20
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 00090672:00800800:f7fa3223:1fcbfbff
  00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
  00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
  00000004:00000001 -> fc004122:01c0003f:0000003f:00000000
  00000004:00000002 -> fc01c143:0240003f:000007ff:00000000
  00000004:00000003 -> fc1fc163:0240003f:00007fff:00000004
  00000007:00000000 -> 00000002:219c07ab:9840070c:bc004410
  00000007:00000001 -> 00000810:00000000:00000000:00000000
  00000007:00000002 -> 00000000:00000000:00000000:00000017
  0000000d:00000000 -> 00000207:00000000:00000a88:00000000
  0000000d:00000001 -> 0000000f:00000000:00000000:00000000
  0000000d:00000002 -> 00000100:00000240:00000000:00000000
  0000000d:00000009 -> 00000008:00000a80:00000000:00000000
  80000000:ffffffff -> 80000021:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000123:2c100800
  80000002:ffffffff -> 68743231:6e654720:746e4920:52286c65
  80000003:ffffffff -> 6f432029:54286572:6920294d:32312d35
  80000004:ffffffff -> 4b303036:00000000:00000000:00000000
  80000006:ffffffff -> 00000000:00000000:05007040:00000000
  80000007:ffffffff -> 00000000:00000000:00000000:00000100
  80000008:ffffffff -> 0000302e:00101000:00000000:00000000
 MSRs:
  index    -> value          =20
  000000ce -> 0000000080000000
  0000010a -> 40000000140ae167
PV Default policy: 33 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx    =20
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 00090672:00800800:f6d83203:1fc9cbf5
  00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
  00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
  00000004:00000001 -> fc004122:01c0003f:0000003f:00000000
  00000004:00000002 -> fc01c143:0240003f:000007ff:00000000
  00000004:00000003 -> fc1fc163:0240003f:00007fff:00000004
  00000007:00000000 -> 00000002:218c0329:00400700:ac004410
  00000007:00000001 -> 00000810:00000000:00000000:00000000
  00000007:00000002 -> 00000000:00000000:00000000:00000001
  0000000d:00000000 -> 00000007:00000000:00000340:00000000
  0000000d:00000001 -> 00000007:00000000:00000000:00000000
  0000000d:00000002 -> 00000100:00000240:00000000:00000000
  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000121:28100800
  80000002:ffffffff -> 68743231:6e654720:746e4920:52286c65
  80000003:ffffffff -> 6f432029:54286572:6920294d:32312d35
  80000004:ffffffff -> 4b303036:00000000:00000000:00000000
  80000006:ffffffff -> 00000000:00000000:05007040:00000000
  80000008:ffffffff -> 0000302e:00001000:00000000:00000000
 MSRs:
  index    -> value          =20
  000000ce -> 0000000080000000
  0000010a -> 400000001408e163
HVM Default policy: 40 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx    =20
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 00090672:00800800:f7fa3203:1fcbfbff
  00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
  00000004:00000000 -> fc004121:02c0003f:0000003f:00000000
  00000004:00000001 -> fc004122:01c0003f:0000003f:00000000
  00000004:00000002 -> fc01c143:0240003f:000007ff:00000000
  00000004:00000003 -> fc1fc163:0240003f:00007fff:00000004
  00000007:00000000 -> 00000002:219c07ab:8040070c:bc004410
  00000007:00000001 -> 00000810:00000000:00000000:00000000
  00000007:00000002 -> 00000000:00000000:00000000:00000017
  0000000d:00000000 -> 00000207:00000000:00000a88:00000000
  0000000d:00000001 -> 0000000f:00000000:00000000:00000000
  0000000d:00000002 -> 00000100:00000240:00000000:00000000
  0000000d:00000009 -> 00000008:00000a80:00000000:00000000
  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000121:2c100800
  80000002:ffffffff -> 68743231:6e654720:746e4920:52286c65
  80000003:ffffffff -> 6f432029:54286572:6920294d:32312d35
  80000004:ffffffff -> 4b303036:00000000:00000000:00000000
  80000006:ffffffff -> 00000000:00000000:05007040:00000000
  80000008:ffffffff -> 0000302e:00101000:00000000:00000000
 MSRs:
  index    -> value          =20
  000000ce -> 0000000080000000
  0000010a -> 400000001408e163


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Q+ZQMjZQ5VOSBjNe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnNgFIACgkQ24/THMrX
1yzIcwf/YF3i17KCsGAt5e7sC+ztxTW6zyo+LhMELsKV/ujAS6OGzleYfsBsw7lr
d5C//jAoMgBJhv4q4M99T2rOK06m6Y6hU9mfSNyxx8rw0q02+PpYURfLuKE+BbGI
cUI06lvqYQUrfeqY9cuODbDi8tG2EmL4zvucAjamu9PewRu9I8OuJddlZCaZHSSg
RcTpGe1Cr413Oiupu0rEbg3nvsU3yyYlitnpBtfG2gnRnQ/XQuanVu+Ny9qfmjOU
RwtrJIRYEXQ+v5Vh4MMTiDcOAOeihXY1rqYsNFExnwR9MLEGL+mDs0VCVgnfM2SM
KMi0lyXL42NO9dlDWYVzkkYjMmN4uw==
=dQVe
-----END PGP SIGNATURE-----

--Q+ZQMjZQ5VOSBjNe--

