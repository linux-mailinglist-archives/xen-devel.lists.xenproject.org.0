Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F32D68CEBE8
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 23:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729861.1135152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAcpF-0002g7-QH; Fri, 24 May 2024 21:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729861.1135152; Fri, 24 May 2024 21:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAcpF-0002dx-NU; Fri, 24 May 2024 21:51:45 +0000
Received: by outflank-mailman (input) for mailman id 729861;
 Fri, 24 May 2024 21:51:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAcpE-0002dr-Eg
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 21:51:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cde6008a-1a17-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 23:51:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA5F661E05;
 Fri, 24 May 2024 21:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33601C2BBFC;
 Fri, 24 May 2024 21:51:39 +0000 (UTC)
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
X-Inumbo-ID: cde6008a-1a17-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716587500;
	bh=zMZN/QOtwKl3M1pGVQQ0yPsaz6DyxlYrcCWIu8Yd1a8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rNy6m76RtxfVtHf9XAsYwm0Y/QC11GAKL6DSL6V34oK41XRu7VT+MEVCkeVF8z9nK
	 YxLBE2xXY+Uq+yN688NVdEkPP1Q/TZRsweRHscR198D/6nn/lOskTpUXyHkRUOorKz
	 UJOeAQVg59DmS5XEyTbKUjo4nFzqEkHhGUFPIrGEQnWyvd5Gi/9HDw1MThiPp4BaF/
	 KkrCyhqplJ7k84gQ3GZXIKFtv91pIvNiDZTyeTlphOsuQu4uFJZT95CJSJOU48Nkr2
	 iB08ccmNOvozzOHe4rURdM4J20rE5EL2sa0ggnewByR8p6Vi6cGCOk5ylnlyIZ7xl+
	 4DkwToH5GMsGA==
Date: Fri, 24 May 2024 14:51:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, anthony@xenproject.org, 
    sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com, 
    Volodymyr_Babchuk@epam.com, Henry Wang <xin.wang2@amd.com>, 
    Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: Re: [PATCH v5 5/7] xen/arm: Add XEN_DOMCTL_dt_overlay and device
 attachment to domains
In-Reply-To: <760dba0c-8731-48a3-81d8-cd8fa2dada77@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405241444170.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop> <20240524021814.2666257-5-stefano.stabellini@amd.com> <760dba0c-8731-48a3-81d8-cd8fa2dada77@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 May 2024, Julien Grall wrote:
> Hi Stefano,
> 
> On 24/05/2024 03:18, Stefano Stabellini wrote:
> > From: Henry Wang <xin.wang2@amd.com>
> > 
> > In order to support the dynamic dtbo device assignment to a running
> > VM, the add/remove of the DT overlay and the attach/detach of the
> > device from the DT overlay should happen separately. Therefore,
> > repurpose the existing XEN_SYSCTL_dt_overlay to only add the DT
> > overlay to Xen device tree, instead of assigning the device to the
> > hardware domain at the same time. It is OK to change the sysctl behavior
> > as this feature is experimental so changing sysctl behavior and breaking
> > compatibility is OK.
> > 
> > Add the XEN_DOMCTL_dt_overlay with operations
> > XEN_DOMCTL_DT_OVERLAY_ATTACH to do the device assignment to the domain.
> > 
> > The hypervisor firstly checks the DT overlay passed from the toolstack
> > is valid. Then the device nodes are retrieved from the overlay tracker
> > based on the DT overlay. The attach of the device is implemented by
> > mapping the IRQ and IOMMU resources. All devices in the overlay are
> > assigned to a single domain.
> > 
> > Also take the opportunity to make one coding style fix in sysctl.h.
> > 
> > xen,reg is to be used to handle non-1:1 mappings but it is currently
> > unsupported.
> 
> This means that we would still try to use 1:1 mappings for non-directmap
> domain. Given that the overlay is a blob, I am a bit concerned that the user
> may not notice any clash and it would be difficult to debug.
> 
> Therefore, I would like xen,reg to be mandatory when using non directmapped
> domain. For now, the best approach would be to prevent device assignment if
> !is_domain_direct_mapped().

That's fine, I'll make the change


> > +long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op)
> > +{
> > +    long ret;
> > +    void *overlay_fdt;
> > +
> > +    if ( op->overlay_op != XEN_DOMCTL_DT_OVERLAY_ATTACH )
> > +        return -EOPNOTSUPP;
> > +
> > +    if ( op->overlay_fdt_size == 0 || op->overlay_fdt_size > KB(500) )
> 
> Please add #define DT_OVERLAY_MAX_SIZE KB(500) and use it here and the other
> place.

OK

