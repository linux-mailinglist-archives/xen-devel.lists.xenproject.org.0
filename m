Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79681A5981
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 16:39:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4nRr-0004s1-7Q; Mon, 02 Sep 2019 14:36:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6LlC=W5=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1i4nRp-0004rw-Pa
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 14:36:49 +0000
X-Inumbo-ID: 182e7ff6-cd8f-11e9-951b-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.108]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 182e7ff6-cd8f-11e9-951b-bc764e2007e4;
 Mon, 02 Sep 2019 14:36:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8ErV0omi7fthxQ3n+hQY9e2YW0q7mFpv8IFZafYbKSejob9PEhgsGmhS6HQW32CQzFB4sfRyzmA83ZI3jbi3Q98m4/9mbm8cxuJRXsVfemETCUwaxyEhEV2woEi7hVTgknAGi+6niPKoJrP7w587+ZslMsUqxcjsqtINtvTIgG61Gl02MiOpePYGvZubum5R4/tLs3/s3KSrippJA47wA0bCfQWKy/0AWGBm25i5fj0wZX4hXyWzDtj8pTmeuuLpwpxgsf46yYNMld4v3F6PR0wBOaL+bbQQAajZ12mhdDzQQJbIsuNOKOxy2nlI2oQIoAvqA9WeQhVzod1JQcqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYDOUVUs260ZtHF4wKvHFmdoPpITlUz82mKsAUwKUl4=;
 b=oHBWNg4R0j8aenyTKcBQXGbklTXqQ0RyxMegGzZs6fF7OaOjurLLzwFoRzW8+vXKR2abYSL2h5GhI2tzoKXNHa9KgqLWEXWyNJhXhMQyafOlnnFc40a5whx2+7e456N/RFBH6MV4GagagvmoJ0cZ4mePGltvl6TLQt7jpkZcfxFXZ4tQL42gGJCuZa7TuSc2x1O7FAx026WyFGnIXeeL5PNAgEe20CmxKkUSMCQ8zuwa8khI/8cEjuGzDlZCDYpoPd3ysJd4MEs2vwy3nSYoaGt8V41GEBGzDtZWtQcexnYlVMyALZ/1f8FAeALR/9NxRagh/8okAGEm2l98YOw9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYDOUVUs260ZtHF4wKvHFmdoPpITlUz82mKsAUwKUl4=;
 b=pG2IENhB9ACRbl8Mxm5VhuRlEkOg0Pm/Lryqdpt6qAVCKd4rYPh5vobl4h5lsy8HrQhPRlySiY82D6rDhxaB/zWeK4SBOO8spi1rLJQXNkXHHheNgbBKYQlaRaa4vddeitts9/Tbx7Lg52b10pNL045QWc0N5GjxWbU9n0+0Xdo=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5861.eurprd02.prod.outlook.com (10.141.172.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16; Mon, 2 Sep 2019 14:36:47 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74%4]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 14:36:47 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMY4Gmux1Y/IiSU2ZKtKyOfOCuKbQbceAgAG+GQD//9nvgIAEjgaAgAzeDYD//9/xAIAAPukA///ZqAAEKyvfAAFHaPIAATqxCwA=
Date: Mon, 2 Sep 2019 14:36:46 +0000
Message-ID: <08dc2694-f10b-ad08-12c2-2b04d58897ad@bitdefender.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
 <23cebb01-38fc-ba49-5a71-e6129152e488@bitdefender.com>
 <1bdaee7b-a01f-7be8-426f-fe6c678c2859@bitdefender.com>
 <60651ad5-f0bd-caad-77f6-5f8fb71a8319@suse.com>
 <c7060d91-851a-ba04-56c3-90f1aed65913@bitdefender.com>
 <b7c16027-2f50-4011-3866-0b4904596249@suse.com>
 <7d8888b6-ae1b-d059-938e-14fb72e6f9bc@citrix.com>
 <958de8dd-0d66-aa4d-d815-fff01ffc2abf@suse.com>
In-Reply-To: <958de8dd-0d66-aa4d-d815-fff01ffc2abf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0183.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::27) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e638163e-3b1a-45de-433a-08d72fb2fb9d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5861; 
x-ms-traffictypediagnostic: AM7PR02MB5861:|AM7PR02MB5861:|AM7PR02MB5861:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB58618B89C2878FB0F82459CEABBE0@AM7PR02MB5861.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(376002)(366004)(396003)(39860400002)(189003)(199004)(6512007)(52116002)(25786009)(486006)(8676002)(8936002)(316002)(6306002)(81156014)(14454004)(6436002)(81166006)(53546011)(5660300002)(54906003)(4326008)(476003)(102836004)(31696002)(110136005)(386003)(966005)(6506007)(76176011)(66556008)(6246003)(478600001)(36756003)(53936002)(305945005)(66446008)(64756008)(26005)(99286004)(31686004)(446003)(86362001)(229853002)(14444005)(2616005)(71200400001)(66946007)(66066001)(2906002)(71190400001)(186003)(256004)(7736002)(11346002)(6486002)(6116002)(3846002)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5861;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +juywV8fi7Rq90iIJinogDKVChXiKTpwvo32oHY/lEfff6wczBKuM6ftQrzTzLE9N7Nod9fyuosTHwx0Dn1udPtI+nOHPyv4djXmouCVzAuLEHmI9dGo1qcIiELWYIqutZ71c8kNSOS2lo+Ky9XCw+XojRn0A8Wqi7BoN0kWCPGoClWqgUnwxfqg2Kwp5x2Lx3Gbq2sWHWnRJamqX+Cab1zcRzPne1Y2ex+QK/zAjub3f2yidTL86vDmV2rin2Kjm4xze2F8SXeJSaMRfgMh7TALKCjAyOcxNdZJNM1lk7UsY+Yu/2rzqOxfGlL/6A1FHF3q6qwt8pat8AvQ3FvQAPZZj+YkEHITTJh3V8Pik77yC7UD8RMbVumwqFj06Ru1tujW/bwC5JsTbNQvTzoN7qcRR0b09wDrrN8QpxqTqzY=
Content-ID: <786DA003CC06154DB78E925FEE77C960@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e638163e-3b1a-45de-433a-08d72fb2fb9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 14:36:47.0127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bC77r7kVWGQmUp5S7mT4T0vnEf2M85DXtPF3o2YY6xe8k7SL0pCGL/ZReRt0AHNEu4JUouAUkBzp96o46sHd+ZEPkXfPUU225hwqGuMG2YY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5861
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI3LjA4LjIwMTkgMTE6MjYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4wOC4y
MDE5IDIyOjExLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMzAvMDcvMjAxOSAxNTo1NCwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IEBAIC02MjIsMTQgKzYyMiwyMiBAQCBzdGF0aWMgdm9p
ZCAqaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB9DQo+Pj4+DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
IHAybXQgPT0gcDJtX2lvcmVxX3NlcnZlciApDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHsNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSBOVUxMOw0KPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsNCj4+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4+Pg0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgQVNTRVJUKHAybXQgPT0gcDJtX3JhbV9sb2dkaXJ0eSB8fCANCj4+Pj4gIXAy
bV9pc19yZWFkb25seShwMm10KSk7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKCBjdXJyLT5hcmNoLnZtX2V2ZW50ICYmDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjdXJyLT5hcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50ICYmDQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBodm1fZW11bGF0ZV9zZW5kX3ZtX2V2ZW50
KGFkZHIsIGdmbiwgcGZlYykgKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGVyciA9IEVSUl9QVFIoflg4NkVNVUxfUkVUUlkpOw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIH0NCj4+Pj4gwqDCoMKgwqDCoMKgwqAgfQ0KPj4+PiArwqDCoMKgIC8qIENoZWNrIGlmIGFu
eSB2bV9ldmVudCB3YXMgc2VudCAqLw0KPj4+PiArwqDCoMKgIGlmICggZXJyICkNCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGdvdG8gb3V0Ow0KPj4+Pg0KPj4+PiDCoMKgwqDCoMKgwqDCoCAvKiBFbnRp
cmUgYWNjZXNzIHdpdGhpbiBhIHNpbmdsZSBmcmFtZT8gKi8NCj4+Pj4gwqDCoMKgwqDCoMKgwqAg
aWYgKCBucl9mcmFtZXMgPT0gMSApDQo+Pj4gRmlyc3Qgb2YgYWxsIEkgaGF2ZSB0byBhcG9sb2dp
emU6IEluIGVhcmxpZXIgcmVwbGllcyBJIHJlZmVycmVkDQo+Pj4gdG8gdXBkYXRlX21hcF9lcnIo
KS4gSSBub3RpY2Ugb25seSBub3cgdGhhdCB0aGlzIGlzIGEgc3RpbGwNCj4+PiBwZW5kaW5nIGNo
YW5nZSBvZiBtaW5lLCB3aGljaCBBbmRyZXcgY29udGludWVzIHRvIG9iamVjdCB0bywNCj4+PiB3
aGlsZSBJIGNvbnRpbnVlIHRvIHRoaW5rIGl0IChpbiBvbmUgZm9ybSBvciBhbm90aGVyKSBpcyBu
ZWVkZWQ6DQo+Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDE4LTA5L21zZzAxMjUwLmh0bWwgDQo+Pj4NCj4+Pg0KPj4+IEdpdmVuIHRoZSB1
bnBhdGNoZWQgY29kZSwgSSB0aGluayB5b3VyIGNoYW5nZSBpcyBjb3JyZWN0LCBidXQNCj4+PiBx
dWl0ZSBwb3NzaWJseSB5b3VyIGVhcmxpZXIgdmFyaWFudCB3YXMsIHRvby4gQnV0IHNpbmNlIHRo
ZQ0KPj4+IHVucGF0Y2hlZCBjb2RlIGlzIGltbyB3cm9uZywgSSdkIHByZWZlciBpZiB0aGUgVk0g
ZXZlbnQgc2lkZQ0KPj4+IGNoYW5nZSB3YXMgcHV0IG9uIHRvcCBvZiB0aGUgZml4ZWQgY29kZSwg
aW4gb3JkZXIgdG8gbm90IGZ1cnRoZXINCj4+PiBjb21wbGljYXRlIHRoZSBhY3R1YWwgZml4ICh3
aGljaCB3ZSBtYXkgYWxzbyB3YW50IHRvIGJhY2twb3J0KS4NCj4+Pg0KPj4+IEFuZHJldywgYXMg
dG8gdGhhdCBvbGQgcGVuZGluZyBwYXRjaCwgSSdtIGFmcmFpZCBJIGhhdmVuJ3QgYmVlbg0KPj4+
IGNvbnZpbmNlZCBpbiB0aGUgc2xpZ2h0ZXN0IGJ5IHlvdXIgYXJndW1lbnRhdGlvbiwgcmVnYXJk
bGVzcyBvZg0KPj4+IHRoZSBhY3R1YWwgYmVoYXZpb3Igb2YgdGhlIFhURiB0ZXN0IHlvdSd2ZSBj
cmVhdGVkLg0KPj4NCj4+IFNvIHdoYXQ/wqAgWW91IHdhbnQgeW91ciBjaGFuZ2UgdGFrZW4gYW55
d2F5IGRlc3BpdGUgZXZpZGVuY2UgdGhhdCBpdCBpcw0KPj4gd3Jvbmc/DQo+Pg0KPj4+IMKgIFRo
ZXJlIGFyZQ0KPj4+IHR3byBmdW5kYW1lbnRhbCBwb2ludHMgeW91J3ZlIG5vdCBhZGRyZXNzZWQg
ZHVyaW5nIHRoZSBlYXJsaWVyDQo+Pj4gZGlzY3Vzc2lvbjoNCj4+PiAxKSBGb3IgYSBndWVzdCBi
ZWhhdmlvciBzaG91bGQgYmUgZW50aXJlbHkgdHJhbnNwYXJlbnQgYXMgZmFyIGFzDQo+Pj4gMm5k
IGxldmVsIHRyYW5zbGF0aW9uIGdvZXMsIHVubGVzcyB0aGUgX29ubHlfIGlzc3VlIHJlc3VsdHMg
ZnJvbQ0KPj4+IGl0LiBUaGF0J3MgYmVjYXVzZSBvbiBiYXJlIGhhcmR3YXJlIHRoZXJlIHNpbXBs
eSBpcyBubyAybmQgbGV2ZWwNCj4+PiB0cmFuc2xhdGlvbi4NCj4+PiAyKSBTb21ld2hhdCByZWxh
dGVkLCBjb25zaWRlciB0aGUgY2FzZSBvZiB0aGUgZ3Vlc3QgaGFuZGxpbmcgdGhlDQo+Pj4gI1BG
IG9uIHRoZSBzZWNvbmQgaGFsZiBvZiB0aGUgYWNjZXNzIGJ5IGEgbWVhbnMgd2hpY2ggbWFrZXMg
dGhlDQo+Pj4gcmVhc29uIGZvciB0aGUgMm5kIHN0YWdlICJmYXVsdCIgZ28gYXdheSwgb3Igbm90
IHJlY3VyLiBJbiB0aGF0DQo+Pj4gY2FzZSB3ZSd2ZSB3cm9uZ2x5IChpLmUuIGF0IGxlYXN0IG5l
ZWRsZXNzbHkpIGRlYWx0IHdpdGggdGhlIDJuZA0KPj4+IHN0YWdlICJmYXVsdCIuDQo+Pg0KPj4g
Rm9yIGJvdGggb2YgdGhlc2UsIGRvIHlvdSBhY3R1YWxseSBoYXZlIGFuIGV4YW1wbGUgd2hlcmUg
eW91IGJlbGlldmUNCj4+IFhlbidzIGxvZ2ljIGN1cnJlbnRseSBnb2VzIHdyb25nP8KgIEFsbCBJ
IHNlZSwgbG9va2luZyB0aG91Z2ggdGhlDQo+PiB0aHJlYWRzLCBpcyB1bnN1YnN0YW50aWF0ZWQg
Y2xhaW1zIHRoYXQgdGhlIGN1cnJlbnQgYmVoYXZpb3VyIGlzIHdyb25nLg0KPiANCj4gSG1tLCBJ
IHRob3VnaHQgd2UncmUgYm90aCBzdGlsbCByZWNhbGxpbmcgdGhlIGNhc2UgdGhpcyBzdGFydGVk
IGZyb206DQo+IGJhbGxvb25lZC1vdXQgcGFnZSBoYW5kbGluZyBraWNraW5nIGluIHdoZW4gdGhl
IGd1ZXN0IGV4cGVjdHMgYSBwYWdlDQo+IGZhdWx0IChiYXNlZCBvbiBpdHMgb3duIHBhZ2UgdGFi
bGVzKS4NCj4gDQo+Pj4gSSBhbSwgYnR3LCBub3QgY29udmluY2VkIHRoYXQgdGhlIGJlaGF2aW9y
IGFzIHlvdSd2ZSBvYnNlcnZlZCBpdA0KPj4+IGlzIGFjdHVhbGx5ICJjb3JyZWN0IiBpbiB0aGUg
c2Vuc2Ugb2YgInNlbnNpYmxlIi4NCj4+DQo+PiBZb3UncmUgZW50aXRsZWQgdG8gdGhlIGJlbGll
dmUgdGhhdCB0aGlzIGlzbid0IHNlbnNpYmxlIGlmIHlvdSB3aXNoLg0KPj4NCj4+IEl0IGRvZXNu
J3QgbWFrZSBpdCByZWxldmFudCB0byB0aGUgYXJndW1lbnQuwqAgUmVsZXZhbnQgYXJndW1lbnRz
IHdvdWxkDQo+PiBiZSBpZGVudGlmeWluZywgYSBidWcgaW4gbXkgWFRGIHRlc3QsIG9yIGNvdW50
ZXJleGFtcGxlIHdoZXJlIHRoZSBDUFVzDQo+PiBkbyBhbiBvcHBvc2l0ZSB0aGluZywgb3IgYSBw
YXNzYWdlIGluIGEgc3BlYyB3aGljaCBtYWtlIGEgc3RhdGVtZW50DQo+PiBzdXBwb3J0aW5nIHlv
dXIgY2xhaW0uDQo+Pg0KPj4gQXMgZmFyIGFzIEkgYW0gY29uY2VybmVkLCBpdCBpcyBwZXJmZWN0
bHkgc2Vuc2libGUgYW5kIGxvZ2ljYWwNCj4+IGJlaGF2aW91ci7CoCBUbyBjb21wbGV0ZSBhbiBp
bnN0cnVjdGlvbiB3aGljaCBzdHJhZGRsZXMgYSBwYWdlIGJvdW5kYXJ5LA0KPj4gaXQgaXMgbmVj
ZXNzYXJ5IHRvIGhhdmUgYm90aCB0cmFuc2xhdGlvbnMgYXZhaWxhYmxlIGluIHRoZSBUTEIsIHdo
aWNoDQo+PiByZXF1aXJlcyB0d28gRVBULXdhbGtzIHRvIGhhdmUgYWxyZWFkeSBjb21wbGV0ZWQg
Y29ycmVjdGx5Lg0KPj4NCj4+IFNETSBWb2wgMyAyOC4yLjMuMyBpcyB2ZXJ5IGNsZWFyIG9uIHRo
ZSBtYXR0ZXIuwqAgQWxsIHRyYW5zbGF0aW9ucyB0byB0aGUNCj4+IHVsdGltYXRlIHBoeXNpY2Fs
IGFkZHJlc3NlcyBnZXQgZXN0YWJsaXNoZWQgZmlyc3QgKEkuZS4gdGhlIFRMQiBmaWxscw0KPj4g
Y29tcGxldGUpIGJlZm9yZSBhbnkgYWNjZXNzIHJpZ2h0cyBnZXQgY29uc2lkZXJlZC7CoCBUaGlz
IG1lYW5zIHRoYXQNCj4+IG9yZGVyaW5nIG9mICNQRiBhbmQgRVBUIG1pc2NvbmZpZy92aW9sYXRp
b24gaXMgY29tcGxpY2F0ZWQgYnkgdGhlaXIgZHVhbA0KPj4gbmF0dXJlIGZvciBmYWlsdXJlcy4N
Cj4+DQo+PiBJbiByZWFsaXR5LCBJIHRoaW5rIHRoZSBjdXJyZW50IGNvZGUgaW4gWGVuIHdpbGwg
Z2V0IHRoZSBwcmlvcml0eSBvZg0KPj4gc2Vjb25kIGFuZCBmaXJzdCBzdGFnZSBhY2Nlc3Mgcmln
aHQgZmF1bHQgaW52ZXJ0ZWQsIGJ1dCBpdHMgYSBkYW1uIHNpZ2h0DQo+PiBjbG9zZXIgdG8gaG93
IHRoZSBDUFUgYmVoYXZlcyB0aGFuIHRoZSBwcm9wb3NlZCBwYXRjaCwgd2hpY2ggd291bGQgZ2V0
DQo+PiBmaXJzdCBzdGFnZWQgYWNjZXNzIHJpZ2h0cyBtaXhlZCB1cCB3aXRoIHNlY29uZCBzdGFn
ZSB0cmFuc2xhdGlvbiBmYXVsdHMuDQo+IA0KPiBJIGNvbnNpZGVyIHlvdXIgcG9zaXRpb24gYXMg
cGVyZmVjdGx5IHZhbGlkIHRvIHRha2UuIEl0J3MganVzdCB0aGF0LCBhcw0KPiBpbiBzbyBtYW55
IG90aGVyIGNhc2VzLCBpdCdzIG5vdCB0aGUgb25seSB2YWxpZCBvbmUgKGltbykuIFlvdSBqdWRn
ZQ0KPiBmcm9tIG9ic2VydmVkIGJlaGF2aW9yLCB3aGljaCBpcyBmaW5lLiBZb3UgZG9uJ3QsIGhv
d2V2ZXIsIGFkZHJlc3MgbXkNCj4gYXJndW1lbnQgb2YgdGhlcmUgbm90IGJlaW5nIDJuZCBzdGFn
ZSB0cmFuc2xhdGlvbiBhdCBhbGwgZnJvbSBndWVzdA0KPiBwb3Y6IFRoZSBjaGFuZ2UgbWFkZSBy
ZXN1bHRzIGluIHRoZSBleHBlY3RlZCBiZWhhdmlvciBpZiB0aGVyZSB3YXMgbm8NCj4gMm5kIHN0
YWdlIHRyYW5zbGF0aW9uLiBBbmQgaXQgaXMgbXkgdmlldyBvZiB2aXJ0dWFsaXphdGlvbiB0aGF0
IHRoZQ0KPiBnb2FsIHNob3VsZCBiZSB0byBwcm92aWRlIGd1ZXN0IHZpc2libGUgYmVoYXZpb3Ig
bWF0Y2hpbmcgdGhlDQo+IHVudmlydHVhbGl6ZWQgY2FzZSBhcyBtdWNoIGFzIHBvc3NpYmxlLg0K
PiANCg0KSGkgSmFuLCBBbmRyZXcsDQoNCklzIHRoZXJlIGEgd2F5IHdlIGNhbiBnbyBvbiB3aXRo
IHRoaXMgaXNzdWU/DQoNClJlZ2FyZHMsDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
