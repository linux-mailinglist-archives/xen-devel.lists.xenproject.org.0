Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B10443EB2
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 09:53:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220602.381930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miC1K-0001ja-TB; Wed, 03 Nov 2021 08:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220602.381930; Wed, 03 Nov 2021 08:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miC1K-0001hK-Oe; Wed, 03 Nov 2021 08:53:22 +0000
Received: by outflank-mailman (input) for mailman id 220602;
 Wed, 03 Nov 2021 08:53:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UC4I=PW=epam.com=prvs=194164c520=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1miC1I-0001dg-HL
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 08:53:20 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4e5246f-c850-4869-bc9d-876897a5ddab;
 Wed, 03 Nov 2021 08:53:18 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A38OFhl015763;
 Wed, 3 Nov 2021 08:53:13 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c3pvng3r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 08:53:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5009.eurprd03.prod.outlook.com (2603:10a6:208:105::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 08:53:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 08:53:09 +0000
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
X-Inumbo-ID: c4e5246f-c850-4869-bc9d-876897a5ddab
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8BtcCKxIa1+JrSyIrkf5hRFHN9nDnGAzttBWFxxyKjR4FavDVomQlKMTTa4RlkrnrchtJ9mAivbONC3BoHHCoPHBmjAoxZKY21uPX1zVoJQSTm9WHLZvhivkEVDB3wTdVBMKhfq1a2mXQDgjcGxBhfl44ve96TuUfHzQJFQMciSOy5rPXdMgBb+gk5It74yO/v1/amUioqbaTwAKkRYAK6ABdzzs/B9rIKiL9Q/+NTG+8LGz/+sXjjp9DFbUdatGRLS4GWURsOjJMsA6HOlH3iiXwvhcMD5B2mMx6aFc1xydap0YQz9c+G7Lnhp7NdKq8RhB2ZqKFAN2zdO6XfwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IameMQX5L534u5+avmudWuKmAnRLCeAdN1ULoBDBTgs=;
 b=nRKw8WJSS0JWh1rRAN05WvqlvCjW+q4WeQvzF4tDRazjcgYzxY2jth8aFPofnlzbeETPt4PYXsx6C17tTGLa4owcYrTFr9V/bBcIN/afx/FAjB7GMunlEQa3RQ7b3oGVX09O720p7C+Vn1JdjZizDxOYDBIAXshwyryQPBLtI0u2/lE223w5Cm6MJyz0k4saoNYEQzAYZc55u75sbjZwEO8QH7NZLcflUIjNAVuqin4N2uZsSyQReV8tI4PBSd9BxpgCRBSOyuvThhsdkYSwyazN1NOmjvb6lS7R4n0DKeR1RuKwyoYNjIEsLEQTDS+a4It15Zklu8FfBA06GGEnbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IameMQX5L534u5+avmudWuKmAnRLCeAdN1ULoBDBTgs=;
 b=ckNCQbpd1dho8ETpWPHI1n3A32Xi4vu3+oHMKWC0eskZMTawht9Cjgo4lBTZAYmwu9yXVxzhALBBzg4EZ3ZTXZvX0OeLmj43sLwVeR9TthjidSDETF5Bv+Jl3egDzU9nEtXLRiTh9uLRKcse/vSgZxZa3Bk2w+Dka9Gm25BgiIBcLiq00+GkKhePHEmJojWHeJT7rt6n91J7fxx3eLzGGesNZFaVIiMPjDe9EtfkQI/qxKnVw54L5b8n6pG44tlANIdgE4JfyYsJ4hHzgxpxJZYvSaZpuUDYefl5CYKTMitbe5iVsxILpVIrEykHVRgCrwyAr6g/+5hZYgxc9mwfZw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Index: 
 AQHXtdAkq8Qmwxr3HUWTio8KWsEpvKvlQ6KAgAsHq4CAAAimAIAAIt2AgAAEUICAATmxAA==
Date: Wed, 3 Nov 2021 08:53:08 +0000
Message-ID: <b7626958-4df3-9f07-0ab9-604e55b3274e@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
 <YYEl8h+WtSZwNPn7@Air-de-Roger>
 <1a19dd35-a649-b155-bdd6-099e08fa3de1@suse.com>
 <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
In-Reply-To: <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3826fde5-4ba2-46ff-c66d-08d99ea75c0c
x-ms-traffictypediagnostic: AM0PR03MB5009:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5009749960DE96F51809C36EE78C9@AM0PR03MB5009.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +/85bb1tq+H6TRdp1VlTfRNa3RsEJBT6X0VxPPMAk4h/da77hZ7q8IHs2q21R5biq7KRv9RTnHdv2A/dVVnsiYnF/ulgXMNGsAzUm+hZsEn7hyx2TdU2h393x6kUT9YlwtCKryxMRGxYDo+mhEthP+Q1eqe1TuciTw/ObU/C1GgTmyswwTyG2cnD2IWpfWLl8rYr3LRVarOlb5pK2v5wJPmRovYVoCxDC5ATDFkG7jjmTBI9cIv2S3aDMLfPCgHObRuKim2Kfv9eyOQiB0MQHj89MyDmpshagg1y5TNPThc0qkdJFehVWkVyU54JeTMaQDStdcyNNXzZ2HOmO8M21/rWQgdUL79ONtPyy/Nz6F9fTaNZyPxVqVhCBgoQZyhcqJh6vxqTHCJ9R4ooWaTUzOZmhMdX6WomoLmxfkE4DaqB16oGFFr48eZYM0zLfieL0/v7PKZYV+xczk9BZMhn14LmXCbqYpXrwF0SLDal7nJbTi8rZ0hdAwEoW2sS+7/LevfCIUealsnvWPiAXlp+V4VtP6XMFxlvHZNz+438W7bpMdDj4o9hbhLF1tUPs5RpHvQQOCFc3zHkOdgzocSPPoYAsPg7YRZWRoYQr3/Omy1X370vELdKnUeiRLo6o4sk38+vSgytPEaaRizxJ4kZCaUhHRoxK734N+ipAPxlas1PkLJOoVUCKCLKD+MmxfJpXreHOcK7AJvTvWHgXqEFR/hcVswr5SDSfyhQo3lJU7NuQUwwJd62n7KEcLqyOfpcl1J8v6BO6i0pLQQ0U1Lo56nliEr86RNSfDzj5NBSOhfUiMmb+odZUVUjaRgT7hofLgwNN9bKgJIEy7Zko+FxfQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(316002)(2906002)(110136005)(38070700005)(54906003)(8676002)(71200400001)(8936002)(31696002)(2616005)(5660300002)(86362001)(36756003)(966005)(38100700002)(31686004)(122000001)(26005)(66446008)(66946007)(83380400001)(6512007)(53546011)(64756008)(186003)(76116006)(91956017)(6506007)(66556008)(66476007)(6486002)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UFVBVWMzWVEzQ25ROUlKaTdUaXVGd1FxS1BCbDhveXk3SWUwTlpaWWorSloz?=
 =?utf-8?B?NlRqakt3V2pkVFB6T1h6UDJJKzdqbks0ZG5YTFdhcHBRZ1NWYVozR2greUcr?=
 =?utf-8?B?ODZiNXFESjBXR2lYU09wem1KakFBVkJaU0hmOEtQQjVGVFBTVDhPcWw4eVVH?=
 =?utf-8?B?Mk5QWnJ3SnpUeUdSM3RmQWU1MitJUURvaTVwSmpHN1Y3RDdZNEEybEU5bWIz?=
 =?utf-8?B?OFdFTm9FajVXMzUzNmVucFRHenNoQVF5QTFaV2w0UFFPdlZ4YTR2KzN2ZmRJ?=
 =?utf-8?B?ZkhnT0lJOHpmTTJZUjk0a05jZ1NjUFpjRi9VL0VDQXprRUExUGhocmlNMGdt?=
 =?utf-8?B?Z0tnWXVOdWcwTExMV1VQSnQrSUZQajdCZUVDN2xNaVFnUDlLbk1DTVpBUTEy?=
 =?utf-8?B?Ulozc3laaVdMTURpUWlqN1oydjBUeHJMMm9haUlZSDUrUEwwT01JVTJhN3dm?=
 =?utf-8?B?MDRsa2tJVkdidEUwWWp1bzl4U1VoSWg4TE5wa0t1K0R3U0o3eFF2UlpSRm9P?=
 =?utf-8?B?YUZhRkhOTnNxSDNOMll5YXNLa2xWYXlsaXNSU1FKQytUK3FKRmJzc1RvY3pP?=
 =?utf-8?B?dDFKdDJ1R1FWeS93UC84WU9IZzF4OWVQTzg5Z01IY2V3WGJmTUp4L1RBMURh?=
 =?utf-8?B?d3RWckE0UzBKeHlzM1pQd0VlL1QzRWZmMHYzUlVmcjJIOVhLWUFhSmRaL3cr?=
 =?utf-8?B?UzF5NHZ1ZS9LU0dPOHJLeEd0ZU8yVFpiZVhWYm94UjhYN1ZxNHVIdm5yK0do?=
 =?utf-8?B?cFBqcCttVWR3YW40RVg1VElDWEl3NFJ4Z252Nk8yT0tQcXBKaHVRL0JOYkIw?=
 =?utf-8?B?enlwRVQ5VkRZRnA2U0V6UWxQTnVPNzZ5aVE2NHhDeFg0Y0t5anlQS0NwT1Nq?=
 =?utf-8?B?NEoySWVqT0VaSDN6NXBiUXBhUjN2Y2orNURlcmt6bnBPM0pSWGpTNTdhRHpk?=
 =?utf-8?B?dkFMeTR0VG4xdVc3cXF1Sk5QemZST3crZytQUFdQQlh0MEg0RngvYlFCNG8v?=
 =?utf-8?B?UzM0YjQ5RXJuMjZTMStpa0lBVzA0WXJSVlBsN3FYdFVBSFJ5anhnNi8xQUx2?=
 =?utf-8?B?U2xVcmhLWngveVpLd2h4dlV3eVY2dkdtS25EajdxUzRja1llLzV2S1Rnb2ta?=
 =?utf-8?B?SDBvc3VWK0lVa09zTDFoUFpFcmNxUFI2NklSWVp6YnAyd0ExQjlRaXpPWXNE?=
 =?utf-8?B?aUo2WmFtdVNRL013ZnhzNzUrczgrWGI1bEw2SXplOUoxbldDckhGc3dSVits?=
 =?utf-8?B?clViWno1RHI4Q2hFNzk5bzNVUXJ5K0JiZFNhdk14M3lORGE0eVk2VjRTSzln?=
 =?utf-8?B?VXZhakxJUVdhdTFuVzFicGZIaEorQWZ3aEcvSjEvblNpN1NkWkU4dFhGUVU3?=
 =?utf-8?B?Rk9NUXdnWG9hNnhlYndiS2prWHU2dkNaQ0VldlpHb0wxSzQ0YUNYcldwaENF?=
 =?utf-8?B?YUJ5N1dUNDhGUHBZWVExbmJMM1YzL1ZKejVvZ25uemlxRUxDemliWHRBeEJw?=
 =?utf-8?B?R0doY2hJTU5DaThibkNHSHUxWVVSeXFGTWFQbjE2UHNmeHo0YVZscmdPTFZE?=
 =?utf-8?B?K2VtSUE1Z2hhREFYRUQwNUp5eERUZ3dzcGhQUVRIbEJWY2wxVjEydTFISEY0?=
 =?utf-8?B?ei9ESjA5SThwM3JZdmIyMjNqODgvbmtYYmtMYXhOK0VOSmt3QllsS3RUNmxy?=
 =?utf-8?B?akVnL1FDMGpiQlphQ2N2QTlTcGIxUHczb3J6RkVBYnM4WTAxWmhQdEFGNmVs?=
 =?utf-8?B?b2R1UWIwTjlFQ3FpZFBWL2JhOTlXMVlXTTM0REtwM2ptRXcycTRTUWpnT3RE?=
 =?utf-8?B?eXNaNUduc050Y2NzNFVLV1A1V3NnRm1XSTNLUGFqdzkvU1hIUVJKRmV0cVds?=
 =?utf-8?B?azkyZnNQejY5OVAyVkR3VXRiZkpTZEZFWnBiOVJBbU15bkxQUGpMNGpScDQ0?=
 =?utf-8?B?VUQ1QW5MazBUbGk5WnRuWTdtNHR1K05VODRhUXl1cUpKS0g3VXFxZnQ3N0ZI?=
 =?utf-8?B?SE9lRUNnVTNFY01tL2dRNFN3ODczU2luMi9veGtraThaejl2VWJEWnZTRGpB?=
 =?utf-8?B?aXd5SGhHWE9JaUNPekUwYmpzK0tJdUNWTmV2d29ZdnBKVkRlMVZ6WXBkZEZ1?=
 =?utf-8?B?eFU1b1VCc3ArKzk2VTlKRGk2MUxTR3pITDh1Z2VMWVZMV01WSFg0RUNEbElI?=
 =?utf-8?B?LzhaZmlTTTZodWZBOXVDeUpzQnR4RVpncWhXRkJ4bHIvalU1NnlrRG4zVk5K?=
 =?utf-8?B?b1BtanZBaVRqNUZ6QWNIcG9UNDFmbEdZWnp4QUpRWUdhdkVzK00yUkx3d3Ew?=
 =?utf-8?B?NXBoNEkyaXlWWnJqelFiRnA0S3NrdUJmSmZJRkRSSCtvN2hEVDI1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E41F27B54427345B39ED175ABD698DF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3826fde5-4ba2-46ff-c66d-08d99ea75c0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 08:53:08.8633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z9Z4B1RdC59vQAz0GqMFoVYdY/2MGxQtqpxAB8cdMFNVe5aDQOAlSagMVuZmeOsCrx/wB41sujHDDgQF6nmJ7kg4GHGzqXiU/DSvp7ggVXb0S8Ad0JwuDBm2qQiYTcqp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5009
X-Proofpoint-GUID: CtAejCP71LfRspEyC1gNxzRwBRTg0LcQ
X-Proofpoint-ORIG-GUID: CtAejCP71LfRspEyC1gNxzRwBRTg0LcQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_02,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=646 priorityscore=1501 spamscore=0 malwarescore=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111030052

DQoNCk9uIDAyLjExLjIxIDE2OjEwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4N
Cj4gT24gMDIuMTEuMjEgMTU6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDIuMTEuMjAy
MSAxMjo1MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBUdWUsIE5vdiAwMiwgMjAy
MSBhdCAxMjoxOToxM1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMjYuMTAu
MjAyMSAxMjo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IE9uIFRodSwgU2VwIDMw
LCAyMDIxIGF0IDEwOjUyOjIwQU0gKzAzMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPj4+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+Pj4+PiArKysgYi94
ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4gQEAgLTQ1MSw2ICs0NTEsMzIgQEAgc3Rh
dGljIHZvaWQgY21kX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBp
bnQgcmVnLA0KPj4+Pj4+ICAgICAgICAgICAgcGNpX2NvbmZfd3JpdGUxNihwZGV2LT5zYmRmLCBy
ZWcsIGNtZCk7DQo+Pj4+Pj4gICAgfQ0KPj4+Pj4+ICAgIA0KPj4+Pj4+ICtzdGF0aWMgdm9pZCBn
dWVzdF9jbWRfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCBy
ZWcsDQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBjbWQsIHZv
aWQgKmRhdGEpDQo+Pj4+Pj4gK3sNCj4+Pj4+PiArICAgIC8qIFRPRE86IEFkZCBwcm9wZXIgZW11
bGF0aW9uIGZvciBhbGwgYml0cyBvZiB0aGUgY29tbWFuZCByZWdpc3Rlci4gKi8NCj4+Pj4+PiAr
DQo+Pj4+Pj4gKyAgICBpZiAoIChjbWQgJiBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUpID09IDAg
KQ0KPj4+Pj4+ICsgICAgew0KPj4+Pj4+ICsgICAgICAgIC8qDQo+Pj4+Pj4gKyAgICAgICAgICog
R3Vlc3Qgd2FudHMgdG8gZW5hYmxlIElOVHguIEl0IGNhbid0IGJlIGVuYWJsZWQgaWY6DQo+Pj4+
Pj4gKyAgICAgICAgICogIC0gaG9zdCBoYXMgSU5UeCBkaXNhYmxlZA0KPj4+Pj4+ICsgICAgICAg
ICAqICAtIE1TSS9NU0ktWCBlbmFibGVkDQo+Pj4+Pj4gKyAgICAgICAgICovDQo+Pj4+Pj4gKyAg
ICAgICAgaWYgKCBwZGV2LT52cGNpLT5tc2ktPmVuYWJsZWQgKQ0KPj4+Pj4+ICsgICAgICAgICAg
ICBjbWQgfD0gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFOw0KPj4+Pj4+ICsgICAgICAgIGVsc2UN
Cj4+Pj4+PiArICAgICAgICB7DQo+Pj4+Pj4gKyAgICAgICAgICAgIHVpbnQxNl90IGN1cnJlbnRf
Y21kID0gcGNpX2NvbmZfcmVhZDE2KHBkZXYtPnNiZGYsIHJlZyk7DQo+Pj4+Pj4gKw0KPj4+Pj4+
ICsgICAgICAgICAgICBpZiAoIGN1cnJlbnRfY21kICYgUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxF
ICkNCj4+Pj4+PiArICAgICAgICAgICAgICAgIGNtZCB8PSBQQ0lfQ09NTUFORF9JTlRYX0RJU0FC
TEU7DQo+Pj4+Pj4gKyAgICAgICAgfQ0KPj4+Pj4gVGhpcyBsYXN0IHBhcnQgc2hvdWxkIGJlIEFy
bSBzcGVjaWZpYy4gT24gb3RoZXIgYXJjaGl0ZWN0dXJlcyB3ZQ0KPj4+Pj4gbGlrZWx5IHdhbnQg
dGhlIGd1ZXN0IHRvIG1vZGlmeSBJTlR4IGRpc2FibGUgaW4gb3JkZXIgdG8gc2VsZWN0IHRoZQ0K
Pj4+Pj4gaW50ZXJydXB0IGRlbGl2ZXJ5IG1vZGUgZm9yIHRoZSBkZXZpY2UuDQo+Pj4+IFdlIGNh
bm5vdCBhbGxvdyBhIGd1ZXN0IHRvIGNsZWFyIHRoZSBiaXQgd2hlbiBpdCBoYXMgTVNJIC8gTVNJ
LVgNCj4+Pj4gZW5hYmxlZCAtIG9ubHkgb25lIG9mIHRoZSB0aHJlZSBpcyBzdXBwb3NlZCB0byBi
ZSBhY3RpdmUgYXQgYSB0aW1lLg0KPj4+PiAoSU9XIHNpbWlsYXJseSB3ZSBjYW5ub3QgYWxsb3cg
YSBndWVzdCB0byBlbmFibGUgTVNJIC8gTVNJLVggd2hlbg0KPj4+PiB0aGUgYml0IGlzIGNsZWFy
LikNCj4+PiBTdXJlLCBidXQgdGhpcyBjb2RlIGlzIG1ha2luZyB0aGUgYml0IHN0aWNreSwgYnkg
bm90IGFsbG93aW5nDQo+Pj4gSU5UWF9ESVNBQkxFIHRvIGJlIGNsZWFyZWQgb25jZSBzZXQuIFdl
IGRvIG5vdCB3YW50IHRoYXQgYmVoYXZpb3Igb24NCj4+PiB4ODYsIGFzIGEgZ3Vlc3QgY2FuIGRl
Y2lkZSB0byB1c2UgTVNJIG9yIElOVHguIFRoZSBlbHNlIGJyYW5jaCBuZWVkcw0KPj4+IHRvIGJl
IEFybSBvbmx5Lg0KPj4gSXNuJ3QgdGhlICJlbHNlIiBwYXJ0IHF1ZXN0aW9uYWJsZSBldmVuIG9u
IEFybT8NCj4gSXQgaXMuIE9uY2UgZml4ZWQgSSBjYW4ndCBzZWUgYW55dGhpbmcgQXJtIHNwZWNp
ZmljIGhlcmUNCldlbGwsIEkgaGF2ZSBsb29rZWQgYXQgdGhlIGNvZGUgb25lIG1vcmUgdGltZSBh
bmQgZXZlcnl0aGluZyBzZWVtcyB0bw0KYmUgb2sgd3J0IHRoYXQgc3RpY2t5IGJpdDogd2UgaGF2
ZSAyIGhhbmRsZXJzIHdoaWNoIGFyZSBjbWRfd3JpdGUgYW5kDQpndWVzdF9jbWRfd3JpdGUuIFRo
ZSBmb3JtZXIgaXMgdXNlZCBmb3IgdGhlIGhhcmR3YXJlIGRvbWFpbiBhbmQgaGFzDQoqbm8gcmVz
dHJpY3Rpb25zKiBvbiB3cml0aW5nIFBDSV9DT01NQU5EIHJlZ2lzdGVyIGNvbnRlbnRzIGFuZCB0
aGUgbGF0ZXINCmlzIG9ubHkgdXNlZCBmb3IgZ3Vlc3RzIGFuZCB3aGljaCBkb2VzIGhhdmUgcmVz
dHJpY3Rpb25zIGFwcGxpZWQgaW4NCmVtdWxhdGVfY21kX3JlZyBmdW5jdGlvbi4NCg0KU28sIGZv
ciB0aGUgaGFyZHdhcmUgZG9tYWluLCB0aGVyZSBpcyBubyAic3RpY2t5IiBiaXQgcG9zc2libGUg
YW5kIGZvciB0aGUNCmd1ZXN0IGRvbWFpbnMgaWYgdGhlIHBoeXNpY2FsIGNvbnRlbnRzIG9mIHRo
ZSBQQ0lfQ09NTUFORCByZWdpc3Rlcg0KaGFzIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSBiaXQg
c2V0IHRoZW4gdGhlIGd1ZXN0IGlzIGVuZm9yY2VkIHRvDQp1c2UgUENJX0NPTU1BTkRfSU5UWF9E
SVNBQkxFIGJpdCBzZXQuDQoNClNvLCBmcm9tIGhhcmR3YXJlIGRvbWFpbiBQT1YsIHRoaXMgc2hv
dWxkIG5vdCBiZSBhIHByb2JsZW0sIGJ1dCBmcm9tDQpndWVzdHMgdmlldyBpdCBjYW4uIExldCdz
IGltYWdpbmUgdGhhdCB0aGUgaGFyZHdhcmUgZG9tYWluIGNhbiBoYW5kbGUNCmFsbCB0eXBlcyBv
ZiBpbnRlcnJ1cHRzLCBlLmcuIElOVHgsIE1TSSwgTVNJLVguIEluIHRoaXMgY2FzZSB0aGUgaGFy
ZHdhcmUNCmRvbWFpbiBjYW4gZGVjaWRlIHdoYXQgY2FuIGJlIHVzZWQgZm9yIHRoZSBpbnRlcnJ1
cHQgc291cmNlIChhZ2Fpbiwgbm8NCnJlc3RyaWN0aW9uIGhlcmUpIGFuZCBwcm9ncmFtIFBDSV9D
T01NQU5EIGFjY29yZGluZ2x5Lg0KR3Vlc3QgZG9tYWlucyBuZWVkIHRvIGFsaWduIHdpdGggdGhp
cyBjb25maWd1cmF0aW9uLCBlLmcuIGlmIElOVHggd2FzIGRpc2FibGVkDQpieSB0aGUgaGFyZHdh
cmUgZG9tYWluIHRoZW4gSU5UeCBjYW5ub3QgYmUgZW5hYmxlZCBmb3IgZ3Vlc3RzOiB5ZXMsIHRo
aXMgZG9lc24ndA0KY292ZXIgZG9tMGxlc3MgZXRjLiBzbyB3ZSBkbyByZWx5IG9uIHNvbWUgZW50
aXR5IGJlZm9yZSB0aGUgZ3Vlc3QgdG8gc2V0IHRoZQ0KUENJX0NPTU1BTkQgY29ycmVjdGx5Lg0K
VGhpcyBpcyBob3cgaXQgaXMgaW1wbGVtZW50ZWQgaW4gdGhlIHBhdGNoLg0KUGxlYXNlIGFsc28g
c2VlIHRoZSBkaXNjdXNzaW9uIHdlIGhhZCBiZWZvcmUgWzFdLg0KDQpXaGF0IGlzIG5vdCBub3cg
Y292ZXJlZCBpcyB0aGF0IGlmIHRoZXJlIGlzIGEgaGFyZHdhcmUgZG9tYWluIGFuZCB0aGUgc2Ft
ZSBQQ0kNCmRldmljZSBpcyBmaXJzdCBwYXNzZWQgdG8gb25lIG9mIHRoZSBndWVzdHMgYW5kIHRo
ZW4gYXNzaWduZWQgdG8gYW5vdGhlci4gSW4gdGhpcyBjYXNlOg0KDQpod2RvbSAob3IgYW55IG90
aGVyIGVudGl0eSkgcHJvZ3JhbXMgUENJX0NPTU1BTkQNCmFzc2lnbiBkb21VMQ0KZGVhc3NpZ24g
ZG9tVTENCiphc3NpZ24gZG9tSU8qDQphc3NpZ24gZG9tVTINCg0KU28gaW4gdGhpcyBzY2VuYXJp
byB0aGUgaG9zdCBhc3NpZ25lZCB2YWx1ZSBpcyBsb3N0IGFmdGVyIGFzc2lnbmluZyB0byBkb21V
MQ0KYW5kIGRvbVUyIHdpbGwgdXNlIHRoZSB2YWx1ZSB1c2VkIGJ5IGRvbVUxLg0KU28sIGl0IHNl
ZW1zIHRoYXQgdGhpcyBpcyB0aGUgb25seSB1c2UtY2FzZSBub3QgY292ZXJlZCBieSB0aGUgcGF0
Y2guDQoNCkphbiBbMV06DQoiSW4gdGhlIGFic2VuY2Ugb2YgRG9tMCBjb250cm9sbGluZyB0aGUg
ZGV2aWNlLCBJIHRoaW5rIHdlIG91Z2h0IHRvIHRha2UNClhlbidzIHZpZXcgYXMgdGhlICJob3N0
IiBvbmUuIFdoaWNoIHdpbGwgd2FudCB0aGUgYml0IHNldCBhdCBsZWFzdCBhcw0KbG9uZyBhcyBl
aXRoZXIgTVNJIG9yIE1TSS1YIGlzIGVuYWJsZWQgZm9yIHRoZSBkZXZpY2UuIg0KDQpTbywgZm9y
IHRoZSBQQ0lfQ09NTUFORCByZWdpc3RlciB3ZSBtaWdodCB3YW50IHRvIGhhdmUgYSByZWZlcmVu
Y2UgdmFsdWUNCnRvIGJlIHN0b3JlZCBzbyB3ZSBjYW4gcmVzdG9yZSBpdCB3aGlsZSBhc3NpZ25p
bmcgdGhlIFBDSSBkZXZpY2UgdG8gYSBndWVzdC4NCkZvciB0aGUgY3VycmVudCBpbXBsZW1lbnRh
dGlvbiB0aGUgYmVzdCBJIGNhbiBwcm9iYWJseSBkbyBpcyB0byByZWFkIHRoaXMgdmFsdWUNCmlu
IGluaXRfYmFycyB3aGVuIGl0IGlzIGNhbGxlZCBmb3IgdGhlIGhhcmR3YXJlIGRvbWFpbjoNCg0K
aWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgKQ0KIMKgIHZwY2ktPnBjaV9jb21tYW5kX3JlZmVy
ZW5jZSA9IHBjaV9yZWFkKFBDSV9DT01NQU5EKQ0KDQpBbmQgd2hlbiBJIHdhbnQgdG8gcmVzZXQg
UENJX0NPTU1BTkQgd2hpbGUgYXNzaWduaW5nIHRvIGEgZ3Vlc3QgSSB3aWxsDQp1c2UgaXQgaW5z
dGVhZCBvZiAwIGFzIGl0IGlzIG5vdy4NCj4+IEphbg0KPj4NClsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy94ZW4tZGV2ZWwvMjAyMTA5MDMxMDA4MzEuMTc3NzQ4LTktYW5kcjIwMDBAZ21haWwu
Y29tLw==

