Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F23C7D81A3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 13:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623716.971824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyLI-0003KL-FY; Thu, 26 Oct 2023 11:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623716.971824; Thu, 26 Oct 2023 11:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyLI-0003Hg-BY; Thu, 26 Oct 2023 11:16:00 +0000
Received: by outflank-mailman (input) for mailman id 623716;
 Thu, 26 Oct 2023 11:15:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+j7=GI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qvyLG-0003HZ-Br
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 11:15:58 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 087be17e-73f1-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 13:15:57 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH0PR12MB5169.namprd12.prod.outlook.com (2603:10b6:610:b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 11:15:51 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1%6]) with mapi id 15.20.6933.019; Thu, 26 Oct 2023
 11:15:51 +0000
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
X-Inumbo-ID: 087be17e-73f1-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTwfhCWmOuLOIsb1CBd4QgY5VanOHF7dz5uiKxzviG37LWdih+H59Ha+PGbtH6NeK+Kc/oxMcaNX7sZnwIO9rtUrK306cQTpEQkIOBbnHqhpy+AubNcbjM3jH7BHYsQXt344MbBtq9BzMBGIBX9gqcR/zdf7EnHGthHsOf2RZK5Ox6DWNUdwmvkZMZQDnhZJ82r9OykwUR0UX8X1qdJkpZOiAWsjrtlWEysERNURNl4mCOz4ik2KfMlFzbUJyND6oPMion5Mdx9zyRz9BQ4zturGGixSCycKZyrShsdRdMvi/4Se4nt4+aDzQ7yUZpWKw4KK1QJQ+/zQtXw/6cQHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLhyPbrFP63QRbF61CzwlelsI9JYUcLXveVDaabc2Hk=;
 b=nATE5NSxeB12vyNxfTJD/2OlDtoxHVbhgl2axKE3gm8KlMc9h0CO2bMayH0rZHjujvYx+k2+kX2tFcjaDQIRa2sAtZ49eQoHbASzuziTR0pqeSI8SXZdnOiU375E+G7c4GGoz+UOzRORvpty4hgp31cEhTutkR5kBCmBczTpAiUQ3ZsVW9NJtlxnpgC9Ggw83cT+K2cLx+37IpsEQlmH65V2C/2d6LIBrTADs/aOhPJPVSeSu+S1qWpDkBgxwN18Gxo6PkpP2SyT1QakTYUkz+cbJiMWYXthVhA9PiXXyNZ24kiSIXUnOHev+8CkSUhf0D9/5TJUMnuPIiPBg0IkCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLhyPbrFP63QRbF61CzwlelsI9JYUcLXveVDaabc2Hk=;
 b=nseEnYUyOtadS1ljkKZlHWKAzZDg4+LL50/DSttzDDeWG1VZtRwlN6j6aDBMs8/ktbNc1oAW7rNI2iRPAvxayh4vx3NAm1pZXm9hDl9RY28UZHOr57YCjgpmAdo+AqUs+LPKD3zz+TZ8gZpTxZg4zj4We6Uq2dhykURPCcvNwfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ab63a343-84ca-4568-8631-c5c6e8fa8159@amd.com>
Date: Thu, 26 Oct 2023 12:15:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN] xen/arm: arm32: Use adr_l instead of load_paddr for getting
 address of symbols
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com
References: <20231025170304.2331922-1-ayan.kumar.halder@amd.com>
 <e61bb4e6-76ee-47d5-820f-926a85a8ec0f@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <e61bb4e6-76ee-47d5-820f-926a85a8ec0f@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0078.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::11) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH0PR12MB5169:EE_
X-MS-Office365-Filtering-Correlation-Id: 2976843c-8f8e-46a6-71f4-08dbd614e9b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yUGOIO06rz1BrzB/uD4RYV4MNLAaq/6i2jEMdAm8Uh6eqs3Xd4vxmNyClPbH7ckS+r4gOyUARR8ffvt2m01x/7UH2Qzkv7Hb2adt2XLUC9LpE0+XFchdWsoYKonEmG4FvLp16Xhef1krd12rRJS0Ko3r+/5+0+nf/1qvYoItgMPdXcmhDIqcdWsO8Qb/99ncbgTuStwlt5wgxNB0IlnqZ2sKx9NQEHFJZoR0enwFIoPSrEuUG0lxJ58H2ZMN6NxzxBsEYBZayCmym+Zd2w+lnxAwD3c9HJp+xF/l0rWJfEZCYwggVRXA2CNZLc90SJwoqsDSpJyjRhvGLkSwf7LrRmYHTQsY3QwekLSiTa9x0O4UaK+kf2T9H7EgjzoFS2VOBu9nJUgp3ClAJCr76LkYLHQxLCgdl77KwvmKnpfRzz1WD+eEM6kvcOQWFCPFMk8z0tKqOewHJ1hwC2bGvhT2WYljQuu/chpby1Grh/6ei2hYVbZ7EHoJWB6fjJQBvx903M6ZRlrgAeH9EMgvY1WcU2y5kJcVu2k0JuHxqFu2mHEkF4a7GXSbTfZy82P+C7P0BP7Gsj11UAQi2qSTw1MjsIrBZdcQGE1bjHt9+6hya3Idfz0GneJj6vg5uZB6jnj9808vMShzTvWIYWr0nzYVyg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(366004)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6666004)(38100700002)(6506007)(6512007)(53546011)(966005)(478600001)(6486002)(26005)(2616005)(83380400001)(66476007)(36756003)(8676002)(110136005)(31696002)(8936002)(4326008)(66946007)(41300700001)(5660300002)(66556008)(31686004)(316002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3FPV2liUWdETHFDcHY4QXN2MjZiN1k3aVZUWXptSHliVEgxaHVRc1pGU05H?=
 =?utf-8?B?SlVSaWNHVXZoRGJJVHJUdjFCWEJnQ0hQMnExMURQcjhTNWlBZGZNcW92M3J6?=
 =?utf-8?B?MThQR096U1F6clpTMlZVbjcyR3ZTZjlDMXZvbjlqZ0tZUlFQVmhMdFNsTXlQ?=
 =?utf-8?B?YXpZa1g3UWVMNUpvY1d0eTNrTVNpekVwd0ZWQ203TURVcHdyWmoyblNKNEYr?=
 =?utf-8?B?MmFEK3F5WkxzRVNZc0lMTEpWK2c1WUpwL3IvNWNEd0pyWTVvQ2tpK0crVDl1?=
 =?utf-8?B?eUlkRGZFYmRWajhjeDA1ZE96U3hlcmhSNHgzSE53TnZOK2UxQlBPM0lGaTU0?=
 =?utf-8?B?SWw4bVRnNkVRd1FkaXI5K1VsMkpOUGFsM3U3aFVVTUU0RHppWHhLSENZTzFJ?=
 =?utf-8?B?emdUR3NqQzBUMkxZMXcxM1RLZ2Q3RTdlY1MxMHNBL0o0eGxFb0x1TFNKd0Zy?=
 =?utf-8?B?OXhqU2tDWjhXMG5QblQ0OU1zQ2tnaEd1T01YQThLKzBSbi8zaStrN0VVZ1k4?=
 =?utf-8?B?ck1ZTlVjTkpyTzNnbWZ5Z1M5N0ZzLzNsTERCM3VnRTA3cDhBb1VCN2U3YUp0?=
 =?utf-8?B?K2Y0SW8wdkZhV0g5aVQ5YnRYTnRSTGhZcGkrdURuTzdjZ1lYZFRVcG1wMXgr?=
 =?utf-8?B?SXZHTlVPa3RkbVZsbDY3UzZSOEU4cDJYK1FJUkFlOURMczBZb3VhZjBoUDFu?=
 =?utf-8?B?L3lyMFNTRHIvdmJTSjBoblJ4TnVSa3FhQUxOT01oa04xZGtKOWM1V0hmVkM1?=
 =?utf-8?B?L21BMXkzbmR6SVdUSzVaVmlXTlhYTURpcUU2VVhFcldoT1lTVUtyT2xKelor?=
 =?utf-8?B?Njc4QVNOYVBUTk8zWi8rWUVuVEpKandIUFoxMm56OW8rTS9qZWRwMng1eWox?=
 =?utf-8?B?SkdLSFRqNXhSNUF4akZZZ2xrTUNVaks3ejJsT3hkLzdrV0ZmZWU5QUxMMkI3?=
 =?utf-8?B?aTBYalc3cXZvZ0dLMSt2V0hqdVc0cm1ZbExxejdsdlp1SG4xQkNhM3k2UFIw?=
 =?utf-8?B?ODRUNmt4Y2xZckM1UzQxQkhMdjBubENhQ0oyNGZoZ21oaitrSStXbExIakhD?=
 =?utf-8?B?dDExMmpsUDdBemlrOFhFZk12N3lJVmNmdDRwNTlFejlyTjFGbDZPd2krOVkv?=
 =?utf-8?B?UE0vRGt3TlBPYU9LbmI1akFZTG01WnZlMkE5WGs3RDlaUWpvV0ZNTHVHSGVS?=
 =?utf-8?B?NFB5cXdrZVN3SjlNKzFmNXkwMGxFM1pyNzBiNTI3NTZMdVM5MEFpQTBVVUpx?=
 =?utf-8?B?RTdib3JvTVdVbHVsYVVTaEdRc1dKVk1WMlBXODFQV0JjQUxJSGMrcm9DVUMz?=
 =?utf-8?B?cU1iT1BNUlI4YytRWnpNZWdzNEdoeUZaYUUxUzlRZnJncDFhQXg2MXhXWWlY?=
 =?utf-8?B?ZUVVdzlkVjVmbmczVjA3VDVqVkxaQUpsWDFQUDBiM0xCb3NydGoxaDRNQWhH?=
 =?utf-8?B?eHArRW1ZeHg2UzJ0dnEzK3EyUHcva0FjN0c4b0VyYUJqdUdSL1ZwdjRLQjBV?=
 =?utf-8?B?T25XaVlJbjhqZW5KYUZreWdFWUZKL2Iyc0xRNVgybnF3WHJzTExLOUt5Vldq?=
 =?utf-8?B?SW5nZCtGcitmcmlyNjBLNmh3L0UvKzlhL3NhQk0rNVBUVHBnWldZc3hDRGs1?=
 =?utf-8?B?VXM3UjhIcld6R0I3ZkI0UEltQ29LVFB1THhTSXA4T1FxaFFyS3hLMGdZMEhH?=
 =?utf-8?B?VXBDQUo4QlkwVVdyNUZWU1RtRTR2UW83NUZkTFlyWnY3MGZ1TWpDWDcxblBm?=
 =?utf-8?B?Wlp5YlBya3RCQW9IOTM0Q0RsTC9qb0U4eE9ONHhhbE1nRk1qTDdoRFZuaVFh?=
 =?utf-8?B?dFJCYmZ6REJtRXhjVG13TGJjTVN2clhBWFBKRy9jS2tLNVBCaTl4b1g2TjVk?=
 =?utf-8?B?aDl2bGJzQmFJSTVxeXBoT3c4R0UyNERWNW9wb3huam1FUmdVbGJSNERWWFlK?=
 =?utf-8?B?R2JlVW1wcUxjQkc5V3Z2MTdIeVVUcE1XUnNYUzRHZGlEdjZJMmlNejVHSjBq?=
 =?utf-8?B?L2ltZTAvbnJhVUp2M01UOUJxRkdGUTJCWUtIRUdXSDJ4bURiYmtGaEx1NkJU?=
 =?utf-8?B?cUF6cHRvamg4Zk91aC94NUtVVE51T0FvLytJZm96akE1aGJyQmlsaHQzODVq?=
 =?utf-8?Q?GRNKMWmROu53aioXGVtFeuC5q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2976843c-8f8e-46a6-71f4-08dbd614e9b8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 11:15:51.4188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/JWuyG3WPNHlRfRROv0lj4Hs/rnp2uSWYAleh03TU9NbmvggSmbrgT3idWC76vPMNxgrqPhBu20QMjTAaqTDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5169


On 26/10/2023 10:40, Julien Grall wrote:
> Hi,
Hi Julien/Michal,
>
> On 25/10/2023 18:03, Ayan Kumar Halder wrote:
>> Before the MMU is turned on, the address returned for any symbol will 
>> always be
>> physical address. Thus, one can use adr_l instead of load_paddr.
>>
>> create_table_entry() now takes an extra argument to denote if it is 
>> called after
>> the mmu is turned on or not.  If it is called with mmu on, then it uses
>> load_paddr to get the physical address of the page table symbol.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Refer https://lists.archive.carbon60.com/xen/devel/682900 for details.
>>
>>   xen/arch/arm/arm32/head.S | 35 ++++++++++++++++++++---------------
>>   1 file changed, 20 insertions(+), 15 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index 33b038e7e0..bf442b0434 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -171,7 +171,7 @@ past_zImage:
>>             /* Using the DTB in the .dtb section? */
>>   .ifnes CONFIG_DTB_FILE,""
>> -        load_paddr r8, _sdtb
>> +        adr_l r8, _sdtb
>>   .endif
>>             /* Initialize the UART if earlyprintk has been enabled. */
>> @@ -213,7 +213,7 @@ GLOBAL(init_secondary)
>>           mrc   CP32(r1, MPIDR)
>>           bic   r7, r1, #(~MPIDR_HWID_MASK) /* Mask out flags to get 
>> CPU ID */
>>   -        load_paddr r0, smp_up_cpu
>> +        adr_l r0, smp_up_cpu
>>           dsb
>>   2:      ldr   r1, [r0]
>>           cmp   r1, r7
>> @@ -406,6 +406,7 @@ ENDPROC(cpu_init)
>>    * tbl:     table symbol to point to
>>    * virt:    virtual address
>>    * lvl:     page-table level
>> + * mmu_on:  is mmu on
>>    *
>>    * Preserves \virt
>>    * Clobbers r1 - r4
>> @@ -414,10 +415,14 @@ ENDPROC(cpu_init)
>>    *
>>    * Note that \virt should be in a register other than r1 - r4
>>    */
>> -.macro create_table_entry, ptbl, tbl, virt, lvl
>> +.macro create_table_entry, ptbl, tbl, virt, lvl, mmu_on
>> +    .if \mmu_on == 1
>>           load_paddr r4, \tbl
>> -        create_table_entry_from_paddr \ptbl, r4, \virt, \lvl
>> - .endm
>> +    .else
>> +        adr_l r4, \tbl
>> +    .endif
>> +    create_table_entry_from_paddr \ptbl, r4, \virt, \lvl
>> +.endm
>>     /*
>>    * Macro to create a mapping entry in \tbl to \paddr. Only mapping 
>> in 3rd
>> @@ -479,7 +484,7 @@ create_page_tables:
>>            * create_table_entry_paddr() will clobber the register 
>> storing
>>            * the physical address of the table to point to.
>>            */
>> -        load_paddr r5, boot_third
>> +        adr_l r5, boot_third
>>           mov_w r4, XEN_VIRT_START
>>   .rept XEN_NR_ENTRIES(2)
>>           mov   r0, r5                        /* r0 := paddr(l3 
>> table) */
>> @@ -522,8 +527,8 @@ create_page_tables:
>>            * Setup the 1:1 mapping so we can turn the MMU on. Note that
>>            * only the first page of Xen will be part of the 1:1 mapping.
>>            */
>> -        create_table_entry boot_pgtable, boot_second_id, r9, 1
>> -        create_table_entry boot_second_id, boot_third_id, r9, 2
>> +        create_table_entry boot_pgtable, boot_second_id, r9, 1, 0
>> +        create_table_entry boot_second_id, boot_third_id, r9, 2, 0
>>           create_mapping_entry boot_third_id, r9, r9
>>             /*
>> @@ -537,7 +542,7 @@ create_page_tables:
>>           bne   use_temporary_mapping
>>             mov_w r0, XEN_VIRT_START
>> -        create_table_entry boot_pgtable, boot_second, r0, 1
>> +        create_table_entry boot_pgtable, boot_second, r0, 1, 0
>>           mov   r12, #0                /* r12 := temporary mapping 
>> not created */
>>           mov   pc, lr
>>   @@ -551,7 +556,7 @@ use_temporary_mapping:
>>             /* Map boot_second (cover Xen mappings) to the temporary 
>> 1st slot */
>>           mov_w r0, TEMPORARY_XEN_VIRT_START
>> -        create_table_entry boot_pgtable, boot_second, r0, 1
>> +        create_table_entry boot_pgtable, boot_second, r0, 1, 0
>>             mov   r12, #1                /* r12 := temporary mapping 
>> created */
>>           mov   pc, lr
>> @@ -578,7 +583,7 @@ enable_mmu:
>>           flush_xen_tlb_local r0
>>             /* Write Xen's PT's paddr into the HTTBR */
>> -        load_paddr r0, boot_pgtable
>> +        adr_l r0, boot_pgtable
>>           mov   r1, #0                 /* r0:r1 is paddr 
>> (boot_pagetable) */
>>           mcrr  CP64(r0, r1, HTTBR)
>>           isb
>> @@ -658,7 +663,7 @@ switch_to_runtime_mapping:
>>             /* Map boot_second into boot_pgtable */
>>           mov_w r0, XEN_VIRT_START
>> -        create_table_entry boot_pgtable, boot_second, r0, 1
>> +        create_table_entry boot_pgtable, boot_second, r0, 1, 1
>>             /* Ensure any page table updates are visible before 
>> continuing */
>>           dsb   nsh
>> @@ -739,7 +744,7 @@ setup_fixmap:
>>   #endif
>>           /* Map fixmap into boot_second */
>>           mov_w r0, FIXMAP_ADDR(0)
>> -        create_table_entry boot_second, xen_fixmap, r0, 2
>> +        create_table_entry boot_second, xen_fixmap, r0, 2, 0
>>           /* Ensure any page table updates made above have occurred. */
>>           dsb   nshst
>>           /*
>> @@ -897,8 +902,8 @@ ENTRY(lookup_processor_type)
>>    */
>>   __lookup_processor_type:
>>           mrc   CP32(r0, MIDR)                /* r0 := our cpu id */
>> -        load_paddr r1, __proc_info_start
>> -        load_paddr r2, __proc_info_end
>> +        adr_l r1, __proc_info_start
>> +        adr_l r2, __proc_info_end
>
> On top of what's Michal already mentioned, you can remove the line in 
> lookup_process_type() which set r10. It was only present so 
> load_paddr() do nothing when called from the C world.
>
> It is a good hack to remove :).

I have addressed this and the other comments.

I have sent out "[XEN v2] xen/arm: arm32: Use adr_l instead of 
load_paddr for getting address of symbols".

- Ayan

>
> Cheers,
>

