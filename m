Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4901108BF6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 11:43:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZBnK-0005dZ-VV; Mon, 25 Nov 2019 10:40:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ElPp=ZR=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1iZBnJ-0005dU-1R
 for xen-devel@lists.xen.org; Mon, 25 Nov 2019 10:40:37 +0000
X-Inumbo-ID: 0308efb2-0f70-11ea-a38d-12813bfff9fa
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.89]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0308efb2-0f70-11ea-a38d-12813bfff9fa;
 Mon, 25 Nov 2019 10:40:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0tABrXyzeBWT7D4mV/7ZdGwijXkBez28n/cd7+6Hagm6aokbCQKTnjDq50cJLLTeSW39YnW6XEqg5NlBuu1sdQOqhV2/R2FxUBMVxSPdub2CTf5h/hprmB2D3RU9AWJd81ABuEnqg0YNc6zrIGTh7GiwWYbUFDPjhhQu7Tfck7sP/5q5E0QyaNZNVbuhyrCNNICaOTnH+yY17sfltbDf46KHpUFpL+DxMyKiby/0c/Ye/bZmj/vJ8zEsB1cqAaKQMr8oVzj4UDPtaDnY1D3V1F8VRUS79K+yAwjSXy4aSUEYvr3cBwD1Y6Ix0eLKqBB6PCA4yJJIQ8FJwqXidKhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vN7CGflH4ULxrYaF3lYmh4k+ScD5wlyYJ8v8/OoUR08=;
 b=g+Z94PqH/M5U4/aK2+gXglqw5R7iCjJ/edhDTg9HllWOfdV8G2e2oVcZFpgTbqDIteU1kfV3ZHCnFzPPT8m3YJDKVVNO3gPZu3tf7bJjcixyp5Asmi6I/60Q8ceySk+O5MRTlAnsuPlulPb7cVvfHrl40vHWr/E+1wjkruztXRFWPOHE7CdZ7xDVrvMOv07MbuHzqKIb6FahrQ5nRzQ+w54UAe89OMQCfdTkb5ZhDLIW5J1eoOmcvi9MmjYysYQAHk8Z5gZLTIXbhhyAlk+PAvmkB/aG7uq1DczC9gCKmRIHWt047r4fmgnzF37jo9oH6FtWMDvTdG4B4RLcPJu9rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vN7CGflH4ULxrYaF3lYmh4k+ScD5wlyYJ8v8/OoUR08=;
 b=hmqyUXiJP3qF4NRILaOnZBRCwlJ2m5zMRt10VXaqleW1+zOpc+cJgTYpNB8b2+oBVnM/UVnbNWi1xM/zLY6lOxkFtcm61A2EQio2kN2NKOg9cBWg8VZ/PpD9U1usME2qi5dfnzqxjOsuTmmRpZRqSDgKUGGgY4MC6f8CnQUe7o0=
Received: from VI1PR03MB3711.eurprd03.prod.outlook.com (52.134.23.12) by
 VI1PR03MB4816.eurprd03.prod.outlook.com (20.178.80.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Mon, 25 Nov 2019 10:40:32 +0000
Received: from VI1PR03MB3711.eurprd03.prod.outlook.com
 ([fe80::7cc7:a998:4f5a:2a84]) by VI1PR03MB3711.eurprd03.prod.outlook.com
 ([fe80::7cc7:a998:4f5a:2a84%6]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 10:40:32 +0000
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: "peng.fan@nxp.com" <peng.fan@nxp.com>, Oleksandr Andrushchenko
 <Oleksandr_Andrushchenko@epam.com>
Thread-Topic: [Xen-devel] vsnd issue
Thread-Index: AdWjeYM0mJR1EPMQS6mJNQqqC3DsNQAAQaSAAACRSQA=
Date: Mon, 25 Nov 2019 10:40:32 +0000
Message-ID: <b0a79631326ba4452aac053dff7918014050fe3c.camel@epam.com>
References: <AM0PR04MB4481F51148AB1FA7F4A19393884A0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <02efc325-c920-6eb2-0c43-32f0945beac2@xen.org>
In-Reply-To: <02efc325-c920-6eb2-0c43-32f0945beac2@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Artem_Mygaiev@epam.com; 
x-originating-ip: [85.223.141.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7a1445a-ecc4-4d92-c740-08d77193e59d
x-ms-traffictypediagnostic: VI1PR03MB4816:|VI1PR03MB4816:
x-ms-exchange-transport-forked: True
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR03MB48166C38BB8991E1F97B2A83F44A0@VI1PR03MB4816.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(53754006)(189003)(199004)(86362001)(2616005)(81166006)(66946007)(76116006)(81156014)(8936002)(91956017)(2501003)(66446008)(110136005)(66476007)(5660300002)(2906002)(316002)(118296001)(14444005)(3846002)(6116002)(66066001)(71200400001)(71190400001)(54906003)(66556008)(6436002)(446003)(11346002)(99286004)(14454004)(36756003)(6486002)(229853002)(25786009)(478600001)(26005)(966005)(64756008)(8676002)(6306002)(6506007)(256004)(4001150100001)(4326008)(55236004)(80792005)(53546011)(76176011)(6636002)(102836004)(7736002)(305945005)(6512007)(186003)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR03MB4816;
 H:VI1PR03MB3711.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0xEV1LkFkFDhvQVs03WDl5GBVx029VJf8Y+2cRIl+I8Cf1oCamroS7bn7+Z4KnUIJljL7AjWVFgASBRp51v8Fgr0Obh0i1l1jaUjDbgh1rQdI7R+rGBCXDibZXXf/5NMH70FCLmLxz/lugYCIU/pQKQtMCHxvBPDK1w9nHAUBlsIGHbELoW1Y1WxJdoOgwB4ybOZJFgXsyWyhnM0jUiVPcJ0cpEij8nUjABjI3JrnXDf/HDDgpojFXBn8TsorO467ZI0AROl1sLft2m05Bj3dX2EzNdY5zoJImBO7+j03YNhOpnL6LP/2Y/z6iZkTZ4P45wflJIi56srBbBQ+HHAVHW5dIBGMPiEI9PjOcSNWgsC6GKfdkW4DQ/w32FwOPwJvLFKU3zpvRG9CNEW/ODF9g+P+0h7Ng8Xy1qnUL8GBiP7i7dF2gJN83XjoUZUV2sdd0cXwyQVtjaZqU1qtnE1d3wSD3Z2Z1kajW9EpdrJ3Y4=
Content-ID: <D62EB1F0964C7F4D94AC0CE10A8C79CE@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a1445a-ecc4-4d92-c740-08d77193e59d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 10:40:32.2068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TKql+T47WvRQK7fiBlOR13RQKOfNBWGVxXA+YfRvGo/Imv3JF/bu4EDl/r7ArLYJO70Thho8GBigP2JOORHb3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4816
Subject: Re: [Xen-devel] vsnd issue
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gUGVuZyBGYW4NCg0KUGxlYXNlIGNvbnRhY3QgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
KGFkZGVkIHRvIHRoaXMgdGhyZWFkKSBvbiB0aGlzDQppc3N1ZS4NCg0KIC0tIEFydGVtDQoNCk9u
IE1vbiwgMjAxOS0xMS0yNSBhdCAxMDoyNCArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiAN
Cj4gT24gMjUvMTEvMjAxOSAxMDoxOSwgUGVuZyBGYW4gd3JvdGU6DQo+ID4gSGkgQWxsLA0KPiAN
Cj4gSGksDQo+IA0KPiA+IEkgYW0gdHJ5aW5nIHZzbmQgZnJvbSB4ZW4tdHJvb3BzIHdpdGggeGVu
IDQuMTMgYW5kIExpbnV4IDUuNCwgYnV0DQo+ID4gZG9tdSByZXBvcnRzOg0KPiANCj4geGVuLXRy
b29wcyBpcyBub3QgcGFydCBvZiBYZW4gUHJvamVjdC4gUGxlYXNlIGNvbnRhY3QgdGhlIG93bmVy
IG9mDQo+IHRoZSANCj4gcmVwbyBmb3IgYW55IGhlbHAgaGVyZS4NCj4gDQo+IEkgaGF2ZSBDQ2Vk
IEFydGVtIHdobyBzaG91bGQgYmUgYWJsZSB0byBwb2ludCB0byB0aGUgYXV0aG9yIG9mIHZzbmQu
DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IA0KPiA+IGFwbGF5IGNvbXBsLm1wMw0KPiA+IEFMU0Eg
bGliIC4uLy4uLy4uL2Fsc2EtbGliLQ0KPiA+IDEuMS45L3NyYy9wY20vcGNtX2RpcmVjdC5jOjEx
NTY6KHNuZDFfcGNtX2RpcmVjdF9pbml0aWFsaXplX3NsYXZlKQ0KPiA+IHNsYXZlIHBsdWdpbiBk
b2VzIG5vdCBzdXBwb3J0IG1tYXAgaW50ZXJsZWF2ZWQgb3IgbW1hcA0KPiA+IG5vbmludGVybGVh
dmVkIGFjY2Vzcw0KPiA+IEFMU0EgbGliIC4uLy4uLy4uL2Fsc2EtbGliLQ0KPiA+IDEuMS45L3Ny
Yy9wY20vcGNtX2RtaXguYzoxMTIwOihzbmRfcGNtX2RtaXhfb3BlbikgdW5hYmxlIHRvDQo+ID4g
aW5pdGlhbGl6ZSBzbGF2ZQ0KPiA+IGFwbGF5OiBtYWluOjgyODogYXVkaW8gb3BlbiBlcnJvcjog
SW52YWxpZCBhcmd1bWVudA0KPiA+IA0KPiA+IFdoZW4gZXhlY3V0aW5nIGFwbGF5IGluIGRvbXUs
IGRvbTAgc2lkZSBsb2c6DQo+ID4gcm9vdEBpbXg4cW1tZWs6fiMgMTMuMTEuMTkgMDg6MjQ6NTcu
NDg0IHwgWGVuRXZ0Y2huICAgICAgIHwgREJHIC0NCj4gPiBFdmVudCByZWNlaXZlZCwgcG9ydDog
MTANCj4gPiAxMy4xMS4xOSAwODoyNDo1Ny40OTEgfCBTdHJlYW1SaW5nICAgICAgfCBEQkcgLSBS
ZXF1ZXN0IHJlY2VpdmVkLA0KPiA+IGlkOiBhbHNhPGh3OjI7MD4sIGNtZDo5DQo+ID4gMTMuMTEu
MTkgMDg6MjQ6NTcuNTAwIHwgQ29tbWFuZEhhbmRsZXIgIHwgREJHIC0gSGFuZGxlIGNvbW1hbmQN
Cj4gPiBbUVVFUllfSFdfUEFSQU1dDQo+ID4gMTMuMTEuMTkgMDg6MjQ6NTcuNTA4IHwgQWxzYVBj
bSAgICAgICAgIHwgREJHIC0gUXVlcnkgcGNtIGRldmljZQ0KPiA+IGh3OjIsMCBmb3IgSFcgcGFy
YW1ldGVycw0KPiA+IDEzLjExLjE5IDA4OjI0OjU3LjUxNiB8IENvbW1hbmRIYW5kbGVyICB8IERC
RyAtIFJldHVybiBzdGF0dXM6IFswXQ0KPiA+IDEzLjExLjE5IDA4OjI0OjU3LjUyMyB8IFhlbkV2
dGNobiAgICAgICB8IERCRyAtIE5vdGlmeSBldmVudA0KPiA+IGNoYW5uZWwsIHBvcnQ6IDEwDQo+
ID4gMTMuMTEuMTkgMDg6MjQ6NTcuNTMxIHwgWGVuRXZ0Y2huICAgICAgIHwgREJHIC0gRXZlbnQg
cmVjZWl2ZWQsDQo+ID4gcG9ydDogMTANCj4gPiAxMy4xMS4xOSAwODoyNDo1Ny41MzggfCBTdHJl
YW1SaW5nICAgICAgfCBEQkcgLSBSZXF1ZXN0IHJlY2VpdmVkLA0KPiA+IGlkOiBhbHNhPGh3OjI7
MD4sIGNtZDo5DQo+ID4gMTMuMTEuMTkgMDg6MjQ6NTcuNTQ2IHwgQ29tbWFuZEhhbmRsZXIgIHwg
REJHIC0gSGFuZGxlIGNvbW1hbmQNCj4gPiBbUVVFUllfSFdfUEFSQU1dDQo+ID4gMTMuMTEuMTkg
MDg6MjQ6NTcuNTU0IHwgQWxzYVBjbSAgICAgICAgIHwgREJHIC0gUXVlcnkgcGNtIGRldmljZQ0K
PiA+IGh3OjIsMCBmb3IgSFcgcGFyYW1ldGVycw0KPiA+IDEzLjExLjE5IDA4OjI0OjU3LjU2MyB8
IENvbW1hbmRIYW5kbGVyICB8IERCRyAtIFJldHVybiBzdGF0dXM6IFswXQ0KPiA+IDEzLjExLjE5
IDA4OjI0OjU3LjU3MCB8IFhlbkV2dGNobiAgICAgICB8IERCRyAtIE5vdGlmeSBldmVudA0KPiA+
IGNoYW5uZWwsIHBvcnQ6IDEwDQo+ID4gMTMuMTEuMTkgMDg6MjQ6NTcuNTc3IHwgWGVuRXZ0Y2hu
ICAgICAgIHwgREJHIC0gRXZlbnQgcmVjZWl2ZWQsDQo+ID4gcG9ydDogMTANCj4gPiAxMy4xMS4x
OSAwODoyNDo1Ny41ODQgfCBTdHJlYW1SaW5nICAgICAgfCBEQkcgLSBSZXF1ZXN0IHJlY2VpdmVk
LA0KPiA+IGlkOiBhbHNhPGh3OjI7MD4sIGNtZDo5DQo+ID4gMTMuMTEuMTkgMDg6MjQ6NTcuNTkz
IHwgQ29tbWFuZEhhbmRsZXIgIHwgREJHIC0gSGFuZGxlIGNvbW1hbmQNCj4gPiBbUVVFUllfSFdf
UEFSQU1dDQo+ID4gMTMuMTEuMTkgMDg6MjQ6NTcuNjAxIHwgQWxzYVBjbSAgICAgICAgIHwgREJH
IC0gUXVlcnkgcGNtIGRldmljZQ0KPiA+IGh3OjIsMCBmb3IgSFcgcGFyYW1ldGVycw0KPiA+IDEz
LjExLjE5IDA4OjI0OjU3LjYxMCB8IENvbW1hbmRIYW5kbGVyICB8IERCRyAtIFJldHVybiBzdGF0
dXM6IFswXQ0KPiA+IDEzLjExLjE5IDA4OjI0OjU3LjYxNiB8IFhlbkV2dGNobiAgICAgICB8IERC
RyAtIE5vdGlmeSBldmVudA0KPiA+IGNoYW5uZWwsIHBvcnQ6IDEwDQo+ID4gMTMuMTEuMTkgMDg6
MjQ6NTcuNjI0IHwgWGVuRXZ0Y2huICAgICAgIHwgREJHIC0gRXZlbnQgcmVjZWl2ZWQsDQo+ID4g
cG9ydDogMTANCj4gPiAxMy4xMS4xOSAwODoyNDo1Ny42MzEgfCBTdHJlYW1SaW5nICAgICAgfCBE
QkcgLSBSZXF1ZXN0IHJlY2VpdmVkLA0KPiA+IGlkOiBhbHNhPGh3OjI7MD4sIGNtZDo5DQo+ID4g
MTMuMTEuMTkgMDg6MjQ6NTcuNjQwIHwgQ29tbWFuZEhhbmRsZXIgIHwgREJHIC0gSGFuZGxlIGNv
bW1hbmQNCj4gPiBbUVVFUllfSFdfUEFSQU1dDQo+ID4gMTMuMTEuMTkgMDg6MjQ6NTcuNjQ3IHwg
QWxzYVBjbSAgICAgICAgIHwgREJHIC0gUXVlcnkgcGNtIGRldmljZQ0KPiA+IGh3OjIsMCBmb3Ig
SFcgcGFyYW1ldGVycw0KPiA+IDEzLjExLjE5IDA4OjI0OjU3LjY1NiB8IENvbW1hbmRIYW5kbGVy
ICB8IERCRyAtIFJldHVybiBzdGF0dXM6IFswXQ0KPiA+IDEzLjExLjE5IDA4OjI0OjU3LjY2MyB8
IFhlbkV2dGNobiAgICAgICB8IERCRyAtIE5vdGlmeSBldmVudA0KPiA+IGNoYW5uZWwsIHBvcnQ6
IDEwDQo+ID4gMTMuMTEuMTkgMDg6MjQ6NTcuNjcxIHwgWGVuRXZ0Y2huICAgICAgIHwgREJHIC0g
RXZlbnQgcmVjZWl2ZWQsDQo+ID4gcG9ydDogMTANCj4gPiAxMy4xMS4xOSAwODoyNDo1Ny42Nzgg
fCBTdHJlYW1SaW5nICAgICAgfCBEQkcgLSBSZXF1ZXN0IHJlY2VpdmVkLA0KPiA+IGlkOiBhbHNh
PGh3OjI7MD4sIGNtZDo5DQo+ID4gMTMuMTEuMTkgMDg6MjQ6NTcuNjg2IHwgQ29tbWFuZEhhbmRs
ZXIgIHwgREJHIC0gSGFuZGxlIGNvbW1hbmQNCj4gPiBbUVVFUllfSFdfUEFSQU1dDQo+ID4gMTMu
MTEuMTkgMDg6MjQ6NTcuNjk0IHwgQWxzYVBjbSAgICAgICAgIHwgREJHIC0gUXVlcnkgcGNtIGRl
dmljZQ0KPiA+IGh3OjIsMCBmb3IgSFcgcGFyYW1ldGVycw0KPiA+IDEzLjExLjE5IDA4OjI0OjU3
LjcwMyB8IENvbW1hbmRIYW5kbGVyICB8IERCRyAtIFJldHVybiBzdGF0dXM6IFswXQ0KPiA+IDEz
LjExLjE5IDA4OjI0OjU3LjcwOSB8IFhlbkV2dGNobiAgICAgICB8IERCRyAtIE5vdGlmeSBldmVu
dA0KPiA+IGNoYW5uZWwsIHBvcnQ6IDEwDQo+ID4gDQo+ID4gDQo+ID4gTXkgeGwuY2ZnOg0KPiA+
ICAgICAgdnNuZCA9IFsNCj4gPiAgICAgICAgICBbJ0NBUkQsIHNob3J0LW5hbWU9TWFpbiwgc2Ft
cGxlLWZvcm1hdHM9czE2X2xlO3M4O3UzMl9iZScsDQo+ID4gICAgICAgICAgICAgICdQQ00sIG5h
bWU9TWFpbicsDQo+ID4gICAgICAgICAgICAgICAgICAnU1RSRUFNLCB1bmlxdWUtaWQ9YWxzYTxo
dzoyOzA+LCB0eXBlPXAnLA0KPiA+ICAgICAgICAgICAgICAgICAgJ1NUUkVBTSwgdW5pcXVlLWlk
PWFsc2E8aHc6MjsxPiwgdHlwZT1jLCBjaGFubmVscy0NCj4gPiBtYXg9MicNCj4gPiAgICAgICAg
ICBdLA0KPiA+ICAgICAgXQ0KPiA+IA0KPiA+IFRoZSBhdWRpbyBkZXZpY2Ugb24gbXkgYm9hcmQ6
DQo+ID4gYXBsYXkgLWwNCj4gPiAqKioqIExpc3Qgb2YgUExBWUJBQ0sgSGFyZHdhcmUgRGV2aWNl
cyAqKioqDQo+ID4gY2FyZCAwOiBpbXhhdWRtaXggW2lteC1hdWRtaXhdLCBkZXZpY2UgMDogSGlG
aS1BVURNSVgtRkUgKCopIFtdDQo+ID4gICAgU3ViZGV2aWNlczogMS8xDQo+ID4gICAgU3ViZGV2
aWNlICMwOiBzdWJkZXZpY2UgIzANCj4gPiBjYXJkIDA6IGlteGF1ZG1peCBbaW14LWF1ZG1peF0s
IGRldmljZSAxOiBIaUZpLUFVRE1JWC1GRSAoKikgW10NCj4gPiAgICBTdWJkZXZpY2VzOiAxLzEN
Cj4gPiAgICBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAjMA0KPiA+IGNhcmQgMTogY3M0Mjg4OGF1
ZGlvIFtjczQyODg4LWF1ZGlvXSwgZGV2aWNlIDA6IEhpRmkgY3M0Mjg4OC0wDQo+ID4gW0hpRmkg
Y3M0Mjg4OC0wXQ0KPiA+ICAgIFN1YmRldmljZXM6IDEvMQ0KPiA+ICAgIFN1YmRldmljZSAjMDog
c3ViZGV2aWNlICMwDQo+ID4gY2FyZCAxOiBjczQyODg4YXVkaW8gW2NzNDI4ODgtYXVkaW9dLCBk
ZXZpY2UgMTogSGlGaS1BU1JDLUZFICgqKSBbXQ0KPiA+ICAgIFN1YmRldmljZXM6IDEvMQ0KPiA+
ICAgIFN1YmRldmljZSAjMDogc3ViZGV2aWNlICMwDQo+ID4gY2FyZCAyOiB3bTg5NjBhdWRpbyBb
d204OTYwLWF1ZGlvXSwgZGV2aWNlIDA6IEhpRmkgd204OTYwLWhpZmktMCBbXQ0KPiA+ICAgIFN1
YmRldmljZXM6IDAvMQ0KPiA+ICAgIFN1YmRldmljZSAjMDogc3ViZGV2aWNlICMwDQo+ID4gDQo+
ID4gSXMgdGhlcmUgc29tZXRoaW5nIHdyb25nIGluIG15IGNvbmZpZ3VyYXRpb24/DQo+ID4gDQo+
ID4gVGhhbmtzLA0KPiA+IFBlbmcuDQo+ID4gDQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+ID4g
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4gDQo+ID4gaHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWxfXzshSzZkbUdDRWFiNHVlSmchaVRlSk9ONjFZMm5VY0dNUXJfeTctMjdiUl9R
bE9HOGdYcXZSTWFVOHl5OG5KdURoeldpenlsdmxfNnN0RC1JTE9RJA0KPiA+ICANCj4gPiANCj4g
DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
