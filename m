Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 612034084AD
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 08:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185426.334073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPfR9-0006Up-86; Mon, 13 Sep 2021 06:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185426.334073; Mon, 13 Sep 2021 06:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPfR9-0006RO-3e; Mon, 13 Sep 2021 06:27:27 +0000
Received: by outflank-mailman (input) for mailman id 185426;
 Mon, 13 Sep 2021 06:27:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xuNF=OD=epam.com=prvs=989052e8b7=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mPfR7-0006Qn-8c
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 06:27:25 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f81c615-310f-49c2-8464-276381968571;
 Mon, 13 Sep 2021 06:27:24 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18D5YZKf022515; 
 Mon, 13 Sep 2021 06:27:21 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b1urvrfes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 06:27:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6210.eurprd03.prod.outlook.com (2603:10a6:20b:15f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 06:27:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 06:27:18 +0000
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
X-Inumbo-ID: 2f81c615-310f-49c2-8464-276381968571
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRGHGXdl7NFOTWcEqeXEpZ4NG/HO+OZbRUXXV9hy6BzNYGt9/xkn6ELTvkOc5QafRjqLe6x3Icg7FqnL+klItZyZFRSbxP634eF4SGovI98BSI1FMaFMpybvfsfW5ZiMrFTVlKb+cnCOhsNswl8TRitsXQysZ4Mg4xpLIE0bHIIyhT0GCu3tPsI1qt3ulB6y1nLpWo63ljORtcuePG93L9cUUzhYOFiqrXwgP15r3oT4xH7fO30cSZokoAH4RpjyGPM1lDNTfK2+OaqOKp7G+VAdx92I6Qdllun+pClWxN8seviPgng0dmX6C6sd/vs/OCCyTRJFC5Vfe102mjpUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=sIvjLVGHt/eEiAna3F5S2ufDXZC8QJ9KZpHECwaw8W8=;
 b=VfhVJ8dQGsAa9gB9XeI+t9u8ln+OWc6iPJl4WRkVCdDzOffq8HKMg9vCbxIGA3CVXcUHjCgJ5lIOC3t2ekoOYWnqAMyaGsz4GUx0E77dE5NCTNEQwl9abTfRIZ+KoRpZEBtMWJQAQ5f6SPjtdAy1vR9jdfli1BsGg/B/QDlOg+ijM2NWUU84UuE+BmBj1isuvVr3gzsggDlAOFFeEnjOHS1pt+dLuY55jgfk3A2WgTTOeD1Cg/pB4DpRCDHpnoFRtxWTmGVplbjfdsvNQTljoaYkz75IyTIoWxs8PFNcM9QPeGwsuY84dJprwDZVpV5NZ1KyYyPHwXOhxFovz4sxEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIvjLVGHt/eEiAna3F5S2ufDXZC8QJ9KZpHECwaw8W8=;
 b=Xyut4IBlHm6WgO77CCS4zMnrpvLEpHpRfGqFrsQnA3BoJp6Pt+Ml0MiLASYOjTysZQsJnpzKHUc/q39rW3Wfi6xv7bmvX27W07kbrUZOjdKbBXzgOIwVOxypqD/0AfRDmmIe7UjJSrFI/lG+mL1iWHpnwgoryAdGOIyDd7svuf0kv/waY/6jR7KEX01+8vF2BCtgPdp/2tTIS+r3L6cfG5vi1CQhwbYdE+39s5i2xNtKlf0bAcHnsZtoplBR9Kn4AGD7HEJMA+TqSrwwmGO0x7ifx81LpHlN2PuErljhro87Ew/U2xDwgv2VJE5CfMJCm/4Q8R46OUzEnrGlakpJpg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien.grall.oss@gmail.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>,
        xen-devel
	<xen-devel@lists.xenproject.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Topic: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Index: 
 AQHXoJ50hf+zXQhc2ka7YfmmERKX+aucB06AgAE4wYCAAAtRgIAADDiAgAARZwCAAFsJAIAAFA4AgAO3eIA=
Date: Mon, 13 Sep 2021 06:27:18 +0000
Message-ID: <3ecfc742-b720-0381-dbd8-7147615494c8@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-11-andr2000@gmail.com>
 <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org>
 <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com>
 <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org>
 <15a930ff-77d5-b962-b346-c586a2769009@epam.com>
 <684b3534-40eb-add7-f46e-c6258904757b@xen.org>
 <alpine.DEB.2.21.2109101325110.10523@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1pSoLpesjqNTiG3-t4+pvju3EetYzcFpuNzMdRWi1GYg@mail.gmail.com>
In-Reply-To: 
 <CAJ=z9a1pSoLpesjqNTiG3-t4+pvju3EetYzcFpuNzMdRWi1GYg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a108129b-5282-457d-f3e3-08d9767f8925
x-ms-traffictypediagnostic: AM0PR03MB6210:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB62106F5B34E713E8060C6339E7D99@AM0PR03MB6210.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 02ZkYNpvTNrj5iQhbhthQr9PqoxV+2M0MKdTKiMLXu5320nPDbwh0aeRDWzXrzwiAMPTT6Eab0Sc60IRg8sIbap5/Dd49XZia8EjtQvoAU5gMBD8/npS5BXFhuOIocubbCGEI4YWf2BGj0nQPB8heGaua+8armXNjR6XN6apk6ToRopzh7rJuQypwGBZmRN3QKKvsjQH3q9dJJhJzkedPo4gZJHSokcAtfrBYXzWiKQDdv2dZiZqeigNj6DjEDdjPe7Wz8WgKYYbVfnD/pwqwre7SYFoMcVRnTXAQQa7+N5REPxOJqEcZB4hid6cST8QAqLY8FTVrlu/aZfrFE4qbZsgIBplmzEow91QuDkn1C50GDAQod1f/oN/nNgAxWJrb9EkeazvkLs8tQXsT7O8ImX0znBwrL9c97YHVc04rheCM0/7Lj8EE1FRHHEe8u+oh4GYCFGsjKHy2afuAfL/b7bHljoSTmbRuP5AuvxXz8CmfhLkRYYZMxsT3yKFqYNkoVZEnwHD/qUoVhgTqO0oTy5r+T33cETNX7ZEzzBofPU5GNV0zPaIkIkYHWEd/5EHrYc9STtUZJRqNp7bdUGD++fUqffsWxM/1Dyg9Fl6o+Qw53ot7hTKqnouJ5jlv0tUIDd0b2KT0nQgX0Cc9dr63i/cqzSDLp124aLaVDO1QH3KwM1FC6CDOmNW2udGdhhQjaR4o69xGRTd9cF5GYMTtyyz4C3dc7g9NtC2b6OwVVwHJEbzx1O+xQLNP83OIc+k
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(478600001)(26005)(6486002)(64756008)(91956017)(122000001)(6512007)(38100700002)(110136005)(66446008)(31686004)(6506007)(186003)(66556008)(66476007)(8676002)(86362001)(76116006)(2616005)(5660300002)(83380400001)(36756003)(54906003)(31696002)(8936002)(38070700005)(66946007)(53546011)(55236004)(316002)(4326008)(2906002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ejVzcjMyTC9NKzB3akVNT1VHdmczVWRwdmZCS2xoR3BNODRGR1J5R01Mdy8z?=
 =?utf-8?B?TzdRQmFQVVVwWDJaeTR0dnFJTDVDZHljYzZ2bldsTWs2Zy9NWDh3MVE5TnhY?=
 =?utf-8?B?M2QrNGJaUDNCTEUrTmltL1FseG5mRFIyeS9JRU1LR0ZabkxnRk45UjZrb3p2?=
 =?utf-8?B?ZmE0NVo4ZjlpYjdjTFNBTmRmWXhyK3VjN002MWRxN1hrNXFyOEtnZHpUbzVY?=
 =?utf-8?B?RHdTRHJGTnowaXczcEdUa0YzR1A0YmZ5d1ZKOGFNZXpYZGQ1dGFrdHV0dm01?=
 =?utf-8?B?bUxYRzZITnkyM3lmYTN6R2VNMVhlTVROVXhaNmZVcitXSUlvUklGZm1IYUdV?=
 =?utf-8?B?bmVzZFV4aXFnRDNFZkVSRWYvZWpGUXBtZDRNQzZuMDFjNlNjV2hTS05WZis5?=
 =?utf-8?B?YktPaTZWVHNRc2dGaWhUbngrL01hRkgzUzlZdDNuM1VuRGp1bitBWUlNbnh0?=
 =?utf-8?B?ZitIWStLVXpGbjVNRVZZaFl5RUNQZ3N1Z3Z6RERnT3ZjR1RiTnRXZUVUeUJl?=
 =?utf-8?B?d3p1SmYxbGx1bUxBbTFHa3o5RUZaaG1DejhYQ29ZT05Weno2TGw4U003bGln?=
 =?utf-8?B?eTE2SlZiOU8wYURyZ2dndTltcUJ2UXIxcVNMYTN6ajVrWXgrSkxMQTQySzRV?=
 =?utf-8?B?YjRSVWJBQmUzeTNYa2pUNUpLa1VxOHJkb3ZEZUQ2YnVSQWN6UkRORjQwNWt3?=
 =?utf-8?B?ZzdudXFYZXJkRzRDOE5jMW1Gb3hGU1B0NXZzS3BqQVZiSGRCWUZuaU5XcTBD?=
 =?utf-8?B?d2ZGUS9LVmRibDdUL0NEQWJDbnh0ODdzeFQ3V2JPUDh5RXVGaG9NRllSSlYv?=
 =?utf-8?B?MWhVVGZNR3lOc0NLeXgxWXdyaW1PUitTNTh4ZHVCZVNNMUExazUxbEF1ZHpK?=
 =?utf-8?B?cWFCeGxHVDJrOWhlOUY0ZGxMZks1QS9FUEVnY1NIQm90WWVEcnI4U0U4c25t?=
 =?utf-8?B?OUk4UkpaV25pR2hwUlQxV1BkRFA0eTltazJyQ3VLV09yQVBUdC9vdmhkRmxj?=
 =?utf-8?B?Lzl6TlY3N0I3ZUlTS3R0cWlSbW9jVjZZdTU4dkNtVHZCZFZNS1c2LzJZaXpO?=
 =?utf-8?B?VUVLakt0TWdrN3RNYWZQditmQ2N2QmxUVTZhdkp4cGJQM2djVDFNaEJTYnUw?=
 =?utf-8?B?SmgzUFdKQkVXWkhaWGhLbkExZVd5VmpCSitheTBERkc0ZWpzMzF2SFFQQis5?=
 =?utf-8?B?amxIQXprNmJ2T3NRWk1EYm5DS0paMVZnVGlBVUVKb2pDMVU1TXhxQzVXZGNn?=
 =?utf-8?B?TjhVZWVHMHZEM0hzdExhL1JjcnlmUGJDWVJxMFZlK1ErQWtNNGRvNzNBRjNa?=
 =?utf-8?B?alpqZHJ3SWVsN3JScHVxS2JGZ3Zlb0ZVNXMrMnQveDVGeWx1c1lpMDJaUzBq?=
 =?utf-8?B?SldNSElvajQ0Y0JPK21wOFI0QXFEa2tmcDh3ME0zcy9QWXlJS3ZDOUFVMWZR?=
 =?utf-8?B?c3FhWVJaa3BtZXJ0TEV2RTE0Tis1a3duK05UVGxSTlM2MjFUMTJqdHo5V1lM?=
 =?utf-8?B?OVV2NktQeTF2TExITmdSdk1vVkpRRFNIQ2grL1VuUTFIRUlwTkJzUlBsM05l?=
 =?utf-8?B?aGg5bWd6bEhZV3J6VzBRUktoRlZZYldtMFZZY3ZqQTVVdDlHYThNS29LZTBv?=
 =?utf-8?B?SFEzdXhmdWY5ZTVsa1BTaTRBR3NNcGI5VTNZdURocy9rd1IxQTlQeFJvNVBm?=
 =?utf-8?B?OXd4a0pBYXJvc0k0ZjVyYjlUemtBaFZWSFVsZUxJU3VkbFJWRmltM0ppL1Zo?=
 =?utf-8?B?elhEa1dZbVZudVNlankvcmxiWXg5MEFwZTJYeVJVTllTek8yUVNqZEJnRTU5?=
 =?utf-8?B?VTEzOUhRTGMvQ3JzOXMzdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <917E9CBF014B534A80B8BB9984FE9002@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a108129b-5282-457d-f3e3-08d9767f8925
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 06:27:18.1713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AFGl8ohwxeshEYlf/Bsls9nm9oKTiIgfcFcBv1XsoN4+j3NvrkH+RTxoWgjZjYaE6pjdiEf5uRCMzMHUuooUiDQUvFmUHclhPV5zTNjSbWRCJRQfiwVqnln6M2QBAOwQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6210
X-Proofpoint-GUID: TctLKG0ppApGRgnf-RLptmJwnhzriVt9
X-Proofpoint-ORIG-GUID: TctLKG0ppApGRgnf-RLptmJwnhzriVt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_03,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 clxscore=1011 spamscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130041

DQpPbiAxMS4wOS4yMSAwMDo0MSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPg0KPg0KPiBPbiBGcmks
IDEwIFNlcCAyMDIxLCAyMTozMCBTdGVmYW5vIFN0YWJlbGxpbmksIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnIDxtYWlsdG86c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4+IHdyb3RlOg0KPg0KPiAgICAg
T24gRnJpLCAxMCBTZXAgMjAyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiAgICAgPiBPbiAxMC8w
OS8yMDIxIDE1OjAxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4gICAgID4gPiBP
biAxMC4wOS4yMSAxNjoxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiAgICAgPiA+ID4gT24gMTAv
MDkvMjAyMSAxMzozNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+ICAgICA+ID4g
PiA+IEhpLCBKdWxpZW4hDQo+ICAgICA+ID4gPg0KPiAgICAgPiA+ID4gSGkgT2xla3NhbmRyLA0K
PiAgICAgPiA+ID4NCj4gICAgID4gPiA+ID4gT24gMDkuMDkuMjEgMjA6NTgsIEp1bGllbiBHcmFs
bCB3cm90ZToNCj4gICAgID4gPiA+ID4gPiBPbiAwMy8wOS8yMDIxIDA5OjMzLCBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyB3cm90ZToNCj4gICAgID4gPiA+ID4gPiA+IEZyb206IE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbSA8bWFpbHRvOm9s
ZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPj4NCj4gICAgID4gPiA+ID4gPiA+DQo+ICAg
ICA+ID4gPiA+ID4gPiBIb3N0IGJyaWRnZSBjb250cm9sbGVyJ3MgRUNBTSBzcGFjZSBpcyBtYXBw
ZWQgaW50byBEb21haW4tMCdzIHAybSwNCj4gICAgID4gPiA+ID4gPiA+IHRodXMgaXQgaXMgbm90
IHBvc3NpYmxlIHRvIHRyYXAgdGhlIHNhbWUgZm9yIHZQQ0kgdmlhIE1NSU8gaGFuZGxlcnMuDQo+
ICAgICA+ID4gPiA+ID4gPiBGb3IgdGhpcyB0byB3b3JrIHdlIG5lZWQgdG8gbm90IG1hcCB0aG9z
ZSB3aGlsZSBjb25zdHJ1Y3RpbmcgdGhlDQo+ICAgICA+ID4gPiA+ID4gPiBkb21haW4uDQo+ICAg
ICA+ID4gPiA+ID4gPg0KPiAgICAgPiA+ID4gPiA+ID4gTm90ZSwgdGhhdCBkdXJpbmcgRG9tYWlu
LTAgY3JlYXRpb24gdGhlcmUgaXMgbm8gcGNpX2RldiB5ZXQNCj4gICAgID4gPiA+ID4gPiA+IGFs
bG9jYXRlZCBmb3INCj4gICAgID4gPiA+ID4gPiA+IGhvc3QgYnJpZGdlcywgdGh1cyB3ZSBjYW5u
b3QgbWF0Y2ggUENJIGhvc3QgYW5kIGl0cyBhc3NvY2lhdGVkDQo+ICAgICA+ID4gPiA+ID4gPiBi
cmlkZ2UgYnkgU0JERi4gVXNlIGR0X2RldmljZV9ub2RlIGZpZWxkIGZvciBjaGVja3MgaW5zdGVh
ZC4NCj4gICAgID4gPiA+ID4gPiA+DQo+ICAgICA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbw0KPiAgICAgPiA+ID4gPiA+ID4gPG9sZWtzYW5kcl9hbmRy
dXNoY2hlbmtvQGVwYW0uY29tIDxtYWlsdG86b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20+Pg0KPiAgICAgPiA+ID4gPiA+ID4gLS0tDQo+ICAgICA+ID4gPiA+ID4gPiB4ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmPCoMKgwqDCoMKgwqDCoCB8wqAgMyArKysNCj4gICAgID4gPiA+ID4g
PiA+IHhlbi9hcmNoL2FybS9wY2kvZWNhbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE3ICsr
KysrKysrKysrKysrKysrDQo+ICAgICA+ID4gPiA+ID4gPiB4ZW4vYXJjaC9hcm0vcGNpL3BjaS1o
b3N0LWNvbW1vbi5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKw0KPiAgICAgPiA+ID4gPiA+
ID4geGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEyICsrKysr
KysrKysrKw0KPiAgICAgPiA+ID4gPiA+ID7CoCDCoMKgIDQgZmlsZXMgY2hhbmdlZCwgNTQgaW5z
ZXJ0aW9ucygrKQ0KPiAgICAgPiA+ID4gPiA+ID4NCj4gICAgID4gPiA+ID4gPiA+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gICAgID4gPiA+ID4gPiA+IGIveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ICAgICA+ID4gPiA+ID4gPiBpbmRleCBkYTQyN2Yz
OTk3MTEuLjc2ZjViNTEzMjgwYyAxMDA2NDQNCj4gICAgID4gPiA+ID4gPiA+IC0tLSBhL3hlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiAgICAgPiA+ID4gPiA+ID4gKysrIGIveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jDQo+ICAgICA+ID4gPiA+ID4gPiBAQCAtMTI1Nyw2ICsxMjU3LDkg
QEAgc3RhdGljIGludCBfX2luaXQgbWFwX3JhbmdlX3RvX2RvbWFpbihjb25zdA0KPiAgICAgPiA+
ID4gPiA+ID4gc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYsDQo+ICAgICA+ID4gPiA+ID4gPsKg
IMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4gICAgID4gPiA+ID4gPiA+wqAgwqDCoMKgwqDCoMKg
IH0NCj4gICAgID4gPiA+ID4gPiA+wqAgwqDCoCArwqDCoMKgIGlmICggbmVlZF9tYXBwaW5nICYm
IChkZXZpY2VfZ2V0X2NsYXNzKGRldikgPT0gREVWSUNFX1BDSSkNCj4gICAgID4gPiA+ID4gPiA+
ICkgPiArwqDCoMKgwqDCoMKgwqAgbmVlZF9tYXBwaW5nID0gcGNpX2hvc3RfYnJpZGdlX25lZWRf
cDJtX21hcHBpbmcoZCwgZGV2LA0KPiAgICAgPiA+ID4gPiA+IGFkZHIsIGxlbik7DQo+ICAgICA+
ID4gPiA+ID4NCj4gICAgID4gPiA+ID4gPiBBRkFJQ1QsIHdpdGggZGV2aWNlX2dldF9jbGFzcyhk
ZXYpLCB5b3Uga25vdyB3aGV0aGVyIHRoZSBob3N0YnJpZGdlIGlzDQo+ICAgICA+ID4gPiA+ID4g
dXNlZCBieSBYZW4uIFRoZXJlZm9yZSwgSSB3b3VsZCBleHBlY3QgdGhhdCB3ZSBkb24ndCB3YW50
IHRvIG1hcCBhbGwNCj4gICAgID4gPiA+ID4gPiB0aGUgcmVnaW9ucyBvZiB0aGUgaG9zdGJyaWRn
ZXMgaW4gZG9tMCAoaW5jbHVkaW5nIHRoZSBCQVJzKS4NCj4gICAgID4gPiA+ID4gPg0KPiAgICAg
PiA+ID4gPiA+IENhbiB5b3UgY2xhcmlmeSBpdD8NCj4gICAgID4gPiA+ID4gV2Ugb25seSB3YW50
IHRvIHRyYXAgRUNBTSwgbm90IE1NSU9zIGFuZCBhbnkgb3RoZXIgbWVtb3J5IHJlZ2lvbnMgYXMg
dGhlDQo+ICAgICA+ID4gPiA+IGJyaWRnZSBpcw0KPiAgICAgPiA+ID4gPg0KPiAgICAgPiA+ID4g
PiBpbml0aWFsaXplZCBhbmQgdXNlZCBieSBEb21haW4tMCBjb21wbGV0ZWx5Lg0KPiAgICAgPiA+
ID4NCj4gICAgID4gPiA+IFdoYXQgZG8geW91IG1lYW4gYnkgInVzZWQgYnkgRG9tYWluLTAgY29t
cGxldGVseSI/IFRoZSBob3N0YnJpZGdlIGlzIG93bmVkDQo+ICAgICA+ID4gPiBieSBYZW4gc28g
SSBkb24ndCB0aGluayB3ZSBjYW4gbGV0IGRvbTAgYWNjZXNzIGFueSBNTUlPIHJlZ2lvbnMgYnkN
Cj4gICAgID4gPiA+IGRlZmF1bHQuDQo+ICAgICA+ID4NCj4gICAgID4gPiBOb3cgaXQncyBteSB0
aW1lIHRvIGFzayB3aHkgZG8geW91IHRoaW5rIFhlbiBvd25zIHRoZSBicmlkZ2U/DQo+ICAgICA+
ID4NCj4gICAgID4gPiBBbGwgdGhlIGJyaWRnZXMgYXJlIHBhc3NlZCB0byBEb21haW4tMCwgYXJl
IGZ1bGx5IHZpc2libGUgdG8gRG9tYWluLTAsDQo+ICAgICA+ID4gaW5pdGlhbGl6ZWQgaW4gRG9t
YWluLTAuDQo+ICAgICA+ID4NCj4gICAgID4gPiBFbnVtZXJhdGlvbiBldGMuIGlzIGRvbmUgaW4g
RG9tYWluLTAuIFNvIGhvdyBjb21lcyB0aGF0IFhlbiBvd25zIHRoZSBicmlkZ2U/DQo+ICAgICA+
ID4gSW4gd2hhdCB3YXkgaXQgZG9lcz8NCj4gICAgID4gPg0KPiAgICAgPiA+IFhlbiBqdXN0IGFj
Y2Vzc2VzIHRoZSBFQ0FNIHdoZW4gaXQgbmVlZHMgaXQsIGJ1dCB0aGF0J3MgaXQuIFhlbiB0cmFw
cyBFQ0FNDQo+ICAgICA+ID4gYWNjZXNzIC0gdGhhdCBpcyB0cnVlLg0KPiAgICAgPiA+DQo+ICAg
ICA+ID4gQnV0IGl0IGluIG5vIHdheSB1c2VzIE1NSU9zIGV0Yy4gb2YgdGhlIGJyaWRnZSAtIHRo
b3NlIHVuZGVyIGRpcmVjdCBjb250cm9sDQo+ICAgICA+ID4gb2YgRG9tYWluLTANCj4gICAgID4N
Cj4gICAgID4gU28gSSBsb29rZWQgb24gdGhlIHNuaXBwZWQgb2YgdGhlIGRlc2lnbiBkb2N1bWVu
dCB5b3UgcG9zdGVkLiBJIHRoaW5rIHlvdSBhcmUNCj4gICAgID4gaW5zdGVhZCByZWZlcnJpbmcg
dG8gYSBkaWZmZXJlbnQgcGFydDoNCj4gICAgID4NCj4gICAgID4gIiBQQ0ktUENJZSBlbnVtZXJh
dGlvbiBpcyBhIHByb2Nlc3Mgb2YgZGV0ZWN0aW5nIGRldmljZXMgY29ubmVjdGVkIHRvIGl0cw0K
PiAgICAgPiBob3N0Lg0KPiAgICAgPiBJdCBpcyB0aGUgcmVzcG9uc2liaWxpdHkgb2YgdGhlIGhh
cmR3YXJlIGRvbWFpbiBvciBib290IGZpcm13YXJlIHRvIGRvIHRoZSBQQ0kNCj4gICAgID4gZW51
bWVyYXRpb24gYW5kIGNvbmZpZ3VyZSB0aGUgQkFSLCBQQ0kgY2FwYWJpbGl0aWVzLCBhbmQgTVNJ
L01TSS1YDQo+ICAgICA+IGNvbmZpZ3VyYXRpb24uIg0KPiAgICAgPg0KPiAgICAgPiBCdXQgSSBz
dGlsbCBkb24ndCBzZWUgd2h5IGl0IG1lYW5zIHdlIGhhdmUgdG8gbWFwIHRoZSBNTUlPcyByaWdo
dCBub3cuIERvbTANCj4gICAgID4gc2hvdWxkIG5vdCBuZWVkIHRvIGFjY2VzcyB0aGUgTU1JT3Mg
KGFzaWRlIHRoZSBob3N0YnJpZGdlIHJlZ2lzdGVycykgdW50aWwgdGhlDQo+ICAgICA+IEJBUnMg
YXJlIGNvbmZpZ3VyZWQuDQo+DQo+ICAgICBUaGlzIGlzIHRydWUgZXNwZWNpYWxseSB3aGVuIHdl
IGFyZSBnb2luZyB0byBhc3NpZ24gYSBzcGVjaWZpYyBQQ0llDQo+ICAgICBkZXZpY2UgdG8gYSBE
b21VLiBJbiB0aGF0IGNhc2UsIHRoZSByZWxhdGVkIE1NSU8gcmVnaW9ucyBhcmUgZ29pbmcgdG8g
YmUNCj4gICAgIG1hcHBlZCB0byB0aGUgRG9tVSBhbmQgaXQgd291bGQgYmUgYSBiYWQgaWRlYSB0
byBhbHNvIGtlZXAgdGhlbSBtYXBwZWQNCj4gICAgIGluIERvbTAuIE9uY2Ugd2UgZG8gUENJZSBh
c3NpZ25tZW50LCB0aGUgTU1JTyByZWdpb24gb2YgdGhlIFBDSWUgZGV2aWNlDQo+ICAgICBiZWlu
ZyBhc3NpZ25lZCBzaG91bGQgb25seSBiZSBtYXBwZWQgaW4gdGhlIERvbVUsIHJpZ2h0Pw0KPg0K
Pg0KPiBUaGF0J3MgYWN0dWFsbHkgYSBnb29kIHBvaW50LiBUaGlzIGlzIGEgcmVjaXBlIGZvciBk
aXNhc3RlciBiZWNhdXNlIGRvbTAgYW5kIHRoZSBkb21VIG1heSBtYXAgdGhlIEJBUnMgd2l0aCBj
b25mbGljdGluZyBjYWNoaW5nIGF0dHJpYnV0ZXMuDQo+DQo+IFNvIHdlIG91Z2h0IHRvIHVubWFw
IHRoZSBCQVIgZnJvbSBkb20wLiBXaGVuIHRoZSBkZXZpY2UgaXMgYXNzaWduZWQgdG8gdGhlIGRv
bVUNCjEuIFllcywgY3VycmVudGx5IHdlIG1hcCBNTUlPcyB0byBEb20wIGZyb20gdGhlIGJlZ2lu
bmluZyAodGhlIHdob2xlIGFwZXJ0dXJlIGFjdHVhbGx5KQ0KDQoyLiBXaGVuIGEgUENJZSBkZXZp
Y2UgYXNzaWduZWQgdG8gYSBEb21VIHdlIGRvIHVubWFwIHRoZSByZWxldmFudCBNTUlPcw0KDQpm
cm9tIERvbTAgYW5kIG1hcCB0aGVtIHRvIERvbVUNCg0KDQo+DQo+ICAgICBJZiBzbywgaXQgd291
bGQgYmUgYmV0dGVyIGlmIHRoZSBNTUlPIHJlZ2lvbiBpbiBxdWVzdGlvbiB3YXMgbmV2ZXINCj4g
ICAgIG1hcHBlZCBpbnRvIERvbTAgYXQgYWxsIHJhdGhlciBoYXZpbmcgdG8gdW5tYXAgaXQuDQo+
DQpPaywgSSdsbCBkbyB0aGF0DQo+DQo+DQo+ICAgICBXaXRoIHRoZSBjdXJyZW50IGFwcHJvYWNo
LCBnaXZlbiB0aGF0IHRoZSBlbnRpcmUgUENJZSBhcGVydHVyZSBpcyBtYXBwZWQNCj4gICAgIHRv
IERvbTAgc2luY2UgYm9vdCwgd2Ugd291bGQgaGF2ZSB0byBpZGVudGlmeSB0aGUgcmVsZXZhbnQg
c3Vic2V0IHJlZ2lvbg0KPiAgICAgYW5kIHVubWFwIGl0IGZyb20gRG9tMCB3aGVuIGRvaW5nIGFz
c2lnbm1lbnQuDQo+DQpJdCBpcyBhbHJlYWR5IGluIHZQQ0kgY29kZSAod2l0aCBub24taWRlbnRp
dHkgbWFwcGluZ3MgaW4gdGhlIFBDSSBkZXZpY2VzIHBhc3N0aHJvdWdoIG9uIEFybSwgcGFydCAz
KQ==

