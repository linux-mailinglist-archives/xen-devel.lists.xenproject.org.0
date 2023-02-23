Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC66A0731
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 12:17:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500224.771499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9an-00072T-Ud; Thu, 23 Feb 2023 11:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500224.771499; Thu, 23 Feb 2023 11:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9an-000702-Re; Thu, 23 Feb 2023 11:16:53 +0000
Received: by outflank-mailman (input) for mailman id 500224;
 Thu, 23 Feb 2023 11:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pV9am-0006zw-Np
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 11:16:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ee8f5ab-b36b-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 12:16:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7840.eurprd04.prod.outlook.com (2603:10a6:102:ce::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 11:16:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 11:16:48 +0000
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
X-Inumbo-ID: 8ee8f5ab-b36b-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcuJCbdEDgZHZRrlF7+RdT767dgWY3qLa3rQbk9JWtxNUYNh8vwDUoNNk7Zp+Yb5imQhvaIQ0be9HytlcmANP8R+EjNtqmql3bk0+6boukCTgpi7EfRVqYpkgQGQwhykMajTdG6kUb1XsYSA8PifAqgF3FQpzRyvbRqIlMOm4a4fO6jzb6S8au9VW8JgdIW/+joNFMiKJUINwlHStqRZNCkgpqPz1tzX2aHhqqA6Ybr4QXNbGYKhvdpXEAwTC3KMaxlJZuFTQPGZsQuZVy6HK0FvcYNlrt6RGnwFqFjnVdSyMxqla+ylL27KposBelRLSIYKU43wL1oh90MN/MkX8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Wc0e+sZmrkKjgwIney88POcCNQtpETWUFoNpZpZFC0=;
 b=XJlfiGdlPE0U8yBTm9LM20qW2FKWh/8cv9FPxLyc4t2TOYODlja/CV+75VQ2kv72iujs3AEcNzDq3Up51mi9OlCexmRkb5U5WPjwCp0liNp11Hjtjxq+c48W/Jm0spKhyHUVTMNClJt7yHhGbwt5GO+qGN6XjNtVBYeTkonFzreO7+fvUxV5vOwCVV07djNgkS1saqv/j4/oYsAJX4tKr9pPg+hcgCXbDcPbQjTnedO09vtmw5cDo3zaQYRFWHZ42MoFSS1K2xS2Y09qGpdokkNO1dmtxe7bk0nRPHhfIXIr+bZPpi/rgWi4LlwLsFTeb5bjcnnPmYj1/9wgD5M5Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Wc0e+sZmrkKjgwIney88POcCNQtpETWUFoNpZpZFC0=;
 b=HWA9lGTgL/3Mijdz/NT4XEWHP8fJqBAxOQOSbsmPOGFANhzn+SyrSBIRXaL6b8xAJWFqrcYb3dcHkHnleLSo+4d/aeZdKpqoAYvq27fTWSnnynXuBsLdpBaxyTYhlQegLnpAn2jO7qqQ2eSCnXcHIEWEC4n0pWoXLAncSiKvIx0xYk3HnJTEGmawivV7E83jgCQTPxJ6SiyWkfjALcPc+sAM0R7QSUaym3UG0xH/IZ0T0f/+K7JuWcFTUqJCI5xPBCb9mfAX9zHSkEG/LWcc2dOpKhrE03P/bYUzbfulzJzK+Se6fslf3LuTaN2Ld8MjDpHStuEEd6CVm2wx7Gbhlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cad832b4-62a7-239a-5527-36ab4e861c42@suse.com>
Date: Thu, 23 Feb 2023 12:16:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 7/9] x86/vmx: remove unused included headers from vmx.c
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-8-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230222120023.3004624-8-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f109e16-0665-448e-6d5c-08db158f743d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k7APr4iHvnFUUQIUIxlRVP5C8rD2g+bUxQghylP8r/q1BxEjrf35k9pALqIq6NJ9MCbCvHnyKffi3ZNAmK92WnD+pf2pBO7LelROnZKtQ+2YxuJZw64jOeTUaBluB/Tvy/oK2hwChmQde8qBaC5G1DsNMEU2YyNf2LGSbOQxx5kEz2RIjCwN/WvTer5e3OMHIWZqe0vDarHZqFR0ynaYh+6HtRVtQ5rgghD49O+amW6NLhnjYoYvMILnyriCIfq1ZHHUQligX+sURQZiEAAOHzFAWB65js1H7tYhbgKi6trZPBtoWqMGE91Pfso4fcLNLzukFByjBv/5bScluHLAfeGzSocdhEDoVeDD8jEv0SxBmDWYw8IfJIvUogjxNGGSkLrCioJ5gOfQ9X74MH4NmpdhANcw1cJFpdyQtg6/w7Uzja8SBQIErQL974XZ/2U52NkylcrSA3xeALoMaC3u5JKtXzqedJWADQJFWBbJy/v8G3ED14kGU4DlK9fy+BeZ/nBXjiK8PSHp6Wy/6yzwa/VCNI5qQZGDCrFDtVWoV9SsbyhsyLXt/+UQ6sqKvHWtRL3OU29L/lGmq55SBZvqwzyZoSudSO8Sd7MAR0j3KBfm+Qms77IZPsUIO18rkFXscT0+A7iz7RI61WDWdSxapiQfPLAdbOqSKEaKmDTTT43qVl8tXM/ggcPsRtoveFIzpoH9atQXCxoEYfp67M+OwELi8uw4TTIARvctA+vtWC4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199018)(31686004)(2906002)(5660300002)(8936002)(41300700001)(83380400001)(66946007)(6916009)(8676002)(66476007)(4326008)(316002)(6666004)(66556008)(478600001)(6486002)(36756003)(186003)(26005)(53546011)(6506007)(31696002)(2616005)(38100700002)(86362001)(54906003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXlWMFdiQTErMExtS2Y4Z3dpb081SHgreGx4alJLZVE0T0IwblBYbWFwdy95?=
 =?utf-8?B?WTc1L2RnWjVSUkpNMjVSTk9YaU1pK2hYVzJCVGJqRm92MlpLbXh0Mnk0bDZi?=
 =?utf-8?B?NWhqc1NPWnpNWjJ6bWhhbjRSV0ljZnVpMTIxNXBMTVFid3gwZ2oxcDV4Qytx?=
 =?utf-8?B?OSsvR3NLRmYvRzl5ZVRieUdzUkt2U0V4cE9wUlplWXpPeDFhMjEyV1VYODZh?=
 =?utf-8?B?WHRodUJjZDdkNE5YdGdYWnpmbmRRVFBNWjJzNlQ0UDlwQ3hRWE13ZkRPdFpE?=
 =?utf-8?B?UWwrNiticERrZE9sK3BrUE56QUsrdXVTeEl5M21XaFZFVklmdC9wcDBqTmRr?=
 =?utf-8?B?TFI1cWVDVlVYWFZZaG9oZ0N6WFI4Vmo0cGNQWTNiYW1MZlV6RlcwdGNCbDRS?=
 =?utf-8?B?L1RzSzhIWFBLekFzUlZ2Y2N4OXFmSEozSW81bWFFSXh2azU0TWVLYzRxV05M?=
 =?utf-8?B?dmhDT0U4MG9OTUNHQUh5Zkd5SEtIRy84UzFsSTJlWCtRZGhaSHR3ZERBRmlp?=
 =?utf-8?B?dUc3SDBROGFFekRUODZHN3AzeVVDbEdDWjNvVWE4QTVJdE9kbFVCSGtORU5F?=
 =?utf-8?B?aTF5Q3lBVkZKWXY1VXhHMkdCZFVrRlhhaEZyN1VVM3FncUh6ZlhKNVg1L2ht?=
 =?utf-8?B?LzYyb2R3ZW9KZ3oybkZPY3VXV0FNTzl2QlY3M05lT3hWdERxenFjZlljZ2d3?=
 =?utf-8?B?V09mWlZSNTdKeHJTcU9oTlljRHNMK2FkL1pDbGpqR2V5MkRnRHlRVWFwd2xx?=
 =?utf-8?B?cHkvbFVPUDNVQ0pqNUdaQjZaOGhGc284N3ZDaGNYelZRNXd6eDIyRU85TmVp?=
 =?utf-8?B?clpEWFN6NmMweWE1WmZtbk9BSG9VZEwraHBmYUtNUFlFblVPMDVqWk43Yk1W?=
 =?utf-8?B?ZjNHNk1XTTRMZDR6TWNEeHVxakJRZnFqNDJndjlaMkNoK3lENU5kN2ViWTVy?=
 =?utf-8?B?MzRDUFIzK3B5K3NLdVJnZnJCSkpzcW5uNUt0cm1jeVczUE5hQzFCeW53cmww?=
 =?utf-8?B?K1RRbjhGcUM1T2ZrQ0tscnBqcDRaMFpwN2FzQzhhbWQrdFJnSDYwWkt4dXBr?=
 =?utf-8?B?c0w1bFlERDJsOEhkUlh4OXAxTVo1NFhXWFhZYmc2a1d2VHZLWmdpS2xRd090?=
 =?utf-8?B?ZCtObUcrbjJVYmQ3b1ZEVEVuNWxuQ0gvbjFQcFNkZDhkTlNtNWFHb0x6cVNC?=
 =?utf-8?B?em8vQjdvTmRXWE9XRi9HL0tpQmV5NzNPcUhlLytNRG1VY1BzQmxXODRHRE1q?=
 =?utf-8?B?SkpBTkw0VHJFV2loRTlieTlOdlpnbExHRFAzVHNNUmNpK2R6Mkk2YXA5ajJw?=
 =?utf-8?B?QnZsSTZRdE5TOWRicHVqeEpYanZ4dmlLeWl2NTlBTm9hMWVZRCtyRitXOGRo?=
 =?utf-8?B?Ty92T3IyZmQzYmNtT29IOEJ6aHdlZmhQYXJ0Y0gwcGJnVEJXbVlabEtVa2lZ?=
 =?utf-8?B?Sks0STZIMnNHRGw3Y3J3ZmhFN2NXNnh6YVlaYm1ha3YyYmtibGlVbERvdHdT?=
 =?utf-8?B?Nm9YeHF5bkZUZ1JuTE9OYm5Kd0hQaTIzekhDcG9BM0NvNCtBN2xoQmFJTnNS?=
 =?utf-8?B?REtJQUNPMDE5cVhsRFVOd3d6MVhaMEs4WlA3QlZ1L0tsSDhGZVl1K0ZTQyts?=
 =?utf-8?B?OWhaMk1oQUlYNndqeUJuZVJDSHlLdHNsWUE4RmhvellZdkZERXlGVkJYTWZ4?=
 =?utf-8?B?T2U4UWRyQXJIbXFNbkdlaDI3R053NHpDZWUvMTZkbTc2SEZjQWM2aENPekFz?=
 =?utf-8?B?WVB1N1pDRGYwNCtkYis4QmU3NFcyR2U3ZFNuSWhzMUJWc2pFTUtpNUp4MDUr?=
 =?utf-8?B?VktDOENFNldiVmhNM2hPb3ovU05HVElPUzZ2bmw0Z1BGLzdBMnRQV3RFQStJ?=
 =?utf-8?B?WlFPRmlsUEZXVllJQ0VTQm5OVUk4V09VUWpJdElzUnhwUGNCYUlIRi9nMTkw?=
 =?utf-8?B?RWtlT0FKaUhsaDdFZ0ovSEFyRGxmYSsyM2VPeE1VcmZiUExYcCt1SzArUEhI?=
 =?utf-8?B?eTVZNWpkWFQrZ1pGbk9ycnRoL2o5SFBoZUl1cTZqeEU1S3k0WWZsVGxsWitr?=
 =?utf-8?B?QUp2YldtOWo4WFpQRDJkN3kyUUtlR25hcjQrMVNpY0NydFhZNHdBQm5OK3Bs?=
 =?utf-8?Q?Ze1HP2txDVPjTNCLIZ5O7d/uw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f109e16-0665-448e-6d5c-08db158f743d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 11:16:48.0246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTHb5ZCQc8M7qAa3dJrmZ1aUTM2yubDIWJ6XL/rPvw+AtOUd64Ei2AxJ8vZUgZJCVQtXD3aiMryypwlXwrF+HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7840

On 22.02.2023 13:00, Xenia Ragiadakou wrote:
> Do not include the headers:
>   asm/hvm/vpic.h
>   asm/hvm/vpt.h
>   asm/io.h
>   asm/mce.h
>   asm/mem_sharing.h

This one puzzled me, so I've looked up its origin. It's entirely unclear
to me why 29317cfbf36d ("HAP fault handling for shared pages") added it
both here and in svm.c

>   asm/regs.h
>   public/arch-x86/cpuid.h
>   public/hvm/save.h
> because none of the declarations and macro definitions in them is used.
> Sort the rest of the headers alphabetically.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
> 
> Changes in v2:
>   -add a blank line between different types of hesders
> 
>  xen/arch/x86/hvm/vmx/vmx.c | 56 +++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 31 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index a19ece90fc..a6ec0a11fb 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -15,52 +15,46 @@
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <xen/domain_page.h>
>  #include <xen/guest_access.h>
> +#include <xen/hypercall.h>
>  #include <xen/init.h>
> +#include <xen/irq.h>
>  #include <xen/lib.h>
>  #include <xen/param.h>
> -#include <xen/trace.h>
> +#include <xen/perfc.h>
>  #include <xen/sched.h>
> -#include <xen/irq.h>
>  #include <xen/softirq.h>
> -#include <xen/domain_page.h>
> -#include <xen/hypercall.h>
> -#include <xen/perfc.h>
> -#include <asm/current.h>
> -#include <asm/io.h>
> -#include <asm/iocap.h>
> -#include <asm/regs.h>
> +#include <xen/trace.h>
> +
> +#include <asm/altp2m.h>
> +#include <asm/apic.h>
>  #include <asm/cpufeature.h>
> -#include <asm/processor.h>
> +#include <asm/current.h>
> +#include <asm/gdbsx.h>
>  #include <asm/debugreg.h>
> -#include <asm/msr.h>
> -#include <asm/p2m.h>
> -#include <asm/mem_sharing.h>
> +#include <asm/event.h>
>  #include <asm/hvm/emulate.h>
>  #include <asm/hvm/hvm.h>
> +#include <asm/hvm/monitor.h>
> +#include <asm/hvm/nestedhvm.h>
>  #include <asm/hvm/support.h>
> -#include <asm/hvm/vmx/vmx.h>
> +#include <asm/hvm/trace.h>
> +#include <asm/hvm/vlapic.h>
>  #include <asm/hvm/vmx/vmcs.h>
> -#include <public/sched.h>
> -#include <public/hvm/ioreq.h>
> +#include <asm/hvm/vmx/vmx.h>
> +#include <asm/iocap.h>
>  #include <asm/i387.h>
> -#include <asm/hvm/vpic.h>
> -#include <asm/hvm/vlapic.h>
> -#include <asm/x86_emulate.h>
> -#include <asm/hvm/vpt.h>
> -#include <public/hvm/save.h>
> -#include <asm/hvm/trace.h>
> -#include <asm/hvm/monitor.h>
> -#include <asm/xenoprof.h>
> -#include <asm/gdbsx.h>
> -#include <asm/apic.h>
> -#include <asm/hvm/nestedhvm.h>
> -#include <asm/altp2m.h>
> -#include <asm/event.h>
> -#include <asm/mce.h>
>  #include <asm/monitor.h>
> +#include <asm/msr.h>
> +#include <asm/processor.h>
>  #include <asm/prot-key.h>
> -#include <public/arch-x86/cpuid.h>
> +#include <asm/p2m.h>
> +#include <asm/xenoprof.h>
> +#include <asm/x86_emulate.h>
> +
> +#include <public/sched.h>
> +#include <public/hvm/ioreq.h>

It's a shame this one's needed - handle_pio() really should have a "bool"
last parameter.

Anyway, patch looks okay to me, but will need a maintainer ack.

Jan

