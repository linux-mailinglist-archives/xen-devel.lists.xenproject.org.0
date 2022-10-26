Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 444B760E25C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 15:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430595.682467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongfn-00018s-2Z; Wed, 26 Oct 2022 13:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430595.682467; Wed, 26 Oct 2022 13:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongfm-00016W-W1; Wed, 26 Oct 2022 13:42:22 +0000
Received: by outflank-mailman (input) for mailman id 430595;
 Wed, 26 Oct 2022 13:42:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ongfl-00012X-90
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 13:42:21 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2051.outbound.protection.outlook.com [40.107.247.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0324ae12-5534-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 15:42:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7487.eurprd04.prod.outlook.com (2603:10a6:800:1a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 13:42:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Wed, 26 Oct 2022
 13:42:17 +0000
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
X-Inumbo-ID: 0324ae12-5534-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZY442MERyaNQyg0iOYE17Ivc0PW6+9DARJSDuxM3BYze9yDjbrXhBTolJET1FmfFEBsVUbF7vl1GRLDTEprVSCCWj3sfBV46Sq9VK+5D97VVPQPDFF+//NEKyHQXvyv+0Dey7TIlWz4PLd7HyNNKsb2pzl/iYW7nEPbT9rMNJoV95gvSRU2P2VapqJ1N1HIKNr0t5xgaAPNFJiP5pvQ0hTFJBLl9KoyIoIgCFnHG2XPp2VYL6k4nqJIgVm5M1rlvNKOY6Jnc1AWiNNiU6gYaNL5QJfb4HiBniBbx6VoWxoII9u9MnoRm/W/ikjsPiqwqviKPqTGr5J6W1iXCSIQvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cx3W9P+imJMsWqJjb3/Fd9pb/bD2d42JW7SPBB3zBKw=;
 b=A0bHcRJx7nYYZVdgY85Vw8qazZx2EE9uxZDWjy/eEG/+6JvcTFhlGbfWhftCXeTUv9Me9g0ePDJRGt31wZcXT5sYu0HjoQBcc3rXPOvzvJOguIHdDEEAgNon1IqwD3b0ONCGGRFn5MlnyTP/a0OKa2ABcHzqZRYnazxF2GTlpvUqeE1kX4vo3daBTJ+DWfCqQOYDBUg3JPI0keOX2TdCGhH0dSXqjzRabvQgpmDV7Ec7Q3MXgmAK0Jh5362pJSZsK7ggnO6cAPWdTCHHKVPLQ/0BbfIu0BIv0wownYhCzkaeH5tR6eAnx+Qa9JwPxXnZ6pLe1219phSFn4JW27BCiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cx3W9P+imJMsWqJjb3/Fd9pb/bD2d42JW7SPBB3zBKw=;
 b=ibrYv+OJXZwWqMF/IyCTHNxZgqs3q1rguP2G+IeeOE3ri9zxst83HZy2wLe6J/ifeeAEWZoicFiFZy2UlqzTCZWK3ne2tT5bzpCnDEiBDvfm2Uu0NGIYIPO5xmRrk6Ue18vgbayqDvpAwEXmzMVE1MHx6yVjPOwbmJHyiGom4VnL0pX5dSp7YwHGBEaUNsqdx/tpo04+HK3PU4gGxTMp3EUFLnNRE/6hE2UgRW8q90QajtG9lv+viiYcr4UudRje0rWM+E4XH6WSat9JlQmHPE0OQOfYKHP5irvoZpUSggb11i54UJdeeUZ2O+/xCJimEGOdX4YI0TZTZ4tFOMDWqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ffb8bdb8-f54b-2107-ce1a-775337c172ac@suse.com>
Date: Wed, 26 Oct 2022 15:42:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the p2m pool
 size
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Henry Wang <Henry.Wang@arm.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221026102018.4144-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: 41050455-72eb-4c39-df2d-08dab757e5bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QLwOIb+t5AaNXTCKnj/BDnQbgok0I+EE7pOo8KDu1L8+z7xXQCvlc3eq836a0exE4/Ca46Q/frPULetw9FbWsCTSdPVqeBJzcA8uT4/4ho7w1y+TBa8OF9VNj9sodb8T+/l5Ki/5MpxFtwij2tjA81BFpeLD6XxaM52h9ScmQbwvLRKZF7+0ty9m2zO0gvbrwQnmiobtpv94oYKq8NmAT820coHWF3hr4EAC3Rx00rU2AUyPW7h3WDiH6JPYflcrY6IVY+1FmYZBQXzCLwRdOUrLwrCZD7N5jR0mXo+deBC6Uhb97It8JP0z1xzW7CN3lUxw83Kx/1GfvPTG1rimIo7ehcMWfIQ+tYjUr3ejBHUv7kC4+Blhj+RL8egMAA748ZEOkj9N0a26+ike03/ed43X0m/LJclypXjIcIpunqnB7AxLiBvyWU6oo8cCPilYxQgpVGPdbxLwkvnz/cXc5ocVUxkXc1SEyYwhE9gSkfSTXarCuSD0i/RhXZ9SIf79zjxOjY2kGGrmyIizY4mx8HkJnnAj3nFcGqAQcM8j1NWTFHjtiKj0HctQysjBoywkxCh5HolP9jRduVJXA4WDOPrzzLilk6QQcDmcU+4pKPQtXpASI304vFe1s/LjaJ+dCzmOT2Z0a3c6cZ/ua4SStYWfGjpWF6PGDKm4FBVqFG8u3f6XaU/MWe9q/x0MIOz4gIrW+HqZvn4iRlJvs5YJI4boRPP6Tb0h8Sno74uWYbsZWzwtORrn1OW59PVkOrbb/Aq54BDFRURlfJQgkiqLbw6HFLnKewSnNcWKHVwSqN3dr3sAkkfirl4cpOq9xcsF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199015)(2906002)(54906003)(6916009)(316002)(53546011)(86362001)(6506007)(6512007)(6486002)(5660300002)(478600001)(26005)(38100700002)(7416002)(31686004)(8936002)(41300700001)(4326008)(186003)(66946007)(36756003)(2616005)(8676002)(83380400001)(66556008)(31696002)(66476007)(45980500001)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm5hWXk1S2tXekIvRldId3dYbGpnaWtZTUpTWGhjZ2dsNWgyMUdDbXF1dERD?=
 =?utf-8?B?cWtSK3VMcjdhVmFVS2V4emZjdVJ4bDJKa1FTNUFSMXRqT1JHTlZlY1A1dmVS?=
 =?utf-8?B?Tm16Uzk2bjhCL0w5akFMaHJoZXlNclVmN2lOM2xpNjUrUmx0ZE5takZFL2Vu?=
 =?utf-8?B?bnk5dEFDNHFuZERFSis2WVA1TEFZZnN1K094WHRrZ0VxdG4vRFdzdURzbEk3?=
 =?utf-8?B?aWpIQ0N1YzVjd2wyRFBtdnJ2VjNtZDJCY0swTld2RTgxNmxzS3VJWW1STG44?=
 =?utf-8?B?QWRBUlNhOUxscFFmalE3SjdGcjdnT04vS085UEFSTjhxZ0lFOUZEallLOU1G?=
 =?utf-8?B?Uk1XWE9xM3hOd21XWWdFejEzYWwxOG9PWS9RVEhWV0dFbStMQk05NFFXSncw?=
 =?utf-8?B?MXFOME5nTWI1akNZS0c3VHJHQ1JNeklXR0taWVpTYVFlR2RHUFhkbTRHRzRi?=
 =?utf-8?B?TFgvRUIrcmVScVg4OGtsY1lzZGxWdHF2aTZ1N3laTkxqcXVvY2c0WGJ4T2tv?=
 =?utf-8?B?dS9BbkhIV1orZ2FubHRlK0I3SzhJbFgwOU9YM2xWeVZsT21LV051a2dqdkNy?=
 =?utf-8?B?K0I3T3RXQmZQRnBmU2VEZ0JMZjJaVy9xakxPVWtPUmw1c0tMenNjbXF1b0RZ?=
 =?utf-8?B?RjM1MkVuRWlGL3hjVmEwak80WlVLSktkYWt5cGh4NVRDUllWNFkzOGFLaVRI?=
 =?utf-8?B?OUJUSW0rcGw2Sk1YWXY3ckpMbUVNck5JR0xROWtYaURPeVR4K3RZcGtSem9B?=
 =?utf-8?B?bDQ2dTlBSG9SWGpoaEk4L1crSkJDRTZTZHFxWXhBNm83aWhmdUI2ZzBaUGxE?=
 =?utf-8?B?VlBtNTRuRXBja2VnQWp6RWVWa0IwbGg3Y3JWS21FMUI5endYNzk0ekpiZWxT?=
 =?utf-8?B?cEVBcTlyaXpLL0tneU5xbHo4cDdxU2IyNHc3RkZhWUhuUDhWSmZNWCtZazhB?=
 =?utf-8?B?ak5YZ21ZSHA4MVVGSDQwaXBwc0hxRTBQRVRyY2ExMWRlOGF0WUlHSjJrd0xV?=
 =?utf-8?B?NEFoZVBKV1ZnYWNWR0xBbldWTnFHRXFaanFPVXhKUkIvQ0dBMXNMa0h4NHNv?=
 =?utf-8?B?b0orZTBRU1hjQkUvdHpQcGdOSW41U041bEFranJxSlF6eFluWXJBcDZEUjVr?=
 =?utf-8?B?aFkyZlpkZ1RNL1pKbEJ3NVV2S3VVYnAzMW5od2JDa0UrVC9tSGhUbnBBTzZB?=
 =?utf-8?B?ZUFZRjM3YUkyNWdaQUJRYk1QL1ZHY1hsakFsLzltYlUwSE9aY29CZm4xbkts?=
 =?utf-8?B?b1dZYjRJZ1VHazNzMDF1TUswVkdvZ1lQWDVIVnpQbndFVmNHVnMwdkRnVjd1?=
 =?utf-8?B?bzB0ZmFvV2JpT20rV0tHTGZFOWU2eTlXSmVPbHpyTmdWaWhaZ01Tek9JRTgy?=
 =?utf-8?B?QjFOQWx4UFh1TlNTVi9CUC96SkRUM0RFRFhjK0IwcFhRTjJNQ29PQ2NvVXhL?=
 =?utf-8?B?SFA3UlJpOHF4ZDRuNnh2TUNKZlFSQjdML08xN0l3OEo1KzlNLzNsVDhIUG52?=
 =?utf-8?B?dnZXWnd1WFhQZTc1aUI2aXB6OWpPOE1uWWRnVE04ak5aRnVvUm1aMGVQSGx3?=
 =?utf-8?B?YU9CTXpSS0wxMGtwcXRRa3hrVXNyS0ladlE0alVtQVN4bkR5L0F2SUZYT1d6?=
 =?utf-8?B?UG42WWVsR2x3TE1HOWJWRjJHYkRFTzZUU3dxQktpU0xDRTMzd1FCdGpTK1o0?=
 =?utf-8?B?S0NVaG5HaHN6NE53dGg2ZGRUc1ZINVgyZ3M3SUdkZkRUem5xbXJhQkZPeVVv?=
 =?utf-8?B?MVdOUUZYYlhFdDlKLzRBeUJLV212cytOaGplWmswQ3lEMlp5bUhsR3Fzdjgy?=
 =?utf-8?B?UVRlY0FldzBkeFBYS0NwQ2JyRHM5US9IdkFUWjJmRkZablZmZThRS2IzSmwz?=
 =?utf-8?B?d0ZwQ1pXcXpVaW1wYTQycUtWSXNuNXpkQXZZWTR3NWk1MEQ5WElPRE1Dd1Bs?=
 =?utf-8?B?RGRCT0pVcXNEK3FoeGtJM0MzZkE3RSt3QnBCUFNVSmFVV1p3bVdqUXo4Y1JV?=
 =?utf-8?B?Yno1WlIzang3TE1LWnF2TXhZS2ZIS1h2UTRWbExKL1JnSlEzNUdFR2FnRy92?=
 =?utf-8?B?bTZjdmErNjBhRmluS1BNaFRKcTFXMFB3YVVoandHa3pIdytpOWpZT2lXY21n?=
 =?utf-8?Q?l3c4xa+no2+fP2pxX1hIYYKee?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41050455-72eb-4c39-df2d-08dab757e5bb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 13:42:17.1772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYji9VYN8b5kTbPTVYPRcRnoIYP6b55EyUOKqnQ8sevmXaxdDuKZiqyBXVh0ET2bk6VkAWChA1kvcy+DKn1Xbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7487

On 26.10.2022 12:20, Andrew Cooper wrote:
> The existing XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION have problems:
> 
>  * All set_allocation() flavours have an overflow-before-widen bug when
>    calculating "sc->mb << (20 - PAGE_SHIFT)".
>  * All flavours have a granularity of of 1M.  This was tolerable when the size
>    of the pool could only be set at the same granularity, but is broken now
>    that ARM has a 16-page stopgap allocation in use.
>  * All get_allocation() flavours round up, and in particular turn 0 into 1,
>    meaning the get op returns junk before a successful set op.
>  * The x86 flavours reject the hypercalls before the VM has vCPUs allocated,
>    despite the pool size being a domain property.

I guess this is merely a remnant and could easily be dropped there.

>  * Even the hypercall names are long-obsolete.
> 
> Implement an interface that doesn't suck, which can be first used to unit test
> the behaviour, and subsequently correct a broken implementation.  The old
> interface will be retired in due course.
> 
> This is part of XSA-409 / CVE-2022-33747.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Xen Security Team <security@xen.org>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Henry Wang <Henry.Wang@arm.com>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> 
> Name subject to improvement.

paging_{get,set}_mempool_size() for the arch helpers (in particular
fitting better with them living in paging.c as well its multi-purpose use
on x86) and XEN_DOMCTL_{get,set}_paging_mempool_size? Perhaps even the
"mem" could be dropped?

>  ABI not.

With the comment in the public header saying "Users of this interface are
required to identify the granularity by other means" I wonder why the
interface needs to be byte-granular. If the caller needs to know page size
by whatever means, it can as well pass in a page count.

> Future TODOs:
>  * x86 shadow still rounds up.  This is buggy as it's a simultaneous equation
>    with tot_pages which varies over time with ballooning.
>  * x86 PV is weird.  There are no toolstack interact with the shadow pool
>    size, but the "shadow" pool it does come into existence when logdirty (or
>    pv-l1tf) when first enabled.
>  * The shadow+hap logic is in desperate need of deduping.

I have a tiny step towards this queued as post-XSA-410 work, folding HAP's
and shadow's freelist, total_pages, free_pages, and p2m_pages. Here this
would mean {hap,shadow}_get_allocation_bytes() could be done away with,
having the logic exclusively in paging.c.

> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -100,6 +100,14 @@ unsigned int p2m_get_allocation(struct domain *d)
>      return ROUNDUP(nr_pages, 1 << (20 - PAGE_SHIFT)) >> (20 - PAGE_SHIFT);
>  }
>  
> +/* Return the size of the pool, in bytes. */
> +int arch_get_p2m_mempool_size(struct domain *d, uint64_t *size)
> +{
> +    *size = ACCESS_ONCE(d->arch.paging.p2m_total_pages) << PAGE_SHIFT;

This may overflow for Arm32.

> @@ -157,6 +165,25 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>      return 0;
>  }
>  
> +int arch_set_p2m_mempool_size(struct domain *d, uint64_t size)
> +{
> +    unsigned long pages = size >> PAGE_SHIFT;
> +    bool preempted = false;
> +    int rc;
> +
> +    if ( (size & ~PAGE_MASK) ||          /* Non page-sized request? */
> +         pages != (size >> PAGE_SHIFT) ) /* 32-bit overflow? */
> +        return -EINVAL;

Simply "(pages << PAGE_SHIFT) != size"? And then move the check into
common code?

> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -345,6 +345,16 @@ unsigned int hap_get_allocation(struct domain *d)
>              + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
>  }
>  
> +int hap_get_allocation_bytes(struct domain *d, uint64_t *size)
> +{
> +    unsigned long pages = (d->arch.paging.hap.total_pages +
> +                           d->arch.paging.hap.p2m_pages);

Unlike for Arm no ACCESS_ONCE() here? Also the addition can in
principle overflow, because being done only in 32 bits.

> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -977,6 +977,45 @@ int __init paging_set_allocation(struct domain *d, unsigned int pages,
>  }
>  #endif
>  
> +int arch_get_p2m_mempool_size(struct domain *d, uint64_t *size)
> +{
> +    int rc;
> +
> +    if ( is_pv_domain(d) )
> +        return -EOPNOTSUPP;
> +
> +    if ( hap_enabled(d) )
> +        rc = hap_get_allocation_bytes(d, size);
> +    else
> +        rc = shadow_get_allocation_bytes(d, size);
> +
> +    return rc;
> +}
> +
> +int arch_set_p2m_mempool_size(struct domain *d, uint64_t size)
> +{
> +    unsigned long pages = size >> PAGE_SHIFT;
> +    bool preempted = false;
> +    int rc;
> +
> +    if ( is_pv_domain(d) )
> +        return -EOPNOTSUPP;

Why? You do say "PV is weird" in a post-commit-message remark, but why
do you want to retain this weirdness? Even if today the tool stack
doesn't set the size when enabling log-dirty mode, I'd view this as a
bug which could be addressed purely in the tool stack if this check
wasn't there.

> +    if ( size & ~PAGE_MASK )             /* Non page-sized request? */
> +        return -EINVAL;
> +
> +    ASSERT(paging_mode_enabled(d));

Not only with the PV aspect in mind - why? It looks reasonable to me
to set the pool size before enabling any paging mode.

> +    paging_lock(d);
> +    if ( hap_enabled(d) )
> +        rc = hap_set_allocation(d, pages, &preempted);
> +    else
> +        rc = shadow_set_allocation(d, pages, &preempted);

Potential truncation from the "unsigned long" -> "unsigned int"
conversions.

Jan

