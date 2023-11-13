Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4807E9CAD
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 14:01:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631577.985041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WYd-0001HG-LL; Mon, 13 Nov 2023 13:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631577.985041; Mon, 13 Nov 2023 13:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WYd-0001FH-IZ; Mon, 13 Nov 2023 13:00:51 +0000
Received: by outflank-mailman (input) for mailman id 631577;
 Mon, 13 Nov 2023 13:00:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTXO=G2=epam.com=prvs=56810bf7ac=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r2WYb-0001FA-TN
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 13:00:50 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a984ece0-8224-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 14:00:48 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ADASfpn001334; Mon, 13 Nov 2023 13:00:36 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ubg6x902t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Nov 2023 13:00:35 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB9174.eurprd03.prod.outlook.com (2603:10a6:10:47a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21; Mon, 13 Nov
 2023 13:00:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%5]) with mapi id 15.20.6977.028; Mon, 13 Nov 2023
 13:00:32 +0000
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
X-Inumbo-ID: a984ece0-8224-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqZPa8dIR1ubxN2QlRGCfOcWSStixVusJqTADZRHSLo94lxtQ/xxtIaQds+B964DOaOwPTv15+HuHliPui/61OxgrNsLWc9RfC7HSEU02+V4U9EvnyEVvgGC7rtlc/xDq4EwNCfa01IUg6y/721z3yzEsFh85BH5erlRpLtUIPVTZ1uxDz36O8cTe3Z0AwxjwSYa9CBbphObBm95UC+iYrXwZGU045OoAo0YNuV5O4CfulmpgmTYqGCkPfj+r8ceEHivigKxjPnA415LbG1iCU263zj2fjZnhenR+l7xjbP589b5z2z4nUO1iEvHsVCW+5Al54qiadh/ITvqLKpoww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQzdyFmHSxrCbdjsBwVJqlOeGwPxXs4lNxMNphdlySQ=;
 b=Yn7V2kc7G2bTZhBJyJFh7ys8Q4TpiOhVgGMlOjmQWkYgl/Tb4lAlQzGL9MNYRFHjFs3beNgyii1PWmb9B6AK51J9RrQ083ZTfKtgfn9EwXoNjwG2hYb75rRwtDc1Azwp0mlfQJgqrCqMzLaY+bAB/YQsAmfzpXzfSwI+X8IldVkgn/t0RptDWfoinZ3cqwneRrrOtyHWHARW/8RxPf5AJBUHSPP02RZzNqZ1qRaBtRfmvhos2tWHcy/SiAwvWbObfCESeYl+0Jzykb2869yxZX5NsGPEO+y5Wyy9ALAUfTUsD2KW3a8gpVlMD1y6wq7sDbp2/VswkZGo1XQ16Dnoww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQzdyFmHSxrCbdjsBwVJqlOeGwPxXs4lNxMNphdlySQ=;
 b=mHC2FWj3nc2Mc1LmTxEFAE8dGt2WkoOIEXPK01F6mliN9SSGyzXJBHgM+LIVKOvG7Eb2vZMx663A/urisugVxlK5frdC/K6rrAHQ5SPn+Coktuvlnh2e3BautIfni3FvCiVCWrjsixhmzfA4bfYIdP6uezEZI9xgpoD3Iut/HNedAGlkRFCjuIBMbecl/MHrgjV2FmtusdCEbjYZpn7gwJ37B1K0R7aq3mGlkwAShkdvV1TiW3YqKtUAfnMfR1kJ4VEUKaIKccv4oUkeCrtjvKrWxUEJr4eOlA88lrNEdIfXqSzj1NtiOXrlPNowTQBRFD7gtz34dhaIbMeCqfXb0w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Paul Durrant
	<paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
        Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard
 Henderson <richard.henderson@linaro.org>,
        Eduardo Habkost
	<eduardo@habkost.net>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony
 Perard <anthony.perard@citrix.com>,
        "open  list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 3/7] xen: xenstore: add possibility to preserve owner
Thread-Topic: [PATCH v1 3/7] xen: xenstore: add possibility to preserve owner
Thread-Index: AQHaFBZoS99E/RofVU6d/7dbafCRirB09L6AgANCSwA=
Date: Mon, 13 Nov 2023 13:00:32 +0000
Message-ID: <87il657qq8.fsf@epam.com>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
 <20231110204207.2927514-4-volodymyr_babchuk@epam.com>
 <4481f0fe9eb282333fd967b7ece590ead78ccdba.camel@infradead.org>
In-Reply-To: <4481f0fe9eb282333fd967b7ece590ead78ccdba.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB9174:EE_
x-ms-office365-filtering-correlation-id: bc5eef80-e71e-4afc-e59e-08dbe44884fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jYoVyYcWJ7fLEholzMieuesDFmH8yFs5FuGVnR+I/xO2rzNM7Q/zdJccJZzHiQrAvFHhL5qmsvSYvU8I10vZnEKs1UkzI8MfV3aHqrNWU7K2OwROqfR2VF4OkJrSW2wZv8IbkJmgi/SyG4pl+g/GDvKvPQAMjY1XoAgLYGQNPYZTRXT+PfY2nONWXe13UNUM1W5YYzwsAFo6IBJUfazmZ0asE64juzkWqwGktTZfMNB9r0eN9odsnLhYKOrsGrOWV4S8R3ID7PWeIfokow02+B48xZuhh+Q41Juh8X7AIKCvj6H+87oHb/09Fj5FsBr+TyNyiVaZF2GtEYAXVbG8VE4s/1VrC9RrYa02GG/u2kNrOVjLZlxEpCfK9ux5qgl4zIycxoFxD+IioeRGhk3azAGrpvjRCrb2AWXR/mkHpHp+rqJgIyYK5P8BbeZoqtbiZpHzDDBJ2GCqp+QBDYl9ttlxLSQ1fbGFENsd916FYmYbXTMW2rEsI0KGKMkEi0NArf9eTz4s2M5DiLi09oLShbG6bEmT6OH1rJeQACz8DrhDbH++8n4fzjJZ+YGyozRCAUbCDFOL1EOddBpkGcWxt+RKTM0atq3XhMW06qwW5ssWz15LndGpSvgaj5YppxeZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(83380400001)(2906002)(71200400001)(122000001)(4001150100001)(66899024)(38070700009)(478600001)(38100700002)(86362001)(41300700001)(316002)(64756008)(6916009)(54906003)(91956017)(66446008)(6486002)(66476007)(66946007)(66556008)(76116006)(36756003)(8936002)(8676002)(4326008)(5660300002)(6506007)(7416002)(55236004)(2616005)(6512007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SzMwSEM4MktuQkJPZFRhakRSeGo0aW50ODlBWjdtY2dJNG9Wa2JFRmJGZnFY?=
 =?utf-8?B?N1FVZ3N0K0dJOTR1eDRmTFdnZUJac0YyN0FWRDEzWGZGZFhralpxVkJhbEp1?=
 =?utf-8?B?NnoxYjlKTmp0U3ZRM2x2NHUvUys3OTBVOTNNL3dYQ0pEdStLTlBabE9kM1Jm?=
 =?utf-8?B?RFdTbEVKQXpaLzNlcjhHdU0zdVFScGkxZWF6VmlmTERRMm5xTmlSUWMvd2dI?=
 =?utf-8?B?TGJzS3pITkhCVkhjL1BRNmZiVHc0NEt1R2VuWFBIVnZScm01Z1dZZlBPc09h?=
 =?utf-8?B?QmN4a0N4VTJOclRDdHhyRml5VlNEM04ybnNTcTVTY2JzbTVHNTJ4M1FvRXJ0?=
 =?utf-8?B?RmkvMmhxQ0wzMGNTUk4vd1lxSy9LMUlvSUE0OUFjdXBLSklvbXpWQ2FoL2hL?=
 =?utf-8?B?RzU4NGZxdGk1MzF6RVQ1eDhIbU0reXVvVFp5cUl4Qk1ET2N1clpuelBzYjRv?=
 =?utf-8?B?ZEh3UzNRdjVFd3Q3MUpvVDI0Q0hEdHF5eXJQcW83ejdvSVdQZW5jbkZPTGlY?=
 =?utf-8?B?bFp1L3A0NnBEM1E3L29UWHNrRHUvank1YXFMM0xIbC9hcFhmcUlWOXozWnY4?=
 =?utf-8?B?SGlVSytRRE9raWtIQmxuditnNEdlZko2NndQSHFjQmpYZ3lCaWJ6WXZCbkVJ?=
 =?utf-8?B?cUhHS3pZeldJcVZ3T0NEWUdUdHg3R2tuZFhzZ0ROcnRqUTZIcGlQLytMMjFY?=
 =?utf-8?B?RWZISWxGbGRvckRHUy9UaXNoOHhjeTk1bFVFeC9zdUYrdDNBcnR0MmU2U3pa?=
 =?utf-8?B?a1Myd0gyYXRmQWQ3YzhMS01oVGdtRCtJUStTSTNORk5OSzFJSjJTUFd2bGRV?=
 =?utf-8?B?Y3JVM1JYVmpZUU1hOWpPdGQzdHR3clJ6aWp1L3pLSzdQczM4cFlmWnVTck9C?=
 =?utf-8?B?Y0pQUVpDWUpDOUN5Q2h6ZEF5a2E3eU5yM0M1T0JFbEN4am1Wd2YvbUFMQmFP?=
 =?utf-8?B?Y2NqZHM2a1BNYThva1NHNjhraTVVcy9SbFZweDU3VE9NZm9GZDlmcmNwWCtE?=
 =?utf-8?B?YXV5SmpScVp2UFNsNmxHY0Q3S2xtL01LamlnbVpHemgyRzY2eXVoV1U1ZVlK?=
 =?utf-8?B?MlhkUWVjdWIrSlFkQXQ5OW1mTVdLQTg0VnR4cUVNWHZ0elVqY09Edll6bjNM?=
 =?utf-8?B?VXVNRmpYOFJmSnlHekdDTUhBc28zeVBDU1JmeUdRM2d1TW92TnpEVTk0NEcz?=
 =?utf-8?B?akNnakhEM0ZJZk5NUzQzeTNybGFNNEwyYk9icXR1K1ZzTVhkL0pBSXRKKzVT?=
 =?utf-8?B?b0xYeGNmYi9GZitrb0FCUHlsRFlZYzZLNE52bUUzQ3MrVHQxc3NXWTh4ZjBK?=
 =?utf-8?B?bWNmWDduVkZKQTJGUSt6Q2pjZkY3K2dzWkF5WU1CY2RpbEtaeG1RRFZuZ1pJ?=
 =?utf-8?B?UUxVQzJsUHhOajZwRjNhbFJONXFKTE1KYTZhZVZ6eURZVDVraFRmR3lNZDRw?=
 =?utf-8?B?dGN1b0VtOC9iajZQYlVzL1ZlMk55RGZwbXVBMXBtNFBXSWZWdzVKbXFKTjcx?=
 =?utf-8?B?ejFBOFpnZ3Z3RENpQlNrRHh2TEZJZlp5dFdtZHdnM0EydjNPUzJ2Ty9XaDhz?=
 =?utf-8?B?WTMzaW43d2NWTCtWMm1PbXB6bGtXTUovcVhlZzIvSk43bU1vRGoxWGczWU96?=
 =?utf-8?B?U1V0WDdESFM2cFRZZ3NZN2lhTkJFMTAwalZtekE5MGE1ZHM2NUJUbDRQYitw?=
 =?utf-8?B?ZFJrRHUvRjh2TGtEZFdnNTIzSmV6TFVScWN6am10VkN5bUlUOVVpeFhoMkUy?=
 =?utf-8?B?VjZIc01IZWVzcVlFY2IrZ0NhUHZMdFpPRzFCR2lQMk5DaEs1N1dNcVZBeE92?=
 =?utf-8?B?WW5KRCszL0VmeXBKam1LVGNBK0ZaMWpXOU1EZGt6V0ZmS1NyeC9BMHVHeU1h?=
 =?utf-8?B?R0VJZ1F4K05POVE4VklMQ1NQb0lCcnR3b0huUHZxTTZxdVpFVmo0NE5zbWlq?=
 =?utf-8?B?TjRSemJFMWFMTFhYdWpoNWEwL05XVHo2Q3h4ZCtNRVlhZmJ3SmdDblZLWUdp?=
 =?utf-8?B?SEdqMy8yQnFNOXRYR0pKOURwUFlPekJPQko0eHgvUGtyS0VIbXBoUnNiazRz?=
 =?utf-8?B?dCtscExjN1VoK3VvSFM2SGlXNjZTTXRQVnk2Z0toYlJxUVdSTUFYVXVreEdN?=
 =?utf-8?B?WkpNeWRCOVhnYXUvaXpvaG5JbHNGSlBackw4MWRaQk12UXFwWGNra1lHYkJp?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE7C76E3A8155D4B9E692B69F4C30D71@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5eef80-e71e-4afc-e59e-08dbe44884fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 13:00:32.2902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UqKK+1GnCus81WE08TX7mfkqAG9fmBdEpFyQKb7n89smqHcGFDVsCp+flmuEudWnZsL03Le5FBKrYw7UttW/fPb/x7kAn29fSve6Skn8tvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9174
X-Proofpoint-GUID: PsOBja4TMjeViiLWGXF5AACpVC7SPyoH
X-Proofpoint-ORIG-GUID: PsOBja4TMjeViiLWGXF5AACpVC7SPyoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-13_03,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311130106

SGkgRGF2aWQsDQoNCkRhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4gd3JpdGVz
Og0KDQo+IFtbUy9NSU1FIFNpZ25lZCBQYXJ0OlVuZGVjaWRlZF1dDQo+IE9uIEZyaSwgMjAyMy0x
MS0xMCBhdCAyMDo0MiArMDAwMCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+PiBBZGQgb3B0
aW9uIHRvIHByZXNlcnZlIG93bmVyIHdoZW4gY3JlYXRpbmcgYW4gZW50cnkgaW4gWGVuIFN0b3Jl
LiBUaGlzDQo+PiBtYXkgYmUgbmVlZGVkIGluIGNhc2VzIHdoZW4gUWVtdSBpcyB3b3JraW5nIGFz
IGRldmljZSBtb2RlbCBpbiBhDQo+PiBkb21haW4gdGhhdCBpcyBEb21haW4tMCwgZS5nLiBpbiBk
cml2ZXIgZG9tYWluLg0KPj4gDQo+PiAib3duZXIiIHBhcmFtZXRlciBmb3IgcWVtdV94ZW5feHNf
Y3JlYXRlKCkgZnVuY3Rpb24gY2FuIGhhdmUgc3BlY2lhbA0KPj4gdmFsdWUgWFNfUFJFU0VSVkVf
T1dORVIsIHdoaWNoIHdpbGwgbWFrZSBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbiB0bw0KPj4gZ2V0
IG9yaWdpbmFsIG93bmVyIG9mIGFuIGVudHJ5IGFuZCBwYXNzIGl0IGJhY2sgdG8NCj4+IHNldF9w
ZXJtaXNzaW9ucygpIGNhbGwuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJj
aHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NCj4NCj4gSSBsaWtlIHRoaXMsIGFsdGhv
dWdoIEknZCBsaWtlIGl0IG1vcmUgaWYgWGVuU3RvcmUgaXRzZWxmIG9mZmVyZWQgdGhpcw0KPiBm
YWNpbGl0eSByYXRoZXIgdGhhbiBtYWtpbmcgUUVNVSBkbyBpdC4NCg0KWGVuU3RvcmUgaXRzZWxm
IGVuc3VyZXMgdGhhdCBhY2Nlc3MgcmlnaHRzIGFyZSBpbmhlcml0ZWQuIFRoZSBwcm9ibGVtDQpp
cyB3aXRoIHFlbXVfeGVuX3hzX2NyZWF0ZSgpIGZ1bmN0aW9uIHRoYXQgZG9lcyB0d28gdGhpbmdz
IGF0IGEgdGltZToNCmNyZWF0ZXMgYSBuZXcgZW50cnkgYW5kIHRoZW4gYXNzaWducyBwZXJtaXNz
aW9ucywgb3ZlcndyaXRpbmcgYW55DQpwZXJtaXNzaW9ucyB0aGF0IGV4aXN0ZWQgYmVmb3JlLg0K
DQo+IENhbiB3ZSBtYWtlIGl0IGFidW5kYW50bHkgY2xlYXINCj4gdGhhdCBYU19QUkVTRVJWRV9P
V05FUiBpcyBhIFFFTVUgaW50ZXJuYWwgdGhpbmc/DQoNCkl0IGlzIGRlZmluZWQgaW4geGVuX2Jh
Y2tlbmRfb3BzLmggd2hpY2ggaXMgaW50ZXJuYWwgUUVNVSBpbnRlcmZhY2UgZm9yDQpYZW5TdG9y
ZS4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIGhvdyB0byBtYWtlIGl0IGV2ZW4gY2xlYXJl
cj8NCg0KPj4gwqBody9pMzg2L2t2bS94ZW5feGVuc3RvcmUuY8KgwqDCoMKgwqDCoCB8IDE4ICsr
KysrKysrKysrKysrKysrKw0KPj4gwqBody94ZW4veGVuLW9wZXJhdGlvbnMuY8KgwqDCoMKgwqDC
oMKgwqDCoCB8IDEyICsrKysrKysrKysrKw0KPj4gwqBpbmNsdWRlL2h3L3hlbi94ZW5fYmFja2Vu
ZF9vcHMuaCB8wqAgMiArKw0KPj4gwqAzIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykN
Cj4+IA0KPj4gZGlmZiAtLWdpdCBhL2h3L2kzODYva3ZtL3hlbl94ZW5zdG9yZS5jIGIvaHcvaTM4
Ni9rdm0veGVuX3hlbnN0b3JlLmMNCj4+IGluZGV4IDY2MGQwYjcyZjkuLjdiODk0YTk4ODQgMTAw
NjQ0DQo+PiAtLS0gYS9ody9pMzg2L2t2bS94ZW5feGVuc3RvcmUuYw0KPj4gKysrIGIvaHcvaTM4
Ni9rdm0veGVuX3hlbnN0b3JlLmMNCj4+IEBAIC0xNTcyLDYgKzE1NzIsMjQgQEAgc3RhdGljIGJv
b2wgeHNfYmVfY3JlYXRlKHN0cnVjdCBxZW11X3hzX2hhbmRsZSAqaCwgeHNfdHJhbnNhY3Rpb25f
dCB0LA0KPj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+PiDCoMKgwqDCoCB9DQo+
PiDCoA0KPj4gK8KgwqDCoCBpZiAob3duZXIgPT0gWFNfUFJFU0VSVkVfT1dORVIpIHsNCj4+ICvC
oMKgwqDCoMKgwqDCoCBHTGlzdCAqcGVybXM7DQo+PiArwqDCoMKgwqDCoMKgwqAgY2hhciBsZXR0
ZXI7DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgZXJyID0geHNfaW1wbF9nZXRfcGVybXMoaC0+
aW1wbCwgMCwgdCwgcGF0aCwgJnBlcm1zKTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZXJyKSB7
DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnJubyA9IGVycjsNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsNCj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+DQo+IEkg
Z3Vlc3Mgd2UgZ2V0IGF3YXkgd2l0aG91dCBhIHJhY2UgaGVyZSBiZWNhdXNlIGl0J3MgYWxsIGlu
dGVybmFsIGFuZA0KPiB3ZSdyZSBob2xkaW5nIHRoZSBRRU1VIGlvdGhyZWFkIG11dGV4PyBQZXJo
YXBzIGFzc2VydCB0aGF0Pw0KPg0KDQpJIGFtIG5vdCBxdWl0ZSBmYW1pbGlhciB3aXRoIFFFTVUg
aW50ZXJuYWxzLCBidXQgd2h5IHdlIGRvIHdlIG5lZWQNCmFzc2VydCBoZXJlPyB4ZV9iZV9jcmVh
dGUoKSBjYWxscyB4c19pbXBsKiBmdW5jdGlvbiBiZWZvcmUgYW5kIGFmdGVyDQp0aGlzIHBhcnQu
IElzIHRoaXMgcGllY2Ugb2YgY29kZSBzcGVjaWFsIGluIHNvbWUgd2F5Pw0KDQoNCj4+ICvCoMKg
wqDCoMKgwqDCoCBpZiAoc3NjYW5mKHBlcm1zLT5kYXRhLCAiJWMldSIsICZsZXR0ZXIsICZvd25l
cikgIT0gMikgew0KPg0KPiBJJ2QgYmUgc2xpZ2h0bHkgaGFwcGllciBpZiB5b3UgdXNlZCBwYXJz
ZV9wZXJtKCkgZnJvbSB4ZW5zdG9yZV9pbXBsLmMsDQo+IGJ1dCBpdCdzIHN0YXRpYyBzbyBJIHN1
cHBvc2UgdGhhdCdzIGZhaXIgZW5vdWdoLg0KPg0KDQpZZXMsIEkgd2FudGVkIHRvIHVzZSB0aGF0
IGZ1bmN0aW9uLCBidXQgaXQgaXMgaW50ZXJuYWwgZm9yDQp4ZW5zdG9yZV9pbXBsLmMNCg0KSSBj
YW4gcmVuYW1lIGl0IHRvIHhzX2ltcGxfcGFyc2VfcGVybSgpIGFuZCBtYWtlIGl0IHB1YmxpYywg
aWYgeW91DQpiZWxpZXZlIHRoYXQgdGhpcyBpcyBhIGJldHRlciBhcHByb2FjaC4NCg0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJybm8gPSBFRkFVTFQ7DQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnX2xpc3RfZnJlZV9mdWxsKHBlcm1zLCBnX2ZyZWUpOw0KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOw0KPj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+ICvCoMKg
wqDCoMKgwqDCoCBnX2xpc3RfZnJlZV9mdWxsKHBlcm1zLCBnX2ZyZWUpOw0KPj4gK8KgwqDCoCB9
DQo+PiArDQo+PiDCoMKgwqDCoCBwZXJtc19saXN0ID0gZ19saXN0X2FwcGVuZChwZXJtc19saXN0
LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgeHNfcGVybV9hc19zdHJpbmcoWFNfUEVSTV9OT05FLCBvd25lcikpOw0KPj4g
wqDCoMKgwqAgcGVybXNfbGlzdCA9IGdfbGlzdF9hcHBlbmQocGVybXNfbGlzdCwNCj4+IGRpZmYg
LS1naXQgYS9ody94ZW4veGVuLW9wZXJhdGlvbnMuYyBiL2h3L3hlbi94ZW4tb3BlcmF0aW9ucy5j
DQo+PiBpbmRleCBlMDA5ODNlYzQ0Li4xZGY1OWIzYzA4IDEwMDY0NA0KPj4gLS0tIGEvaHcveGVu
L3hlbi1vcGVyYXRpb25zLmMNCj4+ICsrKyBiL2h3L3hlbi94ZW4tb3BlcmF0aW9ucy5jDQo+PiBA
QCAtMzAwLDYgKzMwMCwxOCBAQCBzdGF0aWMgYm9vbCBsaWJ4ZW5zdG9yZV9jcmVhdGUoc3RydWN0
IHFlbXVfeHNfaGFuZGxlICpoLCB4c190cmFuc2FjdGlvbl90IHQsDQo+PiDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiBmYWxzZTsNCj4+IMKgwqDCoMKgIH0NCj4+IMKgDQo+PiArwqDCoMKgIGlmIChv
d25lciA9PSBYU19QUkVTRVJWRV9PV05FUikgew0KPj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCB4
c19wZXJtaXNzaW9ucyAqdG1wOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBudW07
DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgdG1wID0geHNfZ2V0X3Blcm1pc3Npb25zKGgtPnhz
aCwgMCwgcGF0aCwgJm51bSk7DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHRtcCA9PSBOVUxMKSB7
DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+PiArwqDCoMKgwqDC
oMKgwqAgfQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHBlcm1zX2xpc3RbMF0uaWQgPSB0bXBbMF0uaWQ7
DQo+PiArwqDCoMKgwqDCoMKgwqAgZnJlZSh0bXApOw0KPj4gK8KgwqDCoCB9DQo+PiArDQo+DQo+
IERvbid0IHNlZSB3aGF0IHNhdmVzIHlvdSBmcm9tIHNvbWVvbmUgZWxzZSBjaGFuZ2luZyBpdCBh
dCB0aGlzIHBvaW50IG9uDQo+IHRydWUgWGVuIHRob3VnaC4gV2hpY2ggaXMgd2h5IEknZCBwcmVm
ZXIgWGVuU3RvcmUgdG8gZG8gaXQgbmF0aXZlbHkuDQo+DQoNCk9oLCBJIG1pc3NlZCB0aGUgdHJh
bnNhY3Rpb24gcGFyYW1ldGVyLiBNeSBiYWQuIFdpbGwgZml4IGluIHRoZSBuZXh0DQp2ZXJzaW9u
Lg0KDQo+PiDCoMKgwqDCoCByZXR1cm4geHNfc2V0X3Blcm1pc3Npb25zKGgtPnhzaCwgdCwgcGF0
aCwgcGVybXNfbGlzdCwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBUlJBWV9TSVpFKHBlcm1zX2xpc3QpKTsNCj4+IMKgfQ0K
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcveGVuL3hlbl9iYWNrZW5kX29wcy5oIGIvaW5jbHVk
ZS9ody94ZW4veGVuX2JhY2tlbmRfb3BzLmgNCj4+IGluZGV4IDkwY2NhODVmNTIuLjI3M2U0MTQ1
NTkgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2h3L3hlbi94ZW5fYmFja2VuZF9vcHMuaA0KPj4g
KysrIGIvaW5jbHVkZS9ody94ZW4veGVuX2JhY2tlbmRfb3BzLmgNCj4+IEBAIC0yNjYsNiArMjY2
LDggQEAgdHlwZWRlZiB1aW50MzJfdCB4c190cmFuc2FjdGlvbl90Ow0KPj4gwqAjZGVmaW5lIFhT
X1BFUk1fUkVBRMKgIDB4MDENCj4+IMKgI2RlZmluZSBYU19QRVJNX1dSSVRFIDB4MDINCj4+IMKg
DQo+PiArI2RlZmluZSBYU19QUkVTRVJWRV9PV05FUsKgwqDCoMKgwqDCoMKgIDB4RkZGRQ0KPj4g
Kw0KPj4gwqBzdHJ1Y3QgeGVuc3RvcmVfYmFja2VuZF9vcHMgew0KPj4gwqDCoMKgwqAgc3RydWN0
IHFlbXVfeHNfaGFuZGxlICooKm9wZW4pKHZvaWQpOw0KPj4gwqDCoMKgwqAgdm9pZCAoKmNsb3Nl
KShzdHJ1Y3QgcWVtdV94c19oYW5kbGUgKmgpOw0KPg0KPiBbW0VuZCBvZiBTL01JTUUgU2lnbmVk
IFBhcnRdXQ0KDQoNCi0tIA0KV0JSLCBWb2xvZHlteXI=

