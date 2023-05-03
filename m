Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9247E6F5F05
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 21:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529462.823907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puHyk-0004fb-Gs; Wed, 03 May 2023 19:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529462.823907; Wed, 03 May 2023 19:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puHyk-0004cI-DQ; Wed, 03 May 2023 19:17:30 +0000
Received: by outflank-mailman (input) for mailman id 529462;
 Wed, 03 May 2023 19:17:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ISkc=AY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1puHyi-0004cC-S7
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 19:17:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 233d47f7-e9e7-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 21:17:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D970B62E8D;
 Wed,  3 May 2023 19:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C610C433EF;
 Wed,  3 May 2023 19:17:23 +0000 (UTC)
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
X-Inumbo-ID: 233d47f7-e9e7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683141444;
	bh=7DLf9DxLpQdqFGhYy5M9J4sQ9tSCqG3t+rA1StCLhlE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X2aXxT9thLirWjWcV+6M+Oxq5/YD6oX9/Qx5urINHMTXMUQhcMGdkcEujr/7dW5nS
	 HDdde+bRtr6mbyytXFEZeckeHlz6pzb2CODhRQlyib0PZAo3vbYBhuVgAuRPB0y2Ul
	 ctGdK8twVJgdncY33MFr9HSeZEvgY2xK7OEtCEDSsuJ6z/A5FAUFZuZb9KdMfDxKT1
	 VIDduja2BhCfwXLTOe4mmyckv1ZGuSPxD/PTO0tDppenqGoseYjkOpqHKNWnCKaMQk
	 iWBfzc7zXSUAsC+WiUm7kRTQS5fqP0hqXhmiXUVBzwSszn2oGBYH9zZf8FjRdMsxpm
	 XCkga0NTgR6PA==
Date: Wed, 3 May 2023 12:17:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org, stefano.stabellini@amd.com, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Subject: Re: [RFC PATCH] xen/arm: arm32: Enable smpboot on Arm32 based
 systems
In-Reply-To: <e46baef3-be2f-bf76-1667-8b0562849b06@xen.org>
Message-ID: <alpine.DEB.2.22.394.2305031216310.974517@ubuntu-linux-20-04-desktop>
References: <20230502105849.40677-1-ayan.kumar.halder@amd.com> <alpine.DEB.2.22.394.2305021643010.974517@ubuntu-linux-20-04-desktop> <a0d48f47-bb62-5ed0-0c9b-95935dc75ca3@xen.org> <alpine.DEB.2.22.394.2305031053590.974517@ubuntu-linux-20-04-desktop>
 <e46baef3-be2f-bf76-1667-8b0562849b06@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 May 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 03/05/2023 18:54, Stefano Stabellini wrote:
> > On Wed, 3 May 2023, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 03/05/2023 00:55, Stefano Stabellini wrote:
> > > > > +    {
> > > > > +        printk("CPU%d: No release addr\n", cpu);
> > > > > +        return -ENODEV;
> > > > > +    }
> > > > > +
> > > > > +    release = ioremap_nocache(cpu_release_addr[cpu], 4);
> > > > > +    if ( !release )
> > > > > +    {
> > > > > +        dprintk(XENLOG_ERR, "CPU%d: Unable to map release address\n",
> > > > > cpu);
> > > > > +        return -EFAULT;
> > > > > +    }
> > > > > +
> > > > > +    writel(__pa(init_secondary), release);
> > > > > +
> > > > > +    iounmap(release);
> > > > 
> > > > I think we need a wmb() ?
> > > 
> > > I am not sure why we would need a wmb() here.
> > 
> > The code does:
> > 
> > writel(__pa(init_secondary), release);
> > iounmap
> > sev();
> > 
> > I was thinking of trying to make sure the write is completed before
> > issuing a sev(). Technically it is possible for the CPU to reorder the
> > sev() before the write as there is no explicit dependency between the
> > two?
> 
> I would assume that iounmap() would contain an wmb(). But I guess this is not
> something we should rely on.
> 
> > 
> > > Instead, looking at the Linux
> > > version, I think we are missing a cache flush (so does on arm64) which
> > > would
> > > be necessary if the CPU waiting for the release doesn't have cache
> > > enabled.
> > 
> > I thought about it as well but here the patch is calling
> > ioremap_nocache(), so cache flushes should not be needed?
> 
> Hmmm... You are right, we are using ioremap_nocache(). I got confused because
> Linux is using ioremap_cache(). I am now wondering whether we are using the
> correct helper.
> 
> AFAIU, spin table is part of the reserved memory section in the Device-Tree.
> From section 5.3 in [1], the memory could be mapped cacheable by the other
> end. So for correctness, it seems to me that we would need to use
> ioremap_cache() + cache flush.

Good point


> BTW, writel_relaxed() should be sufficient here as there is no ordering
> necessary with any previous write.


