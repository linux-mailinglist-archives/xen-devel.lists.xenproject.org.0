Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B614339FCAF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 18:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138595.256499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqel7-0004H6-7E; Tue, 08 Jun 2021 16:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138595.256499; Tue, 08 Jun 2021 16:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqel7-0004EB-3B; Tue, 08 Jun 2021 16:39:21 +0000
Received: by outflank-mailman (input) for mailman id 138595;
 Tue, 08 Jun 2021 16:39:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8i+T=LC=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lqel5-0004E5-04
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 16:39:19 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 383e3c8d-ab33-4155-8045-9b7386656d9f;
 Tue, 08 Jun 2021 16:39:17 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx58GdBQZC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 8 Jun 2021 18:39:11 +0200 (CEST)
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
X-Inumbo-ID: 383e3c8d-ab33-4155-8045-9b7386656d9f
ARC-Seal: i=1; a=rsa-sha256; t=1623170352; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Y1TtzdCnZx0FlzedX4LkEZ3woLvunLh5A6zdz7QvJYkJzmU48dlEb113MBO7tPZlW3
    spAUB/1s9wAuuEiUi8FZY3yr9JlgUGyfnJu4p3XieRyXr3VjvCgzIZDRaut6aWdd1FKG
    RAcc9vG5L4rYX0bHdJpKdNearLJk/e9iVjHnLKGCXEQ0/SP2XBXDRMXh0CN6k30HlYVi
    o1s49pUVrmA0xZGBxNjEISbpxnSL6qK7crrjbpXNyJMw2AREFwVWh6jbUV+ghoOex2ge
    NhFB4yVPw2CqFlbOMEgErc+dTE0oyqBUAsmbXYzfkUZ8/BiMg7EmvwUWCmVBwWNazXjy
    n8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623170352;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=qdrbwADjv5TdW5BT8sId8g8o7uI2aZvmSbxxv5A56/Q=;
    b=dyiE+6ShKsAyQMULOTVIIy8DjfYRO7OJogTprySVCbWGtSdz/AsMVAN8an3OVNsenS
    kq6Jj9ZfZmbKzMkjLSOYygth0q9e14+Ob0bpfbearH5lkKtXNO5umvPiaYj29yDFkj+q
    wYKWzlIxoVayNqohj0xT8g4zA7NNFzkBFY/T+2SL3eZ+Lr+7/k7OTyxnaDI9KW8cU18u
    jlZKL+xe3jPpR9gvgQjgBUBItFSm50Z+k34skMJ1W4oyOTZODBgQwhO4NKIH4R7j+LN7
    50jM+eLOHRCTVTMsw7PxrO+5FFhnMX+Ofi5flJ/6YYgvWkjdzc+sd6H53AVZqivBR6Uz
    WMyQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623170352;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=qdrbwADjv5TdW5BT8sId8g8o7uI2aZvmSbxxv5A56/Q=;
    b=OC4t5fB5KZVJCTd96H1Ns/6oi3AUNRrBOffWydvZCSMO9ZuW+kStwYJVqQQ3YsVPo7
    zL83JwoXsmkuDSg93M+Y2eIrbZtwI4jYUVFeM/yfM0mwjeKqg4qfLyj2LpucK6v354V6
    4UtNZEbAx3UMgc3v+6m78kl1vXJXFss2eRjCTCx+mOtgYiMjDNJ2UkjWyVFPRWP7u7i7
    6oPwHonb9BHhljRqWmAzthfqOSfANQ/uFf2GdXZ2OPw87PSBDH968t23UmTj02Rbmgr6
    qLVyeI4bc0z2C6swM1aDQ+6cLDhgRNHb9tumAMpXSqFGhc4CN01I5eLfpYPon7+M+Qt7
    ASwQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Ax6Fb03sCxOoTBq7r1dZtjiRLxxzC79Iv3HI"
X-RZG-CLASS-ID: mo00
Date: Tue, 8 Jun 2021 18:39:04 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] tools/xenstore: set open file descriptor limit
 for xenstored
Message-ID: <20210608183833.023551f4.olaf@aepfle.de>
In-Reply-To: <20210608055839.10313-3-jgross@suse.com>
References: <20210608055839.10313-1-jgross@suse.com>
	<20210608055839.10313-3-jgross@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/797QuXKQLRhCN2SUlh_nu37";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/797QuXKQLRhCN2SUlh_nu37
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue,  8 Jun 2021 07:58:39 +0200
schrieb Juergen Gross <jgross@suse.com>:

> +#XENSTORED_MAX_N_DOMAINS=3D32768

This will break fillup.
Provide an empty variable like it is done for a few others in that file.

Olaf

--Sig_/797QuXKQLRhCN2SUlh_nu37
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC/nSgACgkQ86SN7mm1
DoAYIw//WfjJmJ8ealvucE2mkyYkOzk8sQrj+Rx5OTfSRVCJs1Bd3oBfBeq08352
jgEpljkLNFar1nlEvx2ILtW2IXt8C2tdSFTkJSJv4JZhICsib2ouasl29kccq+Q/
HZAAFBJCPx5eBW7ERv0jORqi7rw46H6H2HW6f7mFfrrkztKAK5oAqVmMMQeKlPNp
H8YJISBhqu8qpGwFvW0yVTJ3O8gyyqdgYTFi45sDnLlGeJ4eqtc5rpYxtOajIs3Y
KtY0FsAKMInkGMWzvsopU+FNivBDuX7w4yrYBJXTOs08obxH42QNRRpT1RjUdnNR
n7XyzGbpNBc3nWhz+czodGr3lHNLPNzVP7KWZmNQ2uZt9e4LEV+1F2DUpDrns+Gy
ZrzLBMezR+amN23nHHBl8wU8oGClCszS7VXLOqEEUxk5ujpCrGkpNzUHvkQqJ5tB
CxY2OM2/sbykkR0x8VAI+mGv6lBD0SNkC3zwalWWHTU7/ZPHS8nsQs0riSXWnZf/
JnTHAg+zfcGnOeRdZksDkKE1mw9XOwp96dEueerCLkm/NHf75WHeTNdjSUmL+NLF
3ySZj9SBgO71Kkf+yeEtDiigJhcNE8yJdQCS55c7wC9EP4j6h2fHYJlMdm0pC6Ms
DpL59P8LT4mObGF47u/7LewY8U1F9GnjGEa4YpF+0rpP4MRLNGY=
=TU34
-----END PGP SIGNATURE-----

--Sig_/797QuXKQLRhCN2SUlh_nu37--

