Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE457CAC2F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617680.960517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOvU-0007hC-L0; Mon, 16 Oct 2023 14:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617680.960517; Mon, 16 Oct 2023 14:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOvU-0007fY-Hb; Mon, 16 Oct 2023 14:50:36 +0000
Received: by outflank-mailman (input) for mailman id 617680;
 Mon, 16 Oct 2023 14:50:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsOvT-0007fS-4Y
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:50:35 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe13::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b4e87c7-6c33-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 16:50:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Mon, 16 Oct
 2023 14:50:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:50:30 +0000
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
X-Inumbo-ID: 5b4e87c7-6c33-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DanLGdPQqGUxBI3RN1GcUoOoIjChzwCzvAP9rFj8NPzXKz9Lu3ui5OJ5dXedz8uFKd3jA/1GqNc8XBQwukGVHafsrbVVk8bC7Q+Th7xd/Y8aEJu9TMz9eeYBbGIo+Bxurcf+uQNyyqeuRVJxbJ2rzf8wtA2Btem/NFExrQKdSxrd03iXY8eRJtYhuUgrSz+XDDjkWG4Jqt4SbX5coNWY1Z3Z2568ueYRAWRBmhAKEMtVcO3A4rZp66sjwRgBiD9ZiXNxvpfGIXnsGB1f/Oh5XNjXqvmMUbsmaIFKbsHitp+D61DYRMjmq04yOdWOFe5pOwdVq8DiGy8E/vXsWVNrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqA8SWAfTE/+9BUyg3pJi1DzRtqDHWg03Kup+Q4VYJY=;
 b=JRbQHfKqFqn7bridTLVkaIrqEu+l/71kK6DwwP3yMwpCPucUE0dUGUMCgCALCWIoALszIfSFfrQ3AJf1ILC/nyB0DVeaOi4+LwwUZqcSa/m+ILswlPGSV2GWsjPLLKR2mcRczWJcfAJgWms9Jl0EP5l/h9k1iILK8ed6oLpsg3QKeSU4jSLDVqIOnChb8WN99BlEhtS9xXqzeZAXmRfwdS9F8+IYFJhD+lmtPzX6bDJU8UhWkWAa/6T3kF/FdKoj5TNKdYs7SC4YIGgm1jNHpII1Ow/hXKa44wtb/6YuKw4qt098Q6LG4NOxYepz6fPCjm/HbG1b+5+yW8m7XINzfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqA8SWAfTE/+9BUyg3pJi1DzRtqDHWg03Kup+Q4VYJY=;
 b=GsUqUXD81eBri7rql8y8smfOmFjwQpb3g9enddmCdn+gU2ARvzAwDkzMgDRgdjvMk0W5z8VuLD8yK3DXHIELZKkSbcFzXODeXH64RInOxNEeQK+NcHYBigbo5ax87kUjdXckGLi6AyhVy+QZmzF4EsMt8uPGHA/XF8IhNeNwQX08rRn7Nqs6DxcJU1oHC/6q/teUSveFcOTY5jDnVYYwh3apHyt8yaT0Jl9cCivZQex31EyzMlN516hY6oPTJdkGKZUyVjtnTUTb8YNMI5B08vonZfuZP9LHn11JDObx+5ERr9xvyYphOVqpQUQTnhJ12l+VVnRdtbadQsicei/dIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2023f16b-46fb-2a19-9620-7872b3029b5f@suse.com>
Date: Mon, 16 Oct 2023 16:50:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 1/7] xen: add declarations for variables where
 needed
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <002d58b1d15619a8c4b2ec6c2b5f20960ed0a428.1696833629.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <002d58b1d15619a8c4b2ec6c2b5f20960ed0a428.1696833629.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a9c581-bcec-45c7-a3bb-08dbce573dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HusS5fNLyQ4Dlm/ilIkoyYSp5+BktTxE3hMsTgUDCVhSjwOtZ4/PBX85fqWwBPMrEb1cEhIUIr8DYCsTMzVRwsMwyGReSsS8LbHpGRj0thOll8pVL3grPNwDIv2YeYA5o5v/g6Isvcp5tgFkkgV2y04HqrWbpBGPkUGDsMj7tEHkIdzhTLbXrFAmSCeF55N7BxYDmausJ40LwHHt/5ZqRi+h7TtXR9qRmxQz4DIfgIZ+IjY5nmXJz/J2GW80df/gI6JK45oiqKhU4muqK3T6Rkf4mRS4zSoPN6gjtk8nlA13hVqe52DVO/gFUUJ20BnH7MocEb1Xvf0dTy8LqxV4xV7lRCYu+OgYJ1mSOWA7DpjDzRJM0M5fw3yuLBtS85JBjYtdHLGxIN31v7rPA5UR67adOdx96Sbl9NNF8Js+DgLBVHL8zDhTfgHLqEYzChyVTd+pZ78l+mJgD+R1yZKC8XFYiSuXk/gXqRV8tshJ+1dRwAllhDtYw5SQrqFiKaR/Xo2/vRjSUikwcxhH7IB0Uc9Uz/GcC3TxosxRoNQEdHrWoPfNFD20GROEVl/feLklNYFHpTcq3QbNfDaePt/Y/XNEtAlaZQxi6lIYCpHsV/heFS95oJDUVOUaLNoa2vioZcMvUgyQMKemKKxnDB3O2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(376002)(346002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2906002)(5660300002)(8936002)(8676002)(83380400001)(66476007)(66556008)(6916009)(7416002)(41300700001)(316002)(66946007)(54906003)(478600001)(4326008)(6486002)(31686004)(6512007)(6506007)(2616005)(26005)(53546011)(36756003)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHdyR092K1k2UWhIbklEWDdVVjFVT01XUFFWS1YwaGdkMHhEcFY0dDRrbi9H?=
 =?utf-8?B?a1RyMEg5UFc3UitxWi80cGtSZC91cEdrWms3VmJ2dDkvNWNSazBNenprTjl6?=
 =?utf-8?B?NEdJTTlYeDRXdGdmbnJ4cThERGZsVm96YS9aZDA1WnNaVFIwOGtDL0FHNDR3?=
 =?utf-8?B?WWFvQmt4YWVjZXZrQzNWaDg4bGVsbTJEcTkyZ3ZLMFUyVmNTdWltN1AzWXVy?=
 =?utf-8?B?V3lpckNtUzc5Rlo3T3Bub3YrenBTdGozd1ltTE9jQjFvcEt0TWFTckNpRnFN?=
 =?utf-8?B?UER1YlJtd3k0alJCLzhZSDNNNGp4bHQrc1RHZ2ZFSzJpcUk2aVR5RXE2dTdl?=
 =?utf-8?B?bWRxMmsrVENqSnR3TmtTRlFIZXVVSFhENzUvNkFoTmZtbDJVbnhxdlNiNUlp?=
 =?utf-8?B?SGZVZCtqTVVSU2sxOFhFd3NadWRERDJBWU1RSmhGcWNxTCtnejNPRFJoS1hl?=
 =?utf-8?B?azM4ckJMeFFIRVhkc0NQSk9EaDRnL1VWb2R6bkprUEduTWtMbjh0ZStTOFEx?=
 =?utf-8?B?dTVtMTNVK3RvNFdkU2o3UXRkMGl0YitRdmxpTFRHQ3N5aUQraVhTdkdmalNJ?=
 =?utf-8?B?dm1SL3NsS1NHZWtWa29sTCtVSVlCUjNIR3VzVnhOY1NLaHA5SGkrOVloRk1N?=
 =?utf-8?B?RFpZS3BubnFjaE1icGNpSzYrc2oyZEdqcHJpbS9kYjZ4blc5ekplSldTbU5a?=
 =?utf-8?B?S0h5cFJ0ZEhFRkovWnJJY1k0SlZGUExGeE9WaFNmZXVPVzJpbk1zSElSR3Vo?=
 =?utf-8?B?dG9ZdGNyaTN1Y0krOTZ0L0dLemZhV09aQXFiclE3VVQ4RlZFOUY1U3E4akYx?=
 =?utf-8?B?RU03eEpISUpzN3dleDhQdjhGeHZOejJCay85dEFsYVBhOXNpZklXSEw0eTJp?=
 =?utf-8?B?ZnRJQ3hOVDJZeGpwRmVST1hRMnZmNDBoTEVVVlkrdzNjR0FoMXRVZmNMdERU?=
 =?utf-8?B?aEhUOTliWWRPOE50by9rT20xMjdLVGNoU1FEK1ZNSHgxcHJpOGpVYXV1dDcy?=
 =?utf-8?B?VURVbzgwMnJwWGNwbHF6NXJVVm1ZRHd2N0ZZRHFXK3RHZW5pMkZhL3pRVkFU?=
 =?utf-8?B?alc3SUVjc05yZ2Fmc25MWDRnNTJIOGRZOTIxOHZhWEZTRktCaWxnTVZXWTFv?=
 =?utf-8?B?UmxieFBlZWdzZ3F0NDNxdnZSRG14THBGWVlIMEZSaHBEaXM5TXYrblo0VGxJ?=
 =?utf-8?B?aDlXZ09qRkxyN1dMcDJsWml4aGpPZnYwMU5OanNrSklaOGhWeXI0UWo3b05C?=
 =?utf-8?B?YTJMT2Fwc0xneGJzbm0yQmZ1RGZaQzZ1R2ZzMlZRc1lpMGR2OXV3UTdDVzFN?=
 =?utf-8?B?YmZ0bWVSL1dUTmVzZzZlek1qVVFVaU5DNW1WbHJrcUIydEFUL0Y1aTA5OHA1?=
 =?utf-8?B?R3VzVjBnZlROd1NNOXBEc2cwOWVIdzFReTdhVFhVNGk3ZmcrTW8rUnNlSDNl?=
 =?utf-8?B?LzNQRnRvcCtpMjVIQWI4ZVZkakZpbHkrenVtNzNZckRQWDlKeEtjQXc0Zi9P?=
 =?utf-8?B?OUREMDdIUHJsZ3c2bUJqWkRENnFEZ3JNVXJmdjgyZksrY0hxNkR0VUxvMm5s?=
 =?utf-8?B?ZEF6QWJjMnllbG0rMXFBOVJuaXlMNVNVaE4yN2Q0Ly9TVDhWSHJzMGFoVWNJ?=
 =?utf-8?B?cWwrc3NrMDU3R3JLUGRTMVV4THZpMTJmb3A4M3VTMVZ6cGRMTG5EakxBWFJG?=
 =?utf-8?B?ZVFkQktyNTFjcVlMaUxSY3Z2Qy9XZFgzTnNNRUdkWUNQcmpPREYrQUhhVlRE?=
 =?utf-8?B?MXVGTVJ1TEhvVVRGRy9hRVlGaGxHV2tJMXUzRHorMEx0bjFnV3FHOHFzZjJJ?=
 =?utf-8?B?R2pteTBEN0RDMWlzYi9GMGpBSWM3VjdBcWJEY1J4c0FGY1VzaW9Oc3ZYbndo?=
 =?utf-8?B?SjlVbFFiWVNIbkMrZmpCcjhXS3BBdEpnaFRpTFpLbTkwNURFWkpiYmlIUndw?=
 =?utf-8?B?VEU5NTZVcEEyR0xJYzJOTGZyR1h2RnozRUpxYmorZlgramdJa2tkYnZ2bkdP?=
 =?utf-8?B?Y1lvV2tUSUt0NHloc0J2S29MaVovbUxtOS9CMUVna1JUOEVIZVFWNkJ5YTFT?=
 =?utf-8?B?UkpuY0lWLy9xRkFyR0FZZGlhbnI4TGkxUzlDZHFic2tRcTBUdUVtZWFlY1ZQ?=
 =?utf-8?Q?vZgUNASAu0tUUx2DRTgVUfqWl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a9c581-bcec-45c7-a3bb-08dbce573dfc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:50:30.1736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cb7Lm/JBQFn8icgaoEzvsgKRgWp8f/d0nRwazle4HYF9SOFbJBWZQAvIN9piYocCPsaeDk05u1KTvTNeV19UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7157

On 09.10.2023 08:54, Nicola Vetrini wrote:
> Some variables with external linkage used in C code do not have
> a visible declaration where they are defined. Providing such
> declaration also resolves violations of MISRA C:2012 Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

This is a mix of different approaches to the same underlying issue. I
think respectively splitting would have helped.

> --- a/xen/arch/x86/include/asm/compat.h
> +++ b/xen/arch/x86/include/asm/compat.h
> @@ -13,6 +13,7 @@ typedef unsigned long full_ptr_t;
> 
>  struct domain;
>  #ifdef CONFIG_PV32
> +extern unsigned long cr4_pv32_mask;

Why is this needed? Didn't we say declarations aren't needed when the
only consumer is assembly code? (I also wonder how this header is any
more "appropriate" - see the changelog entry - than about any other
one.)

> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -13,6 +13,7 @@ extern char __2M_rwdata_start[], __2M_rwdata_end[];
>  extern unsigned long xenheap_initial_phys_start;
>  extern uint64_t boot_tsc_stamp;
> 
> +extern char cpu0_stack[STACK_SIZE];

Same question here.

> --- a/xen/common/symbols.c
> +++ b/xen/common/symbols.c
> @@ -21,23 +21,6 @@
>  #include <xen/guest_access.h>
>  #include <xen/errno.h>
> 
> -#ifdef SYMBOLS_ORIGIN
> -extern const unsigned int symbols_offsets[];
> -#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
> -#else
> -extern const unsigned long symbols_addresses[];
> -#define symbols_address(n) symbols_addresses[n]
> -#endif
> -extern const unsigned int symbols_num_syms;
> -extern const u8 symbols_names[];
> -
> -extern const struct symbol_offset symbols_sorted_offsets[];
> -
> -extern const u8 symbols_token_table[];
> -extern const u16 symbols_token_index[];
> -
> -extern const unsigned int symbols_markers[];
> -
>  /* expand a compressed symbol data into the resulting uncompressed string,
>     given the offset to where the symbol is in the compressed stream */
>  static unsigned int symbols_expand_symbol(unsigned int off, char *result)
> --- a/xen/include/xen/symbols.h
> +++ b/xen/include/xen/symbols.h
> @@ -33,4 +33,22 @@ struct symbol_offset {
>      uint32_t stream; /* .. in the compressed stream.*/
>      uint32_t addr;   /* .. and in the fixed size address array. */
>  };
> +
> +#ifdef SYMBOLS_ORIGIN
> +extern const unsigned int symbols_offsets[];
> +#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
> +#else
> +extern const unsigned long symbols_addresses[];
> +#define symbols_address(n) symbols_addresses[n]
> +#endif
> +extern const unsigned int symbols_num_syms;
> +extern const u8 symbols_names[];
> +
> +extern const struct symbol_offset symbols_sorted_offsets[];
> +
> +extern const u8 symbols_token_table[];
> +extern const u16 symbols_token_index[];
> +
> +extern const unsigned int symbols_markers[];
> +
>  #endif /*_XEN_SYMBOLS_H*/

This change is even less clear to me: The producer is assembly code,
and the consumer already had appropriate declarations. Why would we
want to increase the scope of their visibility?

Jan

