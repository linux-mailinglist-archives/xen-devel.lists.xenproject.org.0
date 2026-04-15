Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPQbIDOE32nSUgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 14:27:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75B74043C5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 14:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282398.1564997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCzKt-0006Ts-NB; Wed, 15 Apr 2026 12:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282398.1564997; Wed, 15 Apr 2026 12:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCzKt-0006SA-JP; Wed, 15 Apr 2026 12:27:15 +0000
Received: by outflank-mailman (input) for mailman id 1282398;
 Wed, 15 Apr 2026 12:27:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wCzKr-0006RJ-SF
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 12:27:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCzKr-00EsDN-75
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 14:27:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69df8420-5cb7-0a2a0a5109dd-0a2a4503826c-2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 14:27:13 +0200
Received: from [202.12.124.153] (helo=fhigh-b2-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69df841f-02b3-0a2a45030019-ca0c7c99e261-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 14:27:12 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 249A97A006B;
 Wed, 15 Apr 2026 08:27:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Wed, 15 Apr 2026 08:27:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Apr 2026 08:27:09 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1776256030;
	 x=1776342430; bh=u4LpjOvbZZvmCOfTYYUNqZJH+ixHXPnxjsDtmD4fLR8=; b=
	ojQaCzlvuZswXoQ06tPAQXAeDkTPdOlA6ZIEkTf8lipVN9E0JA5wmhTuRaR/GgKM
	wq3SaKR66PHFffv7/NNVY69ZKzWDMfr38h2jJqIbG9kpetDlB25fsMAEZ5RufaoO
	a/8hPI5RwsmKKTA5SFdOnKqu8yqA07Nu1vhxhqkpa4PBO3XTl6qihnnlfqRt5l3W
	WzVlhNFDl+jlaDgJ4aRcgfIdRyAzpfx/2/CuC38aQdjWuIUvgoVpdLiU6+C8lse5
	/dZtgOnOvhEqH8xH3V/CtgyqCYJvGza0MMwOFi4lFWWPC2iVJNaNk2CIeveaeu19
	VfnhQNvLoM6L0V0MYwjBVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776256030; x=1776342430; bh=u4LpjOvbZZvmCOfTYYUNqZJH+ixHXPnxjsD
	tmD4fLR8=; b=ai5Y2WVi17+eP4GqVTYxgjeE/P92c8wvXb1NkcF7h+0czzpfia+
	RZPoQ+JddQEZ9sx07uX0kYFcZIY4EbqZXbUPwUeEmcxHZI73+ez986F/A4B+6oBB
	kSBtXuaip7GR3ImDy5onAq4yl0EeXhzTYugivyoJqyj5SEi9j5zfZVz39FHOo4Zj
	wLwqefxHL4VRRdfOOcy5bruwCkRQTenkXoPd6KdfIUFNXlKW6fI8Pb/EWLzkgSrU
	TN47LgIGfBsh2w4SjmbrGM4Ivp6sa0+at0tgiasnu4ZsVuzfheFQcfePdKPKSuo7
	8V2DchvYnlLHGJ1IJBxGzfDoRdEURva/NFA==
X-ME-Sender: <xms:HoTfaU-VXKLN0zITelhypru3FbvcBYLwIDZ4jtj0NfOvacW55pqLLQ>
    <xme:HoTfaTlzkZFCZLBVETyx8-jSMJcicBFJrMdzCnnp8cGTvMEmHz4ubzVfSYcaVm6uX
    3tplvTllKBTznhf6tm7EUQUtTztAhDKPODoBMNb6nmQITbdJg>
X-ME-Received: <xmr:HoTfaSXYEfIe5kwsgbq-Gng9O-JW11Es944ZfSgFO3Jpu-pj4V16htNP5NV7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeggedtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgr
    thgvshdrthgvtghhpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:HoTfaQFwh_dHZaPUdOveP7GpCRoAmYGjWbhYON-2ecS-h8ZzhqD2Gg>
    <xmx:HoTfaWdTTWfkIPx65nnb3R2ogiLaQtBeJWXu-FEftmA791HlrtYn2g>
    <xmx:HoTfaZJmy60DwBuSEmtfRcDxPXlqLgVSOftfuEMN3u_phAqxpkMn9w>
    <xmx:HoTfaTEgkz7fRjaYdKzSfUh9ABmeOwq38Me5uPB4m95C9aGJOV9BMA>
    <xmx:HoTfacPaP06cGxvHoSSVloWEKdkCaVQvGBAyhFWWlLT3f1yctH4rvcW2>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 15 Apr 2026 14:27:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v3 04/13] Add linux-6.12.79-x86_64
Message-ID: <ad-EG63q_TnaJEtg@mail-itl>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
 <b53df707293f8907f5bb28a6d7380c28236b2637.1774999132.git-series.marmarek@invisiblethingslab.com>
 <ad99BL-v7fOAdqH8@l14>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iJT/IRkUW/TDFo7l"
Content-Disposition: inline
In-Reply-To: <ad99BL-v7fOAdqH8@l14>
X-purgate-ID: tlsNG-33051d/1776256033-C9F3DC9A-3F6303B4/0/0
X-purgate-type: clean
X-purgate-size: 1770
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: D75B74043C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--iJT/IRkUW/TDFo7l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Apr 2026 14:27:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v3 04/13] Add linux-6.12.79-x86_64

On Wed, Apr 15, 2026 at 11:56:53AM +0000, Anthony PERARD wrote:
> On Wed, Apr 01, 2026 at 01:21:54AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > +linux-6.12.60-x86_64:
> > +  extends: .x86_64-artifacts
> > +  script: ./scripts/build-linux.sh "6.12.60"
>=20
> I've got:
>     $ ./scripts/build-linux.sh "6.12.60"
>     LINUX_VERSION must be set
>=20
> Linux version want's to be in a env variable, not an argument.

Oh, that's patch ordering, after 07/13 it's in argument.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--iJT/IRkUW/TDFo7l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnfhBsACgkQ24/THMrX
1yxNBggAhN+2TOjqGxS0TnA50h0e8lluW0NoRmeoNP4Uo3veszjA1kJ6f2d4zeAE
r6yXCJ7u8Gsa5D9VUtEqZuz2/Xsm9CLG8bhYr5GTTsu81dPbSHx8BMDXah4DyxMc
88LR1GpCPOwxqp/FZUvw3zAytWIPF4K8NDlbC9rgt+9up4TmhEVPgj9nDcatvGlQ
peMDlDJ4XEfQtnP8K9huImW2meIGmXoqfkzbMHeVzsOTw0IZ/vPFfuOxr0iosCFq
bjM0OYxA2EmzdNWdVtxB3JCNUVCL0VHD8lCpJbIBxTUMHY68Ct+yP8bLvxiu3Uww
hATaPwIGJ3ekY62H/TSSri6J1r7N5w==
=XsGF
-----END PGP SIGNATURE-----

--iJT/IRkUW/TDFo7l--

