Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD7EA998F3
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 21:51:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965216.1355842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7g7Z-0007al-8G; Wed, 23 Apr 2025 19:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965216.1355842; Wed, 23 Apr 2025 19:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7g7Z-0007Yp-4g; Wed, 23 Apr 2025 19:51:01 +0000
Received: by outflank-mailman (input) for mailman id 965216;
 Wed, 23 Apr 2025 19:51:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbtc=XJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u7g7Y-0007Yj-4O
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 19:51:00 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20631.outbound.protection.outlook.com
 [2a01:111:f403:2414::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 464f14b4-207c-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 21:50:57 +0200 (CEST)
Received: from SJ0PR05CA0104.namprd05.prod.outlook.com (2603:10b6:a03:334::19)
 by BN5PR12MB9462.namprd12.prod.outlook.com (2603:10b6:408:2ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 19:50:53 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::27) by SJ0PR05CA0104.outlook.office365.com
 (2603:10b6:a03:334::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Wed,
 23 Apr 2025 19:50:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 19:50:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 14:50:51 -0500
Received: from [172.21.185.2] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 14:50:50 -0500
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
X-Inumbo-ID: 464f14b4-207c-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEVNtLcTzuVRQryFRFhuhjafKqD0459nhbWN7lunc+gox4FRpkGpr4yMpRQRT6LA+v02h7fbXJfcEIMjMsKzB1RvlzaK+wpzL/AA2Wg518gTj/GXtuABnYg3pHfQu9A3uvmh9ipWarIV0YmCl32YSxIzwTixPqHSRW9CC4tZy245Bc95fWBJke3A+wEly91UKVYSaoKk5uq+frjyLBebSGppaJq4fN0KSuMlqtfjuIIDfn05zlUFQmIZYKMqkH+04JLbEjRhVzVGAWcUMtHnJo7R8St6yO8ueFXE9lqchRa7sZ2LnNE48l8IMlxiZN19JuGMfiF9TK4+AWMSrSDALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dG2gxwgZ9eOzJ57KdBshiu5VKzjV/ATE/1RPuNW0+zU=;
 b=F+jvMqWkug5+KNDMyfA4I1j45lD38cJh3lZ3VUFksoVBhbaZDbjIXHe6qqQh8SX+hYlTicVlSNk+GQmep82VgJhNwDr20li4+n5YX62OQqOzNRfW5w2TfJZQ9ULt+oibIu76kuKoi0gtMVtdxLu4osaZH3304fgfds3OS5A3rqWn4yaAX+2OyDSsKdwefC8F6ZVg5Fr3AcxwLRAOGmk9pt8cGqLjf9+hohCBFmsXDBCoTLSygBOyAT33cRZQS+8IYyDwPCHx+cmIfcDf7ImPV0HD0qlQeNhAFBaPHHegA10zJThfVtHtBF8Kzc+IHEqbB5DJ1Eos+O5Rn9fnB/363A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG2gxwgZ9eOzJ57KdBshiu5VKzjV/ATE/1RPuNW0+zU=;
 b=otQCf7VZh3AewBR0YHzGCCiO+8UBHDpEcHevVGUPQBNpVvEyWSVIotzQy4EP9v4VjZ8PfvFygHJlPMAD9zh9px+fi0YsCSDbi5/KLko5JefanBFKXwltAIzzCl8jeehh4btQsGuOROS+03V/rOI2TAp4GhJxSNgd5aq/8JbPEGc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bb2aa95a-797c-4d33-86eb-28acfaef743c@amd.com>
Date: Wed, 23 Apr 2025 15:50:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 32/38] x86/hyperlaunch: introduce concept of core domains
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <agarciav@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
 <20250419220820.4234-33-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250419220820.4234-33-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|BN5PR12MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: 518fd1e6-99b0-4f56-e259-08dd82a0278b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHZvRi96eUNMbnlXMUt2U1ZTd21uN1hYNGtSTHJ3OGM0bGNzOWtqdHB5dmRn?=
 =?utf-8?B?WjJRYzFma0tzQzlja2xDalh0R0Evb1RkOTdaUE53SURRaGhjWTF1T1o0OEFj?=
 =?utf-8?B?NFJGK1FoOGdxam03NzdMMDBtL3ZjYWE5czhmWkcveFhjam5VRWFOSTVzcElG?=
 =?utf-8?B?WWEyR2ZtQWJ3bWNmcnI0OUVuR1hoc2RtSGpOWStIQUNTeWw2RWN5YVFGUWow?=
 =?utf-8?B?eGI0T3JMV2ZxZm1xTlZxZUJOc3JWSkhKUVcrYVlFUWJUY3QzdVRDUkhPQkpR?=
 =?utf-8?B?K21XTm1DQkRsa051QmlDSkszMmNvYkxJR1oyMXFPdXBUYXR5S2xZY2UwdUp2?=
 =?utf-8?B?clZFeDVEWnJ3U2tKQ1dsd3hvaUlPTENidWMwSk55T0NyOU9XTWtRQ1JhVXJu?=
 =?utf-8?B?bDlnelBBZThvZ1R1c2FQNlBrTElFT2NvSmtqWmhiZWVEdHUvbkRnc3FvVzJo?=
 =?utf-8?B?bzZKRXFnVHJiNytiSElHdFVQWWlkN2hFVkJ2M0JTZDBkeU52aElSb3QydGZM?=
 =?utf-8?B?bHljU0I0dnNrYktlbW5JVUVERFp2RVYraHJTaUxzdmxGTTMvaTd4NUxFRmc2?=
 =?utf-8?B?S0txN3l1NUZabjliSDYrWUlEVE90TVpjQjhlTHY0eS82ZDJRT1RCWW9Obm1q?=
 =?utf-8?B?eldmK3c4N3FJQzVDRU9mSEhCU1c5WUl2c3Y2NEJRNmUyNjUyRSsxTkIrUzZm?=
 =?utf-8?B?RXpXTUZzUHlad2FmK01mUWxhK2pCRGdKQnZWSHlzY3EyRzFyS3FnaWx3QUhJ?=
 =?utf-8?B?V2tLMUo1amF2WFVNTEFaN1pHcGFOc0NHelA3WTJVaUlkbEg4WTdKZ1d1eXps?=
 =?utf-8?B?ckswbTVyeU1tUFVibzBFQkdvUVFHZFY1eWxSZFpWVzB4U3U5bjVCWC81dU9Y?=
 =?utf-8?B?c2I2RG5FQ25rb3NKRC9JYUtoN09tMmVaZGhVSzhPYVZnbzQ4ZEdBNXorbmt0?=
 =?utf-8?B?b2NndUNjQVVSNWVkcW56aGtGb2FNRlEwU29vWVVkQ2dwWXB0bTFUNkVQS2wy?=
 =?utf-8?B?eTFTR28wdVBLSWhpNFB0NU1pQVg5SVRBWEtoSG5qUTFvanM3RmdnN1VGdFhs?=
 =?utf-8?B?VkxaT0xGejNPNnArU3pBNjh4M2Q0TDFObTlwZ1k3T2E0VVpBV2NvWlJEd0xJ?=
 =?utf-8?B?QnBhcUZMb2ZFdDEzZy92RVFnTXRuaEt0UmpqczJvZEplMHFLVXdjT0k4Q0tR?=
 =?utf-8?B?ZnBta1JyRERKTWpPT1RndVd6Ri93bVNCbmIwZTcvcWd0S2pPMEpYYzFjRVlt?=
 =?utf-8?B?UWNBUXROMSt0Q1B2NUdtejZmV08zRklEOHNRNmtLMkZpaHlTUTExamtFUlhh?=
 =?utf-8?B?VmFrb25BQmVVZUV5NVM0VCtmVmVoaFozYVdTVHFISVltc0J2VWZBMStIb3pz?=
 =?utf-8?B?bmxDLzI1eUFrMHQwTUZvU05UK0dOSUdobXBkelk3SmZ3SmVycG9tdkpkV0po?=
 =?utf-8?B?c3Jwcng5NW9LR0hDQ0pqWkNUclFMVVhEb2E0Nk52REhXaEtib0VsT2FoYVQv?=
 =?utf-8?B?NVA3VVExcEhKa0RTMlZaeFFvWUZmUnJHbGtSdU5KSHNUb2preExUbVp0aTZp?=
 =?utf-8?B?NGExWVEyYjJWQ1cwblBQV21ZT3RsbGF4REdRZUtpUTMxU2tLS3N6YzIrdTlS?=
 =?utf-8?B?YVA0a0UvVWh0c2RUbkhJU1VHQlNGSkk0Um15UXpjZGNEbjVJVE1CY0JQc2hV?=
 =?utf-8?B?M2F1QW84YW9zcm1sVWN0MXBUWHVuODJJQ29MOFk2MlRscnZVRXlnNmc0enNO?=
 =?utf-8?B?Z1VqbEZSVFg1bmtkbDRtRCtoMU5TelJLUzZ5by9WaFA1TFN2V2FMVmRlK2dr?=
 =?utf-8?B?Z09PTzFYcjEvMXh5dlMzTitzTi82d1l3ZkpCck1tWlBIdWdKN3JoVzU4aWJM?=
 =?utf-8?B?L3Zib0VsZE5nVzJIT1pkdGI4dk0xc0k4Q2FUM2Z4bEY3N2xFM1paMFBpZ2Jj?=
 =?utf-8?B?Tm4rSzYyOFNtZTJIOXJEUVdYY3NrT3BpS1hudC9hNXlESm5tM3RUTm4zZkxp?=
 =?utf-8?B?SEZVajh5WTZOZHowb25RaVNiVTBBZGlNUUJBUVE2WGFwMWl5d2tMT0lEM1M4?=
 =?utf-8?Q?sIgNo8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 19:50:52.4929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 518fd1e6-99b0-4f56-e259-08dd82a0278b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9462

On 2025-04-19 18:08, Daniel P. Smith wrote:
> When constructing domU, and specifically the event channels for their console
> and xenstore event channels, the domid for the backing domain must be known.
> Therefore, the control, hardware, and xenstore domains are deemed as core
> domains, and must be constructed before any of the other domains.
> 
> This commit introduces the build_core_domains() function that will ensure the
> core domains are constructed first.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/domain-builder/core.c     | 68 ++++++++++++++++++++++++--
>   xen/arch/x86/include/asm/boot-domain.h |  2 +
>   2 files changed, 66 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
> index 901efce62a61..f693aa46d278 100644
> --- a/xen/arch/x86/domain-builder/core.c
> +++ b/xen/arch/x86/domain-builder/core.c
> @@ -103,18 +103,78 @@ void __init builder_init(struct boot_info *bi)
>       }
>   }
>   
> +static int  __init build_core_domains(struct boot_info *bi)
> +{
> +    int count = 0;
> +    struct boot_domain *bd;
> +    int hw, cd, xs;
> +
> +    cd = first_boot_domain_index(bi, BUILD_CAPS_CONTROL);

> +    hw = first_boot_domain_index(bi, BUILD_CAPS_HARDWARE);

> +    xs = first_boot_domain_index(bi, BUILD_CAPS_XENSTORE);

This order has issues if you actually have disaggregated domains.

Control and Hardware depend on Xenstore for Xenstore.

Control and Xenstore depend on Hardware for console support.

I re-worked the xenstore allocation to run after domain creation.  I've 
upstreamed that for dom0less (and ARM doesn't have to deal with consoles).

So if xenstore allocation is moved later, Hardware, Xenstore, then 
Control works.  But xenstore and console could both be handled after the 
fact and then the construction order doesn't matter.  The backend domid 
is needed to construct the event channel and grant entry.  With assigned 
domids, alloc_store_evtchn()/alloc_console_evtchn() can operate on the 
domids instead of expecting the domain to have been constructed.

Regards,
Jason

