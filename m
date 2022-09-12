Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF91F5B55D1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 10:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405514.647948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXefN-0000Ra-JS; Mon, 12 Sep 2022 08:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405514.647948; Mon, 12 Sep 2022 08:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXefN-0000Pk-E5; Mon, 12 Sep 2022 08:19:41 +0000
Received: by outflank-mailman (input) for mailman id 405514;
 Mon, 12 Sep 2022 08:19:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oXefL-0000Pe-3M
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 08:19:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3a6ec3d-3273-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 10:19:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8964.eurprd04.prod.outlook.com (2603:10a6:20b:42f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 08:19:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 08:19:35 +0000
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
X-Inumbo-ID: a3a6ec3d-3273-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4m6Vz5ft/AVcWqRS1TszydO44aaAprXYDZ/BUwVj9q2VdH6OEYTmLvZ6YRo5LM+oqx+UE+8b9KaboKmj04b1j5kfiB745b3u+8O7x3AC4SUakV6KHdhs68fpSTTn3GsTr1LfrdqU8cMEE4F6BLdI+5hCrOnNqBF3T6LH1jWSU0O76TE9q4T4XvCHCdUt+V4ViwSGw9buUy2Ttc1rwOM6sIIKeHB7bvVU5Eqwn3GPGJVtSEbh/33Ipmbjc2MaduYPMaIxQKkcpj7fwcB1nEa1Z6mRbrA+WPM0HRBUzbFBN5+I7EwGjzYjqgRXz3a+nwGw+e1WRbtwUd9qyBb7OCN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CpTGMLyLtXeWbDHr5OLNdMgVmEoioIN6kAE9108s98=;
 b=JiMZve/LLXa9Go1moKswPIHMORE+7FIBUgP7ws6FaQ/tJDf+IrQp6XRVIbF89L1mjMn5qzgcEo4RrqBrEFOFk0n5bX3JRFd0wFi4NzmuuZ1PUc1MLhZ8gbjiFbyXb3H44R6kAKX/oLG9hKKkwqIagHeRYirAmB3lByYa4C/9dZDrI8u1PfBtVW9AG8yqCojues0pA6DdWgOjm7viEClSCFYpWfb1UrxMdW/2n+rG2CEsBHSHKa+uC+3G+8s4kUfD57CTNx8DZvPN+Ka1tv+aV+ppYNvWzRUrNhavoRMRpLIzBToTXLRejHUMYWTmcyzGFJNPX6T8UvPeuRUubZQvMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CpTGMLyLtXeWbDHr5OLNdMgVmEoioIN6kAE9108s98=;
 b=RlZC1PEBfAp3/ZqNjbzax1WRD5r8qpBkx7iAzAFlEis0fWIothEMm89yQkMVO5UDg3HXJoDkEJkik1s3V5S5J0CFdwUCkDh3X2CCHRmLd3VeWicBUxk3rE/58/CXfkopekcSCEjQU8mhGCrtONLOq4KVoy+ZxK/7M2yg/pGZNnE7jU1BxXugWhjXEuGO+BvYSqtNaBaheFrK07dvyEmvvZR704UzTMu+ixiAzC8Ca6E/qVsLQEo1FqcZdXSCdy/UQiA/DVI2G1v+cJ6msVQIxw8tFwDxx6gt1X5ag65TBLow4jKqND8enog5MmzzEIREIDKFh8OVSFlhT7zScbvNJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1f2b4a1-c8d5-a481-1075-0227877dda8a@suse.com>
Date: Mon, 12 Sep 2022 10:19:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] xen: add domid_to_domain() helper
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220912055356.24064-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a717cc-3f75-4391-8ec4-08da9497870c
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qPSuSFkaQuj2LVTG5CnKxTPVkBdSkGnWefhswKGvEm7AG/tSAK3HYQcnJwfx8fyw1dR+9+0Z1jfRDNEpGeIIdVbkvqJzWFYINk3egIExGrYOjMY93+wa2yLGNoICXb7mPg3g7ZXAUY/0hYUos04mNPOqhXjGi71u+FdJ7Xu49Rp8IUgKZgIv5mCqm9GsAQlLk8f1W5aCyKHqKLPoVkBC+E2oNymrqnN3zf1sc9le8Rs23iiBZGiMVO3+7UTU8qNsnwT6zyNaZkddU32qTVxhVGbaUlWfkhMkGAh0EAmP08rrLdIQgJvWNN26wSl1QP5PH+iTJ7dLc1rf/eNCkU8qFJQlKtvRSemSGkZgSMgRqFNIATMvQFWVFVnK60uuxbkhH/TM0aGsFJ6JJMl6Ny9LMkr29xcr2s0I6aTSbVAaeR5kYqDNvIxBsbwiSM/QpFitXkMNgpTMnp1GRYLH7I9QdjpkvH9qrJ+2sTWGHS0t3w5gQCfHex5QVQ+Qy0x1u6TqYfhPP08ytTcW0rMVOyufF+im/IvkaXcU3xQTw6eT5Kt4IicWF12+3J4dMc5yq/QFpd2h6ROrvZ1h8wtez8bEgpFr1gv7apWLxq2FNAY+TD9lZ4nuVxZFLkMmjT1PiBx9396f5PGqvrVkDQtaEi8LwnokYHjf0M9IJHGq/c9Cfe1b/w5WnpOipHJKEgbcQDctG88S6ZxhU7HKzdLLHzhrr8cz4A5ycWqS/Epvwz79TojOoZfweXby1Xeg178r/AGQ5NGttfH6lnYCHEPq9OJBL3d0Ob3kCfCNg161zGaP5yU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(366004)(376002)(396003)(136003)(38100700002)(8676002)(66476007)(66946007)(4326008)(66556008)(31686004)(31696002)(86362001)(36756003)(83380400001)(2616005)(6506007)(26005)(41300700001)(186003)(53546011)(6486002)(478600001)(6636002)(316002)(37006003)(54906003)(2906002)(6512007)(5660300002)(6862004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDRodUNZTkh5S0VXVVV3eU5XT0hYYjFHUVNkczdzNThrTVh6MDJVQ1djOVVG?=
 =?utf-8?B?WFhKQ0JpYjgvZ0E2cnhMc3p1RnJQUnF0UXQwUzFDUWdhcE5aNG1iSDNDLzNY?=
 =?utf-8?B?WUk1ZDVLNkZoRmpKdG1oK2d0YTh4dERnSzM3cFBWUmU5WGlKK2t2ZkZzcDBG?=
 =?utf-8?B?SCtZaC9rdittVFlzZG5lOG5GTTlGUFBWUUowWEp4MVhEVkppQnJzWWlDNUhR?=
 =?utf-8?B?L3lvT0FLSDQrM21JWU5jWmdvU2RCTXJyQXgvYTc4VVpDZlFsTVZhL1BjU3lx?=
 =?utf-8?B?RGErWENham1UZEU3MUR1MExFa05ESDBxWHRYK1pPMStHeXhkY05sYnVWT3Vu?=
 =?utf-8?B?U0t1WUxNWmt1Nkc0Wjc2V3pKRVJqQmtsbW4yR2VYV2RSZ3gzQVl1Vm9FcE5p?=
 =?utf-8?B?ZHZxUGwyWGFPQ3lhQmZrdzRZOU1RMUNwWmlvYUQ3RDgrV3FzMkRDUWZHd1VM?=
 =?utf-8?B?d1p4QmM0U3FGWXZpc3lwZnliaHRBcUlkbWFwU0gxYzRoa2ptaFE0Y2N6L3NO?=
 =?utf-8?B?UmxaSVlqYVpDU2piaU5QYjVEVDZxMFVNRlcxaXBxRFhmWHVMNWd6bndyQjRr?=
 =?utf-8?B?UVo0T0Y1djAxR1BDUGZyTjZNUlJnNkVxRnNwMmxkY0VsTnh5dE00NVJHMkhk?=
 =?utf-8?B?Y3l3V2huTnRYTHkzUndBSDYrSWdPNkdtRURrSldkbzJYYWlMT1hvbjdMbzJ4?=
 =?utf-8?B?S0dzSnorSngwSStqV1NGWXQyUVdjVE1jY3gxcWJhY2FLT0JEaGhPOWFqYXd3?=
 =?utf-8?B?cCtEYnAwSzRhMFlWRFkyaTh5SnAzSTF5VkR2djBndFprNythSTNlV2ROalVO?=
 =?utf-8?B?Rkw0Wi9jOHFYVFVvck5aYTFHRVQ0RVV6QlN1dS95MXNkZjhhb1JqaHRyNWRy?=
 =?utf-8?B?UXBTYUJWWWR1RXU2azFMZ21ycHVBMUFMOFhwWUYvaFAzckZFMm5oc0hCM1py?=
 =?utf-8?B?Z3BZdzcvVVVzRkNDMC9CVHBnSGFBTThvRk5Cb2s4U2szQ0t6YStEa0JsblV3?=
 =?utf-8?B?QkE1TlcrTGNSQ0Z3N2tMWWVPaldxUVc3NUJvQ3hVSjI4em5LWkRtdGYvUTVP?=
 =?utf-8?B?NDRyMmhMM283Ni9lMXYyY1Vlb0pQQVdlTjRrWnByNHg2TDR6bDN4N1pTaDJs?=
 =?utf-8?B?TnRlditEYWhvb25FeFJGaW5sSmVRRkRnVmh4OU5ubkhGMTR1OVFzODJCY2d6?=
 =?utf-8?B?cXlhZkwwT3JaS3NEcEs5NGdTdFFpc3k2RUVXYTJJVjlYemxPclpXMjBPYzhT?=
 =?utf-8?B?NTVRVlZndjV0RXJyR0xHTzhSQm1WclMzMlBMVEJPRWhwWDBxOGdLVStoSHlN?=
 =?utf-8?B?YWM3ZHRrREU4NVUxdjhnWFEzamZsdnFreFRwSVd6WnJTNkFwa2crdFpkTU5P?=
 =?utf-8?B?OVRqNm5QR3NPbGZhd3JpWVRzbTRhVE5JaTNQSG1LNkNrVlRhaDdaTXhsZE5N?=
 =?utf-8?B?aG43NWdyd0VFdTlvMTJpemQ5YzJGV1dVZVUvb25qS3c4eGZnRW9NNmQ4cGZV?=
 =?utf-8?B?eFNUMXAyQlFJTmp6VGFydFZwWlF6aUcvUTNPS3k1NEVDbVk0b1IvNkxvdHpp?=
 =?utf-8?B?ME1BWjFYSnNoWnVsc2FuaFdCZDVZWk0vdWU5S3k3cGRLdXM0bC93Q09jeGZP?=
 =?utf-8?B?Q3R0b2xWblZkRnVEdmROYzV0Wjl3NnVQMkx3dmk5bDNvYXUwUnR5K0lLMnhT?=
 =?utf-8?B?d1JaTHppUDJ0eG9HYVdZSGtPZ3FJQWpJd3lQWVgwNUM0L2VwWWVkYW1BZXlB?=
 =?utf-8?B?d2JRa3V0c3doRGw3dXB2UjdObzhnTXY1K2lnWWhjTTJZNDNEbXY5WWY5azF1?=
 =?utf-8?B?UU5OcjBRQUFBWWdxMnBDMG9mUk54bWxzTnFOQys0eXBuNm1PZGUzUWFxNTJx?=
 =?utf-8?B?Z2R1WXRBWktsWXZSWG1LUHFKcHNGQU50RGdoYWd3Y0Q4K3MyNUZaUmFUZzVq?=
 =?utf-8?B?Q3VSTitmUmFOamFaNThTdnFScS9mNTNEem5YYUNmRCtqck1pZ0FwZU1PL0FB?=
 =?utf-8?B?NHBYMUhnL3RKaGJoOTBnRmRETmRPSlVQVUFLL2Y0TjNiRzljWUg1K0M3ZE13?=
 =?utf-8?B?b3hFNFJmR0N6VmpYc3BGRGREa0E4TThxbXlLeDZHZ1BTVmZyWGEyV1FzUjRI?=
 =?utf-8?Q?OHXbk92ngrG2ftiz7sMOhMQxn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a717cc-3f75-4391-8ec4-08da9497870c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 08:19:35.4003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEpmYv0xy2UBSmXVS5LHpuqxmZtFPJ2aPY6ktphp9thrHB3/kkasAHReco2m85x1o8XNXzvTEC1RSbSvAOgMeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8964

On 12.09.2022 07:53, Juergen Gross wrote:
> Add a helper domid_to_domain() returning the struct domain pointer for
> a domain give by its domid and which is known not being able to be
> released (its reference count isn't incremented and no rcu_lock_domain()
> is called for it).
> 
> In order to simplify coding add an internal helper for doing the lookup
> and call that from the new function and similar functions.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

I don't see an issue with adding such a helper (responding to your concern
in the cover letter), but I think the constraints need to be empahsized
more: We already have get_knownalive_domain() and get_domain_by_id(), so
how about naming the new helper get_knownalive_domain_by_id()? And then ...

> @@ -859,20 +866,27 @@ struct domain *get_domain_by_id(domid_t dom)
>  
>  struct domain *rcu_lock_domain_by_id(domid_t dom)
>  {
> -    struct domain *d = NULL;
> +    struct domain *d;
>  
>      rcu_read_lock(&domlist_read_lock);
>  
> -    for ( d = rcu_dereference(domain_hash[DOMAIN_HASH(dom)]);
> -          d != NULL;
> -          d = rcu_dereference(d->next_in_hashbucket) )
> -    {
> -        if ( d->domain_id == dom )
> -        {
> -            rcu_lock_domain(d);
> -            break;
> -        }
> -    }
> +    d = domid_2_domain(dom);
> +    if ( d )
> +        rcu_lock_domain(d);
> +
> +    rcu_read_unlock(&domlist_read_lock);
> +
> +    return d;
> +}
> +
> +/* Use only if struct domain is known to stay allocated! */
> +struct domain *domid_to_domain(domid_t dom)
> +{
> +    struct domain *d;
> +
> +    rcu_read_lock(&domlist_read_lock);
> +
> +    d = domid_2_domain(dom);
>  
>      rcu_read_unlock(&domlist_read_lock);

... extend the comment here and in the header (or perhaps one in
the header would suffice and the definition here doesn't need any
further comment) to explicitly say "reference held or RCU-locked".

Jan

