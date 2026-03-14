Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMeFFvpttWlz0QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 14 Mar 2026 15:17:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B42C328D74C
	for <lists+xen-devel@lfdr.de>; Sat, 14 Mar 2026 15:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254817.1550351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1Pn0-0001CP-SO; Sat, 14 Mar 2026 14:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254817.1550351; Sat, 14 Mar 2026 14:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1Pn0-00019M-PI; Sat, 14 Mar 2026 14:16:26 +0000
Received: by outflank-mailman (input) for mailman id 1254817;
 Sat, 14 Mar 2026 14:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+adF=BO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1w1Pmz-00019G-9J
 for xen-devel@lists.xenproject.org; Sat, 14 Mar 2026 14:16:25 +0000
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6024af3f-1fb0-11f1-b164-2bf370ae4941;
 Sat, 14 Mar 2026 15:16:22 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 6F1397A00FB;
 Sat, 14 Mar 2026 10:16:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Sat, 14 Mar 2026 10:16:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Mar 2026 10:16:18 -0400 (EDT)
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
X-Inumbo-ID: 6024af3f-1fb0-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1773497780;
	 x=1773584180; bh=sf82I9ielwEQ0Cw5LxIK/iZzAvwMluuaFrzpBg1ujW8=; b=
	SIMgl6ZamTaJFLnMhsuKOaGKcJMfke20yvnUT/853q6cT1LYsowvoPrKNrhLiaix
	FJLEc0xBsSsRa1/LPTINDzr4nRaK5kX3tItkA4scP79n9X3U3GGi7e1q+oXT1Kq4
	Cjp5VhvjcmCXB9pgR+JtSiSDDn/oYz7TFV28+HRaqrxibxf3Cm3XaCV0QEt4s2BV
	ELkuslLt/gpYWrr3+kaf2t+92SrU/HKP7IFvYCgk2Zjcg4X5rGyboaSJRXIQpDXT
	nqKc2MIhvZiyC7UmwSKn2IX9AbFiBedamIxTDzN3Rk3fGJwErt25ZrkQVkQKYdo4
	g8OEOpU89xiuUs6vyU4cCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773497780; x=1773584180; bh=sf82I9ielwEQ0Cw5LxIK/iZzAvwMluuaFrz
	pBg1ujW8=; b=fpnPT6+FKWjtB2euxb+1DikzfGuq1CQ0TJu9zQlKwU+XEj0Nayf
	ESzqL2s1I4Fdc6O91qEMvA+seBJLEnKw7yx9xjF8Vyiqfab2JqiJP3t22QDZTjv1
	3o4BttjzK/HdnZSHfcxoO5MhboUk1m+lcOEzmMMzPEtpMqscFoIkXj3KxhfYGyIb
	DgdgiUUpNerl03pq9w/W7X8D0yRlXKwbT0gOkHx0tidmIWZAA/pQ+EEeGi2as+nU
	Z3BlTxXoNNSkcXYJvT6Ck3VjAi1xSU7U2IJQaG+w8+pc0XZZEOJYiJidBmodKabb
	PBNnzHuT+u5G8izleFGzjUWAzZHbQIzCbfg==
X-ME-Sender: <xms:s221aQBORmXAnBVn-EvHn5-Nlxi-Qcc8TGN_NTRN5slJQG-tiuGOpQ>
    <xme:s221aRkxbL_VHGGl89NeHfdY4KUb2BTDtYvWfuiNaVjkpeui7aPQGOygomGqVpoar
    p30nKTcjthYhXfqzTGYxuK5s_lHs5icv5wKSMYSSiVhERbD>
X-ME-Received: <xmr:s221aZwbxjk1HbsLXmsFpzQ1pmTk2DQ7N3ZUuRlwowE6nafWvL-gvDqAOs26bSThWmTT4Sqmz3nLOZRh-JthpHb-HyCU6pgm_gc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvledvjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepkedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhihgvrhhrhidrvghstggrnhguvges
    vhgrthgvshdrthgvtghhpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuh
    drohhrghdprhgtphhtthhopehpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdhrtghp
    thhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhrtg
    hpthhtohepmhhsthesrhgvughhrghtrdgtohhmpdhrtghpthhtohepvgguuhgrrhguohes
    hhgrsghkohhsthdrnhgvthdprhgtphhtthhopegrnhhthhhonhihseigvghnphhrohhjvg
    gtthdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhr
    ohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:s221aTQH4caK-AprXHR6iWk8O4weVQwfgBpBW6OiYekiVP68OgqUaw>
    <xmx:s221aZ9Xd76PM23kW1Z6hJgPahas9FYoirEtwoVfENzW-ZOlKwIrTg>
    <xmx:s221aZsm1dpfASGjSqKXAhyjd6lDREe4hzK-5vJDEsx1V7SR8K9TCw>
    <xmx:s221aZMCGDFK6MeIh4mTG6QYpdrg1a7mRc0vaH7c2QkNGXeLPy8fbg>
    <xmx:tG21aeU4IT2zjpz3VkMPduk5qbmR3Z5VZpXiURfBJF08MnsCCVoBKELo>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 14 Mar 2026 15:16:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/4] Xen: Add Q35 initial support for HVM guests
Message-ID: <abVtsK31t9tWgsaY@mail-itl>
References: <20260313164649.794591-1-thierry.escande@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="82oef0c++DDw9SXs"
Content-Disposition: inline
In-Reply-To: <20260313164649.794591-1-thierry.escande@vates.tech>
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:qemu-devel@nongnu.org,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:mst@redhat.com,m:eduardo@habkost.net,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B42C328D74C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--82oef0c++DDw9SXs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Mar 2026 15:16:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/4] Xen: Add Q35 initial support for HVM guests

On Fri, Mar 13, 2026 at 04:46:56PM +0000, Thierry Escande wrote:
> This patch series introduces Q35 chipset support for Xen HVM guests. This=
 is
> based on the work from Alexey Gerasimenko (See patchset [1] for reference=
).
>=20
> This series does not implement device passthrough as this will need more =
work
> on the Xen side to support multiple PCI buses. Since Q35 chipset does not
> support device hotplugging and with current Xen mechanism for device
> passthrough, they have to be plugged to a new PCIe root port, i.e. not th=
e PCI
> bus 0.

I always found it weird that Xen does hot-plugging of PCI passthrough
devices... Wouldn't it be easier to change this (connect them from the
very start, via QEMU cmdline) and declare hotplug as unsupported (at
least at this time)? I realize it's more complex change at the toolstack
side, but overall may simplify things and maybe even improve
reliability.

In any case, it's probably not worth blocking initial support on this.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--82oef0c++DDw9SXs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmm1bbAACgkQ24/THMrX
1ywG2Qf9HeEIoighs7imZKLP80u2BXOmsxS5olpQKk2WNfonDrnzngS/WalGuUoA
2/oVsk8aQFNGL5YXl7VKSLnwT4IZCstMtK+XhuqDVHoEdx+rUnrOoTzbNs55V9nT
LjQzPWgL02G6RwhZ2F5XK03S4jGNNI07Un1G2pFAQTM4uTobQAJb0mC67sxE8En+
GP73r7svgXwFGvZ1Gtm/50jPvyUUIzJ5MNaaT1p+OorQ9EKeSvj15C77ceEXEqxb
M5jGaoCde5GhtKz5SOj8UQaGqgSyXh4LcLEcLdfXmnTwtF08aIbMKdio9B0VOaO/
xvVBzhNeVJjp43BbOcazmDEk2dQU7Q==
=NocA
-----END PGP SIGNATURE-----

--82oef0c++DDw9SXs--

