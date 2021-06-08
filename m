Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7461F39FA20
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 17:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138559.256443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqdQP-0002on-6O; Tue, 08 Jun 2021 15:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138559.256443; Tue, 08 Jun 2021 15:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqdQP-0002mZ-3M; Tue, 08 Jun 2021 15:13:53 +0000
Received: by outflank-mailman (input) for mailman id 138559;
 Tue, 08 Jun 2021 15:13:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Z8W=LC=onlineschubla.de=paul@srs-us1.protection.inumbo.net>)
 id 1lqdQN-0002mT-3W
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 15:13:51 +0000
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown
 [40.107.135.128]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7bc6a98e-1411-40c3-83b9-b55ae9497e28;
 Tue, 08 Jun 2021 15:13:49 +0000 (UTC)
Received: from FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:45::10)
 by FRYP281MB0376.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:43::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.9; Tue, 8 Jun
 2021 15:13:47 +0000
Received: from FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM
 ([fe80::184f:c6ec:f202:bf2d]) by FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM
 ([fe80::184f:c6ec:f202:bf2d%8]) with mapi id 15.20.4219.020; Tue, 8 Jun 2021
 15:13:47 +0000
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
X-Inumbo-ID: 7bc6a98e-1411-40c3-83b9-b55ae9497e28
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2ZG/Sk6OtTCPNZYAXDqTD7E/4HW7okiULuVMaQgx4/S0QRcPtklnHcAdmfurDVhXCzVlb5pJWbgVS0b5ybhtTma1wsV6q26hK4JkdM+QAiVh3Jp8VoPgxmtg5GnELn/clb0YnIHbn0WZRQkVAnmsjflyTPWEu7gtfu/uQqVBpT8uelVmldKfUG5FV6Da/dlSAGKDZOtTt1r8tCjHShH3GLozUK71QcZrr0K8pezSGEZzm/HyhxhCuQ3yf/mX3PxQ5wlP/cFK06vcSibpNeGscDC/a85kcwjjT1oiyQgiW5SC9iOCnEwBT8fAJw+Ltek7KbgcaUn9dX1nHkyaIMlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnTSvAcHGNMyB+mxbNP7yD+WKUhKlPC/vYTDjr7Z3PY=;
 b=BYtEgoFbxZRLBFSlSk5ol9sA2mmrsbX9rOTgXhC2MLotCykscJKIGFfwG32BC64ntc3mBlxgFacOOzz4y+4opYorjpcdjPu/TwVBE585tuSUGD8QgKSfqqPNbFD97emr7FC2/WyjgRgiyzqAorUufhaZ/ZvpFwFk2cZxKN592260OfbVZLOOmL9SgcNmF6w8UwCFTDmtbjEwilQIEPIO3teHGwDhBewJYF8g0BQ57beRymwe7smhfO7/7UsuIzA6ASvS0em1e4ZMaYsmQ3a14dOHtizMe1CDOcDWF6Y9Y6YdqW+mn5zD2yg3syfOBCrkgiffRDg8iQy6hhWdDUWT3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=onlineschubla.de; dmarc=pass action=none
 header.from=onlineschubla.de; dkim=pass header.d=onlineschubla.de; arc=none
From: Paul Leiber <paul@onlineschubla.de>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: AW: [BUG] Passed through PCI devices lost after Windows HVM DomU
 reboot
Thread-Topic: [BUG] Passed through PCI devices lost after Windows HVM DomU
 reboot
Thread-Index: Addb9FwKHMmb5HghTwunCUNmuZyBkwAOovgAABFHM2A=
Date: Tue, 8 Jun 2021 15:13:47 +0000
Message-ID:
 <FRYP281MB0582BC1EAE564E396C3316A6B0379@FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM>
References:
 <FRYP281MB05828EB0C49C963C7954578CB0389@FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM>
 <5f532ea4-4ff4-e163-9492-096d16a316e7@suse.com>
In-Reply-To: <5f532ea4-4ff4-e163-9492-096d16a316e7@suse.com>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=onlineschubla.de;
x-originating-ip: [2003:d2:1f26:12f0:194f:1b:f8b8:323e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8c99002-bb3f-4ff5-1e82-08d92a9003a8
x-ms-traffictypediagnostic: FRYP281MB0376:
x-microsoft-antispam-prvs:
 <FRYP281MB03760A81E691438827E26249B0379@FRYP281MB0376.DEUP281.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mvINWgXCmfgOC5u5zemrApjSiLQKHeTq+1GNHSEMd/H6w4xvfcJy/mE06XUS1Qc963qduvRYI7uuJsUT0aAE7Njy9h28Gk4HwAe/bzGz50Ne3l9V0aEO0DH2apK5pxlLHJGTfdc8FepLB7xrVTPLQOMDQfYrWpMR6154HKdHD4qa8rKIO2JvQEJM5guPSOZPTMzJMjhclT7tiN/tvFtPcH6F9348oEmkdNy/FKCUoXWWKBSpHAWAUIEanqdlDLqzce/e0z/V2Fy4Yc4hr234oCUutLNsrH/5VJhu37luoeQFyhfGY4DftEEtCUqjuxPdONeWsYGBYLVzjVQSlKlTFAagpiSeeXsroLlEfnZQp1Sp3wKJxWt2QjqAcyWtctsDhKVu9jIETmW+pflOcjZcxfY4Fw4XP/rmKvwgRu16gNX4L0X0X4Ca7u4j8wau1d5WWmx3puvx5vWzfwOjqSBpgbOdST6G7+47hFsHyc+QOuqmGOGUluGS8UdOlkzA10J5MChPyCNqP5vSx0oCxAuBX/JkUKEP9RvP84dfFmj6MZjEfSpgoU+/VTcQdTjJ3LJ2uRkFymOhIlnMC0nh111WY184/5PzAxp2uSciL2yEtzPcM777xpZ7gNUHoqqIWad9ZJQgTZLlyz1ZI+xr09oUoA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(136003)(346002)(376002)(39830400003)(366004)(8676002)(7696005)(86362001)(6916009)(33656002)(9686003)(66476007)(66556008)(66946007)(66446008)(64756008)(76116006)(8936002)(122000001)(316002)(38100700002)(55016002)(4326008)(6506007)(53546011)(2906002)(52536014)(5660300002)(83380400001)(186003)(71200400001)(478600001)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?bWc3VEF2TWx6Y0x0MEFGNVAyK3dIQVNQSFJFakd4TGZlNXcwRUwzY0U0Skdu?=
 =?utf-8?B?SHpQUVA1YzFEN2t2ZUhDZjF3T0NDR0xVK2s1cHczWVpmeDM3QUV5eWJ4UTIy?=
 =?utf-8?B?aG8xSXZhc2JEWHprcW5jdFFua2Z2d0ROSjlMMHRyRWpQdU5uZVhqbkdpaEM2?=
 =?utf-8?B?M1lpb0VNQ2M2TG8va0sxWFZEVncvbHMza1VweUpZZXNLRVplY3dBT2QxcExM?=
 =?utf-8?B?WTFMS1FWcEFnWWsrQS9ZbVdmQ3ZEUmR2bzU0ZEdqc2VJL0hVbEpZcU5aSmtR?=
 =?utf-8?B?Q0JvMXE0NDJGcCtBRCswaFVPb01OMVVkcWJrZE9aNTcyeDJ4a1RMdi9GZkQr?=
 =?utf-8?B?SEM2UjNiR0xxMzBGRjBtRUJENVRBeXEyYlVpOEhsblJ1dElzN3hIMEwvMFRD?=
 =?utf-8?B?MTJVMXhVOWlwamJxei94MExhS1NiUlpxT3hQeVhsbzhrNmhtaFo3eU5ZVXBM?=
 =?utf-8?B?VmFmRDkvVHNXRTRnMXp2ZVlKN2NORG9FaVR4WUplby94VlRyZXFKaHJVazN3?=
 =?utf-8?B?NzBaL2puVWg2cndzQXVrei9JUzZTVVNNTFUxYjlUaVVJUVV5TVFKazdja0dW?=
 =?utf-8?B?VXAwdWtRVk9xNWZEVVM5TGQ1UThwb1VNYnNkeTJiUE9Oa1hSMWhvSUN6RS9n?=
 =?utf-8?B?ZW5PUWliNTAxMm1VWTlNUW5QYm5wRzdCZ3lBU1ZFYVg5VTJkTTNwaG0wZDNj?=
 =?utf-8?B?akh6Ym9KUE9oMlNwdmhETVVuUFlyMWd0VWFjUitXREpCTDVLNmhsUVRTMzc1?=
 =?utf-8?B?eFFiY0pyN01rVUlYSVpIUEpieGlRRlVudnZUVWRUSktwMC9HbE5qWkRKcHNP?=
 =?utf-8?B?SEtwbDd6N3dLYyszTjQ1UHdzdUxlbEt5T3RDeGFmTGdoV3l0N2p1Ty9EZXhr?=
 =?utf-8?B?YWVFL0NQMHFHYWJpVEk2RUYvQnFPVE03WUljQkh3aTFaWW43dzd4THFkYmxz?=
 =?utf-8?B?Y2lVMkpkTVNuSnZUd29LbFNKMWtnQmRwalFPTXJ1eXE3dm1qTHZ4ZitneWor?=
 =?utf-8?B?ZzVQNDJJVTR4R0c2dnJrcDJ2Y2NmbEVObTNKOWFLSzRkZE5LbDJmQ1UwVVkz?=
 =?utf-8?B?MXg3UFdONDU2cmwwM3pDTVQ2NERBNWlBWGFwaC9qYjl2WW1ZK3pFUDI0eFFl?=
 =?utf-8?B?ZGVNZGRIVEVwZHdicVVmRW5vbDUwamdDTDQxN0ZkNUtVVXB1UFFiaVRhdkpU?=
 =?utf-8?B?NHRmM0g1WFkvQk55Um1tcDZXU0pPQWxncisvOEsvTXdsVnhDRUU0MUNrdXAr?=
 =?utf-8?B?bmJTdkt1TUVheVpzUzJpcjVyb3h6K2dXamRhTDdEQmdlTThIb2trdHIrRUtZ?=
 =?utf-8?B?S2t3dDNNeWh6dTVrdUk2Kyt0RG1udGE1TGtSbHgwczdYUUJNQ2hNVXNRRFU5?=
 =?utf-8?B?dURCeTJFVnUwelFwNTRtVS96Y1E5cFlpb3RMZ0RHTFBOUGl6ZkNHMVd4TTBk?=
 =?utf-8?B?akFOaUVubjA5bjZuNnVkWCtDbDBCRW44cU5ETHhoSUZIQjNWV0hJcGxVbmdv?=
 =?utf-8?B?MFh6SCtVbWFvc1MrQnNCWk9hNXBMQStCaTR4QUhFMG1IbjlZUXhhMEUyTTVl?=
 =?utf-8?B?Mk96MnYvY0pmUEtPL1ZDcVVvUy9mNm9kemtQUEE2K1NKZlhveS9wU081N0R1?=
 =?utf-8?B?dzNvaTU5QkoxczJxcElwcE9IRXQ4YkpmWS8vT3Z2WVAyUjN6K3ZxbGZGeDhJ?=
 =?utf-8?B?UlVxZ204R09MdWwvUW8weHBobmNETU5vUGFSemgvc2gzTy92Q25WdU1GVVJ1?=
 =?utf-8?B?YURyd2JTbkw4T2NFUnQ0bEl4YVZFWTNqOEhlZnVLdGNMam83VkVYQzdOUlNQ?=
 =?utf-8?Q?nBYzjtl1Yo+DbzQcXiKWbKNwQS4neUkkCa2WA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: onlineschubla.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c99002-bb3f-4ff5-1e82-08d92a9003a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 15:13:47.3985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc8b046-4d00-4e98-8679-43c06bdec9db
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cKXEX++N4pMU4AiqCGn7dgZ/H7AUcILZ0wGdSGkFdIUrpE32ta8IJaXyEHugEhB/LlJ8jeV8YO5olmVbNxrJNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB0376

PiBWb246IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gR2VzZW5kZXQ6IERpZW5z
dGFnLCA4LiBKdW5pIDIwMjEgMDg6MjQNCj4gDQo+IE9uIDA4LjA2LjIwMjEgMDE6NDQsIFBhdWwg
TGVpYmVyIHdyb3RlOg0KPiA+IEFmdGVyIG1vcmUgdGVzdGluZywgSSBoYXZlIGNvbWUgdG8gdGhl
IGZvbGxvd2luZyBjb25jbHVzaW9uOiBJdCBzZWVtcyB0aGF0DQo+IGV2ZXJ5IHRpbWUgSSBkbyBh
IF9yZWJvb3RfIGZyb20gd2l0aGluIGEgV2luZG93cyBEb21VLCB0aGUgUENJIGRldmljZQ0KPiBk
b2VzIG5vdCBnZXQgYXR0YWNoZWQgdG8gdGhlIERvbVUuIEFmdGVyIERvbVUgcmVib290LCBpdCBp
cyBpbW1lZGlhdGVseQ0KPiBhdmFpbGFibGUgZm9yIGF0dGFjaG1lbnQgaW4gdGhlIERvbTAgd2hl
biBJIGNoZWNrIGZvciBpdCB3aXRoICJ4bCBwY2ktDQo+IGFzc2lnbmFibGUtbGlzdCIsIGFuZCBJ
IGNhbiByZWF0dGFjaCBpdCB0byB0aGUgRG9tVSB3aXRoICJ4bCBwY2ktYXR0YWNoIiB3aXRob3V0
DQo+IGFueSBtYWpvciBwcm9ibGVtcyBiZXNpZGUgc29tZSBhbm5veWluZyBzaWRlIGVmZmVjdHMg
KGUuIGcuIG5lZWQgdG8gcmVhcHBseQ0KPiBzZXR0aW5ncykuDQo+IA0KPiBBIHdlbGwta25vd24g
cHJvYmxlbSBvbiAuLi4NCj4gDQo+ID4geGwgaW5mbzoNCj4gPg0KPiA+IGhvc3QgICAgICAgICAg
ICAgICAgICAgOiB4eHgNCj4gPiByZWxlYXNlICAgICAgICAgICAgICAgIDogNC4xOS4wLTE0LWFt
ZDY0DQo+ID4gdmVyc2lvbiAgICAgICAgICAgICAgICA6ICMxIFNNUCBEZWJpYW4gNC4xOS4xNzEt
MiAoMjAyMS0wMS0zMCkNCj4gPiBtYWNoaW5lICAgICAgICAgICAgICAgIDogeDg2XzY0DQo+ID4g
bnJfY3B1cyAgICAgICAgICAgICAgICA6IDQNCj4gPiBtYXhfY3B1X2lkICAgICAgICAgICAgIDog
Mw0KPiA+IG5yX25vZGVzICAgICAgICAgICAgICAgOiAxDQo+ID4gY29yZXNfcGVyX3NvY2tldCAg
ICAgICA6IDQNCj4gPiB0aHJlYWRzX3Blcl9jb3JlICAgICAgIDogMQ0KPiA+IGNwdV9taHogICAg
ICAgICAgICAgICAgOiAxOTkyLjEwMA0KPiA+IGh3X2NhcHMgICAgICAgICAgICAgICAgOg0KPiBi
ZmViZmJmZjo3N2ZhZjNmZjoyYzEwMDgwMDowMDAwMDEyMTowMDAwMDAwZjowMDljNmZiZjowMDAw
MDAwMDowMDAwMDEwMA0KPiA+IHZpcnRfY2FwcyAgICAgICAgICAgICAgOiBodm0gaHZtX2RpcmVj
dGlvDQo+ID4gdG90YWxfbWVtb3J5ICAgICAgICAgICA6IDMyNTQyDQo+ID4gZnJlZV9tZW1vcnkg
ICAgICAgICAgICA6IDIwODM2DQo+ID4gc2hhcmluZ19mcmVlZF9tZW1vcnkgICA6IDANCj4gPiBz
aGFyaW5nX3VzZWRfbWVtb3J5ICAgIDogMA0KPiA+IG91dHN0YW5kaW5nX2NsYWltcyAgICAgOiAw
DQo+ID4gZnJlZV9jcHVzICAgICAgICAgICAgICA6IDANCj4gPiB4ZW5fbWFqb3IgICAgICAgICAg
ICAgIDogNA0KPiA+IHhlbl9taW5vciAgICAgICAgICAgICAgOiAxMQ0KPiA+IHhlbl9leHRyYSAg
ICAgICAgICAgICAgOiAuNA0KPiA+IHhlbl92ZXJzaW9uICAgICAgICAgICAgOiA0LjExLjQNCj4g
DQo+IC4uLiB0aGlzIG9sZCBYZW4gdmVyc2lvbiwgSSBiZWxpZXZlLiBJIGRvbid0IHJlY2FsbCB3
aGVuIGV4YWN0bHkgaXQgd2FzDQo+IGZpeGVkIChhbmQgSSBkb24ndCBrbm93IGF0IGFsbCB3aGV0
aGVyIHRoZSBmaXggd2FzIGJhY2twb3J0ZWQpLCBidXQNCj4gdHJ5aW5nIGEgcmVjZW50IHZlcnNp
b24gb2YgWGVuIHNob3VsZCBnZXQgeW91IHBhc3QgdGhpcy4gSWYgYSBmdWxseQ0KPiBtYWludGFp
bmVkIHZlcnNpb24gaXMgc3RpbGwgYWZmZWN0ZWQsIGEgYmFja3BvcnQgY291bGQgYmUgcmVxdWVz
dGVkLg0KDQpJIHN3aXRjaGVkIHRvIHhlbl92ZXJzaW9uIDQuMTQuMi1wcmUgKHRoZSBzdGFuZGFy
ZCBwYWNrYWdlIGZyb20gRGViaWFuIGJ1bGxzZXllKSwgcmVzdWx0OiB0aGUgaXNzdWUgaXMgZ29u
ZS4gVGhlIFBDSSBkZXZpY2UgaXMgYXR0YWNoZWQgcmVsaWFibHkgdG8gdGhlIERvbVUsIGV2ZW4g
YWZ0ZXIgcmVib290Lg0KDQpJIGhhZCBzZWFyY2hlZCBmb3IgaW5mb3JtYXRpb24gb24gdGhpcyBp
c3N1ZSBvbiB0aGUgd2ViIG9yIGluIFhlbiBtYWlsaW5nIGxpc3RzLCBidXQgSSBvbmx5IGZvdW5k
IG9uZSBzdXBlcm9sZCBidWcgcmVwb3J0LCB0aGVyZWZvcmUgSSBkaWRuJ3QgdHJ5IG91dCBhIG1v
cmUgcmVjZW50IFhlbiB2ZXJzaW9uIG15c2VsZi4gSXQgbm93IHR1cm5zIG91dCBJIHNob3VsZCBo
YXZlLi4uDQoNCkFueXdheSwgdGhhbmsgeW91IGZvciB5b3VyIHN1cGVyZmFzdCBoZWxwIQ0KDQpQ
YXVsDQo=

