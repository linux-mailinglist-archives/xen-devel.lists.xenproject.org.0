Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6625A7EF5C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 22:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941179.1340696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1tCq-0002uU-G5; Mon, 07 Apr 2025 20:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941179.1340696; Mon, 07 Apr 2025 20:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1tCq-0002rk-DF; Mon, 07 Apr 2025 20:36:32 +0000
Received: by outflank-mailman (input) for mailman id 941179;
 Mon, 07 Apr 2025 20:36:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcrT=WZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u1tCo-0002re-2K
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 20:36:30 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2414::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa11c1b4-13ef-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 22:36:27 +0200 (CEST)
Received: from CYZPR02CA0009.namprd02.prod.outlook.com (2603:10b6:930:a1::27)
 by MN0PR12MB6054.namprd12.prod.outlook.com (2603:10b6:208:3ce::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 20:36:22 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:930:a1:cafe::ae) by CYZPR02CA0009.outlook.office365.com
 (2603:10b6:930:a1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Mon,
 7 Apr 2025 20:36:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Mon, 7 Apr 2025 20:36:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 15:36:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 15:36:20 -0500
Received: from [172.25.231.87] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 15:36:20 -0500
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
X-Inumbo-ID: fa11c1b4-13ef-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ew9ddP/j/ixPD+qXe2/bI00pff6Sj1+I0akRor4ty1bO/2c09fOBoO1gGqwMHvhI4Na2uV86G8hwG5lAuNJbbtlDSertj+SYMNWvbU4Lx+0aYH3edtGwpgpsnGAVVK3agR5XDzRe4TSOxHQ79/sDqat3Ee7pZm3q3nW8cPydGlrsNHW+EB41rAZMDOXq7/B1NklvLH5PayY+GOec3cSRIfEnSkx7j4TAai+zB6loNE4ht8M2K0z1xEjNx/AhiJns6L4JvoOnj2PKw7awkzL11wzcnD1q+Be7UGjGVj4r6hNUnjgtn2fIVF91UW+5AeL8TcthukLekDIWIoCN51KYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWAC3/iDV14JOgClU2ZYFqE3Nz+XQbJNT637iEKRIO0=;
 b=QwWezsvnDE7wyTUONVHyL+LBU2ekiONEAgLi2rwdx1IptQu7bhob27J/OVSH/rQZjuhqyLMqF10m0NXVqZjZ8BhntIi8z/vTdv9m1hmYPlJDkl1BHEFFLtibunu0gHoEd/d+wPpHEqB5NP9UgwQD70Qwe+nKMLw6MYPssJ3Hw5df++lXUiZnGArhriYDQ18UOMJVLgoIcFst2cPkOHn8QfRNqBwuPoETz1iy+FZsBIIJBjqHKVOHpk6XTUP4rzMac7pZUwiVcgSGhsSqC1KeTtd5lDqhfRufa9ACWl235CUDDuKRABTlHMKQ65GaQPU3CzMuk4JBIHlQcAPLBv5JSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWAC3/iDV14JOgClU2ZYFqE3Nz+XQbJNT637iEKRIO0=;
 b=C59JZ0HX4CIihwqUrSCaG4HM5C9SH7ZtoBPhMCVFK5Y1yGR4lf9HWtQ5LC60Aqxsr/H1c99G9EiU8EnQE26LLZ+EIACNvir+zvba3zkS2OgNncAIo9OC2oFk/j7JHAkeGqnNcZvc/ZlRWGnqmjT5XHtWTk63N6tdti7NyLZCI2E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1771acb9-e28b-443e-b603-f0dedcdc3c54@amd.com>
Date: Mon, 7 Apr 2025 16:36:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxc/PM: correct (not just) error handling in
 xc_get_cpufreq_para()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Anthony Perard <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|MN0PR12MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: fa33a8e5-29c5-4db1-919d-08dd7613dbb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qll5dCs1MkR5RTJYbzgzOUhORzhldDIxSTNGVXN0TlUxM0tPUTZ1Z2VQbnh5?=
 =?utf-8?B?azZkWlc2ZWFpaEJTbE5Wdk9KSmt6cVI1NkZKWUdmUzJDYzA0S2QyOGpLeXBj?=
 =?utf-8?B?aXpyODd3R1ZlUkQyQWo5bHZMWExocXcrUTg3NCtIREh2QjdXRVZPczdZY094?=
 =?utf-8?B?KzRTcmdVMDcraE9KUkFYZmFyVTFCYVpody9qb2gxcGN2Tk5QaGk1eHJNVTNj?=
 =?utf-8?B?MzNvZHptbU1CZDNBa3Z6SzBobmVYZ0Q5TWwyZlJUYTN4azBpYisxZCtzb1g3?=
 =?utf-8?B?Z2NucENUWlA0OEZqSW82K3F6c3lkNGFFUno1bGlQKzhJcG0vU3FzWFYrSElI?=
 =?utf-8?B?QVEvYzRiMjRFOUlLZ28zVlFHVjZqaUsxTlZaQ0QvN29mZkJhRDB4d2JycXRD?=
 =?utf-8?B?TDdGSWNUQVAzS2QzdURuclJEYXA2TFNoYjZCeEJwWGlDTzZGZ3Q5cmFVMVIr?=
 =?utf-8?B?d09RVjJOVUNkWCtsOHcva1RMamczYnovdFJwKysyaDEzYXJxSkY0NlVadWZT?=
 =?utf-8?B?ZXcvSkxnTU5KMUtsRjRqSTRjYUVoQXdWTStCVWc1YWg0L2w1VmUwSC9PNWEv?=
 =?utf-8?B?TzhiS3pWc1dMc0p2UHpWaDlsWUVIamNmOVNmWTBNdkNmUFdFSzBHTUxTOTN1?=
 =?utf-8?B?ZkxCWWdhL1JFOC9PVitOZmNWMnRFUEdaS0VCcFJmbVFjekpwZGhrSVBnOGNI?=
 =?utf-8?B?cVZIdnJaa2pubU4vNXdQdHdzM21LU3N4UThpZmpJRnJ4NmludGJIQjhjNS80?=
 =?utf-8?B?MGpvN3FHNjNoUzFsY1BrWHNLajRrMlF3eDl3UFRYS0Z2dnowUDhQdnNKelhj?=
 =?utf-8?B?RFFJQmZCbzRlWUhCaWtIQ2ttOE0yWndqVWhLV3hNZnhLWm4xMk1zNDQ3Mk1w?=
 =?utf-8?B?RldvOVh6N3BCYTdFOHZ4SmxiYkpLZEZlSXh3dlQ5YUxPQlBTUHloT0gzbUVB?=
 =?utf-8?B?N3pIZ1djMHNKTXh3YWQyMUpMMGduYTI2a015NE5NazJtZDYvSktVMys4U0FW?=
 =?utf-8?B?YzUvVkpZL24xa1JsTzFQTjFuSGUraktJZGk5NjUvd3k5OExKQnpYVHNZUFhn?=
 =?utf-8?B?ajdXdjk2K3l1OHNvR2R3d2dzeE9MQTNxQVUvTnVWWUJUSzA4anAwRmg1Zm1q?=
 =?utf-8?B?NGFidkt2M3NhNjExNGI5VFJlTm91S0FFRGdRYU9JeHB2Z0pkMnpYdUhiYzR0?=
 =?utf-8?B?R2FEODQyTitFcnpFcWtYT1lIQ283eHIzQnZlRzMzbXUvTFN0eXk1S3gvdzA4?=
 =?utf-8?B?d3FWVEo5RWNqTmhhZGxQV2M0Zlh5bXBnWWlJOUFCMitiQk5aNXpjd3ZoMHdk?=
 =?utf-8?B?c1pBQ05aQjQwNU9OMkFrdWpxMDZUWXV1V2xLS2tjN3NGZmsvMnhGVllTNGFB?=
 =?utf-8?B?ZWRKV2FndnExNmJqdDl3LzFjdVh2Y0t3VVN0MHUrYlNqK0JXNkJEbCttUHFH?=
 =?utf-8?B?c09IUXlmQ0RHVnFQejZFYVB6NXVFWWM5aWxVZ2tvN2lNd1pqY0YyT0FDa0Nj?=
 =?utf-8?B?Zm42VjVMNWxWWTBFZ084ZENmek1FTnk2NGJnSCtZbXdvbFczY2Zrc3NaZjRB?=
 =?utf-8?B?Q0l5b0lTSFpxVUpJd05JUjlaaXFUZjZ6L1JhSXJFQ0I2VittWk82R2lEbHFU?=
 =?utf-8?B?WEJBRG5XYnE4eVVzbHlLdWRDZHpHS29PbWtxV1ZzU1U2cXNoZTA2WGpZcFcy?=
 =?utf-8?B?TWl5aVdhS2FRYlBHamV3dkpWVnlKay8rc0M0ZkU1KzQ5V2Jja3JTcUx0aGpk?=
 =?utf-8?B?RlpCVGVXdGsyVnhpS1B5b1pNK2llcDRSRHg3YkN6bmdFTHhDVWZiUDJKdFcw?=
 =?utf-8?B?NjdRTjZkSXB3SVBrWTk3cTZDMHNRbHlKNHYwV2c4Mzl3QUZhRTM0Ym9vOTJ2?=
 =?utf-8?B?a05ta1JnMUhITk9lZXAyZGt4THdRTFUrOWNNSUN1eGsxYkpGNlpwRGNEbjVU?=
 =?utf-8?B?SkZ6Z2VkUjdmMGxNMzM4ekRkMmhCZW1kV2lxNTlZMzV3MlVTcnM0SkN3VTMx?=
 =?utf-8?Q?X7YmY5WOBHnrLs8RrtyPbVJL23/AH8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 20:36:21.7743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa33a8e5-29c5-4db1-919d-08dd7613dbb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6054

On 2025-03-27 09:32, Jan Beulich wrote:
>  From their introduction all xc_hypercall_bounce_pre() uses, when they
> failed, would properly cause exit from the function including cleanup,
> yet without informing the caller of the failure. Purge the unlock_1
> label for being both pointless and mis-named.
> 
> An earlier attempt to switch to the usual split between return value and
> errno wasn't quite complete.
> 
> HWP work made the cleanup of the "available governors" array
> conditional, neglecting the fact that the condition used may not be the
> condition that was used to allocate the buffer (as the structure field
> is updated upon getting back EAGAIN). Throughout the function, use the
> local variable being introduced to address that.
> 
> Fixes: 4513025a8790 ("libxc: convert sysctl interfaces over to hypercall buffers")
> Amends: 73367cf3b4b4 ("libxc: Fix xc_pm API calls to return negative error and stash error in errno")
> Fixes: 31e264c672bc ("pmstat&xenpm: Re-arrage for cpufreq union")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

This fixes the currently broken logic with has_num, so I think it's a 
good change.

I think the gov_num==0 no longer happens with HWP because it registers a 
governor:

     return cpufreq_register_governor(&cpufreq_gov_hwp);

Unfortunately, I no longer have an HWP-capable system to verify.

Regards,
Jason

