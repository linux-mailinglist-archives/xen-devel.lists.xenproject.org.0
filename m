Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1887AC6F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 17:31:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsU2t-0005WS-Sf; Tue, 30 Jul 2019 15:28:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NuEK=V3=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hsU2s-0005WN-F4
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 15:28:10 +0000
X-Inumbo-ID: a1da6416-b2de-11e9-a75c-8f75ed532fcb
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.121]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1da6416-b2de-11e9-a75c-8f75ed532fcb;
 Tue, 30 Jul 2019 15:28:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3SUnKEPe7cd07sKgAM7GUXefg+cFvcjNqpJJUz0pH17+3IH1f4VEAO6EJ5AUpI1Q2ZF3Ds+tlYe+FPnAMT4njkibc/cR9aLxEfCdhCU69QGwexz2h26dqDJZEbq6pR/mH+qs6/10qVYMZEqtLyjf5gqzenioIAemRd3Xnij6aVOWXALICKq2qg19mJHSYIpQHG8jk3GtBvTxfBsMl/vr0euNfahZCyvV8cjeANnG3BY8Y+VRJikc9FVPuPWoTRkorbQ+fSDEt5mIEqzw7Xn9Fdmicl/v4knNC4zzDna+GKvgDaac/2heQnpNQgDEJfc6/yCWqo08mPX7/msA/7yaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEM8L/e4fNgjey7l/edUoTppBJ3CmHGh1WTVTVxycCE=;
 b=awWKYPbV1PnwH5pbQ47jayXBpYrfu8Gp57REvcdBro7W5fYI/0AxGMRNZqcUyeaWVX7YzhVORZWGJzeABTKUPdWINEy1YVimLeO5KS8YzwhuOUIvC8KoC2ClCnEtUk6HtDRyoNF+esFnL6uXliWADir88Sf27fZsniVTYj0zHN15QwGh+SO1ZX/xvNP87xIAND4EQQ7xDemguQ+6/c48KoKxU+MYTkjIk24q6nGykfHshiIdwPASPa/jeL7zQOaojPDLhfOc2QVjnDu2cpPY3rkZPEfU/isoO7fW8X8jyl49DAM3Mt4fGJxr6VjwZtC8ct1/3P0kqvNWLq/GbU7q5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEM8L/e4fNgjey7l/edUoTppBJ3CmHGh1WTVTVxycCE=;
 b=nqgLz6sAAD1wY9bpjlAy1XG07xSOAFXIad5buBlbFSQp/QNb3h08uAd0m0p8i4qM2HItMJ8tHyZ/KE+J1n7UE7ZtwhHk5h8z/rNJePVo88y+QehAMMSUKyOPukSWUBjCm99tDyvJbQFCTg6ZTeGxnmOx6xT5WTr87jm7NOgrMlQ=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3406.eurprd02.prod.outlook.com (52.134.16.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.11; Tue, 30 Jul 2019 15:28:06 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::7967:e7:88e7:2c18]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::7967:e7:88e7:2c18%3]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 15:28:05 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMY4Gmux1Y/IiSU2ZKtKyOfOCuKbQbceAgAG+GQD//9nvgIAEjgaAgAzeDYD//9/xAIAAPukA///ZqAAAASgngA==
Date: Tue, 30 Jul 2019 15:28:05 +0000
Message-ID: <b08acb62-0e35-48cb-8e04-c6ccfa3296d3@bitdefender.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
 <23cebb01-38fc-ba49-5a71-e6129152e488@bitdefender.com>
 <1bdaee7b-a01f-7be8-426f-fe6c678c2859@bitdefender.com>
 <60651ad5-f0bd-caad-77f6-5f8fb71a8319@suse.com>
 <c7060d91-851a-ba04-56c3-90f1aed65913@bitdefender.com>
 <b7c16027-2f50-4011-3866-0b4904596249@suse.com>
In-Reply-To: <b7c16027-2f50-4011-3866-0b4904596249@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0093.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::33) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bb69a34-f778-41e6-f61e-08d7150284a9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3406; 
x-ms-traffictypediagnostic: VI1PR0202MB3406:|VI1PR0202MB3406:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR0202MB34064F1E4AFDAE54F5929272ABDC0@VI1PR0202MB3406.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(376002)(136003)(396003)(39860400002)(51914003)(199004)(189003)(6116002)(305945005)(36756003)(2616005)(14454004)(66066001)(256004)(446003)(2906002)(11346002)(53936002)(71190400001)(25786009)(31686004)(486006)(71200400001)(478600001)(14444005)(229853002)(66556008)(66946007)(66446008)(6246003)(4326008)(66476007)(966005)(6436002)(99286004)(6486002)(68736007)(64756008)(476003)(2501003)(76176011)(316002)(7736002)(81156014)(110136005)(6512007)(3846002)(26005)(81166006)(31696002)(6306002)(8936002)(6506007)(102836004)(386003)(53546011)(8676002)(86362001)(52116002)(5660300002)(54906003)(186003)(309714004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3406;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j1Ivx0HAkNNnzhs/qqAf5v0Q5XBXAfQL6nu6F4AZ+AK4GuZ/31YOTLMHSMSano/MC5XOhePPpwWhER26V+78Bw9hsT1WeYiXcMIPKIS5pR5I7yTw55A9ECT6cBRuDEr8aZ2TfFJXVpUEbPfkNNB7IYqFNNJT6/46y0INhm7FXhOtPk7tkqa4fWe3RvTqILXfEEi189NvIhcAGEb/Dz3VsBiaqDeIFFG9InAtYOOyo81iigxtge6JvV1/QHKam6llBozwp0U6zAhq6macXTU3dfqTvtHtr5RgOa/0eQHl55XsKYgeTQR2b/cs/3qYJqBxKBxHIoKvhF22tJWRy4IWpYns0VKlNIiBRV/hsckRxRpZnGmswm7iyaA4s4fqZeL+l8g4Ei6peKdcAXLUzrT9RdClsWPJFYGynhcHgunoOyE=
Content-ID: <65C773218AB36847AAE46081364DC9A2@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb69a34-f778-41e6-f61e-08d7150284a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 15:28:05.8255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3406
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

DQoNCk9uIDMwLjA3LjIwMTkgMTc6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wNy4y
MDE5IDE2OjEyLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+DQo+Pg0KPj4gT24g
MzAuMDcuMjAxOSAxNjoyNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMzAuMDcuMjAxOSAx
NDoyMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+DQo+Pj4+Pj4+Pj4gQEAg
LTYyOSw2ICs2OTcsMTQgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKA0K
Pj4+Pj4+Pj4+ICAgICAgICAgICANCj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgQVNT
RVJUKHAybXQgPT0gcDJtX3JhbV9sb2dkaXJ0eSB8fCAhcDJtX2lzX3JlYWRvbmx5KHAybXQpKTsN
Cj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICB9DQo+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+ICsg
ICAgICAgIGlmICggY3Vyci0+YXJjaC52bV9ldmVudCAmJg0KPj4+Pj4+Pj4+ICsgICAgICAgICAg
ICBjdXJyLT5hcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50ICYmDQo+Pj4+Pj4+Pj4gKyAgICAgICAg
ICAgIGh2bV9lbXVsYXRlX3NlbmRfdm1fZXZlbnQoYWRkciwgZ2ZuLCBwZmVjKSApDQo+Pj4+Pj4+
Pj4gKyAgICAgICAgew0KPj4+Pj4+Pj4+ICsgICAgICAgICAgICBlcnIgPSBFUlJfUFRSKH5YODZF
TVVMX1JFVFJZKTsNCj4+Pj4+Pj4+PiArICAgICAgICAgICAgZ290byBvdXQ7DQo+Pj4+Pj4+Pj4g
KyAgICAgICAgfQ0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IERpZCB5b3Ugbm90aWNlIHRoYXQgdGhlcmUn
cyBhbiBpbW1lZGlhdGUgZXhpdCBmcm9tIHRoZSBsb29wIG9ubHkNCj4+Pj4+Pj4+IGluIGNhc2Ug
dGhlIGxpbmVhciAtPiBwaHlzaWNhbCB0cmFuc2xhdGlvbiBmYWlscz8gVGhpcyBpcw0KPj4+Pj4+
Pj4gcmVsZXZhbnQgZm9yIHBhZ2UgZmF1bHQgZGVsaXZlcnkgY29ycmVjdG5lc3MgZm9yIGFjY2Vz
c2VzDQo+Pj4+Pj4+PiBjcm9zc2luZyBwYWdlIGJvdW5kYXJpZXMuIEkgdGhpbmsgeW91IHdhbnQg
dG8gdXNlDQo+Pj4+Pj4+PiB1cGRhdGVfbWFwX2VycigpIGFuZCBkcm9wIHRoZSAiZ290byBvdXQi
LiBJIGNhbid0IHJlYWxseSBtYWtlIHVwDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEJ5IHVwZGF0ZV9tYXBf
ZXJyKCkgYXJlIHlvdSBzYXlpbmcgdG8gaGF2ZSB0aGUgZXJyIHZhciBhc3NpZ25lZCBhbmQgdGhl
bg0KPj4+Pj4+PiBkcm9wICJnb3RvIG91dCI/IElmIHNvIGhvdyBkbyBJIGtlZXAgdGhlIGVyciBm
cm9tIG15IGFjY2VzcyB2aW9sYXRpb24NCj4+Pj4+Pj4gd2l0aG91dCBleGl0aW5nIGZyb20gdGhl
IGxvb3A/DQo+Pj4+Pj4NCj4+Pj4+PiBDb3VudGVyIHF1ZXN0aW9uOiBXaHkgZG8geW91IF9uZWVk
XyB0byBrZWVwICJ5b3VyIiB2YWx1ZSBvZiBlcnI/DQo+Pj4+Pj4gSWYsIGp1c3QgYXMgYW4gZXhh
bXBsZSwgdGhlcmUncyBnb2luZyB0byBiZSBhICNQRiBvbiB0aGUgb3RoZXINCj4+Pj4+PiBoYWxm
IG9mIHRoZSBhY2Nlc3MsIHRoZW4gInlvdXIiIGFjY2VzcyB2aW9sYXRpb24gaXMgb2Ygbm8gaW50
ZXJlc3QNCj4+Pj4+PiBhdCBhbGwuDQo+Pj4+Pg0KPj4+Pj4gWW91IGFyZSByaWdodCwgdGhlcmUg
aXMgbm8gbmVlZCB0byBrZWVwIHRoZSAiZ290byBvdXQiIGhlcmUuIEl0IHdhcyBqdXN0DQo+Pj4+
PiBmb3Igb3B0aW1pemF0aW9uIGluIHRoZSBpZGVhIHRoYXQgdGhlcmUgaXMgbm8gbmVlZCB0byBk
byBmdXJ0aGVyIHN0ZXBzDQo+Pj4+PiBidXQgSSBjYW4gZHJvcCB0aGUgImdvdG8gb3V0IiBhbmQg
dGhlIGNvZGUgd2lsbCB3b3JrIHRoZSBzYW1lLg0KPj4+Pj4NCj4+Pj4NCj4+Pj4gVGhlcmUgaXMg
YSBwcm9ibGVtIHdpdGggZHJvcHBpbmcgdGhlICJnb3RvIG91dCIuIElmIGV2ZXJ5dGhpbmcgZ29l
cyBmaW5lDQo+Pj4+IHRoZW4gaXQgd2lsbCByZXR1cm4gdGhlIG1hcHBpbmcgYW5kIEkgZG9uJ3Qg
d2FudCB0aGF0LiBUaGlzIGNhbiBiZQ0KPj4+PiBzdG9wcGVkIGJ5IGNoZWNraW5nIGlmICggZXJy
ICkgYWZ0ZXIgdGhlIGxvb3AgYW5kIGl0IGlzIG5vdCBudWxsIHRoZW4NCj4+Pj4gZ290byBvdXQu
IEFuZCBnb2luZyB3aXRoIHRoaXMgaWRlYSBJIGNhbiBpbml0ICplcnIgPSBOVUxMIGFuZCBkcm9w
IHRoZQ0KPj4+PiBlcnIgPSBOVUxMIGZyb20gaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoKS4gSXMg
dGhpcyBvayBmb3IgdGhlIG5leHQgdmVyc2lvbj8NCj4+Pg0KPj4+IEknZCBwcmVmZXIgdG8gc2Vl
IHRoZSBjb2RlIHRvIGRlY2lkZS4gSWYgeW91IHdhbnQgdGhpcyBzZXR0bGVkIGJlZm9yZQ0KPj4+
IHNlbmRpbmcgdGhlIG5leHQgZnVsbCB2ZXJzaW9uLCB0aGVuIHBsZWFzZSBzZW5kIGF0IGxlYXN0
IHRoZSByZXN1bHRpbmcNCj4+PiBwYXRjaCBodW5rKHMpLg0KPj4+DQo+Pg0KPj4gSGVyZSBpcyBh
IGRpZmYgZm9yIGh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKCk6DQo+Pg0KPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS9lbXVsYXRlLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5j
DQo+PiBAQCAtNTQzLDEwICs1NDMsMTEgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVh
cl9hZGRyKA0KPj4gICAgICAgICBzdHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCAqaHZtZW11bF9jdHh0
KQ0KPj4gICAgIHsNCj4+ICAgICAgICAgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50Ow0KPj4g
LSAgICB2b2lkICplcnIsICptYXBwaW5nOw0KPj4gKyAgICB2b2lkICplcnIgPSBOVUxMLCAqbWFw
cGluZzsNCj4+ICAgICAgICAgdW5zaWduZWQgaW50IG5yX2ZyYW1lcyA9ICgobGluZWFyICsgYnl0
ZXMgLSAhIWJ5dGVzKSA+PiBQQUdFX1NISUZUKSAtDQo+PiAgICAgICAgICAgICAobGluZWFyID4+
IFBBR0VfU0hJRlQpICsgMTsNCj4+ICAgICAgICAgdW5zaWduZWQgaW50IGk7DQo+PiArICAgIGdm
bl90IGdmbjsNCj4+DQo+PiAgICAgICAgIC8qDQo+PiAgICAgICAgICAqIG1mbiBwb2ludHMgdG8g
dGhlIG5leHQgZnJlZSBzbG90LiAgQWxsIHVzZWQgc2xvdHMgaGF2ZSBhIHBhZ2UNCj4+IHJlZmVy
ZW5jZQ0KPj4gQEAgLTU4NSw3ICs1ODYsNyBAQCBzdGF0aWMgdm9pZCAqaHZtZW11bF9tYXBfbGlu
ZWFyX2FkZHIoDQo+PiAgICAgICAgICAgICBBU1NFUlQobWZuX3goKm1mbikgPT0gMCk7DQo+Pg0K
Pj4gICAgICAgICAgICAgcmVzID0gaHZtX3RyYW5zbGF0ZV9nZXRfcGFnZShjdXJyLCBhZGRyLCB0
cnVlLCBwZmVjLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcGZp
bmZvLCAmcGFnZSwgTlVMTCwgJnAybXQpOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmcGZpbmZvLCAmcGFnZSwgZ2ZuLCAmcDJtdCk7DQo+Pg0KPj4gICAgICAgICAg
ICAgc3dpdGNoICggcmVzICkNCj4+ICAgICAgICAgICAgIHsNCj4+IEBAIC01OTksNyArNjAwLDYg
QEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKA0KPj4gICAgICAgICAgICAg
ICAgIGdvdG8gb3V0Ow0KPj4NCj4+ICAgICAgICAgICAgIGNhc2UgSFZNVFJBTlNfYmFkX2dmbl90
b19tZm46DQo+PiAtICAgICAgICAgICAgZXJyID0gTlVMTDsNCj4+ICAgICAgICAgICAgICAgICBn
b3RvIG91dDsNCj4+DQo+PiAgICAgICAgICAgICBjYXNlIEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQ6
DQo+PiBAQCAtNjIyLDE0ICs2MjIsMjIgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVh
cl9hZGRyKA0KPj4gICAgICAgICAgICAgICAgIH0NCj4+DQo+PiAgICAgICAgICAgICAgICAgaWYg
KCBwMm10ID09IHAybV9pb3JlcV9zZXJ2ZXIgKQ0KPj4gLSAgICAgICAgICAgIHsNCj4+IC0gICAg
ICAgICAgICAgICAgZXJyID0gTlVMTDsNCj4+ICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7
DQo+PiAtICAgICAgICAgICAgfQ0KPj4NCj4+ICAgICAgICAgICAgICAgICBBU1NFUlQocDJtdCA9
PSBwMm1fcmFtX2xvZ2RpcnR5IHx8ICFwMm1faXNfcmVhZG9ubHkocDJtdCkpOw0KPj4gKw0KPj4g
KyAgICAgICAgICAgIGlmICggY3Vyci0+YXJjaC52bV9ldmVudCAmJg0KPj4gKyAgICAgICAgICAg
ICAgICAgY3Vyci0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCAmJg0KPj4gKyAgICAgICAgICAg
ICAgICAgaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudChhZGRyLCBnZm4sIHBmZWMpICkNCj4+ICsg
ICAgICAgICAgICAgICAgZXJyID0gRVJSX1BUUih+WDg2RU1VTF9SRVRSWSk7DQo+PiAgICAgICAg
ICAgICB9DQo+PiAgICAgICAgIH0NCj4+ICsgICAgLyogQ2hlY2sgaWYgYW55IHZtX2V2ZW50IHdh
cyBzZW50ICovDQo+PiArICAgIGlmICggZXJyICkNCj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4N
Cj4+ICAgICAgICAgLyogRW50aXJlIGFjY2VzcyB3aXRoaW4gYSBzaW5nbGUgZnJhbWU/ICovDQo+
PiAgICAgICAgIGlmICggbnJfZnJhbWVzID09IDEgKQ0KPiANCj4gRmlyc3Qgb2YgYWxsIEkgaGF2
ZSB0byBhcG9sb2dpemU6IEluIGVhcmxpZXIgcmVwbGllcyBJIHJlZmVycmVkDQo+IHRvIHVwZGF0
ZV9tYXBfZXJyKCkuIEkgbm90aWNlIG9ubHkgbm93IHRoYXQgdGhpcyBpcyBhIHN0aWxsDQo+IHBl
bmRpbmcgY2hhbmdlIG9mIG1pbmUsIHdoaWNoIEFuZHJldyBjb250aW51ZXMgdG8gb2JqZWN0IHRv
LA0KPiB3aGlsZSBJIGNvbnRpbnVlIHRvIHRoaW5rIGl0IChpbiBvbmUgZm9ybSBvciBhbm90aGVy
KSBpcyBuZWVkZWQ6DQo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRt
bC94ZW4tZGV2ZWwvMjAxOC0wOS9tc2cwMTI1MC5odG1sDQo+IA0KPiBHaXZlbiB0aGUgdW5wYXRj
aGVkIGNvZGUsIEkgdGhpbmsgeW91ciBjaGFuZ2UgaXMgY29ycmVjdCwgYnV0DQo+IHF1aXRlIHBv
c3NpYmx5IHlvdXIgZWFybGllciB2YXJpYW50IHdhcywgdG9vLiBCdXQgc2luY2UgdGhlDQo+IHVu
cGF0Y2hlZCBjb2RlIGlzIGltbyB3cm9uZywgSSdkIHByZWZlciBpZiB0aGUgVk0gZXZlbnQgc2lk
ZQ0KPiBjaGFuZ2Ugd2FzIHB1dCBvbiB0b3Agb2YgdGhlIGZpeGVkIGNvZGUsIGluIG9yZGVyIHRv
IG5vdCBmdXJ0aGVyDQo+IGNvbXBsaWNhdGUgdGhlIGFjdHVhbCBmaXggKHdoaWNoIHdlIG1heSBh
bHNvIHdhbnQgdG8gYmFja3BvcnQpLg0KDQpUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLCBJ
IHdpbGwgaGF2ZSB0byB3YWl0IGZvciB0aGlzIHBhdGNoIHRvIGdvIA0KaW4gYW5kIHRoZW4gc3Vi
bWl0IGFub3RoZXIgdmVyc2lvbi4gVGhpcyBuZXcgZnVuY3Rpb24gd2lsbCB3b3JrIHdpdGggbXkg
DQpuZXcgZXJyb3IuDQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
