Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58C673155
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 16:15:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqHzw-0006sw-FB; Wed, 24 Jul 2019 14:12:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqHzv-0006se-9X
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 14:12:03 +0000
X-Inumbo-ID: 0037de42-ae1d-11e9-8c94-5b50874e1ec7
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0037de42-ae1d-11e9-8c94-5b50874e1ec7;
 Wed, 24 Jul 2019 14:11:59 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 14:11:46 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 14:06:12 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 14:06:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3IL3lWedBKt0wH6lIKUBurm2wYXlvXmJBchZYi/ts/fRrl5JZrewE/clG2Ygx5TqkukNZDiztgo1Lq59JrWBn1zAJJVmtAuVcFaz+7bpy7o3lOoDPBRCvLFgodkVlcCC7t8W62E1jX+7JJUyKSXynomgRLB8rb9iuPeDQBQ6Axw8OGMIAUOPkwriUtbMAAI2nNpJNtBB0rURwGULcm9RyVmHNcj0v9fKnBlvl9ZNnGzk0hH6+y7r6vX9SkhxyWKnmYlt3QNBnqdZ/1HtdrCnqo9M/3pGzu6R5KG55P1gEpOxd8Yjk25JY+xWd3OG7uif+JYzxn7AZWe1T629fz7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKJGxYSpCwQ5/NyJMX8geSJQScay0MSQrolK3+KxssE=;
 b=aHqcvCStNrAVVuAlyL3hVau7CZblDpRCuWq/itiE68C04fcGj2HhcjjEptfmhLaeqve0d/AnJoPrpC3ILLmYBUainEEOamgo0R+Ybii7eCyp3talMkHD6ogrNbqn7TjMsguE66TN8zPWBcgQB99aneIlDiUu9Kw5jGu9hG28NZK/jZYz2XirZzsxP8tLMIcY0dkTVt9cXCbq/cp9F7eg/CR7XG13f3kW6kgKvzq/4gEI5nVQy3wV3blHOxk5Z0kt07z18fLz2qGKX7QTcE8KxoHc85XipkwIER62Sz/8EpwVHMWUDIwKweswW2jIQpswNKpO2fAY2FR1DcaFFn/CeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3393.namprd18.prod.outlook.com (10.255.136.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 14:06:10 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 14:06:10 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v3 2/4] pci: add all-device iterator function...
Thread-Index: AQHVO7+yNsFNse543kGfqtt62Z3aUabZ2l0A
Date: Wed, 24 Jul 2019 14:06:10 +0000
Message-ID: <35421103-80f4-8947-6430-3e0dc56ea9c5@suse.com>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
 <20190716101657.23327-3-paul.durrant@citrix.com>
In-Reply-To: <20190716101657.23327-3-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P18901CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:4:16::22) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8636f9ab-e89d-4b51-e7df-08d710401458
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3393; 
x-ms-traffictypediagnostic: BY5PR18MB3393:
x-microsoft-antispam-prvs: <BY5PR18MB3393BDC32AB2A0F373D25524B3C60@BY5PR18MB3393.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(52314003)(189003)(199004)(66556008)(66446008)(66476007)(256004)(6486002)(25786009)(66946007)(446003)(64756008)(14444005)(7736002)(305945005)(2906002)(31696002)(229853002)(5660300002)(80792005)(86362001)(71200400001)(71190400001)(6916009)(6512007)(6436002)(81156014)(7416002)(31686004)(99286004)(66066001)(8676002)(26005)(6116002)(486006)(316002)(54906003)(386003)(6246003)(476003)(36756003)(11346002)(102836004)(14454004)(53546011)(53936002)(68736007)(52116002)(6506007)(81166006)(186003)(478600001)(3846002)(2616005)(4326008)(76176011)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3393;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FoRPYwCpRU/f1U4UtlWcQTyZWui7XZxtsvGfG5xQ+CJsCLAjSkvnbWBAuho0skg+tREUBG6/eVEo4KEeu+1jBjsYAlAFGdXWkh+ryWwpF0XdtpA9anW7tS8SQC2/Y/UvLChODBLqAXvoxHPlwa5D4xVu4HU/z9HcLDZzinwSMScxDUwRYyNsG2kcpyFZ8G0ZOGAwjQKhbNbpqS2GEAM4349mY4aKxYaM2rGMpoXlSieGgcMDF3cjgqvzv8wgFKinaAfw2fAiJBS29w1WElJH2arlWJsCjYp4uG4FtgLY6zCAhJwX8HXHxr/X+aRcLwU3tjNuLnfSLvufP3nfBFnMS10xeNH/aZ8ARcEUw3DfHsAI/mFq0QDnzP+I4BD/Tlj2o/2Nx3zTtO6ZcAJds4Xr5mvf5IfEHGlbCmFzHLDEh5c=
Content-ID: <51A127EA9C5CCF41ABEB5ABE2E03F6BF@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8636f9ab-e89d-4b51-e7df-08d710401458
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 14:06:10.2875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3393
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 2/4] pci: add all-device iterator
 function...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxMjoxNiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAuLi5hbmQgdXNlIGl0
IGZvciBzZXR1cF9od2RvbV9wY2lfZGV2aWNlcygpIGFuZCBkdW1wX3BjaV9kZXZpY2VzKCkuDQo+
IA0KPiBUaGUgdW5sb2NrL3Byb2Nlc3MtcGVuZGluZy1zb2Z0aXJxcy9sb2NrIHNlcXVlbmNlIHRo
YXQgd2FzIGluDQo+IF9zZXR1cF9od2RvbV9wY2lfZGV2aWNlcygpIGlzIG5vdyBkb25lIGluIHRo
ZSBnZW5lcmljIGl0ZXJhdG9yIGZ1bmN0aW9uLA0KPiB3aGljaCBkb2VzIG1lYW4gaXQgaXMgYWxz
byBkb25lICh1bm5lY2Vzc2FyaWx5KSBpbiB0aGUgY2FzZSBvZg0KPiBkdW1wX3BjaV9kZXZpY2Vz
KCksIHNpbmNlIHJ1bl9hbGxfbm9uaXJxX2tleWhhbmRsZXJzKCkgd2lsbCBjYWxsDQo+IHByb2Nl
c3NfcGVuZGluZ19zb2Z0aXJxcygpIGJlZm9yZSBpbnZva2luZyBlYWNoIGtleSBoYW5kbGVyIGFu
eXdheSwgYnV0DQo+IHRoaXMgaXMgbm90IHBlcmZvcm1hbmNlIGNyaXRpY2FsIGNvZGUuDQo+IA0K
PiBUaGUgIj09PT0gc2VnbWVudCBYWFhYID09PT0iIGhlYWRsaW5lIHRoYXQgd2FzIGluIF9kdW1w
X3BjaV9kZXZpY2VzKCkgaGFzDQo+IGJlZW4gZHJvcHBlZCBiZWNhdXNlIGl0IGlzIG5vbi10cml2
aWFsIHRvIGRlYWwgd2l0aCBpdCB3aGVuIHVzaW5nIGENCj4gZ2VuZXJpYyBhbGwtZGV2aWNlIGl0
ZXJhdG9yIGFuZCwgc2luY2UgdGhlIHNlZ21lbnQgbnVtYmVyIGlzIGluY2x1ZGVkDQo+IGluIGV2
ZXJ5IGxvZyBsaW5lIGFueXdheSwgaXQgZGlkbid0IGFkZCBtdWNoIHZhbHVlIGFueXdheS4NCg0K
Rm9yIG92ZXJhbGwgb3V0cHV0IHZvbHVtZSBpdCB3b3VsZCBwZXJoYXBzIGJlIGJldHRlciB0byBo
YXZlIHRoZQ0KaGVhZGxpbmUgYW5kIGRyb3AgdGhlIHJlZHVuZGFuY3kgb24gZXZlcnkgbGluZS4g
QnV0IHRoYXQncyBqdXN0IGENCnNpZGUgbm90ZSwgbm90IHNvbWV0aGluZyBJIGV4cGVjdCB5b3Ug
dG8gY2hhbmdlLg0KDQo+ICtzdGF0aWMgaW50IHBjaV9zZWdtZW50X2RldmljZXNfaXRlcmF0ZShz
dHJ1Y3QgcGNpX3NlZyAqcHNlZywgdm9pZCAqYXJnKQ0KPiArew0KPiArICAgIHN0cnVjdCBwc2Rp
X2N0eHQgKmN0eHQgPSBhcmc7DQo+ICsgICAgdW5zaWduZWQgaW50IGJ1cywgZGV2Zm47DQo+ICsg
ICAgaW50IHJjID0gMDsNCj4gKw0KPiArICAgIC8qDQo+ICsgICAgICogV2UgZG9uJ3QgaXRlcmF0
ZSBieSB3YWxraW5nIHBzZWctPmFsbGRldnNfbGlzdCBoZXJlIGJlY2F1c2UgdGhhdA0KPiArICAg
ICAqIHdvdWxkIG1ha2UgdGhlIHBjaWRldnNfdW5sb2NrKCkvbG9jaygpIHNlcXVlbmNlIGJlbG93
IHVuc2FmZS4NCj4gKyAgICAgKi8NCj4gKyAgICBmb3IgKCBidXMgPSAwOyAhcmMgJiYgYnVzIDwg
MjU2OyBidXMrKyApDQo+ICsgICAgICAgIGZvciAoIGRldmZuID0gMDsgIXJjICYmIGRldmZuIDwg
MjU2OyBkZXZmbisrICkNCj4gICAgICAgICAgIHsNCj4gICAgICAgICAgICAgICBzdHJ1Y3QgcGNp
X2RldiAqcGRldiA9IHBjaV9nZXRfcGRldihwc2VnLT5uciwgYnVzLCBkZXZmbik7DQo+ICAgDQo+
ICAgICAgICAgICAgICAgaWYgKCAhcGRldiApDQo+ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Ow0KPiAgIA0KPiAtICAgICAgICAgICAgaWYgKCAhcGRldi0+ZG9tYWluICkNCj4gLSAgICAgICAg
ICAgIHsNCj4gLSAgICAgICAgICAgICAgICBwZGV2LT5kb21haW4gPSBjdHh0LT5kOw0KPiAtICAg
ICAgICAgICAgICAgIGxpc3RfYWRkKCZwZGV2LT5kb21haW5fbGlzdCwgJmN0eHQtPmQtPnBkZXZf
bGlzdCk7DQo+IC0gICAgICAgICAgICAgICAgc2V0dXBfb25lX2h3ZG9tX2RldmljZShjdHh0LCBw
ZGV2KTsNCj4gLSAgICAgICAgICAgIH0NCj4gLSAgICAgICAgICAgIGVsc2UgaWYgKCBwZGV2LT5k
b21haW4gPT0gZG9tX3hlbiApDQo+IC0gICAgICAgICAgICB7DQo+IC0gICAgICAgICAgICAgICAg
cGRldi0+ZG9tYWluID0gY3R4dC0+ZDsNCj4gLSAgICAgICAgICAgICAgICBzZXR1cF9vbmVfaHdk
b21fZGV2aWNlKGN0eHQsIHBkZXYpOw0KPiAtICAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiA9
IGRvbV94ZW47DQo+IC0gICAgICAgICAgICB9DQo+IC0gICAgICAgICAgICBlbHNlIGlmICggcGRl
di0+ZG9tYWluICE9IGN0eHQtPmQgKQ0KPiAtICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0df
V0FSTklORyAiRG9tJWQgb3duaW5nICUwNHg6JTAyeDolMDJ4LiV1P1xuIiwNCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLT5kb21haW5faWQsIHBzZWctPm5yLCBidXMsDQo+
IC0gICAgICAgICAgICAgICAgICAgICAgIFBDSV9TTE9UKGRldmZuKSwgUENJX0ZVTkMoZGV2Zm4p
KTsNCj4gLQ0KPiAtICAgICAgICAgICAgaWYgKCBpb21tdV92ZXJib3NlICkNCj4gLSAgICAgICAg
ICAgIHsNCj4gLSAgICAgICAgICAgICAgICBwY2lkZXZzX3VubG9jaygpOw0KPiAtICAgICAgICAg
ICAgICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpOw0KPiAtICAgICAgICAgICAgICAgIHBj
aWRldnNfbG9jaygpOw0KPiAtICAgICAgICAgICAgfQ0KPiAtICAgICAgICB9DQo+ICsgICAgICAg
ICAgICByYyA9IGN0eHQtPmNiKHBkZXYsIGN0eHQtPmFyZyk7DQo+ICAgDQo+IC0gICAgICAgIGlm
ICggIWlvbW11X3ZlcmJvc2UgKQ0KPiAtICAgICAgICB7DQo+ICsgICAgICAgICAgICAvKg0KPiAr
ICAgICAgICAgICAgICogRXJyIG9uIHRoZSBzYWZlIHNpZGUgYW5kIGFzc3VtZSB0aGUgY2FsbGJh
Y2sgaGFzIHRha2VuDQo+ICsgICAgICAgICAgICAgKiBhIHNpZ25pZmljYW50IGFtb3VudCBvZiB0
aW1lLg0KPiArICAgICAgICAgICAgICovDQo+ICAgICAgICAgICAgICAgcGNpZGV2c191bmxvY2so
KTsNCj4gICAgICAgICAgICAgICBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKTsNCj4gICAgICAg
ICAgICAgICBwY2lkZXZzX2xvY2soKTsNCg0KVGhpcyBiZWhhdmlvciBpcyBub3QgZ2VuZXJhbGx5
IGFjY2VwdGFibGUgdG8gYW4gYXJiaXRyYXJ5IGNhbGxlci4NClRoZXJlZm9yZSBJIHRoaW5rIGEg
cHJvbWluZW50IG5vdGljZSBpcyBuZWVkZWQgYXQgdGhlIHRvcCBvZiB0aGUNCmZ1bmN0aW9uLg0K
DQpFdmVuIHdvcnNlLCB0aGUgbGF0ZXN0IHBvc3QtYm9vdCBhbmQgb3V0c2lkZSBvZiBkZWJ1Zy1r
ZXkgaGFuZGxpbmcNCnRoaXMgaXNuJ3Qgc2FmZSBhdCBhbGw6IFlvdSdkIGhhdmUgdG8gcmUtY2hl
Y2sgdGhhdCBwc2VnIGhhc24ndA0KZ29uZSBhd2F5ICh0aGlzIGNhbid0IGhhcHBlbiByaWdodCBu
b3csIGJ1dCBpc24ndCBpbXBvc3NpYmxlIGluDQpwcmluY2lwbGUpLCBhbmQgbW9yZSBnZW5lcmFs
bHkgdGhhdCB0aGUgcHNlZyB0cmVlIGhhc24ndCBjaGFuZ2VkLg0KU2luY2UgdGhpcyB3b3VsZCBi
ZSBhIGxpdHRsZSBkaWZmaWN1bHQgdG8gYXJyYW5nZSwgSSB0aGluayBkb2luZw0Kc28gd291bGQg
YmV0dGVyIGJlIGxlZnQgdG8gdGhlIGNhbGxiYWNrLCBvciBiZSBjb250cm9sbGVkIGJ5IGFuDQpl
eHRyYSBhcmd1bWVudCBwYXNzZWQgdG8gcGNpX3BkZXZzX2l0ZXJhdGUoKSAoaW4gYm90aCBjYXNl
cw0KZWxpbWluYXRpbmcgdGhlIG5lZWQgZm9yIGEgcHJvbWluZW50IHdhcm5pbmcgYXQgdGhlIHRv
cCBvZiB0aGUNCmZ1bmN0aW9uKS4NCg0KPiBAQCAtMTI5NCwyNCArMTMxNywxOCBAQCBib29sX3Qg
cGNpZV9hZXJfZ2V0X2Zpcm13YXJlX2ZpcnN0KGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0K
PiAgfQ0KPiAgI2VuZGlmDQo+ICANCj4gLXN0YXRpYyBpbnQgX2R1bXBfcGNpX2RldmljZXMoc3Ry
dWN0IHBjaV9zZWcgKnBzZWcsIHZvaWQgKmFyZykNCj4gK3N0YXRpYyBpbnQgZHVtcF9wY2lfZGV2
aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB2b2lkICphcmcpDQo+ICB7DQo+IC0gICAgc3RydWN0
IHBjaV9kZXYgKnBkZXY7DQo+ICAgICAgc3RydWN0IG1zaV9kZXNjICptc2k7DQo+ICAgDQo+IC0g
ICAgcHJpbnRrKCI9PT09IHNlZ21lbnQgJTA0eCA9PT09XG4iLCBwc2VnLT5ucik7DQo+IC0NCj4g
LSAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggcGRldiwgJnBzZWctPmFsbGRldnNfbGlzdCwgYWxs
ZGV2c19saXN0ICkNCj4gLSAgICB7DQo+IC0gICAgICAgIHByaW50aygiJTA0eDolMDJ4OiUwMngu
JXUgLSBkb20gJS0zZCAtIG5vZGUgJS0zZCAtIE1TSXMgPCAiLA0KPiAtICAgICAgICAgICAgICAg
cHNlZy0+bnIsIHBkZXYtPmJ1cywNCj4gLSAgICAgICAgICAgICAgIFBDSV9TTE9UKHBkZXYtPmRl
dmZuKSwgUENJX0ZVTkMocGRldi0+ZGV2Zm4pLA0KPiAtICAgICAgICAgICAgICAgcGRldi0+ZG9t
YWluID8gcGRldi0+ZG9tYWluLT5kb21haW5faWQgOiAtMSwNCj4gLSAgICAgICAgICAgICAgIChw
ZGV2LT5ub2RlICE9IE5VTUFfTk9fTk9ERSkgPyBwZGV2LT5ub2RlIDogLTEpOw0KPiAtICAgICAg
ICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggbXNpLCAmcGRldi0+bXNpX2xpc3QsIGxpc3QgKQ0KPiAt
ICAgICAgICAgICAgICAgcHJpbnRrKCIlZCAiLCBtc2ktPmlycSk7DQo+IC0gICAgICAgIHByaW50
aygiPlxuIik7DQo+IC0gICAgfQ0KPiArICAgIHByaW50aygiJTA0eDolMDJ4OiUwMnguJXUgLSBk
b20gJS0zZCAtIG5vZGUgJS0zZCAtIE1TSXMgPCAiLA0KPiArICAgICAgICAgICBwZGV2LT5zZWcs
IHBkZXYtPmJ1cywgUENJX1NMT1QocGRldi0+ZGV2Zm4pLA0KPiArICAgICAgICAgICBQQ0lfRlVO
QyhwZGV2LT5kZXZmbiksDQo+ICsgICAgICAgICAgIHBkZXYtPmRvbWFpbiA/IHBkZXYtPmRvbWFp
bi0+ZG9tYWluX2lkIDogLTEsDQo+ICsgICAgICAgICAgIChwZGV2LT5ub2RlICE9IE5VTUFfTk9f
Tk9ERSkgPyBwZGV2LT5ub2RlIDogLTEpOw0KPiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCBt
c2ksICZwZGV2LT5tc2lfbGlzdCwgbGlzdCApDQo+ICsgICAgICAgIHByaW50aygiJWQgIiwgbXNp
LT5pcnEpOw0KPiArICAgIHByaW50aygiPlxuIik7DQo+ICANCj4gICAgICByZXR1cm4gMDsNCj4g
IH0NCg0KU2VlaW5nIHRoaXMgY29kZSBJIGRvbid0IHRoaW5rIGl0IHdvdWxkIGJlIGRpZmZpY3Vs
dCB0byBhcnJhbmdlIGZvcg0KdGhlIGhlYWQgbGluZSB0byBiZSBsb2dnZWQgd2hlbmV2ZXIgdGhl
IHNlZ21lbnQgY2hhbmdlcy4gWW91IGRvbid0DQp1c2UgImFyZyIgcmlnaHQgbm93LCBhZnRlciBh
bGwsIHdoaWNoIGNvdWxkIHBvaW50IHRvIGEgbG9jYWwNCnZhcmlhYmxlIC4uLg0KDQo+IEBAIC0x
MzE5LDkgKzEzMzYsNyBAQCBzdGF0aWMgaW50IF9kdW1wX3BjaV9kZXZpY2VzKHN0cnVjdCBwY2lf
c2VnICpwc2VnLCB2b2lkICphcmcpDQo+ICBzdGF0aWMgdm9pZCBkdW1wX3BjaV9kZXZpY2VzKHVu
c2lnbmVkIGNoYXIgY2gpDQo+ICB7DQo+ICAgICAgcHJpbnRrKCI9PT09IFBDSSBkZXZpY2VzID09
PT1cbiIpOw0KPiAtICAgIHBjaWRldnNfbG9jaygpOw0KPiAtICAgIHBjaV9zZWdtZW50c19pdGVy
YXRlKF9kdW1wX3BjaV9kZXZpY2VzLCBOVUxMKTsNCj4gLSAgICBwY2lkZXZzX3VubG9jaygpOw0K
PiArICAgIHBjaV9wZGV2c19pdGVyYXRlKGR1bXBfcGNpX2RldmljZSwgTlVMTCk7DQoNCi4uLiBo
ZXJlLCBpbml0aWFsaXplZCB0byBlLmcuIFVJTlRfTUFYLg0KDQpKYW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
