Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEE214638F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 09:33:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuXt9-00012q-Fj; Thu, 23 Jan 2020 08:30:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZfKj=3M=wdc.com=prvs=284315435=alistair.francis@srs-us1.protection.inumbo.net>)
 id 1iuXno-0000Kp-NN
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 08:25:25 +0000
X-Inumbo-ID: e0fc508a-3db9-11ea-9fd7-bc764e2007e4
Received: from esa4.hgst.iphmx.com (unknown [216.71.154.42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0fc508a-3db9-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1579767914; x=1611303914;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Q9wOCbNJZe1pclgwkhMZ++toq2A8/dr8582qC1nubg8=;
 b=EmY/HlOKjCBdh0oUJh5F+Om7FyiVHPbCFjlCgKt36gtGwSW3dEoVQp9N
 21zHL9OXL5O4b4AZAokkzzg5MGYsp+GL0CNQ7if0yePLvE6QKfLV9/MdB
 6ZqhIiAlwmu7H+7VwAcPExMM86Bkg/G3LbNewZwe9Rkg2XTwBmDrZOFOC
 Ks83Bf9GbgDudpWnwR8VG9LuestAwHFew1kdvjP7G6zQUXXnLY5b3mXhE
 vo/MSicO1qXAQ3QUT5qYnammmPKM/vny7lSAgTBsxvk3XIj9doYOsz4jv
 7e5EZd+cXr5tJrm2jpivJE1eI3vL97FkKU7LkoUW/lRsCmjGRf5OjHzzS g==;
IronPort-SDR: 0vgBKDxhOpKR3k/Ok4I1Sf4cvOdxodFK24UQctDSjaUUo/h0eQz2j8db9jxnSuMDDtqXsu2dbI
 wZ2/lfn+gHSJWjB/in2RIVIu5xVG0uw8VSAuWBFICdMRcyULmdOUJ7mfCnBtkUvbDw7vM8G9eK
 UcKuKomPp1aq/h91v+TWsmO+Ucc8HQIYcz/EsQHTOrWc2VqQ4cj/dnkHgJLpJodyTcYBYmoKWF
 6UGd3QoxTUaV0VZ4jceq9lw3pnU3yrYEFJK3iMA7EzYbL3JiU9fMZsnQ8s8dlni9zZpBHKiNQ6
 /38=
X-IronPort-AV: E=Sophos;i="5.70,353,1574092800"; d="scan'208";a="128249747"
Received: from mail-co1nam04lp2052.outbound.protection.outlook.com (HELO
 NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.52])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2020 16:25:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2l0sy5YPLx+UxNWpxdcrzLl+NkLk8cIi3hlUtPTO9fpM6OeMQgT6TVI/z74AtaMFCKYpWf24GHQIS++piGJtXJrWv8WE73aAMx6x8ZKpceZuFIdN3dOq89kssSNUGrcF+Jgklz4R3qb/LVma4w4R43Cs/jcucXIjtOkzkmdgbnNEQca8sXfxDxpcfo0lQykGUn/bLioX8VvUpX05jHeFHYZj/ddmZxXLubGpO9WEA/d6fsYDLfVEW0Pj4I4QYDrccvNCwqGTYBvmHdECb83jn9aUxyTjxRB9eUcQmvnvdNVWlE/MMYDItAsMaMxY3vALS6esRaugLslDUS169TPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9wOCbNJZe1pclgwkhMZ++toq2A8/dr8582qC1nubg8=;
 b=lcBJqGmPGo/hr9UZd/V/mzHW/SO3QNhxow/Hnbup3z8tda0chn80JlAUX86D527ZrgRm/V2Yb+E46odGoFaXDin3lKS4ENSubQpOBUnXigzyV6SIbrcd84hJiEg9winMhuY5RB5qOXnkzFOAgh7snlEfpmivjW8e/SnYRvU7Bwn9CAGOKflUD0YrbNqpBwTBsIcT9CVqdT8WR7XeGbNRE048bChS2ksKVLehs2dnwBbthSOUzQftrpVS1yZ9W8mb1nbEG374/Z6QtUVXH00ymgGU4CwdzeKamTqWJijnIlygsEJhF5nmlA8O9fhY+L5u4SettZLkfuoCgEykkhUsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9wOCbNJZe1pclgwkhMZ++toq2A8/dr8582qC1nubg8=;
 b=mmbpOzFtGN37s/5BuwmrWBrl7JGbTRGgL2imaZ0A+PIi1QaVwKCXPx9jdrG1oTR3OguN6j8KRZhbOU1DKPbkXeaIgXXfyWHiTPOH7/ZuzxSWLV23Yx+qNDnJRBZS3reycL8JJmZcWE9fWqf6IOXWm7rvtRV5hL2gXMBfgnDB5t4=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
 BYAPR04MB5831.namprd04.prod.outlook.com (20.179.58.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Thu, 23 Jan 2020 08:25:12 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
 ([fe80::9dd4:fb2d:7dc7:df87]) by BYAPR04MB4901.namprd04.prod.outlook.com
 ([fe80::9dd4:fb2d:7dc7:df87%7]) with mapi id 15.20.2644.028; Thu, 23 Jan 2020
 08:25:12 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "bobbyeshleman@gmail.com" <bobbyeshleman@gmail.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC XEN PATCH 00/23] xen: beginning support for RISC-V
Thread-Index: AQHV0MezYzwz2WaUv0S6mwDeUU8q0qf2xw6AgAEkoYA=
Date: Thu, 23 Jan 2020 08:25:11 +0000
Message-ID: <bad6fccb97ae5cf03d2845aa77c5e1af61be48bc.camel@wdc.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
In-Reply-To: <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 08cdccbf-39cb-4d9d-943d-08d79fddc405
x-ms-traffictypediagnostic: BYAPR04MB5831:
x-microsoft-antispam-prvs: <BYAPR04MB58317C309BBA0B191F6D75DC900F0@BYAPR04MB5831.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 029174C036
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(189003)(199004)(2616005)(26005)(6512007)(54906003)(186003)(86362001)(8936002)(81166006)(6506007)(8676002)(53546011)(81156014)(5660300002)(7416002)(2906002)(36756003)(478600001)(71200400001)(66946007)(316002)(4326008)(110136005)(64756008)(66476007)(66556008)(6486002)(76116006)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5831;
 H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PxlCKAtd9lxKkX9BzQlCinF0zl+xLdrCVkGpTFYIyVlS9KtJVbl/252Xaq3IViv/tnO+S1m8qZdET4b7mcLQbbLjcUsf3oshX2l2TI0IZ/SkzOwEQ02LB5diDbMdupBQ8Q8opu9Ue4JBqiJawBI0HR/OyoczBWHxfFYmC2cL2VeUjkU3FJHIYu87hYW5xJ9rbwLlB/RA6ZtMaXmi7D8Np6c69FuQ1RgqPNFQVJm1WMCyjvDKFP5jDX0lWf/WU6xFjFRC1poFdD+eHMRB6iW7+Cpco08eH7xGWYVWr01kDKqM9qU2uv5w6wlYh0VgYVH3hqr0xZPsoY2ePHkYgsDmqt6XUAFQymTQO6vuWoThUs2rGQF9EILethG0XR4HT4f1H0b4gSJvy9Nzuryo5j8YtqM3RLX6t1hJhI0FQSYKJzzz8sLD8Jj/lrolKzaXKdC4
x-ms-exchange-transport-forked: True
Content-ID: <6762A5D346F5DC4BA1A4BAB72843ADCD@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cdccbf-39cb-4d9d-943d-08d79fddc405
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2020 08:25:12.0234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HwF8GliBhM8QusM4K/khi3qZ5gZrPiPlK8ss/OcnNzn8hiPydnFmTata4SJcHBCacSp0rsDkzTuj5WXPuaQT5BlqJWz0ShgMwbz1mkIATI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5831
X-Mailman-Approved-At: Thu, 23 Jan 2020 08:30:54 +0000
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
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
Cc: "dan@dlrobertson.com" <dan@dlrobertson.com>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "bobby.eshleman@starlab.io" <bobby.eshleman@starlab.io>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDIwLTAxLTIyIGF0IDE0OjU3ICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAyMi8wMS8yMDIwIDAxOjU4LCBCb2JieSBFc2hsZW1hbiB3cm90ZToNCj4gPiBIZXkgZXZl
cnlib2R5LA0KPiA+IA0KPiA+IFRoaXMgaXMgYW4gUkZDIHBhdGNoc2V0IGZvciB0aGUgdmVyeSBi
ZWdpbm5pbmdzIG9mIGFkZGluZyBSSVNDLVYNCj4gPiBzdXBwb3J0DQo+ID4gdG8gWGVuLiAgVGhp
cyBSRkMgaXMgcmVhbGx5IGp1c3QgdG8gc3RhcnQgYSBkaWFsb2d1ZSBhYm91dA0KPiA+IHN1cHBv
cnRpbmcNCj4gPiBSSVNDLVYgYW5kIGFsaWduIHdpdGggdGhlIFhlbiBwcm9qZWN0IGFuZCBjb21t
dW5pdHkgYmVmb3JlIGdvaW5nDQo+ID4gZnVydGhlci4gIEZvciB0aGF0IHJlYXNvbiwgaXQgaXMg
dmVyeSByb3VnaCBhbmQgdmVyeSBpbmNvbXBsZXRlLiANCj4gPiANCj4gPiBNeSBuYW1lIGlzIEJv
YmJ5IEVzaGxlbWFuLCBJJ20gYSBzb2Z0d2FyZSBlbmdpbmVlciBhdA0KPiA+IFN0YXIgTGFiIC8g
V2luZCBSaXZlciBvbiB0aGUgQVJNIHRlYW0sIG1vc3RseSBoYXZpbmcgd29ya2VkIGluIHRoZQ0K
PiA+IExpbnV4DQo+ID4ga2VybmVsLiAgSSd2ZSBhbHNvIGJlZW4gaW52b2x2ZWQgYSBnb29kIGFt
b3VudCB3aXRoIFhlbiBvbiBBUk0NCj4gPiBoZXJlLA0KPiA+IG1vc3RseSBkZWFsaW5nIHdpdGgg
dG9vbGluZywgZGVwbG95bWVudCwgYW5kIHRlc3RpbmcuICBBIGxvdCBvZg0KPiA+IHRoaXMNCj4g
PiBwYXRjaHNldCBpcyBoZWF2aWx5IGluc3BpcmVkIGJ5IHRoZSBYZW4vQVJNIHNvdXJjZSBjb2Rl
DQo+ID4gKHBhcnRpY3VsYXJseQ0KPiA+IHRoZSBlYXJseSBzZXR1cCB1cCBjb2RlKS4NCj4gPiAN
Cj4gPiBDdXJyZW50bHksIHRoaXMgcGF0Y2hzZXQgcmVhbGx5IG9ubHkgc2V0cyB1cCB2aXJ0dWFs
IG1lbW9yeSBmb3IgWGVuDQo+ID4gYW5kDQo+ID4gaW5pdGlhbGl6ZXMgVUFSVCB0byBlbmFibGUg
cHJpbnQgb3V0cHV0LiAgTm9uZSBvZiBSSVNDLVYncw0KPiA+IHZpcnR1YWxpemF0aW9uIHN1cHBv
cnQgaGFzIGJlZW4gaW1wbGVtZW50ZWQgeWV0LCBhbHRob3VnaCB0aGF0IGlzDQo+ID4gdGhlDQo+
ID4gbmV4dCByb2FkIHRvIHN0YXJ0IGdvaW5nIGRvd24uICBNYW55IGZ1bmN0aW9ucyBvbmx5IGNv
bnRhaW4gZHVtbXkNCj4gPiBpbXBsZW1lbnRhdGlvbnMuICBNYW55IHNob3J0Y3V0cyBoYXZlIGJl
ZW4gdGFrZW4gYW5kIFRPRE8ncyBoYXZlDQo+ID4gYmVlbg0KPiA+IGxlZnQgYWNjb3JkaW5nbHku
ICBJdCBpcyB2ZXJ5LCB2ZXJ5IHJvdWdoLiAgQmUgZm9yZXdhcm5lZDogeW91IGFyZQ0KPiA+IHF1
aXRlDQo+ID4gbGlrZWx5IHRvIHNlZSBzb21lIHVuZ2Fpbmx5IGNvZGUgaGVyZSAoZGVzcGl0ZSBt
eSBlZmZvcnRzIHRvIGNsZWFuDQo+ID4gaXQgdXANCj4gPiBiZWZvcmUgc2VuZGluZyB0aGlzIHBh
dGNoc2V0IG91dCkuICBNeSBpbnRlbnQgd2l0aCB0aGlzIFJGQyBpcyB0bw0KPiA+IGFsaWduDQo+
ID4gZWFybHkgYW5kIGdhdWdlIGludGVyZXN0LCBhcyBvcHBvc2VkIHRvIHByZXNlbnRpbmcgYSB0
b3RhbGx5DQo+ID4gY29tcGxldGUNCj4gPiBwYXRjaHNldC4NCj4gPiANCj4gPiBCZWNhdXNlIHRo
ZSBBUk0gYW5kIFJJU0MtViB1c2UgY2FzZXMgd2lsbCBsaWtlbHkgYmVhciByZXNlbWJsYW5jZSwN
Cj4gPiB0aGUNCj4gPiBSSVNDLVYgcG9ydCBzaG91bGQgcHJvYmFibHkgcmVzcGVjdCB0aGUgZGVz
aWduIGNvbnNpZGVyYXRpb25zIHRoYXQNCj4gPiBoYXZlDQo+ID4gYmVlbiBsYWlkIG91dCBhbmQg
cmVzcGVjdGVkIGJ5IFhlbiBvbiBBUk0gZm9yIGRvbTBsZXNzLCBzYWZldHkNCj4gPiBjZXJ0aWZp
Y2F0aW9uLCBldGMuLi4gIE15IGluY2xpbmF0aW9uIGhhcyBiZWVuIHRvIGluaXRpYWxseSB0YXJn
ZXQNCj4gPiBvcg0KPiA+IHByaW9yaXRpemUgZG9tMGxlc3MgKHdpdGhvdXQgZXhjbHVkaW5nIGRv
bTBmdWxsKSBhbmQgdXNlIHRoZSBBUk0NCj4gPiBkb20wbGVzcyBpbXBsZW1lbnRhdGlvbiBhcyBh
IG1vZGVsIHRvIGZvbGxvdy4gIEknZCBsb3ZlIGZlZWRiYWNrIG9uDQo+ID4gdGhpcw0KPiA+IHBv
aW50IGFuZCBvbiBob3cgdGhlIFhlbiBwcm9qZWN0IG1pZ2h0IGVudmlzaW9uIGEgUklTQy1WDQo+
ID4gaW1wbGVtZW50YXRpb24uDQo+ID4gDQo+ID4gVGhpcyBwYXRjaHNldCBoYXMgX3NvbWVfIGNv
ZGUgZm9yIGZ1dHVyZSBzdXBwb3J0IGZvciAzMi1iaXQsIGJ1dA0KPiA+IGN1cnJlbnRseSBteSBm
b2N1cyBpcyBvbiA2NC1iaXQuDQo+ID4gDQo+ID4gQWdhaW4sIHRoaXMgaXMgYSB2ZXJ5LCB2ZXJ5
IHJvdWdoIGFuZCB0b3RhbGx5IGluY29tcGxldGUNCj4gPiBwYXRjaHNldC4gIE15DQo+ID4gZ29h
bCBoZXJlIGlzIGp1c3QgdG8gZ2F1Z2UgY29tbXVuaXR5IGludGVyZXN0LCBiZWdpbiBkaXNjdXNz
aW5nDQo+ID4gd2hhdCBYZW4NCj4gPiBvbiBSSVNDLVYgbWF5IGxvb2sgbGlrZSwgcmVjZWl2ZSBm
ZWVkYmFjaywgYW5kIHNlZSBpZiBJJ20gaGVhZGluZw0KPiA+IGluIHRoZQ0KPiA+IHJpZ2h0IGRp
cmVjdGlvbi4NCj4gPiANCj4gPiBNeSBiaWcgcXVlc3Rpb25zIGFyZToNCj4gPiAJRG9lcyB0aGUg
WGVuIHByb2plY3QgaGF2ZSBpbnRlcmVzdCBpbiBSSVNDLVY/DQo+IA0KPiBUaGVyZSBpcyB2ZXJ5
IGxhcmdlIGRvd25zdHJlYW0gaW50ZXJlc3QgaW4gUklTQy1WLiAgU28gYSBkZWZpbml0ZQ0KPiB5
ZXMuDQo+IA0KPiA+IAlXaGF0IGNhbiBiZSBkb25lIHRvIG1ha2UgdGhlIFJJU0MtViBwb3J0IGFz
IHVwc3RyZWFtYWJsZSBhcw0KPiA+IAkJcG9zc2libGU/DQo+ID4gCUFueSBtYWpvciBwaXRmYWxs
cz8NCj4gPiANCj4gPiBJdCB3b3VsZCBiZSBncmVhdCB0byBoZWFyIGFsbCBvZiB5b3VyIGZlZWRi
YWNrLg0KPiANCj4gQm90aCBSSVNDLVYgYW5kIFBvd2VyOSBhcmUgZnJlcXVlbnRseSByZXF1ZXN0
ZWQgdGhpbmdzLCBhbmQgYm90aA0KPiBzdWZmZXINCj4gZnJvbSB0aGUgZmFjdCB0aGF0LCB3aGls
ZSB3ZSBhcyBhIGNvbW11bml0eSB3b3VsZCBsaWtlIHRoZW0sIHRoZQ0KPiB1cHN0cmVhbSBpbnRl
cnNlY3Rpb24gb2YgInBlb3BsZSB3aG8ga25vdyBYZW4iIGFuZCAicGVvcGxlIHdobyBrbm93DQo+
IGVub3VnaCBhcmNoICRYIHRvIGRvIGFuIGluaXRpYWwgcG9ydCIgaXMgMC4NCj4gDQo+IFRoaXMg
c2VyaWVzIGNsZWFybHkgZGVtb25zdHJhdGVzIGEgY2hhbmdlIGluIHRoZSBzdGF0dXMgcXVvLCBh
bmQgSQ0KPiB0aGluaw0KPiBhIGxvdCBvZiBwZW9wbGUgd2lsbCBiZSBoYXBweS4NCj4gDQo+IFRv
IGdldCBSSVNDLVYgdG8gYmVpbmcgZnVsbHkgc3VwcG9ydGVkLCB3ZSB3aWxsIHVsdGltYXRlbHkg
bmVlZCB0bw0KPiBnZXQNCj4gaGFyZHdhcmUgaW50byB0aGUgQ0kgc3lzdGVtLCBhbmQgYW4gZWFz
eSB3YXkgZm9yIGRldmVsb3BlcnMgdG8gdGVzdA0KPiBjaGFuZ2VzLiAgRG8geW91IGhhdmUgYW55
IHRob3VnaHRzIG9uIHByb2R1Y3Rpb24gUklTQy1WIGhhcmR3YXJlDQo+IChpZGVhbGx5IHNlcnZl
ciBmb3JtIGZhY3RvcikgZm9yIHRoZSBDSSBzeXN0ZW0sIGFuZC9vciBkZXYgYm9hcmRzDQo+IHdo
aWNoDQo+IG1pZ2h0IGJlIGF2YWlsYWJsZSBmYWlybHkgY2hlYXBseT8NCg0KQUZBSUsgdGhpcyBp
cyBhd2hpbGUgb2ZmLiBUaGUgSHlwZXJ2aXNvciBzcGVjIGlzIHN0aWxsIGluIGEgZHJhZnQgc3Rh
dGUNCihleHBlY3RpbmcgdG8gYmUgZnJvemVuIHRoaXMgeWVhcikgc28gcmlnaHQgbm93IFFFTVUg
aXMgdGhlIG9ubHkNCm9wdGlvbi4NCg0KQWxpc3RhaXINCg0KPiANCj4gSG93IG11Y2ggdGltZSBk
byB5b3UgaGF2ZSB0byBwdXQgdG93YXJkcyB0aGUgcG9ydD8gIElzIHRoaXMgc29tZXRoaW5nDQo+
IGluDQo+IHlvdXIgZnJlZSB0aW1lLCBvciBzb21ldGhpbmcgeW91IGFyZSBkb2luZyBhcyBwYXJ0
IG9mIHdvcms/IA0KPiBVbHRpbWF0ZWx5LA0KPiB3ZSBhcmUgZ29pbmcgdG8gbmVlZCB0byBpbmNy
ZWFzZSB0aGUgbGV2ZWwgb2YgUklTQy1WIGtub3dsZWRnZSBpbiB0aGUNCj4gY29tbXVuaXR5IHRv
IG1haW50YWluIHRoaW5ncyBpbiB0aGUgZnV0dXJlLg0KPiANCj4gT3RoZXIgdGhhbiB0aGF0LCB2
ZXJ5IFJGQyBzZXJpZXMgYXJlIGVudGlyZWx5IGZpbmUuICBBIGdvb2QgZmlyc3QNCj4gc3RlcA0K
PiB3b3VsZCBiZSBzaW1wbHkgdG8gZ2V0IHRoZSBidWlsZCB3b3JraW5nLCBhbmQgZ2V0IHNvbWUg
a2luZCBvZg0KPiBjcm9zcy1jb21waWxlIGJ1aWxkIGluIENJLCB0byBtYWtlIHN1cmUgdGhhdCB3
ZSBkb24ndCBjbG9iYmVyIHRoZQ0KPiBSSVNDLVYNCj4gYnVpbGQgd2l0aCBjb21tb24gb3Igb3Ro
ZXItYXJjaCBjaGFuZ2VzLg0KPiANCj4gSSBob3BlIHRoaXMgaGVscHMuDQo+IA0KPiB+QW5kcmV3
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
