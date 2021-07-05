Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B24B3BB7F1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 09:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149816.277098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0J8o-0002ce-32; Mon, 05 Jul 2021 07:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149816.277098; Mon, 05 Jul 2021 07:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0J8n-0002ao-W0; Mon, 05 Jul 2021 07:35:41 +0000
Received: by outflank-mailman (input) for mailman id 149816;
 Mon, 05 Jul 2021 07:35:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0J8m-0002ai-AT
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 07:35:40 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.217])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98152248-dd63-11eb-843e-12813bfff9fa;
 Mon, 05 Jul 2021 07:35:39 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx657ZWKQR
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 09:35:32 +0200 (CEST)
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
X-Inumbo-ID: 98152248-dd63-11eb-843e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625470532;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=iwAZHz+bN1CxIaMVu8XWz95smJ4SdKtO2YuzCZDyDc0=;
    b=JRbSzXG4HwjR5Ey1z38rVJaZiZMc0Rcklf6cr/BcvNqk1Rv7v96MWvyFvJ9As6T5AT
    Vim1kUjv7P7DW6eUVoAhR14zCfyhLGYHVejdCvwiCflKE09RkbS6LyYspS0mrWlblZ5X
    QfVbV7YGprdQ4m+M8qFsAxZcfgVPhkTOmqg5uA5WeKdHH4s+QEtS1/AKtDGANzg9g4pz
    6kNCR/GqlXYZIWIG2kUUtDYj0oErkeb/TMcfNRxiwltYScXnZHoj3a27OR7t6nueE6Ut
    Ct/PAb57hx24/s2jFKjR1nOf1raRISodq6fmueuyrETnZ+NT6TYASSrRTfCNyyutlXkN
    lXaQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 09:35:14 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] tools/libxenguest: Fix max_extd_leaf calculation for
 legacy restore
Message-ID: <20210705093514.45be9be8.olaf@aepfle.de>
In-Reply-To: <20210702190334.31271-1-andrew.cooper3@citrix.com>
References: <20210702190334.31271-1-andrew.cooper3@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JbMqPY3W6G1h2t=4_+wlXLO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JbMqPY3W6G1h2t=4_+wlXLO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 2 Jul 2021 20:03:34 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Fixes: 34990446ca91 ("libxl: don't ignore the return value from xc_cpuid_=
apply_policy")

I think it fixes 111c8c33a8a18588f3da3c5dbb7f5c63ddb98ce5 ("x86/cpuid: do n=
ot expand max leaves on restore"), 34990446ca91 just revealed the bug?

Either way, this new variant is what I had tested last week. But with a tra=
iling "u" for the constant. This detail may not make a difference in practi=
ce.

Olaf

--Sig_/JbMqPY3W6G1h2t=4_+wlXLO
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDitjIACgkQ86SN7mm1
DoAnjBAAiRZuQDEjjVhMLjPjG3ICG49Zl+hTzwfvwXHmJW54vN+/LQJjoIcNVrhB
0cS1ZPwZ43fbB8aR5/3m5fcNfRAnDcCGF3obEilhubYuQ7TLVGEpC0Wb/0kYkvsF
uB3HrWlUYWFlq0+FUYtl99rHgahcAKx+nA9C2Ak9clm8eTwkLKRpc42KE6SqZ467
nc93wXGn+YJJfBPLM6L8jMF9jW7e8Ia8WZIgCJlQNftQ87ofDHMLRK1By/8555Ns
ZI2qJ/eAd4WFnjFdLlw/LRgNZgNlYcKSPuYnyuezTYn0DzP3yLdl013GeCmry64N
rMwepRTrNVPNkNTAc4Hwi63X6mwmBud+tTK+Z3uHhT5cTHDwk61Cs1rqRbaAZ2AV
dJsa01rg+ptYPfp3+Xu4sQG2j3KfAhU99DzkrpNi7xP2Yrkxt3vylAbVzi0VSkEQ
z3h4oXqBLgti5lz/OOZBYUeEv08VZ+klmuj7pLRUb3nuEkgasOeFYP9ozjYF+cL4
JjFshN6aYcKiaG8DaUvWtqPt5VSgrvP5+f88TzuzG0I0v+7yML6h6j9oAmdeIwf3
2H8/jieUgeRksq0oywpI1gRCl6k/eMtWGwHxPstegrWw4RrnYWTVH+LvQ3da/JGa
wQhTdn2Ovnil36HgGuQ0VTpeKgVqNjTDOBg+0MSturiRty7lRVE=
=qeNW
-----END PGP SIGNATURE-----

--Sig_/JbMqPY3W6G1h2t=4_+wlXLO--

