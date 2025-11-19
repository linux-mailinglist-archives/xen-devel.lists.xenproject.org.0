Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAD8C6E238
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 12:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165834.1492517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLg2O-0008WV-2V; Wed, 19 Nov 2025 11:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165834.1492517; Wed, 19 Nov 2025 11:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLg2N-0008Ud-W4; Wed, 19 Nov 2025 11:07:47 +0000
Received: by outflank-mailman (input) for mailman id 1165834;
 Wed, 19 Nov 2025 11:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6cZ7=53=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vLg2L-0008UH-NZ
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 11:07:46 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4670837-c537-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 12:07:36 +0100 (CET)
Received: from CH2PR07CA0036.namprd07.prod.outlook.com (2603:10b6:610:20::49)
 by IA1PR12MB6258.namprd12.prod.outlook.com (2603:10b6:208:3e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 11:07:27 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::d1) by CH2PR07CA0036.outlook.office365.com
 (2603:10b6:610:20::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 11:07:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 11:07:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 19 Nov
 2025 03:07:26 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Nov
 2025 05:07:26 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 19 Nov 2025 03:07:22 -0800
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
X-Inumbo-ID: f4670837-c537-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFRX1SD4gQG5t7QcNoM6sQRftJYCLLQwjxLa2DYJ5AFgw3mk4kH4OxagAm0MLc4pHqofAcbBW4DxzuVj7gIfTH8O2Pn+O/Py5UsyyD4VXjq4sEs4UZB0meiiWTXg4aDNLIgT7x032AMLyyQkXuwkikQ2Nh2wOYVfqXekfFR1b6YmdYK+0kcJ2PW9qpA49Qynsutduwwtk/b74lAWoOKJjQSs3DqP7bPRDFYXLBxyGJ1LiwBuLQX5QMyqMmsDpEBaotABWuiYTjiaeocm15sF1nL9leIjf2Nxe7FmYeKD0dHJiGR+X6OajicI8FtemIBrDt2l4aiMCxaOIgrj1Qqkuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMvVme95m4G6IbgFOmezWrxJF1zkKYEpmcFc9+b9dUU=;
 b=FD62/ouZ2f3hvVB0X2jtozu3Fkuqa538DVhJeDCEVCCwxjRTuB9eodWA0t8noQDIYZcOVvhgbtVrje6adEtXzkSztoUG9s/gX9i9PI0yTh0EyAm5aCaJIGyYZJd+p/h+47m8CCJKZMMRIbOk4YQ5KjWuApvMdyTc7eGav/Zyt5wY6/o576MyzuQgOQkRFOCKZU7KyqcxAoW4x5me2feFG9gsxOinYB63zYJe5Z/ODjEWA6YqSoWfmGRDZkM+bQkP5J9jmLyuxi3X4Io+KccZGsYLwB9UQIir4EXGo49QOn6vqhva1s+j7qpU7XBHoDXPdXGtacxsTzYSrzq4ku+eHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMvVme95m4G6IbgFOmezWrxJF1zkKYEpmcFc9+b9dUU=;
 b=j6dnRkNE3bnx+zqh+Pmmy0ImVMSrOd/059L1HLaIRbX2G3eH519xmp0tmBLaA9ETaCjb0uRre3ybL1mjMJxWKFuaLb/gQz+yFioGXFhgr/GGF3Jb5zihnPgRG9WVYohXycnqOOhOUfFzn9OlhyqZm18SoYAQOJ7iNshzSPVde+s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <cd7657d8-47bd-4484-91b3-4fb79985537c@amd.com>
Date: Wed, 19 Nov 2025 12:07:22 +0100
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
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV_4Bpp50wkd+wtq6zVHg4KZqnOcndG7rfqMndo=HW1sYQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|IA1PR12MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b65d9b-a87f-43d1-bd5a-08de275bd326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUxUM3JMWkF2bHlyTmk2Vm96eHkzOGxLbmlqUjZkQmFESVZZREJ5QzRQS0dn?=
 =?utf-8?B?VVFqLzQycnJTMTNaV3pmNk1YY0tQU2RicUJ2Zm5rTVZZMXJYQ2JLbFRWcGM2?=
 =?utf-8?B?TllzOXhkS2M2WHdQZTl3Q2RWN2lxSlJYb2pSSnQ3MHpENzZWUXNXSmtvb0RR?=
 =?utf-8?B?S21HWHQrZ3dxMTdOdEo2b3ZUMjN5c0hsUm1rdnNrUjhoL1d4UmQ0cmUwUDNF?=
 =?utf-8?B?SzlGU3hnbG1ZV0srYXpzNDdMeDM0NjU0UE12RDlvNXNNTHY2eHVTajNOS2Z1?=
 =?utf-8?B?RFdkMDZLMGNpbWVQTzhZbHZqaUNsUjFmZ0ZrU3dOT2dmRm1FNVJOcGR4NS81?=
 =?utf-8?B?NWtGZ0ZhdG5nUmV4MVVnRlQ0TWJnR2xmakxxb3RXUXVIOWp2NjlLTnVSa0FF?=
 =?utf-8?B?bkdlREE5YW96Z2hCaXVmcWVzSndoYUpQU2prNStyTlMyUmx0ZTNZcFExNzQ1?=
 =?utf-8?B?ZmhTL2RJS3RnU2Y1TFpZMURFNjNHbEtWNzNxdTU5N2JSMGF4MzV5eUsvYzA1?=
 =?utf-8?B?dlR3VGQ1Y0x0d1pORWRhbndyWG4yWnlMT25vaWFvWEVubWJXeUdlcFBLcWtO?=
 =?utf-8?B?NVl3bHBBaER0MDhUMWFTZ3BrU3NjSnV5Y3cyTlRkdm5icXFjbFJEbExZTUNB?=
 =?utf-8?B?SW5jUmtXNDRjdlJ5cGdaem5JSk5PalZPVnpsVTA5UE5aWW9kSjhTL0R5MVJY?=
 =?utf-8?B?UXpSK3ErbElkUjd2eGxXQ3ZnN3cwWWMrYTM1d1NDUEVVQkxGdUxaQXlQUTZP?=
 =?utf-8?B?cXJkU3BMMWdnVElUUE5kNzBEQTVYOXV1YTJIT2RNL1pONWpvZElseXJPT3k3?=
 =?utf-8?B?bEhTcysrUzBmTjBIVGpKTG1Yaks5QkJUaE0rU1FiRFpBYWdVNUZxcEVYZUV5?=
 =?utf-8?B?SHhDM09xRHZTb1pVcE00ZGtkaGdPcXQxdTk4cGJvdkpCK2NmVjFyOXprR2FU?=
 =?utf-8?B?VEwvWGREYVMxcGtrV3lwa1UydEJrdkN1eHNrVVZlVWU2bTc5OTFpWGdmc25I?=
 =?utf-8?B?ZmJZeEVCck9GK0o5ZzkvMWdGVWhDaktSUTBJTUhPMi9GS3owODAxREtUcUlu?=
 =?utf-8?B?UFM3c0NYcnlzd2tKeWhObGtYaHU1WU84djV0d0JhN1VkTnRzMEVHdTFaVEpw?=
 =?utf-8?B?WHpnTGRlTEpqVnduWHJ6UGQrdWsrSnc0Rjk3VlhUYTFqOGs5dlpyRUlrYWtw?=
 =?utf-8?B?NWhpT1loalp1L0RKTURnWU9EWk51VFF6M2FSNnpNYStkRHBtekgzTGllR1Zo?=
 =?utf-8?B?L1RHZC9lNUhpVkFtQ3BZM3cydncvQVg5K2lwMUZibDM1UnE1MnJDd1B4VFVa?=
 =?utf-8?B?T2M1RzNNZUVmZXArbGtBR2FFc2FkbHhTNXV2emJOMEdKZE51eGoyQUFWS3k0?=
 =?utf-8?B?ZTNNL2hkVHZQWkEyc0x1N3hRVmUvbm1Ba0ZzT3lBZ1A3R2x6dVBLRll0c202?=
 =?utf-8?B?MHJEZS91NXdOcmNydlBzSDRIUjY5UEtQY3VMUFR2SU1WZXZpdVlHN3BkR1FX?=
 =?utf-8?B?VDFxN3VJQU5aVEdZeC9jOGlwajBrd2d2MC83L2svSDdNRVdhamNhR3dUM0N4?=
 =?utf-8?B?Q3YvUGp4MmU1Q2poZGovSS9EYmNFRmd2VGU0T0hQU3VISlowYm44OGdSZlFo?=
 =?utf-8?B?NklSckY0QWtGZ1pHVk8ySUFXMjBUaW0vZUFoMDNoejBGRGVhcWh6clJuQzVw?=
 =?utf-8?B?TWVoamQrVkpKeHNmbEZiNFNUWUFBT095c3dPWkt3MHU4Y2FNUFVBZDVJZm9O?=
 =?utf-8?B?N3QzbkpaMmhDUWxaVm9WamtZQVBlV1JqRHF2YjU1SXBJWnVJbURndWlXakNv?=
 =?utf-8?B?UWlKZVhFZGg0WnVTd0QxQkZWb2UreUw4R2xQUjdNNVNFRWh2dHRGSStlbElr?=
 =?utf-8?B?d0Z0QWRSNUduYnRydWNQeEJ4azZqbk0yU3NpTmgvaDYwWVlFb3d4d0NEWVJw?=
 =?utf-8?B?eVVicmxHeHVac21xVnZuTjErem03ZUxQbHFNcSsxWmFhR1lpSzN6ak1lZGxk?=
 =?utf-8?B?aVhhSkVwZW9SaFlZUW5WMFRUMk9hWFNLVkFIWFBqNzZvQWowZmViMXBuOXhY?=
 =?utf-8?B?TzdqdFh2NDZzUXQzeDJVNHp1VVN3MlVvZnVPYzlqSitxdEF4WE1iTlRWaTkr?=
 =?utf-8?Q?pvVo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 11:07:27.0689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b65d9b-a87f-43d1-bd5a-08de275bd326
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6258



On 19/11/2025 12:00, Mykola Kvach wrote:
> Hi Michal,
> 
> Thanks for your review.
> 
> On Wed, Nov 19, 2025 at 10:48 AM Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 18/11/2025 16:37, Mykola Kvach wrote:
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
>>> allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND call
>>> (both 32-bit and 64-bit variants).
>>>
>>> Implementation details:
>>> - Add SYSTEM_SUSPEND function IDs to PSCI definitions
>>> - Trap and handle SYSTEM_SUSPEND in vPSCI
>>> - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
>>>   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the system
>>>   in hwdom_shutdown() via domain_shutdown
>>> - Require all secondary VCPUs of the calling domain to be offline before
>>>   suspend, as mandated by the PSCI specification
>>>
>>> The arch_domain_resume() function is an architecture-specific hook that is
>>> invoked during domain resume to perform any necessary setup or restoration
>>> steps required by the platform.
>>>
>>> The new vpsci_vcpu_up_prepare() helper is called on the resume path to set up
>>> the vCPU context (such as entry point, some system regs and context ID) before
>>> resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of common
>>> code and avoids intrusive changes to the generic resume flow.
>>>
>>> Usage:
>>>
>>> For Linux-based guests, suspend can be initiated with:
>>>     echo mem > /sys/power/state
>>> or via:
>>>     systemctl suspend
>>>
>>> Resuming the guest is performed from control domain using:
>>>       xl resume <domain>
>>>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>> Changes in V14:
>>> - move arch_domain_resume to a separate header
>>> - avoid usage of typeof for context struct
>>> - moved error printing from domain_resume to arch_domain_resume
>>>   in order to simplify common parts of code
>>> - minor changes after review
>>> ---
>>>  xen/arch/arm/domain.c                 |  41 +++++++++
>>>  xen/arch/arm/include/asm/domain.h     |   2 +
>>>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>>>  xen/arch/arm/include/asm/psci.h       |   2 +
>>>  xen/arch/arm/include/asm/suspend.h    |  24 ++++++
>>>  xen/arch/arm/include/asm/vpsci.h      |   5 +-
>>>  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
>>>  xen/common/domain.c                   |   5 ++
>>>  xen/include/xen/suspend.h             |  15 ++++
>>>  9 files changed, 189 insertions(+), 22 deletions(-)
>>>  create mode 100644 xen/arch/arm/include/asm/suspend.h
>>>  create mode 100644 xen/include/xen/suspend.h
>>>
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index e36719bce4..3c0170480b 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -12,6 +12,8 @@
>>>  #include <xen/softirq.h>
>>>  #include <xen/wait.h>
>>>
>>> +#include <public/sched.h>
>>> +
>>>  #include <asm/arm64/sve.h>
>>>  #include <asm/cpuerrata.h>
>>>  #include <asm/cpufeature.h>
>>> @@ -24,10 +26,12 @@
>>>  #include <asm/platform.h>
>>>  #include <asm/procinfo.h>
>>>  #include <asm/regs.h>
>>> +#include <asm/suspend.h>
>>>  #include <asm/firmware/sci.h>
>>>  #include <asm/tee/tee.h>
>>>  #include <asm/vfp.h>
>>>  #include <asm/vgic.h>
>>> +#include <asm/vpsci.h>
>>>  #include <asm/vtimer.h>
>>>
>>>  #include "vpci.h"
>>> @@ -885,6 +889,43 @@ void arch_domain_creation_finished(struct domain *d)
>>>      p2m_domain_creation_finished(d);
>>>  }
>>>
>>> +int arch_domain_resume(struct domain *d)
>>> +{
>>> +    int rc;
>>> +    struct resume_info *ctx = &d->arch.resume_ctx;
>>> +
>>> +    if ( !d->is_shutting_down || d->shutdown_code != SHUTDOWN_suspend )
>>> +    {
>>> +        dprintk(XENLOG_WARNING,
>>> +                "%pd: Invalid domain state for resume: is_shutting_down=%d, shutdown_code=%d\n",
>> These are bool and uint, so %u should be used.
> 
> ack
> 
>>
>>> +                d, d->is_shutting_down, d->shutdown_code);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /*
>>> +     * It is still possible to call domain_shutdown() with a suspend reason
>>> +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_shutdown.
>>> +     * In these cases, the resume context will be empty.
>>> +     * This is not expected to cause any issues, so we just warn about the
>>> +     * situation and return without error, allowing the existing logic to
>>> +     * proceed as expected.
>>> +     */
>>> +    if ( !ctx->wake_cpu )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "%pd: Wake CPU pointer context was not provided\n",
>>> +                d);
>>> +        return 0;
>>> +    }
>>> +
>>> +    rc = vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
>>> +    if ( rc )
>>> +        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
>>> +
>>> +    memset(ctx, 0, sizeof(*ctx));
>>> +
>>> +    return rc;
>>> +}
>>> +
>>>  static int is_guest_pv32_psr(uint32_t psr)
>>>  {
>>>      switch (psr & PSR_MODE_MASK)
>>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>>> index af3e168374..e637cb4de0 100644
>>> --- a/xen/arch/arm/include/asm/domain.h
>>> +++ b/xen/arch/arm/include/asm/domain.h
>>> @@ -5,6 +5,7 @@
>>>  #include <xen/timer.h>
>>>  #include <asm/page.h>
>>>  #include <asm/p2m.h>
>>> +#include <asm/suspend.h>
>>>  #include <asm/vfp.h>
>>>  #include <asm/mmio.h>
>>>  #include <asm/gic.h>
>>> @@ -126,6 +127,7 @@ struct arch_domain
>>>      void *sci_data;
>>>  #endif
>>>
>>> +    struct resume_info resume_ctx;
>>>  }  __cacheline_aligned;
>>>
>>>  struct arch_vcpu
>>> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
>>> index effd25b69e..8dfcac7e3b 100644
>>> --- a/xen/arch/arm/include/asm/perfc_defn.h
>>> +++ b/xen/arch/arm/include/asm/perfc_defn.h
>>> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_reset")
>>>  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>>>  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>>>  PERFCOUNTER(vpsci_features,            "vpsci: features")
>>> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
>>>
>>>  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
>>>
>>> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
>>> index 4780972621..48a93e6b79 100644
>>> --- a/xen/arch/arm/include/asm/psci.h
>>> +++ b/xen/arch/arm/include/asm/psci.h
>>> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>>>  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>>>  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>>>  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
>>> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
>>>
>>>  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>>>  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>>>  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
>>> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
>>>
>>>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>>>  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
>>> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
>>> new file mode 100644
>>> index 0000000000..b991a94d5a
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/suspend.h
>>> @@ -0,0 +1,24 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef __ARM_SUSPEND_H__
>> There should be no double underscores in guards (see examples in CODING_STYLE)
> 
> I had initially followed the style used by some of the existing headers
> in this directory, which still use guards with double underscores.
> 
> I'll remove underscores in the next series.
> 
>>> +#define __ARM_SUSPEND_H__
>>> +
>>> +struct resume_info {
>>> +    register_t ep;
>>> +    register_t cid;
>>> +    struct vcpu *wake_cpu;
>>> +};
>>> +
>>> +int arch_domain_resume(struct domain *d);
>> If possible, headers should be standalone, meaning you should include necessary
>> headers or forward declare what's missing.
> 
> Thanks for the comment.
> 
> My initial intention was to avoid adding new dependencies from asm
> headers to higher-level Xen headers, so I did not include e.g.
> <xen/sched.h> directly here. In this header we only need pointers to
> struct domain and struct vcpu, we never dereference them, so forward
> declarations would be sufficient to make it standalone.
> 
> I also noticed that some existing asm headers in this directory do
> include higher-level Xen headers, so both patterns exist in the tree.
> 
> If you prefer, I can either:
>   - add forward declarations
> 
>       struct domain;
>       struct vcpu;
> 
>     at the top of this header and keep the full includes in the .c
>     files that actually dereference these types, or
> 
>   - include the appropriate Xen header(s) directly in this header.
> 
> Personally I slightly prefer the forward-declaration approach to keep
> this header lightweight and avoid tightening the layering, but I am
> happy to follow your preference.
My preference is also to forward declare these structs.

> 
>>
>>> +
>>> +#endif /* __ARM_SUSPEND_H__ */
>>> +
>>> + /*
>>> +  * Local variables:
>>> +  * mode: C
>>> +  * c-file-style: "BSD"
>>> +  * c-basic-offset: 4
>>> +  * tab-width: 4
>>> +  * indent-tabs-mode: nil
>>> +  * End:
>>> +  */
>>> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/vpsci.h
>>> index 0cca5e6830..d790ab3715 100644
>>> --- a/xen/arch/arm/include/asm/vpsci.h
>>> +++ b/xen/arch/arm/include/asm/vpsci.h
>>> @@ -23,12 +23,15 @@
>>>  #include <asm/psci.h>
>>>
>>>  /* Number of function implemented by virtual PSCI (only 0.2 or later) */
>>> -#define VPSCI_NR_FUNCS  12
>>> +#define VPSCI_NR_FUNCS  14
>>>
>>>  /* Functions handle PSCI calls from the guests */
>>>  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
>>>  bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
>>>
>>> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
>>> +                          register_t context_id);
>>> +
>>>  #endif /* __ASM_VPSCI_H__ */
>>>
>>>  /*
>>> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
>>> index 7ba9ccd94b..22c3a5f544 100644
>>> --- a/xen/arch/arm/vpsci.c
>>> +++ b/xen/arch/arm/vpsci.c
>>> @@ -10,32 +10,16 @@
>>>
>>>  #include <public/sched.h>
>>>
>>> -static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>>> -                            register_t context_id)
>>> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
>>> +                   register_t context_id)
>> NIT: incorrect parameter alignment
> 
> ack
> 
>>
>>>  {
>>> -    struct vcpu *v;
>>> -    struct domain *d = current->domain;
>>> -    struct vcpu_guest_context *ctxt;
>>>      int rc;
>>> +    struct domain *d = v->domain;
>>>      bool is_thumb = entry_point & 1;
>>> -    register_t vcpuid;
>>> -
>>> -    vcpuid = vaffinity_to_vcpuid(target_cpu);
>>> -
>>> -    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
>>> -        return PSCI_INVALID_PARAMETERS;
>>> -
>>> -    /* THUMB set is not allowed with 64-bit domain */
>>> -    if ( is_64bit_domain(d) && is_thumb )
>>> -        return PSCI_INVALID_ADDRESS;
>>> -
>>> -    if ( !test_bit(_VPF_down, &v->pause_flags) )
>>> -        return PSCI_ALREADY_ON;
>>> +    struct vcpu_guest_context *ctxt;
>>>
>>>      if ( (ctxt = alloc_vcpu_guest_context()) == NULL )
>>> -        return PSCI_DENIED;
>>> -
>>> -    vgic_clear_pending_irqs(v);
>>> +        return -ENOMEM;
>>>
>>>      memset(ctxt, 0, sizeof(*ctxt));
>>>      ctxt->user_regs.pc64 = (u64) entry_point;
>>> @@ -76,8 +60,37 @@ static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>>>      free_vcpu_guest_context(ctxt);
>>>
>>>      if ( rc < 0 )
>>> +        return rc;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>>> +                            register_t context_id)
>>> +{
>>> +    struct vcpu *v;
>>> +    struct domain *d = current->domain;
>>> +    int rc;
>>> +    bool is_thumb = entry_point & 1;
>>> +    register_t vcpuid;
>>> +
>>> +    vcpuid = vaffinity_to_vcpuid(target_cpu);
>>> +
>>> +    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
>>> +        return PSCI_INVALID_PARAMETERS;
>>> +
>>> +    /* THUMB set is not allowed with 64-bit domain */
>>> +    if ( is_64bit_domain(d) && is_thumb )
>>> +        return PSCI_INVALID_ADDRESS;
>>> +
>>> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
>>> +        return PSCI_ALREADY_ON;
>>> +
>>> +    rc = vpsci_vcpu_up_prepare(v, entry_point, context_id);
>>> +    if ( rc )
>>>          return PSCI_DENIED;
>>>
>>> +    vgic_clear_pending_irqs(v);
>>>      vcpu_wake(v);
>>>
>>>      return PSCI_SUCCESS;
>>> @@ -197,6 +210,48 @@ static void do_psci_0_2_system_reset(void)
>>>      domain_shutdown(d,SHUTDOWN_reboot);
>>>  }
>>>
>>> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
>>> +{
>>> +    int32_t rc;
>>> +    struct vcpu *v;
>>> +    struct domain *d = current->domain;
>>> +    bool is_thumb = epoint & 1;
>>> +
>>> +    /* THUMB set is not allowed with 64-bit domain */
>>> +    if ( is_64bit_domain(d) && is_thumb )
>>> +        return PSCI_INVALID_ADDRESS;
>>> +
>>> +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
>>> +    if ( is_hardware_domain(d) )
>>> +        return PSCI_NOT_SUPPORTED;
>>> +
>>> +    /* Ensure that all CPUs other than the calling one are offline */
>>> +    domain_lock(d);
>>> +    for_each_vcpu ( d, v )
>>> +    {
>>> +        if ( v != current && is_vcpu_online(v) )
>>> +        {
>>> +            domain_unlock(d);
>>> +            return PSCI_DENIED;
>>> +        }
>>> +    }
>>> +    domain_unlock(d);
>>> +
>>> +    rc = domain_shutdown(d, SHUTDOWN_suspend);
>>> +    if ( rc )
>>> +        return PSCI_DENIED;
>>> +
>>> +    d->arch.resume_ctx.ep = epoint;
>>> +    d->arch.resume_ctx.cid = cid;
>>> +    d->arch.resume_ctx.wake_cpu = current;
>>> +
>>> +    gprintk(XENLOG_DEBUG,
>>> +            "SYSTEM_SUSPEND requested, epoint=0x%"PRIregister", cid=0x%"PRIregister"\n",
>> NIT: %# is preffered over 0x%.
> 
> ack
> 
>>
>>> +            epoint, cid);
>>> +
>>> +    return rc;
>>> +}
>>> +
>>>  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>>>  {
>>>      /* /!\ Ordered by function ID and not name */
>>> @@ -214,6 +269,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>>>      case PSCI_0_2_FN32_SYSTEM_OFF:
>>>      case PSCI_0_2_FN32_SYSTEM_RESET:
>>>      case PSCI_1_0_FN32_PSCI_FEATURES:
>>> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>>> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>>>      case ARM_SMCCC_VERSION_FID:
>>>          return 0;
>>>      default:
>>> @@ -344,6 +401,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>>>          return true;
>>>      }
>>>
>>> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>>> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>>> +    {
>>> +        register_t epoint = PSCI_ARG(regs, 1);
>>> +        register_t cid = PSCI_ARG(regs, 2);
>>> +
>>> +        if ( fid == PSCI_1_0_FN32_SYSTEM_SUSPEND )
>>> +        {
>>> +            epoint &= GENMASK(31, 0);
>>> +            cid &= GENMASK(31, 0);
>>> +        }
>>> +
>>> +        perfc_incr(vpsci_system_suspend);
>>> +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
>>> +        return true;
>>> +    }
>>> +
>>>      default:
>>>          return false;
>>>      }
>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>> index 775c339285..6410d32970 100644
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -26,6 +26,7 @@
>>>  #include <xen/hypercall.h>
>>>  #include <xen/delay.h>
>>>  #include <xen/shutdown.h>
>>> +#include <xen/suspend.h>
>>>  #include <xen/percpu.h>
>>>  #include <xen/multicall.h>
>>>  #include <xen/rcupdate.h>
>>> @@ -1363,6 +1364,9 @@ void domain_resume(struct domain *d)
>>>
>>>      spin_lock(&d->shutdown_lock);
>>>
>>> +    if ( arch_domain_resume(d) )
>>> +        goto fail;
>>> +
>>>      d->is_shutting_down = d->is_shut_down = 0;
>>>      d->shutdown_code = SHUTDOWN_CODE_INVALID;
>>>
>>> @@ -1373,6 +1377,7 @@ void domain_resume(struct domain *d)
>>>          v->paused_for_shutdown = 0;
>>>      }
>>>
>>> + fail:
>>>      spin_unlock(&d->shutdown_lock);
>>>
>>>      domain_unpause(d);
>>> diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
>>> new file mode 100644
>>> index 0000000000..53f75fd6ad
>>> --- /dev/null
>>> +++ b/xen/include/xen/suspend.h
>>> @@ -0,0 +1,15 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __XEN_SUSPEND_H__
>> There should be no double underscores in guards
> 
> I initially followed the style used by the existing headers in this
> directory, which still have include guards with double underscores.
> 
> You are right that this does not match CODING_STYLE examples.
> I will update this header to use a proper guard name.
> 
>>
>>> +#define __XEN_SUSPEND_H__
>>> +
>>> +#if __has_include(<asm/suspend.h>)
>>> +#include <asm/suspend.h>
>>> +#else
>>> +static inline int arch_domain_resume(struct domain *d)
>>> +{
>>> +    return 0;
>>> +}
>>> +#endif
>>> +
>> Stray whiteline?
> 
> will drop
> 
>>
>>> +
>>> +#endif /* __XEN_SUSPEND_H__ */
>> Missing emacs block?
> 
> It is permitted but isn't necessary as far as know,
> but if it needed here per your opinion I'll add it
> just let me know
On Arm we usually require them and that's the overall preference I would say.

> 
>>
>> Did you run MISRA scan on this patch?
> 
> Yes, I ran it with:
> 
>   ./xen/scripts/xen-analysis.py \
>       --run-cppcheck --cppcheck-misra --cppcheck-html -- \
>       XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
> 
> The analysis did not report any new MISRA violations in the code
> touched by this patch.
That's only cppcheck scan which is rather poor in finding violations. ECLAIR
scan is done through Gitlab CI and this one is what we rely on for taking the
series in.

~Michal


