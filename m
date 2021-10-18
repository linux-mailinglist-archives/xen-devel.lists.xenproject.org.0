Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEB8431235
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211832.369505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcO6c-0005iV-GV; Mon, 18 Oct 2021 08:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211832.369505; Mon, 18 Oct 2021 08:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcO6c-0005g9-Ae; Mon, 18 Oct 2021 08:34:50 +0000
Received: by outflank-mailman (input) for mailman id 211832;
 Mon, 18 Oct 2021 08:34:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcO6a-0005g1-KF
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:34:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4009c12a-2fee-11ec-82cf-12813bfff9fa;
 Mon, 18 Oct 2021 08:34:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-4-egRkkfEqOFyLqaS_4orqyQ-1; Mon, 18 Oct 2021 10:34:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 08:34:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:34:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:20b:92::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17 via Frontend Transport; Mon, 18 Oct 2021 08:34:43 +0000
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
X-Inumbo-ID: 4009c12a-2fee-11ec-82cf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634546086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1WCzCUHowXa3IVmqwgrjYgiYZ+gsIQw4nCQKvcHNBQ=;
	b=d4+kRcUjhLJQxsrU2WjT3KpIOn5P0/C/E8Yun13/Cgyv2JIXUcRStS8cEU1sxKXTvbApEs
	RZuTftCX/jccL2QtzEPYsXU1cfDXXGtGoKwgHmyDZ0CwRvKis7/M/aeVYyxUkHEqxkfQ/q
	KQnubJ2VZqX7y4QJoYmCGpwkNichCBA=
X-MC-Unique: egRkkfEqOFyLqaS_4orqyQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFEZQOC9hQ40uTXlS26LMAP1K4jJfQPadRGvMiz3VyTXnnN0keDr1178XzGAKtaA83f1aKGYPNM1srNKxhYCuNd4b2lTSzWqBUGc5xo9KolV4CT8SzVHYBNXRisS6zzGf0CZC+HRVCmIW6vEVYq58mP4jce5vpgDA8on49xiS2LaRs46NlSfPrCxmHl9csfFq/LpTzs7hweMSfq/aPZp9jqpPU5OpiuirnYqpE8sMb4WPAxivh6zKCU4pn5pbVjxhm6073PpAryB7oHdIDN2XgUKaFLRU7wdYxECINArmEJmEupjUjOTh4CEXcpeZ+V1tqqQsgP9GPQlGg68+f4uNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1WCzCUHowXa3IVmqwgrjYgiYZ+gsIQw4nCQKvcHNBQ=;
 b=YmVP4Gwb+5ZiFx8YY/qS16lo7ZxBKpMZJwHvnETnlUriKysgENSo7sVy+r+gPd9T3KW/COZ63h69rSOL9cIuqO+5BaqORctJqwQlYk1T0B2OTP0mj9bfz4V/7La+2WqFpOuyHB9MWvnsMfOmpwGMImgHtdszh74SQkK1nPT4bW3rt69QfE9XAE5QB4LCqKZDkuzdEOJpBrSRiOXNUl+91JX9g6Mey3PLFgVxk+XLbmLgW71dadW0gQ9vLGDq4FA+OVFrtB11vtSmfvUYE4yeYIVCvjF7u94MZSGCo3sJGuEqwlbWQVcaO/rEZlLa3gAgRMYzhYB0jRyTkrey+SiGPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Ping: [PATCH] x86/PoD: defer nested P2M flushes
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
Message-ID: <462b493a-a745-e6cf-b86c-c4dcd285acb5@suse.com>
Date: Mon, 18 Oct 2021 10:34:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f057857f-9789-463a-5bb7-08d9921222d7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55974C306AC1B7D1FE8CC703B3BC9@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gOAG4YzJPz/Gka+n6lJM6mUERRiGv6Hf5ipwzu8HBnqeggtrC3WQYwx7e54yOJpcrF/j78XoodVzcS7JmzytqmBlHDsMHXm53GylUtFiEC9678aQ+D3hO8Hb1HQ/Bvgq41E9TtB58g4/yijGpJSxcBL2ZhdgKMjF2JD7b/7ZrN2IABizSwf4SEqDaicqkhh8z4tbXusLTwzu8KtYJqSMVaePn/AAu17rZQhY0gUmWSZt+jA7JC3yBOK+E3uzRhR/hDAoyVyYOlDq0g9H9DkIcps/mgXDeLur56KyY2yn9Q2TNQAMk6Ic0q2577btb5dLNAxUzkw2SwJ1IABLN0Uxx8Nyj1RREGYxnDHrnZYfK2lZRxJ03tuT76KLP3iZWxLCTczMs0nEo4sIYShUu7t2H9b0tz/Fi4GYZMNjOLEuX0e8bdKJbV6ZDW/RDbMeaYE3bpeNG80Pfeid/G6g8kx+cr21h4n0VOP1fIHmjTyBhKXJ2yShQc9s8moBB+Z8G3TfXX4kIAveLunYXIa9tapBICgQIw22lbzkhjS1S5+ZWz6V1JOg82lW0+KiyFxivdyF2ozt+WVatqzfBCc79q3Wn3fRNBB4r9CHm3jnc08YTE6zUbovUwjLiGf1X4d2Z6Quc1lBoX00JhaXKJ17qsh5CSdcBUnOeAo6YofMyntwANa5+iquFfZhqQY3MzpfV68sWa0l1JubWblfpvoo9VtQW8cSmjg8CSgyKU0XvI0s3cQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(316002)(16576012)(2616005)(86362001)(54906003)(66476007)(26005)(186003)(6916009)(31696002)(36756003)(4326008)(31686004)(8676002)(508600001)(2906002)(66946007)(8936002)(53546011)(5660300002)(83380400001)(38100700002)(6486002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2RWTllGd3U1WUdIMmtyb3ZiWWdDQVpBUnJYb0lldmE0dWlEbDJ0d1ZzSnU4?=
 =?utf-8?B?OWdYc05taDRlTDIwTm56TEd2ZERiOHl3VktZU29vY0lSZTlzL2N6OWRBR1FB?=
 =?utf-8?B?VEdldm50ZjdFZmVWQ1RQWWhTRmR1eWpMc3VEOGdEMkF3YW8xZk5XcitwZUY5?=
 =?utf-8?B?eHI4WkFZVW9mbTYyb2JKYTNyZWhlSit5OGc0UHBpdFgxaCsvaTFKSnV0U3hQ?=
 =?utf-8?B?QTcyaERVcE94c0dVUDFwSU9LeXdXNGs5SjBzMlA0TElmRGY4K1QzZTRzb2VJ?=
 =?utf-8?B?U0RQRklBUFU1T3JQK3hLbmhKNjhmQUlRVnc2eHJBOUdSMHo0ZStGY2Rkb0o4?=
 =?utf-8?B?RVljVXlBdnhxYVhJQytuNzUyUVZheVFUeFNuNFZVMGtaYlZ2OXl0SUpoQTJj?=
 =?utf-8?B?YUY3c0JoQTI5dCt0Nm54YjFIMjJzaURaQXRYOUF5TEt3cWVaSXpaMFV0eHNr?=
 =?utf-8?B?SVNiT1RHZmVnM0NrY3UrVHp1N2ZyQkRGRGUvUVE0dXFhSUtBUWZWWXpGM2lD?=
 =?utf-8?B?cVB5aFU0V2VYd0pnNXg4TjI1SlROajg4RWpsK1AybjNYSFA1bThqbEUzUEFP?=
 =?utf-8?B?SDU3Ym5TTmxrYzNXTlpOd0VCdXdRZjI3dlppN255QloyZXpDV3d1aDNBVWN2?=
 =?utf-8?B?Qm5kbXl1WVJLVXhJYTJOeC9HTzdKcmgzZWZvZStaeVdHcUswTmhuSERHQ1Ey?=
 =?utf-8?B?bzJ1RllmbkIzUHlYV2lkN09YWG0zOUpWYlZHSysxamhIYTZraHk3WFNoc2h0?=
 =?utf-8?B?TzcyUWhhMXQ2UXk2ZTZhWmh3WUtWN0VaczhZTGNQSEYyRnhHVXpiQzAxNmNi?=
 =?utf-8?B?UzRCcFNXZE9yeDBxM0RkRUkrTElhWUdBUFZ4QVNacVduWWZydlBiUnBxTUVq?=
 =?utf-8?B?NDhBR2s1M3FVN2liK3Z4RTJiaXFvdHl4NXBXbzhYd2p2RVRra3Z1K0JqRWVO?=
 =?utf-8?B?SmNpdW9TdWxHL1BWamdqcDJRT1N0YlplRzFJVHVZaGtFQlkvajBhVGtaM2Y1?=
 =?utf-8?B?alkxcHQzQ0F0bXlwNEoxcU9PZE9BdGt5b1N3RklmSWhsYSttMGhPYkhsRXVv?=
 =?utf-8?B?dGdPbWVLa24rZThRYnFYUUlLeXlSRjBLbVg5bllwRkxqVU1saTlKNUk4VHJq?=
 =?utf-8?B?V1A0dVI2L2NpYzBiUjBxMC9zRDE5N05PbGJLQW5yaGNUWlFMUWxlR0VlNVhj?=
 =?utf-8?B?UEFYNUJxTzFYRGIrdldTbEhaajVLVjdWY1lHdkNkMGRUTjd4aHZSSUdIbXdo?=
 =?utf-8?B?alVEdU5IUlh6UlZIa0tZb3VKVnpKU0FlZ3lMc2hJL1k0b2hPaXd3b1grMUtM?=
 =?utf-8?B?STQwTlNNWnBTQWd2V01jazZZQU1kOGw0SWZ1VTh5ZWszUS8vNForSHZQSGh0?=
 =?utf-8?B?aWJGVjYrd1l4c2M5R1FSTDJDWWpOM3ZZMmxBYnpJUHV2dHVTcFNrWUJMaGZm?=
 =?utf-8?B?bS8xZU9ieGIxTTVhUENOYll5blpub1pNZ2pWUGw1bGl6dnJ1U3NOZXAyeURy?=
 =?utf-8?B?L2RTTEgrNlI3RC9sRVJzam4rZU5HSjdZVnlCQWZPeGdBaWZFeW42VkRpWlpW?=
 =?utf-8?B?MlRtK3g2SG9iVjFzTlk5Nk9BOE1pVkJnaXNsais4MjhmRENxSDFKR2FkbkJW?=
 =?utf-8?B?eEY2V0lnR0dhUWs0MTBrV3VPMUVUUEg1QVBwaGV2TnN3UWNHcUZLR1Z0Qmp5?=
 =?utf-8?B?aGVsL0tuUmtaSEFHeVV1YWp5dDhBaXRHZDJlUjh0cjJZVnRoRGNoR0V5dHdJ?=
 =?utf-8?Q?k8BD3gkfJf8cvZlrpAVxmluR4MwtCRJjLSvGR5s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f057857f-9789-463a-5bb7-08d9921222d7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:34:44.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UT55Qu8QCLXdBD9dJnYNvBrGQDfMqNQthjvhsu5XBTr6VOo6U4nEvP30VvQSkA7fYMT8UN1vLPy0yOG4TjEsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

On 11.10.2021 10:17, Jan Beulich wrote:
> With NPT or shadow in use, the p2m_set_entry() -> p2m_pt_set_entry() ->
> write_p2m_entry() -> p2m_flush_nestedp2m() call sequence triggers a lock
> order violation when the PoD lock is held around it. Hence such flushing
> needs to be deferred. Steal the approach from p2m_change_type_range().
> 
> Similarly for EPT I think ept_set_entry() -> ept_sync_domain() ->
> ept_sync_domain_prepare() -> p2m_flush_nestedp2m() is affected.
> 
> Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Thoughts?

Thanks, Jan

> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -24,6 +24,7 @@
>  #include <xen/mm.h>
>  #include <xen/sched.h>
>  #include <xen/trace.h>
> +#include <asm/hvm/nestedhvm.h>
>  #include <asm/page.h>
>  #include <asm/paging.h>
>  #include <asm/p2m.h>
> @@ -494,6 +495,13 @@ p2m_pod_offline_or_broken_replace(struct
>  static int
>  p2m_pod_zero_check_superpage(struct p2m_domain *p2m, gfn_t gfn);
>  
> +static void pod_unlock_and_flush(struct p2m_domain *p2m)
> +{
> +    pod_unlock(p2m);
> +    p2m->defer_nested_flush = false;
> +    if ( nestedhvm_enabled(p2m->domain) )
> +        p2m_flush_nestedp2m(p2m->domain);
> +}
>  
>  /*
>   * This function is needed for two reasons:
> @@ -514,6 +522,7 @@ p2m_pod_decrease_reservation(struct doma
>  
>      gfn_lock(p2m, gfn, order);
>      pod_lock(p2m);
> +    p2m->defer_nested_flush = true;
>  
>      /*
>       * If we don't have any outstanding PoD entries, let things take their
> @@ -665,7 +674,7 @@ out_entry_check:
>      }
>  
>  out_unlock:
> -    pod_unlock(p2m);
> +    pod_unlock_and_flush(p2m);
>      gfn_unlock(p2m, gfn, order);
>      return ret;
>  }
> @@ -1144,8 +1153,10 @@ p2m_pod_demand_populate(struct p2m_domai
>       * won't start until we're done.
>       */
>      if ( unlikely(d->is_dying) )
> -        goto out_fail;
> -
> +    {
> +        pod_unlock(p2m);
> +        return false;
> +    }
>  
>      /*
>       * Because PoD does not have cache list for 1GB pages, it has to remap
> @@ -1167,6 +1178,8 @@ p2m_pod_demand_populate(struct p2m_domai
>                                p2m_populate_on_demand, p2m->default_access);
>      }
>  
> +    p2m->defer_nested_flush = true;
> +
>      /* Only reclaim if we're in actual need of more cache. */
>      if ( p2m->pod.entry_count > p2m->pod.count )
>          pod_eager_reclaim(p2m);
> @@ -1229,8 +1242,9 @@ p2m_pod_demand_populate(struct p2m_domai
>          __trace_var(TRC_MEM_POD_POPULATE, 0, sizeof(t), &t);
>      }
>  
> -    pod_unlock(p2m);
> +    pod_unlock_and_flush(p2m);
>      return true;
> +
>  out_of_memory:
>      pod_unlock(p2m);
>  
> @@ -1239,12 +1253,14 @@ out_of_memory:
>             p2m->pod.entry_count, current->domain->domain_id);
>      domain_crash(d);
>      return false;
> +
>  out_fail:
> -    pod_unlock(p2m);
> +    pod_unlock_and_flush(p2m);
>      return false;
> +
>  remap_and_retry:
>      BUG_ON(order != PAGE_ORDER_2M);
> -    pod_unlock(p2m);
> +    pod_unlock_and_flush(p2m);
>  
>      /*
>       * Remap this 2-meg region in singleton chunks. See the comment on the
> 
> 


