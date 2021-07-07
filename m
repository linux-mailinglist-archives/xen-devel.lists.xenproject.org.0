Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5933BF0CD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 22:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152703.282089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1EH4-0005kB-Sv; Wed, 07 Jul 2021 20:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152703.282089; Wed, 07 Jul 2021 20:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1EH4-0005iI-Pk; Wed, 07 Jul 2021 20:36:02 +0000
Received: by outflank-mailman (input) for mailman id 152703;
 Wed, 07 Jul 2021 20:36:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eUo+=L7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1EH3-0005iC-Co
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 20:36:02 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.164])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 688bb293-4cd8-4e32-a446-4ecc739c2fd7;
 Wed, 07 Jul 2021 20:36:00 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx67KZwXZJ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 7 Jul 2021 22:35:58 +0200 (CEST)
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
X-Inumbo-ID: 688bb293-4cd8-4e32-a446-4ecc739c2fd7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625690158;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Cd9IqXgfDwCult7hj19byaCp61qXgIMz/XjhX2z4CfI=;
    b=S6h+PVT956hG7U5Sm1N2PWgcoKY2KoRftyiIoTqs8RR5q7V8DibvgFfDGcCYYVXbQ9
    KslDVmGZp6KiL0DJQEKeJcWx4mwgtmIAnw3ryk8a3LJZ0dgHrjLPjnNF5bW4vr2laH1e
    kHbS/+nylvkGuuhLPc39kma5AmTpsyN0vv4gSIkjuToUm04Fj7W75vvhE2U72yMJf/j+
    LE/P+GKf/zryjcBXubCEHAdJQZKsuJ92jz6hxRAQuIQShUUxiTEZ/O7pFxYJEtTNTlf2
    C/EFBfo2ok23njV21IScGQG4/wJVGNJQTg1y2CrrBXEoVLuar5HIlzF4yi+Do3w7gQGl
    9cvQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Wed, 7 Jul 2021 22:35:51 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] automation: Check if ninja is available before
 building QEMU
Message-ID: <20210707223551.5462c74e.olaf@aepfle.de>
In-Reply-To: <e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
	<20210707164001.894805-3-anthony.perard@citrix.com>
	<e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z40aI1UnBoBfs5S/.Rf6/_0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Z40aI1UnBoBfs5S/.Rf6/_0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 7 Jul 2021 18:46:03 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Tumbleweed is generally broken and fails at ./configure due to missing
> compression libraries.

Something requests zlib-devel to be installed.

I suggest to provide all config.logs, not just the one from the top directo=
ry.

Also a "test -f /etc/os-release && cat /etc/os-release" should be added aft=
er "$CC --version", just to know how stale the container is.

Olaf

--Sig_/Z40aI1UnBoBfs5S/.Rf6/_0
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDmECcACgkQ86SN7mm1
DoDEnQ//WJPtLa4Plvvf1g1U/XOpJJpreYCjzRb/X8pliatWn3CdouA4MQnf4P8l
B7aM+EGqd7Ruep3JdXpqreM8mfz6judMp76KDfueILaZYw158xmunlgPk8BIBW+Q
duEZIlDAfRvDR0tmTb6xdl7oTx/dF3agX9JMV83swYmbrgTMGKyGJc3PTcRmk/CM
S0nbXxW5/8gaLqHVGSNeCcPdzdnItG3gEYwK6khY0NiBS8i26o+dGFAPyGMNUwBu
xYrDWgZqpYZE1keBwoqOTD6uIbo3lcj1V/v/Poa7Umoj0meD0gr1YygDoLnZQHkN
3R4gcZZgxzkATloaYMFPbyCaMoePj+OgdnIqO3KxmoMKshMG8vg6SFnfJj8YzrZg
Al98oAC634toZ9bIAyPLOJePdz+8V4ViSfZtxmHfUNgxdQiAugDkwjcB9pt7O8RQ
kIt2jMn3fx5OqZgmgw9MyWjIMLYRm59vf0tIgR8eWjQSY7N/b8e9cWMOh6ZeZPVv
qmswEryiqq+mK8XAjjPGfwgzB9piHJ9hwMuP2JAUSjfq7ljNNghTmXxYSQ7cnQ97
GfQcmhU17JTJj/r/+K6Pl5wBX1JHtS/HXf+vrs+9FXPVeOB0tias64TWw+CBNUpf
/5KngZfyKfu1tasGWfeLZHdQzDFPf3BVScVtgRQfMbxFYZg4a+I=
=+PNg
-----END PGP SIGNATURE-----

--Sig_/Z40aI1UnBoBfs5S/.Rf6/_0--

