Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CDDB92414
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 18:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127852.1468405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0jab-0003qA-HP; Mon, 22 Sep 2025 16:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127852.1468405; Mon, 22 Sep 2025 16:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0jab-0003o8-EW; Mon, 22 Sep 2025 16:40:33 +0000
Received: by outflank-mailman (input) for mailman id 1127852;
 Mon, 22 Sep 2025 16:40:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vq0y=4B=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1v0jaZ-0003o2-VS
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 16:40:32 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4f1bae1-97d2-11f0-9d14-b5c5bf9af7f9;
 Mon, 22 Sep 2025 18:40:24 +0200 (CEST)
Received: from BY3PR10CA0002.namprd10.prod.outlook.com (2603:10b6:a03:255::7)
 by LV8PR12MB9336.namprd12.prod.outlook.com (2603:10b6:408:208::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 16:40:19 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:255:cafe::5a) by BY3PR10CA0002.outlook.office365.com
 (2603:10b6:a03:255::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 16:40:19 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 16:40:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 22 Sep
 2025 09:40:17 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 22 Sep
 2025 09:40:17 -0700
Received: from [10.71.195.192] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 22 Sep 2025 09:40:16 -0700
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
X-Inumbo-ID: d4f1bae1-97d2-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQIFb+LYaR4ww7P+oUv7RdjG4hSuKWCRvyFoEN+QOq9muiK3x1c3BaPKwDoSgmmsNbtqJws7tTEfab8H6WBMbQVGO4TtM4D0G9v3Ok2RjSi3+5vQPupJqyyIkssHQOKpXkYg5f6FgTzFsQzwvtOkbXyLs5vGmTBDc35K6Xs2Jl9SCaq3ldQEkfArRvMuToSmBQuvc8PuKCTzYIzfSfCM0Fm1I3ZvfUCSPa8Ay/w+chLuEgwB78ajVRIiaj0Qb5BF9EWf/TqA8AIwri7oP8mof1H0QRfHvofzl5fNPFnLzUG3RVWVTqk8axNscUw/8Mz/b8qOug/8oOm4u3F0dLddWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KSwD4q0Aahid8xmhKhxDgqFMYslyx5ICq3471gYpE4=;
 b=pnFnAbj1V8Gev3nN2Y+B+qcSzKKj5EIOlyKXba6gihaLRyw5RhxpJJj2MrPE1x5sjkyFKZybgKEMwVV85pbEpbrDw7FgHzJSiif6YzqP+kisi9ndc+SJUNqC8PZu3ytnSN+oTCP5wAM4sJYvGUx7443+2VpIG02VnjpwTctD2U5Ob/5WuRTb6v3WC5mJH2Rzp6LQV7vqUYgJ1cL07qMgpdmbu2fBK7Y6xRd13u6uZnNEcl32nW8x6KyVFOC51lDEVCZ58L8VelX/3wUvpGtGzKMGWyKpbsB2cVpgsyVPfrry7loEXgVxRVp7vdnb6D9YY3dVoHoF0dL+Caxf21qSHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KSwD4q0Aahid8xmhKhxDgqFMYslyx5ICq3471gYpE4=;
 b=ah30m11NqOZ3zGH6j9XnDn/Y/RUGlYCnj1ZQtMjuveddGvjzxMMFbJmmc1IDF+xoYCYIDd7Uh6cJfO66nVEe+9ZzYf1AHKrb3+jdURoUVFQ0PtHbtSKL2Kjs0ZE/o35WgmRFtttxUQytZNby3bTnHuR0EAr1LHlz6uwvWVN3YJM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b3198457-9aca-430a-80ef-27f22de4ae9b@amd.com>
Date: Mon, 22 Sep 2025 17:40:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: Re: [RFC PATCH] xen/arm: Introduce GICV3 Self Tests
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250912170055.3077923-1-ayan.kumar.halder@amd.com>
 <7bbd581f-bfa4-444e-9c76-bcb833a2ec74@xen.org>
Content-Language: en-GB
In-Reply-To: <7bbd581f-bfa4-444e-9c76-bcb833a2ec74@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|LV8PR12MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a93f81b-d1d6-49f9-8bfd-08ddf9f6b74e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHZzMjFnaTNCMTJ3YTA1K1RwT2F0OUhFcnV2NXRkUFBiNmpOR0ZSOEszMVg1?=
 =?utf-8?B?QStCRkxHdGJUdUdYMUZVWVZkS0duMmUyUzI5NDZtZmt6RWNxYmJKK0swalVv?=
 =?utf-8?B?TXFNeTcxMzlMeE4zaGtnQ3NoTmNKd0twMW5GMUgrUDNiYVVBU2Z0Zm9xcjVV?=
 =?utf-8?B?clRWK2sxVmZxSkkzcEYybDIyRmV3dlFZNG9qM0VMd3JGK0I3ZURWdTJZV3Q3?=
 =?utf-8?B?WktMNXVPUFNyaThFNkFIbjd5c2VPVm13UnBNaENaV2JqdlY4UUhZNjcvRWx2?=
 =?utf-8?B?SmhaQUU2b2ZHM2F0SnJDL2pUZEsrRzZHM1B3OWorWmFvMzJ4RGVZT0JyTUsv?=
 =?utf-8?B?RUVWemg2cGw4SGZka3gvZ2VkaThWcnhxTHM3RE12REdLNTZFN3FGWWw0WTlj?=
 =?utf-8?B?MHByQ1R6SmYxbTFYLzk0dGZXNjJwMFN0bmxqc3BEbGw4OTVCcUFXZnpkMk9I?=
 =?utf-8?B?aktJMVZEMlAycFZMb01JUEpzWW9VUTBwMFBMWUsvNWlnbmd3Yk9ZcG1uRXBY?=
 =?utf-8?B?QnRIeHI4TmFtd3lRUGQyNHkrdkF5L1paMGVPYmxZNjJxVmJQY24rMFdOZWF2?=
 =?utf-8?B?djFuMmJubVVncWdZQTNKWFhaWHZDMlJ0aTdTV29BclNTZlBISDFaWGJNM29r?=
 =?utf-8?B?SW9RVFZOWnVuWnlDQTdpZmNqYzFya3pOWFZvTDluMVBrNVhkWUFpWHE3bHZK?=
 =?utf-8?B?cG9NVGZrcThLb2NpTXBqam5kaHZRMXZFR1ZqQ0lOZ2xhT3ZDaVQ4aUE2WEZ0?=
 =?utf-8?B?Z0d5VXlLNGRYRzltdGUrOUdCMVpPc3B4Q3lsOWFZN3NqejFiSVVkdHliaDVE?=
 =?utf-8?B?aEo5bzBzVEV6aVEvU1NMU3NJNnBPYllSSkdKTXpLdm9hMlFsdFlMdkJBTFV5?=
 =?utf-8?B?SmxWRFhBRWM2eXdVWFJSZEhrQlNtOGdjREhIOHI3SU1GUWxlSFh2OXd3MGFX?=
 =?utf-8?B?U01KdU4yVkpxR01PUkk5RGVTUC81Z0lwMS9rVzNHejVpcStkSzkxN2k0aVYr?=
 =?utf-8?B?NEVCS0VIYVE3WTJKbVVqckNFYUhnZDk1eWh4bDFzeDBmUVBkeEUrOGVGbkhz?=
 =?utf-8?B?dWRna0xrRGVNUTVzMDNSd2lvalRIRTBSZjd3R2orRzV4aHdiWi9SaG1QRTYv?=
 =?utf-8?B?b3pnUVpTQ3VtRWVIUk5MbTlETEEzRWdCOSt5VDNncDFHZktxWkF3aVo4N1dZ?=
 =?utf-8?B?S21FdmxvRGFjZHpIeUlvTVVBSEJKV0RxRGxGNDhlTVduNDVGNEZQc0VscXJO?=
 =?utf-8?B?T1dOS3RCcXpuN0o2cmdUckFSMGxnTFF6a1VCRUkvRTZuaDZYeGxsaGtYZ1NC?=
 =?utf-8?B?Q0k4YVZiMytjS25rcGVrTGNxRnhtNTJ1eHN0T091dFdwbjJEWW5Tem10eFVP?=
 =?utf-8?B?dm9ucUZUYk9NdzRzZ1pZdHdFUUNTclFveExqT3lDazFsQ2l0cjJIZUJaakth?=
 =?utf-8?B?cDdMaEZHOTlFMUY1bkt4NDNTVDc2WmhTWUx4YWs0ODh0dXJQT09Jc0RxYjYw?=
 =?utf-8?B?WnRlcUdzeldHRTVQRlRPVmdvT3VmNFk3WnVwa1QwMlNoSHNEZXBzY1kzTjEr?=
 =?utf-8?B?dXY2bEFVdzUxcCtLcno2UC9LRkVLZmpIdGxxR2p2ZE9wOVUrbnlTMThLVk5h?=
 =?utf-8?B?OXcwT2xpYUUyR1BCQWx6SjhqYXVRYjNhKzBCV25PTG5QWE5wQ1N1VWJEWkUr?=
 =?utf-8?B?WHBZLzNGdVZQS25WRGFhQnBTYTA1NmRlbC9Fak1BelBZRzA0bklORGlvWmwv?=
 =?utf-8?B?aHdHaEZveHBMdytQRHdPR0JKZjhPOHdndHJXVXlmSktDUTlJN3lPWmhXRFhj?=
 =?utf-8?B?Kzl2QldnUEljdjFsaHAzVTdieFRqUFBtVjZqdm1LVzBGeGJHbW00T0pnV0tj?=
 =?utf-8?B?TzRpSG1CRG9NRVNOYTRGS0tCSkpsQmFVb2daQXIwUk9jcVdDRS9qNnY5bWdY?=
 =?utf-8?B?MXB3UEFkMTJRZGpycWk3ejJ5WmJZaGc1WFR4QXZ1QkhzejB4dzdFbEFCZjZ3?=
 =?utf-8?B?cC9ocy93QU53RUtqK0xYalZTN1Fzc3NoTEp2S3paZjZKSWZUSGZTUTNrQXVa?=
 =?utf-8?Q?cdjcWJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 16:40:18.7786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a93f81b-d1d6-49f9-8bfd-08ddf9f6b74e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9336


On 15/09/2025 12:14, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 12/09/2025 18:00, Ayan Kumar Halder wrote:
>> Introduce CONFIG_GICV3_SELFTEST to enclose tests for GICv3 driver.
>> Test that Xen is able to generate SGIs.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> One of the aim of functional safety is to test hw/sw interface. This 
>> means that
>> Xen is able to configure the hardware correctly for the desired 
>> functionalities.
>>
>> Normally this is tested from the VMs. For eg if a VM is able to 
>> receive irq, this
>> implies that Xen has configured the GICv3 interface 'correctly'. 
>> However this is
>> a high level (or integration) test which uses not only the GICv3 
>> interface
>> between Xen and VM, but the interrupt injection code for Xen to VMs.
>>
>> We want to have some kind of unit tests to check that Xen is able to 
>> receive
>> various interrupts, set priorities, etc. Here, we have written unit 
>> tests for
>> software generated interrupts (SGIs) as example.
>>
>> These tests are expected to be triggered as Xen boots (right after 
>> Xen has
>> initialised the GICv3 interface ie gicv3_init(). The aim of this test 
>> is to
>> check whether Xen can trigger SGIs after gicv3_init() is invoked. If 
>> so, we can
>> claim that gicv3_init() was done properly to be able to trigger SGIs. 
>
> To clarify, this only guarantees that the boot CPU can send SGIs to self. 
Yes, this is the idea.
> Secondary CPUs are brought up later and will need their own setup to 
> enable SGIs.
Yes, we will have separate tests for them.
>
>> Likewise
>> we will have tests to check for priorities, SPIs, etc.
>>
>> A script will parse the logs and claim that Xen is able to trigger SGIs.
>>
>>   xen/arch/arm/Kconfig  |  8 ++++++++
>>   xen/arch/arm/gic-v3.c |  7 +++++++
>>   xen/arch/arm/gic.c    | 21 +++++++++++++++++++++
>>   3 files changed, 36 insertions(+)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 950e4452c1..739f99eaa9 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -73,6 +73,14 @@ config GICV3
>>         Driver for the ARM Generic Interrupt Controller v3.
>>         If unsure, use the default setting.
>>   +config GICV3_SELFTEST
>> +    bool "GICv3 driver self test"
>> +    default n
>> +    depends on GICV3
>> +    ---help---
>> +
>> +      Self tests to validate GICV3 driver.
>> +
>>   config HAS_ITS
>>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if 
>> UNSUPPORTED
>>           depends on GICV3 && !NEW_VGIC && !ARM_32
>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index 4e6c98bada..eb0c05231c 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -1818,6 +1818,13 @@ static int __init gicv3_init(void)
>>         gicv3_hyp_init();
>>   +#ifdef CONFIG_GICV3_SELFTEST
>> +    send_SGI_self(GIC_SGI_EVENT_CHECK);
>> +    send_SGI_self(GIC_SGI_DUMP_STATE);
>> +    send_SGI_self(GIC_SGI_CALL_FUNCTION);
>> +    send_SGI_self(GIC_SGI_MAX);
>> +#endif
>
> Looking a the code below, it seems like Xen will not be functional 
> after running the selftests? Is this intended? If so, we need to stop 
> Xen as soon as possible.

Tbh, I didnot realize this with the current test. However you are 
correct that for some of these tests, Xen will not be usable. We can put 
a while(1) after it completes the tests.

Or, I can invoke machine_halt() .

The important bit here is CONFIG_GICV3_SELFTEST cannot be enabled for 
normal usage of Xen. IOW, user should not expect Xen to run domains when 
this configuration is enabled.

They are used to run baremetal tests.

>
> Also, looking at start_xen(), we call local_irq_enable() a little 
> after gicv3_init() is called. So I am a little bit surprised this is 
> working?

This is working i.e. we are getting interrupts. However, I can put the 
test after local_irq_enable() as Xen is expected to terminate after 
running the tests.

- Ayan

>
> Cheers,
>

