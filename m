Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55996A46B8D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 20:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897197.1305908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnNXT-00047e-FJ; Wed, 26 Feb 2025 19:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897197.1305908; Wed, 26 Feb 2025 19:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnNXT-00044X-Ak; Wed, 26 Feb 2025 19:57:51 +0000
Received: by outflank-mailman (input) for mailman id 897197;
 Wed, 26 Feb 2025 19:57:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zorj=VR=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tnNXR-00044R-AN
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 19:57:49 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20617.outbound.protection.outlook.com
 [2a01:111:f403:2409::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec26a114-f47b-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 20:57:36 +0100 (CET)
Received: from BN0PR02CA0005.namprd02.prod.outlook.com (2603:10b6:408:e4::10)
 by LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 19:57:32 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:e4:cafe::ea) by BN0PR02CA0005.outlook.office365.com
 (2603:10b6:408:e4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Wed,
 26 Feb 2025 19:57:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.0 via Frontend Transport; Wed, 26 Feb 2025 19:57:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 13:57:31 -0600
Received: from [172.20.115.60] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 13:57:30 -0600
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
X-Inumbo-ID: ec26a114-f47b-11ef-9897-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIsprvmPcSrSqjgpy4GRhjUXUdao+pORGP2NSm7P9Zc1RJgqsDUGEtv/msRkcNn8p8YVdkcsE+aLZO4f6h+hRHM8fCPiEPvy207nmkB+K+WmPoNW2Zd34HUM/Q+HdEKabfgYf4ba04vN73oW0eGfkwWoHeCk2XDt6PAlYZH00OhpiPH4HzQYnu2OlrFLGvA1IkpwJTY2mQMRC2cHSbFLbxWBdowTLRCOxJYuYgkU4AzkKa7W6cloG6EuGal5tYE/oWRzRBQO1ZboxCG9BIVnd6aDvieyS13aewpbUd5JAKbV32Cb9rd5mxBIOlCyc0pXwTzK8iLHc0993NToGwBkjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84IQsjRhbhJrCp2aAXmYEDyJB0YeW06zMc8kMk8us4o=;
 b=XAHG9w6Ahzeygco0nmZhw48bHCPV52kcSMU7H3h0CTHs6CypGGL+nFAqa1gEhZSpIhjqDQ1cZuMPdakXRbef/rnjqZL/9hHqSMVSSrKres3NaFE3TM8NiCXkITS5RK7rIFxbTTN7bO+k2Wlngw5XdEaEvq6tU1qeulOdekZMCVojfojbwaPEuGenqgZFTyYdpsb8h6pEjNATlhRV93SnQJHmhKsbHfe3arHU+I2S9WkvjjbD6B9cBo2Eyd+Q55tLY6Vo5fcX7eM22KkYJillS6OiIP2yjKfbOvv0bfxt9pZluSfK87r51UUgJR9/AKeirONvE+SW8gcnvFq1qI6IKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84IQsjRhbhJrCp2aAXmYEDyJB0YeW06zMc8kMk8us4o=;
 b=4vyGIE5FiCMb1hIkCWxAgaC+1ruFTXFW6KroOdG2LK7TD8P7eDpvHF26NDUsE0pGWFCHKnnJbJAlryAmvsuv4JG0Qe4q0v40gN62e+BlE2tPbO0MnBFUoS1KHFJ0g/D7LknZYW145bB3R4TEQcLWxjIS+LVH4ZfRDAo8CbXUCRk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bcfad8f5-fa69-46b9-9ded-a6ca41949ff1@amd.com>
Date: Wed, 26 Feb 2025 14:57:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: drop pci_segments_init()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony Perard
	<anthony@xenproject.org>
References: <4ada4343-c65b-456d-b0c2-9ae59937aaff@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <4ada4343-c65b-456d-b0c2-9ae59937aaff@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0671c1-1b4c-48df-6958-08dd569fce6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlgwKzBiWS9kemdrYmk0MHB4NkpWNXVRcmxoc1E4bGhlRExTS2I1RzZ5bFJV?=
 =?utf-8?B?L3ZTbHBkTFBjbnBxZEg0eUNyNVFLR1ViYXFscVcvc2JaRHN4dFh4MDFzSmpP?=
 =?utf-8?B?akNYNHlPWjdLRjgwREdxSzBLK3c1OUNqaEZzQmRtUFI5MVhiN1dGdGRBeXZh?=
 =?utf-8?B?RHBKNFRodXZSVGhCd244dzZoSENYTXVOelAxSzJhQnQ3ekJZTHNKR29pUy9M?=
 =?utf-8?B?VjZwMEdQeFhxRlN0WDlmSlpkYmIyQmFaZitYN0VGLy9mU1ZROE1MT1cyVGI5?=
 =?utf-8?B?c0FnZng0dFd1aCt4Q1ZIc2E0UXBsR2xQZzVyNXM5MzB4WjBzb2o5ak45N2JZ?=
 =?utf-8?B?dCtZV3lxSmNUZXNBaTRwSkVCTlhQWXpSNk5UVE9CMXp0S3JvSkJ1UE9lTUxC?=
 =?utf-8?B?SXdJT3p2VmJqQkRYN2Y4NXhrLzFPZ2MzaU1PYVFudmdVN2UxWEd2MGllOUtM?=
 =?utf-8?B?UURYMzBMT3ZPc0RjenlKaEpYWSt0ZlZpbmxGOHpjckJ5KzZhZmtyN284RjJo?=
 =?utf-8?B?M2VJUWt5U3ZJT09BUG1FNGJ4YWVkQWpabkR6aCs1UGREbi8rM01SZk40blFG?=
 =?utf-8?B?Z1J1ejROOTRJYVI2aGFBVXdJVUdTOU84bThBcFIzcHE0Vm05cnFRZzY4aURz?=
 =?utf-8?B?Q1NPQ05PTEtlSDJPQ2E3Nm4weVNaOG5XQlJZY3o2UC9EMGs3azAvYXM0R0R1?=
 =?utf-8?B?WERaMERtRGxETGxKeWplRVNObnhSb3hNbGlHTnFZemNsRDlFd3lKeS9vdG9K?=
 =?utf-8?B?SnQ1TkpwUXhUN0l5S3BZY2VPN0VMaktDaDdmMGZjRGY0SGQ3dllKSGZ4dWhr?=
 =?utf-8?B?V29OVEZQOStQcWxyb0lOV2lQcFk5YkRwZXZya0NIQmgrcm5tRFRrWG1SNTFZ?=
 =?utf-8?B?M3U0dXM0a3FvVlpWM0I1L2I4aGgybE9kOXRqM3FFUHJ3SitTSEJBenhsdkJF?=
 =?utf-8?B?ZmtiZUNNU2JaUzFhdlM0ck40TmI1N2FHRGVLQzNwZE5vZ056dlc1Y2VVNzl0?=
 =?utf-8?B?ZFpXSEFUR0c3aTVRYjZvNi9pTUdueURaMnVnKzJVQTZJQVljQUJCVVNFb3Nu?=
 =?utf-8?B?dStzanV5WGZ5U1pxT0p1Q2diM3lQRWNWYklTcVlpbVQwNytBNnhtbkVNd09w?=
 =?utf-8?B?NFhrSkcyc29IRlhwSzVCUE41UkxRVmtPRXVGaDg0RXNyUmFQemhHSkVXSDZN?=
 =?utf-8?B?SXpuMDdrQWQvMS96SlZZcVU2Zm1wV0hheThkek9Hc2ZwY2FDL0Zzdy9tQ1l2?=
 =?utf-8?B?Tlh0dk5xQkdMZXhBaXdYN1dycGZxY0RKVllpaXM4cmxtK2hqelVZbXVCNy9D?=
 =?utf-8?B?OStyejcvVlRyQzhQN3RLalppSW05WmxHaUoyV0R5ZVFMQ0pHT0xPbWV3RUkw?=
 =?utf-8?B?aVdLcjdNYjBwcE5wV0ZETUM4dTFEbXZOUHF1ZEpaM3BCQXQzVFBQUERDOFVr?=
 =?utf-8?B?TThETHR2dFNzNHNqOUt6QTRXZkpVV0llUnN4c2thR1dwb0RZenpQUFZ2allm?=
 =?utf-8?B?UEFOY0tlTmQ0d3ptNm1BK0RrK0xuZDc2b1NacmlBQ29TejNlZk1oekZMMGF0?=
 =?utf-8?B?M3EwZlI5dkpHVE91b2VUTnM1elQ5bGk0eWYyTFlRZHkrbXo5Ry9pVnRVVjdz?=
 =?utf-8?B?cVNXWjMrQ09hbFVrbXFOVStrRGdDNnJkQWc5ZUxaRkQ3OG94MkZWRk1BRDRp?=
 =?utf-8?B?bE55ZEgyaWVzbUk3ZjM4d2dNb21FNEpaY0RPSlRXbEdHRnY4WWp1WVRpWVVG?=
 =?utf-8?B?ZUJiSzhqOGdxNE8vR1grSEd4YlpkRmpXd1RlZEk4aEgzcXZ0eFJGSEZ6MXgx?=
 =?utf-8?B?R2tuVTdVRjZCSDdtYVRYVHpsaVJQOU1scGxObzBMbm41Q3VjMVpGeHBZbWpz?=
 =?utf-8?B?L0lNdHpzK2lMV0dleDhwa1RaUEg0YlJCK09wVVNJdVNUWjdoMElzWEZRR2tZ?=
 =?utf-8?B?M3gxRVpoTFdaa3ZDUkpVa1V3ckV6aXZ0dk9QekVFbUY4a3JOMWl5UTBYeEVt?=
 =?utf-8?Q?xQubwx6LDXMZTIHR3+SYZ3QAg1wJn8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 19:57:31.8944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0671c1-1b4c-48df-6958-08dd569fce6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451

On 2/26/25 06:38, Jan Beulich wrote:
> Have callers invoke pci_add_segment() directly instead: With radix tree
> initialization moved out of the function, its name isn't quite
> describing anymore what it actually does.
> 
> On x86 move the logic into __start_xen() itself, to reduce the risk of
> re-introducing ordering issues like the one which was addressed by
> 26fe09e34566 ("radix-tree: introduce RADIX_TREE{,_INIT}()").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is entirely optional and up for discussion. There certainly also is
> an argument towards keeping the function. Otoh on Arm there is the still
> open question whether segment 0 really is kind of special there (as it
> is on x86, largely for historical reasons), or whether the code can be
> dropped there altogether.

Segment 0 is not special on Arm as far as I'm aware. You can have a
perfectly functioning system with only, say, segment 1, for example:

(XEN) ==== PCI devices ====
(XEN) ==== segment 0001 ====
(XEN) 0001:00:01.0 - d0 - node -1
(XEN) 0001:00:00.0 - d0 - node -1

Segment numbers can be arbitrarily chosen by specifying the
linux,pci-domain device tree property.

> ---
> v4: Move x86 logic into __start_xen() itself.
> v3: Adjust description to account for and re-base over dropped earlier
>     patch.
> v2: New.
> 
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -88,7 +88,8 @@ static int __init pci_init(void)
>      if ( !pci_passthrough_enabled )
>          return 0;
>  
> -    pci_segments_init();
> +    if ( pci_add_segment(0) )
> +        panic("Could not initialize PCI segment 0\n");

IMO it's okay to remove the call here since there is already a call to
pci_add_segment() in
xen/arch/arm/pci/pci-host-common.c:pci_host_common_probe()

If there happens to be an Arm SoC with segment number quirks, that
could be worked out in a SoC-specific xen/arch/arm/pci/pci-host-*.c.

