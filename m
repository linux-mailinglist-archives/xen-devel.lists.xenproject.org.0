Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3923B9061
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148574.274598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lythQ-0006JC-Kk; Thu, 01 Jul 2021 10:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148574.274598; Thu, 01 Jul 2021 10:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lythQ-0006HE-HK; Thu, 01 Jul 2021 10:13:36 +0000
Received: by outflank-mailman (input) for mailman id 148574;
 Thu, 01 Jul 2021 10:13:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zJ+h=LZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lythP-0006H8-6F
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 10:13:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fcd3858-5b16-4314-9be1-40ca547d3c6d;
 Thu, 01 Jul 2021 10:13:34 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-F0waoWd6NVW-5zIx2J01vw-1; Thu, 01 Jul 2021 12:13:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 10:13:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 10:13:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 1 Jul 2021 10:13:24 +0000
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
X-Inumbo-ID: 9fcd3858-5b16-4314-9be1-40ca547d3c6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625134411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JCunioa4EWZjq32fQIVqtUhOCPm1ECOwtCYNIITpjdM=;
	b=VzWSA3WLrDLvmvLy3Src2Y+MPH7GlY/Xmb+ESWsHr4W7Ui9OLTOzpwYBDc40Fpx8tuT5er
	brsMw6ttA+/4Oxrk0clxBJD1BaNqX3crQHiUCGTvKjiTeslNM8O0EOir+qAdeev/VbRv/m
	FnIRi80Nt5FsP6wV/OSE5gFFuzEUmt0=
X-MC-Unique: F0waoWd6NVW-5zIx2J01vw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9ytCMHPYpi7BNJt6dukBjOsPTmGUL+qSrRSGOZ4ThlwYz4TjIbazNNEnKYaW+NO8A1qoY4+95gLRkNKgMbhWlLMHxT4RGuKPvZSvUbz1cfQ0yO3+D6CxmIRjtMRlShTayjpgdYFu9utMPobnMgmqda6FcCqV2ypN8fm1neJvHMnQbD1bgdhVR9exrop3zYl3XA8/jS3FaoCkffkIkm0P90qub+n7qPJTa7ejwsEL8vPif7t9+Uzvq344fk7ceRWlLgXudhAopO+Jt9pbxOJDCQjPXgU1yD1dOllXkWctbqx07sZifDDdBLwPfVOkdbUVp0nOnQOWeCXVZ1dlA0mAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCunioa4EWZjq32fQIVqtUhOCPm1ECOwtCYNIITpjdM=;
 b=K2TDbsRv91wKJQmTHUEPBTujtMGoDy6Ge+jKHiw5koZfiLTkX409ALE386wOkapLzVNPkh/GI4OV5JReN5csQLANhKNvjWSj+KZH3dmmFdA+QZ4R0YVr1dcEc4AEbYmHbjs+evYR5UHVr/tgAvKD1x71MH+UU2t1WuBXgejIzKEennZs2obG5yvuJOUhx8bWEx/9TXTy/rOclOfj5FhSUsqksb414WBDbnDOOuu8ytxwMXDFOOqVh3wqXyN6kWlFB2OFf8EuLyVk0bq1IKGIIPD1oW4bUqDAHqIRE6yi0SnQ2uIrIUCyu4kQJyaylbuWQZCiUIeauRvSWQZsAjJPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 5/9] xen: introduce assign_pages_nr
To: Julien Grall <julien@xen.org>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Penny Zheng <penny.zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-6-penny.zheng@arm.com>
 <41a7389b-630c-6cf4-fa28-7d80cb79176b@suse.com>
 <e7e89abb-1601-0cdf-71d2-c22af86057c4@xen.org>
 <dab3331b-f3b9-4318-bf43-9f994c7d1121@suse.com>
 <b7220a85-6eec-278f-8b1d-d474470406a6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa5f4ba1-c07a-ccbd-6ca3-7e1d6819b5d6@suse.com>
Date: Thu, 1 Jul 2021 12:13:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b7220a85-6eec-278f-8b1d-d474470406a6@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0003.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a98f9be-f3f5-41ca-fd4a-08d93c78dcec
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43812147E59E2976D4C81B6DB3009@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jjKTi1diZH3eUNBZIioFIzZdsmm2tuv3OXmgAzojGohzv47EmMVLm9kkrWHMaSny7RXnOgpjNd4hxswO71PT/WFY9M0idEC3COAruvi6XPUvmKHtrTp4AP6hMGbrFaAZBsYDP3o5oXel5b86QF5EF4j+oDENjUy3zkROdhl9Fgmqehnqp8Swz8K5nJbOGY834muaTAdfQJwHIEMtFc5KZ8sK0TY9Qv+gUqml0/QCijFpRgWN7eRCC5o9nad5NqvxtdtaO2yvvF9w6IOy3gcOm3/cwRAmYQWMjBlRS1xLSKesP6kHgltTvRvVFQjQQu5fgj4YSYYRhhLrvJAYzZQ4KibMMQ+DJEMiW9xMKZOWEE/zUqFTDRuvNa0dVtIeFblk2aOTEN2qf7OhdoG0ekPMkzW4KuaIJwp0bW10ssAOWANMmjsZ+FEZpoM0Ew9nQG7IoFdbIrXf4GEkzWmMUO6irxB6hIGmtzV4TtDFOh5HYVcHqeAiDKvc7ZeF0PrIjxAdglWqp2ozWL2xTW7jbCQmnqYYDnRBWS3T6iesr4Di+pjLr568zE69BjOmfdJ1uIyu/a6m9MOrVBTDtn5/zuod0cvm4fYMvLjy7wzv7p+yKid/6mZAOeNkhi3f5oNEcCNT6MiY31As8DuwNys/UjZt17zKysq+DK5LTq/XfqY4pJeZXuJLcFhmi8dx9HJm42HF/K2Gl7e0fAfswH5ypI27NTt6UEtQ1uJoX7OJxkzreow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(366004)(39850400004)(346002)(376002)(956004)(5660300002)(86362001)(2616005)(8936002)(6486002)(31696002)(53546011)(6916009)(66946007)(478600001)(83380400001)(38100700002)(26005)(8676002)(66556008)(66476007)(31686004)(186003)(36756003)(316002)(2906002)(16526019)(16576012)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzR5UWE1VzdOd0k1ZDFzbU9vRlh5UEhjdFBpU1NTUUNNNmpSUTlzcjJJeEcz?=
 =?utf-8?B?K3ZDRElqYzg4RUVnbDFiMnMyS29kR0dEZEV4Zzk4REJWcmVtd0lTaS9nOVA0?=
 =?utf-8?B?S2tOd2RzN3RmTUtpUWUvWTRFTjhOMmRpTExkeEgzYXY3S21RWGFwOUVlUWdu?=
 =?utf-8?B?eFZueUF0UnpKVVhaMWE1bHlFMUZLd2lURno0anNtT29NN05iSk5PVktjditP?=
 =?utf-8?B?dWlSKzR4R01zaEZnL0U2dXMzZ29KZHRJVUlsdmpYU1dHaGwzb1ZZbWpzYkx3?=
 =?utf-8?B?Ni9CVTFSdDdQSjl6aHArSU02a3lkWUEwaStKQTRFSEVoQVZtUUxMeUlhbStw?=
 =?utf-8?B?bmVpVDZzSUUyU0JiK0xJekttcHlaYldyZ25scXNERldQZW9HRXFObHJPUVpZ?=
 =?utf-8?B?bHExN2FoMG5oTVE2enBQbXg3YnpvcFlyZ0UybTJhdS9lTEVOblBsNVVzemps?=
 =?utf-8?B?eHNUZENtQVdiK3hlYmRFUWd0cWlEcmhwcElhK0JTRjZlWW95b011amE2dUpF?=
 =?utf-8?B?MDF5ZllteTdGcEJWWjBwZFYxMU5OWXJNNFlpdDNMSG81eWxkNXQxZlg1TU9y?=
 =?utf-8?B?dXowVmlxQ3daS0dsWXV2bnFMQURodzZaVlhtV3hsUXlxKzNUcmRadW1ncmxP?=
 =?utf-8?B?NlBxSXY3Z1NSV1JyUTZ4cFphNStDczVYL1FqY2tuanIrWnZOVk5WTHBPM1dO?=
 =?utf-8?B?Uk8zOHE0SlUxWjVjNXozeStIM09OczJZZERHQmtxa1Q4ckI4QlEzUW1PTTNl?=
 =?utf-8?B?RWZoZENFS3NPaGNTTFRxOTVjRFNVcXBUTlhIVWRFeEpnTXU4UWcwZ0xVYUpu?=
 =?utf-8?B?eGNTdzY1STNrK0tHdytqaTZjTDVnNWMvcnhGMzJtUkNCeHlEN2dHcUliWTE0?=
 =?utf-8?B?bVJ1RmkyUEU5aytzTW5vYTkzMzZpRlp5bzZiVnBiM0dGUEptOFA3dWlzb1VD?=
 =?utf-8?B?enZYVVlkU0JiOThRWlFONEZQc3BHTkVZa2lwTlhMV2NVYWdZY2xBWENsS2xR?=
 =?utf-8?B?d0twSFp3bXNrZUVBUjlCMTFTNjZVNjNJZzBXTTBSaW9YemttVFNJaUcwNWts?=
 =?utf-8?B?SENiblo3d1g0eTVRMXZLYU1oekkwWXpzbDdSTkJabjhjRWJhVU12Zmoza0po?=
 =?utf-8?B?SlZKZW0rRUovUDRYV2o4YmZpNTRWWmdJeVhvUW1mZS9kZFpYRXJNbFdpZXJX?=
 =?utf-8?B?cDdJd3IxT0tKRWFOWHZmdEdISEtyM0xpQ2xRWTF6UGZoUDBiWTZ4ZVdZbFFi?=
 =?utf-8?B?Wk1hVnBaYWpmcG9ZUWp0ZUkvT1ZiOEZUNHd6T25GNE0vL0FHaXQ2RFhvbkQw?=
 =?utf-8?B?Mkd6RXVwVVd1Q0RJa2tEVkt3Q0Z2Uit6aDJTUHd2eUN4UXlGSDVqNVJjRDRk?=
 =?utf-8?B?eDJ2OXRDb3l0bWFLYzFDbGJ6MVo4Qk9HSDl5YkNjbkt3aXpwcUpVV0lFVklB?=
 =?utf-8?B?NFRMWGhCanNGQXdjaUZ6ME5SaWRBVlpqZHBCemtzVjRXc1BwWUJISGpLUnkv?=
 =?utf-8?B?SlQ4cW9YSEpTMUJCbE55SUhJeHRvcEJJWlF6bFpvWEMwbS9VVFlqQ3g5RHdX?=
 =?utf-8?B?KzNhd01udXBLSkRpaVh5K3p6ZHVQMkgvK3ZsaDhTMWhoRlVWdWZvbGcybzhH?=
 =?utf-8?B?ckFwSDhGc1RzZk54dUJxSXlxRHorRWZWOWQ3eG1jRWd4R0xKNFVJcWFsV20r?=
 =?utf-8?B?VVMxbkh3a1hYZndPcVlINjBJUWRVeGRMN3htT2JCVzFzNnI4L3FFSWp6ZHpE?=
 =?utf-8?Q?W36ULVnyOGoOnrEhO+Ca4qIht5hCcq+SNVY9HLQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a98f9be-f3f5-41ca-fd4a-08d93c78dcec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 10:13:25.2195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mFr0k7tdkUes3HWt21wlYxwNLxXGNbkH0VS3hjvyV7VGzN/kClro73ewJhSZgrETFRX3vE+dzc/xxTLSJL11Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

On 01.07.2021 11:24, Julien Grall wrote:
> On 01/07/2021 09:26, Jan Beulich wrote:
>> On 30.06.2021 20:29, Julien Grall wrote:
>>> On 10/06/2021 10:49, Jan Beulich wrote:
>>>> On 07.06.2021 04:43, Penny Zheng wrote:
>>>>> Introduce new interface assign_pages_nr to deal with when page number is
>>>>> not in a power-of-two, which will save the trouble each time user needs
>>>>> to split the size in a power of 2 to use assign_pages.
>>>>
>>>> First of all I still don't see why in this one special case it is a
>>>> meaningful burden to do the count-to-order conversion in the caller you
>>>> mean to add,
>>>
>>> This sort of works for one caller. However, I would expect some more
>>> user in the future (we use it for Live-Update).
>>>
>>>> and hence why we really need this new function (to keep it
>>>> simple, you could even have the caller not break down to arbitrary
>>>> power-of-2 chunks, but simply iterate over all individual [order-0]
>>>> pages).
>>>
>>> The function assign_pages() will always use 1U << order (and sadly 1 <<
>>> order). So we would end up to convert the count in multiple order for
>>> then directly converting back to a number. To me, this sounds rather
>>> pointless...
>>>
>>> There are also a slight benefits to call assign_pages() a single time
>>> during boot because it will reduce the number of time we need to
>>> lock/unlock d->page_alloc_lock.
>>
>> Well, all of this is why I did add ...
>>
>>>> The more that I'm not happy with the chosen name, despite it
>>>> having been suggested during v1 review. _If_ we needed two functions,
>>>> imo they ought to be named assign_page() (dealing with a single page of
>>>> the given order) and assign_pages(). Backporting confusion could be
>>>> helped by altering the order of parameters, such that the compiler
>>>> would point out that adjustments at call sites are needed.
>>
>> ... this. 
> 
> Oh, it wasn't entirely clear whether you were objecting of offering the 
> possibility to pass a number of pages rather than an order.

Easily understood: I indeed we trying to express my preference to stick
to what we have, but trying to suggest a variant that I think I could
live with.

Jan


