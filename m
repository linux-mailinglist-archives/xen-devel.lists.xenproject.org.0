Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D42B9251C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 18:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127865.1468415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0jpK-0005Wd-Ot; Mon, 22 Sep 2025 16:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127865.1468415; Mon, 22 Sep 2025 16:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0jpK-0005Uu-Lp; Mon, 22 Sep 2025 16:55:46 +0000
Received: by outflank-mailman (input) for mailman id 1127865;
 Mon, 22 Sep 2025 16:55:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vq0y=4B=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1v0jpI-0005Uo-Vt
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 16:55:44 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7eb22f0-97d4-11f0-9809-7dc792cee155;
 Mon, 22 Sep 2025 18:55:42 +0200 (CEST)
Received: from SJ0PR13CA0212.namprd13.prod.outlook.com (2603:10b6:a03:2c1::7)
 by IA0PR12MB8748.namprd12.prod.outlook.com (2603:10b6:208:482::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 22 Sep
 2025 16:55:36 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::2f) by SJ0PR13CA0212.outlook.office365.com
 (2603:10b6:a03:2c1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 16:55:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 16:55:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 22 Sep
 2025 09:55:35 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 22 Sep
 2025 11:55:35 -0500
Received: from [10.71.195.192] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 22 Sep 2025 09:55:33 -0700
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
X-Inumbo-ID: f7eb22f0-97d4-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AONnWHxOaGCryV3CkYDXCKXjRiqerQvkqDFdBzF4YjrCSpd3A1XvmPZOsTDbWB4A7X4oM8q4YdTiOUl/Qy5QaoLbafyDoA8NDjZkcG72bFxcu6GnSXuUqA7xQYUjEoHyrMgOOnq/uerUcR4MZAgXXxS54N8lsz+DggTx6sm3ye6biCc53eq1G+oA2309OX7iBXo9eHYkJ/C8Tgs/lSdr7V5ylCtG299I8ijC8Yljz5sUF4QQ/SxDo/D4mKlgjWODoNftGZOiFDbpkR5xize+mM00ebQaO9g2/dQ6VVHjGnLNE0sW5mekCpDsJ91TYLJz56OE8wtaB3vWhpRMGdI2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+HtFtnHizkVwm3iHtIBny6Q4Lf+QYAEmQX1AOlj1jE=;
 b=hmo1Q3Ax+s0vrQLLTUxc2BDJ/1byBSiejORl9O3JVLpiYlVSGjFKjEaNJsgzuwC9JaAcDaOWJLlsw0+IM+0N/DPEW+z/itNV2ze4jM4olnZsG2M7v4szQ6CesHoAV2JQZZ8CzAMZtrL0nK+1S4jtQ0gJyFelpkqa+1srqt4L/Etb5j0N2gDvwFqiBBXMctFT3rcoEh/ufUql2KMZRCxn+U7LynVhb8Cv4FMx59jF3VTrHz7fZHl7uNom5yatB/WIQzlMBlmPU38ROLWDaYusAomX5+g9BWfu1V+d9jrATF0ODNCrphBurlHLAE+itN+tE/Hry2B2xD/NKp9InKC+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+HtFtnHizkVwm3iHtIBny6Q4Lf+QYAEmQX1AOlj1jE=;
 b=B4DFnWJmSs9nYrCH8WDAufdhD6Iudi6BZ1a47R7/7uRBkTBpJLxLLtit7s7QBft2RvQfOAbO0cdMWt1CThmv/7Xh2xBRXjn8BjDZnJeis7TvqFHefX6w64UWmz7VLAN9XfUQ5DUIoAOMY1nNCCqxclgbiY4ypBV2nLzBnEhU0So=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <762b9d19-f1dd-4bfe-a298-d88ab8e7bbd2@amd.com>
Date: Mon, 22 Sep 2025 17:55:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Introduce GICV3 Self Tests
Content-Language: en-GB
To: Grygorii Strashko <grygorii_strashko@epam.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250912170055.3077923-1-ayan.kumar.halder@amd.com>
 <bd0d3670-51c7-4c60-9b45-201f00a14b8e@epam.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <bd0d3670-51c7-4c60-9b45-201f00a14b8e@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|IA0PR12MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: c281d26a-34b8-4349-583b-08ddf9f8da0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXdLV05ZUE56ZkY0bzlqdFZnWTgrdEo0WWhPb0xQM1BGbk5DZGthM0xaMlFQ?=
 =?utf-8?B?MHMxbWxDZjlBSWpRcGVLVjlKSGNibU5JUWJDTmhSVTBNMFhYK2txVThxY3hG?=
 =?utf-8?B?NzZBbVdPSFRtWDBFdDF6bEJTT3NMWHBoOWowbE1hOXA1SFQvT2o1UHRrSG4x?=
 =?utf-8?B?MHlYTjR1eTVzMXFKOEdUT0h4LytxRmFOZFI1TFhVMDc2R1I0NDVTVVRySita?=
 =?utf-8?B?Q3RpOS9sVldvM2JTajJ5TFBSdTVJZmt2R3dNemVpUDJ4UmNSYktTcnpKTDVR?=
 =?utf-8?B?OW1tcHF5eHZPeWcxamJOazBETWJjTlliRlpyWWNvVnd3cmhTM3VkWE9WazNs?=
 =?utf-8?B?Vytucm5UVG9zSm5XZFplOHJoNGxVMHRKdkhJZDBxKzFMM1E4T3NiWC80MlJr?=
 =?utf-8?B?MkJOcXJHbWhwOEdINnZGL0NkbzJsNENVbzhxUUtsSURKNTFHaEplbkpIUHNN?=
 =?utf-8?B?SFZFU1VTWS8xbWxiWHd2MHZLcTlIdWFIbTZTam5DSHlQOEhqaHN4cnp6K1c4?=
 =?utf-8?B?RDIyUkhPYU9XM0xHUXlrWDU2dEtMYlJocktyNFZJanMxZVZFcFRha1ltTGg3?=
 =?utf-8?B?bEJlTEl4SW5KYll2aHZmeVJzcGtLb1BnZ2IvRS9lcXJhdzRLL2w4QStaSXov?=
 =?utf-8?B?UTlVa0xhblpqVVdyVWxTbWtpWGMxb2tCYmFOZ0V4WHQ4RWlabEdML0cvcWF2?=
 =?utf-8?B?bUlLYWlsNWJzalM3Wk1UYzlUTWFxYlkwVnlyalVMT3hxVU9Oa2p3ZDJCWFZa?=
 =?utf-8?B?a01KZ1BGV0JkakMzRHJlMG5sNVFucFZhbG9EWG5ySE50ekZmMHFjcXBOanMy?=
 =?utf-8?B?TGIrNk1VYmVScTZ2cXNtZlNnZXJiNy8ybHg1TTg4UGZndVFxWUg3VkNEUTRG?=
 =?utf-8?B?cDZuK3FnWDJiODdoMkxFbU5qMGlkTytwTnYzc0Y0MGpTTkFaVHNSVlNMek5j?=
 =?utf-8?B?UEVxSWl1Zm10OFFUQVM2Y3lJMFBYWmtLTUt2clhUYjhzSXhucWF1NkoxZEw5?=
 =?utf-8?B?dlhkaW1CY3RRT3JiWWRCMUQxczZ5blYrOXNCZnM1cit0OTlsQkMrZFNuZm04?=
 =?utf-8?B?Z0NuK3EwUytuTHFQQkhuK1Nod2hKNVRkZWJJSmdzQ25MT2Z4MUlpVWc5ME1P?=
 =?utf-8?B?eG5HRHpHb1kwN1haUkZ2cHByTGpWUjdML2NFUTkrUFhxeGJXOWhHcU5xc2lM?=
 =?utf-8?B?TmtjZmJIWVhWbEc0Y1hUZ2VJNjh4MkVBOVNUMnBMYkx1OERTMk53dHZMdGl5?=
 =?utf-8?B?NHRGdHVremE3N1pZL0FhVnhrNkNnNFpEd0cyZWdFV3VsWUNqRUE2WWZWc0Z5?=
 =?utf-8?B?aTFPemFmOTFqY2JkTHBBdmdwc0F3VUFTK3hadXhmckxxZVVRdmFBeWVBZFll?=
 =?utf-8?B?MFQySnRYcXU4V0pPdFgvNFE0TmpUWkZJU21sZkNFbk5LM1VhZ3RuYXFmc2do?=
 =?utf-8?B?Zll0ekg1dWpTS3h6VHdaN0VUWExoZGhUUitwT3F5V0NsaGN0MWRnUFZ4WEdH?=
 =?utf-8?B?TnNmZTlpQzJNNklHVjJRUFFtb3BNb2RxeTQyY21wcGRWMU5uMDBUNU9HNmQ4?=
 =?utf-8?B?aWJRRkk0QmVqenh5QXZtR2RWY1JpYnBpdG5NQUJSVjdVazJkc1ZDdzJ3Qzk5?=
 =?utf-8?B?RHBrcExEMXRPcktqb0FUWlhCdFdRNVBMM1k3a2Q4RWFvcVI5KzJkN0Q5bFRE?=
 =?utf-8?B?V2NTdndaai9LZEZTci9oTHAxQkRPdngwL3JqaGVwL1pPKzBITXdyVVZ0cWJv?=
 =?utf-8?B?WWVQcGZZbFNJc2MrN1NObjlvM1l0ZXJPY2JIY1JqejlvSEY5VXZ0UTBVODdB?=
 =?utf-8?B?UDBOUlJQTkFDemNsUnAyNG1oK1J0bVpwdWZTd1E5ZnV1QmI3aWRKQ1AwZUZB?=
 =?utf-8?B?VXhoMCtkOHBiU2s2aWJlcGFZRjlNZis5WlZ0Z0FXZzY4ZVkrUTYzN3I0WXRu?=
 =?utf-8?B?RFlSajJlMmtiMG5keTk1TkpnM1Q4MnB6UGU3akZ6MHF4Y0tpQzlYSXgzUE5Z?=
 =?utf-8?B?M1hmTHk4b3FHbVVmQld4Z2NCTEsydTR3cFdkUXNHcGptdUtxVjFkTVFkUk5H?=
 =?utf-8?Q?y/e7Gr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 16:55:36.0453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c281d26a-34b8-4349-583b-08ddf9f8da0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8748


On 16/09/2025 11:55, Grygorii Strashko wrote:
> Hi Ayan,
Hi Grygorii,
>
> On 12.09.25 20:00, Ayan Kumar Halder wrote:
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
>> +
>
> I'd like to ask, if possible, to minimize mixing selftest and 
> functional code.
> Like add gic-v3-selftest.c.

I can try that. However, the self test needs to be invoked from 
functional code.

Also, your suggestion gave me an idea. I can do :-

+static bool __initdata opt_gicv3_selftest = false;
+
+#ifdef CONFIG_GICV3_SELFTEST
+opt_gicv3_selftest = true;
+#endif

>
>>   out:
>>       spin_unlock(&gicv3.lock);
>>   diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>> index d922ea67aa..5cb58cdb92 100644
>> --- a/xen/arch/arm/gic.c
>> +++ b/xen/arch/arm/gic.c
>> @@ -346,6 +346,26 @@ static void do_sgi(struct cpu_user_regs *regs, 
>> enum gic_sgi sgi)
>>        */
>>       smp_rmb();
>>   +#ifdef CONFIG_GICV3_SELFTEST
>
> if (gic_selftest_run)
And then instead of ifdef, I can enclose the below under "if 
(gicv3_selftest)" .
>
>> +    switch (sgi)
>> +    {
>> +    case GIC_SGI_EVENT_CHECK:
>> +        printk("GIC_SGI_EVENT_CHECK received\n");
>> +        break;
>> +    case GIC_SGI_DUMP_STATE:
>> +        printk("GIC_SGI_DUMP_STATE received\n");
>> +        break;
>> +    case GIC_SGI_CALL_FUNCTION:
>> +        printk("GIC_SGI_CALL_FUNCTION received\n");
>> +        break;
>> +    case GIC_SGI_MAX:
>> +        printk("GIC_SGI_MAX received\n");
>
>        gic_selftest_done = true;
>
>> +        break;
>> +    default:
>> +        panic("Unknown SGI triggered\n");
>> +        break;
>> +    }
>
> Potentially GIC selftest code can be guarded by some 
> "gic_selftest_run/done" vars
> if xen boot is expected to proceed further after testing.

Ah no, Xen will terminate after running the self test.

- Ayan


