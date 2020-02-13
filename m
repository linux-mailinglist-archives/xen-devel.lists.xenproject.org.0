Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FAD15C96F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 18:31:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2IGy-0005jh-De; Thu, 13 Feb 2020 17:27:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DP0/=4B=nxp.com=andrei.cherechesu@srs-us1.protection.inumbo.net>)
 id 1j2IGv-0005jc-Qy
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 17:27:30 +0000
X-Inumbo-ID: 1ae1291a-4e86-11ea-bc8e-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::60a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ae1291a-4e86-11ea-bc8e-bc764e2007e4;
 Thu, 13 Feb 2020 17:27:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCapZG4BrpYcWa66kDhwaayg5LIv8+bKJ0ZIoWo9OCBNsB9c2wGDTR+p2oBIALIqIrzepMP1WZdq+UPbawYqNU2+CCQBSyvUXG5Eo9qtybDEie5JpAwv2CcMzF4qCAFuLTetHeuZLhzecmN8g7ZgSp2I5eAwrcmF8U0mGTaHEdEHacn3y0rOKvdV0nrbKhBx4V3heNS6kubLOGS0LHSH+3NTLs7PI283VlO/2FIQEoU6DS9O0KEYRbXFPjXG9+UgCE9utoG6YVZEfFo1Hm/O5ZaJ0i3vvKMF8EdgfwtfzNH8meh2ZWQB6a0xgexdkXYLpniPzHUtds/hAdHtLe78Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofd9BWOdU8OWCPit82X2UObkHS3FcONLtOGln9FM/dk=;
 b=Kk6vcuPZbo3svGn650O9K9KGiXZtVH0aKFJM2zbCf5BWpPgJEWmOJvfAhoXI7hl59ngv8tsfxmAP9RR595VdO3ICi0DBH9CgZE7ItJ56iENfiPZjA7ek2c4hcSHnSuh4FWA1DgKWKZ5xR/6TaLRbl6YxstMIiz+Tt/ZjXiotWNKqZhcAlM3CvUKiKHfFfr1f+3olob65KzgdzL4PCk1MVEPko1M7zrps+9PC1P/zCE+7/QRWEA941fkGSPAwGH58m9aOaUl0Go/mSkgYbh9J/dUdVxmqUs1R75pDMhJE+vMjCsZPPClf7z80hIKBpzO/IAuQbL2BavoFJ8j/uZ0VVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofd9BWOdU8OWCPit82X2UObkHS3FcONLtOGln9FM/dk=;
 b=p2zoJ19dHfRrYimTuNGuT6CA0l0QQqNCVlmiP/R23x3Dh4BeKnP8x7HmHH29VJFD2zv5vTB6yodk5m2brcyIOrKCAmbazN94/sL/+VDcUnbNCxvr4ul4BwLvNUpQex+2T/mba1Ne/zdhhSt+EkOh/1tkbb+GrDM5aG+PKqa7hN0=
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (20.178.205.21) by
 VI1PR04MB5231.eurprd04.prod.outlook.com (20.177.50.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Thu, 13 Feb 2020 17:27:25 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::f41c:72d1:8193:286e]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::f41c:72d1:8193:286e%7]) with mapi id 15.20.2729.025; Thu, 13 Feb 2020
 17:27:25 +0000
From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
To: Julien Grall <julien@xen.org>
Thread-Topic: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
Thread-Index: AdXij/4YfVU1SidNS1iBhGFKGrknqQ==
Date: Thu, 13 Feb 2020 17:27:25 +0000
Message-ID: <VI1PR04MB5807A9BC95A9D956D052DB7DF91A0@VI1PR04MB5807.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andrei.cherechesu@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eeec2e44-69c8-450f-b61e-08d7b0a9fe48
x-ms-traffictypediagnostic: VI1PR04MB5231:
x-microsoft-antispam-prvs: <VI1PR04MB523129EB308D662D21BE0E76F91A0@VI1PR04MB5231.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 031257FE13
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(189003)(199004)(316002)(44832011)(2906002)(52536014)(54906003)(5660300002)(8676002)(7696005)(8936002)(81156014)(81166006)(86362001)(33656002)(66446008)(478600001)(71200400001)(66476007)(66556008)(64756008)(55016002)(4326008)(186003)(76116006)(9686003)(53546011)(6506007)(26005)(6916009)(66946007)(966005)(10126625002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5231;
 H:VI1PR04MB5807.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zSxXarXondG1Gy1V9I4o7RhV9/UTb6dJSb7yO/7z1yvkklu+ed3jeyI4/wF+SiMZJfPltrjbbq3mffqPOad+Jk14Sd7GXW9SqzR82aa0mla9JNxp7XCwEnMPSSL5q0GUAQL1jx1TTtcCbPp7yxq6KAIuvjpdEMBI9FK3z9ekOhin7XFfoeb5AUlAQA6VFbjKV0u00oWt967goIF2wLn2C7Sp0wDFCOJhUYYIvNTaAOKZLwXgy/YpeQpIUL7JBL/TXZzna4TB7PWNl3XxgrBApeke0jNv/nQM9IIf0Edg85YKnoaIVE6Pf4dXNFG9kp7AgjtzCz/RWwaBLEzetcm4EGpXoR16UvOdPm1G6SE/ZVQ4Z59hCTgJKJWbViAcSsdrgEyouXpna7EpDiKR+CVBK2ftxlwoVgd9o/Vx3RTltwBzaEmQEtJL40Zkm0twwomAOytaScnWac8Jpk4sFwSF44epxFrOJiCpVX5Tb1TGD8uYA+ZIKs6dFab6tjhiMVHH/XqHuqrc6Okoyc7fVFJuIPdjZ3M74DlfVIUIwoYlgB9puRw4SWeSbHaKyNGGujaZtZxY79CaaT9Ss2W9W67sgw==
x-ms-exchange-antispam-messagedata: 2WxqauKIu7EFNeXGnpUOdslztxSTP5Ndlg24FISrpTG5EHmSadivSO6el319GkBLYyEOHfEChjglwtBOOvChUpWZviECclFwf9Pq9zDDyXqZcerxSR2qoB0K/zFwyWPuRD+wHh4L8mUjffA1feJqgQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeec2e44-69c8-450f-b61e-08d7b0a9fe48
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2020 17:27:25.7924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRazSY0hiePmu1GqmhRkRDDZljUXPL97sNhP+v3+msda7ew+GxowQdKAWKgVumcSEMq2KOnG7nRF2QjTpbHB7/ydjcHeFlLyqgXIuDrJNfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5231
Subject: Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
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
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IA0KU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDEzLCAyMDIwIDAwOjAzDQpUbzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQW5kcmVpIENoZXJlY2hl
c3UgPGFuZHJlaS5jaGVyZWNoZXN1QG54cC5jb20+DQpDYzogSm9yZ2UgUGVyZWlyYSA8am9yZ2Uu
cGVyZWlyYUBueHAuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQpTdWJqZWN0
OiBSZTogW1hlbi1kZXZlbF0gSGF2aW5nIGEgRE9NLVUgZ3Vlc3Qgd2l0aCAxOjEgbWFwcGluZyBp
biB0aGUgc2Vjb25kIHN0YWdlIE1NVS4NCg0KSGVsbG8sDQoNCkkgdXNlZCB0aGUgWGVuIGZyb20g
U3RlZmFubydzIHRyZWUgYW5kIG1hZGUgdGhlIHVwZGF0ZXMgdG8gdGhlIHBhcnRpYWwNCmR0YiB0
aGF0IGhlIHNwZWNpZmllZC4NCg0KPiBUaGlzIGlzIG1vc3RseSBsaWtlbHkgYmVjYXVzZSBMaW51
eCBpcyB0cnlpbmcgdG8gYWNjZXNzIGEgcmVnaW9uDQo+IHRoYXQgaXMgbm90IG1hcHBlZCBpbiBz
dGFnZS0yLiBZb3UgY2FuIHJlYnVpbGQgWGVuIHdpdGggZGVidWcgZW5hYmxlZA0KPiBhbmQgeW91
IHNob3VsZCBzZWUgYSBtZXNzYWdlICJ0cmFwcy5jOi4uLiIgdGVsbGluZyB0aGUgZXhhY3QgcGh5
c2ljYWwNCj4gYWRkcmVzcyBhY2Nlc3NlZC4NCj4gDQo+IEluIGdlbmVyYWwgSSB3b3VsZCByZWNv
bW1lbmQgdG8gYnVpbGQgWGVuIHdpdGggZGVidWcgZW5hYmxlZCBkdXJpbmcgZGV2ZWxvcG1lbnQg
YXMgdGhlIGh5cGVydmlzb3Igd2lsbCBnaXZlIHlvdSBtb3JlIGluZm9ybWF0aW9uIG9mIHdoYXQn
cyBnb2luZyBvbi4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0KDQpJ
IGVuYWJsZWQgZGVidWcgY29uZmlnIGFuZCBnYXZlIGl0IGFub3RoZXIgdHJ5LiBCdXQgSSdtIHN0
aWxsDQpnZXR0aW5nIHRoZSBzYW1lIHVuaGFuZGxlZCBmYXVsdCBlcnJvciwgdGhhdCBzZWVtcyB0
byBtYXRjaCB3aGF0DQpKdWxpZW4gZGVzY3JpYmVkIGFib3ZlLg0KDQpJdCBpcyBpbmRlZWQgYSBz
dGFnZS0yIGFib3J0IGNhdXNlZCBieSB0aGUgZ3Vlc3QuDQoNCkkgYXR0YWNoZWQgdGhlIERvbVUx
IGNyYXNoIGxvZyBhdCBbMF0uDQoNClswXSBodHRwczovL3Bhc3RlYmluLmNvbS9CU0hWRlFpSw0K
DQpIb3cgc2hvdWxkIEkgcHJvY2VlZCBpbiB0aGlzIGNhc2U/DQoNClRoYW5rIHlvdSBhZ2FpbiBm
b3IgeW91ciBzdXBwb3J0LA0KQW5kcmVpDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
