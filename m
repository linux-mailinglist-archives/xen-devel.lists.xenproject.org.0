Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7887A3FA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:24:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOJU-0006gx-Dc; Tue, 30 Jul 2019 09:20:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsOJS-0006gr-8E
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:20:54 +0000
X-Inumbo-ID: 50439a1f-b2ab-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 50439a1f-b2ab-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 09:20:52 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 09:20:46 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 09:14:08 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 09:14:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDj5UZCE1ZnFavihqa+6CENc2+u9BUS/dDfKYdDZr8LIcc94UpVixjrBB33xwv15lxjEviVLIp52yOAf+/OGrd18qsScPRBIw0mzkK05OhjIi55KpZayVMZ1WjR9IaJaC9So6Al9Ylb2qps3RpjBqbicQZIcAOLmhHbuS7XRmpBAphR7afuYCNJt9h2PQ3cQFrf2cxxLwkD/j7EID3J62u363/M8lRCNXpzo0XfybiPZ/+pACPuYTWMS4HsUPsFZzKrngpNJo0aqHh7e2lRrd0CZt0cx4egthUkWCJkAKeXMnnf0MKl+5eSw0AR6bIaogCqYkL/umdxkecXcsU8dNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6He+XytxQhKUuashEWjYp44OBZM4dzo4Y/63Bq9oTdU=;
 b=WXivxwzhKaYIRijtseFxNW4xSrY1ENJIlmytkfm5ri1SzqCebjohIXVuD/g43fPGIp7AE0tUXXfWV0MGSvI4Xl2QbazWu7lqHqG11mo0lksTFqXb2IdDJs8N+ig+6mXoVXfY8h25jtdtIGOB9Htm6wNU4X/MCWfYgiQquK/zH3ToMa5k561IcBfy7OxCgc98PnIh/lwFVFc1sSY+XXJGphnvln/uxG19EcobuAhhC5sSPCFstvUpIwvYq4XeHLtcR6IKFhM2QeLIYm7+77RDGVb0PvEsNMYlQTqy1MkNAxR7RTPRBeoptMlrweJT7UJStKT9tCDLNoalO5NmU1RgpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3267.namprd18.prod.outlook.com (10.255.138.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 09:14:07 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 09:14:07 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>
Thread-Topic: Ping: [PATCH v4 01/12] AMD/IOMMU: use bit field for extended
 feature register
Thread-Index: AQHVQuz0h0YSkgZ2V0CykyBnr4e8Mabi6GcA
Date: Tue, 30 Jul 2019 09:14:06 +0000
Message-ID: <c5ed12aa-5754-7820-1ef2-e6d4efa7a35a@suse.com>
References: <b8ae110a-f94a-4ed2-5cf9-c00ff1c0cb81@suse.com>
 <bc717f3d-a116-c3de-7864-b21e900e9c34@suse.com>
In-Reply-To: <bc717f3d-a116-c3de-7864-b21e900e9c34@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DBBPR09CA0028.eurprd09.prod.outlook.com
 (2603:10a6:10:d4::16) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4362ee83-56ca-46d4-3cec-08d714ce460a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3267; 
x-ms-traffictypediagnostic: BY5PR18MB3267:
x-microsoft-antispam-prvs: <BY5PR18MB3267613A1BEDA759930F6794B3DC0@BY5PR18MB3267.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(189003)(199004)(71200400001)(4744005)(66446008)(64756008)(66556008)(66946007)(66476007)(71190400001)(31696002)(68736007)(8936002)(6436002)(31686004)(6486002)(476003)(86362001)(305945005)(7736002)(14454004)(53936002)(446003)(2616005)(6506007)(25786009)(36756003)(11346002)(54906003)(4326008)(66066001)(186003)(102836004)(99286004)(2906002)(80792005)(5660300002)(6116002)(53546011)(81156014)(478600001)(256004)(8676002)(486006)(81166006)(3846002)(76176011)(6512007)(316002)(52116002)(26005)(386003)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3267;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mtva3ppmlMqVL9NE0FiVjL9hMZKWgCTtx9uJU/P2wA8b0ey8WtfSnJtVKjkikTKowqICgjoJolY3bnWimCQVerTzsFbU3zXOFqmUXdRXtVNMOkv/NtLnQ0Z25UtgKbGqiHNyCewmHwK9G6KqjfoCyfR6Cc9bEFhJI9io993jn6ldLV9Vz8xioqVFvfJLheMqW/jLXLkH8uvN9D/g2gtG5Zu7ElrnHo30y0tJZ8EtdQ5E8Hdb2B6DtABvRZTLmdD14peL3u+fpcjFZQudsFx3xtuLS+xtczSYvOk5IhHEAvhqEXoDqqco203disq+GCo/CvpOf3WubYIalJotdeHyRPTHH8Lo4T5w4Kb42SKqq+qJ3IpKcAeQPREYl1xbu475akz7Ommk4yS0j0KwITQu9FlcLhjf9wU/5vxi6LXvf1Y=
Content-ID: <0B45B2577764FA4F8D7B4F15E7EC671B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4362ee83-56ca-46d4-3cec-08d714ce460a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 09:14:06.8957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3267
X-OriginatorOrg: suse.com
Subject: [Xen-devel] Ping: [PATCH v4 01/12] AMD/IOMMU: use bit field for
 extended feature register
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxNToyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoaXMgYWxzbyB0YWtl
cyBjYXJlIG9mIHNldmVyYWwgb2YgdGhlIHNoaWZ0IHZhbHVlcyB3cm9uZ2x5IGhhdmluZyBiZWVu
DQo+IHNwZWNpZmllZCBhcyBoZXggcmF0aGVyIHRoYW4gZGVjLg0KPiANCj4gVGFrZSB0aGUgb3Bw
b3J0dW5pdHkgYW5kDQo+IC0gcmVwbGFjZSBhIHJlYWRsKCkgcGFpciBieSBhIHNpbmdsZSByZWFk
cSgpLA0KPiAtIGFkZCBmdXJ0aGVyIGZpZWxkcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNCkJyaWFuLCBTdXJhdmVlLA0KDQpnZXR0aW5nIHlv
dXIgYWNrIGhlcmUgd291bGQgdW5ibG9jayBhIGZhaXIgcGFydCBvZiB0aGUgcmVzdCBvZg0KdGhp
cyBzZXJpZXMuDQoNClRoYW5rcywgSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
