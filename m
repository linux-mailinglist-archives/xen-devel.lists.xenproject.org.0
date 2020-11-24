Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60CD2C28C4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:53:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36391.68299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYlB-0000ti-E5; Tue, 24 Nov 2020 13:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36391.68299; Tue, 24 Nov 2020 13:53:33 +0000
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
	id 1khYlB-0000tB-AP; Tue, 24 Nov 2020 13:53:33 +0000
Received: by outflank-mailman (input) for mailman id 36391;
 Tue, 24 Nov 2020 13:53:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ki3g=E6=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1khYl9-0000sM-5n
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:53:31 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16d3b942-b704-4c20-b5ed-c04bf73eb38e;
 Tue, 24 Nov 2020 13:53:28 +0000 (UTC)
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1khYkr-00014M-IZ; Tue, 24 Nov 2020 13:53:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ki3g=E6=infradead.org=willy@srs-us1.protection.inumbo.net>)
	id 1khYl9-0000sM-5n
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:53:31 +0000
X-Inumbo-ID: 16d3b942-b704-4c20-b5ed-c04bf73eb38e
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 16d3b942-b704-4c20-b5ed-c04bf73eb38e;
	Tue, 24 Nov 2020 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZXWWj8sGpheRB/oPAny/oeYYPMI5xkrPoBeF/PO6t/I=; b=uFy7Ttpe28lYbENky3PW90QaTq
	xG4wEg+wloh0hNvJWawTJQg7XQAS91A4oAPYqDqFFgSWTUjyMdGkcvWeSWNAAcnJJnpdJMC7Jm0Jq
	M95Jiv0GtCKP7Jwi7y4hV5eX/5ntAWKqVIIOuyD36/oMrxKN+22zQUxm/erDkZPH5EFs5kxiNk/qX
	fbYUgHkg+8QptScbUSZ6yFCMWEuoNILFEypZ+PtlRUpUS1f/iW3EWfM0Vm7XWaklqtf+Jppv9QouI
	MA/OL8tDwMa4wuUd7DIRsV4kdVDn9/qL5FTWuQlH76deZdi3dut2mc+76r0aL8ewuSlgqLBT+dwl6
	clkzRyQg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYkr-00014M-IZ; Tue, 24 Nov 2020 13:53:13 +0000
Date: Tue, 24 Nov 2020 13:53:13 +0000
From: Matthew Wilcox <willy@infradead.org>
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
Message-ID: <20201124135313.GA4327@casper.infradead.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-3-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:08PM +0100, Christoph Hellwig wrote:
> Use file->f_mapping in all remaining places that have a struct file
> available to properly handle the case where inode->i_mapping !=
> file_inode(file)->i_mapping.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

