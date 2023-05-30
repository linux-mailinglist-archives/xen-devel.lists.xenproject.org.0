Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8790171686B
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 18:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541258.843823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41m0-00017E-9V; Tue, 30 May 2023 16:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541258.843823; Tue, 30 May 2023 16:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41m0-00014F-5G; Tue, 30 May 2023 16:00:36 +0000
Received: by outflank-mailman (input) for mailman id 541258;
 Tue, 30 May 2023 16:00:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q41ly-000149-N6
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 16:00:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b7c0ad5-ff03-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 18:00:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7254.eurprd04.prod.outlook.com (2603:10a6:10:1a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 16:00:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 16:00:30 +0000
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
X-Inumbo-ID: 1b7c0ad5-ff03-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4JkT3hHUZrJY1yeZAIoqsyQhXM6l3cWACF5cyUyA0CeeebwSTX/iz0G/FQvD2+poNuNcyeTBY/9zRR1wjbGZmTv4HlOpfpUEwXraECP4f6OVnYmQ+NAsqXGFF9pBsJHmu9/GRQEl3fiw4qQQ98ImLU4ZxwPBA2hD1B+vsC/UBNZdFg3iGwqD8C3TULUCKRE6aj61f5ZscI/vIQjChZ7p4tESDZtnsljLkB0E3vVC9WIa9xfCTDbDQxt8DOLKgCy9/ihw7Z91zN2aLYBV/6CKnHSazHil8TUZ/47aP/C0XPSgpKW3vGKsBKZStOWJ0NGpPxqrSScQRQhelg/nCHG4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iW3mSk6Roum26zkTHxvOSDQxwnbMLDT06beO/vZCCLo=;
 b=KYIyQRZw0thEW1GuBxPeio/JXmahu7lJnNOc1NWicLkx4sTpTR1+ODAi/87xynlTVyI+rg3OGMCX3ImAYuLzLhHQq1Sdy78FfRVoWND9Zsa8FP5+I47OAafAirnp/DYkhTbH3VquFTbISe6m7So7b37H9KDvdtqSWYCEyrnx664KPJQ9g4UPG6C58+W/YNTeLKu4j8WlH2IIZwPuliI5p6rJTZzPPDW7/R6/pXQVpS0v5DZ8YMQkJnUQuljFc89Jig2CKEOdHg422+Klmt9oyHiMg8lBWhF0bhtUwHSGXf2lXC1nRzarwPvVUetj3UnN3pMfAhNMDxeOFWXwvEvk3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iW3mSk6Roum26zkTHxvOSDQxwnbMLDT06beO/vZCCLo=;
 b=JE2tl8f/caPOZiNzXTqGEzAjaMywhsyLPW0MFvQYabG4yJBpRq1f7JnGN3z3BJi9dbCSUq6zsEqaGgIOMcK4iW7p5VXNOX66+PwoYW5PXhJ6Sq8qaQI3Ou3h99SO/2Pu85kWSeMTUWT7ziZKIhkxXpYsTpgSyvS1VmNwQgkfp76Z70oSiDK6GfP0KeHsxrg48O+fr9uFoiqZG/Dqzi4T7LUrvNqUXETJud4pfH9HohY8BWEZNBHELmqJTi8cLm5NKD0oUe7JZBfGKRzUpCZLrpvNukR6v4NVRD1b2EdpqLCbre6gaiAMPfZLLB1rq0QUD3Jjto8EBDfs02eeOfBYFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <92580a6f-e97a-c4a9-435c-bd95a84d4306@suse.com>
Date: Tue, 30 May 2023 18:00:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 5/6] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1685359848.git.oleksii.kurochko@gmail.com>
 <bd2dd42c778714f25e7e98f74ff5e98eee1cd0a5.1685359848.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bd2dd42c778714f25e7e98f74ff5e98eee1cd0a5.1685359848.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: a966a240-f7eb-478d-0b05-08db6126fdd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	75A0y8gLkGmJdZxNpldjb1p3zB/6Yaeg2smdGr22F5mSuYh5PUj+pfwY8fFah8gGhu9613+p1MMukrUez0pUcquNVyMCDhuSkGb7Z5d2aLIjiwGWV75nrEJVFC2D9KN3rkxHUAwTmNm30gTwXkhs3VS77TaqIItfU7Kqr+f8u9HwjnniQops2TDQKygtSNKXU9nzIrLMdYnnD3AIOb66imH8IRySbjleyUnUn7PQHqLWE/4T87IalS9MFjWXJlRuW+rCHLdJ9XD7w2ECLhHN9U4ctO/XtiENot0vwiB2Ju50hgN/n+8DHxrDRGxSPy93KQGPghX/VFnktU5XDxCdfhvg6QZQSj0IPchHf6G9Ju7hxBE4/BMNs+ji5uffc7EgHqEmCzw9tkmrAlDq5Tu9Id77xoGBSoU7242Aw1y/mrIj/QRnvSOSEi3Q44kaWMt5S8nqpTiN9YyA4sCz+R1kFNLYnoCzB9gDIe7uYF7GO+Kqdyt/rro6NnZHolq0G91PTXuHMLh4gfjO8Llg77pu7YWQr5HQ2mbXUMT78bznZKAg/NFglrqvdmIVGnIWvLSpWXpLqoV+Fhbqzi2vYXlYs6AwqZnw64+QOjfrOHrw1M/78Si4KGu70ZLlmND04O+Ot2zEuRCWheFSpn9+Qy1+Zg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(376002)(39850400004)(366004)(451199021)(478600001)(31696002)(6486002)(86362001)(41300700001)(6916009)(4326008)(6666004)(316002)(66476007)(66556008)(36756003)(66946007)(2616005)(5660300002)(186003)(2906002)(53546011)(6512007)(31686004)(6506007)(26005)(83380400001)(66899021)(8676002)(54906003)(8936002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEZudGp5VmdDYlVVQW95VEJteVQ4UVJMTGgwVmJuTHB5dk53V2V3Vi9UVUY0?=
 =?utf-8?B?Smo1dS81YTBENFN4enI2VU5hUDdBZ0wyZHR1c3VBRlJIWXhqVFg4VWcxcXMv?=
 =?utf-8?B?Qks0c2JEd1Ixd3ZxeVg2OWw1YU5JK3NCM2VoZXl2bWZaUEVtczdSbHIxYWI0?=
 =?utf-8?B?ZXRDZ1pXWVdJMU9ERFpUS0tBUkFVYzl3NFl4Z1FyTzZ1YW84b0NnT3E5VjZC?=
 =?utf-8?B?VjdEaUUzNjlTZzlTWkFSNi9YUm1YNWQ5cFd0WThHZHFGU2k5S1ZsbTdyWSto?=
 =?utf-8?B?WFYvNGpITHA5ME90VHMzZDRRcEMvcS9ncjBaTTU0RHJ2NE5UNHowSzVTR1VT?=
 =?utf-8?B?d0IwRVJzYWMzcS9SVmt4T1Bpb3ZMbzE0WUhnYjRLbWRYdklLZ25kR1NUd2F4?=
 =?utf-8?B?cVdBbWtLMHp6TGsvY1ltc3prNDJSaTRSdkJ6Sk9uQm1JbnAwNzZycnBlaGNI?=
 =?utf-8?B?YjJTc05PTW5vU21ISWNRKzFMYXpvRjVVUklFN0M0cXNwazV6N3VzMUdmU2ZR?=
 =?utf-8?B?SzhsR29DblhwaWpyNmNmTkJ2UVp6YmhEdHROOHBVOWxmSEhETXFUaW9QY2Vn?=
 =?utf-8?B?aTZ4a2wybzJXNXpxTlEyTFRFRzd2Y1NXNkd5NHJaV0RTTkY5T3RHZ0NtMGVF?=
 =?utf-8?B?bnFTbzJ5QVNubUU4Z2JHS0hsUVVJVldGWU5LZ1VZckJUb2d5RDZ2elBtaU9u?=
 =?utf-8?B?VExXeXVXd0M5U1dUVHlrRms4TVEyTFBwcEJpOHBGWWY1TllHOXVEblJtR2h3?=
 =?utf-8?B?M1BHRjFyMFhZaEVkMmdZL0NiNXBCTVNreG5iWnYrbW51Q09MR1B6RjEzNlA4?=
 =?utf-8?B?QXhLNzlNOEVhR2YxV0loUUc1V2xXRitlbENFYklJTGRCNC9MQWN0UXZRUzFp?=
 =?utf-8?B?eGRuSTY5bUNxbzMrcFdBUTV5VXpjWVNnelhBTHZieUowYkFnRE5QMGJ6MERL?=
 =?utf-8?B?VStLZ3JOYUh0Zi9WY2Zobm53OCt1dHRzMkhXZHNVRkRTY1JJbFJ3WkhibGlY?=
 =?utf-8?B?NkErcE9IZE5SUUo4bzhZRDFScUZjakdsTW9pZFBvcHk4V2RvdWV6SFQxNEZm?=
 =?utf-8?B?SnFsNGRTUHBoYlV4U1VjTG9BZE5pMlRhYW1LT0ZvVmlXSFBPZnFHMnJ2VnJy?=
 =?utf-8?B?bktLaXlhcWJnYXR1dk5UUm5mMTBRdDY3N3piVUpFK2ltOVpWNXdjQWFvUVRU?=
 =?utf-8?B?NDBJN2l4UExqM1R4NkMzK0hkdDRXdWNFUmFEVEhJL2tueHNZSzlRODdHR3ZQ?=
 =?utf-8?B?VlVlZTMzZTdNRkI5R3R6Y3djYUd2TnU5b0MwUmdoZFBmVGtWVzd2aDhEaUtk?=
 =?utf-8?B?NGh5dWpiT3BWR1kwcG13RnlWcE11TEFnT1IrL2tOQlYzOXc2ZU5oNVduMG1T?=
 =?utf-8?B?b0VxYjBsUHRrOVFxb013ck4zNXV6MTY1VjhmdDNGaWFXS0Z2NmN1NWF6ZmNy?=
 =?utf-8?B?SkZxbUpaeC9TU0pYSzR4VzdnRDZ5RnllQ2E4cThjNzlac2R3aUErWDNsamo3?=
 =?utf-8?B?WTFuNm1aZStPZEl1bTVtak9pMjJPZCt1ODk1SXAxTHpqOWNnd2dkNnc0Qndw?=
 =?utf-8?B?bmpySE16Mi80NlplNGpBS3NVM0YrR0IrNlNqYVI4dkt1Z3JVR0pwWXhVejBi?=
 =?utf-8?B?QWExQ016RzVZdnNLVk1kekN3elJQSE9VTzgraVlaa2tFZGMvR0xpSDJzbEtN?=
 =?utf-8?B?akU0WWhWY1RkVnQvNHZVKysvYU9FQWFXYjRJNzJmMTFHay9rQmRMVTE3VDRW?=
 =?utf-8?B?dkVxK01CSk1ELzBRODBlbmo3emYrckxOclBEKzB6eTlhY25LM2JSc3VlbVB0?=
 =?utf-8?B?ZVlVQ3hVaEhGZjBWQ01NQk1uOUNteVUyZHk4Y29BL2Jhcnd2NnhZZ0JmNHNs?=
 =?utf-8?B?dEk0VHVxZmZyc1Y2WFJmSUZ6Y0NHQ1BMemxMNjFITWV0NVp6S3BUSWY2YURn?=
 =?utf-8?B?NHBhQ1huR0JGWEEveGtjT0E2QjJGd24wWjdLS3Y5VjhmdWJON2NjNVRqRE5i?=
 =?utf-8?B?aUcyNG1BWFlFNTJYMEI3elBiV204T3gvazN4YkdnVHRtY296L0MrRHkzM1hU?=
 =?utf-8?B?VUZyZVUyTkJuQzB3bHJyL2dPZkRjaXllY2h3MHJBUjRuU2NKQVdCc2ZrdzVV?=
 =?utf-8?Q?H9Gh2kpWi/X7M6c5kVtY4tzcc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a966a240-f7eb-478d-0b05-08db6126fdd0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 16:00:30.0377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUtToVjAS99nC75ZSpebOEVeGBro3fsm6AwoaqiIMqXk2ZFMtC6z0su5kpLjVS90UySOZ7E/Id8vEOPRsVTJIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7254

On 29.05.2023 14:13, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/bug.h
> +++ b/xen/arch/riscv/include/asm/bug.h
> @@ -7,4 +7,32 @@
>  #ifndef _ASM_RISCV_BUG_H
>  #define _ASM_RISCV_BUG_H
>  
> +#ifndef __ASSEMBLY__
> +
> +#define BUG_INSTR "ebreak"
> +
> +/*
> + * The base instruction set has a fixed length of 32-bit naturally aligned
> + * instructions.
> + *
> + * There are extensions of variable length ( where each instruction can be
> + * any number of 16-bit parcels in length ) but they aren't used in Xen
> + * and Linux kernel ( where these definitions were taken from ).

This, at least to some degree, looks to contradict ...

> + * Compressed ISA is used now where the instruction length is 16 bit  and
> + * 'ebreak' instruction, in this case, can be either 16 or 32 bit (
> + * depending on if compressed ISA is used or not )

... this. Plus there already is CONFIG_RISCV_ISA_C, so compressed insns
can very well be used in Xen.

> @@ -114,7 +116,134 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>      die();
>  }
>  
> +void show_execution_state(const struct cpu_user_regs *regs)
> +{
> +    printk("implement show_execution_state(regs)\n");
> +}
> +
> +/*
> + * TODO: change early_printk's function to early_printk with format
> + *       when s(n)printf() will be added.

What is this comment about? I don't think I understand what it says
needs doing.

> + * Probably the TODO won't be needed as generic do_bug_frame()
> + * has been introduced and current implementation will be replaced
> + * with generic one when panic(), printk() and find_text_region()
> + * (virtual memory?) will be ready/merged
> + */
> +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)

While it's going to be the maintainers to judge, I continue to be
unconvinced that introducing copies of common functions (also in
patch 1) is a good idea.

> +{
> +    const struct bug_frame *start, *end;
> +    const struct bug_frame *bug = NULL;
> +    unsigned int id = 0;
> +    const char *filename, *predicate;
> +    int lineno;
> +
> +    static const struct bug_frame* bug_frames[] = {

Nit: * and blank want to swap places. I would also expect another
"const".

> +static uint32_t read_instr(unsigned long pc)
> +{
> +    uint16_t instr16 = *(uint16_t *)pc;
> +
> +    if ( GET_INSN_LENGTH(instr16) == 2 )
> +        return (uint32_t)instr16;
> +    else
> +        return *(uint32_t *)pc;
> +}

As long as this function is only used on Xen code, it's kind of okay.
There you/we control whether code can change behind our backs. But as
soon as you might use this on guest code, the double read is going to
be a problem (I think; I wonder how hardware is supposed to deal with
the situation: Maybe they indeed fetch in 16-bit quantities?).

> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -40,6 +40,16 @@ SECTIONS
>      . = ALIGN(PAGE_SIZE);
>      .rodata : {
>          _srodata = .;          /* Read-only data */
> +        /* Bug frames table */
> +       __start_bug_frames = .;
> +       *(.bug_frames.0)
> +       __stop_bug_frames_0 = .;
> +       *(.bug_frames.1)
> +       __stop_bug_frames_1 = .;
> +       *(.bug_frames.2)
> +       __stop_bug_frames_2 = .;
> +       *(.bug_frames.3)
> +       __stop_bug_frames_3 = .;
>          *(.rodata)
>          *(.rodata.*)
>          *(.data.rel.ro)

Nit: There looks to be an off-by-one in how you indent your addition
(except for the comment).

Jan

