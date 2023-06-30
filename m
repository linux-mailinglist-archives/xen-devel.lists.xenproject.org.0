Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D1B74384D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 11:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557397.870709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFAOV-0000De-09; Fri, 30 Jun 2023 09:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557397.870709; Fri, 30 Jun 2023 09:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFAOU-0000Br-Tb; Fri, 30 Jun 2023 09:26:22 +0000
Received: by outflank-mailman (input) for mailman id 557397;
 Fri, 30 Jun 2023 09:26:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9zhT=CS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qFAOT-0000Bj-6j
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 09:26:21 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2abf28a4-1728-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 11:26:18 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH3PR12MB8728.namprd12.prod.outlook.com (2603:10b6:610:171::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 09:26:14 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 09:26:14 +0000
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
X-Inumbo-ID: 2abf28a4-1728-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLJV1xpKJ337i/YY72EFDjKJcnhep6z4LEIxJH2lIEDPYtxata32QsmLt6xlz/U+yvRMqsdu/3rtmdx8Po8wj1mj0zvLmSgVebcKOt3fusVumIqWgqLmmGO3JvdpFDg87l3kkF0DTD0NJ6uLNg+AN7wu6g9/aDMsnF8XIsjjE2cCgQlSGwCZ8Y+3fEXWft6UIi5Xz2m1N91AbJ/AL5Www5qYIzewCeoR5E6ImL80MYDFoKKsaTgdvl1OXzNlyoXJSo2tDs81YzilLNCwNdtDOoQQI4QZSljVuQCyc9Z5ox2x9v9mr2FS4NGNSr58KedWpedatj1sN+EY3iDGRc3TZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++18t5IrWfF6PP2c7FUZG6roHKCyELeko2HsbSaV2ts=;
 b=Df7wXB8euYdUnjVhIn1NaeRg99QgFNXLKk0H/HtZAGqxU9BVh/vSoYcvygD6E7mxPVtwF6OjAzGgtRgwJFxEDfGUjIhknqNVohiaZnVK+1B4g7LEc7aPhM3/7hMZgzUcbwNn8Xdn67cplAXUALV8ZJLCCevX04+/QiuDkUERQ2FbK5Si57fAF6KzisBbtxaJvBXDZan815cSW/tv1ddbdvPzCH99xeYKFzGvslV6p8lVDpKReI0grTHU9vnK+htgF35TVKYEv4loYjzeaW6M6dtxLEHjyPPJq7d7p9F02dChNcyNRbJ+3r2JfqTqod876QsdQMACpmBojnNHLOvmTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++18t5IrWfF6PP2c7FUZG6roHKCyELeko2HsbSaV2ts=;
 b=oH+MaZanSbbS35f/CJfmTt2hX60LIN8uyIhPKRZ4G6wniLrsLznZBIkhA9cX72y0srO8RtsJWMgx96vVgxWcmeWLB4lW25ePMob5qghGKZiX/5cyOIvmKykxvAMwXmXtlQF2Uvr3LGSn6JXcfJWlX95KGrVQbqNJXjH/obCiEl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5ae6e98a-2bfe-b48d-0dae-96ae1d76f79e@amd.com>
Date: Fri, 30 Jun 2023 10:26:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 24/52] xen/mpu: build up start-of-day Xen MPU memory
 region map
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-25-Penny.Zheng@arm.com>
 <778688ab-8fd4-2b06-e644-b5a013bb56f7@amd.com>
 <39a5a729-0099-67e4-bf4a-c65ae99a4619@xen.org>
 <37e2856b-038e-6a3a-a6ff-c518dfeda552@amd.com>
 <f849b3cc-f9c1-131a-f6c1-5be27911ec6e@xen.org>
 <301e2e02-f2ab-5538-d426-52a02a7f35b5@amd.com>
 <6a06868f-beea-13c3-5d18-23930c7dd971@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <6a06868f-beea-13c3-5d18-23930c7dd971@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::21) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH3PR12MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eeeabad-16cd-433d-01bb-08db794c0c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TnuHGt/NcfNTbpY9LEM2/9I5KIjolcdqPmpwcONC/9Q0fdeqScNPb68ya3X0cjXvmjqm/xaBw6javhjyD5u1eJyIdtPDP2nRZQZh6CtSlLFmqad2tm801dRSEmIXOWLfWZwyatjGZ2GrpXvDaAogjxu9xQVgqMbctHRdEpxbCvoa9ZF7VnSy5FWCHuDOL7qfE8XBCi0Rxb9PFGZepSmE6hpRsm7RP4ZD9bD0tYBDH3XdaWFSRYah+MYLpd7PUFayxWX5ZpDXIeXGtUSJvbkjwnZCEiTtI6lRuU0pMG41ZS368SNLFUPihiSc4Y69v7inxgsdNkxjm6guYJ+0eIRAzXTPOEVXQK5bqbEz6rga/SKmcWEGcH8h/M7QjtrGE7W83Xw4TaaMu50Xyz9UCCfy+7oAbwWQrSBPCVwljKAvNRwq2L6k5n8N51HH8T8QAmgssF46Ean25sa57qGjm8dIRUfI7MNXh2WPmpsyZ9zz8Ia1q+Uvz58eZFwn//pu8E+WOSCfRVWGWRrKjyRzaonO8e8Vdfej7lO3mv5z8DTCzN4Y2gSFpxkUeI+HmgMY9ATrWpDFv1Poe6VwrZkofAUm21749bSXZqpgsLyUrVpAJuJdHm6b5lV/W/PZMwMp7YipdGJbfuLXU/YjHIgiy2DwOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199021)(83380400001)(2616005)(2906002)(38100700002)(36756003)(8936002)(8676002)(110136005)(5660300002)(31686004)(54906003)(6512007)(41300700001)(66946007)(66556008)(66476007)(4326008)(6666004)(316002)(6486002)(478600001)(186003)(31696002)(53546011)(6506007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkRlQXZybnc3bnU4RHc2U2ZGM2dOa0oxajNQeG10N2VDVWk1YlIyN2prYSt0?=
 =?utf-8?B?SVd4NWpwRzZFcFhJZHRlQk1IVWxpM0lGY3ZGeW5hNEN2Njdmby92SXZpdzF4?=
 =?utf-8?B?UFdvYzBmeXhYL21ubGp5U3RROWZnODZrU2w5SnRPZGtDQVlqUk4wQkIxM2RJ?=
 =?utf-8?B?ZmlGZXVoR3VVbHYzblBTUTArUkx3djdQNDV2TGdZZFI3K2dqdHd6MzJ3TmJs?=
 =?utf-8?B?OHNiTldpdEtiTStqZWxlSEJUQlV0SWpENmh1V3pReVRHQURxSkNEQTlFcWRh?=
 =?utf-8?B?ZVZnNlNwZEZCWVpPVkE3eEtuTkRYbDNIQkV0bkNYY0g2NE5LKzVmSGhsbCsz?=
 =?utf-8?B?UVhkbEJ5RUUrOGZDL0FkbzFvR3FPd2FFRkk5R2UxUk1UMzBTVlNkZC9ocHpk?=
 =?utf-8?B?Q3FXTXdnSFErdlNTZ1djZDg5YzhyQWtWNHpjbFkxSVQ4Z2paNGVta28rOWN0?=
 =?utf-8?B?TTVwT3lPbkZXRDFpdXZkRXY5WHJ0YzhuMEpmRUlrdmFla2d6QzNMZ1llMlh0?=
 =?utf-8?B?Y2lsck1sM1FJWkUyTWlTaytSYlVmRUdLTXlkY2pqWXlXQnNjWHluV1BQRTdO?=
 =?utf-8?B?cVUvSXRwb3JQaHYzekNLRXRyVmlYU0JRMXBlUWpYK2VjQWI3YURTRHB1ZGFs?=
 =?utf-8?B?dDlndnlBTzVCdm1PMnlrcURRMWtJbHgyNFl5djB3VjAyUmhCU2IxRXhGTC9Y?=
 =?utf-8?B?bVRiRmZnRlI1aDd4b01OS3NDZityM2syUUpNSXR1K1YzaVpjUHh5d2VqdVZF?=
 =?utf-8?B?T0hSeTRhOGgvd0d3MnFtNDVnWFQvb2Q3YyswUGZJTVk1UEJlZ0NVK2dhTmdN?=
 =?utf-8?B?N3BLTTVSYUJ2L2FWeE5CQVdudmg3UUVWTWs3OTI1UDlrNkRJYjIrOURja0FZ?=
 =?utf-8?B?SmxiSjdNdXlBS1hkcUxtQ2praHZUVUQ4TXd6a2JRMkkrVktqVjlYQlFoVFRY?=
 =?utf-8?B?amM5RnFNQzJiWUI3RWIrWDFSa2R2T0FkSzhnNkNqOWxxMmVodTIzUTlBczZn?=
 =?utf-8?B?RVBVckU3SU12OERGb1lPSDV5KzRWZzFIWjNmV3Y4ZS9uK2NQQXVLTmV1Y05D?=
 =?utf-8?B?ME1DTFVjU3RKZDBMTFdIUk9BcHlBeHh3b2VlRVZWM28vU3lIMUh5MDIyNjNx?=
 =?utf-8?B?OUhNOXZhU0xub3ZKMG4wNEFQYTZIZDUyUVFRV1FkQ2ZQeFNEOCtrODFEWWhO?=
 =?utf-8?B?RC9qa3lxN2VWZDgxdWJaZVJrbVB0WXBTL1Z0cEhvWW12UkVRMi9OUmZBREE2?=
 =?utf-8?B?NnJxejEzcGw3ZGZweEY4NkJ1M1FWSCtCV3ZCeFBTWkJqdVNKSmZDQUxGTFVD?=
 =?utf-8?B?c1V2WnhnQzRSTzNkRG0vN3Z4cEU5T0FTRTZGRFNjMWQ5c3NUdm9leFZFbmF0?=
 =?utf-8?B?Q3FlL1FDTmVLL0d4VUVGSjh0ZWFjTG9XZVd6a21HVGh5RE5CU0g0QXpISXNw?=
 =?utf-8?B?R0NiS2dPUDMwQ3RHdGZTb2hFeVRjYm5vRDdhaVZycU9ZVVdnSThlQzFhYlps?=
 =?utf-8?B?bGxmS0V4eFc1QXgyVlJvRXJKT0lUbjhKR2JnNjNHd2FaRVlmemtEQU00YVVj?=
 =?utf-8?B?bUdhSzJMMDhhb1VNU0RGaC9OVS80cDlQWkZ2Z05CS0diV0t6UmgveUtRUEpG?=
 =?utf-8?B?ampDSmFEb24ySTRIQXJDRS9NYUttZVpQcExTNmNoYzVIODlCNXBGcHZZVmYy?=
 =?utf-8?B?ODQ4U0I0RGs5RnI5T1NkUXh3bTFtb0doeklDZVExY0hkSFBUTzMyd3k1S1d2?=
 =?utf-8?B?Q3NRSit0TU03bDlnQytyVVJDMlRoRWUwYUVHNllHWUtzM21EeFlmTFIyNmYw?=
 =?utf-8?B?b1lHdjh4ZUYxcDhOM05IWjlDaTRiazNUTTFmektCNHVIRmF5ZEJFaStZRDJ4?=
 =?utf-8?B?MWhiTFo2dzd0K3A4NExCRHI3VzlUSzcrL2lEejhiSlpHeHVrRURxYlRlL0tN?=
 =?utf-8?B?RkdWeG9pc0kwSmN2VXpVSlBja3dwQ1ZGSTFtby90RDhxcFFGZlU4NXlseFZS?=
 =?utf-8?B?YnVlYXd3MmZvbHZjUE1DVUc5WHNOMGVnRDN4Y09kamJ5TzU2VXJRNHl4dVMz?=
 =?utf-8?B?dnFwa3pyZGo4c2tqdmlNdFpBWmdZb1hzRjlRVUpxM2U5emI1UThadnV1dUJa?=
 =?utf-8?Q?4s8Jq0u4rJM9O3dLrPt9YL2t7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eeeabad-16cd-433d-01bb-08db794c0c90
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 09:26:14.0618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yesxYZYpedCJFAUb8nHo3h1kbFzn0aBVb2hCfjojqAC1PuWXnrw7pXhi/X0Toi5NP/gvIO7jYhNAZKFwYnWlZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8728


On 29/06/2023 12:55, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 29/06/2023 12:21, Ayan Kumar Halder wrote:
>>
>> On 28/06/2023 14:42, Julien Grall wrote:
>>> What's the guarantee that the compiler will not generate any 
>>> instructions that could generate an alignment fault?
>>
>> I thought by writing in assembly, we tell the compiler what 
>> instructions to generate. For eg
>>
>> ENTRY(set_boot_mpumap)
>>      push {r4}
>>      mov   r2, #0               /* table index */
>> 1:  ldr   r3, [r1], #4         /* r3: prbar */
>>      ldr   r4, [r1], #12        /* r4: prlar */
>>      write_pr r2, r3, r4
>>      add   r2, r2, #1           /* table index ++ */
>>      cmp   r2, r0
>>      blt  1b
>>      pop {r4}
>>      ret
>> ENDPROC(set_boot_mpumap)
>>
>> I ask the compiler to use ldr (and not ldrb) instructions.
>>
>> May be I am missing something very obvious here.
>
> The problem is not the assembly code. The problem is the C code. You 
> wrote:
>
>     /*
>      * Since it is the MPU protection region which holds the XEN 
> kernel that
>      * needs updating.
>      * The whole MPU system must be disabled for the update.
>      */
>     disable_mpu();
>
>     /*
>      * Set new MPU memory region configuration.
>      * To avoid the mismatch between nr_xen_mpumap and nr_xen_mpumap
>      * after the relocation of some MPU regions later, here
>      * next_xen_mpumap_index is used.
>      * To avoid unexpected unaligment access fault during MPU disabled,
>      * set_boot_mpumap shall be written in assembly code.
>      */
>     set_boot_mpumap(next_xen_mpumap_index, (pr_t *)boot_mpumap);
>
>     enable_mpu();
>
> You can't guarantee what assembly instructions the compiler will use 
> for any of this code. So if you are concerned about unaligned access 
> when the MPU is disabled, then you should never return to C (even 
> temporarily) while the MPU is off.
yes, agreed.
>
>>>
>>> Furthermore, from my understanding, at least on Armv8-A, there are 
>>> caching problem because you will need to save some registers (for 
>>> the call to set_boot_mpumap()) on the stack with cache disabled. 
>>> This means the cache will be bypassed. But you may then restore the 
>>> registers with the cache enabled (the compiler could decide that it 
>>> is not necessary to read the stack before hand). So you could read 
>>> the wrong data if there is a stale cacheline.
>>
>> Yes, this makes some sense. So will the following make it correct :-
>
> I am confused. In a previous answer, I voiced my concerned with trying 
> to replace the full MPU table. So it is not clear to me why you are 
> asking me if the following work. Do you still want to do it? If so, why?

I completely agree with you to set up the MPU table in assembly with the 
correct permissions for each section (as done by Penny's patch). That 
would atleast ensure that we don't need to reset the MPU sections for 
Xen again.

What I was trying to understand deeper was some of the objections you 
had raised and if any sort of mitigations are possible.

Again I am not saying that we need to apply the mitigations (if 
available) in this particular scenario.

>
>>
>> 1. Execute 'dmb' before invoking enable_mpu(). This will ensure that 
>> the registers are strictly restored in set_boot_mpumap() before the 
>> HSCTLR is read.
>
> I am afraid I don't know how the DMB will enforce that. Can you clarify?

pop {r4}  /* As part of set_boot_mpumap() */

dmb /* This should ensure that r4 is fully restored from the stack 
before the next instruction. At this point, the D cache is still 
disabled. */

>
>>
>> We do have 'dsb sy' before modifying HSCTLR (ie enabling cache), but 
>> may be we want to be stricter.
>>
>> 2. Invalidate the D cache after "mcr   CP32(r0, HSCTLR)" and then dsb 
>> (to ensure d cache is invalidated), isb (flush the instruction cache 
>> as MPU is enabled), ret.
>
> I might be missing something here. The ISB instruction will not flush 
> the instruction cache, it will flush the pipeline instead and 
> guarantee that previous instructions will complete before continuing.
Sorry my bad, I meant flushing the pipeline so that pipeline is refilled 
with the instructions from the MPU regions with the correct permissions.
>
> But overall, the easiest solution is to disable the MPU, update the 
> MPU tables, and then re-enable the MPU all in assembly (i.e. no jump 
> back to C even temporarily).
>
> So you control the accesses and can limit (if not remove) any write to 
> the memory whilst the cache is disabled.

Yes, agreed. I will rework my patch so that the MPU regions are set up 
with the sections of Xen in assembly (similar to what is being done in 
Penny's patch).

- Ayan

>
> Cheers,
>

