Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE063BB83D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 09:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149828.277120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JNN-0005UJ-Ob; Mon, 05 Jul 2021 07:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149828.277120; Mon, 05 Jul 2021 07:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JNN-0005SJ-Kf; Mon, 05 Jul 2021 07:50:45 +0000
Received: by outflank-mailman (input) for mailman id 149828;
 Mon, 05 Jul 2021 07:50:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0JNM-0005SD-Sd
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 07:50:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b33554d8-dd65-11eb-843e-12813bfff9fa;
 Mon, 05 Jul 2021 07:50:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-5WlD1HSmPfGMa39KOacAsQ-1; Mon, 05 Jul 2021 09:50:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 07:50:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 07:50:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Mon, 5 Jul 2021 07:50:40 +0000
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
X-Inumbo-ID: b33554d8-dd65-11eb-843e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625471443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K4VFUC7j4ITjPhqjm08Uxuw/7MzYYMilatT3HOIvgcs=;
	b=Wger7dibg4GdO+wDwzDb9ajkZVyf2GDBfu9EW+Gm5RigyuKhKOuTokmIWE2rjGK9hn7Ir2
	mvPh0mdYUSJGtqs1aAjrh61ipGhlWARFmMT5KCVkhKVPQdNIEKV1UNBSvrDsrkFVpE6qtO
	LA2h168OV1PdHuvvb4vGjJh3vWalZhQ=
X-MC-Unique: 5WlD1HSmPfGMa39KOacAsQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Law7G9xve01VCz72no8K/eLehy7F0cF3OShdPrjv9/e5mzp2iW70+kHB+zmks0Ksd4pim5DwsCJhzjDjTbHJ6qZ8vuzJpfAevLOJ4Cr3vrVJcZU7UcaIvbhJJWI6c8psBHkVsPD0n45xoSkE4R+Ruja9g4t9F16XeS18bdFiycQzE0kBZRptPwasmnpx/3OaSEl7GbEq52wFqRd+wloEnQ40sVae3KpkumOmsF6HDaDOKd5BzGY/wRCntryVb3sf/la69y1tAFG7Lrbu9rW3uHzXZlsswiqFIcGNbpxLvSKc4GALR5Xm1uR2KDD5KTvyRKS+uJumM8HQQo0or+jNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4VFUC7j4ITjPhqjm08Uxuw/7MzYYMilatT3HOIvgcs=;
 b=kMqcHWNO0YJ4Dv91ZvbZFhZH00dknkQrYUYkAVRFAVpRfx36LkMnIkMV3y5OrCPVsAZ+XCpm+hGbfmvCjydWvQ22GsKVW4ifD4jH422VKQprZosSsKf/tHseyN2aOFK2QBQDoaqcQ6sANQcE7CLGTxM/im9q14EoeeyH3MfBxj7uPKPFvl4oFZp73oWj/8yvnpwgP0JC6M4wE34sVLMxrt8Pb0fnBnl8T55FCoksSrAiApxjmwhZBVQOlp2I/1Sd3RxCZr3FcALirJKmpPzG52l3tk3bAwf+2dfM7U3WT9P3UBZ6HCTuxgDntsbcPsIE7er+Ks66seuVVdUIaMl3Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 4/9] xen/arm: static memory initialization
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-5-penny.zheng@arm.com>
 <e0a312a1-f430-3ff0-6dd6-fcfe18e58071@suse.com>
 <7f77349f-015e-83d3-d646-af9897e31348@xen.org>
 <VE1PR08MB52150F476CA7E1989F9067C7F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <VE1PR08MB521538D03677F9CBC6088855F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5ce26bab-9ebf-f3c5-44a3-7918227f3afd@suse.com>
Date: Mon, 5 Jul 2021 09:50:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <VE1PR08MB521538D03677F9CBC6088855F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0176.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fa5bff1-0ac9-429f-01ab-08d93f899607
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4191D80C8099D71FCAC61FCFB31C9@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7rKsitMDyxekzeuZPEa2HyClNtioE+hPcT+pNfvDPYvfP7NHQPQ4taDGYJSW1QFSEer8ptPIoQ/sQnx+8Xarp1BlA8cEW7UOywJo0RpJIMNxQQudxA6qIsjC11S7rlA3t4/BG0WuoKndinVXJxgqOI+SWts75u+zlUZHsx10yi8dtZ4vQjtkvTDeZsRPbmoM4qqqXMlebmjQp5ICeHQKyktC/mVKT4GRjYGni+f8S3rumkSSmJQwxBKubicgxiFg0d869SbRCL4egoTF4i7bJvwuJIf3Az8q3NnM2PGZuNPQTZHz5ZTPKV9XRls0eCY+GhuHbMQSod4ZkZNeLCgAJUeK+hJ7UADMmqmNhDtycrkbabTx6Wfk2MeqTXBXaPW1h72XMKCs7Mgtrj4ynLdSSF31NxoVQigt0+sxqpyG1IbTSQb6SxiGPAxP3nDL1FSoejwJTg4frdxs0ZHArJ8igbRRxjHnnRoqHBpc+UtulwMZjIl89mRpAhdYhrWkG0ie9sPGQDnyCYs1rh+YtH/Uyk80w3VtViB20sJO+9vZOizKULvZD0imJpMFOmlDHxoDolCzrUmHWVFyISgF6NbitfLIIrAakg63qDMsF7w5o3ilS++DOzSOWdRmzZ0CIbUfeDoWgmAkSJchAqkYB92qdGFVD54KNQQ6daAagBpmzuF2IDwCShmRenKJSvcR0EfzxlXKJcYmo44nTQ6ZYLYQsPigXqsROFKPxRg3godsBo4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(366004)(136003)(346002)(396003)(376002)(16576012)(8936002)(6486002)(8676002)(66556008)(26005)(66476007)(5660300002)(66946007)(4326008)(54906003)(186003)(956004)(6916009)(2616005)(316002)(86362001)(83380400001)(53546011)(36756003)(31696002)(38100700002)(2906002)(478600001)(16526019)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?My9tMldheXZVdVYycnA4T2RoMjhheFVydDVhZHJsaXRZTVdQc1RMN2JlU2gy?=
 =?utf-8?B?MkcxbFluTW0wazhOQkpVc2JBYUlGKzluMXQ1NHlzcnFkL3lzTVJXTHZrd0ZU?=
 =?utf-8?B?TkZLTkpQZ280T0JvWVJyVTFXUHN5YlEvSTZsTURpK3lFc3ZrY3EzUFU1dVUr?=
 =?utf-8?B?a255VGNjc2N5RUkrTm9VTHhHUFRyQ2l4K3N4WTlQSU9lbitJWis0WVBPbGtG?=
 =?utf-8?B?dlNGL0VPNXg3UHlOUnlWdHlCZlczUHFweksxR2RMTjc0Qzc4UUdYU1R5bmVt?=
 =?utf-8?B?RTByc1NLUXh1Z240ZzZNZ1A2cFRwbnpCTTZsRXVMcnlDMzVsUDJwaVRCS0Fa?=
 =?utf-8?B?dGxIMEFRdWtkNzBQTkJic0VaZSs5YUNSRjNtQW5lNFhMMVg1SEVXYmZwakI0?=
 =?utf-8?B?TzNMUWpXMmpXTEY5RXdMdnNXZVU3Yyt4MDFZVE1JYlg5c3UrTGVzUVgwUXk1?=
 =?utf-8?B?RGVSSVJnVW90VDY1Q1ZrUTI5WXd6ZmNIdDJXVG5TQW1yQlMzUmhWQkIzQXB3?=
 =?utf-8?B?bTNsSytkOG02bE4xSVJ0ZjFacWJvN0Q3cC94czJNUHJFNlZ1KzM0TEttQ3Qy?=
 =?utf-8?B?YlVtWlhIY1dUOVN2RkZHWmQ1TU9EMXppcWo1UVUrQWQzK2hpZ1d5THVEMmxF?=
 =?utf-8?B?SVZZYWdMaG5WRk16NDV5RlpvNkwrNklqa25YeENuTitYZ2NqWVorb3J0V2Fh?=
 =?utf-8?B?N0cxNGZCNVRzUlBmTUFpUjBjVFFpWTBIUFFWOHdjR0VtVzRES0Y0SDZSeGlM?=
 =?utf-8?B?UkNJb2JPcFJLS0N4YnlRbi9meUxuYmFsYVNpM0M3R0pDQk5CR2tYbE1iMjM2?=
 =?utf-8?B?MG82RHVxNVI1aUoyTGo0VDYxNFlmYUhyYUt5Tm04MGk3ZG01S201eE9sOWJo?=
 =?utf-8?B?dEhaOUh6ektQZHRYVkJCMkJjNmNobWZKbE9ySFhJajZTdXVHQ2I4cXpkd2l0?=
 =?utf-8?B?dy9qeU4xV0l5VFY1dGdoKzRJWXFkZ3VMemtwRit2cEdhTjNFOWFCS3R3V1RN?=
 =?utf-8?B?TU1Welpucnlrc0YvazN4UGVodENLbUgzSCtjRys3OGNnd2FlR014eHJPdC9t?=
 =?utf-8?B?WVFDQzlvTEZnNFVzRUw5S081bFA2VS8vQzdUZnk0dHl3TzVkK0d0OS9GemJQ?=
 =?utf-8?B?OVVKZ0FsMEVsL3ZNSHhodjZoV1E0YWVwRndhU3VrOC9PWmZvZEtuL1BXblAw?=
 =?utf-8?B?U01sT0RLeSthNm9iQ3RxQ0JVMXVVTXdOczBwUDl3RWpRZTQvdFlzRVJsNUZR?=
 =?utf-8?B?eEkxK1M3R0hZZ2h5OHZmdWNaa0srZHAydEVMQ3N2TERUM1Jpa2JaVlNrbFpG?=
 =?utf-8?B?TVNYNkJ4NVlzRE9TZDVrOW1tekl5Wm9jRjcvMWNLZHRKV2UvbmhNVUVWNTFh?=
 =?utf-8?B?azZKcGQ4K1VCRXR1NENRZjcySWhQL1psUjFyakRkSlpQN2VQNW5CUjg5N2w3?=
 =?utf-8?B?Zk9DbmdJbENzUWNlaXdRdmhaUFVCNXVlUVN3bTg0UElQQm5rQ1BTMnl2cUJJ?=
 =?utf-8?B?V3FhaW1JZTFNV1dLNUdJUzhQc1c4M0pycnEvR0hqcjhIbk1vZWM3NmQ2ZE9J?=
 =?utf-8?B?N25ZSU16b0lHNUhRd3laalMrMWRtbHM4bTNZbk5KUFErcHdURVk4RmRqQjRs?=
 =?utf-8?B?MGxPVyt4dXhLY1M3eDNSZzM3R0FBOVErOUFlRU90WmNXZENoSENMc1dTSEN1?=
 =?utf-8?B?ZzhaS00rYWVxUkhxUkVTNk1ZY1hxRC8vSEFiUEx1RzVycXdYOVEzdkpJVzIy?=
 =?utf-8?Q?MAkHDH3nTaKuegxroGlB/8hYhhsJApmIxI9QKqY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa5bff1-0ac9-429f-01ab-08d93f899607
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 07:50:41.0776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcDxyYrXE592S1cuXQSL59mA/AnfhPUs/ywrQU5MFSJxQOYZ+iNKsLZtF6fz+15y91z4a+OTiVeVJiDH31vZLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 05.07.2021 09:14, Penny Zheng wrote:
>> From: Penny Zheng
>> Sent: Monday, July 5, 2021 1:22 PM
>>
>>> From: Julien Grall <julien@xen.org>
>>> Sent: Thursday, July 1, 2021 1:46 AM
>>>
>>> On 10/06/2021 10:35, Jan Beulich wrote:
>>>> On 07.06.2021 04:43, Penny Zheng wrote:
>>>>> @@ -1512,6 +1530,38 @@ static void free_heap_pages(
>>>>>       spin_unlock(&heap_lock);
>>>>>   }
>>>>>
>>>>> +#ifdef CONFIG_STATIC_ALLOCATION
>>>>> +/* Equivalent of free_heap_pages to free nr_mfns pages of static
>>>>> +memory. */ void __init free_staticmem_pages(struct page_info *pg,
>>> unsigned long nr_mfns,
>>>>> +                                 bool need_scrub) {
>>>>> +    mfn_t mfn = page_to_mfn(pg);
>>>>> +    unsigned long i;
>>>>> +
>>>>> +    for ( i = 0; i < nr_mfns; i++ )
>>>>> +    {
>>>>> +        switch ( pg[i].count_info & PGC_state )
>>>>> +        {
>>>>> +        case PGC_state_inuse:
>>>>> +            BUG_ON(pg[i].count_info & PGC_broken);
>>>>> +            /* Mark it free and reserved. */
>>>>> +            pg[i].count_info = PGC_state_free | PGC_reserved;
>>>>> +            break;
>>>>> +
>>>>> +        default:
>>>>> +            printk(XENLOG_ERR
>>>>> +                   "Page state shall be only in PGC_state_inuse. "
>>>>
>>>> Why? A page (static or not) can become broken while in use. IOW I
>>>> don't think you can avoid handling PGC_state_offlining here. At
>>>> which point this code will match free_heap_pages()'es, and hence
>>>> likely will want folding as well.
>>>>
>>
>> Yeah, I was following the logic in free_heap_pages.
>> Hmmm, I could not think of any scenario that will lead to PGC_state_offlining,
>> that's why I was not including it at the first place.
>> For broken issue, tbh, I just copy the bug_on from free_heap_pages, after
>> quite a time thinking, I also could not find any scenario when a page(static or
>> not) can become broken while in use. ;/

I'm, afraid I don't understand. Using page_to_mfn(), expensive or not,
in ASSERT() is quite fine. The (expensive) expression won't be evaluated
in release builds. This is specifically different from BUG_ON().

Jan


