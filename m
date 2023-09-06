Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FCC794108
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 18:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596725.930723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qduzO-0007cu-HI; Wed, 06 Sep 2023 16:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596725.930723; Wed, 06 Sep 2023 16:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qduzO-0007bC-EK; Wed, 06 Sep 2023 16:02:46 +0000
Received: by outflank-mailman (input) for mailman id 596725;
 Wed, 06 Sep 2023 16:02:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qduzN-0007b6-Dp
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 16:02:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d079f5c3-4cce-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 18:02:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7185.eurprd04.prod.outlook.com (2603:10a6:208:19d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Wed, 6 Sep
 2023 16:02:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 16:02:41 +0000
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
X-Inumbo-ID: d079f5c3-4cce-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUurZB2cZ1YYvI+zD0typBMUNKbB7pVilajdsZaCcGEnNMmZWUtj8NOGOfBS5E9V1zdLZqXvvcQ2auHyw1ohxNaxjp8vIxn5+zfEZKMVJmQsnSTYVuhlyBGNxG41AJvb3JzTl/fWeTY+HDdZh3L+tSbXXYAaz2cjGkUYFEUFUPdQncwRvHWe9/LgYc7jOIi3EwGAW1D+eFrsDXxGR/4dek5q2PgT+nNcUfsyX/ZUjt+Lt/BHPoOzOt3o5U8w3pDoLjgcnHUQqynhRVW/6H+c2SGsvata4eNzjV/ds7nCu0lJZklN2e0Kj3jDSzpo8uXUO7HhZXKMWKv1gnpKeILGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kUAf5eefgN+wtm6KtzSqpbLfYJJM/3+zBWnQ6BscKg=;
 b=IswLhB+QVfO+wdTNY3TVT34iWPOT/FlaVUS/JT11wQZ9NTo2mJMARsLVgYr8Q8e6SmDPrRZ9iu4yyfpZSfPxKWLnzXOVulnF0yQ8x4xOsUpidcY0rs7dJvYNEFl/dpbqMoAJCOzJjbSJWDcIFu2+TjusOWbFYuYHgzk1y/hglAl0WN1k3BCi7+7NdZkrtCjK7NF8HmhcBM/y20BeYG74Xw45JIwmK6tGdGPV9yIvezkOuOCQEfURoMWUBtCdLQm4Y8rWUpMrGRuOEggyQqw6DYS4RnWC3RgE2xatlcOi72dLmyRee5GVetSOIiNnKX6RGVNGf+m+mZ3WC3VUv1n/CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kUAf5eefgN+wtm6KtzSqpbLfYJJM/3+zBWnQ6BscKg=;
 b=jLllryMrbtcS4yJk4SoAEVRVWY9t3lE/tV2CL9Gnd7E0uVcYpmUGjm33JlpEW4AjkQC5hZ4N67sK2SaICsr+kiFfAX4/3urfYJ0EhehyLVk9St2ywwwL8S+dWMAclT1PTZ9I67jKFTS7mC+B54kX6jee8FBM7R28r0fzQx6bRV0X3NJPETY2Lm9f0Sm7JmkZcSEboC+SnrskXP3zI47gtyH8V0QCVyRTn68A8XyLckLsSFsbJroH6S57FAM00DGuSVeST0pWbrbxzNC8lyAkZ60Gux/DXArbbHN3ebBBFrNSSoGXJwgtr+6fsXx0ydRmba/Ah7LIiFfau2FUMd1/5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7937ae31-e511-8e41-9cbb-98d8666e66b8@suse.com>
Date: Wed, 6 Sep 2023 18:02:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
 <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com>
 <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com>
 <9b673dec-f391-9948-3ce9-25ddff8c9d7b@suse.com>
 <948c3c6c0b9dff859df58eab419d01f6@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <948c3c6c0b9dff859df58eab419d01f6@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7185:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b4f1c6-f3ea-41ad-8f48-08dbaef2b31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wVUXYxHs9kJk/QchOXazULDhHhgcLL5lGTWEcV1CkP1LaM0vEg7aAxpzuLH0shKzoL/E2AWwolLfUkbslAnABliqKKaCj0q+Tjj0kdvZA5y4mLXRxroOakFQ84PkZxNU6xB3CvlqR8WmzrmnFOOeGZgSYMF7+bq1/WtPUoAgZ65VGg9rbD1aBxaNUW+1y6WNFfRsfEdnWV7GNq117LPf6zO0GL3Y9wPDl4b7mpR2F/6nmwsY8fY0QjUg5xuWM6pODqHcDHbldEcB1R4FvjFe/zSjvte1DpX4Dtdzux4qUfuDbXMFHAvqGfbJbP2c+RwpPXoIQbu3GBhuULfXsVj5KhAnkVYQdDBIxRArl2uLr44+8JzRryfr3eLIOJe6vhR6wirWbQunRQsqupCn17CKHyKSqfIaH3MwyGGsm5T7dFRhsjf2Gnyjr866vd65j5B4/z9NHsKK85zzFIKbdBj3IVL82Iu9NFGB2Vcs9E1jHU8829xLFQkUYRMQ6daY4HnFAZbBe6VhqzxWyPg0yI6NpkAW7BQ+Jb6uS1M+xtmCW+Q17d6uGvvsJZmzWkvaTS9m22M66DFgixf6z0IWfc+lrPXXjlg4mgjduqmm3XAXXq+v4sI5msigvJONcgElPHaR5Ba71F+YopqMWJSRXZ4R2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(376002)(346002)(136003)(186009)(451199024)(1800799009)(2616005)(478600001)(6666004)(66556008)(2906002)(8676002)(54906003)(66946007)(66476007)(6512007)(316002)(6506007)(26005)(6916009)(4326008)(8936002)(53546011)(6486002)(7416002)(41300700001)(31696002)(86362001)(38100700002)(36756003)(83380400001)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blZ5ZE1OWGdYZzhEZGt6T1daSDRpS0UxSGRkNkk1WWExSVduUDQ4K2wwRU9t?=
 =?utf-8?B?dmdBVXpNSFZjemo3MGpjZmhIUE9yMVlyODQzZlE2VEszZVhNS2gwVVJORCt0?=
 =?utf-8?B?RVdPVDE4ZzhHWHFEeHYvNVdsOU1EbmJ0TzR0WGVLek5PM3lyMFBwNld4cGRz?=
 =?utf-8?B?RFFEOEpkQlBXM2xwNHNhYWRkZ1BnTWoxZVd1QW9ScmpidjM1NVBCMHEyVVBX?=
 =?utf-8?B?TUJ3U0ZJMjZiSms3Y1VzK2xlQ3REa2dxVjdoWThQL3FBaFhxcktWT2NpVzBW?=
 =?utf-8?B?eVFOMFUybWpHQUNXZFBxV2NIY3JNV2lXU2NJQzVhVGs2bmIwWkhLb3pRRUc4?=
 =?utf-8?B?Y3ZFSGxUemtKU09obWpkb00xeFY0WWFLdFZxRXlqSnp2ZEZIS1VZVDQ5K0RB?=
 =?utf-8?B?UGNYZDAzTmpYb0FSLzNUWGpsRy9mdHAzTE1ldmMzSjBjS0hiMlcwMlhRdmEy?=
 =?utf-8?B?MjhGcGFHcDhHVEtaa01ha2VrNDNxWkpNbzFuSjFWTlRqSjJ4OENmSHNYWVZG?=
 =?utf-8?B?VkxNUkJ2YUtwKzhOL2VmQ3Q1eUU1SElEbjVMZGlyNTlTc1UzNGUzS2JrZGpx?=
 =?utf-8?B?WmNCK3c2SDVZay91TTFzYVVHTENPQnA1STJGTktxYkNlaS8rVk9vMnlJVkdv?=
 =?utf-8?B?UHB6aEpySUZWcDlBYXZUbGJURU84UGozak84REhCaDJac0YyY1JQK0EzRHgz?=
 =?utf-8?B?L0YzOFJoVnZGRGQxU0NEdDVxaXBNZlkwdTRhdVhTb0x0eTJRdUtJbGc5RzZs?=
 =?utf-8?B?OEpPRnM0dlR1REp6Ni9iTDZSeEVpT05ZRndqcjdCY0wzQzdLcjhhdGdERUVL?=
 =?utf-8?B?TS9mQ1dCRzZWa2h6U0srSHZ5cUdnd3puaFZxUE9zYTlTQ29rZ0hjTTNpcDVS?=
 =?utf-8?B?bmlEaURTTTU0cDRwdVFxOXZ4MUExbXMvYXZBZ05TdElWdXdaUEQxN0l4RzVm?=
 =?utf-8?B?aGRQdEJ5UnRTcGlBalZqaTNIcVFYNGNBbXFRS0ErZENyN1NOd0lLa0Y5dnd3?=
 =?utf-8?B?V1JoWnhTeE9Cd1dQeWNtYW5aR3cyelNFNVlYWTQwalM1ZnJYTktqSW80RG5o?=
 =?utf-8?B?UE1wdVI5dUZhaGhkUHdwbm9rOVpMYmpDYUU3VXAyaUhRbmpscHVDTnJrM2RR?=
 =?utf-8?B?MlhNTHkzNXZ1cXNTZU5jT2xBa1NoTEhRMnBpakZIZTBwbkJuRHdnNDJaejdp?=
 =?utf-8?B?LzE3Y3NtamR0Yk1PUHdmQUg4RDc5WkI2YkFNSTZjRFNBUTNyOE9ncW4xQllx?=
 =?utf-8?B?cTFKclpxNHl0cCtMUklzWDhTUTBncHg4eU9rWjJmVWlPSlJvczVrM0w4bEZW?=
 =?utf-8?B?VlZLYWFIcWczNDRLN2d1dVJiNFZKRzhIa0lNSFUzSXI0NFBGRmtzMlNUV0Vs?=
 =?utf-8?B?WlEwRTBVdGpOSUNUSTZ0eUgxYmdVZmhaNlJRNHYrZWx0V3U2ejJ2ZjV2eVdk?=
 =?utf-8?B?dXdVREFMY1ZsT2E3bTFlb1pqb0ZBTGg0QjN4S0p0Mks2ZkNwVUxJaDMxbkdk?=
 =?utf-8?B?MXhuRDhyTWVFR3RkdGc1RGY5Y3B2ZmZWT1ZaNkNFbEJkdGF2cWlDaVlUWkk2?=
 =?utf-8?B?SkpYd1Q4NXVIMWl5T1VXaHpwTzVzVFhLK1RLc1JsQUR6N243OHJNbmNERHAx?=
 =?utf-8?B?T05DNWwvRjlCNjBUTTFRWklqNDBpZWs4cHhmTnlNVEQxV1dzSTc0cXZMWHE0?=
 =?utf-8?B?UGZZelRXVkZRbjlLekhCMWlYbzFJT1V2UG5hOWowVmJwM2pRM0ZLdkQ1UE5q?=
 =?utf-8?B?YjFKa0R4NDh2eVF5eVBkRTNGcnZYOCtvTFBab2haaUNPcXU3ZU9QRGhtU1hl?=
 =?utf-8?B?WEYyaXdRcnpGdjZLUHorWGRxVjY4VmNjTXo5Sy9MRjVmQU5uVFdNc2RWN1Z2?=
 =?utf-8?B?QTRjVWduVkNOL1laTGpnT1BodlRwdFhxOVRHYzFzNVdEcmlOY29NOXJLenQ4?=
 =?utf-8?B?aDZlVWVMVVJzYXViL1Z4NzVlaUxUT2RwVDVFR0h1VlVnVFp1VXBNbGFqOWxs?=
 =?utf-8?B?d21Fd1h6MkVwNFVpNnhCVjBJcmpvU3h3M3RZOHJCeis5dXF0Vjhra2IvdkNi?=
 =?utf-8?B?TmRrbnRsZXo1SXVVMGtwWFJnMml4MHE2ZlJ5Y3pNSHBPVDlERHBJcUVLbzdo?=
 =?utf-8?Q?nB78w06AkP+dEk0upg+Wi8OQr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b4f1c6-f3ea-41ad-8f48-08dbaef2b31d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 16:02:41.4504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9bq3/EhTHrTjuRKoJT5XvCHHZah2TI3bREV8vUH0E1SiTIdyPDMEbpyJXd7QxBv8SiPQqfK7YrrQ82vuu5UWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7185

On 06.09.2023 17:57, Nicola Vetrini wrote:
> On 05/09/2023 10:33, Jan Beulich wrote:
>> On 05.09.2023 10:20, Nicola Vetrini wrote:
>>> On 05/09/2023 09:46, Jan Beulich wrote:
>>>> On 05.09.2023 09:31, Nicola Vetrini wrote:
>>>>> Given its use in the declaration
>>>>> 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
>>>>> 'bits' has essential type 'enum iommu_feature', which is not
>>>>> allowed by the Rule as an operand to the addition operator.
>>>>> Given that its value can be represented by a signed integer,
>>>>> the explicit cast resolves the violation.
>>>>
>>>> Wait - why would this lead to a change to BITS_TO_LONGS()? And if 
>>>> that
>>>> was to be changed, why plain int? I don't think negative input makes
>>>> sense there, and in principle I'd expect values beyond 4 billion to
>>>> also be permissible (even if likely no such use will ever appear in a
>>>> DECLARE_BITMAP(), but elsewhere it may make sense). Even going to
>>>> "unsigned long" may be too limiting ...
>>>>
>>>
>>> You have a point. I can think of doing it like this:
>>> DECLARE_BITMAP(features, (int)IOMMU_FEAT_count)
>>> on the grounds that the enum constant is representable in an int, and 
>>> it
>>> does not seem likely
>>> to get much bigger.
>>> Having an unsigned cast requires making the whole expression
>>> essentially unsigned, otherwise Rule 10.4 is violated because
>>> BITS_PER_LONG is
>>> essentially signed. This can be done, but it depends on how
>>> BITS_TO_LONGS will be/is used.
>>
>> It'll need looking closely, yes, but I expect that actually wants to be 
>> an
>> unsigned constant. I wouldn't be surprised if some use of 
>> DECLARE_BITMAP()
>> appeared (or already existed) where the 2nd argument involves sizeof() 
>> in
>> some way.
>>
> 
> I think there's one with ARRAY_SIZE. In my opinion this can be resolved 
> as follows:
> 
> #define BYTES_PER_LONG (1U << LONG_BYTEORDER) // the essential type gets 
> from signed to unsigned
> 
> #define BITS_TO_LONGS(bits) \
>          (((unsigned long long)(bits)+BITS_PER_LONG-1U)/BITS_PER_LONG) // 
> same here

Except, as said before, I consider any kind of cast on "bits" latently
problematic.

Jan


