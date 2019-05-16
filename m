Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCAF1FFE3
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 08:57:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRAHB-0001K1-Ez; Thu, 16 May 2019 06:54:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZPM6=TQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hRAH8-0001Jw-KO
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 06:53:59 +0000
X-Inumbo-ID: 5eff2bd0-77a7-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::8])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5eff2bd0-77a7-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 06:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557989634;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Fd5tsUZBG3wQKVyZNPXtNqgUYCEl8sHigxsMMoWzic4=;
 b=Q/efwC6ZqmBjVlUTcYvd4FugH1cU9kg5CWvbSU+Ssh3kmfWyEVvigdcbYp8MyFIc+I
 5loajMgjmhU9spk3E7DfwNpCTYIOMpNS6bS2GL5BT4FU5EnE/tR4sVw2Xy/P8nicVyQs
 wxzuUeLgMiRu76qsHCzx3i9z/YzLLhuu7jCptLRxr/KyF4iuT4o3knAtrrDC4MZo0g7u
 QB2gwaUk4onUEpZukBx1XCS5DYAfOSZM8CfKrCPN7LND4Zbf8RrdkT6iXxd+7xloYRtX
 g0mwMVIWc0ol1RnwXk9yzq1yGEzGqtQfnyKtr/Uk4YJWDomc9LJh2c4HNL+qH/vZHtb+
 08BA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 AUTH)
 with ESMTPSA id U080cav4G6rlD5I
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 16 May 2019 08:53:47 +0200 (CEST)
Date: Thu, 16 May 2019 08:53:43 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Message-ID: <20190516085343.01250b3d.olaf@aepfle.de>
In-Reply-To: <20190515150632.16269-1-olaf@aepfle.de>
References: <20190515150632.16269-1-olaf@aepfle.de>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] hotplug/Linux: fix starting of xenstored
 with systemd
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
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============2358738765707162894=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2358738765707162894==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/=q6ML=f/DlTio6ClyIvX0gA"; protocol="application/pgp-signature"

--Sig_/=q6ML=f/DlTio6ClyIvX0gA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 15 May 2019 17:06:32 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> A followup change will remove the code which calls to sd_notify, they
> are not needed after the separation of Type=3Doneshot for domain and
> Type=3Dsimple for daemon.

This is not accurate. Type=3Dnotify has to be used because units that do
depend on xenstored must be started once it is ready to serve them.
The sd_notify exists exactly for this purpose, systemd can not assume
a daemon is ready right after exec().

I will rework this patch.

Olaf

--Sig_/=q6ML=f/DlTio6ClyIvX0gA
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN0I9wAKCRBdQqD6ppg2
fsR6AKCtg3B0eOqHNJZxsnL2BpuG4TMSkACgqE6+4FYOAHkUf71nMCry07/UF0A=
=2S9T
-----END PGP SIGNATURE-----

--Sig_/=q6ML=f/DlTio6ClyIvX0gA--


--===============2358738765707162894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2358738765707162894==--

