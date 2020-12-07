Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53342D1E92
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 00:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47066.83314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmQJ7-0007nc-1G; Mon, 07 Dec 2020 23:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47066.83314; Mon, 07 Dec 2020 23:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmQJ6-0007nD-UD; Mon, 07 Dec 2020 23:52:40 +0000
Received: by outflank-mailman (input) for mailman id 47066;
 Mon, 07 Dec 2020 23:52:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=woqd=FL=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kmQJ5-0007n8-Ux
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 23:52:39 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7efd1cf-a501-4749-9ac1-ba7efbd121e4;
 Mon, 07 Dec 2020 23:52:35 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B7NjW2P099624;
 Mon, 7 Dec 2020 23:52:30 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 357yqbraru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 07 Dec 2020 23:52:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B7Njg61075935;
 Mon, 7 Dec 2020 23:52:29 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 358m4wyyqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Dec 2020 23:52:29 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B7NqQoa021467;
 Mon, 7 Dec 2020 23:52:27 GMT
Received: from [10.39.215.209] (/10.39.215.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 07 Dec 2020 15:52:26 -0800
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
X-Inumbo-ID: b7efd1cf-a501-4749-9ac1-ba7efbd121e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=6l5IUmCUhNxwZdcNx+0VSeMQockYDo+hmSJ8uIBSmJ0=;
 b=yhFLv1BpXZhVaoMR/lIwbxxGFWMJFI5dpefwnS7GqxqxmoN8bhr1V0HiNtDg/8+smFuX
 6ZyDiUt/NbK8q7czLUtKhuh0gFcvv2R73UccN7ji/vJhHRnzu6rtwezzK0ySy4iV02XF
 0utF42ht8wAg9N5TtW1DBcfJwl6rO2Lzdg5be4NiNLOBX71Cg9HQveOm0VTEykzBzFMR
 YQc5JeyMbWREu8hm172a8YJ5p8DJ2aTC1HZDGATmsDuzWihlrZMzSJaoTOM9ibKtkn1o
 Y+HV892IyPlMVLckLb431jW3r5znvZJK7Tv4Y2HZVlq3la5gJ6tg16ymzCAHi6YT8UyW dg== 
Subject: Re: [PATCH 1/2] xen: add helpers for caching grant mapping pages
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>,
        Stefano Stabellini <sstabellini@kernel.org>
References: <20201207133024.16621-1-jgross@suse.com>
 <20201207133024.16621-2-jgross@suse.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <67875212-a5e1-5ea3-6ecd-2cf878f3cd5d@oracle.com>
Date: Mon, 7 Dec 2020 18:52:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201207133024.16621-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9828 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=2
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070157
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9828 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 mlxlogscore=999
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070157


On 12/7/20 8:30 AM, Juergen Gross wrote:
> Instead of having similar helpers in multiple backend drivers use
> common helpers for caching pages allocated via gnttab_alloc_pages().
>
> Make use of those helpers in blkback and scsiback.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovksy@oracle.com>


> +
> +void gnttab_page_cache_shrink(struct gnttab_page_cache *cache, unsigned int num)
> +{
> +	struct page *page[10];
> +	unsigned int i = 0;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&cache->lock, flags);
> +
> +	while (cache->num_pages > num) {
> +		page[i] = list_first_entry(&cache->pages, struct page, lru);
> +		list_del(&page[i]->lru);
> +		cache->num_pages--;
> +		if (++i == ARRAY_SIZE(page)) {
> +			spin_unlock_irqrestore(&cache->lock, flags);
> +			gnttab_free_pages(i, page);
> +			i = 0;
> +			spin_lock_irqsave(&cache->lock, flags);
> +		}
> +	}
> +
> +	spin_unlock_irqrestore(&cache->lock, flags);
> +
> +	if (i != 0)
> +		gnttab_free_pages(i, page);
> +}


How about splitting cache->pages list into two lists (one @num long and the other holding the rest) and then batching gntab_free_pages() from that first list? Then you won't have to deal with locking.


In fact, I am not even sure batching gains us much, I'd consider going one-by-one.


-boris



