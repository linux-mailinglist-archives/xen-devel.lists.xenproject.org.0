Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60721C6E4D0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 12:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165876.1492537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLgbB-0006vO-W6; Wed, 19 Nov 2025 11:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165876.1492537; Wed, 19 Nov 2025 11:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLgbB-0006tk-TT; Wed, 19 Nov 2025 11:43:45 +0000
Received: by outflank-mailman (input) for mailman id 1165876;
 Wed, 19 Nov 2025 11:43:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6cZ7=53=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vLgbA-0006tc-IB
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 11:43:44 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe0d4838-c53c-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 12:43:41 +0100 (CET)
Received: from BL1P223CA0041.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::12)
 by BL3PR12MB6521.namprd12.prod.outlook.com (2603:10b6:208:3bd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 11:43:34 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::5d) by BL1P223CA0041.outlook.office365.com
 (2603:10b6:208:5b6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 11:43:34 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 11:43:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 03:43:34 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 03:43:33 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 19 Nov 2025 03:43:31 -0800
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
X-Inumbo-ID: fe0d4838-c53c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=di2E9EmeM6XkYjTA7sz0kM2gjq85wFpBMd7oEUx4ECrIgcopsKyvFT6oZdMNOCxUAXiULCBYDztM/t0nbrP6n1D5fRJsxcHx8kEu05Inzn8wjXK5VId5mQcx+152c7N3wL/2iIIWrjTWM5kofQPxj+nJGXgU3MISsGGPK6LOH7EcM3QgwpmRp5N43yHIPrCXBJeeZxzjibcSCOB5LbM8HcsdYyOOuCuA8rj+yxH+5vuUNaCPzxEvgS1Lq6j9aZk9/ti7mPyKLnMdcKB5QGjuRpHST2Itnt7/mB7o+eIqAiD6nk7yOsYfo7t3XNzY1GrGLqKpyjwS0xfsh3Pg8UnMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pQz3VOe//algzHIaKY7qyAIP6O5trbOvMWQQ/5XWLo=;
 b=KQui0j0GZ2dslhqKX9lDFYfx19HTtbyv0SlB7FJxu985x0nQYA9yq7m/1lv96KaA/U0S/7RwEeRS4IePQA4QXrmsyVTdtvtQZiww3S1tA+AfAze6vk7k/TY+o1kC4qtoQIx0QWs87NpXDP+c8w0OqKJTq+HowBdmdX5ABb8aqhITfPnXPON47umpCJ6P1kO3wvrU2W3eaLUe+Nwqq9osNVlQWZdI6eipI4Wgj9thDY3iwirWVV/7nLFHcXX+7oBaXbYyNRKb0JBch1GEExzmsi04aGwNlIHfNnmovHj0OzEKI/j9/3tQU+7yve0WtGreQoWBiy5tNaiEJ3mCTsquCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pQz3VOe//algzHIaKY7qyAIP6O5trbOvMWQQ/5XWLo=;
 b=thbVDevyvVVz5N5cRvWExky2OiBmn7h15Hibh6X6YROOHrtXCaDNFtdT3jJQa7fsBZSKxdH9BMJCG+xnp3wo3XbCNkz/UmrAkyIPy+jH+Jt7IMkL7wHt/SY2YzFFWyMZMjyv+bPSo/sycDGoMoAVYGOMrqIAIryfgDn/kHlDxY8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <47acc1e0-4d09-49dc-959d-f93c6a1b3b61@amd.com>
Date: Wed, 19 Nov 2025 12:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1763479083.git.xakep.amatop@gmail.com>
 <3786204d034ae4461aa0fde77771b8e14256314a.1763479083.git.xakep.amatop@gmail.com>
 <5a5b4bf6-4cd6-4b64-ba31-07a87b1fdbaa@amd.com>
 <CAGeoDV_4Bpp50wkd+wtq6zVHg4KZqnOcndG7rfqMndo=HW1sYQ@mail.gmail.com>
 <cd7657d8-47bd-4484-91b3-4fb79985537c@amd.com>
 <CAGeoDV9C7OVQWRyYZ+rV8Dn79PSkGd2veP18t46t+pMCt3LMnQ@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV9C7OVQWRyYZ+rV8Dn79PSkGd2veP18t46t+pMCt3LMnQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|BL3PR12MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: 2706c7df-80b1-4ac9-5b59-08de2760dedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0R4T3RSK0JCVVZIL0ZGV1JzQWc3eGtFTTlIaGtKMFlSTTc4eVpKT21jdlI1?=
 =?utf-8?B?ZVhydjd3NGpmbXJlY3BHMFpFelcwc0padFo4ekVMTk83cUgwbVIwQkVqdlBH?=
 =?utf-8?B?V2RZOHZQWjJIMkhGTVVoYzNDNVFPb2dTYlU2LzV3NFdKd2dEZ1FDczkwYWU5?=
 =?utf-8?B?eUQrbTRZNU92QVNSMXdLSHcyWWUrVVNPMTFNZW1QOHg0MFNmSjJBamEwR1Zl?=
 =?utf-8?B?R3RBR25DTU45R2VEQjAweU9MTmJBWVBhWDR5NHQ2SklKYXU4REwvb2NSZDQ3?=
 =?utf-8?B?VFdGQzFEQXJML3FGeFRrZGxKSVh4NkxLWWtKUSs5Q1A1K1Y1b2J0WUs3OTFB?=
 =?utf-8?B?Mm5FTXRTbkErR3FjeDBLV2wyaTVnMTYrT3RWODgrNlliVHhkUldtR2p2eHg5?=
 =?utf-8?B?Yy81TzhzSEFOVHFiM1daWkk0RlhBMEs4VEdSMzI0eEJpUWdvekNMTDVJS25I?=
 =?utf-8?B?SFRrQWFsTmc2bjdxenJQTDBiQit2ck1KOTFCM2ZpdFRPZmRtVk5XT0hQRWdL?=
 =?utf-8?B?WWtBY2QwNkhoZkVTUVFWT3JUNUtndzZicU5GeGtodEc4TFBjSi9ER0orNFlu?=
 =?utf-8?B?b21CaldKTjB0TVl5aHNmRGl4d053N0hZRktOOGs0NlJqTUtpU0JQaGNwMWlS?=
 =?utf-8?B?REJKcUhIT1VNdUhHUitveFVUcmY1VkwwWTFDeVBkeGRieXUzOVMrYmVpMTJl?=
 =?utf-8?B?UEZwWHBEN0pZL2NHOFNhN1ArK0pjZ0FGclZFanRRUU1aRVVSZnpNcjBHeDE1?=
 =?utf-8?B?WU9lSko0T2RSSVBxNkxlbnFKWHdCRE1QUThFeWVYdmx5Rk5xcVl5RWNuQ1N6?=
 =?utf-8?B?b3FackpXWU1SVk12dTFOOUwvSkNFaUxNcTNSYXNKSnlWTVFqaXNZZ2M1K2NM?=
 =?utf-8?B?Y2l3Y2RySkpKNFVOdlJFZWc4SUR0dUkvMDJDQnhJQllISEpQb1FUUjhLV1FS?=
 =?utf-8?B?VndaMkp2UEhJS1E4aStSdGMrSHgzTjhvMW9VZkVKMnIva0NBdXEyZnNhQ0tt?=
 =?utf-8?B?dmV6d0oyczcxSnhsd1dSMzlhUmVRc2JtN1JCREVrM2pYUWRlN1ZZZHBZazQ4?=
 =?utf-8?B?c3Q0MDVZeUJvalJYby9xWENZN29vS2FObDlZRHJVNWMrL0NqNDFySmRKU1Fj?=
 =?utf-8?B?NFlKNVAweDlsOUlOenR6dDFRZ055UkxaZGtoVHoyemUwVXAzZXExTmxuMTVM?=
 =?utf-8?B?am1USzNYM2dBSW1GT1JYMDViZlhvNnlKdEd1bjBoSXlYVjBoanNpbnR0NlZS?=
 =?utf-8?B?SWowR211SE1ZWXM2QWU2ZTVxRkJJdVNBODNpSmJKb1FyZCtDN3c5cExsR2ZP?=
 =?utf-8?B?WjhVLytUOERFbWdwOVNQZDhGQ3NrZUNtdDlyUVQ0NnliSXoxNkd4T2hKQVcz?=
 =?utf-8?B?ZFpBVFpiNUVPTTYwVGtvc3FMSENDM3YrOFJURmNteW1DSm9jRHlTNkZpTy90?=
 =?utf-8?B?V2x2b2t5dFo4V2xOVkVpZmgrNlBYZGszaHFiMGVCRWVJcW4rMFV1MXh3Wjdx?=
 =?utf-8?B?Sm43a0pMMmpKbHR3bmtyL0UxSlBMend5RnROYWxVdE8rbFppSy9wRlY2N2NT?=
 =?utf-8?B?dk5veTZTaGVDTGVyaDlZR1VpazNSbmVUREtnL3ltRHR6WmxzbjNiK3ZRWnFW?=
 =?utf-8?B?ZkxleGxzaldVTENEM1hvNlFYNFUzQVpkdTl6c0t4RE9VNkNZMC80MzZQc1Fp?=
 =?utf-8?B?dW50VTBRVFU3Zk1jUFBVd2xUT0Nla0txU0VxbU5YZ3NnUXZQaWpSTFRUN01E?=
 =?utf-8?B?dERNWk5neGU0Q2FXNlV0QmYzQnBaWUNRZXlLV1EwZzR1dnNtSVd2a3RFT2hr?=
 =?utf-8?B?MjZUWnlyTUFNb0c4QUNBOUx6K0liWGxnNXUvWHdFZXNLRndkaFAvbW5sV3dL?=
 =?utf-8?B?WW1lczMrRzh2bnRSYm9aNDBzSE55dUsrc0tnbHhJL0tRdjVRc0ZEcStOblJ6?=
 =?utf-8?B?U05JTmF6TjFyN1owbVljMGIwYVR6U29ISVd3K0dUWmFRYi95VjEyOUVvVkdm?=
 =?utf-8?B?UDFjNEh0aEVKY2V4b3JtOFJ4b09JemJ3YjhGNnVHbU5KUGJRME5OaHVGL1Vp?=
 =?utf-8?B?cXpnVnc3djN3LzJTSDRGaTZxRTZYRnNwbWtWSWYwTC9FRS81SlI4aVVWQUtm?=
 =?utf-8?Q?A14E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 11:43:34.2267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2706c7df-80b1-4ac9-5b59-08de2760dedf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6521



On 19/11/2025 12:32, Mykola Kvach wrote:
> On Wed, Nov 19, 2025 at 1:07 PM Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 19/11/2025 12:00, Mykola Kvach wrote:
>>> Hi Michal,
>>>
>>> Thanks for your review.
>>>
>>> On Wed, Nov 19, 2025 at 10:48 AM Orzel, Michal <michal.orzel@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 18/11/2025 16:37, Mykola Kvach wrote:
>>>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>>>
>>>>> Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
>>>>> allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND call
>>>>> (both 32-bit and 64-bit variants).
>>>>>
>>>>> Implementation details:
>>>>> - Add SYSTEM_SUSPEND function IDs to PSCI definitions
>>>>> - Trap and handle SYSTEM_SUSPEND in vPSCI
>>>>> - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
>>>>>   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the system
>>>>>   in hwdom_shutdown() via domain_shutdown
>>>>> - Require all secondary VCPUs of the calling domain to be offline before
>>>>>   suspend, as mandated by the PSCI specification
>>>>>
>>>>> The arch_domain_resume() function is an architecture-specific hook that is
>>>>> invoked during domain resume to perform any necessary setup or restoration
>>>>> steps required by the platform.
>>>>>
>>>>> The new vpsci_vcpu_up_prepare() helper is called on the resume path to set up
>>>>> the vCPU context (such as entry point, some system regs and context ID) before
>>>>> resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of common
>>>>> code and avoids intrusive changes to the generic resume flow.
>>>>>
>>>>> Usage:
>>>>>
>>>>> For Linux-based guests, suspend can be initiated with:
>>>>>     echo mem > /sys/power/state
>>>>> or via:
>>>>>     systemctl suspend
>>>>>
>>>>> Resuming the guest is performed from control domain using:
>>>>>       xl resume <domain>
>>>>>
>>>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>>>> ---
>>>>> Changes in V14:
>>>>> - move arch_domain_resume to a separate header
>>>>> - avoid usage of typeof for context struct
>>>>> - moved error printing from domain_resume to arch_domain_resume
>>>>>   in order to simplify common parts of code
>>>>> - minor changes after review
>>>>> ---
>>>>>  xen/arch/arm/domain.c                 |  41 +++++++++
>>>>>  xen/arch/arm/include/asm/domain.h     |   2 +
>>>>>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>>>>>  xen/arch/arm/include/asm/psci.h       |   2 +
>>>>>  xen/arch/arm/include/asm/suspend.h    |  24 ++++++
>>>>>  xen/arch/arm/include/asm/vpsci.h      |   5 +-
>>>>>  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
>>>>>  xen/common/domain.c                   |   5 ++
>>>>>  xen/include/xen/suspend.h             |  15 ++++
>>>>>  9 files changed, 189 insertions(+), 22 deletions(-)
>>>>>  create mode 100644 xen/arch/arm/include/asm/suspend.h
>>>>>  create mode 100644 xen/include/xen/suspend.h
>>>>>
>>>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>>>> index e36719bce4..3c0170480b 100644
>>>>> --- a/xen/arch/arm/domain.c
>>>>> +++ b/xen/arch/arm/domain.c
>>>>> @@ -12,6 +12,8 @@
>>>>>  #include <xen/softirq.h>
>>>>>  #include <xen/wait.h>
>>>>>
>>>>> +#include <public/sched.h>
>>>>> +
>>>>>  #include <asm/arm64/sve.h>
>>>>>  #include <asm/cpuerrata.h>
>>>>>  #include <asm/cpufeature.h>
>>>>> @@ -24,10 +26,12 @@
>>>>>  #include <asm/platform.h>
>>>>>  #include <asm/procinfo.h>
>>>>>  #include <asm/regs.h>
>>>>> +#include <asm/suspend.h>
>>>>>  #include <asm/firmware/sci.h>
>>>>>  #include <asm/tee/tee.h>
>>>>>  #include <asm/vfp.h>
>>>>>  #include <asm/vgic.h>
>>>>> +#include <asm/vpsci.h>
>>>>>  #include <asm/vtimer.h>
>>>>>
>>>>>  #include "vpci.h"
>>>>> @@ -885,6 +889,43 @@ void arch_domain_creation_finished(struct domain *d)
>>>>>      p2m_domain_creation_finished(d);
>>>>>  }
>>>>>
>>>>> +int arch_domain_resume(struct domain *d)
>>>>> +{
>>>>> +    int rc;
>>>>> +    struct resume_info *ctx = &d->arch.resume_ctx;
>>>>> +
>>>>> +    if ( !d->is_shutting_down || d->shutdown_code != SHUTDOWN_suspend )
>>>>> +    {
>>>>> +        dprintk(XENLOG_WARNING,
>>>>> +                "%pd: Invalid domain state for resume: is_shutting_down=%d, shutdown_code=%d\n",
>>>> These are bool and uint, so %u should be used.
>>>
>>> ack
>>>
>>>>
>>>>> +                d, d->is_shutting_down, d->shutdown_code);
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>> +    /*
>>>>> +     * It is still possible to call domain_shutdown() with a suspend reason
>>>>> +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_shutdown.
>>>>> +     * In these cases, the resume context will be empty.
>>>>> +     * This is not expected to cause any issues, so we just warn about the
>>>>> +     * situation and return without error, allowing the existing logic to
>>>>> +     * proceed as expected.
>>>>> +     */
>>>>> +    if ( !ctx->wake_cpu )
>>>>> +    {
>>>>> +        dprintk(XENLOG_INFO, "%pd: Wake CPU pointer context was not provided\n",
>>>>> +                d);
>>>>> +        return 0;
>>>>> +    }
>>>>> +
>>>>> +    rc = vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
>>>>> +    if ( rc )
>>>>> +        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
>>>>> +
>>>>> +    memset(ctx, 0, sizeof(*ctx));
>>>>> +
>>>>> +    return rc;
>>>>> +}
>>>>> +
>>>>>  static int is_guest_pv32_psr(uint32_t psr)
>>>>>  {
>>>>>      switch (psr & PSR_MODE_MASK)
>>>>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>>>>> index af3e168374..e637cb4de0 100644
>>>>> --- a/xen/arch/arm/include/asm/domain.h
>>>>> +++ b/xen/arch/arm/include/asm/domain.h
>>>>> @@ -5,6 +5,7 @@
>>>>>  #include <xen/timer.h>
>>>>>  #include <asm/page.h>
>>>>>  #include <asm/p2m.h>
>>>>> +#include <asm/suspend.h>
>>>>>  #include <asm/vfp.h>
>>>>>  #include <asm/mmio.h>
>>>>>  #include <asm/gic.h>
>>>>> @@ -126,6 +127,7 @@ struct arch_domain
>>>>>      void *sci_data;
>>>>>  #endif
>>>>>
>>>>> +    struct resume_info resume_ctx;
>>>>>  }  __cacheline_aligned;
>>>>>
>>>>>  struct arch_vcpu
>>>>> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
>>>>> index effd25b69e..8dfcac7e3b 100644
>>>>> --- a/xen/arch/arm/include/asm/perfc_defn.h
>>>>> +++ b/xen/arch/arm/include/asm/perfc_defn.h
>>>>> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_reset")
>>>>>  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>>>>>  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>>>>>  PERFCOUNTER(vpsci_features,            "vpsci: features")
>>>>> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
>>>>>
>>>>>  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
>>>>>
>>>>> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
>>>>> index 4780972621..48a93e6b79 100644
>>>>> --- a/xen/arch/arm/include/asm/psci.h
>>>>> +++ b/xen/arch/arm/include/asm/psci.h
>>>>> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>>>>>  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>>>>>  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>>>>>  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
>>>>> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
>>>>>
>>>>>  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>>>>>  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>>>>>  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
>>>>> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
>>>>>
>>>>>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>>>>>  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
>>>>> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
>>>>> new file mode 100644
>>>>> index 0000000000..b991a94d5a
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/arm/include/asm/suspend.h
>>>>> @@ -0,0 +1,24 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +
>>>>> +#ifndef __ARM_SUSPEND_H__
>>>> There should be no double underscores in guards (see examples in CODING_STYLE)
>>>
>>> I had initially followed the style used by some of the existing headers
>>> in this directory, which still use guards with double underscores.
>>>
>>> I'll remove underscores in the next series.
>>>
>>>>> +#define __ARM_SUSPEND_H__
>>>>> +
>>>>> +struct resume_info {
>>>>> +    register_t ep;
>>>>> +    register_t cid;
>>>>> +    struct vcpu *wake_cpu;
>>>>> +};
>>>>> +
>>>>> +int arch_domain_resume(struct domain *d);
>>>> If possible, headers should be standalone, meaning you should include necessary
>>>> headers or forward declare what's missing.
>>>
>>> Thanks for the comment.
>>>
>>> My initial intention was to avoid adding new dependencies from asm
>>> headers to higher-level Xen headers, so I did not include e.g.
>>> <xen/sched.h> directly here. In this header we only need pointers to
>>> struct domain and struct vcpu, we never dereference them, so forward
>>> declarations would be sufficient to make it standalone.
>>>
>>> I also noticed that some existing asm headers in this directory do
>>> include higher-level Xen headers, so both patterns exist in the tree.
>>>
>>> If you prefer, I can either:
>>>   - add forward declarations
>>>
>>>       struct domain;
>>>       struct vcpu;
>>>
>>>     at the top of this header and keep the full includes in the .c
>>>     files that actually dereference these types, or
>>>
>>>   - include the appropriate Xen header(s) directly in this header.
>>>
>>> Personally I slightly prefer the forward-declaration approach to keep
>>> this header lightweight and avoid tightening the layering, but I am
>>> happy to follow your preference.
>> My preference is also to forward declare these structs.
>>
>>>
>>>>
>>>>> +
>>>>> +#endif /* __ARM_SUSPEND_H__ */
>>>>> +
>>>>> + /*
>>>>> +  * Local variables:
>>>>> +  * mode: C
>>>>> +  * c-file-style: "BSD"
>>>>> +  * c-basic-offset: 4
>>>>> +  * tab-width: 4
>>>>> +  * indent-tabs-mode: nil
>>>>> +  * End:
>>>>> +  */
>>>>> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/vpsci.h
>>>>> index 0cca5e6830..d790ab3715 100644
>>>>> --- a/xen/arch/arm/include/asm/vpsci.h
>>>>> +++ b/xen/arch/arm/include/asm/vpsci.h
>>>>> @@ -23,12 +23,15 @@
>>>>>  #include <asm/psci.h>
>>>>>
>>>>>  /* Number of function implemented by virtual PSCI (only 0.2 or later) */
>>>>> -#define VPSCI_NR_FUNCS  12
>>>>> +#define VPSCI_NR_FUNCS  14
>>>>>
>>>>>  /* Functions handle PSCI calls from the guests */
>>>>>  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
>>>>>  bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
>>>>>
>>>>> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
>>>>> +                          register_t context_id);
>>>>> +
>>>>>  #endif /* __ASM_VPSCI_H__ */
>>>>>
>>>>>  /*
>>>>> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
>>>>> index 7ba9ccd94b..22c3a5f544 100644
>>>>> --- a/xen/arch/arm/vpsci.c
>>>>> +++ b/xen/arch/arm/vpsci.c
>>>>> @@ -10,32 +10,16 @@
>>>>>
>>>>>  #include <public/sched.h>
>>>>>
>>>>> -static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>>>>> -                            register_t context_id)
>>>>> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
>>>>> +                   register_t context_id)
>>>> NIT: incorrect parameter alignment
>>>
>>> ack
>>>
>>>>
>>>>>  {
>>>>> -    struct vcpu *v;
>>>>> -    struct domain *d = current->domain;
>>>>> -    struct vcpu_guest_context *ctxt;
>>>>>      int rc;
>>>>> +    struct domain *d = v->domain;
>>>>>      bool is_thumb = entry_point & 1;
>>>>> -    register_t vcpuid;
>>>>> -
>>>>> -    vcpuid = vaffinity_to_vcpuid(target_cpu);
>>>>> -
>>>>> -    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
>>>>> -        return PSCI_INVALID_PARAMETERS;
>>>>> -
>>>>> -    /* THUMB set is not allowed with 64-bit domain */
>>>>> -    if ( is_64bit_domain(d) && is_thumb )
>>>>> -        return PSCI_INVALID_ADDRESS;
>>>>> -
>>>>> -    if ( !test_bit(_VPF_down, &v->pause_flags) )
>>>>> -        return PSCI_ALREADY_ON;
>>>>> +    struct vcpu_guest_context *ctxt;
>>>>>
>>>>>      if ( (ctxt = alloc_vcpu_guest_context()) == NULL )
>>>>> -        return PSCI_DENIED;
>>>>> -
>>>>> -    vgic_clear_pending_irqs(v);
>>>>> +        return -ENOMEM;
>>>>>
>>>>>      memset(ctxt, 0, sizeof(*ctxt));
>>>>>      ctxt->user_regs.pc64 = (u64) entry_point;
>>>>> @@ -76,8 +60,37 @@ static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>>>>>      free_vcpu_guest_context(ctxt);
>>>>>
>>>>>      if ( rc < 0 )
>>>>> +        return rc;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>>>>> +                            register_t context_id)
>>>>> +{
>>>>> +    struct vcpu *v;
>>>>> +    struct domain *d = current->domain;
>>>>> +    int rc;
>>>>> +    bool is_thumb = entry_point & 1;
>>>>> +    register_t vcpuid;
>>>>> +
>>>>> +    vcpuid = vaffinity_to_vcpuid(target_cpu);
>>>>> +
>>>>> +    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
>>>>> +        return PSCI_INVALID_PARAMETERS;
>>>>> +
>>>>> +    /* THUMB set is not allowed with 64-bit domain */
>>>>> +    if ( is_64bit_domain(d) && is_thumb )
>>>>> +        return PSCI_INVALID_ADDRESS;
>>>>> +
>>>>> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
>>>>> +        return PSCI_ALREADY_ON;
>>>>> +
>>>>> +    rc = vpsci_vcpu_up_prepare(v, entry_point, context_id);
>>>>> +    if ( rc )
>>>>>          return PSCI_DENIED;
>>>>>
>>>>> +    vgic_clear_pending_irqs(v);
>>>>>      vcpu_wake(v);
>>>>>
>>>>>      return PSCI_SUCCESS;
>>>>> @@ -197,6 +210,48 @@ static void do_psci_0_2_system_reset(void)
>>>>>      domain_shutdown(d,SHUTDOWN_reboot);
>>>>>  }
>>>>>
>>>>> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
>>>>> +{
>>>>> +    int32_t rc;
>>>>> +    struct vcpu *v;
>>>>> +    struct domain *d = current->domain;
>>>>> +    bool is_thumb = epoint & 1;
>>>>> +
>>>>> +    /* THUMB set is not allowed with 64-bit domain */
>>>>> +    if ( is_64bit_domain(d) && is_thumb )
>>>>> +        return PSCI_INVALID_ADDRESS;
>>>>> +
>>>>> +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
>>>>> +    if ( is_hardware_domain(d) )
>>>>> +        return PSCI_NOT_SUPPORTED;
>>>>> +
>>>>> +    /* Ensure that all CPUs other than the calling one are offline */
>>>>> +    domain_lock(d);
>>>>> +    for_each_vcpu ( d, v )
>>>>> +    {
>>>>> +        if ( v != current && is_vcpu_online(v) )
>>>>> +        {
>>>>> +            domain_unlock(d);
>>>>> +            return PSCI_DENIED;
>>>>> +        }
>>>>> +    }
>>>>> +    domain_unlock(d);
>>>>> +
>>>>> +    rc = domain_shutdown(d, SHUTDOWN_suspend);
>>>>> +    if ( rc )
>>>>> +        return PSCI_DENIED;
>>>>> +
>>>>> +    d->arch.resume_ctx.ep = epoint;
>>>>> +    d->arch.resume_ctx.cid = cid;
>>>>> +    d->arch.resume_ctx.wake_cpu = current;
>>>>> +
>>>>> +    gprintk(XENLOG_DEBUG,
>>>>> +            "SYSTEM_SUSPEND requested, epoint=0x%"PRIregister", cid=0x%"PRIregister"\n",
>>>> NIT: %# is preffered over 0x%.
>>>
>>> ack
>>>
>>>>
>>>>> +            epoint, cid);
>>>>> +
>>>>> +    return rc;
>>>>> +}
>>>>> +
>>>>>  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>>>>>  {
>>>>>      /* /!\ Ordered by function ID and not name */
>>>>> @@ -214,6 +269,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>>>>>      case PSCI_0_2_FN32_SYSTEM_OFF:
>>>>>      case PSCI_0_2_FN32_SYSTEM_RESET:
>>>>>      case PSCI_1_0_FN32_PSCI_FEATURES:
>>>>> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>>>>> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>>>>>      case ARM_SMCCC_VERSION_FID:
>>>>>          return 0;
>>>>>      default:
>>>>> @@ -344,6 +401,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>>>>>          return true;
>>>>>      }
>>>>>
>>>>> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>>>>> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>>>>> +    {
>>>>> +        register_t epoint = PSCI_ARG(regs, 1);
>>>>> +        register_t cid = PSCI_ARG(regs, 2);
>>>>> +
>>>>> +        if ( fid == PSCI_1_0_FN32_SYSTEM_SUSPEND )
>>>>> +        {
>>>>> +            epoint &= GENMASK(31, 0);
>>>>> +            cid &= GENMASK(31, 0);
>>>>> +        }
>>>>> +
>>>>> +        perfc_incr(vpsci_system_suspend);
>>>>> +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
>>>>> +        return true;
>>>>> +    }
>>>>> +
>>>>>      default:
>>>>>          return false;
>>>>>      }
>>>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>>>> index 775c339285..6410d32970 100644
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -26,6 +26,7 @@
>>>>>  #include <xen/hypercall.h>
>>>>>  #include <xen/delay.h>
>>>>>  #include <xen/shutdown.h>
>>>>> +#include <xen/suspend.h>
>>>>>  #include <xen/percpu.h>
>>>>>  #include <xen/multicall.h>
>>>>>  #include <xen/rcupdate.h>
>>>>> @@ -1363,6 +1364,9 @@ void domain_resume(struct domain *d)
>>>>>
>>>>>      spin_lock(&d->shutdown_lock);
>>>>>
>>>>> +    if ( arch_domain_resume(d) )
>>>>> +        goto fail;
>>>>> +
>>>>>      d->is_shutting_down = d->is_shut_down = 0;
>>>>>      d->shutdown_code = SHUTDOWN_CODE_INVALID;
>>>>>
>>>>> @@ -1373,6 +1377,7 @@ void domain_resume(struct domain *d)
>>>>>          v->paused_for_shutdown = 0;
>>>>>      }
>>>>>
>>>>> + fail:
>>>>>      spin_unlock(&d->shutdown_lock);
>>>>>
>>>>>      domain_unpause(d);
>>>>> diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
>>>>> new file mode 100644
>>>>> index 0000000000..53f75fd6ad
>>>>> --- /dev/null
>>>>> +++ b/xen/include/xen/suspend.h
>>>>> @@ -0,0 +1,15 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +#ifndef __XEN_SUSPEND_H__
>>>> There should be no double underscores in guards
>>>
>>> I initially followed the style used by the existing headers in this
>>> directory, which still have include guards with double underscores.
>>>
>>> You are right that this does not match CODING_STYLE examples.
>>> I will update this header to use a proper guard name.
>>>
>>>>
>>>>> +#define __XEN_SUSPEND_H__
>>>>> +
>>>>> +#if __has_include(<asm/suspend.h>)
>>>>> +#include <asm/suspend.h>
>>>>> +#else
>>>>> +static inline int arch_domain_resume(struct domain *d)
>>>>> +{
>>>>> +    return 0;
>>>>> +}
>>>>> +#endif
>>>>> +
>>>> Stray whiteline?
>>>
>>> will drop
>>>
>>>>
>>>>> +
>>>>> +#endif /* __XEN_SUSPEND_H__ */
>>>> Missing emacs block?
>>>
>>> It is permitted but isn't necessary as far as know,
>>> but if it needed here per your opinion I'll add it
>>> just let me know
>> On Arm we usually require them and that's the overall preference I would say.
>>
>>>
>>>>
>>>> Did you run MISRA scan on this patch?
>>>
>>> Yes, I ran it with:
>>>
>>>   ./xen/scripts/xen-analysis.py \
>>>       --run-cppcheck --cppcheck-misra --cppcheck-html -- \
>>>       XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
>>>
>>> The analysis did not report any new MISRA violations in the code
>>> touched by this patch.
>> That's only cppcheck scan which is rather poor in finding violations. ECLAIR
>> scan is done through Gitlab CI and this one is what we rely on for taking the
>> series in.
> 
> Thanks for the clarification.
> 
> Is it possible to run the ECLAIR MISRA scan locally, or is it only
> available via the project Gitlab CI instance? If there is a way to run
> it on a developer machine, I would be happy to set it up and check this
> series with the same configuration.
It's not possible to run it locally. But you can use your (if you don't have,
ask on Matrix) Xen fork under https://gitlab.com/xen-project/people to push a
branch and trigger the CI (ECLAIR scan needs to be manually executed from the
pipeline page).

~Michal


