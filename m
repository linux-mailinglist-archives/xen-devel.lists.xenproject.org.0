Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AC05A0E98
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 12:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393280.632132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRAYy-0004Xy-It; Thu, 25 Aug 2022 10:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393280.632132; Thu, 25 Aug 2022 10:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRAYy-0004V9-G1; Thu, 25 Aug 2022 10:58:16 +0000
Received: by outflank-mailman (input) for mailman id 393280;
 Thu, 25 Aug 2022 10:58:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRAYx-0004V3-Et
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 10:58:15 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10063.outbound.protection.outlook.com [40.107.1.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0baeaf7-2464-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 12:58:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4690.eurprd04.prod.outlook.com (2603:10a6:208:c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 10:58:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 10:58:11 +0000
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
X-Inumbo-ID: d0baeaf7-2464-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOf1WFivHEUjCVLkzk7adBI3nlvYvO4wrk4X3pX96bPbH+oTRYU0hMM4x0JB5qUZUm0+RdfS1aGtzsURmLW0wgB67Klo7ztstnRIPU2eH/zPgSXRRvLxwJrUp3MHtRB2aeFNxzfVCc7hp2uuCpf7UFArxqeG1lh46NU6WfxO5uFcOOyB8TdWfGUsfCYKG+3vOqUdSj41kJd3KXUDKfX3a1CBSGbjQJ1ICK/0gacEV9YmwAXquGIDL6UgEfURWkPsqtJgiIjHCsbBrjioCWNyPigGKBtzlzPhLCvXvS+AZiM8bZeu83nmswqFirdf5bsHZP60lZwb4dvtNcxIEkJkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVcDTDa4xb0OK4+x7pmNUaClrXv5F5u4nG3dDHNIolU=;
 b=CPqK/FBDVZd2KblkHO/ISjtRXM41bbWVDjGbcjQiTj1Rqimn0bdMd9WUp4O2k7Xc8moRlL0zj24lRkNmt49kX6DoWCK4MWnoXEJP+vhoaNG/pDsn4KprTx6WgPVEYVzHBdJ2UksBjUrPswcEndiUj74FWyHM59AbPbzdp7kL8hL7aPZkTNhi3zprkEY7WmJh5uoOO0lCMPhAYoGsv+/9sMxJaI3yNQ/BoYKH5Qani1+HJrN/l4BUmzR58JZlZaXz4INjnygdKAmM9Hs3ZOW5AbZdi8r0+5fqpZccUlYDNppw6BPsWaYL4jYY7T8Hfu5mPNoOtIOUQ8lBNEPnxL7LCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVcDTDa4xb0OK4+x7pmNUaClrXv5F5u4nG3dDHNIolU=;
 b=D8BxvZftcmY9mQB77j3v6ug5RZd6/546J3ZjhFj0Ht47WPK4LQAKgMKnFjexSeMwvsCXMvfFRgd12Weu2+i2SQBvFpIvU983LdMPwfBCwDmNsg6ga78rLAUXhywAG9i2Sw68D6rxJ+/CSlna8F6HleOjaUEE6MkZsuz8HQed8EUUrsA+8Nfg9kEUacvOdv6Mr5lb7diyJdD8g9nIPf8melInKVax3DmhQzU2zyTGQMImzPrswYZSg2kJNJNnQEbQEY5vmB4qRTjW4AGXlQsztZIiih22CX44E+hTmxQ5oWmbs6COog2SbkzlSy5n8tUIsGDvhaM4il77l7uaq+RWFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15c1de02-efa3-5d2d-db3f-1b04de8a1ba4@suse.com>
Date: Thu, 25 Aug 2022 12:58:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220822025810.2240707-1-wei.chen@arm.com>
 <20220822025810.2240707-3-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220822025810.2240707-3-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 567b214b-2aa6-49f4-031e-08da8688b395
X-MS-TrafficTypeDiagnostic: AM0PR04MB4690:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JUHus6EhNbmtlBTlZHmLxRosIQuBjGwfH7EM/qttNsPBI00HuXA3WOmMWYzEKow6t4fGsDjsmm3B6Me08LKywooJxoaq/ui1+lxs/H3znTuV/6FJGhxT9TkDGzuWNo/9/hd+KwTZ4vnC9RzugbvfFniAuhXOQ6jSPbiSNnvt+AJOi/MU9SZc45VKWu12HwxGx12EWnxmIqYkbhEqJz+xgSjn+wui1JvjbiHRTzpguAicdoQP0V3QLwPSPqUmNoBjrgoG91zIEkMwd/1U3ojVXi0FW24iXv1yO7wh04En+VHNG0hIxrpOie/uGKuVMIg+Frw56jrGeGfMph8+GGRsDJfNk4Fi0XyNUGM2FTRN8RafO1pHzLEjv+zW7LkPcZMjRXLXJQurR6eT+q/RSGxZaoxUCDLxfEN1ySEaNe15+gSSVg6CgXBZ4ovsDei9fbZOOPykPjoRuNV+vDWOpK15JZA0Y5ef1Ga9A1ljHprDBT0T7u49sDa2I4VASrm7ebXholCNv7I5bGfKfm25ylGf65CGOUMvALBNUR5n2b5SFUgtrh+Sof6sMtIIAdoDk9uWUAvLuzwZSvHF5gl6gq9O+w2eVZYoLvP4rrNbFZrkUJIjO80NhslPFOQz/gNIRfSkd0pdzt/VkOCoaTuTYEuM4BzU5DUGCc2npzMt1D3Qn4YoVln/SM6AvMAsu+h3uvuviihghMCP+sTrnbAbkJLcIXRKLxw8jzHgVev3ocepvUteLEg+hpqffQpmvLMcNUD4elVwspAir/pIPZpSLiA/7pTUCG9TQJyWsBNjwO0mXbg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(39860400002)(366004)(396003)(346002)(6512007)(26005)(38100700002)(66556008)(8676002)(316002)(4326008)(66476007)(6506007)(53546011)(6916009)(41300700001)(54906003)(2616005)(186003)(5660300002)(6486002)(83380400001)(478600001)(31696002)(31686004)(66946007)(36756003)(86362001)(8936002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0w0SGg2UGU2OHp6T1FITVhnL1ZLS1pZZVdEWEpQQjdBUG5kbDRUSllJVXg4?=
 =?utf-8?B?b2tZM2JJOGVneDE3eURzRUxuamdpSExPQ2Jwd3I0bmxJa0wxejc4RVMzTTZy?=
 =?utf-8?B?eVF3dWV1bVJTam5JTHdqWFQ0cy8rdmhmWEMwSFdJMGVDL042T3E2TDU5OTFP?=
 =?utf-8?B?eVhWd2FYcFlhaHJCajNrU2dNYTZXNFFROW9CY3N4cXhHZzlBbW1nMGFJWWhr?=
 =?utf-8?B?YWthRGJ6Z2ZvdDdQS0xNRjgxNFd5OERTZGFGYzV0YW9rb3BEYllOK00vblJI?=
 =?utf-8?B?Ty9pc1RJOG5Sc3lwT2hVTDJTcUV5MmJQSGMrcG5Cc245aW9XOU50MVFyQzgv?=
 =?utf-8?B?THJXcjl5MW8rb0haM1lnSURMOHc5QTVJVklucUxaSE55N2hVQ3BSMmxsc2hs?=
 =?utf-8?B?WnVpMjkvd1lBSmVUMko3bGh2VHpHQm5qMDRub0NGL0xySXVvSXFBcW9yV1VZ?=
 =?utf-8?B?NTI3UUVjWUtuMzRTV1ZLSGtUTnc3Y0Q2OFhlb0ZqNHlNNFZXOFpHdXp2b2Zo?=
 =?utf-8?B?eWlyNDl3b1pML0crL1hmMFYzMWpiTCtPYkdCSnM4K1pBZm9NM1lPeDF2RDgv?=
 =?utf-8?B?T1lBczNJdXB3Mi8zd0t2SjlZM29sUW1MM2RJdUZhNmY4MGM2TFh0Y2ZzUHpT?=
 =?utf-8?B?ZmpoNnhhT25jUlA5WDc4ZzN2QjZINEhYVHhBTU1IOUwyU0tSMlFsRDNOU1pH?=
 =?utf-8?B?aHhoSmFpazdOQTNaQ2ZNZjZVZkQydElaRHZ5TTc2eERqNStWYk1wMXhCejMz?=
 =?utf-8?B?Q3g1cUJ1R2VBVkhGQkFGakgvKzA3Zm8rU2Y1MnNmcWVybzlGRFpPOE8xREZZ?=
 =?utf-8?B?VDBqYTB1Z2paOHQzd0UrYktYUVdSQXR1T0VLVmpaMlYya2xZcUtWZTMvdWox?=
 =?utf-8?B?bE5ndzI5UkZIWWlsUTRQb0xTKzc4TjVpRE4ydm9LajVlZGduajVZQndYRG04?=
 =?utf-8?B?bDNiVk5qRjAzUTZ1QVZlRzZ6TTBqVVFpOGRLTE9lUjJ3STlqbGNLSjBBZkVX?=
 =?utf-8?B?ZnpBOGhKdEVVVmVUZXAyRGlzVjhVRXZkc2dDTGUrM3NoOTZydDFiRi9tUks2?=
 =?utf-8?B?ZnFtRXJidHRnSVZtdGxGQjk1ZDF1bXVDdVZyTnVvWVVWYkNMRlpocVlHb2tk?=
 =?utf-8?B?WHJ2MmUyZmNRMU5yQW43UlV6Y2k2Tm9CeVZWWUY2eUhjaWJTZnhTWHpFYmtG?=
 =?utf-8?B?dVkvUmRBV1V1eEJaejlsNTljeEZkU29KazdsMit2TnZYa3liOHk4Ni9zN1BY?=
 =?utf-8?B?R0prMThkelUrRkIySWJXZFJSUTZPRDlBT2lIemZmUWxlejdwdkZDcWVyVmdU?=
 =?utf-8?B?M3lZcndKVXo5YjgyYWJWYytJUVh5MU1YVEJqa293YkFOQkE2NXRLbkphYWRa?=
 =?utf-8?B?Nm5ycFM1ZnVUSU5aNWZQRmZPM0pmd3FQNy9IZTFkbjRVY3ZiOThuU3ViSEhX?=
 =?utf-8?B?aURLNTMvdi9rNDJEeDM4OGRaK1R1VGtmVVNSc1dhRWtwSFNYMFZ5QmdqMXBV?=
 =?utf-8?B?OTBOTm45bjF5NERjMWhobVZlSkxYTG9pZTBpUTdJSGN3UGFKand4VUhiS1g0?=
 =?utf-8?B?Uk1xL0RCdThCcHpuQi9CUkw3b0NhV24rMFJiTDN2dGg0VDJ2K1lQR00wK1B1?=
 =?utf-8?B?dU56cDJlb1dxZDZlOCtzNjNWeTZZY1lQeFVKVXlIR1VpZXdCSDRWK3R0T1Zj?=
 =?utf-8?B?TFk3b0tIRi85R0NXUEN3K0lmVVpKbFFoY3JrMGdZSnBsSVNZTlZXaU00RjBv?=
 =?utf-8?B?SDJHUVNhaDg2ZzRuR2ZpQkpiTzVORVJDMnNmamVmQVVyVGlmeHcwS0t2K0hK?=
 =?utf-8?B?S0haaWs2WTRQZ0MrRDZ5QzFmTHpyV3Y0S2YrWnB0VU1ucndTZktrM2VTZFFp?=
 =?utf-8?B?UzVXOThqUVhkOWRKVnN5Z1ZMeWpGN21NNDBRRGtQOG8wRm9JUW1SUmcwTm14?=
 =?utf-8?B?ZFNGRFoxcWw5VjBtQVhJb3p1Q3hQVGRoN2ROKytnQkhvRUl2RFMzN2pONVRZ?=
 =?utf-8?B?dFRMYldpdlNYYlM1SVE3WVBLQjVmb1A2TlN0TjVtM2RRL3FCUi9lYXJ1cmE3?=
 =?utf-8?B?QlptNVppWHExTVJDcmRnWWdHVjVURDhabEgxYm9hVnRHckd1NHlYelA2RWpP?=
 =?utf-8?Q?VrhH3z+zxwarFuynk9wNZ3sSp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567b214b-2aa6-49f4-031e-08da8688b395
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 10:58:11.4157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsXnYpqk1sJF3c69QhzEh1/neOy/c5tZk55JI3m84IqS0fReS1MrneeGFp/vSeB7G2LgqklVg0//UOfiQLGjvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4690

On 22.08.2022 04:58, Wei Chen wrote:
> --- /dev/null
> +++ b/xen/common/numa.c
> @@ -0,0 +1,440 @@
> +/*
> + * Generic VM initialization for NUMA setups.
> + * Copyright 2002,2003 Andi Kleen, SuSE Labs.
> + * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
> + */
> +
> +#include <xen/init.h>
> +#include <xen/keyhandler.h>
> +#include <xen/mm.h>
> +#include <xen/nodemask.h>
> +#include <xen/numa.h>
> +#include <xen/param.h>
> +#include <xen/sched.h>
> +#include <xen/softirq.h>
> +
> +struct node_data __ro_after_init node_data[MAX_NUMNODES];
> +
> +/* Mapping from pdx to node id */
> +unsigned int __ro_after_init memnode_shift;
> +unsigned long __ro_after_init memnodemapsize;
> +uint8_t *__ro_after_init memnodemap;
> +static uint8_t __ro_after_init _memnodemap[64];
> +
> +nodeid_t __ro_after_init cpu_to_node[NR_CPUS] = {

I don't think this can be __ro_after_init, or you'll break CPU
hotplug.

> +    [0 ... NR_CPUS-1] = NUMA_NO_NODE
> +};
> +
> +cpumask_t __ro_after_init node_to_cpumask[MAX_NUMNODES];

Same here.

> +nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
> +
> +bool __read_mostly numa_off;

This, otoh, can be, or have I missed a place where it's written by a
non-__init function?

> +bool numa_disabled(void)
> +{
> +    return numa_off || arch_numa_disabled(false);
> +}
> +
> +/*
> + * Given a shift value, try to populate memnodemap[]
> + * Returns :
> + * 1 if OK
> + * 0 if memnodmap[] too small (of shift too small)
> + * -1 if node overlap or lost ram (shift too big)
> + */
> +static int __init populate_memnodemap(const struct node *nodes,
> +                                      nodeid_t numnodes, unsigned int shift,

I don't think you can use nodeid_t for a variable holding a node count.
Think of what would happen if there were 256 nodes, the IDs of which
all fit in nodeid_t. (Same again further down.)

> +                                      nodeid_t *nodeids)
> +{
> +    unsigned long spdx, epdx;
> +    nodeid_t i;

This is likely inefficient for a loop counter variable. Note how you
use "unsigned int" in e.g. extract_lsb_from_nodes().

> +unsigned int __init compute_hash_shift(const struct node *nodes,
> +                                       nodeid_t numnodes, nodeid_t *nodeids)
> +{
> +    unsigned int shift;
> +
> +    shift = extract_lsb_from_nodes(nodes, numnodes);
> +    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
> +        memnodemap = _memnodemap;
> +    else if ( allocate_cachealigned_memnodemap() )
> +        return -1;

With this the function can't very well have "unsigned int" return type.

> +void __init numa_init_array(void)
> +{
> +    int rr, i;

"unsigned int" for i and perhaps nodeid_t for rr?

> +static int __init numa_emulation(unsigned long start_pfn,
> +                                 unsigned long end_pfn)
> +{
> +    unsigned int i;
> +    struct node nodes[MAX_NUMNODES];
> +    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
> +
> +    /* Kludge needed for the hash function */
> +    if ( hweight64(sz) > 1 )
> +    {
> +        u64 x = 1;

uint64_t and a blank line between declaration(s) and statement(s)
please.

> +        while ( (x << 1) < sz )
> +            x <<= 1;
> +        if ( x < sz / 2 )
> +            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
> +        sz = x;
> +    }
> +
> +    memset(&nodes, 0, sizeof(nodes));
> +    for ( i = 0; i < numa_fake; i++ )
> +    {
> +        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
> +        if ( i == numa_fake - 1 )
> +            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
> +        nodes[i].end = nodes[i].start + sz;
> +        printk(KERN_INFO "Faking node %u at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
> +               i, nodes[i].start, nodes[i].end,
> +               (nodes[i].end - nodes[i].start) >> 20);
> +        node_set_online(i);
> +    }
> +    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
> +    if ( memnode_shift < 0 )

Does the compiler not warn here, comparing an unsigned value for being
negative?

> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -18,4 +18,70 @@
>    (((d)->vcpu != NULL && (d)->vcpu[0] != NULL) \
>     ? vcpu_to_node((d)->vcpu[0]) : NUMA_NO_NODE)
>  
> +/* The following content can be used when NUMA feature is enabled */
> +#ifdef CONFIG_NUMA
> +
> +extern nodeid_t      cpu_to_node[NR_CPUS];
> +extern cpumask_t     node_to_cpumask[];
> +
> +#define cpu_to_node(cpu)        (cpu_to_node[cpu])
> +#define parent_node(node)       (node)
> +#define node_to_first_cpu(node) (__ffs(node_to_cpumask[node]))
> +#define node_to_cpumask(node)   (node_to_cpumask[node])

Please could you take the opportunity and drop unnecessary parentheses
from here? Afaict only parent_node() need them to be kept.

> +struct node {
> +    paddr_t start, end;
> +};
> +
> +extern unsigned int compute_hash_shift(const struct node *nodes,
> +                                       nodeid_t numnodes, nodeid_t *nodeids);
> +
> +#define VIRTUAL_BUG_ON(x)
> +
> +extern bool numa_off;
> +extern void numa_add_cpu(unsigned int cpu);

Please can you have variable and function declarations visually separated,
by adding a blank line between them?

> +extern void numa_init_array(void);
> +extern void numa_set_node(unsigned int cpu, nodeid_t node);
> +extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
> +extern int  numa_scan_nodes(paddr_t start, paddr_t end);
> +
> +extern int arch_numa_setup(const char *opt);
> +extern bool arch_numa_disabled(bool init_as_disable);
> +extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
> +
> +static inline void clear_node_cpumask(unsigned int cpu)
> +{
> +    cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
> +}
> +
> +/* Simple perfect hash to map pdx to node numbers */
> +extern unsigned int memnode_shift;
> +extern unsigned long memnodemapsize;
> +extern uint8_t *memnodemap;
> +
> +struct node_data {
> +    unsigned long node_start_pfn;
> +    unsigned long node_spanned_pages;
> +};
> +
> +extern struct node_data node_data[];
> +
> +static inline __attribute_pure__ nodeid_t phys_to_nid(paddr_t addr)

Nit: The conventional place for attributes is between return type
and function (or object) name.

> +{
> +    nodeid_t nid;
> +    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
> +    nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
> +    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
> +    return nid;
> +}
> +
> +#define NODE_DATA(nid)          (&(node_data[nid]))

Again please take the opportunity and drop the unnecessary inner
parentheses.

> +#define node_start_pfn(nid)     (NODE_DATA(nid)->node_start_pfn)
> +#define node_spanned_pages(nid) (NODE_DATA(nid)->node_spanned_pages)
> +#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
> +                                NODE_DATA(nid)->node_spanned_pages)

Pleae correct indentation here - it was correct originally (except
for the fact that it was using hard tabs).

Jan

