Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CAB6A4205
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 13:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502516.774365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcwX-0004q5-UE; Mon, 27 Feb 2023 12:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502516.774365; Mon, 27 Feb 2023 12:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcwX-0004nE-R7; Mon, 27 Feb 2023 12:49:25 +0000
Received: by outflank-mailman (input) for mailman id 502516;
 Mon, 27 Feb 2023 12:49:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWcwW-0004n8-5a
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 12:49:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2840c840-b69d-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 13:49:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7664.eurprd04.prod.outlook.com (2603:10a6:102:f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 12:48:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 12:48:53 +0000
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
X-Inumbo-ID: 2840c840-b69d-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMSghBQdzAHlr7GroQifEUC3AZJhlJkWRwrBGkFu1tX9E+X+GdPd0bf5sWQgAWslRsOtcy7y2pISj9oR+9hTsFO0vHUvzZSMT/4qHKy/Zqh75hnULXIK+OYeLuOArzvw2/Wsi+gCdrxxfwMv33F9v+hylzwxdGi54L3p3Jt2u7Ya/Rtogs+vI99523uwt/HwMwkxSu2aRw8QSTlu1XbnoN6E/3rxnw4/3Uevyc9CsNDGDXK91x0xeD9Ob51P+gA6e1TcGS/woY+i/kfEcPGcHkQgvuuR1Tg8NgCrXJIOgrcLfb4dyvPuZE+47iSZ3iRy8IZaVZj8Ua2gyHyxTknveg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYNd/vAu8FAcVq62/90gUoPBlMUzk97g8RuZyolsCmc=;
 b=Q1reB2I1QqnNi2NNaN8pxmXQTk33x4Mo17w2eaoZDSnKmpFA6zklYAHVwCl3cz4Os3F3zP0Njs+XXLz5m60IJQAv12XmsBPA6WUQ/Jbihw+BlnNgz/irdB069IE10/qLH6hnlvfuj7QdMjMUph6YazKq316cAORwOu6lbHB+nPd/j+EVrWxG1JAKnuwtv08tFFOphRZ2+W5F4iIEdU23iIMQD2okICsm95H5KH4fpom59lGZ3oUI5m7FQ62ajElvnIwM84D4rUiMiYgyHbnldT9RpvkHtylzz5zGpLnE5tFqirrnNV6Kjl4XOGrgnPuQH9hOFY6KwaU1qG/xXq7Bjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYNd/vAu8FAcVq62/90gUoPBlMUzk97g8RuZyolsCmc=;
 b=3U9VZL93MKK44IMJ0OP2wCziB3klIKkVTCoSUrntyML5QVyvYWB+2rYKl6eIoLkmdGd03e7mnVpUZofyXidNh+GQltE6VJ27fzhcmvm1sRCNFCYCgh4kJFaxC5QrOF+XadeK/7IoHnmxn7ZpQ/TQS5jv3iv52kvz0HfnftvSY1USWwIAV+nff6rdKj8M+KY3sumlcZISnZHDXGpaJPcu7ibj8A2f+g8NxVXahv4zKsrdQEQdoknsXY8/mWaqeXs6qcalx0nVU90Px3E3zSH13x2pJM7bMu4fdlNFvmxmxoQA5HfGib6ob8NWXmFtxo8ug8MQLdEvgGxSryVpX7oq6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2fb6e5ad-9e25-9c63-7f01-8a3d55297cf7@suse.com>
Date: Mon, 27 Feb 2023 13:48:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/5] xen/riscv: introduce decode_cause() stuff
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
 <397e6741438a8b125dc53945a74a58246fac4faf.1677237653.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <397e6741438a8b125dc53945a74a58246fac4faf.1677237653.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5e0c6a-9204-4c77-65ec-08db18c0fb07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C4ymB1zpHlxVa02qLichoy2q7wLl85JX3wAe4C026R9iGNIlcfRhqRp5JHmq9aSkEjuD0HCrTac/chGMbamqBqTvEsz/f2+gseu2bLnTWJVrzcig79lHXuA2x8xcv3q0HG6u2YHHsLkMZ94ogZuLxPCD2J26GUlXZzZ3yxcmyuS1SEUMBxOdG50QnbgyBS9lh0AB+fr1sRojl4rKIZsHpK0G3ZV72OhikpVEIkoeb0mbcIhQQdU0/yeGBJ0QiMQekS1ARqDwJ+kwnUX2dOpfqj3I7ohc+ES8tE2CAxzoaj1XrPlns8K3g1z2rOtjT6yQeZs9IDIFVU6okhfRieH99ls8gJM59qdikZ38o7+h8ybIEuGsvsKlGu9pJw4Gwl/Aeu90dzq/X+sgeA5m2D6m4EyogSlP82kPk24HcdaLZ1w8ZBGBk7gb/xzhveM0TtzWQT2XWcHiUs68nQlh3f3F5AAjKUZ/2tMhfO1SOCOtgmO80Y6MjK8kvIL95lYZONuCR5POBCut5MvDe9x6FhN0R3LP31uE7CR+m8H3jRtkplAKYrdzXRe2p3Ld2UMbKJ162MPfhJjt9x6y9oIPSUM8LkxH5YkbIiB6twkP7msVDDS8Ru6V6c6vxeljVNZFO6ItcQ7VRsjyNQUwAG+Q+viVrvlNt7ds11YdF+FVDs0IjvHbcUaj5Hu7y69z4jJhLcBwHS/SgZBdvRyt7827dtC3tA273LSnLMaYNgfn57Xok9s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199018)(2906002)(31686004)(66476007)(5660300002)(8936002)(36756003)(41300700001)(66946007)(54906003)(31696002)(316002)(86362001)(4326008)(6486002)(66556008)(6916009)(478600001)(8676002)(38100700002)(6506007)(53546011)(6512007)(186003)(26005)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFJzTWxURWt0L3NpOEdHbm5YQUREM0hlQzhmdElGZXdOWFM5RWRFOEUxUTNz?=
 =?utf-8?B?Tkt0bEMxUUpjSzNiY1krbXNxUEdpU2Rvd2d6LzUvcHI0L3pDWjdBOXgxeVdT?=
 =?utf-8?B?RXNRaTZIZjArS2NMZG1FN3ZTaTJWNTNPUmpydWYxZEFCdHNOczRJcmZIWTc0?=
 =?utf-8?B?NkJlQVh3dWx4WDFOU0pYTUZsSTEvejd0WWVjWGozV0FOTGNPbnFZT3V6SWRJ?=
 =?utf-8?B?UnBMZlpEOGxFVndaMDdkR2dXL0owdTh4UEkyV2dUejY5alZ5emNQMjlWeG5j?=
 =?utf-8?B?a2l1SWoyTTF2QWh6ZGpFRitEdmsybm5rQkdFaTJNSTZVTzBCZjNnWDlVN3RE?=
 =?utf-8?B?QjJuUTF0YzJvRVZWUkVvL3ZZVWNZZXNOU3pseG9zdjdoa1pNbTR5WnErNlVX?=
 =?utf-8?B?Um1meE9xKzNlNUxzaEtYcG1YU1pyTFZRSGxxcTI4SDFyOCtyczFmd1prdzNm?=
 =?utf-8?B?M0FRS2hhTkFZUEVPSU8rQ3dZV1VqRlNJNGtYdEo5ZUtCZkpYWjF3Vk9QMzNT?=
 =?utf-8?B?RlhpeU1wSFcxbS9UNVU2KzU5czg2bzVnTlVQaDg0RVR0MjU0ZkVBdDdmRnlp?=
 =?utf-8?B?VFp6ejhNdTU3S3hjN3J6UlB2TWJ0MWsrSWZCRHZhcHFaUE9qUEVzTnZzVEZT?=
 =?utf-8?B?UWx1OGFnOVkwWlFsTG5rWXlJR3kwTURDQUZmbDZDdGt3c1V1TmFmeEpsSmxm?=
 =?utf-8?B?WUtYVjJzSGs4anZCSklybjd2Ti9iSEdXRytRaXVEZU1qbGdYbmZsL1N6SlZ1?=
 =?utf-8?B?aDJKclpGM1AvTm9BSU5aLy83dkMzRkM2bE5ZL3VyU2ppbWlDSy9JRllrL2Ru?=
 =?utf-8?B?V2oyRm9ZdEplQzZaT1k3cTFrbzNONm5EUjJESTFzRjlOSjYwZGRnMGxOdFpK?=
 =?utf-8?B?TlpVdG5aSTZBTEU3czJMQlltbnF6MkFoUTBnVDZ6VGRwUCtCbGtiSGJzUlg2?=
 =?utf-8?B?VEw0Rnh2SnZUV1RCUU9jTm05MjlLcEp4THJneEcrUnN6SThwb0IrOU1EOEhz?=
 =?utf-8?B?WGlKWi9wRG9IZk8ybzBWRkpMNlhGSkozSFR3ZWx4UGFOL0kyVjVCUUs0ZHBO?=
 =?utf-8?B?Q0NkUGU2VHMvZEhtSDlnRHZJbXJVT3JnUllUb0ZPQ1RlWWdmSUN6bG10YXJI?=
 =?utf-8?B?aHZJOEV4TFFUMjBZcDBQanJGUDdUQndmMHlXUXhrZE4zZzBsZDdyVllxdUc0?=
 =?utf-8?B?Z3VFZWtnR2hoNUZlSzZJRnNGMExIZWZ1ZHI0RGJqVSs5d1pCaEZVeTBzZzlJ?=
 =?utf-8?B?SVFOOHZXQnhnTHhocmpSVThWY3A0L0lQSFcrVDg0dS9RUHFQblBjdFRvT3dp?=
 =?utf-8?B?RVcxQ3ZSRHVRWG56cEo0OXBDMExXNnpDSTVlMWoxRWZRaWlaZWszOERraG1T?=
 =?utf-8?B?MzUwcFNzb1JSTEtvcDZqMUxvNm82WTlnY1V2NUNWN0RrNHJhS1QyTEJtRWZE?=
 =?utf-8?B?Wk9hdS9xRkptSVJjWFVveENzeVhSbzdVS2VjeXVyZ2E2NW1EUzl1OWI4Vjkv?=
 =?utf-8?B?NDgybStYM2paV3gweE05b0FLWTBBV0hReWNPOCsyOUJXL1hkMnlPWStEcUhC?=
 =?utf-8?B?TjBadXUzUUpHS0VnczhOSjF5OXR5Q1dWb2srMFdjbm9odm9SelNVa3lZcTFa?=
 =?utf-8?B?Rkg0NkZKZTNkMFRQSXp1cnFHY3BiQ21zaThzdDBPOEdlaGwrRzUvNTJESVJq?=
 =?utf-8?B?NjZwVkczejM5V3owdXRSamJib2hiYThMTE9ZdHRMSmg2bW9ZRDArRE5wR3po?=
 =?utf-8?B?UGhReis2TE5kOHpiU1hqK1k5aWk2N3dmSXF4YlZyem1ucWRjR3BIckZNbGxs?=
 =?utf-8?B?WDV6VzBoWndkVEFCQTNKNnAzMVY4cWEvc2lQdFIrRDFrbjMxTkJCa1pEclpi?=
 =?utf-8?B?bzZRUU8veFNNZGdDeDhSRjJwR1VBdzdITG1UN0VHeVZuenA2QkE0cmlJYTJH?=
 =?utf-8?B?cXFTdHo4T1I0U2pRSUpQRm5DbHZyUGRmSUZnQXJBUGxSNEd0eEJ4d0NtUm8y?=
 =?utf-8?B?M2hxMzhadG1vWllqQmxsVjcvUEpYSktkbXVmOUdMK2lIRFhvczhkNlRvbnp5?=
 =?utf-8?B?R3RQb2FIWXVDY09DK2hnTjRjdGdQM3RWVUk2N3JqY0JieVErVGFKL0hQRWFn?=
 =?utf-8?Q?Miwvihh6Y7fLJPe0O8G/+h2M/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5e0c6a-9204-4c77-65ec-08db18c0fb07
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 12:48:52.8504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aPU81B1a/crrWD8CdqsPxducSChBkku6Zq1/5FYYZpMeC7Y+W/hLWt7MrIg/AOsOpr5k/muywmG15DyHgB8zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7664

On 24.02.2023 12:35, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -4,10 +4,95 @@
>   *
>   * RISC-V Trap handlers
>   */
> +
> +#include <xen/errno.h>

I couldn't spot anything in the file which would require this inclusion.

> +#include <xen/lib.h>
> +
> +#include <asm/csr.h>
> +#include <asm/early_printk.h>
>  #include <asm/processor.h>
>  #include <asm/traps.h>
>  
> -void do_trap(struct cpu_user_regs *cpu_regs)
> +static const char *decode_trap_cause(unsigned long cause)
> +{
> +    static const char *const trap_causes[] = {
> +        [CAUSE_MISALIGNED_FETCH] = "Instruction Address Misaligned",
> +        [CAUSE_FETCH_ACCESS] = "Instruction Access Fault",
> +        [CAUSE_ILLEGAL_INSTRUCTION] = "Illegal Instruction",
> +        [CAUSE_BREAKPOINT] = "Breakpoint",
> +        [CAUSE_MISALIGNED_LOAD] = "Load Address Misaligned",
> +        [CAUSE_LOAD_ACCESS] = "Load Access Fault",
> +        [CAUSE_MISALIGNED_STORE] = "Store/AMO Address Misaligned",
> +        [CAUSE_STORE_ACCESS] = "Store/AMO Access Fault",
> +        [CAUSE_USER_ECALL] = "Environment Call from U-Mode",
> +        [CAUSE_SUPERVISOR_ECALL] = "Environment Call from S-Mode",
> +        [CAUSE_MACHINE_ECALL] = "Environment Call from M-Mode",
> +        [CAUSE_FETCH_PAGE_FAULT] = "Instruction Page Fault",
> +        [CAUSE_LOAD_PAGE_FAULT] = "Load Page Fault",
> +        [CAUSE_STORE_PAGE_FAULT] = "Store/AMO Page Fault",
> +        [CAUSE_FETCH_GUEST_PAGE_FAULT] = "Instruction Guest Page Fault",
> +        [CAUSE_LOAD_GUEST_PAGE_FAULT] = "Load Guest Page Fault",
> +        [CAUSE_VIRTUAL_INST_FAULT] = "Virtualized Instruction Fault",
> +        [CAUSE_STORE_GUEST_PAGE_FAULT] = "Guest Store/AMO Page Fault",
> +    };
> +
> +    if ( cause < ARRAY_SIZE(trap_causes) && trap_causes[cause] )
> +        return trap_causes[cause];
> +    return "UNKNOWN";
> +}
> +
> +const char *decode_reserved_interrupt_cause(unsigned long irq_cause)

For any non-static function that you add you will need a declaration
in a header, which the defining C file then includes. I understand
that during initial bringup functions without (external) callers may
want to (temporarily) exist, but briefly clarifying what the future
expectation regarding external uses might help. Any function that's
not expected to gain external callers should be static.

Jan

