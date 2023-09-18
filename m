Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98F47A486E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 13:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603957.941121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCSV-0005Tv-2G; Mon, 18 Sep 2023 11:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603957.941121; Mon, 18 Sep 2023 11:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCSU-0005S0-Vp; Mon, 18 Sep 2023 11:30:30 +0000
Received: by outflank-mailman (input) for mailman id 603957;
 Mon, 18 Sep 2023 11:30:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiCST-0005Ru-Pr
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 11:30:29 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe16::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c42b88c1-5616-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 13:30:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7597.eurprd04.prod.outlook.com (2603:10a6:102:e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Mon, 18 Sep
 2023 11:30:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 11:30:26 +0000
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
X-Inumbo-ID: c42b88c1-5616-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbMztNhPewpouHWzdLqzLOIG0jAsDXutlgP9LN0XXpHP/3uHVoPjLHuzRkb3hlnmsfNntlerzap6MG0GdG/Iu/nkpNaFCY23sxx6c1sbf4xOgLSk+GTnMkiyqsmaDaYWfvmQDSwK1ZQ50fj9p+RNi9FP29LjpQ+6cBJWci5jUGE9ifsjOi9cRxsTVlNmoFos2c9AkzGnf9yoHkszJYBlrQXTlre8eOV7g9XHysnYqIE7TsbGwmFgdPjRAiX85VB0Zt2/yqSkgjMKkEncaBfNfgPjTofZvhUsJSH2ymTTzR7oAObfL+yYcJE6hJ9ZTmE4NThztDUX0j8BDeTPXPusPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JDSYxVnSlz5lwFX4hWkdv2lsNrn9IqMBRfjug9tiJs=;
 b=ONnF8sjcOVxdHOPNGb3pgO8/plEKvWj84/84FootQUl36kgBmVfubEN0A3BrLsuI/vEK1W00TaBqalJ+dL9p72ImKiSmShXtmHwh4tsCj2qGF+2swDXBFrlx4fMMkstLn7R/YunclAWMA+6v0beWUAQprFKIgD0wJRLQoe9M+J3rTuxPG2STMtXHSUK91zxrXyZhWnEzdlT7Lpv8xCQdGh1xW7mZaeSNXDqyTkROmWt4foCXJMp+Wxyf8nN70153HQwIhuzmw8Q29Ju1Jxb6cYg2UV7eJWXMbhzD9pRQciz92wEO3EZBk0bghQ/4Zrx6dMxm4G/+EviiUBgOKBp7Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JDSYxVnSlz5lwFX4hWkdv2lsNrn9IqMBRfjug9tiJs=;
 b=TGWltdL+7d+ofFoaAoghXCpDRVNjgXTrea9WWRCiat6+5md4K/nCO4f7YPXoplKfIxFnANrw/9K41UA7RrrCxIQ0G67Li8oYRZ0AII1l/1urvAWj1byvsnD8zGT3DcJBRppJ3L639PDrGAgg3rBCt9uXERue6BCm7V7zt1xFpwILNzZiqUw8bhmnlmpWb4zhDsQGw/K7cbSNcb64MKQVD9SdXY9zJAkWM9VY88u5eovUL7UF0t3edtawx33kBCAUs9rjK6jAmjdM7/5ypGTaPlAgJo0tLRauYDesZeiqtyEPMNBdfJTciyjnThX7XnmrNqVmZ149VkBy+hRpNrKdnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <311e2920-5e91-b9dc-77a7-263272a79a90@suse.com>
Date: Mon, 18 Sep 2023 13:30:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/7] x86/emul: Fix and extend #DB trap handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-3-andrew.cooper3@citrix.com>
 <334fb537-ef7c-97e1-3274-736c4a2549b6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <334fb537-ef7c-97e1-3274-736c4a2549b6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: c026c74d-ee6c-474f-9447-08dbb83aa790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UHZUfCGYU0RH6akt8hLMZre48zOhiQZCdX4kZ8lvk4kUdY+yNnTVenG3aTldbXkcEt41+98g729BOY6nlbLeiFLiYPRGgEkHux0eQI1k44vEM5n9ysBjGY6kEX7pgCzvPr0kRN0liJB8WcBPg0vA3RnAYunj4QdTJhKdOOP2Q4BS/KPXVSegalJFUnJ0EZJnvw8a8RfEUzkMPzTSIbDi8FCbGqKtzQCij6N+9YD6cCAdztRB8GzEmDeYd8ccBwZ1Alo5h0ydebaO1xfYn9L7T3HvX30LxbUQvI3SznIINOxWUC3KwBaiBFoQeFY7NX6nNkpapai8puziWMT+Xt+ww9J3fr55UzKtKA+Ksleng0ppg/y6u2mRBqLPhhHbqkErGB+jg02veFhFN386a/ikLZM+BSFp3sZ9TkvGGRrtSL/OU+3TJrdUQIvTdtLwwKhYdf31oQesi3Lyfq6+3KZRJpc0art0WQ0zZIQJnr9Hb/na2NUAwSMV+ODFtojeORLcrA0R34HKDH4Jc/pWEdKJpXVRrl9Tyb9MWAcZ2KjbkSbj54G8BOfGb+sT34JEr1wXqLQIuQYFjQunESm2EbNn1zFq10PbslO8pBdyx0xptH/KGzH+/AlobaQyZI9zMDj+HzEM2Kq+5rIxfwvpKJGFFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(366004)(396003)(376002)(186009)(1800799009)(451199024)(6512007)(6506007)(6486002)(53546011)(38100700002)(31696002)(86362001)(36756003)(5660300002)(2616005)(26005)(2906002)(41300700001)(31686004)(8676002)(8936002)(4326008)(66946007)(66556008)(66476007)(54906003)(6916009)(316002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFR5dlkwbVpyWWp5SmptaG9SaVJhY1JVb2FQQXFmZjU3dUJSS2NyMlptSWgw?=
 =?utf-8?B?dzZ6RmUxOUR2cDc2T3A0ZVBGMFZtU1JLT2ZkenZLY2RrbllYZktWRE90Tm5M?=
 =?utf-8?B?QUhuYjhyaU9RcUYzK2xpcEdzVHBiaTJaMGZwWlArelJNamdVcmtqWk9BWVpr?=
 =?utf-8?B?dDBQSVFxN3dvbFY5WDNJdHpudjFUTFFiS0JSeEJCYmhtUitOUyt0T0ZPZmcw?=
 =?utf-8?B?MkFSdDZFY0hXYjBOd2hUek9wYlQ2RWFFTituKzBkazFEMmRmVVF4QjBJZEJk?=
 =?utf-8?B?eXh0T2J0RW1JdE93ZnBtSE0zSEpkdEJPamJHWmFrMnd1WEVRNkM2NlMvV1Ro?=
 =?utf-8?B?VnVYMDlkaWlDRmRJR3FocDJUZUlJNUk1QTlJUjFIb3piaWpGbkFVRVk0ZTJX?=
 =?utf-8?B?bnNSTlBSMmZRa0RLMldsdzZoYUI2cnBpN1FyY3M0dWMzZFRGbnYwYVRhb0Uz?=
 =?utf-8?B?MGpBbmUzem9KTXFzcGlLajVKbDR3WFZWWDF6VWk0STBhOFdiNGJQTEE3UzUx?=
 =?utf-8?B?Q3liMHhGUG45eFVpeFpXYno0Q2hleVZiOTl3RGdzU0FKbTN1K2lIQ0NZekRt?=
 =?utf-8?B?OVBIZkZJRUpKemhXeTZhMGV6QW1PRmllVmw1bTZLLzZKL2RDaVBYUHFXZUV4?=
 =?utf-8?B?aEFDdkZsTjZHS0o0TlpRaXE1N2YvbG51ZjY2SUExaEg5MVoxMW82MTNHNXBN?=
 =?utf-8?B?UzlpbUZDcVRlb1c2VnZnOFozVWtUUnEwUUJlNlBOUGd5Y0hBVmw5c3dCMTFy?=
 =?utf-8?B?S3BOWjNEQk41VDVsZWtCc1A3enBRSzlURVAvWkVYUWFVcXYzQjl1MWtaYXhL?=
 =?utf-8?B?YjRmN2dwZ0NCT091MTRlQlM2clR5YmtoTjM3TUVmekRyVzV3c2JraHZsVjQ4?=
 =?utf-8?B?WDM0WVY0RGRKTCtVK2lSSnFvY09tRGkxR3FnUEEzczlMa2NKY2JISFlKNUFs?=
 =?utf-8?B?MHdPeHRNekpLNThzd2paZjFCdnk2VnZFM2NqUmkvOXIzOUJSYmVaUktPd3pr?=
 =?utf-8?B?aUJlSnFYcVZMeTBTdWlmYU1GTThSM1J0bGUrc1NabWc1OUZvUEppOFQ0T2VX?=
 =?utf-8?B?UGJLcUl1Q3BUZExoUURqQkVlbEtxeEpJbTdsWlVwNVB5MXNHVHdNMHVvbndV?=
 =?utf-8?B?Mk1LTHBJbjd6RGJIVmlETWJ2WFU4NEZBaWlUaUVISm1uc3h1NU0ybEJ5aWds?=
 =?utf-8?B?ejZwcEtWN2YybkpqY0o2K3BubHNNWjJpcms4MlJTbXlid0RDWDMrWFhEWUFw?=
 =?utf-8?B?KzFyK1VNcUk0cVlBYlluUEF3U1Ywc1NaMUdKNTN4RDlQZDNSUUViMkJBbEIx?=
 =?utf-8?B?RnljMzNHSU5ibkREUU0rSllSb3BtMWgwOTA4MlBXYUVaRDNnZDg2NWNkNDFn?=
 =?utf-8?B?RGRGbXA5RGExWXdyb01XV2xZSGM4TlorbERiUk1nWkxPVDJBcDZpS2NjNWpU?=
 =?utf-8?B?RUN5MHMvOXRHT2RsWkhsRzdVR1RYdE9uemxpVlF3ZW0zVkZSbTcxUVdxTzJU?=
 =?utf-8?B?RjQ0WldYUWQ2R1VrNHpyMWtodGJ3cm8raERhc052QitqS0lNZ2YvSmpsQzB5?=
 =?utf-8?B?eHFDQ2M1bkhNbzZOUmVuQnk4a2h3MEI3R21md1FDT1pDbWQwV29VZmlmdkEw?=
 =?utf-8?B?dFpxT1hXNnhqVEVIR2FNZkxCWGdmckIraC93UjB0SFY1YUxma2pxeVRZRXR5?=
 =?utf-8?B?RWZYMDhlU3FQT3UwMEhyZDVzczdzSDRrWjE5RTQ5S0VwNDNKaXMzNGdLdGxm?=
 =?utf-8?B?U0poM3pKOXZsZUVhcVZqc08wZGlkdlJ2NW5tVTl6T0FTci9UV3RsZjZqTEdo?=
 =?utf-8?B?NDRCWE40RjBnam43Z3haQklpSTRUWU1lNTlYUW9QMXp4b2F5SFM0WWJFTzVz?=
 =?utf-8?B?b2pJeG9JNXlRQytpck05RFZ3ajRxb2g3alhhSWxxVXpkQTBvQkJVK0tMMzFw?=
 =?utf-8?B?YVFSOVp3R3NKNWRvVitBRlVWNnN1U3pGeVROVmJDV0wyWDlKdVp6ZUVKU3F5?=
 =?utf-8?B?K25WVHpZV2NRclZGdmRpOWlIaHpuLzBkblVUZUs0MzFxZUt3VDQ1N1lrUFhW?=
 =?utf-8?B?a1lTMS9VZU5zSEJKRjZhSWd1Q3pCNnFuSXlKVFFuK0kvZ2JLR3drcm9mOTBG?=
 =?utf-8?Q?0qUX2siNpEmY5qMJr3hzGmTi0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c026c74d-ee6c-474f-9447-08dbb83aa790
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 11:30:26.3215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xiw1NbArYWmTotT6XXsk6yE52obANPsse+Dgi7KEc6tVf4DPHiTCEDtOqtsLOBqrIPkctZoFML/fzOEfle48cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7597

On 18.09.2023 11:24, Andrew Cooper wrote:
> On 15/09/2023 9:36 pm, Andrew Cooper wrote:
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -8379,13 +8379,6 @@ x86_emulate(
>>      if ( !mode_64bit() )
>>          _regs.r(ip) = (uint32_t)_regs.r(ip);
>>  
>> -    /* Should a singlestep #DB be raised? */
>> -    if ( rc == X86EMUL_OKAY && singlestep && !ctxt->retire.mov_ss )
>> -    {
>> -        ctxt->retire.singlestep = true;
>> -        ctxt->retire.sti = false;
>> -    }
>> -
>>      if ( rc != X86EMUL_DONE )
>>          *ctxt->regs = _regs;
>>      else
>> @@ -8394,6 +8387,19 @@ x86_emulate(
>>          rc = X86EMUL_OKAY;
>>      }
>>  
>> +    /* Should a singlestep #DB be raised? */
>> +    if ( rc == X86EMUL_OKAY && singlestep )
>> +    {
>> +        ctxt->retire.pending_dbg |= X86_DR6_BS;
>> +
>> +        /* BROKEN - TODO, merge into pending_dbg. */
>> +        if ( !ctxt->retire.mov_ss )
>> +        {
>> +            ctxt->retire.singlestep = true;
>> +            ctxt->retire.sti = false;
>> +        }
> 
> I occurs to me that setting X86_DR6_BS outside of the !mov_ss case will
> break HVM (when HVM swaps from singlestep to pending_dbg) until one of
> the further TODOs is addressed.
> 
> This will need bringing back within the conditional to avoid regressions
> in the short term.

I'm afraid I don't understand this: Isn't the purpose to latch state no
matter whether it'll be consumed right away, or only on the next insn?

Jan

