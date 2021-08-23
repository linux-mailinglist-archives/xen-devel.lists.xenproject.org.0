Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E492B3F46C2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 10:43:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170235.310962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI5Xi-0003Vu-1x; Mon, 23 Aug 2021 08:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170235.310962; Mon, 23 Aug 2021 08:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI5Xh-0003U6-Ux; Mon, 23 Aug 2021 08:42:53 +0000
Received: by outflank-mailman (input) for mailman id 170235;
 Mon, 23 Aug 2021 08:42:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7cRX=NO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1mI5Xg-0003U0-26
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 08:42:52 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.166])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fb71afe-5b1b-4174-b2c1-a634a3c67521;
 Mon, 23 Aug 2021 08:42:50 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.31.0 AUTH)
 with ESMTPSA id 50780dx7N8gc5qD
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 23 Aug 2021 10:42:38 +0200 (CEST)
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
X-Inumbo-ID: 8fb71afe-5b1b-4174-b2c1-a634a3c67521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1629708159;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=mPdVfYoYtI/rQDFLSMCqbNQeID8JCRPRWzHS1x4KQc0=;
    b=TPPQnieOJ6Pb4heuqF1fSYoEg4xv0rGNO3VJ2ebbaFaoQYMbL4oIfhCFGpBKMt9P85
    lAyrKD3R5T/lKcpKOV7XVdwhod3+Wb6HraSJkf5MHL2CMwd+8qQ9TCaqWmG01eiPOBxa
    sJI3c/tMrfBinv0q/1T2ZGUNjvmxfDQJEEBO62ikTT+Atn/CngahVAS9ltQTFN+8BJ0A
    +EC7K/ptSOWNTmsuQD4q8Oe8xsvN8boVUpEWPPEnAUXtvpqr6xjFuVWhuvkB0PPKoH+n
    Ffpq7W0eWbVYpAaYqeuY34oN8kDbh5bH+rH2XdI4NY3tU2yaGPgn2/STXrzUxrO4pcXJ
    bWiw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF0Bx6Ea03stVRsAR9aZ79uaPClvCLmExvdWpq0"
X-RZG-CLASS-ID: mo00
Date: Mon, 23 Aug 2021 10:42:31 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, "xen-devel\@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony
  Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.15.1 and 4.13.4
Message-ID: <20210823104231.3a960057.olaf@aepfle.de>
In-Reply-To: <24862.35556.514963.249704@mariner.uk.xensource.com>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
	<20210715161157.7e85ed9e.olaf@aepfle.de>
	<24862.35556.514963.249704@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2021.08.10 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HchlfDD6JuMNlH4j=xRSrCS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HchlfDD6JuMNlH4j=xRSrCS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 19 Aug 2021 17:46:28 +0100
schrieb Ian Jackson <iwj@xenproject.org>:

> I would be happy to take fixes like these for stable branches.  I
> tried a git cherry-pick but it didn't apply.  Would you like to supply
> backports ?

This script worked for me in staging-4.13:

set -ex
git cherry-pick -ex e54c433adf01a242bf6e9fe9378a2c83d3f8b419
git cherry-pick -ex 76416c459c


Olaf

--Sig_/HchlfDD6JuMNlH4j=xRSrCS
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmEjX3cACgkQ86SN7mm1
DoDZow//RCLFV63W27kRW2Oan80gjfR5LuAkQ60N7WV1CDgsMFrU3usMuUmikZ8e
A1wiY7123Nb8rQEiXNSHiwJl46XaQxcXNu7TXIg+nWjJfhnQFlbg0djydObVdys7
6gRUBBQicBP8Hq4BSsy4C3pAeTNcT3vcyPiOjR1/qbMqu6Y5DiivZcV7MPzQ8nso
s/qOJhr2sMiQve0WoASFfSaQEQqcsjqwG1PfsnVmZ0Oi3mxcjHFPpZNZR8DPv0gu
d1Iy9IkW4u5ucACzmTZVM5EPbyo1pGIFAXTbU6mCYcgodG1Dh5PD+ApqVlnFDJi3
bnodyCzZt2QQdm9Lk8MOTvqJOsSmnTRrH68VPwJLNU6Y+0POmdOAzNPY4/eiYcpR
gjo45stYsRKAXHTi8nBoHnHbGltxWlo8d1vtlqJFWItaLvRCX0SuDswmMqLsOhO9
EVA+cw0fbiQZrWhxrm2eWEUHa6xW9DXgn2Y20V+oJiCwEAfych928vZPBxFp73V1
mhIVDDZsf/rY9YuTZ84Qif+iX0FWTu25h7A6QpFLZcXWRkMC9c77aZerNTCg/Su/
t5aaEE7F5zjG85OSA0hmeSiqhS5GZ7diA95NNwjm2L633IOYweU94qkaVTyOED11
E6vWDVNwShIUgtcMv+A4jjQms4rqEGOSlP9svHuoGrRxD3Id5Y4=
=GB1w
-----END PGP SIGNATURE-----

--Sig_/HchlfDD6JuMNlH4j=xRSrCS--

