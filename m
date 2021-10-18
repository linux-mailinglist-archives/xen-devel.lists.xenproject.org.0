Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AB2431FE8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 16:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212397.370263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTlg-0003Hj-26; Mon, 18 Oct 2021 14:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212397.370263; Mon, 18 Oct 2021 14:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTlf-0003FH-Uh; Mon, 18 Oct 2021 14:37:35 +0000
Received: by outflank-mailman (input) for mailman id 212397;
 Mon, 18 Oct 2021 14:37:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RpTT=PG=epam.com=prvs=0925c93432=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mcTle-0002zA-Lf
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 14:37:34 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee35016a-3020-11ec-82d8-12813bfff9fa;
 Mon, 18 Oct 2021 14:37:33 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 19IDtc83020423;
 Mon, 18 Oct 2021 14:37:29 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bs3h7a2p7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 14:37:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7347.eurprd03.prod.outlook.com (2603:10a6:20b:268::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Mon, 18 Oct
 2021 14:37:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 14:37:25 +0000
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
X-Inumbo-ID: ee35016a-3020-11ec-82d8-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJETXD7IJXDn/nGotwQLk/M6PLbylLVSkQEPTm9HiEmnHNWfqu4wmAVJDQ5oNagugGk8b7fz3pCxERUZIj/euRM1zRykx87RIt8RMlClyv9+WTnmfC1Fqbdf5vGVOPLlD5fblk7nreXzo/OrbXVQChxQcZqXaz3fvfQqZR0Uf703red92v/kwCeJzySxgT4t9UMGHzKQFIGajFxkxyMHO0VsVJK2VVxSN0Y7RypW1DtymnN8YhREh72jABJlzXXdbdej8nqpIN+eskmm/u/1hC1EGhcBINaCj7lw9YSKx3ro4zrEO97W/CsF4Og0Sgry1eDZ8mbt0NTkfwpyE3G5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThbFuXUWyrEFc3RCtDoI1+ASJRiaghDVi5Dc9xXoh8E=;
 b=A0UCHgFGrJe6P/8m9Rva5kd3M1EEJm2eQjdOvMbrT9KV/KbUHiwobyuiHKj3OMRCmND6QJKdGKLVqlGVJ6RnNw7+pLo2CIWR4llnTlLoKT8zon4+tFBo7oo2f9Ckg2WuhuLg9hTrb9tiOfsjAa7+EuDSxteScEYXl4n7z0zJUQno+kDcn8p3XYk7ZuRj8rWypjSn6i3X/S68UBBZwJU3s7LizdH2dDRQF7TexiLkY9Rq33NwD34Prk9037J7+eVfQo0HJgS1lD4lFOiHIJlcmimtaovLOol6G/sndm0QuT6nMfrPQEmUHn7DNXCUd+Gpmb6g6GxckV8jhT9iShlrmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThbFuXUWyrEFc3RCtDoI1+ASJRiaghDVi5Dc9xXoh8E=;
 b=MfgspaaMsgnxm9nWZcdJfvXu9tW+W6HV7/WP2trIXuNpnZUXJ76VsHPiunjRrPyebqscyNEcKzNBSTf9zRa2Z1GFRppMPiC4l5QE/y5dtwEaLTyLBQmf+8OLDIFYjTtS9AZYW1cMjz/s85pNSMTPUXzkdZ9qJ3XJAOhKUgiEqpzNCPImLMpW31Is3U0/+ZxZW+froum7cECtzMrxnESzhxdWr6V+PKvHr0nOqNTDkxw/KPINUtKMlRLSuNe0Ah4JDeBOXnJNNRdaH1mVdZB0p37n4FPnO5eA/n6+lrFtW+vJWs5RM46BZNXWypoT5eQXfEye/8Ceziql+QCJU9KzAA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
CC: Rahul Singh <rahul.singh@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
        Paul Durrant
	<paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Ian Jackson <iwj@xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Topic: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Index: AQHXxCmHx+Lzp09rU0elFmx0jxVt5qvYzfUAgAAFDAA=
Date: Mon, 18 Oct 2021 14:37:25 +0000
Message-ID: <2a47d0d9-a821-bd2d-62ee-173ccf5374e8@epam.com>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <ca5558b2-25c6-90d2-284b-03cbbb02691f@suse.com>
 <FBC4FA6D-AF07-437A-BD81-52708B139070@arm.com>
 <8c99e635-9509-b078-2285-48fb6fb91507@suse.com>
 <46bcd42f-df4f-922a-cc21-a05821481754@epam.com>
 <17fd4f89-9afa-f65c-c66d-1364d7474969@suse.com>
In-Reply-To: <17fd4f89-9afa-f65c-c66d-1364d7474969@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 497a1cf9-9487-4dbf-4404-08d99244cd8c
x-ms-traffictypediagnostic: AM9PR03MB7347:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7347D7C08ACD2E355C61A049E7BC9@AM9PR03MB7347.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 d3Vxz+VacT7S4p0aq8yBuP0tOr85/KcCf7FDuPFY9cNLnSOCKKOaq6BeIXF2sTvcjjNrHgLpSph8UfpdenPTz1NsJWsCtfjz6bs9BSJasPfmVwyG6kMJphXNsxZ9mEH0DqpxC61u9EyLjnkODV01MDzRHhVYR79Z/mPI9GfrCP0fDV+80hDsfosyJxhzgamvPf98g271C/UgwBqdYGIL/rCg9pU1ht4oauMLeg3J0XP8EVSisiugIBA/vof/WocM3DQbZnMCXbYYxJc4SzTnD81z4QJd9Fh1KkXnPkjSMyZ+CwHVgXsP3dv0gU3bOuqHt8BecPtNLAz7Ym+SPTePpg365XxtfLCoQWPe0URegr2Jpm/CcL2s69y3pE718mEVhYRl9/0nhHjbunUAylg2veGTavnIMp/MU4aQYE8MpDPfjL6AJ98ETvOggUHTLUULdGBIBBxJkeKl9+E224iK7F+HiotZV6bcARoe1dyDzVo4ziyrkvZygNs5Gb74hvbLIH+mX3xXKIY6yLxUDwv7YZAPMh8giWGWHY+1XysEU4y8xOPVU2/xo8yQ5TiR4qEsobvxQkH6ooi6PAvBoAQFMEZckFOKG2GeNBAHUZFJC/ms9tF/1/MEWn4zKBsAn8khlw94UZodIj+43yD5hvVpCSDGqz1A3zHW4cK2VAehsnH6wX2WusGkxBIxtGt8zdcxPEC0j1iRu+LzgihbfyJc8URr9qza0f3byy2i1y7OvmkqEAsxyQJCYTj1eGp2qlcWNLzwLYVNX+WV/JO0Z24zwVpPP5+JHX7/U1Klhvgo6ugEBGQgWsI0IuNxkgh3ty9h2aIOsnzAtUH3FsgKs1l82Iy0zgDC65zWNfU6Mef2/9k=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(2906002)(4326008)(107886003)(91956017)(8676002)(110136005)(6506007)(316002)(31686004)(2616005)(38100700002)(31696002)(5660300002)(36756003)(6512007)(38070700005)(508600001)(186003)(7416002)(6486002)(86362001)(71200400001)(54906003)(66946007)(66446008)(66556008)(64756008)(26005)(76116006)(8936002)(66476007)(966005)(53546011)(83380400001)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VVdVdEQwcWk2YWFhYmJwR1E5M2JIb1ZXM21Pb2VBelJOb2o0Z2gxQlpPTXJm?=
 =?utf-8?B?SG1mUDJVQWRvMmZoNmdqMGhRaFhPYlhPRFR3WDlvWVJrblZpOG1sMlpNN3Jl?=
 =?utf-8?B?ektLZ29yOGk3bmFPZVpNc1BtaGlIekJ2Nk1pSWxISi9WL3pZUkhXeDRWZTBD?=
 =?utf-8?B?dXVHNFVDWTZ1Z1RpODkvYXYyU0xkWk9UT1F1WUFxSDdBeTBRV1crOVhzS3Fr?=
 =?utf-8?B?OWJuTmFHWlpqOHJLejZkZmUyMkF6cUVOMzVKY2EvK3RKNVNlOUpIYXpWR2ox?=
 =?utf-8?B?aVFhTU1yM1BiRGIyclJLL0k1RVpWQkZEOHJ1VTdRV1RGdjk4OXl1c0w5S3hQ?=
 =?utf-8?B?dlpqdU56b0laMHhYc294ZGxITU1qNUpJMGhwbHJmYkkzYW5CTFlrN1lPTkY0?=
 =?utf-8?B?VzAyTzd5aTkzR09lN2ZKNEdMTVkwYy9wcjlveUJ5em1PSzdvWHBvN2lBWWc0?=
 =?utf-8?B?bm01SFQyQk40cDFpTXZrUTQvRjhFbHBaVGNVbWdYTlh3eEpvcXNhK0FJazJm?=
 =?utf-8?B?Z2Y3UlZVMXZMeGdZU3ByZFhQUkttQmhNTEdrbjNqQjUxam8yaDBvTCtWaXBN?=
 =?utf-8?B?Zk1kKy8yV0JqUUFXSHVyZko4WjlTY1BnVzJiY0FJOHlVTnhCL3lNemZoQ2xx?=
 =?utf-8?B?RUM0UkRtNFdycDJoYmNjYklDd01yaVZya3k5STFVNy9qbTdhYi9hSWQ0cWY4?=
 =?utf-8?B?ZnQrRlM3NG1VMnNTRTdVemtIS0x0ZHVlTUt5NHYyWjB4R1JLOXIyNVh1RjBa?=
 =?utf-8?B?cG1sUXAwRGloU25YclpQOE5Jak1VYWdFdTI5WXlhaExMaHRsMGVQQ2x4UTJm?=
 =?utf-8?B?RXJ6YkNCZldiYXRETzFXUmo5eUJiUVRaRlA1Zng5TU9LU3Nqcy9KVTRGa0dM?=
 =?utf-8?B?UThSZ1dCNVVwUDkyTDRzMUpDOFlJYUNBNHJackY3RHN0M0RCNTFYVXNGaXQ4?=
 =?utf-8?B?bC9oUVJFelI3bTc3U1o5eVVWSFA1c2lRT01DY0kxUHZXeERIaGoxMFRtcUhQ?=
 =?utf-8?B?WFZhdWlhRmRhbm03alpJMXpGZVUvK2wwYnlNd0IxWDk3Qm5McGc5VWt6THhD?=
 =?utf-8?B?RnJ1Z2c0bFJJQ2N3OUdOOXk4QjUrLzB4NGUxeXdHRTlqcW0ySk9JSG9zMk8x?=
 =?utf-8?B?REc3S084OWF4OG9WaUJzOUlpb1NjSThnL0U0WG1Td3paTHBSNjg3YjM3M1A0?=
 =?utf-8?B?OVA1QUtEL21KV0JYalgvcTI0eHR5VXkrV2daKzRza2l6YjJYOFBJdVVLNC8x?=
 =?utf-8?B?MXhrMlZQN1JpU3lHQVRTRVRDcDV6UGw1K0pNNmtzUzJhM0w4VS9uMXZINGRQ?=
 =?utf-8?B?SlJPTXRuUkE5TWRCdDE1WnRNR3RYQ3AzbW1tU21YV1RQb0NoZG53aFNST01u?=
 =?utf-8?B?b1hWWnQxOXpFTDBGbTRiWmlXelBpZ21UU3NtdVV1di9sNG1xcjNRdVByS29a?=
 =?utf-8?B?M3cxY3gyMTVIc2puYmdKcGhObEpjWi9MVlZTRjNLUjZQT1pnK1VTR3hWTkxU?=
 =?utf-8?B?T282eU1uYlYzTlQ4WFRiRUQyeUFIRHhWQUJpN1RyMWJsclpLMFF5Vmc5RUFH?=
 =?utf-8?B?S0tyTUxIV2dpUWdwUXVGcmNWRWo3Z0JlQWNKRVFNOFdUekJMelZSa0dleXhz?=
 =?utf-8?B?Q1Uyekc5RGV3ditDZUkrWjRwNnRyTzFLc0plNC93V2FQd2pVWE13NVE1T0xR?=
 =?utf-8?B?YTJxQU4xWi9kNUFSNHpGbzUwSXg1ZTFhc3NOVTkxN2lPeFVrN1ppa1FzREgz?=
 =?utf-8?Q?iJLejpP1b/oZrJYUpHgpqrPgZ4pdE8mGhLxmgYw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19326AE6EBC07D4589B0442A2B775794@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 497a1cf9-9487-4dbf-4404-08d99244cd8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 14:37:25.2673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: njBcO6Zc5Xb5T6rNfMoTRRyTJ5QlkeVgk4bcxbbncAK8t13ONiDFTxk36BCrGtPQ81qbn564Elm5ZFjpfS6n1JP3lGL4cobhLQbyrm8ItmbVwlABoqSptdwEbMdglYmw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7347
X-Proofpoint-GUID: ANxlWaRtaGeCMCrYZX4o4NM1dXP6raZW
X-Proofpoint-ORIG-GUID: ANxlWaRtaGeCMCrYZX4o4NM1dXP6raZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_06,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180090

DQoNCk9uIDE4LjEwLjIxIDE3OjE5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTguMTAuMjAy
MSAxNjowNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxOC4xMC4yMSAx
MzoyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTguMTAuMjAyMSAxMjoxMSwgQmVydHJh
bmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+IE9uIDE4IE9jdCAyMDIxLCBhdCAwODo0NywgSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDE1LjEwLjIwMjEgMTg6
NTEsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+Pj4+
ICsrKyBiL3hlbi9hcmNoL2FybS92cGNpLmMNCj4+Pj4+PiBAQCAtMCwwICsxLDc3IEBADQo+Pj4+
Pj4gKy8qDQo+Pj4+Pj4gKyAqIHhlbi9hcmNoL2FybS92cGNpLmMNCj4+Pj4+PiArICoNCj4+Pj4+
PiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRl
IGl0IGFuZC9vciBtb2RpZnkNCj4+Pj4+PiArICogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkNCj4+Pj4+PiArICogdGhl
IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5z
ZSwgb3INCj4+Pj4+PiArICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4NCj4+
Pj4+PiArICoNCj4+Pj4+PiArICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBo
b3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsDQo+Pj4+Pj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBX
QVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQo+Pj4+Pj4gKyAq
IE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNl
ZSB0aGUNCj4+Pj4+PiArICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0
YWlscy4NCj4+Pj4+PiArICovDQo+Pj4+Pj4gKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4NCj4+Pj4+
PiArI2luY2x1ZGUgPHhlbi92cGNpLmg+DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsjaW5jbHVkZSA8YXNt
L21taW8uaD4NCj4+Pj4+PiArDQo+Pj4+Pj4gK3N0YXRpYyBpbnQgdnBjaV9tbWlvX3JlYWQoc3Ry
dWN0IHZjcHUgKnYsIG1taW9faW5mb190ICppbmZvLA0KPj4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlZ2lzdGVyX3QgKnIsIHZvaWQgKnApDQo+Pj4+Pj4gK3sNCj4+Pj4+PiArICAg
IHBjaV9zYmRmX3Qgc2JkZjsNCj4+Pj4+PiArICAgIC8qIGRhdGEgaXMgbmVlZGVkIHRvIHByZXZl
bnQgYSBwb2ludGVyIGNhc3Qgb24gMzJiaXQgKi8NCj4+Pj4+PiArICAgIHVuc2lnbmVkIGxvbmcg
ZGF0YTsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICAvKiBXZSBpZ25vcmUgc2VnbWVudCBwYXJ0IGFu
ZCBhbHdheXMgaGFuZGxlIHNlZ21lbnQgMCAqLw0KPj4+Pj4+ICsgICAgc2JkZi5zYmRmID0gVlBD
SV9FQ0FNX0JERihpbmZvLT5ncGEpOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIGlmICggdnBjaV9l
Y2FtX3JlYWQoc2JkZiwgRUNBTV9SRUdfT0ZGU0VUKGluZm8tPmdwYSksDQo+Pj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgIDFVIDw8IGluZm8tPmRhYnQuc2l6ZSwgJmRhdGEpICkNCj4+Pj4+
PiArICAgIHsNCj4+Pj4+IEhlcmUgaXQgaXMgcXVpdGUgY2xlYXIgdGhhdCB0aGUgU0JERiB5b3Ug
cGFzcyBpbnRvIHZwY2lfZWNhbV9yZWFkKCkgaXMNCj4+Pj4+IHRoZSB2aXJ0dWFsIG9uZS4gVGhl
IGZ1bmN0aW9uIHRoZW4gY2FsbHMgdnBjaV9yZWFkKCksIHdoaWNoIGluIHR1cm4NCj4+Pj4+IHdp
bGwgY2FsbCB2cGNpX3JlYWRfaHcoKSBpbiBhIG51bWJlciBvZiBzaXR1YXRpb25zIChmaXJzdCBh
bmQgZm9yZW1vc3QNCj4+Pj4+IHdoZW5ldmVyIHBjaV9nZXRfcGRldl9ieV9kb21haW4oKSByZXR1
cm5zIE5VTEwpLiBUaGF0IGZ1bmN0aW9uIGFzIHdlbGwNCj4+Pj4+IGFzIHBjaV9nZXRfcGRldl9i
eV9kb21haW4oKSB1c2UgdGhlIHBhc3NlZCBpbiBTQkRGIGFzIGlmIGl0IHdhcyBhDQo+Pj4+PiBw
aHlzaWNhbCBvbmU7IEknbSB1bmFibGUgdG8gc3BvdCBhbnkgdHJhbnNsYXRpb24uIFlldCBJIGRv
IHJlY2FsbA0KPj4+Pj4gc2VlaW5nIGFzc2lnbm1lbnQgb2YgYSB2aXJ0dWFsIGRldmljZSBhbmQg
ZnVuY3Rpb24gbnVtYmVyIHNvbWV3aGVyZQ0KPj4+Pj4gKHBlcmhhcHMgYW5vdGhlciBvZiB0aGUg
cmVsYXRlZCBzZXJpZXMpLCBzbyB0aGUgbW9kZWwgYWxzbyBkb2Vzbid0DQo+Pj4+PiBsb29rIHRv
IGFzc3VtZSAxOjEgbWFwcGluZyBvZiBTQkRGLg0KPj4+PiBUaGlzIHF1ZXN0aW9uIHdhcyBhbnN3
ZXJlZCBieSBPbGVrc2FuZHIgSSB0aGluay4NCj4+PiBZZXM7IEkgY29udGludWUgdG8gYmUgc3Vy
ZSB0aG91Z2ggdGhhdCBJIHNhdyBkZXZmbiBhbGxvY2F0aW9uIGxvZ2ljIGluDQo+Pj4gb25lIG9m
IHRoZSBtYW55IHBhdGNoZXMgdGhhdCBhcmUgcmVsYXRlZCBoZXJlLiBBbmQgSSdtIHJlbGF0aXZl
bHkgc3VyZQ0KPj4+IHRoYXQgdGhlcmUgbm8gYWRqdXN0bWVudCB0byBsb2dpYyBoZXJlIHdhcyBt
YWRlIChidXQgc2luY2UgaXQncyBoYXJkDQo+Pj4gdG8gcGljayB0aGUgcmlnaHQgcGF0Y2ggb3V0
IG9mIHRoZSBodWdlIHBpbGUgd2l0aG91dCBrbm93aW5nIGl0cyB0aXRsZSwNCj4+PiBJIGNhbid0
IHJlYXNvbmFibHkgZ28gY2hlY2spLg0KPj4gT2ZmdG9wOiBJIHdhcyBzb21laG93IGRyb3BwZWQg
ZnJvbSB0aGUgQ2MuLg0KPj4NCj4+IFBsZWFzZSBzZWU6DQo+Pg0KPj4gW1BBVENIIHYzIDEwLzEx
XSB2cGNpOiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciB2aXJ0dWFsIFBDSSBidXMgdG9wb2xvZ3kN
Cj4+IFtQQVRDSCB2MyAxMS8xMV0geGVuL2FybTogVHJhbnNsYXRlIHZpcnR1YWwgUENJIGJ1cyB0
b3BvbG9neSBmb3IgZ3Vlc3RzDQo+Pg0KPj4gWzFdIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMv
X19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL2xpc3QvP3Nl
cmllcz01NTU0ODFfXzshIUdGXzI5ZGJjUUlVQlBBIW1NOEEzOXA4bms0VU1LM1llS01NVzl1YTlC
SGoxVU9XemFRY3l4N0c0NllQZHVkeE1wRDNodXFaZmloMFVjOFMtR3lXWERfbVBnJCBbcGF0Y2h3
b3JrWy5da2VybmVsWy5db3JnXQ0KPiBBaCB5ZXMsIHRoaXMgd2F5IEkgY2FuIGZpbmQgdGhlbSBp
biBteSBtYWlsYm94LiBBbmQgaW5kZWVkIC0gbm8gdHJhbnNsYXRpb24NCj4gZnJvbSB2aXJ0dWFs
IHRvIHBoeXNpY2FsIFNCREYgb24gdGhlIGNvbmZpZyBzcGFjZSByZWFkL3dyaXRlIHBhdGhzIGFm
YWljcy4NClRoZXJlIGFyZSB0cmFuc2xhdGlvbnMgZm9yIGJvdGggcmVhZCBhbmQgd3JpdGUgWzJd
IHN1Y2ggYXM6DQoNCivCoMKgwqAgLyoNCivCoMKgwqDCoCAqIEZvciB0aGUgcGFzc2VkIHRocm91
Z2ggZGV2aWNlcyB3ZSBuZWVkIHRvIG1hcCB0aGVpciB2aXJ0dWFsIFNCREYNCivCoMKgwqDCoCAq
IHRvIHRoZSBwaHlzaWNhbCBQQ0kgZGV2aWNlIGJlaW5nIHBhc3NlZCB0aHJvdWdoLg0KK8KgwqDC
oMKgICovDQorwqDCoMKgIGlmICggcHJpdi0+aXNfdmlydF9lY2FtICYmICFwY2lfdHJhbnNsYXRl
X3ZpcnR1YWxfZGV2aWNlKHYtPmRvbWFpbiwgJnNiZGYpICkNCivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAxOw0KKw0KPg0KPiBUaGFua3MgZm9yIHRoZSBwb2ludGVyLA0KPiBKYW4NCj4N
ClsyXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL3BhdGNo
LzIwMjEwOTMwMDc1MjIzLjg2MDMyOS0xMi1hbmRyMjAwMEBnbWFpbC5jb20v

