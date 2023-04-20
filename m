Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658EC6E8D28
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 10:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523972.814448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppQ0R-0001jU-WE; Thu, 20 Apr 2023 08:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523972.814448; Thu, 20 Apr 2023 08:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppQ0R-0001h9-SM; Thu, 20 Apr 2023 08:51:07 +0000
Received: by outflank-mailman (input) for mailman id 523972;
 Thu, 20 Apr 2023 08:51:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppQ0Q-0001gm-8S
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 08:51:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b231cd3-df58-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 10:51:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9462.eurprd04.prod.outlook.com (2603:10a6:102:2aa::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 08:51:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 08:51:01 +0000
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
X-Inumbo-ID: 7b231cd3-df58-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2VhjiFsMchVBz5OEfG3kC8G3o4r2nWQ44b88stn9DvEiU77qGNoo7W8TJHmSTvBQWOnERNxyiM+BUYrLO+CV3eZfLVeHrZKFhhN0biAQlItIiKagU7AkX0W6GZB/SDQ57Gx1KXniJcfSeGiMY6/YrUL+lH77qBeht9vv6fbGKN5Qe3p5v/SKR6m4DctUPzItBGMksbDBd7CHnYK4oRogGxlnHsDah/GSCcJc+PhqhdWPlvK26lVc8n0zzIKRkRR5CNPA1NEJneKx2RtDcSHVqRg89/Z3OymK4/yjrCA/aYV8B6tIuCJgfFNc6rk+GGMKTa2knoubPOUCEI7Np6wIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qO8/eQLcgTZIMyAY7w3qZMCAYlF3MYJ1N65RvbhwuNE=;
 b=cSW3F3DcRRKo5Pc2/z1NRSZHFLucFQvwifaioJcjGFfQTESsDnw5urgdCf6uctJ/sLGVf9ZHHVuLFH7cr1zj5DFieu4rS58F3G4R+novPTe4VuEJazMcCFj5eNpnbvPm55AsgT2/fT943OMnkEY2VmbXZKx/NXprYK9pv1hITWA+/4Koq2T9qwn805bM+3xpzs4PyB7fMbq9D/zmdoYobNuAJp4uXN93pF4am8LAqv3eXIZR4XPqSibql3bs963GT3EHD5FujBJItq2xbn964f9+WrWjdP6SeQ3mKrHKx3BCKkVzhdel3l3O9aZK3XSMelLR6Dq7Ve+WXZPiAIe86g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qO8/eQLcgTZIMyAY7w3qZMCAYlF3MYJ1N65RvbhwuNE=;
 b=N8Ghl8/QPTuuMp4B8rGUUjosHM/oqWfqyvp3fdF2uW5Pzqitlvi146gr38zUfgXgh6X+8GliBlFiOcxLYx6fn2rV3jASs5fawRUMt/oHOksR40Mzvo0yxgLjp3pUJNuTVaJxkprnKXPbcvlq3t1auNRGSNDVjtLe4hadiO3Fib/cuOD0wexZ77Uc3zKhVyzLr4WqVI4/7FupM9c5zA2u3STLawOZUQp5/4uV/7g1eOPYg91GAZrPGnN0UeshEu9qYf7Ia2a1WhkDCCunxUjbsn09dM5KX8yXbNPuUyyEE6JmGfdfJ7VorAWPrmjrs2jh6pWdmXcLg/876KzRqKkf0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f3726d6-60af-3db7-40cc-63308e427e85@suse.com>
Date: Thu, 20 Apr 2023 10:50:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] x86: support cache-writeback in flush_area_local() et
 al
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
 <ee33ad20-ef6e-504d-6987-59ccb166f8e4@suse.com>
 <53204261-3dac-579f-ede5-7acffd04f4db@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <53204261-3dac-579f-ede5-7acffd04f4db@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc0ab1c-69f3-4ce5-aa0c-08db417c5dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DmzVDtkEAxpg5ill8tAanTMPveXrXSjxJUx/FsixWb0c0FPMC6GHtzgdfDkTO71FbUMy37aA8CpFn7esTE8swBcznZebkwtiXaVZUs1IEkTWQoCVtgvYIAuTrZHEFPTGXHYIzciGsHV/93FV3S+PrR2jWlJ+XFjs55totMUqWv+uVvO/PwkdasJHYRYEjf+t3kN/s5hdX7AxAwasjP72riFMWqhWkD+7e5jTNavDzXK5Dpnr79T+oC+IG7nnXL7IG/i+OsbivupRzCfqgrC6qVXoamltqEL67kAofUzntMzq3mWrSbWFXXxG/IiuLXN7/5w2EOytLBV0HW6vMkibXJGuVUIHoVPeW8oSzlOOxU5cRJoXHag0/9tQlBjQggXTp6m3/WnBibl7FoRLWFb9D+6LwsQUX3inYGZor5BA7bejhmD8+qOHoQygoQw3rh6GRyqGI6tBdcWs8I2DAIEtiS7S3lf0WOOZAj7iq5ErkbPiY3rXQqb7vPlNrbfVj0wgdOBtr6mQM9I8sibMMPtJNOacDf8QtyfY53/4OTvvwZ++jYsqrcrUlJ/L2szRCdrKJ4rMDx8kt9M55LtSbzdlmz2IHAREoimdKuMGg3WwTzODYvRWts9MQVAGpx6byBQlvYdyqwhtwV9psiLxRuxnfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199021)(54906003)(83380400001)(31686004)(478600001)(2616005)(31696002)(6506007)(6486002)(6512007)(26005)(66476007)(66556008)(6916009)(41300700001)(66946007)(4326008)(53546011)(316002)(186003)(5660300002)(38100700002)(8676002)(2906002)(8936002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TllaK0tZNXhMUjZBSERqSVlWS3BrRjE1VTV2ZlVkdzh2NGlMbnp5Nks2bkMw?=
 =?utf-8?B?dFJWcEJkbW96MTdpS3FhblprWlU5S3Z4d1pUbG5mZis4U3p0K0EwRTRwT0lo?=
 =?utf-8?B?UUp6aitlMkg5bTNIR1pKalBIbTgvNG1KNC9EK3hwVlBKSHBmMkIvUElTbVpU?=
 =?utf-8?B?TFBKZXRDNXNDRm81RU8wZXRLMjA3QzRrOTJRaDRkWVhUV0RyR2VwYnZCT2RE?=
 =?utf-8?B?aHgxSHdsSzZBNGlvNjRmR3IvbkcyOHk0bFo0aHgzZndqQTBJZUZaU2RYTG9m?=
 =?utf-8?B?NktDcXhjTkdodkRtcC91T2VNY1pUSzR4NXBhN3JtKzQwWUdLa3A0Zk5IenU0?=
 =?utf-8?B?YWJNU2w5M2xvMTh1WmtUR1hpUzlFTkZockE5UVlQdHozMFF3TkU4QmltcU1G?=
 =?utf-8?B?SUN3Yzl6cnF2Y1RiaWZYenFHVHFQVjc5YWJ2ekllTVdVVFppTnN6NUQ5YnlS?=
 =?utf-8?B?VmFpOTBxaENJT1JBNjRLd2JaQzdwMjNhL3luUXhaOWtwNU5UNVpuU2s1V3la?=
 =?utf-8?B?cFhHaXBzYWxqK1BkaEg0MDU3bjhKOGhKdTN4T3IrYnBMWWRTMEx6Ylh5SVpQ?=
 =?utf-8?B?YWJqRExDaEFZWjB0eUViT3I5cjdqbmtNWlZmUEg2dEUxUmJja2hISEtOT2VZ?=
 =?utf-8?B?VXJvV1EvaDFtdHVpM242WWx6YmRyVVUyVEYvUXdqZU93UVZROStpYllwNm9n?=
 =?utf-8?B?N2lYVkJocDRyTERtZ2htNmo1OStUQkk3TVZpUkVhY040RXlVV1B3UjFFNlJM?=
 =?utf-8?B?QmVZWVdmd3J4MHZQWjZhRS82eXg5c25GeXpyS1d4M3FGVThhTjh6cGh0TDNm?=
 =?utf-8?B?ajV1eG9HRzhtbDFraW1YT2JZemxJcmh2WnZzQUtFelY0VEZ3amJTVGY4Y29k?=
 =?utf-8?B?TEtuSXlWRUcwN0x6ZFBSRDlJK1Z4Sm1LSHlnZnArR3V2U1Q3K01EaENkSzN4?=
 =?utf-8?B?QVNBMk14aGxMMzdzSXJpVDNDa1U3cUZXZ1hZcGhGTzNVOG1ZOXFxeFRzb21P?=
 =?utf-8?B?ODlTclZoelZXcXM2eUNjTXN5Mkx3QnBOSnFDeXU5dlVwUHFpM3pLYkNZZEow?=
 =?utf-8?B?Wlp1NjdhYTYyNUlvZ0Q3b2szbGFCVTZObTNGa05JeUNId1M0NHQ2YklwNEVV?=
 =?utf-8?B?Qk5nUHVHR3kzL3lneHo2akd1V2RWSjB6YWhMazVhNC9XZEhpWUd2TlVPK3FH?=
 =?utf-8?B?VzdPRWlUek1vcWRQa0lpMHpIQTd3K21xZTFrbXV5K3lHWmVaOTFacUNWREti?=
 =?utf-8?B?Nk11ZTVxWVpHZGZGcWNZMzhyOTEvcW4wc1paOGtlYWZQaDhPejA1ZTlQTlc1?=
 =?utf-8?B?N2lZQmhMbEtCTjgrK1A4VzBqYlJWbXUwWElJTTJiRWJvRjB2TXhHaHVWLzVj?=
 =?utf-8?B?aDFkM0paRXUxazRMQ0xIaGNOeFIxUFJvVnd6c0RKaGlWVllkQUNaMVNHMlZL?=
 =?utf-8?B?Y3V1RUVLMC9mZE9YOTZnaWU1VlYwOFE3a0Z4V3RJcDRzTWVuZ1ZhKzZtbFNK?=
 =?utf-8?B?U0tDZGV2SWFZT2FQaHQ1UUtZTVQyV2VIVHVpMlJUVEFFRDNQYjQxZVZ2VzZL?=
 =?utf-8?B?QXFadUVmMHE5ZzlZYnJBckxDV3paNXZtQ29NcjlBZnFacGRGbXA4U3pieGRv?=
 =?utf-8?B?VUIzRmVLSitjWGw5UG1kYVBxVGN3SjFOS0VWbEVtZXExZjdxT2NOMkVxQmsv?=
 =?utf-8?B?Qmw4bm1xV2RIdHRHdUlDSlp1cWNKdDV2UmNpZFNrWE01NUdhaVFnd09SV2RD?=
 =?utf-8?B?TVZDbnk5VGJSZ3VuL2Q2dTN1eUdEdm1ueU9JdlNXc1JLbmU3YjY1WjJ0SDVD?=
 =?utf-8?B?TGtGN0V3eDJFZGEvR3J6bnBVbHB6M1d2eE1zOGlYNCthT0RoSEpxNzVxZktX?=
 =?utf-8?B?eTF0emkwS1lxdm5MSS9CSGdHb3pTQXJOMGdtRHUrU2w4VG9hYWhISlRZT0VN?=
 =?utf-8?B?TElWbzJvNDFxcnl5azJJMzBnbHcyamI3ZTZuWHRzWGYyV2RxODlxZnVGaHJt?=
 =?utf-8?B?OEpDaWcwQ1phQW9KL0hoK0doTVNLck45WERZVUhxSkJ5T2cwaUU0a25nY0FC?=
 =?utf-8?B?MUQwbjIyQ2puLytmWWRwV3JBQ1JocmtXM2dpQzFCVEFrWlAvekFqQ3ZFOTk1?=
 =?utf-8?Q?aMrK3JL092gE6kf21GlkiTNgt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc0ab1c-69f3-4ce5-aa0c-08db417c5dfa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 08:51:01.3306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCPecYHptvnT1bWjqa4VR91FFcumVboEYoCiFQNCC7CLYf0lv6VaHIius9L6r036HPbWac6MrDNqc1pNYFTeUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9462

On 19.04.2023 21:56, Andrew Cooper wrote:
> On 19/04/2023 11:44 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/flushtlb.c
>> +++ b/xen/arch/x86/flushtlb.c
>> @@ -232,7 +232,7 @@ unsigned int flush_area_local(const void
>>      if ( flags & FLUSH_HVM_ASID_CORE )
>>          hvm_flush_guest_tlbs();
>>  
>> -    if ( flags & FLUSH_CACHE )
>> +    if ( flags & (FLUSH_CACHE | FLUSH_WRITEBACK) )
> 
> Given that we already have FLUSH_CACHE, then adding writeback also seems
> fine, but we need to get the naming corrected first.
> 
> We've got a file called flushtlb.c which flushes more than the TLBs now,
> and various APIs in it.
> 
> We have a bunch of ARM specific APIs which AFAICT exist purely to prop
> up the ARM-specific gnttab_cache_flush().  That needs to go and live
> behind an ifdef and stop polluting other architectures with an
> incredibly short sighted hypercall interface decision.
> 
> The "area" in the low level calls isn't good.  Range might be better,
> but I'm not sure.  The "mask" part of the name would be better as "some"
> or perhaps "others", to be a better counterpoint to "local".  Some of
> the wrappers too really ought to be dropped - there are lots of them,
> and too few users to justify.
> 
> But on to the main thing which caught my eye...
> 
> The FLUSH in FLUSH_CACHE means the flush infrastructure, not "cache
> flushing", and FLUSH_WRITEBACK is nonsensical next to this.

I agree; I chose the name simply to avoid further changes, while still
fitting the naming scheme (i.e. the FLUSH_ prefix). I'm okay to change
to ...

>  All other
> things we flush have a qualification that makes them clear in context.
> (other than the assist one which I'm going to time out objections to and
> revert back to name which made more sense.)
> 
> At an absolutely minimum, FLUSH_CACHE first needs renaming to
> FLUSH_CACHE_EVICT and then this new one you're adding needs to be
> FLUSH_CACHE_WRITEBACK.

... these, but I don't think they're much better (still primarily
because of the FLUSH_ prefixes).

FTAOD - while I'm going to make these adjustments (adding a single
prereq patch to carry out the initial rename), I don't really see me
doing any of there other adjustments you were outlining above (at
least not within this series).

> Except...
> 
> Is there any credible reason to have EVICT as an option by the end of
> this cleanup?

Yes: map_pages_to_xen(), hvm_shadow_handle_cd(), memory_type_changed(),
and hvm_set_mem_pinned_cacheattr(), all mean to evict caches aiui.

clean_and_invalidate_dcache_va_range(), as you say, really shouldn't
be required, but I'm unconvinced we can easily drop support for a
gnttab sub-op that's been around for a number of years. (The more with
there (still) not being any support for GNTTAB_CACHE_SOURCE_GREF, I'm
(still) thinking this shouldn't have been a gnttab sub-op in the first
place, but something truly arch-specific [a platform-op, or a memory
one, or ...].)

Jan

> CLDEMOTE does exist for a reason (reducing coherency traffic overhead
> when you know the consumer is on a different CPU), but it would be
> totally bogus to use this in an all or mask form, and you wouldn't want
> to use it in local form either, simply from an overhead point of view.
> 
> We have evict behaviour simply because `clflush` was the only game in
> town for decades, not because evicting the cacheline is what you want
> actually want to do.
> 
> ~Andrew


