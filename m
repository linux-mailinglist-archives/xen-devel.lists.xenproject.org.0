Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7062C3FB4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 13:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37698.70159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khtj6-0007xL-D9; Wed, 25 Nov 2020 12:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37698.70159; Wed, 25 Nov 2020 12:16:48 +0000
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
	id 1khtj6-0007wu-9m; Wed, 25 Nov 2020 12:16:48 +0000
Received: by outflank-mailman (input) for mailman id 37698;
 Wed, 25 Nov 2020 12:16:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sFqU=E7=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1khtj4-0007wn-Kk
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:16:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c848016-7905-41ec-8c95-2d46b5050c67;
 Wed, 25 Nov 2020 12:16:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E6B3AF0B;
 Wed, 25 Nov 2020 12:16:44 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 2138A1E130F; Wed, 25 Nov 2020 13:16:44 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFqU=E7=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1khtj4-0007wn-Kk
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:16:46 +0000
X-Inumbo-ID: 2c848016-7905-41ec-8c95-2d46b5050c67
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2c848016-7905-41ec-8c95-2d46b5050c67;
	Wed, 25 Nov 2020 12:16:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8E6B3AF0B;
	Wed, 25 Nov 2020 12:16:44 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 2138A1E130F; Wed, 25 Nov 2020 13:16:44 +0100 (CET)
Date: Wed, 25 Nov 2020 13:16:44 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 02/45] filemap: consistently use ->f_mapping over
 ->i_mapping
Message-ID: <20201125121644.GF16944@quack2.suse.cz>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-3-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue 24-11-20 14:27:08, Christoph Hellwig wrote:
> Use file->f_mapping in all remaining places that have a struct file
> available to properly handle the case where inode->i_mapping !=
> file_inode(file)->i_mapping.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  mm/filemap.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index d5e7c2029d16b4..4f583489aa3c2a 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -2886,14 +2886,14 @@ EXPORT_SYMBOL(filemap_map_pages);
>  
>  vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf)
>  {
> +	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
>  	struct page *page = vmf->page;
> -	struct inode *inode = file_inode(vmf->vma->vm_file);
>  	vm_fault_t ret = VM_FAULT_LOCKED;
>  
> -	sb_start_pagefault(inode->i_sb);
> +	sb_start_pagefault(mapping->host->i_sb);
>  	file_update_time(vmf->vma->vm_file);
>  	lock_page(page);
> -	if (page->mapping != inode->i_mapping) {
> +	if (page->mapping != mapping) {
>  		unlock_page(page);
>  		ret = VM_FAULT_NOPAGE;
>  		goto out;
> @@ -2906,7 +2906,7 @@ vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf)
>  	set_page_dirty(page);
>  	wait_for_stable_page(page);
>  out:
> -	sb_end_pagefault(inode->i_sb);
> +	sb_end_pagefault(mapping->host->i_sb);
>  	return ret;
>  }
>  
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

