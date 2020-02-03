Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7819C15034E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 10:24:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyXw0-0008L0-7T; Mon, 03 Feb 2020 09:22:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lv7t=3X=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iyXvy-0008Kv-J8
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 09:22:22 +0000
X-Inumbo-ID: ae58e8cc-4666-11ea-b211-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::713])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae58e8cc-4666-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 09:22:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmnKi9PWNxAs7KznAefOU2nAZYiXOU9ZH/qkabh/7VN8+ldQIYnrygYEK2sf9uI+I7DgMk9bix//m3V4d/Zb2SbJ2mKaby4m53HXovtrVWi5XVRqXCFxLxTtpTaU2pxS7E0VGhuqH2lu+0YQfhDboKhMAmDZw/RlkolI5ffON06stSO49ftGbPv2+qaup9c0yO2543yvJEhNSLMpdCTWB7huwQtbRBXF+bldkZSWgzS2TUcbru/y69cLA6WsAbZx6Sm7uoDwMpKo+s277v1BqO1o29zwfrQPGABIxO/pnft5GJSzjSP1GtDxCdDX4srorKCrr/RiimYuuBxZSxM8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZvoKrJSbMZAtu/wROZ2vsQzMoKYDjjVyBG4ipDXAH4=;
 b=XlL0YM8Jmm5mNkPBdZdVwxlT7qt+/JGwP0tA+Q3YqjAYDdWSwOT7wyscbCePj8e0niVq3G18KV68N0vlBOvZKzrTJ03TtQF8WWDsn+7gPBAUpn/FB04EVQpU1wGusBU07NevtarrzVygkb7rhWbdTccbDJUPTOMfTA6Cg+jjZHrJmn8nn3T50oU6tsiXP2m5/4amWA5yAiJx9rTuNQydr8M4xASgbwgLQFWJMvCC3CxvxhjQ68kUy4tUIWlrng7NWEnvHRb+9sEka3qf5TPyStXh6JuDZ+pQkDb8abntScDBqJ7vAQTANI/n1OyAigE1FVRxXrVxPoNRzuyLAOm5/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZvoKrJSbMZAtu/wROZ2vsQzMoKYDjjVyBG4ipDXAH4=;
 b=Kk7Y7Tf0bfU+/IR7BcT0VS0DIq00zWTnp+8CeAHNlxs5h1xmzeYv+w70WxKEL4VcNVBxvP2go84/HxnXfGpl0pJM5a7vfLyY1fHE6m7CMPDaa7ZewzEqaheLfeiIqMhdcujcSf0KmwnAFC8VswMf8Q1skZNEVSCsjlr8kUpM0fo=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB2982.eurprd02.prod.outlook.com (10.175.234.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.32; Mon, 3 Feb 2020 09:22:20 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2686.028; Mon, 3 Feb 2020
 09:22:20 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29 via Frontend Transport; Mon, 3 Feb 2020 09:22:19 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 1/7] SVM: drop asm/hvm/emulate.h inclusion from vmcb.h
Thread-Index: AQHV2FV+Rg7hEHTUbEeINRuimGDPpqgJNjEA
Date: Mon, 3 Feb 2020 09:22:20 +0000
Message-ID: <03bf1f1d-5db0-b283-d5d5-17f48d5011ec@bitdefender.com>
References: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
 <bfc4d4ad-85a5-2d79-748a-c7b72ba40bce@suse.com>
In-Reply-To: <bfc4d4ad-85a5-2d79-748a-c7b72ba40bce@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21)
 To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a78632f1-8d46-45d0-f254-08d7a88a91bc
x-ms-traffictypediagnostic: DB6PR02MB2982:|DB6PR02MB2982:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR02MB298281636372CCDC2702F050AB000@DB6PR02MB2982.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0302D4F392
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39840400004)(366004)(396003)(346002)(376002)(189003)(199004)(956004)(86362001)(5660300002)(2616005)(26005)(31696002)(54906003)(110136005)(16576012)(81156014)(81166006)(6486002)(316002)(6666004)(52116002)(66556008)(66446008)(8676002)(64756008)(8936002)(66946007)(7416002)(31686004)(71200400001)(66476007)(4744005)(107886003)(53546011)(4326008)(16526019)(186003)(36756003)(478600001)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB2982;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y6xr5m1JkIQGPRvlyqBlvCJKhxjpd755YQmKRIPSUZXDzAwBIyt0AbQM8YBdL59rf94m5QjlxI1PypU8fKK7A+VArr6RjbPxT0bZuJvcNLLIt2ZCOAqm+5EEe01I4vpD6jTgOOveR/CySMrNb2FcoiHXS03Mzuh1LbedOy78kd8dedDO8OFvRKYoP6+Yk7jrZ5BeECj/p42E9FwTUWBV1MdHUnS8DF4IcYoZhfAFOMLxxDDJvHYjrrjz119s7scqarEwpen0sISW5UcoTR8ZXi5/7ztpbTmmJYaK5UIKd1HlxMkn2NTs/hhr2SsVwHjVh/kIgsk+P4tI6alZGT9zP0EcvlfpGzDcQhiTBHnjSBbIvKkI59nKf8cF/NwMc/RheNzimL8tBureDD53X7d+BpDpfZp7aahiKq/HJiZMqTjDOwqLhwD1edPVmOy4rbM/
x-ms-exchange-antispam-messagedata: cRLCNk0wEYeGHG6xKkFgPjiIfSI05qDOlSae82jstGyz4rlLeTXbqdjU4NXVsqS0qJ0FiYR2GT/LMX1NEYac8WLfu8455avGNrB/SzxiSVpAD4naeKJ0Oz3SAzwKsm3FBezc65cTnZcDgIIcomHmkw==
Content-ID: <D9A48EA0FB84C7418749D0AD0C5E4BBF@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78632f1-8d46-45d0-f254-08d7a88a91bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2020 09:22:20.1795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MpaLCnTVzov+JDDjHYZbSvWzdjsw1xG6ALXdzoqDptN4u5f4g7RHpZ7xhlFcTy5NOZxElKRENJhEgz7YfbEMenQHGxatAdjp6i9njO5H0CY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB2982
Subject: Re: [Xen-devel] [PATCH v4 1/7] SVM: drop asm/hvm/emulate.h
 inclusion from vmcb.h
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
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDMxLjAxLjIwMjAgMTg6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBJdCdzIG5vdCBu
ZWVkZWQgdGhlcmUgYW5kIGludHJvZHVjZXMgYSBuZWVkbGVzcywgYWxtb3N0IGdsb2JhbA0KPiBk
ZXBlbmRlbmN5LiBJbmNsdWRlIHRoZSBmaWxlIChvciBpbiBzb21lIGNhc2VzIGp1c3QgeGVuL2Vy
ci5oKSB3aGVyZQ0KPiBhY3R1YWxseSBuZWVkZWQsIG9yIC0gaW4gb25lIGNhc2UgLSBzaW1wbHkg
Zm9yd2FyZC1kZWNsYXJlIGEgc3RydWN0LiBJbg0KPiBtaWNyb2NvZGUqLmMgdGFrZSB0aGUgb3Bw
b3J0dW5pdHkgYW5kIGFsc28gcmUtb3JkZXIgYSBmZXcgb3RoZXINCj4gI2luY2x1ZGUtcy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
