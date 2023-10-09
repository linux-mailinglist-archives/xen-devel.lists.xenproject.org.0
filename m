Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34BC7BEF60
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 01:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614494.955600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq02b-0008H1-Ks; Mon, 09 Oct 2023 23:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614494.955600; Mon, 09 Oct 2023 23:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq02b-0008Df-Hs; Mon, 09 Oct 2023 23:52:01 +0000
Received: by outflank-mailman (input) for mailman id 614494;
 Mon, 09 Oct 2023 23:52:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RedC=FX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq02a-0008DZ-B2
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 23:52:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d51a086e-66fe-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 01:51:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5BCBC61333;
 Mon,  9 Oct 2023 23:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715B3C433C8;
 Mon,  9 Oct 2023 23:51:55 +0000 (UTC)
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
X-Inumbo-ID: d51a086e-66fe-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696895517;
	bh=0t9mc7kq38natk9LCJNhC7Fgb6FB3ybv005st60Nd/4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JVXKbXRclAx2DSQwG49RBnhRaeFahGuO804b+nqtMIEcfAkfbQh2U7RKs+0YVzQOV
	 XllB/ITyIKmrCKgpWv9B55cYwHc70HMZEUiXAZafo/tHTrdvARsGbvtpXmR5+MhBc4
	 qCHcFK86HjIxAADfOT5CmSvVYsJZnRm9p3faACmwHmzYBh+plA5Jdoj7HObKKrE0ET
	 tgo7Uj4MSzv9NnfT4c0U5ulNlEczcPLxq7tETMOTbXNszsHcyIA2ZvURpgXQTv6yAO
	 P4ox/20EF65hW7zRDIztuocjMvH9y5i9YU8sQY68PsflL4/QKiKd/z8wVMAbNU/AcJ
	 hYNk1tuGWksIA==
Date: Mon, 9 Oct 2023 16:51:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, 
    Juergen Gross <jgross@suse.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCH v1 1/7] xen: when unplugging emulated devices skip
 virtio devices
In-Reply-To: <20231005181629.4046-2-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2310091651110.3431292@ubuntu-linux-20-04-desktop>
References: <20231005181629.4046-1-vikram.garhwal@amd.com> <20231005181629.4046-2-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Oct 2023, Vikram Garhwal wrote:
> From: Juergen Gross <jgross@suse.com>
> 
> Virtio devices should never be unplugged at boot time, as they are
> similar to pci passthrough devices.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  hw/i386/xen/xen_platform.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 17457ff3de..3560eaf8c8 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -28,6 +28,7 @@
>  #include "hw/ide/pci.h"
>  #include "hw/pci/pci.h"
>  #include "migration/vmstate.h"
> +#include "hw/virtio/virtio-bus.h"
>  #include "net/net.h"
>  #include "trace.h"
>  #include "sysemu/xen.h"
> @@ -132,7 +133,8 @@ static void unplug_nic(PCIBus *b, PCIDevice *d, void *o)
>      /* We have to ignore passthrough devices */
>      if (pci_get_word(d->config + PCI_CLASS_DEVICE) ==
>              PCI_CLASS_NETWORK_ETHERNET
> -            && !pci_device_is_passthrough(d)) {
> +            && !pci_device_is_passthrough(d)
> +            && !qdev_get_child_bus(&d->qdev, TYPE_VIRTIO_BUS)) {

Please update the in-code comment above to say "ignore passthrough
devices and virtio devices"


>          object_unparent(OBJECT(d));
>      }
>  }
> @@ -208,6 +210,10 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
>      /* We have to ignore passthrough devices */
>      if (pci_device_is_passthrough(d))
>          return;
> +    /* Ignore virtio devices */
> +    if (qdev_get_child_bus(&d->qdev, TYPE_VIRTIO_BUS)) {
> +        return;
> +    }
>  
>      switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
>      case PCI_CLASS_STORAGE_IDE:
> -- 
> 2.17.1
> 

