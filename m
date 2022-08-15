Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F367592EF1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 14:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387420.623636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNZJ6-0004fl-PN; Mon, 15 Aug 2022 12:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387420.623636; Mon, 15 Aug 2022 12:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNZJ6-0004d5-Ma; Mon, 15 Aug 2022 12:35:00 +0000
Received: by outflank-mailman (input) for mailman id 387420;
 Mon, 15 Aug 2022 12:34:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNZJ5-0004cz-4e
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 12:34:59 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50067.outbound.protection.outlook.com [40.107.5.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac1f0eb4-1c96-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 14:34:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 12:34:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 12:34:55 +0000
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
X-Inumbo-ID: ac1f0eb4-1c96-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imwUw1cmbz5zo2PE9dVA3a952Ow8/bMp0l3FqIMx9gG5bRzMPypcCju/PU+zJxeMzuiGSJ/kId86pOEOCxSjNEL1cCJzt0w9U1ymzjZDilNM7Jl6TAr2tLeBcQlpJVsWhV61yRnuuyyIKEVUU4amXCPo4o+2U4/kdGZHzdBNvflGjsx8yr+QZqhoKMk3ilJyJtjytYLLKdFp8FyyaXplw+D0+W5KHmvBz9jE6oXn99iyYA7kW2l1Q+Ah083cGBibdJ0p8CkPKUlG66lz/6pA9k6tzEyzh/kToEnwr6wEz+5ejuPPrcnAZocWOghwegFIBVO8gFlC79KrVzc7pUimyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZ9fq7tPKg1KkcD6k1wWgBkErn34IbB7kf8bpa9MupA=;
 b=B9FhPVAPHifQTFfQLY2Vlh4+AUl6eLRXVTQ/b0cd1eDM1oUFPOBxiEeyVO6VuVAYQFbEcC8SR9ibJ11Nii7qmZx9FCWHIiTKc8J5LTG/VtqZZ3XyAukVJzPboCbGzrXIJ1A4VKa6/go2tHuAcanFWyphzUecMTZrXC8oaW/oe9QVQIrl2XWqmpxZgNiKHxcYZWHFu8lg8Nmxwb29xH4Roa0baHyD0Ek2Ljj1ZfKlYsUq+ck8AQpEWaoiq4hnCd92if6mhdH53fzjvuDw9mEFTTVcH6XtEk0XkcOv/oyd7rfLQzZOCNA0+xVY3sm0U/BRVmh4WV0g3Rs7SFSIDi7iqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZ9fq7tPKg1KkcD6k1wWgBkErn34IbB7kf8bpa9MupA=;
 b=5YUtCdIKgiQ/sKASrJOGBK1JIeVA8VEzjtyDFQ/x2RgynoMsa+fPcyqgEqodqk6vWylNZ1DywD3GmUi9ixsw1eC8U/3oHODMgHKB8KGaZTEdOYO3OAYZyn7nsjX5yp2PBV5cAcU5VdcTIWqr21N0U5If7nbWRxUP3diPcV0dwBrwqWwLs0zjk5k0MftchZeQn1a92/SEeQ96R0Lxn+774eEch5gqR11rWEbp2oHDf+XbqP+zi94VVZ3Xt90xWYYWy0fW4/DStvspYAoSllCs9JAAfHqsIfrGzxzkoRbJXfg6dndMQdDL+eRclWvBRFCNycuX5S+7L17LBABWZXsNyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55ef3754-f893-29fb-8504-27a309a9edec@suse.com>
Date: Mon, 15 Aug 2022 14:34:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-3-jgross@suse.com>
 <3c4fa2e0-1b68-6206-e2cb-b85b2cb790f9@suse.com>
 <3366d1e0-84dd-15af-417d-dd3633a09f4b@suse.com>
 <d55c6d62-8ee1-b1a9-94be-5798ed1878b5@suse.com>
 <a77660b5-7fde-0be1-98be-d7213a4e76cb@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a77660b5-7fde-0be1-98be-d7213a4e76cb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4b9dc55-47b5-41b4-d70f-08da7eba8f29
X-MS-TrafficTypeDiagnostic: AM0PR04MB6929:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ziFcRSYwp4JiuAm8z2arGGDqprCUG5kCg+m6+CLYHHH7gMtXgpxeWqH60535qRU+ArkNsmr6nuqJbXFAujkTYSsGTkOSWxWF3KnBO9H2TYHQgMuPQDbz1x4Ld3N+xrig2jhxu615Xdq6eQtzhfzuKLBcI4orY+dpb2w1Y/+RtV4pTGwDym/fHY4vUeyA/k0YCO+KczjVeGGk6mkOdr+PXp1GrUtF1VmtmOF3TftoT8Dm6GtZN7UvoxIeK85ieH+5lOyU5fRFi8qyVu+TMsnpA9D0ZujgCWjmAamq7vrbw2JJ5qfSK/D7qwActI//nDt7bfcQPVstcSfpQUswIDpXbH4ImXD9FFv/Uf9jydaQfyuq4GXjom6K2NgtJo3G+7jtaRWXqddCgZJ9l8fC5g5//v0dQPSwrj5M56Q75QePwnDo1nBpAdEuutNseOQJWFlHDrUK0bvcJCIwcRd6MCOJNrPxYC0UoEqebeiYgaUuLpIRbHR/IPHyXfjVMch2PSwy4E/MjxZ6tzq3KhZLGtIFNmTcKOezeeazo66NozCaz0rB9m8rzfjTEqcLzK1sVpdhq5GovJJzYBe1rw9E44lI+qQ+aX24fJoSmSUJNa5wQX1YQRkA+p8xnfIK5nJQhV69HmsungzxeiRzLHAsp/TADd5JkmKplNRgncBfYDAoEzLqy0Zf+EuQBw7Y2t08ktNdjReyFCnSnZRipkvG0O9EWl18L1i0y95L2swDqU7eN7ggtPiTB5Gtar5HmF31Ntf2eq49ADRLLaeR8VIDGyvhrR27fMMXBDP9K0eg8/Hc0J3458Xj3gHx4/2MUz4wiitkt9yyoqWdxM2pXONop/lOsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(346002)(136003)(366004)(376002)(6636002)(83380400001)(36756003)(2616005)(31686004)(66476007)(41300700001)(2906002)(186003)(66556008)(4326008)(54906003)(37006003)(8676002)(66946007)(6512007)(38100700002)(31696002)(6862004)(53546011)(26005)(478600001)(8936002)(86362001)(6506007)(5660300002)(6486002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmRrK3pWTnQ5RGtQWXJxRnVOY2JpTWFwRUlZMVFxdGl1aDlZY0pPQVhWdlFp?=
 =?utf-8?B?UWliWVkraHI5YUVDdzBpaDY0RWVVU3cxQzBETzkvWUNvNDZaNTVZV0VWZGs3?=
 =?utf-8?B?aWZvdmt1Zkl3WlBQSWMzcHlOeGpvcnJFcnBIeDllVVJDclZ5SjVzeU9RQmdD?=
 =?utf-8?B?UXp1SXdUV0I1SkE3L1QrYVNWdjNoL3BKdE92UXJUWU1NQXVLK3VGY0w2UElz?=
 =?utf-8?B?YlJvVkhYQU9xNFI5a3puTkM3N2orTzh6Rmd1VnJCM0dCL0drTWpjVFMvb0c3?=
 =?utf-8?B?bHEvUDhTVFhzaE9iVjlaNmo2MHF5MXE1eXBsNXhYcVBkRHFKL2VZTzJNc2ZM?=
 =?utf-8?B?UmxYdkNRSzVweDJpVTVqL0hrdEVHS2RhVW41eUdSZnFyOXVqNW40T29LVk5i?=
 =?utf-8?B?S0FkdnhzTk95Sk9KMStZTkN5SCtvcDRxKzUyaW9VMGVTV084MU0xYSt1SUky?=
 =?utf-8?B?bU11L0NXV1JaenVqL0tqVmpCL3JvTjdDdzdGQmhCVHkrbVIreWx1cWZWL2xH?=
 =?utf-8?B?UnlBMjNzVXRERGV4dndYRDM4dUdLTzl2VGlhV3BRS1RqVlVCK3lXNkhMM1BU?=
 =?utf-8?B?RUhOUnlwd1puZGROMDRINDNtQ2pSOCsvRWtQcHU4TDNBNGdsNDQ1UHhveVNQ?=
 =?utf-8?B?RlByV01YbTh2cS9vN2xZTXlKelhEQ2piZ3FYRFcrZ1dlSElnOFQxVy9aRVlo?=
 =?utf-8?B?SmFhdTZkeTFkYmQzZHVnczRVS0FaRUZESDM0eUpPRVVqVythcnJFbjRVOUFQ?=
 =?utf-8?B?TS9XWVFyZGxsVTdRNWJEeU9uVXR4ZzVCVmhtYnlKN0RLaEJ6cUtDSFNES29W?=
 =?utf-8?B?QWFPb3lITWdjOEhoV0JONEpmVVJmMUl6NWQ1Q2ZFUDFETkgvWXJ3OWdpeUc2?=
 =?utf-8?B?M1NsSEZPbnZab3hvVHZMQ0tocmVxTkRuRzRYSVBKTFZVcjJXN3plSDNaK0lv?=
 =?utf-8?B?bENVVnRRSkdHMUkvT29OUWNuV2xIWlZhYjdmeFlyNEZiUGtKK1RkdytZTi9C?=
 =?utf-8?B?WmxIekVSendSYXV2UUtlN3ZuWWtuek13aGtEMTdocVdTRVQ5MjNxaTZxbjU5?=
 =?utf-8?B?ZFAvc3JIS1BRYlBZWjNMVXBhK0k4ZVN0KzFaa0hkOHhLd1pjVVBTd3A2cGhJ?=
 =?utf-8?B?bUJqN05sWEl2UU96bGRmNjNXdWhKY080L2hsSm1FWTk4MnFoWko3ZnVNNGJL?=
 =?utf-8?B?aXVYeWp1YVZlMEdMK0t4K2RPRGFEaDM3aG5mVlRYeG4rclJScUVEUXpTNlBl?=
 =?utf-8?B?QjVKK2k1UUExcmFrSWo0dXV2dVZ4N29MaE1jTks4K2NrajVZRW5uVS9ZQUVq?=
 =?utf-8?B?dTRoOG1UZWhLRWE0M3hzMUh3YUxHYWlUZEt2Q1JrZUpRQXhIZHlPVFJiNkJG?=
 =?utf-8?B?R3Z3NG1VMW5nYUh2YXpjV2hUQzFSYXlBKytaQURCb0xmQ051NzEvTzc3bkZm?=
 =?utf-8?B?WHNzNnFiWnVPNEZ5cmc3Kzc4OTEwZG9uMlhCYlVTaEhaUmt4TjB4UFFQbWVB?=
 =?utf-8?B?MTlBa3diZlRxOFhwTVE4RjdNWElGUHJvMzZpdlA4dFZ5UFpZSFNmTTNwTVNC?=
 =?utf-8?B?VzJtOVRVKzFnb3orOG1JUlZsbWZUcldrY1VEQitZWEFWYmJPRzlsWjM3RmZO?=
 =?utf-8?B?d2EyeXlGdERCOUNjN1VkUW9mWlJMRVRJSURpaWhMekRraWsyaHNuRDlSYWFU?=
 =?utf-8?B?ZGt3Wnd6dW9ObVpGbjQ2OE1VM3RpMjQyNm51Z0tLRVhNbjFsazRJMms4czUy?=
 =?utf-8?B?T0MwNEIxenNUZytZQTU0SlppR2pvRnNCOHRUcitaYlRFU3Jvbm03OVpXZ0Za?=
 =?utf-8?B?aUtlbW15dnJaSHRsYUc3QU8vcURSWG5Td2FBNXFQLzl5aEU0UGg0Yms5a1Qz?=
 =?utf-8?B?MldOQ0JWdU5iUUlLUktwMWI4dldUd3B3dXRCNnkwT3ZaLzR4Rm9HS09NOFYw?=
 =?utf-8?B?cWx3aHEzQTMzYzJkKzg5Y05qd2ltbno4NlhBbnh2YkRKaDNrYkpDZEgrUk80?=
 =?utf-8?B?REpIL3F6aXVHY0c0ZDJxb3VkWmVSU0ZaejhtNmRNOE0rNTYrR3lQdGxnQ3pC?=
 =?utf-8?B?NkJjaU9WWVg4Y1U1MGlPR1lXekJjbEUxQi8wOGRCbGc5aVhKSG9EZHk0Szd4?=
 =?utf-8?Q?LYoJG5Hy/+EyYfnL/nkeusohm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b9dc55-47b5-41b4-d70f-08da7eba8f29
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 12:34:55.8653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHusij5L0yBKRT6u0qfp/DfbSvO+NIatVoQSH9PEYijXjj+nzMQpCSUAHLgWGzXEW0rp0YMqFv7G7qEsqXGGrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929

On 15.08.2022 14:16, Juergen Gross wrote:
> On 15.08.22 14:00, Jan Beulich wrote:
>> On 15.08.2022 13:55, Juergen Gross wrote:
>>> On 15.08.22 13:52, Jan Beulich wrote:
>>>> On 15.08.2022 13:04, Juergen Gross wrote:
>>>>> --- a/xen/common/sched/core.c
>>>>> +++ b/xen/common/sched/core.c
>>>>> @@ -3237,6 +3237,65 @@ out:
>>>>>        return ret;
>>>>>    }
>>>>>    
>>>>> +static struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu)
>>>>> +{
>>>>> +    struct cpu_rm_data *data;
>>>>> +    const struct sched_resource *sr;
>>>>> +    unsigned int idx;
>>>>> +
>>>>> +    rcu_read_lock(&sched_res_rculock);
>>>>> +
>>>>> +    sr = get_sched_res(cpu);
>>>>> +    data = xmalloc_flex_struct(struct cpu_rm_data, sr, sr->granularity - 1);
>>>>> +    if ( !data )
>>>>> +        goto out;
>>>>> +
>>>>> +    data->old_ops = sr->scheduler;
>>>>> +    data->vpriv_old = idle_vcpu[cpu]->sched_unit->priv;
>>>>> +    data->ppriv_old = sr->sched_priv;
>>>>
>>>> Repeating a v1 comment:
>>>>
>>>> "At least from an abstract perspective, doesn't reading fields from
>>>>    sr require the RCU lock to be held continuously (i.e. not dropping
>>>>    it at the end of this function and re-acquiring it in the caller)?"
>>>>
>>>> Initially I thought you did respond to this in some way, but when
>>>> looking for a matching reply I couldn't find one.
>>>
>>> Oh, sorry.
>>>
>>> The RCU lock is protecting only the sr, not any data pointers in the sr
>>> are referencing. So it is fine to drop the RCU lock after reading some
>>> of the fields from the sr and storing it in the cpu_rm_data memory.
>>
>> Hmm, interesting. "Protecting only the sr" then means what exactly?
>> Just its allocation, but not its contents?
> 
> Correct.
> 
>> Plus it's not just the pointers - sr->granularity also would better not
>> increase in the meantime ... Quite likely there's a reason why that also
>> cannot happen, yet even then I think a brief code comment might be
>> helpful here.
> 
> Okay, will add something like:
> 
> "Between schedule_cpu_rm_alloc() and the real cpu removal action the relevant
>   contents of struct sched_resource can't change, as the cpu in question is
>   locked against any other movement to or from cpupools, and the data copied
>   by schedule_cpu_rm_alloc() is cpupool specific."
> 
> Is that okay?

Well, I guess I need to leave this to the scheduler maintainers then. I
have to admit that it's not clear to me why all of sr->granularity,
sr->scheduler, or sr->sched_priv would be "cpupool specific". I may be
able to agree for sr->granularity, but the other two I thought was
scheduler data, not cpupool data. For sr->granularity in turn (but
perhaps also the other two fields) it's not obvious to me that pool
properties can't change in a racing manner.

Jan

