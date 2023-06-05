Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA540722BFD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 17:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543795.849062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6CXs-000149-FH; Mon, 05 Jun 2023 15:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543795.849062; Mon, 05 Jun 2023 15:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6CXs-00011Z-Bv; Mon, 05 Jun 2023 15:55:00 +0000
Received: by outflank-mailman (input) for mailman id 543795;
 Mon, 05 Jun 2023 15:54:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+s6H=BZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6CXr-00011T-0X
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 15:54:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5156569c-03b9-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 17:54:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6804.eurprd04.prod.outlook.com (2603:10a6:208:189::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 15:54:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 15:54:53 +0000
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
X-Inumbo-ID: 5156569c-03b9-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTA/MGgkjrqyC9Ib4EQ7XOhsBHseNmpswm5KeLp0zW4DEA4eeXvzJiYFApKbaqF21NU7AF2eYIVMvQKHUuKZjIzqtIKY7SJHFXYAck55u0iSIoJq8x2D8nM6Zh91cbAKMQW8m/rzIDhPFu2iMqx/Osev4q+WhpCknJHLrGTIR0hXfoiVLkgMfT7+ryson+Jmr2t30mC6R4DdWGohZB9gKh919dS+lujA2NoaDFmzp1fRvlVhSSTvbmh+ciin4D8lYYqHBUgkFaT+ITb07SacLYU4aNQyW6rWaUJIhdBi4mbPWZQx9YSmucBOR53HNPowBbm3CBUfTj9sx4UilOobmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quJwwjMdwNdpbM84s6w5Mms2bWeK+skP5Z0pWZBzW8c=;
 b=cW8VHoQSi7UQPjFhm9nhrJEGthMvnariRFYVZ/XcL/vH1qylxp/a94zZTHcicsFQ0D9jUL6yhxrma+lZKxKMpZfKo2AxnJ9DLjYdurxdfDfs9TnaKnKa8TvvnQn/vObJB+w/lD2xllH0827223YgPwAEeUtOexe+UmsFwhCuj5JTPAN0O+KCMqDf0wZpcc5H82OA1SL7ABqL9uYCyk0uOw3q1jpyMLFgzfpshNQQOZbHJDusttmCCEbTcG9TH6AfTfGDVlmhgdCIaLp7uXTgH5tgZ7tGAtqf1UTMmHF40OKRfDDkbSwmyh2ndYbWH5n6nqBkertckFwgm69swImghw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quJwwjMdwNdpbM84s6w5Mms2bWeK+skP5Z0pWZBzW8c=;
 b=tFhgAsYBOt4hn7KWDIB0U5cKda/F12hfN4MoJP2LV0hJfHbSEbVp7t4igRQSGWueCjzPT/hAb9d1LL5Bp7TCc/aCA0QPEzkv/E3VUy77/sk9UYWWdbqCuwFFwv0SWe9fxoc5WF6WDrkxrivw6fOOMtFmyAAJSulg499JrnCxVsSAoH+uRAvyjQDe3cA6ZG7VlNB1c8yZjgYvWe6tGBi+VNhu00FF9Kz9xIm4Q1/UbScYjXo6Kjy4fRK5cia38LDQ2IWyTfGWa+A2keus+yISB/pcFh9bfUoCqeQOevYnt/cvLBI7u5A43/9N2a1FaxWjd442pKKtquCSKbd68DVtoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c0c4142d-586f-09be-b2d1-502be72e7968@suse.com>
Date: Mon, 5 Jun 2023 17:54:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] amd: disable C6 after 1000 days on Fam17h models 30-3fh
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230605151036.18085-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230605151036.18085-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: eed4e729-feab-4479-746c-08db65dd334c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	obQzzOUQumuDqQZyRFsW1oXV7/XhyBUeWco+kEBJK7q6NboyVPnoX/Moi6nxw7QV+duuqAMaAe9WIfgRplrGRbaJYF6xQlPPgvFGIijFwRNiBgNc6reoT8vLKZGSmU4lvflLVlkGmt0ZrlMMmDlZEAKRvvW5xLM+lo1+EtXh/+19vkhZeT5QAnV6LvrTF2ZLJ8HEykWsoEDui8INQ1tDzIOKW+dHPWHTSVfD1bi3Xyxk1fWGq40LmsMEv0m3Oy+ap0D6GOY+9LgXV53F05ZL3Bcc/Y0qHz4l6Qt3IXeRzf9VH0G0Au1hHAWAhETz8JYFT3XKmeHivHsixKVqQwKq2OQFCVjHMSr6Ir8Sf8wmcYPGAqVT8cpnNyPJMHGBsO9FO+wA9w6UHnDj8E6HKc7A5DEZUXfL8ExLOiFGHm190/wVYOpnWYbre0OKSARs3e+mcw3Dax990+mAE7ypf5M1z/V84maPlVbUKBqgUXzPWC49u/xzbiaOmSz5U9iasPNBbvwbME7ajP1kh+wwNu0PMyvZvzMpB0EWwUNZTZWuk6JhbvjYu8l6OaYQJl//eNgxu2sfGyCf7ifmL3nTbbwCNXISWsMjkElcXJclqMr5mpcYgnk3rqQNbs/PJ2crDbnE6LURXmT/N5i80dCdpV75YIQlxxPCucaxBuBREq11fFGqm/uLWDU8x0ExvuD4mf6h
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(26005)(38100700002)(2616005)(41300700001)(6506007)(83380400001)(6512007)(186003)(31686004)(53546011)(6486002)(478600001)(54906003)(4326008)(66556008)(66476007)(6916009)(66946007)(316002)(8936002)(8676002)(5660300002)(2906002)(86362001)(31696002)(36756003)(221023011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejdyZmpDYUMyTEZmYWNvSVlKZjhWVURvT0pTaTQ3WmpYMUJVOUVxTnJXbGl6?=
 =?utf-8?B?VFJRaGJGdDBhcTJBdjdTRnU1SEJuV2poMDZlcTZLZUdnR0R3TnpRTFIvVDJT?=
 =?utf-8?B?VXlDWmFjamx3a3FFMEZ4WVJwRzV6T3ZGcUFzaXJUUG5vWXByK292ZDJMdWQ1?=
 =?utf-8?B?UkpESnpMaWtISWpVU0hwNmN6M0VnQ0xXcHkyZE1UYXVQVDlPZ1BxQUhCcloz?=
 =?utf-8?B?elJBWElhdnU1T3hka3lIb0w3Rm50a0NITFM0am1UOXpzQkprdjEwODU1NmRQ?=
 =?utf-8?B?VEh5Y2Y5T1JCWGJGSzIxWG50cloxY1J0bVRKYldLenlHT2xvdGQ1SGJMU24w?=
 =?utf-8?B?Q09aVTM1M2JSRTBoZnJST1FZeXNpVVArRHNrend5N0h0bXBxNjd4MVQwQXZS?=
 =?utf-8?B?TU0rajNEL3NQYndFT0xieXJ4a0x3R2haZTFWeFB0RzIvbTByUGdFY09IREdD?=
 =?utf-8?B?WXFWcW1WQWxrNGlmY1RwOVZrMmdTeTdXL21JM0thKzNlemt0UWg2NTUwMVVZ?=
 =?utf-8?B?Z3h6TWFDTHh4REpNdm56QlJkb3kvYW1XRS9MQXU1dDhQY2d3SHdGK21yd0hE?=
 =?utf-8?B?ZjRDQjlXczVVdEhlQ2kvcncwNVhCVzRDV0hlK0VYeUl2UmZhaGNHLzJ3R1JS?=
 =?utf-8?B?TzJLdjZqUmJiMkJXcnEyRzhRS2xCbEUrdmMvQWRXRXFQaGZIQk9rV2VJN3ZB?=
 =?utf-8?B?YlNabm9vRHBDcktjcWJSM1p6RnRWQmh4YnJkaEZLOEhMSllGYnlOYzI4NUNr?=
 =?utf-8?B?VU93MDdIdXRucThwVXBGYTUxOHNOaHU2eE9tcjg4RTd2YXhyakRaZExISlo1?=
 =?utf-8?B?Z0JTNEpMdVA0Y0tYNnR3OUZhU1VrdnRlcDMzVkpubVVWSVptVGc4ekhobzBt?=
 =?utf-8?B?N3BiVEEwTnJhamJKeXoxL0dyeEFkVnZrN0lTV1Nwd3RHcmZmQUhtRmFEckFW?=
 =?utf-8?B?TitRUGR6ZVZ4TlRwYXZCd2tlVWdRMW44RW5uRjJhY2NUcWFlTUtJOTZycVp0?=
 =?utf-8?B?SFd4YjdSYWlpNzdzdVRkR2h4WkIrZFUraGNNTFNwTHhnOWdvM0UvMTA4eVFw?=
 =?utf-8?B?d0llV2NmK21sbVFBSnlwcHhTRkIzbk5ZRURoQWFHRWZrMktvME95MTZWNTJN?=
 =?utf-8?B?YklOTG13UzZtQWoxVzVWL0lFQ1lNbkY3dVRYQlNuUFhyM3NzVHl6R09PMXFa?=
 =?utf-8?B?Tzl1d2lPd3ZBc2ZYbTdsdUtCeHd0Wk9MYVRRZm10NTFIVzhYdWU5Uzhtc213?=
 =?utf-8?B?Z252MEN6Nlp5dlc5cjU3UjYrY1dUbkFVVUNhTTNxcVhRYUY2OEdPVUJybzFS?=
 =?utf-8?B?UlgwdlR3enpGY2V0WTlna3ZuZUFMcjhIelFNZXYxSE82eE1ZUFIvZzJ5TmtF?=
 =?utf-8?B?Q1Z0WGFweTNERTNRcEdSZGczMlZHYzk3T2l2anFmSmJrV0FEUXlEd3FMV1FU?=
 =?utf-8?B?a2ZrOVFBZHlxV0FqdXd0TlJMTHJ0U09SQkU4NUIvRmtrYmcyc0RTeE1EMWJu?=
 =?utf-8?B?bU82eWN5SW9ORjZaZktTTkVCSWV4SjB4OW5DczA3eVUrbXROK0lveEJlYy9r?=
 =?utf-8?B?eVdBc2hUUjZJMUdxWEg5Ylg0Z3V0S0c1L29BbSszVHNTc3h1NS95ZUJrZVNP?=
 =?utf-8?B?S3RqMGFzTlJqVElMTW45REFrYjNOOXRlem9aanJFT3FqUmIxbUx2ZDVzczBu?=
 =?utf-8?B?bEVhaVFNVzl2bUw1VFZOa3UrTkJzQmppRC9OeW1DcHUvZ2I4TnIyemJtQlc0?=
 =?utf-8?B?dmxWRUxyWE1qd2hxN1ozanc5RndVN3V4UDd5MTJkcnZJNU1NK2ZlamxVdTRD?=
 =?utf-8?B?eFl5QnFLTzRZREY0SDgwRno0dDNoUk02dy9tUGhyZWprTDJ3Z0FLWGtzTU1Z?=
 =?utf-8?B?RGtwWng5WG51SlhrdGxYWTdXM1B0WmxMbzhZZVNKZWRCN0JhN3dIamcxRytT?=
 =?utf-8?B?NkpBOXJtd2g3VTA1VEFueVpUMDR6bnB6M01IY0RjWDZqS25QU2kzNkp2UjNj?=
 =?utf-8?B?RDV6SmJCNVhZZ3pkeGRKeEJIOGovSFdhOFp3bS9WSlc1eVZnak5BSDAvdXRn?=
 =?utf-8?B?TVMrTllBSkIrYW5qdHA4SlhtdzJWYU9EYUdHSzZSRG8xUVdSWDV4WmtOS3ZH?=
 =?utf-8?Q?cHNpCcl9/4vPk+ZCfXqJHenbg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eed4e729-feab-4479-746c-08db65dd334c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 15:54:52.7801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cglNPe/iWl7Az3oEB5CIq+f1W7m1CKWap2aZuQbrYmhkUVGpQ5ymZkg+QsU5PUh1LtDX7Ll+etT8wWB5jjrSVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6804

On 05.06.2023 17:10, Roger Pau Monne wrote:
> As specified on Errata 1474:
> 
> "A core will fail to exit CC6 after about 1044 days after the last
> system reset. The time of failure may vary depending on the spread
> spectrum and REFCLK frequency."
> 
> Detect when running on AMD Fam17h models 30h-3fh and setup a timer to
> prevent entering C6 after 1000 days have elapsed.  Take into account
> the TSC value at boot in order to account for any time elapsed before
> Xen has been booted.

Models 6x are also affected as per their RG. I have some trouble with
the site, so it's too slow going to actually try and fish out the RGs
for the other possible models.

Given more than one set of models is affected I of course also wonder
whether Hygon CPUs wouldn't be affected, too. But I realize we have
hardly any means to find out.

> @@ -1189,3 +1190,44 @@ const struct cpu_dev amd_cpu_dev = {
>  	.c_early_init	= early_init_amd,
>  	.c_init		= init_amd,
>  };
> +
> +static void cf_check disable_c6(void *arg)
> +{
> +	printk(XENLOG_WARNING
> +	       "Disabling C6 after 1000 days uptime due to AMD errata 1474\n");
> +	amd_disable_c6 = true;
> +}
> +
> +static int __init cf_check amd_c6_errata(void)
> +{
> +	/*
> +	 * Errata #1474: A Core May Hang After About 1044 Days
> +	 * Set up a timer to disable C6 after 1000 days uptime.
> +	 */
> +	s_time_t;
> +
> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
> +	    boot_cpu_data.x86 != 0x17 ||
> +	    (boot_cpu_data.x86_model & 0xf0) != 0x30)

Perhaps better ... & ~0xf, just to be future-proof?

> +		return 0;
> +
> +	/*
> +	 * Deduct current TSC value, this would be relevant if
> +	 * kexec'ed for example.
> +	 */
> +	delta = DAYS(1000) - tsc_ticks2ns(rdtsc());

Generally the TSC can be written (and we actually do so under certain
circumstances), so deriving any absolute time from the TSC value is of
at best questionable value.

Furthermore, perhaps better overall to suppress all of this logic when
we're running virtualized ourselves?

> +	if (delta > 0) {
> +		static struct timer errata_c6;
> +
> +		init_timer(&errata_c6, disable_c6, NULL, 0);
> +		set_timer(&errata_c6, NOW() + delta);
> +	} else
> +		disable_c6(NULL);

The log message is going to be misleading in this case. Maybe pass
that as the so far unused handler argument? Albeit I realize that this
will mean casting away const-ness, which isn't very nice.

> --- a/xen/include/xen/time.h
> +++ b/xen/include/xen/time.h
> @@ -53,6 +53,7 @@ struct tm wallclock_time(uint64_t *ns);
>  
>  #define SYSTEM_TIME_HZ  1000000000ULL
>  #define NOW()           ((s_time_t)get_s_time())
> +#define DAYS(_d)        ((s_time_t)((_d)  * 86400000000000ULL))
>  #define SECONDS(_s)     ((s_time_t)((_s)  * 1000000000ULL))
>  #define MILLISECS(_ms)  ((s_time_t)((_ms) * 1000000ULL))
>  #define MICROSECS(_us)  ((s_time_t)((_us) * 1000ULL))

While consistent with the other macros we have here, I think this would
be neater as

#define DAYS(_d)        SECONDS((_d) * 86400ULL))

especially if considering that yet later someone may want to add YEARS().

Jan

