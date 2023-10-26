Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F8D7D7E04
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 10:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623555.971493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvLA-0008GI-LT; Thu, 26 Oct 2023 08:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623555.971493; Thu, 26 Oct 2023 08:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvLA-0008DR-Hc; Thu, 26 Oct 2023 08:03:40 +0000
Received: by outflank-mailman (input) for mailman id 623555;
 Thu, 26 Oct 2023 08:03:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvvL8-0008Cu-Tj
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 08:03:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a4c7a75-73d6-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 10:03:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7658.eurprd04.prod.outlook.com (2603:10a6:10:20d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Thu, 26 Oct
 2023 08:03:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 08:03:07 +0000
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
X-Inumbo-ID: 2a4c7a75-73d6-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEyGhS/6lFf7ZWu3dOs4aA+RREy7mgsm6E6Qmbm5dbo2S3iJIoHjVScJLfCCrv4kVeS9ER/NOdplEEdrFfFLT6+VTCtVWmGj3QA79d6TqywXgCsQ6UyYjTSFNEkSgpys1AtZ6h2nmLGt8SIlzIosEXfmZ4HABhjD8ugcl9ZE9hMRNqi3XnWQBWkYW+YSV4iZehtsV6wNDg1qQ9Rpp4Yyr1AlbcmOBQByfVLnFcd/ieuKfDvsx50sVLWnY9JS4XTNt4MjhvwbHT8kUy9CebOHC2yXJITTXuvUDRFOpf2TMKSa1Cz+ywAkerQAnMvo+7sVQtlhLLfGkEYcUD6Y1SuEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msptUi6HYJ/aRRYoMs+pZIPQrCpy+XmWxF7UOq0j7vo=;
 b=n1yqrcJdgj65oqg5aNSJW6KMWcds6MBDCp/9xZI2th+JKLXd0aMu3e9EFec2ku0yVNsm0Ezfy1kyP3qgX83Xm/o70sTuKIQhByr45R3AH8uEq1+GPqrsfykMkfnewP1OJ+wHcGBsh1dPb6HJp7lxPlX85tSPSoOcTzWbwcLGuILTbeKFgrapGx2QTG12G3vSCAkYptPPhEj9o8eHduPSDlKblrBAoY8GDZuDVSi/feg1hNqv9cxkJ5WmdFmtIoNKJkmm+lAtfwMYIBWd64OcVBXrYj1MFL93ln/rNFh+ERku81lrDfqVi6OwEkFstW/Ib29/1zxb0k0OnwtKZPJJ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msptUi6HYJ/aRRYoMs+pZIPQrCpy+XmWxF7UOq0j7vo=;
 b=FSR+E6q37apyJ++LQC+b1dbpij+JDmeKcR6TgpgidCfAnuDrpfRgvjc8MPajtNs11JMBZZ1Yb4izXEKl7HtD5jfYC1N1H0bKEjO7o4ZM4dQ0VQaPyj3vLMUFAF404jYR3G6HdwlPXxTGow09OBfpUD23myx4aJjI/ErR1+JaDpCXhWPeQ/WvZx8CLezWaZDV9abNKT7ceuWR1eOGgvTlEHGIuSb3anlTepKdBalJr9+v+H3991xZPbbCd865ZiHzGF6C+gNKDTp9tTF6yDhMi/OTnxbKEjb3pmFT8+AB2tnPO5TQMXCVVqoikl4Tp0Wa1TeMM2Mx1pRpmxEurjhycQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6757b3a9-9556-c658-fb01-ce0ff68ab027@suse.com>
Date: Thu, 26 Oct 2023 10:03:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] xen/ppc: Implement a basic exception handler
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1698273423.git.sanastasio@raptorengineering.com>
 <1d875c978caa4ed0b3d038655a39aa0cb0583565.1698273423.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1d875c978caa4ed0b3d038655a39aa0cb0583565.1698273423.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f62892a-27c2-49c7-92c2-08dbd5f9fd17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1T8HnoCoXz8MKKabMRFt7LtMjLxNzABcF/eck0DBLFvFkeBl+Vame/4mVElMUd8rpGab1Abb3Q3zzPMobCTcbmONsZ2xXyNuStYgJnk5Oue3o/mqcJShfAXmiVkKf5qkaIbbnVdFW2T3yyndqouDVV5Dq4UrAhEE52dCIuiOmfVJ5FbL6KR+fF1krci1h0bAWp26cFyzXIfB3l7knv7OUswJak5WGmWwAuUn77WaJXSnhcymdPH7fDQYAI5gIDNPB/j/LkorK1Cois4b5wW/5mTjTlELEbgOhXcem3H5upmFE+UHvUJoS9KPDnK6XFe61ee1Ivm1ewHEvGPBpFeNou2YeVTsrAIhjSqupPfsrEAoVT5QYmnWUzslJTS4gU2t2FXLAF79sarArBuUviCWQeqaqbat2R9nrFkDsjaaTja4vs/LNMUPS9UTmqi/NKyFVxmMRSe2qY86GIuqWb8A4Y1xnaicY4iQjoNlp3LvvHr4qokJhnaV0HyN/ZUpfkZK0kTawJhQNxHySZ2/1mMr2Yqh0eCCOUzhWbY0y6lYDp0kgTanBQpf2EN2Sqleaekfo5eisFXxoqcq/ITHghxwlrfqa6WlTnbfz3ZziD50cEnfSwICtpELrZiXPq6LJ5GHpLFjvkRXLbYgzyvMnOZ85A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(26005)(31686004)(38100700002)(41300700001)(2906002)(31696002)(36756003)(86362001)(5660300002)(66946007)(8676002)(8936002)(4326008)(478600001)(6916009)(54906003)(6506007)(66476007)(66556008)(2616005)(53546011)(6486002)(6512007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0ZYdXhHNXBzY2FXa3Y5L1ZWbktwSlNoM1RxVkpCTCtKMkxqUmRZclJ4ZFlk?=
 =?utf-8?B?SUZwTUJ3bEI5NWdSblJyYXlYVG93K29DQ1g4SGJ2SzN2OEgxS1JMdHE1Zlhu?=
 =?utf-8?B?ai9ZNWg0cUU3T0NsS24vNmRURmtvSWZJam0vL0V4QzlWL2w3NnU3dHhHNXRT?=
 =?utf-8?B?dDRXaTFFN3hMaEhWeXFMYjBvbFBrV3NxSk1GbEluL0VDMXllUW9zZHlWUHFa?=
 =?utf-8?B?L1g5akgvUk9pSU5HbzVoM3pPcUhEemhHWmZ6QnpNejBDYlRGYnU0RzhnR1Z0?=
 =?utf-8?B?T2J0eWhvbDFOaDAwNnUxTUg5NEdOM2llOE5ObDJaMXdRbDdYUzJOdHI2Ymsv?=
 =?utf-8?B?MWFBbkhFMnN6OGxHRC81K0lFaXViMjNpMG5EeE1kVmdoeXR3dUZIOG55OHI2?=
 =?utf-8?B?ZlIxOFBSaXB1WmszQXNrcHNpZUdDV1NJVHR1T0dxcWZ1REptRDZyR0pjamln?=
 =?utf-8?B?UXZITHQ4SzRuVWFZR2F1Q3VRZmN3MXpLMDE4T2xHNm5hWGlPdFVvbHZUcFRO?=
 =?utf-8?B?Zng1aXcxVFNDYXpmU1FzYi84MnNlYUNBZDlGNWx2RngwNkEwakNtUEtlYWJS?=
 =?utf-8?B?cmZac0dXRVB6SWppamlZUjFLNE5WQzMzNHhDb1RHSTJzcFQ2MHdrYVRFRDJ5?=
 =?utf-8?B?UWdERVk5L3MrOXdaZVMwa01LZjlGY0tudDFCTHdoNkJPRFc4RjNQYTFtNTRU?=
 =?utf-8?B?cFJpaittK2hRU2Q5Z3lHN3pTQjYvVVpUMzl2UjlmZEw3blNKSTU0TS9GSVRF?=
 =?utf-8?B?dmlVL1NaTzlnc3NRYTJ0cEJpN0EvRGZRVlRUb0pjN2xJcEs2MXBleGpZUGtU?=
 =?utf-8?B?ZUlKQllwakx2RzMxTmJobm9KOEhybDZrMFlaSUtOendwVlZGWFJZb0xmc2Vk?=
 =?utf-8?B?UTlMVjJ6cFBnc1pPMU1HRmtSRUo2T2dGYThReStNTjVJV0JKWXlHZWlUb29p?=
 =?utf-8?B?N1orTjZVb1loTmR4dXV6dTFXdnNtY0w1SkwyeVYreExHK2NXcHZadWhCTmJ3?=
 =?utf-8?B?Zk5va1BkZ0laSTA3QXRxb0d1b2dzU1V0a3RBZ0hZai9HR1NYaXZMWElyZjJN?=
 =?utf-8?B?YXU5TGEzT1AzeEdVNU84SE5iT3BTQVphZlh6RVNNUmJkRmR1RENkMzljcEhM?=
 =?utf-8?B?cmZRVlJ0dDJlbEMzeXJBam14dFh3UVFTUTdtYlNHWExiNjV5aVhCeXZKb2dJ?=
 =?utf-8?B?a29uZndXVnZsRUJPTUgySWlXOWwydDRZTFMvYTgrK0Q3WFJtdnRmMzZWNUNN?=
 =?utf-8?B?b0IycGpWSGdtUlJGRTd2SFpWcFlORjF0dk13MEpMM0RJQ0lCZHIrZHdzTUs2?=
 =?utf-8?B?MWZyeXl1VWVnMzlsdlo5SHFkZ25uaW5WMW01UklRWElqeVNzL0dwcE9KRDh3?=
 =?utf-8?B?U2FwU2NWdGFXNDhKU3l6U2lHR25rd0p1YkFNTnh6UjY2UkRBS1g2dWh4M25F?=
 =?utf-8?B?N1ZkeEZxY0FoWGxIMm5LaFMrbTZISDd4dXFpME5ybVc1S0c5NDNoR3JjN2M5?=
 =?utf-8?B?cFN4MWJPU2FVNHRzVzJQejhPL09sNmN5UUpLcmNzT0IrbkpiSGVwYnpKTFhy?=
 =?utf-8?B?TGNyWHpkd3JsVHpCRFFXcjFIa0E2YXg3MHJmaUFJQzVBN0s2MThLdkhkcExp?=
 =?utf-8?B?anhmaTZTUnM1TE03M0dJbXI0R2hja0UweTlKM2RFUUNBRS8vaHhtRE1VQlhF?=
 =?utf-8?B?b3pPa2pRZEZYVzRaWi9YTjVvUDR5Z1VlSjQ0VlpUR2V6U2E2ZVpSRjNFcjZD?=
 =?utf-8?B?dGdJRGFSWnpFMDJIV2tnd0xCaUxOK295S1owdmEwTGNib1JzRG9KQ3VhaG9I?=
 =?utf-8?B?YWo5eUlPSitqcWJWNW5mTktTK2dXRjVQVWg5YzFFTUxjSktLNXg5d3lGdXB2?=
 =?utf-8?B?NU1ZYmRNWGlnbTZBaXpVd3VuUWczYkIzcUJhTHBzYlZ3SDhLQ2V5U2ovYjg3?=
 =?utf-8?B?WlRja1JoK2ZUZ3hwdnpyNEQydkhXeEdtZnBqT0dKSmkvTC9BcnpkL1VEOUIy?=
 =?utf-8?B?cHd5RkdWaXlnNUttYTFjSUtndUNlS2VXWmwwQkYwek9iSmhXWExQUEF5UHFj?=
 =?utf-8?B?S0g5NDQwYjkrMjUvODVndkFZZHNPUDFVTC82cnorT0lGalVNdWlOVC9tcmhr?=
 =?utf-8?Q?1i/DKqNpMOd5G5gk1bOS5YIJh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f62892a-27c2-49c7-92c2-08dbd5f9fd17
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 08:03:07.3937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcSP5AhyE67iE1O+jHigafkS/WRM3qvzQgGhLvSAY8y5m0n9NtbqMWHfIg+S53pZ8Nzp9cENbaQjD11Q50m2jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7658

On 26.10.2023 00:41, Shawn Anastasio wrote:
> Implement a basic exception handler that dumps the CPU state to the
> console, as well as the code required to set the correct exception
> vector table's base address in setup.c.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Despite me being unhappy about the disconnect of the constants
Acked-by: Jan Beulich <jbeulich@suse.com>
One further remark/suggestion though (happy to take care of while
committing):

> --- /dev/null
> +++ b/xen/arch/ppc/ppc64/exceptions-asm.S
> @@ -0,0 +1,135 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <asm/asm-defns.h>
> +#include <asm/processor.h>
> +
> +    .section .text.exceptions, "ax", %progbits
> +
> +    /* Helper to dump CPU state to struct cpu_user_regs pointed to by r1. */
> +ENTRY(exception_common)
> +    /*
> +     * Save GPRs 1-31. TODO: The value of %r1 has already been modified by the
> +     * ISR, so the value we save isn't the exact value we had on entry.
> +     */
> +    SAVE_GPRS(1, 31, %r1)

Wouldn't this comment ...

> +    /* Save LR, CTR, CR */
> +    mflr    %r0
> +    std     %r0, UREGS_lr(%r1)
> +    mfctr   %r0
> +    std     %r0, UREGS_ctr(%r1)
> +    mfcr    %r0
> +    stw     %r0, UREGS_cr(%r1) /* 32-bit */
> +
> +    /* Save Exception Registers */
> +    mfsrr0  %r0
> +    std     %r0, UREGS_pc(%r1)
> +    mfsrr1  %r0
> +    std     %r0, UREGS_msr(%r1)
> +    mfdsisr %r0
> +    stw     %r0, UREGS_dsisr(%r1) /* 32-bit */
> +    mfdar   %r0
> +    std     %r0, UREGS_dar(%r1)
> +    li      %r0, -1 /* OS's SRR0/SRR1 have been clobbered */
> +    std     %r0, UREGS_srr0(%r1)
> +    std     %r0, UREGS_srr1(%r1)
> +
> +    /* Setup TOC and a stack frame then call C exception handler */
> +    mr      %r3, %r1
> +    bcl     20, 31, 1f
> +1:  mflr    %r12
> +    addis   %r2, %r12, .TOC.-1b@ha
> +    addi    %r2, %r2, .TOC.-1b@l
> +
> +    li      %r0, 0
> +    stdu    %r0, -STACK_FRAME_OVERHEAD(%r1)
> +    bl      exception_handler
> +
> +    .size exception_common, . - exception_common
> +    .type exception_common, %function
> +
> +    /* Same as exception_common, but for exceptions that set HSRR{0,1} */
> +ENTRY(h_exception_common)
> +    /* Save GPRs 1-31 */
> +    SAVE_GPRS(1, 31, %r1)

... better be repeated here?

Jan

