Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A254CB8C5
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 09:24:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282839.481660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPgl1-0003q6-9Z; Thu, 03 Mar 2022 08:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282839.481660; Thu, 03 Mar 2022 08:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPgl1-0003nX-6J; Thu, 03 Mar 2022 08:24:19 +0000
Received: by outflank-mailman (input) for mailman id 282839;
 Thu, 03 Mar 2022 08:24:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPgl0-0003nR-Iz
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 08:24:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f1d4238-9acb-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 09:24:14 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-5CkdrwX1PQ2kiMmxly25oQ-1; Thu, 03 Mar 2022 09:24:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2368.eurprd04.prod.outlook.com (2603:10a6:800:29::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 3 Mar
 2022 08:24:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 08:24:14 +0000
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
X-Inumbo-ID: 4f1d4238-9acb-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646295857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6AU69iuTQOnoOEvUGyViPRsMi+Wh140ZpZc3DakmUaI=;
	b=B0Qj/YM0RTwstaXLhpSJAkCcLZwjX25bDLQfVPDU0AkcdGyOwtWeqKIUPh+TUru3xFKf5q
	gFvOza66lhJxVkdIJ8VKbMhaWrdo0LijjMgwU7dNdQtmymtvz/PAXzFePnhLFyENjg6YiG
	JT49VQcy01Mscd38PthjQ9u0NHWYAk8=
X-MC-Unique: 5CkdrwX1PQ2kiMmxly25oQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7WjK3U8df+aE1diap8m9XBP8ssbnEc8mrp7ra83YSfyNUVoRLBgQ4gqA4YWVB519Cvfv8SFJLF1ecw5C/S0j9gJj+F0uSm7sDOjl9D55WrPSS0TdTzrAM/90scMvtd9PHFRzKsu7apbh1DmQ8JGTwY/5z79MADXnqvOwBP8OQ1cif2ewR6Zc9ArG0ZpbyODtVd6FQjfFYd7VSUg0GNMu+tjk70EmOZKOCoWlL3e4BenDRkd1/JEkS6V4YfEpLXTVfevmXTP74sXJH2K4Q1vpdTqN5gKMRAO94ssr8OeN6FO4VpRMpOe3rfAE/7V6mFufYJ0s/4oB7y6u3/YjiPWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AU69iuTQOnoOEvUGyViPRsMi+Wh140ZpZc3DakmUaI=;
 b=QPc46aVVuMqxETgDo/XVA4OuVO07OqEPs3KWGpKnAHw7ci7Ekt8DnJT1R1zwf9FFCD0OovoqUBnMQ/ChS0hqNmnGIGjuRvx1vouuZSC5SYc2OhJxbV2t59fKmXBdS1psvePUt0nVwXWpN1Jqek8FJPAYTu2CmS33WhQmndQkvBIcUnhJxHhxpeqIzRwgWnmCm4nb/c9l5AU6m4qOFxzU8YoEkD0+++TxGrbS6I6PmzCxhAZ5g2rhBxuPovRRvaVmejjAdqBtenu2vgev6fROJaLp+c2Y+KyBlrpsnzehxXHdJxIJjk+gB+vcUeCrvP+rCNDNLFM3gYat1UIjg9lPfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71b32db2-6591-bc94-4421-2dc13de7fdd0@suse.com>
Date: Thu, 3 Mar 2022 09:24:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH RFC] xen/sched: Optimise when only one scheduler is
 compiled in
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220303004015.17688-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220303004015.17688-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0021.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbe3f4d7-bb1a-4410-65f9-08d9fcef3390
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2368:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23689D4ED62F79E6FB18F890B3049@VI1PR0401MB2368.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aEed7KqOVRqaYMRKJ5Nt4h8c20GkIWgWM/dDQSWsmEE6RaHE85Z0rLdi8Gs8RjzTzlP1gO4viNBOaRFNzwDqXUd4WHKEi5BOuERSi2hdLLXJZsELbCUAE7XGO9J5b2oAG/EgyH12YSZfDyitRY2dcnRPIficytGqTHQAJzdwRSqTc6C8TgNExgQy2rYTZowCBFX3nVzsN5KCy1zIiOS8l308XNiPXzT0yBmWWS7wVOuAe4yfMrsP/IOSkKvP+ncOjFIooMlDexEiThBGO9a8rmGmYAt68ttr2Y0lwt/82SUKMcbrAFyR1eI6uO6TbZiGUjgJLJqANdjPfpMsdgsV2ksSeNCFuG1lFNot0LNWnQ6ZYxvOVlG97MUle9YqBLfN4hbcbMm3Mk8h267OhfKFXm40VdV0axnrFooS92s8Xiwx9EBhggUlQed97bxIxAThbILHCV3d+mBfeBNVRwhZWWW6uf2beagOrt+wO/UYt9bHBkYwUDZosIwjLU5JYjNMKwWiZGCcS7FruViscseFzGzb34ZJUGMBLd5AZFkcKbzo+rtCjYJZYIXMXINCtQXnh2EJSm9svGbGSFRgKDDcZ2sXQsZotCWcrHDVg85fxpdlr4mTLFIZ+uBXkg2X8zlEky6LgdO4yaOj7Y6WFiz0jdbPgcL1FDFklmqLANeQfN60gmFPOceNB9G2iyXli4rZLRpTlYCT+eu36ajn4o8FUAcl+JThqEhJViZqQ4J+oEun1CH3qfj+6/LLV4UQhZg3Ats7muJMsuDAjclp5+XrKQTjIjpqN9gmQnF46CSwxymAORzwqydnbr+PJuCXpVnP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(66556008)(83380400001)(38100700002)(66946007)(6506007)(508600001)(5660300002)(6486002)(966005)(8676002)(66476007)(4326008)(53546011)(36756003)(31686004)(54906003)(2906002)(6512007)(2616005)(6916009)(186003)(26005)(31696002)(86362001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1ZncHlwNmlJb3ZyQmpUOWVpNXE0dmhRaCtncHluWVBwZGhONENCakc0bUM3?=
 =?utf-8?B?Nkd2S3kxNFdFcXZHNlBKMmtPNnBiRG9MZW1PcGNOdGp1aGIzUmxLa29ONHJE?=
 =?utf-8?B?dDZZbFpZY1FIK2lUdi9LZktzV1cvNmRrYko2QjNRSVBDa09CcVF6YnBzckdy?=
 =?utf-8?B?N3FKSGFsR3BmSFhHK1FDejRoU00rbFh1S1JTcVVNQXJvdVVzbEVvY2FUUnZI?=
 =?utf-8?B?WE1jRjlncTlUUHFYTVkraHF1ZGhqQW9FMnJxaW5HVVNIOUZmUi9UQ3FDNHJE?=
 =?utf-8?B?R2Mwd1V6MHB3ellWZWlTbU10eGpHd01tRzRzT2pjM29MUnIvbkpkSVhVb0Uy?=
 =?utf-8?B?Z0ZSamZTSW9pSVVpS0JRSjhDcE12ZnM4OU1ES2h0Y0ZpYTJ1RnpKSTFYaFBm?=
 =?utf-8?B?THpjcmJaQ3ZLVHBacnNybEtuYjQ5Zm5NN0VPcFB4dkplaEh1UnBIRVVwdEdq?=
 =?utf-8?B?MXdsYnlaMG1lR3VXWFFveHY5bURVOGZod2FucDZNc3l3V0I1T2lMTGN2bHZK?=
 =?utf-8?B?UlZOU2NoTDVTMkx4TmExS0p2N1doRVh1Z0RPcTFHZU1yd3VZRTFHbGhqeFhq?=
 =?utf-8?B?NmRoRElob2NpN3hrWFdNNkxYTS9ObFh6dnc0cXBYVFZoRUJuZnFjL2dEcXE4?=
 =?utf-8?B?elhid2MxNEg2TTdXSlNVWkRlWlQzNXRrYzI5V0FWbWdyZXNaK1VYVEpuNEwv?=
 =?utf-8?B?TmRHbUtkQ1BQOGo1Yy9HL3Y2ZjJuLzNaWXBZUDNISWhHTnhiOWdnb1FEbTNa?=
 =?utf-8?B?NW9WS0JLbVlSQk9Tay9FenArMjdxenZYdE1aby9zaTNpMEZ4aWFRUGhrdkZr?=
 =?utf-8?B?Z1ZpMkxkWFFpVTA1SnVyOXlhVlA1aWtOaGJ5R1QzRkd6Y3RiT1RsempIQ3hq?=
 =?utf-8?B?OWJnejIyMWxLcWlseFRFaWhTekJ2R01CRE52WGMwRXRvRHN5TEZRR1M2UXRq?=
 =?utf-8?B?UFBVeWswUHpWeDVMUUZPVmp6VHhYNXVWa25qOEtuem1qQ1pzR1lCUnZBc2Va?=
 =?utf-8?B?Y0Vydk12SExWVTdXN0R2SmQrN1JENk9CNzY0NUVQcWFIWnFHS04rSENOVDl0?=
 =?utf-8?B?N28vMGxqL3VFdjZIWThZOU9yUll5Sm5MVWxwY053UTZUK2JycVp6dm41RU9l?=
 =?utf-8?B?ZVhUZnhJV01uTElzNmJ5QTdBRTFWVURmSkdWdkU4aUJ2Z1M1S1hNT1pJR1FR?=
 =?utf-8?B?QXFBcmVzclNic0dUYnZSZ2R3aVRYVVkwVFpyYnJQNGRPekorcjVkUTk4V0ZE?=
 =?utf-8?B?a1YzdVlGd09LM1BVQTNJMVdrL1pZS2Uwa2Y0bmVaQlNRUEp2a3JlSklPOXdG?=
 =?utf-8?B?Rkg0ZkdQY1EzL0M2S3laeDcrSjZkOGJQN2RESVFyZ3hVSk9UZVBsUHZJTDNS?=
 =?utf-8?B?OXB1NkFvUHVPUTJaMFpaMXFzNkFYVkFXYTUvdGd2QWRwSWxySTVuQ1pBWUZv?=
 =?utf-8?B?ejJ3STNKL3R1OUsvWGFKT1NsZFE0NDJyaS9VU0R0ZDlBMk5KZ0lEQUYySlEy?=
 =?utf-8?B?KytoelFTZ0tXN3Q5ZjQ5b2g5emtWR2ZueTRWWlk4N3F4N3ljNlJhQjJqNVg0?=
 =?utf-8?B?Y2xsVWV6aUIzMHJCUzJYeFIyVm55T2pVQVR6bWxwdkZIMllXTnYrdVg0Zmlq?=
 =?utf-8?B?WUgreEFLdndxQWRzU3VSaEh3aE8vem81Mzk5aGJ4K3d1ZEY1eENjS1ZwZGc3?=
 =?utf-8?B?OUVZRHZ3OTR2SjNwSWxGUnhQdWVZSTdNRW1xOWhyNmRXUDBVNHlNUjltcjdT?=
 =?utf-8?B?aGE3TWJKOVUyV0tYSXJuRmhDVW5LVEVDSXVWYTRFZUpyZ0hqSWVWQ0tOZjhH?=
 =?utf-8?B?QWpWM3dFRzBqQXR1VWhCSWRVTzVsbzYvUzRPaVhiWVcrWTFSMVVadWMyVUdu?=
 =?utf-8?B?YU5WaklIUEdvRVVudXJZd0g5MUJTaDYrd1VrbUh1dDhueTdQVkszYWFVYXJ4?=
 =?utf-8?B?Ym1tN3dub0Jna1pWOWk0eGlvbTNnM3c0MEFKS2pwRDRlb1c2VE1yUGEzQ0pD?=
 =?utf-8?B?Zm4rUWEyTUFZN1VYbHFEVDlaa2ZTUGgwZy9nSHhjRnRQVW82NVZjNm1FMUoz?=
 =?utf-8?B?aDl5K0xZNTNMS1kzSUVaY2t6SVVON1o5bGdmNDZMZk5KcjlRMnFzcnYvdW1n?=
 =?utf-8?B?cG14ZUh0aWxDM3NKOHV5alE1QUwvb3JRQzhibHZHamo4TFNWV0dFbTBsOCth?=
 =?utf-8?Q?yJeJjzJLrpV0khUamARZa1s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe3f4d7-bb1a-4410-65f9-08d9fcef3390
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 08:24:14.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18uTlN7MjfEV4GWRQiUJ1fR7kUFlI1mrz4siZ4QyCS7lPV3TAuLGW+BVgX3/A8m/nYc51HVFSa7nwqfAjbN5vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2368

On 03.03.2022 01:40, Andrew Cooper wrote:
> When only one scheduler is compiled in, function pointers can be optimised to
> direct calls, and the hooks hardened against controlflow hijacking.
> 
> RFC for several reasons.
> 
> 1) There's an almost beautiful way of not introducing MAYBE_SCHED() and hiding
>    the magic in REGISTER_SCHEDULER(), except it falls over
>    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91765 which has no comment or
>    resolution at all.
> 
> 2) A different alternative which almost works is to remove the indirection in
>    .data.schedulers, but the singleton scheduler object can't be both there
>    and in .init.rodata.cf_clobber.

Couldn't we name the section differently when there's just one member,
placing that section inside __initdata_cf_clobber_{start,end} in the
linker script?

> 3) I can't think of a way of build time check to enforce that new schedulers
>    get added to the preprocessor magic.

An assertion in the linker script, checking that .data.schedulers has a
single entry when the sched_ops symbol exists? This may involve a
PROVIDE(sched_ops = 0) as there doesn't look to be a way to probe for
symbol defined-ness in expressions.

> And the blocker:
> 4) This isn't compatible with how sched_idle_ops get used for granularity > 1.

Special case it just like we special case plt_tsc in x86/time.c?

> --- a/xen/common/sched/private.h
> +++ b/xen/common/sched/private.h
> @@ -271,6 +271,33 @@ static inline spinlock_t *pcpu_schedule_trylock(unsigned int cpu)
>      return NULL;
>  }
>  
> +#if 1 ==                                                                \
> +    defined(CONFIG_SCHED_CREDIT) + defined(CONFIG_SCHED_CREDIT2) +      \
> +    defined(CONFIG_SCHED_RTDS) + defined(CONFIG_SCHED_ARINC653) +       \
> +    defined(CONFIG_SCHED_NULL)
> +
> +extern const struct scheduler sched_ops;
> +#define MAYBE_SCHED(x) __initdata_cf_clobber sched_ops

__initconst_cf_clobber, seeing that all use sites also use const?

> @@ -333,39 +360,48 @@ struct scheduler {
>      void         (*dump_cpu_state) (const struct scheduler *, int);
>  };
>  
> +static inline int sched_global_init(const struct scheduler *s)
> +{
> +    if ( s->global_init )
> +        return sched_call(s, global_init);
> +    return 0;
> +}

Is it really a good idea to expose this here when it's supposed to be
used from core.c only, and even there in just a single place?

Jan


