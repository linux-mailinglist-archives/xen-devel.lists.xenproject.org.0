Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B291E7F51D7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 21:44:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639160.996150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5u4i-0007xO-Tg; Wed, 22 Nov 2023 20:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639160.996150; Wed, 22 Nov 2023 20:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5u4i-0007vI-Q6; Wed, 22 Nov 2023 20:43:56 +0000
Received: by outflank-mailman (input) for mailman id 639160;
 Wed, 22 Nov 2023 20:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOK2=HD=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1r5u4h-0007vC-3B
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 20:43:55 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8adae74-8977-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 21:43:52 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 49.9.1 AUTH)
 with ESMTPSA id g1b15czAMKhnsMH
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 22 Nov 2023 21:43:49 +0100 (CET)
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
X-Inumbo-ID: d8adae74-8977-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1700685829; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=oHwnrdCOCkELk78QRCynYD99+vJxOGQcTt4rKC9uiTwfnrvm+P8R5RZ2vMSsLdDXBC
    5hcuMY2WWLWVBJc08VGjmv09T4aPNJ9W3r3WV3ZhXB1eVQQlm3KYTtir8iLe9Y5rXqDk
    6b+bLigI8qspmOv6M9Puzn5Nz12DsTBAk5gh1hM+LjqPynV5we0VA7FKqnCqpZvrsV2f
    W3kNlLRMvz8TThgqOqZKLbvt3BOjTUZ92X0PxwC2xDCuq+HUMWi6J0kgxAD9RYBfHCUX
    k/Elk/KzqiX7sHjlMgAIUR3Mty4Ap3d2/zQ7oWNk+LAaabEEe5lZoQNk1iX4cZJsYsmm
    bEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1700685829;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=o8RbQ7UT2N94YmuJsi0wN8zKs4jduT8EtdlxcwsUVCY=;
    b=UjuijLKxpw+9cock20busDzmrgREVJwGbOj52DIGjlY1mq+zUPAZvUSXkNR0UCA2YC
    fUXc23tB97lvs/+A3+PERCYBAAGFrCu/h1ArqYZPIb/0TO5RyJ2bFTuqAsnfFAbyjx9u
    z6907c/OFTL/rp6LmfRmW0E6IrdFnrY0rcKeUpU9RTKc7aOez8qOkznoj/H2aNZzRzC1
    C71LcJy/ebV/hx/qZJDHY/1i4ti3/+Ik/nk8AiAhgWUI/F8ZZdQLLA3+yNQ9wLhFtDuG
    7pJugBWpFLf+aHZ7Z68kVWJCMCP/xk0VDGSR+57bhySw0vLd94RCQpgG8ZFzmGs0WinR
    bfRw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1700685829;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=o8RbQ7UT2N94YmuJsi0wN8zKs4jduT8EtdlxcwsUVCY=;
    b=kR1I9x9LWnFqo2Jj3OJtIHJCW0JE7g+Y6gWIxSlRuF64hT0wrwdonDW51Ow+Qqtwdr
    5LdMPRl+Gff8MVq8FDqBQEAJWOU1TajVwgtxXN6Zh6585joo5cuT+jSRhsSPTzAOhXNh
    oDzyIl0iytlGHFNRYiXuQSYkaqkLdC/KRQFgjF3WuZ8CkdUj+4aRGuClExCuCNMUUP+Y
    ym2QL9mv3c6U021wgUJjWHEbeZkPpySd4I1fN1XjVtNSK18dyOtRRLTrJiWH3UXK+OYX
    enESvL82O/HA4WN1Z3wG+FZs1mgexbBujp7yqYABRNsjXKv1nEwiW0VyWu72lKK/mUoj
    6ftA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1700685829;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=o8RbQ7UT2N94YmuJsi0wN8zKs4jduT8EtdlxcwsUVCY=;
    b=YrbzV6Zqb8QB9ZxqUnx5ORJBKZv3Uogrw4LmKzg4kASw3Kq1j8rulPbtj0W2eLdRmo
    8fHKFj2u410p+UMFhJCg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5VxOIOx7sW7Yq7k+0gzUhLCSnSrvMYFPvEI3Cdw=="
Date: Wed, 22 Nov 2023 21:43:42 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/xenpvboot: remove as unable to convert to Python
 3
Message-ID: <20231122214342.66d40d6c.olaf@aepfle.de>
In-Reply-To: <b46b276d-4df0-4c28-ba4c-e0147d0b98fd@citrix.com>
References: <20231006145046.98450-1-roger.pau@citrix.com>
	<b46b276d-4df0-4c28-ba4c-e0147d0b98fd@citrix.com>
X-Mailer: Claws Mail 20230817T113819.a897c59c hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8gGv=m3XpvbQ14lQ=BVenXw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/8gGv=m3XpvbQ14lQ=BVenXw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wed, 22 Nov 2023 20:30:59 +0000 Andrew Cooper <andrew.cooper3@citrix.com>:

> Does this mean there are SLES/OpenSUSE users of xenpvboot ?

We do not know. It is gone by now, in 4.18:

https://build.opensuse.org/request/show/1126897


Olaf

--Sig_/8gGv=m3XpvbQ14lQ=BVenXw
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmVeZ/4ACgkQ86SN7mm1
DoDCLw//TIxURzq5iiloV7xTzMS4F+kHVxSf1HEUpOTLHrHO/UxNY+KWf7Lhnuk7
9xb822TJ8ttZJlARsiA3XEAQELkODoENVUcl0apNVM9UUDG6AJ1SNZrptxFuQ8UX
UgQny6JLQ0iAHgXiKlSliUB5EjKGLtJU+xxWqK74X/mknKZX11AKENxSqmrsag8D
3jdTahSm853QeBCls6rjwEX+sOAYkoTRpajsUtnl0WTuwYB+UZyFAGMZ7GAzWyyP
Ra6VaTlX2FX+ur1S5IlxiqjhQCeLtaFDLI5Tar7s0lOLOewbGmmwf+QgGrRUta8d
HmbOb3vxcQQhMQPEpMmEsF56SKOlOZIv4rmAs+s/SxfElmM+5LfyjxI1uRMz6sPU
MNz9UBQvCo+Xyi0TS3Q8uoAQmtbx7Fdd2X5fSWVNHoz8wNriTXpX82MVErEuEt/U
nRqMkDB14Ent5bOcsC0O2fuIBfVGy9H21amUpI+uSUT6TrhFt0B7cgKsoBQNPVQo
1mZk7NyyIjAM8S4TkQlAm2FBvlVCSGgQav77mHlKkmrWEQS7dxFQ/WSwb+yROzI3
4hXxmxur4TGXrf5zITBTcfTHMtyOV7cKK0veHclQzjdzgqLh09UXuJgfXU9vKxQs
Xh27Oi7ieJHkNl1s6M5iA7P4b2WW1gPe6K186k9GurtYlfrLRRw=
=6CSs
-----END PGP SIGNATURE-----

--Sig_/8gGv=m3XpvbQ14lQ=BVenXw--

