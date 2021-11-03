Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B7E443FF1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 11:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220737.382121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miDRa-0002lL-JD; Wed, 03 Nov 2021 10:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220737.382121; Wed, 03 Nov 2021 10:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miDRa-0002il-FM; Wed, 03 Nov 2021 10:24:34 +0000
Received: by outflank-mailman (input) for mailman id 220737;
 Wed, 03 Nov 2021 10:24:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UC4I=PW=epam.com=prvs=194164c520=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1miDRZ-0002if-3a
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 10:24:33 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b8e5e86-3c90-11ec-8564-12813bfff9fa;
 Wed, 03 Nov 2021 10:24:31 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A39GmRG011983;
 Wed, 3 Nov 2021 10:24:26 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3c3qnf89ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 10:24:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4018.eurprd03.prod.outlook.com (2603:10a6:208:73::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 10:24:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 10:24:22 +0000
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
X-Inumbo-ID: 3b8e5e86-3c90-11ec-8564-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtJ4EfRX1wqxcZJyH0PsjjjAAkTAnJ+4t91qqJ5wqGapOP5sbAM35WFnqMXMA73k8ZaPFJSNQcymC2yI7QAYFmTcydkP59eG7MlFbtX3muxMYdPZEwu2Z2bjc3KZQxqzuClowzuzeYEZy8p1JJb49MNWzLZOVIVf+I9GWGk+d5Uq3siDXNnP+IgKVhrhNzHwo2bmDrutBrDHhIwSlVSS/cpJYB4f4S1M1zCDQXifDrbPlDTYDjbl0rt14KXE+efSSbZbgayPwZfIguNnvU1DRPkpNwI88Gev89yiAIrR+gKLjWuYEKSFNnFypxRwG38p6Y3pVn/qBPkCxxZgdoLAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opBIV7xkbWO1guH4lOqoP/7+101OMdd4sMhZ3fe+6X4=;
 b=TVAxzJFzUC4eYgxxHrnn5NF/g1TBRWDNFlNCfzQVTPPUR7Pp7eIGmAUNp2NAXEQVhJUE1Vxj4BDA/fVh+of4SYzB9YgSr/F1/DF3riZQjXg8LfEqW+H6rkbqrbcSSU71OBcqC/YrOj/Tl1BGqe/msz2xohVWnJFP11JClNjck/d+q/mBfVpR7JQfVTC3zC5FAJZM2j1xAaP31sqOeS7ybfY3pILuaEUPJvARdte6tsiUbVNPFFnBHQT7ZT0CETUZVbU542dovfoPpJczL9DL0DpWuCpjDVb08naody5BXDUsbph4CX1Rtze1zDe3gZOMy92XP+lssxWmpMIntfMr3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opBIV7xkbWO1guH4lOqoP/7+101OMdd4sMhZ3fe+6X4=;
 b=TOTwtjCQSeg0I0uLdJjuHEpyaqiwvI+VlY+vF17kq6U3D7AFS/quXVDVYTuX5c0p/+5I2qpEgPFSMc3dBsuTCHwHWqHMcRx6y9FsXjbrajNKgM2p9doFWM7Vf4KwvjW8j4064aajsGXdXK6lJ++UcxD9v0bdVRjX6OU8xuNWdj98x5sKIVampB1ckvSEKR+Xt3lF55dTwW8L45wfvpTNwcytmeuarEv4zNfghjJrkMMoXvwSih2oejb14OH6y2Uue+CTohCt82q8uqHiT7RRBmsLUqJh28KJZt7o2jVT6xu+97ouH+S6SLFiKSnY+1eF1l3HVmS7F4UAMB+EM1GQhQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Michal Orzel <michal.orzel@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Index: 
 AQHXtdAkq8Qmwxr3HUWTio8KWsEpvKvlQ6KAgAsHq4CAAAimAIAAIt2AgAAEUICAATmxAIAABTcAgAABvgCAAAHkAIAAAZSAgAAFc4CAAAmcgA==
Date: Wed, 3 Nov 2021 10:24:22 +0000
Message-ID: <48506e1b-2dc9-4652-f169-3d44135a4e74@epam.com>
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
 <a5ff1c9b-3200-18f0-a373-7535980269cb@suse.com>
 <4d4a061f-6437-5d51-84e0-d2139f47eb76@epam.com>
 <4f77a4f2-a66b-465d-5859-7fe71ece8168@suse.com>
In-Reply-To: <4f77a4f2-a66b-465d-5859-7fe71ece8168@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6e1ef9d-4ad5-454b-3e7d-08d99eb41a7f
x-ms-traffictypediagnostic: AM0PR03MB4018:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB401883535123DB3CEAB153B3E78C9@AM0PR03MB4018.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 A6OCOq+ijjijEQIMZBukZ2OjcQ2ggxkB+o43eTV4iE8LJ6uJ0I9FQq3cTcgjRIV8fnAZlGjeCGvWDrADtgW59ziFgxhL38w9UthdtfhQxhDe073rnpYk1u33H/maF4dyyO8/eFoFGP5oQu1XHpRDMITBd5doD0gQqaU3EfSooig1mpdVVUbNVdpjtJzBgo3nVRl6Ni3f5C5xsciadG6V3ApM4KVKR9DjdbfZ/cLwEPIb2UqqXO3x0ZJXmvQ7tWmy2RhoM3b+D6glgq7zuZciAgaLKKgwO8M2pdUxy92LMJXZwUzSvquYEHtRGFZDMLHY/ev8kGOweM6NJ1kzeU8FwBI2mBgKjoJkreXr97JT9GJ9GXk4uH4hraNpGmjUb7k0SWfR926u1CgszznbeXnjrLgcFeaB3bWI80dYNeZCRLe1HDgCbVAl2AN1Fjg0HScvx2+zExB0Ng1d3z6PNkDtPmhg8zeAtWFdytRUCoPlpW1rsQng0Asuqh3Q2vYhw1oRY/xCuvqJrHpzRlBn4yGkFGOWHCIZFjvIznIjsZyVGHY0Q4UMs/jQIQLRlymveiHf2Xn6Wrx6RLxPmPdPCAn0d0G0O96zQrfsz/7e7HIbHf8S/6LkO/rpy9yOofijFlUxJafq6bnC6hFyTo/EL9oAVDB4/PLCO2Ny9lyfYzzLZKYZMfX3jVnjf+Oh+qJ/7aPs2+IthivszKO3teWOMYVvaBm2K4Y35/PbrF3/Ch/rf9b8QgsSDOkICbHsvk5AKbcz
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(66946007)(316002)(38070700005)(110136005)(26005)(107886003)(8936002)(508600001)(66556008)(54906003)(91956017)(66446008)(64756008)(66476007)(4326008)(83380400001)(186003)(5660300002)(2906002)(6506007)(53546011)(71200400001)(76116006)(6512007)(8676002)(36756003)(122000001)(38100700002)(86362001)(31686004)(6486002)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eElFMWR5Nnl6dTVlbHFiVEtMeEdYaE85Z1RBYlFSQlNFeEQ2bnJRWEVUZFc2?=
 =?utf-8?B?UVJNeTNLR1RrTkFjbHBxYW9mU2lmR290a0xqem5BZ28waGJiTzF1KzEvYm5S?=
 =?utf-8?B?bFpUU1l4U201RVcwQzRXK3BWNjF1bnp3VmoyYlZLcUxBem9kTitCeUI4Ynhm?=
 =?utf-8?B?UE5HZ0tCZ3prZk93ZWIrSEdOekdRanJFMitMOEhFaDEybFgreDQyT3BMWU1n?=
 =?utf-8?B?RTIrNjl1eHNKNzJwNzVCTU5PTlJNRjJiekdkREszcHRFTldndFFURVBKdysz?=
 =?utf-8?B?UDc1M3RTRzRMZ1dQVno3RCtMTGUwZytxZ1ZJMFR3U3N6OXRkWFc1QzFNWkpW?=
 =?utf-8?B?am1zR25DYm1aTEpoQ3BvU04veDEra0hDWmFpeFJwZ1NBaU5GUTZrSXViVWp3?=
 =?utf-8?B?V1FEZmxFSnUwOHJXZFBpUmFqMmFPQjBxQUpTNlJCOWR0Y0lOSkp3RERNQUNB?=
 =?utf-8?B?NFROQmxpaDN1a2NMdUNkTE81U1laUlM2ZTdXc3ZubjVDY3FUSSswQWxGTFdU?=
 =?utf-8?B?MUZaTFU1Z0sraUU1bmo3Z3lrZ3dtZWtKcmpoNVJrOTRhM3MySWp0Sko5SUlh?=
 =?utf-8?B?V2NCNW8wZXNGRUNWVHNvYzRDMjJqL21pL3ZYNGc3bUxITXI4MHNHNUk0cTNL?=
 =?utf-8?B?bFJHVCtweUtneDZPQ0tkazBwMEkvTTJqcHhadEdnUVJvejdHK3hSaTJydkZM?=
 =?utf-8?B?VW4velZYR2ZZNXBJOTZIMXB6dm91Wmc2YUNVTmtqSVZUcnpFeEN2RFNOT3Ew?=
 =?utf-8?B?bHJuaWNSOWtlN1Bic0JDNmZlTzBIVG5pNDVYeHUvTmhpUHFYSHhYbEZlbmIy?=
 =?utf-8?B?UmRuRHl0QkIvcUZWd0YweURnanpVazhTRWs3VjV4aW9GYUk0SzVKRXp6VjFD?=
 =?utf-8?B?cHRKWjRObW1lbzVJbi9JcDduaEFhTUtPekxhUE1YMnRIYWN0MFZuc1RYNUlE?=
 =?utf-8?B?Y2lGOUt1Zm1MVkVPNWtVdFZ0ZU9lVEF3NS92RE43QkRjQ0pSQTZGQ2x0a0hx?=
 =?utf-8?B?MzROY1p1V2tXdEduUU1XcXhpQi9iNkw1OUZleDJnWEM4d0JEL2NGREt1YmJM?=
 =?utf-8?B?bWFQejhtZkRHREJZazZWYjhJK2lpK25jbnFmOExvcUpoNEZyTFJOdWV6M2V1?=
 =?utf-8?B?ZUdMMzJtV0s0dUFkNXJKNTk3YWIycjZuWjJiYlRTWkxhNUM3Rm5UR3U4Ry9R?=
 =?utf-8?B?enBuZ24wdGZ4dmNoczB1M01hRmM1YzlyWExJeFdDc1M1R3pKRHRPTlAvbkw1?=
 =?utf-8?B?akNPWFYvRXVmTkV4N1NkdHZndkpGK08wQkJ6Wk5qQW4yM3ZpdDk4ZW1ITlR6?=
 =?utf-8?B?QmdnUDFMeGU3bXlYV28vR3BRRnh0WDhSdi9FQlN4ekI4QlJBSVlqYnhxN2NT?=
 =?utf-8?B?Q1h2VGhJMmRzR2tON0NKeDROaitpTEhaU1ZvYlFkV2lmNDRxVmQ0Qzl5VGhO?=
 =?utf-8?B?Y3R6NUh6bG1zcWxOVHF5YVIwckZITkIxT3I5MTA4anNrcTdRSXdyZ3EzUm1C?=
 =?utf-8?B?RCswTDd6NDFmYjJjQVF1KzRJbWUwYWlRSkY1bzRZbEhwdkRGOXFiVmtGQkFL?=
 =?utf-8?B?S3lHSXJwT0hlSTlkN3dvNFJUNU9oaHhZZ3hML3BJR04rT2FWR2Y3aHBQTS9y?=
 =?utf-8?B?MXo1a2daNW9SQVZrRDBIOWdXU0IzZVQ0aXB3eDdoT3NPRlBYZXdOVUlpbzRv?=
 =?utf-8?B?RFdmemRVelhaQUl0M1FEcW80NWhrMC9aYm1ZQ0FRTjA1dVFacUIzS2w1M2ZP?=
 =?utf-8?B?TENtMU1zV0JuaVJiMHdOTjJHWVM1UFNFZzVkMThUaE5OOUcxbkZhdzBKWkJm?=
 =?utf-8?B?bSszdU1LSkdZd0lIKzBzdG56Sm9TMU1IOWxPWm1XTWtnRXo2RmZzTlZkaHhO?=
 =?utf-8?B?cGlsZmhNTFM5UjZOWjhaV2ZaL3RGWmN3U2hqVEhlaDZsTzA2YkNzT1FlaENP?=
 =?utf-8?B?c2l4QUpjelBWZk9WT2dRQ0lzNnJVV1EyQVc4NmxjUEViVXpTeWtxKzhxZk9S?=
 =?utf-8?B?WDFFMlllRzl5TXBOaTVGUnFNVmxBeVBydFRSa0JJYVVCbEhPa01hWEtxM2Rk?=
 =?utf-8?B?eFMrRkc1VHV5YjRMbHdYd1QxcnJYOUs2bjB5NU5Dd013OVp5eHhjbnNKOUx0?=
 =?utf-8?B?aFZhR2lQWWNNZ0FvNThFVzBwVGE2Y096VXdqcEpUZlNEa2tUU0gvMkU1ZXZs?=
 =?utf-8?B?ek15V3FGR0pSdUIzd3NEeExqOWlrenFvZDZZQVl1cC9mYzU3V3BlYjFUSDJP?=
 =?utf-8?B?eTZSRWFOK2t6ay9CUVVnWHJzMkdlMG02MytZL2JCUklEQnBDQ3NsWWxkVkZL?=
 =?utf-8?B?OENhQko1MnZjcFpYNkJHVlNQdC9aRnRQazFKbHdhY2Zrc1Q0R3ZFUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F47737C50AD664882B113252D02658E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e1ef9d-4ad5-454b-3e7d-08d99eb41a7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 10:24:22.3433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7RxWvT7xFBWMmMkLyiZNYHtWO7ZkYWlRmUHBSAeVNhK7IFgBTCZWqaSkpI4rwaGddqnxKT0DojTYNkmm/Kqkl3qWfx31cW6W/L3i7haIsKBI90DIBfBYSCLSfUa2BwHg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4018
X-Proofpoint-ORIG-GUID: JOqCHvpwbAwhoXvZtxODVep-YL_-XXLL
X-Proofpoint-GUID: JOqCHvpwbAwhoXvZtxODVep-YL_-XXLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_03,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=933 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111030058

DQoNCk9uIDAzLjExLjIxIDExOjQ5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDMuMTEuMjAy
MSAxMDozMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDMuMTEu
MjEgMTE6MjQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAzLjExLjIwMjEgMTA6MTgsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwMy4xMS4yMSAxMToxMSwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwMy4xMS4yMDIxIDA5OjUzLCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAwMi4xMS4yMSAxNjoxMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+IE9uIDAyLjExLjIxIDE1OjU0LCBKYW4gQmV1bGlj
aCB3cm90ZToNCj4+Pj4+Pj4+IE9uIDAyLjExLjIwMjEgMTI6NTAsIFJvZ2VyIFBhdSBNb25uw6kg
d3JvdGU6DQo+Pj4+Pj4+Pj4gT24gVHVlLCBOb3YgMDIsIDIwMjEgYXQgMTI6MTk6MTNQTSArMDEw
MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+Pj4+IE9uIDI2LjEwLjIwMjEgMTI6NTIsIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4+Pj4+PiBPbiBUaHUsIFNlcCAzMCwgMjAyMSBh
dCAxMDo1MjoyMEFNICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+
Pj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4+Pj4+Pj4gKysr
IGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+Pj4+Pj4+IEBAIC00NTEsNiArNDUx
LDMyIEBAIHN0YXRpYyB2b2lkIGNtZF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
dW5zaWduZWQgaW50IHJlZywNCj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgIHBjaV9jb25mX3dy
aXRlMTYocGRldi0+c2JkZiwgcmVnLCBjbWQpOw0KPj4+Pj4+Pj4+Pj4+ICAgICAgIH0NCj4+Pj4+
Pj4+Pj4+PiAgICAgICANCj4+Pj4+Pj4+Pj4+PiArc3RhdGljIHZvaWQgZ3Vlc3RfY21kX3dyaXRl
KGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+Pj4+Pj4+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgY21kLCB2b2lkICpkYXRh
KQ0KPj4+Pj4+Pj4+Pj4+ICt7DQo+Pj4+Pj4+Pj4+Pj4gKyAgICAvKiBUT0RPOiBBZGQgcHJvcGVy
IGVtdWxhdGlvbiBmb3IgYWxsIGJpdHMgb2YgdGhlIGNvbW1hbmQgcmVnaXN0ZXIuICovDQo+Pj4+
Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+Pj4+ICsgICAgaWYgKCAoY21kICYgUENJX0NPTU1BTkRfSU5U
WF9ESVNBQkxFKSA9PSAwICkNCj4+Pj4+Pj4+Pj4+PiArICAgIHsNCj4+Pj4+Pj4+Pj4+PiArICAg
ICAgICAvKg0KPj4+Pj4+Pj4+Pj4+ICsgICAgICAgICAqIEd1ZXN0IHdhbnRzIHRvIGVuYWJsZSBJ
TlR4LiBJdCBjYW4ndCBiZSBlbmFibGVkIGlmOg0KPj4+Pj4+Pj4+Pj4+ICsgICAgICAgICAqICAt
IGhvc3QgaGFzIElOVHggZGlzYWJsZWQNCj4+Pj4+Pj4+Pj4+PiArICAgICAgICAgKiAgLSBNU0kv
TVNJLVggZW5hYmxlZA0KPj4+Pj4+Pj4+Pj4+ICsgICAgICAgICAqLw0KPj4+Pj4+Pj4+Pj4+ICsg
ICAgICAgIGlmICggcGRldi0+dnBjaS0+bXNpLT5lbmFibGVkICkNCj4+Pj4+Pj4+Pj4+PiArICAg
ICAgICAgICAgY21kIHw9IFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRTsNCj4+Pj4+Pj4+Pj4+PiAr
ICAgICAgICBlbHNlDQo+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4+Pj4+Pj4+ICsgICAg
ICAgICAgICB1aW50MTZfdCBjdXJyZW50X2NtZCA9IHBjaV9jb25mX3JlYWQxNihwZGV2LT5zYmRm
LCByZWcpOw0KPj4+Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4+PiArICAgICAgICAgICAgaWYgKCBj
dXJyZW50X2NtZCAmIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSApDQo+Pj4+Pj4+Pj4+Pj4gKyAg
ICAgICAgICAgICAgICBjbWQgfD0gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFOw0KPj4+Pj4+Pj4+
Pj4+ICsgICAgICAgIH0NCj4+Pj4+Pj4+Pj4+IFRoaXMgbGFzdCBwYXJ0IHNob3VsZCBiZSBBcm0g
c3BlY2lmaWMuIE9uIG90aGVyIGFyY2hpdGVjdHVyZXMgd2UNCj4+Pj4+Pj4+Pj4+IGxpa2VseSB3
YW50IHRoZSBndWVzdCB0byBtb2RpZnkgSU5UeCBkaXNhYmxlIGluIG9yZGVyIHRvIHNlbGVjdCB0
aGUNCj4+Pj4+Pj4+Pj4+IGludGVycnVwdCBkZWxpdmVyeSBtb2RlIGZvciB0aGUgZGV2aWNlLg0K
Pj4+Pj4+Pj4+PiBXZSBjYW5ub3QgYWxsb3cgYSBndWVzdCB0byBjbGVhciB0aGUgYml0IHdoZW4g
aXQgaGFzIE1TSSAvIE1TSS1YDQo+Pj4+Pj4+Pj4+IGVuYWJsZWQgLSBvbmx5IG9uZSBvZiB0aGUg
dGhyZWUgaXMgc3VwcG9zZWQgdG8gYmUgYWN0aXZlIGF0IGEgdGltZS4NCj4+Pj4+Pj4+Pj4gKElP
VyBzaW1pbGFybHkgd2UgY2Fubm90IGFsbG93IGEgZ3Vlc3QgdG8gZW5hYmxlIE1TSSAvIE1TSS1Y
IHdoZW4NCj4+Pj4+Pj4+Pj4gdGhlIGJpdCBpcyBjbGVhci4pDQo+Pj4+Pj4+Pj4gU3VyZSwgYnV0
IHRoaXMgY29kZSBpcyBtYWtpbmcgdGhlIGJpdCBzdGlja3ksIGJ5IG5vdCBhbGxvd2luZw0KPj4+
Pj4+Pj4+IElOVFhfRElTQUJMRSB0byBiZSBjbGVhcmVkIG9uY2Ugc2V0LiBXZSBkbyBub3Qgd2Fu
dCB0aGF0IGJlaGF2aW9yIG9uDQo+Pj4+Pj4+Pj4geDg2LCBhcyBhIGd1ZXN0IGNhbiBkZWNpZGUg
dG8gdXNlIE1TSSBvciBJTlR4LiBUaGUgZWxzZSBicmFuY2ggbmVlZHMNCj4+Pj4+Pj4+PiB0byBi
ZSBBcm0gb25seS4NCj4+Pj4+Pj4+IElzbid0IHRoZSAiZWxzZSIgcGFydCBxdWVzdGlvbmFibGUg
ZXZlbiBvbiBBcm0/DQo+Pj4+Pj4+IEl0IGlzLiBPbmNlIGZpeGVkIEkgY2FuJ3Qgc2VlIGFueXRo
aW5nIEFybSBzcGVjaWZpYyBoZXJlDQo+Pj4+Pj4gV2VsbCwgSSBoYXZlIGxvb2tlZCBhdCB0aGUg
Y29kZSBvbmUgbW9yZSB0aW1lIGFuZCBldmVyeXRoaW5nIHNlZW1zIHRvDQo+Pj4+Pj4gYmUgb2sg
d3J0IHRoYXQgc3RpY2t5IGJpdDogd2UgaGF2ZSAyIGhhbmRsZXJzIHdoaWNoIGFyZSBjbWRfd3Jp
dGUgYW5kDQo+Pj4+Pj4gZ3Vlc3RfY21kX3dyaXRlLiBUaGUgZm9ybWVyIGlzIHVzZWQgZm9yIHRo
ZSBoYXJkd2FyZSBkb21haW4gYW5kIGhhcw0KPj4+Pj4+ICpubyByZXN0cmljdGlvbnMqIG9uIHdy
aXRpbmcgUENJX0NPTU1BTkQgcmVnaXN0ZXIgY29udGVudHMgYW5kIHRoZSBsYXRlcg0KPj4+Pj4+
IGlzIG9ubHkgdXNlZCBmb3IgZ3Vlc3RzIGFuZCB3aGljaCBkb2VzIGhhdmUgcmVzdHJpY3Rpb25z
IGFwcGxpZWQgaW4NCj4+Pj4+PiBlbXVsYXRlX2NtZF9yZWcgZnVuY3Rpb24uDQo+Pj4+Pj4NCj4+
Pj4+PiBTbywgZm9yIHRoZSBoYXJkd2FyZSBkb21haW4sIHRoZXJlIGlzIG5vICJzdGlja3kiIGJp
dCBwb3NzaWJsZSBhbmQgZm9yIHRoZQ0KPj4+Pj4+IGd1ZXN0IGRvbWFpbnMgaWYgdGhlIHBoeXNp
Y2FsIGNvbnRlbnRzIG9mIHRoZSBQQ0lfQ09NTUFORCByZWdpc3Rlcg0KPj4+Pj4+IGhhcyBQQ0lf
Q09NTUFORF9JTlRYX0RJU0FCTEUgYml0IHNldCB0aGVuIHRoZSBndWVzdCBpcyBlbmZvcmNlZCB0
bw0KPj4+Pj4+IHVzZSBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUgYml0IHNldC4NCj4+Pj4+Pg0K
Pj4+Pj4+IFNvLCBmcm9tIGhhcmR3YXJlIGRvbWFpbiBQT1YsIHRoaXMgc2hvdWxkIG5vdCBiZSBh
IHByb2JsZW0sIGJ1dCBmcm9tDQo+Pj4+Pj4gZ3Vlc3RzIHZpZXcgaXQgY2FuLiBMZXQncyBpbWFn
aW5lIHRoYXQgdGhlIGhhcmR3YXJlIGRvbWFpbiBjYW4gaGFuZGxlDQo+Pj4+Pj4gYWxsIHR5cGVz
IG9mIGludGVycnVwdHMsIGUuZy4gSU5UeCwgTVNJLCBNU0ktWC4gSW4gdGhpcyBjYXNlIHRoZSBo
YXJkd2FyZQ0KPj4+Pj4+IGRvbWFpbiBjYW4gZGVjaWRlIHdoYXQgY2FuIGJlIHVzZWQgZm9yIHRo
ZSBpbnRlcnJ1cHQgc291cmNlIChhZ2Fpbiwgbm8NCj4+Pj4+PiByZXN0cmljdGlvbiBoZXJlKSBh
bmQgcHJvZ3JhbSBQQ0lfQ09NTUFORCBhY2NvcmRpbmdseS4NCj4+Pj4+PiBHdWVzdCBkb21haW5z
IG5lZWQgdG8gYWxpZ24gd2l0aCB0aGlzIGNvbmZpZ3VyYXRpb24sIGUuZy4gaWYgSU5UeCB3YXMg
ZGlzYWJsZWQNCj4+Pj4+PiBieSB0aGUgaGFyZHdhcmUgZG9tYWluIHRoZW4gSU5UeCBjYW5ub3Qg
YmUgZW5hYmxlZCBmb3IgZ3Vlc3RzDQo+Pj4+PiBXaHk/IEl0J3MgdGhlIERvbVUgdGhhdCdzIGlu
IGNvbnRyb2wgb2YgdGhlIGRldmljZSwgc28gaXQgb3VnaHQgdG8NCj4+Pj4+IGJlIGFibGUgdG8g
cGljayBhbnkgb2YgdGhlIHRocmVlLiBJIGRvbid0IHRoaW5rIERvbTAgaXMgaW52b2x2ZWQgaW4N
Cj4+Pj4+IGhhbmRsaW5nIG9mIGludGVycnVwdHMgZnJvbSB0aGUgZGV2aWNlLCBhbmQgaGVuY2Ug
aXRzIG93biAiZGlzbGlrZSINCj4+Pj4+IG9mIElOVHggb3VnaHQgdG8gb25seSBleHRlbmQgdG8g
dGhlIHBlcmlvZCBvZiB0aW1lIHdoZXJlIERvbTAgaXMNCj4+Pj4+IGNvbnRyb2xsaW5nIHRoZSBk
ZXZpY2UuIFRoaXMgd291bGQgYmUgZGlmZmVyZW50IGlmIFhlbidzIHZpZXcgd2FzDQo+Pj4+PiBk
aWZmZXJlbnQsIGJ1dCBhcyB3ZSBzZWVtIHRvIGFncmVlIFhlbidzIHJvbGUgaGVyZSBpcyBzb2xl
bHkgdG8NCj4+Pj4+IHByZXZlbnQgaW52YWxpZCBjb21iaW5hdGlvbnMgZ2V0dGluZyBlc3RhYmxp
c2hlZCBpbiBoYXJkd2FyZS4NCj4+Pj4gT24gdG9wIG9mIGEgUENJIGRldmljZSB0aGVyZSBpcyBh
IHBoeXNpY2FsIGhvc3QgYnJpZGdlIGFuZA0KPj4+PiBwaHlzaWNhbCBidXMgdG9wb2xvZ3kgd2hp
Y2ggbWF5IGltcG9zZSByZXN0cmljdGlvbnMgZnJvbQ0KPj4+PiBEb20wIFBPViBvbiB0aGF0IHBh
cnRpY3VsYXIgZGV2aWNlLg0KPj4+IFdlbGwsIHN1Y2ggcGh5c2ljYWwgcmVzdHJpY3Rpb25zIG1h
eSBtZWFuIElOVHggZG9lc24ndCBhY3R1YWxseSB3b3JrLA0KPj4+IGJ1dCB0aGlzIHdvbid0IG1l
YW4gdGhlIERvbVUgaXNuJ3QgZnJlZSBpbiBjaG9vc2luZyB0aGUgYml0J3Mgc2V0dGluZy4NCj4+
PiBUaGUgYml0IG1lcmVseSBjb250cm9scyB3aGV0aGVyIHRoZSBkZXZpY2UgaXMgYWxsb3dlZCB0
byBhc3NlcnQgaXRzDQo+Pj4gaW50ZXJydXB0IHBpbi4gSGVuY2UgLi4uDQo+Pj4NCj4+Pj4gU28s
IGV2ZXJ5IFBDSSBkZXZpY2UNCj4+Pj4gYmVpbmcgcGFzc2VkIHRocm91Z2ggdG8gYSBEb21VIG1h
eSBoYXZlIGRpZmZlcmVudCBJTlR4DQo+Pj4+IHNldHRpbmdzIHdoaWNoIGRvIGRlcGVuZCBvbiBE
b20wIGluIG91ciBjYXNlLg0KPj4+IC4uLiBJJ20gc3RpbGwgdW5jb252aW5jZWQgb2YgdGhpcy4N
Cj4+IE9rLCBzbyBJIGNhbiBhY2NlcHQgYW55IHN1Z2dlc3Rpb24gaG93IHRvIHNvbHZlIHRoaXMu
IEl0IHNlZW1zIHRoYXQNCj4+IHdlIGFscmVhZHkgaGF2ZSBudW1iZXIgb2Ygbm8gZ28gc2NlbmFy
aW9zIGhlcmUsIGJ1dCBzdGlsbCBpdCBpcyBub3QNCj4+IGNsZWFyIHRvIG1lIHdoYXQgY291bGQg
YmUgYW4gYWNjZXB0YWJsZSBhcHByb2FjaCBoZXJlLiBOYW1lbHk6DQo+PiB3aGF0IGRvIHdlIGRv
IHdpdGggSU5UeCBiaXQgZm9yIGd1ZXN0cz8NCj4+IDEuIEkgY2FuIGxlYXZlIGl0IGFzIGlzIGlu
IHRoZSBwYXRjaA0KPj4gMi4gSSBjYW4gcmVtb3ZlIElOVHggZW11bGF0aW9uIGFuZCBsZXQgdGhl
IGd1ZXN0IGRlY2lkZSBhbmQgcHJvZ3JhbSBJTlR4DQo+PiAzLiBXaGF0IGVsc2UgY2FuIEkgZG8/
DQo+IEFpdWkgeW91IHdhbnQgdG8gcHJldmVudCB0aGUgZ3Vlc3QgZnJvbSBjbGVhcmluZyB0aGUg
Yml0IGlmIGVpdGhlcg0KPiBNU0kgb3IgTVNJLVggYXJlIGluIHVzZS4gU3ltbWV0cmljYWxseSwg
d2hlbiB0aGUgZ3Vlc3QgZW5hYmxlcyBNU0kNCj4gb3IgTVNJLVgsIHlvdSB3aWxsIHdhbnQgdG8g
Zm9yY2UgdGhlIGJpdCBzZXQgKHdoaWNoIG1heSB3ZWxsIGJlIGluDQo+IGEgc2VwYXJhdGUsIGZ1
dHVyZSBwYXRjaCkuDQpzdGF0aWMgdWludDMyX3QgZW11bGF0ZV9jbWRfcmVnKGNvbnN0IHN0cnVj
dCBwY2lfZGV2ICpwZGV2LCB1aW50MzJfdCBjbWQpDQp7DQogwqDCoMKgIC8qIFRPRE86IEFkZCBw
cm9wZXIgZW11bGF0aW9uIGZvciBhbGwgYml0cyBvZiB0aGUgY29tbWFuZCByZWdpc3Rlci4gKi8N
Cg0KIMKgwqDCoCBpZiAoIChjbWQgJiBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUpID09IDAgKQ0K
IMKgwqDCoCB7DQogwqDCoMKgwqDCoMKgwqAgLyogR3Vlc3Qgd2FudHMgdG8gZW5hYmxlIElOVHgu
IEl0IGNhbid0IGJlIGVuYWJsZWQgaWYgTVNJL01TSS1YIGVuYWJsZWQuICovDQojaWZkZWYgQ09O
RklHX0hBU19QQ0lfTVNJDQogwqDCoMKgwqDCoMKgwqAgaWYgKCBwZGV2LT52cGNpLT5tc2ktPmVu
YWJsZWQgKQ0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY21kIHw9IFBDSV9DT01NQU5EX0lOVFhf
RElTQUJMRTsNCiNlbmRpZg0KIMKgwqDCoCB9DQoNCiDCoMKgwqAgcmV0dXJuIGNtZDsNCn0NCg0K
SXMgdGhpcyB3aGF0IHlvdSBtZWFuPw0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

