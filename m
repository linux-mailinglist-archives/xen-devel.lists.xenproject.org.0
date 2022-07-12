Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C32571AE1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 15:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365697.595984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBFhP-0005HY-AQ; Tue, 12 Jul 2022 13:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365697.595984; Tue, 12 Jul 2022 13:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBFhP-0005Ej-68; Tue, 12 Jul 2022 13:13:11 +0000
Received: by outflank-mailman (input) for mailman id 365697;
 Tue, 12 Jul 2022 13:13:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBFhN-0005Ed-VS
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 13:13:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60059.outbound.protection.outlook.com [40.107.6.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f3258bd-01e4-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 15:13:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0401MB2479.eurprd04.prod.outlook.com (2603:10a6:800:53::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 13:13:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 13:13:05 +0000
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
X-Inumbo-ID: 5f3258bd-01e4-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ychrbz4pRLxrp/F1ZpQLghX4tARWe1GgqsH44HE5uRAUnUOZta+a3VoQh4FVKwYLjg/YkU36THOG/PlMMPTVEre5k15d3cxi7sDZxI0z3N9SMx+1ibABCvBqZ23irLqeMun19bXOR7pyJ+idDjN1ABReLAKK9YywVfNbn72z9LRCnXjtRcuKrfc2bZ52g6BOlNkscmLiYnfUgHtCgKWFUGKYgPTYuItucHF4vde6mQVdsvNmBArkS7CncePL4CeMu1HYnwoMrzNFQYRfn2C5JWaarV5mpGR++m/GHmU9nPvm1vYoh6qb69TuIPg55z/R7OC4bXit85J8jO0hSso4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylGWmcAhIhFVUisaiNsJWg9JoeiMyxWeNyKTWs6XXZI=;
 b=PyHeaBuWERj/NvqxmRLhbPeQlSHGRBaHy5R/TrdHC3E3lQI6n0CLpIBcQimesgzwZWX5E/d1FuVK8ObKZH5FO7zkxDYweQMizCrbjpBnN35yW1uAsnCpT9zDKSfM9T0Szyd/L9uXI2ybGerkHyojqqTUrG+otDfglCzvTU9iQsFCY+s7cV87GKGQO4TMQwuSiLQmWOAfDlToOBgJzv7sHe1YiAj5dvK/SfhJWDchPlVLuvIHbycVAe1IHdFbaIVDqF/rsGGCw9sWk385RosRIk176hgfbdRHL9lSNSZrZPLd6L1VvH/e/39UmBMFNreYVJ4pBICQsmyv3P3PxxC9uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylGWmcAhIhFVUisaiNsJWg9JoeiMyxWeNyKTWs6XXZI=;
 b=jxWM22cUga7L+bb0bQ1IIRpTYAoxTQSMSYKk6xaIEJLQEEHbRjFgOqk/f/t0kpktNQh6sfybUxDKLJ6gjmt2QFOJff+JMZ26e9R2JC1Q4om4sF0X8oNFxfcLrW1p4z4/azhA9vdADe4uujRs+7XDNmw69+lC3lrT9hmrlXgAxvti/P4Q6OEJcGabK83t6IB0bv3AQkujDmGA+LmRex0BagXdCR93zx/ZCPtBzaVnSLhuDCy3RyxOTEOdoE1whpikHAhPLgCptIcj6B73BIyfSDR/ZvxWnHia9TYEAtRjwGfte0e565srUNmq8v7OtxnKQvoqfHsqWbUN2CtV0FJw5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <444a540a-bf0f-f743-3b01-b65210b49361@suse.com>
Date: Tue, 12 Jul 2022 15:13:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/9] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-4-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708145424.1848572-4-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e022b0f0-03b5-4ea6-dfcc-08da6408420c
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2479:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ij2dbgQYqBmADOHjaY1LUZttrH6C9MdJLhZbEIMGhg/myto6Oq4pTJ21svQk+ViIeL4a8qKjjIJk91y2qULAuXBVNKy9sVh7i0xfxmwwrW5mqJEH5fX8jm/ZEH3t67y8DFlf6q/YIkRRYSOE55+3XBdmaK4jXZ6a96FHzB06CdJcz3EktgaAfBJaGJji5br2xq7VtdzakzcjX3ehuuzUe3mzvcadeIQKXqdlM4vl9d5VFrtkLl8GswUCu4TH/qo03Ub1Vr4QkZDWhqLXnCEOZX9wndb/XQQ+Rk41MWFcbvhkmkM+aLq3sMDKgAphZErxYzU+3UaLCK0znNR1vq+zgvPOgmQG5cs5AeWmQ030IEfHhnx1kOEKN5ML+CDjTujkrGMLKwlFwdLWxaDAqFjWSdYN4FpCRX1D6tmkWwRi5JuACxe9TrAWwsRSq//esSWiZ+Xim6IH7IwbbSaocWdYXlenzaqk09pXVnoP58pSm1nvZLmNihwz4FD3AY0eN0bwslbKbdHeXdUjZAGlkDo/pK9ktrs6UmD6xnTff4Bt2JwTCJtJM+P2WRgiGbXZXqHxxBKRmACmbvuldgI+RwlN6P8UI4/NVA9Ag2z8cLVaUolTsYpYNOrcNzUYHqghqOb15TftMiOSpW2VDFKeHCqNKliM6p+zXeQgIsFiZ+rSQez/HYqffhFU2N8AB0iFweXm0uFxt3z09eNPy4h16Aeh5vwhN9Elu3FCdwCSuoandMo4OSsWyQLj7vdCoQ9TvSJC/AVUMsb2gSq24S2v7sNclP82grVdMzz0mlmkOKJHI4MQFP9GXdXegG6F8+F916Gh6WWGiBrtWcpMfBWYpE/L3aR+Vb+nd8hrgGOFG8czKf0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(39860400002)(136003)(366004)(396003)(6486002)(31686004)(478600001)(66476007)(8676002)(83380400001)(2906002)(36756003)(4326008)(316002)(8936002)(41300700001)(54906003)(5660300002)(6916009)(186003)(26005)(53546011)(6506007)(2616005)(6512007)(86362001)(31696002)(66946007)(66556008)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1lHOGVmT0FzZWZEcUF0UHA0by9lVFhXSU5mQjZPV3F1cHE5VXh4SDJseTls?=
 =?utf-8?B?OGZiYWlseWNsVi9YQ0JSZ1hFb2pmWVVyMXMyZVJmaEViOVB6WFoybFhRSjMw?=
 =?utf-8?B?VmFwKzF6K0h4ZHRVNTlrRUZCWXVyRWVnQlQ3cFRBbTRWSjVCUDBIbUNXVGlw?=
 =?utf-8?B?NnM5WHN5WllZeEFhcmRCNDJNNXJQNDBkWXBnSmIyMnVic1pMbC9yOXk4Tlg5?=
 =?utf-8?B?UUxkQ3NWZzNyYzh1V1NMNGc2QXlTOTB2Wlh3QzJrRXoxOFZ5Z2taSCs5Rk9u?=
 =?utf-8?B?VG9XTnlsNnk5NEpnYTN2QTVlYmltaGxBcmtFZnQ5ZFViRC9uY3J2QzlvWmF0?=
 =?utf-8?B?UVJJb2RhSS9xaWU1MnJFOTZzKy8xcHNFYitwS1F5Vm9xRnpxWUJta0E5a1g0?=
 =?utf-8?B?ckd1WjlqWnN3dWhxVi9xOHhTQWFkNU5ralJHc3FQTmxNc09xNHFXMGhWRmdT?=
 =?utf-8?B?b25STS9oU2UwWnpHK2NhZldBYkhTNlJZbVJZcHhIai81dG5UTzExRGhHMi9k?=
 =?utf-8?B?cXJrY1MzYUdncitiNEVhMndqcVVFLzhqYVU4eTExQVJ5Y3laTHVsVE9NZEFt?=
 =?utf-8?B?UDVRZStGeVN5Y29YUFV3cTU2djVQRkUrRzZ3VFZsazNoV3pIR2NZZDduWUUr?=
 =?utf-8?B?TVBqWnVNMmNaM2w0eG5MQWlZODJBRWtEbEllME5ITUtmZjF1SjFsK2VBWnZK?=
 =?utf-8?B?dlRnNWN2ZWxwRzRGd2ZkSzBGWlAyZE9sYnpQeWQwN0h2TnVtQi9nUHNLMjZW?=
 =?utf-8?B?T2haeGY5eGJZQ0V3cnVITVhEa01WNW1FZ3dDVk44Q2hjMlR6NkpLRTljcU55?=
 =?utf-8?B?bS9QSlpQM3laRUZwL2E0NitObFRmaHZQSjNqdXpONGpvK3VUN09IUUpzc2Uv?=
 =?utf-8?B?eW0wdHJrMEhlbWkzMzFkaXN6Ymw2M25UanExbkVkSDN0NlZpcTA3eThiUmJU?=
 =?utf-8?B?MzlCZkN5N1l5emJjVXhXZXVSVncvZExOTVpRU3hYcFU5dS9vNGVWT09BWDRI?=
 =?utf-8?B?YWtFYVFZM0piRVBtYTg5Wlo2V3pEZWswQVkyYjE5bFppN3VONXB4emZiYVBD?=
 =?utf-8?B?WW1iYURMa2tDeUJPRmFYRDNKQkU5OEY3VzRYZjRRSmF4WFlaYjVkTVpjZHNz?=
 =?utf-8?B?a2g3Qzc2VFNRWkR0RGxaOWQzekR0NXlhWmtjTXRKcEIvRk40WjR0cW9RdG1S?=
 =?utf-8?B?WFVDZ2Y5allMY2gwZHM0dlUxZFJuL2ZqNDVPQ3lkY214V3BCU3ZGSktvSnJZ?=
 =?utf-8?B?N0wyYW52Um8xRExJRFJORWVGVEJNWUFCSzl1bHJRQW5HVk1ZNi85UGE4bzk2?=
 =?utf-8?B?c2xvL3I0RU4rV2VGeVZsNVlCRERaVGdZTjVhdTIxazJBZzNZL1U1eUVJbU4z?=
 =?utf-8?B?Y1lnU1ZNalJsMGNRVmxRSkJ4bE92WkkvaDBpRGIwZEJMRUtsZDEwR2dpVEht?=
 =?utf-8?B?QkIvNHRNUi91OGd2RjdVYk05VEMwSFNpMkd4enhQWVZHWXJCeEtNMklTMHBM?=
 =?utf-8?B?YWhvRUpSUEthZDY0dGtGMlZycldtS1ZPY1dQNk5LQ3JkK2dLZlJjWWMreWtm?=
 =?utf-8?B?bmZIN3h3MVpJVXZRL1ZENlpJZUlTbkVlcU5KQ2IvMHRBajAyQ1ZsN2s5ZGYy?=
 =?utf-8?B?d1NYUTZEenVMUWtKWmI2LzVDb2VuUDlYN2FLMUhUbDdMalJkT25idU5Sd012?=
 =?utf-8?B?VG12WEVBYmNhcjRwaEs4djBvd2N6OFdXaWl5VTcxbDkvTWtIRGUwYVhDR0NW?=
 =?utf-8?B?eU9SN2l1MkZLeVovcDNEVnV1eDJzeHEyMmhKUStKSWh3OG1wVXNMa2dqQ3c2?=
 =?utf-8?B?VzBhYjNGZnExVXh5Q3JRUzRJRmdiWXo3NUZlajN6K1pGeGhPTWNsSVFRbVF1?=
 =?utf-8?B?Z0xXTW5ZcXpHSTZEZTYyOWhEYW5jMVNTcExqVmVKcDh0MU9aZFZianFzZjlK?=
 =?utf-8?B?SURwSkJ2M1F1b2l3MmdHa2JkL201QmNiZk5yM1gvSVhyV1B0d3A4eUVINkZI?=
 =?utf-8?B?Z0pUbjFrcHJpQWlmNVBxMUY2SnU2bFdsVFVPWXJUYnhHWnJBeWRjeUZGempk?=
 =?utf-8?B?cnIwRG1sbHQwaVM4TytvQUhFNER5QWlpWnpOQXVxNjdrS1B0M1NUOWNqNE5m?=
 =?utf-8?Q?M8lQTCqFIpjVRIuV6aw0ZHzZJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e022b0f0-03b5-4ea6-dfcc-08da6408420c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 13:13:05.8252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0PFsUxn9h0MHJx7lreQ2DCq11pNBapxIp0vWevqCrZjH45j7ST/EGwSbWgIy34CZUwy8Y0ibhdjN78R5i3bZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2479

On 08.07.2022 16:54, Wei Chen wrote:
> --- /dev/null
> +++ b/xen/common/numa.c
> @@ -0,0 +1,439 @@
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
> +#include <asm/acpi.h>

Isn't the goal for the now common code to not be dependent upon ACPI?

> +struct node_data node_data[MAX_NUMNODES];
> +
> +/* Mapping from pdx to node id */
> +int memnode_shift;
> +static typeof(*memnodemap) _memnodemap[64];
> +unsigned long memnodemapsize;
> +u8 *memnodemap;

For code moved, please switch to (in this case) uint8_t. I'm on the
edge of asking to go further and
- also use __read_mostly for some / all of these,
- make memnode_shift unsigned int (sadly this looks to require more
  adjustments, even if negative shift counts are meaningless),
- convert from plain int to unsigned int elsewhere as appropriate,
- add const where appropriate / possible.

> +nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
> +    [0 ... NR_CPUS-1] = NUMA_NO_NODE
> +};
> +
> +cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;

For these two please put __read_mostly into its more conventional
place (right after the type).

> +nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
> +
> +enum numa_mode numa_status;

This should probably have been __read_mostly already in the earlier
patch introducing it.

> +#ifdef CONFIG_NUMA_EMU
> +static int numa_fake __initdata = 0;

The __initdata again wants to move, and the initializer can be omitted.

> +/* [numa=off] */
> +static int __init cf_check numa_setup(const char *opt)
> +{
> +    if ( !strncmp(opt,"off",3) )

As you're correcting style violations elsewhere, please also insert the
missing spaces here and below.

> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -18,4 +18,78 @@
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
> +
> +struct node {
> +    paddr_t start, end;
> +};
> +
> +extern int compute_hash_shift(struct node *nodes, int numnodes,
> +                              nodeid_t *nodeids);
> +
> +#define VIRTUAL_BUG_ON(x)
> +
> +/* Enumerations for NUMA status. */
> +enum numa_mode {
> +    numa_on = 0,
> +    numa_off,
> +    /* NUMA turns on, but ACPI table is bad or disabled. */
> +    numa_no_acpi,
> +    /* NUMA turns on, and ACPI table works well. */
> +    numa_acpi,
> +};
> +
> +extern void numa_add_cpu(int cpu);
> +extern void numa_init_array(void);
> +extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
> +extern bool numa_enabled_with_firmware(void);
> +extern enum numa_mode numa_status;
> +
> +extern void numa_set_node(int cpu, nodeid_t node);
> +extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
> +
> +static inline void clear_node_cpumask(int cpu)
> +{
> +    cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
> +}
> +
> +/* Simple perfect hash to map pdx to node numbers */
> +extern int memnode_shift;
> +extern unsigned long memnodemapsize;
> +extern u8 *memnodemap;
> +
> +struct node_data {
> +    unsigned long node_start_pfn;
> +    unsigned long node_spanned_pages;
> +};
> +
> +extern struct node_data node_data[];
> +
> +static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)

Please use __attribute_pure__.

Jan

