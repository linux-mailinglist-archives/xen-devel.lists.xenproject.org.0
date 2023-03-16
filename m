Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 014306BCE1B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 12:26:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510509.788286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclkd-0003D3-EE; Thu, 16 Mar 2023 11:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510509.788286; Thu, 16 Mar 2023 11:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclkd-0003BC-A5; Thu, 16 Mar 2023 11:26:31 +0000
Received: by outflank-mailman (input) for mailman id 510509;
 Thu, 16 Mar 2023 11:26:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pclkc-0003B4-C3
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 11:26:30 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe13::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63f2a258-c3ed-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 12:26:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 11:26:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 11:26:25 +0000
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
X-Inumbo-ID: 63f2a258-c3ed-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEJCqmcbDFc2vJ4XCzNmEM6HtZuXda+Yv6iHTAy6ca/SBN+OGnhPzGA2xjdEWQbGK62I3dpCX1JPt6cgMw0L5VisY7EjwVwQnlreSV+8h/4U50ZcJSowa0+IQPg5HHym61Hz7RTGi0bYJTUSfkwqmul6gDjFjI4Czjik98Pqj2DViX/yXZAgcyv0CjgAdbGC08SrA1YCn7Ht6xrvpyT/ML8xGaJnk5c0mTA93NLVdjcJcdiWRiZWespmPDvw4f5jWcgMskOONuGj3G6UNUVGyMEbzn8loiUAQy+CmeRi2Mi0d9Mq6aOjvIhMuTK+XK7Kahmu6w3nIyWz4yzy+od6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaFHe/zOhriWhMbWmd8NhIbqt0G1Z5l6sYvcGLcs6rw=;
 b=e5QBBT8sj1ovxvwZiB9x6iSnmoE171PwA7g5AHdZEkQ4hpVXLqP6xgtr2yyZ+tY925TdubMGnq7/fDB30YPXJK4ctGbcOOx1+Cmo/PPnwkd41B7ZSPDPQ8s3eXDfWzMWEWsTSA6MF6oSBis/mrqmAEbrZQ1/1xHiCwOXM1n+i2+vuUCQbpd+z4daMjWTsPX+uUZyPlR8O7uXhTfO5nLXdrvRpq14YST4X+tDBYxVn1h5ln9nk8X6/XU4V8k/KOJvJe8OuluHcXmUCeY3uwLVJacPBVHZyFIAYkeaLqz/4iCRMPdGfka6iouY8HQdQtVcjkHdh1UdgyeJeAVUp6Y2eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaFHe/zOhriWhMbWmd8NhIbqt0G1Z5l6sYvcGLcs6rw=;
 b=UCC1rVSUOwmEtbKKAunf9hWcyHb24BHmNCcG4wUcCmujOX7EfJeBpXcmzELX1i9tnEF/m6FhuOyfPWBUVP8KEqDtX/cstZqhqjypWyTZBi4xeMutbmsv7NqkLJ1dnJJWpGKaPNAqbXbTrcNlTCk/62KpUg+O8BDbyTAFBk7oKNkGOU96BDGS9SYdlFrgQO0CgIYO0+Fiu7JGpHADBb8kIFP+lVrxdRR5/riasLF/6z3OARB8tooIQnZow6dTRtpb0Sw+6s7ZxQxfXNjFpfndA4/fqtFBjL/V0VyAW4bHpclJwIvzEXI2Xc5wX6Z/IlQY44mtlrazJwaEXH3DUgPPGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3bc211fa-a8f7-70ce-bfa9-5e4380776070@suse.com>
Date: Thu, 16 Mar 2023 12:26:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
 <2afad972cd8da98dcb0ba509ba29ff239dc47cd0.1678900513.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2afad972cd8da98dcb0ba509ba29ff239dc47cd0.1678900513.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: af726aaa-d39b-427c-ff36-08db26114719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EbArTH+itabRBhAxvo+BjlbVzmDUGh+1boggugPNHYc4v0qHYvdakw0kc6rf30MdhpnUay7OnrlaP4EBKZSh7OapFaQwwOez4TsR22Mb0VWZNvH4M8BfyDDSBHt4/NRU4qtzGOUK6gJZwyH9RZkw9qpZ4SZkTl9Joqz/mA6rCv+pMLtu2EBv0x31y+pkPtfBILAPtElxoe6442ggfJmioRGxVfGQtNPywYv8DGetfaJeGEMeVYkj6+PtvLG+qQ70WEx+2yNy12t72yR2vkxwzJ89EjmiTsmOzxP9HwFoB/bzLcLwWjG9IJSlvyKyB+15h48xmmno6ihdRSQhqjUdru8tQJVN5tAFBOoYRPuhPQn1ZGkPTWAtxaluIvLWWOUpxC/ql85jMR4RqpnAooJx9BVL5cMZFe4yGMHRvGL4lgSaE+7rU3OmSZ/XojfSHqRDsfjNiDt+AJ08Xmt8xtK9379A4ksh8c+EsDjl5WdtkxgXsPUtaVs/W25fEc8JxGFP5OTKJyTcoFjGB+5pGfwxUYy+uB4/Iqb2w3Svtq8Jekmwa5y4qfL4eTQiMfFTWAtGXEbdRzBICflDtf4AtanNPL/ApAbHOa4Aw0WrCs3RJqvj6X+HqGNqCHbdSAx9U/RhVEASFAWsgDLU4ifKfg5/RCUbA3A85Djivj9tRVVtbDWr0iDTdx02vvwuB146vv81OoGJgZ7IyfSNQiAegYZ7UzxD9zxe+T1KcrjKjMYzNkVJmutlf6gt3k+xtx3lhkhQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199018)(36756003)(38100700002)(31696002)(2906002)(8936002)(41300700001)(86362001)(5660300002)(4326008)(6506007)(2616005)(6512007)(26005)(53546011)(54906003)(316002)(186003)(66476007)(6486002)(66946007)(6916009)(478600001)(8676002)(66556008)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0NMMVBaTHpWR2tCS0hoYm1jak1LSGdyRXVqWDlMSkpFWDRKN0JWOXdSSnVJ?=
 =?utf-8?B?dlFyR3BidjE3Y2Fwd2l4d3JiMlE5aUtYZXk4eWg4UDZURVVJcmZDRWZBVmcw?=
 =?utf-8?B?WExVbFQra1ZmRUcya3IzejVLMzQ4VlFTN1JmRGMrakkrTXhXYzlSc2ZudTdR?=
 =?utf-8?B?WUpZMjM4cTBQOGJSSFRGeVRXNjdaMVV3VS9oZ3d6NUhMTFNFWVkweXcwK3JJ?=
 =?utf-8?B?NllDZmV5TXc1ajE4UGErYW5DRW5jZGkrNFRielZ1QkVpakhTeXJaWGdUbGhk?=
 =?utf-8?B?ZTk2NHZUYndiNEtydEpya254MUhhM1B4Z0dDeDNsd0srL2psRW40RThpOS81?=
 =?utf-8?B?TnJYTFJGTURNR2dXSEViTElhdzAxUTViT2pXWTJUSjNHSUhLMi9LTG95bnha?=
 =?utf-8?B?SDcvRHIzZmRhMVlvelJKK1l5Um9HVVhVcTRyZnRweEVnWjNHVFV2V1JpTmpO?=
 =?utf-8?B?eitubm45T1JhaFlXNzhwcGFEcER1bVlmZGVlOXVOUUNHYVlsZ1pWbEYweW9B?=
 =?utf-8?B?emFiY1hhRU9BWVo1b1cva0JST1lWcG1MVFg1d05nOUNkK0M4d0lwaXRvNXpn?=
 =?utf-8?B?UlJTRXNlNXZYR1FPcHZya0UzbHVQOVkxQzR3RzI2OW9JQmJJV1FsS0ErQk81?=
 =?utf-8?B?S0hNa0d0SjNPZm5qUmJPTlVrb1VScjJid3pQZjBicW1aMHFCVlIzOWtiNkpH?=
 =?utf-8?B?TXhjWlI3TEppOTZZSjkxckFBQjQxVUVpbXYvZE9maG1OZ2NncFFGcFM0T3hN?=
 =?utf-8?B?MFhFY2tZdURJWW9FZnBMMGZZUnRBR2ozdlFrRmxTNkUxbXVRcFQ5a1dsRE1h?=
 =?utf-8?B?T0tCaGFFQ0d2VEJQOW8zUExQTGVFbGM2S3BiNEkyYW9UOExGamtBM250SWJQ?=
 =?utf-8?B?dEtzNGZ0Rm1oYTBad2FxWCtTS3lRUU9sSm1hUkViQ0Q2WjZBeDRQcldORG5H?=
 =?utf-8?B?UXpnWFgrQjZTTHFuM2xKdkIrOE5YNHd2SzhCUENBSzFlYTd3d2twWlV1Tlho?=
 =?utf-8?B?THhvd2VVUXBjTmFWTGNVdHBxZlpFeDFIS09ycG9KN3JtZXBvN3BKbndraWFu?=
 =?utf-8?B?eVdMQnF1czFNQjl2bkh5VDJBOGNCcktuY0FFS1FPZ2c0RmxaOVZVSFBLbVAv?=
 =?utf-8?B?V1R6R285SUZ4amF4aHk1YVhueWpRRko3bnp2a2xpZHhTMkNScWxNN01vZWVE?=
 =?utf-8?B?U0w2L3JhbnlWRVN1U0tQWDRRNjNRYU81c3AwL1k5NlQzUmtLVjYybnB0SGQz?=
 =?utf-8?B?cXNXaytYdTliZ2RSSXFST25vSTltRVJHelhWeUlWMncwNVhDUjNNUFVPalhu?=
 =?utf-8?B?WXZWY2R6MnJhSkEvZkRISUVuRTYvZmlNV1ZlUlFTdmkwaE9iRWFhaWovNWJh?=
 =?utf-8?B?cDFJaWFLRThFc3Z5SXYrTXZFd2FBRllxWHM5MVZpM0FDMnJlQjRuMnNlMTVO?=
 =?utf-8?B?a1E3Uzl3cUE2Q0xHeXYwcSt3dm9CU2k2WjV3ZStGWmNEUGpCeU5ObzlydXdo?=
 =?utf-8?B?TXcvUUpuWGJIUWhqZkNYTU8xMkFXQUZZOTlROUVEWTNnRDJiNUc4UDBZTlR6?=
 =?utf-8?B?MmNQcm9UVll6dUxIZ1BBcFpmSS95YitLQmdLVnJXa3lNTlRES0xFTXRscEJI?=
 =?utf-8?B?bTFlZFBJV09IeHVCSC9kM2kvTGVvbFgwNDJVUFd6dGFhL3hhNjFwTUZpbE5B?=
 =?utf-8?B?bjJ1UExVL2xnRG1zRWhyNTVsSUptaG5kWGEyM2NiSVlBWDFObnUwUFh5ZlN3?=
 =?utf-8?B?MzdJem1RbnNGZjFFTURHSE5ScGJiL213dFVoYThrMk5HejNBaUlmTFdmWkNW?=
 =?utf-8?B?VWNPaXo3K3RyQXI0RnhjTUE2bE85WVY4NWRJcEVjZ0xRSFBMbi9FWTdQZzZj?=
 =?utf-8?B?Wkw5KzVCWURFa0ZZOFlxQ0h1T0dkTTVUamNiMkZKOUNjRzU1WjdqWW1kaEs3?=
 =?utf-8?B?MkpwWEpkYUNxUVZ3TGV6MkM0Y3h0TDRVb25jM2o1MDlNM2lIRFVndlgyTFEr?=
 =?utf-8?B?dks2c21VWDZoZGM3T3N3STdSZ2l2VnZpaVZXL0xPclhVbWFiYmJmNkJBbVV5?=
 =?utf-8?B?RE9yV2hRZmU3VmVaMElYWUtxSHkzVXpFYWZXQzk3R0ZsVEFZdU9QQ2F5bTJ1?=
 =?utf-8?Q?MlbAzoLR0szW9XbneT5exzUs5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af726aaa-d39b-427c-ff36-08db26114719
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 11:26:25.3648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWW0dq+DS0MdZhwqRaAaMLCZyjXA+t6uQiXCN0LeqOU40/iaQBJCvSFLxhnhge0EUVXbadMtTxmyK9+lThDZLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643

On 15.03.2023 18:21, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/common/bug.c
> @@ -0,0 +1,108 @@
> +#include <xen/bug.h>
> +#include <xen/debugger.h>
> +#include <xen/errno.h>
> +#include <xen/kernel.h>
> +#include <xen/livepatch.h>
> +#include <xen/string.h>
> +#include <xen/types.h>
> +#include <xen/virtual_region.h>
> +
> +#include <asm/processor.h>

I actually meant to also ask: What is this needed for? Glancing over the
code ...

> +/*
> + * Returns a negative value in case of an error otherwise
> + * BUGFRAME_{run_fn, warn, bug, assert}
> + */
> +int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
> +{
> +    const struct bug_frame *bug = NULL;
> +    const struct virtual_region *region;
> +    const char *prefix = "", *filename, *predicate;
> +    unsigned long fixup;
> +    unsigned int id, lineno;
> +
> +    region = find_text_region(pc);
> +    if ( !region )
> +        return -EINVAL;
> +
> +    for ( id = 0; id < BUGFRAME_NR; id++ )
> +    {
> +        const struct bug_frame *b;
> +        size_t i;
> +
> +        for ( i = 0, b = region->frame[id].bugs;
> +              i < region->frame[id].n_bugs; b++, i++ )
> +        {
> +            if ( bug_loc(b) == pc )
> +            {
> +                bug = b;
> +                goto found;
> +            }
> +        }
> +    }
> +
> + found:
> +    if ( !bug )
> +        return -ENOENT;
> +
> +    if ( id == BUGFRAME_run_fn )
> +    {
> +        void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);
> +
> +        fn(regs);
> +
> +        /* Re-enforce consistent types, because of the casts involved. */
> +        if ( false )
> +            run_in_exception_handler(fn);
> +
> +        return id;
> +    }
> +
> +    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
> +    filename = bug_ptr(bug);
> +    if ( !is_kernel(filename) && !is_patch(filename) )
> +        return -EINVAL;
> +    fixup = strlen(filename);
> +    if ( fixup > 50 )
> +    {
> +        filename += fixup - 47;
> +        prefix = "...";
> +    }
> +    lineno = bug_line(bug);
> +
> +    switch ( id )
> +    {
> +    case BUGFRAME_warn:
> +        printk("Xen WARN at %s%s:%d\n", prefix, filename, lineno);
> +        show_execution_state(regs);
> +
> +        break;
> +
> +    case BUGFRAME_bug:
> +        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
> +
> +        if ( BUG_DEBUGGER_TRAP_FATAL(regs) )
> +            break;
> +
> +        show_execution_state(regs);
> +        panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
> +
> +    case BUGFRAME_assert:
> +        /* ASSERT: decode the predicate string pointer. */
> +        predicate = bug_msg(bug);
> +        if ( !is_kernel(predicate) && !is_patch(predicate) )
> +            predicate = "<unknown>";
> +
> +        printk("Assertion '%s' failed at %s%s:%d\n",
> +               predicate, prefix, filename, lineno);
> +
> +        if ( BUG_DEBUGGER_TRAP_FATAL(regs) )
> +            break;
> +
> +        show_execution_state(regs);
> +        panic("Assertion '%s' failed at %s%s:%d\n",
> +              predicate, prefix, filename, lineno);
> +    }
> +
> +    return id;
> +}

... I can't really spot what it might be that comes from that header.
Oh, on the N+1st run I've spotted it - it's show_execution_state().
The declaration of which, already being used from common code ahead
of this series, should imo be moved to a common header. I guess I'll
make yet another patch ...

Jan

