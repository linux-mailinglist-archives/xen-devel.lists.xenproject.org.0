Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E732D0E20
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 14:01:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIAbQ-00020L-3S; Wed, 09 Oct 2019 11:58:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N2IE=YC=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1iIAbO-00020G-RW
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 11:57:58 +0000
X-Inumbo-ID: 07b68f00-ea8c-11e9-97ee-12813bfff9fa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07b68f00-ea8c-11e9-97ee-12813bfff9fa;
 Wed, 09 Oct 2019 11:57:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elQXraEM6I2AhEvQf4lwNGuEhNg9YHJqJ4FW5s5oKL9a0HvWhLRZAEaW1nxzDdN5DNEgJkryQXqlBKMHbd1qnAok6Z8sDvnHUqja6uYg14hJb83/oAJctoLgC/mA3R4SWqZacuZjr3/vc8HtdrOAgM7QRSYDR6o6daaDNucmQYF/ss+0AP9dwkm0ll0gsjqMpl3AtP4Ukj97sAmwdjFX1yAUyYQabje5pzm3NPJ+ZpJU1i0RSrFI//7vcDzn3kyqn/QsnrPtv6CzzEsy1DB/FsQ1H72ZfMaQk+4bGB4JdH3VIVFIApuQmNTvS4HW9dY9SelNREoOZe0Rkboopi0S4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nr7Vr/OvhGN99ZMQjcsTImRo9FJcks7G+HgxISGqHOo=;
 b=SWGm67xt7aMOM5Fk7dJg6VnM7os9pIxo1FGwf8Q18E5jTaQjru+mGJlgKIPV8/bFeDKSEiPBbNb8TE0FOMhygWnP6wusffouyKcjTbAuocDl3JCfGBHD2qkRP75/gUkJeimiYhEBG+DsVkEo/izAZ3FFsrNqtPTtF169s/oXlkUSIU5mzd87MCA7EAt6Bs8Ow+QAmME+T3wVnnTAVtjSHMuiyBisdIgFwRbOE1t1MCfWZ3KFkTdyJviLZO4bftENejelOL9ajEQwcCjGPA9oc6r8ioOSEX2ARHlFAxQHGKlrmTSP8l2oSx/rXcZ0OQwLmD/mwr8ypo8gO/iSTKISNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nr7Vr/OvhGN99ZMQjcsTImRo9FJcks7G+HgxISGqHOo=;
 b=cP48vgDoRIgKmuhprs992zf9sQPX+0sAKgZxMy9JaRgjoupgw/9E7GUYA3lbJ21cZU4+p9uPiFJ7DZQ4pGCMBnEyDAG6W/MEtiI0i+5bgiTlhP49Oun66ZoisVFP8UwusVWnkKlehiixM/Gd092HDewx+HW0XqjMcmx6Fn+ywGQ=
Received: from AM6PR03MB3749.eurprd03.prod.outlook.com (52.134.116.144) by
 AM6PR03MB4917.eurprd03.prod.outlook.com (20.177.199.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 11:57:54 +0000
Received: from AM6PR03MB3749.eurprd03.prod.outlook.com
 ([fe80::9d00:73d1:7652:2325]) by AM6PR03MB3749.eurprd03.prod.outlook.com
 ([fe80::9d00:73d1:7652:2325%7]) with mapi id 15.20.2327.025; Wed, 9 Oct 2019
 11:57:54 +0000
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH for-4.13] xen/xsm: flask: Prevent NULL
 deference in flask_assign_{, dt}device()
Thread-Index: AQHVetLnOcgJQSH9KE+B1/k9VstXPKdSO+mA
Date: Wed, 9 Oct 2019 11:57:54 +0000
Message-ID: <f262a8aeb67c6aabde80b1e6cdae6f19c077ff11.camel@epam.com>
References: <20191004164243.30822-1-julien.grall@arm.com>
In-Reply-To: <20191004164243.30822-1-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Artem_Mygaiev@epam.com; 
x-originating-ip: [85.223.141.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2948c38-53a4-467d-0440-08d74cafeb65
x-ms-traffictypediagnostic: AM6PR03MB4917:
x-microsoft-antispam-prvs: <AM6PR03MB4917ADA41D6AE380121FCF50F4950@AM6PR03MB4917.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(189003)(199004)(11346002)(486006)(2616005)(446003)(86362001)(2501003)(476003)(256004)(305945005)(478600001)(118296001)(7736002)(186003)(25786009)(5660300002)(26005)(8936002)(6246003)(2906002)(229853002)(36756003)(71200400001)(66556008)(81166006)(81156014)(76176011)(8676002)(80792005)(3846002)(71190400001)(4326008)(66476007)(6436002)(6116002)(91956017)(6486002)(66446008)(76116006)(66066001)(102836004)(6512007)(99286004)(66946007)(316002)(55236004)(54906003)(110136005)(14454004)(6506007)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB4917;
 H:AM6PR03MB3749.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nXSg3kPwYhZEppqxG9ArQ/FHmNLqaKKfj1ZQGBUF9gY/bNZznCtQUDUIYhK0uckPPokIS6od/1P4E6CmlSZSdWMVr+x2TaH2BgsaTgoJXw9JT+qqq/QwRA0RxiXkdP2D/HuR+983flthxO3v8QsHLECvTqzdYdGCoz2JdwvYDwidNA5Yq1mWFkibUD3Y65V9fM1Vr9bK0v66c+8VEQ8GOfqCjYRAky5TZrTO+qrbAUsBykO/8dYgYbXGYBYDqFhZUUGENXOWC89s1qGWWQeFkrsZ9Li7gxbWTzpT8oAQA2M3QTrSKQTJ51vqNVbFginSyfuwPXVCx3vi7Sjd8b1FaelgKb9WienZrN7mM9ABHQysfij7MiMu+Bbco/kGfi+aVLNOEbtHG2m7LvoGIucgMhuLLL7V733u1QV7x3SCgxU=
x-ms-exchange-transport-forked: True
Content-ID: <7B7AE9400A86BF42B750E48B896B2323@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2948c38-53a4-467d-0440-08d74cafeb65
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 11:57:54.7528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: goG7627fr0pTp85i5Nfjm63+zH3Av7Td7E9HLOVDJY6bDHBw8HWbNGLDZ1SJjnmPRzPLyiW70sZwawhdsiwyag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4917
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/xsm: flask: Prevent NULL
 deference in flask_assign_{, dt}device()
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "dgdegra@tycho.nsa.gov" <dgdegra@tycho.nsa.gov>, "paul@xen.org" <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuDQoNCk9uIEZyaSwgMjAxOS0xMC0wNCBhdCAxNzo0MiArMDEwMCwgSnVsaWVuIEdy
YWxsIHdyb3RlOg0KPiBmbGFza19hc3NpZ25feywgZHR9ZGV2aWNlKCkgbWF5IGJlIHVzZWQgdG8g
Y2hlY2sgd2hldGhlciB5b3UgY2FuIHRlc3QNCj4gaWYNCj4gYSBkZXZpY2UgaXMgYXNzaWduZWQu
IEluIHRoaXMgY2FzZSwgdGhlIGRvbWFpbiB3aWxsIGJlIE5VTEwuDQo+IA0KPiBIb3dldmVyLCBm
bGFza19pb21tdV9yZXNvdXJjZV91c2VfcGVybSgpIHdpbGwgYmUgY2FsbGVkIGFuZCBtYXkgZW5k
DQo+IHVwDQo+IHRvIGRlZmVyZW5jZSBhIE5VTEwgcG9pbnRlci4gVGhpcyBjYW4gYmUgcHJldmVu
dGVkIGJ5IG1vdmluZyB0aGUgY2FsbA0KPiBhZnRlciB3ZSBjaGVjayB0aGUgdmFsaWRpdHkgZm9y
IHRoZSBkb21haW4gcG9pbnRlci4NCj4gDQo+IENvdmVyaXR5LUlEOiAxNDg2NzQxDQoNClRoZSBj
b3JyZWN0IENJRCBpcyAxNDg2NzQyDQoNCj4gRml4ZXM6IDcxZTYxN2E2YjggKCd1c2UgaXNfaW9t
bXVfZW5hYmxlZCgpIHdoZXJlIGFwcHJvcHJpYXRlLi4uJykNCj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDwNCj4ganVsaWVuLmdyYWxsQGFybS5jb20NCj4gPg0KPiAtLS0NCj4gIHhlbi94
c20vZmxhc2svaG9va3MuYyB8IDggKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL3hzbS9mbGFz
ay9ob29rcy5jIGIveGVuL3hzbS9mbGFzay9ob29rcy5jDQo+IGluZGV4IDNiMzA4Mjc3NjQuLmNm
N2YyNWNkYTIgMTAwNjQ0DQo+IC0tLSBhL3hlbi94c20vZmxhc2svaG9va3MuYw0KPiArKysgYi94
ZW4veHNtL2ZsYXNrL2hvb2tzLmMNCj4gQEAgLTEyOTYsMTEgKzEyOTYsMTMgQEAgc3RhdGljIGlu
dCBmbGFza19hc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4NCj4gKmQsIHVpbnQzMl90IG1hY2hp
bmVfYmRmKQ0KPiAgICAgIHUzMiBkc2lkLCByc2lkOw0KPiAgICAgIGludCByYyA9IC1FUEVSTTsN
Cj4gICAgICBzdHJ1Y3QgYXZjX2F1ZGl0X2RhdGEgYWQ7DQo+IC0gICAgdTMyIGRwZXJtID0gZmxh
c2tfaW9tbXVfcmVzb3VyY2VfdXNlX3Blcm0oZCk7DQo+ICsgICAgdTMyIGRwZXJtOw0KPiAgDQo+
ICAgICAgaWYgKCAhZCApDQo+ICAgICAgICAgIHJldHVybiBmbGFza190ZXN0X2Fzc2lnbl9kZXZp
Y2UobWFjaGluZV9iZGYpOw0KPiAgDQo+ICsgICAgZHBlcm0gPSBmbGFza19pb21tdV9yZXNvdXJj
ZV91c2VfcGVybShkKTsNCj4gKw0KPiAgICAgIHJjID0gY3VycmVudF9oYXNfcGVybShkLCBTRUND
TEFTU19SRVNPVVJDRSwgUkVTT1VSQ0VfX0FERCk7DQo+ICAgICAgaWYgKCByYyApDQo+ICAgICAg
ICAgIHJldHVybiByYzsNCj4gQEAgLTEzNTUsMTEgKzEzNTcsMTMgQEAgc3RhdGljIGludCBmbGFz
a19hc3NpZ25fZHRkZXZpY2Uoc3RydWN0DQo+IGRvbWFpbiAqZCwgY29uc3QgY2hhciAqZHRwYXRo
KQ0KPiAgICAgIHUzMiBkc2lkLCByc2lkOw0KPiAgICAgIGludCByYyA9IC1FUEVSTTsNCj4gICAg
ICBzdHJ1Y3QgYXZjX2F1ZGl0X2RhdGEgYWQ7DQo+IC0gICAgdTMyIGRwZXJtID0gZmxhc2tfaW9t
bXVfcmVzb3VyY2VfdXNlX3Blcm0oZCk7DQo+ICsgICAgdTMyIGRwZXJtOw0KPiAgDQo+ICAgICAg
aWYgKCAhZCApDQo+ICAgICAgICAgIHJldHVybiBmbGFza190ZXN0X2Fzc2lnbl9kdGRldmljZShk
dHBhdGgpOw0KPiAgDQo+ICsgICAgZHBlcm0gPSBmbGFza19pb21tdV9yZXNvdXJjZV91c2VfcGVy
bShkKTsNCj4gKw0KPiAgICAgIHJjID0gY3VycmVudF9oYXNfcGVybShkLCBTRUNDTEFTU19SRVNP
VVJDRSwgUkVTT1VSQ0VfX0FERCk7DQo+ICAgICAgaWYgKCByYyApDQo+ICAgICAgICAgIHJldHVy
biByYzsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
