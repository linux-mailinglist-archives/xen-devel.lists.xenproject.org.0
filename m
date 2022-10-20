Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A806063F0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 17:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426912.675688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olXEV-00005V-2x; Thu, 20 Oct 2022 15:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426912.675688; Thu, 20 Oct 2022 15:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olXEU-0008UI-Vd; Thu, 20 Oct 2022 15:13:18 +0000
Received: by outflank-mailman (input) for mailman id 426912;
 Thu, 20 Oct 2022 15:13:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FG6W=2V=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1olXET-0008UA-Es
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 15:13:17 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b83cd05d-5089-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 17:13:15 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 48.2.0 AUTH)
 with ESMTPSA id z9e8dfy9KFDD1RW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 20 Oct 2022 17:13:13 +0200 (CEST)
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
X-Inumbo-ID: b83cd05d-5089-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1666278793;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=WRYwxSjI3fCCW9kQyLlQqS00GsQBKloy3nUEzOqqhr0=;
    b=KIQ5yh0Asyfp7rVpFm2um9ejkqkt+4DMB7cUwKt74xPv0OBqISn3Mwp28dKQeCe50N
    8wt10cINDnuCwiXoykyU3RPEfLvrBJXiwE8cgQ21vmem5tvwCVz0nc8u1rmOg5Xz7Lat
    FRurzENpVg9qgKtlyYpZ01Z2Clsf8+wtmb8k93M2ofJhv/ICwARHbGpq664y9YGvgjGw
    62rFvWRTGoSxUy2uSfZEbgeR41QkYSoTHkn3zNGkcaKsS2zWknfrrEYxK6MqrpvRRKOc
    fEj8Xq+t38O3EpUYbVDarRFZWpUXME/c45fPHmR2VoG5V3aChv/b2bjj8f8OzKK1Jy8B
    Qb4g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4VUeIOBm64+d+5WUw9HQ/QxYfWfC38zdrSEMTow=="
X-RZG-CLASS-ID: mo00
Date: Thu, 20 Oct 2022 17:13:06 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Denton Liu <liu.denton@gmail.com>
Cc: grub-devel@gnu.org, Daniel Kiper <daniel.kiper@oracle.com>, Oskari
 Pirhonen <xxc3ncoredxx@gmail.com>, mathieu.desnoyers@efficios.com,
 rharwood@redhat.com, samuel.thibault@ens-lyon.org,
 debian-bsd@lists.debian.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] templates: introduce GRUB_TOP_LEVEL_* vars
Message-ID: <20221020171306.45c275f9.olaf@aepfle.de>
In-Reply-To: <Y0+CzFbQXxYiqgPC@generichostname>
References: <20221017103532.845293-1-liu.denton@gmail.com>
	<20221018131235.5e70f0bc.olaf@aepfle.de>
	<Y06w0Oda0sHTHPNW@generichostname>
	<20221018161821.149ee6fd.olaf@aepfle.de>
	<Y0+CzFbQXxYiqgPC@generichostname>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WRwpODX/p.BTjC5WHi9/0jq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WRwpODX/p.BTjC5WHi9/0jq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 18 Oct 2022 21:53:32 -0700 Denton Liu <liu.denton@gmail.com>:

> On Tue, Oct 18, 2022 at 04:18:21PM +0200, Olaf Hering wrote:
> > Maybe the patch description lacks a specific example how the proposed c=
hange is supposed to be used in your environment. =20
> My patch description says:
> 	Introduce the GRUB_TOP_LEVEL, GRUB_TOP_LEVEL_XEN and
> 	GRUB_TOP_LEVEL_OS_PROBER variables to allow users to specify the
> 	top-level entry.
> and I'm not quite sure how to make it more clear other than, perhaps,
> explaining what the top-level entry means.

After reading the patch again, the newly added documentation states:
"This option should be a path to a kernel image."

I think it needs to be more specific: is it expecting an absolute path, or =
just the basename of the desired image?


Olaf

--Sig_/WRwpODX/p.BTjC5WHi9/0jq
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmNRZYIACgkQ86SN7mm1
DoBewg/8CgSvlpBoJ4+VNyZOEvHOQF4y5qQkB5WhitIv3GmEztNrEYtLe4lo5MYf
q/TcIK1B5VMo1axI8E0YZRvDD2e0++DaBBVH/8+MokgLKyMTHRuLAVwwxYXLdHId
hnWjaB19Z8pJSXddeoDxg0WSDZI881478+zoKA+oOaQPRX/rkxYQ8AodEgPnNNk8
n747EzPB0rFGhVS6/lPJKWrmLJeApr8LgDmhKao/ECrfoekQGxfGTYoPWrFnA7Fp
qS/cHBd/cGi6NeCRay6zGgmMQn4B6CqRy62tozAEUS9W9lvibFuL2poH2gnUBflt
WCmFl3K+2CHTZwXg0SQ24LOc3JW3OPccOZMGJoMIGnHNWx9PC6M96/lHNn+8l+jy
mYqyggMvfFYJCI6eHAkmCp6/hTamSDFWpRKjm9HmVdcSuoYSNIp69eJulAkVewjO
AJd0vrqe1k+Qfdl1H7x31+iRKvw4nwdsZweSW8sVG7oHOuQS9Zj/w6C6NtDNNvc5
BB1P2XUgrmKkJxm+b66KCUUAB6N14KOBmHAIbKeqJ7j6xRMBi1s+9bkz72zXxX//
HiX0mboyTHE1hUHCSlnZmkMkO7dEsfGXC9F2KHEKulSXXuo64lByjRltcQT5C7sy
p+P616d6yKHk1GlDGX63q6T9za2mmcz/y+g+n6DDlEGnH4+x/2Q=
=eJ4i
-----END PGP SIGNATURE-----

--Sig_/WRwpODX/p.BTjC5WHi9/0jq--

