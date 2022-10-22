Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999EC60851A
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 08:29:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428109.677939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1om7ze-0000jS-U5; Sat, 22 Oct 2022 06:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428109.677939; Sat, 22 Oct 2022 06:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1om7ze-0000hI-QR; Sat, 22 Oct 2022 06:28:26 +0000
Received: by outflank-mailman (input) for mailman id 428109;
 Sat, 22 Oct 2022 06:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=65bH=2X=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1om7zd-0000hC-Do
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 06:28:25 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba7b6a98-51d2-11ed-91b5-6bf2151ebd3b;
 Sat, 22 Oct 2022 08:28:23 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 48.2.0 AUTH)
 with ESMTPSA id z9e8dfy9M6SL7by
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 22 Oct 2022 08:28:21 +0200 (CEST)
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
X-Inumbo-ID: ba7b6a98-51d2-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1666420102;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=23FJD2PUTBFkSkSRbZ2gtwNWOatC1seYKW6e9NyIfzY=;
    b=pkOhad0GZNO5+6QCReehqHDtsYvRdRydcvP6dgfk8FiAs4TkrngDgHanvZJ7DKfWLr
    apqElnGt10YJs7Ylv1gB+NZGLQV4XTzOm1dS16w63po86pmKGAfjJJ7IKB6VpyK5DBuz
    mo9vfwKOK6vqTaaZD7/iHC0mdPHsFFhze35/bE2EyvmEJMm21Dhf8wdgqeDdTWkCfEMV
    hKFw1SACmQJ06Wvc+/kGDoid8dFVfzyR9F8+weAZYqvKjzkAmsH+O2IG8r7HjBjZm1k8
    xjC2Rrtus57bc1PwjBTe1n5OYrg2rrmnYnu+23y67rTOOictHZlacpfw23itA6e7BC9d
    Uv+g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4VUeIOBm64+d+5WUw9HQ/QxYfWfC38zdrSEMTow=="
X-RZG-CLASS-ID: mo00
Date: Sat, 22 Oct 2022 08:28:07 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Denton Liu <liu.denton@gmail.com>
Cc: grub-devel@gnu.org, Daniel Kiper <daniel.kiper@oracle.com>, Oskari
 Pirhonen <xxc3ncoredxx@gmail.com>, mathieu.desnoyers@efficios.com,
 rharwood@redhat.com, samuel.thibault@ens-lyon.org,
 debian-bsd@lists.debian.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] templates: introduce GRUB_TOP_LEVEL_* vars
Message-ID: <20221022082807.35eda90d.olaf@aepfle.de>
In-Reply-To: <Y1NpQKadAS1EgY1c@generichostname>
References: <20221017103532.845293-1-liu.denton@gmail.com>
	<20221018131235.5e70f0bc.olaf@aepfle.de>
	<Y06w0Oda0sHTHPNW@generichostname>
	<20221018161821.149ee6fd.olaf@aepfle.de>
	<Y0+CzFbQXxYiqgPC@generichostname>
	<20221020171306.45c275f9.olaf@aepfle.de>
	<Y1NpQKadAS1EgY1c@generichostname>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pazjidgh6E1Mr6=hT1MRHjX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Pazjidgh6E1Mr6=hT1MRHjX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fri, 21 Oct 2022 20:53:36 -0700 Denton Liu <liu.denton@gmail.com>:

> Thanks for the feedback, it should be an absolute path. I can submit a
> new version of the patch later. However, before I do so, are you still
> a NAK on the general idea?

It is not clear to me how useful it will be in practice.
In the end I have no saying about what goes into grub.git.


Olaf

--Sig_/Pazjidgh6E1Mr6=hT1MRHjX
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmNTjXcACgkQ86SN7mm1
DoAUMw//TcGWCOQNUSJwXET9QTk8g5aFUsxP+XT+WNCNq7ZUfzbN5qPWZMTrfm6A
l6rO+N0+Rg/9XNGFCVzVPPf/RXxxBRPnQCEnBMwPqVqKzY+xB58YhKu7F5vs/clb
rVnz7upVLrFnEJ33kmpzLb0RHiwnwht+xzpB8d3iEs3BkUIhMYBLjrwg60nBEWtj
Y3cKltJb3Vol02ay4IT0K29mgCYXRj/nniBsMAkhFzzXfaJHi2v2jjRtjmq6HMW3
fNZ+OyjCj6TtgxKTorTBVs5QBV6JJ35+RwY0nz3XMofl9vWJxRp9XEr/rO47u6to
8y3BWOIOUWN+T296NdeNlVsyK74Nfaeb7Phkm6dl6EQqTYP932Pq3d8y+Cw555oP
CVjnCxIajHzwZBQKrFgARAkBS81/g6gRnWTLJBgXK5EQod5yO9pHX/S/BaVORiDW
Mmb4MnhU71zzDgaBFrBefKL2Quwkb8XENIHw6dm8dep5lLLURWE8rs85QhEmWl/r
afqrsFzlLE7lujnhe9HkWfUcl317fqZq7Ockizp3FKhZSqyohX43hMR6AJ+ElhuP
2J/Vj1Eo/xqaqHTMS2ghSpb61PkpVqJ0Vp9gy1Hq2Q3i/u3F7hF4q2TsT8XoTVap
7ZYHPjyT9Ipj+5bO/j+Zxo0jnQceBfkw/3gohx8vk6nzQA6K1fg=
=5hVy
-----END PGP SIGNATURE-----

--Sig_/Pazjidgh6E1Mr6=hT1MRHjX--

