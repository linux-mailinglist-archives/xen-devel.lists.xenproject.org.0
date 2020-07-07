Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDFE216925
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 11:35:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsk0X-0007Uk-Ej; Tue, 07 Jul 2020 09:35:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E+9W=AS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jsk0W-0007Uf-Er
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 09:35:20 +0000
X-Inumbo-ID: 2c261174-c035-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c261174-c035-11ea-8496-bc764e2007e4;
 Tue, 07 Jul 2020 09:35:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7046AAC52;
 Tue,  7 Jul 2020 09:35:19 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] xen/privcmd: Corrected error handling path
To: Souptick Joarder <jrdr.linux@gmail.com>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org
References: <1594059372-15563-1-git-send-email-jrdr.linux@gmail.com>
 <1594059372-15563-2-git-send-email-jrdr.linux@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4bafb184-6f07-2582-3d0f-86fb53dd30dc@suse.com>
Date: Tue, 7 Jul 2020 11:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594059372-15563-2-git-send-email-jrdr.linux@gmail.com>
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

On 06.07.20 20:16, Souptick Joarder wrote:
> Previously, if lock_pages() end up partially mapping pages, it used
> to return -ERRNO due to which unlock_pages() have to go through
> each pages[i] till *nr_pages* to validate them. This can be avoided
> by passing correct number of partially mapped pages & -ERRNO separately,
> while returning from lock_pages() due to error.
> 
> With this fix unlock_pages() doesn't need to validate pages[i] till
> *nr_pages* for error scenario and few condition checks can be ignored.
> 
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Paul Durrant <xadimgnik@gmail.com>
> ---
>   drivers/xen/privcmd.c | 31 +++++++++++++++----------------
>   1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index a250d11..33677ea 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -580,13 +580,13 @@ static long privcmd_ioctl_mmap_batch(
>   
>   static int lock_pages(
>   	struct privcmd_dm_op_buf kbufs[], unsigned int num,
> -	struct page *pages[], unsigned int nr_pages)
> +	struct page *pages[], unsigned int nr_pages, unsigned int *pinned)
>   {
>   	unsigned int i;
> +	int page_count = 0;

Initial value shouldn't be needed, and ...

>   
>   	for (i = 0; i < num; i++) {
>   		unsigned int requested;
> -		int pinned;

... you could move the declaration here.

With that done you can add my

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

