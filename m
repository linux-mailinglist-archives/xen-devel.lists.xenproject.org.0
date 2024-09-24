Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5A0984E29
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 00:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803355.1213883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stEOO-0006Y4-LU; Tue, 24 Sep 2024 22:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803355.1213883; Tue, 24 Sep 2024 22:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stEOO-0006Vh-Ia; Tue, 24 Sep 2024 22:52:24 +0000
Received: by outflank-mailman (input) for mailman id 803355;
 Tue, 24 Sep 2024 22:52:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=325E=QW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1stEON-0006VZ-ES
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 22:52:23 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a844efba-7ac7-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 00:52:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E8B51A436CB;
 Tue, 24 Sep 2024 22:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5956C4CEC4;
 Tue, 24 Sep 2024 22:52:18 +0000 (UTC)
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
X-Inumbo-ID: a844efba-7ac7-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727218340;
	bh=xQpOvywgOWN6qJxEerQMGxk4joNwzFDiRM0Ga93qiVk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G3UVntH7Rgdg6YtAsss+/ZpocJDYDDP8IdxeAkQeNKerGwggQDASv7CP6q5iMBpLp
	 oTIYQ5YKmMQVAD8/81V/K551BBYIZBi2axQDo6kcVVBuUiOnKpD9AoG99gRObEooQ5
	 wg5jyDOWB/3BnbVlaAAWZqC5F0o7j/F0FleQouvGaJp1HYdpJ0CDJV/601t3SH+9ed
	 OFOY6jcn0bklrUK8lp9HHMTIbtUrc0yV6M1BXVZKpKNJ+LXzS4WEof1eBNnNOLKEoG
	 yQ+3x4HZDmFhxz3ubr6wrTycPj2meqsjpWGX1K9NWrf5jFUPpFev/YGmfg1IeUyyc9
	 DMl6qOzxzLkmw==
Date: Tue, 24 Sep 2024 15:52:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    edgar.iglesias@amd.com, xen-devel@lists.xenproject.org, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 2/4] hw/xen: xenpvh: Disable buffered IOREQs for ARM
In-Reply-To: <20240923145520.1323504-3-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2409241552100.1417852@ubuntu-linux-20-04-desktop>
References: <20240923145520.1323504-1-edgar.iglesias@gmail.com> <20240923145520.1323504-3-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Sep 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add a way to enable/disable buffered IOREQs for PVH machines
> and disable them for ARM. ARM does not support buffered
> IOREQ's nor the legacy way to map IOREQ info pages.
> 
> See the following for more details:
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=2fbd7e609e1803ac5e5c26e22aa8e4b5a6cddbb1
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/ioreq.c;h=2e829d2e7f3760401b96fa7c930e2015fb1cf463;hb=HEAD#l138
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen-pvh.c                | 3 +++
>  hw/i386/xen/xen-pvh.c           | 3 +++
>  hw/xen/xen-pvh-common.c         | 2 +-
>  include/hw/xen/xen-pvh-common.h | 3 +++
>  4 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> index 04cb9855af..28af3910ea 100644
> --- a/hw/arm/xen-pvh.c
> +++ b/hw/arm/xen-pvh.c
> @@ -66,6 +66,9 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>       */
>      mc->max_cpus = GUEST_MAX_VCPUS;
>  
> +    /* Xen/ARM does not use buffered IOREQs.  */
> +    xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_OFF;
> +
>      /* List of supported features known to work on PVH ARM.  */
>      xpc->has_tpm = true;
>      xpc->has_virtio_mmio = true;
> diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c
> index 45645667e9..f1f02d3311 100644
> --- a/hw/i386/xen/xen-pvh.c
> +++ b/hw/i386/xen/xen-pvh.c
> @@ -89,6 +89,9 @@ static void xen_pvh_machine_class_init(ObjectClass *oc, void *data)
>      /* We have an implementation specific init to create CPU objects.  */
>      xpc->init = xen_pvh_init;
>  
> +    /* Enable buffered IOREQs.  */
> +    xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_ATOMIC;
> +
>      /*
>       * PCI INTX routing.
>       *
> diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> index 08641fdcec..76a9b2b945 100644
> --- a/hw/xen/xen-pvh-common.c
> +++ b/hw/xen/xen-pvh-common.c
> @@ -195,7 +195,7 @@ static void xen_pvh_init(MachineState *ms)
>  
>      xen_pvh_init_ram(s, sysmem);
>      xen_register_ioreq(&s->ioreq, ms->smp.max_cpus,
> -                       HVM_IOREQSRV_BUFIOREQ_ATOMIC,
> +                       xpc->handle_bufioreq,
>                         &xen_memory_listener);
>  
>      if (s->cfg.virtio_mmio_num) {
> diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
> index bc09eea936..5cdd23c2f4 100644
> --- a/include/hw/xen/xen-pvh-common.h
> +++ b/include/hw/xen/xen-pvh-common.h
> @@ -43,6 +43,9 @@ struct XenPVHMachineClass {
>       */
>      int (*set_pci_link_route)(uint8_t line, uint8_t irq);
>  
> +    /* Allow implementations to optionally enable buffered ioreqs.  */
> +    uint8_t handle_bufioreq;
> +
>      /*
>       * Each implementation can optionally enable features that it
>       * supports and are known to work.
> -- 
> 2.43.0
> 

