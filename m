Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D251444E99
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 07:02:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221244.382871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miVp0-0004Bb-DQ; Thu, 04 Nov 2021 06:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221244.382871; Thu, 04 Nov 2021 06:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miVp0-000496-AI; Thu, 04 Nov 2021 06:01:58 +0000
Received: by outflank-mailman (input) for mailman id 221244;
 Thu, 04 Nov 2021 06:01:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFoW=PX=epam.com=prvs=194277eb9a=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1miVoy-000481-OC
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 06:01:57 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b51b5048-3d34-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 07:01:54 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A45unCd009663;
 Thu, 4 Nov 2021 06:01:51 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c49dc02rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Nov 2021 06:01:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3281.eurprd03.prod.outlook.com (2603:10a6:208:a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 4 Nov
 2021 05:56:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 05:56:14 +0000
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
X-Inumbo-ID: b51b5048-3d34-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpGlxOynnZLAKn9i1SzdjC/oiuWs4UubwXyp+eBZOZj4nczPmZVZ/yFxy6nulRb/605nxUJW0wFWoW9HOmA6fygUyAju/AHMHRD7YqG0W6wXepnuizuMMWMzasX5nhno4aK9qAnaCM54a81x95706RGpgZQjURVrXFCT1SisfCZsQj8iyO6nyz4IgaP4unZcm+Ncv/DTaIENu4rAmJR8vKCEGFfpHNJChf0pUCGpsp875CIj1AowdNzU+nUluClpHRvIv07fINKtF35mvikzuxbYzj+kA79VEombGBsOeiOn0gJLx5uiw7FGzhN+BC9diGu6SkGNJ6/Pp3PkWn6Osg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xD4aOzzrmyrPeI7wtP+M1VF7la7CPCoP50Qw3RVEu4=;
 b=CYOE1fnyuII+P4E4Si3KMeiBQv76wDNez/BLyWinw3wVj6DiWPLsRy21bZqxMcv+MHeRvBODdBmHTjLFBXN40wLFIFwfnsdOvJeAFHRrs9fVDdjHIIGSQuYeWqUr/ZGMrV7nmGQ6Ezs5vA8GEdFe4/6ZAw2H6HCUNgwiUMWXZQoz6Cr5co0WJ4HFym6SOwFhB3P7+6b8y2ZVOKEbPeGa3c4GtrgEy99ng87jc3v9QuSZac8T0BaELBtFNb4yeTosfIuiCGcLU85SFamtoVb3u6S/XdqEn8U8O+6npLl7G6DuaJRBirqeuV4qFbYGiNC1yKnKVH/n8NTBI/j8DtOeQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xD4aOzzrmyrPeI7wtP+M1VF7la7CPCoP50Qw3RVEu4=;
 b=WbEQFKkIjUni5mTPoS+yLQC84+W6UJWA1UF8RiDT7shJxSEkYLQ/y0kctCy8wbHroxQmXlAfpGzJkwH9drHPbAEfidgIaXVLm8akdoRIXM3ET8wogL4xRoxgXtO9GIldMWaWouoI73J4BC0ilaHiZcR5XdR1Qgb+h6n3Jh4AfcSHA2KDndDX/4laEjcq1kpcshSoj9WgJJxwEvIJhzYpukrVyH4VjD8aULqwmYnInE8t3TlToVwjw7xCL1ZR5kM5NpuYc24Ok8pW8FeC5k62m3KpcoNBWad8T9VDI4H0OBwzwe4Bli/siFTOoVO4338f1PWqaCiBDc4L79SgbGhM5w==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH-4.16 v2] xen/arm: fix SBDF calculation for vPCI MMIO
 handlers
Thread-Topic: [PATCH-4.16 v2] xen/arm: fix SBDF calculation for vPCI MMIO
 handlers
Thread-Index: AQHXz9uvpkVSL/P+h0KvYyBzgfugSKvw16AAgADfnQCAAGctgIAAwzYA
Date: Thu, 4 Nov 2021 05:56:14 +0000
Message-ID: <6512850c-08b8-ddb2-3e7c-28ec463f51d6@epam.com>
References: <20211102112041.551369-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2111021545130.18170@sstabellini-ThinkPad-T480s>
 <4559d7c6-7a03-54c0-ca93-9319cc7989d5@epam.com>
 <568d087e-d740-47e2-173e-34915f645a76@xen.org>
In-Reply-To: <568d087e-d740-47e2-173e-34915f645a76@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13359ada-0029-47d0-ff1f-08d99f57cfd2
x-ms-traffictypediagnostic: AM0PR0302MB3281:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3281A5299FF24F4149126720E78D9@AM0PR0302MB3281.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cky8aYFx4CNtn4sKX75R7iuGzVJ1uoeyFmBJl9h68njBUMLD5A5d+bp78pY0yLMmQlchYoGVWfqjpDCpskuBX/PuwG/dnIbec7971JLPJtarG8Ub2S6eqFLEdSab9q0F9Fqc2Ng258Af9v7Tri+ktcah2pbpZi6FvRHbcy7E+RZvRkExDP9fFDEgTMPGiVyVhdN/ezif6VzNk2Zk9hHYCsQCk4NsLZeWSoTnucS0pr5asEOnnUnTFmRhq1r4DeuPVFt0Kb/9emFq/w+R1vB3d9W9zxjuH9rNAwI7PIqiZTSrD2ZU9fQqVffuj9QAmw8w9kwmz8dPCkfI9VvgqgsNtX6Pm344NJQpZ8opPiGmU0m0CgsvlXvH6rOUd8LMvDPHQE8MQM/tz6ISacGkoCzgyTlBa4w1w3l4PUdeh5j9G37TVS3q9voUl7GrBgQHlaLLEdgWvrg8YNpn7PCjklU1X7AWHS48u5wWWmhNtMVzaE4OyrGYhj7dRvDGXp4NdKRZvLk46crRJvk3rDTSEmnQWaKxudfrwZvtUQ/UHTTMZbZNQ7l7oVFLlTIhPdcXkRFVxPGP8h6fixs7ChzVoG5AzFqM+YR/dhysoMqMGH3b0SdSkcjIPrFrYBIaoUR1vx/4VYXVpKgiec5reA820lPoNViEBiRLZSsZ97KbCGvhkIyhiuHj5iYfKCLOWy2QuukMGR3sYHtHTIAZg0jSiE+rHZV8m5Z0/SxTQiIG8fBsSPIXtjpRCosLglxb8AAUo7r4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(122000001)(66556008)(64756008)(31696002)(186003)(8676002)(53546011)(38100700002)(5660300002)(6506007)(36756003)(66476007)(71200400001)(26005)(6512007)(110136005)(91956017)(4326008)(54906003)(8936002)(508600001)(86362001)(2906002)(76116006)(38070700005)(2616005)(316002)(6486002)(31686004)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bVVpMjl3bFU1aTBmTGVKM3czVStwaDI1dW9oeWVTQStHc3RWbVBSTlhNUk9Y?=
 =?utf-8?B?WXZVVHh3QTdTVjk2SWpZZ0J5eUx2c0krWEpzNXV0NEZXMGVEaGw3b1Ezd0ZP?=
 =?utf-8?B?NjNYRUUzbTZPSDUvdlNzYnFsa1pCWUJzRTVmTXdMcHRjTkpZR1pvOStURGJV?=
 =?utf-8?B?OFBRNWVIY0NuaVVEOUU5SHd5b29jY1lranFxTDd3WW1rWE1jMU51djRLUG9F?=
 =?utf-8?B?T1c4bG40a1lyNmNQOW94VEFKNTBpQVl2TEZ0cEc0TUhHWXpHbWVOVThzcVlE?=
 =?utf-8?B?SXRIOXZvUXU0dm43L1JpZmdaQWdnNXVKWHQ4cUVxcXhySWFzYS9Kc2ZNekhZ?=
 =?utf-8?B?blpFUXg1N1dpTk9jbXdOYVVXVnN4a2xvZk1GWlZkaDRRR1pjQnZncHZDR1Nw?=
 =?utf-8?B?Slo4aGg5eDJVQzBKVXRXc0hnS2JWTkpEeFRoOEhkTnhCMFNWZ1NyREJpd0lI?=
 =?utf-8?B?aUhPd2xpM2ZXY2ZlNllQT040SFJhWXJLV2l0WXFibk1WaTBuZ0ROTHFBRHdj?=
 =?utf-8?B?TlB5Z3praS84aU9hWjhtS1VMSXhhMTJOUnJndkRMUGNyNk90YkNiUTJ3SEdL?=
 =?utf-8?B?VzdhTHVLWlZSVmk4MGVzWmVwYTR4ZmxxcjdGVStzSENQRXhWU1ZkSG5oalFr?=
 =?utf-8?B?Ymw3czdLUmpVMWNxV0VDRmN4cEY3MVVEeSttcy8xVm84OFBjdEhwT0wxa1cr?=
 =?utf-8?B?aXJvbExiMnhIM1ZoMGlwR2JuMm9KZFdGN0JEbnlvQ21GYlB1Qkp6SWFNaWRQ?=
 =?utf-8?B?K3VJcTFoQXpPUzA4K0s1NFI0VTlFa2RRck04SEtYcFBaUStaZThnRFVoUHky?=
 =?utf-8?B?Y2VzaUhkNnV5RjNnWEQrZURsdFgxcFY3SzcyVjhxL2p1WmxzWWJYV2tGMWdn?=
 =?utf-8?B?akk1U0swVGRFOUM2R1B5K1NBUE5SNUEyZG1xaXB2dXluSW1IK3MvSUhPZlVh?=
 =?utf-8?B?T2ZYTk93SEVwVlZSMndHbjJhbW5WS3hpUzVEMVIrMWtBZHJ0cDVWbURTL3A0?=
 =?utf-8?B?OTJJMzNzVTlsM25KWG9BSURHNTVCRUkwaGlBbEw1S2lsNmk4SGtzQThhY25Z?=
 =?utf-8?B?cUpzN09MZFJFQnJ0aHBKenRTejA1R2cyMFlrN0hRUndpUFllNS9ubSthN2Er?=
 =?utf-8?B?OG14VkloM3dnVHdyVmdMeWZLVE5iZGFCYURad0VnQzNoMVhqZUJZZ3htRm5D?=
 =?utf-8?B?Z3JyM0NqekZFNTdDdlA0OExRMEZ0dmNFcE9iTkd5SjgrQnpGT3oySlJ1eHdu?=
 =?utf-8?B?Ni9lZ1hCM0c5NEdkbkVEWjdDVUFNeEQyZGdwQ3RaQjhxOVN4V1JkbVQyYjVh?=
 =?utf-8?B?UkZUbUFsODFhMndaSE5CbHpkeFlWZWxkT2NqNGNzVnZQZE8zYUI2dDgwckF2?=
 =?utf-8?B?MXJqbm93eHhzdzVJbEhMczZES0ZOS1ovbDNYbk8rQWprZnRhUmJQYk9pVGhp?=
 =?utf-8?B?SGp1NHpKL25WdHdNOXpnSElSaXRRTDZBejhoa2xJajl1aHRqbXRnMVlzeE4w?=
 =?utf-8?B?eGJCb0NPZkZ6NEtMVnJHcnJuMDVHeTdNbHhUYmJJNjI1SzJiRlYxVmZhRS9X?=
 =?utf-8?B?U0lSRTkxVG1PVFJHRmliUzAxWW43UlE5WG56UEhEeXNZSDNibmNETkNheUd3?=
 =?utf-8?B?RjRpSkJ3anBFUUxueXp5eHl5VlYzdTlyL2lEbHVOMGVtUlk4clFIZ0JuT3pl?=
 =?utf-8?B?cmpRUnN2R1NnWHo0NDlGeGpiUjdMeXRLeC94Y29wbTgzM29YZzd2MkRFVCsr?=
 =?utf-8?B?WnZkYUlqcmFvWndKdVhuVXRLNFY3MlBzSGpyUU5jaGFPWEw0ZFkwUStMMXJW?=
 =?utf-8?B?QVhLRzZVelBtSWxPaDIzQkZLSEtLcmZXSWUzNlBGMCsxSHlka0NpTnQrd2pH?=
 =?utf-8?B?SXNtT3VXbGdKdzhNZWJ0WkJMNWVKVXBxZjBITmZMLzhnT1J2elVXT0FOZXR1?=
 =?utf-8?B?M2VqYlZnbUFUcy9XdjVkV3kyRGtGTnNaWFNEdEoyRVI3SUE5bVFRenVNejJs?=
 =?utf-8?B?WC83M2d4SVoyQjl1U3dlbnZZNVlodEk3RFRCNmQ3Tnpsc3RZUlhtOWdVWEh4?=
 =?utf-8?B?d21aSGVkRXJMbzVHSUk1a2paS3lzY1VIOHVYVTRhdXZWbFF5REcyVzRyV1FN?=
 =?utf-8?B?eXBFYzQ1MWNpYUR0TjNVeWpPNWNRb3BHV0gzb0lLaW9xbGlYMjllRyszRlll?=
 =?utf-8?B?MHZZTVFvc1drdzlRdU40MkFKakVBOGh2N3Arb1V0VGRKYUtRMnNTU2xlRTJ2?=
 =?utf-8?B?R1ZSOGpoeXErVWxMMm9oSzVnQkdMYVluN3d3UVRhRXpRaFhYMGFOQXYwYVlJ?=
 =?utf-8?B?NXhqc2Z6bjVsaVdkeG9XNmpaN0ZuRWZkTDcxV0tvdUtta0lEWHBOUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1618C9D09025E847A0239479464BE582@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13359ada-0029-47d0-ff1f-08d99f57cfd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2021 05:56:14.6322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J5rIYOGUrjGW+r7D+E/a6NRV7AgHB2fxNhdQ5hpCfNU/Zo+vhCRTj5EZV7ei08GjC9aNrKGAtkyR8KA19wNkoY5bOX5s1+R7hsaOVBtvlNfvpdqZTLtHzYp5PnZGG88M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3281
X-Proofpoint-GUID: Kzug3eiQjcZXm3afix6BgWna44Jffc8g
X-Proofpoint-ORIG-GUID: Kzug3eiQjcZXm3afix6BgWna44Jffc8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-04_01,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111040033

SGksIEp1bGllbiENCg0KT24gMDMuMTEuMjEgMjA6MTcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAwMy8xMS8yMDIxIDEyOjA4LCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+DQo+Pg0KPj4gT24gMDMuMTEuMjEgMDA6NDcsIFN0ZWZhbm8gU3Rh
YmVsbGluaSB3cm90ZToNCj4+PiBPbiBUdWUsIDIgTm92IDIwMjEsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3Nh
bmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+DQo+Pj4+IFdoaWxlIGluIHZQQ0kgTU1J
TyB0cmFwIGhhbmRsZXJzIGZvciB0aGUgZ3Vlc3QgUENJIGhvc3QgYnJpZGdlIGl0IGlzIG5vdA0K
Pj4+PiBlbm91Z2ggZm9yIFNCREYgdHJhbnNsYXRpb24gdG8gc2ltcGx5IGNhbGwgVlBDSV9FQ0FN
X0JERihpbmZvLT5ncGEpIGFzDQo+Pj4+IHRoZSBiYXNlIGFkZHJlc3MgbWF5IG5vdCBiZSBhbGln
bmVkIGluIHRoZSB3YXkgdGhhdCB0aGUgdHJhbnNsYXRpb24NCj4+Pj4gYWx3YXlzIHdvcmsuIElm
IG5vdCBhZGp1c3RlZCB3aXRoIHJlc3BlY3QgdG8gdGhlIGJhc2UgYWRkcmVzcyBpdCBtYXkgbm90
IGJlDQo+Pj4+IGFibGUgdG8gcHJvcGVybHkgY29udmVydCBTQkRGLg0KPj4+PiBGaXggdGhpcyBi
eSBhZGp1c3RpbmcgdGhlIGdwYSB3aXRoIHJlc3BlY3QgdG8gdGhlIGhvc3QgYnJpZGdlIGJhc2Ug
YWRkcmVzcw0KPj4+PiBpbiBhIHdheSBhcyBpdCBpcyBkb25lIGZvciB4ODYuDQo+Pj4+DQo+Pj4+
IFBsZWFzZSBub3RlLCB0aGF0IHRoaXMgY2hhbmdlIGlzIG5vdCBzdHJpY3RseSByZXF1aXJlZCBn
aXZlbiB0aGUgY3VycmVudA0KPj4+PiB2YWx1ZSBvZiBHVUVTVF9WUENJX0VDQU1fQkFTRSB3aGlj
aCBoYXMgYml0cyAwIHRvIDI3IGNsZWFyLCBidXQgY291bGQgY2F1c2UNCj4+Pj4gaXNzdWVzIGlm
IHN1Y2ggdmFsdWUgaXMgY2hhbmdlZCwgb3Igd2hlbiBoYW5kbGVycyBmb3IgZG9tMCBFQ0FNDQo+
Pj4+IHJlZ2lvbnMgYXJlIGFkZGVkIGFzIHRob3NlIHdpbGwgYmUgbWFwcGVkIG92ZXIgZXhpc3Rp
bmcgaGFyZHdhcmUNCj4+Pj4gcmVnaW9ucyB0aGF0IGNvdWxkIHVzZSBub24tYWxpZ25lZCBiYXNl
IGFkZHJlc3Nlcy4NCj4+Pj4NCj4+Pj4gRml4ZXM6IGQ1OTE2OGRjMDVhNSAoInhlbi9hcm06IEVu
YWJsZSB0aGUgZXhpc3RpbmcgeDg2IHZpcnR1YWwgUENJIHN1cHBvcnQgZm9yIEFSTSIpDQo+Pj4+
DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJf
YW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+PiBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPj4+DQo+Pj4gQWxzbywgSWFuIGFscmVhZHkgZ2F2
ZSBoaXMgcmVsZWFzZS1hY2suDQo+PiBUaGFuayB5b3UsDQo+PiBEbyBJIG5lZWQgdG8gcmVzZW5k
IHRoZSBwYXRjaCB3aXRoIEFja3M/IE9yIGhvcGVmdWxseSB0aG9zZSBjYW4gYmUgYXBwbGllZA0K
Pj4gb24gY29tbWl0Pw0KPg0KPiBJIGhhdmUgY29tbWl0dGVkIHdpdGggdGhlIHR3byB0YWdzIGFw
cGxpZWQuDQpUaGFuayB5b3UNCj4NCj4gTmV4dCB0aW1lLCBwbGVhc2UgcmVtZW1iZXIgdG8gY2Fy
cnkgUmVsZWFzZS1hY2tlZC1ieSB0YWcuDQpUaGUgUmVsZWFzZS1hY2tlZC1ieSB0YWcgd2FzIHNl
bnQgYnkgSWFuICphZnRlciogSSd2ZSBzZW50IHYyIG9mIHRoZSBwYXRjaA0KKHRoaXMgb25lKSBh
bmQgaXQgd2FzIGluIHYxIG1haWwgdGhyZWFkLi4uLg0KPg0KPiBDaGVlcnMsDQo+DQo=

