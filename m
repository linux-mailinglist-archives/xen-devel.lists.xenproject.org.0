Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F045B7F541B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 00:04:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639282.996435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wGl-0005qH-AY; Wed, 22 Nov 2023 23:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639282.996435; Wed, 22 Nov 2023 23:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wGl-0005mr-7w; Wed, 22 Nov 2023 23:04:31 +0000
Received: by outflank-mailman (input) for mailman id 639282;
 Wed, 22 Nov 2023 23:04:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hBnL=HD=epam.com=prvs=56903895d3=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5wGk-0005mH-9r
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 23:04:30 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c3d4cb7-898b-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 00:04:28 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AMMcNqb004531; Wed, 22 Nov 2023 23:03:45 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uh207481d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Nov 2023 23:03:45 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB9900.eurprd03.prod.outlook.com (2603:10a6:800:1c3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:03:42 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Wed, 22 Nov 2023
 23:03:41 +0000
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
X-Inumbo-ID: 7c3d4cb7-898b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsIdvIhwuv0KCMQJj9IISzVNOn35ZmM0p2NbP0Mz8IoHt3bp9/ROK7AnPEcweTEOS4JipHYf7v75lJKN95OPixAFh+5sMgwelXnNQZVkYn+31ys6+8NKb85HrM/UUoK5coPGAS5qDafm+QJ9TpSQAFrIHOHtbhYCp9gYyIIQoNkW6x8EC1Nr++YHTW9FujsZhUiyYzminY7xTngXVXFngb84HGd783ufez+kqqWEOOXIAgFf9OT9Pr6g10S9NkSZ3YcdZWXTzxGwk61r5naOYIce3E1Qm1IYrgR3lqTAmatiBzLsewhzM4ueKDp74s2gSRVLTWzNwBaP3ZzUgTcvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKQStBJ0n34/GtNYI3bkE9Ujumx7nqq7ddAEpl7PQAI=;
 b=DMgmmHx5VjAyne23HkJEqBH4nzghJDhtGUnwTgOrx+yykn04IWCsH147N4CN93J/l/ZrBmEX1Iy96CTo46dGK3m+dGNnykO0KEeOE1+4yo2PEzeYFh/9ZwS551Rww8qg+q47fHC7KhBidN9KnQtXHumbKhjYV47XWIbTcA1u1RuOBX8gLHf7Iol4swMKiccAeWU4L8sGHHWkZ8HQhEw66NlPiBi2nmBYHabm4dU7YyjY4wN8cMkFAQmHqRrTaNFV9nH3JcT05nRO/Yd1CMv1hBCQuLDedGp1+r9lUTKjIT/hPgt9UjwTiY3gcKpEx6Kwta3f5+zolHtV/9YQ0QC5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKQStBJ0n34/GtNYI3bkE9Ujumx7nqq7ddAEpl7PQAI=;
 b=R+QFmSDmuT08PiR6JSQcD4ho5Z8DixIgcxpNyB4JSHFxQAWZ3Ax7pBITSgFR8b4ighmDDrdOUfYlXeD/zP0tMx2UNz6rFxMe9Y4sO8iIzdx/NJHWuXQWywbDEHtSWmBUG8Z3PcgnBFtDkE9Yn8cgOBkFeXMwYm8jbG7fylyoAf2Qt/nLGZejdOQ5bXEpTKf7mvaZA4h+J1aAxKOvWSv8iNINES/KrRejdXN3rbCi9f/62EqShsPu5Vf9dcmO+KU+qR5lC0qHEA8mRWgY8S8RBq8hGPQHKTYCPl1+sXmml+hisOg6kZC/O6pyC+Gv3GX4Sv+TYUi1rgCS0IIG3ZuIXQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>, Paul Durrant
	<paul@xen.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard
 Henderson <richard.henderson@linaro.org>,
        Eduardo Habkost
	<eduardo@habkost.net>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open
 list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/6] xen: xenstore: add possibility to preserve owner
Thread-Topic: [PATCH v2 3/6] xen: xenstore: add possibility to preserve owner
Thread-Index: AQHaHMeI3Gf8Xs6dHUOphRyadMs2o7CG9fUAgAAASgA=
Date: Wed, 22 Nov 2023 23:03:41 +0000
Message-ID: <87y1epz8z7.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-4-volodymyr_babchuk@epam.com>
 <777dd8fb393464bcac2130210ef2a538a2e606f9.camel@infradead.org>
In-Reply-To: <777dd8fb393464bcac2130210ef2a538a2e606f9.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|VI1PR03MB9900:EE_
x-ms-office365-filtering-correlation-id: fd3edadf-20ce-402b-ce20-08dbebaf4563
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gq/IfvgdrWs9RYMMXoHGhgQ+Xcgs0HX9iK1fZyyrLrd5I45h/aiDsu1/5nLm7E+ImhYqHbbWgnWj1V3hGQWxSg5LyN2XR3A7mt3KWJ+d5MwSdxMIsW0/2Drb4t3Vx7REuF2RhpdSjinJiMieuD/49NXvcI1yYDu4L38R7f/gsGssrJUhaK0off7OTafEiHKHXnbcTPTj4Prz4rJYe46nzMK1MZk6Bj/oLAORJc1RYCVWM2BCIAdbQEWfy49HXSK6HgdJm0lgUDo5Tp4GPA/eiEYtX29PTlwOQPBEzzz3gwzNV1GLZBngE6d4uB68MySgtRQFiSY9WAG3CGNV4StieLM/TSmcgIRAruizB+/OZS2B8GDSptvs+LjJUW2wqOnw8WhHaAf0S8zpmwzn++iRu0rC8x7U3r8EJ0Nw6oMwqs2h3PbADe+GeQmrZE3DkNP2cl/z3BioqOQz1TJt5klrhXhSg1Uobr7QsTRxqEI9p7TcqNmyblHdiAKyuCmTwpbH+AgP8ZdTwgD2A+AD0vqHXuttdmv1jgr5XGs6vwi3HD4ewCtXT6ZwbhBSSP2gy9STUeeu3fxDFnQZtI3/UvYSS/CZlzg9eNlUzlrRGGVsnCCkQlRBnz/ZSMIdzkHgWeOk
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(4744005)(2906002)(4001150100001)(7416002)(5660300002)(6512007)(71200400001)(36756003)(38070700009)(41300700001)(38100700002)(478600001)(8676002)(4326008)(6486002)(122000001)(8936002)(64756008)(86362001)(66476007)(55236004)(76116006)(6506007)(66946007)(6916009)(54906003)(66446008)(91956017)(66556008)(316002)(2616005)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VHhuaUZqY25TaURQRUxiSVliMnlrVXlOQnIvRlVTcTRTV3hacnZ6ZjhKK1Nt?=
 =?utf-8?B?eWk0TzRHd0ZNNkZZZ1pabkNIK09qSVc1Rm5DWmV4TFpMd1RVVzhObzdRM2Fs?=
 =?utf-8?B?WG0rZWZBVDJUZUNtNkhaNmV0cjR6Y09la3Nzd1lxaU9FckR0QlZUOGc5T3BZ?=
 =?utf-8?B?aUxYdzJTeUY4VkhhdTJ3YzNKaGlPMEVoMVdqTGFYTFdFQWdCQXk1N2MvOWEv?=
 =?utf-8?B?SFowRk1KWlE3dW41TFNFdEUvMXRHamdSZ2QveEk4Tm5Ec3JhdUdvU3E2VGk0?=
 =?utf-8?B?NlhvNFFZQ1o0V2lueTM4c3JvQXpPdFJFSDZjRU1na1RqUFZKdnV6MmVkODhX?=
 =?utf-8?B?NFBCUHBTR0Yreit3c0RPNFlDUVJ3Y3M1aUF4OElpVjJTZ1hQYkJ4aUJ6Z1lv?=
 =?utf-8?B?UVdmU0xNek80OWptWUsybDNRUGhJV3E4Q0I0Zy8zSzM0Ym02RW5JVVdMV21G?=
 =?utf-8?B?QVRlUis1WEY0THN1MTlHMWFieGUzTitLR0wvU3ptSWVrYTJTWjFNbWRkQnJu?=
 =?utf-8?B?SzdlYndtTGdPOW9vRHVlMzg3bjA2RVl4K3BjYUJIOTRvbDZyRTVMVDhXdzV5?=
 =?utf-8?B?SWljSmNPYkZ0WFU2ai9XZjh6bjkzYS9jZmNPc1NpVlp5alZCWE9zSEFrdEQz?=
 =?utf-8?B?bkZzVW9pb3l4MGZwRGxnaDNRYUdRem1pYmtCUWtGazY1N2t0VDdJWXBWb084?=
 =?utf-8?B?SXJJRWhjelFzK2dtTDh4dW1QZmJweGtkMSsrK1ZjSGEvcWhMMEFBcFBRTHRq?=
 =?utf-8?B?amhVekNvaDlvZmJKdFRGMW1vdjhiclZxU1FjTlI2MEVVRmFFalV2OER0UEJS?=
 =?utf-8?B?MkZPNS9iVUN6QkhJS0d1RkxubzFlR0N1cFVPV1ZiMExrUG5SaHFwRFhSRHFv?=
 =?utf-8?B?cHpwbkhWZzNLS1R1UnFPVEQzakdSUmZWL0ZPTHh0YTlRTXVMaUZzQzZQc1Zx?=
 =?utf-8?B?TlNSQzJYUHZDOW56b1ZGTUNFQkFDZ2ZqeERJb1RORlVJdVloaTdQS2loWlJB?=
 =?utf-8?B?WGlTVnVoQVNzVG85Q1FWRk9UOWkxUjRMVVUyNmJjVkdXQ0xwNHp1RHlqMWpU?=
 =?utf-8?B?Q2JscXdSVGtYRUVHaE14RnVEWmJ4L0o5TGJhSmh1SElrRDA2ckN0NTV2eHdT?=
 =?utf-8?B?NjQzaHNrY1BSUFdnVWZ3ZlRZMGp6WWoyTDVFc2lHMXhsSS9PQVVKeXg4NmZY?=
 =?utf-8?B?bC9CQjFMZ09Id0RSc0hxbFpkbktZT1JJN2V0bWZRa1dVWGlBVjJZS1dyRGFT?=
 =?utf-8?B?N3o5ZjhMdnRnN1RRUmxsRU1yNXMrOEIwWmdsSHlSbDdLNG5HL0hzTTBsbXIv?=
 =?utf-8?B?a29WbEVKSmljSDlva2dWSU1LOTVvS1M0c0Rkc1JDWmJjazhLZSs1OWc3TFMv?=
 =?utf-8?B?aGR6T3lZMEgwNTRuUG8wZzJ2N2tFSW02TUxnL0hIaC9JRzF2emdmcVJNWHlM?=
 =?utf-8?B?VlRKZjVXL3VKMHNZdUszSytZZVBsRTZBYWpYM1BVVnFQS0pJSXRXQmlUZHh2?=
 =?utf-8?B?Y1gzcnpkRFJZeCtmZmVtZHFoUnA5MmVneWJZM3FXSlpOcnlZa1RQSXlsdVp3?=
 =?utf-8?B?OUIvQW02RGtUWnJuYno4eDVFVTlET2RuNVIreVFDcUJFWlBjTEgzYTNQNEUw?=
 =?utf-8?B?M0U0Ym9UN2k3czk0Qk1kRnRWS2x0aVJYVDU2T21jTitGd2FpaVFKNnVFRURQ?=
 =?utf-8?B?ZlBWeUlJaHZzR2gzRGVyemVRSURIcFdMTGlZTGs3QWV2K2VVL3pFWHEzQ0Fi?=
 =?utf-8?B?bDIwWDFtT2oxUnErVEFYa3hqVUNvckJ4bGs5aFRheG96emFsbDZRSFhYRlNL?=
 =?utf-8?B?cHBzV0RiZzhiczNBS0FkbG5HWjlkZFoyTUZnazlhRDAydWpSc3pYSkNERUFI?=
 =?utf-8?B?dEFxRDhzcFFYSTI3Y1B1Z3ljdGF2eGNOeWJqVnIxTHVhT241cFR0bm5jTUth?=
 =?utf-8?B?QWVDOTg3YSt0K0o3dzdlZFZCZmg0TTg1YTAzaFR6c3ZpU1RiTzBOQkF2ZDUr?=
 =?utf-8?B?TlBrcGhVSE4wNE1UZ1IrNUo0ZHhNelhOdFZJWk1IaWZjL0hmWUlVbkJtTHdR?=
 =?utf-8?B?ejBoNzI3MHpyb2RTNFVyR2tCbU91OWo3Tm45ay9FNmk5NktaNUtOWFV3aWF1?=
 =?utf-8?B?ckFEUzU0dkFOcnlOOGZLdnFUUnJIQXM2MVJkN3JYbERBSWtFdjVzYWhyQzNY?=
 =?utf-8?B?MXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9682277B083A2D4DAB8200DC75746779@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3edadf-20ce-402b-ce20-08dbebaf4563
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 23:03:41.8778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0siXJer+bxBf/XRsrlQMiIyP7o5oRDLI6sy32Sla8ammd+oaGHphnzCPiAeWXmJDQs5KeHL9mefgRGljkCwXyT865bCzTsoXi5mWXIQcOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9900
X-Proofpoint-ORIG-GUID: lc8Ti-n4ITjWqTp5a3jVRzn6TfpZafiN
X-Proofpoint-GUID: lc8Ti-n4ITjWqTp5a3jVRzn6TfpZafiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_18,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=926 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220169

DQpIaSBEYXZpZCwNCg0KRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPiB3cml0
ZXM6DQoNCj4gW1tTL01JTUUgU2lnbmVkIFBhcnQ6VW5kZWNpZGVkXV0NCj4gT24gVHVlLCAyMDIz
LTExLTIxIGF0IDIyOjEwICswMDAwLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IA0KPj4g
LS0tIGEvaHcveGVuL3hlbi1vcGVyYXRpb25zLmMNCj4+ICsrKyBiL2h3L3hlbi94ZW4tb3BlcmF0
aW9ucy5jDQo+PiBAQCAtMzAwLDYgKzMwMCwxOCBAQCBzdGF0aWMgYm9vbCBsaWJ4ZW5zdG9yZV9j
cmVhdGUoc3RydWN0IHFlbXVfeHNfaGFuZGxlICpoLCB4c190cmFuc2FjdGlvbl90IHQsDQo+PiDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsNCj4+IMKgwqDCoMKgIH0NCj4+IMKgDQo+PiAr
wqDCoMKgIGlmIChvd25lciA9PSBYU19QUkVTRVJWRV9PV05FUikgew0KPj4gK8KgwqDCoMKgwqDC
oMKgIHN0cnVjdCB4c19wZXJtaXNzaW9ucyAqdG1wOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHVuc2ln
bmVkIGludCBudW07DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgdG1wID0geHNfZ2V0X3Blcm1p
c3Npb25zKGgtPnhzaCwgdCwgcGF0aCwgJm51bSk7DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHRt
cCA9PSBOVUxMKSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+
PiArwqDCoMKgwqDCoMKgwqAgfQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHBlcm1zX2xpc3RbMF0uaWQg
PSB0bXBbMF0uaWQ7DQo+PiArwqDCoMKgwqDCoMKgwqAgZnJlZSh0bXApOw0KPj4gK8KgwqDCoCB9
DQo+PiArDQo+PiDCoMKgwqDCoCByZXR1cm4geHNfc2V0X3Blcm1pc3Npb25zKGgtPnhzaCwgdCwg
cGF0aCwgcGVybXNfbGlzdCwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBUlJBWV9TSVpFKHBlcm1zX2xpc3QpKTsNCj4+IMKg
fQ0KPg0KPiBJZiB0aGUgZXhpc3RpbmcgdHJhbnNhY3Rpb24gaXMgWEJUX05VTEwgSSB0aGluayB5
b3Ugd2FudCB0byBjcmVhdGUgYQ0KPiBuZXcgdHJhbnNhY3Rpb24gZm9yIGl0LCBkb24ndCB5b3U/
DQoNCkFzIHBlciBTdGVmYW5vJ3MgYW5kIFBhdWwncyBjb21tZW50cyBJJ2xsIGRyb3AgdGhpcyBw
YXRjaA0KY29tcGxldGVseS4gVGhhbmtzIGZvciByZXZpZXcsIHRob3VnaHQuDQoNCi0tIA0KV0JS
LCBWb2xvZHlteXINCg==

