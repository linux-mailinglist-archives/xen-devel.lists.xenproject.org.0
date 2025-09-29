Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CC0BAAC22
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 01:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133393.1471522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3NPt-0006lL-0c; Mon, 29 Sep 2025 23:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133393.1471522; Mon, 29 Sep 2025 23:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3NPs-0006i6-Su; Mon, 29 Sep 2025 23:36:24 +0000
Received: by outflank-mailman (input) for mailman id 1133393;
 Mon, 29 Sep 2025 23:36:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yW6c=4I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v3NPr-0006dW-Vn
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 23:36:24 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b2c5f83-9d8d-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 01:36:22 +0200 (CEST)
Received: from PH7P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::21)
 by IA1PR12MB7663.namprd12.prod.outlook.com (2603:10b6:208:424::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 23:36:15 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::a8) by PH7P221CA0026.outlook.office365.com
 (2603:10b6:510:32a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 29 Sep 2025 23:36:15 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 23:36:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 29 Sep
 2025 16:36:12 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Sep
 2025 18:36:12 -0500
Received: from [172.18.5.186] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 29 Sep 2025 16:36:11 -0700
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
X-Inumbo-ID: 1b2c5f83-9d8d-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHoxdNpi2lHkCSUPPhQHKBfEZgSz2rdnUsk8xZlequs+C9rTJ8yf9Xas6yRWToHZ9qyn+4+ptyyWmzWciwkpp90vo7Hq0DIpusf5QZ/UH8MDGYd8vT5pJNI9CKH9ZoPdZv+rFYUeQysc+yxf3eBOBgpUliNS6rrOj82sgVVa/45vOxhrtxPRpakvkbItVwpBjS9HklQwP31cCgKrxZnbIZbZAn6/E+2AbOp7KY3Jm+KMYpYip42Ob1nJY+fGX0M660XiI7cnqbQfGeU0hNNTQI2pfkU8OsfRmgylfBZbIrynMoFciKfATSkwSSQp3dgiE4vuyBbF82fOeFKslWep8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrvGxInsz7lDVevik18YGd1tnHZPsAU+GrVZlq+lKU0=;
 b=uJoMkU/MVNXXTXoG4g76uixS1gLF/lT4NElndemAUAgLPUGpGsrJM+vQzwL/i2gsqVxIwQ4uvQVmUAGAB5srSf+ZM7VmYEGQbo6/HUFwuXUd51LAX3Qch0OBXWMww9SXmPHiYaqhrNjrQ6MPkvMNF39apWdzF8dzdasx3yTBUmcssGTmTxeex71q9aTpAgTS44VfDqCPCafqZ8t43Fn1S18JL/rGvllFwbjSx8BWB7pSwelzfEKZsvAhX65pYmKrh9woXTtMzpnCGgidbh1vT89H8zBUmHgA/PTiJf3x0ysRt4UGnFbzd4QiiWE9u+APZ3y+sydR1J+bRHFt0zR+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrvGxInsz7lDVevik18YGd1tnHZPsAU+GrVZlq+lKU0=;
 b=yVwPXvEQvvYivEi/R5GTK8ebKebcHhX5/ZqXOmMrwFoiFS0Ji2UECwjrhv1tQtb6p8OJjlGAIdVk+UlTyB0+WrUq/LcZ3KzP7RrYKnlFjNz7w5E1USHyEeDgPvYKbYh4/W9dee7fM5OsKpdMZFPuXa0yZMA5fgLzUg40KvwTHuk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1439ec29-4319-43d0-b4ff-0eb5bfe9405b@amd.com>
Date: Mon, 29 Sep 2025 19:36:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: guard synthetic feature and bug enumerators
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <48dcc0e0-2772-49b9-9383-5bf69f922053@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <48dcc0e0-2772-49b9-9383-5bf69f922053@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|IA1PR12MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 251839ad-2d34-483e-3e04-08ddffb0fb0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUV1Y0pleUNiZU9McGwwT1hKUncrZHZRT3VRTGE0eVNBcldnUHpPVzZ6bnMr?=
 =?utf-8?B?WE9iZCtlNjlZMEZWdGFPU3RDWENPZ1M1ajFZaG5PNzFFRU4zU0ZJNWNaL1VQ?=
 =?utf-8?B?aVJjV2gxSFVrelREdWV0UkJGTXBMc0h5NDR4eVVWSUZhdWY5S2p1VzVFYks0?=
 =?utf-8?B?dVFha09ibzB2N1VQdlJ6eWpwcU8yQmtzWlFXeUZXSUZJRlBKNmQ4eGtOaURu?=
 =?utf-8?B?MENwRGQwWG03SmtwYUpWTGlvWkFza2xSWm85NURWbmQycUhRdlU1RDVRcW5v?=
 =?utf-8?B?aXpKakFjWExmK1RBNE5zWU5NQmIrREFHSzlFRUJKci9KTWN0QldqMlpVQUJ6?=
 =?utf-8?B?SGZ4cmhTeEd6RHRUSFRIUENMc2d3NW5zRmhqVnhtZHVYTzM2WEZ3U1l5YktK?=
 =?utf-8?B?SDRDR3huWG1lMUMvSy9FSlVnYUVlbDZaemswcDdJenREVkxibmNaZ1hsb2py?=
 =?utf-8?B?M1pqUVZkcFFYQUpZalprZXUxUGRxdnZkUlRoUTVnM3JaYmxLL0lzZUpCNXlu?=
 =?utf-8?B?SzRMSURvT29Gd0ExM25nSWZvYUd6ckNsakMyR2ZMczhpblVjbnJqeWFZNEtD?=
 =?utf-8?B?Mkt6MHl1S0gxN3BMU3ExNjdPQjZ3aGRYQnBmYWFqakdYVVZMbkk5UUdiaWRy?=
 =?utf-8?B?cFdjb0xNL2Q0UzJlSDJ2WktRQ1l5Q2x6aUY3bkxRRnVwOVJPTXpLSlpFSFhP?=
 =?utf-8?B?THM3Z01VVFFwcjNRNEtCcDhacnVYN0psSExZamg5UnZ3T0VUWHdmTzNTZnhV?=
 =?utf-8?B?M295Z1REWjFxVHNmNUlJVlFYMjNCb3pSYTBmb0dBRFl5alNyMUtQbmFQa3FQ?=
 =?utf-8?B?Sk44N2FBczllazZuSHE5NEdsM1BROTF6ai9BZnI4QmlNUmRHOGFUczhZU3VX?=
 =?utf-8?B?VXo4OFVseWE2UFJjdU1zUUxqWVZickJEN3FsbkZQck03Mmg3cEZVcnBwQ2Mr?=
 =?utf-8?B?ejVFdS9oSUswa1FDUDNSaUFza3g0OEJoaSsxTVZXdVM2ajVTc0FJN24rMDZm?=
 =?utf-8?B?cGI5NEkydTNpb0JuakVjbG5zMUx5ck1Iekp2YTB2b0h0aWRDenA3WGFscnFX?=
 =?utf-8?B?bnl5ZVNyOEJML2lhSGhMRWVsWlFMZXNXQWJZVkJXYnpCeCthalRJWWpXaHB6?=
 =?utf-8?B?V0lreG9NZXBLUFpNNXJJd1Nya2s5bnB6ckt3L3dXTkh6T1dlSzNjV0NrN3VT?=
 =?utf-8?B?dVZucTRzNDB1eWMzVllPQUhFWlN6VU5mK0VVbmtQdDJUa3NHQWl5dDZtRDlF?=
 =?utf-8?B?U0dxVFNHeU9pdWN0MG9lQmZYY1k3Ym9KYU5KQ2RjOXJ1dEFiUkhwK1YrR01N?=
 =?utf-8?B?Y1BsRkRNMEsya1o4VTV5ek1VOENNdUppRXRodHhFNjVHUmZsVTdBci9mQ3RM?=
 =?utf-8?B?cG05NlZrbTh6MThyZGZhaEhCeTdCbnRiZkVQb0c0RnBSdlJvbXYybkxITjdL?=
 =?utf-8?B?eEtKMzRDb0x3RSs1SWs1M2lQeFFmV2FYODJjQkZhUVZGeWwwWmRDMDZ5V3d3?=
 =?utf-8?B?Y1Y4T1d2N2NnWnlsTG9CbDF2elF4N1lvMmYxa0Q4M3gyRkZrQlA4eVFiZ1pp?=
 =?utf-8?B?WUNHZnRIOTRReWdqT3dFYXlrcGFKdUV1T0pqekxvaytjZGg4TXh1NGtPTE9p?=
 =?utf-8?B?Q2xubjRoMmJnVyszSXVTaWlUbjdianQxQzc3dTFuWFpCNEUxdDdkbjNLaVlj?=
 =?utf-8?B?dVE5ZjBpVWNkd2lOanl4NUJkZlNxUUNxWkkxbzQwcFV0NWs1aWhQcTRUYng0?=
 =?utf-8?B?U3RwY08wRmJpcEF0Yi9LbkVwNzJubnV2MW4yZlZPamg5aE4zVFMxUW1Id05i?=
 =?utf-8?B?UVh2OWhFVmhOdXNXMUViaUV4VkQ2b2wyb1hnR2g3SFNzTnk0VDRjbmd1eEdM?=
 =?utf-8?B?SiswaXFSOGJvMVh0QTVBckwvYjdkbFEwaGFXcldDUm9XRnhFdVV2aFQ4YUdZ?=
 =?utf-8?B?c1VYVG8rVlZGOFRQTjRwTnAyeGhwZzM2RTIvbTZIZHhsczFwMTVBQ3E4OVFQ?=
 =?utf-8?B?Nmd6Njc4aWFDaW5nbGlRMGlvbElSMStYbWpZN0xoWHBENFBURTFQNnFZc2sy?=
 =?utf-8?B?RU84NGN3bndJV3RMcXhyZ3lucGpURVQ3RHpxK2JFMFowSjJ3Z2ZwV0gzUXlY?=
 =?utf-8?Q?O7HE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 23:36:14.7125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 251839ad-2d34-483e-3e04-08ddffb0fb0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7663

On 2025-09-25 06:48, Jan Beulich wrote:
> While adding new enumerators one may overlook the (rare) need to bump
> X86_NR_{SYNTH,BUG}. Guard against that happening by adding respective
> checking. The use of BUILD_BUG_ON_ZERO(), however, entails a number of
> other changes, as the expansion may not appear in the assembly produced.
> Furthermore inputs to file-scope asm() are only supported in gcc15 (or
> newer).
> 
> No difference in generated code (debug info, however, grows quite a bit).
> 
> An implication from the changes is that users of the alternatives patching
> macros may not use unnamed asm() input operands anymore, as the "injected"
> new operands would break numbering expectations.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/include/asm/alternative.h
> +++ b/xen/arch/x86/include/asm/alternative.h
> @@ -70,12 +70,12 @@ extern void alternative_instructions(voi
>                       alt_repl_len(n2)) "-" alt_orig_len)
>   
>   #define ALTINSTR_ENTRY(feature, num)                                    \
> -        " .if (" STR(feature & ~ALT_FLAG_NOT) ") >= " STR(NCAPINTS * 32) "\n" \
> +        " .if (%c" #feature " & " STR(~ALT_FLAG_NOT) ") >= " STR(NCAPINTS * 32) "\n" \
>           " .error \"alternative feature outside of featureset range\"\n" \
>           " .endif\n"                                                     \
>           " .long .LXEN%=_orig_s - .\n"             /* label           */ \
>           " .long " alt_repl_s(num)" - .\n"         /* new instruction */ \
> -        " .word " STR(feature) "\n"               /* feature bit     */ \
> +        " .word %c" #feature "\n"                 /* feature bit     */ \
>           " .byte " alt_orig_len "\n"               /* source len      */ \
>           " .byte " alt_repl_len(num) "\n"          /* replacement len */ \
>           " .byte " alt_pad_len "\n"                /* padding len     */ \
> @@ -127,14 +127,14 @@ extern void alternative_instructions(voi
>    */
>   #define alternative(oldinstr, newinstr, feature)                        \
>       asm_inline volatile (                                               \
> -        ALTERNATIVE(oldinstr, newinstr, feature)                        \
> -        ::: "memory" )
> +        ALTERNATIVE(oldinstr, newinstr, [feat])                         \
> +        :: [feat] "i" (feature) : "memory" )
>   
>   #define alternative_2(oldinstr, newinstr1, feature1, newinstr2, feature2) \
>       asm_inline volatile (                                               \
> -        ALTERNATIVE_2(oldinstr, newinstr1, feature1,                    \
> -                      newinstr2, feature2)                              \
> -        ::: "memory" )
> +        ALTERNATIVE_2(oldinstr, newinstr1, [feat1],                     \
> +                      newinstr2, [feat2])                               \
> +        ::  [feat1] "i" (feature1), [feat2] "i" (feature2) : "memory" )
>   
>   /*
>    * Alternative inline assembly with input.
> @@ -148,14 +148,14 @@ extern void alternative_instructions(voi
>    */
>   #define alternative_input(oldinstr, newinstr, feature, input...)        \
>       asm_inline volatile (                                               \
> -        ALTERNATIVE(oldinstr, newinstr, feature)                        \
> -        :: input )
> +        ALTERNATIVE(oldinstr, newinstr, [feat])                         \
> +        :: [feat] "i" (feature), ## input  )
>   
>   /* Like alternative_input, but with a single output argument */
>   #define alternative_io(oldinstr, newinstr, feature, output, input...)   \
>       asm_inline volatile (                                               \
> -        ALTERNATIVE(oldinstr, newinstr, feature)                        \
> -        : output : input )
> +        ALTERNATIVE(oldinstr, newinstr, [feat])                         \
> +        : output : [feat] "i" (feature), ## input )
>   
>   /*
>    * This is similar to alternative_io. But it has two features and
> @@ -168,9 +168,9 @@ extern void alternative_instructions(voi
>   #define alternative_io_2(oldinstr, newinstr1, feature1, newinstr2,      \
>                            feature2, output, input...)                    \
>       asm_inline volatile (                                               \
> -        ALTERNATIVE_2(oldinstr, newinstr1, feature1,                    \
> -                      newinstr2, feature2)                              \
> -        : output : input )
> +        ALTERNATIVE_2(oldinstr, newinstr1, [feat1],                     \
> +                      newinstr2, [feat2])                               \
> +        : output : [feat1] "i" (feature1), [feat2] "i" (feature2), ## input )
>   
>   /* Use this macro(s) if you need more than one output parameter. */
>   #define ASM_OUTPUT2(a...) a
> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -6,9 +6,16 @@
>   /* Number of capability words covered by the featureset words. */
>   #define FSCAPINTS FEATURESET_NR_ENTRIES
>   
> +#if !defined(__ASSEMBLY__) && __GNUC__ >= 15
> +#include <xen/macros.h>
> +#define X86_CHECK_FEAT_NR(x, n) BUILD_BUG_ON_ZERO((x) / 32 >= X86_NR_ ## n)
> +#else
> +#define X86_CHECK_FEAT_NR(x, n) 0
> +#endif
> +
>   /* Synthetic words follow the featureset words. */
>   #define X86_NR_SYNTH 2
> -#define X86_SYNTH(x) (FSCAPINTS * 32 + (x))
> +#define X86_SYNTH(x) (FSCAPINTS * 32 + (x) + X86_CHECK_FEAT_NR(x, SYNTH))
>   
>   /* Synthetic features */
>   XEN_CPUFEATURE(CONSTANT_TSC,      X86_SYNTH( 0)) /* TSC ticks at a constant rate */
> @@ -47,7 +54,8 @@ XEN_CPUFEATURE(XEN_REP_MOVSB,     X86_SY
>   
>   /* Bug words follow the synthetic words. */
>   #define X86_NR_BUG 1
> -#define X86_BUG(x) ((FSCAPINTS + X86_NR_SYNTH) * 32 + (x))
> +#define X86_BUG(x) ((FSCAPINTS + X86_NR_SYNTH) * 32 + (x) + \
> +                    X86_CHECK_FEAT_NR(x, BUG))
>   
>   #define X86_BUG_FPU_PTRS          X86_BUG( 0) /* (F)X{SAVE,RSTOR} doesn't save/restore FOP/FIP/FDP. */
>   #define X86_BUG_NULL_SEG          X86_BUG( 1) /* NULL-ing a selector preserves the base and limit. */
> --- a/xen/arch/x86/include/asm/cpufeatureset.h
> +++ b/xen/arch/x86/include/asm/cpufeatureset.h
> @@ -12,8 +12,13 @@ enum {
>   };
>   #undef XEN_CPUFEATURE
>   
> +#if __GNUC__ >= 15
> +#define XEN_CPUFEATURE(name, value) asm (".equ X86_FEATURE_" #name ", %c0" \
> +                                         :: "i" (X86_FEATURE_##name));
> +#else
>   #define XEN_CPUFEATURE(name, value) asm (".equ X86_FEATURE_" #name ", " \
>                                            __stringify(value));
> +#endif
>   #include <public/arch-x86/cpufeatureset.h>
>   #include <asm/cpufeatures.h>
>   
> --- a/xen/arch/x86/include/asm/pdx.h
> +++ b/xen/arch/x86/include/asm/pdx.h
> @@ -13,9 +13,9 @@
>       asm_inline goto (                               \
>           ALTERNATIVE(                                \
>               "",                                     \
> -            "jmp %l0",                              \
> -            ALT_NOT(X86_FEATURE_PDX_COMPRESSION))   \
> -        : : : : label )
> +            "jmp %l1",                              \
> +            [feat])                                 \
> +        : : [feat] "i" (ALT_NOT(X86_FEATURE_PDX_COMPRESSION)) : : label )
>   
>   static inline unsigned long pfn_to_pdx(unsigned long pfn)
>   {
> --- a/xen/arch/x86/include/asm/spec_ctrl.h
> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
> @@ -73,7 +73,7 @@ static always_inline void spec_ctrl_new_
>   
>       /* (ab)use alternative_input() to specify clobbers. */
>       alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,
> -                      : "rax", "rcx");
> +                      "i" (0) : "rax", "rcx");

"i" (0) is to work around the trailing comma in alternative_input() and 
does nothing?

Thanks,
Jason

>   }
>   
>   extern int8_t opt_ibpb_ctxt_switch;
> @@ -163,7 +163,7 @@ static always_inline void __spec_ctrl_en
>        * (ab)use alternative_input() to specify clobbers.
>        */
>       alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_FEATURE_SC_RSB_IDLE,
> -                      : "rax", "rcx");
> +                      "i" (0) : "rax", "rcx");
>   }
>   
>   /* WARNING! `ret`, `call *`, `jmp *` not safe after this call. */
> --- a/xen/arch/x86/include/asm/tsc.h
> +++ b/xen/arch/x86/include/asm/tsc.h
> @@ -29,8 +29,7 @@ static inline uint64_t rdtsc_ordered(voi
>       alternative_io_2("lfence; rdtsc",
>                        "mfence; rdtsc", X86_FEATURE_MFENCE_RDTSC,
>                        "rdtscp",        X86_FEATURE_RDTSCP,
> -                     ASM_OUTPUT2("=a" (low), "=d" (high), "=c" (aux)),
> -                     /* no inputs */);
> +                     ASM_OUTPUT2("=a" (low), "=d" (high), "=c" (aux)));
>   
>       return (high << 32) | low;
>   }
> 
> 


