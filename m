Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00BC97A9BF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 01:48:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799753.1209760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqLRf-00005m-Hp; Mon, 16 Sep 2024 23:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799753.1209760; Mon, 16 Sep 2024 23:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqLRf-0008Vb-EC; Mon, 16 Sep 2024 23:47:51 +0000
Received: by outflank-mailman (input) for mailman id 799753;
 Mon, 16 Sep 2024 23:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3gN=QO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sqLRe-0008V0-Qz
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 23:47:50 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 140d1644-7486-11ef-99a2-01e77a169b0f;
 Tue, 17 Sep 2024 01:47:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 16077A426A2;
 Mon, 16 Sep 2024 23:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F43C4CEC4;
 Mon, 16 Sep 2024 23:47:45 +0000 (UTC)
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
X-Inumbo-ID: 140d1644-7486-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726530467;
	bh=bDRJfxN59zHNn0MVplLYT1m2IcfF93b7RFm9gAS5NN4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PuhnKKNAfIBJl2P4TpBcw9uwEmh1ElcVRDqk9YM7l429KrapyGQWAH9YBWNER1fRA
	 +11q1wmJ8lO+d28O6ReJxwgwPheCv6zp1ZHbv7W1UzCUg05gyVff/bYxGXr3XpRTym
	 FOJDvPI6zqz5jck6lz7zOhk0ITNvwEnRxbicoKYwWolhC4APVlfuu7zjMZZ0Da3u6e
	 snt0iey/e6diAsSS9LP2g7in5Dz7Ml7kDe1FqBOl2QjQ23RvWQgkqTtP5HFpo5AvKm
	 fprIowIYfLUY4+Q31Z0vtBR54+hfJJEsdyx9BE2Lo4kf6GYG5aUUucmJ1Wrx6zztB3
	 uKMxKDKitPvDg==
Date: Mon, 16 Sep 2024 16:47:43 -0700 (PDT)
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
Subject: Re: [PATCH v1 2/4] hw/xen: xenpvh: Disable buffered IOREQs for ARM
In-Reply-To: <20240916150853.1216703-3-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2409161646360.1417852@ubuntu-linux-20-04-desktop>
References: <20240916150853.1216703-1-edgar.iglesias@gmail.com> <20240916150853.1216703-3-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Sep 2024, Edgar E. Iglesias wrote:
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
> index bc09eea936..62c44a1ce7 100644
> --- a/include/hw/xen/xen-pvh-common.h
> +++ b/include/hw/xen/xen-pvh-common.h
> @@ -43,6 +43,9 @@ struct XenPVHMachineClass {
>       */
>      int (*set_pci_link_route)(uint8_t line, uint8_t irq);
>  
> +    /* Allow implementations to optionally enable buffered ioreqs.  */
> +    int handle_bufioreq;

Looking at the corresponding Xen interface this field is uint8_t. I
think it would be better to use the same type here and also as a
parameter to xen_register_ioreq in QEMU



>      /*
>       * Each implementation can optionally enable features that it
>       * supports and are known to work.
> -- 
> 2.43.0
> 

