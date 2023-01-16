Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F4966C311
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 16:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478789.742173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQxp-0007oz-4k; Mon, 16 Jan 2023 14:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478789.742173; Mon, 16 Jan 2023 14:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQxp-0007lc-1O; Mon, 16 Jan 2023 14:59:57 +0000
Received: by outflank-mailman (input) for mailman id 478789;
 Mon, 16 Jan 2023 14:59:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHQxn-0007lS-2b
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:59:55 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2081.outbound.protection.outlook.com [40.107.13.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ee330fa-95ae-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 15:59:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9065.eurprd04.prod.outlook.com (2603:10a6:10:2f0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 14:59:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 14:59:51 +0000
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
X-Inumbo-ID: 6ee330fa-95ae-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XeS2MEVUoQsBjna3EtC1wSviOwzm9rNdZGcjglhpWCq/dIfNSiYZ1DqdcAkc0JD/s4Gs09EpH+V/0DK1kP0fVvF68gEsIRINpK/JMRWyqtaiCgSF6xpTa3Ki6ba2YTPPLgRKGOP10IZ/Hpfh0mzSvjVEvg86WphRRdXroJlavV7RhEO5kGf6xT54LGQE0MHDmwiOX5xvdChoU7ncJJmSezxzzTjGyzamSChNZPG+OhTL8U2bKtRCm03C5Pufl+DWlbCK3YRa+6NSinZ8fiy6n1eyvVRjwLQfQisJPEZOp4rzVtyyL/rOY717ydQ0dl8BMoCvLSDiF6e34xP8LoCgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPSNmUR2QtSx1xiyEeUZ7bqFeFb/qlAPR2o2cqkNqPA=;
 b=nKgn6ZPQprZ/EB/m1H/rdz8jJx25ZE+fWHA2MEhG4hoz+dMN+xbVkSpY50ZW+1kwNEDoiV/qvi6L1nOsMrh06drrZIOoU58uJ/16orZK/25OJTRr7+oaWk3fUiBhqFp9lV0QwntUGrdWKMcL83AT6TVb+2/vjbatRVzUUcNK/fu6xg9FtYIotO1raescR44aM31cIVaH18v+FFemeysLDBkB9r/s2z5eKvy1B1QL3oyPQz77xtKb/Yi1GGjjXytfs7DKFCyS/EHHPStn/+Yr3CueqYczJ9lJ4+oCr7Ac/QP6VsX2d8rNwqcGFtTiZfXa+YbLAnkCxqmdXe73XfIXWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPSNmUR2QtSx1xiyEeUZ7bqFeFb/qlAPR2o2cqkNqPA=;
 b=Dr5FUta9Uq+GzkOCFuARLyPwxhxVryC+f7IDeEQorqSuRWohrbonSI+mt+0mpBqRErCCmrZwZAdSjaMNUoU5Zy4QofuIffORlITDzKH5Wb4Ch+ZxyY2kipMIkdFj2Vg7VHNk1a3DKZuNiGdb6Hq3KGlbtFvDjVj+/XMcFgWHiMtoYgwdunDpcF+WxcWYvVm4HsCTK9/N0uJgzcmAQOvzg6CpF7Bndbw2Z8LR9XWPua0QAM58rrDmihM9buUfS6qZ6sQ522TB1tU/qUGpk+xZTaDAZrlyZoK7D6df5Uxk3Av6VEbMpZzSeKR/u8RW7QMszgmYiD3SzdUUEZ0AKdftEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e00512a6-5d32-6dbf-4269-429532f8a852@suse.com>
Date: Mon, 16 Jan 2023 15:59:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/4] xen/riscv: introduce asm/types.h header file
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
 <2ce57f95f8445a4880e0992668a48ffe7c2f9732.1673877778.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2ce57f95f8445a4880e0992668a48ffe7c2f9732.1673877778.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a18a441-7198-48e0-c1e5-08daf7d25174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9PgBeqSQ68748YeuBe0KDWSOSd+T71LbsMKJDGS7NxhrQTVaSdhfNh20DFQWOVg2l6S1MCLwiFzyjp6rMYqR+oIWd27PwntJQWHs9iAGEH3eu1JKa7grVkhWtU0GzW2Z/iSacNsudVo0/vRwfpQz0ZzQirrNJsxOi9/tCSt2agfd4C06T2AyfWi4gfurkiuLDpU1vdnSM1+LQpfeDvqf0JiebN7P4lOEGlFmaxqIOiMF+u2kDEqtGzpmvSeEnfHKV7NclYLl0gfBhWPnmMxX0s1UgXJAcsHhmr+fvDiwPDJU7VcJ58pQmj4XDwBRs5Hn3W9DuhW1rHmcv0it1k1buYNLPiaL8OhkRiwFH9j3o6+vPd57FX8dW2eXPxyiaA9s7EVkCNnhmwc7ZIEBtidiVieejeHvvdy3PkrG+giHt7KLTyNIIondFagAzjTWGRjNCMwuoEXnSAhsgPF5eoFTaesCL0noKVwOrY+65sC80asQiVqZMbYNBIVmNnsnXKlgJLEwO+wU4h357OMV1jpH8GkyQBWbofqEJ96ttzjCAUXQXpoZTnhgSTBXrH068r/UGWqG+myKFllKY+G6E1hi7Rju6VzynBFhkFf27lF4IdAn1se8fmf3MO5uujHSuwGL5hA8tiyl0pAtVKxxeV4dXWMrSPBuz1Vv+yJ2hgYxMGJ57YbSHWKs4r//yu5Tg8aIUDFPW/ZM+K0Z7fiiPf3dETNblNDUwAU2TzGrKnL8AcmyTeDl2O3ZeXEbe/NxU3fEFc+LoQNpcfYF7d485r/MPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199015)(31696002)(86362001)(36756003)(6916009)(6512007)(186003)(4326008)(8676002)(53546011)(26005)(66556008)(66946007)(2616005)(66476007)(41300700001)(6506007)(316002)(54906003)(478600001)(6486002)(38100700002)(2906002)(966005)(83380400001)(5660300002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVhtN25aUUhtOGhydEFwRDFHTkd3UlBFTUlnWGFMeDN3V0R3VmIwQURubXdS?=
 =?utf-8?B?NGhSbnpHSjVmUXF6WXk4dE5tR3dFaWllKzR4bjRCeEcwczhaRXFaclVSU05r?=
 =?utf-8?B?K1NOM0hEcU84U21Pa29ORDhaZ215aDRQeWxrVEZsRVhqcmcrdE56MHBrTVhr?=
 =?utf-8?B?eVRONFpadHRIdENybXE2TnVHMVhLVDR6SjdlN1ZMVE5xSm5ySXRFMzI3MzV1?=
 =?utf-8?B?bWpmOGNxZXpUbWFXamd5Yno1NFRjck5xdTJqb3F2Tm1MMDU2TUVnaTRpYi9x?=
 =?utf-8?B?cmFXZU1SVkpOMm8xYWdvV1hJeUltKzFsNytnWlFteEZFbzFSTWZuM001Q1dj?=
 =?utf-8?B?eXh4cHAxZXE2RDE4VVQvU3VJbzFTS0hTaGY0ZExZUGJ5L3liZVdmR2U5Rmoz?=
 =?utf-8?B?N1dxSHdmWUJtV0ZCSWdxQ3orK1IzbHBvRjUrbDlsTjJ4bmVUMWx1Y09VRTls?=
 =?utf-8?B?a1RoVkV6MlhkVWJnSURDU3VNUTFEMldDY3pxeVZsZS9uSUpwQUswbWNsQ2Uv?=
 =?utf-8?B?Q1F3MHVSQlJuUUphRHdTSWF0R2VscVZTUXl4RWQvb3Vnc01CaDUxVWtEcnR3?=
 =?utf-8?B?VC9XK29GWkhUMHVsdG1lU29jSjV6bUIrUldha2pMK1htZ2VVT0RWcTgxUHdn?=
 =?utf-8?B?SU5FZWpOVXFEVVQvUVJuVHYxZ1k3VWxPSXF0WTFsVW5xQXpIMGt5Q2ZjOTB2?=
 =?utf-8?B?SEZFRVdjS2pHYlZ3cGFvZS9ZSFkwb0dQTTJaU3lkaFNwamNMS1RjaFlEU2tM?=
 =?utf-8?B?MFgxN21HajdnYk9kUG1rUG5BU2puNStsOWZtdEU5ZW1LMis4amFIZEE1bGVI?=
 =?utf-8?B?eTRuM1ZSZVJ6aHBtajFUU1lSNjlUMGN6c0dIZU92aiszS3BqT0JpbjJCTXMw?=
 =?utf-8?B?YTduUDJpcStmNDJrUVRuc2JGM2E3QVEybVNCcjhkbVdxbmhoY3JKdWM2QVlC?=
 =?utf-8?B?d0pCSnFRTG9vNmlIUCtXR1B1Z25kOXNoYit3b0hoU09MNmRCTmkyckYyak9X?=
 =?utf-8?B?UjlFclBGT0x1ZHFNamE3MWJMODJleFdKOU0vN1lGbGJnMml1dkpGZUFZQTFI?=
 =?utf-8?B?M1FrOTFOcHpIRXBxV2tKSU9MckMxeUdYNm4rcnQ4eUhXRVVlUEl4VnlNVDM1?=
 =?utf-8?B?ZHJIWitjdkI4aU5SU1JSK3E4citld3FDa1BKeWh2WkRUb01lK1dQdG5waUhP?=
 =?utf-8?B?eFJRTGZodjNpckFuVkVURnJrM2NnN2orOG8xdFR4dWIzT25oOExiM0NNV290?=
 =?utf-8?B?M1ZXa3BRVlgya1k4ZWk0RDhDTnZBWVRpenIreGZYSTExd2FwVHE2RE9kTUtu?=
 =?utf-8?B?WGxPbUp5UGNlYjNJU0d3SEhySGdGbDQzQm9QeEtRUVpzWHY0cEhYS2YwbmhJ?=
 =?utf-8?B?OVlGK3hFdmFpb01xMUN2bENxVXhUT1dVQkhVL0JaTnV4S2I4QzI2eW5zK3J5?=
 =?utf-8?B?MHBGNGVyYW9aVktzK0FSdHEvUEsxWVZqL0F2RkZZeTJIUG54NFZaTTBJQ2px?=
 =?utf-8?B?VzN0d04wSlRhNWptbG1nNEhEK001WEVzelExZ0lnam80ajJsUDJiaFFZeC9v?=
 =?utf-8?B?N0kzZFZpWHJZK1FoZW9QczlhZTMrSllhZldWejdJTkg1emNPQlVzWDBzNkhL?=
 =?utf-8?B?VFFmUnZoYlcwVTl1OThiTXFBbUVFRDg3d1Rya3hGc2x0V3VHUWNvdVBrM0R2?=
 =?utf-8?B?aWVUeGRERXp5T29Rdi93K1cvajlXMTA2UUgvS0h3QzZQTTRoOFZlOVdkWVpQ?=
 =?utf-8?B?OHJObWVNWEJLZmNvci9hVWpDdlJsY3ZwQzRHNkxuejl4M2tRMnNiWGNXYzA4?=
 =?utf-8?B?Z2x1M1JyOFB5RjVZc0xZU3dsYlRmRlZseVR0aTdFaDZLVEUwRER1QkF1eW0z?=
 =?utf-8?B?S0JNM0YzTE9xV3hNRDdVYkxuWEMwZllNM21BZWdZb2NQSW1BRGRVVml6RTZh?=
 =?utf-8?B?amlCZGRyYnA1RU5nRDhJV2xjRDE0ZWpUVm1Ja2VrV1pKNDVuUVNacHZCbzg3?=
 =?utf-8?B?OHdUOXZaTndRQVZINzZwSkpwbmYxYjhMc251V3Fjd3JuSVMzZUlMYThUZHho?=
 =?utf-8?B?MUxTQTJPSkVrZTE1NUFJWUY5ZU45cCtQamc0V1lCVFY2bXJZOThwTG9mT2lp?=
 =?utf-8?Q?3oPO8D/50kxrbzqW7VpkIAVIR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a18a441-7198-48e0-c1e5-08daf7d25174
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:59:50.9083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMThv80104ip9PcQEfjhQuFWjALsNuBT9UhpeNtCePC4wuQNwBKGv3ExM0q4W9PmfWvExT3Yh5uJiuVD+B+aKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9065

On 16.01.2023 15:39, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>     - Clean up types in <asm/types.h> and remain only necessary.
>       The following types was removed as they are defined in <xen/types.h>:
>       {__|}{u|s}{8|16|32|64}

For one you still typedef u32 and u64. And imo correctly so, until we
get around to move the definition basic types into xen/types.h. Plus
I can't see how things build for you: xen/types.h expects __{u,s}<N>
to be defined in order to then derive {u,}int<N>_t from them.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/types.h
> @@ -0,0 +1,43 @@
> +#ifndef __RISCV_TYPES_H__
> +#define __RISCV_TYPES_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +#if defined(CONFIG_RISCV_32)
> +typedef unsigned long long u64;
> +typedef unsigned int u32;
> +typedef u32 vaddr_t;
> +#define PRIvaddr PRIx32
> +typedef u64 paddr_t;
> +#define INVALID_PADDR (~0ULL)
> +#define PRIpaddr "016llx"
> +typedef u32 register_t;
> +#define PRIregister "x"
> +#elif defined (CONFIG_RISCV_64)
> +typedef unsigned long u64;
> +typedef u64 vaddr_t;
> +#define PRIvaddr PRIx64
> +typedef u64 paddr_t;
> +#define INVALID_PADDR (~0UL)
> +#define PRIpaddr "016lx"
> +typedef u64 register_t;
> +#define PRIregister "lx"
> +#endif

Any chance you could insert blank lines after #if, around #elif, and
before #endif?

> +#if defined(__SIZE_TYPE__)
> +typedef __SIZE_TYPE__ size_t;
> +#else
> +typedef unsigned long size_t;
> +#endif

I'd appreciate if this part was dropped by re-basing on top of my
"include/types: move stddef.h-kind types to common header" [1], to
avoid that (re-based) patch then needing to drop this from here
again. I would have committed this already, if osstest wasn't
completely broken right now.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-01/msg00720.html
(since you would not be able to find a patch of the quoted title,
as in the submission I mistakenly referenced stdlib.h)

