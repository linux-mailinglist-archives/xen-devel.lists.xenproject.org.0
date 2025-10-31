Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C95C2711A
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 22:44:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154565.1484501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEwup-0004XT-1e; Fri, 31 Oct 2025 21:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154565.1484501; Fri, 31 Oct 2025 21:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEwuo-0004V6-VA; Fri, 31 Oct 2025 21:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1154565;
 Fri, 31 Oct 2025 21:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o7AA=5I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vEwun-0004Uz-Q0
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 21:44:09 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b72a3d95-b6a2-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 22:44:04 +0100 (CET)
Received: from PH7P220CA0044.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::22)
 by MN0PR12MB6320.namprd12.prod.outlook.com (2603:10b6:208:3d3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 21:43:57 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::de) by PH7P220CA0044.outlook.office365.com
 (2603:10b6:510:32b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 21:43:55 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 21:43:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 31 Oct
 2025 14:43:56 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Oct
 2025 16:43:56 -0500
Received: from [172.21.12.124] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 31 Oct 2025 14:43:55 -0700
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
X-Inumbo-ID: b72a3d95-b6a2-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+dp/qRN7MOB3mP/HIIRLmAInxBFmboawlQXf3iJtgL3UJcuGC2mHu4A1WkNKX9VFHofhKSKBxIz92ket2fjLdWCPSl2shomjjfKHAgDcT9geZfKrGKfchgMhvp86ks3EmXLrqjZ7L5I7SXmqsDNpLPqPDr2pdKaVS0RiZn3UAaWQtPeqGPir/HWaA4Eiy9m5fJuYCihs0kcD9L8pH3Tlj3CYkQXA1c9ifsK8NEsZ7PHArIAKjYi89IwIVLJoy2973JeBdIPUEDF/posb8ITWjWfBIBcZgt4SV3kFI2UpnGaw8qy3TNhKsLdOSkQ65ZrcpWZg0V4T3eR2kqmvDy1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnQOp4bAe932EhUOyBSa7jyAejIelbRGvTc9kGFB898=;
 b=qQISwh3RLQVCMw8ypbWXZLmEe21Ikqo9XUfJNiLebc0vzhmb58kVTWyGM7ib7qpzU8VOTZ7YVGcsJAaCBuG/WaofG/SgbCIPgochGtKqhk9RAUxzK0k9YR30NOo63f0zJUyUM/5OeW6VFQbDZJrHzJjXLYhAfxVzqtvrnjH+MHA3bUBShNRX60gMlSnG5Osd2d5o55WXIb7aIXgXrC0a9nU8kLuR5TKkrENTn99wVKS31OD55gZ6NCVGwnDrhhYBUKd3p+U7BB5JJ/yHAlG5SeIvwl45g3USb405JnGQXvQ8MBGB4rRCjm3gmXTn2kABP+LQs4/cMhlpo3XA2yS8zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnQOp4bAe932EhUOyBSa7jyAejIelbRGvTc9kGFB898=;
 b=4EenM0KGyfrnwa+7C34w3kn14PCQ8z5rhHomHkk7tcevgaxP9QNPM3sMKinfMJUn6Qb6xWeJZkXuVkPSvR+uTyKGcq7pkJhYZT85qmTS+33InR1l6/EJ3K8DhILeT+ElRnKmeYIUB2ZCACEpzAAIHciHLAs0+cB7JtAzBCrGxAw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <2225a91a-bc0a-44dc-b4f7-8f02b2a84808@amd.com>
Date: Fri, 31 Oct 2025 17:43:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v7] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>
References: <20251031161716.1222956-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251031161716.1222956-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|MN0PR12MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: cc96668e-7cce-47a6-dc0d-08de18c6981f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0txY0k0SnFrdkUyVnVkUEVZUjFFK2NueW9kUXdiV05yWG9HeEI0am1BeDJk?=
 =?utf-8?B?dkNUaitIQkdHRHdkYVRQYU5HNnhpaGszcHFkTUFoUldHZVQ1eDFoZW9OeTRx?=
 =?utf-8?B?ZldDakxQZjhyRlZYOXRPYWZlaWRxSklOdy81bFo0WUdJbmYveCtKMkl0Uy9o?=
 =?utf-8?B?QnlxZ205UllIMDAxWksrWHRUT0JpWnlUanovT09zSTFmSXVPQzQySmFMQWdP?=
 =?utf-8?B?bVBLcVZwanVsY1I5bmlGdUtGOElLVmh1TWc3MndEeEEwR3hSYzh3V1FsbXBP?=
 =?utf-8?B?U1EwWXlGOXFkY0R3ckVRSXU4MGovRC9oOWlTMTRKdDF1YXRFcnFUbUc5ejJn?=
 =?utf-8?B?dk9pZzduQVZGa1ovVDd5YVZBTzIyMG1rcFdERjVESW1Zb0REbGxNMjcyL2hU?=
 =?utf-8?B?cmpYeXdyY1pidWRNZGtsdDE0Q2tyQ2NsL1g4U2hVUjZVeGlKQ1FQN3crR2p6?=
 =?utf-8?B?S0RSSjE4Wm9OdEthMllsenUzT3J3ZjY2MzBRNGxNRXJ5QlRwMUw0bTQzdlJv?=
 =?utf-8?B?OUhpbkFsSURoblIxUEtmRkdBcm1aZCthYm5sY1JVUjY1SXZOd3JNZ0J5eWI2?=
 =?utf-8?B?RDlQb2c0bzBmVEhKMlB5Nkh2cDRDQjB6ek5NaXNGVXVEUnk5Vi9nVm9XWCtW?=
 =?utf-8?B?b1JwMWp5eGluYm52QUFlMU9mV1lqa0VaaXdkZmRCVWxIcWtxcURpbUQvbFh2?=
 =?utf-8?B?YlhpWUZxM2VCU1gxeXFKK1VFenR4RVVuNWk1Z1FvT0FQWkI4S21ZdVErempD?=
 =?utf-8?B?WlYvbnduUlZrdHFKajJRVVZPUTRxdjM3N00yVDlyUndNeUNDOXFCZWpZWGtW?=
 =?utf-8?B?c2grM0RPd3ZoQUhFWFVPVnhJckd4aGhENzBYQ1BSaFllbzUzOW96dXFIcy9Z?=
 =?utf-8?B?NDlZenUrVFBRVnFoc2hiR3h4MWpMa2lDOHdObW4yR1Fmb1FCaVozUGpsUC9Z?=
 =?utf-8?B?bC9La0xMRUk2elBObFNVQ09DdG9jdzFLbHlRamhyK00yckFZakpUcnhXcG13?=
 =?utf-8?B?Y3ZFTldlYWpaVEVjRHkzV1IyTlNNYlNJdnUxaDVkNFZWRlN5WmRNZjFLNDJq?=
 =?utf-8?B?YnVremcvNWpZMXlmTVZYVWZwY3RwWERuazNrVXQzVlBlUy81YjE3cUhsZjRk?=
 =?utf-8?B?aE1xTFRQSWsydTFsMTdEUHl2OGhvU3FyWFZzcU5rTUdBUFc4b0YyNVh4NGMw?=
 =?utf-8?B?SlBKNzNjbW5TZW5hL3NrZUR6ZDhUaGs2RjNIMWZEanZKODlYTjZQaGdIZ05L?=
 =?utf-8?B?OHJLNDVCUGVMSndjRGJwanpTczFWZUE5YUpVbHRtZ1VGZnJ0cVRPK01pbGJ4?=
 =?utf-8?B?NU11MDBvM2doc0JHQWRoTXZQdUNpYmlnSm1uSnU4OXNyVlE2b2Z4Y08vbzY1?=
 =?utf-8?B?V2srNFZidnZzZDh1SERNN2F0ZEtZeUtFWnhRYkpNSG03aG05Nk9hNkxXUW1p?=
 =?utf-8?B?ZHFJcVIrTzQ5aGRoVklkL3BjZE1GNGlHUjZFb1JrVk0xbXhzdFJUKzFYUmZv?=
 =?utf-8?B?OWh1RTg2cWQ3YStwanhWeW5GdGN6TVBmNUVwL1Rpb3U0cWU3WHlTVUZGdHhS?=
 =?utf-8?B?YUpPd2VzK3BNNFFTR1FLQUZnaDdhZnRFbFNmQnpDcm9PcmhtK2I1L0s5WlhY?=
 =?utf-8?B?Rko1ZzRxNjF3UUZEdWliREtqbnk2TkRYeVFnLy9KcWsvTEl0OUk2RUZzT0J1?=
 =?utf-8?B?a1VTY2d0N0dvb0o3cndWNDkyNFlPTExoc1JLdVJLdlJzSHRYTGpKeVZHUm04?=
 =?utf-8?B?MVNEeU1OMTNadGNxcUdBY1ltdU00QjhYMkZKSXFrY3ZlOWM4blhRR1JnNU5z?=
 =?utf-8?B?cUc0bDdqNGdMR05aeTJYVytCNHJmc2w1NWJjRFZUT2pyQ0dOSVM1Vmx5R1Ew?=
 =?utf-8?B?eUpUTWZIUDZhR091VUtwYStVMTNNZm1UN1RXeGpjZ3ZKOEdSVE0wVHpFQncz?=
 =?utf-8?B?WHpYa1FDZm9NcnBvU3BST0JpaDh3dFRzSHY4dlJOL0NoSHQrUXlTQk43d1JW?=
 =?utf-8?B?Yk51dWErTHQyRG5vdWQ3Z1lsTkNEYUI0UzJaZk9SZllaaWQ4aEtwSVY4UW1Z?=
 =?utf-8?B?WEQyaXRCSnp5YWdZRzFNSG5zRFRGYmZNeUJqQ1BWZE1XUmdEM2pOYWt4Tk12?=
 =?utf-8?Q?uQPA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 21:43:56.7128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc96668e-7cce-47a6-dc0d-08de18c6981f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6320

On 2025-10-31 12:17, Grygorii Strashko wrote:
> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Add config option VIRIDIAN that covers viridian code within HVM.
> Calls to viridian functions guarded by is_viridian_domain() and related macros.
> Having this option may be beneficial by reducing code footprint for systems
> that are not using Hyper-V.
> 
> [grygorii_strashko@epam.com: fixed NULL pointer deref in
> viridian_save_domain_ctxt(); stub viridian_vcpu/domain_init/deinit()]
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

