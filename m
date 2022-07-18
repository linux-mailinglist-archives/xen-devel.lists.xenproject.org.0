Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B5F577FA5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369528.600974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNzy-0003qB-61; Mon, 18 Jul 2022 10:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369528.600974; Mon, 18 Jul 2022 10:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNzy-0003mk-3C; Mon, 18 Jul 2022 10:29:10 +0000
Received: by outflank-mailman (input) for mailman id 369528;
 Mon, 18 Jul 2022 10:29:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDNzw-0003lX-7E
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:29:08 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30078.outbound.protection.outlook.com [40.107.3.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73d0abe4-0684-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 12:29:07 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB5232.eurprd04.prod.outlook.com (2603:10a6:803:54::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 10:29:05 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 10:29:05 +0000
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
X-Inumbo-ID: 73d0abe4-0684-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ti6t73P2/CjceanZmRVgIMGz05LA06i4nHyrJR3QHCE8wXCg4VUGrKAxXdW1SGM3lFZDWDLvLMVC3zkIMKCXyryw/zibvNlhIuk9fktHQay14RdsBSZISgHxSLu7ZajsSAqGEVWlmRpVrIXLJN+k11K45wfqLzNwjLgNnwz4B4qjnl0lDO+gB6Q85RP4wvIcrfCmeb26ZZC2FltLHeCr5Uu2WniHV/LO1ZJzGwrC48VOk7ctB9egsVhYXs+/EH4/H07f/grHkquKGsPxwz8wxU8gA075E/ao/2rHLKwQWdUlEao4s1O+H6h5r31htIf1Gr3mF97KycjLdgkakXporQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYg+CX1+LwQ1d/pqVZwdSTDwzHClvBRujya0hfw9N3M=;
 b=mKTeXig6ow7uWwBr+8g/GHwQ0986X2U3XLDC6cV/W/+V+ZED23S6sqDLYMzxzWoNudrKXVmp4IoG3uvLQzVA/Pd0O7G6jcj8jTENncnbk+qhGqu7Ft31gDI9+bAIvrvxwFD0ZpZzJt0gR8GUwGegEZrE0z4oFOUmzZcwVGU0VMF+dSjxX4OK0SyO1psIs52AibClDO5PA4vFcES6KS0NPSf++xxsgqoJN05ZP90PXKT63HmfnJiCQ/qXvwC+PDXAXUSo08hQk3ZwqbIN8BPhqrvlW8egLeE3mTh26T+Xr7jsPZuvMGhimNVJsQ6N1vqpIlLST6XfVu1T8fH8TJni5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYg+CX1+LwQ1d/pqVZwdSTDwzHClvBRujya0hfw9N3M=;
 b=0T3eD35nTCWLO/9b7tV9So11g/FsG43WlhIWgA/RQI1pgc0nMRwxaUvo7gErKtLCacCA16764toc827cDJsKm7QcmIRe49UPkhxvgJpb8k8GMMtNYgU/IwBfA98z2CpaJwsNPIXRckWgFg9xLr/b4pJn503+aU3AXIZfPmoIjjkmtPMT1ICpPrRzazd9p45g4Jrcxh0v4Ur9LCMEEpz0PnQ2qyyeEP+61Ys3PzLs4zYjSM8hxWtSZkUDfZkYB6+K2bqbGDb4xDSMLXZF7GjXBBQbjokBsE0mP/YXekFaT58++FkJtA4ZEsGQtqJ1P6FFnBUmigTQzoIU3ZgGU8JIvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68555ada-e769-9565-4224-b543c9e71098@suse.com>
Date: Mon, 18 Jul 2022 12:29:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/5] xen/wait: Use relative stack adjustments
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
 <20220718071825.22113-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220718071825.22113-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58bf87e5-d709-4e00-5c4b-08da68a85702
X-MS-TrafficTypeDiagnostic: VI1PR04MB5232:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L58ofeD8YgPSfToB1hS8u0odymtnCOsEXwuwDrHIHDWSKahYEfW+IYTaiy1xwCdzCs4s34o4mEamsJj3MPo8NKTPJ6eZu5KHfp/wRsHslZfPJk5uYeeTN/yFSI6CGKaa+QQ+GzO9cQLVbVjoJSPHmOSRQ3Hsxp+VNw1KmeX44DYnySoyo6Jzhut8OELjlFzBDtFlkKfXVKKxD4rG18l+Bnc26/Emnx5CBTAApkbNRV9RFc+R3Jcp60wdoSyua3iOsu8nYK67I10fiw8vxk8SyMhPfkZUOhNm4TcafA/QEHwJJ7Oz7ff15xjJeBmM27lQHBfmZwuONIkkwUzwVeqhoGPtNj0aQzQOIKbT3jGuxEOpRwCoau3ncLrHsu6kvVDI++vjC5TmcXe9eLGJfCg5ts9TpAPIkU4nZLHJquUgnpjcUH9luznjXK1iNJAz/Oa/bG3UciiZsG3/UAqbR0DQaGBe+6Sak4uEuqw0K6L7+LV92iW7FQRL91S2PeQ1U9e9kS8P8R8D4Cx1khi9gDJ1cZRUaH7h0LZAWMTI9yrbPk7XXnv06EK6TYQYtpwEwRvCB5PMjqGUKOTzFZYpCT8CEzov8ZheE4bPHcEl1o1+Bx3NwosEMj76SzEwb+BA2JGoVrCIeToH/H0nAXvgT4ZDTmt0WrfiE1kHVt58XqmhNO5M1i8fmsfxV79CUvYtoYQ9WnYVBIYfXe0Jm+i9vGosGvtyDukYxTE5yIMb8axBPHB2WMsnGyJAgoOeIDYtT3Q0jNjuOvs0/QElIPVsRcnznNIVLEiXjfkm8p5Zz2txYkX4FUhUyb4vq4OMQ2TvJZYYSSvwqOTboQj4NGixP6OUb9r+KFFUSSzdh66b2FfeBi4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(396003)(376002)(346002)(136003)(366004)(8936002)(5660300002)(66556008)(31686004)(2906002)(6916009)(54906003)(31696002)(86362001)(8676002)(4326008)(316002)(36756003)(6512007)(66476007)(53546011)(26005)(41300700001)(6486002)(186003)(2616005)(478600001)(83380400001)(38100700002)(6506007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckZiY1lTNVpVSzg1T28xMjFzbUhaRG5tM0x0eVB1c0lCenNrU0JwY0VjQ2ls?=
 =?utf-8?B?NmRiUit3WGF0TlJHZHI4b1oyTDQxTWdlNW8vNng0L3FKcXBPdlk1R0RrU0hZ?=
 =?utf-8?B?MW4wVE0vczBHVW05dks0bDJxdHBPVkRhd2RpYzBtWjZHM21OVm5xbzV3ellt?=
 =?utf-8?B?QkRSNy9TcFA0U29sSjh1MkpDQ05YR0k3WjM4bjRlbGVkZkphVVQ3QXJIN3hC?=
 =?utf-8?B?OWtzQmsxWXhUamRlOWEwbEdrZ2lCK01TZ29pTExCRFNLSUN1dlhuSHZXMW5x?=
 =?utf-8?B?czR4ZUNWaldhY1l3T0VYMFRpRHVKZzZTTVpINVV6K09MdjZqYk5CQjFwNW9N?=
 =?utf-8?B?SVlmWEM2NGZBQU5ydHk4Z0FTWktZYzFFc2J2d2grRERocC9yTkRmbndDOHBC?=
 =?utf-8?B?S2pWYjVtaE1xd1I5TnlacHFUOFNhUkFvTE5OQktiMU9Yc0JrZWNzbDhkL3lU?=
 =?utf-8?B?eERPNW9FQStFWHMyTTFZTnFKSHc2N1NKYnV5ZHZpM2F6cTh5TytkZzNFVitJ?=
 =?utf-8?B?cjJwSmllZ0FTdm5qMXNDY1Y0OVJXTWFnVU5kM0dMbWZoYzFVQ1d5UmVlNVpP?=
 =?utf-8?B?akpVUzhKR21XYUliTUJQOFRqRkhKNEd1VjJEeFQ2YkNQQldueVIzYnRMZWtB?=
 =?utf-8?B?YXNIVUgxVDN4VW95REt6Sk5HWWpFcTVXNnBLdGhWamErakV2clZ6b0VrWmtD?=
 =?utf-8?B?L29mS0RBQUVrc0RjL3NCRkZKMDlDcUhGR1dmQktoZDU2aWg5KzdwWndkbjU3?=
 =?utf-8?B?UHdHNHNuS3RLWk5XRS9TUUV4QTd3T0FwNyt2ajh5dE5BQjUzZTRQbDM3K01p?=
 =?utf-8?B?d0xPaWt1RnFlNHM1MThSQWkrTmcya0FYblNsRjBCaGJiM0NzVm5PMmI5WXVl?=
 =?utf-8?B?UFovUGdMQlVCSlpIWUpzTmtzTjF4TzkvSXpvWlRRR0tGcUIwYmZVSG1NWkFW?=
 =?utf-8?B?TS84SUpCa0liZ3dVUXJjM3gyb1g0cGdCVy9ZUlhsd1ptc3l2TStPK1VNNmFV?=
 =?utf-8?B?eGFucVVxTTkxQm9wVFVHVkFWVDBCeWxKNkRrbCsrRWYzVnl6Z0h0WWpZR21L?=
 =?utf-8?B?c2NaQ3Jva2pQTm9KWEd3ZExEVUFtRFgvMVRoNE1NekxUWVBjMWxQQW9UVEMw?=
 =?utf-8?B?Rjd6NVExMFIwSDZFdEl4akxKOEdhVjA2Q0VBcldIeCsvQ3h2bkR6bktINHVh?=
 =?utf-8?B?aWc0Kys4enBjVkFSbnlhSGlGNk1hUjU1TXBHYzBhYzlTamYrK0RBNlB0T3FM?=
 =?utf-8?B?MFdBZDE0TjR4T1N2S3d2Qjc5Z3M1S0VuUlpCT1lXeTZxVGZjYjN3RlNTdnBr?=
 =?utf-8?B?cWgvMnlJQWVZZ2hjakowcHIrZGVwelJZRGlRVGxjQVZEV0l2MS92dkh4eHdp?=
 =?utf-8?B?cld1Ykx0bk9aTk9HZ1BXcFlTZzEvU0MrZXE3akVlL2wweFc0TGtDMS9YdDhz?=
 =?utf-8?B?ODRPTzRsT0J5cGVoM1FONStKS1pkOTBEY1hHRUtqKyswNXpwM3k3RTdYLy9t?=
 =?utf-8?B?TFdNc0Vmd01SQzYzbHpOTkRaVE9JRlVnVGdTS1VpbThtMGJ3UjNvU3poM1RJ?=
 =?utf-8?B?dVJCK08reUx4aGpiZWdxaDk3ekUrdFQ5SUl4eG5DQUE0dFVlN25vSDBZQ1hC?=
 =?utf-8?B?UVJhZzRCMW5XMVFPZTBBdUdMdEZlMXByMzhRQ1dkdmdWcEpwbVkzalp4Znox?=
 =?utf-8?B?T2FJTnp5eWc1RlZLT3pQWThubVpDcXpDb01aZjM3WTFUa3JXa1hoL241emVo?=
 =?utf-8?B?OEZIdmpoV0FuNlgwVXgzN1E0SkpYY3RaY24rQ1lTSEZLRmtUalk3aUp2ZDdh?=
 =?utf-8?B?VEE0djdUSkFNZzB2STgxVU85cTdtS2N5NzVPUzg4V0pTY2s3Mi9ZRnE2YXhQ?=
 =?utf-8?B?OVBHNXJTYUVJRmJNaWNZMTZiOXpyK2Q5eEErdTBhME4weDg5c1BQZUhPQVpw?=
 =?utf-8?B?dU5nL3REZFhvZnl2UzhqYnRQVStSUTdOK2xjZUZpRHhXZjE4TEpydW5PdXIx?=
 =?utf-8?B?MWp0eE4xUTlNaWk5RC9QaGppRVRpNC9vQU01c0dhelQ3VDYxenpJOHRZVUU0?=
 =?utf-8?B?aTJzT0xZYlgyNldyRzhWR2RHRTB1U2Z6aldpa0hCb2twT3cxcEhBNFArY1FM?=
 =?utf-8?Q?OooPUAD4TVvzwkak9zmxgeyDD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bf87e5-d709-4e00-5c4b-08da68a85702
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 10:29:05.1007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhdybUli+ZJegfUEATQVKnhtpFd/3F2AQmNGSg1yolOffQfaS/xI/veTGm1mwkc8NzovMX/daqbvxFdS3LahbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5232

On 18.07.2022 09:18, Andrew Cooper wrote:
> @@ -121,11 +121,11 @@ void wake_up_all(struct waitqueue_head *wq)
>  
>  static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
>  {
> -    struct cpu_info *cpu_info = get_cpu_info();
>      struct vcpu *curr = current;
>      unsigned long dummy;
> +    unsigned int used;
>  
> -    ASSERT(wqv->esp == 0);
> +    ASSERT(wqv->used == 0);

Minor: Use ! like you do further down?

> @@ -154,24 +154,25 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
>          "push %%rbx; push %%rbp; push %%r12;"
>          "push %%r13; push %%r14; push %%r15;"
>  
> -        "sub %%esp,%%ecx;"
> +        "sub %%esp, %%ecx;" /* ecx = delta to cpu_info */
>          "cmp %[sz], %%ecx;"
>          "ja .L_skip;"       /* Bail if >4k */

According to the inputs, %eax is still 0 when bailing here, so the
check below won't find "used > PAGE_SIZE". I further wonder why you
don't store directly into wqv->used, and go through %eax instead.

> -        "mov %%rsp,%%rsi;"
> +
> +        "mov %%ecx, %%eax;"
> +        "mov %%rsp, %%rsi;" /* Copy from the stack, into wqv->stack */
>  
>          /* check_wakeup_from_wait() longjmp()'s to this point. */
>          ".L_wq_resume: rep movsb;"
> -        "mov %%rsp,%%rsi;"
>  
>          ".L_skip:"
>          "pop %%r15; pop %%r14; pop %%r13;"
>          "pop %%r12; pop %%rbp; pop %%rbx;"
> -        : "=&S" (wqv->esp), "=&c" (dummy), "=&D" (dummy)
> -        : "0" (0), "1" (cpu_info), "2" (wqv->stack),
> +        : "=a" (used), "=D" (dummy),     "=c" (dummy),         "=&S" (dummy)

You can't validly drop & from =D and =c. If you want to stick to
going through %eax, I think that one wants & added as well and ...

> +        : "a" (0),     "D" (wqv->stack), "c" (get_cpu_info()),

... the (unused) input here dropped.

> @@ -220,14 +224,22 @@ void check_wakeup_from_wait(void)
>       * the rep movs in __prepare_to_wait(), it copies from wqv->stack over the
>       * active stack.
>       *
> +     * We are also bound by __prepare_to_wait()'s output constraints, so %eax
> +     * needs to be wqv->used.
> +     *
>       * All other GPRs are available for use; they're either restored from
>       * wqv->stack or explicitly clobbered.
>       */
> -    asm volatile ( "mov %%rdi, %%rsp;"
> +    asm volatile ( "sub %%esp, %k[var];" /* var = delta to cpu_info */
> +                   "neg %k[var];"
> +                   "add %%ecx, %k[var];" /* var = -delta + wqv->used */
> +
> +                   "sub %[var], %%rsp;"  /* Adjust %rsp down to make room */
> +                   "mov %%rsp, %%rdi;"   /* Copy from wqv->stack, into the stack */
>                     "jmp .L_wq_resume;"
> -                   :
> -                   : "S" (wqv->stack), "D" (wqv->esp),
> -                     "c" ((char *)get_cpu_info() - (char *)wqv->esp)
> +                   : "=D" (tmp), [var] "=&r" (tmp)
> +                   : "S" (wqv->stack), "c" (wqv->used), "a" (wqv->used),

If you want to stick to going through %eax, then I think you need to
make it an output here: "+a" (wqv->used), so it is clear that the
register is blocked from any other use throughout the asm(). Or you
could use "=&a" and copy %ecx into %eax inside the asm(). Both may
cause the compiler to emit dead code updating wqv->used right after
the asm(), so I think not going through %eax is the more desirable
approach (but I may well be overlooking a reason why directly
dealing with wqv->used in __prepare_to_wait() isn't an option).

Strictly speaking (in particular if [right now] there wasn't just a
branch after updating %rdi) you also again want "=&D" here.

Jan

