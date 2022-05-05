Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D7251CA87
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 22:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322371.543653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmi1f-00017F-JB; Thu, 05 May 2022 20:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322371.543653; Thu, 05 May 2022 20:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmi1f-00015O-GO; Thu, 05 May 2022 20:24:39 +0000
Received: by outflank-mailman (input) for mailman id 322371;
 Thu, 05 May 2022 20:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmi1e-0000pB-4w
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 20:24:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61e3a317-ccb1-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 22:24:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CEA061E85;
 Thu,  5 May 2022 20:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC07C385A4;
 Thu,  5 May 2022 20:24:34 +0000 (UTC)
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
X-Inumbo-ID: 61e3a317-ccb1-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651782275;
	bh=a14+JEcgQvZosgTIeFyNoWmCUpYVx97L0RGZOeBDFd4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PJYZ/LGNYRu4yYDWk6OmeVIGB3fGWi7bhfp2DUMJNVCUZuaWA8ue9No/RxnsXHuVq
	 rBQO2svwv6SiJIMwxXyMxq8p4xq99bxKFZ5w7Y5bVuKkIbyXLtB9iWAgH8ggtHWhcu
	 Xo0QMMyY/dnJFH3U+ReDAh34/0Dp4U9EF21777XsdWBiYGXXWwzDi9OTuuIBHUtShk
	 wgDeKXYv4fn+HCjG/TZQ1CSQd86iSFsQeW/e4zGQftl8Iq3IVlLTUk8G/l93R6I519
	 WGTxGuo21IPhwq4ZLHn9ST+ZZrUfjs3vOnm+GD9Sr3QzWw7EjuaOxwbpJSydmKlnOg
	 muOuFAy4YFBoA==
Date: Thu, 5 May 2022 13:24:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com, 
    Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
In-Reply-To: <6e3aa32b-5b6e-7432-a6db-f2e8f9937c2a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2205051321180.43560@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop> <20220505001656.395419-4-sstabellini@kernel.org> <6e3aa32b-5b6e-7432-a6db-f2e8f9937c2a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 May 2022, Jan Beulich wrote:
> On 05.05.2022 02:16, Stefano Stabellini wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> > 
> > Export evtchn_alloc_unbound and make it __must_check.
> > 
> > If "xen,enhanced" is enabled, then add to dom0less domains:
> > 
> > - the hypervisor node in device tree
> > - the xenstore event channel
> > 
> > The xenstore event channel is also used for the first notification to
> > let the guest know that xenstore has become available.
> > 
> > Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > CC: Julien Grall <julien@xen.org>
> > CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > CC: Bertrand Marquis <bertrand.marquis@arm.com>
> > CC: jbeulich@suse.com
> 
> Somehow my ack given for v5 was lost?

I'll put it back


> > ---
> > Changes in v5:
> > - merge with "xen: export evtchn_alloc_unbound"
> > - __must_check
> > 
> > Changes in v3:
> > - use evtchn_alloc_unbound
> > 
> > Changes in v2:
> > - set HVM_PARAM_STORE_PFN to ~0ULL at domain creation
> > - in alloc_xenstore_evtchn do not call _evtchn_alloc_unbound
> > 
> > xen: export evtchn_alloc_unbound
> > 
> > It will be used during dom0less domains construction.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> This is somewhat confusing to find in a post-commit-message remark.

Sorry I don't know what happened there

