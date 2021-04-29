Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D85E236F18A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 23:05:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120224.227371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcDqM-0002fk-Qe; Thu, 29 Apr 2021 21:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120224.227371; Thu, 29 Apr 2021 21:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcDqM-0002fL-Nd; Thu, 29 Apr 2021 21:05:06 +0000
Received: by outflank-mailman (input) for mailman id 120224;
 Thu, 29 Apr 2021 21:05:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0vEL=J2=starlab.io=scott.davis@srs-us1.protection.inumbo.net>)
 id 1lcDqL-0002fG-My
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 21:05:05 +0000
Received: from GCC02-DM3-obe.outbound.protection.outlook.com (unknown
 [40.107.91.105]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8330ee7a-db8a-423e-99c6-1c5341ec07a2;
 Thu, 29 Apr 2021 21:05:04 +0000 (UTC)
Received: from MN2PR09MB5258.namprd09.prod.outlook.com (2603:10b6:208:220::11)
 by BLAPR09MB6818.namprd09.prod.outlook.com (2603:10b6:208:2aa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.28; Thu, 29 Apr
 2021 21:04:58 +0000
Received: from MN2PR09MB5258.namprd09.prod.outlook.com
 ([fe80::2939:7b58:8863:9a07]) by MN2PR09MB5258.namprd09.prod.outlook.com
 ([fe80::2939:7b58:8863:9a07%7]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 21:04:58 +0000
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
X-Inumbo-ID: 8330ee7a-db8a-423e-99c6-1c5341ec07a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUi/siLzaXcCWb8d7npST+6L1mcsP/LRY8JNjT7Y2cTbFuz3/G0tx3FEP+4fdM3sF3sDxbYXn+vfomIhbiime/sEm3B+n3b3vlz2GddC4w29gfiOD/EPo08jAuQGxsdYUP7qDg36HXMdLbsYFJl79k3oW2MPWrv8Sj7NIjDtJG39gJ+th240E7qE54LDphY2uFFnM2BEF6rVwyOTYasHv5Q4f1M5xrTP3vUvlEvJ8RuNFB9VUzko0pqVXGwOPFAHZ5EbHZo8FcJDlwt9MKSrbvd0dOz1ZTilV9bIt2OREt/gPwBjUnJ0YaZj8g46ky+JDaK4MBvZB58nvhGd0I1yuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EFYX8tfPuM4fWgtWAa2+fUh+gll+yHoQFhgZvMWcHY=;
 b=il/UMDEuGIPqpYkQOVF9KHYkNaDxFIaaS3W7UdohTW1gnmUN4b3Yue7oqxWpjf18wPNoNIidanTnOrZP2tiFJwonjbYuAifb1MC2OArx5/QYFLY3QbJsaLS2HeQY621bEDFE5GChJOIeMlhk/9nrCP7IeHjMPD6RSUaEodb9SJcp1mO9lK8xY3Q20bP7TevTRUP6fkdnzZqP51DsTU8R2D7HErb6Tr+FIXkii9OccqZNZJ5OOYDNHsOIT18vflETyMzEUKVrDofXPe5xy2aMwwfbb3NQzq3ntLXUIfdzzTIfXUZ1z6SprxiO40B22MlRCvg/BBVOAIJ5MP0if8id/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starlab.io; dmarc=pass action=none header.from=starlab.io;
 dkim=pass header.d=starlab.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EFYX8tfPuM4fWgtWAa2+fUh+gll+yHoQFhgZvMWcHY=;
 b=eN6C3foZEEGxRJn4wnGLnJMW8a4hu3tgWJO0xfVwefgd0EWzzUa1/bGiRm8tWZVlWAegBf8WD2apOl2LRcSHF9TO5b57GMIbOgFvZj+0e0fDsXW2/pdG5Z5OcfFgEXCyWilJw8R57d6bHVHF3Ohs+fbWe2WGJtpSfTRE+G/4qb4=
From: Scott Davis <scott.davis@starlab.io>
To: "paul@xen.org" <paul@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] iommu: make no-quarantine mean no-quarantine
Thread-Topic: [RFC PATCH] iommu: make no-quarantine mean no-quarantine
Thread-Index: AQHXOsEjPlXZorMQi0Kt8384oCpmdqrH72EAgAC5poCAAM1cAIAAEeQAgAI1xoA=
Date: Thu, 29 Apr 2021 21:04:58 +0000
Message-ID: <2A65573D-2DD6-49C7-B34C-27B15FD620B2@starlab.io>
References:
 <0a292d952ff71dbfed5234d27b42a05f7b49a1fe.1619451434.git.scott.davis@starlab.io>
 <cea1d2d0-fd69-a4cd-6653-dd881d07b96a@suse.com>
 <56F61E81-511E-4ECA-B2A0-B91F250804D7@starlab.io>
 <237ad45b-b68d-9d31-0fbc-1af52dfca808@suse.com>
 <dc6556ae-c653-8519-1a81-9524e4472f26@xen.org>
In-Reply-To: <dc6556ae-c653-8519-1a81-9524e4472f26@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=starlab.io;
x-originating-ip: [73.133.107.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d465265-7bb6-4e09-39f8-08d90b527262
x-ms-traffictypediagnostic: BLAPR09MB6818:
x-microsoft-antispam-prvs:
 <BLAPR09MB6818878CFA5014B991479165915F9@BLAPR09MB6818.namprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tANY73Ngk239yX4yOAMZt9omiW5n8WSjzjR0oaftDkhtoH2717TSarZ7RH7sBleeds0p1eSCGChNTjjk2rzxnyzRwgReTewY9Kl+CGMeYUq6VN95RAt5ej6STUUqOL02sKCthRGrNLwC+/FnraLTDo6tW72Ej9xXqmklXORhC5329UbMpyfuoCI4XtTmAmytEF4ZPQCiIrrzefL85nOVERunkOp8JAeVu5G/69fGEhGCRsOKWCbsRrXJDcdA6tfngqLeVX48WjdVZX+UtsHCoux31gEvj5eZSNDLGyXZUNjugYaxtMa6kG9zV4PVreAQuE4Qi/Q9q887V4NiXUD1jM70T6Pv4qI96e4pP44XZYcb+K34aSFZlkKL9TRgal05n1JZZK3UxPjt6pJgt8B7yO+zKPeuIgGk4dYVQfe4QvCwWY0fYrcffopHJbcME9vI/kjew/MYe/phLReuZdIQhbVKxFYIXMkfs8ALBFhxG+S0SZ2pjFzQnvh/1X9cDXTDwxmDngStLnVvhxUs1AQlE7jMiCRV0WYsxma7N8QyNLca0gzDyIeMng93TfKLibE9fvmDaMR1auJsrPwIg+0p3LJkGjplx4P1z3mQnqJu9zykUNu746ZCRz+uQdJm0DsQCRd+gV33xl7XvNf2xXI7x8EWSbpn9rjOPyCoOli0Tqg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR09MB5258.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39830400003)(36756003)(2616005)(316002)(66446008)(33656002)(66946007)(110136005)(478600001)(71200400001)(54906003)(76116006)(66556008)(8936002)(66476007)(38100700002)(6512007)(8676002)(44832011)(64756008)(86362001)(122000001)(4326008)(5660300002)(53546011)(6506007)(186003)(6486002)(83380400001)(2906002)(26005)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?WVBucFRlaXJGNTQ5aDgrdGZXTSs5RzVnOXNaVGM4V2h3Q2xuWnc3VUNhRE84?=
 =?utf-8?B?U3ZualI3QUdBNnN2Z1VXaHMrVU0yVHBhOW4vak5rMEt6OUYxaVJoWS9jWllQ?=
 =?utf-8?B?bzRJU2piamhUT1hxazc1UStkUDhOcElTMkJhM0MxZnZQdjlEbnNRU0JDcHZy?=
 =?utf-8?B?NW10TjVoMWVHaVBDeWVrQTZOODBSb3dOVnoyQzkwV09nSlNsYXlkZ1RMVGxB?=
 =?utf-8?B?cFJpTmdSN1h5Q081NEpCV0xiVUZYRzV4a0pkelNuNmtTcUFuY281OVNaRkhC?=
 =?utf-8?B?Y3NXTk1pcXBHVVNOSVBQd3JhZ25UUzdwdGFPQUVxR1AySWxPY3V0UTlNR0lY?=
 =?utf-8?B?YVNicEcyM0xyYzJkZE94QStRWXByYk90Zk9NbkI1YWF0MzJ3UXJmUkNFdUNH?=
 =?utf-8?B?TnVkbWpHcFoxaWhjdVZJblRwbVpUYTd3K0xORytQN2xuVWhXVG5rWlczWDFv?=
 =?utf-8?B?UEI1T1pZYkwvTWt2MkFRM1Q2ZVRNWnUwU0xCYks4VEZPSXZFd3cvckpKRHBX?=
 =?utf-8?B?cjhDemQrUkhOVkpQYnZiNGdibTluejc3UWFybTI2ZDdNZk94MjlsMmErZldW?=
 =?utf-8?B?SEgzVVJnc1pyOGw2eTVMdFZZWGs5TWt5OVRUYnV1S0s4V2Y2R1lSTTBWT1NQ?=
 =?utf-8?B?TEdBNmxET0tJdlFUWmU1clkzdHExNTUwNzJrRDI5bXZ3SVora05QOWZjbTFY?=
 =?utf-8?B?M2lOQ3FQOG83cURRL0QyejZDU0tsQWtMb1JWNmVvT0gwYUxCQWFaLzdweW5K?=
 =?utf-8?B?U3crUFlvRmtwRlZha0l1YTVHbmJHaTdqRWhyOUhFK1B0WUpBQTh5c296c1Jq?=
 =?utf-8?B?NTViTk1haitxUUYwU1NOamV3VDZTT0JKL0t6RXZPQis4dU5rOXZOY2UwVmZJ?=
 =?utf-8?B?dlBqVm0wNVg3SGliRmdvUWlRQk1haXJqeTVQWERUMnplNHZXcTJMWHcrOEpZ?=
 =?utf-8?B?RFAyU1NuVEZudmhlbFg3d09vU0ZoNGJsOElKekpMSHZOZ2ZxbG0ybmx2Q1Fj?=
 =?utf-8?B?ZVZ5QTNOM3JGR3hsNStKRXRLTUJMeDlkQXl4dWx0U3dUdUNJZnpQbmdxQ3VS?=
 =?utf-8?B?ZlRhRzRLY0R1aksrWHpZbGVGcnRRSU1VR3pDN0RYU3ZNVS8zTi8vZHNXbjcx?=
 =?utf-8?B?SWJ0L3FvbnBPejVyYWRFTGF6b2xnaWdUTXBTZ3hINFpOM2pkR3l0ZTNOSVJh?=
 =?utf-8?B?aGtDbjhjS3p6NmhVVldtR0ZaOVB5bGNKOHhkYTBnM0UrSkpYQUpIUW9GNU5W?=
 =?utf-8?B?RHpWeGI2TlEzdDFJbmhQdHpReExhQmdNNEhHYkRXVGxSSFZBWFlKUE5UamJO?=
 =?utf-8?B?THhHQy81QjNhdG5vWFBnZGZnaFBiV0hBaGJZZU9FOW9rSkc1U2RUVFJkd2lC?=
 =?utf-8?B?YkhWWllpQ3NzZkF5bFVHRzlwNURDOHdOUWpkZndiUWxpYU1BWHd2Qk9FNWlS?=
 =?utf-8?B?eWo2d284REJsZmpZY05RU0s4UEFBNmpKR1NiUmZnMVZpc1ptSUsrL3dGZkQ3?=
 =?utf-8?B?TUJrUVJKSTRVR1ZLaWVNay9lVW1JY1ZQcmpsc2w0ZXFoc2E1QW0zY0F6Tnha?=
 =?utf-8?B?OXFaajVlbXZIUnVDS05BKzRSS3YvMXR1ZXNSSmxFcmRFZ1RMSFZmQWRSQ0tu?=
 =?utf-8?B?aFRYUGYyU1k0NzBmVUcvY2N0QjVsS0FoTUx4WVhuMUtVVXFmWngvaFdaWjJy?=
 =?utf-8?B?YTg3c1NXTnhvUnM1VnArTkhHdDVNZlRPZ3RJQnE4UzVBNWRoQnlrZ0d5OERQ?=
 =?utf-8?Q?Ht2w65xGKmFYO9wbVMgYaODSSh/hskJJu/515mE?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBE09447C671E843807D071301C97173@namprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR09MB5258.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d465265-7bb6-4e09-39f8-08d90b527262
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 21:04:58.2455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR09MB6818

T24gNC8yOC8yMSwgMzoyMCBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gRm9sbG93aW5nIHRo
ZSBleHRlbnNpb24gdG8gdGhlIGNvbW1hbmQgbGluZSBvcHRpb24gSSdtIHB1dHRpbmcgaW4gcGxh
Y2UNCj4+IGluICJJT01NVTogbWFrZSBETUEgY29udGFpbm1lbnQgb2YgcXVhcmFudGluZWQgZGV2
aWNlcyBvcHRpb25hbCIgKHdoaWNoDQo+PiBJIHN0aWxsIG5lZWQgdG8gZ2V0IGFyb3VuZCB0byBh
ZGRyZXNzIHJldmlldyBmZWVkYmFjayBmb3IgYW5kIHJlc3VibWl0KSwNCj4+IEknZCBiZSBpbmNs
aW5lZCB0byBzdWdnZXN0ICJpb21tdT1xdWFyYW50aW5lPWFsd2F5cyIgb3INCj4+ICJpb21tdT1x
dWFyYW50aW5lPW9uLWFzc2lnbiIuIFVubGVzcyBvZiBjb3Vyc2Ugd2UnZCBwcmVmZXIgdG8gaGF2
ZSB0aGUNCj4+IGNhbGxlciBvZiB0aGUgYXNzaWdubWVudCBvcGVyYXRpb24gaGF2ZSBmdWxsIGNv
bnRyb2wgb3ZlciB0aGUgYmVoYXZpb3INCj4+IGhlcmUgYW55d2F5IChpbiB3aGljaCBjYXNlIGEg
Y29tbWFuZCBsaW5lIG9wdGlvbiBjb250cm9sIHNpbXBseSBpcyBub3QNCj4+IG5lY2Vzc2FyeSku
DQo+DQo+IEknbSBzdGlsbCBub3QgZW50aXJlbHkgc3VyZSB3aHkgbm90IHF1YXJhbnRpbmluZyBv
biBpcyBhIHByb2JsZW0sIG90aGVyDQo+IHRoYW4gaXQgdHJpZ2dlcmluZyBhbiBhcy15ZXQgdW5k
aWFnbm9zZWQgaXNzdWUgaW4gUUVNVSwgYnV0IEkgYWdyZWUgdGhhdA0KPiB0aGF0IHRoZSBleHBl
Y3RhdGlvbiBvZiAnbm8tcXVhcmFudGluZScgbWVhbmluZyBqdXN0IHRoYXQgKGkuZS4gdGhlIG9s
ZA0KPiBkb20wLT5kb21VIGFuZCBkb21VLT5kb20wIHRyYW5zaXRpb25zIGFyZSByZS1pbnN0YXRl
ZCkgaXMgcmVhc29uYWJsZS4gRG8NCj4gd2UgcmVhbGx5IHdhbnQgeWV0IG1vcmUgY29tbWFuZCBs
aW5lIG9wdGlvbnM/DQoNClJlZ2FyZGluZyB0aGUgcHJvYmxlbSBpbiBRRU1VLCBJIHRyYWNlZCB0
aGUgY3Jhc2ggdHJpZ2dlciBkb3duIHRvIGENCndyaXRlIHRvIHRoZSBJUSB0YWlsIHJlZ2lzdGVy
IGR1cmluZyB0aGUgbWFwcGluZyBvcGVyYXRpb24gaW50byBkb21faW8NCihiYWNrdHJhY2UgYmVs
b3cpLiBBbG9uZyB0aGUgd2F5IEkgbm90aWNlZCB0aGF0LCBzaW5jZSBhIG5vbi1wcmVzZW50DQpl
bnRyeSB3YXMgYmVpbmcgZmx1c2hlZCwgZmx1c2hfY29udGV4dF9xaSBvbmx5IHBlcmZvcm1zIHRo
aXMNCmludmFsaWRhdGlvbiBvbiBhbiBJT01NVSB3aXRoIGNhY2hpbmcgbW9kZSBlbmFibGVkIChp
LmUuIGEgc29mdHdhcmUNCklPTU1VKS4gVGhlcmVmb3JlIHRoaXMgaXNzdWUgaXMgcHJvYmFibHkg
b25seSBoaXR0YWJsZSB3aGVuIG5lc3RpbmcuDQpEaXNhYmxpbmcgY2FjaGluZyBtb2RlIG9uIHRo
ZSBRRU1VIHZJT01NVSB3YXMgZW5vdWdoIHRvIHByZXZlbnQgdGhlDQpjcmFzaCBhbmQgZ2l2ZSBt
ZSBhIHdvcmtpbmcgc3lzdGVtLg0KDQooZ2RiKSBzaQ0KMHhmZmZmODJkMDQwMjViNjhiICA3MiAg
aW4gcWludmFsLmMNCiAgIDB4ZmZmZjgyZDA0MDI1YjY4NyA8cWludmFsX3VwZGF0ZV9xdGFpbCs0
Mz46IC4uLiBzaGwgICAgJDB4NCwlcjEyDQo9PiAweGZmZmY4MmQwNDAyNWI2OGIgPHFpbnZhbF91
cGRhdGVfcXRhaWwrNDc+OiAuLi4gbW92ICAgICVyMTIsMHg4OCglcmF4KQ0KKGdkYikgYnQNCiMw
ICAweGZmZmY4MmQwNDAyNWI2OGIgaW4gcWludmFsX3VwZGF0ZV9xdGFpbCAoLi4uKSBhdCBxaW52
YWwuYzo3Mg0KIzEgIDB4ZmZmZjgyZDA0MDI1YmFhNyBpbiBxdWV1ZV9pbnZhbGlkYXRlX2NvbnRl
eHRfc3luYyAoLi4uKSBhdCBxaW52YWwuYzoxMDENCiMyICBmbHVzaF9jb250ZXh0X3FpICguLi4p
IGF0IHFpbnZhbC5jOjM0MQ0KIzMgIDB4ZmZmZjgyZDA0MDI1OTEyNSBpbiBpb21tdV9mbHVzaF9j
b250ZXh0X2RldmljZSAoLi4uKSBhdCBpb21tdS5jOjQwMA0KIzQgIGRvbWFpbl9jb250ZXh0X21h
cHBpbmdfb25lICguLi4pIGF0IGlvbW11LmM6MTQzNg0KIzUgIDB4ZmZmZjgyZDA0MDI1OTM1MSBp
biBkb21haW5fY29udGV4dF9tYXBwaW5nICguLi4pIGF0IGlvbW11LmM6MTUxMA0KIzYgIDB4ZmZm
ZjgyZDA0MDI1OWQyMCBpbiByZWFzc2lnbl9kZXZpY2Vfb3duZXJzaGlwICguLi4pIGF0IGlvbW11
LmM6MjQxMg0KIzcgIDB4ZmZmZjgyZDA0MDI1OWYxOSBpbiBpbnRlbF9pb21tdV9hc3NpZ25fZGV2
aWNlICguLi4pIGF0IGlvbW11LmM6MjQ3Ng0KIzggIDB4ZmZmZjgyZDA0MDI2NzE1NCBpbiBhc3Np
Z25fZGV2aWNlICguLi4pIGF0IHBjaS5jOjE1NDUNCiM5ICBpb21tdV9kb19wY2lfZG9tY3RsICgu
Li4pIGF0IHBjaS5jOjE3MzINCiMxMCAweGZmZmY4MmQwNDAyNjRkZTMgaW4gaW9tbXVfZG9fZG9t
Y3RsICguLi4pIGF0IGlvbW11LmM6NTM5DQojMTEgMHhmZmZmODJkMDQwMzIyY2E1IGluIGFyY2hf
ZG9fZG9tY3RsICguLi4pIGF0IGRvbWN0bC5jOjE0OTYNCiMxMiAweGZmZmY4MmQwNDAyMDVhMTkg
aW4gZG9fZG9tY3RsICguLi4pIGF0IGRvbWN0bC5jOjk1Ng0KIzEzIDB4ZmZmZjgyZDA0MDMxOTQ3
NiBpbiBwdl9oeXBlcmNhbGwgKC4uLikgYXQgaHlwZXJjYWxsLmM6MTU1DQojMTQgMHhmZmZmODJk
MDQwMzkwNDMyIGluIGxzdGFyX2VudGVyICgpIGF0IGVudHJ5LlM6MjcxDQojMTUgMHgwMDAwMDAw
MDAwMDAwMDAwIGluID8/ICgpDQoNCkFzIGEgcmVzdWx0IG9mIHRoZSBhYm92ZSwgSSBubyBsb25n
ZXIgaGF2ZSBhIG5lZWQgdG8gcGF0Y2ggWGVuIHRvIHdvcmsNCmFyb3VuZCB0aGUgcHJvYmxlbS4g
VGhvdWdoIEkgZG8gd2FudCB0byB0ZXN0IGFnYWluc3QgbmV3ZXIgdmVyc2lvbnMgb2YNClFFTVUg
KGN1cnJlbnRseSBvbiA0LjIuMSkgdG8gc2VlIGlmIGl0IHN0aWxsIGV4aXN0cy4NCg0KU28gdW5s
ZXNzIHRoZXJlJ3MgaW50ZXJlc3QgYW1vbmcgWGVuIGRldmVsb3BlcnMgZm9yIHRoaXMgcGF0Y2gs
IEkgd2lsbA0KcHJvYmFibHkgc2hlbHZlIGl0IGZvciBub3cuIEVzcGVjaWFsbHkgc2luY2UgaXQg
bG9va3MgbGlrZSBKYW4gaGFzIHNvbWUNCm9uZ29pbmcgd29yayBpbiB0aGlzIGFyZWEgdGhhdCBJ
IGhhZCBub3QgcHJldmlvdXNseSBkaXNjb3ZlcmVkLiBJZiB0aGVyZQ0KaXMgaW50ZXJlc3QsIEkg
anVzdCBuZWVkIGEgcmVzb2x1dGlvbiBvbiB3aGV0aGVyIGlvbW11PXF1YXJhbnRpbmUgc2hvdWxk
DQpiZSBsZWZ0IGFzIGEgYm9vbGVhbiBvciBleHBhbmRlZCB0byBzdXBwb3J0IGFsd2F5cywgbmV2
ZXIsDQpkZWFzc2lnbi1vbmx5LCBhbmQgKHdoeSBub3QpIGFzc2lnbi1vbmx5Lg0KDQpUaGFua3Ms
DQpTY290dA0KDQo=

