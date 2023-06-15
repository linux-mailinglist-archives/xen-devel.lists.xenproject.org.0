Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C62827319FE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 15:30:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549604.858214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9n3V-0000Vb-8e; Thu, 15 Jun 2023 13:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549604.858214; Thu, 15 Jun 2023 13:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9n3V-0000TC-60; Thu, 15 Jun 2023 13:30:29 +0000
Received: by outflank-mailman (input) for mailman id 549604;
 Thu, 15 Jun 2023 13:30:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9n3T-0000T2-Lh
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 13:30:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9a19c2f-0b80-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 15:30:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8743.eurprd04.prod.outlook.com (2603:10a6:10:2e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 13:29:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 13:29:56 +0000
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
X-Inumbo-ID: c9a19c2f-0b80-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8HudnC8SrDrkbyKj8ZSdK3WNWyMw9Ow7naGxlrH0Fsxxeu74A3EVWVDasJxfa9TqwHtwXB/KlHnB6p6moDwoYe6PCIy+67ehdKgmHOuofYqtnJBa3UkfN/LL0w7E2y9vmGz10twPLqe4iJmhEER7eVg8KkdMVPr/AxX5Y4P+Av2ElY2TwnYJOSXM40wiwOSkk4QWJ3DbLmU6sZvKnRGU/mbWRdO4nn8zyupgu3dQEcN00LgQonUCUBBgcaUmJgFVkPkWsy6X9j3pyt2eHbgxJo9wkW6cvy9qvN/hoZ+Hv14oEepiXMBES9fH5ACuHfvV8X1056G0OX2cV+0IOPJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbUm2nN9F5UNXiPltud+Dsqi5MVNj35r/G8iK0IBdqA=;
 b=kY6270/YTfrSNBWBvivT7fWqprhIQQEt60bCKnh/nhm0vqURFtlof9R1vw5uhb63gpSRMI+LBP3CQNTLApHPBywwmUtgBltJChEfKctdZOvNh+lQ7A8Q6Gx3q2aoDIZdGj2qnT1pq/FF5uUwl+oGg7oCIFRS0tVz+SAb2h3kGt4Ef7jdFyhO8gza4c6Z180cUTYVeS9xUY2B95vKk2xajQbvhI+Bgd3Io6cD6OUZC04Ky5qzZdtmz9AyKLfSsE2EyG3kBTpubhxUEPsmEFDy9lYGvg4o2jxaasOfV404lh5ynCmcClbH87kwRmVTH6d0K4iqPbcRACPki0u1e8Vt2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbUm2nN9F5UNXiPltud+Dsqi5MVNj35r/G8iK0IBdqA=;
 b=fTAd+W97vW8GrQJrMvAR+H0d5rdymiGFSSJqsZhHHpO4UFG3A1HjSGmgTDcTA/F6znKxbn1j0alIsbIpj1j0M0Tg3RmU/dFQqyPD3Z8wyd8U6uECuo6i89o1cjtMhgbT2m6uWTlCYQEU4UC1Nnpy/8ooYirhDpcOdqX/7x4eb5JYPm+HzfqG2u+s+McW9zmaFkp/y5xufc0MijdxHkLlIZ0Qpe3hKHvG/i1/cYzos22tfqaJ1a2e83VuYjPSNngEcexyA5DT4Mp0DRDBCyaqzUhhtQDPawR9rG04faL+ZkyIJpxPziFs0EAg+v85szjlGw4ZSwHMwPJmZQVN1LsSTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <194760c8-31fe-d0f7-828f-b8a637884989@suse.com>
Date: Thu, 15 Jun 2023 15:29:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 04/15] xen/sysctl: Nest cpufreq scaling options
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-5-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230614180253.89958-5-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9d400f-772e-4855-7abb-08db6da49bdf
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LLW4L+e2ZZM5BQkN1uTf3ylgqsbId5aD+Rgr56cOqALNLZSDbevxJ6nBkAZdwpXMdQ/j333lMpW3rZgectbuKh3HRPhnIApIuMSvJHiPOc7grkeDzpOC7Ta2WnH7TP0LlZQfFaS9sSdL0bdZBDMDM77isbNosRLuLDpbZIAW8eR3A3ZMPKLo25sL7AyTGvsgF5mrVFglQyfIwUVQovHOZUs9oguG95wcwvH1irtThgfkxAkghFUBGUGrS95nC4oAY2IT0IHs4TR3LeOR+QLlNEFlZHUgD1vAJc9jPNkY4XCO1y48SbU5IES2njG3HATPYQdHg++UYN/4c4dlRfS1jbAVOR5qIOjeNyjbBKMZMRiIyyMocZapkxtEl6lpHmUP1hjG35z6Df6liNZcpkmoq3Lpts6zbolec8X9ad58ZY4OQXLYxQMzYGHEOXq5JHetl7WOB5BpCUmLjpuI1JP0EhLP3ERB0cvvCgXbcNgKwFusQ5h2pvosce5Eqdg7Ey9UJavabohvskGaPpe01ldPRcP19FYnILP0e3QerJyiuVS08kB97jT9QFfF9eYTKtNhs9K6HCppasbUSPOACGAoI7R9QTsZdrxRQmTlh2Jw9FibQs+UyFar/R9Ng+NMqsCc5t/OQF/ukWOlB9Zw75lLOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199021)(5660300002)(83380400001)(186003)(6506007)(2906002)(31686004)(2616005)(6512007)(41300700001)(8936002)(26005)(8676002)(6486002)(31696002)(316002)(54906003)(53546011)(6666004)(36756003)(478600001)(4326008)(66556008)(66476007)(86362001)(38100700002)(66946007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3ZVK0gzS2FCbGN6UG1neVFSVGpOVUFyVGsrVDFHb2dHSE1nem1PZUhoMVFT?=
 =?utf-8?B?VGo3R0p3akN1dWNZMTFnczNndUpMcHNZVUtxc245a2JFRmpxdlA4bHNraTls?=
 =?utf-8?B?RUFzZExYMkxQeGwya05sRHdrWk9hczlSSi9ZM2RzdGRMWThIR01YZWRJdTZC?=
 =?utf-8?B?VzhsVEZKMjBDdHNjZHRiMkNnWVRpVWFwUWpPM0tpOHI3M1EvNy9sd1JQeEpT?=
 =?utf-8?B?VnYveFZ4eGVodnZOVDFmMkl2STcrYWZidUJ1WnJnRU5WNy85WjI0Q0V5eEZC?=
 =?utf-8?B?aHE4OThNWWlPWkt4bmgvam9pc2JkRXJxekRoQUVZYVJVWnJCZ0xhbVJsMXB0?=
 =?utf-8?B?UFBxbG5PSWhlWVkxTjdkMUkzMEIzZ0J3SUJhdHlvdVYvb0NaWG9uelFpMk91?=
 =?utf-8?B?M0s1Sjh6SjgvZ1pBUlRIM3NWZFQ0YWNuT2RwTzhzWFpjNkhlOC9QMGJBeFhY?=
 =?utf-8?B?ZXNzc1hja0NhcUNTc2JFRW9Yakx0N0FCVmd0b01wSmRFZm5uY1l0V2VkV3JY?=
 =?utf-8?B?S1lFTllla1VqdWhUYzRzaTZnZGpsK2gzNEF0eG5iRDBxc0cyUzRYMXVEbWh3?=
 =?utf-8?B?RU9ocmgwUXBlaTVRU21mQzVwV3B2YThhQUY0aXZmT2NkelhXZU9MZmI4QkYw?=
 =?utf-8?B?bGJiVnF2OVZXWVJHdWV1b1hnS002Mkt4NUFQUU5jdDVnWXE4Z1d2dUFRM2la?=
 =?utf-8?B?bGpPWXFpN2FaODFmWUxrWDRQZXNzZnZYNjJYTGJrN3FaMG95Y1I1ZlpjU1Bm?=
 =?utf-8?B?eXoxb0tmL1g4MHVNdWk4SWZwbkU4Z2NsV2I4REZPMHhaVFJtNzI1Q3R4MlJ6?=
 =?utf-8?B?eDFMdUhWcTNDNGxIZnFEWlZHdk8yTWtHdm1XakJ6dlRZeXgzQjNZYXZSWHJk?=
 =?utf-8?B?emQxV01lNWNJMno5TWMyd0tOQUcxTkdnektNS0ttMVdqRFRLY0d4TVp1VVk2?=
 =?utf-8?B?TUJVR0V4d1JMWkVvbVhyaEFDMkJIeGU3WTlNdmhzWHdLdjdOL0dJeDdZbUx2?=
 =?utf-8?B?cDVtMHVlTVZ1V1ZmRGdzZHc2VTdlcTN1dkYyZjRuTWJKWXVRZTdYbjV3RkNB?=
 =?utf-8?B?SlRUZHFHa3lRZzd1cmE0UTlKQlhVUzY3L1J2QTlrejN2QW9CYlQ4aW5aeTZj?=
 =?utf-8?B?VXlmSmRCSUNRVFI3Yy9GcU11M3NCeEIzbDBTa21pb2plRmxnTWZPMlp0VWpE?=
 =?utf-8?B?UEhNUTV1K2pCR0podFU4LzZPMmhONlhCckpubGlKb3dOaENDNEVqRjkzeklK?=
 =?utf-8?B?R2R5QXVEZDR0L0VBRXR2eVd6YW1YaWVWSCtEMzVxc001dU5wT2NoVlZwUloz?=
 =?utf-8?B?WGJHc3ZySlUxc1ZrUE5ZbkZlWW1wWmVKdVoxQWdwcHkzTUgwVHhUMDZVY3FB?=
 =?utf-8?B?TjNqWVcxOXFVVFIzVmVyYU50Q0tKb3QrbTJ6M2FibmdjZGVDUjB5Rm5WOEJp?=
 =?utf-8?B?ZzJURkF5OXpteW5BeVVNaVZSNWkyVW1hdmV5UEpIa3pmb1lQSllkUHpzdzhx?=
 =?utf-8?B?S3gwM3ZnVDFUOXdHWjIvaDBkNUw3cXo0TDVUWXJPc2RvRmNkRjdRQm9uNjdN?=
 =?utf-8?B?alFNR3FPN3l4L2twWFNNSWZwam4vc05FamgybHFNM2dqa0trc0VwNmhrWFkv?=
 =?utf-8?B?L1hDMWRmV2hEU05DTDJYQ0trZm9WMUVuU2dRNEROYTlTaElyVm9GUlA4Z3h6?=
 =?utf-8?B?dFk5UFlCbXB2YkJUdDc2blRzaDRnNE9lcVp6Skk0SVgrNnNWU2ZEdGpDVkFW?=
 =?utf-8?B?RzRFZ0ZEam5UU2phcmV1Slp5WG1WU05Yc3p1MldlMTZXK1FJWXVVQ0t3Slhp?=
 =?utf-8?B?QUFLQWlwWUlrSTdHR1AvYVZ3UkcvYnBLZ005dzJJOE8rb2R0MC9oL2dwNllV?=
 =?utf-8?B?QWpFYjNaNWo0OEJZTFZ5bDQyQU83c0M2RVNob3ZGNDJXaE5mMno0bWlVaklQ?=
 =?utf-8?B?WFZBTjdSY0p6YUhNMmxpWUt5dTI5QWx6SE5HM1R0UDlJQU56WUg2czBtNElr?=
 =?utf-8?B?WlJvUG1JU1FYbzFCaGV6eDduYmc0SFBWQjRNNUxJVXNBdW9EOWh2WWRpbkVm?=
 =?utf-8?B?akNKcHVrTU5qenlJakdjUklWN1lkc21hSjVmMDB2SzJmajNhMi80cGE4REJC?=
 =?utf-8?Q?xgZqLh4V84DLH/2m7NpC9+ZEC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9d400f-772e-4855-7abb-08db6da49bdf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 13:29:56.1696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVjfaAgT+LrxO1A1TZ37ST1cH8H8BDk4hbg6V5mksOx4zXfaxoHcHgTQ9RqdUQeBstNFecWIFrYz4Dy1btVTuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8743

On 14.06.2023 20:02, Jason Andryuk wrote:
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1909,16 +1909,20 @@ struct xc_get_cpufreq_para {
>      uint32_t cpuinfo_cur_freq;
>      uint32_t cpuinfo_max_freq;
>      uint32_t cpuinfo_min_freq;
> -    uint32_t scaling_cur_freq;
> -
> -    char scaling_governor[CPUFREQ_NAME_LEN];
> -    uint32_t scaling_max_freq;
> -    uint32_t scaling_min_freq;
> -
> -    /* for specific governor */
>      union {
> -        xc_userspace_t userspace;
> -        xc_ondemand_t ondemand;
> +        struct {
> +            uint32_t scaling_cur_freq;
> +
> +            char scaling_governor[CPUFREQ_NAME_LEN];
> +            uint32_t scaling_max_freq;
> +            uint32_t scaling_min_freq;
> +
> +            /* for specific governor */
> +            union {
> +                xc_userspace_t userspace;
> +                xc_ondemand_t ondemand;
> +            } u;
> +        } s;
>      } u;

There's no comment in the header that this needs to mirror the sysctl
struct. Does it really need changing?

> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -265,15 +265,10 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
>          user_para->cpuinfo_cur_freq = sys_para->cpuinfo_cur_freq;
>          user_para->cpuinfo_max_freq = sys_para->cpuinfo_max_freq;
>          user_para->cpuinfo_min_freq = sys_para->cpuinfo_min_freq;
> -        user_para->scaling_cur_freq = sys_para->scaling_cur_freq;
> -        user_para->scaling_max_freq = sys_para->scaling_max_freq;
> -        user_para->scaling_min_freq = sys_para->scaling_min_freq;
>          user_para->turbo_enabled    = sys_para->turbo_enabled;
>  
>          memcpy(user_para->scaling_driver,
>                  sys_para->scaling_driver, CPUFREQ_NAME_LEN);
> -        memcpy(user_para->scaling_governor,
> -                sys_para->scaling_governor, CPUFREQ_NAME_LEN);

Did you really mean to remove the copying of these 4 entities, rather
than simply change the way the fields are accessed?

Jan

