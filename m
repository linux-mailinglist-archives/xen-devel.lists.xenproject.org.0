Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792F1499D15
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 23:16:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259992.448904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC7bx-0000yy-AC; Mon, 24 Jan 2022 22:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259992.448904; Mon, 24 Jan 2022 22:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC7bx-0000wz-6n; Mon, 24 Jan 2022 22:14:53 +0000
Received: by outflank-mailman (input) for mailman id 259992;
 Mon, 24 Jan 2022 22:14:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ZXe=SI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nC7bv-0000wt-I3
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 22:14:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b1fc54c-7d63-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 23:14:49 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E83BC611EA;
 Mon, 24 Jan 2022 22:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDC5C340E7;
 Mon, 24 Jan 2022 22:14:44 +0000 (UTC)
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
X-Inumbo-ID: 0b1fc54c-7d63-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643062484;
	bh=a0De33ItmRHJeTZtQjS5RWputpBKXe2dW2jQY9vNaxM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y6A6AU9P86koA8MMfwiZPU+/YYjQcQG+XFR7ELahVr1m3p/yakr6pfjysMG/8OU/4
	 DwSDdfJxNy1uhskjNwMA2Zwd0G/DGdRQUKnQo/4MnOoK1t975CUneB+QvAvqOEFsoT
	 Pnhegbss20CDzImFlEWqydREbEANnOJ/SY1DdwQ2Tz6WaK/SMWCaPjUNnM5JWkhxkD
	 r9u+JESfp98VGbsqnXmfNk3K/Ejpju6uFtzZlkvWAEacQEkO3pIfsiBzqmwB2EY2Dw
	 4nbdbc1OkKMN/qcJtu6ApkHXN3p/M/xDlPznu4iSu+uYmYw8mYDLQecWMZLqbLvP+Y
	 iMluRLlPvpxXA==
Date: Mon, 24 Jan 2022 14:14:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
In-Reply-To: <d5c84296-79a6-5698-802d-4d9ba60dbf24@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201241403240.27308@ubuntu-linux-20-04-desktop>
References: <20211221200305.GA2460476@EPUAKYIW015D> <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop> <20211222110414.GA2883815@EPUAKYIW015D> <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop> <20220119120400.GA3779126@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201191644400.19362@ubuntu-linux-20-04-desktop> <20220120102147.GA4153317@EPUAKYIW015D> <alpine.DEB.2.22.394.2201201230480.27308@ubuntu-linux-20-04-desktop> <20220121150753.GA898010@EPUAKYIW015D> <alpine.DEB.2.22.394.2201211236060.27308@ubuntu-linux-20-04-desktop>
 <20220124182249.GA2485483@EPUAKYIW015D> <alpine.DEB.2.22.394.2201241056290.27308@ubuntu-linux-20-04-desktop> <d5c84296-79a6-5698-802d-4d9ba60dbf24@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jan 2022, Julien Grall wrote:
> On 24/01/2022 19:06, Stefano Stabellini wrote:
> > It looks like XEN_DOMCTL_host_node_by_path and
> > XEN_DOMCTL_find_host_compatible_node would also solve the problem but I
> > think that a single hypercall that retrieves the entire host DTB would
> > be easier to implement
> 
> DOMCTL should only be used to handle per-domain information. If we want to
> create a new sub-hypercall of either __HYPERVISOR_platform_op or
> __HYPERVISOR_sysctl_op (not sure which one).
> 
> AFAICT, both are versioned.
> 
> > and more robust in the long term. >
> > hypfs has the advantage that it would create an interface more similar
> > to the one people are already used to on Linux systems
> > (/proc/device-tree). xl/libxl would have to scan the whole hypfs tree,
> > which intuitively I think it would be slower.
> 
> Even if you have the binary blob, you would still have to scan the
> device-tree. That said, it is probably going to be potentially a bit faster
> because you have less hypercall.
> 
> However, here this is a trade-off between memory use and speed. If you want
> speed, then you may have to transfer up to 2MB every time. So the question is
> do we care more about speed or memory usage?
> 
> > Also the feature might be
> > harder to implement but I am not sure.
> > 
> > I don't have a strong preference and this is not a stable interface (we
> > don't have to be extra paranoid about forward and backward
> > compatibility). So I am fine either way. Let's see what the others think
> > as well.
> 
> My preference would be to use hypfs as this is cleaner than exposing a blob.

That's also fine by me. Probably the hypfs implementation shouldn't be
much more difficult than something like
XEN_DOMCTL_host_node_by_path/XEN_DOMCTL_find_host_compatible_node.


> However, are we sure we can simply copy the content of the host Device-Tree to
> the guest Device-Tree for SCMI? For instance, I know that for device
> passthrough there are some property that needs to be altered for some devices.
> Hence, why it is not present. Although, I vaguely recalled to have written a
> PoC, not sure if it was posted on the ML.

The SCMI node cannot be copied "as is" from host to guest. It needs a
couple of changes but they seem feasible as they are limited to the
channels exposed to the guest. (The generic device passthrough case is a
lot more difficult.)

