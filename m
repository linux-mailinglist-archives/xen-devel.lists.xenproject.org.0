Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AF349ADE9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 09:22:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260013.448937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCH5l-0001dn-H0; Tue, 25 Jan 2022 08:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260013.448937; Tue, 25 Jan 2022 08:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCH5l-0001bx-DO; Tue, 25 Jan 2022 08:22:17 +0000
Received: by outflank-mailman (input) for mailman id 260013;
 Tue, 25 Jan 2022 08:22:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCH5j-0001br-Kk
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 08:22:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e622f630-7db7-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 09:22:13 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-o7uYCqC1M5GvdcbJeq6gbQ-1; Tue, 25 Jan 2022 09:22:12 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM6PR04MB5351.eurprd04.prod.outlook.com (2603:10a6:20b:29::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Tue, 25 Jan
 2022 08:22:09 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 08:22:09 +0000
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
X-Inumbo-ID: e622f630-7db7-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643098933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zgv466W7GGfV1ytt+r/5KmJjbR7zUYjmsFEAHbyZsHI=;
	b=CC0iNt6/p5XEcUKOVkq03UoXY6Q41z4iyucpyi9xSSOHxbXCC3wHCObUvGWMn4Rw9kMo1j
	/pyqIM0s61myYKTxXyoDCJOIdQ93PwgNqvWjyPXvKxjfelHLxGl6OrjahUzd911ffeCVys
	FFzEtADYOSRz65mdexI+zKe74bapfKE=
X-MC-Unique: o7uYCqC1M5GvdcbJeq6gbQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b84qcDz9FVqF4PI7QIe3xmLisi24WEaB4kMExmihfizcRY9ZCU6ibZlKu/Axb6bvL5uWrvb/jnW3Ri9AOUrcGHXvow8xoVos+KyQoZcrbuKydfcMVxN7TPSnxnu7aYQzpMJQOkQVm62lghTV3FYVCGw5Fx8HSx4kxKywd6YpFtovhnRIgzGtwBm/f8jv1pCRapuBq0o74ZII1Wj7JQ1mAKR8UjcA99WhpCtiz+aiXiEqLwjmok3Cmds1uLLMMdSk8ayXbcuZDmN1vsocJsSral2sWbdymO+/jtwU90qdpBQrcJjqDyGQLD9sY1RWiX8uyIsQfVxdMPNB6Kiv5gJBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zgv466W7GGfV1ytt+r/5KmJjbR7zUYjmsFEAHbyZsHI=;
 b=ZiU8+Q5VZZNVSFHFPXPWwE+ZQOrIsERZG9a7bmkJXB7NYOpKJxzQYYkJtQMg8W5GYWtzAe2HdsVUe/RkZtjDWWLZyiNVLbuSnl8jPj68n8Ufrxps4mzkG61qBlvtd0hjDPSNh/e2E8jTxh5H7RO3WLPJ41Qn2mv+sCbcnrYi3AVGl/71hGT7EjhbvDeieRB29TiaCTn+DiUMdeD9MvJVskfDQP/mZ1kNoBAxYMoxy9QTazUlcp72dEzQXT98WXrckVplZutzmz97fEthirf9K155DvK4kGpK592g408lz7/wWtY8smxqRFhsNTL3eYQQ3ANA229GiuZfBg/+Yeb3Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <14af544d-0d20-9b58-4d70-5f5086ece032@suse.com>
Date: Tue, 25 Jan 2022 09:22:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-2-sstabellini@kernel.org>
 <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org>
 <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0167.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::22) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ffcace3-fc78-4f6c-d854-08d9dfdbc7fa
X-MS-TrafficTypeDiagnostic: AM6PR04MB5351:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5351FCC65AB0F1BC3F603627B35F9@AM6PR04MB5351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q4yU1YDcCXX5HfMS+2ZML0shnGj7V4frK824oc8ztFQVRAwiKo8eU+/CQRcYcBbEYsMNpMNjkHftm3tcwVmPMy2hrrIY8mX9kv6nVGFpobLneZwux/PwN8s9WfT6SD/v2vit3Atl2S2wlB7yEh9QAKszZ0SESrGZdWTg91ToZgxyuumNNv0Y1NNcG8zAk4v4ip4cK6flxZ+M2Q9vtx83QWUTyBU54I0csK5vnqiPLlhHGXGpMSzUPim6RQqdQWkXRZzDe8NwqoCaPLuuMwBdyC4JZy91/Rrgm+tprJD9nLtQeOHTgeEUsJGvl2twLyS4LUEo5m52u1XHMwYGIjGxOISqxXWMM4ncWCgUB+/dOqAjZBwF2WmnvN3yYflSKTBU51ylqrsad/qUvjYdeGb8PyUxVn4wF1C0WC1EbAuJ4eh3vcTlS0iqn+4w3/C92J7DwbfZR9EHzulm0HTMrc0zNNQATybNkw2YI1X7HcIybiZcRBJawJQwVYm54kk28rTOGE4/MjyXM9HzeZrJhKJ5T2gcqsLpGP2vIHMGwHMVB53CRNSflRW7lvDqB6lYqmma0v/tYwTyxcQ2KY4lpJLjD6Q4gekxPudS+Uc4rQrRiaqin/0pBxkaAbdM4UHO7Pf7dKzPm77ouh19GRlZ+ZLxmxzxmBL8H/qg+6eqjp5paeu55jCZujciMKEQGDJxzJmBeKHU6gqhWQx1J8ldSeVNFJJzDJaMhx/3pT2v/pI5NSQjDNZFJ94tJgnWeAIBnu2Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(508600001)(6916009)(6486002)(5660300002)(38100700002)(4326008)(36756003)(26005)(186003)(6512007)(86362001)(31696002)(66476007)(316002)(54906003)(8936002)(2906002)(6506007)(83380400001)(53546011)(6666004)(66556008)(8676002)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak9YRlBTbXRCTXhjK3hiUWljNlU4bzlibEpIQUphRnNVYkxpYWdVZ0lNSytH?=
 =?utf-8?B?Ukt1VVhXSHVGdzJNV0R2Z2VZZnZEUmc3WGhUUXl1VGRvR0lrMk5SbHpLWFpl?=
 =?utf-8?B?bWhhZFN1dVc4dlNtT3hLRkhmZDdwa25Ud2h1TVlLNStMRHBoa2UrcktSek9P?=
 =?utf-8?B?aXg4MlN1SzBNSmFsa05vVE1WTUFQdThEbnlIZ3Z4MXhkUkxpOUR3MmhNTm9G?=
 =?utf-8?B?dEdvaHRrL2gxNHo1dHhNV3dSZkFXbHF0UmNJL2NBaWtURGRPcGJETWpqMjBR?=
 =?utf-8?B?OTl4WW0wTTJvSHhycDBDekNjWUZ6N0FyQ3I0T1lDV0dXLzE0ZUcvTFh2RWdQ?=
 =?utf-8?B?VXVBaDZTVDc1M2JkYWFGR1JHTzhlTlRobUZGUVVOZjEyVmFqZnpuMGVvNkRD?=
 =?utf-8?B?TGxaQzlKTENIdXppMTdySnJZUjdFU3FCZUtTbmIwenJsdWhDSlVFRzlTN0dS?=
 =?utf-8?B?a2dXL0hxYjNrdlUzdk94SVM1WkdveDc4WmFvVzVjcU1kV29DOEZVVzNIZDUx?=
 =?utf-8?B?Y3dkSVRHRXFqeGNVelV2dUxrdlI5a2dUYmY4UzVucXA0T0JTZTl6MGlRUG1I?=
 =?utf-8?B?Z3BNalI5bVhxZWppWGZTUTFzdTZyMHpHeCtjd1JEZHh0M0lORTh0ZDkrTE00?=
 =?utf-8?B?dmFMdGVyUUR0d3VmdSsvbzdrQjNHSmxzK0htb0FpNUFMSUJtcU42VHhZTE1T?=
 =?utf-8?B?djhZdi9xbmpKeWo2QWRBekkxTFRZTUtwZWdNcXVsV0NJSVVReHZxRng3bUpE?=
 =?utf-8?B?cHpOcmVVN2QzMnpEUFdyWUp0YURGVDNpTjhMNkZNS0tUKzZhOUJQbEZZZDhp?=
 =?utf-8?B?MEM0OUVBSFc0UHhaNEVUVFIySkYwdUpxbUhWVVlNYkk1NmlQQk1ndU9XT282?=
 =?utf-8?B?T0lycjNFdHRPcUlhYjVvNWg2cGNsejdTVXdNRU52MEFPSU5yKysrUDJFb1lr?=
 =?utf-8?B?WkRZMndMRGFTQ3U3SFRZWE1QcEkzOFpuNCtBcllMT3dWMTg5U3R4YkVsck1i?=
 =?utf-8?B?ekZVYVJFaUlaSHVzOTcwU3h1clQxZ2Q4cHl4dUZMak1NRmRnMlhHVjlXd21P?=
 =?utf-8?B?SGYyME9VU2VFSXBMZ2VoVU1vOXVUR3UvVlgveE96QVo2YzVLK2hleHN6OWlw?=
 =?utf-8?B?Ym1MUUtOZGN5c3ovK3hybXZkdWo1eUxNK0RQVEwrRUV4cllxMk42Qng1c056?=
 =?utf-8?B?NXFCd0s3YU1XbXYxNWl6R051N2tyM2VrK0RrdGlycDZiZjIvTU8xdFdwcjFS?=
 =?utf-8?B?THhHVkZYV0xZTjhMb2wwcnBtdVhNQXUzTEl6YXdtTzhoTnRWY3Z6WnJveWZC?=
 =?utf-8?B?TlNZUld2cGdnM3p2SHg5YXZrK3VJM2E1ampGbjhYNTBSajZOOHEvMWd3R1RS?=
 =?utf-8?B?Mjl0a29SSnh1NWo2emtzcjBITWRVbTFrZVdDSTNUeXFTLytKOTFzSzg2MGNM?=
 =?utf-8?B?dDRuTVE5cllGQU1hZHpYelVMb1gxeDd2c0xpUmdaTjJHVjlvcVBodkVpNUdy?=
 =?utf-8?B?ZmYzTGRST0FSVE1ZOGMwWk1RcFFmVkgxbkNXYjhNOG9RMlhQMGhYZ3hXdTc3?=
 =?utf-8?B?K0JmOTdIY3ZneTNBcnluUHVLU0Z2dXptUmswbW5WQnl3QXFtc0lqQUlNQ0I3?=
 =?utf-8?B?WEFaMldWRlJ3MlA0UDg3QzlacjVleXBrYVZtdjE2bTZMK2lKYTZyL2h4WThH?=
 =?utf-8?B?MmNyMG9tcG1Xak5LbkRVMG1paStTOVhuYmhkeDYzNTlrK1VJTFYvYlBTeTcw?=
 =?utf-8?B?WnlRTEUvREtidURCOEM5ekFvdDRhMnA3eENiMDI5cms3TGZHU25ybTM4R0RK?=
 =?utf-8?B?VElXMXdqNlZLR29TS2NRSjJ0anJ4d0R1dThpeVFpc3dDQzFpSnk3NURXR1VM?=
 =?utf-8?B?aUdMbFErdm5rMkoyelNhaFNYajkvaUhCSm5FSVFzKzEwTlZqSEY2ZXNGUFpH?=
 =?utf-8?B?MzEwWUhFTk83REsvWUJqQ2IvcGROc3lGSDNlVFZxejNVekFtb1VVeEJEYkw3?=
 =?utf-8?B?ZVIzbUtDWk8wenBseWgxWDBaem9kaTBKVjR0K3laOFFQTkJpbWZVT0k0bE5r?=
 =?utf-8?B?aUZvODNwTDZjT2dMS0JxWDlwMXc2aFJZVzJqKzVaaGZCb2pSTjNQOGZxckRC?=
 =?utf-8?B?Ymc0MWhHdW9FeUphM3RCd3VJaDkwUFlkaThIRnB6NGVTL3ZFMTZIY1o1aUhu?=
 =?utf-8?Q?VbSRMmE0v6MkHw9rIXa965Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffcace3-fc78-4f6c-d854-08d9dfdbc7fa
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 08:22:09.6666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQbwMTXpt0lT7cCfY9C7VS+hS39GdTsrAjYyo1KI76PtB25vTRcwrWHFyau64rCatW2j9UwCZIT05dN9cuXgkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5351

On 25.01.2022 02:10, Stefano Stabellini wrote:
> On Sun, 23 Jan 2022, Julien Grall wrote:
>>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
>>> index da88ad141a..5b0bcaaad4 100644
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -232,7 +232,7 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t
>>> port)
>>>       return 0;
>>>   }
>>>   -static int get_free_port(struct domain *d)
>>> +int get_free_port(struct domain *d)
>>
>> I dislike the idea to expose get_free_port() (or whichever name we decide)
>> because this can be easily misused.
>>
>> In fact looking at your next patch (#3), you are misusing it as it is meant to
>> be called with d->event_lock. I know this doesn't much matter
>> in your situation because this is done at boot with no other domains running
>> (or potentially any event channel allocation). However, I still think we
>> should get the API right.
>>
>> I am also not entirely happy of open-coding the allocation in domain_build.c.
>> Instead, I would prefer if we provide a new helper to allocate an unbound
>> event channel. This would be similar to your v1 (I still need to review the
>> patch though).
> 
> I am happy to go back to v1 and address feedback on that patch. However,
> I am having difficulties with the implementation. Jan pointed out:
> 
> 
>>> -
>>> -    chn->state = ECS_UNBOUND;
>>
>> This cannot be pulled ahead of the XSM check (or in general anything
>> potentially resulting in an error), as check_free_port() relies on
>> ->state remaining ECS_FREE until it is known that the calling function
>> can't fail anymore.
> 
> This makes it difficult to reuse _evtchn_alloc_unbound for the
> implementation of evtchn_alloc_unbound. In fact, I couldn't find a way
> to do it.
> 
> Instead, I just create a new public function called
> "evtchn_alloc_unbound" and renamed the existing funtion to
> "_evtchn_alloc_unbound" (this to addresses Jan's feedback that the
> static function should be the one starting with "_"). So the function
> names are inverted compared to v1.
> 
> Please let me know if you have any better suggestions.
> 
> 
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index da88ad141a..c6b7dd7fbd 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -18,6 +18,7 @@
>  
>  #include <xen/init.h>
>  #include <xen/lib.h>
> +#include <xen/err.h>
>  #include <xen/errno.h>
>  #include <xen/sched.h>
>  #include <xen/irq.h>
> @@ -284,7 +285,27 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>      xsm_evtchn_close_post(chn);
>  }
>  
> -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> +struct evtchn *evtchn_alloc_unbound(struct domain *d, domid_t remote_dom)
> +{
> +    struct evtchn *chn;
> +    int port;
> +
> +    if ( (port = get_free_port(d)) < 0 )
> +        return ERR_PTR(port);
> +    chn = evtchn_from_port(d, port);
> +
> +    evtchn_write_lock(chn);
> +
> +    chn->state = ECS_UNBOUND;
> +    chn->u.unbound.remote_domid = remote_dom;
> +    evtchn_port_init(d, chn);
> +
> +    evtchn_write_unlock(chn);
> +
> +    return chn;
> +}
> +
> +static int _evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>  {
>      struct evtchn *chn;
>      struct domain *d;

Instead of introducing a clone of this function (with, btw, still
insufficient locking), did you consider simply using the existing
evtchn_alloc_unbound() as-is, i.e. with the caller passing
evtchn_alloc_unbound_t *?

Jan


