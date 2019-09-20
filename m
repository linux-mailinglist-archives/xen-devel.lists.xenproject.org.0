Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1400B93A5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 17:03:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBKNL-0006EA-LO; Fri, 20 Sep 2019 14:59:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ihh=XP=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iBKNK-0006E5-Iu
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 14:59:10 +0000
X-Inumbo-ID: 32dde748-dbb7-11e9-a337-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::712])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32dde748-dbb7-11e9-a337-bc764e2007e4;
 Fri, 20 Sep 2019 14:59:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/mmTDNMuOb1f5N+pU9a2QhT0jjahm0U/DF6APgaUvu0i4C71QtL7hCWQuN8ive/0FIk0D83sU1tEZWbH58NqtygiQEIRtAZrdY9J8CpJTe33oBR7yEBYmWBvslWZsYcygUO09CBWEiE8QVPUB1J8Ljr0BN11Vbv8USZuK4N5vEqvskni273/IyHPjYcV5HHHSvxKPrZgmBKgRMAdWSGjxsmv05Ed9Zgq5eO766o5fzlZxcRhKpFkhKtbYj4TASNu/TcQf7l7cGuhflTnzT/83SgjUt523oxwmpqh3qPSaqhlhSPEb8QbQ96RmRH5k6evgR3kpv5Nca9UV1QPBuaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2W8jOy23Gm90mxwGAMp8Y34qhHyzmDmbqet3Ebe1Qs=;
 b=Nzs65mLjGU0hkQBPD9djurYhGC/Vmk9lV/PoiPB2s7uOGdSNaQt+Egw9YMI7g0/GxTz3tkW8M15NZlx0wYrrC6pRraDJu5j8rVQ9mzYRzdo1b1LXoS/M9SGR7ZYubD/qvBykdHy8pwHBfxKsG7fiF+CUjf6blLorHnnEs5I/FHclnHLj18lrq6L2iZCs/e/Ovr3GedjBJtZr8IPjgNnkw5GTo3HSp8XnM8lBxh69TJWgfeO9ZjaxwKf2amAmaKuX7xFh9ICyuTswnHo+kEb2VdrHQBbnx/UC65IrkJv4BcyFcGMtoxI1+UxkrSIKpup8o0nMJLfH6QSfLtId2fqlHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2W8jOy23Gm90mxwGAMp8Y34qhHyzmDmbqet3Ebe1Qs=;
 b=kPc9HpUIh5sZoMCIFu3zev7H5B+7zyf+Z+ioQPfFs9YH5s20lQE99nwC8E0Cw4v7ebf4FLx6jE1R2g+R0YsG0TvfI4lwbK4PZ47fAYLuVICAfBWdUjLGYrws7R7wYHVUkNxGoxddTF349gYQaAkD188ic/LhzoGerN3dtUqkhIQ=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5927.eurprd02.prod.outlook.com (10.141.174.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 20 Sep 2019 14:59:08 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2284.023; Fri, 20 Sep 2019
 14:59:08 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v12] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVb61ItuWfOmtXxUSrWqDa6jVDyqc0nmqAgAAKH4A=
Date: Fri, 20 Sep 2019 14:59:08 +0000
Message-ID: <a2beaebb-d1ef-9267-0167-65c62b5ab190@bitdefender.com>
References: <20190920121636.2573-1-aisaila@bitdefender.com>
 <8ea5be2f-289f-a291-074a-63f731f2de57@suse.com>
In-Reply-To: <8ea5be2f-289f-a291-074a-63f731f2de57@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0023.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::35)
 To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2387d68c-2bdd-4c77-84d3-08d73ddb166e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5927; 
x-ms-traffictypediagnostic: AM7PR02MB5927:|AM7PR02MB5927:|AM7PR02MB5927:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB5927A53CAB0E738DCC8E4B53AB880@AM7PR02MB5927.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(136003)(396003)(346002)(366004)(189003)(199004)(478600001)(71190400001)(86362001)(71200400001)(25786009)(256004)(14444005)(66476007)(66556008)(66946007)(31686004)(14454004)(31696002)(66446008)(64756008)(4326008)(316002)(54906003)(6916009)(305945005)(6116002)(3846002)(52116002)(99286004)(2906002)(5660300002)(486006)(6486002)(229853002)(6436002)(36756003)(6512007)(6246003)(26005)(11346002)(446003)(53546011)(6506007)(386003)(76176011)(102836004)(186003)(2616005)(476003)(66066001)(81166006)(81156014)(8936002)(7736002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5927;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OBKIyuU4dIcfEEREjVU/SKbUU25RlmEplKpm/WtomUgv0hrPmmoTkL+hQ4khiG20gtFvLUCTxCatwMaNTisOqq07eHDJ2IPdi+ZMmWYS5XrHVP5wPCEzGT2LklJTXInzLkWpmHDltH0zezfvWoOwgyQHWnYQgo+JDhrMTuqjV15UmvLv52vrwcbF/RDexaKRmoULPuHO8ej/44QQ+dL+gmjUo/QN3CFDLgElugmXsoHjIPpXrhLdATVLo/TUFoAUxb3Knzfn15e2dWJMw4tBXhkQrWUcznygleRdkW4DdNFTrc7zAv/0g5bWSbqxG30mN6W0/C1NExVKQNujQyhXJ5n367KbvP0db99bKxuLtmsU3ryT4cUPbnOj4zG+dEr9tFhxA2eJYlVGtAK5IbS5G9i3d+jMyqwZyEad9UwIOn8=
Content-ID: <75C9BF877230044995492BD0ED417E32@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2387d68c-2bdd-4c77-84d3-08d73ddb166e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 14:59:08.1349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0iItjxQzH6IzHE7a3jOxFSZhf7r+cn1O2NtfIHBzCLWDgA8nVBZMvNXT06islmRMWgcuYEzVQULOsRnk2fZe9xWcsQvprBGIeMPfZ1wiZSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5927
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

DQoNCk9uIDIwLjA5LjIwMTkgMTc6MjIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4wOS4y
MDE5IDE0OjE2LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IEluIG9yZGVyIHRv
IGhhdmUgX19odm1fY29weSgpIGlzc3VlIH5YODZFTVVMX1JFVFJZIGEgbmV3IHJldHVybiB0eXBl
LA0KPj4gSFZNVFJBTlNfbmVlZF9yZXRyeSwgd2FzIGFkZGVkIGFuZCBhbGwgdGhlIHBsYWNlcyB0
aGF0IGNvbnN1bWUgSFZNVFJBTlMqDQo+PiBhbmQgbmVlZGVkIGFkanVzdG1lbnQgd2hlcmUgY2hh
bmdlZCBhY2NvcmRpbmdseS4NCj4gDQo+IFRoaXMgaXMgd3JvbmcgYW5kIGhlbmNlIGNvbmZ1c2lu
ZzogX19odm1fY29weSgpIHdvdWxkIG5ldmVyIHJldHVybg0KPiB+WDg2RU1VTF9SRVRSWS4gSW4g
ZmFjdCBJIHRoaW5rIHlvdSd2ZSBjb25mdXNlZCB5b3Vyc2VsZiBlbm91Z2ggdG8NCj4gbWFrZSBh
IHF1ZXN0aW9uYWJsZSAocG9zc2libHkgcmVzdWx0aW5nKSBjaGFuZ2U6DQoNClRoZSBpZGVhIHdh
cyB0byBnZXQgWDg2RU1VTF9SRVRSWSBkb3duIHRoZSBsaW5lIGZyb20gX19odm1fY29weSgpLg0K
SSB3aWxsIGFkanVzdCB0aGlzLg0KDQo+IA0KPj4gQEAgLTU4Miw3ICs1ODMsNyBAQCBzdGF0aWMg
dm9pZCAqaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoDQo+PiAgICAgICAgICAgQVNTRVJUKG1mbl94
KCptZm4pID09IDApOw0KPj4gICANCj4+ICAgICAgICAgICByZXMgPSBodm1fdHJhbnNsYXRlX2dl
dF9wYWdlKGN1cnIsIGFkZHIsIHRydWUsIHBmZWMsDQo+PiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZwZmluZm8sICZwYWdlLCBOVUxMLCAmcDJtdCk7DQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwZmluZm8sICZwYWdlLCAmZ2ZuLCAmcDJt
dCk7DQo+IA0KPiBUaGlzIGZ1bmN0aW9uIC4uLg0KPiANCj4+ICAgICAgICAgICBzd2l0Y2ggKCBy
ZXMgKQ0KPj4gICAgICAgICAgIHsNCj4+IEBAIC02MDEsNiArNjAyLDcgQEAgc3RhdGljIHZvaWQg
Kmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKA0KPj4gICANCj4+ICAgICAgICAgICBjYXNlIEhWTVRS
QU5TX2dmbl9wYWdlZF9vdXQ6DQo+PiAgICAgICAgICAgY2FzZSBIVk1UUkFOU19nZm5fc2hhcmVk
Og0KPj4gKyAgICAgICAgY2FzZSBIVk1UUkFOU19uZWVkX3JldHJ5Og0KPiANCj4gLi4uIGNhbid0
IHJldHVybiB0aGlzIHZhbHVlLCBzbyB5b3Ugc2hvdWxkIG9taXQgdGhpcyBhZGRpdGlvbiwNCj4g
bGV0dGluZyB0aGUgbmV3IHJldHVybiB2YWx1ZSBnbyB0aHJvdWdoICJkZWZhdWx0OiIuDQoNCkl0
IGlzIHZlcnkgY2xlYXIgdGhhdCBIVk1UUkFOU19uZWVkX3JldHJ5IHdpbGwgbm90IGJlIHJldHVy
bmVkIGZvcm0gdGhhdCANCmZ1bmN0aW9uLiBBdCBsZWFzdCBmb3Igbm93LiBJIHRob3VnaHQgeW91
IHdhbnRlZCB0byBoYXZlIGV2ZXJ5IHBvc3NpYmxlIA0KY2FzZSBjb3ZlcmVkIGluIHRoZSBzd2l0
Y2guIEkgY2FuIHJlbW92ZSB0aGF0IGNhc2UsIHRoZXJlIGlzIG5vdCBwcm9ibGVtIA0KaGVyZSBi
ZWNhdXNlLCBsaWtlIEkndmUgc2FpZCwgaXQgd2lsbCBuZXZlciBlbnRlciB0aGF0IGNhc2UuDQoN
CkJ1dCBhcyB5b3Ugc2FpZCBsYXRlciB3b3JrIHdpdGggSFZNVFJBTlNfbmVlZF9yZXRyeSB3aWxs
IHJlc3VsdCBpbiANCnJldHVybmluZyBYODZFTVVMX1JFVFJZLiBBbnkgd2F5IGl0J3MgeW91ciBj
YWxsIGlmIEkgc2hvdWxkIHJlbW92ZSBpdCBvciANCm5vdC4NCg0KPiANCj4+IEBAIC0xODUyLDYg
KzE4NjQsOCBAQCBzdGF0aWMgaW50IGh2bWVtdWxfcmVwX21vdnMoDQo+PiAgIA0KPj4gICAgICAg
eGZyZWUoYnVmKTsNCj4+ICAgDQo+PiArICAgIEFTU0VSVChyYyAhPSBIVk1UUkFOU19uZWVkX3Jl
dHJ5KTsNCj4+ICsNCj4+ICAgICAgIGlmICggcmMgPT0gSFZNVFJBTlNfZ2ZuX3BhZ2VkX291dCAp
DQo+PiAgICAgICAgICAgcmV0dXJuIFg4NkVNVUxfUkVUUlk7DQo+PiAgICAgICBpZiAoIHJjID09
IEhWTVRSQU5TX2dmbl9zaGFyZWQgKQ0KPj4gQEAgLTE5NjQsNiArMTk3OCw4IEBAIHN0YXRpYyBp
bnQgaHZtZW11bF9yZXBfc3RvcygNCj4+ICAgICAgICAgICBpZiAoIGJ1ZiAhPSBwX2RhdGEgKQ0K
Pj4gICAgICAgICAgICAgICB4ZnJlZShidWYpOw0KPj4gICANCj4+ICsgICAgICAgIEFTU0VSVChy
YyAhPSBIVk1UUkFOU19uZWVkX3JldHJ5KTsNCj4+ICsNCj4+ICAgICAgICAgICBzd2l0Y2ggKCBy
YyApDQo+PiAgICAgICAgICAgew0KPj4gICAgICAgICAgIGNhc2UgSFZNVFJBTlNfZ2ZuX3BhZ2Vk
X291dDoNCj4gDQo+IExvb2tpbmcgYXQgdGhpcyBhZ2FpbiwgSSB0aGluayBpdCB3b3VsZCBiZXR0
ZXIgYmUgYW4gYWRkaXRpb24gdG8NCj4gdGhlIHN3aXRjaCgpICh1c2luZyBBU1NFUlRfVU5SRUFD
SEFCTEUoKSkuIEdlbmVyYWxseSB0aGlzIGlzDQo+IHRydWUgZm9yIHRoZSByZXBfbW92cyBjYXNl
IGFzIHdlbGwsIGJ1dCB0aGF0IG9uZSB3b3VsZCBmaXJzdA0KPiBuZWVkIGNvbnZlcnRpbmcgdG8g
c3dpdGNoKCksIHdoaWNoIEkgYWdyZWUgaXMgYmV5b25kIHRoZSBzY29wZQ0KDQpJIGFncmVlIHRo
YXQgdGhpcyBpcyBiZXlvbmQgdGhlIHNjb3BlIG9mIHRoaXMgcGF0Y2ggYnV0IGl0J3Mgbm90IHRo
YXQgDQpiaWcgb2YgYSBjaGFuZ2UgYW5kIGl0IGNhbiBiZSBkb25lLg0KDQpCdXQgaXNuJ3QgaGF2
aW5nIGEgZGVmYXVsdCBBU1NFUlRfVU5SRUFDSEFCTEUoKTsgaW4gYm90aCBzd2l0Y2ggY2FzZXMg
DQpjaGFuZ2UgdGhlIGJlaGF2aW9yIG9mIHRoZSBmdW5jdGlvbj8NCg0KPiBvZiB0aGlzIGNoYW5n
ZS4gSW4gYm90aCBjYXNlcyBhIGJyaWVmIGNvbW1lbnQgd291bGQgc2VlbQ0KPiB3b3J0aHdoaWxl
IGFkZGluZywgY2xhcmlmeWluZyB0aGF0IHRoZSBuZXcgcmV0dXJuIHZhbHVlIGNhbg0KPiByZXN1
bHQgZnJvbSBodm1fY29weV8qX2d1ZXN0X2xpbmVhcigpIG9ubHkuIFRoaXMgbWlnaHQgYmVjb21l
DQo+IHJlbGV2YW50IGluIHBhcnRpY3VsYXIgaWYsIGRvd24gdGhlIHJvYWQsIHdlIGludmVudCBt
b3JlIGNhc2VzDQo+IHdoZXJlIEhWTVRSQU5TX25lZWRfcmV0cnkgaXMgcHJvZHVjZWQuDQoNCklz
IHRoaXMgY29tbWVudCBhaW1lZCBmb3IgdGhlIGNvbW1pdCBtZXNzYWdlIG9yIGFub3RoZXIgcGxh
Y2U/DQoNCj4gDQo+IFRoZW4gYWdhaW4gbWF5YmUgc3dpdGNoaW5nIHJlcF9tb3ZzIHRvIHN3aXRj
aCgpIHdvdWxkIHN0aWxsIGJlDQo+IGEgZ29vZCB0aGluZyB0byBkbyBoZXJlOiBEb24ndCB5b3Ug
YWdyZWUgdGhhdCBmcm9tIGFuIGFic3RyYWN0DQo+IHBvdiBpbiBib3RoIGNhc2VzIGFib3ZlIFg4
NkVNVUxfUkVUUlkgc2hvdWxkIGJlIHByb2R1Y2VkLCBpZiBhdA0KPiBhIGZ1dHVyZSBwb2ludCBw
aHlzaWNhbCBhY2Nlc3NlcyBjb3VsZCBhbHNvIHByb2R1Y2UNCj4gSFZNVFJBTlNfbmVlZF9yZXRy
eT8gV2l0aCB0aGlzIHJldGFpbmluZyB0aGUgYXNzZXJ0aW9ucyBpcw0KPiBjZXJ0YWlubHkgYW4g
b3B0aW9uLCBidXQgSSB0aGluayB0aGUgZmFsbGJhY2sgcmV0dXJuIHZhbHVlIGZvcg0KPiB0aGlz
IGNhc2Ugc2hvdWxkIHN0aWxsIGJlIFg4NkVNVUxfUkVUUlkuDQo+IA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
