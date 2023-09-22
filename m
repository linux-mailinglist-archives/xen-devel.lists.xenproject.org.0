Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F597AAC7D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 10:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606762.944785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjbPm-0005f5-Dy; Fri, 22 Sep 2023 08:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606762.944785; Fri, 22 Sep 2023 08:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjbPm-0005ct-BG; Fri, 22 Sep 2023 08:21:30 +0000
Received: by outflank-mailman (input) for mailman id 606762;
 Fri, 22 Sep 2023 08:21:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qjbPk-0005cn-Up
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 08:21:29 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0606c2fc-5921-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 10:21:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8303.eurprd04.prod.outlook.com (2603:10a6:102:1c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Fri, 22 Sep
 2023 08:21:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 08:21:24 +0000
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
X-Inumbo-ID: 0606c2fc-5921-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qz5yZ8FFipO6lSdf6I049m9CHSPVfWNxADtmByNZ2bF/OjMzpi5tLo0qZY5Lj3VXI2kqyTK36pPsRHS9I7lPoiI1ISlISmfEXsh7p4GTkqK8dNmK14tn9v+v6AZO8276ffucZ7JBN3D8ITRJ9YJyzqIa8amyOJgdr/ccn8OMyH9ZcK700JXAoHTgHUOPbkuYxkUWVAOncQXpkg98Zp1Ox6y1w0xadYheKHu0A83Yl+KqFyVc+qbxW+vfzBQgFR8Cn3V2GYA+QWbF1uqtEdj3ekNlgXL20bN6rwK1AEJbXP2a46Nqcm4NG3y3HtdYbZha10qwx4QL7XZqPL8C6tYMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWzQq/RI8wvE4W/alxKNwSUNeyKvgLc0okvD0uB2HY4=;
 b=GVchXJJSlf6rnCLdzydtC57G9HWH8UYeGtoW64E53xcqtRxRm99iZbLC2LBbQt0javNP5W2pZWlMsV5hLVWNIltHGlqaHdk8yBnZlp3ANXYRE7bRoDmCnC+vBvMQ90ZRocmAoVQdqeo87EYWwjF1oC69tV9u0GKw0Ps2geCrdEJmElrdYv3q6uz5+o2rQwoo3RLyg2UMyOV8/0ahCUQTgrZCKP8WJN8o8GmUDoU+1g2V7v4wP2YJbjALrSNinINnxV7WAO6IQNbqWd59/FkWIxK/c35+W3m59kSaLTfWxTaXktdpX2CYm4TsDCL6+rAgMbetAUM6QvdW/uMCQ76UeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWzQq/RI8wvE4W/alxKNwSUNeyKvgLc0okvD0uB2HY4=;
 b=1enDaDr52/8tqQT67/6xIEvkZlVCyQeeI7NJLOZBoqi/Hgt18Eke7GIosouYpSG9kt+8BewyMwdz1M7HI4jbdDSs71WplknCNm4ZKo3FzE/U+Q3NvT3MUwQ5SOkWTGNUWkl0AJ2kevgWQvgqo7czK8OZTbk58I9/D1gQq/C/RQCixpC3X4QJnQV82+7h2FehHvx4LLZTMB4wosNRU9wczDqM0Ap+ntDesw8QSXfVOaDKGrB3W0PovY7dt4Ud0grQMhcmfzQE/ueAp9y8EYHeZ9jhLRRGHQoDLrhtJw17H/UBR6/fQJbw5WUZUDpdHgEVAELG3l7m7tt76bVsKFji5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7aaf91c7-6330-fffc-8df6-4be4b531f456@suse.com>
Date: Fri, 22 Sep 2023 10:21:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH WIP] xen/public: move incomplete type definitions to xen.h
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <7a880e33ff91d0c76986159e3559c56ee6894d21.1695324653.git.ehem+xen@m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7a880e33ff91d0c76986159e3559c56ee6894d21.1695324653.git.ehem+xen@m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: e74e1cd2-a831-44f5-1a13-08dbbb44e8f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qwbKW0if9FlnVXS90i8y4bbQKDSHqHG8FE1qooXyvW4Mi4MPrqPCVnccv3OpsO2mFbcos+zDlce3Jo7ofYGaSgwRntXrodOkZqwJ63ANUis435bczqSnXIhGX9v8qKYCylkwolJIEZWm0C0EYsV9zwHiLUhrxaxNeow+Xt6+aqoo8XBFqfdP2BaHTLaexBEwCnqwDhKQSuRbEBtgMlEpABkNY1PxIgAYvkI9I0f7RejeGKX5YHaqp1KiBUjuDRG/GGwxPpYt606+ikgGH6345cmxvDTgMhNC7i6Uwdw7bUX278FztagKk3VUR0a7delBhOl+vxJYZQ/7sYSB4s4HHc3E7DInyWm6yKNrzHIPnGs3za9T+SAfJRsokq24zSNEqJcfnCcm7CS5kY4cCsxvddEU2WzbSsWcvr/SqGCbuaOgtTsW8PsjCMykLl5IGl823wgtpwPZaEzpuhK+rm9R2PxnI9tplRwm0MDfL8j1W0feyuaqHNyEEVWe8vM9Q3+eLxNhUHMWiLnO1QccwR/9EUZFgONku2ij8Hplzk9uQCLKagEACgEVbqnfH5uMdQ5EKKOeQXXUY24JtoUeqQm6juooScnT5h4sLZFI2oWrFDQNnefp72vUTQWmlzHRaDe7rvdWBalo6Yr0xnN/BHnIZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(346002)(39860400002)(136003)(186009)(1800799009)(451199024)(26005)(4326008)(8676002)(8936002)(2616005)(83380400001)(2906002)(5660300002)(36756003)(38100700002)(6506007)(6666004)(53546011)(86362001)(31696002)(6486002)(478600001)(31686004)(6512007)(66556008)(316002)(54906003)(66476007)(41300700001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGpRL29HbFpkM240dnZKZ0VPMU9ML3BYS0RDM3J2empKT0lZRnVxRnYyT2RI?=
 =?utf-8?B?dmtaTDFRSFJ2dXpsckZ1Rm5aOGpvOHZHVjZDWWdmdy8zeFkwZTMrYlJsU0tJ?=
 =?utf-8?B?SXdSZE5FMnBLT0RHSngrcE01eEJjb1NUZFlabDdTWGI2QmIrZUR4SlRIdjFh?=
 =?utf-8?B?cFYwaG9mQW5FU2gxYy9sYUM3QTkwbkgwVXRob1grbGpqNnJDU2JVV2pvNWc5?=
 =?utf-8?B?TnU1c2FORVJJKy9oNVdQanlVcGtXYVM4bHZwMHg2L2lIT09KcHYzK1lBNXZo?=
 =?utf-8?B?Rjd5cGJ0MHMzaGJ4NGFHOXhRTDYxNC9aSTA5cFFIc1hEK1lvSW1mOHdwSlNI?=
 =?utf-8?B?YnVBcTB2bkR3anhEV2w5b3FXazQ0dWtDMmptVkNsQmZlTWlOYWdmYkdpblNO?=
 =?utf-8?B?NitYcytLVUNKWjFZdWFBMGpWdHBTWTh3bTNMTzhBa3QrTmxwSXBkZEpsY3RG?=
 =?utf-8?B?L3ZIZVZoM0VBK1VxS3JyK1hiOWxaeVQvdFNDRzc3TjJ5aVNsSGtrN04vU2V6?=
 =?utf-8?B?UnJKZFdXUmVqK0l0N1V1ZUdGaFczTkM4ZTJQbTJaWXdrSU5maWRZQWtwVHlQ?=
 =?utf-8?B?NHVwZExXd0pLd1F5MXhUS25TVDZBa0ptc2FJMGRIY1MyZkZsMjdVSzJpVERU?=
 =?utf-8?B?MmpvY0RkcjExaExwS3F5T2Y5K2RlZ2N3dXMrV29uMWFJd09Lb1hkRTVUSGlD?=
 =?utf-8?B?Kzh0UkRpSkpxOSt5Y2JoYjZoK1ZjQzJLZVcxKzBsWkQ0KzUzVTN1dVF2Vkgz?=
 =?utf-8?B?c1hnUHhHQjV5MnYyUi95NGtZZnRkdVE1SVdHb0pad1hEMHpSOU95TUZhZGJP?=
 =?utf-8?B?VE9QdnpmcTNJZGNYaDJsQnhId1Q5ZW1uRk83L2Qxc2tJQmt1TGpaeGoxTWwr?=
 =?utf-8?B?RWxvb003OHR0a0NmRkptejZTaldSL2E5SmxROGFyb05wY0p6RlBic1pkN1Ax?=
 =?utf-8?B?QXlaUWpUeElhY003NkJnVzZHVXR0cVJINDJ1NDRZN1lEcmJ1VGpIUU96Q1VX?=
 =?utf-8?B?c09XRTE3ZTlPR1Jndlg3R0JMS0lNRzljVXBVWWNpQWJlZ2MwV1ZDaDlVZXN5?=
 =?utf-8?B?QkRCZ0RDOEhxK0MwZWUxOXpLcFlpQkxKS3o0bmdUdDlDUGFqY01LQWRyb3d1?=
 =?utf-8?B?YnZMRTAxYjFVWit3SkFUa2FQc2ZJbFdBbWdNWUI0Y29xcVBKbHloZ1NJQllI?=
 =?utf-8?B?SVU1Zm02TWpCMUFxQmFvRWU0V2hHUldSM1NiNUFtbWhWSGR5VGRSaTFIUnR2?=
 =?utf-8?B?aGxNcS9XRm80Q2QvOENOaFNCR29aemtZcTlVcnp4cFNlV2R5T1lJeTdqZUpj?=
 =?utf-8?B?SDBPUUpZT1pwb2tNaXlNR3dvK0VDT2dmT1IrS2N5WTNHUEtKNnh0T2FmU1Zw?=
 =?utf-8?B?L0RXZjRTRWw0Qlp1SnBCMCszWEl4QU1LS3hqNlRDN3o2enlYLytzVFpwV1Vq?=
 =?utf-8?B?NmN5eDFwdnZsaUlSbDh5WVJ3WWZ6Z3NBbFFRSjRWU2sxcmpzVzJselFZaDN4?=
 =?utf-8?B?WmY5MGFaOEpYZmZVaDNIeU9BSzZPMnRsTnJxRWcwSVpDMVA4bU1NdzNDV04x?=
 =?utf-8?B?Q3ZncjFTb28xRkJ0eTV6cGVuN1MyL3Q1UkJrK2FiMVVCZ3BQZy9MT29UR0hR?=
 =?utf-8?B?R0lkRFFNbENXcU02TnRoNmdmWklvY2F3WjlwbDlWeWlENjJVOTN2SXJsVmVj?=
 =?utf-8?B?b0FGSVJ3RlNWb2Z6MXEybUNGRzErWHhYUjFvUUNGSk9SQVVhMVBaZExFeUxG?=
 =?utf-8?B?T0pGRm5hSGtMUnFza2dGOFI2SzJ0UUd4NDVsSVJMYmVMbjA2LzZJbzZ6bUN5?=
 =?utf-8?B?NElQNmRTcGV5WkZBNzV2V2VoZE5KREVoN3BzT2hYV2YxZHhGU2x6azQxVHZm?=
 =?utf-8?B?SmcvL3VQOFQ5L2l0dUM5MEpBeWlTVHlZTkgraU15Y3dxemh1dmZ6cHhPbUNx?=
 =?utf-8?B?citqSG1lbldyOWRNdUJvSlNRaDNWVUp4SkYxSk5IMmZrR1RlSjNjYjBaYmtN?=
 =?utf-8?B?RjJJdEJTQWFYWjZJQUdKK1RHUjlvUG1kdVhBdXZlQUJzSHRxdEdGWDJydkFO?=
 =?utf-8?B?Nlk1R2ZJdVhMMnlEK2dYaWZkSm5meFlhOHRab2lUQVJuUDlob0ZldEtLVzRJ?=
 =?utf-8?Q?hpF3bDiBd0TyDukGSD6gfUdWD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74e1cd2-a831-44f5-1a13-08dbbb44e8f8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 08:21:24.4976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpeYL1GVlQQ5bOT3CIhvwsDJM1REK9dVnZAc0+i7y3G11/dRmOsa54m9IwwDC8AA/QrjCCiB3zUPF/qiGfF+9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8303

On 21.09.2023 18:18, Elliott Mitchell wrote:
> Hypercall wrappers need the incomplete type definitions.  Only when the
> actual structure needed.

While in the first sentence "only" looks to be missing, I can't really
make sense of the second (without implying what I think you mean).

>  As such these incomplete definitions should be
> in xen.h next to their hypercalls, rather than spread all over.

Perhaps s/incomplete definitions/forward declarations/.

There's a downside to the movement, though: You now introduce items
into the namespace which may be entirely unused. The two contradicting
goals need weighing as to their usefulness.

> trap_info_t is particularly notable since even though the hypercall is
> x86-only, the wrapper is likely to be visible to generic source code.

Why would it be?

> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
> trap_info_t and HYPERVISOR_set_trap_table() is something I ran into.
> With the incomplete definition, the wrapper is accaptable to an ARM
> compiler.  Without the incomplete definition, it fails.
> 
> Note, this has been shown to build in my environment.  I'm unsure
> whether the incomplete structure plus type definition is acceptable to
> all supportted compilers.

It's permitted by the standard, so ought to be acceptable to all C89
compilers (which is what we use as baseline for the public headers).

> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -75,13 +75,25 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>   */
>  
>  #define __HYPERVISOR_set_trap_table        0
> +#ifndef __ASSEMBLY__
> +typedef struct trap_info trap_info_t;
> +DEFINE_XEN_GUEST_HANDLE(trap_info_t);
> +#endif
>  #define __HYPERVISOR_mmu_update            1
> +#ifndef __ASSEMBLY__
> +typedef struct mmu_update mmu_update_t;
> +DEFINE_XEN_GUEST_HANDLE(mmu_update_t);
> +#endif
>  #define __HYPERVISOR_set_gdt               2
>  #define __HYPERVISOR_stack_switch          3
>  #define __HYPERVISOR_set_callbacks         4
>  #define __HYPERVISOR_fpu_taskswitch        5
>  #define __HYPERVISOR_sched_op_compat       6 /* compat since 0x00030101 */
>  #define __HYPERVISOR_platform_op           7
> +#ifndef __ASSEMBLY__
> +typedef struct xen_platform_op xen_platform_op_t;
> +DEFINE_XEN_GUEST_HANDLE(xen_platform_op_t);
> +#endif
>  #define __HYPERVISOR_set_debugreg          8
>  #define __HYPERVISOR_get_debugreg          9
>  #define __HYPERVISOR_update_descriptor    10
> @@ -100,9 +112,17 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>  #define __HYPERVISOR_vcpu_op              24
>  #define __HYPERVISOR_set_segment_base     25 /* x86/64 only */
>  #define __HYPERVISOR_mmuext_op            26
> +#ifndef __ASSEMBLY__
> +typedef struct mmuext_op mmuext_op_t;
> +DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
> +#endif
>  #define __HYPERVISOR_xsm_op               27
>  #define __HYPERVISOR_nmi_op               28
>  #define __HYPERVISOR_sched_op             29
> +#ifndef __ASSEMBLY__
> +typedef struct sched_shutdown sched_shutdown_t;
> +DEFINE_XEN_GUEST_HANDLE(sched_shutdown_t);
> +#endif
>  #define __HYPERVISOR_callback_op          30
>  #define __HYPERVISOR_xenoprof_op          31
>  #define __HYPERVISOR_event_channel_op     32

Interspersing the #define-s with typedef-s and
DEFINE_XEN_GUEST_HANDLE()s clutters this section imo. If movement to
a central place was wanted, then perhaps below all of the #define-s,
then allowing to get away with just a single "#ifndef __ASSEMBLY__".

> @@ -449,8 +469,6 @@ struct mmuext_op {
>          xen_pfn_t src_mfn;
>      } arg2;
>  };
> -typedef struct mmuext_op mmuext_op_t;
> -DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
>  #endif
>  
>  /*
> @@ -615,8 +633,6 @@ struct mmu_update {
>      uint64_t ptr;       /* Machine address of PTE. */
>      uint64_t val;       /* New contents of PTE.    */
>  };
> -typedef struct mmu_update mmu_update_t;
> -DEFINE_XEN_GUEST_HANDLE(mmu_update_t);

Imo a prereq to moving these up is to move the struct-s themselves into
the x86 header. From all we can tell no present or future port is going
to use these PV-only interfaces.

Jan

