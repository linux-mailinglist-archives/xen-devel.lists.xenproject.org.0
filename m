Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F570073C
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 13:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533802.830753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxRJn-0004ZX-TL; Fri, 12 May 2023 11:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533802.830753; Fri, 12 May 2023 11:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxRJn-0004X1-QU; Fri, 12 May 2023 11:52:15 +0000
Received: by outflank-mailman (input) for mailman id 533802;
 Fri, 12 May 2023 11:52:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Uaj=BB=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pxRJm-0004Wv-0P
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 11:52:14 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.167]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e52901a-f0bb-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 13:52:12 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4CBq8JPe
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 12 May 2023 13:52:08 +0200 (CEST)
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
X-Inumbo-ID: 6e52901a-f0bb-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683892329; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=M4ovsXlVQlninO635eY0mKR8DuDh0BZQlf38BK/4NTBcRQj4b0Knz2L3molYqY77lU
    NLCLi+kfneJY6CnaEFsUDOC0IBlDGci8HuzwvgxoFfmvMXL6+dX5O8yMIX4+Ykrnlr0O
    Ns7v6eoWEDv3h7+xqaHn6p7qm5ZEm43rD7S1Uk4vETJcwK2Kwz7DQ+4LNOrKYkew7lEM
    E65gm2mL25BC7h21VBM9qeJBOHd67y4AuUtH2R8CQgfUVSmMRSniqG1vTx+d32isF7lG
    aLjo51pF6tmZMhA9h3NCJjifcTzObQMVvhE8vWwCP6pnIx9XpaZazaxI79xu24ITYxfb
    d6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683892329;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=4pO3OeqHNQDQyAaWXS+vdNOuErKYYtDSH/h/zsSid+E=;
    b=gqOFTSO+w3MnjYmwnNWfwKOlLE3UyOK5JFvO6vPsLM7vQ/sl9va5mX4H9fsl4xrjpp
    S8FdvkCCFnbNqRt661ua17QTnF/eUgQ1BXP1mUaeJcc8b+/4GYuMGrxhzKjETjyjcJwL
    /e5D2wGUZhr/UJMu0AVBcBPIWujrjXoRl2lkM2RyzZGWwqZapatfzUE5E78cP4lSbVOi
    n/q0W634+kPFWfx62vimGJmBEkbC7e60yFVfGGq0ZixwMKtPZqCPPBLtJYug76zFuplx
    w944s/Cuhzb4VQS9S8hXVQ+HYNjk+CfRc3fFsZEsTMYZfkhebFUJFIaA13FZglu8gr02
    NtiA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683892329;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=4pO3OeqHNQDQyAaWXS+vdNOuErKYYtDSH/h/zsSid+E=;
    b=XfiOgOAlqR66VpE9RVaz0JMyxzuZkwZKlNIz7O84eknEqLBdAWLTg2UVY4+TE2Okep
    9YRx2mvgViiPMs3vmFPcf4wFTqEsDkZCSUwjmoiSfN2P4E1VgipzieTzkvunDM0TsEl+
    o12+u5bjg2uvyWbYRyG6x/vj1LLF5BquvmtVvEC86mIiN1aoAauHOk9Inj6kmV4Mugqn
    cYVXxQjuIryCaW2GvjsqkA4bjAB5zvvrA0iWr96STlioy3xQEJMcfJPEaynfA3Dx9VPL
    2JG9myK8gktv7kTPNix3Qz6zJJnvRiYlX1z5rgim45DR38FvxgDKcE1lgOhgFdIjX8yK
    N1nw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683892329;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=4pO3OeqHNQDQyAaWXS+vdNOuErKYYtDSH/h/zsSid+E=;
    b=AWsNT7YRCnt3GpKkb1O7y6HbyaXYAqOcHK/aqS5DSQvk5cSnGc+13zA0pDuv05P1+Y
    8ZOg2mo1/zo5waEXRcAA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4ARWIYxzstZKeVom+bauo0LKSCjuo5iX5xLikmg=="
Date: Fri, 12 May 2023 13:51:55 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools: drop bogus and obsolete ptyfuncs.m4
Message-ID: <20230512135155.07157aa8.olaf@aepfle.de>
In-Reply-To: <9fd06ad0-4c21-43be-ac48-8d30844535ad@perard>
References: <20230502204800.10733-1-olaf@aepfle.de>
	<9fd06ad0-4c21-43be-ac48-8d30844535ad@perard>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AMegc+nWY52/.ERzMOn52x4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/AMegc+nWY52/.ERzMOn52x4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 9 May 2023 17:47:33 +0100 Anthony PERARD <anthony.perard@citrix.com>:

> That change isn't enough. And I'm not convinced that it needs to be
> removed.

You are right, the provided functions must be removed as well.
My build scripts do not run autoreconf, perhaps it is about time to
change that.

> First, AX_CHECK_PTYFUNCS is still called in "tools/configure.ac".

This needs to be removed, yes.

> Then, AX_CHECK_PTYFUNCS define INCLUDE_LIBUTIL_H and PTYFUNCS_LIBS.

This is used inconsistently. Some places include <libutil.h> unconditionall=
y.
-lutil is already used unconditionally via UTIL_LIBS

> Also, that that macro isn't just about the header, but also about the
> needed library.

This is already covered.

Olaf

--Sig_/AMegc+nWY52/.ERzMOn52x4
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmReKFsACgkQ86SN7mm1
DoDXzw/+PKZdb1Z6tmsIT+GDx+aWdahQBGnmiRCF76Nx1HkBdkpoCA+cnr91uggy
rlTUaZNnTZSw1ie4rYLslltccr830w76BbmFLRjGPbznRlGgGFD44ZdK1axPs3yj
DeXzorWmxd+qpZApwWwnZXmbsq//a27s78XR7pRkegzTuvB9e+ZoZZDkhJKlTBgH
5VgSUrm+C6oEHq0UmpWgTecmJZecLpTQ2ZXZ/FnrI2UiHPNMJfBStpIVHW9akAJc
YyLrvlHyJsOXFwJhIODH2bn1gSoEiAp1lx5LgRxq1/W1XI/Es2Oebm470Z+RzHuU
7Yw1auxhV5LqRH65U0CqcVhk7fcnWfhXkXnmfntrAmzv75JzITFZwJrCkTZxVpJI
DZ4p2uq2VcO1pW5/rkV24EvWWm6In0rH5Yv9+PMp6Qo7OGlO4Bdu3OKEUEuls5vx
YtXyO6U3aTryiEaIG8ASLD51uK5j3cBRM+GMEp02uKmdDrvi2cfJQ9nR5JNq3a7p
dGGx02NMMFPU++wd6K44aM62cI5a9u8mDEMErShSBV2nfpTw6a4xU8CDJkyWS/qm
Qo1qGf+HvfoHLACGmtwsmrZFSYkvNzQ1w9gXr9q9Rg2qNPgcASa9LtnZ/TK1rrPG
OZtanD4EHPhqYG1DH0N6YvgAd/pT8vIHaRXft3Gkh1t8Mt3FtOI=
=5Rp/
-----END PGP SIGNATURE-----

--Sig_/AMegc+nWY52/.ERzMOn52x4--

