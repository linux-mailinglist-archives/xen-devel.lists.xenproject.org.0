Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895B763F520
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:20:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451049.708662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mIR-0006yH-Mf; Thu, 01 Dec 2022 16:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451049.708662; Thu, 01 Dec 2022 16:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mIR-0006vW-Js; Thu, 01 Dec 2022 16:20:23 +0000
Received: by outflank-mailman (input) for mailman id 451049;
 Thu, 01 Dec 2022 16:20:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPp1=37=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p0mCa-00075z-5P
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:14:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 356749ca-7193-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:14:19 +0100 (CET)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6314.eurprd08.prod.outlook.com (2603:10a6:10:20f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 16:14:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 16:14:12 +0000
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
X-Inumbo-ID: 356749ca-7193-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWyQnp6MVJ8MsBVTt4iRN3fx2i5TOaUJBwJbfTFSTyBa/Rf9FMUK+Zt6HslnUo/uXEIjR3H8jRR81lrjssG0NSWTqq0+GQk/KcQ4k0vG1LTUXIwnXV2cFVJCX0hMTFkGnLbuur9lqK5p61PST9vQijcBqDahCyUJrD1QrrGf6/4Z6y9k8NAf91DLtt5BQlmTgPrpsnJ+g2hxehqvNjXSWQ3vJppdqn79BvbVsfqkvElfBCXoU/a6Ek2whkwKM9YvhQ5zsNAIL+xZh/MeF9EG/JjYkmrxE/jYesUM4RYYvs8hoO4X62nd/G+rhmAd6rW3aANQlv/dcmbBxKskOwCRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFJM/T03TxyNEVVjKFFZOrrgzK6ufYoHZTBMSCT/bGQ=;
 b=edBnovFjeR5QqHMPKZK9mNebXJI+qr8PNanjUMMtuBwuOKXvgxN0/jg2AlMHzjDQzrmxCq9/fsaSKW2seWYQdYMoWW32I52xWuOuhorHkXide3OraG8YCs+TvPqitRMTWq7oDhmr+ez+4F9t9LNMa20DGrkhN01xp7JiaMTxC/6/9xX0B3Oi63XTAXFD4oKqcekSwjSpeFRyUU9MX3xiW4s6zM1SxF6PGx4UvREuYHXXaBVXDfB0n5k3gbHV7AxWK37buE0oPhcHErLopaqjxT1Q7QmPapDHC9AZc8kVMqYxWb+kIhqCwkqf5NdI5wP/1nnffF+10KpEWz+O+D8Sww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFJM/T03TxyNEVVjKFFZOrrgzK6ufYoHZTBMSCT/bGQ=;
 b=xfdU/8lRYJrKOtoU6QccJBNAe4IlTM5fGDYV/nfInylbm1svs/BJtelA1QNmCNiu+J1QgcIPQfo04bJJko6uk3S3/78Qm8D5V89DKZbDhPTGQftJb2k7iGgbqxsLofKHvkjCUcSXuR1i/d8a8smRUs6tSgDie2SwIVvuDkvDpIQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [4.17?] Re: [PATCH] x86/HVM+shim: fix build when
 !CONFIG_GRANT_TABLE
Thread-Topic: [4.17?] Re: [PATCH] x86/HVM+shim: fix build when
 !CONFIG_GRANT_TABLE
Thread-Index: AQHZBZ20FNPkaUdVSkig9Y686gPD965ZMT6AgAAA44CAAAFewA==
Date: Thu, 1 Dec 2022 16:14:11 +0000
Message-ID:
 <AS8PR08MB7991E47CA9036E000C00E68D92149@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <2ea8c3de-4967-802c-9a32-79203cd41384@suse.com>
 <261da93e-9464-8e9f-6ae2-a8f8ec466def@citrix.com>
 <8b93be0a-cca6-f1f2-2902-afcf1f8915f6@suse.com>
In-Reply-To: <8b93be0a-cca6-f1f2-2902-afcf1f8915f6@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7DFAAD9B12E8E34FAC3144D726DE804D.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|DBBPR08MB6314:EE_
x-ms-office365-filtering-correlation-id: e1501969-d175-4056-efea-08dad3b7158c
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wA+gXOqzdIwj8yURe5r9R8/z91Fh2BjUcy+4rHCyaQtiUzNeLcyqbZN2+qrQ0KEYcxc/RJUdRnjeTlDMtSZuj2h/DIypenlN7SKSfZsSza0Iv/VwOeKjgqv0sOAlPn01odhT69JwBYOlxU2lxMjEiIsXXxZaVJdOdM6gsELYv4QvxYwzOmBGYR9Tyc0g0Dg3kR/sY/bRleKsgGwYk9H8ehCEto5iECjlaexvI+9VOFJQ0QMB5wyiCvweT9rbUg93leuPj8quP2l3TVuT/zcdNPCd3QvT+bnqrykwHlpnDLCTSXWuMZjklBIRHpZXtRTz3VO45vR5lfl/w1Cw5YbZPN30G0cw9pLq1Zd2y0ymjqNFmESJtfdUPf4F9qBDqL/Em6UPOas8/FBAKBVr0Vrw902Mb+Bde8IVYmzl+qZd+hMZx1jpFlMyJpAj6/F2cye3aaxwFIu9eyPH06rVb1MgwgC3+JNN9Jxdml6MnoRBllB0Sm+6xi0APY43WF7izkpC9ehBA63XQCp7vusy17J4PhtN6RWR7sJ7AhG7NY0hXxW0s5X5WVC+cwqSKKiYVc662fnlQKR0mFh/JHPd/zueRlu3pgXHLKMT/bF16QxKwmp+RU2QA4PbknejQss+9fnLP2o2SJ/cwiuqhy0tYGuqanuWraNW7kuKulm6+sjRUFpE+JjevNYq6ZtrfYKjI1QmDdu7oqm4ZNxoS9UIWxi6YA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199015)(54906003)(110136005)(316002)(52536014)(38100700002)(38070700005)(122000001)(478600001)(71200400001)(76116006)(4326008)(41300700001)(33656002)(55016003)(5660300002)(66476007)(66556008)(186003)(64756008)(8936002)(8676002)(66946007)(66446008)(86362001)(53546011)(2906002)(83380400001)(7696005)(6506007)(26005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1NJcGhXd3lJN2dsbXRYRWdBSUVxZFJJKzZPMk5iUWxNenoya2w0dFNZSy9Q?=
 =?utf-8?B?M2NIczA2VUtTN1BRZHdiUjB1VjVWK2kyRnZBRG55TWtsWm5aR2FJa05sYjlY?=
 =?utf-8?B?SmdvWHo1UGplbTk3cFdyeHAycTRUZ3k3R0RtUXZKcThMQ2pRcWYvL3RNaHRE?=
 =?utf-8?B?N20zYS8rUGFBeFc2UjVITVlYZTYvSFA5Ym02THFXYU1ISHh4NDVZSWgzVk9u?=
 =?utf-8?B?by9PNkhFUDRFR3VjbWRDaThUTnBKRmIvRDRLTFVXSTFha1M2YTk5cmxHQnI4?=
 =?utf-8?B?aThRcVA5QXhSMDlueTBtWnBsaHloTjdkR1NVaWFkZ0lYSi8wdkFsMTFHVGo1?=
 =?utf-8?B?M29lT1FzWDBjSUpKVldPdzNnNy9KMEVlWHE1R3lqdDRSOHNaSXRYS1ZmSmFU?=
 =?utf-8?B?bTVhczdqZ2Vvc0tkVFd5S2NHSnhvaFFXWGxEU1Z2Y1V6L1dvaFhjZkZETXU1?=
 =?utf-8?B?TVNRTDEvZWViR0VRdm0zeFYwVGtydkVtbzFDamNySXJmOHpTRjZ5dEtNTXRU?=
 =?utf-8?B?cUR1dFlJenF6V2hiMHRqNlF6c0w3Vi9lMGFldlB0bDlhSmI4dWRQWExaQm5O?=
 =?utf-8?B?Z1hLTzh2RDZIQVZReTZoOXExUDNDbnpaNlRKcDlsSHgyc0JocFhKOTduRHJj?=
 =?utf-8?B?TnZjaXlYUGFoK3pzazBYZjhxd2JqdFc4MFpqQ3poVkt0V1I4czBHUmhWWlBh?=
 =?utf-8?B?NFdSM2lNc2JReEVYZW81UE9rM2RpUHZnaU5VdUN6Y08xYWdQMVNac3NxWUtx?=
 =?utf-8?B?ZkhqeVBIY2tjNGV5R0tSbFVBbWNOdDJ0dEc1RVpud1NMd3V2Vjd3L0xzdnNL?=
 =?utf-8?B?NHl0WTZZSlBCcnhrdG81a3pVNy9FV3I5T3gyM293ZnM0TnVrdnpDWHBPdjZE?=
 =?utf-8?B?a3daOFhCUXRHMzNsZVdmRmZPUHRpMERRNDFzRmlnMzlYTEpESlRQazhnWXZD?=
 =?utf-8?B?YTJXS2JIZ1NtM1JNcStuYnhTYXFtbXVmbXpEOG9vOXBVcHZEbVY0Qk5iUmo3?=
 =?utf-8?B?RFpxKzdvMGtpUXFjUVVjNzlnK1ZFNm01S0d4NlpjYVJRck5NNkYxaTAycStv?=
 =?utf-8?B?ZHZIMjVveTlpdlRKTHBnNXRubWg1NFkzQVV0d1dKYUR5alIzQnZKS0cwQmlr?=
 =?utf-8?B?cnYxSlVqYUxSanhGYTR0VnEzQ0xJeWhLVnlrYkxIbklxMGxOZ2UyblFJVUNH?=
 =?utf-8?B?cVpoakxYZFpWK0VHbXk3ZTBkQzFQVERNR3YrdFp3ajZ4ditRdm43bTQ2b2h4?=
 =?utf-8?B?aUpMUmlqZG1IdXgzM0dwOSs4bDFTQk1ackh6N21KbkFoemdaOFU4cGNpU2FN?=
 =?utf-8?B?Wjk3TlYwcW9LREdNUnoxVWFKMlE2OU5BVlduWVpkU0J1OXluRXYrZHFQcE9i?=
 =?utf-8?B?NEZlUFc4NWs1bk83LytkVGF3YmxqZFJ3VzlFNHVDTTlHR0RVdi95bGU4V2s1?=
 =?utf-8?B?azFrZUFueTlJNHhtODh3ajJNOThiUUovNHg2OEIvb1BlUmZlVk5tRjI4MXdP?=
 =?utf-8?B?M1llekRDN2g4NWdhWmJtOWtxYmVMWnNycTRhb2dhOXZzdzJsVnN5QW4xUTFK?=
 =?utf-8?B?TDNBME5wMGs3OUhJa0w4aWJrSW9yNVRhS05XN0VqTDdtQnZRa2xueWFMdXFy?=
 =?utf-8?B?U1ZQUWltWGFZWkJadzJ4RUZKazc3ZVM0SFJRallDM25jaHJYRzVKald4QU9U?=
 =?utf-8?B?ZVh1Y1V2YVNRaDFqM0xqUWZnMk1RZllNVS9zWlZLYTMwS0RUTG1CQmlka3g3?=
 =?utf-8?B?ZzhFZ3JLS2tOd3RkNnptUTdFMEVORCtRRDRUQzk2bnp1bTdSMkwzMXZmLzZO?=
 =?utf-8?B?SXpKS0xRdnRwdEtIK0t6U3hMdU9oc09ZSmRaRG0yMHRmUTBLa1N1Wk1uMUU2?=
 =?utf-8?B?cFFtMzkvR1lrVDBtNVFhYjNZTldBVzRnRFJIMzRGT2JHcTZteHBndk82cDRZ?=
 =?utf-8?B?Yi9ET1dBcjZOazV4dVFzc0I1WVVnTGppN2plQUhkdmh4TFcwVHJaWEh3alp1?=
 =?utf-8?B?N1FvaHlXMWk3cFBYbHU0bmg3YjdITU91OGhPU0xxejJObEgxelBKZE45bGJZ?=
 =?utf-8?B?Vy94N0dXcmp4ZjdQbVVmVHF0WGx5eE1lR080TWw4RWdzNktGWjJvZ2djR3Zy?=
 =?utf-8?Q?YCap3lJgZmmjFbCS4zzQk62B5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1501969-d175-4056-efea-08dad3b7158c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 16:14:12.0224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uBUvW/XI3f9OVf+jV3U7ZQVdqH8iMTSuasNbZ+hk9WIsHiq4ZBPlWGICLcEyYuGRnDtulPzlxWihQXu+i+tOEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6314

SGkgSmFuIGFuZCBBbmRyZXcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTdWJqZWN0OiBbNC4xNz9dIFJl
OiBbUEFUQ0hdIHg4Ni9IVk0rc2hpbTogZml4IGJ1aWxkDQo+IHdoZW4gIUNPTkZJR19HUkFOVF9U
QUJMRQ0KPiANCj4gT24gMDEuMTIuMjAyMiAxNzowMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4g
PiBPbiAwMS8xMi8yMDIyIDE1OjU3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4gVGhlIEhWTSBm
bGF2b3Igb2YgdGhlIGh5cGVyY2FsbCBoYW5kbGVycyBleGlzdHMgb25seSB3aGVuIEdSQU5UX1RB
QkxFDQo+IGlzDQo+ID4+IGVuYWJsZWQsIHdoaWxlIHN1cnJvZ2F0ZSBzaGltIHZhcmlhbnRzIGV4
aXN0IG9ubHkgZm9yIHRoZSBwdXJwb3NlIG9mIFBWLg0KPiA+PiAoQWxzbyBzY3JhdGNoIG91dCB0
aGUgQXJtIHZhcmlhbnQgaW4gdGhhdCBjYXNlOyB3aGF0IGV4YWN0bHkgaXMgdXNlZCBpbg0KPiA+
PiB0aGF0IGNlbGwgb2YgdGhlIG5ldyB0YWJsZSByb3cgZG9lc24ndCByZWFsbHkgbWF0dGVyLikN
Cj4gPj4NCj4gPj4gRml4ZXM6IDg1MjM4NTFkYmM0OSAoInhlbi94ODY6IGNhbGwgaHlwZXJjYWxs
IGhhbmRsZXJzIHZpYSBnZW5lcmF0ZWQNCj4gbWFjcm8iKQ0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFJlcG9ydGVkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiA+DQo+ID4gVGhhbmtzIGZvciBp
bnZlc3RpZ2F0aW5nLg0KPiA+DQo+ID4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQo+IA0KPiBUaGFua3MuDQo+IA0KPiA+IFRob3VnaHRzIGFib3V0
IGluY2x1c2lvbiBpbnRvIDQuMTc/wqAgVGhpcyBpcyBhIGJ1aWxkIHRpbWUgcmVncmVzc2lvbiB2
cw0KPiA+IDQuMTYuDQo+IA0KPiBJIHRob3VnaHQgdGhpcyB3YXMgb2RkIGVub3VnaCBhIGNvbmZp
Z3VyYXRpb24sIGJ1dCBzaW5jZSB5b3UgYXNrLCBsZXQgbWUNCj4gZm9yd2FyZCB0aGUgcXVlc3Rp
b24gdG8gSGVucnkuDQoNCkkgdGhpbmsgYSBidWlsZCB0aW1lIHJlZ3Jlc3Npb24gc2hvdWxkIGJl
IGZpeGVkLiBXZSBjYW5ub3QgYXNzdW1lIHVzZXJzDQp3aWxsIG5vdCB1c2UgdGhpcyBjb25maWd1
cmF0aW9uIChhcyBKYW4gcG9pbnRlZCBvdXQgaW4gSVJDKS4gU28gZm9yIDQuMTc6DQoNClJlbGVh
c2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KQnV0IGlmIE9T
U1Rlc3QgaXMgZXhwbG9kZWQgYWZ0ZXIgbWVyZ2luZyB0aGlzIHBhdGNoLCBJIHdvdWxkIGxpa2Ug
dG8gcmVxdWVzdA0KYSByZXZlcnQgc2luY2Ugd2UgZG9uJ3QgaGF2ZSB0b28gbXVjaCB0aW1lIGxl
ZnQgZm9yIHRoZSBkdWUgZGF0ZS4gSG9wZWZ1bGx5DQpldmVyeW9uZSBpcyBmaW5lIHdpdGggdGhh
dC4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gSmFuDQo=

