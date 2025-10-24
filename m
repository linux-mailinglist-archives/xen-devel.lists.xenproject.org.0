Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256B0C07D38
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 20:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150817.1481814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCMwx-0003Sx-TJ; Fri, 24 Oct 2025 18:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150817.1481814; Fri, 24 Oct 2025 18:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCMwx-0003RJ-QN; Fri, 24 Oct 2025 18:55:43 +0000
Received: by outflank-mailman (input) for mailman id 1150817;
 Fri, 24 Oct 2025 18:55:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lOOD=5B=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vCMww-0003Pq-C7
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 18:55:42 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08a283b9-b10b-11f0-9d16-b5c5bf9af7f9;
 Fri, 24 Oct 2025 20:55:40 +0200 (CEST)
Received: from BN9PR03CA0521.namprd03.prod.outlook.com (2603:10b6:408:131::16)
 by DM4PR12MB6445.namprd12.prod.outlook.com (2603:10b6:8:bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 18:55:36 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::52) by BN9PR03CA0521.outlook.office365.com
 (2603:10b6:408:131::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 18:55:36 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 18:55:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 24 Oct
 2025 11:55:36 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 24 Oct
 2025 13:55:36 -0500
Received: from [172.21.152.226] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 24 Oct 2025 11:55:35 -0700
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
X-Inumbo-ID: 08a283b9-b10b-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrhqbMBM48xO4eCFXG8EIpUIQNq3+QiZbdXdltBuVLWIfNMbJq7/o7uRn2E3XVQtUhSq0BZep2AhDED56/iQa6e+3PvPMKKefwJor/5Or0yqztmkqhmZbNw8xtXWfc9aYWdTsvGjxkcMXt4UmW7Kbq6pk0+ZHQBr478bsew+gN7fKveljuqYt1l5DQjKb8CH4Qjyv5I1G8UWH8HWS6zS1BmEV0UhHGJCo8PgYcsIIEttS4h9TveHupXNN7ZDk/ef5zGjLaqg3hs+FD/jswk5W+Cws03fetOl9aOOg1UOjrQVTlJN4kOlteStAmV1aFzc0mrbovn63QOtujI7rGpqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibERSIjWiw3lqYXNt4HxNx1HOXMAhQLE2KkAnV79nkg=;
 b=DG+txKAuaRE+vb6tghO3xPTvchBnHeeAFJ4aD77nPQ9IZdRLUVKVWB4Ww5P36K1qgUn15LRcVbdiLG1zWJceh+OHJ2+DG8rNN1wzVkH4hlaBvilNZHIEjbDEfzWefje3L5xAdSkTFOV7KopOkwQALuwf2uJqegF5ZjVGe4OpzwBtHxqYiLHWSErdCawaqLFK7vrmq+mgvPAaWfySbTXF7rly7n1qGOIYGe61jlHhH1Cvjqk6hHjEwFz1RExIEnHwcSNo7mvbHQ63AE9OWjj4xD2Dqe/gX7nDyFZHMMaeKedThiC3JubYb6gepoBjI4yUDq0VfO2Gs+McuSpEBsdDgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibERSIjWiw3lqYXNt4HxNx1HOXMAhQLE2KkAnV79nkg=;
 b=A3Xgmu9J6B9zXj0Mb8ni5odavinvv3RUtd4buKl9LC1du0ePuQAXpA34u4ZCNWLEQVHeWkWF5xVmc7b2G6MG0QJceg/umnmy1o+6wx+SUB30OK7jqTluCS2Lh0YprodG7Kja/1MY2XwLZZty3hzhTFtVrVutU8KGrkrDCqcol9M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <cf7f5cad-06cb-4702-a10b-e0b087060fb3@amd.com>
Date: Fri, 24 Oct 2025 14:55:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v5] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <20251023151807.560843-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251023151807.560843-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|DM4PR12MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 6abdbbfb-4a4a-42c0-d173-08de132eeb0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVVuMkM2S0xFeWJoVXVXeGxJa3pIaEI5QngydnZSblltY0g5Y0VLYXM4VEZk?=
 =?utf-8?B?Y0dSYldmUDVZcTZibFR3SEpSL3Q0WnhnaTRKOWQ0UkZucFpsajNyZGkzNVZR?=
 =?utf-8?B?ckJIS1F4am4ydkVSMEZvR0FsNENOWTVsMEE0Wkw5TUp0WVgwSWd4Z1lCSVRR?=
 =?utf-8?B?eWlWby9YWU1LNlBXNkFoYlFqKy9NMyszRmxXekphc3owdEFXd2xsUkhzR3M0?=
 =?utf-8?B?UXRWaXY0SEtWVW4rajJsVDZTQTI2M1VqTGR5NTFJcTc1Z2pZZ0J6ajdkdFFt?=
 =?utf-8?B?ZjZqSmY4VkVxWVgwS1BaSy8ydjdKNC9yUkFoUjFEM3RVbkR3TnYrMzVtOWx3?=
 =?utf-8?B?NkhUZE55Nk5GMnFYU2FSakw4cGdQaTNaQ1hDRzlmUSswVkpWRXdYZXlDajZZ?=
 =?utf-8?B?bk9GajJtK1JSeG1PNklwbEUvQm9WQUFCZ0ZSRXgzL3dVdjd5UTNrRWJWeGFl?=
 =?utf-8?B?akVZME0vaWVLWHcxOHBLRHhLa2xhNHFiY3UveW9aOVhURmFnT3NkTE0rNzVT?=
 =?utf-8?B?SXJIbHUwbHlWUFRXbGF0N3EyOWZEZ3hUcG9wdTFzYWlBQUF5djdLTEdNM0Z1?=
 =?utf-8?B?TU9sVDJvNFU4ZW85UEZQMmxGdm1YbHBkTVViTDBMUlVjTWVKQlpGT2FCeVRk?=
 =?utf-8?B?cFJITWRoR1pBa0RnTkFJR0dqWGZ3NjY1OVhnTnhJQ2NWWkQ5ZUs4dTlGK2px?=
 =?utf-8?B?NDhFL0k1c2lzaXl4VXZCcFA0bVJyK0hJZ0RJcjdlTVhNNExvbjNuT2gwTGMv?=
 =?utf-8?B?aDhFbUtnUzI1dUVYSHdndVN6Q2JMWjJCWUhFYm5tZm5rOHFRNDlIU2RmT1A3?=
 =?utf-8?B?QkhlOFp2T1ZIYlpPRHhBaUp2ait6blpqTVBYSnZYaTZDT2R5S005UHcrak1r?=
 =?utf-8?B?NURkcEZWTFJ2VjNKZGthZEJMdVVvQ3F1aGUwY1JLRndLeFZORUVzTDBpYXBv?=
 =?utf-8?B?cGlEdnZvQ1pzbXJBclZObHcwRDYwR0NwRXhWa0NjMXFCU2V6UFFKNXROWlJW?=
 =?utf-8?B?N21sdm01bnNsNUgxa1Z1QmNpZGNxSFpjMHV1WmozNStnZGFIYTkwbFQwQnhp?=
 =?utf-8?B?SDFOVmRTR2xNTWlmTEk0RjRYZCswMkdNK053a205LzNkMkx2ZEJONWNkRkVh?=
 =?utf-8?B?eHJDNXZSaFVaeGUxekJnSkJXWFNoUmh2MS9rYjRYM2I5SlRML2wvcTYwT3d2?=
 =?utf-8?B?Y1dsTjhKK1lIUzVrV0ZEdWdsNnNzaVdLaWlnZWlUWHpidExZZTJ0TlpKVGZk?=
 =?utf-8?B?Y0JzZUdoYVR3MGFpUTJHMW9uM1dlcUc2VERKNk00WU5QdkNxc2xGRzJKdmJp?=
 =?utf-8?B?L29BQjlzM1FuUlkwUGx3VHkyNGNpUEQ1NzdRVGV5ZERWaWltWTBVTExwMjFp?=
 =?utf-8?B?ck92ajQzTHlsKy9ESVNzNEtDRHhQejdvN1JOVmRjcWdPelZqeE41bUJXMUVh?=
 =?utf-8?B?VGRqWlh1eXpkYzBYalpZcG8wZEpLQi94SGwxay9FYUZpMm83VVJuTzFDVkVy?=
 =?utf-8?B?QTc4VHVZbG0reGhsRkFVbVlEdjFMTGh3citJSE50eXc4aEdleHMzSnA4UTdM?=
 =?utf-8?B?SzBnMFl2a2tGbkJlWVVSQzJxMUNzVkp0ZWdpdWJIV1NhYklsRVJ2OFFKZWw5?=
 =?utf-8?B?Wm0vTUhXeUU5UHBJVjI3Vzd5cE83UVNZd1hNTU5iY2FZMDZkSktCcWw3RDRS?=
 =?utf-8?B?Y3FBQlM4WFNRQnA2WmxZc0l1NzZPZVZKOEpvLzFNdDMzVHFLQmhxQnFCK0xm?=
 =?utf-8?B?NWZiVTB1bXpxTUprbytPQVJ1TjVUbDB5cHNLK0Q2WGRtMFNUTnZtcU9ubXh3?=
 =?utf-8?B?MVJPQS9EMDdTcVBZV1ZsajVXZk8ySkNLcjhqcTNudi9YYXpYeElqL0luTUxY?=
 =?utf-8?B?NWFsdlhVSnBOUzZUZ09NUHRSL216a09kMndqVTEzK29mZXZkekIrU0IyeGYx?=
 =?utf-8?B?YTNPRnl4QVIxSzEzSXhMT1YxdGFHWGpLbXZVdXNsd2szdGJ4bTFFN2FrdEhw?=
 =?utf-8?B?ZFoxY2xpOHdCYTJtR2hPVGJMdCtHYnhKK1YzWEJTWHR1eXR4bC9IdW92NTBk?=
 =?utf-8?B?WW1qd0Q1Z1ZUTVA0OHcvbnhXekpQWVdLL0gvekk2WjIxdzBuaWx2QVhjZTcr?=
 =?utf-8?Q?SEPY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 18:55:36.5729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abdbbfb-4a4a-42c0-d173-08de132eeb0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6445

On 2025-10-23 11:18, Grygorii Strashko wrote:
> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Add config option VIRIDIAN that covers viridian code within HVM.
> Calls to viridian functions guarded by is_viridian_domain() and related macros.
> Having this option may be beneficial by reducing code footprint for systems
> that are not using Hyper-V.
> 
> [grygorii_strashko@epam.com: fixed NULL pointer deref in
> viridian_save_domain_ctxt(); stub viridian_vcpu/domain_init/deinit()]
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---

> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> index f79cffcb3767..b935803700fd 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c

> @@ -1153,6 +1156,9 @@ static int cf_check viridian_load_vcpu_ctxt(
>       struct vcpu *v;
>       struct hvm_viridian_vcpu_context ctxt;
>   
> +    if ( !is_viridian_domain(d) )
> +        return -EILSEQ;

Given:

  #define is_viridian_domain(d) \
     (IS_ENABLED(CONFIG_VIRIDIAN) && \
      is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))

CONFIG_VIRIDIAN=n is okay because of the IS_ENABLED.

For CONFIG_VIRIDIAN=y && a viridian domain, is HVM_PARAM_VIRIDIAN 
guaranteed to be loaded before viridian_load_vcpu_ctxt() is called, so 
that HVMPV_base_freq can be checked properly?  I don't know, but it 
seems a little fragile if this relies on implicit ordering.  Maybe just do:

if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
     return -EILSEQ;

?

Everything else looks good.

Thanks,
Jason

> +
>       if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
>       {
>           dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",


