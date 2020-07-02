Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6629E211DA8
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 10:00:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqu8E-0000Li-DO; Thu, 02 Jul 2020 07:59:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gX0m=AN=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jqu8C-0000Lc-AR
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 07:59:40 +0000
X-Inumbo-ID: f9d8da20-bc39-11ea-b7bb-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.69]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9d8da20-bc39-11ea-b7bb-bc764e2007e4;
 Thu, 02 Jul 2020 07:59:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bL9XpOzg3ZpQEJqNdGKNTdlSlmL/+MzTMCNfMlGOBkwValhfYEDylhaIOXdQYkc4Y/TKgf7PZlYAVkIcgozHfk58zVs2Fcz90iD7+Ko3UunRHavwQYWh7sQkTM0W9/qIwSlPNCQiHVVEbogaatdCKWyFaqARVmLsbZCKIICZKatf6rqaKrTyDBF6xbjyHw97AoqzHo3SkJ+dCWlitsUkuldcfW2bLwPwZNrWiC4ckEyihVjwt2AFAi6cnXWjUzAOYmPL6H15E20OT6OzeBBJlJNju3zfMtT25iwezt0YecIFkwhGGgjsLRu00uEHi0f0DZTajvEXA8abtr10Zil8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLUyh4w4CyzcYYsgSbvvd8BZiFlIfy9mVfPOw6PuCZE=;
 b=h/HHe90OkBr9GifIykBf2e/J5PHn8nZ5Q0YR/ZaJVAhhoR9SWh2x0o7poC+tGNJJD8d7L/4QXor7IUZw5JY9mJqXv6G3F7B3920w4X0FElcI3bBVyGaUfAl4vtG9SsNhQQHJoUuIsnAIknR+GluXPFLARLjjH9Cfzzwi6U2AmLI13FIIO0UKqNrFGW/STYhn4ZYSBIvM1KHU9wg0BSiyH4DWVa++OfkmnJ2ZSIJQOKeKgTaVWDDLMC+z8qp52XwaO8Hqo6NtiIRum4+6JndPj11OncRT90MoMk4tsYGjZLQMxXBS/b200LK8Hh3QZNe8CETgtAJn++zO5sPYjU1YaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLUyh4w4CyzcYYsgSbvvd8BZiFlIfy9mVfPOw6PuCZE=;
 b=ePHOIqoHwtGi20YEkCkXkArDytKevks/n2w8e5Fx06gzgN9fBezZ+xqEUE8rK3PJa2YqVTbP+T2ojfXeN34ZOfXGl4ml+TNW3heJAc+1mJwj9m+SRZcSRUFB793GBWUDwKn3JBf8vy9Rlpz52o8byLhf39M33Z6gwkutQjqCnYZlxTkNZrHNalbFbV/IKdYUaoeMuO5G1JYLI1FJ2SoIqiBT9N7aC3nr7RzpyV6CGZHiyxJNNhFdXekJieNF6SwnsghFeUykYKIhEGCUGvEMHPqrKZ7gjPUzGdTP90037S9zmFFSdB7yu8ZHcKohkRKRVXdWfUjIABSdtp2A2uyonA==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5010.eurprd03.prod.outlook.com (2603:10a6:208:10b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Thu, 2 Jul
 2020 07:59:37 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508%8]) with mapi id 15.20.3153.024; Thu, 2 Jul 2020
 07:59:37 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Oleksandr
 Andrushchenko <andr2000@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "ian.jackson@eu.citrix.com"
 <ian.jackson@eu.citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v2] xen/displif: Protocol version 2
Thread-Topic: [PATCH v2] xen/displif: Protocol version 2
Thread-Index: AQHWT3f2pfc1d0tAak69A/eTMH1j5qjyit6AgAAWp4CAAUH0AIAACwsA
Date: Thu, 2 Jul 2020 07:59:37 +0000
Message-ID: <f50ec904-8cb2-2bd6-c3ba-35e8c44bd607@epam.com>
References: <20200701071923.18883-1-andr2000@gmail.com>
 <dffd127d-c5a1-4c77-baa8-f1d931145bc4@suse.com>
 <b5a6e034-4d52-d6b2-7c14-3c44c4a19cc3@epam.com>
 <e442e4d9-fe79-7f65-c196-2a0a35923492@suse.com>
In-Reply-To: <e442e4d9-fe79-7f65-c196-2a0a35923492@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f910deec-afc6-4dab-9ecb-08d81e5ddda7
x-ms-traffictypediagnostic: AM0PR03MB5010:
x-microsoft-antispam-prvs: <AM0PR03MB50104D909A742038AB3DB366E76D0@AM0PR03MB5010.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AKTZICfvafAXndTpm4SrcPVraXLeiuVleoZxaCxC9IVodrhMYxfAnOPSYGSXYlNo8/v+Uxj9JPjSaqSI2WWafGkAZvfNit3tKFTZbGrmhYDij9NdX8FMTmnUtcEVBgjX27Bteks5Moo6HKysXSd/bF8z754ztoRZ+6ue7DArB7YnO5hzeZFIw6aYJAZGeJc/kOw8ykVlGRyuOA8WVVGpIzPUYVhAwosLR1N4R9dawzkn4bnaZYX6Awy9DiTC+oeGmWfDduvkG6BnWfThNbK7lXgxCe7I1dNj2VnjSzqAS+QbgGDHictbk6NXHaaq9pNf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(36756003)(71200400001)(110136005)(76116006)(91956017)(6506007)(53546011)(6486002)(26005)(2616005)(66946007)(31696002)(66574015)(66476007)(64756008)(66556008)(66446008)(478600001)(5660300002)(8676002)(186003)(6512007)(83380400001)(31686004)(2906002)(86362001)(316002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: pChM2QuxDFyGv0eJfyrQkYM/i542i/rKb5y9gXkWRw/fmiTqbsJIwFMRvRaDOfGwvNgjMU9VJxUYpCahfMP9Z26Ins5gQDELsxAhx/uNZ/9srgFr8qK3uc4o35TDXd0WJ0NSOsqLxKH26ZLVg750djkMYt9kLDd1xwNxXKZSqIdxBWUqbdtQvM5KlQHTossi/wR8ygHcPVdpot09p9EibO25MxIjT2J+4d1sCUnudFPwtsZFUTlDa37DuSy7o2fzthgaHt/kLpIgN3ZiPtYXPkbjaVTmTqLHe+9/gQPqC0POOuUoge7juvMNxOVHMOTp81dXl8qBue3XhXDSS0hug7lC7099y6xtwcZzjl9k+zhib2jEu1dbWC4diU8LKxyPJwy+aWrsRdt6RrEVSCms05VwWsck14sxLIqEE8g2RlpjXnq6WRGroWlRdoHDWR2gM5QgP+BxWnF/RfYrriIkzUL0EBoCXBlPS8fgh7x33Tw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <161FB667D306C34782A274D938F5F60D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f910deec-afc6-4dab-9ecb-08d81e5ddda7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 07:59:37.1033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ybqtTpJtBZBfhCkOw19+vvTHyuaobA/ix99yziS5KxwaiYBps98cclBqKSLOGTPE5duSgsrXFz3o+DT4znW2BptjwownrIab/v4rbwbQUjRQTWa/E+3RT4lJ5E12bVK+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5010
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA3LzIvMjAgMTA6MjAgQU0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDAxLjA3LjIw
IDE0OjA3LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IE9uIDcvMS8yMCAxOjQ2
IFBNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4+IE9uIDAxLjA3LjIwIDA5OjE5LCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pg0KPj4+PiAxLiBBZGQg
cHJvdG9jb2wgdmVyc2lvbiBhcyBhbiBpbnRlZ2VyDQo+Pj4+DQo+Pj4+IFZlcnNpb24gc3RyaW5n
LCB3aGljaCBpcyBpbiBmYWN0IGFuIGludGVnZXIsIGlzIGhhcmQgdG8gaGFuZGxlIGluIHRoZQ0K
Pj4+PiBjb2RlIHRoYXQgc3VwcG9ydHMgZGlmZmVyZW50IHByb3RvY29sIHZlcnNpb25zLiBUbyBz
aW1wbGlmeSB0aGF0DQo+Pj4+IGFsc28gYWRkIHRoZSB2ZXJzaW9uIGFzIGFuIGludGVnZXIuDQo+
Pj4+DQo+Pj4+IDIuIFBhc3MgYnVmZmVyIG9mZnNldCB3aXRoIFhFTkRJU1BMX09QX0RCVUZfQ1JF
QVRFDQo+Pj4+DQo+Pj4+IFRoZXJlIGFyZSBjYXNlcyB3aGVuIGRpc3BsYXkgZGF0YSBidWZmZXIg
aXMgY3JlYXRlZCB3aXRoIG5vbi16ZXJvDQo+Pj4+IG9mZnNldCB0byB0aGUgZGF0YSBzdGFydC4g
SGFuZGxlIHN1Y2ggY2FzZXMgYW5kIHByb3ZpZGUgdGhhdCBvZmZzZXQNCj4+Pj4gd2hpbGUgY3Jl
YXRpbmcgYSBkaXNwbGF5IGJ1ZmZlci4NCj4+Pj4NCj4+Pj4gMy4gQWRkIFhFTkRJU1BMX09QX0dF
VF9FRElEIGNvbW1hbmQNCj4+Pj4NCj4+Pj4gQWRkIGFuIG9wdGlvbmFsIHJlcXVlc3QgZm9yIHJl
YWRpbmcgRXh0ZW5kZWQgRGlzcGxheSBJZGVudGlmaWNhdGlvbg0KPj4+PiBEYXRhIChFRElEKSBz
dHJ1Y3R1cmUgd2hpY2ggYWxsb3dzIGJldHRlciBjb25maWd1cmF0aW9uIG9mIHRoZQ0KPj4+PiBk
aXNwbGF5IGNvbm5lY3RvcnMgb3ZlciB0aGUgY29uZmlndXJhdGlvbiBzZXQgaW4gWGVuU3RvcmUu
DQo+Pj4+IFdpdGggdGhpcyBjaGFuZ2UgY29ubmVjdG9ycyBtYXkgaGF2ZSBtdWx0aXBsZSByZXNv
bHV0aW9ucyBkZWZpbmVkDQo+Pj4+IHdpdGggcmVzcGVjdCB0byBkZXRhaWxlZCB0aW1pbmcgZGVm
aW5pdGlvbnMgYW5kIGFkZGl0aW9uYWwgcHJvcGVydGllcw0KPj4+PiBub3JtYWxseSBwcm92aWRl
ZCBieSBkaXNwbGF5cy4NCj4+Pj4NCj4+Pj4gSWYgdGhpcyByZXF1ZXN0IGlzIG5vdCBzdXBwb3J0
ZWQgYnkgdGhlIGJhY2tlbmQgdGhlbiB2aXNpYmxlIGFyZWENCj4+Pj4gaXMgZGVmaW5lZCBieSB0
aGUgcmVsZXZhbnQgWGVuU3RvcmUncyAicmVzb2x1dGlvbiIgcHJvcGVydHkuDQo+Pj4+DQo+Pj4+
IElmIGJhY2tlbmQgcHJvdmlkZXMgZXh0ZW5kZWQgZGlzcGxheSBpZGVudGlmaWNhdGlvbiBkYXRh
IChFRElEKSB3aXRoDQo+Pj4+IFhFTkRJU1BMX09QX0dFVF9FRElEIHJlcXVlc3QgdGhlbiBFRElE
IHZhbHVlcyBtdXN0IHRha2UgcHJlY2VkZW5jZQ0KPj4+PiBvdmVyIHRoZSByZXNvbHV0aW9ucyBk
ZWZpbmVkIGluIFhlblN0b3JlLg0KPj4+Pg0KPj4+PiA0LiBCdW1wIHByb3RvY29sIHZlcnNpb24g
dG8gMi4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
PG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+DQo+Pj4gUmV2aWV3ZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+DQo+PiBUaGFuayB5b3UsIGRvIHlv
dSB3YW50IG1lIHRvIHByZXBhcmUgdGhlIHNhbWUgZm9yIHRoZSBrZXJuZWwgc28NCj4+DQo+PiB5
b3UgaGF2ZSBpdCBhdCBoYW5kIHdoZW4gdGhlIHRpbWUgY29tZXM/DQo+DQo+IEl0IHNob3VsZCBi
ZSBhZGRlZCB0byB0aGUga2VybmVsIG9ubHkgd2hlbiByZWFsbHkgbmVlZGVkIChpLmUuIGEgdXNl
ciBvZg0KPiB0aGUgbmV3IGZ1bmN0aW9uYWxpdHkgaXMgc2hvd2luZyB1cCkuDQoNCldlIGhhdmUg
YSBwYXRjaCBmb3IgdGhhdCB3aGljaCBhZGRzIEVESUQgdG8gdGhlIGV4aXN0aW5nIFBWIERSTSBm
cm9udGVuZCwNCg0Kc28gd2hpbGUgdXBzdHJlYW1pbmcgdGhvc2UgY2hhbmdlcyBJIHdpbGwgYWxz
byBpbmNsdWRlIGNoYW5nZXMgdG8gdGhlIHByb3RvY29sDQoNCmluIHRoZSBrZXJuZWwgc2VyaWVz
OiBmb3IgdGhhdCB3ZSBuZWVkIHRoZSBoZWFkZXIgaW4gWGVuIHRyZWUgZmlyc3QsIHJpZ2h0Pw0K
DQo+DQo+DQo+IEp1ZXJnZW4NCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg==

