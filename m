Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E0F2C0F7E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 17:01:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34775.65994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khEGu-00048W-Nm; Mon, 23 Nov 2020 16:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34775.65994; Mon, 23 Nov 2020 16:00:56 +0000
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
	id 1khEGu-000487-Kf; Mon, 23 Nov 2020 16:00:56 +0000
Received: by outflank-mailman (input) for mailman id 34775;
 Mon, 23 Nov 2020 16:00:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rrc6=E5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1khEGr-000482-VE
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:00:54 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.22])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 597aee59-c80c-41a2-91b6-6e76a3bed4e2;
 Mon, 23 Nov 2020 16:00:52 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
 with ESMTPSA id V0b6ccwANG0hrJD
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 23 Nov 2020 17:00:43 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Rrc6=E5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1khEGr-000482-VE
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:00:54 +0000
X-Inumbo-ID: 597aee59-c80c-41a2-91b6-6e76a3bed4e2
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.22])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 597aee59-c80c-41a2-91b6-6e76a3bed4e2;
	Mon, 23 Nov 2020 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606147252;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=VUdBJc6ahXffD4ePwK9dNsIUxMg8YOVPnQnEip+4khE=;
	b=Ssnb0hVzCicshlGVT6JWrG7eI3G7C2ENLQ+++cShganlf85itSQ3K+FwqWBbzKsG/u
	qi8r2UKwwmvdrAJwdn4oCfHiMgLc6PC1+0sHsK01VcohMiy+JB8oBd0l6NZyWilIXFU3
	RC9jkN03r3VohN3/1pdLVpmrULEXmtx4AU0iT40rQGdthyZSmFAHoKbGo5Qy6Tpf+5bq
	9GFD/kCsv76oSihRmTii71Uffv68Qe3qR5wKVSdtOVahf7IOvyzQkJY6cWskI40BX6VM
	tGf8HC30e+YVAmPJmsPmSFq3IuMBAHEzi9lpP/gV862gWJzchuVRBS7VI6N3IVSslT+w
	4voA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+uX"
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
	with ESMTPSA id V0b6ccwANG0hrJD
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
	Mon, 23 Nov 2020 17:00:43 +0100 (CET)
Date: Mon, 23 Nov 2020 17:00:31 +0100
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1 00/23] reduce overhead during live migration
Message-ID: <20201123170031.147efdb1.olaf@aepfle.de>
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aTcd5+wmI6HVz+GTz8amsC8"; protocol="application/pgp-signature"

--Sig_/aTcd5+wmI6HVz+GTz8amsC8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

There was no feedback to this series within the past three weeks.

Please review this series.

Thanks,
Olaf

Am Thu, 29 Oct 2020 18:19:40 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> The current live migration code can easily saturate an 1Gb link.
> There is still room for improvement with faster network connections.
> Even with this series reviewed and applied.
> See description of patch #6.
>=20
> Olaf
>=20
> Olaf Hering (23):
>   tools: add readv_exact to libxenctrl
>   tools: add xc_is_known_page_type to libxenctrl
>   tools: use xc_is_known_page_type
>   tools: unify type checking for data pfns in migration stream
>   tools: show migration transfer rate in send_dirty_pages
>   tools/guest: prepare to allocate arrays once
>   tools/guest: save: move batch_pfns
>   tools/guest: save: move mfns array
>   tools/guest: save: move types array
>   tools/guest: save: move errors array
>   tools/guest: save: move iov array
>   tools/guest: save: move rec_pfns array
>   tools/guest: save: move guest_data array
>   tools/guest: save: move local_pages array
>   tools/guest: restore: move pfns array
>   tools/guest: restore: move types array
>   tools/guest: restore: move mfns array
>   tools/guest: restore: move map_errs array
>   tools/guest: restore: move mfns array in populate_pfns
>   tools/guest: restore: move pfns array in populate_pfns
>   tools/guest: restore: split record processing
>   tools/guest: restore: split handle_page_data
>   tools/guest: restore: write data directly into guest
>=20
>  tools/libs/ctrl/xc_private.c          |  54 ++-
>  tools/libs/ctrl/xc_private.h          |  34 ++
>  tools/libs/guest/xg_sr_common.c       |  33 +-
>  tools/libs/guest/xg_sr_common.h       |  86 +++-
>  tools/libs/guest/xg_sr_restore.c      | 562 +++++++++++++++++---------
>  tools/libs/guest/xg_sr_save.c         | 158 ++++----
>  tools/libs/guest/xg_sr_save_x86_hvm.c |   5 +-
>  tools/libs/guest/xg_sr_save_x86_pv.c  |  31 +-
>  8 files changed, 666 insertions(+), 297 deletions(-)

--Sig_/aTcd5+wmI6HVz+GTz8amsC8
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+73KAACgkQ86SN7mm1
DoCrxA//WUzp3ahy/fcxMkrL3ZqAp4DAFOGGG0lTIZwPmgpP+cRzCiWCRbt9Ky6R
4DOYKw/JLndXc6sxvhuKoFdK0SBRidIFkFlIjymkvvtCpE1mk6mHhh5lcEusvtfh
URII1DfazKhlc71o7KvQPKGOEVWx4LjwMDvyPtkJzbfamB9dH5WyKpG/UtB6dWVy
oiJ/20TJqEN/oj4Z3T70jCyWnxrpH2XIpofmBFIsYdvSfufoZJfNiPPnBGzc0PVC
GWHy2qU6CzpmrKlwVLaIiO87FFLPFknDeiqMIemaPst9ZG9V6YoR2v+E/dKuffWa
rcFaIehNu74l13P1iCZf2Vkd25/E3/Xqjt78kb35gQUwsBCbVqt+xLwkNPrsVTr9
fW3d5rEs0dJLyszZnFnHgcEbqcWjO/K3DskoE9C5OZ+KEzV8UG5P5mwMedrFfs0g
GRe65lJfrDB66jbgzZDoAq3MU/kfnYC3/F5rAU7/OU/4izl6tQDUQ9aoahdND1l+
YyBRDN7pdyjbGcsucyx7p5W9HJ2JEOO6g94v1BvS4Zf+PxdnRXn+tOPmajYaq/BX
/pQcDoSriwNCDqzMW6pWy3iPOqyErn6icMmJ5AW5fv+aRx4+2I8PNvqPNeFGgAo6
QndxMmGW0aJxyDkewP08/t40Fpi7m0MIYLKderI/xnVj/sKINS8=
=HdJZ
-----END PGP SIGNATURE-----

--Sig_/aTcd5+wmI6HVz+GTz8amsC8--

