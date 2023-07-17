Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02124755D6D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564270.881717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIyz-0005cz-0C; Mon, 17 Jul 2023 07:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564270.881717; Mon, 17 Jul 2023 07:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIyy-0005aT-Sa; Mon, 17 Jul 2023 07:49:24 +0000
Received: by outflank-mailman (input) for mailman id 564270;
 Mon, 17 Jul 2023 07:49:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XObt=DD=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qLIyx-0005aI-6T
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:49:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70875deb-2476-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:49:21 +0200 (CEST)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8787.eurprd08.prod.outlook.com (2603:10a6:10:476::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 07:49:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::63b4:d202:9288:1453]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::63b4:d202:9288:1453%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 07:49:17 +0000
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
X-Inumbo-ID: 70875deb-2476-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/X2JFQRpe4nYBPxnV3ru7WC9Z/7pjqYKzrQUJocZR9NmKlih+QHBOEEAYWEfXV667B1ceSCvZxakmtDF6h2a1MOlmlQg1NYmZHx07O0dl96Mdz0sBC7I3yf6lZIH1ISPCQdN2YbcEQL/TkemvnLdDYtlyD+ZuihXgc2xjWctT7TrCFkXkDm85hXRYoXKHg8S9o3Y1gjqxTXiiFibPPjaJ4Wn1G+vxHboDCdhbgOf/AuyKWNTyPr6CBLUxGRcFBtkvmwSUbormDFYI1JqEV8yee/lyEc3rP3ZMsfxy8eitAEVZa53qbx1imiUz57ThmXjsKd2GYdhOmDy7GXcTGAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Il1GcJla8zR5RvUV6jouxbpmzqTq6tnUvFmCLuyd+g=;
 b=Crl4YeNdi85p6VOyh99v+iZS1QoGCHe54QUYOfoUFVFbK0BwaOEDtJbt7oFcNjBmeEGw66xkMEN8FMyhz9+SYpf0dbzKGnazveoQ/lpbxSQD/CjLcbdehAXk1x1dH3jv6lFNzIkVyVo9dnO+SbTQDiDZSNigeNyidfSoRH7a3Jz2vGoOgwKZkSZyWEC4q61mVKokHDlxXmTER2jtBIA87noCAabH3rx/mJbPGZDiVJybE7i1viO27SisZ+j1Kz2cWMdhbnqO3F2aFHt9ijI+WhN1DAsjBJk6Cyvh3DeBt220VH+YGtEQk3TXp/faJQHG/HAxGN5QllLbo00vin1N+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Il1GcJla8zR5RvUV6jouxbpmzqTq6tnUvFmCLuyd+g=;
 b=dv2LsR68HKijaE0OlbTo9oZWeNwtcnsb89rId1ERZgWnUQpsN55dXsxsZuNfPkhRVfxpTm/9EDWVpDfo2FL+9zmPukOCdO4tqbpZtWV9GHAyBzdUvfqe/cniARNlcva5GzixlMR/GFOWmTSZnO64Ng8zMm5mObz8xG/+AdclQK8=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Jens Wiklander
	<jens.wiklander@linaro.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Marc Bonnici <Marc.Bonnici@arm.com>, Achin Gupta
	<Achin.Gupta@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [XEN PATCH v10 24/24] docs: add Arm FF-A mediator
Thread-Topic: [XEN PATCH v10 24/24] docs: add Arm FF-A mediator
Thread-Index: AQHZuH9cIzjWAJ1mBES+SXZXgiujjq+9lGoAgAAAjEA=
Date: Mon, 17 Jul 2023 07:49:17 +0000
Message-ID:
 <AS8PR08MB7991AB49C93E4CC6EC97FF03923BA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-25-jens.wiklander@linaro.org>
 <8a4c6ca5-db63-8677-043a-5919af157b21@suse.com>
In-Reply-To: <8a4c6ca5-db63-8677-043a-5919af157b21@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 79994CC57B1BCB479A8769BFA1939B67.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|DU0PR08MB8787:EE_
x-ms-office365-filtering-correlation-id: c0e890df-cf32-41ab-e0f2-08db869a52f9
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2y+Mj9ZgO72KddCvJoCmzDmJ5QwZ6UaCFHLei2wJAMwHo2/7NkErudESYcaB/Jo1xTMUTlrwWmv71bdyBrv9D+T9q06tKpHOV3ksbVf2rjgcVpeXYpn3msfJ9VO7r/D02A6ePRPZSJ47HSg/wzJYOeBot3Li135PJXAxp9fXt1RbhUIxsv2MUw6quZ4Lx0j+4ypLMngZ7WlRaHqFkLFBx+oO4eA6TMa1EHCW31nJbwhASvoZfoPH9fc9ReEdJ5vsik7TzfUvx1CBkKlJmpgXo7d+JXNIW5lJZNgQ0WDes9SQS+ShfaMZpOt0H6IqqSB+IEPC7ec1DbK9PRr5wdSdCYMNyk8IR2Ax30Xj2/aIjAriihutwwsslJLQFZwvQP0Xoq61+ZunSLVCkSUbTxnUr2dPazoBNXrlavys5AqoCp1Lo18uGn9kt+TAfq1GH4JbfZodBxGuUKLpX5owonIJtM2cPDx+PjhM3ZpjAqTmqU7SAmH6wHfGNm9lbx3C24hERZe4ppsH4MIwqVQMEy3CaogW8sqeyGEFVr9sZQcfMhietje12oyRvVMjHSR8bTPOgmy5TZQFx39pBIGQIDqes+hDuNKZTZ4Q3/tDn7wQOMc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(83380400001)(26005)(478600001)(6506007)(53546011)(55016003)(966005)(7696005)(9686003)(71200400001)(33656002)(41300700001)(7416002)(38070700005)(8936002)(52536014)(5660300002)(64756008)(66476007)(66556008)(66446008)(66946007)(4326008)(76116006)(38100700002)(316002)(8676002)(86362001)(4744005)(2906002)(122000001)(186003)(110136005)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ekZPcHN0SjE4YUVibzFzM2w3M1BjV1dRekdDd3NCU09pNWlDWk50ZGFwbXhy?=
 =?utf-8?B?b28xN0V6emtLdG9rS2ZZaUpoTGE2WlpsU2VVK3RqSGNEQ0ZCWlE3N3ZldWZF?=
 =?utf-8?B?YUswSERrRU9xbjVwRm9Ha1VEUTUwNXNjYUxYZnN0V2dwbEN2SnMwa0l5aEhU?=
 =?utf-8?B?aW4zaE1jYmlhYXRuWVlJbEplTW5aOFJzSldQbUhhbjEyM2lMN3VENVRYOVdt?=
 =?utf-8?B?V1kzRHYvSHBrM1UxUkFONTFQVGlYNGpxK0VkMWFReTJkM0V6WGdnRFJmWE9q?=
 =?utf-8?B?VVlLejJJMkxOMUNSWFNMcXEwU0w1Z1Nlb2x2ZE5BWUMxL21TSU1sQVh4Tzdh?=
 =?utf-8?B?a0V6YVlxTjZMTWFWZS9EK1ZHRXBQUXY0cVBXSjA1SE43TW1iU1ptOEpnL1JP?=
 =?utf-8?B?S2V5dUFsblhUckhZZTdESzdDaHgyekFUbkhPVWdMa1piUXdVc0hjZENDdEV2?=
 =?utf-8?B?RUxyZVlrUjFjb293R3Y4S2tZdm9VV0ZJanh0VDUzTW1sRm9tRDNZRy96Vkto?=
 =?utf-8?B?eTFEV09mWFE4cjBldGUwTDFSRFB6alpHQVo1MGJqdnBtSXJnTTg5aERpSyt0?=
 =?utf-8?B?ZTlLQUJHRVpqOVhFRUgrOERFdnJjYzF5QXc4NGlZbmw1RlY4eDNydmtJRWlN?=
 =?utf-8?B?RlpLZFlOYVUwUUhmanAxdHBHRWFYY2ZUNjNZditVZDFOZHRxemZzWmJaV3NJ?=
 =?utf-8?B?VGdKSk4zV3MvMmFuakR5ekNNTzIvREFsL1cvN0dHZFpoN09aZlYreU54N0NP?=
 =?utf-8?B?S0JpYzlQaFNEV3RpN2JGL2FsblYzTjI5Z0R3bjRpcWNybHhpbmFBaElrTlc3?=
 =?utf-8?B?bXpYbDJlMG5wRXBrUWRDd1N6OVBXR1FBOUt3MU5PTlIrRllFWTd2dTVibmdo?=
 =?utf-8?B?SXdjMFJtYWtBTjhOWFlSSFJOV2xFeWhYRGR6dWxkekZmTy9kN2FPQTd0NWta?=
 =?utf-8?B?N3ZnQUd4QVNrNzF2bU41QVdCRE1jWW84Unh1T3lWU2VCdGZQZVBkRDBkUFh3?=
 =?utf-8?B?MXVkb1VaRHhmaUttZS9jbjdPTTNtYmc0SCtSbWpwbWViWUFkbTFXd1l3akZ3?=
 =?utf-8?B?RUZQK083cVJ0ak5nNmxaRFNwelFUakdqTnAwSXpPdWszRXJ4UElETUc2TnNG?=
 =?utf-8?B?NWdOUmxaTTNHZ2E2MVZpcXVoSndNMmJ4S1FsUDRsdWNYalptaGQxalphWW1B?=
 =?utf-8?B?K2NNSTUzSEVLaGp0RUdNbWN3Z2R0WmlEWFk5dVdHaTd2amZmUmtwT1dwdGVr?=
 =?utf-8?B?cE5JR3NPV0RYTWNldFE5VHorVER3czVEV0R2WG53QWE3V21GNkFodE9Zc2Jv?=
 =?utf-8?B?NkxpV1crNjA4MHBFa2t3cEdnK3J4c1dKVTY5K2ovWURBTUk0Nkl0UnFMT3N0?=
 =?utf-8?B?aUV6YmZ3VkxHc0g5N01wYkJUdVc3akFGNFN4T1lWVjl0bC9lNzVvdytxSmZt?=
 =?utf-8?B?aS8zUkNRY2MydExpL1luWGNIQ3dxbTNCdm9UcjUyWU5kQmRxR0J5SGZOeVl5?=
 =?utf-8?B?MW5GRElLTnVTWk1tZTlmODVXWUZIdDFYZXJtcnFnN3p0SGdiVVJZcXFEN0xn?=
 =?utf-8?B?N1UxYXRBc1RVbW14c3pIWHhzbXhQMERmSzBqNXo3QituTGZISjVWMjMxNHY4?=
 =?utf-8?B?QU8rc1VrU3J6Z0x5b2x3MDB5OFhDUXdpaWN1blpXcGZqWnpSOVZPa3Q1ZWJq?=
 =?utf-8?B?WVI3bmFuMHd4WmZOb2dKRTFJSGxXV1FTQ3YvUWRGcE1MNlNRQnhmRGFoRGhU?=
 =?utf-8?B?S01GTUluWHBJZ21yMHlzQy9tVytMTVc4aXFJZHhDNG1KZGgwK3phQXMvTjJz?=
 =?utf-8?B?TzR6Z2JXZmVuNTdWTm5hSzdMaHdBdHlwZFVjSWdSK0lSNHFmZ0pibzg4a21s?=
 =?utf-8?B?MWJnZXQ3MndSallzT2ZlL21hd1NId3o0K2hTQWVCOUozODQ0bUNKOEFESXQx?=
 =?utf-8?B?YlpyNkJOZ0lWMXhEQlVmdS9jWVZjbUZWa1JINjM4Q2oyNzJvckJqNmFjR2lU?=
 =?utf-8?B?cWdiM3J0NnZhTGxRd2kxZkFYODBmS01Mbks2UFVWdjhiUVhCSDFGREd6Q3hq?=
 =?utf-8?B?RlpVRk1FbDNZRzNnL1ZSdHVGNFRNYkZ3TDJXd1EzMExNU0RTYjNoeWFwWUhM?=
 =?utf-8?Q?pdeg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e890df-cf32-41ab-e0f2-08db869a52f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 07:49:17.7753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wp/F0ALKC2CsW4mgPcEUg7EkaRITWaPQCF6eLbIj/m4xKbYdAZcUz5BmSe0mQ1zc2slPl7TTromEur8GWNc/Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8787

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gU3ViamVjdDogUmU6IFtYRU4g
UEFUQ0ggdjEwIDI0LzI0XSBkb2NzOiBhZGQgQXJtIEZGLUEgbWVkaWF0b3INCj4gDQo+IE9uIDE3
LjA3LjIwMjMgMDk6MjEsIEplbnMgV2lrbGFuZGVyIHdyb3RlOg0KPiA+IERlc2NyaWJlcyBhIEZG
LUEgdmVyc2lvbiAxLjEgWzFdIG1lZGlhdG9yIHRvIGNvbW11bmljYXRlIHdpdGggYSBTZWN1cmUN
Cj4gPiBQYXJ0aXRpb24gaW4gc2VjdXJlIHdvcmxkLg0KPiA+DQo+ID4gWzFdIGh0dHBzOi8vZGV2
ZWxvcGVyLmFybS5jb20vZG9jdW1lbnRhdGlvbi9kZW4wMDc3L2xhdGVzdA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPg0KPiA+IFJl
dmlld2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+ID4gLS0tDQo+ID4g
IFNVUFBPUlQubWQgICAgICAgICAgICAgICB8ICA5ICsrKysrKysrKw0KPiA+ICBkb2NzL21hbi94
bC5jZmcuNS5wb2QuaW4gfCAxNSArKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyNCBpbnNlcnRpb25zKCspDQo+IA0KPiBXb3VsZG4ndCB0aGlzIGJldHRlciBhbHNvIGdldCBh
IENIQU5HRUxPRy5tZCBlbnRyeT8NCg0KMTAwJSBhZ3JlZS4gU29ycnkgSSd2ZSBtaXNzZWQgdG8g
bWVudGlvbiB0aGlzIGluIG15IHJldmlldyBvZiB0aGUgdjggc2VyaWVzLg0KDQpLaW5kIHJlZ2Fy
ZHMsDQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg==

