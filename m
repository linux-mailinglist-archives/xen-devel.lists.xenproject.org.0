Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53246C2218
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 15:35:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEvnv-0005Yk-MK; Mon, 30 Sep 2019 13:33:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=znM2=XZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iEvnt-0005XE-EQ
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 13:33:29 +0000
X-Inumbo-ID: e0f66090-e386-11e9-96d3-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id e0f66090-e386-11e9-96d3-12813bfff9fa;
 Mon, 30 Sep 2019 13:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569850405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IgKIu7yf7F/J3/6bpWPXUPKO2ikhnvpSyRXkQYfy870=;
 b=NmLx52bfr23S/k9HNyXFcj+HKDK8RRIR/rDDpKnsP1XIFSQCgauL9v/L
 nZHQFLK5/hhtzWBK3buyDcLwrehYjcj2Z5fTyZlmyIM8XFnh6ZQJSEZj4
 ZMXB4qnNBQfY+uAH+CXHR36j7AQFz2V72ksqhldC9tN3fk/w0MZwdZfnt Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: T5u7crorbb86SFo35YfZlzULZTDrTpxRue15H9JQfPDoYsNEa9EC7fWAMRquigy2tiLLDbNzyS
 /BtldHWOlKpFSfeTFzVoRcPAtfWprXCJUMnZwL36R9w/RoU+YFw8uMXtHLPfyWSaBsCQo7giVX
 EK4xbh7JDXg+hYb78ifNAJL7TzaUOCzsfjvMTXHTuRHYhyKey6S7rN/0rwI38wyzECpN/0hFIa
 tM9N6UhN4TQ3DkZS5/9Sil+pfRv+cs3CBG2SxQnbxfeTwTKPncNETXsP5lC72SsRUh1vACFEit
 BUM=
X-SBRS: 2.7
X-MesageID: 6490556
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6490556"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 15:32:36 +0200
Message-ID: <20190930133238.49868-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930133238.49868-1-roger.pau@citrix.com>
References: <20190930133238.49868-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 08/10] vpci: register as an internal ioreq
 server
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3dpdGNoIHZQQ0kgdG8gYmVjb21lIGFuIGludGVybmFsIGlvcmVxIHNlcnZlciwgYW5kIGhlbmNl
IGRyb3AgYWxsIHRoZQp2UENJIHNwZWNpZmljIGRlY29kaW5nIGFuZCB0cmFwcGluZyB0byBQQ0kg
SU8gcG9ydHMgYW5kIE1NQ0ZHIHJlZ2lvbnMuCgpUaGlzIGFsbG93cyB0byB1bmlmeSB0aGUgdlBD
SSBjb2RlIHdpdGggdGhlIGlvcmVxIGluZnJhc3RydWN0dXJlLApvcGVuaW5nIHRoZSBkb29yIGZv
ciBkb21haW5zIGhhdmluZyBQQ0kgYWNjZXNzZXMgaGFuZGxlZCBieSB2UENJIGFuZApvdGhlciBp
b3JlcSBzZXJ2ZXJzIGF0IHRoZSBzYW1lIHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjI6CiAtIFJl
bW92ZSBzdHJheSBhZGRpdGlvbiBvZiBpb3JlcSBoZWFkZXIgdG8gcGh5c2Rldi5jLgoKQ2hhbmdl
cyBzaW5jZSB2MToKIC0gUmVtb3ZlIHByb3RvdHlwZXMgZm9yIHJlZ2lzdGVyX3ZwY2lfcG9ydGlv
X2hhbmRsZXIgYW5kCiAgIHJlZ2lzdGVyX3ZwY2lfbW1jZmdfaGFuZGxlci4KIC0gUmUtYWRkIHZw
Y2kgY2hlY2sgaW4gaHdkb21faW9tbXVfbWFwLgogLSBGaXggdGVzdCBoYXJuZXNzLgogLSBSZW1v
dmUgdnBjaV97cmVhZC93cml0ZX0gcHJvdG90eXBlcyBhbmQgbWFrZSB0aGUgZnVuY3Rpb25zIHN0
YXRpYy4KLS0tCiB0b29scy90ZXN0cy92cGNpL01ha2VmaWxlICAgICB8ICAgNSArLQogdG9vbHMv
dGVzdHMvdnBjaS9lbXVsLmggICAgICAgfCAgIDQgKwogeGVuL2FyY2gveDg2L2h2bS9kb20wX2J1
aWxkLmMgfCAgIDEgKwogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgfCAgIDUgKy0KIHhl
bi9hcmNoL3g4Ni9odm0vaW8uYyAgICAgICAgIHwgMjAxIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgICAgIHwgIDYzICsrKysrKysr
KystCiB4ZW4vaW5jbHVkZS94ZW4vdnBjaS5oICAgICAgICB8ICAyMiArLS0tCiA3IGZpbGVzIGNo
YW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDIyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
b29scy90ZXN0cy92cGNpL01ha2VmaWxlIGIvdG9vbHMvdGVzdHMvdnBjaS9NYWtlZmlsZQppbmRl
eCA1MDc1YmMyYmUyLi5jMzY1YzQ1MjJhIDEwMDY0NAotLS0gYS90b29scy90ZXN0cy92cGNpL01h
a2VmaWxlCisrKyBiL3Rvb2xzL3Rlc3RzL3ZwY2kvTWFrZWZpbGUKQEAgLTI1LDcgKzI1LDEwIEBA
IGluc3RhbGw6CiAKIHZwY2kuYzogJChYRU5fUk9PVCkveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMK
IAkjIFJlbW92ZSBpbmNsdWRlcyBhbmQgYWRkIHRoZSB0ZXN0IGhhcm5lc3MgaGVhZGVyCi0Jc2Vk
IC1lICcvI2luY2x1ZGUvZCcgLWUgJzFzL14vI2luY2x1ZGUgImVtdWwuaCIvJyA8JDwgPiRACisJ
c2VkIC1lICcvI2luY2x1ZGUvZCcgLWUgJzFzL14vI2luY2x1ZGUgImVtdWwuaCIvJyBcCisJICAg
IC1lICdzL15zdGF0aWMgdWludDMyX3QgcmVhZC91aW50MzJfdCB2cGNpX3JlYWQvJyBcCisJICAg
IC1lICdzL15zdGF0aWMgdm9pZCB3cml0ZS92b2lkIHZwY2lfd3JpdGUvJyA8JDwgPiRACisKIAog
bGlzdC5oOiAkKFhFTl9ST09UKS94ZW4vaW5jbHVkZS94ZW4vbGlzdC5oCiB2cGNpLmg6ICQoWEVO
X1JPT1QpL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3RzL3Zw
Y2kvZW11bC5oIGIvdG9vbHMvdGVzdHMvdnBjaS9lbXVsLmgKaW5kZXggMmUxZDMwNTdjOS4uNWE2
NDk0YTc5NyAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdHMvdnBjaS9lbXVsLmgKKysrIGIvdG9vbHMv
dGVzdHMvdnBjaS9lbXVsLmgKQEAgLTEyNSw2ICsxMjUsMTAgQEAgdHlwZWRlZiB1bmlvbiB7CiAg
ICAgICAgIHR4ID4gdHkgPyB0eCA6IHR5OyAgICAgICAgICAgICAgXAogfSkKIAordWludDMyX3Qg
dnBjaV9yZWFkKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50
IHNpemUpOwordm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJl
ZywgdW5zaWduZWQgaW50IHNpemUsCisgICAgICAgICAgICAgICAgdWludDMyX3QgZGF0YSk7CisK
ICNlbmRpZgogCiAvKgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMg
Yi94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYwppbmRleCBiMzAwNDJkOGYzLi5kZmY0ZDY2
NjNjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYworKysgYi94ZW4v
YXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYwpAQCAtMjksNiArMjksNyBAQAogCiAjaW5jbHVkZSA8
YXNtL2J6aW1hZ2UuaD4KICNpbmNsdWRlIDxhc20vZG9tMF9idWlsZC5oPgorI2luY2x1ZGUgPGFz
bS9odm0vaW9yZXEuaD4KICNpbmNsdWRlIDxhc20vaHZtL3N1cHBvcnQuaD4KICNpbmNsdWRlIDxh
c20vaW9fYXBpYy5oPgogI2luY2x1ZGUgPGFzbS9wMm0uaD4KZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCmluZGV4IDUzNDgxODZjMGMu
LmM1YzBlM2ZhMmMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKKysrIGIveGVu
L2FyY2gveDg2L2h2bS9odm0uYwpAQCAtNjU2LDEwICs2NTYsMTMgQEAgaW50IGh2bV9kb21haW5f
aW5pdGlhbGlzZShzdHJ1Y3QgZG9tYWluICpkKQogICAgICAgICBkLT5hcmNoLmh2bS5pb19iaXRt
YXAgPSBodm1faW9fYml0bWFwOwogCiAgICAgcmVnaXN0ZXJfZzJtX3BvcnRpb19oYW5kbGVyKGQp
OwotICAgIHJlZ2lzdGVyX3ZwY2lfcG9ydGlvX2hhbmRsZXIoZCk7CiAKICAgICBodm1faW9yZXFf
aW5pdChkKTsKIAorICAgIHJjID0gdnBjaV9yZWdpc3Rlcl9pb3JlcShkKTsKKyAgICBpZiAoIHJj
ICkKKyAgICAgICAgZ290byBmYWlsMTsKKwogICAgIGh2bV9pbml0X2d1ZXN0X3RpbWUoZCk7CiAK
ICAgICBkLT5hcmNoLmh2bS5wYXJhbXNbSFZNX1BBUkFNX1RSSVBMRV9GQVVMVF9SRUFTT05dID0g
U0hVVERPV05fcmVib290OwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9pby5jIGIveGVu
L2FyY2gveDg2L2h2bS9pby5jCmluZGV4IDMzMzQ4ODgxMzYuLjRjNzJlNjhhNWIgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vaW8uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2lvLmMKQEAg
LTI5MCwyMDQgKzI5MCw2IEBAIHVuc2lnbmVkIGludCBodm1fbW1jZmdfZGVjb2RlX2FkZHIoY29u
c3Qgc3RydWN0IGh2bV9tbWNmZyAqbW1jZmcsCiAgICAgcmV0dXJuIGFkZHIgJiAoUENJX0NGR19T
UEFDRV9FWFBfU0laRSAtIDEpOwogfQogCi0KLS8qIERvIHNvbWUgc2FuaXR5IGNoZWNrcy4gKi8K
LXN0YXRpYyBib29sIHZwY2lfYWNjZXNzX2FsbG93ZWQodW5zaWduZWQgaW50IHJlZywgdW5zaWdu
ZWQgaW50IGxlbikKLXsKLSAgICAvKiBDaGVjayBhY2Nlc3Mgc2l6ZS4gKi8KLSAgICBpZiAoIGxl
biAhPSAxICYmIGxlbiAhPSAyICYmIGxlbiAhPSA0ICYmIGxlbiAhPSA4ICkKLSAgICAgICAgcmV0
dXJuIGZhbHNlOwotCi0gICAgLyogQ2hlY2sgdGhhdCBhY2Nlc3MgaXMgc2l6ZSBhbGlnbmVkLiAq
LwotICAgIGlmICggKHJlZyAmIChsZW4gLSAxKSkgKQotICAgICAgICByZXR1cm4gZmFsc2U7Ci0K
LSAgICByZXR1cm4gdHJ1ZTsKLX0KLQotLyogdlBDSSBjb25maWcgc3BhY2UgSU8gcG9ydHMgaGFu
ZGxlcnMgKDB4Y2Y4LzB4Y2ZjKS4gKi8KLXN0YXRpYyBib29sIHZwY2lfcG9ydGlvX2FjY2VwdChj
b25zdCBzdHJ1Y3QgaHZtX2lvX2hhbmRsZXIgKmhhbmRsZXIsCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgaW9yZXFfdCAqcCkKLXsKLSAgICByZXR1cm4gKHAtPmFkZHIgPT0g
MHhjZjggJiYgcC0+c2l6ZSA9PSA0KSB8fCAocC0+YWRkciAmIH4zKSA9PSAweGNmYzsKLX0KLQot
c3RhdGljIGludCB2cGNpX3BvcnRpb19yZWFkKGNvbnN0IHN0cnVjdCBodm1faW9faGFuZGxlciAq
aGFuZGxlciwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBhZGRyLCB1aW50
MzJfdCBzaXplLCB1aW50NjRfdCAqZGF0YSkKLXsKLSAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpk
ID0gY3VycmVudC0+ZG9tYWluOwotICAgIHVuc2lnbmVkIGludCByZWc7Ci0gICAgcGNpX3NiZGZf
dCBzYmRmOwotICAgIHVpbnQzMl90IGNmODsKLQotICAgICpkYXRhID0gfih1aW50NjRfdCkwOwot
Ci0gICAgaWYgKCBhZGRyID09IDB4Y2Y4ICkKLSAgICB7Ci0gICAgICAgIEFTU0VSVChzaXplID09
IDQpOwotICAgICAgICAqZGF0YSA9IGQtPmFyY2guaHZtLnBjaV9jZjg7Ci0gICAgICAgIHJldHVy
biBYODZFTVVMX09LQVk7Ci0gICAgfQotCi0gICAgQVNTRVJUKChhZGRyICYgfjMpID09IDB4Y2Zj
KTsKLSAgICBjZjggPSBBQ0NFU1NfT05DRShkLT5hcmNoLmh2bS5wY2lfY2Y4KTsKLSAgICBpZiAo
ICFDRjhfRU5BQkxFRChjZjgpICkKLSAgICAgICAgcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxF
OwotCi0gICAgcmVnID0gaHZtX3BjaV9kZWNvZGVfYWRkcihjZjgsIGFkZHIsICZzYmRmKTsKLQot
ICAgIGlmICggIXZwY2lfYWNjZXNzX2FsbG93ZWQocmVnLCBzaXplKSApCi0gICAgICAgIHJldHVy
biBYODZFTVVMX09LQVk7Ci0KLSAgICAqZGF0YSA9IHZwY2lfcmVhZChzYmRmLCByZWcsIHNpemUp
OwotCi0gICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKLX0KLQotc3RhdGljIGludCB2cGNpX3BvcnRp
b193cml0ZShjb25zdCBzdHJ1Y3QgaHZtX2lvX2hhbmRsZXIgKmhhbmRsZXIsCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IGFkZHIsIHVpbnQzMl90IHNpemUsIHVpbnQ2NF90
IGRhdGEpCi17Ci0gICAgc3RydWN0IGRvbWFpbiAqZCA9IGN1cnJlbnQtPmRvbWFpbjsKLSAgICB1
bnNpZ25lZCBpbnQgcmVnOwotICAgIHBjaV9zYmRmX3Qgc2JkZjsKLSAgICB1aW50MzJfdCBjZjg7
Ci0KLSAgICBpZiAoIGFkZHIgPT0gMHhjZjggKQotICAgIHsKLSAgICAgICAgQVNTRVJUKHNpemUg
PT0gNCk7Ci0gICAgICAgIGQtPmFyY2guaHZtLnBjaV9jZjggPSBkYXRhOwotICAgICAgICByZXR1
cm4gWDg2RU1VTF9PS0FZOwotICAgIH0KLQotICAgIEFTU0VSVCgoYWRkciAmIH4zKSA9PSAweGNm
Yyk7Ci0gICAgY2Y4ID0gQUNDRVNTX09OQ0UoZC0+YXJjaC5odm0ucGNpX2NmOCk7Ci0gICAgaWYg
KCAhQ0Y4X0VOQUJMRUQoY2Y4KSApCi0gICAgICAgIHJldHVybiBYODZFTVVMX1VOSEFORExFQUJM
RTsKLQotICAgIHJlZyA9IGh2bV9wY2lfZGVjb2RlX2FkZHIoY2Y4LCBhZGRyLCAmc2JkZik7Ci0K
LSAgICBpZiAoICF2cGNpX2FjY2Vzc19hbGxvd2VkKHJlZywgc2l6ZSkgKQotICAgICAgICByZXR1
cm4gWDg2RU1VTF9PS0FZOwotCi0gICAgdnBjaV93cml0ZShzYmRmLCByZWcsIHNpemUsIGRhdGEp
OwotCi0gICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKLX0KLQotc3RhdGljIGNvbnN0IHN0cnVjdCBo
dm1faW9fb3BzIHZwY2lfcG9ydGlvX29wcyA9IHsKLSAgICAuYWNjZXB0ID0gdnBjaV9wb3J0aW9f
YWNjZXB0LAotICAgIC5yZWFkID0gdnBjaV9wb3J0aW9fcmVhZCwKLSAgICAud3JpdGUgPSB2cGNp
X3BvcnRpb193cml0ZSwKLX07Ci0KLXZvaWQgcmVnaXN0ZXJfdnBjaV9wb3J0aW9faGFuZGxlcihz
dHJ1Y3QgZG9tYWluICpkKQotewotICAgIHN0cnVjdCBodm1faW9faGFuZGxlciAqaGFuZGxlcjsK
LQotICAgIGlmICggIWhhc192cGNpKGQpICkKLSAgICAgICAgcmV0dXJuOwotCi0gICAgaGFuZGxl
ciA9IGh2bV9uZXh0X2lvX2hhbmRsZXIoZCk7Ci0gICAgaWYgKCAhaGFuZGxlciApCi0gICAgICAg
IHJldHVybjsKLQotICAgIGhhbmRsZXItPnR5cGUgPSBJT1JFUV9UWVBFX1BJTzsKLSAgICBoYW5k
bGVyLT5vcHMgPSAmdnBjaV9wb3J0aW9fb3BzOwotfQotCi0vKiBIYW5kbGVycyB0byB0cmFwIFBD
SSBNTUNGRyBjb25maWcgYWNjZXNzZXMuICovCi1zdGF0aWMgaW50IHZwY2lfbW1jZmdfYWNjZXB0
KHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGFkZHIpCi17Ci0gICAgc3RydWN0IGRvbWFp
biAqZCA9IHYtPmRvbWFpbjsKLSAgICBib29sIGZvdW5kOwotCi0gICAgcmVhZF9sb2NrKCZkLT5h
cmNoLmh2bS5tbWNmZ19sb2NrKTsKLSAgICBmb3VuZCA9IGh2bV9pc19tbWNmZ19hZGRyZXNzKGQs
IGFkZHIpOwotICAgIHJlYWRfdW5sb2NrKCZkLT5hcmNoLmh2bS5tbWNmZ19sb2NrKTsKLQotICAg
IHJldHVybiBmb3VuZDsKLX0KLQotc3RhdGljIGludCB2cGNpX21tY2ZnX3JlYWQoc3RydWN0IHZj
cHUgKnYsIHVuc2lnbmVkIGxvbmcgYWRkciwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCBsZW4sIHVuc2lnbmVkIGxvbmcgKmRhdGEpCi17Ci0gICAgc3RydWN0IGRvbWFp
biAqZCA9IHYtPmRvbWFpbjsKLSAgICBjb25zdCBzdHJ1Y3QgaHZtX21tY2ZnICptbWNmZzsKLSAg
ICB1bnNpZ25lZCBpbnQgcmVnOwotICAgIHBjaV9zYmRmX3Qgc2JkZjsKLQotICAgICpkYXRhID0g
fjB1bDsKLQotICAgIHJlYWRfbG9jaygmZC0+YXJjaC5odm0ubW1jZmdfbG9jayk7Ci0gICAgbW1j
ZmcgPSBodm1fbW1jZmdfZmluZChkLCBhZGRyKTsKLSAgICBpZiAoICFtbWNmZyApCi0gICAgewot
ICAgICAgICByZWFkX3VubG9jaygmZC0+YXJjaC5odm0ubW1jZmdfbG9jayk7Ci0gICAgICAgIHJl
dHVybiBYODZFTVVMX1JFVFJZOwotICAgIH0KLQotICAgIHJlZyA9IGh2bV9tbWNmZ19kZWNvZGVf
YWRkcihtbWNmZywgYWRkciwgJnNiZGYpOwotICAgIHJlYWRfdW5sb2NrKCZkLT5hcmNoLmh2bS5t
bWNmZ19sb2NrKTsKLQotICAgIGlmICggIXZwY2lfYWNjZXNzX2FsbG93ZWQocmVnLCBsZW4pIHx8
Ci0gICAgICAgICAocmVnICsgbGVuKSA+IFBDSV9DRkdfU1BBQ0VfRVhQX1NJWkUgKQotICAgICAg
ICByZXR1cm4gWDg2RU1VTF9PS0FZOwotCi0gICAgLyoKLSAgICAgKiBBY2NvcmRpbmcgdG8gdGhl
IFBDSWUgMy4xQSBzcGVjaWZpY2F0aW9uOgotICAgICAqICAtIENvbmZpZ3VyYXRpb24gUmVhZHMg
YW5kIFdyaXRlcyBtdXN0IHVzdWFsbHkgYmUgRFdPUkQgb3Igc21hbGxlcgotICAgICAqICAgIGlu
IHNpemUuCi0gICAgICogIC0gQmVjYXVzZSBSb290IENvbXBsZXggaW1wbGVtZW50YXRpb25zIGFy
ZSBub3QgcmVxdWlyZWQgdG8gc3VwcG9ydAotICAgICAqICAgIGFjY2Vzc2VzIHRvIGEgUkNSQiB0
aGF0IGNyb3NzIERXIGJvdW5kYXJpZXMgWy4uLl0gc29mdHdhcmUKLSAgICAgKiAgICBzaG91bGQg
dGFrZSBjYXJlIG5vdCB0byBjYXVzZSB0aGUgZ2VuZXJhdGlvbiBvZiBzdWNoIGFjY2Vzc2VzCi0g
ICAgICogICAgd2hlbiBhY2Nlc3NpbmcgYSBSQ1JCIHVubGVzcyB0aGUgUm9vdCBDb21wbGV4IHdp
bGwgc3VwcG9ydCB0aGUKLSAgICAgKiAgICBhY2Nlc3MuCi0gICAgICogIFhlbiBob3dldmVyIHN1
cHBvcnRzIDhieXRlIGFjY2Vzc2VzIGJ5IHNwbGl0dGluZyB0aGVtIGludG8gdHdvCi0gICAgICog
IDRieXRlIGFjY2Vzc2VzLgotICAgICAqLwotICAgICpkYXRhID0gdnBjaV9yZWFkKHNiZGYsIHJl
ZywgbWluKDR1LCBsZW4pKTsKLSAgICBpZiAoIGxlbiA9PSA4ICkKLSAgICAgICAgKmRhdGEgfD0g
KHVpbnQ2NF90KXZwY2lfcmVhZChzYmRmLCByZWcgKyA0LCA0KSA8PCAzMjsKLQotICAgIHJldHVy
biBYODZFTVVMX09LQVk7Ci19Ci0KLXN0YXRpYyBpbnQgdnBjaV9tbWNmZ193cml0ZShzdHJ1Y3Qg
dmNwdSAqdiwgdW5zaWduZWQgbG9uZyBhZGRyLAotICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBsZW4sIHVuc2lnbmVkIGxvbmcgZGF0YSkKLXsKLSAgICBzdHJ1Y3QgZG9t
YWluICpkID0gdi0+ZG9tYWluOwotICAgIGNvbnN0IHN0cnVjdCBodm1fbW1jZmcgKm1tY2ZnOwot
ICAgIHVuc2lnbmVkIGludCByZWc7Ci0gICAgcGNpX3NiZGZfdCBzYmRmOwotCi0gICAgcmVhZF9s
b2NrKCZkLT5hcmNoLmh2bS5tbWNmZ19sb2NrKTsKLSAgICBtbWNmZyA9IGh2bV9tbWNmZ19maW5k
KGQsIGFkZHIpOwotICAgIGlmICggIW1tY2ZnICkKLSAgICB7Ci0gICAgICAgIHJlYWRfdW5sb2Nr
KCZkLT5hcmNoLmh2bS5tbWNmZ19sb2NrKTsKLSAgICAgICAgcmV0dXJuIFg4NkVNVUxfUkVUUlk7
Ci0gICAgfQotCi0gICAgcmVnID0gaHZtX21tY2ZnX2RlY29kZV9hZGRyKG1tY2ZnLCBhZGRyLCAm
c2JkZik7Ci0gICAgcmVhZF91bmxvY2soJmQtPmFyY2guaHZtLm1tY2ZnX2xvY2spOwotCi0gICAg
aWYgKCAhdnBjaV9hY2Nlc3NfYWxsb3dlZChyZWcsIGxlbikgfHwKLSAgICAgICAgIChyZWcgKyBs
ZW4pID4gUENJX0NGR19TUEFDRV9FWFBfU0laRSApCi0gICAgICAgIHJldHVybiBYODZFTVVMX09L
QVk7Ci0KLSAgICB2cGNpX3dyaXRlKHNiZGYsIHJlZywgbWluKDR1LCBsZW4pLCBkYXRhKTsKLSAg
ICBpZiAoIGxlbiA9PSA4ICkKLSAgICAgICAgdnBjaV93cml0ZShzYmRmLCByZWcgKyA0LCA0LCBk
YXRhID4+IDMyKTsKLQotICAgIHJldHVybiBYODZFTVVMX09LQVk7Ci19Ci0KLXN0YXRpYyBjb25z
dCBzdHJ1Y3QgaHZtX21taW9fb3BzIHZwY2lfbW1jZmdfb3BzID0gewotICAgIC5jaGVjayA9IHZw
Y2lfbW1jZmdfYWNjZXB0LAotICAgIC5yZWFkID0gdnBjaV9tbWNmZ19yZWFkLAotICAgIC53cml0
ZSA9IHZwY2lfbW1jZmdfd3JpdGUsCi19OwotCiBpbnQgaHZtX3JlZ2lzdGVyX21tY2ZnKHN0cnVj
dCBkb21haW4gKmQsIHBhZGRyX3QgYWRkciwKICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IHN0YXJ0X2J1cywgdW5zaWduZWQgaW50IGVuZF9idXMsCiAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBzZWcpCkBAIC01MjUsOSArMzI3LDYgQEAgaW50IGh2bV9yZWdp
c3Rlcl9tbWNmZyhzdHJ1Y3QgZG9tYWluICpkLCBwYWRkcl90IGFkZHIsCiAgICAgICAgICAgICBy
ZXR1cm4gcmV0OwogICAgICAgICB9CiAKLSAgICBpZiAoIGxpc3RfZW1wdHkoJmQtPmFyY2guaHZt
Lm1tY2ZnX3JlZ2lvbnMpICYmIGhhc192cGNpKGQpICkKLSAgICAgICAgcmVnaXN0ZXJfbW1pb19o
YW5kbGVyKGQsICZ2cGNpX21tY2ZnX29wcyk7Ci0KICAgICBsaXN0X2FkZCgmbmV3LT5uZXh0LCAm
ZC0+YXJjaC5odm0ubW1jZmdfcmVnaW9ucyk7CiAgICAgd3JpdGVfdW5sb2NrKCZkLT5hcmNoLmh2
bS5tbWNmZ19sb2NrKTsKIApkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgYi94
ZW4vZHJpdmVycy92cGNpL3ZwY2kuYwppbmRleCBjYmQxYmFjN2ZjLi4yMDZmY2FkYmM2IDEwMDY0
NAotLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYworKysgYi94ZW4vZHJpdmVycy92cGNpL3Zw
Y2kuYwpAQCAtMjAsNiArMjAsOCBAQAogI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgogI2luY2x1ZGUg
PHhlbi92cGNpLmg+CiAKKyNpbmNsdWRlIDxhc20vaHZtL2lvcmVxLmg+CisKIC8qIEludGVybmFs
IHN0cnVjdCB0byBzdG9yZSB0aGUgZW11bGF0ZWQgUENJIHJlZ2lzdGVycy4gKi8KIHN0cnVjdCB2
cGNpX3JlZ2lzdGVyIHsKICAgICB2cGNpX3JlYWRfdCAqcmVhZDsKQEAgLTMwMiw3ICszMDQsNyBA
QCBzdGF0aWMgdWludDMyX3QgbWVyZ2VfcmVzdWx0KHVpbnQzMl90IGRhdGEsIHVpbnQzMl90IG5l
dywgdW5zaWduZWQgaW50IHNpemUsCiAgICAgcmV0dXJuIChkYXRhICYgfihtYXNrIDw8IChvZmZz
ZXQgKiA4KSkpIHwgKChuZXcgJiBtYXNrKSA8PCAob2Zmc2V0ICogOCkpOwogfQogCi11aW50MzJf
dCB2cGNpX3JlYWQocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBp
bnQgc2l6ZSkKK3N0YXRpYyB1aW50MzJfdCByZWFkKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQg
aW50IHJlZywgdW5zaWduZWQgaW50IHNpemUpCiB7CiAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAq
ZCA9IGN1cnJlbnQtPmRvbWFpbjsKICAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldjsKQEAg
LTQwNCw4ICs0MDYsOCBAQCBzdGF0aWMgdm9pZCB2cGNpX3dyaXRlX2hlbHBlcihjb25zdCBzdHJ1
Y3QgcGNpX2RldiAqcGRldiwKICAgICAgICAgICAgICByLT5wcml2YXRlKTsKIH0KIAotdm9pZCB2
cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50
IHNpemUsCi0gICAgICAgICAgICAgICAgdWludDMyX3QgZGF0YSkKK3N0YXRpYyB2b2lkIHdyaXRl
KHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50IHNpemUsCisg
ICAgICAgICAgICAgICAgICB1aW50MzJfdCBkYXRhKQogewogICAgIGNvbnN0IHN0cnVjdCBkb21h
aW4gKmQgPSBjdXJyZW50LT5kb21haW47CiAgICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXY7
CkBAIC00NzgsNiArNDgwLDYxIEBAIHZvaWQgdnBjaV93cml0ZShwY2lfc2JkZl90IHNiZGYsIHVu
c2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGludCBzaXplLAogICAgIHNwaW5fdW5sb2NrKCZwZGV2
LT52cGNpLT5sb2NrKTsKIH0KIAorI2lmZGVmIF9fWEVOX18KK3N0YXRpYyBpbnQgaW9yZXFfaGFu
ZGxlcihpb3JlcV90ICpyZXEsIHZvaWQgKmRhdGEpCit7CisgICAgcGNpX3NiZGZfdCBzYmRmOwor
CisgICAgLyoKKyAgICAgKiBOQjogY2VydGFpbiByZXF1ZXN0cyBvZiB0eXBlIGRpZmZlcmVudCB0
aGFuIFBDSSBhcmUgYnJvYWRjYXN0ZWQgdG8gYWxsCisgICAgICogcmVnaXN0ZXJlZCBpb3JlcSBz
ZXJ2ZXJzLCBpZ25vcmVkIHRob3NlLgorICAgICAqLworICAgIGlmICggcmVxLT50eXBlICE9IElP
UkVRX1RZUEVfUENJX0NPTkZJRyB8fCByZXEtPmRhdGFfaXNfcHRyICkKKyAgICAgICAgcmV0dXJu
IFg4NkVNVUxfVU5IQU5ETEVBQkxFOworCisgICAgc2JkZi5zYmRmID0gcmVxLT5hZGRyID4+IDMy
OworCisgICAgaWYgKCByZXEtPmRpciApCisgICAgICAgIHJlcS0+ZGF0YSA9IHJlYWQoc2JkZiwg
cmVxLT5hZGRyLCByZXEtPnNpemUpOworICAgIGVsc2UKKyAgICAgICAgd3JpdGUoc2JkZiwgcmVx
LT5hZGRyLCByZXEtPnNpemUsIHJlcS0+ZGF0YSk7CisKKyAgICByZXR1cm4gWDg2RU1VTF9PS0FZ
OworfQorCitpbnQgdnBjaV9yZWdpc3Rlcl9pb3JlcShzdHJ1Y3QgZG9tYWluICpkKQoreworICAg
IGlvc2VydmlkX3QgaWQ7CisgICAgaW50IHJjOworCisgICAgaWYgKCAhaGFzX3ZwY2koZCkgKQor
ICAgICAgICByZXR1cm4gMDsKKworICAgIHJjID0gaHZtX2NyZWF0ZV9pb3JlcV9zZXJ2ZXIoZCwg
SFZNX0lPUkVRU1JWX0JVRklPUkVRX09GRiwgJmlkLCB0cnVlKTsKKyAgICBpZiAoIHJjICkKKyAg
ICAgICAgcmV0dXJuIHJjOworCisgICAgcmMgPSBodm1fc2V0X2lvcmVxX2hhbmRsZXIoZCwgaWQs
IGlvcmVxX2hhbmRsZXIsIE5VTEwpOworICAgIGlmICggcmMgKQorICAgICAgICByZXR1cm4gcmM7
CisKKyAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSApCisgICAgeworICAgICAgICAvKiBI
YW5kbGUgYWxsIGRldmljZXMgaW4gdnBjaS4gKi8KKyAgICAgICAgcmMgPSBodm1fbWFwX2lvX3Jh
bmdlX3RvX2lvcmVxX3NlcnZlcihkLCBpZCwgWEVOX0RNT1BfSU9fUkFOR0VfUENJLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIH4odWludDY0X3QpMCk7
CisgICAgICAgIGlmICggcmMgKQorICAgICAgICAgICAgcmV0dXJuIHJjOworICAgIH0KKworICAg
IHJjID0gaHZtX3NldF9pb3JlcV9zZXJ2ZXJfc3RhdGUoZCwgaWQsIHRydWUpOworICAgIGlmICgg
cmMgKQorICAgICAgICByZXR1cm4gcmM7CisKKyAgICByZXR1cm4gcmM7Cit9CisjZW5kaWYKKwog
LyoKICAqIExvY2FsIHZhcmlhYmxlczoKICAqIG1vZGU6IEMKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3hlbi92cGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oCmluZGV4IDUyOTVkNGM5OTAu
LjRlOTU5MWMwMjAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgKKysrIGIveGVu
L2luY2x1ZGUveGVuL3ZwY2kuaApAQCAtMjMsNiArMjMsOSBAQCB0eXBlZGVmIGludCB2cGNpX3Jl
Z2lzdGVyX2luaXRfdChzdHJ1Y3QgcGNpX2RldiAqZGV2KTsKICAgc3RhdGljIHZwY2lfcmVnaXN0
ZXJfaW5pdF90ICpjb25zdCB4IyNfZW50cnkgIFwKICAgICAgICAgICAgICAgIF9fdXNlZF9zZWN0
aW9uKCIuZGF0YS52cGNpLiIgcCkgPSB4CiAKKy8qIFJlZ2lzdGVyIHZQQ0kgaGFuZGxlciB3aXRo
IGlvcmVxLiAqLworaW50IHZwY2lfcmVnaXN0ZXJfaW9yZXEoc3RydWN0IGRvbWFpbiAqZCk7CisK
IC8qIEFkZCB2UENJIGhhbmRsZXJzIHRvIGRldmljZS4gKi8KIGludCBfX211c3RfY2hlY2sgdnBj
aV9hZGRfaGFuZGxlcnMoc3RydWN0IHBjaV9kZXYgKmRldik7CiAKQEAgLTM4LDExICs0MSw2IEBA
IGludCBfX211c3RfY2hlY2sgdnBjaV9hZGRfcmVnaXN0ZXIoc3RydWN0IHZwY2kgKnZwY2ksCiBp
bnQgX19tdXN0X2NoZWNrIHZwY2lfcmVtb3ZlX3JlZ2lzdGVyKHN0cnVjdCB2cGNpICp2cGNpLCB1
bnNpZ25lZCBpbnQgb2Zmc2V0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgc2l6ZSk7CiAKLS8qIEdlbmVyaWMgcmVhZC93cml0ZSBoYW5kbGVycyBm
b3IgdGhlIFBDSSBjb25maWcgc3BhY2UuICovCi11aW50MzJfdCB2cGNpX3JlYWQocGNpX3NiZGZf
dCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSk7Ci12b2lkIHZwY2lf
d3JpdGUocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6
ZSwKLSAgICAgICAgICAgICAgICB1aW50MzJfdCBkYXRhKTsKLQogLyogUGFzc3Rocm91Z2ggaGFu
ZGxlcnMuICovCiB1aW50MzJfdCB2cGNpX2h3X3JlYWQxNihjb25zdCBzdHJ1Y3QgcGNpX2RldiAq
cGRldiwgdW5zaWduZWQgaW50IHJlZywKICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRh
dGEpOwpAQCAtMjE5LDIwICsyMTcsMTIgQEAgc3RhdGljIGlubGluZSBpbnQgdnBjaV9hZGRfaGFu
ZGxlcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpCiAgICAgcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBp
bmxpbmUgdm9pZCB2cGNpX2R1bXBfbXNpKHZvaWQpIHsgfQotCi1zdGF0aWMgaW5saW5lIHVpbnQz
Ml90IHZwY2lfcmVhZChwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsCi0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc2l6ZSkKK3N0YXRpYyBpbmxp
bmUgaW50IHZwY2lfcmVnaXN0ZXJfaW9yZXEoc3RydWN0IGRvbWFpbiAqZCkKIHsKLSAgICBBU1NF
UlRfVU5SRUFDSEFCTEUoKTsKLSAgICByZXR1cm4gfih1aW50MzJfdCkwOworICAgIHJldHVybiAw
OwogfQogCi1zdGF0aWMgaW5saW5lIHZvaWQgdnBjaV93cml0ZShwY2lfc2JkZl90IHNiZGYsIHVu
c2lnbmVkIGludCByZWcsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgc2l6ZSwgdWludDMyX3QgZGF0YSkKLXsKLSAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKLX0K
K3N0YXRpYyBpbmxpbmUgdm9pZCB2cGNpX2R1bXBfbXNpKHZvaWQpIHsgfQogCiBzdGF0aWMgaW5s
aW5lIGJvb2wgdnBjaV9wcm9jZXNzX3BlbmRpbmcoc3RydWN0IHZjcHUgKnYpCiB7Ci0tIAoyLjIz
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
