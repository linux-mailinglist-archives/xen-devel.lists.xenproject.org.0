Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK/cAfvw1GkjywcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 13:56:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9693AE002
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 13:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274946.1560914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA52o-0006Ny-41; Tue, 07 Apr 2026 11:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274946.1560914; Tue, 07 Apr 2026 11:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA52o-0006LR-17; Tue, 07 Apr 2026 11:56:34 +0000
Received: by outflank-mailman (input) for mailman id 1274946;
 Tue, 07 Apr 2026 11:56:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wA52m-0006LL-3v
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 11:56:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA52l-00G4Ad-Fl
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 13:56:31 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d4f0e7-5cb7-0a2a0a5109dd-0a2a4507ea66-24
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 13:56:31 +0200
Received: from [103.168.172.155] (helo=fhigh-a4-smtp.messagingengine.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d4f0ee-ba2d-0a2a45070019-67a8ac9b8f03-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 13:56:31 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 1E5BD1400093;
 Tue,  7 Apr 2026 07:56:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Tue, 07 Apr 2026 07:56:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Apr 2026 07:56:29 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1775562990;
	 x=1775649390; bh=+c6dX1Y4bDsPm5WcjXqg6Nh7cBYsEskKGUbCqRXAzVM=; b=
	V2UxLJolxjXoXCQ1H6WKJhO5bGGF4HNpXJP12fyKUkAeOGuifE6QZkb8VseH7pqb
	1aK+We+Dl+U4lLugDM7CXNnG7wJ7nDk7q6k5LSlxDP7TpWOgOzKk3VcOpCIPBdhN
	UicDMThMRNX2QKSRfXJIGmr5XsNGuVnmvQMwWN3B3ZTcyfSqc0xSzhNY6Xun0mMV
	xEGKK3gre6BN5DJ6EtZLSHckxpQayK3vaAGRBZBu55NkTkT9juSnmQ56+SNaNHvU
	fyvZC1PhToJyiP+m6ZbwLLuAAaye9dooFNxgudRhjIU3NaND5bipPAfvMqaxabLR
	dQSYpN/EiIuwLmRkG8P31w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775562990; x=1775649390; bh=+c6dX1Y4bDsPm5WcjXqg6Nh7cBYsEskKGUb
	CqRXAzVM=; b=nfaUSndGXDxDLq5vpsQvKYoGa6BTnmnJDbDPN/wjrNH0MX3d/jg
	LQi+tSxEAHNPWo9Gn19bhT/PgbTRXXca2SguhWF6N+1QkybHXm0e28/bw1atZ2Yy
	ijJaCWNf/QCx1X1eIsL+/0pX3qZBWlqc0lZ6sDye+aLwI/0LMPPWeA1LPARWSNuW
	Dj4s+kTDoaPGszaY8oCdoje+zEj/LUjDb49opLiAbDSxImoGBMeR+vefEj6Q5aqV
	fdy7IKsoix9lis8B69IYww9DGQTcOuXAUR5g4esBOAWytTXYINngQKXTx4kujgUj
	eC28mZwJzxOzl2Y35C3vIKuyiCVTysDSHPQ==
X-ME-Sender: <xms:7fDUaYTiokI-_viiGi0n5cUdeCizMffErkz9DsBfGeKH80Afo0-Vqg>
    <xme:7fDUabypINkBFmRMd7zdCyIjikSFnuUMEhI6AuloMekCbsJ0KwzfjPryCrMQCEehc
    Kpicicnr31jb3fkRHKUd12o1HN9TJFO2EI2w3Zl7-Z1Yhfb>
X-ME-Received: <xmr:7fDUaTcjAIHZKRTpLxq_gCRy1WWJ5nCxb-MximeS9fFC-mb2yIU3RyBWbwMFXi452U6-TNf1h1zjwAnkyAy36RASYGQ8H0DWS4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvtdehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedvpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhm
    pdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrd
    horhhg
X-ME-Proxy: <xmx:7fDUaXKxQF3xOLA9FE20Nt4lOB4xBNqJEILcZnVeuvfk9twTZ-S7-A>
    <xmx:7fDUaUF31i7ikF97XDmNzqj-XXzw-60XWisKb1wOtqMLJRbxugYwKw>
    <xmx:7fDUaRoY-YtTpLdicnzrC_dWT8DztXIUYEZS9jYQl00aztqdtpgYLw>
    <xmx:7fDUadRRQwSahtUmJ8cvwqZaLYtw064cJBDJQKFXRpSxu-DWG2KyFA>
    <xmx:7vDUaclZemEKwHFwiqftoa3xsT8Csbza5d6rRADHfWspZIy2TctxczaP>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 7 Apr 2026 13:56:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3
Message-ID: <adTw66J7r84nW2uW@mail-itl>
References: <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
 <ac44SVW1cPhKYFKU@mail-itl>
 <2caff339-4ce9-42ea-9b78-afeac42b6f0f@suse.com>
 <ac6Bg21hMLBRDNdm@mail-itl>
 <92e0151b-3fb1-4108-9788-f0fbac43512b@suse.com>
 <ac72dp3yEHikJzw2@mail-itl>
 <47b140b2-596b-47db-9c0c-43672f445036@suse.com>
 <8c9e5404-24bf-410d-a2e8-551cb87c6400@suse.com>
 <adTr0_IwZXcGgUI1@mail-itl>
 <9a5a290f-0abb-4afb-b58d-da21b40ac761@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+vHHedGGbCLoiHVv"
Content-Disposition: inline
In-Reply-To: <9a5a290f-0abb-4afb-b58d-da21b40ac761@suse.com>
X-purgate-ID: tlsNG-ef75cf/1775562991-1059641E-8B96A51C/0/0
X-purgate-type: clean
X-purgate-size: 2348
X-Spamd-Result: default: False [-2.23 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 6F9693AE002
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--+vHHedGGbCLoiHVv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 7 Apr 2026 13:56:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3

On Tue, Apr 07, 2026 at 01:52:18PM +0200, Jan Beulich wrote:
> On 07.04.2026 13:34, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Apr 07, 2026 at 12:23:16PM +0200, Jan Beulich wrote:
> >> x86/HPET: channel handling in hpet_broadcast_resume()
> >>
> >> The per-channel ENABLE bit is to solely be driven by hpet_enable_chann=
el()
> >> and hpet_msi_{,un}mask(). It doesn't need setting immediately. Except =
for
> >> the (possible) channel put in legacy mode we don't do so during boot
> >> either.
> >>
> >> Instead reset ->arch.cpu_mask, to avoid msi_compose_msg() yielding an
> >> all-zero message (when the passed in CPU mask has no online CPUs). Not=
hing
> >> would later call msi_compose_msg() / hpet_msi_write(), and hence nothi=
ng
> >> would later produce a well-formed message template in
> >> hpet_events[].msi.msg.
> >>
> >> Fixes: 15aa6c67486c ("amd iommu: use base platform MSI implementation")
> >> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethings=
lab.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >=20
> > This appears to fix the IOMMU faults.
> > Started with no-arat, the debug output is now this:
>=20
> Same question here: May I translate this to Tested-by:?

Yes.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+vHHedGGbCLoiHVv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnU8OsACgkQ24/THMrX
1ywIuwf/duVlrhOTtwSFrltnWpHalptZacYYoSRQwBkreihrEfqr4Icopn2SQk1G
NqJp5CGwZJjm67CxAtrs0XObNTHte9fuffbZigRQ3yFX2JV651APMSS+GymYROre
gf3N9lv8Gq3HDJk+yjMk4MyH6pKtHOi0TNR0qm5FVhJlrfr+JvObm17ZPi5c5Oon
0hfQ77vMgKTQQF8KTd791WqW3nfZWfmjWlhLsQyrOfcipwcojdFrDXxz/7trgBwC
jfNOJ+aazX8p00JB+LXq+khG1HqduN7ipu2qG8ks3BdmHPdR4PkDHQCJPDq9Vh7b
eVsGXsSQ+/uN/GCTwjkE6E+xZ4dxgQ==
=TLG8
-----END PGP SIGNATURE-----

--+vHHedGGbCLoiHVv--

