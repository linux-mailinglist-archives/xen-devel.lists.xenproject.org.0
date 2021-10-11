Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BD5429464
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 18:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206337.361887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZy2M-0006Bu-W3; Mon, 11 Oct 2021 16:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206337.361887; Mon, 11 Oct 2021 16:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZy2M-00069T-Sq; Mon, 11 Oct 2021 16:20:26 +0000
Received: by outflank-mailman (input) for mailman id 206337;
 Mon, 11 Oct 2021 16:20:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRsb=O7=epam.com=prvs=0918241709=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mZy2L-00069N-Bl
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 16:20:25 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1689fb1-0d63-427e-a7cf-70c2a9b7af2b;
 Mon, 11 Oct 2021 16:20:23 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 19BEhUJp025659;
 Mon, 11 Oct 2021 16:20:18 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bmpssgkf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 16:20:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6963.eurprd03.prod.outlook.com (2603:10a6:20b:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Mon, 11 Oct
 2021 16:20:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 16:20:14 +0000
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
X-Inumbo-ID: a1689fb1-0d63-427e-a7cf-70c2a9b7af2b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cz1PnQTXBYSYHcanyL588c4QBMu1XDN3B/OcUVTFlHsZjENutNS/7p57qpFj0vE91NLtQVEwaO5xVHzal+RrJkB7CVSy8eAZ+ZoIhO3Zc92ouQeE+2renBfF9JwFdzrKMG/SR8A8Ly0BqccnkFF7rDcIEWzR1VrDCjgshwZcjGWQAodWIey9ygJO0untVNEiV/lSQm0iQPY7nmnUeSIHDwxIoCZYbUhHRBfUC2ZwZcJh2bv8UJi2x4a3DTvsULjLej/tfKbWpzqhr6VxMdGZwfRqgHuRcn0A4EVCWWYm4d5eTasIeneIDEGkxEFAEE4oSMCwO55vFuQgNacfpaITFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyoOfCakYnnr3RrSHSR7TnLzSJcS8zCYW2lgzjlKma8=;
 b=T4T5fqcLg5VDFEVKrwkUOjxkkGHPnRqEjlREcQ7/B0oFACylZGrJSCP7707eGa0HvvRAn463BZJ9F/Nd1Kuveqi40LdJ6iPW1iNVm4DOwXap8coXKALwI1VmVuC4/OSB77Ai4GS5YouI1ep4JQanp46geHi2glcyOJwfJ1e41D06L0hx4YHCjJPZm2nAKXMzfn0DovnuSK6z0KJaXJlKFnPjNj0y5wBZ9A1gVWoGLldLPOPYM/7mcChotBIhZ1qaiOh1w3YvEGgbyjqeCax0fp29MPZcraU0z6N02yd7QewHYLoyCpOjE2qTXAsOWzAo7TIFRFLLecvjYUIr63AWNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyoOfCakYnnr3RrSHSR7TnLzSJcS8zCYW2lgzjlKma8=;
 b=Mo0E0hzs5rwVUTbDH3Imfex1UT5hcMP51UHGqJQID6ADpAw62j07u857C64bBjN7R41zpEb+cN6de/TLLams3i7QVwkXP2mv7UFiC9bNajOfeQhPiCFaCAdlTVq+r272j06/HCLqY/7cL+1C5xHh848ciSNBEih1c86hMSaWHFPKmVeteS6SbHYgx629yMVyf2y0KqAsOYG1dGQr9WM6Pr4wzB4Dc9KHoCZR0+2CkH6kxEWt+VP7A2jojoMolA9o5d+tH00m7CVdJennJobQHsS/6CkWKXj3uRe9CWicnj/y/dkME1IvAbHD+lK+ZsiCH/AD10YazEiELJJVzfGUKg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Andre Przywara <Andre.Przywara@arm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXutl3YqS5dHXsYk6KpdKt4d14RavNphKAgABZ5QCAAAISgA==
Date: Mon, 11 Oct 2021 16:20:14 +0000
Message-ID: <e199bfe2-0bcc-989f-fd4a-ecf44a3cd1ac@epam.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWQXF2vDaWQvi+bT@MacBook-Air-de-Roger.local>
 <4F406854-4F90-48F6-8470-6CCB60A3CB77@arm.com>
In-Reply-To: <4F406854-4F90-48F6-8470-6CCB60A3CB77@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0afdd56c-7212-4445-402a-08d98cd3019a
x-ms-traffictypediagnostic: AM9PR03MB6963:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB6963B7347E2D248FF3EF0B7BE7B59@AM9PR03MB6963.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Bsh24lZ+ts66HcSDjggvSE8tCZNXDqiQWzUJu8db0pm81Y180WjsUWNOwhjO0M8ilZOW3nJ8G+Y1cEtMEb127wu0iVCBIQ9D2RebvRIjaqz2wYWpdyUMtwVeeElZklEacnyw4M5VtUi00aXe6NpvvhgsLAHf58jxZMbOaSOF8rWtMvj7u9oiqvpjodkYa2Uc9H28wzGV38C00SZOqS2HFVX3Qv9CNK7xXu2MCX7sLPT7q6JHZwUQex6iQ9xTMqNuUuE+TX7ShgiggvDhWcean3R8mg7Vv9zFExwyAc9kKpjEoh0F7Ax81XGMnxYSPwPIVC3qhXpsZyoaSsjsGxbQu0099Zz4+8YvatXVKGcYA2cJ04htnibqJLKLm2/+WFwa0gvHTV4QoHp3wjJ/LHiL2Y3P7SRaE4VTTsunFY4hnys+JOk5yLCF8p8bq6a927Loy4KX9cRXpXvd3l5Tnu4ODvOTsPTS91du69mC5vqcOVaYaWLuOxehSiG/vGHcbFA/bP/++WngQKalJvaAaOO/4x7yGCCTCOWdVTkIvpXY0J2WvhBGL2gZnzHfoZHrfMOgIGhwGNFI4sUOz+x/rnP3RGJsAjrm3HEaXRdtDE4UdAxe5vHqCKBwGYP3PmHVBRhIWT5WYjeR+nx57ewPu6IBwXho0xn/z4ynTt9M15so5WfznlEk/n3b9E2nojWm5vZiXBV/fXRcNznrCrMv28av/XW17x1zZM5bhNfhprcoXrEPxDXdMUo494bOu0ePMxjOVp3RzguWRtbbAerX+t2i52JJz3mSpUopL64E2DvkYdRDFUIe5HeHzmPqgGKj2R/5p/eyklWXSbuFXxHHPpK4CA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(6512007)(4326008)(53546011)(55236004)(2906002)(36756003)(86362001)(38070700005)(64756008)(66446008)(66556008)(31686004)(76116006)(54906003)(186003)(91956017)(6486002)(110136005)(26005)(5660300002)(316002)(66946007)(6506007)(7416002)(31696002)(38100700002)(508600001)(2616005)(966005)(71200400001)(122000001)(8936002)(8676002)(107886003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c3VHZks2aGZuS0NlckNSanQxRGFrT0dUWjQ3b2Vod2ZJWUlTZEphTTFiM2No?=
 =?utf-8?B?Yk9MV1YvbUp5eEhTdGcwd1JNWTJYejhtQWVEOFBicXpkeUpiQ0hiSERMUTVt?=
 =?utf-8?B?U3VNZEozeEdRTkFzcmsrYzFvdWFuMUtYbkJjL2EzMXdQM2w3aVZSSTJ0RlpF?=
 =?utf-8?B?dlE1cnR1M2hPQnNTYlVLWnFmcnFhVDhWbXNNUkpmcEM0NStIUDVHQ2d3YXBj?=
 =?utf-8?B?eHBlYmRRZ3Q5V2w0Q2htUXpVQng1QThiZkxDRVpOL3VmQ0JZY1hhL3c4bVZD?=
 =?utf-8?B?dWNOL2lNTEEwaVBJNllEdzMyNlRHeVNmeEI0MjBEV1VoNnBSQ2QwZG1BRkNn?=
 =?utf-8?B?QnpYeXVJbHJBVW1DK2V2UjNwSDVCcGZaa0dFQ2swWW1SRjZGenZ0Z1FhZ2Zk?=
 =?utf-8?B?ejNRcmZIYzc5WFA4aGU2WTVqNVRldTdFM0NzVEpCUktKbmxRbEUyWWtmZFZU?=
 =?utf-8?B?VUt2aXozSzJydTU0cFE3UWVQUDJKeEJjaFdGSVgwSEhla0Q1eGdES2pKUkFl?=
 =?utf-8?B?TXFCOEhhZ0VMUkJDM0FrdlJ3bUM2SFZxSU81dFM4ZlVLSUFDUkxwcG5YVldu?=
 =?utf-8?B?b3BUVGpsQXBkeDJ0bTY5VmptN3pqdGdsNWpMYXVWZmdtQzA2QlNRZHhpQVVM?=
 =?utf-8?B?alhzZVJrTmVOVVlxMWhnT3NYZS9CdVNNUW1maVRYMjVGbVBrVjV5RlRHSTNP?=
 =?utf-8?B?cXVhbGRPeXFleSsxVXQ2Wnc1V0RremFTNytsME5KOU80NnI2UFh5MFFsVm5W?=
 =?utf-8?B?ODNNNU9SZ3BMY3pBSXlEOGdSRmpjMDYzYnp0bXJUaEx2VGx1a3VhNGxOeHUx?=
 =?utf-8?B?UTFrdW55QSs0RnhBc2lSdFJYTjMwT3NsbEMyaTdsa1dRbXdkSlJwdzRzZDVC?=
 =?utf-8?B?azNRQWNBZ3lLNmorb2prVGdYdk5LMFdENUFqT1lvclJZNHBzODZuck56ZzFK?=
 =?utf-8?B?U3dmV1pJRy9pdHFCaVVCZ29sdFgrNkwzb2RaRTRhaS9KVzVMaXJaWXJiQkxG?=
 =?utf-8?B?cSsxZXdZb3Z5QTRSY2RxeEZVRStmR2xFZXJyMFEyeTZ6ZDBOd2Z2UU9NNnB2?=
 =?utf-8?B?ZGYvN3ZaK0FBVjc3VG5LeHFkTFk5WVkwNXEvSWkyQlYybFpzSmlEaXNtV0Jm?=
 =?utf-8?B?bno1Qjh3YktmbnNFeFIyeWFpT0sybnE3U1JRN0JKdEIxZlgyWUpGaWhVR2Yr?=
 =?utf-8?B?OVkyRGRDdGRNWEtxRjhsVlVWL1NaVG96bTV0K3dqMWpyZnlQc3U4MHMwMGhx?=
 =?utf-8?B?NmtpRndJWEdBb1FYdnQrMXQzK3pDVzVxUGt2UHI1WVNoaS9RenIwbWRXN3F2?=
 =?utf-8?B?SUhaYldFVVFFU2dUbU9Kb2lxUjZzQVVwN3NoQ2F4V25SZEZ5QkxSWUdiQ2VB?=
 =?utf-8?B?cmlia0tZRC9GRjNJUmh6M0NzS2xTMGpyTnV3V2c4bXpwdGxUdERGd1NwVU5W?=
 =?utf-8?B?cjFydkhCQmpUYXlrTkk0NmtBV1RyYWhrYTR0QUUvMVo2dm5HQUgwbDhVdWNp?=
 =?utf-8?B?QnRwTSs3bHgvbUdMSTlsZEhncUVlbHVaUHpxRkR0bHU3a1ZkVUNmS0RvR1d1?=
 =?utf-8?B?S2s4amR4Zmhsb2g5VyttbFRGVVllNDEwZGo0U0JOaHh0Ym1rL0ZSeFRGQ0Rw?=
 =?utf-8?B?czZCUTNJcGVWcUxSb2VtOHVEcDJUVHc3WFpTSUNBMXpFcjRqaVVGWEg2aHJ0?=
 =?utf-8?B?SjZIOHduS0x5UkI4TFdNb0lnUFRwZHdSdElGL3JESnRoL1hackZMRW1zMity?=
 =?utf-8?B?RXp1NnJCWmw0WHdFSHYrQmRxRTFoOGt1YzZ2MEhJalJPL21rdkZ1elRuUytq?=
 =?utf-8?B?ejZUMG9FVUw2emMrZFNvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CD29D13F693DB4995AF0EAED5085205@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afdd56c-7212-4445-402a-08d98cd3019a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 16:20:14.1982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z81k1n+PZ9oSEoUFNuPqKpkKvxTmKtQZOytQIL7cYfPjHeEmNiITR56GAHb9QeQXvcNf6OKo7Yi2LoSB/gEP4c7He5FfXv1BxImSk/4tGk9POVjLfFYQZa4G0RBOGnU6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6963
X-Proofpoint-GUID: lDYFYIOewII55j5TQMIcWvRY2d2y0hFr
X-Proofpoint-ORIG-GUID: lDYFYIOewII55j5TQMIcWvRY2d2y0hFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-11_05,2021-10-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110096

DQoNCk9uIDExLjEwLjIxIDE5OjEyLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPiBIaSBSb2dl
ciwNCj4NCj4+IE9uIDExIE9jdCAyMDIxLCBhdCAxMTo1MSwgUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIFdlZCwgT2N0IDA2LCAyMDIxIGF0
IDA2OjQwOjM0UE0gKzAxMDAsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+IFRoZSBleGlzdGluZyBW
UENJIHN1cHBvcnQgYXZhaWxhYmxlIGZvciBYODYgaXMgYWRhcHRlZCBmb3IgQXJtLg0KPj4+IFdo
ZW4gdGhlIGRldmljZSBpcyBhZGRlZCB0byBYRU4gdmlhIHRoZSBoeXBlciBjYWxsDQo+Pj4g4oCc
UEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRk4oCdLCBWUENJIGhhbmRsZXIgZm9yIHRoZSBjb25maWcg
c3BhY2UNCj4+PiBhY2Nlc3MgaXMgYWRkZWQgdG8gdGhlIFhlbiB0byBlbXVsYXRlIHRoZSBQQ0kg
ZGV2aWNlcyBjb25maWcgc3BhY2UuDQo+Pj4NCj4+PiBBIE1NSU8gdHJhcCBoYW5kbGVyIGZvciB0
aGUgUENJIEVDQU0gc3BhY2UgaXMgcmVnaXN0ZXJlZCBpbiBYRU4NCj4+PiBzbyB0aGF0IHdoZW4g
Z3Vlc3QgaXMgdHJ5aW5nIHRvIGFjY2VzcyB0aGUgUENJIGNvbmZpZyBzcGFjZSxYRU4NCj4+PiB3
aWxsIHRyYXAgdGhlIGFjY2VzcyBhbmQgZW11bGF0ZSByZWFkL3dyaXRlIHVzaW5nIHRoZSBWUENJ
IGFuZA0KPj4+IG5vdCB0aGUgcmVhbCBQQ0kgaGFyZHdhcmUuDQo+Pj4NCj4+PiBGb3IgRG9tMGxl
c3Mgc3lzdGVtcyBzY2FuX3BjaV9kZXZpY2VzKCkgd291bGQgYmUgdXNlZCB0byBkaXNjb3ZlciB0
aGUNCj4+PiBQQ0kgZGV2aWNlIGluIFhFTiBhbmQgVlBDSSBoYW5kbGVyIHdpbGwgYmUgYWRkZWQg
ZHVyaW5nIFhFTiBib290cy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxy
YWh1bC5zaW5naEBhcm0uY29tPg0KPj4+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4gLS0tDQo+Pj4gQ2hhbmdlIGluIHY1Og0KPj4+
IC0gQWRkIHBjaV9jbGVhbnVwX21zaShwZGV2KSBpbiBjbGVhbnVwIHBhcnQuDQo+Pj4gLSBBZGRl
ZCBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pg0KPj4+IENoYW5nZSBpbiB2NDoNCj4+PiAtIE1vdmUgYWRkaXRpb24gb2YgWEVOX0RPTUNUTF9D
REZfdnBjaSBmbGFnIHRvIHNlcGFyYXRlIHBhdGNoDQo+Pj4gQ2hhbmdlIGluIHYzOg0KPj4+IC0g
VXNlIGlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKCkgaW4gcGxhY2Ugb2YgcGNpX3Bhc3N0aHJv
dWdoX2VuYWJsZWQgdmFyaWFibGUNCj4+PiAtIFJlamVjdCBYRU5fRE9NQ1RMX0NERl92cGNpIGZv
ciB4ODYgaW4gYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnKCkNCj4+PiAtIFJlbW92ZSBJU19F
TkFCTEVEKENPTkZJR19IQVNfVlBDSSkgZnJvbSBoYXNfdnBjaSgpDQo+Pj4gQ2hhbmdlIGluIHYy
Og0KPj4+IC0gQWRkIG5ldyBYRU5fRE9NQ1RMX0NERl92cGNpIGZsYWcNCj4+PiAtIG1vZGlmeSBo
YXNfdnBjaSgpIHRvIGluY2x1ZGUgWEVOX0RPTUNUTF9DREZfdnBjaQ0KPj4+IC0gZW5hYmxlIHZw
Y2kgc3VwcG9ydCB3aGVuIHBjaS1wYXNzdGhvdWdoIG9wdGlvbiBpcyBlbmFibGVkLg0KPj4+IC0t
LQ0KPj4+IC0tLQ0KPj4+IHhlbi9hcmNoL2FybS9NYWtlZmlsZSAgICAgICAgIHwgICAxICsNCj4+
PiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICAgICB8ICAgNCArKw0KPj4+IHhlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYyAgIHwgICAzICsNCj4+PiB4ZW4vYXJjaC9hcm0vdnBjaS5jICAgICAg
ICAgICB8IDEwMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4geGVuL2Fy
Y2gvYXJtL3ZwY2kuaCAgICAgICAgICAgfCAgMzYgKysrKysrKysrKysrDQo+Pj4geGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvcGNpLmMgfCAgMTggKysrKysrDQo+Pj4geGVuL2luY2x1ZGUvYXNtLWFy
bS9kb21haW4uaCAgfCAgIDcgKystDQo+Pj4geGVuL2luY2x1ZGUvYXNtLXg4Ni9wY2kuaCAgICAg
fCAgIDIgLQ0KPj4+IHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oIHwgICA3ICsrKw0KPj4+
IHhlbi9pbmNsdWRlL3hlbi9wY2kuaCAgICAgICAgIHwgICAyICsNCj4+PiAxMCBmaWxlcyBjaGFu
Z2VkLCAxNzkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+PiBjcmVhdGUgbW9kZSAx
MDA2NDQgeGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJj
aC9hcm0vdnBjaS5oDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL01ha2VmaWxl
IGIveGVuL2FyY2gvYXJtL01ha2VmaWxlDQo+Pj4gaW5kZXggNDRkN2NjODFmYS4uZmI5Yzk3NmVh
MiAxMDA2NDQNCj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vTWFrZWZpbGUNCj4+PiArKysgYi94ZW4v
YXJjaC9hcm0vTWFrZWZpbGUNCj4+PiBAQCAtNyw2ICs3LDcgQEAgaWZuZXEgKCQoQ09ORklHX05P
X1BMQVQpLHkpDQo+Pj4gb2JqLXkgKz0gcGxhdGZvcm1zLw0KPj4+IGVuZGlmDQo+Pj4gb2JqLSQo
Q09ORklHX1RFRSkgKz0gdGVlLw0KPj4+ICtvYmotJChDT05GSUdfSEFTX1ZQQ0kpICs9IHZwY2ku
bw0KPj4+DQo+Pj4gb2JqLSQoQ09ORklHX0hBU19BTFRFUk5BVElWRSkgKz0gYWx0ZXJuYXRpdmUu
bw0KPj4+IG9iai15ICs9IGJvb3RmZHQuaW5pdC5vDQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9kb21haW4uYyBiL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4+IGluZGV4IDM2MTM4YzFi
MmUuLmZiYjUyZjc4ZjEgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+
Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+Pj4gQEAgLTM5LDYgKzM5LDcgQEANCj4+
PiAjaW5jbHVkZSA8YXNtL3ZnaWMuaD4NCj4+PiAjaW5jbHVkZSA8YXNtL3Z0aW1lci5oPg0KPj4+
DQo+Pj4gKyNpbmNsdWRlICJ2cGNpLmgiDQo+Pj4gI2luY2x1ZGUgInZ1YXJ0LmgiDQo+Pj4NCj4+
PiBERUZJTkVfUEVSX0NQVShzdHJ1Y3QgdmNwdSAqLCBjdXJyX3ZjcHUpOw0KPj4+IEBAIC03Njcs
NiArNzY4LDkgQEAgaW50IGFyY2hfZG9tYWluX2NyZWF0ZShzdHJ1Y3QgZG9tYWluICpkLA0KPj4+
ICAgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgJiYgKHJjID0gZG9tYWluX3Z1YXJ0X2lu
aXQoZCkpICkNCj4+PiAgICAgICAgICBnb3RvIGZhaWw7DQo+Pj4NCj4+PiArICAgIGlmICggKHJj
ID0gZG9tYWluX3ZwY2lfaW5pdChkKSkgIT0gMCApDQo+Pj4gKyAgICAgICAgZ290byBmYWlsOw0K
Pj4+ICsNCj4+PiAgICAgIHJldHVybiAwOw0KPj4+DQo+Pj4gZmFpbDoNCj4+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jDQo+Pj4gaW5kZXggYzVhZmJlMmUwNS4uZjRjODliZGU4YyAxMDA2NDQNCj4+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMNCj4+PiBAQCAtMzA1Myw2ICszMDUzLDkgQEAgdm9pZCBfX2luaXQgY3JlYXRlX2Rv
bTAodm9pZCkNCj4+PiAgICAgIGlmICggaW9tbXVfZW5hYmxlZCApDQo+Pj4gICAgICAgICAgZG9t
MF9jZmcuZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfaW9tbXU7DQo+Pj4NCj4+PiArICAgIGlmICgg
aXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQoKSApDQo+Pj4gKyAgICAgICAgZG9tMF9jZmcuZmxh
Z3MgfD0gWEVOX0RPTUNUTF9DREZfdnBjaTsNCj4+IEkgdGhpbmsgSSdtIGNvbmZ1c2VkIHdpdGgg
dGhpcy4gWW91IHNlZW0gdG8gZW5hYmxlIHZQQ0kgZm9yIGRvbTAsIGJ1dA0KPj4gdGhlbiBkb21h
aW5fdnBjaV9pbml0IHdpbGwgc2V0dXAgdHJhcHMgZm9yIHRoZSBndWVzdCB2aXJ0dWFsIEVDQU0N
Cj4+IGxheW91dCwgbm90IHRoZSBuYXRpdmUgb25lIHRoYXQgZG9tMCB3aWxsIGJlIHVzaW5nLg0K
PiBJIHRoaW5rIGFmdGVyIHRoZSBsYXN0IGRpc2N1c3Npb25zLCBpdCB3YXMgZGVjaWRlZCB0byBh
bHNvIGluc3RhbGxlZCB0aGUgdnBjaQ0KPiBoYW5kbGVyIGZvciBkb20wLiBJIHdpbGwgaGF2ZSB0
byBsb29rIGludG8gdGhpcyBhbmQgY29tZSBiYWNrIHRvIHlvdS4NCj4gQE9sZWtzYW5kcjogQ291
bGQgeW91IGNvbW1lbnQgb24gdGhpcy4NClllcywgd2UgZG8gdHJhcCBEb20wIGFzIHdlbGwuIFRo
ZSBEb20wIHRyYXBzIGFyZSBub3QgaW4gdGhpcyBzZXJpZXMsIGJ1dA0KYXJlIGluIG1pbmUgYXMg
aXQgbmVlZHMgbW9yZSBwcmVwYXJhdG9yeSB3b3JrIGZvciB0aGF0LiBQbGVhc2Ugc2VlIFsxXQ0K
DQpUaGFuayB5b3UsDQpPbGVrc2FuZHINCg0KWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvMjAyMTEwMDgwNTU1MzUuMzM3NDM2LTktYW5kcjIw
MDBAZ21haWwuY29tLw==

