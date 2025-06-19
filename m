Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B23CAE08E5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 16:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020182.1396574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSGNn-0000ub-Mh; Thu, 19 Jun 2025 14:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020182.1396574; Thu, 19 Jun 2025 14:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSGNn-0000s0-JO; Thu, 19 Jun 2025 14:36:51 +0000
Received: by outflank-mailman (input) for mailman id 1020182;
 Thu, 19 Jun 2025 14:36:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NVDA=ZC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uSGNl-0000rt-Tz
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 14:36:50 +0000
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d354e484-4d1a-11f0-a30c-13f23c93f187;
 Thu, 19 Jun 2025 16:36:46 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 418E01380628;
 Thu, 19 Jun 2025 10:36:45 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 19 Jun 2025 10:36:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 10:36:41 -0400 (EDT)
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
X-Inumbo-ID: d354e484-4d1a-11f0-a30c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750343805;
	 x=1750430205; bh=k4gc9Vfj9Tzpn+1TC/f+oKYAqWwRav+WpCaPjYpmFhM=; b=
	dsrDCnuAh7E8B5RAGlWxmv6+2EFTSXkYRoMMQo/+8feHXzHY5A8wHEU+ppeQ6f3/
	pWMMR9K2GQAawZBOA+MJweZ7QqPDHRSeA3XqO8+Tkei5iyhnh2mNoM+KI9mCSebE
	6e1OmykDuSfE32M2wg4jXxTOZ+G9SH9ZiT/HRtrJPKXAFAAnNjqxMx/cD8K2Moge
	1OhQUaVxkqIXmQ5yTMQsHzN2u0IDrB2OoNY1kDbB9KvjyFcW1T6q7nWOtZ7JjemD
	Tw35YCNnBMfAo3v1kiXBZe4J6c2Zf8lEhXYKpCgI+wHc//uTKwXkYCsPf6SjqVXL
	qKcXzwrfPzPf1H5DQs6h0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750343805; x=1750430205; bh=k4gc9Vfj9Tzpn+1TC/f+oKYAqWwRav+WpCa
	PjYpmFhM=; b=d4VE4quk4WF1EBuKJBCsjETBkp8M4Cc7B2POqPboARt/YZLsuwr
	3fVIXalvwzQx4IUq0maCvvP3YdcITS2URhqWNpNQhINuS94Km7OgG2hgtU+F7i7K
	Kk7x3gAPuSlIMizVC4UV973NMU1qcRJi+AwvdoMh9T+urQZaLMTmu7jHTo3hl2g5
	SI1Gj6mjbXM090MlbvTbt/NWgLOUExN6v9kLVibvErO1lERmzUayzAgeN5jI19sj
	SNHejkHDGkv8Q3Udf1LeKTagBJt38/W0B0RK6M64ulO6I15Z6Zixrdes6RJWCL0u
	ooDZAPaVqPHzQkByDioK/AWnNju2acBiIZw==
X-ME-Sender: <xms:fCBUaPoBpVuox2i63OhmMv9KO_DJ-MLW3Q9k-46H3ZMAuhfIwsqwJA>
    <xme:fCBUaJqPdisbg92CEXyJKxpaUk9zpYQj_r78YqdPSsQzc8yEqAvjohBxZtfVY_rDh
    zevk2knrbKGYA>
X-ME-Received: <xmr:fCBUaMPY1-u55hugpe70ISkBcFec2_QY9CG2a6wSTj2b8D5VaWQ_YkvZLCPIcClQkGPtQu3czA_EF9PuNhNEuAbeUuymh6u02Eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleetfeev
    hfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepudehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehrohhsshdrlhgrghgvrhifrghllhestghl
    ohhuugdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrih
    igrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhho
    jhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvg
    hsrdhtvggthhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdp
    rhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepjhhulh
    hivghnseigvghnrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihig
    rdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:fCBUaC7pTYrlnDmciTN7qgaEqf2lcd20qukufyCEEFeSLbHppqYpVA>
    <xmx:fCBUaO5gV_lNY_rFsaYfFL1pnXso9p4GROe8y7QiH1w-t_HQ2hGjCg>
    <xmx:fCBUaKi1mOs8Hw-nYZHPXfBlZaqniwJjjJcrdQxTl3-eSg0VF8B1Lg>
    <xmx:fCBUaA7atxzH6DEhaDvDlyElZHzfRAHCbrcyKtQ19Mu8s9JiJUc3yg>
    <xmx:fSBUaGXM4rhXw8p90gVRehw_Xsg38pYasgynx5zkvihhgloWxizPc0w5>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 19 Jun 2025 16:36:39 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ross Lagerwall <ross.lagerwall@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, security@xen.org,
	Juergen Gross <jgross@suse.com>, Trammell Hudson <hudson@trmm.net>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
Message-ID: <aFQgd1uSWlAcgFrr@mail-itl>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
 <CAG7k0Eo3yzpUJjO-371j_h6NGrHFky9a6Sr4NWfMHfarTzpR=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z34HVkQTE1rMju7v"
Content-Disposition: inline
In-Reply-To: <CAG7k0Eo3yzpUJjO-371j_h6NGrHFky9a6Sr4NWfMHfarTzpR=A@mail.gmail.com>


--Z34HVkQTE1rMju7v
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Jun 2025 16:36:39 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ross Lagerwall <ross.lagerwall@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, security@xen.org,
	Juergen Gross <jgross@suse.com>, Trammell Hudson <hudson@trmm.net>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy

On Thu, Jun 19, 2025 at 03:16:51PM +0100, Ross Lagerwall wrote:
> I think a section on PCI passthrough is also warranted. i.e. preventing m=
isuse
> of a device to exploit Secure Boot.

While I agree it makes sense, I wonder if it's in scope for UEFI
Secure Boot as defined by Microsoft? It may have implication for example
on PCI passthrough to a PV domains.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Z34HVkQTE1rMju7v
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhUIHcACgkQ24/THMrX
1yxBsggAl8f+YFmRk2e182AuP5LXtPSkMTv5tY6zV3FHNpNg5+4jsLhe5z1FjsE8
Cd8SC1GvHz+rCclKEFgqZ4+rN9nvkifr0B1aIET60skWiwPyKcEon/i62MpU8sgz
rp7gHffaANwTXxdwL6kopUnAxmyormW++jtq3qY2Mav0WJDOK3QcqIEU63d4qgM/
DcxarNCrcZzyIBIJH2mUfNZNb1VShmqbDRheTGHP4dtv7JnhKgm6HiHsc5V8GN6s
TMhIy0XgGdfFwRrpVQ5IHPk9YFuBz8gfBZz9rk9wrXBqpgWL3VKMT0MRF6gbFGJy
q0rfr2uh5hG+WaJ4MlY02YoxP9oNSw==
=0S5N
-----END PGP SIGNATURE-----

--Z34HVkQTE1rMju7v--

