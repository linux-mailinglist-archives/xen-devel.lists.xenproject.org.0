Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDF4443FA3
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 10:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220693.382063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCut-0005P6-KA; Wed, 03 Nov 2021 09:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220693.382063; Wed, 03 Nov 2021 09:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCut-0005LV-FT; Wed, 03 Nov 2021 09:50:47 +0000
Received: by outflank-mailman (input) for mailman id 220693;
 Wed, 03 Nov 2021 09:50:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UC4I=PW=epam.com=prvs=194164c520=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1miCur-0005LN-MM
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 09:50:45 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e64505e-f0d3-4dd8-b53b-5f887c336844;
 Wed, 03 Nov 2021 09:50:43 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A392AFC018885;
 Wed, 3 Nov 2021 09:50:33 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3c3qeh86gv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 09:50:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4147.eurprd03.prod.outlook.com (2603:10a6:208:cf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 09:50:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 09:50:29 +0000
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
X-Inumbo-ID: 4e64505e-f0d3-4dd8-b53b-5f887c336844
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMLpFH/rt+CD0Obt8ByT+D/qwtPkc2NFsnlCXaBlq/CNa4Uj/x+RraBbt5riKZVbV0jUjk1+opPJuILFms06jvleqbkZtJKqhVELukFtVKd4ems/UzbK02N+CZPLShI2BeNoN9XDwRisx+qul/FaOUD64qusNKJAUKmJmLQaJofKmCuV2SyP668jWo5OrnVwELNP0x/47p/4+iZJvTA5QkuDRW5qtAe9348zPAKXAMIX3/lW/hXNAGXJlB7sAQDa3UOkW5Sd5Kp/1YJmTthVlBAXH2zF4vO6SAeEgllOsgOdr9HErbNLlnwqwBqdD8q3xriM2/DclFyg8iR9dPbUnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/zgRFDiRLFXUeeVeLhIxj6Jr/MlDBR38SnXvhJYzCU=;
 b=n2ixJeJr3W+QascRcNGX2kwp70xqMPXeVAn5hi2TjjRpJ8mL8d9rjj8kjnJmp5DrNM3gYsradOx/U6xjCYsO42eyMnVC+sAZm7DKPEBpLj4RgfRqXNwP5gWiKt7pZFtRRZ0yPUriGi5cmKnAwwpXeUQPfuEbQg/74puD+O1RqdR6tCO/PZRZfZ5AQmcmnRAxGcL1eAA9laA/trS+QuWWnOPQBr2rxWsGXWsR7zGFzstsmdCMV6MdY5KzJPQfT7vVSE/d0NoV3fXOnHpr947/cQVVZbZzZemyFwqP7V7h1BQ2dnwjDdm05vhrWNO+8/03wK1Wp4aB3sp13q+RqJ+J5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/zgRFDiRLFXUeeVeLhIxj6Jr/MlDBR38SnXvhJYzCU=;
 b=dAXA7BRDQCQN4dDrjG6UVF7ouIRqYljzoY//OzLhZNNfir4/baRJm6x4zgVR6mdXu8zmBli3DVU0UtlVaBrt2+gwQTzpGcB/dw3bdiJoNvjk5HLfNJ+2+pTr7lDFNqDjr3Qk4vJDO2qHkgVv2+yeEprujmhqngT7hRHp31pTf0OpiyttwJAemRLXdoOz2slowydXP+a5UOqkLvKimpm0pIgzHWZrnbcCfplBLQ75ioF9F89wrLNuw4VE27tM3PFloFbpiPJil09JH5F9xXx8KXkvmuVVZPhV/DXwUvNr9DDVGDiLU3TqvhrSLCqiNJIGp2i3voG8Qc49jwV1zsCJPA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Michal
 Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Index: 
 AQHXtdAkq8Qmwxr3HUWTio8KWsEpvKvlQ6KAgAsHq4CAAAimAIAAIt2AgAAEUICAATmxAIAABTcAgAABvgCAAAXjAIAAAy6A
Date: Wed, 3 Nov 2021 09:50:29 +0000
Message-ID: <8040c3d7-07a0-9a95-c321-850c6ec72b4d@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
 <YYEl8h+WtSZwNPn7@Air-de-Roger>
 <1a19dd35-a649-b155-bdd6-099e08fa3de1@suse.com>
 <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
 <b7626958-4df3-9f07-0ab9-604e55b3274e@epam.com>
 <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
 <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
 <YYJYurhhGGvjRSfH@Air-de-Roger>
In-Reply-To: <YYJYurhhGGvjRSfH@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e53c434-bc5f-4f1e-e21f-08d99eaf5ee2
x-ms-traffictypediagnostic: AM0PR03MB4147:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB41479BAEE1AA3501F505969DE78C9@AM0PR03MB4147.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AcPpCPI33bZg/U1n923xZp9t9dscdzVfiluOpiSA9aDpLkC4JV2PDmFSu+mVYSeTw3//60eVOwmGRBaAhtG7eRW3hkZWIgdnsXa0r/Q1xr/FRkanUVGD15z1qSycCkWQasGrVwzVHWgM8pHPBO2uDMP26eyBP20dlG194UUf/oMGtML3Qhlo5QSPgK4QQhqfJ6JbJCr7HZErer/NYz9fcOlC9I/hMTgxCspuLLPRuJIlk+bOiGgZs99rbxBiJz5+b1CN1SFop6lKSIasl2YkehlZJHDygS9JgaOB93PaUZGf2lIG+oe+bS91qRry2LMsHhdXmvLdz7Bu2foX3GzLWCLmzgItaCCpmRtxoqVt4jBSFUSSxovxGuo8fc/1eKA3OdhFGaq+AJ87d5xrc/YnBxUUgof/eRK7twggq+wJECd+f2CpklEvgwfQ2klfdBEoBWKJakixr7UCp8+Nj5T4u3vmQfkG/Kd1DnS/H9RCpvYaWIPNMAUToDOBK/1SAqOelqVNbeNXYJsHj8FydG/NyhrRvV8Q2jbFdgiUwN+0raS27FZEhd3f1/JMzTXx9g9sBr3iO9Qf4xTXfLjjLE8IaH1xiT09mlFndcKHCl7+nWgmMnxNTa+2W28j/wIooh2245owSsH6EMoWrNnicpw8W1aRJ/dHLkhoWGRN0yoU8bplxTraafyybe4Z3ojnmBsK6Zuiy4GUaVkzsOdiaVvqJa4ihp5KczGAh23022arXR5BVgxR9IcBr/lB6uojjbsb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(5660300002)(316002)(508600001)(36756003)(31696002)(31686004)(4326008)(38070700005)(2616005)(6512007)(86362001)(6506007)(83380400001)(8936002)(26005)(53546011)(122000001)(38100700002)(54906003)(6916009)(186003)(6486002)(2906002)(91956017)(76116006)(66446008)(66556008)(64756008)(66476007)(66946007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RXoyS1hnRlhHYy9YL3Fhc1I0djVoZmRWR1NKRFBPamV5VjQzMm9ocjdOSTZQ?=
 =?utf-8?B?SkxqSHBIVk1HM0J3YThLa0d5ZGxqMG9iL0pEdm82S1lkZUREaEkvUVpJeUR3?=
 =?utf-8?B?cmdlWHNJK2E2cS90Z3lXRjZZWWI3NnhvbTVFeGpYMDQxaC9COW1zVlIxK3RJ?=
 =?utf-8?B?dGV1aU91Z084VEhTOVYrOFVJdG1rTllFUTdnaFpXcHkyNFpoNEk4cTlZZ0VC?=
 =?utf-8?B?Z3ozTHVoaDFqWXo5c0VpNjNGYkRxN3poRUw3dnY5ZEhuclFLdGpSZSt4R0xh?=
 =?utf-8?B?M0M2emhYdWFuRmZXZzR4aEs1VXFnZkp4WkIvVjdIUzc1eHFzVTNadjhnODQ1?=
 =?utf-8?B?TkhzaTNSekdxQ2RwZDBQRUttR3BLTWFqVUVXWmdaRElBcC9QdERBVzF3MEhx?=
 =?utf-8?B?K0hPSTk3dHRmMXU1UWowZFJvWmppeUVjV0dNTUt6Rk5UMWw0VU5QNlhlYWl2?=
 =?utf-8?B?YkFFckFnK2NmdXFpVmIzY3ZzcS9TZmxDNTYrYVhXZ3lNVXlRNHdnRlFrRWxB?=
 =?utf-8?B?Z1ZLaTY1V3lXMG9Nby9TSTJkcHMveHNDVjZTQ013SXBQZk1rQWZaYkk3eGhG?=
 =?utf-8?B?eWlxK0UweGd5amRBYnhZdStiOTB6cldhOTJucTgwQ0hDTDJaMEthV1lQdnN4?=
 =?utf-8?B?T3BvUnMwYjg3VFp0eVRmYWlnQmRhVmhMZzJTOUE0Q3RiUFZGVDFYYVVuMjZ4?=
 =?utf-8?B?MDRyT0dnQm9XVS9HT3FqYU13V3R5UDM3eTVVN29zalh3VWg1d2YvY1NsVWdr?=
 =?utf-8?B?blBtZmVQUjRyNSs2dlFPeFVjcCtndERCOXZET2FqSlYyRGltYzAvQlRDWng3?=
 =?utf-8?B?eHFjMGp6enB2VlBjNE1TM2RMSVR4TmVqcXBYZklRZ2xuR2Q0azFVdGJGcHJX?=
 =?utf-8?B?ci94WHM0MzAvVTJGcEtoSUxkdFVQd2c2dmc5VkdyRzNKc1Q2bEdCUHMvSmNm?=
 =?utf-8?B?TUlXc2VXT25Kc1lVc2pKNnFyWFRIWlBwUjJHbEdaMGdWYS95YVhYYW9CcTkw?=
 =?utf-8?B?emxmVGFEL2w0YytrbzNQcjh2MUhqczhnbDFNbnJtWDE0dEQzbHVpOCtmTjNz?=
 =?utf-8?B?MVN2UWxKV1NBTWFhb0g4YnFBTXhxUEMyYWhDZGRmNEY3Q3BCbG9KNFdDeHAx?=
 =?utf-8?B?SDBkSjhNZDlDT1Rpb0g3YzdrUmlVV29lcFRkeVV6UEtVUW82aEhIVjUzdC9H?=
 =?utf-8?B?SzdiOGxNV2MwbEFRN08vQ0drVnpoNklSc1o1U1pHSnFMSndpUUc3NjNUcXd2?=
 =?utf-8?B?WGJObVlBWWJ0Z2xLbCtDMDNzWGs4WU5jenRvOWdWc3dUejdnek5zbThUTkxN?=
 =?utf-8?B?SFJqQ2Urak9yQXN3ZXRMMTk0M3M4U2JNSUdPQzN6eDgvajlNaS91QWJaSVdo?=
 =?utf-8?B?OXpaYkduNkhsOXpZT3ZEaGdSTk4xcENucDkreGRBK05vK1FLOU5vSHNaS2po?=
 =?utf-8?B?WmZLUDJKV21IMWlOQTFjL0VJRzdhd21TeU1kZTNRMzMwdGhuaGc4b2RYT2JZ?=
 =?utf-8?B?OXE2eWZKSkpPTllzeFh2T0J1Mkg3ODlxZVR6dmJFMXRGMkd2dVFuZmw2MExS?=
 =?utf-8?B?MFJVaTlDQ3QwcWpqQkM5dVBpUkN2aVE1a0tXK1JpVDlHWEZYRHB3bUpoT3NZ?=
 =?utf-8?B?U29QbjcrUmZvVzBTZ0hCN1JwbDlPNTR3WWVzUnNTTHp5WitNM2pKSCtyb2Q2?=
 =?utf-8?B?TUU2cXVzd0VPKzRkcVRZdnQ3UmlOQ2ptOERSRGg4SWNhQjZ1WnFTRmtyUko0?=
 =?utf-8?B?MFhGT1hLb29GdnZqdlR1dzkrUkFTalZTNCtUaXBjNWp0TVo2bkZ6bEUyeWFV?=
 =?utf-8?B?SFI1NzZCUlNlYmZYa3k1bXdKUlF6NXc2bWx1QWcwc2N1a0hBb3oveG43Z3Av?=
 =?utf-8?B?REwxQXVaMllSeDBQdERIekVFR0R6ZS80aDBwV3ZJTTh4cklDekJWVmVBRTFC?=
 =?utf-8?B?VWIyWXBHKzZ4ZW9JRHM0UUFwWit5TWdXK3B6Q2NUYTA2aE0zbDFnZktiampE?=
 =?utf-8?B?dm42ellUL05rNXp3TjZjSnJMdkc1K2xONkNOYUxuQnYrUG8rQ1ZNSXV0WnFy?=
 =?utf-8?B?U212RzdzeGoxYlFnQkZkOGtGMk5Uak9Rc0Q3cUYvMDQyak9zZlpKY2Jkczl1?=
 =?utf-8?B?RExlMHd3Y1p1RWo4QXVHVnhxUlkwanBqeUMzUHQxQnB1Y2VSWW5RWDdQRkZH?=
 =?utf-8?B?VS9uc2JUejdVRzAybHpCejdyRUtxQnkxSDlHeFN1dU1RcDRpbWlnbHA0U2pj?=
 =?utf-8?B?OTAxTnhVODdiTEI4QmxXRndlSGpPQnBFQjBaMkVhclcxSTZjVTZ2UU8wT0ZJ?=
 =?utf-8?B?bjRCTzdBYTlGUTcwcEYwanFoYkhDak9PS0hRV2ZOTmJmckdLeG5Bdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <344EBCB34FBE81469CBBD7063D1B235D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e53c434-bc5f-4f1e-e21f-08d99eaf5ee2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 09:50:29.6754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: utp1IAVtBgkcAPppnHiMHek8/Y62NXWMx2gepKNG2d797HMrL1e22uW/a88Q1j7Dt6mXUWQiwnsrlti3kHvqfDZN08gUa9X+qMphUKbV6o5eaNukMY6J2GlrQaXDsdNP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4147
X-Proofpoint-GUID: 66D3kQ15JCEG_ZbBlN47Eu2zqN9Gu-Pb
X-Proofpoint-ORIG-GUID: 66D3kQ15JCEG_ZbBlN47Eu2zqN9Gu-Pb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_03,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxlogscore=967 spamscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111030055

DQoNCk9uIDAzLjExLjIxIDExOjM5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQs
IE5vdiAwMywgMjAyMSBhdCAwOToxODowM0FNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAwMy4xMS4yMSAxMToxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+
Pj4gT24gMDMuMTEuMjAyMSAwOTo1MywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+
Pj4+IE9uIDAyLjExLjIxIDE2OjEwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+
Pj4+IE9uIDAyLjExLjIxIDE1OjU0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+PiBPbiAwMi4x
MS4yMDIxIDEyOjUwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4+PiBPbiBUdWUsIE5v
diAwMiwgMjAyMSBhdCAxMjoxOToxM1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+
Pj4+IE9uIDI2LjEwLjIwMjEgMTI6NTIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4+
Pj4gT24gVGh1LCBTZXAgMzAsIDIwMjEgYXQgMTA6NTI6MjBBTSArMDMwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVh
ZGVyLmMNCj4+Pj4+Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+
Pj4+PiBAQCAtNDUxLDYgKzQ1MSwzMiBAQCBzdGF0aWMgdm9pZCBjbWRfd3JpdGUoY29uc3Qgc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+Pj4+Pj4+Pj4+ICAgICAgICAg
ICAgICBwY2lfY29uZl93cml0ZTE2KHBkZXYtPnNiZGYsIHJlZywgY21kKTsNCj4+Pj4+Pj4+Pj4g
ICAgICB9DQo+Pj4+Pj4+Pj4+ICAgICAgDQo+Pj4+Pj4+Pj4+ICtzdGF0aWMgdm9pZCBndWVzdF9j
bWRfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+
Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgY21kLCB2b2lk
ICpkYXRhKQ0KPj4+Pj4+Pj4+PiArew0KPj4+Pj4+Pj4+PiArICAgIC8qIFRPRE86IEFkZCBwcm9w
ZXIgZW11bGF0aW9uIGZvciBhbGwgYml0cyBvZiB0aGUgY29tbWFuZCByZWdpc3Rlci4gKi8NCj4+
Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+PiArICAgIGlmICggKGNtZCAmIFBDSV9DT01NQU5EX0lOVFhf
RElTQUJMRSkgPT0gMCApDQo+Pj4+Pj4+Pj4+ICsgICAgew0KPj4+Pj4+Pj4+PiArICAgICAgICAv
Kg0KPj4+Pj4+Pj4+PiArICAgICAgICAgKiBHdWVzdCB3YW50cyB0byBlbmFibGUgSU5UeC4gSXQg
Y2FuJ3QgYmUgZW5hYmxlZCBpZjoNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICogIC0gaG9zdCBoYXMg
SU5UeCBkaXNhYmxlZA0KPj4+Pj4+Pj4+PiArICAgICAgICAgKiAgLSBNU0kvTVNJLVggZW5hYmxl
ZA0KPj4+Pj4+Pj4+PiArICAgICAgICAgKi8NCj4+Pj4+Pj4+Pj4gKyAgICAgICAgaWYgKCBwZGV2
LT52cGNpLT5tc2ktPmVuYWJsZWQgKQ0KPj4+Pj4+Pj4+PiArICAgICAgICAgICAgY21kIHw9IFBD
SV9DT01NQU5EX0lOVFhfRElTQUJMRTsNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgZWxzZQ0KPj4+Pj4+
Pj4+PiArICAgICAgICB7DQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICB1aW50MTZfdCBjdXJyZW50
X2NtZCA9IHBjaV9jb25mX3JlYWQxNihwZGV2LT5zYmRmLCByZWcpOw0KPj4+Pj4+Pj4+PiArDQo+
Pj4+Pj4+Pj4+ICsgICAgICAgICAgICBpZiAoIGN1cnJlbnRfY21kICYgUENJX0NPTU1BTkRfSU5U
WF9ESVNBQkxFICkNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICBjbWQgfD0gUENJX0NPTU1B
TkRfSU5UWF9ESVNBQkxFOw0KPj4+Pj4+Pj4+PiArICAgICAgICB9DQo+Pj4+Pj4+Pj4gVGhpcyBs
YXN0IHBhcnQgc2hvdWxkIGJlIEFybSBzcGVjaWZpYy4gT24gb3RoZXIgYXJjaGl0ZWN0dXJlcyB3
ZQ0KPj4+Pj4+Pj4+IGxpa2VseSB3YW50IHRoZSBndWVzdCB0byBtb2RpZnkgSU5UeCBkaXNhYmxl
IGluIG9yZGVyIHRvIHNlbGVjdCB0aGUNCj4+Pj4+Pj4+PiBpbnRlcnJ1cHQgZGVsaXZlcnkgbW9k
ZSBmb3IgdGhlIGRldmljZS4NCj4+Pj4+Pj4+IFdlIGNhbm5vdCBhbGxvdyBhIGd1ZXN0IHRvIGNs
ZWFyIHRoZSBiaXQgd2hlbiBpdCBoYXMgTVNJIC8gTVNJLVgNCj4+Pj4+Pj4+IGVuYWJsZWQgLSBv
bmx5IG9uZSBvZiB0aGUgdGhyZWUgaXMgc3VwcG9zZWQgdG8gYmUgYWN0aXZlIGF0IGEgdGltZS4N
Cj4+Pj4+Pj4+IChJT1cgc2ltaWxhcmx5IHdlIGNhbm5vdCBhbGxvdyBhIGd1ZXN0IHRvIGVuYWJs
ZSBNU0kgLyBNU0ktWCB3aGVuDQo+Pj4+Pj4+PiB0aGUgYml0IGlzIGNsZWFyLikNCj4+Pj4+Pj4g
U3VyZSwgYnV0IHRoaXMgY29kZSBpcyBtYWtpbmcgdGhlIGJpdCBzdGlja3ksIGJ5IG5vdCBhbGxv
d2luZw0KPj4+Pj4+PiBJTlRYX0RJU0FCTEUgdG8gYmUgY2xlYXJlZCBvbmNlIHNldC4gV2UgZG8g
bm90IHdhbnQgdGhhdCBiZWhhdmlvciBvbg0KPj4+Pj4+PiB4ODYsIGFzIGEgZ3Vlc3QgY2FuIGRl
Y2lkZSB0byB1c2UgTVNJIG9yIElOVHguIFRoZSBlbHNlIGJyYW5jaCBuZWVkcw0KPj4+Pj4+PiB0
byBiZSBBcm0gb25seS4NCj4+Pj4+PiBJc24ndCB0aGUgImVsc2UiIHBhcnQgcXVlc3Rpb25hYmxl
IGV2ZW4gb24gQXJtPw0KPj4+Pj4gSXQgaXMuIE9uY2UgZml4ZWQgSSBjYW4ndCBzZWUgYW55dGhp
bmcgQXJtIHNwZWNpZmljIGhlcmUNCj4+Pj4gV2VsbCwgSSBoYXZlIGxvb2tlZCBhdCB0aGUgY29k
ZSBvbmUgbW9yZSB0aW1lIGFuZCBldmVyeXRoaW5nIHNlZW1zIHRvDQo+Pj4+IGJlIG9rIHdydCB0
aGF0IHN0aWNreSBiaXQ6IHdlIGhhdmUgMiBoYW5kbGVycyB3aGljaCBhcmUgY21kX3dyaXRlIGFu
ZA0KPj4+PiBndWVzdF9jbWRfd3JpdGUuIFRoZSBmb3JtZXIgaXMgdXNlZCBmb3IgdGhlIGhhcmR3
YXJlIGRvbWFpbiBhbmQgaGFzDQo+Pj4+ICpubyByZXN0cmljdGlvbnMqIG9uIHdyaXRpbmcgUENJ
X0NPTU1BTkQgcmVnaXN0ZXIgY29udGVudHMgYW5kIHRoZSBsYXRlcg0KPj4+PiBpcyBvbmx5IHVz
ZWQgZm9yIGd1ZXN0cyBhbmQgd2hpY2ggZG9lcyBoYXZlIHJlc3RyaWN0aW9ucyBhcHBsaWVkIGlu
DQo+Pj4+IGVtdWxhdGVfY21kX3JlZyBmdW5jdGlvbi4NCj4+Pj4NCj4+Pj4gU28sIGZvciB0aGUg
aGFyZHdhcmUgZG9tYWluLCB0aGVyZSBpcyBubyAic3RpY2t5IiBiaXQgcG9zc2libGUgYW5kIGZv
ciB0aGUNCj4+Pj4gZ3Vlc3QgZG9tYWlucyBpZiB0aGUgcGh5c2ljYWwgY29udGVudHMgb2YgdGhl
IFBDSV9DT01NQU5EIHJlZ2lzdGVyDQo+Pj4+IGhhcyBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUg
Yml0IHNldCB0aGVuIHRoZSBndWVzdCBpcyBlbmZvcmNlZCB0bw0KPj4+PiB1c2UgUENJX0NPTU1B
TkRfSU5UWF9ESVNBQkxFIGJpdCBzZXQuDQo+Pj4+DQo+Pj4+IFNvLCBmcm9tIGhhcmR3YXJlIGRv
bWFpbiBQT1YsIHRoaXMgc2hvdWxkIG5vdCBiZSBhIHByb2JsZW0sIGJ1dCBmcm9tDQo+Pj4+IGd1
ZXN0cyB2aWV3IGl0IGNhbi4gTGV0J3MgaW1hZ2luZSB0aGF0IHRoZSBoYXJkd2FyZSBkb21haW4g
Y2FuIGhhbmRsZQ0KPj4+PiBhbGwgdHlwZXMgb2YgaW50ZXJydXB0cywgZS5nLiBJTlR4LCBNU0ks
IE1TSS1YLiBJbiB0aGlzIGNhc2UgdGhlIGhhcmR3YXJlDQo+Pj4+IGRvbWFpbiBjYW4gZGVjaWRl
IHdoYXQgY2FuIGJlIHVzZWQgZm9yIHRoZSBpbnRlcnJ1cHQgc291cmNlIChhZ2Fpbiwgbm8NCj4+
Pj4gcmVzdHJpY3Rpb24gaGVyZSkgYW5kIHByb2dyYW0gUENJX0NPTU1BTkQgYWNjb3JkaW5nbHku
DQo+Pj4+IEd1ZXN0IGRvbWFpbnMgbmVlZCB0byBhbGlnbiB3aXRoIHRoaXMgY29uZmlndXJhdGlv
biwgZS5nLiBpZiBJTlR4IHdhcyBkaXNhYmxlZA0KPj4+PiBieSB0aGUgaGFyZHdhcmUgZG9tYWlu
IHRoZW4gSU5UeCBjYW5ub3QgYmUgZW5hYmxlZCBmb3IgZ3Vlc3RzDQo+Pj4gV2h5PyBJdCdzIHRo
ZSBEb21VIHRoYXQncyBpbiBjb250cm9sIG9mIHRoZSBkZXZpY2UsIHNvIGl0IG91Z2h0IHRvDQo+
Pj4gYmUgYWJsZSB0byBwaWNrIGFueSBvZiB0aGUgdGhyZWUuIEkgZG9uJ3QgdGhpbmsgRG9tMCBp
cyBpbnZvbHZlZCBpbg0KPj4+IGhhbmRsaW5nIG9mIGludGVycnVwdHMgZnJvbSB0aGUgZGV2aWNl
LCBhbmQgaGVuY2UgaXRzIG93biAiZGlzbGlrZSINCj4+PiBvZiBJTlR4IG91Z2h0IHRvIG9ubHkg
ZXh0ZW5kIHRvIHRoZSBwZXJpb2Qgb2YgdGltZSB3aGVyZSBEb20wIGlzDQo+Pj4gY29udHJvbGxp
bmcgdGhlIGRldmljZS4gVGhpcyB3b3VsZCBiZSBkaWZmZXJlbnQgaWYgWGVuJ3MgdmlldyB3YXMN
Cj4+PiBkaWZmZXJlbnQsIGJ1dCBhcyB3ZSBzZWVtIHRvIGFncmVlIFhlbidzIHJvbGUgaGVyZSBp
cyBzb2xlbHkgdG8NCj4+PiBwcmV2ZW50IGludmFsaWQgY29tYmluYXRpb25zIGdldHRpbmcgZXN0
YWJsaXNoZWQgaW4gaGFyZHdhcmUuDQo+PiBPbiB0b3Agb2YgYSBQQ0kgZGV2aWNlIHRoZXJlIGlz
IGEgcGh5c2ljYWwgaG9zdCBicmlkZ2UgYW5kDQo+PiBwaHlzaWNhbCBidXMgdG9wb2xvZ3kgd2hp
Y2ggbWF5IGltcG9zZSByZXN0cmljdGlvbnMgZnJvbQ0KPj4gRG9tMCBQT1Ygb24gdGhhdCBwYXJ0
aWN1bGFyIGRldmljZS4gU28sIGV2ZXJ5IFBDSSBkZXZpY2UNCj4+IGJlaW5nIHBhc3NlZCB0aHJv
dWdoIHRvIGEgRG9tVSBtYXkgaGF2ZSBkaWZmZXJlbnQgSU5UeA0KPj4gc2V0dGluZ3Mgd2hpY2gg
ZG8gZGVwZW5kIG9uIERvbTAgaW4gb3VyIGNhc2UuDQo+IEhtLCBpdCdzIGtpbmQgb2Ygd2VpcmQu
IFdoYXQgaGFwcGVucyBpZiB5b3UgcGxheSB3aXRoIHRoaXMgYml0IGFuZCB0aGUNCj4gYnJpZGdl
IGRvZXNuJ3Qgc3VwcG9ydCBpdD8NCkZvciB0aGF0IHJlYXNvbiBJIHRoaW5rIGl0IGlzIGVub3Vn
aCB0byByZWxheSBvbiBzb21lIHJlZmVyZW5jZSB2YWx1ZQ0Kd2hpY2ggc2hvd3MgaWYgSU5UeCBj
YW4gYmUgdXNlZC4gRm9yIHRoYXQgSSBzdWdnZXN0IHdlIGRlcGVuZCBvbg0KRG9tMCBmb3Igbm93
IGFuZCByZWFkIHRoaXMgcmVmZXJlbmNlIFBDSV9DT01NQU5EIHZhbHVlIHdoaWxlDQppbiBpbml0
X2JhcnMgKyBpc19oYXJkd2FyZV9kb21haW4uIFRoZW4gdGhpcyBjYW4gYmUgdXNlZCB0byBmZWVk
DQp0aGUgaW5pdGlhbCB2YWx1ZSBvZiB0aGUgUENJX0NPTU1BTkQgZm9yIGd1ZXN0cy4NClRoaXMg
d2F5IERvbTAgc29sdmVzIHRoZSBwcm9ibGVtICJ3aGF0IGlzIHN1cHBvcnRlZCBmb3IgdGhpcw0K
UENJIGRldmljZSB3aXRoIHJlc3BlY3QgdG8gdGhlIGJ1cyB0b3BvbG9neSBhbmQgaG9zdCBicmlk
Z2UiDQo+DQo+IEFsc28gbm90ZSB0aGF0IHlvdXIgY3VycmVudCBjb2RlIHdvdWxkIGFsbG93IGEg
ZG9tVSB0byBzZXQgdGhlIGJpdCBpZg0KPiBwcmV2aW91c2x5IHVuc2V0LCBidXQgaXQgdGhlbiB3
b24ndCBhbGxvdyB0aGUgZG9tVSB0byBjbGVhciBpdCwgd2hpY2gNCj4gZG9lc24ndCBzZWVtIHRv
IGJlIGV4YWN0bHkgd2hhdCB5b3UgYXJlIGFpbWluZyBmb3IuDQpUaGF0IHdhcyBub3RlZCBiZWZv
cmUuIElmIHdlIHVzZSB0aGUgcmVmZXJlbmNlIHZhbHVlIGFuZCB1c2UgaXQNCmFzIGFuIGluaXRp
YWwgdmFsdWUgb2YgdGhlIFBDSV9DT01NQU5EIGZvciB0aGUgZ3Vlc3RzIChyZW1lbWJlcg0KSSB1
c2UgMCBpbiB0aGUgcGF0Y2ggd2hpY2ggcmVzZXRzIFBDSV9DT01NQU5EIGZvciB0aGUgZ3Vlc3Rz
DQphbmQgY2hlY2sgdGhlIHJlYWwgUENJX0NPTU1BTkQgY29udGVudHMgdG8gZGVjaWRlIG9uIElO
VHgpLg0KU28sIHRoaXMgcmVmZXJlbmNlIHZhbHVlIGNhbiBiZSB1c2VkIGluIGNoZWNrczoNCiDC
oMKgwqDCoMKgwqDCoCBpZiAoIHBkZXYtPnZwY2ktPm1zaS0+ZW5hYmxlZCApDQogwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjbWQgfD0gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFOw0KIMKgwqDCoMKg
wqDCoMKgIGVsc2UNCiDCoMKgwqDCoMKgwqDCoCB7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoIHBkZXYtPmNtZF9yZWZfdmFsdWUgJiBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUgKQ0KIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5eXl5eXl5eXl5eXl5eDQogwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtZCB8PSBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEU7DQog
wqDCoMKgwqDCoMKgwqAgfQ0KDQppbml0X2JhcnM6DQppZiAoaHdkb20pDQogwqBwZGV2LT5jbWRf
cmVmX3ZhbHVlID0gcmVhZChQQ0lfQ09NTUFORCkNCj4NCj4gVGhhbmtzLCBSb2dlci4NCj4NCg==

