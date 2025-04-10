Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9807BA834EF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 02:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944850.1343176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2fTx-00009D-D8; Thu, 10 Apr 2025 00:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944850.1343176; Thu, 10 Apr 2025 00:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2fTx-00007T-AF; Thu, 10 Apr 2025 00:09:25 +0000
Received: by outflank-mailman (input) for mailman id 944850;
 Thu, 10 Apr 2025 00:09:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Tv=W4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u2fTw-00007N-9N
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 00:09:24 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2415::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c3f2718-15a0-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 02:09:21 +0200 (CEST)
Received: from BN9PR03CA0946.namprd03.prod.outlook.com (2603:10b6:408:108::21)
 by MW4PR12MB6852.namprd12.prod.outlook.com (2603:10b6:303:207::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 00:09:16 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::53) by BN9PR03CA0946.outlook.office365.com
 (2603:10b6:408:108::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Thu,
 10 Apr 2025 00:09:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 00:09:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 19:09:15 -0500
Received: from [172.25.231.87] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Apr 2025 19:09:14 -0500
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
X-Inumbo-ID: 0c3f2718-15a0-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8KvLqn4vDw6BFDVexnKfhU9xi4qcTcApnzxTiK2RVJRlNBLJE3SILIMa/lWJfRtdhfkgbla7hoCcxbYptLL4SXWblJ+sTIFSxnezy7TcAtSdR8B2e1ZEwLYREO/tAUVKpH0R8rMvMnRAd9pHaLOLzEnLIAh87YpLOBBa3WE902BeOhBhKfIWOntxieS9FXAb+PxH+OUc9sA+wQvGIAlaPTlgbDsBN1SA+o8zXyhIbgpIQSgfE+jJGFeC/oM2OUpeNqUNO8BKs8TpL8l0v3eh41LjwRDtjx3EU4iQ00mPDY049FLcSgsOe3puNy9ly8HTlPdn1HhuIE1K+qIK67T/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZlT5Us7mIiHxX89uKFrbQyqvHBxoaXWK3lidXiSWHM=;
 b=lFUGKRnhSkG0wG7yIdTAugkNyPsJOcewJW75CiEE3Skbtw0YXt38iuXVjzFqaxL9LIMiYOnkRZw/8n2JwKm1sbaihO0sq12oxoHI+3kLKe9bCPrgqTl3zk7lck+FDETMhlssMnTSFmnQcJLlPEaj7Cp+xKxvQMlUO1VQafZC/BdouEY3P7TDGv5xDesnl1xa/dW8HQDxtJHp0sIhszjgyYmQWScSwVy4zMzJqZDS7QENMCgflAo2qalcch4vP/bzsy9DXFFv5GPbi2asNoZ7DC+jJyqtTFnyHIO2ij8m0eY4P8is+6iwm7Frztp5DZ0u6WUoM/R83AP46XCnmzyYLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZlT5Us7mIiHxX89uKFrbQyqvHBxoaXWK3lidXiSWHM=;
 b=VKyWTmM9hQYdd/7oys+3GAkp6P4l52UiwboxVNZMTf4pcyKGOYycb/jbVz+edjvsWPs3bYP99O0uZO8SbPFnUlcfovtjHmx0Od2N8B0m0WP0gWbykwyqvtHizQqNIuJQbjbme7j6izJuIcGmXgLzO0o9jAMVB9+q9dSLX2Bll9Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f7b820af-b548-4dc3-9af7-9d2214a232b2@amd.com>
Date: Wed, 9 Apr 2025 20:09:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH TEST-ARTEFACTS 0/8] Cleanup and Linux ARM64 support
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <828cabc9-512f-4c2f-a7d7-b9c8963c1300@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <828cabc9-512f-4c2f-a7d7-b9c8963c1300@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|MW4PR12MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 104316ec-62c4-425d-47a0-08dd77c3ee23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzRLTTV4MENjeDdicmtDSlJGTW5sbEp5d29KMng5RXUwSndJenVDOGt4cFpp?=
 =?utf-8?B?SjVQYml6aUVnOFdhYmJjMVZONml6WVRibkdvM3NDTCtmbjVuZG9CL0lad3Vv?=
 =?utf-8?B?bjlKRXN6N1ZZVW83RFI5cXZETmpkZW5FR25ITlhTaG1zT01STWgvc1FKUisx?=
 =?utf-8?B?akZlUGYzUERSeVlNK0tPRGIrQ0IxSjdXU3ZaWHowbGs5TXYxYjgxMk1XNTVt?=
 =?utf-8?B?Z1ByZllCT1ozRHg0dFVOOGNBajRaRUYrQ3BzM25vL3hUZjVKbWRrMzNiMHht?=
 =?utf-8?B?ZElRaGlaWDBNeEFCcHQxUmJlT0VYVmtaenY5WW1zazdnRkovRDBlRjlTUjM2?=
 =?utf-8?B?b0NsYzJNSWNHdk5zcmFxdkZ5cWovc2RHbHd0QjdnNngwTHBSaFR6RzRDSFVK?=
 =?utf-8?B?UVRqaWk4MEtkU2Zuc2RXL3ZSbFI2MFNOMXNPTWVPUFdvY29oQVFzL3BDaThN?=
 =?utf-8?B?Rlk0aHFCcnBuSjkybFpiSnBQRFZHcVBPZCtkWitwQzdPRytoK1hIYUd2NExv?=
 =?utf-8?B?VkNyemg4U1Rwb1ZUc1BrSUlCbGlYSnlxZUhldUJ0Sk1RdHhCdzlXYTNSZHg2?=
 =?utf-8?B?MFU1OHNGWmFTWEVVdDdXc2ZzMTI2Vm9VZjg1V25NVklueUU1VG1mVW5yKzBU?=
 =?utf-8?B?azdnbXdtVXJpa0orbm5vd21QNHM0QlRINTJQcVkvSHFUNXhTN2QxMTRocVJN?=
 =?utf-8?B?QXI4dVFnbjV4bEZqZlN5empwVlQyNEgrK3ZEdXNUU3Uxa1NlYlcwSnkxYldG?=
 =?utf-8?B?NWVVdDZFbW1DdUVROTdtOEFaUUZSMGlaN3FUZzVwUUh5WStXS2VnQ05tWDZx?=
 =?utf-8?B?cU9OQUFMT2hYR2lzOHdyQ2JvWWpzM3poaThLZHQwSlU4djZmR2h4R24zY3JL?=
 =?utf-8?B?SDdWeHY1b0tucmNySDRsR3dkZEY5SEtzWXEwM0dyS2p4aFg5Rkc2WEtjQzYy?=
 =?utf-8?B?dnR2bHVxZXArYmdOdWZDMDU2WVYraFZweVh5dVRJOWdVc3ZDNGJJQSs5aE1n?=
 =?utf-8?B?aHdpNFpyR09lQVNQN0xJVTRoQk1YV2Zocmh5M2hoak5PdTZDcGh0bTdxL3hk?=
 =?utf-8?B?Sk9OOUJNTEVnZjBPb1BWOEQzbWdHSDZhcVIwQ1kxYmRFOWF2RzV0N2lqN2s1?=
 =?utf-8?B?L2JtQ2ZwRHhrQVh4Qk9McmhmcCt2cjBqQ2kxenBZUENvdEIxSVVGT0RHalNF?=
 =?utf-8?B?TFllWkJHMWtIc0xBTTdmaVJtaktCTFhKbUQzalB2RGY1dk1XeFJVWGZ1aTZi?=
 =?utf-8?B?OEx1N1JBazlZQTRGQmMyMkRMdDcvWU93UDhwZnU2dG1peVBtMFFTdlRoWHhX?=
 =?utf-8?B?K05kQ3lERkt1UTdUT0NtQ2tQNnVzUStMUzZxK2huZFJSWHRVeEpBUldhVUdn?=
 =?utf-8?B?Z243eVV3VHhyS0IxQ2F4dlUvRU1JanZMaHBVbklkLzB5U1o5Y3JpZEVPSVpO?=
 =?utf-8?B?aGM3MWlJczZOeFA0NW5XMlVDY1QyWmMzcGFCN2QzQmczZENVQ0xCcjVsaUVU?=
 =?utf-8?B?RVIyMksydnN2bHEwQjZ3VzQ4M1EyYmwweVpNYjFtbUs4dGhiNEc5eVFiODJC?=
 =?utf-8?B?ZnhoR2FyTUxMTElLS3pGSU5ZMXR1b1hyMENmUnhEekcza1JVelVkZkErS2or?=
 =?utf-8?B?cExEUWlnZXhIaVdVbVBaZmNLY1hKck9jR0dyZlE0eWFGQjMyeEpxVk5sNVRJ?=
 =?utf-8?B?OElnYnMrV21wazJYVGhNMkpLSDNlMys4S2N5QmxLaTRvV2NXcko4TzJLYjdJ?=
 =?utf-8?B?WWV0eVczSnJzYWNtcEZEU2dkbEVlVTFCZXRHZDhaMDlaWTUvNlVhR2VtUThD?=
 =?utf-8?B?NkxEQ0ZTaGlaemMxUVRCSkx1S3RtOHArWHllMWN5V3VDWmt2RHF1Q0NmSjcz?=
 =?utf-8?B?QnBERTlncmJ1aG1MSUFJaWtjU3M5QVlRSmFsK1pNYThGZzM1bkhMOE1YSGJR?=
 =?utf-8?Q?VQ6J/tW5fmA3pWVfyoafAvib2ED6PH9w?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 00:09:15.3659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 104316ec-62c4-425d-47a0-08dd77c3ee23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6852

On 2025-04-09 13:01, Andrew Cooper wrote:
> On 09/04/2025 5:36 pm, Andrew Cooper wrote:
>> Various bits of cleanup, and support for arm64 Linux builds.
>>
>> Run using the new Linux 6.6.86 on (most) x86, and ARM64:
>>    https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1760667411
> 
> Lovely, Linux 6.6.86 is broken for x86 PVH.  It triple faults very early on.
> 
> Sample log:
> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/9673797450
> 
> I guess we'll have to stay on 6.6.56 for now.  (Only affects the final
> patch.)

This is an AMD system:

(XEN) [    2.577549] d0v0 Triple fault - invoking HVM shutdown action 1
(XEN) [    2.577557] RIP:    0008:[<0000000001f851d4>]

The instruction:
ffffffff81f851d4:       0f 01 c1                vmcall

vmcall is the Intel instruction, and vmmcall is the AMD one, so CPU 
detection is malfunctioning.

(Early PVH is running identity mapped, so it's offset from ffffffff80000000)

There are no debug symbols in the vmlinux I extracted from the bzImage 
from gitlab, but I can repro locally with on 6.6.86.  It's unclear to me 
why it's failing.

Trying:
diff --git i/arch/x86/xen/enlighten.c w/arch/x86/xen/enlighten.c
index 0219f1c90202..fb4ad7fe3e34 100644
--- i/arch/x86/xen/enlighten.c
+++ w/arch/x86/xen/enlighten.c
@@ -123,11 +123,10 @@ noinstr void *__xen_hypercall_setfunc(void)
         if (!boot_cpu_has(X86_FEATURE_CPUID))
                 xen_get_vendor();

-       if ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
-            boot_cpu_data.x86_vendor == X86_VENDOR_HYGON))
-               func = xen_hypercall_amd;
-       else
+       if (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
                 func = xen_hypercall_intel;
+       else
+               func = xen_hypercall_amd;

         static_call_update_early(xen_hypercall, func);

But it still calls xen_hypercall_intel().  So maybe x86_vendor isn't 
getting set and ends up as 0 (X86_VENDOR_INTEL)?

That's as far as I got here.

Different but related, on mainline master, I also get a fail in vmcall. 
There, I see in the disassembly that __xen_hypercall_setfunc()'s calls 
to xen_get_vendor() is gone.  xen_get_vendor() seems to have been 
DCE-ed.  There is some new code that hardcodes features - 
"x86/cpufeatures: Add {REQUIRED,DISABLED} feature configs" - which may 
be responsible.

Regards,
Jason

