Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BD340B0B9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 16:33:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186810.335555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ9Uc-00010e-Mc; Tue, 14 Sep 2021 14:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186810.335555; Tue, 14 Sep 2021 14:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ9Uc-0000xt-JP; Tue, 14 Sep 2021 14:33:02 +0000
Received: by outflank-mailman (input) for mailman id 186810;
 Tue, 14 Sep 2021 14:33:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQ9Ua-0000xn-Bt
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 14:33:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f409a10-b09c-447b-84dd-8110f40ca7c1;
 Tue, 14 Sep 2021 14:32:59 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-YOGgfKp5OkGebasYqmF7yw-1; Tue, 14 Sep 2021 16:32:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Tue, 14 Sep
 2021 14:32:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 14:32:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0108.eurprd03.prod.outlook.com (2603:10a6:208:69::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16 via Frontend Transport; Tue, 14 Sep 2021 14:32:54 +0000
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
X-Inumbo-ID: 6f409a10-b09c-447b-84dd-8110f40ca7c1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631629978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCHr+iu/Fh/OEFPHBp/vLAtGuSF7lejGesqvViIC/XM=;
	b=Q6P/zlCaWSnacPoUvQM0UnInmbgocoV4uQhQHYX+dZainu4z6DYxhToxpm1teteM2GrhME
	cKD0JeRkEN4I7k9e64pVqw1mLayhsVeupwhH+ku0phoE0c+BOEUq1hMgfaSHd27G6APCXp
	b/BUCkQbrVjkKNt5grup1k3yWEsX/HY=
X-MC-Unique: YOGgfKp5OkGebasYqmF7yw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IksFiJu2gI1huiGiGxJi3JHP/lBgOU2HTS6OoVY2lDs875Beib6WvGpNR0l0OKoJt4aw1Cr6QRN6RW7BtezY8AuRx52RzujZL4XUhVL19caiyglPPmcB+KdTfYwLVhGmEJDH+Ubenf0ABYNZrJmueUmIQDvNxRQCkKmfujdage8aOK5KpEWrLHN78xg1SqLGu9lWZH/u6DOk5wCarKj+A9NQCdNPK6WvQpmuR/HOzamMAG7vbgDG1/kvTGoH+2uVHO6sGtNB+GuXycT/6CCXm3n+GO/BV4Ogx0ZKN/trpPf1JEZHzeTfVHNBJJuZvAeWz3mY4YWkvMxarV0d+robHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=KCHr+iu/Fh/OEFPHBp/vLAtGuSF7lejGesqvViIC/XM=;
 b=ZJ3ALdgKUk/I8+gGQ5BqaNWLaoc5AGTOXsNaM4tET342LekYnJb1mSLKRTQj8dNnz4HhNBmoWIW7WK6gwFyNqlxFV6rD/Mevmpp1gVhbiL0cCZ77wLJixSUxJBSO1wGgkC7bdHDJ2pKqzU5PaEUuXObGGK0nsF0s0vVDfoBVsmt3U4scviWsbZl77ulCBmkoPND7iHoJf3JJPxFGPE01Q6lZyMk6nQwZ26RHwp7bYZcCtrsTrp9M68MTFNuPWtT16F1nIi/lneKxCGA7fnsAiyCHfvyoKJjPokbrYMGpDD4tRmrEc977pijOaQ7XJ4cKJUbkGlNNqenZLrDNKgZ1uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/p2m: fix xenmem_add_to_physmap_one double page
 removal
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210914133419.8407-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <96c7ffdd-57b4-15f6-7fb5-560c6ed0504e@suse.com>
Date: Tue, 14 Sep 2021 16:32:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210914133419.8407-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0108.eurprd03.prod.outlook.com
 (2603:10a6:208:69::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe8e8932-b536-4b84-6053-08d9778c8a86
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3774CF0F9F01CA315730E8EDB3DA9@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p/hOsC4FvBaK1btt1YKggbR3Pi5js/uhi2aSuRHOBpVykryni4SnbAMTFhcZs63RB8fVAw+L+cu51fvb7CqiMvqDkzWMRM77NCvLmiGHEzp5yc/3vLZMk1sdS8CvPb9STwHxoepAdDx2mygo4ZN2vXScWi1Tb55OKgdxoZrduLztuI8nhM7JbULm0ZVVklt9rPoFHaAyK9okBih+PLQuTMff3jfH4DpdoHWvTOS4BfCDGyoAc8X0ueTr5MTPLhEzwQKLCyZDMX80J9Em8d+lyCsMXPXGo4Rcm7Gv9BaX35A0eu82dQAOZd8W6JFAwOUCn4DCixnIFjoth+ZBPlVkf47WcH3sHvd8zHcK7GavIclUmU4IjsYHRbYKihpdSFWdFMLPxyC8SAC2CEIJqDIzURBApgsrlU1vg3cGI0Aqs3UDafcJbWiOD6eb30JKS8kpW3Vm3LGDZ6HB+YNZRQx5G1/r6I4eZ6e8VV8jiyjIsXH/QAoNBpSdX9A9QGGwXehnUP9d2Ami7T9kqOCJ+Qld5VLas6fAR9EIGuChb8yJjC0cF1ihwqsmEUoNvDQSjTlDq3XMGOG+biSwdjJ7/RH1Gu40aAWNLNVF3fyKSR5vvt6PI0SCCdaMouhKYTHF0g3IX3tP7I/elQbfryKQzdflV4LeiBplLOw0mhmcmbzHtOLtV2SZ5KeamZAUouBAiK0/JFcJ2vEzYEONevHvWym/aVd4rlensWTLHb8gXtHBC3M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39860400002)(346002)(366004)(136003)(53546011)(5660300002)(186003)(66556008)(8676002)(66946007)(8936002)(478600001)(36756003)(31696002)(16576012)(316002)(26005)(54906003)(6486002)(86362001)(2906002)(4326008)(6916009)(83380400001)(31686004)(38100700002)(66476007)(2616005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2FCVWlDTVpRUHhaZmMxQmRlVWhtWDl1MWJXZHAwclRIQUZpV0JhMC85VDlD?=
 =?utf-8?B?L2J2VTNWMXFQNnFJY1ZLbktmMm9rN2hMSDUxRUlQSk1obVRiSEpvTXM4NW5Z?=
 =?utf-8?B?SXNrdStGckxMbDdNVG5GUnk2M3gzOXVYNWh0dzkyZTFZcFpRWGF3eUdhNWxN?=
 =?utf-8?B?ZHpzRVVlOG9xUnB2WmtxSU1Md3pkb0NvQmwwVFYxVTFrRWM1UjNLeloybDhn?=
 =?utf-8?B?b29rbXFoWTVUcC95UUhHUk16Vjg5TTF6empvS3p1NDVCWW5pT3B1RG9IOTl3?=
 =?utf-8?B?SnVDclV5OWdHK3lONmpaVmdiSHUyN3hMQ3ZwRmdlZjFhNUZkMThoMWp0Q3Fy?=
 =?utf-8?B?ajlORlV5WnQ1YklKZjhmWDg2dlR1R0FKQXlLWjkwL0dOZXIvWXlJVU90TCtv?=
 =?utf-8?B?T2YxaVhIdGdmZjhZb2ozNVJoKytRWXVsNTBUQUJOU3VEbzM5a2l1WVJPM0cr?=
 =?utf-8?B?N3YwU1RFaktwMFpaRnBGa0lpanpGTmpOQjJOejkrREZCM0MxZ0JmS2tCMzdU?=
 =?utf-8?B?cG8zS1h5elI1dFhOMFRkYTFlcXlFZGJuWEVhdkdvNDExZzNrc3M1cXFWc1R1?=
 =?utf-8?B?N1hSTFR0M1lkUXdQd3FaUW95RUpZRWdiL001SmdOV2QxamhDaERRcG1XR3hG?=
 =?utf-8?B?WHdjNW5QbjIzNkxsUU9aUFlycUxxZkU4dTh4MkNxZzBOSXlESGhrcnBweTFZ?=
 =?utf-8?B?bHpmcXpyK3ByNHg4V2w5Q09veEZpS2RyaVRQVmo5R3lwc252M0huc05FdGNt?=
 =?utf-8?B?K3dxL2ZiUy9KdEEyT0pidUhPa0lWVE9LVTVSNWtoOGVxdXVZTFI2Nm9aNFJD?=
 =?utf-8?B?ZFhiNFVLU3A5d1E1SUl3OHhGaTQ2allLLzdLLzR5MFNlSXYxbU8vczA5RC9Y?=
 =?utf-8?B?LzZhRXd4anlObHFJQml0bEorUTErWlZhSnk3LzduSENHcUliL1dGQ2JiYmxN?=
 =?utf-8?B?Vk5PRzN6ZGZBYzlTTmV2b0RrQ1RvZzFSTnIvc3IrVC9FenhGZjdNaWxMWUUz?=
 =?utf-8?B?a1NTbU9uWTQ4Rk9RTWN2WU5IOVNzb0NRTks1Z2pKMVVFeUNuTitXaFErZllt?=
 =?utf-8?B?T3E5UDZJMTVQMmtoS1RialFNcHFUZENYNlUzOVNuaU5RaHNteXBRVjlaeUc2?=
 =?utf-8?B?V1dtM3lFRzNKSXpUbit6NnVqaHZwa093Q2ZiRFVWZDB5M0NHL1FzczJmZzZo?=
 =?utf-8?B?N1E0RGE4dVlYZytVVVJoeGJEcXpydlZsdldLVmp1citFWnFjT0ZuaXJ0MXRy?=
 =?utf-8?B?dlA0dnhzLzUvUlNFa0tKbEIvY0RiaWU4N3BaRVNzbTREMnVEOGdwV1VnWmow?=
 =?utf-8?B?clRwblIwcGRmRTlzdG8zTkg1b24vVk9aODdsKzJTZFBWeTN4Um1hVWZzcDlk?=
 =?utf-8?B?SVVRK3JleU9FWDVzK2NyM2JuakNONVVvN0YrZkVpMGhTVWp1TjJyRU1Gb09h?=
 =?utf-8?B?c2ZCTkxId3V0aTVqQlY4WFNwYjk0aUF6UFV3SW1aS3Z1NCtMTFNsVDdXRFh2?=
 =?utf-8?B?N2Z2cmhQV09BaSt5K3NtRnplS3p0Y3RYOEUwOGFSUm1NZm1WY2s5R3Q4U2FN?=
 =?utf-8?B?cXNCNnJGQno1Ry95VWpWYlBFMU81aUFMayswcVRTZVFpSzZvcCtZMmUrcVh6?=
 =?utf-8?B?OG5mRzhGTTIzTFk4dXgwbDVjRkJTa083UnR6cldIQjlJb1pYaWFzTXFISlg5?=
 =?utf-8?B?TUk0MHoyM1dBOWVnSFJRdG1jcEprQ1pxdUpuZmx4dnJiMVVwZ2ljaVVXMmVv?=
 =?utf-8?Q?dOOCWN5QvukzRF1fAg/3/mswSkFuhklcnRgpY5W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8e8932-b536-4b84-6053-08d9778c8a86
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 14:32:55.3924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gytMOlG1GMXym19vJ8O2ukFs5p88toxC4+q1PDR5mUDN21jGlHT4SKASBbrbIin/JC12jV+hDHf9Hve2RUovoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

On 14.09.2021 15:34, Roger Pau Monne wrote:
> If the new gfn matches the previous one (ie: gfn == old_gpfn)

It took me a while to realize that you probably mean "gpfn" here.

> xenmem_add_to_physmap_one will issue a duplicated call to
> guest_physmap_remove_page with the same gfn, because the

Considering the local variable of this name, may I suggest to
upper-case GFN in this case?

> get_gpfn_from_mfn call has been moved by commit f8582da041 to be
> performed before the original page is removed. This leads to the
> second guest_physmap_remove_page failing, which was not the case
> before commit f8582da041.
> 
> Fix this by adding a check that prevents a second call to
> guest_physmap_remove_page if the previous one has already removed the
> backing page from that gfn.

Same here (if this remains; see below).

> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2813,7 +2813,7 @@ int xenmem_add_to_physmap_one(
>      }
>  
>      /* Unmap from old location, if any. */
> -    if ( !rc && old_gpfn != INVALID_M2P_ENTRY )
> +    if ( !rc && old_gpfn != INVALID_M2P_ENTRY && !gfn_eq(_gfn(old_gpfn), gpfn) )
>          rc = guest_physmap_remove_page(d, _gfn(old_gpfn), mfn, PAGE_ORDER_4K);
>  
>      /* Map at new location. */
> 

It feels unbalanced to suppress the remove, but keep the add in
this case. Wouldn't we be better off skipping both, or short-
circuiting the effective no-op even earlier? I recall considering
to install a shortcut, but it didn't seem worth it. But now that
you've found actual breakage, perhaps this need reconsidering.

Jan


