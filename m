Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EC474705D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 14:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558299.872257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGeli-0001sB-25; Tue, 04 Jul 2023 12:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558299.872257; Tue, 04 Jul 2023 12:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGelh-0001qU-VD; Tue, 04 Jul 2023 12:04:29 +0000
Received: by outflank-mailman (input) for mailman id 558299;
 Tue, 04 Jul 2023 12:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gy6C=CW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qGelg-0001qO-JB
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 12:04:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e89::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb30bd84-1a62-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 14:04:26 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH3PR12MB7761.namprd12.prod.outlook.com (2603:10b6:610:14e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Tue, 4 Jul
 2023 12:04:20 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 12:04:20 +0000
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
X-Inumbo-ID: eb30bd84-1a62-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHLeh5oAMew7CpQ+EQv8SScb8/ODd/SerzYGlfz4TLcwfM/St1QY/jDTzb6ICZcsdwl6epRTBS5EDBSbMz/7i89TtS3FZWitoKF8fUvwSk1aH8f9z1T4Dtyb2dqqvT/yizjjknKuwgkvtLlpX4oaAfhpWUU9jFJhnE3zoX57lnfsh/rvkky1O0ZODt620AEC2/jloyEIKxZcggSYwjskMwHJRRgB+h168Ipa54nliY3glq+HT6ZKcPrj2YVqCnzUXm2fGOWIM4XYp1xRs8vmZ/B9p6f1SbASBMKeR3t98qYWDQU6S982Z2btOKEu7r30oYfSyq8E6nzOu4s7F4YG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F29/bsQLsktz/PeCjS6khkJbLs7Y9CkTHYNCa6igSYY=;
 b=LuQ+ShI4imysBEH/4Bh7L6jphb4+QGufQNbdVBo8f5WHr302GeuFmwdumH2/ISZhmZLMUZauR4vxwzB6B1kt8NyaRMFzPUIH098y4vGdypgxlRAxAJUnDBRHJiVDKroO/I8NiK76wC9jC5BTQq4QOJ61GZw5yTNa5Jjx54w7DXmxRfAqaCX8+NWLjz6gD4VH8ah6GiamvChcQjcTnh5DDt514CtNeFWtQidJ4+yqnxRSpY/VaVD09BKyzHJAnQ/x9kHuijjD6j+1CrPXxpV32uIoiU0XTHZ6fEFz5CYCmBgXl1G5GeK7700Fc4A27Yf3XtQmk8n4x6JvkqWvKIxXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F29/bsQLsktz/PeCjS6khkJbLs7Y9CkTHYNCa6igSYY=;
 b=aP/TPTsx7iNBJo7h0rmsRRvm/0BoJl8BOEY96lDVdYfQDgVVWyjiFT/JxFPCkP567gLJlvo/YBhN+aLX3wULW2EyBbD2PWat0bCdJKVzwMYlPEk9mRlpk778MbBzH5ba/rtkAJ2ERidlmzzu/QjkqQDhzcWigJA5/U2JJiYW4rs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <1cc8eaa4-6fcc-21bb-c590-bffa87e14177@amd.com>
Date: Tue, 4 Jul 2023 13:04:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 06/52] xen/arm: introduce CONFIG_HAS_MMU
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-7-Penny.Zheng@arm.com>
 <4303bf0e-a987-1ee4-9524-c83756789322@amd.com>
 <1cbf44ae-2500-1428-5dd2-893e846faf1e@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <1cbf44ae-2500-1428-5dd2-893e846faf1e@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0292.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::16) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH3PR12MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6b0c32-7ad6-4974-a7b7-08db7c86cc5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/uU+ApQBoW2DflehSSW6DDjFdCWx1RdmiZFwoHPfAysUsrbY8EyMoPqpADTflAc5u6XUyLCPm7yzC59WHf6T+KdJfQCvEkxYC/b2hMz8jtTSQDYYFkGH5nnYz509sFpBFfII98r/RUgMQRzZTiJg6MZMU2566raxgKLuZHwYM1YBQbsoeupmUbpUF0Oq6RLHkiKIxPFLSulau1Ia+eg5rnOK8l+EJCR77rxBhsOAECq+RAQgdxrv8dtSaXhGQtVZ51/Q/qFmP6Ah+fseeImhHIYqf84dTM9v75jb3Bxm4AIkL59xW+cR5/1CngUahRo55jtj1CaoXOcNGOAsFX4z02aWlj4nRjXdVyut72AUdU5BIXr1qqYOCTgQGaslutwGHC/qi+KzS0wGZyd5oW8K6QqIPhg3LVldtnOsJ/kgCntrZnS97Y5hQSqM0gLxve0xVoUXYUBeMn6PMTtgnsHqLKACzJs5dvWzg0O3OLFIG5aw2/DCcG++pJt5bmCcw5AZoOoW5W7MYl9TxXUWHGj4HFo8xftlIuOP2+FBO5+/ia5XkMtGbbp7dyEFU7Yl41UrwIIZWbddtjnrHhWHkRBV5WSrm6zsVDNme77j3aSbayX9yukVGEhaf0b85lvgG3ng0LQOY2rxY8fLKQijkEbcTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(31686004)(2616005)(186003)(38100700002)(6666004)(31696002)(66946007)(6512007)(6486002)(2906002)(36756003)(66556008)(110136005)(66476007)(316002)(4326008)(478600001)(54906003)(26005)(53546011)(6506007)(83380400001)(41300700001)(5660300002)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b20xMzBtWjFnQWVwZGhpbHkxYlAyZkNwRUpiZGN2ZU95aXdGQURjNzBDQjR2?=
 =?utf-8?B?R3Zyb1RNVjN4ZndGM2FaaDdjMWZzU0RPREwyRVgyUWtma0M5RmlKWU5ZVVYz?=
 =?utf-8?B?NUpCUlM3Q2xiRXF3eGdnZ3hUaGdreXVzVDRVU1FXWGZBSlY1ajBCcUVXTDdh?=
 =?utf-8?B?Y1lISytWMEIrZVkvcDRiTGNyNWVPVldSYmJCV0Z1WVZCN29qSTN5RzM3aXhJ?=
 =?utf-8?B?RkJMYWNYQlF1OUxLUGJDRHNsZW9JZHNUOHg5NXphNXZya1RYY0R1anR0dENh?=
 =?utf-8?B?aGd0MUx4TXZnWjROZWpQV1RLNlA2c1FZODlRK2M4ZXZaTVVQQzFLcHN1dzN3?=
 =?utf-8?B?dldZMU8zZ2VXdGQ1UTdXZlhMYW1WNXJrV1BIMmozYnp4M2dxc1I4eXdJVmto?=
 =?utf-8?B?Z1pRcGlkaHdRUzBueS8wQVoycXpIYkV4MThkVDZhREU1c3NQV2x5RDhjbURv?=
 =?utf-8?B?akFXNFZjaE1ETmpqbDhGTlFzZnF3aEo4RDExMFdMREl2S3RqMFhPa2RnVE90?=
 =?utf-8?B?c3VhUE9uaG1qcEZEVE1UOHg1VG9WYUc4S2RFeE13MWk2cUREZWtwUUZLNXBo?=
 =?utf-8?B?dmJxS2xDOWRIcjZZWXNEWjRvbGVPN0RSaVp1MUJKanlyVXQxeC84ZnNLdngv?=
 =?utf-8?B?eHMyVVl6NFhubWpFNUdUSlJHWEV4b0w0RnZtQVJJYlk0cFpnQUpjSHpDUUVY?=
 =?utf-8?B?c1NjUVdsZTVpQ3B2dUo2K3ZGc21laThDWGw2WUc3NGhJdW5RY3VPd0hPN2NC?=
 =?utf-8?B?Nk1LdjlDdVJFS1dNZzU0c25mNkJFV0Z0dEJQd2N3VVU2L3NRUVhCd3hodm8x?=
 =?utf-8?B?dFZqenRhOHJYVXRHYkNFNUx4WFNGSWJaVGtUcWFhbytVbXF4MGdDOC8wMDRh?=
 =?utf-8?B?NEt2d0s1ZzB0QWVjYnhUQUppMkJJOTA2N3lhOThuc1lWbWRVaGUrU1J4Vko4?=
 =?utf-8?B?TjRmVk1oQWNNOVFSazZOTnZqb2R3UHdOQlBYZjBuN2hpbXE2aWk2UkxES0RO?=
 =?utf-8?B?aVh6Vk40QUtEbzg3Q21TZlBMUGZBK0llN3Vmb1BETHkybHhQTVN2WldYL2Zz?=
 =?utf-8?B?QlVLd0lvSG5FNDRHUWwvRk44cnRMMTRGalgxR0U0cHVYQnl5dXlOeVRjK3d4?=
 =?utf-8?B?WkJ5TGF1dVhHSGVib054SEw5MHc2MVNpaGVGL2ZLaEcvaXorTThmcVJwd0Vr?=
 =?utf-8?B?cWNrRnUyRU82SkhkTGZhR0tUZUxJNXdZaVdaTXFSc25hUmRweDJudFJNR1RQ?=
 =?utf-8?B?T3hqUmJaNUlBTFdOYmN6MklTMi9vdHp6NFRpTDAzeVZ6d0poU2ZoZmw5dEdx?=
 =?utf-8?B?a0lzQUw0cmdUU3k0UDFENTZnZC94NEtNcjJCUXlwcU5DMEJJYjV1Mm1iM2t0?=
 =?utf-8?B?U3RmMGY5SnRmWGpjUC9BUHhEK1FoRFdFdVNpU0JENXdVVzRvRHlsdUZRNDJx?=
 =?utf-8?B?U2lwdm5GU3pUeWhOMGNNYllqOUZlVnA0aWJwMlcyMUNMK2xBNW4zelp4WnJQ?=
 =?utf-8?B?dys0ajRCTjRJdHNnaDBtTTJ6dnBhd2M1c1E1OStGYXhmTTJEaE1YZzdXUnF4?=
 =?utf-8?B?TFQ2ZUpZajhpR3hodGxiL1RPSmZJWXVsbytacVdZSDNXWUF5TDBhYkQ1R3NJ?=
 =?utf-8?B?YkdpTDdCcDVHcEtnRGJwNTZ6Wk1FNDZ2bHA2eTVVUitCZ0tZOUoraXE3Slcr?=
 =?utf-8?B?eXJjdXRuTkpWTUNBZTJwR0FaeE8rWDJlaWJmR2Myclc5Y1dRR21hZVJJcTE0?=
 =?utf-8?B?UTZJNjdRL05YdVUreUQweDRiekR6YkN5dEU5MnlHbjR5c1FHWkFLbWVBenky?=
 =?utf-8?B?NHU1UDQxd0xqUXhTSHE5VktyZUg1V2xFNXNENS8rY01HNXhqKzFxSGE1SGFO?=
 =?utf-8?B?NUovSVBuSnlDR1BKQXZlZUhYbThyWFNpd0UzUDJieU9Ua2xIVWtRNCtnVzhn?=
 =?utf-8?B?d2xPN1JkQWFmMTduNVZxcEd3QWNjek5nMit2amF1d2RPWVVtd0R1QzBDV05h?=
 =?utf-8?B?aWNJSG12bm9RQ3ZlcXZsU0FnSEtLUjlVMkZIc3VGcmY2bFpvbHpVcmg3aG1U?=
 =?utf-8?B?MVMxWWZlcER5S3BSUEtTMnpMOXp6UU4wZFdEa0pBUWQrbVc4dStpV3I0V0dw?=
 =?utf-8?Q?68ImuHx1tKgOKoF3/45pfPP1O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6b0c32-7ad6-4974-a7b7-08db7c86cc5f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 12:04:20.1089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cYd3zJBufoRYSs3ag1c3790TYbfO9SaeEFzxYU5W2Sv7j9D1S8T78OB/AwSjcBsP7myd26ZY3ObZYDW/KcFEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7761


On 04/07/2023 12:44, Julien Grall wrote:
> Hi,
>
> On 04/07/2023 12:14, Ayan Kumar Halder wrote:
>> On 26/06/2023 04:33, Penny Zheng wrote:
>>> CAUTION: This message has originated from an External Source. Please 
>>> use proper judgment and caution when opening attachments, clicking 
>>> links, or responding to this email.
>>>
>>>
>>> This commit wants to introduce a new Kconfig CONFIG_HAS_MMU to guard
>>> MMU-related codes, to tell two different memory management 
>>> architecture:
>>> VMAS and PMSA.
>>>
>>> In a VMSA system, a Memory Management Unit (MMU) provides fine-grained
>>> control of a memory system through a set of virtual to physical address
>>> mappings and associated memory properties held in memory-mapped tables
>>> known as translation tables.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>> v3:
>>> - new patch
>>> ---
>>>   xen/arch/arm/Kconfig | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index ff17345cdb..fb77392b82 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -60,6 +60,14 @@ config PADDR_BITS
>>>
>>>   source "arch/Kconfig"
>>>
>>> +config HAS_MMU
>>> +       bool "Memory Management Unit support in a VMSA system"
>>> +       default y
>
> I don't think you can disable HAS_MMU right now. So you want to drop 
> the description to prevent a user to select it. This could then be 
> combined to
>
> "def_bool y".
>
>>> +       help
>>> +         In a VMSA system, a Memory Management Unit (MMU) provides 
>>> fine-grained control of
>>> +         a memory system through a set of virtual to physical 
>>> address mappings and associated memory
>>> +         properties held in memory-mapped tables known as 
>>> translation tables.
>>> +
>>>   config ACPI
>>>          bool "ACPI (Advanced Configuration and Power Interface) 
>>> Support (UNSUPPORTED)" if UNSUPPORTED
>>>          depends on ARM_64
>>
>> I don't think you need this option.
>
> I think we want to introduce a 'choice' where the user can select 
> either the MPU or MMU. But not both.

+1 (I like this approach).

>
> This would be similar to how we select the Physical address space size.
>
> Cheers,
>

