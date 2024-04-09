Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC10989E0EC
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 19:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702541.1097669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruEpo-0000sw-0c; Tue, 09 Apr 2024 17:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702541.1097669; Tue, 09 Apr 2024 17:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruEpn-0000jI-Qr; Tue, 09 Apr 2024 17:00:35 +0000
Received: by outflank-mailman (input) for mailman id 702541;
 Tue, 09 Apr 2024 17:00:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pd+N=LO=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1ruEpm-0000Y6-Im
 for xen-devel@lists.xen.org; Tue, 09 Apr 2024 17:00:34 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac084a60-f692-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 19:00:31 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1ruEpb-0005A9-CJ; Tue, 09 Apr 2024 17:00:23 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1ruEpb-0000jN-81; Tue, 09 Apr 2024 17:00:23 +0000
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
X-Inumbo-ID: ac084a60-f692-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=CcBlvz101lK1NIoWtOiS8wZEyRsmzX7G5kSbkqvufOI=; b=GYDA/NTabsZfDbN+1Obr3GaUxu
	HjO7TplQr+D/4HLHotZJN9F4i7CQg4jUW7PMQWqvcl0VTxq9Mnty2oR7rr4Q9BTyHNg/K8MIE5HRT
	SKPZBApHq5UM9z1xJmogqucGWeA2UUtxBZXng2Kg2UTF7kBg+8vfd3hOUMcChub4ew5M=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 455 v4 (CVE-2024-31142) - x86: Incorrect
 logic for BTC/SRSO mitigations
Message-Id: <E1ruEpb-0000jN-81@xenbits.xenproject.org>
Date: Tue, 09 Apr 2024 17:00:23 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

             Xen Security Advisory CVE-2024-31142 / XSA-455
                                version 4

	     x86: Incorrect logic for BTC/SRSO mitigations

UPDATES IN VERSION 4
====================

Public release.

Correct references to prior XSAs.  The XSA fixing Branch Type Confusion
was XSA-407, not XSA-422 as previously stated.

ISSUE DESCRIPTION
=================

Because of a logical error in XSA-407 (Branch Type Confusion), the
mitigation is not applied properly when it is intended to be used.
XSA-434 (Speculative Return Stack Overflow) uses the same
infrastructure, so is equally impacted.

For more details, see:
  https://xenbits.xen.org/xsa/advisory-407.html
  https://xenbits.xen.org/xsa/advisory-434.html

IMPACT
======

XSAs 407 and 434 are unmitigated, even when the patches are in place.

VULNERABLE SYSTEMS
==================

All versions of Xen containing the XSA-407 fixes are vulnerable.

See XSAs 407 and 434 for details on which hardware is susceptible to
BTC/SRSO.

MITIGATION
==========

There are no mitigations.

CREDITS
=======

This issue was discovered by Andrew Cooper of XenServer.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that the Xen Security Team is intending to produce releases on all
stable trees, on the public embargo.  Therefore, this fix is expected to
be contained in the following release tags:

  RELEASE-4.18.2
  RELEASE-4.17.4
  RELEASE-4.16.6
  RELEASE-4.15.6

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa455.patch           xen-unstable - Xen 4.17.x
xsa455-4.16.patch      Xen 4.16.x - Xen 4.15.x

$ sha256sum xsa455*
96bcfcc0ce1afcc54f637c728ab5250c65f0a5a1d8ccfc59ac5d496baf1a53a4  xsa455.patch
02e3fe13ac68f665534fabae1520254d5d1832fef7c95fceb190be3b9944a5e1  xsa455-4.16.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches and/or mitigations described above (or
others which are substantially similar) is permitted during the
embargo, even on public-facing systems with untrusted guest users and
administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

Predisclosure list members who wish to deploy significantly different
patches and/or mitigations, please contact the Xen Project Security
Team.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmYVbQcMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZsY4IAJnYJTEEzhdG9+Qy/gcgwiKFB6lA5D6hQ1kAD739
fOh4GyA0ZYRLpfw8J4sVgYmPKl+S0Rx1qdt9X2GHVNIq5FqtFytx3lQt1VF4BTW6
kRHqqccHLKIo0MCRcNBw9wtn5BSQXpmJO9jpsazrBwxMPZpf2Z4mQhMO0aRxq2k7
Oyxz2O1ElNXzItuXM4ZT4OSR2pISjLC5mhKcauH3m/ecAbUwqEf6CjpvLXt7iI/0
OUqnZ7gO4m8fPoIaA0iT51o5Pb/EXTLnvyIrnlOL5C+xyNB8pQETP+cJZSnYYYWX
eNwQ+LwEgSHptPP09cbNFOnf+r1eJR22haPL2sMPveGbKRY=
=LR1k
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa455.patch"
Content-Disposition: attachment; filename="xsa455.patch"
Content-Transfer-Encoding: base64

RnJvbSA1YmM1NjEwMjRmODEzNzFmZjI2N2VkYWU3M2FlNGE3NjhiMmY3YTkx
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpEYXRlOiBUdWUsIDI2IE1h
ciAyMDI0IDIyOjQ3OjI1ICswMDAwClN1YmplY3Q6IHg4Ni9zcGVjLWN0cmw6
IEZpeCBCVEMvU1JTTyBtaXRpZ2F0aW9ucwoKV2Ugd2VyZSBsb29raW5nIGZv
ciBTQ0ZfZW50cnlfaWJwYiBpbiB0aGUgd3JvbmcgdmFyaWFibGUgaW4gdGhl
IHRvcC1vZi1zdGFjawpibG9jaywgYW5kIHhlbl9zcGVjX2N0cmwgd29uJ3Qg
aGF2ZSBoYWQgYml0IDUgc2V0IGJlY2F1c2UgWGVuIGRvZXNuJ3QKdW5kZXJz
dGFuZCBTUEVDX0NUUkxfUlJTQkFfRElTX1UgeWV0LgoKVGhpcyBpcyBYU0Et
NDU1IC8gQ1ZFLTIwMjQtMzExNDIuCgpGaXhlczogNTNhNTcwYjI4NTY5ICgi
eDg2L3NwZWMtY3RybDogU3VwcG9ydCBJQlBCLW9uLWVudHJ5IikKU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbnRy
eS5TIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vZW50cnkuUwppbmRleCA2MGIw
YjAwZWQwYWYuLjA3MWIzOTk3YjFjMCAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS9zdm0vZW50cnkuUworKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2
bS9lbnRyeS5TCkBAIC0xMDEsNyArMTAxLDcgQEAgX19VTkxJS0VMWV9FTkQo
bnN2bV9oYXApCiAgICAgICAgIC8qIFNQRUNfQ1RSTF9FTlRSWV9GUk9NX1NW
TSAgICBSZXE6ICVyc3A9cmVncy9jcHVpbmZvLCAlcmR4PTAgQ2xvYjogYWNk
ICovCiAKICAgICAgICAgLm1hY3JvIHN2bV92bWV4aXRfY29uZF9pYnBiCi0g
ICAgICAgICAgICB0ZXN0YiAgJFNDRl9lbnRyeV9pYnBiLCBDUFVJTkZPX3hl
bl9zcGVjX2N0cmwoJXJzcCkKKyAgICAgICAgICAgIHRlc3RiICAkU0NGX2Vu
dHJ5X2licGIsIENQVUlORk9fc3BlY19jdHJsX2ZsYWdzKCVyc3ApCiAgICAg
ICAgICAgICBqeiAgICAgLkxfc2tpcF9pYnBiCiAKICAgICAgICAgICAgIG1v
diAgICAkTVNSX1BSRURfQ01ELCAlZWN4CmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvaW5jbHVkZS9hc20vc3BlY19jdHJsX2FzbS5oIGIveGVuL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL3NwZWNfY3RybF9hc20uaAppbmRleCA2Mjk1MThj
YzY5MjUuLmMxOWIzOWQ4YzIwMCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2luY2x1ZGUvYXNtL3NwZWNfY3RybF9hc20uaAorKysgYi94ZW4vYXJjaC94
ODYvaW5jbHVkZS9hc20vc3BlY19jdHJsX2FzbS5oCkBAIC05MCw3ICs5MCw3
IEBACiAgICAgICAgIGp6ICAgICAuTFxAX3NraXAKICAgICAgICAgdGVzdGIg
ICQzLCBVUkVHU19jcyglcnNwKQogICAgIC5lbHNlCi0gICAgICAgIHRlc3Ri
ICAkU0NGX2VudHJ5X2licGIsIENQVUlORk9feGVuX3NwZWNfY3RybCglcnNw
KQorICAgICAgICB0ZXN0YiAgJFNDRl9lbnRyeV9pYnBiLCBDUFVJTkZPX3Nw
ZWNfY3RybF9mbGFncyglcnNwKQogICAgIC5lbmRpZgogICAgIGp6ICAgICAu
TFxAX3NraXAKIAo=

--=separator
Content-Type: application/octet-stream; name="xsa455-4.16.patch"
Content-Disposition: attachment; filename="xsa455-4.16.patch"
Content-Transfer-Encoding: base64

RnJvbSA5MDljZGRlOWYxMjZiZWFjOTg4OGU2YTFmZjIxZjA0MTRlZjg2ZmRi
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpEYXRlOiBUdWUsIDI2IE1h
ciAyMDI0IDIyOjQ3OjI1ICswMDAwClN1YmplY3Q6IHg4Ni9zcGVjLWN0cmw6
IEZpeCBCVEMvU1JTTyBtaXRpZ2F0aW9ucwoKV2Ugd2VyZSBsb29raW5nIGZv
ciBTQ0ZfZW50cnlfaWJwYiBpbiB0aGUgd3JvbmcgdmFyaWFibGUgaW4gdGhl
IHRvcC1vZi1zdGFjawpibG9jaywgYW5kIHhlbl9zcGVjX2N0cmwgd29uJ3Qg
aGF2ZSBoYWQgYml0IDUgc2V0IGJlY2F1c2UgWGVuIGRvZXNuJ3QKdW5kZXJz
dGFuZCBTUEVDX0NUUkxfUlJTQkFfRElTX1UgeWV0LgoKVGhpcyBpcyBYU0Et
NDU1IC8gQ1ZFLTIwMjQtMzExNDIuCgpGaXhlczogNTNhNTcwYjI4NTY5ICgi
eDg2L3NwZWMtY3RybDogU3VwcG9ydCBJQlBCLW9uLWVudHJ5IikKU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbnRy
eS5TIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vZW50cnkuUwppbmRleCBhZDVj
YTUwYzEyZTIuLmQxY2E1MzAzMTVmZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS9zdm0vZW50cnkuUworKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2
bS9lbnRyeS5TCkBAIC0xMDEsNyArMTAxLDcgQEAgX19VTkxJS0VMWV9FTkQo
bnN2bV9oYXApCiAgICAgICAgIC8qIFNQRUNfQ1RSTF9FTlRSWV9GUk9NX1NW
TSAgICBSZXE6ICVyc3A9cmVncy9jcHVpbmZvLCAlcmR4PTAgQ2xvYjogYWNk
ICovCiAKICAgICAgICAgLm1hY3JvIHN2bV92bWV4aXRfY29uZF9pYnBiCi0g
ICAgICAgICAgICB0ZXN0YiAgJFNDRl9lbnRyeV9pYnBiLCBDUFVJTkZPX3hl
bl9zcGVjX2N0cmwoJXJzcCkKKyAgICAgICAgICAgIHRlc3RiICAkU0NGX2Vu
dHJ5X2licGIsIENQVUlORk9fc3BlY19jdHJsX2ZsYWdzKCVyc3ApCiAgICAg
ICAgICAgICBqeiAgICAgLkxfc2tpcF9pYnBiCiAKICAgICAgICAgICAgIG1v
diAgICAkTVNSX1BSRURfQ01ELCAlZWN4CmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS9hc20teDg2L3NwZWNfY3RybF9hc20uaCBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvc3BlY19jdHJsX2FzbS5oCmluZGV4IDZlNzcyNWMxMWYzYS4uOTQx
NjQ4M2MwYjI2IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3Nw
ZWNfY3RybF9hc20uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3NwZWNf
Y3RybF9hc20uaApAQCAtMTAyLDcgKzEwMiw3IEBACiAgICAgICAgIGp6ICAg
ICAuTFxAX3NraXAKICAgICAgICAgdGVzdGIgICQzLCBVUkVHU19jcyglcnNw
KQogICAgIC5lbHNlCi0gICAgICAgIHRlc3RiICAkU0NGX2VudHJ5X2licGIs
IENQVUlORk9feGVuX3NwZWNfY3RybCglcnNwKQorICAgICAgICB0ZXN0YiAg
JFNDRl9lbnRyeV9pYnBiLCBDUFVJTkZPX3NwZWNfY3RybF9mbGFncyglcnNw
KQogICAgIC5lbmRpZgogICAgIGp6ICAgICAuTFxAX3NraXAKIAo=

--=separator--

