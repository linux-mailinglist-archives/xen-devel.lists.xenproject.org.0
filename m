Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981F9270261
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 18:40:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJJPs-0005Ju-BA; Fri, 18 Sep 2020 16:39:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tw/n=C3=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kJJPq-0005Jo-QZ
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 16:39:18 +0000
X-Inumbo-ID: cc4dfd22-8cba-47e9-ac3a-c7e5262395d2
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc4dfd22-8cba-47e9-ac3a-c7e5262395d2;
 Fri, 18 Sep 2020 16:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
 Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=QXyARmRIv4kD5vNVLTY7d7vl5qJYInV/B+OFT821nj8=; b=0gbEdmNYTXEYMflUNQ0oGOsOLW
 vEehMFHBrJfryVQz3kpbfPaTJP0FSZPlFRtpFIBU+Jzno/BbZ9us1hL28AD2GE4ZgpOLH1vj106jR
 +NbuJ+OiIhITigsBtoA7A8tbJvq4CIvCd2C4o4QBVfzy27ocBDDmIAuMhRa/z5vpuVCU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kJJPo-00036B-Tw
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 16:39:16 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kJJPo-0005xS-TK
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 16:39:16 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kJJPf-0000XE-Kr; Fri, 18 Sep 2020 17:39:07 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24420.58027.291045.507128@mariner.uk.xensource.com>
Date: Fri, 18 Sep 2020 17:39:07 +0100
To: Debian folks: Michael Tokarev <mjt@tls.msk.ru>,
 Hans van Kranenburg <hans@knorrie.org>;,
 Xen upstream folks with an interest: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>;,
CC: pkg-xen-devel@lists.alioth.debian.org, xen-devel@lists.xenproject.org,
 My Xen upstream tools co-maintainer: Wei Liu <wl@xen.org>;
Subject: RFC: qemu and Xen ABI-unstable libs
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all.  Michael Tokarev has been looking into the problem that qemu
is using Xen libraries with usntable ABIs.  We did an experiment to
see which abi-unstable symbols qemu links to, by suppressing libxc
from the link line.  The results are below.[1]

Things are not looking too bad.  After some discussion on #xendevel I
have tried to summarise the situation for each of the troublesome
symbols.

Also, we discovered that upstream qemu does not link against any
abi-unstable Xen libraries if PCI passthrough is disabled.

Please would my Xen colleages correct me if I have made any mistakes.
Michael, I hope this is helpful and clear.


In order from easy to hard:


xc_domain_shutdown

This call in qemu needs to be replaced with a call to the existing
function xendevicemodel_shutdown in libxendevicemodel.  I think it is
likely that this call is fixed in qemu upstream.


xc_get_hvm_param

There are three references in qemu's
xen_get_default_ioreq_server_info, relating to ioreq servers.  These
uses (and perhaps surrounding code at this function's call site)
should be replaced by use of xendevicemodel_create_ioreq_server
etc. from libxendevicemodel.  I think it is likely that this call is
fixed in qemu upstream.


xc_physdev_map_pirq
xc_physdev_map_pirq_msi
xc_physdev_unmap_pirq

These are all small wrappers for the PHYSDEVOP_map_pirq hypercall.
PHYSDEVOP is already reasonably abi-stable at the hypervisor level (in
theory it's versioned, but changing it would break all dom0's).
These calls could just be provided as-is by a new stable abi
entrypoint.  We think this should probably go in libxendevicemodel.

So, what's needed is to make Xen upstream change to add versions of
these three functions to tools/libs/devicemodel.  Change qemu to use
them.


xc_domain_iomem_permission
xc_domain_populate_physmap_exact
xc_domain_ioport_mapping
xc_domain_memory_mapping

The things done by these calls in qemu should be done by the Xen
toolstack (libxl), during domain creation etc., instead.

For at least some of them, there are patches on xen-devel, see
  From: Grzegorz Uriasz <gorbak25@gmail.com>
  Subject: [PATCH 1/3] tools/libxl: Grant VGA IO port permission for
   stubdom/target domain
  Date: Sun, 14 Jun 2020 23:12:01 +0100
et seq.  These patches have been reviewed and as far as I can tell
from the thread we are awaiting a resend.


xc_set_hvm_param

Two calls both relating to HVM_PARAM_ACPI_S_STATE.

These need to be turned into DMOP hypercalls (ie, new hypercalls added
to the hypervisor) and entrypoints provided in libxendevicemodel.


xc_domain_bind_pt_pci_irq
xc_domain_unbind_msi_irq
xc_domain_unbind_pt_irq
xc_domain_update_msi_irq

These are currently XEN_DOMCTL_* hypercalls.  These do not have a
stable ABI at the hypervisor interface.  AIUI Xen hypervisor folks
think they should be changed to use the DMOP or PHYSDEVOP hypercalls.

Additionally, we need calls for these in a userspace library with a
stable ABI.  We think that should be libxendevicemodel.

I think the userspace library part can go ahead right away: we can
change the implementation to use DMOP when the hypervisor work is
done.  In the meantime, the library would have a stable ABI for
callers, but the implementation would be tied to the hypervisor ABI.


xc_interface_close
xc_interface_open

When everything else is done, these calls will no longer be needed
because nothing will use the xc handle.

Ian.


[1]

/usr/bin/ld: accel/xen/xen-all.o: in function `xen_init':
/build/qemu/debian-qemu/accel/xen/xen-all.c:160: undefined reference to `xc_interface_open'
/usr/bin/ld: /build/qemu/debian-qemu/accel/xen/xen-all.c:175: undefined reference to `xc_interface_close'
/usr/bin/ld: /build/qemu/debian-qemu/accel/xen/xen-all.c:168: undefined reference to `xc_interface_close'
/usr/bin/ld: hw/xen/xen_pt.o: in function `xen_pt_destroy':
/build/qemu/debian-qemu/hw/xen/xen_pt.c:725: undefined reference to `xc_domain_unbind_pt_irq'
/usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt.c:751: undefined reference to `xc_physdev_unmap_pirq'
/usr/bin/ld: hw/xen/xen_pt.o: in function `xen_pt_realize':
/build/qemu/debian-qemu/hw/xen/xen_pt.c:866: undefined reference to `xc_physdev_map_pirq'
/usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt.c:885: undefined reference to `xc_domain_bind_pt_pci_irq'
/usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt.c:898: undefined reference to `xc_physdev_unmap_pirq'
/usr/bin/ld: hw/xen/xen_pt.o: in function `xen_pt_region_update':
/build/qemu/debian-qemu/hw/xen/xen_pt.c:631: undefined reference to `xc_domain_ioport_mapping'
/usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt.c:643: undefined reference to `xc_domain_memory_mapping'
/usr/bin/ld: hw/xen/xen_pt_graphics.o: in function `xen_pt_register_vga_regions':
/build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:68: undefined reference to `xc_domain_memory_mapping'
/usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:63: undefined reference to `xc_domain_ioport_mapping'
/usr/bin/ld: hw/xen/xen_pt_graphics.o: in function `xen_pt_unregister_vga_regions':
/build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:104: undefined reference to `xc_domain_memory_mapping'
/usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:99: undefined reference to `xc_domain_ioport_mapping'
/usr/bin/ld: hw/xen/xen_pt_graphics.o: in function `igd_write_opregion':
/build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:260: undefined reference to `xc_domain_iomem_permission'
/usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:273: undefined reference to `xc_domain_memory_mapping'
/usr/bin/ld: hw/xen/xen_pt_graphics.o: in function `xen_pt_unregister_vga_regions':
/build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:119: undefined reference to `xc_domain_memory_mapping'
/usr/bin/ld: hw/xen/xen_pt_msi.o: in function `msi_msix_disable':
/build/qemu/debian-qemu/hw/xen/xen_pt_msi.c:213: undefined reference to `xc_domain_unbind_msi_irq'
/usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt_msi.c:222: undefined reference to `xc_physdev_unmap_pirq'
/usr/bin/ld: hw/xen/xen_pt_msi.o: in function `msi_msix_setup':
/build/qemu/debian-qemu/hw/xen/xen_pt_msi.c:138: undefined reference to `xc_physdev_map_pirq_msi'
/usr/bin/ld: hw/xen/xen_pt_msi.o: in function `msi_msix_update':
/build/qemu/debian-qemu/hw/xen/xen_pt_msi.c:178: undefined reference to `xc_domain_update_msi_irq'
/usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt_msi.c:185: undefined reference to `xc_physdev_unmap_pirq'
/usr/bin/ld: hw/xen/xen_pt_msi.o: in function `xen_pt_msix_update_remap':
/build/qemu/debian-qemu/hw/xen/xen_pt_msi.c:415: undefined reference to `xc_domain_unbind_pt_irq'
/usr/bin/ld: hw/i386/xen/xen-hvm.o: in function `xen_ram_alloc':
/build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:290: undefined reference to `xc_domain_populate_physmap_exact'
/usr/bin/ld: hw/i386/xen/xen-hvm.o: in function `xen_get_default_ioreq_server_info':
/build/qemu/debian-qemu/include/hw/xen/xen_common.h:395: undefined reference to `xc_get_hvm_param'
/usr/bin/ld: /build/qemu/debian-qemu/include/hw/xen/xen_common.h:403: undefined reference to `xc_get_hvm_param'
/usr/bin/ld: /build/qemu/debian-qemu/include/hw/xen/xen_common.h:411: undefined reference to `xc_get_hvm_param'
/usr/bin/ld: hw/i386/xen/xen-hvm.o: in function `destroy_hvm_domain':
/build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:1551: undefined reference to `xc_interface_open'
/usr/bin/ld: /build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:1555: undefined reference to `xc_domain_shutdown'
/usr/bin/ld: hw/i386/xen/xen-hvm.o: in function `xen_wakeup_notifier':
/build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:1317: undefined reference to `xc_set_hvm_param'
/usr/bin/ld: hw/i386/xen/xen-hvm.o: in function `xen_suspend_notifier':
/build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:183: undefined reference to `xc_set_hvm_param'
/usr/bin/ld: hw/i386/xen/xen-hvm.o: in function `destroy_hvm_domain':
/build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:1564: undefined reference to `xc_interface_close'
/usr/bin/ld: /build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:1564: undefined reference to `xc_interface_close'
collect2: error: ld returned 1 exit status


List:
xc_domain_bind_pt_pci_irq
xc_domain_iomem_permission
xc_domain_ioport_mapping
xc_domain_memory_mapping
xc_domain_populate_physmap_exact
xc_domain_shutdown
xc_domain_unbind_msi_irq
xc_domain_unbind_pt_irq
xc_domain_update_msi_irq
xc_get_hvm_param
xc_interface_close
xc_interface_open
xc_physdev_map_pirq
xc_physdev_map_pirq_msi
xc_physdev_unmap_pirq
xc_set_hvm_param



