Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9213BA234F8
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 21:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879745.1289959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdayN-0001H7-I6; Thu, 30 Jan 2025 20:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879745.1289959; Thu, 30 Jan 2025 20:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdayN-0001Er-EX; Thu, 30 Jan 2025 20:17:11 +0000
Received: by outflank-mailman (input) for mailman id 879745;
 Thu, 30 Jan 2025 20:17:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/JT=UW=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tdayL-0001El-Cl
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 20:17:09 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20607.outbound.protection.outlook.com
 [2a01:111:f403:2405::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c182ab4-df47-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 21:17:06 +0100 (CET)
Received: from BY5PR17CA0063.namprd17.prod.outlook.com (2603:10b6:a03:167::40)
 by CY5PR12MB6624.namprd12.prod.outlook.com (2603:10b6:930:40::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 20:17:02 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:a03:167:cafe::98) by BY5PR17CA0063.outlook.office365.com
 (2603:10b6:a03:167::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 20:17:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 20:17:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 14:17:01 -0600
Received: from [192.168.195.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 30 Jan 2025 14:17:00 -0600
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
X-Inumbo-ID: 2c182ab4-df47-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUvNDmS+ZMJDhVixfEGTmG3GnO2oitsCjqbZqOnxlCYbQFTXEHnPcx1D4uJJVvNAKypAb9uNe6oJvfajaPFRHr5HMpAQ9GAMZwX5jRpAGidblO2qEDXLHjVmiS/Ryal0YCM+j2dqNlYUkZYPhVQT8SOg9MgNdaraQbEm5Pf+MTh+G6cyoJwFNeNnZF0htERmqSgcGB4OOkDgD69d6XMtmOGEmk+7YA9OAArFU2y6ai5m5e7iw2/myJsMuXblfVFO2JhJeCDbxQIODNlpkWWo5bCJlNCtX0P9vm+0Lraz4e1nRp3qT5ZIklir6n6wfWFU22e6YT2IxPPP/+9EWgabxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O99zEQuAGJEov1QDHpiKvSyQOqTcgqLzoiZX6jyfpfI=;
 b=X5ufYE/2ODjhxbKlJDGaEjEWVi9m5Nkevd3kiZDXmRkjk5zMJYSXwM9wsKCA1koINO3OIcXB1m2ZOo8BwTV7ZcAjtFtLcya9xmMOsRkWyELd/AbDuwAYcS3Zxdwwytk/UPohACkrb3b58XmaL3fQfV3GqLOryMlj++1tXGyu1UBIMb7ry2V6Bg3XwUTcSbtb8frVAW6wppP22e4zNKw1NrXfA3U7S8wOyOZ1/0SITdtIkc83VqlZzfTqvd2WlSQraPVxRiEncNvRSH5DpiQ/84+DwYwo+U2EN1iwLhK2NoWjchwTdlC6oow7UgMLqCHSMqKkt5sH/HVUHsmpMT3Eyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O99zEQuAGJEov1QDHpiKvSyQOqTcgqLzoiZX6jyfpfI=;
 b=y1fwI2ePkgPnvUkeyh6WXJ8f6EP8bT9oq4Hf3zS8qoRweh7D6E86xsm8My1ATsEBFWEbrGKkKRlU3E4rPsDMoaNtpdg2PKVc8Y/L6TCM3Glg1TKfe0DzYJi3DZDvMC7x/MEB+bWh6spyjTdd/wgUJDdJaDw+sT+Xct2zRq0gnhg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1ea6447c-3451-4aca-8a17-2848acd0868f@amd.com>
Date: Thu, 30 Jan 2025 15:17:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC PATCH v5 3/5] xen/public: Introduce PV-IOMMU hypercall
 interface
To: Teddy Astie <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
References: <cover.1737470269.git.teddy.astie@vates.tech>
 <29f3e87532573bfc4196083ab0291326adae5100.1737470269.git.teddy.astie@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <29f3e87532573bfc4196083ab0291326adae5100.1737470269.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|CY5PR12MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 561c6b4c-64e6-4cb0-c035-08dd416b0e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emJnNVBMQ0tBQnZETTFjZ0NRT293WUlzSEhyNHNGVXRDTWdPbzNxMElqeWxa?=
 =?utf-8?B?ZThVRGVRVGFaR1ByZnUrL1B1QThkT3htMUxpL05LODlTZlp6Y1NsWnpqbW9G?=
 =?utf-8?B?Zi9YLzVCblZtamJZMHBhTXQ5dG13QWpuZmtJU0hLbkVvbGduRVlPZW9oMUMy?=
 =?utf-8?B?aU1KNkF3ZGFBWlZsNk9WMnhTSTlwZnhpTExxemZQb2xOTHRQZWtjQk5zU1B4?=
 =?utf-8?B?a2I1SGxmdE15YVpYODVIb29JbG1lQk8yMXRLZXg0V1dhWXZpMjMxR3prWCtQ?=
 =?utf-8?B?Z2dOdWFBTm9XT3MrZjNMM2hJRXNONHk5WG4zSHJEb2dxRGZGS3V4SFozYVZX?=
 =?utf-8?B?VmtycGZLVHNCTTRFeUExdEJiSHpNWUIxYllGdDZuVHY4aG9Cd1dwUXhXbDBD?=
 =?utf-8?B?eCtDMDdRV29PQjRhMFFyTmJxbzVFaStDcGxNeHNPVmJDMVZFR1MvMVpNSC9E?=
 =?utf-8?B?WVY1TzlLVVVXRWwvV2xWZ3l3SzlndnQ5VUZLekU2N0dsVzIxY3VtUk9XU3cx?=
 =?utf-8?B?MDllUEc5dHR6MURHWXpXQ2xnUm9sZ0RlRnFUOXlnMVYvNU5FekhzN1JnU2NS?=
 =?utf-8?B?WmE0SGd5K21PaWd1QzZjUFdSWi9zSDV0b3d1V2ozODdUc001Zjh3NmtVWmxD?=
 =?utf-8?B?VXhkdlBjSGUvZnc0UUltUzY1c21ZcG0ya3lrWHM0RDBUNzgvQS82VU5zd2xQ?=
 =?utf-8?B?ZmEvb1ozNG41M0paUmdtaGlza0FnTW9FRlFRbzNsTWYxaWl2VEpVWE9UaDBX?=
 =?utf-8?B?OE1KRGNWUUJCajJnV1lxQ3NmbnFtOTZiUVZYRUhTeGR1L0kydEl1VklyajBD?=
 =?utf-8?B?R2RRdkZ4WldaeGRsR2libU0wSnY3UTV3aVhYQ1d3dytMSGwxWG1oakl3dTRy?=
 =?utf-8?B?RzF4TXRPN3dpNGUrTzNBb0s4N3JWU2tDQWR2VFVsWnhsRHl2V2tzS0VraHFh?=
 =?utf-8?B?OVZoTGtuaHF4Unc1MUpoWGE1ait5bUxqNlVkS3l5OHpyNFZTd04rZ2VTRGVI?=
 =?utf-8?B?dGc2cEh1bUcxdlBSSFBNQmwzWGFJR0J0RlNvdzRjUzB6Y1hJY0NzZWZ4OE1o?=
 =?utf-8?B?K3JjR2lrMVZyL3N0aSt1WmJzYnZEbXYyV2lJRE8vV1N5bnlmQjJlN3JsRkpD?=
 =?utf-8?B?MGpFZDhoZzlLRE9LaDZ1eFpWdUUvSVRQRW15TkUrNUJRS0I1a0hPY1pQeUU1?=
 =?utf-8?B?dlBWYnB3dFR5YmFsc0lxMXhndEN2cmZPV2dPaFRIVDhkRld6d1lIOURSRHMx?=
 =?utf-8?B?N2ZSSnJnTlBEYU1xbmVlNjNyWHE0MWtOYTVENVFnb0Q3ZnZCYUdNQjVLa1hG?=
 =?utf-8?B?amN2c0NEZGNlQzgxRVEzcWNJQm9oTWpUNitSVnR5VVc0djQ0bW5CMHlDSWhE?=
 =?utf-8?B?WlFaWC9UUGpQMDZJQW8zR1c1TGdhYzBmWlh6RDhjY1lBZ1liOWhJdys5L25V?=
 =?utf-8?B?OG5HaXFIRlZFRC8zMXVhR2RUN0JSbHIwMEEySjVwaERyTDF5UUVXQk4wRnUw?=
 =?utf-8?B?QmtzYTNmRmI4VHc4bnZwNFRaWnBTTUcybGtqM2JQMlRQek9iSUtIdFdZZTB5?=
 =?utf-8?B?SHJFT3N3VGEvVkMrRmVFeVpvcXB0RCtkbUVRTGtac3lXcVZFZlJhZFBJaW5E?=
 =?utf-8?B?Y1lTMXYvZ3Zick5YZnJKSWxpVk91ZnJiK3dVL0dSUFd0VGNSMnQvU0lxekJS?=
 =?utf-8?B?eXg2ZEJKc21MT1lwTU9WUmYrdWZtTEx5cFBrTTFLSE5jMFJoV2hmL2FBS2hR?=
 =?utf-8?B?WHM1M0J0M1hDeHRCcHdOSTBkbnR4cGxma3N2NFh4RlNiSklQSkUyN0cvcFNk?=
 =?utf-8?B?T2oxamNuMzM3cGZneUJkUWVOQ1h1Ym1oU21ZcnhRVjhYU1A5WE54QWZkLzZk?=
 =?utf-8?B?TXZtSGN4bWhrYUk3Ly9IQXhRcmRyU3VFOUVCaXExQ3FBT2x6QWxxeVFHOCtD?=
 =?utf-8?B?Nkx3QW8vUUh5M0FVT2dNcDZXbWgrcDRpbG1kc0NTZk4wWm5KaTJPVWdGRVZG?=
 =?utf-8?B?ZG5za1JtNWJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 20:17:01.4139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 561c6b4c-64e6-4cb0-c035-08dd416b0e6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6624

Hi Teddy,

Thanks for working on this.  I'm curious about your plans for this:

On 2025-01-21 11:13, Teddy Astie wrote:
> +/**
> + * IOMMU_alloc_nested
> + * Create a nested IOMMU context (needs IOMMUCAP_nested).
> + *
> + * This context uses a platform-specific page table from domain address space
> + * specified in pgtable_gfn and use it for nested translations.
> + *
> + * Explicit flushes needs to be submited with IOMMU_flush_nested on
> + * modification of the nested pagetable to ensure coherency between IOTLB and
> + * nested page table.
> + *
> + * This context can be destroyed using IOMMU_free_context.
> + * This context cannot be modified using map_pages, unmap_pages.
> + */
> +struct pv_iommu_alloc_nested {
> +    /* OUT: allocated IOMMU context number */
> +    uint16_t ctx_no;
> +
> +    /* IN: guest frame number of the nested page table */
> +    uint64_aligned_t pgtable_gfn;
> +
> +    /* IN: nested mode flags */
> +    uint64_aligned_t nested_flags;
> +};
> +typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);

Is this command intended to be used for GVA -> GPA translation?  Would 
you need some way to associate with another iommu context for GPA -> HPA 
translation?

Maybe more broadly, what are your goals for enabling PV-IOMMU?  The 
examples on your blog post cover a domain restrict device access to 
specific portions of the the GPA space.  Are you also interested in GVA 
-> GPA?  Does VFIO required GVA -> GPA?

And, sorry to bike shed, but ctx_no reads like "Context No" to me.  I 
think ctxid/ctx_id might be clearer.  Others probably have their own 
opinions :)

Thanks,
Jason

