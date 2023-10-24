Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B26577D4C81
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 11:34:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621780.968574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvDn3-00082g-KL; Tue, 24 Oct 2023 09:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621780.968574; Tue, 24 Oct 2023 09:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvDn3-0007zk-Fs; Tue, 24 Oct 2023 09:33:33 +0000
Received: by outflank-mailman (input) for mailman id 621780;
 Tue, 24 Oct 2023 09:33:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvDn1-0007x0-MW
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 09:33:31 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe16::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62596d51-7250-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 11:33:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8670.eurprd04.prod.outlook.com (2603:10a6:102:21d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Tue, 24 Oct
 2023 09:33:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 09:33:23 +0000
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
X-Inumbo-ID: 62596d51-7250-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DluhwJQpubRDl4aafl1z8FDZwZptr6L2WMpiPnWWIDT4OuOqocw9gQ76FPZkx2H3kLnBHPBUwALqRgpPRA5X5hVJ/1RQSCzDWPGnuxhv9aAAbf+9oA8e54kpMmPPhz/mVG08MaB5Ypy8LRwD74f0xehbR8xtWo+BX4ZtWTSQ8NieZwt0kCR2cmGaECH4QYlWMpzYGt9tfEmDnse0+SFUq+CgmBoE5uoISVa08O2ef9PnpTmWtNL1XO45ndyf0/G1SHBq0dCUEx+nwFrfdImuu6zASSDKyyBBKkmUtZ5mKsqPq3p/vlM7AZ99zIGtv+VASX915FTvSe2U/bpILeb8iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToeKBogxLrArv+qO9UF73wQkr91/0cvOLAU+bZEDLkk=;
 b=CdjL0GtGH1TJYv3l/92xk+NS5+nnUQM6bP4HINGYWA/eh/BqDVmZeT4Lxsm7zELQN65bFvNNzHiQ8zJaBsUIOqmPBE/ud5v/VhE+R7miGIzT4aVpt6onfHC0Uy+e17Iy8x+s87Shec7F40YOr59Pnif8kcnj0/bjQX7HFypqTsYf9GDJGLfh4huppZD8iwXPY1hvcWqp1w9AariLDiG4VXyekdAwZkd1kGSzkO2JTOcSErlvT7q91cUminINe6CJ6L8V/eGAmNTVhYdPDE+TnsUpmA0uwzEqQay7qKDwTtHa5GuscEW6G1YmrweKWwagR+/+vJTQwleVsEN/AHygUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToeKBogxLrArv+qO9UF73wQkr91/0cvOLAU+bZEDLkk=;
 b=wt+KDXuD15hDniS/Q1ZRePW4m3BREx5bMwHvecq/uACJ+rGlPd4cxpL+WXc1HPyyWw+UkqNxzIs68Ki9O4Q55MpuRrQhVB58D1F0mb9WKp1Kc/S1IjKFcjtX21m2FeFA4la22NoNHqf7FUKb/Y+c8OaMusa2mEIFAsS+4PSsgvp/uG0Tb6nAH/Vv9HFt8wcGTD6sbWKUEWx8goj7wh/WvxW3CMZk8nh+J6jObMIdhoxsMtCf6OUc6UisaZX2b9B9KwLBeawdxJKKrWrKjjqIPaxSO+rfuYct6f2ZeoiQZD7OHXWFbQvjXTA4ly/3nLpuuEpGL236FBdR2Rk1u0mptQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a525cc49-69e7-c509-61d4-a2456b3fdbcc@suse.com>
Date: Tue, 24 Oct 2023 11:33:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/i8259: do not assume interrupts always target CPU0
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231023124635.44266-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231023124635.44266-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: 2125cefc-7751-4536-91b1-08dbd47444b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uLC0O50/WHiZGst8O2QNEWsMpY7iuG2U0OBROcPwFLYiY24wC1auyk8hGV+RXrHSHt++rjhzbvn0LWwk8lfne6jo2PSdq3tdf87LlSWKBOwhtZO4gCPtGVAyR/MeX+npLWALS1avpqO0/v/AQ9WTQoLBaxeipc+nQ2ct/LtQcqEAGgwf26540QsUakxxUBcyXbPbOaV6NRlnyhatpIxHBkwW44CCj6jakRdSaBk87Aw1rT8hzPQ5GYoj5J5SK3fWNZbA4ujdc7GROXEJ5tV8Y1b6in4bMOnvM7dW28QDZ6eeH70LUiXT13d4wWcju53QteWdpA1o1aPDEw2CiFtsPhxZ0P+RiVprayGs5Nn5KaoGbJ/qrw26wDMaN15/n2i8PfkIzC5j9Xdso4BpbbyIobIdEvhWPxG+MkniPLH72HQTkFweP31ZzSB09DJ5lSBUz0qt/B2gZpszquaNWPi13NBZQJHGdIi31roWRzSFpZayNBhQFvocKFGCWUFnCfzY8NL/1TTQb4P/kgNV4ur58eS5KklZS655QIEa9ePp8nUjcWgbIvpeZcyXjXhjrNIqc7mJUc3RB6r4P5Igiit5rhjA+4OdoorwQkA5AkksDnHSTJpUoPlfCqKZGBln/KmF54nGpdkImtxpB1IerDo17A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(83380400001)(53546011)(6506007)(6512007)(38100700002)(26005)(6916009)(66556008)(54906003)(66476007)(66946007)(31686004)(6486002)(478600001)(2616005)(316002)(4326008)(5660300002)(8936002)(2906002)(31696002)(41300700001)(36756003)(8676002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3QyeVdwZ2YvalRPOG81c1oyVFlnNDlISERmYzVRNmxveHZlZ2o2STIzWFc2?=
 =?utf-8?B?a0FaQUFQU2hsRDQrSXh5S0NpaysxR3VZRmZ0V2ltNm9sSWF4TTJWM3hiTDhF?=
 =?utf-8?B?VGJFbVdTbllxekpmdkN6WmZjYnB1MTJJV0Q3SEJUZGV6ZzgvSnRoNnoySzAw?=
 =?utf-8?B?Wmt0WXR2NDNwcTdncXF1NmJnS3ZnSTBPRm9Fa1Zhb0tKaCtrSnJLSjQ0NC9P?=
 =?utf-8?B?TWdOOVB0dmxVNFFhdmQ5Q3FXeVVVbUtkTThicm04emE4cDNBZE1rbkpnRFE5?=
 =?utf-8?B?WWRMMVp5NTVONXdCYjAwZG1EUjdYZ3VXUVNnMG5yVEJNcTlmbWZ1Nk04UTJ1?=
 =?utf-8?B?Y2ZGbFJBaXJIRm9QL3hLa2xtV0YrK0JJS2hOUFROcWJ0WWUrOElIcGd4V1pC?=
 =?utf-8?B?NWRQYUtJV3hneFdMTjdabmptbnoweEpwU3c1ZXhRWlBrSDlZV3hjQWNMbVc1?=
 =?utf-8?B?eEEwekc1VldoSk9kNmY5bGE4QVVDSWJPcC85VzJVSXI5ZFpQU01UYzFUbVZk?=
 =?utf-8?B?aTlyK1BNYXlXM2hOSmo2c25VRVRKeHA5QmFPYnpscmhqYzFNcG5wOXlPbFFm?=
 =?utf-8?B?TmxnbUZjRUdlbWZzQ1luTTIyKzNTd1VCWTk5WGpyT3dKd2liTk90U3BPOE5M?=
 =?utf-8?B?YVFiNC9tR1lRNG94V3B3R1huWGJrQnBjRGE1cVRPMkhOdlBIdkRNcUs0NEl3?=
 =?utf-8?B?Z21WVENmMTd5dmtIZzFNZzBPeHlOU2NWMEUyVE40d1BKQ1FCOGE0Nk1DUEdp?=
 =?utf-8?B?N0lYS1hTWTJFY1NwYTNIVStyNDVqVGx1SHRaT2REYndpOG1iS3BlRTRtdjNK?=
 =?utf-8?B?SmcveUxBUzFXUVdBSHJlSFRsVWdOK0FkNVZCZ21xSkQ4d2JtOGFWUzRpWndt?=
 =?utf-8?B?Q2xhMFB4cUU2R3RMOW42VjZVWjBkVjlaa253RUZFS1NMa2lCYnk1TzJpZ05q?=
 =?utf-8?B?cGQ5dTZxWmx2Tm1jTVRnbFBPWTQxWmU0T0xydXJoV0doQnplRWtQT0RwQ3Zz?=
 =?utf-8?B?TmhKaEpuSWNZYXFIanhwOUdoUUtUWituelpRdWNlVyt5UzB6UzFYeit0L3Rz?=
 =?utf-8?B?ZkJUTUI2ekZ6akQ2eFpDMk4ybldiUVpGeG5aNkJuUkttdlI3OUVCR1hjNFV6?=
 =?utf-8?B?aU8rcWdQci81QWdINERtc1paMENRdlpZZUUwUElmbVl0czZSbHNIdW55bWN6?=
 =?utf-8?B?dVQ2L2M3QWdKbmdMMDl0WVpKcTk2K3JPcTdObFVyMHpTV0Fmak5NNkZpRTZM?=
 =?utf-8?B?emRyQ2xKMndsS211eVQvdWwyemg1dHhtMnN0b2pGNFI4VGwrOXpJNUUzcHV3?=
 =?utf-8?B?Ykk3TlFmSGRMYjRqWlEwc0JRaHp5MzN4THFsZ3VKN3V4amh4Q1VqaTJxL1o1?=
 =?utf-8?B?b0VMakF2VHNFQ2pabXhHcVlGbFhPajFxU3lrb0hheXpwbk8reThMZEh6OU5N?=
 =?utf-8?B?R05zc3RSc2s5UTNnMWEzTFpLZEk0cTRMS0NHMnVEOGlMNTJYSFVFcWJtcDZO?=
 =?utf-8?B?VlAwcU1iNDR2QnJwenJnU3NLa2VpaG80Mmp6NU1NOGxHam1NM1RlR1dKYUl6?=
 =?utf-8?B?bUh5WGIxQ3dyWHBsQzMvS0hHVTVOOXB0cWdRc05ITW50UEN6cWp2eTZIYlor?=
 =?utf-8?B?NlNrc0RTTWJWYVNIL0tHTWV0MWgxRFBYOUF2Z1B1OUYwaE9CdStYUEl6MWZ1?=
 =?utf-8?B?MjFsS0dKNW92cnd6ekpEVldQM043Zjd2cWg2aVlnMzJ6dVdscVZLRHdITDVW?=
 =?utf-8?B?ZDdpYzRaa3hSaHlEdnJ3QUhSSFNCK0h1UlBERTBmYlZnOENyQUJEbzUxcGND?=
 =?utf-8?B?di9WS2hFZVhXeEk0dXBDMVVsNGV6MkdnQnl5SU9TeDdwVUUvM2RrR01WVytU?=
 =?utf-8?B?akwxWjJRVE1BcDJjaFh0T0JSL3M3L1pidGtWeTJTK1YvMFkwMU9QS3EwQ285?=
 =?utf-8?B?dVFLQkFzWnMyVUpEZm1HcnBOSkgwMDVIa3Z1RWlob3RYU3FxbmJtVkdiN0hF?=
 =?utf-8?B?NnI5OUZRVytWV0NaKzAwUWlwc21DTU01VGE2OVZYbGY1OC9renRVdDRmY25V?=
 =?utf-8?B?Uys3eWVaaGRPb2RXUVRJWlNuUEJ2Mk1FVjNkNlBYSDkzUlJ4aHpSV0ttUHNO?=
 =?utf-8?Q?JqKQxlItPRRjUXdlmU3yLD7N0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2125cefc-7751-4536-91b1-08dbd47444b9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 09:33:23.8572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hi1Wh8+1elfhzMB2Ne9S5Y7UJlkSnW5T2OL1c4Kpdo0znqwVqKlf4G3Df2JfyJNl8pUwInFEf0Bxb102LvWk6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8670

On 23.10.2023 14:46, Roger Pau Monne wrote:
> Sporadically we have seen the following during AP bringup on AMD platforms
> only:
> 
> microcode: CPU59 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> microcode: CPU60 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
> CPU60: No irq handler for vector 27 (IRQ -2147483648)
> microcode: CPU61 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> 
> This is similar to the issue raised on Linux commit 36e9e1eab777e, where they
> observed i8259 (active) vectors getting delivered to CPUs different than 0.
> 
> On AMD or Hygon platforms adjust the target CPU mask of i8259 interrupt
> descriptors to contain all possible CPUs, so that APs will reserve the vector
> at startup if any legacy IRQ is still delivered through the i8259.  Note that
> if the IO-APIC takes over those interrupt descriptors the CPU mask will be
> reset.
> 
> Spurious i8259 interrupt vectors however (IRQ7 and IRQ15) can be injected even
> when all i8259 pins are masked, and hence would need to be handled on all CPUs.
> 
> Do not reserve the PIC spurious vectors on all CPUs, but do check for such
> spurious interrupts on all CPUs if the vendor is AMD or Hygon.

The first half of this sentence reads as if it was describing a change,
but aiui there's no change to existing behavior in this regard anymore.
Maybe use something like "continue to reserve PIC vectors on CPU0 only"?

>  Note that once
> the vectors get used by devices detecting PIC spurious interrupts will no
> longer be possible, however the device should be able to cope with spurious
> interrupt.  Such PIC spurious interrupts occurring when the vector is in use by
> a local APIC routed source will lead to an extra EOI, which might
> unintentionally clear a different vector from ISR.  Note this is already the
> current behavior, so assume it's infrequent enough to not cause real issues.
> 
> Finally, adjust the printed message to display the CPU where the spurious
> interrupt has been received, so it looks like:
> 
> microcode: CPU1 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> cpu1: spurious 8259A interrupt: IRQ7
> microcode: CPU2 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
> 
> Fixes: 3fba06ba9f8b ('x86/IRQ: re-use legacy vector ranges on APs')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Do not reserved spurious PIC vectors on APs, but still check for spurious
>    PIC interrupts.
>  - Reword commit message.
> ---
> Not sure if the Fixes tag is the most appropriate here, since AFAICT this is a
> hardware glitch, but it makes it easier to see to which versions the fix should
> be backported, because Xen previous behavior was to reserve all legacy vectors
> on all CPUs.

I'm inclined to suggest to (informally) invent an Amends: tag.

> --- a/xen/arch/x86/i8259.c
> +++ b/xen/arch/x86/i8259.c
> @@ -37,6 +37,15 @@ static bool _mask_and_ack_8259A_irq(unsigned int irq);
>  
>  bool bogus_8259A_irq(unsigned int irq)
>  {
> +    if ( smp_processor_id() &&
> +         !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> +        /*
> +         * For AMD/Hygon do spurious PIC interrupt detection on all CPUs, as it
> +         * has been observed that during unknown circumstances spurious PIC
> +         * interrupts have been delivered to CPUs different than the BSP.
> +         */
> +        return false;
> +
>      return !_mask_and_ack_8259A_irq(irq);
>  }

I don't think this function should be changed; imo the adjustment belongs
at the call site.

> @@ -349,7 +359,22 @@ void __init init_IRQ(void)
>              continue;
>          desc->handler = &i8259A_irq_type;
>          per_cpu(vector_irq, cpu)[LEGACY_VECTOR(irq)] = irq;
> -        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
> +
> +        /*
> +         * The interrupt affinity logic never targets interrupts to offline
> +         * CPUs, hence it's safe to use cpumask_all here.
> +         *
> +         * Legacy PIC interrupts are only targeted to CPU0, but depending on
> +         * the platform they can be distributed to any online CPU in hardware.
> +         * Note this behavior has only been observed on AMD hardware. In order
> +         * to cope install all active legacy vectors on all CPUs.
> +         *
> +         * IO-APIC will change the destination mask if/when taking ownership of
> +         * the interrupt.
> +         */
> +        cpumask_copy(desc->arch.cpu_mask, boot_cpu_data.x86_vendor &
> +                                          (X86_VENDOR_AMD | X86_VENDOR_HYGON) ?
> +                                          &cpumask_all : cpumask_of(cpu));

Nit: Imo this would better be wrapped as

        cpumask_copy(desc->arch.cpu_mask,
                     boot_cpu_data.x86_vendor &
                     (X86_VENDOR_AMD | X86_VENDOR_HYGON) ?
                     &cpumask_all : cpumask_of(cpu));

or (considering how we often prefer to wrap conditional operators)

        cpumask_copy(desc->arch.cpu_mask,
                     boot_cpu_data.x86_vendor &
                     (X86_VENDOR_AMD | X86_VENDOR_HYGON)
                     ? &cpumask_all : cpumask_of(cpu));

or

        cpumask_copy(desc->arch.cpu_mask,
                     boot_cpu_data.x86_vendor &
                     (X86_VENDOR_AMD | X86_VENDOR_HYGON) ? &cpumask_all
                                                         : cpumask_of(cpu));

, possibly with the argument spanning three lines additionally
parenthesized as a whole.

(Of course an amd_like() construct like we have in the emulator would
further help readability here, but the way that works it cannot be
easily generalized for use outside of the emulator.)

Jan

