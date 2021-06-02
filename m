Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755893987BA
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 13:11:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135968.252333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOli-0004HB-22; Wed, 02 Jun 2021 11:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135968.252333; Wed, 02 Jun 2021 11:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOlh-0004ER-UM; Wed, 02 Jun 2021 11:10:37 +0000
Received: by outflank-mailman (input) for mailman id 135968;
 Wed, 02 Jun 2021 11:10:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NSCb=K4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1loOlf-0004EL-NS
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 11:10:36 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b5a017f-fd75-4627-a9f7-dce388d41b7a;
 Wed, 02 Jun 2021 11:10:34 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx52BAU4Qq
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Jun 2021 13:10:30 +0200 (CEST)
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
X-Inumbo-ID: 7b5a017f-fd75-4627-a9f7-dce388d41b7a
ARC-Seal: i=1; a=rsa-sha256; t=1622632230; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=QJ67uMjAzwlm1Pqb1gbynRY1AdHiAo45tsRhYVIqdSVjyoVyxe12A5rlTe5CwzNiZm
    z0yzetu72A76ixPhyd0scJvrLCbigKCSIhzep37NJopvbOKTC2DXNpuwd+6IkDXaGKOc
    +EZSFDOqrkJ/xE8yCc9xPRIe3LDNdNHFsLRGQ96RoAKGrjWRURljO29E7EciVMSpx8Jf
    5rQWgOm0/s4YUMdelEPbG/Oainejfd/4gu0i68h+Cw+52xPkOA6Ogs6eMFlwsQjBhwQE
    1S/oGEfMh/nl6W6rIGCXb/Lr+geEvq+HVVw+cpQph05WO+jRLwaIROz0uuCOHcy16rdl
    fWHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622632230;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=X0g4fFJHobHi8KaDsVgMN9D1Pgxg0oNLVP3TjEglokQ=;
    b=nO/URN2sLpCisbd3jjEiwtPIksi7fb7B6NriSSWwTgY+fpfdwlRsqCtp7RRX5v9b9E
    w3OLexpVMigl7rhNe90RFBAsz9tP1Db5dPpp2IybM52ZkASDbIYPmDh4Y9Sgruwr6nt8
    WlV+oeT5sGK221/2te/pPoJT8vWz4GtUsYShBtDE0mchFnikei4qdRvRQJP844mKfcGv
    o/ROtIP94DsAdTtNZFLNZVjDWrA2KI9N75oS38GmwMAlUAOOT+NCH5aiI0V1cLt01Hw9
    bBBEZc7UGEJHqSixCbrf/V/wVwUHveRTJ/0uWYDiv9ecwWAIzqq0DGEg5RBozdTzBLRU
    6ppw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622632230;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=X0g4fFJHobHi8KaDsVgMN9D1Pgxg0oNLVP3TjEglokQ=;
    b=Hcp37kwZ+TJygH3vqkc2fqidi3MbFS8CDmx4QaNgOIs2A3CYWWTb0nhNs3rp3V0iIW
    d/idXyArAEiuNobVIORuvo31hvykSZoXbjXYnna+443vr6bysHSIlIfJ0iPGl3bGv/v3
    kKLA5TCy8P+F5gQVdB1NKul511djlArlRg+fKNsHuj4L8CFAnJLyL21t0ach/QBQ5MOi
    MzdMxDD92woyUQ4JdAIED7KbG+nVFtHWXws43CzZpXY0lfK84lgh1bZYRytX3fomEuSK
    4eWTLR/y0kBaI/QsIbYhO0I5TL/aOt8MPODq0b99y9XiEDhSQSWHR7+xU6kfaevBBHgY
    /tsw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9Wx7WbE3s+BU2kLCYUBd7t4vRd/ulzKn4R+Wk"
X-RZG-CLASS-ID: mo00
Date: Wed, 2 Jun 2021 13:10:21 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v20210601 05/38] tools: add xc_is_known_page_type to
 libxenctrl
Message-ID: <20210602131021.094d40f1.olaf@aepfle.de>
In-Reply-To: <f1f00500-f74f-3515-cd46-7a12abdf18c3@suse.com>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<20210601161118.18986-6-olaf@aepfle.de>
	<f1f00500-f74f-3515-cd46-7a12abdf18c3@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l9_w.aGPh=gUYNJCIIDT/VQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l9_w.aGPh=gUYNJCIIDT/VQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 2 Jun 2021 08:51:45 +0200
schrieb Juergen Gross <jgross@suse.com>:

> I think you should not imply the planned use case here. It would be
> better to use "switch (type & XEN_DOMCTL_PFINFO_LTAB_MASK)".
>=20
> I'm on the edge regarding putting the new function into xc_private.h.
> In the end your use case is _not_ to call the new function from
> libxenctrl.


I'm not sure what that means.
One or the other has to be rebased to the new state.


Olaf

--Sig_/l9_w.aGPh=gUYNJCIIDT/VQ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC3Zx0ACgkQ86SN7mm1
DoA7Ig/9EDbv+Xux+TnI2uHADfI0w5AwM5g3/PA57ihWmiXWQIFjTa1mM8QToBLJ
Ct/xm+vX9tLPQwddiid6R96W3fsNezsXYU+KxLhYCo8NH2IZFsrFICGu3+KpTa08
6jJGMxE8hbLPKEcy0YCiZKYmfihUr1J71dO1eAzz93J0eIULGfHh8GskZyBlGp32
IPdrPPxM73lwg4FIxtkYYGU52ChY4JvFYQ9BY062iQ0IhNCRbSiZ3BStrE8aMBVq
2QNSkKidKQ+54cvm26HDpMHc3E+NAuZu6IAPtKtkIzbEQx8U3zh+NOToQJh4a2NZ
gXfYxczeyd0WyRRtBkiV6MNtA6n+lBdFJa6X0SDFLHaIJMBF4ND/z1NIBbVihW9Q
ttsJv7CkFyvFgLqkisiVDnUU2hZd98PPAh48MPBlodZg97f/956Eq3n21qpCJeoW
eB7TrUrb9rrwhTlvOwJ/f0Bq0ZBEb8TTP9QvwWV2GSPW7VZKrdOwaJWzBg/S6WgC
TClrpig32izedEockZ6ba33+Vy/sS83M1jW1G4ye7LOfcG7kkHJIN+d6SQpDSDUO
RS2KsxFHupH34IaH8rJEZSdJFC2t1oMbqbOUodSNnCOaZNB14SiXa/lbgDEkRDzK
ufT2MSpQ3GgpivzZAJt0xK8RgFoquogQ+2RkRL6kXmQBXW43bNM=
=6RVi
-----END PGP SIGNATURE-----

--Sig_/l9_w.aGPh=gUYNJCIIDT/VQ--

