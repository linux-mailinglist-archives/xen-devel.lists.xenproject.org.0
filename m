Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A103BF08B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 21:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152695.282075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1DbE-0001dz-FZ; Wed, 07 Jul 2021 19:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152695.282075; Wed, 07 Jul 2021 19:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1DbE-0001ai-BT; Wed, 07 Jul 2021 19:52:48 +0000
Received: by outflank-mailman (input) for mailman id 152695;
 Wed, 07 Jul 2021 19:52:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eUo+=L7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1DbB-0001aY-Vg
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 19:52:46 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.219])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5297a34-df5c-11eb-8526-12813bfff9fa;
 Wed, 07 Jul 2021 19:52:44 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx67JqgXTb
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 7 Jul 2021 21:52:42 +0200 (CEST)
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
X-Inumbo-ID: e5297a34-df5c-11eb-8526-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625687562;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=L3todOf+rRR85nJeOG5zIOoUYCN0b4ZAUs7tMpkzywY=;
    b=StVFz9IZYl/2r0dgFYt50RK3Ec4igr397KulvFQJ59DuIUI0nsI5/UQa2LI7Ig2oDT
    a7YD75K3jyVVT/jHmg4TG3GL043DbkXZMWc9oeOp04QfYrjxMF/yYCWo8dJEdhIKhBRd
    M09EhObyMT9L1wa74tq2Sv09x/bkAy6W67XwewvRtF/LLFIaLJjsZme2WezOLFuOyj76
    IFOwKYYVhvPYEv+7Oxg9jK4i6DGz1/yOCrl/5FRO/2YqeyxAO+oy/Bnvc9LZeDmyi75/
    7+NpsMGMzz8w0cTxqz9ojkys41wtdt7nfQZfhNONy1F1JsMR/t+FzeObA2O+W63JWGPH
    z+lw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Wed, 7 Jul 2021 21:52:35 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] automation: Check if ninja is available before
 building QEMU
Message-ID: <20210707215235.76f15361.olaf@aepfle.de>
In-Reply-To: <e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
	<20210707164001.894805-3-anthony.perard@citrix.com>
	<e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o3LRHdSBZ6D2GQ3ZiFSyt.p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/o3LRHdSBZ6D2GQ3ZiFSyt.p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 7 Jul 2021 18:46:03 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> iPXE failure

it just needs to be updated to ipxe.git#master to make it compatible with g=
cc11.

Olaf

--Sig_/o3LRHdSBZ6D2GQ3ZiFSyt.p
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDmBgMACgkQ86SN7mm1
DoBtOBAAlcD8RPA0qYBFCmQuOuyVqATnzXc0lmOsnNX9Lsetdd4DihlFtBBtrjTC
HdTj7CrayuASsIClmvHzhcQ1OOqE+uqQ7j+vPEXhn8ZXCy9NOw/zfHGfZbL7NHyG
OYRF9NYukM6CKahIG7Y+C1uekPNIndW3SAQegDD5S9xXGmigk97lCl4rZdqUFJiI
y0z22jmXT8yw60WJg8OvnWfoGU160XMaTza2twgb2Km7MAza0iL4zWP0nxHlHm+j
SkLRGVlklkQItdmmxPcDTHcR+90I50edGHw1h71vDwwG86a+VbE1vHr7RAifL1Pw
s7nzHe8/XMj6osiNYZPxalzgnaTq/Z29akvwIaCwjBNU5w2NBUqRaBsrKrbHtHjV
Amk6N5Ul4kD2AZz1K5ahnM7fV55w4dOHB0xWCxGVJZz+o6Rwpj5X67zS2n8wX6MB
rFC6rdthp0iWxKGokWgOons6ViMCYeYFcU1H3FML++4/QvMRFVmSRKEZEclJAjUG
mTVTT2ij4ABvM4uDHgd3UnahUDRcC/wdMl8oo9awGFh3iBpd/Pw2Le4OADre4eZP
JhmEAtqWEP2EYLqMjPFkwN7NhH2ouN5e+spbfQKv9gjwOGU9pyD3IduLJgrnta8c
psuloYw1VrnmuZIM+88AYjBPAX+lXao0DTwO8Beu0OXdiqltGQo=
=qBjj
-----END PGP SIGNATURE-----

--Sig_/o3LRHdSBZ6D2GQ3ZiFSyt.p--

