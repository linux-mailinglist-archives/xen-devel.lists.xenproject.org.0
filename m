Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409596AF007
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 19:28:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507779.781792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc20-00030a-1D; Tue, 07 Mar 2023 18:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507779.781792; Tue, 07 Mar 2023 18:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc1z-0002r1-Nm; Tue, 07 Mar 2023 18:27:23 +0000
Received: by outflank-mailman (input) for mailman id 507779;
 Tue, 07 Mar 2023 18:27:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tG96=67=desiato.srs.infradead.org=BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZc1y-0002MP-62
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 18:27:22 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b11bfeee-bd15-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 19:27:18 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pZc1m-00H8T0-30; Tue, 07 Mar 2023 18:27:11 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZc1m-009e87-2N; Tue, 07 Mar 2023 18:27:10 +0000
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
X-Inumbo-ID: b11bfeee-bd15-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=IaNafSRjao+HaQw+ELYtYhkTBjvlc263O8BCVna3wJQ=; b=AqDQak70zR9wTipkqxullPY4kX
	ZoGJ6bhYui0ncHAA5WTJ6IF2bEtLU3hiavoVEzGKJBVrlYa5rYIOE4CgdTzrlitaLDwvSOLzjPOEv
	1fe0qLcdks+wXeorcMBrIKW+eLT+49EPPnnhek5q7IN0NJ+rPxNCzUOnlvows0yrZLRUKwBwlB7V/
	NUGykSofL946Crl6ODSdlGzB81/sQEgK4yCfSIm9454Br/+ECWLxg8MBLHrKWZ7zR9lirgZlIfw+6
	NipmUli0AZB93LBghuS1GB6223Ehwpxe2bvIpI7fN9Im22Ui4X13fvgGWErxDHwu+1EgrHE9z6Ra4
	IV/F7Y4w==;
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 00/27] Enable PV backends with Xen/KVM emulation
Date: Tue,  7 Mar 2023 18:26:40 +0000
Message-Id: <20230307182707.2298618-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:

  Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)

are available in the Git repository at:

  git://git.infradead.org/users/dwmw2/qemu.git refs/tags/xenfv-2 

for you to fetch changes up to 154eac37190c4d80d29b09c226abd899e397530f:

  docs: Update Xen-on-KVM documentation for PV disk support (2023-03-07 17:04:30 +0000)


Tested-by: Paul Durrant <paul@xen.org>
... on real Xen (master branch, 4.18) with a Debian guest.

----------------------------------------------------------------
David Woodhouse (23):
      hw/xen: Add xenstore wire implementation and implementation stubs
      hw/xen: Add basic XenStore tree walk and write/read/directory support
      hw/xen: Implement XenStore watches
      hw/xen: Implement XenStore transactions
      hw/xen: Watches on XenStore transactions
      hw/xen: Implement core serialize/deserialize methods for xenstore_impl
      hw/xen: Add evtchn operations to allow redirection to internal emulation
      hw/xen: Add gnttab operations to allow redirection to internal emulation
      hw/xen: Pass grant ref to gnttab unmap operation
      hw/xen: Add foreignmem operations to allow redirection to internal emulation
      hw/xen: Move xenstore_store_pv_console_info to xen_console.c
      hw/xen: Use XEN_PAGE_SIZE in PV backend drivers
      hw/xen: Rename xen_common.h to xen_native.h
      hw/xen: Build PV backend drivers for CONFIG_XEN_BUS
      hw/xen: Only advertise ring-page-order for xen-block if gnttab supports it
      hw/xen: Hook up emulated implementation for event channel operations
      hw/xen: Add emulated implementation of grant table operations
      hw/xen: Add emulated implementation of XenStore operations
      hw/xen: Map guest XENSTORE_PFN grant in emulated Xenstore
      hw/xen: Implement soft reset for emulated gnttab
      i386/xen: Initialize Xen backends from pc_basic_device_init() for emulation
      MAINTAINERS: Add entry for Xen on KVM emulation
      docs: Update Xen-on-KVM documentation for PV disk support

Paul Durrant (4):
      hw/xen: Implement XenStore permissions
      hw/xen: Create initial XenStore nodes
      hw/xen: Add xenstore operations to allow redirection to internal emulation
      hw/xen: Avoid crash when backend watch fires too early

 MAINTAINERS                                   |    9 +
 accel/xen/xen-all.c                           |   69 +-
 docs/system/i386/xen.rst                      |   30 +-
 hw/9pfs/meson.build                           |    2 +-
 hw/9pfs/xen-9p-backend.c                      |   32 +-
 hw/block/dataplane/meson.build                |    2 +-
 hw/block/dataplane/xen-block.c                |   12 +-
 hw/block/meson.build                          |    2 +-
 hw/block/xen-block.c                          |   12 +-
 hw/char/meson.build                           |    2 +-
 hw/char/xen_console.c                         |   57 +-
 hw/display/meson.build                        |    2 +-
 hw/display/xenfb.c                            |   32 +-
 hw/i386/kvm/meson.build                       |    1 +
 hw/i386/kvm/trace-events                      |   15 +
 hw/i386/kvm/xen_evtchn.c                      |   15 +
 hw/i386/kvm/xen_gnttab.c                      |  325 ++++-
 hw/i386/kvm/xen_gnttab.h                      |    1 +
 hw/i386/kvm/xen_xenstore.c                    | 1251 +++++++++++++++-
 hw/i386/kvm/xenstore_impl.c                   | 1927 +++++++++++++++++++++++++
 hw/i386/kvm/xenstore_impl.h                   |   63 +
 hw/i386/pc.c                                  |    7 +
 hw/i386/pc_piix.c                             |    4 +-
 hw/i386/xen/xen-hvm.c                         |   38 +-
 hw/i386/xen/xen-mapcache.c                    |    2 +-
 hw/i386/xen/xen_platform.c                    |    7 +-
 hw/net/xen_nic.c                              |   25 +-
 hw/usb/meson.build                            |    2 +-
 hw/usb/xen-usb.c                              |   29 +-
 hw/xen/meson.build                            |    6 +-
 hw/xen/trace-events                           |    2 +-
 hw/xen/xen-bus-helper.c                       |   62 +-
 hw/xen/xen-bus.c                              |  411 +-----
 hw/xen/xen-legacy-backend.c                   |  254 +---
 hw/xen/xen-operations.c                       |  478 ++++++
 hw/xen/xen_devconfig.c                        |    4 +-
 hw/xen/xen_pt.c                               |    2 +-
 hw/xen/xen_pt.h                               |    2 +-
 hw/xen/xen_pt_config_init.c                   |    2 +-
 hw/xen/xen_pt_graphics.c                      |    1 -
 hw/xen/xen_pt_msi.c                           |    4 +-
 hw/xen/xen_pvdev.c                            |   63 +-
 include/hw/xen/xen-bus-helper.h               |   26 +-
 include/hw/xen/xen-bus.h                      |   21 +-
 include/hw/xen/xen-legacy-backend.h           |   24 +-
 include/hw/xen/xen.h                          |   24 +-
 include/hw/xen/xen_backend_ops.h              |  408 ++++++
 include/hw/xen/{xen_common.h => xen_native.h} |   75 +-
 include/hw/xen/xen_pvdev.h                    |    6 +-
 softmmu/globals.c                             |    4 +
 target/i386/kvm/xen-emu.c                     |    5 +
 tests/unit/meson.build                        |    1 +
 tests/unit/test-xs-node.c                     |  871 +++++++++++
 53 files changed, 5804 insertions(+), 927 deletions(-)
 create mode 100644 hw/i386/kvm/xenstore_impl.c
 create mode 100644 hw/i386/kvm/xenstore_impl.h
 create mode 100644 hw/xen/xen-operations.c
 create mode 100644 include/hw/xen/xen_backend_ops.h
 rename include/hw/xen/{xen_common.h => xen_native.h} (89%)
 create mode 100644 tests/unit/test-xs-node.c



