Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E52285DFC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 11:14:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hveSD-0003Xe-At; Thu, 08 Aug 2019 09:11:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hveSC-0003XZ-H5
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 09:11:24 +0000
X-Inumbo-ID: 7ce0b018-b9bc-11e9-a9cd-4b2efc30fd64
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ce0b018-b9bc-11e9-a9cd-4b2efc30fd64;
 Thu, 08 Aug 2019 09:11:22 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 09:11:13 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 09:08:42 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 09:08:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUHSHzZieuZmUHVe1qG5x/YXJsCkpfGaPIGVPQwm5ONFcIpYiEUD46KQkrXKd4cVO81PuW0nu56s7z9dg4LYyNAG+vS6qTT08Ka2uXPGZ+4jJ7+gOrYroV6tl0DrH0yJyKs5wSgB08y/eqngBnNKIHSXtlvjF3SpcbFTTSixoP7SaMcVjjf3LdFeQqC2t/BztOMowbBu7EiCMWfx26K94aBF+SXz3G27siZgoQ1bQGjG6C1lEsd1qvIs1IgC/Tc+Us7rANrnQBfuMbpbqc4AG3/3z5PUaNcyx5FtnM1FU6rKcbsuxUqpCjnSQtYai/CSx5kdu3MdY+xIveqSM9/Zow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0Qd02xcGRBAjPiuayho39yWzBZseheArZOaY3Udddg=;
 b=fbkPGcSMqfoh+Le/Nnm+0zO1lOEL8XGjrhDGtoQHbm87fYrLutFOEtqlpZv0S3Rcthh4lFaJYdBngbgpGia66qE0zwRcsE7MX5u8J7BgacO0PtAdtihD4/cmffF2LBubO+jPOzcTsKPJ+VZqk0KsK8uLaXNRdHfEArYP3QSR38KovlamjbvjzuJxioo/Q9s5uqk7VnU4P6f9c1wPCpJT4dRxmWSh3qY1PnBQw+8mj561FftWXRWsKMeJpalPI5sC6+yEBmlMAqI6WTeb6H8F1gpo1IVwLanY2nq7dtr/DGGsol2wRpOw0QTBYURGNoZRdlfiNb5yNbx+F35verjnBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2864.namprd18.prod.outlook.com (20.179.20.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 8 Aug 2019 09:08:41 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 09:08:41 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 0/4] enhance lock debugging
Thread-Index: AQHVTaTjLrtftDrvKkCKqSelFkELw6bw7JlBgAAJ1oA=
Date: Thu, 8 Aug 2019 09:08:40 +0000
Message-ID: <b9911c5a-3c66-30a0-4147-4a69f6847d56@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <bc9954e7-ef0a-aeaf-668b-eedcc78645d4@citrix.com>
 <3a8e76fd-ec10-9020-7f34-40c62dab0e6c@suse.com>
 <c1d979d8-eece-0065-c4a1-5f3d47a217ea@citrix.com>
In-Reply-To: <c1d979d8-eece-0065-c4a1-5f3d47a217ea@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR04CA0021.eurprd04.prod.outlook.com
 (2603:10a6:208:122::34) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94292377-fefb-431d-44e2-08d71be00173
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2864; 
x-ms-traffictypediagnostic: MN2PR18MB2864:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR18MB286421604D892CDA1E8D7EC5B3D70@MN2PR18MB2864.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(189003)(199004)(99286004)(36756003)(66556008)(66946007)(66476007)(64756008)(54906003)(66446008)(31686004)(478600001)(53936002)(6246003)(4326008)(6916009)(6486002)(25786009)(6436002)(229853002)(71190400001)(6512007)(256004)(6116002)(8936002)(14444005)(3846002)(81166006)(2906002)(305945005)(71200400001)(7736002)(81156014)(8676002)(186003)(476003)(316002)(66066001)(446003)(486006)(2616005)(11346002)(14454004)(80792005)(86362001)(386003)(6506007)(102836004)(52116002)(26005)(53546011)(76176011)(31696002)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2864;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yMmu8jDtDYNg/h5H62eZ5sfrUK/1QFv2/nPuOia6OzDBpS6JFo/fQntRsDs6k7jso/Xh/S6bQefhJfi4DXO/XUHU3nKJMav5y+F0z9zSjisZ18f8yUkBRjVE74jY2AUpsL8EkKef+Ll8Dc7BGgjqJamY1OvrRWXXcTS5NS0nIU3ovqE2UAmPkfvB1q3+DkeSB21G7qWOS7gxgBdUfbo2DNGNlkO6hDb6Kmd/Fm2PRbbqjQ8ZDwU5ATbJ/NbH88xZYlYzhiuVmb01CFiLnYaXk4iH7TJfZvs/M3h6t5ITKDM4Wpzz7dnsjekES0oynPuOCgbbMWoCapMjfZzIufSJDIKgohWZHYbpEaU96jIbXgsQmnzix2AZ7uTmujIrWwqAAljimVbl44waGaVkZCXj7S+QMU6Qju6fp/LWuhUjRzM=
Content-ID: <CFE96E3E4508B440B68772DD436C52E3@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 94292377-fefb-431d-44e2-08d71be00173
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 09:08:40.8729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99P9fVTYyKqxS1l5YV/rgmQ99dmZDz9nMMoQrwfaz49Q77OjI3NErTFF7zIarjNAZGbxFZq2bWy7kz6kJnaykg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2864
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 0/4] enhance lock debugging
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
Cc: Juergen Gross <JGross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAxMDozMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDgvMDgvMjAx
OSAwNTo1MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IE9uIDA3LjA4LjE5IDIwOjExLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+DQo+Pj4gPHNuaXA+DQo+Pj4gSXRzIG5vdCBleGFjdGx5IHRo
ZSBlYXNpZXN0IHRvIGR1bXAgdG8gZm9sbG93Lg0KPj4+DQo+Pj4gRmlyc3Qgb2YgYWxsIC0gSSBk
b24ndCBzZWUgd2h5IHRoZSBob2xkL2Jsb2NrIHRpbWUgYXJlIHByaW50ZWQgbGlrZQ0KPj4+IHRo
YXQuwqAgSXQNCj4+PiBtaWdodCBiZSBhIGhvbGRvdmVyIGZyb20gdGhlIDMyYml0IGJ1aWxkLCBw
cmUgUFJJZDY0IHN1cHBvcnQuwqAgVGhleQ0KPj4+IHNob3VsZA0KPj4+IHByb2JhYmx5IHVzZSBQ
Uklfc3RpbWUgYW55d2F5Lg0KPj4NCj4+IEZpbmUgd2l0aCBtZS4NCj4+DQo+Pj4gVGhlIGRvbWlk
IHJlbmRlcmluZyBpcyB1bmZvcnR1bmF0ZS7CoCBJZGVhbGx5IHdlJ2QgdXNlICVwZCBidXQgdGhh
dCB3b3VsZA0KPj4+IGludm9sdmUgcmVhcnJhbmdpbmcgdGhlIGxvZ2ljIHRvIGdldCBhIHN0cnVj
dCBkb21haW4qIGluIGhhbmQuDQo+Pj4gU2VlaW5nIGFzDQo+Pj4geW91J3JlIHRoZSBsYXN0IHBl
cnNvbiB0byBtb2RpZnkgdGhpcyBjb2RlLCBob3cgaGFyZCB3b3VsZCB0aGF0IGJlIHRvDQo+Pj4g
ZG8/DQo+Pg0KPj4gSXQgd291bGQgY29tcGxldGVseSBicmVhayB0aGUgc3RydWN0IHR5cGUgYWdu
b3N0aWMgZGVzaWduLg0KPiANCj4gT2suwqAgQXMgYW4gYWx0ZXJuYXRpdmVseSwgaG93IGFib3V0
ICVwZHIgd2hpY2ggdGFrZXMgYSByYXcgZG9taWQ/wqAgSXQNCj4gd291bGQgYmUgYSB0cml2aWFs
IGFkanVzdG1lbnQgaW4gdGhlIHZzbnByaW50ZiBjb2RlLCBhbmQgY291bGQgcGxhdXNpYmx5DQo+
IGJlIHVzZWZ1bCBlbHNld2hlcmUgd2hlcmUgd2UgaGF2ZSBhIGRvbWlkIGFuZCBub3QgYSBkb21h
aW4gcG9pbnRlci4NCg0KQXQgdGhlIHJpc2sgb2YgdXBzZXR0aW5nIC8gYW5ub3lpbmcgeW91OiBB
IGRvbWlkX3Qgd291bGQgYWdhaW4NCmJldHRlciBiZSBmb3JtYXR0ZWQgdmlhICVvZCAoYW5kIHdp
dGhvdXQgdGhlIG5lZWQgdG8gdGFrZSB0aGUNCmFkZHJlc3Mgb2YgYSByZXNwZWN0aXZlIHZhcmlh
YmxlKS4gSW4gdGhlIGNhc2UgaGVyZSBpdCB3b3VsZA0KaGF2ZSB0aGUgbWlub3IgYWRkaXRpb25h
bCBiZW5lZml0IG9mIGNvbnNlcnZpbmcgb24gZm9ybWF0IHN0cmluZw0KbGVuZ3RoLg0KDQpKYW4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
