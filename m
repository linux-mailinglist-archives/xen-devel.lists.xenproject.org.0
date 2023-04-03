Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1586D4BF1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 17:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517516.802951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjM8r-0007SA-CG; Mon, 03 Apr 2023 15:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517516.802951; Mon, 03 Apr 2023 15:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjM8r-0007PS-9R; Mon, 03 Apr 2023 15:30:45 +0000
Received: by outflank-mailman (input) for mailman id 517516;
 Mon, 03 Apr 2023 15:30:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjM8p-0007PM-Ik
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 15:30:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7de094c2-d234-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 17:30:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7295.eurprd04.prod.outlook.com (2603:10a6:800:1ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 15:30:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 15:30:39 +0000
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
X-Inumbo-ID: 7de094c2-d234-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhGGfpap+l/uzAzkgDekyM8UEe4jxBRuMVoSlTvL71XzqzRpfVBdwCWx9tNc7qpCecxqD87EXzv+vChtJMS42AQo9ZviLy6p4jCkP+DcVRWX0/bG3fO5291dEckEaSITWHSBxq+8r7e9B9fe4Oy2zMSe2zWDSuzQ4tWXJeOJmt7iDlYyZCZr9skDIC+mV7bzU2bdWYdavDI9m6rTrwQT3dz/UAsLALptCW4vck014hBoYm9YLWl/LMWgLeFn/LtqGoRVfkJn7UHAn7UPbR+f3OshC2ZjDuYfegnAMP6DYU3rtV2sqHsDJ7LF13vuLny5wbFiBUN/mXYuKPyrWoLrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B67imkZ+mLCqggN+D+FxYzH+CtFN8swOWJXmBPyZXY4=;
 b=iWFL42km80Gcki3XEjk4p89LcvTQoi0p5tS8GBbrOLU97lmFOxjBLIUN9R6Ab+tOMK8wjLXhIpq9Vs1gh0EThO11LfnYQAXnsweEqib1jirosvRsky5WmSnBHmDfXOw+f501n+eGV1G943+D7cbr9sx1nOo880AqeMWqIC6Lvq8LbtJMwo2habZ1PSb68djIqozRW3hlxhf35JoMZ2rbbb/F1P9RRmGWhI+YnATmIN08QqCClvFGOYx+5XpvhglMsCOawfSb3Gfb4PActUJn3l0ApAj14h/an6jrifwyaP6IAAfar8PBr+JpYbgSP+obBk2p0Qh4vRp+vhkx/k0cZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B67imkZ+mLCqggN+D+FxYzH+CtFN8swOWJXmBPyZXY4=;
 b=IvkreTiEJVYlokaNZihpp1VTdqE0yn5jec/tBohrnZ+JldQ/+yFd00oFxzm6yw0tpfjEbzSHmsgEnku80N/fOJcnY409jGbQm4f0EV1bCqxDs0BgibJ75+PSPh0JRNvqYyzEZKM7bqifNRTUdWkCIAQDcpvqExMiQIfb7168T30Vs0lD9PIbXHPR0eNQNDmxHq7BpF3Yu698pJ1hp148SyzA6PHRROrhMHu+5gSXYhZJvojxqyFt5afAf6KJ8m0Mh7oWNKHqBBQ3A/RjtPAkbD1GIglhmFLPPx7VXqf/u1DJ8P5zR7Hffs7NFSvDhrP+X3zTtkkGJRp2zETOt+xJfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5fc00c1a-11ea-905e-49eb-d70caaf71041@suse.com>
Date: Mon, 3 Apr 2023 17:30:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH] x86/p2m-pt: do type recalculations with p2m read lock
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230403101449.93323-1-roger.pau@citrix.com>
 <8d976d34-8a1e-95ad-3bc9-3cb704c1fae7@suse.com>
 <ZCriYs9y6JU1gat9@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCriYs9y6JU1gat9@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: e711b2bc-2f86-472d-a0a4-08db345860bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GGPZlNp0ygXGJkHBr4ME9ooyBKI1D52o6tbcPC+uuHFWYSMwyYzWMVRMd64/qYo71yC+Q/3V2ZcDd41VwRzeXl/u1U0x7gGBgAZWDwdxSR1IOmAK/lclypGPRmKOBOB8eT/H3kkyHEbGHH0BC/8yRRdZe60qjGfZm7Hz1xTPWpARts+GYLJwFvjlBgGQuAQIK+s+SAGWEXPpsKLrKKntep+sA7z9GHyl5uZOagUlhP0o/vNX4Wh60YSpA2DMc+/HwliZYMargKLwnLDXMRlwiEcACRRehZehs9tcuKEhd8yOZYL+oKokNH0UiV6esyq37uXyDhEEuqjXJDLd30D1rCWRYSGqv711LiJ8/9fqzWHnvxKoHj0Q9IzTt/PE/jlBqxf0s8VAtwapRoWTpziJT77Gb7Q4BaYa3sa0IcU1mD2uBvCGMKajozIxoY4nG4P8LNfn1vTF9mSf8o8+SpHa4IrW2C0vMw/n0xBfWhVCzWIFW5/9q8AbV76KbKEucpu5SL6GVPMaMYP3r1QJ0mKO6PuLr+KM+4vhLOrp69aXXMHopjx+tSTAn6buH03f2Zd/T7IVIS6szc9SeMWp1MoWn7Ai7eYtHuvyE3qvxQ8f6dEviduqzxmz9FpJN8x/d2rkWIc4EqKnW60fOniUhfkuqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(346002)(396003)(376002)(366004)(136003)(451199021)(31696002)(86362001)(36756003)(2906002)(31686004)(2616005)(53546011)(186003)(83380400001)(6512007)(6506007)(26005)(6486002)(8676002)(6916009)(4326008)(66946007)(66556008)(66476007)(41300700001)(5660300002)(38100700002)(54906003)(316002)(478600001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3h6NGRZR3Y4Q01VZHdKcGZER1ZQdTFFWGZPc0ZENzk5RlQzYWgyNUVPUWlN?=
 =?utf-8?B?U1JZYUNISy9WakhHaXdWck9JRVR0V05FOGR4VDFNc3crWHVUdnhUREpnUHVu?=
 =?utf-8?B?T2svMkVCbUdrNEUxU0FkTVZBRURmcXJmcnl6bDd6U1JqMG9wNEZqTWRBSWRK?=
 =?utf-8?B?aUNPSnpKNnNFZE1XaTZyN3g2QVRkc3BxaWRvaERiaEM2azlHTDBWbjd1U1o1?=
 =?utf-8?B?VkxOYVZ3U2toVlUyaytSemd2cWIxbHFUSWdCM3dqWFB0MExaQldNSXFUWW9x?=
 =?utf-8?B?QWlTRDFsbHZHTG1sR3lNNFMyMlJrNDI1cnBEOHlNZTJCS0xHc1NUK0FTVkMr?=
 =?utf-8?B?Y1FwK01GL1E0QjhWSFJxKzROVVBJU0lJQTdBVnZOMnRQb280WFhZbzBCanBE?=
 =?utf-8?B?ZEd1MllTNFJLanlOSzFuaUN2RHJ2Zyt3bi9KZWdFTmpGbFJ2Wi9OQUlENHlO?=
 =?utf-8?B?VitLVzQ0U0ZOQk5pQ080L3BXL0xkS1V1dFBtMXpQQm1KM2RsTUxJUHVCUHY5?=
 =?utf-8?B?dE5tK2gzQWZKQmV1QXYwNE40WFpmK3NGV01JWWRLMitXYVVtSWtTcDFETE8y?=
 =?utf-8?B?bXphZS8xNHBIQ2Z0bFhMamQ3V3Q5RVVZS3BHdnJtT3o4ckpvVkhDcHJITjFD?=
 =?utf-8?B?MXRiQmtKMm9kVVBhZWp6aDZLa1hNS2pORk1MK0pWZ3N1dXczVDk3YWdURFNw?=
 =?utf-8?B?Q0xCV0RQZEEyL0lyWDJScEdNN1ZWUGRkVHFkSlRHa1BGTFhzclFqNUFTbUpi?=
 =?utf-8?B?S3FBMkgrY2I1d29KK0xCTlRPOHUzWnM3RWM0WlN3V2lTVUJyYXVxamdKZ3F1?=
 =?utf-8?B?K3FMdXIyQUxOcWZJM3dpUC9nL2xkUEc0ZmkwYUdkU1NpTk8yRUo0RVBjZXRt?=
 =?utf-8?B?bDhibm1tOGhpMmdHNFVnaDAvTzQwUThtVUxyaVBEQjhsQjZFeWRJTUExVUgw?=
 =?utf-8?B?eTJyNzdNUVJwbk1Ydk5QWTZPYU5tYmVTNmx4VjFqMlBXaUlMN3JiRkkrRmJT?=
 =?utf-8?B?RDJUM21sVXZ4aGt6K2Q1VVAvQkF3ajNxSWJRMU93UWxQenM2MmVnVUgrV1dv?=
 =?utf-8?B?QWhmWGZsQmp3UWU2WU5qaHFIZlV2RHkzM2tmcUxmak1WcWFZSC84bTBzSmpN?=
 =?utf-8?B?SlBDekMrb3JpM1RodVhWYjB4UTdwWStIMzIvZXhXL1NVem5mSHhFYm5JWjNj?=
 =?utf-8?B?V1dwSnNmMUhTKzNid0RWOWxiTjYwUHZES1B3NmF3bTZvQzFJeUxhaktnWGw3?=
 =?utf-8?B?Sk1jNVhSMjBnbmdVOVZWYlJmMDlKcENCWjh1WDlPRURMQWw0dFcrNGRhR1pi?=
 =?utf-8?B?R09KbnhYb3FJVGRaMkdQc01wRHJzRzJuN1cvcEN4OHNPNER0citaZElkSGh6?=
 =?utf-8?B?eGwwakZ5T29jcWJiMjZGR3hWSGRqTDdEMXdzTnZMWThHcVp4c1hpWnRCTmYw?=
 =?utf-8?B?dmdtVG84ZEMvZ2IybGV6TGNXNkxDditQTThMQk5JRWlxVnBGOHM1b1JUcE4w?=
 =?utf-8?B?Um9ibW5LQnFlRG1SV2lFdTRaRUpZQXlUdnY4YXFEUVZXYzV5RFNsK05KUkV5?=
 =?utf-8?B?QjdHQTkzSHJ0SkhvUS85cEJJeFowdmNhVHJXVXgyWlFXTU5oOHR6N1M4QTQ4?=
 =?utf-8?B?RFk5d3g3Z0V3V0JyOWwzRk0yTHVGNGI0eDZ2UTF2WGRPdHdQbzJhZmw4S1dj?=
 =?utf-8?B?OExZaDAzclFaVzRTQlJ2ZC9Ddzg4U21yN0RNTnJHQVA3dU1hMG1zYWx6YXNJ?=
 =?utf-8?B?ODFpKzYzUG96eXBNbEUxUjhjdGtYSUNHV25mM2pxR1Fsd1JyTUFITjVxOU1F?=
 =?utf-8?B?dm5JZlpyek9qQzVRMFNqdm8rWUZKYWFhdFZKYmNVTjhTQzhGcG1kRExPbWJZ?=
 =?utf-8?B?eUUwUVgvYmpRTmNrb1Q5cUZJKzFERnNncEFiMHVkY3RNR3dSaWZKalAveUNv?=
 =?utf-8?B?NEhaYlU1enZCQkxXOHJQcVZlOVNGdTY2allackFCQTlqRS9HZ2lrbkk2YUNs?=
 =?utf-8?B?T05NY0grQy9xNnhJSWgwY1JmYmdvOEYrc1U1Z2R2NlpHSXdPMUp0ei8rdE5l?=
 =?utf-8?B?b1BCVjhyYUhKZUh5ZjdLRU5SbFRRWkE0cE9RMlRaa24yREVlZnFrT0h1eHdB?=
 =?utf-8?Q?nkMqpk5M+A1jyC12MKNQgVhBL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e711b2bc-2f86-472d-a0a4-08db345860bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 15:30:39.0138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JDFppl6blr1xh4u3Q+C/fE7Rd6JnYPrzmUmgP9KvlJ4Eo8KgYml4+0RrrGByGWPXdROxWm3lzdSj9XiCGvv8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295

On 03.04.2023 16:27, Roger Pau Monné wrote:
> On Mon, Apr 03, 2023 at 02:39:08PM +0200, Jan Beulich wrote:
>> On 03.04.2023 12:14, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/mm/p2m-pt.c
>>> +++ b/xen/arch/x86/mm/p2m-pt.c
>>> @@ -486,9 +486,6 @@ static int cf_check do_recalc(struct p2m_domain *p2m, unsigned long gfn)
>>>          p2m_type_t ot, nt;
>>>          unsigned long mask = ~0UL << (level * PAGETABLE_ORDER);
>>>  
>>> -        if ( !valid_recalc(l1, e) )
>>> -            P2M_DEBUG("bogus recalc leaf at d%d:%lx:%u\n",
>>> -                      p2m->domain->domain_id, gfn, level);
>>>          ot = p2m_flags_to_type(l1e_get_flags(e));
>>>          nt = p2m_recalc_type_range(true, ot, p2m, gfn & mask, gfn | ~mask);
>>>          if ( nt != ot )
>>
>> I'm afraid I neither understand why you make this change, nor why you
>> then leave the other use of valid_recalc() in place.
> 
> The message can be bogus if we allow concurrent do_recalc(), and I
> did miss the previous one.
> 
> I missed the one at the top.  Originally I wanted to send the RFC with
> just changing the lock to read mode, but then I though I might as
> well fix that (now bogus) print message.
> 
>>> @@ -538,9 +535,9 @@ int p2m_pt_handle_deferred_changes(uint64_t gpa)
>>>       */
>>>      ASSERT(!altp2m_active(current->domain));
>>>  
>>> -    p2m_lock(p2m);
>>> +    p2m_read_lock(p2m);
>>>      rc = do_recalc(p2m, PFN_DOWN(gpa));
>>> -    p2m_unlock(p2m);
>>> +    p2m_read_unlock(p2m);
>>>  
>>>      return rc;
>>>  }
>>
>> How can this be safe, when do_recalc() involves p2m_next_level(), which
>> may install new (intermediate) page tables?
> 
> Oh, great, didn't realize it was capable of doing so, it's more hidden
> than in the EPT case.  Seems like this will only happen if a superpage
> needs to be split because a lower order frame is being used as an
> ioreq server page.
> 
> Do you think it would be safe to try to attempt to perform the recalc
> with the read lock only and fallback to the write lock if there's a
> need to call p2m_next_level()?

Yes, that ought to be okay.

> Do you agree it might be possible to do the recalc with just the read
> lock if it's updating of PTE type / recalc flags only?

Technically this looks to be possible, yes. Question is whether we do
ourselves much good by introducing such a special case of permitting
a certain kind of writes with the lock only held in read mode. The
latest when we find a second (more or less similar) use case thing
are likely to become difficult.

Jan

