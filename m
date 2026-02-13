Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOdAFSx9jmmJCgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 02:23:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5863132422
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 02:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230065.1535645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqhts-0004cn-OV; Fri, 13 Feb 2026 01:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230065.1535645; Fri, 13 Feb 2026 01:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqhts-0004aS-Kv; Fri, 13 Feb 2026 01:23:16 +0000
Received: by outflank-mailman (input) for mailman id 1230065;
 Fri, 13 Feb 2026 01:23:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vqhtr-0004aM-Pl
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 01:23:15 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e6ababf-087a-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 02:23:10 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id DB06D14000BE;
 Thu, 12 Feb 2026 20:23:08 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 12 Feb 2026 20:23:08 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Feb 2026 20:23:07 -0500 (EST)
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
X-Inumbo-ID: 8e6ababf-087a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1770945788;
	 x=1771032188; bh=fQ40VqxOfTTtzqBNmdSQBJyJkvtwAyGECh/4w1BV088=; b=
	LUrEHbQq6RHSefhVA6nGxeSBciov0FUWMFWS+pF5EHdHBIXqWlTnaVqwMBapFSe3
	GoAVlnX03UAxPECrCtIQqbHHgN/p8nGYgdizVhhUnO63oLryE3lSKfDGcA+OT6ty
	1jl6dXDQVefl7WSgY4ZCJLUVzEBgc3ORUORlDdTgKWe2GK8+DZkEuxzhwu1MD2BW
	ROA1630J9FcQvd0XNCjPi6sTZ96zBB0ughDlX8ehiJXd8+uzsaiobcQi7ANs2Kyb
	QD1ZmNB9cNbWw0gHDshne0rW4eqHCtxcrzJlMO82ZDLWgxVTCrgv2/8QEjvt0hMs
	hmpa5Md/fa9KR3ayn6DMqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770945788; x=1771032188; bh=fQ40VqxOfTTtzqBNmdSQBJyJkvtwAyGECh/
	4w1BV088=; b=bZp0SR6kYf66YSNBNNO81mDnCjRrFwq1+Wg6MAKc4gxc+iKrf0j
	W/tPqzGAhHg+IHY6roxr9HyzYVJS+jekLf0ag0ZwtSOT4b6t8GHlj/iYd25kkhil
	ohgM4yUdSf7MCmxkG1ThLZhu9emLTmCJ/Zz12S6Hknsn4Jcd3BiBCvx7vT2GpbfI
	p5vpi2w/5MYVN/+hzTWMeGo9M70tRnV1WXwhwdehuF8DPL5L/yGQ5p9snxeGE6bW
	zsBOMEZyegZEsnRLBcpLZ0yKbPOx6Jgp1MckqkEIQWJhKWMuFhx7f7LcN+e4QJC6
	auV0CN1vjT1t9acMmkYvBqUfQ2QkhmUg9AA==
X-ME-Sender: <xms:_HyOafMUORXuqfdHkJOavOR0G2RiMAFokMUQwyr_1sKuXYAJc9oSFQ>
    <xme:_HyOaRvB7kTKUBU8qh9_HUvDGMtnYnh5Y_mFNfCe5avh-isQdqcdP7ZO6K6bh5O5n
    C8f3GOQPGUpUWtgi1_h0VRkAppg7KLToksaIw05yNaXoeyOCQ>
X-ME-Received: <xmr:_HyOaRX2a7RgZo1S6qJ6caZnASfairDuGp0_HVj9i7zCaBuk1Q6cUzVrdpavgk2iz4OuyxgDtIcX9UUOL0FqQs8vywNKp7pCQO0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdeiledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepfedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihig
    rdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojh
    gvtghtrdhorhhgpdhrtghpthhtohepihhnthgvlhdqgigvsehlihhsthhsrdhfrhgvvggu
    vghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:_HyOaRsm_OzkZKXPCnJbZAX4jWIarDAlV4caFCce0qlWuH68Nir7xw>
    <xmx:_HyOaVWFT2o5_5I0c4FqBJc_ZGZo7KtRaj0QtWcosJ2CTYuO2n2AEQ>
    <xmx:_HyOacnjMLkItPH7fHt8tdNy--Ipc0jPddv4Yp5ATsNFvL8sT-KjOQ>
    <xmx:_HyOaWagrX-sihsYIiqlHJY6Aat35EgRDl5o7f7X8Sh-EqGUMvOlyQ>
    <xmx:_HyOaRxLvCIirLhYEAmZLD2SbYAeDhvzYN1UM3AbHeRusJ1V9LkDNPpx>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 13 Feb 2026 02:23:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <aY58-gyarcVoBS2a@mail-itl>
References: <aYtznP_tT6xNPwf-@mail-itl>
 <aY3ttvtxGCPTNgsj@Mac.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MJFPgzPlR2IWv8LA"
Content-Disposition: inline
In-Reply-To: <aY3ttvtxGCPTNgsj@Mac.lan>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B5863132422
X-Rspamd-Action: no action


--MJFPgzPlR2IWv8LA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Feb 2026 02:23:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19

On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >=20
> > Recently I started testing compatibility with Intel Lunar Lake. This is
> > the first one that uses "xe" instead of "i915" Linux driver for iGPU.
> > I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 running
> > Linux 6.17.9 in this test.
>=20
> Not sure it's going to help a lot, but does using a PVH dom0 make any
> difference?

Ok, now with the correct Xen version, it's better with PVH dom0. At
least on the login screen and few applications (from both dom0 and domU)
I don't see the glitches anymore. I can't do a full test, because PCI
passthrough doesn't seem to work with PVH dom0 on Xen 4.19 - and I need
it to start most VMs.

So, if the above test is representative, it's only about PV dom0.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--MJFPgzPlR2IWv8LA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmOfPoACgkQ24/THMrX
1yx9uwf/XS1nu9msraXWwrAMCdrtTwvbrC3EzRQbNtvAkRdYBmKEkWORstNdMyjM
ULC9BQ/a2vlknFIfmG0/PQc89oB3DZC2/TZQZmLM1uAq/bBiRPII3/a7pPB4NFm0
28CrVQCkckQ5Qo+yykB5KJk7cf8xeujC6eshJqSVHAPM3fJBclRJVAmHhe1QAjs5
1BFyUKVWkgZoUmuomJlg3VF3oJyyuBYsKmDyLreYrdJMH4pmKhOCJjTQ9Fe3zwM6
NkyIrCleg4BU2HBUy9Fk0RsD/MhD9F00br4ABOeXAUU+6Xfgs8Ape/RB6OYwonLq
+k+WMHfhYbPTGaWvgQZeEULXTVfEDw==
=ak9C
-----END PGP SIGNATURE-----

--MJFPgzPlR2IWv8LA--

