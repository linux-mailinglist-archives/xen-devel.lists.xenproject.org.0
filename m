Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A0E6B8FF
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 11:14:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnfxy-0001YF-Mc; Wed, 17 Jul 2019 09:11:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3fL=VO=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hnfxw-0001Y6-V2
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 09:11:13 +0000
X-Inumbo-ID: d1dce7bc-a872-11e9-8980-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::707])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d1dce7bc-a872-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 09:11:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASzXJ6V7SxOLOzeDN6hhiVlep1suzIgJg0QXnwBlJKs3IW2+AcxYr1/+b++BRIM2R+DtOqWLpdsPEJEkaHK87SNvoII30B13T40eDkJxSReKfHKzLfQRHrji0MdbRJOYFOOKBPzmqIxLEX0C1KLkAlzjIE1mHUeXT5QobngL74Ln4FVKR6DkGkHME9UIA/kcjitxMD5tS000Mz8M/V8wo/GNjHZu86g0C6Z1raqbm1jmuioh4fO30EIZMYMZ1cUReI2fXDl+15WwglhFTmHDqXiSa8nRY9m5vMNeFm0RWFrZM3/5owwd/V7y3HHkKvm3EbbkHk1nubKSmnxVBGIIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9Bmcn94EXMYGZIMzHXSE1+U6FYYOMmOa+ULTTuLesk=;
 b=FkmvwrKrbLDCA3TpM+mEGGPhZg7ezWd5VhhWsOWfYrDQa6mcOc5+JJqpDUcb1F7OeMYnB0bQooBxS+7EoIro/r9q3tfSQRvSOs/iwx9byOSzzbdFQw6tdfNtOwCGLAlgnXKtwlF7vMvD2QTH88pbgAmzfjW9SiWOiC/WJ3Y3e6sQ66QURxNxPf7jCpGAzDdDn0li2fh5xwz1ygalHwp5sCrU74eT6Zc2FAgNdq7l4gFpxFHcpwHQ6sxL0r6GlLQbBvdyRFhKJmIunyf5Rki0GI8hLcDRodOkmpjfTZNvnzZHPUyDvuFBBepzpNXnuUsLo2JnrCU9LXY2KHodjciHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9Bmcn94EXMYGZIMzHXSE1+U6FYYOMmOa+ULTTuLesk=;
 b=ecFduitlxKgYrfts6ifCbZSXkzkM/CuQEiYsG1iKxwrRx3gApUmElH84bxLinm4Jq9PjJSmgK+9IWc4FsTXQPBmJhhxc6Za5x5OFuo/39ogXTgECNvmcE8hoVIQAu9SV4MjKLqZoyr65NRCb7KrKn3sFKrv+i9YbVhrVTKXr8io=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2974.eurprd02.prod.outlook.com (10.171.104.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 09:11:09 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03%8]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 09:11:09 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 02/10] vm_event: Remove "ring" suffix from
 vm_event_check_ring
Thread-Index: AQHVO/jo83WhiMK800GF+5ronuvC4KbOhy8A
Date: Wed, 17 Jul 2019 09:11:08 +0000
Message-ID: <317ee5b9-0a80-5dc6-01d1-66a1cacace16@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <05d37a1cb32ed76fe728f5ebb296aca55455b56a.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <05d37a1cb32ed76fe728f5ebb296aca55455b56a.1563293545.git.ppircalabu@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0018.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::30)
 To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f831e0e8-6839-472f-771a-08d70a96b4a8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2974; 
x-ms-traffictypediagnostic: VI1PR0202MB2974:|VI1PR0202MB2974:
x-microsoft-antispam-prvs: <VI1PR0202MB297454DF0562579AE8A7D0B6ABC90@VI1PR0202MB2974.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(376002)(366004)(136003)(396003)(199004)(189003)(229853002)(76176011)(52116002)(26005)(5660300002)(64756008)(66946007)(66446008)(66556008)(6486002)(68736007)(66476007)(486006)(102836004)(53546011)(6506007)(386003)(6436002)(256004)(186003)(6512007)(4744005)(66066001)(53936002)(54906003)(110136005)(6246003)(316002)(99286004)(31686004)(31696002)(478600001)(3846002)(2501003)(71200400001)(71190400001)(36756003)(86362001)(2906002)(305945005)(4326008)(81156014)(81166006)(8676002)(7416002)(446003)(14454004)(6116002)(11346002)(8936002)(2616005)(14444005)(476003)(7736002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2974;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DWPdkG5SuelC+zJ/X3HqzOLHUbU7KH9sXQLjcOIuHElmI/YelGCgoL/E8mtR+sEt4D6zAH6txr6Lst6xvMepHaWXhQrv4S2Jb1qMFzbIPMKHM9NXrB9zNeXbembFN+wPAE6V6i/gN46g1+meT4MFi95WM01dI9aYREXOinZxgPNrwo9DoJie7fPVXxZ21K8sgpH5H56g2gefpzypvC0yG9/U28odZgjnMqeHEImFAMlWAiqjypyJzAn2zwVu5q7/SIqLqjTy8A1KcDuUQKBBQe3cDX8DA7a0WUszL728Hz8BD+OP0AlpOitrr5bjekqPzJ1eCSXQpB7M3Nf37zerwmhBh/MXoVako1lb54XcicBWi+RLfYRF4MT8Knx/O6AfRT9B7Z29OjyE66WEMs7oQ6qfcAI7/nFKcXTq/W3afTc=
Content-ID: <4C18BB9E5EF83943B1DD81F84FF2D721@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f831e0e8-6839-472f-771a-08d70a96b4a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 09:11:09.0067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2974
Subject: Re: [Xen-devel] [PATCH v2 02/10] vm_event: Remove "ring" suffix
 from vm_event_check_ring
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE2LjA3LjIwMTkgMjA6MDYsIFBldHJlIFBpcmNhbGFidSB3cm90ZToNCj4gRGVjb3Vw
bGUgaW1wbGVtZW50YXRpb24gZnJvbSBpbnRlcmZhY2UgdG8gYWxsb3cgdm1fZXZlbnRfY2hlY2sg
dG8gYmUNCj4gdXNlZCByZWdhcmRsZXNzIG9mIHRoZSB2bV9ldmVudCB1bmRlcmx5aW5nIGltcGxl
bWVudGF0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2Fs
YWJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQo+IEFja2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+DQoNClJldmlld2VkLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJp
dGRlZmVuZGVyLmNvbT4NCg0KPiAtLS0NCj4gICB4ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jICAg
ICB8ICAyICstDQo+ICAgeGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyAgfCAgNCArKy0tDQo+
ICAgeGVuL2FyY2gveDg2L21tL21lbV9wYWdpbmcuYyAgfCAgMiArLQ0KPiAgIHhlbi9jb21tb24v
bWVtX2FjY2Vzcy5jICAgICAgIHwgIDIgKy0NCj4gICB4ZW4vY29tbW9uL3ZtX2V2ZW50LmMgICAg
ICAgICB8IDI0ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAgIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3BjaS5jIHwgIDIgKy0NCj4gICB4ZW4vaW5jbHVkZS94ZW4vdm1fZXZlbnQuaCAgICB8
ICA0ICsrLS0NCj4gICA3IGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIwIGRlbGV0
aW9ucygtKQ0KPiANCg0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
