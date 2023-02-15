Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED7F697F54
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 16:17:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496055.766580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJXD-0005a5-Ky; Wed, 15 Feb 2023 15:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496055.766580; Wed, 15 Feb 2023 15:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJXD-0005Xb-Hv; Wed, 15 Feb 2023 15:17:27 +0000
Received: by outflank-mailman (input) for mailman id 496055;
 Wed, 15 Feb 2023 15:17:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSJXC-0005XV-HW
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 15:17:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9f582c3-ad43-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 16:17:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9711.eurprd04.prod.outlook.com (2603:10a6:102:26c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 15:17:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 15:17:23 +0000
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
X-Inumbo-ID: d9f582c3-ad43-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cB8cY4cxCH3ztgZfdRcV2xfHQK+OdkJukr8zM4Mmu1dT6JKhIWlixIf/k57dP0KljtGIf10qBx46dOLKsPGgs3/5sDGO26t+nlRLpxC1S1whX6oN9dvXO5v8L/lQLyLDzNTBwMMMS4zcJxFTI+JJPTkeynrgMMIhwO6ofTPX/nPQ3LKfmpruUrOKTWeWpos6SmggyAIbbdgfeotFY+UPj304rmhs+mJGYgZnQQvHXSxWxYcFhgDBKr2P9eogID7g5cSJ1D4Uw0GpR11h1T4aNgC65Lne2BtZh5eRjarEki2uZfCW3SyUlLqbENpiCc7EbrjZUNxv6v2b1OugBFwlxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3A6NwPDaj/ZH+tXLqgrQMa08nilj5M/qa5o8lwHFz30=;
 b=TXD3gGQquR//7tNfpE/SlFu1iln1uLZX6ERE1Yyl+M+WVaalKhrL7xme1wZ/zO7CvbvlndixF+YtjQcB7obxbmmJg5EuKJreQ+sfcI/yQ0C8we4iKQt99anqEPdOqyil1hNr2aZYrU6uZuaI16bRDVAVlDCZOJq/7P4pQ5o4uLutjdW5matgJHxFH5veRvhw65gJL8mT3U8gNJU/hcWkQoL5LPC7I2asuZv4KJ1Vy6avo7ux3e+aQ/KVD4uZBFgymT4DCTwciWsz8oSbz9PipZWQQhadhCBVBvGXZHM51nOw/JCPo6skLGB7imQd7G0QzCttqe5KJZi31YStvD/yGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3A6NwPDaj/ZH+tXLqgrQMa08nilj5M/qa5o8lwHFz30=;
 b=K7KvUbUJI+1RuSLHQmSg4tZXEvKXxkJSN+F+89qbcByRC8UxVm6Wf+cen3cpNShvFfzJW893bFzEZ+fZtO8B38Hgq/vYe+iuH9rIJoXDJD0QTI9CmN0r62FqMwwy3iGfgYU2DyzX0BFpBNc2NTzj5KPASfve5nxw/ImImuhuC57Xve557bGRckojGDVXomW0Mfe/kyOC0BfoyBKOBnPEVA5Wp6uvjGvuAfFoUbRHwfgpZdJgBvTBkcvaCnqnuoaQ6hI8cswrnRzIpbQLVdwL1Qi646PqHGFBEeLyUc2gV5qb2+C8faWa2AgQP4iJGwcdlRJDTJoybpRotzLxj0gN9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2124d508-78ef-7f57-5bfd-56575bd4e21d@suse.com>
Date: Wed, 15 Feb 2023 16:17:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2] xen: credit2: respect credit2_runqueue=all when
 arranging runqueues
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20221003162158.2042-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221003162158.2042-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9711:EE_
X-MS-Office365-Filtering-Correlation-Id: a92ba3a2-f1c0-40d4-6adc-08db0f67bd0b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hq5nlf2cJKud5DYzOzkQuArigaD9n6AjjfYv+nMwA7w1HmZOfySOJaS6SpbCCpSW37aqCXbWBVGPqZfgkwhwyGNnpvHE4XUEpY/3d0hq03D5AjCuOpenGJ3dDSIndl5GEZhuCtK1BARR1oDP6r8M48R/K8LzTMDOa1Su3xOjYFj4naQsl0U68MWWs3zOWLuvQe9sZp3Sfiz1S3xbtxqSqeb5f3D0ysMref/TFouV2qRqKifAWegReKcvZaw1V0qsGM1plHesdEWHFhbx3qSZKdC0SJm9xmphBdRUZ0xQ4QLu0Akf0C/TyR3aUMEevaw38W9vgIyvWTFkf8v1Mp5LIc/RNiIa7rHky1SUr1KYIembc3z0vQj2G5mC3HmIdPaPbn/dofKijWGq9TV7jRwBvMeQd0jKJQgfLsAc/cLR7o0H4+K09FDsuoBvLTqfWdnOEkeXBsQ8M9R490EzeSjPONTIYIdcqyyiRczjwyLTaFJD2RG7vJie0jJk0bQEXam+QvIKXPzVPcggnI2hjLE2/BI2tqf9b+E8meTh+15ik5n44eEIheuVi+nNDICo+utTh3TP/7pU1RodotQeRZIKeYSX7l84ziOjep9c7LPieTrzT9aA1iyXmzUc3KUrH11bhxXEM0Zb9dc35/ZekioqoHTJCHEdJ2B1S4IldZoXHsSXZKWbwZCnKtBl8vrdpTE0ooyP9OtfMZAVpmMTC20L8Rs83ut4XlSxlKNCmSx4axE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199018)(2906002)(186003)(2616005)(26005)(6512007)(478600001)(6506007)(5660300002)(31686004)(38100700002)(8936002)(53546011)(31696002)(86362001)(316002)(41300700001)(4326008)(8676002)(6916009)(6486002)(66556008)(36756003)(83380400001)(54906003)(66476007)(66946007)(66574015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmpzZHROTlVpbk80WXU4VjBCdGVuejgxVElZL3NTVDdEaWIzYjYyb1hWM3Ft?=
 =?utf-8?B?amtTd2l3TGVMV1BzWU1iQkowdTRpL0NjZ2ZjODM0WGlkSnp3VHBRRXRIUkk5?=
 =?utf-8?B?dUhpSkNhQUJ3RjYwT3hHRFdxOEpYNjlMQTFxN2FlOWJkdUl0NEE3K3NhbWsx?=
 =?utf-8?B?MHdQUTcyMzlwVkhxQzhsdGVpVCtNTDJreEI2Skc2dVRiWlQ3Ny9KWUFPQlpZ?=
 =?utf-8?B?L2NhY25tcHpEamhWK3pCMGlJMTNWVEJKSEM5NnBLZlJyckNmTmNUeTVHeVRo?=
 =?utf-8?B?L3NNZjk0MXo1cFpjN1Y1enhjQXVXUkQ0RzUrTWgyZ093OUlkeXVsRTQ2WW1J?=
 =?utf-8?B?QmY5c0NJT0JIWkdqbjNhcDIzM3V3OVkxU3FGSjl5bTFJMkYxaTJJcWFEMEND?=
 =?utf-8?B?bU5VMDdCSkxBUEVDSTNLaGl3azZHMXk4cUJVRzBzV1lCTWRsanNtcU5ydExx?=
 =?utf-8?B?dHVtRUJPclRGWm05RE4xRzhjYUMzYythNW45Nkh1OXBkaU5rNW04cnZNc2s2?=
 =?utf-8?B?cFRncDZJOS9BUEZLbElRRDJRdmd2WUlIdlJlU3hwWjhUdDNvVVU1aEJSdmpK?=
 =?utf-8?B?NXBiT1B2eU5rcFIvNkMzeWJQL3JPSEZFVHZQSmw0V3htMDhIajFXdzJCZ3pK?=
 =?utf-8?B?VURNV3Zyb2h4SktCRDBQUzVSN0IxVGIvTWRBN3lTWDhRY1FlMmgwNkU0eHpm?=
 =?utf-8?B?NE8rRDhHa1ZMWDJ4SXFKalZ3UnBnOEpnUnd5bVZtdjJrdDBpbzJTYTFGeFlw?=
 =?utf-8?B?OUxHcnBnekVCOXNCS1J0WUcvMm5KSERVMTFBSUhhUGkrU09UOTZjK0hwK1Jv?=
 =?utf-8?B?QVF5Y0VnendldFQwcUFaTmNiYUNDYUJ1MHhJODJQUXZWQjUxRlZZa2hkZUJq?=
 =?utf-8?B?QVdRR1Q2Q0pmMHZCb0xmVmtFaGgyd1o4NEdvK1EycExjQVRiaFIzZjA5MWRH?=
 =?utf-8?B?QUhackhzUjg3V0o5Z0dFWm40eVgxVzJIcmh2ZHRVOFdTS0t2SGxnMytvaDVZ?=
 =?utf-8?B?T1pnZ0lOYkRnSExwMG1yUHR1ZXB2RUZUQWlrdmpqQVVQb0psakRJUzFSY2N2?=
 =?utf-8?B?MDJzSTFoaU1FeEU4UDRzRFhnRGU3c2E1d1VHNkZaaDY3QVdESjh6WlBJcVNT?=
 =?utf-8?B?emVYLzBKSzVJRVlZaThjM0F1MjNCOEI0a1A3OXRPay80Yi9WTGt3aEJ6NkpN?=
 =?utf-8?B?ekd0VEdnM3I0MHRqWjNzNlBkYlQyay9YdmhpRU1kNndTRXdjMDYxMjh4MVJF?=
 =?utf-8?B?STVxNDRFb1IzR0NTQkUyUS85WU1hL2tpYlRTblNUeEZmbDBkTFlaeE1QNWhN?=
 =?utf-8?B?YVFlbGNjNStHNU5kazc2Rkh0ME5EUDZkZlhDVG80Nkwrc2tFQU9VN3NyVy9F?=
 =?utf-8?B?a252NEZzc21IZ2EvMUZITWZNZndsdHJkV3M2SXhKREd5S2NzYVc5WTgrajQx?=
 =?utf-8?B?azQ2ejV4ZEZRbkZSWmZMMzRnWmU2MW1JdkdJUG1wc1IvTjBsZ3VJYlFXSDV1?=
 =?utf-8?B?L0NtNEF6YkhhR2drVldiaER6eE40RWFBV2svQkhncHFycG5YbTlaVlM1RjZN?=
 =?utf-8?B?UWdnaVBZdng5VSs5RDRzYnJZMVpYRHJkaDFjNmFWcm9BSmY2cXEvZEQxcW9U?=
 =?utf-8?B?bHNHYnhxYklUWEFKTTVrTnpkL0g0azdMQURqTndLTzBLdnBPTVJ4MjNGeFhz?=
 =?utf-8?B?NGRmVk1qZVlRTTNvc3cwQkNXaVMxK3RMT3F2dDQ5aE9rbTlqM1RJM25xN3dE?=
 =?utf-8?B?SVByNC83SVJCZkJvTWFQWjBvMzRNUVViVTJsLzMvWDlxeElySk9BYndVMCtv?=
 =?utf-8?B?QjFYUTdGc3JTMUVSemphYUNJSU4vMVpjb2ZsK0d2QytYNTNRcnZrZVp1U1pw?=
 =?utf-8?B?SGdpNW9VM2tocldFSEFMdnMrcHlwWlZjQTZ3V0ordnpXbVNHVmtkd1BTZWpz?=
 =?utf-8?B?QXdjWnNCRjcvNW8vM28rWlVjNENzMW9qSmZSUkY3UzN6SjBocXNiYVJqQUhs?=
 =?utf-8?B?ZUNYdnVudDBPWVRsUG5pd2h6MWg0czk1ZDRXQmt4Mm5CYkV2NEJ1RGhQcjM5?=
 =?utf-8?B?UEdrVnJpWHFESkNBOE9IY3RPL3Y3NGxFZE9nS2VQemRNTDlSbzZPdkM4V09m?=
 =?utf-8?Q?1mv2mtUrColI9XFUVgNEZmMRy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92ba3a2-f1c0-40d4-6adc-08db0f67bd0b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 15:17:23.2622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bo84/VyPijs5OezSh2OTY7Pe0DKKtWs9lcKRp8csfywmxs1OHmx4lNyAWWIdIcX5Gy0WIBvR3LOcyxK9wVzJCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9711

On 03.10.2022 18:21, Marek Marczykowski-Górecki wrote:
> Documentation for credit2_runqueue=all says it should create one queue
> for all pCPUs on the host. But since introduction
> sched_credit2_max_cpus_runqueue, it actually created separate runqueue
> per socket, even if the CPUs count is below
> sched_credit2_max_cpus_runqueue.
> 
> Adjust the condition to skip syblink check in case of
> credit2_runqueue=all.
> 
> Fixes: 8e2aa76dc167 ("xen: credit2: limit the max number of CPUs in a runqueue")
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>

I've now committed this without maintainer ack.

> Changes in v2:
>  - fix indentation

I didn't go check v1, but ...

> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -996,9 +996,14 @@ cpu_add_to_runqueue(const struct scheduler *ops, unsigned int cpu)
>               *
>               * Otherwise, let's try to make sure that siblings stay in the
>               * same runqueue, pretty much under any cinrcumnstances.
> +             *
> +             * Furthermore, try to respect credit2_runqueue=all, as long as
> +             * max_cpus_runq isn't violated.
>               */
> -            if ( rqd->refcnt < max_cpus_runq && (ops->cpupool->gran != SCHED_GRAN_cpu ||
> -                  cpu_runqueue_siblings_match(rqd, cpu, max_cpus_runq)) )
> +            if ( rqd->refcnt < max_cpus_runq &&
> +                    (ops->cpupool->gran != SCHED_GRAN_cpu ||
> +                     cpu_runqueue_siblings_match(rqd, cpu, max_cpus_runq) ||
> +                     opt_runqueue == OPT_RUNQUEUE_ALL) )

... this still looked like too deep indentation to me. I've taken the
liberty to adjust this while committing.

Jan

