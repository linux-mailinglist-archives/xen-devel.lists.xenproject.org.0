Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E08CA960
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 09:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726635.1130975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9KHq-0001hW-Mp; Tue, 21 May 2024 07:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726635.1130975; Tue, 21 May 2024 07:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9KHq-0001g0-JS; Tue, 21 May 2024 07:51:54 +0000
Received: by outflank-mailman (input) for mailman id 726635;
 Tue, 21 May 2024 07:51:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H+om=MY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9KHp-0001fu-6s
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 07:51:53 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb14a6fc-1746-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 09:51:51 +0200 (CEST)
Received: from CH0PR03CA0275.namprd03.prod.outlook.com (2603:10b6:610:e6::10)
 by DS0PR12MB7581.namprd12.prod.outlook.com (2603:10b6:8:13d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 07:51:47 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::47) by CH0PR03CA0275.outlook.office365.com
 (2603:10b6:610:e6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Tue, 21 May 2024 07:51:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 07:51:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 02:51:46 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 21 May 2024 02:51:45 -0500
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
X-Inumbo-ID: fb14a6fc-1746-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkqlFgee5kmZ4hnm1GgjBfpXxQshRE3GzOZHl8WdfWfxcltXuUUXD8DtWDA6A4VtT4y7+2tO33yksUQrngvMYty9fDfPHBZe/G5uLbZYrgldCfdf96iBnIdQxBWqvm7qeeugldf9VQH/XnkXioF14eteOjCJYhJ96TZzM7ZW0DRtaspEft5jSmTGeLMCkK7f1JqqOf4EZSFVDZDTkJPUivqe8DY1Ouw3MOk5EPW668DCYI9fwKucsCTWrOU6mCzuWXWQ3xAYMZhzNGI8+x2Yo/DZS2tCumR60y4g76wAHW4dZ7caFW3PEzesoMyRpMcgpHueksv5PqRjKEVwczmQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ww3zOaVoMdczEdesHSI60+yUBAIUVaUNzvvA/uGMmdY=;
 b=CHLCfyQxHzcRcQF3wK41u4UJkJ/KmFJ+O2UONRtgiBg/UYJv6sRRJvGIYNDMHqFZfhpU7k63Kepg5vf45hXdOAeruDPPK0G9lJ8DgWMHi0sFz8KBggHQTqQmjP7YBBZl0UiB+utivlPZNDbrsZjTqlWkWYtUO+4KURME+jOgjAhk4cGnewReVUaIMTugNRIXJQSVVlSbsBEWpePn70bBTWZgQq1Km3bVN/J1I9ibiQSjRkzNvbs1rYrK0PLqTtgOeZuCKAgopcv0uH9WCpVOYOPtIQgWREiE9Q6RtsxGMl7C/eGaPIcgmBSoThKG4Xo4zYwXrK3SuByNFBYSaTkc8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ww3zOaVoMdczEdesHSI60+yUBAIUVaUNzvvA/uGMmdY=;
 b=iN/w6jaM94s9D9OhyBi50B63T3ZVSJhuTQg6ur5IschEx08IRWSfKfTgo+uu5NpgT9hl1Iv3bGJUcRKCaHE1/Mtn7BQGSAmV8IhoGwf1g9JY56i2BYew6AeQcFWn+zH4xcTlA2B51xS2BcvUv4PhDVbWwLT+m52c+8QFuXAOtMU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e81356e7-fcf2-4fdb-8585-e544ac4a15df@amd.com>
Date: Tue, 21 May 2024 15:51:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: Set correct per-cpu cpu_core_mask
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
References: <20240321035706.165253-1-xin.wang2@amd.com>
 <9deeb66d-1a69-442e-a860-08006067ff44@amd.com>
 <e724dd97-03fc-4136-9a53-94bbddce160f@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <e724dd97-03fc-4136-9a53-94bbddce160f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|DS0PR12MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2637b3-ff28-4925-9472-08dc796adda2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnJLSVp0UXZSdy9STldXbEY4cFNNbWFUKzhHODlraEZmalpVN2ZKVXZWaW05?=
 =?utf-8?B?QktMNFJvWnVzdFczUGc5MWt2QlVRS3ppSmNQQVJoSGFVUGhuaDA2MEdVSEth?=
 =?utf-8?B?alR6Z2tVdHJPZGd1SUVoYlZ4b3UzajJJdlprYW5mZEtzcUg5S0FmeW94M00y?=
 =?utf-8?B?cmd6YzNuOGVUNnJLZEcwakJRdFJKanBDWktYK1R1VmFWSEpoanh3NWR5Y0FL?=
 =?utf-8?B?bkJyY0JzbW5DY2V0cG9lRTZURHBwUHpiUjNScndkV0JidVFNcE1mK1lGY0Ux?=
 =?utf-8?B?bkNwT1U2dUlNZ0d1MFBDcWxCSzNFL1AvVjZ2am9mQ0luYzkrdUVhcU8vSVNv?=
 =?utf-8?B?YWU0UThHY0M2TlZsaTN6VUhzZFh0SldYYkRwQVErUXdzdUNrTjBmL3RqMzRD?=
 =?utf-8?B?eG9ldXdoT3pDMEc5VTlqbXBPd0JCQ2VoaEFEYXRCQm5pMUF3R0U0Yy9FRUdy?=
 =?utf-8?B?NVdydlhIQTM3RmxNZFVSaTNzSFV4QjUxM2JwQ1hPTmtlSWRpUnl3VDMrRmUx?=
 =?utf-8?B?aWF5WitGNFNXb2NyQVdaazZlWityMloxYmpUVXB6K3JndXJCaWo3NUs3MitE?=
 =?utf-8?B?VUtEUlFhYnZsSUt0MzUrSUhPNFQ4RXh6OTR1dGNWa1V3M2VjcEZNaXc2bWgr?=
 =?utf-8?B?MFVTTE9nejhHMlpBY0VIVmRGRWNZZUVUaXVKazc2YmV4MS9GZmR2YzFDUWtO?=
 =?utf-8?B?eE9ZTjhRUnRXRzFQdjJuUWZKWEdJYmI1QWw2SEIwNGl5MVQ0MkdBVGd5ck56?=
 =?utf-8?B?VW93Umh3S0Z4RWFrQmx1bzVSNDQ3eXJuSTJDNSs1Q21CV3JNZXU3NHNlRFZ1?=
 =?utf-8?B?Q1oxM1FXUTEyNloweWJBeTQwT2gvMkxtdndjb0lBOUVORDlRa3lFMDV2c3Uv?=
 =?utf-8?B?Qjhyb3JNVUN5U1JqNXdNZUpHUWtqb3k1eDA0UExQRnFTZGhNOU1QS3dHaUtL?=
 =?utf-8?B?MGJlNnprbWY1RjloUVlWdkw3cXk0a1M0R1J5TU9sRHp1VThWLzRWV0tPaFVh?=
 =?utf-8?B?OW9rcmVvTlcrV3h1azh2L3N6NEF0bHhaTk11TW53ZDNFMUhWMzl1QUFXbFpi?=
 =?utf-8?B?MnVuUHNtVHZNdSs3ZVJqMlJ0TndqTzZrTkR6UlRtNU9hVXB2UW15WktlY25B?=
 =?utf-8?B?SFVqL0gwbUF5T2FwS1U3UWc4SE5Qa0F6ZHU1Sk9NYzJ5RzFINjY3SURTOG9u?=
 =?utf-8?B?dVBCTlRWM1ROR3o4U3NOeFJ1amhCQWdHOVVySFFJTzRoYlFlNW1PeUlRWStN?=
 =?utf-8?B?QzQxVzZ5UFp6azBYNzIzS3Zlei85UjRBbTMzaWJaNElqaFI3c2tHcmZ0WG5H?=
 =?utf-8?B?SW0rL1dqTzUxUVRrUk1yNXhlZFhpOTlVUGNFODNJbjl1QlZJMGF5S3dDbElX?=
 =?utf-8?B?dXoyU3VHUjcxZEdYQUxnSW5YT09XVFdxekRBU3I1YnJRclB3ejlBZzk5NkFH?=
 =?utf-8?B?cGlQYmwxOFNWZnBxdHVCYzFYU0ZtVEFUOUtuMlVaRWFyWE1FNHRZUzNWK1JP?=
 =?utf-8?B?MkR5ZEQyNWp1YmxFenRvKzlTZTJvRDdBYU0wSE1VOGJ6d1JiWldwSlVYNmxV?=
 =?utf-8?B?K0x2NFZKaWo1UGNPcElmVmpVTDhvdkdXQnU2UGZxTVpqQWNKWkVjWVJLckZn?=
 =?utf-8?B?WHFIdU45bUprU3lFZ3NseU16RU40YndEdXhDL2xpaUd2V3IvakxBZ1FZQ0Zo?=
 =?utf-8?B?NjNzVUhUTWZHTXJjY1djekoyTW9vbWRhbGxSZ2VTaUJ3eFBrQVYyMGxDZTBx?=
 =?utf-8?B?OVlFTGpFcVRRVGtBNkhlZU0rL0pVb0J6VEJ3MlVldENYQVUzWUtEOTlhQVN3?=
 =?utf-8?Q?7mEpwvrts+8zp1lYDzAmSJ3H5PyAEnTDwJqPw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 07:51:47.1056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2637b3-ff28-4925-9472-08dc796adda2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7581

Hi Michal,

On 5/21/2024 3:47 PM, Michal Orzel wrote:
> Hi Henry.
>
> On 3/21/2024 11:57 AM, Henry Wang wrote:
>>> In the common sysctl command XEN_SYSCTL_physinfo, the value of
>>> cores_per_socket is calculated based on the cpu_core_mask of CPU0.
>>> Currently on Arm this is a fixed value 1 (can be checked via xl info),
>>> which is not correct. This is because during the Arm CPU online
>>> process at boot time, setup_cpu_sibling_map() only sets the per-cpu
>>> cpu_core_mask for itself.
>>>
>>> cores_per_socket refers to the number of cores that belong to the same
>>> socket (NUMA node). Currently Xen on Arm does not support physical
>>> CPU hotplug and NUMA, also we assume there is no multithread. Therefore
>>> cores_per_socket means all possible CPUs detected from the device
>>> tree. Setting the per-cpu cpu_core_mask in setup_cpu_sibling_map()
>>> accordingly. Modify the in-code comment which seems to be outdated. Add
>>> a warning to users if Xen is running on processors with multithread
>>> support.
>>>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

>>>    /* ID of the PCPU we're running on */
>>>    DEFINE_PER_CPU(unsigned int, cpu_id);
>>> -/* XXX these seem awfully x86ish... */
>>> +/*
>>> + * Although multithread is part of the Arm spec, there are not many
>>> + * processors support multithread and current Xen on Arm assumes there
> NIT: s/support/supporting

Sorry, it should have been spotted locally before sending. Anyway, I 
will correct this in v4 with your Reviewed-by tag taken. Thanks for 
pointing this out.

Kind regards,
Henry

>>> __init smp_get_max_cpus(void)
> ~Michal


