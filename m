Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711E723C22F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 01:23:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k36H5-0001pQ-Uh; Tue, 04 Aug 2020 23:23:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k36H4-0001oA-F6
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 23:23:14 +0000
X-Inumbo-ID: 0df81675-9523-43c0-b1ac-bd6fd599ce42
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0df81675-9523-43c0-b1ac-bd6fd599ce42;
 Tue, 04 Aug 2020 23:23:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09CCA2073E;
 Tue,  4 Aug 2020 23:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596583393;
 bh=VhaC1sGLgYUZcmdAf8S9RVBpxG95QFFD7HAMearY5OA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=os4+pSx8KfmCnGijhrrvFmi1ftSEk3edYgtSTnDIlUm/EC4ZOhmEoCTyXAkE5gDuJ
 Dncivx6CK34UgLKqHpjB4vXa+e/7pfEXTZ8aUmrlpTp8hwBHzb8rIRApDcFfDb0sln
 Pg71iVRnrFt0UHkRvoxtKHqGMWGm4/jLiKi4rvKQ=
Date: Tue, 4 Aug 2020 16:23:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [RFC PATCH V1 10/12] libxl: Add support for virtio-disk
 configuration
In-Reply-To: <1596478888-23030-11-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2008041601420.5748@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-11-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch adds basic support for configuring and assisting virtio-disk
> backend (emualator) which is intended to run out of Qemu and could be run
> in any domain.
> 
> Xenstore was chosen as a communication interface for the emulator running
> in non-toolstack domain to be able to get configuration either by reading
> Xenstore directly or by receiving command line parameters (an updated 'xl devd'
> running in the same domain would read Xenstore beforehand and call backend
> executable with the required arguments).
> 
> An example of domain configuration (two disks are assigned to the guest,
> the latter is in readonly mode):
> 
> vdisk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3;ro:/dev/mmcblk1p3' ]
> 
> Where per-disk Xenstore entries are:
> - filename and readonly flag (configured via "vdisk" property)
> - base and irq (allocated dynamically)
> 
> Besides handling 'visible' params described in configuration file,
> patch also allocates virtio-mmio specific ones for each device and
> writes them into Xenstore. virtio-mmio params (irq and base) are
> unique per guest domain, they allocated at the domain creation time
> and passed through to the emulator. Each VirtIO device has at least
> one pair of these params.
> 
> TODO:
> 1. An extra "virtio" property could be removed.
> 2. Update documentation.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  tools/libxl/Makefile                 |   4 +-
>  tools/libxl/libxl_arm.c              |  63 +++++++++++++++----
>  tools/libxl/libxl_create.c           |   1 +
>  tools/libxl/libxl_internal.h         |   1 +
>  tools/libxl/libxl_types.idl          |  15 +++++
>  tools/libxl/libxl_types_internal.idl |   1 +
>  tools/libxl/libxl_virtio_disk.c      | 109 +++++++++++++++++++++++++++++++++
>  tools/xl/Makefile                    |   2 +-
>  tools/xl/xl.h                        |   3 +
>  tools/xl/xl_cmdtable.c               |  15 +++++
>  tools/xl/xl_parse.c                  | 115 +++++++++++++++++++++++++++++++++++
>  tools/xl/xl_virtio_disk.c            |  46 ++++++++++++++
>  12 files changed, 360 insertions(+), 15 deletions(-)
>  create mode 100644 tools/libxl/libxl_virtio_disk.c
>  create mode 100644 tools/xl/xl_virtio_disk.c
> 
> diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
> index 38cd43a..df94b13 100644
> --- a/tools/libxl/Makefile
> +++ b/tools/libxl/Makefile
> @@ -141,7 +141,9 @@ LIBXL_OBJS = flexarray.o libxl.o libxl_create.o libxl_dm.o libxl_pci.o \
>  			libxl_vtpm.o libxl_nic.o libxl_disk.o libxl_console.o \
>  			libxl_cpupool.o libxl_mem.o libxl_sched.o libxl_tmem.o \
>  			libxl_9pfs.o libxl_domain.o libxl_vdispl.o \
> -			libxl_pvcalls.o libxl_vsnd.o libxl_vkb.o $(LIBXL_OBJS-y)
> +			libxl_pvcalls.o libxl_vsnd.o libxl_vkb.o \
> +			libxl_virtio_disk.o $(LIBXL_OBJS-y)
> +
>  LIBXL_OBJS += libxl_genid.o
>  LIBXL_OBJS += _libxl_types.o libxl_flask.o _libxl_types_internal.o
>  
> diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
> index 4f748e3..469a8b0 100644
> --- a/tools/libxl/libxl_arm.c
> +++ b/tools/libxl/libxl_arm.c
> @@ -13,6 +13,12 @@
>  #define GUEST_VIRTIO_MMIO_SIZE  xen_mk_ullong(0x200)
>  #define GUEST_VIRTIO_MMIO_SPI   33
>  
> +#ifndef container_of
> +#define container_of(ptr, type, member) ({			\
> +        typeof( ((type *)0)->member ) *__mptr = (ptr);	\
> +        (type *)( (char *)__mptr - offsetof(type,member) );})
> +#endif
> +
>  static const char *gicv_to_string(libxl_gic_version gic_version)
>  {
>      switch (gic_version) {
> @@ -44,14 +50,32 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          vuart_enabled = true;
>      }
>  
> -    /*
> -     * XXX: Handle properly virtio
> -     * A proper solution would be the toolstack to allocate the interrupts
> -     * used by each virtio backend and let the backend now which one is used
> -     */
>      if (libxl_defbool_val(d_config->b_info.arch_arm.virtio)) {
> -        nr_spis += (GUEST_VIRTIO_MMIO_SPI - 32) + 1;
> +        uint64_t virtio_base;
> +        libxl_device_virtio_disk *virtio_disk;
> +
> +        virtio_base = GUEST_VIRTIO_MMIO_BASE;
>          virtio_irq = GUEST_VIRTIO_MMIO_SPI;
> +
> +        if (!d_config->num_virtio_disks) {
> +            LOG(ERROR, "Virtio is enabled, but no Virtio devices present\n");
> +            return ERROR_FAIL;
> +        }
> +        virtio_disk = &d_config->virtio_disks[0];
> +
> +        for (i = 0; i < virtio_disk->num_disks; i++) {
> +            virtio_disk->disks[i].base = virtio_base;
> +            virtio_disk->disks[i].irq = virtio_irq;
> +
> +            LOG(DEBUG, "Allocate Virtio MMIO params: IRQ %u BASE 0x%"PRIx64,
> +                virtio_irq, virtio_base);
> +
> +            virtio_irq ++;
> +            virtio_base += GUEST_VIRTIO_MMIO_SIZE;
> +        }
> +        virtio_irq --;
> +
> +        nr_spis += (virtio_irq - 32) + 1;

It looks like it is an interrupt per device, which could lead to quite a
few of them being allocated.

The issue is that today we don't really handle virtual interrupts
different from physical interrupts in Xen. So, if we end up allocating
let's say 6 virtio interrupts for a domain, the chance of a clash with a
physical interrupt of a passthrough device is real.

I am not entirely sure how to solve it, but these are a few ideas:
- choosing virtio interrupts that are less likely to conflict (maybe >
  1000)
- make the virtio irq (optionally) configurable so that a user could
  override the default irq and specify one that doesn't conflict
- implementing support for virq != pirq (even the xl interface doesn't
  allow to specify the virq number for passthrough devices, see "irqs")

