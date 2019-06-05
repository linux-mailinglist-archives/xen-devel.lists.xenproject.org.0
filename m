Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBA735A9A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 12:41:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTJS-000644-O5; Wed, 05 Jun 2019 10:38:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HUAv=UE=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hYTJQ-00063z-MP
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 10:38:32 +0000
X-Inumbo-ID: 0e3eb3a0-877e-11e9-bb55-230935f2ba42
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e3eb3a0-877e-11e9-bb55-230935f2ba42;
 Wed, 05 Jun 2019 10:38:29 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KCUwCgmb0qhMPcMFCNlEa8IimNHFcaw1tZzx7vKkfqYpYPww96goAmUlkF29bq4G83C54i4nuR
 qpF1CIChsFBdTyLAM9xU4p7nylNtSJcF44zVId/L8FT5HJp9H/uDlLUGKoIeRuCgnaf3K6j148
 s+eO8bBuJoYyiMD96QZR2gQgna2tjBEwGtRhoNvoAQwWda5eEwWUWLYnrEcbMqNMrLUAc5DC6g
 XMCADko97zE/PAtNnjpoP3gxtG2e3UjgU0pXNyuy1HavSjmv1EA3m77OcGI8HDZcacWdaU38B2
 THI=
X-SBRS: 2.7
X-MesageID: 1347877
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1347877"
From: George Dunlap <George.Dunlap@citrix.com>
To: Baodong Chen <chenbaodong@mxnavi.com>
Thread-Topic: [PATCH v3] xen: make tracebuffer configurable
Thread-Index: AQHVGz32DevvdvHP30axUtDA8W45HaaMvZcA
Date: Wed, 5 Jun 2019 10:38:24 +0000
Message-ID: <516B653D-D319-4335-A428-5AD6F9D12750@citrix.com>
References: <1559698076-17247-1-git-send-email-chenbaodong@mxnavi.com>
In-Reply-To: <1559698076-17247-1-git-send-email-chenbaodong@mxnavi.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <8DAEEDF421A2D74FAC813940DCCD6606@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] xen: make tracebuffer configurable
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVuIDUsIDIwMTksIGF0IDI6MjcgQU0sIEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2Rv
bmdAbXhuYXZpLmNvbT4gd3JvdGU6DQo+IA0KPiBYZW4gaW50ZXJuYWwgcnVubmluZyBzdGF0dXMo
dHJhY2UgZXZlbnQpIHdpbGwgYmUgc2F2ZWQgdG8NCj4gdHJhY2UgbWVtb3J5IHdoZW4gZW5hYmxl
ZC4gdHJhY2UgZXZlbnQgZGF0YSBhbmQgY29uZmlnIHBhcmFtcyBjYW4gYmUNCj4gcmVhZC9jaGFu
Z2VkIGJ5IHN5c3RlbSBjb250cm9sIGh5cGVyY2FsbCBhdCBydW4gdGltZS4NCj4gDQo+IENhbiBi
ZSBkaXNhYmxlZCBmb3Igc21hbGxlciBjb2RlIGZvb3RwcmludC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4NCj4gLS0tDQo+IHhlbi9j
b21tb24vS2NvbmZpZyAgICAgIHwgIDkgKysrKysrKysrDQo+IHhlbi9jb21tb24vTWFrZWZpbGUg
ICAgIHwgIDIgKy0NCj4geGVuL2luY2x1ZGUveGVuL3RyYWNlLmggfCAyNiArKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiAzIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcgYi94ZW4vY29t
bW9uL0tjb25maWcNCj4gaW5kZXggYzgzODUwNi4uZDkwOGZlMSAxMDA2NDQNCj4gLS0tIGEveGVu
L2NvbW1vbi9LY29uZmlnDQo+ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZw0KPiBAQCAtMzY4LDQg
KzM2OCwxMyBAQCBjb25maWcgRE9NMF9NRU0NCj4gDQo+IAkgIExlYXZlIGVtcHR5IGlmIHlvdSBh
cmUgbm90IHN1cmUgd2hhdCB0byBzcGVjaWZ5Lg0KPiANCj4gK2NvbmZpZyBUUkFDRUJVRkZFUg0K
PiArCWJvb2wgIkVuYWJsZSB0cmFjaW5nIGluZnJhc3RydWN0dXJlIiAgaWYgRVhQRVJUID0gInki
DQo+ICsJZGVmYXVsdCB5DQo+ICsJLS0taGVscC0tLQ0KPiArCSAgRW5hYmxlIGluIHRyYWNpbmcg
aW5mcmFzdHJ1Y3R1cmUgYW5kIHByZS1kZWZpbmVkIHRyYWNlcG9pbnRzIHdpdGhpbiBYZW4uDQoN
ClNvcnJ5LCBhbiBlZGl0aW5nIG1pc3Rha2UgY2F1c2VkIG1lIHRvIGluY2x1ZGUgYSBzdHJheSDi
gJhpbuKAmSBpbiB0aGlzIHNlbnRlbmNlIHdoZW4gSSBzdWdnZXN0ZWQgdGhpcyB0ZXh0LiA6LSkN
Cg0KVGhpcyBjb3VsZCBiZSByZW1vdmVkIG9uIGNoZWNrLWluLiAgV2l0aCB0aGF0IGZpeGVkLCB0
aGUgY29tbWl0IG1lc3NhZ2UgbG9va3MgT0sgdG8gbWUuDQoNCiAtR2VvcmdlDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
