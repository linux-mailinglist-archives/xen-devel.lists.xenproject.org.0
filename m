Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5B85ADFD5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 08:34:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399377.640527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVS9e-0006jZ-9K; Tue, 06 Sep 2022 06:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399377.640527; Tue, 06 Sep 2022 06:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVS9e-0006hb-6Z; Tue, 06 Sep 2022 06:33:50 +0000
Received: by outflank-mailman (input) for mailman id 399377;
 Tue, 06 Sep 2022 06:33:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVS9d-0006hV-0h
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 06:33:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60044.outbound.protection.outlook.com [40.107.6.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc86f690-2dad-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 08:33:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8368.eurprd04.prod.outlook.com (2603:10a6:102:1bf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 06:33:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 06:33:46 +0000
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
X-Inumbo-ID: dc86f690-2dad-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mtd5u3q8zVQxs3Q4q/2DFcYsEIiwqBAyQyjEFZ15Bco8qxdZqdJZ4zgz8IwliubYxsEQwOR6N1KDdw+EEC/juHWYiWaeTvxjhhLquKfoBSTIE6orm8fsQtUeDgIioYJCKCN1wFkTRZLNPeNOdamBKeN9oJBLupUaja2ni1KMJM1JOAf0OFqAp/0iQK0k424uN9tuu+JBQarO2mktEsz0Z07/CONaeRtBthM/xg4O/+rzTuzdzbJ+DpkYeqmYmbrKV7dl/MBaaA3Tv0+PsXIrUgv8ibICru/EwUhQNmUnj4u77HEuNcq9Jeq7tLl7g2pC6LbuVTRNtNcttPpDMUfpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPmF2/PqohE6KhCfmaPh7Kot0HjxeHWQOTXeX2dsNPg=;
 b=ThBTDuAr+7m+AN9p6itHXnA3MQZLcXs2afpVPdt5YEtN3GHXDmui+Fi992X9LxTMgbLlHIJM0mOx3pDA9SZPIqtNEuSrLWt2N+eWy6oqoLsVIa3vUTrdwObiSxSfKaU/dbbPi6ILVncO96ElSqTdcu1lxL+ezVvayHGfAhlNKqOII/KiHjyQe0Gno1Hk6zJ33JJdRJaC3ox0Y33aSY0tS9hoCSMCBBXd+R1Yy9ZFpqswj2Ey7yqdZkGnt5dtqjIzZjXHoxMBL7pEc6pG9kbWmh21JIAygJusak/m32D9un7h87ZKo78ZnwzIpMT1t7oSyH+6HqXiBYR4l+a1IUFn3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPmF2/PqohE6KhCfmaPh7Kot0HjxeHWQOTXeX2dsNPg=;
 b=flZSZoFsWlzOWnVW5gfJva5cwD8CsTNfqlNyOMUhAxdXYOZepTWpVbsafQi9uIxqi7uI3tM41lqnPxMmLwwhXzdJAcQJaWBoAKRyy0vocSLF/QQAOWBP0jejHjg4se/sPxAjaS+XHo24m+a+3O++LzvIQPivdnEVaCVzjr5suvXe1Id3cHQVUal7A+29npFMyephqlOQS96VPg6+TtkVjz6FQe2Gn99vN2NFLddVrsUtVjvw0JwpHScPthltvGJmBcX2DZLHvk8BMAP5A5a3oHlPzgRwKCX/lWaj+GnxI8m3zZ1mkGHl01RSEfrDYoWTwdPhqPmcL+4L6Ke26PllPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <384fbd22-909a-b56c-9cc2-0765f2498b9e@suse.com>
Date: Tue, 6 Sep 2022 08:33:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v10 8/9] xen: retrieve reserved pages on populate_physmap
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-9-Penny.Zheng@arm.com>
 <691b68f0-db68-b400-5473-558583f8dbc1@suse.com>
 <AM0PR08MB4530A910E43B82D9B5226F42F77F9@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AM0PR08MB4530A910E43B82D9B5226F42F77F9@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0111.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41534e9f-ad38-45c5-3b5a-08da8fd1c004
X-MS-TrafficTypeDiagnostic: PAXPR04MB8368:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wrStnvZPcurLSJpA3NlNAlnsZ+dM3e2/Ccm5zQP/GsWC8zqvKPLlyMYZFS1EZiR8tnTlndiOUhEJvn8kuU948PdB6oh12BeF5vTQs0kkU9KAKPvgp1gIgProO/f1SDmvxWKGqV9iwLY7HDu3vLRLhzEWVlsShhpTAlKEYDkagL6WNm+XtL5S6XKVGSBBKXFttrmSRH14h0CxGLK0E7ohuxuE1Z2vM48+MIMSMvSavO23WIMofL6eVqGJUwyy6IfaZkBnYzlydhe3pZKvJxYAklqLJsd+0/ixG55t83fYVO+yJ8dLku8qwspBNpHOv+l15j20zM49/Snk+37RiESukFZirMJE0SSMI1xKrZd/ckApNkoydI0toGMXsKk5zLKD2C3yDNMfrRyP2gsDx8elc7bFPCgetJ9bUqKnuntnSbTRRKjj7exTMLq4mgFrqWCgrRQDF42HJq3c7XhdRV7+cF+vI8zSrdz1pZ7njOk6Ep8bY1rt4sM9XUjx4iplQ+HJy0sInyBF9VDtj8yoFn507Cm8KyeW0Jj8OXVLoKvzmcXEQc8FD/LKyKI1BdpMd8o8GTy+qOv8wVODIYtz64yU78AthAWnpnVzjy+3OmrQx4cr0nr0nAkC4ssSYMKb7PLzpxqiWu/fpIy5ZK+tVriZlczrk7rKdk/nhj8lJHMvfJjf40dnbzYex/2LJ3bawJidyiJaj7VFvTziHgK3FhUI3ZmO2+wfu2iAx7C26edlxY33n3ASOeYhhWTlN3MEkfCDHs8+RhF2AKa2Z1MNxhBE6Wlia1hDsMCBZzHgJt3Tcuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(396003)(39860400002)(346002)(136003)(38100700002)(31686004)(36756003)(186003)(2616005)(54906003)(6916009)(316002)(8936002)(6506007)(6486002)(66476007)(4326008)(478600001)(5660300002)(8676002)(66946007)(86362001)(31696002)(53546011)(83380400001)(66556008)(6666004)(26005)(2906002)(41300700001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkxpWWROUkZPZzJscnFiZ0hxTkkwSVB1RUZBZG0vcGNQc1FiOFBhaEx1M1BZ?=
 =?utf-8?B?TVdjQ0pRYXJiWGRidUN5RXgySG80aStGSUVubVpteENZbzh5TURPOTZSeHR2?=
 =?utf-8?B?RnFQcmNWbkFyYVgzREd5WE1KUXR0Z2ZPVTZIYnROZ25DSm5xMi9RaW5ubGdF?=
 =?utf-8?B?TEV2aldoT1B3dW1jRWF3dkVtWStpTTRGTzMwZ1NDZlVGOVdqaEhiVWZJZ1dP?=
 =?utf-8?B?Qk9jVGdTMjdEWXVkNWdlakduNlBibkYzOTA3ZE83YVZDdTVaS0YwQjJseXow?=
 =?utf-8?B?UjN5QmpJVW9OQVo4N3BDeGQ0TndMZ3JyVG5jNm1CajRMNmcweGFSOG56L3RW?=
 =?utf-8?B?WU1pN1FKMVNHUFRsQnVGQkZ2bFhtdXlGb3NOZUV1ZUJ1N1ZnU3J1cXJlRlpP?=
 =?utf-8?B?dktjeFpjTUdacFFaL2hZZCtLWFRzY0V1Zks0cHlBVGYxSmpDVVorZjhJV0tJ?=
 =?utf-8?B?a29nejhEcGx2ZUhtZlh4VklvNjVOQWVBUkhCcWxPRG1KSmRTRUF3b3QrQU9X?=
 =?utf-8?B?R3c0L2YzQVFxWEZiRHVKL3lxWmhPSktyM3dMTzIxWXdhZU4xYnpCWXlBQjZo?=
 =?utf-8?B?eEcvRE51L0NZSDlwalpMMmNHSENTeEpadmE5UWJ3dWM3V3ByS0Z5RUFjSnc5?=
 =?utf-8?B?ejlMVGZHVUR1WXNzNHJXMG9UbHZ5bTZ6eGpQQWtNYjE3VXVhZlJyem9RbWRz?=
 =?utf-8?B?V0M0THV6MWFZTkFYZ0dISXBJQ2QydS92d21zdzVBMmZ6SmJMZnFHUWt4emRW?=
 =?utf-8?B?b09sY0kzWW9pQU5xWHJ2aFJWVUR3VGVDVHpLUk5sVy9aUmZ1cnlQWHJrTmdo?=
 =?utf-8?B?OEMyakcxd3MrbkdDQ2liS2lCYTNiTGVYNXc1OUZoeTFYczgwSmpNVVNSYTht?=
 =?utf-8?B?dzgyQmV2SldjenEvSWNsb0t1emlab0pSaXFpeHBZU0F3K3NYY3FGc1dwak1F?=
 =?utf-8?B?bUlCdmdwdThpU3NsWjRINUZ6N09lVTh3QmttTll3SExsaC9yaE0wQlFtYXZx?=
 =?utf-8?B?WDVMUE5wc3RrZ2JSNnBrL1pwK3FHZldxTzZGZkR0a1pIMWIxdSt1elVyNmpR?=
 =?utf-8?B?UFpoRjVXdW9rZkFOWDZLeG0vTmlGVENjYTRmSDlBMjF0NzliQXI5emZxM2Zw?=
 =?utf-8?B?R0s3anJSanhvTjgvajQ1Mm56UGxyRDNYMTVwVlJJd0FTbWRrbUxKTXhLVFhv?=
 =?utf-8?B?ZzlHTGluTE5hWVFtMTlOcnpBWnlWMWZ1ZERkeFJBR2hlZWFFZXRmVG5pdjFh?=
 =?utf-8?B?RTIyVjF1cFZGYXNEUmtNb2kycWRPZXhiQWp1cm5YYTR0d3dZVmtkcXVyVDFv?=
 =?utf-8?B?aHJEWGN4akYyNmloaWtDWXJ1NGhFWHJwSTd6TWtuU0ZvMzRLeHJKc242cExM?=
 =?utf-8?B?SVdLZFRIanlkb3ZDbTRCTElMMXB1R29Lemc4ZDlXV2xVUUhpMXZPa3ZiKzVX?=
 =?utf-8?B?S2k1VFZBWm9ZYVdtM3BxaWNpV1M0Vy9ibFFPaTF3Y0VyZ3JLdGIvMThxUEd6?=
 =?utf-8?B?RmcveXZHT0c3VzFWUkZQVVlGOHBXcEpYN1NRNzNwZzN6U1VMbVNHc1ZFZk9a?=
 =?utf-8?B?NFZDdVFLNjk2TzJvY1JEc25uUlN6UEw0MkdTUUJFZCtsbTFpd0dKT3JId2pP?=
 =?utf-8?B?bEdtbWg2U01RcGl5aVEvMXJ2aUtoMjF1dW5MVWlNcDJmd0hsWXByLzF3VnVK?=
 =?utf-8?B?Wll2dzVPS3lBNDU2UWdiV09zR21ZZHo4TEQ1aFVueW91R1o4RWU2UC91di90?=
 =?utf-8?B?VG9WcldJcTdmb0xyQ1NRMGVBQi9rRnMxQ2dVSlJnZDRmODRnYStrOTA1VlJX?=
 =?utf-8?B?RHZtKys1WUpZRTlFR0lNdktSSTl4dUhQMmQwUGhGWVRpakdwc09HYVZYR2ZP?=
 =?utf-8?B?TW9xdFB1QW5MNUlWNUlpMWpFdUZQcUlpQ0VqV1MxY0ROQS9wYy9uMmwxVUR3?=
 =?utf-8?B?QVJUaThoTFNodzI4Q2V2Uk94NHhwVHl6SHBWQTlMTGoyZWtNN0ZuZHA2dzNK?=
 =?utf-8?B?MFlSQ1JGVlFLNlFPaHgrOVgvUjg3YjkvRktKWU9GL25uZnhqYUpjV2F6UDJh?=
 =?utf-8?B?RlA2VnhybjVyYUp1ekVsaFFoaFBjNUNBZ2twUWFFeFBCMXJmeml5cFVxNUp2?=
 =?utf-8?Q?CktAoKdKWn9tKIDhGTe6p76dN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41534e9f-ad38-45c5-3b5a-08da8fd1c004
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 06:33:46.0192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GHEf5ODZbLXKkt3BXzkIECMppEVWfSttsFT+vW7zvlzvTHx/YQeeq6BcATQLmSEij5ileRouDHKArvgmpDshw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8368

On 05.09.2022 09:08, Penny Zheng wrote:
> Hi jan 
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, August 17, 2022 6:05 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Wei Chen <Wei.Chen@arm.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
>> Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>;
>> Wei Liu <wl@xen.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v10 8/9] xen: retrieve reserved pages on
>> populate_physmap
>>
>> On 16.08.2022 04:36, Penny Zheng wrote:
>>> @@ -2867,6 +2854,61 @@ int __init acquire_domstatic_pages(struct
>>> domain *d, mfn_t smfn,
>>>
>>>      return 0;
>>>  }
>>> +
>>> +/*
>>> + * Acquire nr_mfns contiguous pages, starting at #smfn, of static
>>> +memory,
>>> + * then assign them to one specific domain #d.
>>> + */
>>> +int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>>> +                                   unsigned int nr_mfns, unsigned int
>>> +memflags) {
>>> +    struct page_info *pg;
>>> +
>>> +    ASSERT_ALLOC_CONTEXT();
>>> +
>>> +    pg = acquire_staticmem_pages(smfn, nr_mfns, memflags);
>>> +    if ( !pg )
>>> +        return -ENOENT;
>>> +
>>> +    if ( assign_domstatic_pages(d, pg, nr_mfns, memflags) )
>>> +        return -EINVAL;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/*
>>> + * Acquire a page from reserved page list(resv_page_list), when
>>> +populating
>>> + * memory for static domain on runtime.
>>> + */
>>> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
>>> +{
>>> +    struct page_info *page;
>>> +
>>> +    ASSERT_ALLOC_CONTEXT();
>>> +
>>> +    /* Acquire a page from reserved page list(resv_page_list). */
>>> +    spin_lock(&d->page_alloc_lock);
>>> +    page = page_list_remove_head(&d->resv_page_list);
>>> +    spin_unlock(&d->page_alloc_lock);
>>> +    if ( unlikely(!page) )
>>> +        return INVALID_MFN;
>>> +
>>> +    if ( !prepare_staticmem_pages(page, 1, memflags) )
>>> +        goto fail;
>>> +
>>> +    if ( assign_domstatic_pages(d, page, 1, memflags) )
>>> +        goto fail_assign;
>>> +
>>> +    return page_to_mfn(page);
>>> +
>>> + fail_assign:
>>> +    free_staticmem_pages(page, 1, memflags & MEMF_no_scrub);
>>
>> Doesn't this need to be !(memflags & MEMF_no_scrub)? And then - with
> 
> I got a bit confused about this flag MEMF_no_scrub, does it mean no need
> to scrub? 

Yes, as its name says.

> Since I saw that in alloc_domheap_pages(...)
>     if ( assign_page(pg, order, d, memflags) )
>     {
>         free_heap_pages(pg, order, memflags & MEMF_no_scrub);
>         return NULL;
>     }
> It doesn't contain exclamation mark too...

Hmm, you're right - on these error paths the scrubbing is needed if
the page wasn't previously scrubbed, as part of the set of pages may
have been transiently exposed to the guest (and by guessing it may
have been able to actually access the pages; I'm inclined to say it's
its own fault though if that way information is being leaked).

But ...

>> assignment having failed and with it being just a single page we're talking
>> about, the page was not exposed to the guest at any point afaict. So I don't
>> see the need for scrubbing in the first place.

while my comment wasn't really correct, as said - you don't need any
scrubbing here at all, I think.

Jan

