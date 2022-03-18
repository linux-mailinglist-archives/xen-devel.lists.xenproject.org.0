Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5824DD45B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 06:26:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291860.495684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV586-0000wA-5Y; Fri, 18 Mar 2022 05:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291860.495684; Fri, 18 Mar 2022 05:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV586-0000uL-2P; Fri, 18 Mar 2022 05:26:26 +0000
Received: by outflank-mailman (input) for mailman id 291860;
 Fri, 18 Mar 2022 05:26:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ToKV=T5=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1nV584-0000uD-Fo
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 05:26:24 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe07::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2c546e3-a67b-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 06:26:23 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB8PR04MB6586.eurprd04.prod.outlook.com (2603:10a6:10:101::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 05:26:21 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::cd28:b224:dbce:5f5e]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::cd28:b224:dbce:5f5e%7]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 05:26:21 +0000
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
X-Inumbo-ID: f2c546e3-a67b-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9QUQJ+3h2xvBrck/kvpg95L7bffnQh6oxIoMD46lAQCXYu+zN1Kxjvh6E6bWs8FK6lrMT3sSgetg3hwBUxWEIeimXSIWGtbYmy8qVdoCfQsTawyPQmhYI+FhSk+403cFzqGADou3g6bhx6iOscb5+OZiECUEWmgqV/myX+tjJPk8vPar3Fs3XkDrRE0MmIPb6iM5ugYUu4QHKmwh7HA4JjCxNa6JkLdU9rKF4T3v5ysKioFoYbNm4WgOJKJo40tut+iWUKfJHRWYkj1GO+JbKiP+dPvA9CEyGz2Z58MYF63cCnKNAD2w32sXVkFuh37lC0CyGXKhjkRHFM7sAIDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kx+KuOYNUIKuRplMmz9kT/yyMjJRjAmjPFeeJFGqcME=;
 b=Dm8578rl0B9M88bSWvJHLlitjowCGKJMzd7fVv1Bx57ONXB0s5hsLWbs/bKFzyo/gPCw3zQvP2I2QMTnUmXMDTeBL4LiQp6Wv3Zmmr5QSjgjlH/T9Ayo0r9oYk++/uKpzV2DOoFK5HiZEfPvizUmsbYuuNcT17pqk/1WFaehhZOHHb7BFpeCOlX561cTPR7BtYGrEURIL5Amz36l9eamrO6y1uasZvDZchnPluFNTzLmLDlFIbrtplMRboKG+IhfhX2GgHmY9djh3ZGAG4zewS6UCchB2uMA9viaHRKg+/UhNz9oVLiUw1BshfIUct0Guz2vpHGutTNDPLpwbhXxAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kx+KuOYNUIKuRplMmz9kT/yyMjJRjAmjPFeeJFGqcME=;
 b=CXPXzjwzy93WP+XHKJS32kEGPEZRjQU+Zaks5BrfejtVTyeK2FaKLDCo4FpuFPbB6X4R4mFzGVzdgG10a2ZNnD1LEFWZ97zIqQOtVr4jH6tfrU5yT3xXcWXtSTpc+KAhcyiyYdhzBIAPeqkpc5mYZdctM0otuvUYgDmKkMBjj1o=
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
Subject: RE: [PATCH 2/3] xen/arm: Add i.MX lpuart early printk support
Thread-Topic: [PATCH 2/3] xen/arm: Add i.MX lpuart early printk support
Thread-Index: AQHYLDnzvahR7/4GlkqRjPvyQqaC7KyosZiAgBwG+qA=
Date: Fri, 18 Mar 2022 05:26:21 +0000
Message-ID:
 <DU0PR04MB94175FC230D9D0DB1384105888139@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220228010711.11566-1-peng.fan@oss.nxp.com>
 <20220228010711.11566-3-peng.fan@oss.nxp.com>
 <ba77dc96-d421-b775-d5fd-99dc3ea2dfad@xen.org>
In-Reply-To: <ba77dc96-d421-b775-d5fd-99dc3ea2dfad@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8229fb3-c5f2-4dfe-6022-08da089fd655
x-ms-traffictypediagnostic: DB8PR04MB6586:EE_
x-microsoft-antispam-prvs:
 <DB8PR04MB6586D4A5E2728EEDB44F1E6588139@DB8PR04MB6586.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 egVzCoX5IAgKM1JxKRbjqU1lHHmrHqydhm4vVkD2hvhnrbE9lkAWKK62wY91Evh0qvHaMK6yy/wdISvUkKdRNcMZnGHKP1zw+7bJ8GifVziIqIU3niv6vS4x89Xt57GHcbmXgk6BnLh0LYjr3jEX96HWhGpwEPJaHtCVRR7prRnLcNNA4olK2Ace3LUIGl/+vZJsFzlHydAHqbwVuLSLN5qS41fzkCl7RBuXk6cNT2QbKG4M/NiX8PoebZnCP0EYit/GGLTWoZs/Gx5pgEZnhRjiLz1B7sgLfh9/4Kfix9yFVuedEfg+XHLgjgckcSJ+Uomm1UCY0mj9CGBdn5ljuE/O+it9cF4lIk+lJKs4hHN7/pNC+luQX7ZEOq0+JLqplycdJpGRyRHqDa9usigdZEsJn36qBnlpo0AXdmq1A1jXRCqLicv3Vbk3EHSkXw6SZaA7V4skJ5Gu/kD00/tvD48TvT2MBBOhXSL9FhO+pXcy9jYmgM9vQhO2diUqvJUPxm7zn/JFBgg0apJKLJBiwucoelMOscsQKsuXv3UolyZVgbqTHIniXtZMlY/QumigosU0ma8UC7PSW/oB3mJzzlkUCXQWao78TJ37sqp3PZwepH9o1yWIGKI+XxxjrlTPwBbqEKHOcIX6Uu/rMQPkD++TKs3e4kAoqRzWcQwa9GVQsiTuIMWXgfhmxKzPOeCqYHEr+TwLtMseHXTjTr+3keSp5u8uN9z3qUpJz95MHHM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(2906002)(33656002)(52536014)(53546011)(6506007)(7696005)(9686003)(7416002)(44832011)(5660300002)(186003)(26005)(508600001)(71200400001)(55016003)(54906003)(110136005)(38100700002)(38070700005)(122000001)(64756008)(66476007)(66556008)(66946007)(76116006)(66446008)(316002)(4326008)(8676002)(86362001)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXJNSi9XSUI4dXR3VytrclVWWVZiUys2K3B4NWViMEo4T3lzWUREcmZVMlBr?=
 =?utf-8?B?Q3MwblJ3VUdkcFhaeVFzVldsZU1IMEZ0aHRIay84d3lsVVBSVGZFa1hIdmpw?=
 =?utf-8?B?cm9NNmw0bitRYlVQQk5BOXU2QjBGdm0yR0JkbU9QcnJaN0ZybHg3ZWlpMVJx?=
 =?utf-8?B?Ym44MXlNT3hkb1QrVXdZZHp5VWxaS0tNVG5xNHJ2WHBqd01WLy9GUVVTcUsy?=
 =?utf-8?B?aVJkdWphcXhFUW51dHRQSnJpTkhUdG85TzBRZlJxWUFubmVKYVNTZm9aQ1R0?=
 =?utf-8?B?aEZObUxHUlpubk9qa1Q3QWZ3SmVwdTkrWi9sbWR3NFRaK2QrOUp3aTBSVGV1?=
 =?utf-8?B?dHR1RFUrdkl2VGtlb1krMmI3eWVoMzNwYjMyVkEvZEs0YURJVHpwRmF2VTdC?=
 =?utf-8?B?SkZraHJOUytCbkNURUtvK1JidXhnU3NxOVhwa09nTzRZYjdqNkJwNkN2ZEcz?=
 =?utf-8?B?QVN6N05MTjI3c0E2R01IQ1dXeWlSUTZ6dkRBQkZtOVA5RkgrcWJ0WG9JeFlK?=
 =?utf-8?B?c0orZ3NqOHJ2aXpzRlVUK05JOHJqbkFVd3VNd0J1dDJzcHY0UG9kOWZJMUlp?=
 =?utf-8?B?SjFxWWk0ZVhiejdDOG5XSStxR01pU3lmaW1BSGI4Sk9MTTVCU1l4ZVd0SXpa?=
 =?utf-8?B?cHRJWFRvcWxlYTZERFdZbVlSUVhhRGV0Q2ZYS1B3T3FiYlM1bEFiZ0tzSDVF?=
 =?utf-8?B?RitVbmR6UWJYUUhlTWgrMWIwSkhJdkVpbC9KRWRZbThlR3BvTlFkdGdFWGEr?=
 =?utf-8?B?ay8zejI1cUYrTDNyTUN6RTgwQjVOQkZ5Kzl6Mm43UzZ0Y3FUYUVpd1B4WHFL?=
 =?utf-8?B?RXBndCt1NUcyUVgxTm5TSEZZWW43eW5maWlMeTRoY2xrUUdWK1ZxRWtVZXVV?=
 =?utf-8?B?RjFtVnh2WTZmdDFrV2poelB4VTBiYW1LT1Nic1NpcUFOcWtxR1ltYkk0ZTNw?=
 =?utf-8?B?SEpWOVR5NGU4SndURDFuTVJ0cjJSRUJUa2txUTBvcWtvZFBLSUJtSFZGOHhh?=
 =?utf-8?B?VUhDZ3pkNkx5TGNadzlEOU5LRWlZVjNwNSsyNUNJeWJpNDcrK2dUc3h1RG0y?=
 =?utf-8?B?SGhoUC83VVpIdWlZd3g1dFdvRGl1blp1a2ZSTjhrQUdFQmc0cWhWcm5lcEsv?=
 =?utf-8?B?Mzhac1k0NXV0bEVvRys4VS9aazJ4VkdZSUNJNzRyQWtWZnc2T0IwTXBjcEg5?=
 =?utf-8?B?czNPSGN4TFFVOHpLOWczQjFZWkZBMEdGY3ZyRUNlTzNmNUMxdzdCWFlGMUNh?=
 =?utf-8?B?VnQ2MkxaVDhSeVY1MVRMR2FieHU1YVEweHVENEJXbDlUUFV6dVEvOCt4ZW9y?=
 =?utf-8?B?TkFteGJ3RkZSK3pCNkJ1Q0ZSaHc3WUtBdXV4U0RsbmVLbEFsNFU1ZEs4NnJZ?=
 =?utf-8?B?Y0daNVJrWWd5MnhLQ2paY1BralJXWVhTOHhpcE9ERlZtK0JXd0JxRGhJZHJX?=
 =?utf-8?B?OHc5L2p2Tmx0L2o0K0w1dW50SWYwNkJOZzBpQjRnZkVWZE96VS9NV1lUV1lE?=
 =?utf-8?B?UEVLanhWUVBmS0I4SEJ1eXdMT0xIeVBqS3VaYTJwTlAyWE9oMGZySk9qakdh?=
 =?utf-8?B?NDk5QjBkaTJDcXNkWGlycFltMDZmbGpTN25PUzAvSFZZZWMzRTArMU5DY25V?=
 =?utf-8?B?RWthYUowZnpvcWhXbEY5VXZraDdxdUU3NVBOZjN0UWhHc0V1N0VGZWg2MDJq?=
 =?utf-8?B?Y1hnMDF6WDVkQkVVRVFXOFAwd0tJenZ3Uy9OTjczdWdBOGhRN3dkTkVjQTJJ?=
 =?utf-8?B?MVduT3dndHRIOGV0TEtJYitWQTZjRWVqaUV0cUgvYVFpU25uQWhWdkx1MDlF?=
 =?utf-8?B?aTh5R2t5bldMdTdCcmxoTDc0Z3I4bUhEdVhnWTVFYThYYmU3U0NTWmJ4bVVP?=
 =?utf-8?B?UjdTWTR6WFVZWWV3ckxqclNGcTd4MW9OOEpTMmFMMVpOenJtelhZb1kwZDln?=
 =?utf-8?Q?8Kbdo8Xqi9M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8229fb3-c5f2-4dfe-6022-08da089fd655
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 05:26:21.3994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pvwpv1CORLWyqSL6UX+SUOdkIKxrbTOvieEJ9jXDzOgauwrvklFZYBsmbqjg102jeNfTRf1IR9dzsrCOEaqTHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6586

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10geGVuL2FybTogQWRkIGkuTVggbHB1YXJ0IGVhcmx5
IHByaW50ayBzdXBwb3J0DQo+IA0KPiBIaSBQZW5nLA0KPiANCj4gT24gMjgvMDIvMjAyMiAwMTow
NywgUGVuZyBGYW4gKE9TUykgd3JvdGU6DQo+ID4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFuQG54
cC5jb20+DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNv
bT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9LY29uZmlnLmRlYnVnICAgICAgICAgICAg
ICB8IDE4ICsrKysrKysrKysNCj4gPiAgIHhlbi9hcmNoL2FybS9hcm02NC9kZWJ1Zy1pbXgtbHB1
YXJ0LmluYyB8IDQ4DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9h
cmNoL2FybS9hcm02NC9kZWJ1Zy1pbXgtbHB1YXJ0LmluYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9LY29uZmlnLmRlYnVnIGIveGVuL2FyY2gvYXJtL0tjb25maWcuZGVidWcN
Cj4gPiBpbmRleCAzNWNjZDEzMjczLi45ZWNiNDQ2YjNhIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9h
cmNoL2FybS9LY29uZmlnLmRlYnVnDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL0tjb25maWcuZGVi
dWcNCj4gPiBAQCAtNTUsNiArNTUsMjAgQEAgY2hvaWNlDQo+ID4gICAJCQlzZWxlY3Rpbmcgb25l
IG9mIHRoZSBwbGF0Zm9ybSBzcGVjaWZpYyBvcHRpb25zIGJlbG93IGlmDQo+ID4gICAJCQl5b3Ug
a25vdyB0aGUgcGFyYW1ldGVycyBmb3IgdGhlIHBvcnQuDQo+ID4NCj4gPiArCQkJVGhpcyBvcHRp
b24gaXMgcHJlZmVycmVkIG92ZXIgdGhlIHBsYXRmb3JtIHNwZWNpZmljDQo+ID4gKwkJCW9wdGlv
bnM7IHRoZSBwbGF0Zm9ybSBzcGVjaWZpYyBvcHRpb25zIGFyZSBkZXByZWNhdGVkDQo+ID4gKwkJ
CWFuZCB3aWxsIHNvb24gYmUgcmVtb3ZlZC4NCj4gPiArCWNvbmZpZyBFQVJMWV9VQVJUX0NIT0lD
RV9JTVhfTFBVQVJUDQo+ID4gKwkJc2VsZWN0IEVBUkxZX1VBUlRfSU1YX0xQVUFSVA0KPiA+ICsJ
CWRlcGVuZHMgb24gQVJNXzY0DQo+ID4gKwkJYm9vbCAiRWFybHkgcHJpbnRrIHZpYSBpLk1YIExQ
VUFSVCINCj4gPiArCQloZWxwDQo+ID4gKwkJCVNheSBZIGhlcmUgaWYgeW91IHdpc2ggdGhlIGVh
cmx5IHByaW50ayB0byBkaXJlY3QgdGhlaXINCj4gPiArCQkJb3V0cHV0IHRvIGEgaS5NWCBMUFVB
UlQuIFlvdSBjYW4gdXNlIHRoaXMgb3B0aW9uIHRvDQo+ID4gKwkJCXByb3ZpZGUgdGhlIHBhcmFt
ZXRlcnMgZm9yIHRoZSBpLk1YIExQVUFSVCByYXRoZXIgdGhhbg0KPiA+ICsJCQlzZWxlY3Rpbmcg
b25lIG9mIHRoZSBwbGF0Zm9ybSBzcGVjaWZpYyBvcHRpb25zIGJlbG93IGlmDQo+ID4gKwkJCXlv
dSBrbm93IHRoZSBwYXJhbWV0ZXJzIGZvciB0aGUgcG9ydC4NCj4gDQo+IFBsYWZvcm0gc3BlY2lm
aWMgZWFybHkgcHJpbnRrIGFyZSBkZXByZWNhdGVkLiBTbyBJIHdvdWxkIHJhdGhlciBwcmVmZXIg
d2UgYXJlDQo+IG5vdCBpbnRyb2R1Y2luZyBuZXcgb25lLiBDYW4geW91IGFkanVzdCB0aGUgZGVz
Y3JpcHRpb24gdG8gcmVtb3ZlIGFueQ0KPiBtZW50aW9uIG9mIHBsYXRmb3JtIHNwZWNpZmljIG9w
dGlvbnM/DQoNClN1cmUsIGZpeCBpbiB2Mi4NCg0KPiANCj4gPiArDQo+ID4gICAJCQlUaGlzIG9w
dGlvbiBpcyBwcmVmZXJyZWQgb3ZlciB0aGUgcGxhdGZvcm0gc3BlY2lmaWMNCj4gPiAgIAkJCW9w
dGlvbnM7IHRoZSBwbGF0Zm9ybSBzcGVjaWZpYyBvcHRpb25zIGFyZSBkZXByZWNhdGVkDQo+ID4g
ICAJCQlhbmQgd2lsbCBzb29uIGJlIHJlbW92ZWQuDQo+ID4gQEAgLTE4Niw2ICsyMDAsOSBAQCBj
b25maWcgRUFSTFlfVUFSVF9DQURFTkNFDQo+ID4gICBjb25maWcgRUFSTFlfVUFSVF9FWFlOT1M0
MjEwDQo+ID4gICAJc2VsZWN0IEVBUkxZX1BSSU5USw0KPiA+ICAgCWJvb2wNCj4gPiArY29uZmln
IEVBUkxZX1VBUlRfSU1YX0xQVUFSVA0KPiA+ICsJc2VsZWN0IEVBUkxZX1BSSU5USw0KPiA+ICsJ
Ym9vbA0KPiA+ICAgY29uZmlnIEVBUkxZX1VBUlRfTUVTT04NCj4gPiAgIAlzZWxlY3QgRUFSTFlf
UFJJTlRLDQo+ID4gICAJYm9vbA0KPiA+IEBAIC0yODMsNiArMzAwLDcgQEAgY29uZmlnIEVBUkxZ
X1BSSU5US19JTkMNCj4gPiAgIAlkZWZhdWx0ICJkZWJ1Zy04MjUwLmluYyIgaWYgRUFSTFlfVUFS
VF84MjUwDQo+ID4gICAJZGVmYXVsdCAiZGVidWctY2FkZW5jZS5pbmMiIGlmIEVBUkxZX1VBUlRf
Q0FERU5DRQ0KPiA+ICAgCWRlZmF1bHQgImRlYnVnLWV4eW5vczQyMTAuaW5jIiBpZiBFQVJMWV9V
QVJUX0VYWU5PUzQyMTANCj4gPiArCWRlZmF1bHQgImRlYnVnLWlteC1scHVhcnQuaW5jIiBpZiBF
QVJMWV9VQVJUX0lNWF9MUFVBUlQNCj4gPiAgIAlkZWZhdWx0ICJkZWJ1Zy1tZXNvbi5pbmMiIGlm
IEVBUkxZX1VBUlRfTUVTT04NCj4gPiAgIAlkZWZhdWx0ICJkZWJ1Zy1tdmVidS5pbmMiIGlmIEVB
UkxZX1VBUlRfTVZFQlUNCj4gPiAgIAlkZWZhdWx0ICJkZWJ1Zy1wbDAxMS5pbmMiIGlmIEVBUkxZ
X1VBUlRfUEwwMTEgZGlmZiAtLWdpdA0KPiA+IGEveGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLWlt
eC1scHVhcnQuaW5jDQo+ID4gYi94ZW4vYXJjaC9hcm0vYXJtNjQvZGVidWctaW14LWxwdWFydC5p
bmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLjc1MTAy
MTBkNDYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2Rl
YnVnLWlteC1scHVhcnQuaW5jDQo+ID4gQEAgLTAsMCArMSw0OCBAQA0KPiA+ICsvKg0KPiA+ICsg
KiB4ZW4vYXJjaC9hcm0vYXJtNjQvZGVidWctaW14OHFtLmluYw0KPiA+ICsgKg0KPiA+ICsgKiBp
Lk1YOFFNIHNwZWNpZmljIGRlYnVnIGNvZGUNCj4gPiArICoNCj4gPiArICogUGVuZyBGYW4gPHBl
bmcuZmFuQG54cC5jb20+DQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxNiBGcmVlc2NhbGUgSW5j
Lg0KPiA+ICsgKg0KPiA+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNh
biByZWRpc3RyaWJ1dGUgaXQgYW5kL29yDQo+ID4gK21vZGlmeQ0KPiA+ICsgKiBpdCB1bmRlciB0
aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZA0K
PiA+ICtieQ0KPiA+ICsgKiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVy
c2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcg0KPiA+ICsgKiAoYXQgeW91ciBvcHRpb24pIGFueSBs
YXRlciB2ZXJzaW9uLg0KPiA+ICsgKg0KPiA+ICsgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0
ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwNCj4gPiArICogYnV0IFdJVEhP
VVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YNCj4g
PiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NF
LiAgU2VlIHRoZQ0KPiA+ICsgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBk
ZXRhaWxzLg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDx4ZW4vaW14LWxwdWFydC5o
Pg0KPiA+ICsNCj4gPiArLm1hY3JvIGVhcmx5X3VhcnRfaW5pdCB3YiB3YyB3ZA0KPiA+ICsvKiBB
bHJlYWR5IGluaXRpYWxpemVkIGluIGJvb3Rsb2FkZXIgKi8gLmVuZG0NCj4gDQo+IE5JVDogSSB3
b3VsZCBhZGQgYSBuZXdsaW5lIHRvIHNlcGFyYXRlIHdpdGggdGhpcyBtYWNybyBmcm9tIG5leHQg
b25lLg0KDQpGaXggaW4gdjIuDQoNCj4gDQo+ID4gKy8qIGkuTVg4UU0gd2FpdCBMUFVBUlQgdG8g
YmUgcmVhZHkgdG8gdHJhbnNtaXQNCj4gPiArICogcmI6IHJlZ2lzdGVyIHdoaWNoIGNvbnRhaW5z
IHRoZSBVQVJUIGJhc2UgYWRkcmVzcw0KPiA+ICsgKiByYzogc2NyYXRjaCByZWdpc3Rlcg0KPiA+
ICsgKi8NCj4gDQo+IFRoZSBjb2Rpbmcgc3R5bGUgZm9yIG11bHRpLWxpbmVzIGNvbW1lbnQgaXM6
DQoNCkZpeCBpbiB2Mi4gVGhhbmtzLg0KDQo+IA0KPiAvKg0KPiAgICogRm9vDQo+ICAgKiBCYXIN
Cj4gICAqLw0KPiANCj4gPiArLm1hY3JvIGVhcmx5X3VhcnRfcmVhZHkgeGIsIGMNCj4gPiArMToN
Cj4gPiArICAgICAgICBsZHIgICB3XGMsIFtceGIsICNVQVJUU1RBVF0gICAvKiA8LSBGbGFnIHJl
Z2lzdGVyICovDQo+ID4gKyAgICAgICAgdHN0ICAgd1xjLCAjVUFSVFNUQVRfVERSRSAgICAgLyog
Q2hlY2sgRklGTyBFTVBUWSBiaXQgKi8NCj4gPiArICAgICAgICBiZXEgICAxYiAgICAgICAgICAg
ICAgICAgICAgICAvKiBXYWl0IGZvciB0aGUgVUFSVCB0byBiZQ0KPiByZWFkeSAqLw0KPiA+ICsu
ZW5kbQ0KPiA+ICsNCj4gPiArLyogaS5NWDhRTSBMUFVBUlQgdHJhbnNtaXQgY2hhcmFjdGVyDQo+
ID4gKyAqIHJiOiByZWdpc3RlciB3aGljaCBjb250YWlucyB0aGUgVUFSVCBiYXNlIGFkZHJlc3MN
Cj4gPiArICogcnQ6IHJlZ2lzdGVyIHdoaWNoIGNvbnRhaW5zIHRoZSBjaGFyYWN0ZXIgdG8gdHJh
bnNtaXQgKi8NCj4gDQo+IENvZGluZyBzdHlsZToNCg0KRml4IGluIFYyLg0KDQpUaGFua3MsDQpQ
ZW5nLg0KPiANCj4gLyoNCj4gICAqIEZvbw0KPiAgICogQmFyDQo+ICAgKi8NCj4gDQo+ID4gKy5t
YWNybyBlYXJseV91YXJ0X3RyYW5zbWl0IHhiLCB3dA0KPiA+ICsgICAgICAgIHN0ciAgIFx3dCwg
W1x4YiwgI1VBUlREQVRBXSAgLyogLT4gRGF0YSBSZWdpc3RlciAqLw0KPiA+ICsuZW5kbQ0KPiA+
ICsNCj4gPiArLyoNCj4gPiArICogTG9jYWwgdmFyaWFibGVzOg0KPiA+ICsgKiBtb2RlOiBBU00N
Cj4gPiArICogaW5kZW50LXRhYnMtbW9kZTogbmlsDQo+ID4gKyAqIEVuZDoNCj4gPiArICovDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg0K

