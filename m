Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD2263CFE6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 08:52:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449753.706684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Ht2-0002rg-AT; Wed, 30 Nov 2022 07:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449753.706684; Wed, 30 Nov 2022 07:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Ht2-0002p9-7f; Wed, 30 Nov 2022 07:52:08 +0000
Received: by outflank-mailman (input) for mailman id 449753;
 Wed, 30 Nov 2022 07:52:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0Ht0-0002p3-IL
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 07:52:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7d00::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e19e218b-7083-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 08:52:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7621.eurprd04.prod.outlook.com (2603:10a6:20b:299::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 30 Nov
 2022 07:52:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 07:52:03 +0000
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
X-Inumbo-ID: e19e218b-7083-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfOSLqzt4SWYpmZvOPaM+jItZHVdmI7E/WJdzRaGmssF/wXxQW52hHzxk+DLWN56x7LMwVNtIg7l8kn7BGDc2T8HHe9hOS5rM/lyK9CrsgnvrF9IqVFVlHNMKUHy3juqwcCsJxdqxLWTWzwXayCZPad4F45JY9HfNR7hKUGXVzorrUoefwlWl/NT5G+75MNzHPEzK5wv/XNB9slykxJ5Q11aVwNGQB7pCvZcQGtadTSGLfEw3dbHmJKje8hWP7LOR1O7+6noiwnVXFEoi9MTHQL+C/EM3G5VMhHpjjP3w7YjOWCmHXs0at0l+3giSHwYoanCem1mJDh7n/I4soQyKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWkEif/iI22c/TAUGZodiUuNY9qaYUJEnQ/zVbZeWnI=;
 b=kFudLWNS2Uy6u2/wEAEUHgeP+diUhxJwGhWLdQkP+/FWE5nB2+LSOv3B04qALTqIFZfJd4c+Q2+D6YEhPlp2Vu/DdbAWcXYXRRBAmy3WUpYexMVKk9oDV0J8BPviBQ4VerTvBhOV8pbISsKufxxJFyqL2hcmuzxG2vf5hFdyC0Pg2p4t2aDN05gIbRdLJaAngh5VebFwimeMwgIi4F0lWMv0wKhylTmiPN4WPFK+A7DIaNopxGFnjQlNkllvBkdM2wqIAlUMr1tLAOltShM5r8JMSmb/DwnaCWWmlsN9ZKHZU5semx9xgSyFHuGfMAqXSBTlwK+edsrtyfvHkrKMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWkEif/iI22c/TAUGZodiUuNY9qaYUJEnQ/zVbZeWnI=;
 b=AbFjBUVyyvwqpPmTGzo9I5nPBi7n9oMJhDtoxyX/FG2dHWFst//8QtVvHg3yg2/gcGwzLM5wbE+IhtgP2RZvqPUy7RV6nC1bxynIRkKm4lhhnx68SRAveEZ/wE2GIoCRlmgjaRPNzeIUMF7lKYrRgUi4hq84YwZUDEGdWy2cZCyAGzNlp8i68OmCo2djoy6RsiVmosV5EdMUitjh2G+OKwULBnz3EG+IQ8dlM1amErqn7kzLrAW1fLv/XC6kl2U0SOB40O0RgDg0Z3Dvln5GJOUWv8ckclGMeZLQOCWhOHuePsd9yDmyVE6Go0HEcF4kMh+Iu4pfReFrt4v9FuLYBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96f6a943-0e1e-7399-fe83-56a550d47bf6@suse.com>
Date: Wed, 30 Nov 2022 08:52:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/mm: PGC_page_table is used by shadow code only
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <df240766-7a57-d9ce-f0a9-697fc470e1f5@suse.com>
 <4fef5b0c-4463-cd6f-15fc-47268505517b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4fef5b0c-4463-cd6f-15fc-47268505517b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: af9afe3a-85e6-4ce1-458c-08dad2a7c4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YMqFMIrrLU2lKCq9PCpJvc1ocanWNd1rXbko14vhBltdPNLI+jDCPsk2NLCNuf4+t5mEsySkDGHYtXtiOyJ7GBXK63soOjQfMNmT4E0QcQZGoy7Ad9zpoTx3BjQdWIEWw41uzvRj8SYeQNYzsGlTJ48WmuJtdX8gYdMwvNF+TkLnUn9FCKY6yBT86BgguRCNyUOxqrIMzGyBqKX4tTSgIebQEHQi3W0f67AhIrHJ+hQR3oycUakBi13AubAFMyVm7DAelD+XVIlcYa5IgvSrWTjgwLGqgqvEx3X/bJMH/qc7+RdDKWjw+Ft0GPtu2H3TEfM0o3WGvWkuYKT3zqoBEk5/CvPk9vG35AsE8VkTglivh8xOiftgOrcK8WBzEnmtJlEdvm/skrGJucyE751j/hFRPMq9CNC9QQdSCXVpI0h7Dyhxyji04S+JXGrJGqAGm11qaa7JPEJhQoYy/lhBSOp6OsbIvV7SHy8hNnE/GvtUvojzy1JYb5tMfAIBNChWo9ij9EZJ8tfNoSP/GLNViGL5C2xvx5iQVfBV7W/YRGc3kjAx9lmkqsVBTnxXTUwO6d0Yv3phC2GQjg2tZPEzjtjN9ychOIzHbpz7gPRKPV100kkd9UNwJN+Fumv0tG4aAZKzyTeHFGjFr8aVP7anwIR3ZcqGZEHJlhF9HEHYMXF6NqoIuUfXd4WdJypTEh4ynXUEO1TyOV/TkDYpoFGzjxEZeYkMYqiVn36ziSz206A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(396003)(376002)(39860400002)(136003)(451199015)(41300700001)(66946007)(66556008)(4326008)(31686004)(54906003)(8676002)(2906002)(66476007)(8936002)(6486002)(5660300002)(6512007)(478600001)(26005)(6506007)(186003)(31696002)(2616005)(86362001)(83380400001)(53546011)(6916009)(36756003)(316002)(66899015)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkNkVWtmVHpua1FHV0ZycXZmOUxzdHNyWUxIa0lSYTE0YVhXTVo5MjVabDhT?=
 =?utf-8?B?aDdKYXZRTFVCWmdUNHFyRVVvRkl5dWUvVTZleU4xUXdrbkVpZU4yK3FnOXhS?=
 =?utf-8?B?VE42N0JiNlN3cG53WEowWXRBSkJkRUxoKzJpSThsV1doODkvYjJjb2lRMmZH?=
 =?utf-8?B?MGt5c2R3bXZuS2E0VVdCK2FoNFUrQW9kN1djbVVRMFlVRlNESlkxN3d0OWVh?=
 =?utf-8?B?bmo3YlI5UHRBYUhvd0tXR0RSUDZyWXFaOWI1S1ZDTWdZVHVrNTFpdms0NkhE?=
 =?utf-8?B?TndZM1VaVWJUL3p6Q1pOWC9QUDNFaVIxMGw3UU9sdldUMDc0Q3l2NElxV1Bn?=
 =?utf-8?B?d0xIei84b3NDOUZyVXZvd0t6SC9UVm92dms4WmVXT3E5aVI1T3RJMzJENzhT?=
 =?utf-8?B?Y0tKQnZQT3JYVE5YaWtjMmFWLy9zMzQrQ1JOUG1rRmtnKzlkT1NZNjJuSXVW?=
 =?utf-8?B?MldOblNYWDdtN3NRUUZuZzMyL3RnMDNUOFgzS2x4L3J0V0hTa3oyV2ZNOFJ5?=
 =?utf-8?B?eDhDcUc3cVJDTjgzQ1NNNDhZV0FyczlqUXNQSVFQRmZhRmxmL0xKK2czN3p6?=
 =?utf-8?B?dnMybUxrN2RMQ1lJampPUit2dktuRmJxTDVQYk83bjVIZjBxZTFzZnNLcmRr?=
 =?utf-8?B?dXdkVGQ1dURsTU1uM1pTL3QxNjZsaVIydENZelF5L05DSndDWnZ0aWZQVlp2?=
 =?utf-8?B?alU2TjErSC9BdG14M2hZa3AyazJJb0p1VjdrVEtwT2pYMmJOVmJQMGRtcnE3?=
 =?utf-8?B?OHN6eDNMQnJWZFlCVmZqVkNZajBna21xUEVKZWNiTE5zdDBtRzdabzN5UDl3?=
 =?utf-8?B?NGx5ZU9DSi9Qa1pBRVc4bFZHUERtQThQclA2OXc2cWpMWTFuUXRCVDNRMWh6?=
 =?utf-8?B?UW1aaGRSMThjaTA2VVJYUWYzN1lpNlJsN1Z6UGEzajNwQVJhMFJiS2R5NG5K?=
 =?utf-8?B?Ly96UTVjZnVoKytuVlhNeGhsQ0hZMkFYYzRUL3NjOFpQdmR2MlRaOElRNENz?=
 =?utf-8?B?dHBuY3BZKzVYSkliUU1JR0hkakxVNFVRNzk3VThLd0lnVjQySXM4cDc3eVRP?=
 =?utf-8?B?SkZreHpZbDE0SlBnTUhKcjJYdktDd0lXUFY3dWpjTDBsWHFhUFBacFZZTE9I?=
 =?utf-8?B?dGFHekpVcE43TUk1aWtkMWpnMVRhVVc4Q1FUSlRTNmxSRlF5cktBK0pReGc0?=
 =?utf-8?B?NDNEeWVkazMycjVMQ2NIclpuV3dJMGx6L1hGNU5yZFVra3VnR2pYdzliRys5?=
 =?utf-8?B?KzgzWWpPdFhRQ0g5UHBsazYzc0d2OWdwajhENVdHb3NZcEpnaStEOXNwbmNE?=
 =?utf-8?B?ai9Gdno0RnJ5K3FDclB6cjBJRS9ybUFjMXVCcXZJc2NSaUk1QkwzbVNjVlBr?=
 =?utf-8?B?aWF0K2VLdDc4NHJvRjR0anc2S2VadDlHb3pabi9JVDBaWExZSjMxVGc5MmNs?=
 =?utf-8?B?VnZYeElIUjBLdGpqYXZTMXUrUkxKRTRLd1IzdlNaRWZzalZkQ3l6NzAwU1hL?=
 =?utf-8?B?S3VLY1lSQ2duRXZQS3dXTmtJYk9pZ2RpYzhOVHVnT2I3bHZoWURHbDdTLzNq?=
 =?utf-8?B?RkRIZDRCNXdJVHlRZlI5OUF0cDhyd0dGVFEzbmVkejdzYUw1TUsxUnhCcUFW?=
 =?utf-8?B?azV5T2hpeU9VdmJhU3lGTkgzUVNMK2FuVyt4Y2tZNThnVis2bFZxZlJVWHQv?=
 =?utf-8?B?a1NSdFd4YzVLUkxPeE13UEpNZkFScW5WVkl5TFJESEM4cGVlNXJ1S25iRVZU?=
 =?utf-8?B?eTRmUVB6ditjUW4xTTVUS0RYRkJnTXY0VllCaGVYQit6U3hSTVN1eTVtSUp2?=
 =?utf-8?B?VW9wYzRhUVQ3Z0ZJeXkwVkQ0V2xINEtLMnFpSEtkS3B2bW1Dak5yK3o4d3NK?=
 =?utf-8?B?bWY4V1Q0d0wvZ2hSUU5GZS9DNkZZOTFvU05rTEI2QTdMM2VEZWk2UHVxNm1n?=
 =?utf-8?B?enN4REh3b0Z1N21OZm4waW1aaHdaeTNjcXlZQ081NFhWMmpWSW9FNXdBUndT?=
 =?utf-8?B?ZitqWTFjTVBkL01tbm9WQzBhYzFRemx2Q09mZDhaeUdOS2RsTXJaTUJEZHhq?=
 =?utf-8?B?ckEvUnlycEVLaTdBYWVYQjk0SkNsZ2ZMcFZGWHc3Vk5lK1BZTGt5WFNmblRG?=
 =?utf-8?Q?M+xEg984WHOjww98/mA0AxliV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af9afe3a-85e6-4ce1-458c-08dad2a7c4c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 07:52:03.0361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5A53z4XiTrTYWZmRK/E+ShlkbkfovIwmtV/KFwoPqdEmz830fQuP0cYZcUls9Bua/YNZ91UJxflMbVRoD7ZBzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7621

On 29.11.2022 21:56, Andrew Cooper wrote:
> On 29/11/2022 14:55, Jan Beulich wrote:
>> By defining the constant to zero when !SHADOW_PAGING we give compilers
>> the chance to eliminate a little more dead code elsewhere in the tree.
>> Plus, as a minor benefit, the general reference count can be one bit
>> wider. (To simplify things, have PGC_page_table change places with
>> PGC_extra.)
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Ahead of making this change, can we please rename it to something less
> confusing, and fix it's comment which is wrong.
> 
> PGC_shadowed_pt is the best I can think of.

Can do, sure.

>> ---
>> tboot.c's update_pagetable_mac() is suspicious: It effectively is a
>> no-op even prior to this change when !SHADOW_PAGING, which can't be
>> quite right. If (guest) page tables are relevant to include in the
>> verification, shouldn't this look for PGT_l<N>_page_table as well? How
>> to deal with HAP guests there is entirely unclear.
> 
> Considering the caller, it MACs every domheap page for domains with
> CDF_s3_integrity.
> 
> The tboot logical also blindly assumes that any non-idle domain has an
> Intel IOMMU context with it.  This only doesn't (trivially) expose
> because struct domain_iommu is embedded in struct domain (rather than
> allocated separately), and reaching into the wrong part of the arch
> union is only mitigated by the tboot logic not being invoked on
> non-intel systems.  (Also the idle domain check is useless, given that
> it's in a for_each_domain() loop).
> 
> It does look a little like the caller is wanting to MAC all Xen data
> that describes the guest, but doing this unilaterally for all shadowed
> guests seems wrong beside the per-domain s3_integrity setting.

Question is - do we care about addressing this (when, as said, it's
unclear how to deal with HAP domains; maybe their actively used p2m
pages would need including instead)? Or should we rather consider
ripping out tboot support?

Jan

