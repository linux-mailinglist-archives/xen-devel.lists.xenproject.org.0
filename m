Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7022F674E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 18:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67457.120443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l06It-0002De-4F; Thu, 14 Jan 2021 17:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67457.120443; Thu, 14 Jan 2021 17:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l06It-0002D9-0J; Thu, 14 Jan 2021 17:20:59 +0000
Received: by outflank-mailman (input) for mailman id 67457;
 Thu, 14 Jan 2021 17:20:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l06Ir-0002Ch-5t
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 17:20:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l06Ir-0000fw-0o
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 17:20:57 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l06Iq-0005zh-Vg
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 17:20:56 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l06In-0004aQ-QD; Thu, 14 Jan 2021 17:20:53 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=smwiAjnlG8E47Qs1vWUNk7p0sOk9ND71kU6uYn/MJRE=; b=oeqeZpLtDUWvv/eCanAy7H34KH
	2BdGqzHzmFr9yXoLn0rSVJPsz/zNiRyzYwVhK6D6LeuDJ6lXNlm6CK91ZdmPghz+f6z2E56GmjC3Q
	0D2bHKlYMyzW9uzsdjYkiMUhAFhaJ+IfHl/5hYdsMsy8SalequHAD3zcSTfy1Faqt6Wo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24576.32117.495663.489430@mariner.uk.xensource.com>
Date: Thu, 14 Jan 2021 17:20:53 +0000
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH V4 24/24] [RFC] libxl: Add support for virtio-disk configuration
In-Reply-To: <1610488352-18494-25-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
	<1610488352-18494-25-git-send-email-olekstysh@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Oleksandr Tyshchenko writes ("[PATCH V4 24/24] [RFC] libxl: Add support for virtio-disk configuration"):
> This patch adds basic support for configuring and assisting virtio-disk
> backend (emualator) which is intended to run out of Qemu and could be run
> in any domain.

Thanks.  I think this is a very important feature.  But I think this
part at least needs some work.  (That's not inappropriate for an RFC
patch - so please don't feel you have done anything wrong.  I hope you
will find my comments constructive.)


> An example of domain configuration (two disks are assigned to the guest,
> the latter is in readonly mode):
> 
> vdisk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3;ro:/dev/mmcblk1p3' ]

I can see why you have done it like this but I am concerned that this
is not well-integrated with the existing disk configuration system.

As a result not only is your new feature lacking support for many
existing libxl features (block backend scripts, cdroms tagged as such,
non-raw formats) that could otherwise be made available, but I think
adding them later would be quite awkward.

I it would be better to reuse (and, if necessary, adapt) the existing
disk parsing logic in libxl, so that the syntax for your new vdisks =
[...] parameter is the same as for the existing disks.  Or even
better, simply make your new kind of disk a new flag on the existing
disk structure.

> Also there is one suggestion from Wei Chen regarding a parameter for
> domain config file which I haven't addressed yet.
> [Just copy here what Wei said in V2 thread]
> Can we keep use the same 'disk' parameter for virtio-disk, but add
> an option like "model=virtio-disk"?
> For example:
> disk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3,model=virtio-disk' ]
> Just like what Xen has done for x86 virtio-net.

This is the same suggestion I make above, basically.  It would be much
better, yes.


> Xenstore was chosen as a communication interface for the emulator
> running in non-toolstack domain to be able to get configuration
> either by reading Xenstore directly or by receiving command line
> parameters (an updated 'xl devd' running in the same domain would
> read Xenstore beforehand and call backend executable with the
> required arguments).

I was surprised to read this because I would expect that qemu upstream
would be resistant to this approach.  As far as the Xen Project's
point of view goes, I think using xenstore for this is fine, but we
would definitely want the support in upstream qemu.

Can you please explain the status of the corresponding qemu feature ?
(Ideally, in a formal way in the commit message.)

> Please note, there is a real concern about VirtIO interrupts allocation.
> [Just copy here what Stefano said in RFC thread]
> 
> So, if we end up allocating let's say 6 virtio interrupts for a
> domain, the chance of a clash with a physical interrupt of a
> passthrough device is real.
> 
> I am not entirely sure how to solve it, but these are a few ideas:
> - choosing virtio interrupts that are less likely to conflict (maybe > 1000)
> - make the virtio irq (optionally) configurable so that a user could
>   override the default irq and specify one that doesn't conflict
> - implementing support for virq != pirq (even the xl interface doesn't
>   allow to specify the virq number for passthrough devices, see "irqs")

I think here you have chosen to make the interupt configurable ?

The implications are that a someone using this with passthrough would
have to choose non-clashing IRQs ?  In the non-passthrough case (ie, a
guest with no passthrough devices), can your code choose an
appropriate IRQ, if the user doesn't specify one ?


I don't see any changes to the xl documentation in this patch.  That
would be the place to explain the irq stuff, and would be needed
anyway.  Indeed with anything substantial like your proposal, it is
often a good idea to write (at least a sketch of) the documentation
*first*, and then you know what you're aiming to implement.


I have some comments on the code details but I think you will probably
want to focus on the overall approach, first:

> +#ifndef container_of
> +#define container_of(ptr, type, member) ({			\
> +        typeof( ((type *)0)->member ) *__mptr = (ptr);	\
> +        (type *)( (char *)__mptr - offsetof(type,member) );})
> +#endif

Please use the existing CONTAINER_OF which we have already.

>  static const char *gicv_to_string(libxl_gic_version gic_version)
>  {
>      switch (gic_version) {
> @@ -39,14 +45,32 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
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

I would like to see a review of these changes to virtio handling by
someone who understands virtio.

> +static int libxl__device_virtio_disk_setdefault(libxl__gc *gc, uint32_t domid,
> +                                                libxl_device_virtio_disk *virtio_disk,
> +                                                bool hotplug)
> +{
> +    return libxl__resolve_domid(gc, virtio_disk->backend_domname,
> +                                &virtio_disk->backend_domid);

There are some line length problems here.

I haven't reviewed your parsing code because I think this ought to be
done as an option or addition to with the existing disk spec parsing.

> diff --git a/tools/xl/xl_virtio_disk.c b/tools/xl/xl_virtio_disk.c
> new file mode 100644
> index 0000000..808a7da
> --- /dev/null
> +++ b/tools/xl/xl_virtio_disk.c
> @@ -0,0 +1,46 @@
> +/*
> + * Copyright (C) 2020 EPAM Systems Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU Lesser General Public License as published
> + * by the Free Software Foundation; version 2.1 only. with the special
> + * exception on linking described in file LICENSE.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU Lesser General Public License for more details.
> + */
> +
> +#include <stdlib.h>
> +
> +#include <libxl.h>
> +#include <libxl_utils.h>
> +#include <libxlutil.h>
> +
> +#include "xl.h"
> +#include "xl_utils.h"
> +#include "xl_parse.h"
> +
> +int main_virtio_diskattach(int argc, char **argv)
> +{
> +    return 0;
> +}
> +
> +int main_virtio_disklist(int argc, char **argv)
> +{
> +   return 0;
> +}
> +
> +int main_virtio_diskdetach(int argc, char **argv)
> +{
> +    return 0;
> +}

This seems to be a stray early test file left over in the patch ?


Thanks,
Ian.

