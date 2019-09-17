Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75832B51BB
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 17:43:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAFZV-0003hM-D0; Tue, 17 Sep 2019 15:39:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=biJV=XM=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iAFZT-0003gQ-6Z
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 15:39:15 +0000
X-Inumbo-ID: 4cf302ec-d961-11e9-9619-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.136]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cf302ec-d961-11e9-9619-12813bfff9fa;
 Tue, 17 Sep 2019 15:39:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VO2KCvBidZlGjrbtb1s1i35Quk0XhaRNktMSNJ2QhxYhZyDwz81fRNAqcDhJJsDJ9YdfV+ce+5GidbTd35mUEKO5ATvAcJgGJ//I/VvvgdVT/5mqQbJEQEHIasQgo4luuahB311wlPWK47RW5mJAIr9KLCzlySxP5Cr/F/GvtuuFzTu7yKCKttmbRF44axOiTXL5X+1u05sC87nG+ihipDMPZDXRAmKi2Uahh1UYT9J+PuhDLVBbCDu/kzMViH/7gfebBNPBVEs8DNW3cKKqA1Ym08FWELE9H8BJ2qaist4Vxx3hH5TFgvARTRnqStChJLGsvq8ZcBETsbhIPmYkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAyzpw+sgphUgb2993Z5tkIwNVouyyz03cfjX4NJPMg=;
 b=LIeTmBFdSLBj/anXOBdmeI/lwycI+5NJvoKItEKpZeFZgQH7pT5dQBL7qhOWeE8z2tHmsGK+3paq87zwcKiAbO9xsAt5UyVTjHuG0rtBGI+su7SHF/PHxH6UuA++3ncukCuvv/CAzHtwvUzRnA0HsIt6zUCRKXjOA7VE1L4L6PDVlAAHRrPDHpG1l8Tr2WowfZ4oVLIeir/dddDKs5e0k5pioQKucjkUzFAxEt7qELyo1jFtxvQLQ8n4qqY//qpnl96/jiqEFi+TnL8ll1UbZu1F4rrVQ9elG30FV83IvrSsajfvqPdHVMpWjydMTWsBUgZU6VTU81H73qc//alMqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAyzpw+sgphUgb2993Z5tkIwNVouyyz03cfjX4NJPMg=;
 b=IprGw2NzWIG0daILV4lwb4ocIjxZemSGar8GuXx5FAFKsFFaybwHYinUMqOgwL71FG+D7xH4EpJM2dH/tE/dwnbhzb7xYHxvQiI99dv5Ski4Qx5ExMhUJ4ghIlEb6HT+p9swGARkDKDtIZP1twdXXSWar8AMbCVZKuuVam6cMjU=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5815.eurprd02.prod.outlook.com (10.141.173.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Tue, 17 Sep 2019 15:39:12 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 15:39:12 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVbGY5LYraxeTPu06yM6Qe3Haip6cudlQAgAEKjgCAAATfAIAAl0IA///TxQCAADniAP//zwuAgAAJlwA=
Date: Tue, 17 Sep 2019 15:39:12 +0000
Message-ID: <180e12c1-501b-d638-6f21-14e39de6dc06@bitdefender.com>
References: <20190916081024.20931-1-aisaila@bitdefender.com>
 <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
 <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
 <f791ad24-a106-1cf6-2ff8-53adca03b1d5@suse.com>
 <65dcce1f-e73a-230d-83bd-271b6312bc48@bitdefender.com>
 <7a5adec2-4134-9617-555c-3dd2adf140ac@suse.com>
 <b1f9bb69-5fe5-69b8-0dce-93d13f363b0a@bitdefender.com>
 <5fe3bf07-31e7-12c8-ad2b-0fb1fe15c226@suse.com>
In-Reply-To: <5fe3bf07-31e7-12c8-ad2b-0fb1fe15c226@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::32) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fb272de-36ef-4e21-557c-08d73b853069
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM7PR02MB5815; 
x-ms-traffictypediagnostic: AM7PR02MB5815:|AM7PR02MB5815:|AM7PR02MB5815:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB58156C8FE5C2BAEA7148F5A4AB8F0@AM7PR02MB5815.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(366004)(39860400002)(376002)(136003)(199004)(189003)(4326008)(5660300002)(6486002)(476003)(4744005)(76176011)(66446008)(6436002)(6512007)(66476007)(66946007)(64756008)(2906002)(66556008)(52116002)(486006)(81156014)(8676002)(446003)(11346002)(31686004)(478600001)(14454004)(86362001)(31696002)(81166006)(229853002)(256004)(71190400001)(71200400001)(6916009)(6246003)(25786009)(14444005)(3846002)(8936002)(36756003)(6116002)(99286004)(102836004)(305945005)(316002)(7736002)(386003)(53546011)(26005)(186003)(54906003)(2616005)(66066001)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5815;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J6KmJfyTOoolMmXy0AAAm3zavKnz49Lm31JNsRY8K6JHx/cpMwDOz+7y+bQrBTY3MDdkc1EaNpFMfGIXycDaLfveo8hv9JVAYLMrzIAm5vGrd4OoVwlB84sVZqqhsRjqwcdhHnrttP0ux4tCl+bPexHtJx64ze3cQ7p2yM1uVlr4/puBaWt80wz3CkPy+XAKZMQXZo3oHbw0ozso7aPwbtZTAtr4PWcRJNZTp/CWCd5jXjHFUARg4A638sLdb92jHGJiaC95KkaW8XusN4TXJCxHHqUr3k2SpGiI1XThcM/FWtKSnR57Jjz40//AFlQUoMmZVYTJlFttYh0K/z0M9eMOmDSZaDbwDknjbkfxmAGJgChNCq1L097U1HyNbwOA5xuAHbsdPk30KC0NqBWYad+zj3WaliBCACoXvLfrHag=
Content-ID: <AD0EC8F985286742A1F5A53FCCFD166E@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb272de-36ef-4e21-557c-08d73b853069
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 15:39:12.6904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k7sLjInt1Cv7LZRqr2+nG4Fn9ELF6GFcuhrrdQ9PL24H+AFe/bG+NOksSyICQW4+6TK48SajlZjExP9cuJrlvkzbbUJnQNEP6Sf0n6LoOeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5815
Subject: Re: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
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

DQoNCk9uIDE3LjA5LjIwMTkgMTg6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wOS4y
MDE5IDE3OjAwLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IFRoZXJlIGlzIG5v
IHByb2JsZW0sIEkgdW5kZXJzdGFuZCB0aGUgcmlzayBvZiBoYXZpbmcgc3VzcGljaW91cyByZXR1
cm4NCj4+IHZhbHVlcy4gSSBhbSBub3QgaGFuZ2VkIG9uIGhhdmluZyB0aGlzIHJldHVybi4gSSB1
c2VkIHRoaXMgdG8gc2tpcA0KPj4gYWRkaW5nIGEgbmV3IHJldHVybiB2YWx1ZS4gSSBjYW4gZG8g
dGhpcyBpZiB3ZSBhZ3JlZSBvbiBhIHN1aXRhYmxlIG5hbWUNCj4+IGZvciBhIG5ldyByZXR1cm4g
dmFsdWUgaW4gZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0LiBJIGNhbiBwcm9wb3NlDQo+PiBI
Vk1UUkFOU19iYWRfZ2ZuX2FjY2Vzcy4NCj4gDQo+IEhvdyBpbnRydXNpdmUgd291bGQgc3VjaCBh
IGNoYW5nZSBiZT8NCj4gDQoNCk9ubHkgdGhlIHJldHVybiBmb3IgaHZtX2NvcHlfdG9fZ3Vlc3Rf
bGluZWFyKCkgYW5kIA0KaHZtX2NvcHlfZnJvbV9ndWVzdF9saW5lYXIoKSB3aWxsIGJlIGFmZmVj
dGVkLg0KVGhlcmUgYXJlIDIgcGxhY2VzIHRvIGFkZCBjaGVja3MsIGluIGxpbmVhcl93cml0ZSgp
IGFuZCBsaW5lYXJfcmVhZCgpLg0KVGhlIG5ldyByZXR1cm4gdmFsdWUgY2FuIHR1cm4gdXAgb25s
eSBpbiBodm1fZW11bGF0ZV9vbmVfdm1fZXZlbnQoKSANCmNvbnRleHQsIHdoZW4gdm1fZXZlbnQt
PnNlbmRfZXZlbnQgZmxhZyBpcyB0cnVlLg0KDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
