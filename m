Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63DC32425B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 17:46:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89439.168464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lExIW-0006Pj-F9; Wed, 24 Feb 2021 16:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89439.168464; Wed, 24 Feb 2021 16:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lExIW-0006PK-Bf; Wed, 24 Feb 2021 16:46:00 +0000
Received: by outflank-mailman (input) for mailman id 89439;
 Wed, 24 Feb 2021 16:45:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJIr=H2=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1lExIU-0006PF-Ev
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 16:45:58 +0000
Received: from sender4-of-o53.zoho.com (unknown [136.143.188.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2b47e9f-6b30-4f7c-83cc-f27fbf2b3e88;
 Wed, 24 Feb 2021 16:45:57 +0000 (UTC)
Received: from [10.137.0.21] (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 16141851508431001.740919718517;
 Wed, 24 Feb 2021 08:45:50 -0800 (PST)
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
X-Inumbo-ID: e2b47e9f-6b30-4f7c-83cc-f27fbf2b3e88
ARC-Seal: i=1; a=rsa-sha256; t=1614185152; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iEdYVXzb+3X81H6Jy1PbvV3ftMsCCULRcPojEtrB6FqlcmGGRy0o+aOu29Me5bSq8SnAtZTpiMBoTaRaG9yafGlI9JrgHd+0v14pvIaiFAH5yjalCXUPm6tvKhVmLScztAWdY3NqWSFxbCd2wvjm0TFJcFCExsFTjAoNFId4hfE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1614185152; h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=3aO4vYChz/tBuPBqKRr8E+jZ80t6iAFdBIR/Tj2Xje8=; 
	b=GgBocbMZGVuVJOE6dI0lEsbTRKEE4hR9GL9adZY1JMPdBQAyh/d4kgTXJwv8KjSS2KRYefxM3y7iLTzrZJ2plbiN6V0vja1BRkU0HV/8qwzWNPFxPBRPJpVBI8ARJmlZxTBEAdqCaCH3IF4ndvp+GX9CRM+1dCt5XGCjTbocy9Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1614185152;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type;
	bh=3aO4vYChz/tBuPBqKRr8E+jZ80t6iAFdBIR/Tj2Xje8=;
	b=gWNJ5Np/Oe1Zo7jX+rAVItScGC/NmXWjabGm+c2W9d7Lfumz64FXAUa29Qa1103t
	syvzvIjZ+yo+UJ3i+VwE/eY2v7yM1HKLxaIpRytAwWIpT4ReqAsBa0qnxsQ01mT9/rc
	sofbrjxMA6cvEHMIjnkEUS+dS+/4xC4B2Sydy8SM=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Subject: io-apic issue on Ryzen 1800X
Message-ID: <ee7670ff-b140-a518-2094-df0e3e5f2575@qubes-os.org>
Date: Wed, 24 Feb 2021 17:45:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AJupDhSlSMsYN3rOx4fvcA6t7S8yeZkXk"
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AJupDhSlSMsYN3rOx4fvcA6t7S8yeZkXk
Content-Type: multipart/mixed; boundary="YW6kU6UFNsdYsJFX3VFue4w0OY3J4K7PP";
 protected-headers="v1"
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <ee7670ff-b140-a518-2094-df0e3e5f2575@qubes-os.org>
Subject: io-apic issue on Ryzen 1800X

--YW6kU6UFNsdYsJFX3VFue4w0OY3J4K7PP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,
Just to inform you that after talking with Andrew, we identified that lat=
est workaround for recent Intel laptop (this series of patches https://gi=
thub.com/QubesOS/qubes-vmm-xen/commit/075e6b1) is failing on my system ha=
ving AMD Ryzen 1800X CPU and Asrock X370 Gaming K4 as motherboard.

Related Qubes issue tracking this: https://github.com/QubesOS/qubes-issue=
s/issues/6423

Best regards,
Fr=C3=A9d=C3=A9ric


--YW6kU6UFNsdYsJFX3VFue4w0OY3J4K7PP--

--AJupDhSlSMsYN3rOx4fvcA6t7S8yeZkXk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAmA2kMsACgkQSEAQtc3F
duLwWxAAvg5be62m0lvL7MNv9MPMGo5iKLIgt6VivOMGvU9j09AywRr6deBuiVLl
u8VffSElO6OKjEvhN4Wjzw5oqPNk8Z8iy+m/lDcemCKjBFGy56uR6V5DBmkkDuPg
cCt9mQ3bz93NzHqjhNrD1KSeALlBIfgmC3u229BhasHKuq/jRyVP7UoSloqFU+8r
JausEqMze5//uhk3BsqgIFrHRFvssuoK9ghA7DyP4yPohL4wnBDbYlWqszz+2Y1C
MEfhi8UyB5Kg95qTkW5iGeTGe6Xe7NDZmOiyQIvq1n/GBE+hfPWDTlSQXJSZ+omf
SugLo5q2pNvTN4H2reFN1yM0WI/WC0zuuIZ50Q2r/WZRXNDBK/ET4VJfI+8sBZpD
p7slP0Q960LVOQ5b0ZiJnjaX1XeGthVXlwumr6Li326Y/Pt+F6pqQWsk+Iw0yEdA
xYQdot+gQ4vF19n/OAFF6rMf89H4HTRjP+l2JwCgMgyHSuRM6SbxeiDz4HW6JNJK
+Tz7t+ZqxgiHezNunsRjA8TfMa73Uzj/WQo+9J5+htfT2tj3sqJ3ZPoIqCKbL5ci
UtlqqVkmkLOSMH/RuOypg9GNDVd5J5r+am4GH3hwYtsPpQPrumj+w8afag9B45QT
6wmdpasZPomKpZDulDU/mk7FRnFznm7zs4PPVCfh+1B+ilBRHtk=
=MkC9
-----END PGP SIGNATURE-----

--AJupDhSlSMsYN3rOx4fvcA6t7S8yeZkXk--

