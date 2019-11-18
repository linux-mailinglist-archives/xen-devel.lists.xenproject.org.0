Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A923100B2D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 19:13:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWlTg-0004GY-Kk; Mon, 18 Nov 2019 18:10:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vqm6=ZK=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iWlTe-0004GQ-IT
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 18:10:18 +0000
X-Inumbo-ID: acda9eec-0a2e-11ea-a2de-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acda9eec-0a2e-11ea-a2de-12813bfff9fa;
 Mon, 18 Nov 2019 18:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574100617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kTuFvu2BbPHfp8dvWbx7uWxgQKcOYfIbMEjHLLe06aw=;
 b=HX1QAmt0e5y3Gn841aADLxArkmTSDSgcLKeWOh1Ge+0AudjK+ZmGBsns
 NDiPmZ3rdX/GzheYcfwvMpBrY/j/hsAPbiY7EVdicCOdvpm3s9CdodwIw
 8VDYg+c1VwhRf4ZV+Fgeyg/2I3U4RWLSewu/b9l5XfblK7dG+YPOaiPhw k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: erVQe32TJBbJlmpCd2cIAJp2dFm1A4cz7e+m4qGvNRokiMNVRnLkAo8UlXmDn48Cr0+/DZ9cLI
 dL3IFgNoocYhUH+qZBE/mfHQYvY/wQiQM6owZGk6PDepu7N4gdQ4Bm9B5l82mTqEW8VUSKDUpr
 KdQkPYfsaNd4TekcRkmtwvfKHo5X7xUfgyT0XukJP2t1ZNrhLqZcWLwx5vub4EgdpR9gXYCoBw
 aMDqIkrgKPZuTr0jOMg/kL11cTov4fhB8YPqevezEJOIR/sx/kLLRDE/pwc4vsCr4HE/P6j1wx
 IlI=
X-SBRS: 2.7
X-MesageID: 8891838
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,321,1569297600"; 
   d="scan'208";a="8891838"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 18 Nov 2019 18:10:14 +0000
Message-ID: <20191118181014.1472995-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118174956.GD1425@perard.uk.xensource.com>
References: <20191118174956.GD1425@perard.uk.xensource.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v4 6/7] libxl: Introduce
 libxl__ev_immediate
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBuZXcgZXYgYWxsb3dzIHRvIGFycmFuZ2UgYSBub24tcmVlbnRyYW50IGNhbGxiYWNrIHRv
IGJlIGNhbGxlZC4KVGhpcyBoYXBwZW4gaW1tZWRpYXRlbHkgYWZ0ZXIgdGhlIGN1cnJlbnQgZXZl
bnQgaXMgcHJvY2Vzc2VkIGFuZCBhZnRlcgpvdGhlciBldl9pbW1lZGlhdGVzIHRoYXQgd291bGQg
aGF2ZSBhbHJlYWR5IGJlZW4gcmVnaXN0ZXJlZC4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KCk5vdGVzOgogICAgdjQ6CiAgICAt
IHJld29yayBmb3JlYWNoIGxvb3AgaW4gZWdjX3J1bl9jYWxsYmFja3MsIHRvIGEgc2FmZSBhbHRl
cm5hdGl2ZSB3aGVyZQogICAgICB0aGUgbGlzdCBpcyBzYWZlIHRvIGJlIG1vZGlmaWVkLgogICAg
LSB1c2UgU1RBSUxRIGluc3RlYWQgb2YgVEFJTFEKICAgIAogICAgdjM6CiAgICAtIG5ldyBwYXRj
aAoKIHRvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMgICAgfCAyMCArKysrKysrKysrKysrKysrKysr
KwogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8IDE3ICsrKysrKysrKysrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4
bC9saWJ4bF9ldmVudC5jIGIvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYwppbmRleCA0MzE1NTM2
OGRlNzYuLmFhOGI3ZDE5NDViZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQu
YworKysgYi90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jCkBAIC05MTQsNiArOTE0LDE1IEBAIGlu
dCBsaWJ4bF9fZXZfZGV2c3RhdGVfd2FpdChsaWJ4bF9fYW8gKmFvLCBsaWJ4bF9fZXZfZGV2c3Rh
dGUgKmRzLAogICAgIHJldHVybiByYzsKIH0KIAorLyoKKyAqIGltbWVkaWF0ZSBub24tcmVlbnRy
YW50IGNhbGxiYWNrCisgKi8KKwordm9pZCBsaWJ4bF9fZXZfaW1tZWRpYXRlX3JlZ2lzdGVyKGxp
YnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X2ltbWVkaWF0ZSAqZWkpCit7CisgICAgTElCWExfU1RB
SUxRX0lOU0VSVF9UQUlMKCZlZ2MtPmV2X2ltbWVkaWF0ZXMsIGVpLCBlbnRyeSk7Cit9CisKIC8q
CiAgKiBkb21haW4gZGVhdGgvZGVzdHJ1Y3Rpb24KICAqLwpAQCAtMTM5NSw2ICsxNDA0LDE3IEBA
IHN0YXRpYyB2b2lkIGVnY19ydW5fY2FsbGJhY2tzKGxpYnhsX19lZ2MgKmVnYykKICAgICBFR0Nf
R0M7CiAgICAgbGlieGxfZXZlbnQgKmV2LCAqZXZfdG1wOwogICAgIGxpYnhsX19hb3Bfb2NjdXJy
ZWQgKmFvcCwgKmFvcF90bXA7CisgICAgbGlieGxfX2V2X2ltbWVkaWF0ZSAqZWk7CisKKyAgICB3
aGlsZSAoIUxJQlhMX1NUQUlMUV9FTVBUWSgmZWdjLT5ldl9pbW1lZGlhdGVzKSkgeworICAgICAg
ICBlaSA9IExJQlhMX1NUQUlMUV9GSVJTVCgmZWdjLT5ldl9pbW1lZGlhdGVzKTsKKyAgICAgICAg
TElCWExfU1RBSUxRX1JFTU9WRV9IRUFEKCZlZ2MtPmV2X2ltbWVkaWF0ZXMsIGVudHJ5KTsKKyAg
ICAgICAgQ1RYX0xPQ0s7CisgICAgICAgIC8qIFRoaXMgY2FsbGJhY2sgaXMgaW50ZXJuYWwgdG8g
bGlieGwgYW5kIGV4cGVjdHMgQ1RYIHRvIGJlCisgICAgICAgICAqIGxvY2tlZC4gKi8KKyAgICAg
ICAgZWktPmNhbGxiYWNrKGVnYywgZWkpOworICAgICAgICBDVFhfVU5MT0NLOworICAgIH0KIAog
ICAgIExJQlhMX1RBSUxRX0ZPUkVBQ0hfU0FGRShldiwgJmVnYy0+b2NjdXJyZWRfZm9yX2NhbGxi
YWNrLCBsaW5rLCBldl90bXApIHsKICAgICAgICAgTElCWExfVEFJTFFfUkVNT1ZFKCZlZ2MtPm9j
Y3VycmVkX2Zvcl9jYWxsYmFjaywgZXYsIGxpbmspOwpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwv
bGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKaW5kZXggZjk1
ODk1ZWFlMTdkLi4wYjc1ZWVmMmEyMmYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2lu
dGVybmFsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtMjAwLDYgKzIw
MCw3IEBAIHR5cGVkZWYgc3RydWN0IGxpYnhsX19ldl9zbG93bG9jayBsaWJ4bF9fZXZfc2xvd2xv
Y2s7CiB0eXBlZGVmIHN0cnVjdCBsaWJ4bF9fZG1fcmVzdW1lX3N0YXRlIGxpYnhsX19kbV9yZXN1
bWVfc3RhdGU7CiB0eXBlZGVmIHN0cnVjdCBsaWJ4bF9fYW9fZGV2aWNlIGxpYnhsX19hb19kZXZp
Y2U7CiB0eXBlZGVmIHN0cnVjdCBsaWJ4bF9fbXVsdGlkZXYgbGlieGxfX211bHRpZGV2OwordHlw
ZWRlZiBzdHJ1Y3QgbGlieGxfX2V2X2ltbWVkaWF0ZSBsaWJ4bF9fZXZfaW1tZWRpYXRlOwogCiB0
eXBlZGVmIHN0cnVjdCBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9zdGF0ZSBsaWJ4bF9fZG9tYWluX2Ny
ZWF0ZV9zdGF0ZTsKIHR5cGVkZWYgdm9pZCBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9jYihzdHJ1Y3Qg
bGlieGxfX2VnYyAqZWdjLApAQCAtMzYzLDYgKzM2NCwyMCBAQCBzdHJ1Y3QgbGlieGxfX2V2X2No
aWxkIHsKICAgICBMSUJYTF9MSVNUX0VOVFJZKHN0cnVjdCBsaWJ4bF9fZXZfY2hpbGQpIGVudHJ5
OwogfTsKIAorLyogbGlieGxfX2V2X2ltbWVkaWF0ZQorICoKKyAqIEFsbG93IHRvIGNhbGwgYSBu
b24tcmVlbnRyYW50IGNhbGxiYWNrLgorICoKKyAqIGBjYWxsYmFjaycgd2lsbCBiZSBjYWxsZWQg
aW1tZWRpYXRlbHkgYXMgYSBuZXcgZXZlbnQuCisgKi8KK3N0cnVjdCBsaWJ4bF9fZXZfaW1tZWRp
YXRlIHsKKyAgICAvKiBmaWxsZWQgYnkgdXNlciAqLworICAgIHZvaWQgKCpjYWxsYmFjaykobGli
eGxfX2VnYyAqLCBsaWJ4bF9fZXZfaW1tZWRpYXRlICopOworICAgIC8qIHByaXZhdGUgdG8gbGli
eGxfX2V2X2ltbWVkaWF0ZSAqLworICAgIExJQlhMX1NUQUlMUV9FTlRSWShsaWJ4bF9fZXZfaW1t
ZWRpYXRlKSBlbnRyeTsKK307Cit2b2lkIGxpYnhsX19ldl9pbW1lZGlhdGVfcmVnaXN0ZXIobGli
eGxfX2VnYyAqLCBsaWJ4bF9fZXZfaW1tZWRpYXRlICopOworCiAvKgogICogTG9jayBmb3IgZGV2
aWNlIGhvdHBsdWcsIHFtcF9sb2NrLgogICoKQEAgLTczMyw2ICs3NDgsNyBAQCBzdHJ1Y3QgbGli
eGxfX2VnYyB7CiAgICAgc3RydWN0IGxpYnhsX19ldmVudF9saXN0IG9jY3VycmVkX2Zvcl9jYWxs
YmFjazsKICAgICBMSUJYTF9UQUlMUV9IRUFEKCwgbGlieGxfX2FvKSBhb3NfZm9yX2NhbGxiYWNr
OwogICAgIExJQlhMX1RBSUxRX0hFQUQoLCBsaWJ4bF9fYW9wX29jY3VycmVkKSBhb3BzX2Zvcl9j
YWxsYmFjazsKKyAgICBMSUJYTF9TVEFJTFFfSEVBRCgsIGxpYnhsX19ldl9pbW1lZGlhdGUpIGV2
X2ltbWVkaWF0ZXM7CiB9OwogCiBzdHJ1Y3QgbGlieGxfX2FvcF9vY2N1cnJlZCB7CkBAIC0yMzIy
LDYgKzIzMzgsNyBAQCBfaGlkZGVuIGxpYnhsX2RldmljZV9tb2RlbF92ZXJzaW9uIGxpYnhsX19k
ZWZhdWx0X2RldmljZV9tb2RlbChsaWJ4bF9fZ2MgKmdjKTsKICAgICAgICAgTElCWExfVEFJTFFf
SU5JVCgmKGVnYykub2NjdXJyZWRfZm9yX2NhbGxiYWNrKTsgXAogICAgICAgICBMSUJYTF9UQUlM
UV9JTklUKCYoZWdjKS5hb3NfZm9yX2NhbGxiYWNrKTsgICAgICBcCiAgICAgICAgIExJQlhMX1RB
SUxRX0lOSVQoJihlZ2MpLmFvcHNfZm9yX2NhbGxiYWNrKTsgICAgIFwKKyAgICAgICAgTElCWExf
U1RBSUxRX0lOSVQoJihlZ2MpLmV2X2ltbWVkaWF0ZXMpOyAgICAgICAgXAogICAgIH0gd2hpbGUo
MCkKIAogX2hpZGRlbiB2b2lkIGxpYnhsX19lZ2NfY2xlYW51cChsaWJ4bF9fZWdjICplZ2MpOwot
LSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
