Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B77A4034CC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 09:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181508.328657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrh7-0007pD-Pq; Wed, 08 Sep 2021 07:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181508.328657; Wed, 08 Sep 2021 07:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrh7-0007me-Mn; Wed, 08 Sep 2021 07:08:29 +0000
Received: by outflank-mailman (input) for mailman id 181508;
 Wed, 08 Sep 2021 07:08:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHX5=N6=casper.srs.infradead.org=BATV+2e9f3f7219a4df6f1e93+6590+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mNrh5-0007mY-V4
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 07:08:27 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68e862cc-57a1-443a-963a-8cfc54df5453;
 Wed, 08 Sep 2021 07:08:26 +0000 (UTC)
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mNrfF-008aXl-2g; Wed, 08 Sep 2021 07:06:59 +0000
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
X-Inumbo-ID: 68e862cc-57a1-443a-963a-8cfc54df5453
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xTrVWx4u6aj0HJxIiwK6w63wBv8UFL6W0kryTgqQOBk=; b=UZnSHfGOxpfl5k2QHa5deLLAej
	zonJbx4n51ec8iDwWq3JYz2OPPMiVjGyAUWGv4ls4dA1usel5U3fT/1gvezBu704ucCFd3+IoU+Xx
	/3suk5AMMFVT85WrMAbyKyeKyDc8jQpU1ubdS0X6vYrUL91adfQ/uEwVJtCOmDDvt/xQGeNw5r7aT
	yWtkmphfLXByz/kFQQDjCEIQq8TuIrs78mKspznFajfvCQvCX6gPMzESAMk0sibuyeVlB3FQIOYdo
	CHiaZ+u6qSC1/p9oaZJ8UOV2EehqAHMkshll3Ux7bbkQN51H9mmfHonVGwsJSgxPP910Gd4H8k47p
	w6qvbcTw==;
Date: Wed, 8 Sep 2021 08:06:33 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 09/12] swiotlb-xen: drop DEFAULT_NSLABS
Message-ID: <YThg+e+5lDoSFuqO@infradead.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <15259326-209a-1d11-338c-5018dc38abe8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15259326-209a-1d11-338c-5018dc38abe8@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Sep 07, 2021 at 02:07:47PM +0200, Jan Beulich wrote:
> It was introduced by 4035b43da6da ("xen-swiotlb: remove xen_set_nslabs")
> and then not removed by 2d29960af0be ("swiotlb: dynamically allocate
> io_tlb_default_mem").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

