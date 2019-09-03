Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8071AA65DE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 11:42:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i55HY-0005vM-2g; Tue, 03 Sep 2019 09:39:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i55HW-0005v9-KF
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 09:39:22 +0000
X-Inumbo-ID: b4e5326e-ce2e-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4e5326e-ce2e-11e9-8980-bc764e2007e4;
 Tue, 03 Sep 2019 09:39:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BD651ABED;
 Tue,  3 Sep 2019 09:39:20 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
Message-ID: <512c5c07-2f76-92d7-25ad-638813947b27@suse.com>
Date: Tue, 3 Sep 2019 11:39:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 4/8] x86emul: support INVPCID
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
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVzdCBsaWtlIGZvciBJTlZMUEdBIHRoZSBIVk0gaG9vayBvbmx5IHN1cHBvcnRzIFBDSUQgMCBm
b3IgdGhlIHRpbWUKYmVpbmcgZm9yIGluZGl2aWR1YWwgYWRkcmVzcyBpbnZhbGlkYXRpb24uIEl0
IGFsc28gdHJhbnNsYXRlcyB0aGUgb3RoZXIKdHlwZXMgdG8gYSBmdWxsIGZsdXNoLCB3aGljaCBp
cyBhcmNoaXRlY3R1cmFsbHkgcGVybWl0dGVkIGFuZApwZXJmb3JtYW5jZS13aXNlIHByZXN1bWFi
bHkgbm90IG11Y2ggd29yc2UgYmVjYXVzZSBlbXVsYXRpb24gaXMgc2xvdwphbnl3YXkuCgpTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBQ
YXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCnYzOiBSZS1iYXNlIG92ZXIg
WDg2X0lOVlBDSURfKiBuYW1lIGNoYW5nZS4KdjI6IE5ldy4KCi0tLSBhL3Rvb2xzL2Z1enoveDg2
X2luc3RydWN0aW9uX2VtdWxhdG9yL2Z1enotZW11bC5jCisrKyBiL3Rvb2xzL2Z1enoveDg2X2lu
c3RydWN0aW9uX2VtdWxhdG9yL2Z1enotZW11bC5jCkBAIC0zODIsNiArMzgyLDcgQEAgc3RhdGlj
IGludCBmdXp6X3RsYl9vcCgKICAgICAgICAgYXNzZXJ0KGlzX3g4Nl91c2VyX3NlZ21lbnQoYXV4
KSk7CiAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwogICAgIGNhc2UgeDg2ZW11bF9pbnZscGdh
OgorICAgIGNhc2UgeDg2ZW11bF9pbnZwY2lkOgogICAgICAgICBhc3NlcnQoY3R4dC0+YWRkcl9z
aXplID09IDY0IHx8ICEoYWRkciA+PiAzMikpOwogICAgICAgICBicmVhazsKICAgICB9Ci0tLSBh
L3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci90ZXN0X3g4Nl9lbXVsYXRvci5jCisrKyBiL3Rvb2xz
L3Rlc3RzL3g4Nl9lbXVsYXRvci90ZXN0X3g4Nl9lbXVsYXRvci5jCkBAIC02ODQsNiArNjg0LDM4
IEBAIHN0YXRpYyBpbnQgcmVhZF9tc3IoCiAgICAgcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxF
OwogfQogCisjZGVmaW5lIElOVlBDSURfQUREUiAweDEyMzQ1Njc4CisjZGVmaW5lIElOVlBDSURf
UENJRCAweDEyMworCitzdGF0aWMgaW50IHJlYWRfY3JfaW52cGNpZCgKKyAgICB1bnNpZ25lZCBp
bnQgcmVnLAorICAgIHVuc2lnbmVkIGxvbmcgKnZhbCwKKyAgICBzdHJ1Y3QgeDg2X2VtdWxhdGVf
Y3R4dCAqY3R4dCkKK3sKKyAgICBpbnQgcmMgPSBlbXVsX3Rlc3RfcmVhZF9jcihyZWcsIHZhbCwg
Y3R4dCk7CisKKyAgICBpZiAoIHJjID09IFg4NkVNVUxfT0tBWSAmJiByZWcgPT0gNCApCisgICAg
ICAgICp2YWwgfD0gWDg2X0NSNF9QQ0lERTsKKworICAgIHJldHVybiByYzsKK30KKworc3RhdGlj
IGludCB0bGJfb3BfaW52cGNpZCgKKyAgICBlbnVtIHg4NmVtdWxfdGxiX29wIG9wLAorICAgIHVu
c2lnbmVkIGxvbmcgYWRkciwKKyAgICB1bnNpZ25lZCBsb25nIGF1eCwKKyAgICBzdHJ1Y3QgeDg2
X2VtdWxhdGVfY3R4dCAqY3R4dCkKK3sKKyAgICBzdGF0aWMgdW5zaWduZWQgaW50IHNlcTsKKwor
ICAgIGlmICggb3AgIT0geDg2ZW11bF9pbnZwY2lkIHx8IGFkZHIgIT0gSU5WUENJRF9BRERSIHx8
CisgICAgICAgICB4ODZlbXVsX2ludnBjaWRfcGNpZChhdXgpICE9IChzZXEgPCA0ID8gMCA6IElO
VlBDSURfUENJRCkgfHwKKyAgICAgICAgIHg4NmVtdWxfaW52cGNpZF90eXBlKGF1eCkgIT0gKHNl
cSsrICYgMykgKQorICAgICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7CisKKyAgICBy
ZXR1cm4gWDg2RU1VTF9PS0FZOworfQorCiBzdGF0aWMgc3RydWN0IHg4Nl9lbXVsYXRlX29wcyBl
bXVsb3BzID0gewogICAgIC5yZWFkICAgICAgID0gcmVhZCwKICAgICAuaW5zbl9mZXRjaCA9IGZl
dGNoLApAQCAtNDQ4Miw2ICs0NTE0LDQ2IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJn
dikKICAgICAgICAgcHJpbnRmKCJva2F5XG4iKTsKICAgICB9CiAgICAgZWxzZQorICAgICAgICBw
cmludGYoInNraXBwZWRcbiIpOworCisgICAgcHJpbnRmKCIlLTQwcyIsICJUZXN0aW5nIGludnBj
aWQgMTYoJWVjeCksJSVlZHguLi4iKTsKKyAgICBpZiAoIHN0YWNrX2V4ZWMgKQorICAgIHsKKyAg
ICAgICAgZGVjbF9pbnNuKGludnBjaWQpOworCisgICAgICAgIGFzbSB2b2xhdGlsZSAoIHB1dF9p
bnNuKGludnBjaWQsICJpbnZwY2lkIDE2KCUwKSwgJTEiKQorICAgICAgICAgICAgICAgICAgICAg
ICA6OiAiYyIgKE5VTEwpLCAiZCIgKDBMKSApOworCisgICAgICAgIHJlc1s0XSA9IDA7CisgICAg
ICAgIHJlc1s1XSA9IDA7CisgICAgICAgIHJlc1s2XSA9IElOVlBDSURfQUREUjsKKyAgICAgICAg
cmVzWzddID0gMDsKKyAgICAgICAgcmVncy5lY3ggPSAodW5zaWduZWQgbG9uZylyZXM7CisgICAg
ICAgIGVtdWxvcHMudGxiX29wID0gdGxiX29wX2ludnBjaWQ7CisKKyAgICAgICAgZm9yICggOyA7
ICkKKyAgICAgICAgeworICAgICAgICAgICAgZm9yICggcmVncy5lZHggPSAwOyByZWdzLmVkeCA8
IDQ7ICsrcmVncy5lZHggKQorICAgICAgICAgICAgeworICAgICAgICAgICAgICAgIHNldF9pbnNu
KGludnBjaWQpOworICAgICAgICAgICAgICAgIHJjID0geDg2X2VtdWxhdGUoJmN0eHQsICZlbXVs
b3BzKTsKKyAgICAgICAgICAgICAgICBpZiAoIHJjICE9IFg4NkVNVUxfT0tBWSB8fCAhY2hlY2tf
ZWlwKGludnBjaWQpICkKKyAgICAgICAgICAgICAgICAgICAgZ290byBmYWlsOworICAgICAgICAg
ICAgfQorCisgICAgICAgICAgICBpZiAoIGN0eHQuYWRkcl9zaXplIDwgNjQgfHwgcmVzWzRdID09
IElOVlBDSURfUENJRCApCisgICAgICAgICAgICAgICAgYnJlYWs7CisKKyAgICAgICAgICAgIGVt
dWxvcHMucmVhZF9jciA9IHJlYWRfY3JfaW52cGNpZDsKKyAgICAgICAgICAgIHJlc1s0XSA9IElO
VlBDSURfUENJRDsKKyAgICAgICAgfQorCisgICAgICAgIGVtdWxvcHMucmVhZF9jciA9IGVtdWxf
dGVzdF9yZWFkX2NyOworICAgICAgICBlbXVsb3BzLnRsYl9vcCA9IE5VTEw7CisKKyAgICAgICAg
cHJpbnRmKCJva2F5XG4iKTsKKyAgICB9CisgICAgZWxzZQogICAgICAgICBwcmludGYoInNraXBw
ZWRcbiIpOwogCiAjdW5kZWYgZGVjbF9pbnNuCi0tLSBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRv
ci94ODYtZW11bGF0ZS5jCisrKyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci94ODYtZW11bGF0
ZS5jCkBAIC03Miw2ICs3Miw3IEBAIGJvb2wgZW11bF90ZXN0X2luaXQodm9pZCkKICAgICAgKiB0
aGVtLgogICAgICAqLwogICAgIGNwLmJhc2ljLm1vdmJlID0gdHJ1ZTsKKyAgICBjcC5mZWF0Lmlu
dnBjaWQgPSB0cnVlOwogICAgIGNwLmZlYXQuYWR4ID0gdHJ1ZTsKICAgICBjcC5mZWF0LmF2eDUx
MnBmID0gY3AuZmVhdC5hdng1MTJmOwogICAgIGNwLmZlYXQucmRwaWQgPSB0cnVlOwpAQCAtMTQx
LDcgKzE0Miw3IEBAIGludCBlbXVsX3Rlc3RfY3B1aWQoCiAgICAgICovCiAgICAgaWYgKCBsZWFm
ID09IDcgJiYgc3VibGVhZiA9PSAwICkKICAgICB7Ci0gICAgICAgIHJlcy0+YiB8PSAxVSA8PCAx
OTsKKyAgICAgICAgcmVzLT5iIHw9ICgxVSA8PCAxMCkgfCAoMVUgPDwgMTkpOwogICAgICAgICBp
ZiAoIHJlcy0+YiAmICgxVSA8PCAxNikgKQogICAgICAgICAgICAgcmVzLT5iIHw9IDFVIDw8IDI2
OwogICAgICAgICByZXMtPmMgfD0gMVUgPDwgMjI7Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZW11
bGF0ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCkBAIC0yMzkwLDggKzIzOTAs
MTYgQEAgc3RhdGljIGludCBodm1lbXVsX3RsYl9vcCgKICAgICAgICAgICAgIHBhZ2luZ19pbnZs
cGcoY3VycmVudCwgYWRkcik7CiAgICAgICAgIGJyZWFrOwogCisgICAgY2FzZSB4ODZlbXVsX2lu
dnBjaWQ6CisgICAgICAgIGlmICggeDg2ZW11bF9pbnZwY2lkX3R5cGUoYXV4KSAhPSBYODZfSU5W
UENJRF9JTkRJVl9BRERSICkKKyAgICAgICAgeworICAgICAgICAgICAgaHZtX2FzaWRfZmx1c2hf
dmNwdShjdXJyZW50KTsKKyAgICAgICAgICAgIGJyZWFrOworICAgICAgICB9CisgICAgICAgIGF1
eCA9IHg4NmVtdWxfaW52cGNpZF9wY2lkKGF1eCk7CisgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAq
LwogICAgIGNhc2UgeDg2ZW11bF9pbnZscGdhOgotICAgICAgICAvKiBUT0RPOiBTdXBwb3J0IEFT
SURzLiAqLworICAgICAgICAvKiBUT0RPOiBTdXBwb3J0IEFTSURzL1BDSURzLiAqLwogICAgICAg
ICBpZiAoICFhdXggKQogICAgICAgICAgICAgcGFnaW5nX2ludmxwZyhjdXJyZW50LCBhZGRyKTsK
ICAgICAgICAgZWxzZQotLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUu
YworKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwpAQCAtNDk2LDYg
KzQ5Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZXh0MGYzOF90YWJsZSB7CiAgICAgWzB4N2Eg
Li4uIDB4N2NdID0geyAuc2ltZF9zaXplID0gc2ltZF9ub25lLCAudHdvX29wID0gMSB9LAogICAg
IFsweDdkIC4uLiAweDdlXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfcGFja2VkX2ludCwgLmQ4cyA9
IGQ4c192bCB9LAogICAgIFsweDdmXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfcGFja2VkX2ZwLCAu
ZDhzID0gZDhzX3ZsIH0sCisgICAgWzB4ODJdID0geyAuc2ltZF9zaXplID0gc2ltZF9vdGhlciB9
LAogICAgIFsweDgzXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfcGFja2VkX2ludCwgLmQ4cyA9IGQ4
c192bCB9LAogICAgIFsweDg4XSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfcGFja2VkX2ZwLCAudHdv
X29wID0gMSwgLmQ4cyA9IGQ4c19kcSB9LAogICAgIFsweDg5XSA9IHsgLnNpbWRfc2l6ZSA9IHNp
bWRfcGFja2VkX2ludCwgLnR3b19vcCA9IDEsIC5kOHMgPSBkOHNfZHEgfSwKQEAgLTE4NzUsNiAr
MTg3Niw3IEBAIGluX3Byb3Rtb2RlKAogI2RlZmluZSB2Y3B1X2hhc19obGUoKSAgICAgICAgIChj
dHh0LT5jcHVpZC0+ZmVhdC5obGUpCiAjZGVmaW5lIHZjcHVfaGFzX2F2eDIoKSAgICAgICAgKGN0
eHQtPmNwdWlkLT5mZWF0LmF2eDIpCiAjZGVmaW5lIHZjcHVfaGFzX2JtaTIoKSAgICAgICAgKGN0
eHQtPmNwdWlkLT5mZWF0LmJtaTIpCisjZGVmaW5lIHZjcHVfaGFzX2ludnBjaWQoKSAgICAgKGN0
eHQtPmNwdWlkLT5mZWF0LmludnBjaWQpCiAjZGVmaW5lIHZjcHVfaGFzX3J0bSgpICAgICAgICAg
KGN0eHQtPmNwdWlkLT5mZWF0LnJ0bSkKICNkZWZpbmUgdmNwdV9oYXNfbXB4KCkgICAgICAgICAo
Y3R4dC0+Y3B1aWQtPmZlYXQubXB4KQogI2RlZmluZSB2Y3B1X2hhc19hdng1MTJmKCkgICAgIChj
dHh0LT5jcHVpZC0+ZmVhdC5hdng1MTJmKQpAQCAtOTEyNCw2ICs5MTI2LDQ4IEBAIHg4Nl9lbXVs
YXRlKAogICAgICAgICBBU1NFUlQoIXN0YXRlLT5zaW1kX3NpemUpOwogICAgICAgICBicmVhazsK
IAorICAgIGNhc2UgWDg2RU1VTF9PUENfNjYoMHgwZjM4LCAweDgyKTogLyogaW52cGNpZCByZWcs
bTEyOCAqLworICAgICAgICB2Y3B1X211c3RfaGF2ZShpbnZwY2lkKTsKKyAgICAgICAgZ2VuZXJh
dGVfZXhjZXB0aW9uX2lmKGVhLnR5cGUgIT0gT1BfTUVNLCBFWENfVUQpOworICAgICAgICBnZW5l
cmF0ZV9leGNlcHRpb25faWYoIW1vZGVfcmluZzAoKSwgRVhDX0dQLCAwKTsKKworICAgICAgICBp
ZiAoIChyYyA9IG9wcy0+cmVhZChlYS5tZW0uc2VnLCBlYS5tZW0ub2ZmLCBtbXZhbHAsIDE2LAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdHh0KSkgIT0gWDg2RU1VTF9PS0FZICkKKyAg
ICAgICAgICAgIGdvdG8gZG9uZTsKKworICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYobW12
YWxwLT54bW1bMF0gJiB+MHhmZmYsIEVYQ19HUCwgMCk7CisgICAgICAgIGRzdC52YWwgPSBtb2Rl
XzY0Yml0KCkgPyAqZHN0LnJlZyA6ICh1aW50MzJfdCkqZHN0LnJlZzsKKworICAgICAgICBzd2l0
Y2ggKCBkc3QudmFsICkKKyAgICAgICAgeworICAgICAgICBjYXNlIFg4Nl9JTlZQQ0lEX0lORElW
X0FERFI6CisgICAgICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKCFpc19jYW5vbmljYWxf
YWRkcmVzcyhtbXZhbHAtPnhtbVsxXSksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEVYQ19HUCwgMCk7CisgICAgICAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCisgICAgICAg
IGNhc2UgWDg2X0lOVlBDSURfU0lOR0xFX0NUWFQ6CisgICAgICAgICAgICAgaWYgKCAhbW9kZV82
NGJpdCgpIHx8ICFvcHMtPnJlYWRfY3IgKQorICAgICAgICAgICAgICAgICBjcjQgPSAwOworICAg
ICAgICAgICAgIGVsc2UgaWYgKCAocmMgPSBvcHMtPnJlYWRfY3IoNCwgJmNyNCwgY3R4dCkpICE9
IFg4NkVNVUxfT0tBWSApCisgICAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKKyAgICAgICAgICAg
ICBnZW5lcmF0ZV9leGNlcHRpb25faWYoIShjcjQgJiBYODZfQ1I0X1BDSURFKSAmJiBtbXZhbHAt
PnhtbVswXSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRVhDX0dQLCAwKTsK
KyAgICAgICAgICAgICBicmVhazsKKyAgICAgICAgY2FzZSBYODZfSU5WUENJRF9BTExfSU5DTF9H
TE9CQUw6CisgICAgICAgIGNhc2UgWDg2X0lOVlBDSURfQUxMX05PTl9HTE9CQUw6CisgICAgICAg
ICAgICAgYnJlYWs7CisgICAgICAgIGRlZmF1bHQ6CisgICAgICAgICAgICAgZ2VuZXJhdGVfZXhj
ZXB0aW9uKEVYQ19HUCwgMCk7CisgICAgICAgIH0KKworICAgICAgICBmYWlsX2lmKCFvcHMtPnRs
Yl9vcCk7CisgICAgICAgIGlmICggKHJjID0gb3BzLT50bGJfb3AoeDg2ZW11bF9pbnZwY2lkLCB0
cnVuY2F0ZV9lYShtbXZhbHAtPnhtbVsxXSksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgeDg2ZW11bF9pbnZwY2lkX2F1eChtbXZhbHAtPnhtbVswXSwgZHN0LnZhbCksCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY3R4dCkpICE9IFg4NkVNVUxfT0tBWSApCisgICAgICAg
ICAgICBnb3RvIGRvbmU7CisKKyAgICAgICAgc3RhdGUtPnNpbWRfc2l6ZSA9IHNpbWRfbm9uZTsK
KyAgICAgICAgYnJlYWs7CisKICAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAw
eDgzKTogLyogdnBtdWx0aXNoaWZ0cWIgW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1te2t9ICov
CiAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZighZXZleC53LCBFWENfVUQpOwogICAgICAg
ICBob3N0X2FuZF92Y3B1X211c3RfaGF2ZShhdng1MTJfdmJtaSk7Ci0tLSBhL3hlbi9hcmNoL3g4
Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5oCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0
ZS94ODZfZW11bGF0ZS5oCkBAIC0xODgsOCArMTg4LDI2IEBAIGVudW0geDg2ZW11bF9jYWNoZV9v
cCB7CiBlbnVtIHg4NmVtdWxfdGxiX29wIHsKICAgICB4ODZlbXVsX2ludmxwZywKICAgICB4ODZl
bXVsX2ludmxwZ2EsCisgICAgeDg2ZW11bF9pbnZwY2lkLAogfTsKIAorc3RhdGljIGlubGluZSB1
bnNpZ25lZCBpbnQgeDg2ZW11bF9pbnZwY2lkX2F1eCh1bnNpZ25lZCBpbnQgcGNpZCwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHR5cGUp
Cit7CisgICAgQVNTRVJUKCEocGNpZCAmIH4weGZmZikpOworICAgIHJldHVybiAodHlwZSA8PCAx
MikgfCBwY2lkOworfQorCitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCB4ODZlbXVsX2ludnBj
aWRfcGNpZCh1bnNpZ25lZCBpbnQgYXV4KQoreworICAgIHJldHVybiBhdXggJiAweGZmZjsKK30K
Kworc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgeDg2ZW11bF9pbnZwY2lkX3R5cGUodW5zaWdu
ZWQgaW50IGF1eCkKK3sKKyAgICByZXR1cm4gYXV4ID4+IDEyOworfQorCiBzdHJ1Y3QgeDg2X2Vt
dWxhdGVfc3RhdGU7CiAKIC8qCkBAIC00ODMsNiArNTAxLDggQEAgc3RydWN0IHg4Nl9lbXVsYXRl
X29wcwogICAgICAqIEBhZGRyIGFuZCBAYXV4IGhhdmUgQG9wLXNwZWNpZmljIG1lYW5pbmc6CiAg
ICAgICogLSBJTlZMUEc6ICBAYXV4OkBhZGRyIHJlcHJlc2VudCBzZWc6b2Zmc2V0CiAgICAgICog
LSBJTlZMUEdBOiBAYWRkciBpcyB0aGUgbGluZWFyIGFkZHJlc3MsIEBhdXggdGhlIEFTSUQKKyAg
ICAgKiAtIElOVlBDSUQ6IEBhZGRyIGlzIHRoZSBsaW5lYXIgYWRkcmVzcywgQGF1eCB0aGUgY29t
YmluYXRpb24gb2YKKyAgICAgKiAgICAgICAgICAgIFBDSUQgYW5kIHR5cGUgKHNlZSB4ODZlbXVs
X2ludnBjaWRfKigpKS4KICAgICAgKi8KICAgICBpbnQgKCp0bGJfb3ApKAogICAgICAgICBlbnVt
IHg4NmVtdWxfdGxiX29wIG9wLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
