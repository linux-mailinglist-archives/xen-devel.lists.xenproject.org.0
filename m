Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D0F599C16
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 14:40:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390304.627657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP1Ht-0005HU-7y; Fri, 19 Aug 2022 12:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390304.627657; Fri, 19 Aug 2022 12:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP1Ht-0005Fh-49; Fri, 19 Aug 2022 12:39:45 +0000
Received: by outflank-mailman (input) for mailman id 390304;
 Fri, 19 Aug 2022 12:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oP1Hr-0005Fb-Lj
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 12:39:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff4670d5-1fbb-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 14:39:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8466.eurprd04.prod.outlook.com (2603:10a6:20b:349::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 12:39:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 12:39:40 +0000
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
X-Inumbo-ID: ff4670d5-1fbb-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFANdjWGdWVBK04ZnDb2HHJtNrqyjoegC2VrazWzytJV1lWqE/WzfH9FY+10Q0CFE3pihF/7QXAh9uxdEnKNuAY8JeOab0otl3LVywCXKAkmzj20jibbx7L+TsOAc3Z55esUgN367ih/iPIx+I9LhWe4I1HtksqiGJVdjsBFSp8Vk/5w5M/6SKUuY463fHF146p4QCJr67A/HJB3s0EXQgkYQxtXBo75SFtQ0wrE6xwn7zWk3F6sv5IoLbxe/svfsyRJMHDF85DvX9eqBHOyMLMRcbm9ohWgD8mfAuxW09rHtCCfK9BgmVTqNXJWe0H/5o7Fh3JBRP8UvTWqAXWwGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ur+7GJqhe6YFw7xQ5XmBUTfifrq/LWJ6ea1rnL8x85Q=;
 b=Af7RSbkp1O9oVhIPQm8L6BOXnfzvWxnawrZFFt6EUmkQDKu+EwtNzQyZtz9kMU2WZExfCBv1jTpMrpQ/90xbLt0wqwLa3uWMqqZugBs5J7SKygrvpS+VisPMg7XyW+WYFpzHAD2/dHjUXingMS+/XC9uXXA0Z9WVes8UL3xGCu059MgceeWo7JdywAIne69a0DvH4E1b+ryoWs4ijQs+1foCS1PExLS9/GBtvGUjSg31GMCbk8t2+tgTFfiQ+bD12qxk8cqZTbTtQDGw+m4GqFb0dW6BYxhz6e2v/gasHQhjpDdYHgpTpaL+0xB/VPULqY8oNznDQ4iAe4EbHLElZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ur+7GJqhe6YFw7xQ5XmBUTfifrq/LWJ6ea1rnL8x85Q=;
 b=ZNThUDvEOp/HxW0z/75UQxTc8vXQ6AftKc8w3lpch8MjDAtauWr4bGJKlQKwGoFAKQDrVhOrM91YC6UScysBIgiabeSklGkz++ZKRPqKLKtGoSkS8RBYeYZrT9LI30iNZshLJhrn315qin+ht1mCZ0hG38aqqvSt1uEGbbdwOwiC7iu/ru28p2ouat0vTwLZUJU830SxRg13txFCJjOo1JZPJzVt1lvuFlAWjlcDQHnh3t/oOO7tSt9nYs6uRwt+CNXvrfvlNpNLAlv7Q4G2bFGlzOYcTWdQXcC+Og2tn66eyGwjBDgRCmDKY5T1eQgdHZXHzDrr7Gjvqne+fIK3vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f392dc22-b23f-d27c-18dd-d221b8033d8c@suse.com>
Date: Fri, 19 Aug 2022 14:39:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] Arm32: tidy the memset() macro
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <80abb94d-67d1-ef71-afbc-4d0bd9d8a557@suse.com>
 <PAXPR08MB74201D5D5741B9F19E3622A59E6C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8a80c79d-975e-3866-2419-f6ac5678060b@suse.com>
 <PAXPR08MB74202616BCE3EB6B5F13D8EA9E6C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74202616BCE3EB6B5F13D8EA9E6C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b175587a-5d76-4524-a812-08da81dfe285
X-MS-TrafficTypeDiagnostic: AS8PR04MB8466:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MdA2UjrL84M+rSj4OfqojZ4843pvaAQsb7ZxQfizAaWST0XqJdL5/NipR6Lo4hM+9su6Y/JzJ+5K4sKBxK9K2qMruIy0NW8Wpctj98U508lR4TVvWgbHVRE4csqd/Q9EdUw5Jrj5HOqVDXIEWfKNvCsEpKpglAfF1+QUjVfmiZp0GZnEea5FbbXE8+RrHgvAzuWVQkjaRGG0DXJ57ZhFsyIQfxHIoJoQJJiryU7FNcZTXRQJQBJp+aINJ/FSZQwW/LrhGAtWWwC6Omg4cFKJsc5waynYlp5G2jJxuAOuCs2JPAG05uGYFq7rOTEkkMwUeK8LmDzItW5Kwoaad+RQ0wGYa9BnKPKYf67HQdbW6m4CZvvK4zMIhb6TyCXW/NIhagOvQMV3DJtGXUy67jyJkc/hRcFbTK7ktQeRbkF39xEAzRgKbkYBWsTXgGiu3nOELrdt9TScg7+W67aTp+QFPQMDbKxA/sBe2GfIguOYhuagJGwocTAq8ltpff9ut1CG+xf2KmMGkoyMoa2ys9NQ6RyLyQ+vgIGTfBpnh8iz4PorgconTTs2Y6Nhac8kPNhql3nymlc8bKGmz2AVHbPX7FgkFC4r+b6Pss2/YMoYA1Lju8jxGpcUcpTgQ8/49gMYwz5VPUlMUP0cRP0eJ7B5ZdoiDVcBJ8takMMhX5CunbfsUYRwMzjZ1zJe9ESOPIcX767Kw9+GNwYs9cQQNMVBE0p4Q2nvrzHCwNZ6c6OeAoeVT4MkbdSOVkIOZEJ09i3zT1JHpKn3qK4wHRYyHeNZ5p7kOTp2PPeCVfxpUA7g19k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(376002)(136003)(346002)(39860400002)(66556008)(66946007)(4326008)(66476007)(54906003)(6916009)(316002)(8676002)(5660300002)(8936002)(36756003)(2906002)(6486002)(478600001)(41300700001)(6512007)(6506007)(53546011)(26005)(2616005)(31696002)(86362001)(83380400001)(38100700002)(31686004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTF2bjdobkpvSzQ5RDllWEw0by9CYTZZR1ZYZW9UaFdWVnk1bjFxTUtUaW1X?=
 =?utf-8?B?ejRzU0NFQWppai9FT1NVczVLRitlU0gvM1NiK3ljeVFhUURXVUV4UXNTbkN3?=
 =?utf-8?B?Q3NYRVJmMDBudmJRWFNXdTJZM1NiZEVIcHhFZy93KzhBYW5GaWtBbUtTRWpk?=
 =?utf-8?B?T3FZVGRIcVZHVHo2MDNwclYzRjhQYTRnSWY1S3dQWGJ2LzBhTmRJMGRRMmdZ?=
 =?utf-8?B?VkxVN2dFVVVHeHZ6Q01Zd3kzQjh4cGIxYW5sYk13b0xJVUt5MTNsSFdSL0tw?=
 =?utf-8?B?TGFOMUdBcjQ3Z0YzSzVjdTlGUnJhekgvb1pZb2lhMGxPN3lzWG1zU3JLV3Ry?=
 =?utf-8?B?TkR1cStEVEZxcVB2Nk51Zm93djVxMFByYUQ3UEJtM1p1V0ZENDZMMkc5MDhP?=
 =?utf-8?B?WVlqbzhTRWdBTjN2SlFCOWpNaFZKdkljQ2ZXTnBXaHc2Nm5sUzVNUHFLbjVW?=
 =?utf-8?B?Q2RWbnNrNzdiVDZQZFRmNWk0Z25VNDA1OWpKejZGNGRpZG5UeWxydC9rcm9l?=
 =?utf-8?B?WW5sc1N1aE5pTzI0dFBZK3dEeUx6OFdEYUtDQlhRQ1NMWm5CWWQyYkdnVjFv?=
 =?utf-8?B?Qk82UTJUS09ua3NvU01RSXBIbE5xTkU2VmkvYXRpbklDQll2RDh1ZTNqWnBQ?=
 =?utf-8?B?Lzhzdzd1dkRmVndtcnQ5ZkVvWldMamZuYVNOY0tPMExNZjBNbTlXMnBvdVU1?=
 =?utf-8?B?VXA1c3JhOXgwUzZKTFNHSnpSSWNTRDdWYXZkQUZpbnFnVmdFaTBVVktzSFJ4?=
 =?utf-8?B?TTBjTDhaYVRMVU15TW84cjRNQU1Yc3ppb1FHY3UvMnlGSTdvRTlscnI4UVor?=
 =?utf-8?B?a1Zxcy96RTJrUzlxR3VKSjVlV2hYdnFJSVhtYWdEd3drTmtOK0FkRjFxL21i?=
 =?utf-8?B?MHBHSkJOYjg3UFd0eGhPd1dGY1BEZWR5U2hpNk92ZkdueDdnbHFGYWpCU3Bi?=
 =?utf-8?B?Z0xiMXY2bXlpeitFQitaTUJuU2VmVTNZaUNoZWF3eE5DRXY4cEt0Ymh5NGZk?=
 =?utf-8?B?c1pkUjJKeDFHYzNrdUlSMEppQkllUDJkUFJqTGFSbFp3UE9pV1JoeVQxS0hE?=
 =?utf-8?B?azhGdC8zd3F1N1lYY2p3UUloY0dqNUx6Q0oySFVDUU1KZFN3Qk8rM1YyY2ps?=
 =?utf-8?B?TmcvMXJBaU94UU1OVzFJbVhySktBSXJkeDMrUEFYQVVmcEFvd1ZsUENGTjNY?=
 =?utf-8?B?dFMxTHF0UitaMVB2b1BydlB1YzUyekdSVDQzTUUvcUlsQzJGMnhjbW9MUGtW?=
 =?utf-8?B?TkhrNmdkMSt1dFNaaytLTDJydE1sSTN5clR0ZnBTV3VoYlJYUVNFUFlzOXAy?=
 =?utf-8?B?SEJGQm9DMUx5T1U4bml1OW54VXlkQXNuMk5lRWVKeDRoTkZoVXVQUGhMUmk1?=
 =?utf-8?B?bHlhdDE1SVIyd1A1VVUwNDhmT3RDZWNUUFFpbWNmZFpFTW4xM2NRT2VoL2Qr?=
 =?utf-8?B?VnBlRUlWejc5QkphbDdlR2JSTFptZ2ZaYmxFajRLZjQzVkVVODYra3hOemVi?=
 =?utf-8?B?bVVtNUV0U2ZWazhBYkk2cjRhbXhicnRUVHUra3d5NlRrU3c0cFhYclpXa0NY?=
 =?utf-8?B?SDVQLzBmTUJ0L0xUU2QzNXNlUzdSOC9mUVd3V3FPSkR6WHZsS09mMDRsZGgy?=
 =?utf-8?B?bVByVE5sNkNOY0dkckZuazNDSUVoeGxyRE92RW0xKzliRDNtNHZKL2EwOEdN?=
 =?utf-8?B?VUFqNnlpVzRoQTYzS2liOUhIMDJHOHVkUkpQNUpIL2tYMzdFUG4zTVhJTHg0?=
 =?utf-8?B?djV4bGhnSXBaejJNKzkzeGpUZ3RhR1hHUWhIUXdnWlcwYWVKZDlHdGRoL3JY?=
 =?utf-8?B?QnF1elBVM3hMVmlrM2JFaHdoNTNJWmYvcCtjcHVKMklmMERpeW9TQ2ZXODB5?=
 =?utf-8?B?SHFLQ3psTnRqNGhCTnYycENvSUZXa3RsWmFlK3JFU0hDdEI5QkdmamlNL1pq?=
 =?utf-8?B?WEVLcVE1M3NZZHllcGd4YzFlZUFoRVJrMkxYbEs1NTFISU5lUk5NMGZZWW5h?=
 =?utf-8?B?SjdoZWR1MlF5RjJDdFIxemZja1Nrd0FYUEc3Tkl1b2VuNFd1N3Z2L3o0UFRx?=
 =?utf-8?B?UjNYNlRPSnFDNXhYclVmcXFwRW94aFNNaUxsSEVGWU9rMWYzRUFjdEVKRk9I?=
 =?utf-8?Q?14YD2Qrv0HyVJg2gfBD4jaX1I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b175587a-5d76-4524-a812-08da81dfe285
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 12:39:40.7102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTRamPuLpDQvW0DvAduffb9SvJCcwp4Fuj4LWsahStDyGOE1VLkUqan8fYqrQEcwjbzr+/srENykmadKrCiFPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8466

On 19.08.2022 11:41, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年8月19日 16:04
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; Volodymyr Babchuk <volodymyr_babchuk@epam.com>;
>> Bertrand Marquis <Bertrand.Marquis@arm.com>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH 2/2] Arm32: tidy the memset() macro
>>
>> On 19.08.2022 09:59, Wei Chen wrote:
>>>> -----Original Message-----
>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Jan
>>>> Beulich
>>>> Sent: 2022年8月19日 15:50
>>>>
>>>> - add parentheses where they were missing (MISRA)
>>>> - make sure to evaluate also v exactly once (MISRA)
>>>> - remove excess parentheses
>>>> - rename local variables to not have leading underscores
>>>> - apply Xen coding style
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> I wonder whether "if ( n_ )" is really helpful: It's extra code in all
>>>> callers passing a non-constant size, just to cover a pretty rare case
>>>> which memset() is required to deal with correctly anyway, and which
>>>
>>> What rare case we need to use n_ that can make memset happy?
>>
>> I'm afraid I don't understand the question.
>>
> 
> Sorry I didn't describe the problem clearly in the last email. You mentioned
> whether if (n_) is useful in your patch comments. I looked at the implementation
> of the current memset macro, and I didn't feel it was too useful.
> 
> Then in the comments you mentioned that if (n_) is just to cover a very rare case.
> Does the rare case is memset(p, v, 0)?

Yes, albeit not in the form you've written it, but with the last argument
being a variable which happens to be zero. With literal zero, the compiler
would dead-code eliminate the construct anyway.

Jan

> If this is the case, I agree with you,
> memset itself should be able to handle with size=0.
> 
> Sorry again for confusing you!
> 
> Thanks,
> Wei Chen

