Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1644968DC8B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 16:08:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491303.760365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPZU-0007Xh-1I; Tue, 07 Feb 2023 15:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491303.760365; Tue, 07 Feb 2023 15:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPZT-0007Vx-Up; Tue, 07 Feb 2023 15:07:47 +0000
Received: by outflank-mailman (input) for mailman id 491303;
 Tue, 07 Feb 2023 15:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPPZS-0007Vp-Cr
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 15:07:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ca5a753-a6f9-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 16:07:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8314.eurprd04.prod.outlook.com (2603:10a6:10:249::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 15:07:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 15:07:42 +0000
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
X-Inumbo-ID: 2ca5a753-a6f9-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3VcYEcRSeKEjdJ/Y7RvZM95G4hpQXCQHZw24t3km4zVGV1IPYN11Zq//z4Xvd7y5bOkGSlu1+I6cO9B0JXwmdPmubCO96pYiuze7ZduMKyVC5WOgb6PiyyxKFZXexferTO9FtDgl5Yhe2kInqy67pi/3rIN21vvNyM+6dB2rj54hPLSLAPtDjEfF6kigoBx5bcsG8+hOVDF8w6qVGMBKZ5sWhsKRUQhgwlMi7vP3NzndwUf4z68O/1/urJdnKX4hmQeBlZMJATlcMIa96lPJbUdQNk3slI9qMRBllFxmCWs0eOkB7mixiIK22e6Q9KLpPOROyv4c8IsaaSFU6eodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRjNyhJB24lX2oEDBofRKsPL/nQHU2HOAqMzsG9bTZs=;
 b=JCPbxi86sWq008e27T8HV9N0CWog9dN0MHkv0Bq6GA4+lgw+tMNpE8Wt3u4AJ+CjbjvYtdZUmg25bMBWoO+eVx93xbdI9V4o03WCwH4C+O2E9q8razct7erDGHp1ta3mxKm4Qeqm3J/11Lg3jZ105ZteVs4GEtYA87+CeBz5Ipdhn7OFCe8p7aKFmPtNcrsGyrOsL8k50C2Ez7E800E0iEYofY82MhysQ4mmbpI4YpMPCkKhO9ML2RT0WUNv6d5PbUMP9MAsZogB1XuRxzQGjue5N46xRmTOp3HmbRYwZt8FD1ocFUXjKt7iWjF4j5cs7+wHXp0dRdYaxJyLfyDTqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRjNyhJB24lX2oEDBofRKsPL/nQHU2HOAqMzsG9bTZs=;
 b=Jvb+1/min/rRrNt+RKNRIuj9OjxcJ8bHVbD0ezKzCcTsAhGcUjG2CYMaMHRyWtSRDAFGMDYr8zfe8Zl69vrLbuUSewf9QLQDzSVeSdjJEp3XxVVevjj+cZc0O5gRg1pBlMLV88pVtaZcxzPakLaA69gpf/Z9UM257JlP5U+OWGbn/05A6t6mGS09EpNsDR2uQnbRXTjXNwnghyxBXy/bYW4hk3LD199VkHKnLBPaOiZDKBq48AIpbRMY4IEkAZEm2iCpZHT97Y3dJ+pANAqzts/Xjv8T8Fy3cZWWRebfwuKSPf0kA9qtt7E73rMvvu7SF6/t0RYE11im1t1Yi805zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bee6af5c-6000-461b-7642-2864d412e351@suse.com>
Date: Tue, 7 Feb 2023 16:07:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
 <404a4d6621a2e5eb276d2fa61188429294d682ba.1675779308.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <404a4d6621a2e5eb276d2fa61188429294d682ba.1675779308.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 153492c4-f394-48c4-9ed5-08db091d0f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hFBGseIWP5yPy9x+4m2tiDVPPsHwiMHN0RRl+8poBZO6Drv3odMTBBDtQC6ZmuAqmeSdCjMme/iK2nuMbeVkcpCs8h9cuAuOgTcsiKeJ/+Vqb8Utff4fu09cRn7Z7n/mzL+O81O0fJALBMD5cFo9b8Vl6SyOO9JFF14n9mvS7HiL+Nw50gStSsmGK4fGkzvAwye5+2a8d06npBSVBt4OzBf5ehlaQA+r3f/B2fCY8iEHwJxzlzL1GQb4j04w0GEB5EbHxy4ICFRXpZzldN5S1e+5ij/iaImFm7PIEfkdA/DS19dwH8VWgZcbO9jnddwOOEx2VkgoDtz9q+sHhCxYA2K2Wydrnc5N35LPux9gEn2gsm2nvur8zbm14nKTxP881F+AQALgKZfCIjeAMtkGXfrBG3hCztFxFotKzJ8Y5hd6YyG92UjlPXPhHDeykh4hB8Pcxmkd2+9yAKwG4W5OYwzbkC3rbTi02DYiPhCFQCRBQqzfsTr0R548OGXBs+TiI517ir//SD+owIwtyYO3Ir2l4zY27BiiaaTgwcodWEUVsMpUHrTtUQWFyDUja2d5slRHA6N60rfo/ygWH++u0/EndUJXX3UQ2ErmEBssfrrcGFgVA+bUmfbCjyAs445RrXn1QMKyNmmqycj2YobpHCnoyvZk4OOE+fXxGtMA267A6Dx2T/TDbbV0J2iMsmI/B9+ygrmEILAhTiAMx8HgDCSouBhhHUto3bNDGu/Rksc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199018)(6506007)(6512007)(186003)(26005)(6666004)(53546011)(36756003)(38100700002)(8676002)(54906003)(316002)(5660300002)(41300700001)(2616005)(8936002)(2906002)(83380400001)(66476007)(66946007)(31696002)(4326008)(6486002)(86362001)(478600001)(6916009)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OU1qaFBKN1hXRUtoZ3V6ZzY1NXVFcjdGdHRwTU9UaXNPTXl0WVp2dDNuQ3dO?=
 =?utf-8?B?ZmtyRkxldHFKdnZVZWp4NGR3RDVOSUNhYjJmd2gxM0pQNlo3YUpxdDl5eity?=
 =?utf-8?B?VEo4dW1JdUIvUjIwVDJzMUdRUDNnZEQwdWQrMGw0L0RTMXQ1cUduQUhRWDI5?=
 =?utf-8?B?c25xVzcrUEpvUWpmUVgzUElsMTM1WWV0WXd5aThRVGNnaTRWMGQrVE9TNHVt?=
 =?utf-8?B?YWtyL1lRZGlyQ2pGTXhzRXFFQkNySjVrRkVLbjRaTTRiWk0yZ0hsK3FMSnFX?=
 =?utf-8?B?WXRPSE9yTjA5TE9veStqTGNOYnhJYjhwQWlTbGp6ZWR1NXdlVjJQLzVPWENu?=
 =?utf-8?B?ZVQvWWIvRVdPa1UyTnVyUGZKbHZyQzVWcDdPNmVXWGp4czFxcEY4bkZDc3hX?=
 =?utf-8?B?elM4SlBtYmpGdFgrdml6MVoxeFRJOTlpMDJWYmlvcXpzUVVabURFek5IVWFE?=
 =?utf-8?B?N0RyNUkrWjUrU2dYNy8wallsRnRFdmRSbUo2SHIzTXRiRUFpNWVqcDR5Umwx?=
 =?utf-8?B?aDFIYms2WnY1ekppdmNsUTRDa2pyaWYvanVHRWxESUNjK0dITlJKejlxbzE3?=
 =?utf-8?B?b2JBZ0t6WGxFS09tbVYvWnNCYVAzTUhHRFQwb1dRRTBQcVd4WDNhWS9XLzd0?=
 =?utf-8?B?c0dpc2hvN0lPUitFak55UlZQdWtCd1B4MzgzVW5KQlBzZWd4ODFaaDlJaE1Z?=
 =?utf-8?B?THZOUnQ5UnZ3TkZSR3dqM2hkKzVvUmJDd1U1eW0yTWNXOE9TaU9zeVAvanlN?=
 =?utf-8?B?c0xpK21HanZLeW1NWC9NMnhGdFJHUkk4RzZBb01zZjZ0TnR3c2NUeVdYS3FO?=
 =?utf-8?B?R3lXME4rN2F5U24vaXlSRCtMNEFLKytTQU9XZS9rbVN1NGdEaHlzK1F0Lyti?=
 =?utf-8?B?QXg1TVdRK2R4OVE2elFzbHh4MWV2U0VsblZHVEZCZkphRk5aOTMyN0phaGtC?=
 =?utf-8?B?ZmxJWWppZC8xQ0R0aU5yTWlxeUxnd09PT3NjcWVDRElCdm5YUVBCYjBDL094?=
 =?utf-8?B?WWl5SXhINWt6aXkyYkIzVFJiVVdSbWdHakhWQ3Q5dUorRlVRVW9WUGVSNzhI?=
 =?utf-8?B?dWlOLy9SL3MvUGJJK1RmR2xGeVc0Y3o2cUlzNWJ5TkQ1dGdKZG5sVnE5dWcx?=
 =?utf-8?B?WlE3SzM0M0Qrc0puR1haU1RsMmZwcnI4ODlIL3pYQXQxcFczOWkrL3M4cWs5?=
 =?utf-8?B?ajllVzdHWk5YRFhqcStvVFZFTlpRMUpQYUJ3eGFrc0tCVkJUdXlDaDR2RHNi?=
 =?utf-8?B?dzR6bU5ybWZqVUFnZWJJZU9lbjNhWGlIQ2NuekdIajlQMTVpZkJDWTVQbHBM?=
 =?utf-8?B?Qlc1V3NLUmtaeHU3bEJVVkRWV0YzQnlST0NkbjA4dmRZKzVaUmlCU1NTSDdU?=
 =?utf-8?B?eHozczFma0wraWdOU0ZnbE5SalYxa3ZUQittQ0ZZeVg4MWVjYVZOZ2lvaDhl?=
 =?utf-8?B?S0FMZU9ocG5RMlNVSG9zTFNlZnVzZ1NxemxWaFd2VzhCVEwxeVREMVc0ZGJv?=
 =?utf-8?B?b0lVSml3QjJ3TURtK2wyK2hteWIrY3ViQVp5N2xPQWQ2NlAzdEFwNkpmdEZu?=
 =?utf-8?B?Szc4VmkwZWlFanhjOS9wSnpvdXBtS3ZpTUh5WXhBaVQ1S3dNb0wwMlVPVjUv?=
 =?utf-8?B?UFZqRi9zVC9PbUJTWjgyelpXNHhZSm5mdit4S2Z3U3BlTDZlbU94MWx0T0ow?=
 =?utf-8?B?OHZOdGZJNTFuaVpzbmxIa3pwVXVLNXQ5YVlycDhFd2Q1WThIS2RDYlh3eTdK?=
 =?utf-8?B?OENTSlEzU3ViQXE2VXhUSmw3aUFrY1crU2RWcFlMdEpxTGF2Y0xWbXhBcmo1?=
 =?utf-8?B?cDZ5OVJhTmFEVWJVa1B0bnhMNlRjMU9kUVY2WWFVakpQeG1NajRDME5HcmJz?=
 =?utf-8?B?dkhoRFR4b2NJOHB2ejZtWG9vVndHSlB4aGpBWVJMaEF3WExWbWlHalVxZTlD?=
 =?utf-8?B?WmtOVEZHZ1dIb1RxQzJkV0VJRDg0Ukk4VVozZ1hGYlRvMmM5b2tzdnNwOGFk?=
 =?utf-8?B?aE5LMUxhVnRWSTY1RUtkbHNiUnJpc2JQSHRWb0tYaEp3OTV0QldBdGJ5Wkhy?=
 =?utf-8?B?alpDMFM3djBZNHRTc1RGMEtyZCtHeUo0eHlSMGpzR3VHNzVVWmJSOXRJS3N6?=
 =?utf-8?Q?c5B5rExbRpmQvbJX21pE8WC48?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153492c4-f394-48c4-9ed5-08db091d0f52
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 15:07:42.0393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAm7gxsqfOeA2E6Yh7d+aot+pCxABU3QZquLIOxcjnO90Jn5zWfKmWsmfEgsu5p3CwVH2q9bV3V+AHG9hSqrVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8314

On 07.02.2023 15:46, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bug.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2021-2023 Vates
> + *
> + */
> +#ifndef _ASM_RISCV_BUG_H
> +#define _ASM_RISCV_BUG_H
> +
> +#include <xen/types.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +#define BUG_FN_REG t0
> +
> +#define BUG_INSTR "ebreak"
> +
> +#define INSN_LENGTH_MASK        _UL(0x3)
> +#define INSN_LENGTH_32          _UL(0x3)

I assume these are deliberately over-simplified (not accounting for
wider than 32-bit insns in any way)?

> +#define BUG_INSN_32             _UL(0x00100073) /* ebreak */
> +#define BUG_INSN_16             _UL(0x9002)     /* c.ebreak */
> +#define COMPRESSED_INSN_MASK    _UL(0xffff)
> +
> +#define GET_INSN_LENGTH(insn)                               \
> +({                                                          \
> +    unsigned long len;                                      \
> +    len = ((insn & INSN_LENGTH_MASK) == INSN_LENGTH_32) ?   \
> +        4UL : 2UL;                                          \
> +    len;                                                    \

Any reason for the use of "unsigned long" (not "unsigned int") here?

> +})
> +
> +/* These are defined by the architecture */
> +int is_valid_bugaddr(uint32_t addr);

A function by this name very likely wants to return bool. Also -
uint32_t (not "unsigned long") for an address?

> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -1,6 +1,6 @@
> +#include <xen/bug.h>
>  #include <xen/compile.h>
>  #include <xen/init.h>
> -
>  #include <asm/csr.h>
>  #include <asm/early_printk.h>
>  #include <asm/traps.h>

I think it is good practice to have a blank line between xen/ and asm/
includes.

> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -8,6 +8,7 @@
>  #include <asm/early_printk.h>
>  #include <asm/processor.h>
>  #include <asm/traps.h>
> +#include <xen/bug.h>
>  #include <xen/errno.h>
>  #include <xen/lib.h>

Perhaps wants adjusting earlier in the series: Preferably all xen/
ahead of all asm/.

> @@ -97,7 +98,136 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>      die();
>  }
>  
> +void show_execution_state(const struct cpu_user_regs *regs)
> +{
> +    early_printk("implement show_execution_state(regs)\n");
> +}
> +
> +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
> +{
> +    struct bug_frame *start, *end;
> +    struct bug_frame *bug = NULL;

const?

> +    unsigned int id = 0;
> +    const char *filename, *predicate;
> +    int lineno;
> +
> +    unsigned long bug_frames[] = {
> +        (unsigned long)&__start_bug_frames[0],
> +        (unsigned long)&__stop_bug_frames_0[0],
> +        (unsigned long)&__stop_bug_frames_1[0],
> +        (unsigned long)&__stop_bug_frames_2[0],
> +        (unsigned long)&__stop_bug_frames_3[0],
> +    };
> +
> +    for ( id = 0; id < BUGFRAME_NR; id++ )
> +    {
> +        start = (struct  bug_frame *)bug_frames[id];
> +        end = (struct  bug_frame *)bug_frames[id + 1];

Nit: Stray double blanks. But I'd like to suggest that you get away
without casts here in the first place. Such casts are always a certain
risk going forward.

> +        while ( start != end )
> +        {
> +            if ( (vaddr_t)bug_loc(start) == pc )
> +            {
> +                bug = start;
> +                goto found;
> +            }
> +
> +            start++;
> +        }
> +    }
> +
> + found:
> +    if ( bug == NULL )
> +        return -ENOENT;
> +
> +    if ( id == BUGFRAME_run_fn )
> +    {
> +        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
> +
> +        fn(regs);
> +
> +        goto end;
> +    }
> +
> +    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
> +    filename = bug_file(bug);
> +    lineno = bug_line(bug);
> +
> +    switch ( id )
> +    {
> +    case BUGFRAME_warn:
> +        /*
> +         * TODO: change early_printk's function to early_printk with format
> +         *       when s(n)printf() will be added.
> +         */
> +        early_printk("Xen WARN at ");
> +        early_printk(filename);
> +        early_printk(":");
> +        // early_printk_hnum(lineno);

What's this? At the very least the comment is malformed.

> +        show_execution_state(regs);
> +
> +        goto end;
> +
> +    case BUGFRAME_bug:
> +         /*
> +          * TODO: change early_printk's function to early_printk with format
> +          *       when s(n)printf() will be added.
> +          */
> +        early_printk("Xen BUG at ");
> +        early_printk(filename);
> +        early_printk(":");
> +        // early_printk_hnum(lineno);
> +
> +        show_execution_state(regs);
> +        early_printk("change wait_for_interrupt to panic() when common is available\n");
> +        die();
> +
> +    case BUGFRAME_assert:
> +        /* ASSERT: decode the predicate string pointer. */
> +        predicate = bug_msg(bug);
> +
> +        /*
> +         * TODO: change early_printk's function to early_printk with format
> +         *       when s(n)printf() will be added.
> +         */
> +        early_printk("Assertion \'");
> +        early_printk(predicate);
> +        early_printk("\' failed at ");
> +        early_printk(filename);
> +        early_printk(":");
> +        // early_printk_hnum(lineno);
> +
> +        show_execution_state(regs);
> +        early_printk("change wait_for_interrupt to panic() when common is available\n");
> +        die();
> +    }
> +
> +    return -EINVAL;
> +
> + end:
> +    return 0;
> +}
> +
> +int is_valid_bugaddr(uint32_t insn)
> +{
> +    if ((insn & INSN_LENGTH_MASK) == INSN_LENGTH_32)

Nit: Style.

> +        return (insn == BUG_INSN_32);
> +    else
> +        return ((insn & COMPRESSED_INSN_MASK) == BUG_INSN_16);
> +}
> +
>  void do_trap(struct cpu_user_regs *cpu_regs)
>  {
> +    register_t pc = cpu_regs->sepc;
> +    uint32_t instr = *(uint32_t *)pc;

You still read a 32-bit value when only 16 bits may be accessible.

> +    if (is_valid_bugaddr(instr)) {
> +        if (!do_bug_frame(cpu_regs, cpu_regs->sepc)) {

I'm pretty sure I did point out the style issues here.

> +            cpu_regs->sepc += GET_INSN_LENGTH(*(uint32_t *)pc);

Why would you re-read the insn here, when you have it in a local variable
already?

Jan

