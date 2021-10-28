Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33E343DFEB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 13:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217896.378119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg3SH-0001p5-Qb; Thu, 28 Oct 2021 11:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217896.378119; Thu, 28 Oct 2021 11:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg3SH-0001n0-NO; Thu, 28 Oct 2021 11:20:21 +0000
Received: by outflank-mailman (input) for mailman id 217896;
 Thu, 28 Oct 2021 11:20:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikAZ=PQ=epam.com=prvs=19352d112c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mg3SG-0001mu-Jt
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 11:20:20 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8d8d4f4-763f-4152-b2a2-ca5adf082d76;
 Thu, 28 Oct 2021 11:20:19 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SAYXGa002914; 
 Thu, 28 Oct 2021 11:20:17 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55])
 by mx0a-0039f301.pphosted.com with ESMTP id 3byt7sr727-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 11:20:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2832.eurprd03.prod.outlook.com (2603:10a6:800:e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Thu, 28 Oct
 2021 11:20:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 11:20:12 +0000
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
X-Inumbo-ID: a8d8d4f4-763f-4152-b2a2-ca5adf082d76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQuHIGaQNpjy00wXfhNN6xs1gyzy843nqCDIXJ316CfMWhpSETD8LLyg62OqyoilWq7nWpYl+T3WgXXJfqeM8vFHUfWrTFQIabx+LNIsUNm/LpKaQvycupQHEdR4UhXy6FjwD73wd9K44yCZUY7Y5KrTccqnj7Ta3l34ExMGVCbxiYQTE5CXEzbPQQvQg/QwJGGQ/6fcgkVrd/QBTtxvYPF0maRlPkWAr0aYaRGmDA+dgumjakR5bPSoR+Zji/azK2BvXer1MRp5io5RAOOj2BKPLUdCdCg1AFnVrPNjsuFDtM3KPIycdKPTFkZ8S3LifJoAbVi4i6JIlHrzhuSwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvaVs5i9m5HWWKBsK0G/8yaxV4x2SjMqbjVognfvLWg=;
 b=dIc05so42s4AH3qu06VEmZH/WL3KLt185u3uLS/Pt9aRt5m9MzhHQQPbC14bCVMjjJuB3wRD/P95tEKNrUaozl1x9RkZSJYcK8emqUeid46uJTmo4sH45xXhOC6i7ZRNgLHzv3DIgkKs9CeJfc1sw8m1l5hj68MmG2o8ep6PFbZjvNcOir9d6mXYs4fctNnsxlSE1mvxy7Ej8t1rwyED5jUn8xZdxgvv/Ly7jM3Vq7aKCIYtZT063xtPjtQC9MyABBhIlPtOj6mnZ7gbVnwzx6kwD812ADnp9PzZQ+jKzpyNgsYMHdLM1nk092+qB76aBNO6aytcOVbgipnl5fw00A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvaVs5i9m5HWWKBsK0G/8yaxV4x2SjMqbjVognfvLWg=;
 b=SvM9WXjSuT23JHjO4eWO87wu6bGxWYrKXDjW1JOj4rzh27v2qZkN3wzYZfBfO9WvATlyMo54W50q64luLypKEHqr/o6Kr2rbn9k1YWQ/ahxKkAmumZskn5wEDJed4JIZ/CCy34KSVlJJMg0ChmAQN+Bdv6W5wqAf6WQ0W/f5QUYz7SfCiv/KO4CMj5xfAqUmiHy4mT/++lcfR4j0Rs+mqs1fKpf7rIYqHaPF3gWAd4J0CCWkvg4e7ajnItqSRzH7H+3QdJzs0IuFtr3HYbW+/E7G+NAB6kESnx19vJjUSCE09DtapJNuaKB5tHv9Me17QL4je+FFLhEslvTgtNTm7g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH v5 09/10] xen/arm: Do not map PCI ECAM and MMIO space to
 Domain-0's p2m
Thread-Topic: [PATCH v5 09/10] xen/arm: Do not map PCI ECAM and MMIO space to
 Domain-0's p2m
Thread-Index: AQHXvAkp3d9SZd4Ne0C6z52O+cvuD6vRI24AgBKN8ACABLBegIAAAbyA
Date: Thu, 28 Oct 2021 11:20:12 +0000
Message-ID: <7d4f4496-1b8f-75aa-1f9f-004de31ef454@epam.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-10-andr2000@gmail.com>
 <f5767857-a80a-fcc2-e70e-ce59ce19c8c9@xen.org>
 <121f1c81-4385-ae12-fefc-dfa638bf1f81@epam.com>
 <4e862e54-9cbb-ae91-6284-cfcb684dcf09@xen.org>
In-Reply-To: <4e862e54-9cbb-ae91-6284-cfcb684dcf09@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a14b01c-5b50-40e4-d748-08d99a04e894
x-ms-traffictypediagnostic: VI1PR0302MB2832:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2832A21FB355C8C838987374E7869@VI1PR0302MB2832.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +CYZtIZVgXxhNVnX3jGPrhx7QwXU5FF88xjOZsyEWSkL9FdmkcZ4synxX92LSsZTwTkzAmqiJscnIzstL1C/kV54i4H08aKKsTl3MDDzjNu9EjDVuXZyHfP4OZHyY5stTnsPy7TlCDZ94dA4oKEMuabBKotUzWybo/bSzwVQtWMlrcGxtvybVCMWoSUB+CgqUjjC42r5NC6McwAlsURPpnsgYkPIxPupanfK/ORCv4mlSfJqw2I4xVG+QdB/mh922krHXjCocv57JpAz9wFeFWUXun8yFFM+jpPT7uxrOTkcZhVFcGY+bPclgcrYsDJoQhXHUXZtYLTWel6VKDaaa8NpASZNizWzSGr1HTklm7dbxxyfsFlZ/Stz9OFaw6CyXV/QiaEpNJoDQswFUKirSxiXt0BfNjRmAG4FNRxNKJ/U3yR7KP5fqk0MFCU55gQaef2B3N2gQVUukvdFMPKQzVlVNOQNCX9YD2fKTK7dCXdcWugMddBr3SXO+TMXuS1qqfB8i8xdikdUCypfVkEKynPr/c0D99FSi0W2XwAH0FntpgS6YGhmav/Ua27lAr1Ma7Uco64hHuwyKSA4FGJd3P9/ItfC1ma5B+KGfFHxwnwsp6l9owcBQFVUF3j7zamgEvSfF1bpreqaH5Fx7izKUZUZXf6mbMEZuqk4kQ7G61LfEOYmSKW0VtxeKyzZkDs5sl4xGBxglixEiWRgUCeeknukWLpWWgFaIjnt8vLCIUxhAFo5k1cV10t9YNJVMslP
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(6486002)(31686004)(38070700005)(71200400001)(55236004)(66556008)(2616005)(36756003)(66476007)(110136005)(38100700002)(6506007)(76116006)(2906002)(316002)(6512007)(64756008)(54906003)(122000001)(186003)(91956017)(66446008)(8936002)(26005)(53546011)(8676002)(66946007)(4326008)(5660300002)(31696002)(508600001)(83380400001)(7416002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Mlh2OTlhYjQrYnZteE9kWFY4eFlKOW9MUnZudUttb3AyYm9GVmtSQUN5a2RT?=
 =?utf-8?B?NDdtc1JpTTNVQ2MxaXcrSzF4dmoxRVpsREZNQXRpZG5NdW5reDdVSkY4clR5?=
 =?utf-8?B?ZXR5ZWxPUFpOYkxJbmhqcjhMYWs2dUNRL3M4UkxFMnE1cDZQUVdRSzBiS2JQ?=
 =?utf-8?B?cllGM29STHZmVGxVQlZnUWNZQlhrTXVRRHB5V2VXNTZwb1ZiMHg5R2xhRjVx?=
 =?utf-8?B?VEVYTnZodkNwSUNMNTJvek5kb09sWlpzRm92aHhvSTZNTHVPdzdIcm5VZXRO?=
 =?utf-8?B?UDY0Z3I4Z0MwcDRieWVkcjBxanJWTjFLT0VRMUJ5VEdvUE5xV3RTVDdwMndG?=
 =?utf-8?B?dkRiOWl0MG03UUNKNi9rK2VPdUhQR2VLQzJpM1R0NzdCeFFYOWxndmN1TTVP?=
 =?utf-8?B?VjhxcnZnNVhYYjRPRVZ1OVk3ZmV6aXBzRkplTEtsYTFPdytUUWh3NzIveGRN?=
 =?utf-8?B?ZmpENUFsQmxwajNLaWVSSEVkUkJsZ1lNNjRyNUtUWk01dmJpUjlVcTRRaitD?=
 =?utf-8?B?ZnJiaWFtajJkZ09nTUxOQWUyaUNOT0VuM2FRbVhMMmFWL2tya0xiaWxpa2VP?=
 =?utf-8?B?R0FDbHJZVVFtNEJxeTg1b1ZVb1ovaHEwUDh1VU9uVm1yLzIrK2QwWFBKSnpn?=
 =?utf-8?B?dGMvZzk2TXQ3aHFKQU9VdW9KZ1hQRUpFSDNHUEQ3dGV4ekFEeU9CN1l2dmdl?=
 =?utf-8?B?OFViby9hTC9zeENLVVBLaXgraFo4NEZqR253TzN6aTdjNWw2VkVqeWU1cTdu?=
 =?utf-8?B?V2lWZ3k2VFJseFY2dnc1QVVTSi9KOVBqeFZuNW9PRnJYSWpGWW5PajBpUERl?=
 =?utf-8?B?bzhuTXUyNXpsKzg3OGVOcysrN3VJNkdwMHFLaTRkdTIvUWY2U3RKZFovTlZ2?=
 =?utf-8?B?aURZTTNDUGdCeFJEOXdXajdSRnBPQUZENWdjamFQc3hUMlh0VysrUGlSM0NL?=
 =?utf-8?B?cVpZNDlnVENibGhNamxhVDlCWWgvUTIvSDk4U0xjdjRScGdWdHBqN2kzM1VX?=
 =?utf-8?B?VGxIOVpTRmlVSDNtTy9DU3JMMVZYSmlJNm5aUjMvZjVLMm11cTdOMy83a2Mw?=
 =?utf-8?B?NmRSSVpRZTczOEhHeVpTaS9pOHBMc1g3MUlYS0lobjdTTndHeVRvTVpXU2FJ?=
 =?utf-8?B?L1VTZ3VGaERTdUlTVXNTNERhYWMzN29OemloTmFRVlFRWVRWcEhIZ29qR00y?=
 =?utf-8?B?OGZYbUtXV25BK3Z4b0l4VGFoUFg2SVQ2Snl1S3NtbUJsaFc3TUYveGl0K09H?=
 =?utf-8?B?dEJCYTlldDZVTFJNK0JzQ2FjQUlTNEdPbkFiTGZ0S0hmcnVGR1JLc0pNZmh2?=
 =?utf-8?B?WkdsYWlRdmJwL3locDNaZTU0QzZBRlJ3RzNGTytSWkZSdnN1KzhWUEFXZmMv?=
 =?utf-8?B?MlNiK1V3b3kxZWF0WkpFZG5uYjJhOE5hOUZhWHpxVEsrT3NxZkxkaW9Fa1FS?=
 =?utf-8?B?QU5vYzN1RG9nWlM5UFo2aGV6ZytwZit4bW5mWmwvajRwSnZHZ3ZuZC9VVVcr?=
 =?utf-8?B?UW55MlV3bzdNcXZYL2JuRlhmbmFSYk1NamxpdEVSYW1ZNlU2Wi9zYmFQTjl6?=
 =?utf-8?B?UENWbVVUYnZkWlVVUnZQdm5OTlM4ZGJvQk94RitPQm9tU05QKzd2eVF0a24x?=
 =?utf-8?B?bXlDS21ET0FqTHhQbktQRGZpVTJqVktXUjRSTlJhcjFHYmVkb2lEajFuUFJG?=
 =?utf-8?B?eURVMVFWK1ZFaUdUWHY0NDZPa0lkSHRDZmxpbW5GaDFYUk8zUkxacm1hNEhK?=
 =?utf-8?B?cHJTZU1GNnRhQzRZMUhtNkJUK0MxUGcyQThYbllHRUZYUktRZDZzbmt6Umdw?=
 =?utf-8?B?OUdaUjJKWU5MUDR6anhhZ0xaVXRSd0Nkb3hsSHV5YkVZNTlJUzRncmR2SVQ1?=
 =?utf-8?B?TGx4dFJ6SkpmRDdtS3plSGk0cUlZUGNIaWZXWE5EVklUSUlEUkJVSWNHek14?=
 =?utf-8?B?V3VBTFhzeHcyUEwrL1k3eDZ5QkgzMS82d29JeEdmTDhkZGtwRzlDc3VRNzlJ?=
 =?utf-8?B?SlhlUDd3Y21mejNZaEtiRDNIV2htcVAvVFd1Si9kcm9iZGtTb1lJVFkyT2Qy?=
 =?utf-8?B?aDU0YmlRZDJybklITm1SeWMrVkNCWE1vcHR0MlJZdlNUUEI4cU5Vb29HRFBS?=
 =?utf-8?B?bUJsU2hNSndrSmdFc3F4VzJpQ0JtemJuNzdlb2RRVjFWRWVJWjJRcG02NnRi?=
 =?utf-8?B?aFM0NGcwOFYwNnhsQ3pZL3lUZHFyNldTQ1k2V0JoNTkyM1czUnpMN0p1Z2or?=
 =?utf-8?B?bXRpdjV3S01Ec2VtR3o1RWJidENEVk9nYitEZHU4SWRUTTdqeGVIUWR0OUJh?=
 =?utf-8?B?THVuQ2VIWFhBNGZOQjl5OThFZDJOQXR3VXRGZ1htUlROTlhta0ZUUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE88065D10BA5D4AA76D94359E541E6E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a14b01c-5b50-40e4-d748-08d99a04e894
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 11:20:12.0737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xDvysfeS0xrt+jtcBqKluwHLNN9LpME8oz/NAxGHOPogOKUrWwu2KqnfgM5dkxO5jgV6lnjeTti390Nk2Ynwv+5a8S9R9+Kgnc+ggnXBR6ZQZXLCTIVE+Kb+2joWssGa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2832
X-Proofpoint-GUID: nvw2yOzyhpDvxfu15v4fqzJSJZyC8sup
X-Proofpoint-ORIG-GUID: nvw2yOzyhpDvxfu15v4fqzJSJZyC8sup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280062

SGksIEp1bGllbiENCg0KT24gMjguMTAuMjEgMTQ6MTMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4N
Cj4NCj4gT24gMjUvMTAvMjAyMSAxMjozNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6
DQo+PiBIaSwgSnVsaWVuIQ0KPg0KPiBIaSBPbGVrc2FuZHIsDQo+DQo+PiBPbiAxMy4xMC4yMSAx
OToxNywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IE9uIDA4LzEwLzIwMjEgMDY6NTUsIE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiArwqDCoMKgIH07DQo+Pj4+IMKgwqAgwqDC
oMKgwqDCoCBuYWRkciA9IGR0X251bWJlcl9vZl9hZGRyZXNzKGRldik7DQo+Pj4+IMKgwqAgQEAg
LTE4ODQsNyArMTg4OSw2IEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9kZXZpY2Uoc3RydWN0
IGRvbWFpbiAqZCwgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYsDQo+Pj4+IMKgwqDCoMKgwqDC
oCAvKiBHaXZlIHBlcm1pc3Npb24gYW5kIG1hcCBNTUlPcyAqLw0KPj4+PiDCoMKgwqDCoMKgwqAg
Zm9yICggaSA9IDA7IGkgPCBuYWRkcjsgaSsrICkNCj4+Pj4gwqDCoMKgwqDCoMKgIHsNCj4+Pj4g
LcKgwqDCoMKgwqDCoMKgIHN0cnVjdCBtYXBfcmFuZ2VfZGF0YSBtcl9kYXRhID0geyAuZCA9IGQs
IC5wMm10ID0gcDJtdCB9Ow0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMgPSBkdF9kZXZp
Y2VfZ2V0X2FkZHJlc3MoZGV2LCBpLCAmYWRkciwgJnNpemUpOw0KPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoIHJlcyApDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsNCj4+Pj4gQEAg
LTE4OTgsNyArMTkwMiw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9kZXZpY2Uoc3RydWN0
IGRvbWFpbiAqZCwgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYsDQo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJlczsNCj4+Pj4gwqDCoMKgwqDCoMKgIH0NCj4+Pj4g
wqDCoCAtwqDCoMKgIHJlcyA9IG1hcF9kZXZpY2VfY2hpbGRyZW4oZCwgZGV2LCBwMm10KTsNCj4+
Pj4gK8KgwqDCoCByZXMgPSBtYXBfZGV2aWNlX2NoaWxkcmVuKGRldiwgJm1yX2RhdGEpOw0KPj4+
PiDCoMKgwqDCoMKgwqAgaWYgKCByZXMgKQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gcmVzOw0KPj4+PiDCoMKgIEBAIC0zMDU2LDcgKzMwNjAsMTQgQEAgc3RhdGljIGludCBfX2lu
aXQgY29uc3RydWN0X2RvbTAoc3RydWN0IGRvbWFpbiAqZCkNCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIHJjOw0KPj4+PiDCoMKgIMKgwqDCoMKgwqAgaWYgKCBhY3BpX2Rpc2FibGVk
ICkNCj4+Pj4gK8KgwqDCoCB7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJjID0gcHJlcGFy
ZV9kdGJfaHdkb20oZCwgJmtpbmZvKTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICggcmMgPCAw
ICkNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJjOw0KPj4+PiArI2lmZGVm
IENPTkZJR19IQVNfUENJDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByYyA9IHBjaV9ob3N0X2JyaWRn
ZV9tYXBwaW5ncyhkLCBwMm1fbW1pb19kaXJlY3RfYyk7DQo+Pj4NCj4+PiBJdCBpcyBub3QgY2xl
YXIgdG8gbWUgd2h5IHlvdSBhcmUgcGFzc2luZyBwMm1fbW1pb19kaXJlY3RfYyBhbmQgbm90IHAy
bXQgaGVyZT8NCj4+IFRoZXJlIGlzIG5vIHAybXQgaW4gdGhlIGNhbGxlciBmdW5jdGlvbiwgZS5n
LiBjb25zdHJ1Y3RfZG9tMA0KPj4+IElmIHlvdSByZWFsbHkgd2FudCB0byBmb3JjZSBhIHR5cGUs
IHRoZW4gSSB0aGluayBpdCBzaG91bGQgYmUgcDJtX21taW9fZGlyZWN0Lg0KPj4gSSBqdXN0IGZv
bGxvd2VkIHRoZSBkZWZhdWx0cyBmb3VuZCBpbjoNCj4+IHN0YXRpYyBpbnQgX19pbml0IHByZXBh
cmVfZHRiX2h3ZG9tKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8p
DQo+PiB7DQo+PiDCoCDCoMKgwqAgY29uc3QgcDJtX3R5cGVfdCBkZWZhdWx0X3AybXQgPSBwMm1f
bW1pb19kaXJlY3RfYzsNCj4+IHdoaWNoIGlzIGFsc28gY2FsbGVkIGZyb20gY29uc3RydWN0X2Rv
bTANCj4NCj4gV2UgdXNlICJwMm1fbW1pb19kaXJlY3RfYyIgKGNhY2hlYWJsZSBtYXBwaW5nKSBi
eSBkZWZhdWx0IGJlY2F1c2Ugd2UgZG9uJ3Qga25vdyB3aGF0IGhvdyB0aGUgcmVnaW9uIHdpbGwg
YmUgYWNjZXNzZWTCoCAoZS5nLiB0aGlzIG1heSBiZSBhbiBTUkFNKS4gV2l0aCB0aGlzIHR5cGUs
IHRoZXJlIGlzIG5vIHJlc3RyaWN0aW9uIGFuZCBkb20wIGlzIHJlc3BvbnNpYmxlIHRvIHNldCB0
byBwcm9wZXIgYXR0cmlidXRlIGluIHRoZSBzdGFnZS0xIHBhZ2UtdGFibGVzLg0KPg0KPiBJbiB0
aGlzIGhvc3RicmlkZ2UgY2FzZXMsIEkgc2VlIGxpbWl0ZWQgcmVhc29ucyBhdCB0aGUgbW9tZW50
IGZvciBzb21lb25lIHRvIG1hcCB0aGUgbm9uLUJBUiByZWdpb25zIHdpdGggY2FjaGVhYmxlIGF0
dHJpYnV0ZXMuIFNvIEkgdGhpbmsgaXQgaXMgYmV0dGVyIHRvIGNob3NlIHRoZSBtb3N0IHJlc3Ry
aWN0aW5nIGF0dHJpYnV0ZSBpbiB0aGUgc3RhZ2UtMiBwYWdlLXRhYmxlLg0KPg0KPj4+DQo+Pj4g
QnV0IHRoZW4gd2h5IGlzIGl0IGEgcGFyYW1ldGVyIG9mIHBjaV9ob3N0X2JyaWRnZV9tYXBwaW5n
cz8gRG8geW91IGV4cGVjdCBzb21lb25lIGVsc2UgdG8gbW9kaWZ5IGl0Pw0KPj4gTm8sIEkgZG9u
J3QgZXhwZWN0IHRvIG1vZGlmeSB0aGF0LCBJIGp1c3QgZG9uJ3Qgd2FudCBQQ0kgY29kZSB0byBt
YWtlIGRlY2lzaW9ucyBvbiB0aGF0Lg0KPj4gU28sIEkgZmVlbCBtb3JlIGNvbWZvcnRhYmxlIGlm
IHRoYXQgZGVjaXNpb24gaXMgdGFrZW4gaW4gY29uc3RydWN0X2RvbTAuDQo+IE9ubHkgdGhlIGhv
c3RicmlkZ2UgZHJpdmVyIGlzIHJlYWxseSBhd2FyZSBvZiBob3cgdGhlIHJlZ2lvbiB3aWxsIGJl
IGFjY2Vzc2VkLiBTbyBJIHRoaW5rIGl0IGlzIGJldHRlciB0byBsZXQuLi4NCj4NCj4+DQo+PiBT
bywgd2hhdCBkbyB3ZSB3YW50IGhlcmU/IFBhc3MgYXMgcGFyYW1ldGVyICh0aGVuIHAybV9tbWlv
X2RpcmVjdCBJIGd1ZXNzLCBub3QgcDJtX21taW9fZGlyZWN0X2MpPw0KPj4gT3IgbGV0IFBDSSBj
b2RlIHVzZSBwMm1fbW1pb19kaXJlY3QgaW5zaWRlIHBjaV9ob3N0X2JyaWRnZV9tYXBwaW5ncz8N
Cj4NCj4gLi4uIHBjaV9ob3N0X2JyaWRnZV9tYXBwaW5ncygpIGRlY2lkZSB0aGUgYXR0cmlidXRl
LiBUaGlzIGNhbiBwb3RlbnRpYWxseSBhbGxvdyB1cyB0byBoYXZlIGEgcGVyLWhvc3RicmlkZ2Ug
dHlwZSBpZiBuZWVkZWQgaW4gdGhlIGZ1dHVyZS4NCkl0IGlzIGFsbCBjbGVhciBub3csIHRoYW5r
IHlvdSENCj4NCj4gWy4uLl0NCj4NCj4+Pg0KPj4+IFRoaXMgaXMgYWxzbyBleHBvcnRlZCBidXQg
bm90IHVzZWQuIEkgd291bGQgcHJlZmVyIGlmIHdlIG9ubHkgZXhwb3NlZCB3aGVuIHRoZSBmaXJz
dCBleHRlcm5hbCB1c2VyIHdpbGwgYmUgaW50cm9kdWNlZC4NCj4+IFp5bnFNUCBpcyB0aGUgZmly
c3QgdXNlciB5ZXQgaW4gdGhpcyBwYXRjaC4gTW9yZSB0byBjb21lIHByb2JhYmx5IGxhdGVyIG9u
IHdoZW4gd2UgYWRkIG90aGVyIGhvc3QgYnJpZGdlcy4NCj4NCj4gQWgsIHNvcnJ5IEkgZGlkbid0
IHNwb3QgdGhlIHVzZS4NCj4NCj4gQ2hlZXJzLA0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

