Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B00BEFB68
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 11:34:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRw7l-00079R-9s; Tue, 05 Nov 2019 10:31:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sDQJ=Y5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iRw7i-00079M-EI
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 10:31:42 +0000
X-Inumbo-ID: 73a80c76-ffb7-11e9-9631-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::11])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73a80c76-ffb7-11e9-9631-bc764e2007e4;
 Tue, 05 Nov 2019 10:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1572949899;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=b9ZlApwL1tQhgt67abkGQoC1vsqMInJ4EqLlF160SRA=;
 b=HRSuxFLjBcd+8m+uX6PsJCprM9f5FviB9zO5joqHa0JxN8kw9AfB1ccQ89adXtSobP
 clp1j2er0YJ0NxBeVZ1ySrnohoFP+CTqVRpf5yu67Mpxdwgm4Qsk5oQMrMdgA+J3e0yH
 u8d7zW6h3FBfyOcdMmTNphZ41Y6iLhME45HqwBDMoVHEOgiBbhNpVpEL73rw7/oFjxC9
 z3CsAfgawFtdm/MKxGDawLZB1DTI9GTy3jSUuQokzi8gxitwRsB80jHZMc04EvHMXc0w
 rzvdsxgMPplLn1P5S53G+saoDiq6z7Dg0MZgkk26P/u/fvgfaz6c+l1cDCZY/srhg/36
 suPw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.29.0 AUTH)
 with ESMTPSA id 20735bvA5AVaXrp
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 5 Nov 2019 11:31:36 +0100 (CET)
Date: Tue, 5 Nov 2019 11:31:25 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Ross Lagerwall
 <ross.lagerwall@citrix.com>
Message-ID: <20191105113125.15afd4c0.olaf@aepfle.de>
In-Reply-To: <23950.17432.186593.462322@mariner.uk.xensource.com>
References: <20190927161746.25902-1-olaf@aepfle.de>
 <23950.17432.186593.462322@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] libxl: fix crash in helper_done due to
 uninitialized data
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3622614533717940282=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3622614533717940282==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/N1nExx.Fkhqu4yBd.z1CNfK"; protocol="application/pgp-signature"

--Sig_/N1nExx.Fkhqu4yBd.z1CNfK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 27 Sep 2019 18:17:12 +0100
schrieb Ian Jackson <ian.jackson@citrix.com>:

> Olaf Hering writes ("[PATCH v1] libxl: fix crash in helper_done due to un=
initialized data"):
> > A crash in helper_done, called from libxl_domain_suspend, was reported,
> > libxl_aoutils.c:328:datacopier_writable: unexpected poll event 0x1c on =
fd 37 (should be POLLOUT) writing libxc header during copy of save v2 stream
> Ross and Andrew, you wrote much of this stream read stuff, what do you th=
ink ?

Did you have a chance to look at this issue?


Olaf

--Sig_/N1nExx.Fkhqu4yBd.z1CNfK
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl3BT30ACgkQ86SN7mm1
DoBvMA/9EtgI5TH6ZzaDtbKFOmgChg0/U9zCSjvP0sSnnAN8EEnmESEf0Pfeaar3
bbgZlQImPvHcCHU30/LJi4fHCqShFgONYYcHiKgxjBlLUo5nJDrTqwsYPsQ2J0nD
/PT8CWdd7HjA1pWHZCJszuX97gSsHEO61UOVrEs6ITDF9ckfKXLX9TCDWGcW3YGT
QxfP7zkl3Eb7WKJXLpiuH/MBhfbDqiFpg1Qie1Ji7ALhAtKri9VEGSKoKAWANS1X
evHafRPnE5CPewGR6VciI0TJe/CRfkgJ0ZqtJoC+zjgV2B0Qt77m+brkZkN9Xe8F
xabAG/JKg+8abAVME2OkKdrMO9dd4nlKxQnjg3OEXBoK7YdLyEFUuyllLSzTkbJ7
ggZ5f/fIS6qqusYyt17JlYYpUxBtanL2Nw034QPn5zU0mheQaWzLOS/wiwtc2JX6
tzmzoueSfWuUnts70itGrAn3QEuQnCT1kjn8F8pJwHHvd+zizZz2iQDTYrgwkVBH
7w2mfpcWiQXPnzfDXEM9UJ4b0MFw4HE7TToEdobLVq9l7MxgGwSQkuulF4nA/bTq
CqTVD1pFi8oFU/KOl4+wFxs1lczuWuZd2fMuhgs1T8RAqprC+g1R8Egp2dICjXLE
fCCqf4Z7jyvkz3URXrlNF/VePYB9cgidQYYnN10Y1+XADeYJ2pI=
=UCzH
-----END PGP SIGNATURE-----

--Sig_/N1nExx.Fkhqu4yBd.z1CNfK--


--===============3622614533717940282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3622614533717940282==--

