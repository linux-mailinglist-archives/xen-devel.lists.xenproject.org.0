Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7F841D7C1
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 12:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199748.353992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtKi-0005a6-BX; Thu, 30 Sep 2021 10:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199748.353992; Thu, 30 Sep 2021 10:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtKi-0005YH-77; Thu, 30 Sep 2021 10:30:32 +0000
Received: by outflank-mailman (input) for mailman id 199748;
 Thu, 30 Sep 2021 10:30:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y4Rr=OU=epam.com=prvs=0907a041b9=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVtKg-0005YB-Vi
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 10:30:31 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eafe07d5-1fc7-47a0-a471-7fee08cbcce2;
 Thu, 30 Sep 2021 10:30:28 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18UAQ2iW007709;
 Thu, 30 Sep 2021 10:30:25 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bdbfu00j6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 10:30:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6898.eurprd03.prod.outlook.com (2603:10a6:20b:2d6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 10:30:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 10:30:21 +0000
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
X-Inumbo-ID: eafe07d5-1fc7-47a0-a471-7fee08cbcce2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjZb5FsyB65Swg6TbSl2sDFaGvdHItqrCEsH2/bgCz+ELWmRHxsp5IOpCRWtgll2uaHzJdk8aydDJtRE1wjXfP3rLeqhHPCWYE3obvwlJQk2icPfBc6tXdBwijSgQb4uIrPAu009MOVmNAO+j3jaEpSKyjUXRwr6DL0kNcCrZhv+eXu7SmsXlP7aGh/36NFm7n6LW+T2Ii3pDDFY23VtI4Okx6q+eNBzKGlqkuM5Aek97MEVa8KCqDXDppmOgq8ngiupUh1vvUc7VEocdpyT8744jTJ+c5VbDRYF26C2Gs+u2qiRhoF3K8hQaWLlcocWtaYHaIbD91zaIQoJoIOfFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rhNm1HMfp7Ye67xZqdgOJPZkerPQh/LQI45xxCaBtsc=;
 b=ZI96DnC+S8ggl4oLymCybN95SskYEWnLfxVvAELPnI6qlMYDeZ7yHnxw1ZJpBr3EsSd/ou6f1rZaL8v80EUt4LXSM9vvNQWpcIqxFsPQjl8YfjwAXDp2AtklzOcs7otErIP+meFJrQ4sknPxstrvzDhasnLkuXZpH4yIp5+mD1pA447rvGUAweWqQ5RV10uzYDyELxqWyKArkaocIGw7ZWZnGzbHM5Yh0auoyFDCkS3mf6qX7VrznL93GQxCgf3ooyrSRTv6ZFuFPxAo94zdmPrxwNuArCRtsV1BT0Hg73c6Axf5Sg/7N6LP11QOtiillFokBC+vo6UEs2m9RqpW+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhNm1HMfp7Ye67xZqdgOJPZkerPQh/LQI45xxCaBtsc=;
 b=c/sWCMLO0jMPxwVP04PwHNTAuwQwe+3tF4jTWDwjv3kc1EBAralgozLQ2NCYVv+RDrLX1XwZjK0VWBPDnWMsinKICVyJtPW/qgelleb5rDEj4lHVpHhlHJCrJ6Js9E3K4Eryq3oyDJVg2RH63z/nUWXOJnMrWCqmGKG38dBf+Aoc2Q8sCCy2qvBETu8oSqu+x4ICfzXNCMKJc+/TtLlYQ6z+Fwm0tW4M/ceHyS8zDoPTU16Ytx94jou+wGVqzP7NPrScgU35kapUfA7Bgd2ALmNFvij0JI/Nq4PhjRPkPIBxOCLg2fQCfv+dve8V9jVXd16Y9hvr2UG57tkbNGGIjg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
Thread-Index: 
 AQHXtdAg2qzxZ1hIP02wGTFUbQtoPau8PLsAgAAGuICAAAXDAIAABCmAgAAO+wCAAARbAA==
Date: Thu, 30 Sep 2021 10:30:21 +0000
Message-ID: <5d34be9d-8d70-b2f6-e7bd-c3998b72d8ee@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-3-andr2000@gmail.com>
 <79fa6e5f-ace7-c46a-489a-2e1ba52e53da@suse.com>
 <7e179a48-3127-93e4-cdaa-e5be82cfe770@epam.com>
 <7d035651-6e16-a6cb-6760-e5d077e1a85c@suse.com>
 <91fca69f-1a6f-198d-be27-c6b0ddd62206@epam.com>
 <078e3a01-4498-7894-87dc-31798cfc474b@suse.com>
In-Reply-To: <078e3a01-4498-7894-87dc-31798cfc474b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8818ebd1-c347-4d9a-0623-08d983fd4e81
x-ms-traffictypediagnostic: AM9PR03MB6898:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB68983D72F722278AD7307B03E7AA9@AM9PR03MB6898.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 W5JITjh0ke1M6N5sqv2B2gztdATqj8nNQoiGoqm4fl+8rTh+AG5LIvXeud0/4jETmKQw1VAoxMNX4dLF/FJN4JN91XUR4Jp/AaewAxXP978S0eTBMC1bord1A8hNLKdoAUziBy/gu+XiafGqZFOFKLHwh4VQRZXOzsI2XdGN+u9K7+wpjNMrvX9dAvrD6pC3GnztKqEFEDNkR4cwjHJI+fXpMmNTISHFUfFklsE3rxlrktelE65ao/E3GKmxPMDiC1t8JSFGHhcpuEgmS4udDAPDSUd3v7qmiuYMP7cHEk8XtNqUiCbnEOSuwXrSuMPDIc2Q1DZpcHl1tqAXRCIYoYFMRFpfN3XvKLG5e7vXb9MEOjMHxZl4AgAF4raAu0far5UHTilM6a8kmZ+Du+drPYB1kCO52gz1bs2wPCFzkxbjw90aTQ/o9YMwDhRqHQR5puuqL67VKI6cQEsqu6scvpPqXWmX5VWXnw0ShK+dOKQ/DeibHYV9UsdhxGfZGY1pc0146JDwrWSivyHsKpZBQLGzhTVfrbxST7Lzp/sFaC/yWrWlILmCqU+t3T1Qf/ox8wUeZ4BRqPFpVWAv623h/W4UzgGbd119EfTva0AbiBeC6cHUsprhGoxj0/jn4atmVjWLL0c8jGbsAU7whGIqbwEMwSlLo96+x0ww8tk3COcVQ0ZePaesxcomLp+ob8d3wXhHOof5XKTy82G6fVI5owFkuCFHgMxdT4jqZJMTCr0C2VPFWJ//vltjnf02le9a
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(36756003)(508600001)(2616005)(26005)(66946007)(76116006)(38070700005)(66556008)(6486002)(91956017)(8676002)(186003)(6512007)(316002)(83380400001)(8936002)(66446008)(64756008)(54906003)(5660300002)(31686004)(107886003)(2906002)(38100700002)(53546011)(55236004)(6916009)(122000001)(71200400001)(4326008)(31696002)(86362001)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UENjK3NHTUxwZklxdkhxYXluV0U1K0ZMVmpJeE9iNEVOL0JJa242UmdaWDBu?=
 =?utf-8?B?c0ZlVU1XZ0RzbUFUeitmS284T1ZxQk83SWNBcklrL3R4aHFhUGZycllsL0VW?=
 =?utf-8?B?UlU1SzVYempRY2FHWVd6a1RneW5iRDdDd2tmUGl3dG1wRDhYbDhxbzFWalo3?=
 =?utf-8?B?TlFOcVBLWnl0K2oreW10YS9oR3JGSFk4d0xYaGoySGY5M21XSnNxVDM2ZGpa?=
 =?utf-8?B?Zkh1WmMvMUxrUmgyTzN2aWFuTGhXTmVtZGtqdzV4b3EyVXNxVlZJVkk5V2xZ?=
 =?utf-8?B?WXNqckRDTGZKYy9tRmlpeCtPK09Gb284RjhrUXVQaHAzYzQreXA1RFlBcWFz?=
 =?utf-8?B?RXR3ZnVSdSs4d29Nem91eVlIN2dDNWh3RnFhV1BkdWhsdEFWR201K00rRi9Q?=
 =?utf-8?B?R1AyOGUwNWQ2b0pmOTljNTBUVlVMUjBSaE1WV3NpdDRNTXVhNVZLcm85M1gw?=
 =?utf-8?B?dE9sQk0vN1Q5N1I2UlJNQ25uaEpoWVREU2svektvNXp6djlQV3ZVOEZnYU1h?=
 =?utf-8?B?UFhSc3Y1VVhpcWpWNnoxdE15dENDaVNRS2pVeksraEFuangyYUU2Y09MTklQ?=
 =?utf-8?B?N24rQnJXOVNkRThOTkdlU0V2dUhHamxqU0pUUjBGaFpvY0k3QTR6dFMzTC91?=
 =?utf-8?B?Ym1BZFVwMkFCSWtlZC9IVGxCRkZobDB5b25pZ0RVSDY1NEYwdUJVMGd5TGNn?=
 =?utf-8?B?WXJDYzYrZStlazFSZ050dE5Qb3lLbmpCUVRjS3hiSkhtR2M1YytUano5Q004?=
 =?utf-8?B?SUlaQU9jcnAyNzJnOUU2ekNrWFdiOExEVzh6T1pLdGFlcDZNNXdERXhFZm1W?=
 =?utf-8?B?K3R3UVFxUDI5NGhJYlgzQmptYmJYZTBFWUN2SXJHYWJhL1JKakRIYzdQY05r?=
 =?utf-8?B?VURudnNBOE1iZVUxUnFFRnpzTDAvcTZkdG8zekVLSXdrZVdRVFppZVZUaUk1?=
 =?utf-8?B?WUtuNlpMKzFKbDNva3pPdFRkRm4zOGdvTklkZDc1V0pxd0pWMUpqM285T3JQ?=
 =?utf-8?B?ZXpjZ2UvbGFRYmpJMnVManYxRHovYStLWXRtaFZTMGIwNm9wM3Brd1I1T1Vn?=
 =?utf-8?B?Vlcwc2FiaVBobFROQzVaOFdhb25Fa01GTHI0M3gwcmRzSFZKT3RSazFwNEV6?=
 =?utf-8?B?bkVBaDhteUZveStFMWF5d2hQK1pPSStYUVc2blhDNlRJVGtIZ0piVXBESit6?=
 =?utf-8?B?SEZ6SnZqUlhjOHROZkN1NS9NOXlqWm93cUxwZ1R0djJBYjVSM2NJNWltb0pm?=
 =?utf-8?B?U2ErM3pWRUNhOTc1YUZrcmdVS0dKcjJLL3hBSnFyYjZ6ZmM2TWpncVp2M2V2?=
 =?utf-8?B?RFBXb0ppWjUrQ3hOQ3VaR2dGNUVMWnNiVzExYzFENzcwbGtaSGNpb2ZVaCtC?=
 =?utf-8?B?RnMwMGI1QTNMbjlJREVLQnkrNWorWmlpU24zMG1xSXdaTkRMNjhNTlBXdlE4?=
 =?utf-8?B?SWlLcFovUTNVMnBYQU51ZnVsV1I3ZEIxT0k3OFJ4ZExTTGZOSE03SHkxS3FH?=
 =?utf-8?B?M3ZLM1FKbC9YSUlKMEVuTm15NlFBZGwzV2RPazJsYW1QM3lMT2k4amlpZXJS?=
 =?utf-8?B?eTBISXJBUzZBUVI4YllJc0FzY2VML20xNVhjZWlYdnFQcVA5K0dpNE1hb0th?=
 =?utf-8?B?MDVJK1lEYnZwelFNWTU3SzlWOHFuaWJ6OG8wVmZZZjF5QTdRbXNMcVN5QVBw?=
 =?utf-8?B?a1FiMi82OXhSaXNlald1MkI3NEJqaEJIM1VUOERncENXMmgzU0hLZjN1WEJq?=
 =?utf-8?B?Q29XYVhsSlJWK0J6TVVJZm1ZeHE1bzZrU3RlQjFReGZleFVaMnNjYjNwRFZm?=
 =?utf-8?B?RzNndWh0TGwvRUFZQU5Hdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <898DFA1D36149C42AFC9DC024A6D9780@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8818ebd1-c347-4d9a-0623-08d983fd4e81
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 10:30:21.4996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KnctWkSRuDbPZp2FtsJd02S9PU0bssADKs5hCxT6p43Gaw3PYQl0xxSPPK1ApBjiN+x/p8pdFUduaxm2wE7v7N+M6lWYaqi3HxDE4dWd8dak/zipE8xeXtQrf0ybEsG0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6898
X-Proofpoint-ORIG-GUID: 3yOCiiGoztPNMBlvcdQUXzZIpOfOy2oq
X-Proofpoint-GUID: 3yOCiiGoztPNMBlvcdQUXzZIpOfOy2oq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_03,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300065

DQoNCk9uIDMwLjA5LjIxIDEzOjE0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzAuMDkuMjAy
MSAxMToyMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAzMC4wOS4yMSAx
MjowNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMzAuMDkuMjAyMSAxMDo0NSwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDMwLjA5LjIxIDExOjIxLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+IE9uIDMwLjA5LjIwMjEgMDk6NTIsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+IEBAIC0xNDI5LDYgKzE0MzMsMTEgQEAgc3RhdGljIGludCBh
c3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4s
IHUzMiBmbGFnKQ0KPj4+Pj4+ICAgICAgICAgICAgIHJjID0gaGQtPnBsYXRmb3JtX29wcy0+YXNz
aWduX2RldmljZShkLCBkZXZmbiwgcGNpX3RvX2RldihwZGV2KSwgZmxhZyk7DQo+Pj4+Pj4gICAg
ICAgICB9DQo+Pj4+Pj4gICAgIA0KPj4+Pj4+ICsgICAgaWYgKCByYyApDQo+Pj4+Pj4gKyAgICAg
ICAgZ290byBkb25lOw0KPj4+Pj4gICAgRnJvbSBhbGwgSSBjYW4gdGVsbCB0aGlzIGlzIGRlYWQg
Y29kZS4NCj4+Pj4gQmVmb3JlIHRoZSBjaGFuZ2UgcmMgd2FzIHNldCBpbiB0aGUgbG9vcC4gQW5k
IHRoZW4gd2UgZmFsbCB0aHJvdWdoDQo+Pj4+IHRvIHRoZSAiZG9uZSIgbGFiZWwuIEkgZG8gYWdy
ZWUgdGhhdCB0aGUgd2F5IHRoaXMgY29kZSBpcyBkb25lIHRoZQ0KPj4+PiB2YWx1ZSBvZiB0aGF0
IHJjIHdpbGwgb25seSByZWZsZWN0IHRoZSBsYXN0IGFzc2lnbm1lbnQgZG9uZSBpbiB0aGUgbG9v
cCwNCj4+Pj4gYnV0IHdpdGggbXkgY2hhbmdlIEkgZGlkbid0IHdhbnQgdG8gY2hhbmdlIHRoZSBl
eGlzdGluZyBiZWhhdmlvciwNCj4+Pj4gdGh1cyAiaWYgKCByYyINCj4+PiByYyBpcyBhbHdheXMg
MCB1cG9uIGxvb3AgZXhpdCwgYWZhaWN0Og0KPj4+DQo+Pj4gICAgICAgZm9yICggOyBwZGV2LT5w
aGFudG9tX3N0cmlkZTsgcmMgPSAwICkNCj4+Pg0KPj4+IEdyYW50ZWQgdGhpcyBpcyB1bnVzdWFs
IGFuZCBoZW5jZSBwb3NzaWJseSB1bmV4cGVjdGVkLg0KPj4gSSB3aWxsIHJlbW92ZSB0aGF0IGNo
ZWNrIHRoZW4uIERvIHdlIHdhbnQgYSBjb21tZW50IGFib3V0IHJjID09IDAsDQo+PiBzbyBpdCBp
cyBzZWVuIHdoeSB0aGVyZSBpcyBubyBjaGVjayBmb3IgcmM/DQo+IFNvIGZhciB3ZSd2ZSBiZWVu
IGRvaW5nIGZpbmUgd2l0aG91dCBzdWNoIGEgY29tbWVudCwgYnV0IEkgd291bGRuJ3QNCj4gb2Jq
ZWN0IHRvIGEgd2VsbCB3b3JkZWQgb25lIGdldHRpbmcgYWRkZWQuDQo+DQo+Pj4+Pj4gLS0tIGEv
eGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+Pj4+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL3Zw
Y2kuYw0KPj4+Pj4+IEBAIC04Niw2ICs4NiwyOSBAQCBpbnQgX19od2RvbV9pbml0IHZwY2lfYWRk
X2hhbmRsZXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+Pj4+ICAgICANCj4+Pj4+PiAgICAg
ICAgIHJldHVybiByYzsNCj4+Pj4+PiAgICAgfQ0KPj4+Pj4+ICsNCj4+Pj4+PiArI2lmZGVmIENP
TkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+Pj4+Pj4gKy8qIE5vdGlmeSB2UENJIHRoYXQg
ZGV2aWNlIGlzIGFzc2lnbmVkIHRvIGd1ZXN0LiAqLw0KPj4+Pj4+ICtpbnQgdnBjaV9hc3NpZ25f
ZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpkZXYpDQo+Pj4+
Pj4gK3sNCj4+Pj4+PiArICAgIC8qIEl0IG9ubHkgbWFrZXMgc2Vuc2UgdG8gYXNzaWduIGZvciBo
d2RvbSBvciBndWVzdCBkb21haW4uICovDQo+Pj4+PiBDb3VsZCB5b3UgY2xhcmlmeSBmb3IgbWUg
aW4gaG93IGZhciB0aGlzIGNvZGUgcGF0aCBpcyBpbmRlZWQgaW50ZW5kZWQNCj4+Pj4+IHRvIGJl
IHRha2VuIGJ5IGh3ZG9tPyBCZWNhdXNlIGlmIGl0IGlzLCBJJ2QgbGlrZSB0byBmdXJ0aGVyIHVu
ZGVyc3RhbmQNCj4+Pj4+IHRoZSBpbnRlcmFjdGlvbiB3aXRoIHNldHVwX2h3ZG9tX3BjaV9kZXZp
Y2VzKCkuDQo+Pj4+IHNldHVwX2h3ZG9tX3BjaV9kZXZpY2VzIGlzIG5vdCB1c2VkIG9uIEFybSBh
cyB3ZSBkbyByZWx5IG9uDQo+Pj4+IERvbTAgdG8gcGVyZm9ybSBQQ0kgaG9zdCBpbml0aWFsaXph
dGlvbiBhbmQgUENJIGRldmljZSBlbnVtZXJhdGlvbi4NCj4+Pj4NCj4+Pj4gVGhpcyBpcyBiZWNh
dXNlIG9mIHRoZSBmYWN0IHRoYXQgb24gQXJtIGl0IGlzIG5vdCBhIHRyaXZpYWwgdGFzayB0bw0K
Pj4+PiBpbml0aWFsaXplIGEgUENJIGhvc3QgYnJpZGdlIGluIFhlbiwgZS5nLiB5b3UgbmVlZCB0
byBwcm9wZXJseSBpbml0aWFsaXplDQo+Pj4+IHBvd2VyIGRvbWFpbnMsIGNsb2NrcywgcXVpcmtz
IGV0Yy4gZm9yIGRpZmZlcmVudCBTb0NzLg0KPj4+PiBBbGwgdGhlc2UgbWFrZSB0aGUgdGFzayB0
b28gY29tcGxleCBhbmQgaXQgd2FzIGRlY2lkZWQgdGhhdCBhdCB0aGUNCj4+Pj4gbW9tZW50IHdl
IGRvIG5vdCB3YW50IHRvIGJyaW5nIFBDSSBkZXZpY2UgZHJpdmVycyBpbiBYZW4gZm9yIHRoYXQu
DQo+Pj4+IEl0IHdhcyBhbHNvIGRlY2lkZWQgdGhhdCB3ZSBleHBlY3QgRG9tMCB0byB0YWtlIGNh
cmUgb2YgaW5pdGlhbGl6YXRpb24NCj4+Pj4gYW5kIGVudW1lcmF0aW9uLg0KPj4+PiBTb21lIGRh
eSwgd2hlbiBmaXJtd2FyZSBjYW4gZG8gUENJIGluaXRpYWxpemF0aW9uIGZvciB1cyBhbmQgdGhl
biB3ZQ0KPj4+PiBjYW4gZWFzaWx5IGFjY2VzcyBFQ0FNLCB0aGlzIHdpbGwgY2hhbmdlLiBUaGVu
IHNldHVwX2h3ZG9tX3BjaV9kZXZpY2VzDQo+Pj4+IHdpbGwgYmUgdXNlZCBvbiBBcm0gYXMgd2Vs
bC4NCj4+Pj4NCj4+Pj4gVGh1cywgd2UgbmVlZCB0byB0YWtlIGNhcmUgdGhhdCBYZW4ga25vd3Mg
YWJvdXQgdGhlIGRpc2NvdmVyZWQNCj4+Pj4gUENJIGRldmljZXMgdmlhIGFzc2lnbl9kZXZpY2Ug
ZXRjLg0KPj4+IEZhaXIgZW5vdWdoLCBidXQgc2luY2UgSSd2ZSBub3Qgc3BvdHRlZCBhIHBhdGNo
IGV4cHJlc3NpbmcgdGhpcw0KPj4gV2VsbCwgaXQgaXMgYWxsIGluIHRoZSBSRkMgZm9yIFBDSSBw
YXNzdGhyb3VnaCBvbiBBcm0gd2hpY2ggaXMgbWVudGlvbmVkDQo+PiBpbiBzZXJpZXMgZnJvbSBB
cm0gYW5kIEVQQU0gKHBhcnQgMikuIEkgZGlkbid0IG1lbnRpb24gdGhlIFJGQyBpbiB0aGUNCj4+
IGNvdmVyIGxldHRlciBmb3IgdGhpcyBzZXJpZXMgdGhvdWdoLg0KPj4+ICAgIChieQ0KPj4+IGFk
ZGluZyBzdWl0YWJsZSBjb25kaXRpb25hbHMpLCBtYXkgSSBhc2sgdGhhdCB5b3UgZG8gc28gaW4g
eWV0IGFub3RoZXINCj4+PiBwYXRjaCAodW5sZXNzIEkndmUgb3Zlcmxvb2tlZCB3aGVyZSB0aGlz
IGdldHMgZG9uZSk/DQo+PiBDb3VsZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZSBtb3JlIG9uIHdoaWNo
IGNvbmRpdGlvbmFscyB5b3UgYXJlDQo+PiB0YWxraW5nIGFib3V0IGhlcmU/IEknbSBhZnJhaWQg
SSBkaWRuJ3QgdW5kZXJzdGFuZCB0aGlzIHBhcnQuDQo+IEJ5IHB1dHRpbmcgaXQgaW5zaWRlICNp
ZiBvciBhZGRpbmcgImlmICggIUlTX0VOQUJMRUQoKSApIiwgeW91J2QgbWFrZQ0KPiB2ZXJ5IG9i
dmlvdXMgdGhhdCB0aGUgY29kZSBpbiBxdWVzdGlvbiBpc24ndCB1c2VkLCBhbmQgaGVuY2Ugbm8N
Cj4gaW50ZXJhY3Rpb24gaXNzdWVzIHdpdGggdlBDSSBleGlzdC4NCj4NCj4+Pj4+PiArICAgIGlm
ICggaXNfc3lzdGVtX2RvbWFpbihkKSB8fCAhaGFzX3ZwY2koZCkgKQ0KPj4+Pj4+ICsgICAgICAg
IHJldHVybiAwOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIHJldHVybiAwOw0KPj4+Pj4+ICt9DQo+
Pj4+Pj4gKw0KPj4+Pj4+ICsvKiBOb3RpZnkgdlBDSSB0aGF0IGRldmljZSBpcyBkZS1hc3NpZ25l
ZCBmcm9tIGd1ZXN0LiAqLw0KPj4+Pj4+ICtpbnQgdnBjaV9kZWFzc2lnbl9kZXZpY2Uoc3RydWN0
IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IHBjaV9kZXYgKmRldikNCj4+Pj4+PiArew0KPj4+Pj4+
ICsgICAgLyogSXQgb25seSBtYWtlcyBzZW5zZSB0byBkZS1hc3NpZ24gZnJvbSBod2RvbSBvciBn
dWVzdCBkb21haW4uICovDQo+Pj4+Pj4gKyAgICBpZiAoIGlzX3N5c3RlbV9kb21haW4oZCkgfHwg
IWhhc192cGNpKGQpICkNCj4+Pj4+PiArICAgICAgICByZXR1cm4gMDsNCj4+Pj4+PiArDQo+Pj4+
Pj4gKyAgICByZXR1cm4gMDsNCj4+Pj4+PiArfQ0KPj4+Pj4+ICsjZW5kaWYgLyogQ09ORklHX0hB
U19WUENJX0dVRVNUX1NVUFBPUlQgKi8NCj4+Pj4+IEF0IHRoaXMgcG9pbnQgb2YgdGhlIHNlcmll
cyAjaWZkZWYgaXMgdGhlIGxlc3MgcHJlZmVyYWJsZSB2YXJpYW50IG9mDQo+Pj4+PiBhcnJhbmdp
bmcgZm9yIGRlYWQgY29kZSB0byBnZXQgY29tcGlsZWQgb3V0Lg0KPj4+PiBXaGF0IGlzIHRoYXQg
b3RoZXIgcHJlZmVyYWJsZSB3YXkgdGhlbj8NCj4+PiAiaWYgKCAhSVNfRU5BQkxFRCgpICkiIGFz
IEkgZGlkIGFscmVhZHkgcG9pbnQgb3V0IHRvIHlvdSB5ZXN0ZXJkYXkgaW4NCj4+PiByZXBseSB0
byB2MiBvZiBwYXRjaCAxMCBvZiB0aGlzIHZlcnkgc2VyaWVzLg0KPj4gUGxlYXNlIHNlZSBiZWxv
dw0KPj4+Pj4gICAgIEkgZXhwZWN0IGxhdGVyIHBhdGNoZXMNCj4+Pj4+IHdpbGwgY2hhbmdlIHRo
YXQ/DQo+Pj4+IE5vLCBpdCBpcyBnb2luZyB0byBiZSB0aGlzIHdheSBhbGwgdGhlIHRpbWUNCj4+
PiBUaGUgcXVlc3Rpb24gd2Fzbid0IHdoZXRoZXIgeW91IHN3aXRjaCBhd2F5IGZyb20gdGhlICNp
ZmRlZi1zLCBidXQNCj4+PiB3aGV0aGVyIGxhdGVyIHBhdGNoZXMgbGVhdmUgdGhhdCBhcyB0aGUg
b25seSBjaG9pY2UgKGF2b2lkaW5nIGJ1aWxkDQo+Pj4gYnJlYWthZ2UpLg0KPj4gWWVzLCB0aGUg
Y29kZSBpcyBnb2luZyB0byBhbHdheXMgcmVtYWluIGlmZGVmJ2VkLCBzbyB3ZSBkb24ndCBoYXZl
DQo+PiBkZWFkIGNvZGUgZm9yIHg4NiAoYXQgbGVhc3QpLg0KPj4gU28sIGRvZXMgdGhlIGFib3Zl
IG1lYW4gdGhhdCB5b3UgYXJlIG9rIHdpdGggIiNpZmRlZiBDT05GSUdfSEFTX1ZQQ0lfR1VFU1Rf
U1VQUE9SVCINCj4+IGFuZCB0aGVyZSBpcyBubyBuZWVkIGZvciAiaWYgKCAhSVNfRU5BQkxFRCgp
ICkiPw0KPiBJJ20gYWZyYWlkIHlvdSBzdGlsbCBkaWRuJ3QgdW5kZXJzdGFuZDogImlmICggIUlT
X0VOQUJMRUQoKSApIiBpcw0KPiBhbHNvIGEgd2F5IHRvIG1ha2Ugc3VyZSB0aGVyZSdzIChhbG1v
c3QpIG5vIGRlYWQgY29kZS4gQW5kIHRoaXMgbW9kZWwNCj4gaGFzIHRoZSBhZHZhbnRhZ2UgdGhh
dCB0aGUgY29tcGlsZXIgd291bGQgc3RpbGwgY2hlY2sgYWxsIHRoYXQgY29kZQ0KPiBldmVuIGlu
IHg4NiBidWlsZHMgKHRocm93aW5nIGF3YXkgbW9zdCBvZiBpdCBpbiBvbmUgb2YgaXRzIERDRSBw
YXNzZXMpLA0KPiByZWR1Y2luZyB0aGUgcmlzayBmb3Igc29tZW9uZSBub3Qgcm91dGluZWx5IGRv
aW5nIEFybSBidWlsZHMgdG8NCj4gaW50cm9kdWNlIGEgYnVpbGQgaXNzdWUuDQo+DQo+IEJ1dCBh
cyBzb29uIGEgY29kZSByZWZlcmVuY2VzIHN0cnVjdCBtZW1iZXJzIHdoaWNoIHNpdCBpbnNpZGUg
YW4NCj4gI2lmZGVmLCB0aGF0IGNvZGUgY2FuJ3QgdXNlIHRoaXMgcHJlZmVycmVkIGFwcHJvYWNo
IGFueW1vcmUuIFRoYXQncw0KPiB3aGF0IEkgc3VzcGVjdCBtaWdodCBiZSBoYXBwZW5pbmcgaW4g
c3Vic2VxdWVudCBwYXRjaGVzLCB3aGljaCB3b3VsZA0KPiB0aGVuIGp1c3RpZnkgeW91ciBjaG9p
Y2Ugb2YgI2lmZGVmLg0KVGhpcyBpcyB0aGUga2V5IHRvIG15IG5vdCB1bmRlcnN0YW5kaW5nOiBp
bmRlZWQsIHRoZXJlIGFyZQ0Kc3RydWN0dXJlIG1lbWJlcnMgd2hpY2ggYXJlIGlmZGVmJ2VkIHRo
dXMgcmVuZGVyaW5nIHRoZSBpZGVhIHdpdGgNCklTX0VOQUJMRUQgbm90IGFwcGxpY2FibGU6DQpA
QCAtNDQ0LDYgKzQ0NCwxNCBAQCBzdHJ1Y3QgZG9tYWluDQoNCisjaWZkZWYgQ09ORklHX0hBU19W
UENJX0dVRVNUX1NVUFBPUlQNCivCoMKgwqAgc3RydWN0IGxpc3RfaGVhZCB2ZGV2X2xpc3Q7DQor
wqDCoMKgIC8qDQorwqDCoMKgwqAgKiBDdXJyZW50IGRldmljZSBudW1iZXIgdXNlZCBieSB0aGUg
dmlydHVhbCBQQ0kgYnVzIHRvcG9sb2d5DQorwqDCoMKgwqAgKiB0byBhc3NpZ24gYSB1bmlxdWUg
U0JERiB0byBhIHBhc3NlZCB0aHJvdWdoIHZpcnR1YWwgUENJIGRldmljZS4NCivCoMKgwqDCoCAq
Lw0KK8KgwqDCoCBpbnQgdnBjaV9kZXZfbmV4dDsNCisjZW5kaWYNCg0KPg0KPiBKYW4NCj4NCj4N
ClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

