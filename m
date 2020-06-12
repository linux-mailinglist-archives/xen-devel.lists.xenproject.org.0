Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1321F7ED5
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2020 00:17:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjryh-0005xm-35; Fri, 12 Jun 2020 22:16:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jjrye-0005xh-Rl
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 22:16:45 +0000
X-Inumbo-ID: 6468cdf4-acfa-11ea-b619-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.65]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6468cdf4-acfa-11ea-b619-12813bfff9fa;
 Fri, 12 Jun 2020 22:16:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SV/iRpbieaTOguu2iIzL0TqHjFVpnD1ZD7ZYC2cqF2KzJezs8cIHUMPxyq/18jQ3HuACa0WQioxpZc9mf9t3ck6+Uu25UZ/xT/7KFuk+HfL5shKVVIucD6Gq7HpFyg42coM21H+a/HuNv6YEuu0NDFSWqKf7DDSU9OWZTwqi1jUYcO/Y/iDmrNdsNqaoBIgfoLgix2IfWrTiJPb/aEF7KSY4TJAO2uT0lZbeubSuZlQRRM+HUgFPqcssb5F/0egZqajX9FjTS8Nc8TGqEyeqL+FdfzK0oW8t5raaaDVmEzWtHuvY4SjnkMvCgJXE10YCphbOefctVIJOSrRSiSAJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp2llx7M4jTT1D7H9z/BnI3QQQ5UWaGGnwXdHkQHQus=;
 b=RPrfuW6AbyY2mUrwhoz9cnE/laZ41djIHnNOcberzRe4fb2Z/RvBqVoTqtuOOnlywboqVZ42NbmDcx7S27U2WRKeuqHSl2UxEBWXM9DjTIJ/Zc83R2nWnaICIdONQIV4cVa7tAIvWg1vWw2EHPFdLv1biIcFgIQjkA2RGWZnfudWalMrQjjSFJyH2L/NRNdK5jf8uQxtxf02Bhxth2KrO2WYqrH+HQnhoPtv4ZpJpaGUM5nDqqUmbJB7GesG6VDoDocfr+WcRjd3i1d8urhA4EPIcrwbmeHGiQ43bL/twWCfKia+p6gJPcgnKGso8fUyf6JHFesGyiUSZhj+RBu55A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp2llx7M4jTT1D7H9z/BnI3QQQ5UWaGGnwXdHkQHQus=;
 b=VpZGBLRp0uiM5qXVixdz+bxOidr/myI+W+GCLSPhuNCN5O/C3Oc03TNDWQUpY+QquniRi6OTF+aqeqKsbalSCRwfd7bKQmgtFkHT8YEnOlvFASAmTSMp6pdQQWc06XH2l+RMrS4ItG3EEPestjXC6zgOH2BX8x1JFq2J0KFyWjftAHKAAoS9RBeXNPaNzXZ/r2JYcxQpjF6rz2+0fcQbmB4XY66+zZgfN8hm1FnXChmg850XWb1X2qUlcb4Rd7e4fe8rmK5Osfjx8oYl7ng5C0Bl9XDlH9OnP7QLdylnxwQ9eTBGwUURhh+ZLnXnlv0Wq2c0DDd9BYBirsQXHA1EHQ==
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB2750.eurprd03.prod.outlook.com
 (2603:10a6:800:e3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 12 Jun
 2020 22:16:38 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3088.025; Fri, 12 Jun 2020
 22:16:38 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Topic: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Index: AQHWQE+Tib/gTK49mk6bUudd1VvXZqjUa0CAgABx3ACAABDmgIAAn6WA
Date: Fri, 12 Jun 2020 22:16:37 +0000
Message-ID: <4ce2fd02329d3fa72f7b43d365056a8029996dbb.camel@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-5-volodymyr_babchuk@epam.com>
 <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
 <1fcd5d89691b775d1230bf3405e29893107edcb3.camel@epam.com>
 <92d81acb-fd78-3483-68fb-f52c7bfb3d65@xen.org>
In-Reply-To: <92d81acb-fd78-3483-68fb-f52c7bfb3d65@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0a9cd00-33a1-444d-7a97-08d80f1e4694
x-ms-traffictypediagnostic: VI1PR0302MB2750:
x-microsoft-antispam-prvs: <VI1PR0302MB2750BC3AE3BF29A6ACA790C7E6810@VI1PR0302MB2750.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8zuE95gai+2n+/CVHJsvDghsat5lb+IRCxoc2K/ZzAJftMUyEcK0WkQ+05bh3aWHvebseqBn2Tgl1VlF5LWE6Cta8uqjyV/LbXvGim0X1Yu8K/sG1tyOoIk3rdl1ZC64k/LpfdSLagrOGtq46XsIPXKJORX4RHh1KVAn4tjyfjBa1ZuOeVkVveda3gVf4lpFHRDchYMoaCuxHajcoYdLV0ieWUrteR+h+Xr4yThmXGllYO2Ip82LrNVhTuxJ5D0ZB9fMB4ca0+ex+VKKc1JF14Kl2Bu8UqslHYxINlPOGeo0RrmfBe8V+szsnw9jKQoiqwEvTv1YIHgRn4Y0g6IUQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(36756003)(6512007)(8936002)(4326008)(66946007)(66446008)(83380400001)(66476007)(110136005)(91956017)(2616005)(64756008)(8676002)(66556008)(76116006)(66574014)(5660300002)(2906002)(71200400001)(86362001)(55236004)(26005)(316002)(6506007)(54906003)(186003)(478600001)(53546011)(7416002)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: EyjWOl5z2WDmL4YQENWD0lqK0FBoU65hurryfU5kT3+0jGydnkho5W+2qSmYwMuVUDxJrQYcvUfgPXJRWIbyWx92CO1CJJ6ddbhlBbW8fxchYtFV4I6zifI3x/bVBNNXWq5CCurZ8mogXs55E1Fokc/O9b7vnHMDpdm85LQ0KUkyGn9Y32o/zlMkI/egSA/mA6bbWSTU+Hy/VIOdGBdu4HhqZVNMLhjUx5juYP1ezn1256XHXMRatmuEslGek0c3lXt4YYh/KFsAdm6WdCxZ6+Mbxn+PvM8iQQuYU9X8cQHvTKroTJydh6VSbWO8rhBdSMb1tl+2anJRqz2mpNmeppo5mdScTUwQSerC+UNwXSlaVurx/kOSeH8w6PMI4fAjJtIA8tS+wQCQncPB5JbUOs1G562nHaFrMbPyblctp5ZaHATU11mRnVRYUM+ffQANlKfpjy8FVtvv+V7zS7Jj+/MtrB2AEBYTyK9g2W0PVe4PwR5RSJO9SiUabBZQtNft
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D682807789A8340979509E7DC1F55F2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a9cd00-33a1-444d-7a97-08d80f1e4694
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 22:16:37.9227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ivICViRzPZq4piAX4F4RkNQRYQoCETR+G+TVp0pqfjLuYicd8J1FMnPzASesZ4Mt8wPIZIfLmP0yJA7pC4oywgjbUDC5AqajJhMtNbKNPz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2750
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLA0KDQpPbiBGcmksIDIwMjAtMDYtMTIgYXQgMTM6NDUgKzAxMDAsIEp1bGllbiBH
cmFsbCB3cm90ZToNCj4gSGkgVm9sb2R5bXlyLA0KPiANCj4gT24gMTIvMDYvMjAyMCAxMjo0NCwg
Vm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+ID4gT24gRnJpLCAyMDIwLTA2LTEyIGF0IDA2OjU3
ICswMjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPiA+ID4gT24gMTIuMDYuMjAgMDI6MjIsIFZv
bG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPiA+ID4gPiBBcyBzY2hlZHVsZXIgY29kZSBub3cgY29s
bGVjdHMgdGltZSBzcGVudCBpbiBJUlEgaGFuZGxlcnMgYW5kIGluDQo+ID4gPiA+IGRvX3NvZnRp
cnEoKSwgd2UgY2FuIHByZXNlbnQgdGhvc2UgdmFsdWVzIHRvIHVzZXJzcGFjZSB0b29scyBsaWtl
DQo+ID4gPiA+IHhlbnRvcCwgc28gc3lzdGVtIGFkbWluaXN0cmF0b3IgY2FuIHNlZSBob3cgc3lz
dGVtIGJlaGF2ZXMuDQo+ID4gPiA+IA0KPiA+ID4gPiBXZSBhcmUgdXBkYXRpbmcgY291bnRlcnMg
b25seSBpbiBzY2hlZF9nZXRfdGltZV9jb3JyZWN0aW9uKCkgZnVuY3Rpb24NCj4gPiA+ID4gdG8g
bWluaW1pemUgbnVtYmVyIG9mIHRha2VuIHNwaW5sb2Nrcy4gQXMgYXRvbWljX3QgaXMgMzIgYml0
IHdpZGUsIGl0DQo+ID4gPiA+IGlzIG5vdCBlbm91Z2ggdG8gc3RvcmUgdGltZSB3aXRoIG5hbm9z
ZWNvbmQgcHJlY2lzaW9uLiBTbyB3ZSBuZWVkIHRvDQo+ID4gPiA+IHVzZSA2NCBiaXQgdmFyaWFi
bGVzIGFuZCBwcm90ZWN0IHRoZW0gd2l0aCBzcGlubG9jay4NCj4gPiA+ID4gDQo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNv
bT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICAgIHhlbi9jb21tb24vc2NoZWQvY29yZS5jICAgICB8
IDE3ICsrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAgIHhlbi9jb21tb24vc3lzY3RsLmMgICAg
ICAgICB8ICAxICsNCj4gPiA+ID4gICAgeGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oIHwgIDQg
KysrLQ0KPiA+ID4gPiAgICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgfCAgMiArKw0KPiA+
ID4gPiAgICA0IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYyBi
L3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+ID4gPiA+IGluZGV4IGE3Mjk0ZmY1YzMuLmVlNmIx
ZDkxNjEgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+ID4g
PiA+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+ID4gPiA+IEBAIC05NSw2ICs5NSwx
MCBAQCBzdGF0aWMgc3RydWN0IHNjaGVkdWxlciBfX3JlYWRfbW9zdGx5IG9wczsNCj4gPiA+ID4g
ICAgDQo+ID4gPiA+ICAgIHN0YXRpYyBib29sIHNjaGVkdWxlcl9hY3RpdmU7DQo+ID4gPiA+ICAg
IA0KPiA+ID4gPiArc3RhdGljIERFRklORV9TUElOTE9DSyhzY2hlZF9zdGF0X2xvY2spOw0KPiA+
ID4gPiArc190aW1lX3Qgc2NoZWRfc3RhdF9pcnFfdGltZTsNCj4gPiA+ID4gK3NfdGltZV90IHNj
aGVkX3N0YXRfaHlwX3RpbWU7DQo+ID4gPiA+ICsNCj4gPiA+ID4gICAgc3RhdGljIHZvaWQgc2No
ZWRfc2V0X2FmZmluaXR5KA0KPiA+ID4gPiAgICAgICAgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQs
IGNvbnN0IGNwdW1hc2tfdCAqaGFyZCwgY29uc3QgY3B1bWFza190ICpzb2Z0KTsNCj4gPiA+ID4g
ICAgDQo+ID4gPiA+IEBAIC05OTQsOSArOTk4LDIyIEBAIHNfdGltZV90IHNjaGVkX2dldF90aW1l
X2NvcnJlY3Rpb24oc3RydWN0IHNjaGVkX3VuaXQgKnUpDQo+ID4gPiA+ICAgICAgICAgICAgICAg
IGJyZWFrOw0KPiA+ID4gPiAgICAgICAgfQ0KPiA+ID4gPiAgICANCj4gPiA+ID4gKyAgICBzcGlu
X2xvY2tfaXJxc2F2ZSgmc2NoZWRfc3RhdF9sb2NrLCBmbGFncyk7DQo+ID4gPiA+ICsgICAgc2No
ZWRfc3RhdF9pcnFfdGltZSArPSBpcnE7DQo+ID4gPiA+ICsgICAgc2NoZWRfc3RhdF9oeXBfdGlt
ZSArPSBoeXA7DQo+ID4gPiA+ICsgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWRfc3Rh
dF9sb2NrLCBmbGFncyk7DQo+ID4gPiANCj4gPiA+IFBsZWFzZSBkb24ndCB1c2UgYSBsb2NrLiBK
dXN0IHVzZSBhZGRfc2l6ZWQoKSBpbnN0ZWFkIHdoaWNoIHdpbGwgYWRkDQo+ID4gPiBhdG9taWNh
bGx5Lg0KPiA+IA0KPiA+IExvb2tzIGxpa2UgYXJtIGRvZXMgbm90IHN1cHBvcnQgNjQgYml0IHZh
cmlhYmxlcy4gPg0KPiA+IEp1bGllbiwgSSBiZWxpZXZlLCB0aGlzIGlzIGFybXY3IGxpbWl0YXRp
b24/IFNob3VsZCBhcm12OCB3b3JrIHdpdGggNjQtDQo+ID4gYml0IGF0b21pY3M/DQo+IA0KPiA2
NC1iaXQgYXRvbWljcyBjYW4gd29yayBvbiBib3RoIEFybXY3IGFuZCBBcm12OCA6KS4gSXQganVz
dCBoYXZlbid0IGJlZW4gDQo+IHBsdW1iZWQgeWV0Lg0KDQpXb3csIGRpZG4ndCBrbm93IHRoYXQg
YXJtdjcgaXMgY2FwYWJsZSBvZiB0aGF0Lg0KDQo+IEkgYW0gaGFwcHkgdG8gd3JpdGUgYSBwYXRj
aCBpZiB5b3UgbmVlZCBhdG9taWM2NF90IG9yIGV2ZW4gYSA2NC1iaXQgDQo+IGFkZF9zaXplZCgp
Lg0KDQpUaGF0IHdvdWxkIGJlIGNvb2wuIENlcnRhaW5seS4gQnV0IGxvb2tzIGxpa2UgeDg2IGNv
ZGUgZG9lcyBub3QgaGF2ZQ0KaW1wbGVtZW50YXRpb24gZm9yIGF0b21pYzY0X3QgYXMgd2VsbC4g
U28sIHRoZXJlIHdvdWxkIGJlIGxvdHMgb2YNCmNoYW5nZXMganVzdCBmb3Igb25lIHVzZSBjYXNl
LiBJIGRvbid0IGtub3cgaWYgaXQgaXMgd29ydGggaXQuDQoNCkxldCdzIGZpbmlzaCBkaXNjdXNz
aW9uIG9mIG90aGVyIHBhcnRzIG9mIHRoZSBzZXJpZXMuIElmIGl0IHdpbGwgYXBwZWFyDQp0aGF0
IGF0b21pYzY0X3QgaXMgYWJzb2x1dGVseSBuZWNlc3NheSwgSSdsbCByZXR1cm4gYmFjayB0byB5
b3UuDQpUaGFua3MgZm9yIG9mZmVyIGFueXdheXMuIA0KDQo=

