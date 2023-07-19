Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A85937597B7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 16:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565894.884489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM7oG-0004sM-DZ; Wed, 19 Jul 2023 14:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565894.884489; Wed, 19 Jul 2023 14:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM7oG-0004pW-AP; Wed, 19 Jul 2023 14:05:44 +0000
Received: by outflank-mailman (input) for mailman id 565894;
 Wed, 19 Jul 2023 14:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM7oE-0004pQ-Nx
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 14:05:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe13::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5884e540-263d-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 16:05:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8401.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 14:05:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 14:05:38 +0000
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
X-Inumbo-ID: 5884e540-263d-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i21FzI5H8IHIXQAMGBj3Ps2CaJq4OhqOOM1wzU76PMfiKPz3uCxJoLaQYGZNp7dR9/enjhTagUTvOxtexkuvqRwpqA0eA8cvID/4NletrWd2bsvH9wfomUiyOkznJy149hiLPpxkfsi6fJ82vH/64zVYsDphZtAvV8G9RDVnhGWCRuekZWrPu3CNh0CIrNnX8sAU+Tvw72WBtGohpuuITmUEWZPyNuoUdojbwWl2uw8QXwaefQ7eoJNdAFjsOR4Dmsj8G+4Nu8TYRN+efCVtTJgjMP8CMtgJbmsQPLsxb9hmQBDBvu4d238fRsJK5fhIYEugXveoL5eCDs5+w4Mg2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iR/uHbFTNyiPmrVvR7D7PJSwy7SEshyigRQxJeSxNik=;
 b=IQgp9GCVOx7oUjXfkEM7gsDlT7nZtt+z9lWsdpm1FkA6/N6Mex5iXDqejFdkmKLgot1sltChdjIYv6MMagKSuSib8KERbGTltd4iY+8+howrkEMhhkzQ8jFVcpm1Kbald/fD7W71dJ87b8ZXkW4/kGSJ97s6aAU9CTHDV7eAGFqNrm9vr5xYiCHf9qq6kkdjKhooTXQx5kS+gkxhrsrQ449XoAGSSYPUYSWw66qSO2IeBhgilwLgfk/dYqCXOGqfFbLH9eecQTU2mRrLN5VCgi8+bTiK3COWJhLud6/uP3m+Cy1umDnaCv3FamqtwN4+/EEHNxp1GtDYEO2FxuXtCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iR/uHbFTNyiPmrVvR7D7PJSwy7SEshyigRQxJeSxNik=;
 b=1Xy6kHAdzKow9Kcq8jaodMejAtP8LVaSZlT4FT6WRwa98dt/X+5xHmEhJJkQWl2hZ0u1vgv866HehC1s0GRR730BS++3crVEnXVu1sZiCcTofnhOv+HBwsTB3pSOXHflJVyFUmNNmyHfS40tFQqDaLxz1uXLMjsiNM4ytj4+9CyA+584rxSxVHdD3c1PSJFt0zgLGnUpVvuq2MXozIY9G0Agzdr54FO/YRD/B0+HdsvXgwed0f1AzbzVgwsyHVVmk+EFcr2E9qFTUbdnsJOeNK+jT2niYYy+ks3WJcRpV3fRJ2wfwlBp44qkN2lu39L0kHo9q3iRkdZcxSDfsenhrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d3b7cd6-7d6a-8d28-f1e7-7e939e393445@suse.com>
Date: Wed, 19 Jul 2023 16:05:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1689710519.git.sanastasio@raptorengineering.com>
 <7c416ff843ea359bb24b8c954cc079fe1bbaf75f.1689710519.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7c416ff843ea359bb24b8c954cc079fe1bbaf75f.1689710519.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0a2242-fb58-4a4f-0863-08db88613b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ochOJcbv+TyC0ognu2u1AjsBlJXl5JE28kW+6TrT7H7+ywSxmmTzb7hP9QG92SmU9aUW07Do1tkWiTHJq+qg9WZWgRP7rYwAypNMIKJiO1QBFeZgOx0J1NXlsrUb2l4q3ErmRW8wNph6DLpFxXXfGWV2Y6LdQwPECMbhotNFzgnzI7AN96BPU+6tTEtth98LyGJxnRiqFs6k3vth0Hg4uJkRH+t45Cg3SYa8qakPPTRbJGqnO9pkAidx6VUe8NvVUqx9Uh3mZluDZp7rStevBTQeFC/T1Zf7HgJwCBRux9JXLSuUEfS3SRqf0VP+sEBBJkghQVzFKCwrBR5+/D2/V2IhrCDAksbsz4cp5Ad1jOElFVkr7UZpj/0vySQxgKNInAfP5DAl3E7qvbcasf5X9Vaq4VtG/cfGmI1wQHYh/m8Bocuv16AA1e3D76cKhY5m5aWQP1qLc8f5eyDmzxDnz4/3qe7bq+jWJtkx8tey2uVe0AxA4VaskCc6PF696Vnq4MgdB2Hu+xjdG3PWwlmJgXd4LrsnywVydktHsfSyb/1K9i+Da9A6afSwBoGuAS/1gBGhix7Mi9zpfA6ouU4sbavvV40SMvCJYPzDz3dHHOBWBXXi2+lGpn+Hut9QmTCz/GiEHthTTjM2rusojvSuXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199021)(54906003)(6486002)(478600001)(53546011)(26005)(6506007)(186003)(6512007)(2906002)(5660300002)(66946007)(6916009)(66556008)(66476007)(316002)(8936002)(8676002)(38100700002)(4326008)(31696002)(86362001)(36756003)(83380400001)(2616005)(31686004)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHUvTFpWcEtJWnR6ZE1xWHlrQUxxNWRTdHpqYVNZL0hNYXROREJyM2hDOS81?=
 =?utf-8?B?OHJ2OUhLWTViZEV4eHVKOEN3azVYSFR4dFlOOCtPWDRUOENDa0lyRlEvaWZk?=
 =?utf-8?B?TzNCVlk3R2p1b0RIeGdPS0VZcWZoTmRTaldLclFBQzJYMjQ2TVQ2RGRmZmxO?=
 =?utf-8?B?by9kMU5CQzRNLzM2UUJXaDBRK3dCcEJFUXFtdHIxZXUyTWpzeHlPa1ZseDVV?=
 =?utf-8?B?NCt3UUtpa1NqOUdsMHpDbVAwb1JVZXdkak1FVlpmdG50dGVlQ3h4dk1uS1lX?=
 =?utf-8?B?UGI0RHhINzV2Mkg4dUtGc2VwRG1UOWRkV3VXc2dvVlZJcFRQUTdPazd3WFZF?=
 =?utf-8?B?TlVEZmp4bkcvOXpwVCt1U24wMEFoWUxTdHBmZHRia3FUZXVCcTBQYjJVK0xP?=
 =?utf-8?B?ZThQUmJ0eHplUUtHeGdOc1dUZG1UQndoUXZHNFJHdldUL3l3eFpKWUl5aVN3?=
 =?utf-8?B?c0plMFErSGtLd21BWHlDRGRBRldzbEpPQ2hMZDZvREhGVE4rRWZGR1VRLzlr?=
 =?utf-8?B?TXRRbWIycEpQRC9HRUJPNUVWMzBMYXZmZjcrUWxjR1E0S3FZMmplSVZ4bWph?=
 =?utf-8?B?d3JHSU1PYUVXNUMxRktxM2x4MU1KR3NtT24vUE5tTlBodVptOFpIWDA1Lzdw?=
 =?utf-8?B?UnVGamFVMUdGeEZFcDNUdVNPajdmbVIzdVVWZmxqL2kweS9iRk5VRWZ1YU1j?=
 =?utf-8?B?MDJQRHVaTDE0TUhNQUZhU29CcEMvcUpuYUFacVk5SFZBWkJhMTlQdm40WnA5?=
 =?utf-8?B?M3JFbmFRWnpJalc4SXNVemxWZExvMFZId2VicVJFWHZGb0tnelM1czREZkJl?=
 =?utf-8?B?eDVaNFYwRlNxV1BYVGp0QTJZbzRsWmhMZE85M0NVQ1ZSZzE5Q0VKMVZWNFgr?=
 =?utf-8?B?cUlUekRWcnh2WDFzMVpxY3hnMnBsd2x0SzNkT1BSd1Nsc3BVeUFQd0hSTUVD?=
 =?utf-8?B?REFBajBEVi9RV3hFYUpMUW11VHo1R1VUQi9VOThncDZyVjZZZ3FJYzdUOFl2?=
 =?utf-8?B?SUhxVVZDYzBDOUxQMnRPQllDZ2F0b3hvYTdsdEk5dG1CTkY1d0lsY0s3OXlC?=
 =?utf-8?B?K1FiQXFBbDRhM0EyRjdQSHNlcjVFSkRHSWcvekpNL0wzVEljUWNsdUhXUVBP?=
 =?utf-8?B?dHcwVVc3ZlV4QnorYXZndmlxRStYRkpBNXRKdTdjVjFDZGZQRWJwcThIZGhN?=
 =?utf-8?B?MFUxc2QzNk1ESmRzSTBFSklzazllYmpjWVAvZktmOUc5Tnp3Y1ljREpzNHk1?=
 =?utf-8?B?ZUdXVkNIaDZZTVRQNzAydFhGWVNtelVpTEY1bDdpajdCVEJMc29uME1QSWw0?=
 =?utf-8?B?UVNzdDl6SHlJbkVqb2tiT2I1c3k2dDU3S0dXWFJMQmkzYS9DczNsYnRLTjBF?=
 =?utf-8?B?VnorbGlMMnR1MlQ3d3orMjB5L3NyTVcvUjFLSHZoYU1SL2lxdWJuYzJBM0E0?=
 =?utf-8?B?Y1pHY2xuTzFGaTlWVUZET3REcGMxMmttRlVpYW5UZ1dkTzJLa3c5NG50R2J5?=
 =?utf-8?B?b0lneDhlV2c0UktlUEpFWWVjVHJtcVpmVDhYSWVacWs3dUxnWHpNNDlYOSti?=
 =?utf-8?B?TG5DR3RIQThBWVNFbFZXNXAvdDJVQzVXZ3d3Y0hGWUZLbmYzSlpjV1ArQmIv?=
 =?utf-8?B?dnZrZjRib2ZXcE55WUZvOTZTQU9zU3dNSTNGTVJDU0FlZ3dqeGcvZnMwQkdj?=
 =?utf-8?B?aVhzWFVPZWdURVJzeFIwUGpDRDRWTVU4VWUzczVkRjZaanZvNW4yNmU4YklE?=
 =?utf-8?B?ZUo4S25DWEQxeW14bzM2M3o1a3B6eEpYQ0x4Umk5MFEvYTh5YUE5ZGtoRk1o?=
 =?utf-8?B?d3FneVRFaGc1cjk1RXB1VmhMYjhzQlorZEYrOXl5aEg4d3hocnh5anN6NU9h?=
 =?utf-8?B?TlJWTDdlS3lpT2c0WUQ5dUgxVmlqWFZlTFBjUEp4UEJwaTBNUHFUMm5yUDBm?=
 =?utf-8?B?RUJsUUVra1VRclNCNWErcStDSXIxUmpmaDlzWldDQXpjRnQ2TzFTQXdxenY3?=
 =?utf-8?B?N0JOb1RpRGM2dE1JdGZ5aDc2ejg2aGV4cHNaMHJIbFpxMEZpQUVsV0xSdUFW?=
 =?utf-8?B?VmFaWEtQU3pWUGI0dWV3UUtDS1pwenR1bmNUd1BDdzREcy96MzZjcTRXa3J2?=
 =?utf-8?Q?lfsu3vdyZST12KYgYIGWmmd37?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0a2242-fb58-4a4f-0863-08db88613b14
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 14:05:38.8652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 287lxlQMM2rBpAg65Lpvb1SkSnENTemRE+ocN2A6McFFyF30hw3ml+Q6S4EpQ8QgY1zXwtyh4jpiZ9e5KJr72A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8401

On 18.07.2023 22:20, Shawn Anastasio wrote:
> +void __init boot_of_init(unsigned long vec)
> +{
> +    int bof_chosen;
> +
> +    of_vec = vec;
> +
> +    /* Get a handle to the default console */
> +    bof_chosen = of_finddevice("/chosen");
> +    of_getprop(bof_chosen, "stdout", &of_out, sizeof(of_out));
> +    of_out = be32_to_cpu(of_out);

Can any of these fail, and hence lead to ...

> +    early_printk_init(of_putchar);

... this better not getting invoked?

> --- a/xen/arch/ppc/ppc64/asm-offsets.c
> +++ b/xen/arch/ppc/ppc64/asm-offsets.c
> @@ -0,0 +1,59 @@
> +/*
> + * Generate definitions needed by assembly language modules.
> + * This code generates raw asm output which is post-processed
> + * to extract and format the required data.
> + */
> +
> +#include <asm/processor.h>
> +
> +#define DEFINE(_sym, _val)                                                 \
> +    asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
> +                  : : "i" (_val) )

Nit: There's a blank missing after the opening paren, which will then want
the 2nd line to be indented by one more character. (Instead, as a matter of
your taste, you may omit the blank between the two colons.)

> +#define BLANK()                                                            \
> +    asm volatile ( "\n.ascii\"==><==\"" : : )
> +#define OFFSET(_sym, _str, _mem)                                           \
> +    DEFINE(_sym, offsetof(_str, _mem));
> +
> +/* base-2 logarithm */
> +#define __L2(_x)  (((_x) & 0x00000002) ?   1 : 0)
> +#define __L4(_x)  (((_x) & 0x0000000c) ? ( 2 + __L2( (_x)>> 2)) : __L2( _x))
> +#define __L8(_x)  (((_x) & 0x000000f0) ? ( 4 + __L4( (_x)>> 4)) : __L4( _x))
> +#define __L16(_x) (((_x) & 0x0000ff00) ? ( 8 + __L8( (_x)>> 8)) : __L8( _x))
> +#define LOG_2(_x) (((_x) & 0xffff0000) ? (16 + __L16((_x)>>16)) : __L16(_x))
> +
> +void __dummy__(void)
> +{
> +    DEFINE(GPR_WIDTH, sizeof(unsigned long));
> +    DEFINE(FPR_WIDTH, sizeof(double));
> +
> +    OFFSET(UREGS_gprs, struct cpu_user_regs, gprs);
> +    OFFSET(UREGS_r0, struct cpu_user_regs, gprs[0]);
> +    OFFSET(UREGS_r1, struct cpu_user_regs, gprs[1]);
> +    OFFSET(UREGS_r13, struct cpu_user_regs, gprs[13]);
> +    OFFSET(UREGS_srr0, struct cpu_user_regs, srr0);
> +    OFFSET(UREGS_srr1, struct cpu_user_regs, srr1);
> +    OFFSET(UREGS_pc, struct cpu_user_regs, pc);
> +    OFFSET(UREGS_msr, struct cpu_user_regs, msr);
> +    OFFSET(UREGS_lr, struct cpu_user_regs, lr);
> +    OFFSET(UREGS_ctr, struct cpu_user_regs, ctr);
> +    OFFSET(UREGS_xer, struct cpu_user_regs, xer);
> +    OFFSET(UREGS_hid4, struct cpu_user_regs, hid4);
> +    OFFSET(UREGS_dar, struct cpu_user_regs, dar);
> +    OFFSET(UREGS_dsisr, struct cpu_user_regs, dsisr);
> +    OFFSET(UREGS_cr, struct cpu_user_regs, cr);
> +    OFFSET(UREGS_fpscr, struct cpu_user_regs, fpscr);
> +    DEFINE(UREGS_sizeof, sizeof(struct cpu_user_regs));
> +}
> +
> +/* TODO: Replace with BUILD_BUG_ON + IS_ALIGNED once we can use <xen/lib.h> */
> +_Static_assert(sizeof(struct cpu_user_regs) % STACK_ALIGN == 0,
> +               "struct cpu_user_regs not stack aligned!");

But patch 1 makes BUILD_BUG_ON() available now.

> --- /dev/null
> +++ b/xen/arch/ppc/ppc64/of-call.S
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Adapted from Linux's arch/powerpc/kernel/entry_64.S, with the
> + * following copyright notice:
> + *
> + *  PowerPC version
> + *    Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
> + *  Rewritten by Cort Dougan (cort@cs.nmt.edu) for PReP
> + *    Copyright (C) 1996 Cort Dougan <cort@cs.nmt.edu>
> + *  Adapted for Power Macintosh by Paul Mackerras.
> + *  Low-level exception handlers and MMU support
> + *  rewritten by Paul Mackerras.
> + *    Copyright (C) 1996 Paul Mackerras.
> + *  MPC8xx modifications Copyright (C) 1997 Dan Malek (dmalek@jlc.net).
> + */
> +
> +#include <asm/asm-offsets.h>
> +#include <asm/asm-defns.h>
> +#include <asm/msr.h>
> +
> +/* size of minimum stack frame that can hold an entire cpu_user_regs struct */
> +#define STACK_SWITCH_FRAME_SIZE UREGS_sizeof
> +
> +    .section .init.text, "ax", @progbits
> +
> +ENTRY(enter_of)
> +    mflr %r0
> +    std %r0, 16(%r1)
> +    stdu %r1,-STACK_SWITCH_FRAME_SIZE(%r1) /* Save SP and create stack space */

Nit: A blank after the comma would again be nice.

> +    /*
> +     * Because PROM is running in 32b mode, it clobbers the high order half
> +     * of all registers that it saves.  We therefore save those registers
> +     * PROM might touch to the stack.  (%r0, %r3-%r13 are caller saved)
> +     */
> +    SAVE_GPR(2, %r1)
> +    SAVE_GPR(13, %r1)
> +    SAVE_NVGPRS(%r1)
> +    mfcr %r10
> +    mfmsr %r11
> +    std %r10, UREGS_cr(%r1)
> +    std %r11, UREGS_msr(%r1)
> +
> +    /* Put PROM address in SRR0 */
> +    mtsrr0 %r4
> +
> +    /* Setup our trampoline return addr in LR */
> +    bcl 20, 31, .+4
> +0:  mflr %r4
> +    addi %r4, %r4, 1f - 0b
> +    mtlr %r4
> +
> +    /* Prepare a 32-bit mode big endian MSR */
> +    LOAD_IMM64(%r12, MSR_SF | MSR_LE)
> +    andc %r11, %r11, %r12
> +    mtsrr1 %r11
> +    rfid
> +
> +1:  /* Return from OF */
> +    FIXUP_ENDIAN
> +
> +    /* Just make sure that %r1 top 32 bits didn't get corrupt by OF */
> +    rldicl %r1, %r1, 0, 32
> +
> +    /* Restore the MSR (back to 64 bits) */
> +    ld %r0, UREGS_msr(%r1)
> +    mtmsrd %r0
> +    isync
> +
> +    /* Restore other registers */
> +    REST_GPR(2, %r1)
> +    REST_GPR(13, %r1)
> +    REST_NVGPRS(%r1)
> +    ld %r4, UREGS_cr(%r1)
> +    mtcr %r4
> +
> +    addi %r1, %r1, STACK_SWITCH_FRAME_SIZE
> +    ld %r0, 16(%r1)
> +    mtlr %r0
> +    blr
> +
> +    .size enter_of, . - enter_of
> +    .type enter_of, %function

Before you/we grow more assembly code, may I re-raise a request regarding
readability: I think it would be nice if operands started at a fixed column,
unless the insn mnemonic is unusually long. Where exactly to draw the line
is up to each archtecture; on x86 we use 8 positions from the start of the
mnemonic.

Jan

