Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC888CE38F
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 11:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729215.1134334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sARJw-0004vJ-P1; Fri, 24 May 2024 09:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729215.1134334; Fri, 24 May 2024 09:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sARJw-0004tC-MM; Fri, 24 May 2024 09:34:40 +0000
Received: by outflank-mailman (input) for mailman id 729215;
 Fri, 24 May 2024 09:34:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sARJv-0004t6-IG
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 09:34:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sARJv-0006No-1j; Fri, 24 May 2024 09:34:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sARJu-0003ju-QJ; Fri, 24 May 2024 09:34:38 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=zAgA/zrtVk/TEkpUAt+31TjtPcftSSa8FMCT76BStYE=; b=fskNRylt+MXgai1HpYkrIQAbsH
	T81a4vzK/GjgwqLeGjYkanh294wI+EkqmoCD8QFbN3E0ETDbr7TYj2uK4//8RxO4EKAnH5JfidHZS
	E2zvZ1efBitCqvU18OVbKg2h3jfXG++bptBBW7xgU1QhBlGEcGyKl7zOQf0WYdiKvdag=;
Message-ID: <760dba0c-8731-48a3-81d8-cd8fa2dada77@xen.org>
Date: Fri, 24 May 2024 10:34:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] xen/arm: Add XEN_DOMCTL_dt_overlay and device
 attachment to domains
Content-Language: en-GB
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: anthony@xenproject.org, sstabellini@kernel.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 Henry Wang <xin.wang2@amd.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
 <20240524021814.2666257-5-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240524021814.2666257-5-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 24/05/2024 03:18, Stefano Stabellini wrote:
> From: Henry Wang <xin.wang2@amd.com>
> 
> In order to support the dynamic dtbo device assignment to a running
> VM, the add/remove of the DT overlay and the attach/detach of the
> device from the DT overlay should happen separately. Therefore,
> repurpose the existing XEN_SYSCTL_dt_overlay to only add the DT
> overlay to Xen device tree, instead of assigning the device to the
> hardware domain at the same time. It is OK to change the sysctl behavior
> as this feature is experimental so changing sysctl behavior and breaking
> compatibility is OK.
> 
> Add the XEN_DOMCTL_dt_overlay with operations
> XEN_DOMCTL_DT_OVERLAY_ATTACH to do the device assignment to the domain.
> 
> The hypervisor firstly checks the DT overlay passed from the toolstack
> is valid. Then the device nodes are retrieved from the overlay tracker
> based on the DT overlay. The attach of the device is implemented by
> mapping the IRQ and IOMMU resources. All devices in the overlay are
> assigned to a single domain.
> 
> Also take the opportunity to make one coding style fix in sysctl.h.
> 
> xen,reg is to be used to handle non-1:1 mappings but it is currently
> unsupported.

This means that we would still try to use 1:1 mappings for non-directmap 
domain. Given that the overlay is a blob, I am a bit concerned that the 
user may not notice any clash and it would be difficult to debug.

Therefore, I would like xen,reg to be mandatory when using non 
directmapped domain. For now, the best approach would be to prevent 
device assignment if !is_domain_direct_mapped().

> +long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op)
> +{
> +    long ret;
> +    void *overlay_fdt;
> +
> +    if ( op->overlay_op != XEN_DOMCTL_DT_OVERLAY_ATTACH )
> +        return -EOPNOTSUPP;
> +
> +    if ( op->overlay_fdt_size == 0 || op->overlay_fdt_size > KB(500) )

Please add #define DT_OVERLAY_MAX_SIZE KB(500) and use it here and the 
other place.

Cheers,

-- 
Julien Grall

