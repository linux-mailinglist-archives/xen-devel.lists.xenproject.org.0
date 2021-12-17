Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E49478DBB
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 15:23:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248671.428915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myE8c-0000O4-4g; Fri, 17 Dec 2021 14:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248671.428915; Fri, 17 Dec 2021 14:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myE8c-0000Ln-19; Fri, 17 Dec 2021 14:23:10 +0000
Received: by outflank-mailman (input) for mailman id 248671;
 Fri, 17 Dec 2021 14:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vth8=RC=dornerworks.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1myE8a-0000Lf-Es
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 14:23:08 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0616.outbound.protection.office365.us
 [2001:489a:2202:c::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d818a67c-5f44-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 15:23:05 +0100 (CET)
Received: from BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:40b::16)
 by BN3P110MB0561.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:40c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 14:22:58 +0000
Received: from BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM
 ([fe80::44b1:45a8:f0a5:d0f8]) by BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM
 ([fe80::44b1:45a8:f0a5:d0f8%12]) with mapi id 15.20.4801.016; Fri, 17 Dec
 2021 14:22:58 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d818a67c-5f44-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=xCIw4X7qfAJ2q57Nu6MDtrZmHoBJjX0lZhVUVyNLPjtRq3g1a8thLKNj84O3as6CFlOy0qRpNFMbKk6ilg9MleLy6CgFsKEnfDndFmQO8AlW0YwMbizCidB7BLXtrEUnJoOT1F48v+gZ6Z2qTqDFYyr27MKO1gVegl350ePmv4dSA1OMWDmPZrK18Ldz+TuyuIZ+hKjzaC1IarstE6lApwZND7Q9hYPF8d/ZN2f6rI/nrvBd02PJAvn/V+YGoJ9VCKFJ3wGI8O1Ub2g3I0LXggaEz7XjRp6fLUwJOEIIPTCwgbXIOljKJ8poQrf9+o1JbETnehD1uc1QSML2SJBnEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyW97FmFoVTbqLxXSjICLh3aCDNqjYKKaaYNC4zMmBI=;
 b=BYejgBtqjhMrEmcysiANmzDpS0swDJxp/oOwBo/0wZR1NHdBbi+nM3yoQcr/yQgVCfuMB8+iMiy6clYWQxNhGUC1tlmL1NUZY9JsvG0oy5lgBuqkre2k88Ypp+0+2g+hjCCb4oMNaaJHdgZf3YgUwhglsdmzG011epp/p/Vj9pwUzydDNoXT7o91Q6QD7c9DzFA6Sdv/7SPwzK+6NHOswzCnMcpQjm01JfU0rjd2GN2KKfCKhlX15s2tLCP7bmSDSn/LAq8GeVq9gJfVgn4+NDH5Up8EyCc0z+8fUa+Xd0vKH9rB3nEanNMT0I8EI9XxTK+ITAljgbA2N5HUbeYHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyW97FmFoVTbqLxXSjICLh3aCDNqjYKKaaYNC4zMmBI=;
 b=lzjviGlX4SDz3RWW0Qol01lgqXAf6cTXL+I4TUoVa+BlQb33N+Gj9WlbEjgqN24FHuXvi0MW2CUSjCfVyZt0xZpgkjKUGSUie37YH/RYOG2p+cZ6ZQJ5wCuPdmusgAuEskdkl2EUPPthpgHtqsV74vT6ZgcoIp4ZyNowZ8TmjSNE4lo7r2I+C4sQ6WbOPHINLxIb52JUJYv9DVLlHPSxGLslQGH17VNSrNmZqTQtBdcUXrO113h1Qdz+kfSm/g0lC7GAEY3H91JW+z+b6WQaasDKGPKhcQdrRslgpCzxblKYp+HCuEY5kHMs2T0BDSg9vTDxdnonUtC3azoE16JCSg==
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Andrew Cooper <amc96@srcf.net>, Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "joshua.c.whitehead@gmail.com"
	<joshua.c.whitehead@gmail.com>
Subject: RE: [PATCH] MAINTAINERS: remove Josh from ARINC 653 maintainers
Thread-Topic: [PATCH] MAINTAINERS: remove Josh from ARINC 653 maintainers
Thread-Index: AQHX36vD17guMUdgIUiaApgKD9n8y6wPng8AgAADJpCAJ0GvgIAAAGSg
Date: Fri, 17 Dec 2021 14:22:58 +0000
Message-ID:
 <BN3P110MB04842B6455384AC2C2D5524F8C789@BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM>
References: <20211122141742.3075-1-stewart.hildebrand@dornerworks.com>
 <c0228394-2dfe-717d-e35e-7120621df27f@suse.com>
 <BN3P110MB0484716C62279B1525F351E88C9F9@BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM>
 <b49a9f16-a556-723f-5ec5-0642f919b7f1@srcf.net>
In-Reply-To: <b49a9f16-a556-723f-5ec5-0642f919b7f1@srcf.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7831d3c4-70ac-4b5e-fcd4-08d9c168b9cd
x-ms-traffictypediagnostic: BN3P110MB0561:
x-microsoft-antispam-prvs:
 <BN3P110MB0561807F8ABB0EC60814E6188C789@BN3P110MB0561.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CnPSexTLR2DwcsmtoeMIkH5W9WEm9H2tnCjztC0H5s8N2Ozzx4FXOeB5LNyvMdIKmSCWOXn7/C1w2c18PitImFxsQzs49lfR+ndns3zksj1VPog1umP/v6PhTxhCFiHsHlRf+0h0Maj0VODoi0YYh7sKK1tRgNl33QOwKBWJ5IUnXJRiFDXspdfULigqoiIvE3kf1VMEAsYLs/h9PoooFKQ3lovKsIq1Agp7FYLtdo6sEd4I5/3FLmAh2nBA+BY0RMJKZ2dpeLDy72bY4lYZZQ70pOKdpVEKrC3ZxSuzCtKhKOWWfUnzfk21jZk0nNJ9wOhfWu2FW3jYF6hdFJuXlbvGBj8dhooP0qSFyPoxWlvVHlTQ0FYwEyCSu8kmHkT6LoR+RRBsaQTUYmBDMxQOm/mC5OxsTK9IUGwTclu3+zW2CuGaY4ESamHNMi3SFWJKJMSgzxS8X9EaGQKZ4QGM3fkyAqRgLNz3ozhQCbDf59ZJtbJU5FG0pAuM4nP3CTzGVCOKhYSwV8Q6YSremHhqDcvThQPnnNqOhl3lxB0UXvMiiNCb536B7urR8kNg6PIp59Xj++EmPNAM32vw9wHwqGdhz8gdeoygzSjt1YK+WmCHGjh1aeoxQBEGkUhdHehz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39830400003)(136003)(346002)(396003)(33656002)(55016003)(66476007)(7416002)(76116006)(186003)(52536014)(7696005)(54906003)(2906002)(86362001)(316002)(83380400001)(110136005)(38070700005)(66946007)(8676002)(38100700002)(6506007)(9686003)(66556008)(66446008)(122000001)(8936002)(4326008)(53546011)(64756008)(5660300002)(71200400001)(4744005)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 vf+dZmNQPc0PSzW3wfgV/mn69dxKuPjL7riKehNyXboiOGHPetasLE0rc/4f7CEFgrFq+L4vA3Kb9rIkETAmWm4BIcKjAeKMmC+1zMnKrt9mj7RnKVQjriB5tz92czo4s/yDrQCKpnYB+Flu+NMwErrpibmtKuEa5rDQBTmNn9nPIwJ/htTrTY5KjKQMeS1b2na6K/MYDB5tvX/MrEKsWw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7831d3c4-70ac-4b5e-fcd4-08d9c168b9cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 14:22:58.5023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3P110MB0561

T24gRnJpZGF5LCBEZWNlbWJlciAxNywgMjAyMSA5OjIwIEFNLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Og0KPiBPbiAyMi8xMS8yMDIxIDE0OjU0LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+ID4g
T24gTW9uZGF5LCBOb3ZlbWJlciAyMiwgMjAyMSA5OjM5IEFNLCBGcm9tOiBKYW4gQmV1bGljaCB3
cm90ZToNCj4gPj4gT24gMjIuMTEuMjAyMSAxNToxNywgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3Rl
Og0KPiA+Pj4gSm9zaCB3b3JrcyBhdCBhbm90aGVyIGNvbXBhbnkgbm93DQo+ID4+IFlvdSBkb24n
dCBoYXBwZW4gdG8ga25vdyBoaXMgZW1haWwgdGhlcmUsIGRvIHlvdT8gRWxzZSBpZiB3b3VsZCBo
YXZlDQo+ID4+IGJlZW4gZ29vZCB0byBDYyBoaW0gc28gaGUgY291bGQgY29uZmlybS4NCj4gPj4N
Cj4gPj4gSmFuDQo+ID4gSSBhZGRlZCBKb3NoIGluIENDLiBKb3NoIC0gd2lsbCB5b3UgY29uZmly
bT8NCj4gDQo+IEdpdmVuIHRoZSByZXF1ZXN0IHdhcyBtYWRlIGJ5IGFuIGV4aXN0aW5nIG1haW50
YWluZXIgYW5kIHRoZXJlJ3MgYmVlbiBubw0KPiByZXBseSBmb3IgYWxtb3N0IGEgbW9udGgsIEkn
bSBnb2luZyB0byBjb21taXQgdGhpcyBwYXRjaCBub3cuDQoNClRoYW5rIHlvdSwgdGhvdWdoIGl0
IGFwcGVhcnMgdGhlIHBhdGNoIHdhcyBhbHJlYWR5IGNvbW1pdHRlZC4NCg0KU3Rldw0K

