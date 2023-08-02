Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4987576C3CE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 06:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574680.900181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR31B-00038C-SC; Wed, 02 Aug 2023 03:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574680.900181; Wed, 02 Aug 2023 03:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR31B-00035u-Or; Wed, 02 Aug 2023 03:59:25 +0000
Received: by outflank-mailman (input) for mailman id 574680;
 Wed, 02 Aug 2023 03:59:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4j5E=DT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qR319-00035o-W2
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 03:59:24 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f558cc07-30e8-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 05:59:20 +0200 (CEST)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB7600.eurprd08.prod.outlook.com (2603:10a6:102:23f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Wed, 2 Aug
 2023 03:59:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 03:59:14 +0000
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
X-Inumbo-ID: f558cc07-30e8-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQ7hy4kt3MOBvJpIkl2UMzoPI11BxW+LEYL7nLhX2dzYc62LJy7dqM6AVLWkXFTmO3JOTaEfQAj8akwvJFJ/Ne5EHf5oiNSrJngSTbuuxyeW+FM6N1zi2Js8FsjgBhuaS5URaZ9LuRvU/W9pE6IG1P5BFdGEJEaWQlDDM/NPqOcfPRNIi3CzZSF2gtowbsJOJbKx0LcGgmkZIAzWSgXdOdAeNAyz434iVqcvoRcuOOWRsp8Ctj+s1PUx1KSRVYZL+/+TCL3r36C/HR6xrZGivIjM4hThDKi7B4DZ2qQRdKvel1wgHo/MoRrIP259msv2+DMylwccdL2en1yANiqv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pPRehJouAJ14zJDuwpjJGN2EJjKr4+iWJK4Lzd6pvo=;
 b=FQbnyT2UIqcHPOnjV6Wkko5BX30HKGG2UdBc4eDPfpUUMuYNuylbCoTgRz8L4Q8y8/wAC93BhKgUWIBLw6+TevFIqv6w3mLK7NUcAZJiC74XS8MK07eWoJ6SFL9qZx9IgEaPiqF1CKQEnJcqdeJu9cH3bDoABZgnEHYbN/lZ1eMcGHU0KB5zGmk/66klfsj+j3921dpM4IT4ylvf3qc/nCyLXuzFa9+4dHYjOY8MB/tbZpR5bLyQ4ZDqrLLdLEUoR01sNQcRty3pf3VbXaXQ0oGiXSxLIDb11nOFkzNijv6ryBClRMpDLIi+e5EzAFHhi9Uv7bxMI0vrcwXCXpGf1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pPRehJouAJ14zJDuwpjJGN2EJjKr4+iWJK4Lzd6pvo=;
 b=2nU79hqxnjNUvZHsMg3B9B1HavxpuhRCrHKHSE6Q7uYaexi03A+2MJAv/s6XyZRQkr2bmwqfwwf1pbOpIo0EnEw/sjJ3l+LHI/ArZ/cCcY45S78FYY7BUuikJX20/UEwQ0ulUG3a/0qeufdJa1jvpAO7JOEnpuK/etLykLDW4+4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH v4 00/13] xen/arm: Split MMU code as the prepration of MPU
 work
Thread-Topic: [PATCH v4 00/13] xen/arm: Split MMU code as the prepration of
 MPU work
Thread-Index: AQHZxCqGkXVqhatOiEqMa3qeqTOTXK/VHIIAgAEp0BA=
Date: Wed, 2 Aug 2023 03:59:13 +0000
Message-ID:
 <AS8PR08MB7991DDC48815259C6B857E22920BA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <4f43b069-cb78-f356-628e-29b8ca8e595a@xen.org>
In-Reply-To: <4f43b069-cb78-f356-628e-29b8ca8e595a@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 58B84113F4AF0842A5BDAB482C07EBBD.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|PAXPR08MB7600:EE_
x-ms-office365-filtering-correlation-id: 34db764c-15e7-41bc-5b64-08db930cd5ce
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FE8jbiYZBprAVeR7Znv4/ZhdJceTwE3/fyLXCRLrGb+vmICmW3mP0l/QZK4JMgey8NO1svGML/NMONfL9h3IQlBJ5b7RdF9Wy0OapW3oofPxjPVEo3f+Dxi+6olJytBkO3k0IMWSmnSMGHhVfrkfkQus8woxc9vv3zDCGVMdUFv+ofqSAabgLY99eHc8BwY1ZaEVkYWAgHXZUQsb8MS8dGwxXj5+0Wj5muWj2yvVlcmuMRPc2jG8IxHnV6FAq0YfWGSXwM4+EQ1hEhZzelFIqBFW3U1dysTRbJxMKPwQRbxDoMNynwyXW7sD2T73wATGYJzU+AYSouDoMzO8lzPvHz2QDYMcgI6SFWj1yePXyZXzUWNuGGcPyng7uJqIkZwU47F7uMBv2sW5AnGwcyC0Y44Ak6lYJrw3Z0U07jXsNIR3sDDb2cN68fcN1DeHRCwa9QHgjg91q+CeXZWnFDR0njakQM4KHbNiQ71JfkwEl9f+ZE+xtVVBtfEex4rtDBrIIB3i8MSFFQfWPInCnVgeGkQDSq9qrwPphbG3lswgjEoXToeYClPgSLntyv2eqhsoRP0efxWRgOSVaRVNEdD4bE4D3qr21qEOHzkm2ObRMp/wHKQsXkA/l+OM1maw2NYy56iel1x7ISxPdJDo8unFeQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(38070700005)(2906002)(4326008)(83380400001)(41300700001)(186003)(86362001)(316002)(478600001)(38100700002)(76116006)(9686003)(966005)(122000001)(110136005)(54906003)(52536014)(55016003)(5660300002)(66556008)(66476007)(66446008)(53546011)(64756008)(71200400001)(33656002)(26005)(6506007)(8676002)(66946007)(8936002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cUQrZkRZZlB1R3crYnVxTmNDd3JMVjVZcjZZRVJZMDhzQTY3ci9UMEV3R3dJ?=
 =?utf-8?B?OUFRVTRSV3JDNmNGSU9JWTgyZjR4cURRL3duS0ZZakVRNmxRNHFPN1k2bXlp?=
 =?utf-8?B?aVYyVmtIc20yQktyNW8vMnp4ZU0yUGFjWFJMS2twS0wyWEdnQUd0ZDZxK1BV?=
 =?utf-8?B?bWI5dU5mRGR2OC9vdEp0OWQvL2FocElpdUV5SUtBWjhweGRkYW1ucVZ1elk1?=
 =?utf-8?B?Q0E1eFh3a0RVK1NjNTVXSmk3RlFWcWNiVXpPNTRqQlorb0gwYVJSVk5yYlAr?=
 =?utf-8?B?K1RFZitDKzFmMEczV0hvdGRYRTY1YTdRZHMvRStwTVlSZFEwY0RWTTlCbXMx?=
 =?utf-8?B?d2wxSjQveCsxSFM1K1RhaVZYRFFsTU1IeFh1OVNIM25aLzlJNFVzeEFoSUFV?=
 =?utf-8?B?cXd0cFBoNlFxcUJCeTRIZGk0OUFPK0hIZng2SnE2UjF2QWJzZ0FKc2IvaXlo?=
 =?utf-8?B?Uk5Ja3JjNDcrVzF0R3NhWklXZHRlZjJ1TDR3YXplcVZVRFBxN3A3TWZtb3ll?=
 =?utf-8?B?NE43NjN2amZXWlhhSVZWQm9hRFBBVEs3RVNCc0hnQ3N6dDFHcXhLTWdFeTV2?=
 =?utf-8?B?b1E5U3NpR3dGS0NhTnVCdjkwT0ZtSVFQQkJENGp4VjV4SSszaEZRWlU0YTFV?=
 =?utf-8?B?S3VRNjhKU0hQWnVTRW9IRmptTGJGemJwc2VlWVBsYnhQczAxbTVDTGdMZzVq?=
 =?utf-8?B?OGdDOUhEd0d2TGIrdG5wd1ZFUHk0VU5jVVZEVEZVQUQvV1NERjJnNGdKdmhH?=
 =?utf-8?B?TExDbUplSlEwQ1BvWU8zTDJCeWo3eXNWU2YvZG8zdDM2d0RsZEc4RXk1U2Q5?=
 =?utf-8?B?cmEybFp2dGNSWjBTWE5INzFMMTJ2cVFwd09NWm5odDFtZVRRVDJuenpXdnlK?=
 =?utf-8?B?eDZjSWxONEc2N3dIUERtbEhLSlFVMDdoOTJCVm9Wekdacm5sS3k5T25Mc2lN?=
 =?utf-8?B?MTZZWlNlZ2NjcDZnOVFsQS9KaFFvWWdJR0hMVXRDK1grK2U5eHU5d1EvNm1W?=
 =?utf-8?B?cjd3Tkp2Nk5IOGdjVHlCcTBYN3BGa0xQbXJwemF3TTVnYW42dGUrVWp3NXJV?=
 =?utf-8?B?V2VTcnMyZEtUVGM2eWlJRFlZNGs5VG1qSWFaV0FHeHFVVUNQbmZuNmpuT2hV?=
 =?utf-8?B?VW5mWTJsUXIxMzhyTW9pZmxOOTFpUWMwNzhyNFFpcWc0VkpWZ1ZHUnEyODFT?=
 =?utf-8?B?Skp0cDVvZURleFptNjFKcVR3Z2xsOXRuVDBISXJYb3hON0E5R1FGSjNsNU4x?=
 =?utf-8?B?N2dRazJlQUVZblhpMGVkbjJhL3FQNUF0anFmeWgxSGVPY0h4YmRxY2NpRWJH?=
 =?utf-8?B?aER3V2NTR0ovYlNGQjczeFNDaXArUUxTaG01VFNqZkVOeGtaZENUTmR6MDYy?=
 =?utf-8?B?YTZQanEzZHBvMHZkOUhjK2pNSStVTGtKTXhNMms1bThzcENpbkxSd1ZWbFk3?=
 =?utf-8?B?THpCS0tXQXBMK1lCQ1JUOGZnN2VOTVRyRVdGTmJ5aDkwbzFvN3JzcnR4di9t?=
 =?utf-8?B?b1ZQbjdKOTZaSmJOU2d2cnE5QUl5bHV6V1M4L1JKUm9WNkthM09LTEdIQmtx?=
 =?utf-8?B?U25pVnp6N2d3TVVCci9WcWVPNURQeXIzbm9BdC9Fc1FMZjFyU21LWVBzanVt?=
 =?utf-8?B?UXNOeGxvZjY5RU9EbkFFSEVTc1l3T1IyUzJZTXNibjFoelRVUGQ1UDBtUDlQ?=
 =?utf-8?B?NDBKK2oxVEpSRTNUOHkxOXdPdnQwWHJncjVRdS94djFJVTN4ZHdsS0JRNm9p?=
 =?utf-8?B?RXZUcGYvczRQNVVMa2U0UHNySSs2Tm9ESW5vbU95OGZqZlozWDRpRFk4dTJY?=
 =?utf-8?B?emNoTTdHMXc1VDArVGs4Z2t5ZjUzT3BQRHRRTTRrZWdqd0NsYjlPaTFYS29h?=
 =?utf-8?B?STVFSzJiWWhqTmlBc04rcDJRQjRwYnZKNGFXdzVZZVFUOVJTZ0g3OWZYR3Bm?=
 =?utf-8?B?OXB4bGpJV1lBNXpPdlA5RnQ3UjhhRWorbnlKUGhyL3dyVmtyQmZMZGk2Sng2?=
 =?utf-8?B?dkc2Zit3eU5DbFNxcmNVOXlkNm5DQ25GVWl3SmRlM3V6QWZ2elFlUVRhSWw2?=
 =?utf-8?B?TFErNGVEWk83TU1tRk5YOFZKcWdFMFdLYXJaUHZncSswYUpmOEREUjFXelZj?=
 =?utf-8?Q?7e4RhziraehqxF+GqC1Bss9Bx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34db764c-15e7-41bc-5b64-08db930cd5ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 03:59:13.8773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5oU959sPJojez4nd8VwQsRHgN7ok1uc5twUSx3vQjOKuTwfm6PgJAyQsddx6j99rlAwepVH+OZUIEv2d2K65yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7600

SGkgSnVsaWVuLA0KDQpUaGFua3MgZm9yIHlvdXIgcHJvbXB0IHJlc3BvbnNlIGFuZCB5b3VyIHRp
bWUgb24gdGhlIHJldmlldyENCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0
IDAwLzEzXSB4ZW4vYXJtOiBTcGxpdCBNTVUgY29kZSBhcyB0aGUgcHJlcHJhdGlvbiBvZg0KPiBN
UFUgd29yaw0KPiANCj4gSGksDQo+IA0KPiBPbiAwMS8wOC8yMDIzIDA0OjQ0LCBIZW5yeSBXYW5n
IHdyb3RlOg0KPiA+IEJhc2VkIG9uIHRoZSBkaXNjdXNzaW9uIGluIHRoZSBYZW4gU3VtbWl0IFsx
XSwgc2VuZGluZyB0aGlzIHNlcmllcyBvdXQgYWZ0ZXINCj4gPiBhZGRyZXNzaW5nIHRoZSBjb21t
ZW50cyBpbiB2MyBbMl0gYXMgdGhlIHByZXBhcmF0aW9uIHdvcmsgdG8gYWRkIE1QVQ0KPiBzdXBw
b3J0Lg0KPiA+DQo+ID4gTW9zdGx5IGNvZGUgbW92ZW1lbnQsIHdpdGggc29tZSBvZiBLY29uZmln
IGFuZCBidWlsZCBzeXN0ZW0gKG1haW5seQ0KPiBNYWtlZmlsZXMpDQo+ID4gYWRqdXN0bWVudC4g
Tm8gZnVuY3Rpb25hbCBjaGFuZ2UgZXhwZWN0ZWQuDQo+IA0KPiBJIGNhbid0IHJlYWxseSByZXZp
ZXcgdGhpcyBzZXJpZXMgd2l0aG91dCBrbm93aW5nIGhvdyB0aGlzIHdpbGwNCj4gaW50ZWdyYXRl
IHdpdGggdGhlIHJlc3Qgb2YgdGhlIE1QVSB3b3JrLiANCg0KU29ycnkgYWJvdXQgaXQsIEkgc2hv
dWxkIGhhdmUgYXNrZWQgYmVmb3JlIHNlbmRpbmcgdGhlIHNlcmllcy4NCg0KPiBDYW4geW91IGF0
IGxlYXN0IHByb3ZpZGUgYSB0cmVlDQo+IHdpdGggYWxsIHRoZSBwYXRjaGVzIGFwcGxpZWQgKGlu
Y2x1ZGluZyB0aGUgTVBVIG9uZSk/DQoNClNlZSBbMV0gZm9yIHRoZSBmdWxsIHNpbmdsZSBjb3Jl
IE1QVSBpbXBsZW1lbnRhdGlvbiB3aGljaCBJJ3ZlIHZlcmlmaWVkDQpsb2NhbGx5IGFib3V0IHRo
ZSBNTVUgYW5kIE1QVSBzaW5nbGUgY29yZSBMaW51eCBib290IG9uIEZWUCwgYW5kDQpsb29rcyBs
aWtlIEdpdGxhYiBpcyBhbHNvIG5vdCBjb21wbGFpbmluZyBbMl0uDQoNCk5vdGUgdGhhdCBJJ3Zl
IGFkZHJlc3NlZCBjb21tZW50cyBmcm9tIHlvdSBhbmQgQXlhbiBpbiB2MyBhYm91dCB0aGUNCk1N
VS9NUFUgaGVscGVycyBkdXBsaWNhdGlvbiBhbmQgdGhlIGFybTMyL2FybTY0IHNwbGl0IHdvcmsu
IEkgZGlkbid0DQphZGRyZXNzIHRoZSBjb21tZW50IGluIFszXSBhYm91dCB0aGUgUkVTMCBzdHVm
ZiwgYnV0IEkgdGhpbmsgdGhpcyBpcyBub3QNCnJlbGF0ZWQgdG8gdGhlIE1NVSBzcGxpdCBzZXJp
ZXMgSSBzZW50IHllc3RlcmRheSB0byBtYWlsaW5nIGxpc3QgYW5kIHRoZQ0KZm9ybWFsIHY0IE1Q
VSB3b3JrIHNlbnQgdG8gdGhlIG1haWxpbmcgbGlzdCB3aWxsIGNvbnRhaW4gdGhlIGZpeCBmb3Ig
dGhpcw0KY29tbWVudC4NCg0KWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9w
bGUvaGVucnl3L3hlbi8tL2NvbW1pdHMvbXB1X3Y0DQpbMl0gaHR0cHM6Ly9naXRsYWIuY29tL3hl
bi1wcm9qZWN0L3Blb3BsZS9oZW5yeXcveGVuLy0vcGlwZWxpbmVzLzk1Mjc0MjAyNQ0KWzNdIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvMjAyMzA2
MjYwMzM0NDMuMjk0MzI3MC0zMi1QZW5ueS5aaGVuZ0Bhcm0uY29tLw0KDQpLaW5kIHJlZ2FyZHMs
DQpIZW5yeQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

