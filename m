Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88401B9F7C6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 15:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130521.1470043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1lr5-0002aC-3N; Thu, 25 Sep 2025 13:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130521.1470043; Thu, 25 Sep 2025 13:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1lr5-0002YR-0i; Thu, 25 Sep 2025 13:17:51 +0000
Received: by outflank-mailman (input) for mailman id 1130521;
 Thu, 25 Sep 2025 13:17:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NIhE=4E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1v1lr3-0002YL-7N
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 13:17:49 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 068b62e4-9a12-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 15:17:47 +0200 (CEST)
Received: from SA1P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::33)
 by PH8PR12MB7157.namprd12.prod.outlook.com (2603:10b6:510:22b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 13:17:41 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:22c:cafe::6a) by SA1P222CA0015.outlook.office365.com
 (2603:10b6:806:22c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Thu,
 25 Sep 2025 13:17:41 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 13:17:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 06:17:39 -0700
Received: from [10.71.195.192] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 25 Sep 2025 06:17:38 -0700
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
X-Inumbo-ID: 068b62e4-9a12-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQvNkfEVr19tGpC0LSPYpNn5JBF/RwaXF1plVP0luBDn/XYNmFFAEQPboNQU1PH+WEwkaLFWG6hO7uHDKHBc9pBlh58j8dRORt+niSAG87Pf8xtzmRPh3LrcujZP1JwuZSKUeOccP4RrOEzWeLqUXkZ+CxvefTRz0wuewVLUkOmrGB1HJkj+bl1pgCUJPpTfjyKAOwYuvER2sGO37LlCjRVEQi0L5ZcVmyGCimn1k6uZKc8/DlZUTRgTpjZ3Y3zXI7tkynMCmDTy7FCgNETnTImqysZMnyjUl5QVDbz07SmrmUhEfowy0ZJobaFmUYtIqFkfbI7mS0LOg2skqu+OoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86drkz1ZF5qoikkRw7605ruVIVQHB6U9CrJXiDuFzgU=;
 b=zBoq4cnjB5s5SFjtFzSzIn8r9uTIwVkeuyt6kWBsRqtth+N8NyfIsLz8ptIeOjRfvV3Xdp7wq25FwVTj8VtVnXXXcl3LhjMcFmzjA4Mdqy6RhqbCeDRWr08H1+AUEbv3Y/dTqE0uRm5+21wIzNvdUVx+cL2V8nR6wzKWaznGfZxqvpxIOklL6phaE4VvzswsYUBe+t3algHGYwVr9gy/5Co8J2ZDCneBDEOM8+zgIxccqq+9qRjceKOiKXHHCzOBbW3mnTlBexJwdjvRbVHU3A0G3Yfm0pTkyDj2ItxFcb4knOA8qpvqSihnzquMCMgtJicawb32bK4KIXR3nabpGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86drkz1ZF5qoikkRw7605ruVIVQHB6U9CrJXiDuFzgU=;
 b=RhvSxb2Iv38D87O1hA3EgI+JG3irnlGa4S1/BXRvqLoNyq7zYS4j/5Emp5sAYmJL4GZ9gkoKA+EAJPooRB3zeoE/N8RYa9+vPZrORsPbRX5+mW0dLVgaL2eZrfV1P9qhS4NiRC/dpjuCgVEdsauNL0H8Tbtc9OJ1T5ThymCTMvg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <7d8964c9-6de6-4d90-af47-17fa55463cdf@amd.com>
Date: Thu, 25 Sep 2025 14:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Introduce GICV3 Self Tests
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250912170055.3077923-1-ayan.kumar.halder@amd.com>
 <7bbd581f-bfa4-444e-9c76-bcb833a2ec74@xen.org>
 <b3198457-9aca-430a-80ef-27f22de4ae9b@amd.com>
 <7afc0bde-062d-4606-8a99-b57abf953710@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <7afc0bde-062d-4606-8a99-b57abf953710@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|PH8PR12MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b8b399-5a92-41dc-c4bc-08ddfc35e793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHE1QmtHQWtnbERpcTZmV3hYQUxVai91cW5iUGVUVkttVXhibFBqTTNxa0ZV?=
 =?utf-8?B?SHdLTDIxcXRUSXRmeDZCeU5oUStFZ1pHQkc1eE5jeWtNWDE5WjJtOVJDbnZm?=
 =?utf-8?B?Rm1JVkZOL0dsUlpOdnEzN1FYQlhTdkJnc1NZLzBEbC8zV3hTVmQ4VzFHamdQ?=
 =?utf-8?B?b01qZ0I0ejY1bWUrUC9FYi9wdUVLYkp4N3JWTEx1UlVkWUY2YUFNdHUzV09F?=
 =?utf-8?B?L29YZHpoVUJyQ3JFdjN3TjRwZnJwZ2FabTlDU0dGaDZRUjMveHhWQmxCMVUy?=
 =?utf-8?B?bzdHMWFFcjN4ZmgxKzFic2c4SzNXNE0vTXFNU056dTNCOWEzTitGK2VzSld4?=
 =?utf-8?B?UEUrblIvSG5zWUIzSXB6T0ZQTzA3OHdGQjZaQkhQeEp5K2szbm9NM0lwcGdZ?=
 =?utf-8?B?dXBPM1lMaGlxRlROMDd0VWdFWmhqejJZd3lzSlZ6TUFVOVZPTlU5UEZacURI?=
 =?utf-8?B?L2ltdEV2ckgwN1ppSWRnRGNrb1dVcEVOWU5iUndvVmxBTm9KczJMYS9tWXVE?=
 =?utf-8?B?aXkxY2FhbHdOZy9WUzUrUGRLTXd4OFFhZ0Z6eTNUMW9WSFRCenltOVNLU254?=
 =?utf-8?B?cjVzeFgxb0xLUzhhajhDaWlhMUx0UHJ6WHRnNmVzSzVUR2JMQkZocWozbVhs?=
 =?utf-8?B?Z3ZXYzV3Q1Fsbzg4OVhLVGpFampvbnRNZldIeHhNOWtIeERhbUNMN29KY1RD?=
 =?utf-8?B?YzB5bHIwazNpUitTb3RUaDBVTElMb1N3NW10QWtHa0hHeHlocUIwVDM5U003?=
 =?utf-8?B?elJyUDlFVVZxRklWYnBxeVJ1U045M1JVQVdaL1JJUjg1SUVrK1JMOGI0MnE5?=
 =?utf-8?B?QTUrRmt0cUx4QUZQZEs5cWkzYlVod3gySCtheHF2OEJTbVF3R2RTNkQ2ZzJ3?=
 =?utf-8?B?VUFlMHcxditmOEJEa1V0ekdKMTVuTTQzWTFDN2gzWlRBaUxSQjBRdGdLckQy?=
 =?utf-8?B?VCs2S2VWUUhGNDYxQWwvTFN5NXR4R3JvWVJDRG9xcjJpR1VvT2cwb0ppNWdV?=
 =?utf-8?B?aE0xRXVWWDE5VXVZZXZrTDFvaGx5UCt2emhzcnJWYjFIM21SWlRMQmhzNTNa?=
 =?utf-8?B?UXR5VGh2QnY2bFRhcWdGcFBrM0pJL3ZrSUdOYkpZaVZhMjhkOGF1UytXNlBr?=
 =?utf-8?B?WU51Qis2ZWFXY1NqaFVrZTk4QUJJM01HN3o2Um5ObEhWRVV6djFaR2NJdEdn?=
 =?utf-8?B?ZUYrcmJUZ0d4M1ZNZWpoNVhGMzR1bTQ2K0x1anE1NERYL1E5bi9OcUVjVFlD?=
 =?utf-8?B?SVpTNWJKQkFHOHZ1OG9DUGliWENwKzhyTURvUm5ZWmFpMWNJNm5pSXpKRmtp?=
 =?utf-8?B?QmtyS2xvNTk4eC80ak95NmlSUU4yaUQ3akVUU21IY0s5bHA0NXV2UEtYei9O?=
 =?utf-8?B?M2tNOWpaSFBVMURWeGE3L0k0b0ozYnBLZXlnekVjNlQ3dlhIcGZ2VXBrTG1Y?=
 =?utf-8?B?NHo4VWR1bEpLT2hDVkdCZTBreHRyaEljaW9KaWVIc2F3RXRPQzdvTFhiY1c2?=
 =?utf-8?B?TTlScWk2eTRNcGVDaW1BaGhIUHlCd2crRmZ6Ylo3SFZhYXlyV01RenVpcFNh?=
 =?utf-8?B?L09vdWNlZHRyZnp6WHJ1N25DejlFc3k5SWlsdWNneWRYSU9TUm1ZTWVBYlBX?=
 =?utf-8?B?UlcvNWllQ1lONUFrMVlreEd1djk4R2g4U2hGUlF4OHhUU2pTM2JWZ2xvQ1kw?=
 =?utf-8?B?NkVDZzl3SHZZRTFVcTljM0JVMnVrSmI4UFBHS1YwU0xBWTBRU2Z3WUFaRDNv?=
 =?utf-8?B?K0NyUGdwYU1IenJ6L2M1VXhrNzUrT0FqYk9LT1dScCtYa0ZHZFNZSk1oTklL?=
 =?utf-8?B?VGwvRDhabkZ6N2hPd0ZIZVN1bHNqN2R0ckVWVlhvMHFiWHV0VEhSalYwZnkw?=
 =?utf-8?B?RjR0ais3aWtFaW1tdTFXaXdSTnpnb2tPdGgrYXA5T25xYWFkQXdNOGhzdjds?=
 =?utf-8?B?YWtacVNPblhySDFxYk5DUkFLcFpSbmJhVEJWR2RlUUphOWNET3JCVDhWYnlJ?=
 =?utf-8?B?QjlzUmNPTlQwK0x5dDM4aDhUK2xhOGtRb0EwY01HV3BxSTdsdmtPYXJubDJt?=
 =?utf-8?Q?PHZk4x?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 13:17:40.4562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b8b399-5a92-41dc-c4bc-08ddfc35e793
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7157


On 22/09/2025 18:22, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 22/09/2025 17:40, Ayan Kumar Halder wrote:
>>
>> On 15/09/2025 12:14, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 12/09/2025 18:00, Ayan Kumar Halder wrote:
>>>> Introduce CONFIG_GICV3_SELFTEST to enclose tests for GICv3 driver.
>>>> Test that Xen is able to generate SGIs.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>> One of the aim of functional safety is to test hw/sw interface. 
>>>> This means that
>>>> Xen is able to configure the hardware correctly for the desired 
>>>> functionalities.
>>>>
>>>> Normally this is tested from the VMs. For eg if a VM is able to 
>>>> receive irq, this
>>>> implies that Xen has configured the GICv3 interface 'correctly'. 
>>>> However this is
>>>> a high level (or integration) test which uses not only the GICv3 
>>>> interface
>>>> between Xen and VM, but the interrupt injection code for Xen to VMs.
>>>>
>>>> We want to have some kind of unit tests to check that Xen is able 
>>>> to receive
>>>> various interrupts, set priorities, etc. Here, we have written unit 
>>>> tests for
>>>> software generated interrupts (SGIs) as example.
>>>>
>>>> These tests are expected to be triggered as Xen boots (right after 
>>>> Xen has
>>>> initialised the GICv3 interface ie gicv3_init(). The aim of this 
>>>> test is to
>>>> check whether Xen can trigger SGIs after gicv3_init() is invoked. 
>>>> If so, we can
>>>> claim that gicv3_init() was done properly to be able to trigger SGIs. 
>>>
>>> To clarify, this only guarantees that the boot CPU can send SGIs to 
>>> self. 
>> Yes, this is the idea.
>>> Secondary CPUs are brought up later and will need their own setup to 
>>> enable SGIs.
>> Yes, we will have separate tests for them.
>>>
>>>> Likewise
>>>> we will have tests to check for priorities, SPIs, etc.
>>>>
>>>> A script will parse the logs and claim that Xen is able to trigger 
>>>> SGIs.
>>>>
>>>>   xen/arch/arm/Kconfig  |  8 ++++++++
>>>>   xen/arch/arm/gic-v3.c |  7 +++++++
>>>>   xen/arch/arm/gic.c    | 21 +++++++++++++++++++++
>>>>   3 files changed, 36 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>> index 950e4452c1..739f99eaa9 100644
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -73,6 +73,14 @@ config GICV3
>>>>         Driver for the ARM Generic Interrupt Controller v3.
>>>>         If unsure, use the default setting.
>>>>   +config GICV3_SELFTEST
>>>> +    bool "GICv3 driver self test"
>>>> +    default n
>>>> +    depends on GICV3
>>>> +    ---help---
>>>> +
>>>> +      Self tests to validate GICV3 driver.
>>>> +
>>>>   config HAS_ITS
>>>>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if 
>>>> UNSUPPORTED
>>>>           depends on GICV3 && !NEW_VGIC && !ARM_32
>>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>>> index 4e6c98bada..eb0c05231c 100644
>>>> --- a/xen/arch/arm/gic-v3.c
>>>> +++ b/xen/arch/arm/gic-v3.c
>>>> @@ -1818,6 +1818,13 @@ static int __init gicv3_init(void)
>>>>         gicv3_hyp_init();
>>>>   +#ifdef CONFIG_GICV3_SELFTEST
>>>> +    send_SGI_self(GIC_SGI_EVENT_CHECK);
>>>> +    send_SGI_self(GIC_SGI_DUMP_STATE);
>>>> +    send_SGI_self(GIC_SGI_CALL_FUNCTION);
>>>> +    send_SGI_self(GIC_SGI_MAX);
>>>> +#endif
>>>
>>> Looking a the code below, it seems like Xen will not be functional 
>>> after running the selftests? Is this intended? If so, we need to 
>>> stop Xen as soon as possible.
>>
>> Tbh, I didnot realize this with the current test. However you are 
>> correct that for some of these tests, Xen will not be usable. We can 
>> put a while(1) after it completes the tests.
>>
>> Or, I can invoke machine_halt() .
>
> I think it would be better to use machine_halt(). This would tell QEMU 
> to stop and hopefully we don't wait until it timeouts.
Ack. I agree.
>
>>
>> The important bit here is CONFIG_GICV3_SELFTEST cannot be enabled for 
>> normal usage of Xen. IOW, user should not expect Xen to run domains 
>> when this configuration is enabled.
>>
>> They are used to run baremetal tests.
>>
>>>
>>> Also, looking at start_xen(), we call local_irq_enable() a little 
>>> after gicv3_init() is called. So I am a little bit surprised this is 
>>> working?
>>
>> This is working i.e. we are getting interrupts. However, I can put 
>> the test after local_irq_enable() as Xen is expected to terminate 
>> after running the tests.
>
> I don't understand how this is working. Can you check whether the 
> interrupts are unmasked? If yes, it would be good to know who unmasked 
> them because it is not meant to be safe to enable them until the call 
> of local_irq_enable() in start_xen().

Yes, you are correct.

I put a while(1) after local_irq_enable() and then I could see the 
interrupts. Before that, we do not get the SGIs.

This means we should be doing this.

      local_irq_enable();
+
+    mdelay(1); /* to allow some time for interrupts to be received */
+    machine_halt();

I will think of something to avoid ifdef in common code. May be write a 
wrapper for local_irq_enable() which will invoke the GICv3 self tests.

- Ayan

>
> Cheers,
>

