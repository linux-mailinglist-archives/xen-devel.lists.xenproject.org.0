Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6976ABD0E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 11:37:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506879.780088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ8DT-0004Rf-HI; Mon, 06 Mar 2023 10:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506879.780088; Mon, 06 Mar 2023 10:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ8DT-0004PQ-EC; Mon, 06 Mar 2023 10:37:15 +0000
Received: by outflank-mailman (input) for mailman id 506879;
 Mon, 06 Mar 2023 10:37:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MPo4=66=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZ8DS-0004PK-4V
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 10:37:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db08a082-bc0a-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 11:37:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9445.eurprd04.prod.outlook.com (2603:10a6:102:2b4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 10:36:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 10:36:44 +0000
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
X-Inumbo-ID: db08a082-bc0a-11ed-96b4-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuUYYccodyPOSSLozp67m0IxpnKNgULPa8+QFR0g9nNHskimkGzaOwWXZaUjJSeZPzPYTAj0h5Vs+F4zVmIY6NbHhjUt4ulj14xe2/f7t1y+/yJz75cwmFjYbWxNI8ja94dOSUM8VZyxXro3xhkAuTlyCSpZi6XY3eNAXWnZPiOwtQYZSjAPgui/vBBjR/Vo/csEb6yLoxjf9s8hYDsiKJzhHg+TA53CNTsLBmUPzqTUSd4EaFh5BhydBXlyQeSMWll2rQw9Ki89Go7Ded6Jd1nGOAI3XbPzT82u1zb4O7t61082TU4o1x5Oh78gqy3NF22eJC4Fbt3w3R7N0KNK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjV7+76idGZtPwDM4jutpaCQclbaHRpaK4nKzjauz9A=;
 b=BH5icuLCr09nHoiNrJXxbAA5Ojz7qvpUktqLu1xRx1r2fqxQSasrWlggaNc7rLcyYjRzGehe4vlAX/epHwZhUa9OfjIgviH0i+KKCp7v+1IzJGPqGK5gmeO4SxGBAd+VOUNIg8gKTLJIyWcQ8nN9sktTye9eZhPCePNKpebHo6GTIlwdp6Lwjqb+qoexUKrQlAOp30q/tewZLze1mpgcCAawBjruFf/BjzltBN7oxWurd5Kk/+MArWCMC0JwO18Dcc7F3jWFppVdlOaXaMK/32DCpo8Oqenpc1ZoKxXyFV4UmAavh2EYLMIkTGsFeTqmNOL7d7DVOqUL4WXlNN4D3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjV7+76idGZtPwDM4jutpaCQclbaHRpaK4nKzjauz9A=;
 b=g0hvsb3MdIf2LaQsByBAKJlQ6IVBWkkvl7sszZiser6dx81fTuM+0RftOgGvNQ+SGnp7M6NIECa1yk7MUvCRdsdg+LGDV8Qzc8tpK4eqfIrb7clH9VQPeJEaH0HA/r3oSjVVktQx2kBKOnSGuINx0cluc48KQ8xFc4cYARjSSq8DzE73/7ODhxXWRN5+UiIxCed+iGku7/Za2gLw+ShDDCE+wTl4ianZlzkf59WLLncYMwMCstWUMQ5oUtF3/z8OJs8kfe60ttzloDa7lI646EUxd00W0rrcu4T8ycYnLb8U/RPvjfhnObabSoyS3G0LwgE9E5ZA14FExhLSYE4dBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a7920d9-9622-195c-2706-2b435c2c856e@suse.com>
Date: Mon, 6 Mar 2023 11:36:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 4/4] xen/x86: switch x86 to use generic implemetation
 of bug.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
 <4a478638449e66a76e1671db38ec29b9e3108201.1677839409.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4a478638449e66a76e1671db38ec29b9e3108201.1677839409.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: f9acdd32-d86d-410a-1264-08db1e2eadfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QseKEVhSoG1JRCmIrSKOHlX8u9xQ6uqdqEJZteVVMdWezkSyVJus4YPOoVTtjLpqyJ1uNtEyyExSz92k9Tl9SuoPN5n069A7k+Cw8tm+Tbs3h0jW/MLn+iUGL9inx7g8+O+E0o29HXckXpD8K+GcPpWEg3ghZmTAM4qfHroritJlIIT/vZ9dwuHYBGFRSMfRPQ6I+JspOMsuscq5l2Fz3KsuuU2RQcDspMzjSNe3gmoamCaRwQ9rSNAw/d5TKRU0WPoRJ8QyuxuzCwyAlEQ+Mt/ZfF81nDhNvstwW/knmegDbLsynLGJY0lXwzphKN2bzwHzxIafaUI42GJmBz+JFoIx7tNVesLmJNYUAwQmbJNo0w8b6t70kpCnsJdXegjH5LZmAZFQE0EKb/50PF1F/wiHgIXDkAU45d8YhsEdLvu5+egvAOneAzeIrRPaTs/LJWm853q8clrIVGx65wl2oAb8OGsUoAdN5C0GcFolQZAJJLM/D+wW/4vc7nH/HoDSaqXWaomvA+ggeY8lQtd5QTW8qPpNDhtCtpOXEZ0QxjRdgq28o+APqKV5ogfnIbA9vuC43S7KCJ7klp82ZrJqf/OqMbAv4Yi4BUuSuGdyhmzhnDaBsvxTZeHXlj3SwJvrXZboSEIc7WEtWKzOlw+NyTU6sK4Z0jIkKh/7xLr9Swg9cSoM5q9DwsEll177SGasAWY3I6ktwt1Q4J29Sqpa8NPqJOKk7D22D64nBrKywex98g0MYxwNHN7btEkYAErf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199018)(31686004)(54906003)(36756003)(6486002)(316002)(83380400001)(86362001)(31696002)(186003)(2906002)(5660300002)(66556008)(8936002)(6916009)(66946007)(41300700001)(66476007)(4326008)(8676002)(478600001)(53546011)(6512007)(6506007)(26005)(2616005)(6666004)(38100700002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjJKazFZeGxodWJTeVlpNzU1UUYyRUZLRTExVFc4N29GNGRUNXpraytDdGF2?=
 =?utf-8?B?U2Jkb0FpY3piZ1prbTVmb1ppWGp3WjdPNTdodWE3SVdNaS9ZdDZ2bGR0OHhC?=
 =?utf-8?B?MXdSZHR1V29CUGZncWpKMm5aZ1pBUFhUL1A5UEJlNGZYNXpTSzdwbTl3dGhK?=
 =?utf-8?B?c0xOQnpOYTJRTWViWVk1SkpNOFNZMTJZcjNiQXlENU11cGZyTFFZNFA3VWxq?=
 =?utf-8?B?QjRjRWVFYVdkL25OU0JneVVtUjZ3cWxrVGxKT1hkRDNzNVBPY0N4dnl1eEtw?=
 =?utf-8?B?amMyRndVOFJ1Nnl2ejJ3M1NWNjF0VXdQVEluamhrRGNheVliTHRqQjdlNmM0?=
 =?utf-8?B?ajVFVHdjL0gxQ3JNb00vMm9LaktOb21oVm5KVnRJN21IQUxENmJObHovMmhz?=
 =?utf-8?B?Tk0wbEZONjMzcHZ1U3ZiSVgydlhIL2U3eVB5NEw4bmtUZGFnNjBrWTVkejh5?=
 =?utf-8?B?dVpxZVVydVFiVGEzRndRekVXN3lHaG9TajhOSDUrbURiUlZKY3J1UjFKcitT?=
 =?utf-8?B?UFZsTFRKcHBGa1VNR3F4b3E1US9jOG1QUFFHQy9oOVhtSXVoc0wyU0t6ZnpT?=
 =?utf-8?B?c0NseUo4bkIweHdNZUhOZStUczIrRDM2a3NNWHRtWDNVeEZBVGsvaTIrTWFI?=
 =?utf-8?B?R084YWNrQ3hyS2tqTHo1Tm1JcVVzVkJ6a1hjSnFpOEV6aWoyN3J6Um9yQXVk?=
 =?utf-8?B?MWpUOFp2RVNkbkR5WllNaVEyMmJTREhLOGlZYWpCQjZDZTB1b0pkbGNSRk54?=
 =?utf-8?B?QlhXSG83a1NmK3NmWWlIYzhlVE1XbUJ5QnltMTk3TjJTTnF1RFRvVlhnYXJi?=
 =?utf-8?B?Z2pDcGRRbGtENVVUMFBFUGJvcEFHUUZLZGZ6YUNpL1lZYWc4ZGlLNHJLS0sx?=
 =?utf-8?B?VEFHd01oYitXUGNOWThBMUg5ZTQ3a2haTWMxYnV3TW9qenk3Ykg5YXdNb3lM?=
 =?utf-8?B?R2VkbWVsblpNdDV2L3lvV0x5V3ZhVzlLWE5vcWlMdmxzNU1XTnVUa09lZFcr?=
 =?utf-8?B?TkhTSjlDSmFYbU1QOVVQZ2NTYktjTHRFQWVpMDQ0cUZoVGgwanozYWZZMXRL?=
 =?utf-8?B?SEVsaGdtcWZrMllmZ0NVeUR4dkIxY290QXpRSUlnbzZLUWpsa2E3dEdRcHRI?=
 =?utf-8?B?eEo5OFBKUEZxaTl4ZUlFSnNZaThvT1NiYndaRkJNaUkzOUR2bTZvc2hBZTRC?=
 =?utf-8?B?MVJFYnNjQjhGam5VMlY5cTlEVVRmYy9id0dqOXE1UEMxNk5majRKWlRCc1V6?=
 =?utf-8?B?SUZRWjROUVB0UmhvaWJoenR2UWdHQzh0VzE1YUZtUUduZmZUaEYzOXJmSE9E?=
 =?utf-8?B?cTg0Y2lBZmtpcURTcXJlTEJqb3FQOFNPVU5LL2lDTGtsa1VjSVBub3RQRysr?=
 =?utf-8?B?TThwYmxtNllMMDI4ZG5SQzBIbEFTOTJaUFZid21WYm4xS2JaYVpaMkNFWjVR?=
 =?utf-8?B?d1lsV2wxYkcyRVRJdm4vRC94WGpLU2NOZnh6cmlOMGFhUlVDcXhLM3dFNXRC?=
 =?utf-8?B?bTNCK09SNkxGSHhZSUdMdG5qUUd5Z3JLSXoyNmxEZXNrVlRYdno5cU0ySVM5?=
 =?utf-8?B?M3pzeTRKZ3FLcER3N296bzFJV0w0TXJVSWF3SmxJMy9vZnhvQUVQTUtMNzZk?=
 =?utf-8?B?aHI2MnV6SjU5UmNWOVcvdDNrWVdvc3RzTnlnQWJOMXJMbGt5K2d2UnhTVUY5?=
 =?utf-8?B?T3lTSlBoV3lWSmtBaDRuOU1GcklUaFRNbWpiR3YrbDVzQmhxR3RqdXpEWmt3?=
 =?utf-8?B?dVBxWTBMQklibWt0OHdSR25Uc0E2cmN6Mm1COUVvZ0RZVGpheXp0WGtLYnN4?=
 =?utf-8?B?OVJBZWdzQ3VybmJCZlNWRnI4WnFGb2xleFRXVHFpeXVIeFJtcHdPQklEVmR0?=
 =?utf-8?B?bUJuTDdCbFI1Wmg4SGdiTnpJTXlhenhPTVZMbmNyUDlNOTFwZDRDRElaSHRW?=
 =?utf-8?B?elI1cVlLdjBwRm1qY2sxT08wcGxTYmgrbExoL0wrSUZhSTg5SEdHUFFvYmJM?=
 =?utf-8?B?eU5ZT3JWZUZ1TXNhUDFReFhNa0MxbUFNM3F0WEMwTWw5U21GYUdNVjU2S0RX?=
 =?utf-8?B?MWVGRzNoYnk4cTgxNzNLRG5EWE53ZTd4SllpNURSa3hDcGtoZDRIcGtYYXJQ?=
 =?utf-8?Q?Q7NeLM/VMypA6OPJI13GwtWbU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9acdd32-d86d-410a-1264-08db1e2eadfd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 10:36:44.0523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgmK1mBQSsZxO3wr9whux2+38Ar/rflSvTNsbrnXU9ycKCrgDSgk1f3GimZu5Hgifxq3b7cMop9DjrsixuvSyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9445

On 03.03.2023 11:38, Oleksii Kurochko wrote:
> The following changes were made:
> * Make GENERIC_BUG_FRAME mandatory for X86
> * Update asm/bug.h using generic implementation in <xen/bug.h>
> * Change prototype of debugger_trap_fatal() in asm/debugger.h
>   to align it with generic prototype in <xen/debugger.h>.

Is this part of the description stale? The patch ...

> ---
>  xen/arch/x86/Kconfig           |  1 +
>  xen/arch/x86/include/asm/bug.h | 73 ++----------------------------
>  xen/arch/x86/traps.c           | 81 +++-------------------------------
>  3 files changed, 11 insertions(+), 144 deletions(-)

... doesn't touch asm/debugger.h at all.

> --- a/xen/arch/x86/include/asm/bug.h
> +++ b/xen/arch/x86/include/asm/bug.h
> @@ -1,79 +1,12 @@
>  #ifndef __X86_BUG_H__
>  #define __X86_BUG_H__
>  
> -#define BUG_DISP_WIDTH    24
> -#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> -#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> +#define BUG_DEBUGGER_TRAP_FATAL(regs) debugger_trap_fatal(X86_EXC_GP,regs)

Along the lines of a comment on an earlier patch, please move this ...

>  #ifndef __ASSEMBLY__

... into the thus guarded section.

> @@ -1166,12 +1167,9 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>  
>  void do_invalid_op(struct cpu_user_regs *regs)
>  {
> -    const struct bug_frame *bug = NULL;
>      u8 bug_insn[2];
> -    const char *prefix = "", *filename, *predicate, *eip = (char *)regs->rip;
> -    unsigned long fixup;
> -    int id = -1, lineno;
> -    const struct virtual_region *region;
> +    const char *eip = (char *)regs->rip;

I realize "char" was used before, but now that this is all on its own,
can this at least become "unsigned char", but yet better "void"?

> @@ -1185,83 +1183,18 @@ void do_invalid_op(struct cpu_user_regs *regs)
>           memcmp(bug_insn, "\xf\xb", sizeof(bug_insn)) )
>          goto die;
>  
> -    region = find_text_region(regs->rip);
> -    if ( region )
> -    {
> -        for ( id = 0; id < BUGFRAME_NR; id++ )
> -        {
> -            const struct bug_frame *b;
> -            unsigned int i;
> -
> -            for ( i = 0, b = region->frame[id].bugs;
> -                  i < region->frame[id].n_bugs; b++, i++ )
> -            {
> -                if ( bug_loc(b) == eip )
> -                {
> -                    bug = b;
> -                    goto found;
> -                }
> -            }
> -        }
> -    }
> -
> - found:
> -    if ( !bug )
> +    id = do_bug_frame(regs, regs->rip);
> +    if ( id < 0 )
>          goto die;
> -    eip += sizeof(bug_insn);
> -    if ( id == BUGFRAME_run_fn )
> -    {
> -        void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);
> -
> -        fn(regs);
> -        fixup_exception_return(regs, (unsigned long)eip);
> -        return;
> -    }
>  
> -    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
> -    filename = bug_ptr(bug);
> -    if ( !is_kernel(filename) && !is_patch(filename) )
> -        goto die;
> -    fixup = strlen(filename);
> -    if ( fixup > 50 )
> -    {
> -        filename += fixup - 47;
> -        prefix = "...";
> -    }
> -    lineno = bug_line(bug);
> +    eip += sizeof(bug_insn);
>  
>      switch ( id )
>      {
> +    case BUGFRAME_run_fn:
>      case BUGFRAME_warn:
> -        printk("Xen WARN at %s%s:%d\n", prefix, filename, lineno);
> -        show_execution_state(regs);
>          fixup_exception_return(regs, (unsigned long)eip);
>          return;
> -
> -    case BUGFRAME_bug:
> -        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
> -
> -        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
> -            return;

This and ...

> -        show_execution_state(regs);
> -        panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
> -
> -    case BUGFRAME_assert:
> -        /* ASSERT: decode the predicate string pointer. */
> -        predicate = bug_msg(bug);
> -        if ( !is_kernel(predicate) && !is_patch(predicate) )
> -            predicate = "<unknown>";
> -
> -        printk("Assertion '%s' failed at %s%s:%d\n",
> -               predicate, prefix, filename, lineno);
> -
> -        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
> -            return;

... this return look to have no proper representation in the new
logic; both cases fall through to ...

> -        show_execution_state(regs);
> -        panic("Assertion '%s' failed at %s%s:%d\n",
> -              predicate, prefix, filename, lineno);
>      }
>  
>   die:

... here now, which is an unwanted functional change.

Jan

