Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A740A07276
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 11:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867997.1279536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpUP-0007y0-0j; Thu, 09 Jan 2025 10:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867997.1279536; Thu, 09 Jan 2025 10:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpUO-0007vG-UF; Thu, 09 Jan 2025 10:10:08 +0000
Received: by outflank-mailman (input) for mailman id 867997;
 Thu, 09 Jan 2025 10:10:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FDwX=UB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tVpUN-0007rU-29
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:10:07 +0000
Received: from outbound.mail.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [2a01:111:f403:2613::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3a33591-ce71-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 11:10:02 +0100 (CET)
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AM9PR08MB6180.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Thu, 9 Jan
 2025 10:09:59 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 10:09:58 +0000
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
X-Inumbo-ID: e3a33591-ce71-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzhHYg4LqFCJlaiwmaYo+lXeb4z0yV5rm3XiwlObOEYbYVSb2IwgSyTkI2EfEWFpnVDJjjOvsqraPEYR0vWcjSRydL3o95GoQ+sj5ppVswG/iUOuZu5cFvLpQE7LR9bjmAI7Dzg+tvnaWMpxGeEBfUzqeXEVbCcYl2Csxw7b3DIHRh55MtkrhygMSN7ClE6QuFLo3yOm0NleZyc5WSXvz4uMOCS+TuP66NuKfCKDqsRmtjQ84wrGI6N76LV/ebyCG5y11Ou5NUJIFNwLL/mrxNTp8mX4VE/Zp2/qkUfv1LNDd9FRzoyv+GJvxEDLnCyfbxGAL63CIeUATHTjKsMnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKxiY85iOdYzyELpJW++TTgyoEqWft1bhoqEQ22Et30=;
 b=pSVSWa5dtUXRF3/Fxuu6dgztWX05bTuvEpg8bLUf+azMHIr1FwkUSoVIll3QDITNADlG1xOiLqZ/8lMY+KYcDAUrLJA6B/TeI+Qi2E9ZL+NQdl4KG0HX0x1a8Q4sx93j5X2NTbJdnu6SMjqw1Z2fnVbYM4UYsXtdtpkRGBanCxh1b0NoSU6x+6s4Cn+YjH5W23g3Cjn76tu1d7ss6/nZ44oI94vYGDZibgDUSkrx3dsmjbRFji9mP4N1+tKYHmrtkEv31WQxINjGHn2rY0387B+OiqMXivn3SsrMSjBZhempFlAGGTNgbeLVMVOGULEjsE9+UziCx1n2PrvuD2TE8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKxiY85iOdYzyELpJW++TTgyoEqWft1bhoqEQ22Et30=;
 b=NBrfPvBXGeuT/j4efzjPbitycDyQ8mm4CPi0UDDZLzbJA92GnnKDPAa5joGQYHce0OxVKmhDbigDq/Ojjf8zb7ioWxDjWxZ0nfkHdezUQ/Ln+9XyWI0HT2xF7r4BevHO0j7+Vg1JmRVlLUW6I1NYRDI+H55IcdIOinW+hWOIqCQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2] xen/arm: Fully initialise struct membanks_hdr fields
Thread-Topic: [PATCH v2] xen/arm: Fully initialise struct membanks_hdr fields
Thread-Index: AQHbYnjhSKvjiFv/ZkKm32Sq0WkbbrMONdAAgAACYAA=
Date: Thu, 9 Jan 2025 10:09:58 +0000
Message-ID: <7D68D11E-E4EF-4521-9017-112DAA2B9B11@arm.com>
References: <20250109092816.1619834-1-luca.fancellu@arm.com>
 <e9477b85-1c9a-4aa6-b7fe-90286fcd461b@amd.com>
In-Reply-To: <e9477b85-1c9a-4aa6-b7fe-90286fcd461b@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR08MB5798:EE_|AM9PR08MB6180:EE_
x-ms-office365-filtering-correlation-id: b77417a7-8b2e-48a7-743f-08dd3095c628
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bZDTHJdAItntTwVFtAYbnW4JpFc0dYRD4TTdZE+XOpmhqcQGwq5qSF05JlH4?=
 =?us-ascii?Q?t3CdKksv9qS2n1A+t6cK1tFd09GUxM3nQ34nwEPrwGUNNxe3wP+zzdVbiK9g?=
 =?us-ascii?Q?5FDNnnKd6WZRLS0LbnJGLHrdYk/6PKdN2ew93bFCo44E+ujbj4qHm/SKVnHd?=
 =?us-ascii?Q?afoMpK9lJYIFYzP/pBV3Jccv/+pv6cRIUQM8xclGdYvmiHTCueha4r/70Z0A?=
 =?us-ascii?Q?WK96HdEhZSESel20wj3LleGp4CLOcT9ao38uXFqRJW9bUsC555Qd103oJM0l?=
 =?us-ascii?Q?Xx0y5iyxPAy9+7L/45xFjkOVl8yjjPEp8zARnkwUoOxeXXQPH0PnJZcwbyOb?=
 =?us-ascii?Q?zp8HahOliPJkcV/bwQdRJ1RMHUEG47dodc5GtxOdL8Rt/5ScaOs4XlJJLmcR?=
 =?us-ascii?Q?fLOIIWia3MZQDx5eeqSeKg0httaEWddoaPOZndfEC5g5Zx19yx9HxMsCqVTG?=
 =?us-ascii?Q?dwub/2ZQtmAZ1FVfp7/bIIjtkRs2tELIJhJr/b0UOBL2//b/YhLa2vB9sBQX?=
 =?us-ascii?Q?5a8Sjmh2/lSPUzNDje4C1kcDgo+64vkGcILqa9Yrph2o/Cmp8y1Pi2+3JAaU?=
 =?us-ascii?Q?85ODmw93irHwSdKPNNvSs85ThqS8K/6AXj4BLkL3WCDWjVygDWNtGRl45TUd?=
 =?us-ascii?Q?dZY+hkHai5rznreKuGo0XpDVSr/WGTkBSdwU1ZFZMcqPNsqGV/JEDrnDjShF?=
 =?us-ascii?Q?tGF6gwy/5KjjbF3Ui3AwojjQwUCCAPIwo5RGH6w5qSIdeV0e7SY61iSu6ags?=
 =?us-ascii?Q?T2sMnqJsd+452nAkUP7G8YBlSZGr8a/7zKQAsYWgxeYwIpPu9CieA+eGByDa?=
 =?us-ascii?Q?Wb3MUrz8aVDfyJfvPJg3tBZpWxtJfOnL1pUMiVHDnl9k8BA98RTeqDToi91Z?=
 =?us-ascii?Q?6ai4WyqVdmTA0iXs62CXkBeFVM20BmaFRNSGAF9dK/fYnvNIMTG4v51lSLTS?=
 =?us-ascii?Q?xzwx45nisMgu7poWAdgYfalsaZbF8GsbWRgS1FyCnk5sDFSfF2suo3IE7/kd?=
 =?us-ascii?Q?Mpbv0HGGv0sZxw9WpfYHXMhlFBOgZwIfd1ZZuJvXc0E+asVDVXh9CheGH444?=
 =?us-ascii?Q?qwgDmarft/zOagVPUv0Nj+QAn9nZyma6LWYDVT94BXowePxe5NYU+LxNMW7g?=
 =?us-ascii?Q?jv8HKMZKRvSoaxJ63LQA/mG8HmLbfqVUrNPrC3qRxih8H95d5cLPf0a4yCLo?=
 =?us-ascii?Q?O0LMewu8/KAt4xbANsYu2FnAKoUggwuRk3WFcL+kvKYUbbPMsAmxwfbCjaDN?=
 =?us-ascii?Q?Phd1736EvCmTj7sYpLr23h68ftzHshacRYfeWZ7UJMIzBgORFd9dm1g0n+iz?=
 =?us-ascii?Q?1NLUIqwgMRWi0q4GfbLe7TMVLNJEHfbrbkigu7mGbw11yGvkPfGdZk9FbGCk?=
 =?us-ascii?Q?AW6UZzsHPMSus2TYgtPmH1xmywzChzHeGPYZRW51zkFBpjArD7kp9gEXLO+9?=
 =?us-ascii?Q?1o0JYa0JW5T6Rt99tq+vVnh09AhQh2Wo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MCevzd3AvwstkvAvm4k0Y4JaXe3WhvBOLmLX2ndNDiMSLleD51hbgLnoI1fb?=
 =?us-ascii?Q?m5OkeEo4rO3DjjQRH202u05MAY1ANRqJ1Ib2QfE0kitRUmykm2MzutX+T0+b?=
 =?us-ascii?Q?rbwIliLCwsfFnVLJ6P9GS+k7IonHKhOYJJugkiuXFOj73wGHr3FfBzqdrn+j?=
 =?us-ascii?Q?pb2U0ztkQQKMjOyZz38F+Go/2xqu/v/6qqnXRd6bwa2qqL8jQTboU6anrbZe?=
 =?us-ascii?Q?X8hTPwNgGufj0brhm+JqeSYRyuQBPkw+HvSzu6OG/jeKdsEcpjRxizyHXdb4?=
 =?us-ascii?Q?rF5d+4Aiyaj9qeVesWLDWWhIDJ78Qri4H4DakYROqzj4LGZqq9zQ/g2YZFiy?=
 =?us-ascii?Q?5eNtN7DRGWZjxkq4Id/Wy8wDG2p8RVRjLgD2ficdXqsgwmjA8ZiprW/LT7bz?=
 =?us-ascii?Q?ycB7RWkkdWmSqnnsoU09AdI+gseEoIN9bq7TS8+N9t2sqSpkQWGZROG3hwKx?=
 =?us-ascii?Q?I3PCAMjmIvmc/bkYBsQ3qAiIY2y0SAJx74WB25bQ0cAkG7fvQpoyQBySHuuR?=
 =?us-ascii?Q?iMuCJryxYZbrEJPrU76fajFXMlbfAKxfnSDgYPL3khHEeKcHvj2d1CVK1XY9?=
 =?us-ascii?Q?cEU+aUZ5+FBRQzSUkSq8EHiRzNgqIdfNVr4Jv87qTGWQlKvv2GAfF+wU2yaC?=
 =?us-ascii?Q?RA6TCYHSHc6NiS6LkoPaZ4RwMa0+9YTbyl6nh7qiPrHjrfYPbz9dVnrrIl8N?=
 =?us-ascii?Q?GrrSn/DGcbSC+JUyTCtVuqhLrKOJWnEAXnHxDBKbZfgPRyM8eRvZ/O9mZzt2?=
 =?us-ascii?Q?68hNJEdrq+aaZP3qnrxgbn4G+GQ619sNn+LaB5TNKYCWwwAx4y3A7k/+IJC+?=
 =?us-ascii?Q?dLGHhcDDK4JVEnnPANg4qj06sSZNr2MpMO8oS7jnMHknujoGoxbYNpH9tmnt?=
 =?us-ascii?Q?ELCL4Gzfywn+LxaZVvALDw2HNGI4m4tG82H7tkR8+c71x9YkfBl0Ay6x5x3Q?=
 =?us-ascii?Q?cBTGWjD3VbEhjK3AMogOOL7r42PwvPKL8WTAOGeeTlKA1VSQ2dgIR4FLaVYs?=
 =?us-ascii?Q?Q4R6EA5Zli1i2CiFJn9XsUkAv8fJTBGAksDEpDl9WmmPODdM+rJyl5zlvGxN?=
 =?us-ascii?Q?Wm9T6CuFOaEQJxfjIMG9yGI7jrVcAvgIYHffPk14bRMsvCeTW3cPb5lcen6z?=
 =?us-ascii?Q?3FoYFTAaw6rcrXZ4Q7FXFp57IrqqqNd/VgPMrfHlU3GIdhnnFKuW5/C9QEQ7?=
 =?us-ascii?Q?2/rzF4aUXFjokuxpWJ9pkluDFO5qLucOuZvWCaVcS5eUJmRwhfnDT/4p9c2J?=
 =?us-ascii?Q?iyIjUDyQ9mwtMD7a7BrddJieFuZs6GzOec4VKOPwkfbYjtqUUZqV09ekeMSB?=
 =?us-ascii?Q?g6XzCirzL7SLUwPpaq1FBHq8gr52TNMxaeOK73lN5dgLC//l0ZnDpYqQ5thM?=
 =?us-ascii?Q?RKwcf8iXd0HJdIm8YqTAeIsYil7SHCfY/p+mbzF5SCIpulVVxfWC6ONY3fpK?=
 =?us-ascii?Q?HMQLTowTVPAapJSnKp2aR34ALMJQOwStKKX8Dl6RD7nLsxH8Plb1QylypSSD?=
 =?us-ascii?Q?GAi47c6O80xCbCdwkV4Y9sILImNOeSazNNsQr+t6/ukiyu2xpnS/diKzI2Fg?=
 =?us-ascii?Q?KIszKFEc4MNTfV95ugfjt6vJXa1Tl2+gSdbTVV4bUUM64Tr4njMe757oxYev?=
 =?us-ascii?Q?Lw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E15CEAA1474D1A4799E48C2CF04BE450@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77417a7-8b2e-48a7-743f-08dd3095c628
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 10:09:58.8696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNOxBahMu6nOVxx8Z6rfM3hPBrJvRo8X7u0e4Dwgwn5N/lKbpaw9f8oThwmL4ERO8NpavDFfUQJ+KNhA1n7fZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6180

Hi Michal,

> On 9 Jan 2025, at 10:00, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Luca,
>=20
> Is this patch for 4.20? I would say so, therefore it should have "for-4.2=
0" tag and Oleksii as release manager
> should be CCed. Doing it now.

Thanks, I forgot the procedure

>=20
>> ---
>> ---
>> xen/arch/arm/domain_build.c       | 13 ++++---------
>> xen/arch/arm/include/asm/kernel.h |  5 ++++-
>> xen/arch/arm/static-shmem.c       |  3 ++-
>> xen/include/xen/bootfdt.h         | 16 ++++++++++++++++
>> 4 files changed, 26 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index b072a16249fe..9e3132fb21d8 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1039,7 +1039,7 @@ void __init allocate_memory(struct domain *d, stru=
ct kernel_info *kinfo)
>>      */
>>     if ( is_hardware_domain(d) )
>>     {
>> -        struct membanks *gnttab =3D xzalloc_flex_struct(struct membanks=
, bank, 1);
>> +        struct membanks *gnttab =3D membanks_xzalloc(1, RESERVED_MEMORY=
);
>>         /*
>>          * Exclude the following regions:
>>          * 1) Remove reserved memory
>> @@ -1057,13 +1057,10 @@ void __init allocate_memory(struct domain *d, st=
ruct kernel_info *kinfo)
>>         gnttab->bank[0].start =3D kinfo->gnttab_start;
>>         gnttab->bank[0].size =3D kinfo->gnttab_size;
>>=20
>> -        hwdom_free_mem =3D xzalloc_flex_struct(struct membanks, bank,
>> -                                             NR_MEM_BANKS);
>> +        hwdom_free_mem =3D membanks_xzalloc(NR_MEM_BANKS, MEMORY);
>>         if ( !hwdom_free_mem )
>>             goto fail;
>>=20
>> -        hwdom_free_mem->max_banks =3D NR_MEM_BANKS;
>> -
>>         if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_ba=
nks),
>>                                      hwdom_free_mem, add_hwdom_free_regi=
ons) )
>>             goto fail;
>> @@ -1293,7 +1290,7 @@ static int __init find_host_extended_regions(const=
 struct kernel_info *kinfo,
>>                                              struct membanks *ext_region=
s)
>> {
>>     int res;
>> -    struct membanks *gnttab =3D xzalloc_flex_struct(struct membanks, ba=
nk, 1);
>> +    struct membanks *gnttab =3D membanks_xzalloc(1, RESERVED_MEMORY);
>>=20
>>     /*
>>      * Exclude the following regions:
>> @@ -1374,12 +1371,10 @@ int __init make_hypervisor_node(struct domain *d=
,
>>     }
>>     else
>>     {
>> -        ext_regions =3D xzalloc_flex_struct(struct membanks, bank, NR_M=
EM_BANKS);
>> +        ext_regions =3D membanks_xzalloc(NR_MEM_BANKS, RESERVED_MEMORY)=
;
> I'm a bit confused what is the expectations behind using different types =
of enum region_type, mostly because it can point to
> different address spaces depending on the context. Above, you marked gntt=
ab as RESERVED_MEMORY (I guess because this
> region has already been found - but in fact it is still unused) and hwdom=
_free_mem as MEMORY. So I would at least expect
> ext_regions to be of MEMORY type as well. After all both hwdom_free_mem a=
nd ext_regions contain
> banks of unused/free memory (although former lists host memory while latt=
er can also contain guest physical
> memory). Could you please clarify the intended use?

You are right, that should be MEMORY, my bad! Could it be something address=
able on commit or should I send another one?

Cheers,
Luca


