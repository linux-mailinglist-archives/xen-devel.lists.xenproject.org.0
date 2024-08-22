Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2993995B118
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 11:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781611.1191100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh3gl-0001nm-Eb; Thu, 22 Aug 2024 09:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781611.1191100; Thu, 22 Aug 2024 09:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh3gl-0001n3-B2; Thu, 22 Aug 2024 09:01:03 +0000
Received: by outflank-mailman (input) for mailman id 781611;
 Thu, 22 Aug 2024 09:01:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uUbg=PV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sh3gk-0001ms-3Y
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 09:01:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e88::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b2fdb79-6065-11ef-8776-851b0ebba9a2;
 Thu, 22 Aug 2024 11:00:58 +0200 (CEST)
Received: from BYAPR01CA0070.prod.exchangelabs.com (2603:10b6:a03:94::47) by
 SA1PR12MB6993.namprd12.prod.outlook.com (2603:10b6:806:24c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 09:00:48 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::a9) by BYAPR01CA0070.outlook.office365.com
 (2603:10b6:a03:94::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Thu, 22 Aug 2024 09:00:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Thu, 22 Aug 2024 09:00:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 04:00:47 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 22 Aug 2024 04:00:46 -0500
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
X-Inumbo-ID: 0b2fdb79-6065-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2X7GI5LvyHO1hgMSOh+I4d71+HMdiOzoIWEQrayHrEC1ahQIlZFYWN4g05LNT5oRcFMge3WdEF+hK2Ou+/3rmXpWt+LUnFyccNx2CfGfhvsd4Hc1xr7QnnFUBFKsCPKNNWr5eBEmcXXAOQqWh7QV1cXdkk2onqiz+FyW5GoUV0aljMwH8a0XjEl4/ttDh+xep6etLxNqJWfMtk8AwEN/idtlpZel1UFkg+Z81YUWba/VLY7ABL1gkf0eiwVXA6ToxA6ugh1ObBoKr14oxss+1xeAYVPtUc7Ny2F0tVqPlylxMp4OqoYd94q3Ckdu8KZhxorRY6YgHV03QU+E2/Fzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXGyVAFUgv7B/6g+hZeR9hLS8a3VENRWOrTauzgDXcg=;
 b=MQD7tXNDBOAcgeqs/LWcc35KnfVmUBVM6yYp9zpr6F1a33+YZI/QcYAYfL7UN2ILcqzUhIBbUj4F1WvYIhGNhH0OEFj86mf8wF5agOhhWi92zDJXFcGNWrWU/T7dxw6x1En3fB074SdJP7hJ8k9ItnlB3IuCB7TrSxv7gOAh8vHk7xn5uhKE88HAp05h2I7C526XY+1N3xEZtSTC2shE0HqrV6RXmVk9EjINRSD+jQ0QWI/GlDmDbT1Co15iYM8qccxFhTj6oT1exA7Y/qnIPDlH6VNLkGTVhEUI0q0fasAkCqPRLs5IkRmtyxzTm40Sho207qru582mBQkh/8nVDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXGyVAFUgv7B/6g+hZeR9hLS8a3VENRWOrTauzgDXcg=;
 b=cz3WjnU151MA0fwq/XSWh2jsQ3NA4JU3Ua7vIHrgmGASCYnZqw6ySgQC8qytl4hvk2TvsD+k42BLyxKOEO1/517q62IgqNt4Ug8tDx17AIMVzziikqKgCjlV98BlRgMKPDsumpv6KIrnSDQDiYMJLxmTtTbMqsvFYvJ+5EsUwuU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <101a7105-5638-4c69-a5b0-29c252284aea@amd.com>
Date: Thu, 22 Aug 2024 11:00:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add requirements for generic timer
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20240820103816.1661102-1-ayan.kumar.halder@amd.com>
 <5F0AF572-3437-4372-96EB-42F46B3A3155@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <5F0AF572-3437-4372-96EB-42F46B3A3155@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|SA1PR12MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 45405fc2-05da-42ce-1de6-08dcc288ea3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzFBZU9wbGxMOGRmbEhoT2pLa0hHM3ZKd0R3NUVmMjNLd1E3Qm11b3luanFa?=
 =?utf-8?B?VnVlWXhUOTJWRXhodkwxeUdMb1NmRkRGVkZRNzFJb3VhVGovL3lNNkQ3SXRR?=
 =?utf-8?B?NDcxZWZUS0V2YWo2bFJoTlF2N2dKekNZL1F3QUFvZ3VSSXlhWHNoOUxEM1Vz?=
 =?utf-8?B?Z2IwYTk0djJzM013L2lJMmp3N0ZUZ25uejhabmtReDdkYklRTVJJNGtsWWNr?=
 =?utf-8?B?L1pxSEp0bkZzM0UxRU9tblBFeXo4Rjl0dmhxcmVmcDFxZmJkeWx5VWVMa05u?=
 =?utf-8?B?VFRFa3lHbTU5cXpVaUFuV3hBWUZUOE4ySWZCbnhRVVYwM2N6TFBLU0NtMGc3?=
 =?utf-8?B?Qnd5OHJhNzhxa21OTHhyblRzcS9pSFpYT0V5c2tZV2Evd1BqU1N3OVlVYm50?=
 =?utf-8?B?SDA4c2NTSWpveUdTUXhHZVBTQXhCWUZLaGQxeTdOQis0c2xLTm5uL0lRUnY5?=
 =?utf-8?B?UGRZcGZLY2VDYzJ5c2dSQnVnVjl3TGtuYzlaWWhjSEp6L2s5SU9YTExsRTgv?=
 =?utf-8?B?bkl3UkMxNGtjZ0ZlS0dCVjhheG9BRFVQdXM5VFlHWGd3eVpGNjlTTEMxM29x?=
 =?utf-8?B?UFhRSy9VWCs5RmZFVk94YkFhMUJHb2E0QjVBV2FUamVhZDVNTS95QnNiaE02?=
 =?utf-8?B?WEJlS1RHdGxiVTMvREdBQUtQTnlXVTNuTk8zM1NsTVdFT3RySjBYTmVVWXFa?=
 =?utf-8?B?bDR3d0ltMnpoOUxXY0gzVlJoUzNsREF3ZGJudU15Uk8vN2lOSWJYQldNbGE0?=
 =?utf-8?B?V2FYYVg5VFMxVWxpZld0UkliWEJRMTlLT2RYTmZVbmVrcVB2WkROSGY3d284?=
 =?utf-8?B?emJsTjdTRHozU05zeDRZdkQ3VjVCeG9FUm9laUcwVGdDcFJlU3hsQldhTXJx?=
 =?utf-8?B?aE02cHczdnA3OEN4eDlodXFzaUxyQjhBYUVpUmNKOFE5Z0dOUmEvU0Zja1g5?=
 =?utf-8?B?VldQcGo1RUI0YTBNNko4R0NtRUxCMlZHY0FqcmxPVitqZEROL09KT3kvVE0z?=
 =?utf-8?B?dGNqd0p4elpjeGdQOW92UUNCUHorZ3RnWTVyZW10K3NrWnE2S2xia1lJVlJa?=
 =?utf-8?B?V2t2U3c4RDNvVEJWSEJnRFhYRWVTYmNmYmxSMEZ3eUl4MGovbTVLazkrZ1dY?=
 =?utf-8?B?bFVqaFhocFJGeTBDdVpSUmtYQVFTNTAvZTQvTW1iZER4Nm5hVEZXNjcvRC92?=
 =?utf-8?B?TGl4dThzblZJM0JFcTJ3d3drRDgzdFVsZ1FEa2djZVNJbUtxNHJKQnpmMUJ0?=
 =?utf-8?B?SUMrQTY4ekhPV0pvUEtkWXF2QzdJUW9ORnRCbEJyOC9VcHp2cG1ITmVNUTlT?=
 =?utf-8?B?dXByby9NbDVRT2NrTjc0MG1qdHNhcnNRSUlpK3ZUaFpidXB6MEM2LzRrdllm?=
 =?utf-8?B?UzNYQStGc1VpUit0SVV1WGRLTytIeXNtRkV4NkM5UjN6TW0zR2M2NUZZM0RU?=
 =?utf-8?B?TnByQWpXR1ZpYzV2dFY0UmdQYjFxTFdUM3BoTE5MOG8ydFVqSENuSVVaVzlS?=
 =?utf-8?B?M0NFa0ZSZDBudzh2dTUwZlVzb0g3UG55WWk1Y2lzT0lub0s3U1JLUzc4aktj?=
 =?utf-8?B?QWFKVklkNEdRRU9OYy80SERnZTFDLzdncUhiejg4U3BUUkhMNy9LNTlVMU9T?=
 =?utf-8?B?RUQ4K2ErdHZlYmRROCtQclJ4eUVqM1NTM3R2dWhPUWpUVmJxQ1FDVFltR3Rr?=
 =?utf-8?B?UTNRT21XS3F0TEx3cVZWZVYxMFJITDJIaGlxQW4ybEI5d2JVa3lGU1lESXU3?=
 =?utf-8?B?TDBOalVmWXhGOENxVTRQWitGaUxXUmloK2tlNzVPTS9pMm9hTUV5OUxhN05K?=
 =?utf-8?B?NFE1V2d2Sk1KVG1wTitNRnZxVXJ5MDExaW1IdTUxMHZFd3ViTnFJZkhveUQy?=
 =?utf-8?B?eWt0VkRWMFVtcXdYME1lNUV1cklOZjlwaysydVV2dGpiWm1tMXJPRlhCTGVL?=
 =?utf-8?Q?zRoXHYlPFGI4xJUq9O98DGOJnMJs9geE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 09:00:47.9354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45405fc2-05da-42ce-1de6-08dcc288ea3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6993

Hi Bertrand,

I agree with all your comments with a few exceptions, as stated below.

On 21/08/2024 17:06, Bertrand Marquis wrote:
> 
> 
> Hi Ayan,
> 
>> On 20 Aug 2024, at 12:38, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> From: Michal Orzel <michal.orzel@amd.com>
>>
>> Add the requirements for the use of generic timer by a domain
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> .../reqs/design-reqs/arm64/generic-timer.rst  | 139 ++++++++++++++++++
>> docs/fusa/reqs/index.rst                      |   3 +
>> docs/fusa/reqs/intro.rst                      |   3 +-
>> docs/fusa/reqs/market-reqs/reqs.rst           |  34 +++++
>> docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  24 +++
>> 5 files changed, 202 insertions(+), 1 deletion(-)
>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>> create mode 100644 docs/fusa/reqs/market-reqs/reqs.rst
>> create mode 100644 docs/fusa/reqs/product-reqs/arm64/reqs.rst
>>
>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>> new file mode 100644
>> index 0000000000..bdd4fbf696
>> --- /dev/null
>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>> @@ -0,0 +1,139 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Generic Timer
>> +=============
>> +
>> +The following are the requirements related to ARM Generic Timer [1] interface
>> +exposed by Xen to Arm64 domains.
>> +
>> +Probe the Generic Timer device tree node from a domain
>> +------------------------------------------------------
>> +
>> +`XenSwdgn~arm64_generic_timer_probe_dt~1`
>> +
>> +Description:
>> +Xen shall generate a device tree node for the Generic Timer (in accordance to
>> +ARM architected timer device tree binding [2]).
> 
> You might want to say where here. The domain device tree ?
> 
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Domains shall probe the Generic Timer device tree node.
> 
> Please prevent the use of "shall" here. I would use "can".
> Also detect the presence of might be better than probe.
> 
>> +
>> +Covers:
>> + - `XenProd~emulated_timer~1`
>> +
>> +Read system counter frequency
>> +-----------------------------
>> +
>> +`XenSwdgn~arm64_generic_timer_read_freq~1`
>> +
>> +Description:
>> +Xen shall expose the frequency of the system counter to the domains.
> 
> The requirement would need to say in CNTFRQ_EL0 and in the domain device tree xxx entry.
> 
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Domains shall read it via CNTFRQ_EL0 register or "clock-frequency" device tree
>> +property.
> 
> I do not think this comment is needed.
> 
>> +
>> +Covers:
>> + - `XenProd~emulated_timer~1`
>> +
>> +Access CNTKCTL_EL1 system register from a domain
>> +------------------------------------------------
>> +
>> +`XenSwdgn~arm64_generic_timer_access_cntkctlel1~1`
>> +
>> +Description:
>> +Xen shall expose counter-timer kernel control register to the domains.
> 
> "counter-timer kernel" is a bit odd here, is it the name from arm arm ?
> Generic Timer control registers ? or directly the register name.
This is the name from Arm ARM. See e.g.:
https://developer.arm.com/documentation/ddi0601/2023-12/AArch64-Registers/CNTKCTL-EL1--Counter-timer-Kernel-Control-Register?lang=en

> 
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Domains shall access the counter-timer kernel control register to allow
>> +controlling the access to the timer from userspace (EL0).
> 
> This is documented in the arm arm, this comment is not needed.
> 
>> +
>> +Covers:
>> + - `XenProd~emulated_timer~1`
>> +
>> +Access virtual timer from a domain
>> +----------------------------------
>> +
>> +`XenSwdgn~arm64_generic_timer_access_virtual_timer~1`
>> +
>> +Description:
>> +Xen shall expose the virtual timer registers to the domains.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Domains shall access and make use of the virtual timer by accessing the
>> +following system registers:
>> +CNTVCT_EL0,
>> +CNTV_CTL_EL0,
>> +CNTV_CVAL_EL0,
>> +CNTV_TVAL_EL0.
> 
> The requirement to be complete should give this list, not the comment.
> 
>> +
>> +Covers:
>> + - `XenProd~emulated_timer~1`
>> +
>> +Access physical timer from a domain
>> +-----------------------------------
>> +
>> +`XenSwdgn~arm64_generic_timer_access_physical_timer~1`
>> +
>> +Description:
>> +Xen shall expose physical timer registers to the domains.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Domains shall access and make use of the physical timer by accessing the
>> +following system registers:
>> +CNTPCT_EL0,
>> +CNTP_CTL_EL0,
>> +CNTP_CVAL_EL0,
>> +CNTP_TVAL_EL0.
> 
> same as upper
> 
>> +
>> +Covers:
>> + - `XenProd~emulated_timer~1`
>> +
>> +Trigger the virtual timer interrupt from a domain
>> +-------------------------------------------------
>> +
>> +`XenSwdgn~arm64_generic_timer_trigger_virtual_interrupt~1`
>> +
>> +Description:
>> +Xen shall enable the domains to program the virtual timer to generate the
>> +interrupt.
> 
> I am not sure this is right here.
> You gave access to the registers upper so Xen responsibility is not really to
> enable anything but rather make sure that it generates an interrupt according to
> how the registers have been programmed.
I'm in two minds about it. On one hand you're right and the IRQ trigger is a side-effect
of programming the registers correctly. On the other, these are design requirements which
according to "fusa/reqs/intro.rst" describe what SW implementation is doing. Our way of injecting
timer IRQs into guests is a bit different (phys timer is fully emulated and we use internal timers
and for virt timer we first route IRQ to Xen, mask the IRQ and inject to guest). If I were to write
tests to cover Generic Timer requirements I'd expect to cover whether r.g. masking/unmasking IRQ works,
whether IRQ was received, etc.

I'd like to know other opinions. @Stefano, @Artem

~Michal



