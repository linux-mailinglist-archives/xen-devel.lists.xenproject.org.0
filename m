Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9F64DE3BF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 22:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292245.496377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVKUX-0003PN-14; Fri, 18 Mar 2022 21:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292245.496377; Fri, 18 Mar 2022 21:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVKUW-0003Na-UP; Fri, 18 Mar 2022 21:50:36 +0000
Received: by outflank-mailman (input) for mailman id 292245;
 Fri, 18 Mar 2022 21:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3xU5=T5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nVKUW-0003NU-60
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 21:50:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f20942b-a705-11ec-a405-831a346695d4;
 Fri, 18 Mar 2022 22:50:34 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF5996149A;
 Fri, 18 Mar 2022 21:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76B2C340E8;
 Fri, 18 Mar 2022 21:50:30 +0000 (UTC)
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
X-Inumbo-ID: 6f20942b-a705-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647640231;
	bh=p8ry/hNCFSOT0oYHk0/ml1Pjp/je6u51H6cq1IPkFlY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Uux0MzJ3LrV98e5SxuKVVUk+YA8NM7x3Kl2Oku9vtsL3sW2jCLzZXd0kRUCP33BeV
	 l/Ha+IYJ49yYwddegmm88j8eusVbZF/WSw0JCpAg3t+jrInY0MPGpzlzUfpENNWp4F
	 AsDx34Ax5rLslN4fsBi7Xe3Yw3thwBPq3AqrQWZgNrydBeMPfvS6/M4rAlbPns8OOL
	 Dj22kaiCnZdNVaF7MxGiw+DsmKOcgIdVBdXxdP7YxLH3xjS4M0iQjV1T0FeDtDPoDU
	 J0W/reqZisblmir2zNNWhhWw28WNbnB+Fds3U0vCuWlNty4WA+w3veHOW3GlJbiU2P
	 IXj4/Zl7jQanQ==
Date: Fri, 18 Mar 2022 14:50:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Penny Zheng <Penny.Zheng@arm.com>, nd@arm.com, 
    Penny Zheng <penzhe01@a011292.shanghai.arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 02/13] xen/arm: introduce a special domain
 DOMID_SHARED
In-Reply-To: <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com>
Message-ID: <alpine.DEB.2.22.394.2203181443440.2910984@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-3-Penny.Zheng@arm.com> <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Mar 2022, Jan Beulich wrote:
> On 11.03.2022 07:11, Penny Zheng wrote:
> > In case to own statically shared pages when owner domain is not
> > explicitly defined, this commits propose a special domain DOMID_SHARED,
> > and we assign it 0x7FF5, as one of the system domains.
> > 
> > Statically shared memory reuses the same way of initialization with static
> > memory, hence this commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
> > related codes, and this option depends on static memory(CONFIG_STATIC_MEMORY).
> > 
> > We intends to do shared domain creation after setup_virt_paging so shared
> > domain could successfully do p2m initialization.
> 
> There's nothing said here, in the earlier patch, or in the cover letter
> about the security aspects of this. There is a reason we haven't been
> allowing arbitrary, un-supervised sharing of memory between domains. It
> wants clarifying why e.g. grants aren't an option to achieve what you
> need, and how you mean to establish which domains are / aren't permitted
> to access any individual page owned by this domain.


I'll let Penny write a full reply but I'll chime in to try to help with
the explanation.

This is not arbitrary un-supervised sharing of memory between domains,
which indeed is concerning.

This is statically-configured, supervised by the system configurator,
sharing of memory between domains.

And in fact safety (which is just a different aspect of security) is one
of the primary goals for this work.

In safety-critical environments, it is not considered safe to
dynamically change important configurations at runtime. Everything
should be statically defined and statically verified.

In this case, if the system configuration knows a priori that there are
only 2 VM and they need to communication over shared memory, it is safer
to pre-configure the shared memory at build time rather than let the VMs
attempt to share memory at runtime. It is faster too.

The only way to trigger this static shared memory configuration should
be via device tree, which is at the same level as the XSM rules
themselves.

Hopefully I made things clearer and not murkier :-)

