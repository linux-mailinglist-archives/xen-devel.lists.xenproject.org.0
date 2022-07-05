Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFD2566F4D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 15:35:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361290.590723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8ii5-0004Wr-N3; Tue, 05 Jul 2022 13:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361290.590723; Tue, 05 Jul 2022 13:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8ii5-0004V3-KF; Tue, 05 Jul 2022 13:35:25 +0000
Received: by outflank-mailman (input) for mailman id 361290;
 Tue, 05 Jul 2022 13:35:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8ii4-0004Ux-HA
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 13:35:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52024b69-fc67-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 15:35:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 13:35:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 13:35:21 +0000
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
X-Inumbo-ID: 52024b69-fc67-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kcb1quNf7/GmF/oeIXgBio3Qhrr6B9rrpNocPHqBQNpc1hq8DyaQVVfGulhMNDwXLr07vzrYbuI3lK3xszjWvC9iClWdioJiaASocqLM7NLw/sSXDdXf2z6FtvI02oXM9dRTVyBIzoh5LCS7Z15y5yeq9bk/hEJVF9RqaC4qgCpxuCGOIMt11EfcbH1eRx18aaH1hGczH19HEXiaXoskShVTWyHelH/zVZIpvrVTx4YhrviDYN1RV5pquMI/s78Jukez5zj1upQsthAr3T3IfmamXe3QbGpIWTs049Skt5Rfx0DNJQkCpZS2NnLxP4GGdCgobVNldpFQZ/vDcqZ5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpdN2iSuPLfZw0yb6nsx8h0cV09fOyx50ifL7ES5vMs=;
 b=esJW5BsFWWIIkw5VFNDSCTtfhECIHdIARUiVXn5epG9oaZSK3382nqSZ4FOFn4qX21jyKoJSmhAtKBoV5i1KcyrJ3byrEvAH26j1VQcFIb9Jn1jmLUb0c9Ul+OlIrL9jymY+zPrLKXQzfP0O6hFfyCyaiCANe5x1cclyDv5nVsA7qMOkB7eBhVjwmHLfa4uhdD+3d3/kKcWyk+bK8Jm1s34akVWUdv/Yys3JK9DW7bpSi9jOgH4WMwGCBfGTWlc9vvg0rtv/Z1Gn2JYqFG5UivRL5gOQQe3krdX6zFLgbtftetYXxO4C6Gn1gh6mtiCxpliQxYnMOLp9uel6acotoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpdN2iSuPLfZw0yb6nsx8h0cV09fOyx50ifL7ES5vMs=;
 b=JFVznxj8UfopvZy58G+1qV71PIrQxrech5BlBYOlkBa4NR+mKMJsBeccK6VNRYdSkk7wlMqUuAnU/CDtykkushZOIlPXTu4DbciBkSuu4/E6z4XHzHfM0X3+Y8BZceNsFNDUMgngpYdX7K0SV1fH8E7cbSYZv0MrqiSzqH+YkNY/r+jrptfEXeuBNC79JPGFJz+HWJEqVaRvIsLHrl1Vsy4azfkoUZIo2/qeOu6IpokGVCIrJtq/5JyApLxjO5zT8R7VlbS5BDvCgBqxZYj7ckPtLljrZQIpgSuWnjWmHF9xQ5fOl1sc2tQrICNu2nH+wXwuQm61vDiIvUudY/Ttmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a4fcad5-2f18-8ead-0395-bf1008e0d5f8@suse.com>
Date: Tue, 5 Jul 2022 15:35:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/6] x86/setup: init nr_irqs after having detected
 x2APIC support
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220630085439.83193-1-roger.pau@citrix.com>
 <20220630085439.83193-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220630085439.83193-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6277ed3b-3ba3-4836-3bc2-08da5e8b353b
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3916:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S332pf29PdusG0NJis55c+rMIYdthdyjwsyq+GqWWwsifueKxrakUPKFMFlAVe/vjRqD0vNSw3r5UBhc6k7UGrlm70gy5kA1qCws5vqwmGnWQaYpd+q8qNr6Hot5CuU7BM1QBw1yFo0aQ9AN1rnxj5CvxbT76XS5Eun7x0RIw885JnOadil7l1WftD5s0yPz277d3aZMBjlzb1zxeE0JCXNNeUwd2v++F5MtodpKHB/qMULQAZ2kblL4hknvJ3I2iA2RmUM8kHqpiT4FSnkGtJtY22JhKlRFRPblpITwOXZK+h+1gos+DdWssram34hwvUKPHI7rEq4nJ75FSvXqB1lEWNrkI3PlOJyl0yDD5AZGHCRy7GkVhEdhIHyd2hNJk4WkUkKknXN3m6hiZKzIl5a8RYz2EKsCSBad04dApM8tnpsHKJSHlql1wBOTSgfORi4ex6fS5lF3BZHYCo61Jl5E+Laeejj+jcYFchOv141s46LMORZOtXuAPHfkoboEFYqOk+Ppt7vvrXhtQdwZLkYXez337Ts6XLbigQvRviw8kmL/HbyQfI6kv2mqHjSXb7Zm56H16JzrBz8XM5m1BU5k7g71F2HyPo4G4bIgP4TOumYPsvGghnGxi9prFy2vhxVw6/vrvbE+ocetz21f8Pxsdl+jlIjf6F+c/8SAt2PYxT17hQM1EJyow0DVdRkKCbW81k6XEKs1+Kul/aBd8RY951SJdw1pVONubRmdDjVGyVZkBFsasF70Irvii5RtWgpO8vSY+mqirSA9IaJRs/cME/yBg1A4jwPDnNkT0HvJXbNy1GdKPDFwHhtzrqLtKpIevRIAcuy3FCZ21DzqqBLxF8YF01ILrzfBqgEffaoaFacw5w+KxRkaLdrYBgT8fPgmOUrLXd14jf4I6P/Psw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(39860400002)(396003)(366004)(66946007)(66476007)(8676002)(4326008)(66556008)(38100700002)(54906003)(5660300002)(31696002)(86362001)(2906002)(8936002)(41300700001)(83380400001)(26005)(53546011)(2616005)(6512007)(186003)(6506007)(316002)(6916009)(6486002)(478600001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3BsdGp5UGZpMjB3NGFxZGlKNFArVHB3RTF0K1F4VW0xV2ZVZkkzYzE4cGVz?=
 =?utf-8?B?VFh0YWxaSGxKVDllQnV5NVBtVXVKanBKZFJPWUFsOC95czZQOHFlenZuNlVx?=
 =?utf-8?B?akdHem5iK2MxSDZJUTRlOEtJQnYvbXphWTB0ZG5LZzdsYm1tWVhQUzZQWDRP?=
 =?utf-8?B?N3BJaG5UMnNMZk03RUt5cjUweWQwREtiWlNHcGJSSml0QlArWEhZR0Nia1du?=
 =?utf-8?B?R0ExL0ZZN1VSWVVPTzI2eWMrR25ZNUMzMXBRUmJ0anY3SnZJUzR4Mi9LUHBS?=
 =?utf-8?B?VFVQYkZhTHdPdzlGMXl1Z3IzWHhRNmRVUjlZUGE4cTRTYTc4VkhWU0hpK3FY?=
 =?utf-8?B?UUErK1ZoaXNGbGdLdVE0TjM4R25tcjZzN3Q0dE92K01QTXpRb0U5MXkwMW5x?=
 =?utf-8?B?Q2V3Uk9BVmJpRkFmYmVHaXNDem5sWk5qS0pYdWpNUU1EZXNJdG5ydGUxUklj?=
 =?utf-8?B?aUFnU2pZWEdiWmJDYWFhQTdvd3pqTjVKWFhtczUrU0pqZzd0T0NETmhMVzRD?=
 =?utf-8?B?OGtpWmpHS0V5b0RobWorSlUrZEIyait1TUI2b2piSFRFaUo5RDZzMklWcmcr?=
 =?utf-8?B?N0JMZEcxUjF6ZHI3YzFrRFNKZHNSMmRFK1N4d1Zhdm83SzdFMFE2YkJwMmtN?=
 =?utf-8?B?dlFNL3hJWFhwRitkUmtrREw3ZzhPWDdWcHQ3QlZiRlo3a3NqM1E0RHFkbVBl?=
 =?utf-8?B?Q0l0anNaMTJWZ3JLeWpWZGlJS0ZUbXZ4d2hSWXgzbFdYcGc5TnB2MUhqdktD?=
 =?utf-8?B?bzR0VEVvRzRaS2xWa1QrTFBpL1E3UkhCb0d0WmI5ZC96UHBBSlFqS3JOSXlY?=
 =?utf-8?B?Z2FZbVk1cXRONU9GT3RDT25BUzJRcEZZa2xRV242M2tiZVRBWndocUhpQjBZ?=
 =?utf-8?B?NFExNzVlbGthK0ozYnptcE1tV2xQd1lETVR0ZzBqS3V6eFhVeUdtQzBRNDlY?=
 =?utf-8?B?eGxLdllWN1VJN2ZTS2ZkbWZQOGVNMDRvWFR1dUt3a25JQlhMRUFtMDBTcm5E?=
 =?utf-8?B?Q21ISzJTa1hNNG01Z2d4MWw0Z0V0NUZPRnlvNEJzL2h2V0pIYjNaQjl4cG4y?=
 =?utf-8?B?MlVJbUh6ekNsT3pSUERHd21ybXhxSHdjcmZOUHRkc1A1VXZraUJaVTBwZmhl?=
 =?utf-8?B?S3JZYUFCVWZUZ25lRWtJMVRqczJ3OFQySFh0WnJpTmE1dzA0SHRweVRvckc2?=
 =?utf-8?B?OVREcGI4bGxUbklxTFVBdTA2d3l3SjhzVnhnelhxQ2gyaWI3ME01cS9Pam1E?=
 =?utf-8?B?bm8zWG93V2tHdlAxV0Z4cUJFMEhYVUtETGtUbGF3aXNwOTd0bjNka1dMSGpV?=
 =?utf-8?B?SmRnSURaczhjbkQ2b1lYNWFlZHAyTEVXcThyYjdxUytaMWhHMmhxeHYrWlo1?=
 =?utf-8?B?QndDaWZNRituWldxVXV4SG1hNlFocGdYdEkzaDFQSXBSYkxlRkRGRFd3Uk91?=
 =?utf-8?B?M3BEQ0tnUmIvV0NHNDJNanR2WENwWitzbTBSK1NKMS96UHpOY0VOOG5Yc3By?=
 =?utf-8?B?c2JLMWNLVTJ5WVBLRE5pVWxGZXBnbDgxbVBhMm9mNGY4ekF1MTFDbVVCNUFp?=
 =?utf-8?B?QzRHbFc5UGRFMWhPVHhWWVg1SVdtcnF2LzNMWEpyVjRoV1pjWHJTU1hPRUlz?=
 =?utf-8?B?dGRQQ2ZJTS9hSXlrTUlZbHlyU083cTJiYUFReFNWOEhtTURNMGhUMWpMVFd2?=
 =?utf-8?B?NUh3cUxMeWM3N3pyWHFtdmRwRThhcDRKQTlLdWtOWDh6RUJJakFpRm9NSVJM?=
 =?utf-8?B?SnFlbnlYbm5zMXJtN1lHamhuN01VNFQ0SzRMbU80Nmk1SVZHL1lRSVo1RG1K?=
 =?utf-8?B?STU1WjVHb1RpdEdSRHB5RksxcWYvRjQ3Q1lWRWVXUEJkTDg1Sk1oanZ3bnVL?=
 =?utf-8?B?QkRBSmZUZmRwQWlKKzdORzVpNlNqZERPQVZhVXpRdkVoTXBvanphMnUyV3JG?=
 =?utf-8?B?ZVlWUExJZG1yazNlZ2R6cGxoSS8vOThiNkJKdVRtdzVLOWlMOGhZUXJmVXZ1?=
 =?utf-8?B?a0cvdkcxd1RNeEY0Um5mTDgzSWU5UWNSVE5GbkZrWDBldmtrWjl5M2tTQXU0?=
 =?utf-8?B?MjBLWk5PenlKaVBIVnRNcGtrVzZ5Ym12bHY1MFEzODNmdjJIWmo0UnVJenp2?=
 =?utf-8?Q?NjWyYTMbiF6SJreUaUjVw7mAG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6277ed3b-3ba3-4836-3bc2-08da5e8b353b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 13:35:21.3667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naleaymMQr32DGslXx7TR7P4Q0GLC5foSoFylesNuGiXCn7Ec42kug7vXovy2ugmCErdnfaXawolrGEnbMYfJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3916

On 30.06.2022 10:54, Roger Pau Monne wrote:
> Logic in ioapic_init() that sets the number of available vectors for
> external interrupts requires knowing the x2APIC Destination Mode.  As
> such move the call after x2APIC BSP setup.

"requires" reads as if this was the case already, which I don't think
is true. The dependency likely appears with the next patch (didn't
look there, yet).

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -2653,16 +2653,6 @@ void __init ioapic_init(void)
>                 max_gsi_irqs, nr_irqs_gsi);
>          nr_irqs_gsi = max_gsi_irqs;
>      }
> -
> -    if ( nr_irqs == 0 )
> -        nr_irqs = cpu_has_apic ?
> -                  max(0U + num_present_cpus() * NR_DYNAMIC_VECTORS,
> -                      8 * nr_irqs_gsi) :
> -                  nr_irqs_gsi;
> -    else if ( nr_irqs < 16 )
> -        nr_irqs = 16;
> -    printk(XENLOG_INFO "IRQ limits: %u GSI, %u MSI/MSI-X\n",
> -           nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
>  }
>  
>  unsigned int arch_hwdom_irqs(domid_t domid)
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -420,6 +420,16 @@ int __init init_irq_data(void)
>      struct irq_desc *desc;
>      int irq, vector;
>  
> +    if ( nr_irqs == 0 )
> +        nr_irqs = cpu_has_apic ? max(0U + num_present_cpus() *
> +                                     NR_DYNAMIC_VECTORS, 8 * nr_irqs_gsi)
> +                               : nr_irqs_gsi;

Splitting a function argument across lines and then putting the next
argument on the same line is, well, confusing. May I suggest to either
stick to the original line splitting or to go to

    if ( nr_irqs == 0 )
        nr_irqs = cpu_has_apic
                  ? max(0U + num_present_cpus() * NR_DYNAMIC_VECTORS,
                        8 * nr_irqs_gsi)
                  : nr_irqs_gsi;

?

Jan

