Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CDDBREhzmnElAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 09:56:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B853857F3
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 09:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271199.1559447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Ctg-0006gg-NV; Thu, 02 Apr 2026 07:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271199.1559447; Thu, 02 Apr 2026 07:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Ctg-0006dn-KB; Thu, 02 Apr 2026 07:55:24 +0000
Received: by outflank-mailman (input) for mailman id 1271199;
 Thu, 02 Apr 2026 07:55:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w8Ctf-0006dh-IT
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 07:55:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Cte-0011Yd-Pm
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 09:55:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce20e2-5cb7-0a2a0a5109dd-0a2a450be780-26
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 09:55:22 +0200
Received: from [103.168.172.151] (helo=fout-a8-smtp.messagingengine.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce20e9-bca8-0a2a450b0019-67a8ac978271-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 09:55:22 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 25F11EC01BF;
 Thu,  2 Apr 2026 03:55:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Thu, 02 Apr 2026 03:55:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Apr 2026 03:55:19 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775116521;
	 x=1775202921; bh=r6N+BPz6/4M9kFGy5RytlOtPbtcKh1UnxQLFi6GD31g=; b=
	JFBmNUoJj5JPmgUmDkSILFnW6DkcnplrYBv2ykiHYusunBF/I6Ubj4ZlwDa+v9zT
	mjRkgECGDZY/ykHXoFwLmBZfdCu2OS83rELDHQk43t+HRvxJ9H5F9qlgD2x7gDaQ
	p9V9USl8Abd7SMARCYnxMTyJiL5xFAJrERlWvLzsXHJOpMxom+zI/HiHqkGtYLfy
	zcAfeTgs0gW2LICRC7GgQjosTUvzLMxr+lbcqyq1lKFBauQpH04gqPAA3qNuidRA
	dFKYcbVSqNB2yBcrHvwGHd6fKfitome1ylHszhucYPxpp0JlQJ2zH3CG64J7UGJB
	jBSCD4AfaBwpDJey1IMRig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775116521; x=1775202921; bh=r6N+BPz6/4M9kFGy5RytlOtPbtcKh1UnxQL
	Fi6GD31g=; b=sHwxvQbYji4ZgT1QB/oywkhigpGXAb2XOUCYPjTugNH/tTGcD+t
	XHiv8fqLIkOLydtgVkmnu3zkdvBC+SmoPzaMDDKM/2I4F0zXDI57w+GIItKUdMAo
	IvvsOfiMgO7x6GX2Cw/6rOMnS1U7oA/SnHTniIi87RTdx9BP4jKmPyw6O+sr81Ae
	I7J7EjTmC19ZhxtWnPUNtv+AzSh3Gut2rGMm+W1jAbFDzOv+Jj9fzSs0/6+nd6bG
	6uV9EMwPo+6VnVXAxQrFWm8V9g+YralOKk+65Q5qkLCkFsG5BG+ZSf3+UorD5pE3
	HhSr4RY0F/26y4SdQM7AWoEf7gnx1CR1b2A==
X-ME-Sender: <xms:6CDOaX27MEnZQLritHiNyZvxow6nXE_WsNOPpbGI6lEa6OF6ShkIMA>
    <xme:6CDOadgZQOGY6g8iBqjBa6_DOUu5Wo96GYTesk69VRV5UH-h0OxQK1t4VNXW7-Hro
    XVgvwYRFvQuP2Lq74uLzBHtq80kdR0GTmsA1a_B3KdwImFlcw>
X-ME-Received: <xmr:6CDOaVQZIddMFHToY8n8fJnIXDcBnyCAunZDQl0NIjhrJIXoMV_Q6jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehgeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfekuddtffettefhieeuheffkeeu
    ffelvdffuddtteetledtveekfeekleehjefgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhh
    ihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtghomh
X-ME-Proxy: <xmx:6CDOaWjEE3A9_FIgi6GqPvexLA3a6HHiza-xNuQpFT67EVxlKwDNsw>
    <xmx:6CDOad6LISVIo6fmMvJV4EJccT86L4GpLfNHlOsVOkM3Pg_zbkm75w>
    <xmx:6CDOabCCK3I0ue0zS9JrSqsHSQLyveN9oT__i8EiroPuVNhbBjAjRQ>
    <xmx:6CDOacbOAzwRfLK2FZBE9JkMUIxcrx9AA8hH5VRymBNocsUAgX2Uag>
    <xmx:6SDOae67o2yD4rcBKw8lGyXPmVtOo1vCPi5o9_YnJPZnO-SA2dRoP8wK>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Apr 2026 09:55:17 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 0/2] EFI: cfg file parsing adjustments
Message-ID: <ac4g5ZwuiSSGg8jD@mail-itl>
References: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+dL6MHepi0FMhhT8"
Content-Disposition: inline
In-Reply-To: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com>
X-purgate-ID: tlsNG-42698a/1775116522-F55CD2A1-476980B4/0/0
X-purgate-type: clean
X-purgate-size: 1404
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:dkim,invisiblethingslab.com:email,messagingengine.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 61B853857F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--+dL6MHepi0FMhhT8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Apr 2026 09:55:17 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 0/2] EFI: cfg file parsing adjustments

On Wed, Mar 25, 2026 at 02:22:57PM +0100, Jan Beulich wrote:
> 1: avoid OOB config file reads
> 2: move pre_parse() back next to get_value()

For the series:
Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+dL6MHepi0FMhhT8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnOIOUACgkQ24/THMrX
1yw8lQf/cLC86DoKVly3CoLDw9JqxyNwUweMZmo8uWqDObsDp8SoZCCpsxjGjmPF
uA6E2yVtlaPZwZilVCJ0AzX5CJ+sdfguChs2uKn3O885bVHssbiNLBKbpohA05xF
mgwOISfFCJBOgQuBEmf1vl+m4T/f+/zAAGt2Ie7IAxdhmsHPzmVMCqmClp2ncdUN
CYSuUJyQ6OAyOLSsfqzHFQ7JYhJlEkYsHQy/2DqzXigYCPsMZCb75Pn/EntRiqoZ
wOkkTwt3UZwyMF3XFCfYgklb0+r6riFZ+y2wBvnBzw3Ftp02DidUlLm27BiIpPC3
Pwjvt5/sRkYDw883VGmbtCgiQv+VdQ==
=khtC
-----END PGP SIGNATURE-----

--+dL6MHepi0FMhhT8--

