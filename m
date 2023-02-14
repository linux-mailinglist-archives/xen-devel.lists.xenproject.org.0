Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DAA696A2B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:47:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495385.765744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyS9-0005RP-AL; Tue, 14 Feb 2023 16:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495385.765744; Tue, 14 Feb 2023 16:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyS9-0005PU-7F; Tue, 14 Feb 2023 16:46:49 +0000
Received: by outflank-mailman (input) for mailman id 495385;
 Tue, 14 Feb 2023 16:46:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRyS7-0005OZ-27
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:46:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a9fc74f-ac87-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 17:46:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8990.eurprd04.prod.outlook.com (2603:10a6:102:20d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:46:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:46:44 +0000
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
X-Inumbo-ID: 2a9fc74f-ac87-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ii0KvDSsOTp2a2sBR2pNakvk/ovygZFXs+p4UKKBuyVzHvAdzkU2ZNuro0cGAVj5pm6tv3rmMAy0OZThl6B0xCpSIBp8c7yVKYgwWhSYZu8MV/l/V9gN7WYPTGsGRb6aZMFRChI/LH5Q5db0jCibX6VOCDc60FYr8CozwwuaLDTuzuGtDBiIsZT6t/8QLIE2eUmlOhfZAfHDYtIkaFmJ+txGSj8BgvtwJNmxGw3/GPpvzGWHlUq6p+c60Ir5EeYE3ePu27eVRxJdQ2NnARZMHP6Mbsgzm1tJjVBtWvKBmKngWdA9ZbjJZg72eeB1i1S19C6CTR8Ruhc1wBVNZgZZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJe1hIToLj3KLLqgTrfdF5UHgVvY/k7bIj2OVJ5I2PA=;
 b=EibdsFCmEDTjeMLPLwQL8aRFaLf/i7MD1kWst4B4WyM6qZJxpej9LGutdIVZHMiQQKgxCjUCDtZunErT1C1DMhOWJ+oTnkMFzX/SnytLgwM3XqAieHs65u63kLvEaiE5W00Pdn6iCbt/jMoQ5ofHTSyMJ1nqEmMv9WyKsjn1TKV5N2ca07YWR3yYSaWlp0RuACq949wbDF2hB47MmWQ1OBnhsvwl2DiZNN749Wn5DObguPgJU+RsuNW9/PmV/LUDd/uJaDYF6hneA1IQtLcRI5g/yX88yPOCa/SFhTJpp8fswm7U/Q2ut13Ssse0ZQv/XFTvqFJzHiKSgLK9+vIumA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJe1hIToLj3KLLqgTrfdF5UHgVvY/k7bIj2OVJ5I2PA=;
 b=xgKWDo1oQgT+zwnYwDdP9vaY5U6z0rIEb92KFm1qflWOFbEKmqiLNciZGGps7Yl4B0IIjyRK4y2vb1jMrfKLERiw1Fo2bx0NY7kxwKqS5XEMj3TMsTUYS6N+0I1Hhoe4RMt+eM1czajLt/UsWBPEDFRXFoXS8h7xD/B9B8ojQvDcI55lSp70T4H5c0qTdcgItKHpaQIKs6fqfRQCm1GnfZjFvOkfx19r5bYNYUf5Cl3/UNDNrSRRubutg5xo3BpRdjsrgKoGqeynvjlbClFLxfNwnnezCOfJKTrYFCZ/8mPFAkVmyf7kdBss520l7sklwgQOe89qVkVrq+FQa/YNFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <883a4563-9a37-eb17-6e91-03216f336e99@suse.com>
Date: Tue, 14 Feb 2023 17:46:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC 09/10] x86/ioreq: guard VIO_realmode_completion with
 INTEL_VMX
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-10-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230213145751.1047236-10-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: 21801024-76fc-4684-cfba-08db0eab0dd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cubs679a0WTg5QhgvT+xEXEnvaTHby36KU7OB2apDmg1qWUVZdiOwQUTpwYxGgizSNkkPifUb2rZPjaYHm7cvuIUJJ0T6wwJrg2M+wASt327Wuh67aXmQFT9ca7LxDsZyuG2TIZnd3UjYefWsTKoFovJ+ISuQPBXw2CIb+z6yCxDrlUjsEMXqXC/ZY9+jUlIOg/sl8//MVAosVUftyNrBGKabrdFyMoYnOPZn5wLyJo+VckPypriEZlK6hpi2RD1mJWlxJF2PLRQx/C6Cy0GoSQKDYgC00Eg77XFa8inkES7eIHRiu9FNdsEbR3c4AjMtwHc9E35+flqK7nRoxkfrlDzujpeHFSia3EEj1jpM65m334u2TnK9BVVCRYHYYtqH8NnmLygYOlnFRv1k/ensj2pXZvmeKRtwAyBIDwgvpl6+yWNSfDkH6ttjFt9NDDrwkEcVEyUsR+D/u2dq3jHlgW5/G+C0OKrQh6HGv69xMMeUSK/sGewovcNyhDDtOO7GZFFFKcWXdhoCqLEqdGBLfYK/JgSoRui8cSLVtLf7F34h+Rzw+FLqWBDDB8bIFg+DJROXMl4lT8iVHdjNsCYwt0rw5Vs2188aGBxo9o5AWOX5SUY+d3z07qxDqdiNF6VZDLOqsaCarI6i8LU3ECcZVpHbVqtTYJodjYQdzhsDCrsG+Zxch4tzeVRrIo26D6TShlS4e6a/UiZLaGSSwMTrL4rKHqG6ckDvuE+Z/qMcKI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199018)(86362001)(31696002)(36756003)(8676002)(54906003)(316002)(66946007)(4326008)(2906002)(6486002)(478600001)(2616005)(66556008)(6666004)(41300700001)(6916009)(8936002)(5660300002)(66476007)(38100700002)(6506007)(26005)(53546011)(6512007)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUtmMkVoN2paQm9EOTc1VTNNUlBsdnJmclM4dGhOOU1pdDlBaFNTb2NOdXg4?=
 =?utf-8?B?RkRvY3JLU3FYdUF2c1NXUjRrTi9xVXFrMXB1ODhLaUpNTnlCQjhNZ3pFUTZV?=
 =?utf-8?B?Qk8xN3ZVSXR0bHljOFU1N3VnVHlmVFRTREVxUHhSTGl6TFlaelFLRlFTdlBP?=
 =?utf-8?B?eFluQXRaMUhybmRzMDZONFp3MHZ4Qy9NSWJNSHZ4aDViN1NmOWt0Mlcrc1FG?=
 =?utf-8?B?MFovMDBZck9tZWMrN2U2UURoNk1FNDZNWC9EeTlnaDJ0aWIvTDMvRk5IZ3Ny?=
 =?utf-8?B?R2xuNkRnbTF4aXczcDFzWnd6Y0hiMTJwY0ZzZ3ErVUZBZ3RLNmZFUklCZmdm?=
 =?utf-8?B?YUxMdk5POXh1Y2NKaVhWWEhlSmZwaXduN3BhdHl5UHgzUkFaSUo3c014em9n?=
 =?utf-8?B?Z3RQbWpJQjVvUE55NEZONk1rRnptQk9wK1lhVk8zVnVGUTNxcjdYSlpOYW15?=
 =?utf-8?B?YjhOU1BJeTZlZ05TRXlEeHdhU3pabi9WY21aSEtSbW5kaXVzcVc3b3BlZWVa?=
 =?utf-8?B?ZWc3QTRYQlhrU3UvM3NzZjRZakV0OXJDYTBYajk1V3Z5a2U2TWlJNE5mVlI4?=
 =?utf-8?B?cGRCWm1zOGdwWktLRlYwQlJjbnBOVUZNWG9DS3dNYXdhVHZEK1ZhOVFKUlk0?=
 =?utf-8?B?TVpGUGdhSkNXNmduRnFPb1VlN0xobU1PSmlmQkxmT3MvNTZYVmFPT25QdjRD?=
 =?utf-8?B?WHZSZDZva0xMbDZpa2NtS3hoZXZZaTJWYTN2cEtBL0ZpOTlnRmVHcTA0aVhq?=
 =?utf-8?B?TGNsYlRVTkFJbVJNK1BvUmtPZjlxK05JdWQzclpPN3JVb3BwK01VSERwZ2Qv?=
 =?utf-8?B?c0pCcDBhK3gvWG90S1VIMjlueEx1a3JaR2VKSzNFa1h2MVU1Uk4vbmQvSFlx?=
 =?utf-8?B?MzNqSTZMNGFjTWxUdW9MaXpNdTZ0MTlEM29raXdkRStNOFZtMFJuUGZ1R3ZX?=
 =?utf-8?B?ck0xa3dyQ2hDSjdZR1Y5VCtjbk5acXlyRE0wOHVxZ29yUjd6dGNGMGZxVDZv?=
 =?utf-8?B?enNLTmYvMlpySTZNdHVodkVLNkViTEphNWRxU1VKS0x1K1gyRnhPU2RrRThK?=
 =?utf-8?B?TmlvSkhlaFhPMkJ6ZW5rdUFPbHZXckNkWFpIenB5NURpQVB3QmhUWHREODRw?=
 =?utf-8?B?T2ZvL1EzY1hoL3kzRzlxQ0NER2lvV04rS2NHT3ROTDc0V3hhL01hOTdiMEN4?=
 =?utf-8?B?OHI3d2JYWjNxaitGZDlpTGRMM2FpVWhxenVLSmNXZDBmMlNyZFdWTUVNNHRz?=
 =?utf-8?B?VVpXN2xaVHNwRGIyOFh3VWNpVllnQkhDdTlzcmdOMHJVVFhLS1RjREpZdVJD?=
 =?utf-8?B?SEtDT3hGRUFSeitJVm94NXlPb0o0amxvVG8zVy91OC9rbktabkJOS3N3MStv?=
 =?utf-8?B?THZ4ZEUzaDVWTVhtMzIwZDdTYlgzc2szdUUvYWVsUTVVc2pVWWlybi85TUNQ?=
 =?utf-8?B?ejdYdkl4SXhJbys5WE5sWVRxdlVVWXI4elZOaWNTdnNJUEtvSVkxZDY5L0ZM?=
 =?utf-8?B?TlZXZmNESVZndW0rZzJqd1ZvQTUyZ1ZHWGZROGRxSVcxSGo3VGpOVThMTUVv?=
 =?utf-8?B?bldpOHVUM3FJSk83b3IxcE1MODViYm1ZK1kyQXB2TXJzY0NxWHhMQUcwWG9a?=
 =?utf-8?B?Q01RdXR6TERMMHVBcUZEbkpQWDlmNjdzTGFKQ1NiSnBLNHNDbCtIVVQyUndM?=
 =?utf-8?B?NmRKRGdaUHZidWRSNjFDWmN2RjVxOGFYajlERjI2VlhUblJVTnUvTlY3QUxG?=
 =?utf-8?B?MUE5R2tBRCtkYVl0c2NkdUIyWGhsVi9Tb0tmZ3l0SWExcC9GdmlSUHc2YnEz?=
 =?utf-8?B?K1prYUIzY3R0NkNRbkc3U3dmSWtTTzBjai9YTE56UThsWlNsbUFHZWJQWlhP?=
 =?utf-8?B?QTRhK1dEbGtVV3VNNE8razRRaFU1QzNhMlJ6N0dGeUE3amFGaG8rVnlCQnJr?=
 =?utf-8?B?MU1SQ3VuTks5cUNRaERnalI5cHpMSHBGLzFsNm9QNlZIL1ZUcnZ6RjNWZkU1?=
 =?utf-8?B?RzJZYlIwTUo4ai9EaGpLRTh0dXcyL2MzQStQUm9ieTJiYWpRa0E3Umg4Q0Zq?=
 =?utf-8?B?ZHJldFY4QUt1dVJucGUxU0tjcGlmQ1lzR09EVXJUUmtXOGVaQlExNS9nbTRK?=
 =?utf-8?Q?OG+L29CX1D6KzvNlOCHeZkYsR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21801024-76fc-4684-cfba-08db0eab0dd2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:46:43.8735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6lVMKoeZZdwIJ1YgGph0jKugfUB6vKgySzomOgTfRjC7/MbQf9XIBpo7T+BhPPwkcCRqWuTCtRc1qTcMDbPRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8990

On 13.02.2023 15:57, Xenia Ragiadakou wrote:
> VIO_realmode_completion is specific to vmx realmode, so guard the completion
> handling code with INTEL_VMX.

While it means slightly bigger a code change, personally I'd prefer if
VIO_realmode_completion simply didn't exist as enumerator when !VMX.
Besides ...

> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -44,6 +44,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion)
>  {
>      switch ( completion )
>      {
> +#ifdef CONFIG_INTEL_VMX
>      case VIO_realmode_completion:
>      {
>          struct hvm_emulate_ctxt ctxt;
> @@ -54,6 +55,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion)
>  
>          break;
>      }
> +#endif

... this use there's exactly one further one which would need #ifdef-ing.
I think that's tolerable.

Thinking further (not necessarily for you to carry out) the x86 version
is identical to Arm's when !VMX, so it would look better to me if the
entire x86 function became conditional, the Arm one was dropped, and
common/ioreq.c provided a fallback for the case where no arch one exists.

Jan

