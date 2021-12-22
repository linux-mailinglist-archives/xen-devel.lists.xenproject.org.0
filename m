Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A679A47D176
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 13:06:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250801.431924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n00NN-0004Px-4q; Wed, 22 Dec 2021 12:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250801.431924; Wed, 22 Dec 2021 12:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n00NN-0004NU-1M; Wed, 22 Dec 2021 12:05:45 +0000
Received: by outflank-mailman (input) for mailman id 250801;
 Wed, 22 Dec 2021 12:05:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rzrJ=RH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n00NM-0004NO-2G
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 12:05:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c6231ef-631f-11ec-9e60-abaf8a552007;
 Wed, 22 Dec 2021 13:05:42 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-4cinuzS4NoORWXwheNViSA-1; Wed, 22 Dec 2021 13:05:40 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6628.eurprd04.prod.outlook.com (2603:10a6:208:179::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 12:05:38 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015%7]) with mapi id 15.20.4801.023; Wed, 22 Dec 2021
 12:05:38 +0000
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
X-Inumbo-ID: 7c6231ef-631f-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640174742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HwMcSmV19B1m8QXhRgcO2bQOySSqYOUjEbOWA4hFEsY=;
	b=KY8lyyD0Qb/eZxHMxJHXMJkSJlTSL3/vMT8WhxgMt0F+5mAjRgcMiGkYbrDC8RpbNxTgzd
	RwVs4YxJPfiLvBU0gfWqVYfTiiXDBIFzsZVI+UFfq4bStBy7o7qW/D+8+tNX+wBUiNyQJf
	3mplsvxYLTC91A5uw8l2bW/KrDgWw5w=
X-MC-Unique: 4cinuzS4NoORWXwheNViSA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Npvo6ZGaa7AyRK9etBy6cipXdNxASv9DWem8r3o3gm5d+krc+5MBeJuiXYCkXf68IT/dPLwHu0K7gaN0wlib56RkLKvXjVWewCBBTqTVLrpmF0jT9gI3wn0x853fg/PUHvAmztbYsKwdI+79tMPSDNl3Sh+2Zc5dFHJZSpekb/tth0+ou0tOc4gvSN+g4WnfuezlFlpwLatxFGJduTHuohxD97IGcVOOleY59xorxkFsDHY5ofKfEOz9uBA51xyYQEV6wZJru+eXoPWrzh1zKOKzkFJE0lN3dZcCrGDogrjq6X5VAp1EdnCi2V3mJSQn/Z1pTb6msFWODoAG4bSKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwMcSmV19B1m8QXhRgcO2bQOySSqYOUjEbOWA4hFEsY=;
 b=UkydPoGY5vuEht/MtW3orMoyFfg4NGiVy/BcJvMqlRcAhnU8LV1YkDX/ABSAyTWIuz/QQr7Ebo9WHv/iSAwultezJElDmQtVjF973X2SgW4vmPJA0kig3icPZTkU0jvtYfmkXdB3CD2iaazb4SBpmRnpXLoYdpDRaJx8KjdXIGdsWvExIk1sQ89BxUrUOysUqFbrXEYxCZ2XAnTu8bn9Mr+vz8OUU2X6ibk+Dxct9cLvZASDQJoZaE8ak0baJHuaZULz/2FvusRrfF1yVuTuYLFr0wbk7lom6FO6zwCINoxKigDL85pcpCq425ewFjAVX9TfFGjWV63bUzDdfWtZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <57616176-938b-2125-fe34-4fadf2b4f816@suse.com>
Date: Wed, 22 Dec 2021 13:05:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
 <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
 <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
 <c1c043b1-bffd-f758-f7b0-fd08539550a5@suse.com>
 <f8ac8922-0695-7666-8585-92a089164e44@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f8ac8922-0695-7666-8585-92a089164e44@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0069.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::14) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeb5f5a8-cc85-429f-cf42-08d9c5435e19
X-MS-TrafficTypeDiagnostic: AM0PR04MB6628:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB662801EC06D345DB8A0C41BCB37D9@AM0PR04MB6628.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1/R3eDmHTKUab+Z/Qzv7saGRFMbKKKp8tJ9+rjCzlB97515UxrvS/XaJIjWBZTkwA00WgFocVePxG1UwNz88Ous3Ixg2C4VktDdsUVp7HNDA9NmxH1l59L3K6qtb2aYLE7Puj3F65IQr44rAGlYY+84Ay0J3pD6B1ADb+a1Xmz+CJebagZXTAUrrHuNiRkDfL6cgG32qldR+lEjZabFwScq5unb3CnG3nwKeCNJq+MjLikQxC5Q/jxjvuk4bJJCElu4fZge4xQVcuVJwt+M0lh7P1NTxhd+3zCEPKJigxpRYcarlZEQ5GGkMNXfLyPeg6VZMzEE5WwD/zZGkKN7F6oTrRPa0tVGchzEz0ZEWuDqvm9MAs2ukw0LgQ/xiUHSFY2mQZHxfOUFFJMCaLuAqtmfVkXTGYYVNRHTXx7+P/YmJFKKWf8eAaZ0E/8s5r2eTrYletUblPr1j8lIqNj05O9qdV3w3v7hc3fTXr8JK1NO+Xzmpf4/y/7jeU70k1ogt22kli52BakU3F/vHP/5a/ebOY3HkG2gyrQKYz6my0xs+zidvhhCM79nuLyzO01oEl7sAygb772/0Ple0+2H/+yHSi03Ig6wXC1CjacM5ejFZQMQESXKwn7bn6RGa5lW0wJajSMGRdM37q5+8vcNX5wecmdBv3TwLOT4wNCVqUc1m8BbWvBoRlTAX2HPNyPwSWOFvICMfwhWP5btEERXBuJWksZujbn3jTQrqbIVabWQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(86362001)(31686004)(5660300002)(83380400001)(66946007)(36756003)(38100700002)(54906003)(66476007)(66556008)(6512007)(6486002)(26005)(4326008)(53546011)(2906002)(110136005)(508600001)(6506007)(8676002)(8936002)(186003)(31696002)(316002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0RLQ09BamZvNkoxcUptczNJZXlWUWhTcjUweGl1V0Z6ZTFwNlpKK0VsNEN5?=
 =?utf-8?B?Y2hYcnVHU1JhcHROTDkxUU9mYWw3Vks0V3FiT2E5MklVWkdoYzdCRDB2dE5H?=
 =?utf-8?B?YjZmTFRicldEVkgxb2VFQXZza0c3dEFKa3lLN1JlV2NyRFR2Tys2VFdTSEJI?=
 =?utf-8?B?MGJDZ3o3bEt1UWFhcU91RzlINHk3anFVUGZwak5OVUpYanREM3VBejdkdzBT?=
 =?utf-8?B?WUZHczY5NGd4R1BZVHpoalhvRXZUcS9RbDd1WmgvWnpacU55L2V6bXFsZTJu?=
 =?utf-8?B?ditPblNaejZtcGplK3hTck40ekdVN0toRjVkU1VJclJDR3pKdjZZdkpua0Rj?=
 =?utf-8?B?OTZYUzdreTNQOWY4NUI0OVV4VlFuNmNRQzUydlBUdjgrR2ZEdkRFNkNISE1X?=
 =?utf-8?B?WnFib0JIODFlQW9ROCtObVhSZktIRDFzaVdWZDNURlRkNCtYSldWWE05eU54?=
 =?utf-8?B?QmxGbXlOUmxabGhnTjhCWTlCZVYvajhxSXM2Ty9aYnRjYzNrb0JVRzh6bGZ6?=
 =?utf-8?B?U1daTWxRRnExY2xQenJlcnlBanRJTDVFQytoa01XLzIvUFVKSnFodFVzR3Ju?=
 =?utf-8?B?TlNHWXNhSEEzMTZhbGd0SGUydkhERkZiOXpZbEcrZEZNUnpmUjlpRjJSWnk0?=
 =?utf-8?B?bFRHek0ySXdOdzNBdGhnSjBwdzRFRndzUkx2UWZYSVllK0M5MWhTcCtYSDNk?=
 =?utf-8?B?TlBDY1FjWnNNYmZkWkU3Z2E0VS9oNHhhSExrcVAwbXJETndMdDF0aG91R1Bk?=
 =?utf-8?B?cDVoWHZhemYvTmowSW96M3pYZGZUdXNyWkszRzcyWHVWQXZYcmRZcDlFc1p0?=
 =?utf-8?B?d2JlUXUvNjcvYXU2L0VaY1kybnphNlZDOE5wdC9vbVpvbUYxWmlZcmhwRlNo?=
 =?utf-8?B?bjY2NWpzdllsVU1sNmQ0M1JyZ0E2WGxYTVZRN2Rzb0ZySUJ1eUFkREJrY3pF?=
 =?utf-8?B?Y0ZlaElzckVLYXhPUkd0dE4vdFJqMDFjc2ZQSm15RUFIL0tRa29MdFc5OU9O?=
 =?utf-8?B?TlN3UjdWNlRMYW85ZEFhdVlmRllmWTFzc05QTDdCTXZtbzFEU1dUZTFPbzR4?=
 =?utf-8?B?VlBsZUpWZENQUVNqTG4rR0ZwaHlNRHV4YnZEbEZVdlpRREJjMmNjbVUydTV3?=
 =?utf-8?B?VzdsTW5ZQkJzSmNSYTgxYUVBM0FwZEtTTnpCL01ZeWZWSmVkdzdRc21TK3Nk?=
 =?utf-8?B?YVlVSksxdDcwQ2ovQjY5eFRPeG9jc05saE0veWtRS1dYVkZEN0dOVy9ndnBa?=
 =?utf-8?B?Qy9FM09EWTd5Tm5MZTZIYzBJK0FtZk16ME1CbHhmNVI4TlF0MlhRcmZYaFpH?=
 =?utf-8?B?RXdnVGxSamVZRWhYMlVGNEpJVDhCMmlGYmg5M2Q4RHpTd21EdWZmT3FkNW82?=
 =?utf-8?B?UTAvVFBXbENYTjZEQjltdWVSSVZEUXF5WDNTY3YzOG1BUFBoNi9iY0JNQkZs?=
 =?utf-8?B?aHNpNHNvYURlSUJJLzRSd3U5R3ZqOGJVZHhMM3ExWXFISmlyY1pXc0VCSlFj?=
 =?utf-8?B?RzhGSjZuQlR1T2t1RnVac01IcXdaNnBjNVdFZjFSTXRMdzRxVG5GeVpzbGVE?=
 =?utf-8?B?V1g0dTZUOVU3eUxLQzM4YmZDd3hUOGhBQkNpSXY0YXhVaHVZT3VMT1F6SS8x?=
 =?utf-8?B?dmRQYkNsNWdGQW1xZnBsQVJHTEtYR0hxQUk5S0pMZTJwOHNUY0ZFcjVjUGt2?=
 =?utf-8?B?d0IvZTBpN1JuYmxWUi9iVlltRk9ZbUUwbTB2VzdFSzR0Um9Ld3Z1alA0Qm15?=
 =?utf-8?B?T1lWbHNQd0NGZWJ2OUdoRlB2M2ZWMHE0dFhWcXJBcXhhRjZVMHZrbGMxMExx?=
 =?utf-8?B?RTV5NFVHK2JWVFgxeWZoWGV5eEJtVmFaL1h0RGhRZlp2cVdkOXNES1R4NVZt?=
 =?utf-8?B?cDRMMm9xTkJHMjhMREd0WWFIMVY1OGRUQ1BCdGJzdXNhNTFLc293S0NJbXRs?=
 =?utf-8?B?VnNkeERaR0tnZ1lnaVRhd0Z4cHBNenBVdXp2aFNUdzNGOHpLTVFqTHFSSmpy?=
 =?utf-8?B?Ymx4WTU5NXY2aFFEZEFXN3U3eEpqNG1pcWU3Y3RPR0lBZDUyVEpyRkVnUnhM?=
 =?utf-8?B?WFRpQnM3NXhpWTRRZGxpRzFJTnkxUXFmdWRYMGxBdThJWnR3TlhkeWhyaFFu?=
 =?utf-8?B?alQ0SE5HQzhNT0JhMVhwK2dMS21raGJOQ2t4OXVMNVhDTXZ0Z1IyQVdLMnM0?=
 =?utf-8?Q?7CHg8N0dp5xmqXI1y6TSxv0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb5f5a8-cc85-429f-cf42-08d9c5435e19
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 12:05:38.6865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alcTZe3DSckl7oY1hfBWu26/+PbmTGNcZ+jNqZbNTnUAdPbkIYnKlj2J2XO7yokbjAMiKI70dQmRgpyhebXemg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6628

On 22.12.2021 11:01, Julien Grall wrote:
> On 14/12/2021 17:45, Jan Beulich wrote:
>> On 14.12.2021 17:26, Oleksandr wrote:
>>> On 14.12.21 15:37, Jan Beulich wrote:
>>>> On 03.12.2021 21:33, Oleksandr Tyshchenko wrote:
>>>>> @@ -2177,14 +2181,22 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>>>>>    
>>>>>    void free_xenheap_pages(void *v, unsigned int order)
>>>>>    {
>>>>> +    struct page_info *pg;
>>>>> +    unsigned int i;
>>>>> +
>>>>>        ASSERT(!in_irq());
>>>>>    
>>>>>        if ( v == NULL )
>>>>>            return;
>>>>>    
>>>>> +    pg = virt_to_page(v);
>>>>> +
>>>>>        memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
>>>> ... this really want to (logically) move into the new arch hooks.
>>>> That'll effectively mean to simply drop the Arm stubs afaict (and I
>>>> notice there's some dead code there on x86, which I guess I'll make
>>>> a patch to clean up). But first of all this suggests that you want
>>>> to call the hooks with base page and order, putting the loops there.
>>>
>>> I see your point and agree ... However I see the on-list patches that
>>> remove common memguard_* invocations and x86 bits.
>>> So I assume, this request is not actual anymore, or I still need to pass
>>> an order to new arch hooks? Please clarify.
>>
>> Well, that patch (really just the Arm one) effectively takes care of
>> part of what I did say above. Irrespective I continue to think that
>> the hook should take a (page,order) tuple instead of getting invoked
>> once for every order-0 page. And the hook invocations should be placed
>> such that they could fulfill the (being removed) memguard function
>> (iirc that was already the case, at least mostly).
> 
> IIUC your suggestion, with your approach, alloc_xenheap_pages() would 
> look like:
> 
>       for ( i = 0; i < (1u << order); i++ )
>           pg[i].count_info |= PGC_xen_heap;
> 
>       arch_alloc_xenheap_pages(pg, 1U << order);

Like Oleksandr said, the 2nd argument would be just "order".

> The Arm implementation for arch_alloc_xenheap_pages() would also contain 
> a loop.
> 
> This could turn out to be quite expensive with large allocation (1GB 
> allocation would require 16MB of cache) because the cache may not have 
> enough space contain all the pages of that range. So you would have to 
> pull twice the page_info in the cache.

Hmm, that's a fair point. I assume you realize that a similar issue of
higher overhead would occur when using your approach, and when some
memguard-like thing was to reappear: Such mapping operations typically
are more efficient when done on a larger range. Since that's only a
hypothetical use at this point, I'm willing to accept your preference.
I'd like us to consider one more aspect though: All you need on Arm is
the setting of the exact same bits to the exact same pattern for every
struct page_info involved. Can't we simply have an arch hook returning
that pattern, for generic code to then OR it in alongside PGC_xen_heap?

Jan


