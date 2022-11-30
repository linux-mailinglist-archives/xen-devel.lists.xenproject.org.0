Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DCD63D999
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 16:40:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449963.707028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0PBz-0004mj-9c; Wed, 30 Nov 2022 15:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449963.707028; Wed, 30 Nov 2022 15:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0PBz-0004jH-6j; Wed, 30 Nov 2022 15:40:11 +0000
Received: by outflank-mailman (input) for mailman id 449963;
 Wed, 30 Nov 2022 15:40:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bCy/=36=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p0PBy-0004jB-D3
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 15:40:10 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44273ee9-70c5-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 16:40:08 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4122.namprd12.prod.outlook.com (2603:10b6:5:214::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 15:40:05 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 15:40:04 +0000
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
X-Inumbo-ID: 44273ee9-70c5-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aA/4V+R096bOZw7VP6c6KTnvid8j2iOZXqGW/dAQdxRC1s3QM2ftb5z8MXETNS8YrCOx5VgIthmRthcVr8g4GTOPJKAhJl/Auv+sQnyJxupIGRezrwOYPj21HnQiQ4fLDskg8OcUQ9532e8p1Bi396Te+k48nEw4r1elyuCZaJM5tO42n/qJK8yAs7Phx+osv3bvIEjiu31jdzjlCZP1kps/WOGvViJv/Iguo+gq/XLI6z6Fg1VGJagFVCD2+TXjn8yXesZXSThN0dScLbGOCujHk47CcnaGolSZLbFs/h4awJVn1guPtS/RuscChlNL9pcoCURuE8/DfUE0h9MFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBPPbwHQ/BQhnGWLh/VK0JmYCz9NG3kdBrOefXvuwQs=;
 b=l7G0OCo7d//lRCaPY2TwWYmUM0DEBivegW8bB/z6PYv1D+vbt0sNTwOJc3m2USasb7k/omMla4prX1GKCf0+XPgwQnpaGTJht01wKyZiwPxXDmZ7na36EKEoQ+pdGaIdTfzBRaNzCwAlibkQTVwySyjUOCdcnsQkVd2J+0B6lLzbP0ZPLTbdFFcfWKHRRA9Tt9xTmIAc4OrExFqDeEwvjO58j2cOt8wYQm4RYwJCbucI0sEDemTdjfgQk+Eccd82FrMkDDsyoRg3vgQfn/nlqDqutLof/4PA8tumKbepi93L5qTKnYco3sPHT5uAkT8wJEN4tmXtturE6LQxgcumCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBPPbwHQ/BQhnGWLh/VK0JmYCz9NG3kdBrOefXvuwQs=;
 b=c6VK0+nAt5OrsA1v1sqATv4925HLZsDBTJCJHlJr1fYq9tthicSPMaYyguCcMjXA4gusK8sq72Yb9HQm2XhMtkce29xgb/rMK3XpPn0WbjzOp+eGO18xKb3J+ZIr9IpH78peHnDZxpybuHv/zXPOdLL9oAOuxmF2ph+8D+Lz0gU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4e84c85c-7e2f-38b1-a235-5323a77738e7@amd.com>
Date: Wed, 30 Nov 2022 15:39:56 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: Arm: AArch32: Need suggestions to support 32 bit physical
 addresses
To: Andre Przywara <andre.przywara@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Vladimir Murzin
 <vladimir.murzin@arm.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <70651dbc-085d-706d-17d0-a419086a0700@amd.com>
 <a352eb18-0ae6-a1f3-08e6-87f53494ad8a@xen.org>
 <65891843-db28-e5dd-6e9e-3fb003fcabc5@amd.com>
 <ddeb7a03-cab3-2a26-7f64-3a1b5f0882d6@xen.org>
 <105a0d45-5b3d-7986-92c1-9a13eb803bd8@amd.com>
 <22d28805-8889-25e9-6d18-c868bf5e51bb@suse.com>
 <20221130131316.13ebf9d1@donnerap.cambridge.arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20221130131316.13ebf9d1@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0226.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::15) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4122:EE_
X-MS-Office365-Filtering-Correlation-Id: b1778186-3545-4291-16cd-08dad2e926d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Nu/T9ZdtKp8b58mQDV/Z+LkL8Uw3Cyj5WZCV5OTQq2UkGJBEmeREh+VpMuEOgjpIf5ihEVuBUWKFEHMZNzo2Th7bvNTRSUDIn89A+AoAXRiFfGvpvRXEOs+81Q+WZqX42dUVu/OxRmGYm6fE5+DHVxAyupg63E6CEhYotAgk47EGz2W68jARZVbYM4kdUHeuXUuJNA/pY2IEWKHAzJTkN7+ZvOzN+EgA92IOZ3lckkKIAi9L5RHqockBj5YjlbiSA9N46I5UcPIFAAFVAgZVYNqyID3XaeDseTPAJEl4IUAQ6FSp+eFyjHxPJlGATzoW39YZuWzSW6X14gTZp0pnQgT2dwea5O4PqV1n2aMDF4JEP0r/JyjTrXfpcpbaP+/uuff7VAWkOmiSzItSf17+9uVfNM+Ecv+w18bsNknOEjKVE6z/JGghx+pdC4elkkkqYQLQ2L7YC3G1hzSbff+V4EGCjkvUMaETeDSrXzAOzhRJP9FifvQBypWa74xJ0XVP+Ajb4L2K3623GvUuFXYwEYimD+UxCgLDKcbAOfHtzklHXefEGrxZnMHJVKM3GZh1lYVNrjABN9mujE2NwW/UF7hqZ5JREogW0eIuctGyjOZL0mmnczCT6uxFDO3F6PyOJqSoSztV4omUjMKL16v4gDudg4AtkKnv26WuxVWQNhqagSEms0ntxHlFxkQ/qVEuZNKdQ++m0ZLba+zzarFmwCFuaxiLJQsQ63ZwGPnWNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199015)(6506007)(2906002)(31686004)(66899015)(66476007)(4326008)(66556008)(41300700001)(54906003)(186003)(36756003)(316002)(8676002)(110136005)(8936002)(5660300002)(478600001)(26005)(66946007)(6486002)(2616005)(6512007)(6666004)(31696002)(53546011)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ry83T3hta2hsSjFCckpMR09IN3BkK3RLeFl3TDJoSmdjaU4xdStyeE1BSzFO?=
 =?utf-8?B?WjltQUUwRXlaVmhQd2ljdE1MQWp1R1RQcDRvU3ZCcmZvemxMVWx5Sk44aFdP?=
 =?utf-8?B?TTl2NVpZVHpaMTRoZFQrNzVTbCtBRjM5bHFBZjByK08rWXJuZHJsZlluRWI2?=
 =?utf-8?B?T0crUWpKVStxNks4aFdnZll1bDI0T2ZZZGp0UmU5eUlXaG1wYzRuZm9zeXFC?=
 =?utf-8?B?dDlMUmRPa05LcDZvYm1UYzhYQ3l2SXNENTZrTGpaZ2tIUTAxR1lZelp4YkJv?=
 =?utf-8?B?YlJOdWJhNzArcFBPdzNRNmN4Y2UzUlRtc056SGQ3bmNvTWQ5QVhpa1VyYjJ2?=
 =?utf-8?B?RDNqOWZOZVZKVlFkd1hxWTlWUDBMWXBQM3VNRzkzcGpyd1h5M09rb2RsdHho?=
 =?utf-8?B?cXBLc25HcTRBQWtaRThiTEtLbHNUSGRKS2F2M3I4YitwY3JidTB0MGUyNE1J?=
 =?utf-8?B?a1JHT3VHYTNQcktzdFdqSXBMMzhwU0RWMVpMbGFFVExhZFBqNG1GK0VTRXJk?=
 =?utf-8?B?Z2E2RWs5YjJyYWU2MDB1WXByNHc3UDFRTmpFSEROaURzQ3Y4dGtLSmhmVmtv?=
 =?utf-8?B?S0FsU0NKZWNBMC9HZEd5M0VyTFpPUHNqVkRzU3ZybGtOaEpoWGRpbE15aUc0?=
 =?utf-8?B?QUVTLzAwdC82ZVgyUWtzdHcrajJwcUJyZEh5QnVoUzVxNFlMMFU0S2VlL0tR?=
 =?utf-8?B?SzlVNkpLb2VoOE15UFZyKzcrYnZvazBzcEljMFhXZEFNYy80cUpiVnFkMzgv?=
 =?utf-8?B?OVhtYUhRQkw3eW56VmJSRnQrenN0K1l4aklxUjk5NVdHTmE1SHdTRnFuRmpz?=
 =?utf-8?B?cDNvU1JEblhXZUFjNEhwa3J1R0draTliZU9MWWtDdU9EN1hjRjhwbzhjZ0xu?=
 =?utf-8?B?R1UxUDNWVms3eDZUb1Z5ZWcwdTBpRWR1MjB5dWdOREt5a1VqbndlSW95S1FP?=
 =?utf-8?B?Q3dYUUE4bGdVVnF4MGRiZUVUN09iV25JL2V1cnFLT0dWdW52SU4yZGRGdVpK?=
 =?utf-8?B?c2R3QmNEV1lvN1hRaVE3S1phRkI2NXYrZWFTRTI0RU5QUUlJaEZkeE9sMDQy?=
 =?utf-8?B?eEp3RG1EckN5dE5RQ2ZuZHZwK1FkYlNwWHhHZjdmR0xmUkRBcHMwM0lCUjRI?=
 =?utf-8?B?aDkxbEk3VllFN1JtRk1RZkYwR2dhRkxlSExyY0loNFdHVEFCb1c3SzRGRHRH?=
 =?utf-8?B?cXBjYVdJVWhDM2tQQnUxclpkNTNrOG1UZjl4aTVHOVZSNmVuSTM0WGFiSy9F?=
 =?utf-8?B?VnR4bDFoVWYxZnZWTGNFUDF6Vm0xQ3VUQkkvb0xHUk5UWGxFTUdNWEg4THMv?=
 =?utf-8?B?ZElqam52WkFWdzRjQ3dyRUJoWjhQcGhUWTUxYVpLTzJ4UnliazBreWpDU0pN?=
 =?utf-8?B?bWwwa3pjSVpoandGS0hZT1hWM3F0NzluVU1SNjFwRXJLY2VpYnRHbW8yS2Fy?=
 =?utf-8?B?YTdGZ3Vaa0YyYlFtbkhaK1h3ZVdwRzlnUXI0ek80YzE1ekhYNC9ya0NTcHQ5?=
 =?utf-8?B?MVowK1I2aktyYWRjNnh1ZnBGZUdGMXhYNllRaEZiQ0JYSHpqTUxGTGgwMnFw?=
 =?utf-8?B?bDRjaTl2UGplWTUxTGpPYnB2a1hXeDVSTkhrejJvSVhObFJoUzM0VS9VSXVm?=
 =?utf-8?B?NnVDT3pieXFvY05MNXg0d05PYThDRTJVMWFrS3UyOTJGRjRGS05TSHNZOERx?=
 =?utf-8?B?dUJGOVpjWUJMU2lxVUh3QkU1aCtaL2t0QzNtdGdWVG1KRVZkeXNKL3RrczhR?=
 =?utf-8?B?OU84Z3VWV2lWWENJMkNMR2twd3BMRHp5L2pvVmtoZFB5ckVFdVVYMmxKWXZQ?=
 =?utf-8?B?NmtPU0U2QmlHRWRLMVA5elF5eGdMNkV6eXJiUyt4QnZyaXRxYXoyckdhWlQx?=
 =?utf-8?B?NlRRbzZuenpqZFJocWpxQnZDSDUzWHJnMUVNQzJIaGhGN3hMSlg4NnVKREhl?=
 =?utf-8?B?VnBCOGJ0cVRUcTRGaExUeGZRZlluYVFhek9Ha0sxYzVhSk5oR25UeGg2RnRT?=
 =?utf-8?B?ZTJFTGd3N2NnQ3Y2bXc3WFB0SnIwSXJOUmNRWVl2OTFwSnAzRzFOYTZSZnUz?=
 =?utf-8?B?QTZqS1pnVm8yRkh5NTkzRXlDUkhMY2plbytrL0c0cHMybWhKZ1JkeTNwbHJz?=
 =?utf-8?Q?KGhT1vQS+BM/SlHdNclM4Lfp+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1778186-3545-4291-16cd-08dad2e926d6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 15:40:04.8999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04p0IdkmzzaAGXyJ+cQEDvqgJ3L5MQFINjWaSEYzN9LFvz52spazchQCUj9/BlPqc39DY1cnYQzzzfsov+21/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4122


On 30/11/2022 13:13, Andre Przywara wrote:
> On Wed, 30 Nov 2022 08:09:53 +0100
> Jan Beulich <jbeulich@suse.com> wrote:
>
> Hi Ayan,
Hi Andre,
>
>> On 29.11.2022 19:18, Ayan Kumar Halder wrote:
>>> On 29/11/2022 15:52, Julien Grall wrote:
>>>> On 29/11/2022 16:23, Ayan Kumar Halder wrote:
>>>>> On 29/11/2022 14:52, Julien Grall wrote:
>>>>>> On 29/11/2022 14:57, Ayan Kumar Halder wrote:
>>>>> --- a/xen/common/page_alloc.c
>>>>> +++ b/xen/common/page_alloc.c
>>>>> @@ -2245,7 +2245,9 @@ void __init xenheap_max_mfn(unsigned long mfn)
>>>>>    {
>>>>>        ASSERT(!first_node_initialised);
>>>>>        ASSERT(!xenheap_bits);
>>>>> +#ifndef CONFIG_AARCH32_V8R
>>>>>        BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
>>>>> +#endif
>>>> BUILD_BUG_ON() are used to indicate that the code would fall over the
>>>> check pass. I can't find the justification for this change in the
>>>> commit message.
>>> I had a look at the following commit which introduced this, but I
>>> couldn't get the explaination for this.
>>>
>>> commit 88e3ed61642bb393458acc7a9bd2f96edc337190
>>> Author: Jan Beulich <jbeulich@suse.com>
>>> Date:   Tue Sep 1 14:02:57 2015 +0200
>>>
>>> @Jan :- Do you know why BUILD_BUG_ON() was introduced ?
>> You've cut too much context - the next line explains this all by itself,
>> I think:
>>
>>      xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);
>>
>> Clearly addresses used for the Xen heap need to be representable in an
>> unsigned long (which we assume to be the same size as void *).
> So I am wondering why you hit that code for your port in the first case?
> If you check, then ARM32 won't pass this, because PADDR_BITS is 40, while
> a long is still 32 bits.

But, PADDR_BITS should be equal to 32 for R52.

Refer Cortex R52 TRM, Section 2.2.12 "Memory Model"
"...This is because the physical address is always the same as the
  virtual address...The virtual and physical address can be treated as
  synonyms for Cortex-R52."

 From this, I understood that as virtual address is 32 bits for AArch32, 
so physical address will also be 32 bits.

Please correct me if I am misunderstanding ?

If this is correct, then ...

> So digging deeper this is code for the case when we want to map the entire
> physical memory into Xen (the Xen heap, or direct map in Linux terms).
> Which we cannot do for ARM32, and that's why the code is protected by
> !CONFIG_SEPARATE_XENHEAP, which is forced to 1 for CONFIG_ARM_32 (in a
> hacked up way, btw).

we can map entire physical memory into Xen as VA == PA.

- Ayan

>
> So I think you must just force the same thing for your port, then this
> code will never be compiled.
>
> Does that make sense?
>
> Cheers,
> Andre
>
>> But I'm afraid there's further context missing for your question: Why
>> would that construct be a problem in your case? Is it just that you'd
>> need it to be > rather than the >= that's used presently? If so, why
>> do you add an #ifdef rather than dealing with the (apparent) off-by-1?
>> (I say "apparent" because I haven't checked whether the >= is really
>> depended upon anywhere.)
>>
>> Jan

