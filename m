Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409BDBE145
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:28:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9Ax-0006Dj-RS; Wed, 25 Sep 2019 15:25:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD9Aw-0006DR-3P
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:25:54 +0000
X-Inumbo-ID: c2e54a94-dfa8-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c2e54a94-dfa8-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 15:25:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9EAC6ACA5;
 Wed, 25 Sep 2019 15:25:52 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
Message-ID: <de5ed27d-c2d1-dd25-ba33-74aef9d0cef4@suse.com>
Date: Wed, 25 Sep 2019 17:25:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 4/5] x86/HVM: refuse CR3 loads with reserved
 (upper) bits set
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgYml0cyAxMSBhbmQgYmVsb3cgYXJlLCBpZiBub3QgdXNlZCBmb3Igb3RoZXIgcHVycG9z
ZXMsIHJlc2VydmVkCmJ1dCBpZ25vcmVkLCBiaXRzIGJleW9uZCBwaHlzaWNhbCBhZGRyZXNzIHdp
ZHRoIGFyZSBzdXBwb3NlZCB0byByYWlzZQpleGNlcHRpb25zIChhdCBsZWFzdCBpbiB0aGUgbm9u
LW5lc3RlZCBjYXNlOyBJJ20gbm90IGNvbnZpbmNlZCB0aGUKY3VycmVudCBuZXN0ZWQgU1ZNL1ZN
WCBiZWhhdmlvciBvZiByYWlzaW5nICNHUCgwKSBoZXJlIGlzIGNvcnJlY3QsIGJ1dAp0aGF0J3Mg
bm90IHRoZSBzdWJqZWN0IG9mIHRoaXMgY2hhbmdlKS4KCkludHJvZHVjZSBjdXJyZCBhcyBhIGxv
Y2FsIHZhcmlhYmxlLCBhbmQgcmVwbGFjZSBvdGhlciB2LT5kb21haW4KaW5zdGFuY2VzIGF0IHRo
ZSBzYW1lIHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
UmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0t
LQp2MzogQ29ycmVjdCByZXR1cm4gdmFsdWUgaW4gaHZtX2xvYWRfY3B1X2N0eHQoKS4gUmUtYmFz
ZS4KdjI6IFNpbXBsaWZ5IHRoZSBleHByZXNzaW9ucyB1c2VkIGZvciB0aGUgcmVzZXJ2ZWQgYml0
IGNoZWNrcy4KCi0tLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyB8ICAgMjQgKysrKysrKysrKysr
KysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKCi0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKKysrIGIveGVuL2FyY2gveDg2L2h2
bS9odm0uYwpAQCAtMTAxNiw2ICsxMDE2LDEzIEBAIHN0YXRpYyBpbnQgaHZtX2xvYWRfY3B1X2N0
eHQoc3RydWN0IGRvbWEKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgfQogCisgICAgaWYg
KCBjdHh0LmNyMyA+PiBkLT5hcmNoLmNwdWlkLT5leHRkLm1heHBoeXNhZGRyICkKKyAgICB7Cisg
ICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIgIkhWTSVkIHJlc3RvcmU6IGJhZCBDUjMgJSMiIFBS
SXg2NCAiXG4iLAorICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCBjdHh0LmNyMyk7CisgICAg
ICAgIHJldHVybiAtRUlOVkFMOworICAgIH0KKwogICAgIGlmICggKGN0eHQuZmxhZ3MgJiB+WEVO
X1g4Nl9GUFVfSU5JVElBTElTRUQpICE9IDAgKQogICAgIHsKICAgICAgICAgZ3ByaW50ayhYRU5M
T0dfRVJSLCAiYmFkIGZsYWdzIHZhbHVlIGluIENQVSBjb250ZXh0OiAlI3hcbiIsCkBAIC0yMzAz
LDEwICsyMzEwLDE4IEBAIGludCBodm1fc2V0X2NyMCh1bnNpZ25lZCBsb25nIHZhbHVlLCBib28K
IGludCBodm1fc2V0X2NyMyh1bnNpZ25lZCBsb25nIHZhbHVlLCBib29sIG5vZmx1c2gsIGJvb2wg
bWF5X2RlZmVyKQogewogICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsKKyAgICBzdHJ1Y3Qg
ZG9tYWluICpjdXJyZCA9IHYtPmRvbWFpbjsKICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOwog
ICAgIHVuc2lnbmVkIGxvbmcgb2xkID0gdi0+YXJjaC5odm0uZ3Vlc3RfY3JbM107CiAKLSAgICBp
ZiAoIG1heV9kZWZlciAmJiB1bmxpa2VseSh2LT5kb21haW4tPmFyY2gubW9uaXRvci53cml0ZV9j
dHJscmVnX2VuYWJsZWQgJgorICAgIGlmICggdmFsdWUgPj4gY3VycmQtPmFyY2guY3B1aWQtPmV4
dGQubWF4cGh5c2FkZHIgKQorICAgIHsKKyAgICAgICAgSFZNX0RCR19MT0coREJHX0xFVkVMXzEs
CisgICAgICAgICAgICAgICAgICAgICJBdHRlbXB0IHRvIHNldCByZXNlcnZlZCBDUjMgYml0KHMp
OiAlbHgiLCB2YWx1ZSk7CisgICAgICAgIHJldHVybiBYODZFTVVMX0VYQ0VQVElPTjsKKyAgICB9
CisKKyAgICBpZiAoIG1heV9kZWZlciAmJiB1bmxpa2VseShjdXJyZC0+YXJjaC5tb25pdG9yLndy
aXRlX2N0cmxyZWdfZW5hYmxlZCAmCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW9u
aXRvcl9jdHJscmVnX2JpdG1hc2soVk1fRVZFTlRfWDg2X0NSMykpICkKICAgICB7CiAgICAgICAg
IEFTU0VSVCh2LT5hcmNoLnZtX2V2ZW50KTsKQEAgLTIzMjIsMTMgKzIzMzcsMTIgQEAgaW50IGh2
bV9zZXRfY3IzKHVuc2lnbmVkIGxvbmcgdmFsdWUsIGJvbwogICAgICAgICB9CiAgICAgfQogCi0g
ICAgaWYgKCBodm1fcGFnaW5nX2VuYWJsZWQodikgJiYgIXBhZ2luZ19tb2RlX2hhcCh2LT5kb21h
aW4pICYmCisgICAgaWYgKCBodm1fcGFnaW5nX2VuYWJsZWQodikgJiYgIXBhZ2luZ19tb2RlX2hh
cChjdXJyZCkgJiYKICAgICAgICAgICgodmFsdWUgXiB2LT5hcmNoLmh2bS5ndWVzdF9jclszXSkg
Pj4gUEFHRV9TSElGVCkgKQogICAgIHsKICAgICAgICAgLyogU2hhZG93LW1vZGUgQ1IzIGNoYW5n
ZS4gQ2hlY2sgUERCUiBhbmQgdXBkYXRlIHJlZmNvdW50cy4gKi8KICAgICAgICAgSFZNX0RCR19M
T0coREJHX0xFVkVMX1ZNTVUsICJDUjMgdmFsdWUgPSAlbHgiLCB2YWx1ZSk7Ci0gICAgICAgIHBh
Z2UgPSBnZXRfcGFnZV9mcm9tX2dmbih2LT5kb21haW4sIHZhbHVlID4+IFBBR0VfU0hJRlQsCi0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLCBQMk1fQUxMT0MpOworICAgICAg
ICBwYWdlID0gZ2V0X3BhZ2VfZnJvbV9nZm4oY3VycmQsIHZhbHVlID4+IFBBR0VfU0hJRlQsIE5V
TEwsIFAyTV9BTExPQyk7CiAgICAgICAgIGlmICggIXBhZ2UgKQogICAgICAgICAgICAgZ290byBi
YWRfY3IzOwogCkBAIC0yMzQ0LDcgKzIzNTgsNyBAQCBpbnQgaHZtX3NldF9jcjModW5zaWduZWQg
bG9uZyB2YWx1ZSwgYm9vCiAKICBiYWRfY3IzOgogICAgIGdkcHJpbnRrKFhFTkxPR19FUlIsICJJ
bnZhbGlkIENSM1xuIik7Ci0gICAgZG9tYWluX2NyYXNoKHYtPmRvbWFpbik7CisgICAgZG9tYWlu
X2NyYXNoKGN1cnJkKTsKICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7CiB9CiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
