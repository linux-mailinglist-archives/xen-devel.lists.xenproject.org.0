Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236D83BF5B3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 08:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152879.282424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1NfJ-00073E-Rt; Thu, 08 Jul 2021 06:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152879.282424; Thu, 08 Jul 2021 06:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1NfJ-00071L-Oc; Thu, 08 Jul 2021 06:37:41 +0000
Received: by outflank-mailman (input) for mailman id 152879;
 Thu, 08 Jul 2021 06:37:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XUKi=MA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m1NfI-00071F-Ql
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 06:37:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af483e02-32d8-4479-9171-94286c9c3905;
 Thu, 08 Jul 2021 06:37:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-i6Sl78y1O9q5FFSMDd1U-g-1; Thu, 08 Jul 2021 08:37:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 06:37:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 06:37:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0039.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Thu, 8 Jul 2021 06:37:33 +0000
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
X-Inumbo-ID: af483e02-32d8-4479-9171-94286c9c3905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625726258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/kSj1tXjJ7vYVzsCUDen7mAWc2/k5eNogbkEDG9GK4=;
	b=mp9b1t9cgD/mb/VJzClLBe4uN9DQ+gH7C+EEa2bSoPdZjjOwDPtE+e5p6s1W67Lzm0+Ml5
	Uhwxo8QWWwoHEOtHXAm3IY+uGbBttL+Imb+tP6Aa8HAk0KY550ZYi9MpFq/2TbsN4bVDQK
	cnQXUNTo847GAUVEeRuMwaoN+G8D4GA=
X-MC-Unique: i6Sl78y1O9q5FFSMDd1U-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBPdQQSUT/f04poBiESzn3XkN/SbstgM/nOTj33bGzKmTzBVes3bvKSPmuCfqN+PWF/bcWNjAlONQpDqsxPyolCzoggZdAFYgQTykpn85uwICD40ysnK3gQZEg8M6+ZsmqfaHV2EYq2RsEEaTBA0fHd4UpIiUgYkmevbFgqMnYDQXbhF1EB8lhMhEtP7wWX2BjocgEsoa+Gxc2+3F7nOgjDy+THVNwE1Jw3aVP52q/ypIIUBjAw0b1ALbuBUtqcSI1HvGB+mzRs6rIota7Iw9pYkl0qgvpCE7V9k2uFO7jxj9zuYl/E15lTWrTee88WfOIRNUfk6xnRvF8FPsUFkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/kSj1tXjJ7vYVzsCUDen7mAWc2/k5eNogbkEDG9GK4=;
 b=dZrAqqsoM72rDYx32dg0FZ2RzR6H/Yydr5wWONPjFGPrdsz5RZB21MkxclMMXB1aSR+zraCYE2auBGU72XGiRIKLTrzuEN8hJ2Dd9zd/bE6oHizxTPe5h8POV4qTDm5mozD66MSJIRc/6zLxGSw9vHBm2W4QFhs4bXNEAygVMl/hhHjUudNA4Q+T9a26fU4hqlig7shm4JYQ1PQe9bMv15qIAmogb9mD/6qLx3qBqhGg9hyKta0I8bB/OJXMPZle7gbBVFHC4LWRom6p6ZJTW6+bYUVwTMQF15B0eQOzpToabwKtxJGzhBVhFPlttVC6prmmeG/bDOGytVgtKnQ6bQ==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a9dcc69-385a-eda5-6974-cb962ae62601@suse.com>
Date: Thu, 8 Jul 2021 08:37:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <dca55162-ec2e-682a-824d-b657a6407249@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0039.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0496e8e4-f5a7-4bb0-d7a5-08d941dade59
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73606589C82195C039B9CA6EB3199@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t/7Q9m+JE7JqNl+bSvJeZh0aC9FkViIj3OWF5ZF/5Vp+f81i07uzBF0QK+Sbtc2zigoxMIlg29hbgZyoA0gvfEZHWtUkjADKK8ZivChUln0AKV3Q55OTexxTWknifBZBWO+qsiBo+1xsEFKijOrdPv7sMAttVu3s8kWn7HuX9Le7LPM3xgMCY8150/mtiPb5Rc94IDFSXwEQWStU7hWD+KJsJngFONEMr15uv2afcUULMTIKP8qAwLkJo+ow1Hu81GiSbuL00mTDS1Dc1yn3HyAKaQCxFu0FFrkOCeK4gLDmc5HilvIL3YbQvyce9P4jkfJkmAK5v91IhvBmqaUOjWi3LnbGjrx5ycpGigD7WYoKpApni/aHhZ0RaoYCJE2vwH7HrwsITK2MKrAAnJeoGupOwMEzQMCDQ7P/hZ9C0tcA8GgrfQQwzA1caZ2HFofSAPEE5iGfXOg3wBdO7KSyXrY/bs5tKyCnpzjAbAP7tzxe6Lv08pl9KnZ1+x+b8vyD33+D/4SPfGzM+cLQlM6NEJSVRDicNyLTeoWqa8OSzcNDt0hrA+cazqJFYIm7Z/OHSxbuTN35I4crmJAcL/56PXjnFNO8JH4oZFc/YiFgHL8r2mbvrVy8ugeEIWJtAIzGyrVllQ02kioqDJBMd2C8KlboG4ZYiMwsmTx7IKNYo1aFGXa5yv2XNJEis2FVrNSEnQTrTSDTs2gz5GDNonlh4e/53+FgnbkBTR9jb8GAI58=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(136003)(396003)(39850400004)(6486002)(26005)(6636002)(2616005)(956004)(5660300002)(6862004)(186003)(16576012)(8676002)(4326008)(37006003)(2906002)(54906003)(316002)(66556008)(478600001)(31686004)(66946007)(53546011)(66476007)(8936002)(36756003)(83380400001)(31696002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUNkRTRJNXQ1d2psWEFxdG8vb25PZjRrMFdVODZZeVptOFhlMDh1aGp1R3Bj?=
 =?utf-8?B?OE5pUERETTNHc0poUmhQR216NHdVUHZPbDU0Z3dtbzhYSnhObEVlUHJEdGlS?=
 =?utf-8?B?WXplb08zMzRGRnZrZGJCcFBaM3Y5ZEFiaDQ3NmZOUktQVWZZQlpENXNjc0py?=
 =?utf-8?B?aVE1dVk2ek02d1FqSWVISFlWWWdENWtxT2JObEFuK004SmRGUTJJNHE0TzFl?=
 =?utf-8?B?VXl0THpwVkVnakgzeEZpMkNwV2FlLytZajdYUHcvamZ3ZXFsWkQxbXJZVjVt?=
 =?utf-8?B?djNwTU1OaGlseVVRQldDTWJ4OGloVkpLZXdpSEFNb2xadTBLbE9xNW1GSjZj?=
 =?utf-8?B?QXc2YUVuZTl5WjhWUHBrRUNheFF2RkNYYXpnbE9Xd2UyMVZUeWcyMTMxclhM?=
 =?utf-8?B?djQ1a2R4SDRLa1FGOXlJUnpBRFBSS0dJak5YRUFoNEoyUEFiQ3pBcXo0c2dT?=
 =?utf-8?B?SWgwNW1icGNzQ0dpQ1dPTEE0aGhJSjRTMDFoQmJyZk55NlZ3RU1ibDdSUlg4?=
 =?utf-8?B?N1lmVkxrUXMzRVN3bWMrWVkxL0F2dFlCTjZlTytKZVhld1FYN2VQYU05WHp3?=
 =?utf-8?B?VlVrOVpURHhiaEFGUlNUVDNiUVVNeG1vYi9pWEhhVXhKMWxOUTNvRHhvbmRV?=
 =?utf-8?B?bVcwenB4blNlQ20rUDRNSG5IaEs3My85TzZBcFBzZHZiS0k3SmpsbkNudnJ0?=
 =?utf-8?B?T0UxUElOMHQyOUppbUdCY1RQMDR6N1R5WU11emRZT1krVFd0NGR2R2Fzc2NB?=
 =?utf-8?B?ZmpGZWNhU2gvWkxlVERiWU5UM0hsU21NME1rOE9tbkR3ZjBxMjBaYlZZdGIw?=
 =?utf-8?B?a1NZRU9OdmRFRDdhVVdkak04SWNRRFRlbisxQVJGMmQ4bXZZZG1MbTczRURJ?=
 =?utf-8?B?VXlZZ3BRRi80MEwyc1lLR0dZWmhENlFpeFZ1ZG1SbVV3MUpnMm9VUWFZeWM2?=
 =?utf-8?B?Sk9zaUhUUkN6dGVrdVVmZW9LTXd3WnFjNGYzLzdBRUlnTWs3SXpSK25qbWtq?=
 =?utf-8?B?WkhMUmxJRmw3bUlMQXcydCt2Vi8rWWVUeFRvbnM5U3hYaDMvWlgzeTcrNGJL?=
 =?utf-8?B?TnFqVnhnbUM2UjZDUmNZcHFaRThrTC9pU3Y1TFREYkZWU1A0OFlIcHhJUFNX?=
 =?utf-8?B?QW0wZHVsYStYeXh2YVFXTjlQeERyRCtvN3pLM2xkNFFjVzRqZ0VtVXVoTThU?=
 =?utf-8?B?dEZJRUhvNW1Ick9TM0tOekh5VkRORjJ0dm1mcXY5Rk14VFdIaTdYNi96aEtI?=
 =?utf-8?B?UjN1YnZpMXBia1RBby85alFrdVd2UTJkRkVob3NtbjZSZXJQeHA0cXZjUkRR?=
 =?utf-8?B?YjBXdHppV0pUMHFMY2grcmw0bzRIbjMwdCtjeEhxMS9WZVBLN0loZFVqeVZt?=
 =?utf-8?B?cUVuWWdlZFVWQUlqK05aWG4wK1VvVU1haEVmR2tIUGxscXNtUUNLdVNHZktO?=
 =?utf-8?B?cHB0RFRLOUZVdmJBYmZocW9OV3JadnoxL2plZWpUNDNIdVRZMHEyNTN4ZjJS?=
 =?utf-8?B?OEJJL3BpWnY2Z1ZrL0pXdVp1MzJWWVRjTWFJSzV0d21qWk8xRDVxK0srZ3pa?=
 =?utf-8?B?L3FCdmUxWmdpV2tZOE9TT010RmE1M1hqc2JRSUNLWXpEL2hxM1NnWE5rYU9U?=
 =?utf-8?B?VlBqeTdHM3d2cVZWc2R0VW9BcS9DaW1kdUprcHBxd0E5WHhQc1FiQXNRTHkv?=
 =?utf-8?B?bVlCUlNXajNLTXg2Q0JDZ0FYUENER0VtVWRTV0g2TlpmdlBEVjh2RmwwT0Mx?=
 =?utf-8?Q?mH752lUbTOGZWeQeGLwRgeT0mHH9IhmLQYJxbUz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0496e8e4-f5a7-4bb0-d7a5-08d941dade59
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 06:37:34.0350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8IJENMingx6r0rJhp8n8AlHpwP0uregUxA9rp5LTHFZny6oIFarRBKDBsz7MAiZTs6lVyDzt3GsipRNdACHTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 08.07.2021 07:47, Juergen Gross wrote:
> On 17.05.21 17:33, Jan Beulich wrote:
>> On 17.05.2021 17:22, Juergen Gross wrote:
>>> On 17.05.21 17:12, Jan Beulich wrote:
>>>> On 17.05.2021 16:23, Juergen Gross wrote:
>>>>> On 17.05.21 16:11, Jan Beulich wrote:
>>>>>> On 13.05.2021 12:02, Juergen Gross wrote:
>>>>>>> @@ -1574,10 +1580,16 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>>>>>>>     	spin_lock_irqsave(&rinfo->ring_lock, flags);
>>>>>>>      again:
>>>>>>>     	rp = rinfo->ring.sring->rsp_prod;
>>>>>>> +	if (RING_RESPONSE_PROD_OVERFLOW(&rinfo->ring, rp)) {
>>>>>>> +		pr_alert("%s: illegal number of responses %u\n",
>>>>>>> +			 info->gd->disk_name, rp - rinfo->ring.rsp_cons);
>>>>>>> +		goto err;
>>>>>>> +	}
>>>>>>>     	rmb(); /* Ensure we see queued responses up to 'rp'. */
>>>>>>
>>>>>> I think you want to insert after the barrier.
>>>>>
>>>>> Why? The relevant variable which is checked is "rp". The result of the
>>>>> check is in no way depending on the responses themselves. And any change
>>>>> of rsp_cons is protected by ring_lock, so there is no possibility of
>>>>> reading an old value here.
>>>>
>>>> But this is a standard double read situation: You might check a value
>>>> and then (via a separate read) use a different one past the barrier.
>>>
>>> Yes and no.
>>>
>>> rsp_cons should never be written by the other side, and additionally
>>> it would be read multiple times anyway.
>>
>> But I'm talking about rsp_prod, as that's what rp gets loaded from.
> 
> Oh, now I get your problem.
> 
> But shouldn't that better be solved by using READ_ONCE() for reading rp
> instead?

Not sure - the rmb() is needed anyway aiui, and hence you could as well
move your code addition.

Jan


