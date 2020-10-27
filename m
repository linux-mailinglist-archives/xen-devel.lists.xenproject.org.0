Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575D429A99E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 11:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12753.33045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMCK-0007ze-3X; Tue, 27 Oct 2020 10:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12753.33045; Tue, 27 Oct 2020 10:27:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMCJ-0007zF-W8; Tue, 27 Oct 2020 10:27:23 +0000
Received: by outflank-mailman (input) for mailman id 12753;
 Tue, 27 Oct 2020 10:27:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vej7=EC=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kXMCI-0007z8-Dd
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:27:22 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75188af9-4a41-479e-be96-a27bac5ba22d;
 Tue, 27 Oct 2020 10:27:20 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.2 DYNA|AUTH)
 with ESMTPSA id R05874w9RARI3Zk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 27 Oct 2020 11:27:18 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vej7=EC=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kXMCI-0007z8-Dd
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:27:22 +0000
X-Inumbo-ID: 75188af9-4a41-479e-be96-a27bac5ba22d
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 75188af9-4a41-479e-be96-a27bac5ba22d;
	Tue, 27 Oct 2020 10:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603794439;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=nCQn5s7gnsJrUywKf494kqgGObHPVAzUlbs91jKYoKI=;
	b=YW310YFAeVaM92JS8DjNW8mouZL0B1vAgES4KdVHwpUPgWfaJpB4mvhQQSILD3DucA
	C0I05yfu5YfBtMKb5Shp5PBfxhR6NVi0q2WOLgPi5dzUxUwl8alC32T84S1RNOVVO7Ir
	GfuIjzudGsj5Uz8mVhVhoo6+JIKlhA8OWSvkHvYsXiHQeRvcwDdTa1zaUJU1tOAjVbJA
	c/5uc8DQ77cv1b9f0QgRl3V3+dvc9i2i1YTRKZHUW9c6R5bCcKfYuBhc69rt9Y6qfnd7
	9MgzxYuvPrdn8JEjwquE9obQdkLIwQvtpq2GRV5cHBBo5YLGArRlKg6JtwbQjcAxTUwe
	BdVg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+r+/A=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.2 DYNA|AUTH)
	with ESMTPSA id R05874w9RARI3Zk
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
	Tue, 27 Oct 2020 11:27:18 +0100 (CET)
Date: Tue, 27 Oct 2020 11:27:03 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] libacpi: use temporary files for generated files
Message-ID: <20201027112703.24d55a50.olaf@aepfle.de>
In-Reply-To: <68312718-c8ad-040b-be45-192d2c91ba8f@suse.com>
References: <20201026204151.23459-1-olaf@aepfle.de>
	<68312718-c8ad-040b-be45-192d2c91ba8f@suse.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SxvxvkGtKYBEm1jNYi.ExHB"; protocol="application/pgp-signature"

--Sig_/SxvxvkGtKYBEm1jNYi.ExHB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 27 Oct 2020 11:16:04 +0100
schrieb Jan Beulich <jbeulich@suse.com>:

> This pattern is used when a rule consists of multiple commands
> having their output appended to one another's.

My understanding is: a rule is satisfied as soon as the file exists. In thi=
s case once the invoked shell opens the file for writing. If this is the ca=
se, the change should be applied.

Olaf

--Sig_/SxvxvkGtKYBEm1jNYi.ExHB
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+X9fcACgkQ86SN7mm1
DoBnwA/+P1nCOYXsIQg7ROhnP9jmb+hENWAJFRKHUiC3bwFlc08idfA86C+AXmPe
9e2OQsFyGL5dyu9maHkv/y6DbQxMjEO0h4F0c19vN/p4SgluUMNfqF4M0nEscbbx
vtatf5uyTzx/kipv8P2RXaFw7nX7dN6EKLsOcrXHAbQwLC3DL9So2iHpWU/e9RBP
OQAYVPt9404PLFxIrFMTOpF0wnrzvmIhc1+cehUuqUM3ZsGf/xnDhB59lH45aPIN
jiHy9ul2gLP2KgiEU1I9B6YVCpkyVXDQLGs8x/RXXmt2EUr/ao8mcu5SX9g1tLvP
6xit03mLCtxHc6wizY85kqbeiaYDxv5aOYnaXauGEW4Hg9myVupE7F2R4n5+NxdC
Kcy2Otbz0woKlgP0MtOuHDD5uGvRSO2IppmMJooORlbNWSEWfJLk62blz6dvnKWK
Cb0xICH/IwH6Gy+nbuDScZpJRcnw7a9Q7cBG9e+a9obCISCDlG7oVxkTogDuHvNj
0+81WryhhEOo9ORURoPlP3ol1kE/mMpRY/+BKCGb2+VIHYEjbA7Zts5KvJqv4Yag
UfkC6DNMwmZEGVXp+3Rm9pnztAP7Q01xLgyhPD/gXXygO/rLiWQlc5isYdddWggv
vZuULJwri0R94QJyIfiWPxh9DBnvAwC5GrWUnChS0DBrfSsaNZo=
=9uxu
-----END PGP SIGNATURE-----

--Sig_/SxvxvkGtKYBEm1jNYi.ExHB--

