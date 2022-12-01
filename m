Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD4963FC11
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 00:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451300.708985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0t1u-0007Wy-BX; Thu, 01 Dec 2022 23:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451300.708985; Thu, 01 Dec 2022 23:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0t1u-0007V7-8M; Thu, 01 Dec 2022 23:31:46 +0000
Received: by outflank-mailman (input) for mailman id 451300;
 Thu, 01 Dec 2022 23:31:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPp1=37=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p0t1s-0007V1-5g
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 23:31:44 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe12::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ddb2646-71d0-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 00:31:40 +0100 (CET)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB8620.eurprd08.prod.outlook.com (2603:10a6:150:84::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 23:31:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5880.010; Thu, 1 Dec 2022
 23:31:36 +0000
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
X-Inumbo-ID: 4ddb2646-71d0-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXH0ihK8JHB1aA2ozCxAxanuaLXC33lFVKVQQW3hy2S2TrpF/sq4QNmfb3rSISokSlMeA5KHtO8u5TiV7Sg8OeiYlcAjUvQsPmV5j8Gubc3Qz6lpFBmX9kHz+M3KtbprvTV6i2xjRxHnlvp7NfProHYVA3qR2h2pO8MQew4LpnvUK6VyN+fnAvYCj5HCExjeemQeLL+3hM92dwu2a/fXLIfkaAUiFErAOXKoSljh0rulGyDcMRElFH6eWwJqOJgGlvyk33OSiCWISionFMY9UdLMNirD4vbEnKtgD/oOwffYEXZyquwPxziHlzXxDUrQxjPTCRguIhH9BZAcZuVAcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnZNryFeysFsqnFksvsUQwhvWeWjJ2FUMVzBH9Ncc6s=;
 b=OX5S3OhqJYntJQni/XVjfTxjePHPVFwQaEqKv5diQsPwFnVo23uomyoOrUlnwZL7zW9o7GWSEQ0q6f/q/Zdt+4g1i7nfnafMIiJ1wnY9iO24IoVYlO73irULLXuoWzI2tFO9lKJMXIkpy01n1hxxvQaoxa6jKj1VGkLTMR/Buv00L6Lz8rLyoYousfCxrkEni/XCwmboCfV6hxBAmasCprwua9hmSurzbFzSfSfUPzIwQKkWGu+C5svpIOoksQ3IGlGeOx3oiSFi8Ob6nzDZmLeCBC9SabaO8eINAkyXYiqj0n3AmaANTL7sPdv+UPluiY4arZCMqxBsJODxSYwluA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnZNryFeysFsqnFksvsUQwhvWeWjJ2FUMVzBH9Ncc6s=;
 b=w8z3ragAoyxZTfxlY7B0B9WdWnnzc6FhCi+gzJTLppt7DZv0fLtU4ir2Z6yiR28I/3OQEvBByp47ZKG7hROHaNKXJ4JxPvVmvoIobNIZOCkrJhgqDRgs5nok36jORdG0Z9WibClopgDk8zu9e//HbXfsLSZBL+RWmw0YRD/QH4U=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [4.17?] Re: [PATCH] x86/HVM+shim: fix build when
 !CONFIG_GRANT_TABLE
Thread-Topic: [4.17?] Re: [PATCH] x86/HVM+shim: fix build when
 !CONFIG_GRANT_TABLE
Thread-Index: AQHZBZ20FNPkaUdVSkig9Y686gPD965ZMT6AgAAA44CAAAFewIAAMiyAgABItkA=
Date: Thu, 1 Dec 2022 23:31:36 +0000
Message-ID:
 <AS8PR08MB79912AE2E083F0940AC4C24292149@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <2ea8c3de-4967-802c-9a32-79203cd41384@suse.com>
 <261da93e-9464-8e9f-6ae2-a8f8ec466def@citrix.com>
 <8b93be0a-cca6-f1f2-2902-afcf1f8915f6@suse.com>
 <AS8PR08MB7991E47CA9036E000C00E68D92149@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <a8db44d8-0cf3-790c-09a3-0dce226ec0ae@citrix.com>
In-Reply-To: <a8db44d8-0cf3-790c-09a3-0dce226ec0ae@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9312CBB5DD4F9F4DA4444A116E225581.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|GV1PR08MB8620:EE_
x-ms-office365-filtering-correlation-id: 3ff0263f-e92e-43f1-ac35-08dad3f4307c
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TfvMaGANL0X5uRw4A+ISee5/22JMuzNaPDAP8mrUQTbKtJOXKIB3Ao2hT8X86czRo44KPgU/vAAaRXufJL/40IC/z9IqzZMmD/hD8I9KcBHyuHyg/Jc8l1JlcNrege6zuXOaJUVZv7UJmwt8kSwe2/eIGkQlvyOHRsdgEySuU/6kP6ZvBShh6Uh7zNThvjHtY9G0P59v7Se+k5XALCcUtA8h8Pv5xX8OPbKTip6UretXv7bw6a5r1CX9vNrLhSSGytciZzwetTyVXIpM4bLxxLY677VpJV2obzRFtH/hlzjcmBTQA/v6ZowqhgEYlKDoqY2IdwjcC9Q7IdXxj66PpaXJ5tZ4r5URZiq+Sd+5gV1WQ4ArLUuRD3j/6w1Xd4bbs08tvNwi48ChQiFXnCOmdm2y180LiNvjfOrrBCnmtod1+gxjbSy2GH8OWSs7kra9YHb1dB4tFRwBrGKkdWxxFIJoDGP8jQE7Dl1dsVCLdi8l7q5eg5ohpvH6lGLCCDHNR3BsibGdUSdVRS5bIxkLf9E22Js6jsA1YPDEwDaPPNbveSf6VPzqyGYldwdkb58z3+DQaDwGgHdJ2SX1oXV4FTzCZB+rBCDx15fA/mhs+1b4Cn25iNzrOicCSuq4Wv0BrLBpbAkLU57wDE1SafAL/RIWtp6A8WC5q4ln2MEm+c2BiBeXWLficg3yGcfqE0S+MEB5mGms8Uan7mnptks5hg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199015)(122000001)(86362001)(38070700005)(2906002)(55016003)(478600001)(9686003)(7696005)(6506007)(71200400001)(5660300002)(66446008)(8936002)(4326008)(53546011)(66556008)(54906003)(110136005)(66946007)(66476007)(316002)(64756008)(186003)(26005)(41300700001)(8676002)(38100700002)(83380400001)(52536014)(33656002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmQ4QXNQdkw4SzdxcjBmTzVpTVZudUwvbmxvSkg4M1hubU5QMGdPczMrZG93?=
 =?utf-8?B?WWJnRU9lSUhQYnFHS3ZLSlUwdS8ybTAyMnE3NjZJaEJ0QzJsSzZqWUpDSVJK?=
 =?utf-8?B?MnFzRllMU3N4V01hMGR1V2Q4S3VLaTdqd3gySGhaelU4QXRCeGlZcjdxcmtK?=
 =?utf-8?B?b3JOR1MvWk5MYnlvL1hMQTVnWWpreDQ5RzkrWWlqSmRRelVLcmN5dUZZSHFm?=
 =?utf-8?B?R2ZzYlJWTXhwWldabm80UGRhUW9DNStsOWNGR1VMMjAxMGhJTTBtTE02MlVm?=
 =?utf-8?B?R0g0Wjc3eXYvamgvMnljemxwS3pITzlOSlRTNUp5NTNJc3liTE5POGF2Wkls?=
 =?utf-8?B?Ly9uL3NJUnRjbHI5U0pSdzJTSmpCMTF4Z2ZkK2U4QUdrVW51TTFvcFRQZk85?=
 =?utf-8?B?WGVvbFZ2R3NuNUV4U0ZaZlZzc2NVZHdIZXJ0dStoVVp4bjhXR3RjSjlsYldz?=
 =?utf-8?B?WmpsU2FFeEV1Z2xSbWpHZDFXMHp3bitLZThTTkV6aGJWK0FZU2FjQkluT2FH?=
 =?utf-8?B?Rmp6MTVmbE8rWTMwYzFDS053bTUyRzRjQ0NCNng1amczTFVvMGFLakIvOTBs?=
 =?utf-8?B?TWpHdXFPM1daSXBhbmdHMzlpcktiRWNybFozRnp5QXltLzNvK2tOUnlQbWFS?=
 =?utf-8?B?K2R1bG55MFVwYU1iSHE4T1lsdWtkTW9ZV2NSSGlCczhhMEM1Q3lwZGhyY3hi?=
 =?utf-8?B?Q0FMTCtaNEtTU21hZml2RXVoWnNhRmpHM3IxWEVBWmNWMU05T2JpS2IySVhD?=
 =?utf-8?B?VGZnOXdMenJ2Z3orazNUZVBEeFhhNXgyN3NGVjVYOUxzVVo0SkxKaUtyRUF0?=
 =?utf-8?B?akJtbnNFRVhoTnZGbktONUhxamw3S0VyLzFRaHJMVTRCRTY3bFFsd2t5UUNv?=
 =?utf-8?B?a0Z4ZWpsYWdLOFBtQnhMbHRQYmlDYzk5VENGaE1HbEVZNDFVZ0tab3duVU42?=
 =?utf-8?B?R1Z1akdwR3BMRGwrUkdyWlZDY0pZbjI5ZXJjOGNKK3YzRHZyMGh0TWZ0eE1B?=
 =?utf-8?B?dEEvMXNzNGc0RHB6WnBSTHk1UEEvK3NFSnZUKy9VSHliY3lzdFpOcUVkTEpZ?=
 =?utf-8?B?MS9hUVRaVCtya3JobUF3ZitpUU9Ta2NSTCtaakFYYWtpYUFRMzdCb01sUFE4?=
 =?utf-8?B?SExTRDR5SG5RM1lXNkhBdVU2Z0RZZnJEUmRTaGVveXZ0MUdFQ0ttOC9DUXpk?=
 =?utf-8?B?R2ZhcVE3YXIyZnMxaDQ3N2JaRVpKbVN6ZUxud0N2K1RQcG4xR05TbHB1cXph?=
 =?utf-8?B?K293cGNOai9KRG5RTHY3cUkwTzF4a09WTzBaNjM5a0hIQkMwWG4wLzh6bksx?=
 =?utf-8?B?ZEE5MUE1VzVGSmhVNkNHQ0JzbXZ5TTZ4QnNQcm1SMDJKY05reTlibFhNNDRD?=
 =?utf-8?B?OEl1VUFMYSthanh6OFFsRXZ5ZDN2Uk43RE53VWNnNVk3WExJU0F0QWN0TUp3?=
 =?utf-8?B?WkdNY3ZYZUMzTlN2U1dVSVJXaWluZmNuL2VWdTQ4eGR3M2FVdDFhTUhDNkZz?=
 =?utf-8?B?QzNXS2RqNDU0cTdjeWRqeHlPWDNkTlRsdG9NeDFlT0djcTBieW1JL2ZMb2JO?=
 =?utf-8?B?cHRiVCtneFlwaHQxSmpiLzdzTldGeU83alNScGR3VTRnR3dwZlhwMnVFN0xl?=
 =?utf-8?B?WHhJamdpQWZuSHBYdVJCbzBEZGthQkpwdDFOanloM08rZFdFZW9jOWZJMDVy?=
 =?utf-8?B?VUFtcjNrZEtkUUZ5Rko4TUVwOHBKV214NGt5ZG1BcXdNRjJPL2JJZUdOTUdr?=
 =?utf-8?B?K1ZMc3RWRkZwME1sNk5BbGFYY3hjc1BjTUZWVXE2UXdoVFlGTUEvOVVQSnJh?=
 =?utf-8?B?OUx1RGxpcyt1alBhS25RakZtRjgrcWlkNFBLbUZFRE5zak1jWW5Id0J3Z2dO?=
 =?utf-8?B?V3hrTXk0QWpDV1kwRW8xbzE4RVFKbFRKdEs0ak9iMHlNeU5peTVTdUlRTjFU?=
 =?utf-8?B?OUowYzFnUGtZNlF6NEdUZjBXTzJvR3owSnYrVUd3TDc4VHVCREg5UitCYnJs?=
 =?utf-8?B?WjgzNjM4NW1oUjR3VjljZ2RVMnR5TjZzbEVOcnlSVzFrMnUwSzBOMDA3Lyt0?=
 =?utf-8?B?Mi9jY0xjbEEzaUxtUWhGeGJCemI4TXBQQlZQSjFhNlVyYWV0bkhlZDUxcXlK?=
 =?utf-8?Q?T+78BtJ6n84o7m7JqtlerZRQd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff0263f-e92e-43f1-ac35-08dad3f4307c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 23:31:36.4991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QWF73W1XjYzAWf8v9HzWWP8y7RPbDlGtYDt3Owc9jfdxBAEWR7YoNXxNKo/k7NkrS2/Ep5BlKeQKA3hyqMxmlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8620

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbNC4x
Nz9dIFJlOiBbUEFUQ0hdIHg4Ni9IVk0rc2hpbTogZml4IGJ1aWxkDQo+IHdoZW4gIUNPTkZJR19H
UkFOVF9UQUJMRQ0KPiANCj4gT24gMDEvMTIvMjAyMiAxNjoxNCwgSGVucnkgV2FuZyB3cm90ZToN
Cj4gPj4+IFRoYW5rcyBmb3IgaW52ZXN0aWdhdGluZy4NCj4gPj4+DQo+ID4+PiBBY2tlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gPj4gVGhhbmtzLg0K
PiA+Pg0KPiA+Pj4gVGhvdWdodHMgYWJvdXQgaW5jbHVzaW9uIGludG8gNC4xNz/CoCBUaGlzIGlz
IGEgYnVpbGQgdGltZSByZWdyZXNzaW9uIHZzDQo+ID4+PiA0LjE2Lg0KPiA+PiBJIHRob3VnaHQg
dGhpcyB3YXMgb2RkIGVub3VnaCBhIGNvbmZpZ3VyYXRpb24sIGJ1dCBzaW5jZSB5b3UgYXNrLCBs
ZXQgbWUNCj4gPj4gZm9yd2FyZCB0aGUgcXVlc3Rpb24gdG8gSGVucnkuDQo+ID4gSSB0aGluayBh
IGJ1aWxkIHRpbWUgcmVncmVzc2lvbiBzaG91bGQgYmUgZml4ZWQuIFdlIGNhbm5vdCBhc3N1bWUg
dXNlcnMNCj4gPiB3aWxsIG5vdCB1c2UgdGhpcyBjb25maWd1cmF0aW9uIChhcyBKYW4gcG9pbnRl
ZCBvdXQgaW4gSVJDKS4gU28gZm9yIDQuMTc6DQo+ID4NCj4gPiBSZWxlYXNlLWFja2VkLWJ5OiBI
ZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+ID4NCj4gPiBCdXQgaWYgT1NTVGVzdCBp
cyBleHBsb2RlZCBhZnRlciBtZXJnaW5nIHRoaXMgcGF0Y2gsIEkgd291bGQgbGlrZSB0byByZXF1
ZXN0DQo+ID4gYSByZXZlcnQgc2luY2Ugd2UgZG9uJ3QgaGF2ZSB0b28gbXVjaCB0aW1lIGxlZnQg
Zm9yIHRoZSBkdWUgZGF0ZS4gSG9wZWZ1bGx5DQo+ID4gZXZlcnlvbmUgaXMgZmluZSB3aXRoIHRo
YXQuDQo+IA0KPiBJdCBpcyB2ZXJ5IHVubGlrZWx5IHRoYXQgcGVvcGxlIGFyZSBnb2luZyBoYXZl
IGEgY29uZmlndXJhdGlvbiBsaWtlIHRoaXMNCj4gaW4gcHJvZHVjdGlvbi4NCj4gDQo+IEJ1dCwg
dGhlIDQuMTcgYnJhbmNoIGRvZXMgaGF2ZSBHaXRsYWIgQ0kgcnVubmluZyBvbiBpdCwgaW5jbHVk
aW5nDQo+IHJhbmRjb25mIHRlc3RzLCB3aGljaCBwcm92YWJseSBkbyBzcG90IHRoZSBlcnJvciBv
Y2Nhc2lvbmFsbHkuDQo+IA0KPiBUaGUgKElNTyBiZXR0ZXIpIGp1c3RpZmljYXRpb24gdG8gdGFr
ZSBpdCBpbnRvIDQuMTcgYXQgdGhpcyBwb2ludCBpcyB0bw0KPiBmaXggYSBDSSBmYWlsdXJlLg0K
DQpHb29kIHBvaW50LCBteSByZWxlYXNlIGFjayBpcyBzdGlsbCB2YWxpZCA6KQ0KDQpLaW5kIHJl
Z2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiB+QW5kcmV3DQo=

