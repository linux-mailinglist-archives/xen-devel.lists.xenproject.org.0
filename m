Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF183A100D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 12:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139166.257408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqvJx-0003ZH-GL; Wed, 09 Jun 2021 10:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139166.257408; Wed, 09 Jun 2021 10:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqvJx-0003WG-CO; Wed, 09 Jun 2021 10:20:25 +0000
Received: by outflank-mailman (input) for mailman id 139166;
 Wed, 09 Jun 2021 10:20:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqvJv-0003W8-Uk
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 10:20:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9668a438-1e40-4d2d-bb48-ec8c8df461d8;
 Wed, 09 Jun 2021 10:20:18 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-FOlbmTpoNKCtwJ5evrWRaA-1;
 Wed, 09 Jun 2021 12:20:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Wed, 9 Jun
 2021 10:20:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 10:20:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1PR01CA0018.eurprd01.prod.exchangelabs.com (2603:10a6:102::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Wed, 9 Jun 2021 10:20:14 +0000
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
X-Inumbo-ID: 9668a438-1e40-4d2d-bb48-ec8c8df461d8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623234017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qTDl0/KVhcTvFDB9ZTaEJZ7ejh9uPJ6WnYYJjdsfbV8=;
	b=ByaZF5D62HGMVr6OuwgKgmFR/R/1CIxalg9LSI+xzqJpE5oaoypPARH2lG2rPU+1egY6jJ
	0Er9sIsjHUBHhjB6CNenDKwQuUsoEGPYS23bgemAsixhAXjz/m+Cowwu5/hDOmXEVTLQ2a
	+l1ljdb9wzlwehjTuDiHVQwPlvQH0V0=
X-MC-Unique: FOlbmTpoNKCtwJ5evrWRaA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+BVWQg5YP4FfYdAuHIUDZh5xllIbDw+fEiothxeplKy+0LsCUcB6KbQFTQQFjiBT6yV6QQin6dMbyhRdwT7lDD3um29bXGFKr85eALl2DflR6d2raXYiwRlvzGnb4AYGffsXbwajFzYKLpx6nbr3lzDZeILJ9mVoU3eLt/3M5ZGKmUgTgUkwNoeBv5IoDEjYbQ2P4SUSgqBYbMGthGbyWLKkHe2h7Ax9rDu7AwdtHLc/o6VTtsgI+1umi1Iq0UGggs1hPlaqYJ1I32dV/xNjZLEUFJ5U7DVYhSSH6MCw4QHbUyQLFmEGi0ICl4NIZJArd6SjM4nqA+ZYb+0E9dOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTDl0/KVhcTvFDB9ZTaEJZ7ejh9uPJ6WnYYJjdsfbV8=;
 b=R9Qn6fBhZ7IwC/cUziUfRuKYJHit9k+RPkD33r/PENPG0FC9pA5gmg5O8/H8cCd8YQ+7moSX6CeyuplBkD+KOHyrxssZJ3fuxJOCVRmXL8Re4WzodiattBOv/ajE0SaQ/XTd26+uQv+98zoPac+iyJQSxNJ6/tPKCrKdAax/GdSFyZBZjynTy+XxBmALTpSUGxJXNtKJBVqJtTEq0/LezxOMixVSXRaj8yvrKc1TzXWFFIQIzTo5HgHp0hV9y+uuJxYsIhFwmhFnVd1uxGrerfURh+IrDXxfm0TuoRCZt7F10olYPH7BiV66ASICPHe2h20dkh90vVvNTt0UxB2RZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] xen/grant-table: Simplify the update to the per-vCPU
 maptrack freelist
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210608100824.25141-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3df3cc7b-a084-cc9c-5446-b662c884addd@suse.com>
Date: Wed, 9 Jun 2021 12:20:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210608100824.25141-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1PR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86132b79-acf9-4fe9-40ad-08d92b302bfe
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6861698E6EBC9F1DFB9599B0B3369@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XSUPexdLpql+CgB/wfZczKJIvNba/frEDNu1JXC5hLpGbYvkrYK37H1Eg6m+Qiah5OZ10LfkcsTiUv5UeUG1w5XJTnTfB1W55RZukyoSTELIA5z8yoT5fRyhY2iY6Ff2ARE9yJR0t9a14um2LI1UhE3EqAVtJy8V0+d1s1Hj+yExIJTe+lscaMoJUH8uwmj3n8df9W+utjtIKpd5NudbFLHPHNb4KHaKxBgZ3gzP244wMSyJVCizos9gCFYfNj5v+aJZ293ptrXhR6UJw1L+OZ3CTFMAP7fylfQDf/xki2mMajsRhnyZOtn7UoBaM28/uylX0IOOD5JvH2EqFz6wlqh8VTLnylpPShgjj+LnnZ9FhAAsT+fZr4Q4mqyOfpeGkFd6tZjauR0/oqJGWf7z0chkv1Z0DTVw6trp/j9iOpJQGvvQDg2wIT35TeR7x+9Iilf03BoLEb3XWOvn4WzaX95Tc16nsjIWcfCsqU5ajcXn4lFGuv4AnzRvp31pX7p4jQ07oSdqViyhVBJ3wglkoVnsa1N+ZbXFx47l12PNTLzhrUEnHdclm6D6UHNHw3KkT7mOTyUw+zSUerDZRlqvFv8GgzXOgSHe39RRpVtMLqz267juOfvifOqr4dWmzMwQm5+s7p1mBpNJyCGS+s2dciGrC4xgnxn8Eu47KSaYF9M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(376002)(396003)(136003)(346002)(6486002)(86362001)(4326008)(36756003)(38100700002)(316002)(8936002)(2906002)(478600001)(66946007)(66556008)(83380400001)(15650500001)(66476007)(54906003)(2616005)(8676002)(16526019)(956004)(6916009)(186003)(26005)(5660300002)(53546011)(31686004)(16576012)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?d2dIU3JTUmRwTWhXdGRuNW5NamM4YWZ1RTE2TXZuNVdBMEJkYUpnL09aaUFL?=
 =?utf-8?B?SWxzRkJ5bkMzTGtpeXk5dXhCb2pyZ0grL0dwVmtYQThvczVTdElSaFdnYkdP?=
 =?utf-8?B?VEE1NFNoQTF3UjlHVzBCOGlHZ2kxaDdiWFZITmtCbHpmL2RUUTh6RG1CV2E5?=
 =?utf-8?B?cXRNWWJQaGpPbERQODhwZmIzb1R1eXE2dGVyLzg5bzRTcytMTjNWUkI3cHNa?=
 =?utf-8?B?M25ENXIxZDVLQldmK3VGZzl1Q2xJYkVnckd5em95bVNWMzFzL2Q0YUlMSXdz?=
 =?utf-8?B?RFZ1MEs2NE9pcHN4SGhhMGlPc3VkdTh1bGNVek4zdzJGWUdTRlhqbC9MYmhW?=
 =?utf-8?B?bDcvbFVQRkVrU0U0R0l1WG5RUjFBK0hPUHlLS1RVRDk2UWJ5ZHRxWnBRaDBN?=
 =?utf-8?B?ZlQyb1pYUjlvaDdvMzhIMnpvREtOeVV6WFhjcGVGWnNnK2NNVUQwQTh0aGVB?=
 =?utf-8?B?UUtGMzEwMElXRDlCd21WNlVDVkRta0o5RGFNRkhPVkNhN2l1ZXR6bDRnQ1cr?=
 =?utf-8?B?Um16NU04akVXMFIxN2o1TkV0d0l5Q3JBVjdPU3JxRnRXbVNWeHlBamVBTFpU?=
 =?utf-8?B?UHVGbHhvU3JrQnRDYlA5UFovV2s4QTA1dDM2dG9abWRjWlF4V3VyVW1Zd091?=
 =?utf-8?B?c1NpenJ4aVEyMlFPQ1AyT3BobjJyTUVFZktYSEUxV0xwMDlNaWk5NldkK25Z?=
 =?utf-8?B?SjhzS2Y4bU85RXg1QjBtME4vOEExQkI2U0x0YzBQSEFaV21BcG9JUHJ5Skd6?=
 =?utf-8?B?dGgwUENsV0VSZkR0QnhXbE84cjVrTTk4eFh2MUsxUW40V01ZYUdvbTVLNVlW?=
 =?utf-8?B?TkdycnBQcjZZenR4S1JtZ0tMczJNTERmMVhUUTlIcEM4b2ZDcjhxTEo3TlJo?=
 =?utf-8?B?cDdFR0c0KzFBaGt3K1ZZVjJZRU5HNGpXOVRVb1lqWVJQKzBVOUV0WDBBRTAw?=
 =?utf-8?B?ZWtUWGJuUXdobU9KYUthM0dWbGI0MTh6ZTR5dEpSa0JiVUhaR1kySEpYYUNF?=
 =?utf-8?B?NFFNS2R2dTgxWXJOZTJmVG5QODllNEhESmxnVEhUS1JtVVUydHhDRmtYMnpy?=
 =?utf-8?B?cm01NWpQYWhCUVlXYjd6VkdSYm5VWk02c1QrNTF0NTdrRXY5R2ZZMXN0eGF5?=
 =?utf-8?B?OURGU2d0TmpGSjVBcThjSjI0Lzl5M2hhQVVrcnpZK3VHMktoZnIzSFlVOXk4?=
 =?utf-8?B?bUtzU0hWcXIyNHMwRndQYW53WEh0UEhEUnh0SUpYYXVuNzU1QUJCVUVpaWFa?=
 =?utf-8?B?aE82bWZjNEE5YWkvVGwrdFFmRlMvQTM3bUtJTDgyVmhiOGdmZjZZcmNGNFFl?=
 =?utf-8?B?YXBrOVNia01Fd3l4dm5WR1IyaU9PYkF4NXR4UmRZa0hYUFlzZUQvZ29Nem1W?=
 =?utf-8?B?NzVNY0VqKzRuODZVN21EMWNhUEQ1R3grTC94UWk3RGF3Q00xL0JSSnVQcTVQ?=
 =?utf-8?B?OVhaV09lVWlvZHM1WmU4T3dCTUZDTFhUN21HekpxZ2U5QTdTbngzNktTOFFP?=
 =?utf-8?B?TlVaSmZPbGxiMUVaWGVpTFJkYi8vajdPR2ZFZjJSRldsMWdDU211cEU0TzRz?=
 =?utf-8?B?aUFRV2JSNloyVHB3cDdkRUlxbDJYVFgzb05UdElPdkNsNHNHbzB0YWFmVlB4?=
 =?utf-8?B?aXpiaTY0KzBFckdaQUpzYkRSNk9OazBNeVNpdUdzNnR5RndQRi9SZFZzOStR?=
 =?utf-8?B?K1dndHphRFlHalFEYmNQU0JsZGRQNUdpTHFVTU45cmlUSUFUVFJRWkMrQS9u?=
 =?utf-8?Q?p1Yz62A+hV0b6hEpquge9c8ONfs0OUhTcYyQlqB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86132b79-acf9-4fe9-40ad-08d92b302bfe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 10:20:14.7542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Hs5SdSPWcG6u2eNCOHB7s8pqcgH7FI2Q6rZknHxFr8jLpTCW4OE1ldm50fcvxn1JchyiWeAs5xSckinPo3hIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On 08.06.2021 12:08, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Since XSA-228 (commit 02cbeeb62075 "gnttab: split maptrack lock
> to make it fulfill its purpose again"), v->maptrack_head,
> v->maptrack_tail and the content of the freelist are accessed with
> the lock v->maptrack_freelist_lock held.
> 
> Therefore it is not necessary to update the fields using cmpxchg()
> and also read them atomically.
> 
> Note that there are two cases where v->maptrack_tail is accessed without
> the lock. They both happen in get_maptrack_handle() when initializing
> the free list of the current vCPU. Therefore there is no possible race.
> 
> The code is now reworked to remove any use of cmpxch() and read_atomic()
> when accessing the fields v->maptrack_{head, tail} as wel as the
> freelist.
> 
> Take the opportunity to add a comment on top of the lock definition
> and explain what it protects.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit:

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -255,7 +255,13 @@ struct vcpu
>      /* VCPU paused by system controller. */
>      int              controller_pause_count;
>  
> -    /* Grant table map tracking. */
> +    /*
> +     * Grant table map tracking. The lock maptrack_freelist_lock
> +     * protects to:

I don't think you want "to" here.

Jan

> +     *  - The entries in the freelist
> +     *  - maptrack_head
> +     *  - maptrack_tail
> +     */
>      spinlock_t       maptrack_freelist_lock;
>      unsigned int     maptrack_head;
>      unsigned int     maptrack_tail;
> 


