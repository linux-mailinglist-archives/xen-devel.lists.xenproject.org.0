Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E1543C6BE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 11:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216801.376540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffVd-00006X-2l; Wed, 27 Oct 2021 09:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216801.376540; Wed, 27 Oct 2021 09:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffVc-0008WE-V2; Wed, 27 Oct 2021 09:46:12 +0000
Received: by outflank-mailman (input) for mailman id 216801;
 Wed, 27 Oct 2021 09:46:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lYk=PP=epam.com=prvs=0934bd4bd6=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mffVb-0008W8-Vs
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:46:12 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6cb3706-a78a-42dc-8098-e8b79ca7aa71;
 Wed, 27 Oct 2021 09:46:11 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R9SilI027539; 
 Wed, 27 Oct 2021 09:46:09 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 by mx0a-0039f301.pphosted.com with ESMTP id 3by2x9rfbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 09:46:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4308.eurprd03.prod.outlook.com (2603:10a6:208:ce::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 09:46:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 09:46:06 +0000
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
X-Inumbo-ID: b6cb3706-a78a-42dc-8098-e8b79ca7aa71
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hW76mk+6I5xpfyvC+8t8ICHgWvUuctkINpzoUM9dAJvQTban+KU2fl8vjQcyxb9aF1bxDLlE0eDVHRbAd8N8qSMwJY/2yZn39//4hYRGIJJ0dot4KimhNz5rHSX/sJa1YtoENzDzRomNqolwa33fFL/D3O9peQO8p+kdOU1xzpO8DB8UrjWvPxyKoXjF8IwNitk+EUmDuVP/eAe+N+sXbSwifADHVLC0kveQ5gJe8j/9vqo0VnN8MdqhvihiomZlu8pmzPeJ82HfAfRYziuL7Ysfqqx40yeHrPCuUMPbXK+sKbqZc9dn9OcaLOaOZ11DvMwMpN9PBUkmz7lrH7iZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWcTn89i7Mn/dAYxkBX410tb9WadxnadmchSVN5TjUY=;
 b=KNdY9wkWxPHLUeY3VUfDbW7cX6OAYsOFtnvO3NgxbzsA7r5S3Fp0RTEyipwx3Uu2+JiKwr68GbiSOEiUiPj7TqipUUdHBNkGXRvHetBS3xuoFdSsBH/0fL0pAnK+eYd2nz/b6WfgdNdjuVeloht+SVBbDS4zzX7XhASnJjkW7yxZBHyD03vafNCdOhyoq9A0THF+aVijDEKukrivigS4AAZSg0Rxv2lp4CaknzWTYgryYBahQcgYi0LmMACthqZcxKZVz0dICrF01eux8HAPsDOFUAxBedoYqGBL9QujVpSyIJU5NNoO6cHToS1AJ2aOMT7daYJPByQcKfBHjKpBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWcTn89i7Mn/dAYxkBX410tb9WadxnadmchSVN5TjUY=;
 b=PQn0h63sJfTRmkc2Ov2zWLm/m7mHOjm3oa8Psg/pkaJnkjEJLidmOHRAHTMvkPPfWHP0ydDo9GmMS7OoX5d4DUdnbOuX+5Vj6x+Z/wB1PnIo+OJmt4FPbeaaT3d7a0EX0Hoq4gdF/X2tgkF7S/UGKNeaWrszfkN8W5FmS7c3JJZTSMBe7odieQzGPB5G3lh7/iQ3O+u463vDVsBocs7lu5RE7nUoKC6zQdhkEe/ykpk5CamhXJjGE3mBzd+8XJAG0UnGJapEqqNFZe/tsjbgyTrt3wenHubxmF7MxKSmQjzmAA/YfhxWW2fhh4oKZJwz/LzhnpRMZMU6NKfMto4f+A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Topic: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Index: AQHXyww6rKHs3LJru0q52eLUia+oNavmi9YAgAABaACAAAVYAIAABjyA
Date: Wed, 27 Oct 2021 09:46:06 +0000
Message-ID: <19e92d29-d3dd-06dc-5a1c-15ee33a106de@epam.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <YXkU+DKYmvwo+kak@Air-de-Roger>
 <0bbe4d1d-421d-e816-42aa-f43581902a02@epam.com>
 <YXkaov2E5CdWRjlr@Air-de-Roger>
In-Reply-To: <YXkaov2E5CdWRjlr@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88d3dc0d-9e73-4db5-049f-08d9992e98ee
x-ms-traffictypediagnostic: AM0PR03MB4308:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4308110CAFD67BC16C284B73E7859@AM0PR03MB4308.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mCJfdVkXRWtzLssbHtdd+2UXkta/sgEguJ0u8+PDsWS012ymoQ0qoyu3almkoDYn3yz+skQcx8CKNqrhgICs9ivd30Xqo/49qGIYroZQmPwgkWDpJminK+vbW3Ds1iSdvG8XB9+CZBZvcYs/nHmp/q7j6UOPCcj4aJRPLoGzUQ5HfllSoiCpu0IqDlky+6kh6K+xQ6RoAkXJCzZQFmsAGKhNEcjODsP9Gjq/w2m8sTtUPq3QLXgwYG+U8K9VxjsaxXH2CpVKYdRjTffAXTb2+ts9zaT1aUl7pR8krtyr4ooIYVDIh6QdAWXfVZk+TcxNdARqtHeKcceXkvnrEqp8X6aPeSQOQJfaA7e+u4WdGFyGFGRYS0JUFS4qT6bh2GqIMozkr89gbD50k8kDHR3kluDMKTCxIeLTntFjZsCFgNJty24gsA77+8gzB4Msknpk+Rz1eigqRE9872NJTXSuVfo5Y4HEx+06iHVfDrxq2MdQ57zXojpA6ASnwwappzgQcH8rac0MewNuei0L0B7fb9GbNuRmr9FK0HGTbaw8ksbU4axinFBcU6Qo3i243eYt7vsVDcoYgUvx+UqBIhWFqwNhv7MbmYww+QGhxCFz4piOBxUo/jlNFZl/xzSJjuyKu/TbFyGcFpFXcUQ1othsEsI6PHPMQjlcbaFyNmlg5UZriugGWMNqore79vrhCEyQR3ls8ZMqtteZm4PijsPP+7j2ouw62QtCYoYTOAMHEFgmV/7ajOuYf0Jv2mqKH2t/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(6506007)(53546011)(38070700005)(2616005)(6916009)(31696002)(31686004)(76116006)(91956017)(86362001)(26005)(6486002)(71200400001)(66946007)(64756008)(38100700002)(66446008)(186003)(4326008)(8676002)(83380400001)(2906002)(5660300002)(54906003)(107886003)(508600001)(6512007)(122000001)(66476007)(66556008)(316002)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eEdlQWtIcTgxWGpZczhySTJKN2lUVFhOZ3FDYWJBVlpZeEVSOXpkSzh3dW1Y?=
 =?utf-8?B?N2V4V3phYWNTdUVkU0hMSjB1dGFnOHlUUm1GdHFLN3dWVzlRbVdCbGVKbzFw?=
 =?utf-8?B?cG52UjZ0bElmbDhwSHNabEFEZkhabnl6ZWY2ZGFNUGZ1QlQrSCtjcVJHYmdr?=
 =?utf-8?B?dEs3UVN0SXUwV2l4OEhPMzcvaWdXT3hTR1pzcVdGYjVhYzNnR3dnQkovR2Vl?=
 =?utf-8?B?M2l3MTZqcXFWQUgwZkloSEo1NFMvSUhRNWtsMEpOSlptdHVBcFVBZDRJdzR4?=
 =?utf-8?B?WXkwT2lSd0xieXRyYWZUdUZtdjVvRzhwSlFNVDJWMVpSNzh4T3JUZGdGejBn?=
 =?utf-8?B?T2ZNUlJ0YThRZVJNMTNhaGhzaTd1NGQ1L05qRCtvZnJRS0Mra3gzVHVXWkxM?=
 =?utf-8?B?S2pncmZCd2REK2JSeEhXd1dpQVFabVdjOW94UjAxVWh6SkxlNVFma1A3REM5?=
 =?utf-8?B?VFJKOHJEMVZnZkJlVXU4cGlDMXY3cklsZjVZSGlwOUlQMEJCS2JqSUtlZUhr?=
 =?utf-8?B?Rkwxcmp3bnVXVlBtMWk2c1ZLY3NwTnFoSFBjTGVZQ0ZzZVB4anpQcUpON1Bs?=
 =?utf-8?B?NG9yeUVkbnlUNVRYTEcwZzB3K2VMcHNwalJYSGZTVko2TWQ2cm9SL3BoMXdi?=
 =?utf-8?B?Zk00TGc0cHNZSENHYjV1WVhnNFhHWi9rMVFrRGgreUFWRW1wL0dZK241SkVl?=
 =?utf-8?B?SEI0akxweDZMdmFWanphMitiZmVYbkl2a2p1MzBxL09TMVNvR01jb0lSQk9s?=
 =?utf-8?B?cS82NGZOMjIybzJHQ2grZ3hnOU5sc0pIeTd0cU03M2I2aENhbFJEYVF4aW9Q?=
 =?utf-8?B?SVhiWFFiWmFtS2YxN2tnS3g3bmJyNXlVbDE4M3dzSFpZdTdEYjFOaVJOZVhh?=
 =?utf-8?B?NzdqT0lGelV1ak1LZjJzbDFzeVlCQUVDVitzL09QZ0diRm1IOU83QlJ4RGUz?=
 =?utf-8?B?U3pudENCMDJPRUtzNGFKbThBN2FHd2h2SDdCRStUYmJGbTloMjBpa2pWTmtQ?=
 =?utf-8?B?UEV5YTZ0R1M1OWlWY0F1ZFVSeFkvQjltVmEzRFdsTkxUYWpNYy9HU0ZiQjdw?=
 =?utf-8?B?SUNLVTltbjdPdnYwWWNuVWU5Y2FvUjZHOUh2SnJqV3JINmhheXA3a05Vb3gr?=
 =?utf-8?B?czFHb29wMmdnbjRtNGVEODhWZUZORzR0dFM4c0FTd015NlhtME1wNjk2TUtI?=
 =?utf-8?B?SUs4cEZid2JvMVJFeGI2NlNCNVJ1RDE3NVRLc01qRHZvN293cHRqTk1PNWJi?=
 =?utf-8?B?YzRXajVucW0zelliT240YUdHUi84SDlINU9icTBLMmJwcHJvREZhSHRlWWc4?=
 =?utf-8?B?bUE3OTdrS1lqMmpuSVk2U25vbHlESXczYklPMEhSLzA2M3ZKeHh0RjZacWpX?=
 =?utf-8?B?Y2dLVjJVNVByMUkxeE5ubWJtYjlhVEI4ZTQySjZraDNrQlNKVm1zM1lpYUxs?=
 =?utf-8?B?NDhrbDlKckU0czU1NEpHTStmUmJmNGFUL3FQbWZaNGpDMWNBbmR3eVlXYmxB?=
 =?utf-8?B?U0lXeEZWZFJEaUNncjdaa09OdmgzMmV3bWdmYVhiVE5LWVZYYjVGbjVqYnlY?=
 =?utf-8?B?d0taVUx0elpJTDhkdWswNEp0eUVzVm1xUmd2VzRPbTdOQ2U1eCtvT25nSG1l?=
 =?utf-8?B?ZzIxNEYxa0UzRUdOT0d2NUZiWmtiL3lZeXlNUmdZSzRBelhjSUpCQ2dVNHlu?=
 =?utf-8?B?K05QU3ZMK2xTOXlKSnNqK2RSVW5DUVdVMjhJczQ1dC8zajRtVUNzT1p5L0RP?=
 =?utf-8?B?eUMybTU4bE5GWnYyTXU4RFBIVi9HcHJ0eFNldGpFcjlkSXcvWVFFa3E4aXpL?=
 =?utf-8?B?Z2J6Mng0czV0YThpK2hMT0V4ZjdyNHhKNktZak9ibTFpNU5ocklOMWNIQnZJ?=
 =?utf-8?B?NTlhS1BSREFlWGFkWjA1RGFpRjRmWG8zbWhPZklrQkxxQUI3Qzk0V3ZOVXFs?=
 =?utf-8?B?UnFjRVRHUHY2dUxGNng0K2hXdW5nSm45U2JlNXpLeXliWmxqRFF3ek0rNG56?=
 =?utf-8?B?UjZZMkxVL09MbWdzN1FjYXc1V0piUS9JNk81Q3pjTTY5ZEVuZUJCdWRWYnlw?=
 =?utf-8?B?cU5PT2R5ODliR090RVFZcnZUbnNLZkhXa2xXK0FwN1g5NWE4V24yL2loMlZp?=
 =?utf-8?B?Q1hnNkFWck1ha2dsL2NpSDdsbUh1OE80akp3bzlPcGk4dWs0V2tzR0NTR08r?=
 =?utf-8?B?M0VSc0d5YkhHTWFMdFFNMUhCRVEzTldSSGZneUZmQTI2MTVpT2owYUVCeW1P?=
 =?utf-8?B?M0JKa3pDR0FEWit0WHRENzRBdDVnUFNLeEZKSnlYbGI1eVZpS2txR2hGNXJm?=
 =?utf-8?B?NERBOHgvUWtucDczUWROanBsRm43a2RRemJlQklsdnZKTUVQRld5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9E8834A3ED9F94A87B25A35D2478D0F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d3dc0d-9e73-4db5-049f-08d9992e98ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 09:46:06.1483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LwTXRxE66/bBGPg8SNx883CrSqiRqfKuNYY1GPvFdKSQZjWaptl4SjKAsoD72ias8o1qYSy/J9tHl3XRrZzT3M+yuOYNkUdYqzsInXcx+4qBPHYDrM592MUq4wzmqAj3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4308
X-Proofpoint-ORIG-GUID: Cl-4K7mzVEJKkwRQ_JSeP01N6xBuRtaK
X-Proofpoint-GUID: Cl-4K7mzVEJKkwRQ_JSeP01N6xBuRtaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_03,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270059

DQoNCk9uIDI3LjEwLjIxIDEyOjIzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQs
IE9jdCAyNywgMjAyMSBhdCAwOTowNDozOUFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEhpLCBSb2dlciENCj4+DQo+PiBPbiAyNy4xMC4yMSAxMTo1OSwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBXZWQsIE9jdCAyNywgMjAyMSBhdCAxMToyNTozM0FN
ICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gRnJvbTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+
Pg0KPj4+PiBXaGlsZSBpbiB2UENJIE1NSU8gdHJhcCBoYW5kbGVycyBmb3IgdGhlIGd1ZXN0IFBD
SSBob3N0IGJyaWRnZSBpdCBpcyBub3QNCj4+Pj4gZW5vdWdoIGZvciBTQkRGIHRyYW5zbGF0aW9u
IHRvIHNpbXBseSBjYWxsIFZQQ0lfRUNBTV9CREYoaW5mby0+Z3BhKSBhcw0KPj4+PiB0aGUgYmFz
ZSBhZGRyZXNzIG1heSBub3QgYmUgYWxpZ25lZCBpbiB0aGUgd2F5IHRoYXQgdGhlIHRyYW5zbGF0
aW9uDQo+Pj4+IGFsd2F5cyB3b3JrLg0KPj4+IEkgdGhpbmsgSSd2ZSBhbHJlYWR5IHJhaXNlZCB0
aGlzIGR1cmluZyByZXZpZXcgWzBdLiBCdXQgdGhpcyBpcyBvbmx5IGENCj4+PiBwcm9ibGVtIGlm
IHlvdSBjaGFuZ2UgdGhlIGN1cnJlbnQgdmFsdWUgb2YgR1VFU1RfVlBDSV9FQ0FNX0JBU0UNCj4+
PiBBRkFJQ1QsIGFzIHRoZSBjdXJyZW50IHZhbHVlIGhhcyBiaXRzIFswLDI3XSBjbGVhci4NCj4+
IEV4YWN0bHksIHNvIHdlIHdlcmUganVzdCBsdWNreSBub3QgdG8gaGl0IHRoaXMgYmVmb3JlDQo+
Pj4gSSBhc3N1bWUgdGhpcyBpcyBhIHByb2JsZW0gZm9yIHRoZSBoYXJkd2FyZSBkb21haW4gdGhh
dCBuZWVkcyB0byB0cmFwDQo+Pj4gcmFuZG9tIGJhc2UgYWRkcmVzc2VzIGFzIHByZXNlbnQgb24g
aGFyZHdhcmUsIGJ1dCB0aGF0IGNvZGUgaGFzbid0DQo+Pj4gYmVlbiBjb21taXR0ZWQgeWV0Lg0K
Pj4gWWVzLCBJIGFtIGZhY2luZyB0aGlzIG9uIHRoZSByZWFsIEhXIHdoZW4gRG9tMCdzIGFjY2Vz
cyBpcyB0cmFwcGVkDQo+PiBhbmQgdGhlIGJhc2UgaXMgbm90IHRha2VuIGludG8gYWNjb3VudC4g
U28sIEkgaGF2ZSBhIHBhdGNoIGZvciB0aGUNCj4+IGZ1dHVyZSB1cHN0cmVhbSB3aGljaCBzdWJ0
cmFjdHMgdGhlIHJlbGV2YW50IGJhc2UgZnJvbSB0aGUgZ3BhLA0KPj4gZS5nLiBlaXRoZXIgR1VF
U1RfVlBDSV9FQ0FNX0JBU0Ugb3IgYnJpZGdlLT5jZmctPnBoeXNfYWRkcg0KPj4+IElmIHRoYXQn
cyBpbmRlZWQgdGhlIGNhc2UsIHBsZWFzZSBleHBhbmQgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIGNv
bnRhaW4NCj4+PiB0aGlzIGluZm9ybWF0aW9uLg0KPj4gSSBjYW4gb25seSBtZW50aW9uIGFib3V0
ICJ0aGUgY3VycmVudCB2YWx1ZSBvZiBHVUVTVF9WUENJX0VDQU1fQkFTRQ0KPj4gQUZBSUNULCBh
cyB0aGUgY3VycmVudCB2YWx1ZSBoYXMgYml0cyBbMCwyN10gY2xlYXIiIGFzIG9mIG5vdyBiZWNh
dXNlDQo+PiBEb20wIHRyYXBzIGFyZSBub3QgeWV0IHRoZXJlLg0KPiBJbmRlZWQsIEkgd291bGQg
cmF0aGVyIG1lbnRpb24gYm90aCBjYXNlcywgaWU6DQo+DQo+ICJUaGlzIGNoYW5nZSBpcyBub3Qg
c3RyaWN0bHkgcmVxdWlyZWQgZ2l2ZW4gdGhlIGN1cnJlbnQgdmFsdWUgb2YNCj4gR1VFU1RfVlBD
SV9FQ0FNX0JBU0Ugd2hpY2ggaGFzIGJpdHMgMCB0byAyNyBjbGVhciwgYnV0IGNvdWxkIGNhdXNl
DQo+IGlzc3VlcyBpZiBzdWNoIHZhbHVlIGlzIGNoYW5nZWQsIG9yIHdoZW4gaGFuZGxlcnMgZm9y
IGRvbTAgRUNBTQ0KPiByZWdpb25zIGFyZSBhZGRlZCBhcyB0aG9zZSB3aWxsIGJlIG1hcHBlZCBv
dmVyIGV4aXN0aW5nIGhhcmR3YXJlDQo+IHJlZ2lvbnMgdGhhdCBjb3VsZCB1c2Ugbm9uLWFsaWdu
ZWQgYmFzZSBhZGRyZXNzZXMuIg0KU291bmRzIGdvb2QsIHdpbGwgYWRkDQo+DQo+IFJlZ2FyZHMs
IFJvZ2VyLg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

