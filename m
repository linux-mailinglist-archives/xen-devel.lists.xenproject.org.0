Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398441204F4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 13:08:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igp8B-0001F8-74; Mon, 16 Dec 2019 12:05:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wy9o=2G=suse.com=jnwang@srs-us1.protection.inumbo.net>)
 id 1igp89-0001F2-GX
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 12:05:41 +0000
X-Inumbo-ID: 5b1b98ac-1ffc-11ea-88e7-bc764e2007e4
Received: from m9a0013g.houston.softwaregrp.com (unknown [15.124.64.91])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b1b98ac-1ffc-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 12:05:31 +0000 (UTC)
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0013g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 16 Dec 2019 12:04:18 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 16 Dec 2019 11:51:04 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 16 Dec 2019 11:51:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWSoB90sgIBmAx5rlcun7RkDlRHC/8efFbZo4wDzqLA43gQZBGZYuqhZm9fHBuofJjXL5LuqtZHXE2yDs2DnmntqghBlU/G1ub584ii5BViKDHR0B+tUkTC3DR4XElUt5QpUMVJC+R/9qEsP5/UMZWeZNuDDWKwXuBK2E1a9E65MGYF0FWFt3hu4rJvYATyD3nyBoAiSXAQxcw8ZqJaZbMu5kZQLJvYg7U3zfp+4EpLinZDo1K4m12/6FSmBTzNIEBWW6tpXTdb/weQMFY16hGZnoYeyEcP+HcCb8Fz0W8S8apoPU7dF/QJMDrwFrEm2AXaedp2zTDAZ5ig/SLwFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyLbeEYfDFfRgjyJa2qtEEdENlBDRkrqDFeonlJJS8A=;
 b=QLBqwMbE3V211bxxBbcBFNbQcQCv3uijE7DJ0gPi+HmxjsYOAcmpPUftslo7/UsQmRK3N75BG1sDjCH5DM1TW2z4raJqmgIR53d7ecdXDfBcqc2t5HIDqhc5tbjwtYgSs+anoLJ8JDOS38dmXoUuUXc1BXXyklQUrMVX9jPd7VrjNtP9TmEOHbhvOwP4j+zcYYwnOn4ToB+Pkgwp4PLb5qq665kj/pBJVtwO7K+9vldZleIt3aC4aRiDyn4jN8rhAgNvikzXkXQOJq2CgGtKWStXiUb/Gsu2mu2MvHcAdSzaX0lIDYYpXjb9Z25fnkm7SQb3LR9rZYkW0exIv7mkTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3170.namprd18.prod.outlook.com (10.255.137.144) by
 BY5PR18MB3249.namprd18.prod.outlook.com (10.255.138.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.17; Mon, 16 Dec 2019 11:51:03 +0000
Received: from BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::5967:dfe8:c14:808e]) by BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::5967:dfe8:c14:808e%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 11:51:03 +0000
From: Jin Nan Wang <jnwang@suse.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v2] Xen missing prompt log when exec-sp=off
Thread-Index: AQHVs+qzuwFrdBKM3kC0biftq9U4/qe8mEoAgAAOAAA=
Date: Mon, 16 Dec 2019 11:51:03 +0000
Message-ID: <a4f3ac09-d0e0-c5b1-b2ed-f7fa2ffc7e21@suse.com>
References: <20191216082718.20922-1-jnwang@suse.com>
 <034e70b7-58df-a144-5339-697368410afb@suse.com>
In-Reply-To: <034e70b7-58df-a144-5339-697368410afb@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::12) To BY5PR18MB3170.namprd18.prod.outlook.com
 (2603:10b6:a03:1a9::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jnwang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8649faa-85f1-4c74-c859-08d7821e3a34
x-ms-traffictypediagnostic: BY5PR18MB3249:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB324925041A6389D9112997E6BE510@BY5PR18MB3249.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(189003)(199004)(71200400001)(8676002)(316002)(186003)(6512007)(2906002)(81166006)(81156014)(66446008)(66476007)(8936002)(31696002)(26005)(6506007)(53546011)(31686004)(4326008)(478600001)(6636002)(2616005)(52116002)(36756003)(86362001)(54906003)(64756008)(37006003)(5660300002)(6862004)(66556008)(66946007)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3249;
 H:BY5PR18MB3170.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iho9kihk/0jqGczw7eHyT20cwoBtbfLRXmSCgJS6/1nBIWenFpkaAZ/X5l0WCkTQSVTQVRZHYTvskeKHG47nLiRpWxdsQUAru5YHcSP+x6WBJdRvq5QaQdEoi02OwOQ3DgJrthe5eyoX6L2xVzJxNykIkyhHrdYJwMU1yWXFuZVpRKs5hnw10wfMLx1jR9Erg9hKiMf8sDCrQYoKkOo201CKT2SXNB7QqN53nGMn9T0vmptqbD8GWSFQQcKooqSTDGY0SCYmkS/po14TMZS0zJyct1DqRKvu16gitM/gk5OfWZLm17NOTQKvbyK6/yVz6SIsYO72qtjJaG8Xl2gJm+YW9MQEHPKlgvxmEs/EtPLl/ud9/TzeJFE9m1KNkKJ6tgZd37hBDf3Nz5seU+Qmubv4Kjd3cHycHNX0G0EqfJ1qpcMiPbc5PMmKnmAdS2qC
Content-ID: <3CC3DDAC29543A4D9AEF1DBD9BA85C92@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b8649faa-85f1-4c74-c859-08d7821e3a34
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 11:51:03.5300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SmdOr15x+kddxc6HUTRXH+oMtNhmVj8ntep19csPWN/YOTNiYo7XSsdB9rujw9XX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3249
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] Xen missing prompt log when exec-sp=off
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiAxNi8xMi8yMDE5IDc6MDAgcG0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNi4xMi4y
MDE5IDA5OjI3LCBKaW4gTmFuIFdhbmcgd3JvdGU6DQo+PiBGaXggYSBpc3N1ZSB3aGVuIHVzZXIg
ZGlzYWJsZSBFVFAgZXhlYy1zcCwgeGVuIG1pc3NlZCBhIHByb21wdA0KPj4gbG9nIGluIGRtZXNn
Lg0KPiBXaHkgIm1pc3NlZCIgKGFuZCB3aHkgInByb21wdCIpPyBJIHRoaW5rIHRoZSBvcmlnaW5h
bCBpbnRlbnRpb24NCj4gd2FzIHRvIGxvZyBhIG1lc3NhZ2Ugb25seSB3aGVuIG5vIGNvbW1hbmQg
bGluZSBvcHRpb24gd2FzIGdpdmVuDQo+IGFuZCB0aGUgc3lzdGVtIHdvdWxkIGJlIHZ1bG5lcmFi
bGUgd2l0aG91dCB0aGUgZGlzYWJsaW5nLg0KDQpZZXMsIEkgZ3Vlc3MgaXQuDQoNCkJ1dCB3aGVu
IEkgdGVzdCBlcHQ9ZXhlYy1zcD1vZmYuIEkgZ290IGEgbGl0dGxlIGNvbmZ1c2VkLg0KDQpCZWNh
dXNlIG9mIHRoZSAicHJvbXB0IiB0ZWxsIG1lIGl0J3MgZGlzYWJsZWQsIGF0IGRlZmF1bHQuDQoN
CndoZW4gSSBhZGQgJ2VwdD1leGVjLXNwPW9mZicsIHRoZSAicHJvbXB0IiBpcyBkaXNhcHBlYXJl
ZC4gSXQgc2VlbXMgbGlrZSANCml0J3MgRU5BQkxFRC4NCg0KDQpKYW1lcw0KDQo+IE5ldmVydGhl
bGVzcyB0d28gc3R5bGUgcmVtYXJrcyBhcyB3ZWxsOg0KPg0KPj4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS92bXgvdm14LmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+PiBA
QCAtMjQ5NSwxNCArMjQ5NSwxNCBAQCBjb25zdCBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlICog
X19pbml0IHN0YXJ0X3ZteCh2b2lkKQ0KPj4gICAgICAgew0KPj4gICAgICAgICAgIGJvb2wgY3B1
X2hhc19idWdfcHNjaGFuZ2VfbWMgPSBoYXNfaWZfcHNjaGFuZ2VfbWMoKTsNCj4+ICAgDQo+PiAr
ICAgICAgICAvKiBEZWZhdWx0IHRvIG5vbi1leGVjdXRhYmxlIHN1cGVycGFnZXMgb24gdnVsbmVy
YWJsZSBoYXJkd2FyZS4gKi8NCj4+ICAgICAgICAgICBpZiAoIG9wdF9lcHRfZXhlY19zcCA9PSAt
MSApDQo+PiAtICAgICAgICB7DQo+PiAtICAgICAgICAgICAgLyogRGVmYXVsdCB0byBub24tZXhl
Y3V0YWJsZSBzdXBlcnBhZ2VzIG9uIHZ1bG5lcmFibGUgaGFyZHdhcmUuICovDQo+PiAgICAgICAg
ICAgICAgIG9wdF9lcHRfZXhlY19zcCA9ICFjcHVfaGFzX2J1Z19wc2NoYW5nZV9tYzsNCj4+ICAg
DQo+PiAtICAgICAgICAgICAgaWYgKCBjcHVfaGFzX2J1Z19wc2NoYW5nZV9tYyApDQo+PiAtICAg
ICAgICAgICAgICAgIHByaW50aygiVk1YOiBEaXNhYmxpbmcgZXhlY3V0YWJsZSBFUFQgc3VwZXJw
YWdlcyBkdWUgdG8gQ1ZFLTIwMTgtMTIyMDdcbiIpOw0KPj4gLSAgICAgICAgfQ0KPj4gKyAgICAg
ICAgaWYgKG9wdF9lcHRfZXhlY19zcCkNCj4gTWlzc2luZyBibGFua3MgaW5zaWRlICgpLg0KPg0K
Pj4gKyAgICAgICAgICAgIHByaW50aygiVk1YOiBFbmFibGUgZXhlY3V0YWJsZSBFUFQgc3VwZXJw
YWdlcy5cbiIpOw0KPiBObyBmdWxsIHN0b3AgaGVyZSBwbGVhc2UuDQo+DQo+IEphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
