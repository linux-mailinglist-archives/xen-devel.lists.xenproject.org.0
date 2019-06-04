Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B203344CD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 12:53:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY70o-0007dv-6Z; Tue, 04 Jun 2019 10:49:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vqUI=UD=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hY70m-0007dq-HG
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 10:49:48 +0000
X-Inumbo-ID: 7580f8ac-86b6-11e9-897c-af3dd4c7aabb
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7580f8ac-86b6-11e9-897c-af3dd4c7aabb;
 Tue, 04 Jun 2019 10:49:43 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
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
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: zn352wUGlsqTAM8T7LCP4KMnN3+I4v6hXV3cv30y3d7fnWWeA48IRIIiAyG+v/CltbTjUYotp4
 vZNHoonRP96V5fKHduS/3lFBJp3hyrO+nB4r48pQeV0BRyopW6kzl/8/RlcD1UA7ipfsrLZLo0
 rNRPiuGny/D6G/KjuNN3MjNMx8tmJzIFZmN6TWOynTgY3vcO9Edkwwvpu8ftHeVQTmvw5wTupL
 fWKsnwKDghMpvEItMZSRb6dqtW3qqwJh4KgQozUOnRnT8b2OELdyBGMBMv4MRC2pOIIQxIMo/h
 joM=
X-SBRS: 2.7
X-MesageID: 1290551
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1290551"
From: George Dunlap <George.Dunlap@citrix.com>
To: Baodong Chen <chenbaodong@mxnavi.com>
Thread-Topic: [PATCH v1] xen: make tracebuffer configurable
Thread-Index: AQHVGm7IH2fjBShduEyl+0KzQMDl9qaLMAQA
Date: Tue, 4 Jun 2019 10:49:38 +0000
Message-ID: <B930162C-3D36-4182-9302-D0833A550C9C@citrix.com>
References: <1559609096-11356-1-git-send-email-chenbaodong@mxnavi.com>
In-Reply-To: <1559609096-11356-1-git-send-email-chenbaodong@mxnavi.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <947014EC7C4741469E876786A7410B06@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] xen: make tracebuffer configurable
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

DQoNCj4gT24gSnVuIDQsIDIwMTksIGF0IDE6NDQgQU0sIEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2Rv
bmdAbXhuYXZpLmNvbT4gd3JvdGU6DQo+IA0KPiBYZW4gaW50ZXJuYWwgcnVubmluZyBzdGF0dXMo
dHJhY2UgZXZlbnQpIHdpbGwgYmUgc2F2ZWQgdG8NCj4gdHJhY2UgbWVtb3J5IHdoZW4gZW5hYmxl
ZC4gdHJhY2UgZXZlbnQgZGF0YSBhbmQgY29uZmlnIHBhcmFtcyBjYW4gYmUNCj4gcmVhZC9jaGFu
Z2VkIGJ5IHN5c3RlbSBjb250cm9sIGh5cGVyY2FsbCBhdCBydW4gdGltZS4NCj4gDQo+IENhbiBi
ZSBkaXNhYmxlZCBmb3Igc21hbGxlciBjb2RlIGZvb3RwcmludC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4NCj4gLS0tDQo+IHhlbi9j
b21tb24vS2NvbmZpZyAgICAgIHwgMTIgKysrKysrKysrKysrDQo+IHhlbi9jb21tb24vTWFrZWZp
bGUgICAgIHwgIDIgKy0NCj4geGVuL2luY2x1ZGUveGVuL3RyYWNlLmggfCAxNyArKysrKysrKysr
KysrKysrKw0KPiAzIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcgYi94ZW4vY29tbW9uL0tj
b25maWcNCj4gaW5kZXggYzgzODUwNi4uMzQ1OWY1NiAxMDA2NDQNCj4gLS0tIGEveGVuL2NvbW1v
bi9LY29uZmlnDQo+ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZw0KPiBAQCAtMzY4LDQgKzM2OCwx
NiBAQCBjb25maWcgRE9NMF9NRU0NCj4gDQo+IAkgIExlYXZlIGVtcHR5IGlmIHlvdSBhcmUgbm90
IHN1cmUgd2hhdCB0byBzcGVjaWZ5Lg0KPiANCj4gK2NvbmZpZyBUUkFDRUJVRkZFUg0KPiArCWJv
b2wgIkVuYWJsZSB0cmFjZSBldmVudCBsb2dzIiAgaWYgRVhQRVJUID0gInkiDQo+ICsJLS0taGVs
cC0tLQ0KPiArCSAgWGVuIGludGVybmFsIHJ1bm5pbmcgc3RhdHVzKHRyYWNlIGV2ZW50KSB3aWxs
IGJlIHNhdmVkIHRvIHRyYWNlIG1lbW9yeQ0KPiArCSAgd2hlbiBlbmFibGVkLiB0cmFjZSBldmVu
dCBkYXRhIGFuZCBjb25maWcgcGFyYW1zIGNhbiBiZSByZWFkL2NoYW5nZWQNCj4gKwkgIGJ5IHN5
c3RlbSBjb250cm9sIGh5cGVyY2FsbCBhdCBydW4gdGltZS4NCj4gKw0KPiArCSAgVGhpcyBpcyB1
c2VkIHRvIHJlY29yZCB4ZW4gaW50ZXJuYWwgcnVubmluZyBzdGF0dXMuDQo+ICsJICB3aXRoIGEg
bGl0dGUgcGVyZm9ybWFuY2Ugb3ZlcmhlYWQuDQo+ICsJICBDYW4gYmUgc2V0IHRvICdOJyBpZiB5
b3UgZG9udCB3YW50IHRoaXMgZnVuY3Rpb24uDQo+ICsJICBXaGVuIG5vdCBjb25maWd1cmVkLCAn
WEVOX1NUU0NUTF90YnVmX29wJyBjb21tYW5kIHdpbGwgcmVzdWx0ICdFTk9TWVPigJkuDQoNCkkg
dGhpbmsgdGhpcyB3b3VsZCBsb29rIGJldHRlciBzb21ldGhpbmcgbGlrZSB0aGlzOg0KDQrigJxF
bmFibGUgdHJhY2luZyBpbmZyYXN0cnVjdHVyZeKAnQ0KDQrigJxFbmFibGUgaW4gdHJhY2luZyBp
bmZyYXN0cnVjdHVyZSBhbmQgcHJlLWRlZmluZWQgdHJhY2Vwb2ludHMgd2l0aGluIFhlbi4gIFRo
aXMgd2lsbCBhbGxvdyBsaXZlIGluZm9ybWF0aW9uIGFib3V0IFhlbuKAmXMgZXhlY3V0aW9uIGFu
ZCBwZXJmb3JtYW5jZSB0byBiZSBjb2xsZWN0ZWQgYXQgcnVuIHRpbWUgZm9yIGRlYnVnZ2luZyBv
ciBwZXJmb3JtYW5jZSBhbmFseXNpcy4gIE1lbW9yeSBhbmQgZXhlY3V0aW9uIG92ZXJoZWFkIHdo
ZW4gbm90IGFjdGl2ZSBpcyBtaW5pbWFsLiINCg0KQWxzbywgSeKAmW0gbm90IDEwMCUgZmFtaWxp
YXIgd2l0aCB0aGUga2NvbmZpZyBzeW50YXgg4oCUIEkgdGhpbmsgd2Ugd2FudCB0cmFjaW5nIGVu
YWJsZWQgYnkgZGVmYXVsdCB1bmxlc3MgYWN0aXZlbHkgZGlzYWJsZWQ7IGlzIHRoYXQgd2hhdCB3
aWxsIGhhcHBlbiBoZXJlPyAgT3Igd2lsbCBpdCBvbmx5IGJlIGVuYWJsZWQgaWYgRVhQRVJUID09
IOKAmHnigJk/DQoNCiAtR2VvcmdlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
