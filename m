Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7475FA3B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 16:45:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj2wj-0003GU-00; Thu, 04 Jul 2019 14:42:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj2wh-0003Fo-Hj
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:42:47 +0000
X-Inumbo-ID: fc0435fe-9e69-11e9-9145-9fb62f7dea42
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc0435fe-9e69-11e9-9145-9fb62f7dea42;
 Thu, 04 Jul 2019 14:42:44 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qf1oqVJLkqI39SA5OJI0ziNfvY0oa+XEkI0PA1JFunEuXH6eH4E31JCBO89rL4vDtF/5Iu4tqa
 jqEiM/umbhCz0Y/KMqPLmz407CRfR1ZkXnVHFnoSmGFJxJhCfqGIlPlvagNE+JxOP9JT6CVZaA
 LC8bg/pn44oFloSTs4oRe7Yd1uF9FZBatjU70IRjPWupdyqtHiZurGwHUexEbPYML06P8kyfNl
 WqfUTbqvE7PGab3lLIRRD1FfUIDtEMa/rICBsV7ju8RjRYN5pVHwjOOPBurExFPBif5DtnTdBk
 Jms=
X-SBRS: 2.7
X-MesageID: 2588790
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2588790"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:07 +0100
Message-ID: <20190704144233.27968-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 09/35] OvmfPkg/OvmfXen: use a TimerLib
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QUNQSSBUaW1lciBkb2VzIG5vdCB3b3JrIGluIGEgUFZIIGd1ZXN0LCBidXQgbG9jYWwgQVBJQyB3
b3JrcyBvbiBib3RoClBWSCBhbmQgSFZNLgoKTm90ZSB0aGF0IHRoZSB1c2Ugb2YgU2VjUGVpRHhl
VGltZXJMaWJDcHUgbWlnaHQgYmUgYW4gaXNzdWUgd2l0aCBhCmRyaXZlciBvZiB0eXBlIERYRV9S
VU5USU1FX0RSSVZFUi4gSSd2ZSBhdHRlbXB0ZGUgdG8gZmluZCBvdXQgd2hpY2ggb2YKdGhlIERY
RV9SVU5USU1FX0RSSVZFUiB1c2VzIHRoZSBUaW1lckxpYiBhdCBydW50aW1lLiBJJ3ZlIGRvbmUg
dGhhdCBieQpyZXBsYWNpbmcgdGhlIFRpbWVyTGliIGV2YWx1YXRpb24gaW4KW0xpYnJhcnlDbGFz
c2VzLmNvbW1vbi5EWEVfUlVOVElNRV9EUklWRVJdIGJ5IGEgZGlmZmVyZW50IG9uZSBhbmQKY2hl
Y2sgZXZlcnkgbW9kdWxlIHRoYXQgdXNlcyBpdCAod2l0aCB0aGUgLS1yZXBvcnQtZmlsZT1yZXBv
cnQgYnVpbGQKb3B0aW9uKS4KClJlc2V0U3lzdGVtUnVudGltZUR4ZSBpcyBjYWxsaW5nIHRoZSBU
aW1lckxpYiBBUEkgYXQgcnVudGltZSB0byBkbyB0aGUKb3BlcmF0aW9uICJFZmlSZXNldENvbGQi
LCBzbyB0aGlzIG1heSBuZXZlciBjb21wbGV0ZSBpZiB0aGUgT1MgaGF2ZQpkaXNhYmxlZCB0aGUg
TG9jYWwgQVBJQyBUaW1lci4KClJlZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3No
b3dfYnVnLmNnaT9pZD0xNjg5ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgotLS0KCk5vdGVzOgogICAgdjM6CiAgICAtIGNsZWFudXAgLmRz
YywgbGVhdmUgb25seSBvbmUgVGltZXJMaWIgcmVzb2x1dGlvbgogICAgLSBBZGRlZCBhIG5vdGUg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlIHJlZ2FyZGluZyB0aGUgdXNlIG9mIHRoZSBsb2NhbCBhcGlj
CiAgICAgIGJ5IHJ1bnRpbWUgZHJpdmVycwoKIE92bWZQa2cvT3ZtZlhlbi5kc2MgfCA3ICstLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9Pdm1mUGtnL092bWZYZW4uZHNjIGIvT3ZtZlBrZy9Pdm1mWGVuLmRzYwppbmRleCA5
Zjc5ZDQ1NWZhLi42Mjg4Mzk0ZWI4IDEwMDY0NAotLS0gYS9Pdm1mUGtnL092bWZYZW4uZHNjCisr
KyBiL092bWZQa2cvT3ZtZlhlbi5kc2MKQEAgLTEwNCw3ICsxMDQsNyBAQCBbU2t1SWRzXQogIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMNCiBbTGlicmFyeUNsYXNzZXNdDQogICBQY2RMaWJ8TWRlUGtn
L0xpYnJhcnkvQmFzZVBjZExpYk51bGwvQmFzZVBjZExpYk51bGwuaW5mDQotICBUaW1lckxpYnxP
dm1mUGtnL0xpYnJhcnkvQWNwaVRpbWVyTGliL0Jhc2VBY3BpVGltZXJMaWIuaW5mDQorICBUaW1l
ckxpYnxNZGVQa2cvTGlicmFyeS9TZWNQZWlEeGVUaW1lckxpYkNwdS9TZWNQZWlEeGVUaW1lckxp
YkNwdS5pbmYNCiAgIFByaW50TGlifE1kZVBrZy9MaWJyYXJ5L0Jhc2VQcmludExpYi9CYXNlUHJp
bnRMaWIuaW5mDQogICBCYXNlTWVtb3J5TGlifE1kZVBrZy9MaWJyYXJ5L0Jhc2VNZW1vcnlMaWJS
ZXBTdHIvQmFzZU1lbW9yeUxpYlJlcFN0ci5pbmYNCiAgIEJhc2VMaWJ8TWRlUGtnL0xpYnJhcnkv
QmFzZUxpYi9CYXNlTGliLmluZg0KQEAgLTIwMiw3ICsyMDIsNiBAQCBbTGlicmFyeUNsYXNzZXMu
Y29tbW9uXQogICBCYXNlQ3J5cHRMaWJ8Q3J5cHRvUGtnL0xpYnJhcnkvQmFzZUNyeXB0TGliL0Jh
c2VDcnlwdExpYi5pbmYNCiANCiBbTGlicmFyeUNsYXNzZXMuY29tbW9uLlNFQ10NCi0gIFRpbWVy
TGlifE92bWZQa2cvTGlicmFyeS9BY3BpVGltZXJMaWIvQmFzZVJvbUFjcGlUaW1lckxpYi5pbmYN
CiAgIFFlbXVGd0NmZ0xpYnxPdm1mUGtnL0xpYnJhcnkvUWVtdUZ3Q2ZnTGliL1FlbXVGd0NmZ1Nl
Y0xpYi5pbmYNCiAhaWZkZWYgJChERUJVR19PTl9TRVJJQUxfUE9SVCkNCiAgIERlYnVnTGlifE1k
ZVBrZy9MaWJyYXJ5L0Jhc2VEZWJ1Z0xpYlNlcmlhbFBvcnQvQmFzZURlYnVnTGliU2VyaWFsUG9y
dC5pbmYNCkBAIC0yODEsNyArMjgwLDYgQEAgW0xpYnJhcnlDbGFzc2VzLmNvbW1vbi5EWEVfQ09S
RV0KIA0KIFtMaWJyYXJ5Q2xhc3Nlcy5jb21tb24uRFhFX1JVTlRJTUVfRFJJVkVSXQ0KICAgUGNk
TGlifE1kZVBrZy9MaWJyYXJ5L0R4ZVBjZExpYi9EeGVQY2RMaWIuaW5mDQotICBUaW1lckxpYnxP
dm1mUGtnL0xpYnJhcnkvQWNwaVRpbWVyTGliL0R4ZUFjcGlUaW1lckxpYi5pbmYNCiAgIEhvYkxp
YnxNZGVQa2cvTGlicmFyeS9EeGVIb2JMaWIvRHhlSG9iTGliLmluZg0KICAgRHhlQ29yZUVudHJ5
UG9pbnR8TWRlUGtnL0xpYnJhcnkvRHhlQ29yZUVudHJ5UG9pbnQvRHhlQ29yZUVudHJ5UG9pbnQu
aW5mDQogICBNZW1vcnlBbGxvY2F0aW9uTGlifE1kZVBrZy9MaWJyYXJ5L1VlZmlNZW1vcnlBbGxv
Y2F0aW9uTGliL1VlZmlNZW1vcnlBbGxvY2F0aW9uTGliLmluZg0KQEAgLTI5OCw3ICsyOTYsNiBA
QCBbTGlicmFyeUNsYXNzZXMuY29tbW9uLkRYRV9SVU5USU1FX0RSSVZFUl0KIA0KIFtMaWJyYXJ5
Q2xhc3Nlcy5jb21tb24uVUVGSV9EUklWRVJdDQogICBQY2RMaWJ8TWRlUGtnL0xpYnJhcnkvRHhl
UGNkTGliL0R4ZVBjZExpYi5pbmYNCi0gIFRpbWVyTGlifE92bWZQa2cvTGlicmFyeS9BY3BpVGlt
ZXJMaWIvRHhlQWNwaVRpbWVyTGliLmluZg0KICAgSG9iTGlifE1kZVBrZy9MaWJyYXJ5L0R4ZUhv
YkxpYi9EeGVIb2JMaWIuaW5mDQogICBEeGVDb3JlRW50cnlQb2ludHxNZGVQa2cvTGlicmFyeS9E
eGVDb3JlRW50cnlQb2ludC9EeGVDb3JlRW50cnlQb2ludC5pbmYNCiAgIE1lbW9yeUFsbG9jYXRp
b25MaWJ8TWRlUGtnL0xpYnJhcnkvVWVmaU1lbW9yeUFsbG9jYXRpb25MaWIvVWVmaU1lbW9yeUFs
bG9jYXRpb25MaWIuaW5mDQpAQCAtMzEzLDcgKzMxMCw2IEBAIFtMaWJyYXJ5Q2xhc3Nlcy5jb21t
b24uVUVGSV9EUklWRVJdCiANCiBbTGlicmFyeUNsYXNzZXMuY29tbW9uLkRYRV9EUklWRVJdDQog
ICBQY2RMaWJ8TWRlUGtnL0xpYnJhcnkvRHhlUGNkTGliL0R4ZVBjZExpYi5pbmYNCi0gIFRpbWVy
TGlifE92bWZQa2cvTGlicmFyeS9BY3BpVGltZXJMaWIvRHhlQWNwaVRpbWVyTGliLmluZg0KICAg
SG9iTGlifE1kZVBrZy9MaWJyYXJ5L0R4ZUhvYkxpYi9EeGVIb2JMaWIuaW5mDQogICBNZW1vcnlB
bGxvY2F0aW9uTGlifE1kZVBrZy9MaWJyYXJ5L1VlZmlNZW1vcnlBbGxvY2F0aW9uTGliL1VlZmlN
ZW1vcnlBbGxvY2F0aW9uTGliLmluZg0KICAgUmVwb3J0U3RhdHVzQ29kZUxpYnxNZGVNb2R1bGVQ
a2cvTGlicmFyeS9EeGVSZXBvcnRTdGF0dXNDb2RlTGliL0R4ZVJlcG9ydFN0YXR1c0NvZGVMaWIu
aW5mDQpAQCAtMzM3LDcgKzMzMyw2IEBAIFtMaWJyYXJ5Q2xhc3Nlcy5jb21tb24uRFhFX0RSSVZF
Ul0KIA0KIFtMaWJyYXJ5Q2xhc3Nlcy5jb21tb24uVUVGSV9BUFBMSUNBVElPTl0NCiAgIFBjZExp
YnxNZGVQa2cvTGlicmFyeS9EeGVQY2RMaWIvRHhlUGNkTGliLmluZg0KLSAgVGltZXJMaWJ8T3Zt
ZlBrZy9MaWJyYXJ5L0FjcGlUaW1lckxpYi9EeGVBY3BpVGltZXJMaWIuaW5mDQogICBIb2JMaWJ8
TWRlUGtnL0xpYnJhcnkvRHhlSG9iTGliL0R4ZUhvYkxpYi5pbmYNCiAgIE1lbW9yeUFsbG9jYXRp
b25MaWJ8TWRlUGtnL0xpYnJhcnkvVWVmaU1lbW9yeUFsbG9jYXRpb25MaWIvVWVmaU1lbW9yeUFs
bG9jYXRpb25MaWIuaW5mDQogICBSZXBvcnRTdGF0dXNDb2RlTGlifE1kZU1vZHVsZVBrZy9MaWJy
YXJ5L0R4ZVJlcG9ydFN0YXR1c0NvZGVMaWIvRHhlUmVwb3J0U3RhdHVzQ29kZUxpYi5pbmYNCi0t
IApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
