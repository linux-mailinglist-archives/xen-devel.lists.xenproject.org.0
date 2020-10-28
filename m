Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE94329CF96
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 11:55:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13536.34203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXj6M-00064b-5k; Wed, 28 Oct 2020 10:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13536.34203; Wed, 28 Oct 2020 10:54:46 +0000
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
	id 1kXj6M-00064C-1t; Wed, 28 Oct 2020 10:54:46 +0000
Received: by outflank-mailman (input) for mailman id 13536;
 Wed, 28 Oct 2020 10:54:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LDgn=ED=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kXj6J-000647-Gl
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 10:54:44 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.23])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b618b0db-3d87-4272-97c6-873b8b3db9ed;
 Wed, 28 Oct 2020 10:54:41 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.3 DYNA|AUTH)
 with ESMTPSA id D03373w9SAse49x
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 28 Oct 2020 11:54:40 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LDgn=ED=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kXj6J-000647-Gl
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 10:54:44 +0000
X-Inumbo-ID: b618b0db-3d87-4272-97c6-873b8b3db9ed
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.23])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b618b0db-3d87-4272-97c6-873b8b3db9ed;
	Wed, 28 Oct 2020 10:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603882480;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=F5cVw0ub4nYD+6IzGEx8WGBH6p+u5cDBGyKNxKTF1lU=;
	b=AEUN0IXAvVCBPr74waEBjlH4YrpsJtNJQLc1avD4YOqdUc5SWeTMfEsR1bosLewMOV
	PARleDFNPFlKRvzWPH+yzO3ZH3+8Q/eo3bvscx4vyVVQnsacrMNuM1sHPr6gVgns9ZIH
	ZTV+1Cbnbr6SIovIUYeeO/t06SBPP6OQuhFTVIShCUXafdbLtzzEwZLa5k5MU41ygicv
	yqfzi6odfE9xb58DggzozhT4ljfUK91d/vm4/5VEadQ4tO/6sPxCvoiroVxMw4dIRhh4
	xodWxT4Hhes2SsGVtkGJQ1w12VbnbGjIfqbaGIjRve/nA4Xv/O/+RpWf2WqbweJM5YiH
	LoAg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+r+/A=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.3 DYNA|AUTH)
	with ESMTPSA id D03373w9SAse49x
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
	Wed, 28 Oct 2020 11:54:40 +0100 (CET)
Date: Wed, 28 Oct 2020 11:54:33 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: inconsistent pfn type checking in process_page_data
Message-ID: <20201028115433.4ebd168e.olaf@aepfle.de>
In-Reply-To: <9eab5e65-ccaf-2f10-dea3-d91b4a6be402@citrix.com>
References: <20201027184119.1d3f701e.olaf@aepfle.de>
	<6c595f1b-72cf-4f9e-5bad-eb0ebde45630@citrix.com>
	<20201028112805.34ae0c5d.olaf@aepfle.de>
	<9eab5e65-ccaf-2f10-dea3-d91b4a6be402@citrix.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/b6sFZ1kdsbbnR30yg.Vrgnh"; protocol="application/pgp-signature"

--Sig_/b6sFZ1kdsbbnR30yg.Vrgnh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 28 Oct 2020 10:39:55 +0000
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> I would however recommend against the name is_data_page_type() because
> then the predicate is ambiguous with "=3D=3D NOTAB".

Why is it ambiguous? It is not obvious to me.

page_type_has_stream_data() is certainly fine as a name.


Olaf

--Sig_/b6sFZ1kdsbbnR30yg.Vrgnh
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+ZTekACgkQ86SN7mm1
DoCNoRAAkYe0qOiHHRuJnfW7RsfU4F5+tg+ROk0pyXD0bGbfsv8ngAz17aCGYmze
DLqIDjC/nc4ZY9oougxQm6noYZwuAa443lWq7TQMrf5PlUSbQe3SEjAaOtiU3ulm
TQKnLm8O30HPzYnIrm/jvm5P9OZEv/Mu+YmQYoO0srvydi/NYcEYMZnn4y1ngglp
KCGy26PtBsTLz6fkSIe2g3FEdB/eHuGalpvj9zJp/lj5AKeYeE6Y56mHy2rkIioT
4/24EraqIcstJt4K2MxCSNiSWRzdArimToGIEx9p4B0+jlgvZI+TaFW2yKWtYOOj
FALaicDFYd/sREx/ICbS5dG9xolNJfWftuSawg1cmmYfWLqd3xw2+LmKm36DG7TW
+eJ9jvFJEybMAKkRdcG/6nrhROTHJtLIpI8TiBl+mcMwdM9YuN44IU+uyWN1Mxiq
EYSZ+yvgMFOyZFm8zbn9oSBwgnwbzV20SbTtOgR1/XWd39tUMhNQ4fTkPltBMYXr
hEbsAbyJ2NSAhlLCKwLc+ovTeCEZirWtfYrfn/psdngvAp92ESY1LDKKkwwM2tcD
VDgQHSFfnfib/UZw6KS6au4hM9hD8YlzpCzqsGbqq0iBhwdevz0sQdFg6KZ2yqRd
rjUCjLI7RYKdUFyjuTkJFzoTEh2N5fXjp/zZlyU/cca37Cut4YU=
=cIaJ
-----END PGP SIGNATURE-----

--Sig_/b6sFZ1kdsbbnR30yg.Vrgnh--

