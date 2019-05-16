Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADFD2024D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 11:11:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRCMa-0005bn-4i; Thu, 16 May 2019 09:07:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ADxN=TQ=suse.com=ohering@srs-us1.protection.inumbo.net>)
 id 1hRCMX-0005bi-Po
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 09:07:41 +0000
X-Inumbo-ID: 0decfe80-77ba-11e9-b0bb-8f271afb4eda
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0decfe80-77ba-11e9-b0bb-8f271afb4eda;
 Thu, 16 May 2019 09:07:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC91BAD3A;
 Thu, 16 May 2019 09:07:38 +0000 (UTC)
Date: Thu, 16 May 2019 11:07:35 +0200
From: Olaf Hering <ohering@suse.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190516110735.67e19d15.ohering@suse.com>
In-Reply-To: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Regression in xen-unstable due to commit
 3802ecbaa9eb36
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============0358537116439737730=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0358537116439737730==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/svK8nDfw7hPuqO=Wo+I7R/s"; protocol="application/pgp-signature"

--Sig_/svK8nDfw7hPuqO=Wo+I7R/s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 10:09:38 +0200
schrieb Juergen Gross <jgross@suse.com>:

> The patch "libxl: add helper function to set device_model_version"
> breaks creating any domain for me.

The issue is, create_domain will eventually call freemem.
If autoballoon is set, due to dom0_mem=3D for example, all is fine.
If memory has to be freed, libxl_domain_need_memory will get an
incomplete b_info. Somehow the new libxl__domain_set_device_model
must be called for the d_config returned by parse_config_data.

How should this be fixed?

Olaf

--Sig_/svK8nDfw7hPuqO=Wo+I7R/s
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN0oVwAKCRBdQqD6ppg2
fu7vAJ4joy7FXfTYhBXpMb+Td4tBzvCCWwCbBGcNpyzsibwKTuMvr6AnmVvmvfY=
=qbnA
-----END PGP SIGNATURE-----

--Sig_/svK8nDfw7hPuqO=Wo+I7R/s--


--===============0358537116439737730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0358537116439737730==--

