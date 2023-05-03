Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DBB6F5D57
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 19:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529429.823857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puGgG-0002XW-C1; Wed, 03 May 2023 17:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529429.823857; Wed, 03 May 2023 17:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puGgG-0002VY-8p; Wed, 03 May 2023 17:54:20 +0000
Received: by outflank-mailman (input) for mailman id 529429;
 Wed, 03 May 2023 17:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ISkc=AY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1puGgF-0002VS-Ew
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 17:54:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86135c70-e9db-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 19:54:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE40260F7B;
 Wed,  3 May 2023 17:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBB9C433EF;
 Wed,  3 May 2023 17:54:15 +0000 (UTC)
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
X-Inumbo-ID: 86135c70-e9db-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683136456;
	bh=pYSY+/3DUBT8zv91GwZKnPhkAlej1WQJEZ6BUC42DsM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZbZQB4SU/VtM5irjWc60DW7lyHBSM0kf8mCFsv9LbYSgD/tyhYNdsg+aOhQbUks5x
	 q4pV+8YX+xd+98Jb/GYDyCrJqD5g0UADxB+gXs7d0NHl96NUjKgzBb9U6o+nTyjGSv
	 rXJe86FOc1K+W4CcqdFFDqdYdQMy8M1ZPp6e5G8nemHjOEgeQyk3brd0zJJwmzwmtD
	 J3YKxomKeQBxJG/9K9WGid1hvJyLgmE6jvQrn4NA8/9RQ4Rxj15ZlB6OdumfaarL60
	 lrPr8pyrYVKNuovx1NIgmu2/2pU7i582EsytVw/Yy/c4NySIkdXeUYzcF7xfpSdl+J
	 YNDGQFZnFpD2g==
Date: Wed, 3 May 2023 10:54:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org, stefano.stabellini@amd.com, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Subject: Re: [RFC PATCH] xen/arm: arm32: Enable smpboot on Arm32 based
 systems
In-Reply-To: <a0d48f47-bb62-5ed0-0c9b-95935dc75ca3@xen.org>
Message-ID: <alpine.DEB.2.22.394.2305031053590.974517@ubuntu-linux-20-04-desktop>
References: <20230502105849.40677-1-ayan.kumar.halder@amd.com> <alpine.DEB.2.22.394.2305021643010.974517@ubuntu-linux-20-04-desktop> <a0d48f47-bb62-5ed0-0c9b-95935dc75ca3@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 May 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 03/05/2023 00:55, Stefano Stabellini wrote:
> > > +    {
> > > +        printk("CPU%d: No release addr\n", cpu);
> > > +        return -ENODEV;
> > > +    }
> > > +
> > > +    release = ioremap_nocache(cpu_release_addr[cpu], 4);
> > > +    if ( !release )
> > > +    {
> > > +        dprintk(XENLOG_ERR, "CPU%d: Unable to map release address\n",
> > > cpu);
> > > +        return -EFAULT;
> > > +    }
> > > +
> > > +    writel(__pa(init_secondary), release);
> > > +
> > > +    iounmap(release);
> > 
> > I think we need a wmb() ?
> 
> I am not sure why we would need a wmb() here.

The code does:

writel(__pa(init_secondary), release);
iounmap
sev();

I was thinking of trying to make sure the write is completed before
issuing a sev(). Technically it is possible for the CPU to reorder the
sev() before the write as there is no explicit dependency between the
two?


> Instead, looking at the Linux
> version, I think we are missing a cache flush (so does on arm64) which would
> be necessary if the CPU waiting for the release doesn't have cache enabled.

I thought about it as well but here the patch is calling
ioremap_nocache(), so cache flushes should not be needed?

