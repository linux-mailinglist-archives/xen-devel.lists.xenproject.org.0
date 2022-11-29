Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE61B63BD41
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 10:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449328.705996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozxEj-0008Jb-0a; Tue, 29 Nov 2022 09:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449328.705996; Tue, 29 Nov 2022 09:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozxEi-0008Hm-Ty; Tue, 29 Nov 2022 09:49:08 +0000
Received: by outflank-mailman (input) for mailman id 449328;
 Tue, 29 Nov 2022 09:49:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wCXv=35=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ozxEg-0008HR-Og
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 09:49:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f74efd3-6fcb-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 10:49:05 +0100 (CET)
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB8897.eurprd08.prod.outlook.com (2603:10a6:20b:5b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 29 Nov
 2022 09:49:02 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5880.008; Tue, 29 Nov 2022
 09:49:02 +0000
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
X-Inumbo-ID: 0f74efd3-6fcb-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUsa4A6CkfFEOuaVMIUJQaz1N7HC2lZFsqzbpAzXBSnEuLgXCm1hRpnVeDSrEyYe/l+N4pwqHpE+VwBY7bp6PNpNKq7vPRPluP7/YdEjRuSpdatgM4TfMxo7TvRe1ox4ebijansPcHSXktAclajWySimxji453mZlfwvsJmG+X4cVOma+08uO8IzqiGcQLKrPSeyLA/3kE3vqeCnThx+iiIswix9LGCND8hYW1Rh/oNxc93TJKiEZJJI2WXF4CfczW1S+E3/7hrpQoBi+prnlMZTuc7vwFDIJjj1g55nm6ogvWlKGmeZwC1eyt6IQebbONbVYujXNHG57oux9aoZCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LY1A6ky9m0QgZs2sJRFR1OL0cmd8JIFgOo9/CEqG/ns=;
 b=AG9ahIyf/N0IcKxQPrFmTjpB3y+K+t9dE7MsZdhJSEL6lqS4thKdm8j0CTTnhhsQBkD1luAJygFvyRgAnX3qYQbDvD2PMvirfa5bLQN3OpvsyicXxxgzWztHkqwwZwE/bXDK/k74NTUbB3k6IR+NfAJEq0TMmGyYuSWnsrpsu30RNhWGR++GCuMqM6LTxZgR5IR4mGHCBGJhRr3gpnSd3rQyXArm4DfDRrqvZ37wzQNG+gyXR3SHfJh8Im2l7SGHzWgNzpGLJnKCJWhCy2nJX+ObTs//LmktA73IFIy/fLASxcd6WBm6BEF4+RjlugsXl5x3WdhbjEcZP5CbGXlwDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LY1A6ky9m0QgZs2sJRFR1OL0cmd8JIFgOo9/CEqG/ns=;
 b=Kzitrq+9wk8dWfozim7qY7ZMdhXi5RKVO15q2ACRFvyyXiLwsSDV+pZ58NH+yPywYZAlHj+1+4iFFiuz2I8ZvnrgVvyxzm/D/H6yS2SeyLIl3/ZORs91qPYBhipfx5PiGQy3+TrNApWwP7bGuppxEHXh/Ji5P4ITWa88lb9K5og=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/4] xen/scripts: add cppcheck tool to the xen-analysis.py
 script
Thread-Topic: [PATCH 2/4] xen/scripts: add cppcheck tool to the
 xen-analysis.py script
Thread-Index: AQHZAzNLrQ+cdSzeJ02hq/RTLwHjha5Ucy2AgAAFEACAAS8cAIAAAd6A
Date: Tue, 29 Nov 2022 09:49:02 +0000
Message-ID: <901024B3-77F2-4510-8B04-4CD7FA2502D3@arm.com>
References: <20221128141006.8719-1-luca.fancellu@arm.com>
 <20221128141006.8719-3-luca.fancellu@arm.com>
 <1a0f27e6-1b0e-d5cb-7f3a-337b9664eb75@suse.com>
 <35743861-CF6F-4B80-AFE9-182D34678FC8@arm.com>
 <7da53010-56dd-8d91-fde3-9fde0d76125c@suse.com>
In-Reply-To: <7da53010-56dd-8d91-fde3-9fde0d76125c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3749:EE_|AS8PR08MB8897:EE_
x-ms-office365-filtering-correlation-id: df641a5e-7185-4b0c-dd81-08dad1eef25d
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 En/W7ZuAAv/0Dw+wBFoxORehOqPGa8rQBiTNi/WBRzxs19Uz2qKq/HW1d1Ynj3XW31G6LAY8bqZTEEODn6Ew7SQnAu8LmEXvbZHu4xqkF53kTkXzzNAPbHhzstlYJA/s4EXsLPlAqH309mn+BZRsz99FEOLSjnhQIP0EVnuKhHNcbTrhk+e3386B3coXATrJYRUVfnMlstfxPUqEhoP5bjItZmLX4DPpo5MxJOHbUfuybzrwzpO9VGc+gZDKukGG4vhfB8rrpTdV8SoLwWzhQHz/MO8cS1yfWqZM4WxrZ06WoSE/G+TZo/eztO5S6exhd+5rlxGrIna35h8X9waQ8YU3nONS+j4Tr/xo6TCv39ZLZQkcoEmamhV/sRsu0EewN2E/Qvtw5ea5eLHbn+4ofiiLDAiPVOh2mzGk7zB3xnbLj6GDwyf9kv7kBiBPWnfZBZ4GlH0/mppn06cIKSYfjkKKWo+0qZKMBPamF58+nSvBxCrnV+Gtv71LCWA/Rli4lETx03ITzq3lUeXlH2/6t+YyVuQsqFfUXpZ92KcxdbL+Cdip1U7jnPeLl4Y0v9xaNUIUM1RssyEMPFq7Bu59SaVKDPrXoa6XjZpANYqu3Lk+o2hETdd15F7p8Hl45alaXZLwgxlH9ncHniqqrutrl5463ZW4IWQsf8gqv6yPeMhObH1vorkQG+wjJC2kVKIwGKpvBVl3qYEO6iDJj5O92Lky4dqwtE7lYNjdxRPNF4s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199015)(76116006)(66946007)(64756008)(66556008)(66446008)(66476007)(8676002)(4326008)(36756003)(91956017)(38070700005)(5660300002)(54906003)(122000001)(6512007)(26005)(6916009)(316002)(86362001)(33656002)(83380400001)(2906002)(8936002)(41300700001)(186003)(2616005)(38100700002)(478600001)(6506007)(53546011)(6486002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cGpmNU5GTk5ueGtlVnRPZ0c1cy9tdHJmQ1RvMXhOWWNXNkE0N3U0czIwUlhU?=
 =?utf-8?B?WVlRd1BMeit4OHJURldjSlh3UFlJNzNCb3Fmd08xV2RXQUE2Nnd3aXBCdjVM?=
 =?utf-8?B?aDhpOGhXM21NakhSK3RPeitCU0JaM1lIY1BuRVRsNmt2bVhBVVg2T2p0dm9a?=
 =?utf-8?B?YmVaWmFmSUpkMU1QdnNRQ0tNMVdGam5WekNBQjdGWDZ6dWVPenM1VFNmb2xP?=
 =?utf-8?B?aGxybUJBN3A3TVNNR1Z6K0RUVU1hdU9nNGZYZnBXL0FWb3lzUGM2RXphNlRL?=
 =?utf-8?B?UEJ1cGJwelQ1ZWx4NWJMajFCVm5EQ1BRdExYa1NYUEd0dEVKdlhVeWhoTXpW?=
 =?utf-8?B?cjUvaHRXckxKckdYdEVjZ3BGeE9mcHVnMUQra0pLc0R2OTB6bnJyemdWOVhj?=
 =?utf-8?B?WkRPdDlRbm1xR2RhY25WditYVnQ3UEdHTXFnZmJCankycmQ3TkduNlJtTERJ?=
 =?utf-8?B?NHVuclRiaTljK2dVdGhJc1hxMmp5SmVUVzJ2Y2dzSXVHeFB5RytEd0tORWVv?=
 =?utf-8?B?Rk9PaXR3RHRRMmIzczhBdXJMdmE3R20rV2I0S3psWUtvakVKaDFFbVBNL09H?=
 =?utf-8?B?eCsxelIyYjBQbVRxam4rald6YVZUdnhySkJIUzNRTldSRFlZVEFiV1VPa0Z5?=
 =?utf-8?B?QVJIemhsdS8wcnNiVWpIMUJyeC8zUUVUMDZxNTFRRndpYTJ2dmpmcE8xOTdC?=
 =?utf-8?B?aTVqTmhtTSs2ZXBUVTBmV3dsRW5jZ1FBZnZEczlEREFqM28rTUd5Z1MwUGxP?=
 =?utf-8?B?ZjhoWFV1YkwzaTBMR0QzaDdPKzNGdXRQYjdoMEJpMXMwWEZ0cXFRT3QzNHdr?=
 =?utf-8?B?SllQT1o4Unlack8rNzk1RnBTR3plbmtnTVpEWFhkMzBSSFdXdFZSZlYvZU51?=
 =?utf-8?B?c1p6MDdEbnBnU3ZHUDExQmJ6L1d5WjEwVjVpK3RCZDZiK1htTTdKcUxHT2Rw?=
 =?utf-8?B?T2FBT2JKWXZWK0RzdVMzUkZCZ01DbXpGa3JVOWZQT3NMQkZvMWNkTDAzL0ho?=
 =?utf-8?B?eXloVDdHaDlIdjVLT2V6OU0veXh3ejhHRnBGeEN1dkZlNnZMNEw0US81Z0dR?=
 =?utf-8?B?TURPRGhKZWo2ckUvN1dlNlkzOERVd21ycEVVRjFNN3R0T29qUGNLa0dhWm1j?=
 =?utf-8?B?RnZVd3JYYTRrN2w1aTFRbmM4a1hqbWNjQnhZLzk5SjA3VVhEN0JtaURqWEhW?=
 =?utf-8?B?b200aEE1VktEQVRSWmRVdCtGUzE3dThlWG04OGpjbXpBNHdVRzlYMVFZOXJC?=
 =?utf-8?B?cEQwa1ZBYVZlREtjYytwdnRBZGNtamhVbG84V0J6bHMyTTlmek5OK1ZwWGhB?=
 =?utf-8?B?WFVjT1hmSFU2Q3RYUVh1ZDBtOFU0ZXdBWEVqMzdNWHlST0RFVmwvN2l2Zlpz?=
 =?utf-8?B?Y00xZTg2Z1pFNzd6M2xXT3l3K0xuaDhwa1dhWE5oZmlLUi9nT3hmWTNGUHN3?=
 =?utf-8?B?Slp5cUxaZVlqdExOeU9XWWFvVENlSnh2WkQrOW9rMnRlb0tTN3ljNEZBMDRF?=
 =?utf-8?B?SnVzZUtRUU1XV0l5SEszKzg4MWlEcjdNazhXTVJrQVN2KzUxcXVXK1YxZVZT?=
 =?utf-8?B?VWRpNGsrUGRWUEhwVmpLOXR6M1JpQm10aXBxU1VGSlNHa0o4SFdycHpsNGpr?=
 =?utf-8?B?L1QyUFUvMS9WRHhGZEg4WU92YWc0NmFTSk9md1AxaVJHZGVuSXQ3UDA0bk16?=
 =?utf-8?B?RDdBL1dNb2dodjhRZ3J1Tnc1SWRpYVowVzRLVE9Ed0o2bkxPSXk1cnIyUXMy?=
 =?utf-8?B?Y1lrdk96VllaTGhYR2QrK3RzN3lYREdrSWpZaWY2VURaMndDN2pRQjM1VGhw?=
 =?utf-8?B?MmNxSGJNVy83MUlmWEZ4SlBlOWxhSjdNckN4YnZLcGJRSWZMa1VRSGdHZFhx?=
 =?utf-8?B?Z2d2eitFNXVXK0JQRmcvdGgxVlJQK2lOQW5TRWtUbUFPWVAwMHdNc3VPWG5J?=
 =?utf-8?B?L1FxUWpZR0RqWGRqa3JsQWJ4Y1ZheSs0RmhwenRnbEJCYzh6WDhIY0xkbjBV?=
 =?utf-8?B?Q0x6UVFlUVBPaWRFTXQrRWJTb2daMW41KzNUMjBBcms4RkNQdjJsWmJCcERv?=
 =?utf-8?B?eThOVXNxRGdqajhnNE82ZlhzNEkvMWQzcURsWmVLS1lGSUptQ2NNQXVmVUZ0?=
 =?utf-8?B?MFljaWdPUWFxTnNBN2tmN2JxTkltcXJtTGJLaTJjQ0FGNndKaFNFQnJvM01T?=
 =?utf-8?B?Mmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <094E385CB951E04ABDA146F9B5EF3E6D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3749.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df641a5e-7185-4b0c-dd81-08dad1eef25d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 09:49:02.4849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dRm5Iqyo7NEGOeNunXNNIusRkGQ3TLfJyIBEU0eCGycDW14Ihmd5ukMx18SYCOZaQhSkmHP+iTXOAPM3eBjwAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8897

DQoNCj4gT24gMjkgTm92IDIwMjIsIGF0IDA5OjQyLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjguMTEuMjAyMiAxNjozNywgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAyOCBOb3YgMjAyMiwgYXQgMTU6MTksIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMjguMTEuMjAyMiAxNToxMCwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4gQ2hhbmdlIGNwcGNoZWNrIGludm9jYXRpb24gbWV0aG9kIGJ5IHVzaW5n
IHRoZSB4ZW4tYW5hbHlzaXMucHkNCj4+Pj4gc2NyaXB0IHVzaW5nIHRoZSBhcmd1bWVudHMgLS1y
dW4tY3BwY2hlY2suDQo+Pj4+IA0KPj4+PiBOb3cgY3BwY2hlY2sgYW5hbHlzaXMgd2lsbCBidWls
ZCBYZW4gd2hpbGUgdGhlIGFuYWx5c2lzIGlzIHBlcmZvcm1lZA0KPj4+PiBvbiB0aGUgc291cmNl
IGZpbGVzLCBpdCB3aWxsIHByb2R1Y2UgYSB0ZXh0IHJlcG9ydCBhbmQgYW4gYWRkaXRpb25hbA0K
Pj4+PiBodG1sIG91dHB1dCB3aGVuIHRoZSBzY3JpcHQgaXMgY2FsbGVkIHdpdGggLS1jcHBjaGVj
ay1odG1sLg0KPj4+PiANCj4+Pj4gV2l0aCB0aGlzIHBhdGNoIGNwcGNoZWNrIHdpbGwgYmVuZWZp
dCBvZiBwbGF0Zm9ybSBjb25maWd1cmF0aW9uIGZpbGVzDQo+Pj4+IHRoYXQgd2lsbCBoZWxwIGl0
IHRvIHVuZGVyc3RhbmQgdGhlIHRhcmdldCBvZiB0aGUgY29tcGlsYXRpb24gYW5kDQo+Pj4+IGlt
cHJvdmUgdGhlIGFuYWx5c2lzLg0KPj4+PiANCj4+Pj4gVG8gZG8gc286DQo+Pj4+IC0gcmVtb3Zl
IGNwcGNoZWNrIHJ1bGVzIGZyb20gTWFrZWZpbGUgYW5kIG1vdmUgdGhlbSB0byB0aGUgc2NyaXB0
Lg0KPj4+PiAtIFVwZGF0ZSB4ZW4tYW5hbHlzaXMucHkgd2l0aCB0aGUgY29kZSB0byBpbnRlZ3Jh
dGUgY3BwY2hlY2suDQo+Pj4+IC0gbWVyZ2UgdGhlIHNjcmlwdCBtZXJnZV9jcHBjaGVja19yZXBv
cnRzLnB5IGludG8gdGhlIHhlbi1hbmFseXNpcw0KPj4+PiAgc2NyaXB0IHBhY2thZ2UgYW5kIHJl
d29yayB0aGUgY29kZSB0byBpbnRlZ3JhdGUgaXQuDQo+Pj4+IC0gYWRkIHBsYXRmb3JtIGNvbmZp
Z3VyYXRpb24gZmlsZXMgZm9yIGNwcGNoZWNrLi4NCj4+Pj4gLSBhZGQgY3BwY2hlY2stY2Muc2gg
c2NyaXB0IHRoYXQgaXMgYSB3cmFwcGVyIGZvciBjcHBjaGVjayBhbmQgaXQncw0KPj4+PiAgdXNl
ZCBhcyBYZW4gY29tcGlsZXIsIGl0IHdpbGwgaW50ZXJjZXB0IGFsbCBmbGFncyBnaXZlbiBmcm9t
IHRoZQ0KPj4+PiAgbWFrZSBidWlsZCBzeXN0ZW0gYW5kIGl0IHdpbGwgZXhlY3V0ZSBjcHBjaGVj
ayBvbiB0aGUgY29tcGlsZWQNCj4+Pj4gIGZpbGUgdG9nZXRoZXIgd2l0aCB0aGUgZmlsZSBjb21w
aWxhdGlvbi4NCj4+Pj4gLSBndWFyZGVkIGh5cGVyY2FsbC1kZWZzLmMgd2l0aCBDUFBDSEVDSyBk
ZWZpbmUgYmVjYXVzZSBjcHBjaGVjaw0KPj4+PiAgZ2V0cyBjb25mdXNlZCBhcyB0aGUgZmlsZSBk
b2VzIG5vdCBjb250YWluIGMgY29kZS4NCj4+Pj4gLSBhZGQgZmFsc2UtcG9zaXRpdmUtY3BwY2hl
Y2suanNvbiBmaWxlDQo+Pj4+IC0gdXBkYXRlIGRvY3VtZW50YXRpb24uDQo+Pj4+IC0gdXBkYXRl
IC5naXRpZ25vcmUNCj4+Pj4gDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1
Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+PiANCj4+PiBKdXN0IHR3byBhbmQgYSBoYWxmIHF1ZXN0
aW9ucywgbm90IGEgZnVsbCByZXZpZXc6DQo+Pj4gDQo+Pj4+IC0tLQ0KPj4+PiAuZ2l0aWdub3Jl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKy0NCj4+Pj4gZG9jcy9t
aXNyYS9jcHBjaGVjay50eHQgICAgICAgICAgICAgICAgICAgICAgIHwgIDI3ICstDQo+Pj4+IGRv
Y3MvbWlzcmEvZG9jdW1lbnRpbmctdmlvbGF0aW9ucy5yc3QgICAgICAgICB8ICAgNyArLQ0KPj4+
PiBkb2NzL21pc3JhL2ZhbHNlLXBvc2l0aXZlLWNwcGNoZWNrLmpzb24gICAgICAgfCAgMTIgKw0K
Pj4+PiBkb2NzL21pc3JhL3hlbi1zdGF0aWMtYW5hbHlzaXMucnN0ICAgICAgICAgICAgfCAgNDIg
KystDQo+Pj4+IHhlbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDExNiArLS0tLS0tLQ0KPj4+PiB4ZW4vaW5jbHVkZS9oeXBlcmNhbGwtZGVmcy5jICAgICAgICAg
ICAgICAgICAgfCAgIDkgKw0KPj4+PiB4ZW4vc2NyaXB0cy94ZW4tYW5hbHlzaXMucHkgICAgICAg
ICAgICAgICAgICAgfCAgMTggKy0NCj4+Pj4geGVuL3NjcmlwdHMveGVuX2FuYWx5c2lzL2NwcGNo
ZWNrX2FuYWx5c2lzLnB5IHwgMjcyICsrKysrKysrKysrKysrKysrKw0KPj4+PiAuLi4veGVuX2Fu
YWx5c2lzL2NwcGNoZWNrX3JlcG9ydF91dGlscy5weSAgICAgfCAxMzAgKysrKysrKysrDQo+Pj4+
IHhlbi9zY3JpcHRzL3hlbl9hbmFseXNpcy9nZW5lcmljX2FuYWx5c2lzLnB5ICB8ICAyMSArLQ0K
Pj4+PiB4ZW4vc2NyaXB0cy94ZW5fYW5hbHlzaXMvc2V0dGluZ3MucHkgICAgICAgICAgfCAgNzcg
KysrKy0NCj4+Pj4geGVuL3NjcmlwdHMveGVuX2FuYWx5c2lzL3V0aWxzLnB5ICAgICAgICAgICAg
IHwgIDIxICstDQo+Pj4+IHhlbi90b29scy9jcHBjaGVjay1jYy5zaCAgICAgICAgICAgICAgICAg
ICAgICB8IDIyMyArKysrKysrKysrKysrKw0KPj4+PiB4ZW4vdG9vbHMvY3BwY2hlY2stcGxhdC9h
cm0zMi13Y2hhcl90NC54bWwgICAgfCAgMTcgKysNCj4+Pj4geGVuL3Rvb2xzL2NwcGNoZWNrLXBs
YXQvYXJtNjQtd2NoYXJfdDIueG1sICAgIHwgIDE3ICsrDQo+Pj4+IHhlbi90b29scy9jcHBjaGVj
ay1wbGF0L2FybTY0LXdjaGFyX3Q0LnhtbCAgICB8ICAxNyArKw0KPj4+PiB4ZW4vdG9vbHMvY3Bw
Y2hlY2stcGxhdC94ODZfNjQtd2NoYXJfdDIueG1sICAgfCAgMTcgKysNCj4+Pj4geGVuL3Rvb2xz
L2NwcGNoZWNrLXBsYXQveDg2XzY0LXdjaGFyX3Q0LnhtbCAgIHwgIDE3ICsrDQo+Pj4gDQo+Pj4g
V2hhdCBhcmUgdGhlc2UgbGFzdCBmaXZlIGZpbGVzIGFib3V0PyBUaGVyZSdzIG5vdGhpbmcgYWJv
dXQgdGhlbSBpbg0KPj4+IHRoZSBkZXNjcmlwdGlvbiBhZmFpY3MuDQo+PiANCj4+IFRoZXkgYXJl
IGNwcGNoZWNrIHBsYXRmb3JtIGNvbmZpZ3VyYXRpb24gZmlsZXMsIHRoZXkgaGVscCBjcHBjaGVj
ayB0byB1bmRlcnN0YW5kDQo+PiB0aGUgc2l6ZSBvZiB0aGUgdHlwZXMgZGVwZW5kaW5nIG9uIHRo
ZSB0YXJnZXQgb2YgdGhlIGNvbXBpbGF0aW9uLg0KPj4gDQo+PiBUaGlzIHNlY3Rpb24gaW4gdGhl
IGNvbW1pdCBtZXNzYWdlIGlzIHRvIGludHJvZHVjZSB0aGVtOg0KPj4gDQo+PiBXaXRoIHRoaXMg
cGF0Y2ggY3BwY2hlY2sgd2lsbCBiZW5lZml0IG9mIHBsYXRmb3JtIGNvbmZpZ3VyYXRpb24gZmls
ZXMNCj4+IHRoYXQgd2lsbCBoZWxwIGl0IHRvIHVuZGVyc3RhbmQgdGhlIHRhcmdldCBvZiB0aGUg
Y29tcGlsYXRpb24gYW5kDQo+PiBpbXByb3ZlIHRoZSBhbmFseXNpcy4NCj4+IA0KPj4gRG8geW91
IHRoaW5rIEkgc2hvdWxkIHNheSBpdCBkaWZmZXJlbnRseT8gT3IgbWF5YmUgc2F5IHRoYXQgdGhl
eSByZXNpZGUgaW4geGVuL3Rvb2xzL2NwcGNoZWNrLXBsYXQvID8NCj4gDQo+IFBlcmhhcHMgKEkg
ZGlkbid0IHJlYWQgdGhhdCBwYXJhZ3JhcGggYXMgcmVsYXRpbmcgdG8gX2FueXRoaW5nXyBpbg0K
PiB0cmVlKSwgZS5nLjoNCj4gDQo+IFdpdGggdGhpcyBwYXRjaCBjcHBjaGVjayB3aWxsIGJlbmVm
aXQgZnJvbSBwbGF0Zm9ybSBjb25maWd1cmF0aW9uIGZpbGVzDQo+IHRoYXQgd2lsbCBoZWxwIGl0
IHRvIHVuZGVyc3RhbmQgdGhlIHRhcmdldCBvZiB0aGUgY29tcGlsYXRpb24gYW5kDQo+IGltcHJv
dmUgdGhlIGFuYWx5c2lzLiBUaGVzZSBhcmUgWE1MIGZpbGVzIHBsYWNlZCBpbg0KPiB4ZW4vdG9v
bHMvY3BwY2hlY2stcGxhdC8sIGRlc2NyaWJpbmcgLi4uIChJIGRvbid0IGtub3cgd2hhdCB0byBw
dXQgaGVyZSkuDQo+IA0KPiBQbGVhc2Ugd3JpdGUgdGhlIGRlc2NyaXB0aW9uIGhlcmUgc3VjaCB0
aGF0IHBlb3BsZSBub3QgZmFtaWxpYXIgd2l0aA0KPiBjcHBjaGVjayAob3IgbW9yZSBnZW5lcmFs
bHkgd2l0aCBhbnkgZXh0ZXJuYWwgdG9vbCkgY2FuIHN0aWxsIGZvbGxvdw0KPiB3aGF0IHlvdSdy
ZSB0YWxraW5nIGFib3V0IGFuZCB3aGF0IHRoZSBwYXRjaCBpcyBkb2luZy4NCg0KT2sgSSBjYW4g
bW9kaWZ5IHRoZSBkZXNjcmlwdGlvbiB0byBhZGQgbW9yZSBkZXRhaWxzDQoNCj4gDQo+Pj4+IC0t
LSAvZGV2L251bGwNCj4+Pj4gKysrIGIveGVuL3NjcmlwdHMveGVuX2FuYWx5c2lzL2NwcGNoZWNr
X2FuYWx5c2lzLnB5DQo+Pj4+IEBAIC0wLDAgKzEsMjcyIEBADQo+Pj4+ICsjIS91c3IvYmluL2Vu
diBweXRob24zDQo+Pj4+ICsNCj4+Pj4gK2ltcG9ydCBvcywgcmUsIHNodXRpbA0KPj4+PiArZnJv
bSAuIGltcG9ydCBzZXR0aW5ncywgdXRpbHMsIGNwcGNoZWNrX3JlcG9ydF91dGlscw0KPj4+PiAr
DQo+Pj4+ICtjbGFzcyBHZXRNYWtlVmFyc1BoYXNlRXJyb3IoRXhjZXB0aW9uKToNCj4+Pj4gKyAg
ICBwYXNzDQo+Pj4+ICsNCj4+Pj4gK2NsYXNzIENwcGNoZWNrRGVwc1BoYXNlRXJyb3IoRXhjZXB0
aW9uKToNCj4+Pj4gKyAgICBwYXNzDQo+Pj4+ICsNCj4+Pj4gK2NsYXNzIENwcGNoZWNrUmVwb3J0
UGhhc2VFcnJvcihFeGNlcHRpb24pOg0KPj4+PiArICAgIHBhc3MNCj4+Pj4gKw0KPj4+PiArQ1BQ
Q0hFQ0tfQlVJTERfRElSID0gImJ1aWxkLWRpci1jcHBjaGVjayINCj4+Pj4gK0NQUENIRUNLX0hU
TUxSRVBPUlRfT1VURElSID0gImNwcGNoZWNrLWh0bWxyZXBvcnQiDQo+Pj4+ICtDUFBDSEVDS19S
RVBPUlRfT1VURElSID0gImNwcGNoZWNrLXJlcG9ydCINCj4+Pj4gK2NwcGNoZWNrX2V4dHJhX21h
a2VfYXJncyA9ICIiDQo+Pj4+ICt4ZW5fY2MgPSAiIg0KPj4+PiArDQo+Pj4+ICtkZWYgZ2V0X21h
a2VfdmFycygpOg0KPj4+PiArICAgIGdsb2JhbCB4ZW5fY2MNCj4+Pj4gKyAgICBpbnZva2VfbWFr
ZSA9IHV0aWxzLmludm9rZV9jb21tYW5kKA0KPj4+PiArICAgICAgICAgICAgIm1ha2UgLUMge30g
e30gZXhwb3J0LXZhcmlhYmxlLUNDIg0KPj4+PiArICAgICAgICAgICAgICAgIC5mb3JtYXQoc2V0
dGluZ3MueGVuX2Rpciwgc2V0dGluZ3MubWFrZV9mb3J3YXJkX2FyZ3MpLA0KPj4+PiArICAgICAg
ICAgICAgVHJ1ZSwgR2V0TWFrZVZhcnNQaGFzZUVycm9yLA0KPj4+PiArICAgICAgICAgICAgIkVy
cm9yIG9jY3VyZWQgcmV0cmlldmluZyBtYWtlIHZhcnM6XG57fSINCj4+Pj4gKyAgICAgICAgKQ0K
Pj4+PiArDQo+Pj4+ICsgICAgY2NfdmFyX3JlZ2V4ID0gcmUuc2VhcmNoKCdeQ0M9KC4qKSQnLCBp
bnZva2VfbWFrZSwgZmxhZ3M9cmUuTSkNCj4+Pj4gKyAgICBpZiBjY192YXJfcmVnZXg6DQo+Pj4+
ICsgICAgICAgIHhlbl9jYyA9IGNjX3Zhcl9yZWdleC5ncm91cCgxKQ0KPj4+PiArDQo+Pj4+ICsg
ICAgaWYgeGVuX2NjID09ICIiOg0KPj4+PiArICAgICAgICByYWlzZSBHZXRNYWtlVmFyc1BoYXNl
RXJyb3IoIkNDIHZhcmlhYmxlIG5vdCBmb3VuZCBpbiBYZW4gbWFrZSBvdXRwdXQiKQ0KPj4+IA0K
Pj4+IFdoYXQgdXNlIGlzIENDIHdpdGhvdXQgQ0ZMQUdTPyBPbmNlIGFnYWluIHRoZSBkZXNjcmlw
dGlvbiBjb3VsZCBkbw0KPj4+IHdpdGggY29udGFpbmluZyBzb21lIGluZm9ybWF0aW9uIG9uIHdo
YXQncyBnb2luZyBvbiBoZXJlLCBhbmQgd2h5DQo+Pj4geW91IG5lZWQgdG8gZXhwb3J0IGFueSB2
YXJpYWJsZXMgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPj4gDQo+PiBXZSBkb27igJl0IG5lZWQgQ0ZM
QUdTIGhlcmUsIHdlIG5lZWQgb25seSBDQyB0byBnZW5lcmF0ZSBpbmNsdWRlL2dlbmVyYXRlZC9j
b21waWxlci1kZWYuaCBhbmQNCj4+IHRvIHBhc3MgQ0MgdG8gdGhlIGNwcGNoZWNrLWNjLnNoIC0t
Y29tcGlsZXIgYXJndW1lbnQuDQo+IA0KPiBIbW0sIEkgc2VlIHRoYXQgaW5jbHVkZS9nZW5lcmF0
ZWQvY29tcGlsZXItZGVmLmggaXMgZ2VuZXJhdGVkIGFscmVhZHkNCj4gbm93IHdpdGhvdXQgYW55
IHVzZSBvZiBDRkxBR1MuIFdoaWNoIGxvb2tzIHN1c3BpY2lvdXMgdG8gbWUuIFNhZGx5DQo+IHRo
ZSB1c2VzIGluIHhlbi9NYWtlZmlsZSBhcmUgbGFja2luZyBhbnkgZGV0YWlscyBvbiB3aGF0IHRo
aXMgaXMgZm9yLA0KPiBhbmQgQmVydHJhbmQncyBjb21taXQgaW50cm9kdWNpbmcgaXQgZG9lc24n
dCBleHBsYWluIGl0cyBwdXJwb3NlDQo+IGVpdGhlci4gTWF5YmUgYWdhaW4gc29tZXRoaW5nIGVu
dGlyZWx5IG9idmlvdXMgdG8gcGVvcGxlIGtub3dpbmcNCj4gY3BwY2hlY2sgc3VmZmljaWVudGx5
IHdlbGwgLi4uDQo+IA0KPj4gV291bGQgYSBjb21tZW50IGluIHRoZSBjb2RlIGJlIG9rPw0KPiAN
Cj4gTm90IHN1cmUgKHlldCkuDQo+IA0KPiBKYW4NCg0K

