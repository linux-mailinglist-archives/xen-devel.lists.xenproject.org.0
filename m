Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CE03BF9FC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 14:24:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153052.282748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1T3p-0002YN-0D; Thu, 08 Jul 2021 12:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153052.282748; Thu, 08 Jul 2021 12:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1T3o-0002WY-TI; Thu, 08 Jul 2021 12:23:20 +0000
Received: by outflank-mailman (input) for mailman id 153052;
 Thu, 08 Jul 2021 12:23:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Di/c=MA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1T3n-0002WS-FG
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 12:23:19 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.166])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4672edf4-dfe7-11eb-856a-12813bfff9fa;
 Thu, 08 Jul 2021 12:23:18 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx68CNGaDe
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 14:23:16 +0200 (CEST)
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
X-Inumbo-ID: 4672edf4-dfe7-11eb-856a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625746996;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=uEdnSFn26ZNkcVYn2T2Hij0fY7vtwDovyc8xFVQpFsU=;
    b=nZd4a+RohF39uLfIBbgxB901l2FL/z5y0iWHxyRYX7zsyZY6Bm17cTe+tPK5t/epIu
    gL+PtXIvuW1+deANm7sA5sfaaKuyaebN25Kovu6vqrjY3GSDZE9Nc9ynR70ms0LO8UWm
    ek1pyyqdp7THN3M8tThECEp6Y9V6jxq52UlJQMisrdroGytHosc7V3YCcfVze8OUNnNv
    iWoevYfPtx7j76fH33IODgCntp8465gdE2yoiJ6dmw2M3sq/C++pnsoRgY/VfOKaW2Vo
    YhmIBHaFHIqcAuEsHhFZfjKtbVd0lpSEw3I5mTD5P/kHsz8yLFwQ7jMDCk7YxI0Wg51/
    6gdA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Thu, 8 Jul 2021 14:23:09 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] automation: Check if ninja is available before
 building QEMU
Message-ID: <20210708142309.6d093d7e.olaf@aepfle.de>
In-Reply-To: <20210708023224.6c05ff5b.olaf@aepfle.de>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
	<20210707164001.894805-3-anthony.perard@citrix.com>
	<e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>
	<20210707223551.5462c74e.olaf@aepfle.de>
	<375823a3-8b49-7aab-ca2a-af219234b5e4@citrix.com>
	<20210708023224.6c05ff5b.olaf@aepfle.de>
X-Mailer: Claws Mail 2021.07.08 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4h66G54_=6rrJk12_DpTQcR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4h66G54_=6rrJk12_DpTQcR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 8 Jul 2021 02:32:24 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> At least for Tumbleweed it is useful information.

CPE_NAME=3D"cpe:/o:opensuse:tumbleweed:20190730"

Two years old for a rolling release.

Is there any documentation how to refresh the used containers? I think for =
Tumbleweed this should be done every other week.

Olaf

--Sig_/4h66G54_=6rrJk12_DpTQcR
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDm7i0ACgkQ86SN7mm1
DoAakQ//Ugp97vSFJm3a4QapQo+WTiEjVLCNY7s0WofMOttN1jE6l5bnU0TNWFPa
Yr8jRI6+cuZ7LM7wY+ilqwnm6VkoSFh8XOM3zODq/JUoNlCYEN+k7Gjns9HkSrtL
BJMLCFUdjTSZvdj74W0Y0mPyLmposZEk53dumL+NS5qYMnSRN0pQQyS2BvSPIe4K
tYR2UFWuE/ZBRJELRFL7D0OcmkS8yS7WRI5i2gIJWTYLIbWNAhofWrZDEBZuE4Vd
PXao4sDSqHTIozbChaLT/eDExbpPeepDv6Axj0+mPvsW7aVnZitbuwPuMTGoYl/F
+du7tRug2YC2Z70OE5N7ZHZVTtG2lekgd7/jzEt8n66uLgfJT3591TPIRUdcbEGJ
AIKMlKKpNB7Ay6pqSE87Z3WdVK9w+zTOPI2fWgXbFdQXhWpajYubo+g0U0jtC9/X
A9iIYwZSt0+LngdUExSgUNTlUuxedYpMTrsEG6e7BiWtRlT5/UCHI+GO4t1gb3aK
cMhSFgMClbdMu14psiJB1NA7GvZkqZlgSS2PnU7/yNTqHf6ruJ6IrR2e+60Jl4we
evtnZwpJr01qV5xOawpQ+G+PyrywsrnHSEUQ5+xeJaSnJOzRg2vPBE6h1Z7O474+
SZTh6SxxKfXEsbRqP7EoUaOP/s8kkXyjIozyp5DWPynwUpOsuY8=
=rh91
-----END PGP SIGNATURE-----

--Sig_/4h66G54_=6rrJk12_DpTQcR--

