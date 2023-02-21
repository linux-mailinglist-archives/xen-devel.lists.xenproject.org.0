Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D619069DF37
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 12:47:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498830.769762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUR6k-0003fm-98; Tue, 21 Feb 2023 11:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498830.769762; Tue, 21 Feb 2023 11:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUR6k-0003cP-67; Tue, 21 Feb 2023 11:46:54 +0000
Received: by outflank-mailman (input) for mailman id 498830;
 Tue, 21 Feb 2023 11:46:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUR6i-0003cH-Po
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 11:46:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5789bb8c-b1dd-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 12:46:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9256.eurprd04.prod.outlook.com (2603:10a6:102:2ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Tue, 21 Feb
 2023 11:46:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 11:46:48 +0000
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
X-Inumbo-ID: 5789bb8c-b1dd-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HevpR9SYzQGTzN7lHC0BHvxnoAGi7Z73y9Urf0f1fhyi4poQk6fcvbtNFMkXiLGJ8Fig2tOzfajQZoGX2RUWRwish2HVRY/L5wiylnzUufwKU5xeRxrnolJ7e7ysRIamfW8Um9f7Mrj1xK834xzewePf4iGJCo2tfvywd630jGJvfZ7yLBJE3O9aYwyX59LdUR1l+fQy7x9Xy5WNoUNqZgJYwgHZ0FjdJHRsJSV1/gxsRB2V+hY2FlHDzGUoQU5o6r503NNLQxstYYzI+neOKYwLwhg9OcO3pbXu2Es/xkU1xhvFee89jTlaTWb08ELS9m4D9rn8mlRMC7yMl7XOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eXlZA1QoDOm9OHGtcFI8UbVABcXIw6qHaZQ04e+qj8=;
 b=j03TJpcJkGtjngs6+6m9VLx5McA4d2PXLDRN5crcuZtAPp3VkSFDxJTqI7bN7py3hLrk29Plx2tQq1G2KyozPVhC1pBqrnScHukstgiMFgpKN+Lj+q7Yog60rr3/0dc6laRhIwsJeOSOUs9iVNaQD8nengDKRZyx8/ADuau20GeL9yb6m1GbmKMJ7gyWCQSHQBNUkg7fBbh8b2iI93JaPgY5cyvkF8xr1xmHFu6+f9+r2YdCQtmOop9MUMglmoNNqBznP+w9wpMV+qLsrymZB1X6dNSF6h21kKWpZfjx5QdIMauNCjKX9AucL99+pY6XyHHxC+wobKe1WSW7ndd2Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eXlZA1QoDOm9OHGtcFI8UbVABcXIw6qHaZQ04e+qj8=;
 b=f7Eka1XnIl+J59KDIKrY6HBSPxCXXcBM6+PKloi9IK2lV6nTz/jr/+58Vo+I0lgjoLhffXhW6JbSXK5r/hfEqiw+xC6NMI1C4cFxmo9pH1EKWqxuQpPr380kO+N9QW3zwo+4yYqu0I1vZ4MFINSqE7WZ8XePRh4diGNJgRR8KFk4Sxp2uvkb/38dtmWdYRkGoTK6plOk8xFhsJefu/r8w0jbw4/GGt0876TLBuDk6CZrK1XMtEqHoNuqyIu6GfeF+ZuGK7+61lttrAixvHmnLUwcaX9575wjUrh7kJ+aygdsftU1z0kGu20+cEUZlU0hmTqievn8+KeGsn2pWFtWRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49542663-d21e-6af2-42e6-bb28397b9e57@suse.com>
Date: Tue, 21 Feb 2023 12:46:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] x86/entry: Rework the exception entrypoints
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230220115956.1522728-1-andrew.cooper3@citrix.com>
 <20230220115956.1522728-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230220115956.1522728-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e58efce-9ad8-4e08-123d-08db140150af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A3eDdudGl7aAJ5mIcGnyqSQmFHT+VS81Jp1pNsaI4qIk8cIX0X7smlZr3233aw43QL+yWFNDmxmsh6jpDMLNR4tOJG6tmZuzPo5RaYwZuDNM7h806f7/CrR+aOulmf3zUMO0DVvl8HEIVn08TlfLqoZdRjaY8F/MTR2xdBRZyruQ9D32F6E6lw/Je5DVcIxZbSxsVKDS2+5zH2WPu5GaWjU8yGQrFqdX0MxZgUUXGMsFml/W25VOuUz14J/Pnhp/S3Pl5NwgDXE6VZrr8OuM0f9YggKg3fu7s/s3sP8aPKOv6gW0nKeDGKaduxIgsEJmzFvVtmXrrhqNgjITP3TETUEE6fIRSPkn0EIp2YtZiZgeMrbN5yLIsZ2AqKIW771UPP9R63f77chQDb/S4Qgeh+PFTRNUe1nR82QmVs70Z3+Gd8cpoNKXBPlZpaH/EYRc+nMKW5yOlxqpRqMULlTfyXL/HNIdB6vTYI+O27qprRVJe6lzAZNaMvALu8ncqQueyKTCNyU0Glw+ibugczCnW1xkvWt4Rjn7T0wb628Kvvdy82vHPbXWba3y1UrIs47lHhrX5FCcwfS8zOfGDLjahnQNtYrwpPBrUmxqituN68RQsKvuJe4c7Z3M7Ia1cu36pQzZO8KRYEYr+gpMmB+UAVbuw07ZbdhxAyqz4E1glFt3DtSc5ZbhZoWW80A7qMhdDWOL7f9gmTNeX1xmkUSS+op+xSohSnwKY0rH634EUTo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(366004)(396003)(346002)(376002)(451199018)(26005)(186003)(6506007)(38100700002)(83380400001)(6512007)(5660300002)(8936002)(53546011)(2616005)(6666004)(31686004)(66946007)(6486002)(478600001)(4326008)(6916009)(2906002)(31696002)(54906003)(41300700001)(66476007)(8676002)(66556008)(316002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDlvV0Z3dDdhTkcvTlA2bndyNU9YTy9ra2VFTzc4eHhnSGZ1dkMxZ29XYzdq?=
 =?utf-8?B?emRrYWltWEFzRHVIV3ZYMTFCbDk4TzNwcXNMUTdXam5ma2o5Ukg4NHlKY2V3?=
 =?utf-8?B?anE5REZoWko5aU05WXRFTEZ4ZVdHODBxZUM0UFlCRDd1ajkyNkVjUEd3d0NZ?=
 =?utf-8?B?dTBUd0lUUXVIZHpjS29NUy9xWis4ZUx5NnB6UTZ4cDIydEIwSGhpa1ZnRUEw?=
 =?utf-8?B?MTJodmZpcSszbEcvVU9BVDRKdVkrZG8xVE5EWmR5VDdlaG1PVmJZWU5JQVlm?=
 =?utf-8?B?a2YzVEF6WUtQL285a1BmV1N2UjlBS0dpT0RpcjB0WEFDL3B3b0dmUjBiUkhP?=
 =?utf-8?B?RW0wbmdSMTd2Zk5aeHd0M1dGUFFhQ240aFgxakZ1Y3hVNmh3Y3plUytyZlVE?=
 =?utf-8?B?Qm9qYzhSenFRbUZndXZ1MmhyTUlsb2o2aWh2SlZFM04xcWxqWXFpMmRUYk82?=
 =?utf-8?B?c2ZuSkE2eTBRUW1XWlVBaEhBU2tWWFg5TXovWktOSnplM0VVRjd1ZGd4VHRB?=
 =?utf-8?B?VXByaE5TQ3I0NEg5SWgrNTZGUlQvTCtjZ3c0cXFMSmJrTDdqTVhXM3NuVXNr?=
 =?utf-8?B?VjA4RVJlUjJzam50Y3J0V3VGVi93a2lQOFhwZE1vRUZ5K2s4cDd5S1Npb0VS?=
 =?utf-8?B?d0hyQTlmZXFyNk0wWklycUpnUW9ldlBEU3Vpb1VoWWZ6am5rR2dDYXFUNUsz?=
 =?utf-8?B?MFlGME1SaVJiWFVQS0l5U3FnRVJ4T2hPU09OWmVoZGRMTFRvTGw0aFU4a2tB?=
 =?utf-8?B?K3o4cnREelBaOExtTWxlYkxNSFlTNVpxMTNLb05CeWw1SVh0YjVnTEloKzUr?=
 =?utf-8?B?WC9RUFNRQVEveG92WXBNZTh6dlNheC9LVzRsQk1sZzFFNTdVQXhDQjZmdURD?=
 =?utf-8?B?OHh0VmtRM3p0YUJzYUE0WWNyNHkrRUtGbUxFa0wzemxwcUdsZjU2bjNVcHhv?=
 =?utf-8?B?anB3N1ZGYjBjTnMwOVpZNzk4TWd1YXJzOXdDL08yc1lnN0xpTXRJcTI5dHg5?=
 =?utf-8?B?MmdubTZuRlptcndDUFJCandoSDZDcFU2TUZVV0JaZ1JER012anBkaGVaOEdO?=
 =?utf-8?B?TnZlaW03ZWhibS8rcnBwRGNvWU9mOU5HcGV4YnFKN1RydjZmNEVBdlAwQkI3?=
 =?utf-8?B?NlRUZE5QYTROQ1UrdGgzRWZYblJ4ZkxqdkNjbjZtdnVrZHF1SzBGdjFOdW10?=
 =?utf-8?B?blZiQ1IrZTVGYUxUcW1MbDZiRlROZGhOUnAvVmVUQnVxTXl1R3o5Q0Z4QWxV?=
 =?utf-8?B?cEZqYlhHTm1RWmFQeFU2V2tuT25yOWp4NHdjRlZ3TTFnOGxobnNDSkh0T2xJ?=
 =?utf-8?B?M3lMMk5RZWdpM3IrT1VsQURUK29nSE9YTitlVVVCWjFGQXZDMW02aVpRbWZv?=
 =?utf-8?B?ekM4V0QyaVU0YWpNV0g2VWpDZWR1aVJndzhob1JrREZZODNxUGF5eC9NRUtJ?=
 =?utf-8?B?TXAzWTlpa1V6ZzIvMkxkQUEweklsN0lLZmNPNEtoZ1paQ0xqTkQyZjdEM2pU?=
 =?utf-8?B?SWE1dk9WdXg5NDlJcUFmaDFjMU44YWZqazBTZG96UW51d05VQVRlZG0zZTVN?=
 =?utf-8?B?djRWd3B0dk55K1lyU05VRDFOelZTMlpzbEw2emp6b1dneWxscGU3SHI1VGUy?=
 =?utf-8?B?ZmNUaHZIdm9xNkVHUW1JRUprWThoZjlYYXQ4Wi9OUWhxRjFiUS9GeWRkMWJU?=
 =?utf-8?B?d1FWQjZDbFpnNmRUc1A5UmV3TVplNzBXemsyMnhHWVhmNjJGWkdtNlBOa05T?=
 =?utf-8?B?dTJXOW5sSUhMYStDVm5KSk5ScHNVUDBtUU5tMXpnRUhmRGJoOEVQdkZBYklP?=
 =?utf-8?B?MlJYSlkzQUJMT3FPRXBsbUtwNCtPME9YOHJGM0J5Q3ZOeEFDbTFaYU1JS2Vt?=
 =?utf-8?B?U0l2NndFN2laaXNxZ3dKaVlsYnBPU29pUVBrQ2FvcFYxUnhIMWQ1MlBvZ1pl?=
 =?utf-8?B?azZFVmh0UEJ3UjJzQll5RjJ4WEp3K3E0dFlxKzRlNm9NT2dTT05FdzhBcWc5?=
 =?utf-8?B?cEQySWhPTGZGNVoyMzhLZ1NmanA0djVoYTZjNHp0OU9CWlc2YnQ1ZC9pVEo4?=
 =?utf-8?B?eVdYaTF0aXd3WUpHc0txNkNFa2pXQnlMVUdZNkg2QzhPTnorTTN5OG1abmtK?=
 =?utf-8?Q?fikdVsbtRHYf9LCG91ZMBmxAY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e58efce-9ad8-4e08-123d-08db140150af
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 11:46:48.5793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQ7Xw7YxjpXpiZcWJKn4EUGlyObn9XdMsTc8GJxlhKoTSJw42YRPFfFnvzbkDqi3Dqu9eixsEWNx819DkBxdrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9256

On 20.02.2023 12:59, Andrew Cooper wrote:
> This fixes two issues preventing livepatching.  First, that #PF and NMI fall
> through into other functions,

I thought this was deliberate, aiming at avoiding the unconditional branch
for the most commonly taken path each. I'm not really opposed to the change,
but I think it wants saying a little more as to how little (or big) of an
effect this has (or at least is expected to have).

> and second to add ELF metadata.
> 
> Use a macro to generate the entrypoints programatically, rather than
> opencoding them all.  Switch to using the architectural short names.
> 
> Remove the DECLARE_TRAP_HANDLER{,_CONST}() infrastructure.  Only NMI/#MC are
> referenced externally (and NMI will cease to be soon, as part of adding FRED
> support).  Move the entrypoint declarations into the respective traps.c where
> they're used, rather than keeping them visible across ~all of Xen.

What about Misra? Won't they be unhappy about global functions with no
declaration in any header?

> Drop the long-stale comment at the top of init_idt_traps().  It's mostly
> discussing a 32bit Xen.

The use of interrupt gates isn't 32-bit only, and justifying why trap gates
aren't used looks to me like quite reasonable a purpose of that comment.

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -142,6 +142,50 @@ process_trap:
>  
>          .section .text.entry, "ax", @progbits
>  
> +.macro IDT_ENTRY vec label handler

As said in reply to another recent patch: Could we agree on separating
macro parameters by commas? I also wonder whether they shouldn't all have
":req" tagged onto them, as none of them is optional.

> +ENTRY(\label)
> +        ENDBR64
> +	.if ((1 << \vec) & X86_EXC_HAVE_EC) == 0

Nit: Hard tab slipped in here.

> +            push $0
> +        .endif
> +        movl  $\vec, 4(%rsp)
> +        jmp   \handler
> +
> +        .type \label, @function
> +        .size \label, . - \label
> +.endm
> +
> +.macro ENTRY vec label
> +        IDT_ENTRY \vec \label handle_exception
> +.endm
> +.macro ENTRY_IST vec label
> +        IDT_ENTRY \vec \label handle_ist_exception
> +.endm
> +
> +
> +ENTRY     X86_EXC_DE  entry_DE  /* 00 Divide Error */
> +ENTRY_IST X86_EXC_DB  entry_DB  /* 01 Debug Exception */
> +ENTRY_IST X86_EXC_NMI entry_NMI /* 02 Non-Maskable Interrupt */
> +ENTRY     X86_EXC_BP  entry_BP  /* 03 Breakpoint (int3) */
> +ENTRY     X86_EXC_OF  entry_OF  /* 04 Overflow (into) */
> +ENTRY     X86_EXC_BR  entry_BR  /* 05 Bound Range */
> +ENTRY     X86_EXC_UD  entry_UD  /* 06 Undefined Opcode */
> +ENTRY     X86_EXC_NM  entry_NM  /* 07 No Maths (Device Not Present) */
> +/*   _IST X86_EXC_DF  entry_DF     08 Double Fault - Handled specially */
> +/*        X86_EXC_CSO entry_CSO    09 Coprocessor Segment Override - Autogen */
> +ENTRY     X86_EXC_TS  entry_TS  /* 10 Invalid TSS */
> +ENTRY     X86_EXC_NP  entry_NP  /* 11 Segment Not Present */
> +ENTRY     X86_EXC_SS  entry_SS  /* 12 Stack Segment Fault */
> +ENTRY     X86_EXC_GP  entry_GP  /* 13 General Protection Fault */
> +ENTRY     X86_EXC_PF  entry_PF  /* 14 Page Fault */
> +/*        X86_EXC_SPV entry_SPV    15 PIC Spurious Interrupt Vector - Autogen */
> +ENTRY     X86_EXC_MF  entry_MF  /* 16 Maths Fault (x87 FPU) */
> +ENTRY     X86_EXC_AC  entry_AC  /* 17 Alignment Check */
> +ENTRY_IST X86_EXC_MC  entry_MC  /* 18 Machine Check */
> +ENTRY     X86_EXC_XM  entry_XM  /* 19 SIMD Maths Fault */
> +/*        X86_EXC_VE  entry_VE     20 Virtualisation Exception - Not implemented */
> +ENTRY     X86_EXC_CP  entry_CP  /* 21 Control-flow Protection */

I expect you won't like the request, but still: There's a lot of redundancy
here. The first two arguments could all be folded, having the macro attach
the X86_EXC_ and entry_ prefixes. Or wait - only quite, as long as X86_EXC_*
are C macros rather than assembler equates.

Jan

