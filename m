Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC57F43E78E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 19:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218204.378540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg9cn-0003xy-GW; Thu, 28 Oct 2021 17:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218204.378540; Thu, 28 Oct 2021 17:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg9cn-0003wC-Cx; Thu, 28 Oct 2021 17:55:37 +0000
Received: by outflank-mailman (input) for mailman id 218204;
 Thu, 28 Oct 2021 17:55:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikAZ=PQ=epam.com=prvs=19352d112c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mg9cl-0003w4-GZ
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 17:55:35 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e9d917c-3818-11ec-84b0-12813bfff9fa;
 Thu, 28 Oct 2021 17:55:32 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SHdHOR009750; 
 Thu, 28 Oct 2021 17:55:30 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
 by mx0a-0039f301.pphosted.com with ESMTP id 3c00es81mt-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 17:55:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3715.eurprd03.prod.outlook.com (2603:10a6:208:43::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 17:55:26 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 17:55:25 +0000
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
X-Inumbo-ID: 3e9d917c-3818-11ec-84b0-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l24mchNO/rCxlxISTX4S8LrCUxuDqvJ8PLpDxgDQNgprGlshMFzwrOEfvW1fpnlBtVQAoJzwe/LBXDYkM9jLHfjAyGfrEOgesmiJN8/JJbvOVWbMKikXnVfnl97M1XG/EqgppBmsLoikvIrO2h+LKAwDP4dHfJL+OEGI3O63b4qKUI+/soTAz2zctOgaIX7GtyjXHx+6vs2cMEXMLvSq5r7de6owZm0MrpHa5tuaqciMFii0Wm6ub2O8FoOUhTW8ExgquLLrSwsVAnSQ82d2QJXUlnWrFTdRsMPnvzLsORrgcXZQPXYYkGyLhYhZvvpST/odGFHcZ38/jUU+Umo6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0ujsxokvVj+8ncAPfxdMDr1N5LTYotS9baQqxpxCvE=;
 b=Nu00GvkhPhjKEUvFgE1+DvuTvtaxjo8aj9NV8YHr8ntENWI4MASUgJC9pOOxRcg0gBx/TOwat0zQIE9GhiuYd1qMenoqsMH75KHktiIC6Z2gDg2g7dAvq0ahljbd3wtH/DrEGp6tRafnAZa4iwGi46lkv5wvvosPAHm/Doglx9lLe+d13y1DVPz9hetJADO8OzpdHw8McbgyD3KpsLpmtqiMVTyulhOVnZ8dy0slqBSx/51LOX6zjjPnZ7fTXhKlx4REEwewtKeQviv/8xQV5o4t8cd9roxR0d68ePAAcE2/lsZFByeWuOut+P+q5jzg94DJr1JRXtD3xMhPyfEBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0ujsxokvVj+8ncAPfxdMDr1N5LTYotS9baQqxpxCvE=;
 b=LFK1yOnxb1MV6CPVKc46oLw0murPHBhmLa0D9s+cSS4ubY3sFMujE0j+Atrk0UoFeN6ws1JOUDRR91rzC/4pAciPn8FRRYaoLftkqOwOPlYTKczG03sJFzwK2Ji/bwUkzfOM8QsrCnPRIKOm1NgLgwUG8ddfkfsSsumzG1Sz0inqJWIIemdLraV7GAORgDzrLcu7FmUn8tPsuSIE+Z/6raTZGIBFTNG5pyIXj2mlVL367HVoyWP6I2xO9YSpe76iE3+YJakvFZ8z9CsWf5HibVt+1s+h6EXIU2ZAiC6KFcSIRc/hCMIZr2sW4382tzlvIZjqDkly84AoZ8zT9X5cYw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Rahul Singh
	<rahul.singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Topic: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Index: 
 AQHXyww6rKHs3LJru0q52eLUia+oNavnHBIAgAE3H4CAABhAgIAADTsAgAAb4gCAAB9PgA==
Date: Thu, 28 Oct 2021 17:55:25 +0000
Message-ID: <5de6c2f1-ef5c-9d8c-4287-9b0e3ff08b34@epam.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <YXqnS7iZUvokJby6@Air-de-Roger>
 <3206478e-f230-cd91-5de9-85ef6c251405@epam.com>
 <YXrJyLMiMxaNmFAs@Air-de-Roger>
In-Reply-To: <YXrJyLMiMxaNmFAs@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52151adb-9256-420a-e8f2-08d99a3c1f15
x-ms-traffictypediagnostic: AM0PR03MB3715:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB371546967EED5FCFCF09EB86E7869@AM0PR03MB3715.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XfjHP71i8jxeOZQA5lQ7l5CDj1T+DZ8QG7s5NSC3cyfdvIM/52UDoquc1ztcVo0wkjX0qaFFRISLvuOxR/v4wCSXJfKGmyh96kgry4hGznDL9OfCaBLdQGIAKMY1MTSFGPYVlCTUDuTufcCP9R/U/44I2PmSvmPnw3t4Q4ttr3b6Q3LNo1fKPNdfOpMnRfLToAurKlwby6Nv6PUwwL4tHWrqUFU2HROacDQRvvdI2oIKh6khl0tK+IgphtWRis9wR8SsedyPeI687sAzKRZEAiYH3GOaqv+8xI1cSlORP6aNh0m4FIFreeOPtMli0yybZ9hzSkrjSNHJg8LBSLBC4SOK6a8qsXdc7wyJKRN5o9MpMHRmvxbiBmMyeAYfGxdAtcHO+c2uR5PvlO/Q8SmXF7vo6jZAaOkRfCvBQsKDwMOuDJ+73357O/bXAzmH4O66rbcBVpGzLwCV+9gsG2h2zPApSJmJiGWcCdc2/ehVaVgXySih2Ucf/f+f1y48ssEsEQShcxjNWmMXj4cMXrphqLoLHBy3bl0gvxXUrIzo6zo9NV61Etw8d8FQArGfpH7ACUZWvjs+mDhpC0RkTopCSmvfi1mE37H8stAy0JWp8CCXCNyEICD+9mOHReG3YhN96FzN05/qQfGvxg+I0688Azl14ItKzS5gQjMb2EWKosSq89Pwb85JsaU3dGZWdpxfPONd2KsokG0PjudiPjizdpb/jJqABcMsXw/DCpE1rtT7YBKykIi3uoRiuUcxezHLK8k33dNcb9G+BxfIWtpXZSvVFGKRafym4gnyEkf2PxJ7spsVs2t2BDgPwJiUw/O/lsbBjMpl8myot2aPaAqTBw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(31686004)(186003)(2616005)(508600001)(110136005)(36756003)(26005)(31696002)(83380400001)(6486002)(53546011)(6512007)(316002)(8676002)(86362001)(91956017)(71200400001)(76116006)(66946007)(66476007)(66446008)(38100700002)(6506007)(64756008)(122000001)(966005)(2906002)(5660300002)(66556008)(4326008)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WkRuNk5XWURySkhod0lEazdhbG9rQlJ2NmxPM2Q2anQ0OWF2REhuMDBUbXI5?=
 =?utf-8?B?SjJMbG02L2RmdnRiT2pkVm5NTGw4emRrKy9aazN3YlFZR1ZsRjRLY1N2Z1Bu?=
 =?utf-8?B?T1ZSa2xBS2tUbjFWSzdNaVNhUVJlWjVGU2hHYXJvOWFHV3hVT0o3czZjOFVu?=
 =?utf-8?B?QnYyUjl1a3hoZHY0T3dnNVNCNVV6SGJMVklCcjdubS83SGs0NU5lVjgzV3N5?=
 =?utf-8?B?dm5uci9tM2g2aFdhRXdiSzEvZ3Ztak1LZmk3dDF1b25YK05UVVRvMTBGOCsr?=
 =?utf-8?B?L3NKb1FydllsQkJ5a0k2ejNyWVNSWUhzYzcrNkRnb1MyNUJBV1NnQUdnanJ2?=
 =?utf-8?B?cEYwcEZFWTB1QW0ycGRRWTA1T2ZVVEhBUnBaYzJLY1ZsdGN3QWtHVmV2MmUz?=
 =?utf-8?B?d2YrbWpKVUo5RFp6Q0htVWJ4N3MyQWRucXlleWZIZGhQNnpwTSs5OGgveVB6?=
 =?utf-8?B?T2lGdVM1WGFRY3gzcjlvVTFVaDZpcEQ5RkJYcXZPOUFTK00wYXUwd2hwMHRM?=
 =?utf-8?B?Y2g4UnNHQjdsaGZrYUlIWmFmcVFGU2VFWXAzeVN0eVVickhuNWoxYkVBWnVI?=
 =?utf-8?B?VXc1dmpJK2ZkZm9ySSswcnEyQUV4Y2tlRTY3UmkyT2E3WTJIL0VTRnRkYjBS?=
 =?utf-8?B?RDM5SWpYeXl5UzliYUE2SGNiTnA3QTNKelVScFRTYXRtQ2xQSENBTEdlR0lU?=
 =?utf-8?B?OFZmNk5RK2FVVU1zSytFODNmL3FFSlJyUTIvSUY3U3Z3ZGxVQ3VKdjNPMjVZ?=
 =?utf-8?B?Z01TMmtlVzZuclljNWFxUUN0aVg0aFdtazlqZURrbU1HcDNlTWZhL3U1WHpw?=
 =?utf-8?B?cjR3aU1Sc0pBei9VdlU3VHFTcE1VWkVmNVU1TE9YbXROSFdkS1dLK2xZSDU5?=
 =?utf-8?B?dzlTSis5V0ZWbWE3ZytvV3poWWRML0ZaakZxeXpNZVFZc25VTlgyOEpDOWVu?=
 =?utf-8?B?Y1lzeDliL0lXTjNyOUI0dDhyc3h1MWE0YnI1akg4MnRCeG1tbGVicjlLdUhE?=
 =?utf-8?B?aGNDZjY0K0U4TC9YV3RoOHdXbTExNGNtOUlLM2c2VEgrQzc5MXUxcjA4dW9z?=
 =?utf-8?B?bVJKczk1VHFjTHJXQWNEQjl2UlRYMW9DWWs0MnRSSTNwcXdKZ3ZCYlQrNWxt?=
 =?utf-8?B?QjZUNWhWSVEzWU1yekZvNHVzeldWUDRQQnVuVWdJVmhOdFhMUkFqOHovVUxz?=
 =?utf-8?B?UWJ0UlJ4MWQ5bXZrZlA1Sm9NbDdOM0k2M3hVWW43dnlVa0RST1FVdVlEZERO?=
 =?utf-8?B?b0tPM1ZtNVZTTENJaDJ1QmE0R05lblpDdjFUWHREU1FHdHo0K0I2dnJDcmIw?=
 =?utf-8?B?UDByMng0dE8vTjdYRHVkQTF1TkoyeEFzVTR4WFpPUGs4NWxMY2VCSUIySGN1?=
 =?utf-8?B?c1pRd2ZKQlBhYllOR1M5SThSY3NpU1RtWWtvaXhpci9VY3hMT1JJY3hlYmlV?=
 =?utf-8?B?YzZRMmdFSHVQWWg5eUR3Z2dIVHpyWlU1U09QYzJ6dzgyazB2T2dxVUpVOHJl?=
 =?utf-8?B?SkZKNm5jakdzeVR6Nk5JUXdBd0kvREtCK2ZWYXp6NWhOQ1ZnTmZwck5sTVpV?=
 =?utf-8?B?UmlRNHdSRS9VcExxVG1vWUNRWXg1WU81Qlh1UElrazlyNEZPNTBwKzdKOENr?=
 =?utf-8?B?WjRZVVBoN2FxV3l2OGdNdnp4YnlZSGN3SVovY3MvbUlsbUUzdEoyRC9uWlVK?=
 =?utf-8?B?WlI4U25LQXNaMUM4ZXN6VzdPazRmWmp3R0w1MXNPRzNwU1pYR21zSFF1N0Zt?=
 =?utf-8?B?TXNXekRHR3JUQkRqNHRMYTU4dzBFZlFUUzdlZm00WXIydUFpRkd4T2ZHdnJF?=
 =?utf-8?B?QXQ0RXBZT25MOWh0OEtRWFArYWg5MWFsOVZBSW0vMWhPc3ZIQ0VmeVA2TXMw?=
 =?utf-8?B?MUtlbkJ4WGp3SERZckJMOWVOWURtTENYTGhuWTlMVUdIRmdLU1E5RmF3S2x3?=
 =?utf-8?B?c0NEZmh6RmV2TjdGdnM5Rk5INWJyMmN1NldVa0k5RUVoaDdSUU9GVG5pb0J5?=
 =?utf-8?B?eCt6V2k3ZWtCRHNlR0pEYWN5NU90ZHQyVmJGWnVGbTc1bFZDaVFzWVRJVE1n?=
 =?utf-8?B?UzR0cnlxd0d3V1lFdTBLZkEybUtHbnV1VkxnZmE2RjZTNVRvaE05TUFieXlT?=
 =?utf-8?B?V1NFV3R0S1hlT3ZRL1VjdUtQM3JZSGhBVlBDT242V0w4TldBWTl2Q080eFFo?=
 =?utf-8?B?TktMZE1qdjFTeVoxMThHdHRkTW5tRVJBYXBYWEY0V1hHRFVBeG4yZXlYV3BT?=
 =?utf-8?B?czlSeE5OMWlPZ1JvVVo5QkJLYTllekp0MkN0YkdjTjM5Q2VwcTZrVDNVL2cy?=
 =?utf-8?B?OXN4bERGdXZ6LzkrcUFSemRia3ZLb0NQSHdNVEpnYVJiZXRneElDZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A76019E8A61E0A4384FCDA567DE0E176@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52151adb-9256-420a-e8f2-08d99a3c1f15
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 17:55:25.8476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YUgS7il3JbMhzje7h4QmehKU4OYNKLHZ2PZalAoQEAntB6Be8lIKMxtKZz6HcTKwa9A66gE7cvlCm8mMP5zFzhIVtCNaZ7uY5wvKjRa9DZ0AWbbm3ONqJqvygDOUyE9m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3715
X-Proofpoint-ORIG-GUID: RC8oijkBaOp2wgYnEkabsknMOqUg7kaC
X-Proofpoint-GUID: RC8oijkBaOp2wgYnEkabsknMOqUg7kaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_04,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280095

DQoNCk9uIDI4LjEwLjIxIDE5OjAzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUaHUs
IE9jdCAyOCwgMjAyMSBhdCAwMjoyMzozNFBNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAyOC4xMC4yMSAxNjozNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBUaHUsIE9jdCAyOCwgMjAyMSBhdCAxMjowOToyM1BNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gSGksIEp1bGllbiENCj4+Pj4NCj4+Pj4gT24g
MjcuMTAuMjEgMjA6MzUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+IEhpIE9sZWtzYW5kciwN
Cj4+Pj4+DQo+Pj4+PiBPbiAyNy8xMC8yMDIxIDA5OjI1LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+Pj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRy
X2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+Pj4NCj4+Pj4+PiBXaGlsZSBpbiB2UENJIE1N
SU8gdHJhcCBoYW5kbGVycyBmb3IgdGhlIGd1ZXN0IFBDSSBob3N0IGJyaWRnZSBpdCBpcyBub3QN
Cj4+Pj4+PiBlbm91Z2ggZm9yIFNCREYgdHJhbnNsYXRpb24gdG8gc2ltcGx5IGNhbGwgVlBDSV9F
Q0FNX0JERihpbmZvLT5ncGEpIGFzDQo+Pj4+Pj4gdGhlIGJhc2UgYWRkcmVzcyBtYXkgbm90IGJl
IGFsaWduZWQgaW4gdGhlIHdheSB0aGF0IHRoZSB0cmFuc2xhdGlvbg0KPj4+Pj4+IGFsd2F5cyB3
b3JrLiBJZiBub3QgYWRqdXN0ZWQgd2l0aCByZXNwZWN0IHRvIHRoZSBiYXNlIGFkZHJlc3MgaXQg
bWF5IG5vdCBiZQ0KPj4+Pj4+IGFibGUgdG8gcHJvcGVybHkgY29udmVydCBTQkRGIGFuZCBjcmFz
aGVzOg0KPj4+Pj4+DQo+Pj4+Pj4gKFhFTikgdnBjaV9tbWlvX3JlYWQgMDAwMDo2NToxYS4wIHJl
ZyA4YmMgZ3BhIGU2NWQwOGJjDQo+Pj4+PiBJIGNhbid0IGZpbmQgYSBwcmludGsoKSB0aGF0IG1h
eSBvdXRwdXQgdGhpcyBtZXNzYWdlLiBXaGVyZSBkb2VzIHRoaXMgY29tZXMgZnJvbT8NCj4+Pj4g
VGhhdCB3YXMgYSBkZWJ1ZyBwcmludC4gSSBzaG91bGRuJ3QgaGF2ZSB1c2VkIHRoYXQgaW4gdGhl
IHBhdGNoIGRlc2NyaXB0aW9uLCBidXQNCj4+Pj4gcHJvYmFibHkgYWZ0ZXIgIi0tLSIgdG8gYmV0
dGVyIGV4cGxhaW4gd2hhdCdzIGhhcHBlbmluZw0KPj4+Pj4gQW55d2F5LCBJSVVDIHRoZSBndWVz
dCBwaHlzaWNhbCBhZGRyZXNzIGlzIDB4ZTY1ZDA4YmMgd2hpY2gsIGlmIEkgYW0gbm90IG1pc3Rh
a2VuLCBkb2Vzbid0IGJlbG9uZyB0byB0aGUgcmFuZ2UgYWR2ZXJ0aXNlZCBmb3IgR1VFU1RfVlBD
SV9FQ0FNLg0KPj4+PiBUaGlzIGlzIGZyb20gZG9tMCBJIGFtIHdvcmtpbmcgb24gbm93Lg0KPj4+
Pj4gSU1ITywgdGhlIHN0YWNrIHRyYWNlIHNob3VsZCBjb21lIGZyb20gdXNwdHJlYW0gWGVuIG9y
IG5lZWQgc29tZSBpbmZvcm1hdGlvbiB0byBleHBsYWluIGhvdyB0aGlzIHdhcyByZXByb2R1Y2Vk
Lg0KPj4+Pj4NCj4+Pj4+PiAoWEVOKSBEYXRhIEFib3J0IFRyYXAuIFN5bmRyb21lPTB4Ng0KPj4+
Pj4+IChYRU4pIFdhbGtpbmcgSHlwZXJ2aXNvciBWQSAweDQ2N2EyOGJjIG9uIENQVTAgdmlhIFRU
QlIgMHgwMDAwMDAwMDQ4MWQ1MDAwDQo+Pj4+PiBJIGNhbiB1bmRlcnN0bmFkIHRoYXQgaWYgd2Ug
ZG9uJ3Qgc3Vic3RyYWN0IEdVRVNUX1ZQQ0lfRUNBTSwgd2Ugd291bGQgKGluIHRoZW9yeSkgbm90
IGdldCB0aGUgY29ycmVjdCBCREYuIEJ1dC4uLiBJIGRvbid0IHVuZGVyc3RhbmQgaG93IHRoaXMg
d291bGQgcmVzdWx0IHRvIGEgZGF0YSBhYm9ydCBpbiB0aGUgaHlwZXJ2aXNvci4NCj4+Pj4+DQo+
Pj4+PiBJbiBmYWN0LCBJIHRoaW5rIHRoZSB2UENJIGNvZGUgc2hvdWxkIGJlIHJlc2lsaWVudCBl
bm91Z2ggdG8gbm90IGNyYXNoIGlmIHdlIHBhc3MgdGhlIHdyb25nIEJERi4NCj4+Pj4gV2VsbCwg
dGhlcmUgaXMgbm8gKD8pIGVhc3kgd2F5IHRvIHZhbGlkYXRlIFNCREYuIEFuZCB0aGlzIGNvdWxk
IGJlIGEgcHJvYmxlbSBpZiB3ZSBoYXZlIGEgbWlzYmVoYXZpbmcNCj4+Pj4gZ3Vlc3Qgd2hpY2gg
bWF5IGZvcmNlIFhlbiB0byBhY2Nlc3MgdGhlIG1lbW9yeSBiZXlvbmQgdGhhdCBvZiBQQ0kgaG9z
dCBicmlkZ2UNCj4+PiBIb3cgY291bGQgdGhhdCBiZT8gVGhlIEVDQU0gcmVnaW9uIGV4cG9zZWQg
dG8gdGhlIGd1ZXN0IHlvdSBzaG91bGQgYmUNCj4+PiB0aGUgc2FtZSBhcyB0aGUgcGh5c2ljYWwg
b25lIGZvciBkb20wPw0KPj4gT2ssIEkgaGF2ZSBhIERlc2lnbndhcmUgUENJIGhpc3Qgd2hpY2gg
aGFzIDIgRUNBTSByZWdpb25zIChJIGFtIHN0YXJ0aW5nIHRvDQo+PiBpbXBsZW1lbnQgdGhlIGRy
aXZlciBmb3IgaXQsIHNvIEkgY2FuIGJlIHdyb25nIGhlcmUpOg0KPj4gLSBSb290IENvbXBsZXgg
RUNBTSBhcmVhICgiZGJpIiksIGl0IGlzIHNvbWV0aGluZyBsaWtlIDB4MzAwMCBieXRlcyBsb25n
DQo+PiAtICJDbGllbnQiIEVDQU0gYXJlYSAoImNvbmZpZyIpDQo+PiBTbyBmcm9tIERvbTAgUE9W
IHdlIGhhdmUgMiBFQ0FNIHJlZ2lvbnMgYW5kIGZvciB0aGUgZ3Vlc3QNCj4+IHdlIGFsd2F5cyBl
bXVsYXRlIGEgc2luZ2xlIGJpZyByZWdpb246DQo+IFlvdSBuZWVkIHN1cHBvcnQgZm9yIG11bHRp
cGxlIEVDQU0gcmVnaW9ucy4gVGhhdCdzIGhvdyB3ZSBkbyBpdCBvbiB4ODYNCj4gUFZIIGRvbTAu
IFNlZSByZWdpc3Rlcl92cGNpX21tY2ZnX2hhbmRsZXIgYW5kIHJlbGF0ZWQgbWFjaGluZXJ5Lg0K
SXMgaXQgY29tbW9uIGZvciBhIFBDSSBob3N0IGJyaWRnZSB0byBoYXZlIG11bHRpcGxlIEVDQU0g
cmVnaW9ucz8NCkN1cnJlbnRseSBvbiBBcm0gd2Ugd2VyZSBhYm91dCB0byBzdXBwb3J0ICJwY2kt
aG9zdC1lY2FtLWdlbmVyaWMiIFsxXSwNCmUuZy4gZ2VuZXJpYyBFQ0FNIGhvc3QgYnJpZGdlIHdo
aWNoIG5vcm1hbGx5ICg/KSBoYXMgYSBzaW5nbGUgRUNBTQ0KcmVnaW9uIFsyXS4gQnV0IHRoZSBo
b3N0IGJyaWRnZSBJIHdhbnQgdG8gc3VwcG9ydCBoYXMgbXVsdGlwbGUsIHNvDQpzdHJpY3RseSBz
cGVha2luZyBpdCBpcyBub3QgdGhlIG9uZSB0aGF0IHdlIGltcGxlbWVudC4NCg0KQXJtIGZvbGtz
LCBkbyB3ZSB3YW50IHRoaXMgZ2VuZXJhbGl6YXRpb24gYXQgdGhpcyBtb21lbnQgdG8gYWxpZ24g
d2l0aCB4ODYNCndpdGggdGhpcyByZXNwZWN0Pw0KDQpXZSBjYW4gbGl2ZSB3aXRoIHRoZSBjdXJy
ZW50IGFwcHJvYWNoIGFuZCB3aGVuIEkgaGF2ZSBteSBkcml2ZXIgaW1wbGVtZW50ZWQNCkkgY2Fu
IHNlbmQgcGF0Y2hlcyB0byBtYWtlIHRoYXQgZ2VuZXJhbGl6YXRpb24uDQo+DQo+PiAvKg0KPj4g
ICDCoCogMjU2IE1CIGlzIHJlc2VydmVkIGZvciBWUENJIGNvbmZpZ3VyYXRpb24gc3BhY2UgYmFz
ZWQgb24gY2FsY3VsYXRpb24NCj4+ICAgwqAqIDI1NiBidXNlcyB4IDMyIGRldmljZXMgeCA4IGZ1
bmN0aW9ucyB4IDQgS0IgPSAyNTYgTUINCj4+ICAgwqAqLw0KPj4gI2RlZmluZSBHVUVTVF9WUENJ
X0VDQU1fQkFTRcKgwqDCoCB4ZW5fbWtfdWxsb25nKDB4MTAwMDAwMDApDQo+PiAjZGVmaW5lIEdV
RVNUX1ZQQ0lfRUNBTV9TSVpFwqDCoMKgIHhlbl9ta191bGxvbmcoMHgxMDAwMDAwMCkNCj4+DQo+
PiBTbywgd2UgaGF2ZSB0aGUgYmFzZSBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZSBlbXVsYXRlZCBF
Q0FNIHNwYWNlDQo+PiBub3QgY29ubmVjdGVkIHRvIHRoZSByZWFsIGhvc3QgYnJpZGdlDQo+Pj4g
QW5kIGZvciBkb21VcyB5b3UgcmVhbGx5IG5lZWQgdG8gZml4IHZwY2lfe3JlYWQsd3JpdGV9IHRv
IG5vdA0KPj4+IHBhc3N0aHJvdWdoIGFjY2Vzc2VzIG5vdCBleHBsaWNpdGx5IGhhbmRsZWQuDQo+
PiBEbyB5b3UgbWVhbiB0aGF0IHdlIG5lZWQgdG8gdmFsaWRhdGUgU0JERnMgdGhlcmU/DQo+PiBU
aGlzIGNhbiBiZSB0cmlja3kgaWYgd2UgaGF2ZSBhIHVzZS1jYXNlIHdoZW4gYSBQQ0kgZGV2aWNl
IGJlaW5nDQo+PiBwYXNzZWQgdGhyb3VnaCBpZiBub3QgcHV0IGF0IDAwMDA6MDA6MC4wLCBidXQg
cmVxdWVzdGVkIHRvIGJlLCBmb3INCj4+IGV4YW1wbGUsIDAwMDA6MGQ6MC4wLiBTbywgd2UgbmVl
ZCB0byBnbyBvdmVyIHRoZSBsaXN0IG9mIHZpcnR1YWwNCj4+IGRldmljZXMgYW5kIHNlZSBpZiBT
QkRGIHRoZSBndWVzdCBpcyB0cnlpbmcgdG8gYWNjZXNzIGlzIGEgdmFsaWQgU0JERi4NCj4+IElz
IHRoaXMgd2hhdCB5b3UgbWVhbj8NCj4gTm8sIHlvdSBuZWVkIHRvIHByZXZlbnQgYWNjZXNzZXMg
dG8gcmVnaXN0ZXJzIG5vdCBleHBsaWNpdGx5IGhhbmRsZWQNCj4gYnkgdnBjaS4gSWU6IGRvIG5v
dCBmb3J3YXJkIHVuaGFuZGxlZCBhY2Nlc3NlcyB0bw0KPiB2cGNpX3tyZWFkLHdyaWV9X2h3KS4N
Ckkgc2VlLCBzbyB0aG9zZSB3aGljaCBoYXZlIG5vIGhhbmRsZXJzIGFyZSBub3QgcGFzc2VkIHRv
IHRoZSBoYXJkd2FyZS4NCkkgbmVlZCB0byBzZWUgaG93IHRvIGRvIHRoYXQNCj4NCj4gUmVnYXJk
cywgUm9nZXIuDQpUaGFuayB5b3UsDQpPbGVrc2FuZHINCg0KWzFdIGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y1LjE1LXJjNy9zb3VyY2UvZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2ktaG9zdC1nZW5lcmljLmMNClsyXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92
NS4xNS1yYzcvc291cmNlL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLWhvc3QtY29tbW9uLmMj
TDIz

