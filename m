Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2F7657F1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:43:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571210.894524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP38C-0002KO-PB; Thu, 27 Jul 2023 15:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571210.894524; Thu, 27 Jul 2023 15:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP38C-0002HZ-ML; Thu, 27 Jul 2023 15:42:24 +0000
Received: by outflank-mailman (input) for mailman id 571210;
 Thu, 27 Jul 2023 15:42:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP38B-0002HP-RM
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:42:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2051.outbound.protection.outlook.com [40.107.13.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d7b75d0-2c94-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 17:42:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7336.eurprd04.prod.outlook.com (2603:10a6:10:1a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 15:41:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 15:41:53 +0000
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
X-Inumbo-ID: 2d7b75d0-2c94-11ee-b248-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmJCbmUO6k0Rna10gg2mFfP5zTDx7IvRV+m5j1jiEExIV55dm4GopBy4OZ2kDk3gRujChNYvBIvwbuqY7X8K5ERq5Xl/c3qJWn2js6719PV0JyBKLY326JLRqj2739js3wmwvCZIAmUzaGEW2uARaICmCNxLdB4dANtDns1JB/3oPd1ydh+xF6l9+gWft+2e28pYngi3QYg72Z9zDv3bF1RFJpmHapfVczwrh69tBL+T4P0lcrbZV5wGF6a28dKJd+uLXxtOUN4C/nKyY4mlp17/LeOxPjiTbaj7ComeL3B0haK9XyBVIvhiHOPqc+QXsYNF8lp5E94hVuwtKZrLkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKVdVXlAIMVHz+hMlPBYJGjGrc/dnOs6dpQqQ4ePrA4=;
 b=ftjqTRXi/ough7uYp26fiWFEvaoyD+Xfv2V/Mwl9vjyw45ob1m0BiEfwturWubUIWuVb0n9MX+ryZJpo/ITEzB3cT9GwA5gazZz8hAuGieXGjZJ6uE+VMgQb7nbs+J8HEWvHzYW+LKYgd0PzmGKJDnlrNU6SIYGojV0+e4qyavTQJRWmyWLqxNuNx1ttRhxouwiOKIhN2QYK+QUrU8TiVL1B9EsCc5Apfm+eoj5/20vHD9c61eR4Kpcx2Skp/iVrzHELbIDq4wSzfNczRqY6HiPOd2Kcf6Xa52T65Vifu1sDwJFltrevD4N5ZzFj3oatEyS3XIjYpsSaNg7O/nOIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKVdVXlAIMVHz+hMlPBYJGjGrc/dnOs6dpQqQ4ePrA4=;
 b=e+ajWQtzuU/2GnnRp3MAYUd4/k19ykEmAL7qPu6X8BH6FHLpBXVxqpxb8sm4XGGy5cmEYYC0K1EvBExeyWhMiF/MxVC6xVec471CNiRA7pNZ3PWk1FN3XWEYmPqg9qZdkV3K+Dg32UcJfwgO6olDLwPGW2GX9LPvNzHh5lPmCjlOScNHiV5AamGW99BsvWtW5VlPtG7JdDsIHP9sSnYQzWHXV4+wbIbtRjxvBSln5OXdoliZrceZ0I5eOxSYvUG6YFnGK+a3rxRiOmd/F91sVHtbYy0uz3Jy1gnGQg+q3VO0dhyZ+q9WzzajOgi+t9YGXV2AE/Wf/XwVRd6KLrE0MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fdd04423-f38d-1575-62e7-4d452e396c51@suse.com>
Date: Thu, 27 Jul 2023 17:41:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 4/4] x86: avoid shadowing to address MISRA C:2012 Rule
 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
 <10606d7429239b5a2b7dffcb22eeb1ce5e73e991.1690449587.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <10606d7429239b5a2b7dffcb22eeb1ce5e73e991.1690449587.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0244.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: e1396951-5a1a-4316-57f5-08db8eb7fefb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mKlxzYIE/Mi2gCZ/L8S7xhQ/4qMkMKg7SqZyfM/726l6GD1GWZeAEzHw+4qRrhf2kF+qxIa82PIMcmLet81xUQVRBL1DX4LM6HviRiw2SqqSx6ueKP4HZn48lYJ5PJaL3W7DzQjN+T3xsnoWIeV1RPhiD2Nztvv9OLIrrQm/BD5OC4hAMxUZRdhvfwFnOyVcUUmVWoFdleqorolFa0gdF/+Z8BpCMligMOoGBz2Kb0Cj9DQTTJ25TGWlhvUeWbD/fjUWyhEr9bN6R7gaCO4eKqPJ4v1RlnBuL0Cn9Fv9bzZ6r7HbWWV3H7qcL3OfLHYkct0SJKKeb3f87yIrv5ieGpCaWfwQK5W9iUKvSJGWRyvvwAkJOC2Vw8+lOEWmQQW1EiGFhRc6ro1nHYl/6YsE+un0IxuVotR/0jb6dQVX7RV22oxqTetu3m5FLK5r0UcAS2l9dEqJ0aDI8sZr09P6HA4ik/dDKLwdg90OT0PkDDzFQ87Boa5TYU/V3R2s9+6URyNQn1Kyne9Fh5d0LEeEbcuehaOSgWdq/Vz1it7rjMXMwRmNoeEJJJcpdFS10CLXOwoJ1Dz9ljUFiijb0VzwrmHhhRQ6cUd/2AVUWKSY1arLRTNTuMlJ3gb4fye5HZCx6iRpJ03jfWJUu+25TPFY1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199021)(31686004)(2906002)(86362001)(6486002)(6666004)(38100700002)(36756003)(7416002)(31696002)(2616005)(5660300002)(186003)(41300700001)(8676002)(8936002)(316002)(26005)(6506007)(53546011)(4326008)(66946007)(6916009)(66556008)(478600001)(66476007)(6512007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEdWSEVqMVU4Vkl6M2Q1a3I2dUV0TVZnczR5RDkwSS9zdXdGbnV6bGFRN1ln?=
 =?utf-8?B?dzRYTlB3NzBVM01GTVFGR2ZEQW95TjNzcnJqKzZzamN4Z1RKZVhETzFORERK?=
 =?utf-8?B?ZlNTenNoT0xTU0FBMi9lSzYzZWxzYXpScTdsMjdDUk5JbUIzTHcyTCtsdndK?=
 =?utf-8?B?d3NsaE1aZHp3U090SFUwajAxbkJjTWVtakY2bWJKV0xrQnV0eDJGN3VscnBT?=
 =?utf-8?B?ek4vWFNtTEJkdkliZDV2SExiemtuQWoxK0YySnYvZTZ4UmFMOHp5ZzFKTHkr?=
 =?utf-8?B?Q3hLL0ZjQjFNczdYWERUMk12Vmpsd2NpZk5ZaFZyNHkxWFFCb3QwTXNxWC92?=
 =?utf-8?B?NmQrTkpRWDFOTWJMa2NNVm4rYzZGTktvM2JJcnlaTEZ5SU5LSWFkNjBIN09X?=
 =?utf-8?B?aE9MUFo4TkVNQU4zb2J3aEVvUGdMV1V2UHc5dGtSZHNVUCt4M2NGQldUVUV4?=
 =?utf-8?B?bGdvaTFTZTNEaVJBN1JkZlVMK1RNSy9hWUY3cXpoZGxzZkZMZ2ZYRkZGVWpC?=
 =?utf-8?B?SHBuNmhVZkl0TGxlQ0ZwcExsWkcxMDFuNk9veEtvYmhrS3NsWTgzaFN0ZkhK?=
 =?utf-8?B?U0sxS2V1N2V5dGhaZ0FVM1RERWxZdzlCOXV4L1FlOEFBVmxwWWJNRXcvcGt3?=
 =?utf-8?B?WnJYYXlEMzNGekFJV2krcUQrSVg3bXpyRW5XUi9mZFNrVVovbldjN0hHME03?=
 =?utf-8?B?RDVIamJlcXJuTHhHU0JobnJCcGE1dWNwdG5uQ3RqZTR3b1AxUVFhQXlhdEta?=
 =?utf-8?B?cHVEaUVvcnZMZnYrTVJFTmhkWkpUNHBxNGMvSDlTcVErSzNSdk1JVmxyTGxr?=
 =?utf-8?B?MXN2TVZIWWdvRVkyWlM4Z1MzdkF6WGd3aGdPRnNHUjh3Vyt1RTNlN0VCM0JR?=
 =?utf-8?B?UVlZdnVaRHpOMW0yYVllaXBMUmpvMVUxaFBmMVA2RWFXYWd5c1l0YkEwNU52?=
 =?utf-8?B?WEN4MGg2SWVEVnluNjIvM2JndVpUL2tlclFCRnhKdjZBVWY2SHI5MmgrMlRG?=
 =?utf-8?B?cHhJbm9vVFd3VEVIVVlVRjVDNks2ZnY5WUVrNUUxNnhEK0VLZmwwK25kMkFJ?=
 =?utf-8?B?MFBoMUgweEFtZlljZ3FQbVB3bHYvNURlMUVjQU1zL1Z3VUVNS0hVZmFQV3lX?=
 =?utf-8?B?ZmlqdEhZNHFrRVZlYm8vWGhpbjNyWC9CeVRjOFkzRlFPWnZNWko0SHBDazl2?=
 =?utf-8?B?QWRKSDhlclN4L1UzdDMyYU02MlJ0NlM0T3RjTG95K1IxaHlZck1rWFI1eG5W?=
 =?utf-8?B?WTgrejRZb2NYd3VlbElXL2tHNUpNVXRldXZ6cHpBL0QyMFFyK0E3RFlpMGVH?=
 =?utf-8?B?R3hPUm5WakoyTi9PTFRrandiRURTRi8rY0FQd29jWFRZb0dOSVZzSjVmcWxV?=
 =?utf-8?B?aHNLZDVMZ1lFeVF0NlFvYk1xQnlOeDhkSG5COFhqYVlTUmx0aWIvNmYxRDlR?=
 =?utf-8?B?V0JQWVp5R3ZlRFZhalZ5V053aG10VlNpWFFoNmhXUTJqWWhUMTg5QVAyY1pR?=
 =?utf-8?B?K0JsTHFucHNlWk9vYklzVnJDaFZvbU1VT2p5bGpEZEV1UFZFdlBKdEI1Mnph?=
 =?utf-8?B?MzBvdG5NeTNjYUJvVVczZ0ZaeGo5bWVVRjFndW9LUkdXVTRmcGxSV0tFa203?=
 =?utf-8?B?L0RnL3BicHZwbExNd0wxazVDSnFSTEpxRUNZaTdYcVRkdGwzR1VTSDgya0Mv?=
 =?utf-8?B?TWFNem5GbitEaVFObnNmZG9EYS9QUkxhdUZPc3J4dkFLODBWMUVGM01VR1Ur?=
 =?utf-8?B?dmVSTENlSk9hTkR3bzZKR0ZHcGhBUVpid2w5a2xKQnZTTHJ4TmJWNzBGR2pw?=
 =?utf-8?B?OHl6Szl2MkVXSDNPc0ZxTmpoS3F0MDU4WmVyeHgzWEZtNFh5QTc1MzVXOS83?=
 =?utf-8?B?SzNwUEZpY2o1RklvMjQxallhRGxMK2NXL29XZGJpTkNNM2xLUWlTS1VVUUsz?=
 =?utf-8?B?cmo0NmJyTkdTLzhSdE01QkdpcldCVUNpS1l2aDZxbnZ3L1ZhOUtPL0lBOU9E?=
 =?utf-8?B?Mytqbk1FTnh5TmtwWWRhd21ybCs3Uk1TMGNybm9ta0xTc3FHdjA4bGF5Y1dx?=
 =?utf-8?B?aGJIaFVRZTdjdmQzR014NVJ4ajFJMytMN25wcUEwc2FibDJ5ellNTmpiTm8v?=
 =?utf-8?Q?VsRA9CATYaZw4e0iM0WXQxyGW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1396951-5a1a-4316-57f5-08db8eb7fefb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 15:41:53.1672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPcuQX4IXWktcy128fTpoRXZYqAwGocq/4DqCp4tRUWP/cOvMqabxL+MmMzM9SpvmpDYf9o7pRW9lqFKqk32YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7336

On 27.07.2023 12:48, Nicola Vetrini wrote:
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -1483,7 +1483,7 @@ x86_emulate(
>      {
>          enum x86_segment seg;
>          struct segment_register cs, sreg;
> -        struct cpuid_leaf cpuid_leaf;
> +        struct cpuid_leaf res;

This is too generic a name for a variable with a scope of several
thousand lines. Perhaps just "leaf"?

> @@ -8408,8 +8408,6 @@ x86_emulate(
>          generate_exception(X86_EXC_MF);
>      if ( stub_exn.info.fields.trapnr == X86_EXC_XM )
>      {
> -        unsigned long cr4;
> -
>          if ( !ops->read_cr || ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
>              cr4 = X86_CR4_OSXMMEXCPT;
>          generate_exception(cr4 & X86_CR4_OSXMMEXCPT ? X86_EXC_XM : X86_EXC_UD);

This change looks okay to me, but I'd like to strongly encourage
you to split both changes. They're of different nature, and for
the latter it may even be worthwhile pointing out when exactly
this duplication of variables was introduced (it clearly would
better have been avoided).

Jan

