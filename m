Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ADD3BF5D1
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 08:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152895.282463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Ntp-000210-Rg; Thu, 08 Jul 2021 06:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152895.282463; Thu, 08 Jul 2021 06:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Ntp-0001yJ-OO; Thu, 08 Jul 2021 06:52:41 +0000
Received: by outflank-mailman (input) for mailman id 152895;
 Thu, 08 Jul 2021 06:52:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XUKi=MA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m1Nto-0001y6-M2
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 06:52:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83b7014e-ae78-4a1d-9b8e-8e9f13c8cc68;
 Thu, 08 Jul 2021 06:52:39 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-hrloLkyTMG-oaWVi1Q547g-1; Thu, 08 Jul 2021 08:52:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3117.eurprd04.prod.outlook.com (2603:10a6:802:6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 8 Jul
 2021 06:52:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 06:52:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Thu, 8 Jul 2021 06:52:32 +0000
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
X-Inumbo-ID: 83b7014e-ae78-4a1d-9b8e-8e9f13c8cc68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625727158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MP+NHmOhOR9FUeuSZLn1wOVcE4VHHx3OuaTMn1B1Ufc=;
	b=I/qx2XpsolWTc/wgvXX+S1m3g8w3/G+80g+z4b/AwB0XJUgiwlXSL3iL1YuQwsFNbt/l+n
	tW5QEhMJy4dLLUHOmrIQgwpcBlHGk1nrkUoD88Wvk12NAXxH5DoCPCJJS8PrbdxmvFjL5f
	dJF4rfD0PqESsNOYbWhfysYu5R8xpyw=
X-MC-Unique: hrloLkyTMG-oaWVi1Q547g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d71zlIvzTdLpezd8srRq6i9qV61chMF9ODQbVTQVzJe2mAVDcB0+GmEvCbnu0OxjIlaiV6UjZ91JVlMRr98rtmPgyTFYZ2AIUoKI6CuoKoSmQWZ7laCLTN8OJBYZp02e1UF7lvTusPWxKC69RSWRShoXyPGl4fcDfftJTlIyNF4bkDVM28tu5HETXDHmTKQO5+bP0CZvRbIntvhBiFpJMnJOvvayRdJJb6OAFbHEoFcU6vzc2Jd7fsp59mm1B7290uxP8xdKMal7aNkuDYUkM62UAFn7plEqkIMAKATXE4j0FlEDIxLBHA18mw+69AAPazK/GeflJKxM83d5wwojkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MP+NHmOhOR9FUeuSZLn1wOVcE4VHHx3OuaTMn1B1Ufc=;
 b=l46XNCM4JG2xHHqAy5Mrf2CiTau/4iRH9uLUy6vVHe60Kwb1geSwoV0WaHRfyFZw1HPUb3wf3LLGiCTqXbolfWFthrjc8CmuFCKcPhTq/bXs40LsJnOuR9CWkxthL+seK+kYzek+GYCDf8M64/ffZlpyh8UQYK7mcVzzJg0kNJzIclbE7mcVck9xZj+qpxxIy2WRc6GYECUS4a+doBKeWnP+RaC7yzruJ518dyBsHfO2sQCky9lR/122m9pCE9BmXeNXZlrj0u4WA3ZvG0gamACKurM1AAztQRkN/7PO+5yOyuxwHJoKKEJyz6l1zSLmX4pEkhcq3oo8Vsmi7Zbmhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 4/8] xen/blkfront: don't trust the backend response data
 blindly
To: Juergen Gross <jgross@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-5-jgross@suse.com>
 <315ad8b9-8a98-8d3e-f66c-ab32af2731a8@suse.com>
 <6095c4b9-a9bb-8a38-fb6c-a5483105b802@suse.com>
 <a19a13ba-a386-2808-ad85-338d47085fa6@suse.com>
 <030ef85e-b5af-f46e-c8dc-88b8d195c4e1@suse.com>
 <477f01cd-8793-705c-10f9-cf0c0cd6ed84@suse.com>
 <dca55162-ec2e-682a-824d-b657a6407249@suse.com>
 <5a9dcc69-385a-eda5-6974-cb962ae62601@suse.com>
 <7f606c27-173a-542d-406d-196dae784edd@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fbd099f3-4d62-e0f6-1bad-6d317428051e@suse.com>
Date: Thu, 8 Jul 2021 08:52:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <7f606c27-173a-542d-406d-196dae784edd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 560b950d-fd9c-4978-3f35-08d941dcf63b
X-MS-TrafficTypeDiagnostic: VI1PR04MB3117:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3117C4739CA41DD27DF6E003B3199@VI1PR04MB3117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A/9we6e9+DV4TdluH37oUdB9HVshATA/q/Y0PRf3604XuM4LBfX2xDSrsxVUgTvpCHSTAyp9tKYweNBLOPxzg81eOj2M0orkxr/vuaoy7O3z7AHQE6stXjl2gZqbCwTeNwJRnDGS8wrFpCIgDbTI7Ok7g3N0j7JHJpF9VsE8xVyBTGUivHsLJiX85NdGUSk/wxsWOjwJOuGwTNZf5Jn0Px6KxWmUMLqSf463M9CcdhFtAh0XNmSbE9xbAyJseo85YOB7v+Xu/ArNP6ErTUfPWZExrpVOi9YR4uDYFap7purtmqTYeu+H0VZg8MQysnYa4C/Wm24oG5PrKXRfg04r5wpm6KNpC2Nsd+t+WMFo4UHw7gWmpTryWb7Qrx1u5wHjH53gznkjNpA50jD2xjBEI0liZ4xkE+LzGB+BdDv+J56IJizu8uBInUekNCZRFQV5YKYc+BCLs/jYmANcZwjlvx1uRsczopfH7zHDHrdR33rlCVmQV4QN9pIJnfadFNs+QPbjXZYei1O04vPmOoBRN39qBQ+mBaxfyi/WvnilBbiBSqRv9lmPmyXeLfHfFfu3XS1s0vwsVTCkdA5vvF5KDsUCDgWBkWGFejMXrF655es8SP6S8RfcM1mXdLo/yIBs+C/ILQ9FrceKs8zn3NyO8DKvrk3Bymi8/wPWdVLMxupJB205CA/I+woiN3QqRlzd6qq5WKEZbXlUbG8eaPIGYSYoWMTV3t9ArEbie83+3bUudg3G7+xcZu5IRVoLZZh6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(136003)(376002)(39850400004)(54906003)(8936002)(2906002)(6636002)(2616005)(5660300002)(83380400001)(956004)(66556008)(36756003)(37006003)(478600001)(31696002)(26005)(316002)(8676002)(66476007)(186003)(16576012)(38100700002)(66946007)(6862004)(31686004)(4326008)(86362001)(6486002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y01mdVZDV2RQOU84Sk5mcmxjOTl4V1NDMTBjTTk4eG01RXk4bUNlN2RWVEdl?=
 =?utf-8?B?ejQ5MGIrejlIc0FvUW1wa3BKaUhsWC9PLzQ0UUNacVdZWm00UGducURxWlY1?=
 =?utf-8?B?Q2Ntc3VuOW1CNHdvZThKNVdqZmZFb2s1RlV4Mzh0REs1dDlhSFl1bGxrNVRQ?=
 =?utf-8?B?VSt2V3Z4TmNyNTBVTDNuYkxNTVdoMkh5Y0toWTdOdFV6TW92a291OUc4dzJC?=
 =?utf-8?B?T2lwVDg0ZS9ITlhRdkN6SVN5RlRsM0k1dXdBU3phR0JEc2xvL2U0bS82MTZB?=
 =?utf-8?B?MU1MSFpXRWd1V1hyOWorWnJWMmQzOWh0QkZCY2E1dElNTXkxaFUrbzVpajNW?=
 =?utf-8?B?QVRwV1lyaXlJQTVvODRzbmVUUzRqWUd2VTVISnpEUEJnTzFSZmNWNEpPOXM3?=
 =?utf-8?B?UW96cFZVcUhDMktKT2tDSHJFMUgzb2taQW9FQmVxOVdnTEFmbXh5OTRKdkRV?=
 =?utf-8?B?U1ZPMTJ3WFRkNTdUS0pGK1FuaTRMY0dma3N3dDJ0MXhzU3pDQTZmVDR5emh5?=
 =?utf-8?B?Unp1dGFHN3o3MnNsV2I0NTBnQzBmZm4wQU42ZkJsUUx2cGFkOGxpVlVaR01B?=
 =?utf-8?B?L2RUdWUwY2VrWTRQcEpOazFRSmNmOEVmQy8wR2tqcG9RS2hmVE1YVG1nL1Iw?=
 =?utf-8?B?MkY2ZUVkVmsxV3hGeWlmSFhZYk9jSkVUWGpsVGFXaVVsMjhvR0Fkd2J6b09v?=
 =?utf-8?B?OTdlUWVkZ2lWdE9aaGhLYjZpSTRxRlZzdjdKNThMcjk3eG90MjRRNFFYakRG?=
 =?utf-8?B?T2FkY1pPRGRXVktNeXEzVGRSUnNGVjUwL3kyK3dDZGdaNzNlb0Y1UHNzUXJn?=
 =?utf-8?B?SzJQNzVMVm1JbG1wcXFjcTJUMDlFQXMxNDYwdjBtVERlazh3REdQdEpyN0l1?=
 =?utf-8?B?TFdLVkZjMGlnWjdCdVFPQ0dLeGRJU0puamEvSjcxS1B5Nk5GdGVQSGg0a2tD?=
 =?utf-8?B?NmVNN2hpK0NWMW9mcTk5TzJzaW96K0tCOTRoYkhRM0lxdHc4V1F4RmNkaWg3?=
 =?utf-8?B?dWVvSzhqYlVOZ2NORUpRa0ZPVVg0Nk5oeDVlK09YZlc3TVRMWlhqQStzcnYw?=
 =?utf-8?B?NmNQNTF5Z1NPYXVkZ1Q1aFk0LzdKL08xVDBtT3ZHS25EOUlZME1oSnQzTXlR?=
 =?utf-8?B?YnpURUQ5UHVVZUJZRGM2YXpuTVNVOFc1NW9ROG1RT0F4Wi9PQzF0bTRoV3lR?=
 =?utf-8?B?SFcrT0pRN3I2aGF0ZGtka0x2WUp2QXRyb0RNY2JxQnZ3OFF3NmtJaTRyZ3cr?=
 =?utf-8?B?UXpFU3o2aVpTaHhsQjNyVmphS05TbDFWeG12djZnWkFobG55N0drU3E3YXk4?=
 =?utf-8?B?ME9RMXg1YmlBZndEQ3pxQzY2T0JLWVEzUDMvbkN2OXRMSHVBQ0Fjc0pvbW5U?=
 =?utf-8?B?cS9IczE1Q01JM1h4ZzBMODd4amsxS2V5dnpyRmdIcUp5ZERqY29BcGJHUU0x?=
 =?utf-8?B?K3VuWmZRbnJoaDlzMnhUd1hUMlZkdWFNd0gvSkhkdHlkZW96cnh1b3FTZTYy?=
 =?utf-8?B?eDd5VVpiYXBrelZyZ1BZc1VTMTFCRE52aDdZRnljWGU0L0l1U3pKeUhWWXBw?=
 =?utf-8?B?OXAzWTNVL0J3bGdhK08xMmJjM01reURET21tQStpM085ZmlyMWE2RjAvN0ww?=
 =?utf-8?B?VmdJc01BRnZmcTBPVlZXNW9XRlpBQ1Excks3bFJSaE1QUUMzV21PbWx6cnV5?=
 =?utf-8?B?NHZWeXFVckV2d3Nuek1iVWxnbEVmUE9RU1YvZ3FsTlBlVU5oWEVFK0tLUWxW?=
 =?utf-8?Q?/U2uDBzUNCHZRsB0iLbb6ALgbrbzmk1F4kLbb33?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 560b950d-fd9c-4978-3f35-08d941dcf63b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 06:52:33.0923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vli2JyaS8h1sMq4yORG4hHk8vEMxMDx0LvZ/ijBnF3Em/SFo+cdZfHCluyNhWk04C8yi/DZbtdcoOp7D1doGSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3117

On 08.07.2021 08:40, Juergen Gross wrote:
> On 08.07.21 08:37, Jan Beulich wrote:
>> On 08.07.2021 07:47, Juergen Gross wrote:
>>> On 17.05.21 17:33, Jan Beulich wrote:
>>>> On 17.05.2021 17:22, Juergen Gross wrote:
>>>>> On 17.05.21 17:12, Jan Beulich wrote:
>>>>>> On 17.05.2021 16:23, Juergen Gross wrote:
>>>>>>> On 17.05.21 16:11, Jan Beulich wrote:
>>>>>>>> On 13.05.2021 12:02, Juergen Gross wrote:
>>>>>>>>> @@ -1574,10 +1580,16 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>>>>>>>>>      	spin_lock_irqsave(&rinfo->ring_lock, flags);
>>>>>>>>>       again:
>>>>>>>>>      	rp = rinfo->ring.sring->rsp_prod;
>>>>>>>>> +	if (RING_RESPONSE_PROD_OVERFLOW(&rinfo->ring, rp)) {
>>>>>>>>> +		pr_alert("%s: illegal number of responses %u\n",
>>>>>>>>> +			 info->gd->disk_name, rp - rinfo->ring.rsp_cons);
>>>>>>>>> +		goto err;
>>>>>>>>> +	}
>>>>>>>>>      	rmb(); /* Ensure we see queued responses up to 'rp'. */
>>>>>>>>
>>>>>>>> I think you want to insert after the barrier.
>>>>>>>
>>>>>>> Why? The relevant variable which is checked is "rp". The result of the
>>>>>>> check is in no way depending on the responses themselves. And any change
>>>>>>> of rsp_cons is protected by ring_lock, so there is no possibility of
>>>>>>> reading an old value here.
>>>>>>
>>>>>> But this is a standard double read situation: You might check a value
>>>>>> and then (via a separate read) use a different one past the barrier.
>>>>>
>>>>> Yes and no.
>>>>>
>>>>> rsp_cons should never be written by the other side, and additionally
>>>>> it would be read multiple times anyway.
>>>>
>>>> But I'm talking about rsp_prod, as that's what rp gets loaded from.
>>>
>>> Oh, now I get your problem.
>>>
>>> But shouldn't that better be solved by using READ_ONCE() for reading rp
>>> instead?
>>
>> Not sure - the rmb() is needed anyway aiui, and hence you could as well
>> move your code addition.
> 
> Sure.
> 
> My question was rather: does the rmb() really eliminate the possibility
> of a double read introduced by the compiler? If yes, moving the code is
> the correct solution.

It doesn't eliminate the possibility of a double read, but (leaving
aside split accesses) that's not what you care about here. What you
need is a single stable value to operate on. No matter how many
(non-split) reads the compiler may issue to fill "rp", the final
read's value will be used in the subsequent calculation. Or at
least that's been my understanding; thinking about it the compiler
might issue multiple reads into distinct registers ahead of the
barrier, and use different registers for different subsequent
operations. While this would look like intentionally inefficient
code generation to me, you may indeed want to play safe and use
ACCESS_ONCE() _and_ the barrier. I guess there are more places then
which would want similar treatment, and it's not a problem that
this change introduces ...

Jan


