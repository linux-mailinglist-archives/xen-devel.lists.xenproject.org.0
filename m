Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2491582F2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 19:48:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1E4C-0005yW-LL; Mon, 10 Feb 2020 18:45:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qaH/=36=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j1E4B-0005yR-Q5
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 18:45:55 +0000
X-Inumbo-ID: 91371c08-4c35-11ea-b472-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91371c08-4c35-11ea-b472-bc764e2007e4;
 Mon, 10 Feb 2020 18:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581360355;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=HIWe98Q8kK8Y/PByWi4/Ldbu9516zRaQv5yzPB+nEc4=;
 b=UWW/34Mc5nbskd/q4DlBhQ/bhRjhqWMHkKvFlD4gelQiKM+094OFrqfl
 35QMF8sa693AJYtMyMlInyQ3xa64Y+6xj/UXcCowJmQGY7QpcJHsW/3uI
 ou71orKnfFV2ZpS8qsCWVtOtmYLfYcQTKyaRvAoLNKe0ew+HC9xTaqEsk I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SzPvN3P0+SW/Dx9012gRCqhJ297goluRr6SNd3kt8XbRdHgXbPLLTA4EXhtBhdH0gi6qF253on
 dUZp2qVjYyeFP1KBbb8kcyxRf9qmzw7/FBgiHbv5fZRsV9J1Mu5dFiT05tqzYxoHvMMhmy8Psz
 4CMwGmwRC/dEG42K6RO6lMRKigYq4MjIt7Lh2jynEKacN3h7INRTg3X8HA1gy2oQHCJup3GhRE
 sPRse+EI23kvezMqgu2G2+oE+6q0pCdkxKy3mJHDdyRYVo0X4oyIpAfBEqG4MEytBc4CFEYLDt
 no8=
X-SBRS: 2.7
X-MesageID: 12230334
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12230334"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 10 Feb 2020 18:45:49 +0000
Message-ID: <20200210184549.28707-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/arm: Restrict access to most HVM_PARAM's
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QVJNIGN1cnJlbnRseSBoYXMgbm8gcmVzdHJpY3Rpb25zIG9uIHRvb2xzdGFjayBhbmQgZ3Vlc3Qg
YWNjZXNzIHRvIHRoZSBlbnRpcmUKSFZNX1BBUkFNIGJsb2NrLiAgQXMgdGhlIHBhZ2luZy9tb25p
dG9yL3NoYXJpbmcgZmVhdHVyZXMgYXJlbid0IHVuZGVyIHNlY3VyaXR5CnN1cHBvcnQsIHRoaXMg
ZG9lc24ndCBuZWVkIGFuIFhTQS4KClRoZSBDQUxMQkFDS19JUlEgYW5kIHtTVE9SRSxDT05TT0xF
fV97UEZOLEVWVENITn0gZGV0YWlscyBleHBvc2VkIHJlYWQtb25seSB0bwp0aGUgZ3Vlc3QsIHdo
aWxlIHRoZSAqX1JJTkdfUEZOIGRldGFpbHMgYXJlIHJlc3RyaWN0ZWQgdG8gb25seSB0b29sc3Rh
Y2sKYWNjZXNzLiAgTm8gb3RoZXIgcGFyYW1ldGVycyBhcmUgdXNlZC4KClNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4KQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0Bl
cGFtLmNvbT4KClRoaXMgaXMgb25seSBjb21waWxlIHRlc3RlZCwgYW5kIGJhc2VkIG9uIG15IHJl
YWRpbmcgb2YgdGhlIHNvdXJjZS4gIFRoZXJlCm1pZ2h0IGJlIG90aGVyIFBBUkFNUyBuZWVkaW5n
IGluY2x1ZGluZy4KLS0tCiB4ZW4vYXJjaC9hcm0vaHZtLmMgfCA2NSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA2
MiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9odm0uYyBiL3hlbi9hcmNoL2FybS9odm0uYwppbmRleCA3NmIyN2M5MTY4Li4xNDQ2ZDQwMTBj
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vaHZtLmMKKysrIGIveGVuL2FyY2gvYXJtL2h2bS5j
CkBAIC0zMSw2ICszMSw2MCBAQAogCiAjaW5jbHVkZSA8YXNtL2h5cGVyY2FsbC5oPgogCitzdGF0
aWMgaW50IGh2bV9hbGxvd19zZXRfcGFyYW0oY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgaW50IHBhcmFtKQoreworICAgIHN3aXRjaCAoIHBhcmFtICkKKyAgICB7CisgICAgICAgIC8q
CisgICAgICAgICAqIFRoZSBmb2xsb3dpbmcgcGFyYW1ldGVycyBhcmUgaW50ZW5kZWQgZm9yIHRv
b2xzdGFjayB1c2FnZSBvbmx5LgorICAgICAgICAgKiBUaGV5IG1heSBub3QgYmUgc2V0IGJ5IHRo
ZSBkb21haW4uCisgICAgICAgICAqCisgICAgICAgICAqIFRoZSB7U1RPUkUsQ09OU09MRX1fRVZU
Q0hOIHZhbHVlcyB3aWxsIG5lZWQgdG8gYmVjb21lIHJlYWQvd3JpdGUgaWYKKyAgICAgICAgICog
YSBuZXcgQUJJIGhhc24ndCBhcHBlYXJlZCBieSB0aGUgdGltZSBtaWdyYXRpb24gc3VwcG9ydCBp
cyBhZGRlZC4KKyAgICAgICAgICovCisgICAgY2FzZSBIVk1fUEFSQU1fQ0FMTEJBQ0tfSVJROgor
ICAgIGNhc2UgSFZNX1BBUkFNX1NUT1JFX1BGTjoKKyAgICBjYXNlIEhWTV9QQVJBTV9TVE9SRV9F
VlRDSE46CisgICAgY2FzZSBIVk1fUEFSQU1fQ09OU09MRV9QRk46CisgICAgY2FzZSBIVk1fUEFS
QU1fQ09OU09MRV9FVlRDSE46CisgICAgY2FzZSBIVk1fUEFSQU1fUEFHSU5HX1JJTkdfUEZOOgor
ICAgIGNhc2UgSFZNX1BBUkFNX01PTklUT1JfUklOR19QRk46CisgICAgY2FzZSBIVk1fUEFSQU1f
U0hBUklOR19SSU5HX1BGTjoKKyAgICAgICAgcmV0dXJuIGQgPT0gY3VycmVudC0+ZG9tYWluID8g
LUVQRVJNIDogMDsKKworICAgICAgICAvKiBXcml0ZWFibGUgb25seSBieSBYZW4sIGhvbGUsIGRl
cHJlY2F0ZWQsIG9yIG91dC1vZi1yYW5nZS4gKi8KKyAgICBkZWZhdWx0OgorICAgICAgICByZXR1
cm4gLUVJTlZBTDsKKyAgICB9Cit9CisKK3N0YXRpYyBpbnQgaHZtX2FsbG93X2dldF9wYXJhbShj
b25zdCBzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgcGFyYW0pCit7CisgICAgc3dpdGNo
ICggcGFyYW0gKQorICAgIHsKKyAgICAgICAgLyogVGhlIGZvbGxvd2luZyBwYXJhbWV0ZXJzIGNh
biBiZSByZWFkIGJ5IHRoZSBndWVzdCBhbmQgdG9vbHN0YWNrLiAqLworICAgIGNhc2UgSFZNX1BB
UkFNX0NBTExCQUNLX0lSUToKKyAgICBjYXNlIEhWTV9QQVJBTV9TVE9SRV9QRk46CisgICAgY2Fz
ZSBIVk1fUEFSQU1fU1RPUkVfRVZUQ0hOOgorICAgIGNhc2UgSFZNX1BBUkFNX0NPTlNPTEVfUEZO
OgorICAgIGNhc2UgSFZNX1BBUkFNX0NPTlNPTEVfRVZUQ0hOOgorICAgICAgICByZXR1cm4gMDsK
KworICAgICAgICAvKgorICAgICAgICAgKiBUaGUgZm9sbG93aW5nIHBhcmFtZXRlcnMgYXJlIGlu
dGVuZGVkIGZvciB0b29sc3RhY2sgdXNhZ2Ugb25seS4KKyAgICAgICAgICogVGhleSBtYXkgbm90
IGJlIHJlYWQgYnkgdGhlIGRvbWFpbi4KKyAgICAgICAgICovCisgICAgY2FzZSBIVk1fUEFSQU1f
UEFHSU5HX1JJTkdfUEZOOgorICAgIGNhc2UgSFZNX1BBUkFNX01PTklUT1JfUklOR19QRk46Cisg
ICAgY2FzZSBIVk1fUEFSQU1fU0hBUklOR19SSU5HX1BGTjoKKyAgICAgICAgcmV0dXJuIGQgPT0g
Y3VycmVudC0+ZG9tYWluID8gLUVQRVJNIDogMDsKKworICAgICAgICAvKiBIb2xlLCBkZXByZWNh
dGVkLCBvciBvdXQtb2YtcmFuZ2UuICovCisgICAgZGVmYXVsdDoKKyAgICAgICAgcmV0dXJuIC1F
SU5WQUw7CisgICAgfQorfQorCiBsb25nIGRvX2h2bV9vcCh1bnNpZ25lZCBsb25nIG9wLCBYRU5f
R1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykKIHsKICAgICBsb25nIHJjID0gMDsKQEAgLTQ2
LDkgKzEwMCw2IEBAIGxvbmcgZG9faHZtX29wKHVuc2lnbmVkIGxvbmcgb3AsIFhFTl9HVUVTVF9I
QU5ETEVfUEFSQU0odm9pZCkgYXJnKQogICAgICAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdCgmYSwg
YXJnLCAxKSApCiAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKIAotICAgICAgICBpZiAoIGEu
aW5kZXggPj0gSFZNX05SX1BBUkFNUyApCi0gICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKLQog
ICAgICAgICBkID0gcmN1X2xvY2tfZG9tYWluX2J5X2FueV9pZChhLmRvbWlkKTsKICAgICAgICAg
aWYgKCBkID09IE5VTEwgKQogICAgICAgICAgICAgcmV0dXJuIC1FU1JDSDsKQEAgLTU5LDEwICsx
MTAsMTggQEAgbG9uZyBkb19odm1fb3AodW5zaWduZWQgbG9uZyBvcCwgWEVOX0dVRVNUX0hBTkRM
RV9QQVJBTSh2b2lkKSBhcmcpCiAKICAgICAgICAgaWYgKCBvcCA9PSBIVk1PUF9zZXRfcGFyYW0g
KQogICAgICAgICB7CisgICAgICAgICAgICByYyA9IGh2bV9hbGxvd19zZXRfcGFyYW0oZCwgYS5p
bmRleCk7CisgICAgICAgICAgICBpZiAoIHJjICkKKyAgICAgICAgICAgICAgICBnb3RvIHBhcmFt
X2ZhaWw7CisKICAgICAgICAgICAgIGQtPmFyY2guaHZtLnBhcmFtc1thLmluZGV4XSA9IGEudmFs
dWU7CiAgICAgICAgIH0KICAgICAgICAgZWxzZQogICAgICAgICB7CisgICAgICAgICAgICByYyA9
IGh2bV9hbGxvd19nZXRfcGFyYW0oZCwgYS5pbmRleCk7CisgICAgICAgICAgICBpZiAoIHJjICkK
KyAgICAgICAgICAgICAgICBnb3RvIHBhcmFtX2ZhaWw7CisKICAgICAgICAgICAgIGEudmFsdWUg
PSBkLT5hcmNoLmh2bS5wYXJhbXNbYS5pbmRleF07CiAgICAgICAgICAgICByYyA9IGNvcHlfdG9f
Z3Vlc3QoYXJnLCAmYSwgMSkgPyAtRUZBVUxUIDogMDsKICAgICAgICAgfQotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
