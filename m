Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF762B9582
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 15:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30862.61041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kflJ4-0005Yr-Ud; Thu, 19 Nov 2020 14:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30862.61041; Thu, 19 Nov 2020 14:53:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kflJ4-0005YS-Rf; Thu, 19 Nov 2020 14:53:06 +0000
Received: by outflank-mailman (input) for mailman id 30862;
 Thu, 19 Nov 2020 14:53:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kVKL=EZ=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1kflJ3-0005YN-NE
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 14:53:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aca3f7e8-ecfe-4a7d-b782-f1e14293298d;
 Thu, 19 Nov 2020 14:53:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A44DAC2F;
 Thu, 19 Nov 2020 14:53:04 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id BD7681E130B; Thu, 19 Nov 2020 15:53:03 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kVKL=EZ=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1kflJ3-0005YN-NE
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 14:53:05 +0000
X-Inumbo-ID: aca3f7e8-ecfe-4a7d-b782-f1e14293298d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id aca3f7e8-ecfe-4a7d-b782-f1e14293298d;
	Thu, 19 Nov 2020 14:53:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0A44DAC2F;
	Thu, 19 Nov 2020 14:53:04 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id BD7681E130B; Thu, 19 Nov 2020 15:53:03 +0100 (CET)
Date: Thu, 19 Nov 2020 15:53:03 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 17/20] filemap: consistently use ->f_mapping over
 ->i_mapping
Message-ID: <20201119145303.GZ1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-18-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-18-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed 18-11-20 09:47:57, Christoph Hellwig wrote:
> Use file->f_mapping in all remaining places that have a struct file
> available to properly handle the case where inode->i_mapping !=
> file_inode(file)->i_mapping.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  mm/filemap.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index d5e7c2029d16b4..3e3531a757f8db 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -2887,13 +2887,13 @@ EXPORT_SYMBOL(filemap_map_pages);
>  vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf)
>  {
>  	struct page *page = vmf->page;
> -	struct inode *inode = file_inode(vmf->vma->vm_file);
> +	struct inode *inode = vmf->vma->vm_file->f_mapping->host;
>  	vm_fault_t ret = VM_FAULT_LOCKED;
>  
>  	sb_start_pagefault(inode->i_sb);
>  	file_update_time(vmf->vma->vm_file);
>  	lock_page(page);
> -	if (page->mapping != inode->i_mapping) {
> +	if (page->mapping != vmf->vma->vm_file->f_mapping) {
>  		unlock_page(page);
>  		ret = VM_FAULT_NOPAGE;
>  		goto out;
> @@ -3149,10 +3149,9 @@ void dio_warn_stale_pagecache(struct file *filp)
>  {
>  	static DEFINE_RATELIMIT_STATE(_rs, 86400 * HZ, DEFAULT_RATELIMIT_BURST);
>  	char pathname[128];
> -	struct inode *inode = file_inode(filp);
>  	char *path;
>  
> -	errseq_set(&inode->i_mapping->wb_err, -EIO);
> +	errseq_set(&filp->f_mapping->wb_err, -EIO);
>  	if (__ratelimit(&_rs)) {
>  		path = file_path(filp, pathname, sizeof(pathname));
>  		if (IS_ERR(path))
> @@ -3179,7 +3178,7 @@ generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
>  
>  	if (iocb->ki_flags & IOCB_NOWAIT) {
>  		/* If there are pages to writeback, return */
> -		if (filemap_range_has_page(inode->i_mapping, pos,
> +		if (filemap_range_has_page(file->f_mapping, pos,
>  					   pos + write_len - 1))
>  			return -EAGAIN;
>  	} else {
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

