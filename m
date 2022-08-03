Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5895888B5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 10:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379652.613276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9lZ-0006bM-ID; Wed, 03 Aug 2022 08:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379652.613276; Wed, 03 Aug 2022 08:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9lZ-0006Za-F7; Wed, 03 Aug 2022 08:30:09 +0000
Received: by outflank-mailman (input) for mailman id 379652;
 Wed, 03 Aug 2022 08:30:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJ9lY-0006ZU-2c
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 08:30:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a28677a-1306-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 10:30:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0401MB2254.eurprd04.prod.outlook.com (2603:10a6:800:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 08:30:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 08:30:02 +0000
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
X-Inumbo-ID: 7a28677a-1306-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDycRQNaw77DgnOhzfb3lrJkfO5278M/rl9cplf8+3f5OFrvNEg99LwO/kGMtwqeXUkGOS6d1XXGkla3KYUYg2if8wnECmMy5sokuHSqn7FMV41WDBwlqTMHw0DzHQrXEAroYAEHAU9rR9mHqxvfu+F0DRyQanV1rSys9A/VAsrSZURlPIeKaJ/+uTqj/ujAj/UgvtvC152Au8OJHVFR1m0Ik051JdQGH1/82ez1BqWHgXj1fobz105nQoCKcpHqlbYQf/YClKZGd51uCb+ACL/IcmYjR/El59wTLKvRXQ5bshYLBg5H1fUzMJAh4XL2Ru66wWnOusP2pf43pr36ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uvk+06XhDS3sHMy4faMqGv7tUvWhq2BRDUqga52pPDk=;
 b=KvH5c8rwby58whWmpcfqu+ftFu5ojZNUtfOJO4MmZA31ko9ZQnwFDtsRmSLrIhElfPjvF0XPR70ZglyMf2ubt+uUzPqVswC5nQ4kWBTlqNWvu6l+g3+uQa0p19jFadKgsmoOPDLtpHtx9JHECD2bIyg5qR5tnlN1iQCl+DIq1qx/DJ8pF2iPYwW9UDKKyCywDh5pQ13M2pXVH7PnsMh34RQoZWueuPHRSOHoqcdnNw6kO/tqq7ZQeSe6UU02oyBOQLXc43Rk8HU2R5Bz17hJfYu0iDR4iQPPenJ1hjbuBvKW+kpxMTXok40wQX27iYRYkaaifhHUidomQfkm0og6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uvk+06XhDS3sHMy4faMqGv7tUvWhq2BRDUqga52pPDk=;
 b=5WmFKdRSrAFrb1JB/chCAfIKPiaBLBcT8VCLwsDQBLDCNhrX7wKNn5rFKnCYsf/x8D0ncfmA6nQiyUx6cbgjDu5ex9wkXlGMuWTThV4ylK/3xyn+0srAMp0v881/RMM/LeOqtn/AoyUmQ8v3qHh+WjfHXXKwjtDaYTovwvvsse6ba+mBo4ADkgOoTbkKWZNnCnxFVpwCbD+8JZFIIuqSEWD/Azu7Rhozi2jprqJi7KpZC7aBg6tS2Y9YWGpJ2TlYlA3emq/MGFviafJBHVthIxwHaVNyZIB5/RzWqYvJVRNO9lx0XEyIXd7ycMOOD6hp1EVrwoPweCuVvydz3Sqnyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c7b9ebaf-28dc-12ff-c1b3-9e7d9eab85ef@suse.com>
Date: Wed, 3 Aug 2022 10:30:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] xen/sched: introduce cpupool_update_node_affinity()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220802132747.22507-1-jgross@suse.com>
 <20220802132747.22507-2-jgross@suse.com>
 <266615bb-1465-f38c-5eee-ad2f4e7256fa@suse.com>
 <8b51d326-feb5-2aac-80f7-969ef8bd2ba6@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8b51d326-feb5-2aac-80f7-969ef8bd2ba6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0403.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27d61d36-624f-459d-05a1-08da752a5c25
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2254:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nmXDri8TSZtUQFODvmj9PGBUa+qtLG4ahB3KW5ho8ReGVvKZKEUOeJ9ySf3oST+Xko1yg0uu+NuetKt3c7tGQiAArA3XqIPVSSbAO4XQvCCIGpZ8Zw47PMMjv/9FlQ2nL1xs8oJGKv1qxIhTt71TbMTCLLJ2qzcqNGEnS36bFdj4tGsreOzDgvPkOcF2E8RoO9O8IILhuqbs36+u4od8td7KZCWTZbFoifirOV8HrnSdA6AJpCYjtQ4o/ZG8JvTdk6Glgj58jRySEEIdxbUZHKO+YYW+x9FWV3XdkzZy3sQSCHpRsgptkOlJu04NrFjzU5mKnHwmBD0Ea5GECSl9Chdes5QhxNOpT+M1X+OAbCFu2lPI7mt/ly/+XuM9tg4hExkGTquGLitODKu4xGlzvb5cmXNbUqVlhFMsVc3s9KGtpWnzlquTYPlCK1Cvu0Am7OCfdVezHZacnWdGq7xVEgeUXzwR+IsMRJahzjnDDOPsDVEeOJIgFRhDKwcDQFiRCYgZQorFIeDaZSxBnUBsT4ExOjDE8qQVagD5n7uIMjAuMo6FgJSujc1UYEaaD5seXGEd3ygTGMdbpZ87zeyEZi+gHVe7NE0CCJjYTBLFvglg2m9PIAqXlYIMgNr+LhXQiTpBBBjVtUiMgsJk8F9r9b0iInfurMj5VjiXZd/Emh753Z7FkrNwqTOs21HCXcBrbUncpTqPBJeUQ3fH2YxnczKHkQAnAkazIItV7s5jxq9ItOLkvL+wB/6Kz1+Wg0Ocvt7UWbTjtWPwbrQKgUfVUQ/RC/3WkCdDKNh/cn6XKsA5z4Jz6q4N9oEG21q7y7++DLj3pp7t3/IXs9g5sXTxCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(346002)(396003)(136003)(376002)(41300700001)(2906002)(186003)(6512007)(26005)(6506007)(53546011)(2616005)(38100700002)(86362001)(31696002)(83380400001)(37006003)(54906003)(66946007)(478600001)(66556008)(6636002)(6862004)(31686004)(316002)(5660300002)(36756003)(6486002)(4326008)(66476007)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjVBRjg3MmdZWWQwNWJTQWdsY2pVaHR6UnBnTmFHNE1vdHBrT2U1UkRXcCtN?=
 =?utf-8?B?Vk5DRERqNGp4YVFlR0k4QVNOa0RCVVdvTW1WTXdUYkxFR01XdGdUUEd4a0hu?=
 =?utf-8?B?ZitjaG02SUlVK3hmZ2pHUS9KUWRSZi96VVdyRFB1WXlwVWZrMVg0cXA1MFlF?=
 =?utf-8?B?cTFFa3ZqUVA0bnoxUXpuWVRpZWwyK0o1U1VMcHJnVkFJcVhIaDh1a3ZUeGRY?=
 =?utf-8?B?cnE2UU1iTW5WL0NaMFo2dkVNTUdkSml1aE9WRGxvMjJNV2pRMkt5RVFRSDda?=
 =?utf-8?B?SjlEWEMxYlFLcXBocCs5NTVkaTMyVTdENXFOVFFvd3diSXdKMGQyN3VWSGVj?=
 =?utf-8?B?aDVxcG52K1IzQ1djTlF4Z3pBeXZ1LzU5MGJHdk5GZlo1TmtkbkNxbG5sdzY5?=
 =?utf-8?B?M2xVNEdLcDBjRFlqRWR5OUhzdm9xSVVxcjh1dngxNEV5OWFjcWlEVmRCVmlW?=
 =?utf-8?B?K0hJTk4yN1hVdyt5VXBWMmphSmY3TE5NLzVFKzRvZzhRY2dDNGI5UlZHRTg5?=
 =?utf-8?B?SHlDQW9lWEQ1RFZMSjMxMmVMQWVmZy9GaWNzU1JXVzc1OWdDL3NpdmVYN0dx?=
 =?utf-8?B?NzhIbnZ1SFVnUXR1S3lXRUVzb0NJZUtMZGtoMGRia0Exb3RpdmkrdFhZa0dk?=
 =?utf-8?B?RDlOVExjeG1qZkFKdVZlSnVOcDM5MnowOXdBazduWXpqRXkrQmtQZGhaZEor?=
 =?utf-8?B?NytTczlNa3FpcG91a29mWVdZK3lUS3ByRnBVRGRDVTJWN2lSQ3RsV1M1bXpL?=
 =?utf-8?B?WkYwWnlJNnFxRGpsNFdMd1hSdndXeUVZU1BlaHNGS3B2TWFPNTFJNnAvN1Vh?=
 =?utf-8?B?dXBCKyswV0pnSHZkSGY3K2E3ZnNZd1QzUDFxbU9Ic1c5OVVWTmJHSyt6dXhs?=
 =?utf-8?B?SUNYVWlvWDBSbGswZUI5eTJycEk4dk9DRjUrVVU3SGwwZnVOSTVRckh1UXlw?=
 =?utf-8?B?c1QyMDV0QU9adW10WXcyR2JjQXFDd21PQ1pnRjNrMzF6NHNYMEF3cFczbnhp?=
 =?utf-8?B?Mm5Ra3RFR2VjV1BlbVJMYm5VR09ubzV4UnRSRjFCdzdXNUxUaFBQUEpXeDlZ?=
 =?utf-8?B?ZTgwMWxibEhHTEhnOTFoOS9vcXBqRm9TaWJkbzFNbnBFdEx3MUU1M2Q2Z3JB?=
 =?utf-8?B?NEx3enM0QytrZWI3Y1dvQ21ZUlg2SDY2dTNNZFNoRzRiZU5MMjNJVjR0SE8z?=
 =?utf-8?B?bjc3b3doSTVhQjZRVGJnZ1FCbVZkQUdEbVZ4MkRsQWFRRGczSnFIcVNxMnVt?=
 =?utf-8?B?d2drVk9nNEswZnRia3U2S1FIaWNqQmlOTFJYNFF2ZzRKbU40NnNDSjVUOFVl?=
 =?utf-8?B?TjZQNmQvbFh2Z1JWRVh0UWRIMXpRWG5adXpsVmtIZmt0Z2JPem9rWnhJd1NR?=
 =?utf-8?B?L1FZK2F4VVpCZDFmK2hIa0x1SzlVczNGWXVVSXBoR1dsTEZKM1JXbVJ1anR6?=
 =?utf-8?B?R0hNWDFUVmcrU3pUOFQyYnpGS3NPaWp2amNuaXg1WmwzZDIyNkJBMkpzRWxE?=
 =?utf-8?B?WXQ5eTRVTjMrQ0prYUdacTZBbloxaERjKzlKVTJ5N1NycnNYSG9lOWZPWTNI?=
 =?utf-8?B?d2JEMGZwMUs4Rm93RnE0cnYrRTlpWUV2dGhveUx6TUZLWFRId0RQbjFwSXlE?=
 =?utf-8?B?UTluYzk4VW8xdGZTVjdDRnFTUy9UM2ZtU2c0STlQL0FBTUNvL0JTNHBBZURJ?=
 =?utf-8?B?QkhFZTllNkR3TFQxc2wyNXpuRE1NMzVVVnZvZndVcmdPNDVvWlhCMm1hWWlR?=
 =?utf-8?B?K2tSanpTWWZlNjMrK0oxQlVYSFNPTHJNcFZxZ0U4Z0VMcjZRVmhnOVE4VlJi?=
 =?utf-8?B?RHlwa3Y2NXpXV1lHWDl0WjVFVGduVzROdDBVQjRQUW5BY1hxUFR1MFVtcUNL?=
 =?utf-8?B?YzRTQndJVnJxem1UN0VvTXlVU3luaTFQcWVKNjdNZXdNN29PQVNoYlU1SjBW?=
 =?utf-8?B?VjlkVFUrcG9FclpwcThFcndZZkVwT3RtN2h2MlRVSkVNZmRuV3YxYkVwV0dH?=
 =?utf-8?B?bVlKdVFWQkhEbXQ0TUlFWXlxMUltbXVqUm5UNXJvcTdrV1lmdUtNOUR3SkZL?=
 =?utf-8?B?SjNaSG1wakxrTmNyekp0Wi9GSXNlUEdkVzBtKytlZW94TnB5TFMycUYwbFZG?=
 =?utf-8?Q?/+ZOezL5Bl8YD/gxqG/J+GCH8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d61d36-624f-459d-05a1-08da752a5c25
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 08:30:02.2759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLZAgTM4Qnkk6v+cl7u9lxkEPtwDx02EB+5LL6nWYb8nSfQdJwd6ampvvNeKanIffWyO0eGflJsYOeaVp3TPvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2254

On 03.08.2022 10:01, Juergen Gross wrote:
> On 03.08.22 09:50, Jan Beulich wrote:
>> On 02.08.2022 15:27, Juergen Gross wrote:
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -1790,28 +1790,14 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
>>>       return ret;
>>>   }
>>>   
>>> -void domain_update_node_affinity(struct domain *d)
>>> +void domain_update_node_affinity_noalloc(struct domain *d,
>>> +                                         const cpumask_t *online,
>>> +                                         struct affinity_masks *affinity)
>>>   {
>>> -    cpumask_var_t dom_cpumask, dom_cpumask_soft;
>>>       cpumask_t *dom_affinity;
>>> -    const cpumask_t *online;
>>>       struct sched_unit *unit;
>>>       unsigned int cpu;
>>>   
>>> -    /* Do we have vcpus already? If not, no need to update node-affinity. */
>>> -    if ( !d->vcpu || !d->vcpu[0] )
>>> -        return;
>>> -
>>> -    if ( !zalloc_cpumask_var(&dom_cpumask) )
>>> -        return;
>>> -    if ( !zalloc_cpumask_var(&dom_cpumask_soft) )
>>> -    {
>>> -        free_cpumask_var(dom_cpumask);
>>> -        return;
>>> -    }
>>
>> Instead of splitting the function, did you consider using
>> cond_zalloc_cpumask_var() here, thus allowing (but not requiring)
>> callers to pre-allocate the masks? Would imo be quite a bit less
>> code churn (I think).
> 
> This would require to change all callers of domain_update_node_affinity()
> to add the additional mask parameter. The now common/sched local struct
> affinity_masks would then need to made globally visible.
> 
> I'm not sure this is a good idea.

Hmm, I see there are quite a few callers (so there would be code churn
elsewhere). But I don't think the struct would need making globally
visible - the majority of callers could simply pass NULL, making the
function use a local instance of the struct instead. Personally I think
that would still be neater than having a _noalloc-suffixed variant of a
function (and specifically in this case also with an already long name).
But I guess this is then up to you / the scheduler maintainers.

>>> --- a/xen/common/sched/cpupool.c
>>> +++ b/xen/common/sched/cpupool.c
>>> @@ -410,6 +410,48 @@ int cpupool_move_domain(struct domain *d, struct cpupool *c)
>>>       return ret;
>>>   }
>>>   
>>> +/* Update affinities of all domains in a cpupool. */
>>> +static int cpupool_alloc_affin_masks(struct affinity_masks *masks)
>>> +{
>>> +    if ( !alloc_cpumask_var(&masks->hard) )
>>> +        return -ENOMEM;
>>> +    if ( alloc_cpumask_var(&masks->soft) )
>>> +        return 0;
>>> +
>>> +    free_cpumask_var(masks->hard);
>>> +    return -ENOMEM;
>>> +}
>>
>> Wouldn't this be a nice general helper function, also usable from
>> outside of this CU?
> 
> I considered that, but wasn't sure this is really helpful. The only
> potential other user would be domain_update_node_affinity(), requiring
> to use the zalloc variant of the allocation in the helper (not that this
> would be a major problem, though).

I was actually thinking the other way around - the clearing of the masks
might better move into what is domain_update_node_affinity_noalloc() in
this version of the patch, so the helper could continue to use the non-
clearing allocations.

Jan

