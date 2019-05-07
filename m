Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7801B16676
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 17:17:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO1oH-0007J6-TF; Tue, 07 May 2019 15:15:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO1oG-0007Iw-E6
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 15:15:12 +0000
X-Inumbo-ID: e805881c-70da-11e9-9441-83a19205013c
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e805881c-70da-11e9-9441-83a19205013c;
 Tue, 07 May 2019 15:15:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3949374;
 Tue,  7 May 2019 08:15:10 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00DE63F5AF;
 Tue,  7 May 2019 08:15:07 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  7 May 2019 16:14:44 +0100
Message-Id: <20190507151458.29350-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH 00/14] xen/arm: Properly disable M2P on Arm.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Gang Wei <gang.wei@intel.com>, oleksandr_tyshchenko@epam.com,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>,
 andrii_anisov@epam.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKQXJtIG5ldmVyIHN1cHBvcnRlZCBhIE0yUCB5ZXQgdGhlcmUgYXJlIHNvbWUgaGVs
cGVycyBpbXBsZW1lbnRlZCB0byBkZWFsIHdpdGgKdGhlIGNvbW1vbiBjb2RlLiBIb3dldmVyLCB0
aGUgaW1wbGVtZW50YXRpb24gb2YgbWZuX3RvX2dtZm4gaXMgY29tcGxldGVseQpib2d1cy4KClRo
aXMgc2VyaWVzIGFpbXMgdG8gcHJvcGVybHkgZGlzYWJsZSB0aGUgTTJQIG9uIEFybS4gU2VlIHBh
dGNoICM4IGZvciB0aGUKcmF0aW9uYWxlIHJlZ2FyZGluZyB0aGUgbGFjayBvZiBNMlAgb24gQXJt
LgoKV2hpbGUgbG9va2luZyBhdCB0aGUgY29kZSwgSSBhbHNvIGNvbnRpbnVlZCB0byBjb252ZXJ0
IHNvbWUgY29kZSB0byB1c2UKdHlwZXNhZmUgTUZOL0dGTi4KCkNoZWVycywKCkp1bGllbiBHcmFs
bCAoMTQpOgogIHhlbi9hcm06IFVzZSBtZm5fdG9fcGR4IGluc3RlYWQgb2YgcGZuX3RvX3BkeCB3
aGVuIHBvc3NpYmxlCiAgeGVuL3g4NjogQ29uc3RpZnkgdGhlIHBhcmFtZXRlciAiZCIgaW4gbWZu
X3RvX2dmbgogIHhlbi94ODY6IE1ha2UgbWZuX3RvX2dmbiB0eXBlc2FmZQogIHhlbi94ODY6IFVz
ZSBtZm5fdG9fZ2ZuIHJhdGhlciB0aGFuIG1mbl90b19nbWZuCiAgeGVuL2dyYW50LXRhYmxlOiBN
YWtlIGFyY2ggc3BlY2lmaWMgbWFjcm9zIHR5cGVzYWZlCiAgeGVuOiBDb252ZXJ0IGhvdHBsdWcg
cGFnZSBmdW5jdGlvbiB0byB1c2UgdHlwZXNhZmUgTUZOCiAgeGVuOiBDb252ZXJ0IGlzX3hlbl9m
aXhlZF9tZm4gdG8gdXNlIHR5cGVzYWZlIE1GTgogIHhlbjogQ29udmVydCBpc194ZW5faGVhcF9t
Zm4gdG8gdXNlIHR5cGVzYWZlIE1GTgogIHhlbjogSW50cm9kdWNlIEhBU19NMlAgY29uZmlnIGFu
ZCB1c2UgdG8gcHJvdGVjdCBtZm5fdG9fZ21mbiBjYWxsCiAgeGVuOiBSZW1vdmUgbWZuX3RvX2dt
Zm4gbWFjcm8KICB4ZW4veDg2OiBtbTogUmUtaW1wbGVtZW50IHNldF9ncGZuX2Zyb21fbWZuKCkg
YXMgYSBzdGF0aWMgaW5saW5lCiAgICBmdW5jdGlvbgogIHhlbi94ODY6IHB2OiBDb252ZXJ0IHVw
ZGF0ZV9pbnRwdGUoKSB0byB1c2UgdHlwZXNhZmUgTUZOCiAgeGVuL21tOiBDb252ZXJ0IHtzLCBn
fWV0X2dwZm5fZnJvbV9tZm4oKSB0byB1c2UgdHlwZXNhZmUgTUZOCiAgeGVuL21tOiBQcm92aWRl
IGR1bW15IE0yUC1yZWxhdGVkIGhlbHBlcnMgd2hlbiAhQ09ORklHX0hBVkVfTTJQCgogeGVuL2Fy
Y2gvYXJtL21tLmMgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9LY29u
ZmlnICAgICAgICAgICAgICAgIHwgICAxICsKIHhlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jYWN0
aW9uLmMgIHwgIDIwICsrKystLS0KIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAgICAg
IHwgIDM0ICsrKysrKy0tLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICAgICAgICAgICB8
IDExNSArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9t
bS9tZW1fc2hhcmluZy5jICAgICAgIHwgIDE5ICsrKy0tLQogeGVuL2FyY2gveDg2L21tL3AybS1w
b2QuYyAgICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYyAgICAgICAg
ICAgIHwgIDM3ICsrKysrKy0tLS0tLQogeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICAgICAg
ICAgfCAgNzAgKysrKysrKysrKystLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L21tL3BhZ2luZy5j
ICAgICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMgICAg
IHwgIDMxICsrKysrKy0tLS0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvbXVsdGkuYyAgICAgIHwg
ICA2ICstCiB4ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jICAgICAgICB8ICAgNiArLQogeGVu
L2FyY2gveDg2L3B2L2VtdWwtcHJpdi1vcC5jICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9w
di9ncmFudF90YWJsZS5jICAgICAgIHwgICA2ICstCiB4ZW4vYXJjaC94ODYvcHYvbW0uaCAgICAg
ICAgICAgICAgICB8ICAgNiArLQogeGVuL2FyY2gveDg2L3B2L3JvLXBhZ2UtZmF1bHQuYyAgICAg
fCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni90Ym9vdC5jICAgICAgICAgICAgICAgIHwgICAyICstCiB4
ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMgICAgICAgICB8ICA0MSArKysrKystLS0tLS0tCiB4
ZW4vY29tbW9uL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAgMyArCiB4ZW4vY29tbW9uL2Rv
bWN0bC5jICAgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
ICAgICAgICAgICAgfCAgIDQgKy0KIHhlbi9jb21tb24vbWVtb3J5LmMgICAgICAgICAgICAgICAg
IHwgICA2ICstCiB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICB8ICAyOCArKysr
LS0tLS0KIHhlbi9jb21tb24vc3lzY3RsLmMgICAgICAgICAgICAgICAgIHwgIDE0ICsrLS0tCiB4
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jICAgICB8ICAxMyArKy0tCiB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYyB8ICAxNiArKy0tLQogeGVuL2luY2x1ZGUvYXNtLWFy
bS9kb21haW4uaCAgICAgICAgfCAgIDUgKysKIHhlbi9pbmNsdWRlL2FzbS1hcm0vZ3JhbnRfdGFi
bGUuaCAgIHwgIDEyICsrLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCAgICAgICAgICAgIHwg
IDMxICsrKy0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3JhbnRfdGFibGUuaCAgIHwgIDE5
ICsrKy0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oICAgICAgICAgICAgfCAgNDYgKysrKysr
Ky0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oICAgICAgICAgICB8ICAgNiArLQog
eGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oICAgICAgICAgfCAgIDQgKysKIHhlbi9pbmNsdWRl
L3hlbi9kb21haW4uaCAgICAgICAgICAgIHwgICA4ICsrKwogeGVuL2luY2x1ZGUveGVuL21tLmgg
ICAgICAgICAgICAgICAgfCAgMjAgKysrKysrLQogMzYgZmlsZXMgY2hhbmdlZCwgMzQ0IGluc2Vy
dGlvbnMoKyksIDMwMyBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
