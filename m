Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037554DD434
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 06:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291857.495672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV56a-0000JQ-Qn; Fri, 18 Mar 2022 05:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291857.495672; Fri, 18 Mar 2022 05:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV56a-0000Gl-No; Fri, 18 Mar 2022 05:24:52 +0000
Received: by outflank-mailman (input) for mailman id 291857;
 Fri, 18 Mar 2022 05:24:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ToKV=T5=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1nV56Z-0000Gd-Jl
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 05:24:51 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe07::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbc09e59-a67b-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 06:24:50 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB8PR04MB6586.eurprd04.prod.outlook.com (2603:10a6:10:101::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 05:24:48 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::cd28:b224:dbce:5f5e]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::cd28:b224:dbce:5f5e%7]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 05:24:48 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: bbc09e59-a67b-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfrqBJJgKJxV5hIvlcEhAlVHg9zoVEqqrpGHQF/GRiPlSRG+KEto72EhXYalVoQA2tQCrujETmG7wS8LmfavHcFjjZvbsE8CdD+fdeKpcik1H8IhobhSiA63Xq59XCEK/pr+3wIVFcryTQxgXGTnXfreQZGANK3mfVKOJe1iX3pDCHQi5qAbMHdoodjq3dccQNAznpzqal6ixxXGEi+6OiM60VzBFJjLa6Dm9/onZNXVgyzfSL/cesfUn8xtEho4+XiZ2nb8l5jo4GdjpJjycQvxVijCcF1J3ZDVUpBcCpjChECdAO+WRs07AiG0GZmP1LeN1E5tB9BZF8G55he74w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vPEEJMF9dWzpCqP5Gz0crPZ130HqiQ6yLnY4JM2+wI=;
 b=fXT2pS7+EO96KbeBHF4XcNkz04w/o2dsEVCpzXvlJQ8U04oe5M3IhMu+aBmnqNkRs7f4R5uDFO+OQaNCJpjOV66P9wySlY2P/DORi2y+uKhJBFoYUUz3CQ0fsxZ6+HdibHwHdUMqGWDWFuRSx6tT3sxYgMu0HDJcU2P0JttBeZLN3L2fWMfW08MTRtwg81kOVxJOsqLHXRnb4dG66PzS6oN3i8fAqkHTZz3tYySHIAdvEGTIY004jhahp7f98QyBKDZzb9Ro6MTHw38lJDolG2FXkggLDROKo+I3bNFC6jGM4IuI/LeeBNy2sfAsonjXogCrz4DfD9PTXOPAAc/+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vPEEJMF9dWzpCqP5Gz0crPZ130HqiQ6yLnY4JM2+wI=;
 b=UcQathVIvF3sK9DzXyTvURDnEMteVeLUGRPeNglSp5Y3jfy3f34IHAdZdZqaLNJqgygBEP6B1rPdIbkAECsrHuW2th5DmICjRxhVS+k7lMc4Y+5vM4xaBShuQEg+iOfjiM+uHsqQMxfRrTKfhSV2WRN0E1u4mvRpp999GIXkW/k=
From: Peng Fan <peng.fan@nxp.com>
To: Julien Grall <julien@xen.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"van.freenix@gmail.com" <van.freenix@gmail.com>
Subject: RE: [PATCH 3/3] xen/arm: Add i.MX8QM platform support
Thread-Topic: [PATCH 3/3] xen/arm: Add i.MX8QM platform support
Thread-Index: AQHYLDn1G/1Ac2CNa0S1ihQ7HHH+66yos2GAgBwE3KA=
Date: Fri, 18 Mar 2022 05:24:48 +0000
Message-ID:
 <DU0PR04MB9417B86346491B63442D234D88139@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220228010711.11566-1-peng.fan@oss.nxp.com>
 <20220228010711.11566-4-peng.fan@oss.nxp.com>
 <e55f32f9-4d24-77a9-026b-201536c73708@xen.org>
In-Reply-To: <e55f32f9-4d24-77a9-026b-201536c73708@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d9e2c0d-9f65-473b-c7ee-08da089f9f04
x-ms-traffictypediagnostic: DB8PR04MB6586:EE_
x-microsoft-antispam-prvs:
 <DB8PR04MB658644F9E5BF49DF5BAC5B5D88139@DB8PR04MB6586.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mYBBQM6MmGGGf6TJEP/P2cRvXUEhapFZBQgP22NO3yRIJfWjqJlezDxyp7/AhIQupIUI5p3J6gOuQkcASV+yKFZFAWh+bu/WjXAPy6L/EsWZsQ+sR6A3xEDbUJJnQDgchr7h+XUYhCbgWczLiCJvBowzDffC9nDz80ie8OwCNRQOPtqR1jfTLUJbcL22Heg8Fh8srewHlC1iwLXaiq16iv8pb6Ey42F3KLdBvv7IEmQ0wCM24oH2R29lEXWbb/+x6HryVynhB5RYBkWOQsslEOKmhKX5RHSAaZ52ik7vo1vZ39YlJbhQQYmFNwpUHRnSfHdVJl6BCsNDSsofiNSTEcQEN4L0U8JV5m+kur2ufHHx+EKzziATZxToLpjOMzDmD9GNhD+V4LEOjNEN8ohr+n/FiQMlKnj6EY9G+R1XilrrTYygRHGZpA4OLp5nHP8eyk7oPwPQykIvVMJnTk15sVpOn43naYOCrC3+jq1+2M31zbJ0lEX0ayr0nq1Zp5q8Yz63rk5YHGP3Oq4LIfrRJs1BiibmGcEa4xtzkiLaxE9ChKO8oaNWlfL8CIi1uCRO2k3HWmtZDaTXINpntYGBZwpInjBFhx1Nf16+5zzbXjVsGayShXWK84+3qfmhbTLjXjKQWLy7mKQqhomHrcquaqxl6YyIIr0yP/AhxkTZUupek4IOczWTJH/WY35SKnIS6NzG0hPXWc1nntkclbaCjjgku7PsGKxXd3Pf3GxXVRk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(2906002)(33656002)(52536014)(53546011)(6506007)(7696005)(9686003)(7416002)(44832011)(5660300002)(186003)(26005)(508600001)(71200400001)(55016003)(54906003)(110136005)(38100700002)(38070700005)(122000001)(64756008)(66476007)(66556008)(66946007)(76116006)(66446008)(316002)(4326008)(8676002)(86362001)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SUhFSWxZWGEzWHZUVWlGSU9EMUlHb1R2bWpQbFkreWdXK3puUmFhSlpmdU5u?=
 =?utf-8?B?VlhabzhySEd1MElkUy9JWGRhdVMxZjJ3QVVsOWdXQnc3OCt2OU82dndydkc1?=
 =?utf-8?B?cEdDNUZtK1lpMlF6VXFvUGZFdzRzbDlXVy8wUFJlRW9LeGdFQXRuQWtxWUMr?=
 =?utf-8?B?eEY5RlhuL3UyNjdhYXI2bGRoeWdyT0VBOGlTdU5FR2FHRUg4NjEvRzgrL0hL?=
 =?utf-8?B?MHRXV1BEUnJmbEx3RjFSYXFiSHNvM3drMVFPRXdNMTEzdW9sTURJaGhqWW5u?=
 =?utf-8?B?UnJ4dEp2QXN1UDBEeDJSczBVT2xoU25uaWlTN3ZOV3lwY05sMHFCTGdSQVkr?=
 =?utf-8?B?QUZEemZPdVNyOUw0ZjhpVnM4ZXVQVm1Sckh3elZIcXRmT3JHUVRBZGZnWE95?=
 =?utf-8?B?MFlQUVZZZXZrL2pBbDdOZjZrb3Job3lsYXFjRDBLd002MDlRKzlaZ2hHQ1Vk?=
 =?utf-8?B?eUJMVTJqTE11RXVQUk0zREFCT05meE53UlRVb1B6dDNXNUlKbm0va1NBMkV2?=
 =?utf-8?B?b2YyMkdoL01tMjVtOTNaeW9ha3VKYUhWQWM1dzNwVmpZY0NjUE9raEVNR2dW?=
 =?utf-8?B?cDhwMmRHZDhGTWxoaDRPMVk1VmRBdVFGNjBFaTh3TnM5Y3IyT2kvSTVhaWJu?=
 =?utf-8?B?RFlzeUM2bFVncmp6anJMOFVTSURWU3d6TldLU3BaWkFBaTVvLzhjU1hsd1o0?=
 =?utf-8?B?a3ZEa1g4cVo0N2ZYOUl5YllQNDc3czdHeVNBM1pUck0zckdXZzJBQ1FTWWxB?=
 =?utf-8?B?VGNGUjFzQXhmSUtwTXpsdGE4d3BqU0hMcGlWcjJvUHNaN0w5NWlGRmp0ZzYv?=
 =?utf-8?B?dzNTR3dMTzl0RHBmdTNQT2doY1hFTDRXT2NwTE41cVFQa0JSdmxITmROdnhh?=
 =?utf-8?B?NUpPZEMxck00dkE4dXZhTUhWeUk5SzhLd3NiMU9NWU51ZnNMdnBXMzdUUDhN?=
 =?utf-8?B?VGN2VFJkQi9ULyt0R1ZZMlNranlZWGdIS2RYeUpGMGl2OW8wZEJwWCtja3FB?=
 =?utf-8?B?Rk9ndGgrZTdCTXUvV1R6ekEwaHVubFFDSjYzbnpleDlyOHk4bmdTVExldUhH?=
 =?utf-8?B?SHZtUnptUG5KSkYwdGNlemltYllUQVdxMStWd253TW5tTG1rV1F3Uk1vSHhH?=
 =?utf-8?B?VzZSWmd6azBnQ2dDY1EvVC9YTmhuVmx4WmpEWGNBeVdxQmFkTGRTYnlLY21T?=
 =?utf-8?B?MnBkTDFRZWk5dzRqU1hyZVQxWCtSY3BwQkVqam9QZUJWTHVOMkI0bnVTbTNK?=
 =?utf-8?B?WVFpN0crU2YrVldCWnRTamVqaS9lcUlBQWRRcjZsdndPUWlVdUhVWFJHd0s3?=
 =?utf-8?B?QTg3b1BKZDJ3a1NGVS9JMDh6R0RrdktoeVF6RkFKbGlnSXhzSE9CWWJ2dlNy?=
 =?utf-8?B?NGFnbEgzeGJFOWRiNy8ySWd4SE1ETGp1a2dzYnBMM3JsRE9nU1M1c0JJYmR6?=
 =?utf-8?B?K2tRTzR0QzU3QlBWeWVxV0pRaTNCVFdNUmkxdE41WlV4bVVVMmhuNWgzZGhL?=
 =?utf-8?B?YWRlZFE2YzVlVnlwUHc1eEE1ZVVuL2xVcUEyMzh2S2R3cDAwMXpLOTBnVXRu?=
 =?utf-8?B?VWJQT09rSXNFVDM2dXh2bXkwR1MyQy9SczdOSE8zQTl2VnpRcXhOK1FrdnJv?=
 =?utf-8?B?YVVtU2oyaytzWXM0bVJJTzNYbEp1L1Z2cWxQWFhMMVdoSUNZSzU1QTgra2JE?=
 =?utf-8?B?UDNsUDkvcHhTQjVZQ2NBb1l4REdhakFZanpMUW05UlpSVGdMR0d3cjRid29R?=
 =?utf-8?B?YWJ6NjNTQ0lqNms4MnRqdTNGUEIwbWVOTTBiOVk3UTF5YXZtTWVHWXRoWlZL?=
 =?utf-8?B?REcyZ3kxTyt2RFpHVVZodzdLSzNkVlNrQzdydUFvSzFZN2JxTjlPQTIvaGhY?=
 =?utf-8?B?aURweUtXOStaUXdaNkc5Z1c4WmxNU0t5VUhycjVrOGVDL1cxazZibnJSN3RH?=
 =?utf-8?Q?618XHxft1Ws=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9e2c0d-9f65-473b-c7ee-08da089f9f04
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 05:24:48.5965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y6RYhpPH1ottuDQeps4/mDrgn/BxctvGtJhqTsiOdfvh/fN8ggTmCBiTVDwskkes0RE7nUEYPHLQYOsdD7DkHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6586

PiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10geGVuL2FybTogQWRkIGkuTVg4UU0gcGxhdGZvcm0g
c3VwcG9ydA0KPiANCj4gSGkgUGVuZywNCj4gDQo+IE9uIDI4LzAyLzIwMjIgMDE6MDcsIFBlbmcg
RmFuIChPU1MpIHdyb3RlOg0KPiA+IEZyb206IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+ID4g
LS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vS2NvbmZpZy5kZWJ1ZyAgICAgIHwgIDMgKysrDQo+ID4g
ICB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL01ha2VmaWxlIHwgIDEgKw0KPiA+ICAgeGVuL2FyY2gv
YXJtL3BsYXRmb3Jtcy9pbXg4cW0uYyB8IDQ0DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspDQo+ID4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9pbXg4cW0uYw0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmlnLmRlYnVnIGIveGVuL2FyY2gvYXJt
L0tjb25maWcuZGVidWcNCj4gPiBpbmRleCA5ZWNiNDQ2YjNhLi40M2NjZDhmZTYyIDEwMDY0NA0K
PiA+IC0tLSBhL3hlbi9hcmNoL2FybS9LY29uZmlnLmRlYnVnDQo+ID4gKysrIGIveGVuL2FyY2gv
YXJtL0tjb25maWcuZGVidWcNCj4gPiBAQCAtMTQzLDYgKzE0Myw5IEBAIGNob2ljZQ0KPiA+ICAg
CWNvbmZpZyBFQVJMWV9QUklOVEtfSElLRVk5NjANCj4gPiAgIAkJYm9vbCAiRWFybHkgcHJpbnRr
IHdpdGggcGwwMTEgd2l0aCBIaWtleSA5NjAiDQo+ID4gICAJCXNlbGVjdCBFQVJMWV9VQVJUX1BM
MDExDQo+ID4gKwljb25maWcgRUFSTFlfUFJJTlRLX0lNWDhRTQ0KPiA+ICsJCWJvb2wgIkVhcmx5
IHByaW50ayB3aXRoIGkuTVggTFBVQVJUIHdpdGggaS5NWDhRTSINCj4gPiArCQlzZWxlY3QgRUFS
TFlfVUFSVF9JTVhfTFBVQVJUDQo+IA0KPiBUaGUgZ29hbCBvZiBwbGF0Zm9ybSBzcGVjaWZpYyBl
YXJseSBwcmludGsgaXMgdG8gc2VsZWN0IHRvIFVBUlQgYWRkcmVzcyAoc2VlDQo+IEVBUkxZX1VB
UlRfQkFTRV9BRERSRVNTKS4NCj4gDQo+IEhvd2V2ZXIsIHdlIGhhdmUgZGVwcmVjYXRlZCB0aGVt
LiBTbyB3ZSBzaG91bGQgYXZvaWQgYWRkaW5nIG5ldyBvbmVzLg0KPiANCj4gPiAgIAljb25maWcg
RUFSTFlfUFJJTlRLX0pVTk8NCj4gPiAgIAkJYm9vbCAiRWFybHkgcHJpbnRrIHdpdGggcGwwMTEg
b24gSnVubyBwbGF0Zm9ybSINCj4gPiAgIAkJc2VsZWN0IEVBUkxZX1VBUlRfUEwwMTENCj4gPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9NYWtlZmlsZQ0KPiA+IGIveGVuL2Fy
Y2gvYXJtL3BsYXRmb3Jtcy9NYWtlZmlsZSBpbmRleCA4NjMyZjQxMTVmLi5iZWM2ZTU1ZDFmIDEw
MDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvTWFrZWZpbGUNCj4gPiArKysg
Yi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL01ha2VmaWxlDQo+ID4gQEAgLTksNSArOSw2IEBAIG9i
ai0kKENPTkZJR19BTExfUExBVCkgICArPSBzdW54aS5vDQo+ID4gICBvYmotJChDT05GSUdfQUxM
NjRfUExBVCkgKz0gdGh1bmRlcngubw0KPiA+ICAgb2JqLSQoQ09ORklHX0FMTDY0X1BMQVQpICs9
IHhnZW5lLXN0b3JtLm8NCj4gPiAgIG9iai0kKENPTkZJR19BTEw2NF9QTEFUKSArPSBicmNtLXJh
c3BiZXJyeS1waS5vDQo+ID4gK29iai0kKENPTkZJR19BTEw2NF9QTEFUKSArPSBpbXg4cW0ubw0K
PiA+ICAgb2JqLSQoQ09ORklHX01QU09DX1BMQVRGT1JNKSAgKz0geGlsaW54LXp5bnFtcC5vDQo+
ID4gICBvYmotJChDT05GSUdfTVBTT0NfUExBVEZPUk0pICArPSB4aWxpbngtenlucW1wLWVlbWku
byBkaWZmIC0tZ2l0DQo+ID4gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2lteDhxbS5jIGIveGVu
L2FyY2gvYXJtL3BsYXRmb3Jtcy9pbXg4cW0uYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGlu
ZGV4IDAwMDAwMDAwMDAuLjI4OWMxOGU1ZjkNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIv
eGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9pbXg4cW0uYw0KPiA+IEBAIC0wLDAgKzEsNDQgQEANCj4g
PiArLyoNCj4gPiArICogeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9pbXg4cW0uYw0KPiA+ICsgKg0K
PiA+ICsgKiBpLk1YIDhRTSBzZXR1cA0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgMjAyMiBO
WFANCj4gPiArICoNCj4gPiArICogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+ID4gKyAq
DQo+ID4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJp
YnV0ZSBpdCBhbmQvb3INCj4gPiArbW9kaWZ5DQo+ID4gKyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBv
ZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkDQo+ID4gK2J5DQo+
ID4gKyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2Yg
dGhlIExpY2Vuc2UsIG9yDQo+ID4gKyAqIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNp
b24uDQo+ID4gKyAqDQo+ID4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUg
aG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLA0KPiA+ICsgKiBidXQgV0lUSE9VVCBBTlkgV0FS
UkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZg0KPiA+ICsgKiBNRVJD
SEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhl
DQo+ID4gKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+
ID4gKyAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPHhlbi9kZWxheS5oPg0KPiA+ICsjaW5jbHVk
ZSA8eGVuL21tLmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vdm1hcC5oPg0KPiA+ICsjaW5jbHVkZSA8
YXNtL2lvLmg+DQo+ID4gKyNpbmNsdWRlIDxhc20vcGxhdGZvcm0uaD4NCj4gPiArDQo+ID4gK3N0
YXRpYyBjb25zdCBjaGFyICogY29uc3QgaW14OHFtX2R0X2NvbXBhdFtdIF9faW5pdGNvbnN0ID0g
ew0KPiA+ICsgICAgImZzbCxpbXg4cW0iLA0KPiA+ICsgICAgTlVMTA0KPiA+ICt9Ow0KPiA+ICsN
Cj4gPiArUExBVEZPUk1fU1RBUlQoaW14OHFtLCAiaS5NWCA4IikNCj4gPiArICAgIC5jb21wYXRp
YmxlID0gaW14OHFtX2R0X2NvbXBhdCwNCj4gPiArUExBVEZPUk1fRU5EDQo+IA0KPiBXZSBhcmUg
b25seSBhZGRpbmcgbmV3IHBsYXRmb3JtIGRlZmluaXRpb24gd2hlbiBxdWlya3MgYXJlIG5lY2Vz
c2FyeS4gRG8NCj4geW91IG5lZWQgc3BlY2lmaWMgcXVpcmtzIGZvciB0aGUgaS5NWDhRTT8NCj4g
DQo+IEEgc29tZXdoYXQgcmVsYXRlZCBxdWVzdGlvbiwgaXMgdGhpcyBzZXJpZXMgZW5vdWdoIHRv
IGJvb3QgWGVuIHVwc3RyZWFtIG9uDQo+IHRoZSBib2FyZD8NCg0KQm9vdCB4ZW4gdXBzdHJlYW0s
IG5vIG5lZWQgc3BlY2lmaWMgcXVpcmsuDQoNClRoYW5rcywNClBlbmcuDQoNCj4gDQo+IENoZWVy
cywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

