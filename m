Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12AA6669
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 12:18:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i55pc-0001ZS-So; Tue, 03 Sep 2019 10:14:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4NVN=W6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i55pb-0001ZN-CO
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 10:14:35 +0000
X-Inumbo-ID: a071b7bc-ce33-11e9-8980-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a071b7bc-ce33-11e9-8980-bc764e2007e4;
 Tue, 03 Sep 2019 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567505674;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=59moLgxvlTYcqNj97DGqae1abT6c0gdxKKQe6oNiY+E=;
 b=D8NI26Q5ZINNn1Ji3pNvLijDOZktsiO+p/k/nkKPuX134czXNgBh+G4b
 4xckJpI/PsF9MRjWClVquvRuhef5nTH7TnICYYYCS71YAWd4hhCyRnNPU
 wI+MZbt+DWXEqKovszp5/ZAcqXAAtxE+HaGa1imd/Ol+oF1tjbRPKLZTl w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Zh/M9lNQGB/8IPG9orLrYYNJrMRXhwTHh1L8CxUvlrNURv6xXF7rocUa5aesPjelc54wR+6BLg
 IgQmTRFgygSrrJXo9fXmAqA3qvz1rxy2YlZ9AcWT0cE3bWpNh6A5zq6ulgxcPQQVSTSsXv2qUi
 5PJNDVhD0hC/DuYFetnWs5FH28hWHwjNCphkgAFasB4OHd334fALHxLzqMTBStIITmylAYUNDc
 PZ0B6tB2eveG5UZLB+1OaQ8Rae5sgsQtXNnBqeTSFuVKoR+1P3nYCaatfKRV0emFGYTG6d26NI
 2fI=
X-SBRS: 2.7
X-MesageID: 5271139
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,462,1559534400"; 
   d="scan'208";a="5271139"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Sep 2019 12:14:28 +0200
Message-ID: <20190903101428.3543-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3] vpci: honor read-only devices
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9uJ3QgYWxsb3cgdGhlIGhhcmR3YXJlIGRvbWFpbiB3cml0ZSBhY2Nlc3MgdGhlIFBDSSBjb25m
aWcgc3BhY2Ugb2YKZGV2aWNlcyBtYXJrZWQgYXMgcmVhZC1vbmx5LgoKU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNl
IHYyOgogLSBGaXggdGVzdCBoYXJuZXNzLgogLSBEbyB0aGUgUk8gY2hlY2sgYmVmb3JlIHRoZSBv
d25lcnNoaXAgb25lLgoKQ2hhbmdlcyBzaW5jZSB2MToKIC0gQ2hhbmdlIHRoZSBhcHByb2FjaCBh
bmQgYWxsb3cgZnVsbCByZWFkIGFjY2Vzcywgd2hpbGUgbGltaXRpbmcKICAgd3JpdGUgYWNjZXNz
IHRvIGRldmljZXMgbWFya2VkIFJPLgotLS0KIHRvb2xzL3Rlc3RzL3ZwY2kvZW11bC5oIHwgMyAr
KysKIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIHwgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy90ZXN0cy92cGNpL2VtdWwuaCBiL3Rv
b2xzL3Rlc3RzL3ZwY2kvZW11bC5oCmluZGV4IDVkNDc1NDRiZjcuLjJlMWQzMDU3YzkgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL3Rlc3RzL3ZwY2kvZW11bC5oCisrKyBiL3Rvb2xzL3Rlc3RzL3ZwY2kvZW11
bC5oCkBAIC05Miw2ICs5Miw5IEBAIHR5cGVkZWYgdW5pb24gewogI2RlZmluZSB4ZnJlZShwKSBm
cmVlKHApCiAKICNkZWZpbmUgcGNpX2dldF9wZGV2X2J5X2RvbWFpbiguLi4pICZ0ZXN0X3BkZXYK
KyNkZWZpbmUgcGNpX2dldF9yb19tYXAoLi4uKSBOVUxMCisKKyNkZWZpbmUgdGVzdF9iaXQoLi4u
KSBmYWxzZQogCiAvKiBEdW1teSBuYXRpdmUgaGVscGVycy4gV3JpdGVzIGFyZSBpZ25vcmVkLCBy
ZWFkcyByZXR1cm4gMSdzLiAqLwogI2RlZmluZSBwY2lfY29uZl9yZWFkOCguLi4pICAgICAweGZm
CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kv
dnBjaS5jCmluZGV4IDc1OGQ5NDIwZTcuLmNiZDFiYWM3ZmMgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2
ZXJzL3ZwY2kvdnBjaS5jCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCkBAIC00MTEsNiAr
NDExLDcgQEAgdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJl
ZywgdW5zaWduZWQgaW50IHNpemUsCiAgICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXY7CiAg
ICAgY29uc3Qgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnI7CiAgICAgdW5zaWduZWQgaW50IGRhdGFf
b2Zmc2V0ID0gMDsKKyAgICBjb25zdCB1bnNpZ25lZCBsb25nICpyb19tYXAgPSBwY2lfZ2V0X3Jv
X21hcChzYmRmLnNlZyk7CiAKICAgICBpZiAoICFzaXplICkKICAgICB7CkBAIC00MTgsNiArNDE5
LDEwIEBAIHZvaWQgdnBjaV93cml0ZShwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcs
IHVuc2lnbmVkIGludCBzaXplLAogICAgICAgICByZXR1cm47CiAgICAgfQogCisgICAgaWYgKCBy
b19tYXAgJiYgdGVzdF9iaXQoc2JkZi5iZGYsIHJvX21hcCkgKQorICAgICAgICAvKiBJZ25vcmUg
d3JpdGVzIHRvIHJlYWQtb25seSBkZXZpY2VzLiAqLworICAgICAgICByZXR1cm47CisKICAgICAv
KgogICAgICAqIEZpbmQgdGhlIFBDSSBkZXYgbWF0Y2hpbmcgdGhlIGFkZHJlc3MuCiAgICAgICog
UGFzc3Rocm91Z2ggZXZlcnl0aGluZyB0aGF0J3Mgbm90IHRyYXBwZWQuCi0tIAoyLjIyLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
