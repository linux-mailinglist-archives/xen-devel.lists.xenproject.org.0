Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D4124FEB5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 15:20:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kACOY-00023C-Gb; Mon, 24 Aug 2020 13:20:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZpN=CC=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kACOX-000236-5N
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 13:20:17 +0000
X-Inumbo-ID: 21b8918c-83cd-431d-bf2d-393a94091984
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::60b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21b8918c-83cd-431d-bf2d-393a94091984;
 Mon, 24 Aug 2020 13:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/whKHvReUJkukC1USPnzJ3NaQVpbCLd1klSq2qPxQE=;
 b=m7lIGrFxkqIuIw0s6GsNQltoKIoQawhdhZowT9DM51dg8I3HPSeOkVntxKZQdyVC02jv6mQEAWVNS670JSuZiXK6fbkzdkgjFCcafHK9JlzTUxrlZBE5HgpNpTZSI/FTQEdUcpJ9twKPmq7KVUGg2d+O7V17V5vnfWcY8yWXTiw=
Received: from MRXP264CA0044.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::32)
 by AM0PR08MB3986.eurprd08.prod.outlook.com (2603:10a6:208:128::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 13:20:13 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::55) by MRXP264CA0044.outlook.office365.com
 (2603:10a6:500:14::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Mon, 24 Aug 2020 13:20:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 13:20:12 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Mon, 24 Aug 2020 13:20:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c1a00a6642546d5e
X-CR-MTA-TID: 64aa7808
Received: from 28691be3390c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CC696945-F51E-4BCF-A5FC-48D089F39806.1; 
 Mon, 24 Aug 2020 13:19:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 28691be3390c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Aug 2020 13:19:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZC24t8bEI9O60FQ5PqG6YeJVyFfEs82tDAVZl7IDeBlj90mpjlqyagt311XfmhMjiJ2EfxJ6mTo7rkUXgRCYr1yed1f0wNvDyMrHn9sBk0D0Ei0FrrL3Y88YfXzDP1FKpolrf6Df5XTNtVUw9/tM5dqqnqNP7ABLikV/KMxiAMlLJ8uYxjn5XVJx7epxYatcqFpLszM99gM5jBMgZCMReas/2cAGAupgahKjgiqGx1xKH9+UGZpPeQQe/iIyQYW5BkWWn+gb/3zzzZ57BtjXGqoUEqEUNQ/YFiMvToKWiy6L4nTJONq885bmoPANwDoWqpaSSYVzNh9cTCNMkIEppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/whKHvReUJkukC1USPnzJ3NaQVpbCLd1klSq2qPxQE=;
 b=TMzOjJyUvBrdkU5z2KuUwvdoWiuZFallywut4ktTlE+cGwioHZRDsI/GUbuzn0zjlXqz1tGcSNl7FUQVnm6TGLXWNIT7mM6GtCakCptKWdlVMBBd8/+3+HNelED8zeU1zHjNplcnTao0NZeWT/rDsY5TzOGlG58e+8qyGBrhWqremUnYR/pcDGMSmlqUhaSI8K3DK0AC7bTZE5OJYSwTxDmv7wbdvEFpE4SYnL7fXeBapbjZxCodUJmCWkNnypoQxFsaW/vkwTtTWZOZRiSSNacs51ZexWrEekoGAzINNmF3Rd/qqKZiAgwRfG7/IAV9dv7/t9UTfmjlqIk3c+dlig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/whKHvReUJkukC1USPnzJ3NaQVpbCLd1klSq2qPxQE=;
 b=m7lIGrFxkqIuIw0s6GsNQltoKIoQawhdhZowT9DM51dg8I3HPSeOkVntxKZQdyVC02jv6mQEAWVNS670JSuZiXK6fbkzdkgjFCcafHK9JlzTUxrlZBE5HgpNpTZSI/FTQEdUcpJ9twKPmq7KVUGg2d+O7V17V5vnfWcY8yWXTiw=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2694.eurprd08.prod.outlook.com (2603:10a6:6:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 13:19:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 13:19:33 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Wei Chen <Wei.Chen@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Andre Przywara
 <Andre.Przywara@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Kaly Xin
 <Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: Re: [PATCH v2 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Topic: [PATCH v2 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Index: AQHWecazJFpryBm0PEiL+drgXPmkLqlHPtuA
Date: Mon, 24 Aug 2020 13:19:33 +0000
Message-ID: <C15DB003-60D2-4380-92E2-1BCDAFF3D930@arm.com>
References: <20200824032825.18368-1-wei.chen@arm.com>
 <20200824032825.18368-3-wei.chen@arm.com>
In-Reply-To: <20200824032825.18368-3-wei.chen@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cc5fdc8a-3f76-4a69-cdef-08d848306ebd
x-ms-traffictypediagnostic: DB6PR08MB2694:|AM0PR08MB3986:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB39865764EFA91343B17B024B9D560@AM0PR08MB3986.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1360;OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WLQHdwa+rHC6/hGUyr85cwmayPdYptlqV8apZ+StsSByBvsgj1zj4SA6DfL6Pymbo7ipEsjG6P4kSrtk1X/5ivtNJFjNO087OOWIM6vY6BgzjFzU1L1XRJaKis+W8x9O9RCA778OqwTNk92f+Ht7FZYrCteJyRBXIFBrEYBeyDsScGu3ZYnhTFMcZyFSTZKGk9lkyDVt9/0aJ0DBEx9GikgRSu2dQDq0W+SR/M+P2GMYxd4/+NrM3sitDBIvh+pzE+0S0hEqOVA+Oaz5BySbtgxMzOxnn+bPO47ffSqWwAeMBUjxef3VHDfrEvuIYw3gSouv0Hr3nRkWk9cf7CFyEg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(5660300002)(6486002)(33656002)(316002)(186003)(54906003)(53546011)(36756003)(37006003)(26005)(2906002)(6506007)(15650500001)(83380400001)(66476007)(64756008)(66446008)(6636002)(478600001)(91956017)(76116006)(6862004)(71200400001)(6512007)(8936002)(8676002)(66946007)(86362001)(66556008)(4326008)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: jXH8rudmnY828Jh0eKvBWUpI7zC5tU32B47B2lPmreKDieuejjnc/vB7xAJV65eeZu57aR9nzgFWgjvFtJMz7X7OnUiRTRcBuKmHPn6H+q3nAQcSCNJ4oAKNI2HMbZ5WRfBlVeW3pMThHZdJ6gkkqlSle1Sdx7W/cWFpJQvPWmrJLOJ4WcOLHm60GNhmGcosWk6xBDmxTwfqVSMBuZjb/a75vrzEOQLFML0ZEHtyQH7uT4eFCvoeuhWgpbkFe9AOTN6Oa/r5mgNJfWGkNNVqFBnbnBc6KutjA4d7mwxSSZN9l6l0ru4vwHjmS+ATkJ8XTRxycOmp/jx3vJI4yZ0eO9B4o0Y0si633KjleKbjHfiqvhLEVxxx7DorIziYAyJWQqXqqulx+POqqYwl8Dw78NoxA2/f1qdWDbFL9yLAZpfw5xf6Amb/jf66Xn9u4Pchx/gjlkTSY4Tm28yVPvZD9FIAgIWaGErRp0m54YjwafYB/o23nwyeM2JcHDB/5FE9exuFUkWkM3o93/n3ZLlThBf06tU/foPD2xteq0neFLS4CLh34Blas3qTtbXMH0PYJLYTR1hicc4MG94zueVPA6PebKP0uOXaUm3i642wR4GCXwh40r7ZBQIgGeKIoOLA8xnUaPOj5jDWrgrHKNT0cw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <00DE9490685D304A8516FFC23AEA7929@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2694
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2adfa87d-2318-4409-1ad3-08d8483057ae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sq1qgdzGxfcQNq18qg06e7qFKMJf5mFWNoKCbuRRnnXHtknyPf4XUBOX/gVMXbbjmGwV6SIq43bda6RKMm2df83vD7QzvQ1+ozY9x26OLRqWyYXVBqIiZMFztS3J4l9yD/3onE7chPRkXv6czBsX4Vn75DrD22VUuWfgqqSIKpCjpqZFUVdM1NJsvj/KgyQPEA/rQzTW9JIzvoMPt5b5EJ5HmiD8rkKPdeWMepwNmNQPH07YhiLS2Iji2FBnWeGN95mMCL5swYfdz+XlHqnZ6vKnrVeaHyFJWymKAV66JlPYXZayTmCgXTKSBUuIOaagyPcrdW95OGEtmTPoeAt9CxwYThXMhXvG4pvSB/2t7GGpXkfjBkwB/QIydimroRx87dI+mSO7EJVUYlCnAXYqTg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(37006003)(8936002)(36906005)(8676002)(6486002)(5660300002)(336012)(54906003)(478600001)(15650500001)(47076004)(36756003)(53546011)(316002)(6506007)(2906002)(186003)(26005)(81166007)(82310400002)(6862004)(2616005)(33656002)(6512007)(4326008)(82740400003)(356005)(70586007)(6636002)(70206006)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 13:20:12.5195 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5fdc8a-3f76-4a69-cdef-08d848306ebd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3986
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

> On 24 Aug 2020, at 04:28, Wei Chen <Wei.Chen@arm.com> wrote:
>=20
> Arm ID_AA64PFR0_EL1 register provides two fields to describe CPU
> FP/SIMD implementations. Currently, we exactly know the meaning of
> 0x0, 0x1 and 0xf of these fields. Xen treats value < 8 as FP/SIMD
> features presented. If there is a value 0x2 bumped in the future,
> Xen behaviors for value <=3D 0x1 can also take effect. But what Xen
> done for value <=3D 0x1 may not always cover new value 0x2 required.
> We throw these messages to break the silence when Xen detected
> unknown FP/SIMD IDs to notice user to check.
>=20
> Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> xen/arch/arm/setup.c | 26 ++++++++++++++++++++++++--
> 1 file changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 7968cee47d..c7802d0e49 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -99,6 +99,28 @@ static const char * __initdata processor_implementers[=
] =3D {
>     ['i'] =3D "Intel Corporation",
> };
>=20
> +static const char * __initdata fp_implements[] =3D {
> +    "Floating-point",
> +    "Floating-point + half-precision floating-point arithmetic",
> +    "Floating-point Unknown ID 0x2",
> +    "Floating-point Unknown ID 0x3",
> +    "Floating-point Unknown ID 0x4",
> +    "Floating-point Unknown ID 0x5",
> +    "Floating-point Unknown ID 0x6",
> +    "Floating-point Unknown ID 0x7",
> +};
> +
> +static const char * __initdata advsimd_implements[] =3D {
> +    "AdvancedSIMD",
> +    "AdvancedSIMD + half-precision floating-point arithmetic",
> +    "AdvancedSIMD Unknown ID 0x2",
> +    "AdvancedSIMD Unknown ID 0x3",
> +    "AdvancedSIMD Unknown ID 0x4",
> +    "AdvancedSIMD Unknown ID 0x5",
> +    "AdvancedSIMD Unknown ID 0x6",
> +    "AdvancedSIMD Unknown ID 0x7",
> +};
> +
> static void __init processor_id(void)
> {
>     const char *implementer =3D "Unknown";
> @@ -129,8 +151,8 @@ static void __init processor_id(void)
>            cpu_has_el1_32 ? "64+32" : cpu_has_el1_64 ? "64" : "No",
>            cpu_has_el0_32 ? "64+32" : cpu_has_el0_64 ? "64" : "No");
>     printk("    Extensions:%s%s%s\n",
> -           cpu_has_fp ? " FloatingPoint" : "",
> -           cpu_has_simd ? " AdvancedSIMD" : "",
> +           cpu_has_fp ? fp_implements[boot_cpu_feature64(fp)] : "",
> +           cpu_has_simd ? advsimd_implements[boot_cpu_feature64(simd)] :=
 "",
>            cpu_has_gicv3 ? " GICv3-SysReg" : "");
>=20
>     printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
> --=20
> 2.17.1
>=20


