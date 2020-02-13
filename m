Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B8715BEC7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 13:56:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2E1F-0005zU-3m; Thu, 13 Feb 2020 12:55:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=06QY=4B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j2E1D-0005z4-Hi
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 12:54:59 +0000
X-Inumbo-ID: 073bcc06-4e60-11ea-b898-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 073bcc06-4e60-11ea-b898-12813bfff9fa;
 Thu, 13 Feb 2020 12:54:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D6DC6ABF6;
 Thu, 13 Feb 2020 12:54:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 13 Feb 2020 13:54:43 +0100
Message-Id: <20200213125449.14226-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200213125449.14226-1-jgross@suse.com>
References: <20200213125449.14226-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 2/8] xen: add using domlist_read_lock in
 keyhandlers
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNpbmcgZm9yX2VhY2hfZG9tYWluKCkgd2l0aCBvdXQgaG9sZGluZyB0aGUgZG9tbGlzdF9yZWFk
X2xvY2sgaXMKZnJhZ2lsZSwgc28gYWRkIHRoZSBsb2NrIGluIHRoZSBrZXloYW5kbGVycyBpdCBp
cyBtaXNzaW5nLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgICAgICAgfCA0ICsrKysKIHhlbi9hcmNo
L3g4Ni90aW1lLmMgICAgICAgICAgICAgfCA1ICsrKysrCiB4ZW4vY29tbW9uL2dyYW50X3RhYmxl
LmMgICAgICAgIHwgNyArKysrKysrCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jIHwg
NSArKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L21tL3AybS1lcHQuYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMKaW5k
ZXggZDRkZWZhMDFjMi4uZWIwZjBlZGZlZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL3Ay
bS1lcHQuYworKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jCkBAIC0xMjk3LDYgKzEyOTcs
OCBAQCBzdGF0aWMgdm9pZCBlcHRfZHVtcF9wMm1fdGFibGUodW5zaWduZWQgY2hhciBrZXkpCiAg
ICAgc3RydWN0IHAybV9kb21haW4gKnAybTsKICAgICBzdHJ1Y3QgZXB0X2RhdGEgKmVwdDsKIAor
ICAgIHJjdV9yZWFkX2xvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsKKwogICAgIGZvcl9lYWNoX2Rv
bWFpbihkKQogICAgIHsKICAgICAgICAgaWYgKCAhaGFwX2VuYWJsZWQoZCkgKQpAQCAtMTM0Nyw2
ICsxMzQ5LDggQEAgc3RhdGljIHZvaWQgZXB0X2R1bXBfcDJtX3RhYmxlKHVuc2lnbmVkIGNoYXIg
a2V5KQogICAgICAgICAgICAgdW5tYXBfZG9tYWluX3BhZ2UodGFibGUpOwogICAgICAgICB9CiAg
ICAgfQorCisgICAgcmN1X3JlYWRfdW5sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7CiB9CiAKIHZv
aWQgc2V0dXBfZXB0X2R1bXAodm9pZCkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90aW1lLmMg
Yi94ZW4vYXJjaC94ODYvdGltZS5jCmluZGV4IGNmM2U1MWZiNWUuLjUwOTY3OTIzNWQgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni90aW1lLmMKKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYwpAQCAt
MjQwMSw2ICsyNDAxLDkgQEAgc3RhdGljIHZvaWQgZHVtcF9zb2Z0dHNjKHVuc2lnbmVkIGNoYXIg
a2V5KQogICAgIH0gZWxzZQogICAgICAgICBwcmludGsoIlRTQyBub3QgbWFya2VkIGFzIGVpdGhl
ciBjb25zdGFudCBvciByZWxpYWJsZSwgIgogICAgICAgICAgICAgICAgIndhcnA9JWx1IChjb3Vu
dD0lbHUpXG4iLCB0c2NfbWF4X3dhcnAsIHRzY19jaGVja19jb3VudCk7CisKKyAgICByY3VfcmVh
ZF9sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7CisKICAgICBmb3JfZWFjaF9kb21haW4gKCBkICkK
ICAgICB7CiAgICAgICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICYmIGQtPmFyY2gudHNj
X21vZGUgPT0gVFNDX01PREVfREVGQVVMVCApCkBAIC0yNDE3LDYgKzI0MjAsOCBAQCBzdGF0aWMg
dm9pZCBkdW1wX3NvZnR0c2ModW5zaWduZWQgY2hhciBrZXkpCiAgICAgICAgIGRvbWNudCsrOwog
ICAgIH0KIAorICAgIHJjdV9yZWFkX3VubG9jaygmZG9tbGlzdF9yZWFkX2xvY2spOworCiAgICAg
aWYgKCAhZG9tY250ICkKICAgICAgICAgICAgIHByaW50aygiTm8gZG9tYWlucyBoYXZlIGVtdWxh
dGVkIFRTQ1xuIik7CiB9CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgYi94
ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKaW5kZXggMmVjZjM4ZGZiZS4uYzc5MzkyN2NkNiAxMDA2
NDQKLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCisrKyBiL3hlbi9jb21tb24vZ3JhbnRf
dGFibGUuYwpAQCAtNDEwNCw5ICs0MTA0LDE2IEBAIHN0YXRpYyB2b2lkIGdudHRhYl91c2FnZV9w
cmludChzdHJ1Y3QgZG9tYWluICpyZCkKIHN0YXRpYyB2b2lkIGdudHRhYl91c2FnZV9wcmludF9h
bGwodW5zaWduZWQgY2hhciBrZXkpCiB7CiAgICAgc3RydWN0IGRvbWFpbiAqZDsKKwogICAgIHBy
aW50aygiJXMgWyBrZXkgJyVjJyBwcmVzc2VkXG4iLCBfX2Z1bmNfXywga2V5KTsKKworICAgIHJj
dV9yZWFkX2xvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsKKwogICAgIGZvcl9lYWNoX2RvbWFpbiAo
IGQgKQogICAgICAgICBnbnR0YWJfdXNhZ2VfcHJpbnQoZCk7CisKKyAgICByY3VfcmVhZF91bmxv
Y2soJmRvbWxpc3RfcmVhZF9sb2NrKTsKKwogICAgIHByaW50aygiJXMgXSBkb25lXG4iLCBfX2Z1
bmNfXyk7CiB9CiAKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCmluZGV4IDlkNDIxZTA2ZGUuLmNhYjdh
MDY4YWEgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwpAQCAtNTkxLDYgKzU5MSw5IEBAIHN0YXRp
YyB2b2lkIGlvbW11X2R1bXBfcDJtX3RhYmxlKHVuc2lnbmVkIGNoYXIga2V5KQogICAgIH0KIAog
ICAgIG9wcyA9IGlvbW11X2dldF9vcHMoKTsKKworICAgIHJjdV9yZWFkX2xvY2soJmRvbWxpc3Rf
cmVhZF9sb2NrKTsKKwogICAgIGZvcl9lYWNoX2RvbWFpbihkKQogICAgIHsKICAgICAgICAgaWYg
KCBpc19oYXJkd2FyZV9kb21haW4oZCkgfHwgIWlzX2lvbW11X2VuYWJsZWQoZCkgKQpAQCAtNjA1
LDYgKzYwOCw4IEBAIHN0YXRpYyB2b2lkIGlvbW11X2R1bXBfcDJtX3RhYmxlKHVuc2lnbmVkIGNo
YXIga2V5KQogICAgICAgICBwcmludGsoIlxuZG9tYWluJWQgSU9NTVUgcDJtIHRhYmxlOiBcbiIs
IGQtPmRvbWFpbl9pZCk7CiAgICAgICAgIG9wcy0+ZHVtcF9wMm1fdGFibGUoZCk7CiAgICAgfQor
CisgICAgcmN1X3JlYWRfdW5sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7CiB9CiAKIC8qCi0tIAoy
LjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
