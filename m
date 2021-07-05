Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673983BB905
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 10:23:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149902.277243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JsH-00079S-AA; Mon, 05 Jul 2021 08:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149902.277243; Mon, 05 Jul 2021 08:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JsH-000774-7A; Mon, 05 Jul 2021 08:22:41 +0000
Received: by outflank-mailman (input) for mailman id 149902;
 Mon, 05 Jul 2021 08:22:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0JsF-00076y-Db
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:22:39 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.80])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2860f092-dd6a-11eb-843f-12813bfff9fa;
 Mon, 05 Jul 2021 08:22:38 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx658MWKif
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 10:22:32 +0200 (CEST)
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
X-Inumbo-ID: 2860f092-dd6a-11eb-843f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625473353;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=TTZhBPHaLZHYqgrLV6CgQpnqgWoQZfzZzROPIhu2JMs=;
    b=oK8oCkZO00ccyeQLKj013PBi/qR7VwIpyYgMf9bK5Z6doerTQVMZ+4TYdukudELITF
    82VqpnorjyMS5EWbnpz+7iIILAR4d5gXYerIkXJvFH9QdPob7n7JEIhy7ff0erUjM5MI
    R6r56TiaZ7f7AaydwAmimzb3bgVVy0Ug9tWpOaKSrErvjJpwEp+5hwc/yOeafunKdHCK
    BMDSRpk6pXUOr3sdluVBYqgnH3NTm0W4tK2JvOqkBD6q3DPnMJJc66RbRvFpJR5I23z9
    JLdwEoOmUqad1gspSzm3lv87+C7xZJruTFyZc/PTUXLTSPi2WWP7b3Xw0+eiuLaV6HB7
    UlMA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 10:22:30 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v20210701 10/40] tools: add xc_is_known_page_type to
 libxenctrl
Message-ID: <20210705102230.48a86473.olaf@aepfle.de>
In-Reply-To: <3c0efa9b-aaff-b4b7-0fd5-9eed32b20e01@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-11-olaf@aepfle.de>
	<3c0efa9b-aaff-b4b7-0fd5-9eed32b20e01@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LXSuzQd6=G1afiLJ6WN7rZ1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LXSuzQd6=G1afiLJ6WN7rZ1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Fri, 2 Jul 2021 20:20:08 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Subject needs correcting after v2.

Apparently I missed some places while removing the old "xc_" prefix.

> However, given that this is in the save/restore common header, does it
> really need a prefix?=C2=A0 Simply is_known_page_type() seems good enough.

Sure, the possibility of clashes is probably low.


> > +/* Sanitiy check for types returned by Xen */
> > +static inline bool sr_is_known_page_type(xen_pfn_t type) =20
> uint32_t

Why is this better than returning 'bool'?

> I can fix up everything on commit if you're happy with the suggestions.

Yes, I'm certainly fine with it.


Olaf

--Sig_/LXSuzQd6=G1afiLJ6WN7rZ1
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDiwUYACgkQ86SN7mm1
DoAFhhAAlAs5jdLBG/51YrRTD7/0TLw1xlnNkmG63DhqGiVBsDvTjjMSo6AjBvq+
I0t+/ytpMuGsiUsMuck3qaW1Gj0EXEXVugqOrBeRClC6YrU00E5ITXh6YDdiRgG/
NdodWDYfu2aBBQ2E+BIRv3oOMSWUi/oEnTzSb9gx7lgVfwjnr3F2nadv79C9Q3Zg
r8Xac52brDzINigl5DAe4ycZDSDGo2tydQVBxLRNCd5T0FB3gRVm1ILLtDjmoorP
sw+qdFWzfRZU/KT+KYBG+1V0guTqPp2wfWRRE3scHaxHlkPqwKcQ0UJpj90Hr60A
HcJ+KcMK1xvDDoBtNsVMVdHUAievcS57YG2LBjWxdf9ni6B6Ha0CKoyMTo237dkW
beqxHvQb2kc15yQ6M3DiYehaLp5NgzNDkKu2UYHWO1h2aPeofcwWvd1fKicL8cHD
H36wz3QvIt9MuVLO+8pMWCKBFJH1mDhg89m2iV9BVMLG+2Unwgjr/LFiGEKTLtWO
ny9ZX8KPJwcJ/v93CuRR7PmG5jj2PfvF3yo6ADo7YDS1ywH3voN+o0k18V7CwXVA
Sc31Go1L58yUHKqgI88jQ8PTQ37U/RfN+1Clu6T6AkEcvDTzXMW5ihEc+DKbLn0I
z6H/1/H7cphjXsletWrACqKlhETfQiivUUwLIGR+qoVfcGF4bk0=
=reY6
-----END PGP SIGNATURE-----

--Sig_/LXSuzQd6=G1afiLJ6WN7rZ1--

