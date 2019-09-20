Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5E3B8D0E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 10:41:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBEO2-00041z-HV; Fri, 20 Sep 2019 08:35:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ihh=XP=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iBEO0-00041u-8L
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 08:35:28 +0000
X-Inumbo-ID: 9873c978-db81-11e9-a337-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.121]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9873c978-db81-11e9-a337-bc764e2007e4;
 Fri, 20 Sep 2019 08:35:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ol/6rbYtqBH2AEDMgM3lWvqZZ2SS6FC2bElm5u7Oib7XaJPnLcpwOtESys5f4DZawlpgB+zkTfqCBwAlRHsqJz8x66XlNtHGP1i3PeXrOeVZOl3ejKq75nFc24iHIwhZseiaINBkyrsbM17avFE8xDkGMYMskMoSeYR8NW0kVIMCBTEmfWU9TOTd5IUuHIJo7yZqP9vY2iBujZ/tz5jpBVUx/8K96L5qjrqvBNUtUfOHCBFdXypZuGkQEwlS3RK7AxQK7S4EVYGGVl5dp/jIMHRsHbSZPR7PYs0uxQAVEEzkfPzf4ESYSw3oy0RIyu4q1f0djh6uovMNHJUHugCn4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bfH3oQwtExve5RnX8Bv0lL4BFDEftpgVZVwnwkU8SQ=;
 b=m31Ll/yAN7wTObwpfdPaik3DRikXljYAf6V9mRoQ1deu8pMGKjv69evSLffwOIkh4QOo/MYn06uATTMOo1wgTR4GVQNdk3wtDLAbhJw5BnxoxWmlr4VELSbGyGsSWZwBH6dnHcRsf7ISZoCYeesnVoVWh0xtEgnFvsrDbdaTN99wf+Di4yAA12CzuL3Nk8exMaD1ndEFPxxANWrwc02upSwm5h5wvXQ4/o6bKiIc3asj6QhLukVCVAHu+C3h0M2PPoPQ0u62dVtpJExax6XYwJJ89w5k+iKOoUQnNvYoWe3NR3Q7at7sr02wviQCSHTUxwvh6BGaoSxs50SdX+k9NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bfH3oQwtExve5RnX8Bv0lL4BFDEftpgVZVwnwkU8SQ=;
 b=JSSYuJpRRGJMviW79uZlTX7dR6Ogf34vsjksEhb5RGLV01ltZ+KsIUIz5Bof3EdqFku76z9s1KUXa89/qAONbi76ppytLGPC8W4aQ7EPCDtej9t4w2iSzRM7faCWF2L/0uwD7AGm1qxe6Tqx+YT+3xs6n8Q/HbuJQA/3jpcqsrM=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5926.eurprd02.prod.outlook.com (10.141.174.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Fri, 20 Sep 2019 08:35:25 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2284.023; Fri, 20 Sep 2019
 08:35:25 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v11] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVbuqvObi2c4eeME6qC/Xll4ji7KczByuAgAFh1oD//9LPAIAAAwqA
Date: Fri, 20 Sep 2019 08:35:25 +0000
Message-ID: <846667d0-33dc-3f9e-4e09-7a6e70fc994f@bitdefender.com>
References: <20190919130338.3132-1-aisaila@bitdefender.com>
 <03e3bb4f-e6da-b5a5-d337-4e91215dc2fe@suse.com>
 <f2532730-7528-9819-1653-83f901acc754@bitdefender.com>
 <be92ed8d-f49e-8455-2316-ec28453c236d@suse.com>
In-Reply-To: <be92ed8d-f49e-8455-2316-ec28453c236d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0902CA0005.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::15) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f049890-30d1-4839-f266-08d73da57bc0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5926; 
x-ms-traffictypediagnostic: AM7PR02MB5926:|AM7PR02MB5926:|AM7PR02MB5926:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB5926ED851F2CB39779FC1281AB880@AM7PR02MB5926.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(396003)(376002)(346002)(39860400002)(51914003)(189003)(199004)(6246003)(2616005)(14454004)(486006)(102836004)(66476007)(52116002)(186003)(66556008)(5660300002)(66946007)(26005)(81166006)(8936002)(81156014)(64756008)(386003)(66066001)(53546011)(66446008)(256004)(6506007)(25786009)(476003)(6436002)(14444005)(2906002)(6512007)(4326008)(11346002)(54906003)(6486002)(3846002)(478600001)(8676002)(229853002)(6116002)(316002)(71190400001)(71200400001)(86362001)(31696002)(6916009)(76176011)(36756003)(99286004)(7736002)(446003)(305945005)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5926;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JTV4r4QuVDJSsX7dqXvfIdUck5RLummqYr4YwhZjsUjilNcT3l7blSbKuWEJDYPB37OPSg/g5Nurtm8WKbQEwTQ7xjkAotWp/2b6Nf7ezps1XpOH6u2thlvIfowFgjOZViXJYALEir0tasACATN0leycVuau7QEauLWZxCVki8v1BGQbpgZkRRi00CGhN64abTNU/RsGUZT+3FWXhmMNLlL4pX7aP8wV/ZPz4ofeJ+q8BlTHkvatOJDxExODycPD/h4r1tlg8JcKj50wjXHV3bM/nEjrZLnhTplyr2OFpLQSa19fV1iDh12w3Xx/FiWKF+pTLrxp5HPE3hna+GfqGfHZoJgMTGToGKuWiASqIW+M9rr4JgDJUg8uNsY4kSERDlG9Xwapbx9ha/j6elV7VGpja0PEHHoUfQ9ve8YRYNY=
Content-ID: <75FB4D2C5B18EE40ABDF1327EA3BCAFC@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f049890-30d1-4839-f266-08d73da57bc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 08:35:25.2275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o04dFdTw2+Lrj7y5VzE81lcAsFvO4QD+SrgftVUS3l/2cTwvL1GG+LS/sGdnJZyXsBEPN6dW8hcdJlyszZUG27H9C7dDJhIqT/b0zMyX8nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5926
Subject: Re: [Xen-devel] [PATCH v11] x86/emulate: Send vm_event from emulate
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

DQoNCk9uIDIwLjA5LjIwMTkgMTE6MjQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4wOS4y
MDE5IDEwOjA2LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IE9uIDE5LjA5LjIw
MTkgMTY6NTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IEZ1cnRoZXJtb3JlIHdoaWxlIHlvdSBu
b3cgcmVzdHJpY3QgdGhlIGNoZWNrIHRvIGxpbmVhciBhZGRyZXNzDQo+Pj4gYmFzZWQgYWNjZXNz
ZXMsIG90aGVyIHRoYW4gdGhlIGRlc2NyaXB0aW9uIHNheXMgKG9yIGF0IGxlYXN0DQo+Pj4gaW1w
bGllcykgeW91IGRvIG5vdCByZXN0cmljdCBpdCB0byByZWFkIGFuZCBleGVjIGFjY2Vzc2VzLiBJ
dCdzDQo+Pj4gbm90IGNsZWFyIHRvIG1lIHdoZXRoZXIgdGhhdCdzIGludGVudGlvbmFsLCB5ZXQg
aXQgYWZmZWN0cyB3aGljaA0KPj4+IGh2bV9jb3B5XypfbGluZWFyKCkgY2FsbGVycyBuZWVkIGF1
ZGl0aW5nLg0KPj4NCj4+IFRoZSBwZmVjIHZhciBpcyBjaGVja2VkIGluIGh2bV9tb25pdG9yX2No
ZWNrX3AybSgpLiBJZiB5b3UgdGhpbmsgaXQgaXMNCj4+IG5lY2Vzc2FyeSBJIGNhbiBhZGQgb25l
IG1vcmUgY2hlY2sgaGVyZSBmb3IgKHBmZWMgJiAoUEZFQ19pbnNuX2ZldGNoIHwNCj4+IFBGRUNf
d3JpdGVfYWNjZXNzKSkuDQo+IA0KPiBodm1fbW9uaXRvcl9jaGVja19wMm0oKSBnZXRzIGNhbGxl
ZCBmcm9tIHR3byBwbGFjZXMsIHNvIGEgY2hlY2sNCj4gdGhlcmUgd29uJ3QgaGVscCAoYWZhaWN0
KS4gVGhlIHF1ZXN0aW9uIHdoZXRoZXIgdG8gcHV0IGFuDQo+IGFkZGl0aW9uYWwgY2hlY2sgaGVy
ZSBkZXBlbmRzIG9uIHdoZXRoZXIsIGFzIHRoZSBkZXNjcmlwdGlvbg0KPiBzYXlzLCB5b3UgcmVh
bGx5IG9ubHkgd2FudCB0byBoYW5kbGUgcmVhZC9leGVjIGFjY2Vzc2VzIGhlcmUsDQo+IG9yIHdo
ZXRoZXIgeW91IGFsc28gd2FudCB0byBjb3ZlciB3cml0ZSBvbmVzIChpbiB3aGljaCBjYXNlIHRo
ZQ0KPiBkZXNjcmlwdGlvbiBzaG91bGQgYmUgYWRqdXN0ZWQgc28gdGhhdCBpdCdzIG5vdCBtaXNs
ZWFkaW5nKS4NCg0KSW5kZWVkIGNvdmVyaW5nIHdyaXRlIGFjY2VzcyBoZXJlIGFzIHdlbGwgYXMg
aW4gDQpodm1lbXVsX21hcF9saW5lYXJfYWRkcigpIGlzIG5lZWRlZC4gSSB3aWxsIGFkanVzdCB0
aGUgY29tbWVudC4NCg0KPiANCj4+PiBGaW5hbGx5LCB3aGF0IGFib3V0IC0+YXJjaC52bV9ldmVu
dC0+c2VuZF9ldmVudCByZW1haW5pbmcgc2V0DQo+Pj4gYWZ0ZXIgaHZtX2VtdWxhdGVfb25lX3Zt
X2V2ZW50KCksIGJlY2F1c2UgaHZtX21vbml0b3JfY2hlY2tfcDJtKCkNCj4+PiAodGhlIG9ubHkg
cGxhY2Ugd2hlcmUgdGhlIGZsYWcgd291bGQgZ2V0IGNsZWFyZWQpIHdhcyBuZXZlciBoaXQNCj4+
PiBpbiB0aGUgcHJvY2Vzcz8NCj4+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQsIGluZGVl
ZCBpdCdzIGEgcHJvYmxlbSBoZXJlLiBBIHNvbHV0aW9uIGNhbg0KPj4gYmUgdG8gbW92ZSBzZW5k
X2V2ZW50ID0gZmFsc2U7IGFmdGVyIGh2bV9lbXVsYXRlX29uZV92bV9ldmVudCgpIGlzDQo+PiBm
aW5pc2hlZC4gQW5kIHN0YXRlIGluIHRoZSBjb21tZW50IHRoYXQgdGhlIHVzZXIgaXMgaW4gY2hh
cmdlIG9mDQo+PiBlbmFibGluZyBhbmQgZGlzYWJsaW5nIHRoZSBmbGFnLg0KPj4gT3IganVzdCBo
YXZlIGl0IGluIGJvdGggcGxhY2VzLg0KPiANCj4gRm9yIHRoaXMgYXNwZWN0IGFsb25lIEkgdGhp
bmsgeW91IHdhbnQgaXQgaW4gYm90aCBwbGFjZXMsIGJ1dCAuLi4NCj4gDQo+Pj4gQW5kIHdoYXQg
YWJvdXQgYW4gaW5zdHJ1Y3Rpb24gYWNjZXNzaW5nIHR3byAob3INCj4+PiBtb3JlKSBkaXN0aW5j
dCBhZGRyZXNzZXM/IFRoZSBmbGFnIHdvdWxkIGJlIGNsZWFyIGFmdGVyIHRoZSBmaXJzdA0KPj4+
IG9uZSB3YXMgY2hlY2tlZCBhZmFpY3QuDQo+Pg0KPj4gVGhlcmUgaXMgbm8gcHJvYmxlbSBoZXJl
IGJlY2F1c2UgZW11bGF0aW9uIHdpbGwgc3RvcCBhZnRlciB0aGUgZmlyc3QgYmFkDQo+PiBhY2Nl
c3Mgc28gdGhlcmUgaXMgbm8gbmVlZCB0byBjb250aW51ZS4NCj4gDQo+IC4uLiBmb3IgdGhpcyBt
b3ZpbmcgaXQgbWF5IGluZGVlZCBiZSBuZWNlc3NhcnkuIEkgaGF2ZSB0byBhZG1pdA0KPiB0aGF0
IEkgZG9uJ3QgZm9sbG93IHlvdXIgcmVwbHkgaGVyZTogVGhlIGZsYWcgd2lsbCBhbHNvIGJlIGNs
ZWFyDQo+IGFmdGVyIHRoZSBmaXJzdCBnb29kIGFjY2VzcyAoYWZhaWN0KSwgYW5kIGhlbmNlIGZ1
cnRoZXIgYWNjZXNzZXMNCj4gYnkgdGhlIHNhbWUgaW5zbiB3b24ndCBtYWtlIGl0IGludG8gaHZt
X21vbml0b3JfY2hlY2tfcDJtKCkgYXQgYWxsLg0KPiANCg0KT2sgSSB3aWxsIG1vdmUgaXQgZnJv
bSBodm1fbW9uaXRvcl9jaGVja19wMm0oKSBhbmQgYWRqdXN0IHRoZSBjb21tZW50IA0KYWNjb3Jk
aW5nbHkuDQoNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LA0KQWxleA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
