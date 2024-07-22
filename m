Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE85939597
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 23:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762440.1172609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0jv-0004mF-8H; Mon, 22 Jul 2024 21:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762440.1172609; Mon, 22 Jul 2024 21:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0jv-0004kI-5W; Mon, 22 Jul 2024 21:38:39 +0000
Received: by outflank-mailman (input) for mailman id 762440;
 Mon, 22 Jul 2024 21:38:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z3Fi=OW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sW0jt-0004aQ-CV
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 21:38:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf72c1dc-4872-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 23:38:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3818B60347;
 Mon, 22 Jul 2024 21:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468A4C116B1;
 Mon, 22 Jul 2024 21:38:32 +0000 (UTC)
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
X-Inumbo-ID: bf72c1dc-4872-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721684313;
	bh=tXQrIb3VEeHB3STEH5LnCuga4yuSW0LDWlS7Ce5x9EM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KGRTwxXkBmT/2FxHqzLl+jKrJdETyZShq9CcBbJmWDE06WUvsWXDKLFOQL0Y9zKWn
	 8QzRJGFFrts1nDbvCda/MkohOSHICg9lQ+z8vJRPbBWnAjtvbgR3Wxy8dGSyD6onHI
	 TrTCEw/8iXTK5MRJ7oSVqJnQ2+usG2DJc2lrOHJGb+zZ0cCFPRUcjKzXaxyYmdkJRA
	 LoQq25g7y+bAGNFK5vxF+gewCSxdTV+jp/5HE4ghw3SmM6jxd0fo/sDN684+x2AaSd
	 xHbBSQtMX+Q/IR3ijaJavsBQu4OSnnEb/f4EdrBt5BkSuXJmEetSUanwBSzxpKs4Lj
	 BbJpalRTCMkrQ==
Date: Mon, 22 Jul 2024 14:38:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Huang Rui <ray.huang@amd.com>
Subject: Re: [XEN PATCH v12 3/7] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
In-Reply-To: <20240708114124.407797-4-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2407221438230.4857@ubuntu-linux-20-04-desktop>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com> <20240708114124.407797-4-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Jul 2024, Jiqian Chen wrote:
> The gsi of a passthrough device must be configured for it to be
> able to be mapped into a hvm domU.
> But When dom0 is PVH, the gsis may not get registered(see below
> clarification), it causes the info of apic, pin and irq not be
> added into irq_2_pin list, and the handler of irq_desc is not set,
> then when passthrough a device, setting ioapic affinity and vector
> will fail.
> 
> To fix above problem, on Linux kernel side, a new code will
> need to call PHYSDEVOP_setup_gsi for passthrough devices to
> register gsi when dom0 is PVH.
> 
> So, add PHYSDEVOP_setup_gsi into hvm_physdev_op for above
> purpose.
> 
> Clarify two questions:
> First, why the gsi of devices belong to PVH dom0 can work?
> Because when probe a driver to a normal device, it uses the normal
> probe function of pci device, in its callstack, it requests irq
> and unmask corresponding ioapic of gsi, then trap into xen and
> register gsi finally.
> Callstack is(on linux kernel side) pci_device_probe->
> request_threaded_irq-> irq_startup-> __unmask_ioapic->
> io_apic_write, then trap into xen hvmemul_do_io->
> hvm_io_intercept-> hvm_process_io_intercept->
> vioapic_write_indirect-> vioapic_hwdom_map_gsi-> mp_register_gsi.
> So that the gsi can be registered.
> 
> Second, why the gsi of passthrough device can't work when dom0
> is PVH?
> Because when assign a device to passthrough, it uses the specific
> probe function of pciback, in its callstack, it doesn't install a
> fake irq handler due to the ISR is not running. So that
> mp_register_gsi on Xen side is never called, then the gsi is not
> registered.
> Callstack is(on linux kernel side) pcistub_probe->pcistub_seize->
> pcistub_init_device-> xen_pcibk_reset_device->
> xen_pcibk_control_isr->isr_on==0.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/hvm/hypercall.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 03ada3c880bd..cfe82d0f96ed 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -86,6 +86,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>              return -ENOSYS;
>          break;
>  
> +    case PHYSDEVOP_setup_gsi:
>      case PHYSDEVOP_pci_mmcfg_reserved:
>      case PHYSDEVOP_pci_device_add:
>      case PHYSDEVOP_pci_device_remove:
> -- 
> 2.34.1
> 

