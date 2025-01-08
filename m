Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D03A067A0
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 22:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867748.1279315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVe0S-00048q-Ns; Wed, 08 Jan 2025 21:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867748.1279315; Wed, 08 Jan 2025 21:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVe0S-00046l-Kk; Wed, 08 Jan 2025 21:54:28 +0000
Received: by outflank-mailman (input) for mailman id 867748;
 Wed, 08 Jan 2025 21:54:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VB6G=UA=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tVe0Q-00046f-Mc
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 21:54:26 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20619.outbound.protection.outlook.com
 [2a01:111:f403:2408::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f9127bb-ce0b-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 22:54:25 +0100 (CET)
Received: from PH0P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::28)
 by SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Wed, 8 Jan
 2025 21:54:21 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::8c) by PH0P220CA0014.outlook.office365.com
 (2603:10b6:510:d3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Wed,
 8 Jan 2025 21:54:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 21:54:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 15:54:19 -0600
Received: from [172.31.88.124] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 8 Jan 2025 15:54:19 -0600
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
X-Inumbo-ID: 1f9127bb-ce0b-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLwedf5Wq7pHxT6AEjPkYJJu8ZJhr6pain/PJAh+ME28zfX4wvAZAHPLDGNiLHrroX3AT2CBpp62TSVxltN/Pf3gjQhLqxpe7Nvm9LifR7ttmz5ELsIvYNI2Jmldn0+EEJgPzHJVks1sQA840fcLenCf2X7CpEDurENZGtLMe8iWQyQMaeKQVz19jrUCNuDDXpF3CBjCv+zuUMYIcTAqIQ53HOpbpwikENObCovI+ykASaZP3Zo1n3zgv0iT5Cr7SpGXZjE8kCYu9VBqJz0Ek/HVbpfAkJlka3r0OT0O0LlAppe1NXH2AHff7Ps0pIgjEg4x/bt+SlD25S0a2zfDtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6ysNXTSaJOazNooLTmuJhYn4paUElUMJPZxWVUY3rE=;
 b=DdX+wiKxelef/goxOn+0sMwlySMhmuuwCY6Az1Ffk/q99OYmIMIw4SMcqYR/Nq5lNqCjQxgTKGkK2iRj40/wTGvLvvOal28Z4GAUs1qo5V7sYOYpTMrXPsrZRvlPmF3VuqADsPLYGa1HVbcjmaE8mNxWk8UbWbF7k73XldE4dRXEQD54KQwGvIAV2tYW6a3mcmteeIhN+4P7xExaaoe0oN+noQFJrTgo2xr1B//G9hFzKTQT+2XuuO6Yd3jS0PHvM6pc2L1dc6zfeDcwNryo32IpT6UPlNecF1lrWRXW945miHFBWj4/ArKmnAEV+y+hArbb0whTtB7GcqyYibnIHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6ysNXTSaJOazNooLTmuJhYn4paUElUMJPZxWVUY3rE=;
 b=GYIo0ox0M+QwusBpQYj7K2lr6j8VTZxhbLMgyhU/lBVvhC16BUBRbASRMcNQLsTe1r4D8q9mgTZ41r2a8wU/Q7AFw0E6VM0tRvKEzYe1EDRNwxkAea90Zs/8RyHXN/NJcAINkXqEW8nnDSa7al/+wKzQcNIsxKWQMkiL+FeJfrs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c39d6c7b-0cd8-4b71-965f-1fd0d49b5221@amd.com>
Date: Wed, 8 Jan 2025 16:54:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] x86/hyperlaunch: introduce the domain builder
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-7-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241226165740.29812-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|SN7PR12MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2f7004-9e5e-474b-c244-08dd302f01c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0xhZ3JGb1hPSE1MU3JtOVA0WXBrTm9WSElQcTI2MHBBYnpTZ0lwTXo5VWhD?=
 =?utf-8?B?dDFiSEs2MlVxVm90a0VFQzM4VUdhM2hkRjdmUjR1cm5ybXlVaEdZamlqakhU?=
 =?utf-8?B?RTF2aG9CYmYyVjJ1bEJydVRXZXpUTDBhYVVBNGlJbjNUbkhXMnFEdWRtd2J2?=
 =?utf-8?B?OXp2L05pcEJDK0xRNEE3ODBoR0ZCVHdRUVRKU3dHUFFmbzJQNk50Z2NKTVFB?=
 =?utf-8?B?eTBsVS93Yi9ndlZ5ZU5xSkh2Y1I3dXBNOFY2dk1DL2ozdVJjQTlob3NnZkZN?=
 =?utf-8?B?N01qTzlnK2pYdWJMcEF4Q2dLWUY1emtiTW5RYVZiQUZJbUkwWTRQa3k5RjNs?=
 =?utf-8?B?SzlqVE9PaWo2dVVrdHpDWmd0RU1ESHh0MHlsZU5YeHhTVU81c1l6bGV3cHRj?=
 =?utf-8?B?UHlTbXhxVWhCbE9sWXhDZDVjbjJQVjRZWGpoNytjMXJreTBhTWJHNzZFSG91?=
 =?utf-8?B?RUdwbThtVUZLTnlBbE9PYWJMYTd6UkpQODd1WC96YncxTU5RZWJGcE02QlJN?=
 =?utf-8?B?d01DbmJhYmxDWDNCR3NqNTBpbWlPUjg0b2lqT3hBUHhqNjlvWkwzVUpVMHI2?=
 =?utf-8?B?enVpUlNwekNBbWFzd2grOWN5OUdoRmJvRzErMnF3WnpCMTVMcDFPMDRNOFIz?=
 =?utf-8?B?amJYc1dLNEVTWUVlV3MycURRTENDOHBuVkMvN2RtbUUxdjZtOTZMUitKZUVY?=
 =?utf-8?B?VFh3bUtjTEpxd0xqT2dEcURPUk9GQ25YRkFFaFFpMndPS2VGVlVCS3RyUVhQ?=
 =?utf-8?B?YWxsVW1qQU5lL2Nzb2MxdjJXWFBxb2hyZlFDa0VMeWVVMllud1lpWW42SWJM?=
 =?utf-8?B?L3hSOEZUeVRpZ1pBdk1sdDkyNUNvRlJSa25QVmJOcVR3cVJOOFpNUFFhT3Bn?=
 =?utf-8?B?aWRtWnJZRkYyL1JXOGJJSDRWWkJvb253SW9ZOEdUZzVTWWxtb3REWjJzS2cx?=
 =?utf-8?B?Y3NLbFBCYU9oaHVONktFU3lycEdMOHVCWXhBMExUWStvdEp1R2RpMDhiZENu?=
 =?utf-8?B?bndlOTJsRHRRYlFxQ2Z5NmJsN2R1dUd5ekd2ZVVMWk9wR3lvMFpZU25ncVE3?=
 =?utf-8?B?U1ovZ21wTVAxdnpIRkN2czZIOXRLNzhtWmpZYmt6RDB1WEZ5bU9jWHh5Rmc5?=
 =?utf-8?B?ek12dkNFb1JtNWRBSGxJV0lqT3RXRlN6VzNHYVk5NnA5VlhvbTVCdHBBaDE1?=
 =?utf-8?B?MmVFa3ZMelFudmlTVGZKL3J1UURSQ0RWNHhkZmRjMUkzUG9vVGRzdkFUTkRr?=
 =?utf-8?B?K3I2MW5yclEyNFFxSWZrdzdXNHJ3VTdISjFOR1I3aXNCVEZpb0RMM1Vjalcx?=
 =?utf-8?B?Y0FkZy9GY3kwUjl6ekpESE9SOG80NlhuU25KS0QycnVKOUg2YWluSkxGUjc5?=
 =?utf-8?B?Mm50RFRyUnB0cDF3RlIxT2FwMHlvUGNEdS9TZmwvL243YzArN0xrWkFLc3Jj?=
 =?utf-8?B?UU1SdUo3b1NpRjRoU2hOTmpINkI1VUVUeEZEUFEreGo1VGVaeGdIS3RPTFYy?=
 =?utf-8?B?bStWSkJIYy8rdStPNEtPRjBrR3M3dERJUVljTkxwUjB0U3RUd0svUGs3UWZS?=
 =?utf-8?B?YXZDQWorNG9FU0dEVkFmeWlBM1FtK1h1UUdJRmVzU0FUTUpqMnE0MWVNS1lB?=
 =?utf-8?B?bnM0a0k2TmN0UzBpcFoxSGVIcGh2ZlRxdWczTjBpd2NFdEFLK2pyZjJ6dmNy?=
 =?utf-8?B?QklRQUx2YnR4N21pYjRTQlB2S0c5U3UxcW5yK3RwZHRmYlkwTElqVG1FT0pK?=
 =?utf-8?B?Y0NvaWcwa2pFdlJXYXRQWnFFVTRubzAwb0xrZTZmZTVYakpvYWZCVjM5M28w?=
 =?utf-8?B?VnZsKzJKbmFRRDNjYWR0OWwrd2RJV2lPMVBXQ1BLNUhnVnVTY3RjNWp6WEZ6?=
 =?utf-8?B?dnRTbFpBRlBIVmFvWVpmeFh4WnlpQXRsTWs2K09iZE00QmVNdHRnMW1ibFdh?=
 =?utf-8?B?M1RzTS9ONzMwMW9nWFBDbkVwV2c0RHlRQlJYNHBwMXNDOFdMNDZaWU9ZR0Jl?=
 =?utf-8?Q?uaQJ2voOw/3IvFA5x0jWRUq4twqiIs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 21:54:20.6547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2f7004-9e5e-474b-c244-08dd302f01c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7835

On 2024-12-26 11:57, Daniel P. Smith wrote:
> Introduce the domain builder which is capable of consuming a device tree as the
> first boot module. If it finds a device tree as the first boot module, it will
> set its type to BOOTMOD_FDT. This change only detects the boot module and
> continues to boot with slight change to the boot convention that the dom0
> kernel is no longer first boot module but is the second.
> 
> No functional change intended.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

> diff --git a/xen/arch/x86/domain-builder/Makefile b/xen/arch/x86/domain-builder/Makefile
> new file mode 100644
> index 000000000000..309a0c4bdd9e
> --- /dev/null
> +++ b/xen/arch/x86/domain-builder/Makefile
> @@ -0,0 +1,3 @@
> +obj-$(CONFIG_DOMAIN_BUILDER) += fdt.init.o
> +obj-y += core.init.o
> +

When I git am-ed this series, git warned:
Applying: x86/hyperlaunch: introduce the domain builder
.git/rebase-apply/patch:59: new blank line at EOF.
+
warning: 1 line adds whitespace errors.

I think that is here.

Regards,
Jason

