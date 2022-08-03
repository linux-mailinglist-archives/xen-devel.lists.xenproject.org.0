Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670745889F1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 11:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379702.613384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJB4p-0002Z0-NU; Wed, 03 Aug 2022 09:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379702.613384; Wed, 03 Aug 2022 09:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJB4p-0002WK-KK; Wed, 03 Aug 2022 09:54:07 +0000
Received: by outflank-mailman (input) for mailman id 379702;
 Wed, 03 Aug 2022 09:54:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJB4o-0002WE-4z
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 09:54:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3527466e-1312-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 11:54:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 09:54:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 09:54:01 +0000
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
X-Inumbo-ID: 3527466e-1312-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHmzoZ9PD0JUAVh0l8TzcDK4Agp6v7WHvkvqyXLefsqZyslBUVH2zj+373W6IPOcnNHfctdjzau5vKHA0S3dIt8qYd5blYKkNpPF9Ca2Law8Zt/Rvth6j6KWz+QYOWlrJx7Wj0sJJlCGTzvqzNmdEL06+Dh5vxkYj6fUMWAB4jxKKReKTOW9NUdiErYrg0xFIh+z7AEeMaNuBSU4PVHykVfesmtHlI9iXlatz7Lo4xUOWiKCl/0t6hlWeoK7IEDPkfDRWq2ST13Y/Eoir4vAplho/HRodGBtuusHznwXSC/OzAXmf5citjJEZZM2Ak61GEDnJgzQBi9OTklOr0TCLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrxfcXFh9W0zd2oH848VcrHh92XV350TXYsea945MoQ=;
 b=f2zbmliRQtu1jhu4JFgABiLfjLlFwUrk9swFQe7apTiPhyPpAeX5e4ADT5rJIm3oIksy9Z2jQw5UxEN27cKBkhWenifsSsanX3j3yqmGMR5n4rA9LzDM6CNz/Sceq60JFGQydO3T4LZ4iN84Memcgdp9mUKAXO+33E1LlYqW+DkLUGBJQcpWWiiIN4leh5MKK9hy3to4sZq+j5ibCQBsnXA7bJpxcVTPF3Lv/dcAjUrWqst0zI7FNcEPgm+dAw9C+A7v5emVR+KydZ68eM2PuzMNZp+KuwKxR7h3/Hc5IRN/QPs49SCNnaplNe8vwQSue9AQoyNrQx+hgnaV3nG7EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrxfcXFh9W0zd2oH848VcrHh92XV350TXYsea945MoQ=;
 b=asYjFKMIsmIQBU7DyCuZgFyxHEwTHr1XfdT/dZc+2hgvtJjo1+3KoM9iD1IBuEWafiR6GHNFer3v2TbaGpf8AndItfQ7odX+BdcVHNqdSxV33Wi3KRoibLasL0roAaQYwf0r9q7QXTeYhezMkQPTFOmhHKEqeY3G2ubWdDW1nGjF7JfB4h/JhG6N33o9entMYgAf4PjBymn20aR9RY6dFr7XwbteuA46AxtGMlmXpgVJHv/3ibmndDaDeLo8Yhu7HBCsNWVvVC/wrhYZ5zR3w0ZrwIEZvrwNl8v0TlPBY1IJOLpM7wihF/Gs4wR0bLkk3NAtmBxBwvdmfQ3hJYCKDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e62049ce-09e4-f457-f849-16ce9c581145@suse.com>
Date: Wed, 3 Aug 2022 11:53:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] xen/sched: fix cpu hotplug
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Gao Ruifeng <ruifeng.gao@intel.com>,
 xen-devel@lists.xenproject.org
References: <20220802132747.22507-1-jgross@suse.com>
 <20220802133619.22965-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220802133619.22965-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0003.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e712610-e732-42ad-18bc-08da753617aa
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Qw+YGczz/ELiFiRKQDWiv8KpwanJrKXugb9o62ITa3PS04gZcil/cuUjdRVn1VY13J/TZylojrrE3icBEc3uq5Fu0Di/CTsUGSc+e6vQVBSd/T6eTHqR5FzU9LKUAfLJhr1S6V1MdTXt5FJt4/TEHle5crtr8WgN2D5rHJuuThHpnwFkzmwLPaE8Gv8kNO1rd6xaMolwxIv8PdGrgjXT3IfE5wN6oJC2n++MYbq5GL0z8bT23A1LQVbFzNE7Lwrl8bPIMr2Ygn9YjW35uLUeMNNfj7RNJNzoWACRZItIGMnEhQ2VFztVMLRRM2w/dBtvaxOkRm2CXMG7KRHmKx/SAJUfKd5nWwEJjzfzUIaa+uzAfrqPqbI0TFPev7Se24Jx/DSQdsMyDmcm83PIZgABq6SpWuYhV9smQ7PmQY9MUmv7AKyD/r9Oo6qo0C4jGm+XnaJXcLRlnqaikC4R/GoiKCB1TO/5jPqLbeTzBRqik6yd2UPWVXEkDuKfmkf0ErAI+Z+885W1DY5ZJ0NNMSg7BQ6to14NnKjXzVIGn3xP9rSoBiZzI5C+eDH1ioPoD6umyUOkmm6AeXxF81Jc+TVXD79CqYWh0018gnEnxz1MlIxnHU2yMzZ94RJdbMRr21riAZcoN2Tv8vw4GvCJWjNfIky+1tWNSHYSezHaaK7B3RV+ALMKBmFSV4hrHErKqs/gSeBOdZHtmvFp6ZU1wgzYcXpG9rrJcgxXklRJpzirxgdOKezOb0uRrOilitKRQa0XFuwLcg3ttdqmcFlfKvHymfO1ZDZkwpczhrE2dX8Gun3tQUXexn9lKQKOnyvImz5kXS+1WOjtZMEW9GHHXGPkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(376002)(366004)(396003)(39860400002)(86362001)(31696002)(6862004)(8936002)(6636002)(53546011)(31686004)(37006003)(316002)(2616005)(5660300002)(36756003)(41300700001)(478600001)(6486002)(186003)(26005)(6512007)(83380400001)(2906002)(38100700002)(54906003)(6506007)(66946007)(4326008)(8676002)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0JLaURsT1kzQjA1T2YzL0d5MVhGeVZaN0lvZUJQRitOajFPb0RyUXNzQ2R1?=
 =?utf-8?B?d3ppeEhKZnlsT3YyYkJVZ214elJDYlVBbkRwNGV0TFRaay90MU1UcFhDOEJN?=
 =?utf-8?B?T2lCTHhucEJWMlg1YnBTTmtmcGNJTEJKbUFlS0phZDQwWEpPd3o0R3hTbUdh?=
 =?utf-8?B?aFFiLzVsYk0zNWNpZWZQUmh0WWk2TnVSK0RubHQ3clZ0cVJMc0ovcjB4TlZp?=
 =?utf-8?B?MjNzdDZNdVhTRE5kekdGanVxUlFsd2J6Yzhab3hQZ2lsOFgyWXkyeHJ3K3Rl?=
 =?utf-8?B?a2hzQ056a3g1NXV3dEV3dmVLKzdsQ2hOMVR5QzRKQlpkSCtQdUp4b3cwKy9j?=
 =?utf-8?B?ZU91TWhHSS9BYmF0ZDh4VGhKRlZBU3lvKzVqaGduR040ME9jRUEzc0pqNXNK?=
 =?utf-8?B?SytLMDhUem1uUC9PbWkrWk9CM0huMzR2VTBlcDl5Q1R4eWNMbGMrMkRXa3Vz?=
 =?utf-8?B?SWVPZXJxclJsdGZFeXpVOHpWOUpNVm0xQWNjaExQc1JYeTRYVGgwNXQ4Zll4?=
 =?utf-8?B?aE13YUJzSTlIcVN0VHJDRDJFK1ZWQitCSzNTcElXSkVpWFVBTFhKQk9hYTZt?=
 =?utf-8?B?NUt2aDNaQ2liVnR6bWZXWjZ1SmR5SUZsYTJBU0FZdm5paENKT0JMMGZSVVdD?=
 =?utf-8?B?bjJORXdaRVZOcDMyUTMyTkNEN0hhMXBCV1RJN1h6Qm5YVlhnL1JIN09oOU5z?=
 =?utf-8?B?VFlhR1ZCL21RTTlPZ1VVYnRodXpPS2V2K1kyRlFMM2ExZ3J3S1ZYMHNNdmZL?=
 =?utf-8?B?REtsZndRckMvMWl3YTU5b01xUk10VUtJLzVrMzVFN1BDOWNrYUFGS0R5WU9B?=
 =?utf-8?B?Qnh0T2tuUGlJOFJYR3RhSnVpbnhBRFR6ZDVTRGNBZlJ1UzlKN3oxQXA5L0xn?=
 =?utf-8?B?NDBRN3FOaDJlZzFCMlIraXdtSktVWGpaaU9JU3pMNHp1YXE5R29hL0xKT2lR?=
 =?utf-8?B?a3NndXNmbkYzbUxYQ09QbmVqRTdCNHBnUjB4Q0JhK3UvRks4R1FnZ3psajM4?=
 =?utf-8?B?bm53Z0l1dk9KQ1dxcnlpdXowOE8wUlNITE93V1dJUWxsMlhhZTBTbVUrNDNY?=
 =?utf-8?B?Nk1RMzFOZ0p2Q2NkTzMxLzJvdjVrLzE2Mkh4TENqbjFxS0xIWjRvOEVScDg2?=
 =?utf-8?B?VnNtaGJOTG5RQ0NoOW9VOUNKd0l4QktiTXR6Y1RRcHhIOENjUTdXcnlHaUhD?=
 =?utf-8?B?ak1WcnBGSitUWFd3clM1Qkc5b2MxK0ErMy9NTEVsWWYwUndjc3ZyUzVyV0k1?=
 =?utf-8?B?S2F1Q0RIeStESVBWYlhyS2lSN1hoODZuTVdOWGljRzhnUHAxMHJhUkJpL0h2?=
 =?utf-8?B?VjI3anJ5TzQ1cVlpNjB6eElCZVY5cEQ1ZmZCR0ZxMkM3OGlTR1RNS2pkcTVw?=
 =?utf-8?B?NGcyUm0xSWpUeW9ldmpUY0QyeE9vVzk2QzIwQ0dTR05Fdm9GeXU0ckxoMWJj?=
 =?utf-8?B?RS80eXRkQ2M1QjFUaTFLaFZ4R1M3aHpUQW85RFJMS2FOeUVXcFZoa080SW5w?=
 =?utf-8?B?cHdNUWlqSE5adm1Mbk5tbGxnUURhdHc3SWIwbVNvVTVJQnB2K25WRFErc0t1?=
 =?utf-8?B?OWcyekhjK0hYNTVLR3R4OGFjeTF5T0hZN3ZrOElCLzR2cmNhMjYySWozMEV0?=
 =?utf-8?B?dzkzY0cvZ3o3dFQ5OGxoSnhyVzJCL0ZqZmlvQmFRZHcwWHo0MytZSEVaejFn?=
 =?utf-8?B?WXFZbFpsZi80RDdha0tBWkduVmZ0cjF3a1ZYRThMUUZ0R3BvVDU3N1NxTCtR?=
 =?utf-8?B?K25McFlQWVM3Rk5tTStOM1d5ZWtadnBQVUZ3YTBoRzFTMnN1eFZ1WFpOZVhO?=
 =?utf-8?B?TUlVM2R2cHA5M0xNV1VWZERFSnB3cHBMUFlWWlFZTm5NNkdBanlhUTNjd0VM?=
 =?utf-8?B?Z091WjArMkxaUzh2Z2dhT2pSYkxibldVQXg1UG1SdGRjQXJxdVYyQ05JZXFV?=
 =?utf-8?B?QXFMdyt6cjV2aTZkcHNkWDBJTllSNkJnVTRmeW8veVRvR29DanlQNkwzVVFU?=
 =?utf-8?B?OHl3VW9qdDRJSUNnVFpIVGU0b3lldVZVZWdITGFyTFBwWGR2Mnk3VHlPcTcy?=
 =?utf-8?B?RWZJRFhKQUZJVFkvVzRZdHA3bWhaNGNPTGczRDNWYkxycnhRck5ZTWVSQXJ5?=
 =?utf-8?Q?nlAyjbyWcz4ATfhgHJkuF0ILO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e712610-e732-42ad-18bc-08da753617aa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 09:54:01.3147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPDwzvJkXrp4dDbe9lMNRSo00o4mN5W4E1AiNl7i8VYTprgcIMAJk7OU6Nr4IcaZpZkb2ZtyzA+NeVXEE4nTLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997

On 02.08.2022 15:36, Juergen Gross wrote:
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -419,6 +419,8 @@ static int cpupool_alloc_affin_masks(struct affinity_masks *masks)
>          return 0;
>  
>      free_cpumask_var(masks->hard);
> +    memset(masks, 0, sizeof(*masks));

FREE_CPUMASK_VAR()?

> @@ -1031,10 +1041,23 @@ static int cf_check cpu_callback(
>  {
>      unsigned int cpu = (unsigned long)hcpu;
>      int rc = 0;
> +    static struct cpu_rm_data *mem;

When you mentioned your plan, I was actually envisioning a slightly
different model: Instead of doing the allocation at CPU_DOWN_PREPARE,
allocate a single instance during boot, which would never be freed.
Did you consider such, and it turned out worse? I guess the main
obstacle would be figuring an upper bound for sr->granularity, but
of course schedule_cpu_rm_alloc(), besides the allocations, also
does quite a bit of filling in values, which can't be done up front.

>      switch ( action )
>      {
>      case CPU_DOWN_FAILED:
> +        if ( system_state <= SYS_STATE_active )
> +        {
> +            if ( mem )
> +            {
> +                if ( memchr_inv(&mem->affinity, 0, sizeof(mem->affinity)) )
> +                    cpupool_free_affin_masks(&mem->affinity);

I don't think the conditional is really needed - it merely avoids two
xfree(NULL) invocations at the expense of readability here. Plus -
wouldn't this better be part of ...

> +                schedule_cpu_rm_free(mem, cpu);

... this anyway?

> @@ -1042,12 +1065,32 @@ static int cf_check cpu_callback(
>      case CPU_DOWN_PREPARE:
>          /* Suspend/Resume don't change assignments of cpus to cpupools. */
>          if ( system_state <= SYS_STATE_active )
> +        {
>              rc = cpupool_cpu_remove_prologue(cpu);
> +            if ( !rc )
> +            {
> +                ASSERT(!mem);
> +                mem = schedule_cpu_rm_alloc(cpu);
> +                rc = mem ? cpupool_alloc_affin_masks(&mem->affinity) : -ENOMEM;

Ah - here you actually want a non-boolean return value. No need to
change that then in the earlier patch (albeit of course a change
there could be easily accommodated here).

Along the lines of the earlier comment this 2nd allocation may also
want to move into schedule_cpu_rm_alloc(). If other users of the
function don't need the extra allocations, perhaps by adding a bool
parameter.

Jan

