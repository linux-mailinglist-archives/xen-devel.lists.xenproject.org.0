Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB1A704C9F
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 13:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535129.832746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyt65-0001vi-8d; Tue, 16 May 2023 11:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535129.832746; Tue, 16 May 2023 11:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyt65-0001tB-4n; Tue, 16 May 2023 11:44:05 +0000
Received: by outflank-mailman (input) for mailman id 535129;
 Tue, 16 May 2023 11:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pyt63-0001sz-HE
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 11:44:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f338f911-f3de-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 13:44:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 11:43:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 11:43:58 +0000
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
X-Inumbo-ID: f338f911-f3de-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekjRwIYUH3pqWrs/iH1pt6YyDHmlVKgSEVB6EsdHctNBswM9bsqlg674fVBm6pIE8vYq1zfcxOb6XrGRdPJm38OmMbiF98RNy7Mp66iqV6dNZwk0Syl2P1rKlRonYxh2W2h+v5cUWFzE81aaNGSlS/sfuLK0gzNkiK4LseZ1vQ5lQld4ceRc4N1MgbP+AWwmhRbOCcRl5+UNfQu2yZqMoj8A2/C/kze9146Pr14zZdMvNRVso9g1k7xb5EwZ2UVFfWDfxYxkPOVHz0gYGSWEQg5niRUxcLkYsAGbiODr9RxzwqnlSNG0wmJfX9vbbvb/khJoUvz/Q6Q/ZuTuhaWvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWlTigUskYubx+9Zv0iuN3DWlrd8JnghAlmVuc4pw6s=;
 b=ODgYQJM12MSafds6Dq4MFJ1M+ww9pi1V2XSM10uJqsjsrZgr3zCkKIoLdKsXJgWMm0UgMt4qng5wLcEedd4UfY43kNwW5bSgwhAwhuJiQHgV9tGgE4QF/2Qnqenlf5oHq9EhybPOumxRwhp4xMYDDw6xoFwBpXzSgFkAM6rpEvdCyzN7nRRF5WdpCiIYWXPPikA/nLqogedEsdMqAGtjAtmdPiUs8vuU5HKj7t0igekprSienZ8eQMDORPg+oOK8/T3KEsbZ6KghIts1T+VL7YPu78u/JaCa4h2FsHu1sbOO7amqlOrxRhNtzplfET7AnFyXIj4da83V/6iKxXMcJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWlTigUskYubx+9Zv0iuN3DWlrd8JnghAlmVuc4pw6s=;
 b=gYFNwTME1em5MIEATsI4rGDb4HwwPYRpPD8i0XOyRS9lmpjZ5NA/Y9bp4vofJF1QXegn3WyY6cE6HwNjcK76u0Fc7enMXYAgVlNafARx8EifIG8eb7e/0We23YwoqF2QcGzV6ApHSnCyjQWXCy11sqFSDQPORK7PF+TgVhQPj1GSpTGdiNxBCHPiablKHUTlRT91R3w+OTm78FooMIJtOkax+tg6VQ9iRtqidscMlMtVu99ocukEQtMgAO+nOI5J52Vbr1d4+oYGruCOMLh8mIoupEVMRVSgNYOwsq4KsOcCXHCneZEd3f4Vro8cekSftW6KChj4qA7Ewr7zXEoxbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e3759e3-f361-3838-5a71-9252ce83f293@suse.com>
Date: Tue, 16 May 2023 13:43:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/6] x86/boot: Rework dom0 feature configuration
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-2-andrew.cooper3@citrix.com>
 <97825c89-87c5-1156-5621-9d03286fd865@suse.com>
 <c819848e-d20a-a83e-9387-dd4fd95a6daa@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c819848e-d20a-a83e-9387-dd4fd95a6daa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 023f8ad2-2b2d-491c-ed6b-08db5602d602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uMg6teBdAcu5Dd1QDPF+/lObxkHTJIxrp20RqBMEmzidaGpfQrlN6j2w3gwH6jxg5uXd2RMq9stUiA7kXHBefaab2suGpzBoItSS3chFEbqfRYy0S9CTsXLQ4HdBiCQJ1t8uayzKGHBovouZw5uPRzuZYCLPkTG4cgbFTJiMAO5bTnGMHlryaMbAK+vd9+0FtRBh4D837o1Es/M9gZT+Jtdg+Ft1EGjuYKbPf7OuRx2f4Dmm0aiG7oOrCX2YMAAqT6w2oOEbacZgV1aHyazY9vMkWOokGegc3+Zbxs81Iv6rxDzpnCkBvomEiFFXyzXZyoUmfD5ghNlVJmteKy48c3QdAYqu8C5/lQPKiu3NtKbt9UUmUbKKzACg97BIgzfs58ooNTzCCTa0oUvbGH+AVuUGB68p9jqdA5K88Rg4M568EakZu4/EvoIhBUDp8ERcGBjUfdrXi9IjioT5Uc95Q+Z9BXH7lHomvtPJNV4cX9m6UaiRQgHfXt9lO2HRb5k2JyxC6NzDkiPBGQuKU4txYAgbpsPMWgUFs68XtKsQqDvhVOcQ5lv9RUq/zLqjoxnbw/hIZiYKqUPMkiFaHCOXgWXvOJv8LAe61nSQ8osW0YY5fEU0jcIPocYxRvM9mqgee8A371HXHHCRg4hcwtmooA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199021)(36756003)(86362001)(6486002)(54906003)(316002)(66556008)(66476007)(6916009)(66946007)(4326008)(478600001)(5660300002)(8676002)(8936002)(2906002)(41300700001)(38100700002)(31696002)(26005)(6506007)(186003)(6512007)(53546011)(83380400001)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVpHaGdXaUtzN0FreGkvaDN0UUVMT2JBczdrWTVEZFg5V0lLbEdRUS8yc3ky?=
 =?utf-8?B?YUpQazh1bDNHQVhLaUNCeWs0Qk9NYTNLcGRQRHZFbHc5enRPcHZHQ242VE5w?=
 =?utf-8?B?K2NpMGZHclREdmdYTCs0bGhuNjZ1RWdDL05vN0gxOWhkZjl1RFR2RGdkUFRx?=
 =?utf-8?B?aVpGNWdaVVR1T1dkL3krL3R1MnhHQVRRbFRHSW1YR1lkcDRRYWtCUFR5aE5o?=
 =?utf-8?B?NFAxSk1jVGpFMnBha2RpeGZ5WFJScWd4SlpZUVlPYWswOG9ScGZNcXVkQjdN?=
 =?utf-8?B?OEVNQjV3S0Qxem5KL2xIczVXM1lYa1JsYlVRY3g2Ykw1ZDcrY0N2VE9QOUlS?=
 =?utf-8?B?ZzVPUzNaekJnMDdHTjRyYkQzbkdDVjlZZGVsU0RsRThHY0dqWG5pVm9sVDJn?=
 =?utf-8?B?ajdqTElidW5DSm83V2ZSemlOanNsNUpxMDZIL1kvYm1aQUNxaDQ2Rnl6NENE?=
 =?utf-8?B?ZWxTdlBHWGNVbDhGYlJhMmhFUmdiYjhiL1ZmZlZrandobi9uZzdLeDJGMUxL?=
 =?utf-8?B?NFNXdnhoYzlNN2E0SzgvOXJyd3B6c3VEcS8wOEhiTWQ1cW9yMzB2OFVZMGgv?=
 =?utf-8?B?K3kvTElLRW1qUC9KeFo1VkUxWGIycGYrRjN0SEpaQU1vZUZ0Mm9QdEJuSVFh?=
 =?utf-8?B?RTEyNENKeVgvbVl6WmVmWTZ2eW5rcE9HTkRHQzl5SU45ZCtWakNjMGZOZFc2?=
 =?utf-8?B?d1JWakpWUTFFeHZMcWpDNnkvc2R6bmRrSFBZYURCVkpmOUtDMkRwVkZxUVlp?=
 =?utf-8?B?aVNSYlFOcThxakxCaEdHWjg0Y0ZOSjUrN0xOWnI2QTg5VzRLdUdQL3BFYXhv?=
 =?utf-8?B?OEZ5eGxaNVJVYms3SnRuUEpCcVlYZE13U3FmNjF4L3IvaGwwY21TL1R4MCtZ?=
 =?utf-8?B?VWFYMWhTYzJhajZPMURaajNkbHNJQXRlR2pwMk1XNm9memUvamF6WE9iTllJ?=
 =?utf-8?B?czZ3WVR1TStzakRPbllvR0pjVGZVb3UydFFjK3ladDBvdW1Bc3MwdXp1bDVG?=
 =?utf-8?B?WHJ3MnY2dkdXay9lUS9naFQzVk9FcHRjQlZldmNpdTJGS1VvWGtOeHBxTWlH?=
 =?utf-8?B?N1VacStXYnNtK3RRdFc5WVNSUFRobzVwTVpOTWlNb09jNTRwSkI5cENnenN4?=
 =?utf-8?B?Qmc1Vkw1d0hQU2dFZGpPeHFNR0pMcnhwZEhXeUJ2UVBnMFdLaVNCQlg1eWVW?=
 =?utf-8?B?M09CazdvK1htR0hFV05UcDBaZ09BWUwxb0R1a3hSaUZxdU9mZndBNzlSNVcx?=
 =?utf-8?B?c3dQSytYakJPWmJCbENyMmFMQW9qY2lEY2JqQ0FlWHQveEdzbFVJNjlVOEFD?=
 =?utf-8?B?SEtkRG1sUXgwNXpaenluVjZvOE4yaitQQ09vQTd1TldKSE1TQkJEWjFLVXJR?=
 =?utf-8?B?TGc4Mk80N2h2bEQ3YWVtVGRPeGdxZ0FzaXMvRzFyQTc3S3NDeFpZMys1ZDMx?=
 =?utf-8?B?dktFZFp5OFBBR3UyNDA0c0xtTTdRZUc3RktrMi9jSmgyQ2txUXlnWXhOVUxi?=
 =?utf-8?B?cUswZXJMd2V1cngyTE1Rc2hWM3dLQ25rNncvQm51L3ZzRjVoamhZNWNzU3pp?=
 =?utf-8?B?L3Y4VDJsVWxiN2tTbmE3ZHA0YjBlSGxodHRvbEw3WFdTZnJROWNCN0Q5UFo3?=
 =?utf-8?B?TmUwM3BMT3V1aW1jRUV5RkJUcHl4T0kyWno5UVlIQ2pERlhoU2NSYytTTkwr?=
 =?utf-8?B?TVM0a0Y1RnluSnpIOXREKzdsM2FQRWVnZVlVQzAwcUxnRVZRc3c4bVh3RVB2?=
 =?utf-8?B?TnhSVWRNZlNmOFhiSEZiWFJRRkhSUC9iWktzdWFyaWhwZ1hyaVI0UjF3SmJp?=
 =?utf-8?B?V0N1Q052ME9Vd0dVUVlwbXg2MzZGQkkvVnRBd1AvVEJDRkxCcWxyT1BKcWJO?=
 =?utf-8?B?WlJqQnF4cEY4TlU1NC9jNkVmaE1IZWppeTVMaENEaXdBRS81SjFLQVRxaHJD?=
 =?utf-8?B?WFQ0VENrQjNSZHpaYU00azR2U0UwcGx6Y0llY2hqRWcyNWpjdUJ1M3l4SWZQ?=
 =?utf-8?B?R3NOZitLVmNtQ1c5Tk9zaU1MQWhnWHNtTFlDdDZuSHZTU1ZZNG41dlNVRFlK?=
 =?utf-8?B?SmN4bFdNWjJ3Mkp3TG9UYkpMR0J1bkkzNENlaUxZUWhHaEhDWnRlMGlvZ1Za?=
 =?utf-8?Q?Nqkc2zHQYYEKpAh4N8ScWE8eT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023f8ad2-2b2d-491c-ed6b-08db5602d602
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 11:43:58.6357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aY/FIAiN7t0wo628SrihyQ7T9sgU/Edv957JFh0b/tGFzXA23N7orzzsVcKXTBiXnbjaellNk2rDJxjYbN8wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7819

On 16.05.2023 11:45, Andrew Cooper wrote:
> On 16/05/2023 8:58 am, Jan Beulich wrote:
>> On 15.05.2023 16:42, Andrew Cooper wrote:
>>> @@ -858,7 +839,7 @@ void __init init_dom0_cpuid_policy(struct domain *d)
>>>       * so dom0 can turn off workarounds as appropriate.  Temporary, until the
>>>       * domain policy logic gains a better understanding of MSRs.
>>>       */
>>> -    if ( cpu_has_arch_caps )
>>> +    if ( is_hardware_domain(d) && cpu_has_arch_caps )
>>>          p->feat.arch_caps = true;
>> As a result of this, ...
>>
>>> @@ -876,8 +857,32 @@ void __init init_dom0_cpuid_policy(struct domain *d)
>>>          }
>>>  
>>>          x86_cpu_featureset_to_policy(fs, p);
>>> +    }
>>> +
>>> +    /*
>>> +     * PV Control domains used to require unfiltered CPUID.  This was fixed in
>>> +     * Xen 4.13, but there is an cmdline knob to restore the prior behaviour.
>>> +     *
>>> +     * If the domain is getting unfiltered CPUID, don't let the guest kernel
>>> +     * play with CPUID faulting either, as Xen's CPUID path won't cope.
>>> +     */
>>> +    if ( !opt_dom0_cpuid_faulting && is_control_domain(d) && is_pv_domain(d) )
>>> +        p->platform_info.cpuid_faulting = false;
>>>  
>>> -        recalculate_cpuid_policy(d);
>>> +    recalculate_cpuid_policy(d);
>>> +
>>> +    if ( is_hardware_domain(d) && cpu_has_arch_caps )
>> ... it would feel slightly more logical if p->feat.arch_caps was used here.
>> Whether that's to replace the entire condition or merely the right side of
>> the && depends on what the subsequent changes require (which I haven't
>> looked at yet).
> 
> I'd really prefer to leave it as-is.
> 
> You're likely right, but this entire block is deleted in patch 6 and it
> has been a giant pain already making this series bisectable WRT all our
> special cases.
> 
> For the sake of a few patches, it's safer to go with it in the
> pre-existing form.

Oh, sure, if this goes away anyway, then there's not that much point in
making such a change.

Jan

