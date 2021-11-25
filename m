Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C325745D8D8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230970.399310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCck-0003mX-Nx; Thu, 25 Nov 2021 11:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230970.399310; Thu, 25 Nov 2021 11:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCck-0003kI-KY; Thu, 25 Nov 2021 11:09:06 +0000
Received: by outflank-mailman (input) for mailman id 230970;
 Thu, 25 Nov 2021 11:09:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lI9u=QM=epam.com=prvs=1963e0fee4=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mqCci-0003if-Td
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:09:05 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 180095fb-4de0-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 12:09:02 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1APAx831028877;
 Thu, 25 Nov 2021 11:09:00 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cj97901aa-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 11:08:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5010.eurprd03.prod.outlook.com (2603:10a6:208:10b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Thu, 25 Nov
 2021 11:08:55 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4734.022; Thu, 25 Nov 2021
 11:08:54 +0000
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
X-Inumbo-ID: 180095fb-4de0-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hc2LWJ4VFxm8a7a3H0CcPQ1tDAZIQsus1M1YkfwEPopTVM6RG4C58bzBYj/hjgrlTlbvQsCT8L8suhXY071sJlgFMe5NxZGkFvaCGryRl5pYIOJNtzRBRh+tSbukxsuwoSRgiU31NAkC/ZUCmf0L3jWxkJ6BKqE3zpqWG/P30i8tIh8FEBlw0AhuQNZmsOmqCl5Fnmmvc9d0lOMux5v7Pa9qRU5uDFVfJbKL7/ryRUFmEe5yELym1XU1FvKVvePTGRGoQILpQkUlbjqnXVy25sho5mbmRLf65UY02ZIeAavodEnd5OdDrtdMgWAL9F4yhgiUy4vkGTnz3nelU957lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXigjSS5oxGx1GFEFj94hg/FRykjRSvY3KIh3GabdRg=;
 b=iC7/Ig3AxA9qUlTirULZo9D5xq0mMf7AOA0Uds7M1Io1hcWnv9mMJKUGWkul4f1wZO7FVJc1Er7nY2mBi2EKAVAxT0GlwduXuH/KZCGLcZIrYe0VjagWskktHvxwVv8w7AiFtbuR4yNvP9p2WKGiib4CVRLQAK8F7hjOpBwU9KS5EHS0WXyHUcr4vK4EliAqZwAdA0VEOVKNbbgEfi4e17FyYfvOSdMQqy6O/E/pYaLqos3LD+ftBb0fCHYZp5LRruUSaIiBrD8IoufeMFARS+PzSwTcckDYrzFetz6/rVB2yXFupIf5IGzZSECs0epf4F5yqAQbqYEiH+aMTJoT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXigjSS5oxGx1GFEFj94hg/FRykjRSvY3KIh3GabdRg=;
 b=FAXR6qQpSk7psNsShFIczEMFI7+CkGMrDKy08nbb+ui6DXbHlc3XKLM5J51+Mks6Y9zM4X/BfCLJCi1IJ7O7Wn4n0udI8vTMNWIJWnUz3jxOHueF1zu+Pw1ijaOmviscatpMiPxD191W0RISf+U4s4ZX9h3iElbM/OLXhB8HnBAAdaEzv1IDg1f/rqTL8+dBVcIxhi+NEc9bxXeTSZnpq9ygMkkqEoexm99snIEu3KeHwbF0n1IszY4EJWZgYoiBhOyCxdwNr2GIxe6okDibVeXLEF46m1umWsCEBv6fchANUUdfKPfJysbvFyaPITIlUBeqaNf8eqQssnlgvt2olQ==
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
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 01/14] rangeset: add RANGESETF_no_print flag
Thread-Topic: [PATCH v5 01/14] rangeset: add RANGESETF_no_print flag
Thread-Index: AQHX4ewDgOC3qPO0fU6q4Y3oEVCq8awUFUmAgAAAiIA=
Date: Thu, 25 Nov 2021 11:08:54 +0000
Message-ID: <bd7ba159-5337-b60a-0b87-ea587c912495@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-2-andr2000@gmail.com>
 <923a7838-b562-4dd3-839a-6c08bed3aa0a@suse.com>
In-Reply-To: <923a7838-b562-4dd3-839a-6c08bed3aa0a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2e008bb-8d4e-474a-399b-08d9b003f87d
x-ms-traffictypediagnostic: AM0PR03MB5010:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5010D5F3A4C2521DF8ED8376E7629@AM0PR03MB5010.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vggUo3QLm+UAPooeLaB7ADdqX9FUdIfHA3zhyRYHAC+ZNvBFWL1UIhrtVbnnNTNXBZiw88J8yl9l/njS24KW+iwZRVJwOFSK5rky/MvBVs1qWKquy7x3PKRfj680I1c1zMm73uJO8LJT9HmRmwZevltfAjeEmKkhVXsxZIkdvWYF6BzoqLeBFBTfEaPdCxAMJInD/62+T2kvGPNRTLBd4rvrPufoLVCgQ8Y5izc9LyvcKCOnuFKKnA96wT7egIcgurgM99FH/m6vNf6sNcTrWmkaxvbSibG/h1MstS5KbZxJ5eSU7rStLGqY+j4FrWNU5J4V+PoMJgEvDIrSpHzOx6Pqb5t3+FrEqlSvwXFp9/FLHaFdojSSq2LlI7tmF3EQMM31ldtCplAouy8L7hhPOzEEnScp3UOKQ7tmSzz2M9mp5ih0Q4EnD0gyAJKOgDQTj3XLrZD/a/OVroBxTxziyo9MRke1k6qZWr+tOB7+p2KICyhK2zfWDWBcT4eKtBYtFEiFNEi1FOQbWrfz2dH12t4VCgTuPQ0co/6RkBxyGKB4+Bp/VBGBP3CXoQ8AmCnb+r6Zkfcgw49ymxjH4H2+03Telw9ua4wPg7d0mf0F0AXnm9lfR1atShd04rrPz6S+nuiJ6NzxgynvzuhybG3ylrBDQCuA8TrsNyKW6uwjOL11vWQzRh7J8B6hccLVA1Db6LxBg37E7acMdjfS4y5ZJr/718+NYEK85EpzH7ypa9On7qer7dT4vgPRQDzyAtyY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(6506007)(316002)(54906003)(38100700002)(8676002)(53546011)(83380400001)(2906002)(55236004)(508600001)(76116006)(122000001)(66946007)(64756008)(66476007)(91956017)(4326008)(7416002)(186003)(2616005)(6512007)(71200400001)(66556008)(6486002)(5660300002)(31686004)(38070700005)(31696002)(8936002)(6916009)(107886003)(36756003)(86362001)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SDRvTFBkM25QZjJ4Q3FaQnZueDA2MU1BMDFGMDdiRkpoWFJUbUVRKzB1bVZk?=
 =?utf-8?B?M0gwOXNFMENtZ3BXSVNYWGJKUDAvaVNpL3BpeTZ0dDZqcm44ekFkVEVIR1ov?=
 =?utf-8?B?NktvbFJYemN5d3RXbHk3aDJzbDZLSTcwWkRCMUNuZUpSVzl1ZnYyUTBnSnp4?=
 =?utf-8?B?cE9hY3BnSGxvOUZlQ2lUNnQzT3RwSGlRa2FxTFN6cmNoOUNBT00xREs4bHZI?=
 =?utf-8?B?MHFkc085Uk9SM1NMWFYyRFhiOTkvYVVtOEZicUtUOGNMVFdCQVUyOFlUMVJa?=
 =?utf-8?B?empCdXRCOGRwcSt4MkJqd3hMeUlCTlEzNCtuZ2R3ajJzblpKOFZKQ3hGOStY?=
 =?utf-8?B?YTJjcy84d1ZoTU9IRjVvektsT1FKSk5EYitiaFROQ25rMnByQW9GQm4wNlQ1?=
 =?utf-8?B?aStpT0FlK296UGZDQ25uZzNLVzlBQTdKeHczcUhWdVI2ZWc2eGc2QTJuZDdL?=
 =?utf-8?B?TlZ3TGs0THhiVTdHSEluZ0JSWk5SRkNIZ2V1ZWVRSzMxaHRvd2tBODdxRGJ2?=
 =?utf-8?B?T3prNEZJc3RLcTlpR3NodU9zeG9Ia1lJZVllRFdQeVdZZlp5d2VIOGpXUFo5?=
 =?utf-8?B?VTZsaVNPbnZqL3owamI5cnRpUHpuQklVQUhaQWNRS2ozSXpUWmh6SERncVBK?=
 =?utf-8?B?bDNpZkE0ZHFhQXM1c1hwK0U1V2tEdklNZlJGY3ppZ0lhOTdmNXorK3ZmTnpF?=
 =?utf-8?B?K2pqMVY0c0JlZEdWL0lBYkV1SnRIUnovR3gzMmJTc29FSDBBMUF2b0VMRkQx?=
 =?utf-8?B?YnZETlcwZldHdGtSWjN0ZWJjVnIzR0w4S3BYR04ybVM1cVVIR1VUR2YwanJq?=
 =?utf-8?B?Q0FzbXVQNXJJaTNFT3NCbzdVTHNUL0c4dVcyNldoWm4wQ2F2YUd4SURRVzBj?=
 =?utf-8?B?NjdKUENLR0VBdkp3Yk9uZHYzelNyLzd1Sm1MNXhlbnpGR2NndVllR1hpRDdO?=
 =?utf-8?B?TmgrcFdFdVdwY3U3R3VMV0pMcWJ6SitkWEFjeHFWeit4VEhwQTBLSGU2YWQy?=
 =?utf-8?B?QUhWc2JjQlNXWnJOT3BWdUNwaEtZcG9sRnFsdzdyandLNjMwMkZDUGg4bXUy?=
 =?utf-8?B?U0Z2THdlcEJETDhEVVlYRGM1blQ0bVNSU1ZjK2F0V0o0S1ZXUVJmSGdJakN6?=
 =?utf-8?B?ZlVRcks1RjgzZ0hZMGlZVVJmTFBaaUppN2xua1pIZmExLzJxWHY4N1NmK29W?=
 =?utf-8?B?TVVZdFNkaGM2dGdvWEhVL3JjV21tangyQkxlajFVUHMyTHFjd1YzS3IvOUFt?=
 =?utf-8?B?bFBlc0xPQWFPOGtXQkZIY1Y5aTRuNnFMMW9hUGtNYVNlRCtNYm5NRGFDcmpa?=
 =?utf-8?B?ZFUxeDE5NkFGZlN5dlpnNmw3Vldua2hwZEFKZDBIeU04MFZMMkJGV0dtUGMv?=
 =?utf-8?B?Si95L1Z0RDBwbG9xQm1Ebk9ZblBjdllwbGRjYmRWVUFWL1RoUW94R3JEbFV2?=
 =?utf-8?B?cTlXVHA5MUgyNUJYdjhvZXVBN2JmaVlMdFczQWJMVTd0d1lzdGZTTjVWdVJU?=
 =?utf-8?B?VTFjbVlOc09MODA2WG5VZnBRWXBVRXkzeGU5WWJHQ2t3RGdJR1JBeDQ4ZnBk?=
 =?utf-8?B?ZFdHbWgzRXR4K2dKSzlCZGxVWWJveURIOHZ3UzNXRFV1SFNrM2NkZ1ErM200?=
 =?utf-8?B?cHFEUjRqR3FMR3ZiQzRHOHdYbXYxSzFZOE1La1lwNkdxblQ1V0pBL3A3OWpo?=
 =?utf-8?B?TXk3NnVPak5HbENlMHZicjdyS3BBd0ljbHB2NVR1Y25ML3ZoUldLU080bG5J?=
 =?utf-8?B?QVVQZFFpZ2c1ZVl1TEZ5dzRtRHBXOG0wSmowU2Jkam1zeHF4WkxSUzFnYUhK?=
 =?utf-8?B?SThyNitLWTk3bHc2MTFwM0NQNXlLcWNMTFVQc0t4VlgyYlZETDZnRUtYQ0ZV?=
 =?utf-8?B?QTB2bXdtcHpkNHRRSlMyVXg1U3F0UGZwQTRzZFh6YlZBSzRHVWVPUjdZRVBM?=
 =?utf-8?B?QzdrcEg5YWdCYThkNUZuMVFkQklTcENkNUdiQ1BhVzNNcG01cjhGNyt4OXlr?=
 =?utf-8?B?bVVsbDdRUjhtOFFBT0hkZ0VZeTJ0UzNySlVUMUxSR01LZmw4RkNuTnJCRjQ4?=
 =?utf-8?B?ME51eEtFTnQzMmN3bVAwakZKY0xNMlhDZnJkM3lra2phWXB5dVc4UTc0c0F0?=
 =?utf-8?B?am9OeCtzNGZJWE1YS05henVKclhWSXJvTTh5NzBpRkU4NnJpS3NQZ2wxUThI?=
 =?utf-8?B?MFE2WlFoUXY0c0FlMlcyU2pwenNzSlJ1SUpTRTNaQk8xbGdlUjlYSGZ2enRH?=
 =?utf-8?B?bXZtaFBhMDJYS21hMWNRYTd1eW9UWi96NGZESTBMVUY1TTZKZmN5S2NUWnAr?=
 =?utf-8?B?UWpLQXhaV1FOVFllV1NUSm5jaldzTmovekpMMUNmUk5WSDZFVVJGUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65BB7E53E4F1454D89463744F00B6CC8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e008bb-8d4e-474a-399b-08d9b003f87d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 11:08:54.8379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z7+4m1tLWKFkKYgsqgDs8qXwgJtUypXE4a5XPJxSfC7OBQ1suaawoISTGG3caspLV4ZXd35RGq/uSCaYMoehNVKuly154aQoXUVw8/uDGGsFVGhFE52sOf7MVrfh555h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5010
X-Proofpoint-ORIG-GUID: -fGPsX8IOogWF5T5IVkeFo5xQq5KIAF4
X-Proofpoint-GUID: -fGPsX8IOogWF5T5IVkeFo5xQq5KIAF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_04,2021-11-25_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250062

DQoNCk9uIDI1LjExLjIxIDEzOjA2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjUuMTEuMjAy
MSAxMjowMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gVGhlcmUgYXJlIHJhbmdlIHNldHMgd2hpY2ggc2hvdWxkIG5vdCBiZSBwcmludGVkLCBzbyBp
bnRyb2R1Y2UgYSBmbGFnDQo+PiB3aGljaCBhbGxvd3MgbWFya2luZyB0aG9zZSBhcyBzdWNoLiBJ
bXBsZW1lbnQgcmVsZXZhbnQgbG9naWMgdG8gc2tpcA0KPj4gc3VjaCBlbnRyaWVzIHdoaWxlIHBy
aW50aW5nLg0KPj4NCj4+IFdoaWxlIGF0IGl0IGFsc28gc2ltcGxpZnkgdGhlIGRlZmluaXRpb24g
b2YgdGhlIGZsYWdzIGJ5IGRpcmVjdGx5DQo+PiBkZWZpbmluZyB0aG9zZSB3aXRob3V0IGhlbHBl
cnMuDQo+Pg0KPj4gU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2Fu
ZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IGFsYmVpdCB3aXRoIGEgcmVtYXJrOg0KPg0KPj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL3Jhbmdlc2V0LmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9yYW5nZXNldC5o
DQo+PiBAQCAtNDgsOSArNDgsMTAgQEAgdm9pZCByYW5nZXNldF9saW1pdCgNCj4+ICAgICAgIHN0
cnVjdCByYW5nZXNldCAqciwgdW5zaWduZWQgaW50IGxpbWl0KTsNCj4+ICAgDQo+PiAgIC8qIEZs
YWdzIGZvciBwYXNzaW5nIHRvIHJhbmdlc2V0X25ldygpLiAqLw0KPj4gLSAvKiBQcmV0dHktcHJp
bnQgcmFuZ2UgbGltaXRzIGluIGhleGFkZWNpbWFsLiAqLw0KPj4gLSNkZWZpbmUgX1JBTkdFU0VU
Rl9wcmV0dHlwcmludF9oZXggMA0KPj4gLSNkZWZpbmUgUkFOR0VTRVRGX3ByZXR0eXByaW50X2hl
eCAgKDFVIDw8IF9SQU5HRVNFVEZfcHJldHR5cHJpbnRfaGV4KQ0KPj4gKy8qIFByZXR0eS1wcmlu
dCByYW5nZSBsaW1pdHMgaW4gaGV4YWRlY2ltYWwuICovDQo+IEkgd291bGQgZ3Vlc3MgdGhpcyBj
b21tZW50IHdhcyBpbnRlbnRpb25hbGx5IGluZGVudGVkIGJ5IGEgYmxhbmssDQo+IHRvIHZpc3Vh
bGx5IHNlcGFyYXRlIGl0IGZyb20gdGhlIGNvbW1lbnQgY292ZXJpbmcgYWxsIGZsYWdzLiBJJ2QN
Cj4gcHJlZmVyIGlmIHRoYXQgd2FzIGtlcHQgYW5kIGlmIHRoZSBuZXcgY29tbWVudCB5b3UgYWRk
IGZvbGxvd2VkDQo+IHN1aXQuDQpBaCwgb2ssIHNvIEkgd2lsbCBhZGQgYSBzcGFjZSBmb3IgdGhl
IG5ldyBmbGFnJ3MgY29tbWVudCBhcyB3ZWxsIHRoZW4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpP
bGVrc2FuZHI=

