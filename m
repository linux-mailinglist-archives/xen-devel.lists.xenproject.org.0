Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0080B1244C3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 11:36:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihWdI-0003qz-4N; Wed, 18 Dec 2019 10:32:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BItc=2I=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ihWdH-0003qu-3u
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 10:32:43 +0000
X-Inumbo-ID: b7b4dc6e-2181-11ea-9053-12813bfff9fa
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.100]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7b4dc6e-2181-11ea-9053-12813bfff9fa;
 Wed, 18 Dec 2019 10:32:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0Cmwigcb4x5JMF0SPg047zE7m9pRicEYN1VI6VDq3BR4IPa/zQiowu+9x4pIYAZvY9m7jv/gmKO6LZ/Hj0xgtsOUr7HxDkNF7V+4M/621z6C2rPIQJ+gw48IjRfKYX0SA3M+Z3sLJteeEqX+vWLCpUfTk0notC3CY+N6doufmS6cnXbzD3VpO7Oy9g//5uZPsOBoyommuziZ1rIGA5MAhRrLDRG90Ne5HQmDt4StH5GIVl3ddRpNQ+f3++Dq0g+nu3of12NYhVU6LaymFLtyFuGq8Z4xMSgW5swu1PzgeNoNXd8t6Og9zDOPVKc3qPXSq/7Utchr6H75nd9CdfmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umwB5DZ0dJQG9qJhr3szH6fUjGWH7S+QpiIke9K+Ag4=;
 b=MQV8pjRNLiLLCsEWAddQLE8tQUh2LCTZMQzTJsx3HOILYI8hh4bgKSJI7tAspUFqNrlntVKCHOERMyw5O8Se1N/p7jIvXb/4Xcrj9Y2uwchSrtwSmpjoHwHKqQOceQKxu5TafDig8V3qGztwJhwfGYM2dYVSdakUR5U2Fr95RQ53HgLv1uHDxjAKgcFtQNGJqyGyBWRFurLlllbZSLP6sNyCL9UtnIyKc1MfZY0noJVKDNZOaO6+pL/dV45s/f+eO6zvo3an0v6VGpQgt12oCpl7c338G9eUjUu9HNnNeVKUK5h1bmjvj0Kj7cSCoae5DnMUqcm0+Ql55j6ngHu+4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umwB5DZ0dJQG9qJhr3szH6fUjGWH7S+QpiIke9K+Ag4=;
 b=MnBYrjHuGx+qwlbf8WTRqSltOpdeUZRORf/YORXDS5hMZEh2FVXsliIzcG2zSQkyHwjIZ8RHUjfBpS1jvVsx0oBcfoD7yFNgHdjzfJUxxECZm5q1EDgIRJQRLu4rMpfVKj9EDui595N+P53k1xhZMfGgtnvGKs7N01J+32K7Yws=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5121.eurprd02.prod.outlook.com (20.178.23.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Wed, 18 Dec 2019 10:32:39 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2538.019; Wed, 18 Dec 2019
 10:32:39 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH V4 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
Thread-Index: AQHVtOxnMZNvtoiQIE62yqEH5VgLvKe+jS4AgAD/GYCAACpOAP//+JmAgAAD54A=
Date: Wed, 18 Dec 2019 10:32:39 +0000
Message-ID: <585c31ae-8497-c3c2-8947-d2c80441b26c@bitdefender.com>
References: <20191217151144.9781-1-aisaila@bitdefender.com>
 <20191217151144.9781-2-aisaila@bitdefender.com>
 <c0bc8c84-dbb5-0030-061a-a665a7901b80@suse.com>
 <3afbe9f0-0b89-f566-b5f0-b656cb2f23da@bitdefender.com>
 <fe9f516c-7f8e-f3ac-cc30-e7e8a6f882fb@bitdefender.com>
 <600c17a8-e205-ce7d-69bf-036c004459a0@suse.com>
In-Reply-To: <600c17a8-e205-ce7d-69bf-036c004459a0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::15) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04746a87-e429-4398-a9ea-08d783a59b49
x-ms-traffictypediagnostic: AM0PR02MB5121:|AM0PR02MB5121:|AM0PR02MB5121:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB5121C846FC0D98E415FCEDA1AB530@AM0PR02MB5121.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(376002)(396003)(366004)(346002)(189003)(199004)(6486002)(66946007)(478600001)(64756008)(66446008)(4326008)(66476007)(66556008)(31686004)(186003)(316002)(2906002)(36756003)(7416002)(86362001)(6512007)(54906003)(71200400001)(6506007)(81166006)(2616005)(53546011)(81156014)(6916009)(8676002)(31696002)(5660300002)(26005)(52116002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5121;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O3aplu0CtTraEolpIPOp2s4ouOQrTtirdcsi4xJAWB87IDExH496VAqU5+ijwzrZo20pwizPn2JBs2ov5xXr4/jMuPgRf3kix3oYJjJKEKkLB7CKUTfJYBvY2ObgsJtNAdstync3kTia8TPcavBPI8JSqsQus68X8uembHdp+BEVy7G3o9zDNZHTUF2i6IL3SKjDzT9pWYdugeORQ6ldKgQEz9bYPb4zLrZu0SaUeQzaeC7XpKP5i8UFSCFjOaaOXNBNtQeJ+pSzNC2B34E6BvmdybIqqzZMrm1myBKNeGWnhqmTx6zKa2zILQ/mq7GJ1QWWFBXrn9xphwBrBpQKnJn+crcj/TQ8iDFBkQlhlIp805teJ9oWtylolEHaf33pCt17M2Z1fkVXxN3f+JsCQUwvFG8aumKHtr0dqOVT15dMgIVFoynvb6hMUdySFgJS
Content-ID: <641EB5006D968F4EAF4CE15496E8BBD3@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04746a87-e429-4398-a9ea-08d783a59b49
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 10:32:39.5942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pe8tRGzHKehSIj/UV64mcygxybYZNa8hx3MXfuIf3/RdGPh4aOco6nOH4q9T5tPAvAA4YvohEvaIxaL28LhiUDncsMijskQgP1u7ed6HjcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5121
Subject: Re: [Xen-devel] [PATCH V4 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE4LjEyLjIwMTkgMTI6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOC4xMi4y
MDE5IDA5OjQ1LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+DQo+Pg0KPj4gT24g
MTguMTIuMjAxOSAxMDoxMywgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4NCj4+
Pj4+ICsvKg0KPj4+Pj4gKyAqIFNldC9jbGVhciB0aGUgI1ZFIHN1cHByZXNzIGJpdCBmb3IgbXVs
dGlwbGUgcGFnZXMuICBPbmx5IGF2YWlsYWJsZSBvbiBWTVguDQo+Pj4+PiArICovDQo+Pj4+PiAr
aW50IHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3VwcHJl
c3NfdmVfbXVsdGkgKnN2ZSkNCj4+Pj4+ICt7DQo+Pj4+PiArICAgIHN0cnVjdCBwMm1fZG9tYWlu
ICpob3N0X3AybSA9IHAybV9nZXRfaG9zdHAybShkKTsNCj4+Pj4+ICsgICAgc3RydWN0IHAybV9k
b21haW4gKmFwMm0gPSBOVUxMOw0KPj4+Pj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtID0g
aG9zdF9wMm07DQo+Pj4+PiArICAgIHVpbnQ2NF90IHN0YXJ0ID0gc3ZlLT5maXJzdF9nZm47DQo+
Pj4+PiArICAgIGludCByYyA9IDA7DQo+Pj4+PiArICAgIHVpbnQ2NF90IG1heF9waHlzX2FkZHIg
PSAoMVVMIDw8IGQtPmFyY2guY3B1aWQtPmV4dGQubWF4cGh5c2FkZHIpIC0gMTsNCj4+Pj4+ICsN
Cj4+Pj4+ICsgICAgaWYgKCBzdmUtPnZpZXcgPiAwICkNCj4+Pj4+ICsgICAgew0KPj4+Pj4gKyAg
ICAgICAgaWYgKCBzdmUtPnZpZXcgPj0gTUFYX0FMVFAyTSB8fA0KPj4+Pj4gKyAgICAgICAgICAg
ICBkLT5hcmNoLmFsdHAybV9lcHRwW2FycmF5X2luZGV4X25vc3BlYyhzdmUtPnZpZXcsIE1BWF9F
UFRQKV0gPT0NCj4+Pj4+ICsgICAgICAgICAgICAgbWZuX3goSU5WQUxJRF9NRk4pICkNCj4+Pj4+
ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+Pj4+ICsNCj4+Pj4+ICsgICAgICAgIHAy
bSA9IGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYXJyYXlfaW5kZXhfbm9zcGVjKHN2ZS0+dmll
dywNCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIE1BWF9BTFRQMk0pXTsNCj4+Pj4+ICsgICAgfQ0KPj4+Pj4gKw0KPj4+Pj4g
KyAgICBwMm1fbG9jayhob3N0X3AybSk7DQo+Pj4+PiArDQo+Pj4+PiArICAgIGlmICggYXAybSAp
DQo+Pj4+PiArICAgICAgICBwMm1fbG9jayhhcDJtKTsNCj4+Pj4+ICsNCj4+Pj4+ICsgICAgd2hp
bGUgKCBzdmUtPmxhc3RfZ2ZuID49IHN0YXJ0ICYmIHN0YXJ0IDwgbWF4X3BoeXNfYWRkciApDQo+
Pj4+DQo+Pj4+IFdoeSBkb24ndCB5b3UgY2xpcCAtPmxhc3RfZ2ZuIGFoZWFkIG9mIHRoZSBsb29w
LCBzYXZpbmcgb25lDQo+Pj4+IGNvbXBhcmlzb24gcGVyIGl0ZXJhdGlvbj8NCj4+Pg0KPj4+IEkn
dmUgZG9uZSB0aGlzIHNvIGl0IHdpbGwgaGF2ZSBmZXdlciBsaW5lcyBidXQgc3VyZSwgSSBjYW4g
aGF2ZSB0aGUNCj4+PiAtPmxhc3RfZ2ZuIGNoZWNrIGJlZm9yZSB0aGUgbG9vcC4NCj4+DQo+PiBX
b3VsZG4ndCB0aGVyZSBiZSBhIGlzc3VlIGlmIHN0YXJ0IGdvZXMgb3ZlciAtPmxhc3RfZ2ZuIGFu
ZCB0aGVyZSBpcyBubw0KPj4gYnJlYWsgZm9yIHByZWVtcHRpb24/IFRoZW4gdGhlIGxvb3Agd2ls
bCBydW4gdW50aWwgbWF4X3BoeXNfYWRkci4NCj4gDQo+IEknbSBub3Qgc3VyZSBJIHVuZGVyc3Rh
bmQuIE15IGd1ZXNzIGlzIGEgbWlzdW5kZXJzdGFuZGluZyAtIEknbQ0KPiBhc2tpbmcgdG8gcmVw
bGFjZSB0aGUgcmlnaHQgc2lkZSBvZiB0aGUgJiYsIGFuZCBpdCBsb29rcyB5b3UNCj4gdW5kZXJz
dG9vZCBtZSB0byBtZWFuIHRoZSBsZWFzdCBzaWRlLiBOb3RlIGhvdyBJIHNhaWQgImNsaXAiIGlu
DQo+IG15IGVhcmxpZXIgcmVwbHksIG1lYW5pbmcgeW91IHRvIHVwZGF0ZSAtPmxhc3RfZ2ZuIGFo
ZWFkIG9mIHRoZQ0KPiBsb29wIGlmIGl0J3MgYWJvdmUgKDFVTCA8PCBkLT5hcmNoLmNwdWlkLT5l
eHRkLm1heHBoeXNhZGRyKSAtIDEuDQo+IFBlcmhhcHMgdGhpcyBjb3VsZCBldmVuIGJlIGRvbmUg
aW4gdGhlIGNhbGxlciB0b2dldGhlciB3aXRoIChhbmQNCj4gcG9zc2libHkgYWhlYWQgb2YpIHRo
ZSBvdGhlciBzYW5pdHkgY2hlY2tpbmcgb2YgaW5jb21pbmcgdmFsdWVzLg0KPiANCg0KVGhlbiBJ
IGNvdWxkIGhhdmUgICJzdmUtPmxhc3RfZ2ZuID0gbWluKHN2ZS0+bGFzdF9nZm4sIG1heF9waHlz
X2FkZHIpIg0KYW5kIHRoZW4gZHJvcCB0aGUgInN0YXJ0IDwgbWF4X3BoeXNfYWRkciIgY2hlY2sg
ZnJvbSB0aGUgd2hpbGUgbG9vcC4NCg0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
