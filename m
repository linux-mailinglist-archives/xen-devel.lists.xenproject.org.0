Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C9538DEC
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 11:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339394.564247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvyMq-00086N-5k; Tue, 31 May 2022 09:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339394.564247; Tue, 31 May 2022 09:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvyMq-00083i-0l; Tue, 31 May 2022 09:40:48 +0000
Received: by outflank-mailman (input) for mailman id 339394;
 Tue, 31 May 2022 09:40:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvyMo-00083c-St
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 09:40:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be90ca0e-e0c5-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 11:40:45 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-FrcnVOeuO-aNg0yuKmY5Kg-2; Tue, 31 May 2022 11:40:43 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0401MB2349.eurprd04.prod.outlook.com (2603:10a6:800:27::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 31 May
 2022 09:40:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 09:40:41 +0000
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
X-Inumbo-ID: be90ca0e-e0c5-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653990045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NRrEYUr1PhB3yQHjeFKf3cDCjzXMujI4Hq1C9vwnkvI=;
	b=mJKHOuVr7BSeoSTaazU91+XRndX+uffktJAErFMwkJjqF2QKcVP7pkrwp3J6qotQWPp56t
	K/mtgyHPARzGNucOP9OZDcG6J4BcfmdGiO21rW31ZIVOVL0+Xdb1a7Vqjpmcm+8Z8NDmLo
	UoO6qYO+SEpKwkdROclDbyCV4xY7Y/c=
X-MC-Unique: FrcnVOeuO-aNg0yuKmY5Kg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+7HpAxEfWF3qYQYQHsiduRs0orIRYTLtc/LZr1U+GdG14UR70btuzkZERTg+YFOA+KUFZaXyxsyMljvNXvPgwB5KqygwpniRglBnTauT/HkeKSQYxe78YZm8Qm8wonf7I+dykO3aawqQ6/iUcep9uY1rbYh+QdAvCHuuRHE+hqrzjBhMAhB/8qxPBUEzsQK7KNfg5XthWc0wjr8VAISReu9JGmi0Fegsic/q+alLjHIfHJOrOAJMQcIZKG3Jn1Mp40+Mtwy6VABRQyCYj1Flfhdm9wayyvfOcFktnLpCI1bDUa3tEQpF+WqyFUE4ckDKeoF98LzE02tS6tFm8+ASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRrEYUr1PhB3yQHjeFKf3cDCjzXMujI4Hq1C9vwnkvI=;
 b=oAVth+f22xen9vHKY3/HRGw7z/llmMj3XXwjuKJbwfVW6Lv0rSPeuGWCaFaTRV5M+tGoyZQCJBks5i1YX80phGkbkQnejyNhMUhbeAs62iGGLsCTIi2biHegZURq8XmbXdOz4g0WcH8DVSQvX06IGTN30mvgT7ThNRLOKqM1SVEUhV2AFR69JX3EHcgDoY8zi4yKOD/RudRNlYbpmjsFALi60Bae5bafQijxTUbwRgrrFajDLDshzYe+lVMZDyOq7T1+Ly6uugOns3w9AGv6Afn43mNCy4GJO7RtALbS3AaPWKw09MOfBxOibE9LGa+5Lhr2ICcD3X09bTYTmpI7XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e5a4192-66b8-aa15-19e6-a28f5b19d8b0@suse.com>
Date: Tue, 31 May 2022 11:40:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 9/9] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@arm.com>
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
 <20220531031241.90374-10-Penny.Zheng@arm.com>
 <104c921e-68ad-209b-5b3d-797a58e47fbf@suse.com>
 <776a312f-29a8-6bd9-1f4b-55be5d0f12bd@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <776a312f-29a8-6bd9-1f4b-55be5d0f12bd@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0002.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f630d403-1c94-4053-5fe1-08da42e9a047
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2349:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23496FE7A231589590D716BBB3DC9@VI1PR0401MB2349.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SWARJQ0YIIzxf3LpJR/kavbc9HLyN5zfxra2z5AUESHKK7qEvLdjlZfehfzBR7qKHd0rME7xqtz55uq8NTg18F1IRPPFmeGt5TJrRJezryy1liPq1QiMrR6QzJwTm7e5T+N6o31BmW616m0nBCZ75DoI4aVlEovt7kIe9t85lJFW/n6srGwqlPmBliH/OW1oe8N8CkmG4/4oePhj2g+JVqWXenE6e28CP4Ss+uW7AYpOe/aHc4HCW5YEQ8dCY63KRDDDWinqW4AKhuGps/1kvWKYj8yYXYRXi4P9fhah21D34iiS2l3rDmXVAmqqYHMTk1EztmeBtKv9+3PitMwYakU/n+9fXxDyDPMyl+nOabqsH/5hQ/I6Yl5H0f+dqni4o1/jugM48+zD44vAbYT5iUvA3tmg76mzQHrukMbMTwq7S6gC7epSj5Vg1WEk9Meb0DtuKzvFuSJgrM3dCPepydxWXKJUbTOxl9ssGuLOg2hamki59OAZJlJVL05PLX3313TvXAe0710ZixfMiaiuQu2gTfQPghW4fUqUdqmhwIyiMbkFm+GH0lCCnHjxWZTRwC4xaM1+xrPnAKRCSfd6YZGGgwBdk78DPThP8LXNRWXZRSWuPxReI6/jqkTOks/n84mmr+OX0BV1KpVZtibx6inihty+Uisx4OaAdMJJHNpvoKNU6hBFcyghFGS5BKAbBZ4UXGZPvvO/ufp914Y/TzzI8hri34DQrBzCsnauJQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(8936002)(6916009)(83380400001)(508600001)(31686004)(54906003)(26005)(5660300002)(31696002)(6486002)(66556008)(186003)(66946007)(66476007)(53546011)(6512007)(316002)(6506007)(2616005)(86362001)(2906002)(36756003)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWNwQURwMmFUU1NNUUJ0dWlFcmlNRkY3N2lDUGtHdEU3eGc1d0dVMTVKU0F6?=
 =?utf-8?B?dFFXRERBMGo4R1FvM0c3NUdWWWlxTy9RVTFUMExDUDUwMk4xMmRrb1ZKM0pM?=
 =?utf-8?B?UHdXOVFFUzU3VU16bWJ5a0VhRkZzSG5MMmZDd0NVUld6VWMrZTV1b2s3Tmxt?=
 =?utf-8?B?RWlXTWtQSC9DUmtLZ2dsOXZ3Q1kxaWltMGpxZVJPY1A1SE5BUWxES2doc1lM?=
 =?utf-8?B?bHduNHBHZG9nZ0pDSEFjbEV0V0hMd3JEL0w0K3dGakRnc1VXZmxJbUhocmFu?=
 =?utf-8?B?OUdWUHhvNTRCWFZKblN1TUVhVVZibG9HS2dwcWYwRDJFWk5scDNNMW1jYVZh?=
 =?utf-8?B?Qll6RmFSTjJZWFdIZUVaTkp2WWYyVTdlaHJEZG52d1d0VDRJcjBNbmhaL1hQ?=
 =?utf-8?B?d3ZpL05lcmRlTlVqSllhRlhxeWJYVWxkK1BlWmtJb1dtRFR6SVErS1pNdzVt?=
 =?utf-8?B?akdhYzVyWEc3VWF6d2s2RTkrb2wyeHVRYm1BQ1ZscnFrVUZYOXkwSHlGMlc5?=
 =?utf-8?B?YmlqZWM5Slg0OGpHSG1BTzljWDRjSkV3NjE3c3JOZFQ2d0dSaUUweHAxOWZW?=
 =?utf-8?B?WG9xVW90QTBZZ0lOQW1zVHlRMFkwelVHNkpPQlFYTmRwRzQzWEFML2NreE55?=
 =?utf-8?B?b2Z5Tjc5NFY3UVdvdG1JajFFUVN4NkR2ejMxb2d3NDZyUVJoTUd0c0wrSzZQ?=
 =?utf-8?B?eEhaTCtYU2RIOUxob0RsZHYxL1hRVnBOR0dDQjgwNUQ4ZGtwSmxCd1F3MDY3?=
 =?utf-8?B?SDhsUnBaRXR2N1V0Z3ppZUV3UUVwc1h3N3A2TURaaDdFNzV6ak5ZRjljZEND?=
 =?utf-8?B?UG5BNGJHVm94ZVZjL2ZBT0xtSGd4UFJIaEpBYzNISllOOVplOVh6UnUzT3Fr?=
 =?utf-8?B?eVR4U2dkOG5oUWtLMVJuRk4wcEZSMzh4Y3FEV1FuQ1d4a3Qvbi9lT3daK3Fp?=
 =?utf-8?B?VHY2Mi9hN2JpcjB6ZFZSTyt6QlFuM2llbklUa3FoVlVnZmdYRkFlYjB1anBk?=
 =?utf-8?B?SEE2VGh5SUpRckxuTEsra0VDRi84a2pzREE5TFhGOEdGVGVabFVtdEJkTXJk?=
 =?utf-8?B?ZE5ZZGErNnlmUTNjRWc0c0hZeGdwbzIvV2V0eXROc1BFNnpXWWI3VmZCdFl1?=
 =?utf-8?B?dWRYNkNnRStTazNGNm1pMVNBanNhTHRkTGRQZDF5WEw1R3F1RStQcGt2SjRq?=
 =?utf-8?B?S1VHNmw4NGpSRnJvUWhkcUNiSFUzd3M2WDhwTCt6MU5jbTgxRE42SFVMb0JT?=
 =?utf-8?B?Yll0NUw5dDRobEFKOUpOR1NiUEc3WWZ0MGNzMXJtdEtkM0Vpc0ZrRU5hNmpU?=
 =?utf-8?B?MzJLTkpSM2J4a3hTcURSUTdSeC8zUTNjTmswZEJ4amI1VERqUVo3bGx6b1RY?=
 =?utf-8?B?SmIzQXZNR2dMa0xReGtqYk4wWHlUVEVDYXlRV0xZWkNJMlJsaXdtNHRUYmhw?=
 =?utf-8?B?R2RtNUttK1FVc0ZaVExNc0Y0WnJZbXJOdTdaY1Q4SHJOSHlJL2RxUUhsY2hq?=
 =?utf-8?B?cDR1MVhhYVhqVG8zSFRHZXU0MEVqZnA4TjdZMGFUYUFtOE9OL09tN2IzOTVZ?=
 =?utf-8?B?Z1hkUzJiN3JyR3dZUGdZZWF4Tm1hVG11Z2JNV05XcDgvaGdYbDZLbmFTZVU5?=
 =?utf-8?B?MndGUTRKQUw5R3BFcmZIc2NpQmU4dk5vcHhoRnNVTWJRQUR6ZGc0OStCRUhi?=
 =?utf-8?B?TytmTG5NVFpMTVYxWk5FRnN2dW1ra3B3L2IycytQWWgvU1NsdkxvLysrdFhq?=
 =?utf-8?B?V2EwSnQ1WWJVWE1Ddm9FVkJKOGt3RmdZNTc0ZEJrMmNZTmNuN2xlZ1BCWUdp?=
 =?utf-8?B?RjFWVldsTFBMWldoVU9XMVo1NjI5SDJYTHRkaGhQdjFmZWRaWFQ2RHlTd1hx?=
 =?utf-8?B?bTlvRXJvSk9jVlJpY1NjVHhDVHovSTMzZ3l0NGIyQjZlVkVFcU9JSkQwQWpr?=
 =?utf-8?B?K2orS09CckdTU1VJOExvOTdxSmVoUlNWZHFBK3NWeGJBZ3JQc0FVdHVBdk1P?=
 =?utf-8?B?U3FYWmJJRzNTc1hiV0hid0xGdm5XejV5NFhaOU1SclRxWUM2VytkSVNhczVM?=
 =?utf-8?B?THhuekR1WVoxakw5OXZ3NWVKakkzcDJ5QnI0S1BkemQyWHZFSEh6M0pWcmF5?=
 =?utf-8?B?VGlUUTNmeVpwclNLOXhLZ3hrUkEvKzhldnlWT25IR3pUWjU2aDFLWGNDdW9R?=
 =?utf-8?B?cWZhcUJuMUdNMGZGTk9TU1JGaXdLRzhRTmJXSlM5WXd3azRxTDhIUzg0NU82?=
 =?utf-8?B?VzFqVDJvai9VL2JrdldpOWtFM3FUSW16dXlMNk82bGliMHA1TUFJRFdBS1N0?=
 =?utf-8?B?WU5Zb0p3ckxRSnpBVGVJcFRZNUJvK1YxSWhqSHhISjJlRG9DMlVPdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f630d403-1c94-4053-5fe1-08da42e9a047
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 09:40:41.1441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7z5+FhFbIWaH0JtD0XeVYlLaZEzaDlO6JAyPxrkque5VaLd+H+1DTU77DKKVVX4acsafd+U7JMxYzsxaBbRPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2349

On 31.05.2022 11:35, Julien Grall wrote:
> On 31/05/2022 09:54, Jan Beulich wrote:
>> On 31.05.2022 05:12, Penny Zheng wrote:
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -245,6 +245,29 @@ static void populate_physmap(struct memop_args *a)
>>>   
>>>                   mfn = _mfn(gpfn);
>>>               }
>>> +            else if ( is_domain_using_staticmem(d) )
>>> +            {
>>> +                /*
>>> +                 * No easy way to guarantee the retrieved pages are contiguous,
>>> +                 * so forbid non-zero-order requests here.
>>> +                 */
>>> +                if ( a->extent_order != 0 )
>>> +                {
>>> +                    gdprintk(XENLOG_WARNING,
>>> +                             "Cannot allocate static order-%u pages for static %pd\n",
>>> +                             a->extent_order, d);
>>> +                    goto out;
>>> +                }
>>> +
>>> +                mfn = acquire_reserved_page(d, a->memflags);
>>> +                if ( mfn_eq(mfn, INVALID_MFN) )
>>> +                {
>>> +                    gdprintk(XENLOG_WARNING,
>>> +                             "%pd: failed to retrieve a reserved page\n",
>>> +                             d);
>>> +                    goto out;
>>> +                }
>>> +            }
>>
>> I'm not convinced of having these gdprintk()s here. 
> 
> There are a number of time where I wished some error paths would contain 
> debug printk(). Instead, I often end up to add them myself when I 
> struggle to find the reason of a failure.

But this model doesn't scale - we don't want to have log messages on
each and every error path. I agree having such for very unlikely
errors, but order != 0 is clearly a call site mistake and memory
allocation requests failing also ought to not be entirely unexpected.

Jan


