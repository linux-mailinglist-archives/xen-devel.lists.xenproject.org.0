Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27395F6967
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 16:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416955.661652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogRai-00055E-NF; Thu, 06 Oct 2022 14:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416955.661652; Thu, 06 Oct 2022 14:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogRai-00051l-Jy; Thu, 06 Oct 2022 14:11:12 +0000
Received: by outflank-mailman (input) for mailman id 416955;
 Thu, 06 Oct 2022 14:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fMX9=2H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ogRah-00051f-EB
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 14:11:11 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2045.outbound.protection.outlook.com [40.107.104.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4cf375c-4580-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 16:11:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9095.eurprd04.prod.outlook.com (2603:10a6:20b:446::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.34; Thu, 6 Oct
 2022 14:11:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Thu, 6 Oct 2022
 14:11:06 +0000
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
X-Inumbo-ID: b4cf375c-4580-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQY8qQKXtwaxQfpFwl+gRIFUWFfUJbJNCyMbWuaeJxbQ2VzHFCM98acYw0Qdjz1Wr6fLFvTSFPc4kMuHUQYr2ec43NWBjMB8hwa86nTKBFV+4Dk+P7hHIRjRm7qNNo8BkRqZd3epAbrFeAxsEYcnR9h/fqkp3beZnMWINxyj/qXFlLFvJlYNzpBVn9817V99mXugz9hxTDigAaVtxgK1hsaUllvMQ1/2hwkBETMYt47xiAOPyrCmL/jdoNnIdPceGqh/KWHEhJ6SZWAimpFBquC2HNCKqwLNJqa0vtvkBtkebNeDdTcuTulwPHk18amQ9fBMC/4un9FV3S5qLFKE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pz1W/H2h5XtXFa0UQneZo4oi84KfpylOCNDTJXxQj0=;
 b=JWWUm/SxywWOSXINWyCJHgizQvC6ANrUdxNw2QKzsZsNRYkCmePXmg7sibGmVqrASclxWkZAQkf9sWAeYfVzqyyfirjzp1qjc/8TXuFMKfELpvgDszBhF81LyDr/Iz90EOQrxLAAC8viQHmt2o9UMkHYQ6fyDFev8zL9an+g62U21zUu+UJo48BylZRZNE4IPsvXDdwbVOTfY77Dg/Wqv2shAPdbDOw2iUSBgIBaOQ1DPeJ6DOwQLpDSx044fQxxbU7nLlbb6bviXMbg1bqrLwmd8FtE+R81ssmyovUTDnoWkA/fuTt+hP76sdX7cLrnRY7oIxNH2ZdMHT3XnjMH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pz1W/H2h5XtXFa0UQneZo4oi84KfpylOCNDTJXxQj0=;
 b=cqglidh98wiKSQHZ0IWCRSKb/BIdpxmh3L/8Vaid91Kawf0HRDVOBhITW0ydiR7tgk6viAPQxWH0DopIwVNU3rNtRy8p7o9YKcV5DWAxT7HmE5VphQb88kUektWx7jW2IVa/GnNdsaiRwfbxChsAJGZBYt2suYymR73S3fTOmUVakOWgmG/uYuhv7ID59puHBPWKajuTyxNgfAJvkLG/idGzN4+no6uFb3QGpuB4AAQQGDrFdrKzR4j93HJKI3E2+Bu+EKnLeL3WR4oJ+aPsO9gx/dEvGogtTiyo1/Wpmcn9uMG+QpABC2KLq+Ayc4OUzgNzyj0nC7XSdhDfdppgWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82963a1c-3301-72ff-e995-77c30ec5a64b@suse.com>
Date: Thu, 6 Oct 2022 16:11:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <9C12552C-0A64-433D-9F0C-5672281DD45D@arm.com>
 <73faf43d-56e2-2bbf-6336-f6420a1aa0c0@suse.com>
 <f1a71d28-ed04-0936-47e3-aa7a9f8c6dbc@xen.org>
 <0d33ecc6-898a-9379-f934-fe569cbdc8f9@suse.com>
 <3b3f6e1c-4f41-6b1e-b226-f0dd515d14ca@xen.org>
 <7d152954-4f5a-2833-f974-442c15f4e8b9@suse.com>
In-Reply-To: <7d152954-4f5a-2833-f974-442c15f4e8b9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9095:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c421f1-6975-42af-03f3-08daa7a49c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aAyyJambzmouDSzht1N5r7nSlj0AUMbbDRgdld+OHnNNcEkU3oahBjTxeqGplCaYu1NcE61DFFKf1JxHkZtvXkLIOYLIE0FxSdOTnYVIqOsb0ZwpiAFl4Z+ym3AdisCEwOulPr0BpRJ6IdOBiDpsV/xnthcJUQjB1pI3io8RGsNOGzVtie+9NMngkYa2qomtg2u8hIQaipf5JY8uGV/nhwbBa4lPos5SxfMVP3DbbDOBbaP8Ow9l7G3I1CSz4u4ianh/+RoYY1v+2LMN7OXa75scOfTMus4aRCkfz3lvqsLcR1yPBiFpNdFCnIazLRzUOu8J8rOyqhGyLABI+U8YUVTeLlHSYeADpsuQY2SnvDwnYDdP0pTZoLYBYced6jSQI4nmLp6Oq7aDqPkTq8RtlwP5yXfMDRv4Dpev56QgjCU0o01imSW2McQPwrw0GOZFHeIk1GSkvjqCBB42gVbtRLiNuZQW0DxIyswN5cJVzZIO25tZcfZWmtdx67wi2qNgy/aO5SyB6NKnl0dH35tlqGfGafrLuCEwOEB3knEt/SYql2qWnItd1RiipQl7mn/KcLXVZJ2u+dWdZcloAoMXO4JHl8y8SKLWxigVbJBKDHhrl0pMsSOW3OK6UW3zKZ1PWZhYtOjS241YvvsPqqs8Qs6CkaIoHvlmk+yJy3HpQsHMH24PK2tu9sVgpJ5vn7Ep9x63+dISkakzVPmVyqK9/8mI6prLFtPZxBuUA02sgG7qUHak2VeXlU3kagkqeh9dioqfX4Z5gG8bHNrySjjCT6r3Ag2PB7/BSRiP48bu5Zk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199015)(5660300002)(31686004)(2906002)(8936002)(66556008)(4326008)(66946007)(8676002)(83380400001)(38100700002)(66476007)(6916009)(36756003)(316002)(41300700001)(54906003)(6512007)(26005)(186003)(31696002)(86362001)(2616005)(53546011)(6506007)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlAzSEFIbGtwby96bU92Ump5U0I5QmRubkVTNU9IVVYrdUdJK3ZpYWZnNC93?=
 =?utf-8?B?bStOS29HQVY2Q2FlRDRKdHlpcjRSVVIzRDRCUnpaWVU5Z0IvQVZOZHc0OSti?=
 =?utf-8?B?ZXBOVlRBamNVWVliYzh5ZkRlQWh0ZklRZEE3eWEvS2FJVStVRUYxclE2eVJJ?=
 =?utf-8?B?YkVYbDhVOUV6TXNpeVNtaThOd0FUMjJNbUxyajFNTlRGUlRNYlR4RHdMSmFo?=
 =?utf-8?B?OGJUUVhWT2VrQ3hlZ3RxZVVTTm5obmVzakhEMWMyMmFieENtQUpzOHFDbTZX?=
 =?utf-8?B?QUtBbGtaUVRhbVRtTkpmNjFrUit6OUpERW9TUk9xZzUzTHVWTVptNUsvVmJI?=
 =?utf-8?B?OFlHZDVUMWwyeWdVT2tZaytJZXdtTGlWRXhiZzJNUC9ONTlLdExkVHdCeGRI?=
 =?utf-8?B?OGJ1TUhLaklDVnRsTnJDMURKN3UvR1pLSUNZMXA3V3JNZkRaWGNFUGFjcWhE?=
 =?utf-8?B?UzlqcDdaWit5aW5TY1RFbXdNOGtNeXk4a292UW5BM281U2ExUFczY2JuT2J1?=
 =?utf-8?B?MmFQMy9obFA4aVFqWmFlVG51aUNJVEVjWU4yZGliNm0raU5FUU1wTW5Vb1cw?=
 =?utf-8?B?Vzc0OGxGVFJkajRCR0JNK2VFMHdwZFJ2Yng0aEJOVFdlVEQwUDBqTkJNKzRj?=
 =?utf-8?B?eHJlNTdsaS9SS29sUjZNUUY0ZmlJalJTa2xoL0U5TTMvTzZWS1RwSmIyeldt?=
 =?utf-8?B?RVlZRWV0cWJEL2luWmVhbGJRSWNzWEhsTE5kaTBtaUJhRWJPZ283MklaVjM0?=
 =?utf-8?B?b3REWjhjeDZRVlhkd01MRlBwZFdqOGZ0eFFsRDJPQ09ONzhpaTBnUU9odHZQ?=
 =?utf-8?B?c0JkKzlPZjV4eXFha1ExTndCU1Z6anNsWVFyQm1tUFFhMmZMUWw1ZXJyTC9T?=
 =?utf-8?B?RFNINkZpTEpJeklKaTErZ04ySFpBZmNyelJHcWFsRlQwMUVBUHQ5MFFSdUpJ?=
 =?utf-8?B?YVcxbDF5TXd1SzJ1WGQ2US9sdTQxcG9YQ1kvM1Q1YXE3bEpueW9tZVRmdXBC?=
 =?utf-8?B?c3RtRGdKZVdPWjFpa2duMnhTK0tPdTJicWxOUUJnS1ROTkVwbm04NDNSVG9O?=
 =?utf-8?B?SHJkQUQ0bTIzWVZ5Mmx6cis3MjNBTFZnL1NKazhYMFROQXp4MnZvbTNnM1Fw?=
 =?utf-8?B?ZnlYOGRhMW0zQUxPRWFEb1E2ODJOVTV0eEE2K1dZZ1M5aUN4OGJ0eEdqa3RL?=
 =?utf-8?B?aHVYN3R1NGY3S3JwUkNscjFTei90L21jK2ZZZnBJSEswanVXS0IxSGNTM1BU?=
 =?utf-8?B?dGdENEhCRWcvUERnUlJYeTNyVVFVT3Mra2Q2UkFoOVRrVVVIY2tvTXJ4ZzRp?=
 =?utf-8?B?aTBwcWNTVWNPZjhJRXlucVlEcVBseVF6ZVVVQyttSm5LQXRKeW1CQ0hRaDg0?=
 =?utf-8?B?RlJrSSszYTU5YWx5SWs3d0tnYzZyeXViNXcySjNoYjdMMlkxckhjMmVibzR6?=
 =?utf-8?B?VjYyZlJkUFdDWEJUaTFDOHNHYUpZaEQyUzhLODQ4WU02aHZ4MmFlaVpCNGRw?=
 =?utf-8?B?ZFB6RTVDOGdSZHhiWCtlbVZiR2lvSDJxcmVWMG1USXZNREhIOHFvdGUzNjVT?=
 =?utf-8?B?UVpSeHBBZXVlNDAxTlNsemgyRXJndzVKd1NEVUNRa1ltcnJoUjhzUEdZa0Ri?=
 =?utf-8?B?cXN0a21jbkVZUXBYNC9BNTlGZnUzR2VETElCbk01ZkFLUWR6V2dKRlNsOE9m?=
 =?utf-8?B?VTBZRDI3ZDdMQmlrWGlwUldBR1VIUVRKS0xXWWZzdis3eDY4WUZWS0VZWXJu?=
 =?utf-8?B?RlBHWmN3a0U4bWRBNnFjcTdqWWc4QzZVUlJpaCs2TVVkNWtGeTBtVGlDcWU2?=
 =?utf-8?B?bFpuaGNYNGxpYVJ6RDhVWFdhSmQwSmEvZ212bTNvNGF6ck9iTmxxMmZEdUkz?=
 =?utf-8?B?VjlBaVBoZnYyNkZNejBxQVV5ckE4MHkrSm9JcVBUNHkxd01ZRVd0WmsrR3c2?=
 =?utf-8?B?Z2JXNlo1MFlkc2t3eEpOcmJycnRldnBtU2RTUEo0NC9jYStJR01OOVY0d011?=
 =?utf-8?B?S0k0QVRneERDYXBpSGNpOFBwZk9kMThBODZxOXR2THFhWWlueExQdmxkNm1S?=
 =?utf-8?B?S0lYUFg2anNvem4yc3pnL3Nrd1ZpWlhma3ZsOXVtY1p1WEMvTDFiTE4waUNL?=
 =?utf-8?Q?qlKOClfiOtal6TzzrDUdMH+K2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c421f1-6975-42af-03f3-08daa7a49c39
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 14:11:06.6616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iexmPuzBQsj+a4B238QY6lGk5ZDqAYGxttdvt9xI0wMVTwN4dHO9HgW5PxeJA8E7XdJUMGxnaOYDv16Ji5bKKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9095

On 06.10.2022 10:39, Jan Beulich wrote:
> On 05.10.2022 20:09, Julien Grall wrote:
>> Hi Jan,
>>
>> On 05/10/2022 12:55, Jan Beulich wrote:
>>> On 05.10.2022 12:44, Julien Grall wrote:
>>>> On 04/10/2022 16:58, Jan Beulich wrote:
>>>>> On 30.09.2022 14:51, Bertrand Marquis wrote:
>>>>>>> On 30 Sep 2022, at 09:50, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>
>>>>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>>>>>>> higher priority than the type of the range. To avoid accessing memory at
>>>>>>> runtime which was re-used for other purposes, make
>>>>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>>>>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>>>>>>> E820_ACPI memory there and hence that type's handling can be left alone.
>>>>>>>
>>>>>>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>>>>>>> Fixes: facac0af87ef ("x86-64: EFI runtime code")
>>>>>>> Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>
>>>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> #arm
>>>>>
>>>>> Thanks. However ...
>>>>>
>>>>>>> ---
>>>>>>> Partly RFC for Arm, for two reasons:
>>>>>>>
>>>>>>> On Arm I question the conversion of EfiACPIReclaimMemory, in two ways:
>>>>>>> For one like on x86 such ranges would likely better be retained, as Dom0
>>>>>>> may (will?) have a need to look at tables placed there. Plus converting
>>>>>>> such ranges to RAM even if EFI_MEMORY_WB is not set looks suspicious to
>>>>>>> me as well. I'd be inclined to make the latter adjustment right here
>>>>>>> (while the other change probably would better be separate, if there
>>>>>>> aren't actually reasons for the present behavior).
>>>>>
>>>>> ... any views on this WB aspect at least (also Stefano or Julien)? Would be
>>>>> good to know before I send v2.
>>>>
>>>> I don't quite understand what you are questioning here. Looking at the
>>>> code, EfiACPIReclaimMemory will not be converted to RAM but added in a
>>>> separate array.
>>>>
>>>> Furthermore, all the EfiACPIReclaimMemory regions will be passed to dom0
>>>> (see acpi_create_efi_mmap_table()).
>>>>
>>>> So to me the code looks correct.
>>>
>>> Oh, I've indeed not paid enough attention to the first argument passed
>>> to meminfo_add_bank(). I'm sorry for the extra noise. However, the
>>> question I wanted to have addressed before sending out v3 was that
>>> regarding the present using of memory when EFI_MEMORY_WB is not set.
>>> Is that correct for the EfiACPIReclaimMemory case, i.e. is the
>>> consumer (Dom0) aware that there might be a restriction?
>>
>> Looking at the code, we always set EFI_MEMORY_WB for the reclaimable 
>> region and the stage-2 mapping will be cachable.
>>
>> So it looks like there would be a mismatch if EFI_MEMORY_WB is not set. 
>> However, given the region is reclaimable, shouldn't this imply that the 
>> flag is always set?
> 
> Possibly (but then again consider [perhaps hypothetical] systems with e.g.
> just WT caches, where specifying WB simply wouldn't make sense). In any
> event, even if that's the case, being on the safe side and doing
> 
>         if ( (desc_ptr->Attribute & EFI_MEMORY_RUNTIME) ||
>              !(desc_ptr->Attribute & EFI_MEMORY_WB) )
>             /* nothing */;
>         else if ( ...
> 
> would seem better to me. However, if the mapping you mention above
> would be adjusted and ...
> 
>>> And would
>>> this memory then be guaranteed to never be freed into the general pool
>>> of RAM pages?
>>
>> The region is not treated as RAM by Xen and not owned by the dom0. 
>> Therefore, it should not be possible to free the page because 
>> get_page_from_gfn() would not be able to get a reference.
> 
> ... the space cannot become ordinary RAM, then such a precaution
> wouldn't be necessary. After all hiding EfiACPIReclaimMemory from
> Dom0 just because it can't be mapped WB wouldn't be very nice
> either. I guess I'll submit v2 with this part of the change left
> as it was.

And while already in the process of committing the patch I came to
realize that if the WB conditional isn't supposed to move, isn't
the change done for Arm then wrong as well? Shouldn't it then be

        if ( !(desc_ptr->Attribute & EFI_MEMORY_RUNTIME) &&
             (desc_ptr->Attribute & EFI_MEMORY_WB) &&
             (desc_ptr->Type == EfiConventionalMemory ||
             ...

leaving the EfiACPIReclaimMemory case entirely unaffected by the
change?

Jan

