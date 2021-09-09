Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5921240494D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 13:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183003.330910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIGW-0001Q4-1P; Thu, 09 Sep 2021 11:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183003.330910; Thu, 09 Sep 2021 11:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIGV-0001Mx-UQ; Thu, 09 Sep 2021 11:30:47 +0000
Received: by outflank-mailman (input) for mailman id 183003;
 Thu, 09 Sep 2021 11:30:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6so6=N7=epam.com=prvs=9886dc581d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOIGU-0001Mr-MZ
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 11:30:47 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03e79965-54eb-4a48-8c17-57101e46a7bc;
 Thu, 09 Sep 2021 11:30:44 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 189BRR2t005162; 
 Thu, 9 Sep 2021 11:30:41 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57])
 by mx0a-0039f301.pphosted.com with ESMTP id 3ayhdm80mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 11:30:40 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2768.eurprd03.prod.outlook.com (2603:10a6:800:e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 11:30:37 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 11:30:37 +0000
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
X-Inumbo-ID: 03e79965-54eb-4a48-8c17-57101e46a7bc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfL0utlFDbU+7GUU2JL5bfMOyLXwv3UPWJScXUiMjhW+yr/NL6zckl+fIvzhI7yXO1UvXdztVwD0eYQpHszUNgEXJSyVkVsbmDnSycnRNOuh7SVqp5C7Vw5qHMxEdr8anYkMFTyhW5DjfQ67RKsFt9JxZWOS+Zv9yA7okGmIUy6Fk8CqGj2Z7Q5X2rtloUimiHUqhBEX3peoUyUcaOQcYEl+M98IzTejzkRtYE3EM1+JVCU67Vuocpi8O38qUd1AevX5Vc4kpakU3zqcsQpFVZnzcfb6ulcZbfjWa29XJPcLsD+mi0hu/vIDX60RwosJ5CfaTKBY+MzYaVhHo2DNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eAHbnAwPso8A7XidnU7Twg9ps/SmWQk1WSgQVmzPR0Y=;
 b=etpTtkfkXmiZcGtFgdf+87+qVX7ay+eiHjYQ+PMrNaGGo6R9KDf/yCZH2J9WzgOf7i2V2wvemFuEewrxD6Qq6rVZV5YFrWA52DNd6b5GnTrA3W76Xcqlgi77vBBCMNchuvxM2Rb4ooCqOVy0nWPYmHyITJfn9+cSZ+/i2oXGCT7FjPzaORD+QENUEE23kYVQ/h3tqgvj5m5c2GcWBtPZOTCRRMrQFmB8D21TrPAold38gehf+FJFTCtrHkF4oTnV8hkN4dVES+18472o3nW5LDW4nFozGOVOJ5azvdVTAXVk8DyF7g5NJd57bTdZqhZc8/wgdWgMtG9311jpedrcvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAHbnAwPso8A7XidnU7Twg9ps/SmWQk1WSgQVmzPR0Y=;
 b=D6xDldpcM6DccfCBgbKbUaUihtUKmbvw2pPROyGaeNpGKKwopEo0/odS6VvojNzZdEco6acKDCuYevrgPyY6VRde/XLeUj6cflYSsltYv3dPZkHu4f5n7qX4RvBqSRS8Cc2KgODU2OqRFPTal2nI0tWZhj3fm7oJM1cflYV9MlQAS2dcb8gpvlv6EYuVIQANpARckdamBTRKwS9DurjZ96nZ8U7Yct6DORq6XrNYq/d1WP8gj5VV3ApPWvLhLxOf8cS49GY2mh+MmPRR+JViTIuYyAV0FcvfhzYaA0e8MdHUvYI83L2HAfRWWdFy/Cpz/3rrpUMjJRX2LTQc4M/B8w==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 6/9] vpci/header: Handle p2m range sets per BAR
Thread-Topic: [PATCH 6/9] vpci/header: Handle p2m range sets per BAR
Thread-Index: 
 AQHXoKxjXfke7B20QEeo6YjlfUMhlquXGvYAgAMgDgCAAAg4gIAA8L+AgAAy0wCAAA1uAIAAB6sAgAAGiICAAAwkAIAADEsA
Date: Thu, 9 Sep 2021 11:30:37 +0000
Message-ID: <d81e9eb2-c16c-1f59-644e-09bf3466be76@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-7-andr2000@gmail.com>
 <1fb1223e-005d-dc78-cd34-dc97191b316e@suse.com>
 <ba644629-a251-4865-8a7a-075392b9dffe@epam.com>
 <7e0c9d9b-6087-83ef-f9e8-1e9e6eb2d1e9@suse.com>
 <206c7b6c-6c0f-ce5e-6e62-15b46035b036@epam.com>
 <422a6543-ec2e-0793-3db5-09456e04f65b@suse.com>
 <dfb66ff2-9c9e-645f-4789-2dc6c21ff751@epam.com>
 <27043082-bf9f-5bba-f5a0-bb0e10426aba@suse.com>
 <e154e4f7-bd60-2645-1ce5-1c2b5404236f@epam.com>
 <3e7dc9f3-1536-0643-b732-4a203bee34d4@suse.com>
In-Reply-To: <3e7dc9f3-1536-0643-b732-4a203bee34d4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 298632fb-045e-4e8a-a863-08d973853ef4
x-ms-traffictypediagnostic: VI1PR0302MB2768:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2768DA68C2CE8E88861B07D3E7D59@VI1PR0302MB2768.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SFHRAmSlkOKN74bcJ8z5sRAUs/XU16wENqk2j0tI0z+VAyxsklV4PVunD+9FYsUTFwyFo4uIj8Caqy75gvPMGcp3wtIjwhAcP0Gy+oys4zkAg4ctHhdEbw8wHLKgdNU9wAOcFidkl9XS6Y3Kfj7SfgQxIoPGnu9lf7iYpL/gUXPOlTQau2yu66AbK3OrmZBpfG70uUrK744VF2bCAboug8bSK+k/SJgbL26avIBUhECAgmaxbR1hQBGTGfQ6JALnIWFYmwqXpEDrnCSjTG7BlvufgrSngRB2xb9z+/G561NbjgSvnjPME1Mbp3UGu5K5CR95LuHBjvuYfOpL2mCvkIBdHxduSZthlfTK9SfxFzfIo6+oWUimGmWpgUtxSIhm0wz4W4QkZEGT1mexZvIg2g25AsSgP4hPo0kOfLsjVmupLuroWReO2PS/CNagD5ungIdXzsnwPu6+elC26ZIFNwG4aOugLAXxukaxmIQupozEoejrpdgtETKdarxUp30dTdKp4JNVGPTq4v0v4GgW8C21SgA7ZEdO/xe0H7ItAjUx1mG/NC1ZPhZ5zKGyqjSRHortEoLV70JX/tAp5U8WvAoy1W9J76ufZBrM2WQG8JTPqNQ8hHp1woLvVCj9vpk4n6eWs445/vTafi5Y9Ahy/QOJdapfTn7Ce83thA5MJmEXsmLmHfvDz5z3x0mbtCXCGAXCsAYJkSzMjF6G90PtVKmS831+4wbLYUMDs8Rmgu34WIilzK8G781Cd/V1GgGF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(8936002)(6512007)(38100700002)(71200400001)(122000001)(86362001)(5660300002)(110136005)(83380400001)(36756003)(26005)(53546011)(6506007)(2906002)(66946007)(186003)(91956017)(76116006)(66446008)(4326008)(66556008)(64756008)(316002)(31686004)(6486002)(478600001)(8676002)(31696002)(38070700005)(66476007)(54906003)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b1QyZE5uRGlqcHRiaVZXOENFeSszVFdoS2J5Y2xrelVDZjkxN09Eem4vQzRw?=
 =?utf-8?B?YkkxM3ZpQU1HSG0ya1BIK0lHR2RIYUtsc3hKN0ZGaW5vcmJZeE5uNHMwVFNw?=
 =?utf-8?B?aHpObnZOR1VxRGtPR1lNZEVtZjVLaWRsVU8xQkdISnU5Z0RWcE0yMFFiUlYv?=
 =?utf-8?B?OWh5REtaeTY3bU15NG5jK2xPNjErQm9CbGVmQzBTSHFXd0NkVlEzZzVWa1VG?=
 =?utf-8?B?eURVQXFOT3FKME9ydFcwdjBYOEFMbHBvaFZiMmRMUk5qQW1TY0wwNno3ek55?=
 =?utf-8?B?dFpUb2tZT3NNb1gvSXVaUTRDZDJ6ZjY3OGFwcHJ2TFhQZ0pacGZNYnltYkQ2?=
 =?utf-8?B?aDZTYllkQStwZEgyVmJXc0dPdnY1ZzRpMGlwVkJhSmdUVFI0Vks4WSsvMU5y?=
 =?utf-8?B?czFMNnYyTDNPTjExYnVJTVNoSG1OTnNwSzRGYTk0RU1RbHVpaUxCaUVkYkZ2?=
 =?utf-8?B?WjlLMDZFL1FqczZHVkRKVzhDZk12dVc4WWpNY21xK2daZzVvaHV4QWR5OEZw?=
 =?utf-8?B?SUdaNllCSUNjSTJuUjNobDI2OVZvVVpZQTRNdW5hRDg1WjFMK2hxS1l5OCtC?=
 =?utf-8?B?TkZQc2NFTUNramswVFNvWWRmdnc2aDhjMlpJRkJsTnVneVJIbjhFd0FObEwy?=
 =?utf-8?B?c2oveTMyU000V3hpb3czWDBIMWZ3T1lGL3FCeGovUHlLZWN4MnJVR09ZcDh3?=
 =?utf-8?B?bFB3czVHOUtub1R3QVFGUldSb1o0NFRZcjhXVldoRkxNbzgzOUM0ZnJiY2hZ?=
 =?utf-8?B?a0NXSlR4Q2RCUnYxb3FkR3F4MjJUWk1SVTBIeTJ5STBSNGdoOFFwaUVmd3I4?=
 =?utf-8?B?NXFJOVQ0YVFNVXZTbGJ5d2czalNpOS9KaHVSK3lZdHZNRWg3a1V6TEFjTzRn?=
 =?utf-8?B?WGREOUZGN0VTOThNQ2VYNm5wWXZGSkhDS3NMeGtxM2oyK1VDZzBFS1dtOG1I?=
 =?utf-8?B?SnZJOUpLYVZEQmlVbWw0bmVNMnhhT1hKUXRObVpaV0R6WE1tSzRhRDZCd1pI?=
 =?utf-8?B?MnVSRHpLWXJZMlBSYmdOdmdmNnNvTCtqUS9oUHZJU2JoRmdIS1RWbnhSYkYr?=
 =?utf-8?B?MWlBVEdBNWk2M1pDNGk2THlQTk1TYWdCKzlheXBJcktWaEtEOWwzQi9VZlpj?=
 =?utf-8?B?WGNrbjQ1ZTZRenYxL3hXbGhoTmtCelkyYmFkazZTb3dOc2tGU2xacUNMSmdx?=
 =?utf-8?B?MGxwYmdVeVAzemVxNG8rY290TlozdmNsLzVYTGIyLzBrbzJTUHFRUUVzb2Fi?=
 =?utf-8?B?RGp4dXBNazE4RXA4SUluaEtYWkpwWmFGenpZUFZoU1Q2V1ZZQVB4Z0JQT3h4?=
 =?utf-8?B?TStTUlQrT2U1RkxVZTRyVzd2OFU4SEx4U3plNjhOb2E1alhqcWRjMDlHVFdB?=
 =?utf-8?B?dEpRR1hncy9KV2plQWttTm1jYXlDRHJjUy9OY2VWbjAwZExyb2NXZVZvRmRO?=
 =?utf-8?B?NmNSUllXcWtGWVBMOFl6dlQvM2FBeU5uN2kxWXVRZGtHT24vMXIyV2JpVWkz?=
 =?utf-8?B?cGozM2NSRnppK00vWGpEZm1zWXRoVmY0cVBqWk82ZkhPN2lFZGVmRkRNaWpl?=
 =?utf-8?B?dExoVGJyUnZaY2VuUVhqZUdFTFpGWXU1V0s3Y3p4RFAyUU9ySVNYallJeS8x?=
 =?utf-8?B?ODUxOU15Ulo3TFFQNHZpV25BQ2ZOL3ZvZnNuSFBPd1A4eWxGRmk3NlZBS2Rz?=
 =?utf-8?B?bEFVVnNXd2k1RDlaOEdJVkJ0MG5yS2RsRW15eHp0RmpKY2ZLR1FpeUZSc0ZJ?=
 =?utf-8?Q?cqwjsR/d2kdrBkRtQRrXnmMIZUQoXGGp9Z53y2k?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AF619CE15250B4D95FF8B1202F8EE0F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298632fb-045e-4e8a-a863-08d973853ef4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 11:30:37.1760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YhacY5nhW/zOc4PzfFlLUYU/BigakPdjBKyOrk07ToA+Srlfq2GHn5DMyG0AVjT4pyFhnY2rBOuMpap47Y7XoFoy/r1MZf2OCMh9IrNHwGliKB+duEMjis7J1QprEYmi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2768
X-Proofpoint-ORIG-GUID: pPEeKv-VkVlwsa2Lk1mjoRL4t4Cyoger
X-Proofpoint-GUID: pPEeKv-VkVlwsa2Lk1mjoRL4t4Cyoger
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_04,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090070

DQpPbiAwOS4wOS4yMSAxMzo0NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA5LjIwMjEg
MTI6MDMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDkuMDkuMjEgMTI6
MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA5LjA5LjIwMjEgMTE6MTIsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBBbnl3YXlzLCBJIGFtIG9wZW4gdG8gYW55IGRl
Y2lzaW9uIG9uIHdoYXQgd291bGQgYmUgdGhlIHJpZ2h0IGFwcHJvYWNoIGhlcmU6DQo+Pj4+DQo+
Pj4+IDEuIFVzZSByYW5nZSBzZXRzIHBlciBCQVIgYXMgaW4gdGhlIHBhdGNoDQo+Pj4+DQo+Pj4+
IDIuIFJlbW92ZSByYW5nZSBzZXRzIGNvbXBsZXRlbHkgYW5kIGhhdmUgYSBwZXItdkNQVSBsaXN0
IHdpdGggbWFwcGluZw0KPj4+Pg0KPj4+PiBkYXRhIGFzIEkgZGVzY3JpYmVkIGFib3ZlDQo+Pj4+
DQo+Pj4+IDMuIEFueXRoaW5nIGVsc2U/DQo+Pj4gQSBkZWNpc2lvbiBmaXJzdCByZXF1aXJlcyBh
IHByb3Bvc2FsLg0KPj4gSSBhbHJlYWR5IGhhdmUgMjogb25lIGluIHRoZSBwYXRjaCB3aXRoIHRo
ZSByYW5nZSBzZXQgcGVyIEJBUiBhbmQgb25lIGRlc2NyaWJlZA0KPj4gZWFybGllciBpbiB0aGUg
dGhyZWFkIHdpdGggYSBzaW5nbGUgcmFuZ2Ugc2V0IGFuZCBhIGxpc3QgZm9yIEdGTiA8LT4gTUZO
Lg0KPj4gSWYgeW91IGNhbiB0ZWxsIHlvdXIgb3BpbmlvbiBJIGFtIGFsbCBlYXJzLiBCdXQsIHBs
ZWFzZSBiZSBzcGVjaWZpYyBhcyBjb21tb24gd29yZHMNCj4+IGRvbid0IGNoYW5nZSBhbnl0aGlu
ZyB0byBtZS4NCj4+IEF0IHRoZSBzYW1lIHRpbWUgSSBkbyB1bmRlcnN0YW5kIHRoYXQgdGhlIGN1
cnJlbnQgY29kZSBpcyBub3Qgc2V0IGluIHN0b25lLA0KPj4gYnV0IHdlIHNob3VsZCBoYXZlIGEg
Z29vZCByZWFzb24gZm9yIG1ham9yIGNoYW5nZXMgdG8gaXQsIElNTy4NCj4gQW5kIEkgdmlldyB5
b3VyIGNoYW5nZSwgYXMgcHJvcG9zZWQsIGFzIGEgbWFqb3Igb25lLiBZb3UgdHVybiB0aGUgbG9n
aWMgYWxsDQo+IG92ZXIgaW1vLg0KPg0KPj4gSSBtZWFuIHRoYXQgYmVmb3JlDQo+PiBEb21VJ3Mg
d2Ugd2VyZSBmaW5lIHdpdGggdGhlIHJhbmdlIHNldHMgZXRjLCBhbmQgbm93IHdlIGFyZSBub3Q6
DQo+PiBzbyB3aGF0IGhhcyBjaGFuZ2VkIHNvIG11Y2g/DQo+IE5vdGhpbmcgaGFzIGNoYW5nZWQu
IEknbSBub3QgYWR2b2NhdGluZyBmb3IgcmVtb3ZhbCBvZiB0aGUgcmFuZ2VzZXQgdXNlIGluDQo+
IGhhbmRsaW5nIERvbTAncyBuZWVkcy4gSSdtIHN1Z2dlc3RpbmcgdGhhdCB0aGVpciB1c2UgbWln
aHQgbm90IGJlIGEgZ29vZA0KPiBmaXQgZm9yIERvbVUuDQoNClRoZSBwcm9wb3NlZCBjaGFuZ2Ug
bWFrZXMgdGhlIHNhbWUgY29kZSB3b3JrIGZvciBib3RoIERvbTAgYW5kIERvbVUuDQoNClNvLCBp
bnN0ZWFkIG9mIGhhdmluZyB0aGUgY29tbW9uIGNvZGUgYXMgaXQgcHJvcG9zZWQgZG8geW91IHN1
Z2dlc3QgdG8gaW52ZW50DQoNCnNvbWV0aGluZyBzcGVjaWFsIGZvciBEb21VIChtYWtpbmcgdGhl
IHNhbWUgam9iIGFzIHdlIGFscmVhZHkgZG8gZm9yIERvbTApDQoNCmFuZCB0aGVuIHNlZSBpZiB3
ZSBjYW4gdGhlbiBjb21iaW5lIHRoZSBib3RoIHRvIGhhdmUgdGhlIGNvZGUgY29tbW9uDQoNCmFn
YWluPyBJIGFtIHNheWluZyB0aGF0IHRoZSBjb2RlIGlzIGFscmVhZHkgY29tbW9uIGV2ZW4gaWYg
eW91IHRoaW5rIHRoYXQNCg0KZm9yIERvbVUgaXQgY2FuIGJlIHNpbXBsZXIgKEkgY2FuJ3Qgc3Rp
bGwgc2VlIGluIHdoaWNoIHdheSBhcyBwMm0gYW5kIG90aGVyDQoNCnRoaW5ncyBhcmUgbm90IGRp
cmVjdGx5IHRvdWNoZWQgYnkgdGhlIHZQQ0kgY29kZSwgZS5nLiBib3RoIERvbTAgYW5kIERvbVUN
Cg0KdXNlIHttYXB8dW5tYXB9X21taW9fcmVnaW9ucyBhbmQgdGhlIG9ubHkgZGlmZmVyZW5jZSBp
cyB0aGF0IGZvciBEb20wDQoNCndlIGhhdmUgTUZOID09IEdGTiBhbmQgZm9yIERvbVUgaXQncyBu
b3QpLg0KDQpTbywgZXZlbiBpZiByYW5nZXMgc2V0cyBhcmUgbm90IGdvb2QgZm9yIERvbVVzIChJ
IGNhbid0IHNlZSB3aHkpLCBidXQgaWYgdGhleSBoZWxwDQoNCmhhdmUgdGhlIGNvZGUgY29tbW9u
IEkgdGhpbmsgaXQgaXMgd29ydGggaGF2aW5nIHRoZW0uDQoNCj4NCj4+PiAgICBJIHRoaW5rIDMg
aXMgdGhlIHdheSB0byBpbnZlc3RpZ2F0ZQ0KPj4+IGZpcnN0OiBSYXRoZXIgdGhhbiBzdGFydGlu
ZyBmcm9tIHRoZSBjb2RlIHdlIGN1cnJlbnRseSBoYXZlLCBzdGFydCBmcm9tDQo+Pj4gd2hhdCB5
b3UgbmVlZCBmb3IgRG9tVS1zIHRvIHdvcmsuIElmIHRoZXJlJ3MgZW5vdWdoIG92ZXJsYXAgd2l0
aCBob3cgd2UNCj4+PiBoYW5kbGUgRG9tMCwgY29kZSBjYW4gYmUgc2hhcmVkLg0KPj4gWW91IGNh
biBzZWUgdGhhdCBpbiBteSBwYXRjaCB0aGUgc2FtZSBjb2RlIGlzIHVzZWQgYnkgYm90aCBod2Rv
bSBhbmQNCj4+IGd1ZXN0LiBXaGF0IGVsc2UgbmVlZHMgdG8gYmUgcHJvdmVuPyBUaGUgcGF0Y2gg
c2hvd3MgdGhhdCBhbGwgdGhlIGNvZGUNCj4+IGJlc2lkZXMgZ3Vlc3QgcmVnaXN0ZXIgaGFuZGxl
cnMgKHdoaWNoIGlzIGV4cGVjdGVkKSBpcyBhbGwgY29tbW9uLg0KPiBUaGUgY29tcGxleGl0eSBv
ZiBkZWFsaW5nIHdpdGggRG9tMCBoYXMgaW5jcmVhc2VkLiBJJ3ZlIG91dGxpbmVkIHRoZQ0KPiBw
cm9jZXNzIHRoYXQgSSB0aGluayBzaG91bGQgYmUgZm9sbG93ZWQ6IEZpcnN0IGRldGVybWluZSB3
aGF0IERvbVUgbmVlZHMuDQpJdCBpcyBhbHJlYWR5IGtub3duLCBHRk4gPC0+IE1GTiBub24taWRl
bnRpdHkgbWFwcGluZ3MNCj4gVGhlbiBzZWUgaG93IG11Y2ggb2YgdGhpcyBhY3R1YWxseSBmaXRz
IHRoZSBleGlzdGluZyBjb2RlIChoYW5kbGluZyBEb20wKS4NCkl0IGlzIGFscmVhZHkgaW4gdGhl
IHBhdGNoOiB3ZSBoYXZlIGFsbCBjb2RlIGNvbW1vbiBmb3IgYm90aCBEb20wIGFuZCBEb21VDQo+
IFRoZW4gZGVjaWRlIHdoZXRoZXIgYWx0ZXJpbmcgRG9tMCBoYW5kbGluZyBpcyBhY3R1YWxseSB3
b3J0aCBpdCwNCj4gY29tcGFyZWQgdG8gaGFuZGxpbmcgRG9tVSBzZXBhcmF0ZWx5Lg0KSXQgbGVh
ZHMgdG8gdGhlIHNhbWUgZnVuY3Rpb25hbGl0eSBpbXBsZW1lbnRlZCB0d2ljZQ0KPiAgIEluIGZh
Y3QgaGFuZGxpbmcgaXQgc2VwYXJhdGVseQ0KPiBmaXJzdCBtYXkgaGF2ZSBpdHMgb3duIGJlbmVm
aXRzLCBsaWtlIGVhc2luZyByZXZpZXcgYW5kIHJlZHVjaW5nIHRoZSByaXNrDQo+IG9mIGJyZWFr
aW5nIERvbTAgaGFuZGxpbmcuIElmIHRoZW4gdGhlcmUgYXJlIGVub3VnaCBzaW1pbGFyaXRpZXMs
IGluIGENCj4gMm5kIHN0ZXAgYm90aCBtYXkgd2FudCBmb2xkaW5nLg0KDQpZb3UgY2FuIHNlZSBm
cm9tIHRoZSBwYXRjaCBpZiB3ZSBoYXZlICJpZiAoIGh3ZG9tICkiIHNwcmVhZCBvdmVyIHRoZQ0K
DQppbXBsZW1lbnRhdGlvbi4gSSBndWVzcyB5b3Ugd29uJ3QgZmluZCB0aGF0IChiZXNpZGVzIGd1
ZXN0IHJlZ2lzdGVyDQoNCmhhbmRsZXJzIHdoaWNoIGlzIGV4cGVjdGVkKS4NCg0KPg0KPj4+IEFs
bCBvZiB0aGlzIGFwcGxpZXMgb25seSB3aXRoIG1lbW9yeSBkZWNvZGluZyBlbmFibGVkLCBJIGV4
cGVjdC4NCj4+PiBEaXNhYmxpbmcgbWVtb3J5IGRlY29kaW5nIG9uIGEgZGV2aWNlIG91Z2h0IHRv
IGJlIGEgc2ltcGxlICJ1bm1hcCBhbGwNCj4+PiBCQVJzIiwgd2hpbGUgZW5hYmxpbmcgaXMgIm1h
cCBhbGwgQkFScyIuIFdoaWNoIGFnYWluIGlzLCBkdWUgdG8gdGhlDQo+Pj4gYXNzdW1lZCBsYWNr
IG9mIHNoYXJpbmcgb2YgcGFnZXMsIG11Y2ggc2ltcGxlciB0aGFuIG9uIERvbTA6IFlvdSBvbmx5
DQo+Pj4gbmVlZCB0byBzdWJ0cmFjdCB0aGUgTVNJLVggdGFibGUgcmFuZ2UocykgKGlmIGFueSwg
YW5kIHBlcmhhcHMgbm90DQo+Pj4gbmVjZXNzYXJ5IHdoZW4gdW5tYXBwaW5nLCBhcyB0aGVyZSdz
IG5vdGhpbmcgd3JvbmcgdG8gdW5tYXAgYSBQMk0gc2xvdA0KPj4+IHdoaWNoIHdhc24ndCBtYXBw
ZWQpOyB0aGlzIG1heSBub3QgZXZlbiByZXF1aXJlIGFueSByYW5nZXNldCBhdCBhbGwgdG8NCj4+
PiByZXByZXNlbnQuDQo+Pj4NCj4+PiBBbmQgaW4gZmFjdCBJIHdvbmRlciB3aGV0aGVyIGZvciBE
b21VLXMgeW91IHdhbnQgdG8gc3VwcG9ydCBCQVIgY2hhbmdlcw0KPj4+IGluIHRoZSBmaXJzdCBw
bGFjZSB3aGlsZSBtZW1vcnkgZGVjb2RpbmcgaXMgZW5hYmxlZC4NCj4+IE5vLCB3aHk/IEkgd2Fu
dCB0byBrZWVwIHRoZSBleGlzdGluZyBsb2dpYywgZS5nLiB3aXRoIG1lbW9yeSBkZWNvZGluZw0K
Pj4gZGlzYWJsZWQgYXMgaXQgaXMgbm93Lg0KPiBBZmFpY3QgZXhpc3RpbmcgY29kZSBkZWFscyB3
aXRoIGJvdGggY2FzZXMuDQoNCkhtLCBJIHRob3VnaHQgdGhhdCB3ZSBvbmx5IG1hcC91bm1hcCB3
aXRoIG1lbW9yeSBkZWNvZGluZyBkaXNhYmxlZC4NCg0KRm9yIG15IGVkdWNhdGlvbjogd2hhdCBo
YXBwZW5zIGlmIHlvdSB1bm1hcCB3aXRoIGRlY29kaW5nIGVuYWJsZWQgYW5kDQoNCmRvbWFpbiBh
Y2Nlc3NlcyB0aGUgTU1JT3M/DQoNCj4gICBXaGF0IEkgd2FzIHB1dHRpbmcgdW5kZXINCj4gcXVl
c3Rpb24gaXMgd2hldGhlciBEb21VIGhhbmRsaW5nIGNvZGUgYWxzbyBuZWVkcyB0by4NCj4NCj4g
SmFuDQo+DQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0K

