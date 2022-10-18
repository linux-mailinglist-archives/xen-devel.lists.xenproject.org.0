Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B9A602DF0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 16:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425022.672766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oknGR-0002sw-Cp; Tue, 18 Oct 2022 14:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425022.672766; Tue, 18 Oct 2022 14:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oknGR-0002q7-9t; Tue, 18 Oct 2022 14:08:15 +0000
Received: by outflank-mailman (input) for mailman id 425022;
 Tue, 18 Oct 2022 14:08:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oknGQ-0002q1-1i
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 14:08:14 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2055.outbound.protection.outlook.com [40.107.104.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d39bf05-4eee-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 16:08:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 18 Oct
 2022 14:08:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 14:08:10 +0000
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
X-Inumbo-ID: 4d39bf05-4eee-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9ghjj9iT8AaKNZURuxV7OZuyLaSfk3pY4ptq/6LW0BlRYqgKna8EDwe4TnwCObMf4FY5PsOG/cFV14+ejHxH2JbVktse2qtDzwgJaEXM3Diah4oRcrqy5GtIAvIec4+YBCz436sKAcgK2eF8e6grXkonwMiGyMVmEcDomzj6KiVfwvQafPWDLKX+w3ee6cToBBB9o40ughewtbAeo6sAYc/Vo2dw7aHk0RtUTS6fhJiYel5JLXhiiSh3NptbU8NP8G+PSsBdnkrqh0RFaTnBEEO85rYTE2VKqA1wBokXbD2gifh/6GGUQ1EbUQSMpIkMRxnL0b2eQdEK5qMny4w3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3pNf35GFmxwtZfw7iXig4qJ/cZlVHnspzfN5CpLGbY=;
 b=i1G2aiyXl7oZW+axRgsPBVP2EbqcZ9JKRRPuXA3pY2pA+Q89l4slgfQXorxERZg+Y5j2+OfFjtJ9TV6ZEqPaZpefrpAqiLk52DGafB0N3oXbdJfOWBc9GDf3NdCSXdh9woEojZ7j8ONSQnBXiFucgD/d/DOSy85MNusM16EAd34BgD3Nkkh8aPVuvREDcsdqN8pTu00aQmi66WM2+S3hNSbN53uNqiSk/BCHHZCJQKn5TA3Lt/kcLYI5ddyUa0B4UiEfF0aVOB04kVO2Y5wMdhKOhadr+X38YEZRlPOoqy25wjTBDB1hQkLcp3DUIav4e+B6oUPHdjy/xwHbSkP6TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3pNf35GFmxwtZfw7iXig4qJ/cZlVHnspzfN5CpLGbY=;
 b=GtdHSUKPh7BtDbOfA+gHrypX3YMNnRTGeDVcJwzZKt+r08qwugv7sjBpn8WnJK2tH9UpSJ0D45D9LVvBoJNaGzbCu12LQs9TUIgdBlx1kwwkvs/fzXv7fLkHrS3xfeyT9qMdVsTKiXJPt8y/C7OJ3Z/BgIQwN7rsthCS5y0q++e5s8V6UV1dKbucHhD9PabuEymIe+/tDMs2kEhjP4mIxZl/2ltabe8lrii9F4ZYU9ZcDT08voReNVDp08yAOeXiYXg0cgQOkSv1lUzhNNVn+4z/Dmxlxep3i/Ivc0gyZpOWWhMuLWi8pGDE92eLK9V5ngNZGGrvKHChoh+zUA/bmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <298666d7-f007-fb3e-99ab-18b01ad48b00@suse.com>
Date: Tue, 18 Oct 2022 16:08:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v6 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20221011111708.1272985-1-wei.chen@arm.com>
 <20221011111708.1272985-6-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221011111708.1272985-6-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3dfc43-b7a6-4071-1390-08dab112304d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TmS6OoDXZKOdstcanh12VltMGA3JbqdqAfHIbbsX66wVn/qA6yL2gbbxTGX5Q5hnapPczuC5mwi6Q6ncWfnUFuXGj3/2pr12P0+dISHkg689J6h3gB7slZdyM0kH915Xxm8WiKyp9HJMmIfwS0IIuZoNgvBYePG1OJUq7IEvu3mn/jNYbJA+E0FfEaVHmaa96Fio+Tl78Upj2dYfa98GaAjW9CY4lVOLG3xucZo+UYzL8KKPhEuZASmmAvqzXsiT6owGUCrr+/5aNugErKzj/DVo+DE576dntQBAQ25HqkKdG5zkTdBYj04VUebo98p8+kqSWVFerXdK63tfOnFyFN7jGN1spmlFBeqFaamserY+w9rz9rW51jALF/73iSV9PPqtsvzGYEQq7Wzg2W+5DonN/L1yp+aDGDvC3/iU3coMblEXNvBv03HoSD/p9HshwPfc0+kkD8fiM1eB+qYRQYOR5Evb6jig4ptN5KGIpzyerPQk/CMjmREwQCvkOU8gLW8/5tpp63JeMDFSUgRS3Ge5xQUFfCJJEegHoq6NkXkXP+u4eB4yG2609Y0WW0mkuz54XpgWr6yIeavShUe53yQxpO9mzVzTk4ZP24F5eTL0y0rPsCBT7vquabGyzYn4dBCxPmhs+cjtE55jOfXe0SkcSTs9xlFnUFSSAWpmJumCQ9Av/07JC/ESfwVcJUcQsRhpKAWyD5nklpVt9LtzU+nvQoczQWVADyzM1FB8roUF/+rNup64otovWqEDB+rl4U2WAqCQgdtSeH0wU5Ri17g6NIOrKev9keKQ7wzNYFw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199015)(83380400001)(36756003)(86362001)(31696002)(38100700002)(66476007)(66556008)(316002)(31686004)(5660300002)(54906003)(6916009)(8936002)(6486002)(186003)(2906002)(4326008)(2616005)(66946007)(6506007)(478600001)(6512007)(26005)(53546011)(8676002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkxzTVA1TW5mYjNqaURpdHVKMnpkNnFmREloVFhYWURHdk1XMVZOcW1IMUMv?=
 =?utf-8?B?WEt0Nk1LcUtUUENtalBGTXo5b0tYenRLcXZLMG9teTFWUi82blBOaW80WHVk?=
 =?utf-8?B?NDdGWHRqMWV1Ym9YdlJGaTY2V2R0Yk9oVnF5dmsrVklMUkxmN2RFQ0tpWFJ3?=
 =?utf-8?B?LzhlQVg1WUx4K05xR3VMTkM0MDdYRHRRc1IxdnpzenAwOExzKy9pYUJoYVZi?=
 =?utf-8?B?a1crVDRIc2hXUGtmTTVZbnJiQmhuWFJBOVhaVThiNGZBT0F2aHpDZUVEeVVj?=
 =?utf-8?B?cDlMbTg3UWR0MzYxYWo1SnByRWRYYlNhbmNYcXV3aWpxaGxiMkhndzN6TFFy?=
 =?utf-8?B?NmY4T2NNSm1OWnRXaDZLNE01UFFPaWk5d3pYbTFSektWL2dqY1gwUTl4WXRa?=
 =?utf-8?B?YU9VZ1FrWFJ6OEp4a2t0TTM1SVJ1SW85d05UdHRWVW5ZdWtQd1pWRi9vK2sv?=
 =?utf-8?B?dTBrM1I1ZXRzS1lGUG4rMlpvTVpXeHEybVFNQ3JtTkxSYitycGJ2bU9HRFpH?=
 =?utf-8?B?K0psR1pOQS9heitvZllBeEd0c1dRYzNMTjNLR09aT09Tb0s5bW5RTXBLM25V?=
 =?utf-8?B?Skc3VG0rUlF2bk1najhJRm51bk1lWWVxMkhnYnRwcjlsSEhiVlo2d29KKzVH?=
 =?utf-8?B?dDFJeEEzNlJPMXZlS0lWWWJmMzQ3c21XbmhOb0NxdmJoekdoeUxmUU5jNzJH?=
 =?utf-8?B?S2xKTllST3EwR1NVQkt0UytIVEduZXllakVYaEdWdU5EeGtGSmhiVVhaYWp4?=
 =?utf-8?B?SWlJNGl1SURKd3ZMVVVlT2lOT2svRmZaZjA3MlJOVFZqNG1LVUZqcUtzYjdT?=
 =?utf-8?B?YWo5d2FoRXV1REVpN3hjWkpPcmNVVG41VURHU0tUSmJRQUZkMFNPS1hVZmJE?=
 =?utf-8?B?bm9UMlJWWkdLOWV1N1pXR3AyQVZsWUpUdi9ScFZkcnRHbkxOK2FkWmF2SnhM?=
 =?utf-8?B?QXNlSFBVSzhJTWxyTjVLUUEvQ0dWdlBPR1FVZXdnQkF1MEQ1NzZnMm9xd2tL?=
 =?utf-8?B?UGhBOWxnYXFEQXl5M1hDNW4xa3RubmJ1MHJKakhxUnowUTVEY1JpT3pxanha?=
 =?utf-8?B?cGFuaDhLQ0YxYmRIWVIweWQwckFNNCt3emlIT3ZDMHNPTDNMdkFTVzdhSWJz?=
 =?utf-8?B?MWFjd0hIRDZFVWFLUGJWTkJNVDZaWlAzUHNGQzF5UFB5R0JadGRzbkIxblJ2?=
 =?utf-8?B?REtvMEVXWGExN3M4NXpIWENES29uc2ZXSUF4NmdzbDdFWkxjUndQZndPRTY1?=
 =?utf-8?B?cUV6endJVisrU2VBVXhYU1k4Q0hEVXBTTTNlRHVTbGpta3ZBVHB1VkpyOHBl?=
 =?utf-8?B?OXYyNWN3TE9EVW1SVmVDRnArSWgyRURWYmMyNEMxZUxTVmxBTlVDZzYwTG9L?=
 =?utf-8?B?THhhRGV3REkxTitTWDV3VUJGUEVkK09tTDdVZWdkNzZLUnlnYjBmYWp2R25H?=
 =?utf-8?B?VGxMZkVUeFpYekYveXl4Y1gvL3ZYbkNJaTV4V2MvbDRoalJ3enB5MjU0bDUy?=
 =?utf-8?B?M25reVFSQ2VCZ0xYc2RlYld5eTYzdmtEakJlQU1DOUlHUnZ5N3hQakE0aThv?=
 =?utf-8?B?dGJjRTMxMm9BaEFad3VsVWJqUWVlQWZVWTJFclNqN0c5aWFvaC9PM20wWmwv?=
 =?utf-8?B?VG1jN0g1RlhKZUZmSDRQbVF5U0xIa0FYY3ZjUHBTUE5Nd05pc1VnZU53N0Jj?=
 =?utf-8?B?RGhzcTkzdm0wanE4bjh2b1o4bDh0bGFJbEZoQmh1VTR4UkltU3BFQlNOcEVr?=
 =?utf-8?B?SjYzYzFPVUZGNDlPelEzN1dHK2R3Y3FnYzMxRzN2OXdabTZaNm9NeTdIeTVv?=
 =?utf-8?B?aGdKMHRpMldSdjFIb2g0cE1mZmFlRTB6MW1QcGdLR2RRWUF2bGN1SmhqL2FZ?=
 =?utf-8?B?SENrdlgxYnNRSlVucVhjcEZiN0FON0N3VVVGNTFxVE5YbEMxdUZvTTZ5NW45?=
 =?utf-8?B?NHpHeEJ5bFR2K2poNkp6S004dGM0WXdkM2hBQW00T080UUh4VExYYVFLYnBx?=
 =?utf-8?B?c2RDK2tYWjlleS9IWVdCZG8wNTk3a1BMK0hFTko4MXJiQjcxM3d0Mk9sQkVJ?=
 =?utf-8?B?Tmk5dDlrcU1xUWZicytvZlAwUmN5eWZKa3lHZXE3MzRUbTZmOHFKd1FFdHN0?=
 =?utf-8?Q?qExrWnO3I1kJb/XhbFker9NKZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3dfc43-b7a6-4071-1390-08dab112304d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 14:08:10.5481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o21bgkKKlbU0L/QnqUmlETvjQgt8qW1L5qbhzRIMJkJqTDcPa8RrH9D7cH1JQWf1p0LD8iZfX5gaKvjI36TmPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

On 11.10.2022 13:17, Wei Chen wrote:
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -46,6 +46,11 @@ bool arch_numa_disabled(void)
>      return acpi_numa < 0;
>  }
>  
> +bool arch_numa_unavailable(void)

__init ?

> @@ -31,11 +46,334 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
>  
>  bool __ro_after_init numa_off;
>  
> +const char *__ro_after_init numa_fw_nid_name = "NONAME";

Didn't you mean to leave this at NULL for the DT case? (But yes, this
way you avoid a conditional at every printk() using it.)

I'm also uncertain of "NOMAME" - personally I think e.g. "???" would
be better, just in case a message actually is logged with this still
un-overridden.

> +bool __init numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
> +                                     paddr_t start, paddr_t size, bool hotplug)
> +{
> +    unsigned int i;
> +    bool next = false;
> +    paddr_t end = start + size;
> +    paddr_t nd_start = start;
> +    paddr_t nd_end = end;
> +    struct node *nd = &nodes[node];
> +
> +    /*
> +     * For the node that already has some memory blocks, we will
> +     * expand the node memory range temporarily to check memory
> +     * interleaves with other nodes. We will not use this node
> +     * temp memory range to check overlaps, because it will mask
> +     * the overlaps in same node.
> +     *
> +     * Node with 0 bytes memory doesn't need this expansion.
> +     */
> +    if ( nd->start != nd->end )
> +    {
> +        if ( nd_start > nd->start )
> +            nd_start = nd->start;
> +
> +        if ( nd_end < nd->end )
> +            nd_end = nd->end;
> +    }
> +
> +    /* It is fine to add this area to the nodes data it will be used later */
> +    switch ( conflicting_memblks(node, start, end, nd_start, nd_end, &i) )
> +    {
> +    case OVERLAP:
> +        if ( memblk_nodeid[i] == node )
> +        {
> +            bool mismatch = !hotplug != !test_bit(i, memblk_hotplug);
> +
> +            printk("%sNUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
> +                   mismatch ? KERN_ERR : KERN_WARNING, numa_fw_nid_name,
> +                   arch_nid, start, end - 1,
> +                   node_memblk_range[i].start, node_memblk_range[i].end - 1);
> +            if ( mismatch )
> +                return false;
> +            break;
> +        }
> +
> +        printk(KERN_ERR
> +               "NUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with %s %u [%"PRIpaddr", %"PRIpaddr"]\n",
> +               numa_fw_nid_name, arch_nid, start, end - 1, numa_fw_nid_name,
> +               numa_node_to_arch_nid(memblk_nodeid[i]),
> +               node_memblk_range[i].start, node_memblk_range[i].end - 1);
> +        return false;
> +
> +    case INTERLEAVE:
> +        printk(KERN_ERR
> +               "NUMA： %s %u: [%"PRIpaddr", %"PRIpaddr"] interleaves with %s %u memblk [%"PRIpaddr", %"PRIpaddr"]\n",
> +               numa_fw_nid_name, arch_nid, nd_start, nd_end - 1,
> +               numa_fw_nid_name, numa_node_to_arch_nid(memblk_nodeid[i]),
> +               node_memblk_range[i].start, node_memblk_range[i].end - 1);
> +        return false;
> +
> +    case NO_CONFLICT:
> +        break;
> +    }
> +
> +    if ( !hotplug )
> +    {
> +        node_set(node, memory_nodes_parsed);
> +        nd->start = nd_start;
> +        nd->end = nd_end;
> +    }
> +
> +    printk(KERN_INFO "NUMA: Node %u %s %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
> +           node, numa_fw_nid_name, arch_nid, start, end - 1,
> +           hotplug ? " (hotplug)" : "");
> +
> +    /* Keep node_memblk_range[] sorted by address. */
> +    for ( i = 0; i < num_node_memblks; ++i )
> +        if ( node_memblk_range[i].start > start ||
> +             (node_memblk_range[i].start == start &&
> +             node_memblk_range[i].end > end) )
> +            break;
> +
> +    memmove(&node_memblk_range[i + 1], &node_memblk_range[i],
> +            (num_node_memblks - i) * sizeof(*node_memblk_range));
> +    node_memblk_range[i].start = start;
> +    node_memblk_range[i].end = end;
> +
> +    memmove(&memblk_nodeid[i + 1], &memblk_nodeid[i],
> +            (num_node_memblks - i) * sizeof(*memblk_nodeid));
> +    memblk_nodeid[i] = node;
> +
> +    if ( hotplug ) {

Nit: Placement of brace.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -159,6 +159,8 @@
>  #define PGT_TYPE_INFO_INITIALIZER 0
>  #endif
>  
> +paddr_t __read_mostly mem_hotplug;

Not __ro_after_init?

Jan

