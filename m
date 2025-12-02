Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B137C9CAC1
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 19:42:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176314.1500816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQVJm-00076c-CV; Tue, 02 Dec 2025 18:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176314.1500816; Tue, 02 Dec 2025 18:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQVJm-00074Z-9p; Tue, 02 Dec 2025 18:41:42 +0000
Received: by outflank-mailman (input) for mailman id 1176314;
 Tue, 02 Dec 2025 18:41:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/vY=6I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vQVJl-00074T-6L
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 18:41:41 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 895d47b6-cfae-11f0-9d1a-b5c5bf9af7f9;
 Tue, 02 Dec 2025 19:41:39 +0100 (CET)
Received: from PH7PR03CA0016.namprd03.prod.outlook.com (2603:10b6:510:339::13)
 by MN0PR12MB6176.namprd12.prod.outlook.com (2603:10b6:208:3c3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 18:41:34 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:510:339:cafe::d6) by PH7PR03CA0016.outlook.office365.com
 (2603:10b6:510:339::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 18:41:38 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 18:41:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 2 Dec
 2025 12:41:33 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Dec
 2025 12:41:32 -0600
Received: from [172.31.77.70] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 2 Dec 2025 10:41:32 -0800
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
X-Inumbo-ID: 895d47b6-cfae-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqIPMoiv0Tnv/h5ooOBJspOpYmFghCW47ZHj0fCwfzGJb9EWsMPXok+BqxNvPnqRW24Bl4NC2eVZ3jQVHBoNaHQhOPAJQ7DHPrkVbnJE6168jb7tT50VAdVGEfQ6jRjpbrp5g8v1MMXMEpFfSk5HiAkKvUtjTZ58SxEaj26zCELSov+J/JKvhpCvHelkWwksrj2GpxV6bG+B2bPkoaAM2hqrEsXyoNJliSJujfv0gNlV6rSAOAmUexnhTh3JGZX/c55yjYHA3sgaiyHEFbyd9M2yJdMbeJfVSTzDAp2PCfsaIsURNbEgxqCQAdcsMGfYyo7IHgFvwIQIVj2ZrEb/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGdfIf//6+hO4yhMhimeGAXBM65bie/zdIJ3sjiYyZk=;
 b=rWrQkHa73meROdafXQDfGeM1RUskaaQqUrTDvJogc9NiSpzKXKO7dU2RXPoxL/AGJuXchHavfPREMkVyxB9tus4mYf7z354hJK4RTNns0UcHEB5BSx+qVfQlM9Taey4ECGdbFF0kZ9ef6/kCnC9lq7t9rzD7e5YdWV5TbvZjSQLBUvUKv4yLNNRxkgtBqjPMCDHuO1ySeJ5XyHpAOvptoW87kF638Rj3S8alHbsyQBuShz0/1cfhSKbkohLIe8P5h3R39BMghuey1Hc6KCG9BWzEOwLwvyEEcWLWebNejpoC1hWUHz57awLeh1Uj9cwSnj1z7SVGmOnhbvNJwukTow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGdfIf//6+hO4yhMhimeGAXBM65bie/zdIJ3sjiYyZk=;
 b=kNbjWwxLnvYlCQTns9aDi0GxqgTeIzNLiG/VfH7O9dz4CniE2dWbX6oyMg88eMCZxPbep5oRG1d1zxz4LYZYHjINsUXluGUS7z6K7U1BS1gbhcgpCHE1KLnEdjlLXH38hXZgnh4IGHjOWT8bTht10XtIfq1AysnMvSRFEpc+ozo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <0054b5cc-d278-4c8c-bb6b-fbe1d641ac2c@amd.com>
Date: Tue, 2 Dec 2025 13:41:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 2/4] x86: hvm: compat: introduce is_hcall_compat()
 helper
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>
References: <20251119192916.1009549-1-grygorii_strashko@epam.com>
 <20251119192916.1009549-3-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251119192916.1009549-3-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|MN0PR12MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: afc072b5-43ef-4af6-ce59-08de31d26aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aThMWmFqbVVwYzBtcHZFSisva3NPRjYrRjNsaFJUeVRWRWxlVGxETk1QV1VB?=
 =?utf-8?B?Y01uZGxsYzJTUnF0MjVkdVhzWVJaQzh1cmk5WGFER2x6Y2RMdENKWlo1Z1ky?=
 =?utf-8?B?WXJKTnVNRmtlMk15cktURFloV1dKU1hrVmtxb2YycUprbm5qbXlPeThMMkNO?=
 =?utf-8?B?M0NsQ1lkR25xeUNNUWRzZUwzdGthWjg3VFJXL2pza21xcE1zVFAydHhsSG0x?=
 =?utf-8?B?T2lETmd0TXRYOUZJQ2hYeU5lNkJNK250ZkcxWTBsZlZmYWFjbUJpZ2VBOERS?=
 =?utf-8?B?UXpBT1V2ZnR3Y01xZ2hWTmxadUI2Z1NXcE5tb29CSndlTnI2QTFRYUVoOXk3?=
 =?utf-8?B?bFJkWW5Jc0pRQXEvQjVUL0EvQlNmZTZXeHU4MGdUajRER0JmWTB6eCsrYmpi?=
 =?utf-8?B?ZG1tNHZuaWJKNzVJaHVEM1F1QVpVR1pOb2xuMUxvN051UVBoN2pKdkpBWmhU?=
 =?utf-8?B?c3hNalVnaEVpMU1XU1EzNGhITis4KzBNUk41bGlISndLLzhFY3JMeDZmZng1?=
 =?utf-8?B?QjE2VHlmbkF0c0tsWDFsbWdIOWFWbS8rOGFhNW9kWDFUeEJKN1hoamZlaEtJ?=
 =?utf-8?B?Qi90R0pvSExOdzZNQ2ozdTh6SU5wSGZ5WHhsZnVsY21XZHZvSmJDL0h1RDhv?=
 =?utf-8?B?Q1BXbkdOaEkyaG8xVHFWaHdZYzBwWnlZR0oxZFlFSnNRT2lSa2VWOUQ3aFRk?=
 =?utf-8?B?TFNGMGJiLzNuQXZzemdscWpJN3JHL1RPTVBvWHZSbitEbFhPdllOTnJhejc4?=
 =?utf-8?B?QVBHcWQxd3Ixa1JPMWZVbkRGSEE4TFJMWk14dTVLeWxqajNqN2twTzZlNUtS?=
 =?utf-8?B?Q1RPMU96U3Q4NHdCMjlzc3M3U3ptdXY2dFhmNDU5eEMzSldxcERGam44NjFt?=
 =?utf-8?B?TzJlRFA2REFRR3YxajhIZTZYMjlZb2djT0RWQ0tTLzdGdGdGQTJBbGZPMHVo?=
 =?utf-8?B?Yzl2VVBNRDFZMmtiR2RJd2x4U1VZMHBmcFc1clFZS29aSkE0aisvMVZWSjVv?=
 =?utf-8?B?YzYwWHRqUGJnWWpYSVpIWEVNb05uak5OOUFlLzlOTlpiSXozRnJnYnVEUHM1?=
 =?utf-8?B?MmpLemNRTHh3NnFHZTlMVXNYRVMrcm1pQ2hXTlYrWmtING5rcTlvbGNzTW9y?=
 =?utf-8?B?aTJTalpUK3ZDNElOYWpNSXhjQXFpMTBHc2NWYVlmU29FQ3ZLMGpVbGMrSnlj?=
 =?utf-8?B?Ym9ZREx1Zkk5MGVhU3QvTXhhOXp6OHpRb2hCSWpVZTd0VFZQejN6QVp5N0xX?=
 =?utf-8?B?WlVIMVZGbXpsS3kydlo5aWRkZlIza2RIS2R1T0dESDVwUXBxNzFDNlhHUEpv?=
 =?utf-8?B?enpGOTRWT3huZFdzVlhla0lmK2JpMnBLbE9KYTJvellubzJCdlpvSUhTSG5t?=
 =?utf-8?B?bjRyL1ZuazlrbWJOTENDeGVMaytWeWNIdGxaZ21ycW5XT0dHQTBMQWdkK25i?=
 =?utf-8?B?Q2NZYkthTTNmTHE0SStkNzEwTU1GZE9qQ0hONC9INElveDF6c0Vudzc1Vk52?=
 =?utf-8?B?UFQ3M2U2b210dGRoaS93UUd6dEV2UUg0Qk83SHkwZlI1TTd3ckYrTnppVmRl?=
 =?utf-8?B?RFlwcjhqQ25rMFhrOGIyZUNidnlSd2VTSzNZcGp5VmN4SmU0ZWNBVlNibXpB?=
 =?utf-8?B?K0U3RkV3MWdoVGs0RlE5RjUzTGRyV2dsVmZwZTJ4U1NiWDZxVHV4YUtNSFIr?=
 =?utf-8?B?cE5oN3dNdmpETjBxQ2poYTB6dFAzK1hETFUvZFpoRzM2N2lSUVFTTjhBOHNP?=
 =?utf-8?B?TDN2UUlVTXFzWlNxT1VjY2lkM050SlgvQkVGWkltZm5JbWMrdFI3R3I5dFVz?=
 =?utf-8?B?OWVXZjJCTkRYOHlSM1o2ME0zbUlET0JTellLS0g2VnVVTys5ZTl2M3dwc2d0?=
 =?utf-8?B?WXprOGhNd3M3d2dXRVBzOUpMUVFLMjJ1VDkxcjlHaUFJY2xoMXhENGU0MHJZ?=
 =?utf-8?B?ZjVhcDZpOWtKQ3VvVG5zeUdxN1ZLdTJ5NE9tRVJSeXhxZXpzTFd0UUlHYlNk?=
 =?utf-8?B?citVSytIb2RTVWcrWm8yc09hcVhCbmRhNW9tK0twQ0NXeGlQMTZiQW9HdFNy?=
 =?utf-8?B?N1dNV2NNMENlTWpVMG1pSXQ0V29qeXc3YTRteHFhSU1zYXVGV2wwbzBLTUJG?=
 =?utf-8?Q?HWW4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 18:41:33.6882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afc072b5-43ef-4af6-ce59-08de31d26aca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6176

On 2025-11-19 14:30, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Introduce is_hcall_compat() helper and use it instead of direct access to
> struct vcpu->hcall_compat field in preparation for making HVM COMPAT code
> optional. The vcpu->hcall_compat field is under CONFIG_COMPAT ifdefs
> already.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 02bdc256ce37..ed6fdeeda9f9 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -311,6 +311,15 @@ struct vcpu
>   #endif
>   };
>   
> +static inline bool is_hcall_compat(void)
> +{
> +#ifdef CONFIG_COMPAT
> +    return current->hcall_compat;
> +#else
> +    return false;
> +#endif /* CONFIG_COMPAT */
> +}
> +

is_hcall_compat() matches the hcall_compat field, so I am okay with this.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

However, is_compat_hcall() might be a slightly better name for the 
helper.  For me at least, I think of these as "compat hypercalls", so 
that ordering reads a little more naturally for me.  It's not a big 
deal, but I figured I'd mention it in case others have an opinion.

Thanks,
Jason

