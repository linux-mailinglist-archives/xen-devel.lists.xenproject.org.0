Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DE020ABF8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 07:52:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1johHi-0004dX-LL; Fri, 26 Jun 2020 05:52:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gdC=AH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1johHh-0004dR-8n
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 05:52:21 +0000
X-Inumbo-ID: 32af7cb4-b771-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32af7cb4-b771-11ea-b7bb-bc764e2007e4;
 Fri, 26 Jun 2020 05:52:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28A75AAC3;
 Fri, 26 Jun 2020 05:52:19 +0000 (UTC)
Subject: Re: [PATCH 1/2] xen/privcmd: Corrected error handling path and mark
 pages dirty
To: Souptick Joarder <jrdr.linux@gmail.com>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org
References: <1593054160-12628-1-git-send-email-jrdr.linux@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9ff52733-6ce0-6bda-8e49-a6908b4ff7dc@suse.com>
Date: Fri, 26 Jun 2020 07:52:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1593054160-12628-1-git-send-email-jrdr.linux@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Paul Durrant <xadimgnik@gmail.com>, John Hubbard <jhubbard@nvidia.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.06.20 05:02, Souptick Joarder wrote:
> Previously, if lock_pages() end up partially mapping pages, it used
> to return -ERRNO due to which unlock_pages() have to go through
> each pages[i] till *nr_pages* to validate them. This can be avoided
> by passing correct number of partially mapped pages & -ERRNO separately,
> while returning from lock_pages() due to error.
> 
> With this fix unlock_pages() doesn't need to validate pages[i] till
> *nr_pages* for error scenario and few condition checks can be ignored.
> 
> As discussed, pages need to be marked as dirty before unpinned it in
> unlock_pages() which was oversight.
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
>   drivers/xen/privcmd.c | 34 +++++++++++++++++++---------------
>   1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index a250d11..0da417c 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -580,43 +580,44 @@ static long privcmd_ioctl_mmap_batch(
>   
>   static int lock_pages(
>   	struct privcmd_dm_op_buf kbufs[], unsigned int num,
> -	struct page *pages[], unsigned int nr_pages)
> +	struct page *pages[], unsigned int nr_pages, int *pinned)

unsigned int *pinned, please.

>   {
>   	unsigned int i;
> +	int errno = 0, page_count = 0;

Please drop the errno variable. It is misnamed (you never assign an
errno value to it) and not needed, as you can ...

>   
>   	for (i = 0; i < num; i++) {
>   		unsigned int requested;
> -		int pinned;
>   
> +		*pinned += page_count;
>   		requested = DIV_ROUND_UP(
>   			offset_in_page(kbufs[i].uptr) + kbufs[i].size,
>   			PAGE_SIZE);
>   		if (requested > nr_pages)
>   			return -ENOSPC;
>   
> -		pinned = get_user_pages_fast(
> +		page_count = get_user_pages_fast(
>   			(unsigned long) kbufs[i].uptr,
>   			requested, FOLL_WRITE, pages);
> -		if (pinned < 0)
> -			return pinned;
> +		if (page_count < 0) {
> +			errno = page_count;
> +			return errno;

... just return page_count her, and ...

> +		}
>   
> -		nr_pages -= pinned;
> -		pages += pinned;
> +		nr_pages -= page_count;
> +		pages += page_count;
>   	}
>   
> -	return 0;
> +	return errno;

... leave this as it was.

>   }
>   
>   static void unlock_pages(struct page *pages[], unsigned int nr_pages)
>   {
>   	unsigned int i;
>   
> -	if (!pages)
> -		return;
> -
>   	for (i = 0; i < nr_pages; i++) {
> -		if (pages[i])
> -			put_page(pages[i]);
> +		if (!PageDirty(page))
> +			set_page_dirty_lock(page);

page? Not pages[i]?

> +		put_page(pages[i]);
>   	}
>   }
>   
> @@ -630,6 +631,7 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
>   	struct xen_dm_op_buf *xbufs = NULL;
>   	unsigned int i;
>   	long rc;
> +	int pinned = 0;
>   
>   	if (copy_from_user(&kdata, udata, sizeof(kdata)))
>   		return -EFAULT;
> @@ -683,9 +685,11 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
>   		goto out;
>   	}
>   
> -	rc = lock_pages(kbufs, kdata.num, pages, nr_pages);
> -	if (rc)
> +	rc = lock_pages(kbufs, kdata.num, pages, nr_pages, &pinned);
> +	if (rc < 0) {
> +		nr_pages = pinned;
>   		goto out;
> +	}
>   
>   	for (i = 0; i < kdata.num; i++) {
>   		set_xen_guest_handle(xbufs[i].h, kbufs[i].uptr);
> 


Juergen

