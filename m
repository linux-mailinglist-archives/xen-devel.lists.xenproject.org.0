Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC96CD8AB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 13:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516208.799970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUC9-0008TZ-6U; Wed, 29 Mar 2023 11:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516208.799970; Wed, 29 Mar 2023 11:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUC9-0008R2-3e; Wed, 29 Mar 2023 11:42:25 +0000
Received: by outflank-mailman (input) for mailman id 516208;
 Wed, 29 Mar 2023 11:42:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phUC7-0008Qw-VA
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 11:42:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7d00::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3e335b8-ce26-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 13:42:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9314.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Wed, 29 Mar
 2023 11:42:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 11:42:18 +0000
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
X-Inumbo-ID: c3e335b8-ce26-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeoxLPE6HlopsCKq4cc3TDyVwonwzi857emX5VmGb7dkcwvROQ7YY2z4T+8XumhAxnXbjOXVmLOER592hw8XDNqER+5NnX2T1GKeEDEYN+g9RKYgHNyqIPTlKR73XTe66bpIbGrIr4D19Ak+ETaVkDWxo8RQ1jdnPwzNRCBckL5tRUOZhwPP/ZEyEVD836EpKE+IkScqpxN6rzMFD+O6is+3uXbwD3IckuXRfqM8S59wBwWc0kQoF5WbdBU/UNo+a0bgIzrZN+uQAkmUxNYQycZbfCvTxtBLPHoTXAFq6IhIIsbrQwTRE2x6jDHU7dIRp6IiI1nUiTlGpCEPMaJ+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35OWXAVGF+XCGCVlGvSe5AVhdV6759La18KTaQiYgPI=;
 b=oF9V5NEzNEawi62DNPSB1zgGeFDGYTDHnq/GLl3KQAXUId3R3wFz9fhWA8oEns1S5mPpAMYJqA5OXiQFGHOzeLX/uWj3mNmZRJ55DHEU5KKQkyPRHj3ELeAgFLgqAaaxxqpH5ZeQlgUO/hu6vs2K/RomAkBcDz2sqNJ/FDVTwyifvDe2T14BFYP2+xMzyP1mF8sxhzZWsoFz8rAFhM//fX2yFqQxBR+LcFlE+KxK26LuwU//R1qzepNIziIBmw2XPh58HKxM1HzMRz+ia+KtlDkxx8lgdgzmmG2R9DDowdgQvA/uxp3rj83xeha3WDkHuXrnJXiWY72EAqFQWvDjdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35OWXAVGF+XCGCVlGvSe5AVhdV6759La18KTaQiYgPI=;
 b=d0DMeKqrWsECWJjVTfcf/tGdY5GwbtglQBs6C2IeIJG0VqtaisjX02TgLoqBdi94BmaKHdysK6o9uXFf+5N2eDFb1I9FY0PtboXGDnFS4k5jNRFrpuFx29OK70jq8tqb1qJvMuwr6S7ZNoDXXBJhK9SWy3q+SRtXaP5jQRx8QeC3GPWLFh+P4ozjeSBkHNYwicOovt47BePNnii8jxYjTYQzEEyM3vD9bfqXECLcWnVOgFAsm2cf0AgfDx+NHCTWz62KuNyLHdGtvO9KL0QTbQpMgLhUB3STYniJZUi96zpC+64EYmwUs32k0JjTAHZ31kCiUXm4IFV0vyBpWt6nYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b621681-8786-b282-4376-40b7dbecb2b2@suse.com>
Date: Wed, 29 Mar 2023 13:42:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1680086655.git.oleksii.kurochko@gmail.com>
 <c9fb416c98e023ff3150064222cb42b6c67f37e8.1680086655.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c9fb416c98e023ff3150064222cb42b6c67f37e8.1680086655.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0b00d0-6c4d-4f2d-c6da-08db304aa6bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RELrFzbT9HgJBHl0OIPHA4v0uS0k6NHLhLX9hSMFTzbO7Ojd1Yj4mqRA8DYDIBUeAgiUjjU6/+uzENHVMA0qOnVTBK88W8WFcl52YMqgJxT8VMr0cuHMxcfzgJp+JjGznAqi0ISeyK4Nv4H80a7nKrGy4f6JrbMjctZWuj3hIPoMs8yIuvzQ/aZ6/Nx2XfTLOaT4oL9+FZMB0RptkvTA6EW6LKuL2Q+5N3lxt2LDY36Zx38vrKvH7rLVM09FBOXp/xRvmV9uIZVWGeOBMpXkH1ovpbE4D28rC1rogd022tq0ReOv1vrYFeeUGymBskV4aL1alVnzaDzORjLYFAthWAXOqegGEPt78oL4MlWzqsILEWarvV0APA+gEQT6SnwePi6h9n4KUBnn/VSP6msnDWbjqZZYANfrK1uBBZc4V4vJbUkqwI1UNJB75pDMCCLABjYEonXao9+JuFa/ZP53zfihvQL/c7FeZjozaQYDFpaX/fSxTR2KjgDoySxXzpMwJuH4ZZZ5wEZrc53L+twFqLzBDcIrGyNSbrSC9sa1NWkpqAKGRAmjfx5o1kAhe4kSZJN7cJ71KZhtogS9gHtV2Q1PaOSVcV5l12kIRTuT5zCWuBb3IC+je57bB6dUoUDKvPSGl4KbClXuf4EkBwZptKNf62YGZOcL8UznGPGimXs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(8936002)(66899021)(31686004)(2906002)(2616005)(86362001)(41300700001)(31696002)(38100700002)(36756003)(5660300002)(6486002)(54906003)(66556008)(478600001)(8676002)(6512007)(6916009)(66946007)(66476007)(4326008)(6506007)(186003)(53546011)(316002)(26005)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ty9jWU9HeEJrcjlXSnBJK2tSaitkL0pYOFVndGYxM25wREtqNm1qNzdHdi9K?=
 =?utf-8?B?bEtBMHdid0svcThDUlhTRXNnYzMxMjRlbU5IQkFPUGN6cnFRaHBjc0JjNnMy?=
 =?utf-8?B?aWFwMFlTQnc2S0drelZHUXlHOUJqaUlhaU5nbjhyNmRGQ2NBL0RMQXdrak4w?=
 =?utf-8?B?aTJ4RVBieGlDMTZwdTN5bXhpR1A2Qi85UXRLVUJkdUhZMjhYYVV0ZkszZjVu?=
 =?utf-8?B?a25EZXI4a2JOamZXc1I3MFpmSHBPSTZTZDU2bkdmOENYYTBNcklaV2tnOXZ2?=
 =?utf-8?B?eTNCWjkzQXRtM0tkb0FEcTFyTkdmK0ZvRHEyanNvdzNhbnZWYUlBWFR4Ymdh?=
 =?utf-8?B?Y2xFQXlETXZqME1vUndUQ2RJRXVXalNBWm5pYXdocjd3NVFCNFY5OE42Lys5?=
 =?utf-8?B?UVZiQlh2ZG16V29hOVZaUm1EMkdqWldVNTZ4QlBHZjA2c3djY1ZEQ0dCK0Rk?=
 =?utf-8?B?dUNnYklNZ0VSWTJlLzVYZkVJYVJFUE5LVWgxYkdFOUpGNnhTWTMycmJOblZR?=
 =?utf-8?B?R2JLcXd4bHpGQmU2NXg4Z2JTd1lXR01nR0NDTW9pV1hFazJzTFFHY0prSnBD?=
 =?utf-8?B?Y0h5QlJqNkZLbUlXK0JVQld2YUcvUnRCRWhDdkZGNXdVQXR2RVRTd0c0bVlJ?=
 =?utf-8?B?YnMweHdBdEE1c0ZrOGtubnFQY0JUKzJIRnNZZWNHcWNXdVJ5MVl2cEt2Y29r?=
 =?utf-8?B?M3RBOEs2NWdURkttRzZkRkdBcU1mc3RFQS9BTGh6dXowa25ieEQ1bjQ5UWw4?=
 =?utf-8?B?OEVwcWRRaWthaEdzTS9BRW9sTUIzbVpja3NCQ1NhRzJBWGRRUHhuY3Y2VkhW?=
 =?utf-8?B?bWo1VW9md2x3b29IRzUzVmNoTkhoVGEwR3F2cFJCcFA4WE5VbjdQMXZCUjFt?=
 =?utf-8?B?ZUFnRmZEQW1mWUxXdlBJNWNHQ3NGZUQxNjJJWmlEZUE4RG44UFVRdXhQSm5T?=
 =?utf-8?B?cVhOY3BQTUNwdHlTUEUxaVM1dEpJTk5XN2pzRmpmbjhBaVpxL05qeEdZSFA0?=
 =?utf-8?B?dmwwRk0xL1pKNmlncjJjeE5IaG1tYWJib1Jya01Eait3TXNtUlRRaGEwT2RC?=
 =?utf-8?B?K0g5cHZsRGJRaGM1bkNXRFYrcjhXWUtaUjZQVy8vQkNubFJkOTFUN1ZMaE1o?=
 =?utf-8?B?Q2kyUU1iYnp0TU1TRWx5T2RHVWgxUHlXWnZ6MG15bGljSWhrZEdVaVFRc2tl?=
 =?utf-8?B?azA0YUVpQnM4RWxHYVFTQ1NSaTAvelB0VzlIdHpVT0VyZjUzSExoeW9QUTlX?=
 =?utf-8?B?bUdWbXhMTzA4TDB0SW1SVDZBZXV6Y3VRQ2NNWk03SzRILytsUnN0b2NIYlU0?=
 =?utf-8?B?VFNFRC9ab0lLcmQrSkF5Smdod25jMWtxVitQYk1TZk0vMWtvenowZGtKNjVq?=
 =?utf-8?B?RXlIeHNMZXFSZDRoTExZYXFCSDBjUWtobXlua2FDUENIK2RPRzU1S0grUm9L?=
 =?utf-8?B?U3NSSTM0TjB3eVFXTGxHZHZ3b01Da0FUbkwvN1J3UlIxb2ZiaEdFZmc4Rmdx?=
 =?utf-8?B?cEF6NFpKcVl5aVJ3dXV6YlVOMnF4NXpiaE5rOGJzOUlPeHVsS1NNZ3cvNDZm?=
 =?utf-8?B?MDdhRlVReGR0TnNGdXNFQ3NVSjBCWEhoS0luOTVFYVF0Y2gzOW5Cb2tTS2Qy?=
 =?utf-8?B?eXlIeEV0UmpLNWQwODVQbW1EaTFOVkFTSGFKTStIMitjdkJQWWN0L3p4Y3J3?=
 =?utf-8?B?U01YU0RFRkxiT3hySnNGUklHcDFZTHRGZktEcWdPN2w4RllBRnZ5bVVVYjJj?=
 =?utf-8?B?VjhqVVh0cThkTEhJTDRCaUk0a0tMWEZTRGpJNmZzQVdHQ1FEL3hKRlZSVE9O?=
 =?utf-8?B?N0Q1MURBS0J6eWNXQ0VSYStrZHVzNFFuS3RiYk82bDBvbmtNR2JpWFVvdTdO?=
 =?utf-8?B?MWQ3YXNPWW5OcGJWNTY0cDFTcDJ2cTJjL0ZDSUNBazJtMEhmOWNFVGF4Smxj?=
 =?utf-8?B?aXdHMVNNYTg0UnhmRUVSOGlBUlJpYTdnTWZpM3JqbkRQUGpkSTBXVkFyNUp0?=
 =?utf-8?B?bVk5MkxzNUlraXpjSUtGeHhiaENkUEZJRnR5amxpN3FobUVkUTRyL21UZEY0?=
 =?utf-8?B?MEdBQW0rTWQyUXRkdy8ySG9zemNOMEtjTVFxNzlJbDUvV3RMakN1RGtlclFN?=
 =?utf-8?Q?jlxzinRY/o0qvnYZNfH2DEe3V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0b00d0-6c4d-4f2d-c6da-08db304aa6bf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 11:42:18.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2P9gWEGtBAnqDCoP1HCdNmkB/iLLnSrQiJcbZ/2xh787Wrc+tjomdzokZ4UPSUvI/lBOwB5ZHUWxhAyUsCncew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9314

On 29.03.2023 12:50, Oleksii Kurochko wrote:
> A large part of the content of the bug.h is repeated among all
> architectures, so it was decided to create a new config
> CONFIG_GENERIC_BUG_FRAME.
> 
> The version of <bug.h> from x86 was taken as the base version.
> 
> The patch introduces the following stuff:
>   * common bug.h header
>   * generic implementation of do_bug_frame
>   * new config CONFIG_GENERIC_BUG_FRAME
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two further adjustments (which I'd be fine doing while committing):

> --- /dev/null
> +++ b/xen/common/bug.c
> @@ -0,0 +1,126 @@
> +#include <xen/bug.h>
> +/*
> + * Ideally <xen/debugger.h> should be included in <asm/bug.h>
> + * but an issue with compilation can occur as <xen/debugger.h> uses
> + * BUG/ASSERT/etc macros inside but they will be defined later in
> + * <xen/bug.h> after return from inclusion of <asm/bug.h>:
> + * 
> + * <xen/bug.h>:
> + *  ...
> + *   <asm/bug.h>:
> + *     ...
> + *     <xen/debugger.h> -> some of included header in it uses BUG/ASSERT/etc
> + *     ...
> + *  ...
> + *  #define BUG() ...
> + *  ...
> + *  #define ASSERT() ...
> + *  ...
> + */
> +#include <xen/debugger.h>
> +#include <xen/errno.h>
> +#include <xen/kernel.h>
> +#include <xen/livepatch.h>
> +#include <xen/string.h>
> +#include <xen/types.h>
> +#include <xen/virtual_region.h>
> +
> +struct cpu_user_regs;

This doesn't need repeating here, as xen/bug.h necessarily has such a
forward declaration as well, for use in do_bug_frame()'s declaration.

> --- /dev/null
> +++ b/xen/include/xen/bug.h
> @@ -0,0 +1,161 @@
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
> +
> +#define BUG_CHECK_LINE_WIDTH(line) \
> +    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH))
> +
> +#elif !defined(BUG_CHECK_LINE_WIDTH)
> +
> +#define BUG_CHECK_LINE_WIDTH(line) ((void)(line)

There's a closing parenthesis missing here, as it looks.

Jan

