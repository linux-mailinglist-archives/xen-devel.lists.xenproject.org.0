Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D2431F04
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 16:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212329.370165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTJ0-0003r7-CQ; Mon, 18 Oct 2021 14:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212329.370165; Mon, 18 Oct 2021 14:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTJ0-0003o0-8m; Mon, 18 Oct 2021 14:07:58 +0000
Received: by outflank-mailman (input) for mailman id 212329;
 Mon, 18 Oct 2021 14:07:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RpTT=PG=epam.com=prvs=0925c93432=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mcTIy-0003n6-3H
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 14:07:56 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca036196-301c-11ec-82d8-12813bfff9fa;
 Mon, 18 Oct 2021 14:07:54 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 19IDtcDv020444;
 Mon, 18 Oct 2021 14:07:52 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bs3h79wmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 14:07:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6323.eurprd03.prod.outlook.com (2603:10a6:20b:159::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 14:07:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 14:07:48 +0000
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
X-Inumbo-ID: ca036196-301c-11ec-82d8-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhmFHc1An/VojewQmULopIm7DyEoiRpAbRsjpXycl+w4e6U4hma0+1am9qlXVEP9CA8wcr75JRN5LmG6TXOFk9PT3mCi+uJn0yX/g1x3C4mgg/VNUsk1enzCbzUoU5D3zJkWZ6zqRbk8m9li3qyL+TvCc7w8x8HTmEuhiLa8tsXEMOAcRqxuzRVTgaBASLLf0HD9jrZGUakeP5uz47Tm6P3DVjAbB3tcpfEwrhCrQN8j7OA2IyUHpBlVYg6orK47E2NuaUQMTjJCbiPbhMi0gT2bqdgO1NKIYdmcnn6obyNhhJZ+qZHhHo16bHMbUCTQ9EiqmO0cLTnmkeu9C5orTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzqIXUW/GuM6HHgf1LJ/uCigthYMGbHIfWQI0mOFCLE=;
 b=gpR7p5D7xC6tgnD/qPVLBgWDdMqCSc4HDYHPv3LbecOUGiUAf416aD21y4BdwN/ncNCDS6WjID7EUhMY6J1lgLbTRTsHjIWGW4cCNC1GLlOPFICNqcSncpz/aXNZHOaQTDbgUCXev3ap9+aS79VRzDA2F7CGGTkT3cHWrm//rdA5LY2yuUmfAmkRZ72yHXWQsTzuoYhKhI0fuEiLgTmuXfdJ2OMb2C5/nd2fDLVtKAA47x2PF/VN87k8soWlVCzsIA3ynKZp/Ax3mlT6GSBSoTM62QD1ZZ+pkkfa645ugI2SLmr61kUYN3tAE6Xmis7tDixcVEjCVL9HDIQZloHzfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzqIXUW/GuM6HHgf1LJ/uCigthYMGbHIfWQI0mOFCLE=;
 b=5IESHmLLzIyTT/YMiqhA85SvWRb+lQOJMSc6lXeqU1gKdXitQQlpYhaTBVtxNwJfVp5285e7cXa163eOWIlXHE1UHT78/4x6Z1W8aUEq7y/UdhHlEScjGcihBN2TBfRDxgvxEYzFLM6Ps3R5xIdVhjObOE/qrDn9qhvALHtPohoY3kyfrHMAHGkVRfNT8KfOO2BuiOq8r3WybygkVcBlkJ5hFs2NKcDUksgCD5se3J0bHjgM+8OWvhLRDbhwO6hkGIOacDLeVPaLyUDCvHlA2Z5T23LWKyFV/mBUfVJi2aSjBY6iwraF5phxdmuedhqQZ/yUbI9Q7bjQsP67MeL6Hg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Ian Jackson <iwj@xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
        Paul Durrant
	<paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Topic: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Index: AQHXxCmHx+Lzp09rU0elFmx0jxVt5g==
Date: Mon, 18 Oct 2021 14:07:48 +0000
Message-ID: <46bcd42f-df4f-922a-cc21-a05821481754@epam.com>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <ca5558b2-25c6-90d2-284b-03cbbb02691f@suse.com>
 <FBC4FA6D-AF07-437A-BD81-52708B139070@arm.com>
 <8c99e635-9509-b078-2285-48fb6fb91507@suse.com>
In-Reply-To: <8c99e635-9509-b078-2285-48fb6fb91507@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdb57ddc-922f-469f-5630-08d99240aaaa
x-ms-traffictypediagnostic: AM0PR03MB6323:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB632358AAF81019CEC9780E77E7BC9@AM0PR03MB6323.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fycNwjYmM7q+gBocVOUyF815nYa6Tey8gJAoPYZYIZbHG0C/vjefqsnrJTHHNs9UN8/kxPy0GQKUkW8p+srwNMKvtOHIJB08+PXjkvIwT73q6354ajD+wC2DlHkGlwcWLRsVoY48X6VEPFqm/Ymmkbq+LcQCwFvvd/X3M2lxtQUr3laUDOe2nrCOrvfYudNyvgYb0ba9NQDtKkwb9z0iLF+tto7wVbW/OD8qpoLMNziYwSOlJ9DD+s0+7C5OJ1F1T+PyumnHXlQ3AsoMso8N7xxLg+e5MiptCO5rDSjX0A41fV4v1QXVe6GT6BOzfv6+lBXiOZbYK9uHmtp1S5BWhLHg/tra0Y9FkXgPCvAiCJr3f0lSVOHV7M4bE/5SnGwSnj3V2g6o+LrTlOMs1Yw9a9z+Rr0Df3SNo/V15zaBLspmTMHy5IC/TIL7nECkKEu0S/Vh3tPVu3LBp2qGlwfU2ZwA6iX66v32cIgIf4xfnpz4yVihHMA9NPwQyAd9s/48XTyn5Go92ILouhbjl4lKD2Z0CVPdD33mgXik9UFyP44ozcZF1Ddqr5Gsq91YJT0AobXNSiWfDj91eIuSJiOdhr4SinCq5Dm71BY6bc+87Y4CrdokDHH3P4OOIctV1ZJ+cehrNtzNdMmslt23i8UB6OyJETS0K4PL2VvZrxDWU8D8uBypKhTVo/VBMn3EAfk93uaLranDKm2z0gYfrs6Pru/pFHSG7ha0dJOhz8+9R2ofV1EYdap2J+7DI2rw5+l/t+t0lbsJ06SQ3t9oecHLLneslygMPxLqY1CaYMuaeUhlBIx+TscB2HlFXLinonZIH4xS5IjMhZd1ZvLJGVQJZAbD18DP+UgBBiM3ulgg/20=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(6506007)(316002)(31686004)(508600001)(53546011)(2906002)(7416002)(36756003)(31696002)(8936002)(966005)(66946007)(38070700005)(5660300002)(76116006)(4326008)(8676002)(110136005)(6512007)(38100700002)(86362001)(66446008)(2616005)(107886003)(122000001)(91956017)(66476007)(26005)(6486002)(66556008)(54906003)(64756008)(186003)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VFoxQ3hydnRlTEoxT09GSkRpKy9uK3kwUXE0dk05a2hiZ210d1VCNFZnQnJu?=
 =?utf-8?B?Wjl3WmdGenpGVmV5R0FxbkZyYnAvVVMyTitVanl6VWlPYzQzVXl2YmNsRUgy?=
 =?utf-8?B?Qzc4ME1tODEvQnd0NHVYdnN2ZGxmeXBUbi96ZXM2MFJHV0FkcDE5dVlQcGdS?=
 =?utf-8?B?ejNJdms1T1BjU0c4MFNXV0F0OFNPOHBwb1d3MDBIenE4NjBaSzIrbUN1UVB2?=
 =?utf-8?B?SXRHZVZweExnYlRSQVMwSTVPVzJGL05Wd1pFZm1ybW5SZUYrRFVYV2hpR1hr?=
 =?utf-8?B?b0x5UDZrNzYzalozaXpHSEFkR3AvMk9UOG95WjZESE5RZjdWcnhyZnFJQzF6?=
 =?utf-8?B?ZVplbHRVeHZ5cHZBYTRabVFCK3NzVU5uSUhHQkcxOTM1ZThkVjZ3clRSRENx?=
 =?utf-8?B?SVNxNGNoTm1Qb3UzN0Y3UTNmc2ZHczR3anNCa1R0aWVaVkZNRFZzTGl6L2Z5?=
 =?utf-8?B?bWQ5UTk5eGEvSFI4NE5qeFhXTXJwVlBrUnNBQ2JTRWU5M3cvWndsWFdMQlNJ?=
 =?utf-8?B?ZjNxRC9VSWlVYjdSN3JDVlFuUG1BeVZlald1V0t4eFpMUC95bUs3MVNkeGRv?=
 =?utf-8?B?SnhHaGI5NkFrMElsYlZUUUlRWXFuSmg3VkRvM3NlMTdGOVcxM2Erc1o4NDZp?=
 =?utf-8?B?cTFMcEhpNGxuSkU4NHdoZHBTa0RqUklVZGcwcjRFQ3FQTkplT0hGSFBOdlh5?=
 =?utf-8?B?NzExK2x6ajI5YUwzM281aDFtTTFwcUJMYWxMWmtONlROOStPK3pveUxiL3Fi?=
 =?utf-8?B?bUdDeFFuN0lxZkxseHNHSUdRMzBOa3lQUHR2SFlSZFloOFJ3b2Rpb0R3Vkly?=
 =?utf-8?B?TVFFVUpvNTZPek4yWjRpNHlGcy9NTTBvN2dFUmI0MW5CMmM1engyWEV2N1R1?=
 =?utf-8?B?WEZwL0pmcklyUVNDQ3RubjRvL2QwYVU3dERwRFlMV2lmY3lWRDU2dnMyNFNQ?=
 =?utf-8?B?eHZDSEhKVkx2RndsdzRvVXAwK2VqbERUcHc1MHFzaVhPVEN6MHpKWlpYSDdi?=
 =?utf-8?B?bUhGcWR1V0ZYVzJvTjB6dmt5L05qTm16STRyMElOZVFQTisvRDRUVi9QWFdD?=
 =?utf-8?B?TWJhUE1FWjB6aHVEMElqelFTaTkyWWNaTHBsUEdBbjFlbkhPNVlnRmNpVW5q?=
 =?utf-8?B?Q0FLSXVKa2Z0UzNkSjZBUk5DYU43dk1rT05QUkRoNWUvUHN6ZUVLL1ppTGNi?=
 =?utf-8?B?dHc5eElOQ3hibmVneC9YZHFJaEFPY0R4czd2dVdleWZvSnQyZDJQOGlYSzFq?=
 =?utf-8?B?SE5pZldZTDg2V1N5Kzh3VnJtZitWVDROTFVYQlEzSDZKbWRMWEs4K1dpWEdB?=
 =?utf-8?B?Mks0dnRMZHJqcm9QaGxIM1hxa2U4eUNGWDlIMElvRGd5R3ZMMWlPcFBndXZ4?=
 =?utf-8?B?UzBlT011OHFPQ0FkUTRMdHQ2cXdMRnU5V2JJbWFHRGxJSTJMYWpzbklxK01T?=
 =?utf-8?B?Ujlpa0FpZ1RSUURGWGFBTUloTmxGRkp2WVBRdDdDTjYyYlRpWkhwR0lmOHdu?=
 =?utf-8?B?WmNseFdOZGliRFRXR1IrcVBHUEV5T2xEMzNRK0VyUUlJUHNUd2wvdXNLUnZP?=
 =?utf-8?B?VkJHdjF3TmRsSGJ5VEEvNW93Mi9kRTU3UmJzWW9od0NidFg3cnJ5STlVV3Rh?=
 =?utf-8?B?SkY1TnpKU2huRUZDYW9GVWQvbmFQOWgwbkliV0dSUXczUVNKVkNGRlNiMTRq?=
 =?utf-8?B?VVBlS0lUc0x5QjVPbWJ4aVYyVEsrSDFMQlZ5eTRZYTdCeUpFNFFGN0c1enVa?=
 =?utf-8?Q?lq2s67ADctL8G5Pi3jtkVQQzeMWLUG+U4pb+pNn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <017C996A2B31DF43AE6FD504182E7BD6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb57ddc-922f-469f-5630-08d99240aaaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 14:07:48.7323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UjU6Fnc3pOfORAIHE8WYkb1jtZ3GxB4xhsZZVwGmiwvdS/9Sy5qdFXYJEKNXbqrnMjhKUO8g25U9XqrBkTR8Hc106LwszKyYlRTj8OCmenhJ71ZDYkyPHN70vIWr1sfn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6323
X-Proofpoint-GUID: YKrocAIzH8qSvtPFOvGQHro4mH2knCjo
X-Proofpoint-ORIG-GUID: YKrocAIzH8qSvtPFOvGQHro4mH2knCjo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_06,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180088

DQoNCk9uIDE4LjEwLjIxIDEzOjI5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTguMTAuMjAy
MSAxMjoxMSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiBPbiAxOCBPY3QgMjAyMSwgYXQg
MDg6NDcsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMTUu
MTAuMjAyMSAxODo1MSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4gLS0tIC9kZXYvbnVs
bA0KPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vdnBjaS5jDQo+Pj4+IEBAIC0wLDAgKzEsNzcgQEAN
Cj4+Pj4gKy8qDQo+Pj4+ICsgKiB4ZW4vYXJjaC9hcm0vdnBjaS5jDQo+Pj4+ICsgKg0KPj4+PiAr
ICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0
IGFuZC9vciBtb2RpZnkNCj4+Pj4gKyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5DQo+Pj4+ICsgKiB0aGUgRnJlZSBT
b2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcg0K
Pj4+PiArICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4NCj4+Pj4gKyAqDQo+
Pj4+ICsgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3
aWxsIGJlIHVzZWZ1bCwNCj4+Pj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91
dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQo+Pj4+ICsgKiBNRVJDSEFOVEFCSUxJVFkg
b3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlDQo+Pj4+ICsgKiBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLg0KPj4+PiArICovDQo+
Pj4+ICsjaW5jbHVkZSA8eGVuL3NjaGVkLmg+DQo+Pj4+ICsjaW5jbHVkZSA8eGVuL3ZwY2kuaD4N
Cj4+Pj4gKw0KPj4+PiArI2luY2x1ZGUgPGFzbS9tbWlvLmg+DQo+Pj4+ICsNCj4+Pj4gK3N0YXRp
YyBpbnQgdnBjaV9tbWlvX3JlYWQoc3RydWN0IHZjcHUgKnYsIG1taW9faW5mb190ICppbmZvLA0K
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICByZWdpc3Rlcl90ICpyLCB2b2lkICpwKQ0K
Pj4+PiArew0KPj4+PiArICAgIHBjaV9zYmRmX3Qgc2JkZjsNCj4+Pj4gKyAgICAvKiBkYXRhIGlz
IG5lZWRlZCB0byBwcmV2ZW50IGEgcG9pbnRlciBjYXN0IG9uIDMyYml0ICovDQo+Pj4+ICsgICAg
dW5zaWduZWQgbG9uZyBkYXRhOw0KPj4+PiArDQo+Pj4+ICsgICAgLyogV2UgaWdub3JlIHNlZ21l
bnQgcGFydCBhbmQgYWx3YXlzIGhhbmRsZSBzZWdtZW50IDAgKi8NCj4+Pj4gKyAgICBzYmRmLnNi
ZGYgPSBWUENJX0VDQU1fQkRGKGluZm8tPmdwYSk7DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoIHZw
Y2lfZWNhbV9yZWFkKHNiZGYsIEVDQU1fUkVHX09GRlNFVChpbmZvLT5ncGEpLA0KPj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgMVUgPDwgaW5mby0+ZGFidC5zaXplLCAmZGF0YSkgKQ0KPj4+
PiArICAgIHsNCj4+PiBIZXJlIGl0IGlzIHF1aXRlIGNsZWFyIHRoYXQgdGhlIFNCREYgeW91IHBh
c3MgaW50byB2cGNpX2VjYW1fcmVhZCgpIGlzDQo+Pj4gdGhlIHZpcnR1YWwgb25lLiBUaGUgZnVu
Y3Rpb24gdGhlbiBjYWxscyB2cGNpX3JlYWQoKSwgd2hpY2ggaW4gdHVybg0KPj4+IHdpbGwgY2Fs
bCB2cGNpX3JlYWRfaHcoKSBpbiBhIG51bWJlciBvZiBzaXR1YXRpb25zIChmaXJzdCBhbmQgZm9y
ZW1vc3QNCj4+PiB3aGVuZXZlciBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKCkgcmV0dXJucyBOVUxM
KS4gVGhhdCBmdW5jdGlvbiBhcyB3ZWxsDQo+Pj4gYXMgcGNpX2dldF9wZGV2X2J5X2RvbWFpbigp
IHVzZSB0aGUgcGFzc2VkIGluIFNCREYgYXMgaWYgaXQgd2FzIGENCj4+PiBwaHlzaWNhbCBvbmU7
IEknbSB1bmFibGUgdG8gc3BvdCBhbnkgdHJhbnNsYXRpb24uIFlldCBJIGRvIHJlY2FsbA0KPj4+
IHNlZWluZyBhc3NpZ25tZW50IG9mIGEgdmlydHVhbCBkZXZpY2UgYW5kIGZ1bmN0aW9uIG51bWJl
ciBzb21ld2hlcmUNCj4+PiAocGVyaGFwcyBhbm90aGVyIG9mIHRoZSByZWxhdGVkIHNlcmllcyks
IHNvIHRoZSBtb2RlbCBhbHNvIGRvZXNuJ3QNCj4+PiBsb29rIHRvIGFzc3VtZSAxOjEgbWFwcGlu
ZyBvZiBTQkRGLg0KPj4gVGhpcyBxdWVzdGlvbiB3YXMgYW5zd2VyZWQgYnkgT2xla3NhbmRyIEkg
dGhpbmsuDQo+IFllczsgSSBjb250aW51ZSB0byBiZSBzdXJlIHRob3VnaCB0aGF0IEkgc2F3IGRl
dmZuIGFsbG9jYXRpb24gbG9naWMgaW4NCj4gb25lIG9mIHRoZSBtYW55IHBhdGNoZXMgdGhhdCBh
cmUgcmVsYXRlZCBoZXJlLiBBbmQgSSdtIHJlbGF0aXZlbHkgc3VyZQ0KPiB0aGF0IHRoZXJlIG5v
IGFkanVzdG1lbnQgdG8gbG9naWMgaGVyZSB3YXMgbWFkZSAoYnV0IHNpbmNlIGl0J3MgaGFyZA0K
PiB0byBwaWNrIHRoZSByaWdodCBwYXRjaCBvdXQgb2YgdGhlIGh1Z2UgcGlsZSB3aXRob3V0IGtu
b3dpbmcgaXRzIHRpdGxlLA0KPiBJIGNhbid0IHJlYXNvbmFibHkgZ28gY2hlY2spLg0KT2ZmdG9w
OiBJIHdhcyBzb21laG93IGRyb3BwZWQgZnJvbSB0aGUgQ2MuLg0KDQpQbGVhc2Ugc2VlOg0KDQpb
UEFUQ0ggdjMgMTAvMTFdIHZwY2k6IEFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIHZpcnR1YWwgUENJ
IGJ1cyB0b3BvbG9neQ0KW1BBVENIIHYzIDExLzExXSB4ZW4vYXJtOiBUcmFuc2xhdGUgdmlydHVh
bCBQQ0kgYnVzIHRvcG9sb2d5IGZvciBndWVzdHMNCg0KWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvbGlzdC8/c2VyaWVzPTU1NTQ4MQ0KDQo=

