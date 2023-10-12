Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AEB7C7946
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616065.957782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s2-0001Fw-GP; Thu, 12 Oct 2023 22:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616065.957782; Thu, 12 Oct 2023 22:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s2-0001Aa-B2; Thu, 12 Oct 2023 22:09:30 +0000
Received: by outflank-mailman (input) for mailman id 616065;
 Thu, 12 Oct 2023 22:09:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3s0-00016s-H8
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:28 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff93ab1f-694b-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 00:09:23 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CKqml6008371; Thu, 12 Oct 2023 22:09:20 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpr7cr8dp-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:19 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6376.eurprd03.prod.outlook.com (2603:10a6:10:193::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 22:09:16 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:16 +0000
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
X-Inumbo-ID: ff93ab1f-694b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwV1CL9F8uqYT/YStuDwHZR4YQ6G9v0Dnik/ojsBNLU9mVIK2fEMZ483/xJS3hcal3szhTlGRpxNZI9EtVzn+ToZPYQPw3GFpGOQgVT53PxGDT8x6vjgwolRNFsprEPHWEukTnU9V3nm8LC/U9zFzSYVRf9WFjxEU27qiol87OJ0Y45hX1zxuy7V34lAmf1u9A/tPHRdqMCHmAFL6mul298QT59EzXmaG9bUP3IyfcHdmhC86V0+TUwJvEJyOll1zlwqmnp4Lf2RshwDnoKryHBCpnkqJLDUCmYmtSmStzED/R1DP2bAjQaJlJWjCxhucW/oFn+/WZTzrrRlVNmwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQA/auCUyQ9aU8VntbUejZ+kWLEP5minC3jSAets2yA=;
 b=SAxexvi/1Qls45JhUuym0XSFO2xxGma+jxRhZTXRkDFsr/z88HelTDYgQ3SFiwumGRJ2yd3o/v4FP85+DN8QoMwS3MySH9VPN6e4+kJ6dSIVPkog1SFj1kO92yYfGTtPXf2dUrMoscHfPPZUB3/Xm+AMF8B6ExiqNBQ8ww9pg4btosVyz3R3YGqfY6BiSApdBgJ/Rh2qs1kqGRfwVFljeTfC8XNieKZGuS0QxWvfgb2RGuMFbPd4dDLLN0uiC2FJoh9hmN0F/xRCtP+KiGrnURKlZ6zRmwU47Y2dq3bph4GBPPj1cbAQPnecuxbZEcYL5bwvWE9cecxHBHXcd4nHxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQA/auCUyQ9aU8VntbUejZ+kWLEP5minC3jSAets2yA=;
 b=jPyTj5dMXQxkSyCkShcE2yOwiiqiFDb/3SorteaR0KrCWWULvvzwnTdRmaBrRwwSDEYzy4GrQ3cVwU84xx++PJ91U2GD8x2U5xzTV/5O8CLlJomkRpqLRq4+BlwysYqkBE/MPJWGBT1cD7z9ItWLPhrJjf83Xe/MYDs5cLDEwOpx7f3S6oXcdTHf1VUZvDaie7wPYjLAIinTrpck1dMtyLG6EzhyM9cgW4G/8AigMZDbSVGAwtYcrRQSM/CuNb6rABNMTjfXgJE1BDAt/vP/XhkKuPy9181D7D4gO5HE9PVY/kTdodly0x7gUBQeZJ+8f+l6lVF6SXrjhqgR/TUYoQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: [PATCH v10 04/17] vpci: restrict unhandled read/write operations for
 guests
Thread-Topic: [PATCH v10 04/17] vpci: restrict unhandled read/write operations
 for guests
Thread-Index: AQHZ/Vi9RFnVSEkUl0CU8ZWONnKP8w==
Date: Thu, 12 Oct 2023 22:09:15 +0000
Message-ID: <20231012220854.2736994-5-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6376:EE_
x-ms-office365-filtering-correlation-id: 0708c5ce-f72d-4f88-64bc-08dbcb6fdfed
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pCgljNsC/vH2LHKERU8YLBnRmE2rqcuFdfgJXxDu7qHVgk4fsnMHSIMySATppl/Kjs1xXSCHSRitKlkpeFGmEQUX4OnIZPYlDXLWikqDiur5snnt0K+LIlgZNfoIZsuViaDejuhoVncg9BkO7Kp+UzUB1MkJE/UkmW3+Bv9ol8yLWxuNU96pIptzeHPfr/Mts3X1OxJSUkeWIp47tk7BBARkzkQpL4qQ7huorTxXG4kMz7+tHLoTyzX+TQIItZwF/PkK/HE/8ZZSiJLgcqArZWl3OnyvsWBlvY+oQEWTqJwTPSTls7VT/ItXvexvM8rbrpzr2IsghqRWP0S3JAY+lLoRWJl6KM9H3nWf2/XKd6OezEyopduBZldQbtG+ocMlfMauZgD6IIH0AhXeK8IejrjnAQnUefcSYDMcIxGV2IyDUNy3bawJ0QipwXEDz/r9qqTUlIB3lETBLAdc0gTFgDoOyO2aMla9BotxfHoFh8sKdNY0Yujn2JYC3BwjKnHrBBNzkplgQi1HP8bfk9YLTjj6HZ/qQb/np/BC1Gbw6TDk0QFy0Jb6NZbCwYC9M6PRBZme1XZA6MhgTK/zcib6al56ALzuGSl9QvLA5FOs646OoPwFgNqoT9+KuVgcc+3v
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2616005)(71200400001)(26005)(6512007)(6506007)(55236004)(36756003)(86362001)(38100700002)(38070700005)(122000001)(1076003)(83380400001)(91956017)(41300700001)(64756008)(316002)(76116006)(54906003)(66946007)(66446008)(6916009)(66556008)(66476007)(2906002)(8936002)(5660300002)(8676002)(4326008)(6486002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TDZmZGxSa1E2U2Q3Z2dyc2xNVzVncFpTL1QwMDlRZ1prV1FpMU85NVJrMWZO?=
 =?utf-8?B?R3lCdmp3VEgrVHFvMUVnMjR1WmJXUWhvS2VtbFI0ZENCYitWMzFUSnk3dFFJ?=
 =?utf-8?B?Nk41V09lb1hXL0N3YjREUEd0VThWak1vQ2JnSi9TNHk3OHdnb2kzVVMyeGdS?=
 =?utf-8?B?cDR6ZkdJV05jRWdoeVU3MVluV1M0aTFqR0p0UWNISW0zTUg5TTZKZ2VVL3U0?=
 =?utf-8?B?UWNNck45cm8za2pNY1lZTnFZdWVsOXd4OTJKOUdmc3phRE5oRUdEWnhjSEY1?=
 =?utf-8?B?emczTU1TZld2K1dxVkkyRVo5a2FZSjlyV2FoRFd0UThkcUtwV2xBSGpKTkNk?=
 =?utf-8?B?NEVEQ3dkcXYvVlZBc3IwNUhHLzE2VkxSM2czNlFFS2FXYWhybnlHbVFRQ2d2?=
 =?utf-8?B?UGpIZzVmNHRQTzNQY0h0cmhJd2ZVK1BCN0RST25pc25jdjF0WGVLRDBWcDZs?=
 =?utf-8?B?M2FpTElpaGpPZTdGZkNGdFVVMEt4SWdPOTVRR0NvdVpjUUtHeDkyUGVIWE5n?=
 =?utf-8?B?TmdzNDlKU3R3VENKakFJRGxZWlVON283K3I0ZUVwemF1bXJTWXZENzlLK09q?=
 =?utf-8?B?bVJHRnpMYSt0RDlzYjREYm9FZVk0Y0h2UUJhTW1sb0lnQ2Y3RC9ycDBTTWs5?=
 =?utf-8?B?bSt0RWp4ak5xbWl2b2JJT3R3d0ZTUlYzOGE5RHJXenhqSGZRQ080T204aFFz?=
 =?utf-8?B?MjBSU0pmeEZjamU0QlZWa0V0Zzhyc2JUcVIwd2RGbFo2Q1RoTC9kbWFjRmJD?=
 =?utf-8?B?VG51V3ZGVFJIQjFXWUZqWFdGdnVsQ0NCNVUvT0ZyK2dicWxkVUgybUVBUlhp?=
 =?utf-8?B?K1hqYzhiTTZJZDEvajB6R0xvajR5Y2NlR3BrcHpDb1VRWUgxN0ttN1lvekJs?=
 =?utf-8?B?QTl2QlY0OGxhbFBacXFTTXBGWWRSVlhVTUNoQVNYYjcxM0t4emVtWm42UjY2?=
 =?utf-8?B?VktrN3pjbUhYV0FCRHIxYmxEVzlmSUxWenduN1hMWXlhTVhOTnNOWllFV3U1?=
 =?utf-8?B?a3BFK0dUQkZlSEN3LzlXRzZ5blczQ25DVTFvUGlqckxwVzJUVGJlN0hNNkVM?=
 =?utf-8?B?VTF6QXh6VTByZ280YVJDNlkwM2FNQnN4R1o2MEpwcks3SE5DYnF6ZUgwTDJv?=
 =?utf-8?B?ZzBZQWJHWGp0QlFsQlB1OVNaR1R2RWxOVDZvc1dndE1hSFk1WnQ0V05SUFkv?=
 =?utf-8?B?SWhNaEFZL2RlWFFXREtjV1U2MFZEdVB3RTRQZStLcEZHOWlGcytIeHlIRWlm?=
 =?utf-8?B?YlNzWk45T2V3MTFxR044MC9ON3JPT3B2ZGc3MkhrV0ZBZTE5S2ZoQWZqM3N2?=
 =?utf-8?B?N2NrZ0NjcTZ0K3I1SERiTHRqNjlkeGtoTGNKWjJLT0tOTmNadHkyVUJ4dVNN?=
 =?utf-8?B?QXlhTHcwdkZ6TWFEbHBZNVJhM01KWldMT2ViZ2FyckRyNnZlWE9LWFVFbGdF?=
 =?utf-8?B?NFFza3dmLy9LVk9xU3lobGtiVDVPSFJ1TkpURmJxY2pldyt3NXhHREd0VDV5?=
 =?utf-8?B?SDhXSTNOK0hRb1l6REFlTCtnaU1ic1JTcThjSEJnMkpCOGI0em15VGxRbUhE?=
 =?utf-8?B?VWRhSGtUdk52K3FSK2NDT1ovSlV0SnhqMGd4ZWxUZlAzSDBoWVFRN3dCV25t?=
 =?utf-8?B?eHdUZ0JybHBkOHdXMkNqek14U21QY05pOHBkSjhtbk1RVnFGWEZCYVZablFJ?=
 =?utf-8?B?NVpoSXdCSzF5R1NyYy9YU1lqcmIxbS9BanlqR2RrenRwYlRCeng2bmxMRHhP?=
 =?utf-8?B?dVF0cDllN0g3cXp0amREME1Mcno0VTcwRk8zZG5LU2FhcitEaGFlSWpDVEdE?=
 =?utf-8?B?d25Kd3JNcEU1UU53OUhUV3pqaGFxZFpzMUhNYnBqSXRPelpKcGt5cWh5RUFO?=
 =?utf-8?B?dmtXd2ZCQ2svOGxDN1g3WHhSY3hYVWlCRkNVdWV4WEdqTXd3RmxNeTBIZ3Fr?=
 =?utf-8?B?Y0pHbllTZm1kYUVGYllVZ3RiZVYrK1BHU2w1YUVFTFhnN0I5NUpsYytPbjFG?=
 =?utf-8?B?cVJ0QmthVStrZmxsdkhhWk5pMlBMbmlvdEUxN0FhZEx6dW9WTVVJaDk5L3Vh?=
 =?utf-8?B?NWVQK0p1QjR0OXY2RGRubVlRdFZHYlRXQ1ZJdklUcEIvQmFJT1BvTmZDMkJQ?=
 =?utf-8?B?WXhzWk1RbzNxcjlBZUxmMW1UOGRNNVY3Uld1ZThmU3VieG5OeTBpR3Q0MFFz?=
 =?utf-8?B?Smc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B31375D5980FBD44901CB8977DF8A0B2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0708c5ce-f72d-4f88-64bc-08dbcb6fdfed
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:15.7341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MAeqH9VN3RfHTineyTIwTsWNdPI6IyB2e1jn3Nv8ierpvEOXIgIL1+TazPXWAapZQfWO4a5UirRii5eToyXaa/uzroym+EvnYS0fiHvhPHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6376
X-Proofpoint-GUID: o8iHpim3AG1REOvPtu8c6yw4aPgPdVM1
X-Proofpoint-ORIG-GUID: o8iHpim3AG1REOvPtu8c6yw4aPgPdVM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120186

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPg0KDQpBIGd1ZXN0IHdvdWxkIGJlIGFibGUgdG8gcmVhZCBhbmQgd3JpdGUgdGhvc2Ug
cmVnaXN0ZXJzIHdoaWNoIGFyZSBub3QNCmVtdWxhdGVkIGFuZCBoYXZlIG5vIHJlc3BlY3RpdmUg
dlBDSSBoYW5kbGVycywgc28gaXQgd2lsbCBiZSBwb3NzaWJsZQ0KZm9yIGl0IHRvIGFjY2VzcyB0
aGUgaGFyZHdhcmUgZGlyZWN0bHkuDQpJbiBvcmRlciB0byBwcmV2ZW50IGEgZ3Vlc3QgZnJvbSBy
ZWFkcyBhbmQgd3JpdGVzIGZyb20vdG8gdGhlIHVuaGFuZGxlZA0KcmVnaXN0ZXJzIG1ha2Ugc3Vy
ZSBvbmx5IGhhcmR3YXJlIGRvbWFpbiBjYW4gYWNjZXNzIHRoZSBoYXJkd2FyZSBkaXJlY3RseQ0K
YW5kIHJlc3RyaWN0IGd1ZXN0cyBmcm9tIGRvaW5nIHNvLg0KDQpTdWdnZXN0ZWQtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KU2lnbmVkLW9mZi1ieTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KUmV2
aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQotLS0N
ClNpbmNlIHY5Og0KLSByZW1vdmVkIHN0cmF5IGZvcm1hdHRpbmcgY2hhbmdlDQotIGFkZGVkIFJv
Z2VyJ3MgUi1iIHRhZw0KU2luY2UgdjY6DQotIGRvIG5vdCB1c2UgaXNfaHdkb20gcGFyYW1ldGVy
IGZvciB2cGNpX3tyZWFkfHdyaXRlfV9odyBhbmQgdXNlDQogIGN1cnJlbnQtPmRvbWFpbiBpbnRl
cm5hbGx5DQotIHVwZGF0ZSBjb21taXQgbWVzc2FnZQ0KTmV3IGluIHY2DQotLS0NCiB4ZW4vZHJp
dmVycy92cGNpL3ZwY2kuYyB8IDggKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspDQoNCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2
ZXJzL3ZwY2kvdnBjaS5jDQppbmRleCAxMTJkZTU2ZmIzLi43MjQ5ODdlOTgxIDEwMDY0NA0KLS0t
IGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5j
DQpAQCAtMjMzLDYgKzIzMywxMCBAQCBzdGF0aWMgdWludDMyX3QgdnBjaV9yZWFkX2h3KHBjaV9z
YmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywNCiB7DQogICAgIHVpbnQzMl90IGRhdGE7DQog
DQorICAgIC8qIEd1ZXN0IGRvbWFpbnMgYXJlIG5vdCBhbGxvd2VkIHRvIHJlYWQgcmVhbCBoYXJk
d2FyZS4gKi8NCisgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGN1cnJlbnQtPmRvbWFpbikg
KQ0KKyAgICAgICAgcmV0dXJuIH4odWludDMyX3QpMDsNCisNCiAgICAgc3dpdGNoICggc2l6ZSAp
DQogICAgIHsNCiAgICAgY2FzZSA0Og0KQEAgLTI3Niw2ICsyODAsMTAgQEAgc3RhdGljIHVpbnQz
Ml90IHZwY2lfcmVhZF9odyhwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsDQogc3Rh
dGljIHZvaWQgdnBjaV93cml0ZV9odyhwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcs
IHVuc2lnbmVkIGludCBzaXplLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
ZGF0YSkNCiB7DQorICAgIC8qIEd1ZXN0IGRvbWFpbnMgYXJlIG5vdCBhbGxvd2VkIHRvIHdyaXRl
IHJlYWwgaGFyZHdhcmUuICovDQorICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihjdXJyZW50
LT5kb21haW4pICkNCisgICAgICAgIHJldHVybjsNCisNCiAgICAgc3dpdGNoICggc2l6ZSApDQog
ICAgIHsNCiAgICAgY2FzZSA0Og0KLS0gDQoyLjQyLjANCg==

