Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E07979077
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:13:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs8Ct-0006o2-RE; Mon, 29 Jul 2019 16:09:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs8Cs-0006nv-JK
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 16:09:02 +0000
X-Inumbo-ID: 2ae8a458-b21b-11e9-8419-4f6c7802475e
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ae8a458-b21b-11e9-8419-4f6c7802475e;
 Mon, 29 Jul 2019 16:08:57 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 16:08:55 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 15:48:31 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 15:48:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/6vEpb4inFLn0pPKi8T6AqVDuzdMBtREb5qgCiqZISp4kSPBPPuIWupoIk0mjFpwxdWr2FQxsNrPSADMxj0GDezd/YnNjg6heQg5a5r0SqXtW4DSA99jpTgIGsi1XhmXrWQ1rp4dEAkckrAHF03z3p02KGB9pMLYeYV04o5k+iHK0zoT4usD7nucLlbkQLPnwotbfgduk1eYFRew1mFkfW+a1v30DbslrJEAIuB98hf3NmE31tAGS5KhKNYsy8RNDcFRgrgdvYesC/3kDssCstGuwWTBtS/e1v+LTzwG6p1W9iveJA43ezLj6S0a2EN8lfrQfKd4lTC1Ok2HOillg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UygHx+HLvHTPPJnaKsqN+/eZVDne+WS+4G1gSKwQzXY=;
 b=AWkfzve77T3jw0jdMkPw28Y0L8JDT01y+2mAgVBJyXC9GduxcktA4SKnrDCGOJXjbK8L4PgIhj76GjXls9VuuUNws++Hzr6mHHbW5lwXPuhAk8RVSCpvO3vmRpD4dI/DJRyKU3mZdjj0u/xc6z2hroYUskRn7VD4rLSX3ttgFNBfBGykqzaZbWVOfWJoHppxtvfxbITD22OZy8JZpkAGIi/GfieBGLG9DNetfl51/i6hsq7mbw/m83WELJLtC+loTjP687mgCbetL0eZOQAaxORP/QfRLQ2xq1eA2WJ7LJuctEbnb7bNizPkwDdY9e4AAi2es5XGWPLK8a3DVn5FRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3140.namprd18.prod.outlook.com (10.255.136.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Mon, 29 Jul 2019 15:48:30 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 15:48:30 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v3 01/10] page-alloc: Clamp get_free_buddy()
 to online nodes
Thread-Index: AQHVRgcXbA5oo5qfM0G3fbP8NjBdsqbhvgyA
Date: Mon, 29 Jul 2019 15:48:30 +0000
Message-ID: <d3179354-a1c3-6e67-8f4e-821878f80a14@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-2-andrew.cooper3@citrix.com>
In-Reply-To: <20190729121204.13559-2-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0018.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::28) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62ca79b1-f77b-4834-25bb-08d7143c3435
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3140; 
x-ms-traffictypediagnostic: BY5PR18MB3140:
x-microsoft-antispam-prvs: <BY5PR18MB3140B6234A3DCE7DCD105085B3DD0@BY5PR18MB3140.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(199004)(189003)(71190400001)(2906002)(5660300002)(102836004)(14454004)(53546011)(386003)(76176011)(36756003)(99286004)(305945005)(71200400001)(80792005)(6246003)(478600001)(316002)(7736002)(6512007)(53936002)(6506007)(31696002)(6116002)(3846002)(476003)(11346002)(52116002)(25786009)(256004)(6436002)(2616005)(81156014)(81166006)(229853002)(186003)(446003)(66946007)(86362001)(486006)(66476007)(66556008)(8936002)(66446008)(64756008)(26005)(6916009)(8676002)(66066001)(68736007)(4326008)(31686004)(6486002)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3140;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iDJPToPNU3rcHjKSNMJnBfG6ygZUzUUWdg6Tow8xBj7baV/LYMIFnfqtkNRxPiRlKEhHnwpgWB7JscG50pJMO5HHdYwj2pNjHFIfN1ChjDRGUQIJmagoCzh+z3m8Z8zEzzhUeUo07wqJC1xqnvUtMj9Nk7O/teEhUiwst5cZAEFSeNLhNCEny8HuxLdXXbLyibfnseXBZNe2wbm6eiwV7lpXvlxpN1vEu0bjgq2C/fKkEQ5ADBIS2FacImTAamjrNGXZZAv7AZc0Qs0WncjRljc7l33+/hFq4ufcp3Si8bMTLB63qcbk4eIImxTYvShviKun9Db0sxEejsGRcrNUH8sPIKaq/zPmB0QvXNOni9Qb5lZfCpdogmxpzspNx8H5a2E3i/eNmQlWhHDqMn/3LPLYEK4I1t2sikIughWSaIE=
Content-ID: <A044621C280D7A439EBEB7601565720F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ca79b1-f77b-4834-25bb-08d7143c3435
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 15:48:30.4095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3140
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 01/10] page-alloc: Clamp get_free_buddy()
 to online nodes
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNDoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gLS0tIGEveGVuL2Nv
bW1vbi9wYWdlX2FsbG9jLmMNCj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gQEAg
LTgxMSwxMSArODExLDE4IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfZnJlZV9idWRk
eSh1bnNpZ25lZCBpbnQgem9uZV9sbywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkNCj4gICB7DQo+ICAgICAgIG5vZGVp
ZF90IGZpcnN0LCBub2RlID0gTUVNRl9nZXRfbm9kZShtZW1mbGFncyksIHJlcV9ub2RlID0gbm9k
ZTsNCj4gLSAgICBub2RlbWFza190IG5vZGVtYXNrID0gZCA/IGQtPm5vZGVfYWZmaW5pdHkgOiBu
b2RlX29ubGluZV9tYXA7DQo+ICsgICAgbm9kZW1hc2tfdCBub2RlbWFzayA9IG5vZGVfb25saW5l
X21hcDsNCj4gICAgICAgdW5zaWduZWQgaW50IGosIHpvbmUsIG5vZGVtYXNrX3JldHJ5ID0gMDsN
Cj4gICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7DQo+ICAgICAgIGJvb2wgdXNlX3Vuc2NydWJi
ZWQgPSAobWVtZmxhZ3MgJiBNRU1GX25vX3NjcnViKTsNCj4gICANCj4gKyAgICAvKg0KPiArICAg
ICAqIGQtPm5vZGVfYWZmaW5pdHkgaXMgb3VyIHByZWZlcnJlZCBhbGxvY2F0aW9uIHNldCBpZiBw
cm92aWRlZCwgYnV0IGl0DQo+ICsgICAgICogbWF5IGhhdmUgYml0IHNldCBvdXRzaWRlIG9mIG5v
ZGVfb25saW5lX21hcC4gIENsYW1wIGl0Lg0KDQpXb3VsZCB5b3UgbWluZCBhZGRpbmcgdGhlIGFw
cGFyZW50bHkgbWlzc2luZyAicyIgdG8gImJpdCI/DQoNCj4gKyAgICAgKi8NCj4gKyAgICBpZiAo
IGQgKQ0KPiArICAgICAgICBub2Rlc19hbmQobm9kZW1hc2ssIG5vZGVtYXNrLCBkLT5ub2RlX2Fm
ZmluaXR5KTsNCg0KRGVzcGl0ZSBteSBlYXJsaWVyIGFjazogQ29kZSBmdXJ0aGVyIGRvd24gYXNz
dW1lcyBhIG5vbi1lbXB0eSBtYXNrLA0Kd2hpY2ggaXMgbm8gbG9uZ2VyIGd1YXJhbnRlZWQgYWZh
aWNzLiBJIHRoaW5rIHlvdSB3YW50IHRvIGFwcGVuZCBhbg0KImludGVyc2VjdHMiIGNoZWNrIGlu
IHRoZSBpZigpLiBXaXRoIHRoYXQgZmVlbCBmcmVlIHRvIHByb21vdGUgbXkNCkEtYiB0byBSLWIu
DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
