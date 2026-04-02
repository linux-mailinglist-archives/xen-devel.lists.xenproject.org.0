Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AZdMDM6zmmAmAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 11:43:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 348983871D0
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 11:43:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271412.1559579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8EZn-0002o3-Kh; Thu, 02 Apr 2026 09:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271412.1559579; Thu, 02 Apr 2026 09:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8EZn-0002mW-HG; Thu, 02 Apr 2026 09:42:59 +0000
Received: by outflank-mailman (input) for mailman id 1271412;
 Thu, 02 Apr 2026 09:42:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w8EZl-0002mQ-CO
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 09:42:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8EZk-004SXH-Kn
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 11:42:56 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce3a18-e002-0a2a0a5209dd-0a2a4509d698-20
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 11:42:56 +0200
Received: from [103.168.172.154] (helo=fhigh-a3-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce3a1f-bf79-0a2a45090019-67a8ac9acb89-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 11:42:56 +0200
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 2EF4514002A9;
 Thu,  2 Apr 2026 05:42:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Thu, 02 Apr 2026 05:42:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Apr 2026 05:42:54 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775122975;
	 x=1775209375; bh=8DISmlHTfzszmPnkDHG6TflZ1u3w587QEZOQbAgBg30=; b=
	EPKf+Oo//lp9G39e8mW7VzzopJHiOfrSrRtQZf1gXcdD9/8ADu3u3KMBidpK9rHi
	bqjljWm1cD6b96s6HfqU+sovQYZhjoalPnVmZZiTG6dZOoA2KxnkjnK+aW+pnBP9
	rBLjHo1bcWMszbnexFknKwdy1JY8Bn484xnPLC+E/Y/HOoPVuDu1ydP8zc0s7K5N
	0n0yNJ3Z7n2iHEiBGL4TgDiwDXDceJIhS5PB4aK1zpOmheZoXdx6EoQr3EneuWOT
	eN6WeqaKkR++bYKCLOkFyPnZDsMuozeIe4tcSeNu8zXQxsRRHR8kKPERzOWl4oVU
	QF9IZZu8yqVnRE2sBgRyzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775122975; x=1775209375; bh=8DISmlHTfzszmPnkDHG6TflZ1u3w587QEZO
	QbAgBg30=; b=VwMhdCqGOsyUJWgBxffbw/0rY4PWAL4JiJEyflejTG68aZyCi6w
	TnHHgTB8YjaILIthSIeZPzhpWMl9a0X0+DpaipjgwkctcPlRP4y5igt76w7X9pH2
	fu3ySfMvFzpCaa5u5EFNvlNouWx4JC0EYXLDzvi/NofGP1f5lw8Y3cn4Gg1qzOYo
	VZlQ04kBa8qye1kz+SghFZHphQL6RsQRYuKevfxQ2Hk9ipaJ2OrvAUpaGpPyKeE2
	O3Bfjuo8zKZm2kP0ekGoypure1j0trvfp5Iuru2AqLJJW2gAgR8cMKMwjsHh6QNr
	nnvxUra7xj3CGvm7vy/+zJte+qnHHI8lP5A==
X-ME-Sender: <xms:HjrOaWx_h4J2boiBSHyyBAAtrScX4hlsLSlaMsf9doLue2l1XhKqxQ>
    <xme:HjrOaYToT0gQVez-AzfuefVdBopUr03bEe8uruOl-XrLEImjHOHq9bgzPsct3g5ro
    OhK7AXzoKluNcqDE7JRB-KO6hoiS2XTMsWA3cC6hVcDbBP_iQ>
X-ME-Received: <xmr:HjrOaV-O5ZojqlvE2HzM3JG-KPhNf-QhAyrWCzUq-m90ppbfuzLkinBE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehieelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:HjrOaXpBFfseIJjvy0tgW3YPS7l8fd_AHKZM7p6vjUSOavlFblUXEg>
    <xmx:HjrOaan6HhOoyiiT3nsTz2tW7Bkyhin9BIuVZwfAZjyT48ErDFkrtw>
    <xmx:HjrOaWJ7yDg8298kPXxMPaFwiOVhK8K25prM-mFd4lxAit-2CBxU2w>
    <xmx:HjrOaXxHI-LbioiuFS7uojkh1yc0GehoZe1WZNouPRsiXNunW8GxqQ>
    <xmx:HzrOabH1xkMfz8YeDoM1m7c4W1zLDAM19nRNlcUvd6MnheG_VAKm1Bbn>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Apr 2026 11:42:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3
Message-ID: <ac46HK_KiUaLdK4N@mail-itl>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com>
 <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com>
 <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
 <97bfb299-a465-48a3-a036-f217de683c2c@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mx62jTLu5jLR+11M"
Content-Disposition: inline
In-Reply-To: <97bfb299-a465-48a3-a036-f217de683c2c@suse.com>
X-purgate-ID: tlsNG-bad1c0/1775122976-5475A152-DA4A2FFE/0/0
X-purgate-type: clean
X-purgate-size: 2580
X-Spamd-Result: default: False [-2.23 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:dkim,messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 348983871D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--mx62jTLu5jLR+11M
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Apr 2026 11:42:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3

On Thu, Apr 02, 2026 at 10:47:53AM +0200, Jan Beulich wrote:
> On 02.04.2026 10:39, Jan Beulich wrote:
> > On 02.04.2026 10:08, Marek Marczykowski-G=C3=B3recki wrote:
> >> The xl dmesg output (from MTL this time):
> >>
> >>     (XEN) [  123.477511] Entering ACPI S3 state.
> >>     (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: 0, cp=
u_has_apic: 1
> >>     (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_using_de=
ep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> >=20
> > XEN_ARAT being off is the one odd aspect here. That'll want tracking do=
wn
> > separately. As per xen-cpuid output (below) ARAT is available.
>=20
> For this you may want to also add logging to intel_init_arat(): Since opt=
_arat
> can be false only due to command line option use, it can only be the func=
tion
> not being called (which looks impossible on plain staging code), or cpu_h=
as_arat
> being false despite the xen-cpuid output that you supplied earlier (inexp=
licable
> as well, at least for now).

Hm, I got this:

    (XEN) [   11.403340] intel_init_arat:674: opt_arat: 1, cpu_has_arat: 0

so, cpu_has_arat=3D0 ...
next lines are those, to hint when it happened in the boot process:

    (XEN) [   11.409754] mwait-idle: MWAIT substates: 0x11112020
    (XEN) [   11.416130] mwait-idle: v0.4.1 model 0xaa
    (XEN) [   11.422396] mwait-idle: lapic_timer_reliable_states 0x2

Looks like calculate_host_policy() runs much later...


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--mx62jTLu5jLR+11M
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnOOhwACgkQ24/THMrX
1yxpOAf+M+z16dMhGpvaOF7lRARXqYIX2Ln+S+KJG2vz60SjG/NPwZGR/YB6QtOI
JxXNxyfyOT9FTOUOG2jqBRP+JMoSmwTkebm1Y/fCLDPggJQ8cLXTjSOlRpyYR1bf
ssIME+HAgBgy6fWxAAeGPQWA9vmW62QdJvyOf0KQtOQazpyM8tYcZjjMux0wJXMr
dEiq3VpbMI0wB0HfQQAUYLzYSV64VKQc1SEhFsLjKM5U3BJ5fsbKSfia2na/u4YS
UDe0TPXRS3uHLdcQPOmrwfiMrwrfG/WWsywLlCozAwCJb0ga8qJO6J7Jj4IvTwu/
5N/1Aq5P7TPuNQsAX13+0d3urQ49fQ==
=Wwtv
-----END PGP SIGNATURE-----

--mx62jTLu5jLR+11M--

