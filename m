Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F541C687
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 16:17:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199201.353106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVaOs-0001Vp-Rp; Wed, 29 Sep 2021 14:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199201.353106; Wed, 29 Sep 2021 14:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVaOs-0001To-O0; Wed, 29 Sep 2021 14:17:34 +0000
Received: by outflank-mailman (input) for mailman id 199201;
 Wed, 29 Sep 2021 14:17:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mM9C=OT=epam.com=prvs=09065c5b4f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVaOr-0001Tc-5V
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 14:17:33 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1a0f609-ca1b-4009-9885-6d1d8517992f;
 Wed, 29 Sep 2021 14:17:32 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TE4EU1014541; 
 Wed, 29 Sep 2021 14:17:27 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bcnh092qf-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 14:17:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6770.eurprd03.prod.outlook.com (2603:10a6:20b:283::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 29 Sep
 2021 14:17:23 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 14:17:23 +0000
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
X-Inumbo-ID: e1a0f609-ca1b-4009-9885-6d1d8517992f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQ/vomCP6LnhCRDZOuHCha0zBCQo1/QjdeblUeHHjaji/mnFUsZYxkRWgqURIZ4XPXG/vIdZEcX+MOc9mQ48Bnw1FCBtCDgReSmBFoFzWDhRj7ITI2sLdh7eRw2DIk7mYaFdRLLk7bf0adhV+Ug43Yd8UAYxG2bucfOyHNFVZkKLINNdPfABV0B7MEid/osnJM5hchEHUIkepGVCJ4tJWzv6IRs5OlH9GY1iOaYqwvch6DcqoTQoWHQ0Nr+jPv8Uqi1fGR13MViobKO75YKAQaDfB820RbffJORjYNPJYS7IMAxtsL5NGJH4dBc8hboWXNAKU8pss4/r5F0cWjtldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0owqIExO+hT7G+jzgy+DubfnoFP+udZump4PClvN/xs=;
 b=QQVDLnmYQjn/yIeCyulg35iA4G8iA/OWI4d8Unz9s6tkhiNgBntx7Z2YBsQdSPsg2M91Rx5PYOGup90fz365K6AV9ul4MGjQIPaokiqe9kW1tR0hcx+F3ouxY5HP+NE8BlJylDEBDsT8HW/709UApBK2IGQqofXcwmd3hLFCcZ11o2u+UV0oP6T3xo9BdYAbMSPk9wZesmtCHIqTleMvHYkL528ZwMNlDlXqonUqE8JzRj3sjtgVhANXqDXEVPrr4el/154+SlxXeSetL1RcXVyZVcKKVp6E2Te+5XmeihdHtYnvBXcXmtZ2DQCJqjN5711r7XqFrBe5LbUu2nqdLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0owqIExO+hT7G+jzgy+DubfnoFP+udZump4PClvN/xs=;
 b=ZvhUdigFzf8Bthm+DjbT1oPgrlSXkNxC8rUCxBwVU2hfyiwFVB3syv6NcAQIFg07o1OIyUK9GaF+EU5df9ZcRZxVqJFz8Xm8vGio/b+L2cp7QCoFjkXwLOl6MUkJkWAi5QfRJ3YGhLGJq9laiJaUwI8rXuE7m/Ohl470+CAjt8/sgwALrGExTl2slGPMhNrA1gGmFHrZEkehPDVt9uUHUVu3Ic7t2gJdMOHYHxNDiCH4Kk835IVPni9nW63WSmkVZKO4Gg1pnekQWG0MhbMfpGv1Non29i3avAh5BobJcdVcawmVsgRRPoca947I7/pxldGIsO7oiQ91jSkxg/4WbQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
        Andre Przywara
	<Andre.Przywara@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 12/17] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Topic: [PATCH v3 12/17] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Index: AQHXtJXcmX/LQUbr3kiBv6S+hyMHIKu7BXCAgAAK1YA=
Date: Wed, 29 Sep 2021 14:17:23 +0000
Message-ID: <47721cc7-985d-9b22-4ab5-bce258a34703@epam.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <c40a520d289799e52234fb1865e7f3ef1fd27431.1632847120.git.rahul.singh@arm.com>
 <02F22926-2A4A-4301-A975-4BB2EFD5653F@arm.com>
In-Reply-To: <02F22926-2A4A-4301-A975-4BB2EFD5653F@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f50e100-4b53-4d2a-609c-08d98353db7a
x-ms-traffictypediagnostic: AM9PR03MB6770:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB677053DC8C484B29E9204D9AE7A99@AM9PR03MB6770.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Av/qx6w3jFpoe2klk8YNuad6jsAI8dgZ0UXWRWbNScxIJDrYp4pPHEUsEPMcBsTS27Vl6UJtgq1UHiBNNR4kl7sSWkPJqmR2c1odll4vsbroar8AgW8I8MqIpLVYmWXBGnYOAX9izv+ke8Hb+UAmb3bgabsFopAcW+2cqtWsrHhEsXMlO7xcO3JMzk2LHmAPeMT9CAbzs1uTWUObFez5fikRRKAHEV1nTJDTify0ngZlf289Y1iQPmDVfVPF9j2Gs7EPc0Ze9eGTstnvDTA7OAYR5mcK2seEhHcLAF4vMMUEJ+uGIk1GkPHDWgyYvI5GAM+CEWX0A6r3VXf9Kl0X3TiFzV6Z0ZflEUaFlDow3I4Nf2LEEY/hWCqdoPVCsoh508TXquNmWuaqQ4kGsa6ZnJHX6ZYKINFBzZgCnEyRFaib4jqXDVwtg1D4M0qOlDO2aN1XaQZ4s512TywdfS6lhrShEg2ovTVxBuElIYUCiPU1tWb9C6sjH1qvO3/MxcM2SM7uKPWjjmuDFXYuoHLT1WJNhq84pN8WboGBbTrkBHpgtVZvCG8aRcL0LMCUjCnd20M/4/A3M7RvScQl6wfBuywxJZsxXZ9S8MjE3VBTTt2mq5yQywrmt9szhn5EorD949Ho3EjmGC/P4c4gsC2qCKmAq0h9RzbvCFNQjsEhSFBpe3ARr+37/6jdJWTu0JNzKMlE7mFheI6UcefaQvKIhuIf2RVlkgwrQMEZz+Usg20=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(4326008)(66946007)(54906003)(66556008)(66476007)(4744005)(76116006)(91956017)(2616005)(316002)(122000001)(38100700002)(36756003)(64756008)(6486002)(66446008)(5660300002)(8936002)(31696002)(6506007)(2906002)(55236004)(186003)(86362001)(508600001)(26005)(8676002)(53546011)(38070700005)(71200400001)(107886003)(6512007)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M2o4RFBBK2E0eWZ5aG1YOWlhSWh3cWRKWkVKdGlrMHR1dExUeVZPbmpiWHhQ?=
 =?utf-8?B?ZGNib3h0R1dmMTJiRkZMczVHUlJZeTFlNGtrQzUyamZwSDdZU1BsY0lPU3p3?=
 =?utf-8?B?djQwWDhYaWVWdFdZVFRiRHROLy8xTU1pTzBGeUFvZEhMZHd0VnBXRWEzamo1?=
 =?utf-8?B?dk4vM0MxNTU4NFd6NFZrNXB6bzRuOFFCdklYb0hlYmMyRTZsTVo1S2xWUSs4?=
 =?utf-8?B?VTZWTW45cERGRFFDM2FpQkFqVW4wdUUzdmk5L0F3ZVI5UldaZTEyNzVwRXlv?=
 =?utf-8?B?WGJDcENpSjJ1UnNCdG8zajM4V2U5RWlQMmh6dmFXZWNDOEx1aG9CWllsOEw0?=
 =?utf-8?B?M3Uvak42VXJFWFR3TVUyRmY0bmhoYVNPT0ZjSCtlQ2x2ekYzMXJQYkNFRFcr?=
 =?utf-8?B?K3lYejB4VGRNSllyT2ZGSUl2aHhhQkNodkpnWHFmMjdTb1dybUVEalJ0amE0?=
 =?utf-8?B?cHBzd2ZoczlScWJMODA2eTI5UkNxdVJORE9TQ0VKMmRUeThkaE0rZlFvRUdS?=
 =?utf-8?B?cWVvMHBOMTg4MUhxd2dnaG1SZjlXSWNPbVRnd1dwVHdhM3c1UTZUN2dKZWc0?=
 =?utf-8?B?K2txdWJNNjFETHh5TXZuVHZFdEY4emNDSUgrL3Q3Qk5mOElsTDJiaVplZlRq?=
 =?utf-8?B?QVlJRk1RV0t2TDhXR1ZEcmE2YnpyWVZLOEcvTjVMNHhaencza3JLZmFxeDFV?=
 =?utf-8?B?WDNyd2pXQVoxYVVMcnpab0xqVzR4dkxLVGNOM3B4TGlFU3Jib01jZW5FeFBJ?=
 =?utf-8?B?VFBrNjVzdGtWaFpLMmdEK045QUxsVlQ2WG1jVWxoY0JPcXdkdFlnWk1GSzRC?=
 =?utf-8?B?aDBkRytST2d3K0VPcVFpZXpUUWdJVjNrRy93RTR5WUIwTktUa1lnMEVkeEtF?=
 =?utf-8?B?WTgzVDArT3hRam5qeXcwNTVJNTY1NlJhUEdNbVQ3a1R2d00vQ2o1aEZ5SUJP?=
 =?utf-8?B?VkpuaUR3M0RSa3VBRDJySzdENTBlb2VtSis1OFFiZm10Y3NvSUpvanhKc2ho?=
 =?utf-8?B?a2V1SGlxR0ZOWVM0a21CVW5zMERoTmFmd3BwUlFoWHREMEhicDVTZm1DUFBn?=
 =?utf-8?B?YSsvZWhITHB0Nmtkd01wYXlQTVZaUTUzd0wrNTFqN3lDc0ZnTXRhUllodExC?=
 =?utf-8?B?YW5aZWRPZmJ1OVl2T216eVg4RFVUMkJHSHdaUGY3NXYya3lrMDF5TUJoSlpk?=
 =?utf-8?B?MW8yNXNtVlNLa01jdkRBOTNrUXRzMmJnNG5VT2NnQ3pEUHFrcC9Zb3VIaGRE?=
 =?utf-8?B?RjdacjhsK2hCV2E2ekRpbGlWV3RYbFBpYm9wclJtQ3dHV243YmhQWFUwMFdP?=
 =?utf-8?B?TzVQQ0dUVlliUVA2L0JRZ1FVVHNsNmY0QVhYVHV5bVh6aFJoRUJrWXpXYko4?=
 =?utf-8?B?SFRYWk95Sy90a3BHRHNYVWMrWlM4TDN2dVhHdTB0TENmU05sSWRMRWprdVVw?=
 =?utf-8?B?YVlEQlgyakh0UUFsNG1DdUFaOTJmUUttM3Z1dnlGcklxVWJjaXg4MisyZGZO?=
 =?utf-8?B?U3oxL0QyZlJrcFdOVFUvaWlSWkFvS3FyZ3dIb04xcVZxa2dURTM4d3N1citT?=
 =?utf-8?B?S1ZYTm5BZyttOWxpY0V2RzRvWkQ2VkxUc25qK0FXcmhoQVZIa2VDUWJxVEt0?=
 =?utf-8?B?S0NaNWNKY20vRDJ6ck1jaUQ4VVlaWXlVVVZ0VGpyWVIzUnZvZmZuMmpDQmxR?=
 =?utf-8?B?dVFsVThNZjUrZHpLcmJsQm1GL2J2SU9vWnRzcnNsdTU4dWh6aGJJYU8vVy8w?=
 =?utf-8?B?KzI3NjMza0F3M1lIUjcxSW0zNGlCUDByZ3dMNzg1ZWNvZXJwTXpoSHQ5SnJV?=
 =?utf-8?B?bmJXdXNmem9aVHY1cnRQUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6661A53446ADBE419EA05F4E98A2F600@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f50e100-4b53-4d2a-609c-08d98353db7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 14:17:23.6026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+lIWA9B/U6nfB+gz3HxGLupi8v29oSwrOiX2bjXStR5laPqp9X6etMtJlsq+XFMwDuSbNllSgTyyQCKv52gZpfhM28wRVy9ni5fFvrB5g9+GhmUO5hymcwXwb0MSFEd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6770
X-Proofpoint-GUID: CyS-Zmdt50qatZ5zLzqvaBLueHOWcr6Q
X-Proofpoint-ORIG-GUID: CyS-Zmdt50qatZ5zLzqvaBLueHOWcr6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_05,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=530
 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109290089

DQoNCk9uIDI5LjA5LjIxIDE2OjM4LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPiBIaSBSYWh1
bCwNCj4NCj4+IE9uIDI4IFNlcCAyMDIxLCBhdCAxOToxOCwgUmFodWwgU2luZ2ggPHJhaHVsLnNp
bmdoQGFybS5jb20+IHdyb3RlOg0KPj4NCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBBZGQgc3VwcG9ydCBm
b3IgWGlsaW54IFp5bnFNUCBQQ0kgaG9zdCBjb250cm9sbGVyIHRvIG1hcCB0aGUgUENJIGNvbmZp
Zw0KPj4gc3BhY2UgdG8gdGhlIFhFTiBtZW1vcnkuDQo+Pg0KPj4gUGF0Y2ggaGVscHMgdG8gdW5k
ZXJzdGFuZCBob3cgdGhlIGdlbmVyaWMgaW5mcmFzdHJ1Y3R1cmUgZm9yIFBDSQ0KPj4gaG9zdC1i
cmlkZ2UgZGlzY292ZXJ5IHdpbGwgYmUgdXNlZCBmb3IgZnV0dXJlIHJlZmVyZW5jZXMuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRy
dXNoY2hlbmtvQGVwYW0uY29tPg0KPiBBcyB5b3UgYXJlIHN1Ym1pdHRpbmcgdGhpcyBwYXRjaCBm
cm9tIE9sZWtzYW5kcjoNCj4gLSBpZiB5b3UgbW9kaWZpZWQgaXQgeW91IHNob3VsZCBhZGQgeW91
ciBzaWduZWQtb2ZmDQpZZXMsIEkgdGhpbmsgdGhhdCBSYWh1bCdzIFMtby1iIGlzIHJlcXVpcmVk
IGhlcmUNCg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

