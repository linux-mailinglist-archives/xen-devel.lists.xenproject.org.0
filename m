Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A663664679
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 17:47:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474846.736237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHmX-0006f1-Tc; Tue, 10 Jan 2023 16:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474846.736237; Tue, 10 Jan 2023 16:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHmX-0006bl-QU; Tue, 10 Jan 2023 16:47:25 +0000
Received: by outflank-mailman (input) for mailman id 474846;
 Tue, 10 Jan 2023 16:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFHmW-0006bf-MU
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 16:47:24 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2050.outbound.protection.outlook.com [40.107.103.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 749b1ae6-9106-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 17:47:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7943.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 16:47:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 16:47:21 +0000
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
X-Inumbo-ID: 749b1ae6-9106-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgThEWgjoFPllKuoXUB1P1KHjjj0b9pVgwjReThtvIWZx8vsEnf9tdYlz9LnOigd/hNAIhvZzhPHQrNzkTCSwe1Wpa4Ee9UPt2jvno2yHEquCfpfzBVKqHAtAj/nb7j7mhF2/GhinQz4MTBGEi0bxVTHRWfpktut1zA5EvBzbwkgPMroLcjd4lHzGUj3UKm85pEjJ1pIEpxNz9eCirvoMCjv3b8MykqwhEpWSHbdxfmJQSl1tEb3AOUKTTv0ciTLMIAAMOeeEhB3aFhvp2Uq5b731me2tjRVFlUNc3S+XUnJLrF0I8YXgVCjZYuCG5WCvWzO2tb2b7mMnmdo57QE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyrbLmWIaFQ9duchQ4U5/ihs6OxxaDIeV8/qU/RNEsk=;
 b=C1cD70m2M1ko8SvcXJbMcMk4kKd+PmT0QYpxaJUW38enVmnaZnjZkjitgP0u1Vl7hXL4jVq/FR92vHKCwGcZQ8wi7JclYSB2bp3bNNZduZKV943Q4P0wtqV4Jfhxm7wNhUsLWMoRVumNuo8aajxJ4xjGeG5sCLgwT6Q1pDOt2qkDOiL7OtPdAX3H9GABw489VzyHsG01kisJclae99+IzmwkPlaV0mYdwGmPfUQT5hENP2K6cBvOk8oklu+JG3hQPs3WQNsR03AeTjtrID5z6X+LrvzjnqSmg04fXfo3aym7cyGm1UDFGvkuZyHL8Cv8IiojWq42pE6gsYkPKfXdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyrbLmWIaFQ9duchQ4U5/ihs6OxxaDIeV8/qU/RNEsk=;
 b=aZF0qGX64WdzkT5Q6iOo9vr+Y616ICmiOEgIXju5mXhMaSkAu/+fGGZOXW1dgVBlqiEEqzNU0sA6xUi1YHDoZWFADv7YUZXc18yvrtiXa1pcu325AwsMt3YS6/2RAgeWNRpSCRd84U8ha/2EIElD3YvJ32z3e0Zga/sbe2XL8/AFmBaeTUm93zSJb0eJ1PIT7gUcwOnHI4zANB7FFWuafQ6S551FinNaUyg9trZs9eqzHMo3YY+ddBTTg6ACLyBgPRiFAPgIRZFYNrJflgYGshVnHNpZtsWS9ZeJAz8djLbijG03npWtdu5jAtAGZ5lJHcAyyaLbieX8+Jo6S/yOPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9fd67aa2-0bd5-16a2-1e19-139504c2090f@suse.com>
Date: Tue, 10 Jan 2023 17:47:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 03/17] xen/arm: implement node distance helpers for Arm
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-4-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230110084930.1095203-4-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 7254ad4d-955c-434f-af84-08daf32a575f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/AFOIHNlT6P6HB0V0CmKos66CQ+8j1r5S0044rEu1wj+vmOfYCo4dfRt5ZZk1hfDGcW4QmOPllNYVcvkXloXDaaj2nOEHU1c1SnaOJHLJAQrxYheJsOOTn8Fu00AfM/SjOtlpOOPwVF5b8nMbPHWvjwe6n6fyhxweh9R4DN2cKWwYIqJ05J4hULeJwb/3N33t3oxyUSJB0hHt18QdrmyH16y+GvewqQ0JSZMugZQv0D3qb5dwQanTCSQHtraHb/f7TTS7PITDtd3JCtwVWpWk8dRPePhtCKfPe3EVfO+v1p7IRE3TJsNDzjkltMMHiXq4mwoJGAk9jxCKseTHhAl6nSDLGrpCZee9dn0bFE/vLfXiTYDoILnrUsrwXMYdFokqCSaBWNJhOXVHpNiMZgElmC6fzANuFRIJCJjilbhJ5y+NN8V623VotNppoOJZIjPRfBeZiiKZc8Q5UPOz5UcIpNfa9XBkozSMoKpJOvwUwlmXzEAasVrrhtx00Pca+OslqA6s53AUexP/79MyFfCgsWx3Hw6WW5lBnVdHEGSUqUFklHVLiv12u/RFZIDyHNi46sZtProuW15gfr1O4k61VATxCIF9HlSQAr5FDmrJd/Go1tGZT9sINs0rZBkFj031aK0nblDveZB9w7M7z5aEAFw97GMm2WAnBshSfw1M6KEh25sTk+gBkArT05xku0Oq0FMWVTqWhrXF+o30/N0YKxTyRS9GvSIe1fxbCC1Ago=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199015)(66946007)(31686004)(41300700001)(2906002)(8936002)(36756003)(5660300002)(7416002)(8676002)(6916009)(66476007)(66556008)(6512007)(316002)(54906003)(6666004)(478600001)(6486002)(53546011)(6506007)(186003)(4326008)(26005)(2616005)(31696002)(83380400001)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1pVOGVGTHprMDRwK3NXRWRrbmNmWWtETVlKU3NvQ3JQeUppcnpkWTQ0MVRY?=
 =?utf-8?B?dWZnbHRMSVlCWVhRbUdINlhkRW5TMERXRUlJditRWm5ZWHRMUEFJY05Md05G?=
 =?utf-8?B?aWJCM3NCMUZqY2tua2tLRG9VVU9xWVExWEMwd0ZzUzc5cklpdXVwZm80ajVj?=
 =?utf-8?B?RmUwQ0c1NjYwRjhJZHVuUkxWSnhWVUZtQis4SEVtbVp5TU56ZDhPK2lERnRj?=
 =?utf-8?B?Y3NIOS91TExvTTZsUTN6cGdMQ0FQU0Y2Q1RabDhNbmZIZ05TNjc2TU9ZWCsy?=
 =?utf-8?B?ZUtDTm1nQkxlRzJBOVdMSDc5YU9OVFM2RTZJZm81c24rYitvcmdQVFM4NWk3?=
 =?utf-8?B?RjNZSDVjT1Q4NHpIQVNvWktQcWUrVGNRTk1vblplR2lXV1ZnSG9uTlVaeUtH?=
 =?utf-8?B?RFVVTEFkMHJBeXRkeUp4aVI0TWo1MnJuOW45NnBmcys2ZGVrODlwTWY1MWFC?=
 =?utf-8?B?MFBWTVZNT3BnTGRuZUhPNGxkYlpDTkNyQ3daOGF3WXMzN2UwdVFMYXU5aHhR?=
 =?utf-8?B?bG40blN6ZlJvODFhTXk5V2lkNXdJZGttTjBETWR6M09GeWlvaEVMRi9kNDc5?=
 =?utf-8?B?Rk1VVU5aWnBhZ21sU1NsU2xBTW5SUTVqclJXREcraWM0TzZ2WVdLamJWNSs2?=
 =?utf-8?B?VksrOEExME1rYnJFcWxqYm4vUFB0eXBRWEw0eEhHaFRWYWpaMS9pTUZNN1hI?=
 =?utf-8?B?VHlyV3VNMEI5UGhjTW5CRzBDMWNTQTd5THRFMXRxdVl2Qk1DZ3V0Ni9CaDcr?=
 =?utf-8?B?SE1KNGFaUHpUUXJWYk44cHo1SXJVWDdoSmp0dUxxbkE1OUdUNkx5VzZLcXlR?=
 =?utf-8?B?ZXIxNHVsUmpHUG10OHdrbTlTM3NWa1lraEU1dnBkbDhNT3R1UTlYTmZvNW13?=
 =?utf-8?B?QUJSQVZUS3NEREZ5SHN0cDJTSlltRmNMVUE2TGlDRFN1V0d2d2YzNVZaZHA3?=
 =?utf-8?B?Smt1NDVIWmNYZENObk9rME01SkU5SHR1eWl2cysvcXQvOTNWQThIcmo4VDhO?=
 =?utf-8?B?T2FqQXBWaWRTT3BWVTRLbHk5WE5TQ2FPcVZmcEV4OVpZK1g0VldTT2ljRExw?=
 =?utf-8?B?MEJmQllzOWliRmdlQTNQTjY3K2c0SytIRW16dTJLRU9KbmMzb2Zqd0JMRk9H?=
 =?utf-8?B?MVRneEMyUktsK1JqMDd5Y3A4MjRyWUUwQW1meWtWbFJKT1p2OENWL25scWx6?=
 =?utf-8?B?N0FqYVBGcTNuWmJUMlg2VDhQUGRjdy80MHB0ZHplNElqRlZPamdIWFppcmQ0?=
 =?utf-8?B?Sk1oS1lqd3l1bmMxSitpakdOKzFiQnlRd2VIU2tmKzk3Y1o1UzZiUFY0Y0o0?=
 =?utf-8?B?NUVXQVYzT0xpY2hBc1pIZTRlUnJuZDRLbFdyUzc4ZTdoZ3pQeGZsWVZFN1hY?=
 =?utf-8?B?QjZpVHFCZmVEVW95T01hZlpGSU41bUNsbzI0aGhBT3d5Q1gwVkV3UVZ2cC8x?=
 =?utf-8?B?bTJCbTBSTmhxY2tYNFM2QmhidjRaRG9XbW1GRlhzSUhhSzc3ZTgxVzdqY2k5?=
 =?utf-8?B?R2V5YnBtU1BPeFNKbUg5eWFaaWhFZ2dIbVZPS05oUlhGVCtNSWs3VklTaWxF?=
 =?utf-8?B?ckpocFpzYmFXaEQ0aWNCMWkrbVV2My8vd0JPMUZPUVpNWkwzeFNVanc4ZEQy?=
 =?utf-8?B?djlGc0gwa3ErT0RDaTJrWnlVamNPVkxGdkdBR1FZaHFvUjRPQU5EM1l2WVRZ?=
 =?utf-8?B?TjByWm9vc3NMT0VHNWhhVFlBYzF1dkluMXBYZk9UVWxPdUdXYVVscnJDVHV1?=
 =?utf-8?B?MndJTTltWkdhQnhKQ1djQUJIU0p4emNCaGlsM0l2ekxvNkg2ODRaRGVjQXFW?=
 =?utf-8?B?dXRuelVEd251MklLaDRBcGJ5ckpkRUtvNy9nd3hFMnF2aWJtN0libkxFbTdC?=
 =?utf-8?B?azVCMmRHcE0rV1l5aDhFWXV3cGNRcksrZ3N6aURER0NpaTJhMm9HalhWVFBx?=
 =?utf-8?B?SGorU3d3VFNLN3ZZelFxald2Wmo5RFZSNk9mY0E0a3F6RUZvVUZseTcvZWt5?=
 =?utf-8?B?b2xHd21LWm1BcFNJbzlWZHVoa2NHNVJQTENGeWJQVkMzcW9FWTltcFpNVStJ?=
 =?utf-8?B?ZytnL1NLZzk2S2JEdlI0L0tzaFVCbGgxRURaQnEyNDdaYlB0VklQeU1ra3d6?=
 =?utf-8?Q?efB5c5Rh5vDvcU8TbPNmlMn2d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7254ad4d-955c-434f-af84-08daf32a575f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 16:47:21.2504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzGKUi7VqECw2RRjf1uMbs9GK9b7cz0Enoq16azo7iMX8Ff9WPfc5B3KFR5GY2RM+OxpZWNK974N644bWOHqXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7943

On 10.01.2023 09:49, Wei Chen wrote:
> --- a/xen/arch/arm/include/asm/numa.h
> +++ b/xen/arch/arm/include/asm/numa.h
> @@ -28,6 +28,20 @@ enum dt_numa_status {
>      DT_NUMA_OFF,
>  };
>  
> +/*
> + * In ACPI spec, 0-9 are the reserved values for node distance,
> + * 10 indicates local node distance, 20 indicates remote node
> + * distance. Set node distance map in device tree will follow
> + * the ACPI's definition.
> + */
> +#define NUMA_DISTANCE_UDF_MIN   0
> +#define NUMA_DISTANCE_UDF_MAX   9
> +#define NUMA_LOCAL_DISTANCE     10
> +#define NUMA_REMOTE_DISTANCE    20

In the absence of a caller of numa_set_distance() it is entirely unclear
whether this tying to ACPI used values is actually appropriate.

> --- a/xen/arch/arm/numa.c
> +++ b/xen/arch/arm/numa.c
> @@ -2,7 +2,7 @@
>  /*
>   * Arm Architecture support layer for NUMA.
>   *
> - * Copyright (C) 2021 Arm Ltd
> + * Copyright (C) 2022 Arm Ltd

I don't think it makes sense to change such after the fact. And certainly
not in an unrelated patch.

> @@ -22,6 +22,11 @@
>  
>  static enum dt_numa_status __read_mostly device_tree_numa;
>  
> +static unsigned char __read_mostly
> +node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
> +    { 0 }
> +};

__ro_after_init?

> @@ -42,3 +47,48 @@ int __init arch_numa_setup(const char *opt)
>  {
>      return -EINVAL;
>  }
> +
> +void __init numa_set_distance(nodeid_t from, nodeid_t to,
> +                              unsigned int distance)
> +{
> +    if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
> +    {
> +        printk(KERN_WARNING
> +               "NUMA: invalid nodes: from=%"PRIu8" to=%"PRIu8" MAX=%"PRIu8"\n",
> +               from, to, MAX_NUMNODES);
> +        return;
> +    }
> +
> +    /* NUMA defines 0xff as an unreachable node and 0-9 are undefined */
> +    if ( distance >= NUMA_NO_DISTANCE ||
> +        (distance >= NUMA_DISTANCE_UDF_MIN &&

Nit: Indentation.

> +         distance <= NUMA_DISTANCE_UDF_MAX) ||
> +        (from == to && distance != NUMA_LOCAL_DISTANCE) )
> +    {
> +        printk(KERN_WARNING
> +               "NUMA: invalid distance: from=%"PRIu8" to=%"PRIu8" distance=%"PRIu32"\n",
> +               from, to, distance);
> +        return;
> +    }
> +
> +    node_distance_map[from][to] = distance;
> +}
> +
> +unsigned char __node_distance(nodeid_t from, nodeid_t to)
> +{
> +    /* When NUMA is off, any distance will be treated as remote. */
> +    if ( numa_disabled() )
> +        return NUMA_REMOTE_DISTANCE;
> +
> +    /*
> +     * Check whether the nodes are in the matrix range.
> +     * When any node is out of range, except from and to nodes are the
> +     * same, we treat them as unreachable (return 0xFF)
> +     */
> +    if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )

I guess using ARRAY_SIZE() here would be more future-proof.

Jan

