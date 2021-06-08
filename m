Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC5A39F189
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 10:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138353.256138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqXZQ-0006p7-HJ; Tue, 08 Jun 2021 08:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138353.256138; Tue, 08 Jun 2021 08:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqXZQ-0006mR-DV; Tue, 08 Jun 2021 08:58:48 +0000
Received: by outflank-mailman (input) for mailman id 138353;
 Tue, 08 Jun 2021 08:58:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8i+T=LC=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lqXZO-0006mL-VX
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 08:58:47 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.22])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b266c42-cc0c-4775-bb47-177f65848a84;
 Tue, 08 Jun 2021 08:58:45 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx588wcO3l
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 8 Jun 2021 10:58:38 +0200 (CEST)
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
X-Inumbo-ID: 2b266c42-cc0c-4775-bb47-177f65848a84
ARC-Seal: i=1; a=rsa-sha256; t=1623142718; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tHrncYRAKScC/rS6AvJ8pgIkr7Dp5hrklbWx4Yk8N42dbND87/ppatwJn02aZgghKz
    RVoV/De+nL43uFjxpuSEhy2Szdgex3LCv91C+jymcjjPkFhxaNEtqDNQePvmX/8Pf9Ns
    4DsgZ7b36QZALHDnUuJLXf39Es56T1tcPrl4N+8ajdKkVEiVEkIu3Pdf+tw5coJR3j+e
    MQN+3Zj0Yw40NEyBmfaj6q3nES2DwA/NU7w5gkTdA0LjXJABzZm2SiWu/AcgR7QV6QXl
    CZG5XebefBtp5WaJJkZur/0NQ4DF2PvTWE90ZDAGljbIa+Xz9G5rYD3B6f8VU+Qordx5
    G7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623142718;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=n2fK7SY8CYLcw3DiaNz+QWL9iXCZ0ET33d9Wu+xMRJI=;
    b=m0epb6C5p6JSTsecJxpHxc9zx5fVdt6aYAB9JNXM1EBO9htYx+kmHDuUem5vnDNK6V
    LDeG2EJlxTSEGPR1hnsNaT4LVzn1yGJlj98zLYMrbzLh0kVc4dJ0MnC0jazM9mvthfMN
    XmVRAFLxteoYhSXQYtJUbgtHMwAwBN1KAZcPCT9pWbUmfdJRsmtncnxQWlvDf8zedgkH
    mbA50cPPbUw0AjU9E6fY464NUvhWhZscSp5tuzzJUmZyt9SzkogxQL0GLrSND+s/Xp1r
    I103bjNCLHcJLo6b2qSRDtYd3fS4GdtJYfzB59UXQhBHKTqKL5sLSStKhMR6wUnt5ogT
    s5NQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623142718;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=n2fK7SY8CYLcw3DiaNz+QWL9iXCZ0ET33d9Wu+xMRJI=;
    b=sB3ZkFwvNpuEMUWETSLduRSF2mtbivBAWl/umR9f+0yF5O4Ox9WVDq+MiyDPWgk1v7
    /RKPjjE/K2ku8xBnaSMFa8WPHR3jEzD99TgI91Vo5dw3nqotAu+9khzhFPEFNfrV80lu
    jihZSCxGxUMFzUAM1Vgk2Afjqr2e5uVZWUKezp8i2tf/Mg+QMICF6GAoMNWpnxu8gYYR
    H8spXlKeWvoFV5SKKwh+EgynGcZADSIBQYCwCQE4wzlaI6teQHWSSVHSRUxzayK2rtHe
    3j/YAI54tu8dw2rAnp6yi3nq31oFJZw8usM2WkNK1tldFJphw4qkUR83wC4R4pxl8lrj
    5oSw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Ax6Fb03sCxOoTBq7r1dZtjiRLxxzC79Iv3HI"
X-RZG-CLASS-ID: mo00
Date: Tue, 8 Jun 2021 10:58:24 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v20210601 08/38] tools: show migration transfer rate in
 send_dirty_pages
Message-ID: <20210608105824.0b0071dd.olaf@aepfle.de>
In-Reply-To: <42844bc5-da7e-5f6d-1ce0-1ef9e0f9dea6@suse.com>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<20210601161118.18986-9-olaf@aepfle.de>
	<42844bc5-da7e-5f6d-1ce0-1ef9e0f9dea6@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZWolvf10tIqcRa+Btou92v2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZWolvf10tIqcRa+Btou92v2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 2 Jun 2021 09:10:44 +0200
schrieb Juergen Gross <jgross@suse.com>:

> MiB_sec =3D ((ctx->save.pages_sent * PAGE_SIZE * 1000) / ms) /
>            (1024U * 1024U);

I'm not sure: how does this improve the patch?


Olaf

--Sig_/ZWolvf10tIqcRa+Btou92v2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC/MTAACgkQ86SN7mm1
DoCoiA/+OtYu0+esbUO31sQbhRIgpzkegtKjIHIygcfyt8dKu+DhLegfm//y/bvS
AJKK7x4HMfiYnOz7J+aE7+AF+wZOOLZG42jnIKOt8G2Y0UdcZVO6IYxpNk1TVOaY
oiVs+gOV8nWQasrLz1alnYiErKHmJZvaN5vmH5OxcntGOIrH35O1WnPkAEZXlJAU
xT6ct7l1N5rGfO8lrRI/OI8eTEka1wkWB0UH3o6jBES9Cl1H6rEFgGXGtwIUY84Q
I4uJSiscJwx9DatZUo13VkZf9RjCYWsUUKBdnqt8+SrANp9iM+YzdFV0XtP3PT93
1uArJ99731ZsfKUcMTi4oZAVqdgCOc5/mwNUHUb2oepb5AI8WAPqDczCVDAgdvOq
3jgIzsu9XAqc6rnZbMRgfbzCMq5jzbwnaZPdJ+f/Y0EYFN3CcQzlSTiVX8gSD/C/
WDY0R7oc+iTRRBoyTLh59OGevMGP5R+dy7hLdG+F1pDB/ooAasuoezUGk19toV1d
zfDbmhnBr/M/FceCDUV8I/mCOwKYFWxt8UJHvfFp+XtcCOBuj1F0in82/7vBQ+9P
dDYqoX8e8U0pFCTCOanPxMXKWouRMteuTlAqDjzxuUqgO2uSG420NWtrzA96LtxZ
iVlzUgr0SPCO7Vtp+AK9YJ/xoX+R7GPvWfgYpC9kXRPPORFsOw0=
=MKay
-----END PGP SIGNATURE-----

--Sig_/ZWolvf10tIqcRa+Btou92v2--

