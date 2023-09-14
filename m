Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA27279FDA8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 09:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602108.938492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qghFF-0002RW-3h; Thu, 14 Sep 2023 07:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602108.938492; Thu, 14 Sep 2023 07:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qghFF-0002O9-0D; Thu, 14 Sep 2023 07:58:37 +0000
Received: by outflank-mailman (input) for mailman id 602108;
 Thu, 14 Sep 2023 07:58:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qghFD-0002O3-8i
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 07:58:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 801d8774-52d4-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 09:58:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6917.eurprd04.prod.outlook.com (2603:10a6:20b:109::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 07:58:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 07:58:28 +0000
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
X-Inumbo-ID: 801d8774-52d4-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPtMu+lnC0PsWYhchkwbxMiyzBrMUUZHUGGHRmYCvags76jAEfKV2/5VhT2LQtkkqN4zJJrmcoo3DIyearEmNrJUTi06w807fWzm+wLWQnzMdllny0TMdLYdvZS0zgzHgFgFtJJoyHItg9WpDQlEq66agaVquqw1gR8XaCSCksvdPIhj5b+9q/3M9yBSpPiGSA5QA+zJ6VWGHAJEBbUyD5c7acMH8xHMlOmOFw76IfvBYYNPQmzS/+rYMSUT1j0rSslxpSNHSoTjdcTjfLx6noBU95u2vlqjERSTOcGfXIDXjiizt2AbM/PAEmMloMvZCA54VYUi5/cXgKxhfFXXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzGlRzfDDIiJ9Wk1up/xdP3rqGawsHI8yBrKmgJSLIo=;
 b=bMatiaHrH7SsCd+Kkp7r6Iyc30TZ3/8ae6e3rigto7LRgetrrWJaZycw7uKlfz9mUzSrcH20WwT0KvbYpf4xebkR38NjearRc7mqY7k/HoLB1CFx65+/2VKN18cRl2XWZoLAuh/P11ruJiAKHw+hxfHVT0fizaGwWGxHMxHgpYD9x0EtcdtgKZcbBBWzFcpq7KfuAmZdOrIi+uXv/7qyZCAy3rYh7mREjqvBCxPCthi7U3BsiC0tb54H0FSEzsWTKg3evQIQcl9Y6u1MvMRHSD/tBmr+lO3fbjDK+X1v0zAqpahLiXpJjXXztKic0GmAQjfbZ8KL8bkeWnnPP20lXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzGlRzfDDIiJ9Wk1up/xdP3rqGawsHI8yBrKmgJSLIo=;
 b=eMXJJY1xOb2CbvZgUksjtd2V88NUAcCYU3xpPKXx8tqtVjZ/m/nAqIWQS54IfIWK/+QEBktovbOGsQNnO8cC4+jmbYjD49030qOmAOjwmXZIBd2x8XZniO6YVLjonbIEcSJHO/CjsCklVy6GjWK2kXSlH9vfKqkbkNwO8goLcfd0lC6C/7lKqSx0Ozl4BVnfHDIDjMhOUerXBoUrGL9Jvd4foRDIcHxrp8iTCJrZYQryhzKwpCe1CpNwIfCKNqwnWMtJ9N1N3wOw3+HyLIvg8CPlODyx+nYPaTgbuvC0ixxmunNX5WPw+SNXqfRQNvPX/kzScmTdlQ+x1ljul67CcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e12f46d9-25eb-d564-4cb7-0e476e741725@suse.com>
Date: Thu, 14 Sep 2023 09:58:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/8] x86/spec-ctrl: Extend all SPEC_CTRL_{ENTER,EXIT}_*
 comments
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230913202758.508225-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f9c48cb-5eca-4945-a42d-08dbb4f8617b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gSgGrKxqMdNPJJpMvYf/YJ+3bjKXI4d23/tcclG2Tyw1fjjud5YU9KxifinHV1k6q0FGZrdTKeWOjUqSJO6eBhT5lkbIjMoC9NTzME1IARTCSUDvLKE/ocxZ7nZXHx/aoTEJxuv5CuRKiFkU2oB+0yhP45V+0jbMT3Wbewu9UPsb+4j1wJGEbKurpbLoKBRMr+dBoAiOor5SY8C+TpYn8A2jWTOZGXCDPHR7l04EBHu5Y3zAPK4ijOspU3w4sa1bx9GuhFTJzjt/WsERH9vwVVtSkozYIjUQ2Mctz0z6cXQyoUlz43AqjoKRCwYHySQnlvM4REtF3xs07s5DV9gN/H6qJz+o9OyUOahvOO1yT9DRtPzrlsKTYuRqfGwOwiRJKTuDGH1a3Yl4tJTYY+glWzF/4p8yax+Znl1DfwirCyKhyDf/1mfntRIIHwHjy1JxxAyaQDIl1ipY6quCaT0KFX8zlK4dW6FyqsrMjPLh6zXMKwUQbwONCssemsOGiqfdtO6fNYFnv8sWlIvYzJUfHYgYqqKbAaQQjSZ6mlhJ64iaW2zH9PFy9bOQG6u1BSxQQNINbwjAvedImoUh7Qtu398R+mDTq+ioHfcHw0o+vYh/RdRx/qTyhPSGhxGi4hWV0IhMegBIkTD1BMLAY6XUog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(396003)(136003)(39860400002)(186009)(451199024)(1800799009)(31686004)(478600001)(38100700002)(6486002)(6506007)(26005)(6512007)(6666004)(53546011)(66556008)(2906002)(31696002)(4326008)(2616005)(5660300002)(8676002)(54906003)(66946007)(36756003)(6916009)(66476007)(41300700001)(316002)(8936002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHpEakZGRXYvdW9GWFlmS3VhQjFJdnFFYkRxQTlxMnQ5NkxRNFV1TFZmZmpZ?=
 =?utf-8?B?MUFQZEhQUWxpWTErbS9aNHpMQXduU0M3OHpOK3AxcTEwNTNhdFhqWTJxdjRV?=
 =?utf-8?B?Y2tkdEYzQ3ZzUERtUzRURXF0Wmt4dU9RRGl5dEZXRUtZUjV3dStXYm1oU096?=
 =?utf-8?B?TXdZNkprOGtqMk54N1ZhNTd1ck91OUc1NC9rYWdOVUQ1dlF2Q2JqZ1VYdzFG?=
 =?utf-8?B?clhycXZHYkdHU0diZjIyRHVvaDcwWnNnWnNKaDBMNStGMUZXVFoxZ0U5QlZs?=
 =?utf-8?B?MG1CWWt6M1d4NUVualJNeVNyYTNldkIxcVpnSHZtc2x6S0djVTlBdGo1T01M?=
 =?utf-8?B?Z0NEdGw4eFBwLzJPem5VWmNKWXhBaVNwUlZ6Rm1xZXRCYUd1VHIvSGo3UWM3?=
 =?utf-8?B?UkNIWW9zenRuSEtSRndSbVBYMG1TbFI0SUVjNFBjb0U0OEtycWsvSWtUVTdY?=
 =?utf-8?B?MFpodTBpU1pEUUltNU5mTHV1dzJKYnBraDE5a05scTV0QVhYU1lkRkdBbWRi?=
 =?utf-8?B?c3pWOWJidWpWeW83RSs1TGV2NGNrV3pOTGZ2V2VCUDdjVjhkKzA4VzByQmFo?=
 =?utf-8?B?UFYyYmZjdTBXZHhxUDNiWXNER0x2Nzg4NVRXVU1RVE5GYmdsTzI1cmxCOHdu?=
 =?utf-8?B?Uk5hRWlNd3JBZDVKNW9vcmNQY3pCNDlkMjdJZjBSRlkwSXloTnVyS2NqR2pT?=
 =?utf-8?B?RnZQVlZxMVZhUGlmU0RrNm9OL09iYWJoa2l5MmNrTlVhTGxvRW1MUTBhNzVZ?=
 =?utf-8?B?NlRCS3RuSnFaMEgrdEgraGt6RHVMdGJReHBlSWp0THdVMDA0NytuSXdNSUg3?=
 =?utf-8?B?bGJQcHA2NEROMW8zcWNzZnRXUzVnSjFXQkpUb1A1SkwrVUNyZ2ZicGFId2Vz?=
 =?utf-8?B?WmZOSTZIVmNoMVhESzVhb1ZkZ2RFODA0WC8vNE5EYjZDNThpSkdpbm40NU5C?=
 =?utf-8?B?K3ZLaW9BcFBGTmtOc2c0UDdEL3hMelJpTkxaWEFwK0RPZ3FaaEt0SkI3cFUz?=
 =?utf-8?B?ZVkzZzlPbXBFalc0N3YxbUo2bU1Mck9mNm9RdjhIU09UenZlcytYRGxkd2lG?=
 =?utf-8?B?WVJGMHNNT290Vms1U2lBZVQ5WENqRW5Ic3ZxN3gwRE5hdHFCNElNdzlZZUtw?=
 =?utf-8?B?SW12SGlMdDNDdlhVZGRXeXRMY1hUeU84L0QxeEpZc2l1WmdCdE42QmZBbTI0?=
 =?utf-8?B?VnZhY09Fb0x4d3h3amN2aXpiZ3NSQ0pBdGdUM0tkTG1DQWkyV1NjV3VDRnJw?=
 =?utf-8?B?bFVjMG9adzUvcG4yZzZxZm1panViNWdNeTg1YnNRK0NNOWdVSDZ0Q2F2MEhN?=
 =?utf-8?B?elU4d0hLcmlvUnEzUFl6RjVZc1pQNU9iZDVNaEs1a3BlbmdsQmFJcUo3VmNN?=
 =?utf-8?B?RDJCT3VqbWhzN1ZETFZGWkJKRHJMdUtNa256NWVLdWtyRkRKMWhOb3lBMzBG?=
 =?utf-8?B?cllNRk1hRHNreFVrMG53WHBiS3BSRkQ5S0I2aTl6L2ZNRWJkVitQcDRLYysx?=
 =?utf-8?B?ODRmTG9RTCsxN2JFcVA1NnNrOHExY3N6WVptTWxDdXB1anlSZEhmZklmdkt6?=
 =?utf-8?B?aHVKMUR3akJqWGx0OFpKbFFLSWFoRFhEZmlMcUoxUW5aNDNoSHVjbnZDTWYy?=
 =?utf-8?B?OGhVcGdzSHF5OHd4QldvSXh3VGRoQnVpZUxWVUdkMmxBZXk4dS9QWTE5WFVi?=
 =?utf-8?B?bWRhbVErQmV0RHV5am1GTGRwcmx1VkZHZ0UxRHV2L2xBdU5hTkthNXVDQk96?=
 =?utf-8?B?SzFOZ3MyZ0xhc081Uld3ZGYvWTlramJaTEVyby96Z2pBN0JMNUFxT0huc0No?=
 =?utf-8?B?eXJSTHpPMlIyZCtjV3hkaDM1RC9sVUVTcG1nQjY4OXZEdnlhdUhQTGpJelZR?=
 =?utf-8?B?OUFzbzBWTEZCUVJISWFGeWdrMmlXS0ZHMHpkRmpSa0g2QkZwRTM0RDVJSW9k?=
 =?utf-8?B?TU1ncVpXQmJwVkdacUJvUTliRHNFNlRxTnAvOHI3S1RlaDBLV3l4cWhVOWdi?=
 =?utf-8?B?TFVMcUZ5SU5MbkhHL2lkbWZlNmdCaHg3QUFMdy9KTk1idXBLSk5acHpodEZ2?=
 =?utf-8?B?MldMTUJjZDgzazhjOXJFVWRIK0JHaEFhcHkvd2FmMHpOVEtLdEJRTVVQS20x?=
 =?utf-8?Q?V9PS+WyypTBjV27wO7hL9DACd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9c48cb-5eca-4945-a42d-08dbb4f8617b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 07:58:28.4801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9StHN2a8IKEjGmGElAvdrTnntKyquMwIFJg2tWT0/z4HRVexnkJd6rCTdOBzAmUh4Apka0wyJrkywhjkyLWt0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6917

On 13.09.2023 22:27, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
> @@ -218,7 +218,10 @@
>      wrmsr
>  .endm
>  
> -/* Use after an entry from PV context (syscall/sysenter/int80/int82/etc). */
> +/*
> + * Used after a synchronous entry from PV context.  SYSCALL, SYSENTER, INT,
> + * etc.  Will always interrupt a guest speculation context.
> + */
>  .macro SPEC_CTRL_ENTRY_FROM_PV
>  /*
>   * Requires %rsp=regs/cpuinfo, %rdx=0

For the entry point comments - not being a native speaker -, the use of
"{will,may} interrupt" reads odd. You're describing the macros here,
not the the events that led to their invocation. Therefore it would seem
to me that "{will,may} have interrupted" would be more appropriate.

> @@ -233,7 +236,11 @@
>          X86_FEATURE_SC_MSR_PV
>  .endm
>  
> -/* Use in interrupt/exception context.  May interrupt Xen or PV context. */
> +/*
> + * Used after a synchronous interrupt or exception.  May interrupt Xen or PV
> + * context, but will not interrupt Xen with a guest speculation context,
> + * outside of fatal error cases.
> + */
>  .macro SPEC_CTRL_ENTRY_FROM_INTR
>  /*
>   * Requires %rsp=regs, %r14=stack_end, %rdx=0

I find "synchronous" here odd, when this includes interrupts. Below you
at least qualify things further, by saying "fully asynchronous with
finding sane state"; I think further qualification is warranted here as
well, to avoid any ambiguity.

> @@ -319,7 +334,14 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>      UNLIKELY_END(\@_serialise)
>  .endm
>  
> -/* Use when exiting to Xen in IST context. */
> +/*
> + * Use when exiting from any entry context, back to Xen context.  This
> + * includes returning to other SPEC_CTRL_{ENTRY,EXIT}_* regions with
> + * unsanitised state.
> + *
> + * Because we might have interrupted Xen beyond SPEC_CTRL_EXIT_TO_$GUEST, we
> + * must treat this as if it were an EXIT_TO_$GUEST case too.
> + */
>  .macro SPEC_CTRL_EXIT_TO_XEN
>  /*
>   * Requires %rbx=stack_end

Is it really "must"? At least in theory there are ways to recognize that
exit is back to Xen context outside of interrupted entry/exit regions
(simply by evaluating how far below stack top %rsp is).

> @@ -344,6 +366,9 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>      wrmsr
>  
>  .L\@_skip_sc_msr:
> +
> +    /* TODO VERW */
> +
>  .endm

I don't think this comment is strictly necessary to add here, when the
omission is addressed in a later patch. But I also don't mind its
addition.

Jan

