Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52AC36D7B1
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 14:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119316.225753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbjed-00044u-Kb; Wed, 28 Apr 2021 12:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119316.225753; Wed, 28 Apr 2021 12:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbjed-00044Y-HN; Wed, 28 Apr 2021 12:50:59 +0000
Received: by outflank-mailman (input) for mailman id 119316;
 Wed, 28 Apr 2021 12:50:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSVs=JZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lbjec-00044T-7R
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 12:50:58 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27ad9e1f-da35-4bed-837b-e065ee620a2b;
 Wed, 28 Apr 2021 12:50:56 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.2 AUTH)
 with ESMTPSA id D0155dx3SCot5dk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 28 Apr 2021 14:50:55 +0200 (CEST)
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
X-Inumbo-ID: 27ad9e1f-da35-4bed-837b-e065ee620a2b
ARC-Seal: i=1; a=rsa-sha256; t=1619614255; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Os4jWg6LUFqj2Hqx7jbOfOjmn0F49ylbbb9MX2WVXkwjaT23kGLp4CokQBJ2bIbbZH
    JhPDpO2CLEHqNsxbS3E/qYokm16jXSOsCqDIUB7Lz++Bf+UGqj7lxMo+07+3JU4RiXbC
    pZRY0DyyazOF5xywjTnYJDX4YPph05Des/lSAua98lPkdOO6Di4V0Mnm3Hs01hwZ5hhM
    PY4c6zJVzeHtugRQWaY0LyueFv/3QFwmwrN5G0gPC5Wrhn9aZUtPwHqEd1++LRensP1q
    KHkp7oq5vztqxMNwbCWbysTVNrTfw/UypIMFwHVDTuVy8bCc2CwA0v3cZupfjajX5DN7
    m8mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619614255;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=VKzqJlyu9RYeBB6aIvGkP+DPfcPhMEW0M2dD+tfVMSk=;
    b=p7YewUciqGodMk5bkxiUqIfDL3seXXpYl18PIXDZ1wOdMChaFKj1UhN0YA3938z82E
    2AKdm+65xRM98HazP5LNtS5d9TpWEG+fsloN5NO6/H4wH/d566nvVVN7MBV/1FwR2anp
    BILKBbsBvGM4pPE/6iMSwKaiPjB0/cx9WPa6T/3QVhffR0ry02LNcsjIT320Hm1yxye2
    1JifJ0ZOE3TjZZJUQ23BlBTcn/Kh7vQ34H+K07/J7LJDWUChRtNHCtNGJya2RCKXtTKq
    gvkFkYcWft2kly1enTH0Y0Z/kxro5+5KBHMktyCbwb63jDCkA0L4D2AqwY3aOOaF00dc
    o5lw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619614255;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=VKzqJlyu9RYeBB6aIvGkP+DPfcPhMEW0M2dD+tfVMSk=;
    b=JEImOL71mDyrbS+6wvpATg70vrLGo+NR6AZPE1LiWhTWC4N6uRG84oTL4rIm3/uaAU
    csD8QCwbofTnkLpX+nY8Fi/qeJhSJlxuSyCFqx7BiiAacK/iWOffuRQf/PuWPYMDogeD
    QsRkGwW4gkyu4u4oJocpW4Fh3zhoJ5DFrh/fgFgWOfRYoHJJ4bEJhfxCetia13aY48in
    C3EESBbqJNY5WlQ5te4GZYltlSs6hkyX4FYWaUZ1F1gsCvDYvZ+JX/BwoneYiSTE5cuw
    wCneSLU5fK/esHTWNP3k98hSzHzp77h63xaxmda7Cw9BtKMgichxe5vIY7tSD1MNtJwv
    8lvQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisEsVR6GbU3svGYLiH9zFD0wpO7hNb2D/K88Gfjs"
X-RZG-CLASS-ID: mo00
Date: Wed, 28 Apr 2021 14:50:44 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: obtain a list of granttable PFNs from toolstack
Message-ID: <20210428145044.75ab84cc.olaf@aepfle.de>
In-Reply-To: <efef0c49-aa39-8df2-4f0c-2b4f86795956@citrix.com>
References: <20210428095049.14a8272b.olaf@aepfle.de>
	<8427397f-0953-94df-04f6-8dfe2a4ceee8@suse.com>
	<20210428121701.3272b369.olaf@aepfle.de>
	<d508af0b-dd4a-7c13-f33e-bc60a4fb7272@suse.com>
	<20210428130346.2477ffda.olaf@aepfle.de>
	<efef0c49-aa39-8df2-4f0c-2b4f86795956@citrix.com>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x8Jm_K5T7DcQ.rDVU.ozvuO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/x8Jm_K5T7DcQ.rDVU.ozvuO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 28 Apr 2021 12:43:45 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Grants are not properly accounted for in the logdirty bitmap, because
> they're not unmapped during the final phase.

Yeah, which means the verify code can do no useful work.

This can be addressed by either removing it. Or by giving the granted pages=
 a dedicate type so that the verify code can skip them. I assume if assigni=
ng a dedicated type is easy, it would have been done already.


Olaf

--Sig_/x8Jm_K5T7DcQ.rDVU.ozvuO
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCJWiQACgkQ86SN7mm1
DoB2YBAAjBbafIG4eiL+QxRuEg5pvLVD4Y7mHLkok9ASqDusiV+odL1CMydD+PeD
ciP+h7NMCHMfk5LNvLHko8paItt32oyD0jDHA2+mGnRzNJnndU2bgwoeXdMvKy61
R2HZuE/RZy2H1AD2Hne2LPHyRwSy2qOoPispcwyTyJl2AgCAlkQvU6eGJ66fTnBn
sB4iDk+zJSt5nP1t6sLC7zfiQ1d9KH5Bv1aolTcIv5oaOyaZWgFoGDizuYJPPRIL
WX0fVWy2mcQXbtdM9EFS8PjZDPtruIaN2+2N9E5zGKi5UELVzI9H2n0tzNAJ+oK7
Hf1VPn9u+zaBFjszp+6WV1aJwpnl49afLHp+qfcUJf/jSIeAFOipgy7l++167+FY
d+ocDzFvpZR7rOd+ZjWFH8BcHkvCX/2Ah4VD6aKRFJmOY4PgHrm+r3kDJ2jJQ463
v8rSJXb7cAwJOXmBAVF8Vr+dfyEzx1D4zqQ6TtANy7LI4k8S2LOAOn8IkmJAikbT
pNY4/ACz2YxCrlcx+NIHytZ3lBeALmF4CP0vgTj/I0wbb3pb8R9z4pT8CTl2dIDh
xKwAXMpql3QPju549s3xiiIcWDD3JLQ5b7r8PXpcD5AhDo9KX/+rxPPGdy6Nbj+M
Q0bAVRC9/Qh1LejXzOTdi8jmDz/1FD04ReRWK9dLic3kN1h4hFo=
=2L9b
-----END PGP SIGNATURE-----

--Sig_/x8Jm_K5T7DcQ.rDVU.ozvuO--

