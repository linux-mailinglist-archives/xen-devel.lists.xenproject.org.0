Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06367740E3E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 12:08:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556401.868900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qES5z-0006XG-64; Wed, 28 Jun 2023 10:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556401.868900; Wed, 28 Jun 2023 10:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qES5z-0006V4-2R; Wed, 28 Jun 2023 10:08:19 +0000
Received: by outflank-mailman (input) for mailman id 556401;
 Wed, 28 Jun 2023 10:08:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NvKJ=CQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qES5x-0006Us-CB
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 10:08:17 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b19dca14-159b-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 12:08:15 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 10:08:11 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 10:08:11 +0000
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
X-Inumbo-ID: b19dca14-159b-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcjtftQEsaVGQF8CwMhyC9RM33cet8yZBYNL7xbLdN/QKKG86B6+SlVgG0LlUz2B5meL/TXheD0xy71+8osxFUvhnGM5KeMURRGX7OqtGAdAqLZNy9kC/GlKz3ERXNSYJ4hpMDWoGfyiHiRjhzPi4bWAvUdJ0Nd1H9t2UAfacY33pW/hv5ZVq9D6YZbYpAkLGFIeoX7+BORE+GdwyktBRBb8QbZWvOrMjEoeki6om4ZjX+WtJzAiwsThpIzIljEOjzIrWGEXsdVsx6YeQ0VAtZ2e9e0qu9nageTfQKbu5Qn5qCBLAccy9DLhAAAQTRgSACMaIih0xlDdIH/4nJPntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noiZ0+5Ph+APC5sRXmtvUNmu4TqKbm9LN3N2A3OKlbQ=;
 b=nuN81ww2A2NRbvSRT3pGa1jMJc3bty9T2XZLzKuU7xVRgPLXTAf935QIe7v6mqhk9UnILHJVyR/BaXhhCmckmtLrMpzeEiT0YBo2dckk4JdaPctoqzj2xfK8ExaqPM4kcC+0rq8kM8SWriJVz5gY15+j9xACOQxnGxA3Ctk6SVukh1wDkGcBBK29krekJ1wEdB6C6Z1d7ctd4iUcm3Pj5rmROMFBowmSgCOnPNtQFdOQdqluUzuSIB6mlxmAPAh9YMC30ypsFroYj4beTr+lqUyNjPdSamROi0yIxAlD7kEsdd2RsN9XVQYIXomL9Ix9FI0PRBh23De3WU3UGebW0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noiZ0+5Ph+APC5sRXmtvUNmu4TqKbm9LN3N2A3OKlbQ=;
 b=e51wKWczRJphPhs9mqK5cNkg7a8RH16Dma94UlUFG6craAQDtBE43avtX6NJFJ+9RJplKph5jYUzHdOB6jJ++NeEQ4+RGdHtXoCQvdh4jQN/A9Xn43YeW/ZlTK8ZoHOw5rtoFTii1Rk6Z2rD7YlPJZreaSHXBS1xfDYZgesddO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e6f8d79c-ab1e-565d-f87f-843af0cfbf48@amd.com>
Date: Wed, 28 Jun 2023 11:08:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 30/52] xen/mpu: populate a new region in Xen MPU
 mapping table
From: Ayan Kumar Halder <ayankuma@amd.com>
To: xen-devel@lists.xenproject.org
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-31-Penny.Zheng@arm.com>
 <864e467d-2ad8-7210-ca59-a9e34b95bc81@amd.com>
Cc: Wei Chen <wei.chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
In-Reply-To: <864e467d-2ad8-7210-ca59-a9e34b95bc81@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0383.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e29781-7a40-43b3-92d8-08db77bf944a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UA/boK67mAEMs4/sWFhvsadOrrK5aXiFfTKXczd6AN0llrVDKdZkRu3WQLv6bu++V9HsgIDtd0nCzKTu+8uLAYhRJ/8PGIiWcz0KeDchSN0DtiNnXLTIYtE16RD9faj/UYjg7q1xDkB4LljW8gBT3iuzf1bzD+CDCB1tkLWlNhdeVECe67zymbknUdtSLGivZyXric+GJxUZ4P7wx8d3BwBFjEVYLX6VbIsMbHMQp+ejwNxxX7gIAc+343nyJwaUViEkldSKqvaKDZTqQ511dJbxY084zKhgXzwt0pRUg7EONceps96XZMJlFyL8qYmdZT0UUjxddaoej8yZxhVSlQzr+2GBzyG5HE6p7eaZz2g+jUKXxkzaipXzay55nbth4znw9nRZX/DxaHluifqgeiGbRRodVeeTMyhoZSy5sZTYvb1LOzRAEdeRB0dKQRG02HBuZvp3kZxtKstITK/dMQbBc9Rsh2b7Gf6linRGGWCcrswH2x7BZ7d6V6VGfW/ScMCeW8KKrE0cr5dNAJFvWqkn0UWDUD052LsZMrhHGnUNcnw5txtk0ongVdt5cQTm3MdUU8FE5qgHE9ceNv6C7duYR3NLfnwyXCVPQeh3Q0g/Qrz5e/pM8scsaJzR+y5xy3MC+ny9oSj7dNGCEAZBxyIAe8DlpO0lqrXZs33kMaH9qPFnTlUzSzFU/TmnOevc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(31686004)(36756003)(53546011)(6506007)(66476007)(5660300002)(316002)(6916009)(4326008)(66556008)(41300700001)(8936002)(38100700002)(31696002)(66946007)(8676002)(6486002)(966005)(6512007)(2906002)(186003)(26005)(478600001)(83380400001)(54906003)(6666004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEdNdDhPWG9PU2ZJcVU5NHFmcWtYYzF1TjBER1lMMmZoamlOQjN3TExxVU9u?=
 =?utf-8?B?YjgxM3BoTHc3RExNWEYzV01LaThHZHlFUDhpUk84cWcxZk1qcHJJREt6Mndn?=
 =?utf-8?B?ZHBDZ2hnWWRKL0hMS1pzdkswdVBXODR2ZlErbTAyNXJ6TUh2Nm9aMnVxS00y?=
 =?utf-8?B?VUc4c1UrTENpNTRQeERLeWNVT3d2Zlo3M3dyOEFqZzBJSUZiNWQ4d09PaTdO?=
 =?utf-8?B?VENGenVSdjg5L2dqNXR6R3N2UmpVUWRRTUlmUytva3R3K1NRaENGWmZCdEhH?=
 =?utf-8?B?N3JZT2JlVUVyRVBDdUt1WDN5Q1drM3lYVnJCMmNmOFlZVDhHdktXd0E2Nk5a?=
 =?utf-8?B?UjBVeXRJZFpWUC9VRnJkck1kZ0JTTWVHaFNPWDM3ekpFOHFhOVEyRVRzRXNs?=
 =?utf-8?B?TjdBTmlFbEs0RXh0VVQybThlN3I0ZHZ0UVZsdHpGK3NPVWJlcmdTRzVsL251?=
 =?utf-8?B?Y0N3TXR0aEdhV3Z5Z29UTm9Fd2lWYllZSHF3Z2tGNk9xVVpFU0t5Zi8yUlJ4?=
 =?utf-8?B?NXBmM3F1M0RoWWZiY2l2WFhVSEh6clJrS09NSUJQd1JxdGpyZE5GZ2puVXgw?=
 =?utf-8?B?VkU4OU1jeEVTYlBWYkZNYUJnSUo4ZjlqT1RJdlJ2YmpyWnZXYVFkKzdxMXd3?=
 =?utf-8?B?Z1lkUEFVOGhDam1kL0RhL25YeklNNW16ZmMwWk1WTlZzclBCa29SeG1hMGZ6?=
 =?utf-8?B?Mi80WHZTMFhtbDd0czZraWV4RUxKTDRRdmNPelpidmgxZzJDbU5vVFdrYzR4?=
 =?utf-8?B?T1JHbFp1RzgrUGx2UVkwbDlEdExHdU5tZlF2a09ncXNwdU5yUzNHVDNYZ1FN?=
 =?utf-8?B?STNKSmxUeGduYmlvRDZ2UGloS1ZUVmYwazFURFJTNGZCSEtzbEhtOGhudFFr?=
 =?utf-8?B?ckRXUGJieTB0eitQVHpFdnU4YzFsY3hSaEZhNndJTTB3TGN4Y3ZMeXFyTy85?=
 =?utf-8?B?Vm4wamhqVDJyVjF1L2g2OHlhNGlxYXpBdStDU21aOUFPWVp0TC9DUmZyckt4?=
 =?utf-8?B?VGpzTDY2bVc2VDlFbC9XVGVVL3A5RVh0MTZiMkxLQ09XSm5hdVZtRExPOGdB?=
 =?utf-8?B?MTNlYVlieFJWVVdqSUhvQTRicktOTjRndVlIV2RVWm81MnVPTXJLTmliNklL?=
 =?utf-8?B?aitkTjU4a1ZlMUc3djRSbi9IWWh1TVB3YnE2YVUzVnNRU3EwcW81S3ZUVkxQ?=
 =?utf-8?B?c0tVU0hyT3I4cXNvZ0t1VTlMQStYcW82SFdPOUV6NWtvOXNBbWd5NGNhM2kw?=
 =?utf-8?B?Y2xmdGI3Z1hRS3MxNjVaQjZWUFh0c0NZVzBtdUdSYjI2SlU0eDF4K09qZUFy?=
 =?utf-8?B?aUNPd283TDljOVhKTFEvVXlzQmV1QWwzWllCbjJVMXVENGpmalRNMzVkUXlh?=
 =?utf-8?B?MGN6MnZvajgvd1B1YnF0WTRTdFNaTG03TXpoKzB0VUViTFhBT2pHUzhNVHky?=
 =?utf-8?B?TkZSQWhvdU4vQS8xRGFFa1hDZkdFaW1tVDU1QURsZzdHVDdZTEFZRStvTEZa?=
 =?utf-8?B?Vlh4KzhqN29sb0t1RVdSSUhQTEp1VENLUWNieDdCaEQrYmtNMmV3NGJ2czRR?=
 =?utf-8?B?SzdEUzVRVndONmcxQU5BRDc1SXpSTkV4MnVpZXVuQk1FYi9Pbm9zK0t6Q0F0?=
 =?utf-8?B?V0puQkVmMGxnZGduaDVwOU5oUlcyZXR2a0dHYkFua2ZoSFpjTVNDRE1Sb2li?=
 =?utf-8?B?TjdxTU90cTl5VTJqdHRGREtBOHlOK0MwL1VYV0kzSVhOYkY3NjFna2phcDFv?=
 =?utf-8?B?NkVrVVVJYksyb2V0RHBsbThsTjJTK0RYQUtxYTNWRFUzMTdZK2l2VE5WWG4w?=
 =?utf-8?B?WWQ5ZFJPandFNDQyZUY4VGlOdnhoNWJwV2dUWDVJYzY2YVR1MGlxT0xoeUpw?=
 =?utf-8?B?djFpUGNMMWNqQzVNR1l4b3RNZ25yVXh1V3lqM3FMQjUrMGhWbytoMC9tL3J6?=
 =?utf-8?B?eVI5QUJCR1h3ellndEhCYSt2R3RtUDM0M00vT1VnbVZtbW1pUy9iQitsNmsr?=
 =?utf-8?B?NlFoUkx0WDJIc2pUQ28wNHI2S1F1OGlqanVzWWVqUHRRTDVtUmxaekJYam0z?=
 =?utf-8?B?c2xtdzNObXhaUGs5WCtLczBVL3Y4RVhEb1BxSEgwMVJGZTZUUkY0dWg1VExN?=
 =?utf-8?Q?hFbvbIQh06vJlWu0PhLYOSKOr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e29781-7a40-43b3-92d8-08db77bf944a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 10:08:11.5305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnFQ9eIedX13icxAvtceqV2NrZUIg/O6qYJXmfgKfGQzHn2bPoXO9BFaNkjxQcqr9AaV3wWM5WNNURd82rrXUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104

(Forgot to cc)

On 28/06/2023 11:05, Ayan Kumar Halder wrote:
> Hi Penny,
>
> On 26/06/2023 04:34, Penny Zheng wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> The new helper xen_mpumap_update() is responsible for updating Xen 
>> MPU memory
>> mapping table(xen_mpumap), including creating a new entry, updating
>> or destroying an existing one. It is equivalent to xen_pt_update in MMU.
>> This commit only talks about populating a new entry in Xen MPU memory 
>> mapping
>> table(xen_mpumap). Others will be introduced in the following commits.
>>
>> When populating a new entry in Xen MPU memory mapping table(xen_mpumap),
>> firstly, we shall check if requested address range [base, limit) is 
>> mapped.
>> If not, we shall find a free slot in xen_mpumap to insert, based on 
>> bitmap
>> xen_mpumap_mask, and use standard entry pr_of_xenaddr() to build up 
>> MPU memory
>> region structure(pr_t)
>> In the last, we set memory attribute and permission based on variable 
>> @flags.
>>
>> To summarize all region attributes in one variable @flags, layout of the
>> flags is elaborated as follows:
>> [0:2] Memory attribute Index
>> [3:4] Execute Never
>> [5:6] Access Permission
>> [7]   Region Present
>> Also, we provide a set of definitions(REGION_HYPERVISOR_RW, etc) that 
>> combine
>> the memory attribute and permission for common combinations.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v3:
>> - implement pr_set_base/pr_set_limit/region_is_valid using static
>> inline.
>> - define index uint8_t to limit its size
>> - stay the same major entry map_pages_to_xen, then go different path
>> in different context(xen_pt_update in MMU, and xen_mpumap_update in MPU)
>> ---
>>   xen/arch/arm/include/asm/arm64/mpu.h |  64 +++++++
>>   xen/arch/arm/include/asm/mm.h        |   3 +
>>   xen/arch/arm/include/asm/mpu/mm.h    |  16 ++
>>   xen/arch/arm/include/asm/page.h      |  22 +++
>>   xen/arch/arm/mm.c                    |  20 +++
>>   xen/arch/arm/mmu/mm.c                |   9 +-
>>   xen/arch/arm/mpu/mm.c                | 255 +++++++++++++++++++++++++++
>>   7 files changed, 381 insertions(+), 8 deletions(-)
>>   create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
>>
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>> b/xen/arch/arm/include/asm/arm64/mpu.h
>> index 407fec66c9..a6b07bab02 100644
>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>> @@ -6,6 +6,10 @@
>>   #ifndef __ARM64_MPU_H__
>>   #define __ARM64_MPU_H__
>>
>> +#define MPU_REGION_SHIFT  6
>
> You are using this macro in patch 24/52 and you are defining it here.
>
> Please consider moving the definition to patch 24/52.
>
>> +#define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>> +#define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
>> +
>>   /*
>>    * MPUIR_EL2.Region identifies the number of regions supported by 
>> the EL2 MPU.
>>    * It is a 8-bit field, so 255 MPU memory regions at most.
>> @@ -21,8 +25,33 @@
>>   #define REGION_UART_SEL            0x07
>>   #define MPUIR_REGION_MASK          ((_AC(1, UL) << 8) - 1)
>>
>> +/* Access permission attributes. */
>> +/* Read/Write at EL2, No Access at EL1/EL0. */
>> +#define AP_RW_EL2 0x0
>> +/* Read/Write at EL2/EL1/EL0 all levels. */
>> +#define AP_RW_ALL 0x1
>> +/* Read-only at EL2, No Access at EL1/EL0. */
>> +#define AP_RO_EL2 0x2
>> +/* Read-only at EL2/EL1/EL0 all levels. */
>> +#define AP_RO_ALL 0x3
>> +
>> +/*
>> + * Excute never.
>> + * Stage 1 EL2 translation regime.
>> + * XN[1] determines whether execution of the instruction fetched 
>> from the MPU
>> + * memory region is permitted.
>> + * Stage 2 EL1/EL0 translation regime.
>> + * XN[0] determines whether execution of the instruction fetched 
>> from the MPU
>> + * memory region is permitted.
>> + */
>> +#define XN_DISABLED    0x0
>> +#define XN_P2M_ENABLED 0x1
>> +#define XN_ENABLED     0x2
>> +
>>   #ifndef __ASSEMBLY__
>>
>> +#define INVALID_REGION_IDX 0xff
>> +
>>   /* Protection Region Base Address Register */
>>   typedef union {
>>       struct __packed {
>> @@ -54,6 +83,41 @@ typedef struct {
>>       prlar_t prlar;
>>   } pr_t;
>>
>> +/* Access to set base address of MPU protection region(pr_t). */
>> +static inline void pr_set_base(pr_t *pr, paddr_t base)
>> +{
>> +    pr->prbar.reg.base = (base >> MPU_REGION_SHIFT);
>> +}
>> +
>> +/* Access to set limit address of MPU protection region(pr_t). */
>> +static inline void pr_set_limit(pr_t *pr, paddr_t limit)
>> +{
>> +    pr->prlar.reg.limit = (limit >> MPU_REGION_SHIFT);
>> +}
>> +
>> +/*
>> + * Access to get base address of MPU protection region(pr_t).
>> + * The base address shall be zero extended.
>> + */
>> +static inline paddr_t pr_get_base(pr_t *pr)
>> +{
>> +    return (paddr_t)(pr->prbar.reg.base << MPU_REGION_SHIFT);
>> +}
>> +
>> +/*
>> + * Access to get limit address of MPU protection region(pr_t).
>> + * The limit address shall be concatenated with 0x3f.
>> + */
>> +static inline paddr_t pr_get_limit(pr_t *pr)
>> +{
>> +    return (paddr_t)((pr->prlar.reg.limit << MPU_REGION_SHIFT) | 
>> ~MPU_REGION_MASK);
>> +}
>> +
>> +static inline bool region_is_valid(pr_t *pr)
>> +{
>> +    return pr->prlar.reg.en;
>> +}
>
> A lot of these macros and inlines can be reused on arm32 as well. I 
> have split them as follows :-
>
> Refer 
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/xen/arch/arm_mpu/include/asm/armv8r/mpu.h 
> for the common definitions.
>
> Refer 
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/xen/arch/arm_mpu/include/asm/armv8r/arm64/mpu.h 
> for the 64 bit specific definitions
>
> Refer 
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/xen/arch/arm_mpu/include/asm/armv8r/arm32/mpu.h 
> for the 32 bit specific definitions (This I can add later as part of 
> R52 port).
>
> Please consider splitting the definitions so that R52 can reuse the 
> common ones.
>
> - Ayan
>
>

