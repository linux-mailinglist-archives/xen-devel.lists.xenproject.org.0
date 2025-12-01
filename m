Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05637C9876A
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 18:16:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175926.1500513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ7Ux-0006Pf-1e; Mon, 01 Dec 2025 17:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175926.1500513; Mon, 01 Dec 2025 17:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ7Uw-0006NF-UP; Mon, 01 Dec 2025 17:15:38 +0000
Received: by outflank-mailman (input) for mailman id 1175926;
 Mon, 01 Dec 2025 17:15:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2MM0=6H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vQ7Uw-0006N9-2h
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 17:15:38 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 565584da-ced9-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 18:15:32 +0100 (CET)
Received: from BN8PR04CA0062.namprd04.prod.outlook.com (2603:10b6:408:d4::36)
 by IA1PR12MB8239.namprd12.prod.outlook.com (2603:10b6:208:3f7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:15:23 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::34) by BN8PR04CA0062.outlook.office365.com
 (2603:10b6:408:d4::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 17:15:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 17:15:23 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 11:15:23 -0600
Received: from [172.31.77.70] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 1 Dec 2025 09:15:22 -0800
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
X-Inumbo-ID: 565584da-ced9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVATkSpBsh+5A6Kew6paDwPbC3D1Xmb2tMW9R0XYvn4ZyCsprjF4GBmZN0/gztACBKk60/BJda8HTdP0WWtmRUm6IJr1iTJjtEOgDHvpYYk26MjSrvo9ssgpTt2XdCjmvzph0vuWIWNqZLU6A32fVIS31lxv/6Q41q8SqHgTUmjmOo0zUVdmsFvFhSHmn0bM5FITG5qs3Nu0bheBp5uB+0K2Yx9NZ0zlvw2lmgP+ske4a9PVFmFxLvTen4HjtHN04yhwjFh6hWA1o5fMH7OHrw/VT7Z9a7zSnephsAsVfhQJfF2dkfkSk1SvDkZxfkLRMHZVBlgJ1JxwZ5NcbCeB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0TMjo/MIt1o8DBY2AnzLgOWBc7wgV/u13yRi2eKAYQ=;
 b=SDV2+H3oZ+0A+Z1pRbIQ4hkkBd79ZZyR5ec4K2xWKoDnFnOzm3t8NgoA4szWosDRKc82Wb9azcVZM10tqXVWNfz4+Qj8FZZ5IOpzGmRZQeq/+4XFnedGZpacvZ2f7YHV26WOgkuVNTRz9f+uSVYdKv2KnhjgWaQYcgAjjIF2p2ZFDf+lkD2VM5oQtenWNkqNucR6+WmXPm25bZWpCI8B6/0oIZjMyIaOB3wgJwXtFmVMbYrNjcUsx4m8U25d+lBSUPI3t7wqJaFMSCN6W9IKKD76b3q7ptt4UWU4hrDG4Mg+/kkTdkCOMI1tM8HPZfAre/q7B0WNEjQZFctxybSg0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0TMjo/MIt1o8DBY2AnzLgOWBc7wgV/u13yRi2eKAYQ=;
 b=belQRIwe+iarG2zAhREFNDLByYlQ0jJz6BJ7Jx8nyhHqDXc7p4SWjeP+AiCb0qYoW5PUsIeQ8Rji4U/lHVQfOPxItOJV+j8pUrJZwvbhHmglPA4It5o79z3/3Y4R3kWScDn93rNj/kR2PYh4U67xQlyIosWWGaNDj11KBmJnG84=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <ce270a90-ffc4-45f8-9af6-be9aa1c49162@amd.com>
Date: Mon, 1 Dec 2025 12:15:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices
To: Yann Sionneau <yann.sionneau@vates.tech>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <20251119224731.61497-1-jason.andryuk@amd.com>
 <20251119224731.61497-2-jason.andryuk@amd.com>
 <584b282f-4562-4051-b028-b9d36b3d16c6@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <584b282f-4562-4051-b028-b9d36b3d16c6@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|IA1PR12MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9a9c4c-bc68-473f-15c0-08de30fd36a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWhCcWdHWUJxMDVIaFJvbGJHZVBlODIrdkVhaHRkeDZKQlVDdVd0RmVsNzBO?=
 =?utf-8?B?VHVJZ3NDQitYRDRxQURGd0l4dllnVVorMVIzb2FPUmlLeGcxTUdISTdJWlJ5?=
 =?utf-8?B?dXY5aGJOTGV1TFlSY2FtRFdSUldBSVZPTG9WZjdHbXhhVHpHN2o3QWJJYkZW?=
 =?utf-8?B?QnpoME1ZNDdqdDlhOHJ1T3JldjYxOCsrSmQwdC9OZk83ZHY5NHUrdU1rMlF6?=
 =?utf-8?B?WlFDVXg0dE43NWJaUFlHQURHWURvVEVDL0pDcDVxanp2RVdhYmVkYzZ6bjgy?=
 =?utf-8?B?V3NHeGZDOTFLejlOZ2tLSFN2dStrSXhPN0JBaU1MMFJZK3g2eFdJVEZnNlU4?=
 =?utf-8?B?VWJVZEhlaVFLRHVSQWNpTTFmYXR1b1NPUm1TNEE5M0NwekdrajZ0R2NwbnRT?=
 =?utf-8?B?RXhqZVp5OWUybmhydTZ0TEVJbmxaVFNQMXRWbXlKVzhGVTR5SndycWk4MzN2?=
 =?utf-8?B?QzJHQ0NENXBicVNqNDU5ZGcxZXh5eHBSTmoyaWZwdEtaSjlwejE1WjVrWFQx?=
 =?utf-8?B?WU1uRXBKSS9Iam10aWxPc1dGbzJnWURMaExrZ2NwZWJhU3JJSXo4bFFnbktN?=
 =?utf-8?B?bkwwY3ZiY3NnT3lQdGRldm4wbC9tVVlXTk40b05YeSs2R0g4TWtUc2piQmlj?=
 =?utf-8?B?SE42NkVVWktURmp6SUl3Y0w4Z1lab0F4RFRoYnAydUUrSU9JTTY5MlVsSGtY?=
 =?utf-8?B?MXpiTER6TDhrb1p6WFNtcU5wcExCemNLVWFZZmRUQlc5VTNNS3A4SWtwSFE0?=
 =?utf-8?B?WklSeGJkUGlDQ0NSQVNMY3hJVUhKV1RScVpKRkJ0SFJlUktoSXJRMEJjOEFQ?=
 =?utf-8?B?Mkk5SElRdFA5OWpOTGtZKzIxajN1Q3VldUlaTUd6Sis3NHM3eEZzM0FYZGZX?=
 =?utf-8?B?dWJXUHRGTHNzZVFZRUFmYk9aR2JxOEl5cisyNzhFRjB6Njc5Um5rcFNYSFMr?=
 =?utf-8?B?Qllqb1VneUYvZ3RCL0JLOG5tQmtTK0pDZjl5MGtJYzRIc3JVZ2N2WjI3MjA3?=
 =?utf-8?B?UkpxRDgzbmo5aUR2enBGNjh6WGtudWYrV2hFVEJjV1l4SERMeU13NCt0RnM2?=
 =?utf-8?B?V29zLys2WklaNHFabUo0UnpTWDdIc2tvNTg0cHRtTE5LRkIzZHhpUGpxY3A5?=
 =?utf-8?B?SjJJaXNkWE81THBmY0lVY0hBdWllQUtwWFRHWDlseWlaWXoyem9TT0RSY1g5?=
 =?utf-8?B?Ynd4VnRtVnRZNTdNRFREUTVBclpaTUYzRjdOZFZnb1RKUCtISmFHV0U1dWhU?=
 =?utf-8?B?VlA1cURVbVN0cUxRbExBRGVVQmFZdms3ajExb0tLN2w2QWkvVGwrTGRXYXJn?=
 =?utf-8?B?aHFMR0VTUTBhRFJzK2tkNlcrN2k0OWxhbHJ5b3FkUnpwZUVCNzZwMCtraURl?=
 =?utf-8?B?dituTHRXVHB0RDZ0SSt4TjlaSlJIYVZkZHMyWW1zN3VWdDZKOGY1WHdCT1JP?=
 =?utf-8?B?NGZFYVBVQ2RSLzJLN2NHWDFPemZhRkxyQ0pZemZGeDZiNVcyRGFzR2YzRG9z?=
 =?utf-8?B?dzVPS0NBZnFiZDgwYmdYRnBiQm1qSlQrd0tCNjg1c081SDM4M2hBVm5ZUUhh?=
 =?utf-8?B?MzRNMlVuSFJBYngxd2lCWm9VUUFEVHFjMTJmQW1PTEZ2a0tPUFNwR1d5SHhL?=
 =?utf-8?B?ekZsRTlSZ1ZGREhxRjU2Y0hndERuRE51YXBwZ3ZreWJOZ0QwZENvSDd4bE1K?=
 =?utf-8?B?TjE4UFB6aTIvNlRZY3pJQkY2U3dIaXJZL21BSkRxYmNZQndnQkVWZXhvbHZq?=
 =?utf-8?B?eWsxaUNZeGZBcG9xUTk1dlFycVpxajJibklwdTNDV3BuaS9reE5GbTdMMGNM?=
 =?utf-8?B?aExrRXZIZGdrVTUvWk9ScmFXR05sbnRQTHZ2dURpYTg2SDNhUlRyYUtseVdo?=
 =?utf-8?B?RVN3V1hkLzF6K1JYNTdNcUlIVkRwK2NXdno2T1ZBeno3YVFVS0k0MjFvV3hH?=
 =?utf-8?B?SlRHWnFvMEQzNkJ6bXlGSUgzNSszVkUybDRObG5QaW0zaHErcFdMT01ZNmtV?=
 =?utf-8?B?N0xnQXNIU1AxbDdYSzlReFpUUUEwbzBVY1BnZmFSMWNlVHVySStVajFlRHo1?=
 =?utf-8?B?NnpqWXcyWFZGTDllYlVYZnhFSmpoSm1XVjB3T2c1TGZlTXFJUFUyTTNDNDJ0?=
 =?utf-8?Q?6QDLOPLqwNWbIlj1s/26Yl4R2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:15:23.4670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9a9c4c-bc68-473f-15c0-08de30fd36a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8239

On 2025-11-26 10:00, Yann Sionneau wrote:
> Hi Jason,
> 
> On 11/19/25 23:46, Jason Andryuk wrote:
>> The goal is to fix s2idle and S3 for Xen PV devices.  A domain resuming
>> from s3 or s2idle disconnects its PV devices during resume.  The
>> backends are not expecting this and do not reconnect.
>>
>> b3e96c0c7562 ("xen: use freeze/restore/thaw PM events for suspend/
>> resume/chkpt") changed xen_suspend()/do_suspend() from
>> PMSG_SUSPEND/PMSG_RESUME to PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE, but the
>> suspend/resume callbacks remained.
>>
>> .freeze/restore are used with hiberation where Linux restarts in a new
>> place in the future.  .suspend/resume are useful for runtime power
>> management for the duration of a boot.
>>
>> The current behavior of the callbacks works for an xl save/restore or
>> live migration where the domain is restored/migrated to a new location
>> and connecting to a not-already-connected backend.
>>
>> Change xenbus_pm_ops to use .freeze/thaw/restore and drop the
>> .suspend/resume hook.  This matches the use in drivers/xen/manage.c for
>> save/restore and live migration.  With .suspend/resume empty, PV devices
>> are left connected during s2idle and s3, so PV devices are not changed
>> and work after resume.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>    drivers/xen/xenbus/xenbus_probe_frontend.c | 4 +---
>>    1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
>> index 6d1819269cbe..199917b6f77c 100644
>> --- a/drivers/xen/xenbus/xenbus_probe_frontend.c
>> +++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
>> @@ -148,11 +148,9 @@ static void xenbus_frontend_dev_shutdown(struct device *_dev)
>>    }
>>    
>>    static const struct dev_pm_ops xenbus_pm_ops = {
>> -	.suspend	= xenbus_dev_suspend,
>> -	.resume		= xenbus_frontend_dev_resume,
>>    	.freeze		= xenbus_dev_suspend,
>>    	.thaw		= xenbus_dev_cancel,
>> -	.restore	= xenbus_dev_resume,
>> +	.restore	= xenbus_frontend_dev_resume,
>>    };
>>    
>>    static struct xen_bus_type xenbus_frontend = {
> 
> I've tried putting Debian 13 to sleep with your patch (echo freeze >
> /sys/power/state) and could not wake up the guest.
> Isn't it also mandatory to apply this patch
> https://github.com/QubesOS/qubes-linux-kernel/blob/main/xen-events-Add-wakeup-support-to-xen-pirq.patch
> ?
> 
> With both patches applied, I get the wake up to work.

I did not need the additional patch.  I thought it was necessary for 
dom0 s0ix wakeup which uses xen-pirq for hardware interrupts.  I did not 
think it was necessary for a domU.  I'm only looking at the domU case 
here, and this code is for frontend PV devices.

In my setup, I use `xl trigger $dom sleep` to enter (and exit) s2idle 
for a PVH domain, which has the ACPI buttons exposed with X86_EMU_PM. 
This is a non-standard configuration.

I've additionally tested with `echo mem > /sys/power/state` to enter 
s2idle.  Again waking with `xl trigger $dom sleep`.

xl console remains connected, but typing there does not wake.

What kind of guest are you testing with?  How do you wake it?  If it's 
HVM in S3, another way to attempt wake up may be `xl 
qemu-monitor-command $dom system_wakeup`.

Regards,
Jason

