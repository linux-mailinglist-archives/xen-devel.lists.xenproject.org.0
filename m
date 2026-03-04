Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCtSIHxDqGlOrwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:36:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1090201A76
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:36:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245487.1544853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnKr-0008SX-C2; Wed, 04 Mar 2026 14:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245487.1544853; Wed, 04 Mar 2026 14:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnKr-0008QF-91; Wed, 04 Mar 2026 14:36:25 +0000
Received: by outflank-mailman (input) for mailman id 1245487;
 Wed, 04 Mar 2026 14:36:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u/nm=BE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vxnKp-0008Q8-Ed
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 14:36:23 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82af1929-17d7-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 15:36:21 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 538267A0160;
 Wed,  4 Mar 2026 09:36:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Wed, 04 Mar 2026 09:36:19 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Mar 2026 09:36:17 -0500 (EST)
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
X-Inumbo-ID: 82af1929-17d7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772634979;
	 x=1772721379; bh=v1w24rbHzHrF54HJz/xGTwDUsrsyFlbqLfRT/0XgJAY=; b=
	dXQdqMylUa09SSFdONySWSh1VUXJcb2hxDdKm+rS/aqMJSEZqTcphuLeI/z+027l
	sgEwew3hYmHMbq8KfCIi49Sft8s8UUh2115n60+eVTRvoXDpMZfZXZ6nlqw91KW9
	kURoRdImSaZZyrlseXLgW+nIQvQW/1tF37PadkMaK/EE60kYeggeCf0M4gbIKXGu
	q9oI8XWRwTAkmfFsSqLV7A/y47gt0Djg/fKDThd9Aoxb5TOIIPrr3JrmcRi8IL+K
	6REbG/FdltNwQ0FlzqG5wstozhRHmwRyUv0mBCEukwO9OI+GgRi4IdJSVVJp0Pxy
	F5RZIUwg95rWV0fT1B/LjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772634979; x=1772721379; bh=v1w24rbHzHrF54HJz/xGTwDUsrsyFlbqLfR
	T/0XgJAY=; b=1M/hBxkz5F5/0nMVIE2C6IWbZhebdxbst18HAIVlqUEYyBwO5Kj
	bxfOFFktvt+ryWHSsRRzpsco/1U6Ka9cB0LhpfniLM3R8tw+TfJVVybI2BCCXEKx
	pIJSIug3mL+/fFNUIqdHPpLJPwv4qncclYoYh6KkU3PM4q5nbdUmq5ezdCk3KlhD
	u0fkh1mERSS+KfFvVAxAF4dvHL380NmLziIvdJhPC/5CjEgA+/NlJCVZNaxPnG/5
	FJTzW7PR5b4K2TxIbI7t/LAp6U75d1sObC2UaN+ysA6eP8/LYRvOI/Em9ZtfnHTr
	iR6v8AEHsfa2mntFiHQfqRymKNd2nRdb7Ig==
X-ME-Sender: <xms:YkOoaXvESsUr27CnpqRmZ57-a31j6qc27DhdV5vHpMcpgX8ialNy_Q>
    <xme:YkOoaffq7luWkHfXreEr52uAXgb3yVtWSzxL5DhGx_lXIfgcbn3xbqWAk-rikSG0n
    UoKqkt3w6Z3uyDtXg5atS3qxDXbtw3qUHNIMhWLq27QQoNv>
X-ME-Received: <xmr:YkOoafwCcgfHKwA1pBJfV6TTKpBKWekFL_jSGFdc6OFT4LmiXRvI33UPb2ph3Gfsq2zmNnIVTfHUel4iQ-swKB9GBU7eEVajv7U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieefjeehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:YkOoaVG7qbtJLcXtX0z-R7gf5G3-0Tb4HJbpjoeFCoeblIC9pVCNjQ>
    <xmx:YkOoaTy9fP_cQB9_phLiDba71xPs70M2lBT7-tLVcsSK8I4MIyC1Eg>
    <xmx:YkOoaWvIBqQN3iR6d7LCxGRHUMdrNEbBWMnDofMLgxNtqEfF0DUwUA>
    <xmx:YkOoaQ2LggPq3W_u7qUguR2wzruGlP23Vu8_lRivwY6VSBeZhBBWPQ>
    <xmx:Y0OoaR-5b07bmnP3-QqettNpm3wuD2h9HxUQnel4FOrqnf6JXBspguQq>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 4 Mar 2026 15:36:15 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/S3: restore MCE (APs) and add MTRR (BSP) init
Message-ID: <aahDX_QvrB1MTLcq@mail-itl>
References: <12fbad10-78ad-4679-a1db-3995e34da094@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3wsJeamIeufwQU0A"
Content-Disposition: inline
In-Reply-To: <12fbad10-78ad-4679-a1db-3995e34da094@suse.com>
X-Rspamd-Queue-Id: B1090201A76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,messagingengine.com:dkim];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action


--3wsJeamIeufwQU0A
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 4 Mar 2026 15:36:15 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/S3: restore MCE (APs) and add MTRR (BSP) init

On Wed, Mar 04, 2026 at 02:39:01PM +0100, Jan Beulich wrote:
> MCE init for APs was broken when CPU feature re-checking was added. MTRR
> (re)init for the BSP looks to never have been there on the resume path.
>=20
> Fixes: bb502a8ca592 ("x86: check feature flags after resume")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Sadly we need to go by CPU number (zero vs non-zero) here. See the call
> site of recheck_cpu_features() in enter_state().

With this patch, I now see the "Thermal monitoring enabled" on resume
also for AP.
And then, the "Temperature above threshold" + "Running in modulated
clock mode" for AP too. But, I don't see matching "Temperature/speed
normal" for any of them...

My simple performance test says it's okay for now, though. I'll see how
it looks in a few hours...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3wsJeamIeufwQU0A
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmoQ18ACgkQ24/THMrX
1ywLzAf/bqO07wqXpUQrXgrCBoXHfuZyqb/i/Blg+Z2GItiRrSuQq33VEKJSZPLV
sEfL9HBpM2AZZxCLn9mPbwIpf1zRnHG+bIDucJC/4cBn9YKyslZ72DxdipqL/pMn
vc5FgcYuyTKwdnpX2F4XRBRaJSXeY4XmRaNqOHQfp1o24EZHgHmGfbx8nvlyeQOt
eJyU54hvbYGes21NbRb/x2LWSewjXtUHO1ObL3D80IcJD/ZgBlf8e0ZIwo7X+w8U
WYM4zmP9WbfHMHzA2EX3lRiZP0AFMOMWgGSGJlFHgyDehI3jX2CxxGEqVmtlba/e
SpE9LqxbiHWQRypVj8taNB5FHhcxMQ==
=rsdm
-----END PGP SIGNATURE-----

--3wsJeamIeufwQU0A--

