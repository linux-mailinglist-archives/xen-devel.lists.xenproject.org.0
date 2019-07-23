Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BACC71011
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 05:26:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hplMe-0003OU-Vk; Tue, 23 Jul 2019 03:21:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=d8q6=VU=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1hplMd-0003OP-1S
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 03:21:19 +0000
X-Inumbo-ID: ee8d39f8-acf8-11e9-8980-bc764e045a96
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.45]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ee8d39f8-acf8-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 03:21:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZVaJsqzo88iM2eDvG/Z903pmCfBZjbHBQ4kyPZAy1IFyHxq9svIeOiSFYqSEjONxfOW60c6qWhgnJtL/HITcVdhKu+bDABLY9PvuinYP5Hhm0LRvoQT+SPhHIgtWvL2AOVqsGFBkO/fgam/L1Dy57BNbP/I4K9TElCUrbBfjvZq2vwrB+C1lIMi4QZ5/TXhdgI2G6kUP8Ca8RoxxlqWNGH8p3wNSSSNYX9synywOl1Gz6dRTu+82Nx9McbUMWyE5DMbEz+6DV5zCs+l0FgtALoUiBHrl89PZwwDb3ShU2Xh8wRIsOruHLGr73x9sJE4rb3Wfy1yu4LZNkiSyH9sRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5nGytv3kdNJiFIuhNlujKN5XwzFGqOxaWwABV1NKGg=;
 b=Y8r3Vez6z3T+If6LjgjWn1jQfU2+XVDIBpZOYC5/QvQKobz84BIbyyDOvLyCxLQgJ6WCntZSI+gVu4iF4f0eZPTvCMNJSIbhX4ACY7U3eKcQ3vAaDwOV68tWRzyOTU8fYQ7Dk6+8AKN+CfHwWcw0kcMur8sRhDrjp91TnDVKwF72fAupETROR2HGjwcJrJyJb4Wfa+wlHzGsRbXBJM2pGNoDAIeUYXAwgaRt55/QV+MU2rwk+AaIet0r1NKlcDMYwyAsytUTK6UgZe1KGK6Jqinfs0Q0OCmf5pbk0s+CJuYdjRSgQVRvwMUjnY0d8iHVvFfFUIdlI6EDtg300O0rSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5nGytv3kdNJiFIuhNlujKN5XwzFGqOxaWwABV1NKGg=;
 b=LR5HkCzgvCPYCpDfGDYuuJVMfQYa7c9y/pFkICMWDcGOGkNEOkAaqunvgGfCA42l6NHa0iekVbxWcAnkuIlUSBl4SKPfguWZO4pOrvplD0hq0IK7NgFn8aZvSarZMtu1sWf1dQgkrzcfuq4W7StikTeDGt6yhuJ1fUFlqNYUeQM=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6180.eurprd04.prod.outlook.com (20.179.34.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 03:21:15 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::2023:c0e5:8a63:2e47]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::2023:c0e5:8a63:2e47%5]) with mapi id 15.20.2094.011; Tue, 23 Jul 2019
 03:21:15 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>
Thread-Topic: [PATCH] arm: xen: mm: use __GPF_DMA32 for arm64
Thread-Index: AQHVNi9zmpVhxJk2Z0aPUBEkePn3c6bXnoow
Date: Tue, 23 Jul 2019 03:21:14 +0000
Message-ID: <AM0PR04MB448135E1B2C85F0B6029F7B788C70@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190709083729.11135-1-peng.fan@nxp.com>
In-Reply-To: <20190709083729.11135-1-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 152973be-7733-439d-1e08-08d70f1cd1d5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB6180; 
x-ms-traffictypediagnostic: AM0PR04MB6180:
x-microsoft-antispam-prvs: <AM0PR04MB61800FE73A361336A4F293AF88C70@AM0PR04MB6180.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:269;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(189003)(199004)(305945005)(81166006)(81156014)(256004)(66556008)(7736002)(11346002)(66946007)(66066001)(6246003)(76116006)(66476007)(14444005)(446003)(68736007)(64756008)(66446008)(52536014)(110136005)(53936002)(476003)(102836004)(8676002)(44832011)(54906003)(26005)(4326008)(316002)(74316002)(3846002)(6436002)(55016002)(99286004)(9686003)(486006)(33656002)(6506007)(2906002)(229853002)(2501003)(186003)(478600001)(6116002)(71200400001)(71190400001)(86362001)(25786009)(7696005)(8936002)(4744005)(5660300002)(14454004)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB6180;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kDMnPc205CvPN4goqtK999cwRilrCnJARJkva0xS6wRGnpwPZ01t4w2MBN6hkyvv6Sua6ju3Qxx38m5YNTJ9kaWaFwxa4FtcQtsbRE+ZbKXK4W3Mi6ea3bkkmXdbz9MPO4pTIk6d4ptPJC7Em0E2deWbpnDjxqTeMyDW8r7CCUKVHG3TSRztko50zoIS/Clc+R5SVJfIIyFqx1NWE9Qp3k5nl+vgMez6ubVNOZam5MrNVBHgGkQGvANZYNTAsqXjK/BVKOHEeioyluEYBze+JQjN+cMZqc7SxY+x7T5zp2f4edUGe/b754aZAcTYfP94HqG7TWyLbicRiudlxgNo+Aq5fkoNxWmiDnp5Dna4nW5vjWzW+EriuTMue2LRx8RpYsHg4LSe90ciNLTNM+/cXOlSvPJm4V/hwrDNO+BgKdQ=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 152973be-7733-439d-1e08-08d70f1cd1d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 03:21:14.9041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peng.fan@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6180
Subject: Re: [Xen-devel] [PATCH] arm: xen: mm: use __GPF_DMA32 for arm64
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
Cc: "van.freenix@gmail.com" <van.freenix@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUnVzc2VsbCwgU3RlZmFubwoKPiBTdWJqZWN0OiBbUEFUQ0hdIGFybTogeGVuOiBtbTogdXNl
IF9fR1BGX0RNQTMyIGZvciBhcm02NAoKQW55IGNvbW1lbnRzPwoKPiAKPiBhcm02NCBzaGFyZXMg
c29tZSBjb2RlIHVuZGVyIGFyY2gvYXJtL3hlbiwgaW5jbHVkaW5nIG1tLmMuCj4gSG93ZXZlciBa
T05FX0RNQSBpcyByZW1vdmVkIGJ5IGNvbW1pdAo+IGFkNjdmNWE2NTQ1KCJhcm02NDogcmVwbGFj
ZSBaT05FX0RNQSB3aXRoIFpPTkVfRE1BMzIiKS4KPiBTbyB0byBBUk02NCwgbmVlZCB1c2UgX19H
RlBfRE1BMzIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+
Cj4gLS0tCj4gIGFyY2gvYXJtL3hlbi9tbS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0veGVu
L21tLmMgYi9hcmNoL2FybS94ZW4vbW0uYyBpbmRleAo+IGUxZDQ0YjkwM2RmYy4uYTk1ZTc2ZDE4
YmY5IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL3hlbi9tbS5jCj4gKysrIGIvYXJjaC9hcm0veGVu
L21tLmMKPiBAQCAtMjcsNyArMjcsNyBAQCB1bnNpZ25lZCBsb25nIHhlbl9nZXRfc3dpb3RsYl9m
cmVlX3BhZ2VzKHVuc2lnbmVkIGludAo+IG9yZGVyKQo+IAo+ICAJZm9yX2VhY2hfbWVtYmxvY2so
bWVtb3J5LCByZWcpIHsKPiAgCQlpZiAocmVnLT5iYXNlIDwgKHBoeXNfYWRkcl90KTB4ZmZmZmZm
ZmYpIHsKPiAtCQkJZmxhZ3MgfD0gX19HRlBfRE1BOwo+ICsJCQlmbGFncyB8PSBfX0dGUF9ETUEg
fCBfX0dGUF9ETUEzMjsKPiAgCQkJYnJlYWs7Cj4gIAkJfQo+ICAJfQoKVGhhbmtzLApQZW5nLgoK
PiAtLQo+IDIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
