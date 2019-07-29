Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E378E7A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 16:56:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs727-0004RF-84; Mon, 29 Jul 2019 14:53:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs725-0004R7-Cf
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 14:53:49 +0000
X-Inumbo-ID: ab203fdc-b210-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ab203fdc-b210-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 14:53:47 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 14:53:45 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 14:35:47 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 14:35:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ixatg4K8l05EwA52xw0tsu1gaL52Y/7JRySwtP38741vMLbNNVkRp2/efLNF1gmSI19UNe73B/KUXrR4ZnBlofhrljnE8oTs8vBF0/B7bo+wyyRQ9pJ40VVQwTFWHFysV4bL352cCkw80uZAw40YdQhNU1rURAera3HVGWYfHSa0KdMnOZZRbCOHVP0nlgphxXGUh3U4bJGjEaaJD5AVWI/c83z7PO2I5mytSBum8R154gfcJr3duM0KkoXjAsmNTCLaRUb+2YLHV6oWvzFBGUgTD+tu34UtqPMszYwcZY4/jmiapg47q1S+OQh5/ycJjTFDy6vHDSyBpruAqWtMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cL8+1oahNVOqJA+5J6p3EX9Ow2nhBiR68VgVAMLdZUM=;
 b=DTRcCuA25f8vE6tjNXZSNM46tV7Od2XFjAYJ6TL6KMfFGczfxs1ULUSNB91GmwiUo4dkdPPRqYOBsGrRrxL02rYZOPWZ6gxn8we5Rwqu2J/bf1DCug4PKrQFh14q/XVtuMXaP9zyuL1VNX0lqkpCwTna+sWLHcKEbgLsqVsDIqY/Zdj+3ZHxDiqoEWi0Cut7YRRZlEN3WDailj8WhOMFNlG1Ggc4EtfA6MmiBdGcrpXVJDVrmcpbZ9oeiXal3jE5mctfDwgBIfUCih9at48JmSMLUkP9U/znl8en/N2lMxFmZk6Ng9ahTqJNjEUBnzMEiAdhRvmQrBt4fuPk5QopuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3266.namprd18.prod.outlook.com (10.255.163.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Mon, 29 Jul 2019 14:35:46 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 14:35:46 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v2 3/6] x86/hvm/domain: remove the 'hap_enabled' flag
Thread-Index: AQHVQu5vz1VKdPiVUEavBBqvCluqW6bhr+wA
Date: Mon, 29 Jul 2019 14:35:46 +0000
Message-ID: <4e5f66f9-3315-30ff-68e5-6f11cb0862ba@suse.com>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
 <20190725133920.40673-4-paul.durrant@citrix.com>
In-Reply-To: <20190725133920.40673-4-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:44::19) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ad8ffca-21d4-4da5-9140-08d714320b14
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3266; 
x-ms-traffictypediagnostic: BY5PR18MB3266:
x-microsoft-antispam-prvs: <BY5PR18MB3266879207A6E63F63EAF704B3DD0@BY5PR18MB3266.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(199004)(189003)(6116002)(6486002)(478600001)(229853002)(76176011)(4744005)(3846002)(6436002)(99286004)(80792005)(4326008)(36756003)(5660300002)(31696002)(14454004)(53936002)(54906003)(6246003)(6916009)(6512007)(25786009)(52116002)(26005)(102836004)(8676002)(81156014)(81166006)(186003)(486006)(446003)(66066001)(8936002)(2906002)(316002)(86362001)(6506007)(386003)(476003)(2616005)(11346002)(31686004)(68736007)(305945005)(256004)(7736002)(66446008)(64756008)(66556008)(71200400001)(71190400001)(66476007)(66946007)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3266;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hss4XD9uLrvz7M2lm4HezXfgPkJx2nrOPk41yKOg6AoB8HR42zNW/npvTpqU5k3sRcMnZpt7Ejhnj7MQMl6t/l8iWfFqOyPri7VvhLZzmRceB7Q7nksvfVSW6ImL0hgwEogN7BeKgMq/dRS7t4PGRWjfO3a+WU3dKv9RVu10D/nDX1ktiNmbwxzkMWccdC9tsrjU0NRrYFJo+7D5pHXBc9XdqxVeYrnKQOQuAAKu0BZNHRJRvnTTxIVJcPYzBhJ5ePT8bHydq4XHTUDcKQDmCdtr1fcURzoyo8umeRHKdxYrLUbRH+Mw08CMAj0PAXaFmJz69xSz8hDWVTL7+kU14ChzZwrbi1sBh3hsShROlJCUlSrRXBhSUX6V4YlF2+RfVO+wZTN2JRDmteLwFIGU3R2lvQZ9bj6KmDQ0L1KXqWo=
Content-ID: <BB0B7D436DA2C541BCCF27B1B60F5266@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad8ffca-21d4-4da5-9140-08d714320b14
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 14:35:46.4471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3266
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 3/6] x86/hvm/domain: remove the
 'hap_enabled' flag
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxNTozOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBAQCAtMTk1LDExICsx
OTQsOSBAQCBzdHJ1Y3QgaHZtX2RvbWFpbiB7DQo+ICAgICAgIH07DQo+ICAgfTsNCj4gICANCj4g
LSNpZmRlZiBDT05GSUdfSFZNDQo+IC0jZGVmaW5lIGhhcF9lbmFibGVkKGQpICAoaXNfaHZtX2Rv
bWFpbihkKSAmJiAoZCktPmFyY2guaHZtLmhhcF9lbmFibGVkKQ0KPiAtI2Vsc2UNCj4gLSNkZWZp
bmUgaGFwX2VuYWJsZWQoZCkgICh7KHZvaWQpKGQpOyBmYWxzZTt9KQ0KPiAtI2VuZGlmDQo+ICsj
ZGVmaW5lIGhhcF9lbmFibGVkKGQpIFwNCj4gKyAgICAoaHZtX2hhcF9zdXBwb3J0ZWQoKSAmJiBp
c19odm1fZG9tYWluKGQpICYmIFwNCj4gKyAgICAgZXZhbHVhdGVfbm9zcGVjKGQtPm9wdGlvbnMg
JiBYRU5fRE9NQ1RMX0NERl9oYXApKQ0KDQpSYXRoZXIgdGhhbiBhZGRpbmcgeWV0IGFub3RoZXIg
JiYgaGVyZSBJIHRoaW5rIHlvdSB3YW50IHRvDQpyZWplY3QgWEVOX0RPTUNUTF9DREZfaGFwIGlu
IGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZygpDQp3aGVuICFodm1faGFwX3N1cHBvcnRlZCgp
LiBTaW1pbGFybHkgdGhlIGlzX2h2bV9kb21haW4oKQ0KY291bGQgdGhlbiBhbHNvIGJlIGVsaW1p
bmF0ZWQgYnkgY2hlY2tpbmcgdGhhdCBDREZfaGFwIGlzDQpzZXQgb25seSB0b2dldGhlciB3aXRo
IENERl9odm0gKG9yIGJ5IGNsZWFyaW5nIENERl9oYXAgaWYNCkNERl9odm0gaXMgY2xlYXIgLSBk
ZXBlbmRzIG9uIHdoYXQgY29tcGF0aWJpbGl0eSBuZWVkcw0KdGhlcmUgYXJlLg0KDQpUaGlzIHdv
dWxkIHRoZW4gYWxzbyBlbGltaW5hdGUgdGhlIGRvdWJsZSBldmFsdWF0aW9uIG9mDQoiZCIuDQoN
Ckphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
