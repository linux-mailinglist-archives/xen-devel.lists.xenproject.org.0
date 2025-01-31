Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3353DA2449B
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 22:25:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880012.1290188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdyV6-0005cg-27; Fri, 31 Jan 2025 21:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880012.1290188; Fri, 31 Jan 2025 21:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdyV5-0005Zq-Vh; Fri, 31 Jan 2025 21:24:31 +0000
Received: by outflank-mailman (input) for mailman id 880012;
 Fri, 31 Jan 2025 21:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lLw4=UX=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1tdyV3-0005Ze-UY
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 21:24:30 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bedbc2eb-e019-11ef-99a4-01e77a169b0f;
 Fri, 31 Jan 2025 22:24:25 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 51.2.17 AUTH)
 with ESMTPSA id D0534410VLOHAOw
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 31 Jan 2025 22:24:17 +0100 (CET)
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
X-Inumbo-ID: bedbc2eb-e019-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1738358657; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lfphfiXeuy0k/s97y0djYuxDTau+R/kiKz+T/uVqh5mKKkZIwUIX21RaeL9BVAq07b
    d/GSdRND0AtbZCY2pSBDEiqfe20pBatTVRQEia2AW0qGB7iAXqZu5bzG7HadfLYZ677+
    BVHtjkhAZja5zLIMmtbflJMPJfXCfAj0Akucqe3+RjF6osDHOp2wXAyWZErJ+1OrYVMI
    vaysNVBe2rZTtF97jezi5aGcKD3CjCcNkZZh3md9C/qtnziKWavKRxG1Wnb1ex1j569j
    1L0Qgo7tVlQml92/vYHzg7pjE3tidTn5Zyfjo0QkfIYKFsCqH5ASoiMMRmuefx6IuLfz
    6ypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738358657;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=eAzSJqEFrsaXJMf7ew9eXFDvspe9PnDh9NWZ6ZjZidc=;
    b=UaUj//LZQrE3as9Ldk8CqG4m0h/rpMYomJ92g5X0BPLpKX9itJoK3ot8/mwd8nVBup
    n3KGxNqQ8P67AsOASpANR6z4Go6NccDNbXE+qvVt8hafkkBgB4mN9P0sPLKLqCRzh1/+
    Kb4TEknvVeTI34Idk3oWq/E5tfy3MGDSRo8jE1jdqRUKfwIQq6dmMkutQtwdOAsSC0Pj
    P4iDM4VinOp277INUOOv75d8vrlP8V4xnHNN81TjVcM8ZW8JwrZy/CkopscCRENdDgh+
    6n68/+H7MFPOSMVw+owAYNQpyOgfK6+qg9NtsnM0aZ0TeZf2EPlVcrhxt5sDq7fUZhqZ
    Cfng==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738358657;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=eAzSJqEFrsaXJMf7ew9eXFDvspe9PnDh9NWZ6ZjZidc=;
    b=mokYCtLz2mt4/GXCUCxgAS4YJ4FNk7GRnjGWHyjW3WpFch5yzMPYMcBver6AzrVY8W
    mZK8Cmsy0KboLeBWYRdlyKEOT98/DmZ3ekjz4jZwY1S/z8YXjFAzblbMFColjKfX+lq6
    zBZxRrvGHOYKecqJgLFVLi2l1zL00x2+6gp2qLvwy00SFSo+89G8YXW+uPNg/bfT3prr
    I10+suPyWIe2zcBKxFz9Rmf3W0X1LoOrGq+DhNVMNy2Mz9aiIrT2ux4/ys5dgxcnGoxE
    ns/LkJ4xR2U/e/vHNn9XsWZDVC9HlA1Cv6UkC0r/nTWk01Fqkb/LbzK/OtW620h6xM2u
    11mA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738358657;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=eAzSJqEFrsaXJMf7ew9eXFDvspe9PnDh9NWZ6ZjZidc=;
    b=7a7mNv5H5TiwFgmVCgErzrH2ni1u40nI3yMAvvZIEcAC4d3l7HaGfZ+jdYlm63KLGw
    z8JKMIbap3oiqO3IZIDg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OmD4uXd0fmxSoJ8/RK6b07KGriu4yBf+6JptMSdiuOzXC/d"
Date: Fri, 31 Jan 2025 22:24:10 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 xen-devel@lists.xenproject.org, jgross@suse.com, Anthony PERARD
 <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com
Subject: Re: slow start of Pod HVM domU with qemu 9.1
Message-ID: <20250131222410.2472f04a.olaf@aepfle.de>
In-Reply-To: <alpine.DEB.2.22.394.2501301014400.11632@ubuntu-linux-20-04-desktop>
References: <20250128151544.26fc827d.olaf@aepfle.de>
	<Z5j-bkdFZ7riavv7@zapote>
	<alpine.DEB.2.22.394.2501281543580.3264561@ubuntu-linux-20-04-desktop>
	<Z5oIvUINVDfrrVla@zapote>
	<alpine.DEB.2.22.394.2501291429040.11632@ubuntu-linux-20-04-desktop>
	<alpine.DEB.2.22.394.2501301014400.11632@ubuntu-linux-20-04-desktop>
X-Mailer: Claws Mail (olh) 20240408T134401.7adfa8f7 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q/z7tz6BsSY.gMaQe05PQEW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/q/z7tz6BsSY.gMaQe05PQEW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Thu, 30 Jan 2025 10:14:44 -0800 (PST) Stefano Stabellini <sstabellini@kerne=
l.org>:

> xen: no need to flush the mapcache for grants

This change may need a Fixes: tag for 9ecdd4bf08df.


Olaf

--Sig_/q/z7tz6BsSY.gMaQe05PQEW
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmedP3oACgkQ86SN7mm1
DoATkw//bBX4uT+wnWPsyITMazSWi6fBTI/fWmlyfAkEnBmRV/37rcOSKnEp0+8C
7bjXRJtrYr+ivMKn5ZVUNyRSoT8BSSa4gOU2Gjf8IqHwVur1C0whVc017LGvBdSB
02sz3P+KgdEHipi4VfYJgNNaTG9KrMSVQ8E1ZQePYdUOn/dKfpnbNIpIbRuzmLiY
l4fFj5vMjm2kGXRRQC0wwXkJZ8JNHOkhsVbiaSIO/nwh/COHjNWVNKjEo67XXsya
4OrbBEzzE0X7v2HRbINmlLBuimRt8kMQvFBf1dZwkuGMT9HfDs9Oowm8J/vsj6h/
8B+T2tlrQrKDp39iT7LbJGzD4mwre9P9jeh54P/68QUWlCd/Um/4MTAYrLUXCTJt
TZIqV8z2ThQIsX9dULZqJysTmRAB0qOYIc3jjzs3znFsWLTQnaWgX5yFja2piOa4
bQUDRhhD+SGTDSIiOh0NcvAeT+QPASl7maBAKjAvd7V31O5aeOmsSseXxiCUBKze
6WNBH/1y38+qxcYAIiFgYrnM9ZAF61VAAZigLsukZgmXuFg0LMYZr2q1zyo/7G+a
fv0RBxHaeH+u/5Cg1hg3c+Bz0xpFmmj1izB7qLFM2wIbk0P7U7S9AuavUuqZ9hv+
2ph9UHptal/WiDz6zuIOf/281YgWURbAZjifakJHkhkwzci5rtY=
=qRyL
-----END PGP SIGNATURE-----

--Sig_/q/z7tz6BsSY.gMaQe05PQEW--

