Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A838A299
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 11:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130848.244875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljfCB-0002wA-6W; Thu, 20 May 2021 09:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130848.244875; Thu, 20 May 2021 09:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljfCB-0002tu-2s; Thu, 20 May 2021 09:42:23 +0000
Received: by outflank-mailman (input) for mailman id 130848;
 Thu, 20 May 2021 09:42:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dJWQ=KP=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ljfC9-0002to-2z
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 09:42:21 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.162])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38677db3-371f-4424-877f-42badcb9b1e6;
 Thu, 20 May 2021 09:42:20 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.26.1 AUTH)
 with ESMTPSA id y090b8x4K9gI1WD
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 20 May 2021 11:42:18 +0200 (CEST)
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
X-Inumbo-ID: 38677db3-371f-4424-877f-42badcb9b1e6
ARC-Seal: i=1; a=rsa-sha256; t=1621503738; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=mdUu44O058xdiGLZuflX23sF4F48yLP7lNYwxyAwPOqAUNK+GONo9p/SvYdHPjXwnt
    nUschUnqUeuaDWRZCQkW0UdCfVEgLVROPHwsu+mnd4eWBuqE4oXIvNoMF1drNiUM7BGm
    BzFONro4QvIOH+CEOmn0IRNM+b/E6wDbE7UeRps8UCgpDcs+DLsJkYQYxGZh/pFcYA25
    Zcs2gBYGLO1dJCSHdri/zDAmLMfmCxhd43OGv2iJ1iEQ7AuCSoiLglA0J6svd5Xxf5S1
    L0RQhMwvneaEol6iOXlvjY0kc/5ifRDgVsBchFBPg/8qy20eSeCtF9wcDt0aGnfiG9uY
    jxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1621503738;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=iO/vJOdJVgZVet5cNxZHIeNDk8t9dkkX/g1Ln/bCvZI=;
    b=XAmGeQiiyWcwVscVqJwUbNAox0IhbQ710tlVR/YH/dssaChDRR2GeWi8AoX49RVM7d
    uJBi5Pk87Hzna/Gq9inBiAAQGT0DHYvsgGmt98WYuKHdp4z2Eey8zSpolEkOXZSES3M1
    7c2rAGXZmJwpXlPIXPR5uozLZEuA9qnk4UPaeHKSo/gNHROGiZrK46lIegYCjahY/bRs
    V0uY6lcwtV+KSuOOXtutkuUjpK5Iv/h53wugKccYCBiVmMfaVxeyiyTLLZ9ChHFDTMOR
    1YAaetv7UYYrinEdgSEFfc4FbGG2SvY8yLOdYSMORW1X5XtAw9KDCnjOcVV5ZWn/PNTy
    ZmRA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1621503738;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=iO/vJOdJVgZVet5cNxZHIeNDk8t9dkkX/g1Ln/bCvZI=;
    b=qhUME75t2zbBmW5Wvkt/1FflvGYTDlhlBr2OJq8/qi85Rk2DWYRrEln3BtIDY6n3C1
    83W3InFHa7bFK6LYYPMJAvmqX6A5X7j22ofF/rrSYpUZg4M0iNJZdj+XniyUn58QyRlN
    NM8g6jVzvDqR9/NplNTQVxCt7n8nVBvaL0YDXOv9U0d2vd67RNPBc7UPDXup3ZZjN46b
    nxvuCswm9MEEfP3xuC59Sb9psDX03LDdnPwkL/te/iCTYWE3s+j2hQprHGb0YLS44cBR
    kwUJtYa2z5dTUPA72Ke4damFX2vtSIemVAGNvU0h1pvlvlm4iTv1Gq+MZHsBa9G4PA41
    ox1w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9Wx7WbE3s+BU2kLCYUBd7t4vRd/ulzKn4R+Wk"
X-RZG-CLASS-ID: mo00
Date: Thu, 20 May 2021 11:42:10 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: regression in recent pvops kernels, dom0 crashes early
Message-ID: <20210520114210.2d87f752.olaf@aepfle.de>
In-Reply-To: <20210520094503.606a1761.olaf@aepfle.de>
References: <20210513122457.4182eb7f.olaf@aepfle.de>
	<7abb3c8f-4a9b-700b-5c0c-dc6f42336eab@suse.com>
	<20210519204205.5bf59d51.olaf@aepfle.de>
	<bb51ff7d-bd02-f039-dace-1c7f31fd2e1e@suse.com>
	<20210520094503.606a1761.olaf@aepfle.de>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SOeGg0J1gBRJ3.7tORmW9aU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SOeGg0J1gBRJ3.7tORmW9aU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 20 May 2021 09:45:03 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> Am Thu, 20 May 2021 09:03:34 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
>=20
> > Just to be sure - you did not need the other patch that I said I suspect
> > is needed as a prereq? =20
> Yes, I needed just this single patch which moves x86_configure_nx up.

I tried the very same approach with the SLE12-SP4-LTSS branch, which also f=
ixed dom0 boot.


Olaf

--Sig_/SOeGg0J1gBRJ3.7tORmW9aU
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCmLvMACgkQ86SN7mm1
DoB/dRAAg8cAb9VTR8/tOMsK0+98rE1v/e5Iap3fVRKf4kOzlqa/QGyRxCIZvrrW
UQ1O7Nol/ldfWvHHC47MukXpgfpbJfZmgg9tXuRZNftez8mUXYBSe9IApx6yzZTO
DVemLrZqd6g6TAOTC5CnQH9N/3nz/oSUDfSjnS8Kay3vAOcByZQ4ySJ4POTZOxPt
eAskXnj7uF+JBvHkHzctg5jkEJnEqd8KfX20qKktyaRcB6PbgCihBwDKm153zPf8
nf9acIccabfGmT+gMRQPzqkX5U6ixXG2KXrhR1O7/QmIsAjClAWc8QIVA6a9/1gM
gskgVpWhAgk0aIzl2QUaLuxHhHXA/xVL/6ivMMTtjmTGUMeU5g/qo5wFjBI2xwHm
AXj9MZW9fw4XJNiwYqTgrMvK5vMbBZqXPmawJ9quIrcVb0XUtrtDpedSdTmbKsVP
t7AmQ3zpAYa8prpi5nB2ecyWtA6hFDaNewcQP/xP17HuzhYLevFVgmeBZuoM94sy
Nx2VloaCbBhUOU6OJag5HubWabUKHyiGI09VnXTnGznwExoJ9jFDgZFmlRCrdzsG
JSONrh+TtG2cS6wdPhW98pKQs9djsFjAM/7EoOsLBeal3Gvv7eb3AENYlR33ebac
nFWxM6XdtMU8qoRuTKKQMVZG/JwkALg8ClbRES1J8cSrZRy15VM=
=qIDr
-----END PGP SIGNATURE-----

--Sig_/SOeGg0J1gBRJ3.7tORmW9aU--

