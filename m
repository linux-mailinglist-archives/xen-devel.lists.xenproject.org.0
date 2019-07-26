Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E8E76613
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:42:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzVy-0000qV-Mq; Fri, 26 Jul 2019 12:40:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcV=VX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hqzVx-0000jb-DG
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 12:40:01 +0000
X-Inumbo-ID: 78b01ce6-afa2-11e9-ae25-4f053e6bc323
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.87]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78b01ce6-afa2-11e9-ae25-4f053e6bc323;
 Fri, 26 Jul 2019 12:39:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+6R0CPIeGcxtTdmfyVqHsZwrAmuMIs5vSfy6emmYzKwSTlL8X3RbiCalOAZVpoctHojKJI6lqtmI/Qz5XKb9llVHbKse6K+TeswvBnz7gHeoSmKhpwLhRq/nyaFN73B2TKfTmLsOK7wrtilXkC0Jc3jrEk2kD4YLKFEZRebYwDQVgCnTpuDMOgBTlygV+cW38QATiiXSFvLF+pNGXwYDBiEPLM+l+l1nDvGSfylVxCbuN29j9Nj3Gjlayc6gcn+BtSSMfrhhNK1W027sb48TDZt+ij4IeL411e7QmI8a/Ih8jbkaH+RL++CsLcQGPUFUZz/KrgzzcB8PKXIQ1PItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2NZia1pPDUriGStJgTWAOu0pX35sZdx/rA+U54qkLw=;
 b=XqAIXS6sU9/i7B5jWdVArIub/N3FnBQBetuKGQpjf/rDV0OBK+Q79CMQoxeULFNtkc+SMJrvQZC+BfvYOsWV/1O//KP6WWmOl7poo1JGtf1mEl1FyFEbJPqK7Xx9pt9KsWowY87iL6Xb8Zuv+nzQY92sT4F4lZx48kD8C91Dm6s8l4gURw3AMumCmBfQ0hMy5fP1cVy4qExLGAbVLcaM+8MxlJtxRxFQiSpONffmSr4WXecQSurry81em3g5sIYwSqzKePcG5+bUMEK7KvJaq/nJNwolETYJsbB12DHoJNiDM+oPBaFXWy1Fnjs5B6vFaIZLSJwBsgMNKyhnBNQLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2NZia1pPDUriGStJgTWAOu0pX35sZdx/rA+U54qkLw=;
 b=A04nVrG1cabf2yGZQLA+0nepmYgcEX35Ng98bhDk5YcUDrtwtTMYiGWiuOkZiXnW6VM+rq/Iy3Ni59hHbQlwPQ4y0WQmSWKvDU/pSTTV3pKmJHTr3DaAwQLPPNeWE2tPzbmGu9vFA9A+lxCilBeY1RvUoF37htYHPg2kOMxExux9Y9ee9ElIUy9guzoY7ryNCHbx6oNPDJ9aICnv+8/WH14fc+osiwQZ+W+ai6w7BMX0O9iliWC4BIiiYb4liYMi4YRt0ZSmxTppZLo0oz8vOwwlqd7NY//I53mhiNgYmBaaukab3Uct7xQBMywMiSAivgIijn2U2/DgVUFR9a+nLg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4914.eurprd03.prod.outlook.com (20.178.82.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Fri, 26 Jul 2019 12:39:54 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 12:39:54 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 6/7] xen/arm: vsmc: The function identifier is always
 32-bit
Thread-Index: AQHVQZ6lsgh58N9rYkqF8h5QSg2aJ6bc2zSA
Date: Fri, 26 Jul 2019 12:39:54 +0000
Message-ID: <87k1c5hsva.fsf@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-7-julien.grall@arm.com>
In-Reply-To: <20190723213553.22300-7-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e2d26f7-026b-41dd-3aec-08d711c65c4b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4914; 
x-ms-traffictypediagnostic: AM0PR03MB4914:|AM0PR03MB4914:
x-microsoft-antispam-prvs: <AM0PR03MB49146A4C411D92E2AD9EF79FE6C00@AM0PR03MB4914.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(199004)(189003)(316002)(229853002)(25786009)(186003)(305945005)(8676002)(54906003)(80792005)(55236004)(81166006)(81156014)(6512007)(6116002)(11346002)(7736002)(486006)(36756003)(4326008)(446003)(478600001)(5660300002)(2616005)(256004)(53936002)(476003)(91956017)(86362001)(71200400001)(6246003)(3846002)(14454004)(99286004)(26005)(107886003)(8936002)(2906002)(71190400001)(102836004)(6436002)(68736007)(76176011)(66556008)(66946007)(66446008)(64756008)(66476007)(6506007)(66066001)(6486002)(76116006)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4914;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ic/MN3XRLfb0no42DTxFQvBEuAIYGv1q/8nS+4rovz7O/rnzhl5VJFsEpGGaXpETK4J73I7KNWfXY4kBZCrFnWG4p6JVjP+NirzRP0ugf744bsIAUbRye1CRH5cvYV4ned1d5hbkpKqFl/F5iYIrSqWM1JuC5gQgDicNLG6IrDuysvwY6sgMqSwPAnXQJDe3OG60asIVSAZtqcVdiyL4xUGMyIhMAa2T0tVcjLjWLK6kW1FO0ZID41q0gCQu5tnjHZr6l+Yuh5j4fXswaR0bkO6DEPkFspuFtibgTq4fIoq/FHaa0dWMx9Z1f+9EkWSXw4TFL5+BuHOJx/Nfws6sGPH0E+5Sui4GCeOuuHARwNWHKUxsShphgJnqwk/RVbAK07elAbTwRSCka4sUa/x3C8E0uLCPZGAbwTwu1vqYRJg=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2d26f7-026b-41dd-3aec-08d711c65c4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 12:39:54.4716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4914
Subject: Re: [Xen-devel] [PATCH 6/7] xen/arm: vsmc: The function identifier
 is always 32-bit
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIEFybTY0LCB0aGUgU01DQ0MgZnVuY3Rpb24gaWRl
bnRpZmllciBpcyBhbHdheXMgc3RvcmVkIGluIHRoZSBmaXJzdCAzMi1iaXQKPiBvZiB4MCByZWdp
c3Rlci4gVGhlIHJlc3Qgb2YgdGhlIGJpdHMgYXJlIG5vdCBkZWZpbmVkIGFuZCBzaG91bGQgYmUK
PiBpZ25vcmVkLgo+Cj4gVGhpcyBtZWFucyB0aGUgdmFyaWFibGUgZnVuY2lkIHNob3VsZCBiZSBh
biB1aW50MzJfdCByYXRoZXIgdGhhbgo+IHJlZ2lzdGVyX3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogVm9sb2R5bXly
IEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKPiAtLS0KPiAgeGVuL2FyY2gv
YXJtL3ZzbWMuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92c21jLmMgYi94ZW4v
YXJjaC9hcm0vdnNtYy5jCj4gaW5kZXggZjhlMzUwMzExZC4uYTM2ZGIxNWZmZiAxMDA2NDQKPiAt
LS0gYS94ZW4vYXJjaC9hcm0vdnNtYy5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3ZzbWMuYwo+IEBA
IC0yMjAsNyArMjIwLDcgQEAgc3RhdGljIGJvb2wgdnNtY2NjX2hhbmRsZV9jYWxsKHN0cnVjdCBj
cHVfdXNlcl9yZWdzICpyZWdzKQo+ICB7Cj4gICAgICBib29sIGhhbmRsZWQgPSBmYWxzZTsKPiAg
ICAgIGNvbnN0IHVuaW9uIGhzciBoc3IgPSB7IC5iaXRzID0gcmVncy0+aHNyIH07Cj4gLSAgICBy
ZWdpc3Rlcl90IGZ1bmNpZCA9IGdldF91c2VyX3JlZyhyZWdzLCAwKTsKPiArICAgIHVpbnQzMl90
IGZ1bmNpZCA9IGdldF91c2VyX3JlZyhyZWdzLCAwKTsKPiAgCj4gICAgICAvKgo+ICAgICAgICog
Q2hlY2sgaW1tZWRpYXRlIHZhbHVlIGZvciBIVkMzMiwgSFZDNjQgYW5kIFNNQzY0Lgo+IEBAIC0y
ODYsNyArMjg2LDcgQEAgc3RhdGljIGJvb2wgdnNtY2NjX2hhbmRsZV9jYWxsKHN0cnVjdCBjcHVf
dXNlcl9yZWdzICpyZWdzKQo+ICAKPiAgICAgIGlmICggIWhhbmRsZWQgKQo+ICAgICAgewo+IC0g
ICAgICAgIGdwcmludGsoWEVOTE9HX0lORk8sICJVbmhhbmRsZWQgU01DL0hWQzogJTA4IlBSSXJl
Z2lzdGVyIlxuIiwgZnVuY2lkKTsKPiArICAgICAgICBncHJpbnRrKFhFTkxPR19JTkZPLCAiVW5o
YW5kbGVkIFNNQy9IVkM6ICUjeFxuIiwgZnVuY2lkKTsKPiAgCj4gICAgICAgICAgLyogSW5mb3Jt
IGNhbGxlciB0aGF0IGZ1bmN0aW9uIGlzIG5vdCBzdXBwb3J0ZWQuICovCj4gICAgICAgICAgc2V0
X3VzZXJfcmVnKHJlZ3MsIDAsIEFSTV9TTUNDQ19FUlJfVU5LTk9XTl9GVU5DVElPTik7CgoKLS0g
ClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
