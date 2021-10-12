Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA5B42A1AA
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 12:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207053.362795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maEfo-0006oC-6C; Tue, 12 Oct 2021 10:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207053.362795; Tue, 12 Oct 2021 10:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maEfo-0006lD-22; Tue, 12 Oct 2021 10:06:16 +0000
Received: by outflank-mailman (input) for mailman id 207053;
 Tue, 12 Oct 2021 10:06:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fUjJ=PA=epam.com=prvs=091947bc67=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1maEfm-0006l5-QK
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 10:06:14 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 072fc9e9-2b44-11ec-811d-12813bfff9fa;
 Tue, 12 Oct 2021 10:06:13 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19C9wv39004055; 
 Tue, 12 Oct 2021 10:06:07 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bn874g11p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 10:06:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2660.eurprd03.prod.outlook.com (2603:10a6:200:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Tue, 12 Oct
 2021 10:06:04 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:06:04 +0000
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
X-Inumbo-ID: 072fc9e9-2b44-11ec-811d-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/OPV1dJ4KnMjkycXbxXo7gMG5I2TWoXJWSA9d2ScmiicElIrD+M/m6f/vCcKs/p18q9JlMid7bXKIHJCRY8mYYMybJ4qa7IUgE4u+dMmwF9nOviTQJyN3RNMQfN78tLWc3NyXLooyK+DiBykQXrjlDkUOdzesYr/UbIVql3nqus7E478FHXzPG3DOEmkSEY1GxbBaQpIpVTZwM4MkOOir5IPYGScWoAIfZ6TqQC/hUpUmpy5qmkC5LK1L9trG0nV48tyoO6S89uZ+7iXp5h+rXdCbuVXL7jNCk+IKIA0jx4bzzNJ5nMznnr01oQ0/p4I+5MKWZDOqlXr9jNAmCx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAAKj+mjbcLNrefHOaYAJNKi82rGpZcHncXHCee6OO0=;
 b=KgVVulVSGxX0njJG+7JxyVlwsenhk70fC7KD6rSemqBleQcbRIbzTRyznOm8EIdarHC1SF3+xDPNp2aCPahnMqkoZQDXGWF8dOD70qRg2+B2RCGLQ8XTf+jvpL+oLtkQRe+CIo9Ef95wxxPe7Nw6V6Kg7VSjxrBQGHC50H+SjSZ9UBuNliBPJ1fZf/J7u5ZlkJz+aQfYiLEkIK5nZAWlFG0OaHJZMVz/LCfS+TY1sZZT2S1WuSuAYDxnUMGQ9mghP1VxyxDNzI7pvKZqA4v++Ofpq2Be/xztMB/G0YSr6mdlUBxFwdhYhx4HH4yFcxk67AiiNpKKcxI9A3b31ULIag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAAKj+mjbcLNrefHOaYAJNKi82rGpZcHncXHCee6OO0=;
 b=bjCyJxL9jhlIhLLnPpZZUV5vB9OFbullmFzjMFuqd09cXhI//pLRy1dyxqYzmH0cdZcKgxv69rJ2q1AoD7ystq3UO7xI0xp6FoJ8J9r04aQvJOorHoRmIGQG+k3ynlu1nhkPgzghMu7Unx6YWDe2imkrG1ExkkRahGlPq5qHZGg60ZAkSjGWTf13wdjkI8uZnTwzwNXym/QKvWMkKw7B6cMK/PkNBEmP5xPQoKedt8MkmH80BXUjy+QIWbNwMhvHU/NvBqQwP7rVDJjSboPDYtMQ76b+K/Zc8fmSYC8w75izelBhSiw++D/HgZ5qTvpCFSx1udhrHmYT/jf1zCHcdg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
CC: Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Andre Przywara <Andre.Przywara@arm.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
        Juergen Gross
	<jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Topic: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Index: 
 AQHXutl5d8zkP9bsD0GXT4+5QPGclKvNtfkAgAAGc4CAABOEAIAABXoAgAAEuYCAAAVHAIAAJiWAgAAK0ICAAQCPgIAAA0qAgAAOJYCAAAHCAIAABnQAgAABQgA=
Date: Tue, 12 Oct 2021 10:06:04 +0000
Message-ID: <c6b6c22f-fb8a-f2d9-7735-f1ebc9809908@epam.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
 <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
 <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
 <YWRnMfAi808TQ4Gt@MacBook-Air-de-Roger.local>
 <EB1CB53B-9D5A-49C5-A687-841BF94A153F@arm.com>
 <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
 <ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
 <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
 <c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
 <c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com>
In-Reply-To: <c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6dd36193-3e06-4d3b-348e-08d98d67e704
x-ms-traffictypediagnostic: AM4PR0302MB2660:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0302MB26606F7B759C0610224597EAE7B69@AM4PR0302MB2660.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 alwr5lus+WgFbERXDLIOXS5tCUHtc7HTHRzl9a94tVJdE3xzVewUIreFa27akoU8imF5n8JsQyxEzbBpWxDJlMB4aRGSDfwNTM/Pnq6uuXL0Ape8V0dL2eT9i817d7DeMoWncFcfXjbA312R9de8Wnd2JJkA1UcdcfcLHYV5MmKaGopAfEnJ6Vmkv3wYZsW7SNWOL4HsPApWctMg7ClL0O7EJfwpSZKru5WlLESqS6n1KmK6sCMS0VW1zNA1n//a/WGGCcL/jKl7NQi0aapX88Y+nCrfvTeXAAWILfRxOdYAzj5aMFqPrCsduROhsqjWp+b9h4epgJJ0ZS+VKbm7gj73zpXmjJw6CAuPjIvdw9A22zajpMtfXnpyNku8ZvQP4ERIrtAxB6qyH2ndQmcAZRRjQvAk1w8TGMauYcD6R8UmTJl/yi2N9GlQvkHIXqjtbhHCv7NONHK4F05Sh15GVBp8Tun/dM7V1+yoguVtWm6vWBKl/ginGs5B2H5rFrORlDeaxhP52I3D6ZekdoHIaurld2EBsu7C8A++tWep8bdkLl08TZDyacMO5A1NajImmudnxKqqewwYjppFQ3m53qN0odajG0eWM/Ql8Q0rd0Rec7xvr9acc4MvWm+eUCGdGFCZwBFfqdxjtUqj+cnJ/YI4HnkbsoaLGjgwkMQXTH5oto7lOyNg7sXBLghf+mL3JrgoLXUie+RwPEVfXqSqEUZmExUoh/kAd9C2TlPSLHNcdjnmZ3zKsRhvvMD2CVVc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(316002)(36756003)(31696002)(86362001)(122000001)(54906003)(110136005)(38100700002)(31686004)(508600001)(8676002)(4326008)(2906002)(5660300002)(53546011)(6506007)(7416002)(66556008)(66446008)(83380400001)(107886003)(6512007)(76116006)(66476007)(91956017)(26005)(2616005)(8936002)(64756008)(71200400001)(6486002)(55236004)(186003)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eVllY3lLVitXSDl0cXNqUWUvbklpa295T1N5SHRid0xjU2hmRE42dzh5WEky?=
 =?utf-8?B?VkYvaUNLdWpMK1kvZWhrcjdYaS8wemNPdlN1aGhadTlteUU3YWpaUWYybGor?=
 =?utf-8?B?RGdOZVkyVDVzaGE0ZXFYTHUzazhrdTdhYzZxRDNtQ3ZnYjJWZkpSTVhXdFJ3?=
 =?utf-8?B?VVZzREpuWUQ0NldRamJIUUNkY0JxK0U2eC9Pb1JrZEIzL0dTVDB6UDgvcFp1?=
 =?utf-8?B?TDJiZUpUZjV6RlovZlFpVjFjaEJXazZvcHlYUldPRXQ4NUN4bXdGK1F1MWl2?=
 =?utf-8?B?Z21oaTJtUzNYZzBNeEx1djY2UnFlei9EVVVXTWhJR2J0Yy9OVFdMVWJIL0hz?=
 =?utf-8?B?Zzg0Mmw0aWk5Y1pCVmpDVTlHTytHSGpOYm1nN0ZNRmlXbHBjY013ODQ0dk83?=
 =?utf-8?B?NWhSbkJUMlZPYVlQL1JUc1l4T0tRN3BRL2tzbTlGZUdzNXltaTI0WmhpWkJM?=
 =?utf-8?B?MFZIdHY3cGR0UlIzczJQcjQyZnVCNTlXN3dOblNHWUJMbE4wdjI3R3F2L3Ew?=
 =?utf-8?B?YmhCZUlxalp5blpDcUJlZmp1YTk3T0NIOTN0WTFSMG5wMURMNkFuTDhlanBo?=
 =?utf-8?B?Z3YxNHBBb0l2L2lwVHplNWxxVE01MXFZRm0yTUQvSDVRMUYvbTdkRjQ4THkx?=
 =?utf-8?B?QzloZVJyQTdOemFBcUpIMjhhSGx0OGp4UVVWWkFqdHQybEh5NEpjYWlxSnZ5?=
 =?utf-8?B?OGQ3c1RiVm5yN0laV2kvMlB5MWxTb2tDUndzM1FSS25EdzBoUWtacXdVZHF4?=
 =?utf-8?B?Um5NSmEvYTl6WjI4WUZ1enk5djZlaTdPU2RBZ1hWSVM5cEZYWVc2YUNYOE9a?=
 =?utf-8?B?RlZ0WGk1SHBjRFV2dTlZTVdBU05SU2RyM1VXbjBXcFFZZHl5a3RWaVYrS2VJ?=
 =?utf-8?B?UlAzWEJGcWZDR3EvNkFSQkVIcXVHZTVHVGp5bnVsWjRHa2dSVVRCcnZ6K0di?=
 =?utf-8?B?S3h0Z3NJZ1hsTWZwd1NYVEJTODVneStOeUNhYkFCOVhRa1VCRGFER1pMaEcv?=
 =?utf-8?B?cWdqbU5VTFZhSTVDZ2xWSUJpNWd5eDEwMU1OTHVnS0lCSGF5dFhLTHd0VFM5?=
 =?utf-8?B?QTZ6aHRHNnpjcmlBTmFLTDBrendrb25VVVQwUm4vSDA2SGpnQzN5UlptUUdE?=
 =?utf-8?B?OWJIZy9WNjlSdnNUMFhxb1B0RC80cDVaNXJjVWtkQ0JKb3dQNmV2VkJxUUZI?=
 =?utf-8?B?QWIrUkVjVmFzb3d2eVdDMVM4bU5wZHVTWVljWlBnWGdPTUFVbU4yK2pKVW5H?=
 =?utf-8?B?RXZuNEdTRmVyRE5TZSt6UVpjbWx6MnJZYWlHSXFqd2M1RGNmOU1WMVg5WXVU?=
 =?utf-8?B?aWdMSkNkcytrTDhlNERVaTdQWFFOdy9vTk9YNEJESFR5ak5mZHYxV1RGTzBP?=
 =?utf-8?B?TUVWczJsWC93TWZVS0drL0ROY0RHczRJTWJNdEg2SXIza2U5WEFzWTZyTzNZ?=
 =?utf-8?B?NVpzdXVSenVnbWcrcWZ0aHl3ZVlPbktNd3FYc3lhZnB2TlFOd2tQRFFzWnha?=
 =?utf-8?B?Wks4VjdIbFZETDhBZFE4S2lUcU1vRnV0NjJpa2g1ZFhuNzdxeFp3OWNLVFJG?=
 =?utf-8?B?bTZwKzBEVHdWNDFXNmZJdVJTQU14RUtoTnlCaXRXK1FSTXovMGhYc2t6akRD?=
 =?utf-8?B?dUUyRXJ1L1V0MmRRSmtma2w3UlZFR1pibWdGVmJPa0lmUFB0bnlsaENJZDg3?=
 =?utf-8?B?a1JFL1UybzlSN3dSd0JOQzM4NlVRWHBycndFZ3ZYdkdWeW5XYUk1WFNGNE9T?=
 =?utf-8?B?NWViNFM5SEUrUE1kMDNQZWJzVFZLYjIvUDRBNm5uOU9qMXNuYURCRTR4TGtx?=
 =?utf-8?B?WmpBNXdrZWtUY3ZHRVhzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B87EFEA16AA2814C9F754E79DB035BB3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd36193-3e06-4d3b-348e-08d98d67e704
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 10:06:04.5461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N8q8rowZknW+ZSWPqQszMoLRl8pVWA3XrPo7vTPUQMEbbcROvP/68QFSTGErhYMVtZmawHymIpP/ktkRQK6y7I07j4QgX7mNn2nKylu2SfvIVGFGEyCB5nxyUs1Yl8SP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2660
X-Proofpoint-GUID: LADBQw8Qs791kq-3U0Uhdxlra9IXLqV8
X-Proofpoint-ORIG-GUID: LADBQw8Qs791kq-3U0Uhdxlra9IXLqV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-12_02,2021-10-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110120057

DQoNCk9uIDEyLjEwLjIxIDEzOjAxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMTAuMjAy
MSAxMTozOCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxMi4xMC4yMSAx
MjozMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTIuMTAuMjAyMSAxMDo0MSwgQmVydHJh
bmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+IE9uIDEyIE9jdCAyMDIxLCBhdCAwOToyOSwgSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDExLjEwLjIwMjEgMTk6
MTEsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+Pj4+IE9uIDExIE9jdCAyMDIxLCBhdCAx
NzozMiwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+
Pj4+PiBPbiBNb24sIE9jdCAxMSwgMjAyMSBhdCAwMjoxNjoxOVBNICswMDAwLCBCZXJ0cmFuZCBN
YXJxdWlzIHdyb3RlOg0KPj4+Pj4+Pj4+IE9uIDExIE9jdCAyMDIxLCBhdCAxNDo1NywgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+Pj4+Pj4+IEkgdGhp
bmsgdGhlIGNvbW1pdCBtZXNzYWdlIG5lZWRzIHRvIGF0IGxlYXN0IGJlIGV4cGFuZGVkIGluIG9y
ZGVyIHRvDQo+Pj4+Pj4+Pj4gY29udGFpbiB0aGUgaW5mb3JtYXRpb24gcHJvdmlkZWQgaGVyZS4g
SXQgbWlnaHQgYWxzbyBiZSBoZWxwZnVsIHRvDQo+Pj4+Pj4+Pj4gZmlndXJlIG91dCB3aGV0aGVy
IHdlIHdvdWxkIGhhdmUgdG8gaGFuZGxlIElPIHBvcnQgYWNjZXNzZXMgaW4gdGhlDQo+Pj4+Pj4+
Pj4gZnV0dXJlIG9uIEFybSwgb3IgaWYgaXQncyBmaW5lIHRvIGp1c3QgaWdub3JlIHRoZW0uDQo+
Pj4+Pj4+PiBBbGwgb3VyIGludmVzdGlnYXRpb25zIGFuZCB0ZXN0cyBoYXZlIGJlZW4gZG9uZSB3
aXRob3V0IHN1cHBvcnRpbmcgaXQNCj4+Pj4+Pj4+IHdpdGhvdXQgYW55IGlzc3VlcyBzbyB0aGlz
IGlzIG5vdCBhIGNyaXRpY2FsIGZlYXR1cmUgKG1vc3QgZGV2aWNlcyBjYW4NCj4+Pj4+Pj4+IGJl
IG9wZXJhdGVkIHdpdGhvdXQgdXNpbmcgdGhlIEkvTyBwb3J0cykuDQo+Pj4+Pj4+IElNTyB3ZSBz
aG91bGQgbGV0IHRoZSB1c2VycyBrbm93IHRoZXkgYXR0ZW1wdGVkIHRvIHVzZSBhIGRldmljZSB3
aXRoDQo+Pj4+Pj4+IEJBUnMgaW4gdGhlIElPIHNwYWNlLCBhbmQgdGhhdCB0aG9zZSBCQVJzIHdv
bid0IGJlIGFjY2Vzc2libGUgd2hpY2gNCj4+Pj4+Pj4gY291bGQgbWFrZSB0aGUgZGV2aWNlIG5v
dCBmdW5jdGlvbiBhcyBleHBlY3RlZC4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gRG8geW91IHRoaW5rIGl0
IHdvdWxkIGJlIHJlYXNvbmFibGUgdG8gYXR0ZW1wdCB0aGUgaHlwZXJjYWxsIG9uIEFybQ0KPj4+
Pj4+PiBhbHNvLCBhbmQgaW4gY2FzZSBvZiBlcnJvciAob24gQXJtKSBqdXN0IHByaW50IGEgd2Fy
bmluZyBtZXNzYWdlIGFuZA0KPj4+Pj4+PiBjb250aW51ZSBvcGVyYXRpb25zIGFzIG5vcm1hbD8N
Cj4+Pj4+PiBJIHRoaW5rIHRoaXMgd291bGQgbGVhZCB0byBhIHdhcm5pbmcgcHJpbnRlZCBvbiBs
b3RzIG9mIGRldmljZXMgd2hlcmUgaW4NCj4+Pj4+PiBmYWN0IHRoZXJlIHdvdWxkIGJlIG5vIGlz
c3Vlcy4NCj4+Pj4+Pg0KPj4+Pj4+IElmIHRoaXMgaXMgYW4gaXNzdWUgZm9yIGEgZGV2aWNlIGRy
aXZlciBiZWNhdXNlIGl0IGNhbm5vdCBvcGVyYXRlIHdpdGhvdXQNCj4+Pj4+PiBJL08gcG9ydHMs
IHRoaXMgd2lsbCBiZSByYWlzZWQgYnkgdGhlIGRyaXZlciBpbnNpZGUgdGhlIGd1ZXN0Lg0KPj4+
Pj4gT24gd2hhdCBiYXNpcyB3b3VsZCB0aGUgZHJpdmVyIGNvbXBsYWluPyBUaGUga2VybmVsIG1p
Z2h0IGtub3cgb2YNCj4+Pj4+IHRoZSBNTUlPIGVxdWl2YWxlbnQgZm9yIHBvcnRzLCBhbmQgaGVu
Y2UgbWlnaHQgYWxsb3cgdGhlIGRyaXZlcg0KPj4+Pj4gdG8gcHJvcGVybHkgb2J0YWluIHdoYXRl
dmVyIGlzIG5lZWRlZCB0byBsYXRlciBhY2Nlc3MgdGhlIHBvcnRzLg0KPj4+Pj4gSnVzdCB0aGF0
IHRoZSBwb3J0IGFjY2Vzc2VzIHRoZW4gd291bGRuJ3Qgd29yayAocG9zc2libHkgY3Jhc2hpbmcN
Cj4+Pj4+IHRoZSBndWVzdCwgb3IgbWFraW5nIGl0IG90aGVyd2lzZSBtaXNiZWhhdmUpLg0KPj4+
PiBBcyBFQ0FNIGFuZCBBcm0gZG9lcyBub3Qgc3VwcG9ydCBJL08gcG9ydHMsIGEgZHJpdmVyIHJl
cXVlc3RpbmcgYWNjZXNzDQo+Pj4+IHRvIHRoZW0gd291bGQgZ2V0IGFuIGVycm9yIGJhY2suDQo+
Pj4+IFNvIGluIHByYWN0aWNlIGl0IGlzIG5vdCBwb3NzaWJsZSB0byB0cnkgdG8gYWNjZXNzIHRo
ZSBpb3BvcnRzIGFzIHRoZXJlIGlzIG5vDQo+Pj4+IHdheSBvbiBhcm0gdG8gdXNlIHRoZW0gKG5v
IGluc3RydWN0aW9ucykuDQo+Pj4+DQo+Pj4+IEEgZHJpdmVyIGNvdWxkIG1pc2JlaGF2ZSBieSBp
Z25vcmluZyB0aGUgZmFjdCB0aGF0IGlvcG9ydHMgYXJlIG5vdCB0aGVyZSBidXQNCj4+Pj4gSSBh
bSBub3QgcXVpdGUgc3VyZSBob3cgd2UgY291bGQgc29sdmUgdGhhdCBhcyBpdCB3b3VsZCBiZSBh
IGJ1ZyBpbiB0aGUgZHJpdmVyLg0KPj4+IFRoZSBtaW5pbWFsIHRoaW5nIEknZCBzdWdnZXN0IChv
ciBtYXliZSB5b3UncmUgZG9pbmcgdGhpcyBhbHJlYWR5KQ0KPj4+IHdvdWxkIGJlIHRvIGV4cG9z
ZSBzdWNoIEJBUnMgdG8gdGhlIGd1ZXN0IGFzIHIvbyB6ZXJvLCByYXRoZXIgdGhhbg0KPj4+IGxl
dHRpbmcgdGhlaXIgcG9ydCBuYXR1cmUgInNoaW5lIHRocm91Z2giLg0KPj4gSWYgd2UgaGF2ZSB0
aGUgc2FtZSwgYnV0IGJhcmVtZXRhbCB0aGVuIHdoaWNoIGVudGl0eSBkaXNhbGxvd3MNCj4+IHRo
b3NlIEJBUnMgdG8gc2hpbmU/DQo+IEknbSBzb3JyeSwgYnV0IEkgZG9uJ3QgdW5kZXJzdGFuZCB3
aGF0IHlvdSdyZSB0cnlpbmcgdG8gc2F5Lg0KPg0KPj4gSSBtZWFuIHRoYXQgaWYgZ3Vlc3Qgd2Fu
dHMgdG8gY3Jhc2guLi4gd2h5DQo+PiBzaG91bGQgd2Ugc3RvcCBpdCBhbmQgdHJ5IGVtdWxhdGlu
ZyBzb21ldGhpbmcgc3BlY2lhbCBmb3IgaXQ/DQo+IFRoaXMgaXNuJ3QgYWJvdXQgYSBndWVzdCAi
d2FudGluZyB0byBjcmFzaCIsIGJ1dCBhIGRyaXZlciBwb3RlbnRpYWxseQ0KPiBnZXR0aW5nIG1p
c2xlYWQgaW50byB0aGlua2luZyB0aGF0IGl0IGNhbiBkcml2ZXIgYSBkZXZpY2UgYSBjZXJ0YWlu
DQo+IHdheS4NCldlbGwsIGZvciB0aGUgZ3Vlc3QsIGFzIHdlIGRvIG5vdCBhZHZlcnRpc2UgSU8g
aW4gdGhlIGVtdWxhdGVkIGhvc3QNCmJyaWRnZSwgdGhlIGRyaXZlciB3b24ndCBiZSBhYmxlIHRv
IGFsbG9jYXRlIGFueSBJTyBhdCBhbGwuIFRodXMsIGV2ZW4NCmlmIHdlIGhhdmUgYSBCQVIgd2l0
aCBQQ0lfQkFTRV9BRERSRVNTX1NQQUNFX0lPIGJpdCBzZXQsIHRoZQ0KZHJpdmVyIHdvbid0IGdl
dCBhbnl0aGluZy4gU28sIEkgdGhpbmsgdGhpcyBpcyBlcXVpdmFsZW50IHRvIGEgYmFyZW1ldGFs
DQp1c2UtY2FzZSB3aGVyZSB3ZSBoYXZlIG5vIElPIHN1cHBvcnRlZCBieSB0aGUgaG9zdCBicmlk
Z2UgYW5kDQphIGRldmljZSB3aXRoIElPIEJBUi4NCj4NCj4gSmFuDQo+DQo=

