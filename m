Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAE88E199
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 01:59:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hy38O-0000aA-G9; Wed, 14 Aug 2019 23:56:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yoLQ=WK=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hy38M-0000a2-C6
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 23:56:50 +0000
X-Inumbo-ID: 2d89bda6-beef-11e9-96f7-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::730])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d89bda6-beef-11e9-96f7-bc764e2007e4;
 Wed, 14 Aug 2019 23:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuKt3YptxW4msqtDJq7D01o1Rsxky9aVWG1L3DD+xQ0WkFL4l5JkLussVekqDx8ZqrdJncKr+VJJfHwOqm2ifm9LPuoBb4Ph2I2UESSHaH7LrUYmjD7RBgtMsbdfjWSH3svpJRpzogb0w8Y8/s3hpgEUaQeG+5oV8fnP7UsfCcrglipe5vBK4IR21XM2rWApeRZDKQtjhD7iuqxOTeDzxSt/s/7dSjRDKSTAB+eQhzQKFi9aNRW/5IbJSMkQlYxGiPm54xFmZm9xyBi8UnePdDRp6skn+iXK1A7g1JDW6n5FDxEJN6RekG+NTZDsHxwsMT8WskUFM8kvkeEr5kO32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXnCbJyY9pOxX31u8r/7XPwEWPTIbUd2Dj91TJtHTVg=;
 b=GsDov1ulHaB+WDqkgHZhfpORqCBiR+vlrsYcZa5mgloEwQbFPit8dxk0eJmXTab6VHQ14/B6xkBce2s7D4CzvNNytxKCWMhSwTtnfwdIBt+XOndKxv7i4bQ6ObEJhus31HvmMHfrWmoPw6gIyD+mPElScSuDfrYum8YObOnXn0RSJWX2JDAJzIH+rcub+cQkEfY7SXFOG+UvyepxN2/Z0/LNryny2H9j3CmF/5vtTX32WYVnrfrnKrD0FOw6sTOxyMNpQwB9qoq8nF6/CZjS/ZHD/EPdbbkt0Xzbj1lNQ7hmMfa8mCRISpElTmPnDBuII7wKjj8VyPfTvXl1b1fRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXnCbJyY9pOxX31u8r/7XPwEWPTIbUd2Dj91TJtHTVg=;
 b=dk8mAK9PwpclpEfJvX4XcbeLoAb6BnHV6toA8V1N8KG0KUHpRL8Xc6yiP4gNNYRz5JA5f79NBrZdmn/NT3oJdgp8sMNISe54Pll469UEjD0gDGJcaxh+i2MyRejZWt6A2Tisf5CY173SMKgpmf8NfmhtxWMCAWwqqSdXwRfLeFc=
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com (20.177.200.18) by
 VI1PR06MB5408.eurprd06.prod.outlook.com (20.178.80.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Wed, 14 Aug 2019 23:56:42 +0000
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::3164:1b3d:165e:ac42]) by VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::3164:1b3d:165e:ac42%6]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 23:56:42 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: Steven Haigh <netwiz@crc.id.au>
Thread-Topic: [PATCH] read grubenv and set default from saved_entry or
 next_entry
Thread-Index: AQHVUvuqPvsRoX8NVkqUHn9yEgeJ1qb7Ud0A
Date: Wed, 14 Aug 2019 23:56:42 +0000
Message-ID: <alpine.LFD.2.21.1908150055060.2807@austen3.home>
References: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
In-Reply-To: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Alpine 2.21 (LFD 202 2017-01-01)
x-originating-ip: [2a00:23c4:9208:400:c49a:db08:8036:b390]
x-clientproxiedby: LO2P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::16) To VI1PR06MB4720.eurprd06.prod.outlook.com
 (2603:10a6:803:90::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=m.a.young@durham.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-x-sender: michael@austen3.home
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d718755-e9ba-41e8-72c1-08d721130e3d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
 SRVR:VI1PR06MB5408; 
x-ms-traffictypediagnostic: VI1PR06MB5408:
x-microsoft-antispam-prvs: <VI1PR06MB540809200178AD55B201D53487AD0@VI1PR06MB5408.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(189003)(199004)(102836004)(256004)(478600001)(8936002)(81156014)(99936001)(54906003)(81166006)(7736002)(305945005)(64756008)(8676002)(66446008)(76176011)(66616009)(9686003)(6512007)(86362001)(25786009)(6116002)(66556008)(53936002)(66476007)(4326008)(6246003)(53346004)(14454004)(5024004)(52116002)(386003)(66946007)(6506007)(99286004)(2906002)(36756003)(11346002)(58126008)(4744005)(486006)(5660300002)(229853002)(186003)(6436002)(786003)(446003)(46003)(71200400001)(476003)(6916009)(71190400001)(6486002)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB5408;
 H:VI1PR06MB4720.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XEZD+yi+j9VP8WSMNLYw2F8CCGX4yzKqTNG4aUOvnZLzWcE1Hkz9+B5t/L4ASrF0IfKYffOW+TKuzPJKVn01VbyRJNDuS/NDQFdIgw6TEh7GMdvaxfWREF6lZbndzIOVL+BxXLx3FK0L9/123QAFZRPpHY1eabqp9UctS4W+QZHk2n5MfOiA9MC4++CO4dLVBOut6g9ZasPFqVMJLV3dq7TJ+Z6wsDfSlRWFhzuKTgdaPwB0raM8PWuvaR1SVLHO3KfJ8SXdApnciHYWegM/ngZbYwXJ/NufCpFFuebN+k3XzcLfxUqq8vsLhIlH4J5d6/FpEtjT0/IYae8CJhmwQAF9klPa8iz9x5na/VB5/7X80D9PwIzb7dnf1gBk7kYyom9QaUrCh3aSeSgivd88eTLbzAt+CZYoXnDpIsrTDs8=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_alpineLFD22119081500550602807austen3home_"
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d718755-e9ba-41e8-72c1-08d721130e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 23:56:42.4976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HmAHa/RqFTMJwOQkHjZj7JXyhdxyadPyRoYqV+UqVYBoJ5QmC3EObFgyFXwD8J4f+/w2bOUQpGmdRMHwN3Usqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5408
Subject: Re: [Xen-devel] [PATCH] read grubenv and set default from
 saved_entry or next_entry
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_002_alpineLFD22119081500550602807austen3home_
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7D8BE0C96953F44F81C7A9402ECA042A@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

On Thu, 15 Aug 2019, Michael Young wrote:

> This patch may help your issue with the default kernel setting on Fedora =
30=20
> as it uses the setting of saved_entry or next_entry from the grubenv file=
 to=20
> choose the default kernel which should override any setting picked up fro=
m if=20
> clauses in the grub.cfg file.
>
> I have only done limited and somewhat imperfect testing on it and isn't a=
=20
> proper fix (which would use grubenv settings based on what is in the if=20
> clauses) but I think it should work in your case.

The patch is actually attached this time.

 	Michael Young=

--_002_alpineLFD22119081500550602807austen3home_
Content-Type: text/plain;
	name="0001-read-grubenv-and-set-default-from-saved_entry-or-nex.patch"
Content-Description:  0001-read-grubenv-and-set-default-from-saved_entry-or-nex.patch
Content-Disposition: attachment;
	filename="0001-read-grubenv-and-set-default-from-saved_entry-or-nex.patch";
	size=3116; creation-date="Wed, 14 Aug 2019 23:56:42 GMT";
	modification-date="Wed, 14 Aug 2019 23:56:42 GMT"
Content-ID: <alpine.LFD.2.21.1908150056400.2807@austen3.home>
Content-Transfer-Encoding: base64

RnJvbSAwMGRmYTk3ZDk3ZjBjN2MxOGQ5NWFiNDc3MDY2NjBjN2FiMTViNzMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogTWljaGFlbCBZb3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51
az4NCkRhdGU6IFRodSwgMTUgQXVnIDIwMTkgMDA6MTY6NDQgKzAxMDANClN1YmplY3Q6IFtQQVRD
SF0gcmVhZCBncnViZW52IGFuZCBzZXQgZGVmYXVsdCBmcm9tIHNhdmVkX2VudHJ5IG9yIG5leHRf
ZW50cnkNCg0KVGhpcyBwYXRjaCBsb29rcyBmb3IgYSBncnViZW52IGZpbGUgaW4gdGhlIHNhbWUg
ZGlyZWN0b3J5IGFzIHRoZQ0KZ3J1Yi5jZmcgZmlsZSBhbmQgaW5jbHVkZXMgaXQgYXQgZnJvbnQg
b2YgdGhlIGdydWIuY2ZnIGZpbGUgd2hlbiBwYXNzZWQNCnRvIHBhcnNlKCkNCg0KQXMgdGhlIGdy
dWJlbnYgZmlsZSBjb25zaXN0cyBvZiB2YXJpYWJsZT12YWx1ZSBsaW5lcyBwYWRkZWQgYnkgaGFz
aGVzIHRoZXNlDQphcmUgdHJlYXRlZCBhcyBjb21tYW5kcyBpbiBwYXJzZSgpIHdoZXJlIGl0IHVz
ZXMgdGhlIHZhbHVlIG9mIHNhdmVkX2VudHJ5DQpvciBuZXh0X2VudHJ5IChpZiBzZXQpIHRvIHNl
dCB0aGUgZGVmYXVsdCBlbnRyeSBpZiBhIHRpdGxlIG1hdGNoZXMuDQotLS0NCiB0b29scy9weWdy
dWIvc3JjL0dydWJDb25mLnB5IHwgIDkgKysrKysrKysrDQogdG9vbHMvcHlncnViL3NyYy9weWdy
dWIgICAgICB8IDEzICsrKysrKysrKysrKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL3Rvb2xzL3B5Z3J1Yi9zcmMvR3J1
YkNvbmYucHkgYi90b29scy9weWdydWIvc3JjL0dydWJDb25mLnB5DQppbmRleCA1OTQxMzliYWM3
Li5jOWE4MWZlOTM2IDEwMDY0NA0KLS0tIGEvdG9vbHMvcHlncnViL3NyYy9HcnViQ29uZi5weQ0K
KysrIGIvdG9vbHMvcHlncnViL3NyYy9HcnViQ29uZi5weQ0KQEAgLTM4Myw2ICszODMsOCBAQCBj
bGFzcyBHcnViMkNvbmZpZ0ZpbGUoX0dydWJDb25maWdGaWxlKToNCiAgICAgICAgIGltZyA9IE5v
bmUNCiAgICAgICAgIHRpdGxlID0gIiINCiAgICAgICAgIG1lbnVfbGV2ZWw9MA0KKyAgICAgICAg
aW1nX2NvdW50PTANCisgICAgICAgIGRlZmF1bHRfdGl0bGU9IiINCiAgICAgICAgIGZvciBsIGlu
IGxpbmVzOg0KICAgICAgICAgICAgIGwgPSBsLnN0cmlwKCkNCiAgICAgICAgICAgICAjIHNraXAg
YmxhbmsgbGluZXMNCkBAIC00MDgsNiArNDEwLDkgQEAgY2xhc3MgR3J1YjJDb25maWdGaWxlKF9H
cnViQ29uZmlnRmlsZSk6DQogICAgICAgICAgICAgICAgICAgICByYWlzZSBSdW50aW1lRXJyb3Io
InN5bnRheCBlcnJvcjogY2Fubm90IG5lc3QgbWVudWVudHJ5ICglZCAlcykiICUgKGxlbihpbWcp
LGltZykpDQogICAgICAgICAgICAgICAgIGltZyA9IFtdDQogICAgICAgICAgICAgICAgIHRpdGxl
ID0gdGl0bGVfbWF0Y2guZ3JvdXAoMSkNCisgICAgICAgICAgICAgICAgaWYgdGl0bGUgPT0gZGVm
YXVsdF90aXRsZToNCisgICAgICAgICAgICAgICAgICAgIHNldGF0dHIoc2VsZiwgJ2RlZmF1bHQn
LCBpbWdfY291bnQpDQorICAgICAgICAgICAgICAgIGltZ19jb3VudCArPSAxDQogICAgICAgICAg
ICAgICAgIGNvbnRpbnVlDQogDQogICAgICAgICAgICAgaWYgbC5zdGFydHN3aXRoKCJzdWJtZW51
Iik6DQpAQCAtNDMyLDYgKzQzNywxMCBAQCBjbGFzcyBHcnViMkNvbmZpZ0ZpbGUoX0dydWJDb25m
aWdGaWxlKToNCiANCiAgICAgICAgICAgICAoY29tLCBhcmcpID0gZ3J1Yl9leGFjdF9zcGxpdChs
LCAyKQ0KICAgICAgICAgDQorICAgICAgICAgICAgaWYgY29tID09ICJzYXZlZF9lbnRyeSIgb3Ig
Y29tID09ICJuZXh0X2VudHJ5IjoNCisgICAgICAgICAgICAgICAgZGVmYXVsdF90aXRsZSA9IGFy
Zw0KKyAgICAgICAgICAgICAgICBjb250aW51ZQ0KKw0KICAgICAgICAgICAgIGlmIGNvbSA9PSAi
c2V0IjoNCiAgICAgICAgICAgICAgICAgKGNvbSxhcmcpID0gZ3J1YjJfaGFuZGxlX3NldChhcmcp
DQogICAgICAgICAgICAgICAgIA0KZGlmZiAtLWdpdCBhL3Rvb2xzL3B5Z3J1Yi9zcmMvcHlncnVi
IGIvdG9vbHMvcHlncnViL3NyYy9weWdydWINCmluZGV4IGNlN2FiMGViOGMuLjI2Nzc4ODc5NWIg
MTAwNzU1DQotLS0gYS90b29scy9weWdydWIvc3JjL3B5Z3J1Yg0KKysrIGIvdG9vbHMvcHlncnVi
L3NyYy9weWdydWINCkBAIC00NTQsOCArNDU0LDE5IEBAIGNsYXNzIEdydWI6DQogICAgICAgICBp
ZiBzZWxmLl9fZGljdF9fLmdldCgnY2YnLCBOb25lKSBpcyBOb25lOg0KICAgICAgICAgICAgIHJh
aXNlIFJ1bnRpbWVFcnJvcigiY291bGRuJ3QgZmluZCBib290bG9hZGVyIGNvbmZpZyBmaWxlIGlu
IHRoZSBpbWFnZSBwcm92aWRlZC4iKQ0KICAgICAgICAgZiA9IGZzLm9wZW5fZmlsZShzZWxmLmNm
LmZpbGVuYW1lKQ0KKyAgICAgICAgZmVudiA9IHNlbGYuY2YuZmlsZW5hbWUucmVwbGFjZSgiZ3J1
Yi5jZmciLCJncnViZW52IikNCisgICAgICAgIGlmIGZlbnYgIT0gc2VsZi5jZi5maWxlbmFtZSBh
bmQgZnMuZmlsZV9leGlzdHMoZmVudik6DQorICAgICAgICAgICAgIyBpZiBncnViZW52IGZpbGUg
ZXhpc3RzIG5leHQgdG8gZ3J1Yi5jZmcgcHJlcGVuZCBpdA0KKyAgICAgICAgICAgIGZlbnZmID0g
ZnMub3Blbl9maWxlKGZlbnYpDQorICAgICAgICAgICAgaWYgc3lzLnZlcnNpb25faW5mb1swXSA8
IDM6DQorICAgICAgICAgICAgICAgIGZzZXAgPSAiXG4iDQorICAgICAgICAgICAgZWxzZToNCisg
ICAgICAgICAgICAgICAgZnNlcCA9IGIiXG4iDQorICAgICAgICAgICAgYnVmID0gZnNlcC5qb2lu
KChmZW52Zi5yZWFkKEZTX1JFQURfTUFYKSxmLnJlYWQoRlNfUkVBRF9NQVgpKSkNCisgICAgICAg
ICAgICBkZWwgZmVudmYNCiAgICAgICAgICMgbGltaXQgcmVhZCBzaXplIHRvIGF2b2lkIHBhdGhv
bG9naWNhbCBjYXNlcw0KLSAgICAgICAgYnVmID0gZi5yZWFkKEZTX1JFQURfTUFYKQ0KKyAgICAg
ICAgZWxzZToNCisgICAgICAgICAgICBidWYgPSBmLnJlYWQoRlNfUkVBRF9NQVgpDQogICAgICAg
ICBkZWwgZg0KICAgICAgICAgaWYgc3lzLnZlcnNpb25faW5mb1swXSA8IDM6DQogICAgICAgICAg
ICAgc2VsZi5jZi5wYXJzZShidWYpDQotLSANCjIuMjEuMA0KDQo=

--_002_alpineLFD22119081500550602807austen3home_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--_002_alpineLFD22119081500550602807austen3home_--

