Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED2275973F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 15:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565877.884460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM7TT-0000bt-3j; Wed, 19 Jul 2023 13:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565877.884460; Wed, 19 Jul 2023 13:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM7TS-0000aE-Vy; Wed, 19 Jul 2023 13:44:14 +0000
Received: by outflank-mailman (input) for mailman id 565877;
 Wed, 19 Jul 2023 13:44:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM7TR-0000a8-DC
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 13:44:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 571a9bea-263a-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 15:44:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 13:44:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 13:44:09 +0000
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
X-Inumbo-ID: 571a9bea-263a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UV46Rh/Efi4X0ylb0LX/3a+jfPjneS4mxhUdarPx0Wd0Cr5KLvnV3FIvGEs4K7SShtH+zxpCmAIF4NqApg9EBSuuvDnrmsSxhHLgUFAepj4y8GKio2hQYx1RPXRn4pAQyTYoxD7PJhsqjgcu5ikiGNUoEkVwLkm7u5YDXO5SVLK5hRfwp3krTxevbHVdqOygWY/OboiSOuOH3776KYMFAA+06+vdZBGnj8FpaIQUPZr6KpSud+2kwxiuAAZZbvZl2B2F17ritdtixDz6hnM1G1cTJiF5DRk+sdxriwmlqLRuAy8Z/ohKA8bI0OO0R0zX4G21uyy0YyCoQLQgDbqNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDH2XijaVJK3u8I3j4/hzsc3lwCobWMlEVsdpwYOlVw=;
 b=eN9laLIUJk+oaq+UPs0WjFStNp1Vu3wZexCjvT7Upj/IH1Qmy+HO8/4jknRdiLrtmtapgOA4l10rdpawW5BQGFmJx6gMXCzrgb4ny2QEErY5VBG+C87o5GCHYtIyELglR6I3nAlvh/VxkO4RlxfbpievBf2F3g6iIrpiRMjdhbcWN3tK5h0ZbDdCS2QJpwLquNVZXOpGJSpWy9p2AbSVBIFnwUUU7VR/dU4gExYAH1bZR2PP1JTBPvUXRdxy80UCzVcDbHErH+YK8pF62WH5CkfLsRzzPivJbIBe2rQpcvA9Med1O6h+HB+cNFvrLfian5hWUy8dxlKjyE2sCpuu0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDH2XijaVJK3u8I3j4/hzsc3lwCobWMlEVsdpwYOlVw=;
 b=WNG7SRHqvxpdMOgQ9GJgWF8gwg0L3ALHDlxTF+SiAsVRoUEZnLdxujjwq8nt/ySobRkkvuR8/KMCvPA4bYil0878EXRbnBB7Wv2F6vbok7UIb8SkLHetBM8V/TtnEb5UWi3L3KySQ0r4u1t4JAFYjCTleUflkvscvCd4lzqF+/VxDIDYY1ofY01gw4NEC5ooTm9f2NaSdkFPi9E7tgncxmjZwSayUdsWwg4G0b3+L4GAt2F6lH8eNf5utt3sEumIIhfUyPVuhXO/4vvjgAd4X04UPzfhQozIQumnqBJBElLV3Nl1OaOfHSkl3J4+3GiIDjBhG8B13IBASx4JM1jUXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <122a124a-2392-e681-d0e3-1b4dd210f5c9@suse.com>
Date: Wed, 19 Jul 2023 15:44:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/4] xen/ppc: Set up a basic C environment
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1689710519.git.sanastasio@raptorengineering.com>
 <6d2a906f3321f4f846ccede25a600a4b85183a38.1689710519.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6d2a906f3321f4f846ccede25a600a4b85183a38.1689710519.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 12beda63-9e39-4103-a4a5-08db885e3a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gGY2Yg9PZ8HEfibokLCZ67No6RvbTiK37AZogs0LRVTM09MhLGll1Ygr1FH0Yhmo9U31gJucUxY5FNJeY0eSxBlPjlq1W85d9ru7k2nR1mmlpDlgyqUEtWVamE9/liPpJG4oEJJxVdP7yyTSOTOjAnKP31ogJZpsTt8WhG20BLgjYhlsFISMA9aHSrHQcSY9l7hMFFgohoKVPaEvlBlVN3q0Zycyh6hjeGORtTpSF6cBhxqcqTPi9moANtxfcXlFqMucJ294bQXwWaRv+X5WmDMLCZubCSGBtBSkojr1F0sM/cKrUq7oC2EqP2us0/wGlGZ7mOMUecQgZ5sbM20rctu7ic0BoxHVxjSK7B5Qdy0nzW4cHxbY8Prkzil3pECubP5E5kZG26broA7XHcmI5FjgPcmGQ5H15ITRZHDGBVXHiaZlGJ5IYRcGtYX/jLkg18/lPBS9ToXEWV9+QcklMX+PC4gq+2t7pFIwcl78AymH11e97ZCUim/YhAKxS28v0S9vzsARYiqegITu/42S0S5ISz9E+MXQl3cDJLiAANUE4EsP2ikxIVpxO/QZdXmysSK+YYiooN+F0J6gOjxGf0ZoF5NjUU/T5gwpaatj+h9DhwoEBQSW9+MntWknCnJd9PFOvubLKKT8tb2QRKv/lA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199021)(86362001)(478600001)(83380400001)(38100700002)(186003)(41300700001)(26005)(31696002)(31686004)(54906003)(316002)(53546011)(8676002)(8936002)(6916009)(2906002)(4326008)(6512007)(66556008)(66946007)(6486002)(66476007)(6666004)(6506007)(2616005)(36756003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXZIc1VramFFQlgxd2gxbjZQVytNdnZnUVdOYnlLR01BL2VUSHpoMk4wam5w?=
 =?utf-8?B?M2hjYVl4aUFTb3I5QWhXOVRwVGlXYmlvTzJPYnJJSGo5VVVyOStOSVBtOXlM?=
 =?utf-8?B?SzJZQnFMalMzNEp5ekJVMEp3WWdFalpyUlRZTVBWY1NiVTNyMFJrc2J3REN1?=
 =?utf-8?B?VXpXbE92RFMySTRTdlltZi9PKzB2RTg5NlNKaHlkcXkySzFMcUpCeDBwWGVC?=
 =?utf-8?B?bVBYQmZMWGx0WXBGZVpONGdFQk1CVm1pbm5aR01WZ05TelJvR1Q4ZkhEcHU0?=
 =?utf-8?B?endKaVpvS09EcWJnWk0zeWVheXJ4OXVDU2I2elZIT1FXazRKdlJFRDdsSHAx?=
 =?utf-8?B?MEtFcVljTlhqcXZvQ3BlRWRNVGtSVGl2Si9leEJHbXp1TkVIRWIxeTA4eVRu?=
 =?utf-8?B?dXRxb3puc0hEcTJyeEZuaE9yZlZHREJLbzN3ejhrdDhPc2lvRDhwdEVCYUtB?=
 =?utf-8?B?RWZpWnNKRGwyYU9naVZhd1Y5NGQ3RVIvV1lRaXNBai9MeWM4M0x5YnYyVUI2?=
 =?utf-8?B?UmRJRWdveVJ4c1J1QmRGcW4wNXVNWVRlcEJkZ3Z2NFBlMStSemZjSFU1ZkhD?=
 =?utf-8?B?c1cvUnQ5QUpkVEpBR20yOFBJWnJTRmVVSm9KempNSUVwYWJ3NkpFN0FJL0JD?=
 =?utf-8?B?VTd1THlqTUlwemZaZ1lMY1BQb3VlN2dFNm5jcUkrb0FPR1ZxUVZHb3NnQzdj?=
 =?utf-8?B?NUtSc0tXSUk1bzdLUjRmYmdYend2cVIySnZhb29Hb0JjU3dUQlQ4R2lhM3c0?=
 =?utf-8?B?WGkveHh6ZDk1SXkwZlQxQ09RZE1QbExvV0VVTFFmakVvRVJqV2duL09QQlFv?=
 =?utf-8?B?bThIM2tXSTN1VVhTMlV1RXg3TUxTek5lbUc4NmlwZjgwWFF3Rm1DWHRnYk5I?=
 =?utf-8?B?YVJTR1kyQmZDUjVEYmYyTVlUTjd1MzJxclIwMkFnQlpUdFdOdThjWkxnK3o3?=
 =?utf-8?B?NzNTSndFVnVmZGhXYjZmVTFqS2JIeDhBSFUvYWhyZjgvcWgvcS90OTNhT2ZM?=
 =?utf-8?B?N2JtTDFsc0RmNEpuYzBEUkNoekNTTlVxUmVNbzFUMVVYNmJDVGpBTjB0eEh0?=
 =?utf-8?B?b1Q5aU5PU00zeGFVaW5RR0o2dDhCTkUxVXhXZTVxWG1WaTNVRDdnT2srZFZC?=
 =?utf-8?B?VFBLSVc2dUZSajltZko1eWR0dXNTQkUvczAwTHV2YS9HUGNuSkVzTVdwTEJu?=
 =?utf-8?B?THVhcHpkWWY0c0tqZFMwTUd5ODBPdjQzbkFtbjBWTm16WUh1TkJ3M2hUWDQy?=
 =?utf-8?B?WWxaRlRuQW1EU0tQbjJnWCtpQUxuWkZRZVh0bGoyRVMzNTl5bVJOa3RyZ29H?=
 =?utf-8?B?cjdmNGV5Ly9BeVVjSjJRTTE5SDFPc2FxTUpObnRoUnJzWDFCZWlxYTJ2Q1RB?=
 =?utf-8?B?N015R0ptc2ZMdktQdEk3ZmJQc1VEY1JmdXNJUkJieFQ3bUJnMlhqNkM2RHkz?=
 =?utf-8?B?RE12RmxnTU0zdG9pQVoxWC9zeHNScVdCa2RCVjZtL0lkcUY5UGozM3A5TWZH?=
 =?utf-8?B?L1Z5eXlTbCtpMG4xU0x6bXM1MDhyVVNKQTFZeXVyYWVBZGlEeTJJNVhsUHNh?=
 =?utf-8?B?ancxR1lzVXZxTC9yMjlxQjl1ZUtUVXRNengxRUgvNmpMNVl5S2NxNk5IZENx?=
 =?utf-8?B?Zm1Ybk1qNWZTMFVDQzBHRjN3OFlXNlRiSHlnWGthU1hra1F2ajEwSUZRZ0ls?=
 =?utf-8?B?OXpHSmNUbGVYMnVuS25EVU4wSWJEdjJPRVZ6bm8xN0FiRXFJTHdUcmVoU1VG?=
 =?utf-8?B?TjZGU09wdEV3Uzl6aCs4dU85OEw0bXZDeGk4b3k4ZzF5TGo3aGtWMk1FN2lj?=
 =?utf-8?B?NFo3UnhUVUpVUU5sYnluelN1MW9ObzUvdktaaU9EUkhwbmlOZ3pkcXFKYjFr?=
 =?utf-8?B?dUQ4YkdpVzkyOFRJMlF5TjhEbDlLWnIwTWdDaVo0TThWWGFIa0tkQzl4Tjdi?=
 =?utf-8?B?aEszdGVoRDZJRkdtRXhBRnNNZGF1aTU1QlpqZHBYeDhxWG1MR2RNU0F0S1NM?=
 =?utf-8?B?SzFYdHRMckRwa1M3L2krV0hyM1RlekhsNnZRY0ZDODh2endTWmhsRXVZK3Vk?=
 =?utf-8?B?bGRMSHQwMzVNd1JITTVCOUh2QW9vK3BjeU13Z3pmM0llSEdaV2tPT0NSYnhu?=
 =?utf-8?Q?9iY9KvIRH0n2ZDtZnRXu0a5ug?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12beda63-9e39-4103-a4a5-08db885e3a64
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 13:44:09.1966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqf0vQCzQxYVgiTORQ2mk/basHEWwsHSqOzc8yfJnA69GClZl/suRbWCzDy3xspaxz9563lxMD+dWVYySA2RaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634

On 18.07.2023 22:20, Shawn Anastasio wrote:
> Update ppc64/head.S to set up an initial boot stack, zero the .bss
> section, and jump to C.
> 
> Also refactor the endian fixup trampoline into its own macro, since it
> will need to be used in multiple places, including every time we make a
> call into firmware (see next commit).

Please avoid statements making relative connections between patches or
commits. You can't know how many commits will end up between both
patches; there's no guarantee any series will be committed all in one
go. (In rare cases, where needed for one reason or another, committers
may be asked to keep things together.)

That said, such statements are much less of a problem if given in the
remarks section, which isn't going to be committed.

> --- a/xen/arch/ppc/include/asm/config.h
> +++ b/xen/arch/ppc/include/asm/config.h
> @@ -43,7 +43,7 @@
>  
>  #define SMP_CACHE_BYTES (1 << 6)
>  
> -#define STACK_ORDER 2
> +#define STACK_ORDER 0

From the v3 discussion I thought it would follow that the description
gain mention of this change (and the why behind it). Strictly speaking
this could be a separate change (at which point stating the "why"
would hopefully be an obvious part), but I wouldn't want to go as far
as demanding this to be split off.

> --- a/xen/arch/ppc/ppc64/head.S
> +++ b/xen/arch/ppc/ppc64/head.S
> @@ -1,30 +1,28 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  
> +#include <asm/asm-defns.h>
> +
>      .section .text.header, "ax", %progbits
>  
>  ENTRY(start)
>      /*
> -     * Depending on how we were booted, the CPU could be running in either
> -     * Little Endian or Big Endian mode. The following trampoline from Linux
> -     * cleverly uses an instruction that encodes to a NOP if the CPU's
> -     * endianness matches the assumption of the assembler (LE, in our case)
> -     * or a branch to code that performs the endian switch in the other case.
> +     * NOTE: argument registers (r3-r9) must be preserved until the C entrypoint
>       */
> -    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
> -    b . + 44          /* Skip trampoline if endian is good  */
> -    .long 0xa600607d  /* mfmsr r11                          */
> -    .long 0x01006b69  /* xori r11,r11,1                     */
> -    .long 0x00004039  /* li r10,0                           */
> -    .long 0x6401417d  /* mtmsrd r10,1                       */
> -    .long 0x05009f42  /* bcl 20,31,$+4                      */
> -    .long 0xa602487d  /* mflr r10                           */
> -    .long 0x14004a39  /* addi r10,r10,20                    */
> -    .long 0xa6035a7d  /* mtsrr0 r10                         */
> -    .long 0xa6037b7d  /* mtsrr1 r11                         */
> -    .long 0x2400004c  /* rfid                               */
> -
> -    /* Now that the endianness is confirmed, continue */
> -1:  b 1b
> +    FIXUP_ENDIAN
> +
> +    /* set up the TOC pointer */
> +    LOAD_IMM32(%r2, .TOC.)
> +
> +    /* set up the initial stack */
> +    LOAD_IMM32(%r1, cpu0_boot_stack)

Similarly I had hoped that if not a code comment, a sentence in the
description would appear regarding the (temporary) non-PIC-ness.

Jan

