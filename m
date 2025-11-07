Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A0C3E155
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 02:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157299.1486120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHAvt-0001Sj-Om; Fri, 07 Nov 2025 01:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157299.1486120; Fri, 07 Nov 2025 01:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHAvt-0001Qn-M0; Fri, 07 Nov 2025 01:06:29 +0000
Received: by outflank-mailman (input) for mailman id 1157299;
 Fri, 07 Nov 2025 01:06:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkPj=5P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vHAvr-0001Qh-8t
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 01:06:27 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8979da6-bb75-11f0-980a-7dc792cee155;
 Fri, 07 Nov 2025 02:06:21 +0100 (CET)
Received: from MN0PR02CA0007.namprd02.prod.outlook.com (2603:10b6:208:530::15)
 by PH7PR12MB5925.namprd12.prod.outlook.com (2603:10b6:510:1d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 01:06:15 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:530:cafe::be) by MN0PR02CA0007.outlook.office365.com
 (2603:10b6:208:530::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 01:06:10 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 01:06:15 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 6 Nov
 2025 17:06:14 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 6 Nov
 2025 17:06:14 -0800
Received: from [172.27.250.45] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 6 Nov 2025 17:06:13 -0800
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
X-Inumbo-ID: f8979da6-bb75-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhU/E09krvwMrSoQ9lTtmffEoQul/kmEQY2kTFH/Fq7iaK8R5k6Cdg3wuzGtcdeG07YMV6ZzWb/6V6bWNcx8cYS7IgL+U9Gr2qHbuR2EKXQIQ34fDYZKFVJJ7sZPw+uTO8b50Qxtazzj3J5UgyEdGiEHy25WRIctLK/BTu8iOwJjSwWjCC/x17NhFgv9lNTl1VPSyds1njwZ8FLpgNk7+av9tvp1vxcj9ocANd8dGrmaS09Eu70oH511Vdrv/hxBv0oyzIazQJ6vOmgrF7jA/+SgOOM4a2oanmSzeCUJCzSY8OttlgE9N2MbQr9EJel+JtXRoZj/YWg8bbmhYQPofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhsXQt5m9mycieh7FRhySFY2LkNvm4TT3dz9JkbhNCk=;
 b=xl45GDgx6o5p6AJh/kkLVRAJbE34g62IRLv0zRO7XgMVRxo1g8umVCXDoLX4NwOyFFu+k6e3f3eRJJW1EQKz7a1a7/VzRxwXfs43z+57zlJD6sCzIGinPY95Q0qSNSfOGjbTXnDL1VpJkpUVQEWwuY5pSuTGpwWeZvxKt+/iKL7MEhbbK5NxIITmowTgglknhDkPOP9yK6V/NFk/EAHNYDk3G1w1hbXOpiHBl7A1FEQmAmyIifo49ZKQ5qP9DUSut1bWJWOaZuagKb5b1IvV17GYJHpYaLReEWDABnyPTMn5LokGTs7siVvwIk9smMwgVOUu0qLm33YwH1FbNWc9Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhsXQt5m9mycieh7FRhySFY2LkNvm4TT3dz9JkbhNCk=;
 b=yj/j8C+xh9KA5NIdXzCLLsn2b+3+OKVxZoUHhZLv2I2v6X6U0coouCl3dSj2nT92NSjDLsECVm6WbdUfYGcSQCmz2VGrmmOuj6KhvLl5qZUw3brrF9rG6icdo8l35c4ewp/J6b4BtUaWVSt3lkYj3RNBT0Sv4nhTL/bgVN4g8iM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <64198f3a-7216-4f80-9e75-8a0c371f7e0b@amd.com>
Date: Thu, 6 Nov 2025 20:06:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: guest_access: optimize raw_x_guest() for PV
 and HVM combinations
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20251106222630.2777457-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251106222630.2777457-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|PH7PR12MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: d8efba98-c95c-4abf-49ab-08de1d99d9ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0lycGdTN25wT1N6cEtRWVVzU2hRUkZJRmFPT1ZtQWdZZ3F5dVVCaVR1OEdK?=
 =?utf-8?B?MkVCd3pDS0VEMTh5RUdXNnErd0lmTzZhMU53NFhzbVdhT0tPRTJ2ZlE4SlVN?=
 =?utf-8?B?eFlUNUFnWG1WNVNERFk3Uk1ranhlWDJwcWtRWDRHS1djTTB5UTlPcnF6Z3pj?=
 =?utf-8?B?dHRFcFhIazA5ckRkOS9PUmVqelBrM2hJL2FIaTBZSzdCNkZmbjZTWDZDeEpV?=
 =?utf-8?B?Y3N3L1k3bmlKWnVIUzhLVklwd2N3V2FERUVaVjNQZ1ZVV1k3TnpWazFaYisw?=
 =?utf-8?B?RmVqVlluelphR0N5YjJ6V1FDL3NRSVBpOHZ2YklEL0g3NmtDYVVVSDVtdVZM?=
 =?utf-8?B?WHBqZVdmckdBcjI0aERjcVYrUWZrUWRmL2d5M0c4UDhNWUVvV28vZEhLTy90?=
 =?utf-8?B?bGVNVnZwNU9QVUxyb3hkSTNEUHVaYjM0TEtuOW1CeXJnNXIrYVZMMENnYU9Z?=
 =?utf-8?B?SHJ2dDFpQkVaOEpMYndpd25RQjBWRXp3SU1GNEVTNVVyUEJuOTJPOGZpRlZy?=
 =?utf-8?B?blk5TDVnSDNCYWVlOFg0MWF3ZExGZGk4cXRXODZqMGZmZlpFNWJaRklCMWdZ?=
 =?utf-8?B?cEdVQTRsVXp3QS9PQlp6NkY5UWQxemU1Q3pmWkFGL1VoSlREMVBUMmVvMFNl?=
 =?utf-8?B?QUJ3ejBYSlpWWjJ6cDIzRnRLUGJkVXdmRHh2aGI4U2N4WjQ4aUJkLzFzcWZL?=
 =?utf-8?B?aGZOUEVXcXhqVnEzQjZ4OHUxT0w0OFlteHZ0OWV0czFPN1BZOFdPMllORlpz?=
 =?utf-8?B?bVUyQ0tsUlZiOHZEQk5RUTZjVFFRR1BLYkQrdkdoSURoMGVWWFhncW1RZ0tV?=
 =?utf-8?B?d1MyQmJyenJwaHJJK2NmQk1FSnlJL0lyWEZXZ2pDSDRjMm8vUFF6TzZmTVpQ?=
 =?utf-8?B?YTBJblF4T0UzOVNwcXpOd3pNRjA0cGt4SkRadGxqTTMwMUVtNlVZcVp1RlV3?=
 =?utf-8?B?Q0Y5NWlKQ3U3RUc3THlQbjF0N0JqNE5LYTNZdUtJNXdVNTAyL2JpM3gwVURS?=
 =?utf-8?B?OHFubU95a2NhQ0xNZVJzYTdOSUl0Z29Zamo5aEI0V0JCRFNmbDkyalBTTEdu?=
 =?utf-8?B?N1R2YjlUMCtSTDFUNjBrSUpTV0JIUitGazhPaDdpazdrd1pWNnRpdlZDS1BW?=
 =?utf-8?B?SkVSem1JZ3crckUzRW1qVSt4OWg1ZFFSOTlRVXFZZU9uZU4rcUdwNGxBTVpa?=
 =?utf-8?B?c0s1TDkvaDdDREx5ck5NaStjY2JQZDY4OEl0eWdmeGxIcHl3SnJ2QnY5Z1Qw?=
 =?utf-8?B?ZXA4bFZtdjc5Syt0TitWK2FRT08ydXRDU3pjcHArZzR4Qkx3MEcvOW1sM2Uz?=
 =?utf-8?B?NXB1dGVmY3JDekNUN0owWHRFWWdHUHVEcDBUWUlLQTZuVkVxdW9vc1RPa3Jl?=
 =?utf-8?B?am10V3BqbHJmZTNFamhHcDFERGVGWis2TVdGWGE2VGFPODBpTGRvZE90QjFs?=
 =?utf-8?B?NEs5Mm9PMHJTSGpBOTU5UzVSNGRMRHN6N3R3MTVaM1RNWjJsc3JzbklOOExG?=
 =?utf-8?B?emErdXdoeWQ2N0twVjhsazJ0UG82amZjeHdMQ0NWZk9nd2FZRng3alFydkdH?=
 =?utf-8?B?RENiajFpTWtneE5VakJ6VVJTOUliY0pnOGYvVTl5am5PeS9KYVVCTVZhY1lH?=
 =?utf-8?B?TFFwSTZXaitSc1IwNEdBSEthaGh6REpFYjhDYURXcXVLZnBSWDNZSUwrS2Vv?=
 =?utf-8?B?WHc0aTlyckJaQmR3amhiYkw2SU1QOTRhY05lY1lLSVlEY2lFRlkzWFZ4N0lB?=
 =?utf-8?B?YU1lVGovTHBxRi8xbTZpTXZRWjYybjd6YnlFZkwyU2NwZ29wdDZsT1E1bzcy?=
 =?utf-8?B?VW41UWEzNllJejYxY25ZYnVnVDlsQzg4UlNQRjAxeXAydTkva1M2byswRDZz?=
 =?utf-8?B?cGN5TjNnbFRpWXZZZjRVWDU5TTRjZjkrVStOS0ZKYkFJcmkvdnVvVEpNcktm?=
 =?utf-8?B?OUlMM2REUUNpeGk2SkszMTQ0R05ZdlF5QnhsVnI5aDA3eWZrYy9ndjRxTVVI?=
 =?utf-8?B?MlRLNjV0WEhER1R2TVpmU01TeXZxVERsb01RS3A1VnlRM2s4cmQ4UnUwRXpv?=
 =?utf-8?B?TndSVU1NWTV5bjB0d1hGdnJKZVB1UTJ5a2Q1eElqWVJhell6RVM5c2FlNjAy?=
 =?utf-8?Q?0knM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 01:06:15.1815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8efba98-c95c-4abf-49ab-08de1d99d9ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5925



On 2025-11-06 17:26, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Xen uses below pattern for raw_x_guest() functions:
> 
> define raw_copy_to_guest(dst, src, len)        \
>      (is_hvm_vcpu(current) ?                     \
>       copy_to_user_hvm((dst), (src), (len)) :    \
>       copy_to_guest_pv(dst, src, len))
> 
> This pattern works depending on CONFIG_PV/CONFIG_HVM as:
> - PV=y and HVM=y
>    Proper guest access function is selected depending on domain type.
> - PV=y and HVM=n
>    Only PV domains are possible. is_hvm_domain/vcpu() will constify to "false"
>    and compiler will optimize code and skip HVM specific part.
> - PV=n and HVM=y
>    Only HVM domains are possible. is_hvm_domain/vcpu() will not be constified.
>    No PV specific code will be optimized by compiler.
> - PV=n and HVM=n
>    No guests should possible. The code will still follow PV path.
> 
> Rework raw_x_guest() code to use static inline functions which account for
> above PV/HVM possible configurations with main intention to optimize code
> for (PV=n and HVM=y) case.
> 
> For the case (PV=n and HVM=n) return "len" value indicating a failure (no
> guests should be possible in this case, which means no access to guest
> memory should ever happen).
> 
> Finally build arch/x86/usercopy.c only for PV=y.
> 
> The measured (bloat-o-meter) improvement for (PV=n and HVM=y) case is:
>    add/remove: 2/9 grow/shrink: 2/90 up/down: 1678/-32560 (-30882)
>    Total: Before=1937092, After=1906210, chg -1.59%
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> [teddy.astie@vates.tech: Suggested to use static inline functions vs macro combinations]
> Suggested-by: Teddy Astie <teddy.astie@vates.tech>

I think Teddy's goes before your SoB.

> ---

> diff --git a/xen/arch/x86/include/asm/guest_access.h b/xen/arch/x86/include/asm/guest_access.h
> index 69716c8b41bb..576eac9722e6 100644
> --- a/xen/arch/x86/include/asm/guest_access.h
> +++ b/xen/arch/x86/include/asm/guest_access.h
> @@ -13,26 +13,64 @@
>   #include <asm/hvm/guest_access.h>
>   
>   /* Raw access functions: no type checking. */
> -#define raw_copy_to_guest(dst, src, len)        \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_to_user_hvm((dst), (src), (len)) :    \
> -     copy_to_guest_pv(dst, src, len))
> -#define raw_copy_from_guest(dst, src, len)      \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_from_user_hvm((dst), (src), (len)) :  \
> -     copy_from_guest_pv(dst, src, len))
> -#define raw_clear_guest(dst,  len)              \
> -    (is_hvm_vcpu(current) ?                     \
> -     clear_user_hvm((dst), (len)) :             \
> -     clear_guest_pv(dst, len))
> -#define __raw_copy_to_guest(dst, src, len)      \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_to_user_hvm((dst), (src), (len)) :    \
> -     __copy_to_guest_pv(dst, src, len))
> -#define __raw_copy_from_guest(dst, src, len)    \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_from_user_hvm((dst), (src), (len)) :  \
> -     __copy_from_guest_pv(dst, src, len))
> +static inline unsigned int raw_copy_to_guest(void *to, const void *src,

Maybe s/to/dst/ to keep this consistent with the rest?

> +                                             unsigned int len)
> +{
> +    if ( IS_ENABLED(CONFIG_HVM) &&
> +         (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(current)) )

Since this is repeated, maybe put into a helper like 
use_hvm_access(current)?

Thanks,
Jason

