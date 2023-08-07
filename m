Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967C97725BD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 15:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578429.905924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0IX-00075t-AJ; Mon, 07 Aug 2023 13:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578429.905924; Mon, 07 Aug 2023 13:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0IX-000746-7H; Mon, 07 Aug 2023 13:29:25 +0000
Received: by outflank-mailman (input) for mailman id 578429;
 Mon, 07 Aug 2023 13:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT0IW-00073y-1a
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 13:29:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bd8c72d-3526-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 15:29:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8941.eurprd04.prod.outlook.com (2603:10a6:102:20c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 13:29:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 13:29:20 +0000
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
X-Inumbo-ID: 6bd8c72d-3526-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Flju2MdSF03fpBkJTuEOnCGflUg81yF+uM3bx+rH5FXPPOA90lR8D07hTRZml4pPOqtJVh2wcu1CzufxDa4RQpTrMEEAvkFwcp7SlQ0ATB68Ye4Wf6N9MYHfMI+kBygdsESG+k0H+GyzZGHak8AoWUl7I14LJ9lC/3EDAnnytQyiwYDb7sqNzzgjrTuqXlxGkpnhxb3WH8AA6hX3WESKETMiN0heRnrnUzhXZan/XcoSBphp8dqYit5csbYR8rzd0k5W1o0mrL8sCWymG3GP3pD6rN1cxWI6tzB/iB8WA2M/F9hi2cYYzyx6FNsBcDeSDGe8jN1HXtiTWm27ZKzq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4HW7BqjobAEvFwiwH3Z+boBfDXBy9EiSDKFqrki6tM=;
 b=QcFfXy6hYZT0mRM2bf2vGA7DdRJ5HncStsF7HXBbKrX67Mvt73Zp6kIDygHSIi8h2gI7wxDN/ImDTP5zOcxzJkbGLzjUOZtYAYgtHP/zrEb0QEzhT/xYDn6tpKDDi3ARuZGQguGk+zhl2uAkMPzINTXXGUazbyV6Ma/xTBuGEF3MSpGn9czRPaeaoQZNVyguFfKTT8UOSPUlQh9F0uiXUU3KBnSfnXXKTb2ewnUA26em4j3p0gUrOs6YGT70vdymyTt45aVuW+leVwiLJTPd20ACzvhVXnJgwcLWr+rsl+UkWtkNSi4gCEG+cAXoZ0FzTNG7ueJPN1GyaWd4dQuTWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4HW7BqjobAEvFwiwH3Z+boBfDXBy9EiSDKFqrki6tM=;
 b=jHAhbgjW/OZ9WXiKABOwKSL8Dhetbgz+2FK5HDMeTLT6+Ae2kmq64Qavdznv3MU9b6LutOq47G3BOT91vnzKa5l00I0cw4WPQVmCmISUsUhvsUNNNCb4eC3d4nUGlx33dIejMP0PE1XYz85qnLHFkzlWgGptmAp1PvdAW5mdKuBv6DxdRGKCY/vd3ypJ/e3Jxxa4ssgXxaU+GoYVbEqdhsidDI76uii0UV5Nhse6YYZGtRY56HFpQfxhSH0eMGv+J6J4rQRL5j1ELXzrXOm+0qDmTI4N2ZMEeUVBRDSv3jsHwKYATQZH7styDMgGYZYbNDRbxHWKsQzRe4eaOnb9wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8098e465-d25c-7fe4-dd97-2f44a689c9a6@suse.com>
Date: Mon, 7 Aug 2023 15:29:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v7 5/6] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1691063432.git.oleksii.kurochko@gmail.com>
 <9fdda7716faf412f1e2cdf9a990c98e64c4b21f3.1691063432.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9fdda7716faf412f1e2cdf9a990c98e64c4b21f3.1691063432.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc516e1-fea4-4327-2dea-08db974a4ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wZtnhY84ZNZavxTwMnVWRhlBBa9SKDAfAkXLNNqGZB9SFXaeziUWejgzmqb4GeNBXSUTTmL3l9BvAFJcL1YJPYF3VxQfWvflRU56TK9g+/aEoLjkXsyHkH8AT4Sxi2zELezvtUBjm24jnaXlnIHX05mh4u/IngGshCVSN/904DQxn4OYDwN1OSgyXLxM89WG9FIz/vjG+Q/rTssecPL1u46SElFq/u8Pb4wJW+cmEoE/1JmUQrhcEryvVdb42vPCLmmc77ujM9ckPpg+lvA3BHRNu6ioQE99GatmZ2TzM3hMooKYi4Z8CAvEpg2sTSXKy20ljVmGBKcykAed1IDA+4xyuVblynPpVJ7nRJBFWde6gLkrqM68KZxWpil1rl1DBbP1t68CIlB/dxNKVORfFpJR9y5JSEtXcrC/F6m4A69qeBHP6b8I6MsbAdMm/3a3dtYWESO8I155XRcAdkIDv0dEu8xxGhoizrQgUUMJgYeoZvBbV6rTmLsANlMPwoOd/tliadFVf2hLcE+8i9hAL7HKvVKzG6FCqJY1vjYZ2jIO4wykPAUvQXMxA5FBz7Ys/uV0DzL1449DZ7zIt+4B8JlHK+iQ9aMzg4copNTI5FZLiMpk0xciHIlPVl49lRU5Dl836xSEft+DR6KoChs1aw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199021)(1800799003)(186006)(41300700001)(38100700002)(6512007)(6486002)(6506007)(53546011)(2616005)(26005)(316002)(54906003)(86362001)(31696002)(478600001)(2906002)(66476007)(6916009)(4326008)(66946007)(36756003)(66556008)(31686004)(8676002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFZOZlNDU1Y4K2RBL2VVbEI1ZmlORHRtczgwY0xCaVFHb3BYNDM5R0FSMW5T?=
 =?utf-8?B?K0pRKzR5U1Nva3YrVzFMb3VYelg1bDhWajAycDBKcUVONFdMaWl5dkpiS3Zp?=
 =?utf-8?B?aVJOV0JPcVhpd1FrNU1QakgybHlzUTYyYmh0bmJRODlLelJZKzRxQ3M0dVJR?=
 =?utf-8?B?QnpYTDZSR0hJREo3UVFBRURZTFkvM3lNcURlN0hyaHMrZU1Vb0tTd1V0V3J5?=
 =?utf-8?B?aStoQlAzK05xZjZINEUwQVliZHg3TU9xQTBqeFo2MzBTRUtxaHdZaHpnc3lJ?=
 =?utf-8?B?VkdtdWNtZkdmeFJPeVFGSUtKRXFId09JTzlBUUZhVDRHUDEwdGlLVFVhTVA5?=
 =?utf-8?B?MVFXTThiRmRiZWFhNVZQNGRGY092c2N3ajlLenJrZzBmS1d2VURkOHArbnZF?=
 =?utf-8?B?ME1oMWxySXcxUzFUUGN5OGxHV2RCR3FBelNrbmgvS0wza3pUS01PMXYwTTZ4?=
 =?utf-8?B?UVNUNVUyeTAyMVVuenozZkplRjdPaUM3d2lFUGY5TjFsRW9jNE9ib2pvUWtK?=
 =?utf-8?B?czZ0UDdUeloxeVJoSzlxZDhqNEQzT2FZZHEwSTNWb3h0MDJUNDJBSDV5dkRW?=
 =?utf-8?B?OFVmcWh5bDRBd0MrZ2w1K1djSmdqdnhzS1l3czFFZm1UTWJkYUZqbEhwcDRn?=
 =?utf-8?B?bzB3cnlCQ21TcGpjUWN6RlIzTW9jQVJTcmhIZU8rU3htNnF4Z210UUFRdlRC?=
 =?utf-8?B?bmU4V0paNnNVQWpZRDAzcEUvRlk3WXpBZWJ5bzdzVUM1UENaWGwxaWFyT0dh?=
 =?utf-8?B?Vmc3UHNndnNGdUd3MWsrS0hBRkxtcDRsdmYzR0l0S3BuYlpXK1VQVVNFbmd5?=
 =?utf-8?B?MG5HN2I0d2tPMzZPNDZlTDlNUDhmOXhSSTFpaWdRbTFVSnMzYk56UmYvQXNq?=
 =?utf-8?B?R2RSMFIyZDNiTXBaTDlHTUtVdXlZdEQ0RWJXcStIRUR0V09lTmtpbFI0cFhp?=
 =?utf-8?B?b2ZOUXY0eGpIMlRrbTNPZUxVbkN2ZFNkK3BNY1FlNDJZMXdQdW5vM1NkeldJ?=
 =?utf-8?B?cmpPUmorOU1BdGxqbXdaS2FaWUl1OWpzRGUzbjZ1L1YvTnJzakRlVnpJYlNY?=
 =?utf-8?B?N3ZNeUhjUmgwL0t4Y3lYSUpjTTVPZ3dqZVdZMXBaMHM2VVFBNFVveitibmlD?=
 =?utf-8?B?WkJiVlN2ZmluVDd5SDJ4VW5XQTZvOERGN2x4bU80Qkx2cUpybkwyd25XdEc2?=
 =?utf-8?B?N0hMMFIyNnhaNGhrQlN5UUhVM3NkdmhhWFlkOFJsNGprdnhhalNUQ05NQnNG?=
 =?utf-8?B?ajRvN0ZweUhCeDI2b3prbFNIb1MxT3BWRzM3YmQwT1MxNjBXamVaZkdWaHo4?=
 =?utf-8?B?NUgwRUFuMGRtTmNnQzk0ZVZONnBXQzFSUHIrYXZaeTBKY2FlbU5LUzM0KzFi?=
 =?utf-8?B?Rmd1amJ6ZkZ2SURaSURzQzVWWkNqWnB2NGpERVB0QTJHS3dKWDFuOVNWVk9L?=
 =?utf-8?B?NHVmL2NjdVBaaFpTclRBUWVkeVl5dUJGWHFOR2VxZnZHZGk5QjNVZ2dsKzM4?=
 =?utf-8?B?YUJGMUVSczhYN2VQUzEyYlVJRGdjVnpCeXdTWXhrWDJ6eDJTQVVwM09PaUwz?=
 =?utf-8?B?U09sWmpMR0I5S0ZjUUc4R2Y1YUprNUpIaUxYRHdvaU9EMVIvSVlMZ3drRXhB?=
 =?utf-8?B?U1JIRUdkckRCTmdUdDdheHFqajJnT1VuZ3J4bk1aeW9TbnhjYi9NZENRcFFO?=
 =?utf-8?B?WXRmcFl1Z3V2V0QxT08zdGxsVDJvOXUrand5N3VJdHdxaWo4R0xncjd6bjdN?=
 =?utf-8?B?cjQvOHdkR2dKclJsOXIybHp6emVaZzFzWk9Kd25Fc20rMFN4S2ZFV3VoVE5l?=
 =?utf-8?B?bkVCWUprZVNzSnJ4S043VTBXOVlvd0NGandSWm9ENk1GeXo2c3FSUFNHbThX?=
 =?utf-8?B?dnVTTFdGdU1xdEt0OHhWTmJXOTFNSjRoS0Urc0ZNTjU2aG5iUTZnek9FRmdw?=
 =?utf-8?B?djhycWpydWFqTEwxU0FySVZCTXF0cGlYNUFHbTh1bDU0dXpoQ21hZzkxWWpn?=
 =?utf-8?B?ZzVPYkZNWlYvT0krbWczWk5zU0YveFRsRXY0M2wzWHB5Vm10RGZNYWc0bGdM?=
 =?utf-8?B?bFRON1lsME9hU3ZqUUQyMCtYeWJyZ0xpUVA1a2o0dmpZUEZxZGdMSTErSHJS?=
 =?utf-8?Q?i2j5snJNhCIFqNHK4hn0yexl0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc516e1-fea4-4327-2dea-08db974a4ea3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 13:29:20.6916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7gy3QZYLqQsCZ9TqHBnasIIh69x1xlATo8e6sHV5rLuGOVf5Z3xIB71U5oMDjP5VqmF/l856f+QbLYkGcCJfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8941

On 03.08.2023 14:05, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -5,6 +5,8 @@
>   * RISC-V Trap handlers
>   */
>  
> +#include <xen/bug.h>
> +#include <xen/errno.h>
>  #include <xen/lib.h>
>  
>  #include <asm/csr.h>
> @@ -12,6 +14,8 @@
>  #include <asm/processor.h>
>  #include <asm/traps.h>
>  
> +#define cast_to_bug_frame(addr) ((const struct bug_frame *)(addr))
> +
>  /*
>   * Initialize the trap handling.
>   *
> @@ -101,7 +105,131 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>      die();
>  }
>  
> +void show_execution_state(const struct cpu_user_regs *regs)
> +{
> +    printk("implement show_execution_state(regs)\n");
> +}
> +
> +/*
> + * TODO: generic do_bug_frame() should be used instead of current
> + * implementation panic(), printk() and find_text_region()
> + * (virtual memory?) will be ready/merged
> + */
> +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
> +{
> +    const struct bug_frame *start, *end;
> +    const struct bug_frame *bug = NULL;
> +    unsigned int id = 0;

Pointless initializer.

> +    const char *filename, *predicate;
> +    int lineno;
> +
> +    static const struct bug_frame *bug_frames[] = {

You likely want another const here.

> +        &__start_bug_frames[0],
> +        &__stop_bug_frames_0[0],
> +        &__stop_bug_frames_1[0],
> +        &__stop_bug_frames_2[0],
> +        &__stop_bug_frames_3[0],
> +    };
> +
> +    for ( id = 0; id < BUGFRAME_NR; id++ )
> +    {
> +        start = cast_to_bug_frame(bug_frames[id]);
> +        end   = cast_to_bug_frame(bug_frames[id + 1]);

Why these casts (and then even hidden in a macro)? The array elements
look to already be of appropriate type.

> +        while ( start != end )
> +        {
> +            if ( (vaddr_t)bug_loc(start) == pc )
> +            {
> +                bug = start;
> +                goto found;
> +            }
> +
> +            start++;
> +        }
> +    }
> +
> + found:
> +    if ( bug == NULL )
> +        return -ENOENT;
> +
> +    if ( id == BUGFRAME_run_fn )
> +    {
> +        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
> +
> +        fn(regs);
> +
> +        goto end;
> +    }
> +
> +    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
> +    filename = bug_ptr(bug);
> +    lineno = bug_line(bug);
> +
> +    switch ( id )
> +    {
> +    case BUGFRAME_warn:
> +        printk("Xen WARN at %s:%d\n", filename, lineno);
> +
> +        show_execution_state(regs);
> +
> +        goto end;
> +
> +    case BUGFRAME_bug:
> +        printk("Xen BUG at %s:%d\n", filename, lineno);
> +
> +        show_execution_state(regs);
> +
> +        printk("change wait_for_interrupt to panic() when common is available\n");
> +        die();
> +
> +    case BUGFRAME_assert:
> +        /* ASSERT: decode the predicate string pointer. */
> +        predicate = bug_msg(bug);
> +
> +        printk("Assertion %s failed at %s:%d\n", predicate, filename, lineno);
> +
> +        show_execution_state(regs);
> +
> +        printk("change wait_for_interrupt to panic() when common is available\n");
> +        die();
> +    }
> +
> +    return -EINVAL;
> +
> + end:
> +    return 0;
> +}
> +
> +static bool is_valid_bugaddr(uint32_t insn)
> +{
> +    return insn == BUG_INSN_32 ||
> +           (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16;
> +}

Why "addr" in the name when this takes an insn as argument?

> +/* Should be used only in Xen code ? */

What is this question about? With ...

> +static uint32_t read_instr(unsigned long pc)
> +{
> +    uint16_t instr16 = *(uint16_t *)pc;
> +
> +    if ( GET_INSN_LENGTH(instr16) == 2 )
> +        return (uint32_t)instr16;

(I don't think this cast is needed.)

> +    else
> +        return *(uint32_t *)pc;
> +}

... there still being a double read here, do you perhaps mean to
make a statement (that this code isn't safe to use on guest code)?

>  void do_trap(struct cpu_user_regs *cpu_regs)
>  {
> +    register_t pc = cpu_regs->sepc;
> +    uint32_t instr = read_instr(pc);
> +
> +    if ( is_valid_bugaddr(instr) )
> +    {
> +        if ( !do_bug_frame(cpu_regs, pc) )
> +        {
> +            cpu_regs->sepc += GET_INSN_LENGTH(instr);
> +            return;
> +        }
> +    }
> +
>      do_unexpected_trap(cpu_regs);
>  }


