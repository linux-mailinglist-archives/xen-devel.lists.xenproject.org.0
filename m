Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4651077B9EF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 15:28:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583662.913928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVXbf-0001Ta-94; Mon, 14 Aug 2023 13:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583662.913928; Mon, 14 Aug 2023 13:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVXbf-0001Qn-5z; Mon, 14 Aug 2023 13:27:39 +0000
Received: by outflank-mailman (input) for mailman id 583662;
 Mon, 14 Aug 2023 13:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVXbe-0001Qh-Dx
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 13:27:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54d3ae6f-3aa6-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 15:27:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8229.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 13:27:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 13:27:33 +0000
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
X-Inumbo-ID: 54d3ae6f-3aa6-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3agTEp6bxOWc47mnw3fkbytKT4l26hgAD/+4Mv6EfwmCQwEpR6U3TGNj3aCNzhfvI76JU+xVtK0yxLddGlIE0nc4KdJCf3Cv2Y8bOsarCCZQwajWBzphhb1ldQ3nFfK2W3Kvh4GTvTxE4O8oziD32xhNRJg/EN2squd8NUywd0LYviwetBdsJXSTOF2/ZIN29aXKxadIIY1DhhIuCIEotAEZd0dCzfgdWxqLiryNcrwsDuaGcSiAj9Rorz2WzlOzZFx/Zs8QBKFba4lSXHkc6N3SHhz7CXI8/xkFyVuoTkawzA/W4y1uj1lMc4+ygat21hldUjdLTNwTrBSgq8+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2s1uzlrUOOEKWEJ4o5QDhG6Bt+D4nsxBb/iawqlZfU=;
 b=dN5Ol153MbWDo21hMoihGhxedst2ZwpYztz23P1UwSJR7xyKjiYeU26pTE+kWUwUCqPI/BeW5gvr/qRwpisgOJB2OlHD5bhV0Wtg1zO59LJFGea9qPPGU7fxWTM/eXUaP6nDYUxZ2DCDoFHgGMigcpGIjMPxQPDYkDqVtY3slsMtntj8BxZ4tHaRu5GSmfOH5s8b9yvxHX8vINO6PAntvtBof6sotV0so3r2UkmvZE6LLr5igK0GiD8T4WANOWFg20/H4lbK+YCnoK2nvdeIaYsdNV/+xu8S8Gih1X+6Wf6v7D2DUJFTgO3/iboVg2bDLGhW9fwhCYwmZvqfumDsuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2s1uzlrUOOEKWEJ4o5QDhG6Bt+D4nsxBb/iawqlZfU=;
 b=H3PEfy22Wep4qXATwJYXh1xJOFy7y6Z1MWR0X2AyJXicSgoN1hBGoRWWOfbofRV26BInGkHOjpA6hiM9eBvHk8nrowwVN8qjSeeqkuxCYgEeDY18QzHxki3j4Jq3OBz1kELJhmElmHyqbYhIuBMzn6/jkKFCZ9FY0924jACs/EuBaPVivuJL6ZXPanEqYWFntqwfyKlyeazoQsAh4MkNQS2lSTwFsOCoNd7R9eyH1ct9oQBNfyaMcANhBMaN+RAVMcJLiipZDbT39EPTK8gSDHjNLDqIgMpW2FdTiGg+lD4YPQ9e9H4zN/dl8eJq/PyHQscq6FBgHe7McuvcYVymxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <17a21607-1c41-c073-94bd-6d2cc1eea2b7@suse.com>
Date: Mon, 14 Aug 2023 15:27:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 3/3] xen/ppc: Implement initial Radix MMU support
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691620546.git.sanastasio@raptorengineering.com>
 <6bacc1ca18273654229672e6ba2741da01a92f04.1691620546.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6bacc1ca18273654229672e6ba2741da01a92f04.1691620546.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ee3013-e016-4b70-ebe7-08db9cca37b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EbHptyxRuI+EV93FwYg5a7dohBKZkL8OPptMLwK6S5wieuLsaL4TmUXTgbJDylYoXBJNhRdTKz90REgVn+f0DM0APBGkqWOq0voCkbApd/jDqGnXjdh81XtlI4KWx7oaA8tTxRH2hlll2Lf7fOiHOlOKD56U404LVX35P6zRUQ8yauAT50wNaGdy8PsJWBXGyVgGeujRBJ8AuR2Yj53xlY6bq/UWQJLSNb6pE9ZiEj+cVe9ObWIZm1uqJbZPiSGovozbQRJEQe+YW8qbTNbpAopwi7gBCvNzQhAM2a5gYHO371DIfu9YHEQPI7DDz00IyjvYPm+AcRibwASeF3Q1Kyyu3lrE8h8k442ThkAofWqYEFTYzS9rawUcMIYCFBajsbHCMyYCu6LkmUn5jtSjqACk0JwtlHrgvZDXJIgHRNql7KPQ4Ja9hj+DHVoGlFHQJmKfn/SZ+E+rwcAjHfg+zDN7CB8dmZxkNKRJwWHFz0zNq746y2+mv3LbAVRx80E7ubGW0xgvwnpHCDv3Yj3VOj1l6eS9b1L0MagHYbKFryP5YB8NiE93LyUa4ch7dwClQqNOtX+qT/TC+5hRyUVhKo0xM7K3u2WSH491O3BAkaZVm5OIqPP7KmgE9vNDE1GAkSzI2AFaeHOzgFHGg5k4CP6m+mBiZhqI/WK54F8cZKY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(376002)(366004)(39860400002)(1800799006)(186006)(451199021)(53546011)(26005)(6506007)(41300700001)(8936002)(66476007)(66556008)(66946007)(316002)(8676002)(6512007)(31686004)(2616005)(83380400001)(6486002)(478600001)(38100700002)(54906003)(31696002)(36756003)(86362001)(4326008)(6916009)(5660300002)(2906002)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlRWQnZPRTQxQnRKOWltZjdFTTIwbnBLWURCQVkrOTFUb1AveVpYUFVmVHZk?=
 =?utf-8?B?Y1h0a1VRaU15UTAzYWR2dnpOaXVQakVWYm9nZU8yelhnM3dsMnJVNXd1bXJa?=
 =?utf-8?B?dkt2cERPcXpKT0JrY1pKaWhPYXFtV0dpM3hTOG1ZUERIQmJ3TWNKdlVVMjZj?=
 =?utf-8?B?azZpMkFrMFlFcTRkK0I0MjVuQnBMdi9zUjBMM25ydUVWdDVaNFVXd0JHVUZo?=
 =?utf-8?B?Si8wY2ZBdHZCUG40bDNkaDQ4T25DVGxJQkwvRkFDSncrNEZmbm0vRWJSRC95?=
 =?utf-8?B?SkxHMXVrVGRhUENaUUt3ektzV0hsSVY5NVFtT2xoQU5zMm1VQU1ud0UrRHlE?=
 =?utf-8?B?ZkgvUThFL0pBTW9zYURTM2tQV1JRYTY3ZEx4cjNHZUZ4a3U2WlAvdWd3Sjcx?=
 =?utf-8?B?RnRhQTJCQWRMVWJIbmp1VjdoeTA3c1ExQlJESzhrbmFIRWFmejRFZ1RmTkRt?=
 =?utf-8?B?cmFPcXpZaTRpanBsdE9UbkxXNi8zejMzTlB3RVdtZ2NYdFRCNVdabWhtWFpY?=
 =?utf-8?B?R3M4QVRTVHVXOXVVdlRpUDRMbnc3OUxRYzhBWnczQXU0WXg5QWZMTTRyT1ZR?=
 =?utf-8?B?L1dIMmpuc01RTnpPeTk4NzZ6aHJYVUo3bmsrTVZvN0p3TTdQbEtzL1UvRDBu?=
 =?utf-8?B?RWIrZzBXaklBN3MvMkZVb1VaUVFESUk2OVYvdE1XcC81NWhwVisyWUNmOEZ6?=
 =?utf-8?B?VUlBM1hnM2lZRXM5NjZNZkFNa0xwc28vKzBhUjFBc0NUWm96MUpubGc4YlRw?=
 =?utf-8?B?eUZFMXdWY1JKWlFUcjJLS3ljQzhvZkhJdFNSWk9idVVKZUY4eWZmaEdJajVV?=
 =?utf-8?B?K1NuZXZCM3RGRWp2aDZBYTJxNHRJYmhjY0VJdWIrT0JETUVQTzFtOU9RQllv?=
 =?utf-8?B?VHRSN3IrcTNUSHVUcWdzc0hrTTkvam4rdnFWUGZzYnJBbWFYZmZmOHVlbldz?=
 =?utf-8?B?VjM4YjhmQlN6Ti9KMzh1WjJldGwxWXFZcWNFdlNLYjNWRVkrNkoyMVJOR0dY?=
 =?utf-8?B?bFJvTG1WaU5TK2xDS04xNUMwaGJOUkp3YWhWZXBNOHQzVkFuUy9sdkZKbHhy?=
 =?utf-8?B?UWRvcnJNcDNHTTM5eTJvYzZLajNmRm1YbFVRWERoTlljNlVId3o0YWpZZHdu?=
 =?utf-8?B?TFp6LzBkY01xZDVtbUcxQ3FYRUU5T3NrMVloTlVmdkVpTi9rTXdmVzBIRG1W?=
 =?utf-8?B?Z043MmFyc1pYNXI5TVQ1aXV6aVo1cldOWlRFSCtrMjBrSEJFVjUydVhyRlVj?=
 =?utf-8?B?aHd6RmsyV0xvbDJuR3dSTkxmU2ZLS0ErRE8rdHFZb2tab3BvY0E4REhIdS93?=
 =?utf-8?B?RndVdFhNNU1QcDNJVmphOW9nQ292RVlpaVVaZmo3RVdIWWNpd3pTclc3Z295?=
 =?utf-8?B?R2F1a3J2YnV5dkJkMHBPcXQ0dFRhV0xKeFAwbVM5akFlRndxK093NkU4cVJv?=
 =?utf-8?B?aWpIcHVVS0JKR0g3U29EOXFFOS9zSlpXRUduNmdFZXFJcEltUkxmdTB1eVpM?=
 =?utf-8?B?SzluR1h6Sk5rK3p6OXF2QkZxZ1NsZk4yYmp3QUlJVEljcWFKbGdoMnZwL045?=
 =?utf-8?B?UGVERC92SlMvbEFFc0UxNzdUZ2VNNHNtZ1RIMzhvRTUza1Z2dys1ZFljLzBV?=
 =?utf-8?B?OUxPZkR4YlJEMDlDZ0p6QW1BcXRmMGU4MzJiSFBBRktLSDkycFB4ZTlpR29V?=
 =?utf-8?B?ZGxmeFFZV3E3Yzc4UFQ5cmN5TVZjdmNVNmM2QnBjdWhGNkFEM2Z2eW1TdnZv?=
 =?utf-8?B?c3ZkU1NtRFZsRUNiWVh3VzJtUDN5UnVacml3NzZDR3k3R1R1RWhXSVZhMUdX?=
 =?utf-8?B?TDhiTS9tTmt1WEprczR6UEg3aDY1bzZ1YTk2ZDFXa0lROWhrSWZ2cjhZQkMw?=
 =?utf-8?B?cFB6UXNVc0U4V0xBUXNXUVhFNVFxMTlENU1qVnhRVm03dmNWMUFUR2JxeWVO?=
 =?utf-8?B?YnNFd1lSZmxrSnBZbDhod202eTRtWjVxRjdjb1ovVitFN1E0SkJiYVZTRndU?=
 =?utf-8?B?bzZiYnkrbW4rSEVxa3VUS2ZlWkw0TkVJUG5xcmF6NEcwdE8xaGFsOTU3R1lm?=
 =?utf-8?B?OGRhdEYxb2VtR21qb0FMVkJJUjl3UVZleG5uTkZGUXN5VVoxQnRyLzljRUY1?=
 =?utf-8?Q?Yn7yumTxQ8kWDN6xXobFjNUxd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ee3013-e016-4b70-ebe7-08db9cca37b5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 13:27:33.6073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5Q1UjOMJTbBJFe3uC8N8B6ZEXAdxHhv5R3VwasAXtEE/kCP8aXI341xV8jaYUqqIaHQbh74Uj7c5nZWiGF0iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8229

On 10.08.2023 00:48, Shawn Anastasio wrote:
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/page.h
> @@ -0,0 +1,181 @@
> +#ifndef _ASM_PPC_PAGE_H
> +#define _ASM_PPC_PAGE_H
> +
> +#include <xen/types.h>
> +
> +#include <asm/bitops.h>
> +#include <asm/byteorder.h>
> +
> +#define PDE_VALID     PPC_BIT(0)
> +#define PDE_NLB_MASK  0xfffffffffffffUL
> +#define PDE_NLB_SHIFT 5UL
> +#define PDE_NLS_MASK  0x1f
> +
> +#define PTE_VALID     PPC_BIT(0)
> +#define PTE_LEAF      PPC_BIT(1)
> +#define PTE_REFERENCE PPC_BIT(55)
> +#define PTE_CHANGE    PPC_BIT(56)
> +
> +/* PTE Attributes */
> +#define PTE_ATT_SAO            PPC_BIT(59) /* Strong Access Ordering */
> +#define PTE_ATT_NON_IDEMPOTENT PPC_BIT(58)
> +#define PTE_ATT_TOLERANT       (PPC_BIT(58) | PPC_BIT(59))
> +
> +/* PTE Encoded Access Authority*/
> +#define PTE_EAA_PRIVILEGED PPC_BIT(60)
> +#define PTE_EAA_READ       PPC_BIT(61)
> +#define PTE_EAA_WRITE      PPC_BIT(62)
> +#define PTE_EAA_EXECUTE    PPC_BIT(63)
> +
> +/* Field shifts/masks */
> +#define PTE_RPN_MASK  0x1fffffffffffUL
> +#define PTE_RPN_SHIFT 12UL

I still don't understand why you need two constants here. Even more so that
now all their uses are as (PTE_RPN_MASK << PTE_RPN_SHIFT). With (only)

#define PTE_RPN_MASK  0x1fffffffffff000UL

instead, as indicated before, you would then (should the need arise) have
this usable with MASK_EXTR() / MASK_INSR(). The again you likely know much
better than me what further uses are going to appear.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/regs.h
> @@ -0,0 +1,138 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

There's still an SPDX header and a full license here.

> --- /dev/null
> +++ b/xen/arch/ppc/mm-radix.c
> @@ -0,0 +1,265 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <xen/init.h>
> +#include <xen/kernel.h>
> +#include <xen/types.h>
> +#include <xen/lib.h>
> +
> +#include <asm/bitops.h>
> +#include <asm/byteorder.h>
> +#include <asm/early_printk.h>
> +#include <asm/mm.h>
> +#include <asm/page.h>
> +#include <asm/processor.h>
> +#include <asm/regs.h>
> +#include <asm/msr.h>
> +
> +void enable_mmu(void);
> +
> +#define INITIAL_LVL1_PD_COUNT      1
> +#define INITIAL_LVL2_LVL3_PD_COUNT 2
> +#define INITIAL_LVL4_PT_COUNT      256
> +
> +static size_t initial_lvl1_pd_pool_used;
> +static struct lvl1_pd initial_lvl1_pd_pool[INITIAL_LVL1_PD_COUNT];
> +
> +static size_t initial_lvl2_lvl3_pd_pool_used;
> +static struct lvl2_pd initial_lvl2_lvl3_pd_pool[INITIAL_LVL2_LVL3_PD_COUNT];
> +
> +static size_t initial_lvl4_pt_pool_used;
> +static struct lvl4_pt initial_lvl4_pt_pool[INITIAL_LVL4_PT_COUNT];

The initial_lvl..._pool_used variables can likely all be __initdata?

> +static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
> +                                         vaddr_t map_start,
> +                                         vaddr_t map_end,
> +                                         paddr_t phys_base)
> +{
> +    uint64_t page_addr;
> +
> +    if ( map_start & ~PAGE_MASK )
> +    {
> +        early_printk("Xen _start be aligned to 64k (PAGE_SIZE) boundary\n");
> +        die();
> +    }
> +
> +    if ( phys_base & ~PAGE_MASK )
> +    {
> +        early_printk("Xen should be loaded at 64k (PAGE_SIZE) boundary\n");
> +        die();
> +    }
> +
> +    for ( page_addr = map_start; page_addr < map_end; page_addr += PAGE_SIZE )
> +    {
> +        struct lvl2_pd *lvl2;
> +        struct lvl3_pd *lvl3;
> +        struct lvl4_pt *lvl4;
> +        pde_t *pde;
> +        pte_t *pte;
> +
> +        /* Allocate LVL 2 PD if necessary */
> +        pde = pt_entry(lvl1, page_addr);
> +        if ( !pde_is_valid(*pde) )
> +        {
> +            lvl2 = lvl2_pd_pool_alloc();
> +            *pde = paddr_to_pde(__pa(lvl2), PDE_VALID,
> +                                XEN_PT_ENTRIES_LOG2_LVL_2);
> +        }
> +        else
> +            lvl2 = (struct lvl2_pd *)__va(pde_to_paddr(*pde));

I don't think the cast here (and similar ones below) is needed.

> +static void __init setup_partition_table(struct lvl1_pd *root)
> +{
> +    unsigned long ptcr;
> +
> +    /* Configure entry for LPID 0 to enable Radix and point to root PD */
> +    uint64_t patb0 = RTS_FIELD | __pa(root) | XEN_PT_ENTRIES_LOG2_LVL_1 |
> +                     PATB0_HR;
> +    uint64_t patb1 = __pa(initial_prtb) | (PRTB_SIZE_LOG2 - 12) | PATB1_GR;
> +    initial_patb[0].patb0 = cpu_to_be64(patb0);
> +    initial_patb[0].patb1 = cpu_to_be64(patb1);

Nit: Blank line please between declaration(s) and statement(s).

> +    ptcr = __pa(initial_patb) | (PATB_SIZE_LOG2 - 12);
> +    mtspr(SPRN_PTCR, ptcr);
> +}
> +
> +static void __init setup_process_table(struct lvl1_pd *root)
> +{
> +    /* Configure entry for PID 0 to point to root PD */
> +    uint64_t prtb0 = RTS_FIELD | __pa(root) | XEN_PT_ENTRIES_LOG2_LVL_1;
> +    initial_prtb[0].prtb0 = cpu_to_be64(prtb0);

Same here then.

Jan

