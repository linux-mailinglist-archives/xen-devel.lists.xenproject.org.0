Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688E0718D58
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:38:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542075.845633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVu-0001Et-6W; Wed, 31 May 2023 21:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542075.845633; Wed, 31 May 2023 21:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVs-0000sK-PQ; Wed, 31 May 2023 21:37:48 +0000
Received: by outflank-mailman (input) for mailman id 542075;
 Wed, 31 May 2023 21:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LP7+=BU=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4TQI-0006zB-QL
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:32:02 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92f5eb6d-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:32:00 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SA1PR12MB5640.namprd12.prod.outlook.com (2603:10b6:806:238::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 21:31:55 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::246d:4776:b460:9277]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::246d:4776:b460:9277%5]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 21:31:55 +0000
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
X-Inumbo-ID: 92f5eb6d-fffa-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbBArU04kAQpB2JVuvBHrdYiuMDxjT3WU2qvdXjOFbFFTY60q/YWmpGr1m8pP5IOygWSifkntF3MAfLUYxAPygdUY3RPjsEcnpBUBL3XAIxFBdNQWa6v8o93qPxsYYcRjvDe04oFJI5CbMAxyzT33iSXC4zhOe8qRg0zs4XvaMs1fcOmA8paGlRMGRR9eXrjCifht/5KcLUe9sK9EyzIx0DXo+07rKvTdkHAkc5mUIHATTuT1MvbxnV+h2tGOkn7mG2LIQ3L0wIwpgIyyuEjcS95LG8iJNvlG9+AxRmKdyn6T0Pw0Oou8fAy3bie9x1zqjXL+ZyjML9GAptEcNu8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZqgq69XDgY/WCCBtf8GsCnxxbOsGmopbsOOxTJh9WQ=;
 b=JMdmgAJsFW5uj81cmQH/CYQsQuwpUU6qsLNmAJisNzKiadYErJeBhUAb+e3+BVlxPBiV2pqD70t/cYvUdOmT9dvfSVfU/w+adts46VVrCFvs+dyC6tyhCxjx2/HGXaDftn1B5xDONxeV1W/AaX+SCdnAgzChDDge/+vekH4COxq+Irb7BU5TYuP6scrJ9kyIUGcyO5B/QS6Gf+hlLuqcT0vhgT0fHG7rbTwuHOLLq6digfEiNrtsIlEa8WHdvBodvVx54hGXg+TfUJUfvHqFqe86iRTPdx9TwxpnxTE82bPp748n+pdFPQnVh/PjQbj6itwoc1iAFIrCpk+AAGeeFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZqgq69XDgY/WCCBtf8GsCnxxbOsGmopbsOOxTJh9WQ=;
 b=b6A1/OrtMHbyBrF7YlFQlBspJiLiHuyOGQcPhEyL3yXTZ4C2DEYXohFh4PwRgqgDjEf7m+q43RzPPTy4jmZORw9Avn5E0fh/yTF4S1sFbrH20YuojwGSXsh/7k54K9Lg+vhee1sEYqMT+1ppI7dr4PklUFBi4sTyw/s5czd4I2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <99b0bdf6-b215-f65f-aad9-3ae74a14f66e@amd.com>
Date: Wed, 31 May 2023 14:31:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v6 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-9-vikram.garhwal@amd.com>
 <AS8PR08MB79910CFF4439E503046660EF926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <080bd1fe-a58c-5bdf-eef5-995420001ca4@amd.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <080bd1fe-a58c-5bdf-eef5-995420001ca4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::17) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|SA1PR12MB5640:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d347481-9d47-4933-f7ef-08db621e74a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nSTcedYxnGWPSbZ65XDunT+hSDdywXn2ahHHEoU2PSdMGIyHLKg5EO3AefyXu24I+woqv8vvXbNJnL3FvV5dEuMY9AC3ZOrJdla6Y3ZDhdWXPDiNLbGy0BisIGYBAEMLe3IUzESVxytgt33G0ScgZ/qFdTP//lk2McjjB9I6p12eHG+WdPgOaT8R2MuqpQ14zfN8lQocrsN43h1LJ73kxNJeH0pEqOWDUkLXYhC/bmLb8/Rr5HaqIcE/EFpYML08Pa3q3cZSRxylVKWSdnlDWWHseEnYEycpab7LoE6STwnN7JiZ+F1eJwxmLiNW1zX2Ot51/Gx/NzOLdbk8AUsf+QLcrh88DaM4WMRqLkdyjn1TMsr5c0WEu+OC55At9rsEoozKipmE3doiVg+aZftsj/zhAThOeVRZ9oPvVGiP2HbbPjcXlpUSTLXtIqonMWZuq2aOxcrn3Qqq/4sKVxVXJAckUCLPqZi1AV8wcLREQaYtdn+bQPo6YFqsHsJfho+edANoWqCCw8y8hTWwxzfZyHCv+t3w9wdfiRCXVvbcsYaUB/e3oy4upw2sLb+orwQdjgPE2e8p2jHWc8hJnZEtS/SuAygIl4s6ti21yx7SA6idbzkjnjLy400PGWJHT6FE8eHb5bxKl+bWXUV0xLIg08kXClt6JaNatUrwUuE4NQo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199021)(66476007)(5660300002)(36756003)(4326008)(66946007)(66556008)(478600001)(110136005)(8676002)(54906003)(31686004)(6486002)(316002)(44832011)(41300700001)(38100700002)(8936002)(86362001)(2616005)(6512007)(53546011)(186003)(83380400001)(31696002)(6506007)(26005)(2906002)(37363002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUJKdHNOTnQ2NFkzS1JKcElzWlE2djl2VytIRWlFREdRVkhtY1BZNmpndnFl?=
 =?utf-8?B?T1U2MGdwWi9qVFlwa0tRWEFmWnEvNUsyVjh5Yy9vUUNGWUxsMDdqcUNFakFZ?=
 =?utf-8?B?aFBBdWxCZU9zWEhrT1RRcnRsdjNMVkoyc1VKZk95bGY5WVhqM3VIZWdQZVFI?=
 =?utf-8?B?clJSQXFRK1VPUEg0M3YrUFY2TDlTTjMweXkxVWplK3hVUXdoOWdRMjNCSm0x?=
 =?utf-8?B?YjJNdkY2WG1DSVhwYTJKeVBOVGFaRHM0NlNndGk1UzlIcmtJYUZkMjh2dXFw?=
 =?utf-8?B?eVFuZjJWL0xzbW94OTU1ejJLVUtUaXVxOHhya1BMa0toem8yV1ljRzhXRWF1?=
 =?utf-8?B?N0lMTHlESkRwMk9BNFdUNHZJMms3VytJTTlBZDlkMjAzSjBDaTZRMGJnTnd4?=
 =?utf-8?B?ZUErZG4xRHBRME5md2MyMlQxbW91SFVyZ1ZYaUFVOHRxa0hzc0V5aDdzdi9K?=
 =?utf-8?B?WVl6OEZYNDgwbXlPYUlCRUhxNVgyd1VzYkdkRWluYkt6VjFiQ3c3ekhOaWhG?=
 =?utf-8?B?OXdSaXh2U0krRHlIRnRFOEFWcmk0SVo2dStkNXVSRWxWejVsTjhOSVBYM1VQ?=
 =?utf-8?B?VzRzTUhDd1RPemtGUlg1b1lVa0I5bWZyYjBlOVNMZG9aZUFWYzRIUXNjQlJM?=
 =?utf-8?B?S2ZzWUFPMzV0Vzd5dHlpMUFOcE5nSjVKc1diamNHTms4dmV1SVY0N3Z1OXNZ?=
 =?utf-8?B?Q0RDS1RmQS9tdW1TOWxMRllxYWo2R2hBWjViK1g5SU10bkg0bzJrL0ZOLzhF?=
 =?utf-8?B?MUttRWFhSStWRW5iN1JpSFFCVjZPRlM2UkhpWlpoRVV6UEUvYmhaMlVXd3ow?=
 =?utf-8?B?L0lQTjRjalgyc3NCcUs4V3lsVjF5LzJYNkhpNzdKaVJmOWZUSDBvNHJuUmY2?=
 =?utf-8?B?eDQydVJoME0vaEhWd1NlSG55N3Z4UTUzS3NDc1NPS2IwSGxKblIxTXE0UHpQ?=
 =?utf-8?B?WG14Ly8xYnFTc25sNTFGa2xlSDdxbTBLVjZrMkNzbUNpbkFzeE44TnVpblpa?=
 =?utf-8?B?Tk1vSDNqeDl1TmRmYStkaUdUZG5wb0N2Y2pCKzl1Z2pQaHU1U3Q3NHVaRUhO?=
 =?utf-8?B?TndVcFhxR2VobDh0SWREWTdlNm80MmwrcGk4a3JaRFV3RjIwSVc0QXpidThv?=
 =?utf-8?B?Q1VudE9FNTBUbmFHWC9HUVZOd2ZMd1hMUlJqa2pCblN3b3dITVdFcjRFakkz?=
 =?utf-8?B?a0lLZENCQktzYU1sdkU2TnNmMHJRRGU0blZnSDRjdGZWSU13L3hSVi9MRmRj?=
 =?utf-8?B?bmVJdHU3SVJQV011RURMY0cxczFHRC8rSjFQV1VFUXhzR2pkUDVlTTFJc1M2?=
 =?utf-8?B?Yy9NK1Exc2NRWkptUFJuZ1psbFlscXlLdWxYeFE0aXFENC9aL1p5NXlJdjcx?=
 =?utf-8?B?UnpXQjZsYThkcUc5VksrdWpsQ1U2aUd6NnYwdlZvSm9IeFVrb3R4RG5aOVJS?=
 =?utf-8?B?NlZrZkZlaVNQRTFsckc5SGswelhLWHIydVFCMHBsV1Ira2xLeFYzMWlhMHhX?=
 =?utf-8?B?cnhlVkxoaGRUVEgrRFlNZjU4TTZGNm03eVZSZDcxcDJVWjAvNEFSMmgvZ0Nz?=
 =?utf-8?B?STcvQjlqZFMrYTNjempkdmhSd0dSNmVwczErN1o5N0QvVzg2NTdqeDk0MEw3?=
 =?utf-8?B?SWVVQmxKR05rQUdLVHAxa2FjKzNIdytvT1N6em82YlZ4MDdVdURWQ21FMHNF?=
 =?utf-8?B?ZUdyY3JsbmN1TVNsZjlMWENQQ1VHVzRRUFNZSEVzeU5hSmw0SmI5dnYzR0E1?=
 =?utf-8?B?OTkzNmIxMlRkSUpQOEl5clhHSHZWTGdvS2FVNnBISnpXWVk2THB5dnkyeGRp?=
 =?utf-8?B?aGRIdCtOeTR1Skhiajl4RkZWWHhqclhTMjZwZlBiRWR3eThIdDF0NTFTNVRE?=
 =?utf-8?B?NzVtVFM4UXRpdWZ6bHpqdnhtYmtQdjNOMnNjS3lBczczZXY2S01ZK2hSMEpM?=
 =?utf-8?B?Z2ZtdFRRdW1keGt0ckVBYzFkcy85UGVJRVRwRnd1Qm1hRnFtUzZVTXkvVmF0?=
 =?utf-8?B?TjBlSTdzYlZMMDJVSW9HMWliS29VdWt5MXYzUG5WWE8xOVBqOU9VeHBoRGw3?=
 =?utf-8?B?eHIxUVRiaHpTbFdmL09Wc1lBR2RDKzBYRzB6RWtzeC9kdTNCSHRyRmNNSDh2?=
 =?utf-8?Q?o2HNFqMOCpgW3PQoKOyrHJeg7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d347481-9d47-4933-f7ef-08db621e74a2
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 21:31:55.1327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4p0mFqyu4e60hYjYm2U71XHBsfKoq8BSE8DBzCKyB4Ohvp0Q0DsfOXp0ryWQJHBF2XWxENsMF/QH78CiyMbgXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5640

Hi Henry & Michal,


On 5/9/23 4:29 AM, Michal Orzel wrote:
>
> On 04/05/2023 06:23, Henry Wang wrote:
>>
>> Hi Vikram,
>>
>>> -----Original Message-----
>>> Subject: [XEN][PATCH v6 08/19] xen/device-tree: Add
>>> device_tree_find_node_by_path() to find nodes in device tree
>>>
>>> Add device_tree_find_node_by_path() to find a matching node with path for
>>> a
>>> dt_device_node.
>>>
>>> Reason behind this function:
>>>      Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>>>      device_tree_flattened) is created and updated with overlay nodes. This
>>>      updated fdt is further unflattened to a dt_host_new. Next, we need to find
>>>      the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
>>>      and add the nodes as child under their parent in the dt_host. Thus we need
>>>      this function to search for node in different unflattened device trees.
>>>
>>> Also, make dt_find_node_by_path() static inline.
>>>
>>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>>> ---
>>>   xen/common/device_tree.c      |  5 +++--
>>>   xen/include/xen/device_tree.h | 17 +++++++++++++++--
>>>   2 files changed, 18 insertions(+), 4 deletions(-)
>>>
>> [...]
>>
>>>   /**
>>> - * dt_find_node_by_path - Find a node matching a full DT path
>>> + * device_tree_find_node_by_path - Generic function to find a node
>>> matching the
>>> + * full DT path for any given unflatten device tree
>>> + * @dt_node: The device tree to search
>> I noticed that you missed Michal's comment here about renaming the
>> "dt_node" here to "dt" to match below function prototype...
> This is one thing. The other is that in v5 you said this is to be a generic function
> where you can search from a middle of a device tree. This means that the parameter should be
> named "node" or "from" and the description needs to say "The node to start searching from" +
> seeing the lack of ->allnext you can mention that this is inclusive (i.e. the passed node will also be searched).
Changed this for v7. Will send it out soon.

@Henry, i didn't add reviewed-by as the patch is bit changed with 
renaming. Can you please review v7 and give your feedback.
>
> ~Michal


