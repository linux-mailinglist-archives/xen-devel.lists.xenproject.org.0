Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D762B6BCBE4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 11:04:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510464.788133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckSV-0002W7-Ak; Thu, 16 Mar 2023 10:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510464.788133; Thu, 16 Mar 2023 10:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckSV-0002U0-7w; Thu, 16 Mar 2023 10:03:43 +0000
Received: by outflank-mailman (input) for mailman id 510464;
 Thu, 16 Mar 2023 10:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pckSU-0002Tu-25
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 10:03:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2ed5946-c3e1-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 11:03:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB9756.eurprd04.prod.outlook.com (2603:10a6:20b:677::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30; Thu, 16 Mar
 2023 10:03:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 10:03:37 +0000
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
X-Inumbo-ID: d2ed5946-c3e1-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQRNiPVfT9PCTjCwgEaeEuJNG8tkA7q6Hc6doHVfn3pMkAbg9eyCTKVhCzos3pOZEjHYNyWrG2FaWmyKWmKdflI+mMWAAc2hbGoVO/ewVAATxwwTld+wxxEWx0MceU9mxQWVLTo4hpQnvCPF4npuQJvArdcHNbPJG7QumdehZeWw1ZK7WZFi9Q0QKKbzBo/N8/9gEf+misVSPhH5wSuoZ2O4MTpZYSNKPmGZIPql6w9XRTZb3mA1Edfci9L/GEofobxY0d2tEO7sk8T5e5Rh4u+CY/LsuDFb5kRJGUzN576322c488yE1MnwS8W5QZww/cev2BYpAxKlQ56QdfQizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXTzzJUkCtDqqUlt7FxsYPan2Zwl34CHjO7PZ30Iutw=;
 b=Wwydl01/oRqNtWSy3YXkGOmB0HVGizIFUc+pIDg/1NJ1qlDdanM9pG6CH5T2SSZwv1L6gDWSp8JO7yIG25sGs8eTqv84UGs99oNCNzf52wZA8NLstQxAPQIs93xf+gEzxfiLlK9uLDu6/+N2piM0pnLsEbEgmVj/QfDfl3EF3p2OEZnidv1TwcbNCtmkzzGO+d8kl1gy/8Y8uOGJbalxfbRmLlOkUv6xlag8BST2AezkTrDX+VJ85OqLUPWcPyRerSHSoIWibf6WXrQqazRA4XXza/YV0M3jNVzueysrBAgqdAan7kqM4NA/r2orCnDZPyuVIkiz7zVha47P27rG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXTzzJUkCtDqqUlt7FxsYPan2Zwl34CHjO7PZ30Iutw=;
 b=M0Ip0mJ101fnGmJCaenzgr5KQTh4Aeuu2eJT0BTnJPPlhtp/RhNt2T/g8oB/CTdxXKXw8UdkAAVaepZ+iaM1ZXHRszV8RzOMnCYXPLDnpR5ETcbhxStFFl8eMRjkbRnvzqrwB5BJjnNeJxZsWoJl/pO5VCVUPJxrlD3Klna/pqul2P6We8ZvCAGbGT8TF4HAQuCT8MCSj28TZQbmHBWVGgT6TUTVd6bDnfMF0OG6YtgWFUL0AXTEZTJ0wzx0h0/9AGQXHXw/1aEPGwXG9pBlXjqS56ENAcCvPKGJmyjYTXQoSwoR1mSqiM3yRf/wmPmkQEb5zFGwCH3+a1K7SBhDdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02c454d9-e716-a571-2106-a8235c1adbee@suse.com>
Date: Thu, 16 Mar 2023 11:03:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
 <2afad972cd8da98dcb0ba509ba29ff239dc47cd0.1678900513.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2afad972cd8da98dcb0ba509ba29ff239dc47cd0.1678900513.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: decdd239-8959-4b11-f35a-08db2605b5ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y4gdWapaIvBEaF1XJkKhfepjqzdtgOzaLKlKK0MXzdU5WwgWvfz/JSZGw3uvR/aPOEwisTxmmomHyP/88H8etxnAs6kI03MK5OzTploNwRb76xffktULIDvoC1dUThLs9Cc2fLX8ljsUF6e4rC8lG20u/GYR21xZifsLYeXc9QYNTxS/ZO9VrW3p8YtCW/EAbpmXwvxrAAYQ7IAnoeFww87zirZ3lHI/PNtLwAp8zVLlJWK3P1CSuOVXlw0fRJ51mWuM4N9coIEqWwPmTM1Z4lVBWpde5hf/djo/J++eT3jWaQX3TbuZjSOS1futCGME57rUBx+fP7WUUrd2k2PRQB7ix4soPX9ES8bRnm9CytrhK/WMeHeYS7Pd8pv4nWh2SuPscTPbY3k8e7wYv5a1MZn6nLA7krImN15Vb/VCqP0DOoLhOtexgRlyaN9hJTyAP4kwgN5gXf2IKfw+WLb+hK9fd1txkfIM2jLs+YZtQnSojjJiKLNS85RSH82Qs7fuZlmmHpCldTVF5xyczWQJ1RLUUXL/E9F1Uop9TB9ET3vkNGrG1aFELl89OmY6isrLIJXUt/gxh7zxMBs413ax9D8sbZR0lwaVH06HY/b4UEjPC1H4mj08B6Sx6zXZ7KFTSmv75+lc3Zy6ZsHrPHo0IDSsZk+TSWZxRz96K5UMSAPWuC26LCrliLOM/N9APoZpJmBOOPSeqFWocfN1N4BQby1KM3viguMPWPytgH9lInTGYclrpBN3NAZSXQ5KkXmc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199018)(36756003)(86362001)(31696002)(38100700002)(4326008)(2906002)(41300700001)(8936002)(5660300002)(6916009)(6506007)(2616005)(53546011)(186003)(26005)(6512007)(54906003)(316002)(8676002)(66556008)(66946007)(66476007)(6486002)(478600001)(66899018)(31686004)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QklRYklPVEZxSExuaWpMcWJrdGhvUVZucE5GMStOdWU2cXJMRzhHUll6QzBs?=
 =?utf-8?B?MEFHZjJqQU9Zck8zWFZnN2dWNnBrVGRpZzBnQW1tYmVvbnB3M25LTE1weExE?=
 =?utf-8?B?cnNtNG1taFlaejJJcEJkUU1qWksrWkh4bnpNS3NRZGVub29FdVkxaHZSRUgv?=
 =?utf-8?B?WC9qQVJiRHFUemtURklYNC9RWXZCLzg0ZnVCZ3ZITisrNGVoUWVXZVRlalhX?=
 =?utf-8?B?b3dWeVIzNUJlaWtPWldvellJVUEwTnc3VDZQd1E1ZnVCYnpzOUN3cU45bHBI?=
 =?utf-8?B?MFpaNDFwNGxDcE5MbWVFUUlFeTN4bEVqYVB0cllCMkdTUWJ1dmR5eUx3MWNq?=
 =?utf-8?B?ODIwTkdXK2tveXV2WDhWMDA1aUJZbVAvdVY4S2J3V3NkY0dRQktrSm1mUUpQ?=
 =?utf-8?B?RnFNQm9SZkhpTmJSSFhrMkd0ZisvTHJuNnBGMS9JOG5RRnlhTzhCN3ZWdlJ0?=
 =?utf-8?B?aHRkM1R4RStTZHArU1pTSDRNV3h0dXptVEJmaWlCajF3bENxWU8rK1Bmblhr?=
 =?utf-8?B?M0dGNy94Rjl5dldJVHVIRTh5bitpT1B1RlgxZEN2eWVXL2ZHZGFKc1hrMEtr?=
 =?utf-8?B?RDJXbzNWblZySDVhekp3Qmp1dHN3UTV2Q0wyVElKZ0xVcnd5OTZSSjVXR2FR?=
 =?utf-8?B?LzlrQ0dQVitDUHNjODBWVE95L2YzWVh3WWwyQjg3Mit4SlBGRE15Y2NGeWo2?=
 =?utf-8?B?NGRVT0lLUmREaS81dXIvelBjd2lTbFBhdG9uUTJXNlNDSWtlTkNkeGhQelQz?=
 =?utf-8?B?cCtEL3l5U3QzUjl4ejMzTUdGZDk3MzhEczFGNWlnMGI5eWJia3AvSG1DeXc4?=
 =?utf-8?B?S05YQzBVVUJydUU1cjVnVHhObnhTRHlQazZ6TFp4N0ExVFl3TENkbWMxeXRy?=
 =?utf-8?B?dExQb0FkNktyN1ZZYVlQSmNseGtlaklxeDhreXdOMzBlb3VrR3YvczcxbEpL?=
 =?utf-8?B?eWVINUM5enlQWloxUzliemJRcXM3L1BteHR2NTJ0MWoyMDFtVWhGV3YrazNC?=
 =?utf-8?B?dTFwODVTQVNCc1pCV011QWdPNmdLdzRXUCtWaCthYXBPdmhKOW5qMXY0OVBH?=
 =?utf-8?B?WHNWdVN1aE1nRDFmZkNiL3grTlBsL214Tm1VbUlEOXlnS3FvQW5DV2kvRW1M?=
 =?utf-8?B?eXloenFuRUxQd1dTK2hlN1pKTFFsZGN0cXVsRHhMMDhnVENYbmVDc1l0M3Jn?=
 =?utf-8?B?S1ZORklEVlN6YVVUR1hTSzRGeXBGTk1zRTQxZkh4SklTUzl4VlduT3d1R0Zq?=
 =?utf-8?B?bmN2dndIbklBOTRUcWZld3ZzckhrUzR1MGZaYVc2SnU2QWQycWdaaVRhR1Zs?=
 =?utf-8?B?YWV2U0Uva1I3T1Fxb3d2WVQyQ1ZEMDJpSFY0V1g5NTNkTXpRQmhZamdYbUZF?=
 =?utf-8?B?VGNURE81OHdDWVVrVkRWZG95dkh3MGVuTFBYd2hEcFhwMEFaeUdhMnk1R05O?=
 =?utf-8?B?ajhQMGVuMzRyV3ExRDN0L0t6NTI3WC90YnVMcHNOak1mMHhjREJsNDR5eXlW?=
 =?utf-8?B?RHIzTFJiRWVTaldFK2E0SWE0enB2U1hldjFESkU1bVM2am1RcVNEemE0cGUy?=
 =?utf-8?B?NnhGMVYwUTlQcmw0RmIxbTBuZk9ncGp5ZVVCZWtxQzE0Nzc1S1FrWkFwMlF2?=
 =?utf-8?B?cUtLMDJlaTZFRm00THdKTnh6c1NQNjdwQmw0SVBieTdYU1pNcm14QXdJaUlp?=
 =?utf-8?B?OUxXYklsKytHN2NFS1EwZmhEQU10akI1Z1VETUc1cWtQN0wrUWNtTEJ3bjIr?=
 =?utf-8?B?QzlIeTJaT3dqOHFqR2F3WVhtdDk5SWFybWpjaEY4UjVnM1RIdWlUWVRKODQ3?=
 =?utf-8?B?OXRxak5nczdFWmdlOCt1UzFEZW9BSWJCOUx0WWlhdDB6NHpqYXlGQ2dMZWZl?=
 =?utf-8?B?blpBMkJUc3EwdlBMaGpmRXNJYzNFTmtXNzJBTXJOTldrbUZIdXRBVFhUaHdz?=
 =?utf-8?B?V1NORDk0bnVLNlVsQ3FDc0xwcnA0NStJZ1JIRW4vWitzTVF6bm1IR2NNRXRh?=
 =?utf-8?B?Q0xzMERuakFOaXZEbDJ3VkkrYzFJeGZwSTdZZ3JhcnMzbVgyM2xDSXcrT095?=
 =?utf-8?B?NXJBZHRVOFFjanRSWW13K1V5RVZFSWNVSVpORU83SWVtdGlZM05Wekt5OWdZ?=
 =?utf-8?Q?FGAZbHUlwyuB3aV2P859p4/dH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: decdd239-8959-4b11-f35a-08db2605b5ff
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 10:03:37.4761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBe0bFOlneHDcQyogXknCcTpoUrXJEBQzcdx4Y2MJWmVvCnXAbmLViJ35tDsasDrlTZRGrsZV6S4FWDlweBuTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9756

On 15.03.2023 18:21, Oleksii Kurochko wrote:
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

The patch looks good to me now, but as said in reply to patch 5 I'd
like to ...

> ---
> Changes in V8:
>  * move  BUILD_BUG_ON_LINE_WIDTH(line) to "ifndef BUG_FRAME_STRUCT" and add #elif for
>    "ifndef BUG_FRAME_STRUCT" to define stub for BUILD_BUG_ON_LINE_WIDTH.
>  * move <xen/debuger.h> from <asm/bug.h> to <common/bug.c> to fix compilation issue
>    ( more details in the changes to the patch [xen/x86: switch x86 to use generic
>      implemetation of bug.h] ).

... get away without this, so for the moment I won't offer R-b just yet.

One further note on naming (sorry, could have occurred to me earlier):

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
> +#define BUILD_BUG_ON_LINE_WIDTH(line) \
> +    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH))

While this and ...

> +#elif !defined(BUILD_BUG_ON_LINE_WIDTH)
> +
> +#define BUILD_BUG_ON_LINE_WIDTH(line) ((void)(line)

... this look okay-ish here, ...

> +#endif /* BUG_FRAME_STRUCT */
> +
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
> +#ifndef BUG_FRAME
> +
> +#define BUG_FRAME(type, line, ptr, second_frame, msg) do {                   \
> +    BUILD_BUG_ON_LINE_WIDTH(line);                                           \

... the latest at the use site the naming is somewhat odd. I'm inclined
to suggest something like BUG_CHECK_LINE_WIDTH() or BUG_CHECK_LINE().
Aiui the use of the name is isolated to this header, in which case making
such an adjustment while committing would be feasible. If, of course, as
per above no other need for a change arises (i.e. if in particular the
xen/debugger.h inclusion cannot be moved back where it was).

Jan

