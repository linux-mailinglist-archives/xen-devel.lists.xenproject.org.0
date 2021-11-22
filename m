Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66463458B03
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 10:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228678.395759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp5Fp-00068Q-Te; Mon, 22 Nov 2021 09:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228678.395759; Mon, 22 Nov 2021 09:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp5Fp-00066X-QF; Mon, 22 Nov 2021 09:04:49 +0000
Received: by outflank-mailman (input) for mailman id 228678;
 Mon, 22 Nov 2021 09:04:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp5Fo-00066R-99
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 09:04:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d55f63c-4b73-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 10:04:46 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-edMmerRZMBKpA__0iIB0vg-1; Mon, 22 Nov 2021 10:04:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 09:04:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 09:04:43 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM0PR04CA0003.eurprd04.prod.outlook.com (2603:10a6:208:122::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Mon, 22 Nov 2021 09:04:42 +0000
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
X-Inumbo-ID: 3d55f63c-4b73-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637571886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6mHnqFy04LrSUeub1I/f3giwVEwvA7mREPzi1UTTGa4=;
	b=B3RdXRAMg3dGebYQaKuNE7knivl4wpBcBPYNjYeJng/7qoTRc38rrQtEHRZK8D9oKg1bgv
	HGYsuW8Ie5vu22nKi92a22mBvWyHsgBj0RS5jGLvC4cCZ6Ds1Qwrd3fYHkiKxfs8oNycKD
	GFaOyqhdc1xqmKZuXuy92K/q8KnOO+A=
X-MC-Unique: edMmerRZMBKpA__0iIB0vg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGk+Cn8t+yw+e/4d45+tEUgsI0/sdDgX9l2iqcvlMW3fKCGqUP7EJU6vSuKL4n9nPy1yKKfJJLPgiFI/xifh+t+O7UsC7RKBWpNK/S3q4gLC4PAgvm4pZassW6W5EljyIhsmbAyHap/E1CfptmKjPkonPmqjV7xSoSr9vReDG6/RC3ufpUKPxa+MVw9LwmHa0xsXsTyezlR2GSuigJlT+/7Pfehvh1OGBq52rYR0PQHf+Y02OIOSA5UnlvCc/LVnaa6QCb2VGSUsE8kD4/UpUAIsCw4RhMsGLo2KYs9Pris1WMr1v0oE/33f8ZiZRyU/KHCHxShsj/k7RAVGv6V+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mHnqFy04LrSUeub1I/f3giwVEwvA7mREPzi1UTTGa4=;
 b=AmfyhmJcbIizTzJp4XgEGyfHh0hPljkLjwPZn+8fa9TKLGzvT4+gDPPgDcXsfNJ9JmiHMIf6gwSsnBvKu0uGbz+TpPqV56gGYp3XRVmrLqJ7vcsKxlqV3Wz/tRNpD03pY43BIWWuxooZxcd3biT0ZTvLHcTsyRVXLkRSlOUKZto/B0quIF/3J19qQBzlYubnhKN7cDHhYovAnfaGughCpwSWVZL2DD7MS37UFqQ1YurOk1b/oKMLJH+dKacbXXriJKdSldZG8RRxNyseINcE3f6DL+52DBk1r7Fexa/PT+thYd1qvY8sXNjTE9DLEEUFkQzqPT0U664Goh6LC2it7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ac7cf1a-f235-a065-182f-3303aa9be5b7@suse.com>
Date: Mon, 22 Nov 2021 10:04:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 4/5] x86/traps: Drop exception_table[] and use if/else
 dispatching
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
 <20211119182106.14868-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211119182106.14868-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0003.eurprd04.prod.outlook.com
 (2603:10a6:208:122::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c66e14c2-9975-4c66-8d43-08d9ad971faf
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB338990DBE369DD432C49DECAB39F9@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+lUA3siri0CNBleGZ8tdknu+x3rrHl2EoClHPnZkoNpwo7Sg2G3L2gjwzp0aPWo02Y8JSk7JUH1zixrUE54+M2zdPqvnxyV9/WEAVhWG63nElVyxoPvEyrT0si+wm4oulxxFiFY+JflrRctnhqe46/36Id47eoJkGaygkuUkKISWxHf2oJKG3vwbooBM7zybTzCpVoFq2qGk2Jm72ZkEAeEj4Pwl7Ks566cPZNN+8oKX3uEQGqb64mk06h9WBM187Imm82Z8aAWR5CM7tWriAcjTRPEJkiasDzQCafpgq47S+nOZzEuyusTWjPU4nCckG7Aqux3M4vxMi+tOvgepvDBkRLB+mSUBn91cqJr2AqVE3LruCZRCknj9FeymOfmyoOuqCZWFm/aeLQFBN8Zn8xDPkX/V4z34IfNnUYkP2kR1X+4wR+OgHibxueAHQvb2kN8TGcxYwa/dz2w4npKD9YcajAjQeMKkTJjlVflRcGALJVnClkjFxCXctisBSOfhX+VWAhUqMQnneqoQ0lJ1tq8gRg0RPtOH36uLmRO2X8+ngg12ZNVf4d5TPeKVSH4EHK0mstdyhdnkZME8a1C3rtXfpVWh3hDwM2pEbmxc5TtHw2HBgUzPd1ZbP5sLLEZcH1M+jJKB3+9XqR873YY30tOjPh21m6aDK/NtJ2BRgEaqi3zeUQSjfxvcDWumiWZK0lB6aiq0cg7asUZOnyFKlEZiCemP/YqyXjefOrUeLc4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(86362001)(31696002)(2616005)(31686004)(83380400001)(66946007)(66556008)(8676002)(6916009)(66476007)(38100700002)(5660300002)(508600001)(8936002)(53546011)(36756003)(6486002)(2906002)(316002)(4326008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUZ6WG9RQkZEYzhWbVJMN1FTckt2b3pld1l4enZUczVNTEVNSFQ4clgxUENP?=
 =?utf-8?B?YkNQTXRWWit4SVJFSFNTS281OGFtQWM4b3Fvbk1jRnVYdmRhellnZllOalh3?=
 =?utf-8?B?UVg4WDJOa3lIU2I5LzlpZE9tb2RxNUZEWTBWcHl5NzZURVNTcXN0ZlEzV1dx?=
 =?utf-8?B?SGhyYytZNDBXWmkrK0VBQVY2NG5xQmF6NjhVQ3p5WkJBSkZWbFQxcEFVN0hI?=
 =?utf-8?B?TnIrWHc3bEJnR2ZNWHRaNjNVOTJ5OXBwU2RoYldRbVpYbUh0MWFjNVlrbXY0?=
 =?utf-8?B?VVZUbE1JZVk4ZHlBdEd0bnZabVZDMzJaajhUTFVpYUVqb1M1THVHZUhlRU8r?=
 =?utf-8?B?SGR1L09VWHEwMEZpM2hrbWg3M2NIdmRTK1pqcTVDSjJYOGRkVk5ISERZd0Rs?=
 =?utf-8?B?Vm9LZmV0UnNqNzArckF0a00yRFlPcXBqTEVKbElobkFOa0RmUjFhWEpsRWNa?=
 =?utf-8?B?dUJ6V3l6VGRWcE5Jb2VUSUxMOUpYam9LS2F4ZkN5MkswUkdqbTRtWWVIbVZF?=
 =?utf-8?B?aWVZMUw4ZHM0YjlVcEdPbWdXZXczdC83OWNVQWMweDJvUGpuRmlSZGlXZFN2?=
 =?utf-8?B?UWdVU2oxWmEyRmNMTUtIYk9HZmt4ai9NeE95VGw2bzgzK0ZtM3MrNjRnbWRv?=
 =?utf-8?B?bFVQbmNod2NFZ0l2ZndIZHowS0xKazRQYUpOTW1vN1VQT0FvdHBpNkdGUGNI?=
 =?utf-8?B?Yjh2WUZqUS9xRHJCdWRhTnBHajMvbnhITnJWaXd1THp0SEpxSVBOQVdkN0Yw?=
 =?utf-8?B?NFJHOFBDbW5hNUNKQnJvU3BLOVMwT0FUTGZLb1pZTjJYZnhPeVhxWHhZYTJX?=
 =?utf-8?B?eXpOQU1MNWIzQXJrU09qazJwSWp4U0hmemdMbThqdGtSQlhXbkVkSG9pTmdM?=
 =?utf-8?B?WllXbU9STGo3d3lyWlhUZ0tKc0V4cXhNS014bXY5RUg3aEk0NWtwQ0trVDJQ?=
 =?utf-8?B?eXdJY243bWpQelAxN3lKVGhZMjBqR0dKMjVGaVJUSDBlU1laczZNOW8ySkNo?=
 =?utf-8?B?Y0kxSnh4TTNVYnRITG44Tm1CQUd3NDF2QjZ3ZGFIRHFoUWtwdTlWbHl3VkJo?=
 =?utf-8?B?dVZLUEdnRkFkRW0xaUgvc2JjVXZtMTNEQ2dKTnRFaDFVQ0xhQi9LcXMyYXM2?=
 =?utf-8?B?a3FGSEVrMW5QMTZBVXZreGJEdjN1NTRkaVNBMm93MDdoTCs0UlI2ZFIydm9C?=
 =?utf-8?B?L1FRTld1VE55L01ieTNTdW1yeXd0RW9Ia0xOSjdVdmJFS3BUQkJqVUlzQm9w?=
 =?utf-8?B?SmszaHFhclZRQk40TjUraDlxQnR0TlpXREYrakxNclBIbkZDWjBTWmt6RkJR?=
 =?utf-8?B?TDh6ZTZqTWV5cWZwZFFsQlhnMjQ1Yzk4WDhod2k3OUhSTHdZbUR5WHZGc0RC?=
 =?utf-8?B?alN2cGVOOGNqaFRCV2dpNHQvWEJwdXZlVkxkSHJMYWdRN2xwU0hEQkFzRlc0?=
 =?utf-8?B?YVlFRkJseHFodFZ3NzRhbm92bHN4cUcrNkIvODBTbWN5MjRmR0lKMVM3bng5?=
 =?utf-8?B?dldhaDRWelljS1JjV3lmRjdTay9iZnJta0NlcnZ2bUl0SVorRXBnTnVtbW8y?=
 =?utf-8?B?TUZ1L0hidW5tb0JybUhPc1A3UGE0TWtQdmlTNG5ZS2NPMlk3VGF2QlZUdzJR?=
 =?utf-8?B?WlRNQUdzSlJydjZVSWhwdlYvQ0E1Q0hjTUJUWU5XRjRmL2tFZzZWQTVYOWt4?=
 =?utf-8?B?WDQxYWlMNkVOcitIdVRzNDNYZUd3Ui9nOFJpcm5lYkFGVVEvTWMyWUJaWXRw?=
 =?utf-8?B?ZE5UZlBQZ2I4bWgwK3lRbndwTVB2S1JqWUtFSnJCMWFQbEtpUjI2SUI4RjlL?=
 =?utf-8?B?KytFVVNBeGtoOXRxQlNCbUc5dFlsNG1ENy9jL3VnSUFBOG9qckFwOWpRNkVF?=
 =?utf-8?B?NWJFN3lZY3pDS0VodUprUW1hOVM5R1ZTdnVYMkxISGtyK2hGQm5UeHNoeWVW?=
 =?utf-8?B?RFlJL0FhWjhVQUhkTy9SQ0FnRTRDTlUyY2x6Z0RGN3NFTm5LY0VwdnNERHlm?=
 =?utf-8?B?dlVSSjZHV244cEdFMGFWMnl6L3FLSFdGaU5hdm5ReGtBM1VjRFpRbmdGb09Q?=
 =?utf-8?B?ZndRTWZwVWdOQnI5T0JrNUlQSkMvTTh3S1pPMTNJOUUvUytJNGFQOUpaN0Fs?=
 =?utf-8?B?WDkxVDJ6WTZ5TG1DQ3FGWlNuQStJSC8vUGcwQmVtM05yZzM4YXlGLzhQcGVs?=
 =?utf-8?B?V2VQR3gzdFI0SC9ZcDdvRDFWUTduUHJIQXl4d0g5b2kwRHgzYmJGakhNZXN2?=
 =?utf-8?Q?jDR1IbhrIiTeO7O/ZvU8X46ed5wItLw9BwrA+Ce4+M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c66e14c2-9975-4c66-8d43-08d9ad971faf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 09:04:43.4410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o14wb7UIoSaO9Y31vW6lBGOd1XyDTsdpnFUu6liA+zxNlWnQXkds5dIRSfhydfeC5oplrGljboGdvnaxSB1zPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 19.11.2021 19:21, Andrew Cooper wrote:
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -773,14 +773,48 @@ handle_exception_saved:
>          sti
>  1:      movq  %rsp,%rdi
>          movzbl UREGS_entry_vector(%rsp),%eax
> -        leaq  exception_table(%rip),%rdx
>  #ifdef CONFIG_PERF_COUNTERS
>          lea   per_cpu__perfcounters(%rip), %rcx
>          add   STACK_CPUINFO_FIELD(per_cpu_offset)(%r14), %rcx
>          incl  ASM_PERFC_exceptions * 4(%rcx, %rax, 4)
>  #endif
> -        mov   (%rdx, %rax, 8), %rdx
> -        INDIRECT_CALL %rdx
> +
> +        /*
> +         * Dispatch to appropriate C handlers.
> +         *
> +         * The logic is implemented as an if/else chain.  DISPATCH() calls
> +         * need be in frequency order for best performance.
> +         */
> +#define DISPATCH(vec, handler)         \
> +        cmp   $vec, %al;               \
> +        jne   .L_ ## vec ## _done;     \
> +        call  handler;                 \
> +        jmp   .L_exn_dispatch_done;    \
> +.L_ ## vec ## _done:
> +
> +        DISPATCH(X86_EXC_PF, do_page_fault)
> +        DISPATCH(X86_EXC_GP, do_general_protection)
> +        DISPATCH(X86_EXC_UD, do_invalid_op)
> +        DISPATCH(X86_EXC_NM, do_device_not_available)
> +        DISPATCH(X86_EXC_BP, do_int3)
> +
> +        /* Logically "if ( (1 << vec) & MASK ) { do_trap(); }" */
> +        mov   $(1 << X86_EXC_DE) | (1 << X86_EXC_OF) | (1 << X86_EXC_BR) |\
> +               (1 << X86_EXC_NP) | (1 << X86_EXC_SS) | (1 << X86_EXC_MF) |\
> +               (1 << X86_EXC_AC) | (1 << X86_EXC_XM), %edx
> +        bt    %eax, %edx
> +        jnc   .L_do_trap_done
> +        call  do_trap
> +        jmp   .L_exn_dispatch_done
> +.L_do_trap_done:
> +
> +        DISPATCH(X86_EXC_CP, do_entry_CP)
> +#undef DISPATCH

The basis for the choice of ordering imo wants spelling out here. For example,
despite the data provided in the description I'm not really convinced #BP
wants handling ahead of everything going to do_trap().

> @@ -1012,9 +1046,28 @@ handle_ist_exception:
>          incl  ASM_PERFC_exceptions * 4(%rcx, %rax, 4)
>  #endif
>  
> -        leaq  exception_table(%rip),%rdx
> -        mov   (%rdx, %rax, 8), %rdx
> -        INDIRECT_CALL %rdx
> +        /*
> +         * Dispatch to appropriate C handlers.
> +         *
> +         * The logic is implemented as an if/else chain.  DISPATCH() calls
> +         * need be in frequency order for best performance.
> +         */
> +#define DISPATCH(vec, handler)         \
> +        cmp   $vec, %al;               \
> +        jne   .L_ ## vec ## _done;     \
> +        call  handler;                 \
> +        jmp   .L_ist_dispatch_done;    \
> +.L_ ## vec ## _done:
> +
> +        DISPATCH(X86_EXC_NMI, do_nmi)
> +        DISPATCH(X86_EXC_DB,  do_debug)
> +        DISPATCH(X86_EXC_MC,  do_machine_check)
> +#undef DISPATCH
> +
> +        call  do_unhandled_trap
> +        BUG   /* do_unhandled_trap() shouldn't return. */

While I agree with putting BUG here, I don't see the need for the CALL.
Unlike in handle_exception there's no vector left unhandled by the
DISPATCH() invocations. The CALL being there give the (wrong) impression
there would / might be.

Jan


