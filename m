Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9LqRGSeOMmoh2AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 14:08:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EA769981D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 14:08:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b="abg/6AL4";
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=iKmwFUFN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1340384.1601431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZp3b-0003qZ-VQ; Wed, 17 Jun 2026 12:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340384.1601431; Wed, 17 Jun 2026 12:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZp3b-0003o4-Sb; Wed, 17 Jun 2026 12:07:47 +0000
Received: by outflank-mailman (input) for mailman id 1340384;
 Wed, 17 Jun 2026 12:07:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wZp3a-0003ma-Hm
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 12:07:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZp3Y-007Phs-9j
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 14:07:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a328dfe-2eae-0a2a0a5409dd-0a2a4505d8a0-36
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 14:07:44 +0200
Received: from [103.168.172.156] (helo=fhigh-a5-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a328e0e-aaa8-0a2a45050019-67a8ac9c8401-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 14:07:43 +0200
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 7246A1400168;
 Wed, 17 Jun 2026 08:07:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Wed, 17 Jun 2026 08:07:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Jun 2026 08:07:40 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781698062;
	 x=1781784462; bh=W4aAw6qOIq3sI4mi6JBhmj6bX1fIcdNsnSDRgLb/87U=; b=
	abg/6AL4c6UPblFFhw9i2yk7zX05rFkGkdAuw8mfzhwcpmw7Wc0wcIdzkwCmYubV
	AOdiYbmvpWdfQkrX8hFMtQYhIom+RS8x9U5V7WkwJJbJttpPZ4O1nG3xDU9EweRm
	crHWAkrNDkFOGGgtW01movgSc52nyluipmAV1SoGdO0dSjP2husfDLxJteFLpX2x
	Gh/6lFhKaqjWjj+wP2anOgsYNecqJj4gDB0BGImO+knHfGIMzwIC6g/l2Jdw5xya
	fkg/5G/RbCX2EwiaFuGR22f2eabwvCrAl0fZuAhDRLcZtRUuO04LwXXz/phE98hg
	qmDX1Zdw77vjI0nX7v3P3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781698062; x=1781784462; bh=W4aAw6qOIq3sI4mi6JBhmj6bX1fIcdNsnSD
	RgLb/87U=; b=iKmwFUFNojXwmLkRI9s+bxOR5tZc9ExDSOFzDWmJlRp35EKssKC
	iUzWxpxzdy4QssSiZHI56Q89kQycESlY+sFxxV7dCAdyB6qxoFLHVh2/mIw0zk27
	sI3sI58icfWHoffAMDtzHJHXgyjUx/ViradDDcCDgAz6ZSNrwpcBZ78GvHg2DOlG
	4/NDDhBJvN0jvD8OEmueWXsRD2FIyzatihF4r3UsbucFB/AYtT6hANfJur2hqi3T
	qzYffJZRl/EZPgWBFqc712RqbaI56S1JWIuyLUD+Id4omyhD1b5XGveN1GfSL+rV
	GNo6tfouLcrU7++UPJrTEnN5eraoEgvmsMQ==
X-ME-Sender: <xms:Do4yatxgXDmW6haXSDsTYNSat92p7FiGb47E9xlluw4iw6jn4tBtEA>
    <xme:Do4yav3F3rACATshcNfrfkGPVhK5qVq2HcmRZEiOocF9pg--G-aHHi1n6Lrd-tnFP
    4-yeiWNG18zAX6O60m2WbqZlv6CQGlZNn_OGNV71uo0zAV3>
X-ME-Received: <xmr:Do4yaq9vFee-o5vp8ZMugkShXScODZRTKp_LZhoX4x6n6i20SrbI8YGi-CvB5F7ehyQzVrWLnvZMTV5b9VagTQpQ0JqtcWua9mU>
X-ME-Proxy-Cause: dmFkZTEGLYs+tWDDKh5Xv/g4gNVsRZ+AgkI736HJiwf3zB0qYG0MUTHl8pHnWlm3or0ZXb
    m4tcT7bCvXsJRw6MihoROv9MV+9qCjIu9F3KXbseeN+R5qBy8sBumLrzFvwGW0vUUw1zIR
    VrVzjjyT/FLwkuH0KEqfgCN7bH4sdonbGMcZ6X2wJ2qvP2M6NO4jBlMtfZnMtA7QDA+hsf
    0a/MtX0QZNredJvmF/UsaRdrgI8bdh/zjUSM59csmNAAYOUYi+tinVypPrtoR7HZ2+b1yz
    qE0ou/dMhBzyaD+vL/9lazAKPjOPG/9JHPLD2GjYIazOWzHOMKAccqBnLLAtbWVHuOI3ge
    SDE14b5e7V8QtCPnZJ9abHpRKwm4wNpRgZGsUdiIoO3eCvEcMI9Hg1GLLQLcAJQSbo2C/3
    tzK1ZdD53Mx4V5uL2Pvumuar4LU9+xDJtP9rGCRwX094ulPC2VDtEK+NN54hDhQsNmfNnC
    2uaEnSmI5T6j1HumrqB9bSMuFtJyxEr80uQPKSawWyxcdGk+QDF0Tgvo+7rn42yCXDHusC
    UeI1HfUOGAXe6FwFBg2a5YE8bo/3mv86wsePlwmbRnNdq+MAP4m6g8SB5MJJ1N8nsWtD6O
    PlfQbqO5vHtQRaFtoAlqvEZryD3HYV+u4m8WJ0bkTvSyV8spChmmxhhRfl+Q
X-ME-Proxy: <xmx:Do4yavp8WGvDxi-JG_jXjxncpFsAwfdOknfAtFZuyG5kBLNyUXkkow>
    <xmx:Do4yakQC7rg53aV2ASMN15GiCm7V_-jQMnw38BDK1Uc_u6Jy-EZOOQ>
    <xmx:Do4yaiPFsbMSyewMzkVLXoYXsJt5xceZtuV7tFanOlpabOEj37N5qQ>
    <xmx:Do4yaiheGRn13dHjlvjdYAq6YNUsIpEN7F6RDo7IRGUWxjf0w5amHg>
    <xmx:Do4yanV-7KPExqsA7MQdPsL9BORQhk8IuulWEd8rA6HZlw9I_ouGfG5J>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 17 Jun 2026 14:07:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <freddy77@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
Message-ID: <ajKOChA5NFFnytEq@mail-itl>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
 <b310db60-850a-4096-8900-54d0816e5063@suse.com>
 <965bcf53-accf-4297-bf8c-903dce45cba0@suse.com>
 <CAHt6W4f5KzkRhbDnCMS82zpAJ04-UkBoOXowyG=A5CT3yNSv9A@mail.gmail.com>
 <547d8b85-3537-4bb0-bddb-2ca2f14eb355@suse.com>
 <CAHt6W4crK-Lgt6rTsERupEGhdXtjjKJvh3F=K_U-3vXDtcETBg@mail.gmail.com>
 <274b06b5-88b0-4a40-9af4-4ad80a99f3b5@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GSxFomIv1H6lmuos"
Content-Disposition: inline
In-Reply-To: <274b06b5-88b0-4a40-9af4-4ad80a99f3b5@suse.com>
X-purgate-ID: tlsNG-c201ff/1781698064-E199F443-F5EAED0A/0/0
X-purgate-type: clean
X-purgate-size: 3920
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:freddy77@gmail.com,m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,apertussolutions.com,lists.xenproject.org];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78EA769981D


--GSxFomIv1H6lmuos
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 14:07:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <freddy77@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi

On Wed, Jun 17, 2026 at 01:55:59PM +0200, Jan Beulich wrote:
> On 16.06.2026 16:28, Frediano Ziglio wrote:
> > On Tue, 16 Jun 2026 at 15:15, Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 16.06.2026 16:07, Frediano Ziglio wrote:
> >>> On Thu, 11 Jun 2026 at 15:42, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>
> >>>> On 11.06.2026 16:38, Jan Beulich wrote:
> >>>>> On 08.06.2026 19:31, Andrew Cooper wrote:
> >>>>>> Some old versions of binutils ld managed to produce efi files whic=
h the
> >>>>>> matching version of strip couldn't process.  This includes Binutil=
s 2.26
> >>>>>> included in Ubuntu 16.04.  Delete the workaround for this bug, and=
 require a
> >>>>>> less broken toolchain.
> >>>>>
> >>>>> And we're certain newer versions of strip don't do any harm to the =
binaries?
> >>>>> Already towards Frediano's posting I said that having looked at how=
 things
> >>>>> work there, I'm far from certain.
> >>>>
> >>>> I should have added: An option may be to link twice: Once with debug=
 info
> >>>> included, and once with it stripped. Personally I trust the linker c=
reating
> >>>> the various headers, including the section ones, more than strip's (=
or
> >>>> objcopy's). Yet then I can only repeat my observation that linking P=
E+ from
> >>>> ELF inputs looks to be significantly slower than linking ELF -> ELF.
> >>>
> >>> That was also attempted. See previous versions. And no, it does not w=
ork.
> >>
> >> How exactly does it not work? When stripping debug info while linking =
(as
> >> we now do for the first two passes), the resulting image should be both
> >> small enough and correct. What am I missing? The only caveat I'm aware=
 of
> >> is the Eclair scan, where we should avoid doing any work for the
> >> "auxiliary" linking step (the one not producing the binary that's actu=
ally
> >> going to be used for running Xen).
> >=20
> > One thing I remember was the build-id was not the same and debugging
> > tools could not work.
>=20
> Hmm, yes, that's a little ugly, but can likely be dealt with by using
> --build-id=3D0x<hexdigits> to replicate the build-id that was generated f=
or
> the main binary.

IMO linking twice (with and without debug symbols) has a great risk
potential of producing different layout of the binary. While arguably it
would be a bug in the build scripts, it doesn't matter with strip
approach (used by virtually every other project I've seen).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--GSxFomIv1H6lmuos
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoyjgsACgkQ24/THMrX
1yzW6Af/ZpeR/iwo775ZylbfT5o1xKlEbuSzo1T7fYQlnAfQCbhImL4knW5AslpA
XiRDGG9J0vA6PDpMK19yHychGls5Md5lk4opQpmV4/JVpEkwHdgPHS3/I4zi21t7
3agBga2rst03nc3Qhcidqx8+UTFMpQws279NB7SsL2udQLgv+6+QJp5oIa23mycj
JqfZZ3+SN3U+F512gXgkyHdpwP/SFsK/t5M6qV5iAyiZTioyFRNN0tcdh8dHARML
DSavF77gPYjxxxi3ETIRyn+22wHVNlev+2R8wViwjXKydyBFUuUL8IqZNbZt523b
fRMdrePdRyyTO6Cq9qOEFIFP/GiLJg==
=Rs5n
-----END PGP SIGNATURE-----

--GSxFomIv1H6lmuos--

