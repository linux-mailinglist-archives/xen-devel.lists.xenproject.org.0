Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 564E7A5709D
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 19:35:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905314.1313187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqcXK-0006w1-GU; Fri, 07 Mar 2025 18:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905314.1313187; Fri, 07 Mar 2025 18:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqcXK-0006u4-DR; Fri, 07 Mar 2025 18:35:06 +0000
Received: by outflank-mailman (input) for mailman id 905314;
 Fri, 07 Mar 2025 18:35:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EBm=V2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqcXJ-0006ty-9U
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 18:35:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2414::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e14d9284-fb82-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 19:35:02 +0100 (CET)
Received: from SJ0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:a03:2ef::10)
 by SA1PR12MB9491.namprd12.prod.outlook.com (2603:10b6:806:458::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 18:34:57 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::7c) by SJ0PR03CA0185.outlook.office365.com
 (2603:10b6:a03:2ef::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Fri,
 7 Mar 2025 18:34:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Fri, 7 Mar 2025 18:34:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 12:34:23 -0600
Received: from [172.20.156.222] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Mar 2025 12:34:22 -0600
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
X-Inumbo-ID: e14d9284-fb82-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rI2oEv8RBh0otq4G24T0b8FxU73iTNf4ySzJfGAg3XTCaU4A3t9FlLt6IehN7b1btc3BxYVt+88xubT+vwuDGrcEgV2GPUbant4HJeiC7YfvtDD/q2OaltJ9YXOepC/YSYLXe7L9pO5GKO4+XCgWUj/RAGLvfDGFKBwEfFI6vqFq00n9o4PVp/qqI7Bd78ANMIFfif28+3zjnXun9G8vJmTBb7kjyx/YRsRJ7ZIKshUPZv3yk6PiwxvtaOC696fnqFTh24aGsTDXduvi4PKYyLdnRFB10FqjNrkma0JGY22iS9Qm5gZQyZu9KrdZASP0sQDnVo72Z6Z4mnUK37VXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seKkujC0nE67B6XURNIfxyizCZTe4rYHhb47ttCs0mo=;
 b=lanpnsP8EQ6f/Tbi/ABW4ck3x1rZOfBjicesZNm5lbjZmBNPybITAv91i/UTLA7sxjsR6e0UVYbWNwWBGUvPNV4J+t76igFjDno/zAzGnmNpoA/F3g5urfFykRLyKBpNOVassFmvFsThafjY1AzuaLu8vdylDJoaOSkXvJjKii0ezoo8M2C0zG4pNvtmubp7Ci+bc3+FcAANs/FQEtaJetKGTgbyQW6xDgJK9sdsa9Tv2ZLWVzCfDG32+JY2NPQyW4jZS9NPgCBLMjv8dXzkhC2vSXTRneB1j0RdgJ4OGq7q5L9Q9IO9j8SMpdGNsvKh/nF9lHusjaysXe0zagD/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seKkujC0nE67B6XURNIfxyizCZTe4rYHhb47ttCs0mo=;
 b=CgtUy5Pg00EPZ26X+94z56HBcuatNOnEAV1gHJpfpoZyFB0S5ZPsrILlGLlPbRZYeWCWsrk2YJen5UcbOrea0JnrEYDdf+q/gRCD4RZ83kzLiUCX1XLzyecI++pwoNxC82+GGMJVczGQ6tVp0ilCDDOYUtw/unJL4rrm3QOkAW8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b5cf6ff9-2bf9-4060-8e30-774da4a87cff@amd.com>
Date: Fri, 7 Mar 2025 13:34:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/23] xen/arm: dom0less seed xenstore grant table entry
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-9-jason.andryuk@amd.com>
 <alpine.DEB.2.22.394.2503061744590.2600338@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2503061744590.2600338@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|SA1PR12MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4e6f70-aa48-47c9-e719-08dd5da6c2c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clYzZVdlcEwyNkJoWHFBSEx4SHBmaU5qblhNMEcyOHJUSFJYR0E4UFRqUXJ5?=
 =?utf-8?B?MWQ2RE94VEo2a3JVSGpRSnF2VStZbnF3Tjl0QTJwNmwyY1I0RzZoTEtkRWJV?=
 =?utf-8?B?eFQ2WEtOcFNORHVrTnArMTdIYSt6aEJLYkhKRWM5aUt3VmxPcFhmV2s1aXox?=
 =?utf-8?B?VFhWOU9KeHJYd2d1UCtTcEtrZVVNNkg0MUpwbGErT3RRWHRXR080cHh3V2R6?=
 =?utf-8?B?ZGJTWWZSc1MzRjlZMnJBdTlreTRTckNZdFpaWmdHMkl5a0FnTkk3TWN2bWho?=
 =?utf-8?B?T25aa1QvbnpMQzcxK2I4NHNkb2hZUnhYZURzN1JSSnhRditJYzhkaWtXN3Iv?=
 =?utf-8?B?a1VKK3Y0Y1RGbTRacTFoYmw5cUV2QjlqSXVQaUY1N2pHaVJGNXhpZU54Q3Ra?=
 =?utf-8?B?VW12T0tKYTBvVVpsVVRaNFMvcnNnRWY3MmNxSUNmWi9EZVJKbHlpVEJGSit0?=
 =?utf-8?B?eDJXdWZ5d3VFcnhyQm5Wanl6U1ZlZmgyb01BRDE3TXQ4QU83Kzdad1V3ZW1Y?=
 =?utf-8?B?U3FDd3RsMDR2dmNxLzJWcDh5NlNjejBRdlN0VnJNU2F0YkhqbFFSeDJCeGtN?=
 =?utf-8?B?WnlKbG15eVV5UVBoSkw5MUtTWHd4UDE3MmhGL2FXYVRGbzJacEFpQ2FEb2VD?=
 =?utf-8?B?M1pOUHljODQxRTg3OERuS3FyaXljTEREbTk0L1VQVmFkQWdrQXk4cXRSZEFh?=
 =?utf-8?B?eTViTGl2VDFRMU1VMjhFOVZXYkF6YU1waWFkY1hrb3QvdXgwaUQ4VEYzWnVF?=
 =?utf-8?B?UytKczRZanVCN1NuSk1aODdTSXpKOUZNQ3kzbHVZSUJBV0c1R1lkVzArak01?=
 =?utf-8?B?clp3cmFwTUpNVS9XZ2FDS0h5ZjdTdk1MYklabUFSWkdnd0tOOW5mN05uV3V3?=
 =?utf-8?B?MWZ4b2dDQTJyVUtjN1Y4K3JiZnNOaldhOXdwM2o0U1Z2bEpiT2xtVlRraDE5?=
 =?utf-8?B?UU1yUkEyRTB3TmdOQzRnOW9oMUFZUEdLUTViMHNsbFEveG5pYndHaHVhQWhx?=
 =?utf-8?B?UDRRWFVEZDN2aXdzM3VYdUpjY0hERFdGcS9TYkF3UE52OHB2YVE4bWlPeTY3?=
 =?utf-8?B?aUd6bFphSll0Sk5waXRMUUNxTVJQcVpLWTBzdlQxZWtNSUhtRHBBaWM5MkYw?=
 =?utf-8?B?QzdxR2tLVk5qSGkyaitVLzJ1MjdocXByemhFN25LK1hNSml4YXord3Z5VFQv?=
 =?utf-8?B?cGpIU1NRaUQ2ZkxNSXh1Q3IxVjRXdWNoeC9NZUJPeGZqaVd0aXJPSmQ4bTI3?=
 =?utf-8?B?WGdja2xwNkxybUNlazQ1Z1RRY3ZnWWc4Z0hlbWlZZFVrTVB1d2xhZVpVSTBX?=
 =?utf-8?B?cHYzVTZ3bmxybThNdDlNUnN1Z2ZISzFycSs4aGFrR2V4bCtGUXljOEtZT1JC?=
 =?utf-8?B?azdpSCs2eTY3NVQ3ZWlHZ0xxYnQxdW8rS2w0Qm5FY25sWU11bXZwTXpIL2FB?=
 =?utf-8?B?K2tLU2xWRzZVd3MwRFNxSyt2Rk1aM0hJbXhKTmZ5NEZDaTdLNmtXY3dJc1da?=
 =?utf-8?B?QVFkbFZJbkFrdnZxL0xKc3RMNEZaNkZQNUJkZ3JtUk4zYit2UXo2VERmRVhp?=
 =?utf-8?B?QXpHLzdvWHlvcmIrenB1enhydkhOUTlCZjhndEJnclRIM3hUWlh3NUg4MzlM?=
 =?utf-8?B?TUg3VFY5KzZCMjIwN2xVZS9KSUFUYys2dmFYRFdMZnR2cDZkNEdJQ0JIU1dC?=
 =?utf-8?B?VWIwUC9ZbVVvYUZmWWpDd0loSEZxa2Y2d2FkKzMvRi9FcVBwNzB5MTBqRXVa?=
 =?utf-8?B?OXE0dVN5RHlMVmRFamJvaFZXRE5aM2VVN0RVN0U0NkxyVkx1UUdKRVhwRndQ?=
 =?utf-8?B?NGdQR085ZWVBZ3VmVEJWbXg0T1JTTWhzek5TbTJjZ3FpTDV3WTdUQzJoMERn?=
 =?utf-8?B?dmZGQkNBV29UNzI5cFh1TlMvQmdCV1psYlZhVTRaT0NUNWhPSXByVVdnM0tz?=
 =?utf-8?B?eXUweXl3dDZXY0VQb0NrVUdYZE1uKzRyaFhYYmFmWk00cGlveGtDMlVXUzlZ?=
 =?utf-8?Q?SzWI77B6HsSVZwKLKpDDN7/Wb6C5BI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 18:34:56.8685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4e6f70-aa48-47c9-e719-08dd5da6c2c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9491

On 2025-03-06 20:47, Stefano Stabellini wrote:
> On Thu, 6 Mar 2025, Jason Andryuk wrote:
>> With a split hardware and control domain, the control domain may still
>> want and xenstore access.  Currently this relies on init-dom0less to
>> seed the grants.  This is problematic since we don't want hardware
>> domain to be able to map the control domain's resources.  Instead have
>> the hypervisor see the grant table entry.  The grant is then accessible
>> as normal.
>>
>> This is also useful with a xenstore stubdom to setup the xenbus page
>> much earlier.
> 
> Reading the patch, it seems that what is doing is letting the xenstore
> domain map the domU's grant table page. Is that correct?

The end result is everything is setup for xenstored to map 
GNTTAB_RESERVED_XENSTORE at some time later.

> If so, I would suggest to update the commit message as follows:
> 
> With split hardware/control/xenstore domains, the xenstore domain may
> still want to access other domains' xenstore page. Currently this relies
> on init-dom0less to seed the grants from Dom0.  This is problematic
> since we don't want the hardware domain to be able to map other domains'
> resources without their permission.  Instead have the hypervisor seed
> the grant table entry for every dom0less domain.  The grant is then
> accessible as normal.

I'll go with a tweaked version of yours:
xenstored maps other domains' xenstore pages.  Currently this relies
on init-dom0less or xl to seed the grants from Dom0.  With split 
hardware/control/xenstore domains, this is problematic since we don't 
want the hardware domain to be able to map other domains' resources 
without their permission.  Instead have the hypervisor seed the grant 
table entry for every dom0less domain.  The grant is then accessible as 
normal.

Regards,
Jason

