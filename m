Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9C88607A2
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 01:26:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684567.1064485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdJOD-0006g5-UC; Fri, 23 Feb 2024 00:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684567.1064485; Fri, 23 Feb 2024 00:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdJOD-0006dc-RX; Fri, 23 Feb 2024 00:26:09 +0000
Received: by outflank-mailman (input) for mailman id 684567;
 Fri, 23 Feb 2024 00:26:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdJOC-0006dW-Eu
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 00:26:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21cbbcea-d1e2-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 01:26:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DFF2A6339A;
 Fri, 23 Feb 2024 00:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8412AC433C7;
 Fri, 23 Feb 2024 00:26:03 +0000 (UTC)
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
X-Inumbo-ID: 21cbbcea-d1e2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708647964;
	bh=S6XLWwOlyw5kVkrghNQ9x3mICtxXeoGmEqulSxH1LPs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=L4qne9PBS9NG8ikgBrkpnxHesLLuFCKpMU/uxjIadOUGu1nxweNwNTc/UJb45QVoa
	 0BEJoxj4wDUrYkMj+Qx1Q59exNDVRQjRdqz3GRn1TRAoTYoNG+Pfhkrl2e3DXNQiDr
	 vVQQ79mADinRLkS9KcUGwcYC+pGU9pHnVekOAxi0J0AKo48CkovTiRq9wJFD54Ql5j
	 UXkqENTUd5tazjvBpKSJNIWG67Ajs9+YCUl4o5CSNAUE2XQ4AwVO1SOYAZV97VT7zn
	 VHfSefBNL1TzL+j9BXg/uWEYMu9pQ305dJlAmtkOiAwp3QngODZ/Aj76PXWWavhxWe
	 AM8AfJk4jggeA==
Date: Thu, 22 Feb 2024 16:26:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org, Huang Rui <Ray.Huang@amd.com>, 
    Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC QEMU PATCH v4 1/1] xen: Use gsi instead of irq for mapping
 pirq
In-Reply-To: <20240105071919.350397-2-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2402221625040.754277@ubuntu-linux-20-04-desktop>
References: <20240105071919.350397-1-Jiqian.Chen@amd.com> <20240105071919.350397-2-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jan 2024, Jiqian Chen wrote:
> In PVH dom0, it uses the linux local interrupt mechanism,
> when it allocs irq for a gsi, it is dynamic, and follow
> the principle of applying first, distributing first. And
> the irq number is alloced from small to large, but the
> applying gsi number is not, may gsi 38 comes before gsi
> 28, that causes the irq number is not equal with the gsi
> number. And when passthrough a device, qemu wants to use
> gsi to map pirq, xen_pt_realize->xc_physdev_map_pirq, but
> the gsi number is got from file
> /sys/bus/pci/devices/<sbdf>/irq in current code, so it
> will fail when mapping.
> 
> Add gsi into XenHostPCIDevice and use gsi number that
> read from gsi sysfs if it exists.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-host-pci-device.c | 7 +++++++
>  hw/xen/xen-host-pci-device.h | 1 +
>  hw/xen/xen_pt.c              | 6 +++++-
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
> index 8c6e9a1716a2..5be3279aa25b 100644
> --- a/hw/xen/xen-host-pci-device.c
> +++ b/hw/xen/xen-host-pci-device.c
> @@ -370,6 +370,13 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
>      }
>      d->irq = v;
>  
> +    xen_host_pci_get_dec_value(d, "gsi", &v, errp);
> +    if (*errp) {
> +        d->gsi = -1;
> +    } else {
> +        d->gsi = v;
> +    }
> +
>      xen_host_pci_get_hex_value(d, "class", &v, errp);
>      if (*errp) {
>          goto error;
> diff --git a/hw/xen/xen-host-pci-device.h b/hw/xen/xen-host-pci-device.h
> index 4d8d34ecb024..74c552bb5548 100644
> --- a/hw/xen/xen-host-pci-device.h
> +++ b/hw/xen/xen-host-pci-device.h
> @@ -27,6 +27,7 @@ typedef struct XenHostPCIDevice {
>      uint16_t device_id;
>      uint32_t class_code;
>      int irq;
> +    int gsi;
>  
>      XenHostPCIIORegion io_regions[PCI_NUM_REGIONS - 1];
>      XenHostPCIIORegion rom;
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 36e6f93c372f..d448f3a17306 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -839,7 +839,11 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>          goto out;
>      }
>  
> -    machine_irq = s->real_device.irq;
> +    if (s->real_device.gsi < 0) {
> +        machine_irq = s->real_device.irq;
> +    } else {
> +        machine_irq = s->real_device.gsi;
> +    }
>      if (machine_irq == 0) {
>          XEN_PT_LOG(d, "machine irq is 0\n");
>          cmd |= PCI_COMMAND_INTX_DISABLE;
> -- 
> 2.34.1
> 

