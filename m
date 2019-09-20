Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BE8B8D15
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 10:44:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBESA-0004HF-Bz; Fri, 20 Sep 2019 08:39:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ihh=XP=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iBES9-0004HA-Dl
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 08:39:45 +0000
X-Inumbo-ID: 3172c4e4-db82-11e9-9686-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.135]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3172c4e4-db82-11e9-9686-12813bfff9fa;
 Fri, 20 Sep 2019 08:39:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzCQU5tTV+3AldeEyGIXrbv8Jra1nO7UaZ8NbTvLwNk+NE9VXntJI4gmUIK7jyrVlFXjrbhPyvBU5aDiGa39XkaD8O3HoucuATVv0PqELNEGpuD/aKVgTKmh0MX10UAZH9YuN4popnNqTqej2GJ3sRtrDugmcWBEPU/vzj6ndbaqawi53RZD6a1XK9cRbVeK673kAOOWuoKR707kVJCnMJjAfT5Dt2Zkrjtw5paO6+ej5gfDJXl3BUiqfCv79q5rh38Uuvd3fFMTWT5blI+XhDyyrb6E3r9arq/bgUAkCIZFNHPoaVdO0HFiJqVDqK0npUCY25wT73RQL0udQ7NpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+zkElLgczWd0vST0WAZh+7xGBch1RT7aosb0g7aXdk=;
 b=chJQh1lsUOgTve/qMI4oZYLYQaHmNL4j6FjvKWuXyT071jUTwX4ZvZME5h1LHhtIyYKadjJyczRW/p8N128ZrYgPIHHg8RD4xYYhzZxiaGe1OkWuh++dljuspBb2rJ5s2cY6z/wDek8utSaVNr+4hCt3yOeSArtvuOc6+C2QQHbzruSye5bcd56wefZK1i7AqZIDvadI1iQWjMor9/g7Hs9HqrxISCzY8AmqvaCCvml0bVjUAQuL5em2Tfj0xXBR4+9ufG2/+Wl1DFSBSJFBVVKLlbA3Wl6p+rGHkF1prvX0rjm+y/RlqSjav5lKKU9YAZrkKkXI0ODPaSlm5pu4sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+zkElLgczWd0vST0WAZh+7xGBch1RT7aosb0g7aXdk=;
 b=pWbG92IoU33TIAB3tELAGWHDOiIVSYKmInH2YoUE6+949PmyUnuy1Gcgwu7r/D4DfMgII98Vq5p1aycaIcIWhIYSpS/b+YulGyU6mDRxCulVhYxpgOPdRBeZWYcPQac3ki5bDhxvhBVzvKcrP36uvMu2FW2b7B/zvqGrerinVMU=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5797.eurprd02.prod.outlook.com (10.141.172.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 20 Sep 2019 08:39:42 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2284.023; Fri, 20 Sep 2019
 08:39:42 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] SVM: correct CPUID event processing
Thread-Index: AQHVbtZJ1LbqTNDLJ0GkbcyAkLC/kqc0QDUA
Date: Fri, 20 Sep 2019 08:39:42 +0000
Message-ID: <57f40bec-d2ad-192f-aeb1-008a0a701fcc@bitdefender.com>
References: <845737d3-e16e-61d7-7733-0f8b9eddfb45@suse.com>
In-Reply-To: <845737d3-e16e-61d7-7733-0f8b9eddfb45@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0097.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::38) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77823852-84c9-4fa0-e25e-08d73da614ea
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5797; 
x-ms-traffictypediagnostic: AM7PR02MB5797:|AM7PR02MB5797:|AM7PR02MB5797:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB5797AD3B7EC61A2E14B596EEAB880@AM7PR02MB5797.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(39860400002)(136003)(376002)(346002)(199004)(189003)(31696002)(446003)(11346002)(486006)(229853002)(476003)(2616005)(76176011)(99286004)(52116002)(66946007)(305945005)(66476007)(8936002)(6512007)(6436002)(256004)(66066001)(6486002)(14454004)(25786009)(81166006)(81156014)(53546011)(6506007)(386003)(86362001)(186003)(8676002)(26005)(102836004)(478600001)(36756003)(4326008)(6116002)(54906003)(6246003)(5660300002)(7736002)(110136005)(66556008)(64756008)(31686004)(316002)(66446008)(2501003)(7416002)(3846002)(71200400001)(71190400001)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5797;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EmHv67jtKRMpTfMQOgBJalURqYubezeXp3u2gls8X2jiloa+8q02Alrxf5XGTLVKFoLbWzdSERQHh9evNrz3pwh9y/Y0DSwv2nEjpuu283Xy4gWNaoAy8gTjs9JQN6imPCy2y8aM1Fp8pPBbbzL/TfSvEZt3OdRnwa13l+KN68EjzRufsO9d9zbsJRID6Af1wPyO0Zn6WLaP2p1CLS32UePZvfykTqtMCvXbUbEa2qgzWYbacoxneqTzgleH723voevu44DIJX6sJHjqc4hc4+1mkFHaifFi02/yZH2iEUkukkM48BZrV2Fg3tsrpMD23NPZIodHf04txxTFVu+ClYyFlt1Es1M1Kq0Nz5nMriwZTVqNzsJk1kyCvge2Mb8TRD813dDTDoFZ4y5YFlYEL8LWiI7KM5IyPWsd1JiMyto=
Content-ID: <AE14F6BA81FF4341845D617991758ECA@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77823852-84c9-4fa0-e25e-08d73da614ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 08:39:42.2068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WdQwWeeokiqh4ReugkwlXjcStsJh9Zqm2RF0y+XQekStddwDxmNC13PT4T3Fi1FyKbwvf0wpHg986YtIpnkOWfQ9FAL+deN30SaChULpv1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5797
Subject: Re: [Xen-devel] [PATCH] SVM: correct CPUID event processing
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
 Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE5LjA5LjIwMTkgMTM6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBodm1fbW9uaXRv
cl9jcHVpZCgpIGV4cGVjdHMgdGhlIGlucHV0IHJlZ2lzdGVycywgbm90IHR3byBvZiB0aGUgb3V0
cHV0cy4NCj4gDQo+IEhvd2V2ZXIsIG9uY2UgaGF2aW5nIG1hZGUgdGhlIG5lY2Vzc2FyeSBhZGp1
c3RtZW50LCB0aGUgU1ZNIGFuZCBWTVgNCj4gZnVuY3Rpb25zIGFyZSBzbyBzaW1pbGFyIHRoYXQg
dGhleSBzaG91bGQgYmUgZm9sZGVkICh0aHVzIGF2b2lkaW5nDQo+IGZ1cnRoZXIgc2ltaWxhciBh
c3ltbWV0cmllcyB0byBnZXQgaW50cm9kdWNlZCkuIFVzZSB0aGUgYmVzdCBvZiBib3RoDQo+IHdv
cmxkcyBieSBlLmcuIHVzaW5nICJjdXJyIiBjb25zaXN0ZW50bHkuIFRoaXMgdGhlbiBiZWluZyB0
aGUgb25seQ0KPiBjYWxsZXIgb2YgaHZtX2NoZWNrX2NwdWlkX2ZhdWx0aW5nKCksIGZvbGQgaW4g
dGhhdCBmdW5jdGlvbiBhcyB3ZWxsLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlz
YWlsYUBiaXRkZWZlbmRlci5jb20+DQoNCj4gDQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZt
LmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KPiBAQCAtMzM0OSwxNCArMzM0OSwy
OCBAQCB1bnNpZ25lZCBsb25nIGNvcHlfZnJvbV91c2VyX2h2bSh2b2lkICp0DQo+ICAgICAgIHJl
dHVybiByYyA/IGxlbiA6IDA7IC8qIGZha2UgYSBjb3B5X2Zyb21fdXNlcigpIHJldHVybiBjb2Rl
ICovDQo+ICAgfQ0KPg0KDQpVc2VmdWwgZm9sZC4gTWF5YmUgYSBzbWFsbCBjb21tZW50IHdpdGgg
dGhlIHJlYXNvbiB0byBoYXZlIG9uZSBmdW5jdGlvbiANCndvdWxkIGhlbHAuIFNvbWV0aGluZyBs
aWtlIGJvdGggU1ZNIGFuZCBWTVggZG8gdGhlIHNhbWUgdGhpbmcsIGJ1dCBpdCdzIA0KdXAgdG8g
eW91IGlmIGl0IGlzIG5lY2Vzc2FyeS4NCg0KPiAtYm9vbCBodm1fY2hlY2tfY3B1aWRfZmF1bHRp
bmcoc3RydWN0IHZjcHUgKnYpDQo+ICtpbnQgaHZtX3ZtZXhpdF9jcHVpZChzdHJ1Y3QgY3B1X3Vz
ZXJfcmVncyAqcmVncywgdW5zaWduZWQgaW50IGluc3RfbGVuKQ0KDQpBbGV4DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
