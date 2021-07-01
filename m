Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEED3B90C2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148619.274642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyuN1-0004Gq-TS; Thu, 01 Jul 2021 10:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148619.274642; Thu, 01 Jul 2021 10:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyuN1-0004Dz-Pk; Thu, 01 Jul 2021 10:56:35 +0000
Received: by outflank-mailman (input) for mailman id 148619;
 Thu, 01 Jul 2021 10:56:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lyuMz-0004Dt-Q9
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 10:56:34 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e62e775-6d61-48c8-baee-50645f63130d;
 Thu, 01 Jul 2021 10:56:32 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61AuU5sD
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Thu, 1 Jul 2021 12:56:30 +0200 (CEST)
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
X-Inumbo-ID: 3e62e775-6d61-48c8-baee-50645f63130d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625136990;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=ymHzSP6b77tUdg3MpeJDDfVcEVfHHO864QOF6PwBG1g=;
    b=Dwb/yeksOmWR9RF2Osz7ByQzel3gLf2HXdzXMWDs+cqt5v6EgN7oe3gxD4XYDX7J40
    iy+XLrCCfDRrFxLyhTixVVv2M+ehIqn4EVrLbGaIJ43Ht4zPR3L7IZf3zZXqb5rUi0Pc
    gfEHf+R9TsS/To50i9gKO+ddvJOTlLA3rMaabrsFOiz3rLQbpXIA6WqbwPs8B7WjtnUe
    cryYqw4UIlvUJ3a4Zi5hESGmyo6x82TBds2anp8EQRpXuqJiMdpo3Rq4r+HqJV4z5nM1
    2KXIkqFrWkqQHqZKmOUpbQH2Wy9km5Wbq+/hSPwMluJepX2uxL8jigL8Xo7zqa00Pfsh
    ryFg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsBBSIa03sY9BUY2ao0oygRsMfcqA6zjDLeeWXNg=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Jul 2021 12:56:23 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: XEN_SYSCTL_cpu_policy_hvm_default truncates leaf count
Message-ID: <20210701125623.593fe3ae.olaf@aepfle.de>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LWVxqIjpQLVhhKfHVDp2z55";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LWVxqIjpQLVhhKfHVDp2z55
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

For some reason migration of HVM domUs from pre-4.14 to staging is broken.

It seems xc_cpuid_apply_policy gets nr_leaves=3D119 from XEN_SYSCTL_get_cpu=
_policy.
Later XEN_SYSCTL_cpu_policy_hvm_default truncates this value to 31.
As a result x86_cpuid_copy_to_buffer returns -ENOBUFS. It would copy up to =
51 leaves in my testing.

I suspect commit 34990446ca91d9e201ff17bd4e3f43bfe3ad308e just revealed a l=
ogic error somewhere.

What is supposed to happen in libxl__srm_callout_callback_static_data_done =
when XGR_SDD_MISSING_CPUID is set?

Olaf

--Sig_/LWVxqIjpQLVhhKfHVDp2z55
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDdn1cACgkQ86SN7mm1
DoCOoQ//cITmXnQdiJkpKKzg8mZhmG8UsxVmRg4uB3npq/hLTHxBFFeDABexv3h3
59A40YTjwTK+iqYfWeayFG00XM+QP8DbgUup2gpSbmRBUH7iEBVe0EY4jvS99avb
S6QB9Xn3Qy/dqCDN5CM+I0fnxsivPrdnztL1IGeKdnOHvAqwdvJ4DFBH2OLhy17E
rnODuM9B0/D2fEXDjXUdPxdoeNIVbhaKBvmaItG6dqfT1ttnhBgXsCWEzha198vN
7F8QsuBeLMV65TEpKwWhSSoKembh9h7MVgcoX26R4aZSv9RXdERzjNBDFsYWTrlw
0BZHL/TE3awSFh2p5dNUTTPRdshtjW5jKqGf+ynEOz0HZFq9I3m47rbo2fwC7j+S
IaRMFLEkeR/VDggM316dFxP2zAc/1nQImqBhgYN0EkXHp+hc/AU3luitzb/6Ir/D
nnykhMuMQ7dWLJ69j/n5mflQor6Gid2lLdFp3x8S7UlTLgs2FbfltuSRBRnDMF6X
JQ4h8psNqYV7ccXhoeTXFAofPZ/F5mF/AhnIP/cK+kKfAZV/rHE13ISoHrJESXQN
TYHwCrVFrVihnOAqObU0xBmcGuDUfI8v23P4TmPXXI4jlN/gTxKspfyLYxsayTDo
oVr3wQrq+p7LlZhD3Cm7pF+Lftu65c1Z3n9lmSX/4QsQN7XorSE=
=lUM+
-----END PGP SIGNATURE-----

--Sig_/LWVxqIjpQLVhhKfHVDp2z55--

