Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B784E6382
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 13:43:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294283.500303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXMnw-0003TP-MI; Thu, 24 Mar 2022 12:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294283.500303; Thu, 24 Mar 2022 12:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXMnw-0003Pl-J1; Thu, 24 Mar 2022 12:43:04 +0000
Received: by outflank-mailman (input) for mailman id 294283;
 Thu, 24 Mar 2022 12:43:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6vFe=UD=suse.com=mhocko@srs-se1.protection.inumbo.net>)
 id 1nXMnv-0003Pf-Ps
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 12:43:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1863a51-ab6f-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 13:43:02 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0970F1F745;
 Thu, 24 Mar 2022 12:43:02 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C8E96A3B93;
 Thu, 24 Mar 2022 12:43:01 +0000 (UTC)
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
X-Inumbo-ID: f1863a51-ab6f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648125782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KtkJHll3BGHTPIchNMgaGNfzKDZMQ29t02N6cPbRei8=;
	b=WmEIeEQumjQlWOh3pJEUKzE7T8O+U2xNXKX+KlcLt/ijrxWI05XaNwqkjRNdnoOmkICLWn
	gM6tYrTi4FDvr2gWUm341gRjdASUkBoB313ZN0eUGPnUlRRQsbSDHtwaZc/U1aYzt/Ltcd
	Hiezll6ttvEyIPTX+1v0xaYTZnI4iq0=
Date: Thu, 24 Mar 2022 13:42:56 +0100
From: Michal Hocko <mhocko@suse.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Juergen Gross <jgross@suse.com>, linux-mm@kvack.org,
	lkml <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jerome Glisse <jglisse@redhat.com>
Subject: Re: blocking vs. non-blocking mmu notifiers
Message-ID: <YjxnULAWb3PLvrky@dhcp22.suse.cz>
References: <8e8ec786-74db-157b-a290-b1537941e91d@suse.com>
 <YjrsOnxaPYc3rbdj@dhcp22.suse.cz>
 <20220323163146.GI64706@ziepe.ca>
 <YjtPpxlE/zWwnJ0W@dhcp22.suse.cz>
 <20220323170404.GK64706@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323170404.GK64706@ziepe.ca>

On Wed 23-03-22 14:04:04, Jason Gunthorpe wrote:
> On Wed, Mar 23, 2022 at 05:49:43PM +0100, Michal Hocko wrote:
> > > The bug here is that prior to commit a81461b0546c ("xen/gntdev: update
> > > to new mmu_notifier semantic") wired the mn_invl_range_start() which
> > > takes a mutex to invalidate_page, which is defined to run in an atomic
> > > context.
> > 
> > Yeah, we have already identified that but quickly realized that the
> > whole mmu notifier overhaul which this fix depends on would be no no for
> > backporting to our older code base. So we are trying to find our way
> > around that.
> 
> IMHO you don't need everything, just commit 369ea8242c0f ("mm/rmap:
> update to new mmu_notifier semantic v2") which adds the missing
> start/end outside the lock for the page callbacks.
> 
> Then you can take safely a8146 into gntdev.

Thanks Jason!

-- 
Michal Hocko
SUSE Labs

