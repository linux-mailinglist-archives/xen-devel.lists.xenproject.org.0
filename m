Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCE6571C47
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 16:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365742.596057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBGlO-0007N5-Io; Tue, 12 Jul 2022 14:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365742.596057; Tue, 12 Jul 2022 14:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBGlO-0007KE-Fm; Tue, 12 Jul 2022 14:21:22 +0000
Received: by outflank-mailman (input) for mailman id 365742;
 Tue, 12 Jul 2022 14:21:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBGlM-0007K8-6H
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 14:21:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4f58bcb-01ed-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 16:21:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7631.eurprd04.prod.outlook.com (2603:10a6:102:e1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 14:21:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 14:21:15 +0000
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
X-Inumbo-ID: e4f58bcb-01ed-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oW//iuQdFdLV/jOEQMAgz8ZubMTSF0ORg1qSKiVF8zqHUk3N2vXYQ7NlntYfroMtZQDEw/y8efzsH3vlmLLDNBwW8wRBb9of1FwmQmhjZE68RtPqGJ9fYZQHJkSAOYPxOWf+K8UlhqrmmI+7xHlgPpH1tdem8jCb9qWZkfDsPT0on+bRpyQUJ32U/ttoDyPg5pI/gZt3H8AkVgzXY8RZ/ThBg0vtVv7w+WYOuB3+86Osq2erPpTWjnZcGBhOQH5K/h/Xa70wom24CM1Baz2C6ggaQMUBZggpDc13XdmtvIedV5NjQfBcTU1fVTtgIARDkmZdwA0IyuVyybhgoUsQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyKXg2fyjphDhUQcXUDk7sZjrbmSx91MUx61taDhrW4=;
 b=HAtJnFT2xZu/FZ9VOfUVKEUFsLK9k1Tw6XXA2agFXQHMKGIS1jH1e517W5aAP+PyCCePwzPCnYCcWhchr3wvaBZ6zPH1kBjbpfqNSXRWXI8oqpsISmKj5v4+ssbcxosMDFAQUGbBjb5d4vkmapD8qb/9BYOBabDRil5hLNxOWChhGcqPqQ3SaEPQR16TSqUGfpEwKZ/8gu1SMCuXBvAUc8bvvZ6cVL7WDDPp14IL6mO0GyacWWofh3o1LskpYyQoEA89ldCTjsij5Nign/VQssoDSiuz8RdUxbzCHx0n7H5njsZw0wBejvUdV8o4b04k9Kpoytp5GwQX1x67bArBzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyKXg2fyjphDhUQcXUDk7sZjrbmSx91MUx61taDhrW4=;
 b=guPuhE2OjsKjcg3GeQoZAv9HVqUbQubtvYaRNeSgnQ3aJw0P5HqGjEotJ4Un63e/Xu+gpjwV+xPKqsVv1E4X0yKsdJ3tSKl2a86Ni44xxsGwYt5kJnrmvFI5FZ7Con/SADftblq87tFVDtdyr4AImrdKGaDEujCdx9S5eKMTTvO2VCDC5i96pBJawkTAXqGU6vM3xQPuS3sWT6k6cf1+VegJ3L9yxAXjKIof3r34QZsMN6N6Vg4E6YsgPoQa9BQp3hGDRE57FZTatxruEEKCavgiDgwIDsnK8pL/DgohYmltkM6McxtIJAQsUS7cTAGkZfdOqivjmZ3Ae8Dw07sJng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <357fc6ee-3014-4be9-9bf4-60669a4ca914@suse.com>
Date: Tue, 12 Jul 2022 16:21:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/9] xen/x86: move NUMA scan nodes codes from x86 to
 common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-7-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708145424.1848572-7-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0339.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0ab8d19-702a-443b-2eed-08da6411c7c3
X-MS-TrafficTypeDiagnostic: PA4PR04MB7631:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H4eLxqWFnLV/c5mdBvQe14ATarsRR8XcN6fwYJoiKDrglrK64oAxUj5H1BU+Iv7/tQP2WJhPtGMxRVEuqYxryB+qM2V2nrjMhgAqsuGY6IHVyQMemPGgWUgwBCJqJcrvKR4+cFSgC36cXoIYEopPph39UNVUNggE0mlqK7wakiGefN8K3oNbsuDvX56m32RVcbfqMYx/BAy75DAw5LQUduKN+x/5/cMgGKN5zidKwDvKC8Yq4tlOJCp2//TcuyRHEZZG9FMAho/dhwyqqr3bK7j0NsmVFGicRkihTCSYlW29SiSU8/j/6/ZzJpey0Vagt/zerS3NZ58vgaBKfXr30/Y25+gBux48707cOOOaDaeBSoKKy92a9tgZYdCg6TDa41KW320BRj6eK0sZQ6nHRMq2pQaHtG7oAs/r38A2OqghmQzdVqeBUfTYDjB2RlEGUQAwmdCLKmTwzL4PUqqdpgNK5el2LC1FDXborz9z+1n2vZYhu1C0dqd/laywzVOO5RfGTs5KT0vKIdaakF2E+GNTqRz+RlnumC/4lqYvrwdP9nfX/wH6LLd/rJoEHZsWEhzrYv8KBRnsFpCuUBgw+cSkJLaQukoOa4o7oWpaYlTG/ObZIxXstTHO8DfhelJfBHNBTeBEAXgXxVg9luh02EYGiGO2rVh/mYADd1CJrGN+EUIgzvq2AWMWhXUt0IpWBosHC96RGCBDlL5yLZFk655KAFobZIB4IhLRZcx6YSYxSdpt24nuv2MCor2aWHbd6y9FaSm/tsacs0LH+9qNLHrdLqzlA1AydUjvOjbVabrP42edy6mRuDe2WaSgEYFrbLhEcOMqpTR1Z3TPfvoAf2d3MoYJbcqIlg66jdSZQEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(376002)(136003)(39860400002)(346002)(38100700002)(5660300002)(26005)(2616005)(186003)(53546011)(2906002)(41300700001)(6512007)(86362001)(6506007)(31696002)(8676002)(66946007)(8936002)(54906003)(6916009)(316002)(478600001)(66476007)(66556008)(4326008)(83380400001)(6486002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGxUZHZscW5hSDdURUJNS3JHKzNCK3YyOHR6dXV6bHNuMEd5Zy9DdERLM1NH?=
 =?utf-8?B?TkVxWlQyeXNyNW9qb0d6VGZvbHRpZVA4Uk44UXd3NEFDbWZraTRnR3NWOERH?=
 =?utf-8?B?cHBtU3N3eDF4ZTF3a1FvblU1cHMvdjl4NGlvL1U3UU5hR3RkTkZya2YwcXBs?=
 =?utf-8?B?SW91RTQydEZLTkRwR1VUMWlFZnJqVkE0RENMazJ1OVhqRU1DeFF5cGgyS28v?=
 =?utf-8?B?eWYrbThaby9LcVZKV0cvK0ZsMGsvTEcwNy9vZzk1QXNNbHRNcFRXY2RpUUJJ?=
 =?utf-8?B?bEd1RGkwK2pmRlNxSWRxNEZyL3NyRjdnOEJHajBEQmEwZ3NoUndkVGw2ZUND?=
 =?utf-8?B?MEhLR2V6bHNBYkhGQnBUQW5JZnRVQVVDNVJSVGR5OUZ5NkZoRDVmeW1qQkts?=
 =?utf-8?B?TkhqMU9mWm9Eai93dXpRVTQxZU5JMlVrODVFak9Ua0Q1MHdydnR6N3NvdDIy?=
 =?utf-8?B?SWlBUXhGYi9UblFUY3B6RWNhd3ZQdjMram1ieVBSUVc5MWpCM1hETC81VzZX?=
 =?utf-8?B?RHdDL0JKU2NDMjFna3hLc0daWkt3blFoSkNyWlc4S3Y3V3AvNEkwTGZrejM0?=
 =?utf-8?B?OWVheGJsaGtMSnBobDNHNFJxV3VQY1VaYk9Fc1JIUFpYVDQ1M0l1cmYzckt6?=
 =?utf-8?B?enlpbDZ0WmNyN1BocmFwc0xTak5IQmpKTGN0NFBNM2RpbXRuZXZVaUd3WW92?=
 =?utf-8?B?cklqUXIvK1VKVHFpV2VuckRPMmhlL0s5MEVpRFFnSW1jeGw1bGd5dFNnYW9V?=
 =?utf-8?B?UkMrdjl2di9UMnBvWkpwanJzbWlHTGVoSDJNaStDNGJoN1orT1NCYldCeHN4?=
 =?utf-8?B?citGUnQ1U2ozWWdkbExDUEs1dnQ3TERITlBpNjIxNHNiN21tNUtFejIyT0kv?=
 =?utf-8?B?U0ZzNkFFVmg0VzNoZ08ybW9sRklsTitKUXJXNDJOOFg2OGYwQ1BJeHB1M2E1?=
 =?utf-8?B?ejQ0eUFrMFV1UTNvbFFKMDVuVk1rM3ExNE5aS3V6NnhrRnJCQ0R3Tk5RTGZF?=
 =?utf-8?B?Nit2ZXBPYUlQcFBRU2wrdlZscW5UQXNuZnF2UUdaeGdsMyt6bnpPSXNvcGNM?=
 =?utf-8?B?cVhRNjc4WC9Dbi9oTlEwUVZRMnFFZUswOTk4YkZqaHc0MFhEbzc5Sk85cHBZ?=
 =?utf-8?B?UmoxZWVLSTBhMWFXMExTUGZRZUR0bWwvVmNZOEZkQXF5VVZxU3pxZm9MdGt0?=
 =?utf-8?B?Z2dOSVVWanJiUTh3V01SbnVJQXg0anh5VVJtTkk0TWgxNXNRUXZkenlzSVZ2?=
 =?utf-8?B?eTZOT2IyMHRycE42NFhvNmFRUHY4eGViSHBvZ25WeTMyQlBrVWJtR1RsRFRo?=
 =?utf-8?B?aHVFcko5N3FmMHVGN3ArNXREOVFnTWRXUHNSSEh6YXQrdGlDQTZtWXZtL0Mw?=
 =?utf-8?B?eTc2WnBwTUdaZWlJYUgwN0k1b3EvQzQyKzB5N042YzRqM0RWNHQrQ0VBM21F?=
 =?utf-8?B?NENKbktiMU4zdXppTmR0c3ZEWXZ4S0xLeGtyNGQ1TXJQQWJqODNBWG1QdjJk?=
 =?utf-8?B?UVZCUEFsR09IZ1BjakhVMTVLMFNUUDg4dHNQSHZwWE0xRHk2RnJGNm13bUZQ?=
 =?utf-8?B?alErcGFtRHVCRVpUeW5HTnVhaXJuK25GcnhveEZSdEdyNUczNlZNUk1uSWhT?=
 =?utf-8?B?V290dkpWZ2VoL0lUVGI1VUtoNEU4T1NRR05VYXVhTTBSSFltcE0zQS9MZUR1?=
 =?utf-8?B?bHB2UGI1QXZDRS9tV25MUjVTVllUWkVQSXpzLzRlTnNWTEkyc0FBemtzZ1dh?=
 =?utf-8?B?REtPZUhscDdnaHNUR1drbXZueE1oT20zR3FSbnFCd0RvazRGNVJUeFhnSVVW?=
 =?utf-8?B?eG1jeTJUUDN0SWVVYjZYM2s3ZUxXQk5sZU9TVm1YQlhaZUVuMnFaektTbGZn?=
 =?utf-8?B?d3YxaHhTNmpVRFl2TVF3UVo1UlpZSEdKRVZSQnRDT3c1Zjh0RElzMURUVVFv?=
 =?utf-8?B?VDNOR09IRWJtM1gvQ2ZDYUhaWjJabVlzTk53QngvMis3bGFiTGdhUDZqVXBY?=
 =?utf-8?B?c0kzNDdKdGtvU1FLeU5nSkU2RW5Fa0tTcituVFpvcUJEWjdTRkdrNUtiNDk0?=
 =?utf-8?B?azR3WUdLSU5nU0QzdkhwTE5JbVUyWFBmT2ZHTFRjT0ZOVEN2MGZVc2p3aXlD?=
 =?utf-8?Q?RjqQhhRy3kz3olZOp6g8H+njX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ab8d19-702a-443b-2eed-08da6411c7c3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:21:15.5963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyF6N+bPyVmpWaxjAIQYuM6FdCoLjTFiShwESjWrQ21bvRPtFHkC9YPw1HPwLcbyx77nIUNDs2pwMzkJCxgnlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7631

On 08.07.2022 16:54, Wei Chen wrote:
> x86 has implemented a set of codes to scan NUMA nodes. These
> codes will parse NUMA memory and processor information from
> ACPI SRAT table. But except some ACPI specific codes, most
> of the scan codes like memory blocks validation, node memory
> range updates and some sanity check can be reused by other
> NUMA implementation.
> 
> So in this patch, we move some variables and related functions
> for NUMA memory and processor to common code. At the same time,
> numa_set_processor_nodes_parsed has been introduced for ACPI
> specific code to update processor parsing results. With this
> helper, we can move most of NUMA memory affinity init code from
> ACPI. And bad_srat and node_to_pxm functions have been exported
> for common code to do architectural fallback and node to proximity
> converting.

I consider it wrong for generic (ACPI-independent) code to use
terms like "srat" or "pxm". This wants abstracting in some way,
albeit I have to admit I lack a good idea for a suggestion right
now.

> For those NUMA implementations haven't supported
> proximity domain to node map. A simple 1-1 mapping helper can help
> us to avoid the modification of some very valuable print messages.

I don't think a simple 1:1 mapping can do. Surely firmware
represents nodes by some identifiers everywhere. And I don't
consider it very likely that we would want to blindly re-use
such numbering inside Xen.

> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -14,6 +14,21 @@
>  #include <xen/softirq.h>
>  #include <asm/acpi.h>
>  
> +static nodemask_t __initdata processor_nodes_parsed;
> +static nodemask_t __initdata memory_nodes_parsed;
> +static struct node __initdata nodes[MAX_NUMNODES];
> +
> +static int num_node_memblks;
> +static struct node node_memblk_range[NR_NODE_MEMBLKS];
> +static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];

Some (all) of these likely want to become __read_mostly again, at
this occasion.

> @@ -32,6 +47,298 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
>  
>  enum numa_mode numa_status;
>  
> +void __init numa_set_processor_nodes_parsed(nodeid_t node)
> +{
> +    node_set(node, processor_nodes_parsed);
> +}
> +
> +int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
> +{
> +    int i;

unsigned int? Then matching e.g. ...

> +static
> +enum conflicts __init conflicting_memblks(nodeid_t nid, paddr_t start,
> +                                          paddr_t end, paddr_t nd_start,
> +                                          paddr_t nd_end, unsigned int *mblkid)
> +{
> +    unsigned int i;

... this. But perhaps also elsewhere.

Jan

