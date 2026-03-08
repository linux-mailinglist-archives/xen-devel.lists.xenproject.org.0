Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCAvGnbArWkH7AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 08 Mar 2026 19:31:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5A3231A9E
	for <lists+xen-devel@lfdr.de>; Sun, 08 Mar 2026 19:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1248956.1546523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzIte-00036I-TB; Sun, 08 Mar 2026 18:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1248956.1546523; Sun, 08 Mar 2026 18:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzIte-00034X-Pc; Sun, 08 Mar 2026 18:30:34 +0000
Received: by outflank-mailman (input) for mailman id 1248956;
 Sun, 08 Mar 2026 18:30:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdMp=BI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vzItd-0002ns-DX
 for xen-devel@lists.xenproject.org; Sun, 08 Mar 2026 18:30:33 +0000
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e34a7839-1b1c-11f1-9ccf-f158ae23cfc8;
 Sun, 08 Mar 2026 19:30:31 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 04AC3140019B;
 Sun,  8 Mar 2026 14:30:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Sun, 08 Mar 2026 14:30:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Mar 2026 14:30:29 -0400 (EDT)
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
X-Inumbo-ID: e34a7839-1b1c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1772994631;
	 x=1773081031; bh=Ql0SMQHbTcL8lEgyG/ZwsaaPZIthzAzl0CqRJ9zqEow=; b=
	Urpj1lGHG7UW+0e6EMwmjQEOLqu5uzIa1Wi6ba8qweFnjBm4tZrxHiAy9y8BJstr
	JVfZpMeHeJMvbO74WK4SLk3BuaEexIIEZwX+//hEMxTkaW1bV9CMnk8NrxJiJoeX
	/rFmFxslnbLchLJLahBmc7SwppILHzTbGxbtnk3+EmCds5Bp9wyDQsltvxRXR5fl
	6il+0VPdvH2nLPlMYJkR0shn80G9KPQoHJ/3wx80TBFqwKMt3ciR7m4aDE8vAWV3
	nUjRNorJWHMVCyvApn0IduF6iwHfE+IX2PJa3WUZ0BSMOkRcFZrqHxFlbRqLPGXj
	WAOIrCaUd+RgSMip2Ox6OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772994631; x=1773081031; bh=Ql0SMQHbTcL8lEgyG/ZwsaaPZIthzAzl0Cq
	RJ9zqEow=; b=rN/wb7gOwxDbpBNNImms/fEhURDtqrgNGwKbeCM5B4HLL5oJaoP
	A7squK8a+Zcp2QKzzzRmW6BM4qgEjIawZ0F4pUiW8zql8GKj3kLxtrQlJWYqQnZ0
	DauWG4wGShofMs19gKIjJvEcUJBFuwkkV98TE5fLtyoMLkgR3cFjr7ahMNvTL95C
	t0tQVbZyrZHn9c3vIziDCzw77bRa6NUhsO7OUlZA9ecUNsBJ8u9ZP6W/mVZKrEPV
	08H5jdTPpJUIS3XHttBLipK45eBtmEp6+VXJOtClMot62GpCUgr8d6NASd7GIlUd
	xhNt+n8LHvMSYCM6BaHGMM4kPmfI7JbwypA==
X-ME-Sender: <xms:RsCtadDEXfIybdA1gm0USIfPafEylq8OHbTHNUG_s49wMXXD794rig>
    <xme:RsCtadywTT9uT9q1R329fp4j8YAi1Zp5MfHBLAKOT7Mmqg-yCADYhPhBXuTa2xyjZ
    SlAa8AeDARfjN7VI5wVeF4FHk6yUhra_OzaA-Ly6pIhILKMi_U>
X-ME-Received: <xmr:RsCtaa3RDX8dsdtM5Rkk8mVy_cQKmROQJ5L5x9xcyJUiZH6CwPrNP-x-OIHM-omvwlfkIRuU0aH7areqPuVkfmtb-fYy4IcxYXM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeehleduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepshhouhhmhigrjhihohhtihhsrghrkhgr
    rhdvfeesghhmrghilhdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsth
    hsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehsrghrkhgrrhhsohhumhih
    rghjhihothhivdefsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhse
    hsuhhsvgdrtghomhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhu
    thhiohhnshdrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtg
    homhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:RsCtadwib2OHeyBSwin7UBmgTCCO5PHRbdA-Bu5Q2tsbx54IYNN5aA>
    <xmx:RsCtaRFUKGITvkYnJG-f9Uf74zilk6103qIBKsdNaWf2cF-9FIy-ZA>
    <xmx:RsCtaQZxrJZN9GFzpRJCsUTwVxiF2ZVA9wXoJVRa5lrdmBQLoACYXA>
    <xmx:RsCtaTDfWe7Vdnsu1l0ULechysZpXuSvN7AZJpOUH24wdAhFMJgl_A>
    <xmx:R8Ctaa9gA-0x7hWDyrtSb7ZTM4NznMlho1iXxZavViQ_pAfZTnPeZhDW>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 8 Mar 2026 19:30:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/acpi: Remove BGRT invalidation code
Message-ID: <aa3AQ_LBdKLIBWpe@mail-itl>
References: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
 <20260305191810.31033-3-soumyajyotisarkar23@gmail.com>
 <aaoznRwdCKzRvKlD@mail-itl>
 <CAGkZZ+tjOGskPuSipkkOBjussxy5h_fDhNOMt-6Q9cqWJQi4kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VoPcmMM3v+387hzR"
Content-Disposition: inline
In-Reply-To: <CAGkZZ+tjOGskPuSipkkOBjussxy5h_fDhNOMt-6Q9cqWJQi4kw@mail.gmail.com>
X-Rspamd-Queue-Id: 7D5A3231A9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,suse.com,apertussolutions.com,citrix.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:dkim,invisiblethingslab.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action


--VoPcmMM3v+387hzR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 8 Mar 2026 19:30:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/acpi: Remove BGRT invalidation code

On Fri, Mar 06, 2026 at 08:59:07AM +0530, Soumyajyotii Ssarkar wrote:
> On Fri, Mar 6, 2026 at 7:23=E2=80=AFAM Marek Marczykowski-G=C3=B3recki <
> marmarek@invisiblethingslab.com> wrote:
>=20
> > On Fri, Mar 06, 2026 at 12:48:09AM +0530, Soumyajyotii Ssarkar wrote:
> > > Now that BGRT images are preserved during EFI boot (via
> > > EfiACPIReclaimMemory allocation), the invalidation code in
> > > acpi_parse_bgrt() is no longer needed. The BGRT table remains
> > > valid throughout boot.
> > >
> > > This removes the code that was marking BGRT invalid when the
> > > image memory was detected as unavailable, which was causing
> > > ACPI warnings in Linux dom0.
> >
> > When preserving failed for any reason, or when it was disabled (the next
> > patch), the entry still should be invalidated. In fact, the check here
> > for RAM_TYPE_CONVENTIONAL may already disable invalidation when it got
> > preserved?
> >
> > --
> > Best Regards,
> > Marek Marczykowski-G=C3=B3recki
> > Invisible Things Lab
> >
>=20
>=20
> I could move forward with dropping the [PATCH 2/3]. And adapt the other
> patches accordingly.
> This would serve as a safety net in case the preservation fails for any
> reason. Would that be a valid approach?

Yes, exactly.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--VoPcmMM3v+387hzR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmtwEMACgkQ24/THMrX
1yy8awf/XZnVSr1EAEjYnyG1v80/QTOhm0gyM9rIXthCYq/0DaX7a6+U0RaT40Iu
NT7YW406bhdVHpBj8FAr8/ZpW//e3Gm3u+GqtJOZS8tk6hfpXE8HkXpCEdNdAyYD
RPfPReAnXCdYWRACAo2mgKL0E1nHe4yF5gKzN3xfsdqU0iHlqUx9TNI6jfKxthqi
KAk3CHafxluqaUdEXvrve8DcznxHTvv53enh9wbuLfU6Q1yFHcy38nicyW/pRl3p
n+cJvtQl2Lb8agx+lVCHZcuFjMp0IXKHKByfM3qdzaQ0ZSRz7aRIDdMIhfCQcDV7
S784pDA9ztdOZVJa4kuscK0+/q9Vog==
=bYJ+
-----END PGP SIGNATURE-----

--VoPcmMM3v+387hzR--

