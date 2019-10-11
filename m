Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3214D3DBD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 12:52:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIsUI-0002Il-Kz; Fri, 11 Oct 2019 10:49:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UON9=YE=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1iIsUH-0002Ig-4D
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 10:49:33 +0000
X-Inumbo-ID: cd1d90d6-ec14-11e9-9330-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd1d90d6-ec14-11e9-9330-12813bfff9fa;
 Fri, 11 Oct 2019 10:49:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AW1tmbsbnj6xls9rg/8oBBI2ClFzcQ8gTK4eDwl72R6lHnW41/2x3eJlYWUNRqt34Nkf9j8mbGNVqsA/mIYrmC652Y4nJzo1kggbICrxYCgVoPoRZ/jyn6MQ6H9z2vx27brKkMrKmr/FnAme8ldEgrtEhrwORG+9vPqweZVc6d4KG/hL7ZYVRpJ/uThN/I4tCkamIIsEDX+rZA6ap5dGA+C5+cM4hs3HvKvhuYfOaLY+paLGi/zmE+XiEqI+6J/wu5x0uXSrpcojAAv5EtnRpj1ahrNpjVCR91XkgmKu00NuSjgf3VeklnzPIaY/KC+hLM4j1mX4JPxF1SHkUIEqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mt3fwfRi+pPtLLjlVyDEJF86S6l2IYZ23pGcSf2xjQ=;
 b=U73hmrWNiPkUu7flRVPaqcBlYY1h2DjqvaGHNtA/MxzN1iDQVgF5pECpmLATi4HnHP07z4JYMQvUdI/vfJb62MsII5kyzCTVUUGMVvVLYN7O8vvJnIeFvg8VcwJ7YE0nfJxKTT30dut6um0cLfxmicJoQSF7//ecH2jArvoIZhTBvFbg0OJTkokZWZYrSuokJ6k1f+0JKj3tgcmlTMmhj7Ys5+ajSRH19DUhSrtG9jqqzeiQuMY36RbZI6nMg8eoIDX6y6BlFJgUKbP7gfoepZQBH6P+PHpIWjthmzdtOaHG+9Zsmq8hk7Ndo241OIDpnU7x9tIJpG54Hdxqphuu2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mt3fwfRi+pPtLLjlVyDEJF86S6l2IYZ23pGcSf2xjQ=;
 b=c1aboX81ibG4+6tuC9UBp0IbG/TAOzgzKJOQeewPNXYyK2Rnbk/AJy7uiCj6IukxAVn+5zr/C+HYzTYnNa+V6Wpzf+lJQMQa1G93yXRo4TbHQBpsPpvOH7x6vCZWubYLeVDxS1F4xYSl7b5pYIGx1YltDzxHE83TrUs+Pm45TGc=
Received: from AM0PR03MB3748.eurprd03.prod.outlook.com (52.133.63.146) by
 AM0PR03MB3553.eurprd03.prod.outlook.com (52.133.63.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 11 Oct 2019 10:49:29 +0000
Received: from AM0PR03MB3748.eurprd03.prod.outlook.com
 ([fe80::99d3:769c:a5a5:43fd]) by AM0PR03MB3748.eurprd03.prod.outlook.com
 ([fe80::99d3:769c:a5a5:43fd%4]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 10:49:29 +0000
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: "lars.kurth@citrix.com" <lars.kurth@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC] Documentation formats, licenses and file system structure
Thread-Index: AQHVf2cRdQE5+PIufEarnRjQ6zCVf6dVRE0A
Date: Fri, 11 Oct 2019 10:49:29 +0000
Message-ID: <ca381fbbfde3447ca5b2ce2033efb8b733c52ccd.camel@epam.com>
References: <F3EDAC03-A573-4E60-8D0C-8D84949E796B@citrix.com>
In-Reply-To: <F3EDAC03-A573-4E60-8D0C-8D84949E796B@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Artem_Mygaiev@epam.com; 
x-originating-ip: [194.53.196.52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50b53122-60e2-4bca-0ead-08d74e38b141
x-ms-traffictypediagnostic: AM0PR03MB3553:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <AM0PR03MB355346E4F46994FD523DA941F4970@AM0PR03MB3553.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(189003)(199004)(6512007)(229853002)(76116006)(66556008)(8676002)(66476007)(6306002)(91956017)(25786009)(6436002)(6486002)(118296001)(64756008)(66066001)(66946007)(305945005)(4001150100001)(7736002)(80792005)(66446008)(110136005)(2501003)(316002)(14454004)(86362001)(256004)(2906002)(99286004)(36756003)(5660300002)(966005)(486006)(6506007)(102836004)(8936002)(11346002)(81166006)(3846002)(4326008)(81156014)(6246003)(6116002)(76176011)(71200400001)(186003)(71190400001)(478600001)(26005)(2616005)(446003)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3553;
 H:AM0PR03MB3748.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CDj3ILevrov2Cvg3Ce+j40nfPP2zDr40KEjPeOEWsb3fIkTbqsOguKZfGJRZJpJXqU273gkjYA5IBNH5J5EzJ16Ee5uA46WPbRGLhCBFN8YHEI+jlRQDGg/yhelQG2j5uGSQuAJVsIGVumOhSbFk++bBEozt5NVLE9r63i1gPB9kQPncKdF5DsPboIl7D88PUFOz48YeZCwQqeJTGaFesVG8RoYrPZGEAPjCwZ3B0uKSMkhQRxs121QT1Pn/mV8JpEdb4+PDdKE8uOvBzdJYtPPNERJmaip5lbjgCLxDzQ6C1wkgk8e74j7+46LnxPaRzeckcbRONgg41mKT4Z+Dg6so+GjZJwodjW32qwh7MErp9EyZFwBnVmMBvNtIpwW7GUKltBmXQ3yBOTNiGVp/ecX8meEqpWUrusyLfqBZFJngVVvQFKgU3Yxt3HYmQk/ji0bebxOibe1e+VYCg4XmBg==
x-ms-exchange-transport-forked: True
Content-ID: <51C74F373F9BBD4680C196E00188EC5F@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b53122-60e2-4bca-0ead-08d74e38b141
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 10:49:29.4370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TlZwL19x1/2QekCoFWgVnntcS7jsjz9pZXoJWFmF4o3Loi/qGd1fvanNu8BpmTh+uTgMVoib9QaYWGb19Hp0pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3553
Subject: Re: [Xen-devel] [RFC] Documentation formats,
 licenses and file system structure
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
Cc: "committers@xenproject.org" <committers@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycw0KDQpPbiBUaHUsIDIwMTktMTAtMTAgYXQgMTI6MzQgKzAwMDAsIExhcnMgS3VydGgg
d3JvdGU6DQo+ICogUG9zc2libHkgc3R1ZmYgc3VjaCBhcyANCj4gaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8veGVuYml0cy54ZW4ub3JnL2RvY3MvdW5zdGFibGUvc3VwcG9ydC1t
YXRyaXguaHRtbF9fOyFLNmRtR0NFYWI0dWVKZyFsd0F3WUppN2NVa2JYN0NVWG5PRDlpN2xhal85
eGN5YWZGNzE0dTZQTzA0dHUwQ1lVS0RIV0JIQXkyWEQwbXZFaUEkDQo+ICAgKHdoaWNoIGlzIGN1
cnJlbnRseSBHUEwtMiwNCj4gICAgYnV0IHdlIGNvdWxkIHJlbGljZW5zZSB0byBzYXkgR1BMLTIg
YW5kIENDLUJZLTQgaWYgd2UgaGFkIHRvKQ0KPiBUaGUgaW1wbGljYXRpb24gaXMgdGhhdCB0aGUg
c3BoaW54IGRvY3Mgd291bGQgbm90IGJlIGZ1bGx5IENDLUJZLTQsDQo+IGJ1dCB0aGUgYnVsayBv
ZiB0aGUgcGFnZXMgd291bGQgYmUNCj4gDQo+ICogV291bGQgd2UgZXZlciBpbmNsdWRlIEFQSSBk
b2NzIGdlbmVyYXRlZCBmcm9tIEdQTHYyIGNvZGU/IEUuZy4gZm9yDQo+IHNhZmV0eSB1c2UtY2Fz
ZXM/DQo+IEBTdGVmYW5vLCBAQXJ0ZW06IEkgZ3Vlc3MgdGhpcyBvbmUgaXMgZm9yIHlvdS4gDQo+
IEkgc3VwcG9zZSBpZiB3ZSB3b3VsZCBoYXZlIGEgc2ltaWxhciBpc3N1ZSBmb3IgYSBzYWZldHkg
bWFudWFsDQo+IEkgYW0gYWxzbyBhc3N1bWluZyB3ZSB3b3VsZCB3YW50IHRvIHVzZSBzcGhpbngg
ZG9jcyBhbmQgcnN0IHRvDQo+IGdlbmVyYXRlIGEgZnV0dXJlIHNhZmV0eSBtYW51YWwNCj4gDQoN
ClllcywgSSB0aGluayB3ZSB3aWxsIGhhdmUgdG8gdXNlIHNvbWUgQVBJIGRvY3MgaW4gc2FmZXR5
IHJlbGF0ZWQNCmRvY3VtZW50YXRpb24uIEJ1dCBJIGRvIG5vdCBzZWUgYW55IGlzc3VlIHdpdGgg
dGhhdCBiZWNhdXNlIHVzaW5nDQoiZGVzY3JpcHRpb24iIHBhcnQgb2YgaGVhZGVycyBpbiBkb2N1
bWVudGF0aW9uIGNhbiBiZSB0cmVhdGVkIGFzICJmYWlyDQp1c2UiIGFuZCB0aHVzIHdpbGwgbm90
IGNyZWF0ZSBhIGxpY2Vuc2UgY29uZmxpY3QgYXMgY29uZmlybWVkIGluIA0KaHR0cHM6Ly93d3cu
Z251Lm9yZy9saWNlbnNlcy9ncGwtZmFxLmVuLmh0bWwjU291cmNlQ29kZUluRG9jdW1lbnRhdGlv
bg0KDQogLS0gQXJ0ZW0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
