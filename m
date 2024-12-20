Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A169F8D50
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 08:35:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861652.1273654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOXXD-0007hM-1a; Fri, 20 Dec 2024 07:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861652.1273654; Fri, 20 Dec 2024 07:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOXXC-0007fA-Uk; Fri, 20 Dec 2024 07:34:54 +0000
Received: by outflank-mailman (input) for mailman id 861652;
 Fri, 20 Dec 2024 07:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djjC=TN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tOXXB-0007eu-S5
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 07:34:53 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2416::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e52c4494-bea4-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 08:34:51 +0100 (CET)
Received: from SN7PR04CA0161.namprd04.prod.outlook.com (2603:10b6:806:125::16)
 by IA1PR12MB6459.namprd12.prod.outlook.com (2603:10b6:208:3a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 07:34:43 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:125:cafe::94) by SN7PR04CA0161.outlook.office365.com
 (2603:10b6:806:125::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 07:34:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 07:34:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 01:34:42 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Dec 2024 01:34:39 -0600
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
X-Inumbo-ID: e52c4494-bea4-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzcVewO9216oveH4SvJ4dD6sBm/wILbaCZn71G0/RuwICuG4BCjhccmWbjdJy932zk1XC+BTHbjIHdbDDyYnvGJg2ufzOFetMLymmDHiVutqxFvElUTX57yG4Fw+5cqSEA+cAWGfCPBLFyXQpL0ILQvI4JFG466oT4ggqUINYUKS8RYMPKl8J2I0LRaJlBRbLl3j5AMyJMbRv4ehZsylXpMEuA5erWNHHLVj72aR2IGH60hkESZsh4J3VptAfuB+KeIqxkqw3Vm+5UV2ZpX7fNWC9nLJSy6IUu3LFJ6MfBjwWici6FQwDxnsTzOycMstPbjvrEYsASfKRKsEm+R4yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VMEixpDlPajZnnEZsgtj9QhLL0VDGS22c/b5M3I8ck=;
 b=HNJu+HqrIDvuqFlNNz52VJ/kRtzBPKZUQ3Oo6X2JUh20LUmfcnUMgYM+R4HqJUAX5kmuezG9pvM8vhiIDnNLBYZ1lMDebL9UvIFA4FMY/wpNCn08l+0QBFEgyX8hD61WE6CD064BUpYDiX0/130CWEKgHzUdMXcwUuGK0q79ncX9kjgNny68qj2PGhQ6RfzJznIavNnN3TdZ730TV0zp99U2M3mTXVdwVtYu3/smomSbTxVZ5Sl4Ipz2PgjiB2s7tcXDo/095AY8iUZgNoHav2C6p2B0sghq/bNHirFOFcM1i76PUDgblRhHt90GERnyKM80qNlXKiRhrqgWhe9TPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VMEixpDlPajZnnEZsgtj9QhLL0VDGS22c/b5M3I8ck=;
 b=kuT+FfZay3qGmk4xNQZ1X3xs7oz714Q220HldOCp/UDSVp1mK4PGu/TcftvFj/geyWzHux/nh3dNgFEZYz+3D/zdnk+iry8x8UwcM49edOaI6S1vvO1XqhFOjCkXRBA+YJdmHqzmDl+9aQuSdfU+iP2nwnu12LJ1x6ecpZQn5aY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <143392d7-220d-48e4-8565-8ecdba9111e9@amd.com>
Date: Fri, 20 Dec 2024 08:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/12] Arm cache coloring
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|IA1PR12MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 3791b7b5-7daa-442e-d8e6-08dd20c8c511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEliS2kwTDhrTHd4Y3FmMzdIZzY4eTMyQ09GK3R1Y2Jaa0ppSTNIV1dXd0gz?=
 =?utf-8?B?bVA0MGlXaHJtUUZPYjR4TGNFUmxMbGJGVnBjaVgxVWhLUjBUWXhwMnhqQzNK?=
 =?utf-8?B?bzRRcEQvcmFRQVQ3SnlRc3QrUGN4WW9mUGFvcFBYdTBnQjlxZ28rWWxpUFgv?=
 =?utf-8?B?eFFsZUMySDdsckpQOHFnaFNYRUFMWTc3UXY2Zkg5VjNFMlpVa2MwajVjRmdK?=
 =?utf-8?B?enF3NG1ZZFozcWY2TjFpTFFxUzB0d1Bjb1h3SXJURStmVnZDWE9zREwvb0p1?=
 =?utf-8?B?amNiVjRTZkJWTThlbUVoTWw5ang1dHY1UjFoQkpQTFhiM3NiVjMzRFBqTkMy?=
 =?utf-8?B?OWd3a2V1aUJacFRrSldKWFNEZ3hQNTN2NlVyRUwvZ1VTTGFMU05uSlZYQnMz?=
 =?utf-8?B?R3pKZDNvcVBrbERPdzlCZGV0QlpXZ3VmZms2K0J1WkZHQ0hWVEx5KzNsZEZo?=
 =?utf-8?B?ZjBSTEpNdldmTkRnMkJvV083cllyQVNyQ3FZLzVnNGdBYjJnOWN1WncwZm90?=
 =?utf-8?B?ajVLb1JlRHZ4S2lBR1hXZ1cwOVUwQVlJZGxjSHkyS1VNYVFKL0t6ZjZvN3d1?=
 =?utf-8?B?d3hkc1NqdG1WQ0sxckxyZTlNbTJHSGlLVXo0SDE3K1pNUWw1RlE1Yy96V0R3?=
 =?utf-8?B?QVQ1SDdreDNwdk5RWkpPMlQyRHZvb044RVVhSHpDVXozMlh6KzVPQkxZZDFB?=
 =?utf-8?B?RXBsSnBZU0dJdXlvMTEwSnE4cy9LTmF6UmltNWppZjhIOTQ3SnYxMTJmR29I?=
 =?utf-8?B?b2tLenhZWTdHL0hzSDdKU2VVT2RiMTJ3d2o2c3pMbG5LZlJ4UmJuTk9wS2pv?=
 =?utf-8?B?TVVzSmJQREpieHBHbU8vRzBTb05OVlY5M1YwN0NNM3NQY3VGV0ZEQnBYL1R6?=
 =?utf-8?B?cXh0QXJxK05zSE84RkdNcFdnNUdZL0M5ZTJLQXI1ZEV6YkJ2RElVdENqYjBW?=
 =?utf-8?B?NCt6S0dCaGFhQVhGNW1EM1c0WjZodmxKR3FPU2lKSk01NjJ1SFZnVlFRK21Q?=
 =?utf-8?B?eEYyemZ2ZlpQMDRoTFJ0NCtuWlJkcmZaU3grQU41S20vUVlLNEVMR0lXekZn?=
 =?utf-8?B?U0daSDRwdm1ENUh3YjNHYWkwYVUrNjhtNC9GVVRiYzlCdE1jYkQwOWQwdXFn?=
 =?utf-8?B?RVVvL1FPN1htbVN6VkgwM1VCRUF6TXIvTHdwcEtJRkt1dHI1WjFUaDVocWxE?=
 =?utf-8?B?M1hlVVM3YzRvQThPSDBZZC93WUNkUGFubWp0c085T0RhTVhXOXF3MzcwZ1dR?=
 =?utf-8?B?aEJMaGxEQUlTaUdhZ2hXZ3lBZXpFSmpmd3ppT2x4T2p1UHlDRFFMdm8xSkZU?=
 =?utf-8?B?T3lRcUpndDVxZlBpdVhQVENRMkdBZ1g1ZUdjUVBBM1BZdHlVSURVZ2cyYjNt?=
 =?utf-8?B?dUUwaEJDV2ZXOHRhSDBkblVxcFo2WVNxR2FxVnNTLzQ3UENCWHhLS1FvRUli?=
 =?utf-8?B?SlFjeUh4cVNFbHJMMWpEZFNZdzRBQ044OWNwQjYrQTMzYU45a0c2N1g5ZVZW?=
 =?utf-8?B?a3RlZUYxMGlvUTUxY1I4SDF4UmpDMFZIY0RzaEZOYS82b0ptSGZqeEtDakJE?=
 =?utf-8?B?OGxRWFZ0L0hzTGFSQ2V3L0tEVkZDS1I1KzlkUUhWbVUrZWtjRXlYWmNrOGFn?=
 =?utf-8?B?SGFwdllLWUJCTzlBMWx4czNCYW0ySnZuaG5kVmtWUUowN1ZNSmhiUXZKV09H?=
 =?utf-8?B?dk9YeXRJV3NxVlJDbG5sYlk1Vng4aHBlbDRFT3RWdGJrUEtCVXB4TDJCeWl5?=
 =?utf-8?B?cnJJMUVwQWczUTNOanlNeTNkNVFkSjhkSktTZkZ3NGl0K1oyUTJpQzROaWdX?=
 =?utf-8?B?dTI4bnlwU1pUcGhiT1FONFdCWWVZUml1SkMxejRzcTBBNDF3VjNteGxvV2Zx?=
 =?utf-8?B?UTZSVjg5RzJtaWFpeXB5d0JvdFhMTFRWMWVnYmdGbkhvcyt0Q1FjZW9TRFNE?=
 =?utf-8?B?dFBDanVKY1RVL2p4U3hNeG1TdUxmQ1BRM0d5WmJVNFNJUHQ3Y1N6VTJWSzFr?=
 =?utf-8?Q?9GaZeeToHNSZPnG3qOgqjpLhCJksN0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 07:34:42.7526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3791b7b5-7daa-442e-d8e6-08dd20c8c511
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6459



On 17/12/2024 18:06, Carlo Nonato wrote:
> 
> 
> Shared caches in multi-core CPU architectures represent a problem for
> predictability of memory access latency. This jeopardizes applicability
> of many Arm platform in real-time critical and mixed-criticality
> scenarios. We introduce support for cache partitioning with page
> coloring, a transparent software technique that enables isolation
> between domains and Xen, and thus avoids cache interference.
> 
> When creating a domain, a simple syntax (e.g. `0-3` or `4-11`) allows
> the user to define assignments of cache partitions ids, called colors,
> where assigning different colors guarantees no mutual eviction on cache
> will ever happen. This instructs the Xen memory allocator to provide
> the i-th color assignee only with pages that maps to color i, i.e. that
> are indexed in the i-th cache partition.
> 
> The proposed implementation supports the dom0less feature.
> The proposed implementation doesn't support the static-mem feature.
> The solution has been tested in several scenarios, including Xilinx Zynq
> MPSoCs.
> 
> Carlo Nonato (11):
>   xen/common: add cache coloring common code
>   xen/arm: add initial support for LLC coloring on arm64
>   xen/arm: permit non direct-mapped Dom0 construction
>   xen/arm: add Dom0 cache coloring support
>   xen: extend domctl interface for cache coloring
>   tools: add support for cache coloring configuration
>   xen/arm: add support for cache coloring configuration via device-tree
>   xen/page_alloc: introduce preserved page flags macro
>   xen: add cache coloring allocator for domains
>   xen/arm: make consider_modules() available for xen relocation
>   xen/arm: add cache coloring support for Xen image
> 
> Luca Miccio (1):
>   xen/arm: add Xen cache colors command line parameter
The series is now committed. Thanks.

It's definitely a change that wants mentioning in CHANGELOG. I'll send a patch
to add a note shortly.

~Michal


