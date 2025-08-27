Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F4BB37CB7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 10:03:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095659.1450580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urB7v-00028d-HX; Wed, 27 Aug 2025 08:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095659.1450580; Wed, 27 Aug 2025 08:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urB7v-00025v-EM; Wed, 27 Aug 2025 08:03:27 +0000
Received: by outflank-mailman (input) for mailman id 1095659;
 Wed, 27 Aug 2025 08:03:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dVpB=3H=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1urB7t-00025p-Qu
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 08:03:26 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [2a01:111:f403:2413::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bab03b9-831c-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 10:03:20 +0200 (CEST)
Received: from BL1PR13CA0159.namprd13.prod.outlook.com (2603:10b6:208:2bd::14)
 by MN0PR12MB5956.namprd12.prod.outlook.com (2603:10b6:208:37f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 08:03:13 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::fe) by BL1PR13CA0159.outlook.office365.com
 (2603:10b6:208:2bd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Wed,
 27 Aug 2025 08:03:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 27 Aug 2025 08:03:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 03:03:12 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 03:03:11 -0500
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
X-Inumbo-ID: 4bab03b9-831c-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1VtaQuGS/PuVQSAwqR//2EqxtHuyhko1LQ4OuKtYdRdK+ZGeEvG1IqIRP0xMoZPGdWgaNdv3bYt6milgfvKZrS3q4o/mHZBg8t01p7wZ8dUoD5rNTVA/zFMTsLqR3rqP4tRyXng7LxAsLSb7Sq7pHODymBmrQvs4HbR/3kmz2nc7e2wQphvasszaeduFvPs3vRkIrK0twF+l8tr27wm7gt95JS5aspWqGJv2i/1Gc6qNinwNDAfuKR/MCxHIzcElGRJa0rxJFda2n3YadryUz3Lk/dZugodl/T1MKX6I4fLlKs0L1BUR/0KW3vfhzMgcBb1rEV8lKahyoZnesVF+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOmTl6j6JPjcCc9p7W7fW1X7z7OXS8mLrvOmJ0hFw+g=;
 b=m9ccbifJ7iwjdKKu1ZwvKF85wcXM1cxugsn+uXfhIvZTUKOB2VqdvGXa/DZCIr13tO1FGUEDgMmyRGWNpfc8pYxLyJPBh7q/TK3PuD4axmRoZcdqBRGry3NmEZoEeSp45d7+QmaVkR1UkZhXg20KzXTJ6gPCMXdnuMplZO/d6k325S0cSAqXLPZVGUPPHZzaWCk3KBv2XvIfY0yOvqRcPc0SCOl6KfHUMy7YzYZGmcMyncZjBWVdTp0F60NYC0IqyF02VH/UvKNtGftht5YY0wqLN92hSuOEKvJlt+g0QLY/64TvrciSOjnXca18rMuOOtCvhEmGfRRfPbM6aJFWMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOmTl6j6JPjcCc9p7W7fW1X7z7OXS8mLrvOmJ0hFw+g=;
 b=RjBGja6zYeiqBP91C59d+n8itdJcgPHX9CT0IztZjWUHqJGUdbCgvNkgD5spj9415xxGMWkeOopQt2Zw8SXBSZkFC+jzIXOfbqIyk3deMZDcH508UcieKjM6wVM8aavVVViQ6XHusq6Xoud5gNOZFQhMqcnWCFO+BdhnIXATvMs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b59ea812-6c97-49ea-b7a9-c02e3e265800@amd.com>
Date: Wed, 27 Aug 2025 10:03:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] xen/dom0less: store xenstore event channel in page
To: Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250826210847.126015-1-jason.andryuk@amd.com>
 <20250826210847.126015-9-jason.andryuk@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250826210847.126015-9-jason.andryuk@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|MN0PR12MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: 8199a553-4515-45ed-5f17-08dde5402bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHlnVGZ4NVc0RVFEUkU1STQ0Y3ZlbEJGdWhsSlc3N2RicDB5UE1mYVJYUk5B?=
 =?utf-8?B?R01OMkFSSHZnbXJHbThIWFNmeEZMdmNCek4xVlUwUXB2OGtwK2xOQ21SUjJn?=
 =?utf-8?B?TnYzWllveWx1NUtReEFJOFRIQ2NJc3dJTVpPeVNQSFNKZCtXQkVJenV4Nkpa?=
 =?utf-8?B?bWdOdnhNaWlOWDd5Q1JXOGVTVWhjYlQrWDFZVzIrTTYvRG54c21aVHdmNmFO?=
 =?utf-8?B?RkRFNTNRZ0ZFYkxnbEJKWGpSVTdKZHViOCtmZ0VjVDRHZHM4UWo1VGFqWExZ?=
 =?utf-8?B?ci9PMk5IcHNlT2dlc3ZMRzhBZ3laQ0lOODhmdjZZNzBtejBUaFVjTWpISmZL?=
 =?utf-8?B?UjNFTUI4cEhOSWgvNjZaNTVBb3AvbVVjeUZwN05nS1RnVXE2UWc1OGNFRVp1?=
 =?utf-8?B?SURsS2FUeUdOUEllN0tWRnBHV2UxOUdXV3ZQNURZbCs0MkhiQ2FTNkVwSC9r?=
 =?utf-8?B?RUw0VlRIUHhEOGNjd08wM2ZnVW81QjAzVTNFWC9rTmxybHhtK2JTSmlSRGVX?=
 =?utf-8?B?QnVvY3A5YWwxbk9VY1ByWXRRbTZjOURETWZHVVRpWjczY3ZYS1B1SGkwaUNS?=
 =?utf-8?B?NGpENmgxcDRvMVkwb0RmRkNIS0xEUVBYc0pOMVJhUWRZVjVsYzZpdkZiV0ho?=
 =?utf-8?B?S1dzR0N3OGtYb1dUdFo2aDlHbitMbkdpVDdEY0RlTlhHd3RPU0dnb2dic2NM?=
 =?utf-8?B?RUJjcGFNdkduaEViTFhJSExqc0k3ZGFsWGNBL092Zk5jbnhMU3NnM3h5dk9G?=
 =?utf-8?B?VnR1VzZWbnRxazhvZlFiVVNQeVBjSnpjdmFyd09LNDRaWmNiczNaMWVwZGtQ?=
 =?utf-8?B?OHVJWTJaYVBjWnhMRkw4N2lYQnhMVFJaa0VYUlFMaEJPOHh5UzNFWC82dTJY?=
 =?utf-8?B?dW9WRDV6MU8vVkQrQkxydzYxRzg5bXgwblV5NzYvY2xqdmNRQmMya0VpV3Qw?=
 =?utf-8?B?Wit1d3FFR2FoMlljOWZ3Tnd0bzErdTBUeXEzUFNLVUxYaGxkcHZDdE95R1do?=
 =?utf-8?B?NHhwNUJCOC9Pamk2VUs1MngrSzhMYkViREtvMjY1bmNSL1JoWWxzT0NpSFRy?=
 =?utf-8?B?dXRKOGZ6RnRlMTRibGE4TXJvK0UzWlI4N2hDL0k3VjdaY3RWSkVlOGJGSisz?=
 =?utf-8?B?Sm0wQjFNdEJmMHl0QzB3RTRIckYzY1Y0YnpWb3VJMWtBWEJBSk1uYWhZNnBD?=
 =?utf-8?B?MUxUemV3RTV0RitEYVhLOWQrbHJBTldaTjNpQnhIUGNJRnJITUh2ajc4RUR2?=
 =?utf-8?B?cy9YMUVTb1g1MWk3dmhZNDAxQ1k3WnhSZXpiLzdjWm1NUHpzZHE0UWxZazN0?=
 =?utf-8?B?VksyblAyUFl4bk1SMllqdEZRaVRPamplY0ZqNUNpZ0VJVERkc0lRcW11d0Q2?=
 =?utf-8?B?MFBFUWdFVC96MzJ5MThDR2JCaXBWZDdOVGNPS0FNd2VQZTdRSU5XZjRRbWNr?=
 =?utf-8?B?SzVTWWQ4S0hBNEMxV0wvTm4xSmY1azhXUzg2Z285VjJhWVRpR29FSWM1a01Y?=
 =?utf-8?B?dEduWVhVNzFQaENtWFZoOXhiVkJPNitXMXhPMHdROXZhWDZHbjJWRnljVDc3?=
 =?utf-8?B?VC85Q2RhY3ZLU003NXBFa1FuNWhpRDhNRi9ZZ2tZdS9NdUptT0NoTzgyZjdv?=
 =?utf-8?B?eTQ4Y2xYQlZxZFVzemR2TFEwTFRNb1lEUmN5c2E4TzZtbC9MVmhRZHIycEVW?=
 =?utf-8?B?SSs0ZkpFdTBYWEZkV3Fkemp4WGZ1TWpxWTlUNWFRODZEVlhxSzJLZ1BCbVMz?=
 =?utf-8?B?N0lLZHZYbUFJRmVTNnp5aDBzdlZueXAyTE1IUVBVYzVWYW5IWEVXRkxBZjdB?=
 =?utf-8?B?OVljblY5SlVqMGVmUGNxNFVkOFRjSy8xWFBodGh3dFYrbXJHWjd3NUR6K25N?=
 =?utf-8?B?WmNxWWl0NWR5V1hFeFEyM3k1dlhHdUhEanBOTkhHZ3prSEZtT2FUOGNEdzBU?=
 =?utf-8?B?V0VFcVJicmdqS3d5akJEN0VhaFhNTTBMQ09rdzY5cEs4anFKd1V2RVI0M2kv?=
 =?utf-8?B?UDlhWE5CMWszRHc3eVozdmkzWi9hcmlFbzAvK1RIM0REVzMzOVMyVExJSzdr?=
 =?utf-8?Q?ZCqw4h?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:03:13.1781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8199a553-4515-45ed-5f17-08dde5402bd0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5956



On 26/08/2025 23:08, Jason Andryuk wrote:
> Write the associated event channel into the xenstore page so xenstored
> can read it.  xenstored can map the grant by the reserved grant table
> entry, and then read out the event channel and bind it.  This eliminates
> the need for an additional mechanism to discover the event channel.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v2:
> No change
> 
> This should go in after the init-dom0less changes so init-dom0less is
> ready for xenstored automatically introducing domains.
> 
> I'm looking for feedback.  This is ARM-only for the time being, but that
> is the only in-tree user of this code.  From the perspective, it is okay
> to go in.
> 
> If we want a cross-arch approach, a common function to write to guest
> physical addresses would be needed for additional arches, but they
> aren't available yet.
> 
> Oleksii added a function pointer to dtb_load() and initrd_load() when
> moving dom0less to common, but I think that isn't necessary.  Just
> having a common helper would be sufficient.
> 
> copy_to_guest_phys() or something_copy_to_guest_phys() could be defined
> or a wrapper for ARM's copy_to_guest_phys_flush_dcache().  Other arches
> could need to implement it when using dom0less.
> 
> I'm not an ARM expert, but Stefano said
> copy_to_guest_phys_flush_dcache() is not necessary since this xenstore
> page isn't expected to be accessed without caches enabled.
I'm not sure I understand this point. When copying data *to* the guest, cleaning
is about Xen's cache, not guest's...

~Michal


