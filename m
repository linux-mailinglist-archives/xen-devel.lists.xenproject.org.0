Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111D04592FF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 17:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229014.396348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpCAq-0001Ik-CG; Mon, 22 Nov 2021 16:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229014.396348; Mon, 22 Nov 2021 16:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpCAq-0001Fy-9E; Mon, 22 Nov 2021 16:28:08 +0000
Received: by outflank-mailman (input) for mailman id 229014;
 Mon, 22 Nov 2021 16:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpCAo-0001Fs-VV
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 16:28:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bb97143-4bb1-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 17:28:05 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-5jWlLHXSOSG9MvnZE8JGeA-1; Mon, 22 Nov 2021 17:28:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5326.eurprd04.prod.outlook.com (2603:10a6:803:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 16:28:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 16:28:02 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM0PR08CA0022.eurprd08.prod.outlook.com (2603:10a6:208:d2::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 16:28:02 +0000
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
X-Inumbo-ID: 2bb97143-4bb1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637598485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/I61sKAen1gq7loaUN2VSyaPouvanSJgP0jD3oREJAA=;
	b=AVquyqNBykSq00iGwrQqwvaDESPIfMcSLAiJ7y7BdO0qFKwSW632iZMRFsuOiwrK0uYSzu
	7j+ZeFYM6uFZLPfeVOK3z0gGRU41AZV/fRbKZgytKv9tUcwPVy0ILFwryQa+VlZQH2be0V
	lf24PPZKoqmJXzSAfOj5bvy3VCXwViI=
X-MC-Unique: 5jWlLHXSOSG9MvnZE8JGeA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDSlPzwgM35D2Nlv1rYd4m01kLYRPtcqsR+yrqtyNn3xApwKXOq9Jh3kHutAWyxCmnjz7f57Xyg77f/3UMlIkH69fN8se5NfLML0g76C22Drx/5zXVICTO4tQB6dUBXdjx7MDPVX5QfKAvBj1FzmIhvLklP/xBhwVQlIooSeT9rC6PeOX+oV3MHC/6y0ABnOScKb2PmWnL8GRqFtMNi9yuEaSct2k/eahwxLB4+QPKJjK3XBQX6Zs7hl04QUJUMRvy87ok+sn/cAvUdLu6kWVpDUbuIJdPJd/oS/7X4FffR19+jJXc+LlwH2pRlbGttw7qeNcIEsYWBUVqhEU6PVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ev9ovb0ACNCcK0QgjdHFJek9FbaGu2/8z0Fwy90R+M0=;
 b=g9NNwuffoM232AAhE70yksmFLl4Gi9AqSCz1WyJu42+kMXauku8aUA8dCPQvZN2V3uV3jrkwYxrz5zWl+OXfrh/jSS4WXBVWJoAcCcODyAjd+c3lWxlLGuAfqWCxJC/9cgn1nxTlSeKuMrnPuYx/kL4a+KyNMwizfoeDIme34+9UOREr8s6rvptY10CmEH+jEncoT8FcOw6wKSiElHnG6hqKz/bqhwqcLusUlvgYYslDdqmwANdRMl3+e861WIH+ZA7ENbaOY7tuYdtXrPtMbGejgQxDWA3HmZO3BUack1a6H2b5AsFR5qKtAzBi0I77qLpN7ePiQhvQZSJ3YDQQ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0884ce30-7cb9-2fe7-a7a4-fa5e7b962123@suse.com>
Date: Mon, 22 Nov 2021 17:28:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 4/5] x86/traps: Drop exception_table[] and use if/else
 dispatching
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
 <20211119182106.14868-5-andrew.cooper3@citrix.com>
 <8ac7cf1a-f235-a065-182f-3303aa9be5b7@suse.com>
 <39e0fcf5-0665-1614-31d1-59f98551abdd@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <39e0fcf5-0665-1614-31d1-59f98551abdd@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR08CA0022.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b724bb4b-1f18-4438-b0cd-08d9add50ded
X-MS-TrafficTypeDiagnostic: VI1PR04MB5326:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5326A9FD55EA5269341E63ACB39F9@VI1PR04MB5326.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Hd9eMQQjDjzoCxpKsvFiO3GFMbW9FSsuAjuz3gaCoVW10AwhW4jxGj4t6BXHKKxav97yebtKnMyMXJ/ZuPm+tae3nMgob9gv8JtvYYUIEJLu2FajMGJg6UTq8Rv5BOKRqtRefY7BUNxYQ5JFZsQ7tXekDtyLlYwrSPv9xfUGFRQuAmIhEpSSTeF/gtMLRpgn/bQZTKsG5b8FmALJXgrGpzL6eaEVgBhfQ8bQ58+jtpWzi+mCW9eE3XQlJBae0LdwVpN6gwehXfmErO8wwJE4GTjFVZDUX2O7CGmMvODN7zDdSE+XAnaqFSEtSlLEc+43LFBpvPmsg1lOcpPKizOK0foCGr7YTKOWLyeVQbpjWqIfjc/cJHO8D7G73xEBmeQcKHE+vjutxxg5BKPYtSH2/YPRj85RZURkHSPLRGvY+Xj7U6gF/7HjfG0fJ/G4ZcNjJ+ETI62dGZe5nKUr/06BPSnc6sdqEk9YOY+idRg6x820nUelsC78scKRUNmVEbIxXpAJeqxfI0m36RvfudbIy3WyuRFkzHWSrsWkv2J/0zfwTWBW4mckGJ+FGRF+IxhOqizZi/WjF+gMeuQiYpq1skezOKx3oNNPAhbGkt8vbURvvMzLdleNu0fpxmGEgppdJ+ENVeQ0AYZvgpydGD4eRAbezckLCgjoydhrrxQbQWSWTNL9pHtHyHxNtWvoz5GN449HFdWfMf5A+AspOMApXH0nXvFPvL4WTYpA/qNpF8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(8676002)(2906002)(31696002)(66476007)(66946007)(66556008)(54906003)(5660300002)(8936002)(83380400001)(4326008)(38100700002)(6486002)(31686004)(508600001)(316002)(86362001)(186003)(110136005)(36756003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cn41Q5/wESzhMitaANJ4iTtiQwgYtbpfl/k1uUM8CD1Ay80faukTM5Yf1Ad7?=
 =?us-ascii?Q?OyM31U0riQI1qal5iGz/K9xA5lKL2L7O27u7V9sNetfq1+YvkIe/Z5U8aGfX?=
 =?us-ascii?Q?oc0emZldQfQASLsNyPR3QtWTDARkbWSxutJOoiNCsPrCqMoOSvnoIubh4L5s?=
 =?us-ascii?Q?5kTmEg0pb3Rp7hEt78RtZOLobhxNvcDbgGeunJrBCXpOWtweqVec+GjJpIU8?=
 =?us-ascii?Q?R9m6eW1/8tvJeokX+ZxXCTL24MB2wCN+4HJP7f8sfXoE/kXIDmN1YgfDEaDr?=
 =?us-ascii?Q?hmqsPdD6QGD9y2U6nsj+Zh+2jQ4dLr+6eiA5y/PVmQpjR1R35/kmqz6G9Nxv?=
 =?us-ascii?Q?vis6xTgKcDRxVB0Wc2Aj18KwXTxLQsXZNon7GoZntJ1qFWWGqLyPUoU+88Pf?=
 =?us-ascii?Q?PHTiGZyCNlsXU1HFE46gBHPGjQRs8s8OZNlErRuOq3o54yJ/1BjFlXULzwgK?=
 =?us-ascii?Q?bRlf3Q8kqR37dUw4QLcTtWjF+wJJyEUf2ePFUcVpTHy5m5p+slKiByBASXLQ?=
 =?us-ascii?Q?cPle4WKjLgGeAq6AoFlYCZ1ovHA1DUbRsij2NSy4ET2sOtmMaznxAN0ti7UN?=
 =?us-ascii?Q?GRY6tYe2/3j7nWEeGHmISHLJ/TxR9Iit+7IHYlmaJ/0/1jzGX/nfnz5qdhlh?=
 =?us-ascii?Q?ghjrnjqZM+Zii9cy/CNv0BRDpzc5dN+RpWHL5weBNUx+Hxlsvne7+pSHHbhO?=
 =?us-ascii?Q?8FDMIvlif1ylFeqj7gCSoNPDnbMUZZ/Xh0XE938w4UwyDslINvrfOb/m8HUA?=
 =?us-ascii?Q?SW8pDp80hVoG+drBRfyTFlLbOGu5kFGUDCMtkTB+IwifVxE7y00pnCMQ198c?=
 =?us-ascii?Q?wOkWSZ+YhiYTfp7g0E+FWCb+6+87LPq0QjajThfjltm43eKCOrhj7ix5qS52?=
 =?us-ascii?Q?ZcQ5/mWX3HiMCbXn3P6V0SL7A/OOAQ95GZs59hcCqFRfqrSoGcm8I52oQAa3?=
 =?us-ascii?Q?INGa1rr+CTPft0Z/OukdX+8bWyIhu1jpa6PaZn3bkl61cvQDbEevZAN+cs2+?=
 =?us-ascii?Q?YTR/L1B3bobzFVSGF9hj8V/okQF2GMdQU/WD8tgK/HYAmpCnkjJN3hJ4B3mW?=
 =?us-ascii?Q?DSkUmauf+de4TKt3GhKJVzTOCM2q9+LgNJJxrBapgNdUNAAWTpVPVfYDq1bV?=
 =?us-ascii?Q?ehS+c55RWl73Pl8AsFLPTvnJ2mSvk+7H2st72Th2Mh+ViJfRaXNipcRUKXDH?=
 =?us-ascii?Q?27hJpObGV+/nkfPKDupQrDeu9pjn/Ysn2LV6kDEh/h/wdwsPAfW9rEMtGEzx?=
 =?us-ascii?Q?Zn9/MNkZObGUtfqIkkZjR/nLn0EaV6n64obenzbP4ilsKZ2S7hYDkEXY9CzA?=
 =?us-ascii?Q?dIS9UmhwwDigMyy9I02uv0A0UGuEd8jaTzPpJA4NOFY+1ybkBqLRmrMnvkKk?=
 =?us-ascii?Q?m4P7SniWq7swUc4+GjbEMlt73Pq0G6wUwe44fBpsYC1GsA4wZiDJjut0SBrm?=
 =?us-ascii?Q?+UyR9ig5wpIvRdeY6rF629L0f1u5WrmuP3XLLpIZQWErVGB7ZgWXmcXJhq/2?=
 =?us-ascii?Q?LnEKa5XaD9IVamMnilus1tDK2w3T+Vwt4NAkltvG6Gm7brlpNeQc4JXuXBTw?=
 =?us-ascii?Q?CfLfpoJ44SLs+BtcQMBDv9mJgMUQo4tbrbww77ACp4Mpvv5ogQ//R4OiGEhI?=
 =?us-ascii?Q?Ke+COI5FZxT0yf1LFYbqaW9lO0fxd6EWZy5YtSwrDBKmoGS8IUx+GCo8NCXi?=
 =?us-ascii?Q?aSKYlZv5iZJMWeE8KHJJngrgINg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b724bb4b-1f18-4438-b0cd-08d9add50ded
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 16:28:02.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96aUgsuUMAGPqRdEXw9VYOdwEbqlJ7cOvmN0I5+DF41wmt5MlxttcwIAKbA2RpPJ0/xMUArHckfjLJ5nYC4qkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5326

On 22.11.2021 17:16, Andrew Cooper wrote:
> On 22/11/2021 09:04, Jan Beulich wrote:
>> On 19.11.2021 19:21, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/x86_64/entry.S
>>> +++ b/xen/arch/x86/x86_64/entry.S
>>> @@ -773,14 +773,48 @@ handle_exception_saved:
>>>          sti
>>>  1:      movq  %rsp,%rdi
>>>          movzbl UREGS_entry_vector(%rsp),%eax
>>> -        leaq  exception_table(%rip),%rdx
>>>  #ifdef CONFIG_PERF_COUNTERS
>>>          lea   per_cpu__perfcounters(%rip), %rcx
>>>          add   STACK_CPUINFO_FIELD(per_cpu_offset)(%r14), %rcx
>>>          incl  ASM_PERFC_exceptions * 4(%rcx, %rax, 4)
>>>  #endif
>>> -        mov   (%rdx, %rax, 8), %rdx
>>> -        INDIRECT_CALL %rdx
>>> +
>>> +        /*
>>> +         * Dispatch to appropriate C handlers.
>>> +         *
>>> +         * The logic is implemented as an if/else chain.  DISPATCH() c=
alls
>>> +         * need be in frequency order for best performance.
>>> +         */
>>> +#define DISPATCH(vec, handler)         \
>>> +        cmp   $vec, %al;               \
>>> +        jne   .L_ ## vec ## _done;     \
>>> +        call  handler;                 \
>>> +        jmp   .L_exn_dispatch_done;    \
>>> +.L_ ## vec ## _done:
>>> +
>>> +        DISPATCH(X86_EXC_PF, do_page_fault)
>>> +        DISPATCH(X86_EXC_GP, do_general_protection)
>>> +        DISPATCH(X86_EXC_UD, do_invalid_op)
>>> +        DISPATCH(X86_EXC_NM, do_device_not_available)
>>> +        DISPATCH(X86_EXC_BP, do_int3)
>>> +
>>> +        /* Logically "if ( (1 << vec) & MASK ) { do_trap(); }" */
>>> +        mov   $(1 << X86_EXC_DE) | (1 << X86_EXC_OF) | (1 << X86_EXC_B=
R) |\
>>> +               (1 << X86_EXC_NP) | (1 << X86_EXC_SS) | (1 << X86_EXC_M=
F) |\
>>> +               (1 << X86_EXC_AC) | (1 << X86_EXC_XM), %edx
>>> +        bt    %eax, %edx
>>> +        jnc   .L_do_trap_done
>>> +        call  do_trap
>>> +        jmp   .L_exn_dispatch_done
>>> +.L_do_trap_done:
>>> +
>>> +        DISPATCH(X86_EXC_CP, do_entry_CP)
>>> +#undef DISPATCH
>> The basis for the choice of ordering imo wants spelling out here. For ex=
ample,
>> despite the data provided in the description I'm not really convinced #B=
P
>> wants handling ahead of everything going to do_trap().
>=20
> Why?
>=20
> Debugging might be rare, but #BP gets used in non-error cases.=C2=A0
> Everything heading towards do_trap() really got 0 hits, which is
> entirely expected because they're all fatal signals by default.

#MF and #XM certainly aren't. For some of the others I agree with
"by default", but without extending this to "in general".

>>> @@ -1012,9 +1046,28 @@ handle_ist_exception:
>>>          incl  ASM_PERFC_exceptions * 4(%rcx, %rax, 4)
>>>  #endif
>>> =20
>>> -        leaq  exception_table(%rip),%rdx
>>> -        mov   (%rdx, %rax, 8), %rdx
>>> -        INDIRECT_CALL %rdx
>>> +        /*
>>> +         * Dispatch to appropriate C handlers.
>>> +         *
>>> +         * The logic is implemented as an if/else chain.  DISPATCH() c=
alls
>>> +         * need be in frequency order for best performance.
>>> +         */
>>> +#define DISPATCH(vec, handler)         \
>>> +        cmp   $vec, %al;               \
>>> +        jne   .L_ ## vec ## _done;     \
>>> +        call  handler;                 \
>>> +        jmp   .L_ist_dispatch_done;    \
>>> +.L_ ## vec ## _done:
>>> +
>>> +        DISPATCH(X86_EXC_NMI, do_nmi)
>>> +        DISPATCH(X86_EXC_DB,  do_debug)
>>> +        DISPATCH(X86_EXC_MC,  do_machine_check)
>>> +#undef DISPATCH
>>> +
>>> +        call  do_unhandled_trap
>>> +        BUG   /* do_unhandled_trap() shouldn't return. */
>> While I agree with putting BUG here, I don't see the need for the CALL.
>> Unlike in handle_exception there's no vector left unhandled by the
>> DISPATCH() invocations. The CALL being there give the (wrong) impression
>> there would / might be.
>=20
> I firmly disagree.
>=20
> do_unhandled_trap() is a fatal error path both here and for the non IST
> case, and is absolutely the appropriate thing to call in the dangling
> else from this chain.
>=20
> It is only unreachable if 15 things line up correctly in a very fragile
> piece of code, where both you and I have made errors in the past.

The 15 things are: There may not be a new exception type vectored here
without updating the dispatch code. Failing to do so is quite fine to
be caught by the BUG alone. And adding new IST handlers requires care
in a number of other places anyway, so anyone doing so will surely
grep for all occurrences of the types presently handled here. That'll
make them spot the dispatch which needs updating alongside the several
other places.

Jan


