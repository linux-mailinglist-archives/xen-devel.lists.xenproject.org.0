Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371B529C2E8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 18:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13000.33496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXSyR-0007ks-3t; Tue, 27 Oct 2020 17:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13000.33496; Tue, 27 Oct 2020 17:41:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXSyR-0007kV-0c; Tue, 27 Oct 2020 17:41:31 +0000
Received: by outflank-mailman (input) for mailman id 13000;
 Tue, 27 Oct 2020 17:41:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vej7=EC=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kXSyP-0007kP-DJ
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 17:41:29 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b7a67d3-fba9-4632-96f4-d737a761ccfd;
 Tue, 27 Oct 2020 17:41:27 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.3 DYNA|AUTH)
 with ESMTPSA id D03373w9RHfQ1cx
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 27 Oct 2020 18:41:26 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vej7=EC=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kXSyP-0007kP-DJ
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 17:41:29 +0000
X-Inumbo-ID: 7b7a67d3-fba9-4632-96f4-d737a761ccfd
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7b7a67d3-fba9-4632-96f4-d737a761ccfd;
	Tue, 27 Oct 2020 17:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603820486;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-ID:Subject:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=dWOUItY+RY70D0NE+mnLyN9YKkUEgUs8fxinAALuBwo=;
	b=tnNxfJsGYtWWembJ8P4jxCw351zppgZsh+p1YAE4yFxsdImsoNghgN2Y0W3hU14DsR
	V2a+JlcEXmF14JW5NR36jD4Um7IEunaekudXFgE16AJFydHKvxXm217cMeji4jGD7jVw
	I8pBJPY406mTnSCaFe4UetrVXHPaSNd5aP/PmUFvvt2H4+OfE1/NLEUmVwvLp90d3D9S
	dAJlIBdxhVDlmYFijmmiOZ4FEm3kAYLG6rd2NYkc9BuAL7QI8TnLOnQ3lfToRWoL6LwW
	hsNNM0tuJbjOHimq5w03tAMpWBvxAaSvXnLBfg3OAvaIFQTvEwQAxifulgQDC2nu7rm8
	Vrpg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+r+/A=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.3 DYNA|AUTH)
	with ESMTPSA id D03373w9RHfQ1cx
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
	Tue, 27 Oct 2020 18:41:26 +0100 (CET)
Date: Tue, 27 Oct 2020 18:41:19 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: inconsistent pfn type checking in process_page_data
Message-ID: <20201027184119.1d3f701e.olaf@aepfle.de>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/IUCnAdpwlNNSU68hTJ7Tgwj"; protocol="application/pgp-signature"

--Sig_/IUCnAdpwlNNSU68hTJ7Tgwj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Andrew,

with commit 93c2ff78adcadbe0f8bda57eeb30b1414c966324 a new function process=
_page_data was added. While filling the mfns array for xenforeignmemory_map=
, the individual pfn types[] are checked in a different way than the checki=
ng of the result of the mapping attempt.=20

Is there a special reason why the first loop uses the various TAB values, a=
nd the other loop checks XTAB/BROKEN/XALLOC? The sending side also uses the=
 latter.


Olaf

--Sig_/IUCnAdpwlNNSU68hTJ7Tgwj
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+YW78ACgkQ86SN7mm1
DoCJbxAAojX1wTd2kFu33GQqzlHl3MmJswVFzS2TlpZHqm6fjQ8wZ10qZp+a7jTW
ZpuEoJGsFzHPGLWfQ9PRuQlGXGYdov5ZmM2M8OVyBWTYi0BwseP6EpDfnIidbLpP
BF9g0Q6H7pckvHsoru1+1X68iah00HvovwZAxVuLtQQbufAQ0Ov/qAgM225LSw9x
7sCHBBUihyrwN18PsLRd0ByqIJwkYryX5q1UObkCrpDzs8XiVwusZSYeXmIZDIf9
qXQxgnyPonZU69sqz+ym4z5d3NdJnVDPJ/eAi5EnLjZbh09258kpy+tEVyXsSiwP
EczSwXMIrTi4nv+vE8hr4wecGHf11Sj+b2dEb4imU7ijQmTdiazfIxASjRW/5w9b
ephGwYrvBZaOYOtzsokLFa1c7zvvQnnLqe/UndAm1sBoOZuTGMG/rOHuIrmZhM7d
+cmYVGcwi3VUAPVcNC8VHLHzKxCwDwBDDhBuTY8cPAbUBvN1rmjHbLHC4AmDhdZh
m2gwXWB8Wk5iGEfm8nuZ7d1Hdl4oKyHstMNyWtWfRnJBGeiLEru1tvpKMByTIQhl
tsP3InZ1cxbarfmZ6RqJ5KDzCe+ZVSVMoENBO9T8mDialSSeCCw4DBmhYAmBA8f1
K0xBE0uaJH6gY9Z9mtMz9gWdkt5HT0ff85RdfwWi6/IywckYt/w=
=SMAb
-----END PGP SIGNATURE-----

--Sig_/IUCnAdpwlNNSU68hTJ7Tgwj--

