Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A468562B532
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 09:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444223.699194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDlb-0003jW-BT; Wed, 16 Nov 2022 08:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444223.699194; Wed, 16 Nov 2022 08:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDlb-0003hR-89; Wed, 16 Nov 2022 08:27:31 +0000
Received: by outflank-mailman (input) for mailman id 444223;
 Wed, 16 Nov 2022 08:27:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovDla-0003hL-32
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 08:27:30 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130077.outbound.protection.outlook.com [40.107.13.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81a98aef-6588-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 09:27:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8651.eurprd04.prod.outlook.com (2603:10a6:20b:43e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Wed, 16 Nov
 2022 08:27:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 08:27:00 +0000
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
X-Inumbo-ID: 81a98aef-6588-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1ohmuKgWOBw4uLj60NtPVaE0iThQzfSQ8BVuG8z6fam6ZcP3i5qvJ1I0jRl5CXDCtTqnWKwEZ9m+D1Zsd9BFSU34HpiNDaDlamA6/E+aTrj7+2PPvWdoTfvvcHHVdL0WixsFI37a/NzqsefpDTt0LAX0GOBvq8EtQ3kJHMCAetrNVgrn6ZkjbHjdXHC4IvoAAHQ/48rWzTHFsBYcIPsst4XZg7UHft9BEyUalmRGaCHZeMKuAdGf036mI0EQLe6BvQLNQzQf0d1O1ZSybnaBWj+O3MR2brttaoD68z3lTbX9AfCJzUSlELZkfIzS97HX+kvtL7+VN8BwoVnLsko8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLGdDMOOC/ygyuSi8a2hmVUDtBb5YksZXW/kX2+p4DM=;
 b=GjqKVibOT1lIWq5tNnEIC+LaHPgGdgLpUHFeXA5FIiXglltVyv/kKI9Q7dlWwtqPeOb32SRxc1ih4vYFC/7goTXPcRPMlRmEBeqKqR9Yt+ATCacoAP+cs+o6zUlqYK7me+zaPWT5Lt4BztKM0Fn0FKUDHHiC+xLUWzFMuEUGdQQB/ktFw7KIWlva/k4rL+xv4g8bfQXreJN0d5h6+aSbmOUVao/V5dT4CfOFB523kLLbOWBwyXv+6HjXn3vUVPqibh0/NKDwWD7NrylWgG7WHQ4JLTsNO+7nYs6l+5+OBcs6EvpQLNHQSXvZOTuvic28OMTT/It86Y/zWhtONhCusA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLGdDMOOC/ygyuSi8a2hmVUDtBb5YksZXW/kX2+p4DM=;
 b=TX+ApB/cT7QJSgp0XIHf8RljuS+MYcpNR+st2yukcR+3oeqSF7JHcmEd74EVqwsXCuehqcSCuVMhFFqn+zQvPn3STlBGRbbjbBy15rqWbGpQIbocHUhJ6vRZ4IkqVtixKUh1dkGPEOKiBCFLTFHhtymumtkIW54BgBd6mYyUb2U6ljtOPrCy+Kank/IikI9mbY5V8RT26qqYG3AVAeqx1T1WwY6YghAM8kXsIyqO5DQS61nfw7OUDb3VNspD+D3PfEf8q4BnLIAEZPt8Q5/KEQQ85HN8v+n2YLd8PwtPDKtnRd+YxEId7gCqLyjNqP6+uJKaelTAlJQVBOf40HXQJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9896fb80-351d-2f4c-f672-ab55f436899c@suse.com>
Date: Wed, 16 Nov 2022 09:26:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the p2m pool
 size
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Henry Wang <Henry.Wang@arm.com>, Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, George Dunlap <dunlapg@umich.edu>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-2-andrew.cooper3@citrix.com>
 <ffb8bdb8-f54b-2107-ce1a-775337c172ac@suse.com>
 <0f048bd2-d08c-8bd5-2a20-7e49e794c679@citrix.com>
 <8a8bc184-6237-ed24-8d9f-daa3c36df915@suse.com>
 <CAFLBxZbWkLSMxXAYRGYc9Z3Vvj6bT+m7nvdiZgWRdr+_nF0BfQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2211151715540.4020@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2211151715540.4020@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: 84e5454f-67aa-4d60-c56e-08dac7ac54fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DKXqy5RYaB02JtSe/h2+Sv/ceEadwb3Q91WQRI+96Q0TEjodou4yRp0Cs3D96UBhaDmJtMckRvjIZCJNDQtNlW4vUyU8o9pSZ7vPxXZll76rN0+yMjNYU4sEEHY5GfLcsm2ASvPmZRY8+fiJ6SZGfNHINhPizuIVa2hc0Yz8asscu9hWOpSAWABvVKUzzH8i3FUpTdpR+Uer42uHJmAm+EyAiOA/b4mfaRE4dsVvjXORcXnlkA8foIxblXZ3GMqTL/JIiAfbv0AhIhws8gR3VQ/cxNyWEBQdWp8JrV0xf1P8bmllvKINqJV1fDh332tEyIA9n+X3zbU+aQN9lT+YKyhQWoOq7AFSslUoe9Z/PX1tCd97jTGqeyFlLJ2fT8oIdoRD5FLKcUR0kvTMOKlboGweR9dVMpPrYbvFs/av85NvbMzvJjq39wYLR1dYfwp4A4VAmIGsKVsDFeoYa1e18m2HADQAcHlonMah4u9V2Qgpa9CNlu1iWVy1iZPI8wv53x85Zfudl53qu3GesVKgsp8uZVdBlbqM3FGxN2/uRMAlzqPDThLRqQ6JQB37cSy5TlWaUnDbR/y5LWtsGT8iBNxDfvky9n7OvBznD4zUjvQnjdIujmMUjZRSzJjjionqCg6UFDNC50xa9scYCnVZhW4zb4ghX2FG3tH+4+Q4Co63tvpdETCZ/3xk6JHbUam+VFQkHa9aUSdIqRXox6P5toGyZzIv/0WWBJ+hyxXHGuLSF97SmrnXKnqqywF5uJefoowa5K1n91eU6QkWwh5wX8qVnS6hRGWulWJfjN8grZ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199015)(186003)(26005)(6506007)(6512007)(36756003)(86362001)(2616005)(41300700001)(66946007)(66556008)(66476007)(8676002)(4326008)(53546011)(83380400001)(6486002)(31696002)(478600001)(6916009)(54906003)(316002)(38100700002)(31686004)(2906002)(5660300002)(7416002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEh2VDE5S1JPNHM4N2ZGRWlXLzc4S1UxalU3RWNqUUVvZHVzVXFRZ2ZuckFq?=
 =?utf-8?B?VUNKdXR4clZOMDFyTXoweUNjNUowSXdIWUdONndKZTFHNlRMSEdHZ3pBMVQ5?=
 =?utf-8?B?VlN2dWFteXJyeFhFa3NzTHhwY0dpWUVYVHVINDg2Wm1pUU5LU3dwNm1vKy9z?=
 =?utf-8?B?bytZT29QWUdhRjBReVo2aFZScVN0bEFSUXM4SG5pT3FJcXEza0VMODJJaEtV?=
 =?utf-8?B?MXI5WkQrQmRwMDQ4TjVjTENBNEJheDBxN211ek5Zb2ljVUR2TjU3YlZqRFo3?=
 =?utf-8?B?Ykd2Z3hQY3VpeXZ0eHFjVVlIUGFXS2c4RHBaTkllZ2E3VnV2YnRmMDFJU3F4?=
 =?utf-8?B?ZUMwMitSVldVZG1iQlRUamNqdkZNVG1Td3FBVmZudUJzUXlBdldKaEdQS0tX?=
 =?utf-8?B?NERkYWF1bFdMZkRRbFJiTE5GRWpWRWppVmdXVGtsSUlzcWp5VXUvMXFrbWhJ?=
 =?utf-8?B?QnhPdHBTYXlGYkVtQXRKLzVmT1dyV0pOQUtGa1dUOWRzZEppZTlZZnkzZUlD?=
 =?utf-8?B?SkVaTVUzS3dyRkI2OWRMVUc1emllcVpRWlJsSDRrUTdoMTJ2Q0Z0TmdTREVt?=
 =?utf-8?B?Zkc0QmJRRFViMHVpamUxZDdMeFRZOGQrWHRmeEhvd3VxbHR3ajAxTVkrdEtv?=
 =?utf-8?B?UGpSeVlEK1hlOENlaG1pdXU3NDd3dU9xRngyZmhoZ0dITVVSbGY0MjVxZXdJ?=
 =?utf-8?B?S1NZM0hObkJzMDdPdmRXMUIzVmEzRlNyUkU4cEZHZXprWjlmYTI1MHAzZ0RF?=
 =?utf-8?B?RnE2ZW1rdkdIbjNPYXg2OVE5QjEzcWRXVE5xcUY1SUlWaXp3eVNJYlVmQzJm?=
 =?utf-8?B?eWdwZDBPa3M1NU9UaSt2Ry9WWm9RSHVBd2QrNVVBTzNxdHgxd3JPb2s1RWp0?=
 =?utf-8?B?QXNlSzRiM0M3b0hjOGlkRXpyRUszSFpOVm84QVhGcC9XWXI5RENhb2k1ZDRh?=
 =?utf-8?B?d2lPbFpRUGVJak14YXoxSFFFQmxDcU16ZU9oQk82SUlERWJJZFkvOXgzWVFl?=
 =?utf-8?B?QmkyODErVXV2L0xXUTBiTzJxQjh4T0I1eVJhZTVJaGRBSUVSRVlSUW1ETTFq?=
 =?utf-8?B?MDNUZEtKanNRc2dNT24xeVEzdDNXZ3pEeGhveGpSVnk5OWQvdHh4VTRQYWxT?=
 =?utf-8?B?d3lkeTM2dHZLUHIwQkJNVXQ5Y3dmbHlCQ1RlZEdVUHp0OWRMellLU0xYUmdp?=
 =?utf-8?B?QVF0RXJkK21qcG1VcFRwN0NrcDBTb28yclNzWkZsNm0xbG44Skc3ZmZ1Mmxr?=
 =?utf-8?B?dzlzY2lJZXlrOHdnMG5nUXg2b0NIdlVaTDU4NTRZdmlwZHlHdXp2Ym1NeHpM?=
 =?utf-8?B?TFZPZGhlRHk5NldRNDl2bnhIcnF3TGZ2YXV5cWpaWnhZbE8yaFV5UWxTY2lq?=
 =?utf-8?B?SXJ1SGg1YXZaaXdqMWVpbnJhOTQ3SVYweWpsZUU0a0JNTUlBb3RhTGZGZWN6?=
 =?utf-8?B?NDg1T0dmN2ptYm9jd0pJUXFqOUd4WHg5TWc3REVMMFFONEJBcVRmZ1pMOGlp?=
 =?utf-8?B?MkZodS9IRzdwU1VYSStBUGhhUms3RXQxQ0NVYVlTQ2NIWUJTSmJJZER5OFdz?=
 =?utf-8?B?NFFWd0ZjRGxPcEFJWTdkL3hMaVNoVjFIMFpVTVFLQ2FCT2MvKzhzWTZyd0Fl?=
 =?utf-8?B?amJLWlR4OW1QMGxDUHJ4UmMwQUVubGR1UERoK1NLbHJ6UDRhWjFYdmZGRkMv?=
 =?utf-8?B?ZjgrMkxtTnRtVmVQZGkxZ09RV3lqcWhmemlqRjB2akkvQytkdmdRNzlac1Qv?=
 =?utf-8?B?MTNpWXVleTRLL0k1L3h2ejFhVVAzTUllODJXdDlHWEFMUGlEVVUxR2JoWXIx?=
 =?utf-8?B?bTBRT1FMbUN0TUZuUFpvelZlNTFxTDdSWE14NEFFRUhaRDg1c29wNEUvTHJo?=
 =?utf-8?B?MWc1cTVuR0h1alB3QitPMWFBUCs0cWVIS01UbmpRRENkYnA1VUdTTGxmbVl2?=
 =?utf-8?B?RWhGZ0h2TER1anRRZGN2OWpmK3ptYVFqdStmMlFBSTRyQVRYZ21qYjF0TEN0?=
 =?utf-8?B?cHBuUFpGWUxwckRHcDQ3N0k5N2Mza0d2WmRDVXJ4OU5jazEvYlZZajk4SWl0?=
 =?utf-8?B?SmN4UzJteWZFYjc4N0craExmUS8rWGp6MWhRNU5aM2FPM0RraEg2TmwwNjlW?=
 =?utf-8?Q?D8CJ1pt4ouvnPEnI4EqIPx4KH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e5454f-67aa-4d60-c56e-08dac7ac54fe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 08:27:00.2037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GmoTqIATvw0Up3C3hhPBKbhjeAGMw/Qiedhvp5/z2ruvpG6w0SPpur9qG9WlNGM+KTfD3kP30mhn81RW+1d3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8651

On 16.11.2022 02:19, Stefano Stabellini wrote:
> On Fri, 28 Oct 2022, George Dunlap wrote:
>> On Thu, Oct 27, 2022 at 8:12 AM Jan Beulich <jbeulich@suse.com> wrote:
>>       On 26.10.2022 21:22, Andrew Cooper wrote:
>>       > On 26/10/2022 14:42, Jan Beulich wrote:
>>
>>  
>>       > paging isn't a great name.  While it's what we call the infrastructure
>>       > in x86, it has nothing to do with paging things out to disk (the thing
>>       > everyone associates the name with), nor the xenpaging infrastructure
>>       > (Xen's version of what OS paging supposedly means).
>>
>>       Okay, "paging" can be somewhat misleading. But "p2m" also doesn't fit
>>       the use(s) on x86. Yet we'd like to use a name clearly better than the
>>       previous (and yet more wrong/misleading) "shadow". I have to admit that
>>       I can't think of any other sensible name, and among the ones discussed
>>       I still think "paging" is the one coming closest despite the
>>       generally different meaning of the word elsewhere.
>>
>>
>> Inside the world of operating systems / hypervisors, "paging" has always meant "things related to a pagetable"; this includes "paging out
>> to disk".  In fact, the latter already has a perfectly good name -- "swap" (e.g., swap file, swappiness, hypervisor swap).
>>
>> Grep for "paging" inside of Xen.  We have the paging lock, paging modes, nested paging, and so on.  There's absolutely no reason to start
>> thinking of "paging" as exclusively meaning "hypervisor swap".
>>  
>> [ A bunch of stuff about using bytes as a unit size]
>>
>>       > This is going to be a reoccurring theme through fixing the ABIs.  Its
>>       > one of a several areas where there is objectively one right answer, both
>>       > in terms of ease of use, and compatibility to future circumstances.
>>
>>       Well, I wouldn't say using whatever base granularity as a unit is
>>       "objectively" less right.
>>
>>
>> Personally I don't think bytes or pages either have a particular advantage:
>>
>> * Using bytes
>>  - Advantage: Can always use the same number regardless of the underlying page size
>>  - Disadvantage: "Trap" where if you forget to check the page size, you might accidentally pass an invalid input.  Or to put it
>> differently, most "reasonable-looking" numbers are actually invalid (since most numbers aren't page-aligned)/
>> * Using pages
>>  - Advantage: No need to check page alignment in HV, no accidentally invalid input
>>  - Disadvantage: Caller must check page size and do a shift on every call
>>
>> What would personally tip me one way or the other is consistency with other hypercalls.  If most of our hypercalls (or even most of our MM
>> hypercalls) use bytes, then I'd lean towards bytes.  Whereas if most of our hypercalls use pages, I'd lean towards pages.
> 
> 
> Joining the discussion late to try to move things forward.
> 
> Let me premise that I don't have a strong feeling either way, but I
> think it would be clearer to use "bytes" instead of "pages" as argument.
> The reason is that with pages you are never sure of the actual
> granularity. Is it 4K? 16K? 64K? Especially considering that hypervisor
> pages can be of different size than guest pages. In theory you could
> have a situation where Xen uses 4K, Dom0 uses 16K and domU uses 64K, or
> any combination of the three. With bytes, at least you know the actual
> size.
> 
> If we use "bytes" as argument, then it also makes sense not to use the
> word "pages" in the hypercall name.
> 
> That said, any name would work and both bytes and pages would work, so
> I would leave it to the contributor who is doing the work to choose.

FAOD: There was no suggestion to use "pages" in the name; it was "paging"
which was suggested.

Jan

