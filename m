Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6BB6B0C2B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 16:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508071.782322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvNM-0005Wa-5i; Wed, 08 Mar 2023 15:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508071.782322; Wed, 08 Mar 2023 15:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvNM-0005UM-2r; Wed, 08 Mar 2023 15:06:44 +0000
Received: by outflank-mailman (input) for mailman id 508071;
 Wed, 08 Mar 2023 15:06:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZvNK-0005UG-Lg
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 15:06:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4b38dce-bdc2-11ed-87f5-c1b5be75604c;
 Wed, 08 Mar 2023 16:06:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8133.eurprd04.prod.outlook.com (2603:10a6:20b:3b1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 15:06:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 15:06:38 +0000
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
X-Inumbo-ID: d4b38dce-bdc2-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBsBJngySgZtpHvbd0ICsvTsRBQtgpTmGeUG5J0sJRBetAu7qvNJvJywQcH86D/WRnIkxCGNIZRW+i1H4lchKZ9Nmad6m+p9T3uUDu2y+fMHgkiQW9j12uRYF2cUv8EDD7KLpyRKYCgGANuCWlsgHddUQMbkqaF0aIWOz3xbRMPx4V+r8Q+g5nNFH5lz+tN9uQRjeRF59EC3bfYfGDhA3nKQbA72EEkmgQsQ1AXE8WMoXvxrZCGMvmRexuhVWQ8eb8yHmKmLcxJiwVxPN0BTGeY0eVi1stDIZsuQ8e8B9vd3mwDECDZRskij/IryJ/M1Y0KkbQHtOurEHvu9qQn5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyTKg5AgK+UdcBuLcF00jkAQhDbKuH+FyUuKaG1CjFU=;
 b=WUS3sjmdHDmPT1Xery/morPHLmJgt4fT9UYZccPL9jiXus4XSi+7H8UP3sR8fhse5NW+AihJKUdcSp1xFlRWxggR9b3bS2kD3BXISpvhzBE7my1YiixK62JTaIzT27OHhiL7iaaQNBbU6H4N+5qqtV3JDE5chOITqoNtcw1LeJrbKF9UlHHsnjFHoeTBGv9PIZz1a/kmFbSrQgO3QhosiIIZmZjIKH1L9FpCF0t+UCD/hE8PM/v3kxPm4JoLcDH3Nyrn3fhHj01Q23dvx+yirOz01JWkrsUKAjfhr0MKa55fq8xgc0XFEyfQNuKzHO1iMhjfa6+4cUvcqbF7nDHkMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyTKg5AgK+UdcBuLcF00jkAQhDbKuH+FyUuKaG1CjFU=;
 b=rPWz+S/1PI3ug7v5hJY5XT3FR15DzE5j8ox4XV/S3JEM7LbmKCm7tSs8uhHU+Aqc5HwvGfUaJrx1neAjmJQAybKdVtfWL6H72xDE6Sfl104J88jCjL/uuCxbt1KF3wMLD6rYecvIAs6+Q9N/de2piDFDEnm9xUlGzY4xiir/M+uw4AjHX1gjA7IOwfMK6UveZlpF7uBLF//KvI7oiCIrjoI6EgWqz5vCMhxV+D8f3LfCiLIMUZBSgkl21wa8adh9MYsKO7x3Eo+iAm47v0QbIIsJ6ACiwqf9Mks13/Y/FAhcES0PSPcn3CDKINDvCtwLGiHGpc6dKtz85LwvtN0Q3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <32a4a1c3-018c-fced-2b04-d1db79f7dcd9@suse.com>
Date: Wed, 8 Mar 2023 16:06:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678202233.git.oleksii.kurochko@gmail.com>
 <1e83d371581aee41a3369434c49b90c2fc478f1f.1678202233.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1e83d371581aee41a3369434c49b90c2fc478f1f.1678202233.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: bd9f7c8f-a0bb-4206-bfe4-08db1fe6b765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bib/n4vKyDrhIC28RbZgmRQR5i67op6f+yKHVbEyaW2/qCcJfy/PbyAAQp6mZif51pXZCGt9dN7wo/0szVCFsILNdSEUPa/6iisHrtS6ll7YgUNKA1Pa/bTWu1n9aWHAdxnyk1Oq4Vut9KlS/xAA4TApuh4muJnhvgzmcVoDJ8IQGDUJoWscKfVh7HGUkDbXoheCCdS+h4PxrVn1TsZQVMuTLwc/lyVw10edTrDhb/vvqrL0h7gIyTCrE7iXM4Ph92Kfz4lwlG3st/eIrERWqhcRKcys6V9s4OIPCBnq9XEpMz2MBnWMGp11aDzi/Mfa15AuKh+40Vf2ztJwBxxdJ1lpnGT12cGBwLTKGFkyViR/sCJaboJt51yVEJwIjV2njnZAT/Ej6yId27hzcJ5H5CptRKHguz06wGz4t0ZP5J9dgS2d2aEOSLi2CYNmGOS9GbB6Z0ql1dKfbb5x/rLFTDx42oabaNJNyccO/No/cbM0vcfciAqYd+M+hncNMB9HNAuPgfrqpXw+6YyEi7g7S1frFi8ngbvcF4s0yx+lJTwi3fKhylgHWoiruRE16PzuEl0OOoP+BD0CozzE0Og2hm1KfTT0JKERZiP01C56a4Igphm8rCRTg4O3cz8nOICH+gyPSkBUwzc/vghQcvKiWB7BSVij2h9nUNvpl1ziqTo6duyt/bLpSHmacXLIpbaNEDWFsrVgV7/XPAF7qzOc7L1nXVXvNS2dE3XgcdJXmVNxu3mlJlzMtsTydArpzq/3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199018)(2616005)(31686004)(41300700001)(186003)(8676002)(316002)(66946007)(66476007)(66556008)(54906003)(26005)(53546011)(6506007)(6512007)(38100700002)(6486002)(31696002)(86362001)(83380400001)(4326008)(6916009)(5660300002)(2906002)(36756003)(8936002)(478600001)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXlQeDVTKzVCQWYwNlVTNFNsS216SUFpNkQwZWI2QksxZXRNV241anU1aitX?=
 =?utf-8?B?bEtNZGt1aHNHcGo3UTJ1eUhZSEltMDVVRHI1dTJNUU92Sk9yN1laUi93NWtI?=
 =?utf-8?B?bHZDb3lIc0xlTGdMTFVrQjZaOU5YS0xYQU1hUVhIbkJwb3dSaFY1UTAyVjds?=
 =?utf-8?B?dTFuMGR2aGd5ZnU2RythbmhLMzJ6YjF2WEtPV2J2T1ViZGtLRW5Ib0dlT1Zj?=
 =?utf-8?B?T1B0eitPRUpDY05pL3F0QnN6TUlDNWRRcGs2K3JSTEQzL0pHTGVEQktQVGho?=
 =?utf-8?B?SGhqNmJ6UDJlcDcwWWhNT29WbTQyRTF5T2wxb0l4WUU4a1hvUXhhem1sbmwz?=
 =?utf-8?B?alZNUnlGM2ovSFZ2amo4ZEZVYmk4azNRK0h0OVNqWFBraDNvYnhxOHA2Q21p?=
 =?utf-8?B?MW9qRnlFTHZDWmhreVJPc3BYMG5qeW9SS3ZRUnZIbEhHWWlaeCtndDVVUmZY?=
 =?utf-8?B?MEllVFp2UE1abXB0NDVsT1VJbkpjYnl5ejc1cWJiNmN3UzgvNGprUDhOTTVu?=
 =?utf-8?B?dm1HNUZoeUpBd3JWM0Y0UDZPUjk3TVg1M0Nwc0M1a2tWTkp1cGFsdGV2ak85?=
 =?utf-8?B?RW1NMy9EQ3BGVTNHUWdRakx2RXdDN0JnWUdpc2FmbjB2eHZOdUVPQXJQSjEv?=
 =?utf-8?B?UE1KYlRNMDJCeHhPSFdrd29KRjEyTXVvSlZEUHVnMzJGTFNUNFBpTndWbWI0?=
 =?utf-8?B?YWRBb1VZNS8rN2d6Uzd0anA3dUFGZ0Vvb3R0bXh6eDFKdDVPUW9DNy94S2VJ?=
 =?utf-8?B?VzNOMWlyaUxML3oxSlFDNUxiV2lKL0p6ZjNLV0cxYndxcTUzNzV0V1hVUG9a?=
 =?utf-8?B?c0JUWHd1dE5kOStXMi9wbklpN2pKc09yeWVjV3dPNkszdnp2WWxyaVlCeU5M?=
 =?utf-8?B?MXAyQVNQUUEzbnd5ZndJVjhuRWlDYndjWW9mUGZtTy9jRXBWdWp5aVRtMW54?=
 =?utf-8?B?QnRKWFJIMnNtRnd2cEphRk5taW54MWdCMXh5akk3b21BTGpmcFVxaU1IY0Y0?=
 =?utf-8?B?R1ZCU0hMRU1rQ2JyeEpFY0I0M0hmSTE5T09raWR4K0JhcmdYeGZQaUkwT2th?=
 =?utf-8?B?RkF5MUU5TmVYVmtTUTFLZDNRZHcyc3JVM053dU5UOXV2SWNEb1VNc2ZZWk5j?=
 =?utf-8?B?STE2QW9FS291M1hrbUlJZC9WUkdFWGI0UkZjZFcrWllKZjNyVEZEczhwQ0Fz?=
 =?utf-8?B?ZGMvMFgvckF3QkJhbEwyYkVXOFIxYkJLMEFYYnc3SHVXWDQrN1lSOXpmM1BZ?=
 =?utf-8?B?VXVZOWZXTFk4dWkrbDh2bVJ5TWdiMzdYZmJ3RjhITnFzUDVnbXRLSVJ4dCs3?=
 =?utf-8?B?bFVTTElZSVpZSC84T1hISTVna1hIVmhaemxjRFJiR1E3NUZ3Z0dRMjBEamxZ?=
 =?utf-8?B?TmJ6a1l2SFJiQy82MVAvNDZHSC9hT1cvc0ViQW5iZTEzdjc2UHNyRmc3Q2c1?=
 =?utf-8?B?OXViV0h3TnpkcC9zbG4vQ2VyMkZnZksrNk8zWWdWMUxsOTdoYkZNNGlNNmk0?=
 =?utf-8?B?WndheUY3TEtlVE4ySnZKd00zeVlXd3JCYURyQ2VXSk5kUW9EakZPSjhOVW9r?=
 =?utf-8?B?cW5jTTlDaGE4UzZvaVlManZQYzZEcEFmNmNiK1hlWDdKaXlzSGpvaHkzeXdP?=
 =?utf-8?B?dWRIYlMvRWRiQm9mckJpdlhsa080bzNvSGIxSUEyQUJYU3BqZDRSN1NuMGpk?=
 =?utf-8?B?dU5IWDRjeHVtSzRPaXEveFBSOUQ0dVdLVHZrMmVJYXRYUmNQT3lSSFlEMldm?=
 =?utf-8?B?MVBTaGhLU3laU2Z0ZXBnYmNqalU2VUw3YUxZQjJybE95bElNMDVGQmJlUGZF?=
 =?utf-8?B?Q3pHZ3I0aGluQno3clNRQ0owZUtmNzlrM0I0ZkdZbUd0bmJ3UU9ZL04xZlov?=
 =?utf-8?B?d1RGUlFrSzd0SlJDa01Pa0VRbDhOUkd6SHI0T2JNTG1KT2Vaa0VqMEhsdCtw?=
 =?utf-8?B?eTBTWFBrYW5qZWlpdGlCVUNTRmFLRitnTUZ2bWtDc3BtS0Jxd0h1ZmpGMDJT?=
 =?utf-8?B?TnNqcUFRNWFENll6dTEyUVMxcTdFRm9wdEx3NG5NL2xQZjhhSHU0MDk4ZlBj?=
 =?utf-8?B?SkNMV3BteUZtN2VoSldZbXl4a3QxMzZQK0V3YnJwL1BNRmdGMkRONU1tLy85?=
 =?utf-8?Q?S2g1YswcJE1ArxuwASsdp8p2B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9f7c8f-a0bb-4206-bfe4-08db1fe6b765
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 15:06:38.4769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4PnlNGI9OX7qlpOrKkngCPkPoi+TipUgdgAGVTLyqj1TJzDEaZXFT7zqo/35eREXRPFXj7WCLbS0FwD55/70A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8133

On 07.03.2023 16:50, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/common/bug.c
> @@ -0,0 +1,104 @@
> +#include <xen/bug.h>
> +#include <xen/debugger.h>

Isn't it asm/bug.h now which is to include this header, if needed at all?

> --- /dev/null
> +++ b/xen/include/xen/bug.h
> @@ -0,0 +1,158 @@
> +#ifndef __XEN_BUG_H__
> +#define __XEN_BUG_H__
> +
> +#define BUGFRAME_run_fn 0
> +#define BUGFRAME_warn   1
> +#define BUGFRAME_bug    2
> +#define BUGFRAME_assert 3
> +
> +#define BUGFRAME_NR     4
> +
> +#define BUG_DISP_WIDTH    24
> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> +
> +#include <asm/bug.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +#ifndef BUG_DEBUGGER_TRAP_FATAL
> +#define BUG_DEBUGGER_TRAP_FATAL(regs) 0
> +#endif
> +
> +#include <xen/lib.h>
> +
> +#ifndef BUG_FRAME_STRUCT
> +
> +struct bug_frame {
> +    signed int loc_disp:BUG_DISP_WIDTH;
> +    unsigned int line_hi:BUG_LINE_HI_WIDTH;
> +    signed int ptr_disp:BUG_DISP_WIDTH;
> +    unsigned int line_lo:BUG_LINE_LO_WIDTH;
> +    signed int msg_disp[];
> +};
> +
> +#define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
> +
> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp)
> +
> +#define bug_line(b) (((((b)->line_hi + ((b)->loc_disp < 0)) &                \
> +                       ((1 << BUG_LINE_HI_WIDTH) - 1)) <<                    \
> +                      BUG_LINE_LO_WIDTH) +                                   \
> +                     (((b)->line_lo + ((b)->ptr_disp < 0)) &                 \
> +                      ((1 << BUG_LINE_LO_WIDTH) - 1)))
> +
> +#define bug_msg(b) ((const char *)(b) + (b)->msg_disp[1])

As indicated earlier, I think that you want to move here what you
currently have ...

> +#endif /* BUG_FRAME_STRUCT */
> +
> +/*
> + * Some architectures mark immediate instruction operands in a special way.
> + * In such cases the special marking may need omitting when specifying
> + * directive operands. Allow architectures to specify a suitable
> + * modifier.
> + */
> +#ifndef BUG_ASM_CONST
> +#define BUG_ASM_CONST ""
> +#endif
> +
> +#ifndef _ASM_BUGFRAME_TEXT
> +
> +#define _ASM_BUGFRAME_TEXT(second_frame)                                            \
> +    ".Lbug%=:"BUG_INSTR"\n"                                                         \
> +    "   .pushsection .bug_frames.%"BUG_ASM_CONST"[bf_type], \"a\", %%progbits\n"    \
> +    "   .p2align 2\n"                                                               \
> +    ".Lfrm%=:\n"                                                                    \
> +    "   .long (.Lbug%= - .Lfrm%=) + %"BUG_ASM_CONST"[bf_line_hi]\n"                 \
> +    "   .long (%"BUG_ASM_CONST"[bf_ptr] - .Lfrm%=) + %"BUG_ASM_CONST"[bf_line_lo]\n"\
> +    "   .if " #second_frame "\n"                                                    \
> +    "   .long 0, %"BUG_ASM_CONST"[bf_msg] - .Lfrm%=\n"                              \
> +    "   .endif\n"                                                                   \
> +    "   .popsection\n"
> +
> +#define _ASM_BUGFRAME_INFO(type, line, ptr, msg)                             \
> +    [bf_type]    "i" (type),                                                 \
> +    [bf_ptr]     "i" (ptr),                                                  \
> +    [bf_msg]     "i" (msg),                                                  \
> +    [bf_line_lo] "i" ((line & ((1 << BUG_LINE_LO_WIDTH) - 1))                \
> +                      << BUG_DISP_WIDTH),                                    \
> +    [bf_line_hi] "i" (((line) >> BUG_LINE_LO_WIDTH) << BUG_DISP_WIDTH)
> +
> +#endif /* _ASM_BUGFRAME_TEXT */
> +
> +#ifndef BUILD_BUG_ON_LINE_WIDTH
> +#define BUILD_BUG_ON_LINE_WIDTH(line) \
> +    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH))
> +#endif

... here, guarded by a separate #ifdef. The check is specifically tied to
the struct layout chosen here. Instead what you want here is

#ifndef BUILD_BUG_ON_LINE_WIDTH
#define BUILD_BUG_ON_LINE_WIDTH(line) ((void)(line))
#endif

covering architectures using a different layout where such a check isn't
needed. Of course this also could move up and simply become "#elif ..."
to the earlier "#if !defined(BUG_FRAME_STRUCT)", which would keep
related things together.

> +#ifndef BUG_FRAME
> +
> +#define BUG_FRAME(type, line, ptr, second_frame, msg) do {                   \
> +    BUILD_BUG_ON_LINE_WIDTH(line);                                           \
> +    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                     \
> +    asm volatile ( _ASM_BUGFRAME_TEXT(second_frame)                          \
> +                   :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) );            \
> +} while (false)

Nit: Style.

> +
> +#endif
> +
> +#ifndef run_in_exception_handler
> +
> +/*
> + * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
> + * and use a real static inline here to get proper type checking of fn().
> + */
> +#define run_in_exception_handler(fn) do {                   \
> +    (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \

Hmm, there's another const-ness anomaly that has slipped in (and is
no longer necessary with do_bug_frame() now again taking a pointer to
non-const): At the point you handle BUGFRAME_run_fn the type used
(wrongly) is void (*)(const struct cpu_user_regs *).

The disconnect isn't good to leave (as the same issue could be
introduced later, when not looking closely enough). While not for
this patch, I wonder if we shouldn't make the use site be something
along the lines of

    if ( id == BUGFRAME_run_fn )
    {
        void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);

        fn(regs);

        /* Re-enforce consistent types, because of the casts involved. */
        if ( false )
            run_in_exception_handler(fn);

        return id;
    }

just to make sure the type used in run_in_exception_handler()
matches the one used here (without actually producing any code).

Jan

