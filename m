Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4787DBC6E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:12:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625181.974193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTwP-000208-AC; Mon, 30 Oct 2023 15:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625181.974193; Mon, 30 Oct 2023 15:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTwP-0001xI-6J; Mon, 30 Oct 2023 15:12:33 +0000
Received: by outflank-mailman (input) for mailman id 625181;
 Mon, 30 Oct 2023 15:12:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxTwO-0001xC-AL
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:12:32 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be317474-7736-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 16:12:30 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB10031.eurprd04.prod.outlook.com (2603:10a6:102:38b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.14; Mon, 30 Oct
 2023 15:12:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 15:12:26 +0000
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
X-Inumbo-ID: be317474-7736-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e60pb/4YCHsd1H+YfLf62ruuwEViKIWb+zZ/r5eAxPYaMEYZMGegLIU+Q++lD3DAuO8AS8CkJGTL4OpSuwtQbFHschqc+tOnvTy/GlxeX0mM2WvA8OLT8S0vEVD5GQWYHmzSZEpitksyGCWb6lyE+K3Gxmro3IIQ+vi6ygEurAH/pnnwLQa6nB4TNbZe7/tvSGT4T323R1xVQizszPHdAwgUUhlhIpvaJqvzUUT3ONqvPsRyX/BBs6TjF9nJU6lhETsxL9meH3itR2kUjAFNVU/0GrATsq6LoubQa5UZSdkoZlpTlASJviVoYXYGbEfFyn/S+tvntfhCFFZyxZzYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDhI7kwHyGfsZpSIdwE1TohnoAzCMk4pDznHLmfZKfc=;
 b=cKjxEhqRh0KtwTYJ8vvqEP7qu8RO4/6cByJX2PG5ORfJij23Ar74KOBXtu2K6DtVyY42Foo4uZWA5peETZIsxkMHqFzUnUTkVvSsmTHGdGEg5dSCCG5Ap22WgO3Va+VyKQh7FHuly12GU4h0Z+w3MkZdR8kBKCRek6jCm48GnopuCtSf1uEbmdFFxvsuYnG7Gpu1fX0wlQg9qMWzLgfq2/vsWgKinnaUGC+FNSMlTQz4A992SWevj5REZ/w6bJFKYdCbnX+KikUjqQws6HZUUVjFHbMw1TL4VwykDNQlVEx/8XSwIyngoSZTBLkeNH9bE1Pg2S/nr2IKRNXKbvlrOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDhI7kwHyGfsZpSIdwE1TohnoAzCMk4pDznHLmfZKfc=;
 b=SqWE1iCEp0LCpxKTZtefCxMv/OZpFUxVTrIGHWtA9lxz102jf8bHO4OBSdvH1PNEDJCDiVjhLAFasuqH/i3TWVebeR6EsIEcp+aXyH0E3bIGuYZJAx166+rY3jGWOnxYEKbHp7JIfZToYHr6Xe4O0esMBZ+qfGrBsnirjX0MvUb8A7J16/0qhD0PP+f4iHOWlIx6YwnnwF4Lryz3Jdjt17NYySW9L/vEXmil0lfnkx8sGYCCgkAiUGLcVia6f77I4zE+//+8nkTx1euuh9zOmAobODF7HLONCHrxP93gOQVgnJCVyGEci5bpcFgL12O/9fFk1Rmygtd0aeyqencacA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20677a35-37ee-d959-78d5-d8f95f443912@suse.com>
Date: Mon, 30 Oct 2023 16:12:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v5 2/8] x86: add deviation for asm-only
 functions
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <cover.1698655374.git.nicola.vetrini@bugseng.com>
 <79091a4e450b522aedfdd903ad671e705a933c49.1698655374.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <79091a4e450b522aedfdd903ad671e705a933c49.1698655374.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB10031:EE_
X-MS-Office365-Filtering-Correlation-Id: 904b5c29-da13-4f4f-1b52-08dbd95aa065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6Fftx2lSSwNJ5jMIDfGMM06JF78zPrmlKFDJ9lux8k53qqjz/x9QHli39YJb5LkpX4QN5RvdJk8bslJwhVfjddwbMY+fSrp4jM+1oDyf1Q4atTrn4smBEnz0pBDQcPJ0sq3hfN1GSBjepXj4Ln6m1Fjiam4ftiiHCfF/kJKLcUy75eblqOD6y5p5P8ev5eFKf/laug0zOq4/K4Km00/vo+Ar4M2oy0nxEYBq6U8b7FvnGLH+0+jTpiJcUx3V7MK//479elQX0OcTx3jEH1Ifv9RCOcDSrFZSE2YjpQn9jgGF2SqJCh2269o5/CsU9G0JHY4oDjTvTeQpXSyGlJ3CXPwHoe5f25wCyYEubJ7lQCeAWaj7ScZ0eXnbfVN2K7yCIhzDYe1SrsEEeYWmnko2vGhFALOLBmdg4d1JwV4wNNQWRk4lVJ/jUuiOjq0hgIb14NPLpdMOvMFMauei0c2nbIhyuW1JMDUhyCooySQTyyYcM34C+f2YM+F/n5Xc1ixhkaeq6prBLQdOw6g5ivkLfrtCY6+c6YYdFYnuYVvt5QiHoeZiFBLW+cERYRt/ypCKOhqbVEUj0jzJO9WFo2Pj5vR1mdAWCHEomh7OuUtly8XxFhLwcywxzrBHjh7AEhwDW3EAwzBfjaLgZVoW0K7e6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(31696002)(38100700002)(86362001)(6486002)(36756003)(478600001)(53546011)(6506007)(6512007)(41300700001)(7416002)(8936002)(4326008)(8676002)(83380400001)(26005)(5660300002)(2616005)(2906002)(66556008)(66946007)(66476007)(6916009)(316002)(54906003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHlrTzV1QStYVE9ocTNseU93UytseEFyU1RibktFUnVWZzI5V2tFRWdHcE9V?=
 =?utf-8?B?OGRpRGJhaEFabXZKYWMvSFc5eHQzc0EyOEFGUU1SNHZJbFB6MUdHeVluYlI4?=
 =?utf-8?B?N0lMU1dqQnB2aGpNVThCNDB2Vm9CV1NpdnNGY2p3YUlUeEc2a0lIZFZlZ3Nx?=
 =?utf-8?B?MUljbUt5Y0xOQmdDcnlCWUg5TWNWVFlya1JLY3cwOHdtdy91MllhTEYxMVZt?=
 =?utf-8?B?dzY2NjZJOU5EY3VxVUkvYjNSMDVPYTYxSWpVa1U4aWdYUTV2anpwSU53Vkp2?=
 =?utf-8?B?bnZEc2pxWWs0dExIclZpN1paRE5kSkFwV3U1WlRaamthVzRHcGFCSHg5Y1U3?=
 =?utf-8?B?WFVpVWxhcGgrWnRuR012TTFmOWIwV0d2QVlRU2E0TFNDNEdlYXFNRUhJUzRM?=
 =?utf-8?B?ckdhQVhOVkdDZ0d3TVFLcllLa281bXFiSTdNM0Q5SmtzRUZsMUlldGNleis3?=
 =?utf-8?B?M0R2Sk1zUm5Ib1FIN2lEbEwvK2o4alFHSnV6Ty9uT3BvaVB6UTkzVnVQL0RD?=
 =?utf-8?B?N0E5WVVqN1AxT2VDcmx5Y3BkK2thNWJLRkZvb0t2MXBJU0hjTk9ld3ZrQXRP?=
 =?utf-8?B?MmtMd0ZqTVAzSmNyRDArVG84clNDZTljczB1QU9KQk05QmxtZ1FWNXREZCtZ?=
 =?utf-8?B?SHFQd0NtU2pmNWF2Y21SOHl0K0d0U1Z3S0FWa0tucHZodWNUTnc1ejJpQmtM?=
 =?utf-8?B?ekJ4S3VKYTNmSGlmc1NsbWRVUjhDSWVzdHE3NWdnQTNxMVpsWHlzbjZlVjlT?=
 =?utf-8?B?WjU1WHBYbTVrMGt0MWxnUFpWbUFtd0FNZi8rZWx5SktZZ0MrWCtUQ0pUTzR2?=
 =?utf-8?B?MWFGeW1ucmhHa2RuamVJSFlPdHArNTJzWEUyNjdrVytUZ0prWTR1ZUExOGhj?=
 =?utf-8?B?TWs3eEhYeWxKcmlZbm5aUWNhVXBEUG9wU0xVYVlpQ0hlMDlrNDBuQUZTTHBU?=
 =?utf-8?B?Qlkxekd5RHFpTThKd1ZFT0lBY2lKcUVIdEMvM3BXQWhMSlBLNmsxZTFFUSs4?=
 =?utf-8?B?U2t1V2k5UUNORWFPUUVUVDRpakxIa0s1M0pJM0t5Z3hLRmRYL2NNNWQ3bXAz?=
 =?utf-8?B?cHhOTlNqK3FodTJDbWVYaHdTaUFUMkxaT09UVHR5RWpSS2xRWXp1S3BtRG5O?=
 =?utf-8?B?OGVJTElpOWd4TzlSTTk0Wm82Z3lDNkNGdnVpL2t2QmlKdlZKNEdkbHpIVmNY?=
 =?utf-8?B?QjJsY3VEVDFheXBEcTJRelRBVEEyZmE3MTR2a1JOZGJVdGV4Q05OeGZuanZX?=
 =?utf-8?B?MDRrelNNaW1jRUdCZC9HeHYySW44elRNSDZBc0ljOUxFTW9ZeVVnUWEyU2N4?=
 =?utf-8?B?Y3FaY1k3aWJ2RCs2eUVITS9IcFBzMDJsU3laczV4MUFiN1FhdjQ2ZnJxeGQv?=
 =?utf-8?B?eS9BaitZcTI3MVIrMlBpb3ZCcjE0UnFVYnJ4VlJhVFFuRkk2Q3prRXg0SDgr?=
 =?utf-8?B?L2MyOFgwOHZFc3hCdlZTV3JrUUJJVTl2REk2c1VCaWw2M3ZuM0FqR2txcWRw?=
 =?utf-8?B?Z3JnbUNrQkI2eUNsSU1wcHI5TE52U2t6RGNqVGhVb1BQeEoyTnR5cHU5a3BD?=
 =?utf-8?B?U0hRR2VYNnJJbmZTdHhKS3E2NlJKOWx3cG05RktSdFdSekJzdDNBaXh3TUVq?=
 =?utf-8?B?TmwxQ0FhRjdEZkRQU1ZBTllyK3B0S2tEbE8wN1piQWlrU2FKMGxrL0JERm50?=
 =?utf-8?B?RWhrKzJRYmZOMlNJQXh6QkRsejlNRjdZYS9IQXFPeURYVmZENGxPdXhQZzZn?=
 =?utf-8?B?TlNOUlRoUTNBWUZTdEVjd0RvTmR2czJxK2lGTnpPKzZsUXEvTVpyeUp0d3JT?=
 =?utf-8?B?alJUbUdZcnZLSHdncVFONHhRSU9BRHBwdGg1eU5xU29qTDdib2ExWlVudHRw?=
 =?utf-8?B?MUtEYmlXcTlyNFl6WVUwdkN5cmhSQWFUVnYvUGF0VkhKUlhRWnBIaGY0bHpH?=
 =?utf-8?B?dUxxN25zZGNJREJVUjEzUUZ4YUpKcHp0WGtUbU52VnZlSjAxdXV6UXBWeFpE?=
 =?utf-8?B?R2Ura3pibEFRRmcvUllrYW9DNTY2TTlEOWlDd1R1N3VSY004UThFc0hEQktV?=
 =?utf-8?B?OThTWHNTYVVHOG1wSERtWjV0UmxXeXdFUllGSktRQk1HSncycUxpcDcvOG1I?=
 =?utf-8?Q?7nBtVcmZY8g6VLl7PCDCF5ZoI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904b5c29-da13-4f4f-1b52-08dbd95aa065
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:12:26.5441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUnc/0sBPZw9f/ew+sQHWEfJzMYWCQ7T/YCQo2pZXqfY9INhikGAgblyySrcekoF8PzHKDy3td9hYZKiB4LsoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10031

On 30.10.2023 10:11, Nicola Vetrini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -163,6 +163,15 @@ Therefore the absence of prior declarations is safe."
>  -config=MC3R1.R8.4,reports+={safe, "first_area(any_loc(file(gcov)))"}
>  -doc_end
>  
> +-doc_begin="Recognize the occurrence of current_stack_pointer as a declaration."
> +-file_tag+={asm_defns, "^xen/arch/x86/include/asm/asm_defns\\.h$"}
> +-config=MC3R1.R8.4,declarations+={safe, "loc(file(asm_defns))&&^current_stack_pointer$"}
> +-doc_end
> +
> +-doc_begin="asmlinkage is a marker to indicate that the function is only used from asm modules."
> +-config=MC3R1.R8.4,declarations+={safe,"loc(text(^.*asmlinkage.*$, -1..0))"}
> +-doc_end

In the longer run asmlinkage will want using for functions used either way
between C and assembly (i.e. C->asm calls as well as asm->C ones). I'd like
to ask that the text please allow for that (e.g. s/from/to interface with/).

> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -123,7 +123,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
>          vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
>  }
>  
> -void svm_intr_assist(void)
> +asmlinkage void svm_intr_assist(void)

Nit (here and below): Attributes, unless impossible for some specific
reason, should always go between type and identifier. Not all our code
is conforming to that, but I think a majority is, and hence you should
be able to find ample examples (taking e.g. __init).

> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -159,6 +159,9 @@
>  # define ASM_FLAG_OUT(yes, no) no
>  #endif
>  
> +/* Mark a function or variable as used only from asm */
> +#define asmlinkage

I appreciate this being an immediately "natural" place, but considering
what we know from Linux I think we ought to allow for arch overrides here
right away. For that I'm afraid compiler.h isn't best; it may still be
okay as long as at least an #ifndef is put around it. Imo, however, this
ought to go into xen/linkage.h, as is being introduced by "common:
assembly entry point type/size annotations". It's somewhat a shame that
this and the rest of that series has missed 4.18 ...

Jan

