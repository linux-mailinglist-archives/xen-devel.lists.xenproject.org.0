Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32575158E1
	for <lists+xen-devel@lfdr.de>; Sat, 30 Apr 2022 01:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317882.537408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkZpw-0007bI-J9; Fri, 29 Apr 2022 23:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317882.537408; Fri, 29 Apr 2022 23:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkZpw-0007YZ-FT; Fri, 29 Apr 2022 23:15:44 +0000
Received: by outflank-mailman (input) for mailman id 317882;
 Fri, 29 Apr 2022 23:15:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlFr=VH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nkZpu-0007YT-TY
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 23:15:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 493fc147-c812-11ec-a405-831a346695d4;
 Sat, 30 Apr 2022 01:15:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15EE1623B1;
 Fri, 29 Apr 2022 23:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CB2C385A4;
 Fri, 29 Apr 2022 23:15:38 +0000 (UTC)
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
X-Inumbo-ID: 493fc147-c812-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651274139;
	bh=elqH2Ff8eBloOqEP96qiH80wO36PP21s6y+XTLp+enQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZHx10dC2uYiU9hpRuYyFhaRjHDl2mx8JQrxkHwwfcxcU8kIjVZwHY6oPAx5ruUqMm
	 9LGLGarvn440A377DUk+FLghxuZLqScNQXrYOuaoR4yZaGTm8Yo2+VoJ0l6a/tR7hf
	 E6QYw0PtTF7Yty5mlkrLvfnn7GtN9kC4B1fKJHohrefvOVZLMXe+jzQjTvokzWTeOi
	 4Wq5k3+9NZa+6ZFkkUF/URXKfmbgkR6qBM1ASjZa6eH/kxjqkV94qR+ywfCQI+PRug
	 yPfaiPT49IYBy3Z9hqelOY/kPqi7s6b3fNKLXQh6AfbHOOSuRZ9g3uoLlb7ALxyyql
	 3cUqFyTUpUMNA==
Date: Fri, 29 Apr 2022 16:15:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Christoph Hellwig <hch@lst.de>, jgross@suse.com, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    iommu@lists.linux-foundation.org, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH] swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm
In-Reply-To: <41c2483c-ab54-41be-7815-9d4a98e0249e@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2204291615130.1947187@ubuntu-linux-20-04-desktop>
References: <20220423171422.1831676-1-hch@lst.de> <alpine.DEB.2.22.394.2204261605420.915916@ubuntu-linux-20-04-desktop> <20220428132737.GA13999@lst.de> <alpine.DEB.2.22.394.2204281449060.915916@ubuntu-linux-20-04-desktop> <27d39d5a-3b79-bdda-b7e4-f4477667919f@oracle.com>
 <alpine.DEB.2.22.394.2204281548320.915916@ubuntu-linux-20-04-desktop> <41c2483c-ab54-41be-7815-9d4a98e0249e@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Apr 2022, Boris Ostrovsky wrote:
> On 4/28/22 6:49 PM, Stefano Stabellini wrote:
> > On Thu, 28 Apr 2022, Boris Ostrovsky wrote:
> > > On 4/28/22 5:49 PM, Stefano Stabellini wrote:
> > > > On Thu, 28 Apr 2022, Christoph Hellwig wrote:
> > > > > On Tue, Apr 26, 2022 at 04:07:45PM -0700, Stefano Stabellini wrote:
> > > > > > > Reported-by: Rahul Singh <Rahul.Singh@arm.com>
> > > > > > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > > > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > > > > Do you want to take this through the Xen tree or should I pick it up?
> > > > > Either way I'd love to see some testing on x86 as well.
> > > > I agree on the x86 testing. Juergen, Boris?
> > > > 
> > > > I'd say to take this patch via the Xen tree but Juergen has just sent a
> > > > Xen pull request to Linux last Saturday. Juergen do you plan to send
> > > > another one? Do you have something else lined up? If not, it might be
> > > > better to let Christoph pick it up.
> > > 
> > > We don't have anything pending.
> > > 
> > > 
> > > I can test it but at best tomorrow so not sure we can get this into rc5.
> > > Do
> > > you consider this an urgent fix or can we wait until 5.19? Because it's a
> > > bit
> > > too much IMO for rc6.
> > On one hand, Linux doesn't boot on a platform without this fix. On the
> > other hand, I totally see that this patch could introduce regressions on
> > x86 so I think it is fair that we are careful with it.
> > 
> >  From my point of view, it might be better to wait for 5.19 and mark it
> > as backport.
> 
> 
> No problems uncovered during testing.

Great! Christoph you can go ahead and pick it up in your tree if you are
up for it.

