Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441619958D3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813568.1226564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHEq-0004EQ-KJ; Tue, 08 Oct 2024 20:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813568.1226564; Tue, 08 Oct 2024 20:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHEq-0004BF-HU; Tue, 08 Oct 2024 20:55:24 +0000
Received: by outflank-mailman (input) for mailman id 813568;
 Tue, 08 Oct 2024 20:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syHEo-0004B9-Le
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 20:55:22 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20602.outbound.protection.outlook.com
 [2a01:111:f403:2009::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0d02394-85b7-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 22:55:20 +0200 (CEST)
Received: from SJ0PR03CA0068.namprd03.prod.outlook.com (2603:10b6:a03:331::13)
 by CH3PR12MB7739.namprd12.prod.outlook.com (2603:10b6:610:151::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 20:55:16 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:a03:331:cafe::54) by SJ0PR03CA0068.outlook.office365.com
 (2603:10b6:a03:331::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 20:55:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.0 via Frontend Transport; Tue, 8 Oct 2024 20:55:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:55:14 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 15:55:13 -0500
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
X-Inumbo-ID: a0d02394-85b7-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnU+kGaqtn/Hm5+7ybnqrtsArC1/z1ANmFT35ZKdI1Iawg77QdxABOb+wm5P3aZ6G7wwpUIe8P8Ku7rjkBXEnRHFTpqJ/UoDNeK+XNYWsfIASA9APSXpJmig71kRoU50cNzM3RtTDRGlS8fn1SNYDwiJlWnWAJHjaMmImM7n9z848yj21+0T/KRB8I1aVyusniaspefMRVL81hRsH8bwbss8QOP6ii6DxF/vMUGQiuZzJE4UMKz9b2c4cTUMzHEtSKOO/kvmLnL06f+HRMJf84SUZBt+KOCcyrt2ykiz5PtqXLLvCdk4laI470EihEC/nATFvsJgBDkKl9EEVW24aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38kzgQZuvtjPTcjHsGMRDZRICHRETo1px+QNNAvmIYs=;
 b=XMSHTYiddQ9tWBNkLmbHae1l7I/xXwqAh8vSEwg6uiZqLzNpfOmoyGbth7Xt/HLN1BNwI6QPuiZDN1OhFD2IWRG0KcG3QfhnKa2wkRUJu1S3kJe0lcZzC2Tyn4PbaDo7Ws+JitUv4/CMqmFnW94OWri9kGX0RXaCh6vhYWiOZJmeLGgW57mtUtHv55hw1HFVS9rAOiver8ZEPpoFqdDfEr3rOacza0Dte1g1SFZ1BzYp4fYVlmM+DrAE7pN8O0hq0GZs/emRLKotN8pn0pYCXv0tLJVEDAtkj8+gKSOFOC7+CmVxwDZ71oNYz2umRHPXY2QDxo8kK53DXIR1BYogLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38kzgQZuvtjPTcjHsGMRDZRICHRETo1px+QNNAvmIYs=;
 b=2kiaUJihz5rnuM2DtY4oBJqRTYvGfaVZu6aVCo0IWl7/wuNiRj8TfbqaAcrJoxwBw2zHJ7GauJVVlf3zsAHYZv4wegJNbZyfjmFJze+Uf3b5jylN2axKjdOrAoscuRFn8a6qfT63tlSDSbGBBw7H0IvLuh/3k17ZtixHQxG/xmU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5fe173b3-9c75-4f10-92df-d8e022231bf3@amd.com>
Date: Tue, 8 Oct 2024 15:54:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 43/44] x86/boot: convert dom0_construct_pv to struct
 boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-44-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-44-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|CH3PR12MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: da2c3759-5999-46e5-acfc-08dce7db8282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFpodUtXdDFNREhVczhFSlJQWkpPVGQvRENzemEwUjgxRzFZOVh4SDlOVHAz?=
 =?utf-8?B?ME1ZNWJGU2FIQzVwdTgvZXBkK1pMTHBGYlNCOFdqZUlCSitvcWNkVVFiQnhG?=
 =?utf-8?B?VG96R0lIWk00bmVCUDF3WW1wL0xZR3FjZGhFNHNxWmZsK0F0ckdjVktPd3ds?=
 =?utf-8?B?Q1ZrUjIwQW9KRmpTVG50UDIwb054ZThBc0xMejErVmovSTJLb3YxMk9FZkNy?=
 =?utf-8?B?bkcwWTdiSkRoNVBXZkYzcWhFMFVxOUpUK0FKRndyS2p4TWYxdmNRS0tqZTY1?=
 =?utf-8?B?dXpZV1cwVCtSZEl1elJPSVZ5LzdvMlo2UVpNYWt0NFZjd1RoTDZxMGdOeHhl?=
 =?utf-8?B?SDJYeWpxdDJ4aStaY2djZG9pTlcydTZ1TitZc25ieStTZU1OemZJVElyZVBk?=
 =?utf-8?B?dzlqOFB4QnV1UVIzQ1FBVEkzZ0tGeVZQWWpnMjk5QzY4Z085bzBGTllsaDFt?=
 =?utf-8?B?RlVXU2xlU3ZTK2xCR1Y3UURQL243OXBoTk5lMllLUWoyek0wd3lldWJYZThj?=
 =?utf-8?B?RUlzMURaNU9HdUhpQzNjNlYweXQ0M3FKRUtxYmVRSWswbW8zeHNVRVRnbnlH?=
 =?utf-8?B?anMyelJTUWFneWg4TTYxYTNDSlRnWmM0OVBtWU9laXJuWS9nWDd3dGVqQlZI?=
 =?utf-8?B?cUxZamlWTVMyc3lWWXpmbVpYQzFYQnRSOFdidzhZaXp5czY2RDRXTGFMU2dJ?=
 =?utf-8?B?RDZBdlltWVVuSUYxRnFGQ05DSDVyREVINHoyR2lHSXNzeWFjcDRQYkJOc0Nq?=
 =?utf-8?B?SjJwZU9XbG1aNDJkTEkvZmJLQXJySnNHZlRZVkNWYW82QmNVR2QvSlFuZ3Nr?=
 =?utf-8?B?SEtxaThFNlRVcUF2V0djdDR0eEVzek1yRlh6TE1jdjE5NlVpcDhPRXh1WHh4?=
 =?utf-8?B?WXl2OTJLVjI1Qk1rYlhYK3p2S1FUN2dveDNnOVBIMUpZLzhEUFpuR29uQlJW?=
 =?utf-8?B?NmtENHVHOXR2cnc1ODRZUGhOdjJSYzludGxYOU96SmhlOFYzT3VucG1rNUlH?=
 =?utf-8?B?WTBzaUUyaVBwWkp3eEhzRmFNRm0yc09BNXhJQjgrU2hQWW5YeUtqTE1OWnFW?=
 =?utf-8?B?UG9qNFlTaDNIbzVIRTZCNSttNlJsVkxBbHVCdkpTNFVqeFJpSEZoTzJhanBX?=
 =?utf-8?B?OVl5SDluTWw4NUdYSi8vb3Y2bkhmd0poVzJwekt5cVAvSVhCZU14aVpETGdW?=
 =?utf-8?B?SktVZERlb1Q3U2VkbmdVQ0t5MVhPenV1Tll4ZkpmbmhYaVh6Y28yazBlNFJM?=
 =?utf-8?B?VmQ1dlNRQnV4NkhsQnNjbWJrd2VIc3U2TWJoMjVpU0c3amE4WVlzSkxGVklE?=
 =?utf-8?B?b3MrRjdnWFNYdnQxQWZ4WDdXODRxSWlySHpuVllEQUpLMldrQURxOVNlaklY?=
 =?utf-8?B?dFAySHVGa3BsWnBFeXhMUFlLWWgxRTZlZzd2c0VtTERYTm92WmtMN2VkWVVn?=
 =?utf-8?B?N0p6THhtcWZGWEJsa092dzJzUklwMDI1OEpYRXhWRXhXM0JNNit3ZDFTK0N0?=
 =?utf-8?B?MGI2TnhDOUp0eVl2SVJYNUZKL2ZKQk5xKzduMEN3ZlFZNGdjekE1NThGeks1?=
 =?utf-8?B?REl2RUtCRWVFdmRzTjBaaS8rVGdGMTN4UHRzSGZodGhRd0ZXVytvbVV2RDZS?=
 =?utf-8?B?cnFuT08vTWJqMTc5RFdiZjN3M0YxRzNoU1ZMeFdRcGpwMkExQytuR2s1Z0o5?=
 =?utf-8?B?YTJra1JTR1JkYk9HaXVqZnpleEdhOXdpYlRPYmxNTVp2RFZXVjdib0ZlT2Yy?=
 =?utf-8?B?QzBqcFIvMmJRclptYTFZWTk1Y2V1amJZZVB3WEo2RTBvaC9nTmhRVmdXaXlj?=
 =?utf-8?Q?jwaGsiF6cyD64LWJF1WEQR3unnPk2SVhmHMDQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 20:55:15.1505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da2c3759-5999-46e5-acfc-08dce7db8282
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7739

On 2024-10-06 17:49, Daniel P. Smith wrote:
> With construct_dom0 consuming struct boot_domain, continue passing the
> structure down to dom0_construct_pv.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 16b8c1e40998..34974aa7cd56 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -354,10 +354,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
>       return page;
>   }
>   
> -static int __init dom0_construct(struct domain *d,
> -                                 const struct boot_module *image,
> -                                 struct boot_module *initrd,
> -                                 const char *cmdline)
> +static int __init dom0_construct(struct boot_domain *bd)
>   {
>       int i, rc, order, machine;
>       bool compatible, compat;
> @@ -373,11 +370,12 @@ static int __init dom0_construct(struct domain *d,
>       struct page_info *page = NULL;
>       unsigned int flush_flags = 0;
>       start_info_t *si;
> -    struct vcpu *v = d->vcpu[0];
> -    void *image_base = bootstrap_map_bm(image);
> -    unsigned long image_len = image->size;
> -    void *image_start = image_base + image->headroom;
> -    unsigned long initrd_len = initrd ? initrd->size : 0;
> +    struct domain *d = bd->d;
> +    struct vcpu *v = bd->d->vcpu[0];

This can stay:
     struct vcpu *v = d->vcpu[0];

With that:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

