Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613BC50DACA
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312445.529685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niteM-0007Od-09; Mon, 25 Apr 2022 08:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312445.529685; Mon, 25 Apr 2022 08:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niteL-0007LO-Sl; Mon, 25 Apr 2022 08:00:49 +0000
Received: by outflank-mailman (input) for mailman id 312445;
 Mon, 25 Apr 2022 08:00:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niteJ-0007LG-PU
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:00:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d037d38a-c46d-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:00:46 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-6U_zLnw1OtaDTW2qjc4nCg-1; Mon, 25 Apr 2022 10:00:42 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB6342.eurprd04.prod.outlook.com (2603:10a6:20b:f2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:00:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:00:39 +0000
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
X-Inumbo-ID: d037d38a-c46d-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650873646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dwjUfjasWoK5VqTh6RqK/vuveUXh689QuV2Uvjsgduo=;
	b=TI5a1kG1/miob3DRQyUDqGhH5D/GTnQg+Z0YbAZnGx8AL7qk5hDDmSBkjxbJyNgtHTjHI7
	pW1WZIdrC940NRyepe5CdyKjhiJ6mtEanaNhtp4pcl1IthrFuI2+kpZxlElVENZEGUpi4m
	x6jbCcrVPKMrRQtkmS4qCcmNKiJOOxk=
X-MC-Unique: 6U_zLnw1OtaDTW2qjc4nCg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlGyv8YMtbIbmiELefydqgc4PRHRmpqaidjjcY1lyShKhMSumJHK1RInXbGJJ03Y+YVkS6UTpkfzraaAbTwPAzWxVi0lj1u4rnmYJWJq2EOn+ZmuMgjqDerQ9X5HtRK8Nj8OYAXeHuYEZg95bqltn2N9MQh+ROh8RZYeCX1ksv7cCHSWTugI3VyTAnSJDYh/CxY2iAF67mRTW2QI24Q/NNeCXUe/bLxaXBkb1y0cWW6LwN2aZRKO6fCFSZi5nKOmW9HMdZfisoSmesOMY1fUlNrs3uBUSWX7+k0ic4GN1DDmZucT2nQoZpxr6OjGw8kdxaB1nD08rUh3XQxYhZNP+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwjUfjasWoK5VqTh6RqK/vuveUXh689QuV2Uvjsgduo=;
 b=PssR486ikTrUaRUNk4TcKoOK3Mqd4JnSsp4yzC+3lZ2hGN63R7+uoxA+Y1V3vRPz+IPuZX1G1RgjQ10rCfhAZDCVlyoWCbIXQQS8MW/4B6vK+ezWGjdak/4CaTxzDxj+if2RTJSzzi1PRQU+9uFg2Es4Gvxw70h6dAh2OfkJZjXBewI7gA5ZKbfxL4K0TxYR2dQJ93MfUCgH11TJ3Qp0nQXfRG8B3VfnxDe5dktqS8pC35jcgOEiVlUBMHjP1WBx8FUExSDK5lEe/+QYP110RL/qepwwjsIUQadVd2Hm2WhZVZH8LeCr6YGMVDhxIXgcMvbxBU1edlVf9JJYD57HQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee51e12b-806f-99a9-b60d-84d6a9a939d6@suse.com>
Date: Mon, 25 Apr 2022 10:00:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 5/6] xen/arm: unpopulate memory when domain is static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
 <20220418122251.3583049-6-Penny.Zheng@arm.com>
 <b76b3207-4eb7-5236-6812-d64cd4dad17f@suse.com>
 <DU2PR08MB73253426B332CFF5358AB346F7F89@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB73253426B332CFF5358AB346F7F89@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0125.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::10) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8f46a94-16ac-457a-9c7a-08da2691b04e
X-MS-TrafficTypeDiagnostic: AM6PR04MB6342:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6342A266B07576575A6105CCB3F89@AM6PR04MB6342.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zX5pJQYVQlC3iz80Y20m5O67JOEOpcIlydJfx1O8qNwDZg3e7bOu3rp401dJebe11yRxsQflAD7Gb8UToDuBRRyVsUd2X0UFQW5Ym0syxhkIB/nlcR6Ql82SPuk86vr3HjfsRS+kQsCkwXkfu7D+zBuZROP0PvvPd5la3lulKOp6L+ST21j1NFEnO2V5Z1KuS7YM73ti621j2IIZeQq/Iptjj5azAYCojhT3+EcAoq5szRGXzhENev6m3m3f3wt8Y0lIpupUKnmMpIX4X5OzfnKcYTyB2XJcK6Wz8qZr84GTNey5kGIRkdI0vWY0nlM1XJBbHuAvTOwFyQ6pAA10nAnS+H1zxv1sNsmKuX059cNcYDYRNhIdKAfsQqlGdQLv3qfHRmln90yieIlH3/kYlntqF7pBYqYU3BufDEtIZTzT+VpnVpNGMG33wa8N1MbIcTzpu+P+GmuZ7PAaq4I3eAY+HgWU/u99kDsoe6p+TvWcWYIQ4N/44tgow6nNOJv4b1+luEKpUvqneqF6RXZeSltjI1xfcNDEZMZ0GXQD8gxldvaO3Oh9hDGtw+poj6soLwPuai5upUjqb2RQIi1tQ24IRTwIr7JNRv00tLdsHPKDAmsfSD3OymQo1JAc9FF1SoNeaG4vWQPFIVptt9yYMCup0GMl3fXq5xJQSUIJIGXk4QywhsbbKbcVx+Z+019s8+37D2uWudUsSNYDVokdtmom8QwXf8PlQ7LxAGI386pYVC1DOKkY8VLcLxVRRUNF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(38100700002)(4326008)(8676002)(66476007)(66946007)(2616005)(31696002)(316002)(54906003)(6916009)(86362001)(186003)(508600001)(6486002)(66556008)(6506007)(6666004)(6512007)(26005)(53546011)(8936002)(31686004)(7416002)(5660300002)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDRUcEsyVlJFdk1aa3MzUWlYekU2S2ppQ2owMkxOT3AvTHpnTUZOeUcrWmwy?=
 =?utf-8?B?ckk5WTY4MnIzT05oT1h6UVhXSTIydnAvNVlvenhRS0V2b0Y3T1lKTmppTE1i?=
 =?utf-8?B?YWd2UEwzZTl6MUtrODQ4MGpxSnNieVZQYyt2S2NrVFJXa2t3TG9nM1JPbURY?=
 =?utf-8?B?d2VybG5DWGJIUFZPTy9vQnNrdFNvZ2NzcmErNGRhTVNHQXI4MXZjaTNzT2VD?=
 =?utf-8?B?dXdPNk4xMTA4ekgrR2kzT3piUjF1aEh4eGg1M0UvRUFMUnVLRmwwcUdvcmpQ?=
 =?utf-8?B?YXZSQUlzM28wQWMyYWZJQ3Z0aDdodDVvQ2pmdDY0Sjk1UVlQRmJQcVk3c1VU?=
 =?utf-8?B?QUdQVVBoMWdIY0JrM1E5dzg4TEdHNk9CQjhMSWRiOXp5MU1VZndtOC9ReWdp?=
 =?utf-8?B?Z0RpZ3B1dFQyZVFVT0tpcWZaWEcyOW9PUHNYQzNLb0ZUbUpLdUJENzdacS9r?=
 =?utf-8?B?ZnFpVlppYkp6Yk5YM3pyR2pqVkFnUUVGMzRkWlJ6bVI4anlvQnFVV0pBWkFz?=
 =?utf-8?B?aTlFV1RVNWR2RThnV09uQXBwakhtK3F0VTJPQXY5bjZMZ0xRclFEWWRoR2pl?=
 =?utf-8?B?cm8rdVcxZ2Q4WWJ4OWxrM2V3RHNvWjhCbm04aExVb0hRQytwNXNNc3VkM0h1?=
 =?utf-8?B?QmpqNHE5dEdSMDFFcExpb1pMRW45Q2txeG5lS29oV3grVHpqREMvU0lpMFFa?=
 =?utf-8?B?WkIxVGY4eStMWVNSTnA1R2I1dVRIdENpRStrdzJtWStTbUZLMU9rYkhtalJt?=
 =?utf-8?B?d3VxYU05c2IyT0c1U3pwQU10MXBmZjF4VE00WGdEcVN5YnVsNlVISHFhaUoz?=
 =?utf-8?B?a1p4Z0FXaGlqZFFtcGhlQXA2S0lvamlmZE93dXlIdDlxV2F6RDdVbmpVcXN4?=
 =?utf-8?B?QjFDU3Y2eFhlb1gvZytwYmJsR29Ia2VQRFhPZXV0R3FEWGZIUnBJRm1mcG15?=
 =?utf-8?B?TlYraG53TlNtYTVrOXNFOWsxeFhEVUZOOGFkbjVrVW1pWjd6UE5jdG5IOGd3?=
 =?utf-8?B?elFEZWxaSjIzWXBzRml5OFkwRWJUY09xWlQ1Y2lxdFpjOUl6eS8wWnVneG81?=
 =?utf-8?B?Z0hDcHg4QjB6ek1ZbitYc3o1TzFNY203ZmRoNjgyQURkUFVCTHV6R2JaMnI4?=
 =?utf-8?B?VllxRUdNTkhrQkRRZXlpaUxaQU1MS1ZhQ1hDTlpJVytpZzYyQW5LY3Y5ZU1t?=
 =?utf-8?B?ZCtEZmk1Rm9PdzExQUJYYmp3M09qNmlvR29Tb2h0bi9qeFZ6UDFENUhva2hm?=
 =?utf-8?B?SU1udlBPWUdhQkVtWkdaTEVzQkRoK0ZIOVFhSjZPMnZKcG9oWEN6cVlJM09T?=
 =?utf-8?B?RWNUSnZZaVA1cTRWSE0vSy9PNkdiaDJNWm54TFpOZWJncTV3b2cvb0U1bGVw?=
 =?utf-8?B?bVk0aE9HcHFYbWpveHFpME1GWFBoTHVQQWdFOXRFLzErcUZqNjVjZEg0V0ZI?=
 =?utf-8?B?ZXdZT3VkQjV6MTF0Vng1UkF6cndDNEZpYjlDbkErM210a0FiNXhHVlBPWVEx?=
 =?utf-8?B?WXNQcWNIUkV4ZW56ZzdQZW12NkhEcWJIN0szZ2VQVXI5bnYrWXJzOWd5VVlj?=
 =?utf-8?B?elRqOSs0a01Kc0FvZ1ZrVEZUalUzTzE5ZUdhRlhhOWMxdXNvbUc2MVp5WHZD?=
 =?utf-8?B?ait4MnY4b3kzSG9RUmc3TEJoOGltem0xbjJ0YkRkbFJoVDYrNktZMTJtd1Bp?=
 =?utf-8?B?VnczanhuQ21GUENxTUJDUWlSdW9nL1hHRTFvTEg3bllvUWp0S0J3TTY2RHBq?=
 =?utf-8?B?SUw3RmppeGN2ZHJDTVBYRmw3K0FZeTZwM0RKUFp4OTQrcVhwMVVWeEFWVUtY?=
 =?utf-8?B?ZERJM2Ryc0s2b0FMV2lBQkh1WUx4K1NXNGFES1dPZVFoSGw4cDBsOENZTkV3?=
 =?utf-8?B?T0VpOFJ6RXB1SEJScEhTaHZxSlhXZjdEclNMS3B6a0UyL3ArNHd1Wmsvdk1j?=
 =?utf-8?B?Ykt3VkdwRkRSZklPcnRqOWtnNTBkZ0lpTnJwOWp1RWtBTXZ2L3Z0MWd2Zy9N?=
 =?utf-8?B?YUdVYXNHY3ZpZmYxbWpqVUpnaU5EbndiSkcvOHNucUJUeWEvYlp0eVdsYXlJ?=
 =?utf-8?B?MWpWd2xFdVpEWkJqUk5zUEJBVWF1L2ZndHhRU3ZubUxVWUg0Ky96ekJvRDNn?=
 =?utf-8?B?K3ZNanBaRjU3bDhUNWlqRDhNMS95YzBxdHFVS0N4RjZ1VytiU0V0MVNBeVo0?=
 =?utf-8?B?Q0IzSUo0RTdscWcyZnFCakFjMlRpVVNqRzNORGltRVlsUjRsdnhkRnhYby8w?=
 =?utf-8?B?ZTB0d0tuNjVnUjhIM0dHbHEvR3libytwSzRhZ2J2eFAxUkpKVkV2UXNJczB5?=
 =?utf-8?B?aENhWnNpYWRVN2FkWndwY3FyVDIzY3dWdkJZanJzVFl2RkVkdjF3QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f46a94-16ac-457a-9c7a-08da2691b04e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:00:39.7339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PH62O3xeaL3AqcwQBxAORTo2oXH8K0kRuwG/8b2UkgsAQXjktTnxludmnt93j5fIsVaIJ4ypu7OI8QWYwgpX0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6342

On 25.04.2022 08:34, Penny Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, April 19, 2022 5:11 PM
>>
>> On 18.04.2022 14:22, Penny Zheng wrote:
>>> --- a/xen/arch/arm/include/asm/mm.h
>>> +++ b/xen/arch/arm/include/asm/mm.h
>>> @@ -358,6 +358,23 @@ void clear_and_clean_page(struct page_info
>>> *page);
>>>
>>>  unsigned int arch_get_dma_bitsize(void);
>>>
>>> +/*
>>> + * Put free pages on the resv page list after having taken them
>>> + * off the "normal" page list, when pages from static memory  */
>>> +#ifdef CONFIG_STATIC_MEMORY
>>> +#define arch_free_heap_page(d, pg) {                    \
>>> +    if ( (pg)->count_info & PGC_reserved )              \
>>> +    {                                                   \
>>> +        page_list_del(pg, page_to_list(d, pg));         \
>>> +        page_list_add_tail(pg, &(d)->resv_page_list);   \
>>> +        (d)->resv_pages++;                              \
>>
>> There's no consumer of this counter, so I'd like to ask that it be introduced
>> once a consumer appears.
>>
>>> +    }                                                   \
>>> +    else                                                \
>>> +        page_list_del(pg, page_to_list(d, pg));         \
>>
>> Is there a particular reason to have this page_list_del() twice, instead of just
>> once ahead of the if()?
>>
>>> +}
>>
>> Also this entire construct want to be an expression, not a
>> (compound) statement. And it probably would better evaluate its parameters
>> just once.
>>
> 
> #define arch_free_heap_page(d, pg) {                    \
>         page_list_del(pg, page_to_list(d, pg));             \
>         if ( (pg)->count_info & PGC_reserved )              \
>              page_list_add_tail(pg, &(d)->resv_page_list);   \
> }
> 
> I'm trying to refine the arch_free_heap_page() here, but I'm a bit confused
> about to let it be an expression, not a compound statement.  Do you mean that
> you prefer to let the if-clause out of the arch_free_heap_page()?

No. You want to put parentheses around the braces, using a gcc extension
we make extensive use of throughout the code base.

Jan


