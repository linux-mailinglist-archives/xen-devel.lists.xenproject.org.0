Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17619848C8A
	for <lists+xen-devel@lfdr.de>; Sun,  4 Feb 2024 10:41:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675523.1050935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWYzK-0003zj-BY; Sun, 04 Feb 2024 09:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675523.1050935; Sun, 04 Feb 2024 09:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWYzK-0003xM-7R; Sun, 04 Feb 2024 09:40:34 +0000
Received: by outflank-mailman (input) for mailman id 675523;
 Sun, 04 Feb 2024 09:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uT9t=JN=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rWYzI-0003xF-WC
 for xen-devel@lists.xenproject.org; Sun, 04 Feb 2024 09:40:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2611::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fd552ae-c341-11ee-8a45-1f161083a0e0;
 Sun, 04 Feb 2024 10:40:31 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB7605.eurprd04.prod.outlook.com (2603:10a6:20b:292::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Sun, 4 Feb
 2024 09:40:28 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6%3]) with mapi id 15.20.7249.032; Sun, 4 Feb 2024
 09:40:28 +0000
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
X-Inumbo-ID: 6fd552ae-c341-11ee-8a45-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKs2ETrvV5WPzJExL7tKmM/Rq3dW5HIoJIZj0bZYhJi5W/PU63y4UC92/GFCgNvI79AvtTaFvtxzzOarymqqHn0yOW+Wus539N4MVwL/znNb7hmJni/kEpMm7NktosOKz8kqQZEPsj6w5x1b+mUuuaodl6V866sLdwFmaxd3yV1darUSPKa184b5fhtYoJTsorL+q0VzFE1z9Xem5+F74lEZLyguZKhbScEilQsQDCbnlzGS+lyOQVH01k6Qe7jcIEk8kD6isoFRFv5bmWLlocyPxU20ODg8MiHY0VSuLdeHCkfq6Gd1yqQSOgr1Q4y5ANJpEOn8u39o3fADIg0qnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55rW2s57Br8Fac3uaZ9y6xYDTKErO+HNI1Kc8z05vEs=;
 b=mehypZW/yq40QIT+Hwz8F4szy/3xmZzlFG2SbcZl0KYOhsZY6Zw2IOI1WCBHG04uaAMWUPW+zpH3oUUBwEr5xuKjqMPNiG32pLX6/XaKxmI3ovqS7BgFMml5E1h7P+MzcpM1OkXL4Ap0EmgkH0EHrso46SdriA7//4Axr0YaWOc4vJiKsQWSAKAkkhwJa2H4TWbIDmazEB1QxzqKLQWpnbwRKwrLMxURmiSS3OdvdkhuNvWpqP1td94yd0Bg3HV4K2dV86rz6PmoCpcrwRzYINZDGhVQOtBi52eUsmqPrM/mTphtfOnwTkKC1qVvyTIbsxx8jd3Nd3FzH+Dt2OXRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55rW2s57Br8Fac3uaZ9y6xYDTKErO+HNI1Kc8z05vEs=;
 b=pETYcx0Sy42dq+Lix2cJamMXs7x5owucsZt0fJdtyLBpmiW8Zrzk6WqQNE7383/qxZgBb/lD8U5xjzn0MXqm+w7L/dsJZGTsevmFdxtEBskKIGmF0ZStCVISXL9ONcS/nliC3APDE+/9KRn4qvWldy3Kp8k1QsViLHn3Ez3ZYos=
From: Peng Fan <peng.fan@nxp.com>
To: Julien Grall <julien@xen.org>, John Ernberg <john.ernberg@actia.se>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
CC: Jonas Blixt <jonas.blixt@actia.se>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index:
 AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5bDz198AgAA1LICAAVx4AIAAQjaAgAEdtQCAAynKwA==
Date: Sun, 4 Feb 2024 09:40:28 +0000
Message-ID:
 <DU0PR04MB94170CB1F77E3D594A6D0E9488402@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
 <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
 <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
 <a265ea2d-9b5f-4726-9395-448b1b669839@actia.se>
 <012b5f83-2f9b-4477-965e-07b8506c0052@xen.org>
In-Reply-To: <012b5f83-2f9b-4477-965e-07b8506c0052@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AS8PR04MB7605:EE_
x-ms-office365-filtering-correlation-id: e8a18df2-bc08-4a2b-ea61-08dc256552ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eUFoLlSHnoiwHoKcuS4GHRU70DOZq7UTPTTwRTmOYpbmh6EEJv3MzusCIbG7jt7/O+9exiqceocM6KW4H9RbebMII3m6hZXjJKVTlbu6gEmgy6HROyziFMK8gM+pSW41MQUE2KRp3G0ScZuNLDuFTJoagiC0GBcUoGZKw12XbN2kZXLaKAhG3QICgyXqrljt82+RWPhojZQ7Ix+DPEUPUATBANTP66ZkoWyXy1SXNohCHFrOE7JKwZ0pHymIfl0LzzaTBzUp9Kub32XdBZSGwqW3JeQTh+VsbU07MxEU7hTZEbmg9VmhEdcVOID+LwtVCkweqFoR50reFxsBvabuW7Kc3lKBhV43NKYwrKmY8CX3yl+U3G2+CAj5GjCsH6vbgAO0r770b+nIi3DRol2kGbcRoRAbtj/BcWIILvijQH7S44qNMRUq81IfHxGwmbC6TqomJCeJfQFp5Q8jhgdEQN3Q5VS3yf0MjQyVVV4+BZUDcuirx/iBEf6JC9MV919huk/0FkRtlwV1XbcKgAlk9fKt1gLXEYYfnpxm6E4cD/OkhzFIrpbWNdRDe51dstMZC0pERF2ZpUy/gOdXGQjnCb+KbTl3hGfA4HePP/QidYAKamzuysK9e175HBBllbXZsuTBInxk5I9bYvCYkhc+eg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(396003)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(66556008)(7696005)(66446008)(6506007)(66476007)(478600001)(53546011)(316002)(66946007)(54906003)(9686003)(76116006)(64756008)(8676002)(110136005)(8936002)(26005)(71200400001)(4326008)(52536014)(5660300002)(44832011)(2906002)(83380400001)(41300700001)(38070700009)(122000001)(33656002)(38100700002)(86362001)(55016003)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TVVFQlFnVFpDSnBoZVlVUnlqSk4wSWlzZHBhRW0wUERTYTJFYWcvZ0tUM2Zu?=
 =?utf-8?B?OFlxUFVsOFUvSktLMFBQcnMwQndOZHB1R3RBa1pZdzJXbTIvSmJFTUNtV0FI?=
 =?utf-8?B?TVhoTGxZNFdxYmVpdnIrcW5EN2xXNmF6MSthL3o3RyttdmtEUlBEcFBRVDBt?=
 =?utf-8?B?TDNQaVlNZ3FkZTVGSlhhR0VjMFBJdllGWjFMY2IvdyswbUhQbTQranpxY25H?=
 =?utf-8?B?S0xBSEprelduckpGUWFTcGxkdE5TSHZsaGdibmJ3Tm5kR1FESWp1d1BZYXA1?=
 =?utf-8?B?WmpPbTlOSVROenhUQVdDY242T1NYUEE3akZyZGZZQkpBNWRINWZ1aFdNMEJH?=
 =?utf-8?B?SXc5YkpTWHY1cUFaemtLSHd4WmZWUnlMa3dnUzNlVFZKMW1MbnZGMTVOWi9k?=
 =?utf-8?B?bU55VWhFa2lyc0ZQWWZpQWc2NVVEWkhzS21aRlVudWgya2xsdjhheFhPZVpF?=
 =?utf-8?B?T1ZKaW50SG12S2NKdVBRL0VJZWU2Tm5GcitKZ0N5RDR4eUtnUU8yeFg4WFZM?=
 =?utf-8?B?TUpRWDFWVmk1TDJwbXFaTTdhbXo2Zm5RR1k3UUVrNHV0RThWSVQwQ1AvZjky?=
 =?utf-8?B?SVZDMVIrZTF1dXBKaDJRNDZsTSt3ZVlXZHVUUGNGZUc5b1NUS09xSzBxVHZj?=
 =?utf-8?B?WTJoUGdsOThVOHVwNzNKUEMxeXBkQ2xJb2hmNnExQ3pTajFTRHhMWU85eGVJ?=
 =?utf-8?B?Yy9RNGk0TU1kU0ZQUTFCajJkbS9IM1hYYUtZK1l5TDdRY21xRkNpMFhSR3NU?=
 =?utf-8?B?S0tMUjNXU3NVRWQ0T0pIL3RiTXV5VjN5M0NlNmF0OHhMeTBmZ2dMMjljYTk3?=
 =?utf-8?B?RVFFOG1LTlJvdnd6Y2ZFbFY1TktHTTVrQmhrdW1IMHYxL0ZIaWNMSEt4aC9G?=
 =?utf-8?B?UU4yM0pqcGZ2UTNDcFozU3NCNzhkSnFlZ3FIQlFyRzcweWlHNzVpckxqSkZG?=
 =?utf-8?B?Y25xL2hFVHNMRStBTlBnSnJzVzFrenFtMUI1bFUrYS9GVk5UWmJ1NytLZTFD?=
 =?utf-8?B?Q2lSbXlNYW1ac2pDOUMxME0relpZMDU5UDYwQ0JLT0Frc0RKSHpDU0p3c1BM?=
 =?utf-8?B?cllIZWh4aVFGdm9RNTlnYTc4bWFkTnc4Q0diR1ppSFhxK3YxeHk3Mnh3eFkv?=
 =?utf-8?B?dXhhcVJFTTZueUl5eHR4WnVJSWlKTXRIczNCK1pGOGhtOFJVZXNVYTB5TFlX?=
 =?utf-8?B?bkdKOGxlYzU5SW5pV3J5bm5nQU5uNXMyNERpdXp2bGRMRjR3UVFRdmluQTYv?=
 =?utf-8?B?QUpubS8wcmV3dkhKcGRrUUJLaG0yQ1czSGVlMmVTUVYxR2o4TVAyYlpzRm5H?=
 =?utf-8?B?OWE1NnlYWVQ4YUZyMWhLYXRpdE54U0FZSEZiTzM5VVBXdVYyK1FFWFdSbXkr?=
 =?utf-8?B?M2V3U280aGlwYWV5djRKemh1UXU4VGdpa2xTalAzVzlkMGhJOE9Ma3liM3U2?=
 =?utf-8?B?bjRsSU1pd0dNS081eXR1K1RoT1B2cExQNi93a01uVUozQ092WWhNL3B1aHVB?=
 =?utf-8?B?b3JOdmI3YkVWelpzbTlDa2pCOFlDN2N5QzlpNXVuSEFPd0tsU1YzS0grTU5r?=
 =?utf-8?B?Z3Jqb05xTWJqWXh4T1V4R1orR3NLWUF0MzA0Ym1TQlY4bjRpYkRSS2x4UWFI?=
 =?utf-8?B?QUlhclFFTEhidGNXV3p1b0tHOUdVc2Z1R2dwSk5UL1E5blBlZzNXVU9rTVVo?=
 =?utf-8?B?dGQxQlkxNHlNcm0ybTNYK3Z3b3E0QkpsUzEzQko3UWY4b0d0TSt3Y2JwQ2JF?=
 =?utf-8?B?bnN1eHZub0dUdTZJTkhra0dBY3RsMzF1MHdxN0ZpNUxERFlxcDZxcElacVE3?=
 =?utf-8?B?Qm92TE1NT05hbDBZVXc4T0lmSzdzUlZob3R0SjF2cC8yemU5UGNiYWdnRUNP?=
 =?utf-8?B?RVRFNWhkbU15Z213VWRIUXZTNXV0KzRIV3BkZW93ZDBlVDZrV2xxNE9IbTdr?=
 =?utf-8?B?NWQzeHQyaUhoTXhoaEF4SkxRc0hpckVTZUJjamxXRCs5OUpjeDN4S2RuTUQ5?=
 =?utf-8?B?QVhjdWRRcXdqSUNScU5aVFNlS0EzTWtPd1Z4U21UNjY3aFltUjNtMUFOeWR3?=
 =?utf-8?B?Rkg0MGFwOFcyY3RIUzlvalE5cmtrTDBTZUVDbHVHM2RmNkFSZzB6ZXlLNDRu?=
 =?utf-8?Q?PMPc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a18df2-bc08-4a2b-ea61-08dc256552ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2024 09:40:28.8188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dq6dNCrUvA0tTHExJP6mocgEAwM9hQYMoB2PB+t5suXGodapUEBYA95/4N7qltWl08TxsAdYnZHlkzrAvt2UlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7605

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4NCj4gU2VudDogMjAyNOW5tDLmnIgy5pelIDE3OjIwDQo+IFRvOiBKb2hu
IEVybmJlcmcgPGpvaG4uZXJuYmVyZ0BhY3RpYS5zZT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1
aXNAYXJtLmNvbT47DQo+IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+OyBWb2xv
ZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBQZW5nIEZhbiA8
cGVuZy5mYW5AbnhwLmNvbT4NCj4gQ2M6IEpvbmFzIEJsaXh0IDxqb25hcy5ibGl4dEBhY3RpYS5z
ZT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDEvMl0geGVuL2FybTogQWRkIGlteDhxe20seH0gcGxhdGZvcm0gZ2x1ZQ0KPiANCj4gT24gMDEv
MDIvMjAyNCAxNjoxNywgSm9obiBFcm5iZXJnIHdyb3RlOg0KPiA+IE9uIDIvMS8yNCAxMzoyMCwg
SnVsaWVuIEdyYWxsIHdyb3RlOg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiAzMS8wMS8yMDI0IDE1OjMy
LCBKb2huIEVybmJlcmcgd3JvdGU6DQo+ID4+PiBIaSBKdWxpZW4sDQo+ID4+DQo+ID4+IEhpIEpv
aG4sDQo+ID4+DQo+ID4+PiBPbiAxLzMxLzI0IDEzOjIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+
ID4+Pj4gSGksDQo+ID4+Pj4NCj4gPj4+PiBPbiAzMS8wMS8yMDI0IDExOjUwLCBKb2huIEVybmJl
cmcgd3JvdGU6DQo+ID4+Pj4+IFdoZW4gdXNpbmcgTGludXggZm9yIGRvbTAgdGhlcmUgYXJlIGEg
YnVuY2ggb2YgZHJpdmVycyB0aGF0IG5lZWQNCj4gPj4+Pj4gdG8gZG8gU01DIFNJUCBjYWxscyBp
bnRvIHRoZSBQU0NJIHByb3ZpZGVyIHRvIGVuYWJsZSBjZXJ0YWluDQo+ID4+Pj4+IGhhcmR3YXJl
IGJpdHMgbGlrZSB0aGUgd2F0Y2hkb2cuDQo+ID4+Pj4NCj4gPj4+PiBEbyB5b3Uga25vdyB3aGlj
aCBwcm90b2NvbCB0aGlzIGlzIHVuZGVyIHRoZSBob29kLiBJcyB0aGlzIFNDTUk/DQo+ID4+Pg0K
PiA+Pj4gSSB0aGluayBJIGNvbmZ1c2VkIG15c2VsZiBoZXJlIHdoZW4gSSB3cm90ZSB0aGUgY29t
bWl0IGxvZy4NCj4gPj4+DQo+ID4+PiBUaGUgRUwzIGNvZGUgaW4gb3VyIGNhc2UgaXMgQVRGLCBh
bmQgaXQgZG9lcyBub3QgYXBwZWFyIHRvIGJlIFNDTUksDQo+ID4+PiBub3IgUFNDSS4gVGhlIHJl
Z2lzdGVyIHVzYWdlIG9mIHRoZXNlIFNNQyBTSVAgY2FsbHMgYXJlIGFzIGZvbGxvd3M6DQo+ID4+
PiBhMCAtIHNlcnZpY2UNCj4gPj4+IGExIC0gZnVuY3Rpb24NCj4gPj4+IGEyLWE3IC0gYXJncw0K
PiA+Pj4NCj4gPj4+IEluIEFURiB0aGUgaGFuZGxlciBpcyBkZWNsYXJlZCBhcyBhIHJ1bnRpbWUg
c2VydmljZS4NCj4gPj4+DQo+ID4+PiBXb3VsZCB0aGUgYXBwcm9wcmlhdGUgY29tbW1pdCBtZXNz
YWdlIGhlcmUgYmUgc29tZXRoaW5nIGFsb25nIHRoZQ0KPiA+Pj4gbGluZXMgb2YgYmVsb3c/DQo+
ID4+PiAiIiINCj4gPj4+IFdoZW4gdXNpbmcgTGludXggZm9yIGRvbTAgdGhlcmUgYXJlIGEgYnVu
Y2ggb2YgZHJpdmVycyB0aGF0IG5lZWQgdG8NCj4gPj4+IGRvwqDCoCBTTUMgU0lQIGNhbGxzIGlu
dG8gdGhlIGZpcm13YXJlIHRvIGVuYWJsZSBjZXJ0YWluIGhhcmR3YXJlIGJpdHMNCj4gPj4+IGxp
a2UgdGhlIHdhdGNoZG9nLg0KPiA+Pj4gIiIiDQo+ID4+DQo+ID4+IEl0IHJlYWRzIGJldHRlciB0
aGFua3MuDQo+ID4+DQo+ID4+IFsuLi5dDQo+ID4+DQo+ID4+Pj4gQnV0IGV2ZW4gaWYgd2UgcmVz
dHJpY3QgdG8gZG9tMCwgaGF2ZSB5b3UgY2hlY2tlZCB0aGF0IG5vbmUgb2YgdGhlDQo+ID4+Pj4g
U01DcyB1c2UgYnVmZmVycz8NCj4gPj4+IEkgaGF2ZW4ndCBmb3VuZCBhbnkgc3VjaCBpbnN0YW5j
ZXMgaW4gdGhlIExpbnV4IGtlcm5lbCB3aGVyZSBhDQo+ID4+PiBidWZmZXIgaXMgdXNlZC4gQWRk
aW5nIGEgY2FsbCBmaWx0ZXJpbmcgbGlrZSBzdWdnZXN0ZWQgYmVsb3cNCj4gPj4+IGFkZGl0aW9u
cyBvZiBzdWNoIGZ1bmN0aW9ucyBjYW4gYmUgZGlzY292ZXJlZCBhbmQgYWRhcHRlZCBmb3IgaWYg
dGhleQ0KPiB3b3VsZCBzaG93IHVwIGxhdGVyLg0KPiA+Pj4+DQo+ID4+Pj4gUmF0aGVyIHRoYW4g
cHJvdmlkaW5nIGEgYmxhbmtldCBmb3J3YXJkLCB0byBtZSBpdCBzb3VuZHMgbW9yZSBsaWtlDQo+
ID4+Pj4geW91IHdhbnQgdG8gcHJvdmlkZSBhbiBhbGxvd2xpc3Qgb2YgdGhlIFNNQ3MuIFRoaXMg
aXMgbW9yZQ0KPiA+Pj4+IGZ1dHVyZXByb29mIGFuZCBhdm9pZCB0aGUgcmlzayB0byBleHBvc2Ug
dW5zYWZlIFNNQ3MgdG8gYW55IGRvbWFpbi4NCj4gPj4+Pg0KPiA+Pj4+IEZvciBhbiBleGFtcGxl
LCB5b3UgY2FuIGhhdmUgYSBsb29rIGF0IHRoZSBFRU1JIG1lZGlhdG9yIGZvciBYaWxpbnguDQo+
ID4+Pg0KPiA+Pj4gQWNrLiBEbyB5b3UgcHJlZmVyIHRvIHNlZSBvbmx5IG9uIFNNQ0NDIHNlcnZp
Y2UgbGV2ZWwgb3IgYWxzbyBvbg0KPiA+Pj4gZnVuY3Rpb24gbGV2ZWw/IChhMSByZWdpc3Rlciwg
cGVyIGRlc2NyaXB0aW9uIGVhcmxpZXIpDQo+ID4+DQo+ID4+IEkgYW0gbm90IHN1cmUuIEl0IHdp
bGwgZGVwZW5kIG9uIHdoZXRoZXIgaXQgaXMgY29ycmVjdCB0byBleHBvc2UNCj4gPj4gKmFsbCog
dGhlIGZ1bmN0aW9ucyB3aXRoaW4gYSBzZXJ2aWNlIGxldmVsIGFuZCB0aGV5IGhhdmUgdGhlIHNh
bWUgZm9ybWF0Lg0KPiA+Pg0KPiA+PiBJZiB5b3UgY2FuJ3QgZ3VhcmFudGVlIHRoYXQsIHRoZW4g
eW91IHdpbGwgbW9zdCBsaWtlbHkgbmVlZCB0bw0KPiA+PiBhbGxvd2xpc3QgYXQgdGhlIGZ1bmN0
aW9uIGxldmVsLg0KPiA+Pg0KPiA+PiBBbHNvLCBkbyB5b3UgaGF2ZSBhIHNwZWMgaW4gaGFuZCB0
aGF0IHdvdWxkIGhlbHAgdG8gdW5kZXJzdGFuZCB3aGljaA0KPiA+PiBzZXJ2aWNlL2Z1bmN0aW9u
IGlzIGltcGxlbWVudGVkIHZpYSB0aG9zZSBTTUNzPw0KPiA+DQo+ID4gSSBkb24ndCBoYXZlIHRo
ZSBzcGVjIHVuZm9ydHVuYXRlbHksIGJ1dCBJIHdpbGwgYWRkIGEgZmlsdGVyIG9uIGJvdGgNCj4g
PiBzZXJ2aWNlIGFuZCBmdW5jdGlvbiBmb3IgVjIgYW5kIHdlJ2xsIHRha2UgaXQgZnJvbSB0aGVy
ZS4NCj4gDQo+IEBQZW5nLCBkbyB5b3UgaGF2ZSBhbnkgc3BlY2lmaWNhdGlvbiB5b3UgY291bGQg
c2hhcmU/IEhvdyBzdGFibGUgaXMgdGhlDQo+IGludGVyZmFjZT8NCg0KTm8gc3BlY2lmaWNhdGlv
biwgdGhlIHVzZSBpcyBJTVhfU0lQX1ggaW4gbGludXgga2VybmVsIHNvdXJjZS4NCg0KU3VjaCBh
cyBJTVhfU0lQX1JUQywgSU1YX1NJUF9USU1FUg0KDQpJdCBpcyBzdGFibGUgYW5kIG5vIGNoYW5n
ZSwgd2Ugb25seSBhZGQgbmV3IFNJUCBtYWNybyBpZiBuZWVkZWQNCmFuZCBubyBjaGFuZ2UgdGhl
IG1lYW5pbmcgb3IgcmV1c2Ugb2xkIFNJUC4NCg0KUmVnYXJkcywNClBlbmcuDQoNCj4gDQo+IENo
ZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

