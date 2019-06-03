Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBBA33493
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 18:07:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXpRK-0001tC-IZ; Mon, 03 Jun 2019 16:04:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXpRJ-0001t6-58
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:04:01 +0000
X-Inumbo-ID: 3252640b-8619-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3252640b-8619-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 16:03:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A050180D;
 Mon,  3 Jun 2019 09:03:58 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F03C93F246;
 Mon,  3 Jun 2019 09:03:55 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Jun 2019 17:03:36 +0100
Message-Id: <20190603160350.29806-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH v3 00/14] xen/arm: Properly disable M2P on Arm
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Gang Wei <gang.wei@intel.com>, oleksandr_tyshchenko@epam.com,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
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
bCAoMTQpOgogIHhlbi94ODY6IE1ha2UgbWZuX3RvX2dmbiB0eXBlc2FmZQogIHhlbi94ODY6IFVz
ZSBtZm5fdG9fZ2ZuIHJhdGhlciB0aGFuIG1mbl90b19nbWZuCiAgeGVuL2dyYW50LXRhYmxlOiBN
YWtlIGFyY2ggc3BlY2lmaWMgbWFjcm9zIHR5cGVzYWZlCiAgeGVuOiBDb252ZXJ0IGhvdHBsdWcg
cGFnZSBmdW5jdGlvbiB0byB1c2UgdHlwZXNhZmUgTUZOCiAgeGVuOiBDb252ZXJ0IGlzX3hlbl9m
aXhlZF9tZm4gdG8gdXNlIHR5cGVzYWZlIE1GTgogIHhlbjogQ29udmVydCBpc194ZW5faGVhcF9t
Zm4gdG8gdXNlIHR5cGVzYWZlIE1GTgogIHhlbjogSW50cm9kdWNlIEhBU19NMlAgY29uZmlnIGFu
ZCB1c2UgdG8gcHJvdGVjdCBtZm5fdG9fZ21mbiBjYWxsCiAgeGVuOiBSZW1vdmUgbWZuX3RvX2dt
Zm4gbWFjcm8KICB4ZW4veDg2OiBtbTogUmUtaW1wbGVtZW50IHNldF9ncGZuX2Zyb21fbWZuKCkg
YXMgYSBzdGF0aWMgaW5saW5lCiAgICBmdW5jdGlvbgogIHhlbi94ODY6IHB2OiBDb252ZXJ0IHVw
ZGF0ZV9pbnRwdGUoKSB0byB1c2UgdHlwZXNhZmUgTUZOCiAgeGVuL3g4NjogcDJtOiBSZW1vdmUg
ZHVwbGljYXRlIGVycm9yIG1lc3NhZ2UgaW4gcDJtX3B0X2F1ZGl0X3AybSgpCiAgeGVuL3g4Njog
cDJtOiBSZXdvcmsgcHJpbnRrIGZvcm1hdCBpbiBhdWRpdF9wMm0oKQogIHhlbi9tbTogQ29udmVy
dCB7cywgZ31ldF9ncGZuX2Zyb21fbWZuKCkgdG8gdXNlIHR5cGVzYWZlIE1GTgogIHhlbi9tbTog
UHJvdmlkZSBkdW1teSBNMlAtcmVsYXRlZCBoZWxwZXJzIHdoZW4gIUNPTkZJR19IQVZFX00yUAoK
IHhlbi9hcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgICAgIHwgICAxICsKIHhlbi9hcmNoL3g4
Ni9jcHUvbWNoZWNrL21jYWN0aW9uLmMgIHwgIDIwICsrKy0tLS0KIHhlbi9hcmNoL3g4Ni9kb21h
aW4uYyAgICAgICAgICAgICAgIHwgIDM0ICsrKysrKy0tLS0tLQogeGVuL2FyY2gveDg2L21tLmMg
ICAgICAgICAgICAgICAgICAgfCAxMDIgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tCiB4ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyAgICAgICB8ICAxOSArKystLS0tCiB4
ZW4vYXJjaC94ODYvbW0vcDJtLXBvZC5jICAgICAgICAgICB8ICAgNCArLQogeGVuL2FyY2gveDg2
L21tL3AybS1wdC5jICAgICAgICAgICAgfCAgMzUgKysrKysrLS0tLS0tLQogeGVuL2FyY2gveDg2
L21tL3AybS5jICAgICAgICAgICAgICAgfCAgNzEgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQog
eGVuL2FyY2gveDg2L21tL3BhZ2luZy5jICAgICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4
Ni9tbS9zaGFkb3cvY29tbW9uLmMgICAgIHwgIDMxICsrKysrKy0tLS0tCiB4ZW4vYXJjaC94ODYv
bW0vc2hhZG93L211bHRpLmMgICAgICB8ICAgNiArLS0KIHhlbi9hcmNoL3g4Ni9wdi9kb20wX2J1
aWxkLmMgICAgICAgIHwgICA2ICstLQogeGVuL2FyY2gveDg2L3B2L2VtdWwtcHJpdi1vcC5jICAg
ICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9wdi9ncmFudF90YWJsZS5jICAgICAgIHwgICA2ICst
LQogeGVuL2FyY2gveDg2L3B2L21tLmggICAgICAgICAgICAgICAgfCAgIDcgKystCiB4ZW4vYXJj
aC94ODYvcHYvcm8tcGFnZS1mYXVsdC5jICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L3Rib290
LmMgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYyAg
ICAgICAgIHwgIDQxICsrKysrKysrLS0tLS0tLQogeGVuL2NvbW1vbi9LY29uZmlnICAgICAgICAg
ICAgICAgICAgfCAgIDMgKysKIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAgICAgICAgICAgIHwg
ICA5ICsrKy0KIHhlbi9jb21tb24vZ3JhbnRfdGFibGUuYyAgICAgICAgICAgIHwgICA0ICstCiB4
ZW4vY29tbW9uL21lbW9yeS5jICAgICAgICAgICAgICAgICB8ICAgNCArKwogeGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMgICAgICAgICAgICAgfCAgMjggKysrKystLS0tLQogeGVuL2NvbW1vbi9zeXNj
dGwuYyAgICAgICAgICAgICAgICAgfCAgMTQgKystLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2lvbW11LmMgICAgIHwgIDE1ICsrKystLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lv
bW11LmMgfCAgMTYgKysrLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oICAgICAgICB8
ICAgNSArKwogeGVuL2luY2x1ZGUvYXNtLWFybS9ncmFudF90YWJsZS5oICAgfCAgMTIgKystLS0K
IHhlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCAgICAgICAgICAgIHwgIDI1ICsrKy0tLS0tLQogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9ncmFudF90YWJsZS5oICAgfCAgMTkgKysrLS0tLQogeGVuL2luY2x1
ZGUvYXNtLXg4Ni9tbS5oICAgICAgICAgICAgfCAgNDYgKysrKysrKystLS0tLS0tLQogeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9wMm0uaCAgICAgICAgICAgfCAgIDYgKy0tCiB4ZW4vaW5jbHVkZS9wdWJs
aWMvZG9tY3RsLmggICAgICAgICB8ICAgNiArKysKIHhlbi9pbmNsdWRlL3hlbi9kb21haW4uaCAg
ICAgICAgICAgIHwgIDEyICsrKysrCiB4ZW4vaW5jbHVkZS94ZW4vbW0uaCAgICAgICAgICAgICAg
ICB8ICAyMCArKysrKy0tCiAzNSBmaWxlcyBjaGFuZ2VkLCAzNDQgaW5zZXJ0aW9ucygrKSwgMjk1
IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
