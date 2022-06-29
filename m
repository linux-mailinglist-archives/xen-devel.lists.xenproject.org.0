Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 512AD55F66B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 08:19:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357553.586171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6R2f-00082m-RQ; Wed, 29 Jun 2022 06:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357553.586171; Wed, 29 Jun 2022 06:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6R2f-00080R-O8; Wed, 29 Jun 2022 06:19:13 +0000
Received: by outflank-mailman (input) for mailman id 357553;
 Wed, 29 Jun 2022 06:19:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NFaf=XE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6R2e-00080L-0I
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 06:19:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63809c83-f773-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 08:19:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6772.eurprd04.prod.outlook.com (2603:10a6:208:188::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 06:19:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 06:19:08 +0000
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
X-Inumbo-ID: 63809c83-f773-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Av1wnYBuepFT5CvvIAMsFPWT8pno5A2LBc2Ioi6B1tnKuEcx5q6MIPOOIHHL4j5v8szb4byuDE6pdkY/sBtDcuCKPmZTiEcZIzHEiaYlKSxEo9Rcp4+DvF7OHsf4B/GyjoYCchKWKQ7V7au2G9NZSsQPkZdmXIBObRf+Vn3S7Kj14pHw0XAOSnCkI2DzedyFs0aqm7zTTovXYhshsiRt3lU9tsXULsrtpy0FMPn/GKm9pjpb/9suhBBz7G70dMZANr+5F/uIClM2b8y8ElbHV0meGyfnXAKqy/eRez7SDj7po38CskAJaVavgFQtWGsfWoKsYANhwzYblDrJIELHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzkFdjR0q1QDQClsBvEwo+30DWf9JqVf5Be/ROD0dXk=;
 b=Wh9rqgv4byzTQNGTYpceh6telQ9/JnTFQgEgedu/KrcJceySX1WiCp9igdgNdbi/zT7/aW3ssu+0QS1DaZxWRm58kEH6KZfZgwiIwSHxGPErKhgpapo+fnFq8ZvVkZ7XaCH6V77Wt/cXg9EIJSX/i+tGjsq47UOxjYpZur05Mh8t5bQFJs/VazZy+n4KzCQqs3uVdfL6MShcA9XqTiVmw8afkqF0ueeMvf5yyRjCXqHcCmHqmElrO768vFfSJjUGa4GII8rLe87v1KamcveLU1CHB/d/GOotz7lOjUMSRsr7Uqjv23CgfedadoQKve/nNpbPWVmbri+GdqIYyVzDXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzkFdjR0q1QDQClsBvEwo+30DWf9JqVf5Be/ROD0dXk=;
 b=zmmtQfp+wqut3sdJTwASN5SyQEkTnNOWI9C/urNoeo7zIKsxDQvbBq4qKKtYcbaAHF2LNU2IYSed56Et+l//jgqfEBHNjrbqCPO07QpMobMR2z17lduXPjC/ZS2/OlUnH75j55D403XT8d1+/WO0SWp15UBfyRF+dT39b8eE8jtVkRCfopZxd4lTM7Qs6zUwYPOITyLGA3iw3DxYR+sRykA2SH9CEEdJ9XueQapLm36TO/ITKEa61A8YetInwiTMqYvH4MvPfHnlD01SsLqq5s2rShblV12dljK2SGtM/S7u9FsCVNIkU3CWuZ8ddmznocyY+2gcXcfrHE9NKSjE9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d7aa075-faa0-732f-44ad-3984dcb86e08@suse.com>
Date: Wed, 29 Jun 2022 08:19:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-8-Penny.Zheng@arm.com>
 <5ac0e46d-2100-331e-b4d2-8fc715973b71@suse.com>
 <DU2PR08MB73255B2995B4692B5D46252FF7B99@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <380b2610-fe2f-6246-e6a4-f0dd8295d488@xen.org>
 <DU2PR08MB732507EFB0CC4FEAA4872B3AF7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <6cfca3ce-219e-f9e4-e30c-40d7a74ea523@suse.com>
 <DU2PR08MB7325B9C7AC3441780E7AEB78F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB7325B9C7AC3441780E7AEB78F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58466941-5911-4e82-bcf9-08da59974641
X-MS-TrafficTypeDiagnostic: AM0PR04MB6772:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9QtdPTQ5JdcFU9sy5VKys0Zr/w37rFQhJsrVraiQukg2JRetyWBypBZC3pUTGD0qmJUA4vLt6/I+o3ec6bp+Cx2oc57E+ZmRTpqD2mIVbo7sJZIm8/E1sR+nHXR5Z3pDVYMW9K9QYEtwR2RLN+RrMQWIXz5Q+iAYerRlWNz0JxDOTJJjeFuuxtAF4g4GbcG7ueU/v9US5TS33NiF293iz7uAC7F84Kk/PLar3t5xG7fv1chxXsC9wFmowndi3feRea7Lm88d6XzBQYen18vWoejT9vSky+BPkjfdHL/tZ+NO2Ke2nOHslJ/xmvEq0GkMz2gk+TSS9oSNeBfn2uFF9hz2yam+NOcs/BzSbb6s1A7vC5H6DOskFXDx8/k84A7wv06Km2YU1hfFFpJ+mZzh4KcF6LoSQKCEu4fgObR0BjMRYWeoj6dcxJxHPlx2/g0GhBmQqFFZjtjHxuDwkK6SWz4zMobqgzNqFgTUqg5epf+Y2s6USOskGVyLkP8Ld8MIjF1e3JqJji750bRXIWf2wTim1RzLblsa37MlyyWhNDs1SuxRu5OXdwGRWEr4Ue0czZ4BOXKek7YsRfqGvra9ukTqi+dt2QLm+7dTOiw5uL6PHX92oFOPOM9TfwxN1rOrNIg7r1jmvxg5khT0+Vht3qnIxNRaLIP25xm6CGB1+GzybxifyQ1o1+Y7m9abfyijmO++c+zvZyMUULz2PfwB7kymoluwatMkULQHpUMovtIkydOouSU1ZOpCyq7MgfYE/ky3XS4qPpdxIc5P2bKJ95mDGiQoutOvM/QGa1BRLMXtekOgLx4god/P7dt2361XwvrOopeiDuAN937tFU8BSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(376002)(346002)(136003)(366004)(66946007)(186003)(38100700002)(316002)(66556008)(83380400001)(86362001)(31696002)(6862004)(36756003)(2906002)(6486002)(4326008)(66476007)(31686004)(54906003)(8676002)(5660300002)(26005)(53546011)(478600001)(6512007)(6506007)(8936002)(2616005)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUpwOXZaUGg1cFRxRXRZL3BUaGdRN3A3aEI4NDBWT0JETi9GSWp2VTRlb0s1?=
 =?utf-8?B?MG9Wbi9DNW1vVVB3WGdxYVpNblpnMUFmOU1mRW5MT09qYi96UEJHRW1zd1JJ?=
 =?utf-8?B?bjVpaG1oK0lXdWFCa3BldmM5eUo0VElQakpraVpjdTlpOFpGM0d5bnRuWWJa?=
 =?utf-8?B?SW9XbGMvK2VGZ1JZUzZEZ0NjT2xjL0k4Q0MyaWlTeDJkVjMxektUaHpEZnlm?=
 =?utf-8?B?TDNPaHZ5ZUc3K0dYQVhBdWRYcEh4cnJuVGdFRVR2NWRiM1hQQUU4T2xrV1Av?=
 =?utf-8?B?ejZ1OG9YY2xBRWwvbHFBYXM2WnhjU0JDRitwVGwvMU5JamZ4S2dXZkxxL1pU?=
 =?utf-8?B?eEc0RktPOWF5Z2VVUTZJVUFRWEFybXo3N2J2K3Boem1FVSs4OEkyMFo5bVpi?=
 =?utf-8?B?M2pIay95alN4Qm50UE5pWkZXUnNlYlovQzZ2Yk1UUWpIeUdtblVCdUt2Y05F?=
 =?utf-8?B?d1Z5M3BzMGsrTm5LL1dqYk5FdExaWFg5THduejhYNzMzUkpOVkk5aXBUeHpz?=
 =?utf-8?B?UEhjZmYxWlVRSUNaSVA4NFJveS9neFBlZVZnK2JwTTZ1dlJTYVhhOE5ONlpC?=
 =?utf-8?B?bnVoTk1BdEJDTmVqa29XS0RCSHNyZm10NlF6MFRucnpGVVJRbDNDMVhvQStR?=
 =?utf-8?B?ekh1TG1Vek43dUpnL2tsODRicjdkdkd6emVXSXRWeE5SdzJlRFpBTXl2djNN?=
 =?utf-8?B?TFNrTFJkV1B0QUxTQ3g3TVhmZTJWcWdWR1hocE5HUk9xRFBVOVlpMkdXMjBN?=
 =?utf-8?B?SHQySXQrc2FFM2VIMld2N3JWbGFCdGhXeEpDeC9icG5xRFFxZmlBWVI1a1dq?=
 =?utf-8?B?MFFFR0NRMXpWOTVrbnBjVEJsOTFXRWcrS3VRVkRWQlFhcDNBNVduWkpZTExj?=
 =?utf-8?B?ODQ3Y2F4azVON3VRTUNITWV1aVZnSVBneVcwZUNrd1hBTG8vZVdNQVZ1QW5K?=
 =?utf-8?B?TWFsMXdnYjVCVzdveW1uVGg2Z2lUQk9sdHJod0c4dVNLdjVqQnI0RDVXWjV3?=
 =?utf-8?B?OGRyRHNIUEpLUW42OHBpcW1EYVlvemg3SXZ5OXZ1SndUK1VUTE5sZUtnQkRo?=
 =?utf-8?B?L2ZQTXVDMktHeHJLTXE4cXJqN3F3NGVEdzI0bjF5YnhnSjNTZEppOVFCS25W?=
 =?utf-8?B?cEFpL0YxSDFvdEVKTklJY3lhbHhsYUtuQ2pYcDBVVm5DVWk0RHVHTmx4Y0tC?=
 =?utf-8?B?ZWhwYzd2Ym9IcFMycG01bjE2RzhLU1dyV3NGanIrWmFsUlJRWkZ0UWlIdFB4?=
 =?utf-8?B?cURyK2dFM1dja0ZpQWY4bzhOand2U3Q0R3IxOUJWSzk1S1k4MnpmV1Z1Z2Vu?=
 =?utf-8?B?ZTJ5LytjdE5kVWJGSVBIME8zeG9VMU5hTlhDclhwWGNOS25iRVpLbFJZTW44?=
 =?utf-8?B?RERRRzRYOXk5T29KY1Y4eHB6aVRzVm93aFJGQ1hZMGgxZm1UQTN3MkFyUGxN?=
 =?utf-8?B?QmhXd3p5MzM1N0JSVUVaVW4zM3JYeGtrcnBPZUxnVXpiZk5YTVRheEJUY1li?=
 =?utf-8?B?SFdYN2k1d01RNndMMTRMRittcGFtTlVqd21sTEorWTV6ZE9jOGg4RG95ZC9i?=
 =?utf-8?B?UWpXeWVVNkhwbDFzQUV2WjluTm1zRTlYSUp6N2JjcUQ0RDVSQlVabkQ4dHdo?=
 =?utf-8?B?MHd1cG9rQXR6UlRRQUk0R2JjbjYrQ3FiVWN6cXMvb3Q4Q25nbXpXejRxNk1T?=
 =?utf-8?B?QlY5b0wrZTBrMnkyQmZLV25ScC91RzJGNTV6OUJSYngraVhneGdRMGUvNVZF?=
 =?utf-8?B?VG1JbVZsTlFUNXJRMXJTUENCOXlCUVp3aUVqbTF3OWd6cUZja1ZFMnBnTGUx?=
 =?utf-8?B?QnFLY1BEaXlRc2ZZUmI4N0xPbUdOM082cjFaQ21wbVh0OGN5VjRRa1JmbmNh?=
 =?utf-8?B?WTlnZktNME1yeVl2L0dnM1VXTXBVeEI5YVZXMGMvekxIdCtwZUhtUllDVHpu?=
 =?utf-8?B?a1R1U3FkU0ZFbmZScUM3ZnduQlFMMnA0SndxTkpJR254SmJoS1V1ZWVaNlNW?=
 =?utf-8?B?MFVCY3BMZEdGYUQrczFIRm8zZDI2bktNSXhyNHNwRWp5dXMxcXFrVHFGNjQ0?=
 =?utf-8?B?Tk41TlFUSGJnbTV6K0hUb2dkemFHVmtRaG83R2hsUVRFaFNPUk5QMjQvYmxx?=
 =?utf-8?Q?zeR8962eUlNxo87y6f3/1SFJd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58466941-5911-4e82-bcf9-08da59974641
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 06:19:08.1399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VgGebjfp5JHKMQllF9aic7GQnq6ujU8UySYcbKD9BhtzqXmuBQovtr9zBiQ8R4ozmns4o8DEPjfYAvMRNqy9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6772

On 29.06.2022 08:08, Penny Zheng wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, June 29, 2022 1:56 PM
>>
>> On 29.06.2022 05:12, Penny Zheng wrote:
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: Monday, June 27, 2022 6:19 PM
>>>>
>>>> On 27/06/2022 11:03, Penny Zheng wrote:
>>>>>> -----Original Message-----
>>>>> put_static_pages, that is, adding pages to the reserved list, is
>>>>> only for freeing static pages on runtime. In static page
>>>>> initialization stage, I also use free_statimem_pages, and in which
>>>>> stage, I think the domain has not been constructed at all. So I
>>>>> prefer the freeing of staticmem pages is split into two parts:
>>>>> free_staticmem_pages and put_static_pages
>>>>
>>>> AFAIU, all the pages would have to be allocated via
>>>> acquire_domstatic_pages(). This call requires the domain to be
>>>> allocated and setup for handling memory.
>>>>
>>>> Therefore, I think the split is unnecessary. This would also have the
>>>> advantage to remove one loop. Admittly, this is not important when
>>>> the order 0, but it would become a problem for larger order (you may
>>>> have to pull the struct page_info multiple time in the cache).
>>>>
>>>
>>> How about this:
>>> I create a new func free_domstatic_page, and it will be like:
>>> "
>>> static void free_domstatic_page(struct domain *d, struct page_info
>>> *page) {
>>>     unsigned int i;
>>>     bool need_scrub;
>>>
>>>     /* NB. May recursively lock from relinquish_memory(). */
>>>     spin_lock_recursive(&d->page_alloc_lock);
>>>
>>>     arch_free_heap_page(d, page);
>>>
>>>     /*
>>>      * Normally we expect a domain to clear pages before freeing them,
>>>      * if it cares about the secrecy of their contents. However, after
>>>      * a domain has died we assume responsibility for erasure. We do
>>>      * scrub regardless if option scrub_domheap is set.
>>>      */
>>>     need_scrub = d->is_dying || scrub_debug || opt_scrub_domheap;
>>>
>>>     free_staticmem_pages(page, 1, need_scrub);
>>>
>>>     /* Add page on the resv_page_list *after* it has been freed. */
>>>     put_static_page(d, page);
>>>
>>>     drop_dom_ref = !domain_adjust_tot_pages(d, -1);
>>>
>>>     spin_unlock_recursive(&d->page_alloc_lock);
>>>
>>>     if ( drop_dom_ref )
>>>         put_domain(d);
>>> }
>>> "
>>>
>>> In free_domheap_pages, we just call free_domstatic_page:
>>>
>>> "
>>> @@ -2430,6 +2430,9 @@ void free_domheap_pages(struct page_info *pg,
>>> unsigned int order)
>>>
>>>      ASSERT_ALLOC_CONTEXT();
>>>
>>> +    if ( unlikely(pg->count_info & PGC_static) )
>>> +        return free_domstatic_page(d, pg);
>>> +
>>>      if ( unlikely(is_xen_heap_page(pg)) )
>>>      {
>>>          /* NB. May recursively lock from relinquish_memory(). */ @@
>>> -2673,6 +2676,38 @@ void free_staticmem_pages(struct page_info *pg,
>>> unsigned long nr_mfns, "
>>>
>>> Then the split could be avoided and we could save the loop as much as
>> possible.
>>> Any suggestion?
>>
>> Looks reasonable at the first glance (will need to see it in proper context for a
>> final opinion), provided e.g. Xen heap pages can never be static.
> 
> If you don't prefer let free_domheap_pages to call free_domstatic_page, then, maybe
> the if-array should happen at put_page
> "
> @@ -1622,6 +1622,8 @@ void put_page(struct page_info *page)
> 
>      if ( unlikely((nx & PGC_count_mask) == 0) )
>      {
> +        if ( unlikely(page->count_info & PGC_static) )
> +            free_domstatic_page(page);
>          free_domheap_page(page);
>      }
>  }
> "
> Wdyt now?

Personally I'd prefer this variant, but we'll have to see what Julien or
the other Arm maintainers think.

Jan

