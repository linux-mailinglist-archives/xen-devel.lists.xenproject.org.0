Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5618D5B1811
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 11:09:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402960.644910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDXM-0002Aq-6C; Thu, 08 Sep 2022 09:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402960.644910; Thu, 08 Sep 2022 09:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDXM-00028S-1u; Thu, 08 Sep 2022 09:09:28 +0000
Received: by outflank-mailman (input) for mailman id 402960;
 Thu, 08 Sep 2022 09:09:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56Vh=ZL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWDXK-0001bl-GS
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 09:09:26 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2056.outbound.protection.outlook.com [40.107.104.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef259de9-2f55-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 11:09:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3918.eurprd04.prod.outlook.com (2603:10a6:803:21::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 09:09:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 09:09:23 +0000
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
X-Inumbo-ID: ef259de9-2f55-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUofFq3W9phdDxwelhsMnLFEb/AtXkjWn65MlyZh9eCszJwJdywsu1wwx/DHVaMJEavPa2lN+02AdyRMRq3W8cwPNY5IAn3OvsGTn0+n1WpxiBTWmZPrC84u1r9t+KVVRVCmlJNAMyP48z5eGyXnStUIQrp5r29OylyLC7zKLOuO7Yxn1YPiHpe4fO2BJlniJQ4n87hghphH/zQ6wsd4O78iPCCj9oW+boidNk8VH+UL6GCVSq2wAUT6TQWv1ng3bTweI773WVAH9tP5PpR2dJpGeFhoxiz2eKULrq1n+T3/hK9JR306NJXxE82701NjQ5IIipejfY5jkZIEzFDtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQ14SFblbuhivGAN+XrIB1HI710P+uFIOTxAbhFEkLU=;
 b=JvYVYd0rr9UPIDjutnrlP6FUaUqZ9wPEQ+ADXmQMvbKVAO1RZJFzceptMgCovau68WrCSbdKOHK+Vd/B9qaDwYa2/8YxX3TAyMcK9TJVJgGbcQ5PFbVSM6TaKyREgJLtsnRM7IQM+TTDaxloWU2cAjuprwKrHvbDyTsj3cIi6tfytZUB7w/Q2amTyiwrzdov8DLJVhy8ZjKv3AG6lC2+SwgQTXMQ2tvngbYWVeUIto0J3cUpuhWesH4UT3IP9neG0Yyc+n/O9pfMnqYiTvLg9KX+QdTIqw3u9tURbYvqHctIo4HvwvVvYY91NrjO3yEusTQfI4oV9fykINbmP/gIGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQ14SFblbuhivGAN+XrIB1HI710P+uFIOTxAbhFEkLU=;
 b=u3LAZxS81fwbSUjsDwP0+ORO0gqkkSAVcSHI+jEGf5rpZ0fIO2sifi0OKyMdR3IgL1TvwvFGlIjLre3cpkIGk5eB2MpA7NBKxsp2c5fpxLYyYtb7dWr0Wy4fGzQnvoQkVYq20R6Q5J3lv+0i162kkGtKfVPKhgHbXCj2OcODGXA6EkBkHlIXah+h6bR5yiehihuFsHmunX8h3O8yTAUiJSe2keQHW9kWWXeikEP05+5CeZHzUi7CcdMNpbPa+S0Fpw29ECtLGPBQpYnQIZCzzdYvNrPhTz1dxGG/N0md2eD1Olj409IpMPUDKYZ9259QnGCqSBcWIsbcq2yoJ2dO9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f775642b-7b44-86b2-70df-540069bc6674@suse.com>
Date: Thu, 8 Sep 2022 11:09:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220902033121.540328-1-wei.chen@arm.com>
 <20220902033121.540328-3-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220902033121.540328-3-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0010.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR0402MB3918:EE_
X-MS-Office365-Filtering-Correlation-Id: abcf4497-08c8-4d6d-c729-08da9179d22e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6O/2X+kbOzX+RUY4jEuLCE0FuIBA3nFCZHhClSp9VybddiAFqbdwcJ/YZySbmxVGK8XZjfTtA0r4NQoNvLLwXbT2tSubqem5HdYsCd1NUWrfPzy1iy3uG2UCO6zWe60Fgd1o4PYmUUmxW7dnEyPXPv310NcJN9HUXrwdn5lO7jBgQF06UnLsT8mZGVvnqQOFiVVDDb+wPRNjAQqSmS9cd2e7BAut385VGliiwwm+FNqXQS3FsnNK5MSX7AvHEa7d3/1Z2qt9TSX5zgFW/BBIqQQ63aSB26ZJNs83Aue85PMahZ2egTU8Cg5zc3EZ9k5Xnv2WV1C7W6RZu9PauWJnxGiQUo2+Zdp3QjDCcgM5j0xoNDiWeUVwr81u5H0I2T4Tw556gLYB04uv9tnKSF+bpq5jV1iHwvTjjdgLgX05u0fSG1TnXQX2FdsCPBFieUQsIPM4jrY2D5Q0ju5dHZRLLIC3QrFvO+Y2b8kCor8Nd8OPJZ91VlXOMTwFqIjYOrgqItwzqGXExysiJTXvNi8EwkK2Hs2WxVTu4ZdL4VaddLc87C1wqSGDIbGYw3qvTr+ULV5Lup+mvFkmWm1w7IXAQkR/uakPHsoA54BRZYliZvmYgeKntHDj4rD1dlVx9IPbnlEYumxJtHlOpZ1g+MxHzyKsgVWsh4IAWLDoOBnlFYDi3Ser1hurr+uRSxT6HRgGJSOcNer0UG2dksclt80fDUFDyAXfVFWMr8fLQXGf75rgWiECk7saHIIpP5YSAZkMz73G6akerWi9/IWACfnkn0DXZdsC5dtbEU+B8YtDtTM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(366004)(376002)(346002)(31696002)(38100700002)(54906003)(316002)(6916009)(5660300002)(8936002)(66946007)(2906002)(66476007)(4326008)(66556008)(8676002)(186003)(2616005)(83380400001)(41300700001)(6486002)(478600001)(6666004)(6506007)(53546011)(26005)(6512007)(36756003)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWkwbm5uc0RpQjZ0TFl4UU9LeWFLMm8zY0IrV05rbmxBazgwMnJ6N25BVHB5?=
 =?utf-8?B?UnpqRlJocmV0MFJaTXN2QXJldkQ4ZXFsUHVUeGVjaGNoM21oSWNTUk9YNWVV?=
 =?utf-8?B?YWhjeHFGS2VoVlVxRTlxSUpXZVdMYlR1bXhLbDVoY0IzWlY4MTU2anZrbkVH?=
 =?utf-8?B?cE5OY2RwRWFFSHIrOU5HOUlWSUtqcWlSQ2pSbDVaR2syZVZ5TStUWUdNaC9t?=
 =?utf-8?B?UXQ3NStEV3Zma0JhdDRxN3NXcnp1WXlUbkNIQzZlZUwrVlJFT25wc1h6SzNZ?=
 =?utf-8?B?SDFGTldnNCtUMG5DTGlpNHBuNGtMZG1XZTdqSjJOT1R5MUd5TGRab2N4MTRV?=
 =?utf-8?B?aHlFcVBQTUxJS05DQ25zTXVzVU0ycUw5WG9RUExMeE5MSDFYS0VlQlVYVEpx?=
 =?utf-8?B?Qk9Lb0UrUTkxdnNvUmgxNlNqRVdsL3N0dk55eVIreWxoaHlYYWZ2S1ljRnRq?=
 =?utf-8?B?dVp1K3Y2NTdOc2ZaWFFsbE5QSDgwdUdvc2Z3dElvZURweFhZcUcwU0QxRDhT?=
 =?utf-8?B?WUt3VU16LzNtQklZVHowb2p3Si9SSkxRRjNKejFqWDdYUTRaM3A5alEyL3Bw?=
 =?utf-8?B?UytGUHpHNEloWlh5Uk9TM2pKQjJTOU1DRjMxc2dRTWtvQzBSMVhQTXpkUlZs?=
 =?utf-8?B?YllYSFVzVW5rejd1NVhkZ3ZOV0xqZjdJd2dveSswTXFhNHdkL1dBK2JDamZ5?=
 =?utf-8?B?WXhKL28ybUdZdXdYQUV4bTRSVW4vSGZVdTQzSUFqck03QmhiWEJsdlQ1eDc0?=
 =?utf-8?B?NEh4RkVhd3F1WkwyOWtyRkYyazV0S3FUOFdyYlVuK0V0cVBURm02Y0Z6Rlls?=
 =?utf-8?B?dEs2Y1ZsUWpla284VlF1NllUSnFvZDVwSFpDT3B0Z3REWWV2Rm80MSttdXhs?=
 =?utf-8?B?cVdhVzd6aHU1VDRFZWEzUk9zMTlGR1NwaU8vTXZDd3kvN3JUbTduSURhUkVW?=
 =?utf-8?B?NnJCV1RsT2JpeGhrWndTNzh2U3ZZZGc2cW9LbFhUanB0Tkc2a1VFdmNMUmRl?=
 =?utf-8?B?aHpZSm1MOWJzVmMraWR2b3Jxb2t3a1lNNGJTNDU3R2xRWnNaS1NlS1JmYUN5?=
 =?utf-8?B?RXV0NXlOSlI3YUFzaDA1L0t2QTJncjluN2dmR1dIWjlxSS8yeHVVdkdPbWlY?=
 =?utf-8?B?UU1VZStjRzZrUDNzMDZnSDJuKyt2VGkyQWc0TnJkeDV6ZXRhcEwzMnlONkty?=
 =?utf-8?B?Q2xGQmVGeUJRZ2Q3OUtQU082SlhUeHhhcHdGc3FEMFFrV3FiZitGMlNzVkZI?=
 =?utf-8?B?Y2VVaGMxZ2JRLy9VdldzL0VMN3I5TGpUNVE4SEZRTFRzZHBCRkZzdW41amgx?=
 =?utf-8?B?ZjJjNlR2ak01bVQya25xREowMi84UFBkM1RPenpSVTJqOUxCSWJFa3JmeWpB?=
 =?utf-8?B?bzFLN0dNVWw4RzB4VFRxRWUwZS9jQnlSK09vYmFNVzNjaWtRSFc3WTNhR1VK?=
 =?utf-8?B?K1l2UjkwZ09taForcmN2SzJRQkpmdDVZRzJMbVZDcVdwejlZNnZGclBZNlRV?=
 =?utf-8?B?dzRNV2ZuUkE0SjVDR0FJVmVFVkFzcCtXSnIzM0xHZmVUMk9Nd0trUDUzTlBx?=
 =?utf-8?B?MlJMSTMzY0Jxamw3MExPQXZNQ2FRNmVydnVaLzZGa2ZLOVh1aFc1bGN2ck5V?=
 =?utf-8?B?UzEzL0ROR0dZRCtVZGU0dU5KdGo3UXBpZ096SXNtdURrbloySHFvc1hVNUZF?=
 =?utf-8?B?Z1Z0VFNNNUduWUFBTVNtaHk5VkdRY2VxN2pJZGxHSnVJend5MmlETWtiR3ln?=
 =?utf-8?B?aUYybHI3bVpTZWdEMTZDZ3FSVVllUVROZEU5NEFPSGhCUEZBYWVhY3hUN2JN?=
 =?utf-8?B?aFdEWWVXdUZFc1JsSFZWYWlwWEkrdDdFM3dya0YzTmRhTE1PMENJWDROeXZZ?=
 =?utf-8?B?dWlCb05jalNXVmthaUxNYThtQ3ZvdFByRWYwUmI3eHZjK3Bjb2ZZM1VkSzVu?=
 =?utf-8?B?UWcrYTJYS1p5b2pBOXpWN0FSVmQwWkk3S3BMWmF4TU85RURtSDlYckhrNXVQ?=
 =?utf-8?B?R2JueVhCZlVHaGNGck1paVo4di92SlNMa1NJMHh4Y05RU0tLZVpmWDZ3aE1m?=
 =?utf-8?B?bDZXbWZLNWVsMkNBZG9jVldlRGU5T0FzVzRqZ2hkVEZ6WGkzRUVpS1pSWDlD?=
 =?utf-8?Q?N2BCcqqLSSK+pnPCnBFmM4ZDw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcf4497-08c8-4d6d-c729-08da9179d22e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 09:09:23.1103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Qw2ziyt7Jj3pAsEuoahAgdhP07hVEfaJEhNrjW0W5GHW/Ne+gbeTSJDvIDWH1Zda4HZilvUPqIYOGBSc2s0/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3918

On 02.09.2022 05:31, Wei Chen wrote:
> --- /dev/null
> +++ b/xen/common/numa.c
> @@ -0,0 +1,442 @@
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

These last two want to use nodeid_t instead of uint8_t. Originally
the latter used typeof(*memnodemap) for (I think - iirc it was me who
made it that way) this reason: That way correcting memnodemap's type
would have propagated without the need for further adjustments.

> +nodeid_t __read_mostly cpu_to_node[NR_CPUS] = {
> +    [0 ... NR_CPUS-1] = NUMA_NO_NODE
> +};
> +
> +cpumask_t __read_mostly node_to_cpumask[MAX_NUMNODES];
> +
> +nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
> +
> +bool __read_mostly numa_off;

The v3 review discussing this possibly becoming __ro_after_init didn't
really finish (you didn't reply to my latest request there), but you
also didn't change the attribute. Please clarify.

> +static int __init populate_memnodemap(const struct node *nodes,
> +                                      unsigned int numnodes, unsigned int shift,
> +                                      nodeid_t *nodeids)

Can't this be pointer-to-const, and then also in the caller?

> +static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
> +                                                  nodeid_t numnodes)
> +{
> +    unsigned int i;
> +    nodeid_t nodes_used = 0;

This once again is a variable which doesn't really hold a node ID (but
instead is a counter), and hence would better be unsigned int (see
./CODING_STYLE).

> +    unsigned long spdx, epdx;
> +    unsigned long bitfield = 0, memtop = 0;
> +
> +    for ( i = 0; i < numnodes; i++ )
> +    {
> +        spdx = paddr_to_pdx(nodes[i].start);
> +        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
> +        if ( spdx >= epdx )
> +            continue;
> +        bitfield |= spdx;
> +        nodes_used++;
> +        if ( epdx > memtop )
> +            memtop = epdx;
> +    }
> +    if ( nodes_used <= 1 )
> +        i = BITS_PER_LONG - 1;
> +    else
> +        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);

Please add the missing blanks around * .

> +    memnodemapsize = (memtop >> i) + 1;
> +    return i;

Please add the missing blank line before the (main) return statement
of the function.

> +int __init compute_hash_shift(const struct node *nodes,
> +                              nodeid_t numnodes, nodeid_t *nodeids)

While I agree that nodeid_t can hold all necessary values, I still
don't think a cound should be expressed by nodeid_t. As above - see
./CODING_STYLE.

> +{
> +    unsigned int shift;
> +
> +    shift = extract_lsb_from_nodes(nodes, numnodes);
> +    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
> +        memnodemap = _memnodemap;
> +    else if ( allocate_cachealigned_memnodemap() )
> +        return -1;
> +    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);

This wants to be %u now. I'd also like to ask to drop the full stop
at this occasion.

> +    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
> +    {
> +        printk(KERN_INFO "Your memory is not aligned you need to "
> +               "rebuild your hypervisor with a bigger NODEMAPSIZE "
> +               "shift=%d\n", shift);

Again %u please.

> +/* initialize NODE_DATA given nodeid and start/end */
> +void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)

Please capitalize the first letter of the comment (see ./CODING_STYLE).

> +void __init numa_init_array(void)
> +{
> +    unsigned int i;
> +    nodeid_t rr;
> +
> +    /*
> +     * There are unfortunately some poorly designed mainboards around
> +     * that only connect memory to a single CPU. This breaks the 1:1 cpu->node
> +     * mapping. To avoid this fill in the mapping for all possible
> +     * CPUs, as the number of CPUs is not known yet.
> +     * We round robin the existing nodes.
> +     */

Along with the style correction re-flowing of the text would have been
nice, such the lines aren't wrapped seemingly randomly without utilizing
permitted line length.

> +void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
> +{
> +    unsigned int i;
> +    paddr_t start = pfn_to_paddr(start_pfn);
> +    paddr_t end = pfn_to_paddr(end_pfn);
> +
> +#ifdef CONFIG_NUMA_EMU
> +    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
> +        return;
> +#endif
> +
> +#ifdef CONFIG_NUMA
> +    if ( !numa_off && !numa_scan_nodes(start, end) )
> +        return;
> +#endif
> +
> +    printk(KERN_INFO "%s\n",
> +           numa_off ? "NUMA turned off" : "No NUMA configuration found");
> +
> +    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
> +           start, end);
> +    /* setup dummy node covering all memory */

Please again capitalize the first character of the comment.

> +static void cf_check dump_numa(unsigned char key)
> +{
> +    s_time_t now = NOW();
> +    unsigned int i, j, n;
> +    struct domain *d;
> +    struct page_info *page;

Along with the various other style corrections perhaps add const here?

> +    unsigned int page_num_node[MAX_NUMNODES];
> +    const struct vnuma_info *vnuma;
> +
> +    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
> +           now);
> +
> +    for_each_online_node ( i )
> +    {
> +        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
> +
> +        printk("NODE%u start->%lu size->%lu free->%lu\n",
> +               i, node_start_pfn(i), node_spanned_pages(i),
> +               avail_node_heap_pages(i));
> +        /* sanity check phys_to_nid() */

First char of comment again.

Jan

