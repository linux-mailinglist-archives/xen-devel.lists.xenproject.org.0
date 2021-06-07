Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6584039D909
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 11:47:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137776.255214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqBqD-0008AY-Od; Mon, 07 Jun 2021 09:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137776.255214; Mon, 07 Jun 2021 09:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqBqD-00087f-Km; Mon, 07 Jun 2021 09:46:41 +0000
Received: by outflank-mailman (input) for mailman id 137776;
 Mon, 07 Jun 2021 09:46:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rwXN=LB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lqBqA-00087Z-TB
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 09:46:39 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28d7cab5-3554-4e8e-ad4d-9376360456ae;
 Mon, 07 Jun 2021 09:46:37 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx579kUJcY
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 7 Jun 2021 11:46:30 +0200 (CEST)
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
X-Inumbo-ID: 28d7cab5-3554-4e8e-ad4d-9376360456ae
ARC-Seal: i=1; a=rsa-sha256; t=1623059191; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OMEeYtL3Y61bqYu/Yq3aMH0KZwPlQd+zkkVc8SH1nOvyPVlxBdKvIRUvoKlcpypaSE
    lMWPBHJilGMrJcuyPjAX1lW9KTaQQr4xUgIjVFUFDE9rSCnD5Z9iyd2xd/k28bv/16aY
    IX4R/syriG/yiyEcXyf2UwkhThSEPK52aWXPvBivH1s9bXftrcl2+qA/tPMi0Si4v3tV
    iGOEPMqtA+J9x1vCTacsY7G0JHbam5zPstuS6oC2K8yNcSqjlsksm0UVTJte1q5rGCbR
    zkp7HxNaYEA93EW5m5KvEcpRIudMxEKgH/aCTzZA7bqiHBcwnf2d05xLSGmML9uWhENj
    oEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623059191;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=x5TqZMYO2YaHiqlYG8OcTHXd7bXqox6fkCpzYX9i0gs=;
    b=Ax8fJ/IeOiiZ1M96nUsDUKwmfB00qXswXh8mgDJ1s27jy+Vcu3gt4+NoIoHYulzIaF
    hfkxB7kD55NJ1OKoycMot8sv+VbFgMjlJIss4Fjqw68s2NY5rxrkP8zyjnR173ErZJ+Y
    zAFr+WW7c6srBV0AZ+AtUEfstna26xGnaS7EFk2AGoZ80IHdbK/74P+O57WNqtLqqc01
    8ztHzbYKaFPu7OhhxoZ7ksP4SjJ+V6fTt8fsTiHhtle4yjBmNkDsKjEAZcgDmJHB0LP4
    FNC4I7oe20D1Aop0H8lVBxWAZOvo+OK6viDlKMHO2jbxyphKG2ZEe6zF8eESSP5qpI+u
    pJfA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623059191;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=x5TqZMYO2YaHiqlYG8OcTHXd7bXqox6fkCpzYX9i0gs=;
    b=bA8PPA1UQN0xkggZebSI8dqg5liIi/2gL8Vd7+wk04C+r7c0RWihSI076WZSJG+1iH
    FyQO7TpWgvDqWdDDFegghokLv99IhtAQ2xnPVyQqk6Dc/QAeDtcvUySa6OIwfh9UBbGr
    MVnYFhGf1hr6lwXQxWnuDdT66anzIMbvdGn6BEoHA/jT7Noc26NHgyjyluqwlzMiEn7r
    HM0jAnLIwkziOe9zCVLMYf7QfQ4DtcIQUGbkbQtFL/xYXWCG5sLejo+vNH3TqY/5Wi9w
    CW8vUAt0poLuMj9yZ7SiwWO5xDeyAiNlUPh15vz6tysH5i1al92b6TuwOe4lmK1sdsJB
    q+sg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Ax6Fb03sCxOoTBq7r1dZtjiRLxxzC79Iv3HI"
X-RZG-CLASS-ID: mo00
Date: Mon, 7 Jun 2021 11:46:13 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v20210601 04/38] tools: add readv_exact to libxenctrl
Message-ID: <20210607114613.220ad144.olaf@aepfle.de>
In-Reply-To: <6e1aed4e-8d32-0711-609d-dfabe906c40e@suse.com>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<20210601161118.18986-5-olaf@aepfle.de>
	<23783088-dc59-abd1-c66c-5fcd314d1f5c@suse.com>
	<20210602125710.0607a985.olaf@aepfle.de>
	<6e1aed4e-8d32-0711-609d-dfabe906c40e@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IfNm_o/I0oK5jv8+7edNemt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IfNm_o/I0oK5jv8+7edNemt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 2 Jun 2021 13:41:02 +0200
schrieb Juergen Gross <jgross@suse.com>:

> Shouldn't you check for zero length iovec elements as in the
> writev_exact() case then?

I will double check if this is a hard requirement.

Olaf

--Sig_/IfNm_o/I0oK5jv8+7edNemt
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC96uUACgkQ86SN7mm1
DoAW9w/8DxBbPQXyrF5ZDekHCvSsyqWFceX4aIAaQNbWgnGigt23x8KYATL+Ak2i
6DKxgkPhC6FzpPy2o63ryvCq1GDIMeoLJuWPh1VcKqMgO+ns6wWId7W/HJobFrmI
SSw2/z6cq+b7SKWFcn824EmKGavv/x2jlVmPhYc5ZeVKe31Gv78Shs1J/b8yJoG8
+jo4SFhhg+g3rKp5pVE6eejbfILRo98RNKnTEOXmdy4P5lOv/1Bm4O/OTDoHjEAA
KH+Gq7R5A7bag9SxLLzbAYtiTUfy1MmsH6AfzorD8bvVLbICXX9bTcpLIvTh2hxc
iUUUjZCk9wW01a9WuP70rkLrPXm0vIYJizOfhu3jl1JBdkNMDq6B4gAKSvrreTJt
cIjE/01iITUkNMxwh2IyVZyEUg0NNCxH/rkSY+rU02S6+Y4GGy+n/1M8xIlEtJ1l
qH7w4BGu0rfsszdUefGPidmU8yfBxreG5ZV5SHY7HwKMlWFZeX87xQ3C98RGSMAt
PR4/bkfB8VeWANnNU/Zx9aHTq6sQUeSpyA+M2/dbbjJk3XJb5CuiUGjmM1hhck2t
C7vtHDE7x8ahOwy/QhNHNEE0O+Tcic1oAgYUq9GGbMaYVyS5gebUBKI+w2VSGWEI
ZSkiEp+EQB/Dxcq2uFMLrCNApYv+JY6Pv7YNdQuTHYz3cD3s/O4=
=JmoN
-----END PGP SIGNATURE-----

--Sig_/IfNm_o/I0oK5jv8+7edNemt--

