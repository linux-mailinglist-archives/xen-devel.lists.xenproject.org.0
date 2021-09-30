Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7031B41D76F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 12:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199709.353933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVt5Y-0000Xg-Ml; Thu, 30 Sep 2021 10:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199709.353933; Thu, 30 Sep 2021 10:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVt5Y-0000VU-JK; Thu, 30 Sep 2021 10:14:52 +0000
Received: by outflank-mailman (input) for mailman id 199709;
 Thu, 30 Sep 2021 10:14:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVt5X-0000VO-SI
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 10:14:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 884d1abe-2b90-4b41-afef-e59f42db7ffc;
 Thu, 30 Sep 2021 10:14:50 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29--E0JaUw1P2uXIiAHILdtRQ-1; Thu, 30 Sep 2021 12:14:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2960.eurprd04.prod.outlook.com (2603:10a6:802:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 10:14:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 10:14:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0010.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.16 via Frontend Transport; Thu, 30 Sep 2021 10:14:45 +0000
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
X-Inumbo-ID: 884d1abe-2b90-4b41-afef-e59f42db7ffc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632996889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oxW123egbkz55sKIIo7VKXycxJ4eEGt5zqs0Rc6FPqQ=;
	b=apvIhRlCDQQzrgUK4oPIt9f1MkOpuI7/6KreftvTaYjOYN6fP7KtBy0a47hGIx+QSFXsX/
	BeoPjA83kXVrFMBy5bxbL2PfHUIyqHNi5yKlgMnSQbzdsgCKCCtTMVL/wnBq4e/J+UwtmQ
	hF/pZ2oq2Qp4dqIEjBsy4JtCIody+Zo=
X-MC-Unique: -E0JaUw1P2uXIiAHILdtRQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCjOjihQbz5NCR0p6FU3MT4MlBUSzOxz6oypjvy6MQ+5IRLG6xNx4OcVBbseVAbYZ/BlaGhXweK8vbtxxz43dO6GnH3qu5DuxX1jPcxkjhp1Uip+vd/ODZv1nGK9IwOCuMxB4gIrtaTWUKasEMQ5PdRbNv2kcxv3nbXLyALVU9W5Xpber+PCeIwmpxmTLKSSECHiUFInWZlfN3sEEmKVPrR1kc6jxt0OSeY4E8JH76F3wC9QAvHIBy+uV0FCcFdlDHYytiCkPh7yAZZFCmbfZJT4pRaVKAZstOfqs9nd87vXdQ4iJ2UHTXQNasPSJyGtnN3eFyNvSXJzTQNSkeZuhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oxW123egbkz55sKIIo7VKXycxJ4eEGt5zqs0Rc6FPqQ=;
 b=Qfm2SlLRGLH1EsN6wxuGYWgArK+hOc4RrQAqYTagCe571cgvl+sFpnU2FAc02b1t01uoMIUwyzTrDNwI+vMNdtJTk3nLz4/PT9z7ZUxRjtwvg1n+UaNUuYj2mGIsm08/Opv4j7m/8kmIv4CWSbic4DuuYJLOX9OpQ7i3cjtXboDA4GWCHzvUR1X7ECXKID4fvPKzxo6CoxwrQIRLkGwcSQE0RGzeEELVXzbGhNrFXq16ZXnEL/RM9p6rJ11FSqCG2bQVzjKlH4d0kQ/01LvL+IRqlRv3A0wfAqOSe4zxJ5zGb9giIuf2fCGzyFCfPvLD6s81/EnpbXbSysIbYy3tTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-3-andr2000@gmail.com>
 <79fa6e5f-ace7-c46a-489a-2e1ba52e53da@suse.com>
 <7e179a48-3127-93e4-cdaa-e5be82cfe770@epam.com>
 <7d035651-6e16-a6cb-6760-e5d077e1a85c@suse.com>
 <91fca69f-1a6f-198d-be27-c6b0ddd62206@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <078e3a01-4498-7894-87dc-31798cfc474b@suse.com>
Date: Thu, 30 Sep 2021 12:14:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <91fca69f-1a6f-198d-be27-c6b0ddd62206@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0010.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56c030d3-394f-4286-d6ec-08d983fb20f1
X-MS-TrafficTypeDiagnostic: VI1PR04MB2960:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2960F9B6B03AD32094A43017B3AA9@VI1PR04MB2960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0BqTZzXBKd4Tw2B3ujl3lSvdMqqf17wTUQ2HBgfrQhOShzK5kf75nV/07/6IIXtwE21FNEVBTFsn/lNMQz56bJ0aOnwpl30d0/c557LpFfhsoiWf1/MCJtNUCyj2/sSvtr6EI0oId5kZ3r3dYHrzP8Abgs9eVUG57htCY3hHMatu6u3yqUFL3p4gu/ybL5rKcU5vwhO0qmpMrYgcrCg5+7tYiFYZn+G/sRN1zUgk0azqO8cbJKZwUbqQ8fvphe/P9YD2z+4yPh89zJwuAWRohomZ7ALCaXMny60Rc8jE842jt0RTf1Hqtg4w3ncpV61VUhSwvtCrxQYNRYrq/8dIV59FCbFMpqQpoY88j0HIDYm6FBrL6xWNFvy4LvR+87Ec1bAyoSpczx3EW0TC29+pcxyzVa6mw3HaHSjAMSftxEcDLVB2Q9O19m3vLhDdLbGHGhQlYJYv6i1v7k6VmP/30HB3mOpQYCcGVhRXeCXSGLDjPviwlxc4Da+25joE/5HX/DPFUQ4N0ZvECpqHa1zpkV9ixc1qENslmbMzfQuAMg0m/5ZLSzbMI/AnB0cnGxjF1fx2hyzqireDriiTE37tRmLXY0AwBF4ZYRVhaktIaR04FWeFdogR+IMVhA1eSOwmqnPLWeeEJpdurNCPjUwn/Z6wFp90n+hNXHP65cwsSjlYYxyiFphva5VHNLVP88Ln8PfPlc2S6wBorFisjJ7X7ToqlaB/ZnKnJ/MTQ2RuAIeHFHUZ/BI48hLaELszLT2A
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(6486002)(54906003)(31696002)(26005)(4326008)(36756003)(53546011)(8936002)(31686004)(8676002)(2616005)(38100700002)(86362001)(66556008)(66476007)(5660300002)(956004)(2906002)(6916009)(186003)(508600001)(66946007)(16576012)(7416002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGs0VjV6MTZRMnhKdk5DRitoLzNGT2J0SllGcVhNWWwyZXVDRkxrNml2ODJ0?=
 =?utf-8?B?SFh3YUp1Vk5zTjQyTEMyWG1zZWZQZ3k3ejB4TVIyWHI0MnczSFA5bWxnMzZU?=
 =?utf-8?B?MFJ1VVdYNFVRUEZJNnNDNVpkcDh1S0h0OXNBeUlSUmxjRVRDeTQwY2p6QXMw?=
 =?utf-8?B?QWNoaU1OaitoYVQ0dUhCYkJjZXBVQ3lRTy9XMVdLdTR2bWRIclVxYXcrL1Uv?=
 =?utf-8?B?TTZMMW4vVzBnVmMyNWliNitOempnUXNNVFpERTVrekViR0JHd0h4VFJFeUFX?=
 =?utf-8?B?d0xNQVNHaHZWQkpIdUdKbmtPc2Y3d1RObzk3d0NwTEEzSDlESXpOT0lWOHph?=
 =?utf-8?B?QjBmYzI5N0gwVVd0dUxzNzRIRklYK01jL3Y4eDUvOUJlZlpuY1ZJSUFack9P?=
 =?utf-8?B?SStWeEFlVkpiU2lMNjQ1R21iZ3R4bWg2RDhKUU9Nc2tua0puNWlTS1FJWkxO?=
 =?utf-8?B?b2ZUSzJIYkkwZXZYZVFKZjFxV0JxK3BqQmdFak1nSVJHVUhoSWRFZzFvTHVM?=
 =?utf-8?B?dVVQR29JcE9mMFh0TmE5N2xQOStXaElEazU5VmdxcUpUaGxYeUZDWTk1RWdv?=
 =?utf-8?B?dnJlQ1hTZTlUZEp6ZnVFR3p2VHFVUGtKOUYrdzRmQzRobFdidXhQMTN3OGtV?=
 =?utf-8?B?UjVERTBvTE96R01GR1VYL09MRlcydmxucUlNUU95djhFWEtXdWZWdGVmeUJP?=
 =?utf-8?B?K2dmWFpzbmk2T2phUmZOWkdiaGJFZGxQa1VMQ2xEU3ZXbnduK1RlR2dFbjdG?=
 =?utf-8?B?QnRKdXRLTVJ1MGhnSXdkRHVwa3lZN2Q3NmhZZVV5ZG9neEp4ZHRPQlJObUV0?=
 =?utf-8?B?VGRYNElUVXhnVnNpVVd1L1lKMlM2N21wcUhKNnRXenk4NmVoRDlrNmM4cWtt?=
 =?utf-8?B?UEFTV3h6Q1hoSzk1SlhRTmpTZFhPYkd0UURKOUpGVzJ2Uzg2eStpL2s2TGVC?=
 =?utf-8?B?enZVZ29YS3NuQkgvRUgzZWoxWXJqWjZpUC9zV1YwQ0xFNzhncStGYTk4MTZq?=
 =?utf-8?B?VHpVL28vQ2U2TVh1WHRMZk05dXRDanl4bVI1Qnp4ZWFIY2JkZHBrNTlvL1gz?=
 =?utf-8?B?ZDZkb1R5SnFOMkw3VEhFMkl4Zi9INitiSXY5S1M2YlczR2tCU2thWkg5NTIy?=
 =?utf-8?B?ejdkR2U2VXFrd2NOcExuK0I4L04xLzd0M2hrVVZ4VU1lR3k3RWl3Q3lwTEdV?=
 =?utf-8?B?eWp4YStPamphRHJ3ZXBrdmtoWEhCMWhwNVU4TTE1dWxUUVJaRzJwbDVKd3E4?=
 =?utf-8?B?R2kzVlFzc0hoUEJ5NFJpUmg2c2hRSThEaDVQenpYNmIwUGMyNk8xWmpjYTA1?=
 =?utf-8?B?UTNWWmJEVXovZzJmWWdaQ1NmaGhuaklDUzRjTlEwTnlEalZKdjNESkhYYThz?=
 =?utf-8?B?Z0VTZGozcGUyQWpoQ29Wak9tQnorVnVKSDlCRk01NlpMcE4zMk5LTmRKWVdn?=
 =?utf-8?B?eXQwQ004V3RHMG0wSXFxUjBhL01DUXpreGlVSy80TXJhMjZzZTVmOGxEQnVM?=
 =?utf-8?B?YkNtMy94dndKNWpjaytoWWQzOGM3R0Zsa3hlNGRRQThrWFZFMGNKVVhHOXda?=
 =?utf-8?B?eDlETVdXOEJuazduRkFLQStHZ21obHRZa0JBbXdmR01tUjNpbHlJRFRRaGk1?=
 =?utf-8?B?VC82STk3Z2xDUVV4dnpPaDdHM0xSSWM0VGtibXNrL0ZLRE1aTTR4NkwrcGp3?=
 =?utf-8?B?UlBScGZZR0hteHZrRTNON05mUFJtV0kzTnRYWVpjbFM0ZHNKYy93eTNwZi84?=
 =?utf-8?Q?u93ybVl9gX4w+kZ2ZaIrPwK7SnSZykoxZF2GIK1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c030d3-394f-4286-d6ec-08d983fb20f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 10:14:46.3505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ec0qsW9AYn6PDA0E0vkbwptd3IvCOxtF4pCwM/I+WD+SQTr0c/H5Rat+Zovj9xa6UOi0jIGwZhEed9mZRecA5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2960

On 30.09.2021 11:21, Oleksandr Andrushchenko wrote:
> On 30.09.21 12:06, Jan Beulich wrote:
>> On 30.09.2021 10:45, Oleksandr Andrushchenko wrote:
>>> On 30.09.21 11:21, Jan Beulich wrote:
>>>> On 30.09.2021 09:52, Oleksandr Andrushchenko wrote:
>>>>> @@ -1429,6 +1433,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>>>>            rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag);
>>>>>        }
>>>>>    
>>>>> +    if ( rc )
>>>>> +        goto done;
>>>>   From all I can tell this is dead code.
>>> Before the change rc was set in the loop. And then we fall through
>>> to the "done" label. I do agree that the way this code is done the
>>> value of that rc will only reflect the last assignment done in the loop,
>>> but with my change I didn't want to change the existing behavior,
>>> thus "if ( rc"
>> rc is always 0 upon loop exit, afaict:
>>
>>      for ( ; pdev->phantom_stride; rc = 0 )
>>
>> Granted this is unusual and hence possibly unexpected.
> I will remove that check then. Do we want a comment about rc == 0,
> so it is seen why there is no check for rc?

So far we've been doing fine without such a comment, but I wouldn't
object to a well worded one getting added.

>>>>> --- a/xen/drivers/vpci/vpci.c
>>>>> +++ b/xen/drivers/vpci/vpci.c
>>>>> @@ -86,6 +86,29 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
>>>>>    
>>>>>        return rc;
>>>>>    }
>>>>> +
>>>>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>>>>> +/* Notify vPCI that device is assigned to guest. */
>>>>> +int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
>>>>> +{
>>>>> +    /* It only makes sense to assign for hwdom or guest domain. */
>>>> Could you clarify for me in how far this code path is indeed intended
>>>> to be taken by hwdom? Because if it is, I'd like to further understand
>>>> the interaction with setup_hwdom_pci_devices().
>>> setup_hwdom_pci_devices is not used on Arm as we do rely on
>>> Dom0 to perform PCI host initialization and PCI device enumeration.
>>>
>>> This is because of the fact that on Arm it is not a trivial task to
>>> initialize a PCI host bridge in Xen, e.g. you need to properly initialize
>>> power domains, clocks, quirks etc. for different SoCs.
>>> All these make the task too complex and it was decided that at the
>>> moment we do not want to bring PCI device drivers in Xen for that.
>>> It was also decided that we expect Dom0 to take care of initialization
>>> and enumeration.
>>> Some day, when firmware can do PCI initialization for us and then we
>>> can easily access ECAM, this will change. Then setup_hwdom_pci_devices
>>> will be used on Arm as well.
>>>
>>> Thus, we need to take care that Xen knows about the discovered
>>> PCI devices via assign_device etc.
>> Fair enough, but since I've not spotted a patch expressing this
> Well, it is all in the RFC for PCI passthrough on Arm which is mentioned
> in series from Arm and EPAM (part 2). I didn't mention the RFC in the
> cover letter for this series though.
>>   (by
>> adding suitable conditionals), may I ask that you do so in yet another
>> patch (unless I've overlooked where this gets done)?
> Could you please elaborate more on which conditionals you are
> talking about here? I'm afraid I didn't understand this part.

By putting it inside #if or adding "if ( !IS_ENABLED() )", you'd make
very obvious that the code in question isn't used, and hence no
interaction issues with vPCI exist.

>>>>> +    if ( is_system_domain(d) || !has_vpci(d) )
>>>>> +        return 0;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +/* Notify vPCI that device is de-assigned from guest. */
>>>>> +int vpci_deassign_device(struct domain *d, const struct pci_dev *dev)
>>>>> +{
>>>>> +    /* It only makes sense to de-assign from hwdom or guest domain. */
>>>>> +    if ( is_system_domain(d) || !has_vpci(d) )
>>>>> +        return 0;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>>>> At this point of the series #ifdef is the less preferable variant of
>>>> arranging for dead code to get compiled out.
>>> What is that other preferable way then?
>> "if ( !IS_ENABLED() )" as I did already point out to you yesterday in
>> reply to v2 of patch 10 of this very series.
> Please see below
>>
>>>>    I expect later patches
>>>> will change that?
>>> No, it is going to be this way all the time
>> The question wasn't whether you switch away from the #ifdef-s, but
>> whether later patches leave that as the only choice (avoiding build
>> breakage).
> Yes, the code is going to always remain ifdef'ed, so we don't have
> dead code for x86 (at least).
> So, does the above mean that you are ok with "#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT"
> and there is no need for "if ( !IS_ENABLED() )"?

I'm afraid you still didn't understand: "if ( !IS_ENABLED() )" is
also a way to make sure there's (almost) no dead code. And this model
has the advantage that the compiler would still check all that code
even in x86 builds (throwing away most of it in one of its DCE passes),
reducing the risk for someone not routinely doing Arm builds to
introduce a build issue.

But as soon a code references struct members which sit inside an
#ifdef, that code can't use this preferred approach anymore. That's
what I suspect might be happening in subsequent patches, which would
then justify your choice of #ifdef.

Jan


