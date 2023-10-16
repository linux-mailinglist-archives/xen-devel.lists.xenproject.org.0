Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 344B17CAAF4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617644.960438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOFl-0005iC-OA; Mon, 16 Oct 2023 14:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617644.960438; Mon, 16 Oct 2023 14:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOFl-0005fP-Kx; Mon, 16 Oct 2023 14:07:29 +0000
Received: by outflank-mailman (input) for mailman id 617644;
 Mon, 16 Oct 2023 14:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsOFk-0005FT-Nf
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:07:28 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe02::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5614c3d5-6c2d-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 16:07:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8698.eurprd04.prod.outlook.com (2603:10a6:20b:43d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 14:07:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:07:24 +0000
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
X-Inumbo-ID: 5614c3d5-6c2d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFpWuq9uh5Q7rzkdfW+hgy+gVBdft7OtKzG3qLUvw1fPSeejFzQrOZXa+UBP3DGlACYIODSveF8mKOaQHaqcEDVJ9Br65XxRnwPFmXghdR4MTd8Ft+6IkffTPJ0kfTjr7lo0n8zMJguLYD0f+wBC05LkMTD+ZgvJI++1sKB0pe0Cm5RRkDo/weXdB9rmn5oTOnAA1O3zVQvMcf+ap92752ZSkDaGW/U9cxjTySPVpaozncadegTU7aX8bmz5lqxym2fH7CR34elzrDDRpYiLoNPRVMM+tJ4RU3z9sT7LI6fgKOAleI70xMf8mnpoxt/BzpW47AVSCAQ7cF9aEBZwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DC/iZACq1IhtCC9ycmUVHwFInpLVgtKuBqW7FqktnrU=;
 b=U4M+iR+Rd2pcWmCNzgLdZndeb/iGuf4Vbn5gQxp9CUbrWpS1VwkHTEqEqhkklyii+GJz/tWSnzxN4u3NBW7de+0GSH4fzmQsyefTmrorR/TE3I1N0XZsf0p7KMKqZl1SU/7IT1qfK2C/CfSfKQ3Jq/qT3oqpG7oSmdC7ETkFrr8dPOKL8p1V8eh75nYAtx3sNd2iYnEEgXCI3o9RsuRgHDATrxUCblynIJSE7sq1FiycpxTkqQlw3mlhmJGfSnqSnufrtdONx2Tv26YaN4JOnvnj6KMcOL088teb7uxRN5InCJt4hvxuozf8mz+rLfcN2K4rRWohgCrko+TXyZszOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DC/iZACq1IhtCC9ycmUVHwFInpLVgtKuBqW7FqktnrU=;
 b=Vw7NONb61YDNINwhwbHIN0/IgwIIWyXE/ENMeXpvCMVafJ35twdU+JGbIH/B0jAK/0Edne5aBJGofJN7QmEH3AIibOjsmB50fuzC8he7QnNIaWz4F4cPJ23Sjm2oJPSG/KOzygQ2R1h9sLcaHZ6OIn3+XTqbqUNc8f+ECKELklHzEnpZmLnRwSDbeig6sI3POX05YHezPgg1FOMj2iQiiaWyCpIzFWnj0buBRsDYanQpt512MoCJ+0hTl+ZQvozPoQwGO0UCQfP1lWNWHGtW5Sd0lFHEb7rabfQXqsUSvMjrigv0VMIvw6UhkV6cNwrP5/Smnw/+DKw5ZrU5Ywd/sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <879e6934-93b3-e260-770a-966cf8bcd2f8@suse.com>
Date: Mon, 16 Oct 2023 16:07:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18 v2] x86/pvh: fix identity mapping of low 1MB
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231013085654.2789-1-roger.pau@citrix.com>
 <9aaae72b-fdcc-b48b-1155-e1cb0401d7d1@suse.com> <ZS0_zPxGLwfsuVvX@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZS0_zPxGLwfsuVvX@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 41301884-2182-455b-f649-08dbce5138bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	13uo8AxoqhBFAEYyHzpBuJkAbjRSELlRrhPfw77Im7yjzterGHchC9meYJWXOjiQeD35OehmWgxvQOy7uJCTOBjKibdUIUYFWXaTS2sU/lsY56PFx/FIKWuTliVTvMiQNqEcVoPlDV2N0zxOXLXXbSNk+G3oSEZ+471sK/VNJACgAalcGAndUHYKDBPOLUCMeepyo4fKBwetXi1nR4/rF8E3AMYj1MeyWbGakhyjAiOXb5BLXMZTt9Pv6hMT17AkoM3c9LOaOE3w3PGWpAENRmhfRuS0PEkd6W6WtQt7IJyjcWVZzMmNyQwxrtiu6yLuzUo26L3dGbpt7wNA7DjVocS62D6ianAlf7JhqnqVF4t5cUDWiUV/aS9waU9VpCk9ZEAYrOu0m96CZZncpzBcq0B/RhogAdlxzSEi5YGHghgymUAMNP7dCco7wEd2LsOjFPFE1/niiG4KcSATMmXGp6KphsL1xBK6XRzapwb0tbmPlIcclRFclXWMShWGgAMi2D1upjTJAeekSEjN3+TSZsqyK0difBRw+ThxxJNXXD2i023YPZiH1mC6vmHGQCfWvph8Ogf7p1NtVNRuabSg5pYNhXfz8ZDou4xMwA5GScH97hljolWFGmHk8fVXxSo6UkmFYXlI00/+DlK8bcs9hw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(366004)(346002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2616005)(83380400001)(6512007)(54906003)(66556008)(66476007)(66946007)(8676002)(4326008)(316002)(8936002)(6916009)(53546011)(41300700001)(6506007)(5660300002)(478600001)(2906002)(6486002)(38100700002)(86362001)(31696002)(36756003)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDhYMHQyUTFKWGJ1MjRSYldrNSt2VmY1d29ZNmtrN1FKRkg1VW1McmMxWWJh?=
 =?utf-8?B?WTBlNU1Pc2dwL1hKS3lGV3FZNlVyR2FnU21YS0VBZ2drcWxIVzNGL2dtTi9F?=
 =?utf-8?B?L0g2OUIweGZDaG5Ca0NrNEpZLzJpd0F0THdtVmpuZ0oxTjd4cGh6ZVAyVnc0?=
 =?utf-8?B?WFVqSElKQ2ZwQnhqVDBIVVArM2IyTm5wU1c0YVk5Tll6Nk5Hajlvc0VLbmg0?=
 =?utf-8?B?OG9yUHZ0b25vMzQzakRsVHEvMzhSVHVmNForeHBVcUQ3N3hNRk93OUJLc1I1?=
 =?utf-8?B?QXY1T2RXQ0F2SzM1SzFibkd3d0RxWlo0Qjc2MzBucUN1OEJ4QVZNT3hqN2RH?=
 =?utf-8?B?MThtVm9ucWtFd09iSWVJbVBHSWN3S0NBaG9WM3hBd3ZHQmhQY3FxV3pmblZX?=
 =?utf-8?B?UG80NzJpaXlZM1k5Zk0wd25xVlVaTmxlMlVvYXZmMUxvZGh5bG1UZm1JYUwz?=
 =?utf-8?B?QmZTZXBhRmhCVjhkWXFaSTY2MmxBdWtxR2w4Q2NxSjlFSDJYWEFJcUpLZ2hU?=
 =?utf-8?B?SUhPMGQveElGOEpmT0FHTGdsNkxrOU02S2MzWTAyVWJIRnlUbUt2RWdZMlM3?=
 =?utf-8?B?THJJeXlteU1PL0pOaGp6KzV2MEUxalVEbldaU0tVL1VRUUxGckJqNTFmOTJy?=
 =?utf-8?B?aDVyM0MwOW1aVTQ0WmFoT1NBTzdNLzc5eFZkdjM2S3pzZUd0WlFrYks0RWJp?=
 =?utf-8?B?R0JkSS9UUXF4cjNSaDlEbUltUGRqcXhhUGhYSHprMjJWYzVhcExNbWJGM3M5?=
 =?utf-8?B?QzlLeGNBQnlJQTVSN2pCRmJXQU5CTE5KNGwzR3UvQ3NDTTVCZnQ1T3hKaGhr?=
 =?utf-8?B?dEEzRU9MT1dHOUlYQ1p3Z09ScFFPSWx2WElYWXNYZ1FxR2p3aUNzTFJWUEFN?=
 =?utf-8?B?M0hZWHdURWZ6ZHZ6OFNyczgzTHM2KzNycllMRzVKOGcrK1JTZDZmd2MrVldG?=
 =?utf-8?B?RzNIM1hSbC9YbThvWHNzQWtlS2x3QklhL2JsYmpETU1LWHVVTW1iL3RaaUlC?=
 =?utf-8?B?SUUrUDBQVEtqdTYvOWhKR1ovUTdXQTdlNlZwdThjdzV4c0hIdE8rWW1pNjdz?=
 =?utf-8?B?ZE8vMmY2UXcxMVpGNndxLzkvdlBjTnlsVjV0K21YeG5FZlVDYUNKRTczU1lK?=
 =?utf-8?B?bXQ3eTBjN1dGbUwxVzFxdkVHRlJ5NjVqdXNuNE4zMjlZUERkcDdrNk1SdGtZ?=
 =?utf-8?B?aXE4MHdobGd5VzNMRy8wU3IrNjNveldvZUFvQnpKNndzQ0F0aWRWVW5MMU1T?=
 =?utf-8?B?blFVbzBnTmlkeUVYUmNXaWUvMGdIVVNOcVhaQjFYRHhSakk5Q1hhT2M5dWVa?=
 =?utf-8?B?ZUt5aWN1bUNtR2lEdEdjNTZOUTVjVmZ4WTRTRllnYTlvYWlTdFpJUzZ3Nlpj?=
 =?utf-8?B?TXRBb3FoSThUeDNuRmh4L1poNXdmaW8rVGxsbzUwU2M5SEMyLzdrTE4vazNZ?=
 =?utf-8?B?WFB2UElaRjFzSjg2MEU1TXcvSXFoVklaTHlqeFROa1NSV0duaHY1U3MxYXNn?=
 =?utf-8?B?TEZYRGxIMUVnSDdlaG01L1ArMEV0YUZLUnczR1VYTDVHK3M0enJrWWtybjcw?=
 =?utf-8?B?SXhPaDkxaExDellhSGprWHpkOUltTm9QdEFMTEw2cjBXWTFNbkdCdkVpeUMv?=
 =?utf-8?B?UUVmN011dUN5U1JpTG9nL1FDa0VST0NhazRUQlJnVjkvSFRGaHM4SUhQSHFR?=
 =?utf-8?B?dVdqR3Vxd2V1a2xaQ0dWSDdtbTJlWnZ6clB4WDhDdVorZVA4d1FkZ3VRbHdY?=
 =?utf-8?B?WEE4VUVNMHh2emJGZGRZeHZVeEQ1c3pkNnJWZmt2dFU3SURYTndEYkdIelVO?=
 =?utf-8?B?OFpFK1JHL0ZQc1JsREN5WXBnd0ZFRXNVZThCNG1BNVBPTXUyaGczUXFnQlIy?=
 =?utf-8?B?bm50Nkp6YzQ5Tm5ZbnpQbFlNMjU4VkhjSUVwT2szWm8zR0RpQ3h3NVZGck85?=
 =?utf-8?B?MFUzQWc4b1dGTHF2Qno5MmdQcnR5SEFRM1ZxbmZjMHd3UldObUtKb3ZtNmZ6?=
 =?utf-8?B?WDUxZ2huK2xCMGRtTkc4ZEZHK1hUT3FXZkhBTTRNeWozOGt3R3F1UURyN1Zq?=
 =?utf-8?B?V0kyQ0tnaFR6QVV4c3lsR1RIM3NTTkhzT1g0VTY0TnZyT0RUdE40RW5DcW5C?=
 =?utf-8?Q?7nUhfEMURwcTpt/biR6oomIeG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41301884-2182-455b-f649-08dbce5138bd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:07:24.3752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nnB8cb8ivdg7UVvGF/t6RUxmdIEtk4eytrsKmS0c4KkEoKV6hBhAwfVmONdOXu9VDJhMtcZ2vwhPh3u6M3yOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8698

On 16.10.2023 15:51, Roger Pau Monné wrote:
> On Mon, Oct 16, 2023 at 03:32:54PM +0200, Jan Beulich wrote:
>> On 13.10.2023 10:56, Roger Pau Monne wrote:
>>> The mapping of memory regions below the 1MB mark was all done by the PVH dom0
>>> builder code, causing the region to be avoided by the arch specific IOMMU
>>> hardware domain initialization code.  That lead to the IOMMU being enabled
>>> without reserved regions in the low 1MB identity mapped in the p2m for PVH
>>> hardware domains.  Firmware which happens to be missing RMRR/IVMD ranges
>>> describing E820 reserved regions in the low 1MB would transiently trigger IOMMU
>>> faults until the p2m is populated by the PVH dom0 builder:
>>>
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0
>>>
>>> Those errors have been observed on the osstest pinot{0,1} boxes (AMD Fam15h
>>> Opteron(tm) Processor 3350 HE).
>>>
>>> Mostly remove the special handling of the low 1MB done by the PVH dom0 builder,
>>> leaving just the data copy between RAM regions.  Otherwise rely on the IOMMU
>>> arch init code to create any identity mappings for reserved regions in that
>>> range (like it already does for reserved regions elsewhere).
>>>
>>> Note there's a small difference in behavior, as holes in the low 1MB will no
>>> longer be identity mapped to the p2m.
>>
>> I certainly like the simplification, but I'm concerned by this: The BDA
>> is not normally reserved, yet may want accessing by Dom0 (to see the real
>> machine contents). We do access that first page of memory ourselves, so
>> I expect OSes may do so as well (even if the specific aspect I'm thinking
>> of - the warm/cold reboot field - is under Xen's control).
> 
> The BDA on the systems I've checked falls into a RAM area on the
> memory map, but if you think it can be problematic I could arrange for
> arch_iommu_hwdom_init() to also identity map holes in the low 1MB.

Hmm, this again is a case where I'd wish CPU and IOMMU mappings could
be different. I don't see reasons to try I/O to such holes, but I can
see reasons for CPU accesses (of more or less probing kind).

> Keep in mind this is only for PVH, it won't affect PV.

Of course.

Jan

