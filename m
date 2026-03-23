Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P8aFWojwWmTQwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:26:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1BF2F1302
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:26:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259228.1552536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dQB-0001qx-FD; Mon, 23 Mar 2026 11:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259228.1552536; Mon, 23 Mar 2026 11:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dQB-0001oD-CD; Mon, 23 Mar 2026 11:26:11 +0000
Received: by outflank-mailman (input) for mailman id 1259228;
 Mon, 23 Mar 2026 11:26:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w4dQ9-0001o6-90
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 11:26:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4dQ8-00FsKp-KN
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 12:26:08 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c1234d-bab6-0a2a0a5309dd-0a2a450ae516-6
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 12:26:08 +0100
Received: from [103.168.172.145] (helo=fout-a2-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c1234f-1772-0a2a450a0019-67a8ac91c649-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 12:26:08 +0100
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 585E5EC00D8;
 Mon, 23 Mar 2026 07:26:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Mon, 23 Mar 2026 07:26:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Mar 2026 07:26:05 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774265166;
	 x=1774351566; bh=KcW3WcJ7ZmnTrYJ4Y13aRjxCcQ8iJdBOthhe+7Dgsws=; b=
	A2OcNvTkY3Mlsok271OEmF1I3oS4QrkepdAEX1Uui7qXMIb2jopeZsIlfCusSlnE
	wq1IEtebmlur23T+VDQh/CNpkv/GWlJ5CYUKZQwPmuiHCXc05A4mTKFe2vRZ7AHG
	Jt9h2aBOjwAHQS4VzUSZ+vD49MrJtCFWUAoHz2jmPeQTCqanOQxDU8ZpS87Dl/+y
	IP0B0s4v0LwI9p2XJL0cVAJpqzJvFWDJnoLLj7IiCmmHLJCrOII2+pQgOpnC7xWm
	jCC5h4tvl9/KZRLnxX6RDfWbd7zSow6HhuGXcu1wL5E5lJ/BfBQIWSDNQAqUqEYT
	eJXbPf/j9Mfb2OnN3yayVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774265166; x=1774351566; bh=KcW3WcJ7ZmnTrYJ4Y13aRjxCcQ8iJdBOthh
	e+7Dgsws=; b=vORveng8gtz4Mg6d0z26yx9D8APOovlv/dWq1MGZaX01/M5dEtP
	mqTtG/whs4mk88JoQ6XwGRH5LLmV89mGkPqUnLu9eda8d3WZS2wfNdxraau4N1Lm
	ZTnn2Q5My7syjrGLzgLef5UQs8f4xyI32coklOZ2MBx/pmrXzEJz24EEpjuW0IdD
	BwaVClRD7azfncqBTmgfQGvfebqp/Cr1uzMYotVTgyLQqwOhdnS9sgiVDir0hu8J
	QkUXIpak2zocQCVcDYaVTLS5u2d0u5375tyeAipPFpAIE94cxMY5rfd0lHJUhUjk
	kfkNAjTOcaP/9N3zE3AHHmeAVbnmM7w0s4Q==
X-ME-Sender: <xms:TiPBaV0UkPPl_eLyCHSX9OfmqtSaxiu-kbRwbdK-59ucHdoqv_bEHA>
    <xme:TiPBaTH6jvVqWPaktVHVWoVbnYy1wm6upTUVP68pc87T9SltaOwQDYXfwbo4zPZnP
    kyOuHerOizbnVAQRCNjjKY-VCOLrceLVTRVQHlcSz26iQ-x>
X-ME-Received: <xmr:TiPBaa6avpOGDxgJJ7nSXE0PBgulnGvjyI9UNqLFThQSXspoQuzdI0T_9qOvGsB81NZuOcQ4vZflNyydQlkD4CQnlb6Fi3IBcKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefudekheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfekuddtffettefhieeuheff
    keeuffelvdffuddtteetledtveekfeekleehjefgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgv
    thhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthho
    peigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtph
    htthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthht
    oheprhhoghgvrhdrphgruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:TiPBaRs-qHzerOmALwQ7rDReghXGHOmc6LcNxMkW_Q_GZprgjFTwow>
    <xmx:TiPBaT7pk5N2xSlnqG5LRZWkckH9rLcRlbvAMIZMIWdQ3UYBjnWWUw>
    <xmx:TiPBaUVRRtHwwJBxDuoCWTuxFV9lPXzgWmq2cN4g0tJIm-VySFyKsA>
    <xmx:TiPBad-re5H3DdG_Wy0mwqdqweGV-jDxBWgwdVkFCcM9tXUo_3_CEg>
    <xmx:TiPBaZHWqLYHPOlTEhk412t19EVOm3aX4DN6oF69GPsolWkdlNgngFVJ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 23 Mar 2026 12:26:03 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/S3: restore MCE (APs) and add MTRR (BSP) init
Message-ID: <acEjS7Z1LrX6RynM@mail-itl>
References: <12fbad10-78ad-4679-a1db-3995e34da094@suse.com>
 <aahDX_QvrB1MTLcq@mail-itl>
 <0c556f7c-6567-43ec-a9cd-eb542fc970b3@suse.com>
 <aahJJdA6ftj3OucN@mail-itl>
 <24401de6-eceb-4087-b3e9-05c99cba1d0c@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XmUa2E5b63X3yneP"
Content-Disposition: inline
In-Reply-To: <24401de6-eceb-4087-b3e9-05c99cba1d0c@suse.com>
X-purgate-ID: tlsNG-4011c0/1774265168-5188A900-3F98AC38/0/0
X-purgate-type: clean
X-purgate-size: 3079
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:dkim,invisiblethingslab.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
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
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: BD1BF2F1302
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--XmUa2E5b63X3yneP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Mar 2026 12:26:03 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/S3: restore MCE (APs) and add MTRR (BSP) init

On Mon, Mar 23, 2026 at 12:21:46PM +0100, Jan Beulich wrote:
> On 04.03.2026 16:00, Marek Marczykowski wrote:
> > On Wed, Mar 04, 2026 at 03:47:14PM +0100, Jan Beulich wrote:
> >> On 04.03.2026 15:36, Marek Marczykowski wrote:
> >>> On Wed, Mar 04, 2026 at 02:39:01PM +0100, Jan Beulich wrote:
> >>>> MCE init for APs was broken when CPU feature re-checking was added. =
MTRR
> >>>> (re)init for the BSP looks to never have been there on the resume pa=
th.
> >>>>
> >>>> Fixes: bb502a8ca592 ("x86: check feature flags after resume")
> >>>> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethin=
gslab.com>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> Sadly we need to go by CPU number (zero vs non-zero) here. See the c=
all
> >>>> site of recheck_cpu_features() in enter_state().
> >>>
> >>> With this patch, I now see the "Thermal monitoring enabled" on resume
> >>> also for AP.
> >>> And then, the "Temperature above threshold" + "Running in modulated
> >>> clock mode" for AP too. But, I don't see matching "Temperature/speed
> >>> normal" for any of them...
> >>
> >> Which would imply that for each CPU you see at most one such message a=
fter
> >> resume. Can you confirm this?=20
> >=20
> > For the current test, yes. I got the messages for CPUs 16, 6, 18, 4, 2 -
> > in this order. Not for 0, 8-15 or 20-21. Not sure about CPU0, but for
> > others it kinda looks like I got it for P cores, but not E cores? But
> > I'm not sure how to reliably distinguish them - I base it on the holes
> > in numbering due to smt=3Doff. Specifically I have online CPUs:
> > 0,2,4,6,8-16,18,20-21 (yeah, weird ordering...).
>=20
> I wonder, btw, if this is good enough to translate into a Tested-by: for
> this patch. Thoughts?

I think so, It clearly fixes reporting issue.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--XmUa2E5b63X3yneP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnBI0sACgkQ24/THMrX
1yxS8gf9GPeZ6LqT4BNmBeSHDJINlPQOF0FFzt/Ox6O+R/9aSGN8SA7gVDGYGzSV
jl9IEPb6BYUBlk4ReqsnUirlh9O6DVfAJ/LU8xA13gaLUlyhYFFQQpmGWjqVZWhI
WzokksfGoTCurmuV9DMsVu18dyZg7ApELqo1yhSu3G8cQxlkLYKNgF2lgvEdii2m
dkXmFZixEF9BA23EslTw3eez2Lp7zNKhDK5kGKRA8Wl0oilqQFmrpEEb/jOW/1yA
18Mai80xKUkfz4k9g5rDFQxbbODmRYsBy+HTiPUpFO7QqVkvm6CyLH6j2ZEQq5eW
t7q9xuWbwyTte4VnzbCA+wR7x1WIOw==
=Klla
-----END PGP SIGNATURE-----

--XmUa2E5b63X3yneP--

