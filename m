Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E195012A301
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 16:43:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijmIt-0003ei-31; Tue, 24 Dec 2019 15:40:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AG6B=2O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ijmIq-0003eE-VH
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 15:40:56 +0000
X-Inumbo-ID: bef87422-2663-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bef87422-2663-11ea-b6f1-bc764e2007e4;
 Tue, 24 Dec 2019 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577202043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=KQhkIOgzt49L0i00k4ynvFA0A6jR7i5a5ab8esd54EA=;
 b=dtn4pP8oOPr+8e7XczNMAyQJNII5loDzGqT9dbOZ0a6Bz0/VyqHxHj9p
 F2IA1PEdSLRDsVT9z2c4hc0BJjgQFwYUJC5hkwh7P2idBTiMK/RNDpcae
 to4TJGoe/wNspRJGtxPbO9QrAYAOYFDK+zr7dGixqRQc1JtXe6WRlSNUd c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bJ1LtwAbfu2lBrqKcluGb8rv8TXteGtmbtGpQnwT2y6Bowu6Rogs4svlXZDUQ1HQfn8BH1pyiB
 s8Oq1xo6OcJ8yK553UigNokKcGdfxrSkG9MyMTGBck1HnW0Aa4r5yoZB+AwnCtKEvdTrS6vF/F
 KrbuECntSrTyQcrTnfrTb3hZMX60T5I9k40Vk4OqnVQSzPI5Nwl0gL7qDgpGXvmH5ALZg8CtEC
 TMYNLGnONO2JsT4nUkk3+jQJLVsQwxBWlozRCRfNgA7T5zNBvvioynt0Pi9JGG8JiqDHwaxvn1
 aXU=
X-SBRS: 2.7
X-MesageID: 10541026
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10541026"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 15:19:32 +0000
Message-ID: <20191224151932.6304-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191224151932.6304-1-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 12/12] libxc/save: Write X86_{CPUID,
 MSR}_DATA records
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBhbGwgb3RoZXIgcGx1bWJpbmcgaW4gcGxhY2UsIG9idGFpbiB0aGUgQ1BVIFBvbGljeSBm
cm9tIFhlbiBhbmQKd3JpdGUgaXQgaW50byB0aGUgbWlncmF0aW9uIHN0cmVhbS4KClNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzog
SWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgotLS0KIHRvb2xzL2xpYnhjL3hjX3NyX2NvbW1vbl94ODYuYyAgIHwgNTAgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMvbGlieGMveGNfc3JfY29tbW9u
X3g4Ni5oICAgfCAgNiArKysrKwogdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfaHZtLmMgfCAg
MiArLQogdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfcHYuYyAgfCAgMyArKy0KIDQgZmlsZXMg
Y2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
b29scy9saWJ4Yy94Y19zcl9jb21tb25feDg2LmMgYi90b29scy9saWJ4Yy94Y19zcl9jb21tb25f
eDg2LmMKaW5kZXggZDRkODZiYjEyZi4uMDlmYjFkOTNkNiAxMDA2NDQKLS0tIGEvdG9vbHMvbGli
eGMveGNfc3JfY29tbW9uX3g4Ni5jCisrKyBiL3Rvb2xzL2xpYnhjL3hjX3NyX2NvbW1vbl94ODYu
YwpAQCAtNDksNiArNDksNTYgQEAgaW50IHg4Nl9zdGF0aWNfZGF0YV9jb21wbGV0ZShzdHJ1Y3Qg
eGNfc3JfY29udGV4dCAqY3R4KQogICAgIHJldHVybiAwOwogfQogCitpbnQgd3JpdGVfeDg2X2Nw
dV9wb2xpY3lfcmVjb3JkcyhzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4KQoreworICAgIHhjX2lu
dGVyZmFjZSAqeGNoID0gY3R4LT54Y2g7CisgICAgc3RydWN0IHhjX3NyX3JlY29yZCBjcHVpZCA9
IHsgLnR5cGUgPSBSRUNfVFlQRV9YODZfQ1BVSURfUE9MSUNZLCB9OworICAgIHN0cnVjdCB4Y19z
cl9yZWNvcmQgbXNycyAgPSB7IC50eXBlID0gUkVDX1RZUEVfWDg2X01TUl9QT0xJQ1ksIH07Cisg
ICAgdWludDMyX3QgbnJfbGVhdmVzID0gMCwgbnJfbXNycyA9IDA7CisgICAgaW50IHJjOworCisg
ICAgaWYgKCB4Y19nZXRfY3B1X3BvbGljeV9zaXplKHhjaCwgJm5yX2xlYXZlcywgJm5yX21zcnMp
IDwgMCApCisgICAgeworICAgICAgICBQRVJST1IoIlVuYWJsZSB0byBnZXQgQ1BVIFBvbGljeSBz
aXplIik7CisgICAgICAgIHJldHVybiAtMTsKKyAgICB9CisKKyAgICBjcHVpZC5kYXRhID0gbWFs
bG9jKG5yX2xlYXZlcyAqIHNpemVvZih4ZW5fY3B1aWRfbGVhZl90KSk7CisgICAgbXNycy5kYXRh
ICA9IG1hbGxvYyhucl9tc3JzICAgKiBzaXplb2YoeGVuX21zcl9lbnRyeV90KSk7CisgICAgaWYg
KCAhY3B1aWQuZGF0YSB8fCAhbXNycy5kYXRhICkKKyAgICB7CisgICAgICAgIEVSUk9SKCJDYW5u
b3QgYWxsb2NhdGUgbWVtb3J5IGZvciBDUFUgUG9saWN5Iik7CisgICAgICAgIHJjID0gLTE7Cisg
ICAgICAgIGdvdG8gb3V0OworICAgIH0KKworICAgIGlmICggeGNfZ2V0X2RvbWFpbl9jcHVfcG9s
aWN5KHhjaCwgY3R4LT5kb21pZCwgJm5yX2xlYXZlcywgY3B1aWQuZGF0YSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmbnJfbXNycywgbXNycy5kYXRhKSApCisgICAgeworICAg
ICAgICBQRVJST1IoIlVuYWJsZSB0byBnZXQgZCVkIENQVSBQb2xpY3kiLCBjdHgtPmRvbWlkKTsK
KyAgICAgICAgcmMgPSAtMTsKKyAgICAgICAgZ290byBvdXQ7CisgICAgfQorCisgICAgY3B1aWQu
bGVuZ3RoID0gbnJfbGVhdmVzICogc2l6ZW9mKHhlbl9jcHVpZF9sZWFmX3QpOworICAgIGlmICgg
Y3B1aWQubGVuZ3RoICkKKyAgICB7CisgICAgICAgIHJjID0gd3JpdGVfcmVjb3JkKGN0eCwgJmNw
dWlkKTsKKyAgICAgICAgaWYgKCByYyApCisgICAgICAgICAgICBnb3RvIG91dDsKKyAgICB9CisK
KyAgICBtc3JzLmxlbmd0aCA9IG5yX21zcnMgKiBzaXplb2YoeGVuX21zcl9lbnRyeV90KTsKKyAg
ICBpZiAoIG1zcnMubGVuZ3RoICkKKyAgICAgICAgcmMgPSB3cml0ZV9yZWNvcmQoY3R4LCAmbXNy
cyk7CisKKyBvdXQ6CisgICAgZnJlZShjcHVpZC5kYXRhKTsKKyAgICBmcmVlKG1zcnMuZGF0YSk7
CisKKyAgICByZXR1cm4gcmM7Cit9CisKIGludCBoYW5kbGVfeDg2X2NwdWlkX3BvbGljeShzdHJ1
Y3QgeGNfc3JfY29udGV4dCAqY3R4LCBzdHJ1Y3QgeGNfc3JfcmVjb3JkICpyZWMpCiB7CiAgICAg
eGNfaW50ZXJmYWNlICp4Y2ggPSBjdHgtPnhjaDsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hj
X3NyX2NvbW1vbl94ODYuaCBiL3Rvb2xzL2xpYnhjL3hjX3NyX2NvbW1vbl94ODYuaAppbmRleCBm
N2ZhNGZlNjJiLi43YjE4MjNlY2E5IDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19zcl9jb21t
b25feDg2LmgKKysrIGIvdG9vbHMvbGlieGMveGNfc3JfY29tbW9uX3g4Ni5oCkBAIC0yMCw2ICsy
MCwxMiBAQCBpbnQgaGFuZGxlX3g4Nl90c2NfaW5mbyhzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4
LCBzdHJ1Y3QgeGNfc3JfcmVjb3JkICpyZWMpOwogaW50IHg4Nl9zdGF0aWNfZGF0YV9jb21wbGV0
ZShzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4KTsKIAogLyoKKyAqIE9idGFpbnMgYSBkb21haW5z
IENQVSBQb2xpY3kgZnJvbSBYZW4sIGFuZCB3cml0ZXMgWDg2X3tDUFVJRCxNU1J9X1BPTElDWQor
ICogcmVjb3JkcyBpbnRvIHRoZSBzdHJlYW0uCisgKi8KK2ludCB3cml0ZV94ODZfY3B1X3BvbGlj
eV9yZWNvcmRzKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgpOworCisvKgogICogUGFyc2VzIGFu
IFg4Nl9DUFVJRF9QT0xJQ1kgcmVjb3JkIGFuZCBzdGFzaGVzIHRoZSBjb250ZW50IGZvciBhcHBs
aWNhdGlvbgogICogd2hlbiBhIFNUQVRJQ19EQVRBX0VORCByZWNvcmQgaXMgZW5jb3VudGVyZWQu
CiAgKi8KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX3NyX3NhdmVfeDg2X2h2bS5jIGIvdG9v
bHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfaHZtLmMKaW5kZXggYzE0NmU4MjdiYy4uNWI5NWQyMGIx
OSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfaHZtLmMKKysrIGIvdG9v
bHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfaHZtLmMKQEAgLTE3Miw3ICsxNzIsNyBAQCBzdGF0aWMg
aW50IHg4Nl9odm1fc2V0dXAoc3RydWN0IHhjX3NyX2NvbnRleHQgKmN0eCkKIAogc3RhdGljIGlu
dCB4ODZfaHZtX3N0YXRpY19kYXRhKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgpCiB7Ci0gICAg
cmV0dXJuIDA7CisgICAgcmV0dXJuIHdyaXRlX3g4Nl9jcHVfcG9saWN5X3JlY29yZHMoY3R4KTsK
IH0KIAogc3RhdGljIGludCB4ODZfaHZtX3N0YXJ0X29mX3N0cmVhbShzdHJ1Y3QgeGNfc3JfY29u
dGV4dCAqY3R4KQpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfcHYuYyBi
L3Rvb2xzL2xpYnhjL3hjX3NyX3NhdmVfeDg2X3B2LmMKaW5kZXggOWQxY2E2ZWFkNy4uMmU5YWE5
ZWExNiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfcHYuYworKysgYi90
b29scy9saWJ4Yy94Y19zcl9zYXZlX3g4Nl9wdi5jCkBAIC0xMDMwLDcgKzEwMzAsOCBAQCBzdGF0
aWMgaW50IHg4Nl9wdl9zZXR1cChzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4KQogCiBzdGF0aWMg
aW50IHg4Nl9wdl9zdGF0aWNfZGF0YShzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4KQogewotICAg
IHJldHVybiB3cml0ZV94ODZfcHZfaW5mbyhjdHgpOworICAgIHJldHVybiAod3JpdGVfeDg2X3B2
X2luZm8oY3R4KSA/OgorICAgICAgICAgICAgd3JpdGVfeDg2X2NwdV9wb2xpY3lfcmVjb3Jkcyhj
dHgpKTsKIH0KIAogc3RhdGljIGludCB4ODZfcHZfc3RhcnRfb2Zfc3RyZWFtKHN0cnVjdCB4Y19z
cl9jb250ZXh0ICpjdHgpCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
