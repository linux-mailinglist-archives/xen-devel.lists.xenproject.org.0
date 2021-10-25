Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3CE439753
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 15:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215834.375226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mezrM-0004YK-S6; Mon, 25 Oct 2021 13:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215834.375226; Mon, 25 Oct 2021 13:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mezrM-0004Va-Of; Mon, 25 Oct 2021 13:17:52 +0000
Received: by outflank-mailman (input) for mailman id 215834;
 Mon, 25 Oct 2021 13:17:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1v/+=PN=epam.com=prvs=0932af52eb=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mezrK-0004VR-Jl
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 13:17:50 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f32f8986-3595-11ec-840f-12813bfff9fa;
 Mon, 25 Oct 2021 13:17:48 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PCYLbP013884; 
 Mon, 25 Oct 2021 13:17:46 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bwrmkhafs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 13:17:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3715.eurprd03.prod.outlook.com (2603:10a6:208:43::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 13:17:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 13:17:41 +0000
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
X-Inumbo-ID: f32f8986-3595-11ec-840f-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1FPXr8/dqMjQK+lxMvAr1PxcjqA2L96w5fVuBnwpWelQLybrLDOsZgkViZEr+umoIM/YmrU9UDY+9leyEggwSWCL1o911GYzpGEI2auYskcjTjSQMiHltPhP7h2kj5whBjUToeEQkhmVkPIzY+49qiCLBg31mMKuy8UOAyMccaY8siYj2//Upi/xMJxYwJZyTTUMpJQixUZyfCqHCIdrrWASw6cPRNU1F71KEv/9ZeuUpXekoNmLBNwvzSjundSVKVR3G0xLlACqTiO1itYC2wQ98uTAW97N+ozxfXtWpBGrBWHZgJ5IzdDb6CKMtEdI7qySKmmbHeIACVWck7BkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqzGS1SaGtRcOEmrAj2q8wCwvZocm2Vum1lyjOsPydo=;
 b=nz44YzJbYj25cOhFtxN87aKmDU8Ku8RJDlte8+6O3pnkIhiykunDk/hfOKyZpwdd110Kdw8477XAU6eYndDgpdmr9PuqO1JpxP4IUeoeYhp6Ra/MHBaWXZUY+3WoXEvcyOR17VoshovMbHKzcrlYNi89xUEZ5r/QnbMnQ7/W4exozPKxu7PzKQN+rhIq9XD2qv4qXyEbwe2rOB0zbN/rbSO449TD9/Bo4a5DMxOFdDpmIz16CxAHsR4q4YrXoksFZB0e2XkNxb3H3Y5FoHnghUVBTkIGYaFpQxJ7t403tOqLQiB4G+Qpn9QsLEATyjcVVMKFaQkOD1Se14S5hvrnqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqzGS1SaGtRcOEmrAj2q8wCwvZocm2Vum1lyjOsPydo=;
 b=4z5M4PZ6hN+FqkaU9ynVb0bLSLt0l3ZXqrnjLl+2ILMbfgF2ZU90yyTnAM52kScayVWchMIiLbou2SUPIlbXExUnoOGyc+dAwQNYFzt5kUyEg4QD+XCWG+sqgkGI9Xonvi2bAS+tsNiEeUSo9lWoUMqbsBHdwv4/gGP8NQzcv1Ql8gzAz1gCBWYiZILbQvxI2KMJ7cFDxPKdfN0bJiFD869XShdt4eZ3YNylR3Vj7OyjNJbt/G5aLcyDMajDga1OYHdF7HUjHcmz82npkVSwvqfcdk+U/TMjLlqD2BqJgRvheMWwr2Epn0fpW7wCpICVrofn+Utg7+MfOgI+ffwxGA==
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
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>, Ian Jackson
	<iwj@xenproject.org>,
        Juergen Gross <jgross@suse.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/10] libxl: Allow removing PCI devices for all types
 of domains
Thread-Topic: [PATCH v5 06/10] libxl: Allow removing PCI devices for all types
 of domains
Thread-Index: AQHXvAknnKigXkenfkWfROoBKCqE16vjzIWAgAAAyAA=
Date: Mon, 25 Oct 2021 13:17:41 +0000
Message-ID: <d6f4f406-698c-deae-93a2-08ec383994ed@epam.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-7-andr2000@gmail.com>
 <YXatzfvSLZc9g6BV@MacBook-Air-de-Roger.local>
In-Reply-To: <YXatzfvSLZc9g6BV@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2c0fbed-1599-438e-a2d0-08d997b9d350
x-ms-traffictypediagnostic: AM0PR03MB3715:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB37156EA3A2E2455AC1508664E7839@AM0PR03MB3715.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ADQk4mCEbWlEsO3ZEwWNmBBo8v7rixOm+V8oqW5ye6UgkKcCmsGSxRSybNVplEI859a+SlQksqaGaEgRT8h8Dd2NvQ/GICUYcR2j0nwfd8F68/DMIEXeBZOS3PD/4HpV3EyMA1EkApC0nEcHt/91yIKKWXP016zFQU4bF+JUSOSrz109T1SC1SWkwPR6qbUSrXhHriC/tNfXYoLQ6XHTd3p0SHbYfeJo8oz+d2jAe+pBg7yoLEZJ73tkxMo8tynE4XVOAbNjXpcUh9XcvXMQxfhjDFXWpRXELpRtFYZL/vahOiJS46TpcP8hmL+7ntk5EpGDj940uXq9bVagtjr8PHJwR6SFd8fegYCLCvZ19h2S0eOCxKvjPzCAPE2f6rSDC44NW5sIbCZ62bmoNsSN13hdF2doh3lnJ/Bzz1nox4sQVm+UyntB9cWi5awm18Ln/om8PXOunot/lzuzBJchL3TZrFN4QjM7fHsqmqyId3DRi9ykPQnyEhcAT6NjiaoUY5RRUWZn8qR17CIAX+xUe/4cqiTBKS9efbh2gxY1MATjVpBKHNlJonEUE+INeGWljKlxdp8ximUw6IHLKXe9n/1uQez5qNX8TqbEU5LJgzUpccD1mjaoBeA0GuMXvOC2cUHLFCyF++Z3iR7/j80Wn/3/hLEPjVWTKBqjbhlMRzzoj8703rmKqZ0Z367Bx2HBcvAgmAZEvxmpqpzQiZ9eI6eZgNGkcTYhIziTG98gUNHxi7wweM3SYzNo4f14KCjD
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(26005)(508600001)(5660300002)(8676002)(53546011)(6486002)(186003)(6506007)(2906002)(2616005)(7416002)(107886003)(6512007)(8936002)(4744005)(66476007)(54906003)(316002)(122000001)(31686004)(38070700005)(6916009)(64756008)(66556008)(66946007)(66446008)(38100700002)(31696002)(36756003)(91956017)(76116006)(4326008)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MUYwRGJpUTl4OWhCbVJkMllKcVRQdnhYdFZRTVZ2eEkrTFFqOGw4Z3dtNmRE?=
 =?utf-8?B?NHU1aXIxQ0xPdHdwUHFQcFlJR3JHT3dDaEVVcWdJVmhSYTQ1TlcwdFhjNGg2?=
 =?utf-8?B?M3psdll4dEYrcWFHMXV6Y0lFY2F4dWJ4eVNvdXdnWFZWZmpydzRSNENiY0Rp?=
 =?utf-8?B?V3VxT2ZsQWMzTzFGaDVVSmF1QjZVNDZMdFltajB2bjVUQ29JaDlpN3JLQmZH?=
 =?utf-8?B?eHI1ZHk1cS9TV0t4ejBrS1VNR2FXeDYxNGZwalZxVmtrdXNtWmpsSXdHa3dK?=
 =?utf-8?B?WjJ1NlRLZ3Z4emtDVVZnTzhwM3NzQ0lDRGRvN2NVWE5TRDFMYllLSHBBUDJP?=
 =?utf-8?B?RzdSYzdWQStmU044L2FYMExXUCtoMEpuVGlyQTJyZzJ1N09mdVovNEZLK29L?=
 =?utf-8?B?UER2VnJxb3FZZkREclA5SzZ0blJUQ25wdTdrM2toQWd0SVBQWVVob3RNaGEy?=
 =?utf-8?B?eXZ5dERReVpUMHpETzdaUWNScmo3OVJJU0wvZU9QaGJ4d1gwRUhMdnRGNzIr?=
 =?utf-8?B?bnhMSm9lSk13NWtBS2UvZDRsdU9kRFZMNEN0QVdQTTdaQzk5Si91TE1lbFdV?=
 =?utf-8?B?YUo4YlY3NXdhclpMNHNDNmE3MXpzSUFUb2pmK0ZxdU1vc0tKSEU2dEtVQS9a?=
 =?utf-8?B?azFONnlMOG9tcWtwMnkxU1BlU0VaczhSZEJaWGNnWitzckQrdFd4RHBROU1B?=
 =?utf-8?B?NGdqOERnTWMwRDhkY210QXlPUThXNDhjN1NvS01LazRkTnNObjIvZmlMc3RB?=
 =?utf-8?B?RUJvcmZaOGVEdEdaYzIzTXFNclhQbHh3UlY5RmV6OHFkNVlhMnY0WW9sZmpC?=
 =?utf-8?B?aGhreWJVOXUzSElaSFZXaWZJS1NGUDc1NnpqcHdaZVRwQmNCanVIZ0o4cXlI?=
 =?utf-8?B?dDQ1bTc2eDdSRUQ4M3liRmNiUy9Pa05lTURnajVKL2wxZmp5S1ZSTW5FVUk1?=
 =?utf-8?B?WGsxTW80WVh4RGVUVmw0ZmlXUDYrVlprZUcvTlVBckN3NUVZYnNyc1k3cnpn?=
 =?utf-8?B?QTNvSWtYUE5nQ3FrNmN1eHF3MUNId2R6TUZ1MEt6WVhsaGpDdmE5aFRVeDBs?=
 =?utf-8?B?dzgwWThlNUZqV254QWs1N3VaNk9TajJlZmJXcmQ4dU5hdlluelBqOVF0Q2w5?=
 =?utf-8?B?NktxTUJtVmw2N0xDZjZTOHUwT3QvMDl4TmpucWVKd0svTkZQWlZ3Nm5Lemtj?=
 =?utf-8?B?YzVmNnNCMkh4aU5DNjZOa1AyYzlFYTRMYkxBQ3hLbDJPWmRWdDI5dm1mTFQ2?=
 =?utf-8?B?L293alBuakNnalBVYmZ6RXBSdXZCR0VwQW9rWnR6R2FhRjN6N09vT0s3UXRG?=
 =?utf-8?B?UGZydE42VFVIaE8wLzNuYnFIWlpLY085Z2JGeU92dHdLR2lVYm1SQ3FaRFFa?=
 =?utf-8?B?Y1dXdDVCQmxzNHBVSXdOYUJGa0dnU2d3T1lsTXhqWjUyaW5ncnBUY0dkMmZR?=
 =?utf-8?B?Y21NY3NHL1pPY1A0cFo1MU8wKzU1bllPREFHQWxGM2FyZGFWdFJTMktRWkJ0?=
 =?utf-8?B?VXV5T3E3RUlCdnV4WTltSGJPVEtDZlBBZ3c0djVrYml3b0tJWDk3Mkt2Q2Z5?=
 =?utf-8?B?WGY2MzVQSUFVdkNzZlpWKzJFQnA3Z0I3cW10R0pJMmovc3M4UHJBWFozdWNu?=
 =?utf-8?B?ZVJFY2Z3WHRDVVB3SHUxRUIrbHN0WmlnVHVKRDU1ZjRUY2ZkYXluYTlTcXZO?=
 =?utf-8?B?UDlTbGVpWkFVN3ZMVHEzZTdwbnNvT0NTcTdMN1VKNXRrYVdSUTA4c2Uzankv?=
 =?utf-8?B?dzhoMUFaS3J1OUI5QktSRzJnRWtxMit3RDlGS0YxdWVlbFJkVnVtVmRUdEhi?=
 =?utf-8?B?NmtSd0V2cG4zNWZvY1JEWmNpVkk4THcyTFJ2VHRlL3hlcjE4cUY1bGZCQnZj?=
 =?utf-8?B?Zk9QSjR4OW5SWnNEVzU1VmgvR0MyN2xPSmtIT0FrQU1aYm9uTDhxNGFSUFlk?=
 =?utf-8?B?VElVUURBb3pNNFkyTnMyZEhUd3lnR2FHc0VlbnRLQU9RZnhqS3VMRTRWZENF?=
 =?utf-8?B?ZU0vVENCVEZFaHp4VENJcWxWS3pUQ1BaUHdsaEhTcGZzeXJ2OW51ZEtqVTZO?=
 =?utf-8?B?cjhsUS9YMkFZclU4TGROQ1FYRkxvaGx4aEYzTk1SV0x2S1BYcXRRU1FXNFFz?=
 =?utf-8?B?V1Fpd2FyNU9VNU9pelhvcDVNNy83Wk9vbXJFNjB2NFNrRFI4cTZDVnhjclVt?=
 =?utf-8?B?dTZhK095NjhQZ00xd09JSTQwOWUrR3lBRm5ZalNjY2lMMzNhOHVLQzMwUmRl?=
 =?utf-8?B?cUtmREpVQ1B5dTBkaFJCLzhpeThodzdJRS9tK2hBWURPdUhZWWtoMmlmVlNO?=
 =?utf-8?B?UWZBbVVkWDB6R09heVBvT2RpblAxbzBkR0sxQlZJSXIrNVhHYndsZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <900A2F9CDA580C43A4309987185A39E6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c0fbed-1599-438e-a2d0-08d997b9d350
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 13:17:41.7605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rEc8EEkCmIWzEyx+FWzwWdBkRghMq3UWyYvh6x69KZ4DxwtvtVzyYy1r6reX9T98d+Aa7YC+cH3OT2EF/KdXA2Rj3tZsIr7NdmnVBy61pmjCkPQjIdIdeDJ8rZ1hU0aA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3715
X-Proofpoint-GUID: 3KTYIkw00oOPb-ZzwuHwl2iD1gacpApa
X-Proofpoint-ORIG-GUID: 3KTYIkw00oOPb-ZzwuHwl2iD1gacpApa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_05,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 mlxlogscore=697 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110250082

SGksIFJvZ2VyIQ0KDQpPbiAyNS4xMC4yMSAxNjoxNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gRnJpLCBPY3QgMDgsIDIwMjEgYXQgMDg6NTU6MzFBTSArMDMwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gVGhlIFBDSSBkZXZpY2UgcmVt
b3ZlIHBhdGggbWF5IG5vdyBiZSB1c2VkIGJ5IFBWSCBvbiBBUk0sIHNvIHRoZQ0KPj4gYXNzZXJ0
IGlzIG5vIGxvbmdlciB2YWxpZC4NCj4gSSB0aGluayB0aSBtaWdodCBiZSB3b3J0aCBzYXlpbmcg
dGhhdCB0aGlzIGlzIGEgcHJlcGFyYXRvcnkgY2hhbmdlIGFuZA0KPiB0aGF0IFBDSSBwYXNzdGhy
b3VnaCBpcyBub3QgeWV0IGZ1bmN0aW9uYWwgb24gQXJtIGFmdGVyIGl0Lg0KVW5mb3J0dW5hdGVs
eSB0aGlzIGNoYW5nZSBoYXMgYWxyZWFkeSBsYW5kZWQuDQo+DQo+IFRoYW5rcywgUm9nZXIuDQpU
aGFuayB5b3UsDQpPbGVrc2FuZHI=

