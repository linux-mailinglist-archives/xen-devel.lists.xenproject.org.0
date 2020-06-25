Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F620999C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 07:49:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joKl1-0005vR-37; Thu, 25 Jun 2020 05:49:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ksZ=AG=nvidia.com=jhubbard@srs-us1.protection.inumbo.net>)
 id 1joKkz-0005vM-9f
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 05:49:05 +0000
X-Inumbo-ID: 939f6a2c-b6a7-11ea-b7bb-bc764e2007e4
Received: from hqnvemgate25.nvidia.com (unknown [216.228.121.64])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 939f6a2c-b6a7-11ea-b7bb-bc764e2007e4;
 Thu, 25 Jun 2020 05:49:04 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef43aa10000>; Wed, 24 Jun 2020 22:48:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 24 Jun 2020 22:49:03 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 24 Jun 2020 22:49:03 -0700
Received: from [10.2.59.206] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Jun
 2020 05:49:02 +0000
Subject: Re: [PATCH 2/2] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
To: Souptick Joarder <jrdr.linux@gmail.com>, <boris.ostrovsky@oracle.com>,
 <jgross@suse.com>, <sstabellini@kernel.org>
References: <1593054160-12628-1-git-send-email-jrdr.linux@gmail.com>
 <1593054160-12628-2-git-send-email-jrdr.linux@gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <59afe2fe-3718-85aa-f3b5-83ca0b9df577@nvidia.com>
Date: Wed, 24 Jun 2020 22:49:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593054160-12628-2-git-send-email-jrdr.linux@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593064097; bh=hWnF3N0wCKATLkkSfY0YFbwq7TYcYG70FRiPZLz+TCA=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Ou2+hLOaCBz5atm+9GHKtzk2bsBzKjQpsnvnwY2SlNbHVBzzL+/gQ3IF+qLThXkSb
 u4uehwdHRm+7H+ISGqx9LuSs62EgWyvSOnyTPq8gAuSVnA/OmC6ysPb59sBzr2usdn
 aEnDnmC1GhNwFrZOk7VLroiVZqtLYB/tiUXMSSh+8+G09UySSwK17c44IFFvw+C4jE
 YokJFSjzFST3CpV1TMAJWqlA8A1sPBaZzZBJ1cjuOYLmTIlxudkBQePekA1XbpiYMy
 yiKYBAWwKB7/h5LGmYbn844WExZQR3Zep0YtJkMbmQg5w/QxcCBpmdh/1Epgu/kxJ1
 H2nDpVqD51F+A==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Paul Durrant <xadimgnik@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-06-24 20:02, Souptick Joarder wrote:
> In 2019, we introduced pin_user_pages*() and now we are converting
> get_user_pages*() to the new API as appropriate. [1] & [2] could
> be referred for more information. This is case 5 as per document [1].
> 
> [1] Documentation/core-api/pin_user_pages.rst
> 
> [2] "Explicit pinning of user-space pages":
>          https://lwn.net/Articles/807108/
> 
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Paul Durrant <xadimgnik@gmail.com>
> ---
> Hi,
> 
> I'm compile tested this, but unable to run-time test, so any testing
> help is much appriciated.
> 
>   drivers/xen/privcmd.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index 0da417c..eb05254 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -595,7 +595,7 @@ static int lock_pages(
>   		if (requested > nr_pages)
>   			return -ENOSPC;
>   
> -		page_count = get_user_pages_fast(
> +		page_count = pin_user_pages_fast(
>   			(unsigned long) kbufs[i].uptr,
>   			requested, FOLL_WRITE, pages);
>   		if (page_count < 0) {
> @@ -612,13 +612,7 @@ static int lock_pages(
>   
>   static void unlock_pages(struct page *pages[], unsigned int nr_pages)
>   {
> -	unsigned int i;
> -
> -	for (i = 0; i < nr_pages; i++) {
> -		if (!PageDirty(page))
> -			set_page_dirty_lock(page);
> -		put_page(pages[i]);
> -	}
> +	unpin_user_pages_dirty_lock(pages, nr_pages, 1);

"true", not "1", is the correct way to call that function.

Also, this approach changes the behavior slightly, but I think it's
reasonable to just set_page_dirty_lock() on the whole range--hard to
see much benefit in checking PageDirty first.


>   }
>   
>   static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
> 

thanks,
-- 
John Hubbard
NVIDIA

