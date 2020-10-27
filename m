Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F02E129A9ED
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 11:42:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12772.33093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMQt-0001c1-75; Tue, 27 Oct 2020 10:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12772.33093; Tue, 27 Oct 2020 10:42:27 +0000
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
	id 1kXMQt-0001bc-3u; Tue, 27 Oct 2020 10:42:27 +0000
Received: by outflank-mailman (input) for mailman id 12772;
 Tue, 27 Oct 2020 10:42:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vej7=EC=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kXMQr-0001bX-LR
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:42:25 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9702663-dd25-4b81-8dfa-62095dbfc9df;
 Tue, 27 Oct 2020 10:42:24 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.2 DYNA|AUTH)
 with ESMTPSA id R05874w9RAgM3fx
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 27 Oct 2020 11:42:22 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vej7=EC=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kXMQr-0001bX-LR
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:42:25 +0000
X-Inumbo-ID: e9702663-dd25-4b81-8dfa-62095dbfc9df
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.54])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e9702663-dd25-4b81-8dfa-62095dbfc9df;
	Tue, 27 Oct 2020 10:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603795343;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=qF5Ylhn24R/t4ae1fOOGTbYfc4h8/HVKWIyjTvOpC4E=;
	b=tv9g/xucdz/9PvDHMDOcuLSM/NnARw96s4w8J3CJQeMo0BtlV5mvpcIrWa3fDkAaC2
	qEuW9t9QXePCDvFklGOYr2KTDY1Xdh6hFvrMKRug+kQEI6auiHHmUCTlcTeerdl94j9A
	x0QEMG+p9hlY96TkECEg/aqYjx6KiYrlQRZkdGqZ+usdtw79NeKrSk5RogVZ30fAjr+D
	3NGV+sgS/DcLGWrC+4Z9VvrmoqcM7XyX8dHj3KWHB96SNLsdAjc52Cs0ll54g8fU8YgG
	TNghxjF+VSicf0O3JCr7/DrTMv2hJvtcFcQX8hu03dapgQqSDupEh3glFbg6sy5Xax/y
	38bQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+r+/A=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.2 DYNA|AUTH)
	with ESMTPSA id R05874w9RAgM3fx
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
	Tue, 27 Oct 2020 11:42:22 +0100 (CET)
Date: Tue, 27 Oct 2020 11:42:14 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: flawed Makefile dependencies in libacpi
Message-ID: <20201027114214.22b36cb0.olaf@aepfle.de>
In-Reply-To: <0729e4ae-c513-9a1e-ab02-cf051cee6845@suse.com>
References: <20201027104548.5823c554.olaf@aepfle.de>
	<d6e3a7b0-129e-9b47-8802-b71eb8642519@suse.com>
	<da99d577-ce8d-8fcf-c157-5b91ee895097@suse.com>
	<20201027113024.36948380.olaf@aepfle.de>
	<0729e4ae-c513-9a1e-ab02-cf051cee6845@suse.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dGw3DT2Npa8EK+yqn6gy.pE"; protocol="application/pgp-signature"

--Sig_/dGw3DT2Npa8EK+yqn6gy.pE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 27 Oct 2020 11:38:04 +0100
schrieb Jan Beulich <jbeulich@suse.com>:

> I guess I'll make a patch then.

Thanks. I briefly looked at the code and it is not obvious how it would nee=
d to look like.

Olaf

--Sig_/dGw3DT2Npa8EK+yqn6gy.pE
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+X+YYACgkQ86SN7mm1
DoCFphAAla82wzwMA9rZxIfvfYvMoOJqsIcJWqUuRnBSHlW6K3a5z3K4yb7rxced
4tbTLF7afZLPshaEf2FX+H71BFoupKNxSZhwlcCHuPnBlBp7gnzNQe/hF3hBVxiF
aw8q+vvG6WbXlGb/HgnRer7O47WmBZ3M97gn+20POUs3ztHSTVrpGNYTqrfTGEca
iURiVZCzH4d4RQqgA44sTSmrpR/hyh9csSRq5Zh1xQtdAglsZRP+5PkGVbaHt0T9
9hgGgsvsTlDpizf5DCnTYP1sMCihnRL1eQjtWtE+AfRPaLyq0T+FiHYwhVXC0ayY
aa+ZnzrLu6Dv6NG0ziTChKssy981S9JOeRXEhRu88D+AvP08or+SQkOKjLBzP0fn
ftc0ofef1ASeTjA6Mqtvdbky/eVroRjY8mBBNKyzcIcZ7FCKSQiB9qUsChD/cTtO
RSGW83b8HWG/OABj4a+NRRkqlwv3d4cG6H6noWXN7lEsU/yc5Nf60RdlWEAWZQ3I
3FqWKk2dKh+T/G1rjNgC5AMB6vgdJiwYtSwOrZeYM/vs+91yNmgP0ckjOtndoBlC
0wl6yOz/YfmJ8kHugSMbZRhcNzzOs5FbTEbyjmyj8tgD/OiSrrvLlIpi7NO7j6Xa
tfs9QrAoyuBBvSTc6PqsMOOBq2dMbgjbOO5Q5zfcWclBgJw/QF8=
=kCmi
-----END PGP SIGNATURE-----

--Sig_/dGw3DT2Npa8EK+yqn6gy.pE--

