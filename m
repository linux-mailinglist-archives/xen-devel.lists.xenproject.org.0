Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EONREPwi+2lvWwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 13:16:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A4C4D9A84
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 13:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301598.1575853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKaDy-00043g-Qr; Wed, 06 May 2026 11:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301598.1575853; Wed, 06 May 2026 11:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKaDy-000427-O2; Wed, 06 May 2026 11:15:30 +0000
Received: by outflank-mailman (input) for mailman id 1301598;
 Wed, 06 May 2026 11:15:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wKaDw-000421-Qs
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:15:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKaDw-008YH2-7X
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 13:15:28 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69fb22c8-5cb7-0a2a0a5109dd-0a2a4503a178-22
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 13:15:28 +0200
Received: from [202.12.124.144] (helo=fout-b1-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69fb22ce-672d-0a2a45030019-ca0c7c90ab75-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 13:15:27 +0200
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
 by mailfout.stl.internal (Postfix) with ESMTP id A82131D0006B;
 Wed,  6 May 2026 07:15:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Wed, 06 May 2026 07:15:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 May 2026 07:15:24 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778066125;
	 x=1778152525; bh=kp6rrEQL9W6mD3SdFOu0W9/67fVZf8A+p9FWAp0Hfyw=; b=
	m6Yc2fDV9t1ilZHLXe8aAAoN3ht/vuv3dDXuCiWCh6KlFql5QGiuVcW/ENPcuYdb
	PE102EqmmJEScSd1jb/nLyV1reyVfGPjeTnblZc+YtkBUCmoPnMo9063WMoAy3X8
	PiWzvsmf6QO3FPwkXAIItzxqLij1gkcw3i9SIrmENopeOnnOP+FrAr/edhWa/QRy
	VgzE2Wa8GcOd1+Vfcq/3eSqbJcU2GBVszkrcmXp78L2/gQsyTCDdCjur8Y7jffnI
	e65N4qTrAsKcUmBioUibRtdPhWbvvY97mktzmn/LFGlI/E/sPUq7inOaJei0Rryi
	u1bQRAi5zIUptyKtmhVVSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778066125; x=1778152525; bh=kp6rrEQL9W6mD3SdFOu0W9/67fVZf8A+p9F
	WAp0Hfyw=; b=Jd276WukIJcp+meM3LWSbEw5JPTiFJPwIj0KVIwnqs0LpkXedZo
	+kG6nYNuBdZClTUiNwsoucHHMYBteqHwCjMHhLG8FDcagj3y2EreU1lII59xfUOh
	q53clJWBdog8+OUIx1bwoSjWYkT+sKIKQbZ9b2rkdxyelPSLic+zTSiEakIiZp4p
	EGgZo5sDoLfRPlnwVTjgVKSHOjac3FRNp96pZpQLQZbQhs3b5k+1c5JUO7jfp/G/
	SAEbPXeqL3fP6jUdNJn938UOFebZzvQ2aaDe2OhySJgI9OooC3b+caDn1fIKWQWN
	jOBDbHnFYP55ITosg5zoaYD22nnBS1FOoqA==
X-ME-Sender: <xms:zSL7aWMph-Ou7OilVgpH7YqMNG-R_eOUXVqlkEqIEbQKzksWUnkUcw>
    <xme:zSL7acaI0QLPMCng607U37vhIub3B7a6zHyFH18e3h-kb4Zwm6pty7tfcSoW1ydGA
    MVDXtNSlCkydahlzjjzIZ6QYZzsm6rqOfNxPpNH3Bsk5eeAJw>
X-ME-Received: <xmr:zSL7aaooH3O8DpV20VpuN-TsR7OnMEuuOxHfasdY5w-Pn5FtXnmxRwkRnYw5NWTPojT2TMMWmlWYG0PokFr_xdh5yvEWNO40HlI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdeggeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleeutdev
    feffueelgfduieevuefftdekheevjeeiiefgtedttdefgfekheduteefnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehjghhroh
    hsshesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:zSL7aQaQT9TkFrKxhKE1kb-77Rbt-_4eLFbsh_ThwAq_fsYFOb535g>
    <xmx:zSL7aSQyL0VOLH5nH6Y0ohKixDvHgks-_t_ulS9393y5zHbCLkvDlw>
    <xmx:zSL7aX4y5lehmONA2R__u1mDcunFl6DXq0H4v-ypvddCFpSjfqlPWQ>
    <xmx:zSL7aXy9W3yxbv45Xzz1C0qd5YgcSYXPyjSi0qhmh0kRuroVNULvXQ>
    <xmx:zSL7aU8Fx9_AbAdvbb-N5xQjKq1n05zlqKo_kOWzePX0ailZElRNXoSV>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 6 May 2026 13:15:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Problem with PCI-passthrough to PV guest
Message-ID: <afsiyinlXzjSxnxp@mail-itl>
References: <04c8ed4e-4e99-46ae-b83d-af9031f5b622@suse.com>
 <afo7NyXOEsDsVB6i@macbook.local>
 <4ca0f24d-2526-4e49-a4e0-f8497aa8f4b0@suse.com>
 <afsHZMH1oVpds-wg@macbook.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BPtx1NF9RdXMA+6z"
Content-Disposition: inline
In-Reply-To: <afsHZMH1oVpds-wg@macbook.local>
X-purgate-ID: tlsNG-33051d/1778066127-41B92938-64094735/0/0
X-purgate-type: clean
X-purgate-size: 2720
X-Rspamd-Queue-Id: 87A4C4D9A84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]


--BPtx1NF9RdXMA+6z
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 6 May 2026 13:15:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Problem with PCI-passthrough to PV guest

On Wed, May 06, 2026 at 11:18:28AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 06, 2026 at 10:45:49AM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > On 05.05.26 20:47, Roger Pau Monn=C3=A9 wrote:
> > > On Tue, May 05, 2026 at 05:53:31PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > > > SUSE QA is seeing a problem with PCI-passthrough of a SR-IOV to a P=
V guest
> > > > running a 6.4 based kernel, but I can reproduce the problem with up=
stream
> > > > kernel, too.
> >=20
> > Uh, seems my tested kernel was only "nearly upstream" (it was an early
> > 7.0 kernel). It was missing commit 0949c646d646, which makes the differ=
ence.
> >=20
> > So for now this issue will only show up for cases where a PV-guest is
> > setup for PCI passthrough and it gets memory hotplugged before the PCI
> > device is added to it.
>=20
> Hm, yes, this is yet more fallout from the unpopulated-alloc changes.
> For PV guests that have the e820 host available we could try to create
> the hotplug regions over what are host RAM region in the memory map,
> as then we know we won't be overlapping with MMIO areas.

FWIW, my Linux testing series also(?) found a PV PCI-passthrough issue
in recent Linux (linux-next from a few days ago there). While it looks
to be a different issue, it would help a lot to have that series in, to
at least detect regressions early. See
https://lore.kernel.org/xen-devel/cover.30e6171ddf1c6a72eadf4af0a77c892d4f1=
8d811.1777898148.git-series.marmarek@invisiblethingslab.com/

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--BPtx1NF9RdXMA+6z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmn7IsoACgkQ24/THMrX
1yzPYAgAgL0huzKRxGal0fySxl+meBobKw0S0jiS74w24B6k4KQkl8hmw/CwNhYq
zSK17H8yOFaIVTI1rZoyHn7ZYP2siwn65wkB7wo5FWzp7ArZo4l9olERLrj+m29n
XZyKUdjsvakSpF7jcl66SVi6tHpVR1Gkn2+Ve+LXlmn1deUmsfdxaAZpdkxjlxpM
pvIEo83m8DEdN8kjdbRXiU/IhiUT/wI8r12pItFoO7VyxSNs1gd4vWvCZHYG1aXf
Z8ABTE7E54GUKyibvWXmK+ZK/vUoxpsbaz1DqMOh7N+u2J+BoSvYJdCzoWnzz2fU
pajl8R+7UzBQYuETMHZ3nZx67v2nWw==
=+GUB
-----END PGP SIGNATURE-----

--BPtx1NF9RdXMA+6z--

