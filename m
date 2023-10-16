Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A557CACB1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617703.960568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsP2y-0004Wf-EZ; Mon, 16 Oct 2023 14:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617703.960568; Mon, 16 Oct 2023 14:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsP2y-0004Ua-BE; Mon, 16 Oct 2023 14:58:20 +0000
Received: by outflank-mailman (input) for mailman id 617703;
 Mon, 16 Oct 2023 14:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsP2x-0004US-FA
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:58:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70cc6e0e-6c34-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 16:58:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7403.eurprd04.prod.outlook.com (2603:10a6:102:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 14:58:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:58:15 +0000
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
X-Inumbo-ID: 70cc6e0e-6c34-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv1dMZh8OAGthC/Hjaw3NXO3bxaeGV/aoVU2cIpS1pmyvLZ14ndGUK43wdh+OvGacxOPoA0bvgZG3ZAknbdPLuZiYz4uppCVCb4roNKMOYGa1w0+bRbRlpD6E01+19gf6jXIBDfipdDhPaO4jCI+RDx4eSK4DoESwF9MDGo7dCcuipObhFfhhFmakBFz/IfRxi8b3sp9JvmluzLH6NcVfn5c8UVooIlPVtVp5kZ6DQRYFEwZb59NHwZvHi3irsEgUtc8KzGx5uB7v80OWA9D4+l66p8D/kCu3gjSJQ/DxeZ0vflTQw0xH71gjGqWoUYq9+xLKXp1mamjiug/dOWjwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eM7keAu2fc1cCD9Ixxhsz+zh3NWnS7hgkywVO2kXss=;
 b=SEeb0iyAf9ySlvg+XV2503jnNczKpCawf5zU5iDzI0uVosxn3W6UVlh+Ao0wSWV/9dNrqivPqGS4uPm/QXYPh1y0redNPP70c9n/1kCrrVJyALdSlWOVNC4X6xyPibBx6SbpH0LCMpDRCyrWle5rQNFUhxbhyzL+q+M9Aoa6PEePvCNoUODg2OlxKig6dLd4MwSBCcSfzfdAgTatpo6fKl53oA+FmIBWVCQ9DHJDLjvnWieiZIN7VLoJdrcIdNKlCUKwsL5rDHnN5Mjb5elVP0PCUdaNIYEXB0//mRBnl23BbLYPT6pdwNfH+/xNxUEc8uZjhDMin02pKsjzfMouow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eM7keAu2fc1cCD9Ixxhsz+zh3NWnS7hgkywVO2kXss=;
 b=I8J8v1orHfLyh+jsSEipTNrar+b3BFr6Hz/ZloRvt4KfgoxMP3HHZ5GiYPIQUl8WZck1C07OktHIKHXGfWvDapEC21S6aBoCANuaj796GAZOc07zgDYa9Yft6GdDu+XWk9ymHuD9d42i5HSv/nJb/BPZhEgh2mMBQLANid6PL5hOWZfAVF06FRT/6oKgaDEoF+nH1W9G2v27+Gs1q7dUecOoCwtNzKHJ6dicG0qlFIWevt/Y/lJySIwFyzAhcAsgsvuI7n6B9ZT5DL+Jt0VrmNl/bJJ7MffCjTpyTC1I0Rd9ywcyf3xIlkx29y52a9I9SYd++GilUAAbZWnEaA6jeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <afbb7307-50e0-047a-807a-1bcf0139f5d3@suse.com>
Date: Mon, 16 Oct 2023 16:58:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 2/7] x86: add deviations for variables only used in
 asm code
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <5131b75996d0b91d4a98466f11dd927be910d7e5.1696833629.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5131b75996d0b91d4a98466f11dd927be910d7e5.1696833629.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: ec56f761-ed2f-4242-bbfd-08dbce585399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wd+8FAjHv0AACbXwL4Si5b4QXlQOaF4Hh/tnadMqeYtHkLwz/wmpRN5Hd3XWpbBlA/sJL+VyIVpFMOFXWYBcFYK6rnxafVCBNHQL9w3xkPQsMtTwpDfiPfMzl/I9iu25qKsSZo46TMPfycQaiXOv4+B6JbD2dgWISBxUmWNC4+XAMuOvFvjUmIFM/jCtLoshiXl7a0TJuSt4EJBld1nfbTK4TLa2wC6rDJR2Y4wR6vZs44Z7xArbQbUBha8MsTqEjhB0VMXTzO5inyGL3qGHhWSsUpnQEPiOnDaLkKjGMg8j4GivU/wRYGP9HaXAmdgNTmYzYk+lTnNz6QwgA3RtFYJP795HL0zV1WvQyNsVwEgz+JzTF1e3vxFTlDGZB3pybqfHaQYkbbTgqZsYQXev+lPpkzrIPEo7Yk4yvMLveCFdlXEiE7Ip7fCZQu7p5faHWL4VtJibrKRKv6zUGrrLDSrOS1vnj0rSmf4IIVFGXrtbbBlv/JF35IetGBkmh3bdA4R0Bjcm85QMZNed//574hCdwXp9SnrNA20qdFCR/WtwNDgWvFNeZKf5dQkwoQqlAKnkqSwQLpQZkuI0XfvyoHo79vFwlymzKFbzn9Ihn0PtCZg+ismU73BU9e9k6y1nfeFH0fRZ3CRpyiPsrFFSiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(26005)(2616005)(8676002)(8936002)(4326008)(5660300002)(38100700002)(31686004)(41300700001)(478600001)(31696002)(86362001)(6486002)(7416002)(2906002)(316002)(6506007)(6512007)(53546011)(66946007)(36756003)(66556008)(66476007)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N01ONGJHaEcwT2NOZDRXNHFBK0EzSUZtQzdvSkJ2UHR2L1ExcXNoYXNrR2VD?=
 =?utf-8?B?OURKaXBjYys2V29WM0xOc2NmOXFxRWNUVllyK1p5WGtCZ01HQzhYU0FUK0Rn?=
 =?utf-8?B?RGhRL2xWZHYzWXNLaWNwSW1rMWc5YkF6a0xtVGJYWmZXcUxuQnV4RmVvOEo0?=
 =?utf-8?B?ckNpQVF6clVXTGQrV1dOVDhoSVdWZTBEMXJLSGJnbUxPU3JhdTZCSldmUVY1?=
 =?utf-8?B?RVhwOFJoTEZXOHN0TmNobzM3bTNFNXVrN2xEUmZqdy9uZmtmc2RsYS9NcnI4?=
 =?utf-8?B?a3RJZHBNdFpSUFdIZ1FCZmNGeklFdkkrRkhkZ0o2Qys0N29QVGRTOURSS29E?=
 =?utf-8?B?WGxCcmYyOTZGMVlmemRhRHN6OUdLSC94Q3cxK3RGUVo2ZGtHaVVjM0p6YWVC?=
 =?utf-8?B?dm9NVkZqWFJHRURNVFU3K2xqUGU1R2ZsZTdsZWNVd3h1RmVvSWp3bHFNTTc1?=
 =?utf-8?B?Z3BIUVBwNkJWWlg2UmFxSEpBZlJ4b3ljcmY2aTJPNksrZU5ZcHZXZXZ2ME1D?=
 =?utf-8?B?MlBQVk1xZURzMlk0Nm9NOXNmMnRTdVhxTytLSnBsMnNBWkM1WUw2VFZua2pT?=
 =?utf-8?B?aFZnRHo1UjRtOEZ4TUZtMHBHalZMWnNQOGpwVmI0RW1CNDdzaFZsdFI4Q3F4?=
 =?utf-8?B?OTFnQVlZRzArc3psdUtPcmtOVkhTaFU1ZTFJM2dIUVNBK3RIQ1djRlRNczFO?=
 =?utf-8?B?Z2c1ZHBVWExrREgzZlhrdWFxZ3llTGZEREdKWDI3NGV5LytNNVV1RUhXWXpE?=
 =?utf-8?B?dkJpU0c2Tk5Kc21IU1RxbnVMK2dMa20zMDRZc1BsQkhudG4zSFF6cStWZlpi?=
 =?utf-8?B?VUtIUmVTa29STldZdThQTjFIZEhoUnZ1SjREaGRUdGs0OEE1R0ltTTA2bTdr?=
 =?utf-8?B?c3JzKzYxYjlianNwN0xkZmhhVjJmLzZhb3VXUXV1RU56SFJCRTBUWk0rNkUv?=
 =?utf-8?B?UjlxU212MmprZTg4S0JwdGJLMEFDWVZPd0tJeHVhMnRmWEZFcGZhaWZpMUdk?=
 =?utf-8?B?MUVpVVF6MEhTUU9HWlhNeWlkYnFucXhhaVhBaDNVb0JXT1lqVVdGVEpSUzFx?=
 =?utf-8?B?aG94ZEFLekdrOTZwMlowOFUzUmNGMkttK3BMUHdmaVlZNVlxdnRpVUFrL3o1?=
 =?utf-8?B?N0ZSVHE4bnM5RFFMQmtIUUJaaG8vS01aNTZ6MFFMbnRESGs2R09PdnZJOTJM?=
 =?utf-8?B?VlpNMENTSGlJcFpNU3BNZytMdW82SlJTeVFKTVdlTGIzdWx1Uy9ocHJjVlB0?=
 =?utf-8?B?TExmZ05tZDNSdHRSNnVpMmV3MTdDYUlzaGt4OENJSzIwaWZUTjY0Q0k3dzFO?=
 =?utf-8?B?ZFdzZkZ0cnc1dGwvbkJIRHBaZWhsczUvRTVkbnBiM2FQc2twSEN2aTdIQnMy?=
 =?utf-8?B?MElRNGIzV0ZweUxIRDdJYktBRnVGeUVra09jZlE2NW9KbEtqSUdqVDNLRWxv?=
 =?utf-8?B?b0dvcW45U2N4NUsyODlDZXVkMENBRXVvby9nNFJmVlNBTnB6RmpFRDRvaEJx?=
 =?utf-8?B?Yy9QclJRY0FGT3NVRDVpalZYaVhxQ2RuNUF2eE0rYTEvVzc3RUNWTjJ5ZmhL?=
 =?utf-8?B?dXYzWklOVWxqd1JTV3lsUHlOSTdUTjlkaEMyL09jeit1TEZlblFJSGhiM2Fz?=
 =?utf-8?B?M1VrdlZrR2RPZXZCYldnL1pnaGV2TVdvTUJlRFBQeU5VVU5UcXNxVmVjVDdY?=
 =?utf-8?B?K3k3Vy9JbEdYS1ZWYkFkVmx6RTZIUnVQaTExSGFBT3FLZFJwZTBTcXgwUHZV?=
 =?utf-8?B?aWwwc1VaVVJQSkhWQTh0WVRHaFV1Sm81bEZiSnZTRzB4cFZtSmp1bFdNOE1i?=
 =?utf-8?B?WFhTR09DNUxldC9yb0N5dGNvZDFreFQvdGZHN1BzZ3hBMDc4M0I5ZVU2bUFl?=
 =?utf-8?B?bk96cW9kSTU2SGNEekpMMmVxN01iNWdvMU9pMktwV1d3VzhHRktUYU5LVWY3?=
 =?utf-8?B?ZzU1SVd4NmFUWE40TmpvZWhVcEN5L2FEM0ZCelhCSlArMldoQlM1TGFwNDZ4?=
 =?utf-8?B?K2NLLzVjTENibnpzL24wTzlpaDc1TVYwczlGZEl0VnRXdlhObGlucldtMlRs?=
 =?utf-8?B?WEdnQmVQNkYwVkQ3Vkc1QXZka1lYL1pZSU1TaDNwNE5ITXJSSHRFN1JKbGxH?=
 =?utf-8?Q?c9V6NU4B0TZCqWGk4rqiXTcFK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec56f761-ed2f-4242-bbfd-08dbce585399
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:58:15.9322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfuLyIUFvg7ylyZ0fzUSuG7mgzINkbGEvlNWPhAsURQRlu4ZE0nRyVM76cQ886u8EgnxGhM5NUCOPQNCqyoVuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7403

On 09.10.2023 08:54, Nicola Vetrini wrote:
> These variables are only used by asm code, and therefore
> the lack of a declaration is justified by the corresponding
> deviation comment.

Hmm, you say "declaration" here, but according to my understanding ...

> --- a/xen/arch/x86/include/asm/asm_defns.h
> +++ b/xen/arch/x86/include/asm/asm_defns.h
> @@ -31,6 +31,7 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
>   * gets set up by the containing function.
>   */
>  #ifdef CONFIG_FRAME_POINTER
> +/* SAF-1-safe */
>  register unsigned long current_stack_pointer asm("rsp");

... this is a declaration, not a definition.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -153,6 +153,7 @@ char __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
>  void *stack_start = cpu0_stack + STACK_SIZE - sizeof(struct cpu_info);
> 
>  /* Used by the boot asm to stash the relocated multiboot info pointer. */
> +/* SAF-1-safe */
>  unsigned int __initdata multiboot_ptr;

Imo such comments want folding; question is whether the tooling can
cope.

Jan

