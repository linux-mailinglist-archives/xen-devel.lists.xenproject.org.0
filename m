Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F75074AF17
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 12:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560401.876311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHj4H-000068-V2; Fri, 07 Jul 2023 10:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560401.876311; Fri, 07 Jul 2023 10:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHj4H-0008VJ-RS; Fri, 07 Jul 2023 10:52:05 +0000
Received: by outflank-mailman (input) for mailman id 560401;
 Fri, 07 Jul 2023 10:52:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHj4G-0008VD-Td
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 10:52:05 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e83a534-1cb4-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 12:52:03 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 10:52:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 10:52:01 +0000
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
X-Inumbo-ID: 4e83a534-1cb4-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8+fgSBTVTQmsNEGwzZUN5tGeFfy4d4bibOGItuEQ854L1Iqe8dHlWf7dUD6m43ORpOAD/X0vNhzfCf9CU4DOPiGomuMA4bXRYXGL7EARsV3jiE2saniQCRxvTIOf1PK27r1LN8qRE9WZQEOnArcMRvfYq4cUN3WkiCWOSujoxY6jjBkmlVxamnE2rBRM7oDk3iGhdrJrCMV+AN6uUWQW6dTUnUNT64NBss7H+pKfHvAC8HLaugeJP99IoGwQBHhCoY1jlwsY2WQXr3Xh6nMKpyFBpqBMnrM2+VY5bV3L8W8ax/1q9Y6IyGvahVgUZ22HxTLzcM9GbqY4x6VNZ+ZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BL9+aXTPNJDOZDtEI32Z7FIa/ntG4R26DDAHnoR5PAc=;
 b=IIBSAmboGSK66Q4c9gD6CK+N2KME8Gh12+H0Wa3CIhfrYtQqLvR0TLT3F5TbkKBKPHGUOMXXAbRU/lLtQKUbSjf5ip4QkSYHcibVomm1OXtlhIC8VItJhnaOEA3AHNAuKO8sHZm/R4CqMcb/4PiG8bSW2F6mqk8e7UwJsDJJ2wPYQkKlh4eTeeWqQzz90uTt5rSxX4jNt7c9jYyE+w2ufYmHaQ4fEp/ywukXnF+EFIDSPRkbkT3a0ZRZQ3HXR/R0SLVHcn6Hkt2K+hnz2qTH3r3wnn1xBYPhoU7so0YboEecF5BvwHJLBLJu2Dgpl9hmJjzzifbWGbduyPzndo44ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BL9+aXTPNJDOZDtEI32Z7FIa/ntG4R26DDAHnoR5PAc=;
 b=ejJKLAAC5PjxK+Pl+ZpjsAy5aEekA1PWPlPPBnQCuTk+1c+ehIeNP87u5VD3RT0FJc+RFwl0IbfJ8myEPW4+T4Biy5kRtykE1nawvUnUpe64Wxdy1GX2CWHM9OqbvBmcxQtdFXNA/1Q/+XrdXgEhaFBtZxFKFsK2KY2yhx46AVXwmq8r3ygI9pcNTTbYUGLagLGE5kSIGYgGVR2goXNzTgVJ8CYSi4xHwwFzl+v4tNeA08T683t1hTX7F4g/S14Ved0SfRq2YAwEfDY6VZ0YHR0DgI8+Gv8XUiCwrNM4MDxOBcrufHNM3ExWGJ8q/CUyVJqnci9gamw4KH/MgKWF+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69699edb-78b2-336c-15f5-2b243257852e@suse.com>
Date: Fri, 7 Jul 2023 12:51:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/6] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
 <21d8ce65f718bc10c2213688f79cf5f978bcaf16.1687178053.git.oleksii.kurochko@gmail.com>
 <67df28ad-060e-07d5-acf2-02c3cd5f0b96@suse.com>
 <1edb0c61a8ef64bb47809049252e9ad7b19f4bbe.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1edb0c61a8ef64bb47809049252e9ad7b19f4bbe.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e59888-081e-496a-ed0c-08db7ed831a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wL7zdzW7sSA5i7YFLG2X5Te0EihZJ2TYeFXyf9aMOiMqlkuX5ZwT4+bLd+7aHrUYbnI/1PWClzq/LgczIaUqldhT6yl1LwATfjLRSdTlHNGul3LSNn7MECoPJ4oNFOGmLaDaskn//s1s0OUSOJ7KQ7yfGwdWEYYcFp25X7wOvJPq7Uz6JWSUJNT4E6rjm4n+KSEGFuuhsH0gDzpLJo61rQzdV/Crmn7r3QK5KZKdBUO+DyqW3QNKXOByDoJ+NOOztwx6i/MNxORxb7Z0zsJRiPQ2vioizbv3CgAK0yJ4IvvEYNknTbv4wjT3v3JNBrEFVY2ws9NjqTGCxZlh763s9OKBV8iLb4TcK38eQO5Oc0ZEGEf9FrtkEwe9DPOhHytxCSyEg2sDwtj7M2KuAye1/cFLKXGGpkiM0OqQM1rWMyx3G0QhQLIZMeh2uzbr7W/88fADOrEz0tL7kMn6FaGN+CKuiV3moutz3RRVAmiPU08Cje0H8M74GWrN2RB5Fofab65MqP3Zi5pWcBNbQGy2Uun+lkCztt9ARhqUqfSdRS7qyty1W0Ugoxd8SlujZUWiQULC7AlnyEp+/JqvsAmB/Ci+j7py5GZQpQVc7MBp5h6jx8kusso1DqW2nL2N/IKHaxFLNIAEMJKN2l0XwVMBqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(38100700002)(36756003)(31696002)(6512007)(86362001)(6486002)(6506007)(478600001)(186003)(53546011)(26005)(8676002)(8936002)(41300700001)(5660300002)(31686004)(54906003)(66476007)(66556008)(66946007)(4326008)(6916009)(2906002)(316002)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjZlM3J6WWoyaUY3Y0hLTU5kbjYyOWVQQmpqeHAzMkx2b2kyU0hHWnRiWktw?=
 =?utf-8?B?dGZ3WW41djRzUncxdmkxdVlpeWRoVEE2Nkc4R1R0U2hNT0xzWVQ1ZVF1dzA2?=
 =?utf-8?B?dGdyd1lxRzl6QjlXaG5obUtpdmkrTGtsN0ZuU05GSmFmMGpRek42b0VCNG85?=
 =?utf-8?B?WjlrNmZja2ZIaER0NkFnMG1IaTF5NHJUUFhta2lOelBzU1NrZVZMb0haZmV2?=
 =?utf-8?B?OUJZeE50REkxUWFOUytjTnA1LzdiTUViS25GRGw2WWNWVk9MUEZJL05PUllC?=
 =?utf-8?B?VmdTTkZhNnp1MTdERFMyTXhlQnh5cXNPSW9iYVZwUW5IeXNMbVJHODl4M2U5?=
 =?utf-8?B?anZvVmtud0RWaFJ3WVptTnpvMXdhSGN1ZXQ5WDlRUkd3cUlmb0c0Sk16V3hO?=
 =?utf-8?B?Ykx2WklDaWp2LzFMZitnL0hVNkpyV0FQRDFnU0R3S29JTlQ4VThNbHNPQ3cz?=
 =?utf-8?B?bTdNTTZFNFpmVWtzbVpUNlIvWnY0MFhiaU5mRFdabHI4RjJRVHVwRnhYUVZT?=
 =?utf-8?B?RmZlZWtPSWI0ZXdTdUVnUE9SYWpuSVphZE5ZL3RoTG1MRlJ3SUNsTmN2V0o1?=
 =?utf-8?B?RG9FQWRrU3ZVSlM0aFByanlKNXNmZHRmRTNEK3F6SUlMOFRXeERxUVV5bGM4?=
 =?utf-8?B?M08xeWpiTm9yVzlya201RHZjU0R6NUE0YmU4RU5IajErand0RU11WDhCSGJn?=
 =?utf-8?B?OUU4M2xBYUxpZzVSamoyY2ZVNm5QejlxbVhsRDZ5NDZFdDF5ZEdObkRYV2xM?=
 =?utf-8?B?UGNIcmhBa05lc21hWlNHSVZZcGJUM2JsWTBEVjJtbEcxYnVGNlRNb2pUbkpR?=
 =?utf-8?B?ZnVmd1VEVTJXb2tydWRvK3FQd3hoZDZOUEpaWUNLZXhkUXZyY2ZuUGVtTlhl?=
 =?utf-8?B?RHFCOTF4ZTZvb3JsYnQ4OFlwOUVuSzdTNGZ5WjFPQ1pZa1F1eXZiNlZ6anFl?=
 =?utf-8?B?VDZVanVHVDRONVY5ejk3TkRqL0tXbFI3YW90Z3ZSMGwycG5PQlVlak02T09Z?=
 =?utf-8?B?bGhsVWNDTFd1VUk2c3NlNDdEYkU2VzZSaDNLTmRyN3B6MkpGa2o5Sk0yUTVR?=
 =?utf-8?B?V0VSK3Fnd3NpN3lYNnUrUFhNUmY2YjlOaDF6Z1doYm9QTkVzRHFhd3JaNjlD?=
 =?utf-8?B?U2crMGJkMVZHVXB2eEVOQnlBWjdGUjFtSEdLT1NlZmNpNGFIL1Q4dml6V0Fk?=
 =?utf-8?B?bnlkajRBcUZnbmdBYXUxTjZCNjcraW8yYnhDWjBBOE9hMmE5bDVIbHNTOUZV?=
 =?utf-8?B?OWVXaXAzMzJxMFg5M1ovS3ZldVdSQWtOVHJWTkRtR0wyYWtjbkdsYXB4SFhw?=
 =?utf-8?B?eHNFazNGbmpmOUZHTisrdHdWblRSRHljNTh6VVpLS3hxTzVaMzZFNVJVWUp1?=
 =?utf-8?B?UGlzVnhjUjErV3A4bERGYjNOTzhLdFR0Nk5idDh6VlY0VGZTdmhZRTFxbTN1?=
 =?utf-8?B?akVuWkZoSTRRcWp0VHRjRngxdWt2ODVKRWh3T0t2bERGWkcwU2E2RVYyZmor?=
 =?utf-8?B?aTFvUUdxQzNvbHN6dWJ1V1dSbS9YQVBqZlgzZHFQV2dac0VSSkxFWEpRbGJ1?=
 =?utf-8?B?YWN5N0pUdnlXZlo4UEl4YmgyVFd3YWxDU0lUSFJ6K2J5UzQ3RjdUWmgzVXBn?=
 =?utf-8?B?SG9ZUVZCTFcvV1FpYldlWnRhQ2tQOTJ3M1R2RGVRajBRT2tYZmwrR014RVB5?=
 =?utf-8?B?TXl1ZGxDZzh2UGRRVVZqYVdObVU2TERpc1dmRW4zMXJwQWFnMzA4amhqTWNp?=
 =?utf-8?B?RXVRZzVMZ05Lek9KK3VXNGEwMm93VlJMZ252c3hBa3BjVkRrOUxaNkpSZFdZ?=
 =?utf-8?B?Q2ZjS1hkQ1NUZ0ozdHk3NDZFZFd6cVhUb0NFbkRDZEFaZjYxQlFLdkFNblFp?=
 =?utf-8?B?T0Z0Mkc1M0F4U3p6MXJja2JuQ0FmK0ZTSGptNUUydzVjRnhyWURJTmREY2tU?=
 =?utf-8?B?MEZaL2FNam1MTmpwUzFtYjk0ajBXclNKM0tRaEJ3Z24xdGZQekNRaFAxTFRX?=
 =?utf-8?B?WDE4NmNYTWVCYnRvVTZXcGVkS1g5Ym9Fc0o3QXBuVXhjakJqNU5UUE8xYTJh?=
 =?utf-8?B?NkluTjRZaktNcFd3RklUUU8yeEE3MnY5Nk1RcVBCYTc5WmRKelJCTFNKbDAx?=
 =?utf-8?Q?Q7AWZSMRL7B1uKwX2jg48vYiz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e59888-081e-496a-ed0c-08db7ed831a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 10:52:01.5427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98Xa2VK8f6Va/UsBEwXx7HrhfwUklul9GN2n75ie6ezkFA8wxJzSxWDMapJZY5MlC9xet7pjSLuzY427ezat+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9644

On 07.07.2023 12:37, Oleksii wrote:
> On Thu, 2023-07-06 at 13:35 +0200, Jan Beulich wrote:
>> On 19.06.2023 15:34, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/config.h
>>> +++ b/xen/arch/riscv/include/asm/config.h
>>> @@ -1,3 +1,5 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>>  #ifndef __RISCV_CONFIG_H__
>>>  #define __RISCV_CONFIG_H__
>>>  
>>
>> Unrelated change?
> It  should be part of [PATCH v2 5/6] xen/riscv: introduce identity
> mapping.

Hmm, here we're discussing "[PATCH v2 4/6] xen/riscv: introduce identity
mapping". I'm confused, I guess.

>>> --- a/xen/arch/riscv/mm.c
>>> +++ b/xen/arch/riscv/mm.c
>>> @@ -25,6 +25,12 @@ unsigned long __ro_after_init phys_offset;
>>>  #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>>>  #define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
>>>  
>>> +/*
>>> + * Should be removed as soon as enough headers will be merged for
>>> inclusion of
>>> + * <xen/lib.h>.
>>> + */
>>> +#define ARRAY_SIZE(arr)                (sizeof(arr) /
>>> sizeof((arr)[0]))
>>> +
>>>  /*
>>>   * It is expected that Xen won't be more then 2 MB.
>>>   * The check in xen.lds.S guarantees that.
>>> @@ -35,8 +41,10 @@ unsigned long __ro_after_init phys_offset;
>>>   *
>>>   * It might be needed one more page table in case when Xen load
>>> address
>>>   * isn't 2 MB aligned.
>>> + *
>>> + * (CONFIG_PAGING_LEVELS - 1) page tables are needed for identity
>>> mapping.
>>>   */
>>> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
>>> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
>>
>> How come the extra page (see the comment sentence in context) isn't
>> needed for the identity-mapping case?
> It is needed to allocate no more than two 'nonroot' page tables (L0 and
> L1 in case of Sv39 ) as page 'root' table ( L2 in case of Sv39 ) is
> always re-used.
> 
> The same ( only 'nonroot' page tables might be needed to allocate )
> works for any MMU mode.

Of course, but if you cross a 2Mb boundary you'll need 2 L0 tables.

>>> @@ -255,25 +262,30 @@ void __init noreturn noinline enable_mmu()
>>>      csr_write(CSR_SATP,
>>>                PFN_DOWN((unsigned long)stage1_pgtbl_root) |
>>>                RV_STAGE1_MODE << SATP_MODE_SHIFT);
>>> +}
>>>  
>>> -    asm volatile ( ".p2align 2" );
>>> - mmu_is_enabled:
>>> -    /*
>>> -     * Stack should be re-inited as:
>>> -     * 1. Right now an address of the stack is relative to load
>>> time
>>> -     *    addresses what will cause an issue in case of load start
>>> address
>>> -     *    isn't equal to linker start address.
>>> -     * 2. Addresses in stack are all load time relative which can
>>> be an
>>> -     *    issue in case when load start address isn't equal to
>>> linker
>>> -     *    start address.
>>> -     *
>>> -     * We can't return to the caller because the stack was reseted
>>> -     * and it may have stash some variable on the stack.
>>> -     * Jump to a brand new function as the stack was reseted
>>> -     */
>>> +void __init remove_identity_mapping(void)
>>> +{
>>> +    unsigned int i;
>>> +    pte_t *pgtbl;
>>> +    unsigned int index, xen_index;
>>> +    unsigned long load_addr = LINK_TO_LOAD(_start);
>>>  
>>> -    switch_stack_and_jump((unsigned long)cpu0_boot_stack +
>>> STACK_SIZE,
>>> -                          cont_after_mmu_is_enabled);
>>> +    for ( pgtbl = stage1_pgtbl_root, i = 0;
>>> +          i <= (CONFIG_PAGING_LEVELS - 1);
>>
>> i < CONFIG_PAGING_LEVELS ? But maybe it would be easier for i to
>> start
>> at CONFIG_PAGING_LEVELS and be decremented, simplifying ...
>>
>>> +          i++ )
>>> +    {
>>> +        index = pt_index(CONFIG_PAGING_LEVELS - 1 - i, load_addr);
>>> +        xen_index = pt_index(CONFIG_PAGING_LEVELS - 1 - i,
>>> XEN_VIRT_START);
>>
>> ... these two expressions?
> It makes sense. I'll update this part of the code.
> 
>>
>>> +        if ( index != xen_index )
>>> +        {
>>> +            pgtbl[index].pte = 0;
>>> +            break;
>>> +        }
>>
>> Is this enough? When load and link address are pretty close (but not
>> overlapping), can't they share a leaf table, in which case you need
>> to clear more than just a single entry? The present overlap check
>> looks to be 4k-granular, not 2M (in which case this couldn't happen;
>> IOW adjusting the overlap check may also be a way out).
> At the start of setup_initial_pagetables() there is a code which checks
> that load and link address don't overlap:
> 
>     if ( (linker_start != load_start) &&
>          (linker_start <= load_end) && (load_start <= linker_end) )
>     {
>         early_printk("(XEN) linker and load address ranges overlap\n");
>         die();
>     }
> 
> So the closest difference between load and link address can be 4kb.
> Otherwise load and link address ranges are equal ( as we can't map less
> then 4kb).
> 
> Let's take concrete examples:
>   Load address range is   0x8020_0000 - 0x8020_0FFF
>   Linker address range is 0x8020_1000 - 0x8020_1FFF
>   MMU mode: Sv39 ( so we have 3 page tables )
> 
>   So we have:
>     * L2 index = 2, L1 index = 1, L0 index = 0 for load address
>     * L2 index = 2, L1 index = 1, L0 index = 1 for linker address
>   Thereby we have two different L0 tables for load and linker address 
> ranges.
>   And it looks like it is pretty safe to remove only one L0 index that
> was used for identity mapping.
> 
> Is it possible that I missed something?

Looks as if you are thinking of only a Xen which fits in 4k. The code
here wants to cope with Xen getting quite a bit bigger.

Jan

