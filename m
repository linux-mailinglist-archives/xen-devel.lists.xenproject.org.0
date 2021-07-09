Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3CB3C21A8
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 11:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153530.283645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mtG-0002km-60; Fri, 09 Jul 2021 09:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153530.283645; Fri, 09 Jul 2021 09:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mtG-0002he-1H; Fri, 09 Jul 2021 09:33:46 +0000
Received: by outflank-mailman (input) for mailman id 153530;
 Fri, 09 Jul 2021 09:33:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AxIF=MB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1mtF-0002hY-1N
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 09:33:45 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.164])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10a59baa-8c45-4371-8aa3-8edffba21d2c;
 Fri, 09 Jul 2021 09:33:44 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx699XYdlm
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 9 Jul 2021 11:33:34 +0200 (CEST)
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
X-Inumbo-ID: 10a59baa-8c45-4371-8aa3-8edffba21d2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625823215;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=9YN/+Z68CKXPjcb0qyth/k4kP6bwaYhEAbzraNhvKPo=;
    b=WjTe3KNDOQ/fb0UqblT5DiRWTe8Smxosu2ydjQgKn2HDNNU20RAnL/nJWiTl0CEzGr
    qQfqcSc3wlLhEoytZ+KAKQ+J57/IW3kpFv1GTjMxC5wxbo3Hg6tjqfFUCcBGe/7D6Wqn
    wkmOx0V/7KZe+Y0YY+EusS3l74HUoJIj8Hz2j5bmhVIrAkMIGvA0bMZEEClqmAAqgd56
    Ma5NdHm1UFMNLztYP062gGvkmhg6b0Nz19PrfrGPDrO+mFBSiJ72qyH3a26o8dXb7DcK
    FLOg+3ypUj318PhfJmeTyr1rreYsp8opA1PYB7K3xTSTmkIZb3gFr7HYP17juluEqTzo
    /W0Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Fri, 9 Jul 2021 11:33:21 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210701 07/40] tools: create libxensaverestore
Message-ID: <20210709113321.0b947a8a.olaf@aepfle.de>
In-Reply-To: <cb473d34-7022-74d2-e679-087bf84c26b8@xen.org>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-8-olaf@aepfle.de>
	<20210709112040.2dd4ec8d.olaf@aepfle.de>
	<cb473d34-7022-74d2-e679-087bf84c26b8@xen.org>
X-Mailer: Claws Mail 2021.07.08 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B_Hw7=eXOAH4ZQiooRtS_d0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/B_Hw7=eXOAH4ZQiooRtS_d0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 9 Jul 2021 10:31:53 +0100
schrieb Julien Grall <julien@xen.org>:

> Were they resolved?

I think so, yes.

Olaf

--Sig_/B_Hw7=eXOAH4ZQiooRtS_d0
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDoF+EACgkQ86SN7mm1
DoD2MA/+J6T824zMKsEjRN2IczaZlPCvrS7GrivNRXHIJghP6JTdsO7u1Ucsq/yj
K9n7RcikAkveGXlRQ4w03Z5ubwUhV/k2+fh1W7mRRnMDCa7jiwRbAFGy59HFJXeP
dJEj2hsRmyspHMwT9cFsYTLmblJgMSVmLCC97i1FTS+3V5nF8m2ZCC8gT9XLrdy2
aaM5/cBeTVRs6y2cLNdgSHrjWvEJGYFVUEmoHGpF2KKTaO8mnk0SCFhbbvZSpONc
7FiLeBXFVQWAn6gm/px+EBMF2Zfq2r2Fc38ER9lSj1N+vcYsdVb5lKzjVdKpphly
c7xQbIfSwLiuYFG0KJ7WfsJsVnPRsQXrPnjvyxpMK913tuMO2hA/icfW8pbeSV+N
qt1sGTHt/jj50QjCpVw7UBnrC9oF+Hq4aCvwjPqp5qnRCrBKlhGQUgc/zzQ7ZynF
+fITsuppJ6q4cZNd2uH3aC34EkLHhUW5VoZ6m6nh5L0ihuu9jS+UvNS6TIP5EGmd
At6GvfERaGIRC2K45dUNkmOxTxQf1odwRMmnifNH4PRFfWsw8XrGeLBu6VHvwLvS
1SUS2plnMXEe4SROHqMWpQCLrjXZ6pC4QNeRsn2EacdPGULr03V/OBpc/6GLRbAc
kFwUftQ/S5qUqAdnF5vkJ5K5jbZ7d2MQ792bO0NO1+DTXX4e7NM=
=5akL
-----END PGP SIGNATURE-----

--Sig_/B_Hw7=eXOAH4ZQiooRtS_d0--

