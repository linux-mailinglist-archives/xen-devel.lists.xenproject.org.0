Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385976D5DB5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 12:40:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517824.803693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pje5Y-0006uO-Kx; Tue, 04 Apr 2023 10:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517824.803693; Tue, 04 Apr 2023 10:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pje5Y-0006rq-Gn; Tue, 04 Apr 2023 10:40:32 +0000
Received: by outflank-mailman (input) for mailman id 517824;
 Tue, 04 Apr 2023 10:40:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pje5W-0006rk-VW
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 10:40:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dad2538-d2d5-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 12:40:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9925.eurprd04.prod.outlook.com (2603:10a6:150:112::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 10:40:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 10:40:26 +0000
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
X-Inumbo-ID: 1dad2538-d2d5-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI7x1J62ojqi97gy4+fTaJUsgb2OhfGDGOWxGAdMiXhREY4SgsbRMbgY01Ea+i5xTwPdJJvdzlw+X66rcEZK8rShpa0/S8P4R4jJf+knpEvkmGtzyqZKnG5n8NSNNabTO35FSthhaIM7/DtZSLRU0DN1fK/oIqskBXQRKQcLPaFhNM39zH3t27WC1v78V3ET402J5kxlCsRUnu7Cz8AWwuTJ43uoPnDxKsIuZg70ayKV0xkEyCKIWAHfXR345WpBeoPBCYDQuWfeIkDFKup8QTmcIJ5Zq/VtmO4PggPNZYKd/2GXArdDjcJua8XPwFwy3jDVP3SGM5faF3JFn3oPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBCXfjvZiFQaKwerBMfqcds06QVNrK3ird1Ze6TJ1/4=;
 b=UwvzoLctm8iTZuLOqpTQgD4RH2FxNbqHK90nA9mVZWP5Z09/D3q/a3Exuj85Z0ZklgOy6EyVQ6e82LuihipArU1ifguVCG7sI0hQGDg8Ef0lfBTxZOBFLs0CTkt5TeH+8l7nNxjWeeozo0P31oqf2ayFPsVD8IO894xqVZ2Dao7677feYzgEEJQEARB3mdmiYa7CRZQR9DzdhNgv7quYLJKlxnc3AiqOTzW2Y+1fde2nWpGetX372PL1VcABlYsCZ8tLGO80tNQGNxl5mznRWXnFwoPCftv9VFGnQuHfASlfEp2GEnO7cR5G76oDcTsLPrWWgG75diVRINzWBC4rBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBCXfjvZiFQaKwerBMfqcds06QVNrK3ird1Ze6TJ1/4=;
 b=azU5ruHzngtFAL0aS4DLPWES+gcoS2IAWfNLmrxscYSJK1xFaWGM6TydS7R5rn/0k5olgpOJrz773jaJTPOuCQmvnt6zlAaEekm3NZJSyuDw58cHTn9XsJndgymVflMHRAYpOoc7bSy3OPakr4901txg9+xE1Lv83ypugh5+lnjvhXn5KHe3BJorLqsurs8+Id65P97NL/0SBMLnIjbYPL4iZma/aEEXmKX+k0VMFEeosVqU+tqhWWQGYkMOFprb4ecKz+4290NbzEJCrYQx7WZqusBlsBkYwl/1frmwm7OZngZIS5JJw+RAYphuvMzC23oeBY9y/ma8zTb21JakUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3a11fa7-6e39-f7a9-7705-17c3af34273e@suse.com>
Date: Tue, 4 Apr 2023 12:40:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] cmdline: document and enforce "extra_guest_irqs" upper
 bounds
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <54e126fc-484b-92fa-ce66-f901f92ec19c@suse.com>
 <6c5cdffa-f3fb-8f40-c44f-ad7431451929@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6c5cdffa-f3fb-8f40-c44f-ad7431451929@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9925:EE_
X-MS-Office365-Filtering-Correlation-Id: 10380eb0-29a9-4bba-3abe-08db34f9006e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jblOSUFyrjy2NsmsZV9PpHFxrDUf8fIf9H9GdUO+RgdksrtyMcBzvyAzY8oB7mvyO9bdQMdgnsfGuE6o+X3p4Rr1Ahlrv+2dtQ2NXw5lJFtKM9lMMa6DWlNpx1h7LJ7t+8dA+pkSVeKBvBGUqhr5rp573EjDI+ivLHU1I/Qv9hMaUIW+rSjg9f+Tg7dRxa8vB1GhGLPwoJVV5NPKENJPQIXJYaiwcsn8rd0pUEC05kGXaCGuYKt/D3N489534/NsUJlcARx/l4OHT79GZCxSYxrDMxRDri+tlWzuyXfMDfWUwxD6MCtOpXeEsuuFrLdX7IOJt4ELvKHmIZVnAxfZe/KdIplphgASmp593aPt9cezPnO+crVqxezxBRrGwHF0QjMPVGqboj1xkKAduPzj6jSbWXMptl1WZjqMuQsB/ocqCY3ZhLCyeCUf31BFJTM4/jfJQGxrpa78hTuS8/ZtnTLR7M9ykg9rDckqF9GIR/YeuJbBtF1wF+uCdhkz4hv6Qc+6nRNAZ7dklyyEQr9fM0JDaL1cQXlvMh9skCZpY4nc+gabDTMY6889V4l4MjnAVtZ26PlwXuVrz3zME+/Z6/zx9rUqNknWHezMtzyLdNCKAGnGTG2otunwHtZxRJwS9z/0XiQUNDyHlpIK2Hyp/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199021)(31686004)(38100700002)(2906002)(86362001)(5660300002)(66946007)(8936002)(66476007)(8676002)(36756003)(54906003)(41300700001)(66556008)(316002)(6916009)(4326008)(478600001)(6486002)(2616005)(53546011)(6506007)(26005)(6512007)(31696002)(186003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTZYTGJacGVQeEtHaWoxR3ZFaEoxemFWWlN1cjNtU2p5Tm5nR2JyRWUxNFF0?=
 =?utf-8?B?bUpGMTZIK00yVW4zTDVxREJPaU5WOEdoUTVvSWk5RmV3bHhVMjdxQ1hFTVRp?=
 =?utf-8?B?SStUUDhBUEFKODVDcGozRGVNeVY5eG8vaVZuc0NjLzNYdXZXb1RyOTA0TXdP?=
 =?utf-8?B?WUxzTEZabWdsN01RcVd4QzNQbHBMMVd2NnlVZlNpYzRBMnJHVFYwcnBhS1A1?=
 =?utf-8?B?Qzc4Zi9vWHBXdm5ERFhWSll6ZitabkFVZXYrNVd0aFdjWnhvbVJ0T2RveUZZ?=
 =?utf-8?B?MnlqNy9NcG1LRlNMSkZ4Y25wbTlmeDBXNlZrS1pSWWs4dzZCRThxWTRiczV3?=
 =?utf-8?B?VlBGQjFQWEdwaVdQR0FBeVppVGZaM3R1MFZXM1lTdGJpc3cvRkJWTVhmbTc0?=
 =?utf-8?B?bWlxd1VSMWpWMm52dWpDZ3pMTVBROUIvS0lSYjZVSXJTVEU5U2lpZS9jYkdk?=
 =?utf-8?B?bUc1Skc5MG44MHZTZThqcm56eUZwZ2pvRHJOdVJzUnI3eUhJTVZjYmwxZjZm?=
 =?utf-8?B?cCtaUFdrbjVrbm9uUGM3a3cycStmOVF4bWZpZ0tBWVpZK3AzQ3B4NTRITHlZ?=
 =?utf-8?B?cmdaMDdvYzQ2VHlFZmVTS1EyQ1NmWklrZ1hsOGREbFN0cTQyejU0NmJHV1Js?=
 =?utf-8?B?bzJncFRHcDd4TVRFUHRuRnVYR2kxeWlGOVZJS3FaYms2dlYwZUR0aG1XeklQ?=
 =?utf-8?B?U0ErZkhra3dZWDJ2ZHN0dUxENmxIRmhvQ2FyQWpIRVNDT1BZcEY1Sm5GendV?=
 =?utf-8?B?MExXd0RmQW1xSS8veU1mWC91R1ZCTkVDS3dUWEVQZlAwR0htWmMrU0d1Und6?=
 =?utf-8?B?UWtUL0tGNko5c0JtRms2UzZHbjJRSFRIa3hHM2FDMXBaRFRIYytOWWlJOTVR?=
 =?utf-8?B?ZU5rQ2krSXdkMXl5cTVNREQrc2pucjU1RkxwTVBOVmZZWkQ1cDRxdzNYajF1?=
 =?utf-8?B?c1dkMTBtcHJicjBBZGsyOWZubXA2Zjh4eS9hQWFzNE5DRm43L3FBcHVsTlpJ?=
 =?utf-8?B?ckVVTDhsNVdVa0ZYZkd1dFJSa1dvdTAzRW5wM2p5d0tONmRxUW5GNVNPQkJD?=
 =?utf-8?B?bWxkY1BpZmduWDY2Rkc1Nk94a1cxVytqY3V3MXQ5NTBZQ0ErMXJkQlpnL201?=
 =?utf-8?B?NCsyMEdBRFBSNWpIQXJQL0t4dkF4WVB3a2QvKzVYclVLeTg5WWwrNzllVmls?=
 =?utf-8?B?SUJQdkpZdVRmTEhUNnEySlo1ZmZ6WGxlY3VvSUdJamQ4dkI0dGl4MFhpSXFE?=
 =?utf-8?B?U3o4QXdaRk5nd01hT01XdlJUL1EwM0pmaXFObG5jM2hrQmNJWHA4RmF4cURQ?=
 =?utf-8?B?b1dWN3pyVHVDY05TeEQ5MDFEYW54cldUY3ZRczZTV3R5Q3VsNVBxc0JHbEhh?=
 =?utf-8?B?K0ZZNkV5VmZKR2RtS2FsWXkxSUU0NklReUlLUWVRanZxQ2NCQkdCUDlLeUFl?=
 =?utf-8?B?QWQ1NkZUajBYVnovRWFpTU01dEJVZ00zS0NvWTVlb2NSM2wrOWlGT2E1R2Z1?=
 =?utf-8?B?L0ZrTUxNUnhEZGo5b3liNFVJaU1nZ2NVMjVUMTY4WlA4SG9qM2ZWbkovT1lt?=
 =?utf-8?B?UGUrbFk2Qnh6L0xOM2VzM0dzdzltZUFaZWF6RXU3Q2psVVd5cDlZV0NRRHc2?=
 =?utf-8?B?ZnRaaU4vb1NLTEJmWngraitZaC9pbGJ2ZW8wZy9zR2NLWnFEN3FGZVA5cmNn?=
 =?utf-8?B?a1dka3cvYUNwZFZuYVU2T3hLMGVlRjBLRFZxaDNqZzRaMU5EQ0s5a1BZOEtw?=
 =?utf-8?B?dThiTlUrSHNIeGZlZ0V5RWRSM3BMeHRwRDBCQkVhZTYzdzcwQmI3ejVOMGs0?=
 =?utf-8?B?SVhycUxKVjZWU0J2Kzkwa1BPUkNYaXRFNXVtU29Kb2c3YWZ6WEw2Qys0V0Fi?=
 =?utf-8?B?OXpMR1JydnI3TU9mSHZhbXlVZlFLbCtYQ04zREZRaHR0VktHaXI1SENyRWIr?=
 =?utf-8?B?dU8yNDdlNWRhM0tUaXUwYW4yNTdFOHhCQmRRYmpvWTVFSVBQNDNSZHQ0cHlN?=
 =?utf-8?B?MTJ6RnExQ2lUYmJBNEdDTlVkeGdWT0hPcGFSck1TZEdnZkZNSVFWQ3VWcm14?=
 =?utf-8?B?ZlVoTFdKVStRQlZCV3ExRTVsT3lyZUswcnljZ3pQNXR3WDZBakNUOFpMdFNu?=
 =?utf-8?Q?gdmJ5pZfp98odzMkz3beugtsB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10380eb0-29a9-4bba-3abe-08db34f9006e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 10:40:26.3271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r90aoUXFqKACHTjsDBCXu1sPq+5ihh2O0jjvqGlxJDBcjcz/+VtHJh1HlaHhw1aOQbk3jE+Nthe7EY42j7Na0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9925

On 04.04.2023 12:34, Andrew Cooper wrote:
> On 04/04/2023 10:20 am, Jan Beulich wrote:
>> --- a/xen/arch/arm/include/asm/irq.h
>> +++ b/xen/arch/arm/include/asm/irq.h
>> @@ -52,7 +52,7 @@ struct arch_irq_desc {
>>  
>>  extern const unsigned int nr_irqs;
>>  #define nr_static_irqs NR_IRQS
>> -#define arch_hwdom_irqs(domid) NR_IRQS
>> +#define arch_hwdom_irqs(d) NR_IRQS
> 
> I know it's not your bug, but this ought to be (d, NR_IRQS) as you're
> changing it.

I can add this (with a cast to void), but I'll leave the final say to
Arm maintainers.

>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -2665,18 +2665,21 @@ void __init ioapic_init(void)
>>             nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
>>  }
>>  
>> -unsigned int arch_hwdom_irqs(domid_t domid)
>> +unsigned int arch_hwdom_irqs(const struct domain *d)
>>  {
>>      unsigned int n = fls(num_present_cpus());
>>  
>> -    if ( !domid )
>> +    if ( is_system_domain(d) )
>> +        return PAGE_SIZE * BITS_PER_BYTE;
> 
> System domains never reach here, because ...
> 
>> +
>> +    if ( !d->domain_id )
>>          n = min(n, dom0_max_vcpus());
>>      n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, nr_irqs);
>>  
>>      /* Bounded by the domain pirq eoi bitmap gfn. */
>>      n = min_t(unsigned int, n, PAGE_SIZE * BITS_PER_BYTE);
>>  
>> -    printk("Dom%d has maximum %u PIRQs\n", domid, n);
>> +    printk("%pd has maximum %u PIRQs\n", d, n);
>>  
>>      return n;
>>  }
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
> 
> ... just out of context here is the system domain early exit from
> domain_create().

Of course. But that's not the path I care about; this ...

>> @@ -659,7 +659,7 @@ struct domain *domain_create(domid_t dom
>>              d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
>>          else
>>              d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
>> -                                           : arch_hwdom_irqs(domid);
>> +                                           : arch_hwdom_irqs(d);
>>          d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
>>  
>>          radix_tree_init(&d->pirq_tree);
>> @@ -771,6 +771,8 @@ struct domain *domain_create(domid_t dom
>>  
>>  void __init setup_system_domains(void)
>>  {
>> +    unsigned int n;
>> +
>>      /*
>>       * Initialise our DOMID_XEN domain.
>>       * Any Xen-heap pages that we will allow to be mapped will have
>> @@ -782,6 +784,19 @@ void __init setup_system_domains(void)
>>      if ( IS_ERR(dom_xen) )
>>          panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
>>  
>> +    /* Bound-check values passed via "extra_guest_irqs=". */
>> +    n = max(arch_hwdom_irqs(dom_xen), nr_static_irqs);

... is the one.

>> +    if ( extra_hwdom_irqs > n - nr_static_irqs )
>> +    {
>> +        extra_hwdom_irqs = n - nr_static_irqs;
>> +        printk(XENLOG_WARNING "hwdom IRQs bounded to %u\n", n);
>> +    }
>> +    if ( extra_domU_irqs > max(32U, n - nr_static_irqs) )
>> +    {
>> +        extra_domU_irqs = n - nr_static_irqs;
> 
> Why the extra 32 here?

On Arm we would warn even if the command line option wasn't used. Plus
I view it as bogus to warn for any value up to the default.

>> --- a/xen/include/xen/irq.h
>> +++ b/xen/include/xen/irq.h
>> @@ -173,8 +173,9 @@ extern irq_desc_t *pirq_spin_lock_irq_de
>>  
>>  unsigned int set_desc_affinity(struct irq_desc *, const cpumask_t *);
>>  
>> +/* When passed a system domain, this returns the maximum permissible value. */
> 
> This comment is technically true, but it probably doesn't want to stay.

Why not? We (now) depend on this property.

Jan

