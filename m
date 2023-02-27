Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8918B6A4223
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 14:00:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502525.774384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWd6a-0007Aj-4j; Mon, 27 Feb 2023 12:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502525.774384; Mon, 27 Feb 2023 12:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWd6a-000790-1M; Mon, 27 Feb 2023 12:59:48 +0000
Received: by outflank-mailman (input) for mailman id 502525;
 Mon, 27 Feb 2023 12:59:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWd6Y-00078u-Sh
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 12:59:46 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b0decbe-b69e-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 13:59:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8157.eurprd04.prod.outlook.com (2603:10a6:102:1cf::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 12:59:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 12:59:42 +0000
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
X-Inumbo-ID: 9b0decbe-b69e-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1DjpUu3XhQlQRL1rOcosIURm5PqZCZMcB85vGZ37GPi68dpLaXI7n9plRCZB6wtXU5LOprCk75Cvi/2pj3zBRL2gAoyhtOGEzG71E1JIX4bPhyGrfi1Di+h2guOS8rqX0+nDa3AjRMTCpVREa8CYs9pEoquOX3n7oBW9Ml275yhDaMLJ2230zWhuISgE6llaVZOpTNzH9oQHIzLS7TqGTSa5IUxZoRcieAG1cKbBfTWM3uFykYBNrJrlcJRKHKcVIQMHzpa+29R1C3g2Cr/wySRVmP6JDW3qYkaJZY3mI4HdJsE4ncH8StEcqMbMTpWFPjZwjwZwmvcNwFQb6wX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DXSdKd3X+qzOivtOx+KjZGsCNTdb+md9yZwlgSL4tg=;
 b=avJ8080/tnvj0AXax27gasA9ObU2V0OInpgTUJZIPYTrXHcZjZV8SHDDfnkmdMlYeMiRK9/ZN1/1yh5mA+6T3Ifr9914CKiB8jbyc7lCpZI/E+csvKluoGHNjaMmMF7yir9ItCe73yabAmznNrhhN+x3SYjPVUjTTgmg5MCSMHZKi49ImL1eHzXjxLL1odIQSEBhhpqrvI6H0TmF9ba2ExnojhQZwvoa4q8gR9tabVk3A2ofFSd9kAjL0FpEU1idGz8RxXgtmkx6s+MZkRwsKw3UMMhL2vGQPMIX3B4Ol8mcNK4iIpFD88NtxIlAVjsJyqDCkFfFpgvhqEkHTbET/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DXSdKd3X+qzOivtOx+KjZGsCNTdb+md9yZwlgSL4tg=;
 b=gKduNm1gMkp1t+jrzI5Py8WuOkUvEJB6w8N3qbM8ECx1PgIPW8yxRrd6rDeB2JuBLIooeeL59u7EmDuoIgmAoSPPsgdrFS5zfv9Sf/u/dj2UolJZ+bGwmb842/vVKX1ejVlCUOpqu95GvbOSt56AiAkLO0d5lEfhLY7Gaw0zQBZ6+sBmRw2JgA0+dUPvCHWSoyKg3DvdIzH8VsKz2Oui/dzo9LT+gLd6k4uGtZWsZqO6K87NPPHKv54kPweQfsUiZdXD4WxOKcY1ICdR0jGCoaDHi8YrHnqs5ffOK5fGSqiyJ2/fRL/9gZ1MBJDd7KKUWkKAU+b0J6/TbkQwAJb5oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e34c0315-dfd0-c176-52bf-64780befedb0@suse.com>
Date: Mon, 27 Feb 2023 13:59:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/5] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
 <a70ce0599da9549b5c4e601e5b410cfec5fc185b.1677237653.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a70ce0599da9549b5c4e601e5b410cfec5fc185b.1677237653.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf8ff11-a731-43df-65a6-08db18c27dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MhonGME4Ofs7v+0NmnzECS2avaEkc2rQUBlFpOF9JI3gw5Ssyu4Z6YoYYgtYJfWzrTpKC/kDr3C/cuqCg4yDBVTWYjBnw5wybJsSk3NjVrXRcaDnEStNIrY82/dFERPpM5fRnODTdTaJxcelvIOkmRO/mv8JGQ2VFol0bSccueJ4BNnu44hHtl1n3dGpdlopU/KVa2M+dytAQvAsZ6dqvnKatoQ2ofn14EXksHo7pucCisL4Uc7Gc040kDPifgptEmxEjl8U9MlQd8HOqo5XUWC/ubDb4NF4+lMd9+K73Zq4hB6vh8qivaZStTALZygh8EzXBgNSZfBABvKHOb29B1w7CTqSAST3QOk7KYoZ5/YsE5kb0tl16Zlb0pEKYrmWOPwimOMhUPLTB2ElQ9xpJwkAGn05aQRplO7hUdpFrVekt1CX0KFkqJApnhE0BEietDKqxbv8Zw7RC7cbxb6Xk6K9RFo761ttPx+rEAIjAlj3sisLL59hcjFXJdK+BhH8GzrUVVfmG2UlL3bH8Vg9bc5V/eCgY28ffJ/LqOFJSzf5frhe04BU12vqzg94Lkhwums23ounRX3E1sGqh9vH8O9Awf08WWpd6NSHcDvLMOicZ37oVquakMnfGlnXyekiAsOrkhVxqQyvc+xhLLOtN1dUDsoPmME6GlHNWcOkpOkRjvsIMJXdhhPJD6PwF+5UzgPhcYm05Cbn48r4wyn5Tojadh10EA8p8uKyPnt9T8k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199018)(31686004)(2616005)(316002)(36756003)(86362001)(31696002)(54906003)(6486002)(186003)(5660300002)(8676002)(4326008)(66476007)(6916009)(8936002)(2906002)(66946007)(41300700001)(6506007)(478600001)(53546011)(26005)(6512007)(66556008)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2huMUJqZXd1QkRqN0N6eU4zd2ZQSmRGKzJGSUQySlRVYTlDeElPV1JnZ2RX?=
 =?utf-8?B?Ri95cFcvc09HVjlYczJUa2pLWUZyUUNNbWdIU0N1anV5SWg3Y3FMZnU2T2JV?=
 =?utf-8?B?dTJnMWJXNkNpK2x2aEttYWdCalF4V0x4eEsvTzBRUW84ZGpiTHlRZUlZMzBm?=
 =?utf-8?B?QS9FeFZ2WVBoYXdseG1uK1IxMGk1eUV2VGd6QkJJR2I2WVZiekpKcFhiQlBN?=
 =?utf-8?B?L0txcy9DR3RVN2U2dyswRUxnSTN5MlRBWk95Sm9BKy8zUHI4MGY4UmRwRDEw?=
 =?utf-8?B?L0k1b0xyMnBjWkJNK1BFSUpZRjhPZDQvSzVPRlZQWUNWTEZBZ1R1L08yS0hk?=
 =?utf-8?B?L0c4TGFEL3FQYytITUp4QVlYc1B3alBHaUIzS2tVWGk0bEJHcW1DMmU5aTYy?=
 =?utf-8?B?UjRhTWcxbGpkRXJLLzhiV1pXdjJIZDhHY25lVm53NTcxSmFkQ2dIcVR4S3ha?=
 =?utf-8?B?bGhFdVR1MjR1bFp5c2ZXN2k3Wnd1RElRUlhESmpYS1k0bjJ0TzNlQzFjUDgv?=
 =?utf-8?B?VHdxUHd3QTZMQS9NOGxWb1J6U1RXY0FEcG1sa2JLK2hNSk5oeU92N3VVVHMv?=
 =?utf-8?B?QkpVL0JPdHk1dkJQa1RvZnZMTHJxMHJ5UlozOXhuUUREZnU5WU02bzNYdlRD?=
 =?utf-8?B?SVREbVdXQ1h2ZTByM3ZYaTFLcTB5V0JiSlZwSjVXVGZubEt6WHVaRDhTcFRj?=
 =?utf-8?B?TzR6d3dkVTdJL1VIeERTWU5hQ1Q0c0xYd1BCU3pmYmdBR0lDTVptVEd4VXlR?=
 =?utf-8?B?a2JVM0xWR1d6MHZNbVNhNWN6V2lzZ1h5cXRzWVJlWTlQTFZZanErclFhckFh?=
 =?utf-8?B?bjB1NWFlcUVxMVZudGlaSmtnQUJBdlBDM2xPUGVwcVZyaUF3TkxSNXQ3OUM2?=
 =?utf-8?B?ZHJmZE50MnlXNWdkNXVFUEdwOXJoOFI0eGtOaWFlbmNuak10SXBFb3lzb0l5?=
 =?utf-8?B?aVVGT1h2bzlFdlNOVzJFUU45aUVBRHFpT0RraEs2eTl3YVFSNVdoN0pLMi8x?=
 =?utf-8?B?VTZtUVQrRFZCN3lwZEhhNVVOMFRSQTBPS1pSMlZLOVhPekdZZHk0d1c3ckow?=
 =?utf-8?B?TC8wSmlBMXVJR3VjZURqTEszRnNMQ2lGMm1OTlovOFMxb054NGRBMVFMbmlu?=
 =?utf-8?B?UFdhMXA3OFVBTGpjUjFRa3BOUnpqS0NDd3JkeTFGVVRVVEdrZ3JrOU9KYjY2?=
 =?utf-8?B?ZlRKTnJmQ3pZcTZmdS9RUWRVaXdHYVlZSHFpMmh4bVQwVmhTakNHMWFLVW5y?=
 =?utf-8?B?SW91amYvdmRZRjh6L1RWQlFZRzdxQ2ZJRUZYbXI3TFB5bk1rTXpvcmFKR0ZK?=
 =?utf-8?B?QW5lYnBGRVNOS1Y3cGwyd0tsUGp4UFRZRmMzbkNzb3oweTUwelZRbWxDTzFY?=
 =?utf-8?B?eWFVVXJlNjkxTjJVZXhDSXVOVEM3dVVvbHREZURWQmVDSC9JSkxQb09BYld2?=
 =?utf-8?B?bWI1bGhvS01xU2QxVGVNbWhId0ZOV0NHWTllbGd2bkc2L1dLTEYxZ3FzV0lG?=
 =?utf-8?B?SmpJQklETUJtV1JROEI0T21GT1BsaGNpSXlxQ0xWNnNncDdSUWhHSElDSlFh?=
 =?utf-8?B?YkVOUTFTTmIya2lqNWxVSWQyTzhrQ1UrYzRSMGJRVVYwN2NQaE5yeEJieDJ5?=
 =?utf-8?B?cTJUeXdzbkh0RG1HTGRPTGlPeU00ZG50NXdVUlVDNTN6K0N1QVBwZXQ3aWdQ?=
 =?utf-8?B?VFFsOG1xWjFDWXRsS2Zkb0EvNHEzdXhoZCtnVDU5MlF2TmcyUmRYOFpnRk1y?=
 =?utf-8?B?WUhUNmp2Tk1wTTRCR0JuMVFudjVqTGFtSTlFVzlMTHhhMUlCTmNTK2NMdS9w?=
 =?utf-8?B?U1pVbG91VnVtMWdNUjQ1MXVKcnp0dUNCNFgzbzBjRW9IT3FjT1BmZEJVclRU?=
 =?utf-8?B?MEw0MjBOT1VXdHN1UmVqR282U2t2SFJjSG9HMzJvLzZwNDlOUDcvYm50M09F?=
 =?utf-8?B?RHlDZmlBSDZiQWkySVBDV1R6bUNOWTlQbm1IYnNjNnBNZWdDLy9YSjJqNGht?=
 =?utf-8?B?NTlNV09PbGMrTHRkR0VYaytGeVkrTG5VR1N5K2d5dnByclZKRTVkVjFmZ3hj?=
 =?utf-8?B?ck1yV0FGSXZJaG1jL25jRjNUWmI2UnU5UDVMUmg0aFp0akEyUnJuSVovMzhP?=
 =?utf-8?Q?NOJKqk/0tNuEB+64o7FS9Ndsk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf8ff11-a731-43df-65a6-08db18c27dee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 12:59:41.9960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZoDss82WMGpy6MaSViPdHDPNmZJ7UZ8NajuGDP7lXi6dHSiqyOxfcuA34akTTIq4dIotCTGAshXkxlfANZzVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8157

On 24.02.2023 12:35, Oleksii Kurochko wrote:
> The patch introduces macros: BUG(), WARN(), run_in_exception(),
> assert_failed.
> 
> The implementation uses "ebreak" instruction in combination with
> diffrent bug frame tables (for each type) which contains useful
> information.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>   - Updates in RISC-V's <asm/bug.h>:
>     * Add explanatory comment about why there is only defined for 32-bits length
>       instructions and 16/32-bits BUG_INSN_{16,32}.
>     * Change 'unsigned long' to 'unsigned int' inside GET_INSN_LENGTH().
>     * Update declaration of is_valid_bugaddr(): switch return type from int to bool
>       and the argument from 'unsigned int' to 'vaddr'.
>   - Updates in RISC-V's traps.c:
>     * replace /xen and /asm includes 
>     * update definition of is_valid_bugaddr():switch return type from int to bool
>       and the argument from 'unsigned int' to 'vaddr'. Code style inside function
>       was updated too.
>     * do_bug_frame() refactoring:
>       * local variables start and bug became 'const struct bug_frame'
>       * bug_frames[] array became 'static const struct bug_frame[] = ...'
>       * remove all casts
>       * remove unneeded comments and add an explanatory comment that the do_bug_frame()
>         will be switched to a generic one.
>     * do_trap() refactoring:
>       * read 16-bits value instead of 32-bits as compressed instruction can
>         be used and it might happen than only 16-bits may be accessible.
>       * code style updates
>       * re-use instr variable instead of re-reading instruction.
>   - Updates in setup.c:
>     * add blank line between xen/ and asm/ includes.
> ---
> Changes in V3:
>   - Rebase the patch "xen/riscv: introduce an implementation of macros
>     from <asm/bug.h>" on top of patch series [introduce generic implementation
>     of macros from bug.h]
> ---
> Changes in V2:
>   - Remove __ in define namings
>   - Update run_in_exception_handler() with
>     register void *fn_ asm(__stringify(BUG_FN_REG)) = (fn);
>   - Remove bug_instr_t type and change it's usage to uint32_t
> ---
>  xen/arch/riscv/include/asm/bug.h       |  48 ++++++++++
>  xen/arch/riscv/include/asm/processor.h |   2 +
>  xen/arch/riscv/setup.c                 |   1 +
>  xen/arch/riscv/traps.c                 | 125 +++++++++++++++++++++++++
>  xen/arch/riscv/xen.lds.S               |  10 ++
>  5 files changed, 186 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/bug.h
> 
> diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
> new file mode 100644
> index 0000000000..67ade6f895
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bug.h
> @@ -0,0 +1,48 @@
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

This #ifndef contradicts the xen/types.h inclusion. Either the #include
moves down below here, or the #ifndef goes away as pointless. This is
because xen/types.h cannot be include in assembly files.

> +#define BUG_INSTR "ebreak"
> +
> +/*
> + * The base instruction set has a fixed length of 32-bit naturally aligned
> + * instructions.
> + *
> + * There are extensions of variable length ( where each instruction can be
> + * any number of 16-bit parcels in length ) but they aren't used in Xen
> + * and Linux kernel ( where these definitions were taken from ).
> + *
> + * Compressed ISA is used now where the instruction length is 16 bit  and
> + * 'ebreak' instruction, in this case, can be either 16 or 32 bit (
> + * depending on if compressed ISA is used or not )
> + */
> +#define INSN_LENGTH_MASK        _UL(0x3)
> +#define INSN_LENGTH_32          _UL(0x3)
> +
> +#define BUG_INSN_32             _UL(0x00100073) /* ebreak */
> +#define BUG_INSN_16             _UL(0x9002)     /* c.ebreak */
> +#define COMPRESSED_INSN_MASK    _UL(0xffff)
> +
> +#define GET_INSN_LENGTH(insn)                               \
> +({                                                          \
> +    unsigned int len;                                       \
> +    len = ((insn & INSN_LENGTH_MASK) == INSN_LENGTH_32) ?   \
> +        4UL : 2UL;                                          \

Why the UL suffixes?

> +    len;                                                    \
> +})

And anyway - can't the whole macro be written without using any
extension:

#define GET_INSN_LENGTH(insn)                               \
    (((insn) & INSN_LENGTH_MASK) == INSN_LENGTH_32 ? 4 : 2) \

? (Note also that uses of macro parameters should be properly
parenthesized.)

> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -1,3 +1,4 @@
> +#include <xen/bug.h>
>  #include <xen/compile.h>
>  #include <xen/init.h>

Why? Eventually this will be needed, I agree, but right now?

> @@ -99,7 +100,131 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>      die();
>  }
>  
> +void show_execution_state(const struct cpu_user_regs *regs)
> +{
> +    early_printk("implement show_execution_state(regs)\n");
> +}
> +
> +/*
> + * TODO: change early_printk's function to early_printk with format
> + *       when s(n)printf() will be added.
> + *
> + * Probably the TODO won't be needed as generic do_bug_frame() (at
> + * least, for ARM and RISC-V) has been introduced and current
> + * implementation will be replaced with generic one when panic(),
> + * printk() and find_text_region() (virtual memory?) will be
> + * ready/merged
> + */
> +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
> +{
> +    const struct bug_frame *start, *end;
> +    const struct bug_frame *bug = NULL;
> +    unsigned int id = 0;
> +    const char *filename, *predicate;
> +    int lineno;
> +
> +    static const struct bug_frame* bug_frames[] = {
> +        &__start_bug_frames[0],
> +        &__stop_bug_frames_0[0],
> +        &__stop_bug_frames_1[0],
> +        &__stop_bug_frames_2[0],
> +        &__stop_bug_frames_3[0],
> +    };
> +
> +    for ( id = 0; id < BUGFRAME_NR; id++ )
> +    {
> +        start = bug_frames[id];
> +        end   = bug_frames[id + 1];
> +
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
> +        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
> +
> +        fn(regs);
> +
> +        goto end;
> +    }
> +
> +    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
> +    filename = bug_ptr(bug);
> +    lineno = bug_line(bug);
> +
> +    switch ( id )
> +    {
> +    case BUGFRAME_warn:
> +        early_printk("Xen WARN at ");
> +        early_printk(filename);
> +        early_printk("\n");
> +
> +        show_execution_state(regs);
> +
> +        goto end;
> +
> +    case BUGFRAME_bug:
> +        early_printk("Xen BUG at ");
> +        early_printk(filename);
> +        early_printk("\n");
> +
> +        show_execution_state(regs);
> +        early_printk("change wait_for_interrupt to panic() when common is available\n");
> +        die();
> +
> +    case BUGFRAME_assert:
> +        /* ASSERT: decode the predicate string pointer. */
> +        predicate = bug_msg(bug);
> +
> +        early_printk("Assertion \'");
> +        early_printk(predicate);
> +        early_printk("\' failed at ");
> +        early_printk(filename);
> +        early_printk("\n");
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

Wasn't the goal to use the generic do_bug_frame()?

> +bool is_valid_bugaddr(vaddr_t insn)

Why is insn of type vaddr_t?

> +{
> +    if ( (insn & INSN_LENGTH_MASK) == INSN_LENGTH_32 )
> +        return ( insn == BUG_INSN_32 );
> +    else
> +        return ( (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16 );

Nit (style): The kind-of-operand to return is an expression. Hence
you have stray blanks there immediately inside the parentheses.
(This is unlike e.g. if(), where you've formatted things correctly.)

> +}
> +
>  void do_trap(struct cpu_user_regs *cpu_regs)
>  {
> +    register_t pc = cpu_regs->sepc;
> +    uint16_t instr = *(uint16_t *)pc;
> +
> +    if ( is_valid_bugaddr(instr) ) {
> +        if ( !do_bug_frame(cpu_regs, cpu_regs->sepc) ) {

Nit: Brace placement (twice).

Jan

