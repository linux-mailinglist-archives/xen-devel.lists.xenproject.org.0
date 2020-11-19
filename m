Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0286B2B95DF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 16:14:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30933.61155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfldP-0000Lp-2H; Thu, 19 Nov 2020 15:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30933.61155; Thu, 19 Nov 2020 15:14:07 +0000
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
	id 1kfldO-0000LP-Ui; Thu, 19 Nov 2020 15:14:06 +0000
Received: by outflank-mailman (input) for mailman id 30933;
 Thu, 19 Nov 2020 15:14:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nub5=EZ=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1kfldM-0000Ke-Ha
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:14:04 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e85d2283-dab7-4cca-8ae2-64c3052f470e;
 Thu, 19 Nov 2020 15:14:01 +0000 (UTC)
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kflcb-0002ed-15; Thu, 19 Nov 2020 15:13:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Nub5=EZ=infradead.org=willy@srs-us1.protection.inumbo.net>)
	id 1kfldM-0000Ke-Ha
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:14:04 +0000
X-Inumbo-ID: e85d2283-dab7-4cca-8ae2-64c3052f470e
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e85d2283-dab7-4cca-8ae2-64c3052f470e;
	Thu, 19 Nov 2020 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aI9mH0dq7mTuWpujo4T+CjmE2gbvb95KnVfM843FQ84=; b=NQxl2LUeXdxB2yfG38WXbOdZDF
	4m3yXl2LUAYY4UoHaaLjO55fQMRmjPGQ3+B+xj1A4lwNOqB+KRFQoIk1nbaMMuKB/WnQRRcUmsRbV
	R2K9qIjBs0hPN6TTWcG6BAmilJQG1snUXu5nywrLj8Cz/xFJxvZUmVOZATxF0u8B82LwZZSJWb1hl
	RGyLJC+B2H7/mLhmvZRyTkib7wsKGqq179e8VAUmByqV2VbOMsqMaYFdiiZ3EUGK3Uw1hPAA3usoO
	WlHH4d0KOLmy0/ejtH1mtQgmdWJPaNlHqDfX4UPUMcxUgftU+j2y1V0nrwb5yjBJnF9f3J8T+0xqW
	MLlqYaTw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kflcb-0002ed-15; Thu, 19 Nov 2020 15:13:17 +0000
Date: Thu, 19 Nov 2020 15:13:16 +0000
From: Matthew Wilcox <willy@infradead.org>
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
Message-ID: <20201119151316.GH29991@casper.infradead.org>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-18-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-18-hch@lst.de>

On Wed, Nov 18, 2020 at 09:47:57AM +0100, Christoph Hellwig wrote:
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

Bit messy.  I'd do:

	struct address_space *mapping = vmf->vma->vm_file->f_mapping;

	sb_start_pagefault(mapping->host->i_sb);

	if (page->mapping != mapping)

	sb_end_pagefault(mapping->host->i_sb);


