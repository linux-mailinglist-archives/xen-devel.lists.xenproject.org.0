Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDD7772575
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 15:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578421.905913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0CU-0006M2-MJ; Mon, 07 Aug 2023 13:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578421.905913; Mon, 07 Aug 2023 13:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0CU-0006J0-JZ; Mon, 07 Aug 2023 13:23:10 +0000
Received: by outflank-mailman (input) for mailman id 578421;
 Mon, 07 Aug 2023 13:23:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2NL=DY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qT0CT-0006Iu-1k
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 13:23:09 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b6821a6-3525-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 15:23:07 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SA1PR12MB6969.namprd12.prod.outlook.com (2603:10b6:806:24c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 13:22:59 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4541:2a3d:737d:b194]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4541:2a3d:737d:b194%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 13:23:02 +0000
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
X-Inumbo-ID: 8b6821a6-3525-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrwEdPKTuEWfYehSKQdUXa9JyNH6WCN2ArDj0jlIS4anz6nY3czwvAhDvOB17zYm5ldAXmaH+NYWSjIOuMOZ4BGfmpOt8Pcbf0xs73hmIGpYAlM/etM4GIlzYSrDRjYpAPEbusR63lSB0cHAMdvDZ5qNtpWQYnyJnq5RVPhke/h2c7P/DyEhjGHAELe/3FqK4cC4K5aPQdTgvI3P3OBTBr8R2wPcB7mj1Pi1uFu5b6/liRZ82tB8KrK/KWhKhOiDZsdnx7f1q0lLLuUh9h2LNgEt0p3GTH5VQySIj/9vCjvL3hsqtbQvlnwhjxY7CZgQJLy6bfiZ9LNY8ejmncPdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5U2DaR2mLr8BtOdeke40BhnOPacsz+xThXxLeg48kg=;
 b=dqZDh6PH2sY0yKgEBwYXhgudYTDAzpbawPtuBIUCXxFVTXi03ABvxrARyoQPH47HLn3Wr7ncbGcJ8PJW2dfwjD2R/nZ/vA7fBWtQne1+3mhNVhb39x3E6xP5/5EESYcYm8IVL1B8ExZjsx3uSCRLXeLh0ezcJRRPOqyQ8F5aHiXtOhzUgDGwPc131KKEkpYQHk6duhbbowdazpDatEh7Q12gIQdMpZKmk11rVYPLfQvfjDFmYuF2lLR90lJXEq0FMElA6ly14Zs2Kh258GgXO5gbvB4XlKOb4ltdQbZEcMfPM2A/uoJlTCnaIi6cRaayUdddgGSt+68LozsXdxxZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5U2DaR2mLr8BtOdeke40BhnOPacsz+xThXxLeg48kg=;
 b=nAIFvbPqc2l7QgG6z784H4LYaQPYuLeLxASrqH/rAeRptQ17Ba9m/jh2Cmmd/r+rZnokIRiSRI+qxEIibIUpvWPXgAncReApMWt54pEWFxt6ryY4rE0r7GbCzw0oRCoy9Lrhvdb+lPw4ZK4JU+7EByPtelUROnIAU7G6oFsjn/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <24eba373-edc8-e2dd-5d5f-34c7f0865d5f@amd.com>
Date: Mon, 7 Aug 2023 14:22:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v4 03/13] xen/arm64: prepare for moving MMU related code
 from head.S
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-4-Henry.Wang@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230801034419.2047541-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SA1PR12MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cabf411-b2e1-4879-59ff-08db97496cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ki7fQ6A3aXWz3idyg2Owlx2UlIVDWTCmOUVpSEESyog5EeMd/QdVMnQ0arldhcfupuD5EGUo15iF649+C+tdN88Xh4f3CE6e6KHGgS9eczE4eBX9i3/CVnkQoIM4hLAe10tJO+cVaeuillN/qc135j2FJNTYxI89HfNuBe64h3832BBU6vjtkPRgbPRdI0ME1lPoX48SjheQA/g/Fqdpxe8zkCKQtAyZ39vJ+8lxtebthgjoBuC8B3PP3cSUtV3Tkuag45NVqqXeVDLAcht6uDG0pLFx7sB9cH1eKQhZjbnzkh6qI+WzTI3HPWjOND2IeNen+3mhUwFdvEvOXxjNPbBmcjct06C/LAk7Gu7olKivgK/YqPHlM3iNUIQ7t3IUJcYbzpGoTF3lSKKqGhgi7Ym+mxeBJHCsp3adulNJWdXxGGs0JPxlRhR+sjBg6RSnBU2UajlQuyvoJxs0AnJHa80nxIO57Nh6sVlrwXZVGyRgd3lh1ED7XRiWAEg0RIwB9+0FFiJ9rhhlHo+vYbhdCPlgkT53hI73mnuugYaI+k/uy+35u4mM3mKuQWqx8H4ZYu6+hQGlOINxWsP+auvdk2zwUW7sUhO8gbCSMXdeeB20Vvu1lz76YXOCrNHyB8nmGG36UPdKa2xA6G+g/5esVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199021)(1800799003)(186006)(36756003)(2906002)(83380400001)(5660300002)(2616005)(54906003)(6666004)(38100700002)(6486002)(66476007)(66556008)(66946007)(6512007)(4326008)(316002)(31686004)(41300700001)(31696002)(8676002)(8936002)(26005)(6506007)(478600001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHJ0OHl5QVloczlNYkhNY2pZNG1ZTzJNcFZZbFlqU0hHTUpqRC9uVDZ0NkVB?=
 =?utf-8?B?MU03Z3FBWk0vQ2RzcmlhVHliRW94Um5MelFTaTBNZW1GWkUwd1Ztc0dUWWRG?=
 =?utf-8?B?WlpkRzh0YXZsek5zbXdocGVlRzJNeHlSbmg3UWhXT1VCYTZ5V2NmZmlESUJQ?=
 =?utf-8?B?bWRpc0IramtUVDk1bnF6QnVITU43OUNidE5Yd2VWV2xtR3BwSCs5MlRpQ0Yy?=
 =?utf-8?B?NWRWdjh3VmR1ZW9DZFVnVy9ZOWRiVkFER0c4TFFYRUJKRnRaMGR0UExTTklj?=
 =?utf-8?B?RkZwaGlEbjAzdEtSUjc2OGF5S2NCVjQyUWlkTEphSzF5Y2N5ZTJ4QjhvelUx?=
 =?utf-8?B?ZUFUdUdDRUkzWWV4YmgvWTEzbTBCeWVWVGptaE5PZ2NCcXpSWGY1dFo3R0I0?=
 =?utf-8?B?Y0ltNnFjR3NOcTVNa3l0U1NHMVM4RXQ4RzFWV0NGRjRmd1psb3NQaFVzWCtK?=
 =?utf-8?B?TFNpTjRNbFFsRFNkY3BrdmRKRjlaOXl0RTZZZTE0ZWtUcjJrd3NLTGZsTzNE?=
 =?utf-8?B?VHkyc1k3WDRubnN6RG44eUhXTGNHQ3hDWEhId3pieEUwTXY4Tyt6ZTR0eWRi?=
 =?utf-8?B?cytJVGdVMFRGOTh1UGFJSlBCL3dIUHBaaklCQXROUGJIRVg3UWhKZld4U0Uv?=
 =?utf-8?B?ZGZlVjZabDNlQVVjR1RTS1NNNm1odlM0andkRDNqY3dyeUNrSGt3aGw3R2gr?=
 =?utf-8?B?NG8wUlErb2QwZGZtQ1R4WWtyS2lpZ2Q2akNuVE90NlJFRUVENGErVTNlWUNI?=
 =?utf-8?B?Z1BreHdiSVhldDVSaFZwaTVLbmEvNUtjeXdmOUVFbXNwdHRxdFJzZVFwS1pP?=
 =?utf-8?B?QnhqLytYVC9uQ2loWmFvbi9RbzBmWWh6TThBWUV6VjZSeTRmdEUxTUlGSDBj?=
 =?utf-8?B?MzdOWEloSVJUNUt0SENLdS83YW9tRVF5c1lURU5tWFVhNTJuc2szbEZrK1Q2?=
 =?utf-8?B?SmpjZWNWL1dibEF6RWlRMGdrTTRlMkZveHlxRXpkR1c0dGhETklKekdkU1o2?=
 =?utf-8?B?dkFCNTdiclJ4eWdOaVhpdE1Ga2Jsd25tUnBkM3FqM2EyMVhoVExOTzVWc3NL?=
 =?utf-8?B?bDlGbmppQlhzY2xGMGVTRHBKdzQvQm5qYTBhRy9kRlJLNEpEZUFFSFBxZzdC?=
 =?utf-8?B?ZURUTVlqdzY2bWQ5N2RSeUl4L2syTU04UXBoSjJFRmdMQmoxeVFvSnFScWJh?=
 =?utf-8?B?dU4zUEh1WXVBZ0V6cDVWZlJzOHpZZGlBV3hYOXhQcll5WFNjY1RzbWRwbSth?=
 =?utf-8?B?dWdkVGVrc21IZi9XUHlnTnJWTzRISWloUVY2SzREV2pYaXN6R05qVlpSVytW?=
 =?utf-8?B?Q2x3U2dZWENEcDJFQWwrNmVCZ1pyZUphMS9yWU02a3Q1eVZudzZPQ2Vzd1lz?=
 =?utf-8?B?TDBIVVBsSzhIRm9MdWVuenp0RUtSY3NuZDZvTkJINzZrMkJiN3JqdGM5ejBs?=
 =?utf-8?B?enRsUFREdmtXdjZDRnBnbmFSaDNwU3ZUL014WFBMUjB4RFFSemU0dDMyalZM?=
 =?utf-8?B?c2dTMFpDczNScXBVQmlpUTM3VVFYMFlCaFJlNUpPbjhwcGl4b2drdWtqYjg1?=
 =?utf-8?B?TThIWTd2VEJ5cWFsZnhoY1RpU05WUlRvazZsY0tpOGVzdGh6Q2NXL2tnSXgx?=
 =?utf-8?B?RXB5UkdJRVU0U3NVcUhKNGJ1VWQvNmt4bklXUjRYbXZCVGkxY25kS0tOYTBl?=
 =?utf-8?B?d1ZmK05IcE9CTkNYN1dUSEk3cUI2aWRVUFZlaE50TnRIMEVndWJNMXpTRnBy?=
 =?utf-8?B?RzhXWW9QU2Rna2Q5TWorTFZ6MGtQVCsvanNSSSs0S3g0TXlaV04wWldnQzBE?=
 =?utf-8?B?Tmo2cEpTSENaLzhZZzllbmtzbXlncFdPL0J1aXQ0d3F3ZGx1ZkdDTWxLTVky?=
 =?utf-8?B?d0VVSUt1eTNvU2FyQXBEN3puUFhlQk81dG1XMjFtRldlV0UybzBOcjRyajky?=
 =?utf-8?B?TGJLdWtnN2hhbVVRREpKWDE3WnBwMVg4bjJDM25Dc0xWQWQraERTdkxDbDNl?=
 =?utf-8?B?L0ovMkExTVRTaVYrOE92bmlndkFvaUp3Q1l0dUdPcjhZeFdpd0lwQ3M3RDZO?=
 =?utf-8?B?eTJJbU50NzhvT1lMK29hR1BTS2drV0FrS0txa2tzVTNzUDBuYmZrRWNyaFEy?=
 =?utf-8?Q?NO++M3zy37jLQlEqrKDLGo/SZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cabf411-b2e1-4879-59ff-08db97496cf8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 13:23:02.2081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEFjBDZGDpRRMifjiNuMK0VQNwfRC5sIhRe8vv7jrixMXDqYsVrAC038j6oMebdc/rB6JVnffWcdk7WNr03x0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6969


On 01/08/2023 04:44, Henry Wang wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Wei Chen <wei.chen@arm.com>
>
> We want to reuse head.S for MPU systems, but there are some
> code are implemented for MMU systems only. We will move such
> code to another MMU specific file. But before that we will
> do some indentations fix in this patch to make them be easier
> for reviewing:
> 1. Fix the indentations and incorrect style of code comments.
> 2. Fix the indentations for .text.header section.
> 3. Rename puts() to asm_puts() for global export
>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> v4:
> - Rebase to pick the adr -> adr_l change in PRINT(_s).
> - Correct in-code comment for asm_puts() and add a note to
>    mention that asm_puts() should be only called from assembly.
> - Drop redundant puts (now asm_puts) under CONFIG_EARLY_PRINTK.
> v3:
> -  fix commit message
> -  Rename puts() to asm_puts() for global export
> v2:
> -  New patch.
> ---
>   xen/arch/arm/arm64/head.S | 46 ++++++++++++++++++++-------------------
>   1 file changed, 24 insertions(+), 22 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 2af9f974d5..b29bffce5b 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -94,7 +94,7 @@
>   #define PRINT(_s)          \
>           mov   x3, lr ;     \
>           adr_l x0, 98f ;    \
> -        bl    puts    ;    \
> +        bl    asm_puts ;   \
>           mov   lr, x3 ;     \
>           RODATA_STR(98, _s)
>
> @@ -136,21 +136,21 @@
>           add \xb, \xb, x20
>   .endm
>
> -        .section .text.header, "ax", %progbits
> -        /*.aarch64*/
> +.section .text.header, "ax", %progbits
> +/*.aarch64*/
>
> -        /*
> -         * Kernel startup entry point.
> -         * ---------------------------
> -         *
> -         * The requirements are:
> -         *   MMU = off, D-cache = off, I-cache = on or off,
> -         *   x0 = physical address to the FDT blob.
> -         *
> -         * This must be the very first address in the loaded image.
> -         * It should be linked at XEN_VIRT_START, and loaded at any
> -         * 4K-aligned address.
> -         */
> +/*
> + * Kernel startup entry point.
> + * ---------------------------
> + *
> + * The requirements are:
> + *   MMU = off, D-cache = off, I-cache = on or off,
> + *   x0 = physical address to the FDT blob.
> + *
> + * This must be the very first address in the loaded image.
> + * It should be linked at XEN_VIRT_START, and loaded at any
> + * 4K-aligned address.
> + */
>
>   GLOBAL(start)
>           /*
> @@ -535,7 +535,7 @@ ENDPROC(cpu_init)
>    * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
>    * level table (i.e page granularity) is supported.
>    *
> - * ptbl:     table symbol where the entry will be created
> + * ptbl:    table symbol where the entry will be created
>    * virt:    virtual address
>    * phys:    physical address (should be page aligned)
>    * tmp1:    scratch register
> @@ -970,19 +970,22 @@ init_uart:
>           ret
>   ENDPROC(init_uart)
>
> -/* Print early debug messages.
> +/*
> + * Print early debug messages.
> + * Note: This function is only supposed to be called from assembly.
>    * x0: Nul-terminated string to print.
>    * x23: Early UART base address
> - * Clobbers x0-x1 */
> -puts:
> + * Clobbers x0-x1
> + */
> +ENTRY(asm_puts)
>           early_uart_ready x23, 1
>           ldrb  w1, [x0], #1           /* Load next char */
>           cbz   w1, 1f                 /* Exit on nul */
>           early_uart_transmit x23, w1
> -        b     puts
> +        b     asm_puts
>   1:
>           ret
> -ENDPROC(puts)
> +ENDPROC(asm_puts)
>
>   /*
>    * Print a 64-bit number in hex.
> @@ -1012,7 +1015,6 @@ hex:    .ascii "0123456789abcdef"
>
>   ENTRY(early_puts)
>   init_uart:
> -puts:
>   putn:   ret
>
>   #endif /* !CONFIG_EARLY_PRINTK */
> --
> 2.25.1
>
>

