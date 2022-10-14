Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E265FEB32
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 10:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422583.668701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGRy-0001hU-Uu; Fri, 14 Oct 2022 08:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422583.668701; Fri, 14 Oct 2022 08:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGRy-0001f6-SG; Fri, 14 Oct 2022 08:53:50 +0000
Received: by outflank-mailman (input) for mailman id 422583;
 Fri, 14 Oct 2022 08:53:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+Di=2P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ojGRx-0001ez-92
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 08:53:49 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00045.outbound.protection.outlook.com [40.107.0.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7996d40-4b9d-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 10:53:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8457.eurprd04.prod.outlook.com (2603:10a6:102:1d8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 14 Oct
 2022 08:53:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 08:53:45 +0000
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
X-Inumbo-ID: b7996d40-4b9d-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9ph5jJGIbQk0jhro0ITmQDfOR666SsOi8bXcPRo5Q/BYTeLNSbA2cpI6U5B0U34e7iK+h8SZEND/eQGADWOchxHC2HIYGE6f9kOO6NZRCiD7kHZMdJyNXHea1KSVAHAJb+QNpxPwOrI8GBBjOUkobad8hT/aspUM8UoZ1C33zw22/F2hUAY16OYknz0NMlCMSXRzjTlNsrMyIqLnI/zpZIjJpyneK20LHYWz0JtobZjA92D0mUMLpOszQtOnmL81J4xNSJnIL/R5+O9SkRGVhJ/owE1ZNjat7jNKaf75pWANi/R3bJEswcVY4ID7BwiB5qKBqHMROEed3uY7VdKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLLl86NHmJ9KVDGDtDCnKOQpHqdA7n87l0s3nS2sLII=;
 b=WNcgNteEqlhG9STS6UExXwkI5De06tW6ntiaBrV5KjphzF1pkdzItaXvIVL93Jc1keTesIwZD6s3U8GFcebk1yBgr09UAVVXGVk79FP/n83zRkp0pz2XYlkU6HdKRbowXu7h7in3cHB577/LITFLyuvKe3ZlD1B12z8L2NxOjkYgdANYyVxhLGp1Bd0GSTCBbwJQQK5RibJG6Ybu7dtRTPfQV0s4StDEAMlW2M7zfDsvOyLKrx9Vy8xgikr0ciCdlw3xZXsqu5K/HE+/C9xmToa0Mhx7dK1dk8S4PIExBNj5aU2LI2vXyWWxgn6vUxiBMXytOhmZkCiCdSBKdLF1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLLl86NHmJ9KVDGDtDCnKOQpHqdA7n87l0s3nS2sLII=;
 b=Lfrf8RE535VdRD8hVHmOiTj2ZrYEno0nYGDrg4Tr/OvmZvaf+hA3J+PjEtHsJAud2jPevJOOFQoTtGLmc0kONaFMrhT+AM0qmyX1AUHw6sXJWu6Bqc+zcJC1K2plN4uDQZLiEkcgnblI4rahhErJ2lY9lZshAX3+fOJCuFIJP/i7nhMsem45QjLNo1e3N8zou012fyS+EVI25p7o2fl51azEthG8f/gzor2MVbL5t/6zLOvOlyrmNp8mOd9eph8ycAoHi/DOyEA2DBaDkeHR/guHX5Guzf4CVOwWr0EfKqSLT27ZRFkEMWfcd4VmwTk/cf+XEDhagwWakXU4BfcD2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2108f29d-3ac0-7243-d496-f1535e7dd5c4@suse.com>
Date: Fri, 14 Oct 2022 10:53:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 4/5] x86/mwait-idle: disable IBRS during long idle
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <38839202-426f-eb31-2997-ef557ab1583e@suse.com>
 <Y0f+gL1PfB5lzlDj@Air-de-Roger>
 <1867142e-ee46-daa7-c05c-04045460ba52@suse.com>
 <Y0gOOcbw2bebsKAJ@Air-de-Roger>
 <dd2ca7b9-f7a3-208d-f757-cf47f37de1ab@suse.com>
 <Y0ggOLWa7onsacmb@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y0ggOLWa7onsacmb@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d2a2c0-8eb8-4cb5-f1fd-08daadc19a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m9UieLslEWtIVSuozy0PKdvfYf0KCxEZ9wWJ/Cqm5RdZMj3xZI8Ulon8v7lj9HZl4Nrt6H0yjz62xbFFf29QZM5vHYtJOmhU52PYh66aI4agHC/+pbDdQGa/95sldeW7p57HOcSy/lJsf0OuspAdI8xeSv7bgw/cBOEOTlp3+XUG/Df5iBSRmL7LJXJHNQjTVbkdsixqi0Wuyz1GtAMb8f7VpPORzpNcErLaVwIrTFaib4yacyTl9HCQO4tZ1d6waml/vlBG78YdnUbDgN3jSA8LdBTXQOznbvSAuu2ebmzDJpbTXdJ9XYq6ShMu0abNXSzr7xd+3LkNTpc9kPEVl0WPDXefsUqrSpiKuz/i2dNaejYewG4C6ujVFVaBQa/RGng1kTtGZhgRmkFmJl6yrHzgCPwdL0IqIPoQ+2QdbXnIDKkv+VINTlrSFtFxCe6lkmpK+UPFcGyP7SlqCoBnCIaqy6FssjBeJILxop7N0E8xENqNdDuf+2wUcfedz88nHhZH5grDM5XZiHf5xs4yfwCe4ZR0sI0QXka8Wgt6oE9E5FtvTY6n2n23uPWgQa1Xx0nTsP/YD4n8GtWStlXjqLjf79poa9/MJmzwFHdSdam3eUDInpBNSw1fZfLyRRYCNmlRYpiGNCAfnHnHjGiVCm8XDX2daay3FMoNdBdouJwrjlAbYNMIO7EJQvjgixSfIG4+eNdTxeC5ZK909e9wL9tcTRTqB4z/Q6yNVAnbvHRYoTHS9zINtmEr6Gb1B4eRCr3Z9CnFxotmBAWbjgfMtKtEQtoiU6y0IpYa0QyJ6Ac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199015)(66556008)(6512007)(2616005)(53546011)(83380400001)(5660300002)(186003)(2906002)(6506007)(110136005)(316002)(26005)(41300700001)(478600001)(6486002)(8936002)(66946007)(4326008)(66476007)(54906003)(8676002)(31686004)(36756003)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnJHeUUxTE1BRnBCNElFQlhWQnI4NzV6M240TXFqR3pRcWRReC9iTW8waHNp?=
 =?utf-8?B?SVdCYmR2U1EzUkpKQkxkVll0elhzdDNJVFBIMVYrVGNpT0lmUDZZQXF2NTJS?=
 =?utf-8?B?elhsc3RLcVpMcGpOYnU3WXNiTVQyNTEyR2U3WEQ3L0ZkN3Z5cG9NVDZTbHZs?=
 =?utf-8?B?MnRtRVFFVm41SVRHSSs3N0lQNlBVdlRIWXE1RGtlam9xVnJWSTBwVTZXc2Vm?=
 =?utf-8?B?djhaQXl0WERxUURoa0Zud0R0clM2VGdoNGU3K0xYb1V1WjVNdzRSWFJFdG1o?=
 =?utf-8?B?Zy81S1JJRjVwZTN2elVkc3lpT2xyQVNrNGEvUUt3aC80d3V5MlVRNFZwOFln?=
 =?utf-8?B?YnMvNnhIUmRaMkpjRk53LzBTeGNRN0RvK20wbjZLb3NGdDhBQ3RoYTZpeFJ4?=
 =?utf-8?B?ZDczdlAwY1dVSTlCMjZWRGVnU2JHbTVPQTdZR2kyK2g5K1BPTHpKVW90clZF?=
 =?utf-8?B?M3AyalMvQ3NQUFVaT3UrbG02QUIxbElQdFF2b2s1blJ4QTlocndwV3c5b2k5?=
 =?utf-8?B?R0pMTFdOd0dnRXFVcUJzMTBjYkpOV203TGFqWVdRRk9XeFY2elRnRXY3aUQw?=
 =?utf-8?B?N054SWthZm5iekFrTjVUdHFOZm1XS0habmJzcU9JbXRKZWs5d1NtMURyeWRw?=
 =?utf-8?B?YUVqM3U3RWY0UFZBdTNtd0tld0NsUHY0dGxaMFJjMFcwWjlLcElrcXN1TDg3?=
 =?utf-8?B?VHZkZFNtNmoyaWc0NXNHUE9WdXBRQ3hKQ2dhSnNpN0JnVWs4SWlTM1J1OU5D?=
 =?utf-8?B?MFdFQlBERkdHUmNlN1o3eDU4UG5iR25ISzN4a284SThWRUdQV3ZYZVplQkc4?=
 =?utf-8?B?K1V4THNLQmhlWExTaGYrN0QvVzd6UmFOemo0Szc5Q3ZnOHo4cGlhMXNZSlJK?=
 =?utf-8?B?VmJ0aEJQRWdrMjlQbzNqeDJLM3ZxTEN5TU53bGxNN1EydUM0MmNubWRKR3dW?=
 =?utf-8?B?Zk82bkF5Um01Q3NxRWV4ZW1jQkhUM20wMFU5aFlWS1ZFdWgwU2xtYmJvRG03?=
 =?utf-8?B?YWNnbDE1ZEorUUtBQ2FxTlZlL29RVVB2aWY3a0hTSEJWbmdDNjRSeUhVR0lo?=
 =?utf-8?B?Q0NqR09WRW9wRGVIUXJqRGpNWU5YTG05Y2JhQXBjVlhnY1g1VXYySnhrdEFh?=
 =?utf-8?B?bTFpNFdVZm5VWGhVdzhJcU5La0RIS05aY0UzUkpYMWRYMGNsMmMyWGJHdE43?=
 =?utf-8?B?bldJQTBBR0hkbXF4bXpYQW9yV2hRVlk0UGlDb1ppc1daTy9RZmEvdThXQjRu?=
 =?utf-8?B?dEhONFZTb3hUNHpKclkrSSt4ajRUZEM0M09mYldSVlNlOFdZaVEyQVQ3aVF2?=
 =?utf-8?B?Q1UyUENQaXFzdHlMRkN4Q2lKUE4yLy9ERGcvdFkrdWJ0WHNHZGcwbXYvV3k1?=
 =?utf-8?B?YUVpSWxhc2NpRVZRTEM0MGJ2amM5K3hGcW4wbEtvV3hQUDhxRTltdTk2ZGdW?=
 =?utf-8?B?dk8renJkSHRlKzB6ZExicVF5Z3dHRStVUUpYSmJ4V3FjcmVRQ0ZwdlhJS2M1?=
 =?utf-8?B?RGc0d3lvNUlvWTFuTUxJYTF2cDExSzdLZEppaUdVRGZlRWxZWm94UnR3RCtl?=
 =?utf-8?B?RVJHRTV4eXc1TUNMRzRvVkJvWUZibVBTYVIxMk50NUJMeWtoQWpJd2pjMm1h?=
 =?utf-8?B?KzJFMS9VQVRRT25nSXNnT2xsaWpjdCtsNjFyQlIvR3hYRmJpQXVEOFIrK0xE?=
 =?utf-8?B?OSt2MG1rUG5jWHIvWWY2R2k0V01Tdk0vbWE1c2JLSFhCWlQwUldDekxXa05m?=
 =?utf-8?B?RUhYL0lubWxYcVZzcGY3N2dNSVFTL3hWeUFva01pZ2owVzMreXAxWWh2aHA3?=
 =?utf-8?B?S0s3RUFmWWZZZlUvQkxXM0ErRVNWMmJJVjFHajU4T0p0NjBzdFZocDdVcmhN?=
 =?utf-8?B?RjlmcnZpdWY2R3VUNW82U21jVjE3TzRMNS9tNTIrUjlzZE5kNld0N3N6RkI3?=
 =?utf-8?B?OHBCYjY0dElaRjErYlhmUFpjWU5jM2R2VTBNc1FLRTcvbzQxbG1oZWIyNnc1?=
 =?utf-8?B?dzk5cSs4Ukg0RWUrelIxNGI5TU9neWJkYzRSdnU4bUNzSkkxYjdGbTZJaTNZ?=
 =?utf-8?B?NWt3eHdwbEhtSHpSVFFHTzJ6alhRa0tieFVDYUJxM2NjTnpYdU1ndlhEMHZy?=
 =?utf-8?Q?B7wVojW4CnLG03GBvBIPHgZTj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d2a2c0-8eb8-4cb5-f1fd-08daadc19a09
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 08:53:45.1920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWpA/8vGmriDyNSv4LBXogmqReTOS5ek9vkydCnqo//SEfeDobkVjxaR/u9BtdTDt2njnq33lNi2OncfWjSc+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8457

On 14.10.2022 10:03, Roger Pau Monné wrote:
> On Thu, Oct 13, 2022 at 04:15:04PM +0200, Jan Beulich wrote:
>> On 13.10.2022 15:10, Roger Pau Monné wrote:
>>> On Thu, Oct 13, 2022 at 02:17:54PM +0200, Jan Beulich wrote:
>>>> On 13.10.2022 14:03, Roger Pau Monné wrote:
>>>>> On Thu, Aug 18, 2022 at 03:04:51PM +0200, Jan Beulich wrote:
>>>>>> From: Peter Zijlstra <peterz@infradead.org>
>>>>>>
>>>>>> Having IBRS enabled while the SMT sibling is idle unnecessarily slows
>>>>>> down the running sibling. OTOH, disabling IBRS around idle takes two
>>>>>> MSR writes, which will increase the idle latency.
>>>>>>
>>>>>> Therefore, only disable IBRS around deeper idle states. Shallow idle
>>>>>> states are bounded by the tick in duration, since NOHZ is not allowed
>>>>>> for them by virtue of their short target residency.
>>>>>>
>>>>>> Only do this for mwait-driven idle, since that keeps interrupts disabled
>>>>>> across idle, which makes disabling IBRS vs IRQ-entry a non-issue.
>>>>>>
>>>>>> Note: C6 is a random threshold, most importantly C1 probably shouldn't
>>>>>> disable IBRS, benchmarking needed.
>>>>>>
>>>>>> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
>>>>>> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>>>>>> Signed-off-by: Borislav Petkov <bp@suse.de>
>>>>>> Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>
>>>>>> Signed-off-by: Borislav Petkov <bp@suse.de>
>>>>>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git bf5835bcdb96
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> Thanks.
>>>>
>>>>> One unrelated comment below.
>>>>> [...]
>>>>>> @@ -932,8 +939,6 @@ static void cf_check mwait_idle(void)
>>>>>>  			pm_idle_save();
>>>>>>  		else
>>>>>>  		{
>>>>>> -			struct cpu_info *info = get_cpu_info();
>>>>>> -
>>>>>>  			spec_ctrl_enter_idle(info);
>>>>>>  			safe_halt();
>>>>>>  			spec_ctrl_exit_idle(info);
>>>>>
>>>>> Do we need to disable speculation just for the hlt if there's no
>>>>> C state change?
>>>>>
>>>>> It would seem to me like the MSR writes could add a lot of latency
>>>>> when there's no C state change.
>>>>
>>>> HLT enters (at least) C1, so is a C-state change to me as well. Plus
>>>> we may remain there for a while, and during that time we'd like to
>>>> not unduly impact the other thread.
>>>
>>> OK, but it's not a "deeper C state" as mentioned in the commit
>>> message.
>>
>> Correct. But it's also code not being altered by this commit.
> 
> Indeed, that's why it's an unrelated comment.  I was just wondering
> whether we should drop those or not in a separate patch.  I'm
> concerned over hitting that path on a virtualized environment, where
> changing the spec controls is likely not that cheap.

Perhaps we want to make spec_ctrl_{enter,exit}_idle() a no-op when
we're running virtualized ourselves?

Jan

