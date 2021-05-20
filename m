Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3911389F17
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 09:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130706.244689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljdMo-0006Z7-Su; Thu, 20 May 2021 07:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130706.244689; Thu, 20 May 2021 07:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljdMo-0006X2-PS; Thu, 20 May 2021 07:45:14 +0000
Received: by outflank-mailman (input) for mailman id 130706;
 Thu, 20 May 2021 07:45:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dJWQ=KP=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ljdMn-0006Wu-DZ
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 07:45:13 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.219])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7eae0b4e-14b5-41ad-af7b-84f93b0f038b;
 Thu, 20 May 2021 07:45:12 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.26.1 AUTH)
 with ESMTPSA id y090b8x4K7jA0cc
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 20 May 2021 09:45:10 +0200 (CEST)
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
X-Inumbo-ID: 7eae0b4e-14b5-41ad-af7b-84f93b0f038b
ARC-Seal: i=1; a=rsa-sha256; t=1621496710; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gGNfEGUreVRKgFFeL0cX1JaC42UZ4MUPeJkabnu3pB6bBlvj1PYSd7reRHKASLys0E
    4bMqmNmLVQQKKm4GFddvQPViuyeKezrmNLd7imEl/Wu3Bmi0WSA4U4dwxCWjq5zDvU9j
    QxF5iZAEN7Hm9JS5PsemI7zxZjcuj0MidDo+Yvf+TkArZL9qmo+Ai/5h1mOW0qB4iMVy
    rDtSJDQhRG6jnhQbQhV772u9pw9/bx9Q/5jqlzhH2KpNoz9xy+9s+XRU6T/vc/MfvqD3
    VuhROXgmPW6rGyVjsdNhFx7AK08QEeLn4mu7YNwooLBKLD40ngOp8TaLOTIKGHGFYB61
    TCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1621496710;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=0OfHzXvdFiyUIiicO0Kahi/YjMVyAnJSl9D97PORxXg=;
    b=IRCe8c+V6qAhYv+xmcF7gGwbfFhGp3VLtgwqo6LaubA/ZzqDpgneDIvBSr2OCyMrTb
    aWyX5uan1oxoX/CTw/ZBwjO0d3UiBnp3iywJxz6bQUF3ZbkfWlrbTe5BFFV9KDw1liqy
    kz9J3enUAtW/LsOtAggvO1vd6mZZhJ/jdPdkJUa4K0jZabNBKfgXzpPmMziLh8MD/9HW
    iF2wGUqRl1FDaV5v1LfsRRadgLO7IJ9LnX9cVMlGwKYwG/Ht/7ElWCBV7XXKSnMJVQSb
    InghQTJ7ayRESrJ31Bcw3Egqk1hng/5108YZPOh8Jyzug3yAf4+vcDS9bZXsHTWCPp9e
    NroA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1621496710;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=0OfHzXvdFiyUIiicO0Kahi/YjMVyAnJSl9D97PORxXg=;
    b=pc5nzVssaCQ3v3GnVrPU+BZ9GAcYGo6H4ao7DrrIY32R2p9ltO4dV7wJcw42+3lYtn
    gHyTCKlncAveU7JcfEWHbgp51CM9y2vxF5bSQfLcEvg3yyXkikLoq7xjcaqkqMeVPtLH
    LW08aPOoJt/FKifSYhlwplNofVM61+twlmzpRy+CPHlZYJxG7R5x3YlYg6pHwNjhiARS
    X4AOQGS6nIHhtWvuoJsN3akj7cuhbM1PkxEVgFsX6eYZdYOdWai/UjnB82xwR4PYI4IK
    CjPyvlw3Af5QYAkqtFJVmzxSECcB1TWFJL7bEpzOQwWgLBG/DHM5UJ9G3Fp9XVwaQ8Yh
    gBaQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9Wx7WbE3s+BU2kLCYUBd7t4vRd/ulzKn4R+Wk"
X-RZG-CLASS-ID: mo00
Date: Thu, 20 May 2021 09:45:03 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: regression in recent pvops kernels, dom0 crashes early
Message-ID: <20210520094503.606a1761.olaf@aepfle.de>
In-Reply-To: <bb51ff7d-bd02-f039-dace-1c7f31fd2e1e@suse.com>
References: <20210513122457.4182eb7f.olaf@aepfle.de>
	<7abb3c8f-4a9b-700b-5c0c-dc6f42336eab@suse.com>
	<20210519204205.5bf59d51.olaf@aepfle.de>
	<bb51ff7d-bd02-f039-dace-1c7f31fd2e1e@suse.com>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T04FX8zY4.2tjF1.8jNEBDL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/T04FX8zY4.2tjF1.8jNEBDL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 20 May 2021 09:03:34 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> Just to be sure - you did not need the other patch that I said I suspect
> is needed as a prereq?

Yes, I needed just this single patch which moves x86_configure_nx up.


Olaf

--Sig_/T04FX8zY4.2tjF1.8jNEBDL
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCmE38ACgkQ86SN7mm1
DoAR3Q//ezkM5a4jqG85ltBDLesCD7XCMJX9i7kj8V+oGyZj5x7+9C5Rz1I6BZxh
c1RsFfRjCIVHoOr9/6JsLcnM/DmhFuxiDOXgiD+UAiZle5oIAY3JV6ldCLR5GJII
xeGUAMiulnybtStsZ5BrWK7mTX6IjB/icXn8YirJeFKGxti8l2TlPee/5xdCO49s
Rs6HbI2eSyofS/rxVdkCBDlopciXQxYWXePfrsqtqZhdRnwT769RD9IXeC4y8P7d
rTi6nvs8tOnVJo7V2ZBoKViKkcF/zSSKDO3LToE4CoPdueRkpPCBJyeXzHXhKhDy
1PQzsp86IcpPchX6UcDyzGYEGHQeM99DG2VzZHz1Mm01fwaGWItawOE+rHvABKMt
HHtERfrXNQEr6iMXBQi6ogmplI8SXyMDG2v8G6e76qfSnN6UQHUJL+ZyIq9ZZlLl
Zf4vZw1320mvG+7sR4uGjULY2tnxs5hrONAsg8LiUDpwGauMMZ3B5Sqrv5bYsVVV
lmeRoVm8+KQkzzx4y87BVYoKVMGGPpESiXMo4dW4KH8GrK44e5a9C/av7H7vxodj
SQZWncF6kp26MFSIHqKkKZmkKaKiKxvMvzMJcgniQOj/ezR2QzXXRj1flS9rs3uh
M8zmsS/nqkytkfRZZoNxphnTKiAQVrplM97zBl7YI0juA9syPHk=
=anl8
-----END PGP SIGNATURE-----

--Sig_/T04FX8zY4.2tjF1.8jNEBDL--

