Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B068D526
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 15:41:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxtUS-0007GU-SH; Wed, 14 Aug 2019 13:39:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GkAm=WK=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxtUR-0007G4-Hp
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 13:38:59 +0000
X-Inumbo-ID: de59128c-be98-11e9-9945-67a4d7df2fd2
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de59128c-be98-11e9-9945-67a4d7df2fd2;
 Wed, 14 Aug 2019 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565789938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XoP+Ep1LjuyfMh3xkOMzOmkpdlgSwlaCnjNlFeCb0Ic=;
 b=avB7dfie7S14A6/+3HYXbLEkaoWEHSAC/pnz5ZDGBrIkD/tvJzoIsRal
 6iQDLKT9Y30slnxM+b+Q0E4yiq4Zu0q7Dnxhod5Y01h+0uVxTfNeB5pqC
 wGGcZituGYgbQ54TeAPz0UR2Prb0mVBUpBUAGWqpXzR/TCZzuNNiXTMgU o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: T1eLWcrApcxMYO/px1GnUoZv/j1BR6mxjgPYepvAv8yLTqkjM/jZNxkIMq6dJvJOR8QvEvpkPz
 DT5oLA5pBmzdTHdfa4Tx0orsFIOA2lE21cR1SkcZeJJFK+CzxGkO+nAlFrgFQU+qjGju/0R5B0
 KpXKM0uPl2pg0U3esHw9IbXY2choprDa/ACZy9C4c5ifw4ikZC2IzZN4WdEdx0sWLvzAvB8rSB
 GUYtjYL+uaiKeyVt4NP6A/keEPFvMCXD+rnO7Mpk+cx1hUCWfO+LHgEnLG83j5Om0LumtMTqy9
 KJw=
X-SBRS: 2.7
X-MesageID: 4409645
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,385,1559534400"; 
   d="scan'208";a="4409645"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 14 Aug 2019 14:38:50 +0100
Message-ID: <20190814133852.20491-9-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190814133852.20491-1-paul.durrant@citrix.com>
References: <20190814133852.20491-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 08/10] make
 passthrough/pci.c:deassign_device() static
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
Cc: Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmdW5jdGlvbiBpcyBvbmx5IGV2ZXIgY2FsbGVkIGZyb20gd2l0aGluIHRoZSBzYW1lIHNv
dXJjZSBtb2R1bGUgYW5kCnJlYWxseSBoYXMgbm8gYnVzaW5lc3MgYmVpbmcgZGVjbGFyZWQgeGVu
L2lvbW11LmguIFRoaXMgcGF0Y2ggcmVsb2NhdGVzCnRoZSBmdW5jdGlvbiBhaGVhZCBvZiB0aGUg
Zmlyc3QgY2FsbGVkIGFuZCBtYWtlcyBpdCBzdGF0aWMuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgotLS0KClByZXZpb3VzbHkgcGFydCBvZiBzZXJpZXMgaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA3L21zZzAy
MjY3Lmh0bWwKCnY1OgogLSBtaW5vciBzdHlsZSBmaXhlcwogLSB1c2UgJXBkLCByYXRoZXIgdGhh
biBkJWQKLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyB8IDkzICsrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAgICB8
ICAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9wY2kuYwppbmRleCA1YzIwNTFiZWUzLi4yOGI3N2IzZTMwIDEwMDY0NAot
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYworKysgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9wY2kuYwpAQCAtODg5LDYgKzg4OSw1MyBAQCBzdGF0aWMgaW50IHBjaV9jbGVhbl9k
cGNpX2lycXMoc3RydWN0IGRvbWFpbiAqZCkKICAgICByZXR1cm4gMDsKIH0KIAorLyogY2FsbGVy
IHNob3VsZCBob2xkIHRoZSBwY2lkZXZzX2xvY2sgKi8KK3N0YXRpYyBpbnQgZGVhc3NpZ25fZGV2
aWNlKHN0cnVjdCBkb21haW4gKmQsIHVpbnQxNl90IHNlZywgdWludDhfdCBidXMsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1aW50OF90IGRldmZuKQoreworICAgIGNvbnN0IHN0cnVjdCBk
b21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11KGQpOworICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2
OworICAgIGludCByZXQgPSAwOworCisgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSApCisg
ICAgICAgIHJldHVybiAtRUlOVkFMOworCisgICAgQVNTRVJUKHBjaWRldnNfbG9ja2VkKCkpOwor
ICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKGQsIHNlZywgYnVzLCBkZXZmbik7Cisg
ICAgaWYgKCAhcGRldiApCisgICAgICAgIHJldHVybiAtRU5PREVWOworCisgICAgd2hpbGUgKCBw
ZGV2LT5waGFudG9tX3N0cmlkZSApCisgICAgeworICAgICAgICBkZXZmbiArPSBwZGV2LT5waGFu
dG9tX3N0cmlkZTsKKyAgICAgICAgaWYgKCBQQ0lfU0xPVChkZXZmbikgIT0gUENJX1NMT1QocGRl
di0+ZGV2Zm4pICkKKyAgICAgICAgICAgIGJyZWFrOworICAgICAgICByZXQgPSBoZC0+cGxhdGZv
cm1fb3BzLT5yZWFzc2lnbl9kZXZpY2UoZCwgaGFyZHdhcmVfZG9tYWluLCBkZXZmbiwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV90b19kZXYocGRl
dikpOworICAgICAgICBpZiAoICFyZXQgKQorICAgICAgICAgICAgY29udGludWU7CisKKyAgICAg
ICAgcHJpbnRrKFhFTkxPR19HX0VSUiAiJXBkOiBkZWFzc2lnbiAlMDR4OiUwMng6JTAyeC4ldSBm
YWlsZWQgKCVkKVxuIiwKKyAgICAgICAgICAgICAgIGQsIHNlZywgYnVzLCBQQ0lfU0xPVChkZXZm
biksIFBDSV9GVU5DKGRldmZuKSwgcmV0KTsKKyAgICAgICAgcmV0dXJuIHJldDsKKyAgICB9CisK
KyAgICBkZXZmbiA9IHBkZXYtPmRldmZuOworICAgIHJldCA9IGhkLT5wbGF0Zm9ybV9vcHMtPnJl
YXNzaWduX2RldmljZShkLCBoYXJkd2FyZV9kb21haW4sIGRldmZuLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfdG9fZGV2KHBkZXYpKTsKKyAgICBpZiAo
IHJldCApCisgICAgeworICAgICAgICBkcHJpbnRrKFhFTkxPR19HX0VSUiwKKyAgICAgICAgICAg
ICAgICAiJXBkOiBkZWFzc2lnbiBkZXZpY2UgKCUwNHg6JTAyeDolMDJ4LiV1KSBmYWlsZWRcbiIs
CisgICAgICAgICAgICAgICAgZCwgc2VnLCBidXMsIFBDSV9TTE9UKGRldmZuKSwgUENJX0ZVTkMo
ZGV2Zm4pKTsKKyAgICAgICAgcmV0dXJuIHJldDsKKyAgICB9CisKKyAgICBwZGV2LT5mYXVsdC5j
b3VudCA9IDA7CisKKyAgICByZXR1cm4gcmV0OworfQorCiBpbnQgcGNpX3JlbGVhc2VfZGV2aWNl
cyhzdHJ1Y3QgZG9tYWluICpkKQogewogICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2OwpAQCAtMTQ2
Nyw1MiArMTUxNCw2IEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpk
LCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxhZykKICAgICByZXR1cm4gcmM7CiB9
CiAKLS8qIGNhbGxlciBzaG91bGQgaG9sZCB0aGUgcGNpZGV2c19sb2NrICovCi1pbnQgZGVhc3Np
Z25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4pCi17
Ci0gICAgY29uc3Qgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZCk7Ci0gICAg
c3RydWN0IHBjaV9kZXYgKnBkZXYgPSBOVUxMOwotICAgIGludCByZXQgPSAwOwotCi0gICAgaWYg
KCAhaXNfaW9tbXVfZW5hYmxlZChkKSApCi0gICAgICAgIHJldHVybiAtRUlOVkFMOwotCi0gICAg
QVNTRVJUKHBjaWRldnNfbG9ja2VkKCkpOwotICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXZfYnlfZG9t
YWluKGQsIHNlZywgYnVzLCBkZXZmbik7Ci0gICAgaWYgKCAhcGRldiApCi0gICAgICAgIHJldHVy
biAtRU5PREVWOwotCi0gICAgd2hpbGUgKCBwZGV2LT5waGFudG9tX3N0cmlkZSApCi0gICAgewot
ICAgICAgICBkZXZmbiArPSBwZGV2LT5waGFudG9tX3N0cmlkZTsKLSAgICAgICAgaWYgKCBQQ0lf
U0xPVChkZXZmbikgIT0gUENJX1NMT1QocGRldi0+ZGV2Zm4pICkKLSAgICAgICAgICAgIGJyZWFr
OwotICAgICAgICByZXQgPSBoZC0+cGxhdGZvcm1fb3BzLT5yZWFzc2lnbl9kZXZpY2UoZCwgaGFy
ZHdhcmVfZG9tYWluLCBkZXZmbiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBjaV90b19kZXYocGRldikpOwotICAgICAgICBpZiAoICFyZXQgKQotICAg
ICAgICAgICAgY29udGludWU7Ci0KLSAgICAgICAgcHJpbnRrKFhFTkxPR19HX0VSUiAiZCVkOiBk
ZWFzc2lnbiAlMDR4OiUwMng6JTAyeC4ldSBmYWlsZWQgKCVkKVxuIiwKLSAgICAgICAgICAgICAg
IGQtPmRvbWFpbl9pZCwgc2VnLCBidXMsIFBDSV9TTE9UKGRldmZuKSwgUENJX0ZVTkMoZGV2Zm4p
LCByZXQpOwotICAgICAgICByZXR1cm4gcmV0OwotICAgIH0KLQotICAgIGRldmZuID0gcGRldi0+
ZGV2Zm47Ci0gICAgcmV0ID0gaGQtPnBsYXRmb3JtX29wcy0+cmVhc3NpZ25fZGV2aWNlKGQsIGhh
cmR3YXJlX2RvbWFpbiwgZGV2Zm4sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBjaV90b19kZXYocGRldikpOwotICAgIGlmICggcmV0ICkKLSAgICB7Ci0gICAg
ICAgIGRwcmludGsoWEVOTE9HX0dfRVJSLAotICAgICAgICAgICAgICAgICJkJWQ6IGRlYXNzaWdu
IGRldmljZSAoJTA0eDolMDJ4OiUwMnguJXUpIGZhaWxlZFxuIiwKLSAgICAgICAgICAgICAgICBk
LT5kb21haW5faWQsIHNlZywgYnVzLCBQQ0lfU0xPVChkZXZmbiksIFBDSV9GVU5DKGRldmZuKSk7
Ci0gICAgICAgIHJldHVybiByZXQ7Ci0gICAgfQotCi0gICAgcGRldi0+ZmF1bHQuY291bnQgPSAw
OwotCi0gICAgcmV0dXJuIHJldDsKLX0KLQogc3RhdGljIGludCBpb21tdV9nZXRfZGV2aWNlX2dy
b3VwKAogICAgIHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sCiAg
ICAgWEVOX0dVRVNUX0hBTkRMRV82NCh1aW50MzIpIGJ1ZiwgaW50IG1heF9zZGV2cykKZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgK
aW5kZXggNWI5NjExYTEzNC4uNGI2ODcxOTM2YyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVu
L2lvbW11LmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgKQEAgLTcwLDcgKzcwLDYgQEAg
aW50IGlvbW11X2hhcmR3YXJlX3NldHVwKHZvaWQpOwogaW50IGlvbW11X2RvbWFpbl9pbml0KHN0
cnVjdCBkb21haW4gKmQpOwogdm9pZCBpb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQp
Owogdm9pZCBpb21tdV9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKTsKLWludCBkZWFz
c2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbik7
CiAKIHZvaWQgYXJjaF9pb21tdV9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKTsKIGlu
dCBhcmNoX2lvbW11X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpOwotLSAKMi4yMC4xLjIu
Z2IyMWViYjY3MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
