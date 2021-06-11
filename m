Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404733A3D1E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 09:29:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140234.259150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrbap-0003aT-B5; Fri, 11 Jun 2021 07:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140234.259150; Fri, 11 Jun 2021 07:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrbap-0003YJ-7y; Fri, 11 Jun 2021 07:28:39 +0000
Received: by outflank-mailman (input) for mailman id 140234;
 Fri, 11 Jun 2021 07:28:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6eg9=LF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lrbam-0003YA-NU
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 07:28:37 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.218])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcfa0988-751b-485f-b586-41cf82c56ad5;
 Fri, 11 Jun 2021 07:28:35 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5B7SSbBd
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 11 Jun 2021 09:28:28 +0200 (CEST)
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
X-Inumbo-ID: dcfa0988-751b-485f-b586-41cf82c56ad5
ARC-Seal: i=1; a=rsa-sha256; t=1623396508; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=SXppBXc7jLwi1hjItE1Q6WBIbiKMN0OWpSYpfP3oVVYvUYh/Sj6tKa8VTk2Yq+3bXA
    6jJKD4AoWAlWToBD1M33zkeVj0OSJ/y1KhCGBNxMC+U/VhiX2pB1fq7ae2a2HmN8Qidy
    DDybPpEU6rtZn/fUGrKgGMZ560Nv+Wv37dUUtlmvgw77VoVYTu3tOh/fSwBwpBDeGcNr
    lqfbo7F91HGvFfXHrCAAQXIUtPVzl8lhzByytSAG4bCC9n70cjMLV3OaCXv1DPVHQHz+
    uYtTOk6KqmCkbgK2nJ8HYt21CMVbtt5Xg+6Z+5ffurXjrTxBa6cQyWQe4co90q1900qq
    uF9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623396508;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=IwC2SpROjPR4yfqIr6wGKLMyHG7VjnBvkUQAWkc20T8=;
    b=aMG0hH6giNZDZ/LTSQQ81A/Oyg7hRNkwD9QvenNu/aaQPcynTEZ7Q2tTmE/mnL4yON
    pIBm6qmRRxGbh4l7/A2Z+57+KiWhfHw4neOCH0Q5Si1bl1M8VwC/jMwFxWxxz8+ljB+p
    AvuT1GCQlwuP1fLTKOG8jApM2ypJB9nRadVhBu8nDKCYBe3e/QxicaurcFFt+EE8e/DH
    7klxeilZ9X7L7o73BGp33OA0SjJfh7L49xySBmOwVsXkPlzspZhvOvA4n1/+LuMRivfe
    ja8eOs83A4VbDLiL0Kxr1DhLgxhyVFCBUxJTzON7vdUY7JzVehSldyzZ1UqO9Kx8PIXS
    lwHA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623396508;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=IwC2SpROjPR4yfqIr6wGKLMyHG7VjnBvkUQAWkc20T8=;
    b=T1xtB8D0PFIt+MxvWwtTG+QP+fJc7rK60HKyqH+gaCZSsBaB1OXNrCQTKkvabd5A63
    IV/u9oFurFswnXPuMZlazHaBeO5WtWXCvoH39Sz7J38+a1iEyZMQCMQEi5+8d1Srir30
    OA8OKJNTn4p8SLwCvnqBk8ME4iEtrwEigwEgEixcwf2UmK2mlJh5JGKF5ikUkaE402aa
    QUm7uTAollT3VIMedB7hMekpc2hI1/I5wBR/iJOvRlWmx089deegZph/VPwZmpiqRPeE
    GPhKf40x7Fv/VxqwG2FPRrPNO+r8BC8o+klmYnDjssvbW7Y0QwZfHlUIzjXsYueyB3xI
    6iWw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Ax6Fb03sCxOoTBq7r1dZtjiRLxxzC79Iv3HI"
X-RZG-CLASS-ID: mo00
Date: Fri, 11 Jun 2021 09:28:14 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] tools/xenstore: set open file descriptor limit
 for xenstored
Message-ID: <20210611092814.1c86c350.olaf@aepfle.de>
In-Reply-To: <fcb0a1d6-c392-e0a1-2ec6-d6cf6a40d6bf@suse.com>
References: <20210608055839.10313-1-jgross@suse.com>
	<20210608055839.10313-3-jgross@suse.com>
	<20210608183833.023551f4.olaf@aepfle.de>
	<eaf53d99-fee9-0c79-7f29-efd00aae4d16@suse.com>
	<20210611074616.2a4b96fb.olaf@aepfle.de>
	<fcb0a1d6-c392-e0a1-2ec6-d6cf6a40d6bf@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8snxwIAzlWmCToxQCgDPaHz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8snxwIAzlWmCToxQCgDPaHz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 11 Jun 2021 09:07:24 +0200
schrieb Juergen Gross <jgross@suse.com>:

> Isn't that a bug in fillup or the related rpm-macro?=20

No. Fillup expects a certain pattern: a bunch of comments and a single key=
=3Dvar right after that. With such format it might be able to adjust the co=
mment and leave the key=3Dvar as it is. Without key=3Dvar it will see it as=
 a stale comment, and removes the entire section of comments during the nex=
t package update.

Olaf

--Sig_/8snxwIAzlWmCToxQCgDPaHz
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDDEI4ACgkQ86SN7mm1
DoCJxw//ZA0XDNN2hxkZA7DY197qDRjw9N5NXy83isgI0uDdYMlhQKu9YfLd4KoE
cbJcfZ7kjHGtCPrOt7skMy88gIIUeLxGzNsxczVutc6SvLuNW/0f5RQbZJVhxBP9
4flPUJBnB6Z1pF2sADYyEvNJ+P+PIduA0NS5b/IcQXUXZ+1RYLezO8SltLTPWlHg
2DC0wbzUTIVPBZ67dyZxNQL3nHNJStp+Z/ZnYOH9u4hCmwX7GQE2Is03v3rkmMRO
o4g+M/pCHh/b2KPu9N3kkXc6Pju2eY1rID2q/tR4rUVYlPYsCQXWbcPcDNilMvyc
VoHJmy8pXdyTBe20q0hdgT+PRbLgHD/HLUvmESwJHhoVcxkwPs6MIYaAiQBvezBs
HNl1ANhNCxqQPVi2d9xi2+gIcI6ONC91oSgOQE2CuPLKugoS+ExlYpIwqBo3gcfs
qsyjs8CnoYCTQS+CymHbyx7IdyvNvi4eu4fbBztMNCeP7vn3ThmcZbgtPB8A5jWo
pQ9ZsvVUz1PC0v8HS+WoAHLuM3o/4fz4Wiy4NDChdYEyyqGd+6sZkpBG/+LWf8no
NTqy4Ymzd0nxpw1140bGyVw4AvGSCIf0BtrvuqRcerrhe8QnVNDxDf5/AR4YKsc2
N7Qmq3HhQBALM7mJDXw2XqGZmBg9s+0zTfI/vLmO0BbYRJ5W95A=
=52NC
-----END PGP SIGNATURE-----

--Sig_/8snxwIAzlWmCToxQCgDPaHz--

