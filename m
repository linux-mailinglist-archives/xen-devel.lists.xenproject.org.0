Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4683045B69
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:28:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkKG-0007R9-GG; Fri, 14 Jun 2019 11:24:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbkKE-0007Qu-Hc
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:24:54 +0000
X-Inumbo-ID: 07137794-8e97-11e9-9525-b3ca68e02144
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07137794-8e97-11e9-9525-b3ca68e02144;
 Fri, 14 Jun 2019 11:24:52 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XV6IkCd2Yu3yQY891cXZmwjY2QZ7ckJPuBvkdhG6xmtOo6cZ9fwf2ez6E+98XUnEf88pG2/kTM
 Qu47Tfj6jD2LU/c+HPGG8PGhYIByLlKIJgnA/POn6rZv/407u9LTbh6ZDUqlUjpMmGaquyMjT8
 80Iyt23CB9lL6aK/V0rZA3fuEz6cPfLkCowttdcr+feJOvkQB4GxtHoJKQ1UlrNvcCFNGc3iZf
 rmxb1gfnttuqdvGhgnpiEIqddAQW3xHtAgiV8EMvERJsZ/siNacEwqnjuw4c7zn/6Fzg+EONMb
 G7Y=
X-SBRS: 2.7
X-MesageID: 1737465
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1737465"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 12:24:34 +0100
Message-ID: <20190614112444.29980-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614112444.29980-1-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 05/15] libxl_pci: `starting' is a bool
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
Cc: Anthony
 PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGFyZ3VtZW50IGBzdGFydGluZycgaXMgdXNlZCBhcyBhIGJvb2xlYW4sIGNoYW5nZSBpdHMg
dHlwZSB0bwpyZWZsZXggdGhhdCB0aHJvdWdob3V0IGxpYnhsX3BjaS5jLgoKTm8gZnVuY3Rpb25h
bCBjaGFuZ2VzLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICAzICsrLQog
dG9vbHMvbGlieGwvbGlieGxfcGNpLmMgICAgICB8IDE0ICsrKysrKysrLS0tLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFs
LmgKaW5kZXggMDE0MTEzODJmZC4uODQ2MjI3YzNjZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC0x
NTQwLDcgKzE1NDAsOCBAQCBfaGlkZGVuIGludCBsaWJ4bF9fcGNpX3RvcG9sb2d5X2luaXQobGli
eGxfX2djICpnYywKIAogLyogZnJvbSBsaWJ4bF9wY2kgKi8KIAotX2hpZGRlbiBpbnQgbGlieGxf
X2RldmljZV9wY2lfYWRkKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLCBsaWJ4bF9kZXZp
Y2VfcGNpICpwY2lkZXYsIGludCBzdGFydGluZyk7CitfaGlkZGVuIGludCBsaWJ4bF9fZGV2aWNl
X3BjaV9hZGQobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2LCBib29sIHN0YXJ0aW5n
KTsKIF9oaWRkZW4gaW50IGxpYnhsX19kZXZpY2VfcGNpX2Rlc3Ryb3lfYWxsKGxpYnhsX19nYyAq
Z2MsIHVpbnQzMl90IGRvbWlkKTsKIF9oaWRkZW4gYm9vbCBsaWJ4bF9faXNfaWdkX3ZnYV9wYXNz
dGhydShsaWJ4bF9fZ2MgKmdjLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29uZmlnKTsKZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhsL2xpYnhsX3BjaS5jIGIvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKaW5kZXggZDJk
MzdiZTc1ZC4uZjIwNGFjOWZiNyAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMK
KysrIGIvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKQEAgLTExNiw3ICsxMTYsNyBAQCBzdGF0aWMg
aW50IGxpYnhsX19jcmVhdGVfcGNpX2JhY2tlbmQobGlieGxfX2djICpnYywgdWludDMyX3QgZG9t
aWQsCiBzdGF0aWMgaW50IGxpYnhsX19kZXZpY2VfcGNpX2FkZF94ZW5zdG9yZShsaWJ4bF9fZ2Mg
KmdjLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
ZG9taWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBs
aWJ4bF9kZXZpY2VfcGNpICpwY2lkZXYsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgc3RhcnRpbmcpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBib29sIHN0YXJ0aW5nKQogewogICAgIGZsZXhhcnJheV90ICpiYWNrOwogICAg
IGNoYXIgKm51bV9kZXZzLCAqYmVfcGF0aDsKQEAgLTk4Myw3ICs5ODMsOCBAQCBzdGF0aWMgaW50
IHFlbXVfcGNpX2FkZF94ZW5zdG9yZShsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKICAg
ICByZXR1cm4gcmM7CiB9CiAKLXN0YXRpYyBpbnQgZG9fcGNpX2FkZChsaWJ4bF9fZ2MgKmdjLCB1
aW50MzJfdCBkb21pZCwgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2LCBpbnQgc3RhcnRpbmcpCitz
dGF0aWMgaW50IGRvX3BjaV9hZGQobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCisgICAg
ICAgICAgICAgICAgICAgICAgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2LCBib29sIHN0YXJ0aW5n
KQogewogICAgIGxpYnhsX2N0eCAqY3R4ID0gbGlieGxfX2djX293bmVyKGdjKTsKICAgICBsaWJ4
bF9kb21haW5fdHlwZSB0eXBlID0gbGlieGxfX2RvbWFpbl90eXBlKGdjLCBkb21pZCk7CkBAIC0x
MTY0LDcgKzExNjUsNyBAQCBpbnQgbGlieGxfZGV2aWNlX3BjaV9hZGQobGlieGxfY3R4ICpjdHgs
IHVpbnQzMl90IGRvbWlkLAogewogICAgIEFPX0NSRUFURShjdHgsIGRvbWlkLCBhb19ob3cpOwog
ICAgIGludCByYzsKLSAgICByYyA9IGxpYnhsX19kZXZpY2VfcGNpX2FkZChnYywgZG9taWQsIHBj
aWRldiwgMCk7CisgICAgcmMgPSBsaWJ4bF9fZGV2aWNlX3BjaV9hZGQoZ2MsIGRvbWlkLCBwY2lk
ZXYsIGZhbHNlKTsKICAgICBsaWJ4bF9fYW9fY29tcGxldGUoZWdjLCBhbywgcmMpOwogICAgIHJl
dHVybiBBT19JTlBST0dSRVNTOwogfQpAQCAtMTE4Niw3ICsxMTg3LDggQEAgc3RhdGljIGludCBs
aWJ4bF9wY2lkZXZfYXNzaWduYWJsZShsaWJ4bF9jdHggKmN0eCwgbGlieGxfZGV2aWNlX3BjaSAq
cGNpZGV2KQogICAgIHJldHVybiBpICE9IG51bTsKIH0KIAotaW50IGxpYnhsX19kZXZpY2VfcGNp
X2FkZChsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwgbGlieGxfZGV2aWNlX3BjaSAqcGNp
ZGV2LCBpbnQgc3RhcnRpbmcpCitpbnQgbGlieGxfX2RldmljZV9wY2lfYWRkKGxpYnhsX19nYyAq
Z2MsIHVpbnQzMl90IGRvbWlkLAorICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kZXZp
Y2VfcGNpICpwY2lkZXYsIGJvb2wgc3RhcnRpbmcpCiB7CiAgICAgbGlieGxfY3R4ICpjdHggPSBs
aWJ4bF9fZ2Nfb3duZXIoZ2MpOwogICAgIHVuc2lnbmVkIGludCBvcmlnX3ZkZXYsIHBmdW5jX21h
c2s7CkBAIC0xMjQxLDcgKzEyNDMsNyBAQCBpbnQgbGlieGxfX2RldmljZV9wY2lfYWRkKGxpYnhs
X19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLCBsaWJ4bF9kZXZpY2VfcGNpICpwY2lkZQogICAgIGlm
IChzdHViZG9taWQgIT0gMCkgewogICAgICAgICBsaWJ4bF9kZXZpY2VfcGNpIHBjaWRldl9zID0g
KnBjaWRldjsKICAgICAgICAgLyogc3R1YmRvbWFpbiBpcyBhbHdheXMgcnVubmluZyBieSBub3cs
IGV2ZW4gYXQgY3JlYXRlIHRpbWUgKi8KLSAgICAgICAgcmMgPSBkb19wY2lfYWRkKGdjLCBzdHVi
ZG9taWQsICZwY2lkZXZfcywgMCk7CisgICAgICAgIHJjID0gZG9fcGNpX2FkZChnYywgc3R1YmRv
bWlkLCAmcGNpZGV2X3MsIGZhbHNlKTsKICAgICAgICAgaWYgKCByYyApCiAgICAgICAgICAgICBn
b3RvIG91dDsKICAgICB9CkBAIC0xMjk0LDcgKzEyOTYsNyBAQCBzdGF0aWMgdm9pZCBsaWJ4bF9f
YWRkX3BjaWRldnMobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fYW8gKmFvLCB1aW50MzJfdCBkb21p
ZCwKICAgICBpbnQgaSwgcmMgPSAwOwogCiAgICAgZm9yIChpID0gMDsgaSA8IGRfY29uZmlnLT5u
dW1fcGNpZGV2czsgaSsrKSB7Ci0gICAgICAgIHJjID0gbGlieGxfX2RldmljZV9wY2lfYWRkKGdj
LCBkb21pZCwgJmRfY29uZmlnLT5wY2lkZXZzW2ldLCAxKTsKKyAgICAgICAgcmMgPSBsaWJ4bF9f
ZGV2aWNlX3BjaV9hZGQoZ2MsIGRvbWlkLCAmZF9jb25maWctPnBjaWRldnNbaV0sIHRydWUpOwog
ICAgICAgICBpZiAocmMgPCAwKSB7CiAgICAgICAgICAgICBMT0dEKEVSUk9SLCBkb21pZCwgImxp
YnhsX2RldmljZV9wY2lfYWRkIGZhaWxlZDogJWQiLCByYyk7CiAgICAgICAgICAgICBnb3RvIG91
dDsKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
