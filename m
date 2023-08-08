Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B3E77393F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 11:12:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579486.907474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIlB-0007DH-9B; Tue, 08 Aug 2023 09:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579486.907474; Tue, 08 Aug 2023 09:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIlB-0007AU-6R; Tue, 08 Aug 2023 09:12:13 +0000
Received: by outflank-mailman (input) for mailman id 579486;
 Tue, 08 Aug 2023 09:12:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTIl9-0007AO-He
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 09:12:11 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe16::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a62d6030-35cb-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 11:12:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8975.eurprd04.prod.outlook.com (2603:10a6:102:20e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Tue, 8 Aug
 2023 09:12:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 09:12:05 +0000
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
X-Inumbo-ID: a62d6030-35cb-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mt3l1naRyE0uTbediYkK65YJJvvV6onIAvSzlxo9IAx5UEm79u8D91/Bw3ZLeh7weoGwc4eZ4r06QEOnAkFPnXQG9v5j0WA9Rnztt3NjceTR8ofdoN6cLMjZreaymosMsMpNIMdOrqw47KuZqufGoMvkAREAtZPEls0oaTqSWQfOau042QFiq0s5zH9kGlxjMVQW86bpuoAQLZkGBC+N4w+hras2DirQ8luN8Fp7ZJDrXdM2WOLV9nWTESW6JLRikwnJaE8QXaLpRD66sDhyn3uVe09ukOjzu2euJX1vrDziPcAoVnncUFB4s7eaLmR4bJfvyfTBbH8t9y3Ee1EiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRMrlbTsrT8329VDgQBLi4g1G38EtH7AKmj/hwaLD3w=;
 b=atvhuv4Dw8UD7BsriRAWu9RBUx02k1LKJ3fWu0fcZHKBMM8GbGfKPTW1Kms7zQCbmHB2Fg7y5N1r671CEnYY+NcYDaMhRvRQVDhjcV2dJNMmUTBR0yEYpgtPRtWtt9ky5tRBrOni8VAi0yQyn1I9JLaHsf/J2bTA5XWMKCeB/iWbRsF5zQURD88JqCUbHmPlwvYJp+lDWRZj4yB5ZYVhgMWbvOy6eV6Ap7Ax2Nrg12ALz+TRP8TLyDSzM66oQI3mprq/VsLaxcizVYWMtjaDlEwW6jaDZ69V8bMTUjOytGNcaKljn7TwoxkK03cOa/DtyFziPbhshHOotS9QfMZhLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRMrlbTsrT8329VDgQBLi4g1G38EtH7AKmj/hwaLD3w=;
 b=pZEWDjhWbXpKGZor7BejrUo0iWs9R2/llL9mCW04g4JjB4Bi5hUguC26lgG52ZHFC9LzcgtApvrxR0yuGKV/QpC0d3/1BkhLYBRWYEEwaIUY8qegF4lHI/j4qotVSAYlPUH676ga1w3cRbBRr3ML7zRHEV/ivWmkacxqkeSIPXMro5hZtDywAStSQ9CmCKhGxv/Vm3/lh3qVyyslIHVTshF3RgXkGSrKQ1eSWsILOVy9QfEibsRWOtv3i0bxr38Usf9lJqVxwd+P44Jup6RGqBHPaVEqvh3vJYAf42zG/1mHUNCSaPPBsPatKNakWsawgDxTWW8NUuZM31Uq+6+iGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aaabc5d0-aa69-5c30-8e49-635537868346@suse.com>
Date: Tue, 8 Aug 2023 11:12:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 5/9] xen/ppc: Define minimal stub headers required for
 full build
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <9cd545a4a9ef55d06ea0b81044e22f64ee42823e.1691016993.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9cd545a4a9ef55d06ea0b81044e22f64ee42823e.1691016993.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: b6168f74-adc9-43de-e2f3-08db97ef88cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GCX4RmUeHBkwICcTeu3Ek63MnEu+q0UGaubuG/zhdw07h1ACQ64Dcu2JUYMZBIWLTSMd1B06tp6R/kRzjRoSFdSv9xL2Yju85r9CpifmMfDQ/lPjeDE1GaF1tdeSYKRddAgpOuhoH1hv5J0bgqpJdxl928g6TbXMSjAsBSLKzCjZUMovAwtAxzE/SxYg9ZwKJ++GTznn4+ugkGS8QDk5lZDeLEFAA9dTyVQ4nObgtIdpRHMt1x2nz4C7HmYDnwMgwcG5HBjH2I/TdsMKOqXvY8/hRzCkQpO4lRAmRe43ffguOQH/s8nzIVHGuy1HXH0sKCtasFEuHRHTqEhwn5lJmrDKOMuU2vVTAYHvpzkN9KxvPAqaYbq6KOu4S82XFvaNDJTbGpAQ9KIkhCz4dILueLAy28iARLtb0hXzLaDW/bgf3io/42fIiLjpipSzKb9EZKsqIAjNIhd9HaU9Kg2xdhMI6xBC1KX62nVv5Q7HW3i21u8EukV6XolIP/cFft2glNVTOhChszktuFoz79PTjfgEE6sGXK473ch7PJUQf8XYJGi/xtp2nXWRiYqBDSrCrlvVuYGmgJD16BXAlhSzWk/TqL6KF6Ht0A/RRCEWC1us5RlZtzVTv0wGKvVzOlgU4DbWaiK41WEo0gUeEGTEAP3wsXH0AVVVu5mjI9vC7rw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199021)(1800799003)(186006)(2616005)(36756003)(4326008)(6512007)(316002)(6916009)(86362001)(6506007)(54906003)(6486002)(66946007)(38100700002)(6666004)(66556008)(478600001)(66476007)(31696002)(53546011)(41300700001)(26005)(8676002)(8936002)(66899021)(2906002)(30864003)(83380400001)(5660300002)(31686004)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVZZSDdkM0NpeGR5OWNFYytmTGhMUjlueEpXWHcxM3h2aFFETzRsL0lzdVN3?=
 =?utf-8?B?aUt2dC9xUjhTd0dyUTEvWU00MW16ejArU0FFMkFqUVo1WmZuUVZaQUFVT1Bu?=
 =?utf-8?B?OXgwdFZvbGxIMVUzdDdNM1lsRjRMdkdkWWRmRXl1RmRLQkhxa2gyeTF5ZG0v?=
 =?utf-8?B?UnhQdHZtRmNXOGhhTVBvMFkvZGlHL1ZNdURVQjRteVpUOXBTcXpORE9TdjJz?=
 =?utf-8?B?bFIzc0NhaWowMFZIK0VDMThBZnI3T1AwbFBHaGJvQTRDMUF6ZEZKVWVBT0w4?=
 =?utf-8?B?Q0NmTzR1cXV1T2NyTmU3K3ovQUgvbFJpZTZheEtSTlFSTmxyUGN1NWpLeEEy?=
 =?utf-8?B?WTZqbE84c3hEbTFuUFAwZzJRbWp5R2ppQjBmV1RFQWZ4aktjRnYxU2NuOGZJ?=
 =?utf-8?B?Qk5FbkkrZEc1WTRmZkd4Z25yWE5iVWNJaGV0RU93YUt6Rkk1Z2JEL1lkRDQ5?=
 =?utf-8?B?OG1LcStaUFlxR245dk5SNEIxOTQrVUZpd2ZXMXdMY05kMkpzWTkyU0hINnoz?=
 =?utf-8?B?Z3R5d3h6VWpqTkM3VmsrUm9BTkFOaHhQTFluZnZYd0o2bFZrUjJHUEIrbDJ3?=
 =?utf-8?B?Qk1kM3oveTR2aWFSQ3RHV3dGaE8vRzBIZ3ZFVzgvdmR1amJHSENVN21Sd3M4?=
 =?utf-8?B?MkhVdXdwRzJZdlJobHpqOC9uZ2U5YWxmeWt5cDMzdHhmZ0F4U2xQNUFRVmVT?=
 =?utf-8?B?WWt4ZmsxTWM5L3hPNkdsSm1YeDdDNGpWMjZaZjN2YUxZSTNaaGdpL2FRcDkv?=
 =?utf-8?B?eGhPVy8wZWRjNFE0bjA3VVp3N1pGTTYwNzg5VFFQMnVZNHZybjFqNGYzWFhT?=
 =?utf-8?B?VmVRVXBJUzVpV2dQd2tFaWJhbm5YVmcwdFo3NWE5ZlMyckE5OWE5eFQwZkxh?=
 =?utf-8?B?Y2k5RFgyVXErN2czWFFBYjE0b1VhQ0lHYzZhSkw1QjNVRnhCelcyN25qdkJC?=
 =?utf-8?B?ZnFVWFprWXFlNkJMckU4RmxSNUNLQWRTc2dRZ3BjTTZCSHE0ZStZVVBZdzM1?=
 =?utf-8?B?S0h2UENVSHZYZVIrWWh4S0VlbG1DMGpZZGpqN2hxUGUyRHNkbjhlOENxWGx1?=
 =?utf-8?B?TWtXakpMM296M1N2b21kbXI3TmVvZUlXazFFOHZ2M3l0Qkt2NGh2TWt3eHBi?=
 =?utf-8?B?d0xONWtmcGF2c1JmN3M4dVFkMmROUnBQamcxTjI3dDZjTmZlWFFSd05TZ2Vr?=
 =?utf-8?B?NUdTeHMvQzZPS0s3a2llQmpGZ01Gc1M5N1E5dGQ0cndhMCtlNitjWUtZbnpV?=
 =?utf-8?B?aWtlL05jUnZlNUFWUlM1aktsTXVsWW9uYVQ3TTRMc3k2ZUJKQml2Tk1PYndX?=
 =?utf-8?B?QXJRclZFbkNjZTNMd0JoalNxWkNORkozTjlpcGNuVTZGRzNBSUNNb3hLS2xP?=
 =?utf-8?B?SFdta1VRV3NRczBpYi94K0dqN2xJc1FFcGpwRkpOZ2F2Z1VqYmZqWGR6cGxT?=
 =?utf-8?B?M0FUTmJHaWRmYkZSN0diUHViSXVvVTRGUUp4MVVsc25UcVZsWENkUGRhbjdK?=
 =?utf-8?B?OG9GWU1xWlhDRmFJYWlMZ1c4WWU2Q0pQTWNRamRwdE1ZMmpsM0RFcXBaZlhz?=
 =?utf-8?B?VFc2Y2wrZTZoeXVQYmxLbjBreGlMczhWRlpFVDdsZHdraDFHbXRDUjh5eGdh?=
 =?utf-8?B?Mm0ya2E0MDFCTXNDVGlVUDBGWjhSWDFDbjhwZW1zL3dIa3U4WXIzdDR4RGhn?=
 =?utf-8?B?MWJDbnpka3lyR3dCbU94c2Ixb3ZDR3JwL1JwL2dvMHpUUkFXMHpCRTJ6eHBw?=
 =?utf-8?B?Qys2MFB2M0wweGEwMTY4SmpQVmJaL2JuTEpRWkpMaXFJVDRmNks1MmpMZFZw?=
 =?utf-8?B?RGtJYzNObHlpNW1mZkxyZy8wUnZRTUhibVFjNGE5SHV0V0s1UlA2ZU9YbkIx?=
 =?utf-8?B?SG04N25FaGt0bXRzcVFhS1VHOXg5RDhGUlNkcUFpY2lMRGM0czI5WThxTURV?=
 =?utf-8?B?aG5ScnY3UWUwYXB4SzB5Z0ZZeUdCbFZoOGxjbGpUdkF5U045MUI1U1p0T2V1?=
 =?utf-8?B?REtFdzRFNmRPZDJGTFN4RG5GOUlmdXBRYzBQVnlWNGU2Mk9oSDFKbnJ6ZTJm?=
 =?utf-8?B?cFEycm1KdlFDaC9IRU1mSWVLTjRnd0ZmSncrajhZaGRsZDRSN1ZxTDhna2Nh?=
 =?utf-8?Q?/y+qreG9Sl24ZIxP14JxoN9Pd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6168f74-adc9-43de-e2f3-08db97ef88cc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 09:12:05.2898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 905/h8N/aZEQ+6MdtXIM/5LpBRy4lSc23As8rhkfWCk7lFkU9QK9DISxCgJ+Z8R7oPj9Bq2AIuKOVzkUPyb+Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8975

On 03.08.2023 01:03, Shawn Anastasio wrote:
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/altp2m.h
> @@ -0,0 +1,39 @@
> +/*
> + * Alternate p2m
> + *
> + * Copyright (c) 2014, Intel Corporation.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */

Please use an SPDX header instead in new code. I also wonder about the
Intel copyright. I realize it's that way in the Arm header that you
apparently copied, but even there it's pretty odd. I don't think such
a pair of stub functions is reasonably copyrightable.

> +#ifndef __ASM_PPC_ALTP2M_H__
> +#define __ASM_PPC_ALTP2M_H__
> +
> +#include <xen/sched.h>

I don't think this is needed here (nor in Arm's original). All you
need are forward decls of struct domain and struct vcpu. And
xen/bug.h plus xen/types.h.

> --- a/xen/arch/ppc/include/asm/bug.h
> +++ b/xen/arch/ppc/include/asm/bug.h
> @@ -4,6 +4,7 @@
>  #define _ASM_PPC_BUG_H
>  
>  #include <xen/stringify.h>
> +#include <asm/processor.h>
>  
>  /*
>   * Power ISA guarantees that an instruction consisting of all zeroes is
> @@ -15,4 +16,10 @@
>  
>  #define BUG_FN_REG r0
>  
> +#define BUG() do { \
> +    die(); \
> +} while (0)

This looks like it's temporary. I think any construct that later needs
updating wants marking in some common way (such that it's easy to grep
for items left to be dealt with; you have such a comment in e.g.
asm/event.h). Of course if an entire header consists of _only_ stubs,
perhaps a single such comment would suffice.

> --- a/xen/arch/ppc/include/asm/cache.h
> +++ b/xen/arch/ppc/include/asm/cache.h
> @@ -3,4 +3,6 @@
>  #ifndef _ASM_PPC_CACHE_H
>  #define _ASM_PPC_CACHE_H
>  
> +#define __read_mostly __section(".data.read_mostly")

Not something for you to do, but we really want to move this to
xen/cache.h.

> diff --git a/xen/arch/ppc/include/asm/desc.h b/xen/arch/ppc/include/asm/desc.h
> new file mode 100644
> index 0000000000..e69de29bb2

Along the lines of the above - common code should not include this
header, and Arm shouldn't need one either. I'll see if I can sort
this.

> --- a/xen/arch/ppc/include/asm/mm.h
> +++ b/xen/arch/ppc/include/asm/mm.h
> @@ -1,19 +1,270 @@
>  #ifndef _ASM_PPC_MM_H
>  #define _ASM_PPC_MM_H
>  
> +#include <public/xen.h>
> +#include <xen/pdx.h>
> +#include <xen/types.h>
>  #include <asm/config.h>
>  #include <asm/page-bits.h>
>  
> +void setup_initial_pagetables(void);
> +
> +extern unsigned long total_pages;
> +
>  #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
>  #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
> +#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
> +#define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
> +#define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
> +#define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
> +#define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
> +#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)va))
> +#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
>  
>  #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
> -#define maddr_to_virt(pa) ((void *)((paddr_t)(pa) | XEN_VIRT_START)
> +#define maddr_to_virt(pa) ((void *)((paddr_t)(pa) | XEN_VIRT_START))
>  
>  /* Convert between Xen-heap virtual addresses and machine addresses. */
>  #define __pa(x)             (virt_to_maddr(x))
>  #define __va(x)             (maddr_to_virt(x))
>  
> -void setup_initial_pagetables(void);
> +/* Convert between Xen-heap virtual addresses and machine frame numbers. */
> +#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
> +#define __mfn_to_virt(mfn) (maddr_to_virt((paddr_t)(mfn) << PAGE_SHIFT))
> +
> +/* Convert between Xen-heap virtual addresses and page-info structures. */
> +static inline struct page_info *virt_to_page(const void *v)
> +{
> +    BUG();
> +    return NULL;
> +}
> +
> +/*
> + * We define non-underscored wrappers for above conversion functions.
> + * These are overriden in various source files while underscored version
> + * remain intact.
> + */
> +#define virt_to_mfn(va)     __virt_to_mfn(va)
> +#define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
> +
> +#define PG_shift(idx)   (BITS_PER_LONG - (idx))
> +#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
> +
> +#define PGT_none          PG_mask(0, 1)  /* no special uses of this page   */
> +#define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
> +#define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
> +
> + /* 2-bit count of uses of this frame as its current type. */
> +#define PGT_count_mask    PG_mask(3, 3)
> +
> +/* Cleared when the owning guest 'frees' this page. */
> +#define _PGC_allocated    PG_shift(1)
> +#define PGC_allocated     PG_mask(1, 1)
> +/* Page is Xen heap? */
> +#define _PGC_xen_heap     PG_shift(2)
> +#define PGC_xen_heap      PG_mask(1, 2)
> +/* Page is static memory */
> +#define PGC_static     0

You don't need this.

> +/* Page is broken? */
> +#define _PGC_broken       PG_shift(7)
> +#define PGC_broken        PG_mask(1, 7)
> + /* Mutually-exclusive page states: { inuse, offlining, offlined, free }. */
> +#define PGC_state         PG_mask(3, 9)
> +#define PGC_state_inuse   PG_mask(0, 9)
> +#define PGC_state_offlining PG_mask(1, 9)
> +#define PGC_state_offlined PG_mask(2, 9)
> +#define PGC_state_free    PG_mask(3, 9)
> +#define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
> +/* Page is not reference counted */
> +#define _PGC_extra        PG_shift(10)
> +#define PGC_extra         PG_mask(1, 10)
> +
> +/* Count of references to this frame. */
> +#define PGC_count_width   PG_shift(10)
> +#define PGC_count_mask    ((1UL<<PGC_count_width)-1)
> +
> +/*
> + * Page needs to be scrubbed. Since this bit can only be set on a page that is
> + * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
> + */
> +#define _PGC_need_scrub   _PGC_allocated
> +#define PGC_need_scrub    PGC_allocated
> +
> +#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
> +#define is_xen_heap_mfn(mfn) \
> +    (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
> +
> +#define is_xen_fixed_mfn(mfn)                                   \
> +    ((mfn_to_maddr(mfn) >= virt_to_maddr(&_start)) &&           \
> +     (mfn_to_maddr(mfn) <= virt_to_maddr((vaddr_t)_end - 1)))
> +
> +#define page_get_owner(_p)    (_p)->v.inuse.domain
> +#define page_set_owner(_p,_d) ((_p)->v.inuse.domain = (_d))
> +
> +/* TODO: implement */
> +#define mfn_valid(mfn) ({ (void) (mfn); 0; })
> +#define max_page ((unsigned long )0)

It's clear this is temporary, but it would still be nice if you could
omit stray blanks.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/monitor.h
> @@ -0,0 +1,48 @@
> +/* Derived from xen/arch/arm/include/asm/monitor.h */
> +#ifndef __ASM_PPC_MONITOR_H__
> +#define __ASM_PPC_MONITOR_H__
> +
> +#include <public/domctl.h>
> +
> +#include <xen/sched.h>
> +#include <public/domctl.h>

Judging from the contents of the file, you don't need either (and you
certainly don't need public/domctl.h twice). Only xen/types.h looks to
be needed right now.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/numa.h
> @@ -0,0 +1,26 @@
> +#ifndef __ASM_PPC_NUMA_H__
> +#define __ASM_PPC_NUMA_H__
> +
> +#include <xen/types.h>
> +#include <xen/mm.h>
> +
> +typedef uint8_t nodeid_t;
> +
> +/* Fake one node for now. See also node_online_map. */
> +#define cpu_to_node(cpu) 0
> +#define node_to_cpumask(node)   (cpu_online_map)
> +
> +/*
> + * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
> + * is required because the dummy helpers are using it.
> + */
> +extern mfn_t first_valid_mfn;

At least "Arm" wants replacing in the comment, I think.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/percpu.h
> @@ -0,0 +1,26 @@
> +#ifndef __PPC_PERCPU_H__
> +#define __PPC_PERCPU_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/types.h>

Looks like nothing in the file requires this.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/procarea.h
> @@ -0,0 +1,38 @@
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

SPDX again please (and there's at least one more below).

> + * Copyright (C) IBM Corp. 2005
> + *
> + * Authors: Hollis Blanchard <hollisb@us.ibm.com>
> + */
> +
> +#ifndef _ASM_PROCAREA_H_
> +#define _ASM_PROCAREA_H_
> +
> +#include <xen/types.h>

Again nothing looks to require this.

> +struct vcpu;
> +struct gdb_state;

The later of these is unused below. The former is used, but in a way
that would require a forward decl only in C++.

> --- a/xen/arch/ppc/include/asm/processor.h
> +++ b/xen/arch/ppc/include/asm/processor.h
> @@ -110,6 +110,10 @@
>  /* Macro to adjust thread priority for hardware multithreading */
>  #define HMT_very_low()  asm volatile ( "or %r31, %r31, %r31" )
>  
> +/* TODO: This isn't correct */
> +#define cpu_to_core(_cpu)   (0)
> +#define cpu_to_socket(_cpu) (0)

As mentioned elsewhere, please try to avoid leading underscores in
macro parameter names (or macro local variables, just to mention
it again in this context).

> @@ -175,6 +179,8 @@ static inline void noreturn die(void)
>          HMT_very_low();
>  }
>  
> +#define cpu_relax() asm volatile ( "or %r1, %r1, %r1; or %r2, %r2, %r2" )

Just like HMT_very_low() this could do with a comment explaining
the "interesting" ORs (until such time when the assembler supports
suitable mnemonics).

> --- a/xen/arch/ppc/include/asm/regs.h
> +++ b/xen/arch/ppc/include/asm/regs.h
> @@ -23,6 +23,8 @@
>  #ifndef _ASM_REG_DEFS_H_
>  #define _ASM_REG_DEFS_H_
>  
> +#include <xen/types.h>
> +
>  /* Special Purpose Registers */
>  #define SPRN_VRSAVE 256
>  #define SPRN_DSISR  18

Why would this #include be needed here all of the sudden?

> --- a/xen/arch/ppc/include/asm/system.h
> +++ b/xen/arch/ppc/include/asm/system.h
> @@ -1,6 +1,247 @@
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
> + *
> + * Copyright (C) IBM Corp. 2005
> + * Copyright (C) Raptor Engineering LLC
> + *
> + * Authors: Jimi Xenidis <jimix@watson.ibm.com>
> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
> + */
> +
>  #ifndef _ASM_SYSTEM_H_
>  #define _ASM_SYSTEM_H_
>  
> -#define smp_wmb() __asm__ __volatile__ ( "lwsync" : : : "memory" )
> +#include <xen/config.h>

As mentioned before - any such #include you find is a leftover.

Jan

