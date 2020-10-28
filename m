Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E0A29CF8C
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 11:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13511.34179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXisL-0004qd-K4; Wed, 28 Oct 2020 10:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13511.34179; Wed, 28 Oct 2020 10:40:17 +0000
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
	id 1kXisL-0004qE-GC; Wed, 28 Oct 2020 10:40:17 +0000
Received: by outflank-mailman (input) for mailman id 13511;
 Wed, 28 Oct 2020 10:40:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNQY=ED=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kXisJ-0004q7-MI
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 10:40:15 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5475cf1a-d720-46a5-83f3-168c66c8200d;
 Wed, 28 Oct 2020 10:40:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dNQY=ED=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kXisJ-0004q7-MI
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 10:40:15 +0000
X-Inumbo-ID: 5475cf1a-d720-46a5-83f3-168c66c8200d
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5475cf1a-d720-46a5-83f3-168c66c8200d;
	Wed, 28 Oct 2020 10:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603881614;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to;
  bh=wVuX0JfPsx41AzSgKSRFihW5gCEIrOulUBagCzQ2rDk=;
  b=O6mwHhOWrM4+Ccb6IEnDG37dfrQyP3B2bIhLfZzc2mA+gohrMi/j+BIe
   duBvMOmGng4LhAc2fYY0A1jWnP31mM+TZA9mnF8h1CgcPeRxCrrsVInHO
   sdNY+t1nRzaPmGH3amr8fsvvh4jBHnr756G+kb4RSQvAvlGJn5qW5bcRh
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8cLQOr5nG8EnxRvOuk4DZmmF4pWFM/NakMMBdp+BV+P3auRfNvcUPkhNV4CKMCZTDwobVm/+Kn
 GIph360J0IwdDBHxW7RKjXnpDek+1tqsJ3bqbuW/4wcX0FVqMFolXYSDerGyAIQx88o+8GyfTx
 gQq79w4I95jTJQr2v+bLHvVdyuLztoJKxhcMWz5+0gA6w9ooisG9Exvb5afU4nmHTzE/nd/cgv
 gHWm4ByTxDOPfdYxAhjlh64NJjWmbHZ1vYdd3lZh+yqf6QmBwvFRFLFD1YfQ7M3aOEXElp74LP
 tWQ=
X-SBRS: None
X-MesageID: 30289764
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,426,1596513600"; 
   d="asc'?scan'208";a="30289764"
Subject: Re: inconsistent pfn type checking in process_page_data
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>
References: <20201027184119.1d3f701e.olaf@aepfle.de>
 <6c595f1b-72cf-4f9e-5bad-eb0ebde45630@citrix.com>
 <20201028112805.34ae0c5d.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9eab5e65-ccaf-2f10-dea3-d91b4a6be402@citrix.com>
Date: Wed, 28 Oct 2020 10:39:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201028112805.34ae0c5d.olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="B1ne1FBauodjAqfrduvnYZaE92uAP4vh8"
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

--B1ne1FBauodjAqfrduvnYZaE92uAP4vh8
Content-Type: multipart/mixed; boundary="eimSeQqAIBTTEQBGOU5FWPdjtF0TNciFX"

--eimSeQqAIBTTEQBGOU5FWPdjtF0TNciFX
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 28/10/2020 10:28, Olaf Hering wrote:
> Am Tue, 27 Oct 2020 23:18:47 +0000
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> I suspect we probably want an is_known_page_type() predicate on the
>> source side to sanity check data from Xen, and on the destination side=

>> in handle_page_data() to sanity check data in the stream, and we
>> probably want a page_type_has_data() predicate to use in
>> write_batch()/process_page_data() to ensure that the handling is consi=
stent.
> From what I have seen, two (or three) helpers for sender and receiver w=
ill be needed:
> is_known_page_type()
> is_data_page_type()
> maybe is_ptbl_page_type() for normalise/localise.

Ah yes.=A0 That too.

I would however recommend against the name is_data_page_type() because
then the predicate is ambiguous with "=3D=3D NOTAB".

page_type_has_stream_data()?=A0 Its a bit of a mouthful, but the purpose
is very clear.

~Andrew


--eimSeQqAIBTTEQBGOU5FWPdjtF0TNciFX--

--B1ne1FBauodjAqfrduvnYZaE92uAP4vh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEzzVJW36m9w6nfSF2ZcP5BqXXn6AFAl+ZSnsACgkQZcP5BqXX
n6A8vBAAkUtSKB968OED2GEST7xxLYBm6ext/2HWLWeAtkS22TBwWdUFiGBlK88Y
L+SsQ37M06FIg04SRTibHrhHqQl4RhjlED4bsoP0T1zQPSlugc3T3sTNHldcdisF
2Ixk6q2J0+BDPrQMkR1F2prGhVCBpd6KMucJNrTAzxRp83irwXS0gqRXxGQZK/sX
dDaV223Ut3/v4Q4FC3ig2zU5O5AhZrh1DmOg2NK7Kv6nPDgo5HMLlJkI4DpWAJFS
tHVpbkCdAPeaYdbNaxyFtzkuboz4NicCcRKAT+xZOoG1lRSIC79XOQ52ulZCgNBP
UYSeV9z9kQ/vPM5ILiXKSTNd0eTuFlGRml+DDpyjv7FzaeKC/T0RGSrppLFH2ZNY
qm5lzrcDfw4UrBwankytBwMQIPe88wkOW+f9Xgg+NkNtft+EfxhRxc7oui0QVBuD
5djiScLvuFHSZZCc1I3EvSI5S1c1DPyHF/gs9EqldzLYDEZOV1dWDP8qqY8XaaZH
lQ0gKPo25pr3V/rV3YP0m0ZaapdXt9c91bBFdLIRNZY539tiNVNUBYWYqvWYJk9d
ddgd9b9F4umlA1/Yc90Zcp3vvtGiaPKUi24mg3M8SGIc/AUf5m3kWApgbfdq3QpC
OskFP/uzbJwzeqK+IQwZn1hWu9gfYW+s3L+rlQl89EXhv5T6/6c=
=IFFA
-----END PGP SIGNATURE-----

--B1ne1FBauodjAqfrduvnYZaE92uAP4vh8--

