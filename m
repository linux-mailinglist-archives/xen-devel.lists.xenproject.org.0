Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F32942159
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 22:13:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768061.1178805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYtCq-0008QH-Jx; Tue, 30 Jul 2024 20:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768061.1178805; Tue, 30 Jul 2024 20:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYtCq-0008OP-H5; Tue, 30 Jul 2024 20:12:24 +0000
Received: by outflank-mailman (input) for mailman id 768061;
 Tue, 30 Jul 2024 20:12:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2aj=O6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sYtCo-0008OJ-Ve
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 20:12:23 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05fb38c7-4eb0-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 22:12:20 +0200 (CEST)
Received: from SA9PR13CA0127.namprd13.prod.outlook.com (2603:10b6:806:27::12)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 20:12:15 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:27:cafe::54) by SA9PR13CA0127.outlook.office365.com
 (2603:10b6:806:27::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19 via Frontend
 Transport; Tue, 30 Jul 2024 20:12:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 30 Jul 2024 20:12:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 15:12:14 -0500
Received: from [172.28.183.80] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 30 Jul 2024 15:12:13 -0500
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
X-Inumbo-ID: 05fb38c7-4eb0-11ef-bc01-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R97Rpde0bUQylQbPiBJDWnNxXGjp9ul8tvSIG4xqKOyjJRyqT70ixG2/VVCbf0SJa9O/kORveiUDT0rOPQc3xAREZsfELOQfAiLTK71wz9plRpy72qxBv7v2lVjSFYCTQNU0qoM5rsYMvyin3ik3N6Xiy9CJkEJbBfkGMVpMGP/c75GwyKdQCMrA+udZyJe1xuE7b/Ep9xZuv7755mi3OuCcRj6605k7QQtvlQRJjRhBlRL8z0fHheVDmG0pCeW1SqUrtD1BVxA6537xMraqji6FKQg1LTqpMUcxUol/sHwxVEHc6n102bmyiL9ZVn3UDBzG/GcSSAi8ZOYAFygcag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fc33GMnABJISCtJcK0V6+XTh3zwvOnqOkgapOFYlwIo=;
 b=J02dY8lxHq0CiqDlX9V0wlhNqVpGb6+dyeXbEbZ5E4kZoE4joguzyua67FgtCLkzXWlWMCl7/ulw2SIp2s5XX+ht54X6zqQTYweajJZqjhee0qBEkmumBhm1W87a7D3OFSGYVrEplRhl/7UBk3ieJbi2YrI1S9j9wBsuhng+gzjpiF1IWD5G4qaRR4NFEsc1xU4BL6tozOqb268Bw8L4HFba9pzI/ww3liZ3nWz6TCYOabc7cmmJnJkuxG8QEpay6kixeiaU23c4dMujdS5gtBkA1wDFH4ktiWvsJkhe4S/ejl5eY/wj08G3dtVW8gB6c7ZRUgjNhuEFqbwRyfUlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc33GMnABJISCtJcK0V6+XTh3zwvOnqOkgapOFYlwIo=;
 b=ZTCWPth7p2e76QlDlkqCtpoyIu3CEHTMYWd3XGFTBzBlPmbdIXS/shAZVLxoaosE7xe9OOaq0tfg8vA56+506zbJZr/Hs3hrv4qm7LyN5SUwXBR7GqQVS6TaYVgwGI3PVZtyOiYN/2h2B9IusM0JvQrsZyIVyhaB5Aq9bi7lRS0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a3dd3ed1-ba8c-4776-b9b5-926e30651e5d@amd.com>
Date: Tue, 30 Jul 2024 16:12:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm: stack check instrumentation
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-4-stewart.hildebrand@amd.com>
 <d313f39a-f5aa-4611-975e-bc64759bbd01@xen.org>
 <23fe4756-4e5c-47f8-b9cc-101b7b8d116f@amd.com>
 <6a71cff1-feac-44cd-9233-9ed474e871e4@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <6a71cff1-feac-44cd-9233-9ed474e871e4@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|CH3PR12MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 772767dc-d73d-4ebc-8f21-08dcb0d3e78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGM5OEJsZldQWVd4ZGg1OVkxZDJaQS9WeDFJdGUveHAxbnd5ZGYxY0M5QzRP?=
 =?utf-8?B?Ui9hZGdtQm1zNkNQQkdoS1VybEZFbHN0Zm1MY3F4WTc5L2d1VjdmMUwxR2p3?=
 =?utf-8?B?U0NPVVE1bHJtQUwwaGFiaHg4YXQwZ2crWWtzaXNRUTJUeldDb1ZVWmJsLytM?=
 =?utf-8?B?U0U4SlFNRnhjb25veDdpUUhBVzhGZTE1MkZkdE9pT0VwWTdqOUpEV0RMc3NW?=
 =?utf-8?B?MnRVN3dLTWNsYWNRSnFyOHd3b1JEOUFjNERwVm4rRUVoYWJiTE00ditFdERz?=
 =?utf-8?B?aGg5dXBvbGhQS2hiTUpEL3VCbXJTUGhXVEZaR0FyTVhDanE2RnN1OU9TTGR0?=
 =?utf-8?B?dW1HUWVVcDZkSFZUUm82eUpvci9XNVRDRHdKTmF1QnZOMHZ6TFpuN3dhNUpW?=
 =?utf-8?B?SmZITEppSEI0TTZNb0l3WS9jVndxSTBhYmY4Tkdva3lueU50blJlVUNIemow?=
 =?utf-8?B?RG5mMlBGWkd3NE1mZDFubmFVeWhnMnlXcG95a2tOT29Nd0dGbTFmNmdhTHRt?=
 =?utf-8?B?VVBIVTI5RGNROVJrWG9oTkVSYWlzcVRVQy81eDhkNzZDWUxEM0U0WjdnKzlt?=
 =?utf-8?B?TzNwWGRYWjlPSVM2elJDUm1nOTUzVENHc2lrRm9FaDRSajRsaHMwS09ObEc2?=
 =?utf-8?B?YXB2S1pXUjhtbkVsa0JvUTZvaW0za0V3OG85MUxQbkIzdHAxQWpxY3g3L2dY?=
 =?utf-8?B?T3pmaXBXSUhJdFNoc0t4UmtuWEFBMW9meEdUNXo2VGZMejdaUEJQeWZCbytB?=
 =?utf-8?B?emJUTmVCRU4xRFhCSm81ZGZxUmhZL0FWWjlaVGs1R0xCdDFXQ3kyT0xCRDYy?=
 =?utf-8?B?cHE4WXdwbFYxem5yOHUyUnNrNXAzMG9iUEhaNW9hdHljWklRRUM5SzErQWNC?=
 =?utf-8?B?OFZ5VlhhanhGWHJmblV0RW5rZGFvY1piV242VDJieEdOY1ZsRkRjTGQ3WW1V?=
 =?utf-8?B?SnV0TEovS2R5SVZyQjk1aDZKc3RUWlN6QlJndk9ldng5Z0lSbzRUSHpTQTAy?=
 =?utf-8?B?UzJFVno0K3hOYnY2SndsVUszeHFlYlpsWHJqQkozUVM3ZGhzM2lWQ3Bobk9T?=
 =?utf-8?B?OGlhL3V1SVN6aTV3aE13cWJGNWNZU1VkTXg3NnM3VUN4alpYc05DSFRHbjFB?=
 =?utf-8?B?c1B1NmdLT3hldVJYNVNHUjV5aWVrSEZnRmd5bCtiOUZHTld5K2FXQXhLa1BX?=
 =?utf-8?B?SVlBWFdTWmRkcFl5MGFsb1BONHdxVDVQL3RuN3JnWkhlejFGWmQ3eWRrcm9v?=
 =?utf-8?B?T1lyVGRNNjNOYlJVQmxnNjgwWUFEYWwzSUQ2c1oyRXIwTm5YS0dOVjNqVmlC?=
 =?utf-8?B?ck12SUd3M1BxRXhFdkdwcTRpRmFSZDl4bVBDSE1pZUdlREszT2kxMzV6c0x2?=
 =?utf-8?B?RHRQUit6QjBNc2J6Y3lSOXpiQkdQd3RZNjJDdEZuaXlKbVVkamVGM2hRVktt?=
 =?utf-8?B?TXhzeWxiSEZvMmJGNWFkN0FSRTA2b0laaXdiYU96UVdxeHlhR3E3VmR0UFJp?=
 =?utf-8?B?aHVvUDVMZzQ1TklDdXRsS3JMTTE5WXhnek0vOFFVZlQ1eVVSeXB0VVB6cjNG?=
 =?utf-8?B?NmduT29HN0ZwdXdGeGh0Y1hGbzJIOXVqcGw3MlBKVi9JN0lHZ1NMZGFvRnQ2?=
 =?utf-8?B?M1g1eThpVDVhNVpjSUgyaWMzRWRMbmx2TmlpVVgrakhtWVdKbUZDTnAvL1RF?=
 =?utf-8?B?UVJTTk43SFVWMnBWS215VHVadFJkRHdnckQvZnF4bXkySjJZcDBFcTNqdFhi?=
 =?utf-8?B?NFBLMVhDaHB0aThNZk1qcWRrK3dKeHJpdjJpTTNxY1JzWEFIemtFcE40Umh3?=
 =?utf-8?B?R3liU1BQOWJleWJ4ODYvQ2VSWjlIQUpZaHFqdWpleTBaL2MyRzhyaXFvaENi?=
 =?utf-8?B?bmlUSmFkekVyT0pBQ3hpWHQ5cHBJUGdLRE55TnA5ZGxFS2JaeHJQV1lTY1NE?=
 =?utf-8?Q?F7UmENZTvXRhdQqiKDCzbUIrfOR0m1eI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 20:12:14.8323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 772767dc-d73d-4ebc-8f21-08dcb0d3e78c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572

On 7/30/24 14:07, Julien Grall wrote:
> Hi,
> 
> On 30/07/2024 18:50, Stewart Hildebrand wrote:
>> On 7/29/24 14:36, Julien Grall wrote:
>>> Hi Stewart,
>>>
>>> On 29/07/2024 15:24, Stewart Hildebrand wrote:
>>>> +DEFINE_PER_CPU(unsigned int, stack_check_nesting);
>>>> +DEFINE_PER_CPU(unsigned char *, stack_base);
>>>
>>> I think this could be "const unsigned char *" as the stack should not be modified directly.
>>
>> Every time there's a vcpu context switch we will have a new stack.
> 
> I am not sure I follow. "const unsigned char *" should still allow you to update stack_base. It will just prevent anyone to try to write to modify the stack via stack_base.

Ah, of course. You're right. I'll change it to "const unsigned char *".

> 
>>
>>>
>>>> +
>>>> +void __attribute__((no_instrument_function)) stack_set(unsigned char *base)
>>>> +{
>>>> +    this_cpu(stack_base) = base;
>>>> +}
>>>> +
>>>> +void __init __attribute__((no_instrument_function)) stack_check_init(void)
>>>> +{
>>>> +    this_cpu(stack_check_nesting) = 0;
>>>> +    stack_set(init_data.stack);
>>>> +}
>>>> +
>>>> +__attribute__((no_instrument_function))
>>>> +void __cyg_profile_func_enter(void *this_fn, void *call_site)
>>>> +{
>>>> +    unsigned char *sp;
>>>> +
>>>> +    if ( get_per_cpu_offset() == INVALID_PER_CPU_OFFSET )
>>>> +        return;
>>>> +
>>>> +    asm volatile ("mov %0, sp" : "=r" (sp) );
>>>> +
>>>> +    if ( sp < this_cpu(stack_base) ||
>>>> +         sp > (this_cpu(stack_base) + STACK_SIZE) )
>>>
>>> The top of the stack is used to store struct cpu_info. So you want to substract its size (see arch_vcpu_create()).
>>
>> Will do.
>>
>>>
>>>> +    {
>>>> +        if ( this_cpu(stack_check_nesting) )
>>>> +            return;
>>>> +
>>>> +        this_cpu(stack_check_nesting)++;
>>>
>>> Looking at the use, it only seems to be used as "print/panic once". So maybe use a bool to avoid any overflow.
>>
>> It will only ever be incremented once. I'll still change it to a bool,
>> this should make it more obvious.
>>
>>>
>>>> +        printk("CPU %d stack pointer out of bounds (sp %#lx, stack base %#lx)\n",
>>>> +               smp_processor_id(), (uintptr_t)sp,
>>>> +               (uintptr_t)this_cpu(stack_base));
>>>> +        BUG();
>>>
>>> I would consider to call panic().
>>
>> panic() alone doesn't show the stack trace / call trace.
> 
> Ah good point. But TBH, I have never really understood why panic() didn't return a call stack. There are a few places where I found beneficial when debugging.
> 
> Anyway, I guess this could be handled separately.
> 
>>
>>> But is it safe to call any of this if we blew the stack?
>>
>> Nope, it sure isn't!
>>
>>> IOW, should we have a buffer?
>>
>> Yes. After some experimentation, I found that this printk and a WARN
>> (similar to BUG, but resumes execution and allows me to collect these
>> metrics) uses approximately 1632 bytes of stack. Assuming BUG uses a
>> similar amount of stack as WARN, and adding in a comfortable margin for
>> error, I'll add a 4096 byte buffer (i.e. invoke the print/BUG with 4096
>> bytes remaining on the stack).
> 
> AFAICT, the stack on Arm is 32KB. So we 1/8 of the stack as a buffer. Do you know the current stack use in a normal setup (e.g. boot a guest)?

In my particular test case simply booting a dom0, it uses about 14k of
stack. Of course this could vary with booting dom0less domUs, complexity
of device tree parsing, etc.

> 
> Anyway, so long the feature is not enabled in production, then it might be ok to steal 4KB. We could increase the stack if we see any issue.
> 
> Cheers,
> 


