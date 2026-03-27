Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NpdE6tZxmlgJAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:19:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB9D342616
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:19:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265330.1556314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w64HX-0005Mj-Q1; Fri, 27 Mar 2026 10:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265330.1556314; Fri, 27 Mar 2026 10:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w64HX-0005Ko-Mh; Fri, 27 Mar 2026 10:19:11 +0000
Received: by outflank-mailman (input) for mailman id 1265330;
 Fri, 27 Mar 2026 10:19:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w64HV-0005Ke-Ov
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 10:19:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w64HU-006BHL-Q1
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 11:19:09 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c65996-2eae-0a2a0a5409dd-0a2a4504b988-26
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:19:08 +0100
Received: from [202.12.124.147] (helo=fout-b4-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c6599b-c823-0a2a45040019-ca0c7c93a529-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:19:08 +0100
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 968781D00071;
 Fri, 27 Mar 2026 06:19:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Fri, 27 Mar 2026 06:19:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Mar 2026 06:19:05 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1774606746; x=1774693146; bh=T9
	PMY9DFdJXlLu5egrUOc86EVZd3HqqVfAflpl48KNk=; b=feF7A+aIZjtTc9UhQl
	Oh68hIOy69XaJFb/Oy74EySbnn17JqIIktOi6vGR5ZEOdkidbfYfEdNaik3J+xts
	ISweGonz6+x/bGZtj2SEx826/5mmrJuZLEXl0nQTynbp6hnIgsbdxaFRaT2GeNR2
	520kX1Uo6RkEhWFmKdi/1G591SCjPbb6ynY4UWEdfd3Ql3dB4PQuy7FdCB9kgNa3
	vPPLbYQ2FHNLGtPe3zi/uZ8CLuKPmvkl7sG4D584Dy2rESOmUy9FP+wFM+un1uwk
	Hfd/AWUpBi5OTgKxX12p3TrE1Fwi0BIl+zvY27at4TahB7DUdaB6sX93a9ajzM16
	pm3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774606746; x=
	1774693146; bh=T9PMY9DFdJXlLu5egrUOc86EVZd3HqqVfAflpl48KNk=; b=S
	BPV9v7CiS4jwqPvjiXIU1KjoqYJtRWteOWdKsWau4e5mDeaJYnyoUgUIvgO2mVoa
	B3j9EtB2+izFj0yky2hGy5swZZJYk9QgSu5LVc0ovbKqXT5i3K0RexXf+DpGmgjR
	yRJv+j9UU8t1akFQS+syEc4H69nRd6TOgDTv5TeulghXNnKXiLf38IUD+KrACNUN
	7ppPukjD7k6/2fNxk7rSPkO59YDmwe5gx3O+JhhglBmgh2AM2mnPb9jVllv7snCV
	r9Z+XZEfbGG6CE6tppBM9QWXcVTJFc2HDIH14cYAm+YmQIL/QZMpbWNh8ZzL4YP0
	pup55Q8S1HRMNjLMMSHMw==
X-ME-Sender: <xms:mlnGaVYLUxmSieAcYwil4dbH8o5jjvrLrX-8_fSH-2evRe2ePqanfQ>
    <xme:mlnGaSa3ZkQ_SdzOBMiy8v6LRFoQ6Ws0Gd_K-YFWVNQz0frmKrmPDnMAzC_SV_oye
    ecznRCl7BmZyhIDsW6tRztWHsjBE58q1jEN7eiGHuJY3HhRIA>
X-ME-Received: <xmr:mlnGaVkVmWem-OT4OuZuhIMp83dj1U-nmnY39W_qOn4l4NuPTcGd3CqFV-YSb7D6J1UB5GZIG9E8zSIwtEb5RzxNKFyFR1dHoOc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedttddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdelvedtfedt
    jeegtedvieduveejteehiefgfefhfeeuvdfhudffgfekjedtfeetnecuffhomhgrihhnpe
    hgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    peigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtph
    htthhopehjsggvuhhlihgthhesshhushgvrdgtohhm
X-ME-Proxy: <xmx:mlnGaexVQqm9qN6W_vnirsGGaIdeLmT7_VnVrzkXrK-0d6BOxNUQDw>
    <xmx:mlnGaTMbx3EGzdr19IauL9HoJFqNHz1kjbh6fr5n7Y_6Ms58ni3Eeg>
    <xmx:mlnGaSRS0j4iHI5E1Ed8LqqNKcekTyLBRLL6PhwKnsA8YW6QGdqmCQ>
    <xmx:mlnGaRYEHoKpy4m_ubHGuGPx6YQx02KlNNkJxl7vWnfKdhvnsgwY8Q>
    <xmx:mlnGaVtz2jUSHsahyL92IqJwUZXKq8kKmT7NTbAuA40iaQQnsYFz6h7N>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 27 Mar 2026 11:19:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Subject: IOMMU faults after S3
Message-ID: <acZZmGXIJlmN3KGm@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jyaOBGeUZIKSV3mQ"
Content-Disposition: inline
X-purgate-ID: tlsNG-ebf023/1774606748-B8A8E9D1-38D921FA/0/0
X-purgate-type: clean
X-purgate-size: 3021
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,gitlab.com:url,citrix.com:email,invisiblethingslab.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 7CB9D342616
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--jyaOBGeUZIKSV3mQ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Mar 2026 11:19:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Subject: IOMMU faults after S3

Hi,

I noticed that on some systems, there are a lot of IOMMU faults after
S3. I can see it also on a laptop with MTL, but it affects also the ADL
gitlab runner:

    https://gitlab.com/xen-project/hardware/xen/-/jobs/13661033722
    (XEN) [   37.201160] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.=
6] fault addr 0
    (XEN) [   37.201164] [VT-D]DMAR: reason 02 - Present bit in context ent=
ry is clear
    (XEN) [   37.202332] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.=
6] fault addr 0
    (XEN) [   37.202339] [VT-D]DMAR: reason 02 - Present bit in context ent=
ry is clear

Interestingly, the 0000:00:1e.6 device is not even listed by lspci.

The issue is present only on staging, not staging-4.21.

Bisect says:

5ec93b2f19ff8873fca65d38c1164b0a56d3898b is the first bad commit
commit 5ec93b2f19ff8873fca65d38c1164b0a56d3898b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Jan 22 14:13:35 2026 +0100

    x86/HPET: drop .set_affinity hook
   =20
    No IRQ balancing is supposed to be happening on the broadcast IRQs. The
    only entity responsible for fiddling with the CPU affinities is
    set_channel_irq_affinity(). They shouldn't even be fiddled with when
    offlining a CPU: A CPU going down can't at the same time be idle. Some
    properties (->arch.cpu_mask in particular) may transiently reference an
    offline CPU, but that'll be adjusted as soon as a channel goes into act=
ive
    use again.
   =20
    Along with adjusting fixup_irqs() (in a more general way, i.e. covering=
 all
    vectors which are marked in use globally), also adjust section placemen=
t of
    used_vectors.
   =20
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

 xen/arch/x86/hpet.c | 17 -----------------
 xen/arch/x86/irq.c  | 12 ++++++++----
 2 files changed, 8 insertions(+), 21 deletions(-)


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--jyaOBGeUZIKSV3mQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnGWZgACgkQ24/THMrX
1yxPjggAlPAFrHJ3jn1JcEeCvilGgls72KrF6WHOREZbKKPWqB00Meiv16+T1FYp
BLDPL0mzb5MqUj4JxJMAs8Urw01629MTCrU0xPyRKnT3YeMVKDzhg+OJzLCwX+ra
pOIcnJ826uu2UTq1MG41thQoqadOiq71opndqOlPnN5cva4RQsaWnPa++tAU+2bi
MYvHMBPeMoPOGILlrGloTbZLhA+VlKCS0VxUbijKa6+w4GNg8/mSfhIT1P7PeF/7
lfNjDAfRAokfn71Xnr1srWjCDzRRnlkwJxYemiaediaygZ9VOphXX/sfu2KmtfUe
o5n/NaS4Ykd4kDxsZiHdFV3c01OsIA==
=MTO3
-----END PGP SIGNATURE-----

--jyaOBGeUZIKSV3mQ--

