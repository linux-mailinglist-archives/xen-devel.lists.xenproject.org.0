Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B02642970
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 14:30:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453626.711215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BY4-0006TO-TT; Mon, 05 Dec 2022 13:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453626.711215; Mon, 05 Dec 2022 13:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BY4-0006Rd-QB; Mon, 05 Dec 2022 13:30:20 +0000
Received: by outflank-mailman (input) for mailman id 453626;
 Mon, 05 Dec 2022 13:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUwf=4D=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p2BY3-0006RV-Ax
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 13:30:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef5398b8-74a0-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 14:30:08 +0100 (CET)
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by PA4PR08MB5935.eurprd08.prod.outlook.com (2603:10a6:102:e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 13:30:14 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 13:30:14 +0000
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
X-Inumbo-ID: ef5398b8-74a0-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0A3naV/Di0fgDvtKpnapVUhv7rY3xoc4avJ2miSL8jB/BElfwn/3QUdRpyLVF+VI1UOcpOQFgCBtOyKCfDjoR6uCVv9nt6zkeWlitrQCSqvnlAhi0IiVo1HLgfZPuHl+3CjakmH2mGOEKkxr7CHXUpGAE3A3IzkLs+kwpJbQmSKP4Nde986VFBPAEcsHd6yDcPvHhMNiLTbDCShM1as3dgF1n6ZOZtxJDiXz7X34pQ8v6QS8a7oSCVKZdX88+sFVNJlwK+N7oevoWJEPJ496d+ElxQABp+588qstZHkhaZ1ZRbpJw4MggOjgbOCwdWbGHfsfoYJFSivq+N915+x+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GkHfrxH87sZ8/4b9usxtSJvpBKlyLSdkPXYRxGFzjk=;
 b=mITbDU9h5XEa8mBOcrxRPKnmn9F56Rhdj3Bc4OEm+L+E8hibk2zV2OvMRd7oSji4eLwJaPWXSoIsVcN+rk6e4xQkBEnaru1F013hdLd58kyx7mERMIaPd4+D4ogHztM+A8sSl2SrmgE6kA9go7Py8O26vgrHORr9l9PMsPXHOCD7m71FLEjIjzoAgDijSH/uf7Ukusir+VVkTxH6WN3wM4nZwVaB1UwoOmILmB7XMfZGXejGR1hZ7N0un8xaSvLcJBjUul9o3BG+UO60Nct6hdqbZVibT5gKKqy5TAuXuI7gr6cDhr36YLCi0Co+HFQ0ZOSegjZdcgQT1OS8lTw8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GkHfrxH87sZ8/4b9usxtSJvpBKlyLSdkPXYRxGFzjk=;
 b=g4ROklrgA2Ytja28ADNaPNFM/cwCnmmGA3m41L+TOK/uGRygB92cmzUGgutORJQa1zLaW1bzzcuyJXmi0y4SiVQtEdiDR2PX7mQYhZSmh+cWW5ZJf7qdFknG+vpWYE1M9w/+x+8WBRp2xko+ZEj3XrH+SvvopGdO8m0rUcb7uho=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Topic: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Index: AQHZBZ7dBYCbekoSiE+Vqn2CZKLLUK5aR8+AgAUIUAA=
Date: Mon, 5 Dec 2022 13:30:14 +0000
Message-ID: <885D6D8F-2424-4105-9684-18A89CDB180A@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <505b4566579b65afa0696c3a8772416a4c7cf59f.1669888522.git.rahul.singh@arm.com>
 <f9a8045d-c31b-7958-b325-0ee223fe723d@suse.com>
In-Reply-To: <f9a8045d-c31b-7958-b325-0ee223fe723d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7158:EE_|PA4PR08MB5935:EE_
x-ms-office365-filtering-correlation-id: 447f456b-262f-49e3-db30-08dad6c4d77d
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 l/9qRCxuUpW8T3qb5ZHZMFROMqQTk8R9ZcqoLfa1wluubF4ceBXsN2If7gdGJ494oQxksdQ6iJSnyVO2FUod5MBDGobXGmqNY5Xz1uhRPh3sP6RU+oWStaW51Uo7zjZ/pr8xC50e46RuZd2Nzk0n4i/+bbigfP2UikJuZoHm120AwJKDdmmDygOf7DAL6rfzNGdRezhbDUTWWwtMEeSneAODb0RV4LIvWEZgm83JFV7jlQmYskT15Cl4yDgGFdPVb88znxRZwSsE7CVQcqhWJpQ8W0MkU/kICiTtYEo+okOGf/As8XXJWP0wb9WiJNLJJuGfiVUuhRG9KA5zdV157RcRpmG2EjkU7zQPMbto1kPnlU0oTtW/ShpoxUIdrvnCH0cQWmErE20ji31S6udadrYIHo7wzRu4WHlvzAtn7a+sGSNA/ekwsK/WrcO9WzRlOxyYH/mlK64cFmqwugB4nLxoZAaq2H04rusR4EsuZsDP025esNls10IfhqHFMsg7OqPGwggXT8QjJ++VfC2hGyU79TzJIVeA6acz3RXp9UUJjUjK++xFO7gbjkkGm9wWfBybbce1B5QejzJtiAEDBHQswkI0Eb8b5nRD1TYTYf5hALcfnTlQxFzVxfuI2x92+SKQYjvW8D2casH0Gx4mo9JKRH1N9PCXLrZcHbpwM96gbdzLrMIfzFtBi63ogJ2g4Ejyr/mKKjCViP9xTfLZ7p5IzyIo7GS5ON4PnunThCfJRNhb+pkapSEkRHcn2ue+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(396003)(39850400004)(451199015)(36756003)(6486002)(66556008)(66476007)(186003)(2616005)(64756008)(66446008)(8676002)(66946007)(91956017)(76116006)(41300700001)(33656002)(4326008)(316002)(38070700005)(38100700002)(8936002)(54906003)(6916009)(122000001)(2906002)(5660300002)(6512007)(6506007)(26005)(53546011)(86362001)(478600001)(71200400001)(41533002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TjRtWlpFbE15NTZ0SDhCYUg4eXY0NzZKclJGMlpJMUtReUdoYmhUQVRib2Zo?=
 =?utf-8?B?NEEwZFN1bDZDN1FaR1orTWJ5amc2eEc0WThuMjl1OXlIeHRxcnh0WVorckFl?=
 =?utf-8?B?Q3d3Um1KaXpUUksrTVZMd0pOV1RIVCtaZmNKcVhGKzkwOE5hR1VUekszbkdJ?=
 =?utf-8?B?cnJ3ZS9zeHo5VUhORFl0YTkyL0RFdVczRmgwQzVjU2hVbDZ1T0EvWTNhMzds?=
 =?utf-8?B?aUJTZnEyVnI5WWFtQTY0U2t4bmtUSXVTWnZTTUxNMTY2QldLb0MzbXNQZlZK?=
 =?utf-8?B?c2F2R1h0V1VFN0lsd1pITjdBS0UzeGRVMmIrSEQvRUhmb28zR2FyaTM1T1Az?=
 =?utf-8?B?VmVnVUtkRkFHWXQzTTluNkc3dFFoL1R1WkoyRUpibmpmcFI3T25PSnRodmtX?=
 =?utf-8?B?S2VkL295d0hveFQ0U3p2TmVmSXh1UXZiRGl4LzZKMmhiZEJabzBzem5qTjdD?=
 =?utf-8?B?cjFpQldWcEJTa1pMRWQ2V3luUmpiUXg1SG9KQUdlSzNaNUY3eU9INjg4NERP?=
 =?utf-8?B?SW93a3ltRXozZFF5ZVVMdXo2d0RYbE1ZSFV0ckJENmJ1aXJCVlBEVGRacVdG?=
 =?utf-8?B?M2Z5WlBDWGpnYkpsZlpmbkltdVA1TVlUNmc3WXdxeVJDL05WcmJjZnNjU1N5?=
 =?utf-8?B?Si9wcFZpVWVmem9rdEZaNDZmVFJ2ZVJCMkl4cmVhL3FSUlA0VzVSaGxxTUNS?=
 =?utf-8?B?c2tWcjNCY2FHYWJRKzhuT3hUVCtVQkYzaSt0K013U3JiQUxRVWJ4Q3ZGR0pJ?=
 =?utf-8?B?VEowdXVLUlhSODFpRE9Jb3ZwcThBS0hLRjFQZ3VjbEZNQW9VOE5yeFNtaG1M?=
 =?utf-8?B?MEFiTUpUQkFvMWs1UmpNLzdXdlA4eHJPQ2h6T281RmtTczNtbjBaeHpIZlF5?=
 =?utf-8?B?VTlwNTR3dW1SUXVkNi95TkFLZUxxbk1CaGRZTW11Qnd0L1Z4ZEkyaXpRdEVw?=
 =?utf-8?B?dEczditMZGQwYlhGeGx5eVNBRFdJSUFmcytNaXNGbHBmVlNPTFNpL3FiWDhJ?=
 =?utf-8?B?bkk2L0VUWFFNUmptMThpODA4OVRIbzR2Z1pIYURNV01lVFV2RnI3ZTh0d3Q3?=
 =?utf-8?B?REUzaTFSQkY4cmQ4cU5Ya2NpeVZ2ZVhWZ1E0dmRyYkJNY2RiZlZBeWVxc3dB?=
 =?utf-8?B?OVhaVmlrRUJUK3N6WUNlditicHhiVDd3NHVWUlFCMTc0VEMyZlh6L1pUNDBE?=
 =?utf-8?B?UWJxMUk5YUxWZW9WOUdWL0xINy9RNHFIUHRoUk91QnFiRjI4c3RiSTFmQmFu?=
 =?utf-8?B?MmZnNHlkZEZLN0draFE1b2U2dGZRcVN0VkRzV21WUmpMTTZRby9sMXBDYUpT?=
 =?utf-8?B?eEdaRHU0cFM1Y0VEa2tFLzNsdHR5MzQ4SHVIRC84RGQvWTRCdW9xakNBV2tt?=
 =?utf-8?B?blgzdmdwZDJHOU5oWHRVY0kwb0t3VlB5ZUtEdzBrVTZ6cGkvS1c0Rk1hOTFC?=
 =?utf-8?B?dVpkczRjVVZTbWFRck5ZNGdTSUFQZC9iT2dWNFlybm1tUHJDRzVUbTlKLzNz?=
 =?utf-8?B?ZGkwZW9XdjFKY0ZXR0NsSW5YREpOUmwvMDJFdzdWTERoc21MTVlRN0tGVk1I?=
 =?utf-8?B?NGhXWFdJbkZUWDFmSkxQaXcrWitEUkUyU3FaeFI5NEFVU3pnS0craHdLOXpT?=
 =?utf-8?B?Q0pFUHhZMGhxNGJJbG1mdUVYWlZNcy8xUWc0U01VU1NTQVM4TmliN3FWWDht?=
 =?utf-8?B?RFVIbVJWaGtFV3RyWUlkVTMvQUlhcERkdU96RmhLS3ZSV1dhRFVCelFEVnpS?=
 =?utf-8?B?UjllUmVXYlo1Q3dvendBQlRseWpmQ2RUcGEyNGxodS9vQmF5TmVuUnhGTVBj?=
 =?utf-8?B?TVF5SGxmdHRRQWEvdWRjVWxWbW5CeGhQclBJeExIRmU4MHE4WFo5ZWpqalRs?=
 =?utf-8?B?bFc1Y0pRMkdKWHFBbXJTS0lvSEtJNHJ1TE16anJZcFRXVFhrT0VncWJ6VlR0?=
 =?utf-8?B?c093RTE5Z3FXeXFVNEFCQ1I2cnRON3NFNExlcWd5NldBd3JEWkZETldCQ1pm?=
 =?utf-8?B?TTR3aUM3TWlIS1NwQXdJWGJGdSs1VjA2Y0Y2QmViN2xUckZ0VUYvalV3TE5z?=
 =?utf-8?B?Q0wrQ2RsbThLOGxTb2pCcXNpeENXdEhvZ20vckZiZVhadjQzODB2MjRvYW43?=
 =?utf-8?Q?L+gS7IfIpkrbaVxR7+D2vmir7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56F5E27934F7D048815FF5CA6680A215@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7158.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447f456b-262f-49e3-db30-08dad6c4d77d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 13:30:14.3317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: byiKbEJf1P4w7isCffwAsBz1rb3x2Yh88VktHuXbPwf9ICPIUbMluNF6pqA6N0cdVzBWk35dTN5hjfT0OHppiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5935

SGkgSmFuLA0KDQo+IE9uIDIgRGVjIDIwMjIsIGF0IDg6MzkgYW0sIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMS4xMi4yMDIyIDE3OjAyLCBSYWh1bCBT
aW5naCB3cm90ZToNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcNCj4+
ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcNCj4+IEBAIC0zNSw2ICszNSwx
MiBAQCBjb25maWcgSVBNTVVfVk1TQQ0KPj4gIChIMyBFUzMuMCwgTTMtVyssIGV0Yykgb3IgR2Vu
NCBTb0NzIHdoaWNoIElQTU1VIGhhcmR3YXJlIHN1cHBvcnRzIHN0YWdlIDINCj4+ICB0cmFuc2xh
dGlvbiB0YWJsZSBmb3JtYXQgYW5kIGlzIGFibGUgdG8gdXNlIENQVSdzIFAyTSB0YWJsZSBhcyBp
cy4NCj4+IA0KPj4gK2NvbmZpZyBWSVJUVUFMX0lPTU1VDQo+PiArIGJvb2wgIlZpcnR1YWwgSU9N
TVUgU3VwcG9ydCAoVU5TVVBQT1JURUQpIiBpZiBVTlNVUFBPUlRFRA0KPj4gKyBkZWZhdWx0IG4N
Cj4+ICsgaGVscA0KPj4gKyBTdXBwb3J0IHZpcnR1YWwgSU9NTVUgaW5mcmFzdHJ1Y3R1cmUgdG8g
aW1wbGVtZW50IHZJT01NVS4NCj4gDQo+IEkgc2ltcGx5ICJ2aXJ0dWFsIiBzcGVjaWZpYyBlbm91
Z2ggaW4gdGhlIG5hbWU/IFNlZWluZyB0aGF0IHRoZXJlIGFyZQ0KPiBtdWx0aXBsZSBJT01NVSBm
bGF2b3JzIGZvciBBcm0sIGFuZCBqdWRnaW5nIGZyb20gdGhlIHRpdGxlcyBvZiBzdWJzZXF1ZW50
DQo+IHBhdGNoZXMsIHlvdSdyZSBpbXBsZW1lbnRpbmcgYSB2aXJ0dWFsaXplZCBmb3JtIG9mIG9u
bHkgb25lIHZhcmlhbnQuDQoNCkkgYWdyZWUgd2l0aCB5b3UgSSB3aWxsIHJlbW92ZSB0aGUgdmly
dHVhbCBpbiBuZXh0IHZlcnNpb24uDQo+IA0KPiBBbHNvLCBuaXQ6IFBsZWFzZSBvbWl0ICJkZWZh
dWx0IG4iIGhlcmUgLSBpdCBsZWFkcyB0byBhIG5lZWRsZXNzDQo+IGxpbmUgaW4gdGhlIHJlc3Vs
dGluZyAuY29uZmlnLCB3aGljaCBpbiBhZGRpdGlvbiBwcmV2ZW50cyB0aGUgcHJvbXB0DQo+IGZy
b20gYXBwZWFyaW5nIGZvciB1c2VyIHNlbGVjdGlvbiB3aGVuIHNvbWVvbmUgbGF0ZXIgZW5hYmxl
cw0KPiBVTlNVUFBPUlRFRCBpbiB0aGVpciBjb25maWcgYW5kIHRoZW4gcnVucyBlLmcuICJtYWtl
IG9sZGNvbmZpZyIuIEJ1dA0KPiBwZXJoYXBzIHlvdSBhbnl3YXkgcmVhbGx5IG1lYW4NCj4gDQo+
IGNvbmZpZyBWSVJUVUFMX0lPTU1VDQo+IGJvb2wgIlZpcnR1YWwgSU9NTVUgU3VwcG9ydCAoVU5T
VVBQT1JURUQpIg0KPiBkZXBlbmRzIG9uIFVOU1VQUE9SVEVEDQo+IGhlbHANCj4gIFN1cHBvcnQg
dmlydHVhbCBJT01NVSBpbmZyYXN0cnVjdHVyZSB0byBpbXBsZW1lbnQgdklPTU1VLg0KPiANCj4g
Pw0KPiANCj4gTm90ZSAobml0IGFnYWluKSB0aGUgc2xpZ2h0bHkgYWx0ZXJlZCBpbmRlbnRhdGlv
biBJJ20gYWxzbyB1c2luZyBpbg0KPiB0aGUgYWx0ZXJuYXRpdmUgc3VnZ2VzdGlvbi4NCj4gDQoN
Ckkgd2lsbCBtb2RpZnkgYXMgYmVsb3c6DQoNCiBjb25maWcgVklSVFVBTF9JT01NVQ0KICAgICAg
ICBib29sICJWaXJ0dWFsIElPTU1VIFN1cHBvcnQgKFVOU1VQUE9SVEVEKeKAnQ0KICAgICAgICBk
ZXBlbmRzIG9uIFVOU1VQUE9SVEVEDQogICAgICAgIGhlbHANCiAgICAgICAgICBTdXBwb3J0IElP
TU1VIGluZnJhc3RydWN0dXJlIHRvIGltcGxlbWVudCBkaWZmZXJlbnQgdmFyaWFudHMgb2Ygdmly
dHVhbA0KICAgICAgICAgIElPTU1Vcy4NCg0KUmVnYXJkcywNClJhaHVsDQoNCg==

