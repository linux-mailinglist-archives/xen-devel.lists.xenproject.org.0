Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445381DE29E
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:09:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc3g8-0002gK-TR; Fri, 22 May 2020 09:09:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=de5w=7E=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jc3g7-0002gF-93
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:09:19 +0000
X-Inumbo-ID: ea548afc-9c0b-11ea-ae69-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea548afc-9c0b-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 09:09:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcZi4PqRHOmUL0cH9zEctVXORqZyRB3eQTjh0+9upJhspmodIyPuPvuEecNUyRO7jM5cKGNQnVcd7vMzUqTwA/pK/48bAWyU9C6b/cmJuPu04qUKTe8REf5n1qeQojrwe06RDtst4KyxtF4IgLx5FColn48CQqi+8wwXyHCWwFyMSiOq2p+wY8Q2N7zDpW3zc81gpb6DVL3NojykdiKermokTwluZMnVjV6lms9c6pD1BiFR2vUPRy3WWj2RRsBw1fZNoZQ0u3d5GnxcmUC3PuIRhFx9OVKDlrMpTylBfg90ZrUS5PQ/S8PtdUs7CC+VtxKweneZ/dSsVuzuwsgocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUkDOpjBQ1w1/LQCwIUaJ8oAJ006qfQg6XBe7g8l6ws=;
 b=OMM7Dr6KDYUCQdWLgVmmwdjsNQTWWi1/q6tgZbPGKC1L4X9DRdCDwyEAaiezPHUAmoTEz1JavDnBVVKgDcM7gOrWTyifnCWebwJhH6CLAgpMVAdQfCAEfVl3wPRTepfQ8+V5d6o9hMOLJc9WArAHtJFupFr8IvrjKzENWmQC+PtXPZJEkB/CR+ndYM59rGJ84JW5YOe9EqaO15NJQeZrbL0oWauP2SU9ozdJO6Pb9eMbxaiOGzK9IEm5LWbzGiIeWXApUCNay5pf3GN2WO08CXzIgfgIp6DAV5i1QriCA6LH/uzaax3I7osS6qrG1LlPzOPMuxeYJ233nllgvFVx1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUkDOpjBQ1w1/LQCwIUaJ8oAJ006qfQg6XBe7g8l6ws=;
 b=B6PXOm2XuAbicPUJJcCGqv9H06TVUn9l0AJ1CSIkb8NM8NL8g3Uzx8/6LFuv4PkFe6GQ40ty3UDx3U5s77oI8DxuHGFmbxIOl67YIQiLUnLjMWNOYc8q4AYgdpap32J5GBWNnXAk4e9lU3plJfIhr59ORX9KcyMrG4zWm9CJMpU=
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB3134.eurprd03.prod.outlook.com (2603:10a6:802:31::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Fri, 22 May
 2020 09:09:16 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4%7]) with mapi id 15.20.3021.027; Fri, 22 May 2020
 09:09:15 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Denis Kirjanov <kda@linux-powerpc.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] public/io/netif.h: add a new extra type for XDP
Thread-Topic: [PATCH v4] public/io/netif.h: add a new extra type for XDP
Thread-Index: AQHWMBiqME7497+04E6+8Omw+GVY7Q==
Date: Fri, 22 May 2020 09:09:15 +0000
Message-ID: <696ee8f6-f44b-35c3-2c9f-676cb9e5ad95@epam.com>
References: <1589814292-1789-1-git-send-email-kda@linux-powerpc.org>
In-Reply-To: <1589814292-1789-1-git-send-email-kda@linux-powerpc.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-powerpc.org; dkim=none (message not signed)
 header.d=none; linux-powerpc.org; dmarc=none action=none header.from=epam.com; 
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbd70c54-893e-4cb8-86a7-08d7fe2fcd0c
x-ms-traffictypediagnostic: VI1PR03MB3134:
x-microsoft-antispam-prvs: <VI1PR03MB31343D6A3A126505ED4733B7E7B40@VI1PR03MB3134.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:660;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z1xySATVrV0r0Rb/vNDmfLmRZ0S8gYupzYyIb6Ff5pFTNxjBfUJmCOpK7N9AomQWPyRFRZ5fb4VBW/QgLcr7mKtcQiGIv5S2wMFjmxjxyXjR2uPCtz3yKG1VvaJ4+WmAHZnkisUD1TANGbLiOy5X5/OtuG+gRxaKukhWQPYKOccGFhYvF9CTXQg+LLa+Obj2IJud5vvKlVs3WyvJW6uG95FYb0XTR1xWpG/NKJ6f9QgKNFteaH0P4dSMwz+lEbqkULkHnzbvpcYADh9cztdSfW2C3vNupRokzXTI5M7d5i16j/qY4OUz57gdAH1h8U9a3NFnayrhhCxq9vdUPgn6W9IAddWRUwi4zMY/lq5i74ARkDDzX5LzKhWlT8JaBb+ThB/DvoTFxmAON7D+OnKazBQM0ZgvDdqla1BgxV0RRTlldnmEJsEXJeo0d+jtSP7o
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(6512007)(86362001)(31686004)(36756003)(66476007)(2616005)(26005)(316002)(53546011)(66556008)(186003)(66946007)(66446008)(6506007)(110136005)(64756008)(71200400001)(76116006)(31696002)(4326008)(478600001)(54906003)(8676002)(8936002)(5660300002)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: G4M3FxUBUQvEUvMu3v9Iqc2sQ16ojLu8uflHNlOP/1SdrhcA76AVMfGK+cA3hvnYSu130dOeV7FX5cWwRGGdnkUwZaAKmDE7iMbTILhh0wLYk56MnFnuPK04DH2ICdX19slustGCG2j1WYRbq9zXWnv3l9bBYLFQMvi6okJybZmB6hClT3Z/c4/AVxzJbMQvWE+kFsd3+2FS3R8RSw5pZYdntTk87+N2bCywdCU7FykghgQXKda/evNywScaFZuwujnMgy2/j4Qsc7RrrY4eLRVuxK4Mbv43P7f6eUYzsCh5dqa6hShu0k3t2jTMnxq0hVQRIeYh17tf7PjUx/9ExjX8QZj0FC8ongwG4kXpmFjqxSJrpQwE2oXbDOUtNnibjTij3GigrnwBGLF3sqykHKG+Y5Xgjsqvi4zmCQmmiNiMnQsELoaAN3RqPWEI/ji2nabrbJ4yi3xuiMykCE5BsRST+eORCWgKY88MA65oPMo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF5905AD4337CB478C258972088D1AF0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd70c54-893e-4cb8-86a7-08d7fe2fcd0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 09:09:15.1983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PgYs5YBp8ASFcWtgKv14YJ/x6LO6GBZKnq29RDjs5eJJGyWvEA78GtHVW7J7HVi/kVa8TWrHWx005qGAIWwJmqgwrTmr7hyFauZEgw7DUGZIsaVGysaqhlbEQAK2gNIY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3134
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "jgross@suse.com" <jgross@suse.com>, "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8xOC8yMCA2OjA0IFBNLCBEZW5pcyBLaXJqYW5vdiB3cm90ZToNCj4gVGhlIHBhdGNoIGFk
ZHMgYSBuZXcgZXh0cmEgdHlwZSB0byBiZSBhYmxlIHRvIGRpZmZpcmVudGlhdGUNCj4gYmV0d2Vl
biBSWCByZXNwb25zZXMgb24geGVuLW5ldGZyb250IHNpZGUgd2l0aCB0aGUgYWRqdXN0ZWQgb2Zm
c2V0DQo+IHJlcXVpcmVkIGZvciBYRFAgcHJvY2Vzc2luZy4NCj4NCj4gVGhlIG9mZnNldCB2YWx1
ZSBmcm9tIGEgZ3Vlc3QgaXMgcGFzc2VkIHZpYSB4ZW5zdG9yZS4NCj4NCj4gU2lnbmVkLW9mZi1i
eTogRGVuaXMgS2lyamFub3YgPGRlbmlzLmtpcmphbm92QHN1c2UuY29tPg0KPiAtLS0NCj4gdjQ6
DQo+IC0gdXBkYXRlZCB0aGUgY29tbWl0IGFuZCBkb2N1bWVuYXRpb24NCj4NCj4gdjM6DQo+IC0g
dXBkYXRlZCB0aGUgY29tbWl0IG1lc3NhZ2UNCj4NCj4gdjI6DQo+IC0gYWRkZWQgZG9jdW1lbnRh
dGlvbg0KPiAtIGZpeGVkIHBhZGRpbmcgZm9yIG5ldGlmX2V4dHJhX2luZm8NCj4gLS0tDQo+IC0t
LQ0KPiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9pby9uZXRpZi5oIHwgMTggKysrKysrKysrKysrKysr
KystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4NCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9uZXRpZi5oIGIveGVuL2lu
Y2x1ZGUvcHVibGljL2lvL25ldGlmLmgNCj4gaW5kZXggOWZjZjkxYS4uYTkyYmYwNCAxMDA2NDQN
Cj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2lvL25ldGlmLmgNCj4gKysrIGIveGVuL2luY2x1
ZGUvcHVibGljL2lvL25ldGlmLmgNCj4gQEAgLTE2MSw2ICsxNjEsMTcgQEANCj4gICAgKi8NCj4g
ICANCj4gICAvKg0KPiArICogInhkcC1oZWFkcm9vbSIgaXMgdXNlZCB0byByZXF1ZXN0IHRoYXQg
ZXh0cmEgc3BhY2UgaXMgYWRkZWQNCj4gKyAqIGZvciBYRFAgcHJvY2Vzc2luZy4gIFRoZSB2YWx1
ZSBpcyBtZWFzdXJlZCBpbiBieXRlcyBhbmQgcGFzc2VkIGJ5DQoNCm5vdCBzdXJlIHRoYXQgd2Ug
c2hvdWxkIHVzZSB3b3JkICJieXRlcyIgaGVyZSBhcyB0aGUgcmVzdCBvZiB0aGUgDQpwcm90b2Nv
bCAobW9zdGx5KQ0KDQp0YWxrcyBhYm91dCBvY3RldHMuIEl0IGlzIHNvbWV3aGF0IG1peGVkIGhl
cmUsIG5vIHN0cm9uZyBvcGluaW9uDQoNCj4gKyAqIHRoZSBmcm9udGVuZCB0byBiZSBjb25zaXN0
ZW50IGJldHdlZW4gYm90aCBlbmRzLg0KPiArICogSWYgdGhlIHZhbHVlIGlzIGdyZWF0ZXIgdGhh
biB6ZXJvIHRoYXQgbWVhbnMgdGhhdA0KPiArICogYW4gUlggcmVzcG9uc2UgaXMgZ29pbmcgdG8g
YmUgcGFzc2VkIHRvIGFuIFhEUCBwcm9ncmFtIGZvciBwcm9jZXNzaW5nLg0KPiArICoNCj4gKyAq
ICJmZWF0dXJlLXhkcC1oZWFkcm9vbSIgaXMgc2V0IHRvICIxIiBieSB0aGUgbmV0YmFjayBzaWRl
IGxpa2Ugb3RoZXIgZmVhdHVyZXMNCj4gKyAqIHNvIGEgZ3Vlc3QgY2FuIGNoZWNrIGlmIGFuIFhE
UCBwcm9ncmFtIGNhbiBiZSBwcm9jZXNzZWQuDQo+ICsgKi8NCj4gKw0KPiArLyoNCj4gICAgKiBD
b250cm9sIHJpbmcNCj4gICAgKiA9PT09PT09PT09PT0NCj4gICAgKg0KPiBAQCAtOTg1LDcgKzk5
Niw4IEBAIHR5cGVkZWYgc3RydWN0IG5ldGlmX3R4X3JlcXVlc3QgbmV0aWZfdHhfcmVxdWVzdF90
Ow0KPiAgICNkZWZpbmUgWEVOX05FVElGX0VYVFJBX1RZUEVfTUNBU1RfQUREICgyKSAgLyogdS5t
Y2FzdCAqLw0KPiAgICNkZWZpbmUgWEVOX05FVElGX0VYVFJBX1RZUEVfTUNBU1RfREVMICgzKSAg
LyogdS5tY2FzdCAqLw0KPiAgICNkZWZpbmUgWEVOX05FVElGX0VYVFJBX1RZUEVfSEFTSCAgICAg
ICg0KSAgLyogdS5oYXNoICovDQo+IC0jZGVmaW5lIFhFTl9ORVRJRl9FWFRSQV9UWVBFX01BWCAg
ICAgICAoNSkNCj4gKyNkZWZpbmUgWEVOX05FVElGX0VYVFJBX1RZUEVfWERQICAgICAgICg1KSAg
LyogdS54ZHAgKi8NCj4gKyNkZWZpbmUgWEVOX05FVElGX0VYVFJBX1RZUEVfTUFYICAgICAgICg2
KQ0KPiAgIA0KPiAgIC8qIG5ldGlmX2V4dHJhX2luZm9fdCBmbGFncy4gKi8NCj4gICAjZGVmaW5l
IF9YRU5fTkVUSUZfRVhUUkFfRkxBR19NT1JFICgwKQ0KPiBAQCAtMTAxOCw2ICsxMDMwLDEwIEBA
IHN0cnVjdCBuZXRpZl9leHRyYV9pbmZvIHsNCj4gICAgICAgICAgICAgICB1aW50OF90IGFsZ29y
aXRobTsNCj4gICAgICAgICAgICAgICB1aW50OF90IHZhbHVlWzRdOw0KPiAgICAgICAgICAgfSBo
YXNoOw0KPiArICAgICAgICBzdHJ1Y3Qgew0KPiArICAgICAgICAgICAgdWludDE2X3QgaGVhZHJv
b207DQp3aHkgZG8geW91IG5lZWQgInBhZCIgZmllbGQgaGVyZT8NCj4gKyAgICAgICAgICAgIHVp
bnQxNl90IHBhZFsyXQ0KPiArICAgICAgICB9IHhkcDsNCj4gICAgICAgICAgIHVpbnQxNl90IHBh
ZFszXTsNCj4gICAgICAgfSB1Ow0KPiAgIH07

