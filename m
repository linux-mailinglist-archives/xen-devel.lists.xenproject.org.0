Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7C55F0B45
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 14:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414195.658347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeEm0-0005kZ-F7; Fri, 30 Sep 2022 12:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414195.658347; Fri, 30 Sep 2022 12:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeEm0-0005hf-CD; Fri, 30 Sep 2022 12:05:44 +0000
Received: by outflank-mailman (input) for mailman id 414195;
 Fri, 30 Sep 2022 12:05:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHGM=2B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oeEly-0005hZ-KZ
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 12:05:42 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2077.outbound.protection.outlook.com [40.107.105.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 343a7de8-40b8-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 14:05:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9197.eurprd04.prod.outlook.com (2603:10a6:150:28::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Fri, 30 Sep
 2022 12:05:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 12:05:39 +0000
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
X-Inumbo-ID: 343a7de8-40b8-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLqj6hGi2IxAiMbgvhNYLM1FPENQ3bBclC+OBjKehSlU0aEqiv9jWt1TYIy0C/OKausc/tTi5XPjVr0ZUQAu4jKGU8WhDinURR8AheO394lb/vQczp1fcWVWhE6x1pgMAy89uWe2h99GSuA4Cys9Vhaqo/ML+u4dphGa7+1QordUrskDZbUdYHxNWZKWPS17iAKhp5XSUMLCG1OVPXWvhyCuPvldIoWf9GYa538+syWA2ImB5CEiEchjG64Uv0dDG8ArDJQtglqTrMa3fFb8/TLZWOrYo0LFnCZDpzs/c4r9bZdzj+3cydRGMpQoYyjOszT+YW0Y4PcFHwc6FFyxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RA5Xpy1wR8IWHIfULTS1aAulT92HxfuCIyp3kr9DfCU=;
 b=ft2smnQGxf9UhyonMfoMhsMWVrx/Q6q5nqugY5BpZQwWTEwT6LElaPs++6FJgHdL7WpiKGyUGtgUG+TOGOqTC32kFaD+sQ94NwVABscMKKgqjg/j4I2HLTr2fzYI7hjXFUybgpdQhWipbYlsl2n/fqKeGIoGSg90OwCLQZpDl7PEDn9NJGUBWgr9VH0EwKBwhEfROWyvycOnRS7Kl9BEJxUYKArws2SdTI1WEAGdwuSQhii/etqsWBQ14CUGRcLcT7rGDDmHniw4mBjPPyWNjf1FNt3QBCXe0VXovdVvVNPR2e9Dknrc+UzgC/foajk2UCdep33bWuLDIYRSZ2ZN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RA5Xpy1wR8IWHIfULTS1aAulT92HxfuCIyp3kr9DfCU=;
 b=EOzdeUdfeWTrbqD3v8CRA/DtbL7+JEURq5g5JhAZfxNFAT50AKV5JVzonDfjdAR54mECO+aXIiTPOkNGD7YWNAJlaT5Hs0AKL0ZwTlFPsPgv/oOXQN1DV55hT80Uf06ALmWVWIqTsm0VHY0DjOEaurgqvHhVZ8qo+It0xv6eKPpBvpkKSh6f1fAIzTzlUgviYhEmRzAxg4e8LwZrlv8RX8q5djQCWZlJ61C3itJV8S4pro+NN7RC+qU33lfDYn2jMiktvAvc/ea+dod4sLkssNx1kYt0Xk/Qnav8eBG0VDKbHflz3hIeNF3H6aTO00CS6NsyVUTJGnozo/zNwR+rpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <708ef4d2-9f9c-e4e5-d9e8-db8d4d633262@suse.com>
Date: Fri, 30 Sep 2022 14:05:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] x86/NUMA: improve memnode_shift calculation for multi
 node system
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
References: <84f1b8e4-3927-1986-9ca7-043790ed7011@suse.com>
 <21e773a0-9082-86de-be81-9fcc8ea2e07e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <21e773a0-9082-86de-be81-9fcc8ea2e07e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9197:EE_
X-MS-Office365-Filtering-Correlation-Id: c184b047-e1a7-49bf-2b1e-08daa2dc175e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	49dTu2WWVOfkWfl5ryu8zJBUruxta3Y4o4QxUEcFPq8Pm/NlgaNpguIfQ61WBUWh5xFecW9BjSyQrkIJzWpwawuJPil8h9Rbz8G9J+m5QHSdWwMi8wbBUBM1BgEFyXT2daPmN8WtHZzHFVb5MfCzFOB0NQENle+dugIL2nD5kNXxQ0nyxiag6p2WgcWgAvuVGGo988IsUM09ppjg8e20WDg4vv+Asvim8wOh0DtldZ6wcVVqxmLndvbUGzokfS58k2eRU04CaJJ2Cl7dlouZTCTlj26rqAOL1k/FZsiRYaRqWerCgNnhsu8dT9mnYEjwEldqR/W2xKlozPkzqxLAoBVDkJDscnYz0uXvoo/UFs9vFeT39kHmnQ5e21Dr5evYAYQ67t9vQFOZa6clmgCgmmRpxzvFEC924UVujPER2ZSkK8HZIg9HV4j55NJhDuwof8AnGNAuX9hSgw+S18valpSkm4gI+gmYpK+vSpmfSAYBvzf6fmpkBxE07iHcWLQYUWS+9IGFDwxrUJYuVXGj2A0+W3cQ+fbSQwN7eUDqEu2p7ymqYbsk5LigZLimteBGJ+ED/LOvcgqLbC/pl4f9UyKHELx7qRKKhvZfe/i1Ac0rn216zJXe4OVhvj0gf+alzdV0kELaKw8STf0cP7rJdol/XdiVQl0Rtl5Z+9HR6u98e9r2fdA8+t2jJf02Zg5YwAhw/q6u4qTb7xTZ6rV3LRuNJs1PZUdjQUHwnYxj92lvAUV1HJzPKvBmdBzzXj4V1Fi1KIelZDb6peg6mtmUjPK5u2+cajWZDUJ/gR87oec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199015)(2906002)(5660300002)(8676002)(41300700001)(4326008)(83380400001)(86362001)(38100700002)(53546011)(31696002)(316002)(66476007)(54906003)(110136005)(26005)(186003)(66946007)(6486002)(2616005)(6506007)(478600001)(66556008)(6512007)(36756003)(31686004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1ZYUVJHdkNkc1VTakZjNGNhQ05RV0t5Y3dqU2gxRFQveXk4ZVRlTW1SNlBa?=
 =?utf-8?B?WStDOGtBZ3hTYXpxVThjWllPKzFES3NwOGZhTVlsTU9kRkk3TGtsU0JxQjFq?=
 =?utf-8?B?VDQ4a2xDWXpmNDNTTzhtajNNb1owSDlyRXQ0Tm1relF4czU4ejBOd1FIZnNp?=
 =?utf-8?B?bTJNK3J3ZFkyL2hNZ244WnQ5b0xZQmg3WFhkVlRnOEh2U291d0w4VjFXRXRP?=
 =?utf-8?B?c0NGUjgrUG5HZ0JJS1Jab3FrY3I4c3pRQzFwMWtHTEM2eG9vaUpndTJxSS9i?=
 =?utf-8?B?eXVYTm9nd3JWenBLYkNGdXltRzRpbWJZekJGdld3eWpCOU5xWGxGbERSU1pC?=
 =?utf-8?B?RGtnRDlBT0EvQnYxYVhYc0UxQlRDbitTRSs4OG9kbmtibUtpa2k3M3N0RVVy?=
 =?utf-8?B?YWZXNkFZcHlyd3NyQUo0USs2ejNsNFpvak9sZUlHd2p2MHBkYWkyZ3lKa0VI?=
 =?utf-8?B?SDhjak1MM1RpYkQ0SGlSclM3RVBvVmY1RUd0VUJja3FyV2luS2g1UWJPVnFr?=
 =?utf-8?B?SFEwWXpEb08vMFduNXMvYjhkeFBGUDkvMXhvNFdQUmVVQVlXQmhTYkdxdUVz?=
 =?utf-8?B?UHhtN3YzTWJHVmlJV1dZNERxTUNXbENZeDFDMmlzM0VDTnFEdW9qS3dQcFUy?=
 =?utf-8?B?L0N5SWh3YkxTblVOV1VhN1BFUFdwdFdKd05Ra0RLWDZIYWpxTERhS2E4RDR6?=
 =?utf-8?B?NmJwcWxGSXNWeG1jVVN1V2V4UUxScmhieWxjYk9pdFl6TEN5Y1U1NENTN1dz?=
 =?utf-8?B?VUFmS2RpSVZldDkwdEdIQk9ZZ0ZFNTNyYlRNMTJlcTVVUkpOOE55OWFSdkI0?=
 =?utf-8?B?NVREMDNKMGVBR01VdzBkOVlxYnY3MGprVXN3K1J6eTFNajBvOWh6cGNOd2pq?=
 =?utf-8?B?Rjk2VmZXSkM5ZmJFUU5UU2VzVUNCR0tteTR4clFsQ2paZ0dJdEZBQjNiQlZV?=
 =?utf-8?B?RVkvUGFYdWd6OUdBcmpPSTJBQ2NQQjhpUW9IRGJkS2FZU3pYVUx0c0hGcDU2?=
 =?utf-8?B?eVIzVnEvdGZvL1JQWS9qZHRqMmNBUjB2emswdmxHd3RBOWpvK0ZGOTVybmR1?=
 =?utf-8?B?eFNzOHo1azMyYnhOZnNFVnBzMXFmYjJ1ZGNFb3owUmNuTGxaYVhOZVB3dWtv?=
 =?utf-8?B?djBYU2NKWWRaR1ZVdzg2SEE2TEVJTCtLSDB6UEdHaUMxb1p3ZCsrN1p6Wlky?=
 =?utf-8?B?NkoyaUFCaksvM09nUE1NalNLMXA0OU40Z0hCbkRPQ2hWclRWS2U2bUthUWpv?=
 =?utf-8?B?NGJMUGEvcnFKUVpnOGYwUDVRWlV3dmlQTUlZMUYwUlI2anVaN0dNRmpNSWhN?=
 =?utf-8?B?RlJOR1VyZDF5ZmQyRnBJZmVld0dIamFLMC9Jc0pLOVlOVU8xNlY1MUNOdi9S?=
 =?utf-8?B?b2VxVGM2NFBhd1NBRVN6U0pvYzR4ZVB4VlJjMkhtNDNIUmpQN2N0R1VvVWtV?=
 =?utf-8?B?YUdLSnZQTEF1ZHk4MmFsWVhWTDdsTHNjbHhtM3RlVEU2c1hzU0ZDQTdEZ0d5?=
 =?utf-8?B?NG5oSDcvSXBEcURPTlgxc25rWEVFUEFOMEJnaVJMbXNvQUs0SURMQlF5L3lK?=
 =?utf-8?B?SWNpSEdqSXVqR01LUS9QbDBxbGY2cDdqMVhUcEo3QXd0cktzdFNucGhLQ1h1?=
 =?utf-8?B?MXQ1N1Mzcnd6Y3Y2VFkyVjFWOVI4b0x5Y1VhRFgrTzVjdzNNZDNhcno4YUJ6?=
 =?utf-8?B?Z2hVNkFxclZ2N1hkYjlSU1E4bEd3L3NuWUMvWS9iRFRDcjJRUnFzTWZQMXB0?=
 =?utf-8?B?aFdsMlRVaTVFa0JsdUZpNTdRdktxUHRwb2ppbzZUUTF4eTNWa3BCdVI0MjVz?=
 =?utf-8?B?RWEwVm9rRy8zak9BRThXZG1xbnhFdm5YRmpnd2tOTE9hUkw3bFFienJpOCtL?=
 =?utf-8?B?eVpyQ0NVdGVmeUFxRzZTem9VY3ZUc0xPeFZtK2hVOW1kaHFiNk9rY3JJYU5m?=
 =?utf-8?B?ODFpazZFMHhUdUc4TWRhL0dSVDBkLzFrQUE5SG81dzFDUmdOSjVJeGNSekNt?=
 =?utf-8?B?b2VxYVhFM0JEbUxBbGhuRmZWblRSaFMvaVFhVWovZCtkbUxLb1NpOFVWZ29P?=
 =?utf-8?B?NjhsSjYrT3JHVW5obFBxTTFWM3k5WHFaVm0xU0QxUFVOWXV1RDhRZWJsQm5w?=
 =?utf-8?Q?SUTX3va7oe/dcWiwb6NGr1EPz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c184b047-e1a7-49bf-2b1e-08daa2dc175e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 12:05:39.5836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkBxUhlziy/lfFKy0+9F6HDrdyDds5i1AEFqPeZFNlvH/hh22vxOFLxoaMgX+CT6DFTilRQJW7SxMaDNHrbPTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9197

On 30.09.2022 13:54, Andrew Cooper wrote:
> On 27/09/2022 17:20, Jan Beulich wrote:
>> --- a/xen/arch/x86/srat.c
>> +++ b/xen/arch/x86/srat.c
>> @@ -413,14 +414,37 @@ acpi_numa_memory_affinity_init(const str
>>  	       node, pxm, start, end - 1,
>>  	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
>>  
>> -	node_memblk_range[num_node_memblks].start = start;
>> -	node_memblk_range[num_node_memblks].end = end;
>> -	memblk_nodeid[num_node_memblks] = node;
>> +	/* Keep node_memblk_range[] sorted by address. */
>> +	for (i = 0; i < num_node_memblks; ++i)
>> +		if (node_memblk_range[i].start > start ||
>> +		    (node_memblk_range[i].start == start &&
>> +		     node_memblk_range[i].end > end))
>> +			break;
>> +
>> +	memmove(&node_memblk_range[i + 1], &node_memblk_range[i],
>> +	        (num_node_memblks - i) * sizeof(*node_memblk_range));
>> +	node_memblk_range[i].start = start;
>> +	node_memblk_range[i].end = end;
>> +
>> +	memmove(&memblk_nodeid[i + 1], &memblk_nodeid[i],
>> +	        (num_node_memblks - i) * sizeof(*memblk_nodeid));
>> +	memblk_nodeid[i] = node;
> 
> This is now the 4th example we have of logic wanting a sorted array. 
> (two examples in ARM code which want to switch away from using sort(),
> and the VMX MSR lists).
> 
> I was already contemplating doing a small library (static inline, or
> perhaps extern inline now we've started using that) to abstract away the
> insert/find/delete operations and their decidedly non-trivial pointer
> operations.

For using such library routines the data structures here would need
re-organizing first: We're inserting into two arrays and a bitmap at
the same time.

> The secondary purpose was to be able to do some actual unit tests of the
> library, so we can be rather better assured of correctness.
> 
> 
> For this case, and the two ARM cases, the firmware data is supposed to
> be sorted to begin with, so the search-for-insertion loop should look at
> the num_node_memblks entry first because the overwhelming common case is
> that the end is the correct place to put it.  If not, it should binary
> search backwards rather than doing a linear search.

Well, yes, perhaps. Of course we don't expect there to be very many
entries, at which point I guess a linear search can be deemed acceptable.

Jan

