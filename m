Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070C370514C
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 16:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535260.832937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw3b-0006BL-0b; Tue, 16 May 2023 14:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535260.832937; Tue, 16 May 2023 14:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw3a-00068O-U0; Tue, 16 May 2023 14:53:42 +0000
Received: by outflank-mailman (input) for mailman id 535260;
 Tue, 16 May 2023 14:53:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pyw3Z-00067V-2j
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 14:53:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7145a7a1-f3f9-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 16:53:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8445.eurprd04.prod.outlook.com (2603:10a6:10:2cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Tue, 16 May
 2023 14:53:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 14:53:37 +0000
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
X-Inumbo-ID: 7145a7a1-f3f9-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+u7KO4cXrHRU5kX4NKHs+4rdAaIeYwJvAbEti/vi+gTcJrmrYq2Kb1FwHETnKEnWJOopSVnfM9t1yUimuTkKBCgH9+UP35oSO+6ia1D+DdUpezxWK+tcWFckZluEeb3zRamaQB1kWhhlXm0eXIWpwRaVSHa+Ws88zPKUj8LRBvchZAW9F4Jmp7rlE2SuP5fqcCKpMUpDFcCpDDEldaD7HJ1TEvNCQZa7/hUvbBMMC+Wbgh/ifGR/BRZYlK6CYsQDp0g7nxbvoAnG0sr3fosQ4Udy4n/6PU3nLGD7XMiKFOPXvIjArWj+2kORgxXvLrOyzDIPcyK5EsnlLZwgtXETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daInJN88i+p1YQGyc6eg9rrply3P7vvIgfvu63l1Sos=;
 b=dZZYwrVXfmVUpUFnhALZeOztQr5Fdo80ebdIbZweHW4xFBuwBXMXE0Bn/r4kwh+UtUw04Q1TS3hZEQ6RlRqH7QjIDSxegBZCB6zBYSXXlMpFTGNM5kf9RfOeBcp9jTNrASX6DzM79qK8otzB/Y0/vdxNXFJYN2OthcDOzNZ216KjM6UHq0Qk/jFP4sOCRHoK4vfyGyzaquc22IPo64IA5ghbyDMkiT1tOJ9P/GaIjISjywaZsdA5i6Ywk8+xvhoTUev+tvqKPsqsd+TFGjBZw3QK265MOqSALEI6H6WLSaBLZEps3k9cuvqpeoZmETn7IGPvKa40uk1NBM3w7UT2Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daInJN88i+p1YQGyc6eg9rrply3P7vvIgfvu63l1Sos=;
 b=f9pT7SH8loHYXkUZAwkZx8Qdh6IhRcd26QKwRfsnV64sci+k8DEeuR9x3BzkYLoZYifezy80uo7sZFgO9lt07U+bFEZqB05oxGRkk7Dc4yBO9KOXSZD1aQkecIFSYaLbTRqGbPHLw8MmZmdVkDmoOpYcbe2hGMQBKILkmKgFxnq/dN6u0ow5rZvAOrhfbtWMaL+UHy4R1Fy7oYZw/y9808UrUk6VX/DTBBTeKDw4eYgcwHOCCFH7ebGrTYQPl+BYRpaaHXWheGIzU56AaCFEeHbUQvr+to8OjByL82b0YWLIl5T9pO1clNL2XZkyNqDm8DqeKABSjwIAF99NRW6XuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22a6bd70-887e-da72-ccff-16b3627463c3@suse.com>
Date: Tue, 16 May 2023 16:53:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 6/6] x86/boot: Expose MSR_ARCH_CAPS data in guest max
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-7-andrew.cooper3@citrix.com>
 <a545a6c9-db48-9d91-c23b-59ea97def769@suse.com>
 <25421dbc-5889-a33c-37dd-d82476d56ce4@citrix.com>
 <1bef2b0e-04e8-2ca0-cf03-f61cdae484a9@suse.com>
 <b1c56e56-90cc-0f37-4c8a-df1217339e59@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b1c56e56-90cc-0f37-4c8a-df1217339e59@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 491aff20-e2e2-42d1-317e-08db561d5420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZxtKs+ULyFF7EDPW700o7eebinl7Tz26AmX2TZKa2/adIELNXlTpvvWmOsXqmTbabESIX5IAkGy5nSZ0UIVVJ7+nkxNc5PEsqa7a7yPumFozoZxsIn5/tu8dnTZD3mGKRvY2hKRv0kLsGFjXh4lM6KY1O5OseBPlsQL+EkRdGftWkbGL95iysZem/Q9JOgSb1dRMrSBHOmjYfl2TEKFPwFAQJuFAyNJGz5U5iuW4nvRHXcrEZaenGKyLRbMNjAq+ocSkPzQX+mhta8hFs3fnuPTPVMBuQ6bc89R/asHtxSJGRh2liDQEueEtjwJFunf5CG7VyFzkpYNvbIaEKG6zayQYrOXSoZ1IVMEhuswK+XzzsfiYH+qrnkoVScnOW67rqSDsPZCtLRs61K80OVjskEmxA+VsIGhCYzSbtSkk6fip4nhKF46kgB8+Gtp0VFfhB5hbIIGbpTPH63yDKaAgHJItcrpCFG6JcTvN2466r2AvBraIx/KhgiVHWL0zgVNgZ4LQjhrQ2iKN8HzLmjjstBx42p6QR2XM6oQ3rQT/bl/ovrxZ7Boatu0mlM9at80pE3jY/XppSS8jcm70dtSK6Zk1sFkX0MAvTV3blC3aqsCnWQZLrX9WI04JGTej5hvNmTwzIcXS1Lv6Mr5AA2oeoA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199021)(31686004)(2616005)(186003)(41300700001)(4326008)(66946007)(8936002)(66556008)(6916009)(26005)(53546011)(8676002)(5660300002)(316002)(31696002)(6506007)(54906003)(478600001)(6486002)(38100700002)(66476007)(86362001)(6512007)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkhnTis3d3FCTDErNjdOSXZvV0NJVmxoa3dHdTFKaUVndGg4UjNZZCtHZHda?=
 =?utf-8?B?T0F5ZHlxeWRRcHYxWldVVzl6MjVGUzNONkFpWHhzZnErVkE3Y3A3NzJCMm5N?=
 =?utf-8?B?cDhObVA2VTdodGRYUVUrRkh0aytqR0FmRVo3endUcytXWTJXbVRLdzJWRFZ6?=
 =?utf-8?B?MWZzZEJjNFV4Y1R6UGsrTUtnMUtaZUR5Tm1qMmNwNGVEYVRoVTZDb1RrbndT?=
 =?utf-8?B?TGMybGs4TFlnamVHc3pQc2s0ajZLQzl5ZWpjT0E3VSt3Y2JodG9FdXZ0MDFZ?=
 =?utf-8?B?MmNQczJHWmtXQ0FBaitPUlpKKzRLZTZmSjJpNDFueGlPTXdZS2ttUjZTeWFU?=
 =?utf-8?B?NDRDSFQwSkhiYUdtd1c4ejJJNFZLTlV5LzMxOW9taVc5amtmK1dremJNam0v?=
 =?utf-8?B?SFVEWFoyYzRCbXQyZDkxRmtveDZIdWRLalNKd1BVT3dnQnUxcVJUdzZKVHFH?=
 =?utf-8?B?cWpTM2Z1VTdPOFFVeG1LeGk4eWsydU9PeDdWVHVXRGJvQTV3S1FBbUMxRzhh?=
 =?utf-8?B?ejA0SFd6ZnZUT3lwM3hvT0tqNUo0NTNlTVJLeC8zbVlnY1BZU2cwMit3a05w?=
 =?utf-8?B?anFaWnlvUTkxQ3R6Vm0xUnZ4bEhuTUY0ODc0VmRpeGpqaGIwSWs0K0diR1JG?=
 =?utf-8?B?NklTazRyTW9NbFltMVhBaTZQS1VKOVpqYjZRNnVWWE1TaENUTGErZm9Yb2hk?=
 =?utf-8?B?NmJMbDJpRVRTNGh1d1kxdFhncnE0L2hiQXpNaWR1bURYUGJ0N3J6dkwzWUt6?=
 =?utf-8?B?a1ZkUkRrdXFzUEIrZzBTQVJPSERPczdVZTR6MWFZMjQvT2VhVkc2V3MrL1Jx?=
 =?utf-8?B?TGw2ZzU2MXBEOEsrSWk3S1ZHMVdnc094aytPNFVWYVl2eUJnVW5kRHJlUjI4?=
 =?utf-8?B?blF0VlZZcFh5TzB2aUFmNlZ3UklhYnBhMy9UYUZ4dy9jUG9mZ1RRbXNyOG1Z?=
 =?utf-8?B?ZWE0QnRjQTZMbDJsQkhTRGgvelFwM0V3TXBMTHlEU3YzdEJ5Wko0Q2pCNEVN?=
 =?utf-8?B?YTdoV0ZETTNrOGVqMGlYTS9vUjNpd3JLcUp3VTE3OVp4T0xhTFN4RVBlZ1Zu?=
 =?utf-8?B?dWxwbnpMdnlpRkovMy83SVloUE5XUmgwNnJkOXpzdGV3K0M0V01pcXBYMWw2?=
 =?utf-8?B?OTBsVnRQVkNJdlpTMVArSytxbXhYTnQ3V01sMjZkUklSMXo1VjAzOGdpdVdI?=
 =?utf-8?B?RmVaR2JGOWFrREE5LzlSbHlkZ2pub1NuWFlVMkZJZWoyaG9Rd1VMZTFmRXNO?=
 =?utf-8?B?aDBXdHBsRHNONE5VUzFPSUMwd3FQb3djQ0pHWGo0WDdJNDZ0NXM1S2ZnRm5P?=
 =?utf-8?B?ZnlMS21VMUNMdXpudVZCb1RPZE16OVlLS0JGMXF6elAzdkw1NVJZakYvVDJ6?=
 =?utf-8?B?TEpFTW9jOHNEaDI3ZkZlYlU4QVpldTRTeStlbTNlTHdDa1ZOWmwrMmIzWjFz?=
 =?utf-8?B?Sm0rQ3lQdzhyeXRHR3p4QTRQTHk2a3VMdndQUG95Tm10VVJ2cFVNZVJJc0dp?=
 =?utf-8?B?b3l3S2JQSS84d1Qwck90RTczSWpZNXBvRUdRL0dRM1ExQXBiTDdpVVREUkZU?=
 =?utf-8?B?WWhDWHFheFh5RXBOYWlnN3pXZjZDdCtIMEV6WGFJWG1veWdvNkdra0hhVWNr?=
 =?utf-8?B?L1RwczNyVzVpM2FUdFE4VFhaSkI3dTlMQVRka2c4VVJSRVc4UFl4RVBWQi9t?=
 =?utf-8?B?Z3V2NlR5UGtWQkRvbktTeGduSFc3alcvV0lmTmtJcjRBZVBZa0Y4dHptMTBX?=
 =?utf-8?B?bm5NZXZmalplcHgyU2pWd1JWc1BYQTNLMmxpNVdHbllPNFI5ekJzd0U5eC84?=
 =?utf-8?B?ZWxrWUN1L3lmdE5qWGJrMGJKNktETHZ3TVNXdkhaR25iWEhqNWRrL3BhZjNS?=
 =?utf-8?B?L2tyb3Mvc2NsZ2pzRGZUZlpsN1lIWHVWdU1ZWURnTGlUM25ZNDR6eHdGQzJk?=
 =?utf-8?B?YjZ1R2pUWTJOUkZuLzRFenZWdlZWMDhPcTl0SEhUeVMxOVJPalVFTjMrazRv?=
 =?utf-8?B?TmJLQTdFSEhIbnk5cUNTeng2QlpZdU5IbktTaXA0QU9kT0lBam5Fb1lzTkE5?=
 =?utf-8?B?dkpGb3YwZ3dGV1NwSDVVdHlKZjU5THVrdEU2aTd0dXJKYXJySm5PUUxscERD?=
 =?utf-8?Q?4fW6h3+yUTNFTI+4XAmytfdU5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 491aff20-e2e2-42d1-317e-08db561d5420
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:53:37.0098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFJuGr6m/3/OzKC+85IY2IR0NRI1AmF7aAsqUZ+Zbr8M/cyiz+9sD2dIRZoHuC/hXMUgkesS7bTnKSPN3PsKmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8445

On 16.05.2023 16:16, Andrew Cooper wrote:
> On 16/05/2023 3:06 pm, Jan Beulich wrote:
>> On 16.05.2023 15:51, Andrew Cooper wrote:
>>> On 16/05/2023 2:06 pm, Jan Beulich wrote:
>>>> On 15.05.2023 16:42, Andrew Cooper wrote:
>>>> Further is even just non-default exposure of all the various bits okay
>>>> to other than Dom0? IOW is there indeed no further adjustment necessary
>>>> to guest_rdmsr()?
>> With your reply further down also sufficiently clarifying things for
>> me (in particular pointing the one oversight of mine), the question
>> above is the sole part remaining before I'd be okay giving my R-b here.
> 
> Oh sorry.  Yes, it is sufficient.  Because VMs (other than dom0) don't
> get the ARCH_CAPS CPUID bit, reads of MSR_ARCH_CAPS will #GP.
> 
> Right now, you can set cpuid = "host:arch-caps" in an xl.cfg file.  If
> you do this, you get to keep both pieces, as you'll end up advertising
> the MSR but with a value of 0 because of the note in patch 4.  libxl
> still only understand the xend CPUID format and can't express any MSR
> data at all.

Hmm, so the CPUID bit being max only results in all the ARCH_CAPS bits
getting turned off in the default policy. That is, to enable anything
you need to not only enable the CPUID bit, but also the ARCH_CAPS bits
you want enabled (with no presents means to do so). I guess that's no
different from other max-only features with dependents, but I wonder
whether that's good behavior. Wouldn't it make more sense for the
individual bits' exposure qualifiers to become meaningful one to
qualifying feature is enabled? I.e. here this would then mean that
some ARCH_CAPS bits may become available, while others may require
explicit turning on (assuming they weren't all 'A').

But irrespective of that (which is kind of orthogonal) my question was
rather with already considering the point in time when the CPUID bit
would become 'A'. IOW I was wondering whether at that point having all
the individual bits be 'A' is actually going to be correct.

Jan

