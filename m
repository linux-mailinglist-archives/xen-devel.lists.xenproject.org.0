Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4793578C8C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 15:17:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs5Ts-0004Ky-U5; Mon, 29 Jul 2019 13:14:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs5Tr-0004Kr-8C
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 13:14:23 +0000
X-Inumbo-ID: c48a41e8-b202-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c48a41e8-b202-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 13:14:22 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 13:14:15 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 12:53:42 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 12:53:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUUjNa4N2BBINRYvOK1yQr0uvMBKQJ7QhX9JS0T2Jmb529TFQBfP3+U7DVibfUQjTAnR9CkPS/KfdchOWOogjRVqdpOvwIqX0Q8wxvrG+7GnvY28ApZeXJpDtPcY0X7PcLlhwt05qtbcR/aOe9gNeL6YzQGU6yEIZRTkOWKSInUDe0IXGgsw/X/rP2/Gkb6Rl1AF7lj3TnDDalj5MeljM4fTAnv75uDamTA5N6zt++mQv9908ldBsK1CF3naXy21FykJTgUks+M0RDbJnJdBIiFnjuBFKsMKqoP8hJ62XDdAXDbknfTkUZ5VA5ugqndiRrvdIjlBg0zQCvq7t3T7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KArDCDzaoccWzERgANg3cd9oCQ/hl0KOmmIVDonsYYg=;
 b=iswXSUrwLjJcOe2c14/mVm6ZS+pJsa/sTc3nJmwOee/GM4pbqtZ6USowmUSiG207ybvJYegALKrMVj65T8mpxf0hZGRibySLf44LvlmhW8budsqV8/Ls1jy9xP50EaUnQMeF6FgzDmVCVEVoRRdxe0vsiA1U5rLG5zpSZ4L7dt8eCzIF37rOj4jEDh8Und+Pqhe+xJm7urLH9qdj+Ew1ldN/u0NXrAakiFECCzExTIkYfrBjstLdtI5gZFKTpFfBFlviO1Oqu+hoFVDurvXhKXsdHZUq1p7pl7WANPoHoPjnR9Pcsqzt7S42IbMUBwp9QWMTr2Lx+J3s3V4D1yC/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3204.namprd18.prod.outlook.com (10.255.137.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 12:53:41 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 12:53:41 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 3/4] xen/percpu: Drop unused asm/percpu.h
 includes
Thread-Index: AQHVQ/aTcbyZijQELUWr8Cax2G1o4abhkVUA
Date: Mon, 29 Jul 2019 12:53:41 +0000
Message-ID: <0452c476-3194-6465-baab-b645612fe2c8@suse.com>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
 <20190726210854.6408-4-andrew.cooper3@citrix.com>
In-Reply-To: <20190726210854.6408-4-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0053.eurprd07.prod.outlook.com
 (2603:10a6:6:2a::15) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8da49dd7-eddf-4cb7-cad8-08d71423c853
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3204; 
x-ms-traffictypediagnostic: BY5PR18MB3204:
x-microsoft-antispam-prvs: <BY5PR18MB320403154ACDEB746CDBB124B3DD0@BY5PR18MB3204.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(199004)(189003)(3846002)(6116002)(486006)(256004)(5660300002)(86362001)(52116002)(76176011)(66476007)(4744005)(14454004)(386003)(6512007)(66946007)(31696002)(305945005)(36756003)(64756008)(66446008)(7736002)(66556008)(446003)(53936002)(4326008)(99286004)(6436002)(31686004)(229853002)(316002)(6916009)(6246003)(25786009)(8676002)(6486002)(8936002)(102836004)(26005)(2906002)(478600001)(11346002)(68736007)(2616005)(476003)(71190400001)(71200400001)(6506007)(53546011)(66066001)(186003)(54906003)(80792005)(81166006)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3204;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1B2XlsoOjsz3+nRPYW+r48CF1ePau9J7zhpMl9zKKikPcV95lAYZ8G5MVvew27M16+4TVE6u+EqH4jfGlcEKW09sNiCs53oLzp0hUXvqD0zOWa4CIoNdDdNI/Py6VmI0dS/JG2+MqpsEXlm9TsdddjdGipeGjmSmrSOpD9rH0GH0pILNBDPwUIlLevSX2t9o2qpY2yNd/XsMXc98pIgOIM49B+6iLfBWHlyjsw0kAiXwW++nh9lYqMmwlGk4XKEPFdJeIcSrO3dmrkLY/OZh3rBZhmiRX3YQk68nGWwf9WkSvS77SaBcS+183gokFZ/RoCtFwl97n2kaKgXilukXwAnYgoIasgi4qtNT33JTD4mThdQy0sr1k592lS3wq95vLHcEfjM7fj8+fVGTLgBew497kJN9jh7MbxXfwKCQ0HI=
Content-ID: <F91BBAFC2EDEC245B75E057ADF01D399@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da49dd7-eddf-4cb7-cad8-08d71423c853
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 12:53:41.4919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3204
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 3/4] xen/percpu: Drop unused asm/percpu.h
 includes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMjAxOSAyMzowOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVGhlc2UgZmlsZXMg
ZWl0aGVyIGRvbid0IHVzZSBhbnkgUEVSX0NQVSgpIGluZnJhc3RydWN0dXJlIGF0IGFsbCwgb3Ig
dXNlDQo+IERFRklORV9QRVJfQ1BVXyooKS4gIFRoaXMgaXMgZGVjbGFyZWQgaW4geGVuL3BlcmNw
dS5oLCBub3QgYXNtL3BlcmNwdS5oLCB3aGljaA0KPiBtZWFucyB0aGF0IHhlbi9wZXJjcHUuaCBp
cyBpbmNsdWRlZCB2aWEgYSBkaWZmZXJlbnQgcGF0aC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNCkFja2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQp3aXRoIGEgcmVtYXJrOg0KDQo+IC0tLSBhL3hl
bi9jb21tb24vY29yZV9wYXJraW5nLmMNCj4gKysrIGIveGVuL2NvbW1vbi9jb3JlX3Bhcmtpbmcu
Yw0KPiBAQCAtMTksNyArMTksNyBAQA0KPiAgICNpbmNsdWRlIDx4ZW4vY3B1Lmg+DQo+ICAgI2lu
Y2x1ZGUgPHhlbi9pbml0Lmg+DQo+ICAgI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+DQo+IC0jaW5j
bHVkZSA8YXNtL3BlcmNwdS5oPg0KPiArDQo+ICAgI2luY2x1ZGUgPGFzbS9zbXAuaD4NCg0KSSBk
b24ndCBiZWxpZXZlIGluIHN1Y2ggYmxhbmsgbGluZXMgdG8gYmUgb3Zlcmx5IHVzZWZ1bCwNCmVz
cGVjaWFsbHkgd2hlbiAuLi4NCg0KPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4va2V4ZWMuaA0KPiAr
KysgYi94ZW4vaW5jbHVkZS94ZW4va2V4ZWMuaA0KPiBAQCAtNCw3ICs0LDYgQEANCj4gICAjaWZk
ZWYgQ09ORklHX0tFWEVDDQo+ICAgDQo+ICAgI2luY2x1ZGUgPHB1YmxpYy9rZXhlYy5oPg0KPiAt
I2luY2x1ZGUgPGFzbS9wZXJjcHUuaD4NCj4gICAjaW5jbHVkZSA8eGVuL2VsZmNvcmUuaD4NCj4g
ICAjaW5jbHVkZSA8eGVuL2tpbWFnZS5oPg0KDQouLi4gdGhpcyBtb2RlbCBpc24ndCBiZWluZyBm
b2xsb3dlZCBjb25zaXN0ZW50bHkuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
