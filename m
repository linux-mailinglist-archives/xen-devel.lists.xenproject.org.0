Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C06E76A7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 17:38:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP7zH-0007gi-7k; Mon, 28 Oct 2019 16:35:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uCov=YV=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1iP7zE-0007gd-VB
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 16:35:21 +0000
X-Inumbo-ID: eda9a376-f9a0-11e9-beca-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::711])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eda9a376-f9a0-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 16:35:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbLjkKVqdgFKzjJBX+oFXmxzqLndwNNw5EHMnAVqRf1P/+yz/YjtmDtglSNYTnDROEQ4PZioXqpX0llqpQil6pNlM43mEkkq0k4CKt4PCY7D8l7UUPpssuSpGp0RbBNdO++DeNCrKOMgAJTNBpCFs9yZeHiArYmdO4PLP0xGpTr3MC0cSOmtuBtSJxIwTc83PmCq5RQg/XeNfCQMi0Sj0xoGwGfz+WxoqsycQidUkB3pbIOfq4+aeDh+uy1vrtsJPEoWl1DYyqE6Nuw9MqewdR7KkWZe2gqYQ+YZG1msIWaJK+VKFg72P2I8usCQaVdVC9MikGfrnqlnXP1MePwldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpGv6mdGvdk0+IueRr32B/WG6xG5rDXytQQusiUZwWc=;
 b=dSR7Fao2DlGiGQGEXyjZGJFOLeAkcknq9ZPnG6D4Ap6l7MetcSrc/DTMI6DtLMajNcDVONYSiDYfsr6yMJRZLUMHNgDou6XE/RWxZ4itAunqEYGqCh41jSMUWCcYoo/wqqxW//SGiqBigKsxyIIH9HZqWCg1hbNQca+paLZMZMcGisWSECVg5x1HueXMImCfLv5NSR/Ln2qtbt6N27Q6ZrHFCVI6iiY/yiEnmsnfwUc4deJQp1RJLl2hGwkAOkdV8NNCVPQ4e4l40vTXiI7ZuUOaePiq8HTWP+erd8LGfbQUJXy+a4V6oJ5iV0qRold19vRKhtfX87pag/1z8NkLmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpGv6mdGvdk0+IueRr32B/WG6xG5rDXytQQusiUZwWc=;
 b=pU4H7heYNj/jRAuVnQspN6vCjtXlpR38L9yu3Z3SIRNvWHcBmhkJMP6depRfPnnX8ly8nSn1LbYZlLhESOYwmEYM/xW1E/KqdivefO5QiIeqLohmMvnXkVE5Za9kS8FhvIAcZIVFBi+qqJ3QAYy2KLU0wP4I14I/sp/2vKd/3uk=
Received: from AM0PR02MB3588.eurprd02.prod.outlook.com (52.134.80.158) by
 AM0PR02MB3682.eurprd02.prod.outlook.com (52.134.84.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.25; Mon, 28 Oct 2019 16:35:17 +0000
Received: from AM0PR02MB3588.eurprd02.prod.outlook.com
 ([fe80::e057:4bef:9f31:564c]) by AM0PR02MB3588.eurprd02.prod.outlook.com
 ([fe80::e057:4bef:9f31:564c%6]) with mapi id 15.20.2387.019; Mon, 28 Oct 2019
 16:35:17 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] tools/ocaml: Fix build error with Arch Linux
Thread-Index: AQHVi4r/yq+iTymeDUGBC/exKCe9UadwIiuAgAAiGYA=
Date: Mon, 28 Oct 2019 16:35:17 +0000
Message-ID: <a8f47de0e22ba6b013aea6b59adba6729730ff4e.camel@bitdefender.com>
References: <a9c29042189f2f862ffc0ad9af732afb254bbb83.1572045542.git.ppircalabu@bitdefender.com>
 <20191028143313.GA1162@perard.uk.xensource.com>
In-Reply-To: <20191028143313.GA1162@perard.uk.xensource.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0068.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::45) To AM0PR02MB3588.eurprd02.prod.outlook.com
 (2603:10a6:208:42::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 795eb2e5-83d7-484d-a27a-08d75bc4d0f1
x-ms-traffictypediagnostic: AM0PR02MB3682:|AM0PR02MB3682:|AM0PR02MB3682:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR02MB368232E24CCF9907F161326CD6660@AM0PR02MB3682.eurprd02.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(39860400002)(396003)(376002)(366004)(189003)(51914003)(199004)(71200400001)(966005)(4326008)(6436002)(66946007)(66476007)(66556008)(64756008)(66446008)(6246003)(486006)(71190400001)(86362001)(8936002)(81156014)(81166006)(102836004)(76176011)(8676002)(229853002)(118296001)(6486002)(26005)(186003)(6506007)(5660300002)(386003)(66574012)(4001150100001)(11346002)(2906002)(446003)(3846002)(54906003)(25786009)(316002)(14454004)(6306002)(256004)(50226002)(99286004)(305945005)(52116002)(66066001)(6512007)(478600001)(36756003)(2616005)(6916009)(476003)(7736002)(6116002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3682;
 H:AM0PR02MB3588.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ktOhKyasUBr6o8WjKq189INAXNvpDppbov4wbENe88RK3aQ4/tlR9nTMxNBwDzz25m81JpVHPPi7srZrsGYurLMNufokMAsVx9AuXJ0o6zCNNsgqMCpll0cHu595L4oGg8ApADk3DpBmOT0oYHdMy8IY2xwQ1GALcaP9MJpLwf4UhLgAmvoio41YReW7xQd1p+3k2/ubzkJ5zlKi/SHKD5j3YdK5JU/hwq7skFcVkOFPQn2ALa+i+PmFqwR2HEbDz7pFZx2PtqzsMWJ3F6OW2ETXvtVirz2pYYRBoyZedZnC2tJBhUh+EiHhfUMddL1Pl6hcSbWULY5xy4ecvMpfflXzVLE0WjQw2RXUW9FQPAz/6jsLZw7HTCtQCYwPONTmllHOHq9Q8GA6ro9qR7hmIXIuDTb2m/AzrAKgsa/zFIinl3uxB4Ik1z95ze2JmeYhL9GO+aFtfKwnvsj+eelC+IcW2QKxrzvKp7CshPUOkBM=
Content-ID: <5522B806918BBB4B80C2E6A63D1AB013@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795eb2e5-83d7-484d-a27a-08d75bc4d0f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 16:35:17.5097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Obn0eAgR7+Sh3eIhpN/30TGbXBjlyIX+4b74wCzdx+z5aOXifWIrcKKty0MAlPydPB3lSWTTiF+wGNmeTgDspV+Q+B77wo5L3kYAojIdD8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3682
Subject: Re: [Xen-devel] [PATCH] tools/ocaml: Fix build error with Arch Linux
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDE5LTEwLTI4IGF0IDE0OjMzICswMDAwLCBBbnRob255IFBFUkFSRCB3cm90ZToN
Cj4gT24gU2F0LCBPY3QgMjYsIDIwMTkgYXQgMDI6MjE6MTBBTSArMDMwMCwgUGV0cmUgUGlyY2Fs
YWJ1IHdyb3RlOg0KPiA+IGdjYyAoR0NDKSA5LjIuMCBjb21wbGFpbnM6DQo+ID4gDQo+ID4geGVu
dG9vbGxvZ19zdHVicy5jOiBJbiBmdW5jdGlvbiDigJhzdHViX3h0bF9vY2FtbF92bWVzc2FnZeKA
mToNCj4gPiB4ZW50b29sbG9nX3N0dWJzLmM6OTM6MTY6IGVycm9yOiBpbml0aWFsaXphdGlvbiBk
aXNjYXJkcyDigJhjb25zdOKAmQ0KPiA+IHF1YWxpZmllciBmcm9tIHBvaW50ZXIgdGFyZ2V0IHR5
cGUgWy1XZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNdDQo+ID4gICAgOTMgfCAgdmFsdWUgKmZ1
bmMgPSBjYW1sX25hbWVkX3ZhbHVlKHh0bC0+dm1lc3NhZ2VfY2IpIDsNCj4gPiAgICAgICB8ICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4NCj4gDQo+IEhpIFBldHJlLA0KPiANCj4gVGhh
bmtzIGZvciB0aGUgcGF0Y2gsIGl0IGxvb2tzIGZpbmUuIEhvd2V2ZXIgaXQgd291bGQgYmUgbmlj
ZSB0byBhZGQNCj4gc29tZSBtb3JlIGNvbnRleHQgb24gd2h5IGdjYyBjb21wbGFpbnMuIEEgcXVp
Y2sgc2VhcmNoIHNlZW1zIHRvIGxlYWQNCj4gdG8NCj4gDQpodHRwczovL2dpdGh1Yi5jb20vb2Nh
bWwvb2NhbWwvY29tbWl0LzRmMDNhMTQ2N2QyOWNmNTg3ZGY1YTE5MTgzMGYxNTI1NTA2ZWUwZTMN
Cj4gICAgICJNYWtlIGNhbWxfbmFtZWRfdmFsdWUgcmV0dXJuIGEgY29uc3QgdmFsdWUqIg0KPiB3
aGljaCBjaGFuZ2UgdGhlIHByb3RvdHlwZSBvZiBjYW1sX25hbWVkX3ZhbHVlLg0KPiANCj4gV2l0
aCB0aGUgY29tbWl0IG1lc3NhZ2UgY2hhbmdlZDoNCj4gUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPiANCj4gQ0MgSsO8cmdlbiwgSSB0aGlu
ayBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgdGhlIGJ1aWxkIGZpeCBpbiB0aGUNCj4gcmVsZWFz
ZS4NCj4gDQo+IENoZWVycy4NCj4gDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgaW5w
dXQuIEkgd2lsbCBtb2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdlDQphbmQgc2VuZCBhIHYyIHZlcnNp
b24gb2YgdGhpcyBwYXRjaC4NCg0KQmVzdCByZWdhcmRzLA0KUGV0cmUNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
