Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BDE743DBF
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 16:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557539.870989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFFKi-00027t-9a; Fri, 30 Jun 2023 14:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557539.870989; Fri, 30 Jun 2023 14:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFFKi-000254-5z; Fri, 30 Jun 2023 14:42:48 +0000
Received: by outflank-mailman (input) for mailman id 557539;
 Fri, 30 Jun 2023 14:42:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9zhT=CS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qFFKh-00024y-7R
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 14:42:47 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f77baa8-1754-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 16:42:45 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY5PR12MB6275.namprd12.prod.outlook.com (2603:10b6:930:20::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 14:42:41 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 14:42:41 +0000
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
X-Inumbo-ID: 5f77baa8-1754-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+PKbOF/raW0pKA8xo5FTUAWCfrhMKi7eM+Xrp2A2STTnltXDX8hqcTVXMTq2xc3qOv3rWIV415aUhCnqOvLWk9rR9bIkwyGRQKya56X9bnPXH3L9rJFsUmrrOTV0seEkduYuWZ4mxLnVWbp1dByRCcMSRgtkI6L3xKPlMuG1wemddM4F9eanaeZ4aZYUE3v3lWrIq7RwLIzWHiqm1RHd5THc3cWKQzsGEBww3xq7bPbzTuCWSvk4/hJYJL2cHFIsmeWdImGIcULr1u5UdsqFDfUarO34lR9GbvRf5ZDzTk2/bdGA5gcMNtxLic8I/Sn6gfMSfGJJX0+FckLVyy3ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKbdztIOnUDg8PyswX3ozHuq8osquxcfvbKsTLeLCcY=;
 b=W+q/EDuxTLR9W5Txpt0+3E6CstDjJ4iU6c945tSsZYmXIE88sr6X9L0v43uT7QbMiJla6wORf7MqDg+yCc7sDopNjLArNMrD/m9Pv7+j0wqni0PGPVH0C7ejl6eO1OOZmAaHvMzNktHuDKZtjFqZ5mmCYG8jYKBylzFZ91ik8PcFcTbdnLHsaLt2p5PwaW8a2nEkiu26+Jz94Pmfh0AvxTzcGy1eewIa4hUB11FWjcGc6pUsGKpBj+cFYnWIh81zy+IVld3uET5F+sEdix9UKuede2vnl6b3MALgSa2v1CPj4bhOIkPZGFeLkADt2HFj65N5OsnQTN2LdqdWEKtziQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKbdztIOnUDg8PyswX3ozHuq8osquxcfvbKsTLeLCcY=;
 b=jtD0xgOyj+4mS42dZ8xEuICbLCNNwQNLxYL0aT5xN7SLlzwFmW5LqoRIE+vDuF/YQ6rs1MCDIXhgynymY+FWQegP5VHVSgnNWGZPOyzDfLWA4XCoGl3wZCf/My5oq3xT1IHkpkz9w1Nhn9RR/OtHwBRippA8NtQm1/C0e75WQ4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c070054d-3f92-ecd2-4f04-a97c5a84d3d7@amd.com>
Date: Fri, 30 Jun 2023 15:42:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 31/52] xen/mpu: make early_fdt_map support in MPU
 systems
To: Julien Grall <julien@xen.org>, Penny Zheng <penny.zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-32-Penny.Zheng@arm.com>
 <c2a779e5-51a9-f0c8-4c00-a568ff4bde83@amd.com>
 <a381b1b0-d18a-8fea-56a4-d88c65bd3cea@arm.com>
 <9530f9f8-795b-783a-bc74-e30a3c5c2fd3@amd.com>
 <baed1eac-0f9a-a85a-d4cc-feef772870db@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <baed1eac-0f9a-a85a-d4cc-feef772870db@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0113.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cd::14) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY5PR12MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: dd41b5a3-7ec4-4f70-d4c6-08db797841f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	38n8dr+nfDN74uYDFSMe+GHtpZmttVesMGLD4dxuaXj4iprFmbJ+a8DCeQPF/SLJcQpw08dV8tNNernQU2VxsEDRUr0xElanJTx75w6EH1Pl2JGV7bka7mWPJmzElj/0hKLuNKkyvPmz1NLaJ7708OcYIicDvX/BDA0tNuTHikxQ5cvSofch8j0deFgP+eOCsHJ4xwT+8mnqYkjr2lez10j8e52eHLDCKsAV7N2iFwtxhxfXYynUSrU9uhAYNdDTdkDiZ9lnULbR6NSLCjeYAJqous32y+dgLXRF5BNr2OMPxVwmJAu9Mqb3+Ayi/TFvQggbrUTn+Yawjye5VtFY1RQQ3M1nk6uR9ODKuwJjY4IDS6F1qS60R8wGPyZTYhXqeDSe8pbYdE3oSak+YNQYFjFiSSCtSb5MbYHtiIc7ceJHcPLDxRYYNR+ucV6wgPfMF7asX0bBybeQwCpOlw+GVIatjkBDk0wofqXietr1/ZOzKiX0/rwgrrklGNxxURq2jJk7GL34cFE/GsmJmQlV0m/8E+/uRy5pbr6LF4P+DLMOJn5us1qeGQ0rcHRB5LiC4gBiWTzdPnPC0tuzcuk1clk7s4KUZCQuthIpA51uu592LVr+x5FcwD02iuyG4xkr+TLntrczUYdeiEQF+OHCvu+EQtr/4S5Pm+A80PZmrHY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199021)(66476007)(66946007)(66556008)(4326008)(41300700001)(478600001)(8676002)(31686004)(8936002)(54906003)(110136005)(316002)(6666004)(83380400001)(6486002)(5660300002)(2906002)(53546011)(6506007)(6512007)(186003)(26005)(38100700002)(36756003)(2616005)(31696002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a251NGJ0T2lsRVRyR04ydUVuN1NWL1VhYU1ZYWRuU3NGdm5iZGF0Q1hjV2dG?=
 =?utf-8?B?Z2pTOFRxUmxsaHRQWEYvWCtVbTlWZGxBWkE0MFFscExqMU1vcjlQcXF2UFZW?=
 =?utf-8?B?YjRwNEpxNVhGWVVOYy82em5xSGNNUy9SZFFVWUtTb3dZc2ZTQnJXa0JBRHlC?=
 =?utf-8?B?TlFqNTA2YjRveHA5aDdIWUhNL2kzSHBrK0JZU2toVXlraGZHVmpITFRkNVEr?=
 =?utf-8?B?QkJkTUJpU2xHRVE1cFFpbXR0cm9rOWNQVElYQ3FLdGRnQng4VTlKR3NtWU1w?=
 =?utf-8?B?OFFJOVR6RndGMkQ1R2tLY1lNK25MUFI0cGc0TkRsZGRQdnMwNnhrbCtCSXN2?=
 =?utf-8?B?Mnd2TXVMKzN1a1hJOWdjZlZKczlBanhwQlc1VHZxcWgyaDlTY01DY2dmdzRn?=
 =?utf-8?B?dWc1eCsyWnJsNEt6NG1TWHVDa2ROaURuaW80bVgzZ1plV1RKS1BDSlFnZ3FV?=
 =?utf-8?B?M2NSK0xVcjlIeUo1aXZlKzNPYVB5TUxvUzVodUJkMFZHK3hsVTdzVjgvV29p?=
 =?utf-8?B?aVVaRitaUTZVelo4QTVIcU5sdHdwWXNtZ0VyMDBlSW81NkxyRDRlN1B3ZTdw?=
 =?utf-8?B?cSsyVU5JV3VaUklpdGc0L1ZrL3N6UmlqcWNlbENnTnBnV1ZFMjBPR2U5WHdz?=
 =?utf-8?B?RFZjb1MxblNZT3BTSWlyYUwraGR0V2xyVTB0d3lTZmNsM01mRU1kbGllQWRS?=
 =?utf-8?B?QUlCTkx5M243bDkrS01ERTl2c25qMG1CL2FkSUo4NHhXRUJHejJxWXV3U2dH?=
 =?utf-8?B?SVpXTVVRUVVsUU9iRVl6bG4ySTNzeGlhcmhoZEhOS1NPd2tsVHB4R0JhWG1R?=
 =?utf-8?B?L0haOHAwTHdSNVFnSHdOYTZqUnRjMFJ5WCtDN2E1WWtGMmhiMUZnaVVKNklG?=
 =?utf-8?B?NWxiSGtSMlovRmZyOEtVNHg3bm9uMkQvS3pVRHZzandENXM5RWdDOU9QR0dH?=
 =?utf-8?B?d1lGOHpLYnRNN2U1ZzFTNWZJNlJVTWN2czZ2eHpndksrR1FjQ0pOWGtFRFE3?=
 =?utf-8?B?T1MvbXhQZWVSOHhQSk5Ta1NVeXVVdmhVVHorK2s2L2thSkY3S09vREZMeTVC?=
 =?utf-8?B?OHZKR25tcGhnM1QyYm1ZT0pnRjlOSXhXOG9lbExiblgrZzJ1TlRrQ01LekdX?=
 =?utf-8?B?eXJxalFMMTU2ZWpLSWluNG1hT2pWTUV1ckdNZ3F0Sm1YMmtKN1FWdW5tK2My?=
 =?utf-8?B?WkxpK2xIbXR1TUl3YmJhenV6SnV4UHhkMWptekJpUVlOMko2VngxWU0xSDgv?=
 =?utf-8?B?SlFxemdidUJTV1JpUkw0eGgyWC95c2kxcERQKzdMQjlSWEVlVkFEN2tnby9u?=
 =?utf-8?B?dFRoL2dWVnNYczRyeUxnK1lGb1l1eFFxTUE0cTBoeHZ4UThsd0NXNERQek9W?=
 =?utf-8?B?U1U0Z2xhbWw1N3NJY3dBdm5ydjZheXl5OGROOU9MT1lCSXEwUTZad1NYQk1I?=
 =?utf-8?B?TjYwSTdFT24zK0NGamd5bnY2Nmh1bUhqWmpvcStRT2ozMzFZVWg2dCtLVFZ4?=
 =?utf-8?B?NlRXSE1PMU1HcmhCVU5rekZ0ODBuUkhvR05uNVV0SkdiSCs2OC9aSmJuZ2x6?=
 =?utf-8?B?eWdvTWl3VVEwWVJGVnpLTFhKY1JjTnAxR080cWJEZkxHdStwS0VVZDdRU0dQ?=
 =?utf-8?B?YjN2WjdKOEF0LzlLRGhMNUlManVvcmR4V01DWCswVWUzc0F1d0JQQXBGNzQ1?=
 =?utf-8?B?WEMxdDB3MVp6UEtyRUNEcWhWY2lvTUsyN01pSHNMaXlwdnJNeXVFcmhrRlBD?=
 =?utf-8?B?MEdHOW5SemVIV25ENDBMSnVaOFF5MkdFSEFXWmZxbEJ4cVh4QXhxaGNHdGlK?=
 =?utf-8?B?Q2J2aVJ2YlY5VVhvenE2MDk4TmdnQy90dExteEVrMERCWUplTEZ4Z2J6N2gv?=
 =?utf-8?B?dXFlQXdrL1FsR3Z3N3BHcDhoY0RNYjcrcjRnVXI2akhQNXYrY2pwNGwrVTEr?=
 =?utf-8?B?U0dGaWJBb29UTlVrS1BoT3RoRHBmNThKT1ROVDZiU3hSb050WmVBZWNVcklh?=
 =?utf-8?B?ak82WFo2ZzgzNWEvQ25zQlQ5RXZqNHdPUFo5eGN2TXA2VDg2YjVnVDAvazRy?=
 =?utf-8?B?RGNjY2U4YW5GQ0pndmFNNDVINUUyV3VhbHlRTFlpcVNCRWU0Q0xUMWluS2Z6?=
 =?utf-8?Q?Q3onn8WvwfXOt3nJpYBQlDLV7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd41b5a3-7ec4-4f70-d4c6-08db797841f6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 14:42:41.5459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxGbJ6hLiZ6+M9MPaPvi/0/NHtojduQgl2XguQ76pVQqjuZ9vhb+y7/P4eN62oH/XuJXVHXgDzrKsAeL/PKy4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6275

Hi Julien,

On 30/06/2023 12:22, Julien Grall wrote:
>
>
> On 30/06/2023 11:49, Ayan Kumar Halder wrote:
>>
>> On 30/06/2023 05:07, Penny Zheng wrote:
>>> Hi,
>> Hi Penny,
>>>
>>>
>>> On 2023/6/30 01:22, Ayan Kumar Halder wrote:
>>>>
>>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>>> CAUTION: This message has originated from an External Source. 
>>>>> Please use proper judgment and caution when opening attachments, 
>>>>> clicking links, or responding to this email.
>>>>>
>>>>>
>>>>> In MPU system, MPU memory region is always mapped PAGE_ALIGN, so 
>>>>> in order to
>>>>> not access unexpected memory area, dtb section in xen.lds.S should 
>>>>> be made
>>>>> page-aligned too.
>>>>> We add . = ALIGN(PAGE_SIZE); in the head of dtb section to make it 
>>>>> happen.
>>>>>
>>>>> In this commit, we map early FDT with a transient MPU memory 
>>>>> region, as
>>>>> it will be relocated into heap and unmapped at the end of boot.
>>>>>
>>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>>> ---
>>>>> v3:
>>>>> - map the first 2MB. Check the size and then re-map with an extra 
>>>>> 2MB if needed
>>>>> ---
>>>>>   xen/arch/arm/include/asm/arm64/mpu.h |  3 ++-
>>>>>   xen/arch/arm/include/asm/page.h      |  5 +++++
>>>>>   xen/arch/arm/mm.c                    | 26 
>>>>> ++++++++++++++++++++------
>>>>>   xen/arch/arm/mpu/mm.c                |  1 +
>>>>>   xen/arch/arm/xen.lds.S               |  5 ++++-
>>>>>   5 files changed, 32 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>>>>> b/xen/arch/arm/include/asm/arm64/mpu.h
>>>>> index a6b07bab02..715ea69884 100644
>>>>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>>>>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>>>>> @@ -72,7 +72,8 @@ typedef union {
>>>>>           unsigned long ns:1;     /* Not-Secure */
>>>>>           unsigned long res:1;    /* Reserved 0 by hardware */
>>>>>           unsigned long limit:42; /* Limit Address */
>>>>> -        unsigned long pad:16;
>>>>> +        unsigned long pad:15;
>>>>> +        unsigned long tran:1;   /* Transient region */
>>>>>       } reg;
>>>>>       uint64_t bits;
>>>>>   } prlar_t;
>>>>> diff --git a/xen/arch/arm/include/asm/page.h 
>>>>> b/xen/arch/arm/include/asm/page.h
>>>>> index 85ecd5e4de..a434e2205a 100644
>>>>> --- a/xen/arch/arm/include/asm/page.h
>>>>> +++ b/xen/arch/arm/include/asm/page.h
>>>>> @@ -97,19 +97,24 @@
>>>>>    * [3:4] Execute Never
>>>>>    * [5:6] Access Permission
>>>>>    * [7]   Region Present
>>>>> + * [8]   Transient Region, e.g. MPU memory region is temproraily
>>>>> + *                              mapped for a short time
>>>>>    */
>>>>>   #define _PAGE_AI_BIT            0
>>>>>   #define _PAGE_XN_BIT            3
>>>>>   #define _PAGE_AP_BIT            5
>>>>>   #define _PAGE_PRESENT_BIT       7
>>>>> +#define _PAGE_TRANSIENT_BIT     8
>>>> I don't think this is related to MPU. At least when I look at the 
>>>> bit representation of PRBAR_EL1/2,
>>>
>>> This set of _PAGE_xxx flags aren't compliant with PRBAR_EL1/2 
>>> register map.
>>> It is a flag passed to function map_pages_to_xen() to indicate memory
>>> attributes and permission.
>>
>> But aren't you writing these flags to PRBAR_EL1/EL2 when you call 
>> xen_mpumap_update_entry().
>>
>> In the below snippet of xen_mpumap_update_entry(), IIUC, you are 
>> writing these flags.
>>
>>          xen_mpumap[idx].prbar.reg.ap = PAGE_AP_MASK(flags);
>>          xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
>>
>>          write_protection_region((const pr_t*)(&xen_mpumap[idx]), idx);
>>
>> Please clarify here.
>>
>> In this case, I don't prefer mixing hardware specific bits with 
>> software only representation for these reasons :-
>>
>> 1. It makes it confusing and hard to differentiate the hardware 
>> specific attrbutes from software only.
>
> Penny's approach matches what we are doing in the MMU code. We want to 
> have a way for the caller to pass just set of flags and let the callee 
> to decide what to do with them.
>
> This may be flags converted for HW fields or just used by the logic.
>
> If you disagree with this approach, then can you propose a different 
> way that we can discuss?

In MMU, I could see "struct lpae_pt_t{ .avail }" is used for reference 
count.

Something like this might look better (where the hardware specific bits 
are not reused for sw logic)

struct {

           struct __packed {

                  ... /* the existing bits as they are */

           } lpae_pt_t;

           unsigned int ref_count;

} p2m_entry

And use "p2m_entry.ref_count" for the reference counting.

I see that this change is quite intrusive, thus I will not argue for this.

- Ayan


