Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762A3327C15
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 11:28:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91427.172867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfn0-00066Y-KS; Mon, 01 Mar 2021 10:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91427.172867; Mon, 01 Mar 2021 10:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfn0-000669-GU; Mon, 01 Mar 2021 10:28:34 +0000
Received: by outflank-mailman (input) for mailman id 91427;
 Mon, 01 Mar 2021 10:28:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b02j=H7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lGfmy-00065l-UI
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 10:28:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b11b183-2410-4fbf-baaf-2ccbebbb1510;
 Mon, 01 Mar 2021 10:28:31 +0000 (UTC)
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
X-Inumbo-ID: 1b11b183-2410-4fbf-baaf-2ccbebbb1510
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614594511;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=4p6vOgGgpqTEuKoZ6o1srBL3CupbXELEbGPZ41JgdJk=;
  b=VtIaDZmsmAjF6JHcWGYeplURhuVur0tSUGk4/RcsgiUS0H/3rvODvrBc
   wBH7qHs5Uf9h2uQqWjH0qKCuBRLPdFLO4JLmHg9AUJBxEtpQZPz6VRtSE
   B0zX2F3YhZe5ejqB69XMI627BvSdxVQ18ksBwSYiEGp05hiEa9s6ado9/
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 90g6ugrqQAnla3kXZci7lDC1QZwjffyuupxJCQR19wbfsVjHWixUwABnkJW+KjHoUoEodGPg0H
 dVhLRmhtgUL4QktSmTKVD69YRT+l6wo/eqnWv1cXD67INo3DHNE8Yl7TuNHktbrR3BAVWlsN67
 j2EGj/3HsAWQXhZUM/ZfKW6biQB33VhzRDHWGGpcQ7tcia78yNyLsl+V7gIAst7pv+CBXdRSNN
 XF3kjQbMcMAPE2qV/s73lBZg7pwuAh3Aew4JDadDDJ640PZMudoJCHWj9mzaPXXDRixcPM/LOk
 u64=
X-SBRS: 5.2
X-MesageID: 38237403
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38237403"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Au+lzRP4MSa9NvedH5/weHDSH3Gi7E6YOgck2s6krrjv6H8EnAl5HUNmyInIlbqIxT/h5rjWJBG2wW9be6H1a4TSLw109EGh2XINChenGE5thNSocPoRzipB6+irvkVTGqNcr4oZOHIz9o67qlD6Onlc+s90RYnc+8w4mCCo5qTqdaW9gA9Soh+5dZLAr4hBCxRZVGbT4rBa2PSP0bYM8qjZD6SG+UvDJVlraPCnwT9VCiqhri3JrUKPg02pIe5do1K6a7D6liNBIQUR5ZiTxXb0MTVhNrZsxI5ZgChWdOVXEugo4L8c2arjqE48aaepcEAGCQAHoBbUA7ol6mHW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4p6vOgGgpqTEuKoZ6o1srBL3CupbXELEbGPZ41JgdJk=;
 b=Na0DYAdzpSwgfNraaj21NXiT1f4XP+2ia0d3bnhG3E4XuWK90ynkRFF/GpB5pGQ/t0XtH0NyTjLJ6YE/O4VxCHyPSlKu1OhS9wL/xxWuYOgxEfjYH7UzlxgXMNuC7ooNggo+QtXnU1S2psNpGXsGx8ii7ch+q2AYJTyirifnuWphMGRflRBzCexoVjtUmEflDG6TO94m+ZJCXZEiQy/jRtCChUB7Q0oesmJHcUzPPyGVspAAA28chxJQzccq/xfOoyzMSUKBhvEL8Vfqued4qhKcZ2WREXGzM3Dj0eHr0pT0D19KzqEQGZ+CUPxvPKv3d0ww44/f2XQdirJBzMPrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4p6vOgGgpqTEuKoZ6o1srBL3CupbXELEbGPZ41JgdJk=;
 b=KQz12FUc5j4lUA4K/zO9GCZ/FCrh4nVGyu9T8MyVi6JcbZEdTUb4v9uOboVDjsP6L/9zS7dsfGL5X+p5+d63QTldszRa8KBRUwBlXKL7/b29imJtvMzpr/ykmSzS+9LRTHKxJqOYUWYYxzOr9AYzUh+GG4bLDwp6OwVNTjH+4ZM=
From: George Dunlap <George.Dunlap@citrix.com>
To: "open list:X86" <xen-devel@lists.xenproject.org>
Subject: [ANNOUNCE] Call for agenda items for 4 March Community Call @ 16:00
 UTC 
Thread-Topic: [ANNOUNCE] Call for agenda items for 4 March Community Call @
 16:00 UTC 
Thread-Index: AQHXDoWcA7IBXVquOEeGxSOPEpK0Ww==
Date: Mon, 1 Mar 2021 10:28:25 +0000
Message-ID: <3BDC2651-9FC0-409C-BED3-46114C6E0696@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ba238c6-6fe8-4271-809b-08d8dc9cbf3a
x-ms-traffictypediagnostic: PH0PR03MB5799:
x-ms-exchange-minimumurldomainage: cryptpad.fr#2293
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB579974F7455D7701E5D27807999A9@PH0PR03MB5799.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3Bg07WBZ2+u0rpIb+7+cEWSS6gvZl7bHFKZ93O30ciHAAmCuvo+MA7DL+rvdQxM+/3fn3fkP5h/BzICPsdyMdvn42nOm6jnRUFky5FGCdPRpzaFAfkt745mD5GC3O0YGKO3rUQjw5o4rLP9W9kiWFy75UOzWlGhlBYTl6tsUV9tXMINcP/FntJ3G1uWeNtO3UKC+N5dG7bjYdHQAu5eCX5mm4j7MN11mL6I+Rm+Yg8dx9xR0J4bR7YGS0Cett9U2IZBPMqjZ9Thd7gegUjOGVcNEJUgxzO8wejDdvQkzo2A3J9+xNss8KDQ/qkMlXqxDX8Z0ArHSIBvHRiR85JULFbhi/xs36/oLaexqbHuqpjvZEY5oO/cwsUO+iPBtNuSa/w2oCSl7E5SdTanoEkzcuuBwh6crbpaIsxYZ+wvaH9uM6pihlsxPeyTB2YZuIwd6k+darNs0vDs+dNVq3peTPahyp9If8BE2srjL/rkywDjdtSReU4d/eeMgIWjaFgw2GZUcLz/i14Kheeul4EzSzC7FqlBJ4PqFO5xkaz0v5fX1T9VjEEEGVon/LPRY1Uf2xvzDnVVPTZEf8ebQCKFI1ssrupjHJbINtPEXSsCZB3MWkY6G8mvgARh6F6VKd0PqkBCtO1u/KUquV8X1cVALGg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(36756003)(7416002)(8936002)(5660300002)(6512007)(6916009)(316002)(91956017)(2616005)(86362001)(6486002)(4743002)(7406005)(76116006)(33656002)(8676002)(66446008)(66946007)(966005)(2906002)(71200400001)(478600001)(64756008)(6506007)(66476007)(26005)(186003)(83380400001)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZW1HVi9RMmxGYjFueFYvZzNoSktQNlhocXh2bC9waS9RdTNXWEpkY2ttd0Qr?=
 =?utf-8?B?WDNsQ0tZZmNIb1c0a2ZET01Rc3laTi9OSTJ5RHNJVkZHbzFYZzRTSGFaV1VV?=
 =?utf-8?B?ck9nY0JkMTM0N3VaZ3dURlJjZjU2ZklHOHFjVXA5UzBoUjA2cHJ3YXBKenA5?=
 =?utf-8?B?ZDJuTDBnL2p3TU16K3BJYmc5dWo4MkxTS3d2ZUR5L2tNNThBNExxUVR2TWhh?=
 =?utf-8?B?ZXNqQnRHYzhqVEFBKzd2NTlqWDk2Z1NJTC9XRmZBaW1TbjNCT2hkT0ROeUlY?=
 =?utf-8?B?RzlMdFJnQWxNWDRXYmRUSFAzNm1FUjA1Y25nSVk0alJCYkt1QnJtdHV1cVM3?=
 =?utf-8?B?aHU1em1McUxmbU9wM3lHUEdnM2RZeGNXUWpUTVJHVXBnQStuL0RxMERGS0Fy?=
 =?utf-8?B?RTRoTEF2Vlk4aVNjWkpseWcvcGtDTFJQMlFSdnpWbjltVGRIVGxNbWlLSzRO?=
 =?utf-8?B?dHJQLzllZEFIMC8xaTlmSHBrQUhiRDREVXI0OU41R0ZlWis2WU5ETHNvWXBt?=
 =?utf-8?B?Y0ZpejR0elYzRFlHSXRxVVh1dklLWDJwU2hYK3ljR1hjZ1pJYVZuL0QrV1l5?=
 =?utf-8?B?eVVGbk55TVJwQ2dVRjFBeWhBSDRQNk1NYTVDZm5HeWFqTGx0bGJrNnJRdFNH?=
 =?utf-8?B?WXNObWFNbkJZK0hyQmp3dFZscWpmZXhNLzliTFR3L0FyMzNxUEZTS3NzTEFv?=
 =?utf-8?B?QnloM09YTlMwMFNCc1NoZjkyaWVPdEJTSWVLRHAxNFBiV3hyOHVTRTF3anR6?=
 =?utf-8?B?UTV2NVRVUmxsYk9KMnNjWjBxMTZnK0hrZkd4MTFnSDRBOURCUHNlRi9oRk5x?=
 =?utf-8?B?clR5TGFlM3Jka2dMWUEzb05OL0J4b1lJSTJmQUE0VjVJRnVKdVIwYjF4RHhz?=
 =?utf-8?B?ZGlNYm1uWkQ0UUVsWW94Z1lLY2ZCdm5TZ3AyRWQ3T0JobG0vU2FjdmtHVml0?=
 =?utf-8?B?Q0svdlpWY2ZDRUpHTGgvSTNHeXc2U1BCc0cvM0VXNk9qT2MvZU9nNEJiQlZE?=
 =?utf-8?B?Z24yWEh6M2xWbUM1QXlYaUxmOWVad3UyQVdWVVZQVmlFRFJlai9Eb3VId3Rz?=
 =?utf-8?B?emphUmk0LzM5UDNRVU5PUnNaaU5KZ1M4US9nS2NGaFhnY3VvRjhEWDRDbExu?=
 =?utf-8?B?bHJ4akMyRWdHQlM5RC9XWUtycXRCNGU1NnNwNlVGSVNtaUtZSHM5NzlJRS9p?=
 =?utf-8?B?QlVnRkVEZ2dqZk1ybTA0TkNKazdNc3JaZk0vNitPYTViWGp3NkR2UEVZSE9E?=
 =?utf-8?B?cDZTNFZCd2ZDYlFyd2VmKzJuTGNhUjdLcVVnUDZMMjE0K2FBU2JDTFVYT0E3?=
 =?utf-8?B?OHJQY0ZBRUZ0Rk41SWxpdng0TzJ0ZWVjTWFzM2wvSlFQN2NvQjFXRU1GU3Bt?=
 =?utf-8?B?VlMxdDBpY1FSZnBqWDdybnUrT3UwMU5UZ2ZSQ3dkNG1LbzlEcmFuclhsRnpz?=
 =?utf-8?B?VFUxN0toNTBYMk5mbTE3OG9LZTh1TUZLWDAwNEpTajR3d21rN1Y4UHZXY0Vw?=
 =?utf-8?B?T25Pbnp2bGFzcDd1V29NWS8zRHhoSjlEZGdBRUhRc2trenRZVnNiV2NMZDRn?=
 =?utf-8?B?S2dxMTg5Z1A0aVk1NFRIOHFkOXl5SGlvLzF4ZmV5ZHpmVXVFUllURVd0bHlp?=
 =?utf-8?B?OEZWZmxSb2czdlZkdUNpb1JtTkFNQ3RBRXgxTGpiTTJZN1A1am91ZkMwQVFp?=
 =?utf-8?B?aDhVUVhIYyttVWN3OXFQM0V2UlREQUtJV0MzZjRNb0VtSmUxT0dNVXpDVU1a?=
 =?utf-8?B?K0EzUjdnZjdhUGxnYXZRM3I3OFpsaHpqUXZZZ1grQWN5ZHp4WDBoQUl6YjZV?=
 =?utf-8?B?RTk5aTRpcjBtc050MWNiQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EC44C406A19F148886E0A5E15E06D1C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba238c6-6fe8-4271-809b-08d8dc9cbf3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 10:28:25.1518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zn/LroW4DR1yRdf6C+mQkTwmk5ozw96Pc7asaG0+0EMk49QBgAhBbNDetqyvXtED6Toxy9ZWYtuJfKaU4bjyBXGhQ+/5z01f0NdxR/YaRfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5799
X-OriginatorOrg: citrix.com

DQpIaSBhbGwsDQoNClRoZSBwcm9wb3NlZCBhZ2VuZGEgaXMgaW4gaHR0cHM6Ly9jcnlwdHBhZC5m
ci9wYWQvIy8yL3BhZC9lZGl0L2ZCanpuUWxHWUdjSHdxVDAtTXUrbDI2MC8gYW5kIHlvdSBjYW4g
ZWRpdCB0byBhZGQgaXRlbXMuICBBbHRlcm5hdGl2ZWx5LCB5b3UgY2FuIHJlcGx5IHRvIHRoaXMg
bWFpbCBkaXJlY3RseS4NCg0KQWdlbmRhIGl0ZW1zIGFwcHJlY2lhdGVkIGEgZmV3IGRheXMgYmVm
b3JlIHRoZSBjYWxsOiBwbGVhc2UgcHV0IHlvdXIgbmFtZSBiZXNpZGVzIGl0ZW1zIGlmIHlvdSBl
ZGl0IHRoZSBkb2N1bWVudC4NCg0KTm90ZSB0aGUgZm9sbG93aW5nIGFkbWluaXN0cmF0aXZlIGNv
bnZlbnRpb25zIGZvciB0aGUgY2FsbDoNCiogVW5sZXNzLCBhZ3JlZWQgaW4gdGhlIHBlcnZpb3Vz
IG1lZXRpbmcgb3RoZXJ3aXNlLCB0aGUgY2FsbCBpcyBvbiB0aGUgMXN0IFRodXJzZGF5IG9mIGVh
Y2ggbW9udGggYXQgMTYwMCBCcml0aXNoIFRpbWUgKGVpdGhlciBHTVQgb3IgQlNUKQ0KKiBJIHVz
dWFsbHkgc2VuZCBvdXQgYSBtZWV0aW5nIHJlbWluZGVyIGEgZmV3IGRheXMgYmVmb3JlIHdpdGgg
YSBwcm92aXNpb25hbCBhZ2VuZGENCg0KKiBUbyBhbGxvdyB0aW1lIHRvIHN3aXRjaCBiZXR3ZWVu
IG1lZXRpbmdzLCB3ZSdsbCBwbGFuIG9uIHN0YXJ0aW5nIHRoZSBhZ2VuZGEgYXQgMTY6MDUgc2hh
cnAuICBBaW0gdG8gam9pbiBieSAxNjowMyBpZiBwb3NzaWJsZSB0byBhbGxvY2F0ZSB0aW1lIHRv
IHNvcnQgb3V0IHRlY2huaWNhbCBkaWZmaWN1bHRpZXMgJmMNCg0KKiBJZiB5b3Ugd2FudCB0byBi
ZSBDQydlZCBwbGVhc2UgYWRkIG9yIHJlbW92ZSB5b3Vyc2VsZiBmcm9tIHRoZSBzaWduLXVwLXNo
ZWV0IGF0IGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9EOXZHemloUHh4QU9l
NlJGUHowc1JDZisvDQoNCkJlc3QgUmVnYXJkcw0KR2VvcmdlDQoNCg0KDQo9PSBEaWFsLWluIElu
Zm9ybWF0aW9uID09DQojIyBNZWV0aW5nIHRpbWUNCjE2OjAwIC0gMTc6MDAgVVRDDQpGdXJ0aGVy
IEludGVybmF0aW9uYWwgbWVldGluZyB0aW1lczogaHR0cHM6Ly93d3cudGltZWFuZGRhdGUuY29t
L3dvcmxkY2xvY2svbWVldGluZ2RldGFpbHMuaHRtbD95ZWFyPTIwMjAmbW9udGg9MTEmZGF5PTUm
aG91cj0xNiZtaW49MCZzZWM9MCZwMT0xMjM0JnAyPTM3JnAzPTIyNCZwND0xNzkNCg0KDQojIyBE
aWFsIGluIGRldGFpbHMNCldlYjogaHR0cHM6Ly9tZWV0LmppdC5zaS9YZW5Qcm9qZWN0Q29tbXVu
aXR5Q2FsbA0KDQpEaWFsLWluIGluZm8gYW5kIHBpbiBjYW4gYmUgZm91bmQgaGVyZToNCg0KaHR0
cHM6Ly9tZWV0LmppdC5zaS9zdGF0aWMvZGlhbEluSW5mby5odG1sP3Jvb209WGVuUHJvamVjdENv
bW11bml0eUNhbGw=

