Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8797F7CE169
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 17:44:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618687.962665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8hc-0000Sd-4k; Wed, 18 Oct 2023 15:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618687.962665; Wed, 18 Oct 2023 15:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8hc-0000Pe-0v; Wed, 18 Oct 2023 15:43:20 +0000
Received: by outflank-mailman (input) for mailman id 618687;
 Wed, 18 Oct 2023 15:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt8hb-0000PY-32
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 15:43:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e43456d-6dcd-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 17:43:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9375.eurprd04.prod.outlook.com (2603:10a6:102:2b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 15:43:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 15:43:14 +0000
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
X-Inumbo-ID: 0e43456d-6dcd-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtQC2Mb4U8d0BOuLzBEPqRqlr5/FQzVvIh0Iiw12TeuXB9NnfIM9eIIEAS2VmqCck5hotSASxDU1BBIulnGLoxJMObH+gau7QLnHsnVx3VEKOMI0DfHZYlwjEnmnGtPNAU8bEXo81VKiIleYgfhY5+WMmUI4Ud9L/Kl7fc7uqywqlXHEBPpGvyU7/1osdilio1Zb2G93xT9iHglHkCc8vdy7MxUheaBQct2lh3nKtJmL6Ft0GIPQSidERUPTpkQeT43+VUCxgx6jpMdov/4e2TMw3jhHlvC0IiXN33VffbAjelf12wpHYuKn+Ux1IWgfeNnhHwbbL7jMgXL2k9Oesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/uvO/xyRT5iGCBG6rEhBQVzQHaCEz1eTNBLojXYlcs=;
 b=aHzzltPY5OepdqDzarVWBPSZA5EL7WxJSzCMxX461IO8CWGMDBCu7rAxx7jn8ee1vpXY29EkiTR4s1kuTpakDsjZ+6EFncAJeFOUdl5ZGw7rflFJ/R/cHlCfKt5Wl7zCcMJKVK2JsddW5RlhMzCw6AffvR2FdLfUC0hgUWmCCozSDzWyZ12D6XqxyytRP9i56SnzAaymfAMBfTZcQCHm/mPlz5L88ow+CULcZkp9Pvwz07lN2bKyijXy1JXvMkYW+XpO42mbPJceMDolOauOf+KiP2S2gtBQIdsJj/ndmKxKix4lMX0qr9gEFave/G/7HezCk8E/PWpmZFmsdoiuZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/uvO/xyRT5iGCBG6rEhBQVzQHaCEz1eTNBLojXYlcs=;
 b=Z/jahRVJ/cDMA0l02tqiVPyKzCMiDCk6ZiP0BWnrzS1kHxUrjKNqd3t+1cvZKeRSg5HlQ/7y6Jj7ysW2IOpTw4TGP2pXklqhrQ8r64m++A+eZwgAn2bgJXCCkPVEVIWAOfr8L16tl6TUlBcnNSTNmol69pInZKkor9ZxVATM3ZPQGhEVnpb7IOKtgw8EnB+lAyxMhhttHUCgyekESyKz+n6TN5i947ATFhJ+V3UPOLUuZbLeVyA82KHuipLzKg4zf9q8e+E8cCaPuGN3kK8OP+6Y/3Og5EEm2EidGYz0S/XQeTDxf+EmxZ9ZaXTwnoJY9sUKMi5dmmjFrzzkG8nHPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a5db276d-6bc0-1fe6-6cdd-7c097308fdce@suse.com>
Date: Wed, 18 Oct 2023 17:43:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] xen/ppc: Implement a basic exception handler
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1697220184.git.sanastasio@raptorengineering.com>
 <dfd134a6c59f329b62d2ecfaa37d74d70f8d4d90.1697220184.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dfd134a6c59f329b62d2ecfaa37d74d70f8d4d90.1697220184.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9375:EE_
X-MS-Office365-Filtering-Correlation-Id: 03eeb683-2b4f-4b11-3b31-08dbcff0f0f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2R7fhL0kB0KjOeyhQydxs8IWjWylY4xavrA0KKZXm3Q96b96uEGKGR8wgERgeMSGYKlptAJK7bObBmIcMNUh1xV9BeYtbUnwzCW/Sxx/5a36Kd2lTh3WAwoSIPJfdyd0gqQXOrNH36nhDhBh7ifxgpyEPbU4yfefIngsTQjp5oWerTsz/8tXBzxyCT+ItPcfZKpse2jIBrHnD/EEpp18EEmeEFHhuvCjmO0zuxDxcRi1j+KRXhVFBLgHfyW7IHvMfP//tGB8DRqhYUBxZwnh/kbsyrMz40jNn20aKpo+vz5x18RTWAV36C/n+VVFiDM1WX6C/MxUIs+ncEpt5P25rfTZbv+QgGODhAulg8KtP5+KWM3kY89FXgVseJ8R6f8BO6Ys3b6+2jG7QL/rIkvmRui3P9YmFv9Qcc4fI52bDBznSRgIkfsdl94Ugxy8u9VT+Jz1r1YKXnDZ1kV45QXlayBAWdoRqRnljc+DhOS6DUWQPem7t/pXUHnnwLaM6lHrMorqdmmP7agthbI6z/Bpsv6t88dJWIk91E5MKntq/5/6Q5kLPsmA5UBjdE69YwHQdw9ik3gNxbZHyyp+5Cx1M3qOrUSpRBlCj0NwVYnZWMrFK6ZakE41dESj2817rLELqmII9hhpdatXQDZ49/4Rgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(376002)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6512007)(2906002)(8676002)(8936002)(4326008)(5660300002)(41300700001)(316002)(54906003)(66556008)(6916009)(66476007)(66946007)(6486002)(478600001)(38100700002)(53546011)(31686004)(6506007)(36756003)(31696002)(86362001)(26005)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU80Ykl0OHpFYjBGblVmNS9EWlhncmNHdkNtMGpzZW1WSUZYUDVmcXhtaEVE?=
 =?utf-8?B?QWowWGNNZW0rQ0lhRVFZVmJMem5NS0E4dHhyNGRSejEvdGdMaDQwZ25nb0VN?=
 =?utf-8?B?ZWw3MVdwUGZ0TFkwb2JQM2YxRi9jS3FzUHhWbTRDVTJLZktuRC9YVURMczFn?=
 =?utf-8?B?NitaQnMzSGtmVzU4Z01NQ0IyUy8wSHBZVzV4aXhTa2QrOWVrQm5ZemwzV09I?=
 =?utf-8?B?RzlxVlhtM0E0MllwbllKTU40VDQwMVVZUnVRZjZhWDV6cUhyQzlIS2QxM0Yv?=
 =?utf-8?B?b3pEOWxCU2N0aSsrUktqN2h2L3E3WXp6RTdQcGdCZTJMeGlsdXcxZVJLdkxJ?=
 =?utf-8?B?dkRUaDFqeUtHNGVzRklMRjd0RWYxSU9xTm4rRTJkOFB6Y1VhRnZ0K0s5R1Fy?=
 =?utf-8?B?NngvMlFsQ1poZ3RwclZpMFMvOUF5Yk9nbEJTY1RqWUNIRXhCbGFKZi9CNUZp?=
 =?utf-8?B?cFpWaVcwV3l3VkVSb2dGSXVyYnBCQlpXK3VvNHBNUkdRUzZvYytUK3FXT2Vt?=
 =?utf-8?B?UC96SldkZllLZDVwbCtCc0Rka0RvTlFmbWdNZktCTmE3RXlzeGVkY3MvR2lv?=
 =?utf-8?B?UDRJV2Y3Y1ZRYitkNHFzbU1lN1F6Sm9jZUNHRS9YMHMrald6TDkvUW9hWTVx?=
 =?utf-8?B?a0RSOXo0T3BhNCtzK0lCdnNPWDhGVDdOTjZKQmU4NGxxUGw1WWExSzN4d2Fj?=
 =?utf-8?B?QTQvWm56TnVDdTFiUC9IVlhMbWdCMzlkcDJvMHhCVEU0ZnhzV09pU3FpRGF0?=
 =?utf-8?B?NmZJVjJoblh3bWR6NHJlSGNwbGxOOFlWNGllcjNNY3ppbmxIZGh6cXQyeFRG?=
 =?utf-8?B?cXRBNlpsZ1VOUUFoZGFFRkhUSng0aG5hWlFSQUozbnRMWUUrQzhUYkxnV29l?=
 =?utf-8?B?QWFuWlFCUGNHeWRxcW8wWkYwT3NTQXMzZHRXRTVQOW1vS0d6Rm1MVFpFZUxu?=
 =?utf-8?B?WGxoOHJVaTZIVjExNk5VcEVqdUR0WkJXSTh3c1dHam9aeWIyemtNUTcwVUow?=
 =?utf-8?B?OHdIaEhZZGtJRDVVa29JelpENnVjWWk5UEZDV0FISzRrcDRiR04xQVljZ1BT?=
 =?utf-8?B?dnJGMmdlVFpIRVh1NmwrcDFjZFR3RC82Ty9SUHlUZ0F6eVg2VnVHMFRrVXNx?=
 =?utf-8?B?OGM2bWFqY1ZnaTNpcGo1dGx1eVdFTEZTdGZjM0RQSWVQMzQwQVVmb05oZW9B?=
 =?utf-8?B?eFNWSmVIMTQzd241SGNzS3VtdDNYY1NGQ0tvSHlnTDU1b3d0c0FvamxRRTN0?=
 =?utf-8?B?V0V5dTVCWXJacitQdUp3QkwrZDYxeWJoYzg5eHhzbG4vdVBBQTdFUFo3c0l3?=
 =?utf-8?B?SGVlT1p1ak43bUVvbmJYMll2VEFHWTlROUZEbEtrTzNCaGdpL0IrQzB5ZG5B?=
 =?utf-8?B?OVJoUFllOUQwUjhBY2l6UXRuSmxsWS8rZ1lialB4dXhHSXpGMjhwb2RvOTht?=
 =?utf-8?B?WVdFcWQvQVNyU0ZtR1Q2WnZ2SHcxdE4rd2NOZFd4QTJPNjVTcncyaitsenNT?=
 =?utf-8?B?ODZ2cGVscTJCazEzSXNqbnlTMHFWOUxLdDNNUW5YSGFMRVRxelh1NXN0Wkc1?=
 =?utf-8?B?VHdhLzY2KzdLSXRJQWxzOGVPVm9qZXA1Q050b2QvNVgrZ0J2Ky9xay95TVl3?=
 =?utf-8?B?QWJjL0R6dkxGTW5VcWZNc0s0TkFTVkdSVmpjRVNnaEp4NW1RRXNDWXB0K2NB?=
 =?utf-8?B?eHRzRTc4Szl6dTVram00M2xraVcyZHJpOXhzMkVWbkVwclh5SkZ6d2wwQjFu?=
 =?utf-8?B?RlNZQjhjTXRLa05EQVdRZ1N6bkl6K1pJcUtiY2NBcFJpY1U2QU5tQndJWGg4?=
 =?utf-8?B?Snp5U1I3R1hqd2txZWsxK3o0YmI1QlYwcFJsQTR4QTY4aHFSNWMraU5iSy85?=
 =?utf-8?B?UWV6ZDdTUnV1QVBLVWRoRm9XQUV1TUVqNFRQN3dTcTZkVnh1ZTBIaGE5cHoz?=
 =?utf-8?B?OHEzdTFlTk9qOXp1MHdmWERSMEJldnpDenE4dmpWeXpZcWR6SGZhWk9jaEdD?=
 =?utf-8?B?UGhGZXJwK3pzODRkQ3lZVUZUNzR4ZjJGRzd1N2RSMlRVM3MyMld3SUJKdm1I?=
 =?utf-8?B?M3JHSC9DTTFaSWMyQ0QwZUhEdVpjQ0FPWWhVRHRSSnZQR1JpMTNiZGlwYzJy?=
 =?utf-8?Q?rZgWqFe82JOQsgYZ8M72PTqeI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03eeb683-2b4f-4b11-3b31-08dbcff0f0f1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:43:14.6880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpcNXH0hCGbvBF4W+bQXQ8na2tinTdpGhPTcfzk366FTWXHAJbhcrl/Nyyq9iFdizqMOa1Q3sfkeopjDpTDh2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9375

On 13.10.2023 20:13, Shawn Anastasio wrote:
> --- /dev/null
> +++ b/xen/arch/ppc/ppc64/exceptions-asm.S
> @@ -0,0 +1,129 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <asm/asm-defns.h>
> +#include <asm/processor.h>
> +
> +    .section .text.exceptions, "ax", %progbits
> +
> +    /* Helper to dump CPU state to struct cpu_user_regs pointed to by r1. */
> +ENTRY(exception_common)
> +    /* Save GPRs 1-31 */
> +    SAVE_GPRS(1, 31, %r1)

This won't save the entry value of %r1, but the one that was already updated.
If this is not a problem, perhaps worth a comment?

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
> +
> +    /* Save LR, CTR, CR */
> +    mflr    %r0
> +    std     %r0, UREGS_lr(%r1)
> +    mfctr   %r0
> +    std     %r0, UREGS_ctr(%r1)
> +    mfcr    %r0
> +    stw     %r0, UREGS_cr(%r1) /* 32-bit */
> +
> +    /* Save Exception Registers */
> +    mfhsrr0 %r0
> +    std     %r0, UREGS_pc(%r1)
> +    mfhsrr1 %r0
> +    std     %r0, UREGS_msr(%r1)
> +    mfsrr0  %r0
> +    std     %r0, UREGS_srr0(%r1)
> +    mfsrr1  %r0
> +    std     %r0, UREGS_srr1(%r1)

Except for these four lines the two functions look identical. Is it
really good to duplicate all of the rest of the code?

> +    mfdsisr %r0
> +    stw     %r0, UREGS_dsisr(%r1) /* 32-bit */
> +    mfdar   %r0
> +    std     %r0, UREGS_dar(%r1)
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
> +    .size h_exception_common, . - h_exception_common
> +    .type h_exception_common, %function
> +
> +/*
> + * Declare an ISR for the provided exception that jumps to the specified handler
> + */
> +.macro ISR name, exc, handler
> +    . = (AIL_VECTOR_BASE - EXCEPTION_VECTORS_START) + \exc
> +    ENTRY(\name)
> +    /* TODO: switch stack */
> +
> +    /* Reserve space for struct cpu_user_regs */
> +    subi    %r1, %r1, UREGS_sizeof
> +
> +    /* Save r0 immediately so we can use it as scratch space */
> +    SAVE_GPR(0, %r1)
> +
> +    /* Save exception vector number */
> +    li      %r0, \exc
> +    std     %r0, UREGS_entry_vector(%r1)
> +
> +    /* Branch to common code */
> +    b       \handler
> +
> +    .size \name, . - \name
> +    .type \name, %function
> +.endm
> +
> +

Nit: No double blank lines please.

> +ISR exc_sysreset,   EXC_SYSTEM_RESET,   exception_common
> +ISR exc_mcheck,     EXC_MACHINE_CHECK,  exception_common
> +ISR exc_dstore,     EXC_DATA_STORAGE,   exception_common
> +ISR exc_dsegment,   EXC_DATA_SEGMENT,   exception_common
> +ISR exc_istore,     EXC_INSN_STORAGE,   exception_common
> +ISR exc_isegment,   EXC_INSN_SEGMENT,   exception_common
> +ISR exc_extern,     EXC_EXTERNAL,       exception_common
> +ISR exc_align,      EXC_ALIGNMENT,      exception_common
> +ISR exc_program,    EXC_PROGRAM,        exception_common
> +ISR exc_fpu,        EXC_FPU_UNAVAIL,    exception_common
> +ISR exc_dec,        EXC_DECREMENTER,    exception_common
> +ISR exc_h_dec,      EXC_H_DECREMENTER,  h_exception_common
> +/* EXC_PRIV_DOORBELL ... EXC_TRACE */
> +ISR exc_h_dstore,   EXC_H_DATA_STORAGE, h_exception_common
> +ISR exc_h_istore,   EXC_H_INSN_STORAGE, h_exception_common

Aiui these are required to be in order, or else the assembler will choke.
Maybe worth another comment?

> --- /dev/null
> +++ b/xen/arch/ppc/ppc64/exceptions.c
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <xen/lib.h>
> +
> +#include <asm/processor.h>
> +
> +static const char *exception_name_from_vec(uint32_t vec)
> +{
> +    switch ( vec )
> +    {
> +    case EXC_SYSTEM_RESET:
> +        return "System Reset Interrupt";
> +    case EXC_MACHINE_CHECK:
> +        return "Machine Check Interrupt";
> +    case EXC_DATA_STORAGE:
> +        return "Data Storage Interrupt";
> +    case EXC_DATA_SEGMENT:
> +        return "Data Segment Interrupt";
> +    case EXC_INSN_STORAGE:
> +        return "Instruction Storage Interrupt";
> +    case EXC_INSN_SEGMENT:
> +        return "Instruction Segment Interrupt";
> +    case EXC_EXTERNAL:
> +        return "External Interrupt";
> +    case EXC_ALIGNMENT:
> +        return "Alignment Interrupt";
> +    case EXC_PROGRAM:
> +        return "Program Interrupt";
> +    case EXC_FPU_UNAVAIL:
> +        return "Floating-Point Unavailable Interrupt";
> +    case EXC_DECREMENTER:
> +        return "Decrementer Interrupt";
> +    case EXC_H_DECREMENTER:
> +        return "Hypervisor Decrementer Interrupt";
> +    case EXC_PRIV_DOORBELL:
> +        return "Directed Privileged Doorbell Interrupt";
> +    case EXC_SYSTEM_CALL:
> +        return "System Call Interrupt";
> +    case EXC_TRACE:
> +        return "Trace Interrupt";
> +    case EXC_H_DATA_STORAGE:
> +        return "Hypervisor Data Storage Interrupt";
> +    case EXC_H_INSN_STORAGE:
> +        return "Hypervisor Instruction Storage Interrupt";
> +    case EXC_H_EMUL_ASST:
> +        return "Hypervisor Emulation Assistance Interrupt";
> +    case EXC_H_MAINTENANCE:
> +        return "Hypervisor Maintenance Interrupt";
> +    case EXC_H_DOORBELL:
> +        return "Directed Hypervisor Doorbell Interrupt";
> +    case EXC_H_VIRT:
> +        return "Hypervisor Virtualization Interrupt";
> +    case EXC_PERF_MON:
> +        return "Performance Monitor Interrupt";
> +    case EXC_VECTOR_UNAVAIL:
> +        return "Vector Unavailable Interrupt";
> +    case EXC_VSX_UNAVAIL:
> +        return "VSX Unavailable Interrupt";
> +    case EXC_FACIL_UNAVAIL:
> +        return "Facility Unavailable Interrupt";
> +    case EXC_H_FACIL_UNAVAIL:
> +        return "Hypervisor Facility Unavailable Interrupt";

Every string here has Interrupt at the end - any chance of collapsing
all of them?

> +    default:
> +        return "(unknown)";
> +    }
> +}
> +
> +void exception_handler(struct cpu_user_regs *regs)
> +{
> +    /* TODO: this is currently only useful for debugging */
> +
> +    printk("UNRECOVERABLE EXCEPTION: %s (0x%04x)\n\n"
> +           "GPR 0-3   : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
> +           "GPR 4-7   : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
> +           "GPR 8-11  : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
> +           "GPR 12-15 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
> +           "GPR 16-19 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
> +           "GPR 20-23 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
> +           "GPR 24-27 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
> +           "GPR 28-31 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n\n",
> +           exception_name_from_vec(regs->entry_vector), regs->entry_vector,
> +           regs->gprs[0], regs->gprs[1], regs->gprs[2], regs->gprs[3],
> +           regs->gprs[4], regs->gprs[5], regs->gprs[6], regs->gprs[7],
> +           regs->gprs[8], regs->gprs[9], regs->gprs[10], regs->gprs[11],
> +           regs->gprs[12], regs->gprs[13], regs->gprs[14], regs->gprs[15],
> +           regs->gprs[16], regs->gprs[17], regs->gprs[18], regs->gprs[19],
> +           regs->gprs[20], regs->gprs[21], regs->gprs[22], regs->gprs[23],
> +           regs->gprs[24], regs->gprs[25], regs->gprs[26], regs->gprs[27],
> +           regs->gprs[28], regs->gprs[29], regs->gprs[30], regs->gprs[31]);
> +    printk("LR        : 0x%016lx\n"
> +           "CTR       : 0x%016lx\n"
> +           "CR        : 0x%08x\n"
> +           "PC        : 0x%016lx\n"
> +           "MSR       : 0x%016lx\n"
> +           "SRR0      : 0x%016lx\n"
> +           "SRR1      : 0x%016lx\n"
> +           "DAR       : 0x%016lx\n"
> +           "DSISR     : 0x%08x\n",
> +           regs->lr, regs->ctr, regs->cr, regs->pc, regs->msr, regs->srr0,
> +           regs->srr1, regs->dar, regs->dsisr);

While surely a matter of taste, I'd still like to ask: In dumping like
this, are 0x prefixes (taking space) actually useful?

> --- a/xen/arch/ppc/setup.c
> +++ b/xen/arch/ppc/setup.c
> @@ -11,6 +11,15 @@
>  /* Xen stack for bringing up the first CPU. */
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
> 
> +void setup_exceptions(void)
> +{
> +    unsigned long lpcr;
> +
> +    /* Set appropriate interrupt location in LPCR */
> +    lpcr = mfspr(SPRN_LPCR);
> +    mtspr(SPRN_LPCR, lpcr | LPCR_AIL_3);
> +}

Please forgive my lack of PPC knowledge: There's no use of any address
here afaict. Where's the link to (presumably) AIL_VECTOR_BASE? If that
address is kind of magic, I'm then lacking a connection between
XEN_VIRT_START and that constant. (If Xen needed moving around in
address space, it would be nice if changing a single constant would
suffice.)

Also you only OR in LPCR_AIL_3 - is it guaranteed that the respective
field is zero when control is passed to Xen?

Jan

