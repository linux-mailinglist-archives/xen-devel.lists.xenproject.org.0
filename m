Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536B7BB09C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 11:04:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCKDM-0000fM-GL; Mon, 23 Sep 2019 09:01:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dNMU=XS=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iCKDL-0000fH-06
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 09:00:59 +0000
X-Inumbo-ID: a80682de-dde0-11e9-b299-bc764e2007e4
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::70e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a80682de-dde0-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 09:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+lhY5VftcfnKVRTk2mdA/W8K+jSfoMoZas+xSm43Vc/Rey7bOVz7qhKcwOXFTv4H7NdmwFQ/dM6QI/nDVkmHbXrAO3NbblXi5yzpPyeQaTwW19TBLh5Htc/8LPuax81aHOaQKikokhI+zPHgIOEOC/VDtdklU8H/zFIp6d5TLI8HpTNumz/wd9W4m0GnSVjOEG/dIo+G26B//bFM4z530wzG3WPv+sJYARQTJCEWlMzmsQPahUsQAH/Z3Pn3hlNED9AUGmel/eRePU5TjcJ1t5bQlZBg6TLpUTcqS5twpw29MojjdUtGPPasxektSk5fxfplj6Wy5gBj/IPg8bCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lVOoA9er69sbHdGQBICX6R4TdDfGQyHLlccK/9OQWk=;
 b=O/oKXWDIQlUu29o8cAGHOm10wDgHcbBIknNFAH61ollz6wT3ioN1Fe/ERy9Ve1ztJstkuAKVVvlS+UQI5ocZ+0cWMWG5fEG2T4b10++8CRajc51HsgCwfqVJiUwsTop1ebqrW28kUkSS8k+W8PqaVGg+nvpU3aqVhMlCEBND2fbEIhPPrRPsaLQgRfDrKeqwJ9T1+VSCIkkV/aBIvOkaAvQ3oIPD/1Gh+alFgA1ImwJoRd7iAdaBuW6dpl0GBiNZ46Hg7p0wWM7RMooRWuQuNIC59RAASDyDSkqGj3gjA81qqCvllKdxB5wh6H/UYYVueWppNfH7O7EwBagGdsAAlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lVOoA9er69sbHdGQBICX6R4TdDfGQyHLlccK/9OQWk=;
 b=AuqjFnOGlLgXj1P2lxQlDLH5ZI1GAbQ2IiGy75CoHDRivTxVJWPwJ9Gtjhv4Tpu8c0ZDAiXUdHIrJ5bV8EPqeQbx4748UAA8yeokb/GxTVeT3x4gYD3Y9WUy6CdsEQ80sYS7aJXW0aNzZXtPcGNbI1ndAtHsKFZiyxrWuw16PSQ=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5960.eurprd02.prod.outlook.com (10.141.175.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Mon, 23 Sep 2019 09:00:56 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 09:00:55 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v12] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVb61ItuWfOmtXxUSrWqDa6jVDyqc0nmqAgAA8aoD//9OTgIAETPmA
Date: Mon, 23 Sep 2019 09:00:55 +0000
Message-ID: <c78f3791-3afe-2143-2ab8-75e3a4c1b1a4@bitdefender.com>
References: <20190920121636.2573-1-aisaila@bitdefender.com>
 <8ea5be2f-289f-a291-074a-63f731f2de57@suse.com>
 <a2beaebb-d1ef-9267-0167-65c62b5ab190@bitdefender.com>
 <87157d30-1f99-9fb7-72d0-537d331f7ba1@suse.com>
In-Reply-To: <87157d30-1f99-9fb7-72d0-537d331f7ba1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR07CA0012.eurprd07.prod.outlook.com
 (2603:10a6:205:1::25) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1934028-efd7-4496-1ca3-08d740048b29
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5960; 
x-ms-traffictypediagnostic: AM7PR02MB5960:|AM7PR02MB5960:|AM7PR02MB5960:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB5960BDF901A89047790DF9F1AB850@AM7PR02MB5960.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(39860400002)(376002)(346002)(366004)(199004)(189003)(14444005)(256004)(36756003)(6512007)(186003)(6116002)(3846002)(31686004)(99286004)(6246003)(25786009)(6436002)(229853002)(8676002)(486006)(102836004)(52116002)(26005)(76176011)(4326008)(31696002)(11346002)(81156014)(316002)(54906003)(2616005)(476003)(53546011)(6916009)(6506007)(81166006)(86362001)(5660300002)(6486002)(66476007)(66556008)(64756008)(66446008)(386003)(66946007)(446003)(14454004)(478600001)(305945005)(7736002)(2906002)(66066001)(71190400001)(71200400001)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5960;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Kv1bENrR5Ay2z/evzGi98Wb4kHDYjhCTKPWGbwuy7OmyMchkWmfnpORBjlkPPqzIu4GvYnf2egWEp1lB4twDlSUau5I9cgTHLubZ2UX3cV0NO0rFwO5ZbdxhVjOmN/7+BbYsfkxgGJuhgYlLv6eh3T4biC9DNglvAQ3R8QfrsQ9hJv3cHfn231NIwgYEThT71yxHH8ZYZ1bn8hSlb2RPd3XPoSJJ7S/fVh2TGF7zMi8jyytpnlTLSTK+F36rbc1vQh+kQa5NA9ccXNtrZ8t0rqJHK1J8B2enz/3wK1FAj1wWIRcqpWRfZTpC4yG0mZK/ebSZvlm/gzc/pcfZ9zBHhi1n6OPx0ks74TQ08w5M4n2ot3yRM5TCUF/yr/2Zjpd51mMEGn+n5KW92rcEU9dzTQ/hM+6kA6De+d9Pz4AVKyY=
Content-ID: <1A630FFD85B92240AB29AA23CEC51CB7@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1934028-efd7-4496-1ca3-08d740048b29
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 09:00:55.7560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3jMZp2xOZUy2AJ1z2k6AD//wJP27+vZb0KJ8uOZrWGxZkvt3ZEJ/EnmpoWKjOMz6weKlny3S8IV28j/xRT4dg1k98sELGZIsI9FSkW6THuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5960
Subject: Re: [Xen-devel] [PATCH v12] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDIwLjA5LjIwMTkgMTg6MjAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4wOS4y
MDE5IDE2OjU5LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+DQo+Pg0KPj4gT24g
MjAuMDkuMjAxOSAxNzoyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMjAuMDkuMjAxOSAx
NDoxNiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+IEluIG9yZGVyIHRvIGhh
dmUgX19odm1fY29weSgpIGlzc3VlIH5YODZFTVVMX1JFVFJZIGEgbmV3IHJldHVybiB0eXBlLA0K
Pj4+PiBIVk1UUkFOU19uZWVkX3JldHJ5LCB3YXMgYWRkZWQgYW5kIGFsbCB0aGUgcGxhY2VzIHRo
YXQgY29uc3VtZSBIVk1UUkFOUyoNCj4+Pj4gYW5kIG5lZWRlZCBhZGp1c3RtZW50IHdoZXJlIGNo
YW5nZWQgYWNjb3JkaW5nbHkuDQo+Pj4NCj4+PiBUaGlzIGlzIHdyb25nIGFuZCBoZW5jZSBjb25m
dXNpbmc6IF9faHZtX2NvcHkoKSB3b3VsZCBuZXZlciByZXR1cm4NCj4+PiB+WDg2RU1VTF9SRVRS
WS4gSW4gZmFjdCBJIHRoaW5rIHlvdSd2ZSBjb25mdXNlZCB5b3Vyc2VsZiBlbm91Z2ggdG8NCj4+
PiBtYWtlIGEgcXVlc3Rpb25hYmxlIChwb3NzaWJseSByZXN1bHRpbmcpIGNoYW5nZToNCj4+DQo+
PiBUaGUgaWRlYSB3YXMgdG8gZ2V0IFg4NkVNVUxfUkVUUlkgZG93biB0aGUgbGluZSBmcm9tIF9f
aHZtX2NvcHkoKS4NCj4+IEkgd2lsbCBhZGp1c3QgdGhpcy4NCg0KVGhpcyB3aWxsIGJlIGNoYW5n
ZWQgZm9yOg0KIkEgbmV3IHJldHVybiB0eXBlIHdhcyBhZGRlZCwgSFZNVFJBTlNfbmVlZF9yZXRy
eSwgaW4gb3JkZXIgdG8gaGF2ZSBhbGwgDQp0aGUgcGxhY2VzIHRoYXQgY29uc3VtZSBIVk1UUkFO
UyogcmV0dXJuIFg4NkVNVUxfUkVUUlkuIg0KDQo+Pg0KPj4+DQo+Pj4+IEBAIC01ODIsNyArNTgz
LDcgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKA0KPj4+PiAgICAgICAg
ICAgIEFTU0VSVChtZm5feCgqbWZuKSA9PSAwKTsNCj4+Pj4gICAgDQo+Pj4+ICAgICAgICAgICAg
cmVzID0gaHZtX3RyYW5zbGF0ZV9nZXRfcGFnZShjdXJyLCBhZGRyLCB0cnVlLCBwZmVjLA0KPj4+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwZmluZm8sICZwYWdlLCBO
VUxMLCAmcDJtdCk7DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
JnBmaW5mbywgJnBhZ2UsICZnZm4sICZwMm10KTsNCj4+Pg0KPj4+IFRoaXMgZnVuY3Rpb24gLi4u
DQo+Pj4NCj4+Pj4gICAgICAgICAgICBzd2l0Y2ggKCByZXMgKQ0KPj4+PiAgICAgICAgICAgIHsN
Cj4+Pj4gQEAgLTYwMSw2ICs2MDIsNyBAQCBzdGF0aWMgdm9pZCAqaHZtZW11bF9tYXBfbGluZWFy
X2FkZHIoDQo+Pj4+ICAgIA0KPj4+PiAgICAgICAgICAgIGNhc2UgSFZNVFJBTlNfZ2ZuX3BhZ2Vk
X291dDoNCj4+Pj4gICAgICAgICAgICBjYXNlIEhWTVRSQU5TX2dmbl9zaGFyZWQ6DQo+Pj4+ICsg
ICAgICAgIGNhc2UgSFZNVFJBTlNfbmVlZF9yZXRyeToNCj4+Pg0KPj4+IC4uLiBjYW4ndCByZXR1
cm4gdGhpcyB2YWx1ZSwgc28geW91IHNob3VsZCBvbWl0IHRoaXMgYWRkaXRpb24sDQo+Pj4gbGV0
dGluZyB0aGUgbmV3IHJldHVybiB2YWx1ZSBnbyB0aHJvdWdoICJkZWZhdWx0OiIuDQo+Pg0KPj4g
SXQgaXMgdmVyeSBjbGVhciB0aGF0IEhWTVRSQU5TX25lZWRfcmV0cnkgd2lsbCBub3QgYmUgcmV0
dXJuZWQgZm9ybSB0aGF0DQo+PiBmdW5jdGlvbi4gQXQgbGVhc3QgZm9yIG5vdy4gSSB0aG91Z2h0
IHlvdSB3YW50ZWQgdG8gaGF2ZSBldmVyeSBwb3NzaWJsZQ0KPj4gY2FzZSBjb3ZlcmVkIGluIHRo
ZSBzd2l0Y2guIEkgY2FuIHJlbW92ZSB0aGF0IGNhc2UsIHRoZXJlIGlzIG5vdCBwcm9ibGVtDQo+
PiBoZXJlIGJlY2F1c2UsIGxpa2UgSSd2ZSBzYWlkLCBpdCB3aWxsIG5ldmVyIGVudGVyIHRoYXQg
Y2FzZS4NCj4+DQo+PiBCdXQgYXMgeW91IHNhaWQgbGF0ZXIgd29yayB3aXRoIEhWTVRSQU5TX25l
ZWRfcmV0cnkgd2lsbCByZXN1bHQgaW4NCj4+IHJldHVybmluZyBYODZFTVVMX1JFVFJZLiBBbnkg
d2F5IGl0J3MgeW91ciBjYWxsIGlmIEkgc2hvdWxkIHJlbW92ZSBpdCBvcg0KPj4gbm90Lg0KPiAN
Cj4gVGhlIHJlc3VsdCBzaG91bGQgYmUgY29uc2lzdGVudCAoaS5lLiBiZXR3ZWVuIHRoZSBjYXNl
IGhlcmUNCj4gYW5kIHRoZSByZXBfbW92cyAvIHJlcF9zdG9zIGNhc2VzIGJlbG93KS4gT3ZlcmFs
bCBJIHRoaW5rIGl0DQo+IHdvdWxkIGJlIGNsZWFuZXN0IGlmIGluIGFsbCB0aHJlZSBjYXNlcyBh
biBBU1NFUlRfVU5SRUFDSEFCTEUoKQ0KPiBmZWxsIHRocm91Z2ggdG8gYSAicmV0dXJuIFg4NkVN
VUxfUkVUUlk7Ii4NCj4gDQoNCk9rLCBqdXN0IHRvIG1ha2Ugc3VyZSB0aGlzIGlzIHdoYXQgaXMg
bmVlZGVkIGFuZCBsaW1pdCB0aGUgcGF0Y2ggDQp2ZXJzaW9ucywgcmVwX21vdnMgLyByZXBfc3Rv
cyBzaG91bGQgaGF2ZSBhIHN3aXRjaCBsaWtlIHRoaXM6DQoNCiAgICAgICAgIHN3aXRjaCAoIHJj
ICkNCiAgICAgICAgIHsNCiAgICAgICAgIGNhc2UgSFZNVFJBTlNfb2theToNCiAgICAgICAgICAg
ICByZXR1cm4gWDg2RU1VTF9PS0FZOw0KICAgICAgICAgY2FzZSBIVk1UUkFOU19uZWVkX3JldHJ5
Og0KICAgICAgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KICAgICAgICAgICAgIC8qIGZh
bGwgdGhyb3VnaCAqLw0KICAgICAgICAgY2FzZSBIVk1UUkFOU19nZm5fcGFnZWRfb3V0Og0KICAg
ICAgICAgY2FzZSBIVk1UUkFOU19nZm5fc2hhcmVkOg0KICAgICAgICAgICAgIHJldHVybiBYODZF
TVVMX1JFVFJZOw0KICAgICAgICAgfQ0KDQpUaGVuIGh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKCkg
c2hvdWxkIGhhdmU6DQoNCiAgICAgICAgIGNhc2UgSFZNVFJBTlNfbmVlZF9yZXRyeToNCiAgICAg
ICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCiAgICAgICAgICAgICAvKiBmYWxsIHRocm91
Z2ggKi8NCiAgICAgICAgIGNhc2UgSFZNVFJBTlNfZ2ZuX3NoYXJlZDoNCiAgICAgICAgIGNhc2Ug
SFZNVFJBTlNfZ2ZuX3BhZ2VkX291dDoNCiAgICAgICAgICAgICBlcnIgPSBFUlJfUFRSKH5YODZF
TVVMX1JFVFJZKTsNCg0KDQo+Pj4+IEBAIC0xODUyLDYgKzE4NjQsOCBAQCBzdGF0aWMgaW50IGh2
bWVtdWxfcmVwX21vdnMoDQo+Pj4+ICAgIA0KPj4+PiAgICAgICAgeGZyZWUoYnVmKTsNCj4+Pj4g
ICAgDQo+Pj4+ICsgICAgQVNTRVJUKHJjICE9IEhWTVRSQU5TX25lZWRfcmV0cnkpOw0KPj4+PiAr
DQo+Pj4+ICAgICAgICBpZiAoIHJjID09IEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQgKQ0KPj4+PiAg
ICAgICAgICAgIHJldHVybiBYODZFTVVMX1JFVFJZOw0KPj4+PiAgICAgICAgaWYgKCByYyA9PSBI
Vk1UUkFOU19nZm5fc2hhcmVkICkNCj4+Pj4gQEAgLTE5NjQsNiArMTk3OCw4IEBAIHN0YXRpYyBp
bnQgaHZtZW11bF9yZXBfc3RvcygNCj4+Pj4gICAgICAgICAgICBpZiAoIGJ1ZiAhPSBwX2RhdGEg
KQ0KPj4+PiAgICAgICAgICAgICAgICB4ZnJlZShidWYpOw0KPj4+PiAgICANCj4+Pj4gKyAgICAg
ICAgQVNTRVJUKHJjICE9IEhWTVRSQU5TX25lZWRfcmV0cnkpOw0KPj4+PiArDQo+Pj4+ICAgICAg
ICAgICAgc3dpdGNoICggcmMgKQ0KPj4+PiAgICAgICAgICAgIHsNCj4+Pj4gICAgICAgICAgICBj
YXNlIEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQ6DQo+Pj4NCj4+PiBMb29raW5nIGF0IHRoaXMgYWdh
aW4sIEkgdGhpbmsgaXQgd291bGQgYmV0dGVyIGJlIGFuIGFkZGl0aW9uIHRvDQo+Pj4gdGhlIHN3
aXRjaCgpICh1c2luZyBBU1NFUlRfVU5SRUFDSEFCTEUoKSkuIEdlbmVyYWxseSB0aGlzIGlzDQo+
Pj4gdHJ1ZSBmb3IgdGhlIHJlcF9tb3ZzIGNhc2UgYXMgd2VsbCwgYnV0IHRoYXQgb25lIHdvdWxk
IGZpcnN0DQo+Pj4gbmVlZCBjb252ZXJ0aW5nIHRvIHN3aXRjaCgpLCB3aGljaCBJIGFncmVlIGlz
IGJleW9uZCB0aGUgc2NvcGUNCj4+DQo+PiBJIGFncmVlIHRoYXQgdGhpcyBpcyBiZXlvbmQgdGhl
IHNjb3BlIG9mIHRoaXMgcGF0Y2ggYnV0IGl0J3Mgbm90IHRoYXQNCj4+IGJpZyBvZiBhIGNoYW5n
ZSBhbmQgaXQgY2FuIGJlIGRvbmUuDQo+Pg0KPj4gQnV0IGlzbid0IGhhdmluZyBhIGRlZmF1bHQg
QVNTRVJUX1VOUkVBQ0hBQkxFKCk7IGluIGJvdGggc3dpdGNoIGNhc2VzDQo+PiBjaGFuZ2UgdGhl
IGJlaGF2aW9yIG9mIHRoZSBmdW5jdGlvbj8NCj4gDQo+IEl0IHNob3VsZG4ndCBiZSB0aGUgZGVm
YXVsdCBjYXNlIHRoYXQgZ2FpbnMgdGhpcyBhc3NlcnRpb24sDQo+IGJ1dCB0aGUgSFZNVFJBTlNf
bmVlZF9yZXRyeSBvbmUgdGhhdCBpcyB0byBiZSBhZGRlZC4NCj4gDQo+Pj4gb2YgdGhpcyBjaGFu
Z2UuIEluIGJvdGggY2FzZXMgYSBicmllZiBjb21tZW50IHdvdWxkIHNlZW0NCj4+PiB3b3J0aHdo
aWxlIGFkZGluZywgY2xhcmlmeWluZyB0aGF0IHRoZSBuZXcgcmV0dXJuIHZhbHVlIGNhbg0KPj4+
IHJlc3VsdCBmcm9tIGh2bV9jb3B5XypfZ3Vlc3RfbGluZWFyKCkgb25seS4gVGhpcyBtaWdodCBi
ZWNvbWUNCj4+PiByZWxldmFudCBpbiBwYXJ0aWN1bGFyIGlmLCBkb3duIHRoZSByb2FkLCB3ZSBp
bnZlbnQgbW9yZSBjYXNlcw0KPj4+IHdoZXJlIEhWTVRSQU5TX25lZWRfcmV0cnkgaXMgcHJvZHVj
ZWQuDQo+Pg0KPj4gSXMgdGhpcyBjb21tZW50IGFpbWVkIGZvciB0aGUgY29tbWl0IG1lc3NhZ2Ug
b3IgYW5vdGhlciBwbGFjZT8NCj4gDQo+IElmIHlvdSBnbyB0aGUgQVNTRVJUX1VOUkVBQ0hBQkxF
KCkgcm91dGUsIHRoZW4gdGhlIGNvbW1lbnQocykNCj4gc2hvdWxkIGJlIGNvZGUgY29tbWVudHMg
bmV4dCB0byB0aGVzZSBhc3NlcnRpb25zLiBUaGV5J2QgYmUNCj4gdGhlcmUgdG8gYXZvaWQgcGVv
cGxlIGhhdmluZyB0byBkaWcgb3V0IHRoZSByZWFzb24gZm9yIHdoeQ0KPiB0aGV5J3JlIHRoZXJl
LCB0byBtYWtlIGl0IGVhc3kgdG8gZGVjaWRlIHdoZXRoZXIgaXQgaXMgc2FmZSB0bw0KPiBkcm9w
IHRoZW0gb25jZSBzb21lIG5ldyBwcm9kdWNlciBvZiBIVk1UUkFOU19uZWVkX3JldHJ5IHdvdWxk
DQo+IGFwcGVhci4NCj4gDQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
