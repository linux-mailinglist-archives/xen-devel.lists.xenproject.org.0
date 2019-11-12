Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30046F8793
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 05:46:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUO0s-000533-1t; Tue, 12 Nov 2019 04:42:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nUxK=ZE=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1iUO0q-00052y-Qu
 for xen-devel@lists.xen.org; Tue, 12 Nov 2019 04:42:45 +0000
X-Inumbo-ID: dcb0edec-0506-11ea-9631-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.83]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcb0edec-0506-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 04:42:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsbrFwK2e6ZWEYnyS6NXEBqwtj9+nIZtx2enlCWVzkFrghGTn/nApTQWfHd8OXXpeChnCpPs4OEexCAx7noz/mGg00CF6knTsC1Km8rjQofM0SiTVXwCuoV7dz1SogXNF84Umx+YUfTph61jdX0QQpFMjXyvgbPgmBq9d3eTg1Lv9w2veCA/Ljo6zbfPDhRuAtZbWTJBwO6w6Ckq+GY2cdQ0hweHIDniqxMj7hs0jNVMNEp99oej/CFgj+quyLtJu/JsenW5irioEYcjwHbenmHRQOt50NVgFAtOl44aS9PwmozDKT4Qpk7juEvlzlwCLUVh91jUZO0ziJzS7zZInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ye1W3RGY8g6HKWPy1LQJPT4bf2WX9tangsLz7NA6iWs=;
 b=b4nlipNUuMj2JMB/CIS3n+LheA0SH0ghrKo9f1WIii7zHEl1WYu2yyoJI5zNVpJPXRcyFsG0dEQKnZfXOWfLDfllL2xGXioLC9pe2D3CMF6etGW/Qs19cBeM8uqv54Er3F8OGq8j1H7UP32Zu3r8I9iLe9lb4mMMnBEf8nIxzvyUcnJr5T48idbFLrzC35TbS5y5Axfka/vreRHrdareO8xAZGFfHyxO8FLSDmKx8064PyBnzGTh5Ze6i40lHl55NgdpPVdLUokDbxS3qzM9h0Vf2jx92PB6PWXr7+qJUXwwuP+FgF10p6GoXxbZwgFVGVwQl15xABhaCy6jxaX+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ye1W3RGY8g6HKWPy1LQJPT4bf2WX9tangsLz7NA6iWs=;
 b=C1Kp5rRuzE5pXm3ZpKp05m9BXlxELmu/O6OK8jhb9GWrPRpjSOdyaOGRpn69GWgM0qvDOP6qj+ftu4qa53nnYaCj5YMHZoWvPG8R7jCG4Ej4sLgnUKAxvOxsSPCeRezL0/IiNkbEIO8cEnCzVOLH5M/AGTGvg41m8VHMN4YgkCs=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6979.eurprd04.prod.outlook.com (52.132.215.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Tue, 12 Nov 2019 04:42:41 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 04:42:41 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Julien Grall <julien.grall.oss@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Thread-Topic: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
Thread-Index: AQHVlRomdHS3ryIcQEao8h2tiDDndaeBqioAgAA3t4CABRoj4A==
Date: Tue, 12 Nov 2019 04:42:40 +0000
Message-ID: <AM0PR04MB44811934638A8DFF51B6B95788770@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20191107033709.17575-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
In-Reply-To: <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 21bbbe12-32df-4de8-010c-08d7672ac061
x-ms-traffictypediagnostic: AM0PR04MB6979:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR04MB69793346C6DD8A72DF7E258488770@AM0PR04MB6979.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(199004)(189003)(7736002)(305945005)(6116002)(26005)(66574012)(6306002)(54906003)(71200400001)(71190400001)(6436002)(229853002)(110136005)(74316002)(9686003)(316002)(6246003)(99286004)(86362001)(66066001)(3846002)(4326008)(25786009)(8676002)(66556008)(966005)(66946007)(2906002)(64756008)(76116006)(7696005)(476003)(81166006)(11346002)(66476007)(446003)(81156014)(66446008)(76176011)(186003)(55016002)(5660300002)(102836004)(486006)(256004)(53546011)(44832011)(478600001)(33656002)(6506007)(14454004)(52536014)(14444005)(8936002)(45080400002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB6979;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N4mOb6ymov4hOP3Cb1uCmke6vtUnBPJSAfQHc0AUEZyAuR/yQ24EEaHuLxYXziR3h+zyXGKZmGzW9oQKeFooOMAGr5+kF03KsFwPs64xkTHC3EBKoET9NT8BCigmlNWFbQA4GfWOnwZEFInWqC2qlmDA2aqU35D+saZ6zl3F12MPe7lv2872OqSboEI0C18HlOfbO0BuGxSNxbWdbo7PJr20PsvYPT4Ndxie5PPpaEy2H4LUJ1DUUURDzXndt3Qj2i8Waoura5l8CkdDZrR1Jrn3CjHn31JxMnV7HkB1JQPcXIkF5BiQ9SfqBERoamXCEdc1lC4i0yxz/xhTVZlpFOxhUyCYJG4tOBTUCrc95DfmiLAbNNcWTY+dRpTQ5rWUFjZNV2t+vMCnZUId+9vHvctAgDiQ9Y0cOl1lrGA4NnAiwyll92ntC3VFw5fIy9bS5PBYo8YszPZydUvFdg+CWSF0hnA6U5BHcysy923Lqrk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21bbbe12-32df-4de8-010c-08d7672ac061
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 04:42:40.9564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1KyZPpjMQapE+znPnl3mO8ygpipG4y39PJD2dRet8vHkeq4per1667kYT4EYzn3ov+hX3zMFOZzwPkWGlDzRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6979
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
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLA0KDQpJbmxpbmUgbWFya2VkIHdpdGggW1BlbmcgRmFuXQ0KDQpGcm9tOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbC5vc3NAZ21haWwuY29tPiANClNlbnQ6IDIwMTnlubQxMeac
iDnml6UgNjo0NA0KVG86IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPg0KQ2M6IFBlbmcgRmFu
IDxwZW5nLmZhbkBueHAuY29tPjsgSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPjsganVs
aWVuLmdyYWxsQGFybS5jb207IHhlbi1kZXZlbEBsaXN0cy54ZW4ub3JnDQpTdWJqZWN0OiBSZTog
W1hlbi1kZXZlbF0gW1BBVENIXSBhcmNoOiBhcm06IHZnaWMtdjM6IGZpeCBHSUNEX0lTQUNUSVZF
UiByYW5nZQ0KDQpIaSwNCg0KU29ycnkgZm9yIHRoZSBmb3JtYXR0aW5nLg0KT24gU2F0LCA5IE5v
diAyMDE5LCAwNDoyNyBTdGVmYW5vIFN0YWJlbGxpbmksIDxtYWlsdG86c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4gd3JvdGU6DQpPbiBUaHUsIDcgTm92IDIwMTksIFBlbmcgRmFuIHdyb3RlOg0KPiBU
aGUgZW5kIHNob3VsZCBiZSBHSUNEX0lTQUNUSVZFUk4gbm90IEdJQ0RfSVNBQ1RJVkVSLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPG1haWx0bzpwZW5nLmZhbkBueHAuY29tPg0KDQpS
ZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxtYWlsdG86c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4NCg0KVG8gYmUgaG9uZXN0LCBJIGFtIG5vdCBzdXJlIHRoZSBjb2RlIGlzIGNvcnJlY3Qu
IEEgcmVhZCB0byB0aG9zZSByZWdpc3RlcnMgc2hvdWxkIHRlbGwgeW91IHRoZSBsaXN0IG9mIGlu
dGVycnVwdHMgYWN0aXZlLiBBcyB3ZSBhbHdheXMgcmV0dXJuIDAsIHRoaXMgd2lsbCBub3QgcmV0
dXJuIHRoZSBjb3JyZWN0IHN0YXRlIG9mIHRoZSBHSUMuDQoNCkkga25vdyB0aGF0IHJldHVybmlu
ZyB0aGUgbGlzdCBvZiBhY3RpdmVzIGludGVycnVwdHMgaXMgY29tcGxpY2F0ZWQgd2l0aCB0aGUg
b2xkIHZHSUMsIGJ1dCBJIGRvbid0IHRoaW5rIHNpbGVudGx5IGlnbm9yaW5nIGl0IGlzIGEgZ29v
ZCBpZGVhLg0KDQpUaGUgcXVlc3Rpb24gaGVyZSBpcyB3aHkgdGhlIGd1ZXN0IGFjY2Vzc2VkIHRo
b3NlIHJlZ2lzdGVycz8gV2hhdCBpcyBpdCB0cnlpbmcgdG8gZmlndXJlIG91dD8NCg0KW1Blbmcg
RmFuXSBJIGFtIHJ1bm5pbmcgTGludXggNS40IGtlcm5lbCBkb20wLCBnaWNfcGVla19pcnEgdHJp
Z2dlcnMgYWJvcnQuDQoNCg0KDQpKdWVyZ2VuLCBJIHRoaW5rIHRoaXMgZml4IHNob3VsZCBiZSBp
biB0aGUgcmVsZWFzZSAoYW5kIGFsc28NCmJhY2twb3J0ZWQgdG8gc3RhYmxlIHRyZWVzLikNCg0K
V2l0aG91dCBhbiB1bmRlcnN0YW5kaW5nIG9mIHRoZSBwcm9ibGVtLCBJIGRpc2FncmVlIHdpdGgg
dGhpcyByZXF1ZXN0IChzZWUgYWJvdmUpLg0KDQpBcyBhbiBhc2lkZSwgdGhlIHJhbmdlIElTUEVO
RFLCoCBoYXMgdGhlIHNhbWUgaXNzdWUuDQoNCltQZW5nIEZhbl0gU2hvdWxkIEkgaW5jbHVkZSB0
aGlzIGNoYW5nZSBpbiB2Mj8gT3IgZGV2ZWxvcCBuZXcgbWV0aG9kIHRvIGZpeCB0aGUgaXNzdWU/
DQpCdXQgYXQgbGVhc3QgZG9tMCBhYm9ydCB3aGVuIGJvb3QuDQoNClRoYW5rcywNClBlbmcuDQoN
CkNoZWVycywNCg0KDQoNCg0KDQoNCj4gLS0tDQo+wqAgeGVuL2FyY2gvYXJtL3ZnaWMtdjMuYyB8
IDIgKy0NCj7CoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdpYy12My5jIGIveGVuL2FyY2gvYXJt
L3ZnaWMtdjMuYw0KPiBpbmRleCA0MjJiOTRmOTAyLi5lODAyZjIwNTVhIDEwMDY0NA0KPiAtLS0g
YS94ZW4vYXJjaC9hcm0vdmdpYy12My5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMN
Cj4gQEAgLTcwNiw3ICs3MDYsNyBAQCBzdGF0aWMgaW50IF9fdmdpY192M19kaXN0cl9jb21tb25f
bW1pb19yZWFkKGNvbnN0IGNoYXIgKm5hbWUsIHN0cnVjdCB2Y3B1ICp2LA0KPsKgIMKgIMKgIMKg
IMKgIGdvdG8gcmVhZF9hc196ZXJvOw0KPsKgIA0KPsKgIMKgIMKgIC8qIFJlYWQgdGhlIGFjdGl2
ZSBzdGF0dXMgb2YgYW4gSVJRIHZpYSBHSUNEL0dJQ1IgaXMgbm90IHN1cHBvcnRlZCAqLw0KPiAt
wqAgwqAgY2FzZSBWUkFOR0UzMihHSUNEX0lTQUNUSVZFUiwgR0lDRF9JU0FDVElWRVIpOg0KPiAr
wqAgwqAgY2FzZSBWUkFOR0UzMihHSUNEX0lTQUNUSVZFUiwgR0lDRF9JU0FDVElWRVJOKToNCj7C
oCDCoCDCoCBjYXNlIFZSQU5HRTMyKEdJQ0RfSUNBQ1RJVkVSLCBHSUNEX0lDQUNUSVZFUk4pOg0K
PsKgIMKgIMKgIMKgIMKgIGdvdG8gcmVhZF9hc196ZXJvOw0KPsKgIA0KPiAtLSANCj4gMi4xNi40
DQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
WGVuLWRldmVsIG1haWxpbmcgbGlzdA0KbWFpbHRvOlhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJs
PWh0dHBzJTNBJTJGJTJGbGlzdHMueGVucHJvamVjdC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8l
MkZ4ZW4tZGV2ZWwmZGF0YT0wMiU3QzAxJTdDcGVuZy5mYW4lNDBueHAuY29tJTdDMzNmMmU5MDdj
ZGM4NGVkMGE0ODYwOGQ3NjQ5ZDM1OWUlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYz
NSU3QzAlN0MwJTdDNjM3MDg4NDk4Njc4NzgyMjM5JnNkYXRhPUczRkEydmVmcjU2RmVVWDVRVlpR
d1N6RzIybmZ2MW0lMkYwZktJRE9uZnVGUSUzRCZyZXNlcnZlZD0wDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
