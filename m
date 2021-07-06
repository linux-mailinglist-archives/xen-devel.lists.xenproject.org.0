Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1483BD599
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 14:21:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151199.279451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0k3u-0000n3-8w; Tue, 06 Jul 2021 12:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151199.279451; Tue, 06 Jul 2021 12:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0k3u-0000kf-5u; Tue, 06 Jul 2021 12:20:26 +0000
Received: by outflank-mailman (input) for mailman id 151199;
 Tue, 06 Jul 2021 12:20:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8sr3=L6=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0k3s-0000kZ-AE
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 12:20:24 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89082c22-de54-11eb-8492-12813bfff9fa;
 Tue, 06 Jul 2021 12:20:23 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx66CKFRYC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 6 Jul 2021 14:20:15 +0200 (CEST)
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
X-Inumbo-ID: 89082c22-de54-11eb-8492-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625574016;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=0+owGwuanH3lMx5WvCbyvFUVHkXcVOCqOdO7Ui5n7qg=;
    b=Wx3DaDSxP+YzxPfxsQhLBQkmVdbbGoB84vUWyG6nc3TO8cm5dClIri9uvjw63lWl2S
    8CHzIfjOd9I65C8zYKVMrQ5Bf4bByCuu2jQtN8LIkeMOw5TRr/ffn6OxSNuGBdoaREGz
    Li9P51C0hCfDTvBex97T2AZnpHJkM8ENo2pTQOTV3c6TqxLX944Fh3VsdwIKVqy5NLQQ
    lYccRUtTstUDbpvKsIbBTErkxNYltd5ypa57FfE9VkSg2hx0ifZ9vSSB/3yQc5XsVCTd
    c2d0soXk3emTkSLTpS6pxY1oLc+S6ISvUDqUWafSmhZS1FVtIiErOlTk0Emut/Xyrmqq
    F8EQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Tue, 6 Jul 2021 14:20:10 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
 <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] tools/migration: Fix iovec handling in
 send_checkpoint_dirty_pfn_list()
Message-ID: <20210706142010.3555a487.olaf@aepfle.de>
In-Reply-To: <20210706112332.31753-2-andrew.cooper3@citrix.com>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
	<20210706112332.31753-2-andrew.cooper3@citrix.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3=BS9uBOY8tvc7PqgE_xM6E";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3=BS9uBOY8tvc7PqgE_xM6E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 6 Jul 2021 12:23:31 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> We shouldn't be using two struct iovec's to write half of 'rec' each, and
> there is no need to malloc() for two struct iovec's at all.
>=20
> Simplify down to just two - one covering the whole of 'rec', and one cove=
ring
> the pfns array.

Acked-by: Olaf Hering <olaf@aepfle.de>


Olaf

--Sig_/3=BS9uBOY8tvc7PqgE_xM6E
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDkSnoACgkQ86SN7mm1
DoAHZRAAjfqSTntZ7FOI6Ns5VJN8Ozga/YOMGAzHiUH6aubH3A3iK88Q318ju2qA
ldiL/VZFVzPZ0exWT7SK/MBihZy/R4uIawFKuo+gIAoUPTX0ysX7fJKV1h1YhyS+
5euaxhXziVRUoCpyGrCQ8u4y5/2mZgxznswTbOqRwRk7cVP6Gd5gyZP46iksSO/C
hj6RPzpcmlku/wH7XrepmOv01FdxoDaMbFhJlETDS7xhAQQBqZYZze0e/gIkZlXU
8L1h4a17NP+NtRSy8UV9vjFGr4UGSvViG8KKLDuqj+2IOBRcPTYn9b2l7ERC1zGN
12iwkRRXEwzLtXO/9spqWUKtFnHSLUlnsqQCtqy3/hw6xWZ0z+n5WHswJijzhf04
ZHp2zFqGmHykd7qyXbNrE5bSBFRhdfsrwHFvLAP36LU5aiSn0eiORPe0JQnI6rQe
BfmjalbYIQ538rNY7yjrWfwsN/bm/U2X1gJRKlSSIKmWFrgFmDQaODLIBzTtuF1O
ls/YN0WNA2nwB5r5EtXOIwfzSbin20KAfozxidxAlbKUd0ZSZHCF3pVbxuLTRtEC
QvcKNwBmn3a7T1XZtYzr3eXC/eQfXUnqd4TmprZUD9IFw/0I3QJBmlv3W0odKM6g
WgFIkYLf98EgnyFMswiUggxuY4qWQ4p9ndb6M9F9cQJJEy2/YUM=
=dCSv
-----END PGP SIGNATURE-----

--Sig_/3=BS9uBOY8tvc7PqgE_xM6E--

