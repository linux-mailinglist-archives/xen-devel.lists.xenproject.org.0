Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E508CC1FA
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727635.1132209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lt6-0002vz-Sc; Wed, 22 May 2024 13:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727635.1132209; Wed, 22 May 2024 13:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lt6-0002u6-PL; Wed, 22 May 2024 13:20:12 +0000
Received: by outflank-mailman (input) for mailman id 727635;
 Wed, 22 May 2024 13:20:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DzQV=MZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s9lt5-0002sc-10
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:20:11 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02de5ed5-183e-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 15:20:09 +0200 (CEST)
Received: from DM6PR18CA0025.namprd18.prod.outlook.com (2603:10b6:5:15b::38)
 by MW4PR12MB5642.namprd12.prod.outlook.com (2603:10b6:303:187::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 13:20:05 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:5:15b:cafe::4b) by DM6PR18CA0025.outlook.office365.com
 (2603:10b6:5:15b::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20 via Frontend
 Transport; Wed, 22 May 2024 13:20:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 13:20:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 08:20:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 08:20:03 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 22 May 2024 08:20:02 -0500
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
X-Inumbo-ID: 02de5ed5-183e-11ef-90a0-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T++K8TuLf8+kKlPCIGYoDDpxLlk0txDOpSrH6tkWvSsoxjUUDiOlwLTYkJEyNBlYk0jm9kYQMJMu9I5ZVPlVVsm/8kW8OKPFXgbiAb1lt12oNJNlH9RLpYJQdg94wW3dQHlPbStsZpF+WH2pmT/K1sX/F9RsITJpVgCSB5lJ4SDwAD2MLNDx+vt4IppD+Bt07hTUdsgjcxtlrDSBIgylyoVHEIl/mQK8H0nT0C5MmFzSUldoDt77ONchLC1y+VHD+FppxoluWKNM06Ck9iiP7QLCWcD6LBpjEnEZRPDqZ8C27LOqyNmkwErKIkFUUvX3y9/abQqlS7Q7COiqfc4kpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EO6KUCu3JGuzHIVuVIM4KDT+40PD1yt4ONaC+056r/Q=;
 b=awrdrld6ja5ztkDiI5Y0TcTAKW/kN0AFEYFwBUTYeZd4yy470twnlCRiPoucsltVBwDfSTifMAJMzv7KE0WME6+HyNj2IyugZwQH+lO1bg++wvsBdV8HhZhel+6gMOes47Y9J5fjT2N8uOzLl61uBOK5X4WTkBkIcqdAWd1WHAF/6CPfXRchUGjX/XWkBDolrFo6vnyC7B46oHmF3jk2wrkohYkEy+jvDfmt0pMZGzeUnND941yUHvQi7CSRWuZ5J4PGc1bO/P8P0f7HmIJlHPf/gFyWoxvi8Ye3fRcNpRKdxOmgu2Oowzfymxtpv0BTjZ8N0E4WpdHc4Lkytu8GSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EO6KUCu3JGuzHIVuVIM4KDT+40PD1yt4ONaC+056r/Q=;
 b=n30hk+LbIc0yBUqisXM61wOtU5CkBP4nQZ5zf1qhuTj6TKk263+gH1V8izz9REYAGeIe6vowQvBBrdQcR4Ww6wHJtkdYC9a/7FTGm+JD/TK7hQ0QkPWxkeuSS13gLe4/L7RWssnR6D0GTPbfysulhxojku94pPfQVMnlhDVQ/EU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6ea06251-4e47-426a-aa7a-ef951100e8cf@amd.com>
Date: Wed, 22 May 2024 15:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] xen/arm: Implement the logic for static shared
 memory from Xen heap
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240522075151.3373899-1-luca.fancellu@arm.com>
 <20240522075151.3373899-7-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240522075151.3373899-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|MW4PR12MB5642:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ff5888-8a79-496b-9557-08dc7a61e4a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djVvcFpTTVBhYytaQmFQTUg3L1pDWjl0SDM0SnRGTW43RzdYbUh1VXhjRlQ5?=
 =?utf-8?B?b29nWTRDU1BUVTR6R09oc2NOMndLVGV6RHVQRmN1YVNBR1hxZGRqcVUxcEc1?=
 =?utf-8?B?a1NvWmViRnZ6TEdiNXFYQjc0ZVV6dGRRMlRuSDdobERrODVGRVpmNGg4K3ha?=
 =?utf-8?B?YUFwVERQZ3VJYy8zOTY4bzd2KzhHcU9BZC9oSkZJNTRFTncyL254NGJZaUw1?=
 =?utf-8?B?c0M3cTlmdVBIdU5tbkpPYmw2RXBSdzFQWURPSDNVTWNmU2ZjUnF3empyekxv?=
 =?utf-8?B?QUxpNGNqU1doUDR0VUJPbkZsNFV0Wlp6NGZzc0JkN0tjbTRtZXZnOUpWQlpN?=
 =?utf-8?B?M0g1L25RSTJMVEdGTDNaaWVNSHUwVUwzUHppcHpJS3FCSS9jYVgrOTg5djVq?=
 =?utf-8?B?VzNyQ25BSWdETkhSdXpEbHpPenAzZlFFbU5BTUJFalV2a2RQU01CUnBiRTd3?=
 =?utf-8?B?ckNwcVg0NlJqMWRRN0JZc1FZWmVFb0ZOR3dLVEhzdmwyNnFsNkZVZ09xVXBh?=
 =?utf-8?B?VXkvd3B5M3NWVVY1NlR6WjM5UDZiNHJRY2Y1aGZ6M2V0dndVT0p6RlV2cmhy?=
 =?utf-8?B?ZU5NelVMalBVdnRSR3FHOWQ1ZC9sc1lmdFZwQzh4QjNSTk1BVkFFTk5DNGFI?=
 =?utf-8?B?d1ZyZHVqR1pvQUxieUNUZGhLb0dnS2VkdERrcGF4TEpNTXNKcEpoYld5Si9O?=
 =?utf-8?B?WDhzeHNWUENLZHZCcjhGZlY3TTQzSTBXKzZUaDBOTHhxeXF4ZUI2YVF6VVJL?=
 =?utf-8?B?RjJGVCtGSm9sdW9EREtoeDdMczAzdC9MTVhIeGVqUXNNcTVxbkY1aGVHMDJH?=
 =?utf-8?B?ZjJEak01WlpsSWpNTncvRndxY1dWOElKS1dFR09PbEk5QkhiZmZKcFQrL004?=
 =?utf-8?B?Z1JaZmR2RGh6aS9ZVGVkdURuWkJKb1FITExEVHdNNW5ncTEyY0FjeGNwU25r?=
 =?utf-8?B?TmxYZ1dVU2wyUnF0U3RCc3ExeENUTGloUDNFYkdRL2MxRHpubUxTZHZhbzZV?=
 =?utf-8?B?MjBqOWsyL3Rhais5MThHRVowSnJIVGkvaUdrSHVOakhSODRERXR2OTF6K0Np?=
 =?utf-8?B?RFE4emNHbG9hejg5eWQyR3ozN1FjK3RZRmtEbHBkckFOMkZiWnlUUmRXRjZk?=
 =?utf-8?B?amthZW5LZ3oxaGpHUGJ6SUNSaU9Fc3VkN0pjeTBEUnlGeThvR1BCU256aU9M?=
 =?utf-8?B?VnlHeWJ6VU1UUmYwRWR6a0gyQVNOZzZmNk5YM011QWw3cXQra1lZRDhLNGpz?=
 =?utf-8?B?blgwWjNEYVhBNFlhWTAzNlF6NkNPNnJsTjFpSWQ5Ujd1MWxHakhtcU9yY0U2?=
 =?utf-8?B?dXlhUzdJRkdqdm9FWDVBdm1wTExkb3pBcktTbDI3OUlMa3JKRXFQbm0rdXdp?=
 =?utf-8?B?c3drQ2JISHJqZXJsOWk5SThRMVFnUmE2dVZCOExOL0xzR3NDWWh2aEVMT0hx?=
 =?utf-8?B?ajZ2WWdWSDJMbFY2TkNYZ1AzVFdYd0QvcnROTEJaVlhVOUNqRzdpcjFHODVr?=
 =?utf-8?B?OWY3TTJNVEJTdUdWcmd6N0Z4T2hncGsxbnBRVHhLM3c1UTZNKzNlaTFNSHBo?=
 =?utf-8?B?a3RYeUFzbXVxSGF1WGlNMGNpYTlWQitCd1Y3eUlQNUtkTnJjSktkdnNaWXJX?=
 =?utf-8?B?NnlyK3FyL1dPVGZ1M2xQNEc3MCtvOWNKMHdiTmdub3NMVVBYdXJCME10OTZm?=
 =?utf-8?B?Uy9DWXlSdkNqZnRtMWFnSTVmeUp5S0UyNEhQcjBzRnZkVm50NkRBMlRMYTdY?=
 =?utf-8?B?cVhFRnV0a2toNmxtZjNJZ1Z5b3l0Y3pnVGVVVGF0Y3lkYk1yYll4eGJ5bE1k?=
 =?utf-8?Q?n4QUV7mP9V2YCPP0uQoae0sX0bNhM54RQN5HU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 13:20:04.5369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ff5888-8a79-496b-9557-08dc7a61e4a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5642

Hi Luca,

On 22/05/2024 09:51, Luca Fancellu wrote:
> 
> 
> This commit implements the logic to have the static shared memory banks
> from the Xen heap instead of having the host physical address passed from
> the user.
> 
> When the host physical address is not supplied, the physical memory is
> taken from the Xen heap using allocate_domheap_memory, the allocation
> needs to occur at the first handled DT node and the allocated banks
> need to be saved somewhere.
> 
> Introduce the 'shm_heap_banks' for that reason, a struct that will hold
> the banks allocated from the heap, its field bank[].shmem_extra will be
> used to point to the bootinfo shared memory banks .shmem_extra space, so
> that there is not further allocation of memory and every bank in
> shm_heap_banks can be safely identified by the shm_id to reconstruct its
> traceability and if it was allocated or not.
> 
> A search into 'shm_heap_banks' will reveal if the banks were allocated
> or not, in case the host address is not passed, and the callback given
> to allocate_domheap_memory will store the banks in the structure and
> map them to the current domain, to do that, some changes to
> acquire_shared_memory_bank are made to let it differentiate if the bank
> is from the heap and if it is, then assign_pages is called for every
> bank.
> 
> When the bank is already allocated, for every bank allocated with the
> corresponding shm_id, handle_shared_mem_bank is called and the mapping
> are done.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


