Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEAF6A4445
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 15:24:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502612.774484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWePy-00074Q-Qu; Mon, 27 Feb 2023 14:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502612.774484; Mon, 27 Feb 2023 14:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWePy-00072N-Nr; Mon, 27 Feb 2023 14:23:54 +0000
Received: by outflank-mailman (input) for mailman id 502612;
 Mon, 27 Feb 2023 14:23:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWePx-00072H-7y
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 14:23:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bc6f9f9-b6aa-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 15:23:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9462.eurprd04.prod.outlook.com (2603:10a6:102:2aa::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Mon, 27 Feb
 2023 14:23:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 14:23:50 +0000
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
X-Inumbo-ID: 5bc6f9f9-b6aa-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRqgx5AiC7NWjylDihW6brX46N72TWHpbKc1C7CFxWvDhZ0uel1Ddtucq0TqpPq8La7gCE2SOc+vDA0+MaCb1s7W/0N+QyOjRWxxZQxjUkALOlanKpBhHtW5wwKdYp/+zS2I+Y6Y+GWAzL0Vf0qI0XMAvmEzQ4gNbsHpcZnkaBJmzW7N78pLuLJJC5cEcuVbFiAPF55dGE4FYVs8ai3sV46jYTk2/xrghXEZ3MerlaqXeXxChs6SCw68hA+Bee1tduPUvpcoEdad/iQRMTherNcknipY7LAJTr+B1wYzy+Uc5CUKsXxM278VevK00M5gnPSnu8KpTdJrD+XRkYuv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgQhi4mb1Zub5UW11TNvO2om2Z5qAhHfSodVJzg5RiM=;
 b=YHTcZUgImsFHkbXQUT40Etovpvu8teGc5hiL/z9qeeL4q+Bhzz087yOG7LePSptjmBkzEyqC0ZEhUvEO7rtzdieLPb63RBtha9IANnavddDn9Zi86Pz3LR9e9ihsp5zJKNMGNCNw1kNPyftn5J3BoPGpzCDA3vbh/yP3Y72hGJlGKDWypu+xXdOGRIuskOnLvptPn4SA2RRAMpHBGRk2K3cK8uIwYBQe/HmgmtQD3nkh3i34qmIvT0g71amkLKljIdbXpJyMKCffOc2YCr+bTupLR0ezUn+Vy5Npza32dDZDFRZXPX16XwKIY0fKOOJZkJ2VsSjs85L8Oqgam15sDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgQhi4mb1Zub5UW11TNvO2om2Z5qAhHfSodVJzg5RiM=;
 b=1uyq9zt6hRgC0B8kXS19xrcMAKknLxYxJyulFrY9cK4vtRRzLD6VJlk62a6pNtzbTGjYG6cNLEAi6AzzgmS7mWtBIhClmrQGpghxbOK5WJSemebr4VAilY0aBdjPdkkic1Cy2nYaAt/TwtAuK+dOPhpNVaee8TYKNLTcWDKqP7WxXxmVjs4gT/NxaPMMhz1DvM7OJ0k5sBcmrlM1vV0jh9ZIHEFYzTaPFzBLS8nI0bWbDXWCrwIZyFJYBKMWp/agoQ2nHT/H691gb5NeCIHZsJOfjFU+yTHNSRW2xj1kjrMJRK9rSlK+WPkHk+mZApPeUZfttDQdf3yaWFa58EY1+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f052e88e-1c85-3116-b76a-24785b005121@suse.com>
Date: Mon, 27 Feb 2023 15:23:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <932b0fd2a211d2d837d00e1bda87a84ad680fe7b.1677233393.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <932b0fd2a211d2d837d00e1bda87a84ad680fe7b.1677233393.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a55f0e-e95d-44f9-25c8-08db18ce3ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1TTLo5SEiGPRMm9AnfW10VB67bi9U63EBZSS2hTk5jC4lJFX/OvxiDnQOq4cpq7RSdJRgifiixZ8m6sYvKJkRz8+zIkyrwalJPwvMj0oSm6b+yqisrcApe3eLtbebkYaV0dWnf7ZvsFEJBZnnkEW4BpHVAuTyFUAa3xxqDOfeGGC1GXtGeV6gJwT+bLn080qkpVAqzQt5Isrk1w+9DUIXFcyTw/sm5rJebrp359Me8fyBGOd7FGLFaFMdwTs6JaesRIOnoYa+qKQIzPk+yeOy02JqTqnfSFRFJ5KXc9uJKEMRjdcocu74wAPvh59yoqgHe34ojUz6ujRexva2VppFesoUXJfOyYa+upXSP2fyzRmYCwf1PADYoYhSUjZ1CcA7101Xm2mkUEykvh9R3xeJbNX0ulPDY32L2GK0uoDNxjh0E8lS/U6sLqwZz+bplQbhe3Xt/lGDBjdpJYFy/kalxvyeVzjyLB7l2Ck5e21rXz7j8JZaBOoZTmY9jm0me9H5hVSM/0KZShkZ+jbxqYH918s6JXQYQNxu78WiTIGTv9U7gRxuMRJx/hIqJb1gNN6XAkruY4wjiNCLT2as274LmF5C35aTTXQkwjA0Pcov6Dw90X/H0gkd/IHTmj7bsT3MRoePCwCMDXgZ7/ihFHKtFGc+t0yIOPCc7gXaf0iRK0ePSFgOLGeTdMHefXpeO0o3vGP6h/NaGf3sFJajYsIBDEUxJxD7upTJZY7IifKO8npz3y8u/o/SNcg63KZccif
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199018)(8936002)(31686004)(2616005)(2906002)(5660300002)(38100700002)(41300700001)(6512007)(6506007)(66476007)(66946007)(66556008)(4326008)(53546011)(8676002)(478600001)(26005)(186003)(6916009)(54906003)(316002)(6486002)(31696002)(36756003)(86362001)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2JNOXphYTNwZ3prcU0xbGNCZmx2WWVTcUxyNHVtejVaSGFzRlU1L01Wak9p?=
 =?utf-8?B?U2VLWlNPQzhPQWIxdUdkV3FvaGlCelpCUUVmWEx3dmJQRXlZcjJCN1Vndzky?=
 =?utf-8?B?LzdmRDBqaGd6d1JkUDNBUlFwTUpkaWgwM3FkeVR1R0VmNHdnS1U3R3h0NjM5?=
 =?utf-8?B?M1BTZkR3MjhYUFlIbVVZZDVEV21FdWUvK1A4RVlYamRId3VqUSs2b044N2ZK?=
 =?utf-8?B?NVlqUkhWb1JNL0x5YzV5eXQzU2xPbGZIMEJnb3FBcGlsYXdhdFRyS3c5TXp2?=
 =?utf-8?B?a2hEcjJGTFN3eGxrVEhqdElZU0lVRnIxN01kUDVJRFRiU3F1YjN0SnZEbXRI?=
 =?utf-8?B?NmlleXpsQ1FVL1VENThld2J4a2dFNHNkTEIwUnA5cUgwSmNUb0lHVW4rSU5n?=
 =?utf-8?B?Q2VDN21Gc2pqRW1oR0hkcjBHbmpCSlFILy9ZeEZBWnBuc2tvd0d1azJtbk00?=
 =?utf-8?B?OHJ2QWtUWWZ4M3RIaFNJWWVTT3Rweis0S3dWdWQ2V1gxbjNVc0hyRmlaZzVT?=
 =?utf-8?B?dnpSQWJrUDZRQjJBaDBUeG8vdVE5K3lqZWlwUThZTWVNMzN6RlJ0YmtRMUJH?=
 =?utf-8?B?a1dnWkovMUp0MWRPWDJqb21zYmZmSzZGOUZxSDFtdnhiMWtYMGxEMUdrcmdK?=
 =?utf-8?B?V3A3VCtqWGtVVWdzTjlWckJoczh6eU14azlxMEVpbXpHdmRrQUFjSU1hSG0r?=
 =?utf-8?B?TUw0cTYrenpQdmpkeXMyNjZGeHdwWEJZK3NtekxheFhIaDhHQTljc3VkU2Vl?=
 =?utf-8?B?K3ZZbUJTSHpidi95cm8ybTZWcWlpeXJZQmNRZkUrNUdMVktTbVhKZzVsYlVU?=
 =?utf-8?B?NEszME9uWFVQVHRKeHVYYUVTRVRRT3psQmZIREhaRk16ZzFTU3Y4eG1HSEd3?=
 =?utf-8?B?SS94ZmxBUUhoWW8xTzhJMXBGZDFhbjFLNkZTWkg4K0dnQVMrM0ZmdlFwMjVj?=
 =?utf-8?B?OFV4eVlhejhBSFdwdmhSNXg4c1JJQ1ltVWFjaEdEQXJMTE42N2lKb3UwUEw4?=
 =?utf-8?B?MXhwTE05OVBHV0xUQVRlYVR3ait0eXg2cGlYRmd0c3B5N1RCdTE1T2FxM0xq?=
 =?utf-8?B?Z0ZLL0dWREtIcUJTekh3aDB1TzRiaC84ZjZ1L3FZVkhrSHBaUDJ1VzRUdGVs?=
 =?utf-8?B?S2FBVGJKeEtrb1ZYY2lYTm5MRnZYSDcwRnVDankrdlY4UDRIMVZtdjZKbnk3?=
 =?utf-8?B?WWVna0Q3cGtJVU1pMUhhRWFVc0xWWGxXRFlOanZORU1wWUkyN0ZQQndQUU5T?=
 =?utf-8?B?UmR3M3h6ZFdObUxKMmcyMzJYcUxscTIzWStKdXl6d083NUt0MTNVdXpBRXUz?=
 =?utf-8?B?VHF1OXdyRXFjQzR4NjhyTG94TDdSaFpBY2phS21xbHVBVHcwY3BzZmNSaFpQ?=
 =?utf-8?B?N2JFV0JXS2gwL2NPOUpvT3l3YzI4cFcvSHZPa0hYNlUvenlNbFBSdmhWWjVE?=
 =?utf-8?B?Z3NBaTJaaFo4ZE1haFZSSFdQVjdpSTRVLzdxeFhDN1B0ampSTEhVa1RNdzM4?=
 =?utf-8?B?MnIwZkJYQ1RyUmdaOU95VG5yU2R6dk00T1U1aE1KcXpSV29vTzZkYXVnR1Fz?=
 =?utf-8?B?Qmt5anc5NnEyeXlSZ21LSE1iWXFQbVpPWHIwUTVvdXdHU2cxcDFwN1Z6U08x?=
 =?utf-8?B?dnJVRGJSc2NMYVN5VHZFMEtjQmptRzBicjlBTy9IT1ptb09jNG9EOTJTcDdi?=
 =?utf-8?B?VlRZM0hJQ1V6NGdObnlXMWVHNys2dExPZDVQZWdvY1VUbVorZjZTRkx2YmVo?=
 =?utf-8?B?cS9NbVFEM21ZZmtzUnVIWjRqTm45TGZzQjhvWUZadyszbTlFUHd3dFdXRFdS?=
 =?utf-8?B?QlBIVm5OMHZGWEFqR3lMTkdZSnZZbkVFSWRySnp2dWNqY3hFUnRuRzVyTVVU?=
 =?utf-8?B?U0o4WUZzUFUzNVk5TkIyUVc1dnMwTENEV1l5M2pnaVFmZUZKcHpJa1lzZXVE?=
 =?utf-8?B?S2dEcmpTZiswQ0JEWG9TVnZrbWx3eElVQnYyclhvUDg0alF1Z05KL0N5aWxw?=
 =?utf-8?B?VytSZTVWQzIrcmdKSS9QMWxJYWRSTXdYbmVBMXZ1TkczR01yakxhTTI3YVVN?=
 =?utf-8?B?dkl2NVhvUHhnazFETzVVTDRwRFNOTlhQMTJLdks5VFZwbUdBeVpJc2dXYWZW?=
 =?utf-8?Q?XSAeU07jdoXNsS3A79gTr29yP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a55f0e-e95d-44f9-25c8-08db18ce3ef7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 14:23:50.4896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2t+LrVnCWu6/B6RZKDQHAVDhjq05XljJWajKZmmpswTFBkKgit0ucYpR1Yy1vkFKAAhkezaAhZY2pzWmAoS6tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9462

On 24.02.2023 12:31, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/common/bug.c
> @@ -0,0 +1,109 @@
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
> +
> +/* Set default value for TRAP_invalid_op as it is defined only for X86 now */
> +#ifndef TRAP_invalid_op
> +#define TRAP_invalid_op 0
> +#endif
> +
> +int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc)
> +{
> +    const struct bug_frame *bug = NULL;
> +    const struct virtual_region *region;
> +    const char *prefix = "", *filename, *predicate;
> +    unsigned long fixup;
> +    unsigned int id = BUGFRAME_NR, lineno;
> +
> +    region = find_text_region(pc);
> +    if ( region )
> +    {
> +        for ( id = 0; id < BUGFRAME_NR; id++ )
> +        {
> +            const struct bug_frame *b;
> +            unsigned int i;
> +
> +            for ( i = 0, b = region->frame[id].bugs;
> +                  i < region->frame[id].n_bugs; b++, i++ )
> +            {
> +                if ( bug_loc(b) == pc )
> +                {
> +                    bug = b;
> +                    goto found;
> +                }
> +            }
> +        }
> +    }
> +
> + found:
> +    if ( !bug )
> +        return -EINVAL;
> +
> +    if ( id == BUGFRAME_run_fn )
> +    {
> +#ifdef BUG_FN_REG
> +        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
> +#else
> +        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
> +#endif
> +
> +        fn(regs);
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
> +        return id;
> +
> +    case BUGFRAME_bug:
> +        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
> +
> +        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )

TRAP_invalid_op is, as said, about to disappear on x86 as well. I think
this construct wants abstracting by another asm/bug.h provided macro
(taking just regs).

Jan

