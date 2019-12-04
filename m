Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 801A1113030
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 17:44:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icXhm-0000Sa-V8; Wed, 04 Dec 2019 16:40:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4Mbr=Z2=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1icXhk-0000SV-SQ
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 16:40:44 +0000
X-Inumbo-ID: cfe7c53a-16b4-11ea-a0d2-bc764e2007e4
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::706])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfe7c53a-16b4-11ea-a0d2-bc764e2007e4;
 Wed, 04 Dec 2019 16:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hq8paEy0fG21WCdrtjBR+2wIomUPGfkUSfsD47PR/dFGatvtkReKUZ/vkA0K9vRZKtU+1qJbYi1DIxsc7mXoG9gacbT6ssvV4Us3x8jOXCL88tYMxjtHg4DJj58FEMRGfseV0+IzwVHy+cKTK4LJBQQUxgSYiZW2UkaTFO0MGie1Q52aW1Jz+Od7qJA5h38s4PfRe+LGLd32x9bfCs/9774Mef/D0UMcedTQL6+pH4UySFKT3qsHJlb8z0qJEFHeeid3S4I8YsQavgBcAjqtNIWsK6Mvt1tF79aWF5R3dNmMeUrj1ToxVEP7AvARLwan+NDmn4DqLgrt04yuRKDj7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeZmVwu1u9L8nIdbnKupQZzIILfiXFVYjVCq5qqodtU=;
 b=oBu0DHz5QLJFAI8Ub4SW8keHH1n2NqvvgwX7UmH9w3lsmE/zK89uhYV4j0TMiS8RiJbJRlEwJYNwrYNnf3ZARnwtO0+kmaj0NcivAt3eBIdme+8HBQ/94cYcDcaEY+NNR/Q/iPBARTaKyniOyQ+GHVGZ+FHxaKGScaxtWijT6Ez8dUvScyW3nPN6tsZ1MGYIuKXS8KhkYeH0gxyTM5Nrr4FliOSMuCn324uwRW7iQjciJUpB+UFeQcCMSj+Afu46UQaVKZV9Ey40vJtA35EmyeaHLAuWM/gqRUIr80hX8bDov/+zY5og0TClqa8fnCwopPF3dC36fs7Yq9LdYIHnwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeZmVwu1u9L8nIdbnKupQZzIILfiXFVYjVCq5qqodtU=;
 b=BlK3zkBdGFBCvQVSTkyxgYKHk37Y5KXbMJRJQR53fACg5u/jokE+BK9Zf+kX6e4pBzsD4YEHpwsaQlGAVUs8IuuUkFqolYfh36ANdfARMQEaw5fiUaEDD0WzYqmICiXM7g2Tad2yArRfiDq1LQUpKJJSTv8w2knPuy9OAmF4OYM=
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com (20.178.89.79) by
 AM6PR02MB4867.eurprd02.prod.outlook.com (20.177.118.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Wed, 4 Dec 2019 16:40:41 +0000
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::cddf:15eb:a538:71fe]) by AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::cddf:15eb:a538:71fe%5]) with mapi id 15.20.2516.013; Wed, 4 Dec 2019
 16:40:41 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/debug: Plumb pending_dbg through the monitor and
 devicemodel interfaces
Thread-Index: AQHVqfyqJfL5ZJWFbkCmEracwCthr6epr8gAgAB/XYA=
Date: Wed, 4 Dec 2019 16:40:41 +0000
Message-ID: <74d7865d97b02f09302120c3fcdbdd813856afef.camel@bitdefender.com>
References: <20191203171030.11680-1-andrew.cooper3@citrix.com>
 <e0341ef2-a71e-b2f7-1f07-0fbe26ec257d@suse.com>
In-Reply-To: <e0341ef2-a71e-b2f7-1f07-0fbe26ec257d@suse.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0084.eurprd02.prod.outlook.com
 (2603:10a6:208:154::25) To AM6PR02MB5287.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b525111-1e8d-436e-bbea-08d778d8b353
x-ms-traffictypediagnostic: AM6PR02MB4867:|AM6PR02MB4867:|AM6PR02MB4867:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR02MB4867B7B801DB53FD37FF1962D65D0@AM6PR02MB4867.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0241D5F98C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(366004)(376002)(39860400002)(136003)(199004)(189003)(14454004)(5660300002)(6486002)(118296001)(478600001)(2906002)(102836004)(36756003)(6436002)(50226002)(66946007)(66476007)(66446008)(64756008)(66556008)(229853002)(71190400001)(71200400001)(2616005)(81166006)(81156014)(26005)(11346002)(8676002)(8936002)(76176011)(6116002)(86362001)(3846002)(110136005)(54906003)(52116002)(186003)(25786009)(4326008)(7736002)(6506007)(6512007)(6246003)(99286004)(53546011)(305945005)(14444005)(316002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB4867;
 H:AM6PR02MB5287.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nWN2HxSN+uGkfluYiT9IrOiJYkTGTZu/0OlRd72TN4idlSJJ62xuK20ZyMCddLGb/MbP50iSNJbzyDOzTEFC7z/fHKNCy7hCPPUTH6IyYtvBGfuui5ruW3uaxJj53DkvD4pxbZYhazxOzY7CnBZGEJDx+LpsbHY2ybda+cJluzwvzUrNKqkIpEtUQ+oa+wrw3Yl3FQjoNIAwfKcwnrVSChWuVwiz6J0jT9+7R6xTa2gbPnVngexs3v7KVxYOWNuoyx9ao9A7BUkF//eklMcVGKVHeU2pYHQbxNHWtrmBmLWi6DtPHajTRS9DHPnjdo3wcqC+XQxH1tWt5ouQizeVtMGeaT8kWQmu5Ndnv6NrBB2jxVpjLewSridB0i24UCp9new0xDCIfHax7YN6TW14ykf9amtaUBSWgwWaJL3UdUu7nMXmBvpbGo5OgRZMR2CWBTnXckNpGMeltdxdxfyFXSYoKidd+MXc0u15WYTmwcJslznDp5aOBf22C5gVj2Ih
Content-ID: <C6E1EFCC1C290A428DAFBC6567F8D860@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b525111-1e8d-436e-bbea-08d778d8b353
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2019 16:40:41.6091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7pRKk9elHJ1c8V9i/06fMu3noWBtARNFGeBRvO7RNplviLgBLW0LnFWQrsLDSpv1U4uHpK2uE4q3PNCT73eA/BtqNuoF5y9Cn2dktyxiBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4867
Subject: Re: [Xen-devel] [PATCH] x86/debug: Plumb pending_dbg through the
 monitor and devicemodel interfaces
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
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDE5LTEyLTA0IGF0IDEwOjA0ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMDMuMTIuMjAxOSAxODoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gPiAtLS0gYS94ZW4v
aW5jbHVkZS9wdWJsaWMvaHZtL2RtX29wLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMv
aHZtL2RtX29wLmgNCj4gPiBAQCAtMzI0LDcgKzMyNCw3IEBAIHN0cnVjdCB4ZW5fZG1fb3BfaW5q
ZWN0X2V2ZW50IHsNCj4gPiAgICAgIC8qIElOIC0gZXJyb3IgY29kZSAob3IgfjAgdG8gc2tpcCkg
Ki8NCj4gPiAgICAgIHVpbnQzMl90IGVycm9yX2NvZGU7DQo+ID4gICAgICB1aW50MzJfdCBwYWQx
Ow0KPiA+IC0gICAgLyogSU4gLSBDUjIgZm9yIHBhZ2UgZmF1bHRzICovDQo+ID4gKyAgICAvKiBJ
TiAtIHR5cGUtc3BlY2lmaWMgZXh0cmEgZGF0YSAoJWNyMiBmb3IgI1BGLCBwZW5kaW5nX2RiZw0K
PiA+IGZvciAjREIpICovDQo+ID4gICAgICB1aW50NjRfYWxpZ25lZF90IGNyMjsNCj4gPiAgfTsN
Cj4gDQo+IEhvdyBhYm91dA0KPiANCj4gICAgICB1aW50MzJfdCBlcnJvcl9jb2RlOw0KPiAgICAg
IHVpbnQzMl90IHBhZDE7DQo+ICAgICAvKiBJTiAtIHR5cGUtc3BlY2lmaWMgZXh0cmEgZGF0YSAo
JWNyMiBmb3IgI1BGLCBwZW5kaW5nX2RiZyBmb3INCj4gI0RCKSAqLw0KPiAjaWYgZGVmaW5lZChf
X1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVOX1RPT0xTX18pDQo+ICAgICB1aW50NjRfYWxpZ25lZF90
IGV4dHJhOw0KPiAjZWxzZQ0KPiAgICAgdWludDY0X2FsaWduZWRfdCBjcjI7DQo+ICNlbmRpZg0K
PiB9Ow0KPiANCj4gb3Igc29tZXRoaW5nIGFsb25nIHRoZXNlIGxpbmVzIChlLmcuIGNvdWxkIGFs
c28gYmUgYW4gdW5uYW1lZA0KPiB1bmlvbiBndWFyZGVkIGJ5IGEgX19HTlVDX18gY2hlY2ssIG9y
IGEgX19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXw0KPiBjb25kaXRpb25hbCksIHRvIGhhdmUgYSBs
ZXNzIGNvbmZ1c2luZyBuYW1lIGluIFhlbiBhbmQgdGhlIHRvb2xzPw0KPiBFaXRoZXIgd2F5IGh5
cGVydmlzb3IgYml0cw0KPiANCkhvbmVzdGx5LCB0aGlzIGxvb2tzIGEgbGl0dGxlIGJpdCBzY2Fy
eS4NCkhvd2V2ZXIsIGl0IG1pZ2h0IGJlIGEgZ29vZCBvcHBvcnR1bml0eSB0byBkaXNjdXNzIHVw
Z3JhZGluZyB0byBDMTEsDQp3aGljaCBzdXBwb3J0cyBhbm9ueW1vdXMgdW5pb25zIGFuZCBvZmZl
cnMgYSBjbGVhbmVyIChhbmQgc2FmZXIpIHdheSB0bw0KaGFuZGxlIHRoaXMgdHlwZSBvZiBwcm9i
bGVtcy4NCg0KQmVzdCByZWdhcmRzLA0KUGV0cmUNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
