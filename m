Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C178C217F4E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 08:00:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt37J-00038v-9C; Wed, 08 Jul 2020 05:59:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNBQ=AT=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jt37H-00038q-Sn
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 05:59:36 +0000
X-Inumbo-ID: 3215bee4-c0e0-11ea-bb8b-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.48]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3215bee4-c0e0-11ea-bb8b-bc764e2007e4;
 Wed, 08 Jul 2020 05:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=du/7gS0JjyMYmY2QnHsRiWDq8G4QGnJsFOXsRpIzraxavp7tMBNfePkftRhiVlPcmz1L3pNdEei3nx0B0pUX9cNAks7RTHdIWJbrHOCz49zTtoxqS4GFonmjXEl3Tr7VFWoRN2YE9I39Q3P3NmH7SGsUfrnILhkcTxEzTAz0QelSy88uReNv/KcCbDK0QQ+uNEyFeDWJaVrHyWOHeqvzX+qVfwoksdfUX3TwU3d7nGU3tzbmVCEcUmEDIwzbljIojOcZ2MOghw9haGavl3FKUzflEuQ8u2geei9EfuICVdcmJxCtiavF3OmzFq1MuYazEaEJf9vsGfXXCSGQ9A+iuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkZben1qMnLj1VM1VKV6UvVAcUqY5BtSCC6VYfncShA=;
 b=UwerMGGjATM/T7Jw7/pg71wHLm6WERkCO++Daj/8E/Iyj6QxtS6dDYjwuDLUuXvGo50o+HiEPe1xQhfbSIlX+HfJVHp5p3ktJe8QU2umZZVtgWqdM51UgQxDlYtvPtcM3C4Q5wgHLO1I5/kd6AyODhZOn4i3KatO09gRC3UVqy5Xuy+dHiJYSb3oE/RA5cUWzc9B5O96uClEHCdWU3Oo7MOqOvTb6uXlfM+/Eod6yOZvXwkDj5KYeqP006hXsmvMDQd0V8xo9ZXT2oBZ63oFziFnGjulwlnNRVR3DzIPIsBXxtAgUIcsNwGpQYi9tHNSXUN68HJkKcm8T3lpdaRPxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkZben1qMnLj1VM1VKV6UvVAcUqY5BtSCC6VYfncShA=;
 b=4CdfZMYGfimy9jke+yok6b23xX657LXM1XC5wxYSkPfA+Gbiwe4mc+up0R3NbPR/P8SQVw5wqb/5C5zx4yrvFuDXSby+1bBEO1NKla5fFpR5jp/OOh59X5Ai/IRdxI6WUZAFKxYp0PBN9RKVQHx5y/erKjcZlZkLjzoj+6u2PECp5fHmUSHxbvzbZt5uZ4cXCvmXsc/4kXZU7sz8oB3sqs6je/jFeE0TZU1Y33KAdbq9ywGMrPuhGH/cAnA/2/JiQSqCJY7mHCELCejiTnAsMam3hJrNVt/Dd7YVrKHbLg0TLPklg2BC3CTQ4dkz0ZRB31WS+lB6RG1R/uQFt1aBoQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6323.eurprd03.prod.outlook.com (2603:10a6:20b:159::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Wed, 8 Jul
 2020 05:59:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508%9]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 05:59:32 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "paul@xen.org" <paul@xen.org>
Subject: Re: [PATCH v2] xen/displif: Protocol version 2
Thread-Topic: [PATCH v2] xen/displif: Protocol version 2
Thread-Index: AQHWT3f2pfc1d0tAak69A/eTMH1j5qjyit6AgAAWp4CAAUH0AIAACwsAgAAL5oCACUCJAA==
Date: Wed, 8 Jul 2020 05:59:32 +0000
Message-ID: <9bef2cd8-2ff4-2507-efc5-ed087333455c@epam.com>
References: <20200701071923.18883-1-andr2000@gmail.com>
 <dffd127d-c5a1-4c77-baa8-f1d931145bc4@suse.com>
 <b5a6e034-4d52-d6b2-7c14-3c44c4a19cc3@epam.com>
 <e442e4d9-fe79-7f65-c196-2a0a35923492@suse.com>
 <f50ec904-8cb2-2bd6-c3ba-35e8c44bd607@epam.com>
 <be21be56-ea1b-e558-6905-a6cb3e5e4849@suse.com>
In-Reply-To: <be21be56-ea1b-e558-6905-a6cb3e5e4849@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20ead0b4-cb1a-4c87-d193-08d8230415dc
x-ms-traffictypediagnostic: AM0PR03MB6323:
x-microsoft-antispam-prvs: <AM0PR03MB6323A48FDEAC8F88A263038BE7670@AM0PR03MB6323.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04583CED1A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0DKK5V9/AzUe2pSrjOigVLrUrLVj9lTFVi1XrOTBuBzSlLFzK37MA5JDxMUOgSMLcXeqNrF3cNAA2xWSMZPXZ8bczQATDfrk9lBsQFlA2laK7Fva70ZD8mI0Mhk0Htt8lR1PjYbNcnLTQLVG0G7wmP8YUKG69UaYTZyMY2M5BukM10ls1/57ie8yPCRf/amaGYRXBUZq2W6e9SGOukHL0XKqB5e1pMcg8a0i6JExIzl3V7TRUQJNq42vHQHgY5iETMydcyI4uh3uhyI4E7dFokvFrqVJG/aVuk8cDMNX84MLJZ4vo+BU75fgIe8x47n1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(53546011)(6506007)(478600001)(83380400001)(5660300002)(8676002)(8936002)(2906002)(31686004)(186003)(26005)(36756003)(66574015)(86362001)(31696002)(2616005)(6486002)(6916009)(71200400001)(54906003)(66446008)(66556008)(64756008)(66476007)(91956017)(76116006)(66946007)(316002)(4326008)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: sRyp9idyElF/d4GYEeChL8M3ZysfL8pDfR1HhAXlECIvfIvcd4rtMwh3UClRozYbvS7tVE2KSe8ccDuiCwojfgNKcorVoT6jdSn4BQtjvW1fy25dCxWqPDoWqi4XskKkhN6mqn1xeW9ikd/qalvQBd7xrYRN4YR3s0bS6nRSr2GxdhDRMEyOmTpajkRYOpEEnn94Gx8nyF1LHa+9QEoYxrE6ALDhYPznO3zvRJzyF/saUHSCpUmcFa+i9guqrPM5ImNfipH2nYXMHJF95ABjo2mesE+um9uHxDS3jt/9odUJIaZKNugYu0ZmKHvXhdSGuVThL1/JA8h9yyQr8xkEzYgjpaf7Whoee6hJvSH/srKzUPn1d3UxYseC9uNp6UWGzhcjjG6ECY0mw6MukpGBP8sxAPl1h9gBwxevs261bpMDJk1320n0a/GB/CoXeIoXDZrkOW5CS/t3NPAL3M8fyu2fhN6fEURBAHRSvj93Z7E=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1DB7E96D656A84AA995342877F7CC7D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ead0b4-cb1a-4c87-d193-08d8230415dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 05:59:32.5673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LG+0ZgFzeJeDZZux0AdPswB02BMFsyZIvZpT6d/f2nJH1axtM/noHuJS39UDZi526ocdlvi+UxV578tUqs9po6ny2pxzdpPk8NERsFD7mXPxmfeM5TH0uggCf/3c7N4J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6323
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksIFBhdWwhDQoNCk9uIDcvMi8yMCAxMTo0MiBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4g
T24gMDIuMDcuMjAgMDk6NTksIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4NCj4+
IE9uIDcvMi8yMCAxMDoyMCBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+PiBPbiAwMS4wNy4y
MCAxNDowNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDcvMS8yMCAx
OjQ2IFBNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4+Pj4gT24gMDEuMDcuMjAgMDk6MTksIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+Pg0KPj4+
Pj4+IDEuIEFkZCBwcm90b2NvbCB2ZXJzaW9uIGFzIGFuIGludGVnZXINCj4+Pj4+Pg0KPj4+Pj4+
IFZlcnNpb24gc3RyaW5nLCB3aGljaCBpcyBpbiBmYWN0IGFuIGludGVnZXIsIGlzIGhhcmQgdG8g
aGFuZGxlIGluIHRoZQ0KPj4+Pj4+IGNvZGUgdGhhdCBzdXBwb3J0cyBkaWZmZXJlbnQgcHJvdG9j
b2wgdmVyc2lvbnMuIFRvIHNpbXBsaWZ5IHRoYXQNCj4+Pj4+PiBhbHNvIGFkZCB0aGUgdmVyc2lv
biBhcyBhbiBpbnRlZ2VyLg0KPj4+Pj4+DQo+Pj4+Pj4gMi4gUGFzcyBidWZmZXIgb2Zmc2V0IHdp
dGggWEVORElTUExfT1BfREJVRl9DUkVBVEUNCj4+Pj4+Pg0KPj4+Pj4+IFRoZXJlIGFyZSBjYXNl
cyB3aGVuIGRpc3BsYXkgZGF0YSBidWZmZXIgaXMgY3JlYXRlZCB3aXRoIG5vbi16ZXJvDQo+Pj4+
Pj4gb2Zmc2V0IHRvIHRoZSBkYXRhIHN0YXJ0LiBIYW5kbGUgc3VjaCBjYXNlcyBhbmQgcHJvdmlk
ZSB0aGF0IG9mZnNldA0KPj4+Pj4+IHdoaWxlIGNyZWF0aW5nIGEgZGlzcGxheSBidWZmZXIuDQo+
Pj4+Pj4NCj4+Pj4+PiAzLiBBZGQgWEVORElTUExfT1BfR0VUX0VESUQgY29tbWFuZA0KPj4+Pj4+
DQo+Pj4+Pj4gQWRkIGFuIG9wdGlvbmFsIHJlcXVlc3QgZm9yIHJlYWRpbmcgRXh0ZW5kZWQgRGlz
cGxheSBJZGVudGlmaWNhdGlvbg0KPj4+Pj4+IERhdGEgKEVESUQpIHN0cnVjdHVyZSB3aGljaCBh
bGxvd3MgYmV0dGVyIGNvbmZpZ3VyYXRpb24gb2YgdGhlDQo+Pj4+Pj4gZGlzcGxheSBjb25uZWN0
b3JzIG92ZXIgdGhlIGNvbmZpZ3VyYXRpb24gc2V0IGluIFhlblN0b3JlLg0KPj4+Pj4+IFdpdGgg
dGhpcyBjaGFuZ2UgY29ubmVjdG9ycyBtYXkgaGF2ZSBtdWx0aXBsZSByZXNvbHV0aW9ucyBkZWZp
bmVkDQo+Pj4+Pj4gd2l0aCByZXNwZWN0IHRvIGRldGFpbGVkIHRpbWluZyBkZWZpbml0aW9ucyBh
bmQgYWRkaXRpb25hbCBwcm9wZXJ0aWVzDQo+Pj4+Pj4gbm9ybWFsbHkgcHJvdmlkZWQgYnkgZGlz
cGxheXMuDQo+Pj4+Pj4NCj4+Pj4+PiBJZiB0aGlzIHJlcXVlc3QgaXMgbm90IHN1cHBvcnRlZCBi
eSB0aGUgYmFja2VuZCB0aGVuIHZpc2libGUgYXJlYQ0KPj4+Pj4+IGlzIGRlZmluZWQgYnkgdGhl
IHJlbGV2YW50IFhlblN0b3JlJ3MgInJlc29sdXRpb24iIHByb3BlcnR5Lg0KPj4+Pj4+DQo+Pj4+
Pj4gSWYgYmFja2VuZCBwcm92aWRlcyBleHRlbmRlZCBkaXNwbGF5IGlkZW50aWZpY2F0aW9uIGRh
dGEgKEVESUQpIHdpdGgNCj4+Pj4+PiBYRU5ESVNQTF9PUF9HRVRfRURJRCByZXF1ZXN0IHRoZW4g
RURJRCB2YWx1ZXMgbXVzdCB0YWtlIHByZWNlZGVuY2UNCj4+Pj4+PiBvdmVyIHRoZSByZXNvbHV0
aW9ucyBkZWZpbmVkIGluIFhlblN0b3JlLg0KPj4+Pj4+DQo+Pj4+Pj4gNC4gQnVtcCBwcm90b2Nv
bCB2ZXJzaW9uIHRvIDIuDQo+Pj4+Pj4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+Pg0K
Pj4+Pj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4N
Cj4+Pj4gVGhhbmsgeW91LCBkbyB5b3Ugd2FudCBtZSB0byBwcmVwYXJlIHRoZSBzYW1lIGZvciB0
aGUga2VybmVsIHNvDQo+Pj4+DQo+Pj4+IHlvdSBoYXZlIGl0IGF0IGhhbmQgd2hlbiB0aGUgdGlt
ZSBjb21lcz8NCj4+Pg0KPj4+IEl0IHNob3VsZCBiZSBhZGRlZCB0byB0aGUga2VybmVsIG9ubHkg
d2hlbiByZWFsbHkgbmVlZGVkIChpLmUuIGEgdXNlciBvZg0KPj4+IHRoZSBuZXcgZnVuY3Rpb25h
bGl0eSBpcyBzaG93aW5nIHVwKS4NCj4+DQo+PiBXZSBoYXZlIGEgcGF0Y2ggZm9yIHRoYXQgd2hp
Y2ggYWRkcyBFRElEIHRvIHRoZSBleGlzdGluZyBQViBEUk0gZnJvbnRlbmQsDQo+Pg0KPj4gc28g
d2hpbGUgdXBzdHJlYW1pbmcgdGhvc2UgY2hhbmdlcyBJIHdpbGwgYWxzbyBpbmNsdWRlIGNoYW5n
ZXMgdG8gdGhlIHByb3RvY29sDQo+Pg0KPj4gaW4gdGhlIGtlcm5lbCBzZXJpZXM6IGZvciB0aGF0
IHdlIG5lZWQgdGhlIGhlYWRlciBpbiBYZW4gdHJlZSBmaXJzdCwgcmlnaHQ/DQo+DQo+IFllcy4N
Cj4NCklzIGl0IHBvc3NpYmxlIHRoYXQgd2UgaGF2ZSB0aGlzIGNoYW5nZSBpbiB0aGUgcmVsZWFz
ZSBwbGVhc2U/DQoNClRoaXMgaXMgbm90IHVzZWQgYnkgYW55IHBpZWNlIG9mIGNvZGUgaW4gWGVu
LCBzbyBpdCB3b24ndCBodXJ0IGFueXRoaW5nLg0KDQpCdXQgSSBuZWVkIHRoaXMgY2hhbmdlIGlu
IHNvIEkgY2FuIHByb2NlZWQgd2l0aCB0aGUgTGludXgga2VybmVsIHBhcnQ6DQoNCndlIHdvdWxk
IGxpa2UgdG8gdXBzdHJlYW0gdGhlIHJlbGV2YW50IEVESUQgY2hhbmdlIHRvIHRoZSBkaXNwbGF5
DQoNCmZyb250ZW5kIGRyaXZlciBhbmQgd2l0aG91dCB0aGUgaGVhZGVyIGluIFhlbiB0cmVlIHdl
IGFyZSBzdHVjaw0KDQpUaGFuayB5b3UgaW4gYWR2YW5jZSwNCg0KT2xla3NhbmRyDQoNCj4NCj4g
SnVlcmdlbg==

