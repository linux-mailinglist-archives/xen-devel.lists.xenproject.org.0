Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CEA8211C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 18:03:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hufPj-0001HP-D9; Mon, 05 Aug 2019 16:00:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hufPh-0001HE-VY
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 16:00:46 +0000
X-Inumbo-ID: 2e2939a9-b79a-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2e2939a9-b79a-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 16:00:45 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 16:00:39 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 15:58:24 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 15:58:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D71Mh8xKGQ1+WOc7pVuFYKdMxTDAg0Ev+STCXSdsLQHunDrnZpeNHw9sg0rw9aySh6I/eOojAyiTpAC9WYpbsfrZLEyWGYjpD8BxUmaXHy1X9xqwHzT2n8V9diZCBln709mkkvPkNYK38Ot/sB4oBE4l+gSHAcbn6yQKBxks27vDO8fv+DFWueD+IA/OQwlgk2FroBwr7nZxutzG5fG6xfea9OsRXUKTHWXhWjryM7aqwGl5XV43jJhQJxNjV2+LhtSxSw6M5OZpw4KbSzfQFLOK5i1svo9EPC99zHlJRmFF6iZMzxjZcEWnTrkkiJMzGYJHvsloSztM1ldmXO+GRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzPGFZlRqq8P7L8kqJss0iNuUIL2Fvn7lKXk3Ni2I3A=;
 b=P6zjjwSjv0KFsdwlvqeRVfS/ieomP1WMJ11FmPS5UZa/VgLgM1iJByeKsWl21oF9RTjldu5bCqT7RNs5SgaEB++q9SkwNgbEaLhpWN4RiH+7UOPy71frEUUBAAWqOPt3SsZU3uj239Kxs/Z2wN52O1529OW9OEbGNZvslKp2AOe3XYkr0da5cyZ+FEcjvjAiI2rWPbAFAI2ZtDlldgDMRK2MmWTt7iv3/I2ftqCSTYUgE7o/JZfSo0cevDeIUoKlvabtbvciMB7wGnBZvkOJb0KbbQjLia3HYroLQ0N592hu/MvoR2yAxM4obkPkSvYB7hk3myEYeRllRfR7p5G2BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3088.namprd18.prod.outlook.com (20.179.21.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 15:58:22 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 15:58:22 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2 1/4] xen: sched: refector code around
 vcpu_deassign() in null scheduler
Thread-Index: AQHVQ3sg+fAdHgvAC0WLlVMWlooihqbsxjkA
Date: Mon, 5 Aug 2019 15:58:22 +0000
Message-ID: <13f139f6-c39d-f30f-11ae-3338d044a7fe@suse.com>
References: <156412188377.2385.12588508835559819141.stgit@Palanthas>
 <156412235104.2385.3911161728130674771.stgit@Palanthas>
In-Reply-To: <156412235104.2385.3911161728130674771.stgit@Palanthas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0094.eurprd07.prod.outlook.com
 (2603:10a6:207:6::28) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15ca393c-2f61-4b72-5812-08d719bdbdf4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3088; 
x-ms-traffictypediagnostic: MN2PR18MB3088:
x-microsoft-antispam-prvs: <MN2PR18MB30880FFE93DDC24443E2D52DB3DA0@MN2PR18MB3088.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(199004)(189003)(102836004)(66476007)(6246003)(14454004)(81166006)(81156014)(54906003)(68736007)(4326008)(2906002)(8676002)(316002)(66556008)(478600001)(66946007)(256004)(31686004)(3846002)(6116002)(8936002)(229853002)(305945005)(80792005)(7736002)(99286004)(36756003)(11346002)(2616005)(476003)(446003)(486006)(25786009)(66446008)(64756008)(6916009)(76176011)(4744005)(71190400001)(71200400001)(186003)(5660300002)(26005)(66066001)(6486002)(31696002)(53546011)(6506007)(386003)(6512007)(86362001)(52116002)(6436002)(53936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3088;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NocoSvL/nIPPm5NO6w30EJiGYOCxobZ1W9f24zm2UFNVRk7P8WUV9ILf3/pFFcmjlSrmU+x2kZI0/4cwsuC5MZjLQsTpj2Gl8xWW1C8JSsL58ne4qq+fKUyDIEb1IE15mjy0sIuDheOp2vuWEdw7+8peGdiek8zgrcwWMB+cNbfl8azN73+OXpBYlI2KdthmNHs5UZCAqnyq5XM9i84VCmWNYEs6A9wEKSt99i+47izZN6fDXME6Es+1TBkRk+gW6kP59KJfSGHYPdId5qF/QFC6yHTVi9LLtiu4zEc4yAego/u6kE25gu4xvgZjK3y6v7PEUx84Bl50Yk2JygsIpzVt++TxwoyHvJvNj+KdhJv5Dful89yR4IG6+Lhcbx1c3yrz1oNAksWO2nTUC5t8pWoRJ0uQqzWJ3zgxOSnpod4=
Content-ID: <B859084D2C28E449BBDE1CDD67880C7C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ca393c-2f61-4b72-5812-08d719bdbdf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 15:58:22.4783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3088
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 1/4] xen: sched: refector code around
 vcpu_deassign() in null scheduler
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
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMjAxOSAwODoyNSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6DQo+IHZjcHVfZGVhc3Np
Z24oKSBpcyBjYWxsZWQgb25seSBvbmNlIChpbiBfdmNwdV9yZW1vdmUoKSkuDQo+IA0KPiBMZXQn
cyBjb25zb2xpZGF0ZSB0aGUgdHdvIGZ1bmN0aW9ucyBpbnRvIG9uZS4NCj4gDQo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlIGludGVuZGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gRmFnZ2lv
bGkgPGRmYWdnaW9saUBzdXNlLmNvbT4NCj4gQWNrZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbT4NCg0KSSdtIHB1enpsZWQgYnkgY29tbWl0IGEzOTc0NzEyNzgs
IGluIHR3byB3YXlzOg0KDQoxKSBUaGUgY29tbWl0IGlzIGVtcHR5LCBwcmVzdW1hYmx5IGJlY2F1
c2UgSSBkaWQgYXBwbHkgdGhlIHBhdGNoIGEgZmV3DQpkYXlzIGFnbyBhbHJlYWR5Lg0KDQoyKSBU
aGUgY29tbWl0dGVyIGlzIHJlY29yZGVkIGFzICJQYXRjaGV3IEltcG9ydGVyIDxpbXBvcnRlckBw
YXRjaGV3Lm9yZz4iLg0KRG8gd2UgcmVhbGx5IHdhbnQgdG8gaGlkZSB0aGUgZmFjdCB3aG8gaGFz
IGJlZW4gY29tbWl0dGluZyBhIHBhdGNoPw0KV2hpbGUgaXQncyBtb3N0bHkgbWVjaGFuaWNhbCwg
dGhlcmUncyBzdGlsbCB0aGUgaHVtYW4gZGVjaXNpb24gb2YgInRoaXMNCmlzIHJlYWR5IHRvIGdv
IGluIiBpbnZvbHZlZCwgd2hpY2ggSSBkb24ndCB0aGluayBhIGJvdCBjYW4gcmVsaWFibHkgdGFr
ZQ0KaW4gYWxsIGNhc2VzLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
