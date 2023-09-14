Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E207A0A60
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 18:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602591.939249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgorW-00046P-Fb; Thu, 14 Sep 2023 16:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602591.939249; Thu, 14 Sep 2023 16:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgorW-000433-Cf; Thu, 14 Sep 2023 16:06:38 +0000
Received: by outflank-mailman (input) for mailman id 602591;
 Thu, 14 Sep 2023 16:06:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgorV-00041l-0H
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 16:06:37 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20611.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad2b55fb-5318-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 18:06:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7523.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Thu, 14 Sep
 2023 16:06:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 16:06:31 +0000
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
X-Inumbo-ID: ad2b55fb-5318-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UV+Dn7aPOsYw3JiG4UELdseazJMqUxquPAnbCLu2CvlkqFGNUQGNRQ3E5LMiLxr7k93SoBs6kaUsx4cQOLBWj31Att3FuYM3FC7g+REn2dqXKYE+SEuWB95w13rO0T0HeS9v3PW3q+hru71S0QXcIbEBnZW8E4jIXr3AdQu+voNGWdc3tfVvBjgjgPIupF4XwynK9grUK781WUDLxhWdgkyBOVRf/xBaztHT41IqiJoPJE7cioDZQGEd1KZJdgsnPftchGR/A3L4jKov0n6FSaF4+NpJgg8dHmodDxN2gc/jWtWZ7rKJP653KoM5yCI+rKC0q0HxfpaghnsXLJwLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gA23pgaGUlyKDF6n68ya50akqejBJWakQw3dXMFGjXc=;
 b=HgZ0kx0KyMY/jvi/jr5kYlQJtEGLE0b8Jbvn0CQ3+56mjZsltIwraBIE8OrKscgOLuWtl4THRVSWGIu/QZLBtuAYrX/CKscDDlzeDOVBhmoUlE92p3r36LaeFzQNwuVEqP8ybFnoL2SkRvOqPTDj8VcRDH2Z2ZYVuggf4f1oUXgT7Cuxl40VE23uZC1B46SuQW4J08SNOAjPakHTB+2csnLsxuI6F0XZ/AafJhCnojLMd1pWeYy+izS2PMKiA4QzkHngv5mSehgtHYCZzrRC7FQwH4LJ6EO6w9QY4IfxcFD1vj53ah+v2IFiVeS1TlOAZ8gmjJRX4hl+d9LlW9gNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gA23pgaGUlyKDF6n68ya50akqejBJWakQw3dXMFGjXc=;
 b=Nt7tgkx/XphaDvYIYBWcFOlo+truuVtjDtABZv6bKpfkzaNTlJnHLIGwKOD0K5Mu12kOazYgjQGB6HXZMBpXdBMR6zu98jIWntY0+Litv2xSG72DwjPQH5Jd3OoGv+J8nW+io8v3ZuemLdSCEWzjAEvn6DLnc+PJpZd5ZkRZ2qGqbyQD6/TcMr+2YJ3k1BUI/hhAdEqdyWQdKKnYqxGG07uoUpj5I2NF5OoBF84BbEuF4Y4HI2+G9ZlMwrZIdSD/NQgDtQMzOFEQZO12x1O9JNNviNb7NwRDNnIENb8vh7NKuTFYg3mI6AxYUrmbN0+0jliLqpW91o1J9Z9xSLQfyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c847e46-6890-5511-dda9-b16e8b0ac7ab@suse.com>
Date: Thu, 14 Sep 2023 18:06:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/5] x86/pv: Rewrite %dr6 handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230912232113.402347-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: e1cb055e-a0bd-44d0-1b74-08dbb53c8f87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3Qd9XroiHihIowIwLAJibuPBG8BnXn7qlJ8Dcr/2/1xZ9pNDWbByhKxPWHtGpQUL+B8t+MNQ9KuGJv6b/MMJLv2NlIXMbdrJN4EZLOalsTGSAe64jMcWoZHNEuerYSPZg7RW7A7Aktge/VcecXczHQ/FzaKQg+WRog/BpGbhaKCFaxXII0n5X6bvAHcYsO8yQ3OS/1vg+9qywWK6MTCYiXW7cNumkqAMxPphsyqKbnuLik6/EGeuOTmu7I3qngk2XuUT/pqN3AUFrwYSTPE+ZGkfhq2bsTNEZJi8YvHATuHV+V8hraMUEQHPuQ0Z58Y3s22w9Cb02IA8qdjTrXYzIUFySnoY45QYBTZAGmswY0i+Xctq331UJimCNjlNLoIIPyeq3i5lHTPpVsEeNce0Sjdnz1bCKufu9k3DNUpvX47LiCYZuxhdfYHwj2yLK7LqMsri2w+FCbmcSPziG6HP3AnAQYYTfSmLwjIgqWLwZMaLBTXANemWUGDp2o0D4E7XTnbehQRXDuEd6BbHiGAgJ5QS3lxuEKY8Xxz7N1Vze1Jobvb+W4tIUh6Y7q9d13tAsXp+ghoX8cOTacT5/Jh0x1sNHRrnMpB5IIt69RT6m+bBc6T9pZFbAWhf8b4smaYE2xIQj/D0+/FA1dlLT7BpaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199024)(1800799009)(186009)(2906002)(26005)(66476007)(66946007)(6916009)(316002)(41300700001)(66556008)(54906003)(478600001)(5660300002)(4326008)(8676002)(31686004)(8936002)(6666004)(6512007)(6486002)(6506007)(53546011)(36756003)(2616005)(86362001)(83380400001)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWozbTZMOVJXbnlwcThESHdxQk1aVVZIaXdCR2kyUGVxNkpVM1BLYXZETEZR?=
 =?utf-8?B?RWVyU0I1NkY3ellwejBTRGFnV3J5MkFlZFVueEdOcEdvam5kcFZWcW9qTGRN?=
 =?utf-8?B?djZFZFdwTTFDV3ZicEtLUlRXN2lYZkZ2QnpEdlUwNHAyMUdSazdURW16NTBJ?=
 =?utf-8?B?N2o4VTBKSVVHd0RNK2xZTFlteE8yYmkzTUxpZ1QyMk1ZYkVlaXcvYUtNTVQy?=
 =?utf-8?B?cHJnZGNYVTYrR2dvQ3VkWGgyZWZoSGJXcjFqQmtTS3ZnQlFWdURiMXZQalkw?=
 =?utf-8?B?Rkw5Q2hkR3I4eElzREh0cGtBVk5LRVVwZG9qV1NFRk9wanRXQm8xajUzOE1i?=
 =?utf-8?B?U3Q5OXdMUFpEYmlxS2FtNGlQUHhkZjM5RUNvUkxGZVVwVXBkSzgvZjB4dkFs?=
 =?utf-8?B?alFVMGdsMTJNeDZkWXVRYnVobUNqUmNTamNvZ0Y4N0hUOUdYZkRrNTlYV1BX?=
 =?utf-8?B?Mi9tRG4wSjVjUFdWMGkrRDYyLytKd1NicmNoWjk4K1R6emVVMWtqUGhNOTBo?=
 =?utf-8?B?dERBV2R5SnFmakk3N1BjQnZGTG56MkRsRFhKMHdGRnFOdWIzdm5YSTRZSWtM?=
 =?utf-8?B?NmYvRkRzTVA0L0RzV1hQL01hTWs3MFB3YjliRG0yWWw0M0swWEk2K1pzSWpS?=
 =?utf-8?B?QnpsVjdDekE1dnAxanNmZk43WFZiVTZCUGo2dmRncUt5RU9NQSszV1l0RjYx?=
 =?utf-8?B?SGZIMWxqSU43ZVRxNGNFTUhJOUY1WTZsMnlUUjlaeDJneTIrM1gvbm9ZNjc1?=
 =?utf-8?B?S0pNR1A3VEVNdEhod3Uwd2hpZjN0NldIa05JRFI3MVZJbWYyNzYya3BaNll6?=
 =?utf-8?B?eFJVVHEzUmZOYkVRUzdSZVB3Z3dkZDgyaXhUT2xzTVJGNmRpMVdsUWpGYVAw?=
 =?utf-8?B?Rm1oOHIvcE1ieG5xczBVT2dkTURiY0NuM3k5U1g1TTYwMG8vaFhXTGZZcWZC?=
 =?utf-8?B?QzF3TnBiUk1NNXB5OEVJVnpqSno5cHpQVnVhUWhGTDdBcnoyQ2F3Wm91WkZi?=
 =?utf-8?B?UmcxRWVHWTJuK1dSR0pXSVpxNGFFeDVlQzFXc2dJcUxRdktueVhGQVFQN1FG?=
 =?utf-8?B?Y0VOKzhvZGkrbmtYQW1Ta29XVExVVmppaFRYdEtMSGhlcUpONDlsWFFJVlpS?=
 =?utf-8?B?NTRiWWVxKytJK3ZaVmp5MnpKeXB0S0dwMFRRMFRSOE5HUE1EVG5yVzBGRzY1?=
 =?utf-8?B?MXpoYk90NnBiTkZVcXc2QXZsRnBwTkpHZjgvL1Q3bHF4dk5sVzJ6MFNlTW1W?=
 =?utf-8?B?SjJIWEExa2owc3RmWWRRR3pNRTRSTytRcXRtWlBNeHhqUEljMjFzUkVaK2Jy?=
 =?utf-8?B?d2Y4aVkya21ENVQrZUNPaUdRZEM1Z25PZjdoR2hxZWhlS2grckwzQ1pPYkdn?=
 =?utf-8?B?WU9ybXZXUStSVHg2QWtuUjRvTHI0WkVKczcvWHJBUTBMU1hDNWdKSitsSUVl?=
 =?utf-8?B?WFgrK2dwWFJCbk9BaS9IeC9PaVA2UW81amFEYTdUczZXQmRUbmJrQ3ZKazZT?=
 =?utf-8?B?SUVIWnhpUGE5QUs3NHpBY1VTZ3JEdkx5SEtYajIyL0drbHpZbWVBTWsrQXVl?=
 =?utf-8?B?VDJZV0FSSFgyMk5mYnZPRU54MzZtVFZjYXAzeVdVNUJDaFZqVlduMzVNQTNN?=
 =?utf-8?B?YytoN09kSVZkVngybWNXR2t3ZWpLTzVuYjllZzRoeklvV2EwNXVLZDdhMXdH?=
 =?utf-8?B?ZHRvLzBEUU1YcUlmMTRDQ015dE9HZ1ZPUkEzb1dVWlBMVm5wd1pmQ0ZRcUNW?=
 =?utf-8?B?TVZkTktiYTROek52QTNIQWJaUnE0aTMycVVKTUVyNHVsbXNZaUxGMFBpSUlF?=
 =?utf-8?B?S2FjSmJhYjBxcmQrc2Rha2YwMTk2N2l2R0NqTDJwZWZ1TUx1b0gwUDlvTElM?=
 =?utf-8?B?aWcvM3ZNRFArNHc4aHlkd2syQW1ENUxSOXN2NmRuWGcxRWVvTDdtYU9XY0hS?=
 =?utf-8?B?NmEyZWg1eTlWSUttWDNWdURDdUtGWVEzR2M0VENZQ1JsNGFObStNWFJiOVQx?=
 =?utf-8?B?V05RbndHMWpzYVk2ZVdOU3MvR1ptMGpHdElCbnUxTVRWdGp1enFRVDRweFpC?=
 =?utf-8?B?UGxzazBQbXJ2NTRpdkVjNHRlT3JYbk8zb3RqRGFkMjVuWTVCdWVuNEFIMEdq?=
 =?utf-8?Q?osB8u9vVa84Ek6I3ZEr+HiDcI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cb055e-a0bd-44d0-1b74-08dbb53c8f87
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 16:06:31.4891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kb3RGzw0h9sBqBHNH4qhVTtE+LQw/z1ZGds1QsjwyEgNKYeuRBn/m/HAMyynt4kvR+X2qrhbJ25+/UGzuiBnOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7523

On 13.09.2023 01:21, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -729,6 +729,18 @@ static inline void pv_inject_hw_exception(unsigned int vector, int errcode)
>      pv_inject_event(&event);
>  }
>  
> +static inline void pv_inject_DB(unsigned long pending_dbg)
> +{
> +    struct x86_event event = {
> +        .vector      = X86_EXC_DB,
> +        .type        = X86_EVENTTYPE_HW_EXCEPTION,
> +        .error_code  = X86_EVENT_NO_EC,
> +        .pending_dbg = pending_dbg,

This being a sub-field of an unnamed union, the build will break (also
in pv_inject_page_fault() then, for cr2 being switched at the same time)
once again for old enough gcc.

> --- a/xen/arch/x86/pv/emulate.c
> +++ b/xen/arch/x86/pv/emulate.c
> @@ -71,11 +71,9 @@ void pv_emul_instruction_done(struct cpu_user_regs *regs, unsigned long rip)
>  {
>      regs->rip = rip;
>      regs->eflags &= ~X86_EFLAGS_RF;
> +
>      if ( regs->eflags & X86_EFLAGS_TF )
> -    {
> -        current->arch.dr6 |= DR_STEP | DR_STATUS_RESERVED_ONE;
> -        pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
> -    }
> +        pv_inject_DB(X86_DR6_BS);
>  }

This (not your change, the construct) looks bogus at the first and second
glance, because of looking at EFLAGS.TF after emulation, when the initial
state of TF matters. It is only correct (at the third, closer look) because
the function presently is used only from paths not altering the guest's
EFLAGS. Do you think it would make sense to add a comment at this occasion?

Jan

