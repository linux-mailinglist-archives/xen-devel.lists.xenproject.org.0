Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76A1A92305
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 18:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958294.1351194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5SRm-00011G-6f; Thu, 17 Apr 2025 16:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958294.1351194; Thu, 17 Apr 2025 16:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5SRm-0000zU-36; Thu, 17 Apr 2025 16:50:42 +0000
Received: by outflank-mailman (input) for mailman id 958294;
 Thu, 17 Apr 2025 16:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9F7A=XD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5SRk-0000wz-JC
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 16:50:40 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2416::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 121bc6d6-1bac-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 18:50:31 +0200 (CEST)
Received: from CH2PR11CA0011.namprd11.prod.outlook.com (2603:10b6:610:54::21)
 by PH7PR12MB5687.namprd12.prod.outlook.com (2603:10b6:510:13e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Thu, 17 Apr
 2025 16:50:24 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::14) by CH2PR11CA0011.outlook.office365.com
 (2603:10b6:610:54::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 16:50:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 16:50:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 11:50:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 11:50:23 -0500
Received: from [172.21.212.118] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Apr 2025 11:50:22 -0500
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
X-Inumbo-ID: 121bc6d6-1bac-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uR3SjWd3xmmmSepWHyflCV5J0EPIYJ6nop7Y2YGvIUrq3BJvYz8pMAnfqb6dt7/hgRPxjm2f5P3MBYDl1Ru5C8kcNswI3fe9XHQtCSLlYT4OPhM8Qhn6WzNCKn07CP6UDPArKvTyIOikRXXybz8dQoTyxJ3PA9AjFd/r1p7VHoN/hbtUTjEiVyEHfbjEs4nXlCsOm2mT/MdI+eoAaVecvTT45S7iqseWA24iB2Z6Hl/QtxlhG21lIh54QwKF8HGqufowzAoIa/Lnsyo8vIMwXWRQH6e09SKMHYV99O3O23IVRoVPWt2Qc/UVmoE/0bJAPsAZbm08LD6E4Mv5aDS/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cbzl0Yzlpw2DNJqfPlxMfEg9Th/BPQMGf2fv+Xm+sTo=;
 b=hzNYXVOoEUGZvgAY5nmStIfAVRpVTwtvufV8OU25zj6IhniwzWGVHUlFhVorf0vK4ELqEnjBt42WWW2C3ph3poZjcZ80iQN+zvgopzW5nPzIgifQVcvAIKZOUKV28r8SFEUuPKx0zMvRBxjL0Zt4IBgsV0fheVM0hDts3tC9CsR1Tsa7afUonSrpfbqmJ5Zel1vrmF7najKSKGu9uBINKMHLr2Ej2aqyXsfWNKyr+fKDvmHaL04Xyl4sPX45oDzb/0jqAs1XXPasGhgfxRcIPayOPvK8UScbHDX98DrpwVYCp/zNwkeJFqlIFJ56+rpPyjb/Wh2GRJAlD3dkdO8KcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cbzl0Yzlpw2DNJqfPlxMfEg9Th/BPQMGf2fv+Xm+sTo=;
 b=3HyGcM2j8vNnjGRXesVG0Wj3Asu4S5ZcO0jXqkUFDSIPTiM8iM/taxUiX+E4f2nMzqD5DDsKS5G7P3gA3w6fd73zoXiYGbvp5/8Xvgl+Iy+RqdA5NEM8j4iZy2381hSp/ydpnC7nxrggjOYXQgqRXGp8kUfj845w1HUni3zvzBw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ebae7fb0-382c-4db3-a37c-db458af3299b@amd.com>
Date: Thu, 17 Apr 2025 12:50:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] compat/memory: avoid UB shifts in XENMEM_exchange
 handling
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Manuel Andreas
	<manuel.andreas@tum.de>
References: <ffd8f532-6714-4f56-a358-71ab580202b6@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ffd8f532-6714-4f56-a358-71ab580202b6@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|PH7PR12MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: a940c51b-5864-464c-6fea-08dd7dcff30f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mi9Vay96aEpPb2hWQTM5aC9Ma1RZbVM5RXlFTWVQaDl4MDJYUFRsWVhWNExt?=
 =?utf-8?B?R0Q4SU5WZ2hOSWcvQmdERWk2eDJmSHFwUUwrV0ZBWmNQTDVUcGQzZ0lxYThL?=
 =?utf-8?B?a256NGtucUtIT0hZQUQ2U0J4Rm9rTytVLzFDNkdONk1lRHhtcVJLT2hPSjRE?=
 =?utf-8?B?dVRjcCtTYkhEdzZFeWZFRzVQZVJNdWN2SVZleVRLckNvQ3l0WVJEQ0lxZkNV?=
 =?utf-8?B?STRaZnJvVE9XTkJldWZpVDltRXo1RE9qZUdlbU1YSmdjN3V6YllNN01tWldD?=
 =?utf-8?B?ampHejhuSW0wczRtUDZGQTA0UjVjT2RDOXM0YmNzU0w5ZXE5ZndtNFBiclgr?=
 =?utf-8?B?Rmk0RHNOMjh2WlBNRWdvQWpVRTFScTJNSWpzRHphQjRsSHpJZTdXRjFaMXZ5?=
 =?utf-8?B?Z0l0YWxNV281aThxWkpxdFJINnp5R1drY1pPN01JTnowbnkzVjBFVXh5b3VF?=
 =?utf-8?B?OEg3RmxvcTZqV0xTVHZ6SXJBMGpXdit3azN1Z2h4US8zY3QzUmtkZk8vYThU?=
 =?utf-8?B?N20zTnorbUwyd0hFem10aTdKUkl6VDJkL2NDbWc4Q1NENXpZcys5Zm5IM3Zn?=
 =?utf-8?B?d0hJcTNpYUNDK2JpNzZUdjlVNUNXYTJGdnp0a21XbEpmUDFRaGt2K3VrZnhV?=
 =?utf-8?B?ZGN5L2RCK0p1T0lKVHE0WUJkazdYaVdpeURBRUkrKzBaZVNDajJVZ3cxVDNG?=
 =?utf-8?B?MnBybUZCSlNKYkxObHk5aWRZZnJhU2xMdi9WQUd2VG1BTU41S2ZpQ3V2N0RD?=
 =?utf-8?B?OTNucVphMThPUExQQmhWMXZQN0RhbW1XQy9CTWdyNmltcFlsck96V1phRE5R?=
 =?utf-8?B?QjZKZmx0a1o5SytibHVxWGJVRERHa0R1SXNDTHZ3MU5qcUsydVR6YVJ3a2Zz?=
 =?utf-8?B?WXkvMmNBMVVZUVVzVG5rOFRJY2QyMTBqeG9ZZ2ZaenlvWWFUaTBIOVlvenJu?=
 =?utf-8?B?MUE5a0M2VTZNMGNOakNHQTZBWEZ5dmRFanRqdnNkSmNwVlVINk5WZVVkVUda?=
 =?utf-8?B?MVUrNHp6U0djYXE4NStRU1VVczgremY0Y0NEYzh3T24wKzlGUDRnYTNYZjVC?=
 =?utf-8?B?Um5heURXeWhlaDM5QnhkOXpGOU50TmRhVkpRSmROR0ZxdTZxK3dhWHAzVytS?=
 =?utf-8?B?QXhLTjFTMmVIRnJnSHpMR2NxbE9YbGJoVUI0dGJ6UTRmWHhxMmNkZjZlTWI5?=
 =?utf-8?B?cE9mUWxwUGJkK0pMeWlPREJjRXBzR0RKUVNIckZEeW5XK0d0ZFJOb1crSUo0?=
 =?utf-8?B?UjE1WWowYld5a0hiM0ZBbCswRlR5NmNucjd0UjgrUjZMblF3bmdWK3B3Ky90?=
 =?utf-8?B?VjBOTy9NQmtUUk1FTm1LMU02OTNPS0thMzk2Y3hQL3VORlpoaWZsOWkrcTVu?=
 =?utf-8?B?V1d2ZHNFeXN5TU1qR2gyMzB3bHpQNmZyRG5yRVd4ajNlMVVkamhqM1pVb29T?=
 =?utf-8?B?Mm9lTWxqQkFGZHVHQkVqeVg4N3dGRHQyRys2VnB4ODBaNDJOT2Z1Q1VQUCtY?=
 =?utf-8?B?SXk1Q2lHVHJyaENFN2tFVzgzT1JEcHFsVFg2K1A2ZWhGblgxRFhIYkQyb1NL?=
 =?utf-8?B?c0FWRFk1bGx0TWcrQzZQL3EwbHJmNWpuR0twakJRTkZjZXo1TmZhbDM2eUU1?=
 =?utf-8?B?NENIaExrTDIvZWs1eXRRdmlrL3F5OW93RkZJT2YyNE56K0NEWVM5S2ZxSXd6?=
 =?utf-8?B?bGNCTlFMcDNndHErNFVTSE0zTEdWRnBPU0VON3RVWEtGTTBHcE1iNk9mME54?=
 =?utf-8?B?M1lWendHcXFMaUxYQndVdTlpbjlHVmZBU2FUUkJEL2tXWWpCU0NhSU5zSW02?=
 =?utf-8?B?Vk4vMFR1aTlvdEF4NEVNTWJkamhoM1FhbVZuUXFXeVFaU2MzckVQaTZCVmF0?=
 =?utf-8?B?OVVNWHN3YjM2cjdqVWZxRU5vclUyTmpCN3VvdHNkMTZ2R0g2ZXFqQXdLdWFO?=
 =?utf-8?B?NDRCUlpXYkZIWSsxVlN3U3VaRWJqeG4xVk9UQzh0ZjUvbGlhYUx3L1NiclFB?=
 =?utf-8?B?V0kyUE5Oa0Jwa3ZsNGJIUVpOZlQyUUs5NktBOFY3Q0FkRUhSMmpESWFIajJJ?=
 =?utf-8?Q?ZuxZCU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 16:50:24.5430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a940c51b-5864-464c-6fea-08dd7dcff30f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5687

On 2025-04-17 10:08, Jan Beulich wrote:
> Add an early basic check, yielding the same error code as the more
> thorough on the the main handler would produce.

"as the more thorough check in the main handler"...

> Fixes: b8a7efe8528a ("Enable compatibility mode operation for HYPERVISOR_memory_op")
> Reported-by: Manuel Andreas <manuel.andreas@tum.de>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

With that:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

