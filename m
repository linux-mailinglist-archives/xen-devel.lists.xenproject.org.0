Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B62F01CA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 16:45:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS0yr-0000bb-Vv; Tue, 05 Nov 2019 15:42:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61et=Y5=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iS0yq-0000bV-Oh
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 15:42:52 +0000
X-Inumbo-ID: ecdb0762-ffe2-11e9-9631-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::706])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecdb0762-ffe2-11e9-9631-bc764e2007e4;
 Tue, 05 Nov 2019 15:42:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEeplcvdjvWfoQesUiLr9s55V32A7U1juClXsyHda9bYXopRkne9YU59DYzieUFanWbTIoGQAC/9p1rSSGdol4vdY9b5eijmXT49p8/FoBWOu51rFGN40KPBO+GPp+Ow80oL6djUyAKUtGWUxhpqUB9x8Drri+iRKNOZpfVxqDF3MbYVL8GlKKenmfLJbOicKKe6LnE5DVP2G6+wcDVdK3/ZoYm8fJR4i9LJgaeQKfyojvJYiaRzCO0VXXkRCSihjAAEI3m28fvmuG26NBBUlcXL2tOrjPh5YQOaS9Rb+zG6wLP0uH0onGRGUANWyQ3YJcksg90cfAlLdJM96RBuiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8JYhSzRLTqjTvKP822niys9o+K6/gujpTCbcdD0ikY=;
 b=h2jG4HXC94FE4GZOuO7V7mZnJ9emX66xApDw4SqFC2pRFY9SBcstTf9q/QmUfAANzvkYTmiLSa5RTt4ROBVyIyHyrky8BuIDemOk9mUtOE7T23TV7r4oiZVlCCYBPEq7j6Q+b9vIBYZ+75X23wntp2QQFbtAYQ+zkrrc4V/SDWL50uNalXoiXFiyXf4Hus9QiqE+7eLRmyw3MHVj7Gx6j9wNH8+nP4MMLEHik5GkiArdeLEivq298j16Jf9UqEIQEVnFDFrBtRTGv45tqKb3pQG5u/GQAJjoxsTeZjUnlh1lX3YqQ9C32p91wtn1II8ussaPL6k2YgB7OcRF5pRgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8JYhSzRLTqjTvKP822niys9o+K6/gujpTCbcdD0ikY=;
 b=DqIidUiBhj5iZET/emF4A0Ccl2L8gLBoQBm5WJIYq9Zbu62iq2oDA51N2v59vN9iz8Y4ieQHS/X4FIBfETyjsoQKGFIzBXxj0L64zETH05CmaJHNgXH1WnhK/AWBzUmW5JbDap+CDMsXHxiK17yKGfLvms/4awzOYkAh/iDP/eA=
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com (52.133.30.28) by
 AM6PR0202MB3573.eurprd02.prod.outlook.com (52.133.27.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 15:42:50 +0000
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::a569:5be5:9861:577d]) by AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::a569:5be5:9861:577d%5]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 15:42:50 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V1 2/2] x86/mm: Make use of the default access param from
 xc_altp2m_create_view
Thread-Index: AQHVk9arLQo4LWM9kUCPbXccC8LyK6d8tpkAgAABEgA=
Date: Tue, 5 Nov 2019 15:42:50 +0000
Message-ID: <ffe45cbf-3f81-507c-a753-68e87bef28f6@bitdefender.com>
References: <20191105124332.4380-1-aisaila@bitdefender.com>
 <20191105124332.4380-2-aisaila@bitdefender.com>
 <76b202f4-2e2b-a360-de5c-716882cb8ecc@citrix.com>
In-Reply-To: <76b202f4-2e2b-a360-de5c-716882cb8ecc@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0701CA0022.eurprd07.prod.outlook.com
 (2603:10a6:200:42::32) To AM6PR0202MB3413.eurprd02.prod.outlook.com
 (2603:10a6:209:1c::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ae1ed48-e945-4f37-513d-08d76206d03f
x-ms-traffictypediagnostic: AM6PR0202MB3573:|AM6PR0202MB3573:|AM6PR0202MB3573:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0202MB357324DE60E8CA8F8D289258AB7E0@AM6PR0202MB3573.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(366004)(376002)(396003)(346002)(189003)(199004)(5660300002)(52116002)(102836004)(386003)(86362001)(4326008)(76176011)(107886003)(66946007)(2616005)(25786009)(6512007)(229853002)(6116002)(3846002)(99286004)(36756003)(14454004)(53546011)(31686004)(64756008)(316002)(486006)(4744005)(81156014)(446003)(11346002)(110136005)(54906003)(6506007)(31696002)(7416002)(305945005)(7736002)(26005)(66066001)(2501003)(66556008)(2906002)(6246003)(81166006)(71200400001)(6436002)(8936002)(8676002)(256004)(71190400001)(6486002)(476003)(66476007)(66446008)(186003)(14444005)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR0202MB3573;
 H:AM6PR0202MB3413.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VzNMYY4rwyyEbB5dwBQdaeJjerdBzYsZ1F7wRSzhkBvAirDY0KgqlxqkuHi40Nt0uh+6VAIFFBmsO3xXIEDI7hCYVWT2dvgtKug8hiSk8n4S7aai+0emF+1FsyQBsbZ1lqKe2TsJtrmrSSpdAlY66qtgalFyjILWDLPuiCzqmD6wKA3DFkLRPnC/91sYG2AY4RC09Rs4/XWdFOLFeqDJc4F3MARrYmqQla4J3rQk1qvpondR2fZ6KUzB446xrdzdmuDPZ8KaMEeMD+kx06SYIhcgOf4R6Qwfv51piCIJ/hoc8AXktLrnbWplDzZCfosdlJ8uXTOWt0BDTJXLOkmdvw5oU1UDOYia/WzeUezG7+2Dem+554gUhe9ijT59l/zSHfuA182T05Le4NvDU1UnMpqjGr3pNvaptBA12Gt7rEN4fdymZpdOr01YY2To4bmC
Content-ID: <B4270CE7A43FA741AA475B6311319DCB@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae1ed48-e945-4f37-513d-08d76206d03f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 15:42:50.0580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +x4szkYdZtbTnG9E1YoJVcSyvr0g+l9y76Tdv9KOcovrfvwekEdQCvL4bD5Rc58E8jTGEax31N0gHf5X1KnE3siS9PTJxQMDlK1FGKdNJWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3573
Subject: Re: [Xen-devel] [PATCH V1 2/2] x86/mm: Make use of the default
 access param from xc_altp2m_create_view
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
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA1LjExLjIwMTkgMTc6MzgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIDExLzUv
MTkgMTI6NDMgUE0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4gQXQgdGhpcyBt
b21lbnQgdGhlIGRlZmF1bHRfYWNjZXNzIHBhcmFtIGZyb20geGNfYWx0cDJtX2NyZWF0ZV92aWV3
IGlzDQo+PiBub3QgdXNlZC4NCj4gDQo+IFdlaXJkIQ0KDQpJbmRlZWQsIGl0IHdhcyBidWdnaW5n
IG1lIGV2ZXJ5IHRpbWUgSSBwYXNzZWQgdGhyb3VnaG91dCB0aGF0IGNvZGUuDQoNCkFsZXgNCg0K
PiANCj4+DQo+PiBUaGlzIHBhdGNoIGFzc2lnbnMgZGVmYXVsdF9hY2Nlc3MgdG8gcDJtLT5kZWZh
dWx0X2FjY2VzcyBhdCB0aGUgdGltZSBvZg0KPj4gaW5pdGlhbGl6aW5nIGEgbmV3IGFsdHAybSB2
aWV3Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0
ZGVmZW5kZXIuY29tPg0KPiANCj4gQWNrZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4NCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
