Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601F9717DA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 14:13:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hptdx-0007cE-N2; Tue, 23 Jul 2019 12:11:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hptdw-0007c0-G3
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 12:11:44 +0000
X-Inumbo-ID: 0846d8d5-ad43-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0846d8d5-ad43-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 12:11:43 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 12:11:38 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 12:08:22 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 12:08:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeNwKPwLte5eAKy2J/t65BkGJ12i73w8iqVpAJVkS8ejr71nX0sSKgUlWerY9+HX9ieuDVm+1Lm0IIPL55ZEuBJJSxSzeGT3161/c66/8fDk5R03Nd36JAEZANQTZqfxQI214v5PcuRwk6TA0VIMpqqgVE+1KBoCwV42mCFUL6pG5Ol6tjGKFZBnQOh33haE6Hn51oSi7iyv+74T58ZYXVKekOyrMrpgQtgBGSmtb1wLG/zd1qa1uUavwiGB1ji5UAiX0vRPV61qd95PQoELdsFChDWZm82rO9n04r4OdGsh5GZ5FAi4PgRpek7vrheX/lVFuSq2LZqyLEhBqPmNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oxlv3Czbf0Ig3VGYHImN8O7N2zYxFkxSFbuEwKjg8jM=;
 b=HoPu5CtFD+VKnrUifjovzNOe0fyDQbmdy9alIwzq0WAkvn8jB/PNqEygoxqrwfTUVvRpd/742bY1netlfs1XULkDyadB+iCyQUbHvBjKv+dtSHSam6NvhH7glh6OtIQWXr4l3KRNJ6/U0PXwr28KeIe8Wjyhv4tpQxSW0226lgJAaL8WIDVHQiP6OfhqrTqpgnsej03BO71dURINgP9NzXoGlTDYrq9DAdNFvPD/ZZ8PxZTECD7aMusu3C56zc503LzgxZVbgHGhFJBVh+tN4L7cfJjXscM/oMQU1NAiLsL2kI2ZsVbRBk1dJoT7U2xCPsUoG9ZIhWWY4spt4cLRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3228.namprd18.prod.outlook.com (10.255.173.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 12:08:21 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 12:08:21 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [Xen-devel] [PATCH 1/2] xen/sched: fix locking in
 restore_vcpu_affinity()
Thread-Index: AQHVQTgHI8aGEPkD5UStXgNaqUm5nqbYHCyA
Date: Tue, 23 Jul 2019 12:08:21 +0000
Message-ID: <6f10f947-3375-4a2b-d977-05c587798121@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-2-jgross@suse.com>
In-Reply-To: <20190723092056.15045-2-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0240.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::36) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d543ca9-b0f4-444b-e4e0-08d70f667480
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3228; 
x-ms-traffictypediagnostic: DM6PR18MB3228:
x-microsoft-antispam-prvs: <DM6PR18MB3228A6BA711D70C68DC1648AB3C70@DM6PR18MB3228.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(199004)(189003)(31686004)(76176011)(66556008)(71200400001)(68736007)(64756008)(66946007)(66446008)(102836004)(36756003)(107886003)(31696002)(6506007)(6246003)(6862004)(186003)(71190400001)(80792005)(54906003)(5660300002)(229853002)(53546011)(386003)(26005)(4326008)(2906002)(81166006)(4744005)(81156014)(6636002)(316002)(25786009)(2616005)(53936002)(6116002)(305945005)(37006003)(14444005)(486006)(478600001)(66476007)(8676002)(6486002)(446003)(3846002)(6436002)(99286004)(14454004)(256004)(476003)(86362001)(52116002)(11346002)(7736002)(66066001)(8936002)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3228;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g5aX+LCPYB2ap/JeUYjs+Fv33j8+MAN438l9DC1wcqAYV5q5othomF3IkwLw78YOSycv8JepIgOpCTEhyZmWRdZsj1TS1VBdklSq9pEiS7ArJZ73MNatnujZOKm8tUELcmr0dxc5aqppQFPH8jbqr3PJHHXROEowdOaJV4cJcGlNt+JP+sRr13tFQZO16ZLEz81RvQQElL7T1hVb4R/+Z7o2RTKmy1Ibmq0AmF+387vK3qAekloMzBF45FciSUKOlLpzrVQVu+wYrBU+Q+53Ub6w3W3WjCPG+nXaycPFxjVM3dTnaf3SkHBd7DNXjNhTEaTwZAXOLJC4EgRNzPhkNjUh8dS8V1vzkmeXJ7+gJqHv0ojclb0YHwA9ieYeGNtNIjDglCmsZ1coKlZ53nJ2P8vHEEcZMJU9zhZtHXG6dXQ=
Content-ID: <D2E41C5AD433A541A3620AAAEEE3D046@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d543ca9-b0f4-444b-e4e0-08d70f667480
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 12:08:21.3498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3228
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/2] xen/sched: fix locking in
 restore_vcpu_affinity()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAxMToyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gLS0tIGEveGVuL2Nv
bW1vbi9zY2hlZHVsZS5jDQo+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYw0KPiBAQCAtNzA4
LDYgKzcwOCw4IEBAIHZvaWQgcmVzdG9yZV92Y3B1X2FmZmluaXR5KHN0cnVjdCBkb21haW4gKmQp
DQo+ICAgICAgICAgICAgKiBzZXQgdi0+cHJvY2Vzc29yIG9mIGVhY2ggb2YgdGhlaXIgdkNQVXMg
dG8gc29tZXRoaW5nIHRoYXQgd2lsbA0KPiAgICAgICAgICAgICogbWFrZSBzZW5zZSBmb3IgdGhl
IHNjaGVkdWxlciBvZiB0aGUgY3B1cG9vbCBpbiB3aGljaCB0aGV5IGFyZSBpbi4NCj4gICAgICAg
ICAgICAqLw0KPiArICAgICAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2KTsNCj4g
Kw0KPiAgICAgICAgICAgY3B1bWFza19hbmQoY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLCB2LT5j
cHVfaGFyZF9hZmZpbml0eSwNCj4gICAgICAgICAgICAgICAgICAgICAgIGNwdXBvb2xfZG9tYWlu
X2NwdW1hc2soZCkpOw0KPiAgICAgICAgICAgaWYgKCBjcHVtYXNrX2VtcHR5KGNwdW1hc2tfc2Ny
YXRjaF9jcHUoY3B1KSkgKQ0KPiBAQCAtNzMxLDYgKzczMyw5IEBAIHZvaWQgcmVzdG9yZV92Y3B1
X2FmZmluaXR5KHN0cnVjdCBkb21haW4gKmQpDQo+ICAgDQo+ICAgICAgICAgICB2LT5wcm9jZXNz
b3IgPSBjcHVtYXNrX2FueShjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSkpOw0KPiAgIA0KPiArICAg
ICAgICBzcGluX3VubG9ja19pcnEobG9jayk7DQo+ICsNCj4gKwkvKiB2LT5wcm9jZXNzb3IgbWln
aHQgaGF2ZSBjaGFuZ2VkLCBzbyByZWFjcXVpcmUgdGhlIGxvY2suICovDQoNCldob2V2ZXIgY29t
bWl0cyB0aGlzIChwZXJoYXBzIG1lLCBsYXRlciB0b2RheSkgd2lsbCB3YW50IHRvIHJlcGxhY2UN
CnRoZSBoYXJkIHRhYiBoZXJlLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
