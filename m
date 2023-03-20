Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2369A6C1C36
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 17:42:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512009.791552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peIZv-00038o-LC; Mon, 20 Mar 2023 16:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512009.791552; Mon, 20 Mar 2023 16:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peIZv-00036E-HW; Mon, 20 Mar 2023 16:41:47 +0000
Received: by outflank-mailman (input) for mailman id 512009;
 Mon, 20 Mar 2023 16:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peIZt-000368-CE
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 16:41:45 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20613.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17544c14-c73e-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 17:41:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7376.eurprd04.prod.outlook.com (2603:10a6:800:1a0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 16:41:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 16:41:33 +0000
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
X-Inumbo-ID: 17544c14-c73e-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYcf0uTQk7o9e6zjYqWKn/GnpZZdA91hJthYWhAEl278X1nRSCpkWWgxejgPJaOQG/bwTV9E5iAgn1pHruvj9Gn4MUPdKx5uRhPyKKVWysKC+Tc4DTBxpxfy+C3YuLyQosUciIJ0aB0GZmXNrhZhmZXk8cM9WPEFBF4y693t5V/cUpwcaXqqJLOXqWK1j9dUTZA5/N24myvpPmUtI58kjZ2s6msAeBONBwljn8ZTKYEBGVtDtYo15uGoRvk9NGjNqKpTzIHGambScCyf/iCA4kms/21R60sgtX+INu6rZJw+zh3VpXqXhzViujZDrFOWECQDOWUQO2vl4ueLsPePPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qziuh1sgoig5+OOG1khj/cI73IBt/HWzQfnBz0IjnmY=;
 b=IJmrKxpZe6i6EMHTh9qIBeGDyhaWUAwc/S53fRPL3QozHgy6hayhybVmz7ZRxAgydt56UjemwEYVgY6u+6HaqDK1x0k+vWXLtr1AbMXVHpP6zxoQTgofb6tpQPeK3QDlz+jdQDmGZfW6UE+5NwC7eaYta+DoZKdKRe0pOILM1GRoZj5cVyRNCCNmME1eOrR20NnKOy5oGFkqDGOG22dO3SUAidrbAkI4t4w8j5DRM2NyAumx/cEss1SPqAhaVHNnG9YFaTi1LPdvzsAeP91BwSE0lsd9vPnPlEKcBueyZWHTeB+6gI4REKB+IEvXvEe6UuisC9zZvfPCw1DQcgu+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qziuh1sgoig5+OOG1khj/cI73IBt/HWzQfnBz0IjnmY=;
 b=LqKGFtyX5bWJM3Un3w+nCWbjUNtEk2g7gul5IM0UJPJUJma5g9V93uERKLyOwg718P2MROyWrjqcVFHO+0LqtI1sz3y9kBlgfn+N9u9VcRNzmveDl0grb/k+J5gp74dDwnPxmcwSf3DMPIBlmGBdsOsIeuAkTxHfPurGJTkc9mL1VQo6w/0pu515tg08iIWBtfn724jnah5q9j3ZSbT8WYd6Qx+CaC5vhMIdaMZMYBu15rqRTqCOV9VTfYN1y26VVzD25QTrL1U3JGwsLkKwGGg3KsUXeVnRHrujGNJPQi8VD1i2+1sFcja/XLBn7VnLZxY/2rSjaa57lJj77jnnEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <27c2d76e-1f9e-01f2-846f-9f3bdddeefcf@suse.com>
Date: Mon, 20 Mar 2023 17:41:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
 <85a21ada5a0fc44bb9db1dcc1f6cf191a6e66bfb.1678984041.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <85a21ada5a0fc44bb9db1dcc1f6cf191a6e66bfb.1678984041.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: cee3d1d8-d5d5-4749-edcf-08db2961f6d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LCrf3bqFTdpiF7rQFg7Ke0hqDvyF794DCwImQS3uRSYaK/y/qx+/tKasbN0NQfwnflXjm7QF7rfVdaNL9mzj+7j7E6L7fNviZuSw/lYNrItfZOXzsDUkX82/Qrt9c5im7fNbYfd512lI93lCn1aLv68kmSNwOwiVgfkG7TrOscq2Bh5gevzEP2qWEvvK1uTTG9/WIOvcIaD/eurCZrgcSMik9clzFoaxYCAeGH+numl4j1yCzcLRgR0L2EoRag8pham6JXrSgXLADTyz9gcGZLZaQMbwRSE2e0M+y3M1mKsF01iTYO2oujz5xgwz1CdC89tZ5U+u8rhYBAx4wwKdmMMAX1kNyAwp2OYpgRCeXiRF/1m2q24Qw86tRjZ+EQRSJGmKkoKbT08CjX8rp7nB3Bf/WIMJCATWkocHuLHZdgItDg8z9vHNv/S9BmnB3pC6HphStLDeigfvWrllwNYnfLBrGiW2xUu3YEVtT7vrd4uquBOHk/ASVVGlEGX1F3pIkAvL76+0AQ6/1w/kBnMGcgGNwXDS6GuwMYRSUBPrO+9DcXTBSdVSOYv2cbJ1Vq9CFF2EiX/g/y2P+vmP9A2zc5F4JH8fAycekSfZ3+VepD8qm1V8D35+7+V4o/iI7c5aCxzNnuR6vWIapp/xoAlClo/08D6Bdzc7wAY/P55p6qEMcMjVKH/arc10TOJVv2h75oYzfCDu15dpOSkmsG8Qw21i9RQ+eFiPh1p89TaY66I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(346002)(396003)(366004)(376002)(136003)(451199018)(8936002)(5660300002)(41300700001)(86362001)(31696002)(36756003)(38100700002)(2906002)(4326008)(6486002)(83380400001)(478600001)(2616005)(186003)(26005)(53546011)(6506007)(6512007)(31686004)(54906003)(66476007)(316002)(8676002)(66946007)(66556008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGZiU0o1QldGTnVQd0lCaDJZRWFpaklQK3orNm9TTVE5ZC94bGozQk1ZMGZX?=
 =?utf-8?B?WGxDTW9GZWdwNDZSeDExNnZ4V3UzbmJUNUp3V3BRbkw0M2YvQU02V2lpTHVR?=
 =?utf-8?B?SzZtcWhPVll1TjhaK1J0NWVZNEdaUkNkWnk0bURSdUlhL01NUFN5ajI3K28r?=
 =?utf-8?B?WXdqd1dOeUk1NVJtN1Q2VzJjMG5qLzAvR1lkWXVTbk5qVzNkN2hHR2szdkJu?=
 =?utf-8?B?WnYyVy85RWIvdSsvbzVFWG1PNnczekJ1UVNHUi93RFRmL3RXMVZrQjN2WDJw?=
 =?utf-8?B?bnFxZE5zWUZSQ1prZGNhSU1JaHJkSk80aVdQeEpJTk1pc2lPbktxaGRHaVc3?=
 =?utf-8?B?K0tmdkg0L2t1TWpsQ3RoMTlYNG9Rb0hKMUZZVEtzQVFuZjBadWdBU0RsSGln?=
 =?utf-8?B?bVVINHZDY1hLODUvTGFkNDhHa1dRMTlrRjdMcWgvZ1BaUlhEQmxnc0kyQlBV?=
 =?utf-8?B?RHFXY1AvZWFKZzJON1VhSENKdXkxc2VNR21kMlRoMXowQ0ZLeW9wU25ORUFn?=
 =?utf-8?B?VVpmMjRab2JQUXFwck5DYVBFWjJLR0xmOUtnRllZVGRFeEl0TmJ5L2F4NlBI?=
 =?utf-8?B?ZFVQY1VFU25RVzdIUWlvdzkvaHZad3l6dWNETWpabDB3SnNuNlpQY2hCNWJH?=
 =?utf-8?B?MS91bmRDSmZ5TmpmSTA3YWlwNEg3UnBNVFQzU1RodC9NSGJEVkxyYVV6SzNY?=
 =?utf-8?B?S2FBa3ZwYVZUZTEwSS8vSzVRY1dtMjFnOERPc1Bhc3F0ci81eFJNUWhPVnh2?=
 =?utf-8?B?VmNMMlJnR3RScEFPWDIzRVJBUmlmMGRwVmRUS254aXdnRUhES2dIQ2VHaG4x?=
 =?utf-8?B?UWEzV2R5R3pwYUR2bnZWUFVZYklZK3RNZ1pOc3VKZnpoVlkySUp4VXkzNXFE?=
 =?utf-8?B?NVlTRFphSEduMFh2bVpJMHVGN0JtTkVoUmlyVGRReGI3dG1xbmFHcVFycHJC?=
 =?utf-8?B?dGpGNXdvRHJtc3pmNmNUOGRtOVBBcDlhK1ltRDY0UzBNMkU5bHgyQzUvbGRu?=
 =?utf-8?B?UHloTTZkNy8rbkNOM3ZEYU9xbmlPbEZpSjE2Rnh3a3g4RGE5SnkyRjM1MGty?=
 =?utf-8?B?RGR0YkxrQjNVeUdGM3c3UGUvUkQzN1Rnb2VBZEZIQm1XWmVTNHVkS3MrRjhM?=
 =?utf-8?B?L015b1l0anlDSjQ5KzRqd2M3L1haODVrVGpTekF4VnVFY2R0UklGRnp0TFQr?=
 =?utf-8?B?SUFFUW5ENVc1RlEvcGRHdDRadUZTUmd1YW1iTFcwTncyYzJGSEIrK1VUMjR3?=
 =?utf-8?B?eGpSYkhZckVra2VhZlJzVmljWGpWYjlsQm5Jb20rcWcvRmtzdjA2Nm5sZFZm?=
 =?utf-8?B?aDUvZTdLZWtHTThaQjk5QkF6ZjVmYWJmaHNoaDcxVXFOa0o2c3p2czlZVlhP?=
 =?utf-8?B?QlJOOGhZc3dsK0haZm44RENwQTg5VVRWQnZIbXFOWmp0UkwvYUFVUHVQaFBn?=
 =?utf-8?B?eXVoU3Y4b0ZVbmRPcE0rQkxyWUdCQ21ZNzB4WndXcWRrSjl0MzJXUC91U3FM?=
 =?utf-8?B?NjhTMVRhY0tpdDAvdjVhcStXSzZWdEExTFcwcWVYZWtBZGxlSmJkalBmOU1n?=
 =?utf-8?B?ZWNldXJGWHVlc1NLQ2VXNVpGTVg2QkZSV3V4R1lHSjY4OE41d0VCY0YvS2xV?=
 =?utf-8?B?U2F6Mk5hWVdLMDE2QjljQ1BHeXNXTHFRSVdib1BPaTJGKzFaWGVRblcybVdq?=
 =?utf-8?B?M3FJMWdjVEtYaTZ4YXFvay9JNk03cDJYeUFnNG1KdWdEd3ZCRHZwQTlaUCtF?=
 =?utf-8?B?T0doc01uMHVqeG0rN0xraWQwbmxKU25nSTFDTHpnbHVKK0QrYWo3WWJ2QUpV?=
 =?utf-8?B?ajMwbG1aT2pQWWZ5WkFIZ1FISWF5VXEwN2FqT2RZYnZsUEVTa2xSUXBtV2xW?=
 =?utf-8?B?RjlVcEl4VmxQdVJQY2NnZmdxblJKK0R2WlBTUzArb0ZTQy9YSmpYOHVBRlBP?=
 =?utf-8?B?MFNRN3ZKVkRxdjBhb242M1VQWkh4M3ZhODdqSGdwSEZ0emVDcnBZV2tya3po?=
 =?utf-8?B?UFRONTBqQXBHTkNFNTNiancvRHFUSXdTYTFHVmVkTko4cTR0aFVKbjkxR3dD?=
 =?utf-8?B?Y0dUdVQ4ZWdJUVQ0MUJJbkVlRjQvMFpwMkFhQ3dLMXBvaVkwNllHd2gycDlC?=
 =?utf-8?Q?XPFKqbPPg/x+2wHjvpJYb1Dmk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cee3d1d8-d5d5-4749-edcf-08db2961f6d7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 16:41:33.4376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kj/bHTvzt7QzEQCCUVB4z7cr2qnmqoujy31kqe7x0sVdTuBYKG/3op/Q4ZkSANKl5iSAA4229ZBJmJSq94Kjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7376

On 16.03.2023 17:43, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -0,0 +1,8 @@
> +#ifndef _ASM_RISCV_MM_H
> +#define _ASM_RISCV_MM_H
> +
> +void setup_initial_pagetables(void);
> +
> +extern void enable_mmu(void);

Nit: At least within a single header you probably want to be consistent
about the use of "extern". Personally I think it would better be omitted
from function declarations.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -0,0 +1,67 @@
> +#ifndef _ASM_RISCV_PAGE_H
> +#define _ASM_RISCV_PAGE_H
> +
> +#include <xen/const.h>
> +#include <xen/types.h>
> +
> +#define PAGE_ENTRIES                (1 << PAGETABLE_ORDER)
> +#define VPN_MASK                    ((unsigned long)(PAGE_ENTRIES - 1))
> +
> +#define PAGE_ORDER                  (12)

DYM PAGE_SHIFT here, as used elsewhere in Xen?

Also are you aware of page-bits.h, where I think some of these constants
should go?

> +#ifdef CONFIG_RISCV_64
> +#define PAGETABLE_ORDER             (9)
> +#else /* CONFIG_RISCV_32 */
> +#define PAGETABLE_ORDER             (10)
> +#endif
> +
> +#define LEVEL_ORDER(lvl)            (lvl * PAGETABLE_ORDER)
> +#define LEVEL_SHIFT(lvl)            (LEVEL_ORDER(lvl) + PAGE_ORDER)
> +#define LEVEL_SIZE(lvl)             (_AT(paddr_t, 1) << LEVEL_SHIFT(lvl))
> +
> +#define XEN_PT_LEVEL_SHIFT(lvl)     LEVEL_SHIFT(lvl)
> +#define XEN_PT_LEVEL_ORDER(lvl)     LEVEL_ORDER(lvl)
> +#define XEN_PT_LEVEL_SIZE(lvl)      LEVEL_SIZE(lvl)

Mind me asking what these are good for? Doesn't one set of macros
suffice?

> +#define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
> +#define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK << XEN_PT_LEVEL_SHIFT(lvl))
> +
> +#define PTE_SHIFT                   10

What does this describe? According to its single use here it may
simply require a better name.

> +#define PTE_VALID                   BIT(0, UL)
> +#define PTE_READABLE                BIT(1, UL)
> +#define PTE_WRITABLE                BIT(2, UL)
> +#define PTE_EXECUTABLE              BIT(3, UL)
> +#define PTE_USER                    BIT(4, UL)
> +#define PTE_GLOBAL                  BIT(5, UL)
> +#define PTE_ACCESSED                BIT(6, UL)
> +#define PTE_DIRTY                   BIT(7, UL)
> +#define PTE_RSW                     (BIT(8, UL) | BIT(9, UL))
> +
> +#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
> +#define PTE_TABLE                   (PTE_VALID)
> +
> +/* Calculate the offsets into the pagetables for a given VA */
> +#define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
> +
> +#define pt_index(lvl, va)   pt_linear_offset(lvl, (va) & XEN_PT_LEVEL_MASK(lvl))
> +
> +/* Page Table entry */
> +typedef struct {
> +    uint64_t pte;
> +} pte_t;

Not having read the respective spec (yet) I'm wondering if this really
is this way also for RV32 (despite the different PAGETABLE_ORDER).

> --- /dev/null
> +++ b/xen/arch/riscv/mm.c
> @@ -0,0 +1,121 @@
> +#include <xen/compiler.h>
> +#include <xen/init.h>
> +#include <xen/kernel.h>
> +#include <xen/lib.h>
> +#include <xen/page-size.h>
> +
> +#include <asm/boot-info.h>
> +#include <asm/config.h>
> +#include <asm/csr.h>
> +#include <asm/mm.h>
> +#include <asm/page.h>
> +#include <asm/traps.h>
> +
> +/*
> + * xen_second_pagetable is indexed with the VPN[2] page table entry field
> + * xen_first_pagetable is accessed from the VPN[1] page table entry field
> + * xen_zeroeth_pagetable is accessed from the VPN[0] page table entry field
> + */
> +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> +    xen_second_pagetable[PAGE_ENTRIES];
> +static pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> +    xen_first_pagetable[PAGE_ENTRIES];
> +static pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> +    xen_zeroeth_pagetable[PAGE_ENTRIES];

I would assume Andrew's comment on the earlier version also extended to
the names used here (and then also to various local variables or function
parameters further down).

> +extern unsigned long __init_begin[];
> +extern unsigned long __init_end[];
> +extern unsigned char cpu0_boot_stack[STACK_SIZE];
> +
> +static void __init
> +setup_initial_mapping(pte_t *second, pte_t *first, pte_t *zeroeth,
> +                      unsigned long map_start,
> +                      unsigned long map_end,
> +                      unsigned long pa_start,
> +                      unsigned long flags)
> +{
> +    unsigned long page_addr;
> +
> +    // /* align start addresses */
> +    // map_start &= XEN_PT_LEVEL_MAP_MASK(0);
> +    // pa_start &= XEN_PT_LEVEL_MAP_MASK(0);

It's not clear what this is about, but in any event the comment is malformed.

> +    page_addr = map_start;
> +    while ( page_addr < map_end )
> +    {
> +        unsigned long index2 = pt_index(2, page_addr);
> +        unsigned long index1 = pt_index(1, page_addr);
> +        unsigned long index0 = pt_index(0, page_addr);
> +
> +        /* Setup level2 table */
> +        second[index2] = paddr_to_pte((unsigned long)first);
> +        second[index2].pte |= PTE_TABLE;
> +
> +        /* Setup level1 table */
> +        first[index1] = paddr_to_pte((unsigned long)zeroeth);
> +        first[index1].pte |= PTE_TABLE;

Whould it make sense to have paddr_to_pte() take attributes right
away as 2nd argument?

> +
> +

Nit: No double blank lines please.

> +        /* Setup level0 table */
> +        if ( !pte_is_valid(&zeroeth[index0]) )
> +        {
> +            /* Update level0 table */
> +            zeroeth[index0] = paddr_to_pte((page_addr - map_start) + pa_start);
> +            zeroeth[index0].pte |= flags;
> +        }
> +
> +        /* Point to next page */
> +        page_addr += XEN_PT_LEVEL_SIZE(0);
> +    }
> +}
> +
> +/*
> + * setup_initial_pagetables:
> + *
> + * Build the page tables for Xen that map the following:
> + *   load addresses to linker addresses
> + */
> +void __init setup_initial_pagetables(void)
> +{
> +    pte_t *second;
> +    pte_t *first;
> +    pte_t *zeroeth;
> +
> +    unsigned long load_addr_start   = boot_info.load_start;
> +    unsigned long load_addr_end     = boot_info.load_end;
> +    unsigned long linker_addr_start = boot_info.linker_start;
> +    unsigned long linker_addr_end   = boot_info.linker_end;
> +
> +    BUG_ON(load_addr_start % (PAGE_ENTRIES * PAGE_SIZE) != 0);
> +    if (load_addr_start != linker_addr_start)

Nit: Style (missing blanks).

> +        BUG_ON((linker_addr_end > load_addr_start && load_addr_end > linker_addr_start));
> +
> +    /* Get the addresses where the page tables were loaded */
> +    second  = (pte_t *)(&xen_second_pagetable);
> +    first   = (pte_t *)(&xen_first_pagetable);
> +    zeroeth = (pte_t *)(&xen_zeroeth_pagetable);

Please avoid casts whenever possible.

> @@ -32,3 +33,67 @@ ENTRY(start)
>          add     sp, sp, t0
>  
>          tail    start_xen
> +
> +ENTRY(enable_mmu)
> +        /* Calculate physical offset between linker and load addresses */
> +        la      t0, boot_info
> +        REG_L   t1, BI_LINKER_START(t0)
> +        REG_L   t2, BI_LOAD_START(t0)
> +        sub     t1, t1, t2
> +
> +        /*
> +         * Calculate and update a linker time address of the .L_mmu_is_enabled
> +         * label and update CSR_STVEC with it.
> +         * MMU is configured in a way where linker addresses are mapped
> +         * on load addresses so case when linker addresses are not equal to
> +         * load addresses, and thereby, after MMU is enabled, it will cause
> +         * an exception and jump to linker time addresses
> +         */
> +        la      t3, .L_mmu_is_enabled
> +        add     t3, t3, t1
> +        csrw    CSR_STVEC, t3
> +
> +        /* Calculate a value for SATP register */
> +        li      t5, SATP_MODE_SV39
> +        li      t6, SATP_MODE_SHIFT
> +        sll     t5, t5, t6
> +
> +        la      t4, xen_second_pagetable
> +        srl     t4, t4, PAGE_SHIFT
> +        or      t4, t4, t5
> +        sfence.vma
> +        csrw    CSR_SATP, t4
> +
> +        .align 2
> +.L_mmu_is_enabled:
> +        /*
> +         * Stack should be re-inited as:
> +         * 1. Right now an address of the stack is relative to load time
> +         *    addresses what will cause an issue in case of load start address
> +         *    isn't equal to linker start address.
> +         * 2. Addresses in stack are all load time relative which can be an
> +         *    issue in case when load start address isn't equal to linker
> +         *    start address.
> +         */
> +        la      sp, cpu0_boot_stack
> +        li      t0, STACK_SIZE
> +        add     sp, sp, t0
> +
> +        /*
> +         * Re-init an address of exception handler as it was overwritten  with
> +         * the address of the .L_mmu_is_enabled label.
> +         * Before jump to trap_init save return address of enable_mmu() to
> +         * know where we should back after enable_mmu() will be finished.
> +         */
> +        mv      s0, ra

Don't you need to preserve s0 for your caller?

> +        lla     t0, trap_init

Any reason for lla here when elsewhere above you use la? And aren't ...

> +        jalr    ra, t0

... these two together "call" anyway?

> +        /*
> +         * Re-calculate the return address of enable_mmu() function for case
> +         * when linker start address isn't equal to load start address
> +         */
> +        add     s0, s0, t1
> +        mv      ra, s0

"add ra, s0, t1"?

But then - can't t1 be clobbered by trap_init()?

> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -179,3 +179,5 @@ SECTIONS
>  
>  ASSERT(!SIZEOF(.got),      ".got non-empty")
>  ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
> +
> +ASSERT(_end - _start <= MB(2), "Xen too large for early-boot assumptions")

Again the question whether this is also applicable to RV32.

Jan

