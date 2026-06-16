Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QeHNDR9nMWo1igUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:09:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92169690CAD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:09:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=XQf4ITne;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=G5qOdwEY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1339381.1600576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVPI-0005hR-WC; Tue, 16 Jun 2026 15:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339381.1600576; Tue, 16 Jun 2026 15:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVPI-0005ep-SW; Tue, 16 Jun 2026 15:08:52 +0000
Received: by outflank-mailman (input) for mailman id 1339381;
 Tue, 16 Jun 2026 15:08:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wZVPH-0005eU-S8
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:08:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZVPG-006IWI-QT
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:08:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3166e9-bab6-0a2a0a5309dd-0a2a4506b3ce-30
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:08:50 +0200
Received: from [202.12.124.148] (helo=fout-b5-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a316701-7371-0a2a45060019-ca0c7c94cc73-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:08:50 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id BAFE21D000B1;
 Tue, 16 Jun 2026 11:08:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Tue, 16 Jun 2026 11:08:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 11:08:47 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781622528;
	 x=1781708928; bh=cIJRoIbM/kiNhQt1JNTUE26tReLBrL3KKe1ogTc1o4I=; b=
	XQf4ITney1caW3I6fVXEy2xfBjp8zggtng4Rmj3JX0MuD5TA6QcTjMB9TVC5PuyP
	tObiKvb4CsFpDw9sb11slHoOG0XYPjHVcdiB4RoRriH7ZEcajxpGtKo9lZRw/iti
	DwjOxbUx/a9f9dwj9QSEgJNus1FH6Ixffo/4UhWzgjpppKdOz4cSBfcaUPKcU+KM
	QXR9IKtlmHzgp+tG+ka85zT3fYJRFscAZdweUi4jCdCllrgkzewhqDrNNk7JalWT
	whyvCY93MC5u6jGuo+yfUL78+tR3zYMi54FiLa9vkKsQ/5J+DPRuyffVJu7nUkgo
	IW09j3bTsywdL+2GSRe9eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781622528; x=1781708928; bh=cIJRoIbM/kiNhQt1JNTUE26tReLBrL3KKe1
	ogTc1o4I=; b=G5qOdwEYzDmLWocuzml+vZgwI+g3GQwtUf5CafQUH++SE3TxrN5
	B81y3BfoeWNIQrtqF7jMIkf9DnAmXZhVdhYkvVYi5HQSkBIb347IH/wvXYpGcUav
	vKS6EnsesFTs1YlN20rZ74zgfApvcXDeRSu5dg9FHvI5SglFz4nzLN1sR8xl1lZi
	4oQJTTG2pnwKFjo2idmK+Y7CP3XEHtJnMtsWBoGEUUKRtVxitZzu/LBqVVsgPiZG
	IyYCbnUtwgpbs/fxFKKNsbeA5Or3Cw1BVCJrdYvcS3q3gdXfTGWjxO6bn37Apbsp
	HA4liNAM0fMboVHTSNBqqXVQCl/huedXTzg==
X-ME-Sender: <xms:AGcxanE9ONgMmJgNIbwclbcVsqRO2Lajh1otmrrnUwh3Duh_0kJLkw>
    <xme:AGcxajaquscRXcLuuLn0JoVRVwlqJ9AQ0VQ4s9KVc0KYPRK_iS9NPCGwROwvilxXG
    UnjNb5wIVDvZJXwt9Yo45iyFwQiMdTDKq4GG2LghwRiVBGjfmw>
X-ME-Received: <xmr:AGcxavW6uxCaS-I3WHBfqZ2FHyxMlfaNax3IEmRoEtnB_-8xQZcJ112E-9EnGX5QO992pIvjrIwwuF0G7QKS23CQ1QYt2ssjhpM>
X-ME-Proxy-Cause: dmFkZTFAJv/QvdwSX4iAbvAS5wSXei8qPx1a0g4qORE8bsGX4WeMrw9W/HO3lPDyCgRZUN
    mO31sXhEpnFV7OsxZYlaMZyIWCDG4ugGsEpH5goCRxauqAoU/7GTo/tp5k9OvMrR9oBLQp
    iBGkOXubKRue/Kouac/8hw8sUbtgYz7TJRm2FT7Gzk2AIOkcUk6SzMe3IymGA7F1cnSEcX
    8CRbkJYZMEjz2Qo/e4C9hHZvQocWVxVMo1maf3dT+oD26xj/GjENOnT5t81WTQHyLNtD17
    igtAllPI4mR8fnveZzmCJGSELwkQpCnW4kzSkDuiXQ7AI22bJQvWy6jsoc8ZMEwln074LH
    AKGv/SEGVXlCO6iOViAiXjtq1+ztG9YvEw3h55Srv8phRvPHLAlafp9YV6XNI9rylNu4Lj
    HlBA8rQKsPN8FEoY7DDKNGj5k7+a0R0fKwnx93Jt0OuHuA++bws/AQl66y1+55qR2XGaw7
    /20sDIi4VLT8tPWVm2G70a9A9/hO7G5oxLeeXbdvSiYAXDgwLwYsda12CKGyLxmVFj+fCd
    tei3LcLJEYIMThgogpynhD6DXuTak5xumdXCE6T+CEUtggqk+1MpvnQ20CIBMGe/0GWREV
    MIiH/C6amK7xW585L5g764ulDP9K+82AT2+je/GS5iDWNsq/rEjxW71cmXeA
X-ME-Proxy: <xmx:AGcxahnWqw7Sr_GDrPdYreJuLRndpThN8bWq9kAgjyMxz-m9FOZ0oA>
    <xmx:AGcxaiAtz9a_DmVLII8HcA877Azbl87_ZN1Ujrx1gFT43p1_4cFSaw>
    <xmx:AGcxaoj0-NJsV99qEDk8Zp5SHx5fb3rxcM1sro3BUNyQ7CQR-9SOag>
    <xmx:AGcxanye1V8BXWt56A-LCFGMH-TGJBSzSt4mcVPW-MKz2knYyGbvEw>
    <xmx:AGcxarqxckKIuuZ5vfgWSEbjMXPrWZFixjtqdxHtfdsCH1LZlhCn5V7o>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 16 Jun 2026 17:08:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 4/4] x86: Split .init section to satisfy UEFI CA
 memory mitigation
Message-ID: <ajFm_U8NBiNlynns@mail-itl>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-5-frediano.ziglio@citrix.com>
 <ajExivEwb88pcOxT@mail-itl>
 <4c577b14-30ed-4fac-84fb-45d248e8feeb@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7qpMGMHnLKgw1jQp"
Content-Disposition: inline
In-Reply-To: <4c577b14-30ed-4fac-84fb-45d248e8feeb@citrix.com>
X-purgate-ID: tlsNG-16d1c6/1781622530-8596CD75-5447A621/0/0
X-purgate-type: clean
X-purgate-size: 3217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,cloud.com,suse.com,citrix.com,vates.tech];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:from_mime,cloud.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,messagingengine.com:dkim,citrix.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92169690CAD


--7qpMGMHnLKgw1jQp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 17:08:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 4/4] x86: Split .init section to satisfy UEFI CA
 memory mitigation

On Tue, Jun 16, 2026 at 03:58:27PM +0100, Andrew Cooper wrote:
> On 16/06/2026 12:20 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Jun 16, 2026 at 11:13:36AM +0100, Frediano Ziglio wrote:
> >> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>
> >> Currently .init section is both writeable and executable, split data a=
nd code
> >> to have 2 sections satisfying W^X rule.
> >>
> >> It is a requirement for NX_COMPAT so the PE can be loaded with W^X per=
ms
> >> in the pagetables.
> >>
> >> NX_COMPAT is a requirement from shim-review,
> >> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-yo=
ur-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have=
-you-done-to-ensure-such-compatibility
> >>
> >> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.=
com>
> >
> > Is that the last piece necessary to satisfy the NX_COMPAT requirement? =
If
> > so, I suppose a subsequent patch should actually set the
> > IMAGE_DLLCHARACTERISTICS_NX_COMPAT bit (IIUC ld --nxcompat option), rig=
ht?
>=20
> The manpage says:
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0--nxcompat
> =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-nxcompat
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The image is compatible with the=
 Data Execution Prevention.=C2=A0
> This feature was introduced with MS Windows XP SP2 for i386 PE targets.=
=C2=A0
> The option is enabled by default.
>=20
> It turns out that Xen is being marked NX_COMPAT even prior to this
> series, which is deeply suspicious as it has an RWX init section.

My reading of binutils sources says it's enabled by default only for
mingw target. And indeed, inspection of xen.efi says only DYNAMIC_BASE
is set.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--7qpMGMHnLKgw1jQp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoxZv0ACgkQ24/THMrX
1yziigf+N8qrR2EPBU5XTC4f7OLI5+3bkZPwNyXS7WtU2tv9+RW/wuy3bUVXt1qF
PBF0AINloPK03DMr6BrNcdExgXwSxwXo4YFUemgrPmMBgsIdYSJVAC8EjgRH5ZCn
9w1bs+qLNJMi5s/IMwZZi6mS6ldL8XjN+5Gpu1cKWbjkWGAjSbxRDe9vcf7kH5to
YDMNvUT574qr2tuj/MvATFR30NM6yN6RgmlNzWbmcfZeqr4VZd+7nKGKJwbfQhqX
iUK6Ez5gGi+LOrHSA76zi01OLgQ7KgrTbLehg2R6jkhzuMT2ltn2CGsUQAnaE+8T
02u/qL0q8qk8QXYdYEkB0F5F0Z7Mcw==
=KKMF
-----END PGP SIGNATURE-----

--7qpMGMHnLKgw1jQp--

