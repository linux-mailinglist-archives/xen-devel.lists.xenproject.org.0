Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7D56CC674
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 17:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515954.799362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBLZ-0007iT-OV; Tue, 28 Mar 2023 15:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515954.799362; Tue, 28 Mar 2023 15:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBLZ-0007gj-LS; Tue, 28 Mar 2023 15:34:53 +0000
Received: by outflank-mailman (input) for mailman id 515954;
 Tue, 28 Mar 2023 15:34:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phBLX-0007gd-J5
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 15:34:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13782917-cd7e-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 17:34:50 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR04MB7108.eurprd04.prod.outlook.com (2603:10a6:208:19e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:34:46 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 15:34:45 +0000
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
X-Inumbo-ID: 13782917-cd7e-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2SSe1V+NQAlXNcNOTFDzMkSfzeBDqD+Tm2FrI8oDbQYycesrYLabH2Mwvlp2hSNbLEbqgsSqdObqEMuAiApajLR0Awk59NJsPK8rEEfeU2DAUjjKtbbqI5xOpWeqQQGsrOJL+QFYaWaKSF/jG8iZUcgBgjSUJJ/GmR6Ogc9fuqGRuZHNpv63VVvNovl7QMfJ+QKJyHvw9cMtXPu0QHjiFg/hoM/nHeCGD/01aFsdGC/jXK58fZZazbWCy7XTymg6Wolq3yM4yZ067OuvMpGb0Ne8ojjgjGj4sOKX3EoJfsC0RPQ6AAFxeP0pPGRWdy7CxiQMszGObvefXcRjiI/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAjNoidCv6+NrE51YETuS9refmykrqxDPyRgNKFbHsU=;
 b=WS2niqD2vCUCZ68e459tfiGv90ijr3NE+LQ44F9tgiC7O5stIHRCWvs6K/U2MPSNndwPIqeyHoKLyJ4VNOujnjRI/tnDv7wGx3R3SQzcKMIxMmyaOGKz9YoHwKH9Fh/8rJ+qfmfYjztmrWETkFZ7ZNkwQfuh25iOOYJa4Z35mq7nZnueGhgORXMMbHoPDjCJDWMte6VdlBOAVWDXelBCLlRAaKdySvi/kHC+LO9Nx2MAq4+fKSZnoK/eYLaZwfdS3eVan6fCENdSqfTQGnyzc42RXe5912tdf5pPQ0SzxJ1H7YB4mVdnQGRf68GGbxUNtyPvokAer8f1dyI9jTmpSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAjNoidCv6+NrE51YETuS9refmykrqxDPyRgNKFbHsU=;
 b=q++WwExwsieK3n7pxzboeCsLxxHcFC05WTSPoUfg8kkgWf5sE7mhb69uHeROO7pGVz3naDOXS4EnLzfYMLA7XHTd+2MtGiSnrMkN9UVjLyRG2pvqFrL9ksVPU2RRFyd1QDjtzTOngNbMMavzfuFbBrBsxYUl6NShW1lthAHePsy71AC2fBm7mNLaSALS9/2bHLxq3DXjJT9yVhAXy7Qd/7j9iO57fm+Mz0+Zc/iQxR3XzySEa8JzkbG2BDyaaKJizQ1d9v9fH4J4pYcuBwk7gqOX84X6h9B47wAi7SPvGsKeBGKFouvEHXD9UXwUU9awqg+H5KfSOe6gFWFJa8QK8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a16b79e-8292-6947-24d4-dd027113943f@suse.com>
Date: Tue, 28 Mar 2023 17:34:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1679934166.git.oleksii.kurochko@gmail.com>
 <93da6ba381604748e2c71e2ebd35e80798ec4bb2.1679934166.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <93da6ba381604748e2c71e2ebd35e80798ec4bb2.1679934166.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::16) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM0PR04MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: 38fac045-2c9b-4d3a-d006-08db2fa1f535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OAswwHUOEWhjfdR8V0WYFRMcjU6Bz8Jlo8L3yJeO3AEYpQ243ddioX4FTIvYygfUH711Ltv1FHz1VNjAc+Y0rqWRqUWt+50HuuZ9dZkgwlWlgB+S6PhPO8CQVonrcm3aJvRsGw5D/SmaRgB6TLPd+izMOvePtEk+y+6Bv/mMJOuRpjiJVRfStluqWTaPt6zRPzj6nPMM7yI9X3VbWyPyGQtlGk19oGoXEEH4prEnQnAbEZFb8nzKGFULFvXwGzOrezxHne5sc7FynIPREjKmCWX1GYadOCeKz+T/ShyeGtn8eK6dplbMdfnuCeo2me7fFQ7a44YWiP0giqhFAuv5cLJmPNsMTy/Okr1GPuDMYQp1+loO+s9rMMSXncK22j2/rePgBblrIYINrliBPw+0xORJ9JQSilCD/qc05RkMUaQUvQqOuNchGoLiPj7LSIv4pj9m+/Hf8seWM2+CNiLLG0iVW20DL2nJ0EzoxQJz2xUotC0jybParYM/OsxuRcePx+SPodJX1ZRzakb3b4RGaEuhfjL4QuUgC3wHVTg60wRluPKK2Vc7/+yWhJJAtuCiPKBvF9BNKr5wx533m7THcg2tWnTmGbQXDRHoq019C9rVh5W47Tm3w1pwCSoJIWCb3B2bpzr0phWwMnCe73YoRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199021)(5660300002)(38100700002)(8936002)(54906003)(316002)(86362001)(6916009)(66946007)(66476007)(8676002)(66556008)(41300700001)(30864003)(4326008)(2906002)(478600001)(31686004)(83380400001)(6486002)(2616005)(31696002)(6512007)(6506007)(186003)(26005)(53546011)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXF3UGRpZm1GbHEzNFpPYVNlTDE2MThMOXNxR29tMkowM2RGdmk3RzhmZmdm?=
 =?utf-8?B?Yk9SV3Y2djBWbGNGWXNldmJGdzR4clArTWRkdVg0VjVNcUZDRkRhOFVqOFk0?=
 =?utf-8?B?Wjc0QlRualRKRTBSTm9XRnJiMFlhMVFLdjllSmlGYndlSkxvYVp0VGhSTTNU?=
 =?utf-8?B?UVY5S3FXK2JrLzlQbzVLOFQ5dzBrZlpvNU84R3IwbVZCRzZ2LzJNb2dxbU96?=
 =?utf-8?B?TWR0TmNqUGpWNkhUd243QXZCS1E0bEpjVFR6eU5MNHZIN0dZNTFZMVUrOGdN?=
 =?utf-8?B?NWV4amxxTkFhbDJwY3JsY1VobnNpY0xXcnQ3c25nekdBdTlXbm4xZHVrTUlJ?=
 =?utf-8?B?amp4cW9aZ28vN3ozWGh1Tk8yemdLbGJyZWNFQ0Fld1BsZERmVUxJNzZTRDR6?=
 =?utf-8?B?K050TFhLWXEyQVFrcVBhUzZOVzlZeVh4TUtwa05YSWpTcnN4TnU5Wmw0ZGRl?=
 =?utf-8?B?RCsvZUZrZHE3STlrT0E4ZnlSODROdU9iNTVvaVhsVXFMQVJDMHc1M0o3NHN5?=
 =?utf-8?B?UlJ2SUFjbzFVTndncHc2dU5TMTg0Z29EUHpMQmZHY2NLOWpWYXNBYnlWTUJ2?=
 =?utf-8?B?YXE5RXR0RmhMVkxjU3VHL3ZyQXZuQWZ0cG5iU2J3N0gzNmVVaGN1eGJqNmpJ?=
 =?utf-8?B?b014SExsYjAweWdEU05MWDVDNXhRY1o4S1Y0TS84S1JITUwvK1VPdEFGS0tP?=
 =?utf-8?B?TGRVajlEbmp6eVljNS9lQVk4Q0Q3M1ZmRmRuUWJRVW9XSjVUdkxxNmlDNHZn?=
 =?utf-8?B?eThuQUMwK2VWOHhaVFRBaExIRFl0SXNicXlHZ1lUYW5YbHBhV3JIZk9Od3F5?=
 =?utf-8?B?VHo3UjNLbjYwYWpoRU1lQVhIaXV4QVdPSG1uMVZEaExpSk9wU2xJTk0xcUZL?=
 =?utf-8?B?b2Q2UGpiVU5XRWFjL1FUQm9na0tnN1FmbUoyUC9Id3hLaXdMb2hlYVUwajdR?=
 =?utf-8?B?cDBiVmVsd0VPRmVVdkJjZjVTUFVwODhDdHovVjFnU0hYUnlZcE9ZWDhtaTJ4?=
 =?utf-8?B?R1BXdEdkY3dPazVIa01DL2tQSzdRR3RZdGEwVlkvR0pla1Joa245MktPWlpJ?=
 =?utf-8?B?YVBxVlAzekw0VE9yZDcvV0N6Q1RkYU13WFc0ZElPNElNeFBxM3FQV1lWNDhE?=
 =?utf-8?B?THo5SUlPTEtwcUhaWGhWTmx3aXRpT2lldnlIRTk1bmF4QWtrSGQxZm5ZaVBM?=
 =?utf-8?B?ZkFHcit0SVBmT1o4MXArQjQ1WjN2enVqV1NhekdvaCtTUC9Uam5WYXJ2cStN?=
 =?utf-8?B?Tjc1TU1YQnU1R2cyNG1rTjdSdXZsVHJQS2lvQi9nNTNrbCt6YUxjVTI4K0lJ?=
 =?utf-8?B?Wmwxd2dvd3RodDhXaXpUTkVVQWl1WlJhZDZ5QWJmcWg1V2lmL2JjOW5PWCtr?=
 =?utf-8?B?MDMwY1Qrak44RjR0VTlzSy9oZ3IrY2lqV3VobHNYaCtCZ09TWkZWYXVGMTUz?=
 =?utf-8?B?WGJhZGxKbnZUdDg4UGN0Slc0SmV1Z0FHNEhtaE5Sc2QzcmFxTXhQSU03YmhU?=
 =?utf-8?B?RkVmWWFkQjJLN0lBa3JXSzU4c0ZUMmpXTHBIUTJpQkk2Y2Q3d3Y2MU9NYUJh?=
 =?utf-8?B?Qzc0dHFkWENjYVhvNzE2Y2hUeGVTR0k5TGJjSC9BS3dlYWRjNHU3MmF1M2tu?=
 =?utf-8?B?Y3dTbFg0bFN3Z0hDb0RPcGRsOGZ6R1VmSEdyaVZTMjM1dzlPNzQ5ZS9sdmhq?=
 =?utf-8?B?MERuWklHVXoyWTAwa2ZOb2hjdHNtOVFxSjdNZzR5RHlNaEk3ZnljMlIvNEVW?=
 =?utf-8?B?TjE2NFhrUXJJcEp1Qnh3OTV6RmY2K09kMVRlNUtRdkU4MVoxWk1NZTF2UWJJ?=
 =?utf-8?B?d3hLRmtJR2VHUGlzVWFBbUVLdmdYc21RWWNFcU1XU1JGcjZlcC9nZHdvWTgw?=
 =?utf-8?B?cno3TUpoa3U5d2s3Ny9HTTIzNnRna040VWNoWFNGVldUQmNzN3BCeklReG1M?=
 =?utf-8?B?MS9kS20rdC9RVFFXQjhFMm5HdFFQWEFERXRqckFpSFJzS2U1WG0vTGlCL1pm?=
 =?utf-8?B?K2pjZ3dNUjJpbVljZi8vZGNIbFhNM1VNV2tsdVBCYXVKZE9HdWxqL0lraXQ2?=
 =?utf-8?B?ZVdmanpiaWZ1cVFacWlXUndHSERqblUxOGYrVVN1cURFWkt3bGNQRnA2cUUr?=
 =?utf-8?Q?0yR4I/KN0HoF8myKhyQxsXFMw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fac045-2c9b-4d3a-d006-08db2fa1f535
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 15:34:45.4593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQALHL2YKizcMyDtBYd72T65i3oFf8N2v3Ncqcouis6GameQ7/SAiJix95J5SKTRiMBZQMQfE+6H9HDkLCfJSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7108

On 27.03.2023 19:17, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -39,12 +39,25 @@
>    name:
>  #endif
>  
> -#define XEN_VIRT_START  _AT(UL, 0x80200000)
> +#define ADDRESS_SPACE_END (_AC(-1, UL))
> +#define SZ_1G             0x40000000

No need for this - please use GB(1) (see xen/config.h) in its stead.

> +#ifdef CONFIG_RISCV_64
> +#define XEN_VIRT_START    (ADDRESS_SPACE_END - SZ_1G + 1)

I first thought the " + 1" would be rendering the address misaligned.
May I suggest (ADDRESS_SPACE_END + 1 - SZ_1G) to help avoiding this
impression?

> +#else
> +#error "RV32 isn't supported"asm

Stray "asm" at the end of the line.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -0,0 +1,62 @@
> +#ifndef _ASM_RISCV_PAGE_H
> +#define _ASM_RISCV_PAGE_H
> +
> +#include <xen/const.h>
> +#include <xen/types.h>
> +
> +#define VPN_MASK                    ((unsigned long)(PAGETABLE_ENTRIES - 1))
> +
> +#define XEN_PT_LEVEL_ORDER(lvl)     ((lvl) * PAGETABLE_ORDER)
> +#define XEN_PT_LEVEL_SHIFT(lvl)     (XEN_PT_LEVEL_ORDER(lvl) + PAGE_SHIFT)
> +#define XEN_PT_LEVEL_SIZE(lvl)      (_AT(paddr_t, 1) << XEN_PT_LEVEL_SHIFT(lvl))
> +#define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
> +#define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK << XEN_PT_LEVEL_SHIFT(lvl))
> +
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
> +#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
> +#define PTE_TABLE                   (PTE_VALID)
> +
> +/* Calculate the offsets into the pagetables for a given VA */
> +#define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
> +
> +#define pt_index(lvl, va) pt_linear_offset(lvl, (va) & XEN_PT_LEVEL_MASK(lvl))
> +
> +#ifdef CONFIG_RISCV_64
> +typedef uint64_t pte_t;
> +#else
> +typedef uint32_t pte_t;
> +#endif

Are you sure you don't want to encapsulate these in a struct, for type
safety purposes?

> +#define addr_to_pte(x) (((x) >> PTE_PPN_SHIFT) << PAGE_SHIFT)

This looking like the inverse of ...

> +/* Shift the VPN[x] or PPN[x] fields of a virtual or physical address
> + * to become the shifted PPN[x] fields of a page table entry */
> +#define addr_to_ppn(x) (((x) >> PAGE_SHIFT) << PTE_PPN_SHIFT)

... this, does that one want to be called "ppn_to_addr()"? Otherwise I
can't see how name an operation fit together.

> +static inline pte_t paddr_to_pte(const unsigned long paddr,

paddr_t?

> +                                 const unsigned long permissions)
> +{
> +    pte_t tmp = (pte_t)addr_to_ppn(paddr);
> +    return tmp | permissions;
> +}
> +
> +static inline pte_t pte_to_paddr(const unsigned long paddr)

A function of this name wants to take pte_t as parameter and return
paddr_t (note the type safety remark higher up, as it becomes relevant
right here). It also hardly can be implemented ...

> +{
> +    return (pte_t)addr_to_pte(paddr);

... in terms of a function/macro with effectively the opposite name.

> --- /dev/null
> +++ b/xen/arch/riscv/mm.c
> @@ -0,0 +1,277 @@
> +#include <xen/init.h>
> +#include <xen/kernel.h>
> +
> +#include <asm/early_printk.h>
> +#include <asm/config.h>
> +#include <asm/csr.h>
> +#include <asm/mm.h>
> +#include <asm/page.h>
> +#include <asm/processor.h>
> +
> +#define PGTBL_INITIAL_COUNT 8

What does this magic number derive from? (A comment may help.)

> +#define PGTBL_ENTRY_AMOUNT  (PAGE_SIZE/sizeof(pte_t))

Nit: Style (blanks around binary operators).

> +struct mmu_desc {
> +    unsigned long num_levels;
> +    uint32_t pgtbl_count;

Nit: Style (as before please avoid fixed width types when their use
isn't really warranted; afaics unsigned int will do fine here and
elsewhere below).

> +    pte_t *next_pgtbl;
> +    pte_t *pgtbl_base;
> +};
> +
> +extern unsigned long __bss_start[];
> +extern unsigned long __bss_end[];

Why are these being added here? They aren't being used afaics.

> +extern unsigned char cpu0_boot_stack[STACK_SIZE];
> +
> +#define PHYS_OFFSET ((unsigned long)_start - XEN_VIRT_START)
> +#define LOAD_TO_LINK(addr) ((addr) - PHYS_OFFSET)
> +#define LINK_TO_LOAD(addr) ((addr) + PHYS_OFFSET)
> +
> +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> +stage1_pgtbl_root[PGTBL_ENTRY_AMOUNT];
> +
> +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> +stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PGTBL_ENTRY_AMOUNT];
> +
> +#define HANDLE_PGTBL()                                                      \
> +    index =  pt_index(curr_lvl_num, page_addr);                             \

Nit: Style (stray double blanks).

> +    if ( pte_is_valid(pgtbl[index]) ) {                                     \

Nit: Style (brace placement throughout the macro - in really small
macros the way you have it may be okay as an exception, but this macro
isn't small).

> +        /* Find L{ 0-3 } table */                                           \
> +        pgtbl = (pte_t *)pte_to_paddr(pgtbl[index]);                        \
> +    } else {                                                                \
> +        /* Allocate new L{0-3} page table */                                \
> +        if ( mmu_desc->pgtbl_count == PGTBL_INITIAL_COUNT ) {               \
> +            early_printk("(XEN) No initial table available\n");             \
> +            /* panic(), BUG() or ASSERT() aren't ready now. */              \
> +            die();                                                          \
> +        }                                                                   \
> +        mmu_desc->pgtbl_count++;                                            \
> +        pgtbl[index] = paddr_to_pte((unsigned long)mmu_desc->next_pgtbl,    \
> +                                    PTE_VALID);                             \
> +        pgtbl = mmu_desc->next_pgtbl;                                       \
> +        mmu_desc->next_pgtbl += PGTBL_ENTRY_AMOUNT;                         \
> +    }
> +
> +static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
> +                                  unsigned long map_start,
> +                                  unsigned long map_end,
> +                                  unsigned long pa_start,
> +                                  unsigned long permission)

Nit: Style (indentation, and it feels like I commented on this before).

> +{
> +    uint32_t index;
> +    pte_t *pgtbl;
> +    unsigned long page_addr;
> +    unsigned int curr_lvl_num;
> +    pte_t pte_to_be_written;
> +    unsigned long paddr;
> +
> +    if ( (unsigned long)_start % XEN_PT_LEVEL_SIZE(0) ) {

Nit: Style (brace placement).

> +        early_printk("(XEN) Xen should be loaded at 4k boundary\n");
> +        die();
> +    }
> +
> +    if ( map_start & ~XEN_PT_LEVEL_MAP_MASK(0) ||
> +        pa_start & ~XEN_PT_LEVEL_MAP_MASK(0) ) {

Nit: Style (indentation and brace placement; more below).

> +        early_printk("(XEN) map and pa start addresses should be aligned\n");
> +        /* panic(), BUG() or ASSERT() aren't ready now. */
> +        die();
> +    }
> +
> +    page_addr = map_start;
> +    while ( page_addr < map_end ) {
> +        pgtbl = mmu_desc->pgtbl_base;
> +
> +        switch (mmu_desc->num_levels)
> +        {
> +        case 4: /* Level 3 */
> +            curr_lvl_num = 3;
> +            HANDLE_PGTBL();
> +        case 3: /* Level 2 */
> +            curr_lvl_num = 2;
> +            HANDLE_PGTBL();
> +        case 2: /* Level 1 */
> +            curr_lvl_num = 1;
> +            HANDLE_PGTBL();

Am I getting it right that curr_lvl_num solely exists to pass a parameter
to the macro? If so, why doesn't the macro take an appropriate parameter
instead?

> +        case 1: /* Level 0 */
> +            index = pt_index(0, page_addr);
> +            paddr = (page_addr - map_start) + pa_start;
> +            pte_to_be_written = paddr_to_pte(paddr, permission);
> +
> +            if ( !pte_is_valid(pgtbl[index]) )
> +                pgtbl[index] = pte_to_be_written;
> +            else {
> +                /*
> +                 * get an adresses of current pte and that one to
> +                 * be written without permission flags
> +                 */
> +                unsigned long curr_pte =
> +                    (unsigned long)&pgtbl[index] & (PTE_PPN_SHIFT - 1);
> +                pte_to_be_written &= (PTE_PPN_SHIFT - 1);
> +
> +                if ( curr_pte != pte_to_be_written ) {
> +                    early_printk("PTE that is intended to write isn't the \
> +                                 same that the once are overwriting\n");

Iirc there are compilers which warn about line continuation characters
inside a string literal. Since adjacent string literals are concatenated
by the compiler anyway, you'll find elsewhere we have the equivalent of

                    early_printk("PTE that is intended to write isn't the"
                                 " same that the once are overwriting\n");

This will also avoid an excessive number of blanks in the middle of the
string.

> +                    /* panic(), <asm/bug.h> aren't ready now. */
> +                    die();
> +                }
> +            }
> +        }
> +
> +        /* Point to next page */
> +        page_addr += XEN_PT_LEVEL_SIZE(0);
> +    }
> +}
> +
> +static void __init calc_pgtbl_lvls_num(struct  mmu_desc *mmu_desc)
> +{
> +    unsigned long satp_mode = RV_STAGE1_MODE;
> +
> +    /* Number of page table levels */
> +    switch (satp_mode) {

Nit: Style (missing blanks and brace placement).

> +    case SATP_MODE_SV32:
> +        mmu_desc->num_levels = 2;
> +        break;
> +    case SATP_MODE_SV39:
> +        mmu_desc->num_levels = 3;
> +        break;
> +    case SATP_MODE_SV48:
> +        mmu_desc->num_levels = 4;
> +        break;
> +    default:
> +        early_printk("(XEN) Unsupported SATP_MODE\n");
> +        while (1);

die() (until you have panic()) like above?

> +    }
> +}
> +
> +static void __init setup_ptes_permission(struct mmu_desc *mmu_desc)
> +{
> +    pte_t *pgtbl;
> +    uint32_t index;
> +    uint32_t permissions = PTE_VALID;
> +    unsigned long start = LOAD_TO_LINK((unsigned long)_start);
> +    unsigned long end   = LOAD_TO_LINK((unsigned long)_end);
> +
> +    while ( start < end )
> +    {
> +        pgtbl = (pte_t *) mmu_desc->pgtbl_base;

Nit: Style (extra blank after closing parenthesis). But afaict you don't
need a case here in the first place; as said before, please avoid casts
whenever possible.

> +        switch (mmu_desc->num_levels)

Nit: Style (Missing blanks).

> +        {
> +        case 4: /* find Level 3 page table*/
> +            index = pt_index(3, start);
> +            pgtbl = (pte_t *)pte_to_paddr(pgtbl[index]);
> +        case 3: /* find level 2 page table */
> +            index = pt_index(2, start);
> +            pgtbl = (pte_t *)pte_to_paddr(pgtbl[index]);
> +        case 2: /* find level 1 page table */
> +            index = pt_index(1, start);
> +            pgtbl = (pte_t *)pte_to_paddr(pgtbl[index]);
> +        case 1: /* find level 0 page table */
> +            index = pt_index(0, start);
> +
> +            if ( is_kernel_text(LINK_TO_LOAD(start)) ||
> +                 is_kernel_inittext(LINK_TO_LOAD(start)) )
> +                permissions |= PTE_EXECUTABLE | PTE_READABLE;
> +
> +            if ( is_kernel_rodata(LINK_TO_LOAD(start)) )
> +                permissions |= PTE_READABLE;
> +
> +            pgtbl[index] |= permissions;

setup_initial_mapping() has installed R/W mappings. Hence ORing in
PTE_READABLE is meaningless here, and neither .text nor .rodata
will end up write-protected. The question is ...

> +        }
> +
> +        start += PAGE_SIZE;
> +    }
> +}
> +
> +/*
> + * setup_initial_pagetables:
> + *
> + * Build the page tables for Xen that map the following:
> + *  1. Calculate page table's level numbers.
> + *  2. Init mmu description structure.
> + *  3. Check that linker addresses range doesn't overlap
> + *     with load addresses range
> + *  4. Map all linker addresses and load addresses ( it shouldn't
> + *     be 1:1 mapped and will be 1:1 mapped only in case if
> + *     linker address is equal to load address ) with
> + *     RW permissions by default.
> + *  5. Setup proper PTE permissions for each section.
> + */
> +void __init setup_initial_pagetables(void)
> +{
> +    struct mmu_desc mmu_desc = { 0, 0, NULL, 0 };
> +
> +    /*
> +     * Access to _{stard, end } is always PC-relative
> +     * thereby when access them we will get load adresses
> +     * of start and end of Xen
> +     * To get linker addresses LOAD_TO_LINK() is required
> +     * to use
> +     */
> +    unsigned long load_start    = (unsigned long)_start;
> +    unsigned long load_end      = (unsigned long)_end;
> +    unsigned long linker_start  = LOAD_TO_LINK(load_start);
> +    unsigned long linker_end    = LOAD_TO_LINK(load_end);
> +
> +    if ( (linker_start != load_start) &&
> +         (linker_start <= load_end) && (load_start <= linker_end) ) {
> +        early_printk("(XEN) linker and load address ranges overlap\n");
> +        die();
> +    }
> +
> +    calc_pgtbl_lvls_num(&mmu_desc);
> +
> +    mmu_desc.pgtbl_base = stage1_pgtbl_root;
> +    mmu_desc.next_pgtbl = stage1_pgtbl_nonroot;
> +
> +    setup_initial_mapping(&mmu_desc,
> +                          linker_start,
> +                          linker_end,
> +                          load_start,
> +                          PTE_LEAF_DEFAULT);
> +
> +    setup_ptes_permission(&mmu_desc);

...: Why does this require a 2nd pass / function in the first place?

> +}
> +
> +void __init enable_mmu()
> +{
> +    /*
> +     * Calculate a linker time address of the mmu_is_enabled
> +     * label and update CSR_STVEC with it.
> +     * MMU is configured in a way where linker addresses are mapped
> +     * on load addresses so in a case when linker addresses are not equal
> +     * to load addresses, after MMU is enabled, it will cause
> +     * an exception and jump to linker time addresses.
> +     * Otherwise if load addresses are equal to linker addresses the code
> +     * after mmu_is_enabled label will be executed without exception.
> +     */
> +    csr_write(CSR_STVEC, LOAD_TO_LINK((unsigned long)&&mmu_is_enabled));

That looks like a pretty unusual way of moving from physical to virtual
addresses. But if it works ...

> +    /* Ensure page table writes precede loading the SATP */
> +    asm volatile("sfence.vma");
> +
> +    /* Enable the MMU and load the new pagetable for Xen */
> +    csr_write(CSR_SATP,
> +              ((unsigned long)stage1_pgtbl_root >> PAGE_SHIFT) | RV_STAGE1_MODE << SATP_MODE_SHIFT);

Nit: Style (excessively long line).

> +    asm volatile(".align 2");
> +mmu_is_enabled:

Nit: Style (labels want indenting by at least one blank).

> @@ -26,3 +27,13 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      unreachable();
>  }
> +
> +void __init noreturn cont_after_mmu_is_enabled(void)

To prevent undue link-time optimization such a function also wants to
be noinline.

Jan

