Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1EE3CB9CF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 17:27:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157602.290257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Pjj-0005D6-Vk; Fri, 16 Jul 2021 15:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157602.290257; Fri, 16 Jul 2021 15:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Pjj-0005A4-Se; Fri, 16 Jul 2021 15:26:47 +0000
Received: by outflank-mailman (input) for mailman id 157602;
 Fri, 16 Jul 2021 15:26:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sl2L=MI=citrix.com=George.Dunlap@srs-us1.protection.inumbo.net>)
 id 1m4Pji-00059y-3I
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 15:26:46 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a599fae-e64a-11eb-898d-12813bfff9fa;
 Fri, 16 Jul 2021 15:26:45 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3a599fae-e64a-11eb-898d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626449205;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vR9AZljpdMRupA8hFWDC2Fj58PR9L8gk21t5jCTph9c=;
  b=T3FDF8gviIP/vY7RUajiIqSvskBJ1WtM25CMMRbkOIfD57TBG5HAH4Xc
   ambyMtrTDOAQ5cxEHOBti9x8sa+sPme6Zx2S5QFad1XNBr7Jg2rOFIIHJ
   ids0oiS1FdCEOm1B/FcNUcfVtRKBszOkYWezvhYdoeVTOOUhaHu3rozU8
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KC0PjbD5DrjgsFihdBHQICN3IdfUOGLOTX1TK/C8kYeBrCcXTnAhNGtrtqpDp8Ypl1AAFI/BWv
 JdrZd6R/3PeYn3uYGqzIRzzvbiQbPvW4ubUJjB8pqC0vpRb0luf7oXwd6SePtrb+q5oN1gcBqC
 ggmJfrRw8ndI8TAJ59fDYfQ8TCrWMV5S0ed5kVeb+20LptYG8PDDtrm9Q60o6VJP0ep7ZkkiZc
 902f/gGWn8ss1IPZg2VAu05C+Vnf8jGgu+luJCtrQCWX3C/Rsnfs2LnQjkt1FOvnpgWROgs6t7
 j0E=
X-SBRS: 5.1
X-MesageID: 48441894
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:PD1X0qhTBgzcD1g1Hsk3gPEIvnBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.84,245,1620705600"; 
   d="scan'208";a="48441894"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oChI9cD6fdLGaptleoRPagavFc86z+njPKAroBC0u8GlUbZRHAVYg9R/ijJg17YWNv2XGQ070DvKt5SRX66zU5Z6OO4sat2fsn8jHDKunkvxEamnWRjKfaJH3eKzRuW+pEiBn192+YSINKWHwgYgL+k5ruNt2kMvFx6yhe3kOL1O8729MarOHyOUiFj7p03gTS6tU1kNKLJMXZehvlpJDw7Lb2GFsaft8dxkevtgdYBGSbLH/JRT0h6us4VCoPbXO43TKckscLxm7a0MozxRNfbudV2UrPBXp9HryGksbl5uKcMp5SwuNfdEJXYPQNp4kXzxaf5ir2f0BEEu9lFxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vR9AZljpdMRupA8hFWDC2Fj58PR9L8gk21t5jCTph9c=;
 b=cXvbikkECcQ5HuCCj59X1KhtfM2k924YPKoU/MoULIi7aebgYwcjaR5fJBQL1CXyPblWZK+zNpOeJGcPA720YCLtlXxqA4wYjt9UpLx/LmAX3xycxQWGF7WwLHwDn9LJ5Zfuec3k3upqhF/1JYucyqfSLrpKcVbVPSGyP8fEWIQi3bO3lut8Z+XBBvYxSbcBklnXoqReXb8iGO/eB5gsBJlWR3MwLf/saMkuk+ouP7E24yU+IDVuWHL62cm2pXZe1MsBsGgMndWiZXgFO3NqBUN+llC0swxd+9EYB5Vne7EuRif2b+sagKSIozV7cNQj9vstWl7lmCyZQ3iaRjIzDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vR9AZljpdMRupA8hFWDC2Fj58PR9L8gk21t5jCTph9c=;
 b=JuEeD12dHwTooYMJcqAw/RPAH5gRp/ePne4gc8eSFn/nl2dwabL4s2xUqrybPMda++pwqF4pQBB05Q+BjQr6ujKLWoDfbbokbnkWn8m+aTaFlkWlFJKx4aDClMe5/LWuAT5zxLcjNM1QRxdT8n5ZfHeea3+qbm2rMkQKBHGkL1I=
From: George Dunlap <George.Dunlap@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
Thread-Topic: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
Thread-Index: AQHXeMzvUpPSASSz7E6vsns5WsIEC6tFvFWA
Date: Fri, 16 Jul 2021 15:26:39 +0000
Message-ID: <40A28D22-91BC-438D-99C9-46DF6DA90A5E@citrix.com>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
In-Reply-To: <20210714161734.256246-1-anthony.perard@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 116b0791-102f-494a-42b5-08d9486e1b4e
x-ms-traffictypediagnostic: PH0PR03MB5927:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB59270AF6B8BDAB18F5A9F5CF99119@PH0PR03MB5927.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e/5OyI0bdeA2+uUSwh6BSshneUNsQELTaOTvUR8ODYr/7d19Rc8+k99jEDDYKqC1v+eqf2Etb4/UnJv4NuyveA37cRGWBiW5QW5Z6AAWRwn3QV/+L9hTPM4yCS8ylyGd5eK3Hr5aaplIPzO3ePs8DxK1UP3dyW41R6ChIYmDTiL2/HXKfgx+qgxRBE/XTSYq1QTEtq/wHz70zx/R1KKJq6M4Twz8dofyRZhWlSJLXDlDFuW9WGWuE4MITmd5r28iTUQPT+I4EOQ+OAWq4LY5TQ1aaqmvhv1XZ4WmPwiNXCRUsB22QpYx7Qgx82zBTObsY8vGV299Q85yfbGJ5vtUgsL0HdPTFyMuDtmZFlyO+dPInBoKozgtppe07Lm5prrUhdPCK4ZbI+RWvC/9VwvEpNPYtx5/08gQbRB3ImniKd7m/B//8l+kpH8gG5aobOXgC+w7XOD0rkh22J6fhdiWV2zdPrFodQggNgsREP9Bu3kjR9dYzKp7i2hMnzqN7p08sHhzzxAcF7ppn5vJs765JvsaviJEOBS68XihyXUynUiCHqxDXsh7UFmm4rpVbUeaHySfnzoy+iJTK7IAIpaGIo27wL88+uhYjC3eCFqjjckLvwGG+SJ7GlOt3ZDrohIjcVVQisBDg3V1pXTiSU2a+I/fUld1qqA0nz1hgK99Rw+j+ULgihv/S8/Brvn1Y/kM9vr+UURYnqGi7yRD84yHzDJPVGDuVqwXDdspUUtAIL8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(316002)(71200400001)(26005)(4326008)(5660300002)(37006003)(6862004)(54906003)(8676002)(186003)(6636002)(83380400001)(122000001)(86362001)(6506007)(38100700002)(2616005)(6486002)(53546011)(8936002)(6512007)(66476007)(33656002)(36756003)(478600001)(76116006)(91956017)(66556008)(4744005)(2906002)(66946007)(64756008)(66446008)(38070700004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGl1KyswK0FnY2RYd3ZEcFJxV3o4R0loNmxDVDlLc1J1aDdlengzbUFSU0dQ?=
 =?utf-8?B?QUloY1Q0YlpBTDNOTzJYeFYrcmtrZWxadHM0MmlaS1FJNGVFcW5LS3VSTXVC?=
 =?utf-8?B?SU5aeWV1SDB5V014dUhiM21ST09tNmRiWU1WV3lNQkU3N2liNEVVQlpaV1N3?=
 =?utf-8?B?SVR2endaVlRqQ29WcWJXU2wxSzRwWGxyK0ZSTWw2MUxHZTR6MDYvcGFoSm1s?=
 =?utf-8?B?RGJHS25CRnpLN1doejFFaGdqZ2VORVR0NmhQaXNCOGlRaVhDS2hzeDJCeDM3?=
 =?utf-8?B?OE5OMEw3YXFhWFFTamx3M2pBSzEyQUpKMkRNVUNKL2wzd2Y4ZEJSbkxENDNG?=
 =?utf-8?B?U29KT1dFZHQzdFBrM1ZXVlU4QlhmaDJGLzBranRPWUc4TjFOdWROdWhUblhB?=
 =?utf-8?B?UDJqTlZPVnB4cyt4d2MrMFp4WFoyVW9NcWNIOWhUMXN2M2U3M3pTOHMyUWov?=
 =?utf-8?B?TmJOMVU1V1h6cTl2THdPSHN5dmJ1TnJETkh0V1JMNFFmeEQ1bHIxMldvVjAy?=
 =?utf-8?B?Q3ZZQVJwa2lkV3piODdHT1hMVlhaNlhRd2pQeW1OZTdaa1l5eE52Y2tKSFB5?=
 =?utf-8?B?STNlb3BmSUJORW9LaGJ2OVBJajhFUENDNW00cTZCempXTWl5czZqYnRkRmZq?=
 =?utf-8?B?ZjNUVE1qTUF6N0tyU2huc016UVVxOWliakJhd2J3cmNkdGRMZm03bk1aczh2?=
 =?utf-8?B?NVd5S2R0QUFDaEpIZ0xINEtKUndHejBKbWVWNmpGYi9ZVHc1Z01kOGtMOUZW?=
 =?utf-8?B?WFFuRHFENlFZQmlXU0JqTGlkNXo1d3N2SDU0czJDeTJyeWxEcUlHOHZDaVRU?=
 =?utf-8?B?eDE1dHdpV1RndjZlV0kvVnhqYjBLK1M5NGY4NmptRTVzb2J3ZVdITnEzWGZ1?=
 =?utf-8?B?MjhwYm5VYkY1NTNDaVhCcldCYWdTWWJTRU0yQ3VHbWpsTVpXNWd5ZFBBN0NR?=
 =?utf-8?B?N0RSdnRVNUlpYXoxM2FTUGQwUm5mTW5pNis2KzlHWlpZWkVUa3VrL1VYOVVP?=
 =?utf-8?B?ZDFkMVRJeGEwUGhEaW15cmM2ZzZIUlN5RTI5RDNYNHpIWTFySVcrL0txNnlX?=
 =?utf-8?B?U0ZMWFpOcDZaVlkzdFlMejdROHJ0a2gyRDd0dzdzUjk5cTVvSlRpM0hPQWFu?=
 =?utf-8?B?N2xJRmVDVmN6YnMycGhxZlpiWEdCcGRCL3RIclVZSDR2aTVoSnM3V09HNmFN?=
 =?utf-8?B?WDRFSWx5K2NOTXhLL3NJcnEycjJZM1VkZ0FJbXZXVkRYZG1KTXN3VnZWaDUx?=
 =?utf-8?B?R1JETUdaRjBiN3JtamlGQk9pT3J2bjE5NzgxelFnR3pVR2FqTTJSSFVGWG4w?=
 =?utf-8?B?c3dRSnhNMnZQRFU1Ly92MG5MNDJnMFN3MmpIM2UvcnM0cWRCK3FIcDcreWUy?=
 =?utf-8?B?N2h2UW9jVnZ1c1Ixc1ZlMjFUTHd6d3N2UUFUbWpBMWtwOUhjV09PVkRCRlVv?=
 =?utf-8?B?K2FlNVMzcmZzNkRmVk1VOG8rNXBnZVhqR1BCeUZ1K09DNXYxYnh3VENWd2ps?=
 =?utf-8?B?ckJaU0hlUmlLRGlBZDNZdFVkWmt1QXJMaGhrSndtUC9iNkJUdlpISERiNUVE?=
 =?utf-8?B?MjMyM1FENmRLUkdiV25CUDYzYUFMaDgwVVcrVnVvcTA2SEs4cDV0a3UyZHFo?=
 =?utf-8?B?MWd1MnpXaENST2ZDZUZHUEVkaldtc2lrOGFTVTdBNGlqS1RISENNSVR3UG5r?=
 =?utf-8?B?S2VqcWRoUVlYWDVDVUtGdVVta2xNTkF1ckpFSmFackpoMjhqRFlCVEdUTWNn?=
 =?utf-8?Q?RBTaL7bIk6c5sl7yAmJfJ7oWdX5arLwgHIDKPbA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FB93E547262E541A3144AE07B36BFF0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116b0791-102f-494a-42b5-08d9486e1b4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2021 15:26:39.0655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j2LtE5g1A4OMdkHQNMurg9Lmd9500i8/QljUnNdkZ8lq8M0cqp8BfL0gaM4F9CKtHBycofzrdUjTx4sY8MtxPg808QrDmzinnkVRmJy9ZPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5927
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSnVsIDE0LCAyMDIxLCBhdCA1OjE3IFBNLCBBbnRob255IFBFUkFSRCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBUaGlzIHdpbGwgaGVscCBwcmV2ZW50
IHRoZSBDSSBsb29wIGZyb20gaGF2aW5nIGJ1aWxkIGZhaWx1cmVzIHdoZW4NCj4gYGNoZWNrcG9s
aWN5YCBpc24ndCBhdmFpbGFibGUsIHdoZW4gZG9pbmcgInJhbmRjb25maWciIGpvYnMuDQoNCkhh
bmcgb24sIGp1c3QgdG8gY2xhcmlmeSB3aGF04oCZcyBnb2luZyBvbiBoZXJlLg0KDQrigJhyYW5k
Y29uZmln4oCZIGlzIHNldHRpbmcgQ09ORklHX1hTTV9GTEFTS19QT0xJQ1kgaW4gdGhlIC5jb25m
aWcgZmlsZTsgYW5kIHRoZW4gd2hlbiB0aGUgYnVpbGQgaGFwcGVucywgd2UgZXJyb3Igb3V0IGJl
Y2F1c2Ugb25lIG9mIHRoZSByZXF1aXJlZCBjb21wb25lbnRzIGlzbuKAmXQgdGhlcmUuDQoNCldo
YXQgdGhpcyBwYXRjaCBkb2VzIGlzIHRvIG1ha2UgaXQgc28gdGhhdCBpZiBzb21lb25lIGV4cGxp
Y2l0bHkgc2V0cyBDT05GSUdfWFNNX0ZMQVNLX1BPTElDWT15LCBidXQgZG9lc27igJl0IGhhdmUg
Y2hlY2twb2xpY3ksIHRoZSBidWlsZCBzeXN0ZW0gd2lsbCBzaWxlbnRseSBkaXNhYmxlIHRoZSBw
b2xpY3kgYmVoaW5kIHRoZWlyIGJhY2tzIHdpdGhvdXQgdGVsbGluZyB0aGVtPw0KDQpPciBkb2Vz
IHRoZSByYW5kY29uZmlnIHRlc3QgcnVuIGtDb25maWcgb25lIG1vcmUgdGltZSwgYXQgd2hpY2gg
cG9pbnQgKnRoZW4qIHRoZSAuY29uZmlnIHdpbGwgYmUgZGlzYWJsZWQ/DQoNClRoZSBmb3JtZXIg
SSB0aGluayBpcyBicm9rZW47IHRoZSBsYXR0ZXIgSSB0aGluayBpcyBmaW5lLg0KDQogLUdlb3Jn
ZQ0KDQo=

