Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7055249E566
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 16:04:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261542.452964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6KM-0002vg-AZ; Thu, 27 Jan 2022 15:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261542.452964; Thu, 27 Jan 2022 15:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6KM-0002sv-6i; Thu, 27 Jan 2022 15:04:46 +0000
Received: by outflank-mailman (input) for mailman id 261542;
 Thu, 27 Jan 2022 15:04:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD6KK-000262-Ry
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 15:04:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75bb873a-7f82-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 16:04:44 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-qPoW3n7KNzijFQPk-zE5QQ-1; Thu, 27 Jan 2022 16:04:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 15:04:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 15:04:41 +0000
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
X-Inumbo-ID: 75bb873a-7f82-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643295883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQ1jObtNsVt0Gb/q4hYMDZAGb5jCrEKaEVTZn5oVjeo=;
	b=juUp472jRiLxmS6f31PVXUYbxYuzx0TdTU9tht19oW0vEULtKkyqD/LCyVDQtQLs6lifjV
	PAdUQCDbDV7lEpFGq9wKQYWkZi6Fw71CQD0OD+2QBv9WAwSWu5Wm56cYU1tQzUYWSn/HDf
	HVfbJxPrnZWZ13AH9dby4HByQCNUZx4=
X-MC-Unique: qPoW3n7KNzijFQPk-zE5QQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c44QG9IeMcWPC1C67MadY8EzN8pbuAwogt34yY9/5YF/3GQrZEPfcz3VVD5gxgtXXW1vsYR5M80zAMMb2pihqruHeytiXkb32uyTOkbwlywXZJ+S9rEC5gNJjgroh6cbX/XvP1JYbcqrVOR04dlOeqBHEmMJUKxwp+WyzSA1aCf6Z9+XPRZ5pn1h3v5vEbGzTK0uKC1QXVkX/uEeHlH6zq3ch4w5cLoax7LyUbZUM88mPuXRdlz8y18ohoRGXAciAuASbhYHiRJ9zA58i5Fcb580eo5CIpV7QhHe+R181Idkuo23kZ7FzejkWysaA2oKZhMo6YWP1IU0sZQV1fqEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ1jObtNsVt0Gb/q4hYMDZAGb5jCrEKaEVTZn5oVjeo=;
 b=G8GTfpoiHFDdxpD8XduH8FRWXP5/v/VsijT/H7L20aTic6F0XEWn+M1onTCJ5s1XScKLP1hjk3ueXFN57AwKoy5hHqCS1+/+u4qTTqokIsy/PSa/JhHxZGpvXUP87jrtbjSDOzyosKmWnqickNUoTS4E94G582Pbe/rX+polZ8E2NcA84d7/szrbNYelQiSQAHUJDqHPElBJVVpTLs+QxWOknJWsmQ22ehi/pXZUs+C7OOfj21obRyTeakXeywt7yXghS5x+8jW3YVRV2c789+725aLTbASSvRFjvG7gkPdaBEoXgIMO/iPriglgF1YN+VSBNxchp1uX8B5lISNNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3a79f29-e3ec-6b3f-e569-5d2679a5edef@suse.com>
Date: Thu, 27 Jan 2022 16:04:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Ping: [PATCH v2] x86/PoD: move increment of entry count
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
 <5b3f46f3-3c9f-57fb-00a5-94128f41e34a@suse.com>
In-Reply-To: <5b3f46f3-3c9f-57fb-00a5-94128f41e34a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0072.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4f4dd5b-039b-4b86-0a4d-08d9e1a65872
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB83538AB27F17898BD9FC8B9EB3219@AM9PR04MB8353.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tImdUWJb6yM70FngTztL+TX/oE5l5M2Pju+qMBsbB+LacupK+OUErsgxu4oaqYLfBYx3LTy4gdhLC3fMvTH8m5H9E1kRYrxlc0AfzErDE/v0DR1KdCcFvNpihK2ub05ijW0QWTWlI7/ZLBkBy9BE/KzTNVVWmnzUPHEVqRy6HlYPbZicm7svnLVAC/qDGbPU/80wZ8QPnqmBJETnZqtE8BrSssxNW8bDwgnhqS9WshWxwopy/MyDnayj1KdjYgqsmFr5fzH/bLk1pWCoadkq8UJj1KjnbvyHBuDOn9L24BxpYuSFf99Zzt9o7F9DxFVhaRN1m46JvRKNx/ufUq8EVnFEc4m1wWYkOZRC4VSKVd7S1eTW0prwAjDphO6xiBtTlEgMok2iISkk5ZgOifshfEO1YNl/nxKkzRkFMkhw0+0HMyU2a2AspF8wf4lM4l0lcQctjv+7Ba/VQ3V1Kwziel3jMxXDjM2Wq1nj4PxJLF9FwJhEqpWjr7GjvaPl3L3RrjjWBXLXuRS/n2lTC7D3JuN2sQZpb8jrzZYvu2KDmxqQHewVLRKA0WCvZ+lWjGcx1UDfWOoXvGZ9HMRhvnLLmZCW3WiHB9bbhwQvDOfCgx+LHgxxMihNUZ7xQmaImKRDwz9aoZK3gAtxsdLj5bc0MuVk2hLfXufNRd5Xu5aXD5PmP7uInsdP3Y/vsyofDJQ0lrUOSqE2KED/Pi8NDL87WRj0utS958xHUs5LNgR4XsyJFVqhcNP1H3TVYvWbreYb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(8936002)(66476007)(8676002)(36756003)(5660300002)(38100700002)(54906003)(2906002)(6916009)(316002)(4326008)(86362001)(6486002)(6506007)(31686004)(2616005)(6512007)(83380400001)(508600001)(53546011)(31696002)(186003)(26005)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmxjTHZQbVZ3blJib0NiWEt3dHVLRmxvNWtaS2RmQVduNndEUE5oeHhqWFFK?=
 =?utf-8?B?UEFoNXkvR1MxdnpOMFBBeHdKbG9SL3pJZzRiSU9HMzdDakVxVGFodDFvT05F?=
 =?utf-8?B?NlNCOWdvaFUzMVdSUVM5aUE0VWZ5b28yVE00dGsrODA0clRsc00yYnJUdGVm?=
 =?utf-8?B?UFEzeDFpc0U3ZjNML2Z0Zm1DTHo2eXhHSGdqWlkxZEI1RGFZK0xkUm5URlZv?=
 =?utf-8?B?VXBsZTZBQ1MxM2p1bFhzMlh6TnZoSDY1WitYcVZrckoxMnV4M3hzSS84dVV5?=
 =?utf-8?B?LzdHakNwVTRSODhIOHA5NytYWUx5V3FTcG44VVNZVmxtR1k3U2tQU0ttekZZ?=
 =?utf-8?B?RlBwbUtlTHpEaldycTVQL0RzT05pZ2l4S21zMm1GNXBDMldjRW04OEN3SlRP?=
 =?utf-8?B?c0RuN3RKNWhmQjVLY1NGTlI1RmRoTGVFbytUeS9zWHgyWEJTUnRPSkNSd3cr?=
 =?utf-8?B?UU9CUDM2WWF6UWY2MkhCYmxkS1FQZWdLSkdJN2E0QWIxNS9ZNTRFZWY4eWRS?=
 =?utf-8?B?MS9wV00rOWNORUlNWDJIV0o5UTM5WkNRVkhIaktsSnl4cnIrY3RjbnJmVDJl?=
 =?utf-8?B?ejZWK3kwaHhibkk3TklsZ0lCQ2Z3VVFsUjNrRUcySTlLdjUya296ZzYrQmhs?=
 =?utf-8?B?YmJMeHQ2OUphSjZocVpnK2QrdmdwVEhITFArOHF6bXl4VEpkOC9OM0s4OFda?=
 =?utf-8?B?MS9BTnhHaytpNWNHcHdWWS9ueU5UUGpvdzQ2alE3SWJYZ0tPd0pmam5vZUcr?=
 =?utf-8?B?a2VpOEZhWU9FY25kUmppQVRBdU16UkUwdGwrdnFwTFlBUE90YjN6STVlR1pV?=
 =?utf-8?B?OUdFOHZScWxIa0dBak5wYkUvUGpJbFBhMGd5QjF1Rmowdy90SE1sZWlLRXRn?=
 =?utf-8?B?cUwzVWZ1UDdDb2x1Y2xKQnNWa1JadUNCRS94V2NkV28xQzI2TzNqYksxbmdk?=
 =?utf-8?B?T1hSY1U0NE1WMklBMkRQbDRXc2JETTlQSFVVT0k0cWV6bERaeHRQZC9qNlc3?=
 =?utf-8?B?Y3prdlpwSkltMExnV0FFU1JuNFhPOE1lYWZEWlVmSUZtK3pDNDRDNXplL2pO?=
 =?utf-8?B?RldiSnl0SzVGc3lXT2RhRmpQKytvbEhXWFZsb0RFS1FaL3RDeGN2VkhBeGdE?=
 =?utf-8?B?bUxPNXNYZjVkazQvOTVjcmdEMldXZHVIOC8zTTZEZUZNV3FkSm1HMHh2Q0Mx?=
 =?utf-8?B?RlFzelFyWFJNOURoeTFDVmFhK09PY0JHaVZJdFBaMzd2UzVBc2RUU2lYNjBa?=
 =?utf-8?B?UVR1UWNOYVpZK3FoVm9iZWxKS1IyTmVEYWVkWTVoTTljRitVK0dtR2k4NER0?=
 =?utf-8?B?ZktKYUN5V0RERkdrRzB3UTlrakxqUEZvOEhkZlVWUXdIM3REYmVpSWIrSUNv?=
 =?utf-8?B?VmE5eGpJMElYNFRnNXNvcncvbTZDY0taZlkxSXZxM1Z4RUxHTU9kQlM0VWpB?=
 =?utf-8?B?YU5GWmhPRmNOZitiTmhDNFFPNkNYOTBCZEptdTVpYkJLZ3RRMnlEdEJZMDJT?=
 =?utf-8?B?d251RW8wcDRMem9OODhmQnUvNktHS0JKSFQ1dDV2NzFZQ0dtdkVnc295WnZh?=
 =?utf-8?B?RHVaSFQ4SnFuR3k3YVFST1VmT2FwUDBCOTFTeGhybE9XU3J6c0d6Ni9VOVJI?=
 =?utf-8?B?dEhMa3J6cXBOMEQ3RXR5N0NVRlU1VXdpK3dSb212RXlzZjhuQjJpKy9yQlRL?=
 =?utf-8?B?Uyt1SjhNdUEzSE54VDVCeUpUcjN2cVNwMWtNMkNhMXNVaW00OVY4bnNOby91?=
 =?utf-8?B?MkFsd3VsdXVUUHhmN2JmMzZLVEZHTjRrdEE1ZkxrRGlTYkhXN1hVZzZoMW1F?=
 =?utf-8?B?d3NjcjM2dURhL0tjaHpJcEhKcjUvdDBodmx6VTJTVHJRTm1KY2tPQlJlb1Uy?=
 =?utf-8?B?Zm5CWWxCc3c0dTlBSGJxVHNNaVRNNnhCOTVpQUZYZTQ3WDZZOERJemx3aXY1?=
 =?utf-8?B?N2UvSGE4SERJOTNWN0dOL1FKMnlsLzl4bHEwQUVjUmF5VXNpbkhYM3pZU21q?=
 =?utf-8?B?MENFMENMN2FrWlFUeHVZMTN5RE11SWNVeEhYMW1EbVJLOEwxQnRUVGdLZTNW?=
 =?utf-8?B?Zjd6ZVd1SFdtbzE3SEpjOWJ4dnNYUkthTFJwWFVnSy9qb0R3MTd6VFcrTDhm?=
 =?utf-8?B?V2RVMUZlN1lkZ3ZmVGFBTUw4eDU3ZEZrMkQySzg2azBFTUxZWTMvUGlvSjIz?=
 =?utf-8?Q?v7HzoQLL6mZoVGcmUA/YyLM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f4dd5b-039b-4b86-0a4d-08d9e1a65872
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:04:41.5575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DecYn7yJqypCnNifyszmuyIt/H4t0S3bmgRdOEK9F4qelkeWToG1juuFzmArXkvC+JosVBa4k531sCF4KGQZwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8353

On 04.01.2022 11:57, Jan Beulich wrote:
> When not holding the PoD lock across the entire region covering P2M
> update and stats update, the entry count should indicate too large a
> value in preference to a too small one, to avoid functions bailing early
> when they find the count is zero. Hence increments should happen ahead
> of P2M updates, while decrements should happen only after. Deal with the
> one place where this hasn't been the case yet.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Add comments.

Ping?

Jan

> ---
> While it might be possible to hold the PoD lock over the entire
> operation, I didn't want to chance introducing a lock order violation on
> a perhaps rarely taken code path.
> 
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -1342,19 +1342,22 @@ mark_populate_on_demand(struct domain *d
>          }
>      }
>  
> +    /*
> +     * Without holding the PoD lock across the entire operation, bump the
> +     * entry count up front assuming success of p2m_set_entry(), undoing the
> +     * bump as necessary upon failure.  Bumping only upon success would risk
> +     * code elsewhere observing entry count being zero despite there actually
> +     * still being PoD entries.
> +     */
> +    pod_lock(p2m);
> +    p2m->pod.entry_count += (1UL << order) - pod_count;
> +    pod_unlock(p2m);
> +
>      /* Now, actually do the two-way mapping */
>      rc = p2m_set_entry(p2m, gfn, INVALID_MFN, order,
>                         p2m_populate_on_demand, p2m->default_access);
>      if ( rc == 0 )
> -    {
> -        pod_lock(p2m);
> -        p2m->pod.entry_count += 1UL << order;
> -        p2m->pod.entry_count -= pod_count;
> -        BUG_ON(p2m->pod.entry_count < 0);
> -        pod_unlock(p2m);
> -
>          ioreq_request_mapcache_invalidate(d);
> -    }
>      else if ( order )
>      {
>          /*
> @@ -1366,6 +1369,14 @@ mark_populate_on_demand(struct domain *d
>                 d, gfn_l, order, rc);
>          domain_crash(d);
>      }
> +    else if ( !pod_count )
> +    {
> +        /* Undo earlier increment; see comment above. */
> +        pod_lock(p2m);
> +        BUG_ON(!p2m->pod.entry_count);
> +        --p2m->pod.entry_count;
> +        pod_unlock(p2m);
> +    }
>  
>  out:
>      gfn_unlock(p2m, gfn, order);
> 
> 


