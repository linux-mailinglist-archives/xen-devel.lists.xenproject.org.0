Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313A83AD0CA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:56:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144907.266658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHml-0003wr-TI; Fri, 18 Jun 2021 16:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144907.266658; Fri, 18 Jun 2021 16:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHml-0003v2-Pi; Fri, 18 Jun 2021 16:56:03 +0000
Received: by outflank-mailman (input) for mailman id 144907;
 Fri, 18 Jun 2021 16:56:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ygMg=LM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1luHmk-0003uw-9q
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:56:02 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76209236-7a57-4377-94af-6bf1197b1ff2;
 Fri, 18 Jun 2021 16:56:01 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.3 AUTH)
 with ESMTPSA id x0a371x5IGtk523
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 18 Jun 2021 18:55:46 +0200 (CEST)
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
X-Inumbo-ID: 76209236-7a57-4377-94af-6bf1197b1ff2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624035347;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=TA448Wauq+GZdmM+o1OHTf267x1J8Horm5DfTeI3j0o=;
    b=ZQ4ZTVquUiMk1VdHSoJgLKJwJaa0iBOrqFGq0lmqn/GyXe3ApJ27I7kjqP8tkbC79K
    TafxdQoFcjNWNhfW+Y38s9U8/H8Aqrmj/lqA1rIvqY25uIzqlGCMfDCg+HmXxDiTfuII
    3JOCKwvNDog+X5EbnOjOy4XOBrsX9Oty5NJCoIKxUUcEU7+V/9xCkDMHYGygsqwZLUZ0
    /eFV224gAJu3I9yjqtkRfGRnH7kIb+M5G2rT7IkZrnrTV5rClcqCM90TCd9i1XwCal+r
    eRiWrwnX5nqdWskCGC2JIIYYeglJwmouTal5+a8M/iPg2DoiAx27QzJRqESJELnAKXBq
    jm7g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsVxSIbR7sf0kebs4Z3Zpqv+Sabl5o7CzRq+Ps8Q=="
X-RZG-CLASS-ID: mo00
Date: Fri, 18 Jun 2021 18:55:39 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, "Stefano Stabellini"
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] compiler.h: define CONFIG_GCC_VERSION
Message-ID: <20210618185539.491fc904.olaf@aepfle.de>
In-Reply-To: <1a3b3a14-61e6-c805-78e4-4b1dbff322f3@citrix.com>
References: <20210618164207.5111-1-olaf@aepfle.de>
	<1a3b3a14-61e6-c805-78e4-4b1dbff322f3@citrix.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w2c4J=kHxKgrAPpXWcZ9SnC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w2c4J=kHxKgrAPpXWcZ9SnC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 18 Jun 2021 17:46:47 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> On 18/06/2021 17:42, Olaf Hering wrote:
> > Fixes commit fa5afbbc20ef3577c5338f9d0b24dad45cef59cd,
> > due to lack of commit 534519f0514f52007d504e0f2eeb714de7b2468d.

> Presumably you're intending this for Xen 4.13 and older?

722f59d38c710a940ab05e542a83020eb5546dea without the required changes exist=
s only in staging-4.13 at this point.

Olaf

--Sig_/w2c4J=kHxKgrAPpXWcZ9SnC
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDM0AsACgkQ86SN7mm1
DoBrbhAAj93d/CLPmBqP1iDiqNrAm674ZbyRYtcBQGUDrHcGNEKuqJuW9x6hCVrg
6B/l260mB/kcgv6zbPk2VnjcixTNfjo3Vd2g/TzRolQ0vfqo8W9x1FDy9eT0qQqx
/LNdaaZXazfWrYynhB58DDABBr+TUAeU5dXizp5lmTBSP6cl3LVcEeZKC+tgB0kJ
eQIcTkble9rSdVcUrdDunW0Tov+cU9PQqr6zgsmPXr0SLC7LP1CjTDkFhodAYl/w
W9NSjV0KxHLMnmIn17R8KWidLn8UUn0y88TSmf613UfuSBS3ryZxLn8JG9doSI5P
wFU2FzlnKxSzR06CYfgPf+ousJ0EUYXmIshkZOCkOR1CUEU3zdraxnPHlo5UTgCz
1UF980rB5ntrlraOvQtprx/oGHyVsPAa/bQTOHPzRUXB6w/isJAa4iExd9PM23xk
DaH0YONEOiT1RFXW5w8NReR59vH/c3y2Y7MzDtdHBocBGMDtFCHsKMiQCl+o9pP5
03plJ+BUzwXn5mgAeKVs8ZBdg8BScwinIj7a29RykwOwzXWOiGV2J3K8ohIO/81y
u2xsB3/i4vGBa48c7j4OvOK1OoQkZrbZprGMhOpdMidTxtAwPL7kJIUZrDx6+LlB
YagQt1tbeiMFsADFSJrZIlBeVWkx6VBrwMNGSgPSo7OraJOnpdA=
=ZBy1
-----END PGP SIGNATURE-----

--Sig_/w2c4J=kHxKgrAPpXWcZ9SnC--

