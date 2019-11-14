Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694DEFC214
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 10:07:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVB3c-0001O4-2c; Thu, 14 Nov 2019 09:04:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I2Ck=ZG=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1iVB3a-0001Nz-MM
 for xen-devel@lists.xen.org; Thu, 14 Nov 2019 09:04:50 +0000
X-Inumbo-ID: ced978c0-06bd-11ea-9631-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.79]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ced978c0-06bd-11ea-9631-bc764e2007e4;
 Thu, 14 Nov 2019 09:04:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYULi6G+nhH49o1zngb+xYbHbTZKo5zIrfkR/ZfZMW11sAytTcOp9VHeudZIhoNXNjmlFBv2Z7wprVJI8c9u/1ePcf5+o9dmzx7oL/nJiFz8ktNo6UP0UPBmQE8cT2lrf2Z6exzKQOpwznnfQoVwD02ZriMiAIaCbC9VVpaj7zom3ozjg+/Q1BUSYJ304eWmDhryOXNNOlZ8JmRZ6oYsyN1VeYvCJgIrgrHGTD82z9KcRchjUe8a+9hkUkwslpT+7pztRtgRIchq9/wVWEnAhGclcNDAuT82jgW7L7DYocaQyoRedkKX/ogn8Z9eOqTXeppgC1n3c99h3VLpOCZSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XY83o0sCXN+qJ3n1TGBgvSYhZvBucVKnYhozti7PVCE=;
 b=AwTpNS0IZ7tfo2crcdzk2Igov3TIcU8S+XLAYj0gf10LAvxxH/cQYevnbgCNn0GyMRfG+OrfNuiw+zGM51eSGKQAnQLwMtwR1ozwaCVp15SLOTTJnQ88DlzRm+YCKXYC0r+vwLikq+hXokfu8g0qJH3S1nSXSG90UR2Ty4CT6khgAAWz2vmFsPqVbYXU40NyKbDkG5JIW8gA632by5G6uWSreDGr1zkeTFJPN44vFcGGpt6QTnKaCLf68hce3d4rysZv7OLsFS9n9Xlx/sw/nye5TIRXc1SivuEPAUD/98JPLxhcnxpVuTAAUPeS3R0/+3uhFRRo4LKDt0i7b6vslg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XY83o0sCXN+qJ3n1TGBgvSYhZvBucVKnYhozti7PVCE=;
 b=mB4Bd3ojdw+NcyEL8gI1P42jjOo2a3i4P29TFd6j9Ilga11ByQlWWZUGFqzNouCV8zj/0WI+//RIwVUyRJSeeGVN0SUPvjojNqGOUhrV3uC1XVVmAE00HZDQriX0t1fcbb5zqCqt+JrOVgfD8xxj547v8vZreOGziII7Z1ZSGLc=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5506.eurprd04.prod.outlook.com (20.178.115.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Thu, 14 Nov 2019 09:04:46 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2451.024; Thu, 14 Nov 2019
 09:04:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Julien Grall <julien.grall@gmail.com>
Thread-Topic: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
Thread-Index: AQHVlRomdHS3ryIcQEao8h2tiDDndaeBqioAgAA3t4CABRoj4IADS4aAgAAitTA=
Date: Thu, 14 Nov 2019 09:04:45 +0000
Message-ID: <AM0PR04MB4481F5B12F00A9DBDF6AC3C388710@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20191107033709.17575-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
 <AM0PR04MB44811934638A8DFF51B6B95788770@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CAF3u54CC7DBwcWm3E=gyTC6qpyWXM6p2aU_+3CiBuasTMk9UBQ@mail.gmail.com>
In-Reply-To: <CAF3u54CC7DBwcWm3E=gyTC6qpyWXM6p2aU_+3CiBuasTMk9UBQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [49.72.5.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 145d2ea6-a25b-414a-a123-08d768e1b216
x-ms-traffictypediagnostic: AM0PR04MB5506:
x-microsoft-antispam-prvs: <AM0PR04MB55063E26CE0438944D80E71C88710@AM0PR04MB5506.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:48;
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(376002)(39850400004)(136003)(189003)(199004)(76176011)(305945005)(256004)(478600001)(14444005)(486006)(76116006)(186003)(7736002)(52536014)(66066001)(45080400002)(25786009)(3846002)(229853002)(102836004)(6116002)(7696005)(74316002)(26005)(11346002)(446003)(5024004)(316002)(54906003)(14454004)(6506007)(99286004)(71190400001)(8676002)(476003)(71200400001)(2906002)(81156014)(8936002)(6916009)(33656002)(81166006)(66556008)(64756008)(66946007)(66476007)(6246003)(66446008)(4326008)(5660300002)(6436002)(86362001)(9686003)(55016002)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5506;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S8JJKa9OYrs7Xwzx3gHQ1uMLJSmAEu5LerC1ioBQZEGLmwTP/0whPXOdEGu82XoVJ0XDswNrG1iFewDzVowPnLGkOmfcnr6zh9K9Of0Qh18lKJDTcxDaB1YeDSX91cXu1sYMbbZm0MSS3/SiAFAwOD/ue3GaSfYHkfln/ZZeNJbj5hMkGsORBzoCCmMFGz/j9LPJ95gRPD4GPfw9FwiM36uIitGCCjgWrYviJ6uoQfcrvC48liL5Cjw7aBAgkEw2xtUDjQxBvRE+hEnVckGkoGIt7Eeb9URef6b4kbu6b/lle2LSpdIMeQScNoa+BLi8zqHYfdkJFJMHozEKdo2PqDqBzJNbSlgpeJygjomMSPNc/NiDvJdmrBBIIhHFkOPZ6Nspz/Lkv13tm2Wj8kF1P9Bl4qWp9lo6XQEN2E7PVrKeq0LD4RyJUPUDZSxRZO1N
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 145d2ea6-a25b-414a-a123-08d768e1b216
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 09:04:46.0412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AtMrCJ9/R17Fkp+fQCIYun6YjZzGWeIwGcWpWj9ksMlrTRJFjlIqIQysYjozoTcL6gXb6nBp5+Xe6LlfD5H1xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5506
Subject: Re: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 julien grall <julien.grall.oss@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IERvIHlvdSBoYXZlIGEgY2FsbCBzdGFjayB0cmFjZSBmb3IgdGhpcz8NCg0KKFhFTikgZDB2
MTogdkdJQ0Q6IHVuaGFuZGxlZCByZWFkIHIxIG9mZnNldCAweDAwMDMyNA0KKFhFTikgdHJhcHMu
YzoxOTk0OmQwdjEgSFNSPTB4OTM4MTAwMDYgcGM9MHhmZmZmODAwMDEwNGYyYmI0IGd2YT0weGZm
ZmY4MDAwMTAwMTAzMjQgZ3BhPTB4MDAwMDAwNTFhMDAzMjQNClsgICAgMS43ODA1NjRdIFVuaGFu
ZGxlZCBmYXVsdCBhdCAweGZmZmY4MDAwMTAwMTAzMjQNClsgICAgMS43ODU3NzFdIE1lbSBhYm9y
dCBpbmZvOg0KWyAgICAxLjc4ODg5OV0gICBFU1IgPSAweDk2MDAwMDAwDQpbICAgIDEuNzkyMzIw
XSAgIEVDID0gMHgyNTogREFCVCAoY3VycmVudCBFTCksIElMID0gMzIgYml0cw0KWyAgICAxLjc5
ODE5Nl0gICBTRVQgPSAwLCBGblYgPSAwDQpbICAgIDEuODAxNjE1XSAgIEVBID0gMCwgUzFQVFcg
PSAwDQpbICAgIDEuODA1MTI0XSBEYXRhIGFib3J0IGluZm86DQpbICAgIDEuODA4MzUwXSAgIElT
ViA9IDAsIElTUyA9IDB4MDAwMDAwMDANClsgICAgMS44MTI2MjBdICAgQ00gPSAwLCBXblIgPSAw
DQpbICAgIDEuODE1OTQzXSBzd2FwcGVyIHBndGFibGU6IDRrIHBhZ2VzLCA0OC1iaXQgVkFzLCBw
Z2RwPTAwMDAwMDAwYTE3ZjYwMDANClsgICAgMS44MjMzNDRdIFtmZmZmODAwMDEwMDEwMzI0XSBw
Z2Q9MDAwMDAwMDk1ZmZmZjAwMywgcHVkPTAwMDAwMDA5NWZmZmUwMDMsIHBtZD0wMDAwMDAwOTVm
ZmZkMDAzLCBwdGU9MDBlODAwMDA1MWEwMDcwNw0KWyAgICAxLjgzNTAxNl0gSW50ZXJuYWwgZXJy
b3I6IHR0YnIgYWRkcmVzcyBzaXplIGZhdWx0OiA5NjAwMDAwMCBbIzFdIFBSRUVNUFQgU01QDQpb
ICAgIDEuODQyOTgzXSBNb2R1bGVzIGxpbmtlZCBpbjoNClsgICAgMS44NDY0MDNdIENQVTogMSBQ
SUQ6IDEgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkIDUuNC4wLXJjNS0wMzE5MS1nMjA2NDZm
ODgwMzRhLWRpcnR5ICMxNzc0DQpbICAgIDEuODU1OTgwXSBIYXJkd2FyZSBuYW1lOiBGcmVlc2Nh
bGUgaS5NWDhRTSBNRUsgRE9NMCAoRFQpDQpbICAgIDEuODYyMDU5XSBwc3RhdGU6IGEwMDAwMDg1
IChOekN2IGRhSWYgLVBBTiAtVUFPKQ0KWyAgICAxLjg2NzM3NF0gcGMgOiBnaWNfcGVla19pcnEr
MHg2Yy8weGIwDQpbICAgIDEuODcxNjM4XSBsciA6IGdpY19wZWVrX2lycSsweDI4LzB4YjANClsg
ICAgMS44NzU4OTldIHNwIDogZmZmZjgwMDAxMDAyYmE4MA0KWyAgICAxLjg3OTU5OV0geDI5OiBm
ZmZmODAwMDEwMDJiYTgwIHgyODogMDAwMDAwMDAwMDAwMDAwMA0KWyAgICAxLjg4NTQ4M10geDI3
OiAwMDAwMDAwMDAwMDAwMDAwIHgyNjogZmZmZjgwMDAxMTgwMDUxNA0KWyAgICAxLjg5MTM2OV0g
eDI1OiAwMDAwMDAwMDAwMDAwMDAwIHgyNDogMDAwMDAwMDAwMDAwMDAwMA0KWyAgICAxLjg5NzI0
Nl0geDIzOiBmZmZmMDAwOGRjM2U1NDAwIHgyMjogZmZmZjAwMDhkYzNlNTQ1OA0KWyAgICAxLjkw
MzEyOV0geDIxOiBmZmZmODAwMDExZDc5OGM4IHgyMDogMDAwMDAwMDAwMDAwMDAwMQ0KWyAgICAx
LjkwOTAxMV0geDE5OiBmZmZmODAwMDEwMDJiYjA3IHgxODogMDAwMDAwMDAwMDAwMDAwNA0KWyAg
ICAxLjkxNDg5M10geDE3OiBmZmZmODAwMDExMjI0M2MwIHgxNjogMDAwMDAwMDBkZWFkYmVlZg0K
WyAgICAxLjkyMDc4MF0geDE1OiBmZmZmMDAwOGRjMDFiNDkwIHgxNDogZmZmZjAwMDhkYmNkZTVj
MA0KWyAgICAxLjkyNjY1OF0geDEzOiBmZmZmZmZmZmZmZmZmZjAwIHgxMjogZmZmZmZmZmZmZmZm
ZmZmZg0KWyAgICAxLjkzMjU0MF0geDExOiAwMDAwMDAwMDAwMDAwMDA4IHgxMDogZmZmZmZmZmZm
ZmZmZmZmZg0KWyAgICAxLjkzODQyMl0geDkgOiBjMWMxYzFjMWMxYzFjMWMxIHg4IDogMDAwMDAw
MDAwMDAwMDAwMA0KWyAgICAxLjk0NDMwNF0geDcgOiBmZmZmZmZmZmZmZmZmZmZmIHg2IDogZmZm
ZjAwMDhkYzNlNTQ1OA0KWyAgICAxLjk1MDE4Nl0geDUgOiBmZmZmODAwMDExZDc5OGM4IHg0IDog
MDAwMDAwMDAwMDAwMDAwOA0KWyAgICAxLjk1NjA2OV0geDMgOiAwMDAwMDAwMDAwMDAwMzI0IHgy
IDogZmZmZmZmZmZmZmZmZmQwMw0KWyAgICAxLjk2MTk1MV0geDEgOiBmZmZmODAwMDEwMDEwMzI0
IHgwIDogMDAwMDAwMDAwMDAwMDMwMA0KWyAgICAxLjk2NzgzNV0gQ2FsbCB0cmFjZToNClsgICAg
MS45NzA1ODhdICBnaWNfcGVla19pcnErMHg2Yy8weGIwDQpbICAgIDEuOTc0NDgxXSAgZ2ljX2ly
cV9nZXRfaXJxY2hpcF9zdGF0ZSsweDcwLzB4YTANClsgICAgMS45Nzk2MDddICBfX3N5bmNocm9u
aXplX2hhcmRpcnErMHhkOC8weGUwDQpbICAgIDEuOTg0MzQzXSAgX19mcmVlX2lycSsweDEzYy8w
eDJiOA0KWyAgICAxLjk4ODIzMl0gIGZyZWVfaXJxKzB4MzAvMHg3MA0KWyAgICAxLjk5MTc0OV0g
IGRldm1faXJxX3JlbGVhc2UrMHgxNC8weDIwDQpbICAgIDEuOTk2MDE5XSAgcmVsZWFzZV9ub2Rl
cysweDFiMC8weDIyMA0KWyAgICAyLjAwMDE4OV0gIGRldnJlc19yZWxlYXNlX2FsbCsweDM0LzB4
NTANClsgICAgMi4wMDQ2NTJdICByZWFsbHlfcHJvYmUrMHgxYjgvMHgzMDgNClsgICAgMi4wMDg3
MjhdICBkcml2ZXJfcHJvYmVfZGV2aWNlKzB4NTQvMHhlOA0KWyAgICAyLjAxMzI4MV0gIGRldmlj
ZV9kcml2ZXJfYXR0YWNoKzB4NmMvMHg3OA0KWyAgICAyLjAxNzkyOV0gIF9fZHJpdmVyX2F0dGFj
aCsweDU0LzB4ZDANClsgICAgMi4wMjIxMDZdICBidXNfZm9yX2VhY2hfZGV2KzB4NzAvMHhjMA0K
WyAgICAyLjAyNjM3Ml0gIGRyaXZlcl9hdHRhY2grMHgyMC8weDI4DQpbICAgIDIuMDMwMzU5XSAg
YnVzX2FkZF9kcml2ZXIrMHgxNzgvMHgxZDgNClsgICAgMi4wMzQ2MzBdICBkcml2ZXJfcmVnaXN0
ZXIrMHg2MC8weDExMA0KWyAgICAyLjAzODkwMF0gIF9fcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVy
KzB4NDQvMHg1MA0KWyAgICAyLjA0NDEyMV0gIGZlY19kcml2ZXJfaW5pdCsweDE4LzB4MjANClsg
ICAgMi4wNDgyOTRdICBkb19vbmVfaW5pdGNhbGwrMHg3NC8weDFiMA0KWyAgICAyLjA1MjU2NF0g
IGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4MTk0LzB4MjJjDQpbICAgIDIuMDU3NDAzXSAga2VybmVs
X2luaXQrMHgxMC8weDEwMA0KWyAgICAyLjA2MTI5M10gIHJldF9mcm9tX2ZvcmsrMHgxMC8weDE4
DQpbICAgIDIuMDY1Mjc5XSBDb2RlOiA1MzA1N2M2MyBkMzdlNjg2MyA4YjIwNDA2MyA4YjAzMDAy
MSAoYjk0MDAwMjEpDQpbICAgIDIuMDcyMDI0XSAtLS1bIGVuZCB0cmFjZSA2MmM4ZDFkMWQxMGFl
M2RlIF0tLS0NClsgICAgMi4wNzcxNThdIG5vdGU6IHN3YXBwZXIvMFsxXSBleGl0ZWQgd2l0aCBw
cmVlbXB0X2NvdW50IDENClsgICAgMi4wODMyOTZdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5n
OiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0ISBleGl0Y29kZT0weDAwMDAwMDBiDQpbICAgIDIuMDkx
NjU5XSBTTVA6IHN0b3BwaW5nIHNlY29uZGFyeSBDUFVzDQpbICAgIDIuMDk2MDM3XSBLZXJuZWwg
T2Zmc2V0OiBkaXNhYmxlZA0KWyAgICAyLjA5OTkxNF0gQ1BVIGZlYXR1cmVzOiAweDAwMDIsMjAw
MDIwMGMNClsgICAgMi4xMDQzNzFdIE1lbW9yeSBMaW1pdDogbm9uZQ0KWyAgICAyLjEwNzc4OF0g
LS0tWyBlbmQgS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0byBraWxsIGlu
aXQhIGV4aXRjb2RlPTB4MDAwMDAwMGIgXS0tLQ0KDQpSZWdhcmRzLA0KUGVuZy4NCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
