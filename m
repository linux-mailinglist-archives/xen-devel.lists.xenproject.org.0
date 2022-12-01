Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2783663F3A7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 16:21:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450852.708344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lMm-00075C-Sz; Thu, 01 Dec 2022 15:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450852.708344; Thu, 01 Dec 2022 15:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lMm-00072g-OU; Thu, 01 Dec 2022 15:20:48 +0000
Received: by outflank-mailman (input) for mailman id 450852;
 Thu, 01 Dec 2022 15:20:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPp1=37=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p0lMl-0006xu-0i
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 15:20:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9febc55-718b-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 16:20:45 +0100 (CET)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9635.eurprd08.prod.outlook.com (2603:10a6:10:45e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 15:20:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 15:20:43 +0000
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
X-Inumbo-ID: b9febc55-718b-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8WIB/aLqjGvZ9C8sqzesetO577DtlIGM60jlbYyNNCPC3+j9qzCdtfLJOL/X+Te+DFJFn7twSMeTLVbQVmci6UhsPo3KYcqy3zf48/ItksdodQSvQn7PxiJCZ21pZbcBA3NeW61PYHamsrp18xVcCTWL/QfmmSh+6m1+rkQD3F8upXqbcUIu88vHj1f49hfGAge8hj17oRtl9nG6XAJZqr4SdfK+nCfU8kRNQ2A0EmElgf3eXKpWEpvazLXxqw0/lSqYN/zZTCPFA4pNEPzSkRpl05qmf6G+WFMRuZhDAyMJ2yhw3CFgdtqq0D/SvTkEcbOozMk56bTPEPkGfN1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+tUHG/lCwabTsDb1Aunvt2pkR3Hj50Rq4AmGKj/FQI=;
 b=ZFWzA/wRophhIm81cS95fDx4A5xoWaQAnsLtht7BMfmC+E8C5JwXSmocl+8alKI7DCmPUN3xgkwejROs9kY8Kl9Dn/ya2WvJlUAS17+c6AQn9oP5S3C0xeLpB5/VET5uYWVShBrB9klKh2y19H1ksXl9u/l08UeMB5Q70ocESOkyBypkkYBJI/YG/qn1jh6T4nQom9CR5GOIiIlMMjx1I6cyHVKQ0uMJZ/5s4D2pzHEiK4t3COuXwSPdOXRv/A1JeIKPc8t0XInQUioCr+/azKn3Xzo4gaZK71Oxw1Hg3uMUvewcNy2fJjpVL43WTfZH9XnkgXZO6CId/1WwtrOhqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+tUHG/lCwabTsDb1Aunvt2pkR3Hj50Rq4AmGKj/FQI=;
 b=8TIS3cd73kObhGXEMX1XxjAM1RaUuyG+wRk3KmkzRvaubY+da2bH+wp0lWUPLhk3l2PfI417DMGK3UzsA1gRf8jWb7PMwY9XB36qgZA09vkFFe4ovU6cxa6oE6MftnWHJ2eszhDJakqe7QdjFNKh+JiwkC4UIZmZz361BVah4oM=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"committers@xenproject.org" <committers@xenproject.org>
Subject: RE: Commit moratorium
Thread-Topic: Commit moratorium
Thread-Index: AQHY/+nvKQhQiJhrtU2mTVK8mGpEya5ZI5AAgAAMmgCAAABdcA==
Date: Thu, 1 Dec 2022 15:20:42 +0000
Message-ID:
 <AS8PR08MB7991984ACF81CD95EB75CE6392149@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <3deaeaf4-dd5d-93cb-2ca5-3c22e2c19bff@xen.org>
 <16684217-afbd-3671-5fad-08057a0e1b20@xen.org>
 <791303a6-7b37-20fc-083c-be8083c90014@suse.com>
In-Reply-To: <791303a6-7b37-20fc-083c-be8083c90014@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0C58849A7C05F9458FA62C3F4744684C.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|DB9PR08MB9635:EE_
x-ms-office365-filtering-correlation-id: b9eaacf4-f3d9-4950-048a-08dad3af9c94
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MTYHdBDO3wSiRv8eT72+tTbF73h9cQxJsTXdwbgfxDY9NUl501aYToBMTUW7vipq9q7EcN3XI6NffGzaQWdAN9CY1uboI7hX7YIWFl8kATmK3YDA5ITKvGQ8k2FNpksCS9D1KxalO368BnbFApW3pe62t+GAndZJVxQO0CZQSZF8JpbYcvAUTumypxmw2l5Q4TCAb3N7xy07YKWylpr6MwB5jcmh5hoB7IY7fpoaPeqW9hCtJRuHumaR+AeSZrZkpHtwiGofXarqZ7Ua0touxaVm0uAdmuZxVFAQWpipxyElKe2k1ZkLezzlTwBJWVXTf9SqDTXiX6N36NWjyeXn2sdkZpLjnwN+3oPpUvyqpCnMZAqivM4lLAdhsJjrUa6cdxAFjO0UVybZ1jFiq+in82tPRkHmZzom/66HGY81mvxfSGgYmtG/USrCYwxJqWgWtYCzq7GiqEq+EoicEYG6CbeqBtimaa7GjQvKmhyZdlbAvo3Is2vFYpfzXnj8SwpxIFnnzT7XWHOnIppzTmPX72FJz9RIJhlA2Ng/ncPqYO46C/lRJqvZI0tRuurOQl5RMJhp0SA42De/bh7BRxnxOwSj8L3Jv1uqMPn5nJIbCQ/4ld9GmqyL2bDjKZUNNdCn4/rJKWoVvu91FqVbHH3FjKRsZs/nSM9LZZfuN3U037uEg2SjVzYebTOn2pukbxMM/HHLxLTQ2RzXIecJe3C10A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39850400004)(366004)(346002)(376002)(451199015)(3480700007)(478600001)(83380400001)(53546011)(2906002)(110136005)(71200400001)(54906003)(4744005)(5660300002)(38100700002)(66446008)(38070700005)(122000001)(7116003)(41300700001)(26005)(66556008)(7696005)(8936002)(6506007)(86362001)(4326008)(66476007)(64756008)(8676002)(9686003)(66946007)(52536014)(33656002)(316002)(186003)(55016003)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3pPYndyRDMyQ3RSeG1QUm4wS3hNWXM4T2VhUHRWU3BGb3ZIdTc2MWtOMTZX?=
 =?utf-8?B?NnVMU1ppQlVmWERHR0RYTzlZeWVsMUpxZmIrb2x3V210eEpoaVVuU2xpcnlC?=
 =?utf-8?B?cjltWkgySThLM0NoYlV6QlhlY2FzRm5pdTcwT2cvWm1NVTJTQWlDeGZTbk1n?=
 =?utf-8?B?eXFMbnIyTGkzdkExanllSys3V2E5Nkt0NnhQTlljMHdNVkFWOVRvTWlQd3pz?=
 =?utf-8?B?NlRGU2NXeVl4SVJrTitpNStka3ZWcmVLTE52RGNiMjRTejhUUlhoMDFSS0xP?=
 =?utf-8?B?c2pCQnRpVXR4MVFDQTFuR0lDc2tpQmYrVThIbHp6MWZncHIrQlhGTWtCbEdi?=
 =?utf-8?B?cnAyaVBPenNucTAvdWY4YkdIRkpMSytLQ1JjK1RhdU9aUFV6eDBhc2tKWHli?=
 =?utf-8?B?SDRObTcyeTFUYUtkYjFlaEdxck1YNkUvSGhnYWszUjh0WXNyVzNJV2lKelhL?=
 =?utf-8?B?cE9DZEFHUGM1T3g2dmpDb3gwZERHOWpjbWJUci9EM2g3ako5bXBheXJITzNW?=
 =?utf-8?B?K3hSek1yYldlS3c4WFM0ZkcvL0ovNmV1YTJZN2JGQWtFbnFyNW9WZHFHNVZK?=
 =?utf-8?B?WWVQT3BGQkdVbmZmQmsvbmRGdTRycmhDS294b1VoYnMyNmRGUUNYbTFYTUVa?=
 =?utf-8?B?NlhjZnZvTkpjclZTMEZwam0wcVNWQ0JjSGlIWVlzdkJZQXNQVEtMV0hwL0to?=
 =?utf-8?B?SEdvcnRCV1EzTGpuMnQvaWJZRGVVaWxWTHd3bkdYT3A3RGFmSEdVZ1gyUTJG?=
 =?utf-8?B?amtnY0w0QW1acUhPZm1NRFhCWVJ6Wm12RmloaFR6ME43bnMvemF1SXhpNENX?=
 =?utf-8?B?cGZRV3pwNmFySklTb1ZXM2tGQ0ZJWnIxRFNlNUhGNDJxMjlOMEltOHdkZHY1?=
 =?utf-8?B?TWY5QnVLc0ZsZ2I4WUFOZ3hoM2pEcVpWZ201UC80WG1aczlseFFqZHljeHVi?=
 =?utf-8?B?RDFNTXFldk5ZVE5HWlJQaTdldFExQmZDeEJuNTN6cm1ER1pUY2M3NVl4MmRq?=
 =?utf-8?B?dzdac1ErOVJmU0pHQzYvNHNtVWVFcm9zZHAzRDZ6RUNBa1hJcEpxMzlZN25S?=
 =?utf-8?B?MkEzUklobDVaWHE0OVFUMHl2cXlsN3NXakJkZVd4V3NWVFJNdEgrbktlL1g0?=
 =?utf-8?B?UVhJTUxQSlpPUEFSWWUya3VOOHFwcVFyYVpyTEN4MGVBbFhheGtRNEprdXMr?=
 =?utf-8?B?V3dOck5rdnkvUFZTWnVST3k2U3A5OWc4aXlNaTNyczBlWGJsYTEySmxhVXVl?=
 =?utf-8?B?cGh1UncreFpJMXdmN2ZSc2p2cWUwZHRjcW04d2grT3lYYnVZU01mcUNOVWdj?=
 =?utf-8?B?TVdaNGdvR0xweVhjeit5SEc0TlYrbkk1cGw0VlRldU1Bb0o4Z0pWblFmOTht?=
 =?utf-8?B?S3M0eDNpUDhYbVFxNS9vS2tBcjdCYXR4NHpWdkZMRmFGS0prMkpXalBHeTNp?=
 =?utf-8?B?azh5Y2pXOGlLbHVDYzB5ZG51MUNNdGFJLzdDV05HZm9PUTBrZXRuVk8raDhi?=
 =?utf-8?B?VjhOSmpLQUxSUzlZMXJqT21jVDVDZ1FRUXRUbEN3MEpMRmVMV2Vob2sxanNj?=
 =?utf-8?B?V2MzSU8vbU9MRXFhZW1TdEMwU3pGWXVPV2JyRkF1RENBendwYWcwZktpcHU2?=
 =?utf-8?B?K3ZMTXY4bzVrOTk2dG1sd0F3WnpnTTJqM201T0xOREpNbTNjdkNDbnVlWjBI?=
 =?utf-8?B?V2o4YmJkdHE1YlFnYWRQMnpNWEx5SXdSMEdJaVZkeHovK2tSSHJ1TWswai9r?=
 =?utf-8?B?TjRKemxnQ29PeTBKN0FsSmZ3ZUtGcFVzY0g4TVo3ekFsNUJvWks0aVJBRWVi?=
 =?utf-8?B?SzZudmFpa1BRWGRyT3kzbUxJWnZOamZRQkEvTU5NdVN6empRUVZweU0rTFFz?=
 =?utf-8?B?dDZLRTZhSkRNMUJSUkY5Zm12Nm1FQUhYZmZXK1IzWEhORnB0VzVxOVhJd0dr?=
 =?utf-8?B?a2tPMjdRb0lDdWpYeFVERC9NR056OHFMWmhTL0s5cDVSSVRyNE84M1NyNTlx?=
 =?utf-8?B?WGZiZ0Q5NU1pU1dCTTNwVWVHTjhhZ0p3eWFQUnpqOWRHTXg2MjlaQTRLYW84?=
 =?utf-8?B?S0dsNWlzNlRBTGtwTmkxNW5CZkdWMWlHMi9ieExoS3JrOGt1bFkxdW5VN2Zz?=
 =?utf-8?Q?Er7YWTAi3IABxktMnHbr7QmYV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9eaacf4-f3d9-4950-048a-08dad3af9c94
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 15:20:42.5873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m3bW00xwiAR1GHPyoebt16t4Sk++nvCBq+RDYeL2cBgrlAit99zqENT1Zzx8MhzM4mGfEhk4J3Pgsk9+WAL7mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9635

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IENvbW1pdCBtb3JhdG9yaXVt
DQo+IA0KPiBPbiAwMS4xMi4yMDIyIDE1OjMyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4gSSBo
YXZlIGZpbmFsbHkgbWFuYWdlZCB0byBicmFuY2ggNC4xNy4gVGhlIHRyZWUgaXMgbm93IHJlLW9w
ZW5lZC4NCj4gDQo+IERvZXMgdGhpcyBleHRlbmQgdG8gdGhlIDQuMTcgYnJhbmNoIGFzIHdlbGw/
IEkndmUgY29tbWl0dGVkIEFudGhvbnkncw0KPiBidWlsZCBmaXggdG8gc3RhZ2luZywgYnV0IHdh
c24ndCBzdXJlIGFib3V0IGRvaW5nIHRoZSAiYmFja3BvcnQiDQo+IHJpZ2h0IGF3YXkgLi4uDQoN
CkV2ZW50dWFsbHkgSSB0aGluayBBbnRob255J3MgcGF0Y2ggc2hvdWxkIGJlIG1lcmdlZCB0byA0
LjE3LiBHaXZlbiB0aGF0DQp0aGUgcmM0IHRhcmJhbGwgaGFzIGJlZW4gY3JlYXRlZCBzbyBpdCBz
b3VuZHMgbGlrZSBjb21taXR0aW5nIHRoYXQgcGF0Y2gNCnRvIHN0YWdpbmctNC4xNyBpcyBmaW5l
LiBCdXQgSSB3b3VsZCBsaWtlIHRvIHNlZSBKdWxpZW4ncyBjb25maXJtYXRpb24gdGhvdWdoLg0K
DQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg==

