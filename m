Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7033988FF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 14:08:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136015.252388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loPfF-0004HP-RI; Wed, 02 Jun 2021 12:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136015.252388; Wed, 02 Jun 2021 12:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loPfF-0004F8-Nk; Wed, 02 Jun 2021 12:08:01 +0000
Received: by outflank-mailman (input) for mailman id 136015;
 Wed, 02 Jun 2021 12:08:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NSCb=K4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1loPfE-0004F2-2B
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 12:08:00 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1819bee-937b-4368-b4cf-46861176c10b;
 Wed, 02 Jun 2021 12:07:58 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx52C7v4mO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Jun 2021 14:07:57 +0200 (CEST)
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
X-Inumbo-ID: a1819bee-937b-4368-b4cf-46861176c10b
ARC-Seal: i=1; a=rsa-sha256; t=1622635678; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pK4Sa+B4ZTK741NZeYuYc9tJkSqR8PmaD9xtNKcF7e6aF3wxkJe/xOMa3gxSE5XOf/
    tC5ShSUY4q9mGA29JASMnjpnGshhspYp2ugR8b/757K2xZsF6pVtwAa4H/XN1EoopfNL
    5UKBIuu+Pmop8bfA130e5JWU55WBaUGUsX2NVb8TOrZG2R8w6J3QkOxzLfJk8+X+Ji8X
    wMjDMT8svei+Sw4fTidGj3d2GFvpqIsOeoFzgu8YTfiBds8fPhWkhzo/IlEQMKTzC0SO
    y3ZgHP51J2JurbJ3mpwtYxwsS7BKWfO7Uj3Oe3XuUq8v7uqzQqjh6LVG2vEEZmdaK+cN
    Rstw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622635678;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=i2Qo/cH+7ij6lWILG3Gu/FmvWJfTvI+hDMyzpKgGD2Y=;
    b=nspK6d9WSIR8fcDDGOGxOYsgDDXFrH4CGeSuimQF1khiBhMkvJGs5wB/2eTEeYaqcY
    8QglgJ+2Hwu1F9A7ZY7z1Reeo6VzGEwMgfE7/mBHkK1zqFMfqUYm05zrSUgjULf6BAGS
    JIpsmd7PmKds6Nf1Qdb60RTtSsUzzsJqyzzmV3KU++zxGB14noYDDP6E7fX6SJkzuSvw
    RMDYIrXZlB6BJpoE5rgmF27RwJ2Jn56MjpiXASiOiANDFY3jX/li9uqDmhyXobX/VyWC
    Hheb9XMSNzm2jtH7Y6dU4ecQtpLuAKjNg8P7ulvEqdqnQ/G2bOdQ3Ztn24ThMrFuh+ki
    CILQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622635678;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=i2Qo/cH+7ij6lWILG3Gu/FmvWJfTvI+hDMyzpKgGD2Y=;
    b=Q/NhDuvXjjaVDlrWAyp7FQCoAKOawpapPw6/BDnjXZRcLUYG792c/soYm3P/KbZe9J
    4Inm53uCmDbUUkLrrIY9BBwwdrwAJmI6fxL9swQdjcLvgVDAhM23bDX/4WCyfNUH8sTG
    jANBRaBc9SsIiqEJyIRw4zRm7CBsUfri/3zaWLO3TMsBiWHdP9pqibdBTldOCVBIlQqo
    P6V49uVlG6Q9oL5jfzi+yswskEJicqaYFPFuLDlOpEIb9a08mWle3IBw1OupqNR0uCnP
    M9lf+wono9k0c/zWfAKmepSflcLoqVcIE0rvEC1pgF4l1LNzLwh76CRmW/UvtC3M2nkC
    7ZUg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9Wx7WbE3s+BU2kLCYUBd7t4vRd/ulzKn4R+Wk"
X-RZG-CLASS-ID: mo00
Date: Wed, 2 Jun 2021 14:07:48 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v20210601 00/38] leftover from 2020
Message-ID: <20210602140748.462fb0fa.olaf@aepfle.de>
In-Reply-To: <51055fa2-b57e-c66b-78d1-6f07e0164b5b@suse.com>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<24670339-c080-7e47-c2a8-22c22f7a719e@suse.com>
	<20210602085403.40064aed.olaf@aepfle.de>
	<51055fa2-b57e-c66b-78d1-6f07e0164b5b@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1=jcedWTaZ0s2Hre36Dc4wT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1=jcedWTaZ0s2Hre36Dc4wT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 2 Jun 2021 09:00:49 +0200
schrieb Juergen Gross <jgross@suse.com>:

> IMO this will make it more probable to get at least parts committed.

It depends all on patch #3, so further split can not be done anymore at thi=
s point.


Olaf

--Sig_/1=jcedWTaZ0s2Hre36Dc4wT
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC3dJQACgkQ86SN7mm1
DoDyPhAAgoeJZQmPRRZj6IrygVH+zTOJ+Sl5IdHk9T01gRhc/POZ6bCN2tlXwIuw
WXIdmXf4UReYX4NmvHcIz9f5FUYzR5+DVFQaAN08mohn/j7rn3Fvn1FWN73FWPYM
OX5zNriJ/l7GLmV+xldfnhmVAPIvneNm3vgx1y2DsEJvfUTR6K3Lz6NcRQiH4PJN
hZpGNBQJMoaM6HPwO3f6r+xDk64AhmIJKx2tMKYfbfe4jfqnwzwS3SwpadjQsDxF
N72A6lobQqlfJQofa4dFnRvZFgLsC21eJxXnq2RVR35xL4dfPO95y0v6OPtQ69X2
1+ZhNI6/8A6hqE+tlMN/JziWuh/+agWxitOFAdcy9bjarPECLixAyh5VfvFXQS+t
29Y29rzayvASJJ0EtrSdeCwTuca56LKPjTyl0CGeeBhBhI/H94AMh4G68ic6w7DD
wE6cMrR/Nhl705Po9S+0eBVMn/pwLeZHZQYw6lzmZXyBBAVmOGfr9C5ZOEEkHntN
vLnY5ZK5oUHByrwDJap/Dnm3hUHweqANerIMFa2IQKinmlpZ8n9gJ9Nu+5MrVHQC
Pi6D9qWvQeujIbtJZwJ0oBVnDyC5x4Y8nWrRzk90/21zk+pZHGLBOE4C0xtEgMJj
D5uozMdLH8lgK+xlORSRGFyjmYdCmHVTlGDAnQ36bUrchFm82aE=
=nM1w
-----END PGP SIGNATURE-----

--Sig_/1=jcedWTaZ0s2Hre36Dc4wT--

