Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D0C79AA23
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 18:31:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599637.935138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfjoE-0000Tc-E7; Mon, 11 Sep 2023 16:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599637.935138; Mon, 11 Sep 2023 16:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfjoE-0000RE-BG; Mon, 11 Sep 2023 16:30:46 +0000
Received: by outflank-mailman (input) for mailman id 599637;
 Mon, 11 Sep 2023 16:30:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S94K=E3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qfjoD-0000R8-9U
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 16:30:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e89::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c6414a4-50c0-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 18:30:42 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS7PR12MB6335.namprd12.prod.outlook.com (2603:10b6:8:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 16:30:38 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95%6]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 16:30:38 +0000
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
X-Inumbo-ID: 8c6414a4-50c0-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKlZCgSYFPNfErTkM8A/JaVmQsZD7429ZtUYgiDhY6Z+VlQ1vI+sactBsdGgr3rHkP0pODJPV2UzUj0ha4c5Gp+pf+pm8wb4rtqhXUxrTYpPB6ePe+8HJ8ggDchvbZnIyCb/tVdOjDEN/BAv3uGbmgsmI415i7RfLci9lhuH3bcSNxnUOBm/F8jz5yIEGQJH3mkHEfiJ5nIXXGQgk/PPsmJrlL71JAre80FE/Pre6o7ZNzsRZzmO98IDq0A/pe9XS98765ASwY1fopzW7fEWSYfRwwyWwUxAaSL7EmYBtdbz6/Kz1oMjdSVMdyJwqcUKLEARrWQ8+hJaGH+qJJ07Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DL81iP3XqN17ao8y+idnBJa20HNdvb/ZbwonSzEyR8=;
 b=hCse1ZGlkf5oQd6TSmydeklVUcLZAorKwQNIWo6D7qFhsb9bmPEysOgSSQAIcoSnxoVplZmDiu6R5/np5Jk9YaV4A2LiIgxQ3crnPK8gvAtaLtaQl98wdsDG0+SIN/V2NJgLiQO+sohQC75NyoCF4HZGd9gb78fEm+0WXj/bQOkFMLxZUCqjbZ8qa5uMZ1vPRExnAHOKgz+S4oor+a+QmMrUWrHKcEVy5OKQKo7R0Zc2JYWi/u4VX+F7h2SanOwxyqjwOaDkJBquEOBTWqaIRaEMZt6lpJtxJJaAd6Rgs9PwW7N+abb5eUw8t0fXZprWTerEROtSQ/jWmXXr3EhetA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DL81iP3XqN17ao8y+idnBJa20HNdvb/ZbwonSzEyR8=;
 b=daOWOm1V/fLLnhOHeLhjkzHp9+Pk5AYyRa4Jbs5rVCgNcSlloWchzIfpQxK8qLkmUyz4xJq9036dwMmrC4SD15JmPTGSpgAXUOqFPNu5+Cixg8k3KzCUz9jit0zd4KG7an3hKJHrlrYqTJwYDb/MDZp523brxWqTG7DaOuk/YHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8382476f-7f74-7239-1599-f42a5f3c3c72@amd.com>
Date: Mon, 11 Sep 2023 17:30:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to head.S
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-9-Henry.Wang@arm.com>
 <19a8b434-3b2d-9e3d-fc05-fc2828d1abbd@amd.com>
 <CE8AF1AE-8F01-4DD8-86EE-12C4AD18E4A0@arm.com>
 <ec41bd05-4a25-438b-84cb-ca86d7bf34d8@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ec41bd05-4a25-438b-84cb-ca86d7bf34d8@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::32) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS7PR12MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 029daa4f-2f11-4830-9211-08dbb2e46e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5hdibuDlQlrmvNd8+MFcDylawzwqhAYcYQ9UTqqZny5jQsIX/DQKqAZfubmqJz6kcrueeMZ7BtjIXKyeGsiheXj97Be60flt2oyia3YGiEzJZuXC+KbU+qwfxvl4dtkCHByULWviKnMTMLKgyO/MKF7+nh9wf0ybyr9U4raHjBRcf2tx0khTBq8Jqf4U3Vq2dw+E+OZI+K2tUfLHeH7wQN3ZsSS5eN1kwwJ9ogvULLccJ6f4adBWJmB7NzwniS78Ca7qzJ3hfbGdYS7jpRyIeBS1E7NU51ddlD1Gguzv8Y3XzrLKqxY/6C4kaRYP+OKVRvStdo9X4pzV4pq692nbvhuNlwpy+jJVRjcxY3Fct704zVvOwktDI1RByzrMpa96/Zo9w7nOOIFFPEaXTy9wLwlJTZcwLBV/pzb3GLzkws3VOEoReHmjfAsJbwdkO5hBGPmfd5fBRU4UYGoFm+xzZeGSDTU0poa/EujagovYtw5pe1NisBg6jgSmtt7wWNKZJCSLM7qHiAMpgv6dmLyYgCSznUirKk6KrLUhrReLFsUH2ktf3s9+ivgwwvkL5eUzrjGo6yHwDhnYYPRcBfWXiRiwN7KfzLWo5KFcCxOV08KbA+8CPlrRtZzfngweRrkjyP5o40iCb1tudt35XZDKTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(186009)(1800799009)(451199024)(110136005)(31696002)(26005)(2906002)(83380400001)(53546011)(6486002)(6506007)(6666004)(2616005)(6512007)(478600001)(38100700002)(36756003)(5660300002)(8936002)(8676002)(31686004)(54906003)(66476007)(66556008)(4326008)(316002)(66946007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVBZMUxCWHpUTkJKYzN1OVBWRkNuNHRNem1QNG1PUVc0aVRBSmlIUWQ1TlJx?=
 =?utf-8?B?WmprMXV4Z2ZRbHpER3FmeXl0bGFLL1ByR2M2NENkRmUrZVhsV0pwSWh2ZzJE?=
 =?utf-8?B?NmNqNDczUnRESit6c0poM053eU1zYzVBb05acnNqZno1eUxtUERkUEJXLzJB?=
 =?utf-8?B?Q1F5ZVA5YUNlL0c0cEFIb3hSYTZ1azZqOEFJMEgzbTJVKzFzbXBQeGo2SWs4?=
 =?utf-8?B?Tnh0YXp6Wk95Nkl0dUN1Y0k5NFdqK1p1MXdUZkNJai81U21KbE9lZDBldTNU?=
 =?utf-8?B?b3BQVEZ5Q2lMN3l3Z2VjVHlQcmpVTldPZS90S0NuY0JRaS96SjVjSzhnQ0tw?=
 =?utf-8?B?Z1hTT25kb2pSelVqZmI0dlhMZ3FsTUFac0gwZUdjYkR1V3NoRHZXSEI5d1pp?=
 =?utf-8?B?OG45WHppQ0pDWWVPLzJQRGJNUzc5clFsMS9FWlBGbUVJVVVNazZUZTNaTmZK?=
 =?utf-8?B?K1NpOGJ6WUlqVkpWamtOSkJsYjV6SEJKZXR1b2FBNjI5ZU9XTHErcm5GRThK?=
 =?utf-8?B?OE9ZODdKZHhTY2dkeG5OT2pmS2VCanVxK3FrWXVnQXU1SVQ0a3NUa1pWVXdv?=
 =?utf-8?B?WHZ0OXdwTi8wNCs3TFhTL0lPTlZYd0g0S25OeDhCaFJrN29JYmh4ZjNXaVRR?=
 =?utf-8?B?NXJXc0VnNytqSXRaeExmSUk4RTJ5WWEzaTF0eVo2dVBjZmRJMlNVeVlNbUly?=
 =?utf-8?B?eERWYTFsNDc1dVdmajJTL1lCUnMwQzBjWEFtcFFqNm5zUTJrd0RISHcrNE1u?=
 =?utf-8?B?NTZOTWdrajFFUklGTGMyVGtXS1ZPTFJwMEl4WmlSckQ5cXJZYmVVVzM4SHpr?=
 =?utf-8?B?KzVQa3k2TVpER1hpNjE1NzJrcVJJNFNUNGhUbHFZODFUSXNObHY5cHpnd00r?=
 =?utf-8?B?emdlUjdFTVZXaXpsYU9JNEEvamdXUFkzMHRtRkRIUDRlcDVRNERUeHpXekNw?=
 =?utf-8?B?aGM5bzNEcDVYZVkvZHRlZmFTd2U3NmRUZlFpK2hHV3ZzVFdsTXlRS0pITWt0?=
 =?utf-8?B?R21zSXpPRmJEM2dOOStTcWxmYzFHQUJRMnZNVFkwOFJ0RmJZYXlpbEZqQzN1?=
 =?utf-8?B?bGUxV1ZyTnRlQ0NNbjI1VUVQR25naFRURFRTRDM1T3ptSkYvTnloeVhpYXlC?=
 =?utf-8?B?NVNpZ1ZUZFcxRE9ycVlRdFYyckxZc1N3aGFqUHJVZm1BT2MzT3k2MUd1MUVH?=
 =?utf-8?B?cTh0bWJVZUtBN0tKa2ZtWUw5cUhqM2lHVVRjeW94VWRBUnBocDJhSXVIR0pr?=
 =?utf-8?B?MUZGdWlqSVc2UW5jTjdrQVRnaVpDQnROV2FhN2t1QU51RTFTL2lyR0IzMG1h?=
 =?utf-8?B?cGM4WXNkSkluenhYTkM4aW5GbVljbHl3SlNFUjRPdXo4ck1iU0J2WFk1RWVR?=
 =?utf-8?B?cDB2aU9kdno1Y0V3aGxpUlRnWnNScW5KMjNFSEpCT1Ezc3JaeHJ0UnZKdjda?=
 =?utf-8?B?ajZCNnM1SWVJTjBiOWR0azlvYndHL0YraytFdTE5V1hHTHFaSkc4SzdyejZ0?=
 =?utf-8?B?YzYxanViSGd0UU1EdWwyencyMEtUY1VVSjlBcnhGL1NWMldJVzdUN0Eram9h?=
 =?utf-8?B?aHVvM3IwT3p6OEVyOFhiejVWU0xhYmVzenM1UHlmSEdTSlpqYTFUMjREM1Ey?=
 =?utf-8?B?blBkdDZwMG1jd0E2MGRkRXQ0NGNHdnB6MEc2bGkyc3k4by8yOEFiZnpvRTBY?=
 =?utf-8?B?aU1BNFBnM1BPdzdNZ3RERU5Cam42SEhPSUlRMWJPS1JCbkdyQnJURUhmdk9Z?=
 =?utf-8?B?UUpTUWlVd21TUFBqcmtXSElqRHU2OHZzbXJEa0R5R2NvY2pLYkVPWmZEZzJC?=
 =?utf-8?B?VVBhaTJiK20wL3h4OWhiNkNBa1E3cWtWRzNJZkhQMk9hZkd1S1dBZkU2dWp5?=
 =?utf-8?B?dXF0cWF0ekZTZGIwd1dWNitxdUUrbStYYzRrck9NMjUvWFhUYWZxRXdPcktx?=
 =?utf-8?B?K2tNeGo5Z01kOGptOTQzcjltKzhPZkNacHRqa3c5VTl3T3lZTDlLbXRXcVJv?=
 =?utf-8?B?dHA0VzNsaHhZSlM0Tkk3cHM4SlVHOWRSODdyTG5uVEo5c0lRa0VNRzdidzdV?=
 =?utf-8?B?a1JhYW0zU2RUejFBdUd5Ynlac0FpQnlaNlo4WFBZc2NzYjlJck1lN3VuSWdi?=
 =?utf-8?Q?a3FkYqtDYPPp5C1fYO9BHljKH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029daa4f-2f11-4830-9211-08dbb2e46e84
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 16:30:38.2190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VprdSQj6i+VGrkcPRNtKthrZCdpEFWh0FchLnWeurLGcJQvVbPkD52gQxLHY2nDQJCEP6Ihw7sH+goIkO26PfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6335

Hi Julien,

On 11/09/2023 15:51, Julien Grall wrote:
>
>
> On 31/08/2023 10:16, Henry Wang wrote:
>>> On Aug 31, 2023, at 17:12, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>
>>> Hi Henry,
>>>
>>> On 28/08/2023 02:32, Henry Wang wrote:
>>>>
>>>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>>>> index 33b038e7e0..39218cf15f 100644
>>>> --- a/xen/arch/arm/arm32/head.S
>>>> +++ b/xen/arch/arm/arm32/head.S
>>>> @@ -83,6 +83,25 @@
>>>>           isb
>>>>   .endm
>>>>
>>>> +/*
>>>> + * Enforce Xen page-tables do not contain mapping that are both
>>>> + * Writable and eXecutables.
>>>> + *
>>>> + * This should be called on each secondary CPU.
>>>> + */
>>>> +.macro pt_enforce_wxn tmp
>>>> +        mrc   CP32(\tmp, HSCTLR)
>>>> +        orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
>>>> +        dsb
>>>> +        mcr   CP32(\tmp, HSCTLR)
>>>> +        /*
>>>> +         * The TLBs may cache SCTLR_EL2.WXN. So ensure it is 
>>>> synchronized
>>>> +         * before flushing the TLBs.
>>>> +         */
>>>> +        isb
>>>> +        flush_xen_tlb_local \tmp
>>>> +.endm
>>>> +
>>>>   /*
>>>>    * Common register usage in this file:
>>>>    *   r0  -
>>>> @@ -254,6 +273,7 @@ secondary_switched:
>>>>           /* Use a virtual address to access the UART. */
>>>>           mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
>>>>   #endif
>>>> +        pt_enforce_wxn
>>>
>>> Can you move ^^^ to before "#ifdef CONFIG_EARLY_PRINTK" so that the 
>>> MMU related functionality are bundled together?
>>>
>>> Also AFAIU, mov_w has not effect on pt_enforce_wxn().
>>>
>>> So that I can create a function "enable_secondary_cpu_mm()" - 
>>> similar to one you introduced for arm64
>>
>> Sure, I am good with this if other maintainers do not have any 
>> objections.
>
> I am objecting. It would be quite handy to print a message on the 
> console to indicate that we are enforce WXN. So we want to update UART 
> address (stored in r11) before hand.

You mean you want to add this snippet in the current patch

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 39218cf15f..282b89a96e 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -273,6 +273,7 @@ secondary_switched:
          /* Use a virtual address to access the UART. */
          mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
  #endif
+        PRINT("- Enforce WXN -\r\n")
          pt_enforce_wxn r0
          PRINT("- Ready -\r\n")
          /* Jump to C world */

- Ayan

>
> Cheers,
>

