Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B656A8533
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:35:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505057.777659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxR-0003O5-5K; Thu, 02 Mar 2023 15:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505057.777659; Thu, 02 Mar 2023 15:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxQ-000398-R6; Thu, 02 Mar 2023 15:35:00 +0000
Received: by outflank-mailman (input) for mailman id 505057;
 Thu, 02 Mar 2023 15:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZMsQ=62=desiato.srs.infradead.org=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pXkxM-0001Jw-Md
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:34:56 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2b4ac21-b90f-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 16:34:49 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx4-00FL3l-2U; Thu, 02 Mar 2023 15:34:39 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uzN-29; Thu, 02 Mar 2023 15:34:38 +0000
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
X-Inumbo-ID: c2b4ac21-b90f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=chJB4LTr6zPMlbhOF6PfeBpSzwoNMPhcrFtbZG5ajq4=; b=ZNnYEgUAD8ML+7lcO6KjFLOkLJ
	iM1JOIPzKMyquJ9dpU2yVBq3u2zQi5N5QABGgIIk8HZtsKsBjJVT0e3Kf10ocN3ijXaaVl8nXWWRW
	K0G32lZuLLuP7CZwsoYzA+/mSscBGHUTsmGb+JFNpgem/zot1rFVPEefZh0eF1P0Tv2mRTdlJoBb/
	+oudgciQKCWJNcxTTd1NsaVVVDKGfV6+aR3gTGw7QB1X2GxySRI+XgotRIi1x+PKFPeS5pqVfrCTa
	2GWoZdqPCjFBnCWeqivNzjkt3vYqzYkZJprNnyjFGOFruyZ+XqtY1IG11rx/TTUTuD93sgEBkkDTj
	k2UndtgA==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 17/25] hw/xen: Build PV backend drivers for CONFIG_XEN_BUS
Date: Thu,  2 Mar 2023 15:34:27 +0000
Message-Id: <20230302153435.1170111-18-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Now that we have the redirectable Xen backend operations we can build the
PV backends even without the Xen libraries.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/9pfs/meson.build            | 2 +-
 hw/block/dataplane/meson.build | 2 +-
 hw/block/meson.build           | 2 +-
 hw/char/meson.build            | 2 +-
 hw/display/meson.build         | 2 +-
 hw/usb/meson.build             | 2 +-
 hw/xen/meson.build             | 5 ++++-
 7 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 12443b6ad5..fd37b7a02d 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -15,7 +15,7 @@ fs_ss.add(files(
 ))
 fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
 fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-util-darwin.c'))
-fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
+fs_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
 specific_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-9p-device.c'))
diff --git a/hw/block/dataplane/meson.build b/hw/block/dataplane/meson.build
index 12c6a264f1..78d7ac1a11 100644
--- a/hw/block/dataplane/meson.build
+++ b/hw/block/dataplane/meson.build
@@ -1,2 +1,2 @@
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
-specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
+specific_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
diff --git a/hw/block/meson.build b/hw/block/meson.build
index b434d5654c..cc2a75cc50 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -14,7 +14,7 @@ softmmu_ss.add(when: 'CONFIG_PFLASH_CFI02', if_true: files('pflash_cfi02.c'))
 softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
 softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80_sfdp.c'))
 softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
-softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
+softmmu_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
 softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 7b594f51b8..e02c60dd54 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -18,7 +18,7 @@ softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci-multi.c'))
 softmmu_ss.add(when: 'CONFIG_SHAKTI_UART', if_true: files('shakti_uart.c'))
 softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-console.c'))
-softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c'))
+softmmu_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen_console.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
 
 softmmu_ss.add(when: 'CONFIG_AVR_USART', if_true: files('avr_usart.c'))
diff --git a/hw/display/meson.build b/hw/display/meson.build
index f470179122..4191694380 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -14,7 +14,7 @@ softmmu_ss.add(when: 'CONFIG_PL110', if_true: files('pl110.c'))
 softmmu_ss.add(when: 'CONFIG_SII9022', if_true: files('sii9022.c'))
 softmmu_ss.add(when: 'CONFIG_SSD0303', if_true: files('ssd0303.c'))
 softmmu_ss.add(when: 'CONFIG_SSD0323', if_true: files('ssd0323.c'))
-softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xenfb.c'))
+softmmu_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xenfb.c'))
 
 softmmu_ss.add(when: 'CONFIG_VGA_PCI', if_true: files('vga-pci.c'))
 softmmu_ss.add(when: 'CONFIG_VGA_ISA', if_true: files('vga-isa.c'))
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index bdf34cbd3e..599dc24f0d 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -84,6 +84,6 @@ if libusb.found()
   hw_usb_modules += {'host': usbhost_ss}
 endif
 
-softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN', libusb], if_true: files('xen-usb.c'))
+softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN_BUS', libusb], if_true: files('xen-usb.c'))
 
 modules += { 'hw-usb': hw_usb_modules }
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index f195bbd25c..19c6aabc7c 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -1,10 +1,13 @@
-softmmu_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
+softmmu_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
   'xen-backend.c',
   'xen-bus-helper.c',
   'xen-bus.c',
   'xen-legacy-backend.c',
   'xen_devconfig.c',
   'xen_pvdev.c',
+))
+
+softmmu_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
   'xen-operations.c',
 ))
 
-- 
2.39.0


