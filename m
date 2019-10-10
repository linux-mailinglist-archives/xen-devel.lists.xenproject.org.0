Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C576D2D54
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 17:11:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIa2Q-0005L3-4o; Thu, 10 Oct 2019 15:07:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1ssr=YD=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1iIa2O-0005Ky-I9
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 15:07:32 +0000
X-Inumbo-ID: ae5fe016-eb6f-11e9-beca-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.83]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae5fe016-eb6f-11e9-beca-bc764e2007e4;
 Thu, 10 Oct 2019 15:07:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5u4sapA0V3hx1KkqiMjXfRUHvWpj3QqSoNOAlUm6Jdg4qs6U+6svu8wjOsm4qtzyTyVvinMntO99oVgBb4xQOIqmg81KtmMVKyt16xufQlPQ74y9ROGDBL62HFGocxzEjrF5ky+2YEB2e19ENk6zIvBcRsdoQBcKc4ArNPO/AA6jElbcc0CpaH9PvptN8AWCU4NyrH1kEBRxo+v+0lfXeX+we9i7tzXhcWZdH9RJEDwQdtT2bzQSen+Y2rFH3cN1Qqjz2toEYMQhLTgM/ptQZnULmyTfiYkfLl3VW/p7M2b10RXrKHs5UwGSyMnNCxSJ7LGOyqjOlFHQxIBQDxkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHUtSMhukJc8MPI7PNYdgxxFGb2d6M3d9oXTPhcKMe0=;
 b=oU6A25SxWnxRzqNpkmMBVKIz7pA0Tl6XAFd+EI1MHjbYg0tj4nRURKuEpzcILE/+qVsAJW7ZzQj6h95l8wOX15H0nvrx2AgaZiiaJFfARpcUWtbMzqB704ag/q4KSBm2D+EOyq7DO0a+xzOWUa++xof6muF3xryLhHQWKzpMjpSmK/KpN/sjoyF3/0yoIwqDLzYD737i78xSIY9Os4BMZmcDhLl1zkipurTont7Do6YEKPtwBhu+8ryNgRC2GSecQ8NFzN0/EOGBqjF2K4IwWs3DdqYnXA5aNnoq2LQDXkb5WYicddOfUpHCsSkg/BtWxy3fc9MKRYZxU+mr+rkkJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHUtSMhukJc8MPI7PNYdgxxFGb2d6M3d9oXTPhcKMe0=;
 b=ijfmouGkXFF3PaG3cWK2lSBatcfc4MWoAksjaY8BiHjrMKStLZHCTiYKXZHc9armguveTf67WEP0EcD/TVv5pTrNPv64ry+aAX8KgZAY6sw2oylpQAaV3sHX8xNCh3L7GnULBdIEfAYcBS9KL5rL7ZhlkI8hAw+jDInHTjt38Dc=
Received: from AM0PR03MB3748.eurprd03.prod.outlook.com (52.133.63.146) by
 AM0PR03MB3875.eurprd03.prod.outlook.com (52.135.148.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Thu, 10 Oct 2019 15:07:29 +0000
Received: from AM0PR03MB3748.eurprd03.prod.outlook.com
 ([fe80::99d3:769c:a5a5:43fd]) by AM0PR03MB3748.eurprd03.prod.outlook.com
 ([fe80::99d3:769c:a5a5:43fd%4]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 15:07:29 +0000
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH for-4.13] xen/xsm: flask: Prevent NULL
 deference in flask_assign_{, dt}device()
Thread-Index: AQHVetLnOcgJQSH9KE+B1/k9VstXPKdSO+mAgAHCB4CAAAVGAA==
Date: Thu, 10 Oct 2019 15:07:29 +0000
Message-ID: <36758c6eae0d9b4ebee42dec7b3387c449650885.camel@epam.com>
References: <20191004164243.30822-1-julien.grall@arm.com>
 <f262a8aeb67c6aabde80b1e6cdae6f19c077ff11.camel@epam.com>
 <5281ebd9-cc7e-64b4-3c88-3eaee64d3457@arm.com>
In-Reply-To: <5281ebd9-cc7e-64b4-3c88-3eaee64d3457@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Artem_Mygaiev@epam.com; 
x-originating-ip: [85.223.141.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29b0fa47-1847-4f6a-0452-08d74d9391d5
x-ms-traffictypediagnostic: AM0PR03MB3875:
x-microsoft-antispam-prvs: <AM0PR03MB3875EC22B94DF05EF75B8AAEF4940@AM0PR03MB3875.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(189003)(199004)(4326008)(446003)(6486002)(486006)(6436002)(229853002)(476003)(6512007)(86362001)(5660300002)(102836004)(11346002)(2616005)(8936002)(55236004)(53546011)(6506007)(2501003)(66066001)(99286004)(80792005)(4001150100001)(36756003)(14454004)(81166006)(81156014)(14444005)(256004)(76176011)(54906003)(6116002)(8676002)(118296001)(3846002)(478600001)(71200400001)(7736002)(71190400001)(305945005)(4744005)(76116006)(25786009)(66946007)(186003)(66556008)(66476007)(91956017)(26005)(66446008)(64756008)(6246003)(110136005)(2906002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3875;
 H:AM0PR03MB3748.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zkqf57pMUF1suCmgoy6ZZn1kBUVgNSZZ0jg8IXtZR6I3otEGW4j8cOucMvq1jagCZu8OHjdNfBZpY7yFVILU1taFjjgQs+PuU7z/bpW9dHrKc1e3mYIY0fz9T2QY/Kp6UaUQNsJEuzIkXjzEIMxEplZAAaswvbJHpj8PbaArB6/Rr9LEh051aNNI4KRq66CUQQfDjK3kG98AE5RmccbTjl30fLU903S6jDmGj1HbSRFL2M4Xdfm02+0TAlEFz9+ntnPACSU20wMMjUlRLcYOY1QBoJ8ixLYqJ9fWhrLCF2fEGgR2pnBmfSwZ+QFnh1rBXnPFuGkeKw/P4XRtNI8PceBN4mX29Lr1bRIf3oOhoVwTemFzm/BshoSBsGdy5Ri7RkDj+eB69DI/049tf47YN7lLGIx+kDWay2vjSmkkxbA=
x-ms-exchange-transport-forked: True
Content-ID: <665105B0E30FBC4AABF441D55257B043@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b0fa47-1847-4f6a-0452-08d74d9391d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 15:07:29.7173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zkYqnEd4b7HpBf5dTwq+xejzcxaoES4h+pl3AGSQ5TIF1gKQgKqnhzG12zJ9Ucf/rdfiKQKNcbj5/Q1MVrNkkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3875
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/xsm: flask: Prevent NULL
 deference in flask_assign_{, dt}device()
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "dgdegra@tycho.nsa.gov" <dgdegra@tycho.nsa.gov>, "paul@xen.org" <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIFRodSwgMjAxOS0xMC0xMCBhdCAxNTo0OCArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOg0KPiANCj4gT24gMDkvMTAvMjAxOSAxMjo1NywgQXJ0ZW0gTXlnYWlldiB3cm90ZToNCj4g
PiBIaSBKdWxpZW4NCj4gDQo+IEhpLA0KPiANCj4gPiBPbiBGcmksIDIwMTktMTAtMDQgYXQgMTc6
NDIgKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gPiA+IGZsYXNrX2Fzc2lnbl97LCBkdH1k
ZXZpY2UoKSBtYXkgYmUgdXNlZCB0byBjaGVjayB3aGV0aGVyIHlvdSBjYW4gdGVzdA0KPiA+ID4g
aWYNCj4gPiA+IGEgZGV2aWNlIGlzIGFzc2lnbmVkLiBJbiB0aGlzIGNhc2UsIHRoZSBkb21haW4g
d2lsbCBiZSBOVUxMLg0KPiA+ID4gDQo+ID4gPiBIb3dldmVyLCBmbGFza19pb21tdV9yZXNvdXJj
ZV91c2VfcGVybSgpIHdpbGwgYmUgY2FsbGVkIGFuZCBtYXkgZW5kDQo+ID4gPiB1cA0KPiA+ID4g
dG8gZGVmZXJlbmNlIGEgTlVMTCBwb2ludGVyLiBUaGlzIGNhbiBiZSBwcmV2ZW50ZWQgYnkgbW92
aW5nIHRoZSBjYWxsDQo+ID4gPiBhZnRlciB3ZSBjaGVjayB0aGUgdmFsaWRpdHkgZm9yIHRoZSBk
b21haW4gcG9pbnRlci4NCj4gPiA+IA0KPiA+ID4gQ292ZXJpdHktSUQ6IDE0ODY3NDENCj4gPiAN
Cj4gPiBUaGUgY29ycmVjdCBDSUQgaXMgMTQ4Njc0Mg0KPiANCj4gSG1tbSB5ZXMuIFRoZSBjb3Zl
cml0eSByZXBvcnQgZS1tYWlsIGlzIGEgYml0IGNvbmZ1c2luZyB0byByZWFkLg0KPiANCj4gSG93
ZXZlciwgSSBoYXZlIGFscmVhZHkgY29tbWl0dGVkIHRoZSBwYXRjaCBzbyB3ZSB3aWxsIGhhdmUg
dG8gbGVhdmUgd2l0aCBpdCA6KC4NCj4gDQoNCkkgZ3Vlc3MgdGhlIHNvbHV0aW9uIGNvdWxkIGJl
IHRvIGZpeCBhbm90aGVyIG9uZSBhbmQgbWFrZSBhIHByb3Blcg0KY29tbWl0IGNvbW1lbnQgd2l0
aCBjcm9zcy1yZWZlcmVuY2UgOikNCg0KPiBDaGVlcnMsDQo+IA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
