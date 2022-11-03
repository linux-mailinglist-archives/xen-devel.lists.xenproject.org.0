Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7C3617F70
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 15:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436617.690713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqbAD-0002OU-Th; Thu, 03 Nov 2022 14:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436617.690713; Thu, 03 Nov 2022 14:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqbAD-0002MN-QQ; Thu, 03 Nov 2022 14:25:49 +0000
Received: by outflank-mailman (input) for mailman id 436617;
 Thu, 03 Nov 2022 14:25:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XZPm=3D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqbAC-0002MH-Az
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 14:25:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80082.outbound.protection.outlook.com [40.107.8.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68610276-5b83-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 15:25:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7488.eurprd04.prod.outlook.com (2603:10a6:800:1b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 14:25:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 14:25:45 +0000
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
X-Inumbo-ID: 68610276-5b83-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PV4gjTcQVIXgzPmFi5qenhpfJZMvk3iKPY61Ozm9fov+HZWqvv0BCkzXYRkF7OaEd2IbkJ5w04ASpSC2pZN4SpTVk3VOQHZR/0TX0V0CkxO0vpgVmRE8MHkVnN0X7GmEGGUtGsgEIhZbgHpR/9yvxuqEQjAtiIcT1hJXvnHEPElob/UIkJBcG71H+oJL8TdrdaydU/SqAIMBGy79IdgmxdNJz9LtwKQI2h7zVSo00hMoXRrnngarPJahSLuNiBw0LTfiVhO6eYwlByZVwPCKfGBnnalvCX0Wu3NGpTkmcjCmVZlpU+O4EP9HcK7UF33e2gvosVlcwnTLu9TmCxqRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpqAWvObSakRB8G6+YRWLr7Ct3e/WECL3xkc6vwkUfk=;
 b=Dn6ngWtC1iwZAVSKNpiGKqc+ldNMOR2ygvkrXzNb3A4xAHpVno71uoXfUiSL8OuxHXfYe/vCx7nePaa1+iV/DWh1N5WwE0DKnnOzHstbfRO+pwz55KBpcqsrJT6t5wS3JNhNssp/BXWkPTXcg3h3bWV7owTg9AFfVG9M6G7ufeGe8BVK+PZYrmZxkGD92qB6x28KgqH3GI0tfEa69BV2JRgZG2i5R6M01cM9L2KvlZN9EQB8J5H0bDdwSbZTtbPrLDrIKAsRq/hBGTUaMAq90j/GUlgmPd2vS4xoLzIbDi7I9M/9wcmhuKlMMVBV++nIwo8gO8hvrkoQtgWmmglaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpqAWvObSakRB8G6+YRWLr7Ct3e/WECL3xkc6vwkUfk=;
 b=AmEMa+jZs4fPuYp53KPEvPBYmA1H+r/e5YCCUbVzRuD7NUEOUPVwR/u/UYmmNsbgXmte7z5ZkXpdcnBtBkHz178s0IcWYULkZY2e4qbnS63x+0t7saqwRyc3XmY65FEuke16qUoGIriT+Pq6dVAgjYrqoJixoL2kVQjPIH2KNFnyOtYiDp8H7NfaYnIJtbzc1ingf2fsVmJ1XEtNoDEgvPQ2X32XRhrzRdKMGr3PhueeopBgv0Hsk70RudLIzuP1td5Lqb2cYCxoAFswXVpz1RYUYs82wo20BXYPOgeVbDxUVjLAELi6OdgC9P4WEPrltueml0snbQwwGu0NslBP/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <78036eeb-2585-97e5-9f80-bb84f297cc08@suse.com>
Date: Thu, 3 Nov 2022 15:25:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v7 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20221020061445.288839-1-wei.chen@arm.com>
 <20221020061445.288839-3-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221020061445.288839-3-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 10033d96-0371-433a-5441-08dabda74bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1mtHkAyWMW8rwktGlE2vine26LlSUV+D36QJSRPltp0hNuCGBcwElq25ujs+Z9f06yWLLuabdFlykdIrfRtQD4CThWRKYftmPtl99dS9+3FpeSPlAUJb+dkrWser4fvQoVsF2Ty99Orw/nuIRkVCok7O726K57eJc9MYeFYv2MZovm4AaRByD3ns7XqEG4dnA/ZqQkjvySsbff3R2mrqx1SR8GGO6c7jFWvqwLN+j5+MX8rmiI+OsQQJOXEXYYPdYEGky0iWNyLADKPS4CDGVSqUdIt1fcIVXy7+pwjRpnVDA8f+tG0VE+rHkCP9FCLE2Kx73eirP5TAIBi0tTlryRBYyh7u4oIGwc2Chzdpvm1LCkQJ56auUFqOFtzGtgXWeyAQBNGrF4b33DErTEXSKQ6fVSmy0yMDvVdihpXrxlXrmWhLn+YQOdD/fuxoOh09/N+hd4QbayyRbj/edFNTWEFQrpi+7GaAzmIxhiBYoKsL7QTsuWWhH6mI2PiOkDZYYT60bqK0tTd9zeCpENFpr8RGRKrA3RS2s0GRj4BR81VV7vDKE3Pjy4O92a7kW6LKqohfQ25lyEVIR1i2OSYIlP94JxCDFkPNcswq65O9dltrefg7KLMy32o3H9Pw/TRSl1JwNYGx6jtMKeokz8DaWn1AsTAm6FAtMgdZ8eExoO3R8tAnPvDcQxmR/r7bLCdiTS6ryt9r34DhawvdTvG5QMOAZPQV5pHfHJN6ul/b8gClPOqtxobs35S3l14jwGytgRleX5d7vsKObN6u0YqJ70acXDGTFxCq7jKTCXM3f6Rt8LB1j0KqmjNyyAdJV320t5cs5BSmQ/b76GX2V1eaxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199015)(316002)(54906003)(2616005)(53546011)(6916009)(26005)(6512007)(8676002)(6486002)(478600001)(66946007)(36756003)(8936002)(41300700001)(5660300002)(4326008)(66556008)(6506007)(66476007)(2906002)(31686004)(38100700002)(86362001)(31696002)(83380400001)(186003)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWRzL2FoVjZsL0xDZVk4UHc4ZmttL1JzZjU4TTJNQktmSUZwMXNjM3dtUWlO?=
 =?utf-8?B?aUhRSlJVc2d0dmJ5VTVsY05nZ0xrWEkxeHo3Uko3bWdhelZNSEx1dnFrL2JG?=
 =?utf-8?B?cHEyamJJSlJlTDBBNEZTZ0dlOENPT0o4ZDNNSjRuQmpkQTdtak9ZaVg5SlFa?=
 =?utf-8?B?WFhadlFnU1pwWXpXbTNkUkZUbzJ0bjc0NGlaL3FmRG1JRW9GckFvTmZnL3hk?=
 =?utf-8?B?RlpvK3Z3RjlHZjdmMU5EQnFqV3lQZ0tMUDg1V2NIK0dpdEVYRS9VRjBPWlhm?=
 =?utf-8?B?djNTclBXd0hlT01yS2FTbGFxSk1LSXdNL1lwYWlBTDRKLy9yK1ZDM0NxZW5v?=
 =?utf-8?B?WTN0Mi9yRHdrL24yUFV0MlM1Q2F6MkZQbjU2ZUYreU9FR2xpaVFTVXV5WDZp?=
 =?utf-8?B?dnV3UkNMcjlLNVVBdm9RQWlnRlBremtVYXNUbEVvQ2hrN0diQWZ2K0ZCeTMw?=
 =?utf-8?B?MjRNOEtQVlpNUTRtUGgxcWs3VGdGNGVpcTZhMlhYbHBlUSsvaWhOUisxZDk3?=
 =?utf-8?B?U0JqNFpxK0JTQXZ2QjQ5N0IyUTZCSHFlaTZ0cldibUE5Z1U1RFZ1cE5sTFoy?=
 =?utf-8?B?SnQrTHQ5N2ZxQ2NmL3V0WVVDY2ZkcTBiRXhNcmMzYnIzbVZQc3NWb09PdG00?=
 =?utf-8?B?UTlQQmVjSHZ3QTEyN0s4Y3pnNE1QRXZHWTZNa25aVDB6bE1tTXpHY2grQWQw?=
 =?utf-8?B?ZXpzbG9nY1FHU1ZaUisyZkE2M1ZsOUxYcTcva2R0UzhaMUh0MHVLekhicSs0?=
 =?utf-8?B?b3NJR1dOb0liOTFRcGhYQzZ1TkVsNk43ZEh3TnJSMy9qWGgrMGNnVzgzU3lS?=
 =?utf-8?B?ZDRDV01uWktMM2JPZFJMRnNyRllOdHpwTENNbE1TMzBrVVJvV0dkUkZCdXRq?=
 =?utf-8?B?L2pxUFJVQmI4VXkzN1VZeC9oemFrRDMwbStQdTVhUUk0RVU1VWF0aFhiWVVz?=
 =?utf-8?B?ZW0yRjNzUVNFbFBlM2I0UHdBZUswc3lVZ25YYy9HYW9BK09uVEl5RUdyeWRW?=
 =?utf-8?B?QlQ2UnBQc014ckVLN21ld3E1aUdBUWk3b04wL0tOeVFhejBHMFJUejkzaXNN?=
 =?utf-8?B?VUtucDR1VVhnQ2lveHA5NG1Ub0ZianNFc2xoV3dqS1JsVk1sdjZLamtDL3FZ?=
 =?utf-8?B?TTYwRDBLQnRIekN6OWlyc1RQYnRDVytSUm1oOFZ3YW9yWjZsZkNtQzMxOTRh?=
 =?utf-8?B?Zk1wcGRwbTRzc0VHVHNnbUtXY3paMEQvMEEzMEFROXFKZ2NqUmNXUWdlRTZH?=
 =?utf-8?B?dDlBWTBrbGg4czUrbzBkRmo5enJLcWRIaS9ROG8ybjR4NFpzS045Zm9hWFB2?=
 =?utf-8?B?dHhsUDJ6djR3K2dINDR5cEcwT2QzaW1ZQVlYNk9DZjVxa2I3OGtsRHNsbSs5?=
 =?utf-8?B?VkhzN3Q4dTA4bGgwTjNiN0tiQmFBbmdlVTFpREYvNU1IY25ndXAva05CM3VN?=
 =?utf-8?B?alVhc2NhYTBkbVJFQ1ROK1hqak1YRmVRcVRNMG01Z3ZkNWZJelVSTzl0Qkw2?=
 =?utf-8?B?RXdaUHhyZWZSZXNTS2tFQ3J4eXpWUmNoRitwNkZNNlF5d2Z1T2tVcFF6SHhl?=
 =?utf-8?B?ek50M2MwODg2YWNqVFc0SWladWlVQlE0WkxqU0JUcEZQaDJETTZPUW5hVFNN?=
 =?utf-8?B?SFlwcUZRQXJYZ1hGNENPVFcvQm95TWJGaEJ2a1UrUGZmUENJdlBsbnFkemNN?=
 =?utf-8?B?RGFiN3lKNW1wczkzRHdxbGVvMFg3V0ZoV2J1djhLcFdGS0dXUmlJWEZiWFho?=
 =?utf-8?B?NkNTcHVuNXlUOXlYZlVKV1FCN2pYakp2ZlI5aGQ4S0tURSt3MnV6U29LVGJI?=
 =?utf-8?B?cTA3eEJhWHdSbWFLSzJkRHZsMC9hblJxS0FHTmZVMDBLUzI1RVNWcHUrTVRD?=
 =?utf-8?B?RlhpNTBhbU5EMUt4TkQvdklENlY2Mm0zeDI0dkJvRVYvQitXRWpobCtBeU9S?=
 =?utf-8?B?Q2s3MzdpaTZlSmNNNEVRdXo1U0V5UXRRWXkvZm5TWkVPV01kdkhNT3QvQ1NK?=
 =?utf-8?B?MkIyN1J2akdhRzh5NHBEQWM3dlpvMzlrWUZhKzNhdlhqZVZwZjZlaGtsaC9F?=
 =?utf-8?B?eGVvcTdXajQyV2R6UklHREM5bEQwbzNNM2lDaWtwcVNPYWF0UGZLejA3dEo3?=
 =?utf-8?Q?0doXfIvjS6N1C/0VKjVi2V8LW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10033d96-0371-433a-5441-08dabda74bb4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 14:25:45.4893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gp65aVLYQ0LeqwZ1ivC0Kmx9B/yyZMWpe1IIz8NyNM3pyF9trESZjM7xY5uVVX56mk2sOymwA6C4LXgNe3XIyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7488

On 20.10.2022 08:14, Wei Chen wrote:
> There are some codes in x86/numa.c can be shared by common
> architectures to implememnt NUMA support. Just like some
> variables and functions to check and store NUMA memory map.
> And some variables and functions to do NUMA initialization.
> 
> In this patch, we move them to common/numa.c and xen/numa.h
> and use the CONFIG_NUMA to gate them for non-NUMA supported
> architectures. As the target header file is Xen-style, so
> we trim some spaces and replace tabs for the codes that has
> been moved to xen/numa.h at the same time.
> 
> As acpi_scan_nodes has been used in a common function, it
> doesn't make sense to use acpi_xxx in common code, so we
> rename it to numa_process_nodes in this patch too. After that
> if we still use CONFIG_ACPI_NUMA in to gate numa_process_nodes
> in numa_initmem_init, that doesn't make sense. As CONFIG_NUMA
> will be selected by CONFIG_ACPI_NUMA for x86. So, we replace
> CONFIG_ACPI_NUMA by CONFIG_NUMA to gate numa_process_nodes.
> 
> As arch_numa_disabled has been implememnted for ACPI NUMA,
> we can rename srat_disabled to numa_disabled and move it
> to common code as well.
> 
> The macro node_to_first_cpu(node) hasn't been used anywhere,
> so we drop it in this patch too.
> 
> Because some architectures allow to use all 64 physical address
> bits, but some architectures are not (like Arm64 allows 52, 48
> bits). In this case, we use min(PADDR_BITS, BITS_PER_LONG - 1)
> to calculate the shift when only one node is in the system in
> this patch too.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one small further request (could be taken care of also while
committing if no other need for a v8 arises):

> --- /dev/null
> +++ b/xen/common/numa.c
> @@ -0,0 +1,464 @@
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
> +nodeid_t *__ro_after_init memnodemap;
> +static typeof(*memnodemap) __ro_after_init _memnodemap[64];
> +
> +nodeid_t __read_mostly cpu_to_node[NR_CPUS] = {
> +    [0 ... NR_CPUS-1] = NUMA_NO_NODE
> +};
> +
> +cpumask_t __read_mostly node_to_cpumask[MAX_NUMNODES];
> +
> +nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
> +
> +bool __ro_after_init numa_off;
> +
> +bool numa_disabled(void)
> +{
> +    return numa_off || arch_numa_disabled();
> +}
> +
> +/*
> + * Given a shift value, try to populate memnodemap[]
> + * Returns :
> + * 1 if OK
> + * 0 if memnodmap[] too small (of shift too small)

May I ask that you correct this comment line: "of" (alone) makes no sense
here. Either "or" was meant or it would want to be "because of". Unless
this is a language tweak I'm entirely unaware of ...

Jan

