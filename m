Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB165FC49
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 08:54:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472353.732545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDhYT-0001xd-8f; Fri, 06 Jan 2023 07:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472353.732545; Fri, 06 Jan 2023 07:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDhYT-0001uw-4v; Fri, 06 Jan 2023 07:54:21 +0000
Received: by outflank-mailman (input) for mailman id 472353;
 Fri, 06 Jan 2023 07:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ggnj=5D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDhYR-0001ua-9e
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 07:54:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51c2c393-8d97-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 08:54:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9127.eurprd04.prod.outlook.com (2603:10a6:20b:44a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 07:54:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 07:54:15 +0000
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
X-Inumbo-ID: 51c2c393-8d97-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQDvcmMxiwkn2ol/77g7DO0PUSbnXsXb1q6nvfNxR7/bQapPuaHkQ5AuP0b/FxV0r4DEfVI6OGXNTBdJDs0+an4T2sONOays7fyEu8aomnIgzILfE2Sd4NLELkNWy6j7uYlTF9v8GdrvMP0dss1tsDLZ51fY/wpy4JpCREWjGtBDEBkVVMmJ7rv9iZ1WeNtqYY4IZKugOn9KBApf4VuJOYT+j4/R8SJAgCfhSbphuZhyMs6CyNnBLGzmYCRWscoKWuNflb6Kn5yJh8hbI6p3CzoXZd0vaue+xebqOtiKFXRnklE9C4IVZzWFCUPRSxjosvamySqVOZYLr4v7a+YfYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFq0d37GfmCTvGfcS+p64VQhkk9QauO6RTWgA1aQC+c=;
 b=KoMJqrubLyEJtRq1y6MtQNRM26P4tmdtl8Msw/OyWakwIzoaKi/K4/VBtUWa0Tlc5BD50Jq1ypLjZjYbieK6OeNMo0zZmGShs4JTtXk64HhMzJNMSLpcmVJmw57xl7GbhSDJGObbrxnLYcGg2HAG9JvflYSqF2TC04cWf1WgF+DQz63a0QqIY6tpVc/5RIO9xlb6/nd6r2zJtn8BSVoxucq5ccxw0ugGxxh4B1UlmaisuPSSwgGPB6CTKgN+9N+UY0CNEywDxcKbZJNPqu6rRxMpA1zxJZpIZMOVbZyfWQCWldB/747jCxFHWccBtQrByHatSLVKwFIV63NmGGbEdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFq0d37GfmCTvGfcS+p64VQhkk9QauO6RTWgA1aQC+c=;
 b=ao79GPE7HsGd2D62XNWsLHdWYCcJBZsedDnf4c0MBbFaqh77qZsmx2Y7seyTWwlQnvwI4FYjPywUd7nASCpFlRZjM4isAE7OOHEj7ljtQeob7eZ8pAlJOl6FYEKZbibseVk03PRNQhHO6IFNP1Y+0UliIZuFoCQr3BIVRJ+eiTYmFUqL3P7uPrf5lvjbj6+3OAKhA21j/meS5e8BrprptuMik+IaQjJKHPXadRwEBQhOslqo73TI4RyWDW/wKiI9yaVX2Hv8/OUndZfkj+Gs6eBu/sbsGKqQisnZYpH2vNo+HooK1gyFf0SWNYvRzIkL/3xZmDlEy9ycGBgFI/jYdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a65a4553-d003-1a8d-abb7-5d8c1c9fface@suse.com>
Date: Fri, 6 Jan 2023 08:54:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] xen/version: Drop bogus return values for
 XENVER_platform_parameters
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-4-andrew.cooper3@citrix.com>
 <540a449d-f76d-eb16-4f98-c4fb3564ce98@suse.com>
 <7dd00ce3-a95b-2477-128c-de36e75c4a34@citrix.com>
 <ebaf70e5-e1ba-d72d-84f2-5acb7e38a6bc@suse.com>
 <9ce20298-5870-aa1b-ee5e-e16a623beadb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9ce20298-5870-aa1b-ee5e-e16a623beadb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9127:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eaf4153-e3cc-4233-ca2e-08daefbb34e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xHrmCoTqOQ2dHghrY662x85f+6ekiqYNk4NcKcz30GlAtcJnMgL6kpPUREXty4Xd+HtLOs29LnN6pMtr8dSzCCj0lZhtzm+3J1YsuytuFSuC4PovXxPUcyF6cOd8VCBuBT/+agVx2yJk0E2stzimJ7vkwxkK2HrX7LbzBYrgbZN3aYXX84Ry7rFxWApvb/UuW19XH8dKOvmFLlRkrn1RJJQ4m6cEZ3HKmXVYglriJBDlOEi/WDwbQBVJ3Tw9YZ73gfrvqFT8/h7rkqvYMvHo1dNFl1qTQQZbeJOoNd42h/2LLme3Vb75DbqOITZWptNcfmUNjBz5pzFAk9DL656TCodSkdSgqP89uvPEqGLzFgZNxitJ60v3VSXCOA4AbC1XtkEM3IS9AGpKgxWktpIJdlp7ql6phGEwvIgKa2TxyFlKQ02VqWsUEy/X6RgmR9HgUdTqjzmrTMDTGotJmcNEqXL2QKrPk+SCCooBI4mDGXyvwpN34cLF02jhUmiFLnhkN2FRar/kxsfvkkbSQcEaj2J3xPZcN/0iQWR/5KwZu6PLZSrvWt3IXFpGi8tXKZ5byY+GYjz1vm/jQjL40cE5ePiUiNcwEhpPYWfr0H58rTsvOUJWSiLZG4RhAFOpIy3L3GkhK5pFaz3evADlnbxqN9qeUpn7ZPBP7+ex65eEkNXOWjSZ+5QiGjFtom9ILBjkm/LhO3cQV/VY5eaRRQ3EdEBrRuyUKzPoeTzU550l5qg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199015)(2616005)(186003)(26005)(6506007)(53546011)(6512007)(31696002)(86362001)(36756003)(38100700002)(8676002)(4326008)(316002)(41300700001)(31686004)(2906002)(8936002)(5660300002)(6486002)(66556008)(478600001)(66946007)(6916009)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUdjdEJ4aEFReGxEZDNtSU1ReW1oMUViaDFCODNIZENvenNwNzRrd1VQUUtw?=
 =?utf-8?B?VGltWStsTXoreVBkelNXcEMyVUJDRm9WWGZNdXFIOVZ0eHZySk1LQnViUHhq?=
 =?utf-8?B?YldVc3lEdDd5SHEveGQyUW0rVS9QTUR2czcyeTlZNXl5WTBvdEszMzk0MXlR?=
 =?utf-8?B?TXl3RXRLQTNCVGJYOW9JbzZzMDNRaldiaXRUbG5hZXBIRnhKNFR0TnZDeGZp?=
 =?utf-8?B?TitwNmpZeXVuVWN1VTZMMkxjV3JZelZBbGFoRUFkWlFqVWNNNTlqcXRRYlhY?=
 =?utf-8?B?bEtoMzAvUGRneXQxTkpKenNQYy96UGNPbStaM1VvQlF3MG9vSCtRSFY2eDFm?=
 =?utf-8?B?Q1NrZHpYUjV3amhzRmhIRXVweEtjUkxmVElZMHlKTW5XcCtnM3ZRV3Y5T21X?=
 =?utf-8?B?ZWk4MU1oM0VQc09BelQ4Y1A1S0QrWXBmSjhCblhvSkpMSkxNaDNiU3gwdGdi?=
 =?utf-8?B?bGdZVTFld1lxM1RMWlRVL3o5QjR1Mk9HaUpZcFRMZ3ZhQjIvQkNLU1ZUV1Vz?=
 =?utf-8?B?MWlDdGFBVy9iQ1Zya0FDUlVmbVNSekVSeVlHS0psWG1pWlVUL09aeUxKak1G?=
 =?utf-8?B?M2FqeEptN1V1UWlGVUlxVXdRV3JtSjFqV044NzRmS0dpZkRPQzlGMUMzeHV5?=
 =?utf-8?B?VDVYYWJGWVc3L3N3TGs2T05LcHVLSXZUMWRyTlFFTFJiZjd5N3MxRDVqYjRj?=
 =?utf-8?B?YlNoVHV5WmZoWWx6QWYxQzFhZThIelBpTm95RzhvcDA2UDBpa2pQTVdldlF0?=
 =?utf-8?B?OTVMOW84UkFwTEdJOXc5aC9rRFZiZzhtNUh5d3R0Zkc5NXhtZzV6LzdmWFZk?=
 =?utf-8?B?OU5BbWtlNnVMR1NJMkNhZ09RejlrY05yYWN5WHp5cFpUTlVKcm9uSEU4VTRZ?=
 =?utf-8?B?VlN5Qmx1M2FrT1g4NGZ4ZzZqcUhKMzFtSDFwaFBvbmdJdjhCMjhEd2dnQlBC?=
 =?utf-8?B?eVh3Rlh4ak1MUlR4Q1VjZ2x6a0VuaGUvempWNytPTk5qQlYxMnJ5OVhmVkhQ?=
 =?utf-8?B?MmMwUUc2N0FWMkk4SjI1L0dSdXFoNU84TzNOUzZiN0FOWjFLNGNYWmxobHlE?=
 =?utf-8?B?RlphQTlRa25acXBsM2ZLWXI0Umg5UlhTSzFjZGs3SnRJYTM4RnRBUTVHY0tO?=
 =?utf-8?B?bC8wanJTVVEvSE5hS01KK0tQNitLeUlKQS93U1NzV01Ocmt4SlkyRCtwVWF2?=
 =?utf-8?B?SkFwQ2ZHcEc3TEl5VExHRlBDcEJlYWRRbmJtYTNjVnJTNDB6ZXV0OStGR09w?=
 =?utf-8?B?QlROUkU2bWNENzJSYmxBSWNYeE5Nc01obk9ON2EwUHpWNWtyd1Z4QUYwaDNq?=
 =?utf-8?B?U2hieTlEVjBqWStHMUZsUFJ0RGtVWmQydUdNL2N5NzRCejk3Tms0b0MzeGpx?=
 =?utf-8?B?YmFlM00vZXVDcGFUNm5yRFRNWno2V2hFQXFVclEzT3hoTFF1eDIwdUQxU083?=
 =?utf-8?B?eXNxcng5U0ZqVjRKelcrTFVHN2JmSzkyZ2lJUkNoa3hRdkIwVEpBTnZlSWxN?=
 =?utf-8?B?d2IyeVkzenQyV01WSWtRRFVWYTc3TXNnemJFcjN1MFBrUGZsb1JGUVRIRkNG?=
 =?utf-8?B?Nk9kRXNEb2IwUUJhRzRGRG1YWTF1eC91QVFGUHRJM1Z1KytPS0NGeEVQd2N0?=
 =?utf-8?B?dmlDbUhWanhCNUViZDlaVXVRTWZXN2RVNmI3VHZaUHNQV2VvbkZYd0RvemlQ?=
 =?utf-8?B?QmRYbzVuWVNzUUdxUlY2emZYMlJBVDJtWkRpazNvQVM4TGQ2VWFjRjZoOGtJ?=
 =?utf-8?B?Wno5NFVmbU8zNFlzcmk2azJ2eHVJNFZoaG9keWhleDFmaWRRSDBsNDRRYnFF?=
 =?utf-8?B?ZGtBQXZrTW42bDlyY1haVmJraEQwclJpSWV4bTJua0toQ0lsaGFKQU9nWmtT?=
 =?utf-8?B?Sy90Kzl3dzVtN0RDK3YvVExNUVhTT1VrbElUdGFYQm5rWHFPajZhNi9QS1R6?=
 =?utf-8?B?UGxtVmRQakZIUVY3VGx6dDFsdGFRNk5MU21DbittSmtOYjlmWEsvVXlPMVVH?=
 =?utf-8?B?RWNPSFUvLzhEdlI1NHJ2WHgyOVRib3Ira1RJZEFuZGFHaHdmQ1JQazBwbVVk?=
 =?utf-8?B?U293S1lOYm1wUFM3QUtLdkUydEVNZkVKODJNajgwL0dNSWFMYmVMakJMVHR3?=
 =?utf-8?Q?v/cwUaHW6GpULbqk0jjHvKHGP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eaf4153-e3cc-4233-ca2e-08daefbb34e6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 07:54:15.3528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLwAO2Wedall6vsCujEvsec+C8SuXXHVlARz8iE/W+WkP8qssY9kfvbC+D6XbN7zz05xCsBlSchiuq6KwhRotw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9127

On 05.01.2023 23:17, Andrew Cooper wrote:
> On 05/01/2023 7:57 am, Jan Beulich wrote:
>> On 04.01.2023 20:55, Andrew Cooper wrote:
>>> On 04/01/2023 4:40 pm, Jan Beulich wrote:
>>>> On 03.01.2023 21:09, Andrew Cooper wrote:
>>>>> A split in virtual address space is only applicable for x86 PV guests.
>>>>> Furthermore, the information returned for x86 64bit PV guests is wrong.
>>>>>
>>>>> Explain the problem in version.h, stating the other information that PV guests
>>>>> need to know.
>>>>>
>>>>> For 64bit PV guests, and all non-x86-PV guests, return 0, which is strictly
>>>>> less wrong than the values currently returned.
>>>> I disagree for the 64-bit part of this. Seeing Linux'es exposure of the
>>>> value in sysfs I even wonder whether we can change this like you do for
>>>> HVM. Who knows what is being inferred from the value, and by whom.
>>> Linux's sysfs ABI isn't relevant to us here.  The sysfs ABI says it
>>> reports what the hypervisor presents, not that it will be a nonzero number.
>> It effectively reports the hypervisor (virtual) base address there. How
>> can we not care if something (kexec would come to mind) would be using
>> it for whatever purpose.
> 
> What about kexec do you think would care?

I didn't think about anything specific, but I could see why it may want to
know where in VA space Xen sits.

>>>>> --- a/xen/include/public/version.h
>>>>> +++ b/xen/include/public/version.h
>>>>> @@ -42,6 +42,26 @@ typedef char xen_capabilities_info_t[1024];
>>>>>  typedef char xen_changeset_info_t[64];
>>>>>  #define XEN_CHANGESET_INFO_LEN (sizeof(xen_changeset_info_t))
>>>>>  
>>>>> +/*
>>>>> + * This API is problematic.
>>>>> + *
>>>>> + * It is only applicable to guests which share pagetables with Xen (x86 PV
>>>>> + * guests), and is supposed to identify the virtual address split between
>>>>> + * guest kernel and Xen.
>>>>> + *
>>>>> + * For 32bit PV guests, it mostly does this, but the caller needs to know that
>>>>> + * Xen lives between the split and 4G.
>>>>> + *
>>>>> + * For 64bit PV guests, Xen lives at the bottom of the upper canonical range.
>>>>> + * This previously returned the start of the upper canonical range (which is
>>>>> + * the userspace/Xen split), not the Xen/kernel split (which is 8TB further
>>>>> + * on).  This now returns 0 because the old number wasn't correct, and
>>>>> + * changing it to anything else would be even worse.
>>>> Whether the guest runs user mode code in the low or high half (or in yet
>>>> another way of splitting) isn't really dictated by the PV ABI, is it?
>>> No, but given a choice of reporting the thing which is an architectural
>>> boundary, or the one which is the actual split between the two adjacent
>>> ranges, reporting the architectural boundary is clearly the unhelpful thing.
>> Hmm. To properly parallel the 32-bit variant, a [start,end] range would need
>> exposing for 64-bit, rather than exposing nothing.
> 
> The 32-bit version is a start/end pair, but with end being implicit at
> the 4G architectural boundary.
> 
> If we were doing 64-bit from scratch, then reporting end would have been
> sensible, because for 64-bit, start is the architectural boundary which
> can be implicit.
> 
> But there is no such thing as a 64bit PV guest with any (useful) idea of
> a variable split, because this number has been junk for the entire
> lifetime of 64bit PV guests.  In particular, ...
> 
>>>>> + * For all guest types using hardware virt extentions, Xen is not mapped into
>>>>> + * the guest kernel virtual address space.  This now return 0, where it
>>>>> + * previously returned unrelated data.
>>>>> + */
>>>>>  #define XENVER_platform_parameters 5
>>>>>  struct xen_platform_parameters {
>>>>>      xen_ulong_t virt_start;
>>>> ... the field name tells me that all that is being conveyed is the virtual
>>>> address of where the hypervisor area starts.
>>> IMO, it doesn't matter what the name of the field is.  It dates from the
>>> days when 32bit PV was the only type of guest.
>>>
>>> 32bit PV guests really do have a variable split, so the guest kernel
>>> really does need to get this value from Xen.
>>>
>>> The split for 64bit PV guests is compile-time constant, hence why 64bit
>>> PV kernels don't care.
>> ... once we get to run Xen in 5-level mode, 4-level PV guests could also
>> gain a variable split: Like for 32-bit guests now, only the r/o M2P would
>> need to live in that area, and this may well occupy less than the full
>> range presently reserved for the hypervisor.
> 
> ... you can't do this, because it only works for guests which have
> chosen to find the M2P using XENMEM_machphys_mapping (e.g. Linux), and
> doesn't for e.g. MiniOS which does:
> 
> #define machine_to_phys_mapping ((unsigned long *)HYPERVISOR_VIRT_START)

Hmm, looks like a misunderstanding? I certainly wasn't thinking about
making the start of that region variable, but rather the end (i.e. not
exactly like for 32-bit compat).

>>> For compat HVM, it happens to pick up the -1 from:
>>>
>>> #ifdef CONFIG_PV32
>>>     HYPERVISOR_COMPAT_VIRT_START(d) =
>>>         is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
>>> #endif
>>>
>>> in arch_domain_create(), whereas for non-compat HVM, it gets a number in
>>> an address space it has no connection to in the slightest.  ARM guests
>>> end up getting XEN_VIRT_START (== 2M) handed back, but this absolutely
>>> an internal detail that guests have no business knowing.
>> Well, okay, this looks to be good enough an argument to make the adjustment
>> you propose for !PV guests.
> 
> Right, HVM (on all architectures) is very cut and dry.
> 
> But it feels wrong to not address the PV64 issue at the same time
> because it is similar level of broken, despite there being (in theory) a
> legitimate need for a PV guest kernel to know it.

To me it feels wrong to address the 64-bit PV issue by removing information,
when - as you also say - it is actually _missing_ information. To me the
proper course of action would be to expose the upper bound as well (such
that, down the road, it could become dynamic). There's also no info leak
there, as the two (static) bounds are part of the PV ABI anyway.

Jan

