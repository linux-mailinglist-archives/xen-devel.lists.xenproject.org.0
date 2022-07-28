Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418E1584111
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 16:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376843.609887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4TU-0004jS-V4; Thu, 28 Jul 2022 14:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376843.609887; Thu, 28 Jul 2022 14:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4TU-0004gd-S9; Thu, 28 Jul 2022 14:26:52 +0000
Received: by outflank-mailman (input) for mailman id 376843;
 Thu, 28 Jul 2022 14:26:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTbt=YB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oH4TT-0004gX-Q4
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 14:26:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60065.outbound.protection.outlook.com [40.107.6.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5186d7fb-0e81-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 16:26:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2533.eurprd04.prod.outlook.com (2603:10a6:4:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 14:26:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e%7]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 14:26:47 +0000
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
X-Inumbo-ID: 5186d7fb-0e81-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1EWFd9m1gBboBXZBXCOSBh7VlQz6xlhFJJ1avUfrBAtrhfWjSwpoGEG706YhPLwkIKZQSpg6Qrd30PQugWQxSD/nvRDF1bivlH6V9i9aaJ83QHOkBagMsxiRg6jQ2YYZ6rOVhQpYmKqlH/6VkL9+JEv7bW8QD0ZFP+jo3nNOHbNbkQhD00MmthCytDHjSxg4+95Ni3WNrST+jxmtSqBdiyq/vdhJu9ZkuraYVFvljMpkChj0iJtILimGByxkSHt/IPonRXhHVNnDyKoWPqbz1WGTBbslOUGYmDAwdzj4XLVMHrqexfhygjoxa7NeesrS9pCd2xUsu1Bc4pdgEc3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfRGgEhkGeIOHRJqxjbjIEei+ZFgwTgGMNrwXM3A7Q0=;
 b=lMYqO/5P7VPdqv5EdT3T+5GlAQtwHJXxtOhwWpqlWlSJ86k0ZiT+VlCCAUi/rFxDGY5Pg7Yk+F+1e5kvWmb9KQdPOiF8OJT0+Kv65Kjde1qg2s+jHV+hUpEZgqk8Y6ewjOnJXqeF2vlR6GlhP2ozPc0YEisTRlzT69R0fO0MH1aeNBvFN/q90RTsExUTTBDgOq0ob89YvujZGU97hvkX1lZBRd3qhcGo2GEOTqgebqOADQaZRM93ob8vDozYmeiqkgBMGaKqtX/LRLTL/obB75Ff7RxXrpzGKsXaxaKHGtonGziasxa8f54NqyjGA+F5WmhCMMPCsNuKBcOQU9hQ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfRGgEhkGeIOHRJqxjbjIEei+ZFgwTgGMNrwXM3A7Q0=;
 b=bvtdUY3DGYrgE1ssKWrENlkNstO8+u8CFrBjm42LK07s2zf7trLT7TFJNE8HE1lKy6C6kdLsy03AP6N+vp1K9dUZQJE8CDnikFhbtoKBBaLnGAn7pzMILRWG391sl8E4sC4bU/VVZKN8voQfWa/QsFKNNzUz+HsT/BckTI1ko7eWwqXICBWz80fT8I+QtHXNkPBZ2UL0qJ2Xdb6F0J4Lq/VGGU8n4bTFQieFE1vw1RJQL1JMwNw7BRg6ky8GGuEOLxWqtaCuPV+88/AcrWvINVGaW/tiAVNnXqMgj7ZJfqwYOMnTPHwL7e28+cgnlVD6lrHi3jQp1VSRlZtFBm9d2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d94d2974-bf6d-3c2d-1672-e27662aa4ce7@suse.com>
Date: Thu, 28 Jul 2022 16:26:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 09/11] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-10-olekstysh@gmail.com>
 <3b3dd7bf-b528-b7ab-aec9-c912a30d9cd0@suse.com>
 <65aad251-2775-45cb-e642-3314f253ace6@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <65aad251-2775-45cb-e642-3314f253ace6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0601CA0043.eurprd06.prod.outlook.com
 (2603:10a6:203:68::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9662c18-0fad-46da-c8ef-08da70a5342e
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2533:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H60qMWWXEDzCSNdVpqqan5lqH/wnGQG6Hc4nD1dx398Fi8g1cALmfjd+9XjkhX5L8aswbinWII7Rm9c6glmD3a/gXDkHetk053Pq7suzVAW4IkPbU8wRsQLloRi8IINfcMFfQ4qJLGliHeeIXy/0zkgWv6CxEhm0JEr4wJwQ166CkeeMczFDdSo/c/MI5TKgmq/cfO1RxwzkVIxxLle4ZEUVp454CLA8K41iyayplcF52e2GjAF6LGk7lZbtMgRvhQueZqlMAA/luPY7dExAO9w3OIDpe3OsB7XE3BIJwPYb4E4uqrWIMi4SUadwsaQPGadFd/DbvtwU480c6gY1BseV1tqYxhFPrgerM6WLPoKlgsPH3uh+iftk7mRZI/FRrA0JwmHWAx0Qu3MXpc/6huKMXU+8v/0qIY0s2NfZ7S1xUJwr7X3PMhYesAUBTjxrUynYUSTHvJwMflcgpJhGJqYW2JWoQcBf1xBZDeSrz8KPXeYudD7aWoOAtftTWoaw0U5V8qUqda8oLJjmNJMcJVVLKq3y+IGVrONYOCs9kPeh0q+F18KGMPv5m6y54Qu+oL+FxIdHY+VRHPf/SyZPK/SAV2xxWEZc420pUqjdmP7VewLPHLx029rlefR3qu67X1REpYh5Lvi3RcaltINJFaZXyfWI4XQHaOR9miA0UJrMjmL7wRf7YuwbQfi6rPLZwf/G9yJl9YPpXrKMjqWTFbTDpvl1hCxcmWfe1wN1qd8W4uDTwM9Unq06LhDng7lwtZwgk+WUqTRcsQiLoBVE51TV07jH7ox4a4qAZZQhMrp9IR0BEDXrn6nYbJff8k/iVfZ34SHgrJ5Qar0i0CWXFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(366004)(136003)(346002)(39860400002)(186003)(2616005)(41300700001)(6512007)(6506007)(54906003)(53546011)(26005)(36756003)(8936002)(5660300002)(31696002)(6916009)(31686004)(478600001)(316002)(86362001)(6486002)(38100700002)(83380400001)(2906002)(66476007)(66946007)(66556008)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3BqSU45Q0tXMk9hWjEyQTdnL1pGVGVNUG5ZejdWZ2o4MzB1VEh4MkkvVjlu?=
 =?utf-8?B?L2Jzb21sOForMG84VmcvbXFDUFFWaDBxTHVVblBkVVljZDZJaWRxU1I0MEVQ?=
 =?utf-8?B?Y0hoUDNuemVBWGdPa0EvSFVyNWg0b3NLTGRlR1hIWUt1T1J2MlJXTzd0L1V2?=
 =?utf-8?B?eGg1S1VndXd3dURFTmlibVZTU1puc28wcnd0ZElWVW4rbUxXZVIxRUZiNEJZ?=
 =?utf-8?B?WTJGc3AxKzZQcjFYYjVTS01kZjBDTU0rQ1RJS0xIMVlrRFFFdys4MjFBTW9r?=
 =?utf-8?B?ajBXMUx4TFM3cXplQjFvTWE3blpxdzUycWNyUkNGcSt1SjU0SUNXNXczUjhS?=
 =?utf-8?B?YVE5SlRWWHNKdTZqYmJxb0FVK0RwMVFkbElUSENZY3FzT1hISnQrcVo4VjVQ?=
 =?utf-8?B?clo3N005MHhzVTc0V0RGK3lnRU91eUYrQy9tWkJHNkgwRU0xelpYWmdyRlBF?=
 =?utf-8?B?MWZnc1NTQ0N2aW00TU1xUEtZQ0VUMUIyRFdWU3dQalVrVmZwREs4ZnBNZjBx?=
 =?utf-8?B?bGU2bXNMakpxQTNuWFBzQXZDeWFLSVRNdzJEV0dIQVBQUnI1dnBoTlRIYkhi?=
 =?utf-8?B?a2dDc2xiR0o3ZUs2T2FMbXhRdjE5RjJZVGZ5VmNqME10akZqVTV5bEdHbXNm?=
 =?utf-8?B?azI0R3JxeDk1QzhXK25IRFNWWGI5Y0pueDVYNVAvQkl5QXZTTzZGN1VkTm51?=
 =?utf-8?B?STQwUkNVSUtYZmYvRU1kdFlIUGlvREF2Zy9USjJPTUNaM1gwK1VlZUNtV2F4?=
 =?utf-8?B?MDB0ZXM4NmJPTTZwcitzUWFWNTBIdi9acThxWExJNHpOSkV5MGdxQllxMUxX?=
 =?utf-8?B?TXZSTjJvOU1Ma0wxS1gvV01hSnpadkFQdnZZV2xka1A1UGhqY0ZTYWQ4OEtD?=
 =?utf-8?B?aHpyN1NWamh0K3ZoU0RzUUxxazNiS2dxSk1KNUN6S09UMWRHZEFPUnZYRHpm?=
 =?utf-8?B?bXdxVVBlVEdCaDBZb0VmR29PKzNBVUp2dUJDVUNvRUwwL1VJYTFHeERjbW9t?=
 =?utf-8?B?UWcxNStTMXBrYkJhWHVkUzZEV0FkeFlicEpwNnpiMUMrOHZxa3hOendBbEg4?=
 =?utf-8?B?eS9TSHR3UzlaMGd5R212emZKZXlJMzZ2b1FsbjczR0tINEwrSmh3enNoeXEw?=
 =?utf-8?B?NjNrUHc3ak5nSTdHMFdzbkoyZEVucUxndGJJVERKUVF3eU1ud2duYWx6NDcx?=
 =?utf-8?B?MVJuWmNIRUJpK1hBSWsvdllLRW8yS2EwU05RMVZhdzBqcjJaU1VVWHY2cUI3?=
 =?utf-8?B?QzJtdkN2Q0x3TXVSUnYzdzNHamwyKzlEdEloZTBrTFJ1WXBDQU94UlFZRzVJ?=
 =?utf-8?B?eUdUN2FyejNTQlE1WGdwZjI5UHR6K0w4b2hVNklaUXQxbUlqU1d0M1Y2Ukpp?=
 =?utf-8?B?bEE3djhlamJpQmphbm1tVU92YS9Ya1p6MEVueHEwczg4bkMxNnFDK3JZYjk2?=
 =?utf-8?B?NVV6OEZhZGlIQnNOaExpb0wrcDVaSUVTcG9sSWZOdkFLNzVPWnl5SVJ4djBO?=
 =?utf-8?B?WnhvNnA4UmRIMEpESklzRmZGRFlaUXBDZ2k2blB0S3VEcGt3OFRNemFNV2NU?=
 =?utf-8?B?ejBlNTRIcWd1SnZoWGRZWkJWaEFzZFpWZkNHT2hvTW5pOU1XOGdPVnNRUmRT?=
 =?utf-8?B?REZ6ZkwybXoyT25USVdjejZJSlBtbzU0WDJxNFphRC9lMDB5VWdaZ1BxazNR?=
 =?utf-8?B?N0I5c3E1ODZaeGNZcUp0UDdNMkJKYXYvTmh6cVVzakRxeVlQdTlPV2lUZWxh?=
 =?utf-8?B?YnB5T2MwWEo4UW80alNFTlhuZk1pT3RiK0dqNlgrd3FEa09qVG9wMzZxRXR6?=
 =?utf-8?B?Uy9FR3pDcmNBZUswZHdtQkU4eUNWVW5NSUFlUFRCV3RHR3ZyQTFYbXYvdXZK?=
 =?utf-8?B?OFg1aXdIZ0FBd3c1cUNKM0srNjh0SDFZaVV2a3RoNzR1YVZlQ0RTZUpmZUVV?=
 =?utf-8?B?TEY5QlQxS3lhOFpFTThiQkdrVkJnUzdQS2ZxUit5T2NJbFlWK3AvWGR4WUFm?=
 =?utf-8?B?eXhPcTQrNkpNWHpaTlBOOW5GdGhuMmdVT0pyT2x6QnVnSUNCSExUOHZPRkly?=
 =?utf-8?B?T0hYcG8zNHFjL2hvWVhwTXVaSFg4SDlpZjZyaUluSWpEeXlpN3htOWZXc0RL?=
 =?utf-8?Q?TuMo8ymptHX8ObEax35NDGSNN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9662c18-0fad-46da-c8ef-08da70a5342e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 14:26:47.5148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azRfAbLaTH8+/pFZaBtrL3xUWGj1h7d0TAa7vuLLrJmUzC1ofinHWg3Ww/kVm+vXZ5X3h4ITaY37bOD7oE36rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2533

On 28.07.2022 16:16, Oleksandr wrote:
> On 27.07.22 13:32, Jan Beulich wrote:
>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Assign SBDF to the PCI devices being passed through with bus 0.
>>> The resulting topology is where PCIe devices reside on the bus 0 of the
>>> root complex itself (embedded endpoints).
>>> This implementation is limited to 32 devices which are allowed on
>>> a single PCI bus.
>>>
>>> Please note, that at the moment only function 0 of a multifunction
>>> device can be passed through.
>> I've not been able to spot where this restriction is being enforced -
>> can you please point me at the respective code?
> 
> Nor have I found the respective code.
> 
> Could you please suggest a place where to put such enforcement (I guess, 
> this should be present in the toolstack)?

Such check should be in the tool stack primarily to give a sensible
error message to the user. Yet the hypervisor needs to check itself
nevertheless. You know the code you're adding much better than I do,
so I guess I'm a little puzzled by you asking me to suggest a place.
(And for the tool stack I guess asking tool stack folks would get
you better mileage.)

>>> @@ -124,6 +191,7 @@ void vpci_deassign_device(struct pci_dev *pdev)
>>>       if ( !has_vpci(pdev->domain) )
>>>           return;
>>>   
>>> +    vpci_remove_virtual_device(pdev);
>>>       vpci_remove_device(pdev);
>>>   }
>> And other call sites of vpci_remove_device() do not have a need of
>> cleaning up guest_sbdf / vpci_dev_assigned_map?
> 
> I am not 100% sure, but it looks like they don't need. On the other 
> hand, even if they don't need that, doing the cleaning won't be an issue 
> at all,
> 
> there is a check before cleaning (which will be extended as I proposed 
> above), so ...
> 
> 
>> IOW I wonder if it
>> wouldn't be better to have vpci_remove_device() do this as well
>> (retaining - see my comment on the earlier patch) the simple aliasing
>> of vpci_deassign_device() to vpci_remove_device()).
> 
> 
>     ... maybe yes. Shall I do that change?

Well - yes please, afaic.

Jan

