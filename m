Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019403BBA25
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 11:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149984.277387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KrX-0003Ut-Lu; Mon, 05 Jul 2021 09:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149984.277387; Mon, 05 Jul 2021 09:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KrX-0003RQ-I9; Mon, 05 Jul 2021 09:25:59 +0000
Received: by outflank-mailman (input) for mailman id 149984;
 Mon, 05 Jul 2021 09:25:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0KrW-0003RK-3P
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 09:25:58 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.166])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 005eda2e-dd73-11eb-8440-12813bfff9fa;
 Mon, 05 Jul 2021 09:25:56 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx659PtL7z
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 11:25:55 +0200 (CEST)
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
X-Inumbo-ID: 005eda2e-dd73-11eb-8440-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625477155;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=y0Ymbe55rYi3lkV6wS54ZVsWy94bGThXvZ8g5xKRpic=;
    b=VgLFOS80X5gvfv57/M11wD4kwWdFYC1W3T91umskJzNop/4MVki0aXXim68nQ3alM8
    qnMQw7ZQaaXW7omQzOne09REDhLdjWHXB5+aaKHEcY3byJ1qVhzoCpnfxg314LV11GUv
    IawnPQk1P2n7AX9N+K5BTGSxvhrx5K9eHUoaYZnQSASR34vLD4dHIstCo1yttQmxFOqC
    u2+528OBf1lTrvPBsgju1TPf1Vu3fs5qKj0GZ2gBwnvVtQcoWQSCg/ghkTZfm9P3q3AI
    R9nNqdRRNvm7zzHLOU8Ovn2XdWWZl6UXoouccs2osod3+yIfXnKezPT31YtSTXIgr8vE
    FMKQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 11:25:48 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Xen-devel
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools/libxenguest: Fix migration's debug option
Message-ID: <20210705112548.22ae6d20.olaf@aepfle.de>
In-Reply-To: <1e2a3967-06e5-75ec-3aa5-1f39b6700e63@suse.com>
References: <20210702190342.31319-1-andrew.cooper3@citrix.com>
	<06968742-355f-ad37-0681-e51eea256414@suse.com>
	<20210705100228.4947ed4e.olaf@aepfle.de>
	<ed3ceecf-239f-9bd9-e040-5246c9b49f53@suse.com>
	<20210705103224.26f3835d.olaf@aepfle.de>
	<1e2a3967-06e5-75ec-3aa5-1f39b6700e63@suse.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HqW.YTqH9FVj8uTMxbBlZOI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HqW.YTqH9FVj8uTMxbBlZOI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 5 Jul 2021 11:19:59 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> "The interface" being which one? The tool stack can map the guest's
> grant table, so it is in the position to find out about all grants
> without further hypervisor help.

The interface means the code behind verify_frames.

If there are indeed ways to query which pages belong to grants, how would t=
he toolstack need to do that?


Olaf

--Sig_/HqW.YTqH9FVj8uTMxbBlZOI
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDi0BwACgkQ86SN7mm1
DoALlg/+LTM1mpqsWTwWf4F9+rmU+/lb34pFDxy9Vc1/LJe5b8CFUF3EavWN8VXY
J3asCPJR7FHXxL74dSAJ+8K4xQM5TRvflIp+7CFVPS7vAKM3x2mQG2KQ/6H+Cfzw
Qc2C1BlRjtBCsudAsBFN6cDFYPVAPmKVPLkOPpikrkHVpePKRz+llCFzQ/DpWGGU
cyboCxgcjzZE9649oHmdPkBTSYjwsRDTjA593wiTXnWgqC63Y5kKZJCPD589o09X
JNsQL02DpkF4+X/m1j4/POENEO6ZC1/51xSNv6Mg3pAMmFq1Rn7g2XayZ+v/C+i+
e8jdLB+gPb/ZXd/TrgmIK/gzBQqazyoIoevwRinl5ZMkFQi7c7S7LjGHg5kN1Uz2
398ns6TyNe6s0KcPDAFAR2QKlObyD2gVQuWHc2iqeq8jb2CaD9x6+drVzNSNTn/1
SjhyKyEmWFrbMtHjrmOfFe+SSeim5sgD/odLUltZy6+7uaZJX0PqQJ9YK9yiLhFu
/IDEdt8bifnKyS88n8J1aGbV34Sv6wy4alQ2O8uOSojnQleQz4yGb2muwnEGMwKq
uiB+5+TYGPjVS2wrG/fu2OXbWr8W5BhNc8GCD/b5Kb1xWubnY5p/jWk0E4eXen/g
6F4cjL/9lVMMxuWBWr99LlTUkoi6JuLFd20R8fO79FNaRXrJDnQ=
=nU6Z
-----END PGP SIGNATURE-----

--Sig_/HqW.YTqH9FVj8uTMxbBlZOI--

