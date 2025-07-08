Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE81AFDA13
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 23:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037384.1410044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZG4B-0002ah-Kq; Tue, 08 Jul 2025 21:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037384.1410044; Tue, 08 Jul 2025 21:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZG4B-0002ZE-Hs; Tue, 08 Jul 2025 21:41:31 +0000
Received: by outflank-mailman (input) for mailman id 1037384;
 Tue, 08 Jul 2025 21:41:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd/v=ZV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uZFus-0006hl-6n
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 21:31:54 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2406::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5e91b60-5c42-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 23:31:52 +0200 (CEST)
Received: from SN7P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::18)
 by SJ0PR12MB6832.namprd12.prod.outlook.com (2603:10b6:a03:47e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 21:31:48 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:124:cafe::9b) by SN7P222CA0004.outlook.office365.com
 (2603:10b6:806:124::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 21:31:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 21:31:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:31:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:31:45 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 16:31:44 -0500
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
X-Inumbo-ID: f5e91b60-5c42-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fk65MYOMeNx/S3F5yiupCOufauHMylUsxryeiqene7EAt6SwLF2r9deq9/oq2N85OC3PZw9n5a9kVXULNYj9zgrK6+FuwneJWwNMqTypru/uvOif9f6Ay3Al4WSFQ2yPnOY8qVJIt9AxR4rqxJIDVSfEX0ipUUe815J9FSbRaO/pQNSMQz4Mf2OYCZY5eOC3PwWmxajy2QxRElcLDUM4ZP5r4fwFpFfkY0hMbJqAFY9EPWJbrmCH5RZXtCnq1/07WXUarR8Hz1mv8YIiilBK/FobsNQJ/3MX8pIz+7I15U4JnXOoFhn2creD3SMC470yuCgo7jrzf3shHcntMquq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDpEFlCoXVD7ENnADuKDW8nwDvpTX/4/kG//QGY/Szo=;
 b=oa1SlA1cPokJqGEp4kCeyF6eI5q02kCpKWUvwiGikiO4kN18Mkh567jjt2VY30E25TvGhhFXJvA88av6pUfvXxlkawzh3oII+2EW6O95/4Ew2j296F5MKB8Rp/D4pmvAyNzqsJTJPaVJcycXniXFgWymsBX6mEoDg6B4pvhv6lZAqv6nLcMArWVUNL9Dn9X8sQUW7YG9i5KaeQJ6iYm+AILo5qgRIb/vopUB+bNfgwUhxZz5JKxwO29X1oXWyqs/wEvT7kUeA5YdiAb6A1W4F2vzAzAk/PUkSRVYd0oM4P/RmheOFEwCxuZ00OPmi4sZmxlxcS/6D5ivjj3nv/Jnmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDpEFlCoXVD7ENnADuKDW8nwDvpTX/4/kG//QGY/Szo=;
 b=IdL9hwYbFRvHvuf7dc3NIzJoeKAS39O4TEx8IZWHy+hZywqAFds1cwAW7eV44xE7QJx+v+1jYECTO6yWBqhRrrufdkMWNmRiqK5I7FYs9XbO0smEfeU3d6Z1vrNz+7wW4OsQ5ue/hLsDJp1hliPmU+nrfP4j25NuWr4TDAfH6dY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <fe9ea209-6a41-4448-b171-bfa7e639989d@amd.com>
Date: Tue, 8 Jul 2025 17:14:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 06/19] mm: don't add module pages to free memory
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-7-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081254.14383-7-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|SJ0PR12MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: aca3e5d7-813a-416a-7078-08ddbe66d74d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVRUb2RCQXNicnpQdHpWS0VNaGJPSTg4NHNGdzZCazNQMThrQ2pFbGt2eEZz?=
 =?utf-8?B?R2pjWHZVMlFuTThNVUx3RkdsNE5VWUNuV0I2cFkrNHVwK1ZBWlpXQkFQdDQw?=
 =?utf-8?B?blpBaTNzYm01T21IejdiQ1FHQysrVEdRTmhKaERSaGlxM2lrblpZNkhlWnNw?=
 =?utf-8?B?VUx4TmxYclZqaWQvTDYxbWtML25IRXRQa1lHK1l1TTloWXk3UjNGTGJMWUJW?=
 =?utf-8?B?eGhuRDFBZzZRZkY4KzlVWjBtRUZsYzVjdlBUYms4ZERHdTluTjFiODVDTk9h?=
 =?utf-8?B?UUI5VVJyYnVnN1JveVRpeWhZTmJva1hDckh2amhwVHRhY3ZYRFh5eFhJSGFh?=
 =?utf-8?B?aFdkYWJ2T1RjRzVvL2pabS9SOHZyT1Q4MzVqM1c3YmNBSHFxZDgxMXN1L3Ex?=
 =?utf-8?B?NVgyTUhoa25vOUV0S1JTd2RGeGgzc1gweFp0OEpBQU4zaXlPTUpIcWtXZjNH?=
 =?utf-8?B?SUhZVlhiZkRaSmZSU0NRMnNCUHoyOS9ndUI5R1ZNajhuSlN0d0gyTlI5RVpZ?=
 =?utf-8?B?RmtTZE5hSjhPZDhOdEFKcjJtcmYzcEVKSW5WK21SaEJmazV3NS9ZZXhQQzlh?=
 =?utf-8?B?Y3FCcHJEOWZCY1I2TmtIaUc2NzVicFV5QkZoMWdxSnBnQytWL2FVQWdiR0JZ?=
 =?utf-8?B?N2EwNXhSbUl3b0tRWmtXNzBxeXNEdjJ6ZERnT3c3aEY3VmRuZDZrTkJHR2lQ?=
 =?utf-8?B?K3pteGxtRGphRkxycDBScE1QMGpKR21MVHFYT3pVbVNLUmxUQnMrRlYvM1hx?=
 =?utf-8?B?eDNxUWdXVXBtU3BzNEltNUtUcG5JMFkwMTBlanB3d1JsRHlRTTMzaWo0OURV?=
 =?utf-8?B?MkNiTzZwZTZPbUVObnRLdERRRnVTZXY0OGhjYmc3UEJIaXlQL2dYc0tDOFZB?=
 =?utf-8?B?aUg5ckNJRHFYQTdrS3lIT1ZKWHRsSncxbzhGTWhaVHdmeDQ2QkR5Qnp4SEw5?=
 =?utf-8?B?RnZCRVNsRzZMakZOM0JCUkF5bnJTM1lsd0ZFSVVhakt4WSs3WmZiRDA4ZVR6?=
 =?utf-8?B?Wk5qOC9GZzI4TGRRd3RhTVNmM2xmZ2ZObGFqdmRMMWFJdlA5azVIK1NyRGZa?=
 =?utf-8?B?SGdORXh2VFR6VzZNdGhUUWw0aU5VTmlrVDR3SUdUQ2wvNlpTcWh2TVYwYTZV?=
 =?utf-8?B?QWRaTG55QWZHVXJ5YkRRQVMxcWVjMlZWYyt2OXozdFRGUkpoRUR3MjJpa2Jp?=
 =?utf-8?B?WENZaE9FbCtYUFlBY2V6QVY5WjZtNDNDaDEvZU5LNTFBTW9rT3MxT2habnN6?=
 =?utf-8?B?SGIzUFBLQlpCblZTSjdPckUwOEx4a1ZEQysxNkZkMmxtM1Vnb2NqZHJnV2tD?=
 =?utf-8?B?RnRueElEYTFSVTdQMXFtNStVNG1GZkIwOWFmR2dEbVBMNFcrcVF1NVkxbWEx?=
 =?utf-8?B?S1VDVHlCZHVOVGhMZjBWUzdETXR3OHRnQnhDTjNiMElBbWh2Ri81eStEMm5h?=
 =?utf-8?B?TFRSdnVMcURBa09jcGxMVkJ3b3VZc1F6RTk4am90V0lFV1Yzdm1EdGhlOEdJ?=
 =?utf-8?B?Tml1WThSS0ZjV1NlUEwvcEJBUllzL0djcnJ5T3RDYnR5eFlNR1QydzhjS1Bz?=
 =?utf-8?B?RkpxSmlRa2lLaTZtSEVHTEZReUNnNDBuNnZTUFRhSVBtbUN6T1RIME9RcmFX?=
 =?utf-8?B?dEVUWDc5QzRXSmdDc0E3L1Q5VndnRUo5OFByYVk0Z3dkWTNiR3pHQ0ExNFF2?=
 =?utf-8?B?MkZQVEZiZFVHZ0twNDBEYkhWbHg5RzJKSHpCbWVjcUZ0a1g3cld4VlhSZmFo?=
 =?utf-8?B?YTNkWXA0NURENi8xdmRPQjc1R0dyWEU2UVI0SXpaVDlwUnBHOEZtTjc3QXR6?=
 =?utf-8?B?YmdmN25OYXdVbjYvaTNTVU5zTFpTSU5tLzdudkxodGVUMW1XTUJacDNqVGJV?=
 =?utf-8?B?Q1p4ejUrbTYyZmhpaGhSTW5La243ME9rZFJtelFka2h4M01BMmgvdlN2Y045?=
 =?utf-8?B?NWVTOWI4MjRLV1hhOHZ2QUc0RTVVV2U5YUZydVZNSHVsQU81UnVuekpDK0Vw?=
 =?utf-8?B?eFFleHgrajRlUGJaTG9LRVdHempXVTRzN01iQlVyd3V0cWd5M0kzRGJQM3Vl?=
 =?utf-8?Q?EYzLTP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:31:46.3954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aca3e5d7-813a-416a-7078-08ddbe66d74d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6832

On 2025-07-02 04:12, Juergen Gross wrote:
> When initializing the memory allocator, don't add memory pages of
> modules and the initial boot info structure to the free memory.
> 
> This is relevant only when running in PVH mode, as in PV mode only
> memory above the initial page tables is added to free memory, and the
> module and start_info pages are below the page tables.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
> +/* Reserved memory ranges not added to free memory. */
> +#define MAX_RSV_RANGES  1
> +static struct {
> +    unsigned long start;
> +    unsigned long size;
> +} reserved_range[MAX_RSV_RANGES];
> +
> +void check_memory_range(unsigned long *from, unsigned long *to)
> +{
> +    unsigned int m;
> +    struct hvm_modlist_entry *mod;
> +
> +    for ( m = 0; m < MAX_RSV_RANGES && reserved_range[m].size; m++ )
> +        check_memory_range_conflict(from, to, reserved_range[m].start,
> +                                    reserved_range[m].size);

reserved_range[] isn't updated, so this is dead code.  I guess that is 
fine for now.
> +
> +    mod = (struct hvm_modlist_entry *)(unsigned long)
> +          hvm_start_info_ptr->modlist_paddr;
> +    for ( m = 0; m < hvm_start_info_ptr->nr_modules; m++ )
> +        check_memory_range_conflict(from, to, mod[m].paddr, mod[m].size);
> +}
> +

>   
>   static const struct {
> @@ -888,6 +964,10 @@ void arch_init_mm(unsigned long* start_pfn_p, unsigned long* max_pfn_p)
>       if ( max_pfn >= MAX_MEM_SIZE / PAGE_SIZE )
>           max_pfn = MAX_MEM_SIZE / PAGE_SIZE - 1;
>   
> +#ifndef CONFIG_PARAVIRT
> +    pvh_reserve_start_info(&start_pfn);
> +#endif

Maybe this ifdef can be removed and arch_mm_preinit() can call 
pvh_reserve_start_info() and update first_free_pfn (which is assigned to 
start_pfn)?

Regards,
Jason

