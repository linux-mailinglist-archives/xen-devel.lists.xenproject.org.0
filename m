Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584BC4440A8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 12:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220830.382245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miEWy-00079z-HD; Wed, 03 Nov 2021 11:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220830.382245; Wed, 03 Nov 2021 11:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miEWy-000770-E8; Wed, 03 Nov 2021 11:34:12 +0000
Received: by outflank-mailman (input) for mailman id 220830;
 Wed, 03 Nov 2021 11:34:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UC4I=PW=epam.com=prvs=194164c520=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1miEWw-00076t-HY
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 11:34:10 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f57ac646-3c99-11ec-8568-12813bfff9fa;
 Wed, 03 Nov 2021 11:34:09 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A3BXRT3011763;
 Wed, 3 Nov 2021 11:34:04 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c3s9xr2vq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 11:34:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6881.eurprd03.prod.outlook.com (2603:10a6:20b:286::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 3 Nov
 2021 11:34:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 11:34:00 +0000
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
X-Inumbo-ID: f57ac646-3c99-11ec-8568-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRofI4oO1RNH+PD7YWmqKv3R5H8Of+idVu+xcdf3UVn2hwBFj8Q6giF8zMa9OMKBy2qUHMB86GR9P2l7j6EyTax6ap97YXxddDKmJd7NsVC+2CE/4RLRT5bIe8/+jDD2MscemqLizfjt6akZszybdeqf+BbIw3JM4gauLaM3dsBNpzA4ILgNlJbjmLRUk34y0jlJbINxDhAUI3d5/YUwCBjX+5OkaB0vrx3i22wLFZ1uTGVO4/ARCHey+UgmRmB/2IDpugOksGVLwM0249gH3sn8Z3tqkXcUkAtT+mRBVA1ePAmCgKX7WkME8mL1lackIYk/ZfJnkY0nfWDdaKPPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMopPCwnc5NGE3nVcoZUAqU3Y1+TbYJryHyGD3bgTww=;
 b=XNE1Gb1q6yrV03GlBnxRmYoO7cmq5oNojGNKwDqM6CiEH8POBlmqJdi8kBKisDTDZaocw5XyPn++N8GGLmLxzrlfzXVy83QKSKqkjY4inDO2kqyy87edVB0xIFg1LECsUEA6R1f0hfW+wVAlhWn6rKiBpQO194iNfkeT5dc2gS7yj74oHFZq9Jm2MJEmk9M10ewZa1RMkrPLpjOVl8FOFLejxG8AQFOP2pEGnulRAu/eqULW09w5Xwzw6XoZD62NbC3HnP+y7VZDJPpzuTFRu0hZ2jVxhqTGXaWveoj/upxOfit1++DUZlp1LfZlx7N8zX8R7w/RW8bLjT7Sr/cwhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMopPCwnc5NGE3nVcoZUAqU3Y1+TbYJryHyGD3bgTww=;
 b=CzlXawWIHU9KUB675+vAF/KwWkZWlrAO+GeKTVulNAzgxOAcZcBA6WQedX3wLDVjUHedgX8TmGvy9x3BnxI0BNckw8r5IoLSpb96ZBnykk+5ryjRMLiiveeI8c9uHenw7Rsouv5VO4kxDpoJSJ9i4p3WyLh7MuZThE7pRpgl/g7HNs+r4h6NU0qaOz9uBi9VBEUPW1x8hjT1ckzGHBBo22W4Q+qil3fnNOQaVourg9gpQpLYkrXK5UI9HigJlWMd6/4wIJbsftEOVlaBcSF1Pe05JZBzZS6x+j1vb/Eu1kXp+8PBJG0gsoyCDDe8PxPh2IRcwuJQ0D+9KFWuB0YSeA==
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
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Index: 
 AQHXtdAkq8Qmwxr3HUWTio8KWsEpvKvlQ6KAgAsHq4CAAAimAIAAIt2AgAAEUICAATmxAIAABTcAgAABvgCAAAHkAIAAAZSAgAAFc4CAAAmcgIAAAuiAgAAAg4CAAAbWgIAAAG8AgAAGzICAAAH5gA==
Date: Wed, 3 Nov 2021 11:34:00 +0000
Message-ID: <e6e13d25-5685-0575-fae9-8442b1632f61@epam.com>
References: <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
 <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
 <a5ff1c9b-3200-18f0-a373-7535980269cb@suse.com>
 <4d4a061f-6437-5d51-84e0-d2139f47eb76@epam.com>
 <4f77a4f2-a66b-465d-5859-7fe71ece8168@suse.com>
 <48506e1b-2dc9-4652-f169-3d44135a4e74@epam.com>
 <7efa4dd7-83b3-daac-cc02-86f80762513b@suse.com>
 <d3908703-3501-892c-55fc-5a171318eeea@epam.com>
 <YYJr75RbSOuvbzGF@Air-de-Roger>
 <9b9bd48d-ab2a-3e3a-5327-d0b8eff5a8ae@epam.com>
 <YYJx/3YpcLRTHThB@Air-de-Roger>
In-Reply-To: <YYJx/3YpcLRTHThB@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08c1f37c-d60e-4ef3-dd8a-08d99ebdd4ae
x-ms-traffictypediagnostic: AM9PR03MB6881:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB688106A21ACAACAF2D862EFAE78C9@AM9PR03MB6881.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6Bw8SuhUeFwOtDQwQVnnCbCqZBcEWacFfcusM8yJXEPCOqe9JKLxvwl0wdSaX3hWIy1rLk6tzDGATKQFj7eWN074Iq0Re1RFiSmRlWL4vEsTiFDXyLTLSPBRvX+Xb4PdM0Yl2pvHg2yZ0vf44ozEDEJIoCE7UyFSPcshzHlEJW5cDIXC2bkQF16EyVtNnto6Db5ncjOreSiA/uTGWRruIHnZQl3jKs4odNmzyvZSXKqk2iT3FYEhCewQHpO3KgNddiOC6MVKVIQwySFHdcI/8yns3XLyCL9RH3yea1tq2khDMASHLdpkYyhsxVvXXvmshO5FQ+DVOxQtBFy3yFIxpdEDPACClp7NVJxA0cdwB093JmbWJBFaVbvwvhwSwocDckaJeMAxSXTDp3kAI+hziz1T/qI3gjGiJ05LFhRwocps8GAjm841P+UMPevj2Yfp3iuS0P686Zqc108gSx7oImcuvLvClPgdqAK829LJ1P6vnuFOdWPbrIS2yY0gAScjs2PQPBBlTQo7mS+S7JgQ3Io2yLf/WSBgprrLBpANtJ3dhcMd/oF1FAvwhyMc0l4bnLGgtkdaG4brpazbfUTguMxscKsMld+Y3V0cfQ/FR+74mHpd0+x44PoC1tKTYNL5RUUyeQvkNJ2atMHCQGaMoBotoFAhoYKkHgumcrDAnERNrzbDEI4dy9rF8qgr6drPkOS3EhWnvcO6Zj07671RlhjiXwEVvGLh6TI8PcXewvnKOqt+dPRz7Kh1n9/DpXtK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(26005)(8936002)(122000001)(6506007)(8676002)(71200400001)(53546011)(6916009)(36756003)(31696002)(38070700005)(86362001)(31686004)(38100700002)(76116006)(91956017)(6486002)(66476007)(66556008)(64756008)(66446008)(316002)(54906003)(4326008)(508600001)(5660300002)(2906002)(6512007)(66946007)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V1VUVnJPZERZa0lueW1nU0k0cENJYmJDRUhtS251VDM3M0JmcVYrMHBSaDBN?=
 =?utf-8?B?TENKRExDRmR5L3FzVi9uTGF6VTcvZ3BlYnZ4VGR5V3J5M1pjQ3JvSHl4RlV0?=
 =?utf-8?B?K1hZQXN6bUYza1E0UThvTjFoMnY3V2hiclYzTzZVMkRWQ0I0azROMjNPQ3dn?=
 =?utf-8?B?UHZLaHFTdTl3NWYwTnJ0dWtGM3RaV2Q2dno4RVNDTUovbDkxdFI0TWJsdG1p?=
 =?utf-8?B?U09Ydkpra0N1Ni9neVh0KytxdXRZaEgwR0JTZFRoSXp1ZWIyUjRLcDlwVVdO?=
 =?utf-8?B?TWdKVHJ3REJ1MXZISFRtVWJqdkwyQzltTGlhY204NHpwUEo1QXBkaHhGU3N3?=
 =?utf-8?B?ckdaZHN6RS9KYzhkUTNMM0J1bWxLeW5MeHc1VjZZVURDZWg5Q05lZ0pDTEpv?=
 =?utf-8?B?NUNsR3RBWk5hYmxRWVNJb3pzUXVzeU8vaWZBRnpGTXVSenNVbTY5YU9qUHQ4?=
 =?utf-8?B?M0hDVUFuQTByWnVDdGErcjRMNzVuYUxJNW9mU05ja3hDQWFKUFE2aHhGVC9S?=
 =?utf-8?B?TThsblM1eUFJOTQ0eXkxNEtrMFlBdTlPRmlpZk53MTB0Y3BKTE0xV2xmVjUr?=
 =?utf-8?B?bC9jVzJtOURYM1VQeDhFUENMQ2VQZGc3K1hDQ2dwTUtnZS9mam0yVWxIdmtj?=
 =?utf-8?B?ZGRPNSt1eVpsYnJlSzZJelRWVVh1WlpaUExjeVpOVXVJekE4ZkUrRVNNdFM4?=
 =?utf-8?B?R2g4MlJob1BjdjZTeVBWZ3M3Q3JSWEZidlE5ZHhQSzYxaWE0Sis1R1JBM0xK?=
 =?utf-8?B?bHBSNkZ1eVg5S3NvM2ZVSnYwdXF3bW9zVGEvWGFZWjRJdDlTQnVKNEFJMjBq?=
 =?utf-8?B?djRXYnlyTWMvWXNpbUFDOTE3eEZkWmN6aE9BdFNsNGJUMGtWQ2gzdHZCSTlv?=
 =?utf-8?B?anZTYjlRNmtvVVB0NkgzN29lQlNsdFR2ME84bWxBQUdYRVNwRkk1NTkxREIz?=
 =?utf-8?B?aWhUOUh2V3cxV3o4SlZwTHNVdzlNMW0wVjZkNTVBVHZmOXVpVTdUZW5EVm5U?=
 =?utf-8?B?T0wzdXlWZ3kzNzQ0ZFRaVWJmU0JydVlnVEliN3Zyd0tkcnJIS0hBU3BoV1ho?=
 =?utf-8?B?N2JBV2FhMFJ5cENHYWhVMnMvdmp6cWxDejRoNEgyNW5jdXB4RjlZbjU5NStH?=
 =?utf-8?B?bitXQ3RKeGVHRU9WM3I4blRtR1FiYzJOVEd4YkxoSDN4akNxaGlxeHQ0eDcy?=
 =?utf-8?B?QU50ZHh4bjZQZzBveEw5dk0yUXpZQmZnVVJmc1ZoUHRKWjNiUS9TNDF3NXlp?=
 =?utf-8?B?T0gweXFXRjM3c0ltMGxUc0pFdkJUdXdLeWNuZldRdUhQYm5LdkVFcXVscWtr?=
 =?utf-8?B?WWVmUm8xVUF3OTlLb2hMUlljMTVLQnJYMDE2bXVrTWJtTHRvS0tyU3BJbUc1?=
 =?utf-8?B?bXdnS3RzbGNqM0VvVGIzaitWamwva1Jpb2R6SWFYcEt2amlRT1Z3MnI1Y24y?=
 =?utf-8?B?OFl2YktUbjREZkg4dGpIUXIxWnRiZVcrVlRIbkV3ekJTSjdtZW05YmFUZkoz?=
 =?utf-8?B?L09veWozbWtpbk9ueFVNa2NUbUZjTkNvdWc2NVBEUWJrTjRQRkE5Z0U2UEh3?=
 =?utf-8?B?b3JVK1RjR2QrUFJJZ0dVK0tXUDJIcm5zRkh2WGFWc0VZZnVhWFI1WUNORmky?=
 =?utf-8?B?UUU4UEJEWFkwdEwwbGVqM1oxTGcybVhkeHVNVjRWUjZDbytGZ1RxT3ExVTdC?=
 =?utf-8?B?ODA3b2VOVTVFQ1QwVFhlekk0emN5WW5iK1pxZk91U0tOVmluaGhDc1lTNHJx?=
 =?utf-8?B?UWY4YlR1ZHZ2aVQ1R2lwU0ZLQ3lqVENjcDZBTzNpNmFiQmNYQVFYOFp2QkZp?=
 =?utf-8?B?RHpuRTVWc2tLTjh6UEl2ZDlPaW02eHhpNVlPbHlwWWhBV3VacGlKSkp5U2Fv?=
 =?utf-8?B?WUwyc2JSY2hNaE5hcGtNcER2NTh4TDF0Z1ZGSFZhU3RXc2E0N3RzM0lrYjla?=
 =?utf-8?B?QWJnYXl3OSsySDFUUloxTFZ2YVY2bFRSMHc3WXJ1Y3drN0NvSGtId3dyOUNH?=
 =?utf-8?B?QXlpaSs1dWsyTDRSRjQ3Ujhkb3A4MjFvTloraHJtSkVSTTlacHZ5NFRYeUJD?=
 =?utf-8?B?V0M4alJDR1VPSk9VNlZlK2NHL0dhMlFqazRwdVJ0NThIb2lRZlRreWFvNnNG?=
 =?utf-8?B?YStWMmFXaks5UGhJMldaMTlIZkVFNGFEM21kT2M3dXJaeTlxM2prUDkxSXQy?=
 =?utf-8?B?b29lTzFGK0JSUXZGajRvM2Fkc1VDaFFkMHVsM1BaZ0FkSUNMbGlMaFVXcGtw?=
 =?utf-8?B?aUp0Y3NUeEkwai9ldjI2N2p1VThpMXZVbXRGc3JvWUlOZU1WYU45MjBpYVQx?=
 =?utf-8?B?RElPbWVXbS9DdnNOcUdORWN3aXV3WjJIN3JobG0rdzkwL1BGUXVYQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <848B986FF58D87479E28B692D8EE3F2A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c1f37c-d60e-4ef3-dd8a-08d99ebdd4ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 11:34:00.1423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MhzfWIm7/EfEuFKSthhI9aswwkWyhPW+fD8y4aDFE5svGqZMOcz5SGk4KAaMAivO3AXqomWqPdNUauA0DpGB9RFvY3T2UMetAIOQ7szvu4I35nR45NiTjtH0OzFFaq2T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6881
X-Proofpoint-ORIG-GUID: V3zgFp1WCFHzChvvKvBRdDSIdPkRSTWs
X-Proofpoint-GUID: V3zgFp1WCFHzChvvKvBRdDSIdPkRSTWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_03,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 mlxlogscore=926 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030065

DQoNCk9uIDAzLjExLjIxIDEzOjI2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQs
IE5vdiAwMywgMjAyMSBhdCAxMTowMjozN0FNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAwMy4xMS4yMSAxMzowMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBXZWQsIE5vdiAwMywgMjAyMSBhdCAxMDozNjozNkFNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMDMuMTEuMjEgMTI6MzQsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+Pj4gT24gMDMuMTEuMjAyMSAxMToyNCwgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gd3JvdGU6DQo+Pj4+Pj4gT24gMDMuMTEuMjEgMTE6NDksIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4+PiBBaXVpIHlvdSB3YW50IHRvIHByZXZlbnQgdGhlIGd1ZXN0IGZyb20gY2xlYXJp
bmcgdGhlIGJpdCBpZiBlaXRoZXINCj4+Pj4+Pj4gTVNJIG9yIE1TSS1YIGFyZSBpbiB1c2UuIFN5
bW1ldHJpY2FsbHksIHdoZW4gdGhlIGd1ZXN0IGVuYWJsZXMgTVNJDQo+Pj4+Pj4+IG9yIE1TSS1Y
LCB5b3Ugd2lsbCB3YW50IHRvIGZvcmNlIHRoZSBiaXQgc2V0ICh3aGljaCBtYXkgd2VsbCBiZSBp
bg0KPj4+Pj4+PiBhIHNlcGFyYXRlLCBmdXR1cmUgcGF0Y2gpLg0KPj4+Pj4+IHN0YXRpYyB1aW50
MzJfdCBlbXVsYXRlX2NtZF9yZWcoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQzMl90
IGNtZCkNCj4+Pj4+PiB7DQo+Pj4+Pj4gICAgIMKgwqDCoCAvKiBUT0RPOiBBZGQgcHJvcGVyIGVt
dWxhdGlvbiBmb3IgYWxsIGJpdHMgb2YgdGhlIGNvbW1hbmQgcmVnaXN0ZXIuICovDQo+Pj4+Pj4N
Cj4+Pj4+PiAgICAgwqDCoMKgIGlmICggKGNtZCAmIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSkg
PT0gMCApDQo+Pj4+Pj4gICAgIMKgwqDCoCB7DQo+Pj4+Pj4gICAgIMKgwqDCoMKgwqDCoMKgIC8q
IEd1ZXN0IHdhbnRzIHRvIGVuYWJsZSBJTlR4LiBJdCBjYW4ndCBiZSBlbmFibGVkIGlmIE1TSS9N
U0ktWCBlbmFibGVkLiAqLw0KPj4+Pj4+ICNpZmRlZiBDT05GSUdfSEFTX1BDSV9NU0kNCj4+Pj4+
PiAgICAgwqDCoMKgwqDCoMKgwqAgaWYgKCBwZGV2LT52cGNpLT5tc2ktPmVuYWJsZWQgKQ0KPj4+
Pj4+ICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtZCB8PSBQQ0lfQ09NTUFORF9JTlRYX0RJ
U0FCTEU7DQo+Pj4+Pj4gI2VuZGlmDQo+Pj4+Pj4gICAgIMKgwqDCoCB9DQo+Pj4+Pj4NCj4+Pj4+
PiAgICAgwqDCoMKgIHJldHVybiBjbWQ7DQo+Pj4+Pj4gfQ0KPj4+Pj4+DQo+Pj4+Pj4gSXMgdGhp
cyB3aGF0IHlvdSBtZWFuPw0KPj4+Pj4gU29tZXRoaW5nIGFsb25nIHRoZXNlIGxpbmVzLCB5ZXMu
IEknZCBvbWl0IHRoZSBvdXRlciBpZigpIGZvciBjbGFyaXR5IC8NCj4+Pj4+IGJyZXZpdHkuDQo+
Pj4+IFN1cmUsIHRoYW5rIHlvdSENCj4+Pj4gQFJvZ2VyIGFyZSB5b3Ugb2sgd2l0aCB0aGlzIGFw
cHJvYWNoPw0KPj4+IFN1cmUsIEkgd291bGQgZXZlbiBkbzoNCj4+Pg0KPj4+ICNpZmRlZiBDT05G
SUdfSEFTX1BDSV9NU0kNCj4+PiBpZiAoICEoY21kICYgUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxF
KSAmJiBwZGV2LT52cGNpLT5tc2ktPmVuYWJsZWQgKQ0KPj4+IHsNCj4+PiAgIMKgwqDCoCAvKiBH
dWVzdCB3YW50cyB0byBlbmFibGUgSU5UeC4gSXQgY2FuJ3QgYmUgZW5hYmxlZCBpZiBNU0kvTVNJ
LVggZW5hYmxlZC4gKi8NCj4+PiAgICAgICBjbWQgfD0gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxF
Ow0KPj4+IH0NCj4+PiAjZW5kaWYNCj4+Pg0KPj4+IFRoZXJlJ3Mgbm8gbmVlZCBmb3IgdGhlIG91
dGVyIGNoZWNrIGlmIHRoZXJlJ3Mgbm8gc3VwcG9ydCBmb3IgTVNJLg0KPj4gT2ssIHNvdW5kcyBn
b29kIQ0KPj4gVGhhbmsgeW91IGJvdGghIQ0KPiBJbiBmYWN0IHlvdSBjb3VsZCBldmVuIHJlbW92
ZSB0aGUgY2hlY2sgZm9yICEoY21kICYNCj4gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFKSBhbmQg
YWx3YXlzIHNldCBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUgaWYNCj4gTVNJIGlzIGVuYWJsZWQs
IHdoaWNoIEkgdGhpbmsgaXMgd2hhdCBKYW4gd2FzIHBvaW50aW5nIHRvIGluIGhpcw0KPiBwcmV2
aW91cyByZXBseS4NCk9rLCBJIHdpbGwNCj4NCj4gUmVnYXJkcywgUm9nZXIuDQo+DQo=

