Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lUlhCEMsKWrPRwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 11:20:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1198667C1C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 11:20:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=fxLJGSee;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="EQ/t85FN";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1334055.1597157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXF5Y-0001zk-L0; Wed, 10 Jun 2026 09:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334055.1597157; Wed, 10 Jun 2026 09:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXF5Y-0001xv-G5; Wed, 10 Jun 2026 09:19:08 +0000
Received: by outflank-mailman (input) for mailman id 1334055;
 Wed, 10 Jun 2026 09:19:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wXF5X-0001xp-EW
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 09:19:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXF5W-008lMq-5g
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:19:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a292c08-e002-0a2a0a5209dd-0a2a4502c468-4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:19:06 +0200
Received: from [202.12.124.144] (helo=fout-b1-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a292c08-af86-0a2a45020019-ca0c7c908839-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:19:05 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 309821D00103;
 Wed, 10 Jun 2026 05:19:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Wed, 10 Jun 2026 05:19:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 05:19:02 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781083143;
	 x=1781169543; bh=FGNOd1fmLA0U9beI/bvQjteaeaan28/WYbWhwXISHjY=; b=
	fxLJGSeendqeKmQ0khpiY0IossveGzT2ICg7WXvIp2ufagp7cTjwLZ1r5pkAb3iF
	lM0VrNhaBWMB1ElPdNw5blpbTlrhUmfkKKv7Grx4ORH0AW5DIxOroVLWWJKL7lhZ
	dSdWA61KT8uhRoskwAEek6EEiE7/js4RjHykIgqrvAc/I6S7W9+2TRCCaPGYZIdO
	yees+4rzrnTorddL8axv+0NdbjEVuFQoNV5QTcyggCkn3wY5/wSL4tYIIODXvly0
	zl1OnWFeFpL8N/SRTn8ZyKUA7QNqhrfNpePMQSwZhjwbr9cPEJXpTzuJH1Jdmr5O
	vR85iPSXbR1/q62QnFtDMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781083143; x=1781169543; bh=FGNOd1fmLA0U9beI/bvQjteaeaan28/WYbW
	hwXISHjY=; b=EQ/t85FNWeBvBGSjWmL9q9/+Dl5xRZ4flKzxxgvGLnERjpRMHir
	vd49gKwFN9owFkXro2p2C1IIyi1Jy4LcqCw50P2F3ckiFMGhCleTL+51aJon4bc8
	zmV/vzpoZHfmqvazgQN9yUFjvVFQweFHtUFf4KB5Sje01YJSNs9QCHb94ngpxmEr
	zNNEns/KJgTe8ateFr+nl8kYV2pARLFO3zFVHkJ5iemfk3ljwNKyMMTGS4Et+fTn
	YyD5VZuyuFDmVHueTVtdK2esoFqZNn7v1eAQoKB8hagasyWbJVOrgtJhwW/4t6qn
	XXY2Ca/5cBVkZx1v6tfxf85QtXIzHVHXtnw==
X-ME-Sender: <xms:BywpapB4UgdF7XrCTUClo_tL0RcDvRuyTnilXb0-FA2ggEGHEZBGog>
    <xme:Bywpammwl8mFz_KoDq_jwBfi5vLof3X49gsnYiI3Of4dLMrqIOUTjtVhhdb6uuLHs
    3dCc6yGaR5oYOz9PFQaweeDiWYt51QqLJ9d_N1-w5M1OFJvDA>
X-ME-Received: <xmr:BywpaqwwbWCo9i3delSr1J_Srl8Fudk4S7blJ1rAFQ2-MjgVzTFvpX94CTEFvxPZ0WYUWdCw2TD0Ew-xNvTZqCsuHDLAcuGnO_U>
X-ME-Proxy-Cause: dmFkZTFiAnne/jbfKc4DdlUbNn8EoGq2rniK9JsuW8Z8k5CtQsigcNmug2lL5wE1loBqW/
    iVvkG1b/EsNVN+g8jqCT5rG4Rkz49Plw60Fdnxn3WsYpttVReiaaIEBaaWmczGqzl/RGIW
    vs45TkUZjZXcy3v3ldmJPSfEQIIhrUxphgi7fuYapzUHova9blLEOUEhqpv7oBhGVKCoA6
    WQ7omLa2jCtGRvdFJ99fimYx++f4jLK5IwD4uNt3aLRT/F2txjamzv97s6hi6xI6Ln/Hax
    qtXwn/cmy7/cJkToAbaGHMfHSN0L2HdGHpsaugDAH0DPQ9kscFLbh1xlhJe+NHi9axuORR
    T9yrh9ze+ck6cIswF/Put+p48tgKfkIEDuJ2afQG2IuhcydfsTEiX1k/Q56T0ohPYag3+R
    4wYVNIkKfhVmfpIz+/xuSKQjemM5Vc7Vy+AdaGao6MQzr4O8NFXLw8Q1r1IviTRtCiIWFd
    QKtXbyGQbxMSxImuiIkYwmEp3S9OOw3VV8mqNTy1hAD35z1dRo1/CyOncxR2vUiJoLAREB
    SiA/pAVlPXucn6qY+GlhA0BNKeiA64LiKhlFhLlb5OFZc0OZddIdVuqpJDoK+09NilDMza
    GzBt6Hs5lUx/WAcZPyWOg+ZxVqq2n7nBZTlsahSpWEFmfj7+ZWd1aDYsB/nQ
X-ME-Proxy: <xmx:BywpagRfsaNSDQUHN8k0HKDpNBRjrRLiaNGSQRXrLPoHRRPFzLT6Uw>
    <xmx:Bywpai-b0UWZI7CLO4Pl2zCG_8fie-52K6AfPJNC3GZYPJJAv5MrWA>
    <xmx:BywpautKt71VWHtm0Cjos61HSs_q6xOrRnSiPematRKQW8q5AIsHtA>
    <xmx:BywpaqNYwdHeYlI0R7SP6qDUB55u9Sgfa-tpdMBf_rjmWxTx2W9TKg>
    <xmx:BywpajkzduA91_0elxYGx406c0RWz7Pbrk7pd7KxFv1HNE9HTbjGt69B>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 10 Jun 2026 11:19:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
Message-ID: <aiksBFm6Pfe7chWZ@mail-itl>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
 <aicffd9gRs-HQ88v@mail-itl>
 <696a426d-0007-4cc1-9997-169fb9af7c7e@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WCBoUGbWHLWUz0VF"
Content-Disposition: inline
In-Reply-To: <696a426d-0007-4cc1-9997-169fb9af7c7e@citrix.com>
X-purgate-ID: tlsNG-720697/1781083146-82F6E161-D2808BD2/0/0
X-purgate-type: clean
X-purgate-size: 4105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.28 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,suse.com,vates.tech,gmail.com,apertussolutions.com];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:from_mime];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1198667C1C


--WCBoUGbWHLWUz0VF
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 11:19:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi

On Tue, Jun 09, 2026 at 05:56:10PM +0100, Andrew Cooper wrote:
> On 08/06/2026 9:01 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Jun 08, 2026 at 06:31:08PM +0100, Andrew Cooper wrote:
> >> From: Frediano Ziglio <frediano.ziglio@citrix.com>
> >>
> >> xen.efi with debugging symbols is ~45MB, down to ~9.3MB when stripped.
> >> Multiple firmwares (as seen by QubesOS, Trenchboot, and XenServer) are=
 unable
> >> to boot xen.efi when debugging symbols are included.
> >>
> >> Either way, having debug symbols by default is abnormal and contrary t=
o how
> >> the non-EFI path works.
> >>
> >> Produce xen-syms.efi unconditionally, just like xen-syms.  If
> >> CONFIG_DEBUG_INFO is enabled, these will contain debug symbols, and if=
 not,
> >> then not.  When xen-syms is processed by mkelf32, the debug symbols ar=
e simply
> >> discarded.  For xen-syms.efi, call $(STRIP) to produce xen.efi.
> >>
> >> Some old versions of binutils ld managed to produce efi files which the
> >> matching version of strip couldn't process.  This includes Binutils 2.=
26
> >> included in Ubuntu 16.04.  Delete the workaround for this bug, and req=
uire a
> >> less broken toolchain.
> > While I see Ubuntu 16.04 dropped, how is the "require a less broken
> > toolchain" addressed? By implicitly disabling xen.efi build on broken
> > toolchain? Maybe README should have a note about needing newer Binutils
> > for xen.efi? Currently it says just Binutils 2.25. There is a section
> > about optional build deps, maybe add there something like "GNU Binutils
> > X.Y (required for building xen.efi)", if the version is known, or at
> > least "GNU Binutils capable of producing non-broken PE files (required
> > for building xen.efi)" if the version is not known.
>=20
> xen.efi has never had any relation to the README minimum toolchain versio=
n.
>=20
> It has always probed the toolchain, and silently turned itself off it
> doesn't like the result.=C2=A0 In this case, we drop one of the "lets work
> around this bug different" checks which ends up excluding the problem
> revision.

Ok, in that case

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> If you prefer, I could re-split the patch, and state on the first patch
> that it's a prerequisite to be able to use $(STRIP) in the second patch ?
>=20
> binutils' PE+ support is horribly buggy and Xen is the only user in this
> area.=C2=A0 At some point, 2.46 (practically bleeding edge) is going to be
> required, seeing as it's the first version of bintuils where we don't
> need to hexedit the PE+ header in order to satisfy the signing process.
>=20
> ~Andrew

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--WCBoUGbWHLWUz0VF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmopLAQACgkQ24/THMrX
1yyXBgf8CjAGnYKGFSBYfdQ0g1WiZWwIGnD/Zq/yZu1RZ0SKbgVJXk8vlwqMJxGy
Lr6CSrhhUjAOYM9IqlC3Re12KFOsO7C4B+PmsanXgsRl+TShgyjayPtVyJAUFnZ9
LdiMEuUWg/2a5m3F303RMyHMmH18NzvWIu/0xPLekG1SBwyKD9MVMECtY1qd87yi
tWA4q8jAr97KToO6oy/EcwMJ2ylxdOstLrC1EYoNFS218m2YXGq1D7Tl7wJKDcnV
RlkQiBQfs3bkFWAZ8C9wPszCd6NhX9WrIjTYa/18YHtFKGj4Q0DPaAXzkYJJ6Bwj
/nEwXa+zD4Vg43aP9obgnzLt65kqvw==
=J5yx
-----END PGP SIGNATURE-----

--WCBoUGbWHLWUz0VF--

