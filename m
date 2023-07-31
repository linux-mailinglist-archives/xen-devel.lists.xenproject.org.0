Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73855769A3F
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 16:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573126.897531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQUM4-0008GI-3L; Mon, 31 Jul 2023 14:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573126.897531; Mon, 31 Jul 2023 14:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQUM3-0008Do-W0; Mon, 31 Jul 2023 14:58:39 +0000
Received: by outflank-mailman (input) for mailman id 573126;
 Mon, 31 Jul 2023 14:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQUM2-0008Di-PV
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 14:58:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe02::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b989dce3-2fb2-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 16:58:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8092.eurprd04.prod.outlook.com (2603:10a6:10:24f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 14:58:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 14:58:33 +0000
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
X-Inumbo-ID: b989dce3-2fb2-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4vl2/nMmZrGRHkhrAnJkYa/ZDlJrDRvMMmMBj4mLbQUi4w76PMIPu8Ul0lEVrehDC982Pp32wQENaYWiIHObLziEQ/HsiePKNat0Hg13rTahRnjkvHuM5VLnNI9Q8p5xW1TSIy0UvGNK359dWqme2cfJ+WkgfDCBd4SouXTvXquRMDvwS3qBcbv51KSB1fhmKZUunDs20ZHlFPqNFWt5oAZ2nFEx4FXbBwed4VB/VP74/dfLL9mhYbYSyGKyWpMsbNszUVOtKFcML1e12MnUqI7E89T7adKPI1QzwzwtRHSgizbOMsl4FKmMQtf/uT++8OmNPMGr4eT2aNE6Zmy9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+xJOf9KS9yuvl/kYOs2gcwuyOTVvFRgFKOHAyhEVxk=;
 b=G9/bqO1Elt4PIyMc2RjSFsyqEh4JN0Ec08Uu2juDxPnJuOPKl++igtdvkZlqaegIB2KcTnCaspCdhjwNfhvpGl7oYegK/DaQvCGoC3KOhrlt04QkJvnbeXZ+rcQTccXEUHTtFBWRTd1RKPcAobGAUfQg8DL+i7z7aghGw+1XPuO2Xx7P8zQqQ5qX1sLNJ3XniiMDLVnB91vXLwR6agYzEfw9Ie6kkWtz8vN5W/giWFK8d21LdLgC6EpNEwUBl4ZLZSKezxKmLwIbMt/r3142CYgcqNe3+XYFqMMYcyBSFu7SK5VJBo6XvkpjfF0oU+jwr+IDNC2B3PupSixo51cgLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+xJOf9KS9yuvl/kYOs2gcwuyOTVvFRgFKOHAyhEVxk=;
 b=wHVTIAkWUVFxDlhXKA3ihwX9L7sh2bTXZ9tSJWiPxHSOhy9x53xB3Bq1xiWc1eaBMXGHeiekIP5pQ3ELtjGGNQA7sgFObL8SYNMBFDEhJllFR8jYSJ1eMAuSxPuyc0LIKO4eGEr1pxCOciqlWnhJJ9p/+dPp207zoE2JXH4FFPWTtQ/1KbyzFX9MOhaN0SjcJSsrU5QN1hYuvw1jGJKM+BBIFFlMp2F/xNlZWEwqlNcvHdMyyqYSTAe7Rrz3OWljNn9pkslDZ3Iw0yN0flKWmH/7fylu8Fpk+rY3UgP7v4H+1K0NMV58IbCr+bWZp8kURA2wTatZlW0wXAJW1Isl1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <876c7fa3-6759-ce5a-9e6d-9737eb4eb9ad@suse.com>
Date: Mon, 31 Jul 2023 16:58:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [RFC PATCH 1/5] [WIP]misra: add entries to the excluded list
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <20230728081144.4124309-2-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230728081144.4124309-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e5e6be-329b-4a9f-89c7-08db91d69c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ldw24/sbe6t/81Yw0/8gxM6T/L2LeTI8LhuZIsUd94R3nFZfoeNb+X/xcrt7Hmetn6i0UwKBUzHw7HCNUo0oTTPcjDqycZDlmGUsyrrZ6AuOF37TDv/g4yBNPOR25/0R7Uu5mgQ7iOlCcCksip1NkaXFJ25dS3MnNxaPiJ/1eeMXel+mc1XagqgdHQ/IwrTGttV2t0N7RpEcL4Xg0dfBWq10l2FQFFQ94DLfib1yz/+137udoVGYTjloZ/fyCuWl7oa2nv3b9fHcH/QdQmy4DO5SjEos/jpqDAI+dZEu6ZUTJfnTPvwESvQrOX/cIsih5phQXEMsuAQV5377oTWaBhN12IC92MrvHf2texdxqHhqgBqjQ5DUAruAmlKQudqntmK6UH0WdfYoxchR8uTSjmkHypUCXrBFaEoXxYajxZWLeRQ3NCR1DsURunCNZprfJNlfEqdA4qPEwLRg3oIXhdpBCDFwkAk0OPiqlHnhdmAWzxazXWqs3sEWEglSUVchWlffwq7pQczs5/bWWtff9w+fUoQLEJZ/V6MaiJ7+poCC9t6kEaIiclsxZSG58oTWOXJ69KUtk7RxvHdciLSGYzjCVCKCGmaYNjRCNs+lCmDLWwYSt5EcvqU6Cvyv5eONqCAralO89KX02qDSa0YYjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199021)(5660300002)(2616005)(53546011)(8936002)(6506007)(8676002)(186003)(26005)(316002)(478600001)(4326008)(66946007)(66476007)(6916009)(66556008)(54906003)(6486002)(6512007)(41300700001)(86362001)(31696002)(36756003)(2906002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjJiKzFPNjRYWGFzeERBdG5uU2JQaU44bEZtc2RMR096aFUwaHhQd3NwNEsv?=
 =?utf-8?B?SWdTTTNMYnFtQWZWWlNodlRpWEQxQno4TDlaZ3NNaUxRQzAzaUsvRHZiNGFp?=
 =?utf-8?B?RExMWVNJOFpxM3FyL1pKSWRtVk43aDN6dldnSGFDSm5pNHllQi9FUE9telBv?=
 =?utf-8?B?aHAyN2x2TTJ3RnZqNi9VQUVEWk5HaW5hOVFHbVhQNXVxd0RjMXpzeEVjMWVC?=
 =?utf-8?B?YWpyMjlObjRpZFhaQmhhTktINk5VUU9jRkdXQ0o4T1FZWk03M094dC9iQmZB?=
 =?utf-8?B?dXIyaHZuV3pGdUQrbjAzeXZra0xHbTFOeVpncWZ2cFo0bzFqblVYWUFIS2tO?=
 =?utf-8?B?dmlPL1k0akFQdjNOOC82S0hQVlFheTR4M29sa1FVRWNHN3BFcjA0RkZUM1U5?=
 =?utf-8?B?NnFIcFNZMCsxTTJHREhmU2owOU90QVpGK3dpdWh1STVIR1EyU0FPMXU1aElH?=
 =?utf-8?B?N0hCUzk1WTl5NFFJYnN6UzJVTFNTVzIzMmlZQzJTS0dwa1daRnlGTGlvWVJU?=
 =?utf-8?B?R1I3TWtxWHk3Nmh5anEwL2xnMWtxS0w0OUZWalRuTzhnSmJLWmNGYkE5Y0pO?=
 =?utf-8?B?L3lxT3Qyc3dZZGZUWFFtWkZtellicG1sN3hMWmtENDE2Q3lNc3B5Tyt5dkZz?=
 =?utf-8?B?MktpM0xibVNDNlN6S04xMHBVQm1HZ0grZGN0RXdNTmpGbVVGeVFtNnBLLzl0?=
 =?utf-8?B?QkZrY1hFVkpBN09hK25Na0hUNVFMaFI3RjgvK2R6eFlkSm1CUGZzYldsZWtu?=
 =?utf-8?B?bjBZU2dhZUs1TTJqb0dKb2dRa2lySVBhK29wODdLT21jWHp5SEI5czdSNHZ2?=
 =?utf-8?B?MkVsR3BlalFZVm5FSll4SlZxSzlHYjRrVHBVeFNKOHZjMm5GMWVhNzl5UnpV?=
 =?utf-8?B?Vkllb255OW5ndTR1SVJJUVhDRVIvL2dwOEhRSDhVVmZrQW5JUVdZVEc3aDFD?=
 =?utf-8?B?aHYxZFdkZ3B6MFQ0bVFEQ1VqY3JzQU9pTHhFa1pydldIeHV6SnFSQWE2L0Na?=
 =?utf-8?B?YkxWblcxRFZKY3RiOVNJazJyWkJhb2duSTBmM2djbW5vaDNWQ1NWcHRrQkpq?=
 =?utf-8?B?UUpQMm11YUpFRW9ySWlNMk8yZHFOQWZMTGE3RW5rNzlUUDY0dlRGTEhUTTRP?=
 =?utf-8?B?b1RKR3JNbDRhUmt6ZEhYbzJIZmw5SVFYWHA0M0Y0YjlOUmg5eCtZeWE0K0dw?=
 =?utf-8?B?bmZ3Yk5CRnRPYWNXdW1aYjFZQVB2dzF6MmlDSlJMOUVSbVdoZkJrVXBMT1hM?=
 =?utf-8?B?bU0xSnh1MndsRTRFMHNxbk1FRC9YSHRwVjNEdjlNdkdVaVZUVTY4aDZrcHZ1?=
 =?utf-8?B?YXN5ZndMd2toelR1alBoRnhSdkFtZFZhbTVxbW9mTW1oY01PcVRkQ1VhQy9x?=
 =?utf-8?B?dkt3Z0lhU0ZqNTY0Qm9jcGQ1d3VTWnNzNS9oTFVzRzBpZWVTaUgxeGg1MzAz?=
 =?utf-8?B?eWhRZGkzSnprd0NBNVA0NEpGVm42UTVZUUNOREhwQTVVNVA2T0RUaXVRQW9L?=
 =?utf-8?B?dnVpc0czTGozaEFiQkwvNEptb2ZEYjgzdGZoRFJPcm51eWY1T2w1Y1BlaUNZ?=
 =?utf-8?B?ZUZFcHRab0lCakFNdTFRSjNlL1U3SGhrWHRUNmhBQUhjWEczcFRRQXNIUHBz?=
 =?utf-8?B?SmNOQm9xWXgrQ043b2F4Y2pJOU4yUzN3dldmN2FrZUJxU1VENVpqNW5BdXFh?=
 =?utf-8?B?bGJKZEZwZjF6T3hOb1ZTbWU1OXJSYk1zTERUY0FKY1l3c1h0dXNBcFRGNGdP?=
 =?utf-8?B?ekltQVBGU21laG93eXpJV210VGtjcmpMdWxYY1l1TlZIVWlBVFc5Y2lLUWw0?=
 =?utf-8?B?NkNhTHpNWXA4WTNpaXZ2akducnc4T2xUaTVocGh2NllwaUlXVzlOQklBUTFM?=
 =?utf-8?B?Ymxid3hsOFhOSkhlUVN5UldsRTZGRlVDZjlkaVVpWmJXazRHQTlqYURHS25v?=
 =?utf-8?B?UHlJTkd5d3lIWXZGeThHd3NjV3k4VnE4RnRqQkhvdjVFS1RlamNmSjBHMDhD?=
 =?utf-8?B?bG5WajRIRTdhUThtdkpERWtnVkNNUkVKMHpQbVFIdXBoVGlsUUxWUFJvZVpw?=
 =?utf-8?B?M3JocGs3THZteGo2eEw3SUhzUTYrWlhNRkhKTzI2aVlIakJaM0x4M0cxZ2JW?=
 =?utf-8?Q?aJlcN/ySrG8gc/CYJ8v8Wfj0b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e5e6be-329b-4a9f-89c7-08db91d69c20
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 14:58:33.2660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZOhXYGByxHHqWVJIEAfwSDeXlZp8KDlYeiDAg3W18VLelk0rpNLk/5mcWFDePZig42g//aD50ZPCI/xFLw+ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8092

On 28.07.2023 10:11, Luca Fancellu wrote:
> Add entries to the exclusion list, so that they can be excluded
> from the formatter tool.
> 
> TBD: add a field on each entry to understand for what tool is the
> exclusion
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  docs/misra/exclude-list.json | 88 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
> index ca1e2dd678ff..c103c69209c9 100644
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -1,6 +1,10 @@
>  {
>      "version": "1.0",
>      "content": [
> +        {
> +            "rel_path": "arch/arm/arm32/lib/assembler.h",
> +            "comment": "Includes mostly assembly macro and it's meant to be included only in assembly code"
> +        },
>          {
>              "rel_path": "arch/arm/arm64/cpufeature.c",
>              "comment": "Imported from Linux, ignore for now"
> @@ -13,6 +17,26 @@
>              "rel_path": "arch/arm/arm64/lib/find_next_bit.c",
>              "comment": "Imported from Linux, ignore for now"
>          },
> +        {
> +            "rel_path": "arch/arm/include/asm/arm32/macros.h",
> +            "comment": "Includes only assembly macro"
> +        },
> +        {
> +            "rel_path": "arch/arm/include/asm/arm64/macros.h",
> +            "comment": "Includes only assembly macro"
> +        },
> +        {
> +            "rel_path": "arch/arm/include/asm/alternative.h",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/arm/include/asm/asm_defns.h",
> +            "comment": "Includes mostly assembly macro"
> +        },
> +        {
> +            "rel_path": "arch/arm/include/asm/macros.h",
> +            "comment": "Includes mostly assembly macro and it's meant to be included only in assembly code"
> +        },
>          {
>              "rel_path": "arch/x86/acpi/boot.c",
>              "comment": "Imported from Linux, ignore for now"
> @@ -69,6 +93,30 @@
>              "rel_path": "arch/x86/cpu/mwait-idle.c",
>              "comment": "Imported from Linux, ignore for now"
>          },
> +        {
> +            "rel_path": "arch/x86/include/asm/alternative-asm.h",
> +            "comment": "Includes mostly assembly macro and it's meant to be included only in assembly code"
> +        },
> +        {
> +            "rel_path": "arch/x86/include/asm/asm_defns.h",
> +            "comment": "Includes mostly assembly macro"
> +        },
> +        {
> +            "rel_path": "arch/x86/include/asm/asm-defns.h",
> +            "comment": "Includes mostly assembly macro"
> +        },
> +        {
> +            "rel_path": "arch/x86/include/asm/bug.h",
> +            "comment": "Includes mostly assembly macro"
> +        },

Mind me asking why assembly macros wouldn't want maintaining in proper
style?

> +        {
> +            "rel_path": "arch/x86/include/asm/mpspec.h",
> +            "comment": "Imported from Linux, also case ranges are not handled by clang-format, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/include/asm/spec_ctrl_asm.h",
> +            "comment": "Includes mostly assembly macro"
> +        },
>          {
>              "rel_path": "arch/x86/delay.c",
>              "comment": "Imported from Linux, ignore for now"
> @@ -181,6 +229,42 @@
>              "rel_path": "drivers/video/font_*",
>              "comment": "Imported from Linux, ignore for now"
>          },
> +        {
> +            "rel_path": "include/efi/*.h",
> +            "comment": "Imported from gnu-efi-3.0k"
> +        },
> +        {
> +            "rel_path": "include/public/arch-x86/cpufeatureset.h",
> +            "comment": "This file contains some inputs for the gen-cpuid.py script, leave it out"
> +        },
> +        {
> +            "rel_path": "include/public/**/**/*.h",
> +            "comment": "Public headers are quite sensitive to format tools"
> +        },
> +        {
> +            "rel_path": "include/public/**/*.h",
> +            "comment": "Public headers are quite sensitive to format tools"
> +        },

The common meaning of ** that I know is "any level directories", but
since you use **/**/ above that can't be it here. Could you clarify
what the difference of */ and **/ is here (or maybe in JSON in general)?

Jan

