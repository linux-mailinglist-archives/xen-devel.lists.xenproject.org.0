Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2995839B9C6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 15:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136846.253602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp9nB-0000Pl-IM; Fri, 04 Jun 2021 13:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136846.253602; Fri, 04 Jun 2021 13:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp9nB-0000NV-Ei; Fri, 04 Jun 2021 13:23:17 +0000
Received: by outflank-mailman (input) for mailman id 136846;
 Fri, 04 Jun 2021 13:23:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e0/s=K6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lp9n9-0000NP-E9
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 13:23:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e42a00f4-cb8a-4edc-bd3d-e65553c5e5c0;
 Fri, 04 Jun 2021 13:23:14 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-_SaINpyQNyeQ9zaA2B6QTg-2; Fri, 04 Jun 2021 15:23:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 13:23:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 13:23:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Fri, 4 Jun 2021 13:23:10 +0000
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
X-Inumbo-ID: e42a00f4-cb8a-4edc-bd3d-e65553c5e5c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1622812993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s6eHqYCXOWXBryVLpB90OwwJCuDcpY5PXTH/92MJ7XA=;
	b=GM9pZUoQdiKgePPz/fmBFXakampMbxfvnPpqd5KORd0Qlivyugg6To6QFyFCw+bqZWQdii
	R9oWV8mqSj6cuRV69nskvvXcnZ/zi28PTwLolKSHmT+XlIW/s6W+ZZ4QxPmU3IXfbUqnBb
	uJic1VrgFpKB3aS9nLikUAxMcdTiJak=
X-MC-Unique: _SaINpyQNyeQ9zaA2B6QTg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLPgPDlzMj1AaUWWpWPv1lzbBMuAABhAtq2hkvkmmDpsicv5gDREegyFg+dveTvUQ+5N9RJRbmZTvJ0AtQlDIjs4+1CPqZTFGtOXvCXSHrbrsNBbAXTFsgv4z7tM+WcRg1e8kb967kHCt2I3SOVxaZreCd782b0J6L1ImkqfzFWMxGlIUAJxCA0T3UTGnVgcU2Yw2L+HXo3Vpy6edYCQuBTEDLhSS7rnReMoKPN7mcx2BBaXV6h7xJim8N3S9WFBklR1Q+9mXfaH/xduisbapLQeCy/LNtersPK2j1a9NFPnFe4ygGaHKLApMaobTtKUJPiAKOt1keMAuh7NnDqPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6eHqYCXOWXBryVLpB90OwwJCuDcpY5PXTH/92MJ7XA=;
 b=E0ZWPYkzanD3N9bmOwQjeua5wouIrWskcp/iLbz/PIj9ghyrjrLJlkO17FqJYQN9x84XGfi8GuAYmDxJLcEFdJoDfp3mrq2VHk+4n+D9iHSfFb0q/gCG0DUxQlJrnDWmzAIMuMpPLPyjo0KhzWVXHLEYJq72OblV+VeXS6abgDaE8Bhle/MgFv+IX1xR70vMkRogNoYa+uhC1xk0D4Sf3KpSsIxSvZJpuBO+uN2HlWHF6NwYX3E7Lwr6XvipUpdlibzFvqFntsyKudGHdPcmNRRUV+9moyPcnRMK7NLzWHAkSgEoyIzBguEqF1PIODDP19zLA7J8HoMPhJOpDn6zzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 07/12] mm: allow page scrubbing routine(s) to be arch
 controlled
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <49c46d4d-4eaa-16a8-ccc8-c873b0b1d092@suse.com>
 <b1c10ad9-2cef-031d-39c2-8d2013b3e0b5@xen.org>
 <e805e525-f024-8b5f-3814-0c1346a227f8@suse.com>
 <ccdc7909-9ef2-470e-fefd-bc6523fcdf73@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <403746c0-1b36-f782-3f71-2a1cd129aa6e@suse.com>
Date: Fri, 4 Jun 2021 15:23:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <ccdc7909-9ef2-470e-fefd-bc6523fcdf73@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 084429e7-1419-4380-60b9-08d9275be646
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6864B3D820009F46DA05AFE4B33B9@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rZYpYp/ZsK0jBsiAONaNZ7eM9ZLDbQ6LWrQ3/1lqEPvaYYetVXorvIiCPGZvNdMPKbU0BV3HB4UupvuWW849K5XiupHxXthE+9d2box5RxLs0iYhz1fr5X3f+XGZcaPRLHROWNovNLH0j8mAImEt0vTeJhY/zKZ0JzDa7RzqqmTGnqZwKizEwEvCD1KhV6qicOdXf0zxn52HOIfL3r2CDClHq81/t9W37fbEbgwEa8H3/5Z9o9VJNs4e9kP96QRT0j8tPBiuPSGCrVH6/8b1wsky7WcgbmpD51jVPCSHfiqD41bTjfoO0XKQ44DTxKot5fODskV9ifHCC+rKmN41Ykowtq8oWaE/jt3SDah3N8QLZKwumfPrIvFrw4R70M2mPVUGSLq9kotEeJ3+AX7+mbzbjZSDDVQpe5NT1r0C2EoJPqTXe/Nu9bpPdtYcKPASyXt1ltUdxhlDz3IHTUUYtj0pMlrFotpT4ztjVF/9+PMZKlXtlT6k5dgD2LZRBmemB04GJXwpWqjxlRFj28udiFNtnNPeR+P2zp1WaaR7B1JmIcii1/WRuC5nivg+z/qutUfZaH4JRr21+W8SNoYbFi29Y4Wl3PVqSBj0fmu6XwfzE9sopmDXge4egXT9AwUkaRmEmr/dVv9E6gBXIkEqfSnVY+kv6naPOYmrqlENquhzyOYW8XfG7oft1Fp9OqTb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(346002)(366004)(136003)(31696002)(6486002)(83380400001)(6916009)(8676002)(16576012)(66476007)(66556008)(478600001)(2906002)(5660300002)(956004)(2616005)(36756003)(54906003)(316002)(53546011)(38100700002)(31686004)(26005)(4326008)(8936002)(16526019)(186003)(66946007)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?Q2x6RVRGcnRST1dScm0wYlB4UmROS3dMS0NDb0k0Y3o3RVdwbjhGSi80b25J?=
 =?utf-8?B?dEpCbm4veEFEdGs1L3pQZ1JaNTdUamt0b3QwSXJHMFpBTklGQjJoU1lNMGts?=
 =?utf-8?B?b2p3UGlSa0ttK2QwSHZQMEdaYzY0VjUvTHJPQzlVYlZKZk5LakxpWGZiYlJ5?=
 =?utf-8?B?RyswMHVtL09yWTUzenBqOHRpSG1oNUp1ZGlhQjVuRDJ6K01KekhWT2xyMHV6?=
 =?utf-8?B?K1BUNktYQkFYdUZkSVlsNDV0dEZlUGtINlUvbFZzTkZBV2FrRzJhUUNvajZn?=
 =?utf-8?B?RUo5N3Jqc1VlWkVHQi9MSkp1WkU5OE9mWVpZU3N6Mzg5eGpWQTJJZW10TkVM?=
 =?utf-8?B?dDIrQ2JuelRTYlg1SjhyVzN6eTY4QVYwdDNJY3Y2QUZ2NFFuNkxaYmtJVEgw?=
 =?utf-8?B?M25HV3B4ZjdkWlNKOGl0WWdGc0NRVVg5ZnZhSEg3N1padWdVaDlEWkowYmg0?=
 =?utf-8?B?S0dHZU51aGNycXNkNE1XZWtiSktNTlVXa1l1eTJ6YlVhcDg5SVlEVENqOW1L?=
 =?utf-8?B?L3ludmZYeW5FL2VuZ21ydXJjcENYWWhOTXFDRnRtZ3BiNmYyajJFSk13c1g0?=
 =?utf-8?B?RkYwRXViNXF3Rnc1Vm1pY3FYUmhnQjMvbFVvN1VRMGswUEZzVmE4S2tSQTFz?=
 =?utf-8?B?dEt4MURpdWVodERJOGEzTUVCM0pVMHRxNHdLNm9FakJReTh4NjZVTHNpamxJ?=
 =?utf-8?B?cnEreThiTkY5Uys0dU5OMXpVQTNMNm9VTFFXK1RITzJvdkJlQzJ6eTAzYkFI?=
 =?utf-8?B?VXdRcE5CbkliT3pSZU85V2ZjQjc3Yk82NGxaNWZmYkI5eFk0SHFxT0lmMmYx?=
 =?utf-8?B?VjhIMHBxZzduZHZreTRmaEl3V3lVVFpiTUFyemxoWXRMMG1hR012SEliYitD?=
 =?utf-8?B?b3BPdlR0eHdQd2ljV0ZtSkdWRmRqNmdTcTlES0hjdjFJN2NGanhoQys3QXY5?=
 =?utf-8?B?MUVRVVNMeXJwZndNS2cyQVBTeFdVcFYxU3VZK3N5R1l6bjVDZWNjL3NHSU05?=
 =?utf-8?B?TTNpeUxFU2dtemNJa0h6OFYyZmVndjR6OW9oeGZqbVVIVG95MDU0T3dJNHRv?=
 =?utf-8?B?dFdkNXpQaGo0bDBMVzJ2TXF3SFR1VjYwSFBPcTh3U05OYTBjbmFTM05vSHZO?=
 =?utf-8?B?STFZSHFYS05LY2R0ZG56YVYvWXRyRXREODRKQ1FsV0dtdVpRQXZOUFZ6L0gy?=
 =?utf-8?B?VnpnQzk0amNkU29KMksrUjJ1bHBLblZDMm5GZFBXRWJja293emhpOWhOeVJS?=
 =?utf-8?B?Mml4bGJCWXphODMyRHZuWkY0Zk1LWTBnVXU2Nm5IaFNJM2VzUlErczRMcitx?=
 =?utf-8?B?RGxpSDN0NDRZbUtqd1o0OXV0M0J6Ylh6am9GL0kzZlcxM0dOR09UU08vWnVV?=
 =?utf-8?B?NEFqNWtlME9wMkdIRDArd3lHT0NxNm9GV05GOWxpeDdiRDN0OE5vVUViZ2Jo?=
 =?utf-8?B?SkVJTGFnM1pWRlp4anQyZDlYNGNLVkpYQVMxZHViNEpENXduSkRURTA2L0JC?=
 =?utf-8?B?aVhmeGZYWVVRdUhSaWhmNDhYbzRjZnQvK08vTmJ6cFloQVUrTlVLY3c3WDFC?=
 =?utf-8?B?QW5LTFkwcFlFT0ZndzFxQ2tvUTdMb1VwbWY0WFJiTFBUU3VSTzdjaStubytl?=
 =?utf-8?B?VHJsd1V4VEI2dVpNZXd2OXB4NS85cGcyZ0tLM3YvZGVlMTc5QmlIMER5N3dV?=
 =?utf-8?B?VC9PdTlvWjJZTm9FQ1RkM0Q1RVUzaG1qZ3hYTldSa3FHTmhsTDgwcndYUzZM?=
 =?utf-8?Q?gKC+9EpK+EJ/XUyYQ5dhsXyqkdHROuYu9iVroYc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 084429e7-1419-4380-60b9-08d9275be646
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 13:23:10.9894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEyZBO9fpgCdoAJ05o8Iw+Nf90VaJeE7PrpMjIHxnNmyjf2flXXovoVFVsUa6FvtJBYB4qfqDZqdhPx18B+ckA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 03.06.2021 11:39, Julien Grall wrote:
> On 27/05/2021 14:58, Jan Beulich wrote:
>> On 27.05.2021 15:06, Julien Grall wrote:
>>> On 27/05/2021 13:33, Jan Beulich wrote:
>>>> @@ -1046,12 +1051,14 @@ static struct page_info *alloc_heap_page
>>>>        if ( first_dirty != INVALID_DIRTY_IDX ||
>>>>             (scrub_debug && !(memflags & MEMF_no_scrub)) )
>>>>        {
>>>> +        bool cold = d && d != current->domain;
>>>
>>> So the assumption is if the domain is not running, then the content is
>>> not in the cache. Is that correct?
>>
>> Not exactly: For one, instead of "not running" it is "is not the current
>> domain", i.e. there may still be vCPU-s of the domain running elsewhere.
>> And for the cache the question isn't so much of "is in cache", but to
>> avoid needlessly bringing contents into the cache when the data is
>> unlikely to be used again soon.
> 
> Ok. Can this be clarified in the commit message?

I had updated it already the other day to

"Especially when dealing with large amounts of memory, memset() may not
 be very efficient; this can be bad enough that even for debug builds a
 custom function is warranted. We additionally want to distinguish "hot"
 and "cold" cases (with, as initial heuristic, "hot" being for any
 allocations a domain does for itself, assuming that in all other cases
 the page wouldn't be accessed [again] soon). The goal is for accesses
 of "cold" pages to not disturb caches (albeit finding a good balance
 between this and the higher latency looks to be difficult)."

Is this good enough?

Jan


