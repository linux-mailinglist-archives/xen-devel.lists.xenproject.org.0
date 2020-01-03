Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C3312F8AA
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 14:09:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inMfN-0004ED-Fb; Fri, 03 Jan 2020 13:07:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Lau=2Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1inMfM-0004DX-8V
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 13:07:00 +0000
X-Inumbo-ID: e49a8fc6-2e29-11ea-a914-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e49a8fc6-2e29-11ea-a914-bc764e2007e4;
 Fri, 03 Jan 2020 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578056805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=PHP2KunlTWORkKc8EeqqmVhshlq7AlcvEna5zhXo66M=;
 b=C4VkVu4ZPU3+9AexlW++lW1Yewlx1uKYJYhmwbt+3rF4msAWvtFqRjlv
 UDrispWNckaq4+6Dkv+M5VsWgdS4YjX1+Ht7+2lwrC7DrQjaV4wRI7oXt
 cIsb8B4c/r9txLGd3xBP8ey8DKWpszqlhX4ZNXbdoItPONItRcDFPFdDh s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iy6gUgXeuZl6uXIjKSuftEPHCTLrunRcpPynxXgyD7E63ttotEyIXxT9nNGR3yK41WF0b99R8S
 OG14qvBgImhI4iJsoctcHqlQgZoYRIxMB9jI6x7Gh+n7IG5kcA2nais83fklZu+mWlq7g+SR0l
 M1ZL5u83OBmz9x7G19yuDTBdvnjUZXVuf7KmmjG4iUeOTezRPY07ZNnzPhp6Z0fPgGaslilTGZ
 kj+sFOkvQo7/CSzESjxM3fYtH9ztxojGWVdlHhiiT0p/MFep9w4vc7omF29Mki7aSCmscF7GMr
 IFs=
X-SBRS: 2.7
X-MesageID: 10571945
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,390,1571716800"; d="scan'208";a="10571945"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 3 Jan 2020 13:06:13 +0000
Message-ID: <20200103130616.13724-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200103130616.13724-1-andrew.cooper3@citrix.com>
References: <20200103130616.13724-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 17/20] tools/libx[cl]: Plumb static_data_done()
 up into libxl
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bGlieGwgaXMgZ29pbmcgdG8gaGF2ZSB0byBwcm92aWRlIGNvbXBhdGliaWxpdHkgZm9yIHByZSA0
LjE0IHN0cmVhbXMgd2hpY2gKZG9uJ3QgY29udGFpbiBDUFVJRCBpbmZvcm1hdGlvbi4gIEludHJv
ZHVjZSB0aGUgc3RhdGljX2RhdGFfZG9uZSgpIGNhbGxiYWNrCmFuZCBwbHVtYiBpdCB1cCBpbnRv
IGxpYnhsLgoKTm8gb3ZlcmFsbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IElhbiBKYWNrc29uIDxJYW4uSmFj
a3NvbkBjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhjL2luY2x1ZGUv
eGVuZ3Vlc3QuaCAgICAgfCAgOSArKysrKysrKysKIHRvb2xzL2xpYnhjL3hjX3NyX2NvbW1vbl94
ODYuYyAgICAgfCAxMyArKysrKysrKysrKystCiB0b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlLmMg
ICAgICAgIHwgIDEgKwogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgICAgICAgICB8IDEzICsr
KysrKysrKysrKysKIHRvb2xzL2xpYnhsL2xpYnhsX3NhdmVfbXNnc19nZW4ucGwgfCAgMSArCiA1
IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmd1ZXN0LmggYi90b29scy9saWJ4Yy9pbmNsdWRl
L3hlbmd1ZXN0LmgKaW5kZXggZDgxYmFhNmNjMi4uYmU4MDU0NGJkMCAxMDA2NDQKLS0tIGEvdG9v
bHMvbGlieGMvaW5jbHVkZS94ZW5ndWVzdC5oCisrKyBiL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVu
Z3Vlc3QuaApAQCAtMTQwLDYgKzE0MCwxNSBAQCBpbnQgeGNfZG9tYWluX3NhdmUoeGNfaW50ZXJm
YWNlICp4Y2gsIGludCBpb19mZCwgdWludDMyX3QgZG9tLAogCiAvKiBjYWxsYmFja3MgcHJvdmlk
ZWQgYnkgeGNfZG9tYWluX3Jlc3RvcmUgKi8KIHN0cnVjdCByZXN0b3JlX2NhbGxiYWNrcyB7Cisg
ICAgLyoKKyAgICAgKiBDYWxsZWQgb25jZSB0aGUgU1RBVElDX0RBVEFfRU5EIHJlY29yZCBoYXMg
YmVlbiByZWNlaXZlZC9pbmZlcnJlZC4KKyAgICAgKiBQYXNzZXMgaW4gdGhlIGJsb2NrcyBvZiBz
dGF0aWMgZGF0YSB3aGljaCBoYXZlIG5vdCBiZWVuIHJlY2VpdmVkLCB3aGljaAorICAgICAqIHRo
ZSBoaWdoZXIgbGV2ZWwgdG9vbHN0YWNrIG11c3QgcHJvdmlkZSBiYWNrd2FyZHMgY29tcGF0aWJp
bGl0eSBmb3IuCisgICAgICovCisjZGVmaW5lIFhHUl9TRERfTUlTU0lOR19DUFVJRCAoMSA8PCAw
KQorI2RlZmluZSBYR1JfU0REX01JU1NJTkdfTVNSICAgKDEgPDwgMSkKKyAgICBpbnQgKCpzdGF0
aWNfZGF0YV9kb25lKSh1bnNpZ25lZCBpbnQgbWlzc2luZywgdm9pZCAqZGF0YSk7CisKICAgICAv
KiBDYWxsZWQgYWZ0ZXIgYSBuZXcgY2hlY2twb2ludCB0byBzdXNwZW5kIHRoZSBndWVzdC4gKi8K
ICAgICBpbnQgKCpzdXNwZW5kKSh2b2lkICpkYXRhKTsKIApkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGMveGNfc3JfY29tbW9uX3g4Ni5jIGIvdG9vbHMvbGlieGMveGNfc3JfY29tbW9uX3g4Ni5jCmlu
ZGV4IDA5ZmIxZDkzZDYuLmMzZDFkMzBkOTEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX3Ny
X2NvbW1vbl94ODYuYworKysgYi90b29scy9saWJ4Yy94Y19zcl9jb21tb25feDg2LmMKQEAgLTQ0
LDkgKzQ0LDIwIEBAIGludCBoYW5kbGVfeDg2X3RzY19pbmZvKHN0cnVjdCB4Y19zcl9jb250ZXh0
ICpjdHgsIHN0cnVjdCB4Y19zcl9yZWNvcmQgKnJlYykKIAogaW50IHg4Nl9zdGF0aWNfZGF0YV9j
b21wbGV0ZShzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4KQogeworICAgIHhjX2ludGVyZmFjZSAq
eGNoID0gY3R4LT54Y2g7CisgICAgdW5zaWduZWQgaW50IG1pc3NpbmcgPSAwOworICAgIGludCBy
YzsKKwogICAgIC8qIFRPRE8gLSBzb21ldGhpbmcgdXNlZnVsLiAqLworICAgIG1pc3NpbmcgPSBY
R1JfU0REX01JU1NJTkdfTVNSIHwgWEdSX1NERF9NSVNTSU5HX0NQVUlEOwogCi0gICAgcmV0dXJu
IDA7CisgICAgcmMgPSBjdHgtPnJlc3RvcmUuY2FsbGJhY2tzLT5zdGF0aWNfZGF0YV9kb25lKAor
ICAgICAgICBtaXNzaW5nLCBjdHgtPnJlc3RvcmUuY2FsbGJhY2tzLT5kYXRhKTsKKworICAgIGlm
ICggcmMgKQorICAgICAgICBFUlJPUigic3RhdGljX2RhdGFfZG9uZSgpIGNhbGxiYWNrIGZhaWxl
ZDogJWRcbiIsIHJjKTsKKworICAgIHJldHVybiByYzsKIH0KIAogaW50IHdyaXRlX3g4Nl9jcHVf
cG9saWN5X3JlY29yZHMoc3RydWN0IHhjX3NyX2NvbnRleHQgKmN0eCkKZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhjL3hjX3NyX3Jlc3RvcmUuYyBiL3Rvb2xzL2xpYnhjL3hjX3NyX3Jlc3RvcmUuYwpp
bmRleCBkNGJkNjBhMzFlLi4wOWQ4YTA4MzE2IDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19z
cl9yZXN0b3JlLmMKKysrIGIvdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZS5jCkBAIC05MDgsNiAr
OTA4LDcgQEAgaW50IHhjX2RvbWFpbl9yZXN0b3JlKHhjX2ludGVyZmFjZSAqeGNoLCBpbnQgaW9f
ZmQsIHVpbnQzMl90IGRvbSwKICAgICAgICAgYXNzZXJ0KGNhbGxiYWNrcy0+Y2hlY2twb2ludCk7
CiAgICAgICAgIC8qIEZhbGx0aHJvdWdoICovCiAgICAgY2FzZSBYQ19TVFJFQU1fUExBSU46Cisg
ICAgICAgIGFzc2VydChjYWxsYmFja3MtPnN0YXRpY19kYXRhX2RvbmUpOwogICAgICAgICBicmVh
azsKIAogICAgIGRlZmF1bHQ6CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUu
YyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCmluZGV4IDMyZDQ1ZGNlZjAuLmZkYzc2OTE3
ZGMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCisrKyBiL3Rvb2xzL2xp
YnhsL2xpYnhsX2NyZWF0ZS5jCkBAIC0xMjI3LDYgKzEyMjcsNyBAQCBzdGF0aWMgdm9pZCBkb21j
cmVhdGVfYm9vdGxvYWRlcl9kb25lKGxpYnhsX19lZ2MgKmVnYywKICAgICBkY3MtPnNycy5kY3Mg
PSBkY3M7CiAKICAgICAvKiBSZXN0b3JlICovCisgICAgY2FsbGJhY2tzLT5zdGF0aWNfZGF0YV9k
b25lID0gbGlieGxfX3NybV9jYWxsb3V0X2NhbGxiYWNrX3N0YXRpY19kYXRhX2RvbmU7CiAgICAg
Y2FsbGJhY2tzLT5yZXN0b3JlX3Jlc3VsdHMgPSBsaWJ4bF9fc3JtX2NhbGxvdXRfY2FsbGJhY2tf
cmVzdG9yZV9yZXN1bHRzOwogCiAgICAgLyogQ09MTyBvbmx5IHN1cHBvcnRzIEhWTSBub3cgYmVj
YXVzZSBpdCBkb2VzIG5vdCB3b3JrIHZlcnkKQEAgLTEyOTYsNiArMTI5NywxOCBAQCBzdGF0aWMg
dm9pZCBsaWJ4bF9fY29sb19yZXN0b3JlX3NldHVwX2RvbmUobGlieGxfX2VnYyAqZWdjLAogICAg
IGxpYnhsX19zdHJlYW1fcmVhZF9zdGFydChlZ2MsICZkY3MtPnNycyk7CiB9CiAKK2ludCBsaWJ4
bF9fc3JtX2NhbGxvdXRfY2FsbGJhY2tfc3RhdGljX2RhdGFfZG9uZSh1bnNpZ25lZCBpbnQgbWlz
c2luZywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2
b2lkICp1c2VyKQoreworICAgIGxpYnhsX19zYXZlX2hlbHBlcl9zdGF0ZSAqc2hzID0gdXNlcjsK
KyAgICBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9zdGF0ZSAqZGNzID0gc2hzLT5jYWxsZXJfc3RhdGU7
CisgICAgU1RBVEVfQU9fR0MoZGNzLT5hbyk7CisKKyAgICAvKiBUT0RPIC0gc29tZXRoaW5nIHVz
ZWZ1bC4gKi8KKworICAgIHJldHVybiAwOworfQorCiB2b2lkIGxpYnhsX19zcm1fY2FsbG91dF9j
YWxsYmFja19yZXN0b3JlX3Jlc3VsdHMoeGVuX3Bmbl90IHN0b3JlX21mbiwKICAgICAgICAgICB4
ZW5fcGZuX3QgY29uc29sZV9tZm4sIHZvaWQgKnVzZXIpCiB7CmRpZmYgLS1naXQgYS90b29scy9s
aWJ4bC9saWJ4bF9zYXZlX21zZ3NfZ2VuLnBsIGIvdG9vbHMvbGlieGwvbGlieGxfc2F2ZV9tc2dz
X2dlbi5wbAppbmRleCA4MzFhMTVlMGJiLi41YmZiZDRmZDEwIDEwMDc1NQotLS0gYS90b29scy9s
aWJ4bC9saWJ4bF9zYXZlX21zZ3NfZ2VuLnBsCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3NhdmVf
bXNnc19nZW4ucGwKQEAgLTI5LDYgKzI5LDcgQEAgb3VyIEBtc2dzID0gKAogICAgIFsgJ3NyY3hB
JywgICJ3YWl0X2NoZWNrcG9pbnQiLCBbXSBdLAogICAgIFsgJ3NjeEEnLCAgICJzd2l0Y2hfcWVt
dV9sb2dkaXJ0eSIsICBbcXcodWludDMyX3QgZG9taWQKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGVuYWJsZSldIF0sCisgICAgWyAncmN4VycsICAg
InN0YXRpY19kYXRhX2RvbmUiLCAgICAgIFtxdyh1bnNpZ25lZCBtaXNzaW5nKV0gXSwKICAgICBb
ICdyY3gnLCAgICAicmVzdG9yZV9yZXN1bHRzIiwgICAgICAgWyd4ZW5fcGZuX3QnLCAnc3RvcmVf
Z2ZuJywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICd4ZW5fcGZu
X3QnLCAnY29uc29sZV9nZm4nXSBdLAogICAgIFsgJ3NyVycsICAgICJjb21wbGV0ZSIsICAgICAg
ICAgICAgICBbcXcoaW50IHJldHZhbAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
