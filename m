Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418791F7EE6
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2020 00:27:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjs9A-00071A-OV; Fri, 12 Jun 2020 22:27:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jjs99-000714-7W
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 22:27:35 +0000
X-Inumbo-ID: e8a5cfc6-acfb-11ea-8496-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.52]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8a5cfc6-acfb-11ea-8496-bc764e2007e4;
 Fri, 12 Jun 2020 22:27:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8wE5PIIcjnrnBa5qCRO/jWdkesSwAOYUztS0JA1Wzr9m+OjLt310MbJn3+qjlD1B0hxTLzLloH6LunF5j6NLEt2dekJgXHGc1o/2Y7kP6mSARnUgbNNjsG6gWqM7OvnFfuEmrmIHjAMj3LZOmqyvwhPmOz+7zhg5XYwfvo3+Qzzx2mc0UW8xcpsDT+q2YfpIXG3N99BMFmbp4du9z1pdJvkxKh4cx1xHEzZpm7l1PweSvzHyiW+UzuYxfBjDiUyk0s8vp4cHZjvcwIPXYF+j7hhOA1wIrUYHH+PtEBdL/SSBOV0WVAyFzdozcY7Igi3RkgoPD6wuKy8KFDGpPCWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CX7rNOWmTwqIS4t0nZcNAiKNmekxJymKS62aZAzJS1E=;
 b=X0FOqdItB0Wm2XnCx2ts01kyXerKIkRfbWQ2ogIyhUj1385f982trBgQMe6Yoa1I0mDknuF4DZiGX1Vz+H4CEPCeGauyoNlBFbsYIiSu1mX0szBkVfQGjlydpXzp9blCwuEPVReEElM+PeWiVw8L89KAWw3V7p8Wz817BeZDvQiLqy6ko2RLJ3/N0qMZmyF+YUMZX86lBZtn7N0KqeheUprrd+b5a8pt8yfkWT9bv8Rmm31YifmQdtwqBHCO6afVtgS9rIQwIlnDzeOTbaC4/5zQb0ivuswQpTNlbtd2eGmXk8rmKwHU6HEHS3O5TiURCZpLNQt7LxbaXecwg1wt0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CX7rNOWmTwqIS4t0nZcNAiKNmekxJymKS62aZAzJS1E=;
 b=c7GZH7TN3vhMv751iOxH6DDle50+Uxskq+NKGG4N2X6fBFzHhKNVB3A40jnt7eovFA0C+G3BgA2aQLm5NUh05YvZAceYPMrpbegSCr+yU6x0bJT2DVDq/N2sh48dUksuBTLWvJnSGbPUB6xrfbU7Y9W3Qte8eJGs/J7wPBsuyJrknVqiP7rcL/D++JmHltiDOska3Fxwt3MpR9Q7LSeOPIRNYujsvC33voYSrZtQzQY7KttsfEkk2B6Cxr2wnelLHqyJzdL8UNjWwd20+N9ygHWqO2HLY2N7vExj6Z3+RLRVueRmY/BVmFoUXVDHA41f+SpsfkWXTrWLmIt8F7e9Fg==
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB3341.eurprd03.prod.outlook.com
 (2603:10a6:803:25::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Fri, 12 Jun
 2020 22:27:32 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3088.025; Fri, 12 Jun 2020
 22:27:32 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "dfaggioli@suse.com" <dfaggioli@suse.com>, "jgross@suse.com"
 <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Topic: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Index: AQHWQE+Tib/gTK49mk6bUudd1VvXZqjUa0CAgAB+fACAAANFAIAALvMAgAB0vgA=
Date: Fri, 12 Jun 2020 22:27:31 +0000
Message-ID: <bb2449e47c3bb97b004dac8b58123aba8452ccaf.camel@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-5-volodymyr_babchuk@epam.com>
 <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
 <88eac035-8769-24f7-45e6-11a1c4739ccb@xen.org>
 <a5d7bbe8-a9ff-1396-bd7f-3b6143bddac7@suse.com>
 <78910b5c27a3711726d53e931feb075c5cc4a64c.camel@suse.com>
In-Reply-To: <78910b5c27a3711726d53e931feb075c5cc4a64c.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9223f21-e098-4302-28c2-08d80f1fcc63
x-ms-traffictypediagnostic: VI1PR0302MB3341:
x-microsoft-antispam-prvs: <VI1PR0302MB3341E6AEEFE179A2056DEE2AE6810@VI1PR0302MB3341.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BT2KpsWyjUhN4jT0C1ZHBfu6LpaS324KBZcspMGDrf3wCCMcuwbdn7XrP7Z8S6vluC7RjgcTMzsFk8kbkGYkG46oYN0U+X8JmaG/a3leuCzBVZtNFLQ5R+lRhS6YEbWOlqzAq06diauAe+UO8ke7VaSceo9SJzk1PfkjAMjjouUV0MBmloUWPjgZDZV4eCuYGJABGm99EUwx0IG5PWESJSEcUlup7CtlpS8N9FjonzGwjYJSeOF0Sv4aneCMwwxSeH0qalYcVwN7Ks8cKAsX3NPu35tcXG95s6aXaeSrMTfuAEw8g2PHI5pNrrwFqzCooRmuYpTrQ4N607f+ntLS6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(2616005)(54906003)(66574014)(36756003)(186003)(316002)(478600001)(83380400001)(86362001)(4326008)(110136005)(6512007)(5660300002)(71200400001)(6506007)(66556008)(66476007)(55236004)(76116006)(91956017)(66446008)(64756008)(26005)(7416002)(66946007)(2906002)(6486002)(53546011)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: DG+z4yymIVNgz66BONdykFWKsh+gZ04diMzVaAHNsBO9YQ+kqooEHFrIZ9Oy7BMx8NQkjzrp4fdgnvMUzVBdy3o0r6Vx6JTN2BDTu7XPquT8u4kN3Dog1M2NwFsXKL+11nCDh/erioOjKdNBqgxemiqq9HjrSEVZwqi/uKLFN5o+Je4aiDVuwxTWb3Hzwa6lBz+WS7lmRPxXE9ovvv0Zdt6HSIJIcjcwhh4aLiCDgRffUGDaGyRwGZEwpWkBeShp5uvDZNstvzg5egyR3BW5EnxnJcCiq/uLYk8dNKqrVLwg0NeSkZ/Pe4sA55po/fH2VG97kKWQpNAZCQTI4K+HS8pffRIJxYuL6YarKs2CoIUfTc/yAQDji/J7AzlCvPej3S93viUhgkDLRYs8mLNVg/0KQi5IlnO/iRSN5mnLBlC9PXQnQ3oe00uG/1NEViJMevw7g/Ke3bcYXcPXsgGiXUtsyYsJGmzmInxxNYVOOnsr7pX1JJWZGYJTEuNeMp2/
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4336E91F02C45E498A0B6603F2224509@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9223f21-e098-4302-28c2-08d80f1fcc63
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 22:27:31.9409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ytZxDGSgKij9EQhWN/SI9Q9wVcErvSsaBhqVes7a9iYRx5HJzBGfJPfSnaHnU1LLoUGRkIIf6UMhndzEOy4rroDO8fxTASEYCUgUTyV/BYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3341
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDIwLTA2LTEyIGF0IDE3OjI5ICswMjAwLCBEYXJpbyBGYWdnaW9saSB3cm90ZToN
Cj4gT24gRnJpLCAyMDIwLTA2LTEyIGF0IDE0OjQxICswMjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3Rl
Og0KPiA+IE9uIDEyLjA2LjIwIDE0OjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4gPiBPbiAx
Mi8wNi8yMDIwIDA1OjU3LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPiA+ID4gPiBPbiAxMi4wNi4y
MCAwMjoyMiwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+ID4gPiA+ID4gQEAgLTk5NCw5ICs5
OTgsMjIgQEAgc190aW1lX3Qgc2NoZWRfZ2V0X3RpbWVfY29ycmVjdGlvbihzdHJ1Y3QgDQo+ID4g
PiA+ID4gc2NoZWRfdW5pdCAqdSkNCj4gPiA+ID4gPiAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+
ID4gPiA+ICAgICAgIH0NCj4gPiA+ID4gPiArICAgIHNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZF9z
dGF0X2xvY2ssIGZsYWdzKTsNCj4gPiA+ID4gPiArICAgIHNjaGVkX3N0YXRfaXJxX3RpbWUgKz0g
aXJxOw0KPiA+ID4gPiA+ICsgICAgc2NoZWRfc3RhdF9oeXBfdGltZSArPSBoeXA7DQo+ID4gPiA+
ID4gKyAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZF9zdGF0X2xvY2ssIGZsYWdzKTsN
Cj4gPiA+ID4gDQo+ID4gPiA+IFBsZWFzZSBkb24ndCB1c2UgYSBsb2NrLiBKdXN0IHVzZSBhZGRf
c2l6ZWQoKSBpbnN0ZWFkIHdoaWNoIHdpbGwNCj4gPiA+ID4gYWRkDQo+ID4gPiA+IGF0b21pY2Fs
bHkuDQo+ID4gPiANCj4gPiA+IElmIHdlIGV4cGVjdCBzY2hlZF9nZXRfdGltZV9jb3JyZWN0aW9u
IHRvIGJlIGNhbGxlZCBjb25jdXJyZW50bHkNCj4gPiA+IHRoZW4gd2UgDQo+ID4gPiB3b3VsZCBu
ZWVkIHRvIGludHJvZHVjZSBhdG9taWM2NF90IG9yIGEgc3BpbiBsb2NrLg0KPiA+IA0KPiA+IE9y
IHdlIGNvdWxkIHVzZSBwZXJjcHUgdmFyaWFibGVzIGFuZCBhZGQgdGhlIGNwdSB2YWx1ZXMgdXAg
d2hlbg0KPiA+IGZldGNoaW5nIHRoZSB2YWx1ZXMuDQo+ID4gDQo+IFllcywgZWl0aGVyIHBlcmNw
dSBvciBhdG9taWMgbG9va3MgbXVjaCBiZXR0ZXIgdGhhbiBsb2NraW5nLCB0byBtZSwgZm9yDQo+
IHRoaXMuDQoNCkxvb2tzIGxpa2Ugd2UgZ29pbmcgdG8gaGF2ZSBhdG9taWM2NF90IGFmdGVyIGFs
bC4gU28sIEknbGwgcHJlZmVyIHRvIHRvDQp1c2UgYXRvbWljcyB0aGVyZS4NCg==

