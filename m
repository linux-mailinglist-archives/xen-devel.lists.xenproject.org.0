Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0E443648B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 16:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214481.373037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdZGC-0005lj-JT; Thu, 21 Oct 2021 14:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214481.373037; Thu, 21 Oct 2021 14:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdZGC-0005jo-GA; Thu, 21 Oct 2021 14:41:36 +0000
Received: by outflank-mailman (input) for mailman id 214481;
 Thu, 21 Oct 2021 14:41:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FF+c=PJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdZGB-0005ji-Aa
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 14:41:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc367c0e-327c-11ec-837d-12813bfff9fa;
 Thu, 21 Oct 2021 14:41:33 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-43pGweL7Opax4qoQVy3wDA-1; Thu, 21 Oct 2021 16:41:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2701.eurprd04.prod.outlook.com (2603:10a6:800:af::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 21 Oct
 2021 14:41:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 14:41:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0052.eurprd06.prod.outlook.com (2603:10a6:20b:463::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Thu, 21 Oct 2021 14:41:27 +0000
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
X-Inumbo-ID: fc367c0e-327c-11ec-837d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634827292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z9skogwIVaoE51VgiADyKu7H97fKgw3Cv0RDkANNOaQ=;
	b=FsKh6Usl8kRWZAu8601y/cxA1NQuRprtOe3OKdN/wwwsNoTWeRePDWpr9mh/fDWbiTVP+S
	3btypHJhrWCDYnyhlPFOu8QdlrQ1s8tUCKWqHiwXeFKOQp5GLMPD7sTqfDFiO6KZxFFRqp
	iWjymg5DM8L7DuRFzHj8NX8PWdRsQw4=
X-MC-Unique: 43pGweL7Opax4qoQVy3wDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOMsZ28bOxf9Hp0p7BrMX2PzUULSWc8Id9CLahkPmZWur6AONk6QUof26v5ft8SPNaw3fuuYFVkJTX7FTFD531XV+xAM8CYAOtVM6o+aWMeLaDiqYTd3c+WZtvpNhWEHPTYl5RcGm/c/QaS1seP+cbUEBFZF5FTuMHHUCDr64OpYKSjAwh4k2a8LO5iYZHqANzOSG3OOwDpJC/mxxRxKL9Cnb6UNgSYq/+LUkL40F+pKqqCu1LAo8QRFu4zrwNVThuShBo1CttRycS2Hadj3uxLNSzZH8hAf8WC6e2vMFD//91s4YCS8wIacFNarD7BJPDed5yYorhPE06H5yvPU7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9skogwIVaoE51VgiADyKu7H97fKgw3Cv0RDkANNOaQ=;
 b=CEvW+dsSYxsRSjFeO7IWLpGjWrGJhtEgHk4wRJKeN2Fha7CwU73bq4j4xiUd8WJC72SS9+G8HIh6abWZCRAznB/H/ISChjk4qhX/gq7eSU52pAGIz/LewVaSrVVh27n5IUTQvF887UGPf1QbSqkvkSK5VEN9DDLvOkcEYzqoy/MT8f2MZ+17qoVICB3+V0aJ4tYJ00gZqqGOShxeusy4RzppeFe+NLAQV33r7LK8V2vw8GRRC0W7KBh7QUKkj4+GHD7Cy2phfz6C7F5l3Jn8HFYrshsxoLs87ZZfnwHbrCNzqPFvJXHDqil18WEkpP4eWY82DuZBjT1ZKZt4b0xhXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 10/12] xen/x86: call hypercall handlers via switch
 statement
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-11-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88c3d815-912c-a92c-2e96-7eff6a454a75@suse.com>
Date: Thu, 21 Oct 2021 16:41:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211015125152.25198-11-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0052.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 049d6b6c-573d-4c63-7b4d-08d994a0ddc8
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2701:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27018A42090A33FD5EF1A910B3BF9@VI1PR0402MB2701.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AKel/N6GQPf4Cc+x8biAH438l4X89pP+cFarkuTNDt8RA7pB78vZx3DSpOMRT+Ec8uvPqny4U+gXJYDP5y8tvKcSgUoWzzTC9tbXyMpLQ5kEk/ycSPG5sv+g7Enb2wer1vUmKkH+UcDSMHascZ1EzABZzEilcj/x3ts6Jqi2FslL8XtIuuacOjk4yi7WQmWojMi9xwfhj47JjZu85tNjdEtMKDg5i829248Dh+C2mByR/wXpuzvr8KOmd5Ux3TV83LGYdyMB2KjxkWPF1KHpz0Pd4ttJXXGb7/gfYA4LGWOAo9lptUrXSnJ0B2ZDbB7DjcK1YlBxSmZxybEj/BZgCiMpQbfjdEgEU5aC233zR+irQCzrXEuUqaNUYDQ2VWsiTnQHJ0Wd04fyJo1o4owKskjY0mZelq6l9DlNEqiEE9Q+otHs/6ATic+Q3M7mZZ010XPdiJYv7K08NFCt6gP/jeOvJPRcUv2IfBeG6vyRq9Gc3khublj8Y+5FIa/EtiM/gYOKtuJI8Hle2kcOqSpShB522KlYLmV89eTZimqzgYa/E8dWtoZUVN02qX28vxsi/VHHn1JtrnktiOv1A7zjBmPj6SyXe9e1e2mNLQa/Sj/Z0Tmo1QcnY9BT4ifnnMSxz7dpzoj7Q23icPlp4OeFeJn85cJAFcFIvzmq8P/qcuOKNO/8fIM3cejcw1HdJl9qCmDOERBMm7/iEWnR0D8UYL8y+ZyWgDl78LlThQ2knqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(31686004)(6862004)(53546011)(5660300002)(956004)(36756003)(316002)(66946007)(2616005)(8676002)(86362001)(31696002)(2906002)(54906003)(37006003)(6486002)(8936002)(38100700002)(508600001)(6636002)(66476007)(186003)(66556008)(16576012)(26005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHltWE45STJkZS92aHEyc3BkYnNBMG5ySmh1RUNvOFY1ZHdueUpIQXpHckIz?=
 =?utf-8?B?Q2xHZG4wQWkvUnJQVXRrQU8wUG8xYUZPYWxmUml5aXFybkErWFhtQ0tXb3la?=
 =?utf-8?B?Rk1hOXI4MUg3eFY3VFN4dGhlaUxFeVEvU25aNkJKLzhJSmdPbkk0UFN0TjlR?=
 =?utf-8?B?cVE5S01jRklVTFVuU1J1VXlNK0ZwOE9TUmI3YmhyTkZRK2txQlRNbkI4ZGVm?=
 =?utf-8?B?L0N0NC9oK0xQdGhoM1k2aUxxNVlTZDQ5OHNLb0NUUVRtbi93K1lSRnQxY01R?=
 =?utf-8?B?Q3pURWczWDRQNXAzVzh6NUxBL2hFMGFyQVIzeUcvdlI1TnI4eVlvbGdaYW16?=
 =?utf-8?B?YVp5djhjUFd6Z2d1dU80cmF1TUxaNHR4bGx4bUo3djN6L05nb2NyQnhoZll0?=
 =?utf-8?B?b0VvRTk4Q1VySGRuNjFweW1nZnU1dG5EVWdoYzlDaXE2RXhVVk5nUURoOGZP?=
 =?utf-8?B?WUlCSE9EVHpuSVk0QW5zZ3E3VmRZZUwwNDBrb3c1UGQ3NjRXQ0tXcVY3eDRB?=
 =?utf-8?B?TUF6WVhRbnhldVdFSjRvUmZBbTFDeFdGQm9HRnBPdE1YTDRxbUpnRzVzY1Bo?=
 =?utf-8?B?TTdXRUxpWU0xTSswdDVCOWhnenYxeGpkcE1HU0k4SzRPdTBUcmErSDM0NXIz?=
 =?utf-8?B?cHlRbjAvMXc0YksxRmNPbHNWOEI4aXFLUHhUMy9LUGxjSm1aMUJTMXhmZHBa?=
 =?utf-8?B?ZHd2RU9JNTI5TTR2U0EveU9zandJNkJpZFlSZmErblRnd0gyTWNFRFZLSDRM?=
 =?utf-8?B?Z3ZYekN4endhRTNseGdic093WGVwaGg1bFYxN2I4QkErNm8yZ09ZNGNzTjhZ?=
 =?utf-8?B?YmRLbjRVdURsYjJua0lVcEJDRWI3TldJWW9uaGswT1hQQU95M1IwdTZvUzVp?=
 =?utf-8?B?Z3B4ZllweTZscXV4UGZVZkEwUFE3MGdRckhES3VJc2JtaHEvelZsYU85aUtC?=
 =?utf-8?B?TTBLVjJZeThQWXpVbWJINlZIWlIrR1lNaVJMZWFJK0M2cDVYNThyN2syUm5u?=
 =?utf-8?B?K2RXNXh4cjBaaG16aURLb2ttcit2WncyQXAyT3NqbXBIQTJBWWpHTExEemlv?=
 =?utf-8?B?VGNONjAxZWRTWlZZenN1YXVhMGNValZSSmZlSFp1MVdBQjNsaXdCN3R4L0k3?=
 =?utf-8?B?QzZFaFBqMDE5QXhJSTNlY2pXaDB4SWVUTkdPeG5ZVmJUOCtHL3NzNjNaZnhu?=
 =?utf-8?B?SnNlanphYWh4RVNNemQvaE1ZSTNsNnZLQnVaaHN5cXkzUitwM3FnWjVXUzVv?=
 =?utf-8?B?bUVZQzlKTTF6ajY5TzRacS9ZMFlUZWFvb3dLbXI4aWxhczBIamJTNS9jRW1Q?=
 =?utf-8?B?TE9ST1NrbTJkeHJkNmVTRG9TQWhhMWJLUWdnMVp5YnN3NHpaNXViRU9SRUhw?=
 =?utf-8?B?NjlWMHFzS0FMaGRONTFKUklrczVjUWZVVnovak5rTFpiWGpwWmFtb01scHRK?=
 =?utf-8?B?a3hBMTJMaE5MVThHRmhPZnltb09FaEFQSGE1KzNNYWx5SFUwUitmczJhcGVW?=
 =?utf-8?B?d003L3JSY0RUR0UzSDZDcVFqMklkKzN2S0NJelhDNHBEUnc3TXdXdWp3MzV6?=
 =?utf-8?B?UE4ySm9VZmo0Z04rNlZtQ3M3QjhiS0h5d2hxUnphME52OTlFdW83ckxPUDUx?=
 =?utf-8?B?TytTRjZEN1VPQ0ZMd0lWVDJ3TkVlYkRBVGtFb3Q1MFpGd1pjZnE1Y25mSWRa?=
 =?utf-8?B?cEVTQlpqbmF4emVmdVJKaEM5cFdrSkFwNm9HWFI4UVo4ZEVTMFVQZ3ZsVkZH?=
 =?utf-8?Q?4smKbS9+qypUJQZtQEt8Ca7A/RI0KBdkW8RflL6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049d6b6c-573d-4c63-7b4d-08d994a0ddc8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 14:41:28.7716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2701

On 15.10.2021 14:51, Juergen Gross wrote:
> Instead of using a function table use the generated switch statement
> macros for calling the appropriate hypercall handlers.
> 
> This is beneficial to performance and avoids speculation issues.
> 
> With calling the handlers using the correct number of parameters now
> it is possible to do the parameter register clobbering in the NDEBUG
> case after returning from the handler. This in turn removes the only
> users of hypercall_args_table[] which can be removed now.

"removed" reads misleading to me: You really replace it by new tables,
using script-generated initializers. Also it looks like you're doubling
the data, as the same sets were previously used by pv64/hvm64 and
pv32/hvm32 respectively.

> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -108,56 +108,10 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          return compat_physdev_op(cmd, arg);
>  }
>  
> -#define HYPERCALL(x)                                         \
> -    [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) do_ ## x,  \
> -                               (hypercall_fn_t *) do_ ## x }
> -
> -#define HVM_CALL(x)                                          \
> -    [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) hvm_ ## x, \
> -                               (hypercall_fn_t *) hvm_ ## x }
> -
> -#define COMPAT_CALL(x)                                       \
> -    [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) do_ ## x,  \
> -                               (hypercall_fn_t *) compat_ ## x }
> -
> -static const struct {
> -    hypercall_fn_t *native, *compat;
> -} hvm_hypercall_table[] = {
> -    HVM_CALL(memory_op),
> -    COMPAT_CALL(multicall),
> -#ifdef CONFIG_GRANT_TABLE
> -    HVM_CALL(grant_table_op),
> -#endif
> -    HYPERCALL(vm_assist),
> -    COMPAT_CALL(vcpu_op),
> -    HVM_CALL(physdev_op),
> -    COMPAT_CALL(xen_version),
> -    HYPERCALL(console_io),
> -    HYPERCALL(event_channel_op),
> -    COMPAT_CALL(sched_op),
> -    COMPAT_CALL(set_timer_op),
> -    COMPAT_CALL(xsm_op),
> -    HYPERCALL(hvm_op),
> -    HYPERCALL(sysctl),
> -    HYPERCALL(domctl),
> -#ifdef CONFIG_ARGO
> -    COMPAT_CALL(argo_op),
> -#endif
> -    COMPAT_CALL(platform_op),
> -#ifdef CONFIG_PV
> -    COMPAT_CALL(mmuext_op),
> -#endif
> -    HYPERCALL(xenpmu_op),
> -    COMPAT_CALL(dm_op),
> -#ifdef CONFIG_HYPFS
> -    HYPERCALL(hypfs_op),
> +#ifndef NDEBUG
> +static unsigned char hypercall_args_64[] = hypercall_args_hvm64;
> +static unsigned char hypercall_args_32[] = hypercall_args_hvm32;

Irrespective of this being debugging-only: Const?

> @@ -239,33 +176,11 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>          HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%lx, %lx, %lx, %lx, %lx)",
>                      eax, rdi, rsi, rdx, r10, r8);
>  
> -#ifndef NDEBUG
> -        /* Deliberately corrupt parameter regs not used by this hypercall. */
> -        switch ( hypercall_args_table[eax].native )
> -        {
> -        case 0: rdi = 0xdeadbeefdeadf00dUL; fallthrough;
> -        case 1: rsi = 0xdeadbeefdeadf00dUL; fallthrough;
> -        case 2: rdx = 0xdeadbeefdeadf00dUL; fallthrough;
> -        case 3: r10 = 0xdeadbeefdeadf00dUL; fallthrough;
> -        case 4: r8 = 0xdeadbeefdeadf00dUL;
> -        }
> -#endif
> -
> -        regs->rax = hvm_hypercall_table[eax].native(rdi, rsi, rdx, r10, r8);
> +        call_handlers_hvm64(eax, regs->rax, rdi, rsi, rdx, r10, r8);
>  
>  #ifndef NDEBUG
> -        if ( !curr->hcall_preempted )
> -        {
> -            /* Deliberately corrupt parameter regs used by this hypercall. */
> -            switch ( hypercall_args_table[eax].native )
> -            {
> -            case 5: regs->r8  = 0xdeadbeefdeadf00dUL; fallthrough;
> -            case 4: regs->r10 = 0xdeadbeefdeadf00dUL; fallthrough;
> -            case 3: regs->rdx = 0xdeadbeefdeadf00dUL; fallthrough;
> -            case 2: regs->rsi = 0xdeadbeefdeadf00dUL; fallthrough;
> -            case 1: regs->rdi = 0xdeadbeefdeadf00dUL;
> -            }
> -        }
> +        if ( !curr->hcall_preempted && regs->rax != -ENOSYS )
> +            clobber_regs(regs, hypercall_args_64[eax]);

I'm not fundamentally opposed, but sadly -ENOSYS comes back also in undue
situations, e.g. various hypercalls still produce this for "unknown
sub-function". Hence the weakened clobbering wants at least mentioning,
perhaps also justifying, in the description.

> @@ -55,4 +42,34 @@ compat_common_vcpu_op(
>  
>  #endif /* CONFIG_COMPAT */
>  
> +#ifndef NDEBUG

Hmm, I was actuall hoping for the conditional to actually live ...

> +static inline void clobber_regs(struct cpu_user_regs *regs,
> +                                unsigned int nargs)
> +{

... here and ...

> +    /* Deliberately corrupt used parameter regs. */
> +    switch ( nargs )
> +    {
> +    case 5: regs->r8  = 0xdeadbeefdeadf00dUL; fallthrough;
> +    case 4: regs->r10 = 0xdeadbeefdeadf00dUL; fallthrough;
> +    case 3: regs->rdx = 0xdeadbeefdeadf00dUL; fallthrough;
> +    case 2: regs->rsi = 0xdeadbeefdeadf00dUL; fallthrough;
> +    case 1: regs->rdi = 0xdeadbeefdeadf00dUL;
> +    }
> +}
> +
> +static inline void clobber_regs32(struct cpu_user_regs *regs,
> +                                  unsigned int nargs)
> +{

... here, such that the conditionals in the .c files could go away
altogether.

> +    /* Deliberately corrupt used parameter regs. */
> +    switch ( nargs )
> +    {
> +    case 5: regs->edi = 0xdeadf00dUL; fallthrough;
> +    case 4: regs->esi = 0xdeadf00dUL; fallthrough;
> +    case 3: regs->edx = 0xdeadf00dUL; fallthrough;
> +    case 2: regs->ecx = 0xdeadf00dUL; fallthrough;
> +    case 1: regs->ebx = 0xdeadf00dUL;

No need for the UL suffixes here afaics; U ones may want to be there.

Overall, besides these mainly cosmetic aspects the main thing missing
is an approach to prioritize the handful most frequently used functions,
for them to be pulled out of the switch() so we don't depend on the
compiler's choice for the order of comparisons done.

Jan


