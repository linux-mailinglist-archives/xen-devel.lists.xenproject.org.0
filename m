Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3B68B6F8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 13:33:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxV1V-0006LE-AG; Tue, 13 Aug 2019 11:31:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxV1T-0006KB-Ol
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:31:27 +0000
X-Inumbo-ID: e31c4a7f-bdbd-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e31c4a7f-bdbd-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 11:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565695886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6cPs6isXG3fMB9VEbUM52iNRVZa7vKqCpGmS0ewj4Yo=;
 b=OSlfSEPnp2KTFx5mWMYm5k2VY7gQGiHU2H+XUkeuRuCfExUmLwFT4LS5
 ub0DPxcXSKLLKBfACPNC9F1hfRHFtNHIG9xFpZElOI9Elve2oqn3e3lXk
 g/AzGiI0KFZxyVhSr9fu4vMMq4QuQ3qlEULHYv57UZVSzjFKf2gRvIasm Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: f5ic5juQJHflLMH71MFUJC92NjRHNN3O6jgnKAwy1E+oLqGI5Ov7aFEXRSwqv9PYum1AXB10QF
 OHZlvZblRB/Ahby4Uk2e/Ne77b+EYwXKFeEeGaYS1K5jloLG3yjmM7BskQIxIeHiJYKXSr7O4m
 gTxicIicyRCI7FJlon0NwDPFYcr5dLrrafbOJw0mHqpO5ZI8751L/g8m80UEWHR1O9vRc2SVkq
 tuUdeKtuFxvGkIobJNZfNbsNwacNPFwTrz2IVegZgi9grRULFsEJpSTsKs0SQF+YAbfb3+brrr
 0kI=
X-SBRS: 2.7
X-MesageID: 4401253
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4401253"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 13 Aug 2019 12:30:53 +0100
Message-ID: <20190813113119.14804-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813113119.14804-1-anthony.perard@citrix.com>
References: <20190813113119.14804-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 09/35] OvmfPkg/OvmfXen: use a TimerLib
 instance that depends only on the CPU
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEFDUEkgVGltZXIgaXNuJ3QgcHJlc2VudCBpbiBhIFBWSCBndWVzdCwgYnV0IGxvY2FsIEFQ
SUMgd29ya3Mgb24KYm90aCBQVkggYW5kIEhWTS4KCk5vdGUgdGhhdCB0aGUgdXNlIG9mIFNlY1Bl
aUR4ZVRpbWVyTGliQ3B1IG1pZ2h0IGJlIGFuIGlzc3VlIHdpdGggYQpkcml2ZXIgb2YgdHlwZSBE
WEVfUlVOVElNRV9EUklWRVIuIEkndmUgYXR0ZW1wdGVkIHRvIGZpbmQgb3V0IHdoaWNoIG9mCnRo
ZSBEWEVfUlVOVElNRV9EUklWRVIgdXNlcyB0aGUgVGltZXJMaWIgYXQgcnVudGltZS4gSSd2ZSBk
b25lIHRoYXQgYnkKcmVwbGFjaW5nIHRoZSBUaW1lckxpYiBldmFsdWF0aW9uIGluCltMaWJyYXJ5
Q2xhc3Nlcy5jb21tb24uRFhFX1JVTlRJTUVfRFJJVkVSXSBieSBhIGRpZmZlcmVudCBvbmUgYW5k
CmNoZWNraW5nIGV2ZXJ5IG1vZHVsZSB0aGF0IHVzZXMgaXQgKHdpdGggdGhlIC0tcmVwb3J0LWZp
bGU9cmVwb3J0CmJ1aWxkIG9wdGlvbikuCgpSZXNldFN5c3RlbVJ1bnRpbWVEeGUgaXMgY2FsbGlu
ZyB0aGUgVGltZXJMaWIgQVBJIGF0IHJ1bnRpbWUgdG8gZG8gdGhlCm9wZXJhdGlvbiAiRWZpUmVz
ZXRDb2xkIiwgc28gdGhpcyBtYXkgbmV2ZXIgY29tcGxldGUgaWYgdGhlIE9TIGhhdmUKZGlzYWJs
ZWQgdGhlIExvY2FsIEFQSUMgVGltZXIuCgpSZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3Jl
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2Vr
QHJlZGhhdC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2NDoKICAgIC0gcmV3b3JkZWQgdGhlIGZpcnN0
IHNlbnRlbmNlLCB1c2UgIm5vdCBwcmVzZW50IiBpbnN0ZWFkIG9mICJkb24ndCB3b3JrIi4KICAg
IAogICAgdjM6CiAgICAtIGNsZWFudXAgLmRzYywgbGVhdmUgb25seSBvbmUgVGltZXJMaWIgcmVz
b2x1dGlvbgogICAgLSBBZGRlZCBhIG5vdGUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHJlZ2FyZGlu
ZyB0aGUgdXNlIG9mIHRoZSBsb2NhbCBhcGljCiAgICAgIGJ5IHJ1bnRpbWUgZHJpdmVycwoKIE92
bWZQa2cvT3ZtZlhlbi5kc2MgfCA3ICstLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL092bWZYZW4uZHNjIGIv
T3ZtZlBrZy9Pdm1mWGVuLmRzYwppbmRleCA3NjE5YTg5MzgyLi5iNDBkMzllMDAzIDEwMDY0NAot
LS0gYS9Pdm1mUGtnL092bWZYZW4uZHNjCisrKyBiL092bWZQa2cvT3ZtZlhlbi5kc2MKQEAgLTEw
NCw3ICsxMDQsNyBAQCBbU2t1SWRzXQogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiBbTGlicmFy
eUNsYXNzZXNdDQogICBQY2RMaWJ8TWRlUGtnL0xpYnJhcnkvQmFzZVBjZExpYk51bGwvQmFzZVBj
ZExpYk51bGwuaW5mDQotICBUaW1lckxpYnxPdm1mUGtnL0xpYnJhcnkvQWNwaVRpbWVyTGliL0Jh
c2VBY3BpVGltZXJMaWIuaW5mDQorICBUaW1lckxpYnxNZGVQa2cvTGlicmFyeS9TZWNQZWlEeGVU
aW1lckxpYkNwdS9TZWNQZWlEeGVUaW1lckxpYkNwdS5pbmYNCiAgIFByaW50TGlifE1kZVBrZy9M
aWJyYXJ5L0Jhc2VQcmludExpYi9CYXNlUHJpbnRMaWIuaW5mDQogICBCYXNlTWVtb3J5TGlifE1k
ZVBrZy9MaWJyYXJ5L0Jhc2VNZW1vcnlMaWJSZXBTdHIvQmFzZU1lbW9yeUxpYlJlcFN0ci5pbmYN
CiAgIEJhc2VMaWJ8TWRlUGtnL0xpYnJhcnkvQmFzZUxpYi9CYXNlTGliLmluZg0KQEAgLTIwMiw3
ICsyMDIsNiBAQCBbTGlicmFyeUNsYXNzZXMuY29tbW9uXQogICBCYXNlQ3J5cHRMaWJ8Q3J5cHRv
UGtnL0xpYnJhcnkvQmFzZUNyeXB0TGliL0Jhc2VDcnlwdExpYi5pbmYNCiANCiBbTGlicmFyeUNs
YXNzZXMuY29tbW9uLlNFQ10NCi0gIFRpbWVyTGlifE92bWZQa2cvTGlicmFyeS9BY3BpVGltZXJM
aWIvQmFzZVJvbUFjcGlUaW1lckxpYi5pbmYNCiAgIFFlbXVGd0NmZ0xpYnxPdm1mUGtnL0xpYnJh
cnkvUWVtdUZ3Q2ZnTGliL1FlbXVGd0NmZ1NlY0xpYi5pbmYNCiAhaWZkZWYgJChERUJVR19PTl9T
RVJJQUxfUE9SVCkNCiAgIERlYnVnTGlifE1kZVBrZy9MaWJyYXJ5L0Jhc2VEZWJ1Z0xpYlNlcmlh
bFBvcnQvQmFzZURlYnVnTGliU2VyaWFsUG9ydC5pbmYNCkBAIC0yODEsNyArMjgwLDYgQEAgW0xp
YnJhcnlDbGFzc2VzLmNvbW1vbi5EWEVfQ09SRV0KIA0KIFtMaWJyYXJ5Q2xhc3Nlcy5jb21tb24u
RFhFX1JVTlRJTUVfRFJJVkVSXQ0KICAgUGNkTGlifE1kZVBrZy9MaWJyYXJ5L0R4ZVBjZExpYi9E
eGVQY2RMaWIuaW5mDQotICBUaW1lckxpYnxPdm1mUGtnL0xpYnJhcnkvQWNwaVRpbWVyTGliL0R4
ZUFjcGlUaW1lckxpYi5pbmYNCiAgIEhvYkxpYnxNZGVQa2cvTGlicmFyeS9EeGVIb2JMaWIvRHhl
SG9iTGliLmluZg0KICAgRHhlQ29yZUVudHJ5UG9pbnR8TWRlUGtnL0xpYnJhcnkvRHhlQ29yZUVu
dHJ5UG9pbnQvRHhlQ29yZUVudHJ5UG9pbnQuaW5mDQogICBNZW1vcnlBbGxvY2F0aW9uTGlifE1k
ZVBrZy9MaWJyYXJ5L1VlZmlNZW1vcnlBbGxvY2F0aW9uTGliL1VlZmlNZW1vcnlBbGxvY2F0aW9u
TGliLmluZg0KQEAgLTI5OCw3ICsyOTYsNiBAQCBbTGlicmFyeUNsYXNzZXMuY29tbW9uLkRYRV9S
VU5USU1FX0RSSVZFUl0KIA0KIFtMaWJyYXJ5Q2xhc3Nlcy5jb21tb24uVUVGSV9EUklWRVJdDQog
ICBQY2RMaWJ8TWRlUGtnL0xpYnJhcnkvRHhlUGNkTGliL0R4ZVBjZExpYi5pbmYNCi0gIFRpbWVy
TGlifE92bWZQa2cvTGlicmFyeS9BY3BpVGltZXJMaWIvRHhlQWNwaVRpbWVyTGliLmluZg0KICAg
SG9iTGlifE1kZVBrZy9MaWJyYXJ5L0R4ZUhvYkxpYi9EeGVIb2JMaWIuaW5mDQogICBEeGVDb3Jl
RW50cnlQb2ludHxNZGVQa2cvTGlicmFyeS9EeGVDb3JlRW50cnlQb2ludC9EeGVDb3JlRW50cnlQ
b2ludC5pbmYNCiAgIE1lbW9yeUFsbG9jYXRpb25MaWJ8TWRlUGtnL0xpYnJhcnkvVWVmaU1lbW9y
eUFsbG9jYXRpb25MaWIvVWVmaU1lbW9yeUFsbG9jYXRpb25MaWIuaW5mDQpAQCAtMzEzLDcgKzMx
MCw2IEBAIFtMaWJyYXJ5Q2xhc3Nlcy5jb21tb24uVUVGSV9EUklWRVJdCiANCiBbTGlicmFyeUNs
YXNzZXMuY29tbW9uLkRYRV9EUklWRVJdDQogICBQY2RMaWJ8TWRlUGtnL0xpYnJhcnkvRHhlUGNk
TGliL0R4ZVBjZExpYi5pbmYNCi0gIFRpbWVyTGlifE92bWZQa2cvTGlicmFyeS9BY3BpVGltZXJM
aWIvRHhlQWNwaVRpbWVyTGliLmluZg0KICAgSG9iTGlifE1kZVBrZy9MaWJyYXJ5L0R4ZUhvYkxp
Yi9EeGVIb2JMaWIuaW5mDQogICBNZW1vcnlBbGxvY2F0aW9uTGlifE1kZVBrZy9MaWJyYXJ5L1Vl
ZmlNZW1vcnlBbGxvY2F0aW9uTGliL1VlZmlNZW1vcnlBbGxvY2F0aW9uTGliLmluZg0KICAgUmVw
b3J0U3RhdHVzQ29kZUxpYnxNZGVNb2R1bGVQa2cvTGlicmFyeS9EeGVSZXBvcnRTdGF0dXNDb2Rl
TGliL0R4ZVJlcG9ydFN0YXR1c0NvZGVMaWIuaW5mDQpAQCAtMzM3LDcgKzMzMyw2IEBAIFtMaWJy
YXJ5Q2xhc3Nlcy5jb21tb24uRFhFX0RSSVZFUl0KIA0KIFtMaWJyYXJ5Q2xhc3Nlcy5jb21tb24u
VUVGSV9BUFBMSUNBVElPTl0NCiAgIFBjZExpYnxNZGVQa2cvTGlicmFyeS9EeGVQY2RMaWIvRHhl
UGNkTGliLmluZg0KLSAgVGltZXJMaWJ8T3ZtZlBrZy9MaWJyYXJ5L0FjcGlUaW1lckxpYi9EeGVB
Y3BpVGltZXJMaWIuaW5mDQogICBIb2JMaWJ8TWRlUGtnL0xpYnJhcnkvRHhlSG9iTGliL0R4ZUhv
YkxpYi5pbmYNCiAgIE1lbW9yeUFsbG9jYXRpb25MaWJ8TWRlUGtnL0xpYnJhcnkvVWVmaU1lbW9y
eUFsbG9jYXRpb25MaWIvVWVmaU1lbW9yeUFsbG9jYXRpb25MaWIuaW5mDQogICBSZXBvcnRTdGF0
dXNDb2RlTGlifE1kZU1vZHVsZVBrZy9MaWJyYXJ5L0R4ZVJlcG9ydFN0YXR1c0NvZGVMaWIvRHhl
UmVwb3J0U3RhdHVzQ29kZUxpYi5pbmYNCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
