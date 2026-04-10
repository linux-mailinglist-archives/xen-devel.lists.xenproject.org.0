Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOpJKYXU2GmuiwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:44:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45E33D5CB9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:44:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278707.1563474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9LM-0006Jg-OX; Fri, 10 Apr 2026 10:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278707.1563474; Fri, 10 Apr 2026 10:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9LM-0006Hn-LP; Fri, 10 Apr 2026 10:44:08 +0000
Received: by outflank-mailman (input) for mailman id 1278707;
 Fri, 10 Apr 2026 10:44:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wB9LL-0006Hd-5m
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:44:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB9LK-00FJKq-GF
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:44:06 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d8d462-e002-0a2a0a5209dd-0a2a4505af18-34
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:44:06 +0200
Received: from [103.168.172.151] (helo=fout-a8-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d8d474-3760-0a2a45050019-67a8ac97874b-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:44:05 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id B2727EC03F5;
 Fri, 10 Apr 2026 06:44:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Fri, 10 Apr 2026 06:44:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Apr 2026 06:44:03 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1775817844;
	 x=1775904244; bh=KqXRvZkjdSiC1TXdblSU7xq0GQPPPWZ1L+QqKXFkpWs=; b=
	jFgQmBwDi99fQPvvjMuj+MB/Km8UCKbL6A+G1qfgZQnTnaAikB+404+6YXQdBhNd
	fXXYpYPlAVZ/UamOteuTVpZ0oTbsHuo6978KpsaALejLOEOW/dBYE+UZgXpb4cZ5
	3aDdGVXBlCMLYhPtatA5dqnKPcrwCF9FdCeQiNe7KWCmpyN9YCX8Z6eo07fTmToL
	0fDe1RxOn2sSjr/xbQmJssK1Yz3t3eA1sDliLg1s9yqD+f8BIw1xZl476iS/OEyh
	dkEWaB8/FiyL9wXgOiqdzN8Eg63w823yRjMJ5a9o1YA5om6hcx+RWayfyiM2L5wh
	e9x61Act1+apLC6ztd0ejA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775817844; x=1775904244; bh=KqXRvZkjdSiC1TXdblSU7xq0GQPPPWZ1L+Q
	qKXFkpWs=; b=CaolV1nOUWsaWkwKw3vpQRUKbZqDLzc8izC+ZIShMJVEFo4goZl
	99GN4FlNuuvJz0mREmj2FNhA5OZi9+eXfo80widxYriTelCGl0QrNayesOQkDD1n
	PSq+z+1jp0SRjgQdzJ9kCKXGHFGFhoEeJnA80jqlSQevrA2RuZzp6mJcI1Mc87LP
	IZn2xTPXAgk52icDLvLptlfSZB6j0EPLUOjkp9rlUbbBSF3Q2QxpTgjwQvZW7AUH
	I2IoTQrgL5AhInbBnQ/4rRMzvTpzys0hgLjh51fVP4asUaUeUGSN+ZVM2SdtTims
	VOAq2wkh3zTJ3MTjoIr9jZvMXInUCxcbT+g==
X-ME-Sender: <xms:dNTYafvDOHYFSbkdOzu4UkB0bivnwqY6YEfvqU_4PMp_bzkO-NPNdw>
    <xme:dNTYaXXaz8bIhi4tt_oI3Mfr1T07gi23Aw7ejlzCbNJAkWa6afvPgr9vCDQT_CQgx
    zHTqJZPUO67uqGU9m3oXg05-wUqp1nrxifCp_XnQ8kmyvPI>
X-ME-Received: <xmr:dNTYabG0s-FcM4nFRH2G8EdoQI2C0TASQ052SFuzqGQg0x-r8lZNTg-XFr5oqDITkKjSLYQiAbHre_Hq9RvjB_smcZVMMW1ZbdY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvledvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidr
    tghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvg
    gtthdrohhrghdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghp
    thhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtth
    hopehtvgguugihrdgrshhtihgvsehvrghtvghsrdhtvggthh
X-ME-Proxy: <xmx:dNTYaZ0fqCTDJA9ORx3OsH2uI6xT6V8Ed0MIdKzmOHJ4B3Or4QnwAw>
    <xmx:dNTYadNAzifHoIcW-aHEorn4E1-DTNIhUCjO4T1sVNw3q6bxZeYSdg>
    <xmx:dNTYaY6FjwFAPy3yyFiF_D53-_dGdEeTgwdZHV7CzmePVQ_sAK5qeg>
    <xmx:dNTYaX25OjVQVowdso5Y_hRhL61cx3-HNys6yB_Tivo1ouAn3XhsJw>
    <xmx:dNTYaQfK-PsXjOUUsybm8M8NDYd0kSX1djL7IGy2M9mM7E89w5-EoMCK>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 10 Apr 2026 12:44:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/time: do not kill calibration timer on suspend
Message-ID: <adjUcmzVrwxEcn4m@mail-itl>
References: <20260410085504.32925-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tUaYOwkehvKn/XPu"
Content-Disposition: inline
In-Reply-To: <20260410085504.32925-1-roger.pau@citrix.com>
X-purgate-ID: tlsNG-c201ff/1775817846-2372A96F-63941FFC/0/0
X-purgate-type: clean
X-purgate-size: 2024
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: D45E33D5CB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--tUaYOwkehvKn/XPu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Apr 2026 12:44:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/time: do not kill calibration timer on suspend

On Fri, Apr 10, 2026 at 10:55:04AM +0200, Roger Pau Monne wrote:
> A killed timer will ignore further set_timer() calls, and hence won't be
> re-armed unless it's initialized again.  Use stop_timer() instead of
> kill_timer() in time_suspend(), so that the set_timer() call in
> time_resume() successfully re-arms the timer.  Otherwise time calibration
> is no longer scheduled (and executed) after resuming from S3 suspend.
>=20
> Fixes: 6d90db1a2ca1 ("x86: rendezvous-based local time calibration")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

I confirm this fixes the issue, thanks!

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--tUaYOwkehvKn/XPu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnY1HIACgkQ24/THMrX
1yz9bQf/Y1c6lYD2l1ximaVqJVniKZF0OUUWD2B3gthXifMbXZuL79cUcDetoKGB
qu3nSd+PxB7jPKtzRNoE0k3ftwUCzNbrMMKfFk5PxBZ10gMVWmnb9KHeaXLDc3CS
l9A0ZiIEob1XtKpYngx08pI1GmT3N5AqQebmkh2DIWqz+W3hEQKjmu3s00bO7cFh
Mj35/+i2oBp7Q6nlWM0p4nSlyThSQsTSClG1r2zEEseqtu9p4ySHAxsNbOTmVDHP
iCyFbC+j2kw35zx5hSHa9LtXBVA/Xn7Q32e1RbDUGS83Hdv93VQ8O24voAqPeAsc
Kji9kA8Tw/JNeP89eRPaytLsnMdxDQ==
=dq1v
-----END PGP SIGNATURE-----

--tUaYOwkehvKn/XPu--

