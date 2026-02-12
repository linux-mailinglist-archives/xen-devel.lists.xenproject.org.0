Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFyCDF3+jWm0+AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:22:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942E912F563
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:22:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229520.1535495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZSk-0001Nw-FA; Thu, 12 Feb 2026 16:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229520.1535495; Thu, 12 Feb 2026 16:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZSk-0001LL-Al; Thu, 12 Feb 2026 16:22:42 +0000
Received: by outflank-mailman (input) for mailman id 1229520;
 Thu, 12 Feb 2026 16:22:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHzL=AQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vqZSi-0001Kw-Or
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:22:40 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bf0cd58-082f-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 17:22:39 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id A688E7A0141;
 Thu, 12 Feb 2026 11:22:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 12 Feb 2026 11:22:37 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Feb 2026 11:22:36 -0500 (EST)
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
X-Inumbo-ID: 0bf0cd58-082f-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1770913357;
	 x=1770999757; bh=H9S1pcMvMufgeBBtWQu0pbw6BL9Wiszq/p8h/oHXstg=; b=
	O1QSHMbFFcbUhIzmS4TfzwmG2mM2eKs2OCt61diAXvDglb+pCQrvywEKUxEo5pnD
	J7ZSh/TwDBn9ixxSW1XyL1ZqQQuxucbtY6tCoy2E1A8HoPoWicba5Zekt8zO+zGG
	GlDGYCVTOD9gltcrx218Y+paDw1kft16B8YXAMyQF89d9ZGi3ne1nzanPzGJlHG2
	KQc1RT6ZAKVV/jrlHoXJuFTzylPfFZXjJEyU200Qz0BMiEriWvwNZ+0UjhzItBTi
	jUBJh1y57z9FaY6lg4+QclY9sG7CtvTLOnNyC43QCK1GVYkvuLhW8uQUzbpCZVDl
	RavbKXtIcR7XFcCPBHPzfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770913357; x=1770999757; bh=H9S1pcMvMufgeBBtWQu0pbw6BL9Wiszq/p8
	h/oHXstg=; b=Y8YHu7SDI1SHVhK2t8WVwKVWc7K9W27/sWPE9jAR13k4y6d9G1H
	BLpdC2N2hjWIKcGr9UV1FQWbYJ9IRoCZRdmxkVeATUsenb/F5LuHu2Fbmo4KGofv
	wyvmPEvjAAN/TmLqOfTLX6CQOUC+6Z08O33iNHITz8S9ZCexDd+crNCAfZw+llDz
	0orndii4MSw/0vYK0Bl+WPHxMhA5Z1o6VkyoyMWgDv65DTfzj+4hBeEx+tDcz7h6
	4Nxn8QYRhopXHnh57N1AZ7otmFhhA3KixnzJLXKl6AMzgOwhtaGAwU8YwI47/PZF
	ZfspqI6FH6M3lTAeqK0OVKBVvQUXXZWufJA==
X-ME-Sender: <xms:Tf6NaTjTTpwdFbARAnwe9Z-sRe3F0kNVj_Na5jDL5rEfXdJjuZea_Q>
    <xme:Tf6NaXzCvo-YEzZ9ZpzQx8UvhBJb141EMJcQdkkLi0nYZmlX6AlU-FMhPgz6pHxuu
    1RvyRoaiho9cs29HbdWD7CDEhcQYC-z9f3YSYwaZPmOPzlK3A>
X-ME-Received: <xmr:Tf6NaWKypdPi4yqtd-uK0EANWwCpkZXygvukWEMmPyPr3ZQ7ig9yZ1BArns0WnQmwtpOEKCydH1-3nb2TIOT_sPwgEMPYjjRu1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdehkeegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:Tf6NaeSAunQ_o63VFXOaoOPYYvFtNpM5EJ8YSH64wXf2AmsxhZSWdA>
    <xmx:Tf6NaerCODtp3qkPOrUNno-XAc81ETB9ZdjpHqWrbG1iCUM4GB5kYQ>
    <xmx:Tf6NaTr6LzU_cLIkcgdKqmUgte3D0y8aFdHl7yH3WTtFQZPRUI6MaA>
    <xmx:Tf6NaYO0nyeeGlCk_hhSh17HNhp8l4FVQEZEGiiuTKahF_2rcBmZmg>
    <xmx:Tf6NaV1O8CsYsr0XQSWu0wZ-KPmwxdk-3KrIPKI5jgbWtiD6NrtbmKOI>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 12 Feb 2026 17:22:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <aY3-Shto7px4M1RK@mail-itl>
References: <aYtznP_tT6xNPwf-@mail-itl>
 <aY3ttvtxGCPTNgsj@Mac.lan>
 <aY3yqOTn9EQfO4rF@mail-itl>
 <aY387XuhCEZ0JNTN@Mac.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jRRBc1ZgOtYQSbU+"
Content-Disposition: inline
In-Reply-To: <aY387XuhCEZ0JNTN@Mac.lan>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.79 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 942E912F563
X-Rspamd-Action: no action


--jRRBc1ZgOtYQSbU+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Feb 2026 17:22:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19

On Thu, Feb 12, 2026 at 05:16:45PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 12, 2026 at 04:32:56PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monn=C3=A9 wrote:
> > > On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > Hi,
> > > >=20
> > > > Recently I started testing compatibility with Intel Lunar Lake. Thi=
s is
> > > > the first one that uses "xe" instead of "i915" Linux driver for iGP=
U.
> > > > I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 runn=
ing
> > > > Linux 6.17.9 in this test.
> > >=20
> > > Not sure it's going to help a lot, but does using a PVH dom0 make any
> > > difference?
> >=20
> > Yes, it makes a difference. I end up with black screen as soon as dom0
> > starts... And due to unrelated bug (in xhci console code?), I don't have
> > kernel messages :/
>=20
> Hm, that's ... very helpful.  We should fix the xhci stuff so we know
> what's going on there.  Is the xhci bug also PVH only, or PV is
> equally affected?

XHCI console works just fine with PV dom0. But I just noticed I had
older Xen binary there today, will re-test on the same 4.19.4 again. And
then will submit separate bug report (even if that's likely be me fixing
it anyway).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--jRRBc1ZgOtYQSbU+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmN/koACgkQ24/THMrX
1yx49wf+NBy2A+DagwA6RfHlLXBvuP5r2FQy2upo0kdOI6l/8Tr45/jVBb0i7QNj
UBqM2W+itJigC+a8e/2CsOZZOH8KzEB6zesumNG64EMvP8p4a64Y2x/yqRxj3/My
Hvuq27dKpCSoLNsKHDr+kuXPGni0TbZxA/Hp2+qjhzlMy9GhKhl4GmwtWyFVKWD3
k5X9TDN2G51ajwcGLDV100UqYqhg0VH1uWPNS4Z2OzZRahv0uWHyf1Xzm4P04lrP
yvQsgL7SEDCxr1H6hodnIblaERsyu3AhERIMqJ8jl7IeYOjDE2Xsd7hWGt65FZhI
Vim+as2uFZmL2+Lp9GIoIa8c85NeOQ==
=zQiG
-----END PGP SIGNATURE-----

--jRRBc1ZgOtYQSbU+--

