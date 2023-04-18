Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAAE6E5F42
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 13:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522750.812316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poj53-00023D-Ac; Tue, 18 Apr 2023 11:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522750.812316; Tue, 18 Apr 2023 11:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poj53-00021U-6X; Tue, 18 Apr 2023 11:01:01 +0000
Received: by outflank-mailman (input) for mailman id 522750;
 Tue, 18 Apr 2023 11:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poj52-00021O-E3
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 11:01:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bd2ea87-ddd8-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 13:00:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7579.eurprd04.prod.outlook.com (2603:10a6:10:1f5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 11:00:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 11:00:55 +0000
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
X-Inumbo-ID: 4bd2ea87-ddd8-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQ1hdErq02bTMuNr9PgcQpjgXCs8Q3nari+AUnhuqGIuT3mKfw03TEv8ijQcgsidQ3vSJt+DXwmLkprxjOKQYh7F5vtjgj/hVzHHCqn6IzatwXjKhd5riS23xr6IHxtPF3KgPQwQlJ/NgmJCFyA9VUxWro5zj5QcNIUiuoCpJil5t0dinLymFJRxu4JSJikuqU5QAeapCGMCxs/iUWUMXa5gtgKfhZfikOMzq11qFdSArpo+k7nHZ+hqD5OlV5q68h/8JSQmQ1PEaqrBx8KTv6TwC/66rA5ITVOFDTJc483sdb4Yb+uch1BpJItU9CwDyfK+YLSSQSV+Dj7xILlkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxqjZLsNezemjLz+25hUXJFTrQVDJmaCzOrj+NGIoz8=;
 b=C2Luj0B/7D0G4IM7GMSWtk+Oorf4dUq8nsI+sh9Xg9+kBkgM66OYZ7dn9IAzEYoBg7koArcL/tNqMAjM6eBImRdsN63fhLHV+Ii/aCtkTTeksdZGeP421/+0ihqdFZFjEFvgxwvwykrvnf/BixuOz0La9qkyyyjceWx88HqPyOrII0OWdoKiAIPsd9648oavVyV6XTHhtdeXyBUAmmiZW5R74tjgRYkVv4QArOV38Xlx60hSrD4kMiLdMgV1DQ3ifyfI2Jos//6danTLHSdQnijQPaCFE0T3lCJNDj4uFKjtztAEGjTNM8VF89Uk9Xo8s9kj7Y51+X5xWsScf3w+Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxqjZLsNezemjLz+25hUXJFTrQVDJmaCzOrj+NGIoz8=;
 b=RB/GlQ+1DOm8/cYpVQ2R0KTDjyEaqExQiA+rhYbm6A0g2nEyj7+ZA8wnhKqZV6LzoNTQUVzsGNEwSpZJurg7eLfySjtNCw4fSxYZLIQTA+TN6jHQDi2i2UVpCdebCRxDErXfEjW3rNoU6HHzsU0jxSfphVcGB2c7trtFibb2E6zbWNEtQ7reYOMA2Z4H9ZMD+7t29pXf7JQn5B62L8JpmxmRS+6NsppKm26a1Vu/sElVwXzi6VLUpzqfw45dQgmsU4oz11EuVbTuzALz/kB3pnbsguHmDbnq4/GcaT3P0K4udGtUw3GErB87f4z5wLo4YfOjmmdh1BqHytfXoij4XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab604666-e9a4-3656-73a6-c09b2ae9d3bd@suse.com>
Date: Tue, 18 Apr 2023 13:00:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/livepatch: enable livepatching assembly source files
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230418092458.15253-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230418092458.15253-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 22754d08-323a-440f-b2f6-08db3ffc2ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZRGq0bsVCE84FTR33S/QKUD33/XoXStk63j3VsCbF8MML659z6kumSmdt0LPgFeZbdeuDkW6Ssw2kWmMBRW79yujjscdOf0REhWedk6dMcAKQF4BifD1vKHZErugej63Iaoe7mPacUeQh4TgzeCcCJ+UikmKN3TrR5v5BaJsi8scgo3nxwAb8kU+GYj7p2C+nIUxCk/QppqKOJSp0TGdqu2CMoJbrQtABnsMESBf35Y/eYu6OR7FFjyfcrtI4Dh52gJpLzEmR6q2RIn8UUORZHa7ygrSLffvyViwku1dtpvMRZcQXeBy4wIHEA8L/pLD68CiMXKIBo3mFxKolY5Wh8q8raQ6Lus3tUga+FdQbQzbHJT8Z6taYbc1QAgygQmoMqzeighpEg0fXYFE7LVQSUIoygr60OhPPtE0O99gu73vUPwU8w5n+MZfUVoN+f3BRn3e+yZQrh0htVGomLQqgoIpo0ha2HyS2acmRZCiVCEEoBvVQPEqLy4mSykd376J6jzsmE2m/l6LVj3VaEjT/UatkO1PuQh/olhNRIXYQivgLuid8ET/MeqVhhzXPDQxGFSHfFtcGhHQF6m3tN2Lu39tLRyUBFf3v3Z+QhWvR4KValSD/ejHQu9wevoq9xuzyufwGscq3n+qQfDmNSfdaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(36756003)(38100700002)(8936002)(8676002)(5660300002)(2906002)(86362001)(31696002)(478600001)(6486002)(54906003)(31686004)(186003)(2616005)(6512007)(66946007)(53546011)(6506007)(66476007)(26005)(41300700001)(316002)(83380400001)(6916009)(4326008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alZ4RCtiKzhOVXNWME42NjI4SlZTd3NzQnV0SStsWStqZEQyVW5zczlPU3o0?=
 =?utf-8?B?K2txblhyNW1uQVo1MkR4eXF3L3cwTHBCdGU0VnFuTnZ3MjVkZTd2WnUrRWk3?=
 =?utf-8?B?K0t4VHdmV251Sm5iSnR4dW9wT1RFbVVOc1lvSUhPOFhscjQraDJkRTdGbkdD?=
 =?utf-8?B?cForSDJkakFaYmcyZTVMR1Z1K1duZTRheHpadTF6VnRYZFBoNUc3bWNSYkxX?=
 =?utf-8?B?bEVKa2JRRnFmeVhDMk4vbE5oZml0cEFPUEpJNktESTNSWWdjNUxVZTNmamhj?=
 =?utf-8?B?NWVac3RHSkhCQkJJMDRyaGZGOE1nSzBZRC96MzBzSG5uN05reHMxSEE2Z0s3?=
 =?utf-8?B?SVRObkJsT0hNdytrZWh6NWJkSExTYnZkeG50Y1lucHJ5QWVBd2N3dW85cWto?=
 =?utf-8?B?VlV3T3l6TzFZcVY4UzJKaGFBTzNkNkdlUmVyKyszcklDZVlOM0FWWHJ3SlZm?=
 =?utf-8?B?aHlaNmU3cnpxbWdGaVE1V3RxWVhlQXU3T2RrN2VYdVZLekVhQ1liZ1FNUGRX?=
 =?utf-8?B?cnRpMmNqazBNRWxkcEZtQkRma3VNajgvVWtsVzlxODBmTzFFWHhtUSsyWXJS?=
 =?utf-8?B?K3F1V2ZnRHdKT2pMMDgrMS9TVStTWWxpcU9hL1hGWmVCemtUL1I2bkFFdHlm?=
 =?utf-8?B?bnZMN1BFc2V3SE4xZndhcGV3MWFvRkQ4OVVBSk40NjcxV0lsbXI2cHBlSjR4?=
 =?utf-8?B?VVhYQUdMYjhDMWxlUDFFdUoxVGxsVk1KT0RsSzIwR1c4YjJDSkhOQjhxUTBD?=
 =?utf-8?B?eUpHeHRPZU5lckNvZ0lETGhETjF4bjE4NlRXWSsyZ1dkZGp6M2IyYUlZQll6?=
 =?utf-8?B?YkhxSHVxZ3NCRDBEOFEzVmF2Um5OemZzOTlqcXYzQXhXbXp3OWZ0TFFLUXR4?=
 =?utf-8?B?SUVUYjF4aFVVeGxkeHdkRnNTektjaUFIWE01NHpqTlljRVR6Z1hRYWhBanpv?=
 =?utf-8?B?U0drR2dXdUVTRzUwQW02M21ZUWVJYVJ0SEpSRGhOaUFjaGovZ3doNisrdkJm?=
 =?utf-8?B?eUNkdmtPY0V1NThlUlFmZFNsbmNrY1hwL2pEQXN5b0dmT29VSzB4MFkzaW0w?=
 =?utf-8?B?aWxVUkZJczd2YytBQm1PYW11bHZFWTk2Z3o5NFZsSldwVGM5NjZ5UEZ6cXFv?=
 =?utf-8?B?SjM0UHZYYzg1Zm5YYXhDYjM3V2tyYjhhWHlDT0dSWnhBMFdJWFQraHI5K3Q2?=
 =?utf-8?B?MlRxSGRsWDEzYkFhRDM5ZDU4dDRmSVVST0hvL0o1Q1hGYVhIUUlXSHlvK21B?=
 =?utf-8?B?QTE4MGxPaEVJUkNNNWJSOGRtb1FJMTZEYXEvc3FWeHcwTHROZEsyOHlqaldN?=
 =?utf-8?B?aWU4MVJZRStwSFdiL0M2SDdVU2Jpd2dJOUFOamkvM2FUSzdhbFQ3a3lPN296?=
 =?utf-8?B?Sis2VWtFa2RTRDNWR01VRlJob2pORGt0UCtqOWRyZ3pzRnlmeWtDTlpHZTlO?=
 =?utf-8?B?MllPcnhPYUNNWGo4dmRBbXZ2K1NQV2p5UWk3YzYyTVlPbGNhblFUNXpEcldR?=
 =?utf-8?B?SzF5OGZXczg4WEo2eEVwYUJXWmFYVjFOa1JaZVN5dy94aGM4Wk5JTjhPbUxS?=
 =?utf-8?B?SXpLT2d3VjRndjdMZTFnVDRkcGVNSFphcExBVHRPMEI0U3QyM1k5VTdQSG0w?=
 =?utf-8?B?L0pJZTlKbEVqMHhNM2Y4dGJJbkRzMlRnaUhUTVUxZk4wT3NmTEh1bU9oTHFB?=
 =?utf-8?B?Tjg5TW95UFZTKzIwVitGb0JVTnltS1FydFpXWlA4N1NQc3JobFdObEFpRnYz?=
 =?utf-8?B?d0dReWk2YlN4dFcxZXR6emxTMHdnL2lyZThDanhOeEtUWVl4SWU4N09GWjh2?=
 =?utf-8?B?REtaSzhidDlBN2FHQThjQnBYbzBXL3R2UUVuZjJXZ2tmay9PNC9CYjdsTXh1?=
 =?utf-8?B?UVBqb1hYVDhoWG5VZGZTSjl0L2dFRGdXTjNRUUdTdnhkb254Z1M0d2VSb3BR?=
 =?utf-8?B?RHJLZWNjaUtKYXJEdC9LcVVrOS9qUUg2WHdwWjNlcW1TMjRPL2tyYmFJdkha?=
 =?utf-8?B?ZHFPN3g2ZnRaaTFhdUljNDRpWlByRWNMekRZZVluWjRDck42bkFWeFc5WHlu?=
 =?utf-8?B?Q3kzeklML3J6TWdSRXE1a0Z5SkUrMjUvQURMM1NFRk9QcFpUenZEc0taT3hF?=
 =?utf-8?Q?0GXCUYVGC230E6nbCeV70hGrQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22754d08-323a-440f-b2f6-08db3ffc2ec8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 11:00:55.4262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPMMnkPQRyqhxWIKlTJwWodUK2/mPJ49f7pkezNSAcMzBblo2mXmvl80TetiGLvkvYIc8FUtYkIV0GY3tyfQjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7579

On 18.04.2023 11:24, Roger Pau Monne wrote:
> Some of the assembly entry points cannot be safely patched until it's
> safe to use jmp, as livepatch can replace a whole block with a jmp to
> a new address, and that won't be safe until speculative mitigations
> have been applied.

Isn't the issue only with indirect JMP, whereas livepatch uses only
direct ones?

> --- a/xen/arch/x86/include/asm/config.h
> +++ b/xen/arch/x86/include/asm/config.h
> @@ -44,6 +44,20 @@
>  /* Linkage for x86 */
>  #ifdef __ASSEMBLY__
>  #define ALIGN .align 16,0x90
> +#ifdef CONFIG_LIVEPATCH
> +#define START_LP(name)                          \
> +  jmp name;                                     \
> +  .pushsection .text.name, "ax", @progbits;     \

In how far is livepatch susceptible to two .text.* sections of the same
name? This can result here and perhaps also for static C functions.

> +  name:
> +#define END_LP(name)                            \
> +  .size name, . - name;                         \
> +  .type name, @function;                        \
> +  .popsection
> +#else
> +#define START_LP(name)                          \
> +  name:
> +#define END_LP(name)
> +#endif
>  #define ENTRY(name)                             \
>    .globl name;                                  \
>    ALIGN;                                        \

Do these really need to go into config.h, instead of e.g. asm_defns.h?
I'd prefer if stuff like this was moved out of here, rather than more
things accumulating. (Perhaps these also would better be assembler
macros, in which case asm-defns.h might be the place to put them, but I
guess that's fairly much a matter of taste.)

Couldn't END_LP() set type and size unconditionally? (But see also
below.)

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -660,7 +660,7 @@ ENTRY(early_page_fault)
>  
>          ALIGN
>  /* No special register assumptions. */
> -restore_all_xen:
> +START_LP(restore_all_xen)
>          /*
>           * Check whether we need to switch to the per-CPU page tables, in
>           * case we return to late PV exit code (from an NMI or #MC).
> @@ -677,6 +677,7 @@ UNLIKELY_END(exit_cr3)
>  
>          RESTORE_ALL adj=8
>          iretq
> +END_LP(restore_all_xen)

While I'm fine with this conversion, ...

>  ENTRY(common_interrupt)
>          ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
> @@ -687,6 +688,7 @@ ENTRY(common_interrupt)
>          SPEC_CTRL_ENTRY_FROM_INTR /* Req: %rsp=regs, %r14=end, %rdx=0, Clob: acd */
>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
>  
> +START_LP(common_interrupt_lp)
>          mov   STACK_CPUINFO_FIELD(xen_cr3)(%r14), %rcx
>          mov   STACK_CPUINFO_FIELD(use_pv_cr3)(%r14), %bl
>          mov   %rcx, %r15
> @@ -707,6 +709,7 @@ ENTRY(common_interrupt)
>          mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
>          mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
>          jmp ret_from_intr
> +END_LP(common_interrupt_lp)

... this one's odd, as it doesn't cover the entire "function". How would
you envision we sensibly add ELF metadata also for common_interrupt?

Jan

