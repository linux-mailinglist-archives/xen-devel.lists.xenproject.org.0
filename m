Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA0C99F1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 10:34:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFwW2-0003sH-CZ; Thu, 03 Oct 2019 08:31:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hg9p=X4=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1iFwW0-0003sC-Pw
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 08:31:12 +0000
X-Inumbo-ID: 272ee8ba-e5b8-11e9-9720-12813bfff9fa
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.80]) by localhost (Halon) with ESMTPS
 id 272ee8ba-e5b8-11e9-9720-12813bfff9fa;
 Thu, 03 Oct 2019 08:31:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5NhtN+hW1b1j+hkf7h2dG7svJnKVZFtaID3zxZdRX6uhqdevrl6R7HklcVEegoEaprXFxVIyFPP8Bflu3UzTAGIbhpV38FYWOEmZOd8fstdovhkHpVKgiNgHW1uS16VBUKX/KSw5MJBMSgOjv67hl9ZS2stdkagH/yINqmJwna4jXCUd2jcHhzI2vVulUGDNIGqYHm+Wf/4YUoEBh21ATrdjFDb9RWSveAO8F0fe4SGmF+Rq5qBxr6jSs3qRFPKp7KPTvxtIEE8GnR3WSGbfeyCn6vdbssGyBcbErZWKeNMAA2wLU3BQAF/MGY8ntXJCZ8iylSiVFizjBbiA1qUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSvL8P3x3q0OtB2LIlBfzF2GI5OXYz5xGT7ojpiOst8=;
 b=Ez4UxjCKGwBsSPkie3AGlDfyH/4RR+FJyIMq0GZ0G1UVenQDOu8mQCdIGbh1PtaCVpFuzStNNYm3/t2Tn5ozFce45hMnEnNTnLkY2ibBqTBOxdSZIOEBMUZjtENvgGtUw0nVyHx4ogz52WnbXl4AeVbTVJK74c9Dlq25xcdLgyvrJiJvH9vZb0+qmRPFpWkM4gOIP6zY3yuE+2M+K3LrXsx6y5gCNMyvWQyHd57Rmkpe6iBPCMe/GkcolJ1xC5DS5SoTPYLoFjDUg4NRu6G8eAM8+YuaXFeN3f2CH+13iyMQCvYipAMIOf6T7RXjLjf0B02Tm0djzZDmGTE91WdL+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSvL8P3x3q0OtB2LIlBfzF2GI5OXYz5xGT7ojpiOst8=;
 b=iDfZRHVwLDiag39oEiLnYuw6VopgPbPLrIYQYIquDcdCfJpd3ghMX8Yhsai8tDb/a2fXvNLr+B6WDLUNXgyVbzVN7EcOXumj1chI7d6hExI/KbgHbRS4Vl5p7sNRKavmRmT1vyEB2P8sXhE3IZhTY6WpiChj+pVPHU1yPoOmWCc=
Received: from AM0PR03MB3748.eurprd03.prod.outlook.com (52.133.63.146) by
 AM0PR03MB4434.eurprd03.prod.outlook.com (20.177.40.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 08:31:09 +0000
Received: from AM0PR03MB3748.eurprd03.prod.outlook.com
 ([fe80::213a:7113:aafb:21fd]) by AM0PR03MB3748.eurprd03.prod.outlook.com
 ([fe80::213a:7113:aafb:21fd%3]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 08:31:09 +0000
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH for-4.13 0/6] xen/arm: Add support to build with clang
Thread-Index: AQHVeUtXulsyKnCw3kq84v3Y6/ovqqdIlzmA
Date: Thu, 3 Oct 2019 08:31:09 +0000
Message-ID: <5e24b4dda53fa2455cb94af8a0cd61ba9e14ace8.camel@epam.com>
References: <20191002180047.17144-1-julien.grall@arm.com>
In-Reply-To: <20191002180047.17144-1-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Artem_Mygaiev@epam.com; 
x-originating-ip: [194.53.196.52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8421ad93-7f2d-47b7-5d91-08d747dc0af5
x-ms-traffictypediagnostic: AM0PR03MB4434:|AM0PR03MB4434:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB44340CF95F62CAA1F5F4CC0DF49F0@AM0PR03MB4434.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(39850400004)(136003)(199004)(189003)(53754006)(3846002)(6116002)(14454004)(229853002)(25786009)(486006)(86362001)(118296001)(476003)(446003)(66066001)(99286004)(6512007)(2501003)(6436002)(11346002)(14444005)(256004)(2616005)(6486002)(110136005)(71190400001)(71200400001)(6246003)(64756008)(66446008)(8936002)(7736002)(305945005)(80792005)(54906003)(186003)(26005)(4326008)(5660300002)(102836004)(91956017)(66946007)(66556008)(76176011)(2906002)(478600001)(66476007)(76116006)(36756003)(316002)(8676002)(81166006)(81156014)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4434;
 H:AM0PR03MB3748.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dbjIXNHQMUgttDEipiZtJeg6WpU98me1y8bjh46mXLdvcTrEPsYhfOvkO8rdaZhy1SnlX9xOZHz2/6txc6QWXFsFodKLZxhqJv/trmLSa5Piult6JmQZwzh6XalCtU5yN4JP43muYYbELRqdBfWv6LAGlkwU9epKt39Afix7D5LrsPYGowmXSnnw+FQAe2QXCHW451gEO9dVM1jycd+u8OD6pcBWdYW2Y9SgCK8KRlkpuoci9V5qih3Sx/zSu/GdjAomae1xX+yWCNTCj38PQnumtVf2kDCjnaq/SC+a0gwvQI79QYb7lXe+kbbGghy2BLOI46x6XiuXLK5wCWb0LIgq2ol/Dzf+M/lUiwO4Rge0TlLdDTvA3S/wG1+zwHDm0J+EWn8FqeSN4iUzU71SfC1Cgm7VK/DiHcEieOVnyFI=
Content-ID: <9C9EF278D5BE0A498F1D6A3C7EEEFEBC@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8421ad93-7f2d-47b7-5d91-08d747dc0af5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 08:31:09.7015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rcgKNeDlG84NKVXcev4bugaxpZaYUy0AjOEst3yHDetcDded4qGAynFYnD02qvfAjlYRV2IFrm5CvOPNHgJqhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4434
Subject: Re: [Xen-devel] [PATCH for-4.13 0/6] xen/arm: Add support to build
 with clang
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
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuDQoNCkp1c3QgdG8gY29uZmlybSAtIHdpdGggdGhpcyBzZXJpZXMsIHdlIGFyZSBh
YmxlIHRvIHJ1biB4ZW4gbWFzdGVyDQooNC4xMy11bnN0YWJsZSkgb24gUi1DYXIgSDM6DQogKiBi
dWlsdCB1c2luZyBjbGFuZw0KICogYnVpbHQgdXNpbmcgY2xhbmctYmFzZWQgYXJtIGNvbXBpbGVy
ICh3aXRoIGZ1cnRoZXIgbW9kaWZpY2F0aW9ucw0KbmVlZGVkIGZvciBhcm1saW5rKQ0KDQpOb3Rl
IHdlIGRpZG4ndCBwZXJmb3JtIGZ1bGwgdGVzdGluZywganVzdCBzdGFydCB4ZW4gb24gaXRzIG93
bi4NCg0KIC0tIEFydGVtDQoNCk9uIFdlZCwgMjAxOS0xMC0wMiBhdCAxOTowMCArMDEwMCwgSnVs
aWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBhbGwsDQo+IA0KPiBBZnRlciB0aGlzIHNlcmllcywgSSBh
bSBhYmxlIHRvIGJ1aWxkIFhlbiBvbiBBcm02NCB3aXRoIGNsYW5nIDcuMC4NCj4gVGhlcmUNCj4g
YXJlIHN0aWxsIHNvbWUgaXNzdWVzIHdoZW4gYnVpbGRpbmcgWGVuIG9uIEFybTMyIGFuZCBhbHNv
IHVzaW5nIGxsZC4NCj4gDQo+IENyb3NzLWNvbXBpbGF0aW9uIGlzIGxlZnQgb3V0c2lkZSBmb3Ig
bm93LCBidXQgdGhpcyBpcyBzdGlsbCBhIGdvb2QNCj4gc3RhcnQNCj4gZm9yIGNsYW5nIChhbmQg
YXJtY2xhbmcpLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gSnVsaWVuIEdyYWxsICg2KToNCj4gICB4
ZW4vYXJtOiBmaXggZ2V0X2NwdV9pbmZvKCkgd2hlbiBidWlsdCB3aXRoIGNsYW5nDQo+ICAgeGVu
L2FybTY0OiBiaXRvcHM6IE1hdGNoIHRoZSByZWdpc3RlciBzaXplIHdpdGggdGhlIHZhbHVlIHNp
emUgaW4NCj4gZmxzbA0KPiAgIHhlbi9hcm06IGNwdWVycmF0YTogTWF0Y2ggcmVnaXN0ZXIgc2l6
ZSB3aXRoIHZhbHVlIHNpemUgaW4NCj4gICAgIGNoZWNrX3dvcmthcm91bmRfKg0KPiAgIHhlbi9h
cm06IGNwdWZlYXR1cmU6IE1hdGNoIHJlZ2lzdGVyIHNpemUgd2l0aCB2YWx1ZSBzaXplIGluDQo+
ICAgICBjcHVzX2hhdmVfY29uc3RfY2FwDQo+ICAgeGVuL2FybTogbW06IE1hcmsgY2hlY2tfbWVt
b3J5X2xheW91dF9hbGlnbm1lbnRfY29uc3RyYWludHMgYXMNCj4gdW51c2VkDQo+ICAgeGVuL2Fy
bTogdHJhcHM6IE1hcmsgY2hlY2tfc3RhY2tfYWxpZ25tZW50X2NvbnN0cmFpbnRzIGFzIHVudXNl
ZA0KPiANCj4gIHhlbi9hcmNoL2FybS9tbS5jICAgICAgICAgICAgICAgICAgfCAgMyArKy0NCj4g
IHhlbi9hcmNoL2FybS90cmFwcy5jICAgICAgICAgICAgICAgfCAgMyArKy0NCj4gIHhlbi9pbmNs
dWRlL2FzbS1hcm0vYXJtNjQvYml0b3BzLmggfCAgMyArKy0NCj4gIHhlbi9pbmNsdWRlL2FzbS1h
cm0vY3B1ZXJyYXRhLmggICAgfCAgNCArKy0tDQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZl
YXR1cmUuaCAgIHwgIDQgKystLQ0KPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9jdXJyZW50LmggICAg
ICB8IDEwICsrKysrKysrKy0NCj4gIDYgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkNCj4gDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
