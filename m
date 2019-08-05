Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F40881D58
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 15:36:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hud83-0005YX-Hk; Mon, 05 Aug 2019 13:34:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hud81-0005YR-Li
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 13:34:21 +0000
X-Inumbo-ID: b8fd0baa-b785-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b8fd0baa-b785-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 13:34:20 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 13:34:12 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 13:32:46 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 13:32:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYO+2VUJYuikS3J58PNgMlR8si35Hr2BybTV1crGritwWR208ea8hfPB8pyV0u77JQDpZCH6bjoeeqkU8RBsSk4WTz+2W6LUL4ghMWVaXIJ7f0nw1WkEHn9U08jJ8hGjhmMu3IQAn6eUpSusf0zhrkeWslKAvf1h4qfI/F6YNVdd2rfWYjAtH4l8D+EWkDSJH+KTUTtb0r66Jzah54Ogo19eEhAdlIMTltLXnjhrlO2CJ6m6tdZfO9GmMkuCQfeCvTdj5zr485DHfCbtOCsoWrzggiS/t7EDgye4/g6ua6ZO+PgbZI8aDg9Qxg5Lsyx5SxIGevbdzfkRXWZ6N0dKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQuXPml0OzgvqGA+qnqlrqmcNzuZcF5K7ADqGvRfCmA=;
 b=C0pLFdClWPqpjcC+UkshA1eVRU1kg/ciUjYBLMDmkeO36KindMqT/VKb8qlLbN0sEhvEx/QqWOn4Ossn9icvt7YVmUS4itNr6MFEPuQ4i1sXlukKnP1sOERrzf+mTomnqo5oIu0Z7pwKqrlGGomSloRCcxC2jslqrGBfkbk73tuGacrXXqC7i57m6UdszVCnwqDeqf2Lupu9P48nMzc8N3TfUvKIWfuWM1T6vxRsQafUz2J/DxxXf6orNs/KDp3BF83XP6W8v2HsvDQ9ceuepD8RpUkt+aROvgB4FQ3Hvdgf/OtcRFKLDyENIJbwYy9FLqSU61CF6utxiXCA8b9JyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2525.namprd18.prod.outlook.com (20.179.82.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Mon, 5 Aug 2019 13:32:44 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 13:32:44 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] x86/vvmx: Fix nested virt on VMCS-Shadow
 capable hardware
Thread-Index: AQHVRuU3MpytGLjiWki4k1cIRnKVnabsi3qAgAAGLQ6AAAUMgA==
Date: Mon, 5 Aug 2019 13:32:44 +0000
Message-ID: <a0b0b303-5b4c-5e98-57dc-3268b240e8ce@suse.com>
References: <20190730144255.6126-1-andrew.cooper3@citrix.com>
 <61cbc138-7299-5125-34a0-a721c9b29f82@suse.com>
 <a2a225cf-63dd-fecc-274a-50e5e061d9e7@citrix.com>
In-Reply-To: <a2a225cf-63dd-fecc-274a-50e5e061d9e7@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR04CA0127.eurprd04.prod.outlook.com (2603:10a6:207::11)
 To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 501dda7d-4229-44f9-78da-08d719a965b9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2525; 
x-ms-traffictypediagnostic: MN2PR18MB2525:
x-microsoft-antispam-prvs: <MN2PR18MB2525217B04AAFF3FD81AACD9B3DA0@MN2PR18MB2525.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(52314003)(189003)(199004)(4326008)(52116002)(66476007)(102836004)(53546011)(6506007)(386003)(26005)(66446008)(66556008)(66946007)(64756008)(2906002)(316002)(31686004)(446003)(86362001)(6486002)(6512007)(486006)(229853002)(256004)(6436002)(476003)(186003)(2616005)(31696002)(80792005)(14454004)(11346002)(66066001)(53936002)(7736002)(71200400001)(71190400001)(36756003)(5660300002)(478600001)(6246003)(81156014)(99286004)(81166006)(54906003)(76176011)(6116002)(3846002)(305945005)(8676002)(8936002)(25786009)(68736007)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2525;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oKJF7d1/Le0wikhl5cL+RrJn4CuyfRnZJvDtvcR0WxjelN6UKQue9skdBdlPR7JjBcqiPH7BBr1fhCZ+Hrw58cqPzgglNxOahJwgwtHDcXE+nvWKCaiWch/8qQTlc4gTV6lwqLzrTrzu1/ftny6QKW1ZxkMvxgfio60w5IFgTzNeLWdUz5//7nwcWzl3qDW5m98XRF3xlD2kOghX0kqM9G8vkdBvRCXUTKbJ/NINUydB4KwrB/+5ZFVd796c4NwN55SMVEd1ug4Fup0U2KP2Kt99ui6LHmIGAY2LMte/QSwJDXgqBIs0CA8p5Z4M6osWnVwfyOp/bGN6pBGEVKy1k1RPHJEC7iYBBXmlo9FzC4MI6oKcZA3alsl6J3oHFCFdTD5B/ZpOo6opjohP+HuxUIudP9PESpT+na9cFFuMwu0=
Content-ID: <F133DE0337EC8C4EA10C580ABB08DB35@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 501dda7d-4229-44f9-78da-08d719a965b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 13:32:44.4375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2525
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Fix nested virt on VMCS-Shadow
 capable hardware
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxNToxNCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDUvMDgvMjAx
OSAxMzo1MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAzMC4wNy4yMDE5IDE2OjQyLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IGMvcyBlOTk4NmIwZGQgIng4Ni92dm14OiBTaW1wbGlmeSBw
ZXItQ1BVIG1lbW9yeSBhbGxvY2F0aW9ucyIgaGFkIHRoZSB3cm9uZw0KPj4+IGluZGlyZWN0aW9u
IG9uIGl0cyBwb2ludGVyIGNoZWNrIGluIG52bXhfY3B1X3VwX3ByZXBhcmUoKSwgY2F1c2luZyB0
aGUNCj4+PiBWTUNTLXNoYWRvd2luZyBidWZmZXIgbmV2ZXIgYmUgYWxsb2NhdGVkLiAgRml4IGl0
Lg0KPj4+DQo+Pj4gVGhpcyBpbiB0dXJuIHJlc3VsdHMgaW4gYSBtYXNzaXZlIHF1YW50aXR5IG9m
IGxvZ3NwYW0sIGFzIGV2ZXJ5IHZpcnR1YWwNCj4+PiB2bWVudHJ5L2V4aXQgaGl0cyBib3RoIGdk
cHJpbnRrKClzIGluIHRoZSAqX2J1bGsoKSBmdW5jdGlvbnMuDQo+PiBUaGUgImluIHR1cm4iIGhl
cmUgYXBwbGllcyB0byB0aGUgb3JpZ2luYWwgYnVnICh3aGljaCBnZXRzIGZpeGVkIGhlcmUpDQo+
PiBhaXVpLA0KPiANCj4gQ29ycmVjdC4NCj4gDQo+PiAgIGkuZS4gdGhlcmUgaXNuJ3QgYW55IGxv
ZyBzcGFtIHdpdGggdGhlIGZpeCBpbiBwbGFjZSBhbnltb3JlLCBpcw0KPj4gdGhlcmU/DQo+IA0K
PiBJbmNvcnJlY3QsIGJlY2F1c2UuLi4NCj4gDQo+PiAgIElmIHNvLCAuLi4NCj4+DQo+Pj4gU3dp
dGNoIHRoZXNlIHRvIHVzaW5nIHByaW50a19vbmNlKCkuICBUaGUgc2l6ZSBvZiB0aGUgYnVmZmVy
IGlzIGNob3NlbiBhdA0KPj4+IGNvbXBpbGUgdGltZSwgc28gY29tcGxhaW5pbmcgYWJvdXQgaXQg
cmVwZWF0ZWRseSBpcyBvZiBubyBiZW5lZml0Lg0KPj4gLi4uIEknbSBub3Qgc3VyZSBJJ2QgYWdy
ZWUgd2l0aCB0aGlzIG1vdmU6IFdoeSB3b3VsZCBpdCBiZSBvZiBpbnRlcmVzdA0KPj4gb25seSB0
aGUgZmlyc3QgdGltZSB0aGF0IHdlICh3b3VsZCBoYXZlKSBvdmVycnVuIHRoZSBidWZmZXI/DQo+
IA0KPiAuLi4gd2Ugd2lsbCBlaXRoZXIgbmV2ZXIgb3ZlcnJ1biBpdCwgb3Igb3ZlcnJ1biBpdCBv
biBldmVyeSB2aXJ0dWFsDQo+IHZtZW50cnkvZXhpdC4NCj4gDQo+PiBBZnRlciBhbGwNCj4+IGl0
J3Mgbm90IG9ubHkgdGhlIGNvbXBpbGUgdGltZSBjaG9pY2Ugb2YgYnVmZmVyIHNpemUgdGhhdCBt
YXR0ZXJzIGhlcmUsDQo+PiBidXQgYWxzbyB0aGUgcnVudGltZSBhc3BlY3Qgb2Ygd2hhdCB2YWx1
ZSAibiIgaGFzIGdvdCBwYXNzZWQgaW50byB0aGUNCj4+IGZ1bmN0aW9ucy4NCj4gDQo+IFRoZSBm
ZXcgY2hvaWNlcyBvZiAibiIgYXJlIGZpeGVkIGF0IGNvbXBpbGUgdGltZSBhcyB3ZWxsLCB3aGlj
aCBpcyB3aHkuLi4NCg0KT2ggLSBJIHNob3VsZCBoYXZlIGxvb2tlZCBhdCB0aGUgY2FsbGVycy4g
SXQncyBhbGwgQVJSQVlfU0laRSgpLA0KaW5kZWVkLg0KDQo+PiBJZiB0aGlzIGlzIG9uIHRoZSBh
c3N1bXB0aW9uIHRoYXQgd2UnZCB3YW50IHRvIGtub3cgbWVyZWx5DQo+PiBvZiB0aGUgZmFjdCwg
bm90IGhvdyBvZnRlbiBpdCBvY2N1cnMsIHRoZW4gSSdkIHRoaW5rIHRoaXMgb3VnaHQgdG8NCj4+
IHJlbWFpbiBhIGRlYnVnZ2luZyBwcmludGsoKS4NCj4gDQo+IC4uLiB0aGlzIHN0aWxsIGVuZHMg
dXAgYXMgYSBjb21wbGV0ZWx5IHVudXNhYmxlIHN5c3RlbSwgd2hlbiB0aGUgcHJvYmxlbQ0KPiBv
Y2N1cnMuDQo+IA0KPj4NCj4+PiBGaW5hbGx5LCBkcm9wIHRoZSBydW50aW1lIE5VTEwgcG9pbnRl
ciBjaGVja3MuICBJdCBpcyBub3QgdGVycmlibHkgYXBwcm9wcmlhdGUNCj4+PiB0byBiZSByZXBl
YXRlZGx5IGNoZWNraW5nIGluZnJhc3RydWN0dXJlIHdoaWNoIGlzIHNldCB1cCBmcm9tIHN0YXJ0
LW9mLWRheSwNCj4+PiBhbmQgaW4gdGhpcyBjYXNlLCBhY3R1YWxseSBoaWQgdGhlIGFib3ZlIGJ1
Zy4NCj4+IEkgZG9uJ3Qgc2VlIGhvdyB0aGUgcmVwZWF0ZWQgY2hlY2tpbmcgd291bGQgaGF2ZSBo
aWRkZW4gYW55IGJ1ZzoNCj4gDQo+IFdpdGhvdXQgdGhpcyBjaGVjaywgWGVuIHdvdWxkIGhhdmUg
Y3Jhc2hlZCB3aXRoIGEgTlVMTCBkZWZlcmVuY2Ugb24gdGhlDQo+IG9yaWdpbmFsIGNoYW5nZSwg
YW5kIGhpZ2hsaWdodGVkIHRoZSBmYWN0IHRoYXQgdGhlIGNoYW5nZSB3YXMgdG90YWxseQ0KPiBi
cm9rZW4uDQo+IA0KPiBJIGRpZG4ndCBzcG90IHRoZSBpc3N1ZSBiZWNhdXNlIGl0IHdhcyB0ZXN0
ZWQgd2l0aCBhIHJlbGVhc2UgYnVpbGQsDQo+IHdoaWNoIGlzIGFub3RoZXIgcmVhc29uIHdoeSB0
aGUgcmVwbGFjZW1lbnQgcHJpbnRrKCkgaXMgZGVsaWJlcmF0ZWx5IG5vdA0KPiBhIGRlYnVnLXRp
bWUtb25seS4NCg0KVGFraW5nIHRoaXMgYXMgYSBiYXNpcywgdGhlcmUgc2hvdWxkbid0IGJlIGFu
eSBkZWJ1Zy1vbmx5IHByaW50aygpcy4NCg0KQW55d2F5LCB3aXRoIHlvdXIgZXhwbGFuYXRpb25z
DQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpKYW4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
