Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4366B984F56
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 02:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803409.1213964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stFZI-0003p1-MH; Wed, 25 Sep 2024 00:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803409.1213964; Wed, 25 Sep 2024 00:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stFZI-0003nW-JS; Wed, 25 Sep 2024 00:07:44 +0000
Received: by outflank-mailman (input) for mailman id 803409;
 Wed, 25 Sep 2024 00:07:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYkR=QX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1stFZH-0003nQ-H5
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 00:07:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ea7079d-7ad2-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 02:07:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 697645C03EB;
 Wed, 25 Sep 2024 00:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96F7C4CEC4;
 Wed, 25 Sep 2024 00:07:39 +0000 (UTC)
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
X-Inumbo-ID: 2ea7079d-7ad2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727222861;
	bh=nkLObgFPD95DJkWdi5TbAw8Ph1tuR/+AlMD/GzGJOsM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ap9JVj+DpBuFptswzsg1dqwxuJtCtYko7P+7WKzf4nuFr9TQpp5nil2+V7CiI/ubC
	 iwi+dN03WN9gCWn4/62oIFAry+rfNZXKhBbeR806shK4GWGLhsxM+hZ2BCW+14+mrv
	 HEhgl9Ncls6QPSerBZV6zlS0Fgi4StI3fnSDCfvn0UIDrFlwmiIm/o8rciAcg2AvBQ
	 VbEnTMo/cCW9PZ5YL1Fwl6nKg7PSDuHcAtLa09ETN26beXf0O45Oyn4h/k8yQcvamm
	 WNX+NFhx9sVDQ/EEC5P4PmpXQ+lR36OYDDTkjzQiIEjtgyd0AyjmbtcJ+FxzfPDXOf
	 569usfkRkRVEA==
Date: Tue, 24 Sep 2024 17:07:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    dpsmith@apertussolutions.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v1 6/6] xen/arm: dom0less: Add a background PCI ECAM mmio
 region
In-Reply-To: <20240924162359.1390487-7-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2409241704330.1417852@ubuntu-linux-20-04-desktop>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com> <20240924162359.1390487-7-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Sep 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add a background PCI ECAM mmio region always reading as all ones.
> This indicates to the OS that there are no PCI devices on the bus.
> Once the device-model's IOREQ client connects, the OS can rescan
> the bus and find PV and emulated devices.
> 
> This avoids a race where domU's come up before the device models,
> causing domU to crash into a data-abort when accessing ECAM.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  xen/arch/arm/dom0less-build.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index dab24fa9e2..bc5285e7fa 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -1015,6 +1015,16 @@ static int __init construct_domU(struct domain *d,
>              kinfo.virtio_pci.mem.base = GUEST_VIRTIO_PCI_MEM_BASE;
>              kinfo.virtio_pci.pf_mem.base = GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE;
>          }
> +
> +        /*
> +         * Register a background PCI ECAM region returning ~0. This indicates
> +         * to the OS that there are no PCI devices on the bus. Once an IOREQ
> +         * client connects, the OS can rescan the bus and find devices.
> +         */
> +        register_mmio_bg_handler(d, true, &mmio_read_const_writes_ignored,
> +                                 kinfo.virtio_pci.ecam.base,
> +                                 GUEST_VIRTIO_PCI_ECAM_SIZE,
> +                                 (void *) ULONG_MAX);
>      }

I think GUEST_VIRTIO_PCI_ECAM_SIZE should be added to the description of
virtio-pci-ranges in patch #3  to make it clear. Also any other "size"
too.

The ULONG_MAX -> void* -> uintptr_t -> register_t conversion works OK on
both Xen 64-bit and 32-bit as far as I can tell, so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

