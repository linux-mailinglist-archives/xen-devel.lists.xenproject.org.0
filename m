Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F36D543C6A1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 11:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216794.376529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffR1-0007u3-FT; Wed, 27 Oct 2021 09:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216794.376529; Wed, 27 Oct 2021 09:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffR1-0007ru-Bw; Wed, 27 Oct 2021 09:41:27 +0000
Received: by outflank-mailman (input) for mailman id 216794;
 Wed, 27 Oct 2021 09:41:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lYk=PP=epam.com=prvs=0934bd4bd6=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mffQz-0007ro-6T
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:41:25 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b500859-868e-4b5a-b6f5-a24f13a8cd3a;
 Wed, 27 Oct 2021 09:41:23 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R9SYsu027507; 
 Wed, 27 Oct 2021 09:41:17 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 3by2eggh5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 09:41:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6882.eurprd03.prod.outlook.com (2603:10a6:20b:283::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 09:41:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 09:41:14 +0000
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
X-Inumbo-ID: 8b500859-868e-4b5a-b6f5-a24f13a8cd3a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abl9azDnHaUtYamNfkqHcPk7m8Tr0uvt3st2JbwRpYo2FBGoH2w3FSfY6JHCyQ4//ipO2rekN+J5vF9KejqSb7CeYhGRWxvTggmkkEchknXkk+qoFpe42N4qtMm5wDF1ODeO/edOuf0O+BQ6LdRWftCVG3h8m7XZp+73gaT78Dh+NH47dOjjE6hJxbqZXiKR/4fbb2h3lgF2rjMWp+d1PQtz5u5fvl62zubclIKkcOzoHqAwAxoEJNSyuihWyCmDDYTNdbhDZv4Em19eO97RnwkvlJSeD63DboRAL3tactlcWJII0xSz9U8RUHMNKd0QlLnTVaKrdh+oMedBiFTsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Zo3f8esKNcRTrfaKmhM4Ab8eifI1HDYItbapSkXCU8=;
 b=THh1Scnn4AqDGD0lGd2gT3ov96FhebP3d1NPEY+LhCAg+B7wjv8TFDiZFP97uUJpoG+D25tVjszWMt/KWwpzSwgT2TQ8l7iMh96PUmI8XRCUVIZJhnqkjaGerX9Zd6R3VXHC4b4uquie/fn0rFb3qiSvsPpnynMeLdHziCIYKwGKv/lvpci62h/y4BWhrjdRJdswfEHRcDfT8giiRlGUDzUVffrd/N1wWUyixpxRz29KbaGJrU/aSyF2RBcNsVe+CzUjwTb1tm1J/sca4Zwcmq4OyfLUCljD8KmQ4Cs0PH3pG9VudERYES6d1ooiSBMNkVizvxYXD53XioStnTCafw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Zo3f8esKNcRTrfaKmhM4Ab8eifI1HDYItbapSkXCU8=;
 b=zFk2lh8XNdrx49OnQcmAm4vzxZtBToryY9Wf435ISbKpOZP+YWySw7K4baPYsXWsm4GhKOgBcncN6BKUbTzu/VFWSs2ms4uzjRUOH6cvdgCZ9QFzlFYOybgf7wk1gyHoxAA5i3dnUW4Mx5iuzHYjlaGzhjH5WUTKriGpHZWp1rHd93Iwtp5JqxOBuPldrhrgYtaEg9ryGynK7D5g1XZHgj1L86QIAH72liozjcjtDbgBYsMMo/oM1l3ijZbxYbA5YsEWWk3M7gNigMtuWSv6qv5ZqKWIsqeuLge8eA34rDtVUIgQxWzhT/ObvFpTcS73BSMRPZpt6x8+w5+xI21Jpg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Michal Orzel
	<michal.orzel@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 01/11] vpci: Make vpci registers removal a dedicated
 function
Thread-Topic: [PATCH v3 01/11] vpci: Make vpci registers removal a dedicated
 function
Thread-Index: AQHXtdAgeXiPCGUCJ0Oi6HCqPD8Y4KvQ2oUAgBXfUACAAAN/AIAABJuA
Date: Wed, 27 Oct 2021 09:41:14 +0000
Message-ID: <2b1e68c3-23c3-e10b-ff80-6c73bb09f17b@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-2-andr2000@gmail.com>
 <YWa+4hsaOxuX4tWJ@MacBook-Air-de-Roger.local>
 <387d3729-b182-1aaf-870e-505e90141606@epam.com>
 <YXka3C3x2ixNyrFE@Air-de-Roger>
In-Reply-To: <YXka3C3x2ixNyrFE@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ad14ea1-e467-4f4a-5357-08d9992deaef
x-ms-traffictypediagnostic: AM9PR03MB6882:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB688296384571CA6E0037626EE7859@AM9PR03MB6882.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yyNDekY+uKWXPqVQa++Tw/gskVueVrtGVQhDRju+cDS+y2yoRifrrM42uBqSitZTDcwxFBtMtJ9hnCrKfqYLsYXOykj/BnTUSLVjl0o140Y1en9g24uBF8EoCSBzD1uhpQH3W5WzAn5phW4Tw6sEJteXZ873zW/yYFc8cEUxr+1tScVpM1aw1ezG64bzWwQvqS6mll6lHPkq3RlezUr+MLwOhovugZkMeC0QWn4nBSevkK+fQyX/ctLMP4jcV7ShDUGVgfs1GSdk5Z9Fjnj8zZ/5aKeIJRfeZJV7iu3VaH7w+yxt7mwVlh6kNTLSobSJaiqW5/T4TqRLz0M0cBvPLMRZY2G1G3iyfcn/Mrv4tnDR2iJCQjW1HvTM5JJcOvo29FZOHitTJcqcVNaDuX/jJIFqLhwfm9aBfsuCDcHa/RSB0Qh0Ai1ivbbW0icjaJrvY6/zK8OY7K06nXwrW/a5U2JMCzY4zCiNxo+RYL7LXHSOuiKaQCcg5YD3j6DNMeSp8WcgZ4wBKJr2IPJ6jYCSt5RlcKnM5CYQrSyaToPSEst54rwRrDWvrw1MWwkeRafV0I515vq8WzjjdR/8m8eQoYiYuaRdRU4RcJQEcDH58HG2W0ljUs0QYvJBs7cTBUOqpBfZi4YILxA58JtqjCFdzXD58I0GEK/jXp+RfRq695w3KTCFJYTZKe2hXwaF5EKlM/VxYkWlcBbLBrw8E/KNX2zjUvsGhwvZ4VOnXIxxwUaFYxVpUk/5ehYxhFavsnjJ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(38100700002)(76116006)(86362001)(38070700005)(186003)(122000001)(91956017)(83380400001)(54906003)(6486002)(66476007)(31696002)(66556008)(5660300002)(31686004)(66446008)(6506007)(64756008)(6916009)(66946007)(107886003)(71200400001)(6512007)(316002)(36756003)(53546011)(4326008)(2616005)(2906002)(8676002)(8936002)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TWMxVDlMQUROalpnSFdKNWRkRGJPM0YyaDNodkFKWWtaTWdYTFhpMXJ4VFhR?=
 =?utf-8?B?TndZeTh5YjBNdDBkTFBVanJnckJVWFRpN0NWUWtVRXBSbzJCVktOQmdsazFH?=
 =?utf-8?B?c1cra01nWTNGbi9WTzI0ay84WTB3Y2hWbS9meW1wd3R2ZkxiMkFpalhTWVpz?=
 =?utf-8?B?M09CY2dYbm45OEpjVEN0SXBZcjRsN1FUbTJpMEdRWlpicm91RVBVUFJqUm91?=
 =?utf-8?B?Z3M5VVdNL1VwclJHb1RwMWdqV0E5YjdoZkw1b3A5OVBSTHdsZUdDTnpUOHo2?=
 =?utf-8?B?Unl3NWt5MERjNnVKdm5RVDRnYXFpM3lJZXVxdUVVWVl5L2ZPVEI2K1YzTFo1?=
 =?utf-8?B?cWY3ZzRaZGtEMXYvbzZ0ZENXaUJLcm5lYjBUakQ2RGY3eTFIZ1pCVGNIeGRE?=
 =?utf-8?B?bFhSeUUwakd2dHJ2eHhCUytSdEhjTDRjVWRPOEFOeCt2dkhLaUtCcmdFSEJT?=
 =?utf-8?B?Yzc2WHBSTXJKMGJhOXNKZGFTY2x0aDdLRkhGOXpudnlzQ1ozeVdwUjBrTXZm?=
 =?utf-8?B?QTZ1SDRETVBLZ3ExVUpGU04rN3RiYkhkZSsvNngzU0hxcWFHc0VDQkZxN0Ey?=
 =?utf-8?B?LytuOHRveUlPV0tsNjZhditHbmIyaHBjUUI3K0hRRWtiN3d1RC9VY3B3RFhl?=
 =?utf-8?B?OXpHRUx6UDdicVR2d2xPY1ZjNHhaQXBhRlJZd3B5bkovd0tjbEhGSENhbzhZ?=
 =?utf-8?B?OUxrM2thWFR5RFRhUlVJMFdlNkNHOXlicEpTaVp2N0x0M1Y1WklFUndYOUxQ?=
 =?utf-8?B?Mm9sNzYzay9lOFlVK2tYQzRoUTU3ZzFQaFN2T2xFN1ZHaGxlbHNHUGF0N25a?=
 =?utf-8?B?Qjg2eFlNQlpJUHFnakRpNWF3b2dpM1NYNmszMEFYcWlGWVgwamNsOEpCeS9y?=
 =?utf-8?B?bUlxU0k0RGRXQVRwRzlsU3JLMy81K1NHVktIZ2JsY3l2VVhxdjlTY2sxQXlL?=
 =?utf-8?B?L0pqaGo2Y3luVThDY0FVYVFkWU5mSGo4Y3BzOXA1d2RNaXhVQ25ZU1JyYWNC?=
 =?utf-8?B?ZzV5RUZ0ekpvbEpVaEdRRGs2L2VKc3F1QzZXbFByYWsvVWYva2Z1OGttWUU2?=
 =?utf-8?B?TExoQjJwVXplNkI3dkdvWVN2Vk9Oc3NkbG0vMWZ0N0tYZi91b3F2YzU2WEpQ?=
 =?utf-8?B?ZERqaXkyYkE0NW02TzlUNkVVaXl1OGRUcmUxbllhL2JDaW12VUpDZ21maGIv?=
 =?utf-8?B?VldpV2VYMnFzRFNJcFFYYkgwQllmZ1lVYzMybXlzajdvT2JNWDhud3pDcWxj?=
 =?utf-8?B?alRvWnZsSXBkWkZPdG5FTmdxU29OWTZZY1BWMXpDUUowZWtKNU5mOFFlV3pZ?=
 =?utf-8?B?S3pESjZPTFAzeE9RMy8wUnJFMjVUaVNxb0JubWhlMHdLZWJKOVpqbHNBdSt1?=
 =?utf-8?B?emZ2bDU1S2N1ZEdkcy9rQi8rSHpHREJYbDZhSi9tRHJDNVV5WERycGpFOFpl?=
 =?utf-8?B?Zm80MDR2OTk5MVliK3FnK0J4TlNWWHhadnJrelFRK0xPazJ5TUdzejh4UHV4?=
 =?utf-8?B?U09Xd3UwQzJmSi90M1NndnYxS3dIb093QVBkTWsyV2diS1pRdzFPb3UvV1JW?=
 =?utf-8?B?Zi9YdkI0L2dpVVZ3WDZuNTVjUWxFMDJqTnlXTXo4YWNLS3JabVRVdVJGSnhu?=
 =?utf-8?B?SFNJajhZeGZMVVhZdWVrQnQvUmxvdE9hSUE3YWJxaFM0a1QzU0JxK0ZmMVl2?=
 =?utf-8?B?dHNUamNXRzgyOWRiNFFNRGFSMFVycnQraHdFZXlJT0R2UjBNR0tKbUhyc1Z2?=
 =?utf-8?B?ZGo5WnhpYnBzV0l5bjhMQWxQSzRhcW9vT1N5L0pERHVGaFdrMTdnTlh3OEpz?=
 =?utf-8?B?UXZ0a1BDajZGOG5Ebis1eDljZ2xSTDk4YjJhWHRtOXlJejNDcG9mWm1yZCtT?=
 =?utf-8?B?eFkybDVKc2l3T0tPaVJ3RFRMc1BoeVplY0JQZ09RSmtYVVBXeGV2WXh6NDFK?=
 =?utf-8?B?b0w3RGRUQ1B4S0Q4ZUxqWG92VEZ3bTNUNVdTOGt5Wmkvb1BHbnhCTTZnRFIx?=
 =?utf-8?B?dGQxUXFiY1FUd2UycGJ2NDFvOHJFRGU0QkJ0YkErWVUzV2dkUFBOS25RaDRB?=
 =?utf-8?B?MCt6bVNnNnZqN2Z4VWZYbnlBTXd3QVpjYXdvQVRuN2JEeW1Bak0vOGd1WnZp?=
 =?utf-8?B?cTgyNTFBY3VoMGRadFNra1NNU2ZpREk3OHU1Z0JLYkJNZ3RjU2dpaFFyM0g3?=
 =?utf-8?B?TFlQQS9JL3NpelN6WUtGTkZIbzNEMm83eDVTaHZERWZ4anhWQXFFNit1ZkVX?=
 =?utf-8?B?T3d2MlZ0VWVEeFNoRkl1VFEzc2s0Q2xLMGlMNnExTGtPK08zUEVLVDhMa05j?=
 =?utf-8?B?OERzOFNHaW0rTzIwaHQ4VVN5T0NueFBIZGx0QWkvMmhxK0t6L3FEQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6C5D9F62C1B9E43B1C3FC198021AE03@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad14ea1-e467-4f4a-5357-08d9992deaef
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 09:41:14.2143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2wDQriuI2hWl/NyMNpiAnXiLy5Jd6ZYsa39TplW6W2wYaDa7GApnJDJtTT0AwHn8OkWiJdFRpHEspwZjTjDlTgeklNCh6RK+bXktRe+MEalurX8CYDwOwCbKO151hJ0Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6882
X-Proofpoint-ORIG-GUID: JP9W_BaJN9LpeWIVd_T0SgKJqfcOrkZV
X-Proofpoint-GUID: JP9W_BaJN9LpeWIVd_T0SgKJqfcOrkZV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_03,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxlogscore=922 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270058

DQoNCk9uIDI3LjEwLjIxIDEyOjI0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQs
IE9jdCAyNywgMjAyMSBhdCAwOToxMjoxNEFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEhpLCBSb2dlciENCj4+DQo+PiBPbiAxMy4xMC4yMSAxNDoxMSwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBUaHUsIFNlcCAzMCwgMjAyMSBhdCAxMDo1MjoxM0FN
ICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gRnJvbTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+
Pg0KPj4+PiBUaGlzIGlzIGluIHByZXBhcmF0aW9uIGZvciBkeW5hbWljIGFzc2lnbm1lbnQgb2Yg
dGhlIHZwY2kgcmVnaXN0ZXINCj4+Pj4gaGFuZGxlcnMgZGVwZW5kaW5nIG9uIHRoZSBkb21haW46
IGh3ZG9tIG9yIGd1ZXN0Lg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+IFJldmll
d2VkLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhcm0uY29tPg0KPj4+PiAtLS0NCj4+
Pj4gU2luY2UgdjE6DQo+Pj4+ICAgIC0gY29uc3RpZnkgc3RydWN0IHBjaV9kZXYgd2hlcmUgcG9z
c2libGUNCj4+Pj4gLS0tDQo+Pj4+ICAgIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIHwgNyArKysr
KystDQo+Pj4+ICAgIHhlbi9pbmNsdWRlL3hlbi92cGNpLmggIHwgMiArKw0KPj4+PiAgICAyIGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pg0KPj4+PiBk
aWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgYi94ZW4vZHJpdmVycy92cGNpL3Zw
Y2kuYw0KPj4+PiBpbmRleCBjYmQxYmFjN2ZjMzMuLjE2NjY0MDJkNTViOCAxMDA2NDQNCj4+Pj4g
LS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBj
aS92cGNpLmMNCj4+Pj4gQEAgLTM1LDcgKzM1LDcgQEAgZXh0ZXJuIHZwY2lfcmVnaXN0ZXJfaW5p
dF90ICpjb25zdCBfX3N0YXJ0X3ZwY2lfYXJyYXlbXTsNCj4+Pj4gICAgZXh0ZXJuIHZwY2lfcmVn
aXN0ZXJfaW5pdF90ICpjb25zdCBfX2VuZF92cGNpX2FycmF5W107DQo+Pj4+ICAgICNkZWZpbmUg
TlVNX1ZQQ0lfSU5JVCAoX19lbmRfdnBjaV9hcnJheSAtIF9fc3RhcnRfdnBjaV9hcnJheSkNCj4+
Pj4gICAgDQo+Pj4+IC12b2lkIHZwY2lfcmVtb3ZlX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRl
dikNCj4+Pj4gK3ZvaWQgdnBjaV9yZW1vdmVfZGV2aWNlX3JlZ2lzdGVycyhjb25zdCBzdHJ1Y3Qg
cGNpX2RldiAqcGRldikNCj4+PiBNYWtpbmcgdGhpcyBjb25zdCBpcyBraW5kIG9mIG1pc2xlYWRp
bmcsIGFzIHlvdSBlbmQgdXAgbW9kaWZ5aW5nDQo+Pj4gY29udGVudHMgb2YgdGhlIHBkZXYsIGlz
IGp1c3QgdGhhdCB2cGNpIGRhdGEgaXMgc3RvcmVkIGFzIGEgcG9pbnRlcg0KPj4+IGluc2lkZSB0
aGUgc3RydWN0IHNvIHlvdSBhdm9pZCB0aGUgZWZmZWN0cyBvZiB0aGUgY29uc3RpZmljYXRpb24u
DQo+PiBPaywgSSB3aWxsIHJlbW92ZSBjb25zdA0KPiBKYW4gcHJlZmVycyB0aGUgY29uc3QsIHNv
IHBsZWFzZSBsZWF2ZSBpdC4NCk9vb29rICkNCj4NCj4gVGhhbmtzLCBSb2dlci4NCj4NCg==

