Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67D2AA1E0
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 13:43:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5q7Y-0001iS-NR; Thu, 05 Sep 2019 11:40:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5q7W-0001hn-DR
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 11:40:10 +0000
X-Inumbo-ID: e3dd1aed-cfd1-11e9-abc8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3dd1aed-cfd1-11e9-abc8-12813bfff9fa;
 Thu, 05 Sep 2019 11:39:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DD601AEE0;
 Thu,  5 Sep 2019 11:39:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  5 Sep 2019 13:39:53 +0200
Message-Id: <20190905113955.24870-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190905113955.24870-1-jgross@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v5 2/4] xen: move debugtrace coding to
 common/debugtrace.c
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5zdGVhZCBvZiBsaXZpbmcgaW4gZHJpdmVycy9jaGFyL2NvbnNvbGUuYyBtb3ZlIHRoZSBkZWJ1
Z3RyYWNlCnJlbGF0ZWQgY29kaW5nIHRvIGEgbmV3IGZpbGUgY29tbW9uL2RlYnVndHJhY2UuYwoK
Tm8gZnVuY3Rpb25hbCBjaGFuZ2UsIGNvZGUgbW92ZW1lbnQgb25seS4KClNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL01ha2VmaWxlICAgICAgICB8ICAgMSAr
CiB4ZW4vY29tbW9uL2RlYnVndHJhY2UuYyAgICB8IDE4MSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIHwgMTc5
ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNo
YW5nZWQsIDE4MyBpbnNlcnRpb25zKCspLCAxNzggZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAx
MDA2NDQgeGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL01h
a2VmaWxlIGIveGVuL2NvbW1vbi9NYWtlZmlsZQppbmRleCBlZGRkYTVkYWE2Li42MmIzNGU2OWU5
IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL01ha2VmaWxlCisrKyBiL3hlbi9jb21tb24vTWFrZWZp
bGUKQEAgLTQsNiArNCw3IEBAIG9iai15ICs9IGJzZWFyY2gubwogb2JqLSQoQ09ORklHX0NPUkVf
UEFSS0lORykgKz0gY29yZV9wYXJraW5nLm8KIG9iai15ICs9IGNwdS5vCiBvYmoteSArPSBjcHVw
b29sLm8KK29iai0kKENPTkZJR19ERUJVR19UUkFDRSkgKz0gZGVidWd0cmFjZS5vCiBvYmotJChD
T05GSUdfSEFTX0RFVklDRV9UUkVFKSArPSBkZXZpY2VfdHJlZS5vCiBvYmoteSArPSBkb21jdGwu
bwogb2JqLXkgKz0gZG9tYWluLm8KZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZGVidWd0cmFjZS5j
IGIveGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uYzFlZTNmNDViOQotLS0gL2Rldi9udWxsCisrKyBiL3hlbi9jb21tb24vZGVidWd0
cmFjZS5jCkBAIC0wLDAgKzEsMTgxIEBACisvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCisgKiBkZWJ1
Z3RyYWNlLmMKKyAqCisgKiBEZWJ1Z3RyYWNlIGZvciBYZW4KKyAqLworCisKKyNpbmNsdWRlIDx4
ZW4vY29uc29sZS5oPgorI2luY2x1ZGUgPHhlbi9pbml0Lmg+CisjaW5jbHVkZSA8eGVuL2tleWhh
bmRsZXIuaD4KKyNpbmNsdWRlIDx4ZW4vbGliLmg+CisjaW5jbHVkZSA8eGVuL21tLmg+CisjaW5j
bHVkZSA8eGVuL3NlcmlhbC5oPgorI2luY2x1ZGUgPHhlbi9zcGlubG9jay5oPgorI2luY2x1ZGUg
PHhlbi93YXRjaGRvZy5oPgorCisjZGVmaW5lIERFQlVHX1RSQUNFX0VOVFJZX1NJWkUgICAxMDI0
CisKKy8qIFNlbmQgb3V0cHV0IGRpcmVjdCB0byBjb25zb2xlLCBvciBidWZmZXIgaXQ/ICovCitz
dGF0aWMgdm9sYXRpbGUgaW50IGRlYnVndHJhY2Vfc2VuZF90b19jb25zb2xlOworCitzdGF0aWMg
Y2hhciAgICAgICAgKmRlYnVndHJhY2VfYnVmOyAvKiBEZWJ1Zy10cmFjZSBidWZmZXIgKi8KK3N0
YXRpYyB1bnNpZ25lZCBpbnQgZGVidWd0cmFjZV9wcmQ7IC8qIFByb2R1Y2VyIGluZGV4ICAgICAq
Lworc3RhdGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX2tpbG9ieXRlcyA9IDEyOCwgZGVidWd0
cmFjZV9ieXRlczsKK3N0YXRpYyB1bnNpZ25lZCBpbnQgZGVidWd0cmFjZV91c2VkOworc3RhdGlj
IGNoYXIgZGVidWd0cmFjZV9sYXN0X2VudHJ5X2J1ZltERUJVR19UUkFDRV9FTlRSWV9TSVpFXTsK
K3N0YXRpYyBERUZJTkVfU1BJTkxPQ0soZGVidWd0cmFjZV9sb2NrKTsKK2ludGVnZXJfcGFyYW0o
ImRlYnVndHJhY2UiLCBkZWJ1Z3RyYWNlX2tpbG9ieXRlcyk7CisKK3N0YXRpYyB2b2lkIGRlYnVn
dHJhY2VfZHVtcF93b3JrZXIodm9pZCkKK3sKKyAgICBpZiAoIChkZWJ1Z3RyYWNlX2J5dGVzID09
IDApIHx8ICFkZWJ1Z3RyYWNlX3VzZWQgKQorICAgICAgICByZXR1cm47CisKKyAgICBwcmludGso
ImRlYnVndHJhY2VfZHVtcCgpIHN0YXJ0aW5nXG4iKTsKKworICAgIC8qIFByaW50IG9sZGVzdCBw
b3J0aW9uIG9mIHRoZSByaW5nLiAqLworICAgIGlmICggZGVidWd0cmFjZV9idWZbZGVidWd0cmFj
ZV9wcmRdICE9ICdcMCcgKQorICAgICAgICBjb25zb2xlX3NlcmlhbF9wdXRzKCZkZWJ1Z3RyYWNl
X2J1ZltkZWJ1Z3RyYWNlX3ByZF0sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGVidWd0
cmFjZV9ieXRlcyAtIGRlYnVndHJhY2VfcHJkKTsKKworICAgIC8qIFByaW50IHlvdW5nZXN0IHBv
cnRpb24gb2YgdGhlIHJpbmcuICovCisgICAgZGVidWd0cmFjZV9idWZbZGVidWd0cmFjZV9wcmRd
ID0gJ1wwJzsKKyAgICBjb25zb2xlX3NlcmlhbF9wdXRzKCZkZWJ1Z3RyYWNlX2J1ZlswXSwgZGVi
dWd0cmFjZV9wcmQpOworCisgICAgbWVtc2V0KGRlYnVndHJhY2VfYnVmLCAnXDAnLCBkZWJ1Z3Ry
YWNlX2J5dGVzKTsKKyAgICBkZWJ1Z3RyYWNlX3ByZCA9IDA7CisgICAgZGVidWd0cmFjZV9sYXN0
X2VudHJ5X2J1ZlswXSA9IDA7CisKKyAgICBwcmludGsoImRlYnVndHJhY2VfZHVtcCgpIGZpbmlz
aGVkXG4iKTsKK30KKworc3RhdGljIHZvaWQgZGVidWd0cmFjZV90b2dnbGUodm9pZCkKK3sKKyAg
ICB1bnNpZ25lZCBsb25nIGZsYWdzOworCisgICAgd2F0Y2hkb2dfZGlzYWJsZSgpOworICAgIHNw
aW5fbG9ja19pcnFzYXZlKCZkZWJ1Z3RyYWNlX2xvY2ssIGZsYWdzKTsKKworICAgIC8qCisgICAg
ICogRHVtcCB0aGUgYnVmZmVyICpiZWZvcmUqIHRvZ2dsaW5nLCBpbiBjYXNlIHRoZSBhY3Qgb2Yg
ZHVtcGluZyB0aGUKKyAgICAgKiBidWZmZXIgaXRzZWxmIGNhdXNlcyBtb3JlIHByaW50aygpIGlu
dm9jYXRpb25zLgorICAgICAqLworICAgIHByaW50aygiZGVidWd0cmFjZV9wcmludGsgbm93IHdy
aXRpbmcgdG8gJXMuXG4iLAorICAgICAgICAgICAhZGVidWd0cmFjZV9zZW5kX3RvX2NvbnNvbGUg
PyAiY29uc29sZSI6ICJidWZmZXIiKTsKKyAgICBpZiAoICFkZWJ1Z3RyYWNlX3NlbmRfdG9fY29u
c29sZSApCisgICAgICAgIGRlYnVndHJhY2VfZHVtcF93b3JrZXIoKTsKKworICAgIGRlYnVndHJh
Y2Vfc2VuZF90b19jb25zb2xlID0gIWRlYnVndHJhY2Vfc2VuZF90b19jb25zb2xlOworCisgICAg
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGVidWd0cmFjZV9sb2NrLCBmbGFncyk7CisgICAgd2F0
Y2hkb2dfZW5hYmxlKCk7CisKK30KKwordm9pZCBkZWJ1Z3RyYWNlX2R1bXAodm9pZCkKK3sKKyAg
ICB1bnNpZ25lZCBsb25nIGZsYWdzOworCisgICAgd2F0Y2hkb2dfZGlzYWJsZSgpOworICAgIHNw
aW5fbG9ja19pcnFzYXZlKCZkZWJ1Z3RyYWNlX2xvY2ssIGZsYWdzKTsKKworICAgIGRlYnVndHJh
Y2VfZHVtcF93b3JrZXIoKTsKKworICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRlYnVndHJh
Y2VfbG9jaywgZmxhZ3MpOworICAgIHdhdGNoZG9nX2VuYWJsZSgpOworfQorCitzdGF0aWMgdm9p
ZCBkZWJ1Z3RyYWNlX2FkZF90b19idWYoY2hhciAqYnVmKQoreworICAgIGNoYXIgKnA7CisKKyAg
ICBmb3IgKCBwID0gYnVmOyAqcCAhPSAnXDAnOyBwKysgKQorICAgIHsKKyAgICAgICAgZGVidWd0
cmFjZV9idWZbZGVidWd0cmFjZV9wcmQrK10gPSAqcDsKKyAgICAgICAgaWYgKCBkZWJ1Z3RyYWNl
X3ByZCA9PSBkZWJ1Z3RyYWNlX2J5dGVzICkKKyAgICAgICAgICAgIGRlYnVndHJhY2VfcHJkID0g
MDsKKyAgICB9Cit9CisKK3ZvaWQgZGVidWd0cmFjZV9wcmludGsoY29uc3QgY2hhciAqZm10LCAu
Li4pCit7CisgICAgc3RhdGljIGNoYXIgYnVmW0RFQlVHX1RSQUNFX0VOVFJZX1NJWkVdOworICAg
IHN0YXRpYyB1bnNpZ25lZCBpbnQgY291bnQsIGxhc3RfY291bnQsIGxhc3RfcHJkOworCisgICAg
Y2hhciAgICAgICAgICBjbnRidWZbMjRdOworICAgIHZhX2xpc3QgICAgICAgYXJnczsKKyAgICB1
bnNpZ25lZCBsb25nIGZsYWdzOworICAgIHVuc2lnbmVkIGludCBucjsKKworICAgIGlmICggZGVi
dWd0cmFjZV9ieXRlcyA9PSAwICkKKyAgICAgICAgcmV0dXJuOworCisgICAgZGVidWd0cmFjZV91
c2VkID0gMTsKKworICAgIHNwaW5fbG9ja19pcnFzYXZlKCZkZWJ1Z3RyYWNlX2xvY2ssIGZsYWdz
KTsKKworICAgIHZhX3N0YXJ0KGFyZ3MsIGZtdCk7CisgICAgbnIgPSB2c25wcmludGYoYnVmLCBz
aXplb2YoYnVmKSwgZm10LCBhcmdzKTsKKyAgICB2YV9lbmQoYXJncyk7CisKKyAgICBpZiAoIGRl
YnVndHJhY2Vfc2VuZF90b19jb25zb2xlICkKKyAgICB7CisgICAgICAgIHVuc2lnbmVkIGludCBu
ID0gc2NucHJpbnRmKGNudGJ1Ziwgc2l6ZW9mKGNudGJ1ZiksICIldSAiLCArK2NvdW50KTsKKwor
ICAgICAgICBjb25zb2xlX3NlcmlhbF9wdXRzKGNudGJ1Ziwgbik7CisgICAgICAgIGNvbnNvbGVf
c2VyaWFsX3B1dHMoYnVmLCBucik7CisgICAgfQorICAgIGVsc2UKKyAgICB7CisgICAgICAgIGlm
ICggc3RyY21wKGJ1ZiwgZGVidWd0cmFjZV9sYXN0X2VudHJ5X2J1ZikgKQorICAgICAgICB7Cisg
ICAgICAgICAgICBsYXN0X3ByZCA9IGRlYnVndHJhY2VfcHJkOworICAgICAgICAgICAgbGFzdF9j
b3VudCA9ICsrY291bnQ7CisgICAgICAgICAgICBzYWZlX3N0cmNweShkZWJ1Z3RyYWNlX2xhc3Rf
ZW50cnlfYnVmLCBidWYpOworICAgICAgICAgICAgc25wcmludGYoY250YnVmLCBzaXplb2YoY250
YnVmKSwgIiV1ICIsIGNvdW50KTsKKyAgICAgICAgfQorICAgICAgICBlbHNlCisgICAgICAgIHsK
KyAgICAgICAgICAgIGRlYnVndHJhY2VfcHJkID0gbGFzdF9wcmQ7CisgICAgICAgICAgICBzbnBy
aW50ZihjbnRidWYsIHNpemVvZihjbnRidWYpLCAiJXUtJXUgIiwgbGFzdF9jb3VudCwgKytjb3Vu
dCk7CisgICAgICAgIH0KKyAgICAgICAgZGVidWd0cmFjZV9hZGRfdG9fYnVmKGNudGJ1Zik7Cisg
ICAgICAgIGRlYnVndHJhY2VfYWRkX3RvX2J1ZihidWYpOworICAgIH0KKworICAgIHNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJmRlYnVndHJhY2VfbG9jaywgZmxhZ3MpOworfQorCitzdGF0aWMgdm9p
ZCBkZWJ1Z3RyYWNlX2tleSh1bnNpZ25lZCBjaGFyIGtleSkKK3sKKyAgICBkZWJ1Z3RyYWNlX3Rv
Z2dsZSgpOworfQorCitzdGF0aWMgaW50IF9faW5pdCBkZWJ1Z3RyYWNlX2luaXQodm9pZCkKK3sK
KyAgICBpbnQgb3JkZXI7CisgICAgdW5zaWduZWQgaW50IGtieXRlcywgYnl0ZXM7CisKKyAgICAv
KiBSb3VuZCBzaXplIGRvd24gdG8gbmV4dCBwb3dlciBvZiB0d28uICovCisgICAgd2hpbGUgKCAo
a2J5dGVzID0gKGRlYnVndHJhY2Vfa2lsb2J5dGVzICYgKGRlYnVndHJhY2Vfa2lsb2J5dGVzLTEp
KSkgIT0gMCApCisgICAgICAgIGRlYnVndHJhY2Vfa2lsb2J5dGVzID0ga2J5dGVzOworCisgICAg
Ynl0ZXMgPSBkZWJ1Z3RyYWNlX2tpbG9ieXRlcyA8PCAxMDsKKyAgICBpZiAoIGJ5dGVzID09IDAg
KQorICAgICAgICByZXR1cm4gMDsKKworICAgIG9yZGVyID0gZ2V0X29yZGVyX2Zyb21fYnl0ZXMo
Ynl0ZXMpOworICAgIGRlYnVndHJhY2VfYnVmID0gYWxsb2NfeGVuaGVhcF9wYWdlcyhvcmRlciwg
MCk7CisgICAgQVNTRVJUKGRlYnVndHJhY2VfYnVmICE9IE5VTEwpOworCisgICAgbWVtc2V0KGRl
YnVndHJhY2VfYnVmLCAnXDAnLCBieXRlcyk7CisKKyAgICBkZWJ1Z3RyYWNlX2J5dGVzID0gYnl0
ZXM7CisKKyAgICByZWdpc3Rlcl9rZXloYW5kbGVyKCdUJywgZGVidWd0cmFjZV9rZXksCisgICAg
ICAgICAgICAgICAgICAgICAgICAidG9nZ2xlIGRlYnVndHJhY2UgdG8gY29uc29sZS9idWZmZXIi
LCAwKTsKKworICAgIHJldHVybiAwOworfQorX19pbml0Y2FsbChkZWJ1Z3RyYWNlX2luaXQpOwpk
aWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMgYi94ZW4vZHJpdmVycy9jaGFy
L2NvbnNvbGUuYwppbmRleCA4ZGY2MjdjODRhLi43ZjI5MTkwZWFmIDEwMDY0NAotLS0gYS94ZW4v
ZHJpdmVycy9jaGFyL2NvbnNvbGUuYworKysgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwpA
QCAtMTE2MCwxODQgKzExNjAsNyBAQCBpbnQgcHJpbnRrX3JhdGVsaW1pdCh2b2lkKQogCiAvKgog
ICogKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioKLSAqICoqKioqKioqKioqKioqKiBTZXJpYWwgY29uc29sZSByaW5nIGJ1ZmZlciAq
KioqKioqKioqKioqKioqKioqCi0gKiAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKgotICovCi0KLSNpZmRlZiBDT05GSUdfREVCVUdf
VFJBQ0UKLQotI2RlZmluZSBERUJVR19UUkFDRV9FTlRSWV9TSVpFICAgMTAyNAotCi0vKiBTZW5k
IG91dHB1dCBkaXJlY3QgdG8gY29uc29sZSwgb3IgYnVmZmVyIGl0PyAqLwotc3RhdGljIHZvbGF0
aWxlIGludCBkZWJ1Z3RyYWNlX3NlbmRfdG9fY29uc29sZTsKLQotc3RhdGljIGNoYXIgICAgICAg
ICpkZWJ1Z3RyYWNlX2J1ZjsgLyogRGVidWctdHJhY2UgYnVmZmVyICovCi1zdGF0aWMgdW5zaWdu
ZWQgaW50IGRlYnVndHJhY2VfcHJkOyAvKiBQcm9kdWNlciBpbmRleCAgICAgKi8KLXN0YXRpYyB1
bnNpZ25lZCBpbnQgZGVidWd0cmFjZV9raWxvYnl0ZXMgPSAxMjgsIGRlYnVndHJhY2VfYnl0ZXM7
Ci1zdGF0aWMgdW5zaWduZWQgaW50IGRlYnVndHJhY2VfdXNlZDsKLXN0YXRpYyBjaGFyIGRlYnVn
dHJhY2VfbGFzdF9lbnRyeV9idWZbREVCVUdfVFJBQ0VfRU5UUllfU0laRV07Ci1zdGF0aWMgREVG
SU5FX1NQSU5MT0NLKGRlYnVndHJhY2VfbG9jayk7Ci1pbnRlZ2VyX3BhcmFtKCJkZWJ1Z3RyYWNl
IiwgZGVidWd0cmFjZV9raWxvYnl0ZXMpOwotCi1zdGF0aWMgdm9pZCBkZWJ1Z3RyYWNlX2R1bXBf
d29ya2VyKHZvaWQpCi17Ci0gICAgaWYgKCAoZGVidWd0cmFjZV9ieXRlcyA9PSAwKSB8fCAhZGVi
dWd0cmFjZV91c2VkICkKLSAgICAgICAgcmV0dXJuOwotCi0gICAgcHJpbnRrKCJkZWJ1Z3RyYWNl
X2R1bXAoKSBzdGFydGluZ1xuIik7Ci0KLSAgICAvKiBQcmludCBvbGRlc3QgcG9ydGlvbiBvZiB0
aGUgcmluZy4gKi8KLSAgICBpZiAoIGRlYnVndHJhY2VfYnVmW2RlYnVndHJhY2VfcHJkXSAhPSAn
XDAnICkKLSAgICAgICAgY29uc29sZV9zZXJpYWxfcHV0cygmZGVidWd0cmFjZV9idWZbZGVidWd0
cmFjZV9wcmRdLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlYnVndHJhY2VfYnl0ZXMg
LSBkZWJ1Z3RyYWNlX3ByZCk7Ci0KLSAgICAvKiBQcmludCB5b3VuZ2VzdCBwb3J0aW9uIG9mIHRo
ZSByaW5nLiAqLwotICAgIGRlYnVndHJhY2VfYnVmW2RlYnVndHJhY2VfcHJkXSA9ICdcMCc7Ci0g
ICAgY29uc29sZV9zZXJpYWxfcHV0cygmZGVidWd0cmFjZV9idWZbMF0sIGRlYnVndHJhY2VfcHJk
KTsKLQotICAgIG1lbXNldChkZWJ1Z3RyYWNlX2J1ZiwgJ1wwJywgZGVidWd0cmFjZV9ieXRlcyk7
Ci0gICAgZGVidWd0cmFjZV9wcmQgPSAwOwotICAgIGRlYnVndHJhY2VfbGFzdF9lbnRyeV9idWZb
MF0gPSAwOwotCi0gICAgcHJpbnRrKCJkZWJ1Z3RyYWNlX2R1bXAoKSBmaW5pc2hlZFxuIik7Ci19
Ci0KLXN0YXRpYyB2b2lkIGRlYnVndHJhY2VfdG9nZ2xlKHZvaWQpCi17Ci0gICAgdW5zaWduZWQg
bG9uZyBmbGFnczsKLQotICAgIHdhdGNoZG9nX2Rpc2FibGUoKTsKLSAgICBzcGluX2xvY2tfaXJx
c2F2ZSgmZGVidWd0cmFjZV9sb2NrLCBmbGFncyk7Ci0KLSAgICAvKgotICAgICAqIER1bXAgdGhl
IGJ1ZmZlciAqYmVmb3JlKiB0b2dnbGluZywgaW4gY2FzZSB0aGUgYWN0IG9mIGR1bXBpbmcgdGhl
Ci0gICAgICogYnVmZmVyIGl0c2VsZiBjYXVzZXMgbW9yZSBwcmludGsoKSBpbnZvY2F0aW9ucy4K
LSAgICAgKi8KLSAgICBwcmludGsoImRlYnVndHJhY2VfcHJpbnRrIG5vdyB3cml0aW5nIHRvICVz
LlxuIiwKLSAgICAgICAgICAgIWRlYnVndHJhY2Vfc2VuZF90b19jb25zb2xlID8gImNvbnNvbGUi
OiAiYnVmZmVyIik7Ci0gICAgaWYgKCAhZGVidWd0cmFjZV9zZW5kX3RvX2NvbnNvbGUgKQotICAg
ICAgICBkZWJ1Z3RyYWNlX2R1bXBfd29ya2VyKCk7Ci0KLSAgICBkZWJ1Z3RyYWNlX3NlbmRfdG9f
Y29uc29sZSA9ICFkZWJ1Z3RyYWNlX3NlbmRfdG9fY29uc29sZTsKLQotICAgIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJmRlYnVndHJhY2VfbG9jaywgZmxhZ3MpOwotICAgIHdhdGNoZG9nX2VuYWJs
ZSgpOwotCi19Ci0KLXZvaWQgZGVidWd0cmFjZV9kdW1wKHZvaWQpCi17Ci0gICAgdW5zaWduZWQg
bG9uZyBmbGFnczsKLQotICAgIHdhdGNoZG9nX2Rpc2FibGUoKTsKLSAgICBzcGluX2xvY2tfaXJx
c2F2ZSgmZGVidWd0cmFjZV9sb2NrLCBmbGFncyk7Ci0KLSAgICBkZWJ1Z3RyYWNlX2R1bXBfd29y
a2VyKCk7Ci0KLSAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkZWJ1Z3RyYWNlX2xvY2ssIGZs
YWdzKTsKLSAgICB3YXRjaGRvZ19lbmFibGUoKTsKLX0KLQotc3RhdGljIHZvaWQgZGVidWd0cmFj
ZV9hZGRfdG9fYnVmKGNoYXIgKmJ1ZikKLXsKLSAgICBjaGFyICpwOwotCi0gICAgZm9yICggcCA9
IGJ1ZjsgKnAgIT0gJ1wwJzsgcCsrICkKLSAgICB7Ci0gICAgICAgIGRlYnVndHJhY2VfYnVmW2Rl
YnVndHJhY2VfcHJkKytdID0gKnA7Ci0gICAgICAgIGlmICggZGVidWd0cmFjZV9wcmQgPT0gZGVi
dWd0cmFjZV9ieXRlcyApCi0gICAgICAgICAgICBkZWJ1Z3RyYWNlX3ByZCA9IDA7Ci0gICAgfQot
fQotCi12b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQotewotICAg
IHN0YXRpYyBjaGFyIGJ1ZltERUJVR19UUkFDRV9FTlRSWV9TSVpFXTsKLSAgICBzdGF0aWMgdW5z
aWduZWQgaW50IGNvdW50LCBsYXN0X2NvdW50LCBsYXN0X3ByZDsKLQotICAgIGNoYXIgICAgICAg
ICAgY250YnVmWzI0XTsKLSAgICB2YV9saXN0ICAgICAgIGFyZ3M7Ci0gICAgdW5zaWduZWQgbG9u
ZyBmbGFnczsKLSAgICB1bnNpZ25lZCBpbnQgbnI7Ci0KLSAgICBpZiAoIGRlYnVndHJhY2VfYnl0
ZXMgPT0gMCApCi0gICAgICAgIHJldHVybjsKLQotICAgIGRlYnVndHJhY2VfdXNlZCA9IDE7Ci0K
LSAgICBzcGluX2xvY2tfaXJxc2F2ZSgmZGVidWd0cmFjZV9sb2NrLCBmbGFncyk7Ci0KLSAgICB2
YV9zdGFydChhcmdzLCBmbXQpOwotICAgIG5yID0gdnNjbnByaW50ZihidWYsIHNpemVvZihidWYp
LCBmbXQsIGFyZ3MpOwotICAgIHZhX2VuZChhcmdzKTsKLQotICAgIGlmICggZGVidWd0cmFjZV9z
ZW5kX3RvX2NvbnNvbGUgKQotICAgIHsKLSAgICAgICAgdW5zaWduZWQgaW50IG4gPSBzY25wcmlu
dGYoY250YnVmLCBzaXplb2YoY250YnVmKSwgIiV1ICIsICsrY291bnQpOwotCi0gICAgICAgIGNv
bnNvbGVfc2VyaWFsX3B1dHMoY250YnVmLCBuKTsKLSAgICAgICAgY29uc29sZV9zZXJpYWxfcHV0
cyhidWYsIG5yKTsKLSAgICB9Ci0gICAgZWxzZQotICAgIHsKLSAgICAgICAgaWYgKCBzdHJjbXAo
YnVmLCBkZWJ1Z3RyYWNlX2xhc3RfZW50cnlfYnVmKSApCi0gICAgICAgIHsKLSAgICAgICAgICAg
IGxhc3RfcHJkID0gZGVidWd0cmFjZV9wcmQ7Ci0gICAgICAgICAgICBsYXN0X2NvdW50ID0gKytj
b3VudDsKLSAgICAgICAgICAgIHNhZmVfc3RyY3B5KGRlYnVndHJhY2VfbGFzdF9lbnRyeV9idWYs
IGJ1Zik7Ci0gICAgICAgICAgICBzbnByaW50ZihjbnRidWYsIHNpemVvZihjbnRidWYpLCAiJXUg
IiwgY291bnQpOwotICAgICAgICB9Ci0gICAgICAgIGVsc2UKLSAgICAgICAgewotICAgICAgICAg
ICAgZGVidWd0cmFjZV9wcmQgPSBsYXN0X3ByZDsKLSAgICAgICAgICAgIHNucHJpbnRmKGNudGJ1
Ziwgc2l6ZW9mKGNudGJ1ZiksICIldS0ldSAiLCBsYXN0X2NvdW50LCArK2NvdW50KTsKLSAgICAg
ICAgfQotICAgICAgICBkZWJ1Z3RyYWNlX2FkZF90b19idWYoY250YnVmKTsKLSAgICAgICAgZGVi
dWd0cmFjZV9hZGRfdG9fYnVmKGJ1Zik7Ci0gICAgfQotCi0gICAgc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmZGVidWd0cmFjZV9sb2NrLCBmbGFncyk7Ci19Ci0KLXN0YXRpYyB2b2lkIGRlYnVndHJh
Y2Vfa2V5KHVuc2lnbmVkIGNoYXIga2V5KQotewotICAgIGRlYnVndHJhY2VfdG9nZ2xlKCk7Ci19
Ci0KLXN0YXRpYyBpbnQgX19pbml0IGRlYnVndHJhY2VfaW5pdCh2b2lkKQotewotICAgIGludCBv
cmRlcjsKLSAgICB1bnNpZ25lZCBpbnQga2J5dGVzLCBieXRlczsKLQotICAgIC8qIFJvdW5kIHNp
emUgZG93biB0byBuZXh0IHBvd2VyIG9mIHR3by4gKi8KLSAgICB3aGlsZSAoIChrYnl0ZXMgPSAo
ZGVidWd0cmFjZV9raWxvYnl0ZXMgJiAoZGVidWd0cmFjZV9raWxvYnl0ZXMtMSkpKSAhPSAwICkK
LSAgICAgICAgZGVidWd0cmFjZV9raWxvYnl0ZXMgPSBrYnl0ZXM7Ci0KLSAgICBieXRlcyA9IGRl
YnVndHJhY2Vfa2lsb2J5dGVzIDw8IDEwOwotICAgIGlmICggYnl0ZXMgPT0gMCApCi0gICAgICAg
IHJldHVybiAwOwotCi0gICAgb3JkZXIgPSBnZXRfb3JkZXJfZnJvbV9ieXRlcyhieXRlcyk7Ci0g
ICAgZGVidWd0cmFjZV9idWYgPSBhbGxvY194ZW5oZWFwX3BhZ2VzKG9yZGVyLCAwKTsKLSAgICBB
U1NFUlQoZGVidWd0cmFjZV9idWYgIT0gTlVMTCk7Ci0KLSAgICBtZW1zZXQoZGVidWd0cmFjZV9i
dWYsICdcMCcsIGJ5dGVzKTsKLQotICAgIGRlYnVndHJhY2VfYnl0ZXMgPSBieXRlczsKLQotICAg
IHJlZ2lzdGVyX2tleWhhbmRsZXIoJ1QnLCBkZWJ1Z3RyYWNlX2tleSwKLSAgICAgICAgICAgICAg
ICAgICAgICAgICJ0b2dnbGUgZGVidWd0cmFjZSB0byBjb25zb2xlL2J1ZmZlciIsIDApOwotCi0g
ICAgcmV0dXJuIDA7Ci19Ci1fX2luaXRjYWxsKGRlYnVndHJhY2VfaW5pdCk7Ci0KLSNlbmRpZiAv
KiAhQ09ORklHX0RFQlVHX1RSQUNFICovCi0KLQotLyoKLSAqICoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCi0gKiAqKioqKioqKioq
KioqKiogRGVidWdnaW5nL3RyYWNpbmcvZXJyb3ItcmVwb3J0ICoqKioqKioqKioqKioqKgorICog
KioqKioqKioqKioqKioqKioqKioqKiBFcnJvci1yZXBvcnQgKioqKioqKioqKioqKioqKioqKioq
KioqKioKICAqICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqCiAgKi8KIAotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
