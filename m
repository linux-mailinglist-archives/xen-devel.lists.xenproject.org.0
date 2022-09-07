Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F52C5AFDCF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 09:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400869.642497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVpkd-0000e0-Qd; Wed, 07 Sep 2022 07:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400869.642497; Wed, 07 Sep 2022 07:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVpkd-0000cC-Nx; Wed, 07 Sep 2022 07:45:35 +0000
Received: by outflank-mailman (input) for mailman id 400869;
 Wed, 07 Sep 2022 07:45:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLSb=ZK=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1oVpkb-0000c6-4v
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 07:45:33 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.161]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c62ca94-2e81-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 09:45:31 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 48.0.2 DYNA|AUTH)
 with ESMTPSA id kbf492y877jU4iv
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 7 Sep 2022 09:45:30 +0200 (CEST)
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
X-Inumbo-ID: 0c62ca94-2e81-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1662536730;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=3oYASW2oOvp5ZSqE2wNF0GMpMKlbg6LEKeaYP+T53Yo=;
    b=RXbXO5/xLgA14GfukLYniz2E+kYAoZ0t0KGvCe3ULol5NhsKKHtSjk3ujt2gebmrXM
    yfXg6ffkorWe4scsFKtJWnws0uC9p4EFzi3TFHmHck+iGVqXcJK3B4zZik0XlwzN3k+a
    YLXFv52OWXy7Rgvz0+0PGG4m1Caacr76N59hM9rB3tNU3L8dPY0d2PQQSC7rW6L4vA/+
    6XGrXWr4zPBSl74SA5BUT4on8pYJ5ia61dQUfwPgXLGY1/D0JIFAeG2cZnlEHRiv26SE
    CSNExadbGt82meCqGwjVISUp8AR6vUrv0CZXiQBSFh4jpbkcpi2zVdpSdU/5KDOeTpgh
    4/Bg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX7VVMJ4sZGMpT3WjYz6"
X-RZG-CLASS-ID: mo00
Date: Wed, 7 Sep 2022 09:45:17 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrei Semenov <andrei.semenov@vates.fr>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] live migration: use superpages for physmap
 population on restore when possible
Message-ID: <20220907094517.218e8709.olaf@aepfle.de>
In-Reply-To: <c21d6f74-a05f-e121-3b3c-c8c7fd08bb58@suse.com>
References: <cover.1662457291.git.andrei.semenov@vates.fr>
	<657d6dad39f4ab87569470c94afb4cc6d005e829.1662457291.git.andrei.semenov@vates.fr>
	<c21d6f74-a05f-e121-3b3c-c8c7fd08bb58@suse.com>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//=JMiy7LvXxzVe32pVdpQkV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//=JMiy7LvXxzVe32pVdpQkV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wed, 7 Sep 2022 09:40:41 +0200 Jan Beulich <jbeulich@suse.com>:

> Olaf - I recall you've done some similar work before. Do you have any
> thoughts here, perhaps going as far as merging your and Andrei's work?


I have no hope that any such work will be merged.

My variant is in the archives, for reference.


Thanks,
Olaf

--Sig_//=JMiy7LvXxzVe32pVdpQkV
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmMYTA0ACgkQ86SN7mm1
DoDpuw//TZNxUdK5WZyoxIXTBtHTsIcmx6Xv7EtD5KUz2t0eaUBUGZap8QIGEL5p
GLViwIBNRr+hC6pihinT88jPH++gBYHxbzBQgiINMrnRDIdeWLNGrFqnYQOS7Kah
8Qd8r5ORqVlifwgVfqEiB4mkTUKxS4mcMtDWO93yk/w+q4aEbLJ1UGsfB0dK0zU6
Gh4cZOSOLCOhgXlK1ME4WsJsabTcGTOeF/aZT5IhxWW74zuMIcHZxH2RNV7uxuvT
nmoahUIGI/LKGeo6u5izNK8578u5ou4Mwsz1c0t0H44mrTYbWIBGfv1lw0BEY0KK
9uUONAjawH3gDbchx2LpZn7ryKhxRZhKiitXUdr++aCEA24ikFp6mi+KgCsbYWmc
wGyjLMApurJfHHse6/HOw9vJoXjgVFswEJkvWU0d5jez3ujcOz16bt8uxsKvwOi6
KZAolTowSsPCAbViz8cwPGByHXeRsk+ZQCjLOPuR0df96hSxwEql+fW4n4Xw1pWS
4awdUL9vPikougDvSB0sxfgFn8fmXoddh7IEifvyfM0Me/RWZEOyTauwo+CSvdSy
8rs09nw6y/BPvQ+gzZlcv4ExnnnFDMU9YEh397aSznkxP3GjAJn8tvngtihNAOVN
Fmi622GuHxKykea94nyhouL4IYOzzrTHSN/j0wOPit3hN5I8hh8=
=WWux
-----END PGP SIGNATURE-----

--Sig_//=JMiy7LvXxzVe32pVdpQkV--

