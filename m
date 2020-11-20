Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C562BA5CA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 10:17:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31819.62531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg2Xf-0001cp-Dq; Fri, 20 Nov 2020 09:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31819.62531; Fri, 20 Nov 2020 09:17:19 +0000
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
	id 1kg2Xf-0001cQ-AL; Fri, 20 Nov 2020 09:17:19 +0000
Received: by outflank-mailman (input) for mailman id 31819;
 Fri, 20 Nov 2020 09:17:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kg2Xd-0001br-KS
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:17:17 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91fef6ce-4e0f-4402-b7ee-1b445e355975;
 Fri, 20 Nov 2020 09:17:16 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E4E0067373; Fri, 20 Nov 2020 10:17:14 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kg2Xd-0001br-KS
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:17:17 +0000
X-Inumbo-ID: 91fef6ce-4e0f-4402-b7ee-1b445e355975
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 91fef6ce-4e0f-4402-b7ee-1b445e355975;
	Fri, 20 Nov 2020 09:17:16 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E4E0067373; Fri, 20 Nov 2020 10:17:14 +0100 (CET)
Date: Fri, 20 Nov 2020 10:17:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 17/20] filemap: consistently use ->f_mapping over
 ->i_mapping
Message-ID: <20201120091714.GF21715@lst.de>
References: <20201118084800.2339180-1-hch@lst.de> <20201118084800.2339180-18-hch@lst.de> <20201119151316.GH29991@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119151316.GH29991@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Nov 19, 2020 at 03:13:16PM +0000, Matthew Wilcox wrote:
> On Wed, Nov 18, 2020 at 09:47:57AM +0100, Christoph Hellwig wrote:
> > @@ -2887,13 +2887,13 @@ EXPORT_SYMBOL(filemap_map_pages);
> >  vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf)
> >  {
> >  	struct page *page = vmf->page;
> > -	struct inode *inode = file_inode(vmf->vma->vm_file);
> > +	struct inode *inode = vmf->vma->vm_file->f_mapping->host;
> >  	vm_fault_t ret = VM_FAULT_LOCKED;
> >  
> >  	sb_start_pagefault(inode->i_sb);
> >  	file_update_time(vmf->vma->vm_file);
> >  	lock_page(page);
> > -	if (page->mapping != inode->i_mapping) {
> > +	if (page->mapping != vmf->vma->vm_file->f_mapping) {
> 
> Bit messy.  I'd do:
> 
> 	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
> 
> 	sb_start_pagefault(mapping->host->i_sb);
> 
> 	if (page->mapping != mapping)
> 
> 	sb_end_pagefault(mapping->host->i_sb);

Fine with me.

