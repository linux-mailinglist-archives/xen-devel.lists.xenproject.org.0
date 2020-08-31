Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4481B2586BE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 06:19:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCxkM-0002sV-Op; Tue, 01 Sep 2020 04:18:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69Zt=CJ=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kCr3R-00023I-61
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 21:09:29 +0000
X-Inumbo-ID: d9c11a4f-a3ab-43de-8caa-d52a658e6fed
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d9c11a4f-a3ab-43de-8caa-d52a658e6fed;
 Mon, 31 Aug 2020 21:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598908167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cyf6KoNf8lZH+ZBHENrqkAFjlmTLyoqBBryDPKOZ1s4=;
 b=Yqm9xGC1f7NZJFwAGgKn2fDFAzK/LynrGG0EXbo9V32BzWi0/1LGFar4R0ZMcLFpjHEInQ
 oCtS3bqEe6myr067qbwRrT1MOb4ksI/ZhTVcDPiUPbI7HInDq0uGAVgRE/ZmCVF1vpmkxW
 Adua6s6sBpdjvK+WQ0zl7eVTPK18eHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-86S2_ohKN5K2UbfECBDiRw-1; Mon, 31 Aug 2020 17:09:23 -0400
X-MC-Unique: 86S2_ohKN5K2UbfECBDiRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 817BD51B3;
 Mon, 31 Aug 2020 21:09:13 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F29E78B26;
 Mon, 31 Aug 2020 21:08:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Richard Henderson <rth@twiddle.net>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Jan Kiszka <jan.kiszka@web.de>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm <leif@nuviainc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Walle <michael@walle.cc>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alberto Garcia <berto@igalia.com>, Thomas Huth <huth@tuxfamily.org>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Helge Deller <deller@gmx.de>, Corey Minyard <cminyard@mvista.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Paul Burton <pburton@wavecomp.com>, Jiri Slaby <jslaby@suse.cz>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Sven Schnelle <svens@stackframe.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Ben Warren <ben@skyportsystems.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, Eric Farman <farman@linux.ibm.com>,
 Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Zhang Chen <chen.zhang@intel.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Anthony Green <green@moxielogic.com>, Stafford Horne <shorne@gmail.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 11/18] [automated] Use DECLARE_*CHECKER* macros
Date: Mon, 31 Aug 2020 17:07:33 -0400
Message-Id: <20200831210740.126168-12-ehabkost@redhat.com>
In-Reply-To: <20200831210740.126168-1-ehabkost@redhat.com>
References: <20200831210740.126168-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mailman-Approved-At: Tue, 01 Sep 2020 04:18:12 +0000
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

 $ ./scripts/codeconverter/converter.py -i \
   --pattern=TypeCheckMacro $(git grep -l '' -- '*.[ch]')

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v3 -> v4:
 * Removed hunk due to rebase conflict:
   hw/hppa/lasi.c include/hw/arm/armsse.h
   include/hw/virtio/vhost-user-blk.h
 * Reviewed-by lines from v3 were kept, as no additional hunks
   are introduced in this version

Changes v2 -> v3:
* Removed hunks due to rebase conflicts:
  hw/arm/integratorcp.c hw/arm/versatilepb.c hw/sd/pl181.c
  include/hw/ppc/xive.h
* Reviewed-by line from Daniel was kept, as no additional hunks
  are introduced in this version

Changes v1 -> v2:
* Re-ran script after moving a few macros and typedefs.  Now the
  following types are also handled by this patch:
  - TYPE_ALLWINNER_AHCI
  - TYPE_ARM_SSE
  - TYPE_AUXTOI2C
  - TYPE_I8042
  - TYPE_I8257
  - TYPE_ICH9_AHCI
  - TYPE_KVM_ACCEL
  - TYPE_MPTSAS1068
  - TYPE_PIIX3_PCI_DEVICE
  - TYPE_PXA2XX_FIR
  - TYPE_PXA2XX_I2C
  - TYPE_PXA2XX_MMCI
  - TYPE_PXA2XX_PCMCIA
  - TYPE_ROCKER
  - TYPE_SCLP_EVENT_FACILITY
  - TYPE_SPAPR_MACHINE
  - TYPE_SYSBUS_AHCI
  - TYPE_VFIO_PCI
  - TYPE_VHOST_USER_GPU
  - TYPE_VIRTIO_SERIAL_BUS
  - TYPE_VMBUS
  - TYPE_XENBACKEND

* Re-ran script after making it look for typedefs in typedefs.h.
  Now the following types are also handled by this patch:
  - TYPE_BUS
  - TYPE_CHARDEV
  - TYPE_DEVICE
  - TYPE_FW_CFG
  - TYPE_FW_CFG_IO
  - TYPE_FW_CFG_MEM
  - TYPE_I2C_BUS
  - TYPE_IOMMU_MEMORY_REGION
  - TYPE_ISA_BUS
  - TYPE_ISA_DEVICE
  - TYPE_MACHINE
  - TYPE_MEMORY_REGION
  - TYPE_NETFILTER
  - TYPE_PCI_BRIDGE
  - TYPE_PCI_BUS
  - TYPE_PCI_DEVICE
  - TYPE_PCIE_HOST_BRIDGE
  - TYPE_PCIE_PORT
  - TYPE_PCIE_SLOT
  - TYPE_PCI_HOST_BRIDGE
  - TYPE_PC_MACHINE
  - TYPE_PNV_PHB3_IOMMU_MEMORY_REGION
  - TYPE_PNV_PHB4_IOMMU_MEMORY_REGION
  - TYPE_QEMU_CONSOLE
  - TYPE_SPAPR_IOMMU_MEMORY_REGION
  - TYPE_SSI_BUS
  - TYPE_SYSTEM_BUS
  - TYPE_VERSATILE_PCI_HOST
  - TYPE_VIRTIO_DEVICE

* Re-ran script after changing it to not look for typedefs if the
  macro is using "struct [...]" types directly.  Now the
  following types are also handled by this patch:
  - TYPE_ETRAX_FS_PIC
  - TYPE_IRQ
  - TYPE_LOONGSON_LIOINTC
  - TYPE_OMAP1_GPIO
  - TYPE_OMAP2_GPIO
  - TYPE_VMWARE_SVGA
  - TYPE_XILINX_ETHLITE
  - TYPE_XILINX_INTC
  - TYPE_XILINX_TIMER

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

---
Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Amit Shah <amit@kernel.org>
Cc: Stefan Berger <stefanb@linux.ibm.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Jan Kiszka <jan.kiszka@web.de>
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: Radoslaw Biernacki <rad@semihalf.com>
Cc: Leif Lindholm <leif@nuviainc.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>
Cc: Michael Rolnik <mrolnik@gmail.com>
Cc: John Snow <jsnow@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Keith Busch <kbusch@kernel.org>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Fabien Chouteau <chouteau@adacore.com>
Cc: KONRAD Frederic <frederic.konrad@adacore.com>
Cc: Alberto Garcia <berto@igalia.com>
Cc: Thomas Huth <huth@tuxfamily.org>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: "Hervé Poussineau" <hpoussin@reactos.org>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: Helge Deller <deller@gmx.de>
Cc: Corey Minyard <cminyard@mvista.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Huacai Chen <chenhc@lemote.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Paul Burton <pburton@wavecomp.com>
Cc: Jiri Slaby <jslaby@suse.cz>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: Sven Schnelle <svens@stackframe.org>
Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: David Hildenbrand <david@redhat.com>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>
Cc: Fam Zheng <fam@euphon.net>
Cc: Hannes Reinecke <hare@suse.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Tony Krowiak <akrowiak@linux.ibm.com>
Cc: Pierre Morel <pmorel@linux.ibm.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Ben Warren <ben@skyportsystems.com>
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Sergio Lopez <slp@redhat.com>
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Cc: Laszlo Ersek <lersek@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Eric Farman <farman@linux.ibm.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Cameron Esfahani <dirty@apple.com>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
Cc: Zhang Chen <chen.zhang@intel.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Cc: Anthony Green <green@moxielogic.com>
Cc: Stafford Horne <shorne@gmail.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: qemu-block@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: kvm@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: qemu-riscv@nongnu.org

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 chardev/chardev-internal.h               |  3 +-
 hw/9pfs/virtio-9p.h                      |  4 +-
 hw/audio/intel-hda.h                     | 11 ++--
 hw/avr/atmega.h                          |  3 +-
 hw/block/nvme.h                          |  4 +-
 hw/display/ati_int.h                     |  3 +-
 hw/display/qxl.h                         |  3 +-
 hw/display/virtio-vga.h                  |  8 +--
 hw/i386/amd_iommu.h                      |  4 +-
 hw/misc/tmp105.h                         |  3 +-
 hw/net/fsl_etsec/etsec.h                 |  4 +-
 hw/net/rocker/rocker.h                   |  4 +-
 hw/net/tulip.h                           |  3 +-
 hw/net/vmxnet3_defs.h                    |  3 +-
 hw/ppc/e500-ccsr.h                       |  3 +-
 hw/ppc/e500.h                            |  8 +--
 hw/ppc/mac.h                             |  8 +--
 hw/rdma/vmw/pvrdma.h                     |  3 +-
 hw/s390x/ccw-device.h                    |  7 +--
 hw/s390x/ipl.h                           |  3 +-
 hw/s390x/s390-pci-bus.h                  | 16 +++---
 hw/s390x/virtio-ccw.h                    | 68 +++++++++++-------------
 hw/scsi/mptsas.h                         |  4 +-
 hw/usb/ccid.h                            |  8 +--
 hw/usb/hcd-dwc2.h                        |  8 +--
 hw/usb/hcd-ehci.h                        | 15 +++---
 hw/usb/hcd-ohci.h                        |  3 +-
 hw/usb/hcd-xhci.h                        |  4 +-
 hw/vfio/pci.h                            |  3 +-
 hw/virtio/virtio-mem-pci.h               |  4 +-
 hw/virtio/virtio-pci.h                   | 16 ++----
 hw/virtio/virtio-pmem-pci.h              |  4 +-
 hw/xen/xen_pt.h                          |  4 +-
 include/authz/base.h                     | 11 +---
 include/authz/list.h                     | 11 +---
 include/authz/listfile.h                 | 11 +---
 include/authz/pamacct.h                  | 11 +---
 include/authz/simple.h                   | 11 +---
 include/block/throttle-groups.h          |  3 +-
 include/chardev/char-fd.h                |  3 +-
 include/chardev/char-win.h               |  3 +-
 include/chardev/char.h                   |  7 +--
 include/chardev/spice.h                  |  3 +-
 include/crypto/secret.h                  |  4 +-
 include/crypto/secret_common.h           | 10 +---
 include/crypto/secret_keyring.h          | 11 +---
 include/crypto/tls-cipher-suites.h       |  4 +-
 include/crypto/tlscreds.h                |  4 +-
 include/crypto/tlscredsanon.h            |  4 +-
 include/crypto/tlscredspsk.h             |  4 +-
 include/crypto/tlscredsx509.h            |  4 +-
 include/exec/memory.h                    | 14 ++---
 include/hw/acpi/acpi_dev_interface.h     |  8 +--
 include/hw/acpi/generic_event_device.h   |  4 +-
 include/hw/acpi/vmgenid.h                |  3 +-
 include/hw/adc/stm32f2xx_adc.h           |  4 +-
 include/hw/arm/allwinner-a10.h           |  3 +-
 include/hw/arm/allwinner-h3.h            |  3 +-
 include/hw/arm/armv7m.h                  |  6 ++-
 include/hw/arm/aspeed.h                  |  8 +--
 include/hw/arm/aspeed_soc.h              |  7 +--
 include/hw/arm/bcm2835_peripherals.h     |  4 +-
 include/hw/arm/bcm2836.h                 |  7 +--
 include/hw/arm/digic.h                   |  3 +-
 include/hw/arm/exynos4210.h              |  4 +-
 include/hw/arm/fsl-imx25.h               |  3 +-
 include/hw/arm/fsl-imx31.h               |  3 +-
 include/hw/arm/fsl-imx6.h                |  3 +-
 include/hw/arm/fsl-imx6ul.h              |  3 +-
 include/hw/arm/fsl-imx7.h                |  3 +-
 include/hw/arm/linux-boot-if.h           |  6 +--
 include/hw/arm/msf2-soc.h                |  3 +-
 include/hw/arm/nrf51_soc.h               |  4 +-
 include/hw/arm/omap.h                    | 15 +++---
 include/hw/arm/pxa.h                     | 14 ++---
 include/hw/arm/smmu-common.h             |  7 +--
 include/hw/arm/smmuv3.h                  |  7 +--
 include/hw/arm/stm32f205_soc.h           |  4 +-
 include/hw/arm/stm32f405_soc.h           |  4 +-
 include/hw/arm/virt.h                    |  8 +--
 include/hw/arm/xlnx-versal.h             |  3 +-
 include/hw/arm/xlnx-zynqmp.h             |  4 +-
 include/hw/block/flash.h                 |  8 +--
 include/hw/block/swim.h                  |  6 ++-
 include/hw/boards.h                      |  8 +--
 include/hw/char/avr_usart.h              |  4 +-
 include/hw/char/bcm2835_aux.h            |  3 +-
 include/hw/char/cadence_uart.h           |  4 +-
 include/hw/char/cmsdk-apb-uart.h         |  4 +-
 include/hw/char/digic-uart.h             |  4 +-
 include/hw/char/escc.h                   |  3 +-
 include/hw/char/ibex_uart.h              |  4 +-
 include/hw/char/imx_serial.h             |  3 +-
 include/hw/char/nrf51_uart.h             |  3 +-
 include/hw/char/pl011.h                  |  3 +-
 include/hw/char/renesas_sci.h            |  3 +-
 include/hw/char/serial.h                 |  9 ++--
 include/hw/char/stm32f2xx_usart.h        |  4 +-
 include/hw/clock.h                       |  3 +-
 include/hw/core/cpu.h                    |  4 +-
 include/hw/core/generic-loader.h         |  4 +-
 include/hw/core/split-irq.h              |  3 +-
 include/hw/cpu/a15mpcore.h               |  4 +-
 include/hw/cpu/a9mpcore.h                |  4 +-
 include/hw/cpu/arm11mpcore.h             |  4 +-
 include/hw/cpu/cluster.h                 |  4 +-
 include/hw/cpu/core.h                    |  4 +-
 include/hw/display/bcm2835_fb.h          |  3 +-
 include/hw/display/dpcd.h                |  3 +-
 include/hw/display/i2c-ddc.h             |  3 +-
 include/hw/display/macfb.h               |  4 +-
 include/hw/display/xlnx_dp.h             |  3 +-
 include/hw/dma/bcm2835_dma.h             |  4 +-
 include/hw/dma/i8257.h                   |  4 +-
 include/hw/dma/pl080.h                   |  3 +-
 include/hw/dma/xlnx-zdma.h               |  4 +-
 include/hw/dma/xlnx-zynq-devcfg.h        |  4 +-
 include/hw/dma/xlnx_dpdma.h              |  3 +-
 include/hw/fw-path-provider.h            |  6 +--
 include/hw/gpio/aspeed_gpio.h            |  7 +--
 include/hw/gpio/bcm2835_gpio.h           |  4 +-
 include/hw/gpio/imx_gpio.h               |  3 +-
 include/hw/gpio/nrf51_gpio.h             |  3 +-
 include/hw/hotplug.h                     |  6 +--
 include/hw/hyperv/vmbus-bridge.h         |  3 +-
 include/hw/hyperv/vmbus.h                | 11 ++--
 include/hw/i2c/arm_sbcon_i2c.h           |  4 +-
 include/hw/i2c/aspeed_i2c.h              |  8 +--
 include/hw/i2c/i2c.h                     | 11 ++--
 include/hw/i2c/imx_i2c.h                 |  3 +-
 include/hw/i2c/microbit_i2c.h            |  4 +-
 include/hw/i2c/ppc4xx_i2c.h              |  3 +-
 include/hw/i2c/smbus_slave.h             |  8 +--
 include/hw/i386/apic_internal.h          |  8 +--
 include/hw/i386/ich9.h                   |  4 +-
 include/hw/i386/intel_iommu.h            |  4 +-
 include/hw/i386/ioapic_internal.h        |  8 +--
 include/hw/i386/microvm.h                |  8 +--
 include/hw/i386/pc.h                     |  8 +--
 include/hw/i386/x86.h                    |  8 +--
 include/hw/ide/ahci.h                    | 11 ++--
 include/hw/ide/internal.h                | 11 ++--
 include/hw/ide/pci.h                     |  3 +-
 include/hw/input/adb.h                   | 10 ++--
 include/hw/input/i8042.h                 |  3 +-
 include/hw/intc/allwinner-a10-pic.h      |  3 +-
 include/hw/intc/arm_gic_common.h         |  8 +--
 include/hw/intc/arm_gicv3_common.h       |  8 +--
 include/hw/intc/arm_gicv3_its_common.h   |  8 +--
 include/hw/intc/armv7m_nvic.h            |  4 +-
 include/hw/intc/aspeed_vic.h             |  3 +-
 include/hw/intc/bcm2835_ic.h             |  3 +-
 include/hw/intc/bcm2836_control.h        |  4 +-
 include/hw/intc/heathrow_pic.h           |  3 +-
 include/hw/intc/ibex_plic.h              |  4 +-
 include/hw/intc/imx_avic.h               |  3 +-
 include/hw/intc/imx_gpcv2.h              |  3 +-
 include/hw/intc/intc.h                   |  6 +--
 include/hw/intc/mips_gic.h               |  3 +-
 include/hw/intc/realview_gic.h           |  4 +-
 include/hw/intc/rx_icu.h                 |  3 +-
 include/hw/intc/xlnx-pmu-iomod-intc.h    |  4 +-
 include/hw/intc/xlnx-zynqmp-ipi.h        |  4 +-
 include/hw/ipack/ipack.h                 | 11 ++--
 include/hw/ipmi/ipmi.h                   | 18 +++----
 include/hw/isa/i8259_internal.h          |  8 +--
 include/hw/isa/isa.h                     | 17 +++---
 include/hw/isa/pc87312.h                 |  3 +-
 include/hw/isa/superio.h                 |  8 +--
 include/hw/m68k/mcf_fec.h                |  3 +-
 include/hw/mem/memory-device.h           |  6 +--
 include/hw/mem/nvdimm.h                  |  6 +--
 include/hw/mem/pc-dimm.h                 |  8 +--
 include/hw/mips/cps.h                    |  3 +-
 include/hw/misc/a9scu.h                  |  3 +-
 include/hw/misc/allwinner-cpucfg.h       |  4 +-
 include/hw/misc/allwinner-h3-ccu.h       |  4 +-
 include/hw/misc/allwinner-h3-dramc.h     |  4 +-
 include/hw/misc/allwinner-h3-sysctrl.h   |  4 +-
 include/hw/misc/allwinner-sid.h          |  4 +-
 include/hw/misc/arm11scu.h               |  3 +-
 include/hw/misc/armsse-cpuid.h           |  3 +-
 include/hw/misc/armsse-mhu.h             |  3 +-
 include/hw/misc/aspeed_scu.h             |  7 +--
 include/hw/misc/aspeed_sdmc.h            |  7 +--
 include/hw/misc/aspeed_xdma.h            |  3 +-
 include/hw/misc/auxbus.h                 | 10 ++--
 include/hw/misc/avr_power.h              |  3 +-
 include/hw/misc/bcm2835_mbox.h           |  4 +-
 include/hw/misc/bcm2835_mphi.h           |  4 +-
 include/hw/misc/bcm2835_property.h       |  4 +-
 include/hw/misc/bcm2835_rng.h            |  4 +-
 include/hw/misc/bcm2835_thermal.h        |  4 +-
 include/hw/misc/grlib_ahb_apb_pnp.h      |  8 +--
 include/hw/misc/imx25_ccm.h              |  3 +-
 include/hw/misc/imx31_ccm.h              |  3 +-
 include/hw/misc/imx6_ccm.h               |  3 +-
 include/hw/misc/imx6_src.h               |  3 +-
 include/hw/misc/imx6ul_ccm.h             |  3 +-
 include/hw/misc/imx7_ccm.h               |  6 ++-
 include/hw/misc/imx7_gpr.h               |  3 +-
 include/hw/misc/imx7_snvs.h              |  3 +-
 include/hw/misc/imx_rngc.h               |  3 +-
 include/hw/misc/iotkit-secctl.h          |  3 +-
 include/hw/misc/iotkit-sysctl.h          |  4 +-
 include/hw/misc/iotkit-sysinfo.h         |  4 +-
 include/hw/misc/mac_via.h                | 11 ++--
 include/hw/misc/macio/cuda.h             |  7 +--
 include/hw/misc/macio/gpio.h             |  3 +-
 include/hw/misc/macio/macio.h            | 17 +++---
 include/hw/misc/macio/pmu.h              |  7 +--
 include/hw/misc/max111x.h                |  4 +-
 include/hw/misc/mips_cmgcr.h             |  3 +-
 include/hw/misc/mips_cpc.h               |  3 +-
 include/hw/misc/mips_itu.h               |  3 +-
 include/hw/misc/mps2-fpgaio.h            |  3 +-
 include/hw/misc/mps2-scc.h               |  3 +-
 include/hw/misc/msf2-sysreg.h            |  3 +-
 include/hw/misc/nrf51_rng.h              |  3 +-
 include/hw/misc/pca9552.h                |  3 +-
 include/hw/misc/stm32f2xx_syscfg.h       |  4 +-
 include/hw/misc/stm32f4xx_exti.h         |  4 +-
 include/hw/misc/stm32f4xx_syscfg.h       |  4 +-
 include/hw/misc/tz-mpc.h                 |  3 +-
 include/hw/misc/tz-msc.h                 |  3 +-
 include/hw/misc/tz-ppc.h                 |  3 +-
 include/hw/misc/unimp.h                  |  4 +-
 include/hw/misc/vmcoreinfo.h             |  3 +-
 include/hw/misc/zynq-xadc.h              |  4 +-
 include/hw/net/allwinner-sun8i-emac.h    |  4 +-
 include/hw/net/allwinner_emac.h          |  3 +-
 include/hw/net/cadence_gem.h             |  3 +-
 include/hw/net/ftgmac100.h               |  6 ++-
 include/hw/net/imx_fec.h                 |  3 +-
 include/hw/net/lance.h                   |  4 +-
 include/hw/net/lasi_82596.h              |  4 +-
 include/hw/net/msf2-emac.h               |  4 +-
 include/hw/nmi.h                         |  6 +--
 include/hw/nubus/mac-nubus-bridge.h      |  4 +-
 include/hw/nubus/nubus.h                 |  7 +--
 include/hw/nvram/fw_cfg.h                | 15 +++---
 include/hw/nvram/nrf51_nvm.h             |  3 +-
 include/hw/or-irq.h                      |  3 +-
 include/hw/pci-bridge/simba.h            |  4 +-
 include/hw/pci-host/designware.h         |  8 +--
 include/hw/pci-host/gpex.h               |  8 +--
 include/hw/pci-host/i440fx.h             |  4 +-
 include/hw/pci-host/pnv_phb3.h           |  9 ++--
 include/hw/pci-host/pnv_phb4.h           | 15 +++---
 include/hw/pci-host/q35.h                |  8 +--
 include/hw/pci-host/sabre.h              |  8 +--
 include/hw/pci-host/spapr.h              |  4 +-
 include/hw/pci-host/uninorth.h           | 20 +++----
 include/hw/pci-host/xilinx-pcie.h        |  8 +--
 include/hw/pci/pci.h                     | 13 ++---
 include/hw/pci/pci_bridge.h              |  3 +-
 include/hw/pci/pci_host.h                |  8 +--
 include/hw/pci/pcie_host.h               |  4 +-
 include/hw/pci/pcie_port.h               | 12 ++---
 include/hw/pcmcia.h                      |  8 +--
 include/hw/platform-bus.h                |  4 +-
 include/hw/ppc/mac_dbdma.h               |  3 +-
 include/hw/ppc/openpic.h                 |  3 +-
 include/hw/ppc/pnv.h                     | 44 +++++++--------
 include/hw/ppc/pnv_core.h                | 12 ++---
 include/hw/ppc/pnv_homer.h               | 13 +++--
 include/hw/ppc/pnv_lpc.h                 | 17 +++---
 include/hw/ppc/pnv_occ.h                 | 13 +++--
 include/hw/ppc/pnv_pnor.h                |  3 +-
 include/hw/ppc/pnv_psi.h                 | 16 +++---
 include/hw/ppc/pnv_xive.h                |  7 +--
 include/hw/ppc/pnv_xscom.h               |  5 +-
 include/hw/ppc/spapr.h                   | 20 +++----
 include/hw/ppc/spapr_cpu_core.h          |  8 +--
 include/hw/ppc/spapr_drc.h               | 67 ++++++-----------------
 include/hw/ppc/spapr_irq.h               |  6 +--
 include/hw/ppc/spapr_tpm_proxy.h         |  4 +-
 include/hw/ppc/spapr_vio.h               | 11 ++--
 include/hw/ppc/spapr_xive.h              |  7 +--
 include/hw/ppc/xics.h                    | 23 +++-----
 include/hw/qdev-core.h                   | 10 ++--
 include/hw/register.h                    |  3 +-
 include/hw/resettable.h                  |  6 +--
 include/hw/riscv/opentitan.h             |  4 +-
 include/hw/riscv/riscv_hart.h            |  4 +-
 include/hw/riscv/sifive_clint.h          |  4 +-
 include/hw/riscv/sifive_e.h              |  8 +--
 include/hw/riscv/sifive_e_prci.h         |  4 +-
 include/hw/riscv/sifive_gpio.h           |  3 +-
 include/hw/riscv/sifive_plic.h           |  4 +-
 include/hw/riscv/sifive_test.h           |  4 +-
 include/hw/riscv/sifive_u.h              |  8 +--
 include/hw/riscv/sifive_u_otp.h          |  4 +-
 include/hw/riscv/sifive_u_prci.h         |  4 +-
 include/hw/riscv/sifive_uart.h           |  4 +-
 include/hw/riscv/virt.h                  |  4 +-
 include/hw/rtc/allwinner-rtc.h           |  8 +--
 include/hw/rtc/aspeed_rtc.h              |  3 +-
 include/hw/rtc/goldfish_rtc.h            |  4 +-
 include/hw/rtc/m48t59.h                  |  6 +--
 include/hw/rtc/mc146818rtc.h             |  3 +-
 include/hw/rtc/pl031.h                   |  3 +-
 include/hw/rtc/xlnx-zynqmp-rtc.h         |  4 +-
 include/hw/rx/rx62n.h                    |  3 +-
 include/hw/s390x/3270-ccw.h              |  8 +--
 include/hw/s390x/ap-device.h             |  4 +-
 include/hw/s390x/css-bridge.h            |  8 +--
 include/hw/s390x/event-facility.h        | 18 ++-----
 include/hw/s390x/s390-ccw.h              |  8 +--
 include/hw/s390x/s390_flic.h             | 16 +++---
 include/hw/s390x/sclp.h                  |  5 +-
 include/hw/s390x/storage-attributes.h    | 16 +++---
 include/hw/s390x/storage-keys.h          | 12 ++---
 include/hw/s390x/tod.h                   |  7 +--
 include/hw/s390x/vfio-ccw.h              |  4 +-
 include/hw/scsi/esp.h                    |  3 +-
 include/hw/scsi/scsi.h                   | 11 ++--
 include/hw/sd/allwinner-sdhost.h         |  8 +--
 include/hw/sd/aspeed_sdhci.h             |  4 +-
 include/hw/sd/bcm2835_sdhost.h           |  4 +-
 include/hw/sd/sd.h                       | 12 ++---
 include/hw/sd/sdhci.h                    |  7 +--
 include/hw/southbridge/piix.h            |  4 +-
 include/hw/sparc/sparc32_dma.h           | 16 +++---
 include/hw/sparc/sun4m_iommu.h           |  3 +-
 include/hw/sparc/sun4u_iommu.h           |  3 +-
 include/hw/ssi/aspeed_smc.h              |  7 +--
 include/hw/ssi/imx_spi.h                 |  3 +-
 include/hw/ssi/mss-spi.h                 |  3 +-
 include/hw/ssi/pl022.h                   |  3 +-
 include/hw/ssi/ssi.h                     |  8 +--
 include/hw/ssi/stm32f2xx_spi.h           |  4 +-
 include/hw/ssi/xilinx_spips.h            | 20 +++----
 include/hw/stream.h                      |  6 +--
 include/hw/sysbus.h                      | 11 ++--
 include/hw/timer/a9gtimer.h              |  3 +-
 include/hw/timer/allwinner-a10-pit.h     |  3 +-
 include/hw/timer/arm_mptimer.h           |  4 +-
 include/hw/timer/armv7m_systick.h        |  3 +-
 include/hw/timer/aspeed_timer.h          |  8 +--
 include/hw/timer/avr_timer16.h           |  4 +-
 include/hw/timer/bcm2835_systmr.h        |  4 +-
 include/hw/timer/cmsdk-apb-dualtimer.h   |  4 +-
 include/hw/timer/cmsdk-apb-timer.h       |  4 +-
 include/hw/timer/digic-timer.h           |  3 +-
 include/hw/timer/i8254.h                 |  8 +--
 include/hw/timer/imx_epit.h              |  3 +-
 include/hw/timer/imx_gpt.h               |  3 +-
 include/hw/timer/mss-timer.h             |  4 +-
 include/hw/timer/nrf51_timer.h           |  3 +-
 include/hw/timer/renesas_cmt.h           |  3 +-
 include/hw/timer/renesas_tmr.h           |  3 +-
 include/hw/timer/stm32f2xx_timer.h       |  4 +-
 include/hw/usb.h                         | 11 ++--
 include/hw/usb/chipidea.h                |  3 +-
 include/hw/usb/imx-usb-phy.h             |  3 +-
 include/hw/vfio/vfio-amd-xgbe.h          | 10 +---
 include/hw/vfio/vfio-calxeda-xgmac.h     | 10 +---
 include/hw/vfio/vfio-platform.h          |  8 +--
 include/hw/virtio/vhost-scsi-common.h    |  4 +-
 include/hw/virtio/vhost-scsi.h           |  4 +-
 include/hw/virtio/vhost-user-fs.h        |  4 +-
 include/hw/virtio/vhost-user-scsi.h      |  4 +-
 include/hw/virtio/vhost-user-vsock.h     |  4 +-
 include/hw/virtio/vhost-vsock-common.h   |  4 +-
 include/hw/virtio/vhost-vsock.h          |  4 +-
 include/hw/virtio/virtio-balloon.h       |  4 +-
 include/hw/virtio/virtio-blk.h           |  4 +-
 include/hw/virtio/virtio-bus.h           |  7 +--
 include/hw/virtio/virtio-crypto.h        |  4 +-
 include/hw/virtio/virtio-gpu-pci.h       |  4 +-
 include/hw/virtio/virtio-gpu.h           | 16 +++---
 include/hw/virtio/virtio-input.h         | 20 +++----
 include/hw/virtio/virtio-iommu.h         |  4 +-
 include/hw/virtio/virtio-mem.h           |  8 +--
 include/hw/virtio/virtio-mmio.h          |  4 +-
 include/hw/virtio/virtio-net.h           |  4 +-
 include/hw/virtio/virtio-pmem.h          |  8 +--
 include/hw/virtio/virtio-rng.h           |  4 +-
 include/hw/virtio/virtio-scsi.h          |  8 +--
 include/hw/virtio/virtio-serial.h        | 16 +++---
 include/hw/virtio/virtio.h               |  8 +--
 include/hw/vmstate-if.h                  |  6 +--
 include/hw/watchdog/cmsdk-apb-watchdog.h |  4 +-
 include/hw/watchdog/wdt_aspeed.h         |  8 +--
 include/hw/watchdog/wdt_diag288.h        |  8 +--
 include/hw/watchdog/wdt_imx2.h           |  3 +-
 include/hw/xen/xen-block.h               | 16 +++---
 include/hw/xen/xen-bus.h                 | 16 ++----
 include/hw/xen/xen-legacy-backend.h      |  4 +-
 include/io/channel-buffer.h              |  4 +-
 include/io/channel-command.h             |  4 +-
 include/io/channel-file.h                |  4 +-
 include/io/channel-socket.h              |  4 +-
 include/io/channel-tls.h                 |  4 +-
 include/io/channel-websock.h             |  4 +-
 include/io/channel.h                     |  8 +--
 include/io/dns-resolver.h                |  8 +--
 include/io/net-listener.h                |  8 +--
 include/net/can_emu.h                    |  4 +-
 include/net/can_host.h                   |  8 +--
 include/net/filter.h                     |  8 +--
 include/qom/object_interfaces.h          |  8 +--
 include/scsi/pr-manager.h                |  8 +--
 include/sysemu/accel.h                   |  8 +--
 include/sysemu/cryptodev.h               | 11 +---
 include/sysemu/hostmem.h                 |  8 +--
 include/sysemu/hvf.h                     |  4 +-
 include/sysemu/iothread.h                |  4 +-
 include/sysemu/kvm.h                     |  4 +-
 include/sysemu/rng-random.h              |  3 +-
 include/sysemu/rng.h                     |  8 +--
 include/sysemu/tpm.h                     |  6 +--
 include/sysemu/tpm_backend.h             |  8 +--
 include/sysemu/vhost-user-backend.h      |  8 +--
 include/ui/console.h                     |  8 +--
 target/alpha/cpu-qom.h                   |  8 +--
 target/arm/cpu-qom.h                     |  8 +--
 target/arm/idau.h                        |  6 +--
 target/avr/cpu-qom.h                     |  8 +--
 target/cris/cpu-qom.h                    |  8 +--
 target/hppa/cpu-qom.h                    |  8 +--
 target/i386/cpu-qom.h                    |  8 +--
 target/lm32/cpu-qom.h                    |  8 +--
 target/m68k/cpu-qom.h                    |  8 +--
 target/microblaze/cpu-qom.h              |  8 +--
 target/mips/cpu-qom.h                    |  8 +--
 target/moxie/cpu.h                       |  8 +--
 target/nios2/cpu.h                       |  8 +--
 target/openrisc/cpu.h                    |  8 +--
 target/ppc/cpu-qom.h                     |  8 +--
 target/ppc/cpu.h                         | 10 +---
 target/riscv/cpu.h                       |  8 +--
 target/s390x/cpu-qom.h                   |  8 +--
 target/sh4/cpu-qom.h                     |  8 +--
 target/sparc/cpu-qom.h                   |  8 +--
 target/tilegx/cpu.h                      |  8 +--
 target/tricore/cpu-qom.h                 |  8 +--
 target/unicore32/cpu-qom.h               |  8 +--
 target/xtensa/cpu-qom.h                  |  8 +--
 accel/tcg/tcg-all.c                      |  4 +-
 backends/cryptodev-builtin.c             |  5 +-
 backends/cryptodev-vhost-user.c          |  5 +-
 backends/dbus-vmstate.c                  |  8 +--
 backends/hostmem-file.c                  |  4 +-
 backends/hostmem-memfd.c                 |  4 +-
 backends/rng-builtin.c                   |  3 +-
 backends/rng-egd.c                       |  3 +-
 backends/tpm/tpm_emulator.c              |  4 +-
 backends/tpm/tpm_passthrough.c           |  4 +-
 chardev/baum.c                           |  3 +-
 chardev/char-parallel.c                  |  6 +--
 chardev/char-pty.c                       |  3 +-
 chardev/char-ringbuf.c                   |  4 +-
 chardev/char-socket.c                    |  4 +-
 chardev/char-udp.c                       |  3 +-
 chardev/char-win-stdio.c                 |  4 +-
 chardev/msmouse.c                        |  4 +-
 chardev/testdev.c                        |  4 +-
 chardev/wctablet.c                       |  4 +-
 hw/acpi/piix4.c                          |  4 +-
 hw/alpha/typhoon.c                       |  4 +-
 hw/arm/collie.c                          |  4 +-
 hw/arm/highbank.c                        |  4 +-
 hw/arm/microbit.c                        |  4 +-
 hw/arm/mps2-tz.c                         |  8 +--
 hw/arm/mps2.c                            |  8 +--
 hw/arm/musca.c                           |  8 +--
 hw/arm/musicpal.c                        | 32 +++++------
 hw/arm/palm.c                            |  4 +-
 hw/arm/pxa2xx.c                          | 12 ++---
 hw/arm/pxa2xx_gpio.c                     |  4 +-
 hw/arm/pxa2xx_pic.c                      |  4 +-
 hw/arm/raspi.c                           |  8 +--
 hw/arm/sbsa-ref.c                        |  4 +-
 hw/arm/spitz.c                           | 25 +++++----
 hw/arm/stellaris.c                       | 12 ++---
 hw/arm/strongarm.c                       | 24 ++++-----
 hw/arm/tosa.c                            |  7 +--
 hw/arm/vexpress.c                        |  8 +--
 hw/arm/xilinx_zynq.c                     |  4 +-
 hw/arm/xlnx-versal-virt.c                |  4 +-
 hw/arm/xlnx-zcu102.c                     |  4 +-
 hw/arm/z2.c                              |  6 ++-
 hw/audio/ac97.c                          |  4 +-
 hw/audio/adlib.c                         |  3 +-
 hw/audio/cs4231.c                        |  4 +-
 hw/audio/cs4231a.c                       |  3 +-
 hw/audio/es1370.c                        |  4 +-
 hw/audio/gus.c                           |  3 +-
 hw/audio/hda-codec.c                     |  3 +-
 hw/audio/intel-hda.c                     |  4 +-
 hw/audio/marvell_88w8618.c               |  4 +-
 hw/audio/milkymist-ac97.c                |  4 +-
 hw/audio/pcspk.c                         |  3 +-
 hw/audio/pl041.c                         |  3 +-
 hw/audio/sb16.c                          |  3 +-
 hw/audio/wm8750.c                        |  3 +-
 hw/avr/arduino.c                         |  8 +--
 hw/avr/atmega.c                          |  6 +--
 hw/block/fdc.c                           | 13 +++--
 hw/block/m25p80.c                        |  8 +--
 hw/block/nand.c                          |  4 +-
 hw/block/onenand.c                       |  3 +-
 hw/char/debugcon.c                       |  4 +-
 hw/char/etraxfs_ser.c                    |  4 +-
 hw/char/exynos4210_uart.c                |  4 +-
 hw/char/grlib_apbuart.c                  |  4 +-
 hw/char/ipoctal232.c                     |  4 +-
 hw/char/lm32_juart.c                     |  3 +-
 hw/char/lm32_uart.c                      |  3 +-
 hw/char/mcf_uart.c                       |  3 +-
 hw/char/milkymist-uart.c                 |  4 +-
 hw/char/parallel.c                       |  4 +-
 hw/char/sclpconsole-lm.c                 |  4 +-
 hw/char/sclpconsole.c                    |  4 +-
 hw/char/serial-isa.c                     |  3 +-
 hw/char/serial-pci.c                     |  3 +-
 hw/char/spapr_vty.c                      |  4 +-
 hw/char/terminal3270.c                   |  4 +-
 hw/char/virtio-console.c                 |  4 +-
 hw/char/xilinx_uartlite.c                |  4 +-
 hw/core/irq.c                            |  3 +-
 hw/cpu/realview_mpcore.c                 |  4 +-
 hw/display/ads7846.c                     |  3 +-
 hw/display/artist.c                      |  3 +-
 hw/display/bochs-display.c               |  4 +-
 hw/display/cg3.c                         |  3 +-
 hw/display/cirrus_vga.c                  |  4 +-
 hw/display/cirrus_vga_isa.c              |  4 +-
 hw/display/exynos4210_fimd.c             |  4 +-
 hw/display/g364fb.c                      |  3 +-
 hw/display/jazz_led.c                    |  3 +-
 hw/display/milkymist-tmu2.c              |  4 +-
 hw/display/milkymist-vgafb.c             |  4 +-
 hw/display/next-fb.c                     |  3 +-
 hw/display/pl110.c                       |  3 +-
 hw/display/ramfb-standalone.c            |  3 +-
 hw/display/sii9022.c                     |  3 +-
 hw/display/sm501.c                       |  7 +--
 hw/display/ssd0303.c                     |  3 +-
 hw/display/ssd0323.c                     |  3 +-
 hw/display/tcx.c                         |  3 +-
 hw/display/vga-isa.c                     |  3 +-
 hw/display/vga-pci.c                     |  3 +-
 hw/display/vhost-user-gpu-pci.c          |  4 +-
 hw/display/vhost-user-vga.c              |  4 +-
 hw/display/virtio-gpu-pci.c              |  4 +-
 hw/display/virtio-vga.c                  |  4 +-
 hw/display/vmware_vga.c                  |  4 +-
 hw/dma/i82374.c                          |  3 +-
 hw/dma/pl330.c                           |  3 +-
 hw/dma/puv3_dma.c                        |  3 +-
 hw/dma/pxa2xx_dma.c                      |  3 +-
 hw/dma/rc4030.c                          |  4 +-
 hw/dma/xilinx_axidma.c                   | 14 +++--
 hw/gpio/gpio_key.c                       |  3 +-
 hw/gpio/max7310.c                        |  3 +-
 hw/gpio/mpc8xxx.c                        |  3 +-
 hw/gpio/pl061.c                          |  3 +-
 hw/gpio/puv3_gpio.c                      |  3 +-
 hw/gpio/zaurus.c                         |  3 +-
 hw/hppa/dino.c                           |  4 +-
 hw/hyperv/hyperv.c                       |  3 +-
 hw/hyperv/hyperv_testdev.c               |  4 +-
 hw/i2c/bitbang_i2c.c                     |  3 +-
 hw/i2c/exynos4210_i2c.c                  |  4 +-
 hw/i2c/mpc_i2c.c                         |  4 +-
 hw/i2c/smbus_eeprom.c                    |  4 +-
 hw/i2c/smbus_ich9.c                      |  4 +-
 hw/i2c/versatile_i2c.c                   |  4 +-
 hw/i386/kvm/clock.c                      |  3 +-
 hw/i386/kvm/i8254.c                      |  7 +--
 hw/i386/kvm/i8259.c                      |  6 +--
 hw/i386/kvmvapic.c                       |  3 +-
 hw/i386/port92.c                         |  3 +-
 hw/i386/vmmouse.c                        |  3 +-
 hw/i386/vmport.c                         |  3 +-
 hw/i386/xen/xen_platform.c               |  4 +-
 hw/i386/xen/xen_pvdevice.c               |  4 +-
 hw/ide/isa.c                             |  3 +-
 hw/ide/microdrive.c                      |  3 +-
 hw/ide/mmio.c                            |  3 +-
 hw/ide/sii3112.c                         |  2 +-
 hw/input/adb-kbd.c                       |  7 +--
 hw/input/adb-mouse.c                     |  7 +--
 hw/input/lm832x.c                        |  3 +-
 hw/input/milkymist-softusb.c             |  4 +-
 hw/input/pl050.c                         |  3 +-
 hw/intc/arm_gicv2m.c                     |  3 +-
 hw/intc/etraxfs_pic.c                    |  4 +-
 hw/intc/exynos4210_combiner.c            |  4 +-
 hw/intc/exynos4210_gic.c                 |  8 +--
 hw/intc/grlib_irqmp.c                    |  3 +-
 hw/intc/i8259.c                          |  4 +-
 hw/intc/lm32_pic.c                       |  3 +-
 hw/intc/loongson_liointc.c               |  4 +-
 hw/intc/nios2_iic.c                      |  4 +-
 hw/intc/ompic.c                          |  3 +-
 hw/intc/openpic_kvm.c                    |  4 +-
 hw/intc/pl190.c                          |  3 +-
 hw/intc/puv3_intc.c                      |  3 +-
 hw/intc/s390_flic_kvm.c                  |  6 +--
 hw/intc/slavio_intctl.c                  |  4 +-
 hw/intc/xilinx_intc.c                    |  3 +-
 hw/ipack/tpci200.c                       |  4 +-
 hw/ipmi/ipmi_bmc_extern.c                |  4 +-
 hw/ipmi/isa_ipmi_bt.c                    |  4 +-
 hw/ipmi/isa_ipmi_kcs.c                   |  4 +-
 hw/ipmi/pci_ipmi_bt.c                    |  4 +-
 hw/ipmi/pci_ipmi_kcs.c                   |  4 +-
 hw/ipmi/smbus_ipmi.c                     |  3 +-
 hw/isa/i82378.c                          |  4 +-
 hw/isa/piix4.c                           |  4 +-
 hw/isa/vt82c686.c                        | 16 +++---
 hw/m68k/mcf_intc.c                       |  3 +-
 hw/m68k/next-cube.c                      |  3 +-
 hw/m68k/next-kbd.c                       |  3 +-
 hw/microblaze/xlnx-zynqmp-pmu.c          |  4 +-
 hw/mips/boston.c                         |  3 +-
 hw/mips/gt64xxx_pci.c                    |  4 +-
 hw/mips/malta.c                          |  3 +-
 hw/misc/applesmc.c                       |  3 +-
 hw/misc/arm_integrator_debug.c           |  4 +-
 hw/misc/arm_l2x0.c                       |  3 +-
 hw/misc/arm_sysctl.c                     |  4 +-
 hw/misc/debugexit.c                      |  4 +-
 hw/misc/eccmemctl.c                      |  3 +-
 hw/misc/edu.c                            |  3 +-
 hw/misc/empty_slot.c                     |  3 +-
 hw/misc/exynos4210_clk.c                 |  4 +-
 hw/misc/exynos4210_pmu.c                 |  4 +-
 hw/misc/exynos4210_rng.c                 |  4 +-
 hw/misc/ivshmem.c                        | 16 +++---
 hw/misc/milkymist-hpdmc.c                |  4 +-
 hw/misc/milkymist-pfpu.c                 |  4 +-
 hw/misc/mst_fpga.c                       |  4 +-
 hw/misc/pc-testdev.c                     |  4 +-
 hw/misc/pca9552.c                        |  6 +--
 hw/misc/pci-testdev.c                    |  4 +-
 hw/misc/puv3_pm.c                        |  3 +-
 hw/misc/pvpanic.c                        |  4 +-
 hw/misc/sga.c                            |  3 +-
 hw/misc/slavio_misc.c                    |  6 ++-
 hw/misc/tmp421.c                         |  7 +--
 hw/misc/zynq_slcr.c                      |  3 +-
 hw/net/can/can_kvaser_pci.c              |  4 +-
 hw/net/can/can_mioe3680_pci.c            |  4 +-
 hw/net/can/can_pcm3680_pci.c             |  4 +-
 hw/net/dp8393x.c                         |  3 +-
 hw/net/e1000.c                           |  8 +--
 hw/net/e1000e.c                          |  3 +-
 hw/net/etraxfs_eth.c                     |  4 +-
 hw/net/lan9118.c                         |  3 +-
 hw/net/milkymist-minimac2.c              |  4 +-
 hw/net/mipsnet.c                         |  3 +-
 hw/net/ne2000-isa.c                      |  3 +-
 hw/net/opencores_eth.c                   |  3 +-
 hw/net/pcnet-pci.c                       |  4 +-
 hw/net/rtl8139.c                         |  4 +-
 hw/net/smc91c111.c                       |  3 +-
 hw/net/spapr_llan.c                      |  4 +-
 hw/net/stellaris_enet.c                  |  4 +-
 hw/net/sungem.c                          |  3 +-
 hw/net/sunhme.c                          |  3 +-
 hw/net/vmxnet3.c                         |  6 +--
 hw/net/xgmac.c                           |  3 +-
 hw/net/xilinx_axienet.c                  | 14 +++--
 hw/net/xilinx_ethlite.c                  |  4 +-
 hw/nvram/ds1225y.c                       |  3 +-
 hw/nvram/eeprom_at24c.c                  |  3 +-
 hw/nvram/spapr_nvram.c                   |  4 +-
 hw/pci-bridge/dec.c                      |  3 +-
 hw/pci-bridge/gen_pcie_root_port.c       |  4 +-
 hw/pci-bridge/pci_bridge_dev.c           |  4 +-
 hw/pci-bridge/pci_expander_bridge.c      | 12 +++--
 hw/pci-bridge/pcie_pci_bridge.c          |  4 +-
 hw/pci-host/bonito.c                     |  8 +--
 hw/pci-host/grackle.c                    |  4 +-
 hw/pci-host/i440fx.c                     |  4 +-
 hw/pci-host/pnv_phb3.c                   |  4 +-
 hw/pci-host/pnv_phb4.c                   |  4 +-
 hw/pci-host/ppce500.c                    |  8 +--
 hw/pci-host/prep.c                       |  8 +--
 hw/pci-host/versatile.c                  |  8 +--
 hw/ppc/mpc8544_guts.c                    |  3 +-
 hw/ppc/ppc440_pcix.c                     |  4 +-
 hw/ppc/ppc440_uc.c                       |  4 +-
 hw/ppc/ppc4xx_pci.c                      |  4 +-
 hw/ppc/ppce500_spin.c                    |  3 +-
 hw/ppc/prep_systemio.c                   |  4 +-
 hw/ppc/rs6000_mc.c                       |  4 +-
 hw/ppc/spapr_rng.c                       |  4 +-
 hw/rtc/ds1338.c                          |  3 +-
 hw/rtc/exynos4210_rtc.c                  |  4 +-
 hw/rtc/m41t80.c                          |  3 +-
 hw/rtc/m48t59-isa.c                      |  8 +--
 hw/rtc/m48t59.c                          |  8 +--
 hw/rtc/sun4v-rtc.c                       |  3 +-
 hw/rtc/twl92230.c                        |  3 +-
 hw/rx/rx-gdbsim.c                        |  8 +--
 hw/rx/rx62n.c                            |  6 +--
 hw/scsi/esp-pci.c                        |  8 +--
 hw/scsi/lsi53c895a.c                     |  4 +-
 hw/scsi/megasas.c                        |  8 +--
 hw/scsi/scsi-disk.c                      |  8 +--
 hw/scsi/spapr_vscsi.c                    |  4 +-
 hw/scsi/vmw_pvscsi.c                     |  7 +--
 hw/sd/milkymist-memcard.c                |  4 +-
 hw/sd/ssi-sd.c                           |  3 +-
 hw/sh4/sh_pci.c                          |  4 +-
 hw/sparc/sun4m.c                         | 13 +++--
 hw/sparc64/sun4u.c                       | 12 +++--
 hw/ssi/ssi.c                             |  3 +-
 hw/ssi/xilinx_spi.c                      |  3 +-
 hw/timer/altera_timer.c                  |  4 +-
 hw/timer/arm_timer.c                     |  7 +--
 hw/timer/cadence_ttc.c                   |  4 +-
 hw/timer/etraxfs_timer.c                 |  4 +-
 hw/timer/exynos4210_mct.c                |  4 +-
 hw/timer/exynos4210_pwm.c                |  4 +-
 hw/timer/grlib_gptimer.c                 |  4 +-
 hw/timer/hpet.c                          |  3 +-
 hw/timer/i8254.c                         |  4 +-
 hw/timer/lm32_timer.c                    |  3 +-
 hw/timer/milkymist-sysctl.c              |  4 +-
 hw/timer/puv3_ost.c                      |  3 +-
 hw/timer/pxa2xx_timer.c                  |  4 +-
 hw/timer/slavio_timer.c                  |  4 +-
 hw/timer/xilinx_timer.c                  |  4 +-
 hw/tpm/tpm_crb.c                         |  3 +-
 hw/tpm/tpm_spapr.c                       |  4 +-
 hw/tpm/tpm_tis_isa.c                     |  3 +-
 hw/tpm/tpm_tis_sysbus.c                  |  3 +-
 hw/usb/ccid-card-emulated.c              |  4 +-
 hw/usb/ccid-card-passthru.c              |  4 +-
 hw/usb/dev-audio.c                       |  3 +-
 hw/usb/dev-hid.c                         |  3 +-
 hw/usb/dev-hub.c                         |  3 +-
 hw/usb/dev-mtp.c                         |  3 +-
 hw/usb/dev-network.c                     |  3 +-
 hw/usb/dev-serial.c                      |  3 +-
 hw/usb/dev-smartcard-reader.c            |  6 ++-
 hw/usb/dev-storage.c                     |  3 +-
 hw/usb/dev-uas.c                         |  3 +-
 hw/usb/dev-wacom.c                       |  3 +-
 hw/usb/hcd-ohci-pci.c                    |  3 +-
 hw/usb/hcd-uhci.c                        |  3 +-
 hw/usb/host-libusb.c                     |  4 +-
 hw/usb/redirect.c                        |  3 +-
 hw/usb/tusb6010.c                        |  3 +-
 hw/vfio/ap.c                             |  4 +-
 hw/virtio/vhost-scsi-pci.c               |  4 +-
 hw/virtio/vhost-user-blk-pci.c           |  4 +-
 hw/virtio/vhost-user-fs-pci.c            |  4 +-
 hw/virtio/vhost-user-input-pci.c         |  4 +-
 hw/virtio/vhost-user-scsi-pci.c          |  4 +-
 hw/virtio/vhost-user-vsock-pci.c         |  4 +-
 hw/virtio/vhost-vsock-pci.c              |  4 +-
 hw/virtio/virtio-9p-pci.c                |  4 +-
 hw/virtio/virtio-balloon-pci.c           |  4 +-
 hw/virtio/virtio-blk-pci.c               |  4 +-
 hw/virtio/virtio-crypto-pci.c            |  4 +-
 hw/virtio/virtio-input-host-pci.c        |  4 +-
 hw/virtio/virtio-input-pci.c             |  8 +--
 hw/virtio/virtio-iommu-pci.c             |  4 +-
 hw/virtio/virtio-net-pci.c               |  4 +-
 hw/virtio/virtio-rng-pci.c               |  4 +-
 hw/virtio/virtio-scsi-pci.c              |  4 +-
 hw/virtio/virtio-serial-pci.c            |  4 +-
 hw/watchdog/wdt_i6300esb.c               |  4 +-
 hw/watchdog/wdt_ib700.c                  |  3 +-
 iothread.c                               |  6 +--
 migration/rdma.c                         |  4 +-
 net/can/can_socketcan.c                  |  4 +-
 net/colo-compare.c                       |  4 +-
 net/dump.c                               |  4 +-
 net/filter-buffer.c                      |  4 +-
 net/filter-mirror.c                      |  8 +--
 net/filter-replay.c                      |  4 +-
 net/filter-rewriter.c                    |  4 +-
 scsi/pr-manager-helper.c                 |  5 +-
 target/i386/sev.c                        |  4 +-
 tests/check-qom-interface.c              |  6 +--
 tests/check-qom-proplist.c               | 16 +++---
 tests/test-qdev-global-props.c           |  8 +--
 ui/console.c                             |  3 +-
 ui/gtk.c                                 |  3 +-
 ui/input-barrier.c                       |  8 +--
 ui/input-linux.c                         |  8 +--
 ui/spice-app.c                           |  3 +-
 791 files changed, 1986 insertions(+), 2425 deletions(-)

diff --git a/chardev/chardev-internal.h b/chardev/chardev-internal.h
index 2926a326e0..aba0240759 100644
--- a/chardev/chardev-internal.h
+++ b/chardev/chardev-internal.h
@@ -54,7 +54,8 @@ struct MuxChardev {
 };
 typedef struct MuxChardev MuxChardev;
 
-#define MUX_CHARDEV(obj) OBJECT_CHECK(MuxChardev, (obj), TYPE_CHARDEV_MUX)
+DECLARE_INSTANCE_CHECKER(MuxChardev, MUX_CHARDEV,
+                         TYPE_CHARDEV_MUX)
 #define CHARDEV_IS_MUX(chr)                             \
     object_dynamic_cast(OBJECT(chr), TYPE_CHARDEV_MUX)
 
diff --git a/hw/9pfs/virtio-9p.h b/hw/9pfs/virtio-9p.h
index 6dd945ecda..ff70c5a971 100644
--- a/hw/9pfs/virtio-9p.h
+++ b/hw/9pfs/virtio-9p.h
@@ -16,7 +16,7 @@ struct V9fsVirtioState {
 typedef struct V9fsVirtioState V9fsVirtioState;
 
 #define TYPE_VIRTIO_9P "virtio-9p-device"
-#define VIRTIO_9P(obj) \
-        OBJECT_CHECK(V9fsVirtioState, (obj), TYPE_VIRTIO_9P)
+DECLARE_INSTANCE_CHECKER(V9fsVirtioState, VIRTIO_9P,
+                         TYPE_VIRTIO_9P)
 
 #endif
diff --git a/hw/audio/intel-hda.h b/hw/audio/intel-hda.h
index 44a2897fff..813a7a357d 100644
--- a/hw/audio/intel-hda.h
+++ b/hw/audio/intel-hda.h
@@ -10,16 +10,13 @@
 #define TYPE_HDA_CODEC_DEVICE "hda-codec"
 typedef struct HDACodecDevice HDACodecDevice;
 typedef struct HDACodecDeviceClass HDACodecDeviceClass;
-#define HDA_CODEC_DEVICE(obj) \
-     OBJECT_CHECK(HDACodecDevice, (obj), TYPE_HDA_CODEC_DEVICE)
-#define HDA_CODEC_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(HDACodecDeviceClass, (klass), TYPE_HDA_CODEC_DEVICE)
-#define HDA_CODEC_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(HDACodecDeviceClass, (obj), TYPE_HDA_CODEC_DEVICE)
+DECLARE_OBJ_CHECKERS(HDACodecDevice, HDACodecDeviceClass,
+                     HDA_CODEC_DEVICE, TYPE_HDA_CODEC_DEVICE)
 
 #define TYPE_HDA_BUS "HDA"
 typedef struct HDACodecBus HDACodecBus;
-#define HDA_BUS(obj) OBJECT_CHECK(HDACodecBus, (obj), TYPE_HDA_BUS)
+DECLARE_INSTANCE_CHECKER(HDACodecBus, HDA_BUS,
+                         TYPE_HDA_BUS)
 
 
 typedef void (*hda_codec_response_func)(HDACodecDevice *dev,
diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
index 2c46ecb904..a99ee15c7e 100644
--- a/hw/avr/atmega.h
+++ b/hw/avr/atmega.h
@@ -24,7 +24,8 @@
 #define TYPE_ATMEGA2560_MCU "ATmega2560"
 
 typedef struct AtmegaMcuState AtmegaMcuState;
-#define ATMEGA_MCU(obj) OBJECT_CHECK(AtmegaMcuState, (obj), TYPE_ATMEGA_MCU)
+DECLARE_INSTANCE_CHECKER(AtmegaMcuState, ATMEGA_MCU,
+                         TYPE_ATMEGA_MCU)
 
 #define POWER_MAX 2
 #define USART_MAX 4
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 02d576d7b2..a88a7736e1 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -76,8 +76,8 @@ static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
 
 #define TYPE_NVME "nvme"
 typedef struct NvmeCtrl NvmeCtrl;
-#define NVME(obj) \
-        OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
+DECLARE_INSTANCE_CHECKER(NvmeCtrl, NVME,
+                         TYPE_NVME)
 
 struct NvmeCtrl {
     PCIDevice    parent_obj;
diff --git a/hw/display/ati_int.h b/hw/display/ati_int.h
index 2a8a3306da..714005447d 100644
--- a/hw/display/ati_int.h
+++ b/hw/display/ati_int.h
@@ -31,7 +31,8 @@
 
 #define TYPE_ATI_VGA "ati-vga"
 typedef struct ATIVGAState ATIVGAState;
-#define ATI_VGA(obj) OBJECT_CHECK(ATIVGAState, (obj), TYPE_ATI_VGA)
+DECLARE_INSTANCE_CHECKER(ATIVGAState, ATI_VGA,
+                         TYPE_ATI_VGA)
 
 typedef struct ATIVGARegs {
     uint32_t mm_index;
diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index 4ecb6b2934..714cd01b63 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -131,7 +131,8 @@ struct PCIQXLDevice {
 typedef struct PCIQXLDevice PCIQXLDevice;
 
 #define TYPE_PCI_QXL "pci-qxl"
-#define PCI_QXL(obj) OBJECT_CHECK(PCIQXLDevice, (obj), TYPE_PCI_QXL)
+DECLARE_INSTANCE_CHECKER(PCIQXLDevice, PCI_QXL,
+                         TYPE_PCI_QXL)
 
 #define PANIC_ON(x) if ((x)) {                         \
     printf("%s: PANIC %s failed\n", __func__, #x); \
diff --git a/hw/display/virtio-vga.h b/hw/display/virtio-vga.h
index 2d3b765bf9..19f8af7356 100644
--- a/hw/display/virtio-vga.h
+++ b/hw/display/virtio-vga.h
@@ -11,12 +11,8 @@
 #define TYPE_VIRTIO_VGA_BASE "virtio-vga-base"
 typedef struct VirtIOVGABase VirtIOVGABase;
 typedef struct VirtIOVGABaseClass VirtIOVGABaseClass;
-#define VIRTIO_VGA_BASE(obj)                                \
-    OBJECT_CHECK(VirtIOVGABase, (obj), TYPE_VIRTIO_VGA_BASE)
-#define VIRTIO_VGA_BASE_GET_CLASS(obj)                      \
-    OBJECT_GET_CLASS(VirtIOVGABaseClass, obj, TYPE_VIRTIO_VGA_BASE)
-#define VIRTIO_VGA_BASE_CLASS(klass)                        \
-    OBJECT_CLASS_CHECK(VirtIOVGABaseClass, klass, TYPE_VIRTIO_VGA_BASE)
+DECLARE_OBJ_CHECKERS(VirtIOVGABase, VirtIOVGABaseClass,
+                     VIRTIO_VGA_BASE, TYPE_VIRTIO_VGA_BASE)
 
 struct VirtIOVGABase {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
index 85860c36dd..fa5feb183c 100644
--- a/hw/i386/amd_iommu.h
+++ b/hw/i386/amd_iommu.h
@@ -298,8 +298,8 @@ struct irte_ga {
 
 #define TYPE_AMD_IOMMU_DEVICE "amd-iommu"
 typedef struct AMDVIState AMDVIState;
-#define AMD_IOMMU_DEVICE(obj)\
-    OBJECT_CHECK(AMDVIState, (obj), TYPE_AMD_IOMMU_DEVICE)
+DECLARE_INSTANCE_CHECKER(AMDVIState, AMD_IOMMU_DEVICE,
+                         TYPE_AMD_IOMMU_DEVICE)
 
 #define TYPE_AMD_IOMMU_PCI "AMDVI-PCI"
 
diff --git a/hw/misc/tmp105.h b/hw/misc/tmp105.h
index 634bb4a0d6..7ee8a496ff 100644
--- a/hw/misc/tmp105.h
+++ b/hw/misc/tmp105.h
@@ -20,7 +20,8 @@
 
 #define TYPE_TMP105 "tmp105"
 typedef struct TMP105State TMP105State;
-#define TMP105(obj) OBJECT_CHECK(TMP105State, (obj), TYPE_TMP105)
+DECLARE_INSTANCE_CHECKER(TMP105State, TMP105,
+                         TYPE_TMP105)
 
 /**
  * TMP105State:
diff --git a/hw/net/fsl_etsec/etsec.h b/hw/net/fsl_etsec/etsec.h
index 132a87b1ba..0c929d9afd 100644
--- a/hw/net/fsl_etsec/etsec.h
+++ b/hw/net/fsl_etsec/etsec.h
@@ -150,8 +150,8 @@ struct eTSEC {
 typedef struct eTSEC eTSEC;
 
 #define TYPE_ETSEC_COMMON "eTSEC"
-#define ETSEC_COMMON(obj) \
-     OBJECT_CHECK(eTSEC, (obj), TYPE_ETSEC_COMMON)
+DECLARE_INSTANCE_CHECKER(eTSEC, ETSEC_COMMON,
+                         TYPE_ETSEC_COMMON)
 
 #define eTSEC_TRANSMIT 1
 #define eTSEC_RECEIVE  2
diff --git a/hw/net/rocker/rocker.h b/hw/net/rocker/rocker.h
index 0dd49d5f41..941c932265 100644
--- a/hw/net/rocker/rocker.h
+++ b/hw/net/rocker/rocker.h
@@ -73,8 +73,8 @@ typedef struct desc_ring DescRing;
 
 #define TYPE_ROCKER "rocker"
 typedef struct rocker Rocker;
-#define ROCKER(obj) \
-    OBJECT_CHECK(Rocker, (obj), TYPE_ROCKER)
+DECLARE_INSTANCE_CHECKER(Rocker, ROCKER,
+                         TYPE_ROCKER)
 
 Rocker *rocker_find(const char *name);
 uint32_t rocker_fp_ports(Rocker *r);
diff --git a/hw/net/tulip.h b/hw/net/tulip.h
index 5fe4aee87d..87e3ab79bc 100644
--- a/hw/net/tulip.h
+++ b/hw/net/tulip.h
@@ -7,7 +7,8 @@
 
 #define TYPE_TULIP "tulip"
 typedef struct TULIPState TULIPState;
-#define TULIP(obj) OBJECT_CHECK(TULIPState, (obj), TYPE_TULIP)
+DECLARE_INSTANCE_CHECKER(TULIPState, TULIP,
+                         TYPE_TULIP)
 
 #define CSR(_x) ((_x) << 3)
 
diff --git a/hw/net/vmxnet3_defs.h b/hw/net/vmxnet3_defs.h
index 1df1e4c3a6..71440509ca 100644
--- a/hw/net/vmxnet3_defs.h
+++ b/hw/net/vmxnet3_defs.h
@@ -23,7 +23,8 @@
 
 #define TYPE_VMXNET3 "vmxnet3"
 typedef struct VMXNET3State VMXNET3State;
-#define VMXNET3(obj) OBJECT_CHECK(VMXNET3State, (obj), TYPE_VMXNET3)
+DECLARE_INSTANCE_CHECKER(VMXNET3State, VMXNET3,
+                         TYPE_VMXNET3)
 
 /* Device state and helper functions */
 #define VMXNET3_RX_RINGS_PER_QUEUE (2)
diff --git a/hw/ppc/e500-ccsr.h b/hw/ppc/e500-ccsr.h
index f7fd73fc0d..de4b9d2bc3 100644
--- a/hw/ppc/e500-ccsr.h
+++ b/hw/ppc/e500-ccsr.h
@@ -14,6 +14,7 @@ struct PPCE500CCSRState {
 typedef struct PPCE500CCSRState PPCE500CCSRState;
 
 #define TYPE_CCSR "e500-ccsr"
-#define CCSR(obj) OBJECT_CHECK(PPCE500CCSRState, (obj), TYPE_CCSR)
+DECLARE_INSTANCE_CHECKER(PPCE500CCSRState, CCSR,
+                         TYPE_CCSR)
 
 #endif /* E500_CCSR_H */
diff --git a/hw/ppc/e500.h b/hw/ppc/e500.h
index 5773460d5e..63870751ff 100644
--- a/hw/ppc/e500.h
+++ b/hw/ppc/e500.h
@@ -46,11 +46,7 @@ void ppce500_init(MachineState *machine);
 hwaddr booke206_page_size_to_tlb(uint64_t size);
 
 #define TYPE_PPCE500_MACHINE      "ppce500-base-machine"
-#define PPCE500_MACHINE(obj) \
-    OBJECT_CHECK(PPCE500MachineState, (obj), TYPE_PPCE500_MACHINE)
-#define PPCE500_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(PPCE500MachineClass, obj, TYPE_PPCE500_MACHINE)
-#define PPCE500_MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(PPCE500MachineClass, klass, TYPE_PPCE500_MACHINE)
+DECLARE_OBJ_CHECKERS(PPCE500MachineState, PPCE500MachineClass,
+                     PPCE500_MACHINE, TYPE_PPCE500_MACHINE)
 
 #endif
diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index f4ef3f32b0..2b6425f600 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -73,8 +73,8 @@
 /* Core99 machine */
 #define TYPE_CORE99_MACHINE MACHINE_TYPE_NAME("mac99")
 typedef struct Core99MachineState Core99MachineState;
-#define CORE99_MACHINE(obj) OBJECT_CHECK(Core99MachineState, (obj), \
-                                         TYPE_CORE99_MACHINE)
+DECLARE_INSTANCE_CHECKER(Core99MachineState, CORE99_MACHINE,
+                         TYPE_CORE99_MACHINE)
 
 #define CORE99_VIA_CONFIG_CUDA     0x0
 #define CORE99_VIA_CONFIG_PMU      0x1
@@ -93,8 +93,8 @@ struct Core99MachineState {
 /* Mac NVRAM */
 #define TYPE_MACIO_NVRAM "macio-nvram"
 typedef struct MacIONVRAMState MacIONVRAMState;
-#define MACIO_NVRAM(obj) \
-    OBJECT_CHECK(MacIONVRAMState, (obj), TYPE_MACIO_NVRAM)
+DECLARE_INSTANCE_CHECKER(MacIONVRAMState, MACIO_NVRAM,
+                         TYPE_MACIO_NVRAM)
 
 struct MacIONVRAMState {
     /*< private >*/
diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h
index db9d9e2c73..1d36a76f1e 100644
--- a/hw/rdma/vmw/pvrdma.h
+++ b/hw/rdma/vmw/pvrdma.h
@@ -101,7 +101,8 @@ struct PVRDMADev {
     PVRDMADevStats stats;
 };
 typedef struct PVRDMADev PVRDMADev;
-#define PVRDMA_DEV(dev) OBJECT_CHECK(PVRDMADev, (dev), PVRDMA_HW_NAME)
+DECLARE_INSTANCE_CHECKER(PVRDMADev, PVRDMA_DEV,
+                         PVRDMA_HW_NAME)
 
 static inline int get_reg_val(PVRDMADev *dev, hwaddr addr, uint32_t *val)
 {
diff --git a/hw/s390x/ccw-device.h b/hw/s390x/ccw-device.h
index 867547b4eb..cf7d492084 100644
--- a/hw/s390x/ccw-device.h
+++ b/hw/s390x/ccw-device.h
@@ -47,10 +47,7 @@ static inline CcwDevice *to_ccw_dev_fast(DeviceState *d)
 
 #define TYPE_CCW_DEVICE "ccw-device"
 
-#define CCW_DEVICE(obj) OBJECT_CHECK(CcwDevice, (obj), TYPE_CCW_DEVICE)
-#define CCW_DEVICE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(CCWDeviceClass, (obj), TYPE_CCW_DEVICE)
-#define CCW_DEVICE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(CCWDeviceClass, (klass), TYPE_CCW_DEVICE)
+DECLARE_OBJ_CHECKERS(CcwDevice, CCWDeviceClass,
+                     CCW_DEVICE, TYPE_CCW_DEVICE)
 
 #endif
diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
index 282b22cc4f..9e6061a043 100644
--- a/hw/s390x/ipl.h
+++ b/hw/s390x/ipl.h
@@ -154,7 +154,8 @@ typedef struct QemuIplParameters QemuIplParameters;
 
 #define TYPE_S390_IPL "s390-ipl"
 typedef struct S390IPLState S390IPLState;
-#define S390_IPL(obj) OBJECT_CHECK(S390IPLState, (obj), TYPE_S390_IPL)
+DECLARE_INSTANCE_CHECKER(S390IPLState, S390_IPL,
+                         TYPE_S390_IPL)
 
 struct S390IPLState {
     /*< private >*/
diff --git a/hw/s390x/s390-pci-bus.h b/hw/s390x/s390-pci-bus.h
index 06f046e73a..045805980f 100644
--- a/hw/s390x/s390-pci-bus.h
+++ b/hw/s390x/s390-pci-bus.h
@@ -38,17 +38,17 @@
 #define UID_CHECKING_ENABLED 0x01
 
 typedef struct S390pciState S390pciState;
-#define S390_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(S390pciState, (obj), TYPE_S390_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(S390pciState, S390_PCI_HOST_BRIDGE,
+                         TYPE_S390_PCI_HOST_BRIDGE)
 typedef struct S390PCIBus S390PCIBus;
-#define S390_PCI_BUS(obj) \
-    OBJECT_CHECK(S390PCIBus, (obj), TYPE_S390_PCI_BUS)
+DECLARE_INSTANCE_CHECKER(S390PCIBus, S390_PCI_BUS,
+                         TYPE_S390_PCI_BUS)
 typedef struct S390PCIBusDevice S390PCIBusDevice;
-#define S390_PCI_DEVICE(obj) \
-    OBJECT_CHECK(S390PCIBusDevice, (obj), TYPE_S390_PCI_DEVICE)
+DECLARE_INSTANCE_CHECKER(S390PCIBusDevice, S390_PCI_DEVICE,
+                         TYPE_S390_PCI_DEVICE)
 typedef struct S390PCIIOMMU S390PCIIOMMU;
-#define S390_PCI_IOMMU(obj) \
-    OBJECT_CHECK(S390PCIIOMMU, (obj), TYPE_S390_PCI_IOMMU)
+DECLARE_INSTANCE_CHECKER(S390PCIIOMMU, S390_PCI_IOMMU,
+                         TYPE_S390_PCI_IOMMU)
 
 #define HP_EVENT_TO_CONFIGURED        0x0301
 #define HP_EVENT_RESERVED_TO_STANDBY  0x0302
diff --git a/hw/s390x/virtio-ccw.h b/hw/s390x/virtio-ccw.h
index c046c816c9..cea259685d 100644
--- a/hw/s390x/virtio-ccw.h
+++ b/hw/s390x/virtio-ccw.h
@@ -56,23 +56,15 @@
 #define TYPE_VIRTIO_CCW_DEVICE "virtio-ccw-device"
 typedef struct VirtIOCCWDeviceClass VirtIOCCWDeviceClass;
 typedef struct VirtioCcwDevice VirtioCcwDevice;
-#define VIRTIO_CCW_DEVICE(obj) \
-     OBJECT_CHECK(VirtioCcwDevice, (obj), TYPE_VIRTIO_CCW_DEVICE)
-#define VIRTIO_CCW_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(VirtIOCCWDeviceClass, (klass), TYPE_VIRTIO_CCW_DEVICE)
-#define VIRTIO_CCW_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(VirtIOCCWDeviceClass, (obj), TYPE_VIRTIO_CCW_DEVICE)
+DECLARE_OBJ_CHECKERS(VirtioCcwDevice, VirtIOCCWDeviceClass,
+                     VIRTIO_CCW_DEVICE, TYPE_VIRTIO_CCW_DEVICE)
 
 typedef struct VirtioBusState VirtioCcwBusState;
 typedef struct VirtioBusClass VirtioCcwBusClass;
 
 #define TYPE_VIRTIO_CCW_BUS "virtio-ccw-bus"
-#define VIRTIO_CCW_BUS(obj) \
-     OBJECT_CHECK(VirtioCcwBusState, (obj), TYPE_VIRTIO_CCW_BUS)
-#define VIRTIO_CCW_BUS_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(VirtioCcwBusClass, (obj), TYPE_VIRTIO_CCW_BUS)
-#define VIRTIO_CCW_BUS_CLASS(klass) \
-    OBJECT_CLASS_CHECK(VirtioCcwBusClass, klass, TYPE_VIRTIO_CCW_BUS)
+DECLARE_OBJ_CHECKERS(VirtioCcwBusState, VirtioCcwBusClass,
+                     VIRTIO_CCW_BUS, TYPE_VIRTIO_CCW_BUS)
 
 
 struct VirtIOCCWDeviceClass {
@@ -114,8 +106,8 @@ static inline int virtio_ccw_rev_max(VirtioCcwDevice *dev)
 
 #define TYPE_VIRTIO_SCSI_CCW "virtio-scsi-ccw"
 typedef struct VirtIOSCSICcw VirtIOSCSICcw;
-#define VIRTIO_SCSI_CCW(obj) \
-        OBJECT_CHECK(VirtIOSCSICcw, (obj), TYPE_VIRTIO_SCSI_CCW)
+DECLARE_INSTANCE_CHECKER(VirtIOSCSICcw, VIRTIO_SCSI_CCW,
+                         TYPE_VIRTIO_SCSI_CCW)
 
 struct VirtIOSCSICcw {
     VirtioCcwDevice parent_obj;
@@ -127,8 +119,8 @@ struct VirtIOSCSICcw {
 
 #define TYPE_VHOST_SCSI_CCW "vhost-scsi-ccw"
 typedef struct VHostSCSICcw VHostSCSICcw;
-#define VHOST_SCSI_CCW(obj) \
-        OBJECT_CHECK(VHostSCSICcw, (obj), TYPE_VHOST_SCSI_CCW)
+DECLARE_INSTANCE_CHECKER(VHostSCSICcw, VHOST_SCSI_CCW,
+                         TYPE_VHOST_SCSI_CCW)
 
 struct VHostSCSICcw {
     VirtioCcwDevice parent_obj;
@@ -140,8 +132,8 @@ struct VHostSCSICcw {
 
 #define TYPE_VIRTIO_BLK_CCW "virtio-blk-ccw"
 typedef struct VirtIOBlkCcw VirtIOBlkCcw;
-#define VIRTIO_BLK_CCW(obj) \
-        OBJECT_CHECK(VirtIOBlkCcw, (obj), TYPE_VIRTIO_BLK_CCW)
+DECLARE_INSTANCE_CHECKER(VirtIOBlkCcw, VIRTIO_BLK_CCW,
+                         TYPE_VIRTIO_BLK_CCW)
 
 struct VirtIOBlkCcw {
     VirtioCcwDevice parent_obj;
@@ -152,8 +144,8 @@ struct VirtIOBlkCcw {
 
 #define TYPE_VIRTIO_BALLOON_CCW "virtio-balloon-ccw"
 typedef struct VirtIOBalloonCcw VirtIOBalloonCcw;
-#define VIRTIO_BALLOON_CCW(obj) \
-        OBJECT_CHECK(VirtIOBalloonCcw, (obj), TYPE_VIRTIO_BALLOON_CCW)
+DECLARE_INSTANCE_CHECKER(VirtIOBalloonCcw, VIRTIO_BALLOON_CCW,
+                         TYPE_VIRTIO_BALLOON_CCW)
 
 struct VirtIOBalloonCcw {
     VirtioCcwDevice parent_obj;
@@ -164,8 +156,8 @@ struct VirtIOBalloonCcw {
 
 #define TYPE_VIRTIO_SERIAL_CCW "virtio-serial-ccw"
 typedef struct VirtioSerialCcw VirtioSerialCcw;
-#define VIRTIO_SERIAL_CCW(obj) \
-        OBJECT_CHECK(VirtioSerialCcw, (obj), TYPE_VIRTIO_SERIAL_CCW)
+DECLARE_INSTANCE_CHECKER(VirtioSerialCcw, VIRTIO_SERIAL_CCW,
+                         TYPE_VIRTIO_SERIAL_CCW)
 
 struct VirtioSerialCcw {
     VirtioCcwDevice parent_obj;
@@ -176,8 +168,8 @@ struct VirtioSerialCcw {
 
 #define TYPE_VIRTIO_NET_CCW "virtio-net-ccw"
 typedef struct VirtIONetCcw VirtIONetCcw;
-#define VIRTIO_NET_CCW(obj) \
-        OBJECT_CHECK(VirtIONetCcw, (obj), TYPE_VIRTIO_NET_CCW)
+DECLARE_INSTANCE_CHECKER(VirtIONetCcw, VIRTIO_NET_CCW,
+                         TYPE_VIRTIO_NET_CCW)
 
 struct VirtIONetCcw {
     VirtioCcwDevice parent_obj;
@@ -188,8 +180,8 @@ struct VirtIONetCcw {
 
 #define TYPE_VIRTIO_RNG_CCW "virtio-rng-ccw"
 typedef struct VirtIORNGCcw VirtIORNGCcw;
-#define VIRTIO_RNG_CCW(obj) \
-        OBJECT_CHECK(VirtIORNGCcw, (obj), TYPE_VIRTIO_RNG_CCW)
+DECLARE_INSTANCE_CHECKER(VirtIORNGCcw, VIRTIO_RNG_CCW,
+                         TYPE_VIRTIO_RNG_CCW)
 
 struct VirtIORNGCcw {
     VirtioCcwDevice parent_obj;
@@ -200,8 +192,8 @@ struct VirtIORNGCcw {
 
 #define TYPE_VIRTIO_CRYPTO_CCW "virtio-crypto-ccw"
 typedef struct VirtIOCryptoCcw VirtIOCryptoCcw;
-#define VIRTIO_CRYPTO_CCW(obj) \
-        OBJECT_CHECK(VirtIOCryptoCcw, (obj), TYPE_VIRTIO_CRYPTO_CCW)
+DECLARE_INSTANCE_CHECKER(VirtIOCryptoCcw, VIRTIO_CRYPTO_CCW,
+                         TYPE_VIRTIO_CRYPTO_CCW)
 
 struct VirtIOCryptoCcw {
     VirtioCcwDevice parent_obj;
@@ -215,8 +207,8 @@ VirtIODevice *virtio_ccw_get_vdev(SubchDev *sch);
 
 #define TYPE_VIRTIO_9P_CCW "virtio-9p-ccw"
 typedef struct V9fsCCWState V9fsCCWState;
-#define VIRTIO_9P_CCW(obj) \
-    OBJECT_CHECK(V9fsCCWState, (obj), TYPE_VIRTIO_9P_CCW)
+DECLARE_INSTANCE_CHECKER(V9fsCCWState, VIRTIO_9P_CCW,
+                         TYPE_VIRTIO_9P_CCW)
 
 struct V9fsCCWState {
     VirtioCcwDevice parent_obj;
@@ -228,8 +220,8 @@ struct V9fsCCWState {
 #ifdef CONFIG_VHOST_VSOCK
 #define TYPE_VHOST_VSOCK_CCW "vhost-vsock-ccw"
 typedef struct VHostVSockCCWState VHostVSockCCWState;
-#define VHOST_VSOCK_CCW(obj) \
-    OBJECT_CHECK(VHostVSockCCWState, (obj), TYPE_VHOST_VSOCK_CCW)
+DECLARE_INSTANCE_CHECKER(VHostVSockCCWState, VHOST_VSOCK_CCW,
+                         TYPE_VHOST_VSOCK_CCW)
 
 struct VHostVSockCCWState {
     VirtioCcwDevice parent_obj;
@@ -240,8 +232,8 @@ struct VHostVSockCCWState {
 
 #define TYPE_VIRTIO_GPU_CCW "virtio-gpu-ccw"
 typedef struct VirtIOGPUCcw VirtIOGPUCcw;
-#define VIRTIO_GPU_CCW(obj) \
-        OBJECT_CHECK(VirtIOGPUCcw, (obj), TYPE_VIRTIO_GPU_CCW)
+DECLARE_INSTANCE_CHECKER(VirtIOGPUCcw, VIRTIO_GPU_CCW,
+                         TYPE_VIRTIO_GPU_CCW)
 
 struct VirtIOGPUCcw {
     VirtioCcwDevice parent_obj;
@@ -250,8 +242,8 @@ struct VirtIOGPUCcw {
 
 #define TYPE_VIRTIO_INPUT_CCW "virtio-input-ccw"
 typedef struct VirtIOInputCcw VirtIOInputCcw;
-#define VIRTIO_INPUT_CCW(obj) \
-        OBJECT_CHECK(VirtIOInputCcw, (obj), TYPE_VIRTIO_INPUT_CCW)
+DECLARE_INSTANCE_CHECKER(VirtIOInputCcw, VIRTIO_INPUT_CCW,
+                         TYPE_VIRTIO_INPUT_CCW)
 
 struct VirtIOInputCcw {
     VirtioCcwDevice parent_obj;
@@ -263,8 +255,8 @@ struct VirtIOInputCcw {
 #define TYPE_VIRTIO_MOUSE_CCW "virtio-mouse-ccw"
 #define TYPE_VIRTIO_TABLET_CCW "virtio-tablet-ccw"
 typedef struct VirtIOInputHIDCcw VirtIOInputHIDCcw;
-#define VIRTIO_INPUT_HID_CCW(obj) \
-        OBJECT_CHECK(VirtIOInputHIDCcw, (obj), TYPE_VIRTIO_INPUT_HID_CCW)
+DECLARE_INSTANCE_CHECKER(VirtIOInputHIDCcw, VIRTIO_INPUT_HID_CCW,
+                         TYPE_VIRTIO_INPUT_HID_CCW)
 
 struct VirtIOInputHIDCcw {
     VirtioCcwDevice parent_obj;
diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
index 2e76bda79e..b85ac1a5fc 100644
--- a/hw/scsi/mptsas.h
+++ b/hw/scsi/mptsas.h
@@ -16,8 +16,8 @@ typedef struct MPTSASRequest MPTSASRequest;
 
 #define TYPE_MPTSAS1068 "mptsas1068"
 typedef struct MPTSASState MPTSASState;
-#define MPT_SAS(obj) \
-    OBJECT_CHECK(MPTSASState, (obj), TYPE_MPTSAS1068)
+DECLARE_INSTANCE_CHECKER(MPTSASState, MPT_SAS,
+                         TYPE_MPTSAS1068)
 
 enum {
     DOORBELL_NONE,
diff --git a/hw/usb/ccid.h b/hw/usb/ccid.h
index b992d2ccf8..ef2bb3462d 100644
--- a/hw/usb/ccid.h
+++ b/hw/usb/ccid.h
@@ -18,12 +18,8 @@ typedef struct CCIDCardInfo CCIDCardInfo;
 
 #define TYPE_CCID_CARD "ccid-card"
 typedef struct CCIDCardClass CCIDCardClass;
-#define CCID_CARD(obj) \
-     OBJECT_CHECK(CCIDCardState, (obj), TYPE_CCID_CARD)
-#define CCID_CARD_CLASS(klass) \
-     OBJECT_CLASS_CHECK(CCIDCardClass, (klass), TYPE_CCID_CARD)
-#define CCID_CARD_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(CCIDCardClass, (obj), TYPE_CCID_CARD)
+DECLARE_OBJ_CHECKERS(CCIDCardState, CCIDCardClass,
+                     CCID_CARD, TYPE_CCID_CARD)
 
 /*
  * callbacks to be used by the CCID device (hw/usb-ccid.c) to call
diff --git a/hw/usb/hcd-dwc2.h b/hw/usb/hcd-dwc2.h
index 71b40f0d8a..919e3e43b1 100644
--- a/hw/usb/hcd-dwc2.h
+++ b/hw/usb/hcd-dwc2.h
@@ -181,11 +181,7 @@ struct DWC2Class {
 };
 
 #define TYPE_DWC2_USB   "dwc2-usb"
-#define DWC2_USB(obj) \
-    OBJECT_CHECK(DWC2State, (obj), TYPE_DWC2_USB)
-#define DWC2_USB_CLASS(klass) \
-    OBJECT_CLASS_CHECK(DWC2Class, (klass), TYPE_DWC2_USB)
-#define DWC2_USB_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(DWC2Class, (obj), TYPE_DWC2_USB)
+DECLARE_OBJ_CHECKERS(DWC2State, DWC2Class,
+                     DWC2_USB, TYPE_DWC2_USB)
 
 #endif
diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index c12c9bae46..1301ce0be7 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -330,7 +330,8 @@ void ehci_reset(void *opaque);
 
 #define TYPE_PCI_EHCI "pci-ehci-usb"
 typedef struct EHCIPCIState EHCIPCIState;
-#define PCI_EHCI(obj) OBJECT_CHECK(EHCIPCIState, (obj), TYPE_PCI_EHCI)
+DECLARE_INSTANCE_CHECKER(EHCIPCIState, PCI_EHCI,
+                         TYPE_PCI_EHCI)
 
 struct EHCIPCIState {
     /*< private >*/
@@ -351,12 +352,8 @@ struct EHCIPCIState {
 
 typedef struct EHCISysBusState EHCISysBusState;
 typedef struct SysBusEHCIClass SysBusEHCIClass;
-#define SYS_BUS_EHCI(obj) \
-    OBJECT_CHECK(EHCISysBusState, (obj), TYPE_SYS_BUS_EHCI)
-#define SYS_BUS_EHCI_CLASS(class) \
-    OBJECT_CLASS_CHECK(SysBusEHCIClass, (class), TYPE_SYS_BUS_EHCI)
-#define SYS_BUS_EHCI_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(SysBusEHCIClass, (obj), TYPE_SYS_BUS_EHCI)
+DECLARE_OBJ_CHECKERS(EHCISysBusState, SysBusEHCIClass,
+                     SYS_BUS_EHCI, TYPE_SYS_BUS_EHCI)
 
 struct EHCISysBusState {
     /*< private >*/
@@ -378,8 +375,8 @@ struct SysBusEHCIClass {
 };
 
 typedef struct FUSBH200EHCIState FUSBH200EHCIState;
-#define FUSBH200_EHCI(obj) \
-    OBJECT_CHECK(FUSBH200EHCIState, (obj), TYPE_FUSBH200_EHCI)
+DECLARE_INSTANCE_CHECKER(FUSBH200EHCIState, FUSBH200_EHCI,
+                         TYPE_FUSBH200_EHCI)
 
 struct FUSBH200EHCIState {
     /*< private >*/
diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
index 3e9053fb26..6e28e97839 100644
--- a/hw/usb/hcd-ohci.h
+++ b/hw/usb/hcd-ohci.h
@@ -94,7 +94,8 @@ typedef struct OHCIState {
 
 #define TYPE_SYSBUS_OHCI "sysbus-ohci"
 typedef struct OHCISysBusState OHCISysBusState;
-#define SYSBUS_OHCI(obj) OBJECT_CHECK(OHCISysBusState, (obj), TYPE_SYSBUS_OHCI)
+DECLARE_INSTANCE_CHECKER(OHCISysBusState, SYSBUS_OHCI,
+                         TYPE_SYSBUS_OHCI)
 
 struct OHCISysBusState {
     /*< private >*/
diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 867388a061..2110c0399e 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -28,8 +28,8 @@
 #define TYPE_QEMU_XHCI "qemu-xhci"
 
 typedef struct XHCIState XHCIState;
-#define XHCI(obj) \
-    OBJECT_CHECK(XHCIState, (obj), TYPE_XHCI)
+DECLARE_INSTANCE_CHECKER(XHCIState, XHCI,
+                         TYPE_XHCI)
 
 #define MAXPORTS_2 15
 #define MAXPORTS_3 15
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 8c1f94118a..846d60e56c 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -116,7 +116,8 @@ typedef struct VFIOMSIXInfo {
 
 #define TYPE_VFIO_PCI "vfio-pci"
 typedef struct VFIOPCIDevice VFIOPCIDevice;
-#define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
+DECLARE_INSTANCE_CHECKER(VFIOPCIDevice, PCI_VFIO,
+                         TYPE_VFIO_PCI)
 
 struct VFIOPCIDevice {
     PCIDevice pdev;
diff --git a/hw/virtio/virtio-mem-pci.h b/hw/virtio/virtio-mem-pci.h
index 65b86beac7..e636e1a48d 100644
--- a/hw/virtio/virtio-mem-pci.h
+++ b/hw/virtio/virtio-mem-pci.h
@@ -23,8 +23,8 @@ typedef struct VirtIOMEMPCI VirtIOMEMPCI;
  * virtio-mem-pci: This extends VirtioPCIProxy.
  */
 #define TYPE_VIRTIO_MEM_PCI "virtio-mem-pci-base"
-#define VIRTIO_MEM_PCI(obj) \
-        OBJECT_CHECK(VirtIOMEMPCI, (obj), TYPE_VIRTIO_MEM_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIOMEMPCI, VIRTIO_MEM_PCI,
+                         TYPE_VIRTIO_MEM_PCI)
 
 struct VirtIOMEMPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index d59ac97430..47b6bb4e26 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -27,12 +27,8 @@ typedef struct VirtioBusState VirtioPCIBusState;
 typedef struct VirtioBusClass VirtioPCIBusClass;
 
 #define TYPE_VIRTIO_PCI_BUS "virtio-pci-bus"
-#define VIRTIO_PCI_BUS(obj) \
-        OBJECT_CHECK(VirtioPCIBusState, (obj), TYPE_VIRTIO_PCI_BUS)
-#define VIRTIO_PCI_BUS_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(VirtioPCIBusClass, obj, TYPE_VIRTIO_PCI_BUS)
-#define VIRTIO_PCI_BUS_CLASS(klass) \
-        OBJECT_CLASS_CHECK(VirtioPCIBusClass, klass, TYPE_VIRTIO_PCI_BUS)
+DECLARE_OBJ_CHECKERS(VirtioPCIBusState, VirtioPCIBusClass,
+                     VIRTIO_PCI_BUS, TYPE_VIRTIO_PCI_BUS)
 
 enum {
     VIRTIO_PCI_FLAG_BUS_MASTER_BUG_MIGRATION_BIT,
@@ -96,12 +92,8 @@ typedef struct {
  */
 #define TYPE_VIRTIO_PCI "virtio-pci"
 typedef struct VirtioPCIClass VirtioPCIClass;
-#define VIRTIO_PCI_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(VirtioPCIClass, obj, TYPE_VIRTIO_PCI)
-#define VIRTIO_PCI_CLASS(klass) \
-        OBJECT_CLASS_CHECK(VirtioPCIClass, klass, TYPE_VIRTIO_PCI)
-#define VIRTIO_PCI(obj) \
-        OBJECT_CHECK(VirtIOPCIProxy, (obj), TYPE_VIRTIO_PCI)
+DECLARE_OBJ_CHECKERS(VirtIOPCIProxy, VirtioPCIClass,
+                     VIRTIO_PCI, TYPE_VIRTIO_PCI)
 
 struct VirtioPCIClass {
     PCIDeviceClass parent_class;
diff --git a/hw/virtio/virtio-pmem-pci.h b/hw/virtio/virtio-pmem-pci.h
index 5ac8099637..63cfe727f7 100644
--- a/hw/virtio/virtio-pmem-pci.h
+++ b/hw/virtio/virtio-pmem-pci.h
@@ -24,8 +24,8 @@ typedef struct VirtIOPMEMPCI VirtIOPMEMPCI;
  * virtio-pmem-pci: This extends VirtioPCIProxy.
  */
 #define TYPE_VIRTIO_PMEM_PCI "virtio-pmem-pci-base"
-#define VIRTIO_PMEM_PCI(obj) \
-        OBJECT_CHECK(VirtIOPMEMPCI, (obj), TYPE_VIRTIO_PMEM_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIOPMEMPCI, VIRTIO_PMEM_PCI,
+                         TYPE_VIRTIO_PMEM_PCI)
 
 struct VirtIOPMEMPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index c367c7da27..f46971eac6 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -40,8 +40,8 @@ typedef struct XenPTReg XenPTReg;
 typedef struct XenPCIPassthroughState XenPCIPassthroughState;
 
 #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
-#define XEN_PT_DEVICE(obj) \
-    OBJECT_CHECK(XenPCIPassthroughState, (obj), TYPE_XEN_PT_DEVICE)
+DECLARE_INSTANCE_CHECKER(XenPCIPassthroughState, XEN_PT_DEVICE,
+                         TYPE_XEN_PT_DEVICE)
 
 uint32_t igd_read_opregion(XenPCIPassthroughState *s);
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
diff --git a/include/authz/base.h b/include/authz/base.h
index c01946b4ce..8d8cf9fa5a 100644
--- a/include/authz/base.h
+++ b/include/authz/base.h
@@ -29,15 +29,8 @@
 
 typedef struct QAuthZ QAuthZ;
 typedef struct QAuthZClass QAuthZClass;
-#define QAUTHZ_CLASS(klass) \
-     OBJECT_CLASS_CHECK(QAuthZClass, (klass), \
-                        TYPE_QAUTHZ)
-#define QAUTHZ_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(QAuthZClass, (obj), \
-                      TYPE_QAUTHZ)
-#define QAUTHZ(obj) \
-     OBJECT_CHECK(QAuthZ, (obj), \
-                  TYPE_QAUTHZ)
+DECLARE_OBJ_CHECKERS(QAuthZ, QAuthZClass,
+                     QAUTHZ, TYPE_QAUTHZ)
 
 
 /**
diff --git a/include/authz/list.h b/include/authz/list.h
index 5d5e8e803f..93d16876bc 100644
--- a/include/authz/list.h
+++ b/include/authz/list.h
@@ -29,15 +29,8 @@
 
 typedef struct QAuthZList QAuthZList;
 typedef struct QAuthZListClass QAuthZListClass;
-#define QAUTHZ_LIST_CLASS(klass)                        \
-    OBJECT_CLASS_CHECK(QAuthZListClass, (klass),        \
-                       TYPE_QAUTHZ_LIST)
-#define QAUTHZ_LIST_GET_CLASS(obj)              \
-    OBJECT_GET_CLASS(QAuthZListClass, (obj),    \
-                      TYPE_QAUTHZ_LIST)
-#define QAUTHZ_LIST(obj) \
-    OBJECT_CHECK(QAuthZList, (obj), \
-                 TYPE_QAUTHZ_LIST)
+DECLARE_OBJ_CHECKERS(QAuthZList, QAuthZListClass,
+                     QAUTHZ_LIST, TYPE_QAUTHZ_LIST)
 
 
 
diff --git a/include/authz/listfile.h b/include/authz/listfile.h
index 11169ac882..2e4a629b6d 100644
--- a/include/authz/listfile.h
+++ b/include/authz/listfile.h
@@ -29,15 +29,8 @@
 
 typedef struct QAuthZListFile QAuthZListFile;
 typedef struct QAuthZListFileClass QAuthZListFileClass;
-#define QAUTHZ_LIST_FILE_CLASS(klass)                        \
-    OBJECT_CLASS_CHECK(QAuthZListFileClass, (klass),        \
-                       TYPE_QAUTHZ_LIST_FILE)
-#define QAUTHZ_LIST_FILE_GET_CLASS(obj)              \
-    OBJECT_GET_CLASS(QAuthZListFileClass, (obj),    \
-                      TYPE_QAUTHZ_LIST_FILE)
-#define QAUTHZ_LIST_FILE(obj) \
-    OBJECT_CHECK(QAuthZListFile, (obj), \
-                 TYPE_QAUTHZ_LIST_FILE)
+DECLARE_OBJ_CHECKERS(QAuthZListFile, QAuthZListFileClass,
+                     QAUTHZ_LIST_FILE, TYPE_QAUTHZ_LIST_FILE)
 
 
 
diff --git a/include/authz/pamacct.h b/include/authz/pamacct.h
index a14cf33fb4..98454ddc25 100644
--- a/include/authz/pamacct.h
+++ b/include/authz/pamacct.h
@@ -29,15 +29,8 @@
 
 typedef struct QAuthZPAM QAuthZPAM;
 typedef struct QAuthZPAMClass QAuthZPAMClass;
-#define QAUTHZ_PAM_CLASS(klass) \
-     OBJECT_CLASS_CHECK(QAuthZPAMClass, (klass), \
-                        TYPE_QAUTHZ_PAM)
-#define QAUTHZ_PAM_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(QAuthZPAMClass, (obj), \
-                      TYPE_QAUTHZ_PAM)
-#define QAUTHZ_PAM(obj) \
-     OBJECT_CHECK(QAuthZPAM, (obj), \
-                  TYPE_QAUTHZ_PAM)
+DECLARE_OBJ_CHECKERS(QAuthZPAM, QAuthZPAMClass,
+                     QAUTHZ_PAM, TYPE_QAUTHZ_PAM)
 
 
 
diff --git a/include/authz/simple.h b/include/authz/simple.h
index df8c1bf39c..7a896fb94b 100644
--- a/include/authz/simple.h
+++ b/include/authz/simple.h
@@ -28,15 +28,8 @@
 
 typedef struct QAuthZSimple QAuthZSimple;
 typedef struct QAuthZSimpleClass QAuthZSimpleClass;
-#define QAUTHZ_SIMPLE_CLASS(klass)                        \
-    OBJECT_CLASS_CHECK(QAuthZSimpleClass, (klass),        \
-                       TYPE_QAUTHZ_SIMPLE)
-#define QAUTHZ_SIMPLE_GET_CLASS(obj)              \
-    OBJECT_GET_CLASS(QAuthZSimpleClass, (obj),    \
-                      TYPE_QAUTHZ_SIMPLE)
-#define QAUTHZ_SIMPLE(obj) \
-    OBJECT_CHECK(QAuthZSimple, (obj), \
-                 TYPE_QAUTHZ_SIMPLE)
+DECLARE_OBJ_CHECKERS(QAuthZSimple, QAuthZSimpleClass,
+                     QAUTHZ_SIMPLE, TYPE_QAUTHZ_SIMPLE)
 
 
 
diff --git a/include/block/throttle-groups.h b/include/block/throttle-groups.h
index 7c6f572cf9..20b308f619 100644
--- a/include/block/throttle-groups.h
+++ b/include/block/throttle-groups.h
@@ -61,7 +61,8 @@ typedef struct ThrottleGroupMember {
 
 #define TYPE_THROTTLE_GROUP "throttle-group"
 typedef struct ThrottleGroup ThrottleGroup;
-#define THROTTLE_GROUP(obj) OBJECT_CHECK(ThrottleGroup, (obj), TYPE_THROTTLE_GROUP)
+DECLARE_INSTANCE_CHECKER(ThrottleGroup, THROTTLE_GROUP,
+                         TYPE_THROTTLE_GROUP)
 
 const char *throttle_group_get_name(ThrottleGroupMember *tgm);
 
diff --git a/include/chardev/char-fd.h b/include/chardev/char-fd.h
index 1442dcaa62..9de0e440de 100644
--- a/include/chardev/char-fd.h
+++ b/include/chardev/char-fd.h
@@ -38,7 +38,8 @@ typedef struct FDChardev FDChardev;
 
 #define TYPE_CHARDEV_FD "chardev-fd"
 
-#define FD_CHARDEV(obj) OBJECT_CHECK(FDChardev, (obj), TYPE_CHARDEV_FD)
+DECLARE_INSTANCE_CHECKER(FDChardev, FD_CHARDEV,
+                         TYPE_CHARDEV_FD)
 
 void qemu_chr_open_fd(Chardev *chr, int fd_in, int fd_out);
 int qmp_chardev_open_file_source(char *src, int flags, Error **errp);
diff --git a/include/chardev/char-win.h b/include/chardev/char-win.h
index f1632330f1..485521469c 100644
--- a/include/chardev/char-win.h
+++ b/include/chardev/char-win.h
@@ -44,7 +44,8 @@ typedef struct WinChardev WinChardev;
 #define NRECVBUF 2048
 
 #define TYPE_CHARDEV_WIN "chardev-win"
-#define WIN_CHARDEV(obj) OBJECT_CHECK(WinChardev, (obj), TYPE_CHARDEV_WIN)
+DECLARE_INSTANCE_CHECKER(WinChardev, WIN_CHARDEV,
+                         TYPE_CHARDEV_WIN)
 
 void win_chr_set_file(Chardev *chr, HANDLE file, bool keep_open);
 int win_chr_serial_init(Chardev *chr, const char *filename, Error **errp);
diff --git a/include/chardev/char.h b/include/chardev/char.h
index d91d851b33..5874de57ea 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -227,11 +227,8 @@ int qemu_chr_wait_connected(Chardev *chr, Error **errp);
 
 #define TYPE_CHARDEV "chardev"
 typedef struct ChardevClass ChardevClass;
-#define CHARDEV(obj) OBJECT_CHECK(Chardev, (obj), TYPE_CHARDEV)
-#define CHARDEV_CLASS(klass) \
-    OBJECT_CLASS_CHECK(ChardevClass, (klass), TYPE_CHARDEV)
-#define CHARDEV_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(ChardevClass, (obj), TYPE_CHARDEV)
+DECLARE_OBJ_CHECKERS(Chardev, ChardevClass,
+                     CHARDEV, TYPE_CHARDEV)
 
 #define TYPE_CHARDEV_NULL "chardev-null"
 #define TYPE_CHARDEV_MUX "chardev-mux"
diff --git a/include/chardev/spice.h b/include/chardev/spice.h
index 5bccc47392..99f26aedde 100644
--- a/include/chardev/spice.h
+++ b/include/chardev/spice.h
@@ -21,7 +21,8 @@ typedef struct SpiceChardev SpiceChardev;
 #define TYPE_CHARDEV_SPICEVMC "chardev-spicevmc"
 #define TYPE_CHARDEV_SPICEPORT "chardev-spiceport"
 
-#define SPICE_CHARDEV(obj) OBJECT_CHECK(SpiceChardev, (obj), TYPE_CHARDEV_SPICE)
+DECLARE_INSTANCE_CHECKER(SpiceChardev, SPICE_CHARDEV,
+                         TYPE_CHARDEV_SPICE)
 
 void qemu_chr_open_spice_port(Chardev *chr, ChardevBackend *backend,
                               bool *be_opened, Error **errp);
diff --git a/include/crypto/secret.h b/include/crypto/secret.h
index 8c03971e75..5d20ae6d2f 100644
--- a/include/crypto/secret.h
+++ b/include/crypto/secret.h
@@ -27,8 +27,8 @@
 
 #define TYPE_QCRYPTO_SECRET "secret"
 typedef struct QCryptoSecret QCryptoSecret;
-#define QCRYPTO_SECRET(obj)                  \
-    OBJECT_CHECK(QCryptoSecret, (obj), TYPE_QCRYPTO_SECRET)
+DECLARE_INSTANCE_CHECKER(QCryptoSecret, QCRYPTO_SECRET,
+                         TYPE_QCRYPTO_SECRET)
 
 typedef struct QCryptoSecretClass QCryptoSecretClass;
 
diff --git a/include/crypto/secret_common.h b/include/crypto/secret_common.h
index db282a3872..dd3310ea5f 100644
--- a/include/crypto/secret_common.h
+++ b/include/crypto/secret_common.h
@@ -27,14 +27,8 @@
 #define TYPE_QCRYPTO_SECRET_COMMON "secret_common"
 typedef struct QCryptoSecretCommon QCryptoSecretCommon;
 typedef struct QCryptoSecretCommonClass QCryptoSecretCommonClass;
-#define QCRYPTO_SECRET_COMMON(obj) \
-    OBJECT_CHECK(QCryptoSecretCommon, (obj), TYPE_QCRYPTO_SECRET_COMMON)
-#define QCRYPTO_SECRET_COMMON_CLASS(class) \
-    OBJECT_CLASS_CHECK(QCryptoSecretCommonClass, \
-                       (class), TYPE_QCRYPTO_SECRET_COMMON)
-#define QCRYPTO_SECRET_COMMON_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(QCryptoSecretCommonClass, \
-                     (obj), TYPE_QCRYPTO_SECRET_COMMON)
+DECLARE_OBJ_CHECKERS(QCryptoSecretCommon, QCryptoSecretCommonClass,
+                     QCRYPTO_SECRET_COMMON, TYPE_QCRYPTO_SECRET_COMMON)
 
 
 struct QCryptoSecretCommon {
diff --git a/include/crypto/secret_keyring.h b/include/crypto/secret_keyring.h
index 8b3b8ee67d..9875f4cbf3 100644
--- a/include/crypto/secret_keyring.h
+++ b/include/crypto/secret_keyring.h
@@ -28,15 +28,8 @@
 #define TYPE_QCRYPTO_SECRET_KEYRING "secret_keyring"
 typedef struct QCryptoSecretKeyring QCryptoSecretKeyring;
 typedef struct QCryptoSecretKeyringClass QCryptoSecretKeyringClass;
-#define QCRYPTO_SECRET_KEYRING(obj) \
-    OBJECT_CHECK(QCryptoSecretKeyring, (obj), \
-                 TYPE_QCRYPTO_SECRET_KEYRING)
-#define QCRYPTO_SECRET_KEYRING_CLASS(class) \
-    OBJECT_CLASS_CHECK(QCryptoSecretKeyringClass, \
-                       (class), TYPE_QCRYPTO_SECRET_KEYRING)
-#define QCRYPTO_SECRET_KEYRING_GET_CLASS(class) \
-    OBJECT_GET_CLASS(QCryptoSecretKeyringClass, \
-                     (class), TYPE_QCRYPTO_SECRET_KEYRING)
+DECLARE_OBJ_CHECKERS(QCryptoSecretKeyring, QCryptoSecretKeyringClass,
+                     QCRYPTO_SECRET_KEYRING, TYPE_QCRYPTO_SECRET_KEYRING)
 
 
 struct QCryptoSecretKeyring {
diff --git a/include/crypto/tls-cipher-suites.h b/include/crypto/tls-cipher-suites.h
index 23f031953f..bb9ee53e03 100644
--- a/include/crypto/tls-cipher-suites.h
+++ b/include/crypto/tls-cipher-suites.h
@@ -16,8 +16,8 @@
 
 #define TYPE_QCRYPTO_TLS_CIPHER_SUITES "tls-cipher-suites"
 typedef struct QCryptoTLSCipherSuites QCryptoTLSCipherSuites;
-#define QCRYPTO_TLS_CIPHER_SUITES(obj) \
-    OBJECT_CHECK(QCryptoTLSCipherSuites, (obj), TYPE_QCRYPTO_TLS_CIPHER_SUITES)
+DECLARE_INSTANCE_CHECKER(QCryptoTLSCipherSuites, QCRYPTO_TLS_CIPHER_SUITES,
+                         TYPE_QCRYPTO_TLS_CIPHER_SUITES)
 
 struct QCryptoTLSCipherSuites {
     /* <private> */
diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
index 9f065a4def..079e376047 100644
--- a/include/crypto/tlscreds.h
+++ b/include/crypto/tlscreds.h
@@ -30,8 +30,8 @@
 
 #define TYPE_QCRYPTO_TLS_CREDS "tls-creds"
 typedef struct QCryptoTLSCreds QCryptoTLSCreds;
-#define QCRYPTO_TLS_CREDS(obj)                  \
-    OBJECT_CHECK(QCryptoTLSCreds, (obj), TYPE_QCRYPTO_TLS_CREDS)
+DECLARE_INSTANCE_CHECKER(QCryptoTLSCreds, QCRYPTO_TLS_CREDS,
+                         TYPE_QCRYPTO_TLS_CREDS)
 
 typedef struct QCryptoTLSCredsClass QCryptoTLSCredsClass;
 
diff --git a/include/crypto/tlscredsanon.h b/include/crypto/tlscredsanon.h
index 034ebd3fd9..3f464a3809 100644
--- a/include/crypto/tlscredsanon.h
+++ b/include/crypto/tlscredsanon.h
@@ -26,8 +26,8 @@
 
 #define TYPE_QCRYPTO_TLS_CREDS_ANON "tls-creds-anon"
 typedef struct QCryptoTLSCredsAnon QCryptoTLSCredsAnon;
-#define QCRYPTO_TLS_CREDS_ANON(obj)                  \
-    OBJECT_CHECK(QCryptoTLSCredsAnon, (obj), TYPE_QCRYPTO_TLS_CREDS_ANON)
+DECLARE_INSTANCE_CHECKER(QCryptoTLSCredsAnon, QCRYPTO_TLS_CREDS_ANON,
+                         TYPE_QCRYPTO_TLS_CREDS_ANON)
 
 
 typedef struct QCryptoTLSCredsAnonClass QCryptoTLSCredsAnonClass;
diff --git a/include/crypto/tlscredspsk.h b/include/crypto/tlscredspsk.h
index 6e361366eb..d7e6bdb5ed 100644
--- a/include/crypto/tlscredspsk.h
+++ b/include/crypto/tlscredspsk.h
@@ -26,8 +26,8 @@
 
 #define TYPE_QCRYPTO_TLS_CREDS_PSK "tls-creds-psk"
 typedef struct QCryptoTLSCredsPSK QCryptoTLSCredsPSK;
-#define QCRYPTO_TLS_CREDS_PSK(obj)                  \
-    OBJECT_CHECK(QCryptoTLSCredsPSK, (obj), TYPE_QCRYPTO_TLS_CREDS_PSK)
+DECLARE_INSTANCE_CHECKER(QCryptoTLSCredsPSK, QCRYPTO_TLS_CREDS_PSK,
+                         TYPE_QCRYPTO_TLS_CREDS_PSK)
 
 typedef struct QCryptoTLSCredsPSKClass QCryptoTLSCredsPSKClass;
 
diff --git a/include/crypto/tlscredsx509.h b/include/crypto/tlscredsx509.h
index e4d44ea22d..c6d89b7881 100644
--- a/include/crypto/tlscredsx509.h
+++ b/include/crypto/tlscredsx509.h
@@ -26,8 +26,8 @@
 
 #define TYPE_QCRYPTO_TLS_CREDS_X509 "tls-creds-x509"
 typedef struct QCryptoTLSCredsX509 QCryptoTLSCredsX509;
-#define QCRYPTO_TLS_CREDS_X509(obj)                  \
-    OBJECT_CHECK(QCryptoTLSCredsX509, (obj), TYPE_QCRYPTO_TLS_CREDS_X509)
+DECLARE_INSTANCE_CHECKER(QCryptoTLSCredsX509, QCRYPTO_TLS_CREDS_X509,
+                         TYPE_QCRYPTO_TLS_CREDS_X509)
 
 typedef struct QCryptoTLSCredsX509Class QCryptoTLSCredsX509Class;
 
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 752b905e14..dc908738c6 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -34,19 +34,13 @@
 #define MAX_PHYS_ADDR            (((hwaddr)1 << MAX_PHYS_ADDR_SPACE_BITS) - 1)
 
 #define TYPE_MEMORY_REGION "qemu:memory-region"
-#define MEMORY_REGION(obj) \
-        OBJECT_CHECK(MemoryRegion, (obj), TYPE_MEMORY_REGION)
+DECLARE_INSTANCE_CHECKER(MemoryRegion, MEMORY_REGION,
+                         TYPE_MEMORY_REGION)
 
 #define TYPE_IOMMU_MEMORY_REGION "qemu:iommu-memory-region"
 typedef struct IOMMUMemoryRegionClass IOMMUMemoryRegionClass;
-#define IOMMU_MEMORY_REGION(obj) \
-        OBJECT_CHECK(IOMMUMemoryRegion, (obj), TYPE_IOMMU_MEMORY_REGION)
-#define IOMMU_MEMORY_REGION_CLASS(klass) \
-        OBJECT_CLASS_CHECK(IOMMUMemoryRegionClass, (klass), \
-                         TYPE_IOMMU_MEMORY_REGION)
-#define IOMMU_MEMORY_REGION_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(IOMMUMemoryRegionClass, (obj), \
-                         TYPE_IOMMU_MEMORY_REGION)
+DECLARE_OBJ_CHECKERS(IOMMUMemoryRegion, IOMMUMemoryRegionClass,
+                     IOMMU_MEMORY_REGION, TYPE_IOMMU_MEMORY_REGION)
 
 extern bool global_dirty_log;
 
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index 4ef44d6fe8..9adf1e4706 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -19,12 +19,8 @@ typedef enum {
 #define TYPE_ACPI_DEVICE_IF "acpi-device-interface"
 
 typedef struct AcpiDeviceIfClass AcpiDeviceIfClass;
-#define ACPI_DEVICE_IF_CLASS(klass) \
-     OBJECT_CLASS_CHECK(AcpiDeviceIfClass, (klass), \
-                        TYPE_ACPI_DEVICE_IF)
-#define ACPI_DEVICE_IF_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(AcpiDeviceIfClass, (obj), \
-                      TYPE_ACPI_DEVICE_IF)
+DECLARE_CLASS_CHECKERS(AcpiDeviceIfClass, ACPI_DEVICE_IF,
+                       TYPE_ACPI_DEVICE_IF)
 #define ACPI_DEVICE_IF(obj) \
      INTERFACE_CHECK(AcpiDeviceIf, (obj), \
                      TYPE_ACPI_DEVICE_IF)
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index 2208f0b939..1be05a3c0f 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -68,8 +68,8 @@
 
 #define TYPE_ACPI_GED "acpi-ged"
 typedef struct AcpiGedState AcpiGedState;
-#define ACPI_GED(obj) \
-    OBJECT_CHECK(AcpiGedState, (obj), TYPE_ACPI_GED)
+DECLARE_INSTANCE_CHECKER(AcpiGedState, ACPI_GED,
+                         TYPE_ACPI_GED)
 
 #define ACPI_GED_EVT_SEL_OFFSET    0x0
 #define ACPI_GED_EVT_SEL_LEN       0x4
diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
index 0286fc0f09..86cd1da605 100644
--- a/include/hw/acpi/vmgenid.h
+++ b/include/hw/acpi/vmgenid.h
@@ -17,7 +17,8 @@
                                        */
 
 typedef struct VmGenIdState VmGenIdState;
-#define VMGENID(obj) OBJECT_CHECK(VmGenIdState, (obj), VMGENID_DEVICE)
+DECLARE_INSTANCE_CHECKER(VmGenIdState, VMGENID,
+                         VMGENID_DEVICE)
 
 struct VmGenIdState {
     DeviceClass parent_obj;
diff --git a/include/hw/adc/stm32f2xx_adc.h b/include/hw/adc/stm32f2xx_adc.h
index 60d4b65570..6a4f8e955b 100644
--- a/include/hw/adc/stm32f2xx_adc.h
+++ b/include/hw/adc/stm32f2xx_adc.h
@@ -60,8 +60,8 @@
 
 #define TYPE_STM32F2XX_ADC "stm32f2xx-adc"
 typedef struct STM32F2XXADCState STM32F2XXADCState;
-#define STM32F2XX_ADC(obj) \
-    OBJECT_CHECK(STM32F2XXADCState, (obj), TYPE_STM32F2XX_ADC)
+DECLARE_INSTANCE_CHECKER(STM32F2XXADCState, STM32F2XX_ADC,
+                         TYPE_STM32F2XX_ADC)
 
 struct STM32F2XXADCState {
     /* <private> */
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 631454f1c7..d13b6cf50f 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -23,7 +23,8 @@
 
 #define TYPE_AW_A10 "allwinner-a10"
 typedef struct AwA10State AwA10State;
-#define AW_A10(obj) OBJECT_CHECK(AwA10State, (obj), TYPE_AW_A10)
+DECLARE_INSTANCE_CHECKER(AwA10State, AW_A10,
+                         TYPE_AW_A10)
 
 struct AwA10State {
     /*< private >*/
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index 5fda95066f..a93e019521 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -107,7 +107,8 @@ enum {
 
 /** Convert input object to Allwinner H3 state object */
 typedef struct AwH3State AwH3State;
-#define AW_H3(obj) OBJECT_CHECK(AwH3State, (obj), TYPE_AW_H3)
+DECLARE_INSTANCE_CHECKER(AwH3State, AW_H3,
+                         TYPE_AW_H3)
 
 /** @} */
 
diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index c820d32ad5..dcb891d9cc 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -17,7 +17,8 @@
 
 #define TYPE_BITBAND "ARM,bitband-memory"
 typedef struct BitBandState BitBandState;
-#define BITBAND(obj) OBJECT_CHECK(BitBandState, (obj), TYPE_BITBAND)
+DECLARE_INSTANCE_CHECKER(BitBandState, BITBAND,
+                         TYPE_BITBAND)
 
 struct BitBandState {
     /*< private >*/
@@ -32,7 +33,8 @@ struct BitBandState {
 
 #define TYPE_ARMV7M "armv7m"
 typedef struct ARMv7MState ARMv7MState;
-#define ARMV7M(obj) OBJECT_CHECK(ARMv7MState, (obj), TYPE_ARMV7M)
+DECLARE_INSTANCE_CHECKER(ARMv7MState, ARMV7M,
+                         TYPE_ARMV7M)
 
 #define ARMV7M_NUM_BITBANDS 2
 
diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 4e5ec37acb..c9747b15fc 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -16,18 +16,14 @@ typedef struct AspeedMachineState AspeedMachineState;
 
 #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
 typedef struct AspeedMachineClass AspeedMachineClass;
-#define ASPEED_MACHINE(obj) \
-    OBJECT_CHECK(AspeedMachineState, (obj), TYPE_ASPEED_MACHINE)
+DECLARE_OBJ_CHECKERS(AspeedMachineState, AspeedMachineClass,
+                     ASPEED_MACHINE, TYPE_ASPEED_MACHINE)
 
 #define ASPEED_MAC0_ON   (1 << 0)
 #define ASPEED_MAC1_ON   (1 << 1)
 #define ASPEED_MAC2_ON   (1 << 2)
 #define ASPEED_MAC3_ON   (1 << 3)
 
-#define ASPEED_MACHINE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(AspeedMachineClass, (klass), TYPE_ASPEED_MACHINE)
-#define ASPEED_MACHINE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(AspeedMachineClass, (obj), TYPE_ASPEED_MACHINE)
 
 struct AspeedMachineClass {
     MachineClass parent_obj;
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 31679ee42e..05c7d53df3 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -66,7 +66,8 @@ typedef struct AspeedSoCState AspeedSoCState;
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
 typedef struct AspeedSoCClass AspeedSoCClass;
-#define ASPEED_SOC(obj) OBJECT_CHECK(AspeedSoCState, (obj), TYPE_ASPEED_SOC)
+DECLARE_OBJ_CHECKERS(AspeedSoCState, AspeedSoCClass,
+                     ASPEED_SOC, TYPE_ASPEED_SOC)
 
 struct AspeedSoCClass {
     DeviceClass parent_class;
@@ -84,10 +85,6 @@ struct AspeedSoCClass {
     uint32_t num_cpus;
 };
 
-#define ASPEED_SOC_CLASS(klass)                                         \
-    OBJECT_CLASS_CHECK(AspeedSoCClass, (klass), TYPE_ASPEED_SOC)
-#define ASPEED_SOC_GET_CLASS(obj)                               \
-    OBJECT_GET_CLASS(AspeedSoCClass, (obj), TYPE_ASPEED_SOC)
 
 enum {
     ASPEED_DEV_IOMEM,
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 67f5a5f8f5..b4d3ae121a 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -33,8 +33,8 @@
 
 #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
 typedef struct BCM2835PeripheralState BCM2835PeripheralState;
-#define BCM2835_PERIPHERALS(obj) \
-    OBJECT_CHECK(BCM2835PeripheralState, (obj), TYPE_BCM2835_PERIPHERALS)
+DECLARE_INSTANCE_CHECKER(BCM2835PeripheralState, BCM2835_PERIPHERALS,
+                         TYPE_BCM2835_PERIPHERALS)
 
 struct BCM2835PeripheralState {
     /*< private >*/
diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index cf22dc96a0..181d9563d0 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -20,7 +20,8 @@
 #define TYPE_BCM283X "bcm283x"
 typedef struct BCM283XClass BCM283XClass;
 typedef struct BCM283XState BCM283XState;
-#define BCM283X(obj) OBJECT_CHECK(BCM283XState, (obj), TYPE_BCM283X)
+DECLARE_OBJ_CHECKERS(BCM283XState, BCM283XClass,
+                     BCM283X, TYPE_BCM283X)
 
 #define BCM283X_NCPUS 4
 
@@ -52,9 +53,5 @@ struct BCM283XClass {
     const BCM283XInfo *info;
 };
 
-#define BCM283X_CLASS(klass) \
-    OBJECT_CLASS_CHECK(BCM283XClass, (klass), TYPE_BCM283X)
-#define BCM283X_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(BCM283XClass, (obj), TYPE_BCM283X)
 
 #endif /* BCM2836_H */
diff --git a/include/hw/arm/digic.h b/include/hw/arm/digic.h
index f77833f6e3..f3ba398914 100644
--- a/include/hw/arm/digic.h
+++ b/include/hw/arm/digic.h
@@ -26,7 +26,8 @@
 #define TYPE_DIGIC "digic"
 
 typedef struct DigicState DigicState;
-#define DIGIC(obj) OBJECT_CHECK(DigicState, (obj), TYPE_DIGIC)
+DECLARE_INSTANCE_CHECKER(DigicState, DIGIC,
+                         TYPE_DIGIC)
 
 #define DIGIC4_NB_TIMERS 3
 
diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 114c594cd2..c2de1dc102 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -106,8 +106,8 @@ struct Exynos4210State {
 typedef struct Exynos4210State Exynos4210State;
 
 #define TYPE_EXYNOS4210_SOC "exynos4210"
-#define EXYNOS4210_SOC(obj) \
-    OBJECT_CHECK(Exynos4210State, obj, TYPE_EXYNOS4210_SOC)
+DECLARE_INSTANCE_CHECKER(Exynos4210State, EXYNOS4210_SOC,
+                         TYPE_EXYNOS4210_SOC)
 
 void exynos4210_write_secondary(ARMCPU *cpu,
         const struct arm_boot_info *info);
diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index 8b4c974f09..e239505724 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -36,7 +36,8 @@
 
 #define TYPE_FSL_IMX25 "fsl,imx25"
 typedef struct FslIMX25State FslIMX25State;
-#define FSL_IMX25(obj) OBJECT_CHECK(FslIMX25State, (obj), TYPE_FSL_IMX25)
+DECLARE_INSTANCE_CHECKER(FslIMX25State, FSL_IMX25,
+                         TYPE_FSL_IMX25)
 
 #define FSL_IMX25_NUM_UARTS 5
 #define FSL_IMX25_NUM_GPTS 4
diff --git a/include/hw/arm/fsl-imx31.h b/include/hw/arm/fsl-imx31.h
index 12368f2c8f..64b4ca07b7 100644
--- a/include/hw/arm/fsl-imx31.h
+++ b/include/hw/arm/fsl-imx31.h
@@ -32,7 +32,8 @@
 
 #define TYPE_FSL_IMX31 "fsl,imx31"
 typedef struct FslIMX31State FslIMX31State;
-#define FSL_IMX31(obj) OBJECT_CHECK(FslIMX31State, (obj), TYPE_FSL_IMX31)
+DECLARE_INSTANCE_CHECKER(FslIMX31State, FSL_IMX31,
+                         TYPE_FSL_IMX31)
 
 #define FSL_IMX31_NUM_UARTS 2
 #define FSL_IMX31_NUM_EPITS 2
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index e66ea1e917..602b9aff36 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -38,7 +38,8 @@
 
 #define TYPE_FSL_IMX6 "fsl,imx6"
 typedef struct FslIMX6State FslIMX6State;
-#define FSL_IMX6(obj) OBJECT_CHECK(FslIMX6State, (obj), TYPE_FSL_IMX6)
+DECLARE_INSTANCE_CHECKER(FslIMX6State, FSL_IMX6,
+                         TYPE_FSL_IMX6)
 
 #define FSL_IMX6_NUM_CPUS 4
 #define FSL_IMX6_NUM_UARTS 5
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index e95c4820c6..e4862fdb2c 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -42,7 +42,8 @@
 
 #define TYPE_FSL_IMX6UL "fsl,imx6ul"
 typedef struct FslIMX6ULState FslIMX6ULState;
-#define FSL_IMX6UL(obj) OBJECT_CHECK(FslIMX6ULState, (obj), TYPE_FSL_IMX6UL)
+DECLARE_INSTANCE_CHECKER(FslIMX6ULState, FSL_IMX6UL,
+                         TYPE_FSL_IMX6UL)
 
 enum FslIMX6ULConfiguration {
     FSL_IMX6UL_NUM_CPUS         = 1,
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 8095e5544b..434d1d0641 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -43,7 +43,8 @@
 
 #define TYPE_FSL_IMX7 "fsl,imx7"
 typedef struct FslIMX7State FslIMX7State;
-#define FSL_IMX7(obj) OBJECT_CHECK(FslIMX7State, (obj), TYPE_FSL_IMX7)
+DECLARE_INSTANCE_CHECKER(FslIMX7State, FSL_IMX7,
+                         TYPE_FSL_IMX7)
 
 enum FslIMX7Configuration {
     FSL_IMX7_NUM_CPUS         = 2,
diff --git a/include/hw/arm/linux-boot-if.h b/include/hw/arm/linux-boot-if.h
index 6d9e13fd36..c85f33b2c5 100644
--- a/include/hw/arm/linux-boot-if.h
+++ b/include/hw/arm/linux-boot-if.h
@@ -10,10 +10,8 @@
 
 #define TYPE_ARM_LINUX_BOOT_IF "arm-linux-boot-if"
 typedef struct ARMLinuxBootIfClass ARMLinuxBootIfClass;
-#define ARM_LINUX_BOOT_IF_CLASS(klass) \
-    OBJECT_CLASS_CHECK(ARMLinuxBootIfClass, (klass), TYPE_ARM_LINUX_BOOT_IF)
-#define ARM_LINUX_BOOT_IF_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(ARMLinuxBootIfClass, (obj), TYPE_ARM_LINUX_BOOT_IF)
+DECLARE_CLASS_CHECKERS(ARMLinuxBootIfClass, ARM_LINUX_BOOT_IF,
+                       TYPE_ARM_LINUX_BOOT_IF)
 #define ARM_LINUX_BOOT_IF(obj) \
     INTERFACE_CHECK(ARMLinuxBootIf, (obj), TYPE_ARM_LINUX_BOOT_IF)
 
diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index b4bc5ef96a..9b93d0d64e 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -34,7 +34,8 @@
 
 #define TYPE_MSF2_SOC     "msf2-soc"
 typedef struct MSF2State MSF2State;
-#define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
+DECLARE_INSTANCE_CHECKER(MSF2State, MSF2_SOC,
+                         TYPE_MSF2_SOC)
 
 #define MSF2_NUM_SPIS         2
 #define MSF2_NUM_UARTS        2
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index 727ac1ae04..b69492b29d 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -21,8 +21,8 @@
 
 #define TYPE_NRF51_SOC "nrf51-soc"
 typedef struct NRF51State NRF51State;
-#define NRF51_SOC(obj) \
-    OBJECT_CHECK(NRF51State, (obj), TYPE_NRF51_SOC)
+DECLARE_INSTANCE_CHECKER(NRF51State, NRF51_SOC,
+                         TYPE_NRF51_SOC)
 
 #define NRF51_NUM_TIMERS 3
 
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 0d365edeec..0dbf1712f4 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -71,8 +71,8 @@ void omap_clk_reparent(omap_clk clk, omap_clk parent);
 /* omap_intc.c */
 #define TYPE_OMAP_INTC "common-omap-intc"
 typedef struct omap_intr_handler_s omap_intr_handler;
-#define OMAP_INTC(obj)                                              \
-    OBJECT_CHECK(omap_intr_handler, (obj), TYPE_OMAP_INTC)
+DECLARE_INSTANCE_CHECKER(omap_intr_handler, OMAP_INTC,
+                         TYPE_OMAP_INTC)
 
 
 /*
@@ -95,7 +95,8 @@ void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
 /* omap_i2c.c */
 #define TYPE_OMAP_I2C "omap_i2c"
 typedef struct OMAPI2CState OMAPI2CState;
-#define OMAP_I2C(obj) OBJECT_CHECK(OMAPI2CState, (obj), TYPE_OMAP_I2C)
+DECLARE_INSTANCE_CHECKER(OMAPI2CState, OMAP_I2C,
+                         TYPE_OMAP_I2C)
 
 
 /* TODO: clock framework (see above) */
@@ -104,12 +105,12 @@ void omap_i2c_set_fclk(OMAPI2CState *i2c, omap_clk clk);
 
 /* omap_gpio.c */
 #define TYPE_OMAP1_GPIO "omap-gpio"
-#define OMAP1_GPIO(obj)                                         \
-    OBJECT_CHECK(struct omap_gpif_s, (obj), TYPE_OMAP1_GPIO)
+DECLARE_INSTANCE_CHECKER(struct omap_gpif_s, OMAP1_GPIO,
+                         TYPE_OMAP1_GPIO)
 
 #define TYPE_OMAP2_GPIO "omap2-gpio"
-#define OMAP2_GPIO(obj)                                         \
-    OBJECT_CHECK(struct omap2_gpif_s, (obj), TYPE_OMAP2_GPIO)
+DECLARE_INSTANCE_CHECKER(struct omap2_gpif_s, OMAP2_GPIO,
+                         TYPE_OMAP2_GPIO)
 
 typedef struct omap_gpif_s omap_gpif;
 typedef struct omap2_gpif_s omap2_gpif;
diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index b2f9a41468..9046876134 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -89,7 +89,8 @@ void pxa2xx_lcd_vsync_notifier(PXA2xxLCDState *s, qemu_irq handler);
 /* pxa2xx_mmci.c */
 #define TYPE_PXA2XX_MMCI "pxa2xx-mmci"
 typedef struct PXA2xxMMCIState PXA2xxMMCIState;
-#define PXA2XX_MMCI(obj) OBJECT_CHECK(PXA2xxMMCIState, (obj), TYPE_PXA2XX_MMCI)
+DECLARE_INSTANCE_CHECKER(PXA2xxMMCIState, PXA2XX_MMCI,
+                         TYPE_PXA2XX_MMCI)
 
 PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
                 hwaddr base,
@@ -100,8 +101,8 @@ void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
 /* pxa2xx_pcmcia.c */
 #define TYPE_PXA2XX_PCMCIA "pxa2xx-pcmcia"
 typedef struct PXA2xxPCMCIAState PXA2xxPCMCIAState;
-#define PXA2XX_PCMCIA(obj) \
-    OBJECT_CHECK(PXA2xxPCMCIAState, obj, TYPE_PXA2XX_PCMCIA)
+DECLARE_INSTANCE_CHECKER(PXA2xxPCMCIAState, PXA2XX_PCMCIA,
+                         TYPE_PXA2XX_PCMCIA)
 
 PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
                                       hwaddr base);
@@ -129,12 +130,13 @@ I2CBus *pxa2xx_i2c_bus(PXA2xxI2CState *s);
 
 #define TYPE_PXA2XX_I2C "pxa2xx_i2c"
 typedef struct PXA2xxI2SState PXA2xxI2SState;
-#define PXA2XX_I2C(obj) \
-    OBJECT_CHECK(PXA2xxI2CState, (obj), TYPE_PXA2XX_I2C)
+DECLARE_INSTANCE_CHECKER(PXA2xxI2CState, PXA2XX_I2C,
+                         TYPE_PXA2XX_I2C)
 
 #define TYPE_PXA2XX_FIR "pxa2xx-fir"
 typedef struct PXA2xxFIrState PXA2xxFIrState;
-#define PXA2XX_FIR(obj) OBJECT_CHECK(PXA2xxFIrState, (obj), TYPE_PXA2XX_FIR)
+DECLARE_INSTANCE_CHECKER(PXA2xxFIrState, PXA2XX_FIR,
+                         TYPE_PXA2XX_FIR)
 
 typedef struct {
     ARMCPU *cpu;
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index b6b51a1cb1..54d0872fd8 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -132,11 +132,8 @@ struct SMMUBaseClass {
 typedef struct SMMUBaseClass SMMUBaseClass;
 
 #define TYPE_ARM_SMMU "arm-smmu"
-#define ARM_SMMU(obj) OBJECT_CHECK(SMMUState, (obj), TYPE_ARM_SMMU)
-#define ARM_SMMU_CLASS(klass)                                    \
-    OBJECT_CLASS_CHECK(SMMUBaseClass, (klass), TYPE_ARM_SMMU)
-#define ARM_SMMU_GET_CLASS(obj)                              \
-    OBJECT_GET_CLASS(SMMUBaseClass, (obj), TYPE_ARM_SMMU)
+DECLARE_OBJ_CHECKERS(SMMUState, SMMUBaseClass,
+                     ARM_SMMU, TYPE_ARM_SMMU)
 
 /* Return the SMMUPciBus handle associated to a PCI bus number */
 SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num);
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index 698b89d234..2a3f6dd197 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -83,10 +83,7 @@ struct SMMUv3Class {
 typedef struct SMMUv3Class SMMUv3Class;
 
 #define TYPE_ARM_SMMUV3   "arm-smmuv3"
-#define ARM_SMMUV3(obj) OBJECT_CHECK(SMMUv3State, (obj), TYPE_ARM_SMMUV3)
-#define ARM_SMMUV3_CLASS(klass)                              \
-    OBJECT_CLASS_CHECK(SMMUv3Class, (klass), TYPE_ARM_SMMUV3)
-#define ARM_SMMUV3_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(SMMUv3Class, (obj), TYPE_ARM_SMMUV3)
+DECLARE_OBJ_CHECKERS(SMMUv3State, SMMUv3Class,
+                     ARM_SMMUV3, TYPE_ARM_SMMUV3)
 
 #endif
diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
index 6d86937e07..9c2f4818a6 100644
--- a/include/hw/arm/stm32f205_soc.h
+++ b/include/hw/arm/stm32f205_soc.h
@@ -36,8 +36,8 @@
 
 #define TYPE_STM32F205_SOC "stm32f205-soc"
 typedef struct STM32F205State STM32F205State;
-#define STM32F205_SOC(obj) \
-    OBJECT_CHECK(STM32F205State, (obj), TYPE_STM32F205_SOC)
+DECLARE_INSTANCE_CHECKER(STM32F205State, STM32F205_SOC,
+                         TYPE_STM32F205_SOC)
 
 #define STM_NUM_USARTS 6
 #define STM_NUM_TIMERS 4
diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
index 8f44fb2046..f1a22763f4 100644
--- a/include/hw/arm/stm32f405_soc.h
+++ b/include/hw/arm/stm32f405_soc.h
@@ -37,8 +37,8 @@
 
 #define TYPE_STM32F405_SOC "stm32f405-soc"
 typedef struct STM32F405State STM32F405State;
-#define STM32F405_SOC(obj) \
-    OBJECT_CHECK(STM32F405State, (obj), TYPE_STM32F405_SOC)
+DECLARE_INSTANCE_CHECKER(STM32F405State, STM32F405_SOC,
+                         TYPE_STM32F405_SOC)
 
 #define STM_NUM_USARTS 7
 #define STM_NUM_TIMERS 4
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 49ad860943..392b0bd571 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -170,12 +170,8 @@ typedef struct VirtMachineState VirtMachineState;
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
 
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
-#define VIRT_MACHINE(obj) \
-    OBJECT_CHECK(VirtMachineState, (obj), TYPE_VIRT_MACHINE)
-#define VIRT_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(VirtMachineClass, obj, TYPE_VIRT_MACHINE)
-#define VIRT_MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
+DECLARE_OBJ_CHECKERS(VirtMachineState, VirtMachineClass,
+                     VIRT_MACHINE, TYPE_VIRT_MACHINE)
 
 void virt_acpi_setup(VirtMachineState *vms);
 bool virt_is_acpi_enabled(VirtMachineState *vms);
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index a960619ec9..eaa9023fd6 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -24,7 +24,8 @@
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 typedef struct Versal Versal;
-#define XLNX_VERSAL(obj) OBJECT_CHECK(Versal, (obj), TYPE_XLNX_VERSAL)
+DECLARE_INSTANCE_CHECKER(Versal, XLNX_VERSAL,
+                         TYPE_XLNX_VERSAL)
 
 #define XLNX_VERSAL_NR_ACPUS   2
 #define XLNX_VERSAL_NR_UARTS   2
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 6a24216abf..4cc97b4610 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -36,8 +36,8 @@
 
 #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
 typedef struct XlnxZynqMPState XlnxZynqMPState;
-#define XLNX_ZYNQMP(obj) OBJECT_CHECK(XlnxZynqMPState, (obj), \
-                                       TYPE_XLNX_ZYNQMP)
+DECLARE_INSTANCE_CHECKER(XlnxZynqMPState, XLNX_ZYNQMP,
+                         TYPE_XLNX_ZYNQMP)
 
 #define XLNX_ZYNQMP_NUM_APU_CPUS 4
 #define XLNX_ZYNQMP_NUM_RPU_CPUS 2
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 9b2fa7e92c..3e26303705 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -10,8 +10,8 @@
 
 #define TYPE_PFLASH_CFI01 "cfi.pflash01"
 typedef struct PFlashCFI01 PFlashCFI01;
-#define PFLASH_CFI01(obj) \
-    OBJECT_CHECK(PFlashCFI01, (obj), TYPE_PFLASH_CFI01)
+DECLARE_INSTANCE_CHECKER(PFlashCFI01, PFLASH_CFI01,
+                         TYPE_PFLASH_CFI01)
 
 
 PFlashCFI01 *pflash_cfi01_register(hwaddr base,
@@ -31,8 +31,8 @@ void pflash_cfi01_legacy_drive(PFlashCFI01 *dev, DriveInfo *dinfo);
 
 #define TYPE_PFLASH_CFI02 "cfi.pflash02"
 typedef struct PFlashCFI02 PFlashCFI02;
-#define PFLASH_CFI02(obj) \
-    OBJECT_CHECK(PFlashCFI02, (obj), TYPE_PFLASH_CFI02)
+DECLARE_INSTANCE_CHECKER(PFlashCFI02, PFLASH_CFI02,
+                         TYPE_PFLASH_CFI02)
 
 
 PFlashCFI02 *pflash_cfi02_register(hwaddr base,
diff --git a/include/hw/block/swim.h b/include/hw/block/swim.h
index f013d634f7..29fccb41f1 100644
--- a/include/hw/block/swim.h
+++ b/include/hw/block/swim.h
@@ -22,7 +22,8 @@ typedef struct SWIMBus SWIMBus;
 typedef struct SWIMCtrl SWIMCtrl;
 
 #define TYPE_SWIM_DRIVE "swim-drive"
-#define SWIM_DRIVE(obj) OBJECT_CHECK(SWIMDrive, (obj), TYPE_SWIM_DRIVE)
+DECLARE_INSTANCE_CHECKER(SWIMDrive, SWIM_DRIVE,
+                         TYPE_SWIM_DRIVE)
 
 struct SWIMDrive {
     DeviceState qdev;
@@ -31,7 +32,8 @@ struct SWIMDrive {
 };
 
 #define TYPE_SWIM_BUS "swim-bus"
-#define SWIM_BUS(obj) OBJECT_CHECK(SWIMBus, (obj), TYPE_SWIM_BUS)
+DECLARE_INSTANCE_CHECKER(SWIMBus, SWIM_BUS,
+                         TYPE_SWIM_BUS)
 
 struct SWIMBus {
     BusState bus;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index bc5b82ad20..795910d01b 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -21,12 +21,8 @@
 
 #define TYPE_MACHINE "machine"
 #undef MACHINE  /* BSD defines it and QEMU does not use it */
-#define MACHINE(obj) \
-    OBJECT_CHECK(MachineState, (obj), TYPE_MACHINE)
-#define MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(MachineClass, (obj), TYPE_MACHINE)
-#define MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(MachineClass, (klass), TYPE_MACHINE)
+DECLARE_OBJ_CHECKERS(MachineState, MachineClass,
+                     MACHINE, TYPE_MACHINE)
 
 extern MachineState *current_machine;
 
diff --git a/include/hw/char/avr_usart.h b/include/hw/char/avr_usart.h
index 67ad345edd..5202f152b0 100644
--- a/include/hw/char/avr_usart.h
+++ b/include/hw/char/avr_usart.h
@@ -59,8 +59,8 @@
 
 #define TYPE_AVR_USART "avr-usart"
 typedef struct AVRUsartState AVRUsartState;
-#define AVR_USART(obj) \
-    OBJECT_CHECK(AVRUsartState, (obj), TYPE_AVR_USART)
+DECLARE_INSTANCE_CHECKER(AVRUsartState, AVR_USART,
+                         TYPE_AVR_USART)
 
 struct AVRUsartState {
     /* <private> */
diff --git a/include/hw/char/bcm2835_aux.h b/include/hw/char/bcm2835_aux.h
index 2647becc52..a08795c47f 100644
--- a/include/hw/char/bcm2835_aux.h
+++ b/include/hw/char/bcm2835_aux.h
@@ -15,7 +15,8 @@
 
 #define TYPE_BCM2835_AUX "bcm2835-aux"
 typedef struct BCM2835AuxState BCM2835AuxState;
-#define BCM2835_AUX(obj) OBJECT_CHECK(BCM2835AuxState, (obj), TYPE_BCM2835_AUX)
+DECLARE_INSTANCE_CHECKER(BCM2835AuxState, BCM2835_AUX,
+                         TYPE_BCM2835_AUX)
 
 #define BCM2835_AUX_RX_FIFO_LEN 8
 
diff --git a/include/hw/char/cadence_uart.h b/include/hw/char/cadence_uart.h
index 3d02d6ef1a..1734f53541 100644
--- a/include/hw/char/cadence_uart.h
+++ b/include/hw/char/cadence_uart.h
@@ -33,8 +33,8 @@
 
 #define TYPE_CADENCE_UART "cadence_uart"
 typedef struct CadenceUARTState CadenceUARTState;
-#define CADENCE_UART(obj) OBJECT_CHECK(CadenceUARTState, (obj), \
-                                       TYPE_CADENCE_UART)
+DECLARE_INSTANCE_CHECKER(CadenceUARTState, CADENCE_UART,
+                         TYPE_CADENCE_UART)
 
 struct CadenceUARTState {
     /*< private >*/
diff --git a/include/hw/char/cmsdk-apb-uart.h b/include/hw/char/cmsdk-apb-uart.h
index 32c0df9df3..2c3869aa16 100644
--- a/include/hw/char/cmsdk-apb-uart.h
+++ b/include/hw/char/cmsdk-apb-uart.h
@@ -19,8 +19,8 @@
 
 #define TYPE_CMSDK_APB_UART "cmsdk-apb-uart"
 typedef struct CMSDKAPBUART CMSDKAPBUART;
-#define CMSDK_APB_UART(obj) OBJECT_CHECK(CMSDKAPBUART, (obj), \
-                                         TYPE_CMSDK_APB_UART)
+DECLARE_INSTANCE_CHECKER(CMSDKAPBUART, CMSDK_APB_UART,
+                         TYPE_CMSDK_APB_UART)
 
 struct CMSDKAPBUART {
     /*< private >*/
diff --git a/include/hw/char/digic-uart.h b/include/hw/char/digic-uart.h
index 7c6ec2a5c5..01d406833d 100644
--- a/include/hw/char/digic-uart.h
+++ b/include/hw/char/digic-uart.h
@@ -24,8 +24,8 @@
 
 #define TYPE_DIGIC_UART "digic-uart"
 typedef struct DigicUartState DigicUartState;
-#define DIGIC_UART(obj) \
-    OBJECT_CHECK(DigicUartState, (obj), TYPE_DIGIC_UART)
+DECLARE_INSTANCE_CHECKER(DigicUartState, DIGIC_UART,
+                         TYPE_DIGIC_UART)
 
 enum {
     R_TX = 0x00,
diff --git a/include/hw/char/escc.h b/include/hw/char/escc.h
index 5de2a39e77..5eaec507da 100644
--- a/include/hw/char/escc.h
+++ b/include/hw/char/escc.h
@@ -12,7 +12,8 @@
 #define ESCC_SIZE 4
 
 typedef struct ESCCState ESCCState;
-#define ESCC(obj) OBJECT_CHECK(ESCCState, (obj), TYPE_ESCC)
+DECLARE_INSTANCE_CHECKER(ESCCState, ESCC,
+                         TYPE_ESCC)
 
 typedef enum {
     escc_chn_a, escc_chn_b,
diff --git a/include/hw/char/ibex_uart.h b/include/hw/char/ibex_uart.h
index ec9fcde8f0..36eb75fc4c 100644
--- a/include/hw/char/ibex_uart.h
+++ b/include/hw/char/ibex_uart.h
@@ -71,8 +71,8 @@ REG32(TIMEOUT_CTRL, 0x2c)
 
 #define TYPE_IBEX_UART "ibex-uart"
 typedef struct IbexUartState IbexUartState;
-#define IBEX_UART(obj) \
-    OBJECT_CHECK(IbexUartState, (obj), TYPE_IBEX_UART)
+DECLARE_INSTANCE_CHECKER(IbexUartState, IBEX_UART,
+                         TYPE_IBEX_UART)
 
 struct IbexUartState {
     /* <private> */
diff --git a/include/hw/char/imx_serial.h b/include/hw/char/imx_serial.h
index bfaf8ec695..200f1ec33a 100644
--- a/include/hw/char/imx_serial.h
+++ b/include/hw/char/imx_serial.h
@@ -24,7 +24,8 @@
 
 #define TYPE_IMX_SERIAL "imx.serial"
 typedef struct IMXSerialState IMXSerialState;
-#define IMX_SERIAL(obj) OBJECT_CHECK(IMXSerialState, (obj), TYPE_IMX_SERIAL)
+DECLARE_INSTANCE_CHECKER(IMXSerialState, IMX_SERIAL,
+                         TYPE_IMX_SERIAL)
 
 #define URXD_CHARRDY    (1<<15)   /* character read is valid */
 #define URXD_ERR        (1<<14)   /* Character has error */
diff --git a/include/hw/char/nrf51_uart.h b/include/hw/char/nrf51_uart.h
index 20560ba6dc..0cf3c4e328 100644
--- a/include/hw/char/nrf51_uart.h
+++ b/include/hw/char/nrf51_uart.h
@@ -21,7 +21,8 @@
 
 #define TYPE_NRF51_UART "nrf51_soc.uart"
 typedef struct NRF51UARTState NRF51UARTState;
-#define NRF51_UART(obj) OBJECT_CHECK(NRF51UARTState, (obj), TYPE_NRF51_UART)
+DECLARE_INSTANCE_CHECKER(NRF51UARTState, NRF51_UART,
+                         TYPE_NRF51_UART)
 
 REG32(UART_STARTRX, 0x000)
 REG32(UART_STOPRX, 0x004)
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index ddbd8ad45b..80de4ecde6 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -23,7 +23,8 @@
 
 #define TYPE_PL011 "pl011"
 typedef struct PL011State PL011State;
-#define PL011(obj) OBJECT_CHECK(PL011State, (obj), TYPE_PL011)
+DECLARE_INSTANCE_CHECKER(PL011State, PL011,
+                         TYPE_PL011)
 
 /* This shares the same struct (and cast macro) as the base pl011 device */
 #define TYPE_PL011_LUMINARY "pl011_luminary"
diff --git a/include/hw/char/renesas_sci.h b/include/hw/char/renesas_sci.h
index 5a5ebfd28c..a4764e3eee 100644
--- a/include/hw/char/renesas_sci.h
+++ b/include/hw/char/renesas_sci.h
@@ -15,7 +15,8 @@
 
 #define TYPE_RENESAS_SCI "renesas-sci"
 typedef struct RSCIState RSCIState;
-#define RSCI(obj) OBJECT_CHECK(RSCIState, (obj), TYPE_RENESAS_SCI)
+DECLARE_INSTANCE_CHECKER(RSCIState, RSCI,
+                         TYPE_RENESAS_SCI)
 
 enum {
     ERI = 0,
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index dbeef43676..264f529a7f 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -104,13 +104,16 @@ extern const MemoryRegionOps serial_io_ops;
 void serial_set_frequency(SerialState *s, uint32_t frequency);
 
 #define TYPE_SERIAL "serial"
-#define SERIAL(s) OBJECT_CHECK(SerialState, (s), TYPE_SERIAL)
+DECLARE_INSTANCE_CHECKER(SerialState, SERIAL,
+                         TYPE_SERIAL)
 
 #define TYPE_SERIAL_MM "serial-mm"
-#define SERIAL_MM(s) OBJECT_CHECK(SerialMM, (s), TYPE_SERIAL_MM)
+DECLARE_INSTANCE_CHECKER(SerialMM, SERIAL_MM,
+                         TYPE_SERIAL_MM)
 
 #define TYPE_SERIAL_IO "serial-io"
-#define SERIAL_IO(s) OBJECT_CHECK(SerialIO, (s), TYPE_SERIAL_IO)
+DECLARE_INSTANCE_CHECKER(SerialIO, SERIAL_IO,
+                         TYPE_SERIAL_IO)
 
 SerialMM *serial_mm_init(MemoryRegion *address_space,
                          hwaddr base, int regshift,
diff --git a/include/hw/char/stm32f2xx_usart.h b/include/hw/char/stm32f2xx_usart.h
index c44faca751..1670c076d4 100644
--- a/include/hw/char/stm32f2xx_usart.h
+++ b/include/hw/char/stm32f2xx_usart.h
@@ -55,8 +55,8 @@
 
 #define TYPE_STM32F2XX_USART "stm32f2xx-usart"
 typedef struct STM32F2XXUsartState STM32F2XXUsartState;
-#define STM32F2XX_USART(obj) \
-    OBJECT_CHECK(STM32F2XXUsartState, (obj), TYPE_STM32F2XX_USART)
+DECLARE_INSTANCE_CHECKER(STM32F2XXUsartState, STM32F2XX_USART,
+                         TYPE_STM32F2XX_USART)
 
 struct STM32F2XXUsartState {
     /* <private> */
diff --git a/include/hw/clock.h b/include/hw/clock.h
index 65cf363dd5..b524509b47 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -19,7 +19,8 @@
 
 #define TYPE_CLOCK "clock"
 typedef struct Clock Clock;
-#define CLOCK(obj) OBJECT_CHECK(Clock, (obj), TYPE_CLOCK)
+DECLARE_INSTANCE_CHECKER(Clock, CLOCK,
+                         TYPE_CLOCK)
 
 typedef void ClockCallback(void *opaque);
 
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5f319b9d22..59ff021228 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -63,8 +63,8 @@ typedef uint64_t vaddr;
 #define CPU(obj) ((CPUState *)(obj))
 
 typedef struct CPUClass CPUClass;
-#define CPU_CLASS(class) OBJECT_CLASS_CHECK(CPUClass, (class), TYPE_CPU)
-#define CPU_GET_CLASS(obj) OBJECT_GET_CLASS(CPUClass, (obj), TYPE_CPU)
+DECLARE_CLASS_CHECKERS(CPUClass, CPU,
+                       TYPE_CPU)
 
 typedef enum MMUAccessType {
     MMU_DATA_LOAD  = 0,
diff --git a/include/hw/core/generic-loader.h b/include/hw/core/generic-loader.h
index f435af1884..8e86532df6 100644
--- a/include/hw/core/generic-loader.h
+++ b/include/hw/core/generic-loader.h
@@ -43,7 +43,7 @@ struct GenericLoaderState {
 typedef struct GenericLoaderState GenericLoaderState;
 
 #define TYPE_GENERIC_LOADER "loader"
-#define GENERIC_LOADER(obj) OBJECT_CHECK(GenericLoaderState, (obj), \
-                                         TYPE_GENERIC_LOADER)
+DECLARE_INSTANCE_CHECKER(GenericLoaderState, GENERIC_LOADER,
+                         TYPE_GENERIC_LOADER)
 
 #endif
diff --git a/include/hw/core/split-irq.h b/include/hw/core/split-irq.h
index 872a39aa4f..76d42b29aa 100644
--- a/include/hw/core/split-irq.h
+++ b/include/hw/core/split-irq.h
@@ -44,7 +44,8 @@
 
 typedef struct SplitIRQ SplitIRQ;
 
-#define SPLIT_IRQ(obj) OBJECT_CHECK(SplitIRQ, (obj), TYPE_SPLIT_IRQ)
+DECLARE_INSTANCE_CHECKER(SplitIRQ, SPLIT_IRQ,
+                         TYPE_SPLIT_IRQ)
 
 struct SplitIRQ {
     DeviceState parent_obj;
diff --git a/include/hw/cpu/a15mpcore.h b/include/hw/cpu/a15mpcore.h
index 01415728d0..58d8ac7415 100644
--- a/include/hw/cpu/a15mpcore.h
+++ b/include/hw/cpu/a15mpcore.h
@@ -28,8 +28,8 @@
 
 #define TYPE_A15MPCORE_PRIV "a15mpcore_priv"
 typedef struct A15MPPrivState A15MPPrivState;
-#define A15MPCORE_PRIV(obj) \
-    OBJECT_CHECK(A15MPPrivState, (obj), TYPE_A15MPCORE_PRIV)
+DECLARE_INSTANCE_CHECKER(A15MPPrivState, A15MPCORE_PRIV,
+                         TYPE_A15MPCORE_PRIV)
 
 struct A15MPPrivState {
     /*< private >*/
diff --git a/include/hw/cpu/a9mpcore.h b/include/hw/cpu/a9mpcore.h
index 1a3b32cc4c..37e5cfce08 100644
--- a/include/hw/cpu/a9mpcore.h
+++ b/include/hw/cpu/a9mpcore.h
@@ -19,8 +19,8 @@
 
 #define TYPE_A9MPCORE_PRIV "a9mpcore_priv"
 typedef struct A9MPPrivState A9MPPrivState;
-#define A9MPCORE_PRIV(obj) \
-    OBJECT_CHECK(A9MPPrivState, (obj), TYPE_A9MPCORE_PRIV)
+DECLARE_INSTANCE_CHECKER(A9MPPrivState, A9MPCORE_PRIV,
+                         TYPE_A9MPCORE_PRIV)
 
 struct A9MPPrivState {
     /*< private >*/
diff --git a/include/hw/cpu/arm11mpcore.h b/include/hw/cpu/arm11mpcore.h
index 5a5575b86d..411d7e6659 100644
--- a/include/hw/cpu/arm11mpcore.h
+++ b/include/hw/cpu/arm11mpcore.h
@@ -18,8 +18,8 @@
 
 #define TYPE_ARM11MPCORE_PRIV "arm11mpcore_priv"
 typedef struct ARM11MPCorePriveState ARM11MPCorePriveState;
-#define ARM11MPCORE_PRIV(obj) \
-    OBJECT_CHECK(ARM11MPCorePriveState, (obj), TYPE_ARM11MPCORE_PRIV)
+DECLARE_INSTANCE_CHECKER(ARM11MPCorePriveState, ARM11MPCORE_PRIV,
+                         TYPE_ARM11MPCORE_PRIV)
 
 struct ARM11MPCorePriveState {
     SysBusDevice parent_obj;
diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index faacf9757e..1c807c5902 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -56,8 +56,8 @@
 
 #define TYPE_CPU_CLUSTER "cpu-cluster"
 typedef struct CPUClusterState CPUClusterState;
-#define CPU_CLUSTER(obj) \
-    OBJECT_CHECK(CPUClusterState, (obj), TYPE_CPU_CLUSTER)
+DECLARE_INSTANCE_CHECKER(CPUClusterState, CPU_CLUSTER,
+                         TYPE_CPU_CLUSTER)
 
 /*
  * This limit is imposed by TCG, which puts the cluster ID into an
diff --git a/include/hw/cpu/core.h b/include/hw/cpu/core.h
index 850191527e..61ea3481f8 100644
--- a/include/hw/cpu/core.h
+++ b/include/hw/cpu/core.h
@@ -15,8 +15,8 @@
 #define TYPE_CPU_CORE "cpu-core"
 
 typedef struct CPUCore CPUCore;
-#define CPU_CORE(obj) \
-    OBJECT_CHECK(CPUCore, (obj), TYPE_CPU_CORE)
+DECLARE_INSTANCE_CHECKER(CPUCore, CPU_CORE,
+                         TYPE_CPU_CORE)
 
 struct CPUCore {
     /*< private >*/
diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_fb.h
index 5fc4d74a06..226d77a264 100644
--- a/include/hw/display/bcm2835_fb.h
+++ b/include/hw/display/bcm2835_fb.h
@@ -18,7 +18,8 @@
 
 #define TYPE_BCM2835_FB "bcm2835-fb"
 typedef struct BCM2835FBState BCM2835FBState;
-#define BCM2835_FB(obj) OBJECT_CHECK(BCM2835FBState, (obj), TYPE_BCM2835_FB)
+DECLARE_INSTANCE_CHECKER(BCM2835FBState, BCM2835_FB,
+                         TYPE_BCM2835_FB)
 
 /*
  * Configuration information about the fb which the guest can program
diff --git a/include/hw/display/dpcd.h b/include/hw/display/dpcd.h
index 6b96a463a7..09304dd1f6 100644
--- a/include/hw/display/dpcd.h
+++ b/include/hw/display/dpcd.h
@@ -29,7 +29,8 @@
 typedef struct DPCDState DPCDState;
 
 #define TYPE_DPCD "dpcd"
-#define DPCD(obj) OBJECT_CHECK(DPCDState, (obj), TYPE_DPCD)
+DECLARE_INSTANCE_CHECKER(DPCDState, DPCD,
+                         TYPE_DPCD)
 
 /* DCPD Revision. */
 #define DPCD_REVISION                           0x00
diff --git a/include/hw/display/i2c-ddc.h b/include/hw/display/i2c-ddc.h
index 8ab50641aa..fbabfea5a9 100644
--- a/include/hw/display/i2c-ddc.h
+++ b/include/hw/display/i2c-ddc.h
@@ -37,6 +37,7 @@ struct I2CDDCState {
 typedef struct I2CDDCState I2CDDCState;
 
 #define TYPE_I2CDDC "i2c-ddc"
-#define I2CDDC(obj) OBJECT_CHECK(I2CDDCState, (obj), TYPE_I2CDDC)
+DECLARE_INSTANCE_CHECKER(I2CDDCState, I2CDDC,
+                         TYPE_I2CDDC)
 
 #endif /* I2C_DDC_H */
diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
index d330ee9823..f317fe93d9 100644
--- a/include/hw/display/macfb.h
+++ b/include/hw/display/macfb.h
@@ -33,8 +33,8 @@ typedef struct MacfbState {
 
 #define TYPE_MACFB "sysbus-macfb"
 typedef struct MacfbSysBusState MacfbSysBusState;
-#define MACFB(obj) \
-    OBJECT_CHECK(MacfbSysBusState, (obj), TYPE_MACFB)
+DECLARE_INSTANCE_CHECKER(MacfbSysBusState, MACFB,
+                         TYPE_MACFB)
 
 struct MacfbSysBusState {
     SysBusDevice busdev;
diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index f76bde2e77..3b7d9e5a2a 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -106,6 +106,7 @@ struct XlnxDPState {
 typedef struct XlnxDPState XlnxDPState;
 
 #define TYPE_XLNX_DP "xlnx.v-dp"
-#define XLNX_DP(obj) OBJECT_CHECK(XlnxDPState, (obj), TYPE_XLNX_DP)
+DECLARE_INSTANCE_CHECKER(XlnxDPState, XLNX_DP,
+                         TYPE_XLNX_DP)
 
 #endif
diff --git a/include/hw/dma/bcm2835_dma.h b/include/hw/dma/bcm2835_dma.h
index 31f335ec5b..b94dae779a 100644
--- a/include/hw/dma/bcm2835_dma.h
+++ b/include/hw/dma/bcm2835_dma.h
@@ -27,8 +27,8 @@ typedef struct {
 
 #define TYPE_BCM2835_DMA "bcm2835-dma"
 typedef struct BCM2835DMAState BCM2835DMAState;
-#define BCM2835_DMA(obj) \
-        OBJECT_CHECK(BCM2835DMAState, (obj), TYPE_BCM2835_DMA)
+DECLARE_INSTANCE_CHECKER(BCM2835DMAState, BCM2835_DMA,
+                         TYPE_BCM2835_DMA)
 
 #define BCM2835_DMA_NCHANS 16
 
diff --git a/include/hw/dma/i8257.h b/include/hw/dma/i8257.h
index 46eef1f581..362ce7b8dc 100644
--- a/include/hw/dma/i8257.h
+++ b/include/hw/dma/i8257.h
@@ -7,8 +7,8 @@
 
 #define TYPE_I8257 "i8257"
 typedef struct I8257State I8257State;
-#define I8257(obj) \
-    OBJECT_CHECK(I8257State, (obj), TYPE_I8257)
+DECLARE_INSTANCE_CHECKER(I8257State, I8257,
+                         TYPE_I8257)
 
 typedef struct I8257Regs {
     int now[2];
diff --git a/include/hw/dma/pl080.h b/include/hw/dma/pl080.h
index 55a645b055..e9669bf5ae 100644
--- a/include/hw/dma/pl080.h
+++ b/include/hw/dma/pl080.h
@@ -44,7 +44,8 @@ typedef struct {
 #define TYPE_PL080 "pl080"
 #define TYPE_PL081 "pl081"
 typedef struct PL080State PL080State;
-#define PL080(obj) OBJECT_CHECK(PL080State, (obj), TYPE_PL080)
+DECLARE_INSTANCE_CHECKER(PL080State, PL080,
+                         TYPE_PL080)
 
 struct PL080State {
     SysBusDevice parent_obj;
diff --git a/include/hw/dma/xlnx-zdma.h b/include/hw/dma/xlnx-zdma.h
index 8be9ee5cc2..f638abe568 100644
--- a/include/hw/dma/xlnx-zdma.h
+++ b/include/hw/dma/xlnx-zdma.h
@@ -80,7 +80,7 @@ typedef struct XlnxZDMA XlnxZDMA;
 
 #define TYPE_XLNX_ZDMA "xlnx.zdma"
 
-#define XLNX_ZDMA(obj) \
-     OBJECT_CHECK(XlnxZDMA, (obj), TYPE_XLNX_ZDMA)
+DECLARE_INSTANCE_CHECKER(XlnxZDMA, XLNX_ZDMA,
+                         TYPE_XLNX_ZDMA)
 
 #endif /* XLNX_ZDMA_H */
diff --git a/include/hw/dma/xlnx-zynq-devcfg.h b/include/hw/dma/xlnx-zynq-devcfg.h
index 52ba61b653..e16b08f9c5 100644
--- a/include/hw/dma/xlnx-zynq-devcfg.h
+++ b/include/hw/dma/xlnx-zynq-devcfg.h
@@ -34,8 +34,8 @@
 #define TYPE_XLNX_ZYNQ_DEVCFG "xlnx.ps7-dev-cfg"
 
 typedef struct XlnxZynqDevcfg XlnxZynqDevcfg;
-#define XLNX_ZYNQ_DEVCFG(obj) \
-    OBJECT_CHECK(XlnxZynqDevcfg, (obj), TYPE_XLNX_ZYNQ_DEVCFG)
+DECLARE_INSTANCE_CHECKER(XlnxZynqDevcfg, XLNX_ZYNQ_DEVCFG,
+                         TYPE_XLNX_ZYNQ_DEVCFG)
 
 #define XLNX_ZYNQ_DEVCFG_R_MAX (0x100 / 4)
 
diff --git a/include/hw/dma/xlnx_dpdma.h b/include/hw/dma/xlnx_dpdma.h
index 50952dd7ce..94b01cad0a 100644
--- a/include/hw/dma/xlnx_dpdma.h
+++ b/include/hw/dma/xlnx_dpdma.h
@@ -46,7 +46,8 @@ struct XlnxDPDMAState {
 typedef struct XlnxDPDMAState XlnxDPDMAState;
 
 #define TYPE_XLNX_DPDMA "xlnx.dpdma"
-#define XLNX_DPDMA(obj) OBJECT_CHECK(XlnxDPDMAState, (obj), TYPE_XLNX_DPDMA)
+DECLARE_INSTANCE_CHECKER(XlnxDPDMAState, XLNX_DPDMA,
+                         TYPE_XLNX_DPDMA)
 
 /*
  * xlnx_dpdma_start_operation: Start the operation on the specified channel. The
diff --git a/include/hw/fw-path-provider.h b/include/hw/fw-path-provider.h
index 1231cca63b..8e1d45651c 100644
--- a/include/hw/fw-path-provider.h
+++ b/include/hw/fw-path-provider.h
@@ -23,10 +23,8 @@
 #define TYPE_FW_PATH_PROVIDER "fw-path-provider"
 
 typedef struct FWPathProviderClass FWPathProviderClass;
-#define FW_PATH_PROVIDER_CLASS(klass) \
-     OBJECT_CLASS_CHECK(FWPathProviderClass, (klass), TYPE_FW_PATH_PROVIDER)
-#define FW_PATH_PROVIDER_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(FWPathProviderClass, (obj), TYPE_FW_PATH_PROVIDER)
+DECLARE_CLASS_CHECKERS(FWPathProviderClass, FW_PATH_PROVIDER,
+                       TYPE_FW_PATH_PROVIDER)
 #define FW_PATH_PROVIDER(obj) \
      INTERFACE_CHECK(FWPathProvider, (obj), TYPE_FW_PATH_PROVIDER)
 
diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index 4dc0bc3f3d..2582e6e0dc 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -16,11 +16,8 @@
 #define TYPE_ASPEED_GPIO "aspeed.gpio"
 typedef struct AspeedGPIOClass AspeedGPIOClass;
 typedef struct AspeedGPIOState AspeedGPIOState;
-#define ASPEED_GPIO(obj) OBJECT_CHECK(AspeedGPIOState, (obj), TYPE_ASPEED_GPIO)
-#define ASPEED_GPIO_CLASS(klass) \
-     OBJECT_CLASS_CHECK(AspeedGPIOClass, (klass), TYPE_ASPEED_GPIO)
-#define ASPEED_GPIO_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(AspeedGPIOClass, (obj), TYPE_ASPEED_GPIO)
+DECLARE_OBJ_CHECKERS(AspeedGPIOState, AspeedGPIOClass,
+                     ASPEED_GPIO, TYPE_ASPEED_GPIO)
 
 #define ASPEED_GPIO_MAX_NR_SETS 8
 #define ASPEED_REGS_PER_BANK 14
diff --git a/include/hw/gpio/bcm2835_gpio.h b/include/hw/gpio/bcm2835_gpio.h
index d8268f1461..e06e08a0fe 100644
--- a/include/hw/gpio/bcm2835_gpio.h
+++ b/include/hw/gpio/bcm2835_gpio.h
@@ -36,7 +36,7 @@ struct BCM2835GpioState {
 typedef struct BCM2835GpioState BCM2835GpioState;
 
 #define TYPE_BCM2835_GPIO "bcm2835_gpio"
-#define BCM2835_GPIO(obj) \
-    OBJECT_CHECK(BCM2835GpioState, (obj), TYPE_BCM2835_GPIO)
+DECLARE_INSTANCE_CHECKER(BCM2835GpioState, BCM2835_GPIO,
+                         TYPE_BCM2835_GPIO)
 
 #endif
diff --git a/include/hw/gpio/imx_gpio.h b/include/hw/gpio/imx_gpio.h
index b7dc689f73..a72b272ace 100644
--- a/include/hw/gpio/imx_gpio.h
+++ b/include/hw/gpio/imx_gpio.h
@@ -25,7 +25,8 @@
 
 #define TYPE_IMX_GPIO "imx.gpio"
 typedef struct IMXGPIOState IMXGPIOState;
-#define IMX_GPIO(obj) OBJECT_CHECK(IMXGPIOState, (obj), TYPE_IMX_GPIO)
+DECLARE_INSTANCE_CHECKER(IMXGPIOState, IMX_GPIO,
+                         TYPE_IMX_GPIO)
 
 #define IMX_GPIO_MEM_SIZE 0x20
 
diff --git a/include/hw/gpio/nrf51_gpio.h b/include/hw/gpio/nrf51_gpio.h
index 0c37dd74c0..55d7d24a52 100644
--- a/include/hw/gpio/nrf51_gpio.h
+++ b/include/hw/gpio/nrf51_gpio.h
@@ -30,7 +30,8 @@
 #include "qom/object.h"
 #define TYPE_NRF51_GPIO "nrf51_soc.gpio"
 typedef struct NRF51GPIOState NRF51GPIOState;
-#define NRF51_GPIO(obj) OBJECT_CHECK(NRF51GPIOState, (obj), TYPE_NRF51_GPIO)
+DECLARE_INSTANCE_CHECKER(NRF51GPIOState, NRF51_GPIO,
+                         TYPE_NRF51_GPIO)
 
 #define NRF51_GPIO_PINS 32
 
diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
index 6536bb01a3..e15f59c8b3 100644
--- a/include/hw/hotplug.h
+++ b/include/hw/hotplug.h
@@ -17,10 +17,8 @@
 #define TYPE_HOTPLUG_HANDLER "hotplug-handler"
 
 typedef struct HotplugHandlerClass HotplugHandlerClass;
-#define HOTPLUG_HANDLER_CLASS(klass) \
-     OBJECT_CLASS_CHECK(HotplugHandlerClass, (klass), TYPE_HOTPLUG_HANDLER)
-#define HOTPLUG_HANDLER_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(HotplugHandlerClass, (obj), TYPE_HOTPLUG_HANDLER)
+DECLARE_CLASS_CHECKERS(HotplugHandlerClass, HOTPLUG_HANDLER,
+                       TYPE_HOTPLUG_HANDLER)
 #define HOTPLUG_HANDLER(obj) \
      INTERFACE_CHECK(HotplugHandler, (obj), TYPE_HOTPLUG_HANDLER)
 
diff --git a/include/hw/hyperv/vmbus-bridge.h b/include/hw/hyperv/vmbus-bridge.h
index d090d46651..1324873775 100644
--- a/include/hw/hyperv/vmbus-bridge.h
+++ b/include/hw/hyperv/vmbus-bridge.h
@@ -25,7 +25,8 @@ struct VMBusBridge {
 };
 typedef struct VMBusBridge VMBusBridge;
 
-#define VMBUS_BRIDGE(obj) OBJECT_CHECK(VMBusBridge, (obj), TYPE_VMBUS_BRIDGE)
+DECLARE_INSTANCE_CHECKER(VMBusBridge, VMBUS_BRIDGE,
+                         TYPE_VMBUS_BRIDGE)
 
 static inline VMBusBridge *vmbus_bridge_find(void)
 {
diff --git a/include/hw/hyperv/vmbus.h b/include/hw/hyperv/vmbus.h
index 282399b8ce..0fe3d3b47c 100644
--- a/include/hw/hyperv/vmbus.h
+++ b/include/hw/hyperv/vmbus.h
@@ -22,16 +22,13 @@
 
 typedef struct VMBusDevice VMBusDevice;
 typedef struct VMBusDeviceClass VMBusDeviceClass;
-#define VMBUS_DEVICE(obj) \
-    OBJECT_CHECK(VMBusDevice, (obj), TYPE_VMBUS_DEVICE)
-#define VMBUS_DEVICE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(VMBusDeviceClass, (klass), TYPE_VMBUS_DEVICE)
-#define VMBUS_DEVICE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(VMBusDeviceClass, (obj), TYPE_VMBUS_DEVICE)
+DECLARE_OBJ_CHECKERS(VMBusDevice, VMBusDeviceClass,
+                     VMBUS_DEVICE, TYPE_VMBUS_DEVICE)
 
 #define TYPE_VMBUS "vmbus"
 typedef struct VMBus VMBus;
-#define VMBUS(obj) OBJECT_CHECK(VMBus, (obj), TYPE_VMBUS)
+DECLARE_INSTANCE_CHECKER(VMBus, VMBUS,
+                         TYPE_VMBUS)
 
 /*
  * Object wrapping a GPADL -- GPA Descriptor List -- an array of guest physical
diff --git a/include/hw/i2c/arm_sbcon_i2c.h b/include/hw/i2c/arm_sbcon_i2c.h
index ca54867964..ad96781e7a 100644
--- a/include/hw/i2c/arm_sbcon_i2c.h
+++ b/include/hw/i2c/arm_sbcon_i2c.h
@@ -20,8 +20,8 @@
 #define TYPE_ARM_SBCON_I2C TYPE_VERSATILE_I2C
 
 typedef struct ArmSbconI2CState ArmSbconI2CState;
-#define ARM_SBCON_I2C(obj) \
-    OBJECT_CHECK(ArmSbconI2CState, (obj), TYPE_ARM_SBCON_I2C)
+DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, ARM_SBCON_I2C,
+                         TYPE_ARM_SBCON_I2C)
 
 struct ArmSbconI2CState {
     /*< private >*/
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 2c0198e314..695e1c0928 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -31,8 +31,8 @@
 #define TYPE_ASPEED_2600_I2C TYPE_ASPEED_I2C "-ast2600"
 typedef struct AspeedI2CClass AspeedI2CClass;
 typedef struct AspeedI2CState AspeedI2CState;
-#define ASPEED_I2C(obj) \
-    OBJECT_CHECK(AspeedI2CState, (obj), TYPE_ASPEED_I2C)
+DECLARE_OBJ_CHECKERS(AspeedI2CState, AspeedI2CClass,
+                     ASPEED_I2C, TYPE_ASPEED_I2C)
 
 #define ASPEED_I2C_NR_BUSSES 16
 #define ASPEED_I2C_MAX_POOL_SIZE 0x800
@@ -75,10 +75,6 @@ struct AspeedI2CState {
     AddressSpace dram_as;
 };
 
-#define ASPEED_I2C_CLASS(klass) \
-     OBJECT_CLASS_CHECK(AspeedI2CClass, (klass), TYPE_ASPEED_I2C)
-#define ASPEED_I2C_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(AspeedI2CClass, (obj), TYPE_ASPEED_I2C)
 
 struct AspeedI2CClass {
     SysBusDeviceClass parent_class;
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index bf501b9ac4..8afa74f42e 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -20,12 +20,8 @@ typedef struct I2CSlave I2CSlave;
 
 #define TYPE_I2C_SLAVE "i2c-slave"
 typedef struct I2CSlaveClass I2CSlaveClass;
-#define I2C_SLAVE(obj) \
-     OBJECT_CHECK(I2CSlave, (obj), TYPE_I2C_SLAVE)
-#define I2C_SLAVE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(I2CSlaveClass, (klass), TYPE_I2C_SLAVE)
-#define I2C_SLAVE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(I2CSlaveClass, (obj), TYPE_I2C_SLAVE)
+DECLARE_OBJ_CHECKERS(I2CSlave, I2CSlaveClass,
+                     I2C_SLAVE, TYPE_I2C_SLAVE)
 
 struct I2CSlaveClass {
     DeviceClass parent_class;
@@ -55,7 +51,8 @@ struct I2CSlave {
 };
 
 #define TYPE_I2C_BUS "i2c-bus"
-#define I2C_BUS(obj) OBJECT_CHECK(I2CBus, (obj), TYPE_I2C_BUS)
+DECLARE_INSTANCE_CHECKER(I2CBus, I2C_BUS,
+                         TYPE_I2C_BUS)
 
 typedef struct I2CNode I2CNode;
 
diff --git a/include/hw/i2c/imx_i2c.h b/include/hw/i2c/imx_i2c.h
index 285a8f40a4..e7f09104cf 100644
--- a/include/hw/i2c/imx_i2c.h
+++ b/include/hw/i2c/imx_i2c.h
@@ -26,7 +26,8 @@
 
 #define TYPE_IMX_I2C "imx.i2c"
 typedef struct IMXI2CState IMXI2CState;
-#define IMX_I2C(obj) OBJECT_CHECK(IMXI2CState, (obj), TYPE_IMX_I2C)
+DECLARE_INSTANCE_CHECKER(IMXI2CState, IMX_I2C,
+                         TYPE_IMX_I2C)
 
 #define IMX_I2C_MEM_SIZE           0x14
 
diff --git a/include/hw/i2c/microbit_i2c.h b/include/hw/i2c/microbit_i2c.h
index 76ffaff47a..69d70287d7 100644
--- a/include/hw/i2c/microbit_i2c.h
+++ b/include/hw/i2c/microbit_i2c.h
@@ -28,8 +28,8 @@
 
 #define TYPE_MICROBIT_I2C "microbit.i2c"
 typedef struct MicrobitI2CState MicrobitI2CState;
-#define MICROBIT_I2C(obj) \
-    OBJECT_CHECK(MicrobitI2CState, (obj), TYPE_MICROBIT_I2C)
+DECLARE_INSTANCE_CHECKER(MicrobitI2CState, MICROBIT_I2C,
+                         TYPE_MICROBIT_I2C)
 
 #define MICROBIT_I2C_NREGS (NRF51_PERIPHERAL_SIZE / sizeof(uint32_t))
 
diff --git a/include/hw/i2c/ppc4xx_i2c.h b/include/hw/i2c/ppc4xx_i2c.h
index 3698e054b1..7cbcdaf12f 100644
--- a/include/hw/i2c/ppc4xx_i2c.h
+++ b/include/hw/i2c/ppc4xx_i2c.h
@@ -33,7 +33,8 @@
 
 #define TYPE_PPC4xx_I2C "ppc4xx-i2c"
 typedef struct PPC4xxI2CState PPC4xxI2CState;
-#define PPC4xx_I2C(obj) OBJECT_CHECK(PPC4xxI2CState, (obj), TYPE_PPC4xx_I2C)
+DECLARE_INSTANCE_CHECKER(PPC4xxI2CState, PPC4xx_I2C,
+                         TYPE_PPC4xx_I2C)
 
 struct PPC4xxI2CState {
     /*< private >*/
diff --git a/include/hw/i2c/smbus_slave.h b/include/hw/i2c/smbus_slave.h
index 17f2cd2d8d..8d16e4bcd9 100644
--- a/include/hw/i2c/smbus_slave.h
+++ b/include/hw/i2c/smbus_slave.h
@@ -31,12 +31,8 @@
 #define TYPE_SMBUS_DEVICE "smbus-device"
 typedef struct SMBusDevice SMBusDevice;
 typedef struct SMBusDeviceClass SMBusDeviceClass;
-#define SMBUS_DEVICE(obj) \
-     OBJECT_CHECK(SMBusDevice, (obj), TYPE_SMBUS_DEVICE)
-#define SMBUS_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(SMBusDeviceClass, (klass), TYPE_SMBUS_DEVICE)
-#define SMBUS_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(SMBusDeviceClass, (obj), TYPE_SMBUS_DEVICE)
+DECLARE_OBJ_CHECKERS(SMBusDevice, SMBusDeviceClass,
+                     SMBUS_DEVICE, TYPE_SMBUS_DEVICE)
 
 
 struct SMBusDeviceClass {
diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
index 124f1fad6f..da38541627 100644
--- a/include/hw/i386/apic_internal.h
+++ b/include/hw/i386/apic_internal.h
@@ -127,12 +127,8 @@ typedef struct APICCommonState APICCommonState;
 
 #define TYPE_APIC_COMMON "apic-common"
 typedef struct APICCommonClass APICCommonClass;
-#define APIC_COMMON(obj) \
-     OBJECT_CHECK(APICCommonState, (obj), TYPE_APIC_COMMON)
-#define APIC_COMMON_CLASS(klass) \
-     OBJECT_CLASS_CHECK(APICCommonClass, (klass), TYPE_APIC_COMMON)
-#define APIC_COMMON_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(APICCommonClass, (obj), TYPE_APIC_COMMON)
+DECLARE_OBJ_CHECKERS(APICCommonState, APICCommonClass,
+                     APIC_COMMON, TYPE_APIC_COMMON)
 
 struct APICCommonClass {
     DeviceClass parent_class;
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 8fdac227f2..e750d67975 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -25,8 +25,8 @@ void ich9_generate_smi(void);
 
 #define TYPE_ICH9_LPC_DEVICE "ICH9-LPC"
 typedef struct ICH9LPCState ICH9LPCState;
-#define ICH9_LPC_DEVICE(obj) \
-     OBJECT_CHECK(ICH9LPCState, (obj), TYPE_ICH9_LPC_DEVICE)
+DECLARE_INSTANCE_CHECKER(ICH9LPCState, ICH9_LPC_DEVICE,
+                         TYPE_ICH9_LPC_DEVICE)
 
 struct ICH9LPCState {
     /* ICH9 LPC PCI to ISA bridge */
diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index 53e5d32d54..98cfc77723 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -28,8 +28,8 @@
 
 #define TYPE_INTEL_IOMMU_DEVICE "intel-iommu"
 typedef struct IntelIOMMUState IntelIOMMUState;
-#define INTEL_IOMMU_DEVICE(obj) \
-     OBJECT_CHECK(IntelIOMMUState, (obj), TYPE_INTEL_IOMMU_DEVICE)
+DECLARE_INSTANCE_CHECKER(IntelIOMMUState, INTEL_IOMMU_DEVICE,
+                         TYPE_INTEL_IOMMU_DEVICE)
 
 #define TYPE_INTEL_IOMMU_MEMORY_REGION "intel-iommu-iommu-memory-region"
 
diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
index 29ae150727..e9cc2eaf54 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -86,12 +86,8 @@ typedef struct IOAPICCommonState IOAPICCommonState;
 
 #define TYPE_IOAPIC_COMMON "ioapic-common"
 typedef struct IOAPICCommonClass IOAPICCommonClass;
-#define IOAPIC_COMMON(obj) \
-     OBJECT_CHECK(IOAPICCommonState, (obj), TYPE_IOAPIC_COMMON)
-#define IOAPIC_COMMON_CLASS(klass) \
-     OBJECT_CLASS_CHECK(IOAPICCommonClass, (klass), TYPE_IOAPIC_COMMON)
-#define IOAPIC_COMMON_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(IOAPICCommonClass, (obj), TYPE_IOAPIC_COMMON)
+DECLARE_OBJ_CHECKERS(IOAPICCommonState, IOAPICCommonClass,
+                     IOAPIC_COMMON, TYPE_IOAPIC_COMMON)
 
 struct IOAPICCommonClass {
     SysBusDeviceClass parent_class;
diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index 0556f64206..36dbcdd123 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -64,11 +64,7 @@ struct MicrovmMachineState {
 typedef struct MicrovmMachineState MicrovmMachineState;
 
 #define TYPE_MICROVM_MACHINE   MACHINE_TYPE_NAME("microvm")
-#define MICROVM_MACHINE(obj) \
-    OBJECT_CHECK(MicrovmMachineState, (obj), TYPE_MICROVM_MACHINE)
-#define MICROVM_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(MicrovmMachineClass, obj, TYPE_MICROVM_MACHINE)
-#define MICROVM_MACHINE_CLASS(class) \
-    OBJECT_CLASS_CHECK(MicrovmMachineClass, class, TYPE_MICROVM_MACHINE)
+DECLARE_OBJ_CHECKERS(MicrovmMachineState, MicrovmMachineClass,
+                     MICROVM_MACHINE, TYPE_MICROVM_MACHINE)
 
 #endif
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 602b57dc5d..421a77acc2 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -123,12 +123,8 @@ struct PCMachineClass {
 typedef struct PCMachineClass PCMachineClass;
 
 #define TYPE_PC_MACHINE "generic-pc-machine"
-#define PC_MACHINE(obj) \
-    OBJECT_CHECK(PCMachineState, (obj), TYPE_PC_MACHINE)
-#define PC_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(PCMachineClass, (obj), TYPE_PC_MACHINE)
-#define PC_MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(PCMachineClass, (klass), TYPE_PC_MACHINE)
+DECLARE_OBJ_CHECKERS(PCMachineState, PCMachineClass,
+                     PC_MACHINE, TYPE_PC_MACHINE)
 
 /* ioapic.c */
 
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 7084bb24e6..f2319862ae 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -86,12 +86,8 @@ typedef struct X86MachineState X86MachineState;
 #define X86_MACHINE_ACPI             "acpi"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
-#define X86_MACHINE(obj) \
-    OBJECT_CHECK(X86MachineState, (obj), TYPE_X86_MACHINE)
-#define X86_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(X86MachineClass, obj, TYPE_X86_MACHINE)
-#define X86_MACHINE_CLASS(class) \
-    OBJECT_CLASS_CHECK(X86MachineClass, class, TYPE_X86_MACHINE)
+DECLARE_OBJ_CHECKERS(X86MachineState, X86MachineClass,
+                     X86_MACHINE, TYPE_X86_MACHINE)
 
 void init_topo_info(X86CPUTopoInfo *topo_info, const X86MachineState *x86ms);
 
diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
index 110269f152..4cf6813d80 100644
--- a/include/hw/ide/ahci.h
+++ b/include/hw/ide/ahci.h
@@ -54,15 +54,16 @@ typedef struct AHCIState {
 typedef struct AHCIPCIState AHCIPCIState;
 
 #define TYPE_ICH9_AHCI "ich9-ahci"
-#define ICH_AHCI(obj) \
-    OBJECT_CHECK(AHCIPCIState, (obj), TYPE_ICH9_AHCI)
+DECLARE_INSTANCE_CHECKER(AHCIPCIState, ICH_AHCI,
+                         TYPE_ICH9_AHCI)
 
 int32_t ahci_get_num_ports(PCIDevice *dev);
 void ahci_ide_create_devs(PCIDevice *dev, DriveInfo **hd);
 
 #define TYPE_SYSBUS_AHCI "sysbus-ahci"
 typedef struct SysbusAHCIState SysbusAHCIState;
-#define SYSBUS_AHCI(obj) OBJECT_CHECK(SysbusAHCIState, (obj), TYPE_SYSBUS_AHCI)
+DECLARE_INSTANCE_CHECKER(SysbusAHCIState, SYSBUS_AHCI,
+                         TYPE_SYSBUS_AHCI)
 
 struct SysbusAHCIState {
     /*< private >*/
@@ -75,8 +76,8 @@ struct SysbusAHCIState {
 
 #define TYPE_ALLWINNER_AHCI "allwinner-ahci"
 typedef struct AllwinnerAHCIState AllwinnerAHCIState;
-#define ALLWINNER_AHCI(obj) \
-        OBJECT_CHECK(AllwinnerAHCIState, (obj), TYPE_ALLWINNER_AHCI)
+DECLARE_INSTANCE_CHECKER(AllwinnerAHCIState, ALLWINNER_AHCI,
+                         TYPE_ALLWINNER_AHCI)
 
 #define ALLWINNER_AHCI_MMIO_OFF  0x80
 #define ALLWINNER_AHCI_MMIO_SIZE 0x80
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 74ea1e324c..eb9eb4e0ae 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -26,7 +26,8 @@ typedef struct IDEDMA IDEDMA;
 typedef struct IDEDMAOps IDEDMAOps;
 
 #define TYPE_IDE_BUS "IDE"
-#define IDE_BUS(obj) OBJECT_CHECK(IDEBus, (obj), TYPE_IDE_BUS)
+DECLARE_INSTANCE_CHECKER(IDEBus, IDE_BUS,
+                         TYPE_IDE_BUS)
 
 #define MAX_IDE_DEVS 2
 
@@ -488,12 +489,8 @@ struct IDEBus {
 
 #define TYPE_IDE_DEVICE "ide-device"
 typedef struct IDEDeviceClass IDEDeviceClass;
-#define IDE_DEVICE(obj) \
-     OBJECT_CHECK(IDEDevice, (obj), TYPE_IDE_DEVICE)
-#define IDE_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(IDEDeviceClass, (klass), TYPE_IDE_DEVICE)
-#define IDE_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(IDEDeviceClass, (obj), TYPE_IDE_DEVICE)
+DECLARE_OBJ_CHECKERS(IDEDevice, IDEDeviceClass,
+                     IDE_DEVICE, TYPE_IDE_DEVICE)
 
 struct IDEDeviceClass {
     DeviceClass parent_class;
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 7ed1fa101d..b8d7270ec8 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -41,7 +41,8 @@ typedef struct BMDMAState {
 
 #define TYPE_PCI_IDE "pci-ide"
 typedef struct PCIIDEState PCIIDEState;
-#define PCI_IDE(obj) OBJECT_CHECK(PCIIDEState, (obj), TYPE_PCI_IDE)
+DECLARE_INSTANCE_CHECKER(PCIIDEState, PCI_IDE,
+                         TYPE_PCI_IDE)
 
 struct PCIIDEState {
     /*< private >*/
diff --git a/include/hw/input/adb.h b/include/hw/input/adb.h
index ad89a21176..285f70db55 100644
--- a/include/hw/input/adb.h
+++ b/include/hw/input/adb.h
@@ -44,7 +44,8 @@ typedef bool ADBDeviceHasData(ADBDevice *d);
 
 #define TYPE_ADB_DEVICE "adb-device"
 typedef struct ADBDeviceClass ADBDeviceClass;
-#define ADB_DEVICE(obj) OBJECT_CHECK(ADBDevice, (obj), TYPE_ADB_DEVICE)
+DECLARE_OBJ_CHECKERS(ADBDevice, ADBDeviceClass,
+                     ADB_DEVICE, TYPE_ADB_DEVICE)
 
 struct ADBDevice {
     /*< private >*/
@@ -55,10 +56,6 @@ struct ADBDevice {
     int handler;
 };
 
-#define ADB_DEVICE_CLASS(cls) \
-    OBJECT_CLASS_CHECK(ADBDeviceClass, (cls), TYPE_ADB_DEVICE)
-#define ADB_DEVICE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(ADBDeviceClass, (obj), TYPE_ADB_DEVICE)
 
 struct ADBDeviceClass {
     /*< private >*/
@@ -70,7 +67,8 @@ struct ADBDeviceClass {
 };
 
 #define TYPE_ADB_BUS "apple-desktop-bus"
-#define ADB_BUS(obj) OBJECT_CHECK(ADBBusState, (obj), TYPE_ADB_BUS)
+DECLARE_INSTANCE_CHECKER(ADBBusState, ADB_BUS,
+                         TYPE_ADB_BUS)
 
 #define ADB_STATUS_BUSTIMEOUT  0x1
 #define ADB_STATUS_POLLREPLY   0x2
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index d4bf584699..f8a3bf88ac 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -13,7 +13,8 @@
 
 #define TYPE_I8042 "i8042"
 typedef struct ISAKBDState ISAKBDState;
-#define I8042(obj) OBJECT_CHECK(ISAKBDState, (obj), TYPE_I8042)
+DECLARE_INSTANCE_CHECKER(ISAKBDState, I8042,
+                         TYPE_I8042)
 
 #define I8042_A20_LINE "a20"
 
diff --git a/include/hw/intc/allwinner-a10-pic.h b/include/hw/intc/allwinner-a10-pic.h
index 692d2a88d0..4d7199480a 100644
--- a/include/hw/intc/allwinner-a10-pic.h
+++ b/include/hw/intc/allwinner-a10-pic.h
@@ -6,7 +6,8 @@
 
 #define TYPE_AW_A10_PIC  "allwinner-a10-pic"
 typedef struct AwA10PICState AwA10PICState;
-#define AW_A10_PIC(obj) OBJECT_CHECK(AwA10PICState, (obj), TYPE_AW_A10_PIC)
+DECLARE_INSTANCE_CHECKER(AwA10PICState, AW_A10_PIC,
+                         TYPE_AW_A10_PIC)
 
 #define AW_A10_PIC_VECTOR       0
 #define AW_A10_PIC_BASE_ADDR    4
diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
index 2cbde9b7a9..7080375008 100644
--- a/include/hw/intc/arm_gic_common.h
+++ b/include/hw/intc/arm_gic_common.h
@@ -149,12 +149,8 @@ typedef struct GICState GICState;
 
 #define TYPE_ARM_GIC_COMMON "arm_gic_common"
 typedef struct ARMGICCommonClass ARMGICCommonClass;
-#define ARM_GIC_COMMON(obj) \
-     OBJECT_CHECK(GICState, (obj), TYPE_ARM_GIC_COMMON)
-#define ARM_GIC_COMMON_CLASS(klass) \
-     OBJECT_CLASS_CHECK(ARMGICCommonClass, (klass), TYPE_ARM_GIC_COMMON)
-#define ARM_GIC_COMMON_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(ARMGICCommonClass, (obj), TYPE_ARM_GIC_COMMON)
+DECLARE_OBJ_CHECKERS(GICState, ARMGICCommonClass,
+                     ARM_GIC_COMMON, TYPE_ARM_GIC_COMMON)
 
 struct ARMGICCommonClass {
     /*< private >*/
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 86fb060320..0331b0ffdb 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -281,12 +281,8 @@ GICV3_BITMAP_ACCESSORS(edge_trigger)
 
 #define TYPE_ARM_GICV3_COMMON "arm-gicv3-common"
 typedef struct ARMGICv3CommonClass ARMGICv3CommonClass;
-#define ARM_GICV3_COMMON(obj) \
-     OBJECT_CHECK(GICv3State, (obj), TYPE_ARM_GICV3_COMMON)
-#define ARM_GICV3_COMMON_CLASS(klass) \
-     OBJECT_CLASS_CHECK(ARMGICv3CommonClass, (klass), TYPE_ARM_GICV3_COMMON)
-#define ARM_GICV3_COMMON_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(ARMGICv3CommonClass, (obj), TYPE_ARM_GICV3_COMMON)
+DECLARE_OBJ_CHECKERS(GICv3State, ARMGICv3CommonClass,
+                     ARM_GICV3_COMMON, TYPE_ARM_GICV3_COMMON)
 
 struct ARMGICv3CommonClass {
     /*< private >*/
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 03a0fa335b..5a0952b404 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -66,12 +66,8 @@ void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops);
 
 #define TYPE_ARM_GICV3_ITS_COMMON "arm-gicv3-its-common"
 typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;
-#define ARM_GICV3_ITS_COMMON(obj) \
-     OBJECT_CHECK(GICv3ITSState, (obj), TYPE_ARM_GICV3_ITS_COMMON)
-#define ARM_GICV3_ITS_COMMON_CLASS(klass) \
-     OBJECT_CLASS_CHECK(GICv3ITSCommonClass, (klass), TYPE_ARM_GICV3_ITS_COMMON)
-#define ARM_GICV3_ITS_COMMON_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(GICv3ITSCommonClass, (obj), TYPE_ARM_GICV3_ITS_COMMON)
+DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSCommonClass,
+                     ARM_GICV3_ITS_COMMON, TYPE_ARM_GICV3_ITS_COMMON)
 
 struct GICv3ITSCommonClass {
     /*< private >*/
diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 63098822fa..bb087b23c3 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -18,8 +18,8 @@
 #define TYPE_NVIC "armv7m_nvic"
 
 typedef struct NVICState NVICState;
-#define NVIC(obj) \
-    OBJECT_CHECK(NVICState, (obj), TYPE_NVIC)
+DECLARE_INSTANCE_CHECKER(NVICState, NVIC,
+                         TYPE_NVIC)
 
 /* Highest permitted number of exceptions (architectural limit) */
 #define NVIC_MAX_VECTORS 512
diff --git a/include/hw/intc/aspeed_vic.h b/include/hw/intc/aspeed_vic.h
index f8844b3327..8f2e67db5a 100644
--- a/include/hw/intc/aspeed_vic.h
+++ b/include/hw/intc/aspeed_vic.h
@@ -18,7 +18,8 @@
 
 #define TYPE_ASPEED_VIC "aspeed.vic"
 typedef struct AspeedVICState AspeedVICState;
-#define ASPEED_VIC(obj) OBJECT_CHECK(AspeedVICState, (obj), TYPE_ASPEED_VIC)
+DECLARE_INSTANCE_CHECKER(AspeedVICState, ASPEED_VIC,
+                         TYPE_ASPEED_VIC)
 
 #define ASPEED_VIC_NR_IRQS 51
 
diff --git a/include/hw/intc/bcm2835_ic.h b/include/hw/intc/bcm2835_ic.h
index 4a9f093025..fd4a767845 100644
--- a/include/hw/intc/bcm2835_ic.h
+++ b/include/hw/intc/bcm2835_ic.h
@@ -13,7 +13,8 @@
 
 #define TYPE_BCM2835_IC "bcm2835-ic"
 typedef struct BCM2835ICState BCM2835ICState;
-#define BCM2835_IC(obj) OBJECT_CHECK(BCM2835ICState, (obj), TYPE_BCM2835_IC)
+DECLARE_INSTANCE_CHECKER(BCM2835ICState, BCM2835_IC,
+                         TYPE_BCM2835_IC)
 
 #define BCM2835_IC_GPU_IRQ "gpu-irq"
 #define BCM2835_IC_ARM_IRQ "arm-irq"
diff --git a/include/hw/intc/bcm2836_control.h b/include/hw/intc/bcm2836_control.h
index 7d8a51fc72..f23292776e 100644
--- a/include/hw/intc/bcm2836_control.h
+++ b/include/hw/intc/bcm2836_control.h
@@ -25,8 +25,8 @@
 
 #define TYPE_BCM2836_CONTROL "bcm2836-control"
 typedef struct BCM2836ControlState BCM2836ControlState;
-#define BCM2836_CONTROL(obj) \
-    OBJECT_CHECK(BCM2836ControlState, (obj), TYPE_BCM2836_CONTROL)
+DECLARE_INSTANCE_CHECKER(BCM2836ControlState, BCM2836_CONTROL,
+                         TYPE_BCM2836_CONTROL)
 
 struct BCM2836ControlState {
     /*< private >*/
diff --git a/include/hw/intc/heathrow_pic.h b/include/hw/intc/heathrow_pic.h
index bd9fc115a8..f8c9bc20ab 100644
--- a/include/hw/intc/heathrow_pic.h
+++ b/include/hw/intc/heathrow_pic.h
@@ -31,7 +31,8 @@
 
 #define TYPE_HEATHROW "heathrow"
 typedef struct HeathrowState HeathrowState;
-#define HEATHROW(obj) OBJECT_CHECK(HeathrowState, (obj), TYPE_HEATHROW)
+DECLARE_INSTANCE_CHECKER(HeathrowState, HEATHROW,
+                         TYPE_HEATHROW)
 
 typedef struct HeathrowPICState {
     uint32_t events;
diff --git a/include/hw/intc/ibex_plic.h b/include/hw/intc/ibex_plic.h
index 0125b36267..8da6b03805 100644
--- a/include/hw/intc/ibex_plic.h
+++ b/include/hw/intc/ibex_plic.h
@@ -24,8 +24,8 @@
 
 #define TYPE_IBEX_PLIC "ibex-plic"
 typedef struct IbexPlicState IbexPlicState;
-#define IBEX_PLIC(obj) \
-    OBJECT_CHECK(IbexPlicState, (obj), TYPE_IBEX_PLIC)
+DECLARE_INSTANCE_CHECKER(IbexPlicState, IBEX_PLIC,
+                         TYPE_IBEX_PLIC)
 
 struct IbexPlicState {
     /*< private >*/
diff --git a/include/hw/intc/imx_avic.h b/include/hw/intc/imx_avic.h
index 124f29f763..621742533c 100644
--- a/include/hw/intc/imx_avic.h
+++ b/include/hw/intc/imx_avic.h
@@ -22,7 +22,8 @@
 
 #define TYPE_IMX_AVIC "imx.avic"
 typedef struct IMXAVICState IMXAVICState;
-#define IMX_AVIC(obj) OBJECT_CHECK(IMXAVICState, (obj), TYPE_IMX_AVIC)
+DECLARE_INSTANCE_CHECKER(IMXAVICState, IMX_AVIC,
+                         TYPE_IMX_AVIC)
 
 #define IMX_AVIC_NUM_IRQS 64
 
diff --git a/include/hw/intc/imx_gpcv2.h b/include/hw/intc/imx_gpcv2.h
index 66befda3fd..2d8075e527 100644
--- a/include/hw/intc/imx_gpcv2.h
+++ b/include/hw/intc/imx_gpcv2.h
@@ -19,6 +19,7 @@ struct IMXGPCv2State {
 typedef struct IMXGPCv2State IMXGPCv2State;
 
 #define TYPE_IMX_GPCV2 "imx-gpcv2"
-#define IMX_GPCV2(obj) OBJECT_CHECK(IMXGPCv2State, (obj), TYPE_IMX_GPCV2)
+DECLARE_INSTANCE_CHECKER(IMXGPCv2State, IMX_GPCV2,
+                         TYPE_IMX_GPCV2)
 
 #endif /* IMX_GPCV2_H */
diff --git a/include/hw/intc/intc.h b/include/hw/intc/intc.h
index b51c0ac0f4..7018f608ca 100644
--- a/include/hw/intc/intc.h
+++ b/include/hw/intc/intc.h
@@ -6,12 +6,8 @@
 #define TYPE_INTERRUPT_STATS_PROVIDER "intctrl"
 
 typedef struct InterruptStatsProviderClass InterruptStatsProviderClass;
-#define INTERRUPT_STATS_PROVIDER_CLASS(klass) \
-    OBJECT_CLASS_CHECK(InterruptStatsProviderClass, (klass), \
+DECLARE_CLASS_CHECKERS(InterruptStatsProviderClass, INTERRUPT_STATS_PROVIDER,
                        TYPE_INTERRUPT_STATS_PROVIDER)
-#define INTERRUPT_STATS_PROVIDER_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(InterruptStatsProviderClass, (obj), \
-                     TYPE_INTERRUPT_STATS_PROVIDER)
 #define INTERRUPT_STATS_PROVIDER(obj) \
     INTERFACE_CHECK(InterruptStatsProvider, (obj), \
                     TYPE_INTERRUPT_STATS_PROVIDER)
diff --git a/include/hw/intc/mips_gic.h b/include/hw/intc/mips_gic.h
index 5670421e62..65aa3a9a5e 100644
--- a/include/hw/intc/mips_gic.h
+++ b/include/hw/intc/mips_gic.h
@@ -172,7 +172,8 @@
 
 #define TYPE_MIPS_GIC "mips-gic"
 typedef struct MIPSGICState MIPSGICState;
-#define MIPS_GIC(obj) OBJECT_CHECK(MIPSGICState, (obj), TYPE_MIPS_GIC)
+DECLARE_INSTANCE_CHECKER(MIPSGICState, MIPS_GIC,
+                         TYPE_MIPS_GIC)
 
 /* Support up to 32 VPs and 256 IRQs */
 #define GIC_MAX_VPS             32
diff --git a/include/hw/intc/realview_gic.h b/include/hw/intc/realview_gic.h
index e633992b9c..a93ace87c8 100644
--- a/include/hw/intc/realview_gic.h
+++ b/include/hw/intc/realview_gic.h
@@ -16,8 +16,8 @@
 
 #define TYPE_REALVIEW_GIC "realview_gic"
 typedef struct RealViewGICState RealViewGICState;
-#define REALVIEW_GIC(obj) \
-    OBJECT_CHECK(RealViewGICState, (obj), TYPE_REALVIEW_GIC)
+DECLARE_INSTANCE_CHECKER(RealViewGICState, REALVIEW_GIC,
+                         TYPE_REALVIEW_GIC)
 
 struct RealViewGICState {
     SysBusDevice parent_obj;
diff --git a/include/hw/intc/rx_icu.h b/include/hw/intc/rx_icu.h
index 5660cb4e7f..ec02df35e3 100644
--- a/include/hw/intc/rx_icu.h
+++ b/include/hw/intc/rx_icu.h
@@ -72,6 +72,7 @@ struct RXICUState {
 typedef struct RXICUState RXICUState;
 
 #define TYPE_RX_ICU "rx-icu"
-#define RX_ICU(obj) OBJECT_CHECK(RXICUState, (obj), TYPE_RX_ICU)
+DECLARE_INSTANCE_CHECKER(RXICUState, RX_ICU,
+                         TYPE_RX_ICU)
 
 #endif /* RX_ICU_H */
diff --git a/include/hw/intc/xlnx-pmu-iomod-intc.h b/include/hw/intc/xlnx-pmu-iomod-intc.h
index fce35ac941..7a560e97af 100644
--- a/include/hw/intc/xlnx-pmu-iomod-intc.h
+++ b/include/hw/intc/xlnx-pmu-iomod-intc.h
@@ -32,8 +32,8 @@
 #define TYPE_XLNX_PMU_IO_INTC "xlnx.pmu_io_intc"
 
 typedef struct XlnxPMUIOIntc XlnxPMUIOIntc;
-#define XLNX_PMU_IO_INTC(obj) \
-     OBJECT_CHECK(XlnxPMUIOIntc, (obj), TYPE_XLNX_PMU_IO_INTC)
+DECLARE_INSTANCE_CHECKER(XlnxPMUIOIntc, XLNX_PMU_IO_INTC,
+                         TYPE_XLNX_PMU_IO_INTC)
 
 /* This is R_PIT3_CONTROL + 1 */
 #define XLNXPMUIOINTC_R_MAX (0x78 + 1)
diff --git a/include/hw/intc/xlnx-zynqmp-ipi.h b/include/hw/intc/xlnx-zynqmp-ipi.h
index 9044ca5afe..29c48db307 100644
--- a/include/hw/intc/xlnx-zynqmp-ipi.h
+++ b/include/hw/intc/xlnx-zynqmp-ipi.h
@@ -32,8 +32,8 @@
 #define TYPE_XLNX_ZYNQMP_IPI "xlnx.zynqmp_ipi"
 
 typedef struct XlnxZynqMPIPI XlnxZynqMPIPI;
-#define XLNX_ZYNQMP_IPI(obj) \
-     OBJECT_CHECK(XlnxZynqMPIPI, (obj), TYPE_XLNX_ZYNQMP_IPI)
+DECLARE_INSTANCE_CHECKER(XlnxZynqMPIPI, XLNX_ZYNQMP_IPI,
+                         TYPE_XLNX_ZYNQMP_IPI)
 
 /* This is R_IPI_IDR + 1 */
 #define R_XLNX_ZYNQMP_IPI_MAX ((0x1c / 4) + 1)
diff --git a/include/hw/ipack/ipack.h b/include/hw/ipack/ipack.h
index ac6105ff8b..a2304c1b3e 100644
--- a/include/hw/ipack/ipack.h
+++ b/include/hw/ipack/ipack.h
@@ -17,7 +17,8 @@
 typedef struct IPackBus IPackBus;
 
 #define TYPE_IPACK_BUS "IndustryPack"
-#define IPACK_BUS(obj) OBJECT_CHECK(IPackBus, (obj), TYPE_IPACK_BUS)
+DECLARE_INSTANCE_CHECKER(IPackBus, IPACK_BUS,
+                         TYPE_IPACK_BUS)
 
 struct IPackBus {
     /*< private >*/
@@ -33,12 +34,8 @@ typedef struct IPackDevice IPackDevice;
 typedef struct IPackDeviceClass IPackDeviceClass;
 
 #define TYPE_IPACK_DEVICE "ipack-device"
-#define IPACK_DEVICE(obj) \
-     OBJECT_CHECK(IPackDevice, (obj), TYPE_IPACK_DEVICE)
-#define IPACK_DEVICE_CLASS(klass)                                        \
-     OBJECT_CLASS_CHECK(IPackDeviceClass, (klass), TYPE_IPACK_DEVICE)
-#define IPACK_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(IPackDeviceClass, (obj), TYPE_IPACK_DEVICE)
+DECLARE_OBJ_CHECKERS(IPackDevice, IPackDeviceClass,
+                     IPACK_DEVICE, TYPE_IPACK_DEVICE)
 
 struct IPackDeviceClass {
     /*< private >*/
diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
index 742c400533..d2ed0a9fc4 100644
--- a/include/hw/ipmi/ipmi.h
+++ b/include/hw/ipmi/ipmi.h
@@ -111,10 +111,8 @@ uint32_t ipmi_next_uuid(void);
 #define IPMI_INTERFACE(obj) \
      INTERFACE_CHECK(IPMIInterface, (obj), TYPE_IPMI_INTERFACE)
 typedef struct IPMIInterfaceClass IPMIInterfaceClass;
-#define IPMI_INTERFACE_CLASS(class) \
-     OBJECT_CLASS_CHECK(IPMIInterfaceClass, (class), TYPE_IPMI_INTERFACE)
-#define IPMI_INTERFACE_GET_CLASS(class) \
-     OBJECT_GET_CLASS(IPMIInterfaceClass, (class), TYPE_IPMI_INTERFACE)
+DECLARE_CLASS_CHECKERS(IPMIInterfaceClass, IPMI_INTERFACE,
+                       TYPE_IPMI_INTERFACE)
 
 typedef struct IPMIInterface IPMIInterface;
 
@@ -179,12 +177,8 @@ struct IPMIInterfaceClass {
 #define TYPE_IPMI_BMC "ipmi-bmc"
 typedef struct IPMIBmc IPMIBmc;
 typedef struct IPMIBmcClass IPMIBmcClass;
-#define IPMI_BMC(obj) \
-     OBJECT_CHECK(IPMIBmc, (obj), TYPE_IPMI_BMC)
-#define IPMI_BMC_CLASS(obj_class) \
-     OBJECT_CLASS_CHECK(IPMIBmcClass, (obj_class), TYPE_IPMI_BMC)
-#define IPMI_BMC_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(IPMIBmcClass, (obj), TYPE_IPMI_BMC)
+DECLARE_OBJ_CHECKERS(IPMIBmc, IPMIBmcClass,
+                     IPMI_BMC, TYPE_IPMI_BMC)
 
 struct IPMIBmc {
     DeviceState parent;
@@ -272,8 +266,8 @@ void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, bool log);
 
 #define TYPE_IPMI_BMC_SIMULATOR "ipmi-bmc-sim"
 typedef struct IPMIBmcSim IPMIBmcSim;
-#define IPMI_BMC_SIMULATOR(obj) OBJECT_CHECK(IPMIBmcSim, (obj), \
-                                        TYPE_IPMI_BMC_SIMULATOR)
+DECLARE_INSTANCE_CHECKER(IPMIBmcSim, IPMI_BMC_SIMULATOR,
+                         TYPE_IPMI_BMC_SIMULATOR)
 
 
 typedef struct RspBuffer {
diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
index 69170df6f8..cd050bb9f2 100644
--- a/include/hw/isa/i8259_internal.h
+++ b/include/hw/isa/i8259_internal.h
@@ -34,12 +34,8 @@ typedef struct PICCommonState PICCommonState;
 
 #define TYPE_PIC_COMMON "pic-common"
 typedef struct PICCommonClass PICCommonClass;
-#define PIC_COMMON(obj) \
-     OBJECT_CHECK(PICCommonState, (obj), TYPE_PIC_COMMON)
-#define PIC_COMMON_CLASS(klass) \
-     OBJECT_CLASS_CHECK(PICCommonClass, (klass), TYPE_PIC_COMMON)
-#define PIC_COMMON_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PICCommonClass, (obj), TYPE_PIC_COMMON)
+DECLARE_OBJ_CHECKERS(PICCommonState, PICCommonClass,
+                     PIC_COMMON, TYPE_PIC_COMMON)
 
 struct PICCommonClass {
     ISADeviceClass parent_class;
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index c7f27d5aa9..ddb6a2d168 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -12,15 +12,12 @@
 
 #define TYPE_ISA_DEVICE "isa-device"
 typedef struct ISADeviceClass ISADeviceClass;
-#define ISA_DEVICE(obj) \
-     OBJECT_CHECK(ISADevice, (obj), TYPE_ISA_DEVICE)
-#define ISA_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(ISADeviceClass, (klass), TYPE_ISA_DEVICE)
-#define ISA_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(ISADeviceClass, (obj), TYPE_ISA_DEVICE)
+DECLARE_OBJ_CHECKERS(ISADevice, ISADeviceClass,
+                     ISA_DEVICE, TYPE_ISA_DEVICE)
 
 #define TYPE_ISA_BUS "ISA"
-#define ISA_BUS(obj) OBJECT_CHECK(ISABus, (obj), TYPE_ISA_BUS)
+DECLARE_INSTANCE_CHECKER(ISABus, ISA_BUS,
+                         TYPE_ISA_BUS)
 
 #define TYPE_APPLE_SMC "isa-applesmc"
 #define APPLESMC_MAX_DATA_LENGTH       32
@@ -39,10 +36,8 @@ static inline uint16_t applesmc_port(void)
 #define TYPE_ISADMA "isa-dma"
 
 typedef struct IsaDmaClass IsaDmaClass;
-#define ISADMA_CLASS(klass) \
-    OBJECT_CLASS_CHECK(IsaDmaClass, (klass), TYPE_ISADMA)
-#define ISADMA_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(IsaDmaClass, (obj), TYPE_ISADMA)
+DECLARE_CLASS_CHECKERS(IsaDmaClass, ISADMA,
+                       TYPE_ISADMA)
 #define ISADMA(obj) \
     INTERFACE_CHECK(IsaDma, (obj), TYPE_ISADMA)
 
diff --git a/include/hw/isa/pc87312.h b/include/hw/isa/pc87312.h
index c8e98ea029..a65168a157 100644
--- a/include/hw/isa/pc87312.h
+++ b/include/hw/isa/pc87312.h
@@ -31,7 +31,8 @@
 
 #define TYPE_PC87312_SUPERIO "pc87312"
 typedef struct PC87312State PC87312State;
-#define PC87312(obj) OBJECT_CHECK(PC87312State, (obj), TYPE_PC87312_SUPERIO)
+DECLARE_INSTANCE_CHECKER(PC87312State, PC87312,
+                         TYPE_PC87312_SUPERIO)
 
 struct PC87312State {
     /*< private >*/
diff --git a/include/hw/isa/superio.h b/include/hw/isa/superio.h
index c782c8b64e..b9f5c19155 100644
--- a/include/hw/isa/superio.h
+++ b/include/hw/isa/superio.h
@@ -17,12 +17,8 @@
 #define TYPE_ISA_SUPERIO "isa-superio"
 typedef struct ISASuperIOClass ISASuperIOClass;
 typedef struct ISASuperIODevice ISASuperIODevice;
-#define ISA_SUPERIO(obj) \
-    OBJECT_CHECK(ISASuperIODevice, (obj), TYPE_ISA_SUPERIO)
-#define ISA_SUPERIO_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(ISASuperIOClass, (obj), TYPE_ISA_SUPERIO)
-#define ISA_SUPERIO_CLASS(klass) \
-    OBJECT_CLASS_CHECK(ISASuperIOClass, (klass), TYPE_ISA_SUPERIO)
+DECLARE_OBJ_CHECKERS(ISASuperIODevice, ISASuperIOClass,
+                     ISA_SUPERIO, TYPE_ISA_SUPERIO)
 
 #define SUPERIO_MAX_SERIAL_PORTS 4
 
diff --git a/include/hw/m68k/mcf_fec.h b/include/hw/m68k/mcf_fec.h
index c8ece3cb4b..840c5bbf53 100644
--- a/include/hw/m68k/mcf_fec.h
+++ b/include/hw/m68k/mcf_fec.h
@@ -13,7 +13,8 @@
 
 #define TYPE_MCF_FEC_NET "mcf-fec"
 typedef struct mcf_fec_state mcf_fec_state;
-#define MCF_FEC_NET(obj) OBJECT_CHECK(mcf_fec_state, (obj), TYPE_MCF_FEC_NET)
+DECLARE_INSTANCE_CHECKER(mcf_fec_state, MCF_FEC_NET,
+                         TYPE_MCF_FEC_NET)
 
 #define FEC_NUM_IRQ 13
 
diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index d19bca5942..cde52e83c9 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -20,10 +20,8 @@
 #define TYPE_MEMORY_DEVICE "memory-device"
 
 typedef struct MemoryDeviceClass MemoryDeviceClass;
-#define MEMORY_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(MemoryDeviceClass, (klass), TYPE_MEMORY_DEVICE)
-#define MEMORY_DEVICE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(MemoryDeviceClass, (obj), TYPE_MEMORY_DEVICE)
+DECLARE_CLASS_CHECKERS(MemoryDeviceClass, MEMORY_DEVICE,
+                       TYPE_MEMORY_DEVICE)
 #define MEMORY_DEVICE(obj) \
      INTERFACE_CHECK(MemoryDeviceState, (obj), TYPE_MEMORY_DEVICE)
 
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index 4b4a4b5b17..19e3d3092d 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -48,10 +48,8 @@
 #define TYPE_NVDIMM      "nvdimm"
 typedef struct NVDIMMClass NVDIMMClass;
 typedef struct NVDIMMDevice NVDIMMDevice;
-#define NVDIMM(obj)      OBJECT_CHECK(NVDIMMDevice, (obj), TYPE_NVDIMM)
-#define NVDIMM_CLASS(oc) OBJECT_CLASS_CHECK(NVDIMMClass, (oc), TYPE_NVDIMM)
-#define NVDIMM_GET_CLASS(obj) OBJECT_GET_CLASS(NVDIMMClass, (obj), \
-                                               TYPE_NVDIMM)
+DECLARE_OBJ_CHECKERS(NVDIMMDevice, NVDIMMClass,
+                     NVDIMM, TYPE_NVDIMM)
 
 #define NVDIMM_LABEL_SIZE_PROP "label-size"
 #define NVDIMM_UUID_PROP       "uuid"
diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
index 41d4ff39ba..86e3010243 100644
--- a/include/hw/mem/pc-dimm.h
+++ b/include/hw/mem/pc-dimm.h
@@ -23,12 +23,8 @@
 #define TYPE_PC_DIMM "pc-dimm"
 typedef struct PCDIMMDevice PCDIMMDevice;
 typedef struct PCDIMMDeviceClass PCDIMMDeviceClass;
-#define PC_DIMM(obj) \
-    OBJECT_CHECK(PCDIMMDevice, (obj), TYPE_PC_DIMM)
-#define PC_DIMM_CLASS(oc) \
-    OBJECT_CLASS_CHECK(PCDIMMDeviceClass, (oc), TYPE_PC_DIMM)
-#define PC_DIMM_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(PCDIMMDeviceClass, (obj), TYPE_PC_DIMM)
+DECLARE_OBJ_CHECKERS(PCDIMMDevice, PCDIMMDeviceClass,
+                     PC_DIMM, TYPE_PC_DIMM)
 
 #define PC_DIMM_ADDR_PROP "addr"
 #define PC_DIMM_SLOT_PROP "slot"
diff --git a/include/hw/mips/cps.h b/include/hw/mips/cps.h
index ab79a66b1d..849e640570 100644
--- a/include/hw/mips/cps.h
+++ b/include/hw/mips/cps.h
@@ -30,7 +30,8 @@
 
 #define TYPE_MIPS_CPS "mips-cps"
 typedef struct MIPSCPSState MIPSCPSState;
-#define MIPS_CPS(obj) OBJECT_CHECK(MIPSCPSState, (obj), TYPE_MIPS_CPS)
+DECLARE_INSTANCE_CHECKER(MIPSCPSState, MIPS_CPS,
+                         TYPE_MIPS_CPS)
 
 struct MIPSCPSState {
     SysBusDevice parent_obj;
diff --git a/include/hw/misc/a9scu.h b/include/hw/misc/a9scu.h
index c5481f4dbb..fd1b92e923 100644
--- a/include/hw/misc/a9scu.h
+++ b/include/hw/misc/a9scu.h
@@ -28,6 +28,7 @@ struct A9SCUState {
 typedef struct A9SCUState A9SCUState;
 
 #define TYPE_A9_SCU "a9-scu"
-#define A9_SCU(obj) OBJECT_CHECK(A9SCUState, (obj), TYPE_A9_SCU)
+DECLARE_INSTANCE_CHECKER(A9SCUState, A9_SCU,
+                         TYPE_A9_SCU)
 
 #endif
diff --git a/include/hw/misc/allwinner-cpucfg.h b/include/hw/misc/allwinner-cpucfg.h
index f5420b11d5..058514de15 100644
--- a/include/hw/misc/allwinner-cpucfg.h
+++ b/include/hw/misc/allwinner-cpucfg.h
@@ -30,8 +30,8 @@
 
 #define TYPE_AW_CPUCFG   "allwinner-cpucfg"
 typedef struct AwCpuCfgState AwCpuCfgState;
-#define AW_CPUCFG(obj) \
-    OBJECT_CHECK(AwCpuCfgState, (obj), TYPE_AW_CPUCFG)
+DECLARE_INSTANCE_CHECKER(AwCpuCfgState, AW_CPUCFG,
+                         TYPE_AW_CPUCFG)
 
 /** @} */
 
diff --git a/include/hw/misc/allwinner-h3-ccu.h b/include/hw/misc/allwinner-h3-ccu.h
index 60f0c56cd9..05f5c7bd8e 100644
--- a/include/hw/misc/allwinner-h3-ccu.h
+++ b/include/hw/misc/allwinner-h3-ccu.h
@@ -43,8 +43,8 @@
 
 #define TYPE_AW_H3_CCU    "allwinner-h3-ccu"
 typedef struct AwH3ClockCtlState AwH3ClockCtlState;
-#define AW_H3_CCU(obj) \
-    OBJECT_CHECK(AwH3ClockCtlState, (obj), TYPE_AW_H3_CCU)
+DECLARE_INSTANCE_CHECKER(AwH3ClockCtlState, AW_H3_CCU,
+                         TYPE_AW_H3_CCU)
 
 /** @} */
 
diff --git a/include/hw/misc/allwinner-h3-dramc.h b/include/hw/misc/allwinner-h3-dramc.h
index 0538e598b0..60a13a6958 100644
--- a/include/hw/misc/allwinner-h3-dramc.h
+++ b/include/hw/misc/allwinner-h3-dramc.h
@@ -59,8 +59,8 @@
 
 #define TYPE_AW_H3_DRAMC "allwinner-h3-dramc"
 typedef struct AwH3DramCtlState AwH3DramCtlState;
-#define AW_H3_DRAMC(obj) \
-    OBJECT_CHECK(AwH3DramCtlState, (obj), TYPE_AW_H3_DRAMC)
+DECLARE_INSTANCE_CHECKER(AwH3DramCtlState, AW_H3_DRAMC,
+                         TYPE_AW_H3_DRAMC)
 
 /** @} */
 
diff --git a/include/hw/misc/allwinner-h3-sysctrl.h b/include/hw/misc/allwinner-h3-sysctrl.h
index 7360698f8f..50baa8eb07 100644
--- a/include/hw/misc/allwinner-h3-sysctrl.h
+++ b/include/hw/misc/allwinner-h3-sysctrl.h
@@ -44,8 +44,8 @@
 
 #define TYPE_AW_H3_SYSCTRL    "allwinner-h3-sysctrl"
 typedef struct AwH3SysCtrlState AwH3SysCtrlState;
-#define AW_H3_SYSCTRL(obj) \
-    OBJECT_CHECK(AwH3SysCtrlState, (obj), TYPE_AW_H3_SYSCTRL)
+DECLARE_INSTANCE_CHECKER(AwH3SysCtrlState, AW_H3_SYSCTRL,
+                         TYPE_AW_H3_SYSCTRL)
 
 /** @} */
 
diff --git a/include/hw/misc/allwinner-sid.h b/include/hw/misc/allwinner-sid.h
index 70cd7cc7c0..b8e83bb7ce 100644
--- a/include/hw/misc/allwinner-sid.h
+++ b/include/hw/misc/allwinner-sid.h
@@ -31,8 +31,8 @@
 
 #define TYPE_AW_SID    "allwinner-sid"
 typedef struct AwSidState AwSidState;
-#define AW_SID(obj) \
-    OBJECT_CHECK(AwSidState, (obj), TYPE_AW_SID)
+DECLARE_INSTANCE_CHECKER(AwSidState, AW_SID,
+                         TYPE_AW_SID)
 
 /** @} */
 
diff --git a/include/hw/misc/arm11scu.h b/include/hw/misc/arm11scu.h
index 7e2e6d2b44..71b4bc9a22 100644
--- a/include/hw/misc/arm11scu.h
+++ b/include/hw/misc/arm11scu.h
@@ -16,7 +16,8 @@
 
 #define TYPE_ARM11_SCU "arm11-scu"
 typedef struct ARM11SCUState ARM11SCUState;
-#define ARM11_SCU(obj) OBJECT_CHECK(ARM11SCUState, (obj), TYPE_ARM11_SCU)
+DECLARE_INSTANCE_CHECKER(ARM11SCUState, ARM11_SCU,
+                         TYPE_ARM11_SCU)
 
 struct ARM11SCUState {
     /*< private >*/
diff --git a/include/hw/misc/armsse-cpuid.h b/include/hw/misc/armsse-cpuid.h
index 290a52cf10..80691c7180 100644
--- a/include/hw/misc/armsse-cpuid.h
+++ b/include/hw/misc/armsse-cpuid.h
@@ -27,7 +27,8 @@
 
 #define TYPE_ARMSSE_CPUID "armsse-cpuid"
 typedef struct ARMSSECPUID ARMSSECPUID;
-#define ARMSSE_CPUID(obj) OBJECT_CHECK(ARMSSECPUID, (obj), TYPE_ARMSSE_CPUID)
+DECLARE_INSTANCE_CHECKER(ARMSSECPUID, ARMSSE_CPUID,
+                         TYPE_ARMSSE_CPUID)
 
 struct ARMSSECPUID {
     /*< private >*/
diff --git a/include/hw/misc/armsse-mhu.h b/include/hw/misc/armsse-mhu.h
index d1ae4a463a..310643a022 100644
--- a/include/hw/misc/armsse-mhu.h
+++ b/include/hw/misc/armsse-mhu.h
@@ -28,7 +28,8 @@
 
 #define TYPE_ARMSSE_MHU "armsse-mhu"
 typedef struct ARMSSEMHU ARMSSEMHU;
-#define ARMSSE_MHU(obj) OBJECT_CHECK(ARMSSEMHU, (obj), TYPE_ARMSSE_MHU)
+DECLARE_INSTANCE_CHECKER(ARMSSEMHU, ARMSSE_MHU,
+                         TYPE_ARMSSE_MHU)
 
 struct ARMSSEMHU {
     /*< private >*/
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 5e03f6db3a..229a1a9539 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -17,7 +17,8 @@
 #define TYPE_ASPEED_SCU "aspeed.scu"
 typedef struct AspeedSCUClass AspeedSCUClass;
 typedef struct AspeedSCUState AspeedSCUState;
-#define ASPEED_SCU(obj) OBJECT_CHECK(AspeedSCUState, (obj), TYPE_ASPEED_SCU)
+DECLARE_OBJ_CHECKERS(AspeedSCUState, AspeedSCUClass,
+                     ASPEED_SCU, TYPE_ASPEED_SCU)
 #define TYPE_ASPEED_2400_SCU TYPE_ASPEED_SCU "-ast2400"
 #define TYPE_ASPEED_2500_SCU TYPE_ASPEED_SCU "-ast2500"
 #define TYPE_ASPEED_2600_SCU TYPE_ASPEED_SCU "-ast2600"
@@ -50,10 +51,6 @@ struct AspeedSCUState {
 
 extern bool is_supported_silicon_rev(uint32_t silicon_rev);
 
-#define ASPEED_SCU_CLASS(klass) \
-     OBJECT_CLASS_CHECK(AspeedSCUClass, (klass), TYPE_ASPEED_SCU)
-#define ASPEED_SCU_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(AspeedSCUClass, (obj), TYPE_ASPEED_SCU)
 
 struct AspeedSCUClass {
     SysBusDeviceClass parent_class;
diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
index 8ee5e8e483..4b76c72e87 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -15,7 +15,8 @@
 #define TYPE_ASPEED_SDMC "aspeed.sdmc"
 typedef struct AspeedSDMCClass AspeedSDMCClass;
 typedef struct AspeedSDMCState AspeedSDMCState;
-#define ASPEED_SDMC(obj) OBJECT_CHECK(AspeedSDMCState, (obj), TYPE_ASPEED_SDMC)
+DECLARE_OBJ_CHECKERS(AspeedSDMCState, AspeedSDMCClass,
+                     ASPEED_SDMC, TYPE_ASPEED_SDMC)
 #define TYPE_ASPEED_2400_SDMC TYPE_ASPEED_SDMC "-ast2400"
 #define TYPE_ASPEED_2500_SDMC TYPE_ASPEED_SDMC "-ast2500"
 #define TYPE_ASPEED_2600_SDMC TYPE_ASPEED_SDMC "-ast2600"
@@ -34,10 +35,6 @@ struct AspeedSDMCState {
     uint64_t max_ram_size;
 };
 
-#define ASPEED_SDMC_CLASS(klass) \
-     OBJECT_CLASS_CHECK(AspeedSDMCClass, (klass), TYPE_ASPEED_SDMC)
-#define ASPEED_SDMC_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(AspeedSDMCClass, (obj), TYPE_ASPEED_SDMC)
 
 struct AspeedSDMCClass {
     SysBusDeviceClass parent_class;
diff --git a/include/hw/misc/aspeed_xdma.h b/include/hw/misc/aspeed_xdma.h
index e5177e2c02..0e62c04520 100644
--- a/include/hw/misc/aspeed_xdma.h
+++ b/include/hw/misc/aspeed_xdma.h
@@ -14,7 +14,8 @@
 
 #define TYPE_ASPEED_XDMA "aspeed.xdma"
 typedef struct AspeedXDMAState AspeedXDMAState;
-#define ASPEED_XDMA(obj) OBJECT_CHECK(AspeedXDMAState, (obj), TYPE_ASPEED_XDMA)
+DECLARE_INSTANCE_CHECKER(AspeedXDMAState, ASPEED_XDMA,
+                         TYPE_ASPEED_XDMA)
 
 #define ASPEED_XDMA_NUM_REGS (ASPEED_XDMA_REG_SIZE / sizeof(uint32_t))
 #define ASPEED_XDMA_REG_SIZE 0x7C
diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
index f24f2fd789..f910d94118 100644
--- a/include/hw/misc/auxbus.h
+++ b/include/hw/misc/auxbus.h
@@ -36,7 +36,8 @@ typedef enum AUXReply AUXReply;
 
 #define TYPE_AUXTOI2C "aux-to-i2c-bridge"
 typedef struct AUXTOI2CState AUXTOI2CState;
-#define AUXTOI2C(obj) OBJECT_CHECK(AUXTOI2CState, (obj), TYPE_AUXTOI2C)
+DECLARE_INSTANCE_CHECKER(AUXTOI2CState, AUXTOI2C,
+                         TYPE_AUXTOI2C)
 
 enum AUXCommand {
     WRITE_I2C = 0,
@@ -57,7 +58,8 @@ enum AUXReply {
 };
 
 #define TYPE_AUX_BUS "aux-bus"
-#define AUX_BUS(obj) OBJECT_CHECK(AUXBus, (obj), TYPE_AUX_BUS)
+DECLARE_INSTANCE_CHECKER(AUXBus, AUX_BUS,
+                         TYPE_AUX_BUS)
 
 struct AUXBus {
     /* < private > */
@@ -76,8 +78,8 @@ struct AUXBus {
 };
 
 #define TYPE_AUX_SLAVE "aux-slave"
-#define AUX_SLAVE(obj) \
-     OBJECT_CHECK(AUXSlave, (obj), TYPE_AUX_SLAVE)
+DECLARE_INSTANCE_CHECKER(AUXSlave, AUX_SLAVE,
+                         TYPE_AUX_SLAVE)
 
 struct AUXSlave {
     /* < private > */
diff --git a/include/hw/misc/avr_power.h b/include/hw/misc/avr_power.h
index c230a2655c..938ab3e21b 100644
--- a/include/hw/misc/avr_power.h
+++ b/include/hw/misc/avr_power.h
@@ -32,7 +32,8 @@
 
 #define TYPE_AVR_MASK "avr-power"
 typedef struct AVRMaskState AVRMaskState;
-#define AVR_MASK(obj) OBJECT_CHECK(AVRMaskState, (obj), TYPE_AVR_MASK)
+DECLARE_INSTANCE_CHECKER(AVRMaskState, AVR_MASK,
+                         TYPE_AVR_MASK)
 
 struct AVRMaskState {
     /* <private> */
diff --git a/include/hw/misc/bcm2835_mbox.h b/include/hw/misc/bcm2835_mbox.h
index 3ec6a2f0e8..d8c8017f4e 100644
--- a/include/hw/misc/bcm2835_mbox.h
+++ b/include/hw/misc/bcm2835_mbox.h
@@ -14,8 +14,8 @@
 
 #define TYPE_BCM2835_MBOX "bcm2835-mbox"
 typedef struct BCM2835MboxState BCM2835MboxState;
-#define BCM2835_MBOX(obj) \
-        OBJECT_CHECK(BCM2835MboxState, (obj), TYPE_BCM2835_MBOX)
+DECLARE_INSTANCE_CHECKER(BCM2835MboxState, BCM2835_MBOX,
+                         TYPE_BCM2835_MBOX)
 
 typedef struct {
     uint32_t reg[MBOX_SIZE];
diff --git a/include/hw/misc/bcm2835_mphi.h b/include/hw/misc/bcm2835_mphi.h
index ce1c273cfb..249511182e 100644
--- a/include/hw/misc/bcm2835_mphi.h
+++ b/include/hw/misc/bcm2835_mphi.h
@@ -39,7 +39,7 @@ struct BCM2835MphiState {
 
 #define TYPE_BCM2835_MPHI   "bcm2835-mphi"
 
-#define BCM2835_MPHI(obj) \
-    OBJECT_CHECK(BCM2835MphiState, (obj), TYPE_BCM2835_MPHI)
+DECLARE_INSTANCE_CHECKER(BCM2835MphiState, BCM2835_MPHI,
+                         TYPE_BCM2835_MPHI)
 
 #endif
diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_property.h
index 28bf2b49b6..5c827a1900 100644
--- a/include/hw/misc/bcm2835_property.h
+++ b/include/hw/misc/bcm2835_property.h
@@ -15,8 +15,8 @@
 
 #define TYPE_BCM2835_PROPERTY "bcm2835-property"
 typedef struct BCM2835PropertyState BCM2835PropertyState;
-#define BCM2835_PROPERTY(obj) \
-        OBJECT_CHECK(BCM2835PropertyState, (obj), TYPE_BCM2835_PROPERTY)
+DECLARE_INSTANCE_CHECKER(BCM2835PropertyState, BCM2835_PROPERTY,
+                         TYPE_BCM2835_PROPERTY)
 
 struct BCM2835PropertyState {
     /*< private >*/
diff --git a/include/hw/misc/bcm2835_rng.h b/include/hw/misc/bcm2835_rng.h
index 0921d9b3f1..fec76eef8e 100644
--- a/include/hw/misc/bcm2835_rng.h
+++ b/include/hw/misc/bcm2835_rng.h
@@ -15,8 +15,8 @@
 
 #define TYPE_BCM2835_RNG "bcm2835-rng"
 typedef struct BCM2835RngState BCM2835RngState;
-#define BCM2835_RNG(obj) \
-        OBJECT_CHECK(BCM2835RngState, (obj), TYPE_BCM2835_RNG)
+DECLARE_INSTANCE_CHECKER(BCM2835RngState, BCM2835_RNG,
+                         TYPE_BCM2835_RNG)
 
 struct BCM2835RngState {
     SysBusDevice busdev;
diff --git a/include/hw/misc/bcm2835_thermal.h b/include/hw/misc/bcm2835_thermal.h
index 2b937527eb..5b827c970e 100644
--- a/include/hw/misc/bcm2835_thermal.h
+++ b/include/hw/misc/bcm2835_thermal.h
@@ -15,8 +15,8 @@
 #define TYPE_BCM2835_THERMAL "bcm2835-thermal"
 
 typedef struct Bcm2835ThermalState Bcm2835ThermalState;
-#define BCM2835_THERMAL(obj) \
-    OBJECT_CHECK(Bcm2835ThermalState, (obj), TYPE_BCM2835_THERMAL)
+DECLARE_INSTANCE_CHECKER(Bcm2835ThermalState, BCM2835_THERMAL,
+                         TYPE_BCM2835_THERMAL)
 
 struct Bcm2835ThermalState {
     /*< private >*/
diff --git a/include/hw/misc/grlib_ahb_apb_pnp.h b/include/hw/misc/grlib_ahb_apb_pnp.h
index 427606fd6b..34b18e3193 100644
--- a/include/hw/misc/grlib_ahb_apb_pnp.h
+++ b/include/hw/misc/grlib_ahb_apb_pnp.h
@@ -27,13 +27,13 @@
 
 #define TYPE_GRLIB_AHB_PNP "grlib,ahbpnp"
 typedef struct AHBPnp AHBPnp;
-#define GRLIB_AHB_PNP(obj) \
-    OBJECT_CHECK(AHBPnp, (obj), TYPE_GRLIB_AHB_PNP)
+DECLARE_INSTANCE_CHECKER(AHBPnp, GRLIB_AHB_PNP,
+                         TYPE_GRLIB_AHB_PNP)
 
 #define TYPE_GRLIB_APB_PNP "grlib,apbpnp"
 typedef struct APBPnp APBPnp;
-#define GRLIB_APB_PNP(obj) \
-    OBJECT_CHECK(APBPnp, (obj), TYPE_GRLIB_APB_PNP)
+DECLARE_INSTANCE_CHECKER(APBPnp, GRLIB_APB_PNP,
+                         TYPE_GRLIB_APB_PNP)
 
 void grlib_ahb_pnp_add_entry(AHBPnp *dev, uint32_t address, uint32_t mask,
                              uint8_t vendor, uint16_t device, int slave,
diff --git a/include/hw/misc/imx25_ccm.h b/include/hw/misc/imx25_ccm.h
index 8a7a9b675f..55c5db8815 100644
--- a/include/hw/misc/imx25_ccm.h
+++ b/include/hw/misc/imx25_ccm.h
@@ -65,7 +65,8 @@
 
 #define TYPE_IMX25_CCM "imx25.ccm"
 typedef struct IMX25CCMState IMX25CCMState;
-#define IMX25_CCM(obj) OBJECT_CHECK(IMX25CCMState, (obj), TYPE_IMX25_CCM)
+DECLARE_INSTANCE_CHECKER(IMX25CCMState, IMX25_CCM,
+                         TYPE_IMX25_CCM)
 
 struct IMX25CCMState {
     /* <private> */
diff --git a/include/hw/misc/imx31_ccm.h b/include/hw/misc/imx31_ccm.h
index a56ee992af..25e280e976 100644
--- a/include/hw/misc/imx31_ccm.h
+++ b/include/hw/misc/imx31_ccm.h
@@ -74,7 +74,8 @@
 
 #define TYPE_IMX31_CCM "imx31.ccm"
 typedef struct IMX31CCMState IMX31CCMState;
-#define IMX31_CCM(obj) OBJECT_CHECK(IMX31CCMState, (obj), TYPE_IMX31_CCM)
+DECLARE_INSTANCE_CHECKER(IMX31CCMState, IMX31_CCM,
+                         TYPE_IMX31_CCM)
 
 struct IMX31CCMState {
     /* <private> */
diff --git a/include/hw/misc/imx6_ccm.h b/include/hw/misc/imx6_ccm.h
index affa13087e..85f32417d6 100644
--- a/include/hw/misc/imx6_ccm.h
+++ b/include/hw/misc/imx6_ccm.h
@@ -180,7 +180,8 @@
 
 #define TYPE_IMX6_CCM "imx6.ccm"
 typedef struct IMX6CCMState IMX6CCMState;
-#define IMX6_CCM(obj) OBJECT_CHECK(IMX6CCMState, (obj), TYPE_IMX6_CCM)
+DECLARE_INSTANCE_CHECKER(IMX6CCMState, IMX6_CCM,
+                         TYPE_IMX6_CCM)
 
 struct IMX6CCMState {
     /* <private> */
diff --git a/include/hw/misc/imx6_src.h b/include/hw/misc/imx6_src.h
index f1d70ec177..15b51757ba 100644
--- a/include/hw/misc/imx6_src.h
+++ b/include/hw/misc/imx6_src.h
@@ -59,7 +59,8 @@
 
 #define TYPE_IMX6_SRC "imx6.src"
 typedef struct IMX6SRCState IMX6SRCState;
-#define IMX6_SRC(obj) OBJECT_CHECK(IMX6SRCState, (obj), TYPE_IMX6_SRC)
+DECLARE_INSTANCE_CHECKER(IMX6SRCState, IMX6_SRC,
+                         TYPE_IMX6_SRC)
 
 struct IMX6SRCState {
     /* <private> */
diff --git a/include/hw/misc/imx6ul_ccm.h b/include/hw/misc/imx6ul_ccm.h
index 2304c6e738..d614de0edd 100644
--- a/include/hw/misc/imx6ul_ccm.h
+++ b/include/hw/misc/imx6ul_ccm.h
@@ -209,7 +209,8 @@
 
 #define TYPE_IMX6UL_CCM "imx6ul.ccm"
 typedef struct IMX6ULCCMState IMX6ULCCMState;
-#define IMX6UL_CCM(obj) OBJECT_CHECK(IMX6ULCCMState, (obj), TYPE_IMX6UL_CCM)
+DECLARE_INSTANCE_CHECKER(IMX6ULCCMState, IMX6UL_CCM,
+                         TYPE_IMX6UL_CCM)
 
 struct IMX6ULCCMState {
     /* <private> */
diff --git a/include/hw/misc/imx7_ccm.h b/include/hw/misc/imx7_ccm.h
index 9e9e58a5c2..e2757622d0 100644
--- a/include/hw/misc/imx7_ccm.h
+++ b/include/hw/misc/imx7_ccm.h
@@ -106,7 +106,8 @@ enum IMX7PMURegisters {
 
 #define TYPE_IMX7_CCM "imx7.ccm"
 typedef struct IMX7CCMState IMX7CCMState;
-#define IMX7_CCM(obj) OBJECT_CHECK(IMX7CCMState, (obj), TYPE_IMX7_CCM)
+DECLARE_INSTANCE_CHECKER(IMX7CCMState, IMX7_CCM,
+                         TYPE_IMX7_CCM)
 
 struct IMX7CCMState {
     /* <private> */
@@ -121,7 +122,8 @@ struct IMX7CCMState {
 
 #define TYPE_IMX7_ANALOG "imx7.analog"
 typedef struct IMX7AnalogState IMX7AnalogState;
-#define IMX7_ANALOG(obj) OBJECT_CHECK(IMX7AnalogState, (obj), TYPE_IMX7_ANALOG)
+DECLARE_INSTANCE_CHECKER(IMX7AnalogState, IMX7_ANALOG,
+                         TYPE_IMX7_ANALOG)
 
 struct IMX7AnalogState {
     /* <private> */
diff --git a/include/hw/misc/imx7_gpr.h b/include/hw/misc/imx7_gpr.h
index 83384ec0cc..f80b3ed28c 100644
--- a/include/hw/misc/imx7_gpr.h
+++ b/include/hw/misc/imx7_gpr.h
@@ -18,7 +18,8 @@
 
 #define TYPE_IMX7_GPR "imx7.gpr"
 typedef struct IMX7GPRState IMX7GPRState;
-#define IMX7_GPR(obj) OBJECT_CHECK(IMX7GPRState, (obj), TYPE_IMX7_GPR)
+DECLARE_INSTANCE_CHECKER(IMX7GPRState, IMX7_GPR,
+                         TYPE_IMX7_GPR)
 
 struct IMX7GPRState {
     /* <private> */
diff --git a/include/hw/misc/imx7_snvs.h b/include/hw/misc/imx7_snvs.h
index f8659acb7d..ea5395c107 100644
--- a/include/hw/misc/imx7_snvs.h
+++ b/include/hw/misc/imx7_snvs.h
@@ -25,7 +25,8 @@ enum IMX7SNVSRegisters {
 
 #define TYPE_IMX7_SNVS "imx7.snvs"
 typedef struct IMX7SNVSState IMX7SNVSState;
-#define IMX7_SNVS(obj) OBJECT_CHECK(IMX7SNVSState, (obj), TYPE_IMX7_SNVS)
+DECLARE_INSTANCE_CHECKER(IMX7SNVSState, IMX7_SNVS,
+                         TYPE_IMX7_SNVS)
 
 struct IMX7SNVSState {
     /* <private> */
diff --git a/include/hw/misc/imx_rngc.h b/include/hw/misc/imx_rngc.h
index cd7ba8f91e..f7b569cac5 100644
--- a/include/hw/misc/imx_rngc.h
+++ b/include/hw/misc/imx_rngc.h
@@ -15,7 +15,8 @@
 
 #define TYPE_IMX_RNGC "imx.rngc"
 typedef struct IMXRNGCState IMXRNGCState;
-#define IMX_RNGC(obj) OBJECT_CHECK(IMXRNGCState, (obj), TYPE_IMX_RNGC)
+DECLARE_INSTANCE_CHECKER(IMXRNGCState, IMX_RNGC,
+                         TYPE_IMX_RNGC)
 
 struct IMXRNGCState {
     /*< private >*/
diff --git a/include/hw/misc/iotkit-secctl.h b/include/hw/misc/iotkit-secctl.h
index 3d54d8f3de..d062ed43e7 100644
--- a/include/hw/misc/iotkit-secctl.h
+++ b/include/hw/misc/iotkit-secctl.h
@@ -60,7 +60,8 @@
 
 #define TYPE_IOTKIT_SECCTL "iotkit-secctl"
 typedef struct IoTKitSecCtl IoTKitSecCtl;
-#define IOTKIT_SECCTL(obj) OBJECT_CHECK(IoTKitSecCtl, (obj), TYPE_IOTKIT_SECCTL)
+DECLARE_INSTANCE_CHECKER(IoTKitSecCtl, IOTKIT_SECCTL,
+                         TYPE_IOTKIT_SECCTL)
 
 #define IOTS_APB_PPC0_NUM_PORTS 3
 #define IOTS_APB_PPC1_NUM_PORTS 1
diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
index 27fe6346e6..22ceb5d76d 100644
--- a/include/hw/misc/iotkit-sysctl.h
+++ b/include/hw/misc/iotkit-sysctl.h
@@ -32,8 +32,8 @@
 
 #define TYPE_IOTKIT_SYSCTL "iotkit-sysctl"
 typedef struct IoTKitSysCtl IoTKitSysCtl;
-#define IOTKIT_SYSCTL(obj) OBJECT_CHECK(IoTKitSysCtl, (obj), \
-                                        TYPE_IOTKIT_SYSCTL)
+DECLARE_INSTANCE_CHECKER(IoTKitSysCtl, IOTKIT_SYSCTL,
+                         TYPE_IOTKIT_SYSCTL)
 
 struct IoTKitSysCtl {
     /*< private >*/
diff --git a/include/hw/misc/iotkit-sysinfo.h b/include/hw/misc/iotkit-sysinfo.h
index e0e610c75c..23ae43e549 100644
--- a/include/hw/misc/iotkit-sysinfo.h
+++ b/include/hw/misc/iotkit-sysinfo.h
@@ -27,8 +27,8 @@
 
 #define TYPE_IOTKIT_SYSINFO "iotkit-sysinfo"
 typedef struct IoTKitSysInfo IoTKitSysInfo;
-#define IOTKIT_SYSINFO(obj) OBJECT_CHECK(IoTKitSysInfo, (obj), \
-                                        TYPE_IOTKIT_SYSINFO)
+DECLARE_INSTANCE_CHECKER(IoTKitSysInfo, IOTKIT_SYSINFO,
+                         TYPE_IOTKIT_SYSINFO)
 
 struct IoTKitSysInfo {
     /*< private >*/
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index a59750634f..862cbba3ab 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -33,8 +33,8 @@
 
 #define TYPE_MOS6522_Q800_VIA1 "mos6522-q800-via1"
 typedef struct MOS6522Q800VIA1State MOS6522Q800VIA1State;
-#define MOS6522_Q800_VIA1(obj)  OBJECT_CHECK(MOS6522Q800VIA1State, (obj), \
-                                    TYPE_MOS6522_Q800_VIA1)
+DECLARE_INSTANCE_CHECKER(MOS6522Q800VIA1State, MOS6522_Q800_VIA1,
+                         TYPE_MOS6522_Q800_VIA1)
 
 struct MOS6522Q800VIA1State {
     /*< private >*/
@@ -69,8 +69,8 @@ struct MOS6522Q800VIA1State {
 
 #define TYPE_MOS6522_Q800_VIA2 "mos6522-q800-via2"
 typedef struct MOS6522Q800VIA2State MOS6522Q800VIA2State;
-#define MOS6522_Q800_VIA2(obj)  OBJECT_CHECK(MOS6522Q800VIA2State, (obj), \
-                                    TYPE_MOS6522_Q800_VIA2)
+DECLARE_INSTANCE_CHECKER(MOS6522Q800VIA2State, MOS6522_Q800_VIA2,
+                         TYPE_MOS6522_Q800_VIA2)
 
 struct MOS6522Q800VIA2State {
     /*< private >*/
@@ -80,7 +80,8 @@ struct MOS6522Q800VIA2State {
 
 #define TYPE_MAC_VIA "mac_via"
 typedef struct MacVIAState MacVIAState;
-#define MAC_VIA(obj)   OBJECT_CHECK(MacVIAState, (obj), TYPE_MAC_VIA)
+DECLARE_INSTANCE_CHECKER(MacVIAState, MAC_VIA,
+                         TYPE_MAC_VIA)
 
 struct MacVIAState {
     SysBusDevice busdev;
diff --git a/include/hw/misc/macio/cuda.h b/include/hw/misc/macio/cuda.h
index f2b0069262..e738b6376f 100644
--- a/include/hw/misc/macio/cuda.h
+++ b/include/hw/misc/macio/cuda.h
@@ -66,13 +66,14 @@ struct MOS6522CUDAState {
 typedef struct MOS6522CUDAState MOS6522CUDAState;
 
 #define TYPE_MOS6522_CUDA "mos6522-cuda"
-#define MOS6522_CUDA(obj) OBJECT_CHECK(MOS6522CUDAState, (obj), \
-                                       TYPE_MOS6522_CUDA)
+DECLARE_INSTANCE_CHECKER(MOS6522CUDAState, MOS6522_CUDA,
+                         TYPE_MOS6522_CUDA)
 
 /* Cuda */
 #define TYPE_CUDA "cuda"
 typedef struct CUDAState CUDAState;
-#define CUDA(obj) OBJECT_CHECK(CUDAState, (obj), TYPE_CUDA)
+DECLARE_INSTANCE_CHECKER(CUDAState, CUDA,
+                         TYPE_CUDA)
 
 struct CUDAState {
     /*< private >*/
diff --git a/include/hw/misc/macio/gpio.h b/include/hw/misc/macio/gpio.h
index 2234873250..1d0c8434ae 100644
--- a/include/hw/misc/macio/gpio.h
+++ b/include/hw/misc/macio/gpio.h
@@ -32,7 +32,8 @@
 
 #define TYPE_MACIO_GPIO "macio-gpio"
 typedef struct MacIOGPIOState MacIOGPIOState;
-#define MACIO_GPIO(obj) OBJECT_CHECK(MacIOGPIOState, (obj), TYPE_MACIO_GPIO)
+DECLARE_INSTANCE_CHECKER(MacIOGPIOState, MACIO_GPIO,
+                         TYPE_MACIO_GPIO)
 
 struct MacIOGPIOState {
     /*< private >*/
diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
index 81c28eeef7..02dbf37630 100644
--- a/include/hw/misc/macio/macio.h
+++ b/include/hw/misc/macio/macio.h
@@ -41,7 +41,8 @@
 /* MacIO virtual bus */
 #define TYPE_MACIO_BUS "macio-bus"
 typedef struct MacIOBusState MacIOBusState;
-#define MACIO_BUS(obj) OBJECT_CHECK(MacIOBusState, (obj), TYPE_MACIO_BUS)
+DECLARE_INSTANCE_CHECKER(MacIOBusState, MACIO_BUS,
+                         TYPE_MACIO_BUS)
 
 struct MacIOBusState {
     /*< private >*/
@@ -51,7 +52,8 @@ struct MacIOBusState {
 /* MacIO IDE */
 #define TYPE_MACIO_IDE "macio-ide"
 typedef struct MACIOIDEState MACIOIDEState;
-#define MACIO_IDE(obj) OBJECT_CHECK(MACIOIDEState, (obj), TYPE_MACIO_IDE)
+DECLARE_INSTANCE_CHECKER(MACIOIDEState, MACIO_IDE,
+                         TYPE_MACIO_IDE)
 
 struct MACIOIDEState {
     /*< private >*/
@@ -78,7 +80,8 @@ void macio_ide_register_dma(MACIOIDEState *ide);
 
 #define TYPE_MACIO "macio"
 typedef struct MacIOState MacIOState;
-#define MACIO(obj) OBJECT_CHECK(MacIOState, (obj), TYPE_MACIO)
+DECLARE_INSTANCE_CHECKER(MacIOState, MACIO,
+                         TYPE_MACIO)
 
 struct MacIOState {
     /*< private >*/
@@ -96,8 +99,8 @@ struct MacIOState {
 
 #define TYPE_OLDWORLD_MACIO "macio-oldworld"
 typedef struct OldWorldMacIOState OldWorldMacIOState;
-#define OLDWORLD_MACIO(obj) \
-    OBJECT_CHECK(OldWorldMacIOState, (obj), TYPE_OLDWORLD_MACIO)
+DECLARE_INSTANCE_CHECKER(OldWorldMacIOState, OLDWORLD_MACIO,
+                         TYPE_OLDWORLD_MACIO)
 
 struct OldWorldMacIOState {
     /*< private >*/
@@ -112,8 +115,8 @@ struct OldWorldMacIOState {
 
 #define TYPE_NEWWORLD_MACIO "macio-newworld"
 typedef struct NewWorldMacIOState NewWorldMacIOState;
-#define NEWWORLD_MACIO(obj) \
-    OBJECT_CHECK(NewWorldMacIOState, (obj), TYPE_NEWWORLD_MACIO)
+DECLARE_INSTANCE_CHECKER(NewWorldMacIOState, NEWWORLD_MACIO,
+                         TYPE_NEWWORLD_MACIO)
 
 struct NewWorldMacIOState {
     /*< private >*/
diff --git a/include/hw/misc/macio/pmu.h b/include/hw/misc/macio/pmu.h
index b3982f6f32..0d1a5c1406 100644
--- a/include/hw/misc/macio/pmu.h
+++ b/include/hw/misc/macio/pmu.h
@@ -181,8 +181,8 @@ struct MOS6522PMUState {
 typedef struct MOS6522PMUState MOS6522PMUState;
 
 #define TYPE_MOS6522_PMU "mos6522-pmu"
-#define MOS6522_PMU(obj) OBJECT_CHECK(MOS6522PMUState, (obj), \
-                                      TYPE_MOS6522_PMU)
+DECLARE_INSTANCE_CHECKER(MOS6522PMUState, MOS6522_PMU,
+                         TYPE_MOS6522_PMU)
 /**
  * PMUState:
  * @last_b: last value of B register
@@ -234,6 +234,7 @@ struct PMUState {
 typedef struct PMUState PMUState;
 
 #define TYPE_VIA_PMU "via-pmu"
-#define VIA_PMU(obj) OBJECT_CHECK(PMUState, (obj), TYPE_VIA_PMU)
+DECLARE_INSTANCE_CHECKER(PMUState, VIA_PMU,
+                         TYPE_VIA_PMU)
 
 #endif /* PMU_H */
diff --git a/include/hw/misc/max111x.h b/include/hw/misc/max111x.h
index e903a1af9c..6350a3f7c0 100644
--- a/include/hw/misc/max111x.h
+++ b/include/hw/misc/max111x.h
@@ -49,8 +49,8 @@ typedef struct MAX111xState MAX111xState;
 
 #define TYPE_MAX_111X "max111x"
 
-#define MAX_111X(obj) \
-    OBJECT_CHECK(MAX111xState, (obj), TYPE_MAX_111X)
+DECLARE_INSTANCE_CHECKER(MAX111xState, MAX_111X,
+                         TYPE_MAX_111X)
 
 #define TYPE_MAX_1110 "max1110"
 #define TYPE_MAX_1111 "max1111"
diff --git a/include/hw/misc/mips_cmgcr.h b/include/hw/misc/mips_cmgcr.h
index a334be8edd..923df4f112 100644
--- a/include/hw/misc/mips_cmgcr.h
+++ b/include/hw/misc/mips_cmgcr.h
@@ -15,7 +15,8 @@
 
 #define TYPE_MIPS_GCR "mips-gcr"
 typedef struct MIPSGCRState MIPSGCRState;
-#define MIPS_GCR(obj) OBJECT_CHECK(MIPSGCRState, (obj), TYPE_MIPS_GCR)
+DECLARE_INSTANCE_CHECKER(MIPSGCRState, MIPS_GCR,
+                         TYPE_MIPS_GCR)
 
 #define GCR_BASE_ADDR           0x1fbf8000ULL
 #define GCR_ADDRSPACE_SZ        0x8000
diff --git a/include/hw/misc/mips_cpc.h b/include/hw/misc/mips_cpc.h
index b0131e4a54..7dc188e8a2 100644
--- a/include/hw/misc/mips_cpc.h
+++ b/include/hw/misc/mips_cpc.h
@@ -36,7 +36,8 @@
 
 #define TYPE_MIPS_CPC "mips-cpc"
 typedef struct MIPSCPCState MIPSCPCState;
-#define MIPS_CPC(obj) OBJECT_CHECK(MIPSCPCState, (obj), TYPE_MIPS_CPC)
+DECLARE_INSTANCE_CHECKER(MIPSCPCState, MIPS_CPC,
+                         TYPE_MIPS_CPC)
 
 struct MIPSCPCState {
     SysBusDevice parent_obj;
diff --git a/include/hw/misc/mips_itu.h b/include/hw/misc/mips_itu.h
index 9ddb04708a..7c19f61fbb 100644
--- a/include/hw/misc/mips_itu.h
+++ b/include/hw/misc/mips_itu.h
@@ -25,7 +25,8 @@
 
 #define TYPE_MIPS_ITU "mips-itu"
 typedef struct MIPSITUState MIPSITUState;
-#define MIPS_ITU(obj) OBJECT_CHECK(MIPSITUState, (obj), TYPE_MIPS_ITU)
+DECLARE_INSTANCE_CHECKER(MIPSITUState, MIPS_ITU,
+                         TYPE_MIPS_ITU)
 
 #define ITC_CELL_DEPTH_SHIFT 2
 #define ITC_CELL_DEPTH (1u << ITC_CELL_DEPTH_SHIFT)
diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index e844041bb0..991f5b731e 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -26,7 +26,8 @@
 
 #define TYPE_MPS2_FPGAIO "mps2-fpgaio"
 typedef struct MPS2FPGAIO MPS2FPGAIO;
-#define MPS2_FPGAIO(obj) OBJECT_CHECK(MPS2FPGAIO, (obj), TYPE_MPS2_FPGAIO)
+DECLARE_INSTANCE_CHECKER(MPS2FPGAIO, MPS2_FPGAIO,
+                         TYPE_MPS2_FPGAIO)
 
 struct MPS2FPGAIO {
     /*< private >*/
diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
index 10393c4e3a..445e268b1f 100644
--- a/include/hw/misc/mps2-scc.h
+++ b/include/hw/misc/mps2-scc.h
@@ -17,7 +17,8 @@
 
 #define TYPE_MPS2_SCC "mps2-scc"
 typedef struct MPS2SCC MPS2SCC;
-#define MPS2_SCC(obj) OBJECT_CHECK(MPS2SCC, (obj), TYPE_MPS2_SCC)
+DECLARE_INSTANCE_CHECKER(MPS2SCC, MPS2_SCC,
+                         TYPE_MPS2_SCC)
 
 #define NUM_OSCCLK 3
 
diff --git a/include/hw/misc/msf2-sysreg.h b/include/hw/misc/msf2-sysreg.h
index 6b5d03608a..625932354a 100644
--- a/include/hw/misc/msf2-sysreg.h
+++ b/include/hw/misc/msf2-sysreg.h
@@ -63,7 +63,8 @@ enum {
 
 #define TYPE_MSF2_SYSREG          "msf2-sysreg"
 typedef struct MSF2SysregState MSF2SysregState;
-#define MSF2_SYSREG(obj)  OBJECT_CHECK(MSF2SysregState, (obj), TYPE_MSF2_SYSREG)
+DECLARE_INSTANCE_CHECKER(MSF2SysregState, MSF2_SYSREG,
+                         TYPE_MSF2_SYSREG)
 
 struct MSF2SysregState {
     SysBusDevice parent_obj;
diff --git a/include/hw/misc/nrf51_rng.h b/include/hw/misc/nrf51_rng.h
index 247f167100..7f2263a906 100644
--- a/include/hw/misc/nrf51_rng.h
+++ b/include/hw/misc/nrf51_rng.h
@@ -39,7 +39,8 @@
 #include "qom/object.h"
 #define TYPE_NRF51_RNG "nrf51_soc.rng"
 typedef struct NRF51RNGState NRF51RNGState;
-#define NRF51_RNG(obj) OBJECT_CHECK(NRF51RNGState, (obj), TYPE_NRF51_RNG)
+DECLARE_INSTANCE_CHECKER(NRF51RNGState, NRF51_RNG,
+                         TYPE_NRF51_RNG)
 
 #define NRF51_RNG_SIZE         0x1000
 
diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
index ebf8425903..b6f4e264fe 100644
--- a/include/hw/misc/pca9552.h
+++ b/include/hw/misc/pca9552.h
@@ -15,7 +15,8 @@
 #define TYPE_PCA9552 "pca9552"
 #define TYPE_PCA955X "pca955x"
 typedef struct PCA955xState PCA955xState;
-#define PCA955X(obj) OBJECT_CHECK(PCA955xState, (obj), TYPE_PCA955X)
+DECLARE_INSTANCE_CHECKER(PCA955xState, PCA955X,
+                         TYPE_PCA955X)
 
 #define PCA955X_NR_REGS 10
 #define PCA955X_PIN_COUNT_MAX 16
diff --git a/include/hw/misc/stm32f2xx_syscfg.h b/include/hw/misc/stm32f2xx_syscfg.h
index ff7c976d66..82ccd7cc24 100644
--- a/include/hw/misc/stm32f2xx_syscfg.h
+++ b/include/hw/misc/stm32f2xx_syscfg.h
@@ -38,8 +38,8 @@
 
 #define TYPE_STM32F2XX_SYSCFG "stm32f2xx-syscfg"
 typedef struct STM32F2XXSyscfgState STM32F2XXSyscfgState;
-#define STM32F2XX_SYSCFG(obj) \
-    OBJECT_CHECK(STM32F2XXSyscfgState, (obj), TYPE_STM32F2XX_SYSCFG)
+DECLARE_INSTANCE_CHECKER(STM32F2XXSyscfgState, STM32F2XX_SYSCFG,
+                         TYPE_STM32F2XX_SYSCFG)
 
 struct STM32F2XXSyscfgState {
     /* <private> */
diff --git a/include/hw/misc/stm32f4xx_exti.h b/include/hw/misc/stm32f4xx_exti.h
index 7132615785..4987c286ed 100644
--- a/include/hw/misc/stm32f4xx_exti.h
+++ b/include/hw/misc/stm32f4xx_exti.h
@@ -38,8 +38,8 @@
 
 #define TYPE_STM32F4XX_EXTI "stm32f4xx-exti"
 typedef struct STM32F4xxExtiState STM32F4xxExtiState;
-#define STM32F4XX_EXTI(obj) \
-    OBJECT_CHECK(STM32F4xxExtiState, (obj), TYPE_STM32F4XX_EXTI)
+DECLARE_INSTANCE_CHECKER(STM32F4xxExtiState, STM32F4XX_EXTI,
+                         TYPE_STM32F4XX_EXTI)
 
 #define NUM_GPIO_EVENT_IN_LINES 16
 #define NUM_INTERRUPT_OUT_LINES 16
diff --git a/include/hw/misc/stm32f4xx_syscfg.h b/include/hw/misc/stm32f4xx_syscfg.h
index 78130cb9c3..c3d89d4536 100644
--- a/include/hw/misc/stm32f4xx_syscfg.h
+++ b/include/hw/misc/stm32f4xx_syscfg.h
@@ -39,8 +39,8 @@
 
 #define TYPE_STM32F4XX_SYSCFG "stm32f4xx-syscfg"
 typedef struct STM32F4xxSyscfgState STM32F4xxSyscfgState;
-#define STM32F4XX_SYSCFG(obj) \
-    OBJECT_CHECK(STM32F4xxSyscfgState, (obj), TYPE_STM32F4XX_SYSCFG)
+DECLARE_INSTANCE_CHECKER(STM32F4xxSyscfgState, STM32F4XX_SYSCFG,
+                         TYPE_STM32F4XX_SYSCFG)
 
 #define SYSCFG_NUM_EXTICR 4
 
diff --git a/include/hw/misc/tz-mpc.h b/include/hw/misc/tz-mpc.h
index 2d3eae0834..34e45fdb97 100644
--- a/include/hw/misc/tz-mpc.h
+++ b/include/hw/misc/tz-mpc.h
@@ -36,7 +36,8 @@
 
 #define TYPE_TZ_MPC "tz-mpc"
 typedef struct TZMPC TZMPC;
-#define TZ_MPC(obj) OBJECT_CHECK(TZMPC, (obj), TYPE_TZ_MPC)
+DECLARE_INSTANCE_CHECKER(TZMPC, TZ_MPC,
+                         TYPE_TZ_MPC)
 
 #define TZ_NUM_PORTS 16
 
diff --git a/include/hw/misc/tz-msc.h b/include/hw/misc/tz-msc.h
index 3f719833a9..7169f330ff 100644
--- a/include/hw/misc/tz-msc.h
+++ b/include/hw/misc/tz-msc.h
@@ -56,7 +56,8 @@
 
 #define TYPE_TZ_MSC "tz-msc"
 typedef struct TZMSC TZMSC;
-#define TZ_MSC(obj) OBJECT_CHECK(TZMSC, (obj), TYPE_TZ_MSC)
+DECLARE_INSTANCE_CHECKER(TZMSC, TZ_MSC,
+                         TYPE_TZ_MSC)
 
 struct TZMSC {
     /*< private >*/
diff --git a/include/hw/misc/tz-ppc.h b/include/hw/misc/tz-ppc.h
index 4646005fa5..b5251b715e 100644
--- a/include/hw/misc/tz-ppc.h
+++ b/include/hw/misc/tz-ppc.h
@@ -70,7 +70,8 @@
 
 #define TYPE_TZ_PPC "tz-ppc"
 typedef struct TZPPC TZPPC;
-#define TZ_PPC(obj) OBJECT_CHECK(TZPPC, (obj), TYPE_TZ_PPC)
+DECLARE_INSTANCE_CHECKER(TZPPC, TZ_PPC,
+                         TYPE_TZ_PPC)
 
 #define TZ_NUM_PORTS 16
 
diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
index 6c04c8a923..7c724bab94 100644
--- a/include/hw/misc/unimp.h
+++ b/include/hw/misc/unimp.h
@@ -16,8 +16,8 @@
 #define TYPE_UNIMPLEMENTED_DEVICE "unimplemented-device"
 
 typedef struct UnimplementedDeviceState UnimplementedDeviceState;
-#define UNIMPLEMENTED_DEVICE(obj) \
-    OBJECT_CHECK(UnimplementedDeviceState, (obj), TYPE_UNIMPLEMENTED_DEVICE)
+DECLARE_INSTANCE_CHECKER(UnimplementedDeviceState, UNIMPLEMENTED_DEVICE,
+                         TYPE_UNIMPLEMENTED_DEVICE)
 
 struct UnimplementedDeviceState {
     SysBusDevice parent_obj;
diff --git a/include/hw/misc/vmcoreinfo.h b/include/hw/misc/vmcoreinfo.h
index cf0e51f863..ebada6617a 100644
--- a/include/hw/misc/vmcoreinfo.h
+++ b/include/hw/misc/vmcoreinfo.h
@@ -18,7 +18,8 @@
 
 #define VMCOREINFO_DEVICE "vmcoreinfo"
 typedef struct VMCoreInfoState VMCoreInfoState;
-#define VMCOREINFO(obj) OBJECT_CHECK(VMCoreInfoState, (obj), VMCOREINFO_DEVICE)
+DECLARE_INSTANCE_CHECKER(VMCoreInfoState, VMCOREINFO,
+                         VMCOREINFO_DEVICE)
 
 typedef struct fw_cfg_vmcoreinfo FWCfgVMCoreInfo;
 
diff --git a/include/hw/misc/zynq-xadc.h b/include/hw/misc/zynq-xadc.h
index 7e9767c74f..052f47954f 100644
--- a/include/hw/misc/zynq-xadc.h
+++ b/include/hw/misc/zynq-xadc.h
@@ -25,8 +25,8 @@
 
 #define TYPE_ZYNQ_XADC          "xlnx,zynq-xadc"
 typedef struct ZynqXADCState ZynqXADCState;
-#define ZYNQ_XADC(obj) \
-    OBJECT_CHECK(ZynqXADCState, (obj), TYPE_ZYNQ_XADC)
+DECLARE_INSTANCE_CHECKER(ZynqXADCState, ZYNQ_XADC,
+                         TYPE_ZYNQ_XADC)
 
 struct ZynqXADCState {
     /*< private >*/
diff --git a/include/hw/net/allwinner-sun8i-emac.h b/include/hw/net/allwinner-sun8i-emac.h
index bd38588885..89e56b815b 100644
--- a/include/hw/net/allwinner-sun8i-emac.h
+++ b/include/hw/net/allwinner-sun8i-emac.h
@@ -31,8 +31,8 @@
 
 #define TYPE_AW_SUN8I_EMAC "allwinner-sun8i-emac"
 typedef struct AwSun8iEmacState AwSun8iEmacState;
-#define AW_SUN8I_EMAC(obj) \
-    OBJECT_CHECK(AwSun8iEmacState, (obj), TYPE_AW_SUN8I_EMAC)
+DECLARE_INSTANCE_CHECKER(AwSun8iEmacState, AW_SUN8I_EMAC,
+                         TYPE_AW_SUN8I_EMAC)
 
 /** @} */
 
diff --git a/include/hw/net/allwinner_emac.h b/include/hw/net/allwinner_emac.h
index e927082580..f5f5b67939 100644
--- a/include/hw/net/allwinner_emac.h
+++ b/include/hw/net/allwinner_emac.h
@@ -32,7 +32,8 @@
 
 #define TYPE_AW_EMAC "allwinner-emac"
 typedef struct AwEmacState AwEmacState;
-#define AW_EMAC(obj) OBJECT_CHECK(AwEmacState, (obj), TYPE_AW_EMAC)
+DECLARE_INSTANCE_CHECKER(AwEmacState, AW_EMAC,
+                         TYPE_AW_EMAC)
 
 /*
  * Allwinner EMAC register list
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index 04fd59a525..dff1083738 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -28,7 +28,8 @@
 
 #define TYPE_CADENCE_GEM "cadence_gem"
 typedef struct CadenceGEMState CadenceGEMState;
-#define CADENCE_GEM(obj) OBJECT_CHECK(CadenceGEMState, (obj), TYPE_CADENCE_GEM)
+DECLARE_INSTANCE_CHECKER(CadenceGEMState, CADENCE_GEM,
+                         TYPE_CADENCE_GEM)
 
 #include "net/net.h"
 #include "hw/sysbus.h"
diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
index 6371bf60ab..c6b1c11fca 100644
--- a/include/hw/net/ftgmac100.h
+++ b/include/hw/net/ftgmac100.h
@@ -13,7 +13,8 @@
 
 #define TYPE_FTGMAC100 "ftgmac100"
 typedef struct FTGMAC100State FTGMAC100State;
-#define FTGMAC100(obj) OBJECT_CHECK(FTGMAC100State, (obj), TYPE_FTGMAC100)
+DECLARE_INSTANCE_CHECKER(FTGMAC100State, FTGMAC100,
+                         TYPE_FTGMAC100)
 
 #include "hw/sysbus.h"
 #include "net/net.h"
@@ -70,7 +71,8 @@ struct FTGMAC100State {
 
 #define TYPE_ASPEED_MII "aspeed-mmi"
 typedef struct AspeedMiiState AspeedMiiState;
-#define ASPEED_MII(obj) OBJECT_CHECK(AspeedMiiState, (obj), TYPE_ASPEED_MII)
+DECLARE_INSTANCE_CHECKER(AspeedMiiState, ASPEED_MII,
+                         TYPE_ASPEED_MII)
 
 /*
  * AST2600 MII controller
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index 4d6ac5e408..ffdbc304b6 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -27,7 +27,8 @@
 
 #define TYPE_IMX_FEC "imx.fec"
 typedef struct IMXFECState IMXFECState;
-#define IMX_FEC(obj) OBJECT_CHECK(IMXFECState, (obj), TYPE_IMX_FEC)
+DECLARE_INSTANCE_CHECKER(IMXFECState, IMX_FEC,
+                         TYPE_IMX_FEC)
 
 #define TYPE_IMX_ENET "imx.enet"
 
diff --git a/include/hw/net/lance.h b/include/hw/net/lance.h
index fe459ffea7..f645d6af67 100644
--- a/include/hw/net/lance.h
+++ b/include/hw/net/lance.h
@@ -36,8 +36,8 @@
 
 #define TYPE_LANCE "lance"
 typedef struct SysBusPCNetState SysBusPCNetState;
-#define SYSBUS_PCNET(obj) \
-    OBJECT_CHECK(SysBusPCNetState, (obj), TYPE_LANCE)
+DECLARE_INSTANCE_CHECKER(SysBusPCNetState, SYSBUS_PCNET,
+                         TYPE_LANCE)
 
 struct SysBusPCNetState {
     SysBusDevice parent_obj;
diff --git a/include/hw/net/lasi_82596.h b/include/hw/net/lasi_82596.h
index 141e0cc17a..7b62b04833 100644
--- a/include/hw/net/lasi_82596.h
+++ b/include/hw/net/lasi_82596.h
@@ -14,8 +14,8 @@
 
 #define TYPE_LASI_82596 "lasi_82596"
 typedef struct SysBusI82596State SysBusI82596State;
-#define SYSBUS_I82596(obj) \
-    OBJECT_CHECK(SysBusI82596State, (obj), TYPE_LASI_82596)
+DECLARE_INSTANCE_CHECKER(SysBusI82596State, SYSBUS_I82596,
+                         TYPE_LASI_82596)
 
 struct SysBusI82596State {
     SysBusDevice parent_obj;
diff --git a/include/hw/net/msf2-emac.h b/include/hw/net/msf2-emac.h
index 6aef711007..68194d798c 100644
--- a/include/hw/net/msf2-emac.h
+++ b/include/hw/net/msf2-emac.h
@@ -30,8 +30,8 @@
 
 #define TYPE_MSS_EMAC "msf2-emac"
 typedef struct MSF2EmacState MSF2EmacState;
-#define MSS_EMAC(obj) \
-    OBJECT_CHECK(MSF2EmacState, (obj), TYPE_MSS_EMAC)
+DECLARE_INSTANCE_CHECKER(MSF2EmacState, MSS_EMAC,
+                         TYPE_MSS_EMAC)
 
 #define R_MAX         (0x1a0 / 4)
 #define PHY_MAX_REGS  32
diff --git a/include/hw/nmi.h b/include/hw/nmi.h
index 47fc036e74..fff41bebc6 100644
--- a/include/hw/nmi.h
+++ b/include/hw/nmi.h
@@ -27,10 +27,8 @@
 #define TYPE_NMI "nmi"
 
 typedef struct NMIClass NMIClass;
-#define NMI_CLASS(klass) \
-     OBJECT_CLASS_CHECK(NMIClass, (klass), TYPE_NMI)
-#define NMI_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(NMIClass, (obj), TYPE_NMI)
+DECLARE_CLASS_CHECKERS(NMIClass, NMI,
+                       TYPE_NMI)
 #define NMI(obj) \
      INTERFACE_CHECK(NMIState, (obj), TYPE_NMI)
 
diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index 8407ad21f6..6856d7e095 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -14,8 +14,8 @@
 
 #define TYPE_MAC_NUBUS_BRIDGE "mac-nubus-bridge"
 typedef struct MacNubusState MacNubusState;
-#define MAC_NUBUS_BRIDGE(obj) OBJECT_CHECK(MacNubusState, (obj), \
-                                           TYPE_MAC_NUBUS_BRIDGE)
+DECLARE_INSTANCE_CHECKER(MacNubusState, MAC_NUBUS_BRIDGE,
+                         TYPE_MAC_NUBUS_BRIDGE)
 
 struct MacNubusState {
     SysBusDevice sysbus_dev;
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 226efb2ff7..9370f0d8f0 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -24,12 +24,13 @@
 
 #define TYPE_NUBUS_DEVICE "nubus-device"
 typedef struct NubusDevice NubusDevice;
-#define NUBUS_DEVICE(obj) \
-     OBJECT_CHECK(NubusDevice, (obj), TYPE_NUBUS_DEVICE)
+DECLARE_INSTANCE_CHECKER(NubusDevice, NUBUS_DEVICE,
+                         TYPE_NUBUS_DEVICE)
 
 #define TYPE_NUBUS_BUS "nubus-bus"
 typedef struct NubusBus NubusBus;
-#define NUBUS_BUS(obj) OBJECT_CHECK(NubusBus, (obj), TYPE_NUBUS_BUS)
+DECLARE_INSTANCE_CHECKER(NubusBus, NUBUS_BUS,
+                         TYPE_NUBUS_BUS)
 
 #define TYPE_NUBUS_BRIDGE "nubus-bridge"
 
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 5e00fdc21e..f85393400c 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -12,17 +12,16 @@
 #define TYPE_FW_CFG_MEM "fw_cfg_mem"
 #define TYPE_FW_CFG_DATA_GENERATOR_INTERFACE "fw_cfg-data-generator"
 
-#define FW_CFG(obj)     OBJECT_CHECK(FWCfgState,    (obj), TYPE_FW_CFG)
-#define FW_CFG_IO(obj)  OBJECT_CHECK(FWCfgIoState,  (obj), TYPE_FW_CFG_IO)
-#define FW_CFG_MEM(obj) OBJECT_CHECK(FWCfgMemState, (obj), TYPE_FW_CFG_MEM)
+DECLARE_INSTANCE_CHECKER(FWCfgState, FW_CFG,
+                         TYPE_FW_CFG)
+DECLARE_INSTANCE_CHECKER(FWCfgIoState, FW_CFG_IO,
+                         TYPE_FW_CFG_IO)
+DECLARE_INSTANCE_CHECKER(FWCfgMemState, FW_CFG_MEM,
+                         TYPE_FW_CFG_MEM)
 
 typedef struct FWCfgDataGeneratorClass FWCfgDataGeneratorClass;
-#define FW_CFG_DATA_GENERATOR_CLASS(class) \
-    OBJECT_CLASS_CHECK(FWCfgDataGeneratorClass, (class), \
+DECLARE_CLASS_CHECKERS(FWCfgDataGeneratorClass, FW_CFG_DATA_GENERATOR,
                        TYPE_FW_CFG_DATA_GENERATOR_INTERFACE)
-#define FW_CFG_DATA_GENERATOR_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(FWCfgDataGeneratorClass, (obj), \
-                     TYPE_FW_CFG_DATA_GENERATOR_INTERFACE)
 
 struct FWCfgDataGeneratorClass {
     /*< private >*/
diff --git a/include/hw/nvram/nrf51_nvm.h b/include/hw/nvram/nrf51_nvm.h
index 48871667f1..ab99b09206 100644
--- a/include/hw/nvram/nrf51_nvm.h
+++ b/include/hw/nvram/nrf51_nvm.h
@@ -26,7 +26,8 @@
 #include "qom/object.h"
 #define TYPE_NRF51_NVM "nrf51_soc.nvm"
 typedef struct NRF51NVMState NRF51NVMState;
-#define NRF51_NVM(obj) OBJECT_CHECK(NRF51NVMState, (obj), TYPE_NRF51_NVM)
+DECLARE_INSTANCE_CHECKER(NRF51NVMState, NRF51_NVM,
+                         TYPE_NRF51_NVM)
 
 #define NRF51_UICR_FIXTURE_SIZE 64
 
diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
index 0038bfbe3d..f2f0a27381 100644
--- a/include/hw/or-irq.h
+++ b/include/hw/or-irq.h
@@ -37,7 +37,8 @@
 
 typedef struct OrIRQState qemu_or_irq;
 
-#define OR_IRQ(obj) OBJECT_CHECK(qemu_or_irq, (obj), TYPE_OR_IRQ)
+DECLARE_INSTANCE_CHECKER(qemu_or_irq, OR_IRQ,
+                         TYPE_OR_IRQ)
 
 struct OrIRQState {
     DeviceState parent_obj;
diff --git a/include/hw/pci-bridge/simba.h b/include/hw/pci-bridge/simba.h
index 300379b94d..675aa5a990 100644
--- a/include/hw/pci-bridge/simba.h
+++ b/include/hw/pci-bridge/simba.h
@@ -38,7 +38,7 @@ struct SimbaPCIBridge {
 typedef struct SimbaPCIBridge SimbaPCIBridge;
 
 #define TYPE_SIMBA_PCI_BRIDGE "pbm-bridge"
-#define SIMBA_PCI_BRIDGE(obj) \
-    OBJECT_CHECK(SimbaPCIBridge, (obj), TYPE_SIMBA_PCI_BRIDGE)
+DECLARE_INSTANCE_CHECKER(SimbaPCIBridge, SIMBA_PCI_BRIDGE,
+                         TYPE_SIMBA_PCI_BRIDGE)
 
 #endif
diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index 43ee5b3a12..551eec3107 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -30,13 +30,13 @@
 
 #define TYPE_DESIGNWARE_PCIE_HOST "designware-pcie-host"
 typedef struct DesignwarePCIEHost DesignwarePCIEHost;
-#define DESIGNWARE_PCIE_HOST(obj) \
-     OBJECT_CHECK(DesignwarePCIEHost, (obj), TYPE_DESIGNWARE_PCIE_HOST)
+DECLARE_INSTANCE_CHECKER(DesignwarePCIEHost, DESIGNWARE_PCIE_HOST,
+                         TYPE_DESIGNWARE_PCIE_HOST)
 
 #define TYPE_DESIGNWARE_PCIE_ROOT "designware-pcie-root"
 typedef struct DesignwarePCIERoot DesignwarePCIERoot;
-#define DESIGNWARE_PCIE_ROOT(obj) \
-     OBJECT_CHECK(DesignwarePCIERoot, (obj), TYPE_DESIGNWARE_PCIE_ROOT)
+DECLARE_INSTANCE_CHECKER(DesignwarePCIERoot, DESIGNWARE_PCIE_ROOT,
+                         TYPE_DESIGNWARE_PCIE_ROOT)
 
 struct DesignwarePCIERoot;
 
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index d70e1c69dc..e8432eced8 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -27,13 +27,13 @@
 
 #define TYPE_GPEX_HOST "gpex-pcihost"
 typedef struct GPEXHost GPEXHost;
-#define GPEX_HOST(obj) \
-     OBJECT_CHECK(GPEXHost, (obj), TYPE_GPEX_HOST)
+DECLARE_INSTANCE_CHECKER(GPEXHost, GPEX_HOST,
+                         TYPE_GPEX_HOST)
 
 #define TYPE_GPEX_ROOT_DEVICE "gpex-root"
 typedef struct GPEXRootState GPEXRootState;
-#define MCH_PCI_DEVICE(obj) \
-     OBJECT_CHECK(GPEXRootState, (obj), TYPE_GPEX_ROOT_DEVICE)
+DECLARE_INSTANCE_CHECKER(GPEXRootState, MCH_PCI_DEVICE,
+                         TYPE_GPEX_ROOT_DEVICE)
 
 #define GPEX_NUM_IRQS 4
 
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index 74fe300bff..046c64576d 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -20,8 +20,8 @@
 #define TYPE_I440FX_PCI_DEVICE "i440FX"
 
 typedef struct PCII440FXState PCII440FXState;
-#define I440FX_PCI_DEVICE(obj) \
-    OBJECT_CHECK(PCII440FXState, (obj), TYPE_I440FX_PCI_DEVICE)
+DECLARE_INSTANCE_CHECKER(PCII440FXState, I440FX_PCI_DEVICE,
+                         TYPE_I440FX_PCI_DEVICE)
 
 struct PCII440FXState {
     /*< private >*/
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 43f9e873ae..182f29d681 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -22,7 +22,8 @@ typedef struct PnvPHB3 PnvPHB3;
  */
 #define TYPE_PHB3_MSI "phb3-msi"
 typedef struct Phb3MsiState Phb3MsiState;
-#define PHB3_MSI(obj) OBJECT_CHECK(Phb3MsiState, (obj), TYPE_PHB3_MSI)
+DECLARE_INSTANCE_CHECKER(Phb3MsiState, PHB3_MSI,
+                         TYPE_PHB3_MSI)
 
 #define PHB3_MAX_MSI     2048
 
@@ -72,7 +73,8 @@ typedef struct PnvPhb3DMASpace {
  */
 #define TYPE_PNV_PBCQ "pnv-pbcq"
 typedef struct PnvPBCQState PnvPBCQState;
-#define PNV_PBCQ(obj) OBJECT_CHECK(PnvPBCQState, (obj), TYPE_PNV_PBCQ)
+DECLARE_INSTANCE_CHECKER(PnvPBCQState, PNV_PBCQ,
+                         TYPE_PNV_PBCQ)
 
 struct PnvPBCQState {
     DeviceState parent;
@@ -116,7 +118,8 @@ typedef struct PnvPHB3RootPort {
  * PHB3 PCIe Host Bridge for PowerNV machines (POWER8)
  */
 #define TYPE_PNV_PHB3 "pnv-phb3"
-#define PNV_PHB3(obj) OBJECT_CHECK(PnvPHB3, (obj), TYPE_PNV_PHB3)
+DECLARE_INSTANCE_CHECKER(PnvPHB3, PNV_PHB3,
+                         TYPE_PNV_PHB3)
 
 #define PNV_PHB3_NUM_M64      16
 #define PNV_PHB3_NUM_REGS     (0x1000 >> 3)
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 450602cb72..15a4633178 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -58,7 +58,8 @@ typedef struct PnvPHB4RootPort {
  * PHB4 PCIe Host Bridge for PowerNV machines (POWER9)
  */
 #define TYPE_PNV_PHB4 "pnv-phb4"
-#define PNV_PHB4(obj) OBJECT_CHECK(PnvPHB4, (obj), TYPE_PNV_PHB4)
+DECLARE_INSTANCE_CHECKER(PnvPHB4, PNV_PHB4,
+                         TYPE_PNV_PHB4)
 
 #define PNV_PHB4_MAX_LSIs          8
 #define PNV_PHB4_MAX_INTs          4096
@@ -142,12 +143,12 @@ extern const MemoryRegionOps pnv_phb4_xscom_ops;
  */
 #define TYPE_PNV_PHB4_PEC "pnv-phb4-pec"
 typedef struct PnvPhb4PecClass PnvPhb4PecClass;
-#define PNV_PHB4_PEC(obj) \
-    OBJECT_CHECK(PnvPhb4PecState, (obj), TYPE_PNV_PHB4_PEC)
+DECLARE_OBJ_CHECKERS(PnvPhb4PecState, PnvPhb4PecClass,
+                     PNV_PHB4_PEC, TYPE_PNV_PHB4_PEC)
 
 #define TYPE_PNV_PHB4_PEC_STACK "pnv-phb4-pec-stack"
-#define PNV_PHB4_PEC_STACK(obj) \
-    OBJECT_CHECK(PnvPhb4PecStack, (obj), TYPE_PNV_PHB4_PEC_STACK)
+DECLARE_INSTANCE_CHECKER(PnvPhb4PecStack, PNV_PHB4_PEC_STACK,
+                         TYPE_PNV_PHB4_PEC_STACK)
 
 /* Per-stack data */
 struct PnvPhb4PecStack {
@@ -211,10 +212,6 @@ struct PnvPhb4PecState {
     PnvPhb4PecStack stacks[PHB4_PEC_MAX_STACKS];
 };
 
-#define PNV_PHB4_PEC_CLASS(klass) \
-     OBJECT_CLASS_CHECK(PnvPhb4PecClass, (klass), TYPE_PNV_PHB4_PEC)
-#define PNV_PHB4_PEC_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PnvPhb4PecClass, (obj), TYPE_PNV_PHB4_PEC)
 
 struct PnvPhb4PecClass {
     DeviceClass parent_class;
diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index 5db5a763d4..0f5a534f77 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -31,13 +31,13 @@
 
 #define TYPE_Q35_HOST_DEVICE "q35-pcihost"
 typedef struct Q35PCIHost Q35PCIHost;
-#define Q35_HOST_DEVICE(obj) \
-     OBJECT_CHECK(Q35PCIHost, (obj), TYPE_Q35_HOST_DEVICE)
+DECLARE_INSTANCE_CHECKER(Q35PCIHost, Q35_HOST_DEVICE,
+                         TYPE_Q35_HOST_DEVICE)
 
 #define TYPE_MCH_PCI_DEVICE "mch"
 typedef struct MCHPCIState MCHPCIState;
-#define MCH_PCI_DEVICE(obj) \
-     OBJECT_CHECK(MCHPCIState, (obj), TYPE_MCH_PCI_DEVICE)
+DECLARE_INSTANCE_CHECKER(MCHPCIState, MCH_PCI_DEVICE,
+                         TYPE_MCH_PCI_DEVICE)
 
 struct MCHPCIState {
     /*< private >*/
diff --git a/include/hw/pci-host/sabre.h b/include/hw/pci-host/sabre.h
index 5fb508e9ce..597bf70d69 100644
--- a/include/hw/pci-host/sabre.h
+++ b/include/hw/pci-host/sabre.h
@@ -23,8 +23,8 @@ struct SabrePCIState {
 typedef struct SabrePCIState SabrePCIState;
 
 #define TYPE_SABRE_PCI_DEVICE "sabre-pci"
-#define SABRE_PCI_DEVICE(obj) \
-    OBJECT_CHECK(SabrePCIState, (obj), TYPE_SABRE_PCI_DEVICE)
+DECLARE_INSTANCE_CHECKER(SabrePCIState, SABRE_PCI_DEVICE,
+                         TYPE_SABRE_PCI_DEVICE)
 
 struct SabreState {
     PCIHostState parent_obj;
@@ -51,7 +51,7 @@ struct SabreState {
 typedef struct SabreState SabreState;
 
 #define TYPE_SABRE "sabre"
-#define SABRE_DEVICE(obj) \
-    OBJECT_CHECK(SabreState, (obj), TYPE_SABRE)
+DECLARE_INSTANCE_CHECKER(SabreState, SABRE_DEVICE,
+                         TYPE_SABRE)
 
 #endif
diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index 783e8905df..0431ce1048 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -29,8 +29,8 @@
 #define TYPE_SPAPR_PCI_HOST_BRIDGE "spapr-pci-host-bridge"
 
 typedef struct SpaprPhbState SpaprPhbState;
-#define SPAPR_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(SpaprPhbState, (obj), TYPE_SPAPR_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(SpaprPhbState, SPAPR_PCI_HOST_BRIDGE,
+                         TYPE_SPAPR_PCI_HOST_BRIDGE)
 
 #define SPAPR_PCI_DMA_MAX_WINDOWS    2
 
diff --git a/include/hw/pci-host/uninorth.h b/include/hw/pci-host/uninorth.h
index a1f3aaaecd..d10c598298 100644
--- a/include/hw/pci-host/uninorth.h
+++ b/include/hw/pci-host/uninorth.h
@@ -38,14 +38,14 @@
 #define TYPE_U3_AGP_HOST_BRIDGE "u3-agp-pcihost"
 
 typedef struct UNINHostState UNINHostState;
-#define UNI_NORTH_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(UNINHostState, (obj), TYPE_UNI_NORTH_PCI_HOST_BRIDGE)
-#define UNI_NORTH_AGP_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(UNINHostState, (obj), TYPE_UNI_NORTH_AGP_HOST_BRIDGE)
-#define UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(UNINHostState, (obj), TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE)
-#define U3_AGP_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(UNINHostState, (obj), TYPE_U3_AGP_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(UNINHostState, UNI_NORTH_PCI_HOST_BRIDGE,
+                         TYPE_UNI_NORTH_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(UNINHostState, UNI_NORTH_AGP_HOST_BRIDGE,
+                         TYPE_UNI_NORTH_AGP_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(UNINHostState, UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE,
+                         TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(UNINHostState, U3_AGP_HOST_BRIDGE,
+                         TYPE_U3_AGP_HOST_BRIDGE)
 
 struct UNINHostState {
     PCIHostState parent_obj;
@@ -66,7 +66,7 @@ struct UNINState {
 typedef struct UNINState UNINState;
 
 #define TYPE_UNI_NORTH "uni-north"
-#define UNI_NORTH(obj) \
-    OBJECT_CHECK(UNINState, (obj), TYPE_UNI_NORTH)
+DECLARE_INSTANCE_CHECKER(UNINState, UNI_NORTH,
+                         TYPE_UNI_NORTH)
 
 #endif /* UNINORTH_H */
diff --git a/include/hw/pci-host/xilinx-pcie.h b/include/hw/pci-host/xilinx-pcie.h
index 1cbd6d2f79..6058c8c9e2 100644
--- a/include/hw/pci-host/xilinx-pcie.h
+++ b/include/hw/pci-host/xilinx-pcie.h
@@ -28,13 +28,13 @@
 
 #define TYPE_XILINX_PCIE_HOST "xilinx-pcie-host"
 typedef struct XilinxPCIEHost XilinxPCIEHost;
-#define XILINX_PCIE_HOST(obj) \
-     OBJECT_CHECK(XilinxPCIEHost, (obj), TYPE_XILINX_PCIE_HOST)
+DECLARE_INSTANCE_CHECKER(XilinxPCIEHost, XILINX_PCIE_HOST,
+                         TYPE_XILINX_PCIE_HOST)
 
 #define TYPE_XILINX_PCIE_ROOT "xilinx-pcie-root"
 typedef struct XilinxPCIERoot XilinxPCIERoot;
-#define XILINX_PCIE_ROOT(obj) \
-     OBJECT_CHECK(XilinxPCIERoot, (obj), TYPE_XILINX_PCIE_ROOT)
+DECLARE_INSTANCE_CHECKER(XilinxPCIERoot, XILINX_PCIE_ROOT,
+                         TYPE_XILINX_PCIE_ROOT)
 
 struct XilinxPCIERoot {
     PCIBridge parent_obj;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index be9e298dba..c13ae1f858 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -197,12 +197,8 @@ enum {
 
 #define TYPE_PCI_DEVICE "pci-device"
 typedef struct PCIDeviceClass PCIDeviceClass;
-#define PCI_DEVICE(obj) \
-     OBJECT_CHECK(PCIDevice, (obj), TYPE_PCI_DEVICE)
-#define PCI_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(PCIDeviceClass, (klass), TYPE_PCI_DEVICE)
-#define PCI_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PCIDeviceClass, (obj), TYPE_PCI_DEVICE)
+DECLARE_OBJ_CHECKERS(PCIDevice, PCIDeviceClass,
+                     PCI_DEVICE, TYPE_PCI_DEVICE)
 
 /* Implemented by devices that can be plugged on PCI Express buses */
 #define INTERFACE_PCIE_DEVICE "pci-express-device"
@@ -399,9 +395,8 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
 
 #define TYPE_PCI_BUS "PCI"
 typedef struct PCIBusClass PCIBusClass;
-#define PCI_BUS(obj) OBJECT_CHECK(PCIBus, (obj), TYPE_PCI_BUS)
-#define PCI_BUS_CLASS(klass) OBJECT_CLASS_CHECK(PCIBusClass, (klass), TYPE_PCI_BUS)
-#define PCI_BUS_GET_CLASS(obj) OBJECT_GET_CLASS(PCIBusClass, (obj), TYPE_PCI_BUS)
+DECLARE_OBJ_CHECKERS(PCIBus, PCIBusClass,
+                     PCI_BUS, TYPE_PCI_BUS)
 #define TYPE_PCIE_BUS "PCIE"
 
 bool pci_bus_is_express(PCIBus *bus);
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index b46d37faa8..7ab145955a 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -51,7 +51,8 @@ struct PCIBridgeWindows {
 };
 
 #define TYPE_PCI_BRIDGE "base-pci-bridge"
-#define PCI_BRIDGE(obj) OBJECT_CHECK(PCIBridge, (obj), TYPE_PCI_BRIDGE)
+DECLARE_INSTANCE_CHECKER(PCIBridge, PCI_BRIDGE,
+                         TYPE_PCI_BRIDGE)
 
 struct PCIBridge {
     /*< private >*/
diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
index 51ea53908f..d1fc1c3604 100644
--- a/include/hw/pci/pci_host.h
+++ b/include/hw/pci/pci_host.h
@@ -33,12 +33,8 @@
 
 #define TYPE_PCI_HOST_BRIDGE "pci-host-bridge"
 typedef struct PCIHostBridgeClass PCIHostBridgeClass;
-#define PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(PCIHostState, (obj), TYPE_PCI_HOST_BRIDGE)
-#define PCI_HOST_BRIDGE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(PCIHostBridgeClass, (klass), TYPE_PCI_HOST_BRIDGE)
-#define PCI_HOST_BRIDGE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PCIHostBridgeClass, (obj), TYPE_PCI_HOST_BRIDGE)
+DECLARE_OBJ_CHECKERS(PCIHostState, PCIHostBridgeClass,
+                     PCI_HOST_BRIDGE, TYPE_PCI_HOST_BRIDGE)
 
 struct PCIHostState {
     SysBusDevice busdev;
diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
index c7d2ae5bf4..f512646c0c 100644
--- a/include/hw/pci/pcie_host.h
+++ b/include/hw/pci/pcie_host.h
@@ -26,8 +26,8 @@
 #include "qom/object.h"
 
 #define TYPE_PCIE_HOST_BRIDGE "pcie-host-bridge"
-#define PCIE_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(PCIExpressHost, (obj), TYPE_PCIE_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(PCIExpressHost, PCIE_HOST_BRIDGE,
+                         TYPE_PCIE_HOST_BRIDGE)
 
 #define PCIE_HOST_MCFG_BASE "MCFG"
 #define PCIE_HOST_MCFG_SIZE "mcfg_size"
diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index 765399159f..2463c07fa7 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -26,7 +26,8 @@
 #include "qom/object.h"
 
 #define TYPE_PCIE_PORT "pcie-port"
-#define PCIE_PORT(obj) OBJECT_CHECK(PCIEPort, (obj), TYPE_PCIE_PORT)
+DECLARE_INSTANCE_CHECKER(PCIEPort, PCIE_PORT,
+                         TYPE_PCIE_PORT)
 
 struct PCIEPort {
     /*< private >*/
@@ -40,7 +41,8 @@ struct PCIEPort {
 void pcie_port_init_reg(PCIDevice *d);
 
 #define TYPE_PCIE_SLOT "pcie-slot"
-#define PCIE_SLOT(obj) OBJECT_CHECK(PCIESlot, (obj), TYPE_PCIE_SLOT)
+DECLARE_INSTANCE_CHECKER(PCIESlot, PCIE_SLOT,
+                         TYPE_PCIE_SLOT)
 
 struct PCIESlot {
     /*< private >*/
@@ -69,10 +71,8 @@ void pcie_chassis_del_slot(PCIESlot *s);
 
 #define TYPE_PCIE_ROOT_PORT         "pcie-root-port-base"
 typedef struct PCIERootPortClass PCIERootPortClass;
-#define PCIE_ROOT_PORT_CLASS(klass) \
-     OBJECT_CLASS_CHECK(PCIERootPortClass, (klass), TYPE_PCIE_ROOT_PORT)
-#define PCIE_ROOT_PORT_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PCIERootPortClass, (obj), TYPE_PCIE_ROOT_PORT)
+DECLARE_CLASS_CHECKERS(PCIERootPortClass, PCIE_ROOT_PORT,
+                       TYPE_PCIE_ROOT_PORT)
 
 struct PCIERootPortClass {
     PCIDeviceClass parent_class;
diff --git a/include/hw/pcmcia.h b/include/hw/pcmcia.h
index 0f9e41db02..fb40ae7e09 100644
--- a/include/hw/pcmcia.h
+++ b/include/hw/pcmcia.h
@@ -14,12 +14,8 @@ typedef struct PCMCIASocket {
 #define TYPE_PCMCIA_CARD "pcmcia-card"
 typedef struct PCMCIACardClass PCMCIACardClass;
 typedef struct PCMCIACardState PCMCIACardState;
-#define PCMCIA_CARD(obj) \
-    OBJECT_CHECK(PCMCIACardState, (obj), TYPE_PCMCIA_CARD)
-#define PCMCIA_CARD_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(PCMCIACardClass, obj, TYPE_PCMCIA_CARD)
-#define PCMCIA_CARD_CLASS(cls) \
-    OBJECT_CLASS_CHECK(PCMCIACardClass, cls, TYPE_PCMCIA_CARD)
+DECLARE_OBJ_CHECKERS(PCMCIACardState, PCMCIACardClass,
+                     PCMCIA_CARD, TYPE_PCMCIA_CARD)
 
 struct PCMCIACardState {
     /*< private >*/
diff --git a/include/hw/platform-bus.h b/include/hw/platform-bus.h
index cda1346a4f..0d035e1b71 100644
--- a/include/hw/platform-bus.h
+++ b/include/hw/platform-bus.h
@@ -28,8 +28,8 @@
 typedef struct PlatformBusDevice PlatformBusDevice;
 
 #define TYPE_PLATFORM_BUS_DEVICE "platform-bus-device"
-#define PLATFORM_BUS_DEVICE(obj) \
-     OBJECT_CHECK(PlatformBusDevice, (obj), TYPE_PLATFORM_BUS_DEVICE)
+DECLARE_INSTANCE_CHECKER(PlatformBusDevice, PLATFORM_BUS_DEVICE,
+                         TYPE_PLATFORM_BUS_DEVICE)
 
 struct PlatformBusDevice {
     /*< private >*/
diff --git a/include/hw/ppc/mac_dbdma.h b/include/hw/ppc/mac_dbdma.h
index e1f42cdbd3..9166d5f758 100644
--- a/include/hw/ppc/mac_dbdma.h
+++ b/include/hw/ppc/mac_dbdma.h
@@ -178,6 +178,7 @@ void DBDMA_register_channel(void *dbdma, int nchan, qemu_irq irq,
 void DBDMA_kick(DBDMAState *dbdma);
 
 #define TYPE_MAC_DBDMA "mac-dbdma"
-#define MAC_DBDMA(obj) OBJECT_CHECK(DBDMAState, (obj), TYPE_MAC_DBDMA)
+DECLARE_INSTANCE_CHECKER(DBDMAState, MAC_DBDMA,
+                         TYPE_MAC_DBDMA)
 
 #endif
diff --git a/include/hw/ppc/openpic.h b/include/hw/ppc/openpic.h
index 81a0b3b1ee..61908c7858 100644
--- a/include/hw/ppc/openpic.h
+++ b/include/hw/ppc/openpic.h
@@ -138,7 +138,8 @@ typedef struct IRQDest {
 
 #define TYPE_OPENPIC "openpic"
 typedef struct OpenPICState OpenPICState;
-#define OPENPIC(obj) OBJECT_CHECK(OpenPICState, (obj), TYPE_OPENPIC)
+DECLARE_INSTANCE_CHECKER(OpenPICState, OPENPIC,
+                         TYPE_OPENPIC)
 
 struct OpenPICState {
     /*< private >*/
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 64f9ee8867..f3bacb6a5c 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -37,11 +37,8 @@
 #define TYPE_PNV_CHIP "pnv-chip"
 typedef struct PnvChip PnvChip;
 typedef struct PnvChipClass PnvChipClass;
-#define PNV_CHIP(obj) OBJECT_CHECK(PnvChip, (obj), TYPE_PNV_CHIP)
-#define PNV_CHIP_CLASS(klass) \
-     OBJECT_CLASS_CHECK(PnvChipClass, (klass), TYPE_PNV_CHIP)
-#define PNV_CHIP_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PnvChipClass, (obj), TYPE_PNV_CHIP)
+DECLARE_OBJ_CHECKERS(PnvChip, PnvChipClass,
+                     PNV_CHIP, TYPE_PNV_CHIP)
 
 struct PnvChip {
     /*< private >*/
@@ -68,7 +65,8 @@ struct PnvChip {
 
 #define TYPE_PNV8_CHIP "pnv8-chip"
 typedef struct Pnv8Chip Pnv8Chip;
-#define PNV8_CHIP(obj) OBJECT_CHECK(Pnv8Chip, (obj), TYPE_PNV8_CHIP)
+DECLARE_INSTANCE_CHECKER(Pnv8Chip, PNV8_CHIP,
+                         TYPE_PNV8_CHIP)
 
 struct Pnv8Chip {
     /*< private >*/
@@ -90,7 +88,8 @@ struct Pnv8Chip {
 
 #define TYPE_PNV9_CHIP "pnv9-chip"
 typedef struct Pnv9Chip Pnv9Chip;
-#define PNV9_CHIP(obj) OBJECT_CHECK(Pnv9Chip, (obj), TYPE_PNV9_CHIP)
+DECLARE_INSTANCE_CHECKER(Pnv9Chip, PNV9_CHIP,
+                         TYPE_PNV9_CHIP)
 
 struct Pnv9Chip {
     /*< private >*/
@@ -118,7 +117,8 @@ struct Pnv9Chip {
 
 #define TYPE_PNV10_CHIP "pnv10-chip"
 typedef struct Pnv10Chip Pnv10Chip;
-#define PNV10_CHIP(obj) OBJECT_CHECK(Pnv10Chip, (obj), TYPE_PNV10_CHIP)
+DECLARE_INSTANCE_CHECKER(Pnv10Chip, PNV10_CHIP,
+                         TYPE_PNV10_CHIP)
 
 struct Pnv10Chip {
     /*< private >*/
@@ -156,24 +156,24 @@ struct PnvChipClass {
 #define PNV_CHIP_TYPE_NAME(cpu_model) cpu_model PNV_CHIP_TYPE_SUFFIX
 
 #define TYPE_PNV_CHIP_POWER8E PNV_CHIP_TYPE_NAME("power8e_v2.1")
-#define PNV_CHIP_POWER8E(obj) \
-    OBJECT_CHECK(PnvChip, (obj), TYPE_PNV_CHIP_POWER8E)
+DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER8E,
+                         TYPE_PNV_CHIP_POWER8E)
 
 #define TYPE_PNV_CHIP_POWER8 PNV_CHIP_TYPE_NAME("power8_v2.0")
-#define PNV_CHIP_POWER8(obj) \
-    OBJECT_CHECK(PnvChip, (obj), TYPE_PNV_CHIP_POWER8)
+DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER8,
+                         TYPE_PNV_CHIP_POWER8)
 
 #define TYPE_PNV_CHIP_POWER8NVL PNV_CHIP_TYPE_NAME("power8nvl_v1.0")
-#define PNV_CHIP_POWER8NVL(obj) \
-    OBJECT_CHECK(PnvChip, (obj), TYPE_PNV_CHIP_POWER8NVL)
+DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER8NVL,
+                         TYPE_PNV_CHIP_POWER8NVL)
 
 #define TYPE_PNV_CHIP_POWER9 PNV_CHIP_TYPE_NAME("power9_v2.0")
-#define PNV_CHIP_POWER9(obj) \
-    OBJECT_CHECK(PnvChip, (obj), TYPE_PNV_CHIP_POWER9)
+DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER9,
+                         TYPE_PNV_CHIP_POWER9)
 
 #define TYPE_PNV_CHIP_POWER10 PNV_CHIP_TYPE_NAME("power10_v1.0")
-#define PNV_CHIP_POWER10(obj) \
-    OBJECT_CHECK(PnvChip, (obj), TYPE_PNV_CHIP_POWER10)
+DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
+                         TYPE_PNV_CHIP_POWER10)
 
 /*
  * This generates a HW chip id depending on an index, as found on a
@@ -199,12 +199,8 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
 typedef struct PnvMachineState PnvMachineState;
-#define PNV_MACHINE(obj) \
-    OBJECT_CHECK(PnvMachineState, (obj), TYPE_PNV_MACHINE)
-#define PNV_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(PnvMachineClass, obj, TYPE_PNV_MACHINE)
-#define PNV_MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(PnvMachineClass, klass, TYPE_PNV_MACHINE)
+DECLARE_OBJ_CHECKERS(PnvMachineState, PnvMachineClass,
+                     PNV_MACHINE, TYPE_PNV_MACHINE)
 
 
 struct PnvMachineClass {
diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
index 2d91a7d519..fd17a236e3 100644
--- a/include/hw/ppc/pnv_core.h
+++ b/include/hw/ppc/pnv_core.h
@@ -27,12 +27,8 @@
 #define TYPE_PNV_CORE "powernv-cpu-core"
 typedef struct PnvCore PnvCore;
 typedef struct PnvCoreClass PnvCoreClass;
-#define PNV_CORE(obj) \
-    OBJECT_CHECK(PnvCore, (obj), TYPE_PNV_CORE)
-#define PNV_CORE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(PnvCoreClass, (klass), TYPE_PNV_CORE)
-#define PNV_CORE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PnvCoreClass, (obj), TYPE_PNV_CORE)
+DECLARE_OBJ_CHECKERS(PnvCore, PnvCoreClass,
+                     PNV_CORE, TYPE_PNV_CORE)
 
 typedef struct PnvChip PnvChip;
 
@@ -69,8 +65,8 @@ static inline PnvCPUState *pnv_cpu_state(PowerPCCPU *cpu)
 
 #define TYPE_PNV_QUAD "powernv-cpu-quad"
 typedef struct PnvQuad PnvQuad;
-#define PNV_QUAD(obj) \
-    OBJECT_CHECK(PnvQuad, (obj), TYPE_PNV_QUAD)
+DECLARE_INSTANCE_CHECKER(PnvQuad, PNV_QUAD,
+                         TYPE_PNV_QUAD)
 
 struct PnvQuad {
     DeviceState parent_obj;
diff --git a/include/hw/ppc/pnv_homer.h b/include/hw/ppc/pnv_homer.h
index bedba94e18..7aadcab03c 100644
--- a/include/hw/ppc/pnv_homer.h
+++ b/include/hw/ppc/pnv_homer.h
@@ -26,11 +26,14 @@
 #define TYPE_PNV_HOMER "pnv-homer"
 typedef struct PnvHomer PnvHomer;
 typedef struct PnvHomerClass PnvHomerClass;
-#define PNV_HOMER(obj) OBJECT_CHECK(PnvHomer, (obj), TYPE_PNV_HOMER)
+DECLARE_OBJ_CHECKERS(PnvHomer, PnvHomerClass,
+                     PNV_HOMER, TYPE_PNV_HOMER)
 #define TYPE_PNV8_HOMER TYPE_PNV_HOMER "-POWER8"
-#define PNV8_HOMER(obj) OBJECT_CHECK(PnvHomer, (obj), TYPE_PNV8_HOMER)
+DECLARE_INSTANCE_CHECKER(PnvHomer, PNV8_HOMER,
+                         TYPE_PNV8_HOMER)
 #define TYPE_PNV9_HOMER TYPE_PNV_HOMER "-POWER9"
-#define PNV9_HOMER(obj) OBJECT_CHECK(PnvHomer, (obj), TYPE_PNV9_HOMER)
+DECLARE_INSTANCE_CHECKER(PnvHomer, PNV9_HOMER,
+                         TYPE_PNV9_HOMER)
 
 struct PnvHomer {
     DeviceState parent;
@@ -40,10 +43,6 @@ struct PnvHomer {
     MemoryRegion regs;
 };
 
-#define PNV_HOMER_CLASS(klass)   \
-     OBJECT_CLASS_CHECK(PnvHomerClass, (klass), TYPE_PNV_HOMER)
-#define PNV_HOMER_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PnvHomerClass, (obj), TYPE_PNV_HOMER)
 
 struct PnvHomerClass {
     DeviceClass parent_class;
diff --git a/include/hw/ppc/pnv_lpc.h b/include/hw/ppc/pnv_lpc.h
index 50d92517f2..cd3c13c2a8 100644
--- a/include/hw/ppc/pnv_lpc.h
+++ b/include/hw/ppc/pnv_lpc.h
@@ -26,16 +26,19 @@
 #define TYPE_PNV_LPC "pnv-lpc"
 typedef struct PnvLpcClass PnvLpcClass;
 typedef struct PnvLpcController PnvLpcController;
-#define PNV_LPC(obj) \
-     OBJECT_CHECK(PnvLpcController, (obj), TYPE_PNV_LPC)
+DECLARE_OBJ_CHECKERS(PnvLpcController, PnvLpcClass,
+                     PNV_LPC, TYPE_PNV_LPC)
 #define TYPE_PNV8_LPC TYPE_PNV_LPC "-POWER8"
-#define PNV8_LPC(obj) OBJECT_CHECK(PnvLpcController, (obj), TYPE_PNV8_LPC)
+DECLARE_INSTANCE_CHECKER(PnvLpcController, PNV8_LPC,
+                         TYPE_PNV8_LPC)
 
 #define TYPE_PNV9_LPC TYPE_PNV_LPC "-POWER9"
-#define PNV9_LPC(obj) OBJECT_CHECK(PnvLpcController, (obj), TYPE_PNV9_LPC)
+DECLARE_INSTANCE_CHECKER(PnvLpcController, PNV9_LPC,
+                         TYPE_PNV9_LPC)
 
 #define TYPE_PNV10_LPC TYPE_PNV_LPC "-POWER10"
-#define PNV10_LPC(obj) OBJECT_CHECK(PnvLpcController, (obj), TYPE_PNV10_LPC)
+DECLARE_INSTANCE_CHECKER(PnvLpcController, PNV10_LPC,
+                         TYPE_PNV10_LPC)
 
 struct PnvLpcController {
     DeviceState parent;
@@ -84,10 +87,6 @@ struct PnvLpcController {
     PnvPsi *psi;
 };
 
-#define PNV_LPC_CLASS(klass) \
-     OBJECT_CLASS_CHECK(PnvLpcClass, (klass), TYPE_PNV_LPC)
-#define PNV_LPC_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PnvLpcClass, (obj), TYPE_PNV_LPC)
 
 struct PnvLpcClass {
     DeviceClass parent_class;
diff --git a/include/hw/ppc/pnv_occ.h b/include/hw/ppc/pnv_occ.h
index 30a9faea78..4fcfb32417 100644
--- a/include/hw/ppc/pnv_occ.h
+++ b/include/hw/ppc/pnv_occ.h
@@ -26,11 +26,14 @@
 #define TYPE_PNV_OCC "pnv-occ"
 typedef struct PnvOCC PnvOCC;
 typedef struct PnvOCCClass PnvOCCClass;
-#define PNV_OCC(obj) OBJECT_CHECK(PnvOCC, (obj), TYPE_PNV_OCC)
+DECLARE_OBJ_CHECKERS(PnvOCC, PnvOCCClass,
+                     PNV_OCC, TYPE_PNV_OCC)
 #define TYPE_PNV8_OCC TYPE_PNV_OCC "-POWER8"
-#define PNV8_OCC(obj) OBJECT_CHECK(PnvOCC, (obj), TYPE_PNV8_OCC)
+DECLARE_INSTANCE_CHECKER(PnvOCC, PNV8_OCC,
+                         TYPE_PNV8_OCC)
 #define TYPE_PNV9_OCC TYPE_PNV_OCC "-POWER9"
-#define PNV9_OCC(obj) OBJECT_CHECK(PnvOCC, (obj), TYPE_PNV9_OCC)
+DECLARE_INSTANCE_CHECKER(PnvOCC, PNV9_OCC,
+                         TYPE_PNV9_OCC)
 
 #define PNV_OCC_SENSOR_DATA_BLOCK_OFFSET 0x00580000
 #define PNV_OCC_SENSOR_DATA_BLOCK_SIZE   0x00025800
@@ -47,10 +50,6 @@ struct PnvOCC {
     MemoryRegion sram_regs;
 };
 
-#define PNV_OCC_CLASS(klass) \
-     OBJECT_CLASS_CHECK(PnvOCCClass, (klass), TYPE_PNV_OCC)
-#define PNV_OCC_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PnvOCCClass, (obj), TYPE_PNV_OCC)
 
 struct PnvOCCClass {
     DeviceClass parent_class;
diff --git a/include/hw/ppc/pnv_pnor.h b/include/hw/ppc/pnv_pnor.h
index 8b27bf111c..1ec4098bb9 100644
--- a/include/hw/ppc/pnv_pnor.h
+++ b/include/hw/ppc/pnv_pnor.h
@@ -17,7 +17,8 @@
 
 #define TYPE_PNV_PNOR  "pnv-pnor"
 typedef struct PnvPnor PnvPnor;
-#define PNV_PNOR(obj)  OBJECT_CHECK(PnvPnor, (obj), TYPE_PNV_PNOR)
+DECLARE_INSTANCE_CHECKER(PnvPnor, PNV_PNOR,
+                         TYPE_PNV_PNOR)
 
 struct PnvPnor {
     SysBusDevice   parent_obj;
diff --git a/include/hw/ppc/pnv_psi.h b/include/hw/ppc/pnv_psi.h
index 060a7a110c..a33195df17 100644
--- a/include/hw/ppc/pnv_psi.h
+++ b/include/hw/ppc/pnv_psi.h
@@ -28,8 +28,8 @@
 #define TYPE_PNV_PSI "pnv-psi"
 typedef struct PnvPsi PnvPsi;
 typedef struct PnvPsiClass PnvPsiClass;
-#define PNV_PSI(obj) \
-     OBJECT_CHECK(PnvPsi, (obj), TYPE_PNV_PSI)
+DECLARE_OBJ_CHECKERS(PnvPsi, PnvPsiClass,
+                     PNV_PSI, TYPE_PNV_PSI)
 
 #define PSIHB_XSCOM_MAX         0x20
 
@@ -54,8 +54,8 @@ struct PnvPsi {
 
 #define TYPE_PNV8_PSI TYPE_PNV_PSI "-POWER8"
 typedef struct Pnv8Psi Pnv8Psi;
-#define PNV8_PSI(obj) \
-    OBJECT_CHECK(Pnv8Psi, (obj), TYPE_PNV8_PSI)
+DECLARE_INSTANCE_CHECKER(Pnv8Psi, PNV8_PSI,
+                         TYPE_PNV8_PSI)
 
 struct Pnv8Psi {
     PnvPsi   parent;
@@ -65,8 +65,8 @@ struct Pnv8Psi {
 
 #define TYPE_PNV9_PSI TYPE_PNV_PSI "-POWER9"
 typedef struct Pnv9Psi Pnv9Psi;
-#define PNV9_PSI(obj) \
-    OBJECT_CHECK(Pnv9Psi, (obj), TYPE_PNV9_PSI)
+DECLARE_INSTANCE_CHECKER(Pnv9Psi, PNV9_PSI,
+                         TYPE_PNV9_PSI)
 
 struct Pnv9Psi {
     PnvPsi   parent;
@@ -76,10 +76,6 @@ struct Pnv9Psi {
 
 #define TYPE_PNV10_PSI TYPE_PNV_PSI "-POWER10"
 
-#define PNV_PSI_CLASS(klass) \
-     OBJECT_CLASS_CHECK(PnvPsiClass, (klass), TYPE_PNV_PSI)
-#define PNV_PSI_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PnvPsiClass, (obj), TYPE_PNV_PSI)
 
 struct PnvPsiClass {
     SysBusDeviceClass parent_class;
diff --git a/include/hw/ppc/pnv_xive.h b/include/hw/ppc/pnv_xive.h
index 24c37de184..a014e2a726 100644
--- a/include/hw/ppc/pnv_xive.h
+++ b/include/hw/ppc/pnv_xive.h
@@ -18,11 +18,8 @@ struct PnvChip;
 #define TYPE_PNV_XIVE "pnv-xive"
 typedef struct PnvXive PnvXive;
 typedef struct PnvXiveClass PnvXiveClass;
-#define PNV_XIVE(obj) OBJECT_CHECK(PnvXive, (obj), TYPE_PNV_XIVE)
-#define PNV_XIVE_CLASS(klass)                                   \
-    OBJECT_CLASS_CHECK(PnvXiveClass, (klass), TYPE_PNV_XIVE)
-#define PNV_XIVE_GET_CLASS(obj)                                 \
-    OBJECT_GET_CLASS(PnvXiveClass, (obj), TYPE_PNV_XIVE)
+DECLARE_OBJ_CHECKERS(PnvXive, PnvXiveClass,
+                     PNV_XIVE, TYPE_PNV_XIVE)
 
 #define XIVE_BLOCK_MAX      16
 
diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index fb9b97f5be..7e3b189c07 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -28,11 +28,8 @@ typedef struct PnvXScomInterface PnvXScomInterface;
 #define PNV_XSCOM_INTERFACE(obj) \
     INTERFACE_CHECK(PnvXScomInterface, (obj), TYPE_PNV_XSCOM_INTERFACE)
 typedef struct PnvXScomInterfaceClass PnvXScomInterfaceClass;
-#define PNV_XSCOM_INTERFACE_CLASS(klass)                \
-    OBJECT_CLASS_CHECK(PnvXScomInterfaceClass, (klass), \
+DECLARE_CLASS_CHECKERS(PnvXScomInterfaceClass, PNV_XSCOM_INTERFACE,
                        TYPE_PNV_XSCOM_INTERFACE)
-#define PNV_XSCOM_INTERFACE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PnvXScomInterfaceClass, (obj), TYPE_PNV_XSCOM_INTERFACE)
 
 struct PnvXScomInterfaceClass {
     InterfaceClass parent;
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 69eafe913a..3b819d7209 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -29,8 +29,8 @@ typedef struct SpaprPendingHpt SpaprPendingHpt;
 #define TYPE_SPAPR_RTC "spapr-rtc"
 
 typedef struct SpaprRtcState SpaprRtcState;
-#define SPAPR_RTC(obj)                                  \
-    OBJECT_CHECK(SpaprRtcState, (obj), TYPE_SPAPR_RTC)
+DECLARE_INSTANCE_CHECKER(SpaprRtcState, SPAPR_RTC,
+                         TYPE_SPAPR_RTC)
 
 struct SpaprRtcState {
     /*< private >*/
@@ -43,12 +43,8 @@ typedef struct SpaprMachineClass SpaprMachineClass;
 
 #define TYPE_SPAPR_MACHINE      "spapr-machine"
 typedef struct SpaprMachineState SpaprMachineState;
-#define SPAPR_MACHINE(obj) \
-    OBJECT_CHECK(SpaprMachineState, (obj), TYPE_SPAPR_MACHINE)
-#define SPAPR_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(SpaprMachineClass, obj, TYPE_SPAPR_MACHINE)
-#define SPAPR_MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(SpaprMachineClass, klass, TYPE_SPAPR_MACHINE)
+DECLARE_OBJ_CHECKERS(SpaprMachineState, SpaprMachineClass,
+                     SPAPR_MACHINE, TYPE_SPAPR_MACHINE)
 
 typedef enum {
     SPAPR_RESIZE_HPT_DEFAULT = 0,
@@ -774,12 +770,12 @@ static inline void spapr_dt_irq(uint32_t *intspec, int irq, bool is_lsi)
 typedef struct SpaprTceTable SpaprTceTable;
 
 #define TYPE_SPAPR_TCE_TABLE "spapr-tce-table"
-#define SPAPR_TCE_TABLE(obj) \
-    OBJECT_CHECK(SpaprTceTable, (obj), TYPE_SPAPR_TCE_TABLE)
+DECLARE_INSTANCE_CHECKER(SpaprTceTable, SPAPR_TCE_TABLE,
+                         TYPE_SPAPR_TCE_TABLE)
 
 #define TYPE_SPAPR_IOMMU_MEMORY_REGION "spapr-iommu-memory-region"
-#define SPAPR_IOMMU_MEMORY_REGION(obj) \
-        OBJECT_CHECK(IOMMUMemoryRegion, (obj), TYPE_SPAPR_IOMMU_MEMORY_REGION)
+DECLARE_INSTANCE_CHECKER(IOMMUMemoryRegion, SPAPR_IOMMU_MEMORY_REGION,
+                         TYPE_SPAPR_IOMMU_MEMORY_REGION)
 
 struct SpaprTceTable {
     DeviceState parent;
diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
index adcf74dbc3..fba6a01050 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -18,12 +18,8 @@
 #define TYPE_SPAPR_CPU_CORE "spapr-cpu-core"
 typedef struct SpaprCpuCore SpaprCpuCore;
 typedef struct SpaprCpuCoreClass SpaprCpuCoreClass;
-#define SPAPR_CPU_CORE(obj) \
-    OBJECT_CHECK(SpaprCpuCore, (obj), TYPE_SPAPR_CPU_CORE)
-#define SPAPR_CPU_CORE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(SpaprCpuCoreClass, (klass), TYPE_SPAPR_CPU_CORE)
-#define SPAPR_CPU_CORE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(SpaprCpuCoreClass, (obj), TYPE_SPAPR_CPU_CORE)
+DECLARE_OBJ_CHECKERS(SpaprCpuCore, SpaprCpuCoreClass,
+                     SPAPR_CPU_CORE, TYPE_SPAPR_CPU_CORE)
 
 #define SPAPR_CPU_CORE_TYPE_NAME(model) model "-" TYPE_SPAPR_CPU_CORE
 
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index ab799930bf..2236aea66a 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -22,72 +22,37 @@
 #define TYPE_SPAPR_DR_CONNECTOR "spapr-dr-connector"
 typedef struct SpaprDrc SpaprDrc;
 typedef struct SpaprDrcClass SpaprDrcClass;
-#define SPAPR_DR_CONNECTOR_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DR_CONNECTOR)
-#define SPAPR_DR_CONNECTOR_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, \
-                           TYPE_SPAPR_DR_CONNECTOR)
-#define SPAPR_DR_CONNECTOR(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                             TYPE_SPAPR_DR_CONNECTOR)
+DECLARE_OBJ_CHECKERS(SpaprDrc, SpaprDrcClass,
+                     SPAPR_DR_CONNECTOR, TYPE_SPAPR_DR_CONNECTOR)
 
 #define TYPE_SPAPR_DRC_PHYSICAL "spapr-drc-physical"
 typedef struct SpaprDrcPhysical SpaprDrcPhysical;
-#define SPAPR_DRC_PHYSICAL_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_PHYSICAL)
-#define SPAPR_DRC_PHYSICAL_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, \
-                           TYPE_SPAPR_DRC_PHYSICAL)
-#define SPAPR_DRC_PHYSICAL(obj) OBJECT_CHECK(SpaprDrcPhysical, (obj), \
-                                             TYPE_SPAPR_DRC_PHYSICAL)
+DECLARE_OBJ_CHECKERS(SpaprDrcPhysical, SpaprDrcClass,
+                     SPAPR_DRC_PHYSICAL, TYPE_SPAPR_DRC_PHYSICAL)
 
 #define TYPE_SPAPR_DRC_LOGICAL "spapr-drc-logical"
-#define SPAPR_DRC_LOGICAL_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_LOGICAL)
-#define SPAPR_DRC_LOGICAL_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, \
-                           TYPE_SPAPR_DRC_LOGICAL)
-#define SPAPR_DRC_LOGICAL(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                             TYPE_SPAPR_DRC_LOGICAL)
+DECLARE_OBJ_CHECKERS(SpaprDrc, SpaprDrcClass,
+                     SPAPR_DRC_LOGICAL, TYPE_SPAPR_DRC_LOGICAL)
 
 #define TYPE_SPAPR_DRC_CPU "spapr-drc-cpu"
-#define SPAPR_DRC_CPU_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_CPU)
-#define SPAPR_DRC_CPU_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, TYPE_SPAPR_DRC_CPU)
-#define SPAPR_DRC_CPU(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                        TYPE_SPAPR_DRC_CPU)
+DECLARE_OBJ_CHECKERS(SpaprDrc, SpaprDrcClass,
+                     SPAPR_DRC_CPU, TYPE_SPAPR_DRC_CPU)
 
 #define TYPE_SPAPR_DRC_PCI "spapr-drc-pci"
-#define SPAPR_DRC_PCI_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_PCI)
-#define SPAPR_DRC_PCI_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, TYPE_SPAPR_DRC_PCI)
-#define SPAPR_DRC_PCI(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                        TYPE_SPAPR_DRC_PCI)
+DECLARE_OBJ_CHECKERS(SpaprDrc, SpaprDrcClass,
+                     SPAPR_DRC_PCI, TYPE_SPAPR_DRC_PCI)
 
 #define TYPE_SPAPR_DRC_LMB "spapr-drc-lmb"
-#define SPAPR_DRC_LMB_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_LMB)
-#define SPAPR_DRC_LMB_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, TYPE_SPAPR_DRC_LMB)
-#define SPAPR_DRC_LMB(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                        TYPE_SPAPR_DRC_LMB)
+DECLARE_OBJ_CHECKERS(SpaprDrc, SpaprDrcClass,
+                     SPAPR_DRC_LMB, TYPE_SPAPR_DRC_LMB)
 
 #define TYPE_SPAPR_DRC_PHB "spapr-drc-phb"
-#define SPAPR_DRC_PHB_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_PHB)
-#define SPAPR_DRC_PHB_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, TYPE_SPAPR_DRC_PHB)
-#define SPAPR_DRC_PHB(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                        TYPE_SPAPR_DRC_PHB)
+DECLARE_OBJ_CHECKERS(SpaprDrc, SpaprDrcClass,
+                     SPAPR_DRC_PHB, TYPE_SPAPR_DRC_PHB)
 
 #define TYPE_SPAPR_DRC_PMEM "spapr-drc-pmem"
-#define SPAPR_DRC_PMEM_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_PMEM)
-#define SPAPR_DRC_PMEM_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, TYPE_SPAPR_DRC_PMEM)
-#define SPAPR_DRC_PMEM(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                         TYPE_SPAPR_DRC_PMEM)
+DECLARE_OBJ_CHECKERS(SpaprDrc, SpaprDrcClass,
+                     SPAPR_DRC_PMEM, TYPE_SPAPR_DRC_PMEM)
 /*
  * Various hotplug types managed by SpaprDrc
  *
diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index 83addd0a0b..c22a72c9e2 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -37,10 +37,8 @@ typedef struct SpaprInterruptController SpaprInterruptController;
 #define SPAPR_INTC(obj)                                     \
     INTERFACE_CHECK(SpaprInterruptController, (obj), TYPE_SPAPR_INTC)
 typedef struct SpaprInterruptControllerClass SpaprInterruptControllerClass;
-#define SPAPR_INTC_CLASS(klass)                                     \
-    OBJECT_CLASS_CHECK(SpaprInterruptControllerClass, (klass), TYPE_SPAPR_INTC)
-#define SPAPR_INTC_GET_CLASS(obj)                                   \
-    OBJECT_GET_CLASS(SpaprInterruptControllerClass, (obj), TYPE_SPAPR_INTC)
+DECLARE_CLASS_CHECKERS(SpaprInterruptControllerClass, SPAPR_INTC,
+                       TYPE_SPAPR_INTC)
 
 struct SpaprInterruptControllerClass {
     InterfaceClass parent;
diff --git a/include/hw/ppc/spapr_tpm_proxy.h b/include/hw/ppc/spapr_tpm_proxy.h
index 1e9890d978..300c81b1f0 100644
--- a/include/hw/ppc/spapr_tpm_proxy.h
+++ b/include/hw/ppc/spapr_tpm_proxy.h
@@ -18,8 +18,8 @@
 
 #define TYPE_SPAPR_TPM_PROXY "spapr-tpm-proxy"
 typedef struct SpaprTpmProxy SpaprTpmProxy;
-#define SPAPR_TPM_PROXY(obj) OBJECT_CHECK(SpaprTpmProxy, (obj), \
-                                          TYPE_SPAPR_TPM_PROXY)
+DECLARE_INSTANCE_CHECKER(SpaprTpmProxy, SPAPR_TPM_PROXY,
+                         TYPE_SPAPR_TPM_PROXY)
 
 struct SpaprTpmProxy {
     /*< private >*/
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index 9c9d14e63b..e289028634 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -30,16 +30,13 @@
 #define TYPE_VIO_SPAPR_DEVICE "vio-spapr-device"
 typedef struct SpaprVioDevice SpaprVioDevice;
 typedef struct SpaprVioDeviceClass SpaprVioDeviceClass;
-#define VIO_SPAPR_DEVICE(obj) \
-     OBJECT_CHECK(SpaprVioDevice, (obj), TYPE_VIO_SPAPR_DEVICE)
-#define VIO_SPAPR_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(SpaprVioDeviceClass, (klass), TYPE_VIO_SPAPR_DEVICE)
-#define VIO_SPAPR_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(SpaprVioDeviceClass, (obj), TYPE_VIO_SPAPR_DEVICE)
+DECLARE_OBJ_CHECKERS(SpaprVioDevice, SpaprVioDeviceClass,
+                     VIO_SPAPR_DEVICE, TYPE_VIO_SPAPR_DEVICE)
 
 #define TYPE_SPAPR_VIO_BUS "spapr-vio-bus"
 typedef struct SpaprVioBus SpaprVioBus;
-#define SPAPR_VIO_BUS(obj) OBJECT_CHECK(SpaprVioBus, (obj), TYPE_SPAPR_VIO_BUS)
+DECLARE_INSTANCE_CHECKER(SpaprVioBus, SPAPR_VIO_BUS,
+                         TYPE_SPAPR_VIO_BUS)
 
 #define TYPE_SPAPR_VIO_BRIDGE "spapr-vio-bridge"
 
diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index 620abc6639..feb6630783 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -17,11 +17,8 @@
 #define TYPE_SPAPR_XIVE "spapr-xive"
 typedef struct SpaprXive SpaprXive;
 typedef struct SpaprXiveClass SpaprXiveClass;
-#define SPAPR_XIVE(obj) OBJECT_CHECK(SpaprXive, (obj), TYPE_SPAPR_XIVE)
-#define SPAPR_XIVE_CLASS(klass)                                         \
-    OBJECT_CLASS_CHECK(SpaprXiveClass, (klass), TYPE_SPAPR_XIVE)
-#define SPAPR_XIVE_GET_CLASS(obj)                               \
-    OBJECT_GET_CLASS(SpaprXiveClass, (obj), TYPE_SPAPR_XIVE)
+DECLARE_OBJ_CHECKERS(SpaprXive, SpaprXiveClass,
+                     SPAPR_XIVE, TYPE_SPAPR_XIVE)
 
 struct SpaprXive {
     XiveRouter    parent;
diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
index e5f48faba0..bcb584b90d 100644
--- a/include/hw/ppc/xics.h
+++ b/include/hw/ppc/xics.h
@@ -50,15 +50,13 @@ typedef struct ICSIRQState ICSIRQState;
 typedef struct XICSFabric XICSFabric;
 
 #define TYPE_ICP "icp"
-#define ICP(obj) OBJECT_CHECK(ICPState, (obj), TYPE_ICP)
+DECLARE_OBJ_CHECKERS(ICPState, ICPStateClass,
+                     ICP, TYPE_ICP)
 
 #define TYPE_PNV_ICP "pnv-icp"
-#define PNV_ICP(obj) OBJECT_CHECK(PnvICPState, (obj), TYPE_PNV_ICP)
+DECLARE_INSTANCE_CHECKER(PnvICPState, PNV_ICP,
+                         TYPE_PNV_ICP)
 
-#define ICP_CLASS(klass) \
-     OBJECT_CLASS_CHECK(ICPStateClass, (klass), TYPE_ICP)
-#define ICP_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(ICPStateClass, (obj), TYPE_ICP)
 
 struct ICPStateClass {
     DeviceClass parent_class;
@@ -91,12 +89,9 @@ struct PnvICPState {
 };
 
 #define TYPE_ICS "ics"
-#define ICS(obj) OBJECT_CHECK(ICSState, (obj), TYPE_ICS)
+DECLARE_OBJ_CHECKERS(ICSState, ICSStateClass,
+                     ICS, TYPE_ICS)
 
-#define ICS_CLASS(klass) \
-     OBJECT_CLASS_CHECK(ICSStateClass, (klass), TYPE_ICS)
-#define ICS_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(ICSStateClass, (obj), TYPE_ICS)
 
 struct ICSStateClass {
     DeviceClass parent_class;
@@ -147,10 +142,8 @@ struct ICSIRQState {
 #define XICS_FABRIC(obj)                                     \
     INTERFACE_CHECK(XICSFabric, (obj), TYPE_XICS_FABRIC)
 typedef struct XICSFabricClass XICSFabricClass;
-#define XICS_FABRIC_CLASS(klass)                                     \
-    OBJECT_CLASS_CHECK(XICSFabricClass, (klass), TYPE_XICS_FABRIC)
-#define XICS_FABRIC_GET_CLASS(obj)                                   \
-    OBJECT_GET_CLASS(XICSFabricClass, (obj), TYPE_XICS_FABRIC)
+DECLARE_CLASS_CHECKERS(XICSFabricClass, XICS_FABRIC,
+                       TYPE_XICS_FABRIC)
 
 struct XICSFabricClass {
     InterfaceClass parent;
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 479377f37b..e025ba9653 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -13,9 +13,8 @@ enum {
 
 #define TYPE_DEVICE "device"
 typedef struct DeviceClass DeviceClass;
-#define DEVICE(obj) OBJECT_CHECK(DeviceState, (obj), TYPE_DEVICE)
-#define DEVICE_CLASS(klass) OBJECT_CLASS_CHECK(DeviceClass, (klass), TYPE_DEVICE)
-#define DEVICE_GET_CLASS(obj) OBJECT_GET_CLASS(DeviceClass, (obj), TYPE_DEVICE)
+DECLARE_OBJ_CHECKERS(DeviceState, DeviceClass,
+                     DEVICE, TYPE_DEVICE)
 
 typedef enum DeviceCategory {
     DEVICE_CATEGORY_BRIDGE,
@@ -204,9 +203,8 @@ struct DeviceListener {
 };
 
 #define TYPE_BUS "bus"
-#define BUS(obj) OBJECT_CHECK(BusState, (obj), TYPE_BUS)
-#define BUS_CLASS(klass) OBJECT_CLASS_CHECK(BusClass, (klass), TYPE_BUS)
-#define BUS_GET_CLASS(obj) OBJECT_GET_CLASS(BusClass, (obj), TYPE_BUS)
+DECLARE_OBJ_CHECKERS(BusState, BusClass,
+                     BUS, TYPE_BUS)
 
 struct BusClass {
     ObjectClass parent_class;
diff --git a/include/hw/register.h b/include/hw/register.h
index c4325914b2..45c70394c4 100644
--- a/include/hw/register.h
+++ b/include/hw/register.h
@@ -88,7 +88,8 @@ struct RegisterInfo {
 };
 
 #define TYPE_REGISTER "qemu,register"
-#define REGISTER(obj) OBJECT_CHECK(RegisterInfo, (obj), TYPE_REGISTER)
+DECLARE_INSTANCE_CHECKER(RegisterInfo, REGISTER,
+                         TYPE_REGISTER)
 
 /**
  * This structure is used to group all of the individual registers which are
diff --git a/include/hw/resettable.h b/include/hw/resettable.h
index bcd36bce06..bdcd1276b6 100644
--- a/include/hw/resettable.h
+++ b/include/hw/resettable.h
@@ -18,11 +18,9 @@
 #define TYPE_RESETTABLE_INTERFACE "resettable"
 
 typedef struct ResettableClass ResettableClass;
-#define RESETTABLE_CLASS(class) \
-    OBJECT_CLASS_CHECK(ResettableClass, (class), TYPE_RESETTABLE_INTERFACE)
+DECLARE_CLASS_CHECKERS(ResettableClass, RESETTABLE,
+                       TYPE_RESETTABLE_INTERFACE)
 
-#define RESETTABLE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(ResettableClass, (obj), TYPE_RESETTABLE_INTERFACE)
 
 typedef struct ResettableState ResettableState;
 
diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index b42599ff54..8c15b6325f 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -26,8 +26,8 @@
 
 #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
 typedef struct LowRISCIbexSoCState LowRISCIbexSoCState;
-#define RISCV_IBEX_SOC(obj) \
-    OBJECT_CHECK(LowRISCIbexSoCState, (obj), TYPE_RISCV_IBEX_SOC)
+DECLARE_INSTANCE_CHECKER(LowRISCIbexSoCState, RISCV_IBEX_SOC,
+                         TYPE_RISCV_IBEX_SOC)
 
 struct LowRISCIbexSoCState {
     /*< private >*/
diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index 617b977214..9be1fd80ed 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -28,8 +28,8 @@
 #define TYPE_RISCV_HART_ARRAY "riscv.hart_array"
 
 typedef struct RISCVHartArrayState RISCVHartArrayState;
-#define RISCV_HART_ARRAY(obj) \
-    OBJECT_CHECK(RISCVHartArrayState, (obj), TYPE_RISCV_HART_ARRAY)
+DECLARE_INSTANCE_CHECKER(RISCVHartArrayState, RISCV_HART_ARRAY,
+                         TYPE_RISCV_HART_ARRAY)
 
 struct RISCVHartArrayState {
     /*< private >*/
diff --git a/include/hw/riscv/sifive_clint.h b/include/hw/riscv/sifive_clint.h
index eb51b43dd6..a4fc2fcea4 100644
--- a/include/hw/riscv/sifive_clint.h
+++ b/include/hw/riscv/sifive_clint.h
@@ -26,8 +26,8 @@
 #define TYPE_SIFIVE_CLINT "riscv.sifive.clint"
 
 typedef struct SiFiveCLINTState SiFiveCLINTState;
-#define SIFIVE_CLINT(obj) \
-    OBJECT_CHECK(SiFiveCLINTState, (obj), TYPE_SIFIVE_CLINT)
+DECLARE_INSTANCE_CHECKER(SiFiveCLINTState, SIFIVE_CLINT,
+                         TYPE_SIFIVE_CLINT)
 
 struct SiFiveCLINTState {
     /*< private >*/
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 9dddf91a02..7186c8eca2 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -26,8 +26,8 @@
 
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
 typedef struct SiFiveESoCState SiFiveESoCState;
-#define RISCV_E_SOC(obj) \
-    OBJECT_CHECK(SiFiveESoCState, (obj), TYPE_RISCV_E_SOC)
+DECLARE_INSTANCE_CHECKER(SiFiveESoCState, RISCV_E_SOC,
+                         TYPE_RISCV_E_SOC)
 
 struct SiFiveESoCState {
     /*< private >*/
@@ -52,8 +52,8 @@ struct SiFiveEState {
 typedef struct SiFiveEState SiFiveEState;
 
 #define TYPE_RISCV_E_MACHINE MACHINE_TYPE_NAME("sifive_e")
-#define RISCV_E_MACHINE(obj) \
-    OBJECT_CHECK(SiFiveEState, (obj), TYPE_RISCV_E_MACHINE)
+DECLARE_INSTANCE_CHECKER(SiFiveEState, RISCV_E_MACHINE,
+                         TYPE_RISCV_E_MACHINE)
 
 enum {
     SIFIVE_E_DEBUG,
diff --git a/include/hw/riscv/sifive_e_prci.h b/include/hw/riscv/sifive_e_prci.h
index de1e502eea..262ca16181 100644
--- a/include/hw/riscv/sifive_e_prci.h
+++ b/include/hw/riscv/sifive_e_prci.h
@@ -53,8 +53,8 @@ enum {
 #define TYPE_SIFIVE_E_PRCI      "riscv.sifive.e.prci"
 
 typedef struct SiFiveEPRCIState SiFiveEPRCIState;
-#define SIFIVE_E_PRCI(obj) \
-    OBJECT_CHECK(SiFiveEPRCIState, (obj), TYPE_SIFIVE_E_PRCI)
+DECLARE_INSTANCE_CHECKER(SiFiveEPRCIState, SIFIVE_E_PRCI,
+                         TYPE_SIFIVE_E_PRCI)
 
 struct SiFiveEPRCIState {
     /*< private >*/
diff --git a/include/hw/riscv/sifive_gpio.h b/include/hw/riscv/sifive_gpio.h
index af991fa44e..fc53785c9d 100644
--- a/include/hw/riscv/sifive_gpio.h
+++ b/include/hw/riscv/sifive_gpio.h
@@ -19,7 +19,8 @@
 
 #define TYPE_SIFIVE_GPIO "sifive_soc.gpio"
 typedef struct SIFIVEGPIOState SIFIVEGPIOState;
-#define SIFIVE_GPIO(obj) OBJECT_CHECK(SIFIVEGPIOState, (obj), TYPE_SIFIVE_GPIO)
+DECLARE_INSTANCE_CHECKER(SIFIVEGPIOState, SIFIVE_GPIO,
+                         TYPE_SIFIVE_GPIO)
 
 #define SIFIVE_GPIO_PINS 32
 
diff --git a/include/hw/riscv/sifive_plic.h b/include/hw/riscv/sifive_plic.h
index aa6ae13c3a..b75b1f145d 100644
--- a/include/hw/riscv/sifive_plic.h
+++ b/include/hw/riscv/sifive_plic.h
@@ -27,8 +27,8 @@
 #define TYPE_SIFIVE_PLIC "riscv.sifive.plic"
 
 typedef struct SiFivePLICState SiFivePLICState;
-#define SIFIVE_PLIC(obj) \
-    OBJECT_CHECK(SiFivePLICState, (obj), TYPE_SIFIVE_PLIC)
+DECLARE_INSTANCE_CHECKER(SiFivePLICState, SIFIVE_PLIC,
+                         TYPE_SIFIVE_PLIC)
 
 typedef enum PLICMode {
     PLICMode_U,
diff --git a/include/hw/riscv/sifive_test.h b/include/hw/riscv/sifive_test.h
index dc54b7af0c..88a38d00c5 100644
--- a/include/hw/riscv/sifive_test.h
+++ b/include/hw/riscv/sifive_test.h
@@ -25,8 +25,8 @@
 #define TYPE_SIFIVE_TEST "riscv.sifive.test"
 
 typedef struct SiFiveTestState SiFiveTestState;
-#define SIFIVE_TEST(obj) \
-    OBJECT_CHECK(SiFiveTestState, (obj), TYPE_SIFIVE_TEST)
+DECLARE_INSTANCE_CHECKER(SiFiveTestState, SIFIVE_TEST,
+                         TYPE_SIFIVE_TEST)
 
 struct SiFiveTestState {
     /*< private >*/
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 30bd41d391..ce3af6f169 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -29,8 +29,8 @@
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 typedef struct SiFiveUSoCState SiFiveUSoCState;
-#define RISCV_U_SOC(obj) \
-    OBJECT_CHECK(SiFiveUSoCState, (obj), TYPE_RISCV_U_SOC)
+DECLARE_INSTANCE_CHECKER(SiFiveUSoCState, RISCV_U_SOC,
+                         TYPE_RISCV_U_SOC)
 
 struct SiFiveUSoCState {
     /*< private >*/
@@ -52,8 +52,8 @@ struct SiFiveUSoCState {
 
 #define TYPE_RISCV_U_MACHINE MACHINE_TYPE_NAME("sifive_u")
 typedef struct SiFiveUState SiFiveUState;
-#define RISCV_U_MACHINE(obj) \
-    OBJECT_CHECK(SiFiveUState, (obj), TYPE_RISCV_U_MACHINE)
+DECLARE_INSTANCE_CHECKER(SiFiveUState, RISCV_U_MACHINE,
+                         TYPE_RISCV_U_MACHINE)
 
 struct SiFiveUState {
     /*< private >*/
diff --git a/include/hw/riscv/sifive_u_otp.h b/include/hw/riscv/sifive_u_otp.h
index 4572534f50..82c9176c8f 100644
--- a/include/hw/riscv/sifive_u_otp.h
+++ b/include/hw/riscv/sifive_u_otp.h
@@ -51,8 +51,8 @@
 #define TYPE_SIFIVE_U_OTP           "riscv.sifive.u.otp"
 
 typedef struct SiFiveUOTPState SiFiveUOTPState;
-#define SIFIVE_U_OTP(obj) \
-    OBJECT_CHECK(SiFiveUOTPState, (obj), TYPE_SIFIVE_U_OTP)
+DECLARE_INSTANCE_CHECKER(SiFiveUOTPState, SIFIVE_U_OTP,
+                         TYPE_SIFIVE_U_OTP)
 
 struct SiFiveUOTPState {
     /*< private >*/
diff --git a/include/hw/riscv/sifive_u_prci.h b/include/hw/riscv/sifive_u_prci.h
index 83eab43686..d9ebf40b7f 100644
--- a/include/hw/riscv/sifive_u_prci.h
+++ b/include/hw/riscv/sifive_u_prci.h
@@ -60,8 +60,8 @@
 #define TYPE_SIFIVE_U_PRCI      "riscv.sifive.u.prci"
 
 typedef struct SiFiveUPRCIState SiFiveUPRCIState;
-#define SIFIVE_U_PRCI(obj) \
-    OBJECT_CHECK(SiFiveUPRCIState, (obj), TYPE_SIFIVE_U_PRCI)
+DECLARE_INSTANCE_CHECKER(SiFiveUPRCIState, SIFIVE_U_PRCI,
+                         TYPE_SIFIVE_U_PRCI)
 
 struct SiFiveUPRCIState {
     /*< private >*/
diff --git a/include/hw/riscv/sifive_uart.h b/include/hw/riscv/sifive_uart.h
index 2bb72ac80b..3e962be659 100644
--- a/include/hw/riscv/sifive_uart.h
+++ b/include/hw/riscv/sifive_uart.h
@@ -53,8 +53,8 @@ enum {
 #define TYPE_SIFIVE_UART "riscv.sifive.uart"
 
 typedef struct SiFiveUARTState SiFiveUARTState;
-#define SIFIVE_UART(obj) \
-    OBJECT_CHECK(SiFiveUARTState, (obj), TYPE_SIFIVE_UART)
+DECLARE_INSTANCE_CHECKER(SiFiveUARTState, SIFIVE_UART,
+                         TYPE_SIFIVE_UART)
 
 struct SiFiveUARTState {
     /*< private >*/
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 3069379c84..b4ed9a32eb 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -29,8 +29,8 @@
 
 #define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
 typedef struct RISCVVirtState RISCVVirtState;
-#define RISCV_VIRT_MACHINE(obj) \
-    OBJECT_CHECK(RISCVVirtState, (obj), TYPE_RISCV_VIRT_MACHINE)
+DECLARE_INSTANCE_CHECKER(RISCVVirtState, RISCV_VIRT_MACHINE,
+                         TYPE_RISCV_VIRT_MACHINE)
 
 struct RISCVVirtState {
     /*< private >*/
diff --git a/include/hw/rtc/allwinner-rtc.h b/include/hw/rtc/allwinner-rtc.h
index 1126e05f23..5a6e9fff32 100644
--- a/include/hw/rtc/allwinner-rtc.h
+++ b/include/hw/rtc/allwinner-rtc.h
@@ -62,12 +62,8 @@
 
 typedef struct AwRtcClass AwRtcClass;
 typedef struct AwRtcState AwRtcState;
-#define AW_RTC(obj) \
-    OBJECT_CHECK(AwRtcState, (obj), TYPE_AW_RTC)
-#define AW_RTC_CLASS(klass) \
-     OBJECT_CLASS_CHECK(AwRtcClass, (klass), TYPE_AW_RTC)
-#define AW_RTC_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(AwRtcClass, (obj), TYPE_AW_RTC)
+DECLARE_OBJ_CHECKERS(AwRtcState, AwRtcClass,
+                     AW_RTC, TYPE_AW_RTC)
 
 /** @} */
 
diff --git a/include/hw/rtc/aspeed_rtc.h b/include/hw/rtc/aspeed_rtc.h
index 295f4a7d30..d7691ab88f 100644
--- a/include/hw/rtc/aspeed_rtc.h
+++ b/include/hw/rtc/aspeed_rtc.h
@@ -24,6 +24,7 @@ struct AspeedRtcState {
 typedef struct AspeedRtcState AspeedRtcState;
 
 #define TYPE_ASPEED_RTC "aspeed.rtc"
-#define ASPEED_RTC(obj) OBJECT_CHECK(AspeedRtcState, (obj), TYPE_ASPEED_RTC)
+DECLARE_INSTANCE_CHECKER(AspeedRtcState, ASPEED_RTC,
+                         TYPE_ASPEED_RTC)
 
 #endif /* HW_RTC_ASPEED_RTC_H */
diff --git a/include/hw/rtc/goldfish_rtc.h b/include/hw/rtc/goldfish_rtc.h
index f31b0cbb89..b710c21c94 100644
--- a/include/hw/rtc/goldfish_rtc.h
+++ b/include/hw/rtc/goldfish_rtc.h
@@ -27,8 +27,8 @@
 
 #define TYPE_GOLDFISH_RTC "goldfish_rtc"
 typedef struct GoldfishRTCState GoldfishRTCState;
-#define GOLDFISH_RTC(obj) \
-    OBJECT_CHECK(GoldfishRTCState, (obj), TYPE_GOLDFISH_RTC)
+DECLARE_INSTANCE_CHECKER(GoldfishRTCState, GOLDFISH_RTC,
+                         TYPE_GOLDFISH_RTC)
 
 struct GoldfishRTCState {
     SysBusDevice parent_obj;
diff --git a/include/hw/rtc/m48t59.h b/include/hw/rtc/m48t59.h
index 78aae2c072..04abedf3b2 100644
--- a/include/hw/rtc/m48t59.h
+++ b/include/hw/rtc/m48t59.h
@@ -32,10 +32,8 @@
 #define TYPE_NVRAM "nvram"
 
 typedef struct NvramClass NvramClass;
-#define NVRAM_CLASS(klass) \
-    OBJECT_CLASS_CHECK(NvramClass, (klass), TYPE_NVRAM)
-#define NVRAM_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(NvramClass, (obj), TYPE_NVRAM)
+DECLARE_CLASS_CHECKERS(NvramClass, NVRAM,
+                       TYPE_NVRAM)
 #define NVRAM(obj) \
     INTERFACE_CHECK(Nvram, (obj), TYPE_NVRAM)
 
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 7b42d9c534..e58e006d0d 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -17,7 +17,8 @@
 
 #define TYPE_MC146818_RTC "mc146818rtc"
 typedef struct RTCState RTCState;
-#define MC146818_RTC(obj) OBJECT_CHECK(RTCState, (obj), TYPE_MC146818_RTC)
+DECLARE_INSTANCE_CHECKER(RTCState, MC146818_RTC,
+                         TYPE_MC146818_RTC)
 
 struct RTCState {
     ISADevice parent_obj;
diff --git a/include/hw/rtc/pl031.h b/include/hw/rtc/pl031.h
index 3ddf48cc76..3897b424d4 100644
--- a/include/hw/rtc/pl031.h
+++ b/include/hw/rtc/pl031.h
@@ -20,7 +20,8 @@
 
 #define TYPE_PL031 "pl031"
 typedef struct PL031State PL031State;
-#define PL031(obj) OBJECT_CHECK(PL031State, (obj), TYPE_PL031)
+DECLARE_INSTANCE_CHECKER(PL031State, PL031,
+                         TYPE_PL031)
 
 struct PL031State {
     SysBusDevice parent_obj;
diff --git a/include/hw/rtc/xlnx-zynqmp-rtc.h b/include/hw/rtc/xlnx-zynqmp-rtc.h
index 95c85d3bf1..209de85ae6 100644
--- a/include/hw/rtc/xlnx-zynqmp-rtc.h
+++ b/include/hw/rtc/xlnx-zynqmp-rtc.h
@@ -34,8 +34,8 @@
 #define TYPE_XLNX_ZYNQMP_RTC "xlnx-zynmp.rtc"
 
 typedef struct XlnxZynqMPRTC XlnxZynqMPRTC;
-#define XLNX_ZYNQMP_RTC(obj) \
-     OBJECT_CHECK(XlnxZynqMPRTC, (obj), TYPE_XLNX_ZYNQMP_RTC)
+DECLARE_INSTANCE_CHECKER(XlnxZynqMPRTC, XLNX_ZYNQMP_RTC,
+                         TYPE_XLNX_ZYNQMP_RTC)
 
 REG32(SET_TIME_WRITE, 0x0)
 REG32(SET_TIME_READ, 0x4)
diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
index 4451a9e006..3ed80dba0d 100644
--- a/include/hw/rx/rx62n.h
+++ b/include/hw/rx/rx62n.h
@@ -34,7 +34,8 @@
 
 #define TYPE_RX62N_MCU "rx62n-mcu"
 typedef struct RX62NState RX62NState;
-#define RX62N_MCU(obj) OBJECT_CHECK(RX62NState, (obj), TYPE_RX62N_MCU)
+DECLARE_INSTANCE_CHECKER(RX62NState, RX62N_MCU,
+                         TYPE_RX62N_MCU)
 
 #define TYPE_R5F562N7_MCU "r5f562n7-mcu"
 #define TYPE_R5F562N8_MCU "r5f562n8-mcu"
diff --git a/include/hw/s390x/3270-ccw.h b/include/hw/s390x/3270-ccw.h
index ac254f95ed..9a11093192 100644
--- a/include/hw/s390x/3270-ccw.h
+++ b/include/hw/s390x/3270-ccw.h
@@ -33,12 +33,8 @@
 
 typedef struct EmulatedCcw3270Class EmulatedCcw3270Class;
 typedef struct EmulatedCcw3270Device EmulatedCcw3270Device;
-#define EMULATED_CCW_3270(obj) \
-     OBJECT_CHECK(EmulatedCcw3270Device, (obj), TYPE_EMULATED_CCW_3270)
-#define EMULATED_CCW_3270_CLASS(klass) \
-     OBJECT_CLASS_CHECK(EmulatedCcw3270Class, (klass), TYPE_EMULATED_CCW_3270)
-#define EMULATED_CCW_3270_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(EmulatedCcw3270Class, (obj), TYPE_EMULATED_CCW_3270)
+DECLARE_OBJ_CHECKERS(EmulatedCcw3270Device, EmulatedCcw3270Class,
+                     EMULATED_CCW_3270, TYPE_EMULATED_CCW_3270)
 
 struct EmulatedCcw3270Device {
     CcwDevice parent_obj;
diff --git a/include/hw/s390x/ap-device.h b/include/hw/s390x/ap-device.h
index b3b3e98a67..fb250a20f3 100644
--- a/include/hw/s390x/ap-device.h
+++ b/include/hw/s390x/ap-device.h
@@ -21,7 +21,7 @@ struct APDevice {
 };
 typedef struct APDevice APDevice;
 
-#define AP_DEVICE(obj) \
-    OBJECT_CHECK(APDevice, (obj), AP_DEVICE_TYPE)
+DECLARE_INSTANCE_CHECKER(APDevice, AP_DEVICE,
+                         AP_DEVICE_TYPE)
 
 #endif /* HW_S390X_AP_DEVICE_H */
diff --git a/include/hw/s390x/css-bridge.h b/include/hw/s390x/css-bridge.h
index 05786b38de..9fd4484204 100644
--- a/include/hw/s390x/css-bridge.h
+++ b/include/hw/s390x/css-bridge.h
@@ -24,8 +24,8 @@ struct VirtualCssBridge {
 typedef struct VirtualCssBridge VirtualCssBridge;
 
 #define TYPE_VIRTUAL_CSS_BRIDGE "virtual-css-bridge"
-#define VIRTUAL_CSS_BRIDGE(obj) \
-    OBJECT_CHECK(VirtualCssBridge, (obj), TYPE_VIRTUAL_CSS_BRIDGE)
+DECLARE_INSTANCE_CHECKER(VirtualCssBridge, VIRTUAL_CSS_BRIDGE,
+                         TYPE_VIRTUAL_CSS_BRIDGE)
 
 /* virtual css bus type */
 struct VirtualCssBus {
@@ -34,8 +34,8 @@ struct VirtualCssBus {
 typedef struct VirtualCssBus VirtualCssBus;
 
 #define TYPE_VIRTUAL_CSS_BUS "virtual-css-bus"
-#define VIRTUAL_CSS_BUS(obj) \
-     OBJECT_CHECK(VirtualCssBus, (obj), TYPE_VIRTUAL_CSS_BUS)
+DECLARE_INSTANCE_CHECKER(VirtualCssBus, VIRTUAL_CSS_BUS,
+                         TYPE_VIRTUAL_CSS_BUS)
 VirtualCssBus *virtual_css_bus_init(void);
 
 #endif
diff --git a/include/hw/s390x/event-facility.h b/include/hw/s390x/event-facility.h
index dd1a6a44c0..eccf6e924b 100644
--- a/include/hw/s390x/event-facility.h
+++ b/include/hw/s390x/event-facility.h
@@ -44,12 +44,8 @@
 #define TYPE_SCLP_EVENT "s390-sclp-event-type"
 typedef struct SCLPEvent SCLPEvent;
 typedef struct SCLPEventClass SCLPEventClass;
-#define SCLP_EVENT(obj) \
-     OBJECT_CHECK(SCLPEvent, (obj), TYPE_SCLP_EVENT)
-#define SCLP_EVENT_CLASS(klass) \
-     OBJECT_CLASS_CHECK(SCLPEventClass, (klass), TYPE_SCLP_EVENT)
-#define SCLP_EVENT_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(SCLPEventClass, (obj), TYPE_SCLP_EVENT)
+DECLARE_OBJ_CHECKERS(SCLPEvent, SCLPEventClass,
+                     SCLP_EVENT, TYPE_SCLP_EVENT)
 
 #define TYPE_SCLP_CPU_HOTPLUG "sclp-cpu-hotplug"
 #define TYPE_SCLP_QUIESCE "sclpquiesce"
@@ -200,14 +196,8 @@ struct SCLPEventClass {
 #define TYPE_SCLP_EVENT_FACILITY "s390-sclp-event-facility"
 typedef struct SCLPEventFacility SCLPEventFacility;
 typedef struct SCLPEventFacilityClass SCLPEventFacilityClass;
-#define EVENT_FACILITY(obj) \
-     OBJECT_CHECK(SCLPEventFacility, (obj), TYPE_SCLP_EVENT_FACILITY)
-#define EVENT_FACILITY_CLASS(klass) \
-     OBJECT_CLASS_CHECK(SCLPEventFacilityClass, (klass), \
-                        TYPE_SCLP_EVENT_FACILITY)
-#define EVENT_FACILITY_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(SCLPEventFacilityClass, (obj), \
-                      TYPE_SCLP_EVENT_FACILITY)
+DECLARE_OBJ_CHECKERS(SCLPEventFacility, SCLPEventFacilityClass,
+                     EVENT_FACILITY, TYPE_SCLP_EVENT_FACILITY)
 
 struct SCLPEventFacilityClass {
     SysBusDeviceClass parent_class;
diff --git a/include/hw/s390x/s390-ccw.h b/include/hw/s390x/s390-ccw.h
index f0f96952f1..2c807ee3a1 100644
--- a/include/hw/s390x/s390-ccw.h
+++ b/include/hw/s390x/s390-ccw.h
@@ -19,12 +19,8 @@
 #define TYPE_S390_CCW "s390-ccw"
 typedef struct S390CCWDevice S390CCWDevice;
 typedef struct S390CCWDeviceClass S390CCWDeviceClass;
-#define S390_CCW_DEVICE(obj) \
-    OBJECT_CHECK(S390CCWDevice, (obj), TYPE_S390_CCW)
-#define S390_CCW_DEVICE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(S390CCWDeviceClass, (klass), TYPE_S390_CCW)
-#define S390_CCW_DEVICE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(S390CCWDeviceClass, (obj), TYPE_S390_CCW)
+DECLARE_OBJ_CHECKERS(S390CCWDevice, S390CCWDeviceClass,
+                     S390_CCW_DEVICE, TYPE_S390_CCW)
 
 struct S390CCWDevice {
     CcwDevice parent_obj;
diff --git a/include/hw/s390x/s390_flic.h b/include/hw/s390x/s390_flic.h
index 2ae7cca85b..a6a123598d 100644
--- a/include/hw/s390x/s390_flic.h
+++ b/include/hw/s390x/s390_flic.h
@@ -41,8 +41,8 @@ extern const VMStateDescription vmstate_adapter_routes;
 #define TYPE_S390_FLIC_COMMON "s390-flic"
 typedef struct S390FLICState S390FLICState;
 typedef struct S390FLICStateClass S390FLICStateClass;
-#define S390_FLIC_COMMON(obj) \
-    OBJECT_CHECK(S390FLICState, (obj), TYPE_S390_FLIC_COMMON)
+DECLARE_OBJ_CHECKERS(S390FLICState, S390FLICStateClass,
+                     S390_FLIC_COMMON, TYPE_S390_FLIC_COMMON)
 
 struct S390FLICState {
     SysBusDevice parent_obj;
@@ -51,10 +51,6 @@ struct S390FLICState {
     bool ais_supported;
 };
 
-#define S390_FLIC_COMMON_CLASS(klass) \
-    OBJECT_CLASS_CHECK(S390FLICStateClass, (klass), TYPE_S390_FLIC_COMMON)
-#define S390_FLIC_COMMON_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(S390FLICStateClass, (obj), TYPE_S390_FLIC_COMMON)
 
 struct S390FLICStateClass {
     DeviceClass parent_class;
@@ -79,13 +75,13 @@ struct S390FLICStateClass {
 
 #define TYPE_KVM_S390_FLIC "s390-flic-kvm"
 typedef struct KVMS390FLICState KVMS390FLICState;
-#define KVM_S390_FLIC(obj) \
-    OBJECT_CHECK(KVMS390FLICState, (obj), TYPE_KVM_S390_FLIC)
+DECLARE_INSTANCE_CHECKER(KVMS390FLICState, KVM_S390_FLIC,
+                         TYPE_KVM_S390_FLIC)
 
 #define TYPE_QEMU_S390_FLIC "s390-flic-qemu"
 typedef struct QEMUS390FLICState QEMUS390FLICState;
-#define QEMU_S390_FLIC(obj) \
-    OBJECT_CHECK(QEMUS390FLICState, (obj), TYPE_QEMU_S390_FLIC)
+DECLARE_INSTANCE_CHECKER(QEMUS390FLICState, QEMU_S390_FLIC,
+                         TYPE_QEMU_S390_FLIC)
 
 #define SIC_IRQ_MODE_ALL 0
 #define SIC_IRQ_MODE_SINGLE 1
diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
index 2a5bdc6dfe..5038a45612 100644
--- a/include/hw/s390x/sclp.h
+++ b/include/hw/s390x/sclp.h
@@ -184,9 +184,8 @@ typedef struct SCCB {
 #define TYPE_SCLP "sclp"
 typedef struct SCLPDevice SCLPDevice;
 typedef struct SCLPDeviceClass SCLPDeviceClass;
-#define SCLP(obj) OBJECT_CHECK(SCLPDevice, (obj), TYPE_SCLP)
-#define SCLP_CLASS(oc) OBJECT_CLASS_CHECK(SCLPDeviceClass, (oc), TYPE_SCLP)
-#define SCLP_GET_CLASS(obj) OBJECT_GET_CLASS(SCLPDeviceClass, (obj), TYPE_SCLP)
+DECLARE_OBJ_CHECKERS(SCLPDevice, SCLPDeviceClass,
+                     SCLP, TYPE_SCLP)
 
 struct SCLPEventFacility;
 
diff --git a/include/hw/s390x/storage-attributes.h b/include/hw/s390x/storage-attributes.h
index b5d9663f7c..efb28c48be 100644
--- a/include/hw/s390x/storage-attributes.h
+++ b/include/hw/s390x/storage-attributes.h
@@ -22,8 +22,8 @@
 
 typedef struct S390StAttribClass S390StAttribClass;
 typedef struct S390StAttribState S390StAttribState;
-#define S390_STATTRIB(obj) \
-    OBJECT_CHECK(S390StAttribState, (obj), TYPE_S390_STATTRIB)
+DECLARE_OBJ_CHECKERS(S390StAttribState, S390StAttribClass,
+                     S390_STATTRIB, TYPE_S390_STATTRIB)
 
 struct S390StAttribState {
     DeviceState parent_obj;
@@ -31,10 +31,6 @@ struct S390StAttribState {
     bool migration_enabled;
 };
 
-#define S390_STATTRIB_CLASS(klass) \
-    OBJECT_CLASS_CHECK(S390StAttribClass, (klass), TYPE_S390_STATTRIB)
-#define S390_STATTRIB_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(S390StAttribClass, (obj), TYPE_S390_STATTRIB)
 
 struct S390StAttribClass {
     DeviceClass parent_class;
@@ -52,16 +48,16 @@ struct S390StAttribClass {
 };
 
 typedef struct QEMUS390StAttribState QEMUS390StAttribState;
-#define QEMU_S390_STATTRIB(obj) \
-    OBJECT_CHECK(QEMUS390StAttribState, (obj), TYPE_QEMU_S390_STATTRIB)
+DECLARE_INSTANCE_CHECKER(QEMUS390StAttribState, QEMU_S390_STATTRIB,
+                         TYPE_QEMU_S390_STATTRIB)
 
 struct QEMUS390StAttribState {
     S390StAttribState parent_obj;
 };
 
 typedef struct KVMS390StAttribState KVMS390StAttribState;
-#define KVM_S390_STATTRIB(obj) \
-    OBJECT_CHECK(KVMS390StAttribState, (obj), TYPE_KVM_S390_STATTRIB)
+DECLARE_INSTANCE_CHECKER(KVMS390StAttribState, KVM_S390_STATTRIB,
+                         TYPE_KVM_S390_STATTRIB)
 
 struct KVMS390StAttribState {
     S390StAttribState parent_obj;
diff --git a/include/hw/s390x/storage-keys.h b/include/hw/s390x/storage-keys.h
index e94a201f71..40f042f54e 100644
--- a/include/hw/s390x/storage-keys.h
+++ b/include/hw/s390x/storage-keys.h
@@ -19,8 +19,8 @@
 #define TYPE_S390_SKEYS "s390-skeys"
 typedef struct S390SKeysClass S390SKeysClass;
 typedef struct S390SKeysState S390SKeysState;
-#define S390_SKEYS(obj) \
-    OBJECT_CHECK(S390SKeysState, (obj), TYPE_S390_SKEYS)
+DECLARE_OBJ_CHECKERS(S390SKeysState, S390SKeysClass,
+                     S390_SKEYS, TYPE_S390_SKEYS)
 
 struct S390SKeysState {
     DeviceState parent_obj;
@@ -28,10 +28,6 @@ struct S390SKeysState {
 
 };
 
-#define S390_SKEYS_CLASS(klass) \
-    OBJECT_CLASS_CHECK(S390SKeysClass, (klass), TYPE_S390_SKEYS)
-#define S390_SKEYS_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(S390SKeysClass, (obj), TYPE_S390_SKEYS)
 
 struct S390SKeysClass {
     DeviceClass parent_class;
@@ -45,8 +41,8 @@ struct S390SKeysClass {
 #define TYPE_KVM_S390_SKEYS "s390-skeys-kvm"
 #define TYPE_QEMU_S390_SKEYS "s390-skeys-qemu"
 typedef struct QEMUS390SKeysState QEMUS390SKeysState;
-#define QEMU_S390_SKEYS(obj) \
-    OBJECT_CHECK(QEMUS390SKeysState, (obj), TYPE_QEMU_S390_SKEYS)
+DECLARE_INSTANCE_CHECKER(QEMUS390SKeysState, QEMU_S390_SKEYS,
+                         TYPE_QEMU_S390_SKEYS)
 
 struct QEMUS390SKeysState {
     S390SKeysState parent_obj;
diff --git a/include/hw/s390x/tod.h b/include/hw/s390x/tod.h
index e240faf11c..c02498f65e 100644
--- a/include/hw/s390x/tod.h
+++ b/include/hw/s390x/tod.h
@@ -23,11 +23,8 @@ typedef struct S390TOD {
 #define TYPE_S390_TOD "s390-tod"
 typedef struct S390TODClass S390TODClass;
 typedef struct S390TODState S390TODState;
-#define S390_TOD(obj) OBJECT_CHECK(S390TODState, (obj), TYPE_S390_TOD)
-#define S390_TOD_CLASS(oc) OBJECT_CLASS_CHECK(S390TODClass, (oc), \
-                                              TYPE_S390_TOD)
-#define S390_TOD_GET_CLASS(obj) OBJECT_GET_CLASS(S390TODClass, (obj), \
-                                                 TYPE_S390_TOD)
+DECLARE_OBJ_CHECKERS(S390TODState, S390TODClass,
+                     S390_TOD, TYPE_S390_TOD)
 #define TYPE_KVM_S390_TOD TYPE_S390_TOD "-kvm"
 #define TYPE_QEMU_S390_TOD TYPE_S390_TOD "-qemu"
 
diff --git a/include/hw/s390x/vfio-ccw.h b/include/hw/s390x/vfio-ccw.h
index 7bd4640ac3..9c9c8944ad 100644
--- a/include/hw/s390x/vfio-ccw.h
+++ b/include/hw/s390x/vfio-ccw.h
@@ -21,8 +21,8 @@
 
 #define TYPE_VFIO_CCW "vfio-ccw"
 typedef struct VFIOCCWDevice VFIOCCWDevice;
-#define VFIO_CCW(obj) \
-        OBJECT_CHECK(VFIOCCWDevice, (obj), TYPE_VFIO_CCW)
+DECLARE_INSTANCE_CHECKER(VFIOCCWDevice, VFIO_CCW,
+                         TYPE_VFIO_CCW)
 
 #define TYPE_VFIO_CCW "vfio-ccw"
 
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index d4a4e2930c..f281625dd5 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -67,7 +67,8 @@ struct ESPState {
 
 #define TYPE_ESP "esp"
 typedef struct SysBusESPState SysBusESPState;
-#define ESP_STATE(obj) OBJECT_CHECK(SysBusESPState, (obj), TYPE_ESP)
+DECLARE_INSTANCE_CHECKER(SysBusESPState, ESP_STATE,
+                         TYPE_ESP)
 
 struct SysBusESPState {
     /*< private >*/
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index bad4dfb223..3818e3fa46 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -51,12 +51,8 @@ struct SCSIRequest {
 
 #define TYPE_SCSI_DEVICE "scsi-device"
 typedef struct SCSIDeviceClass SCSIDeviceClass;
-#define SCSI_DEVICE(obj) \
-     OBJECT_CHECK(SCSIDevice, (obj), TYPE_SCSI_DEVICE)
-#define SCSI_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(SCSIDeviceClass, (klass), TYPE_SCSI_DEVICE)
-#define SCSI_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(SCSIDeviceClass, (obj), TYPE_SCSI_DEVICE)
+DECLARE_OBJ_CHECKERS(SCSIDevice, SCSIDeviceClass,
+                     SCSI_DEVICE, TYPE_SCSI_DEVICE)
 
 struct SCSIDeviceClass {
     DeviceClass parent_class;
@@ -138,7 +134,8 @@ struct SCSIBusInfo {
 };
 
 #define TYPE_SCSI_BUS "SCSI"
-#define SCSI_BUS(obj) OBJECT_CHECK(SCSIBus, (obj), TYPE_SCSI_BUS)
+DECLARE_INSTANCE_CHECKER(SCSIBus, SCSI_BUS,
+                         TYPE_SCSI_BUS)
 
 struct SCSIBus {
     BusState qbus;
diff --git a/include/hw/sd/allwinner-sdhost.h b/include/hw/sd/allwinner-sdhost.h
index b23de2c548..7bccc06d1c 100644
--- a/include/hw/sd/allwinner-sdhost.h
+++ b/include/hw/sd/allwinner-sdhost.h
@@ -47,12 +47,8 @@
 
 typedef struct AwSdHostClass AwSdHostClass;
 typedef struct AwSdHostState AwSdHostState;
-#define AW_SDHOST(obj) \
-    OBJECT_CHECK(AwSdHostState, (obj), TYPE_AW_SDHOST)
-#define AW_SDHOST_CLASS(klass) \
-     OBJECT_CLASS_CHECK(AwSdHostClass, (klass), TYPE_AW_SDHOST)
-#define AW_SDHOST_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(AwSdHostClass, (obj), TYPE_AW_SDHOST)
+DECLARE_OBJ_CHECKERS(AwSdHostState, AwSdHostClass,
+                     AW_SDHOST, TYPE_AW_SDHOST)
 
 /** @} */
 
diff --git a/include/hw/sd/aspeed_sdhci.h b/include/hw/sd/aspeed_sdhci.h
index 527075476b..783ccc2956 100644
--- a/include/hw/sd/aspeed_sdhci.h
+++ b/include/hw/sd/aspeed_sdhci.h
@@ -14,8 +14,8 @@
 
 #define TYPE_ASPEED_SDHCI "aspeed.sdhci"
 typedef struct AspeedSDHCIState AspeedSDHCIState;
-#define ASPEED_SDHCI(obj) OBJECT_CHECK(AspeedSDHCIState, (obj), \
-                                       TYPE_ASPEED_SDHCI)
+DECLARE_INSTANCE_CHECKER(AspeedSDHCIState, ASPEED_SDHCI,
+                         TYPE_ASPEED_SDHCI)
 
 #define ASPEED_SDHCI_CAPABILITIES 0x01E80080
 #define ASPEED_SDHCI_NUM_SLOTS    2
diff --git a/include/hw/sd/bcm2835_sdhost.h b/include/hw/sd/bcm2835_sdhost.h
index 233e74b002..751ba531d6 100644
--- a/include/hw/sd/bcm2835_sdhost.h
+++ b/include/hw/sd/bcm2835_sdhost.h
@@ -20,8 +20,8 @@
 
 #define TYPE_BCM2835_SDHOST "bcm2835-sdhost"
 typedef struct BCM2835SDHostState BCM2835SDHostState;
-#define BCM2835_SDHOST(obj) \
-        OBJECT_CHECK(BCM2835SDHostState, (obj), TYPE_BCM2835_SDHOST)
+DECLARE_INSTANCE_CHECKER(BCM2835SDHostState, BCM2835_SDHOST,
+                         TYPE_BCM2835_SDHOST)
 
 #define BCM2835_SDHOST_FIFO_LEN 16
 
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 850740ea92..31ccbeab0e 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -94,11 +94,8 @@ typedef struct SDBus SDBus;
 
 #define TYPE_SD_CARD "sd-card"
 typedef struct SDCardClass SDCardClass;
-#define SD_CARD(obj) OBJECT_CHECK(SDState, (obj), TYPE_SD_CARD)
-#define SD_CARD_CLASS(klass) \
-    OBJECT_CLASS_CHECK(SDCardClass, (klass), TYPE_SD_CARD)
-#define SD_CARD_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(SDCardClass, (obj), TYPE_SD_CARD)
+DECLARE_OBJ_CHECKERS(SDState, SDCardClass,
+                     SD_CARD, TYPE_SD_CARD)
 
 struct SDCardClass {
     /*< private >*/
@@ -134,9 +131,8 @@ struct SDCardClass {
 
 #define TYPE_SD_BUS "sd-bus"
 typedef struct SDBusClass SDBusClass;
-#define SD_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_SD_BUS)
-#define SD_BUS_CLASS(klass) OBJECT_CLASS_CHECK(SDBusClass, (klass), TYPE_SD_BUS)
-#define SD_BUS_GET_CLASS(obj) OBJECT_GET_CLASS(SDBusClass, (obj), TYPE_SD_BUS)
+DECLARE_OBJ_CHECKERS(SDBus, SDBusClass,
+                     SD_BUS, TYPE_SD_BUS)
 
 struct SDBus {
     BusState qbus;
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 67b01fcb28..01a64c5442 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -115,11 +115,12 @@ typedef struct SDHCIState SDHCIState;
 #define SDHCI_QUIRK_NO_BUSY_IRQ    BIT(14)
 
 #define TYPE_PCI_SDHCI "sdhci-pci"
-#define PCI_SDHCI(obj) OBJECT_CHECK(SDHCIState, (obj), TYPE_PCI_SDHCI)
+DECLARE_INSTANCE_CHECKER(SDHCIState, PCI_SDHCI,
+                         TYPE_PCI_SDHCI)
 
 #define TYPE_SYSBUS_SDHCI "generic-sdhci"
-#define SYSBUS_SDHCI(obj)                               \
-     OBJECT_CHECK(SDHCIState, (obj), TYPE_SYSBUS_SDHCI)
+DECLARE_INSTANCE_CHECKER(SDHCIState, SYSBUS_SDHCI,
+                         TYPE_SYSBUS_SDHCI)
 
 #define TYPE_IMX_USDHC "imx-usdhc"
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 21ad6327d2..6387f2b612 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -67,8 +67,8 @@ struct PIIXState {
 typedef struct PIIXState PIIX3State;
 
 #define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
-#define PIIX3_PCI_DEVICE(obj) \
-    OBJECT_CHECK(PIIX3State, (obj), TYPE_PIIX3_PCI_DEVICE)
+DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
+                         TYPE_PIIX3_PCI_DEVICE)
 
 extern PCIDevice *piix4_dev;
 
diff --git a/include/hw/sparc/sparc32_dma.h b/include/hw/sparc/sparc32_dma.h
index 9c80ef54ff..a402665a9c 100644
--- a/include/hw/sparc/sparc32_dma.h
+++ b/include/hw/sparc/sparc32_dma.h
@@ -10,8 +10,8 @@
 
 #define TYPE_SPARC32_DMA_DEVICE "sparc32-dma-device"
 typedef struct DMADeviceState DMADeviceState;
-#define SPARC32_DMA_DEVICE(obj) OBJECT_CHECK(DMADeviceState, (obj), \
-                                             TYPE_SPARC32_DMA_DEVICE)
+DECLARE_INSTANCE_CHECKER(DMADeviceState, SPARC32_DMA_DEVICE,
+                         TYPE_SPARC32_DMA_DEVICE)
 
 
 struct DMADeviceState {
@@ -26,8 +26,8 @@ struct DMADeviceState {
 
 #define TYPE_SPARC32_ESPDMA_DEVICE "sparc32-espdma"
 typedef struct ESPDMADeviceState ESPDMADeviceState;
-#define SPARC32_ESPDMA_DEVICE(obj) OBJECT_CHECK(ESPDMADeviceState, (obj), \
-                                                TYPE_SPARC32_ESPDMA_DEVICE)
+DECLARE_INSTANCE_CHECKER(ESPDMADeviceState, SPARC32_ESPDMA_DEVICE,
+                         TYPE_SPARC32_ESPDMA_DEVICE)
 
 struct ESPDMADeviceState {
     DMADeviceState parent_obj;
@@ -37,8 +37,8 @@ struct ESPDMADeviceState {
 
 #define TYPE_SPARC32_LEDMA_DEVICE "sparc32-ledma"
 typedef struct LEDMADeviceState LEDMADeviceState;
-#define SPARC32_LEDMA_DEVICE(obj) OBJECT_CHECK(LEDMADeviceState, (obj), \
-                                               TYPE_SPARC32_LEDMA_DEVICE)
+DECLARE_INSTANCE_CHECKER(LEDMADeviceState, SPARC32_LEDMA_DEVICE,
+                         TYPE_SPARC32_LEDMA_DEVICE)
 
 struct LEDMADeviceState {
     DMADeviceState parent_obj;
@@ -48,8 +48,8 @@ struct LEDMADeviceState {
 
 #define TYPE_SPARC32_DMA "sparc32-dma"
 typedef struct SPARC32DMAState SPARC32DMAState;
-#define SPARC32_DMA(obj) OBJECT_CHECK(SPARC32DMAState, (obj), \
-                                      TYPE_SPARC32_DMA)
+DECLARE_INSTANCE_CHECKER(SPARC32DMAState, SPARC32_DMA,
+                         TYPE_SPARC32_DMA)
 
 struct SPARC32DMAState {
     SysBusDevice parent_obj;
diff --git a/include/hw/sparc/sun4m_iommu.h b/include/hw/sparc/sun4m_iommu.h
index 6095eed0af..4e2ab34cde 100644
--- a/include/hw/sparc/sun4m_iommu.h
+++ b/include/hw/sparc/sun4m_iommu.h
@@ -45,7 +45,8 @@ struct IOMMUState {
 typedef struct IOMMUState IOMMUState;
 
 #define TYPE_SUN4M_IOMMU "sun4m-iommu"
-#define SUN4M_IOMMU(obj) OBJECT_CHECK(IOMMUState, (obj), TYPE_SUN4M_IOMMU)
+DECLARE_INSTANCE_CHECKER(IOMMUState, SUN4M_IOMMU,
+                         TYPE_SUN4M_IOMMU)
 
 #define TYPE_SUN4M_IOMMU_MEMORY_REGION "sun4m-iommu-memory-region"
 
diff --git a/include/hw/sparc/sun4u_iommu.h b/include/hw/sparc/sun4u_iommu.h
index dfe10459e5..f94566a72c 100644
--- a/include/hw/sparc/sun4u_iommu.h
+++ b/include/hw/sparc/sun4u_iommu.h
@@ -44,7 +44,8 @@ struct IOMMUState {
 typedef struct IOMMUState IOMMUState;
 
 #define TYPE_SUN4U_IOMMU "sun4u-iommu"
-#define SUN4U_IOMMU(obj) OBJECT_CHECK(IOMMUState, (obj), TYPE_SUN4U_IOMMU)
+DECLARE_INSTANCE_CHECKER(IOMMUState, SUN4U_IOMMU,
+                         TYPE_SUN4U_IOMMU)
 
 #define TYPE_SUN4U_IOMMU_MEMORY_REGION "sun4u-iommu-memory-region"
 
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index a2072ffeea..8e023d8ff6 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -70,11 +70,8 @@ typedef struct AspeedSMCFlash {
 #define TYPE_ASPEED_SMC "aspeed.smc"
 typedef struct AspeedSMCClass AspeedSMCClass;
 typedef struct AspeedSMCState AspeedSMCState;
-#define ASPEED_SMC(obj) OBJECT_CHECK(AspeedSMCState, (obj), TYPE_ASPEED_SMC)
-#define ASPEED_SMC_CLASS(klass) \
-     OBJECT_CLASS_CHECK(AspeedSMCClass, (klass), TYPE_ASPEED_SMC)
-#define ASPEED_SMC_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(AspeedSMCClass, (obj), TYPE_ASPEED_SMC)
+DECLARE_OBJ_CHECKERS(AspeedSMCState, AspeedSMCClass,
+                     ASPEED_SMC, TYPE_ASPEED_SMC)
 
 struct AspeedSMCClass {
     SysBusDevice parent_obj;
diff --git a/include/hw/ssi/imx_spi.h b/include/hw/ssi/imx_spi.h
index 3a966af0ec..874fea492d 100644
--- a/include/hw/ssi/imx_spi.h
+++ b/include/hw/ssi/imx_spi.h
@@ -79,7 +79,8 @@
 
 #define TYPE_IMX_SPI "imx.spi"
 typedef struct IMXSPIState IMXSPIState;
-#define IMX_SPI(obj) OBJECT_CHECK(IMXSPIState, (obj), TYPE_IMX_SPI)
+DECLARE_INSTANCE_CHECKER(IMXSPIState, IMX_SPI,
+                         TYPE_IMX_SPI)
 
 struct IMXSPIState {
     /* <private> */
diff --git a/include/hw/ssi/mss-spi.h b/include/hw/ssi/mss-spi.h
index 40e1a5ac90..7c16cf6b49 100644
--- a/include/hw/ssi/mss-spi.h
+++ b/include/hw/ssi/mss-spi.h
@@ -32,7 +32,8 @@
 
 #define TYPE_MSS_SPI   "mss-spi"
 typedef struct MSSSpiState MSSSpiState;
-#define MSS_SPI(obj)   OBJECT_CHECK(MSSSpiState, (obj), TYPE_MSS_SPI)
+DECLARE_INSTANCE_CHECKER(MSSSpiState, MSS_SPI,
+                         TYPE_MSS_SPI)
 
 #define R_SPI_MAX             16
 
diff --git a/include/hw/ssi/pl022.h b/include/hw/ssi/pl022.h
index 64aeb61eef..1f5da7cc44 100644
--- a/include/hw/ssi/pl022.h
+++ b/include/hw/ssi/pl022.h
@@ -26,7 +26,8 @@
 
 #define TYPE_PL022 "pl022"
 typedef struct PL022State PL022State;
-#define PL022(obj) OBJECT_CHECK(PL022State, (obj), TYPE_PL022)
+DECLARE_INSTANCE_CHECKER(PL022State, PL022,
+                         TYPE_PL022)
 
 struct PL022State {
     SysBusDevice parent_obj;
diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index b42765f415..b9286989fc 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -19,12 +19,8 @@ typedef struct SSISlaveClass SSISlaveClass;
 typedef enum SSICSMode SSICSMode;
 
 #define TYPE_SSI_SLAVE "ssi-slave"
-#define SSI_SLAVE(obj) \
-     OBJECT_CHECK(SSISlave, (obj), TYPE_SSI_SLAVE)
-#define SSI_SLAVE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(SSISlaveClass, (klass), TYPE_SSI_SLAVE)
-#define SSI_SLAVE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(SSISlaveClass, (obj), TYPE_SSI_SLAVE)
+DECLARE_OBJ_CHECKERS(SSISlave, SSISlaveClass,
+                     SSI_SLAVE, TYPE_SSI_SLAVE)
 
 #define SSI_GPIO_CS "ssi-gpio-cs"
 
diff --git a/include/hw/ssi/stm32f2xx_spi.h b/include/hw/ssi/stm32f2xx_spi.h
index 1c8ff7d724..4bb36d04ed 100644
--- a/include/hw/ssi/stm32f2xx_spi.h
+++ b/include/hw/ssi/stm32f2xx_spi.h
@@ -46,8 +46,8 @@
 
 #define TYPE_STM32F2XX_SPI "stm32f2xx-spi"
 typedef struct STM32F2XXSPIState STM32F2XXSPIState;
-#define STM32F2XX_SPI(obj) \
-    OBJECT_CHECK(STM32F2XXSPIState, (obj), TYPE_STM32F2XX_SPI)
+DECLARE_INSTANCE_CHECKER(STM32F2XXSPIState, STM32F2XX_SPI,
+                         TYPE_STM32F2XX_SPI)
 
 struct STM32F2XXSPIState {
     /* <private> */
diff --git a/include/hw/ssi/xilinx_spips.h b/include/hw/ssi/xilinx_spips.h
index 2171018601..b1ab347617 100644
--- a/include/hw/ssi/xilinx_spips.h
+++ b/include/hw/ssi/xilinx_spips.h
@@ -136,17 +136,13 @@ typedef struct XilinxSPIPSClass XilinxSPIPSClass;
 #define TYPE_XILINX_QSPIPS "xlnx.ps7-qspi"
 #define TYPE_XLNX_ZYNQMP_QSPIPS "xlnx.usmp-gqspi"
 
-#define XILINX_SPIPS(obj) \
-     OBJECT_CHECK(XilinxSPIPS, (obj), TYPE_XILINX_SPIPS)
-#define XILINX_SPIPS_CLASS(klass) \
-     OBJECT_CLASS_CHECK(XilinxSPIPSClass, (klass), TYPE_XILINX_SPIPS)
-#define XILINX_SPIPS_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(XilinxSPIPSClass, (obj), TYPE_XILINX_SPIPS)
-
-#define XILINX_QSPIPS(obj) \
-     OBJECT_CHECK(XilinxQSPIPS, (obj), TYPE_XILINX_QSPIPS)
-
-#define XLNX_ZYNQMP_QSPIPS(obj) \
-     OBJECT_CHECK(XlnxZynqMPQSPIPS, (obj), TYPE_XLNX_ZYNQMP_QSPIPS)
+DECLARE_OBJ_CHECKERS(XilinxSPIPS, XilinxSPIPSClass,
+                     XILINX_SPIPS, TYPE_XILINX_SPIPS)
+
+DECLARE_INSTANCE_CHECKER(XilinxQSPIPS, XILINX_QSPIPS,
+                         TYPE_XILINX_QSPIPS)
+
+DECLARE_INSTANCE_CHECKER(XlnxZynqMPQSPIPS, XLNX_ZYNQMP_QSPIPS,
+                         TYPE_XLNX_ZYNQMP_QSPIPS)
 
 #endif /* XILINX_SPIPS_H */
diff --git a/include/hw/stream.h b/include/hw/stream.h
index bd41750e94..e39d5a5b55 100644
--- a/include/hw/stream.h
+++ b/include/hw/stream.h
@@ -7,10 +7,8 @@
 #define TYPE_STREAM_SLAVE "stream-slave"
 
 typedef struct StreamSlaveClass StreamSlaveClass;
-#define STREAM_SLAVE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(StreamSlaveClass, (klass), TYPE_STREAM_SLAVE)
-#define STREAM_SLAVE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(StreamSlaveClass, (obj), TYPE_STREAM_SLAVE)
+DECLARE_CLASS_CHECKERS(StreamSlaveClass, STREAM_SLAVE,
+                       TYPE_STREAM_SLAVE)
 #define STREAM_SLAVE(obj) \
      INTERFACE_CHECK(StreamSlave, (obj), TYPE_STREAM_SLAVE)
 
diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 3537e43f23..77e21bba18 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -11,18 +11,15 @@
 #define QDEV_MAX_PIO 32
 
 #define TYPE_SYSTEM_BUS "System"
-#define SYSTEM_BUS(obj) OBJECT_CHECK(BusState, (obj), TYPE_SYSTEM_BUS)
+DECLARE_INSTANCE_CHECKER(BusState, SYSTEM_BUS,
+                         TYPE_SYSTEM_BUS)
 
 typedef struct SysBusDevice SysBusDevice;
 
 #define TYPE_SYS_BUS_DEVICE "sys-bus-device"
 typedef struct SysBusDeviceClass SysBusDeviceClass;
-#define SYS_BUS_DEVICE(obj) \
-     OBJECT_CHECK(SysBusDevice, (obj), TYPE_SYS_BUS_DEVICE)
-#define SYS_BUS_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(SysBusDeviceClass, (klass), TYPE_SYS_BUS_DEVICE)
-#define SYS_BUS_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(SysBusDeviceClass, (obj), TYPE_SYS_BUS_DEVICE)
+DECLARE_OBJ_CHECKERS(SysBusDevice, SysBusDeviceClass,
+                     SYS_BUS_DEVICE, TYPE_SYS_BUS_DEVICE)
 
 /**
  * SysBusDeviceClass:
diff --git a/include/hw/timer/a9gtimer.h b/include/hw/timer/a9gtimer.h
index 88811c6c8f..f6fcc4bfc6 100644
--- a/include/hw/timer/a9gtimer.h
+++ b/include/hw/timer/a9gtimer.h
@@ -30,7 +30,8 @@
 
 #define TYPE_A9_GTIMER "arm.cortex-a9-global-timer"
 typedef struct A9GTimerState A9GTimerState;
-#define A9_GTIMER(obj) OBJECT_CHECK(A9GTimerState, (obj), TYPE_A9_GTIMER)
+DECLARE_INSTANCE_CHECKER(A9GTimerState, A9_GTIMER,
+                         TYPE_A9_GTIMER)
 
 #define R_COUNTER_LO                0x00
 #define R_COUNTER_HI                0x04
diff --git a/include/hw/timer/allwinner-a10-pit.h b/include/hw/timer/allwinner-a10-pit.h
index fa060c684d..9638e3c84c 100644
--- a/include/hw/timer/allwinner-a10-pit.h
+++ b/include/hw/timer/allwinner-a10-pit.h
@@ -7,7 +7,8 @@
 
 #define TYPE_AW_A10_PIT "allwinner-A10-timer"
 typedef struct AwA10PITState AwA10PITState;
-#define AW_A10_PIT(obj) OBJECT_CHECK(AwA10PITState, (obj), TYPE_AW_A10_PIT)
+DECLARE_INSTANCE_CHECKER(AwA10PITState, AW_A10_PIT,
+                         TYPE_AW_A10_PIT)
 
 #define AW_A10_PIT_TIMER_NR    6
 #define AW_A10_PIT_TIMER_IRQ   0x1
diff --git a/include/hw/timer/arm_mptimer.h b/include/hw/timer/arm_mptimer.h
index 643a256ecf..47d5e51686 100644
--- a/include/hw/timer/arm_mptimer.h
+++ b/include/hw/timer/arm_mptimer.h
@@ -37,8 +37,8 @@ typedef struct {
 
 #define TYPE_ARM_MPTIMER "arm_mptimer"
 typedef struct ARMMPTimerState ARMMPTimerState;
-#define ARM_MPTIMER(obj) \
-    OBJECT_CHECK(ARMMPTimerState, (obj), TYPE_ARM_MPTIMER)
+DECLARE_INSTANCE_CHECKER(ARMMPTimerState, ARM_MPTIMER,
+                         TYPE_ARM_MPTIMER)
 
 struct ARMMPTimerState {
     /*< private >*/
diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
index 33df057958..b605688fee 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -18,7 +18,8 @@
 #define TYPE_SYSTICK "armv7m_systick"
 
 typedef struct SysTickState SysTickState;
-#define SYSTICK(obj) OBJECT_CHECK(SysTickState, (obj), TYPE_SYSTICK)
+DECLARE_INSTANCE_CHECKER(SysTickState, SYSTICK,
+                         TYPE_SYSTICK)
 
 struct SysTickState {
     /*< private >*/
diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
index c890aaa949..4c76f955c9 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -29,8 +29,8 @@
 #define TYPE_ASPEED_TIMER "aspeed.timer"
 typedef struct AspeedTimerClass AspeedTimerClass;
 typedef struct AspeedTimerCtrlState AspeedTimerCtrlState;
-#define ASPEED_TIMER(obj) \
-    OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER)
+DECLARE_OBJ_CHECKERS(AspeedTimerCtrlState, AspeedTimerClass,
+                     ASPEED_TIMER, TYPE_ASPEED_TIMER)
 #define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
 #define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
 #define TYPE_ASPEED_2600_TIMER TYPE_ASPEED_TIMER "-ast2600"
@@ -69,10 +69,6 @@ struct AspeedTimerCtrlState {
     AspeedSCUState *scu;
 };
 
-#define ASPEED_TIMER_CLASS(klass) \
-     OBJECT_CLASS_CHECK(AspeedTimerClass, (klass), TYPE_ASPEED_TIMER)
-#define ASPEED_TIMER_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(AspeedTimerClass, (obj), TYPE_ASPEED_TIMER)
 
 struct AspeedTimerClass {
     SysBusDeviceClass parent_class;
diff --git a/include/hw/timer/avr_timer16.h b/include/hw/timer/avr_timer16.h
index 9efe75ce5e..d454bb31cb 100644
--- a/include/hw/timer/avr_timer16.h
+++ b/include/hw/timer/avr_timer16.h
@@ -43,8 +43,8 @@ enum NextInterrupt {
 
 #define TYPE_AVR_TIMER16 "avr-timer16"
 typedef struct AVRTimer16State AVRTimer16State;
-#define AVR_TIMER16(obj) \
-    OBJECT_CHECK(AVRTimer16State, (obj), TYPE_AVR_TIMER16)
+DECLARE_INSTANCE_CHECKER(AVRTimer16State, AVR_TIMER16,
+                         TYPE_AVR_TIMER16)
 
 struct AVRTimer16State {
     /* <private> */
diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835_systmr.h
index 796f62cf88..64166bd712 100644
--- a/include/hw/timer/bcm2835_systmr.h
+++ b/include/hw/timer/bcm2835_systmr.h
@@ -15,8 +15,8 @@
 
 #define TYPE_BCM2835_SYSTIMER "bcm2835-sys-timer"
 typedef struct BCM2835SystemTimerState BCM2835SystemTimerState;
-#define BCM2835_SYSTIMER(obj) \
-    OBJECT_CHECK(BCM2835SystemTimerState, (obj), TYPE_BCM2835_SYSTIMER)
+DECLARE_INSTANCE_CHECKER(BCM2835SystemTimerState, BCM2835_SYSTIMER,
+                         TYPE_BCM2835_SYSTIMER)
 
 struct BCM2835SystemTimerState {
     /*< private >*/
diff --git a/include/hw/timer/cmsdk-apb-dualtimer.h b/include/hw/timer/cmsdk-apb-dualtimer.h
index 8a1137aec7..7a5b9df5e5 100644
--- a/include/hw/timer/cmsdk-apb-dualtimer.h
+++ b/include/hw/timer/cmsdk-apb-dualtimer.h
@@ -32,8 +32,8 @@
 
 #define TYPE_CMSDK_APB_DUALTIMER "cmsdk-apb-dualtimer"
 typedef struct CMSDKAPBDualTimer CMSDKAPBDualTimer;
-#define CMSDK_APB_DUALTIMER(obj) OBJECT_CHECK(CMSDKAPBDualTimer, (obj), \
-                                              TYPE_CMSDK_APB_DUALTIMER)
+DECLARE_INSTANCE_CHECKER(CMSDKAPBDualTimer, CMSDK_APB_DUALTIMER,
+                         TYPE_CMSDK_APB_DUALTIMER)
 
 
 /* One of the two identical timer modules in the dual-timer module */
diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index a7ca523529..0912bc0f3c 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -19,8 +19,8 @@
 
 #define TYPE_CMSDK_APB_TIMER "cmsdk-apb-timer"
 typedef struct CMSDKAPBTIMER CMSDKAPBTIMER;
-#define CMSDK_APB_TIMER(obj) OBJECT_CHECK(CMSDKAPBTIMER, (obj), \
-                                         TYPE_CMSDK_APB_TIMER)
+DECLARE_INSTANCE_CHECKER(CMSDKAPBTIMER, CMSDK_APB_TIMER,
+                         TYPE_CMSDK_APB_TIMER)
 
 struct CMSDKAPBTIMER {
     /*< private >*/
diff --git a/include/hw/timer/digic-timer.h b/include/hw/timer/digic-timer.h
index 543bf8c6be..84a0ef473a 100644
--- a/include/hw/timer/digic-timer.h
+++ b/include/hw/timer/digic-timer.h
@@ -24,7 +24,8 @@
 
 #define TYPE_DIGIC_TIMER "digic-timer"
 typedef struct DigicTimerState DigicTimerState;
-#define DIGIC_TIMER(obj) OBJECT_CHECK(DigicTimerState, (obj), TYPE_DIGIC_TIMER)
+DECLARE_INSTANCE_CHECKER(DigicTimerState, DIGIC_TIMER,
+                         TYPE_DIGIC_TIMER)
 
 #define DIGIC_TIMER_CONTROL 0x00
 #define DIGIC_TIMER_CONTROL_RST 0x80000000
diff --git a/include/hw/timer/i8254.h b/include/hw/timer/i8254.h
index 6adbc31e7e..1a522a2457 100644
--- a/include/hw/timer/i8254.h
+++ b/include/hw/timer/i8254.h
@@ -42,12 +42,8 @@ typedef struct PITChannelInfo {
 #define TYPE_PIT_COMMON "pit-common"
 typedef struct PITCommonState PITCommonState;
 typedef struct PITCommonClass PITCommonClass;
-#define PIT_COMMON(obj) \
-     OBJECT_CHECK(PITCommonState, (obj), TYPE_PIT_COMMON)
-#define PIT_COMMON_CLASS(klass) \
-     OBJECT_CLASS_CHECK(PITCommonClass, (klass), TYPE_PIT_COMMON)
-#define PIT_COMMON_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PITCommonClass, (obj), TYPE_PIT_COMMON)
+DECLARE_OBJ_CHECKERS(PITCommonState, PITCommonClass,
+                     PIT_COMMON, TYPE_PIT_COMMON)
 
 #define TYPE_I8254 "isa-pit"
 #define TYPE_KVM_I8254 "kvm-pit"
diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index 1ca110caf5..39bcf81331 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -57,7 +57,8 @@
 
 #define TYPE_IMX_EPIT "imx.epit"
 typedef struct IMXEPITState IMXEPITState;
-#define IMX_EPIT(obj) OBJECT_CHECK(IMXEPITState, (obj), TYPE_IMX_EPIT)
+DECLARE_INSTANCE_CHECKER(IMXEPITState, IMX_EPIT,
+                         TYPE_IMX_EPIT)
 
 struct IMXEPITState {
     /*< private >*/
diff --git a/include/hw/timer/imx_gpt.h b/include/hw/timer/imx_gpt.h
index b96633d8b2..ff5c8a351a 100644
--- a/include/hw/timer/imx_gpt.h
+++ b/include/hw/timer/imx_gpt.h
@@ -83,7 +83,8 @@
 #define TYPE_IMX_GPT TYPE_IMX25_GPT
 
 typedef struct IMXGPTState IMXGPTState;
-#define IMX_GPT(obj) OBJECT_CHECK(IMXGPTState, (obj), TYPE_IMX_GPT)
+DECLARE_INSTANCE_CHECKER(IMXGPTState, IMX_GPT,
+                         TYPE_IMX_GPT)
 
 struct IMXGPTState {
     /*< private >*/
diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer.h
index 011c5f1ba9..d207bae2c0 100644
--- a/include/hw/timer/mss-timer.h
+++ b/include/hw/timer/mss-timer.h
@@ -31,8 +31,8 @@
 
 #define TYPE_MSS_TIMER     "mss-timer"
 typedef struct MSSTimerState MSSTimerState;
-#define MSS_TIMER(obj)     OBJECT_CHECK(MSSTimerState, \
-                              (obj), TYPE_MSS_TIMER)
+DECLARE_INSTANCE_CHECKER(MSSTimerState, MSS_TIMER,
+                         TYPE_MSS_TIMER)
 
 /*
  * There are two 32-bit down counting timers.
diff --git a/include/hw/timer/nrf51_timer.h b/include/hw/timer/nrf51_timer.h
index b4eb29bd76..4261a03b95 100644
--- a/include/hw/timer/nrf51_timer.h
+++ b/include/hw/timer/nrf51_timer.h
@@ -18,7 +18,8 @@
 #include "qom/object.h"
 #define TYPE_NRF51_TIMER "nrf51_soc.timer"
 typedef struct NRF51TimerState NRF51TimerState;
-#define NRF51_TIMER(obj) OBJECT_CHECK(NRF51TimerState, (obj), TYPE_NRF51_TIMER)
+DECLARE_INSTANCE_CHECKER(NRF51TimerState, NRF51_TIMER,
+                         TYPE_NRF51_TIMER)
 
 #define NRF51_TIMER_REG_COUNT 4
 
diff --git a/include/hw/timer/renesas_cmt.h b/include/hw/timer/renesas_cmt.h
index 313f9e1965..1c0b65c1d5 100644
--- a/include/hw/timer/renesas_cmt.h
+++ b/include/hw/timer/renesas_cmt.h
@@ -15,7 +15,8 @@
 
 #define TYPE_RENESAS_CMT "renesas-cmt"
 typedef struct RCMTState RCMTState;
-#define RCMT(obj) OBJECT_CHECK(RCMTState, (obj), TYPE_RENESAS_CMT)
+DECLARE_INSTANCE_CHECKER(RCMTState, RCMT,
+                         TYPE_RENESAS_CMT)
 
 enum {
     CMT_CH = 2,
diff --git a/include/hw/timer/renesas_tmr.h b/include/hw/timer/renesas_tmr.h
index e2abcb13ad..caf7eec0dc 100644
--- a/include/hw/timer/renesas_tmr.h
+++ b/include/hw/timer/renesas_tmr.h
@@ -15,7 +15,8 @@
 
 #define TYPE_RENESAS_TMR "renesas-tmr"
 typedef struct RTMRState RTMRState;
-#define RTMR(obj) OBJECT_CHECK(RTMRState, (obj), TYPE_RENESAS_TMR)
+DECLARE_INSTANCE_CHECKER(RTMRState, RTMR,
+                         TYPE_RENESAS_TMR)
 
 enum timer_event {
     cmia = 0,
diff --git a/include/hw/timer/stm32f2xx_timer.h b/include/hw/timer/stm32f2xx_timer.h
index 9eb9201085..90f40f1746 100644
--- a/include/hw/timer/stm32f2xx_timer.h
+++ b/include/hw/timer/stm32f2xx_timer.h
@@ -63,8 +63,8 @@
 
 #define TYPE_STM32F2XX_TIMER "stm32f2xx-timer"
 typedef struct STM32F2XXTimerState STM32F2XXTimerState;
-#define STM32F2XXTIMER(obj) OBJECT_CHECK(STM32F2XXTimerState, \
-                            (obj), TYPE_STM32F2XX_TIMER)
+DECLARE_INSTANCE_CHECKER(STM32F2XXTimerState, STM32F2XXTIMER,
+                         TYPE_STM32F2XX_TIMER)
 
 struct STM32F2XXTimerState {
     /* <private> */
diff --git a/include/hw/usb.h b/include/hw/usb.h
index e6ec0c891c..5783635491 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -266,12 +266,8 @@ struct USBDevice {
 
 #define TYPE_USB_DEVICE "usb-device"
 typedef struct USBDeviceClass USBDeviceClass;
-#define USB_DEVICE(obj) \
-     OBJECT_CHECK(USBDevice, (obj), TYPE_USB_DEVICE)
-#define USB_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(USBDeviceClass, (klass), TYPE_USB_DEVICE)
-#define USB_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(USBDeviceClass, (obj), TYPE_USB_DEVICE)
+DECLARE_OBJ_CHECKERS(USBDevice, USBDeviceClass,
+                     USB_DEVICE, TYPE_USB_DEVICE)
 
 typedef void (*USBDeviceRealize)(USBDevice *dev, Error **errp);
 typedef void (*USBDeviceUnrealize)(USBDevice *dev);
@@ -479,7 +475,8 @@ bool usb_host_dev_is_scsi_storage(USBDevice *usbdev);
 /* usb-bus.c */
 
 #define TYPE_USB_BUS "usb-bus"
-#define USB_BUS(obj) OBJECT_CHECK(USBBus, (obj), TYPE_USB_BUS)
+DECLARE_INSTANCE_CHECKER(USBBus, USB_BUS,
+                         TYPE_USB_BUS)
 
 struct USBBus {
     BusState qbus;
diff --git a/include/hw/usb/chipidea.h b/include/hw/usb/chipidea.h
index 1db449e1c4..f0303b8721 100644
--- a/include/hw/usb/chipidea.h
+++ b/include/hw/usb/chipidea.h
@@ -13,6 +13,7 @@ struct ChipideaState {
 typedef struct ChipideaState ChipideaState;
 
 #define TYPE_CHIPIDEA "usb-chipidea"
-#define CHIPIDEA(obj) OBJECT_CHECK(ChipideaState, (obj), TYPE_CHIPIDEA)
+DECLARE_INSTANCE_CHECKER(ChipideaState, CHIPIDEA,
+                         TYPE_CHIPIDEA)
 
 #endif /* CHIPIDEA_H */
diff --git a/include/hw/usb/imx-usb-phy.h b/include/hw/usb/imx-usb-phy.h
index 9861acb5ac..f7f92fc462 100644
--- a/include/hw/usb/imx-usb-phy.h
+++ b/include/hw/usb/imx-usb-phy.h
@@ -40,7 +40,8 @@ enum IMXUsbPhyRegisters {
 
 #define TYPE_IMX_USBPHY "imx.usbphy"
 typedef struct IMXUSBPHYState IMXUSBPHYState;
-#define IMX_USBPHY(obj) OBJECT_CHECK(IMXUSBPHYState, (obj), TYPE_IMX_USBPHY)
+DECLARE_INSTANCE_CHECKER(IMXUSBPHYState, IMX_USBPHY,
+                         TYPE_IMX_USBPHY)
 
 struct IMXUSBPHYState {
     /* <private> */
diff --git a/include/hw/vfio/vfio-amd-xgbe.h b/include/hw/vfio/vfio-amd-xgbe.h
index b860ac0446..a894546c02 100644
--- a/include/hw/vfio/vfio-amd-xgbe.h
+++ b/include/hw/vfio/vfio-amd-xgbe.h
@@ -40,13 +40,7 @@ struct VFIOAmdXgbeDeviceClass {
 
 typedef struct VFIOAmdXgbeDeviceClass VFIOAmdXgbeDeviceClass;
 
-#define VFIO_AMD_XGBE_DEVICE(obj) \
-     OBJECT_CHECK(VFIOAmdXgbeDevice, (obj), TYPE_VFIO_AMD_XGBE)
-#define VFIO_AMD_XGBE_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(VFIOAmdXgbeDeviceClass, (klass), \
-                        TYPE_VFIO_AMD_XGBE)
-#define VFIO_AMD_XGBE_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(VFIOAmdXgbeDeviceClass, (obj), \
-                      TYPE_VFIO_AMD_XGBE)
+DECLARE_OBJ_CHECKERS(VFIOAmdXgbeDevice, VFIOAmdXgbeDeviceClass,
+                     VFIO_AMD_XGBE_DEVICE, TYPE_VFIO_AMD_XGBE)
 
 #endif
diff --git a/include/hw/vfio/vfio-calxeda-xgmac.h b/include/hw/vfio/vfio-calxeda-xgmac.h
index b19dc2160b..8482f151dd 100644
--- a/include/hw/vfio/vfio-calxeda-xgmac.h
+++ b/include/hw/vfio/vfio-calxeda-xgmac.h
@@ -37,13 +37,7 @@ struct VFIOCalxedaXgmacDeviceClass {
 };
 typedef struct VFIOCalxedaXgmacDeviceClass VFIOCalxedaXgmacDeviceClass;
 
-#define VFIO_CALXEDA_XGMAC_DEVICE(obj) \
-     OBJECT_CHECK(VFIOCalxedaXgmacDevice, (obj), TYPE_VFIO_CALXEDA_XGMAC)
-#define VFIO_CALXEDA_XGMAC_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(VFIOCalxedaXgmacDeviceClass, (klass), \
-                        TYPE_VFIO_CALXEDA_XGMAC)
-#define VFIO_CALXEDA_XGMAC_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(VFIOCalxedaXgmacDeviceClass, (obj), \
-                      TYPE_VFIO_CALXEDA_XGMAC)
+DECLARE_OBJ_CHECKERS(VFIOCalxedaXgmacDevice, VFIOCalxedaXgmacDeviceClass,
+                     VFIO_CALXEDA_XGMAC_DEVICE, TYPE_VFIO_CALXEDA_XGMAC)
 
 #endif
diff --git a/include/hw/vfio/vfio-platform.h b/include/hw/vfio/vfio-platform.h
index 248c23dba7..c414c3dffc 100644
--- a/include/hw/vfio/vfio-platform.h
+++ b/include/hw/vfio/vfio-platform.h
@@ -70,11 +70,7 @@ struct VFIOPlatformDeviceClass {
 };
 typedef struct VFIOPlatformDeviceClass VFIOPlatformDeviceClass;
 
-#define VFIO_PLATFORM_DEVICE(obj) \
-     OBJECT_CHECK(VFIOPlatformDevice, (obj), TYPE_VFIO_PLATFORM)
-#define VFIO_PLATFORM_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(VFIOPlatformDeviceClass, (klass), TYPE_VFIO_PLATFORM)
-#define VFIO_PLATFORM_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(VFIOPlatformDeviceClass, (obj), TYPE_VFIO_PLATFORM)
+DECLARE_OBJ_CHECKERS(VFIOPlatformDevice, VFIOPlatformDeviceClass,
+                     VFIO_PLATFORM_DEVICE, TYPE_VFIO_PLATFORM)
 
 #endif /* HW_VFIO_VFIO_PLATFORM_H */
diff --git a/include/hw/virtio/vhost-scsi-common.h b/include/hw/virtio/vhost-scsi-common.h
index f198f25119..5f0bf73d9d 100644
--- a/include/hw/virtio/vhost-scsi-common.h
+++ b/include/hw/virtio/vhost-scsi-common.h
@@ -21,8 +21,8 @@
 
 #define TYPE_VHOST_SCSI_COMMON "vhost-scsi-common"
 typedef struct VHostSCSICommon VHostSCSICommon;
-#define VHOST_SCSI_COMMON(obj) \
-        OBJECT_CHECK(VHostSCSICommon, (obj), TYPE_VHOST_SCSI_COMMON)
+DECLARE_INSTANCE_CHECKER(VHostSCSICommon, VHOST_SCSI_COMMON,
+                         TYPE_VHOST_SCSI_COMMON)
 
 struct VHostSCSICommon {
     VirtIOSCSICommon parent_obj;
diff --git a/include/hw/virtio/vhost-scsi.h b/include/hw/virtio/vhost-scsi.h
index 72ae842646..7a77644150 100644
--- a/include/hw/virtio/vhost-scsi.h
+++ b/include/hw/virtio/vhost-scsi.h
@@ -27,8 +27,8 @@ enum vhost_scsi_vq_list {
 
 #define TYPE_VHOST_SCSI "vhost-scsi"
 typedef struct VHostSCSI VHostSCSI;
-#define VHOST_SCSI(obj) \
-        OBJECT_CHECK(VHostSCSI, (obj), TYPE_VHOST_SCSI)
+DECLARE_INSTANCE_CHECKER(VHostSCSI, VHOST_SCSI,
+                         TYPE_VHOST_SCSI)
 
 struct VHostSCSI {
     VHostSCSICommon parent_obj;
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index fa82be0e8a..9033e6f902 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -22,8 +22,8 @@
 
 #define TYPE_VHOST_USER_FS "vhost-user-fs-device"
 typedef struct VHostUserFS VHostUserFS;
-#define VHOST_USER_FS(obj) \
-        OBJECT_CHECK(VHostUserFS, (obj), TYPE_VHOST_USER_FS)
+DECLARE_INSTANCE_CHECKER(VHostUserFS, VHOST_USER_FS,
+                         TYPE_VHOST_USER_FS)
 
 typedef struct {
     CharBackend chardev;
diff --git a/include/hw/virtio/vhost-user-scsi.h b/include/hw/virtio/vhost-user-scsi.h
index c4c4c29bf9..342d67ee9e 100644
--- a/include/hw/virtio/vhost-user-scsi.h
+++ b/include/hw/virtio/vhost-user-scsi.h
@@ -25,8 +25,8 @@
 
 #define TYPE_VHOST_USER_SCSI "vhost-user-scsi"
 typedef struct VHostUserSCSI VHostUserSCSI;
-#define VHOST_USER_SCSI(obj) \
-        OBJECT_CHECK(VHostUserSCSI, (obj), TYPE_VHOST_USER_SCSI)
+DECLARE_INSTANCE_CHECKER(VHostUserSCSI, VHOST_USER_SCSI,
+                         TYPE_VHOST_USER_SCSI)
 
 struct VHostUserSCSI {
     VHostSCSICommon parent_obj;
diff --git a/include/hw/virtio/vhost-user-vsock.h b/include/hw/virtio/vhost-user-vsock.h
index d7eda986b6..b3c40c16a3 100644
--- a/include/hw/virtio/vhost-user-vsock.h
+++ b/include/hw/virtio/vhost-user-vsock.h
@@ -18,8 +18,8 @@
 
 #define TYPE_VHOST_USER_VSOCK "vhost-user-vsock-device"
 typedef struct VHostUserVSock VHostUserVSock;
-#define VHOST_USER_VSOCK(obj) \
-        OBJECT_CHECK(VHostUserVSock, (obj), TYPE_VHOST_USER_VSOCK)
+DECLARE_INSTANCE_CHECKER(VHostUserVSock, VHOST_USER_VSOCK,
+                         TYPE_VHOST_USER_VSOCK)
 
 typedef struct {
     CharBackend chardev;
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index a181396215..60bfb68db1 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -17,8 +17,8 @@
 
 #define TYPE_VHOST_VSOCK_COMMON "vhost-vsock-common"
 typedef struct VHostVSockCommon VHostVSockCommon;
-#define VHOST_VSOCK_COMMON(obj) \
-        OBJECT_CHECK(VHostVSockCommon, (obj), TYPE_VHOST_VSOCK_COMMON)
+DECLARE_INSTANCE_CHECKER(VHostVSockCommon, VHOST_VSOCK_COMMON,
+                         TYPE_VHOST_VSOCK_COMMON)
 
 enum {
     VHOST_VSOCK_SAVEVM_VERSION = 0,
diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
index e13ff85d12..c561cc427a 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -19,8 +19,8 @@
 
 #define TYPE_VHOST_VSOCK "vhost-vsock-device"
 typedef struct VHostVSock VHostVSock;
-#define VHOST_VSOCK(obj) \
-        OBJECT_CHECK(VHostVSock, (obj), TYPE_VHOST_VSOCK)
+DECLARE_INSTANCE_CHECKER(VHostVSock, VHOST_VSOCK,
+                         TYPE_VHOST_VSOCK)
 
 typedef struct {
     uint64_t guest_cid;
diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
index a5b869a4d4..0d08f496d9 100644
--- a/include/hw/virtio/virtio-balloon.h
+++ b/include/hw/virtio/virtio-balloon.h
@@ -22,8 +22,8 @@
 
 #define TYPE_VIRTIO_BALLOON "virtio-balloon-device"
 typedef struct VirtIOBalloon VirtIOBalloon;
-#define VIRTIO_BALLOON(obj) \
-        OBJECT_CHECK(VirtIOBalloon, (obj), TYPE_VIRTIO_BALLOON)
+DECLARE_INSTANCE_CHECKER(VirtIOBalloon, VIRTIO_BALLOON,
+                         TYPE_VIRTIO_BALLOON)
 
 #define VIRTIO_BALLOON_FREE_PAGE_HINT_CMD_ID_MIN 0x80000000
 
diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index d299b55cb9..29c9f32353 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -23,8 +23,8 @@
 
 #define TYPE_VIRTIO_BLK "virtio-blk-device"
 typedef struct VirtIOBlock VirtIOBlock;
-#define VIRTIO_BLK(obj) \
-        OBJECT_CHECK(VirtIOBlock, (obj), TYPE_VIRTIO_BLK)
+DECLARE_INSTANCE_CHECKER(VirtIOBlock, VIRTIO_BLK,
+                         TYPE_VIRTIO_BLK)
 
 /* This is the last element of the write scatter-gather list */
 struct virtio_blk_inhdr
diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
index f3e9096370..ef8abe49c5 100644
--- a/include/hw/virtio/virtio-bus.h
+++ b/include/hw/virtio/virtio-bus.h
@@ -32,11 +32,8 @@
 #define TYPE_VIRTIO_BUS "virtio-bus"
 typedef struct VirtioBusClass VirtioBusClass;
 typedef struct VirtioBusState VirtioBusState;
-#define VIRTIO_BUS_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(VirtioBusClass, obj, TYPE_VIRTIO_BUS)
-#define VIRTIO_BUS_CLASS(klass) \
-        OBJECT_CLASS_CHECK(VirtioBusClass, klass, TYPE_VIRTIO_BUS)
-#define VIRTIO_BUS(obj) OBJECT_CHECK(VirtioBusState, (obj), TYPE_VIRTIO_BUS)
+DECLARE_OBJ_CHECKERS(VirtioBusState, VirtioBusClass,
+                     VIRTIO_BUS, TYPE_VIRTIO_BUS)
 
 
 struct VirtioBusClass {
diff --git a/include/hw/virtio/virtio-crypto.h b/include/hw/virtio/virtio-crypto.h
index 4134e1b7ca..7969695983 100644
--- a/include/hw/virtio/virtio-crypto.h
+++ b/include/hw/virtio/virtio-crypto.h
@@ -33,8 +33,8 @@ do { \
 
 #define TYPE_VIRTIO_CRYPTO "virtio-crypto-device"
 typedef struct VirtIOCrypto VirtIOCrypto;
-#define VIRTIO_CRYPTO(obj) \
-        OBJECT_CHECK(VirtIOCrypto, (obj), TYPE_VIRTIO_CRYPTO)
+DECLARE_INSTANCE_CHECKER(VirtIOCrypto, VIRTIO_CRYPTO,
+                         TYPE_VIRTIO_CRYPTO)
 #define VIRTIO_CRYPTO_GET_PARENT_CLASS(obj) \
         OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_CRYPTO)
 
diff --git a/include/hw/virtio/virtio-gpu-pci.h b/include/hw/virtio/virtio-gpu-pci.h
index d727c8cada..5201792ede 100644
--- a/include/hw/virtio/virtio-gpu-pci.h
+++ b/include/hw/virtio/virtio-gpu-pci.h
@@ -24,8 +24,8 @@ typedef struct VirtIOGPUPCIBase VirtIOGPUPCIBase;
  * virtio-gpu-pci-base: This extends VirtioPCIProxy.
  */
 #define TYPE_VIRTIO_GPU_PCI_BASE "virtio-gpu-pci-base"
-#define VIRTIO_GPU_PCI_BASE(obj)                                    \
-    OBJECT_CHECK(VirtIOGPUPCIBase, (obj), TYPE_VIRTIO_GPU_PCI_BASE)
+DECLARE_INSTANCE_CHECKER(VirtIOGPUPCIBase, VIRTIO_GPU_PCI_BASE,
+                         TYPE_VIRTIO_GPU_PCI_BASE)
 
 struct VirtIOGPUPCIBase {
     VirtIOPCIProxy parent_obj;
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index f464004bc2..72f8689e2e 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -27,22 +27,18 @@
 #define TYPE_VIRTIO_GPU_BASE "virtio-gpu-base"
 typedef struct VirtIOGPUBase VirtIOGPUBase;
 typedef struct VirtIOGPUBaseClass VirtIOGPUBaseClass;
-#define VIRTIO_GPU_BASE(obj)                                                \
-    OBJECT_CHECK(VirtIOGPUBase, (obj), TYPE_VIRTIO_GPU_BASE)
-#define VIRTIO_GPU_BASE_GET_CLASS(obj)                                      \
-    OBJECT_GET_CLASS(VirtIOGPUBaseClass, obj, TYPE_VIRTIO_GPU_BASE)
-#define VIRTIO_GPU_BASE_CLASS(klass)                                        \
-    OBJECT_CLASS_CHECK(VirtIOGPUBaseClass, klass, TYPE_VIRTIO_GPU_BASE)
+DECLARE_OBJ_CHECKERS(VirtIOGPUBase, VirtIOGPUBaseClass,
+                     VIRTIO_GPU_BASE, TYPE_VIRTIO_GPU_BASE)
 
 #define TYPE_VIRTIO_GPU "virtio-gpu-device"
 typedef struct VirtIOGPU VirtIOGPU;
-#define VIRTIO_GPU(obj)                                        \
-        OBJECT_CHECK(VirtIOGPU, (obj), TYPE_VIRTIO_GPU)
+DECLARE_INSTANCE_CHECKER(VirtIOGPU, VIRTIO_GPU,
+                         TYPE_VIRTIO_GPU)
 
 #define TYPE_VHOST_USER_GPU "vhost-user-gpu"
 typedef struct VhostUserGPU VhostUserGPU;
-#define VHOST_USER_GPU(obj)                                    \
-    OBJECT_CHECK(VhostUserGPU, (obj), TYPE_VHOST_USER_GPU)
+DECLARE_INSTANCE_CHECKER(VhostUserGPU, VHOST_USER_GPU,
+                         TYPE_VHOST_USER_GPU)
 
 #define VIRTIO_ID_GPU 16
 
diff --git a/include/hw/virtio/virtio-input.h b/include/hw/virtio/virtio-input.h
index c15e983d36..c54aa6aa72 100644
--- a/include/hw/virtio/virtio-input.h
+++ b/include/hw/virtio/virtio-input.h
@@ -21,14 +21,10 @@ typedef struct virtio_input_event virtio_input_event;
 #define TYPE_VIRTIO_INPUT "virtio-input-device"
 typedef struct VirtIOInput VirtIOInput;
 typedef struct VirtIOInputClass VirtIOInputClass;
-#define VIRTIO_INPUT(obj) \
-        OBJECT_CHECK(VirtIOInput, (obj), TYPE_VIRTIO_INPUT)
+DECLARE_OBJ_CHECKERS(VirtIOInput, VirtIOInputClass,
+                     VIRTIO_INPUT, TYPE_VIRTIO_INPUT)
 #define VIRTIO_INPUT_GET_PARENT_CLASS(obj) \
         OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_INPUT)
-#define VIRTIO_INPUT_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(VirtIOInputClass, obj, TYPE_VIRTIO_INPUT)
-#define VIRTIO_INPUT_CLASS(klass) \
-        OBJECT_CLASS_CHECK(VirtIOInputClass, klass, TYPE_VIRTIO_INPUT)
 
 #define TYPE_VIRTIO_INPUT_HID "virtio-input-hid-device"
 #define TYPE_VIRTIO_KEYBOARD  "virtio-keyboard-device"
@@ -36,22 +32,22 @@ typedef struct VirtIOInputClass VirtIOInputClass;
 #define TYPE_VIRTIO_TABLET    "virtio-tablet-device"
 
 typedef struct VirtIOInputHID VirtIOInputHID;
-#define VIRTIO_INPUT_HID(obj) \
-        OBJECT_CHECK(VirtIOInputHID, (obj), TYPE_VIRTIO_INPUT_HID)
+DECLARE_INSTANCE_CHECKER(VirtIOInputHID, VIRTIO_INPUT_HID,
+                         TYPE_VIRTIO_INPUT_HID)
 #define VIRTIO_INPUT_HID_GET_PARENT_CLASS(obj) \
         OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_INPUT_HID)
 
 #define TYPE_VIRTIO_INPUT_HOST   "virtio-input-host-device"
 typedef struct VirtIOInputHost VirtIOInputHost;
-#define VIRTIO_INPUT_HOST(obj) \
-        OBJECT_CHECK(VirtIOInputHost, (obj), TYPE_VIRTIO_INPUT_HOST)
+DECLARE_INSTANCE_CHECKER(VirtIOInputHost, VIRTIO_INPUT_HOST,
+                         TYPE_VIRTIO_INPUT_HOST)
 #define VIRTIO_INPUT_HOST_GET_PARENT_CLASS(obj) \
         OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_INPUT_HOST)
 
 #define TYPE_VHOST_USER_INPUT   "vhost-user-input"
 typedef struct VHostUserInput VHostUserInput;
-#define VHOST_USER_INPUT(obj)                              \
-    OBJECT_CHECK(VHostUserInput, (obj), TYPE_VHOST_USER_INPUT)
+DECLARE_INSTANCE_CHECKER(VHostUserInput, VHOST_USER_INPUT,
+                         TYPE_VHOST_USER_INPUT)
 #define VHOST_USER_INPUT_GET_PARENT_CLASS(obj)             \
     OBJECT_GET_PARENT_CLASS(obj, TYPE_VHOST_USER_INPUT)
 
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index d852980b30..ae9dc566c7 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -28,8 +28,8 @@
 #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
 #define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-device-base"
 typedef struct VirtIOIOMMU VirtIOIOMMU;
-#define VIRTIO_IOMMU(obj) \
-        OBJECT_CHECK(VirtIOIOMMU, (obj), TYPE_VIRTIO_IOMMU)
+DECLARE_INSTANCE_CHECKER(VirtIOIOMMU, VIRTIO_IOMMU,
+                         TYPE_VIRTIO_IOMMU)
 
 #define TYPE_VIRTIO_IOMMU_MEMORY_REGION "virtio-iommu-memory-region"
 
diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index 08e37d8e84..5f0b81a967 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -23,12 +23,8 @@
 
 typedef struct VirtIOMEM VirtIOMEM;
 typedef struct VirtIOMEMClass VirtIOMEMClass;
-#define VIRTIO_MEM(obj) \
-        OBJECT_CHECK(VirtIOMEM, (obj), TYPE_VIRTIO_MEM)
-#define VIRTIO_MEM_CLASS(oc) \
-        OBJECT_CLASS_CHECK(VirtIOMEMClass, (oc), TYPE_VIRTIO_MEM)
-#define VIRTIO_MEM_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(VirtIOMEMClass, (obj), TYPE_VIRTIO_MEM)
+DECLARE_OBJ_CHECKERS(VirtIOMEM, VirtIOMEMClass,
+                     VIRTIO_MEM, TYPE_VIRTIO_MEM)
 
 #define VIRTIO_MEM_MEMDEV_PROP "memdev"
 #define VIRTIO_MEM_NODE_PROP "node"
diff --git a/include/hw/virtio/virtio-mmio.h b/include/hw/virtio/virtio-mmio.h
index 947fb02d3e..dca651fd14 100644
--- a/include/hw/virtio/virtio-mmio.h
+++ b/include/hw/virtio/virtio-mmio.h
@@ -38,8 +38,8 @@
 /* virtio-mmio */
 #define TYPE_VIRTIO_MMIO "virtio-mmio"
 typedef struct VirtIOMMIOProxy VirtIOMMIOProxy;
-#define VIRTIO_MMIO(obj) \
-        OBJECT_CHECK(VirtIOMMIOProxy, (obj), TYPE_VIRTIO_MMIO)
+DECLARE_INSTANCE_CHECKER(VirtIOMMIOProxy, VIRTIO_MMIO,
+                         TYPE_VIRTIO_MMIO)
 
 #define VIRT_MAGIC 0x74726976 /* 'virt' */
 #define VIRT_VERSION 2
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 2e81b5bfcb..929ed232dd 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -23,8 +23,8 @@
 
 #define TYPE_VIRTIO_NET "virtio-net-device"
 typedef struct VirtIONet VirtIONet;
-#define VIRTIO_NET(obj) \
-        OBJECT_CHECK(VirtIONet, (obj), TYPE_VIRTIO_NET)
+DECLARE_INSTANCE_CHECKER(VirtIONet, VIRTIO_NET,
+                         TYPE_VIRTIO_NET)
 
 #define TX_TIMER_INTERVAL 150000 /* 150 us */
 
diff --git a/include/hw/virtio/virtio-pmem.h b/include/hw/virtio/virtio-pmem.h
index 56bce2be7a..6c15abad70 100644
--- a/include/hw/virtio/virtio-pmem.h
+++ b/include/hw/virtio/virtio-pmem.h
@@ -22,12 +22,8 @@
 
 typedef struct VirtIOPMEM VirtIOPMEM;
 typedef struct VirtIOPMEMClass VirtIOPMEMClass;
-#define VIRTIO_PMEM(obj) \
-        OBJECT_CHECK(VirtIOPMEM, (obj), TYPE_VIRTIO_PMEM)
-#define VIRTIO_PMEM_CLASS(oc) \
-        OBJECT_CLASS_CHECK(VirtIOPMEMClass, (oc), TYPE_VIRTIO_PMEM)
-#define VIRTIO_PMEM_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(VirtIOPMEMClass, (obj), TYPE_VIRTIO_PMEM)
+DECLARE_OBJ_CHECKERS(VirtIOPMEM, VirtIOPMEMClass,
+                     VIRTIO_PMEM, TYPE_VIRTIO_PMEM)
 
 #define VIRTIO_PMEM_ADDR_PROP "memaddr"
 #define VIRTIO_PMEM_MEMDEV_PROP "memdev"
diff --git a/include/hw/virtio/virtio-rng.h b/include/hw/virtio/virtio-rng.h
index 34fb5f695f..3671c9ba19 100644
--- a/include/hw/virtio/virtio-rng.h
+++ b/include/hw/virtio/virtio-rng.h
@@ -19,8 +19,8 @@
 
 #define TYPE_VIRTIO_RNG "virtio-rng-device"
 typedef struct VirtIORNG VirtIORNG;
-#define VIRTIO_RNG(obj) \
-        OBJECT_CHECK(VirtIORNG, (obj), TYPE_VIRTIO_RNG)
+DECLARE_INSTANCE_CHECKER(VirtIORNG, VIRTIO_RNG,
+                         TYPE_VIRTIO_RNG)
 #define VIRTIO_RNG_GET_PARENT_CLASS(obj) \
         OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_RNG)
 
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index bbf4b9a356..9a8a06fdd1 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -27,13 +27,13 @@
 
 #define TYPE_VIRTIO_SCSI_COMMON "virtio-scsi-common"
 typedef struct VirtIOSCSICommon VirtIOSCSICommon;
-#define VIRTIO_SCSI_COMMON(obj) \
-        OBJECT_CHECK(VirtIOSCSICommon, (obj), TYPE_VIRTIO_SCSI_COMMON)
+DECLARE_INSTANCE_CHECKER(VirtIOSCSICommon, VIRTIO_SCSI_COMMON,
+                         TYPE_VIRTIO_SCSI_COMMON)
 
 #define TYPE_VIRTIO_SCSI "virtio-scsi-device"
 typedef struct VirtIOSCSI VirtIOSCSI;
-#define VIRTIO_SCSI(obj) \
-        OBJECT_CHECK(VirtIOSCSI, (obj), TYPE_VIRTIO_SCSI)
+DECLARE_INSTANCE_CHECKER(VirtIOSCSI, VIRTIO_SCSI,
+                         TYPE_VIRTIO_SCSI)
 
 #define VIRTIO_SCSI_MAX_CHANNEL 0
 #define VIRTIO_SCSI_MAX_TARGET  255
diff --git a/include/hw/virtio/virtio-serial.h b/include/hw/virtio/virtio-serial.h
index 94da09ec34..bbc76d5032 100644
--- a/include/hw/virtio/virtio-serial.h
+++ b/include/hw/virtio/virtio-serial.h
@@ -28,19 +28,15 @@ struct virtio_serial_conf {
 #define TYPE_VIRTIO_SERIAL_PORT "virtio-serial-port"
 typedef struct VirtIOSerialPort VirtIOSerialPort;
 typedef struct VirtIOSerialPortClass VirtIOSerialPortClass;
-#define VIRTIO_SERIAL_PORT(obj) \
-     OBJECT_CHECK(VirtIOSerialPort, (obj), TYPE_VIRTIO_SERIAL_PORT)
-#define VIRTIO_SERIAL_PORT_CLASS(klass) \
-     OBJECT_CLASS_CHECK(VirtIOSerialPortClass, (klass), TYPE_VIRTIO_SERIAL_PORT)
-#define VIRTIO_SERIAL_PORT_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(VirtIOSerialPortClass, (obj), TYPE_VIRTIO_SERIAL_PORT)
+DECLARE_OBJ_CHECKERS(VirtIOSerialPort, VirtIOSerialPortClass,
+                     VIRTIO_SERIAL_PORT, TYPE_VIRTIO_SERIAL_PORT)
 
 typedef struct VirtIOSerial VirtIOSerial;
 
 #define TYPE_VIRTIO_SERIAL_BUS "virtio-serial-bus"
 typedef struct VirtIOSerialBus VirtIOSerialBus;
-#define VIRTIO_SERIAL_BUS(obj) \
-      OBJECT_CHECK(VirtIOSerialBus, (obj), TYPE_VIRTIO_SERIAL_BUS)
+DECLARE_INSTANCE_CHECKER(VirtIOSerialBus, VIRTIO_SERIAL_BUS,
+                         TYPE_VIRTIO_SERIAL_BUS)
 
 
 struct VirtIOSerialPortClass {
@@ -230,7 +226,7 @@ size_t virtio_serial_guest_ready(VirtIOSerialPort *port);
 void virtio_serial_throttle_port(VirtIOSerialPort *port, bool throttle);
 
 #define TYPE_VIRTIO_SERIAL "virtio-serial-device"
-#define VIRTIO_SERIAL(obj) \
-        OBJECT_CHECK(VirtIOSerial, (obj), TYPE_VIRTIO_SERIAL)
+DECLARE_INSTANCE_CHECKER(VirtIOSerial, VIRTIO_SERIAL,
+                         TYPE_VIRTIO_SERIAL)
 
 #endif
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 261d087de8..807280451b 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -69,12 +69,8 @@ typedef struct VirtQueueElement
 
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 typedef struct VirtioDeviceClass VirtioDeviceClass;
-#define VIRTIO_DEVICE_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(VirtioDeviceClass, obj, TYPE_VIRTIO_DEVICE)
-#define VIRTIO_DEVICE_CLASS(klass) \
-        OBJECT_CLASS_CHECK(VirtioDeviceClass, klass, TYPE_VIRTIO_DEVICE)
-#define VIRTIO_DEVICE(obj) \
-        OBJECT_CHECK(VirtIODevice, (obj), TYPE_VIRTIO_DEVICE)
+DECLARE_OBJ_CHECKERS(VirtIODevice, VirtioDeviceClass,
+                     VIRTIO_DEVICE, TYPE_VIRTIO_DEVICE)
 
 enum virtio_device_endian {
     VIRTIO_DEVICE_ENDIAN_UNKNOWN,
diff --git a/include/hw/vmstate-if.h b/include/hw/vmstate-if.h
index eabf5b05ad..52df571d17 100644
--- a/include/hw/vmstate-if.h
+++ b/include/hw/vmstate-if.h
@@ -14,10 +14,8 @@
 #define TYPE_VMSTATE_IF "vmstate-if"
 
 typedef struct VMStateIfClass VMStateIfClass;
-#define VMSTATE_IF_CLASS(klass)                                     \
-    OBJECT_CLASS_CHECK(VMStateIfClass, (klass), TYPE_VMSTATE_IF)
-#define VMSTATE_IF_GET_CLASS(obj)                           \
-    OBJECT_GET_CLASS(VMStateIfClass, (obj), TYPE_VMSTATE_IF)
+DECLARE_CLASS_CHECKERS(VMStateIfClass, VMSTATE_IF,
+                       TYPE_VMSTATE_IF)
 #define VMSTATE_IF(obj)                             \
     INTERFACE_CHECK(VMStateIf, (obj), TYPE_VMSTATE_IF)
 
diff --git a/include/hw/watchdog/cmsdk-apb-watchdog.h b/include/hw/watchdog/cmsdk-apb-watchdog.h
index be2983eefa..63f4becf86 100644
--- a/include/hw/watchdog/cmsdk-apb-watchdog.h
+++ b/include/hw/watchdog/cmsdk-apb-watchdog.h
@@ -37,8 +37,8 @@
 
 #define TYPE_CMSDK_APB_WATCHDOG "cmsdk-apb-watchdog"
 typedef struct CMSDKAPBWatchdog CMSDKAPBWatchdog;
-#define CMSDK_APB_WATCHDOG(obj) OBJECT_CHECK(CMSDKAPBWatchdog, (obj), \
-                                              TYPE_CMSDK_APB_WATCHDOG)
+DECLARE_INSTANCE_CHECKER(CMSDKAPBWatchdog, CMSDK_APB_WATCHDOG,
+                         TYPE_CMSDK_APB_WATCHDOG)
 
 /*
  * This shares the same struct (and cast macro) as the base
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index ba9a0a1fd8..2ca1eb5432 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -17,8 +17,8 @@
 #define TYPE_ASPEED_WDT "aspeed.wdt"
 typedef struct AspeedWDTClass AspeedWDTClass;
 typedef struct AspeedWDTState AspeedWDTState;
-#define ASPEED_WDT(obj) \
-    OBJECT_CHECK(AspeedWDTState, (obj), TYPE_ASPEED_WDT)
+DECLARE_OBJ_CHECKERS(AspeedWDTState, AspeedWDTClass,
+                     ASPEED_WDT, TYPE_ASPEED_WDT)
 #define TYPE_ASPEED_2400_WDT TYPE_ASPEED_WDT "-ast2400"
 #define TYPE_ASPEED_2500_WDT TYPE_ASPEED_WDT "-ast2500"
 #define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
@@ -38,10 +38,6 @@ struct AspeedWDTState {
     uint32_t pclk_freq;
 };
 
-#define ASPEED_WDT_CLASS(klass) \
-     OBJECT_CLASS_CHECK(AspeedWDTClass, (klass), TYPE_ASPEED_WDT)
-#define ASPEED_WDT_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(AspeedWDTClass, (obj), TYPE_ASPEED_WDT)
 
 struct AspeedWDTClass {
     SysBusDeviceClass parent_class;
diff --git a/include/hw/watchdog/wdt_diag288.h b/include/hw/watchdog/wdt_diag288.h
index e611163821..f72c1d3318 100644
--- a/include/hw/watchdog/wdt_diag288.h
+++ b/include/hw/watchdog/wdt_diag288.h
@@ -7,12 +7,8 @@
 #define TYPE_WDT_DIAG288 "diag288"
 typedef struct DIAG288Class DIAG288Class;
 typedef struct DIAG288State DIAG288State;
-#define DIAG288(obj) \
-    OBJECT_CHECK(DIAG288State, (obj), TYPE_WDT_DIAG288)
-#define DIAG288_CLASS(klass) \
-    OBJECT_CLASS_CHECK(DIAG288Class, (klass), TYPE_WDT_DIAG288)
-#define DIAG288_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(DIAG288Class, (obj), TYPE_WDT_DIAG288)
+DECLARE_OBJ_CHECKERS(DIAG288State, DIAG288Class,
+                     DIAG288, TYPE_WDT_DIAG288)
 
 #define WDT_DIAG288_INIT      0
 #define WDT_DIAG288_CHANGE    1
diff --git a/include/hw/watchdog/wdt_imx2.h b/include/hw/watchdog/wdt_imx2.h
index 8757418b46..7665d93640 100644
--- a/include/hw/watchdog/wdt_imx2.h
+++ b/include/hw/watchdog/wdt_imx2.h
@@ -20,7 +20,8 @@
 
 #define TYPE_IMX2_WDT "imx2.wdt"
 typedef struct IMX2WdtState IMX2WdtState;
-#define IMX2_WDT(obj) OBJECT_CHECK(IMX2WdtState, (obj), TYPE_IMX2_WDT)
+DECLARE_INSTANCE_CHECKER(IMX2WdtState, IMX2_WDT,
+                         TYPE_IMX2_WDT)
 
 enum IMX2WdtRegisters {
     IMX2_WDT_WCR  = 0x0000, /* Control Register */
diff --git a/include/hw/xen/xen-block.h b/include/hw/xen/xen-block.h
index 54f2e35122..8ff5421dc3 100644
--- a/include/hw/xen/xen-block.h
+++ b/include/hw/xen/xen-block.h
@@ -71,12 +71,8 @@ struct XenBlockDeviceClass {
 typedef struct XenBlockDeviceClass XenBlockDeviceClass;
 
 #define TYPE_XEN_BLOCK_DEVICE  "xen-block"
-#define XEN_BLOCK_DEVICE(obj) \
-     OBJECT_CHECK(XenBlockDevice, (obj), TYPE_XEN_BLOCK_DEVICE)
-#define XEN_BLOCK_DEVICE_CLASS(class) \
-     OBJECT_CLASS_CHECK(XenBlockDeviceClass, (class), TYPE_XEN_BLOCK_DEVICE)
-#define XEN_BLOCK_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(XenBlockDeviceClass, (obj), TYPE_XEN_BLOCK_DEVICE)
+DECLARE_OBJ_CHECKERS(XenBlockDevice, XenBlockDeviceClass,
+                     XEN_BLOCK_DEVICE, TYPE_XEN_BLOCK_DEVICE)
 
 struct XenDiskDevice {
     XenBlockDevice blockdev;
@@ -84,8 +80,8 @@ struct XenDiskDevice {
 typedef struct XenDiskDevice XenDiskDevice;
 
 #define TYPE_XEN_DISK_DEVICE  "xen-disk"
-#define XEN_DISK_DEVICE(obj) \
-     OBJECT_CHECK(XenDiskDevice, (obj), TYPE_XEN_DISK_DEVICE)
+DECLARE_INSTANCE_CHECKER(XenDiskDevice, XEN_DISK_DEVICE,
+                         TYPE_XEN_DISK_DEVICE)
 
 struct XenCDRomDevice {
     XenBlockDevice blockdev;
@@ -93,7 +89,7 @@ struct XenCDRomDevice {
 typedef struct XenCDRomDevice XenCDRomDevice;
 
 #define TYPE_XEN_CDROM_DEVICE  "xen-cdrom"
-#define XEN_CDROM_DEVICE(obj) \
-     OBJECT_CHECK(XenCDRomDevice, (obj), TYPE_XEN_CDROM_DEVICE)
+DECLARE_INSTANCE_CHECKER(XenCDRomDevice, XEN_CDROM_DEVICE,
+                         TYPE_XEN_CDROM_DEVICE)
 
 #endif /* HW_XEN_BLOCK_H */
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 910cf49161..35fec7c905 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -60,12 +60,8 @@ struct XenDeviceClass {
 typedef struct XenDeviceClass XenDeviceClass;
 
 #define TYPE_XEN_DEVICE "xen-device"
-#define XEN_DEVICE(obj) \
-     OBJECT_CHECK(XenDevice, (obj), TYPE_XEN_DEVICE)
-#define XEN_DEVICE_CLASS(class) \
-     OBJECT_CLASS_CHECK(XenDeviceClass, (class), TYPE_XEN_DEVICE)
-#define XEN_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(XenDeviceClass, (obj), TYPE_XEN_DEVICE)
+DECLARE_OBJ_CHECKERS(XenDevice, XenDeviceClass,
+                     XEN_DEVICE, TYPE_XEN_DEVICE)
 
 struct XenBus {
     BusState qbus;
@@ -84,12 +80,8 @@ struct XenBusClass {
 typedef struct XenBusClass XenBusClass;
 
 #define TYPE_XEN_BUS "xen-bus"
-#define XEN_BUS(obj) \
-    OBJECT_CHECK(XenBus, (obj), TYPE_XEN_BUS)
-#define XEN_BUS_CLASS(class) \
-    OBJECT_CLASS_CHECK(XenBusClass, (class), TYPE_XEN_BUS)
-#define XEN_BUS_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(XenBusClass, (obj), TYPE_XEN_BUS)
+DECLARE_OBJ_CHECKERS(XenBus, XenBusClass,
+                     XEN_BUS, TYPE_XEN_BUS)
 
 void xen_bus_init(void);
 
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index 89b51e05fc..ba7a3c59bb 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -11,8 +11,8 @@
 #define TYPE_XENBACKEND "xen-backend"
 
 typedef struct XenLegacyDevice XenLegacyDevice;
-#define XENBACKEND_DEVICE(obj) \
-    OBJECT_CHECK(XenLegacyDevice, (obj), TYPE_XENBACKEND)
+DECLARE_INSTANCE_CHECKER(XenLegacyDevice, XENBACKEND_DEVICE,
+                         TYPE_XENBACKEND)
 
 /* variables */
 extern struct xs_handle *xenstore;
diff --git a/include/io/channel-buffer.h b/include/io/channel-buffer.h
index 344d5957fd..89632ef437 100644
--- a/include/io/channel-buffer.h
+++ b/include/io/channel-buffer.h
@@ -26,8 +26,8 @@
 
 #define TYPE_QIO_CHANNEL_BUFFER "qio-channel-buffer"
 typedef struct QIOChannelBuffer QIOChannelBuffer;
-#define QIO_CHANNEL_BUFFER(obj)                                     \
-    OBJECT_CHECK(QIOChannelBuffer, (obj), TYPE_QIO_CHANNEL_BUFFER)
+DECLARE_INSTANCE_CHECKER(QIOChannelBuffer, QIO_CHANNEL_BUFFER,
+                         TYPE_QIO_CHANNEL_BUFFER)
 
 
 /**
diff --git a/include/io/channel-command.h b/include/io/channel-command.h
index b1671062d0..4b64ff011b 100644
--- a/include/io/channel-command.h
+++ b/include/io/channel-command.h
@@ -26,8 +26,8 @@
 
 #define TYPE_QIO_CHANNEL_COMMAND "qio-channel-command"
 typedef struct QIOChannelCommand QIOChannelCommand;
-#define QIO_CHANNEL_COMMAND(obj)                                     \
-    OBJECT_CHECK(QIOChannelCommand, (obj), TYPE_QIO_CHANNEL_COMMAND)
+DECLARE_INSTANCE_CHECKER(QIOChannelCommand, QIO_CHANNEL_COMMAND,
+                         TYPE_QIO_CHANNEL_COMMAND)
 
 
 
diff --git a/include/io/channel-file.h b/include/io/channel-file.h
index d91c9f5bc1..c6caf179d9 100644
--- a/include/io/channel-file.h
+++ b/include/io/channel-file.h
@@ -26,8 +26,8 @@
 
 #define TYPE_QIO_CHANNEL_FILE "qio-channel-file"
 typedef struct QIOChannelFile QIOChannelFile;
-#define QIO_CHANNEL_FILE(obj)                                     \
-    OBJECT_CHECK(QIOChannelFile, (obj), TYPE_QIO_CHANNEL_FILE)
+DECLARE_INSTANCE_CHECKER(QIOChannelFile, QIO_CHANNEL_FILE,
+                         TYPE_QIO_CHANNEL_FILE)
 
 
 /**
diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index ee898d991b..62e3e2e970 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -28,8 +28,8 @@
 
 #define TYPE_QIO_CHANNEL_SOCKET "qio-channel-socket"
 typedef struct QIOChannelSocket QIOChannelSocket;
-#define QIO_CHANNEL_SOCKET(obj)                                     \
-    OBJECT_CHECK(QIOChannelSocket, (obj), TYPE_QIO_CHANNEL_SOCKET)
+DECLARE_INSTANCE_CHECKER(QIOChannelSocket, QIO_CHANNEL_SOCKET,
+                         TYPE_QIO_CHANNEL_SOCKET)
 
 
 /**
diff --git a/include/io/channel-tls.h b/include/io/channel-tls.h
index ebd42f981e..036bf54195 100644
--- a/include/io/channel-tls.h
+++ b/include/io/channel-tls.h
@@ -28,8 +28,8 @@
 
 #define TYPE_QIO_CHANNEL_TLS "qio-channel-tls"
 typedef struct QIOChannelTLS QIOChannelTLS;
-#define QIO_CHANNEL_TLS(obj)                                     \
-    OBJECT_CHECK(QIOChannelTLS, (obj), TYPE_QIO_CHANNEL_TLS)
+DECLARE_INSTANCE_CHECKER(QIOChannelTLS, QIO_CHANNEL_TLS,
+                         TYPE_QIO_CHANNEL_TLS)
 
 
 /**
diff --git a/include/io/channel-websock.h b/include/io/channel-websock.h
index 5ab8811306..b07eddabe1 100644
--- a/include/io/channel-websock.h
+++ b/include/io/channel-websock.h
@@ -28,8 +28,8 @@
 
 #define TYPE_QIO_CHANNEL_WEBSOCK "qio-channel-websock"
 typedef struct QIOChannelWebsock QIOChannelWebsock;
-#define QIO_CHANNEL_WEBSOCK(obj)                                     \
-    OBJECT_CHECK(QIOChannelWebsock, (obj), TYPE_QIO_CHANNEL_WEBSOCK)
+DECLARE_INSTANCE_CHECKER(QIOChannelWebsock, QIO_CHANNEL_WEBSOCK,
+                         TYPE_QIO_CHANNEL_WEBSOCK)
 
 typedef union QIOChannelWebsockMask QIOChannelWebsockMask;
 
diff --git a/include/io/channel.h b/include/io/channel.h
index 67b9768eff..3ebdc7954f 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -28,12 +28,8 @@
 #define TYPE_QIO_CHANNEL "qio-channel"
 typedef struct QIOChannel QIOChannel;
 typedef struct QIOChannelClass QIOChannelClass;
-#define QIO_CHANNEL(obj)                                    \
-    OBJECT_CHECK(QIOChannel, (obj), TYPE_QIO_CHANNEL)
-#define QIO_CHANNEL_CLASS(klass)                                    \
-    OBJECT_CLASS_CHECK(QIOChannelClass, klass, TYPE_QIO_CHANNEL)
-#define QIO_CHANNEL_GET_CLASS(obj)                                  \
-    OBJECT_GET_CLASS(QIOChannelClass, obj, TYPE_QIO_CHANNEL)
+DECLARE_OBJ_CHECKERS(QIOChannel, QIOChannelClass,
+                     QIO_CHANNEL, TYPE_QIO_CHANNEL)
 
 
 #define QIO_CHANNEL_ERR_BLOCK -2
diff --git a/include/io/dns-resolver.h b/include/io/dns-resolver.h
index 5e720bf267..96a3186b6b 100644
--- a/include/io/dns-resolver.h
+++ b/include/io/dns-resolver.h
@@ -28,12 +28,8 @@
 #define TYPE_QIO_DNS_RESOLVER "qio-dns-resolver"
 typedef struct QIODNSResolver QIODNSResolver;
 typedef struct QIODNSResolverClass QIODNSResolverClass;
-#define QIO_DNS_RESOLVER(obj)                                    \
-    OBJECT_CHECK(QIODNSResolver, (obj), TYPE_QIO_DNS_RESOLVER)
-#define QIO_DNS_RESOLVER_CLASS(klass)                                    \
-    OBJECT_CLASS_CHECK(QIODNSResolverClass, klass, TYPE_QIO_DNS_RESOLVER)
-#define QIO_DNS_RESOLVER_GET_CLASS(obj)                                  \
-    OBJECT_GET_CLASS(QIODNSResolverClass, obj, TYPE_QIO_DNS_RESOLVER)
+DECLARE_OBJ_CHECKERS(QIODNSResolver, QIODNSResolverClass,
+                     QIO_DNS_RESOLVER, TYPE_QIO_DNS_RESOLVER)
 
 
 /**
diff --git a/include/io/net-listener.h b/include/io/net-listener.h
index fbdd2dbf9a..93367db291 100644
--- a/include/io/net-listener.h
+++ b/include/io/net-listener.h
@@ -27,12 +27,8 @@
 #define TYPE_QIO_NET_LISTENER "qio-net-listener"
 typedef struct QIONetListener QIONetListener;
 typedef struct QIONetListenerClass QIONetListenerClass;
-#define QIO_NET_LISTENER(obj)                                    \
-    OBJECT_CHECK(QIONetListener, (obj), TYPE_QIO_NET_LISTENER)
-#define QIO_NET_LISTENER_CLASS(klass)                                    \
-    OBJECT_CLASS_CHECK(QIONetListenerClass, klass, TYPE_QIO_NET_LISTENER)
-#define QIO_NET_LISTENER_GET_CLASS(obj)                                  \
-    OBJECT_GET_CLASS(QIONetListenerClass, obj, TYPE_QIO_NET_LISTENER)
+DECLARE_OBJ_CHECKERS(QIONetListener, QIONetListenerClass,
+                     QIO_NET_LISTENER, TYPE_QIO_NET_LISTENER)
 
 
 typedef void (*QIONetListenerClientFunc)(QIONetListener *listener,
diff --git a/include/net/can_emu.h b/include/net/can_emu.h
index 7e90fd8a45..150f91a657 100644
--- a/include/net/can_emu.h
+++ b/include/net/can_emu.h
@@ -100,8 +100,8 @@ struct CanBusClientState {
 };
 
 #define TYPE_CAN_BUS "can-bus"
-#define CAN_BUS(obj) \
-     OBJECT_CHECK(CanBusState, (obj), TYPE_CAN_BUS)
+DECLARE_INSTANCE_CHECKER(CanBusState, CAN_BUS,
+                         TYPE_CAN_BUS)
 
 int can_bus_filter_match(struct qemu_can_filter *filter, qemu_canid_t can_id);
 
diff --git a/include/net/can_host.h b/include/net/can_host.h
index 13b6a191dd..18979c2e2d 100644
--- a/include/net/can_host.h
+++ b/include/net/can_host.h
@@ -34,12 +34,8 @@
 #define TYPE_CAN_HOST "can-host"
 typedef struct CanHostClass CanHostClass;
 typedef struct CanHostState CanHostState;
-#define CAN_HOST_CLASS(klass) \
-     OBJECT_CLASS_CHECK(CanHostClass, (klass), TYPE_CAN_HOST)
-#define CAN_HOST_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(CanHostClass, (obj), TYPE_CAN_HOST)
-#define CAN_HOST(obj) \
-     OBJECT_CHECK(CanHostState, (obj), TYPE_CAN_HOST)
+DECLARE_OBJ_CHECKERS(CanHostState, CanHostClass,
+                     CAN_HOST, TYPE_CAN_HOST)
 
 struct CanHostState {
     ObjectClass oc;
diff --git a/include/net/filter.h b/include/net/filter.h
index 0d4f011bc0..e7e593128a 100644
--- a/include/net/filter.h
+++ b/include/net/filter.h
@@ -16,12 +16,8 @@
 
 #define TYPE_NETFILTER "netfilter"
 typedef struct NetFilterClass NetFilterClass;
-#define NETFILTER(obj) \
-    OBJECT_CHECK(NetFilterState, (obj), TYPE_NETFILTER)
-#define NETFILTER_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(NetFilterClass, (obj), TYPE_NETFILTER)
-#define NETFILTER_CLASS(klass) \
-    OBJECT_CLASS_CHECK(NetFilterClass, (klass), TYPE_NETFILTER)
+DECLARE_OBJ_CHECKERS(NetFilterState, NetFilterClass,
+                     NETFILTER, TYPE_NETFILTER)
 
 typedef void (FilterSetup) (NetFilterState *nf, Error **errp);
 typedef void (FilterCleanup) (NetFilterState *nf);
diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index 2be985f86e..f118fb516b 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -7,12 +7,8 @@
 #define TYPE_USER_CREATABLE "user-creatable"
 
 typedef struct UserCreatableClass UserCreatableClass;
-#define USER_CREATABLE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(UserCreatableClass, (klass), \
-                        TYPE_USER_CREATABLE)
-#define USER_CREATABLE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(UserCreatableClass, (obj), \
-                      TYPE_USER_CREATABLE)
+DECLARE_CLASS_CHECKERS(UserCreatableClass, USER_CREATABLE,
+                       TYPE_USER_CREATABLE)
 #define USER_CREATABLE(obj) \
      INTERFACE_CHECK(UserCreatable, (obj), \
                      TYPE_USER_CREATABLE)
diff --git a/include/scsi/pr-manager.h b/include/scsi/pr-manager.h
index 2c699e4030..f801fe9533 100644
--- a/include/scsi/pr-manager.h
+++ b/include/scsi/pr-manager.h
@@ -11,12 +11,8 @@
 
 typedef struct PRManager PRManager;
 typedef struct PRManagerClass PRManagerClass;
-#define PR_MANAGER_CLASS(klass) \
-     OBJECT_CLASS_CHECK(PRManagerClass, (klass), TYPE_PR_MANAGER)
-#define PR_MANAGER_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PRManagerClass, (obj), TYPE_PR_MANAGER)
-#define PR_MANAGER(obj) \
-     OBJECT_CHECK(PRManager, (obj), TYPE_PR_MANAGER)
+DECLARE_OBJ_CHECKERS(PRManager, PRManagerClass,
+                     PR_MANAGER, TYPE_PR_MANAGER)
 
 struct sg_io_hdr;
 
diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
index 2bda18be12..6189f6aa7a 100644
--- a/include/sysemu/accel.h
+++ b/include/sysemu/accel.h
@@ -61,12 +61,8 @@ typedef struct AccelClass AccelClass;
 #define ACCEL_CLASS_SUFFIX  "-" TYPE_ACCEL
 #define ACCEL_CLASS_NAME(a) (a ACCEL_CLASS_SUFFIX)
 
-#define ACCEL_CLASS(klass) \
-    OBJECT_CLASS_CHECK(AccelClass, (klass), TYPE_ACCEL)
-#define ACCEL(obj) \
-    OBJECT_CHECK(AccelState, (obj), TYPE_ACCEL)
-#define ACCEL_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(AccelClass, (obj), TYPE_ACCEL)
+DECLARE_OBJ_CHECKERS(AccelState, AccelClass,
+                     ACCEL, TYPE_ACCEL)
 
 AccelClass *accel_find(const char *opt_name);
 int accel_init_machine(AccelState *accel, MachineState *ms);
diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
index e11526271a..65c017cf81 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -39,15 +39,8 @@
 
 typedef struct CryptoDevBackend CryptoDevBackend;
 typedef struct CryptoDevBackendClass CryptoDevBackendClass;
-#define CRYPTODEV_BACKEND(obj) \
-    OBJECT_CHECK(CryptoDevBackend, \
-                 (obj), TYPE_CRYPTODEV_BACKEND)
-#define CRYPTODEV_BACKEND_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(CryptoDevBackendClass, \
-                 (obj), TYPE_CRYPTODEV_BACKEND)
-#define CRYPTODEV_BACKEND_CLASS(klass) \
-    OBJECT_CLASS_CHECK(CryptoDevBackendClass, \
-                (klass), TYPE_CRYPTODEV_BACKEND)
+DECLARE_OBJ_CHECKERS(CryptoDevBackend, CryptoDevBackendClass,
+                     CRYPTODEV_BACKEND, TYPE_CRYPTODEV_BACKEND)
 
 
 #define MAX_CRYPTO_QUEUE_NUM  64
diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index 7b775b6687..1e6078f872 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -22,12 +22,8 @@
 #define TYPE_MEMORY_BACKEND "memory-backend"
 typedef struct HostMemoryBackend HostMemoryBackend;
 typedef struct HostMemoryBackendClass HostMemoryBackendClass;
-#define MEMORY_BACKEND(obj) \
-    OBJECT_CHECK(HostMemoryBackend, (obj), TYPE_MEMORY_BACKEND)
-#define MEMORY_BACKEND_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(HostMemoryBackendClass, (obj), TYPE_MEMORY_BACKEND)
-#define MEMORY_BACKEND_CLASS(klass) \
-    OBJECT_CLASS_CHECK(HostMemoryBackendClass, (klass), TYPE_MEMORY_BACKEND)
+DECLARE_OBJ_CHECKERS(HostMemoryBackend, HostMemoryBackendClass,
+                     MEMORY_BACKEND, TYPE_MEMORY_BACKEND)
 
 /* hostmem-ram.c */
 /**
diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
index 566b5f52fc..1398679458 100644
--- a/include/sysemu/hvf.h
+++ b/include/sysemu/hvf.h
@@ -37,7 +37,7 @@ void hvf_vcpu_destroy(CPUState *);
 #define TYPE_HVF_ACCEL ACCEL_CLASS_NAME("hvf")
 
 typedef struct HVFState HVFState;
-#define HVF_STATE(obj) \
-    OBJECT_CHECK(HVFState, (obj), TYPE_HVF_ACCEL)
+DECLARE_INSTANCE_CHECKER(HVFState, HVF_STATE,
+                         TYPE_HVF_ACCEL)
 
 #endif
diff --git a/include/sysemu/iothread.h b/include/sysemu/iothread.h
index 42902ffb9f..0c5284dbbc 100644
--- a/include/sysemu/iothread.h
+++ b/include/sysemu/iothread.h
@@ -40,8 +40,8 @@ struct IOThread {
 };
 typedef struct IOThread IOThread;
 
-#define IOTHREAD(obj) \
-   OBJECT_CHECK(IOThread, obj, TYPE_IOTHREAD)
+DECLARE_INSTANCE_CHECKER(IOThread, IOTHREAD,
+                         TYPE_IOTHREAD)
 
 char *iothread_get_id(IOThread *iothread);
 IOThread *iothread_by_id(const char *id);
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 3e89884c54..5bbea53883 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -204,8 +204,8 @@ struct KVMState;
 
 #define TYPE_KVM_ACCEL ACCEL_CLASS_NAME("kvm")
 typedef struct KVMState KVMState;
-#define KVM_STATE(obj) \
-    OBJECT_CHECK(KVMState, (obj), TYPE_KVM_ACCEL)
+DECLARE_INSTANCE_CHECKER(KVMState, KVM_STATE,
+                         TYPE_KVM_ACCEL)
 
 extern KVMState *kvm_state;
 typedef struct Notifier Notifier;
diff --git a/include/sysemu/rng-random.h b/include/sysemu/rng-random.h
index 87e82dd7a3..58033ac3fe 100644
--- a/include/sysemu/rng-random.h
+++ b/include/sysemu/rng-random.h
@@ -16,7 +16,8 @@
 
 #define TYPE_RNG_RANDOM "rng-random"
 typedef struct RngRandom RngRandom;
-#define RNG_RANDOM(obj) OBJECT_CHECK(RngRandom, (obj), TYPE_RNG_RANDOM)
+DECLARE_INSTANCE_CHECKER(RngRandom, RNG_RANDOM,
+                         TYPE_RNG_RANDOM)
 
 
 #endif
diff --git a/include/sysemu/rng.h b/include/sysemu/rng.h
index c38da7d342..f8fc948109 100644
--- a/include/sysemu/rng.h
+++ b/include/sysemu/rng.h
@@ -19,12 +19,8 @@
 #define TYPE_RNG_BACKEND "rng-backend"
 typedef struct RngBackend RngBackend;
 typedef struct RngBackendClass RngBackendClass;
-#define RNG_BACKEND(obj) \
-    OBJECT_CHECK(RngBackend, (obj), TYPE_RNG_BACKEND)
-#define RNG_BACKEND_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(RngBackendClass, (obj), TYPE_RNG_BACKEND)
-#define RNG_BACKEND_CLASS(klass) \
-    OBJECT_CLASS_CHECK(RngBackendClass, (klass), TYPE_RNG_BACKEND)
+DECLARE_OBJ_CHECKERS(RngBackend, RngBackendClass,
+                     RNG_BACKEND, TYPE_RNG_BACKEND)
 
 #define TYPE_RNG_BUILTIN "rng-builtin"
 
diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 04673cab53..1a85564e47 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -27,10 +27,8 @@ typedef enum TPMVersion {
 
 #define TYPE_TPM_IF "tpm-if"
 typedef struct TPMIfClass TPMIfClass;
-#define TPM_IF_CLASS(klass)                                 \
-    OBJECT_CLASS_CHECK(TPMIfClass, (klass), TYPE_TPM_IF)
-#define TPM_IF_GET_CLASS(obj)                           \
-    OBJECT_GET_CLASS(TPMIfClass, (obj), TYPE_TPM_IF)
+DECLARE_CLASS_CHECKERS(TPMIfClass, TPM_IF,
+                       TYPE_TPM_IF)
 #define TPM_IF(obj)                             \
     INTERFACE_CHECK(TPMIf, (obj), TYPE_TPM_IF)
 
diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
index 740c94c6cd..e038b79d34 100644
--- a/include/sysemu/tpm_backend.h
+++ b/include/sysemu/tpm_backend.h
@@ -21,12 +21,8 @@
 #define TYPE_TPM_BACKEND "tpm-backend"
 typedef struct TPMBackend TPMBackend;
 typedef struct TPMBackendClass TPMBackendClass;
-#define TPM_BACKEND(obj) \
-    OBJECT_CHECK(TPMBackend, (obj), TYPE_TPM_BACKEND)
-#define TPM_BACKEND_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(TPMBackendClass, (obj), TYPE_TPM_BACKEND)
-#define TPM_BACKEND_CLASS(klass) \
-    OBJECT_CLASS_CHECK(TPMBackendClass, (klass), TYPE_TPM_BACKEND)
+DECLARE_OBJ_CHECKERS(TPMBackend, TPMBackendClass,
+                     TPM_BACKEND, TYPE_TPM_BACKEND)
 
 
 typedef struct TPMBackendCmd {
diff --git a/include/sysemu/vhost-user-backend.h b/include/sysemu/vhost-user-backend.h
index 89eb5eaf65..e4c85e33c0 100644
--- a/include/sysemu/vhost-user-backend.h
+++ b/include/sysemu/vhost-user-backend.h
@@ -24,12 +24,8 @@
 #define TYPE_VHOST_USER_BACKEND "vhost-user-backend"
 typedef struct VhostUserBackend VhostUserBackend;
 typedef struct VhostUserBackendClass VhostUserBackendClass;
-#define VHOST_USER_BACKEND(obj) \
-    OBJECT_CHECK(VhostUserBackend, (obj), TYPE_VHOST_USER_BACKEND)
-#define VHOST_USER_BACKEND_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(VhostUserBackendClass, (obj), TYPE_VHOST_USER_BACKEND)
-#define VHOST_USER_BACKEND_CLASS(klass) \
-    OBJECT_CLASS_CHECK(VhostUserBackendClass, (klass), TYPE_VHOST_USER_BACKEND)
+DECLARE_OBJ_CHECKERS(VhostUserBackend, VhostUserBackendClass,
+                     VHOST_USER_BACKEND, TYPE_VHOST_USER_BACKEND)
 
 
 struct VhostUserBackendClass {
diff --git a/include/ui/console.h b/include/ui/console.h
index 2a74a27d50..8602203523 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -107,12 +107,8 @@ void kbd_put_keysym(int keysym);
 
 #define TYPE_QEMU_CONSOLE "qemu-console"
 typedef struct QemuConsoleClass QemuConsoleClass;
-#define QEMU_CONSOLE(obj) \
-    OBJECT_CHECK(QemuConsole, (obj), TYPE_QEMU_CONSOLE)
-#define QEMU_CONSOLE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(QemuConsoleClass, (obj), TYPE_QEMU_CONSOLE)
-#define QEMU_CONSOLE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(QemuConsoleClass, (klass), TYPE_QEMU_CONSOLE)
+DECLARE_OBJ_CHECKERS(QemuConsole, QemuConsoleClass,
+                     QEMU_CONSOLE, TYPE_QEMU_CONSOLE)
 
 
 struct QemuConsoleClass {
diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
index 1124668cf0..45350318c9 100644
--- a/target/alpha/cpu-qom.h
+++ b/target/alpha/cpu-qom.h
@@ -27,12 +27,8 @@
 
 typedef struct AlphaCPU AlphaCPU;
 typedef struct AlphaCPUClass AlphaCPUClass;
-#define ALPHA_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(AlphaCPUClass, (klass), TYPE_ALPHA_CPU)
-#define ALPHA_CPU(obj) \
-    OBJECT_CHECK(AlphaCPU, (obj), TYPE_ALPHA_CPU)
-#define ALPHA_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(AlphaCPUClass, (obj), TYPE_ALPHA_CPU)
+DECLARE_OBJ_CHECKERS(AlphaCPU, AlphaCPUClass,
+                     ALPHA_CPU, TYPE_ALPHA_CPU)
 
 /**
  * AlphaCPUClass:
diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index d0c68b01c5..f12ca3a44c 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -29,12 +29,8 @@ struct arm_boot_info;
 
 typedef struct ARMCPU ARMCPU;
 typedef struct ARMCPUClass ARMCPUClass;
-#define ARM_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(ARMCPUClass, (klass), TYPE_ARM_CPU)
-#define ARM_CPU(obj) \
-    OBJECT_CHECK(ARMCPU, (obj), TYPE_ARM_CPU)
-#define ARM_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(ARMCPUClass, (obj), TYPE_ARM_CPU)
+DECLARE_OBJ_CHECKERS(ARMCPU, ARMCPUClass,
+                     ARM_CPU, TYPE_ARM_CPU)
 
 #define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
 
diff --git a/target/arm/idau.h b/target/arm/idau.h
index 2f09bbb34f..0ef5251971 100644
--- a/target/arm/idau.h
+++ b/target/arm/idau.h
@@ -34,10 +34,8 @@
 #define IDAU_INTERFACE(obj) \
     INTERFACE_CHECK(IDAUInterface, (obj), TYPE_IDAU_INTERFACE)
 typedef struct IDAUInterfaceClass IDAUInterfaceClass;
-#define IDAU_INTERFACE_CLASS(class) \
-    OBJECT_CLASS_CHECK(IDAUInterfaceClass, (class), TYPE_IDAU_INTERFACE)
-#define IDAU_INTERFACE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(IDAUInterfaceClass, (obj), TYPE_IDAU_INTERFACE)
+DECLARE_CLASS_CHECKERS(IDAUInterfaceClass, IDAU_INTERFACE,
+                       TYPE_IDAU_INTERFACE)
 
 typedef struct IDAUInterface IDAUInterface;
 
diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
index fac8430253..1bbfbb2087 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -28,12 +28,8 @@
 
 typedef struct AVRCPU AVRCPU;
 typedef struct AVRCPUClass AVRCPUClass;
-#define AVR_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(AVRCPUClass, (klass), TYPE_AVR_CPU)
-#define AVR_CPU(obj) \
-    OBJECT_CHECK(AVRCPU, (obj), TYPE_AVR_CPU)
-#define AVR_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(AVRCPUClass, (obj), TYPE_AVR_CPU)
+DECLARE_OBJ_CHECKERS(AVRCPU, AVRCPUClass,
+                     AVR_CPU, TYPE_AVR_CPU)
 
 /**
  *  AVRCPUClass:
diff --git a/target/cris/cpu-qom.h b/target/cris/cpu-qom.h
index cac3e9af1b..eced6ef7c9 100644
--- a/target/cris/cpu-qom.h
+++ b/target/cris/cpu-qom.h
@@ -27,12 +27,8 @@
 
 typedef struct CRISCPU CRISCPU;
 typedef struct CRISCPUClass CRISCPUClass;
-#define CRIS_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(CRISCPUClass, (klass), TYPE_CRIS_CPU)
-#define CRIS_CPU(obj) \
-    OBJECT_CHECK(CRISCPU, (obj), TYPE_CRIS_CPU)
-#define CRIS_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(CRISCPUClass, (obj), TYPE_CRIS_CPU)
+DECLARE_OBJ_CHECKERS(CRISCPU, CRISCPUClass,
+                     CRIS_CPU, TYPE_CRIS_CPU)
 
 /**
  * CRISCPUClass:
diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
index 295b2aaf19..5c5aa0c053 100644
--- a/target/hppa/cpu-qom.h
+++ b/target/hppa/cpu-qom.h
@@ -27,12 +27,8 @@
 
 typedef struct HPPACPU HPPACPU;
 typedef struct HPPACPUClass HPPACPUClass;
-#define HPPA_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(HPPACPUClass, (klass), TYPE_HPPA_CPU)
-#define HPPA_CPU(obj) \
-    OBJECT_CHECK(HPPACPU, (obj), TYPE_HPPA_CPU)
-#define HPPA_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(HPPACPUClass, (obj), TYPE_HPPA_CPU)
+DECLARE_OBJ_CHECKERS(HPPACPU, HPPACPUClass,
+                     HPPA_CPU, TYPE_HPPA_CPU)
 
 /**
  * HPPACPUClass:
diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index 6b0bf476e5..05b52ba74c 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -32,12 +32,8 @@
 
 typedef struct X86CPU X86CPU;
 typedef struct X86CPUClass X86CPUClass;
-#define X86_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(X86CPUClass, (klass), TYPE_X86_CPU)
-#define X86_CPU(obj) \
-    OBJECT_CHECK(X86CPU, (obj), TYPE_X86_CPU)
-#define X86_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(X86CPUClass, (obj), TYPE_X86_CPU)
+DECLARE_OBJ_CHECKERS(X86CPU, X86CPUClass,
+                     X86_CPU, TYPE_X86_CPU)
 
 typedef struct X86CPUModel X86CPUModel;
 
diff --git a/target/lm32/cpu-qom.h b/target/lm32/cpu-qom.h
index 2c0654b695..9bf2f82ffe 100644
--- a/target/lm32/cpu-qom.h
+++ b/target/lm32/cpu-qom.h
@@ -27,12 +27,8 @@
 
 typedef struct LM32CPU LM32CPU;
 typedef struct LM32CPUClass LM32CPUClass;
-#define LM32_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(LM32CPUClass, (klass), TYPE_LM32_CPU)
-#define LM32_CPU(obj) \
-    OBJECT_CHECK(LM32CPU, (obj), TYPE_LM32_CPU)
-#define LM32_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(LM32CPUClass, (obj), TYPE_LM32_CPU)
+DECLARE_OBJ_CHECKERS(LM32CPU, LM32CPUClass,
+                     LM32_CPU, TYPE_LM32_CPU)
 
 /**
  * LM32CPUClass:
diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
index 3b199be545..241a3b19af 100644
--- a/target/m68k/cpu-qom.h
+++ b/target/m68k/cpu-qom.h
@@ -27,12 +27,8 @@
 
 typedef struct M68kCPU M68kCPU;
 typedef struct M68kCPUClass M68kCPUClass;
-#define M68K_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(M68kCPUClass, (klass), TYPE_M68K_CPU)
-#define M68K_CPU(obj) \
-    OBJECT_CHECK(M68kCPU, (obj), TYPE_M68K_CPU)
-#define M68K_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(M68kCPUClass, (obj), TYPE_M68K_CPU)
+DECLARE_OBJ_CHECKERS(M68kCPU, M68kCPUClass,
+                     M68K_CPU, TYPE_M68K_CPU)
 
 /*
  * M68kCPUClass:
diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index 564fa18ccb..73c2237f98 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -27,12 +27,8 @@
 
 typedef struct MicroBlazeCPU MicroBlazeCPU;
 typedef struct MicroBlazeCPUClass MicroBlazeCPUClass;
-#define MICROBLAZE_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(MicroBlazeCPUClass, (klass), TYPE_MICROBLAZE_CPU)
-#define MICROBLAZE_CPU(obj) \
-    OBJECT_CHECK(MicroBlazeCPU, (obj), TYPE_MICROBLAZE_CPU)
-#define MICROBLAZE_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(MicroBlazeCPUClass, (obj), TYPE_MICROBLAZE_CPU)
+DECLARE_OBJ_CHECKERS(MicroBlazeCPU, MicroBlazeCPUClass,
+                     MICROBLAZE_CPU, TYPE_MICROBLAZE_CPU)
 
 /**
  * MicroBlazeCPUClass:
diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index 3a5fd9561e..82f45a828c 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -31,12 +31,8 @@
 
 typedef struct MIPSCPU MIPSCPU;
 typedef struct MIPSCPUClass MIPSCPUClass;
-#define MIPS_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(MIPSCPUClass, (klass), TYPE_MIPS_CPU)
-#define MIPS_CPU(obj) \
-    OBJECT_CHECK(MIPSCPU, (obj), TYPE_MIPS_CPU)
-#define MIPS_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(MIPSCPUClass, (obj), TYPE_MIPS_CPU)
+DECLARE_OBJ_CHECKERS(MIPSCPU, MIPSCPUClass,
+                     MIPS_CPU, TYPE_MIPS_CPU)
 
 /**
  * MIPSCPUClass:
diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
index af4d6abf16..a9832a2d85 100644
--- a/target/moxie/cpu.h
+++ b/target/moxie/cpu.h
@@ -53,12 +53,8 @@ typedef struct CPUMoxieState {
 
 typedef struct MoxieCPU MoxieCPU;
 typedef struct MoxieCPUClass MoxieCPUClass;
-#define MOXIE_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(MoxieCPUClass, (klass), TYPE_MOXIE_CPU)
-#define MOXIE_CPU(obj) \
-    OBJECT_CHECK(MoxieCPU, (obj), TYPE_MOXIE_CPU)
-#define MOXIE_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(MoxieCPUClass, (obj), TYPE_MOXIE_CPU)
+DECLARE_OBJ_CHECKERS(MoxieCPU, MoxieCPUClass,
+                     MOXIE_CPU, TYPE_MOXIE_CPU)
 
 /**
  * MoxieCPUClass:
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 7162cbdf5c..0b91a3634b 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -34,12 +34,8 @@ typedef struct CPUNios2State CPUNios2State;
 
 typedef struct Nios2CPU Nios2CPU;
 typedef struct Nios2CPUClass Nios2CPUClass;
-#define NIOS2_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(Nios2CPUClass, (klass), TYPE_NIOS2_CPU)
-#define NIOS2_CPU(obj) \
-    OBJECT_CHECK(Nios2CPU, (obj), TYPE_NIOS2_CPU)
-#define NIOS2_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(Nios2CPUClass, (obj), TYPE_NIOS2_CPU)
+DECLARE_OBJ_CHECKERS(Nios2CPU, Nios2CPUClass,
+                     NIOS2_CPU, TYPE_NIOS2_CPU)
 
 /**
  * Nios2CPUClass:
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index ab0dd55358..5e6d8a40d6 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -31,12 +31,8 @@ struct OpenRISCCPU;
 
 typedef struct OpenRISCCPU OpenRISCCPU;
 typedef struct OpenRISCCPUClass OpenRISCCPUClass;
-#define OPENRISC_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(OpenRISCCPUClass, (klass), TYPE_OPENRISC_CPU)
-#define OPENRISC_CPU(obj) \
-    OBJECT_CHECK(OpenRISCCPU, (obj), TYPE_OPENRISC_CPU)
-#define OPENRISC_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(OpenRISCCPUClass, (obj), TYPE_OPENRISC_CPU)
+DECLARE_OBJ_CHECKERS(OpenRISCCPU, OpenRISCCPUClass,
+                     OPENRISC_CPU, TYPE_OPENRISC_CPU)
 
 /**
  * OpenRISCCPUClass:
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 017f0efc7b..f7e600c7b3 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -31,12 +31,8 @@
 
 typedef struct PowerPCCPU PowerPCCPU;
 typedef struct PowerPCCPUClass PowerPCCPUClass;
-#define POWERPC_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(PowerPCCPUClass, (klass), TYPE_POWERPC_CPU)
-#define POWERPC_CPU(obj) \
-    OBJECT_CHECK(PowerPCCPU, (obj), TYPE_POWERPC_CPU)
-#define POWERPC_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(PowerPCCPUClass, (obj), TYPE_POWERPC_CPU)
+DECLARE_OBJ_CHECKERS(PowerPCCPU, PowerPCCPUClass,
+                     POWERPC_CPU, TYPE_POWERPC_CPU)
 
 typedef struct CPUPPCState CPUPPCState;
 typedef struct ppc_tb_t ppc_tb_t;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 1c6fbfcfdb..766e9c5c26 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1222,14 +1222,8 @@ struct PPCVirtualHypervisorClass {
 };
 
 #define TYPE_PPC_VIRTUAL_HYPERVISOR "ppc-virtual-hypervisor"
-#define PPC_VIRTUAL_HYPERVISOR(obj)                 \
-    OBJECT_CHECK(PPCVirtualHypervisor, (obj), TYPE_PPC_VIRTUAL_HYPERVISOR)
-#define PPC_VIRTUAL_HYPERVISOR_CLASS(klass)         \
-    OBJECT_CLASS_CHECK(PPCVirtualHypervisorClass, (klass), \
-                       TYPE_PPC_VIRTUAL_HYPERVISOR)
-#define PPC_VIRTUAL_HYPERVISOR_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(PPCVirtualHypervisorClass, (obj), \
-                     TYPE_PPC_VIRTUAL_HYPERVISOR)
+DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtualHypervisorClass,
+                     PPC_VIRTUAL_HYPERVISOR, TYPE_PPC_VIRTUAL_HYPERVISOR)
 #endif /* CONFIG_USER_ONLY */
 
 void ppc_cpu_do_interrupt(CPUState *cpu);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ff86613d94..04ccb78738 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -234,12 +234,8 @@ struct CPURISCVState {
 
 typedef struct RISCVCPU RISCVCPU;
 typedef struct RISCVCPUClass RISCVCPUClass;
-#define RISCV_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(RISCVCPUClass, (klass), TYPE_RISCV_CPU)
-#define RISCV_CPU(obj) \
-    OBJECT_CHECK(RISCVCPU, (obj), TYPE_RISCV_CPU)
-#define RISCV_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(RISCVCPUClass, (obj), TYPE_RISCV_CPU)
+DECLARE_OBJ_CHECKERS(RISCVCPU, RISCVCPUClass,
+                     RISCV_CPU, TYPE_RISCV_CPU)
 
 /**
  * RISCVCPUClass:
diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index 13f1f2659e..5f0dccdac1 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -27,12 +27,8 @@
 
 typedef struct S390CPU S390CPU;
 typedef struct S390CPUClass S390CPUClass;
-#define S390_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(S390CPUClass, (klass), TYPE_S390_CPU)
-#define S390_CPU(obj) \
-    OBJECT_CHECK(S390CPU, (obj), TYPE_S390_CPU)
-#define S390_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(S390CPUClass, (obj), TYPE_S390_CPU)
+DECLARE_OBJ_CHECKERS(S390CPU, S390CPUClass,
+                     S390_CPU, TYPE_S390_CPU)
 
 typedef struct S390CPUModel S390CPUModel;
 typedef struct S390CPUDef S390CPUDef;
diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
index bf71c0f8e5..b04b2bb4bf 100644
--- a/target/sh4/cpu-qom.h
+++ b/target/sh4/cpu-qom.h
@@ -31,12 +31,8 @@
 
 typedef struct SuperHCPU SuperHCPU;
 typedef struct SuperHCPUClass SuperHCPUClass;
-#define SUPERH_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(SuperHCPUClass, (klass), TYPE_SUPERH_CPU)
-#define SUPERH_CPU(obj) \
-    OBJECT_CHECK(SuperHCPU, (obj), TYPE_SUPERH_CPU)
-#define SUPERH_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(SuperHCPUClass, (obj), TYPE_SUPERH_CPU)
+DECLARE_OBJ_CHECKERS(SuperHCPU, SuperHCPUClass,
+                     SUPERH_CPU, TYPE_SUPERH_CPU)
 
 /**
  * SuperHCPUClass:
diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
index b7cc81e5f3..42cb631d45 100644
--- a/target/sparc/cpu-qom.h
+++ b/target/sparc/cpu-qom.h
@@ -31,12 +31,8 @@
 
 typedef struct SPARCCPU SPARCCPU;
 typedef struct SPARCCPUClass SPARCCPUClass;
-#define SPARC_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(SPARCCPUClass, (klass), TYPE_SPARC_CPU)
-#define SPARC_CPU(obj) \
-    OBJECT_CHECK(SPARCCPU, (obj), TYPE_SPARC_CPU)
-#define SPARC_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(SPARCCPUClass, (obj), TYPE_SPARC_CPU)
+DECLARE_OBJ_CHECKERS(SPARCCPU, SPARCCPUClass,
+                     SPARC_CPU, TYPE_SPARC_CPU)
 
 typedef struct sparc_def_t sparc_def_t;
 /**
diff --git a/target/tilegx/cpu.h b/target/tilegx/cpu.h
index d6cc1d2982..d4cf70dc15 100644
--- a/target/tilegx/cpu.h
+++ b/target/tilegx/cpu.h
@@ -101,12 +101,8 @@ typedef struct CPUTLGState {
 
 typedef struct TileGXCPU TileGXCPU;
 typedef struct TileGXCPUClass TileGXCPUClass;
-#define TILEGX_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(TileGXCPUClass, (klass), TYPE_TILEGX_CPU)
-#define TILEGX_CPU(obj) \
-    OBJECT_CHECK(TileGXCPU, (obj), TYPE_TILEGX_CPU)
-#define TILEGX_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(TileGXCPUClass, (obj), TYPE_TILEGX_CPU)
+DECLARE_OBJ_CHECKERS(TileGXCPU, TileGXCPUClass,
+                     TILEGX_CPU, TYPE_TILEGX_CPU)
 
 /**
  * TileGXCPUClass:
diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
index cef466da74..1988c26093 100644
--- a/target/tricore/cpu-qom.h
+++ b/target/tricore/cpu-qom.h
@@ -26,12 +26,8 @@
 
 typedef struct TriCoreCPU TriCoreCPU;
 typedef struct TriCoreCPUClass TriCoreCPUClass;
-#define TRICORE_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(TriCoreCPUClass, (klass), TYPE_TRICORE_CPU)
-#define TRICORE_CPU(obj) \
-    OBJECT_CHECK(TriCoreCPU, (obj), TYPE_TRICORE_CPU)
-#define TRICORE_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(TriCoreCPUClass, (obj), TYPE_TRICORE_CPU)
+DECLARE_OBJ_CHECKERS(TriCoreCPU, TriCoreCPUClass,
+                     TRICORE_CPU, TYPE_TRICORE_CPU)
 
 struct TriCoreCPUClass {
     /*< private >*/
diff --git a/target/unicore32/cpu-qom.h b/target/unicore32/cpu-qom.h
index 6a1cb1c82d..5b67ac532d 100644
--- a/target/unicore32/cpu-qom.h
+++ b/target/unicore32/cpu-qom.h
@@ -18,12 +18,8 @@
 
 typedef struct UniCore32CPU UniCore32CPU;
 typedef struct UniCore32CPUClass UniCore32CPUClass;
-#define UNICORE32_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(UniCore32CPUClass, (klass), TYPE_UNICORE32_CPU)
-#define UNICORE32_CPU(obj) \
-    OBJECT_CHECK(UniCore32CPU, (obj), TYPE_UNICORE32_CPU)
-#define UNICORE32_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(UniCore32CPUClass, (obj), TYPE_UNICORE32_CPU)
+DECLARE_OBJ_CHECKERS(UniCore32CPU, UniCore32CPUClass,
+                     UNICORE32_CPU, TYPE_UNICORE32_CPU)
 
 /**
  * UniCore32CPUClass:
diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
index cd9f31dc84..ef13262b42 100644
--- a/target/xtensa/cpu-qom.h
+++ b/target/xtensa/cpu-qom.h
@@ -36,12 +36,8 @@
 
 typedef struct XtensaCPU XtensaCPU;
 typedef struct XtensaCPUClass XtensaCPUClass;
-#define XTENSA_CPU_CLASS(class) \
-    OBJECT_CLASS_CHECK(XtensaCPUClass, (class), TYPE_XTENSA_CPU)
-#define XTENSA_CPU(obj) \
-    OBJECT_CHECK(XtensaCPU, (obj), TYPE_XTENSA_CPU)
-#define XTENSA_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(XtensaCPUClass, (obj), TYPE_XTENSA_CPU)
+DECLARE_OBJ_CHECKERS(XtensaCPU, XtensaCPUClass,
+                     XTENSA_CPU, TYPE_XTENSA_CPU)
 
 typedef struct XtensaConfig XtensaConfig;
 
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 7dba29cc48..7098ad96c3 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -46,8 +46,8 @@ typedef struct TCGState TCGState;
 
 #define TYPE_TCG_ACCEL ACCEL_CLASS_NAME("tcg")
 
-#define TCG_STATE(obj) \
-        OBJECT_CHECK(TCGState, (obj), TYPE_TCG_ACCEL)
+DECLARE_INSTANCE_CHECKER(TCGState, TCG_STATE,
+                         TYPE_TCG_ACCEL)
 
 /* mask must never be zero, except for A20 change call */
 static void tcg_handle_interrupt(CPUState *cpu, int mask)
diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index 84bd84efe7..f047ad0362 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -37,9 +37,8 @@
 
 typedef struct CryptoDevBackendBuiltin
                          CryptoDevBackendBuiltin;
-#define CRYPTODEV_BACKEND_BUILTIN(obj) \
-    OBJECT_CHECK(CryptoDevBackendBuiltin, \
-                 (obj), TYPE_CRYPTODEV_BACKEND_BUILTIN)
+DECLARE_INSTANCE_CHECKER(CryptoDevBackendBuiltin, CRYPTODEV_BACKEND_BUILTIN,
+                         TYPE_CRYPTODEV_BACKEND_BUILTIN)
 
 
 typedef struct CryptoDevBackendBuiltinSession {
diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-user.c
index 5e903f6507..41089dede1 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -40,9 +40,8 @@
 #define TYPE_CRYPTODEV_BACKEND_VHOST_USER "cryptodev-vhost-user"
 
 typedef struct CryptoDevBackendVhostUser CryptoDevBackendVhostUser;
-#define CRYPTODEV_BACKEND_VHOST_USER(obj) \
-    OBJECT_CHECK(CryptoDevBackendVhostUser, \
-                 (obj), TYPE_CRYPTODEV_BACKEND_VHOST_USER)
+DECLARE_INSTANCE_CHECKER(CryptoDevBackendVhostUser, CRYPTODEV_BACKEND_VHOST_USER,
+                         TYPE_CRYPTODEV_BACKEND_VHOST_USER)
 
 
 struct CryptoDevBackendVhostUser {
diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index 0473c5c335..bfbd4f09f1 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -25,12 +25,8 @@ typedef struct DBusVMState DBusVMState;
 typedef struct DBusVMStateClass DBusVMStateClass;
 
 #define TYPE_DBUS_VMSTATE "dbus-vmstate"
-#define DBUS_VMSTATE(obj)                                \
-    OBJECT_CHECK(DBusVMState, (obj), TYPE_DBUS_VMSTATE)
-#define DBUS_VMSTATE_GET_CLASS(obj)                              \
-    OBJECT_GET_CLASS(DBusVMStateClass, (obj), TYPE_DBUS_VMSTATE)
-#define DBUS_VMSTATE_CLASS(klass)                                    \
-    OBJECT_CLASS_CHECK(DBusVMStateClass, (klass), TYPE_DBUS_VMSTATE)
+DECLARE_OBJ_CHECKERS(DBusVMState, DBusVMStateClass,
+                     DBUS_VMSTATE, TYPE_DBUS_VMSTATE)
 
 struct DBusVMStateClass {
     ObjectClass parent_class;
diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 2c3bcb8291..a3b2e8209e 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -20,8 +20,8 @@
 #include "qom/object.h"
 
 typedef struct HostMemoryBackendFile HostMemoryBackendFile;
-#define MEMORY_BACKEND_FILE(obj) \
-    OBJECT_CHECK(HostMemoryBackendFile, (obj), TYPE_MEMORY_BACKEND_FILE)
+DECLARE_INSTANCE_CHECKER(HostMemoryBackendFile, MEMORY_BACKEND_FILE,
+                         TYPE_MEMORY_BACKEND_FILE)
 
 
 struct HostMemoryBackendFile {
diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 45114bd641..8cf6bcbda2 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -22,8 +22,8 @@
 #define TYPE_MEMORY_BACKEND_MEMFD "memory-backend-memfd"
 
 typedef struct HostMemoryBackendMemfd HostMemoryBackendMemfd;
-#define MEMORY_BACKEND_MEMFD(obj)                                        \
-    OBJECT_CHECK(HostMemoryBackendMemfd, (obj), TYPE_MEMORY_BACKEND_MEMFD)
+DECLARE_INSTANCE_CHECKER(HostMemoryBackendMemfd, MEMORY_BACKEND_MEMFD,
+                         TYPE_MEMORY_BACKEND_MEMFD)
 
 
 struct HostMemoryBackendMemfd {
diff --git a/backends/rng-builtin.c b/backends/rng-builtin.c
index 4bf073c963..459be97a5a 100644
--- a/backends/rng-builtin.c
+++ b/backends/rng-builtin.c
@@ -12,7 +12,8 @@
 #include "qom/object.h"
 
 typedef struct RngBuiltin RngBuiltin;
-#define RNG_BUILTIN(obj) OBJECT_CHECK(RngBuiltin, (obj), TYPE_RNG_BUILTIN)
+DECLARE_INSTANCE_CHECKER(RngBuiltin, RNG_BUILTIN,
+                         TYPE_RNG_BUILTIN)
 
 struct RngBuiltin {
     RngBackend parent;
diff --git a/backends/rng-egd.c b/backends/rng-egd.c
index ee1854f31c..d905fe657c 100644
--- a/backends/rng-egd.c
+++ b/backends/rng-egd.c
@@ -20,7 +20,8 @@
 
 #define TYPE_RNG_EGD "rng-egd"
 typedef struct RngEgd RngEgd;
-#define RNG_EGD(obj) OBJECT_CHECK(RngEgd, (obj), TYPE_RNG_EGD)
+DECLARE_INSTANCE_CHECKER(RngEgd, RNG_EGD,
+                         TYPE_RNG_EGD)
 
 struct RngEgd {
     RngBackend parent;
diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 2509c8d327..13657d9aba 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -46,8 +46,8 @@
 
 #define TYPE_TPM_EMULATOR "tpm-emulator"
 typedef struct TPMEmulator TPMEmulator;
-#define TPM_EMULATOR(obj) \
-    OBJECT_CHECK(TPMEmulator, (obj), TYPE_TPM_EMULATOR)
+DECLARE_INSTANCE_CHECKER(TPMEmulator, TPM_EMULATOR,
+                         TYPE_TPM_EMULATOR)
 
 #define TPM_EMULATOR_IMPLEMENTS_ALL_CAPS(S, cap) (((S)->caps & (cap)) == (cap))
 
diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.c
index b703f7e412..10722e0a41 100644
--- a/backends/tpm/tpm_passthrough.c
+++ b/backends/tpm/tpm_passthrough.c
@@ -37,8 +37,8 @@
 
 #define TYPE_TPM_PASSTHROUGH "tpm-passthrough"
 typedef struct TPMPassthruState TPMPassthruState;
-#define TPM_PASSTHROUGH(obj) \
-    OBJECT_CHECK(TPMPassthruState, (obj), TYPE_TPM_PASSTHROUGH)
+DECLARE_INSTANCE_CHECKER(TPMPassthruState, TPM_PASSTHROUGH,
+                         TYPE_TPM_PASSTHROUGH)
 
 /* data structures */
 struct TPMPassthruState {
diff --git a/chardev/baum.c b/chardev/baum.c
index cb906060d9..5deca778bc 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -105,7 +105,8 @@ struct BaumChardev {
 typedef struct BaumChardev BaumChardev;
 
 #define TYPE_CHARDEV_BRAILLE "chardev-braille"
-#define BAUM_CHARDEV(obj) OBJECT_CHECK(BaumChardev, (obj), TYPE_CHARDEV_BRAILLE)
+DECLARE_INSTANCE_CHECKER(BaumChardev, BAUM_CHARDEV,
+                         TYPE_CHARDEV_BRAILLE)
 
 /* Let's assume NABCC by default */
 enum way {
diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index bebe050705..66e4589b2b 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -57,8 +57,8 @@ struct ParallelChardev {
 };
 typedef struct ParallelChardev ParallelChardev;
 
-#define PARALLEL_CHARDEV(obj) \
-    OBJECT_CHECK(ParallelChardev, (obj), TYPE_CHARDEV_PARALLEL)
+DECLARE_INSTANCE_CHECKER(ParallelChardev, PARALLEL_CHARDEV,
+                         TYPE_CHARDEV_PARALLEL)
 
 static int pp_hw_mode(ParallelChardev *s, uint16_t mode)
 {
@@ -185,8 +185,6 @@ struct ParallelChardev {
 };
 typedef struct ParallelChardev ParallelChardev;
 
-#define PARALLEL_CHARDEV(obj)                                   \
-    OBJECT_CHECK(ParallelChardev, (obj), TYPE_CHARDEV_PARALLEL)
 
 static int pp_ioctl(Chardev *chr, int cmd, void *arg)
 {
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index 963fe4f0ca..a2d1e7c985 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -45,7 +45,8 @@ struct PtyChardev {
 };
 typedef struct PtyChardev PtyChardev;
 
-#define PTY_CHARDEV(obj) OBJECT_CHECK(PtyChardev, (obj), TYPE_CHARDEV_PTY)
+DECLARE_INSTANCE_CHECKER(PtyChardev, PTY_CHARDEV,
+                         TYPE_CHARDEV_PTY)
 
 static void pty_chr_state(Chardev *chr, int connected);
 
diff --git a/chardev/char-ringbuf.c b/chardev/char-ringbuf.c
index 301a5d8634..d40d21d3cf 100644
--- a/chardev/char-ringbuf.c
+++ b/chardev/char-ringbuf.c
@@ -42,8 +42,8 @@ struct RingBufChardev {
 };
 typedef struct RingBufChardev RingBufChardev;
 
-#define RINGBUF_CHARDEV(obj)                                    \
-    OBJECT_CHECK(RingBufChardev, (obj), TYPE_CHARDEV_RINGBUF)
+DECLARE_INSTANCE_CHECKER(RingBufChardev, RINGBUF_CHARDEV,
+                         TYPE_CHARDEV_RINGBUF)
 
 static size_t ringbuf_count(const Chardev *chr)
 {
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 9435b7d643..95e45812d5 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -88,8 +88,8 @@ struct SocketChardev {
 };
 typedef struct SocketChardev SocketChardev;
 
-#define SOCKET_CHARDEV(obj)                                     \
-    OBJECT_CHECK(SocketChardev, (obj), TYPE_CHARDEV_SOCKET)
+DECLARE_INSTANCE_CHECKER(SocketChardev, SOCKET_CHARDEV,
+                         TYPE_CHARDEV_SOCKET)
 
 static gboolean socket_reconnect_timeout(gpointer opaque);
 static void tcp_chr_telnet_init(Chardev *chr);
diff --git a/chardev/char-udp.c b/chardev/char-udp.c
index 58be3487e6..16b5dbce58 100644
--- a/chardev/char-udp.c
+++ b/chardev/char-udp.c
@@ -45,7 +45,8 @@ struct UdpChardev {
 };
 typedef struct UdpChardev UdpChardev;
 
-#define UDP_CHARDEV(obj) OBJECT_CHECK(UdpChardev, (obj), TYPE_CHARDEV_UDP)
+DECLARE_INSTANCE_CHECKER(UdpChardev, UDP_CHARDEV,
+                         TYPE_CHARDEV_UDP)
 
 /* Called with chr_write_lock held.  */
 static int udp_chr_write(Chardev *chr, const uint8_t *buf, int len)
diff --git a/chardev/char-win-stdio.c b/chardev/char-win-stdio.c
index 980e0d1356..a4771ab82e 100644
--- a/chardev/char-win-stdio.c
+++ b/chardev/char-win-stdio.c
@@ -40,8 +40,8 @@ struct WinStdioChardev {
 };
 typedef struct WinStdioChardev WinStdioChardev;
 
-#define WIN_STDIO_CHARDEV(obj)                                          \
-    OBJECT_CHECK(WinStdioChardev, (obj), TYPE_CHARDEV_WIN_STDIO)
+DECLARE_INSTANCE_CHECKER(WinStdioChardev, WIN_STDIO_CHARDEV,
+                         TYPE_CHARDEV_WIN_STDIO)
 
 static void win_stdio_wait_func(void *opaque)
 {
diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index 0a7926697c..eb9231dcdb 100644
--- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -45,8 +45,8 @@ struct MouseChardev {
 typedef struct MouseChardev MouseChardev;
 
 #define TYPE_CHARDEV_MSMOUSE "chardev-msmouse"
-#define MOUSE_CHARDEV(obj)                                      \
-    OBJECT_CHECK(MouseChardev, (obj), TYPE_CHARDEV_MSMOUSE)
+DECLARE_INSTANCE_CHECKER(MouseChardev, MOUSE_CHARDEV,
+                         TYPE_CHARDEV_MSMOUSE)
 
 static void msmouse_chr_accept_input(Chardev *chr)
 {
diff --git a/chardev/testdev.c b/chardev/testdev.c
index bbae59c941..a92caca3c3 100644
--- a/chardev/testdev.c
+++ b/chardev/testdev.c
@@ -40,8 +40,8 @@ struct TestdevChardev {
 typedef struct TestdevChardev TestdevChardev;
 
 #define TYPE_CHARDEV_TESTDEV "chardev-testdev"
-#define TESTDEV_CHARDEV(obj)                                    \
-    OBJECT_CHECK(TestdevChardev, (obj), TYPE_CHARDEV_TESTDEV)
+DECLARE_INSTANCE_CHECKER(TestdevChardev, TESTDEV_CHARDEV,
+                         TYPE_CHARDEV_TESTDEV)
 
 /* Try to interpret a whole incoming packet */
 static int testdev_eat_packet(TestdevChardev *testdev)
diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index 361a12fdd4..95e005f5a5 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -86,8 +86,8 @@ struct TabletChardev {
 typedef struct TabletChardev TabletChardev;
 
 #define TYPE_CHARDEV_WCTABLET "chardev-wctablet"
-#define WCTABLET_CHARDEV(obj)                                      \
-    OBJECT_CHECK(TabletChardev, (obj), TYPE_CHARDEV_WCTABLET)
+DECLARE_INSTANCE_CHECKER(TabletChardev, WCTABLET_CHARDEV,
+                         TYPE_CHARDEV_WCTABLET)
 
 
 static void wctablet_chr_accept_input(Chardev *chr);
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index ba39184650..1574f7db3e 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -93,8 +93,8 @@ struct PIIX4PMState {
 };
 typedef struct PIIX4PMState PIIX4PMState;
 
-#define PIIX4_PM(obj) \
-    OBJECT_CHECK(PIIX4PMState, (obj), TYPE_PIIX4_PM)
+DECLARE_INSTANCE_CHECKER(PIIX4PMState, PIIX4_PM,
+                         TYPE_PIIX4_PM)
 
 static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
                                            PCIBus *bus, PIIX4PMState *s);
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index bd484e42bd..d02b14d89f 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -51,8 +51,8 @@ typedef struct TyphoonPchip {
 } TyphoonPchip;
 
 typedef struct TyphoonState TyphoonState;
-#define TYPHOON_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(TyphoonState, (obj), TYPE_TYPHOON_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(TyphoonState, TYPHOON_PCI_HOST_BRIDGE,
+                         TYPE_TYPHOON_PCI_HOST_BRIDGE)
 
 struct TyphoonState {
     PCIHostState parent_obj;
diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 82ffc82dc7..a49f4a1c7c 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -28,8 +28,8 @@ struct CollieMachineState {
 typedef struct CollieMachineState CollieMachineState;
 
 #define TYPE_COLLIE_MACHINE MACHINE_TYPE_NAME("collie")
-#define COLLIE_MACHINE(obj) \
-    OBJECT_CHECK(CollieMachineState, obj, TYPE_COLLIE_MACHINE)
+DECLARE_INSTANCE_CHECKER(CollieMachineState, COLLIE_MACHINE,
+                         TYPE_COLLIE_MACHINE)
 
 static struct arm_boot_info collie_binfo = {
     .loader_start = SA_SDCS0,
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index cbf6e72ad6..e2ace803ef 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -157,8 +157,8 @@ static const MemoryRegionOps hb_mem_ops = {
 
 #define TYPE_HIGHBANK_REGISTERS "highbank-regs"
 typedef struct HighbankRegsState HighbankRegsState;
-#define HIGHBANK_REGISTERS(obj) \
-    OBJECT_CHECK(HighbankRegsState, (obj), TYPE_HIGHBANK_REGISTERS)
+DECLARE_INSTANCE_CHECKER(HighbankRegsState, HIGHBANK_REGISTERS,
+                         TYPE_HIGHBANK_REGISTERS)
 
 struct HighbankRegsState {
     /*< private >*/
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index e94f711e89..9a4a3d357a 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -30,8 +30,8 @@ typedef struct MicrobitMachineState MicrobitMachineState;
 
 #define TYPE_MICROBIT_MACHINE MACHINE_TYPE_NAME("microbit")
 
-#define MICROBIT_MACHINE(obj) \
-    OBJECT_CHECK(MicrobitMachineState, obj, TYPE_MICROBIT_MACHINE)
+DECLARE_INSTANCE_CHECKER(MicrobitMachineState, MICROBIT_MACHINE,
+                         TYPE_MICROBIT_MACHINE)
 
 static void microbit_init(MachineState *machine)
 {
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 8870aea814..dbf7d63dc8 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -108,12 +108,8 @@ typedef struct MPS2TZMachineState MPS2TZMachineState;
 #define TYPE_MPS2TZ_AN505_MACHINE MACHINE_TYPE_NAME("mps2-an505")
 #define TYPE_MPS2TZ_AN521_MACHINE MACHINE_TYPE_NAME("mps2-an521")
 
-#define MPS2TZ_MACHINE(obj) \
-    OBJECT_CHECK(MPS2TZMachineState, obj, TYPE_MPS2TZ_MACHINE)
-#define MPS2TZ_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(MPS2TZMachineClass, obj, TYPE_MPS2TZ_MACHINE)
-#define MPS2TZ_MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(MPS2TZMachineClass, klass, TYPE_MPS2TZ_MACHINE)
+DECLARE_OBJ_CHECKERS(MPS2TZMachineState, MPS2TZMachineClass,
+                     MPS2TZ_MACHINE, TYPE_MPS2TZ_MACHINE)
 
 /* Main SYSCLK frequency in Hz */
 #define SYSCLK_FRQ 20000000
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index b5173e398d..4ee5c38459 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -84,12 +84,8 @@ typedef struct MPS2MachineState MPS2MachineState;
 #define TYPE_MPS2_AN385_MACHINE MACHINE_TYPE_NAME("mps2-an385")
 #define TYPE_MPS2_AN511_MACHINE MACHINE_TYPE_NAME("mps2-an511")
 
-#define MPS2_MACHINE(obj)                                       \
-    OBJECT_CHECK(MPS2MachineState, obj, TYPE_MPS2_MACHINE)
-#define MPS2_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(MPS2MachineClass, obj, TYPE_MPS2_MACHINE)
-#define MPS2_MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(MPS2MachineClass, klass, TYPE_MPS2_MACHINE)
+DECLARE_OBJ_CHECKERS(MPS2MachineState, MPS2MachineClass,
+                     MPS2_MACHINE, TYPE_MPS2_MACHINE)
 
 /* Main SYSCLK frequency in Hz */
 #define SYSCLK_FRQ 25000000
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 7fd8634ac5..16015255c8 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -90,12 +90,8 @@ typedef struct MuscaMachineState MuscaMachineState;
 #define TYPE_MUSCA_A_MACHINE MACHINE_TYPE_NAME("musca-a")
 #define TYPE_MUSCA_B1_MACHINE MACHINE_TYPE_NAME("musca-b1")
 
-#define MUSCA_MACHINE(obj) \
-    OBJECT_CHECK(MuscaMachineState, obj, TYPE_MUSCA_MACHINE)
-#define MUSCA_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(MuscaMachineClass, obj, TYPE_MUSCA_MACHINE)
-#define MUSCA_MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(MuscaMachineClass, klass, TYPE_MUSCA_MACHINE)
+DECLARE_OBJ_CHECKERS(MuscaMachineState, MuscaMachineClass,
+                     MUSCA_MACHINE, TYPE_MUSCA_MACHINE)
 
 /*
  * Main SYSCLK frequency in Hz
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 695699e01e..2117a04171 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -156,8 +156,8 @@ typedef struct mv88w8618_rx_desc {
 
 #define TYPE_MV88W8618_ETH "mv88w8618_eth"
 typedef struct mv88w8618_eth_state mv88w8618_eth_state;
-#define MV88W8618_ETH(obj) \
-    OBJECT_CHECK(mv88w8618_eth_state, (obj), TYPE_MV88W8618_ETH)
+DECLARE_INSTANCE_CHECKER(mv88w8618_eth_state, MV88W8618_ETH,
+                         TYPE_MV88W8618_ETH)
 
 struct mv88w8618_eth_state {
     /*< private >*/
@@ -486,8 +486,8 @@ static const TypeInfo mv88w8618_eth_info = {
 
 #define TYPE_MUSICPAL_LCD "musicpal_lcd"
 typedef struct musicpal_lcd_state musicpal_lcd_state;
-#define MUSICPAL_LCD(obj) \
-    OBJECT_CHECK(musicpal_lcd_state, (obj), TYPE_MUSICPAL_LCD)
+DECLARE_INSTANCE_CHECKER(musicpal_lcd_state, MUSICPAL_LCD,
+                         TYPE_MUSICPAL_LCD)
 
 struct musicpal_lcd_state {
     /*< private >*/
@@ -704,8 +704,8 @@ static const TypeInfo musicpal_lcd_info = {
 
 #define TYPE_MV88W8618_PIC "mv88w8618_pic"
 typedef struct mv88w8618_pic_state mv88w8618_pic_state;
-#define MV88W8618_PIC(obj) \
-    OBJECT_CHECK(mv88w8618_pic_state, (obj), TYPE_MV88W8618_PIC)
+DECLARE_INSTANCE_CHECKER(mv88w8618_pic_state, MV88W8618_PIC,
+                         TYPE_MV88W8618_PIC)
 
 struct mv88w8618_pic_state {
     /*< private >*/
@@ -842,8 +842,8 @@ typedef struct mv88w8618_timer_state {
 
 #define TYPE_MV88W8618_PIT "mv88w8618_pit"
 typedef struct mv88w8618_pit_state mv88w8618_pit_state;
-#define MV88W8618_PIT(obj) \
-    OBJECT_CHECK(mv88w8618_pit_state, (obj), TYPE_MV88W8618_PIT)
+DECLARE_INSTANCE_CHECKER(mv88w8618_pit_state, MV88W8618_PIT,
+                         TYPE_MV88W8618_PIT)
 
 struct mv88w8618_pit_state {
     /*< private >*/
@@ -1010,8 +1010,8 @@ static const TypeInfo mv88w8618_pit_info = {
 
 #define TYPE_MV88W8618_FLASHCFG "mv88w8618_flashcfg"
 typedef struct mv88w8618_flashcfg_state mv88w8618_flashcfg_state;
-#define MV88W8618_FLASHCFG(obj) \
-    OBJECT_CHECK(mv88w8618_flashcfg_state, (obj), TYPE_MV88W8618_FLASHCFG)
+DECLARE_INSTANCE_CHECKER(mv88w8618_flashcfg_state, MV88W8618_FLASHCFG,
+                         TYPE_MV88W8618_FLASHCFG)
 
 struct mv88w8618_flashcfg_state {
     /*< private >*/
@@ -1103,8 +1103,8 @@ struct MusicPalMiscState {
 typedef struct MusicPalMiscState MusicPalMiscState;
 
 #define TYPE_MUSICPAL_MISC "musicpal-misc"
-#define MUSICPAL_MISC(obj) \
-     OBJECT_CHECK(MusicPalMiscState, (obj), TYPE_MUSICPAL_MISC)
+DECLARE_INSTANCE_CHECKER(MusicPalMiscState, MUSICPAL_MISC,
+                         TYPE_MUSICPAL_MISC)
 
 static uint64_t musicpal_misc_read(void *opaque, hwaddr offset,
                                    unsigned size)
@@ -1210,8 +1210,8 @@ static void mv88w8618_wlan_realize(DeviceState *dev, Error **errp)
 
 #define TYPE_MUSICPAL_GPIO "musicpal_gpio"
 typedef struct musicpal_gpio_state musicpal_gpio_state;
-#define MUSICPAL_GPIO(obj) \
-    OBJECT_CHECK(musicpal_gpio_state, (obj), TYPE_MUSICPAL_GPIO)
+DECLARE_INSTANCE_CHECKER(musicpal_gpio_state, MUSICPAL_GPIO,
+                         TYPE_MUSICPAL_GPIO)
 
 struct musicpal_gpio_state {
     /*< private >*/
@@ -1461,8 +1461,8 @@ static const TypeInfo musicpal_gpio_info = {
 
 #define TYPE_MUSICPAL_KEY "musicpal_key"
 typedef struct musicpal_key_state musicpal_key_state;
-#define MUSICPAL_KEY(obj) \
-    OBJECT_CHECK(musicpal_key_state, (obj), TYPE_MUSICPAL_KEY)
+DECLARE_INSTANCE_CHECKER(musicpal_key_state, MUSICPAL_KEY,
+                         TYPE_MUSICPAL_KEY)
 
 struct musicpal_key_state {
     /*< private >*/
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index ddabb0e2d6..abc6495489 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -134,8 +134,8 @@ static void palmte_button_event(void *opaque, int keycode)
 
 #define TYPE_PALM_MISC_GPIO "palm-misc-gpio"
 typedef struct PalmMiscGPIOState PalmMiscGPIOState;
-#define PALM_MISC_GPIO(obj) \
-    OBJECT_CHECK(PalmMiscGPIOState, (obj), TYPE_PALM_MISC_GPIO)
+DECLARE_INSTANCE_CHECKER(PalmMiscGPIOState, PALM_MISC_GPIO,
+                         TYPE_PALM_MISC_GPIO)
 
 struct PalmMiscGPIOState {
     SysBusDevice parent_obj;
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index a48a32ee09..701baa84ca 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -471,8 +471,8 @@ static const VMStateDescription vmstate_pxa2xx_mm = {
 
 #define TYPE_PXA2XX_SSP "pxa2xx-ssp"
 typedef struct PXA2xxSSPState PXA2xxSSPState;
-#define PXA2XX_SSP(obj) \
-    OBJECT_CHECK(PXA2xxSSPState, (obj), TYPE_PXA2XX_SSP)
+DECLARE_INSTANCE_CHECKER(PXA2xxSSPState, PXA2XX_SSP,
+                         TYPE_PXA2XX_SSP)
 
 /* Synchronous Serial Ports */
 struct PXA2xxSSPState {
@@ -812,8 +812,8 @@ static void pxa2xx_ssp_init(Object *obj)
 
 #define TYPE_PXA2XX_RTC "pxa2xx_rtc"
 typedef struct PXA2xxRTCState PXA2xxRTCState;
-#define PXA2XX_RTC(obj) \
-    OBJECT_CHECK(PXA2xxRTCState, (obj), TYPE_PXA2XX_RTC)
+DECLARE_INSTANCE_CHECKER(PXA2xxRTCState, PXA2XX_RTC,
+                         TYPE_PXA2XX_RTC)
 
 struct PXA2xxRTCState {
     /*< private >*/
@@ -1246,8 +1246,8 @@ static const TypeInfo pxa2xx_rtc_sysbus_info = {
 
 #define TYPE_PXA2XX_I2C_SLAVE "pxa2xx-i2c-slave"
 typedef struct PXA2xxI2CSlaveState PXA2xxI2CSlaveState;
-#define PXA2XX_I2C_SLAVE(obj) \
-    OBJECT_CHECK(PXA2xxI2CSlaveState, (obj), TYPE_PXA2XX_I2C_SLAVE)
+DECLARE_INSTANCE_CHECKER(PXA2xxI2CSlaveState, PXA2XX_I2C_SLAVE,
+                         TYPE_PXA2XX_I2C_SLAVE)
 
 struct PXA2xxI2CSlaveState {
     I2CSlave parent_obj;
diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
index 2cd6dd929e..16bbe4fb70 100644
--- a/hw/arm/pxa2xx_gpio.c
+++ b/hw/arm/pxa2xx_gpio.c
@@ -23,8 +23,8 @@
 
 #define TYPE_PXA2XX_GPIO "pxa2xx-gpio"
 typedef struct PXA2xxGPIOInfo PXA2xxGPIOInfo;
-#define PXA2XX_GPIO(obj) \
-    OBJECT_CHECK(PXA2xxGPIOInfo, (obj), TYPE_PXA2XX_GPIO)
+DECLARE_INSTANCE_CHECKER(PXA2xxGPIOInfo, PXA2XX_GPIO,
+                         TYPE_PXA2XX_GPIO)
 
 struct PXA2xxGPIOInfo {
     /*< private >*/
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 00e72fde4e..cb52a9dff3 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -39,8 +39,8 @@
 
 #define TYPE_PXA2XX_PIC "pxa2xx_pic"
 typedef struct PXA2xxPICState PXA2xxPICState;
-#define PXA2XX_PIC(obj) \
-    OBJECT_CHECK(PXA2xxPICState, (obj), TYPE_PXA2XX_PIC)
+DECLARE_INSTANCE_CHECKER(PXA2xxPICState, PXA2XX_PIC,
+                         TYPE_PXA2XX_PIC)
 
 struct PXA2xxPICState {
     /*< private >*/
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index d9f7eeb06b..d2f674587d 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -53,13 +53,9 @@ struct RaspiMachineClass {
 typedef struct RaspiMachineClass RaspiMachineClass;
 
 #define TYPE_RASPI_MACHINE       MACHINE_TYPE_NAME("raspi-common")
-#define RASPI_MACHINE(obj) \
-    OBJECT_CHECK(RaspiMachineState, (obj), TYPE_RASPI_MACHINE)
+DECLARE_OBJ_CHECKERS(RaspiMachineState, RaspiMachineClass,
+                     RASPI_MACHINE, TYPE_RASPI_MACHINE)
 
-#define RASPI_MACHINE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(RaspiMachineClass, (klass), TYPE_RASPI_MACHINE)
-#define RASPI_MACHINE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(RaspiMachineClass, (obj), TYPE_RASPI_MACHINE)
 
 /*
  * Board revision codes:
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index a650609a5d..1fcd4de049 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -97,8 +97,8 @@ struct SBSAMachineState {
 typedef struct SBSAMachineState SBSAMachineState;
 
 #define TYPE_SBSA_MACHINE   MACHINE_TYPE_NAME("sbsa-ref")
-#define SBSA_MACHINE(obj) \
-    OBJECT_CHECK(SBSAMachineState, (obj), TYPE_SBSA_MACHINE)
+DECLARE_INSTANCE_CHECKER(SBSAMachineState, SBSA_MACHINE,
+                         TYPE_SBSA_MACHINE)
 
 static const MemMapEntry sbsa_ref_memmap[] = {
     /* 512M boot ROM */
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 0bf5745eb2..a7ad667f06 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -59,12 +59,8 @@ struct SpitzMachineState {
 typedef struct SpitzMachineState SpitzMachineState;
 
 #define TYPE_SPITZ_MACHINE "spitz-common"
-#define SPITZ_MACHINE(obj) \
-    OBJECT_CHECK(SpitzMachineState, obj, TYPE_SPITZ_MACHINE)
-#define SPITZ_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(SpitzMachineClass, obj, TYPE_SPITZ_MACHINE)
-#define SPITZ_MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(SpitzMachineClass, klass, TYPE_SPITZ_MACHINE)
+DECLARE_OBJ_CHECKERS(SpitzMachineState, SpitzMachineClass,
+                     SPITZ_MACHINE, TYPE_SPITZ_MACHINE)
 
 #define zaurus_printf(format, ...)                              \
     fprintf(stderr, "%s: " format, __func__, ##__VA_ARGS__)
@@ -89,7 +85,8 @@ typedef struct SpitzMachineState SpitzMachineState;
 
 #define TYPE_SL_NAND "sl-nand"
 typedef struct SLNANDState SLNANDState;
-#define SL_NAND(obj) OBJECT_CHECK(SLNANDState, (obj), TYPE_SL_NAND)
+DECLARE_INSTANCE_CHECKER(SLNANDState, SL_NAND,
+                         TYPE_SL_NAND)
 
 struct SLNANDState {
     SysBusDevice parent_obj;
@@ -266,8 +263,8 @@ static const int spitz_gpiomap[5] = {
 
 #define TYPE_SPITZ_KEYBOARD "spitz-keyboard"
 typedef struct SpitzKeyboardState SpitzKeyboardState;
-#define SPITZ_KEYBOARD(obj) \
-    OBJECT_CHECK(SpitzKeyboardState, (obj), TYPE_SPITZ_KEYBOARD)
+DECLARE_INSTANCE_CHECKER(SpitzKeyboardState, SPITZ_KEYBOARD,
+                         TYPE_SPITZ_KEYBOARD)
 
 struct SpitzKeyboardState {
     SysBusDevice parent_obj;
@@ -586,7 +583,8 @@ static void spitz_keyboard_realize(DeviceState *dev, Error **errp)
 
 #define TYPE_SPITZ_LCDTG "spitz-lcdtg"
 typedef struct SpitzLCDTG SpitzLCDTG;
-#define SPITZ_LCDTG(obj) OBJECT_CHECK(SpitzLCDTG, (obj), TYPE_SPITZ_LCDTG)
+DECLARE_INSTANCE_CHECKER(SpitzLCDTG, SPITZ_LCDTG,
+                         TYPE_SPITZ_LCDTG)
 
 struct SpitzLCDTG {
     SSISlave ssidev;
@@ -675,7 +673,8 @@ static void spitz_lcdtg_realize(SSISlave *ssi, Error **errp)
 
 #define TYPE_CORGI_SSP "corgi-ssp"
 typedef struct CorgiSSPState CorgiSSPState;
-#define CORGI_SSP(obj) OBJECT_CHECK(CorgiSSPState, (obj), TYPE_CORGI_SSP)
+DECLARE_INSTANCE_CHECKER(CorgiSSPState, CORGI_SSP,
+                         TYPE_CORGI_SSP)
 
 /* "Demux" the signal based on current chipselect */
 struct CorgiSSPState {
@@ -827,8 +826,8 @@ static void spitz_akita_i2c_setup(PXA2xxState *cpu)
  */
 #define TYPE_SPITZ_MISC_GPIO "spitz-misc-gpio"
 typedef struct SpitzMiscGPIOState SpitzMiscGPIOState;
-#define SPITZ_MISC_GPIO(obj) \
-    OBJECT_CHECK(SpitzMiscGPIOState, (obj), TYPE_SPITZ_MISC_GPIO)
+DECLARE_INSTANCE_CHECKER(SpitzMiscGPIOState, SPITZ_MISC_GPIO,
+                         TYPE_SPITZ_MISC_GPIO)
 
 struct SpitzMiscGPIOState {
     SysBusDevice parent_obj;
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index d8d7d3a43b..d6fc4a4681 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -59,8 +59,8 @@ typedef const struct {
 
 #define TYPE_STELLARIS_GPTM "stellaris-gptm"
 typedef struct gptm_state gptm_state;
-#define STELLARIS_GPTM(obj) \
-    OBJECT_CHECK(gptm_state, (obj), TYPE_STELLARIS_GPTM)
+DECLARE_INSTANCE_CHECKER(gptm_state, STELLARIS_GPTM,
+                         TYPE_STELLARIS_GPTM)
 
 struct gptm_state {
     SysBusDevice parent_obj;
@@ -722,8 +722,8 @@ static int stellaris_sys_init(uint32_t base, qemu_irq irq,
 
 #define TYPE_STELLARIS_I2C "stellaris-i2c"
 typedef struct stellaris_i2c_state stellaris_i2c_state;
-#define STELLARIS_I2C(obj) \
-    OBJECT_CHECK(stellaris_i2c_state, (obj), TYPE_STELLARIS_I2C)
+DECLARE_INSTANCE_CHECKER(stellaris_i2c_state, STELLARIS_I2C,
+                         TYPE_STELLARIS_I2C)
 
 struct stellaris_i2c_state {
     SysBusDevice parent_obj;
@@ -936,8 +936,8 @@ static void stellaris_i2c_init(Object *obj)
 
 #define TYPE_STELLARIS_ADC "stellaris-adc"
 typedef struct StellarisADCState stellaris_adc_state;
-#define STELLARIS_ADC(obj) \
-    OBJECT_CHECK(stellaris_adc_state, (obj), TYPE_STELLARIS_ADC)
+DECLARE_INSTANCE_CHECKER(stellaris_adc_state, STELLARIS_ADC,
+                         TYPE_STELLARIS_ADC)
 
 struct StellarisADCState {
     SysBusDevice parent_obj;
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 8faeaf8079..0fe829b868 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -86,8 +86,8 @@ static struct {
 
 #define TYPE_STRONGARM_PIC "strongarm_pic"
 typedef struct StrongARMPICState StrongARMPICState;
-#define STRONGARM_PIC(obj) \
-    OBJECT_CHECK(StrongARMPICState, (obj), TYPE_STRONGARM_PIC)
+DECLARE_INSTANCE_CHECKER(StrongARMPICState, STRONGARM_PIC,
+                         TYPE_STRONGARM_PIC)
 
 struct StrongARMPICState {
     SysBusDevice parent_obj;
@@ -255,8 +255,8 @@ static const TypeInfo strongarm_pic_info = {
 
 #define TYPE_STRONGARM_RTC "strongarm-rtc"
 typedef struct StrongARMRTCState StrongARMRTCState;
-#define STRONGARM_RTC(obj) \
-    OBJECT_CHECK(StrongARMRTCState, (obj), TYPE_STRONGARM_RTC)
+DECLARE_INSTANCE_CHECKER(StrongARMRTCState, STRONGARM_RTC,
+                         TYPE_STRONGARM_RTC)
 
 struct StrongARMRTCState {
     SysBusDevice parent_obj;
@@ -482,8 +482,8 @@ static const TypeInfo strongarm_rtc_sysbus_info = {
 
 #define TYPE_STRONGARM_GPIO "strongarm-gpio"
 typedef struct StrongARMGPIOInfo StrongARMGPIOInfo;
-#define STRONGARM_GPIO(obj) \
-    OBJECT_CHECK(StrongARMGPIOInfo, (obj), TYPE_STRONGARM_GPIO)
+DECLARE_INSTANCE_CHECKER(StrongARMGPIOInfo, STRONGARM_GPIO,
+                         TYPE_STRONGARM_GPIO)
 
 struct StrongARMGPIOInfo {
     SysBusDevice busdev;
@@ -721,8 +721,8 @@ static const TypeInfo strongarm_gpio_info = {
 
 #define TYPE_STRONGARM_PPC "strongarm-ppc"
 typedef struct StrongARMPPCInfo StrongARMPPCInfo;
-#define STRONGARM_PPC(obj) \
-    OBJECT_CHECK(StrongARMPPCInfo, (obj), TYPE_STRONGARM_PPC)
+DECLARE_INSTANCE_CHECKER(StrongARMPPCInfo, STRONGARM_PPC,
+                         TYPE_STRONGARM_PPC)
 
 struct StrongARMPPCInfo {
     SysBusDevice parent_obj;
@@ -922,8 +922,8 @@ static const TypeInfo strongarm_ppc_info = {
 
 #define TYPE_STRONGARM_UART "strongarm-uart"
 typedef struct StrongARMUARTState StrongARMUARTState;
-#define STRONGARM_UART(obj) \
-    OBJECT_CHECK(StrongARMUARTState, (obj), TYPE_STRONGARM_UART)
+DECLARE_INSTANCE_CHECKER(StrongARMUARTState, STRONGARM_UART,
+                         TYPE_STRONGARM_UART)
 
 struct StrongARMUARTState {
     SysBusDevice parent_obj;
@@ -1354,8 +1354,8 @@ static const TypeInfo strongarm_uart_info = {
 
 #define TYPE_STRONGARM_SSP "strongarm-ssp"
 typedef struct StrongARMSSPState StrongARMSSPState;
-#define STRONGARM_SSP(obj) \
-    OBJECT_CHECK(StrongARMSSPState, (obj), TYPE_STRONGARM_SSP)
+DECLARE_INSTANCE_CHECKER(StrongARMSSPState, STRONGARM_SSP,
+                         TYPE_STRONGARM_SSP)
 
 struct StrongARMSSPState {
     SysBusDevice parent_obj;
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 6ec83a2e2d..2ef6c7b288 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -76,8 +76,8 @@ static void tosa_microdrive_attach(PXA2xxState *cpu)
 
 #define TYPE_TOSA_MISC_GPIO "tosa-misc-gpio"
 typedef struct TosaMiscGPIOState TosaMiscGPIOState;
-#define TOSA_MISC_GPIO(obj) \
-    OBJECT_CHECK(TosaMiscGPIOState, (obj), TYPE_TOSA_MISC_GPIO)
+DECLARE_INSTANCE_CHECKER(TosaMiscGPIOState, TOSA_MISC_GPIO,
+                         TYPE_TOSA_MISC_GPIO)
 
 struct TosaMiscGPIOState {
     SysBusDevice parent_obj;
@@ -173,7 +173,8 @@ static void tosa_ssp_realize(SSISlave *dev, Error **errp)
 
 #define TYPE_TOSA_DAC "tosa_dac"
 typedef struct TosaDACState TosaDACState;
-#define TOSA_DAC(obj) OBJECT_CHECK(TosaDACState, (obj), TYPE_TOSA_DAC)
+DECLARE_INSTANCE_CHECKER(TosaDACState, TOSA_DAC,
+                         TYPE_TOSA_DAC)
 
 struct TosaDACState {
     I2CSlave parent_obj;
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 4c2c377823..01bb4bba1e 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -183,12 +183,8 @@ typedef struct VexpressMachineState VexpressMachineState;
 #define TYPE_VEXPRESS_MACHINE   "vexpress"
 #define TYPE_VEXPRESS_A9_MACHINE   MACHINE_TYPE_NAME("vexpress-a9")
 #define TYPE_VEXPRESS_A15_MACHINE   MACHINE_TYPE_NAME("vexpress-a15")
-#define VEXPRESS_MACHINE(obj) \
-    OBJECT_CHECK(VexpressMachineState, (obj), TYPE_VEXPRESS_MACHINE)
-#define VEXPRESS_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(VexpressMachineClass, obj, TYPE_VEXPRESS_MACHINE)
-#define VEXPRESS_MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(VexpressMachineClass, klass, TYPE_VEXPRESS_MACHINE)
+DECLARE_OBJ_CHECKERS(VexpressMachineState, VexpressMachineClass,
+                     VEXPRESS_MACHINE, TYPE_VEXPRESS_MACHINE)
 
 typedef void DBoardInitFn(const VexpressMachineState *machine,
                           ram_addr_t ram_size,
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index bce99ef7be..9eb9cea8d4 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -41,8 +41,8 @@
 
 #define TYPE_ZYNQ_MACHINE MACHINE_TYPE_NAME("xilinx-zynq-a9")
 typedef struct ZynqMachineState ZynqMachineState;
-#define ZYNQ_MACHINE(obj) \
-    OBJECT_CHECK(ZynqMachineState, (obj), TYPE_ZYNQ_MACHINE)
+DECLARE_INSTANCE_CHECKER(ZynqMachineState, ZYNQ_MACHINE,
+                         TYPE_ZYNQ_MACHINE)
 
 /* board base frequency: 33.333333 MHz */
 #define PS_CLK_FREQUENCY (100 * 1000 * 1000 / 3)
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index ffa9dd476b..5a01e856fd 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -26,8 +26,8 @@
 
 #define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
 typedef struct VersalVirt VersalVirt;
-#define XLNX_VERSAL_VIRT_MACHINE(obj) \
-    OBJECT_CHECK(VersalVirt, (obj), TYPE_XLNX_VERSAL_VIRT_MACHINE)
+DECLARE_INSTANCE_CHECKER(VersalVirt, XLNX_VERSAL_VIRT_MACHINE,
+                         TYPE_XLNX_VERSAL_VIRT_MACHINE)
 
 struct VersalVirt {
     MachineState parent_obj;
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 74f48325ac..19d5a4d4e0 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -39,8 +39,8 @@ struct XlnxZCU102 {
 typedef struct XlnxZCU102 XlnxZCU102;
 
 #define TYPE_ZCU102_MACHINE   MACHINE_TYPE_NAME("xlnx-zcu102")
-#define ZCU102_MACHINE(obj) \
-    OBJECT_CHECK(XlnxZCU102, (obj), TYPE_ZCU102_MACHINE)
+DECLARE_INSTANCE_CHECKER(XlnxZCU102, ZCU102_MACHINE,
+                         TYPE_ZCU102_MACHINE)
 
 
 static bool zcu102_get_secure(Object *obj, Error **errp)
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 9c69481269..72ecb6df29 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -114,7 +114,8 @@ struct ZipitLCD {
 typedef struct ZipitLCD ZipitLCD;
 
 #define TYPE_ZIPIT_LCD "zipit-lcd"
-#define ZIPIT_LCD(obj) OBJECT_CHECK(ZipitLCD, (obj), TYPE_ZIPIT_LCD)
+DECLARE_INSTANCE_CHECKER(ZipitLCD, ZIPIT_LCD,
+                         TYPE_ZIPIT_LCD)
 
 static uint32_t zipit_lcd_transfer(SSISlave *dev, uint32_t value)
 {
@@ -198,7 +199,8 @@ static const TypeInfo zipit_lcd_info = {
 
 #define TYPE_AER915 "aer915"
 typedef struct AER915State AER915State;
-#define AER915(obj) OBJECT_CHECK(AER915State, (obj), TYPE_AER915)
+DECLARE_INSTANCE_CHECKER(AER915State, AER915,
+                         TYPE_AER915)
 
 struct AER915State {
     I2CSlave parent_obj;
diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 9614419b7a..eb8a7f032d 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -128,8 +128,8 @@ enum {
 
 #define TYPE_AC97 "AC97"
 typedef struct AC97LinkState AC97LinkState;
-#define AC97(obj) \
-    OBJECT_CHECK(AC97LinkState, (obj), TYPE_AC97)
+DECLARE_INSTANCE_CHECKER(AC97LinkState, AC97,
+                         TYPE_AC97)
 
 #define REC_MASK 7
 enum {
diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index a216fe1925..870116e324 100644
--- a/hw/audio/adlib.c
+++ b/hw/audio/adlib.c
@@ -53,7 +53,8 @@
 
 #define TYPE_ADLIB "adlib"
 typedef struct AdlibState AdlibState;
-#define ADLIB(obj) OBJECT_CHECK(AdlibState, (obj), TYPE_ADLIB)
+DECLARE_INSTANCE_CHECKER(AdlibState, ADLIB,
+                         TYPE_ADLIB)
 
 struct AdlibState {
     ISADevice parent_obj;
diff --git a/hw/audio/cs4231.c b/hw/audio/cs4231.c
index 2b868051c3..8e9554ce9b 100644
--- a/hw/audio/cs4231.c
+++ b/hw/audio/cs4231.c
@@ -39,8 +39,8 @@
 
 #define TYPE_CS4231 "SUNW,CS4231"
 typedef struct CSState CSState;
-#define CS4231(obj) \
-    OBJECT_CHECK(CSState, (obj), TYPE_CS4231)
+DECLARE_INSTANCE_CHECKER(CSState, CS4231,
+                         TYPE_CS4231)
 
 struct CSState {
     SysBusDevice parent_obj;
diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index fc064a93d7..7d60ce6f0e 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -64,7 +64,8 @@ static struct {
 
 #define TYPE_CS4231A "cs4231a"
 typedef struct CSState CSState;
-#define CS4231A(obj) OBJECT_CHECK (CSState, (obj), TYPE_CS4231A)
+DECLARE_INSTANCE_CHECKER(CSState, CS4231A,
+                         TYPE_CS4231A)
 
 struct CSState {
     ISADevice dev;
diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index bd620d5ee2..a824f8949e 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -293,8 +293,8 @@ struct chan_bits {
 };
 
 #define TYPE_ES1370 "ES1370"
-#define ES1370(obj) \
-    OBJECT_CHECK(ES1370State, (obj), TYPE_ES1370)
+DECLARE_INSTANCE_CHECKER(ES1370State, ES1370,
+                         TYPE_ES1370)
 
 static void es1370_dac1_calc_freq (ES1370State *s, uint32_t ctl,
                                    uint32_t *old_freq, uint32_t *new_freq);
diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index 3cd62d43d7..307fd48315 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -44,7 +44,8 @@
 
 #define TYPE_GUS "gus"
 typedef struct GUSState GUSState;
-#define GUS(obj) OBJECT_CHECK (GUSState, (obj), TYPE_GUS)
+DECLARE_INSTANCE_CHECKER(GUSState, GUS,
+                         TYPE_GUS)
 
 struct GUSState {
     ISADevice dev;
diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index 1019bf717d..b3036d75b6 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -172,7 +172,8 @@ struct HDAAudioStream {
 };
 
 #define TYPE_HDA_AUDIO "hda-audio"
-#define HDA_AUDIO(obj) OBJECT_CHECK(HDAAudioState, (obj), TYPE_HDA_AUDIO)
+DECLARE_INSTANCE_CHECKER(HDAAudioState, HDA_AUDIO,
+                         TYPE_HDA_AUDIO)
 
 struct HDAAudioState {
     HDACodecDevice hda;
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index de30443c2e..4330213fff 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -204,8 +204,8 @@ struct IntelHDAState {
 
 #define TYPE_INTEL_HDA_GENERIC "intel-hda-generic"
 
-#define INTEL_HDA(obj) \
-    OBJECT_CHECK(IntelHDAState, (obj), TYPE_INTEL_HDA_GENERIC)
+DECLARE_INSTANCE_CHECKER(IntelHDAState, INTEL_HDA,
+                         TYPE_INTEL_HDA_GENERIC)
 
 struct IntelHDAReg {
     const char *name;      /* register name */
diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index 5f2e7f3b73..c8641562cc 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -44,8 +44,8 @@
 #define MP_AUDIO_MONO           (1 << 14)
 
 typedef struct mv88w8618_audio_state mv88w8618_audio_state;
-#define MV88W8618_AUDIO(obj) \
-    OBJECT_CHECK(mv88w8618_audio_state, (obj), TYPE_MV88W8618_AUDIO)
+DECLARE_INSTANCE_CHECKER(mv88w8618_audio_state, MV88W8618_AUDIO,
+                         TYPE_MV88W8618_AUDIO)
 
 struct mv88w8618_audio_state {
     SysBusDevice parent_obj;
diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c
index 4eacd4071a..7893539019 100644
--- a/hw/audio/milkymist-ac97.c
+++ b/hw/audio/milkymist-ac97.c
@@ -57,8 +57,8 @@ enum {
 
 #define TYPE_MILKYMIST_AC97 "milkymist-ac97"
 typedef struct MilkymistAC97State MilkymistAC97State;
-#define MILKYMIST_AC97(obj) \
-    OBJECT_CHECK(MilkymistAC97State, (obj), TYPE_MILKYMIST_AC97)
+DECLARE_INSTANCE_CHECKER(MilkymistAC97State, MILKYMIST_AC97,
+                         TYPE_MILKYMIST_AC97)
 
 struct MilkymistAC97State {
     SysBusDevice parent_obj;
diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index 57edbe652c..cbee8855fb 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -41,7 +41,8 @@
 #define PCSPK_MIN_COUNT DIV_ROUND_UP(PIT_FREQ, PCSPK_MAX_FREQ)
 
 typedef struct PCSpkState PCSpkState;
-#define PC_SPEAKER(obj) OBJECT_CHECK(PCSpkState, (obj), TYPE_PC_SPEAKER)
+DECLARE_INSTANCE_CHECKER(PCSpkState, PC_SPEAKER,
+                         TYPE_PC_SPEAKER)
 
 struct PCSpkState {
     ISADevice parent_obj;
diff --git a/hw/audio/pl041.c b/hw/audio/pl041.c
index e514a8cd70..570a234b72 100644
--- a/hw/audio/pl041.c
+++ b/hw/audio/pl041.c
@@ -79,7 +79,8 @@ typedef struct {
 
 #define TYPE_PL041 "pl041"
 typedef struct PL041State PL041State;
-#define PL041(obj) OBJECT_CHECK(PL041State, (obj), TYPE_PL041)
+DECLARE_INSTANCE_CHECKER(PL041State, PL041,
+                         TYPE_PL041)
 
 struct PL041State {
     SysBusDevice parent_obj;
diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 840f743e41..6aa2c0fb93 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -51,7 +51,8 @@ static const char e3[] = "COPYRIGHT (C) CREATIVE TECHNOLOGY LTD, 1992.";
 
 #define TYPE_SB16 "sb16"
 typedef struct SB16State SB16State;
-#define SB16(obj) OBJECT_CHECK (SB16State, (obj), TYPE_SB16)
+DECLARE_INSTANCE_CHECKER(SB16State, SB16,
+                         TYPE_SB16)
 
 struct SB16State {
     ISADevice parent_obj;
diff --git a/hw/audio/wm8750.c b/hw/audio/wm8750.c
index dae23f43a4..7d6fcfec03 100644
--- a/hw/audio/wm8750.c
+++ b/hw/audio/wm8750.c
@@ -28,7 +28,8 @@ typedef struct {
 } WMRate;
 
 typedef struct WM8750State WM8750State;
-#define WM8750(obj) OBJECT_CHECK(WM8750State, (obj), TYPE_WM8750)
+DECLARE_INSTANCE_CHECKER(WM8750State, WM8750,
+                         TYPE_WM8750)
 
 struct WM8750State {
     I2CSlave parent_obj;
diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
index c24183c07f..3c8388490d 100644
--- a/hw/avr/arduino.c
+++ b/hw/avr/arduino.c
@@ -36,12 +36,8 @@ typedef struct ArduinoMachineClass ArduinoMachineClass;
 
 #define TYPE_ARDUINO_MACHINE \
         MACHINE_TYPE_NAME("arduino")
-#define ARDUINO_MACHINE(obj) \
-        OBJECT_CHECK(ArduinoMachineState, (obj), TYPE_ARDUINO_MACHINE)
-#define ARDUINO_MACHINE_CLASS(klass) \
-        OBJECT_CLASS_CHECK(ArduinoMachineClass, (klass), TYPE_ARDUINO_MACHINE)
-#define ARDUINO_MACHINE_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(ArduinoMachineClass, (obj), TYPE_ARDUINO_MACHINE)
+DECLARE_OBJ_CHECKERS(ArduinoMachineState, ArduinoMachineClass,
+                     ARDUINO_MACHINE, TYPE_ARDUINO_MACHINE)
 
 static void arduino_machine_init(MachineState *machine)
 {
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index c3b8e05110..44c6afebbb 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -63,10 +63,8 @@ struct AtmegaMcuClass {
 };
 typedef struct AtmegaMcuClass AtmegaMcuClass;
 
-#define ATMEGA_MCU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(AtmegaMcuClass, (klass), TYPE_ATMEGA_MCU)
-#define ATMEGA_MCU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(AtmegaMcuClass, (obj), TYPE_ATMEGA_MCU)
+DECLARE_CLASS_CHECKERS(AtmegaMcuClass, ATMEGA_MCU,
+                       TYPE_ATMEGA_MCU)
 
 static const peripheral_cfg dev168_328[PERIFMAX] = {
     [USART0]        = {  0xc0, POWER0, 1 },
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 70bfb136e4..224bac504f 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -66,7 +66,8 @@
 
 #define TYPE_FLOPPY_BUS "floppy-bus"
 typedef struct FloppyBus FloppyBus;
-#define FLOPPY_BUS(obj) OBJECT_CHECK(FloppyBus, (obj), TYPE_FLOPPY_BUS)
+DECLARE_INSTANCE_CHECKER(FloppyBus, FLOPPY_BUS,
+                         TYPE_FLOPPY_BUS)
 
 typedef struct FDCtrl FDCtrl;
 typedef struct FDrive FDrive;
@@ -497,8 +498,8 @@ static const BlockDevOps fd_block_ops = {
 
 #define TYPE_FLOPPY_DRIVE "floppy"
 typedef struct FloppyDrive FloppyDrive;
-#define FLOPPY_DRIVE(obj) \
-     OBJECT_CHECK(FloppyDrive, (obj), TYPE_FLOPPY_DRIVE)
+DECLARE_INSTANCE_CHECKER(FloppyDrive, FLOPPY_DRIVE,
+                         TYPE_FLOPPY_DRIVE)
 
 struct FloppyDrive {
     DeviceState     qdev;
@@ -890,7 +891,8 @@ static FloppyDriveType get_fallback_drive_type(FDrive *drv)
 
 #define TYPE_SYSBUS_FDC "base-sysbus-fdc"
 typedef struct FDCtrlSysBus FDCtrlSysBus;
-#define SYSBUS_FDC(obj) OBJECT_CHECK(FDCtrlSysBus, (obj), TYPE_SYSBUS_FDC)
+DECLARE_INSTANCE_CHECKER(FDCtrlSysBus, SYSBUS_FDC,
+                         TYPE_SYSBUS_FDC)
 
 struct FDCtrlSysBus {
     /*< private >*/
@@ -901,7 +903,8 @@ struct FDCtrlSysBus {
 };
 
 typedef struct FDCtrlISABus FDCtrlISABus;
-#define ISA_FDC(obj) OBJECT_CHECK(FDCtrlISABus, (obj), TYPE_ISA_FDC)
+DECLARE_INSTANCE_CHECKER(FDCtrlISABus, ISA_FDC,
+                         TYPE_ISA_FDC)
 
 struct FDCtrlISABus {
     ISADevice parent_obj;
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index c6ee26c571..c91d603cff 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -462,12 +462,8 @@ struct M25P80Class {
 typedef struct M25P80Class M25P80Class;
 
 #define TYPE_M25P80 "m25p80-generic"
-#define M25P80(obj) \
-     OBJECT_CHECK(Flash, (obj), TYPE_M25P80)
-#define M25P80_CLASS(klass) \
-     OBJECT_CLASS_CHECK(M25P80Class, (klass), TYPE_M25P80)
-#define M25P80_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(M25P80Class, (obj), TYPE_M25P80)
+DECLARE_OBJ_CHECKERS(Flash, M25P80Class,
+                     M25P80, TYPE_M25P80)
 
 static inline Manufacturer get_man(Flash *s)
 {
diff --git a/hw/block/nand.c b/hw/block/nand.c
index 7c7a08b7aa..5c8112ed5a 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -90,8 +90,8 @@ struct NANDFlashState {
 
 #define TYPE_NAND "nand"
 
-#define NAND(obj) \
-    OBJECT_CHECK(NANDFlashState, (obj), TYPE_NAND)
+DECLARE_INSTANCE_CHECKER(NANDFlashState, NAND,
+                         TYPE_NAND)
 
 static void mem_and(uint8_t *dest, const uint8_t *src, size_t n)
 {
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 5fe235d11d..19f55aba66 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -41,7 +41,8 @@
 
 #define TYPE_ONE_NAND "onenand"
 typedef struct OneNANDState OneNANDState;
-#define ONE_NAND(obj) OBJECT_CHECK(OneNANDState, (obj), TYPE_ONE_NAND)
+DECLARE_INSTANCE_CHECKER(OneNANDState, ONE_NAND,
+                         TYPE_ONE_NAND)
 
 struct OneNANDState {
     SysBusDevice parent_obj;
diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index 219e88efee..daaaca0f39 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -34,8 +34,8 @@
 
 #define TYPE_ISA_DEBUGCON_DEVICE "isa-debugcon"
 typedef struct ISADebugconState ISADebugconState;
-#define ISA_DEBUGCON_DEVICE(obj) \
-     OBJECT_CHECK(ISADebugconState, (obj), TYPE_ISA_DEBUGCON_DEVICE)
+DECLARE_INSTANCE_CHECKER(ISADebugconState, ISA_DEBUGCON_DEVICE,
+                         TYPE_ISA_DEBUGCON_DEVICE)
 
 //#define DEBUG_DEBUGCON
 
diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
index 9ca9f21c4d..d9fba2ae6c 100644
--- a/hw/char/etraxfs_ser.c
+++ b/hw/char/etraxfs_ser.c
@@ -51,8 +51,8 @@
 
 #define TYPE_ETRAX_FS_SERIAL "etraxfs,serial"
 typedef struct ETRAXSerial ETRAXSerial;
-#define ETRAX_SERIAL(obj) \
-    OBJECT_CHECK(ETRAXSerial, (obj), TYPE_ETRAX_FS_SERIAL)
+DECLARE_INSTANCE_CHECKER(ETRAXSerial, ETRAX_SERIAL,
+                         TYPE_ETRAX_FS_SERIAL)
 
 struct ETRAXSerial {
     SysBusDevice parent_obj;
diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index e3a21dfdb8..b8ea34edbd 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -140,8 +140,8 @@ typedef struct {
 
 #define TYPE_EXYNOS4210_UART "exynos4210.uart"
 typedef struct Exynos4210UartState Exynos4210UartState;
-#define EXYNOS4210_UART(obj) \
-    OBJECT_CHECK(Exynos4210UartState, (obj), TYPE_EXYNOS4210_UART)
+DECLARE_INSTANCE_CHECKER(Exynos4210UartState, EXYNOS4210_UART,
+                         TYPE_EXYNOS4210_UART)
 
 struct Exynos4210UartState {
     SysBusDevice parent_obj;
diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index f48ad21c7c..6fd88d83ad 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -74,8 +74,8 @@
 #define FIFO_LENGTH 1024
 
 typedef struct UART UART;
-#define GRLIB_APB_UART(obj) \
-    OBJECT_CHECK(UART, (obj), TYPE_GRLIB_APB_UART)
+DECLARE_INSTANCE_CHECKER(UART, GRLIB_APB_UART,
+                         TYPE_GRLIB_APB_UART)
 
 struct UART {
     SysBusDevice parent_obj;
diff --git a/hw/char/ipoctal232.c b/hw/char/ipoctal232.c
index c7ea7f8da9..2c987df8ad 100644
--- a/hw/char/ipoctal232.c
+++ b/hw/char/ipoctal232.c
@@ -123,8 +123,8 @@ struct IPOctalState {
 
 #define TYPE_IPOCTAL "ipoctal232"
 
-#define IPOCTAL(obj) \
-    OBJECT_CHECK(IPOctalState, (obj), TYPE_IPOCTAL)
+DECLARE_INSTANCE_CHECKER(IPOctalState, IPOCTAL,
+                         TYPE_IPOCTAL)
 
 static const VMStateDescription vmstate_scc2698_channel = {
     .name = "scc2698_channel",
diff --git a/hw/char/lm32_juart.c b/hw/char/lm32_juart.c
index e7af76ad1a..5723f2e189 100644
--- a/hw/char/lm32_juart.c
+++ b/hw/char/lm32_juart.c
@@ -43,7 +43,8 @@ enum {
 };
 
 typedef struct LM32JuartState LM32JuartState;
-#define LM32_JUART(obj) OBJECT_CHECK(LM32JuartState, (obj), TYPE_LM32_JUART)
+DECLARE_INSTANCE_CHECKER(LM32JuartState, LM32_JUART,
+                         TYPE_LM32_JUART)
 
 struct LM32JuartState {
     SysBusDevice parent_obj;
diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
index 8aff78592b..624bc83c5f 100644
--- a/hw/char/lm32_uart.c
+++ b/hw/char/lm32_uart.c
@@ -96,7 +96,8 @@ enum {
 
 #define TYPE_LM32_UART "lm32-uart"
 typedef struct LM32UartState LM32UartState;
-#define LM32_UART(obj) OBJECT_CHECK(LM32UartState, (obj), TYPE_LM32_UART)
+DECLARE_INSTANCE_CHECKER(LM32UartState, LM32_UART,
+                         TYPE_LM32_UART)
 
 struct LM32UartState {
     SysBusDevice parent_obj;
diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
index d6745da72a..f6baa3ce77 100644
--- a/hw/char/mcf_uart.c
+++ b/hw/char/mcf_uart.c
@@ -38,7 +38,8 @@ struct mcf_uart_state {
 typedef struct mcf_uart_state mcf_uart_state;
 
 #define TYPE_MCF_UART "mcf-uart"
-#define MCF_UART(obj) OBJECT_CHECK(mcf_uart_state, (obj), TYPE_MCF_UART)
+DECLARE_INSTANCE_CHECKER(mcf_uart_state, MCF_UART,
+                         TYPE_MCF_UART)
 
 /* UART Status Register bits.  */
 #define MCF_UART_RxRDY  0x01
diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c
index 300a9150cf..41204a0e28 100644
--- a/hw/char/milkymist-uart.c
+++ b/hw/char/milkymist-uart.c
@@ -59,8 +59,8 @@ enum {
 
 #define TYPE_MILKYMIST_UART "milkymist-uart"
 typedef struct MilkymistUartState MilkymistUartState;
-#define MILKYMIST_UART(obj) \
-    OBJECT_CHECK(MilkymistUartState, (obj), TYPE_MILKYMIST_UART)
+DECLARE_INSTANCE_CHECKER(MilkymistUartState, MILKYMIST_UART,
+                         TYPE_MILKYMIST_UART)
 
 struct MilkymistUartState {
     SysBusDevice parent_obj;
diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index 73ac5ee9e3..ddb14f3197 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -94,8 +94,8 @@ typedef struct ParallelState {
 
 #define TYPE_ISA_PARALLEL "isa-parallel"
 typedef struct ISAParallelState ISAParallelState;
-#define ISA_PARALLEL(obj) \
-    OBJECT_CHECK(ISAParallelState, (obj), TYPE_ISA_PARALLEL)
+DECLARE_INSTANCE_CHECKER(ISAParallelState, ISA_PARALLEL,
+                         TYPE_ISA_PARALLEL)
 
 struct ISAParallelState {
     ISADevice parent_obj;
diff --git a/hw/char/sclpconsole-lm.c b/hw/char/sclpconsole-lm.c
index 0b77af68a4..81f6d0ed4f 100644
--- a/hw/char/sclpconsole-lm.c
+++ b/hw/char/sclpconsole-lm.c
@@ -49,8 +49,8 @@ struct SCLPConsoleLM {
 typedef struct SCLPConsoleLM SCLPConsoleLM;
 
 #define TYPE_SCLPLM_CONSOLE "sclplmconsole"
-#define SCLPLM_CONSOLE(obj) \
-    OBJECT_CHECK(SCLPConsoleLM, (obj), TYPE_SCLPLM_CONSOLE)
+DECLARE_INSTANCE_CHECKER(SCLPConsoleLM, SCLPLM_CONSOLE,
+                         TYPE_SCLPLM_CONSOLE)
 
 /*
 *  Character layer call-back functions
diff --git a/hw/char/sclpconsole.c b/hw/char/sclpconsole.c
index 3919368570..aa72ab40b9 100644
--- a/hw/char/sclpconsole.c
+++ b/hw/char/sclpconsole.c
@@ -45,8 +45,8 @@ struct SCLPConsole {
 typedef struct SCLPConsole SCLPConsole;
 
 #define TYPE_SCLP_CONSOLE "sclpconsole"
-#define SCLP_CONSOLE(obj) \
-    OBJECT_CHECK(SCLPConsole, (obj), TYPE_SCLP_CONSOLE)
+DECLARE_INSTANCE_CHECKER(SCLPConsole, SCLP_CONSOLE,
+                         TYPE_SCLP_CONSOLE)
 
 /* character layer call-back functions */
 
diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index 3d1c9a2d75..d4aad81a85 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -35,7 +35,8 @@
 #include "qom/object.h"
 
 typedef struct ISASerialState ISASerialState;
-#define ISA_SERIAL(obj) OBJECT_CHECK(ISASerialState, (obj), TYPE_ISA_SERIAL)
+DECLARE_INSTANCE_CHECKER(ISASerialState, ISA_SERIAL,
+                         TYPE_ISA_SERIAL)
 
 struct ISASerialState {
     ISADevice parent_obj;
diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 649f08c20e..f68948154e 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -43,7 +43,8 @@ struct PCISerialState {
 typedef struct PCISerialState PCISerialState;
 
 #define TYPE_PCI_SERIAL "pci-serial"
-#define PCI_SERIAL(s) OBJECT_CHECK(PCISerialState, (s), TYPE_PCI_SERIAL)
+DECLARE_INSTANCE_CHECKER(PCISerialState, PCI_SERIAL,
+                         TYPE_PCI_SERIAL)
 
 static void serial_pci_realize(PCIDevice *dev, Error **errp)
 {
diff --git a/hw/char/spapr_vty.c b/hw/char/spapr_vty.c
index 9944933c16..dd6dd2d8c3 100644
--- a/hw/char/spapr_vty.c
+++ b/hw/char/spapr_vty.c
@@ -21,8 +21,8 @@ struct SpaprVioVty {
 typedef struct SpaprVioVty SpaprVioVty;
 
 #define TYPE_VIO_SPAPR_VTY_DEVICE "spapr-vty"
-#define VIO_SPAPR_VTY_DEVICE(obj) \
-     OBJECT_CHECK(SpaprVioVty, (obj), TYPE_VIO_SPAPR_VTY_DEVICE)
+DECLARE_INSTANCE_CHECKER(SpaprVioVty, VIO_SPAPR_VTY_DEVICE,
+                         TYPE_VIO_SPAPR_VTY_DEVICE)
 
 static int vty_can_receive(void *opaque)
 {
diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
index 4efd6a9433..d77981bb6d 100644
--- a/hw/char/terminal3270.c
+++ b/hw/char/terminal3270.c
@@ -39,8 +39,8 @@ struct Terminal3270 {
 typedef struct Terminal3270 Terminal3270;
 
 #define TYPE_TERMINAL_3270 "x-terminal3270"
-#define TERMINAL_3270(obj) \
-        OBJECT_CHECK(Terminal3270, (obj), TYPE_TERMINAL_3270)
+DECLARE_INSTANCE_CHECKER(Terminal3270, TERMINAL_3270,
+                         TYPE_TERMINAL_3270)
 
 static int terminal_can_read(void *opaque)
 {
diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
index 31144c68b6..bc752cf90f 100644
--- a/hw/char/virtio-console.c
+++ b/hw/char/virtio-console.c
@@ -23,8 +23,8 @@
 
 #define TYPE_VIRTIO_CONSOLE_SERIAL_PORT "virtserialport"
 typedef struct VirtConsole VirtConsole;
-#define VIRTIO_CONSOLE(obj) \
-    OBJECT_CHECK(VirtConsole, (obj), TYPE_VIRTIO_CONSOLE_SERIAL_PORT)
+DECLARE_INSTANCE_CHECKER(VirtConsole, VIRTIO_CONSOLE,
+                         TYPE_VIRTIO_CONSOLE_SERIAL_PORT)
 
 struct VirtConsole {
     VirtIOSerialPort parent_obj;
diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index e7ab97d58d..8e9f9cd9ec 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -54,8 +54,8 @@
 
 #define TYPE_XILINX_UARTLITE "xlnx.xps-uartlite"
 typedef struct XilinxUARTLite XilinxUARTLite;
-#define XILINX_UARTLITE(obj) \
-    OBJECT_CHECK(XilinxUARTLite, (obj), TYPE_XILINX_UARTLITE)
+DECLARE_INSTANCE_CHECKER(XilinxUARTLite, XILINX_UARTLITE,
+                         TYPE_XILINX_UARTLITE)
 
 struct XilinxUARTLite {
     SysBusDevice parent_obj;
diff --git a/hw/core/irq.c b/hw/core/irq.c
index fb3045b912..8a9cbdd556 100644
--- a/hw/core/irq.c
+++ b/hw/core/irq.c
@@ -26,7 +26,8 @@
 #include "hw/irq.h"
 #include "qom/object.h"
 
-#define IRQ(obj) OBJECT_CHECK(struct IRQState, (obj), TYPE_IRQ)
+DECLARE_INSTANCE_CHECKER(struct IRQState, IRQ,
+                         TYPE_IRQ)
 
 struct IRQState {
     Object parent_obj;
diff --git a/hw/cpu/realview_mpcore.c b/hw/cpu/realview_mpcore.c
index 1f1df08cfa..fb547aceef 100644
--- a/hw/cpu/realview_mpcore.c
+++ b/hw/cpu/realview_mpcore.c
@@ -19,8 +19,8 @@
 
 #define TYPE_REALVIEW_MPCORE_RIRQ "realview_mpcore"
 typedef struct mpcore_rirq_state mpcore_rirq_state;
-#define REALVIEW_MPCORE_RIRQ(obj) \
-    OBJECT_CHECK(mpcore_rirq_state, (obj), TYPE_REALVIEW_MPCORE_RIRQ)
+DECLARE_INSTANCE_CHECKER(mpcore_rirq_state, REALVIEW_MPCORE_RIRQ,
+                         TYPE_REALVIEW_MPCORE_RIRQ)
 
 /* Dummy PIC to route IRQ lines.  The baseboard has 4 independent IRQ
    controllers.  The output of these, plus some of the raw input lines
diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
index 59bbce3979..4b87ee7135 100644
--- a/hw/display/ads7846.c
+++ b/hw/display/ads7846.c
@@ -32,7 +32,8 @@ struct ADS7846State {
 typedef struct ADS7846State ADS7846State;
 
 #define TYPE_ADS7846 "ads7846"
-#define ADS7846(obj) OBJECT_CHECK(ADS7846State, (obj), TYPE_ADS7846)
+DECLARE_INSTANCE_CHECKER(ADS7846State, ADS7846,
+                         TYPE_ADS7846)
 
 /* Control-byte bitfields */
 #define CB_PD0		(1 << 0)
diff --git a/hw/display/artist.c b/hw/display/artist.c
index b2fc642002..b96589eabf 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -26,7 +26,8 @@
 
 #define TYPE_ARTIST "artist"
 typedef struct ARTISTState ARTISTState;
-#define ARTIST(obj) OBJECT_CHECK(ARTISTState, (obj), TYPE_ARTIST)
+DECLARE_INSTANCE_CHECKER(ARTISTState, ARTIST,
+                         TYPE_ARTIST)
 
 #ifdef HOST_WORDS_BIGENDIAN
 #define ROP8OFF(_i) (3 - (_i))
diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index ef92f3a4e7..41587388c4 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -58,8 +58,8 @@ struct BochsDisplayState {
 typedef struct BochsDisplayState BochsDisplayState;
 
 #define TYPE_BOCHS_DISPLAY "bochs-display"
-#define BOCHS_DISPLAY(obj) OBJECT_CHECK(BochsDisplayState, (obj), \
-                                        TYPE_BOCHS_DISPLAY)
+DECLARE_INSTANCE_CHECKER(BochsDisplayState, BOCHS_DISPLAY,
+                         TYPE_BOCHS_DISPLAY)
 
 static const VMStateDescription vmstate_bochs_display = {
     .name = "bochs-display",
diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index 49d7e777f9..d66ba9ad6a 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -67,7 +67,8 @@
 
 #define TYPE_CG3 "cgthree"
 typedef struct CG3State CG3State;
-#define CG3(obj) OBJECT_CHECK(CG3State, (obj), TYPE_CG3)
+DECLARE_INSTANCE_CHECKER(CG3State, CG3,
+                         TYPE_CG3)
 
 struct CG3State {
     SysBusDevice parent_obj;
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 00c0301b72..2b9f608eb7 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -186,8 +186,8 @@ struct PCICirrusVGAState {
 typedef struct PCICirrusVGAState PCICirrusVGAState;
 
 #define TYPE_PCI_CIRRUS_VGA "cirrus-vga"
-#define PCI_CIRRUS_VGA(obj) \
-    OBJECT_CHECK(PCICirrusVGAState, (obj), TYPE_PCI_CIRRUS_VGA)
+DECLARE_INSTANCE_CHECKER(PCICirrusVGAState, PCI_CIRRUS_VGA,
+                         TYPE_PCI_CIRRUS_VGA)
 
 static uint8_t rop_to_index[256];
 
diff --git a/hw/display/cirrus_vga_isa.c b/hw/display/cirrus_vga_isa.c
index 28d1fa41e7..e6adee1df4 100644
--- a/hw/display/cirrus_vga_isa.c
+++ b/hw/display/cirrus_vga_isa.c
@@ -34,8 +34,8 @@
 
 #define TYPE_ISA_CIRRUS_VGA "isa-cirrus-vga"
 typedef struct ISACirrusVGAState ISACirrusVGAState;
-#define ISA_CIRRUS_VGA(obj) \
-    OBJECT_CHECK(ISACirrusVGAState, (obj), TYPE_ISA_CIRRUS_VGA)
+DECLARE_INSTANCE_CHECKER(ISACirrusVGAState, ISA_CIRRUS_VGA,
+                         TYPE_ISA_CIRRUS_VGA)
 
 struct ISACirrusVGAState {
     ISADevice parent_obj;
diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 993b7e9dae..3ef8698eb7 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -295,8 +295,8 @@ struct Exynos4210fimdWindow {
 
 #define TYPE_EXYNOS4210_FIMD "exynos4210.fimd"
 typedef struct Exynos4210fimdState Exynos4210fimdState;
-#define EXYNOS4210_FIMD(obj) \
-    OBJECT_CHECK(Exynos4210fimdState, (obj), TYPE_EXYNOS4210_FIMD)
+DECLARE_INSTANCE_CHECKER(Exynos4210fimdState, EXYNOS4210_FIMD,
+                         TYPE_EXYNOS4210_FIMD)
 
 struct Exynos4210fimdState {
     SysBusDevice parent_obj;
diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index df674c3c01..4a32fe4c94 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -488,7 +488,8 @@ static void g364fb_init(DeviceState *dev, G364State *s)
 
 #define TYPE_G364 "sysbus-g364"
 typedef struct G364SysBusState G364SysBusState;
-#define G364(obj) OBJECT_CHECK(G364SysBusState, (obj), TYPE_G364)
+DECLARE_INSTANCE_CHECKER(G364SysBusState, G364,
+                         TYPE_G364)
 
 struct G364SysBusState {
     SysBusDevice parent_obj;
diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
index 97ec36878b..647d05f602 100644
--- a/hw/display/jazz_led.c
+++ b/hw/display/jazz_led.c
@@ -37,7 +37,8 @@ typedef enum {
 
 #define TYPE_JAZZ_LED "jazz-led"
 typedef struct LedState LedState;
-#define JAZZ_LED(obj) OBJECT_CHECK(LedState, (obj), TYPE_JAZZ_LED)
+DECLARE_INSTANCE_CHECKER(LedState, JAZZ_LED,
+                         TYPE_JAZZ_LED)
 
 struct LedState {
     SysBusDevice parent_obj;
diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
index 66cb8e6a60..8a9e7c23fb 100644
--- a/hw/display/milkymist-tmu2.c
+++ b/hw/display/milkymist-tmu2.c
@@ -84,8 +84,8 @@ struct vertex {
 
 #define TYPE_MILKYMIST_TMU2 "milkymist-tmu2"
 typedef struct MilkymistTMU2State MilkymistTMU2State;
-#define MILKYMIST_TMU2(obj) \
-    OBJECT_CHECK(MilkymistTMU2State, (obj), TYPE_MILKYMIST_TMU2)
+DECLARE_INSTANCE_CHECKER(MilkymistTMU2State, MILKYMIST_TMU2,
+                         TYPE_MILKYMIST_TMU2)
 
 struct MilkymistTMU2State {
     SysBusDevice parent_obj;
diff --git a/hw/display/milkymist-vgafb.c b/hw/display/milkymist-vgafb.c
index bbf412d9a0..2c879129fb 100644
--- a/hw/display/milkymist-vgafb.c
+++ b/hw/display/milkymist-vgafb.c
@@ -70,8 +70,8 @@ enum {
 
 #define TYPE_MILKYMIST_VGAFB "milkymist-vgafb"
 typedef struct MilkymistVgafbState MilkymistVgafbState;
-#define MILKYMIST_VGAFB(obj) \
-    OBJECT_CHECK(MilkymistVgafbState, (obj), TYPE_MILKYMIST_VGAFB)
+DECLARE_INSTANCE_CHECKER(MilkymistVgafbState, MILKYMIST_VGAFB,
+                         TYPE_MILKYMIST_VGAFB)
 
 struct MilkymistVgafbState {
     SysBusDevice parent_obj;
diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
index 068dc0656f..94db0202a3 100644
--- a/hw/display/next-fb.c
+++ b/hw/display/next-fb.c
@@ -33,7 +33,8 @@
 #include "qom/object.h"
 
 typedef struct NeXTFbState NeXTFbState;
-#define NEXTFB(obj) OBJECT_CHECK(NeXTFbState, (obj), TYPE_NEXTFB)
+DECLARE_INSTANCE_CHECKER(NeXTFbState, NEXTFB,
+                         TYPE_NEXTFB)
 
 struct NeXTFbState {
     SysBusDevice parent_obj;
diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index 4cf953c2f4..af51a2b9e7 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -50,7 +50,8 @@ enum pl110_version
 
 #define TYPE_PL110 "pl110"
 typedef struct PL110State PL110State;
-#define PL110(obj) OBJECT_CHECK(PL110State, (obj), TYPE_PL110)
+DECLARE_INSTANCE_CHECKER(PL110State, PL110,
+                         TYPE_PL110)
 
 struct PL110State {
     SysBusDevice parent_obj;
diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
index dae32b9fda..8c0094397f 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -8,7 +8,8 @@
 #include "qom/object.h"
 
 typedef struct RAMFBStandaloneState RAMFBStandaloneState;
-#define RAMFB(obj) OBJECT_CHECK(RAMFBStandaloneState, (obj), TYPE_RAMFB_DEVICE)
+DECLARE_INSTANCE_CHECKER(RAMFBStandaloneState, RAMFB,
+                         TYPE_RAMFB_DEVICE)
 
 struct RAMFBStandaloneState {
     SysBusDevice parent_obj;
diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
index 4bf2c559cd..d88166f449 100644
--- a/hw/display/sii9022.c
+++ b/hw/display/sii9022.c
@@ -37,7 +37,8 @@
 
 #define TYPE_SII9022 "sii9022"
 typedef struct sii9022_state sii9022_state;
-#define SII9022(obj) OBJECT_CHECK(sii9022_state, (obj), TYPE_SII9022)
+DECLARE_INSTANCE_CHECKER(sii9022_state, SII9022,
+                         TYPE_SII9022)
 
 struct sii9022_state {
     I2CSlave parent_obj;
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index f886c1e51b..51120c6c3e 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1933,8 +1933,8 @@ static const VMStateDescription vmstate_sm501_state = {
 
 #define TYPE_SYSBUS_SM501 "sysbus-sm501"
 typedef struct SM501SysBusState SM501SysBusState;
-#define SYSBUS_SM501(obj) \
-    OBJECT_CHECK(SM501SysBusState, (obj), TYPE_SYSBUS_SM501)
+DECLARE_INSTANCE_CHECKER(SM501SysBusState, SYSBUS_SM501,
+                         TYPE_SYSBUS_SM501)
 
 struct SM501SysBusState {
     /*< private >*/
@@ -2037,7 +2037,8 @@ static const TypeInfo sm501_sysbus_info = {
 
 #define TYPE_PCI_SM501 "sm501"
 typedef struct SM501PCIState SM501PCIState;
-#define PCI_SM501(obj) OBJECT_CHECK(SM501PCIState, (obj), TYPE_PCI_SM501)
+DECLARE_INSTANCE_CHECKER(SM501PCIState, PCI_SM501,
+                         TYPE_PCI_SM501)
 
 struct SM501PCIState {
     /*< private >*/
diff --git a/hw/display/ssd0303.c b/hw/display/ssd0303.c
index 8804567c1f..0378573a42 100644
--- a/hw/display/ssd0303.c
+++ b/hw/display/ssd0303.c
@@ -48,7 +48,8 @@ enum ssd0303_cmd {
 
 #define TYPE_SSD0303 "ssd0303"
 typedef struct ssd0303_state ssd0303_state;
-#define SSD0303(obj) OBJECT_CHECK(ssd0303_state, (obj), TYPE_SSD0303)
+DECLARE_INSTANCE_CHECKER(ssd0303_state, SSD0303,
+                         TYPE_SSD0303)
 
 struct ssd0303_state {
     I2CSlave parent_obj;
diff --git a/hw/display/ssd0323.c b/hw/display/ssd0323.c
index c9d79cfcd3..037da81127 100644
--- a/hw/display/ssd0323.c
+++ b/hw/display/ssd0323.c
@@ -69,7 +69,8 @@ struct ssd0323_state {
 typedef struct ssd0323_state ssd0323_state;
 
 #define TYPE_SSD0323 "ssd0323"
-#define SSD0323(obj) OBJECT_CHECK(ssd0323_state, (obj), TYPE_SSD0323)
+DECLARE_INSTANCE_CHECKER(ssd0323_state, SSD0323,
+                         TYPE_SSD0323)
 
 
 static uint32_t ssd0323_transfer(SSISlave *dev, uint32_t data)
diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index 5c75589919..69e901a800 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -57,7 +57,8 @@
 
 #define TYPE_TCX "SUNW,tcx"
 typedef struct TCXState TCXState;
-#define TCX(obj) OBJECT_CHECK(TCXState, (obj), TYPE_TCX)
+DECLARE_INSTANCE_CHECKER(TCXState, TCX,
+                         TYPE_TCX)
 
 struct TCXState {
     SysBusDevice parent_obj;
diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 50efc3760a..0ebfcca9d1 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -36,7 +36,8 @@
 
 #define TYPE_ISA_VGA "isa-vga"
 typedef struct ISAVGAState ISAVGAState;
-#define ISA_VGA(obj) OBJECT_CHECK(ISAVGAState, (obj), TYPE_ISA_VGA)
+DECLARE_INSTANCE_CHECKER(ISAVGAState, ISA_VGA,
+                         TYPE_ISA_VGA)
 
 struct ISAVGAState {
     ISADevice parent_obj;
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 852cbf36e9..3b45fa3bad 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -54,7 +54,8 @@ struct PCIVGAState {
 typedef struct PCIVGAState PCIVGAState;
 
 #define TYPE_PCI_VGA "pci-vga"
-#define PCI_VGA(obj) OBJECT_CHECK(PCIVGAState, (obj), TYPE_PCI_VGA)
+DECLARE_INSTANCE_CHECKER(PCIVGAState, PCI_VGA,
+                         TYPE_PCI_VGA)
 
 static const VMStateDescription vmstate_vga_pci = {
     .name = "vga",
diff --git a/hw/display/vhost-user-gpu-pci.c b/hw/display/vhost-user-gpu-pci.c
index 678b762bbb..a02b23ecaf 100644
--- a/hw/display/vhost-user-gpu-pci.c
+++ b/hw/display/vhost-user-gpu-pci.c
@@ -15,8 +15,8 @@
 
 #define TYPE_VHOST_USER_GPU_PCI "vhost-user-gpu-pci"
 typedef struct VhostUserGPUPCI VhostUserGPUPCI;
-#define VHOST_USER_GPU_PCI(obj)                                     \
-    OBJECT_CHECK(VhostUserGPUPCI, (obj), TYPE_VHOST_USER_GPU_PCI)
+DECLARE_INSTANCE_CHECKER(VhostUserGPUPCI, VHOST_USER_GPU_PCI,
+                         TYPE_VHOST_USER_GPU_PCI)
 
 struct VhostUserGPUPCI {
     VirtIOGPUPCIBase parent_obj;
diff --git a/hw/display/vhost-user-vga.c b/hw/display/vhost-user-vga.c
index 2cc9616bea..7110ea6231 100644
--- a/hw/display/vhost-user-vga.c
+++ b/hw/display/vhost-user-vga.c
@@ -16,8 +16,8 @@
 #define TYPE_VHOST_USER_VGA "vhost-user-vga"
 
 typedef struct VhostUserVGA VhostUserVGA;
-#define VHOST_USER_VGA(obj)                                \
-    OBJECT_CHECK(VhostUserVGA, (obj), TYPE_VHOST_USER_VGA)
+DECLARE_INSTANCE_CHECKER(VhostUserVGA, VHOST_USER_VGA,
+                         TYPE_VHOST_USER_VGA)
 
 struct VhostUserVGA {
     VirtIOVGABase parent_obj;
diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index 7248ec30c7..d742a30aec 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -67,8 +67,8 @@ static const TypeInfo virtio_gpu_pci_base_info = {
 
 #define TYPE_VIRTIO_GPU_PCI "virtio-gpu-pci"
 typedef struct VirtIOGPUPCI VirtIOGPUPCI;
-#define VIRTIO_GPU_PCI(obj)                                 \
-    OBJECT_CHECK(VirtIOGPUPCI, (obj), TYPE_VIRTIO_GPU_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIOGPUPCI, VIRTIO_GPU_PCI,
+                         TYPE_VIRTIO_GPU_PCI)
 
 struct VirtIOGPUPCI {
     VirtIOGPUPCIBase parent_obj;
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 0bb98ede75..17e5658d43 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -204,8 +204,8 @@ static TypeInfo virtio_vga_base_info = {
 #define TYPE_VIRTIO_VGA "virtio-vga"
 
 typedef struct VirtIOVGA VirtIOVGA;
-#define VIRTIO_VGA(obj)                             \
-    OBJECT_CHECK(VirtIOVGA, (obj), TYPE_VIRTIO_VGA)
+DECLARE_INSTANCE_CHECKER(VirtIOVGA, VIRTIO_VGA,
+                         TYPE_VIRTIO_VGA)
 
 struct VirtIOVGA {
     VirtIOVGABase parent_obj;
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 076dfcedd7..bef0d7d69a 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -86,8 +86,8 @@ struct vmsvga_state_s {
 
 #define TYPE_VMWARE_SVGA "vmware-svga"
 
-#define VMWARE_SVGA(obj) \
-    OBJECT_CHECK(struct pci_vmsvga_state_s, (obj), TYPE_VMWARE_SVGA)
+DECLARE_INSTANCE_CHECKER(struct pci_vmsvga_state_s, VMWARE_SVGA,
+                         TYPE_VMWARE_SVGA)
 
 struct pci_vmsvga_state_s {
     /*< private >*/
diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index c12946aaef..5b7ff635f7 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -33,7 +33,8 @@
 
 #define TYPE_I82374 "i82374"
 typedef struct I82374State I82374State;
-#define I82374(obj) OBJECT_CHECK(I82374State, (obj), TYPE_I82374)
+DECLARE_INSTANCE_CHECKER(I82374State, I82374,
+                         TYPE_I82374)
 
 //#define DEBUG_I82374
 
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 380d45db8f..859586fd2f 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -272,7 +272,8 @@ struct PL330State {
 };
 
 #define TYPE_PL330 "pl330"
-#define PL330(obj) OBJECT_CHECK(PL330State, (obj), TYPE_PL330)
+DECLARE_INSTANCE_CHECKER(PL330State, PL330,
+                         TYPE_PL330)
 
 static const VMStateDescription vmstate_pl330 = {
     .name = "pl330",
diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c
index 72e7b395b0..825e3dc0ac 100644
--- a/hw/dma/puv3_dma.c
+++ b/hw/dma/puv3_dma.c
@@ -24,7 +24,8 @@
 
 #define TYPE_PUV3_DMA "puv3_dma"
 typedef struct PUV3DMAState PUV3DMAState;
-#define PUV3_DMA(obj) OBJECT_CHECK(PUV3DMAState, (obj), TYPE_PUV3_DMA)
+DECLARE_INSTANCE_CHECKER(PUV3DMAState, PUV3_DMA,
+                         TYPE_PUV3_DMA)
 
 struct PUV3DMAState {
     SysBusDevice parent_obj;
diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
index 6ae8035831..4f6c0e5e5e 100644
--- a/hw/dma/pxa2xx_dma.c
+++ b/hw/dma/pxa2xx_dma.c
@@ -36,7 +36,8 @@ typedef struct {
 
 #define TYPE_PXA2XX_DMA "pxa2xx-dma"
 typedef struct PXA2xxDMAState PXA2xxDMAState;
-#define PXA2XX_DMA(obj) OBJECT_CHECK(PXA2xxDMAState, (obj), TYPE_PXA2XX_DMA)
+DECLARE_INSTANCE_CHECKER(PXA2xxDMAState, PXA2XX_DMA,
+                         TYPE_PXA2XX_DMA)
 
 struct PXA2xxDMAState {
     SysBusDevice parent_obj;
diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index 7d6eaf5e96..c584815d06 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -57,8 +57,8 @@ typedef struct dma_pagetable_entry {
 
 #define TYPE_RC4030 "rc4030"
 typedef struct rc4030State rc4030State;
-#define RC4030(obj) \
-    OBJECT_CHECK(rc4030State, (obj), TYPE_RC4030)
+DECLARE_INSTANCE_CHECKER(rc4030State, RC4030,
+                         TYPE_RC4030)
 
 #define TYPE_RC4030_IOMMU_MEMORY_REGION "rc4030-iommu-memory-region"
 
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 6d48fea8fe..f313453495 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -44,17 +44,15 @@
 #define TYPE_XILINX_AXI_DMA_CONTROL_STREAM "xilinx-axi-dma-control-stream"
 
 typedef struct XilinxAXIDMA XilinxAXIDMA;
-#define XILINX_AXI_DMA(obj) \
-     OBJECT_CHECK(XilinxAXIDMA, (obj), TYPE_XILINX_AXI_DMA)
+DECLARE_INSTANCE_CHECKER(XilinxAXIDMA, XILINX_AXI_DMA,
+                         TYPE_XILINX_AXI_DMA)
 
 typedef struct XilinxAXIDMAStreamSlave XilinxAXIDMAStreamSlave;
-#define XILINX_AXI_DMA_DATA_STREAM(obj) \
-     OBJECT_CHECK(XilinxAXIDMAStreamSlave, (obj),\
-     TYPE_XILINX_AXI_DMA_DATA_STREAM)
+DECLARE_INSTANCE_CHECKER(XilinxAXIDMAStreamSlave, XILINX_AXI_DMA_DATA_STREAM,
+                         TYPE_XILINX_AXI_DMA_DATA_STREAM)
 
-#define XILINX_AXI_DMA_CONTROL_STREAM(obj) \
-     OBJECT_CHECK(XilinxAXIDMAStreamSlave, (obj),\
-     TYPE_XILINX_AXI_DMA_CONTROL_STREAM)
+DECLARE_INSTANCE_CHECKER(XilinxAXIDMAStreamSlave, XILINX_AXI_DMA_CONTROL_STREAM,
+                         TYPE_XILINX_AXI_DMA_CONTROL_STREAM)
 
 #define R_DMACR             (0x00 / 4)
 #define R_DMASR             (0x04 / 4)
diff --git a/hw/gpio/gpio_key.c b/hw/gpio/gpio_key.c
index 2500a23c6e..86aa78aae4 100644
--- a/hw/gpio/gpio_key.c
+++ b/hw/gpio/gpio_key.c
@@ -32,7 +32,8 @@
 
 #define TYPE_GPIOKEY "gpio-key"
 typedef struct GPIOKEYState GPIOKEYState;
-#define GPIOKEY(obj) OBJECT_CHECK(GPIOKEYState, (obj), TYPE_GPIOKEY)
+DECLARE_INSTANCE_CHECKER(GPIOKEYState, GPIOKEY,
+                         TYPE_GPIOKEY)
 #define GPIO_KEY_LATENCY 100 /* 100ms */
 
 struct GPIOKEYState {
diff --git a/hw/gpio/max7310.c b/hw/gpio/max7310.c
index f87496a74c..4a8b03f239 100644
--- a/hw/gpio/max7310.c
+++ b/hw/gpio/max7310.c
@@ -18,7 +18,8 @@
 
 #define TYPE_MAX7310 "max7310"
 typedef struct MAX7310State MAX7310State;
-#define MAX7310(obj) OBJECT_CHECK(MAX7310State, (obj), TYPE_MAX7310)
+DECLARE_INSTANCE_CHECKER(MAX7310State, MAX7310,
+                         TYPE_MAX7310)
 
 struct MAX7310State {
     I2CSlave parent_obj;
diff --git a/hw/gpio/mpc8xxx.c b/hw/gpio/mpc8xxx.c
index b33462e4db..dac8b1be38 100644
--- a/hw/gpio/mpc8xxx.c
+++ b/hw/gpio/mpc8xxx.c
@@ -28,7 +28,8 @@
 
 #define TYPE_MPC8XXX_GPIO "mpc8xxx_gpio"
 typedef struct MPC8XXXGPIOState MPC8XXXGPIOState;
-#define MPC8XXX_GPIO(obj) OBJECT_CHECK(MPC8XXXGPIOState, (obj), TYPE_MPC8XXX_GPIO)
+DECLARE_INSTANCE_CHECKER(MPC8XXXGPIOState, MPC8XXX_GPIO,
+                         TYPE_MPC8XXX_GPIO)
 
 struct MPC8XXXGPIOState {
     SysBusDevice parent_obj;
diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 6c36407079..3420df0d1f 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -36,7 +36,8 @@ static const uint8_t pl061_id_luminary[12] =
 
 #define TYPE_PL061 "pl061"
 typedef struct PL061State PL061State;
-#define PL061(obj) OBJECT_CHECK(PL061State, (obj), TYPE_PL061)
+DECLARE_INSTANCE_CHECKER(PL061State, PL061,
+                         TYPE_PL061)
 
 #define N_GPIOS 8
 
diff --git a/hw/gpio/puv3_gpio.c b/hw/gpio/puv3_gpio.c
index 5e0ee783dc..98ea2b4c2e 100644
--- a/hw/gpio/puv3_gpio.c
+++ b/hw/gpio/puv3_gpio.c
@@ -20,7 +20,8 @@
 
 #define TYPE_PUV3_GPIO "puv3_gpio"
 typedef struct PUV3GPIOState PUV3GPIOState;
-#define PUV3_GPIO(obj) OBJECT_CHECK(PUV3GPIOState, (obj), TYPE_PUV3_GPIO)
+DECLARE_INSTANCE_CHECKER(PUV3GPIOState, PUV3_GPIO,
+                         TYPE_PUV3_GPIO)
 
 struct PUV3GPIOState {
     SysBusDevice parent_obj;
diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index 048e40c072..3d25c55d06 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -29,7 +29,8 @@
 
 #define TYPE_SCOOP "scoop"
 typedef struct ScoopInfo ScoopInfo;
-#define SCOOP(obj) OBJECT_CHECK(ScoopInfo, (obj), TYPE_SCOOP)
+DECLARE_INSTANCE_CHECKER(ScoopInfo, SCOOP,
+                         TYPE_SCOOP)
 
 struct ScoopInfo {
     SysBusDevice parent_obj;
diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index fa739adc7b..c0c9b8a2b8 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -82,8 +82,8 @@
 #define DINO_MEM_CHUNK_SIZE (8 * MiB)
 
 typedef struct DinoState DinoState;
-#define DINO_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(DinoState, (obj), TYPE_DINO_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(DinoState, DINO_PCI_HOST_BRIDGE,
+                         TYPE_DINO_PCI_HOST_BRIDGE)
 
 #define DINO800_REGS (1 + (DINO_TLTIM - DINO_GMASK) / 4)
 static const uint32_t reg800_keep_bits[DINO800_REGS] = {
diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index 5dfa9d77e1..aa5a2a9bd8 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -38,7 +38,8 @@ struct SynICState {
 typedef struct SynICState SynICState;
 
 #define TYPE_SYNIC "hyperv-synic"
-#define SYNIC(obj) OBJECT_CHECK(SynICState, (obj), TYPE_SYNIC)
+DECLARE_INSTANCE_CHECKER(SynICState, SYNIC,
+                         TYPE_SYNIC)
 
 static bool synic_enabled;
 
diff --git a/hw/hyperv/hyperv_testdev.c b/hw/hyperv/hyperv_testdev.c
index 8f78fce088..f6ee98e00c 100644
--- a/hw/hyperv/hyperv_testdev.c
+++ b/hw/hyperv/hyperv_testdev.c
@@ -50,8 +50,8 @@ struct HypervTestDev {
 typedef struct HypervTestDev HypervTestDev;
 
 #define TYPE_HYPERV_TEST_DEV "hyperv-testdev"
-#define HYPERV_TEST_DEV(obj) \
-        OBJECT_CHECK(HypervTestDev, (obj), TYPE_HYPERV_TEST_DEV)
+DECLARE_INSTANCE_CHECKER(HypervTestDev, HYPERV_TEST_DEV,
+                         TYPE_HYPERV_TEST_DEV)
 
 enum {
     HV_TEST_DEV_SINT_ROUTE_CREATE = 1,
diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index 4ff3c0b4ec..c1b9f298d9 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -164,7 +164,8 @@ void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus)
 
 #define TYPE_GPIO_I2C "gpio_i2c"
 typedef struct GPIOI2CState GPIOI2CState;
-#define GPIO_I2C(obj) OBJECT_CHECK(GPIOI2CState, (obj), TYPE_GPIO_I2C)
+DECLARE_INSTANCE_CHECKER(GPIOI2CState, GPIO_I2C,
+                         TYPE_GPIO_I2C)
 
 struct GPIOI2CState {
     SysBusDevice parent_obj;
diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
index 9d2f780d2a..ff82226e9f 100644
--- a/hw/i2c/exynos4210_i2c.c
+++ b/hw/i2c/exynos4210_i2c.c
@@ -35,8 +35,8 @@
 
 #define TYPE_EXYNOS4_I2C                  "exynos4210.i2c"
 typedef struct Exynos4210I2CState Exynos4210I2CState;
-#define EXYNOS4_I2C(obj)                  \
-    OBJECT_CHECK(Exynos4210I2CState, (obj), TYPE_EXYNOS4_I2C)
+DECLARE_INSTANCE_CHECKER(Exynos4210I2CState, EXYNOS4_I2C,
+                         TYPE_EXYNOS4_I2C)
 
 /* Exynos4210 I2C memory map */
 #define EXYNOS4_I2C_MEM_SIZE              0x14
diff --git a/hw/i2c/mpc_i2c.c b/hw/i2c/mpc_i2c.c
index 232a277da4..156a25a8e9 100644
--- a/hw/i2c/mpc_i2c.c
+++ b/hw/i2c/mpc_i2c.c
@@ -38,8 +38,8 @@
 
 #define TYPE_MPC_I2C "mpc-i2c"
 typedef struct MPCI2CState MPCI2CState;
-#define MPC_I2C(obj) \
-    OBJECT_CHECK(MPCI2CState, (obj), TYPE_MPC_I2C)
+DECLARE_INSTANCE_CHECKER(MPCI2CState, MPC_I2C,
+                         TYPE_MPC_I2C)
 
 #define MPC_I2C_ADR   0x00
 #define MPC_I2C_FDR   0x04
diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
index 4f98012f1c..c6777844cf 100644
--- a/hw/i2c/smbus_eeprom.c
+++ b/hw/i2c/smbus_eeprom.c
@@ -38,8 +38,8 @@
 #define TYPE_SMBUS_EEPROM "smbus-eeprom"
 
 typedef struct SMBusEEPROMDevice SMBusEEPROMDevice;
-#define SMBUS_EEPROM(obj) \
-    OBJECT_CHECK(SMBusEEPROMDevice, (obj), TYPE_SMBUS_EEPROM)
+DECLARE_INSTANCE_CHECKER(SMBusEEPROMDevice, SMBUS_EEPROM,
+                         TYPE_SMBUS_EEPROM)
 
 #define SMBUS_EEPROM_SIZE 256
 
diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index 44d26fcf39..2d4578511d 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -31,8 +31,8 @@
 #include "qom/object.h"
 
 typedef struct ICH9SMBState ICH9SMBState;
-#define ICH9_SMB_DEVICE(obj) \
-     OBJECT_CHECK(ICH9SMBState, (obj), TYPE_ICH9_SMB_DEVICE)
+DECLARE_INSTANCE_CHECKER(ICH9SMBState, ICH9_SMB_DEVICE,
+                         TYPE_ICH9_SMB_DEVICE)
 
 struct ICH9SMBState {
     PCIDevice dev;
diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index 3ab386d671..3a04ba3969 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -30,8 +30,8 @@
 #include "qom/object.h"
 
 typedef ArmSbconI2CState VersatileI2CState;
-#define VERSATILE_I2C(obj) \
-    OBJECT_CHECK(VersatileI2CState, (obj), TYPE_VERSATILE_I2C)
+DECLARE_INSTANCE_CHECKER(VersatileI2CState, VERSATILE_I2C,
+                         TYPE_VERSATILE_I2C)
 
 
 
diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index 94ece445af..37f47540e5 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -33,7 +33,8 @@
 
 #define TYPE_KVM_CLOCK "kvmclock"
 typedef struct KVMClockState KVMClockState;
-#define KVM_CLOCK(obj) OBJECT_CHECK(KVMClockState, (obj), TYPE_KVM_CLOCK)
+DECLARE_INSTANCE_CHECKER(KVMClockState, KVM_CLOCK,
+                         TYPE_KVM_CLOCK)
 
 struct KVMClockState {
     /*< private >*/
diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
index d3e4142b16..e18fd337fa 100644
--- a/hw/i386/kvm/i8254.c
+++ b/hw/i386/kvm/i8254.c
@@ -41,11 +41,8 @@
 
 typedef struct KVMPITClass KVMPITClass;
 typedef struct KVMPITState KVMPITState;
-#define KVM_PIT(obj) OBJECT_CHECK(KVMPITState, (obj), TYPE_KVM_I8254)
-#define KVM_PIT_CLASS(class) \
-    OBJECT_CLASS_CHECK(KVMPITClass, (class), TYPE_KVM_I8254)
-#define KVM_PIT_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(KVMPITClass, (obj), TYPE_KVM_I8254)
+DECLARE_OBJ_CHECKERS(KVMPITState, KVMPITClass,
+                     KVM_PIT, TYPE_KVM_I8254)
 
 struct KVMPITState {
     PITCommonState parent_obj;
diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
index b256f97c83..3f8bf69e9c 100644
--- a/hw/i386/kvm/i8259.c
+++ b/hw/i386/kvm/i8259.c
@@ -21,10 +21,8 @@
 
 #define TYPE_KVM_I8259 "kvm-i8259"
 typedef struct KVMPICClass KVMPICClass;
-#define KVM_PIC_CLASS(class) \
-    OBJECT_CLASS_CHECK(KVMPICClass, (class), TYPE_KVM_I8259)
-#define KVM_PIC_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(KVMPICClass, (obj), TYPE_KVM_I8259)
+DECLARE_CLASS_CHECKERS(KVMPICClass, KVM_PIC,
+                       TYPE_KVM_I8259)
 
 /**
  * KVMPICClass:
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 857d9f4a61..a4e05f086e 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -74,7 +74,8 @@ struct VAPICROMState {
 typedef struct VAPICROMState VAPICROMState;
 
 #define TYPE_VAPIC "kvmvapic"
-#define VAPIC(obj) OBJECT_CHECK(VAPICROMState, (obj), TYPE_VAPIC)
+DECLARE_INSTANCE_CHECKER(VAPICROMState, VAPIC,
+                         TYPE_VAPIC)
 
 #define TPR_INSTR_ABS_MODRM             0x1
 #define TPR_INSTR_MATCH_MODRM_REG       0x2
diff --git a/hw/i386/port92.c b/hw/i386/port92.c
index 48200def5d..c00dcb261b 100644
--- a/hw/i386/port92.c
+++ b/hw/i386/port92.c
@@ -15,7 +15,8 @@
 #include "qom/object.h"
 
 typedef struct Port92State Port92State;
-#define PORT92(obj) OBJECT_CHECK(Port92State, (obj), TYPE_PORT92)
+DECLARE_INSTANCE_CHECKER(Port92State, PORT92,
+                         TYPE_PORT92)
 
 struct Port92State {
     ISADevice parent_obj;
diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index d187de3745..ae4cbc7add 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -52,7 +52,8 @@
 
 #define TYPE_VMMOUSE "vmmouse"
 typedef struct VMMouseState VMMouseState;
-#define VMMOUSE(obj) OBJECT_CHECK(VMMouseState, (obj), TYPE_VMMOUSE)
+DECLARE_INSTANCE_CHECKER(VMMouseState, VMMOUSE,
+                         TYPE_VMMOUSE)
 
 struct VMMouseState {
     ISADevice parent_obj;
diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index 3720834630..df52b6f903 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -64,7 +64,8 @@
 #define VCPU_INFO_RESERVED_BIT          31
 
 typedef struct VMPortState VMPortState;
-#define VMPORT(obj) OBJECT_CHECK(VMPortState, (obj), TYPE_VMPORT)
+DECLARE_INSTANCE_CHECKER(VMPortState, VMPORT,
+                         TYPE_VMPORT)
 
 struct VMPortState {
     ISADevice parent_obj;
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index e8dbd580c5..a8bbe8c833 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -72,8 +72,8 @@ struct PCIXenPlatformState {
 typedef struct PCIXenPlatformState PCIXenPlatformState;
 
 #define TYPE_XEN_PLATFORM "xen-platform"
-#define XEN_PLATFORM(obj) \
-    OBJECT_CHECK(PCIXenPlatformState, (obj), TYPE_XEN_PLATFORM)
+DECLARE_INSTANCE_CHECKER(PCIXenPlatformState, XEN_PLATFORM,
+                         TYPE_XEN_PLATFORM)
 
 #define XEN_PLATFORM_IOPORT 0x10
 
diff --git a/hw/i386/xen/xen_pvdevice.c b/hw/i386/xen/xen_pvdevice.c
index 518c66d0bf..67f83616d3 100644
--- a/hw/i386/xen/xen_pvdevice.c
+++ b/hw/i386/xen/xen_pvdevice.c
@@ -41,8 +41,8 @@
 #define TYPE_XEN_PV_DEVICE  "xen-pvdevice"
 
 typedef struct XenPVDevice XenPVDevice;
-#define XEN_PV_DEVICE(obj) \
-     OBJECT_CHECK(XenPVDevice, (obj), TYPE_XEN_PV_DEVICE)
+DECLARE_INSTANCE_CHECKER(XenPVDevice, XEN_PV_DEVICE,
+                         TYPE_XEN_PV_DEVICE)
 
 struct XenPVDevice {
     /*< private >*/
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 438f74e67c..9a3489691b 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -39,7 +39,8 @@
 
 #define TYPE_ISA_IDE "isa-ide"
 typedef struct ISAIDEState ISAIDEState;
-#define ISA_IDE(obj) OBJECT_CHECK(ISAIDEState, (obj), TYPE_ISA_IDE)
+DECLARE_INSTANCE_CHECKER(ISAIDEState, ISA_IDE,
+                         TYPE_ISA_IDE)
 
 struct ISAIDEState {
     ISADevice parent_obj;
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 28f171bf15..6e7f5df901 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -35,7 +35,8 @@
 
 #define TYPE_MICRODRIVE "microdrive"
 typedef struct MicroDriveState MicroDriveState;
-#define MICRODRIVE(obj) OBJECT_CHECK(MicroDriveState, (obj), TYPE_MICRODRIVE)
+DECLARE_INSTANCE_CHECKER(MicroDriveState, MICRODRIVE,
+                         TYPE_MICRODRIVE)
 
 /***********************************************************/
 /* CF-ATA Microdrive */
diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index 501afdfaaa..4bf6e3a8b7 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -41,7 +41,8 @@
 
 #define TYPE_MMIO_IDE "mmio-ide"
 typedef struct MMIOIDEState MMIOState;
-#define MMIO_IDE(obj) OBJECT_CHECK(MMIOState, (obj), TYPE_MMIO_IDE)
+DECLARE_INSTANCE_CHECKER(MMIOState, MMIO_IDE,
+                         TYPE_MMIO_IDE)
 
 struct MMIOIDEState {
     /*< private >*/
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 11c5b88bbf..968c239ab8 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -20,7 +20,7 @@
 
 #define TYPE_SII3112_PCI "sii3112"
 typedef struct SiI3112PCIState SiI3112PCIState;
-#define SII3112_PCI(obj) OBJECT_CHECK(SiI3112PCIState, (obj), \
+DECLARE_INSTANCE_CHECKER(SiI3112PCIState, SII3112_PCI,
                          TYPE_SII3112_PCI)
 
 typedef struct SiI3112Regs {
diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
index a439bf6361..fe0c363d64 100644
--- a/hw/input/adb-kbd.c
+++ b/hw/input/adb-kbd.c
@@ -34,7 +34,8 @@
 
 typedef struct ADBKeyboardClass ADBKeyboardClass;
 typedef struct KBDState KBDState;
-#define ADB_KEYBOARD(obj) OBJECT_CHECK(KBDState, (obj), TYPE_ADB_KEYBOARD)
+DECLARE_OBJ_CHECKERS(KBDState, ADBKeyboardClass,
+                     ADB_KEYBOARD, TYPE_ADB_KEYBOARD)
 
 struct KBDState {
     /*< private >*/
@@ -45,10 +46,6 @@ struct KBDState {
     int rptr, wptr, count;
 };
 
-#define ADB_KEYBOARD_CLASS(class) \
-    OBJECT_CLASS_CHECK(ADBKeyboardClass, (class), TYPE_ADB_KEYBOARD)
-#define ADB_KEYBOARD_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(ADBKeyboardClass, (obj), TYPE_ADB_KEYBOARD)
 
 struct ADBKeyboardClass {
     /*< private >*/
diff --git a/hw/input/adb-mouse.c b/hw/input/adb-mouse.c
index 8e4cf470d4..f5750909b4 100644
--- a/hw/input/adb-mouse.c
+++ b/hw/input/adb-mouse.c
@@ -33,7 +33,8 @@
 
 typedef struct ADBMouseClass ADBMouseClass;
 typedef struct MouseState MouseState;
-#define ADB_MOUSE(obj) OBJECT_CHECK(MouseState, (obj), TYPE_ADB_MOUSE)
+DECLARE_OBJ_CHECKERS(MouseState, ADBMouseClass,
+                     ADB_MOUSE, TYPE_ADB_MOUSE)
 
 struct MouseState {
     /*< public >*/
@@ -44,10 +45,6 @@ struct MouseState {
     int dx, dy, dz;
 };
 
-#define ADB_MOUSE_CLASS(class) \
-    OBJECT_CLASS_CHECK(ADBMouseClass, (class), TYPE_ADB_MOUSE)
-#define ADB_MOUSE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(ADBMouseClass, (obj), TYPE_ADB_MOUSE)
 
 struct ADBMouseClass {
     /*< public >*/
diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index aab94d2815..70245fd817 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -29,7 +29,8 @@
 
 #define TYPE_LM8323 "lm8323"
 typedef struct LM823KbdState LM823KbdState;
-#define LM8323(obj) OBJECT_CHECK(LM823KbdState, (obj), TYPE_LM8323)
+DECLARE_INSTANCE_CHECKER(LM823KbdState, LM8323,
+                         TYPE_LM8323)
 
 struct LM823KbdState {
     I2CSlave parent_obj;
diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb.c
index 8b5ffd28f2..eaaf8adde4 100644
--- a/hw/input/milkymist-softusb.c
+++ b/hw/input/milkymist-softusb.c
@@ -52,8 +52,8 @@ enum {
 
 #define TYPE_MILKYMIST_SOFTUSB "milkymist-softusb"
 typedef struct MilkymistSoftUsbState MilkymistSoftUsbState;
-#define MILKYMIST_SOFTUSB(obj) \
-    OBJECT_CHECK(MilkymistSoftUsbState, (obj), TYPE_MILKYMIST_SOFTUSB)
+DECLARE_INSTANCE_CHECKER(MilkymistSoftUsbState, MILKYMIST_SOFTUSB,
+                         TYPE_MILKYMIST_SOFTUSB)
 
 struct MilkymistSoftUsbState {
     SysBusDevice parent_obj;
diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 8eb6866953..7c53ae97da 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -18,7 +18,8 @@
 
 #define TYPE_PL050 "pl050"
 typedef struct PL050State PL050State;
-#define PL050(obj) OBJECT_CHECK(PL050State, (obj), TYPE_PL050)
+DECLARE_INSTANCE_CHECKER(PL050State, PL050,
+                         TYPE_PL050)
 
 struct PL050State {
     SysBusDevice parent_obj;
diff --git a/hw/intc/arm_gicv2m.c b/hw/intc/arm_gicv2m.c
index 8fb566d187..04d7a6d68b 100644
--- a/hw/intc/arm_gicv2m.c
+++ b/hw/intc/arm_gicv2m.c
@@ -38,7 +38,8 @@
 
 #define TYPE_ARM_GICV2M "arm-gicv2m"
 typedef struct ARMGICv2mState ARMGICv2mState;
-#define ARM_GICV2M(obj) OBJECT_CHECK(ARMGICv2mState, (obj), TYPE_ARM_GICV2M)
+DECLARE_INSTANCE_CHECKER(ARMGICv2mState, ARM_GICV2M,
+                         TYPE_ARM_GICV2M)
 
 #define GICV2M_NUM_SPI_MAX 128
 
diff --git a/hw/intc/etraxfs_pic.c b/hw/intc/etraxfs_pic.c
index cf4b3c5850..54ed4c77f7 100644
--- a/hw/intc/etraxfs_pic.c
+++ b/hw/intc/etraxfs_pic.c
@@ -39,8 +39,8 @@
 #define R_MAX       5
 
 #define TYPE_ETRAX_FS_PIC "etraxfs,pic"
-#define ETRAX_FS_PIC(obj) \
-    OBJECT_CHECK(struct etrax_pic, (obj), TYPE_ETRAX_FS_PIC)
+DECLARE_INSTANCE_CHECKER(struct etrax_pic, ETRAX_FS_PIC,
+                         TYPE_ETRAX_FS_PIC)
 
 struct etrax_pic
 {
diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index fd1fa96099..b14c958919 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -65,8 +65,8 @@ typedef struct CombinerGroupState {
 
 #define TYPE_EXYNOS4210_COMBINER "exynos4210.combiner"
 typedef struct Exynos4210CombinerState Exynos4210CombinerState;
-#define EXYNOS4210_COMBINER(obj) \
-    OBJECT_CHECK(Exynos4210CombinerState, (obj), TYPE_EXYNOS4210_COMBINER)
+DECLARE_INSTANCE_CHECKER(Exynos4210CombinerState, EXYNOS4210_COMBINER,
+                         TYPE_EXYNOS4210_COMBINER)
 
 struct Exynos4210CombinerState {
     SysBusDevice parent_obj;
diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index ded31466ce..f9487673fc 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -266,8 +266,8 @@ uint32_t exynos4210_get_irq(uint32_t grp, uint32_t bit)
 
 #define TYPE_EXYNOS4210_GIC "exynos4210.gic"
 typedef struct Exynos4210GicState Exynos4210GicState;
-#define EXYNOS4210_GIC(obj) \
-    OBJECT_CHECK(Exynos4210GicState, (obj), TYPE_EXYNOS4210_GIC)
+DECLARE_INSTANCE_CHECKER(Exynos4210GicState, EXYNOS4210_GIC,
+                         TYPE_EXYNOS4210_GIC)
 
 struct Exynos4210GicState {
     SysBusDevice parent_obj;
@@ -385,8 +385,8 @@ type_init(exynos4210_gic_register_types)
 
 #define TYPE_EXYNOS4210_IRQ_GATE "exynos4210.irq_gate"
 typedef struct Exynos4210IRQGateState Exynos4210IRQGateState;
-#define EXYNOS4210_IRQ_GATE(obj) \
-    OBJECT_CHECK(Exynos4210IRQGateState, (obj), TYPE_EXYNOS4210_IRQ_GATE)
+DECLARE_INSTANCE_CHECKER(Exynos4210IRQGateState, EXYNOS4210_IRQ_GATE,
+                         TYPE_EXYNOS4210_IRQ_GATE)
 
 struct Exynos4210IRQGateState {
     SysBusDevice parent_obj;
diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index 5a60396390..9b34a8ae03 100644
--- a/hw/intc/grlib_irqmp.c
+++ b/hw/intc/grlib_irqmp.c
@@ -52,7 +52,8 @@
 #define EXTENDED_OFFSET  0xC0
 
 typedef struct IRQMP IRQMP;
-#define GRLIB_IRQMP(obj) OBJECT_CHECK(IRQMP, (obj), TYPE_GRLIB_IRQMP)
+DECLARE_INSTANCE_CHECKER(IRQMP, GRLIB_IRQMP,
+                         TYPE_GRLIB_IRQMP)
 
 typedef struct IRQMPState IRQMPState;
 
diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 9663207d34..344fd04db1 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -39,8 +39,8 @@
 
 #define TYPE_I8259 "isa-i8259"
 typedef struct PICClass PICClass;
-#define PIC_CLASS(class) OBJECT_CLASS_CHECK(PICClass, (class), TYPE_I8259)
-#define PIC_GET_CLASS(obj) OBJECT_GET_CLASS(PICClass, (obj), TYPE_I8259)
+DECLARE_CLASS_CHECKERS(PICClass, PIC,
+                       TYPE_I8259)
 
 /**
  * PICClass:
diff --git a/hw/intc/lm32_pic.c b/hw/intc/lm32_pic.c
index b08d9822ab..e8b4015efd 100644
--- a/hw/intc/lm32_pic.c
+++ b/hw/intc/lm32_pic.c
@@ -31,7 +31,8 @@
 
 #define TYPE_LM32_PIC "lm32-pic"
 typedef struct LM32PicState LM32PicState;
-#define LM32_PIC(obj) OBJECT_CHECK(LM32PicState, (obj), TYPE_LM32_PIC)
+DECLARE_INSTANCE_CHECKER(LM32PicState, LM32_PIC,
+                         TYPE_LM32_PIC)
 
 struct LM32PicState {
     SysBusDevice parent_obj;
diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
index e11ca68647..30fb375b72 100644
--- a/hw/intc/loongson_liointc.c
+++ b/hw/intc/loongson_liointc.c
@@ -44,8 +44,8 @@
 #define R_END                   0x64
 
 #define TYPE_LOONGSON_LIOINTC "loongson.liointc"
-#define LOONGSON_LIOINTC(obj) \
-        OBJECT_CHECK(struct loongson_liointc, (obj), TYPE_LOONGSON_LIOINTC)
+DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
+                         TYPE_LOONGSON_LIOINTC)
 
 struct loongson_liointc {
     SysBusDevice parent_obj;
diff --git a/hw/intc/nios2_iic.c b/hw/intc/nios2_iic.c
index 2594381a95..aa26f059a1 100644
--- a/hw/intc/nios2_iic.c
+++ b/hw/intc/nios2_iic.c
@@ -29,8 +29,8 @@
 
 #define TYPE_ALTERA_IIC "altera,iic"
 typedef struct AlteraIIC AlteraIIC;
-#define ALTERA_IIC(obj) \
-    OBJECT_CHECK(AlteraIIC, (obj), TYPE_ALTERA_IIC)
+DECLARE_INSTANCE_CHECKER(AlteraIIC, ALTERA_IIC,
+                         TYPE_ALTERA_IIC)
 
 struct AlteraIIC {
     SysBusDevice  parent_obj;
diff --git a/hw/intc/ompic.c b/hw/intc/ompic.c
index 8dd763d6c5..a8ea621d9e 100644
--- a/hw/intc/ompic.c
+++ b/hw/intc/ompic.c
@@ -19,7 +19,8 @@
 
 #define TYPE_OR1K_OMPIC "or1k-ompic"
 typedef struct OR1KOMPICState OR1KOMPICState;
-#define OR1K_OMPIC(obj) OBJECT_CHECK(OR1KOMPICState, (obj), TYPE_OR1K_OMPIC)
+DECLARE_INSTANCE_CHECKER(OR1KOMPICState, OR1K_OMPIC,
+                         TYPE_OR1K_OMPIC)
 
 #define OMPIC_CTRL_IRQ_ACK  (1 << 31)
 #define OMPIC_CTRL_IRQ_GEN  (1 << 30)
diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
index 3f5891a8a1..8c8fbeddfe 100644
--- a/hw/intc/openpic_kvm.c
+++ b/hw/intc/openpic_kvm.c
@@ -40,8 +40,8 @@
 #define GCR_RESET        0x80000000
 
 typedef struct KVMOpenPICState KVMOpenPICState;
-#define KVM_OPENPIC(obj) \
-    OBJECT_CHECK(KVMOpenPICState, (obj), TYPE_KVM_OPENPIC)
+DECLARE_INSTANCE_CHECKER(KVMOpenPICState, KVM_OPENPIC,
+                         TYPE_KVM_OPENPIC)
 
 struct KVMOpenPICState {
     /*< private >*/
diff --git a/hw/intc/pl190.c b/hw/intc/pl190.c
index 4f2aa58642..ee3206132f 100644
--- a/hw/intc/pl190.c
+++ b/hw/intc/pl190.c
@@ -23,7 +23,8 @@
 
 #define TYPE_PL190 "pl190"
 typedef struct PL190State PL190State;
-#define PL190(obj) OBJECT_CHECK(PL190State, (obj), TYPE_PL190)
+DECLARE_INSTANCE_CHECKER(PL190State, PL190,
+                         TYPE_PL190)
 
 struct PL190State {
     SysBusDevice parent_obj;
diff --git a/hw/intc/puv3_intc.c b/hw/intc/puv3_intc.c
index 3a8bc154ba..8bceede256 100644
--- a/hw/intc/puv3_intc.c
+++ b/hw/intc/puv3_intc.c
@@ -21,7 +21,8 @@
 
 #define TYPE_PUV3_INTC "puv3_intc"
 typedef struct PUV3INTCState PUV3INTCState;
-#define PUV3_INTC(obj) OBJECT_CHECK(PUV3INTCState, (obj), TYPE_PUV3_INTC)
+DECLARE_INSTANCE_CHECKER(PUV3INTCState, PUV3_INTC,
+                         TYPE_PUV3_INTC)
 
 struct PUV3INTCState {
     SysBusDevice parent_obj;
diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
index c4ae10d978..35d91afa55 100644
--- a/hw/intc/s390_flic_kvm.c
+++ b/hw/intc/s390_flic_kvm.c
@@ -576,11 +576,9 @@ struct KVMS390FLICStateClass {
 };
 typedef struct KVMS390FLICStateClass KVMS390FLICStateClass;
 
-#define KVM_S390_FLIC_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(KVMS390FLICStateClass, (obj), TYPE_KVM_S390_FLIC)
+DECLARE_CLASS_CHECKERS(KVMS390FLICStateClass, KVM_S390_FLIC,
+                       TYPE_KVM_S390_FLIC)
 
-#define KVM_S390_FLIC_CLASS(klass) \
-    OBJECT_CLASS_CHECK(KVMS390FLICStateClass, (klass), TYPE_KVM_S390_FLIC)
 
 static void kvm_s390_flic_realize(DeviceState *dev, Error **errp)
 {
diff --git a/hw/intc/slavio_intctl.c b/hw/intc/slavio_intctl.c
index 7675556868..4a72ef5d0d 100644
--- a/hw/intc/slavio_intctl.c
+++ b/hw/intc/slavio_intctl.c
@@ -60,8 +60,8 @@ typedef struct SLAVIO_CPUINTCTLState {
 
 #define TYPE_SLAVIO_INTCTL "slavio_intctl"
 typedef struct SLAVIO_INTCTLState SLAVIO_INTCTLState;
-#define SLAVIO_INTCTL(obj) \
-    OBJECT_CHECK(SLAVIO_INTCTLState, (obj), TYPE_SLAVIO_INTCTL)
+DECLARE_INSTANCE_CHECKER(SLAVIO_INTCTLState, SLAVIO_INTCTL,
+                         TYPE_SLAVIO_INTCTL)
 
 struct SLAVIO_INTCTLState {
     SysBusDevice parent_obj;
diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
index ed1c2bcfb8..4c4397b3d2 100644
--- a/hw/intc/xilinx_intc.c
+++ b/hw/intc/xilinx_intc.c
@@ -42,7 +42,8 @@
 #define R_MAX       8
 
 #define TYPE_XILINX_INTC "xlnx.xps-intc"
-#define XILINX_INTC(obj) OBJECT_CHECK(struct xlx_pic, (obj), TYPE_XILINX_INTC)
+DECLARE_INSTANCE_CHECKER(struct xlx_pic, XILINX_INTC,
+                         TYPE_XILINX_INTC)
 
 struct xlx_pic
 {
diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
index 81d3521d8f..b35e1d2ac4 100644
--- a/hw/ipack/tpci200.c
+++ b/hw/ipack/tpci200.c
@@ -73,8 +73,8 @@ typedef struct TPCI200State TPCI200State;
 
 #define TYPE_TPCI200 "tpci200"
 
-#define TPCI200(obj) \
-    OBJECT_CHECK(TPCI200State, (obj), TYPE_TPCI200)
+DECLARE_INSTANCE_CHECKER(TPCI200State, TPCI200,
+                         TYPE_TPCI200)
 
 static const uint8_t local_config_regs[] = {
     0x00, 0xFF, 0xFF, 0x0F, 0x00, 0xFC, 0xFF, 0x0F, 0x00, 0x00, 0x00,
diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index 018667e0ca..159831cbc5 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -63,8 +63,8 @@
 
 #define TYPE_IPMI_BMC_EXTERN "ipmi-bmc-extern"
 typedef struct IPMIBmcExtern IPMIBmcExtern;
-#define IPMI_BMC_EXTERN(obj) OBJECT_CHECK(IPMIBmcExtern, (obj), \
-                                        TYPE_IPMI_BMC_EXTERN)
+DECLARE_INSTANCE_CHECKER(IPMIBmcExtern, IPMI_BMC_EXTERN,
+                         TYPE_IPMI_BMC_EXTERN)
 struct IPMIBmcExtern {
     IPMIBmc parent;
 
diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index 90b3ba1232..0b69acc2e9 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -35,8 +35,8 @@
 
 #define TYPE_ISA_IPMI_BT "isa-ipmi-bt"
 typedef struct ISAIPMIBTDevice ISAIPMIBTDevice;
-#define ISA_IPMI_BT(obj) OBJECT_CHECK(ISAIPMIBTDevice, (obj), \
-                                      TYPE_ISA_IPMI_BT)
+DECLARE_INSTANCE_CHECKER(ISAIPMIBTDevice, ISA_IPMI_BT,
+                         TYPE_ISA_IPMI_BT)
 
 struct ISAIPMIBTDevice {
     ISADevice dev;
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index ac7caa26ec..af69e9a008 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -35,8 +35,8 @@
 
 #define TYPE_ISA_IPMI_KCS "isa-ipmi-kcs"
 typedef struct ISAIPMIKCSDevice ISAIPMIKCSDevice;
-#define ISA_IPMI_KCS(obj) OBJECT_CHECK(ISAIPMIKCSDevice, (obj), \
-                                       TYPE_ISA_IPMI_KCS)
+DECLARE_INSTANCE_CHECKER(ISAIPMIKCSDevice, ISA_IPMI_KCS,
+                         TYPE_ISA_IPMI_KCS)
 
 struct ISAIPMIKCSDevice {
     ISADevice dev;
diff --git a/hw/ipmi/pci_ipmi_bt.c b/hw/ipmi/pci_ipmi_bt.c
index cfc7275042..7e5ecea6cc 100644
--- a/hw/ipmi/pci_ipmi_bt.c
+++ b/hw/ipmi/pci_ipmi_bt.c
@@ -30,8 +30,8 @@
 
 #define TYPE_PCI_IPMI_BT "pci-ipmi-bt"
 typedef struct PCIIPMIBTDevice PCIIPMIBTDevice;
-#define PCI_IPMI_BT(obj) OBJECT_CHECK(PCIIPMIBTDevice, (obj), \
-                                       TYPE_PCI_IPMI_BT)
+DECLARE_INSTANCE_CHECKER(PCIIPMIBTDevice, PCI_IPMI_BT,
+                         TYPE_PCI_IPMI_BT)
 
 struct PCIIPMIBTDevice {
     PCIDevice dev;
diff --git a/hw/ipmi/pci_ipmi_kcs.c b/hw/ipmi/pci_ipmi_kcs.c
index e4a1603d4e..c2a283a982 100644
--- a/hw/ipmi/pci_ipmi_kcs.c
+++ b/hw/ipmi/pci_ipmi_kcs.c
@@ -30,8 +30,8 @@
 
 #define TYPE_PCI_IPMI_KCS "pci-ipmi-kcs"
 typedef struct PCIIPMIKCSDevice PCIIPMIKCSDevice;
-#define PCI_IPMI_KCS(obj) OBJECT_CHECK(PCIIPMIKCSDevice, (obj), \
-                                       TYPE_PCI_IPMI_KCS)
+DECLARE_INSTANCE_CHECKER(PCIIPMIKCSDevice, PCI_IPMI_KCS,
+                         TYPE_PCI_IPMI_KCS)
 
 struct PCIIPMIKCSDevice {
     PCIDevice dev;
diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
index baa8389331..cd4c05dd1b 100644
--- a/hw/ipmi/smbus_ipmi.c
+++ b/hw/ipmi/smbus_ipmi.c
@@ -31,7 +31,8 @@
 
 #define TYPE_SMBUS_IPMI "smbus-ipmi"
 typedef struct SMBusIPMIDevice SMBusIPMIDevice;
-#define SMBUS_IPMI(obj) OBJECT_CHECK(SMBusIPMIDevice, (obj), TYPE_SMBUS_IPMI)
+DECLARE_INSTANCE_CHECKER(SMBusIPMIDevice, SMBUS_IPMI,
+                         TYPE_SMBUS_IPMI)
 
 #define SSIF_IPMI_REQUEST                       2
 #define SSIF_IPMI_MULTI_PART_REQUEST_START      6
diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 4060d22c07..1dcf525f3f 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -28,8 +28,8 @@
 
 #define TYPE_I82378 "i82378"
 typedef struct I82378State I82378State;
-#define I82378(obj) \
-    OBJECT_CHECK(I82378State, (obj), TYPE_I82378)
+DECLARE_INSTANCE_CHECKER(I82378State, I82378,
+                         TYPE_I82378)
 
 struct I82378State {
     PCIDevice parent_obj;
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index fdbc20e30a..8e3ac845b8 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -54,8 +54,8 @@ struct PIIX4State {
 };
 typedef struct PIIX4State PIIX4State;
 
-#define PIIX4_PCI_DEVICE(obj) \
-    OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)
+DECLARE_INSTANCE_CHECKER(PIIX4State, PIIX4_PCI_DEVICE,
+                         TYPE_PIIX4_PCI_DEVICE)
 
 static void piix4_isa_reset(DeviceState *dev)
 {
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 24047538d0..1e6b48b2a2 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -51,8 +51,8 @@ struct VT82C686BState {
 typedef struct VT82C686BState VT82C686BState;
 
 #define TYPE_VT82C686B_DEVICE "VT82C686B"
-#define VT82C686B_DEVICE(obj) \
-    OBJECT_CHECK(VT82C686BState, (obj), TYPE_VT82C686B_DEVICE)
+DECLARE_INSTANCE_CHECKER(VT82C686BState, VT82C686B_DEVICE,
+                         TYPE_VT82C686B_DEVICE)
 
 static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
                                   unsigned size)
@@ -182,16 +182,16 @@ struct VT686MC97State {
 typedef struct VT686MC97State VT686MC97State;
 
 #define TYPE_VT82C686B_PM_DEVICE "VT82C686B_PM"
-#define VT82C686B_PM_DEVICE(obj) \
-    OBJECT_CHECK(VT686PMState, (obj), TYPE_VT82C686B_PM_DEVICE)
+DECLARE_INSTANCE_CHECKER(VT686PMState, VT82C686B_PM_DEVICE,
+                         TYPE_VT82C686B_PM_DEVICE)
 
 #define TYPE_VT82C686B_MC97_DEVICE "VT82C686B_MC97"
-#define VT82C686B_MC97_DEVICE(obj) \
-    OBJECT_CHECK(VT686MC97State, (obj), TYPE_VT82C686B_MC97_DEVICE)
+DECLARE_INSTANCE_CHECKER(VT686MC97State, VT82C686B_MC97_DEVICE,
+                         TYPE_VT82C686B_MC97_DEVICE)
 
 #define TYPE_VT82C686B_AC97_DEVICE "VT82C686B_AC97"
-#define VT82C686B_AC97_DEVICE(obj) \
-    OBJECT_CHECK(VT686AC97State, (obj), TYPE_VT82C686B_AC97_DEVICE)
+DECLARE_INSTANCE_CHECKER(VT686AC97State, VT82C686B_AC97_DEVICE,
+                         TYPE_VT82C686B_AC97_DEVICE)
 
 static void pm_update_sci(VT686PMState *s)
 {
diff --git a/hw/m68k/mcf_intc.c b/hw/m68k/mcf_intc.c
index e628567cf3..7ee447240b 100644
--- a/hw/m68k/mcf_intc.c
+++ b/hw/m68k/mcf_intc.c
@@ -19,7 +19,8 @@
 
 #define TYPE_MCF_INTC "mcf-intc"
 typedef struct mcf_intc_state mcf_intc_state;
-#define MCF_INTC(obj) OBJECT_CHECK(mcf_intc_state, (obj), TYPE_MCF_INTC)
+DECLARE_INSTANCE_CHECKER(mcf_intc_state, MCF_INTC,
+                         TYPE_MCF_INTC)
 
 struct mcf_intc_state {
     SysBusDevice parent_obj;
diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 25168c449f..cbd913b0a2 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -39,7 +39,8 @@
 
 #define TYPE_NEXT_MACHINE MACHINE_TYPE_NAME("next-cube")
 typedef struct NeXTState NeXTState;
-#define NEXT_MACHINE(obj) OBJECT_CHECK(NeXTState, (obj), TYPE_NEXT_MACHINE)
+DECLARE_INSTANCE_CHECKER(NeXTState, NEXT_MACHINE,
+                         TYPE_NEXT_MACHINE)
 
 #define ENTRY       0x0100001e
 #define RAM_SIZE    0x4000000
diff --git a/hw/m68k/next-kbd.c b/hw/m68k/next-kbd.c
index a6316314ea..c7ca3fbbc9 100644
--- a/hw/m68k/next-kbd.c
+++ b/hw/m68k/next-kbd.c
@@ -39,7 +39,8 @@
 #include "qom/object.h"
 
 typedef struct NextKBDState NextKBDState;
-#define NEXTKBD(obj) OBJECT_CHECK(NextKBDState, (obj), TYPE_NEXTKBD)
+DECLARE_INSTANCE_CHECKER(NextKBDState, NEXTKBD,
+                         TYPE_NEXTKBD)
 
 /* following defintions from next68k netbsd */
 #define CSR_INT 0x00800000
diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index f679aeee0d..ab9924bf20 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -30,8 +30,8 @@
 
 #define TYPE_XLNX_ZYNQMP_PMU_SOC "xlnx,zynqmp-pmu-soc"
 typedef struct XlnxZynqMPPMUSoCState XlnxZynqMPPMUSoCState;
-#define XLNX_ZYNQMP_PMU_SOC(obj) OBJECT_CHECK(XlnxZynqMPPMUSoCState, (obj), \
-                                              TYPE_XLNX_ZYNQMP_PMU_SOC)
+DECLARE_INSTANCE_CHECKER(XlnxZynqMPPMUSoCState, XLNX_ZYNQMP_PMU_SOC,
+                         TYPE_XLNX_ZYNQMP_PMU_SOC)
 
 #define XLNX_ZYNQMP_PMU_ROM_SIZE    0x8000
 #define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index e2c35b4fd8..1b3f69e949 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -45,7 +45,8 @@
 
 #define TYPE_MIPS_BOSTON "mips-boston"
 typedef struct BostonState BostonState;
-#define BOSTON(obj) OBJECT_CHECK(BostonState, (obj), TYPE_MIPS_BOSTON)
+DECLARE_INSTANCE_CHECKER(BostonState, BOSTON,
+                         TYPE_MIPS_BOSTON)
 
 struct BostonState {
     SysBusDevice parent_obj;
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index bd7ec182fb..b613e1e011 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -232,8 +232,8 @@
 #define TYPE_GT64120_PCI_HOST_BRIDGE "gt64120"
 
 typedef struct GT64120State GT64120State;
-#define GT64120_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(GT64120State, (obj), TYPE_GT64120_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(GT64120State, GT64120_PCI_HOST_BRIDGE,
+                         TYPE_GT64120_PCI_HOST_BRIDGE)
 
 struct GT64120State {
     PCIHostState parent_obj;
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 86ae544104..5b73ea4692 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -90,7 +90,8 @@ typedef struct {
 
 #define TYPE_MIPS_MALTA "mips-malta"
 typedef struct MaltaState MaltaState;
-#define MIPS_MALTA(obj) OBJECT_CHECK(MaltaState, (obj), TYPE_MIPS_MALTA)
+DECLARE_INSTANCE_CHECKER(MaltaState, MIPS_MALTA,
+                         TYPE_MIPS_MALTA)
 
 struct MaltaState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index e3c7b1765c..dca3fba028 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -91,7 +91,8 @@ struct AppleSMCData {
 };
 
 typedef struct AppleSMCState AppleSMCState;
-#define APPLE_SMC(obj) OBJECT_CHECK(AppleSMCState, (obj), TYPE_APPLE_SMC)
+DECLARE_INSTANCE_CHECKER(AppleSMCState, APPLE_SMC,
+                         TYPE_APPLE_SMC)
 
 struct AppleSMCState {
     ISADevice parent_obj;
diff --git a/hw/misc/arm_integrator_debug.c b/hw/misc/arm_integrator_debug.c
index 4ad2b6a98b..822deffc0c 100644
--- a/hw/misc/arm_integrator_debug.c
+++ b/hw/misc/arm_integrator_debug.c
@@ -22,8 +22,8 @@
 #include "qom/object.h"
 
 typedef struct IntegratorDebugState IntegratorDebugState;
-#define INTEGRATOR_DEBUG(obj) \
-    OBJECT_CHECK(IntegratorDebugState, (obj), TYPE_INTEGRATOR_DEBUG)
+DECLARE_INSTANCE_CHECKER(IntegratorDebugState, INTEGRATOR_DEBUG,
+                         TYPE_INTEGRATOR_DEBUG)
 
 struct IntegratorDebugState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/arm_l2x0.c b/hw/misc/arm_l2x0.c
index f75d7988cc..93948c3bd8 100644
--- a/hw/misc/arm_l2x0.c
+++ b/hw/misc/arm_l2x0.c
@@ -31,7 +31,8 @@
 
 #define TYPE_ARM_L2X0 "l2x0"
 typedef struct L2x0State L2x0State;
-#define ARM_L2X0(obj) OBJECT_CHECK(L2x0State, (obj), TYPE_ARM_L2X0)
+DECLARE_INSTANCE_CHECKER(L2x0State, ARM_L2X0,
+                         TYPE_ARM_L2X0)
 
 struct L2x0State {
     SysBusDevice parent_obj;
diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
index a3faa516d6..f0f49e76e8 100644
--- a/hw/misc/arm_sysctl.c
+++ b/hw/misc/arm_sysctl.c
@@ -24,8 +24,8 @@
 
 #define TYPE_ARM_SYSCTL "realview_sysctl"
 typedef struct arm_sysctl_state arm_sysctl_state;
-#define ARM_SYSCTL(obj) \
-    OBJECT_CHECK(arm_sysctl_state, (obj), TYPE_ARM_SYSCTL)
+DECLARE_INSTANCE_CHECKER(arm_sysctl_state, ARM_SYSCTL,
+                         TYPE_ARM_SYSCTL)
 
 struct arm_sysctl_state {
     SysBusDevice parent_obj;
diff --git a/hw/misc/debugexit.c b/hw/misc/debugexit.c
index 6c1f9adc38..c6b0cffd77 100644
--- a/hw/misc/debugexit.c
+++ b/hw/misc/debugexit.c
@@ -15,8 +15,8 @@
 
 #define TYPE_ISA_DEBUG_EXIT_DEVICE "isa-debug-exit"
 typedef struct ISADebugExitState ISADebugExitState;
-#define ISA_DEBUG_EXIT_DEVICE(obj) \
-     OBJECT_CHECK(ISADebugExitState, (obj), TYPE_ISA_DEBUG_EXIT_DEVICE)
+DECLARE_INSTANCE_CHECKER(ISADebugExitState, ISA_DEBUG_EXIT_DEVICE,
+                         TYPE_ISA_DEBUG_EXIT_DEVICE)
 
 struct ISADebugExitState {
     ISADevice parent_obj;
diff --git a/hw/misc/eccmemctl.c b/hw/misc/eccmemctl.c
index 47bec04c8e..468c2a491d 100644
--- a/hw/misc/eccmemctl.c
+++ b/hw/misc/eccmemctl.c
@@ -128,7 +128,8 @@
 
 #define TYPE_ECC_MEMCTL "eccmemctl"
 typedef struct ECCState ECCState;
-#define ECC_MEMCTL(obj) OBJECT_CHECK(ECCState, (obj), TYPE_ECC_MEMCTL)
+DECLARE_INSTANCE_CHECKER(ECCState, ECC_MEMCTL,
+                         TYPE_ECC_MEMCTL)
 
 struct ECCState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index 2db9d63eeb..0ff9d1ac78 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -35,7 +35,8 @@
 
 #define TYPE_PCI_EDU_DEVICE "edu"
 typedef struct EduState EduState;
-#define EDU(obj)        OBJECT_CHECK(EduState, obj, TYPE_PCI_EDU_DEVICE)
+DECLARE_INSTANCE_CHECKER(EduState, EDU,
+                         TYPE_PCI_EDU_DEVICE)
 
 #define FACT_IRQ        0x00000001
 #define DMA_IRQ         0x00000100
diff --git a/hw/misc/empty_slot.c b/hw/misc/empty_slot.c
index ec3e510b3e..57dcdfbe14 100644
--- a/hw/misc/empty_slot.c
+++ b/hw/misc/empty_slot.c
@@ -19,7 +19,8 @@
 
 #define TYPE_EMPTY_SLOT "empty_slot"
 typedef struct EmptySlot EmptySlot;
-#define EMPTY_SLOT(obj) OBJECT_CHECK(EmptySlot, (obj), TYPE_EMPTY_SLOT)
+DECLARE_INSTANCE_CHECKER(EmptySlot, EMPTY_SLOT,
+                         TYPE_EMPTY_SLOT)
 
 struct EmptySlot {
     SysBusDevice parent_obj;
diff --git a/hw/misc/exynos4210_clk.c b/hw/misc/exynos4210_clk.c
index c54f360aa8..4b469f6419 100644
--- a/hw/misc/exynos4210_clk.c
+++ b/hw/misc/exynos4210_clk.c
@@ -26,8 +26,8 @@
 
 #define TYPE_EXYNOS4210_CLK             "exynos4210.clk"
 typedef struct Exynos4210ClkState Exynos4210ClkState;
-#define EXYNOS4210_CLK(obj) \
-    OBJECT_CHECK(Exynos4210ClkState, (obj), TYPE_EXYNOS4210_CLK)
+DECLARE_INSTANCE_CHECKER(Exynos4210ClkState, EXYNOS4210_CLK,
+                         TYPE_EXYNOS4210_CLK)
 
 #define CLK_PLL_LOCKED                  BIT(29)
 
diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
index e6bbb1f7c8..b19b82a88c 100644
--- a/hw/misc/exynos4210_pmu.c
+++ b/hw/misc/exynos4210_pmu.c
@@ -396,8 +396,8 @@ static const Exynos4210PmuReg exynos4210_pmu_regs[] = {
 
 #define TYPE_EXYNOS4210_PMU "exynos4210.pmu"
 typedef struct Exynos4210PmuState Exynos4210PmuState;
-#define EXYNOS4210_PMU(obj) \
-    OBJECT_CHECK(Exynos4210PmuState, (obj), TYPE_EXYNOS4210_PMU)
+DECLARE_INSTANCE_CHECKER(Exynos4210PmuState, EXYNOS4210_PMU,
+                         TYPE_EXYNOS4210_PMU)
 
 struct Exynos4210PmuState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/exynos4210_rng.c b/hw/misc/exynos4210_rng.c
index 3e2ec4f543..13ec6e188b 100644
--- a/hw/misc/exynos4210_rng.c
+++ b/hw/misc/exynos4210_rng.c
@@ -37,8 +37,8 @@
 
 #define TYPE_EXYNOS4210_RNG             "exynos4210.rng"
 typedef struct Exynos4210RngState Exynos4210RngState;
-#define EXYNOS4210_RNG(obj) \
-    OBJECT_CHECK(Exynos4210RngState, (obj), TYPE_EXYNOS4210_RNG)
+DECLARE_INSTANCE_CHECKER(Exynos4210RngState, EXYNOS4210_RNG,
+                         TYPE_EXYNOS4210_RNG)
 
 /*
  * Exynos4220, PRNG, only polling mode is supported.
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 1f65f6f2ac..e321e5cb69 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -59,20 +59,20 @@
 
 #define TYPE_IVSHMEM_COMMON "ivshmem-common"
 typedef struct IVShmemState IVShmemState;
-#define IVSHMEM_COMMON(obj) \
-    OBJECT_CHECK(IVShmemState, (obj), TYPE_IVSHMEM_COMMON)
+DECLARE_INSTANCE_CHECKER(IVShmemState, IVSHMEM_COMMON,
+                         TYPE_IVSHMEM_COMMON)
 
 #define TYPE_IVSHMEM_PLAIN "ivshmem-plain"
-#define IVSHMEM_PLAIN(obj) \
-    OBJECT_CHECK(IVShmemState, (obj), TYPE_IVSHMEM_PLAIN)
+DECLARE_INSTANCE_CHECKER(IVShmemState, IVSHMEM_PLAIN,
+                         TYPE_IVSHMEM_PLAIN)
 
 #define TYPE_IVSHMEM_DOORBELL "ivshmem-doorbell"
-#define IVSHMEM_DOORBELL(obj) \
-    OBJECT_CHECK(IVShmemState, (obj), TYPE_IVSHMEM_DOORBELL)
+DECLARE_INSTANCE_CHECKER(IVShmemState, IVSHMEM_DOORBELL,
+                         TYPE_IVSHMEM_DOORBELL)
 
 #define TYPE_IVSHMEM "ivshmem"
-#define IVSHMEM(obj) \
-    OBJECT_CHECK(IVShmemState, (obj), TYPE_IVSHMEM)
+DECLARE_INSTANCE_CHECKER(IVShmemState, IVSHMEM,
+                         TYPE_IVSHMEM)
 
 typedef struct Peer {
     int nb_eventfds;
diff --git a/hw/misc/milkymist-hpdmc.c b/hw/misc/milkymist-hpdmc.c
index cf3ed5a49c..f25715e09e 100644
--- a/hw/misc/milkymist-hpdmc.c
+++ b/hw/misc/milkymist-hpdmc.c
@@ -45,8 +45,8 @@ enum {
 
 #define TYPE_MILKYMIST_HPDMC "milkymist-hpdmc"
 typedef struct MilkymistHpdmcState MilkymistHpdmcState;
-#define MILKYMIST_HPDMC(obj) \
-    OBJECT_CHECK(MilkymistHpdmcState, (obj), TYPE_MILKYMIST_HPDMC)
+DECLARE_INSTANCE_CHECKER(MilkymistHpdmcState, MILKYMIST_HPDMC,
+                         TYPE_MILKYMIST_HPDMC)
 
 struct MilkymistHpdmcState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/milkymist-pfpu.c b/hw/misc/milkymist-pfpu.c
index 81251792c1..489bb8873f 100644
--- a/hw/misc/milkymist-pfpu.c
+++ b/hw/misc/milkymist-pfpu.c
@@ -122,8 +122,8 @@ static const char *opcode_to_str[] = {
 
 #define TYPE_MILKYMIST_PFPU "milkymist-pfpu"
 typedef struct MilkymistPFPUState MilkymistPFPUState;
-#define MILKYMIST_PFPU(obj) \
-    OBJECT_CHECK(MilkymistPFPUState, (obj), TYPE_MILKYMIST_PFPU)
+DECLARE_INSTANCE_CHECKER(MilkymistPFPUState, MILKYMIST_PFPU,
+                         TYPE_MILKYMIST_PFPU)
 
 struct MilkymistPFPUState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c
index 314dd5fcbd..f74d8cdd4a 100644
--- a/hw/misc/mst_fpga.c
+++ b/hw/misc/mst_fpga.c
@@ -42,8 +42,8 @@
 
 #define TYPE_MAINSTONE_FPGA "mainstone-fpga"
 typedef struct mst_irq_state mst_irq_state;
-#define MAINSTONE_FPGA(obj) \
-    OBJECT_CHECK(mst_irq_state, (obj), TYPE_MAINSTONE_FPGA)
+DECLARE_INSTANCE_CHECKER(mst_irq_state, MAINSTONE_FPGA,
+                         TYPE_MAINSTONE_FPGA)
 
 struct mst_irq_state {
     SysBusDevice parent_obj;
diff --git a/hw/misc/pc-testdev.c b/hw/misc/pc-testdev.c
index b7f3fcb254..577a15bf58 100644
--- a/hw/misc/pc-testdev.c
+++ b/hw/misc/pc-testdev.c
@@ -57,8 +57,8 @@ struct PCTestdev {
 typedef struct PCTestdev PCTestdev;
 
 #define TYPE_TESTDEV "pc-testdev"
-#define TESTDEV(obj) \
-     OBJECT_CHECK(PCTestdev, (obj), TYPE_TESTDEV)
+DECLARE_INSTANCE_CHECKER(PCTestdev, TESTDEV,
+                         TYPE_TESTDEV)
 
 static uint64_t test_irq_line_read(void *opaque, hwaddr addr, unsigned size)
 {
diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index 9cd51b1afd..b7686e27d7 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -34,10 +34,8 @@ struct PCA955xClass {
 };
 typedef struct PCA955xClass PCA955xClass;
 
-#define PCA955X_CLASS(klass) \
-    OBJECT_CLASS_CHECK(PCA955xClass, (klass), TYPE_PCA955X)
-#define PCA955X_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(PCA955xClass, (obj), TYPE_PCA955X)
+DECLARE_CLASS_CHECKERS(PCA955xClass, PCA955X,
+                       TYPE_PCA955X)
 
 #define PCA9552_LED_ON   0x0
 #define PCA9552_LED_OFF  0x1
diff --git a/hw/misc/pci-testdev.c b/hw/misc/pci-testdev.c
index db6d0d5a71..86d4816769 100644
--- a/hw/misc/pci-testdev.c
+++ b/hw/misc/pci-testdev.c
@@ -96,8 +96,8 @@ typedef struct PCITestDevState PCITestDevState;
 
 #define TYPE_PCI_TEST_DEV "pci-testdev"
 
-#define PCI_TEST_DEV(obj) \
-    OBJECT_CHECK(PCITestDevState, (obj), TYPE_PCI_TEST_DEV)
+DECLARE_INSTANCE_CHECKER(PCITestDevState, PCI_TEST_DEV,
+                         TYPE_PCI_TEST_DEV)
 
 #define IOTEST_IS_MEM(i) (strcmp(IOTEST_TYPE(i), "portio"))
 #define IOTEST_REGION(d, i) (IOTEST_IS_MEM(i) ?  &(d)->mmio : &(d)->portio)
diff --git a/hw/misc/puv3_pm.c b/hw/misc/puv3_pm.c
index e549c0ff21..cac8497f81 100644
--- a/hw/misc/puv3_pm.c
+++ b/hw/misc/puv3_pm.c
@@ -20,7 +20,8 @@
 
 #define TYPE_PUV3_PM "puv3_pm"
 typedef struct PUV3PMState PUV3PMState;
-#define PUV3_PM(obj) OBJECT_CHECK(PUV3PMState, (obj), TYPE_PUV3_PM)
+DECLARE_INSTANCE_CHECKER(PUV3PMState, PUV3_PM,
+                         TYPE_PUV3_PM)
 
 struct PUV3PMState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 894c67e6cc..598d5471a4 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -31,8 +31,8 @@
 #define PVPANIC_CRASHLOADED     (1 << PVPANIC_F_CRASHLOADED)
 
 typedef struct PVPanicState PVPanicState;
-#define ISA_PVPANIC_DEVICE(obj)    \
-    OBJECT_CHECK(PVPanicState, (obj), TYPE_PVPANIC)
+DECLARE_INSTANCE_CHECKER(PVPanicState, ISA_PVPANIC_DEVICE,
+                         TYPE_PVPANIC)
 
 static void handle_event(int event)
 {
diff --git a/hw/misc/sga.c b/hw/misc/sga.c
index e5cc2da3d3..477f587ef3 100644
--- a/hw/misc/sga.c
+++ b/hw/misc/sga.c
@@ -35,7 +35,8 @@
 
 #define TYPE_SGA "sga"
 typedef struct ISASGAState ISASGAState;
-#define SGA(obj) OBJECT_CHECK(ISASGAState, (obj), TYPE_SGA)
+DECLARE_INSTANCE_CHECKER(ISASGAState, SGA,
+                         TYPE_SGA)
 
 struct ISASGAState {
     ISADevice parent_obj;
diff --git a/hw/misc/slavio_misc.c b/hw/misc/slavio_misc.c
index f1a039b5a9..ab27ad462e 100644
--- a/hw/misc/slavio_misc.c
+++ b/hw/misc/slavio_misc.c
@@ -41,7 +41,8 @@
 
 #define TYPE_SLAVIO_MISC "slavio_misc"
 typedef struct MiscState MiscState;
-#define SLAVIO_MISC(obj) OBJECT_CHECK(MiscState, (obj), TYPE_SLAVIO_MISC)
+DECLARE_INSTANCE_CHECKER(MiscState, SLAVIO_MISC,
+                         TYPE_SLAVIO_MISC)
 
 struct MiscState {
     SysBusDevice parent_obj;
@@ -65,7 +66,8 @@ struct MiscState {
 
 #define TYPE_APC "apc"
 typedef struct APCState APCState;
-#define APC(obj) OBJECT_CHECK(APCState, (obj), TYPE_APC)
+DECLARE_INSTANCE_CHECKER(APCState, APC,
+                         TYPE_APC)
 
 struct APCState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
index a289c83360..212d6e0e83 100644
--- a/hw/misc/tmp421.c
+++ b/hw/misc/tmp421.c
@@ -74,12 +74,9 @@ struct TMP421Class {
 typedef struct TMP421Class TMP421Class;
 
 #define TYPE_TMP421 "tmp421-generic"
-#define TMP421(obj) OBJECT_CHECK(TMP421State, (obj), TYPE_TMP421)
+DECLARE_OBJ_CHECKERS(TMP421State, TMP421Class,
+                     TMP421, TYPE_TMP421)
 
-#define TMP421_CLASS(klass) \
-     OBJECT_CLASS_CHECK(TMP421Class, (klass), TYPE_TMP421)
-#define TMP421_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(TMP421Class, (obj), TYPE_TMP421)
 
 /* the TMP421 registers */
 #define TMP421_STATUS_REG               0x08
diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index 223f533ce8..bedf09a6f5 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -184,7 +184,8 @@ REG32(DDRIOB, 0xb40)
 
 #define TYPE_ZYNQ_SLCR "xilinx,zynq_slcr"
 typedef struct ZynqSLCRState ZynqSLCRState;
-#define ZYNQ_SLCR(obj) OBJECT_CHECK(ZynqSLCRState, (obj), TYPE_ZYNQ_SLCR)
+DECLARE_INSTANCE_CHECKER(ZynqSLCRState, ZYNQ_SLCR,
+                         TYPE_ZYNQ_SLCR)
 
 struct ZynqSLCRState {
     SysBusDevice parent_obj;
diff --git a/hw/net/can/can_kvaser_pci.c b/hw/net/can/can_kvaser_pci.c
index a84d98817c..168b3a620d 100644
--- a/hw/net/can/can_kvaser_pci.c
+++ b/hw/net/can/can_kvaser_pci.c
@@ -48,8 +48,8 @@
 #define TYPE_CAN_PCI_DEV "kvaser_pci"
 
 typedef struct KvaserPCIState KvaserPCIState;
-#define KVASER_PCI_DEV(obj) \
-    OBJECT_CHECK(KvaserPCIState, (obj), TYPE_CAN_PCI_DEV)
+DECLARE_INSTANCE_CHECKER(KvaserPCIState, KVASER_PCI_DEV,
+                         TYPE_CAN_PCI_DEV)
 
 #ifndef KVASER_PCI_VENDOR_ID1
 #define KVASER_PCI_VENDOR_ID1     0x10e8    /* the PCI device and vendor IDs */
diff --git a/hw/net/can/can_mioe3680_pci.c b/hw/net/can/can_mioe3680_pci.c
index 8ded64c9b8..7a79e2605a 100644
--- a/hw/net/can/can_mioe3680_pci.c
+++ b/hw/net/can/can_mioe3680_pci.c
@@ -44,8 +44,8 @@
 #define TYPE_CAN_PCI_DEV "mioe3680_pci"
 
 typedef struct Mioe3680PCIState Mioe3680PCIState;
-#define MIOe3680_PCI_DEV(obj) \
-    OBJECT_CHECK(Mioe3680PCIState, (obj), TYPE_CAN_PCI_DEV)
+DECLARE_INSTANCE_CHECKER(Mioe3680PCIState, MIOe3680_PCI_DEV,
+                         TYPE_CAN_PCI_DEV)
 
 /* the PCI device and vendor IDs */
 #ifndef MIOe3680_PCI_VENDOR_ID1
diff --git a/hw/net/can/can_pcm3680_pci.c b/hw/net/can/can_pcm3680_pci.c
index f39228da89..8ef4e74af0 100644
--- a/hw/net/can/can_pcm3680_pci.c
+++ b/hw/net/can/can_pcm3680_pci.c
@@ -44,8 +44,8 @@
 #define TYPE_CAN_PCI_DEV "pcm3680_pci"
 
 typedef struct Pcm3680iPCIState Pcm3680iPCIState;
-#define PCM3680i_PCI_DEV(obj) \
-    OBJECT_CHECK(Pcm3680iPCIState, (obj), TYPE_CAN_PCI_DEV)
+DECLARE_INSTANCE_CHECKER(Pcm3680iPCIState, PCM3680i_PCI_DEV,
+                         TYPE_CAN_PCI_DEV)
 
 /* the PCI device and vendor IDs */
 #ifndef PCM3680i_PCI_VENDOR_ID1
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index b065d428ee..56b96e9b0f 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -152,7 +152,8 @@ do { printf("sonic ERROR: %s: " fmt, __func__ , ## __VA_ARGS__); } while (0)
 
 #define TYPE_DP8393X "dp8393x"
 typedef struct dp8393xState dp8393xState;
-#define DP8393X(obj) OBJECT_CHECK(dp8393xState, (obj), TYPE_DP8393X)
+DECLARE_INSTANCE_CHECKER(dp8393xState, DP8393X,
+                         TYPE_DP8393X)
 
 struct dp8393xState {
     SysBusDevice parent_obj;
diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index f8925a10e6..83347cbd87 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -151,13 +151,9 @@ typedef struct E1000BaseClass E1000BaseClass;
 
 #define TYPE_E1000_BASE "e1000-base"
 
-#define E1000(obj) \
-    OBJECT_CHECK(E1000State, (obj), TYPE_E1000_BASE)
+DECLARE_OBJ_CHECKERS(E1000State, E1000BaseClass,
+                     E1000, TYPE_E1000_BASE)
 
-#define E1000_CLASS(klass) \
-     OBJECT_CLASS_CHECK(E1000BaseClass, (klass), TYPE_E1000_BASE)
-#define E1000_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(E1000BaseClass, (obj), TYPE_E1000_BASE)
 
 static void
 e1000_link_up(E1000State *s)
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index d631765f2a..938d44f198 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -57,7 +57,8 @@
 
 #define TYPE_E1000E "e1000e"
 typedef struct E1000EState E1000EState;
-#define E1000E(obj) OBJECT_CHECK(E1000EState, (obj), TYPE_E1000E)
+DECLARE_INSTANCE_CHECKER(E1000EState, E1000E,
+                         TYPE_E1000E)
 
 struct E1000EState {
     PCIDevice parent_obj;
diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index 2bd37f6d0f..36d898ad16 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -325,8 +325,8 @@ static void mdio_cycle(struct qemu_mdio *bus)
 
 #define TYPE_ETRAX_FS_ETH "etraxfs-eth"
 typedef struct ETRAXFSEthState ETRAXFSEthState;
-#define ETRAX_FS_ETH(obj) \
-    OBJECT_CHECK(ETRAXFSEthState, (obj), TYPE_ETRAX_FS_ETH)
+DECLARE_INSTANCE_CHECKER(ETRAXFSEthState, ETRAX_FS_ETH,
+                         TYPE_ETRAX_FS_ETH)
 
 struct ETRAXFSEthState {
     SysBusDevice parent_obj;
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index e9d4356596..6e43b6ef35 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -182,7 +182,8 @@ static const VMStateDescription vmstate_lan9118_packet = {
 };
 
 typedef struct lan9118_state lan9118_state;
-#define LAN9118(obj) OBJECT_CHECK(lan9118_state, (obj), TYPE_LAN9118)
+DECLARE_INSTANCE_CHECKER(lan9118_state, LAN9118,
+                         TYPE_LAN9118)
 
 struct lan9118_state {
     SysBusDevice parent_obj;
diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 0ed01fec90..41a8543edf 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -100,8 +100,8 @@ typedef struct MilkymistMinimac2MdioState MilkymistMinimac2MdioState;
 
 #define TYPE_MILKYMIST_MINIMAC2 "milkymist-minimac2"
 typedef struct MilkymistMinimac2State MilkymistMinimac2State;
-#define MILKYMIST_MINIMAC2(obj) \
-    OBJECT_CHECK(MilkymistMinimac2State, (obj), TYPE_MILKYMIST_MINIMAC2)
+DECLARE_INSTANCE_CHECKER(MilkymistMinimac2State, MILKYMIST_MINIMAC2,
+                         TYPE_MILKYMIST_MINIMAC2)
 
 struct MilkymistMinimac2State {
     SysBusDevice parent_obj;
diff --git a/hw/net/mipsnet.c b/hw/net/mipsnet.c
index 094951abb3..61dbd575da 100644
--- a/hw/net/mipsnet.c
+++ b/hw/net/mipsnet.c
@@ -26,7 +26,8 @@
 
 #define TYPE_MIPS_NET "mipsnet"
 typedef struct MIPSnetState MIPSnetState;
-#define MIPS_NET(obj) OBJECT_CHECK(MIPSnetState, (obj), TYPE_MIPS_NET)
+DECLARE_INSTANCE_CHECKER(MIPSnetState, MIPS_NET,
+                         TYPE_MIPS_NET)
 
 struct MIPSnetState {
     SysBusDevice parent_obj;
diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
index 716f3b6618..688a0cc4f6 100644
--- a/hw/net/ne2000-isa.c
+++ b/hw/net/ne2000-isa.c
@@ -34,7 +34,8 @@
 #include "qom/object.h"
 
 typedef struct ISANE2000State ISANE2000State;
-#define ISA_NE2000(obj) OBJECT_CHECK(ISANE2000State, (obj), TYPE_ISA_NE2000)
+DECLARE_INSTANCE_CHECKER(ISANE2000State, ISA_NE2000,
+                         TYPE_ISA_NE2000)
 
 struct ISANE2000State {
     ISADevice parent_obj;
diff --git a/hw/net/opencores_eth.c b/hw/net/opencores_eth.c
index 6e3257d2f7..5cd204c30c 100644
--- a/hw/net/opencores_eth.c
+++ b/hw/net/opencores_eth.c
@@ -273,7 +273,8 @@ typedef struct desc {
 
 #define TYPE_OPEN_ETH "open_eth"
 typedef struct OpenEthState OpenEthState;
-#define OPEN_ETH(obj) OBJECT_CHECK(OpenEthState, (obj), TYPE_OPEN_ETH)
+DECLARE_INSTANCE_CHECKER(OpenEthState, OPEN_ETH,
+                         TYPE_OPEN_ETH)
 
 struct OpenEthState {
     SysBusDevice parent_obj;
diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
index 27f6566d5f..449970bc52 100644
--- a/hw/net/pcnet-pci.c
+++ b/hw/net/pcnet-pci.c
@@ -53,8 +53,8 @@
 #define TYPE_PCI_PCNET "pcnet"
 
 typedef struct PCIPCNetState PCIPCNetState;
-#define PCI_PCNET(obj) \
-     OBJECT_CHECK(PCIPCNetState, (obj), TYPE_PCI_PCNET)
+DECLARE_INSTANCE_CHECKER(PCIPCNetState, PCI_PCNET,
+                         TYPE_PCI_PCNET)
 
 struct PCIPCNetState {
     /*< private >*/
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 69d7f36e98..9246388f58 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -95,8 +95,8 @@ static inline GCC_FMT_ATTR(1, 2) int DPRINTF(const char *fmt, ...)
 #define TYPE_RTL8139 "rtl8139"
 
 typedef struct RTL8139State RTL8139State;
-#define RTL8139(obj) \
-     OBJECT_CHECK(RTL8139State, (obj), TYPE_RTL8139)
+DECLARE_INSTANCE_CHECKER(RTL8139State, RTL8139,
+                         TYPE_RTL8139)
 
 /* Symbolic offsets to registers. */
 enum RTL8139_registers {
diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 12da4b1f73..9fad904321 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -26,7 +26,8 @@
 
 #define TYPE_SMC91C111 "smc91c111"
 typedef struct smc91c111_state smc91c111_state;
-#define SMC91C111(obj) OBJECT_CHECK(smc91c111_state, (obj), TYPE_SMC91C111)
+DECLARE_INSTANCE_CHECKER(smc91c111_state, SMC91C111,
+                         TYPE_SMC91C111)
 
 struct smc91c111_state {
     SysBusDevice parent_obj;
diff --git a/hw/net/spapr_llan.c b/hw/net/spapr_llan.c
index 94b61a646c..d34cb29607 100644
--- a/hw/net/spapr_llan.c
+++ b/hw/net/spapr_llan.c
@@ -86,8 +86,8 @@ typedef uint64_t vlan_bd_t;
 
 #define TYPE_VIO_SPAPR_VLAN_DEVICE "spapr-vlan"
 typedef struct SpaprVioVlan SpaprVioVlan;
-#define VIO_SPAPR_VLAN_DEVICE(obj) \
-     OBJECT_CHECK(SpaprVioVlan, (obj), TYPE_VIO_SPAPR_VLAN_DEVICE)
+DECLARE_INSTANCE_CHECKER(SpaprVioVlan, VIO_SPAPR_VLAN_DEVICE,
+                         TYPE_VIO_SPAPR_VLAN_DEVICE)
 
 #define RX_POOL_MAX_BDS 4096
 #define RX_MAX_POOLS 5
diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 786dc9a6c6..9f13afa4e4 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -52,8 +52,8 @@ do { fprintf(stderr, "stellaris_enet: error: " fmt , ## __VA_ARGS__);} while (0)
 
 #define TYPE_STELLARIS_ENET "stellaris_enet"
 typedef struct stellaris_enet_state stellaris_enet_state;
-#define STELLARIS_ENET(obj) \
-    OBJECT_CHECK(stellaris_enet_state, (obj), TYPE_STELLARIS_ENET)
+DECLARE_INSTANCE_CHECKER(stellaris_enet_state, STELLARIS_ENET,
+                         TYPE_STELLARIS_ENET)
 
 typedef struct {
     uint8_t data[2048];
diff --git a/hw/net/sungem.c b/hw/net/sungem.c
index 103a4e19d9..91753830a7 100644
--- a/hw/net/sungem.c
+++ b/hw/net/sungem.c
@@ -24,7 +24,8 @@
 #define TYPE_SUNGEM "sungem"
 
 typedef struct SunGEMState SunGEMState;
-#define SUNGEM(obj) OBJECT_CHECK(SunGEMState, (obj), TYPE_SUNGEM)
+DECLARE_INSTANCE_CHECKER(SunGEMState, SUNGEM,
+                         TYPE_SUNGEM)
 
 #define MAX_PACKET_SIZE 9016
 
diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index 43fb8da97c..7364ba1019 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -131,7 +131,8 @@
 
 #define TYPE_SUNHME "sunhme"
 typedef struct SunHMEState SunHMEState;
-#define SUNHME(obj) OBJECT_CHECK(SunHMEState, (obj), TYPE_SUNHME)
+DECLARE_INSTANCE_CHECKER(SunHMEState, SUNHME,
+                         TYPE_SUNHME)
 
 /* Maximum size of buffer */
 #define HME_FIFO_SIZE          0x800
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index ca3dddad92..eff299f629 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -135,10 +135,8 @@ struct VMXNET3Class {
 };
 typedef struct VMXNET3Class VMXNET3Class;
 
-#define VMXNET3_DEVICE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(VMXNET3Class, (klass), TYPE_VMXNET3)
-#define VMXNET3_DEVICE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(VMXNET3Class, (obj), TYPE_VMXNET3)
+DECLARE_CLASS_CHECKERS(VMXNET3Class, VMXNET3_DEVICE,
+                       TYPE_VMXNET3)
 
 static inline void vmxnet3_ring_init(PCIDevice *d,
                                      Vmxnet3Ring *ring,
diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
index 10eebebe52..a066550023 100644
--- a/hw/net/xgmac.c
+++ b/hw/net/xgmac.c
@@ -141,7 +141,8 @@ typedef struct RxTxStats {
 
 #define TYPE_XGMAC "xgmac"
 typedef struct XgmacState XgmacState;
-#define XGMAC(obj) OBJECT_CHECK(XgmacState, (obj), TYPE_XGMAC)
+DECLARE_INSTANCE_CHECKER(XgmacState, XGMAC,
+                         TYPE_XGMAC)
 
 struct XgmacState {
     SysBusDevice parent_obj;
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 0265d3e9ff..d973182c28 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -44,17 +44,15 @@
 #define TYPE_XILINX_AXI_ENET_CONTROL_STREAM "xilinx-axienet-control-stream"
 
 typedef struct XilinxAXIEnet XilinxAXIEnet;
-#define XILINX_AXI_ENET(obj) \
-     OBJECT_CHECK(XilinxAXIEnet, (obj), TYPE_XILINX_AXI_ENET)
+DECLARE_INSTANCE_CHECKER(XilinxAXIEnet, XILINX_AXI_ENET,
+                         TYPE_XILINX_AXI_ENET)
 
 typedef struct XilinxAXIEnetStreamSlave XilinxAXIEnetStreamSlave;
-#define XILINX_AXI_ENET_DATA_STREAM(obj) \
-     OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
-     TYPE_XILINX_AXI_ENET_DATA_STREAM)
+DECLARE_INSTANCE_CHECKER(XilinxAXIEnetStreamSlave, XILINX_AXI_ENET_DATA_STREAM,
+                         TYPE_XILINX_AXI_ENET_DATA_STREAM)
 
-#define XILINX_AXI_ENET_CONTROL_STREAM(obj) \
-     OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
-     TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
+DECLARE_INSTANCE_CHECKER(XilinxAXIEnetStreamSlave, XILINX_AXI_ENET_CONTROL_STREAM,
+                         TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
 
 /* Advertisement control register. */
 #define ADVERTISE_10HALF        0x0020  /* Try for 10mbps half-duplex  */
diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index adf477960e..6e09f7e422 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -53,8 +53,8 @@
 #define CTRL_S     0x1
 
 #define TYPE_XILINX_ETHLITE "xlnx.xps-ethernetlite"
-#define XILINX_ETHLITE(obj) \
-    OBJECT_CHECK(struct xlx_ethlite, (obj), TYPE_XILINX_ETHLITE)
+DECLARE_INSTANCE_CHECKER(struct xlx_ethlite, XILINX_ETHLITE,
+                         TYPE_XILINX_ETHLITE)
 
 struct xlx_ethlite
 {
diff --git a/hw/nvram/ds1225y.c b/hw/nvram/ds1225y.c
index 99e27e9174..44fb7a94d3 100644
--- a/hw/nvram/ds1225y.c
+++ b/hw/nvram/ds1225y.c
@@ -111,7 +111,8 @@ static const VMStateDescription vmstate_nvram = {
 
 #define TYPE_DS1225Y "ds1225y"
 typedef struct SysBusNvRamState SysBusNvRamState;
-#define DS1225Y(obj) OBJECT_CHECK(SysBusNvRamState, (obj), TYPE_DS1225Y)
+DECLARE_INSTANCE_CHECKER(SysBusNvRamState, DS1225Y,
+                         TYPE_DS1225Y)
 
 struct SysBusNvRamState {
     SysBusDevice parent_obj;
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 4bf7519bc7..3e93dbbffb 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -29,7 +29,8 @@
 
 #define TYPE_AT24C_EE "at24c-eeprom"
 typedef struct EEPROMState EEPROMState;
-#define AT24C_EE(obj) OBJECT_CHECK(EEPROMState, (obj), TYPE_AT24C_EE)
+DECLARE_INSTANCE_CHECKER(EEPROMState, AT24C_EE,
+                         TYPE_AT24C_EE)
 
 struct EEPROMState {
     I2CSlave parent_obj;
diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
index b9218e0b89..57ccc174f2 100644
--- a/hw/nvram/spapr_nvram.c
+++ b/hw/nvram/spapr_nvram.c
@@ -51,8 +51,8 @@ struct SpaprNvram {
 typedef struct SpaprNvram SpaprNvram;
 
 #define TYPE_VIO_SPAPR_NVRAM "spapr-nvram"
-#define VIO_SPAPR_NVRAM(obj) \
-     OBJECT_CHECK(SpaprNvram, (obj), TYPE_VIO_SPAPR_NVRAM)
+DECLARE_INSTANCE_CHECKER(SpaprNvram, VIO_SPAPR_NVRAM,
+                         TYPE_VIO_SPAPR_NVRAM)
 
 #define MIN_NVRAM_SIZE      (8 * KiB)
 #define DEFAULT_NVRAM_SIZE  (64 * KiB)
diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
index b35866d8d1..e88998d88c 100644
--- a/hw/pci-bridge/dec.c
+++ b/hw/pci-bridge/dec.c
@@ -35,7 +35,8 @@
 #include "qom/object.h"
 
 typedef struct DECState DECState;
-#define DEC_21154(obj) OBJECT_CHECK(DECState, (obj), TYPE_DEC_21154)
+DECLARE_INSTANCE_CHECKER(DECState, DEC_21154,
+                         TYPE_DEC_21154)
 
 struct DECState {
     PCIHostState parent_obj;
diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
index b62e20a648..67c71d566b 100644
--- a/hw/pci-bridge/gen_pcie_root_port.c
+++ b/hw/pci-bridge/gen_pcie_root_port.c
@@ -21,8 +21,8 @@
 
 #define TYPE_GEN_PCIE_ROOT_PORT                "pcie-root-port"
 typedef struct GenPCIERootPort GenPCIERootPort;
-#define GEN_PCIE_ROOT_PORT(obj) \
-        OBJECT_CHECK(GenPCIERootPort, (obj), TYPE_GEN_PCIE_ROOT_PORT)
+DECLARE_INSTANCE_CHECKER(GenPCIERootPort, GEN_PCIE_ROOT_PORT,
+                         TYPE_GEN_PCIE_ROOT_PORT)
 
 #define GEN_PCIE_ROOT_PORT_AER_OFFSET           0x100
 #define GEN_PCIE_ROOT_PORT_ACS_OFFSET \
diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index bd1b10c848..b86d76caf3 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -36,8 +36,8 @@
 #define TYPE_PCI_BRIDGE_DEV      "pci-bridge"
 #define TYPE_PCI_BRIDGE_SEAT_DEV "pci-bridge-seat"
 typedef struct PCIBridgeDev PCIBridgeDev;
-#define PCI_BRIDGE_DEV(obj) \
-    OBJECT_CHECK(PCIBridgeDev, (obj), TYPE_PCI_BRIDGE_DEV)
+DECLARE_INSTANCE_CHECKER(PCIBridgeDev, PCI_BRIDGE_DEV,
+                         TYPE_PCI_BRIDGE_DEV)
 
 struct PCIBridgeDev {
     /*< private >*/
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 4a31ee3748..aedded1064 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -26,10 +26,12 @@
 
 #define TYPE_PXB_BUS "pxb-bus"
 typedef struct PXBBus PXBBus;
-#define PXB_BUS(obj) OBJECT_CHECK(PXBBus, (obj), TYPE_PXB_BUS)
+DECLARE_INSTANCE_CHECKER(PXBBus, PXB_BUS,
+                         TYPE_PXB_BUS)
 
 #define TYPE_PXB_PCIE_BUS "pxb-pcie-bus"
-#define PXB_PCIE_BUS(obj) OBJECT_CHECK(PXBBus, (obj), TYPE_PXB_PCIE_BUS)
+DECLARE_INSTANCE_CHECKER(PXBBus, PXB_PCIE_BUS,
+                         TYPE_PXB_PCIE_BUS)
 
 struct PXBBus {
     /*< private >*/
@@ -41,10 +43,12 @@ struct PXBBus {
 
 #define TYPE_PXB_DEVICE "pxb"
 typedef struct PXBDev PXBDev;
-#define PXB_DEV(obj) OBJECT_CHECK(PXBDev, (obj), TYPE_PXB_DEVICE)
+DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
+                         TYPE_PXB_DEVICE)
 
 #define TYPE_PXB_PCIE_DEVICE "pxb-pcie"
-#define PXB_PCIE_DEV(obj) OBJECT_CHECK(PXBDev, (obj), TYPE_PXB_PCIE_DEVICE)
+DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
+                         TYPE_PXB_PCIE_DEVICE)
 
 struct PXBDev {
     /*< private >*/
diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index 1178cd8620..abc98f8cd9 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -30,8 +30,8 @@ struct PCIEPCIBridge {
 typedef struct PCIEPCIBridge PCIEPCIBridge;
 
 #define TYPE_PCIE_PCI_BRIDGE_DEV "pcie-pci-bridge"
-#define PCIE_PCI_BRIDGE_DEV(obj) \
-        OBJECT_CHECK(PCIEPCIBridge, (obj), TYPE_PCIE_PCI_BRIDGE_DEV)
+DECLARE_INSTANCE_CHECKER(PCIEPCIBridge, PCIE_PCI_BRIDGE_DEV,
+                         TYPE_PCIE_PCI_BRIDGE_DEV)
 
 static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
 {
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 3b37f4f542..d10fbd39d3 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -240,12 +240,12 @@ struct BonitoState {
 };
 
 #define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
-#define BONITO_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(BonitoState, (obj), TYPE_BONITO_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(BonitoState, BONITO_PCI_HOST_BRIDGE,
+                         TYPE_BONITO_PCI_HOST_BRIDGE)
 
 #define TYPE_PCI_BONITO "Bonito"
-#define PCI_BONITO(obj) \
-    OBJECT_CHECK(PCIBonitoState, (obj), TYPE_PCI_BONITO)
+DECLARE_INSTANCE_CHECKER(PCIBonitoState, PCI_BONITO,
+                         TYPE_PCI_BONITO)
 
 static void bonito_writel(void *opaque, hwaddr addr,
                           uint64_t val, unsigned size)
diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index 48a16269ad..fd7d6dcc06 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -36,8 +36,8 @@
 #include "qom/object.h"
 
 typedef struct GrackleState GrackleState;
-#define GRACKLE_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(GrackleState, (obj), TYPE_GRACKLE_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(GrackleState, GRACKLE_PCI_HOST_BRIDGE,
+                         TYPE_GRACKLE_PCI_HOST_BRIDGE)
 
 struct GrackleState {
     PCIHostState parent_obj;
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index ead7b7ef1c..93c62235ca 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -43,8 +43,8 @@
  */
 
 typedef struct I440FXState I440FXState;
-#define I440FX_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(I440FXState, (obj), TYPE_I440FX_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(I440FXState, I440FX_PCI_HOST_BRIDGE,
+                         TYPE_I440FX_PCI_HOST_BRIDGE)
 
 struct I440FXState {
     PCIHostState parent_obj;
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 180a91a846..a7f9685005 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -878,8 +878,8 @@ static IOMMUTLBEntry pnv_phb3_translate_iommu(IOMMUMemoryRegion *iommu,
 }
 
 #define TYPE_PNV_PHB3_IOMMU_MEMORY_REGION "pnv-phb3-iommu-memory-region"
-#define PNV_PHB3_IOMMU_MEMORY_REGION(obj) \
-    OBJECT_CHECK(IOMMUMemoryRegion, (obj), TYPE_PNV_PHB3_IOMMU_MEMORY_REGION)
+DECLARE_INSTANCE_CHECKER(IOMMUMemoryRegion, PNV_PHB3_IOMMU_MEMORY_REGION,
+                         TYPE_PNV_PHB3_IOMMU_MEMORY_REGION)
 
 static void pnv_phb3_iommu_memory_region_class_init(ObjectClass *klass,
                                                     void *data)
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index ec85de5c74..03daf40a23 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1043,8 +1043,8 @@ static IOMMUTLBEntry pnv_phb4_translate_iommu(IOMMUMemoryRegion *iommu,
 }
 
 #define TYPE_PNV_PHB4_IOMMU_MEMORY_REGION "pnv-phb4-iommu-memory-region"
-#define PNV_PHB4_IOMMU_MEMORY_REGION(obj) \
-    OBJECT_CHECK(IOMMUMemoryRegion, (obj), TYPE_PNV_PHB4_IOMMU_MEMORY_REGION)
+DECLARE_INSTANCE_CHECKER(IOMMUMemoryRegion, PNV_PHB4_IOMMU_MEMORY_REGION,
+                         TYPE_PNV_PHB4_IOMMU_MEMORY_REGION)
 
 static void pnv_phb4_iommu_memory_region_class_init(ObjectClass *klass,
                                                     void *data)
diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
index b29e2be9ae..f376374e24 100644
--- a/hw/pci-host/ppce500.c
+++ b/hw/pci-host/ppce500.c
@@ -93,8 +93,8 @@ struct pci_inbound {
 #define TYPE_PPC_E500_PCI_HOST_BRIDGE "e500-pcihost"
 
 typedef struct PPCE500PCIState PPCE500PCIState;
-#define PPC_E500_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(PPCE500PCIState, (obj), TYPE_PPC_E500_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(PPCE500PCIState, PPC_E500_PCI_HOST_BRIDGE,
+                         TYPE_PPC_E500_PCI_HOST_BRIDGE)
 
 struct PPCE500PCIState {
     PCIHostState parent_obj;
@@ -117,8 +117,8 @@ struct PPCE500PCIState {
 
 #define TYPE_PPC_E500_PCI_BRIDGE "e500-host-bridge"
 typedef struct PPCE500PCIBridgeState PPCE500PCIBridgeState;
-#define PPC_E500_PCI_BRIDGE(obj) \
-    OBJECT_CHECK(PPCE500PCIBridgeState, (obj), TYPE_PPC_E500_PCI_BRIDGE)
+DECLARE_INSTANCE_CHECKER(PPCE500PCIBridgeState, PPC_E500_PCI_BRIDGE,
+                         TYPE_PPC_E500_PCI_BRIDGE)
 
 struct PPCE500PCIBridgeState {
     /*< private >*/
diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index af0c2eb941..b234fd7c8a 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -44,8 +44,8 @@
 #define TYPE_RAVEN_PCI_HOST_BRIDGE "raven-pcihost"
 
 typedef struct RavenPCIState RavenPCIState;
-#define RAVEN_PCI_DEVICE(obj) \
-    OBJECT_CHECK(RavenPCIState, (obj), TYPE_RAVEN_PCI_DEVICE)
+DECLARE_INSTANCE_CHECKER(RavenPCIState, RAVEN_PCI_DEVICE,
+                         TYPE_RAVEN_PCI_DEVICE)
 
 struct RavenPCIState {
     PCIDevice dev;
@@ -56,8 +56,8 @@ struct RavenPCIState {
 };
 
 typedef struct PRePPCIState PREPPCIState;
-#define RAVEN_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(PREPPCIState, (obj), TYPE_RAVEN_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(PREPPCIState, RAVEN_PCI_HOST_BRIDGE,
+                         TYPE_RAVEN_PCI_HOST_BRIDGE)
 
 struct PRePPCIState {
     PCIHostState parent_obj;
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index e0d00baf94..3553277f94 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -158,12 +158,12 @@ static const VMStateDescription pci_vpb_vmstate = {
 };
 
 #define TYPE_VERSATILE_PCI "versatile_pci"
-#define PCI_VPB(obj) \
-    OBJECT_CHECK(PCIVPBState, (obj), TYPE_VERSATILE_PCI)
+DECLARE_INSTANCE_CHECKER(PCIVPBState, PCI_VPB,
+                         TYPE_VERSATILE_PCI)
 
 #define TYPE_VERSATILE_PCI_HOST "versatile_pci_host"
-#define PCI_VPB_HOST(obj) \
-    OBJECT_CHECK(PCIDevice, (obj), TYPE_VERSATILE_PCI_HOST)
+DECLARE_INSTANCE_CHECKER(PCIDevice, PCI_VPB_HOST,
+                         TYPE_VERSATILE_PCI_HOST)
 
 typedef enum {
     PCI_IMAP0 = 0x0,
diff --git a/hw/ppc/mpc8544_guts.c b/hw/ppc/mpc8544_guts.c
index f74bcdca16..b76b5e4701 100644
--- a/hw/ppc/mpc8544_guts.c
+++ b/hw/ppc/mpc8544_guts.c
@@ -56,7 +56,8 @@
 
 #define TYPE_MPC8544_GUTS "mpc8544-guts"
 typedef struct GutsState GutsState;
-#define MPC8544_GUTS(obj) OBJECT_CHECK(GutsState, (obj), TYPE_MPC8544_GUTS)
+DECLARE_INSTANCE_CHECKER(GutsState, MPC8544_GUTS,
+                         TYPE_MPC8544_GUTS)
 
 struct GutsState {
     /*< private >*/
diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index f82d520d25..a564fcd600 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -47,8 +47,8 @@ struct PLBInMap {
 
 #define TYPE_PPC440_PCIX_HOST_BRIDGE "ppc440-pcix-host"
 typedef struct PPC440PCIXState PPC440PCIXState;
-#define PPC440_PCIX_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(PPC440PCIXState, (obj), TYPE_PPC440_PCIX_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(PPC440PCIXState, PPC440_PCIX_HOST_BRIDGE,
+                         TYPE_PPC440_PCIX_HOST_BRIDGE)
 
 #define PPC440_PCIX_NR_POMS 3
 #define PPC440_PCIX_NR_PIMS 3
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 73cb93a3a5..d9ca6bba9b 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -1034,8 +1034,8 @@ void ppc4xx_dma_init(CPUPPCState *env, int dcr_base)
 
 #define TYPE_PPC460EX_PCIE_HOST "ppc460ex-pcie-host"
 typedef struct PPC460EXPCIEState PPC460EXPCIEState;
-#define PPC460EX_PCIE_HOST(obj) \
-    OBJECT_CHECK(PPC460EXPCIEState, (obj), TYPE_PPC460EX_PCIE_HOST)
+DECLARE_INSTANCE_CHECKER(PPC460EXPCIEState, PPC460EX_PCIE_HOST,
+                         TYPE_PPC460EX_PCIE_HOST)
 
 struct PPC460EXPCIEState {
     PCIExpressHost host;
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 77ec675960..5303685dc5 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -45,8 +45,8 @@ struct PCITargetMap {
 };
 
 typedef struct PPC4xxPCIState PPC4xxPCIState;
-#define PPC4xx_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(PPC4xxPCIState, (obj), TYPE_PPC4xx_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(PPC4xxPCIState, PPC4xx_PCI_HOST_BRIDGE,
+                         TYPE_PPC4xx_PCI_HOST_BRIDGE)
 
 #define PPC4xx_PCI_NR_PMMS 3
 #define PPC4xx_PCI_NR_PTMS 2
diff --git a/hw/ppc/ppce500_spin.c b/hw/ppc/ppce500_spin.c
index b1b6d559c4..cd8000ad73 100644
--- a/hw/ppc/ppce500_spin.c
+++ b/hw/ppc/ppce500_spin.c
@@ -48,7 +48,8 @@ typedef struct spin_info {
 
 #define TYPE_E500_SPIN "e500-spin"
 typedef struct SpinState SpinState;
-#define E500_SPIN(obj) OBJECT_CHECK(SpinState, (obj), TYPE_E500_SPIN)
+DECLARE_INSTANCE_CHECKER(SpinState, E500_SPIN,
+                         TYPE_E500_SPIN)
 
 struct SpinState {
     SysBusDevice parent_obj;
diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
index d13044acce..d1e2fb3f8b 100644
--- a/hw/ppc/prep_systemio.c
+++ b/hw/ppc/prep_systemio.c
@@ -37,8 +37,8 @@
 
 #define TYPE_PREP_SYSTEMIO "prep-systemio"
 typedef struct PrepSystemIoState PrepSystemIoState;
-#define PREP_SYSTEMIO(obj) \
-    OBJECT_CHECK(PrepSystemIoState, (obj), TYPE_PREP_SYSTEMIO)
+DECLARE_INSTANCE_CHECKER(PrepSystemIoState, PREP_SYSTEMIO,
+                         TYPE_PREP_SYSTEMIO)
 
 /* Bit as defined in PowerPC Reference Plaform v1.1, sect. 6.1.5, p. 132 */
 #define PREP_BIT(n) (1 << (7 - (n)))
diff --git a/hw/ppc/rs6000_mc.c b/hw/ppc/rs6000_mc.c
index ec25a701dc..56e96010b8 100644
--- a/hw/ppc/rs6000_mc.c
+++ b/hw/ppc/rs6000_mc.c
@@ -30,8 +30,8 @@
 
 #define TYPE_RS6000MC "rs6000-mc"
 typedef struct RS6000MCState RS6000MCState;
-#define RS6000MC_DEVICE(obj) \
-    OBJECT_CHECK(RS6000MCState, (obj), TYPE_RS6000MC)
+DECLARE_INSTANCE_CHECKER(RS6000MCState, RS6000MC_DEVICE,
+                         TYPE_RS6000MC)
 
 struct RS6000MCState {
     ISADevice parent_obj;
diff --git a/hw/ppc/spapr_rng.c b/hw/ppc/spapr_rng.c
index b400438394..6c99633faa 100644
--- a/hw/ppc/spapr_rng.c
+++ b/hw/ppc/spapr_rng.c
@@ -31,8 +31,8 @@
 #include "qom/object.h"
 
 typedef struct SpaprRngState SpaprRngState;
-#define SPAPR_RNG(obj) \
-    OBJECT_CHECK(SpaprRngState, (obj), TYPE_SPAPR_RNG)
+DECLARE_INSTANCE_CHECKER(SpaprRngState, SPAPR_RNG,
+                         TYPE_SPAPR_RNG)
 
 struct SpaprRngState {
     /*< private >*/
diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 8b2b7973d8..10fac3d9c9 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -31,7 +31,8 @@
 
 #define TYPE_DS1338 "ds1338"
 typedef struct DS1338State DS1338State;
-#define DS1338(obj) OBJECT_CHECK(DS1338State, (obj), TYPE_DS1338)
+DECLARE_INSTANCE_CHECKER(DS1338State, DS1338,
+                         TYPE_DS1338)
 
 struct DS1338State {
     I2CSlave parent_obj;
diff --git a/hw/rtc/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
index a95f07ef0b..f8a4fe8a47 100644
--- a/hw/rtc/exynos4210_rtc.c
+++ b/hw/rtc/exynos4210_rtc.c
@@ -86,8 +86,8 @@
 
 #define TYPE_EXYNOS4210_RTC "exynos4210.rtc"
 typedef struct Exynos4210RTCState Exynos4210RTCState;
-#define EXYNOS4210_RTC(obj) \
-    OBJECT_CHECK(Exynos4210RTCState, (obj), TYPE_EXYNOS4210_RTC)
+DECLARE_INSTANCE_CHECKER(Exynos4210RTCState, EXYNOS4210_RTC,
+                         TYPE_EXYNOS4210_RTC)
 
 struct Exynos4210RTCState {
     SysBusDevice parent_obj;
diff --git a/hw/rtc/m41t80.c b/hw/rtc/m41t80.c
index 31445e9691..0b7048c3f4 100644
--- a/hw/rtc/m41t80.c
+++ b/hw/rtc/m41t80.c
@@ -18,7 +18,8 @@
 
 #define TYPE_M41T80 "m41t80"
 typedef struct M41t80State M41t80State;
-#define M41T80(obj) OBJECT_CHECK(M41t80State, (obj), TYPE_M41T80)
+DECLARE_INSTANCE_CHECKER(M41t80State, M41T80,
+                         TYPE_M41T80)
 
 struct M41t80State {
     I2CSlave parent_obj;
diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
index dc608e0b02..cae315e488 100644
--- a/hw/rtc/m48t59-isa.c
+++ b/hw/rtc/m48t59-isa.c
@@ -35,12 +35,8 @@
 #define TYPE_M48TXX_ISA "isa-m48txx"
 typedef struct M48txxISADeviceClass M48txxISADeviceClass;
 typedef struct M48txxISAState M48txxISAState;
-#define M48TXX_ISA_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(M48txxISADeviceClass, (obj), TYPE_M48TXX_ISA)
-#define M48TXX_ISA_CLASS(klass) \
-    OBJECT_CLASS_CHECK(M48txxISADeviceClass, (klass), TYPE_M48TXX_ISA)
-#define M48TXX_ISA(obj) \
-    OBJECT_CHECK(M48txxISAState, (obj), TYPE_M48TXX_ISA)
+DECLARE_OBJ_CHECKERS(M48txxISAState, M48txxISADeviceClass,
+                     M48TXX_ISA, TYPE_M48TXX_ISA)
 
 struct M48txxISAState {
     ISADevice parent_obj;
diff --git a/hw/rtc/m48t59.c b/hw/rtc/m48t59.c
index 9f5a96af82..6525206976 100644
--- a/hw/rtc/m48t59.c
+++ b/hw/rtc/m48t59.c
@@ -45,12 +45,8 @@
 #define TYPE_M48TXX_SYS_BUS "sysbus-m48txx"
 typedef struct M48txxSysBusDeviceClass M48txxSysBusDeviceClass;
 typedef struct M48txxSysBusState M48txxSysBusState;
-#define M48TXX_SYS_BUS_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(M48txxSysBusDeviceClass, (obj), TYPE_M48TXX_SYS_BUS)
-#define M48TXX_SYS_BUS_CLASS(klass) \
-    OBJECT_CLASS_CHECK(M48txxSysBusDeviceClass, (klass), TYPE_M48TXX_SYS_BUS)
-#define M48TXX_SYS_BUS(obj) \
-    OBJECT_CHECK(M48txxSysBusState, (obj), TYPE_M48TXX_SYS_BUS)
+DECLARE_OBJ_CHECKERS(M48txxSysBusState, M48txxSysBusDeviceClass,
+                     M48TXX_SYS_BUS, TYPE_M48TXX_SYS_BUS)
 
 /*
  * Chipset docs:
diff --git a/hw/rtc/sun4v-rtc.c b/hw/rtc/sun4v-rtc.c
index b5ebefd1b2..18979d25d0 100644
--- a/hw/rtc/sun4v-rtc.c
+++ b/hw/rtc/sun4v-rtc.c
@@ -21,7 +21,8 @@
 
 #define TYPE_SUN4V_RTC "sun4v_rtc"
 typedef struct Sun4vRtc Sun4vRtc;
-#define SUN4V_RTC(obj) OBJECT_CHECK(Sun4vRtc, (obj), TYPE_SUN4V_RTC)
+DECLARE_INSTANCE_CHECKER(Sun4vRtc, SUN4V_RTC,
+                         TYPE_SUN4V_RTC)
 
 struct Sun4vRtc {
     SysBusDevice parent_obj;
diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
index d46f21430c..4f83eff5c3 100644
--- a/hw/rtc/twl92230.c
+++ b/hw/rtc/twl92230.c
@@ -35,7 +35,8 @@
 
 #define TYPE_TWL92230 "twl92230"
 typedef struct MenelausState MenelausState;
-#define TWL92230(obj) OBJECT_CHECK(MenelausState, (obj), TYPE_TWL92230)
+DECLARE_INSTANCE_CHECKER(MenelausState, TWL92230,
+                         TYPE_TWL92230)
 
 struct MenelausState {
     I2CSlave parent_obj;
diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index ed7f695c2a..417ec0564b 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -54,13 +54,9 @@ typedef struct RxGdbSimMachineState RxGdbSimMachineState;
 
 #define TYPE_RX_GDBSIM_MACHINE MACHINE_TYPE_NAME("rx62n-common")
 
-#define RX_GDBSIM_MACHINE(obj) \
-    OBJECT_CHECK(RxGdbSimMachineState, (obj), TYPE_RX_GDBSIM_MACHINE)
+DECLARE_OBJ_CHECKERS(RxGdbSimMachineState, RxGdbSimMachineClass,
+                     RX_GDBSIM_MACHINE, TYPE_RX_GDBSIM_MACHINE)
 
-#define RX_GDBSIM_MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(RxGdbSimMachineClass, (klass), TYPE_RX_GDBSIM_MACHINE)
-#define RX_GDBSIM_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(RxGdbSimMachineClass, (obj), TYPE_RX_GDBSIM_MACHINE)
 
 static void rx_load_image(RXCPU *cpu, const char *filename,
                           uint32_t start, uint32_t size)
diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index d2935c5429..6eb4eea700 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -72,10 +72,8 @@ struct RX62NClass {
 };
 typedef struct RX62NClass RX62NClass;
 
-#define RX62N_MCU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(RX62NClass, (klass), TYPE_RX62N_MCU)
-#define RX62N_MCU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(RX62NClass, (obj), TYPE_RX62N_MCU)
+DECLARE_CLASS_CHECKERS(RX62NClass, RX62N_MCU,
+                       TYPE_RX62N_MCU)
 
 /*
  * IRQ -> IPR mapping table
diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 544f5f19b3..2ce96dc56e 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -38,8 +38,8 @@
 #define TYPE_AM53C974_DEVICE "am53c974"
 
 typedef struct PCIESPState PCIESPState;
-#define PCI_ESP(obj) \
-    OBJECT_CHECK(PCIESPState, (obj), TYPE_AM53C974_DEVICE)
+DECLARE_INSTANCE_CHECKER(PCIESPState, PCI_ESP,
+                         TYPE_AM53C974_DEVICE)
 
 #define DMA_CMD   0x0
 #define DMA_STC   0x1
@@ -417,8 +417,8 @@ struct DC390State {
 typedef struct DC390State DC390State;
 
 #define TYPE_DC390_DEVICE "dc390"
-#define DC390(obj) \
-    OBJECT_CHECK(DC390State, obj, TYPE_DC390_DEVICE)
+DECLARE_INSTANCE_CHECKER(DC390State, DC390,
+                         TYPE_DC390_DEVICE)
 
 #define EE_ADAPT_SCSI_ID 64
 #define EE_MODE2         65
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 0e40587c18..e8354a47da 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -310,8 +310,8 @@ typedef struct LSIState LSIState;
 #define TYPE_LSI53C810  "lsi53c810"
 #define TYPE_LSI53C895A "lsi53c895a"
 
-#define LSI53C895A(obj) \
-    OBJECT_CHECK(LSIState, (obj), TYPE_LSI53C895A)
+DECLARE_INSTANCE_CHECKER(LSIState, LSI53C895A,
+                         TYPE_LSI53C895A)
 
 static const char *scsi_phases[] = {
     "DOUT",
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index aab0b36598..e90c00823a 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -134,13 +134,9 @@ typedef struct MegasasBaseClass MegasasBaseClass;
 #define TYPE_MEGASAS_GEN1 "megasas"
 #define TYPE_MEGASAS_GEN2 "megasas-gen2"
 
-#define MEGASAS(obj) \
-    OBJECT_CHECK(MegasasState, (obj), TYPE_MEGASAS_BASE)
+DECLARE_OBJ_CHECKERS(MegasasState, MegasasBaseClass,
+                     MEGASAS, TYPE_MEGASAS_BASE)
 
-#define MEGASAS_CLASS(oc) \
-    OBJECT_CLASS_CHECK(MegasasBaseClass, (oc), TYPE_MEGASAS_BASE)
-#define MEGASAS_GET_CLASS(oc) \
-    OBJECT_GET_CLASS(MegasasBaseClass, (oc), TYPE_MEGASAS_BASE)
 
 #define MEGASAS_INTR_DISABLED_MASK 0xFFFFFFFF
 
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 2353030cb6..8cb194e87f 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -57,12 +57,8 @@
 
 typedef struct SCSIDiskClass SCSIDiskClass;
 typedef struct SCSIDiskState SCSIDiskState;
-#define SCSI_DISK_BASE(obj) \
-     OBJECT_CHECK(SCSIDiskState, (obj), TYPE_SCSI_DISK_BASE)
-#define SCSI_DISK_BASE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(SCSIDiskClass, (klass), TYPE_SCSI_DISK_BASE)
-#define SCSI_DISK_BASE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(SCSIDiskClass, (obj), TYPE_SCSI_DISK_BASE)
+DECLARE_OBJ_CHECKERS(SCSIDiskState, SCSIDiskClass,
+                     SCSI_DISK_BASE, TYPE_SCSI_DISK_BASE)
 
 struct SCSIDiskClass {
     SCSIDeviceClass parent_class;
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index b6ab78d08a..e7e95cb701 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -92,8 +92,8 @@ typedef struct vscsi_req {
 
 #define TYPE_VIO_SPAPR_VSCSI_DEVICE "spapr-vscsi"
 typedef struct VSCSIState VSCSIState;
-#define VIO_SPAPR_VSCSI_DEVICE(obj) \
-     OBJECT_CHECK(VSCSIState, (obj), TYPE_VIO_SPAPR_VSCSI_DEVICE)
+DECLARE_INSTANCE_CHECKER(VSCSIState, VIO_SPAPR_VSCSI_DEVICE,
+                         TYPE_VIO_SPAPR_VSCSI_DEVICE)
 
 struct VSCSIState {
     SpaprVioDevice vdev;
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index aa0d57b970..40095bed09 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -65,12 +65,9 @@ typedef struct PVSCSIClass PVSCSIClass;
 
 #define TYPE_PVSCSI "pvscsi"
 typedef struct PVSCSIState PVSCSIState;
-#define PVSCSI(obj) OBJECT_CHECK(PVSCSIState, (obj), TYPE_PVSCSI)
+DECLARE_OBJ_CHECKERS(PVSCSIState, PVSCSIClass,
+                     PVSCSI, TYPE_PVSCSI)
 
-#define PVSCSI_CLASS(klass) \
-    OBJECT_CLASS_CHECK(PVSCSIClass, (klass), TYPE_PVSCSI)
-#define PVSCSI_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(PVSCSIClass, (obj), TYPE_PVSCSI)
 
 /* Compatibility flags for migration */
 #define PVSCSI_COMPAT_OLD_PCI_CONFIGURATION_BIT 0
diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 0da5b84398..4d3ec28f5d 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -65,8 +65,8 @@ enum {
 
 #define TYPE_MILKYMIST_MEMCARD "milkymist-memcard"
 typedef struct MilkymistMemcardState MilkymistMemcardState;
-#define MILKYMIST_MEMCARD(obj) \
-    OBJECT_CHECK(MilkymistMemcardState, (obj), TYPE_MILKYMIST_MEMCARD)
+DECLARE_INSTANCE_CHECKER(MilkymistMemcardState, MILKYMIST_MEMCARD,
+                         TYPE_MILKYMIST_MEMCARD)
 
 #define TYPE_MILKYMIST_SDBUS "milkymist-sdbus"
 
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 517c17a2c4..dd07258d4e 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -55,7 +55,8 @@ struct ssi_sd_state {
 typedef struct ssi_sd_state ssi_sd_state;
 
 #define TYPE_SSI_SD "ssi-sd"
-#define SSI_SD(obj) OBJECT_CHECK(ssi_sd_state, (obj), TYPE_SSI_SD)
+DECLARE_INSTANCE_CHECKER(ssi_sd_state, SSI_SD,
+                         TYPE_SSI_SD)
 
 /* State word bits.  */
 #define SSI_SDR_LOCKED          0x0001
diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
index 378d44b946..dc73845125 100644
--- a/hw/sh4/sh_pci.c
+++ b/hw/sh4/sh_pci.c
@@ -36,8 +36,8 @@
 #define TYPE_SH_PCI_HOST_BRIDGE "sh_pci"
 
 typedef struct SHPCIState SHPCIState;
-#define SH_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(SHPCIState, (obj), TYPE_SH_PCI_HOST_BRIDGE)
+DECLARE_INSTANCE_CHECKER(SHPCIState, SH_PCI_HOST_BRIDGE,
+                         TYPE_SH_PCI_HOST_BRIDGE)
 
 struct SHPCIState {
     PCIHostState parent_obj;
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 5772e2f336..5ed922d436 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -593,8 +593,8 @@ static void idreg_init(hwaddr addr)
 }
 
 typedef struct IDRegState IDRegState;
-#define MACIO_ID_REGISTER(obj) \
-    OBJECT_CHECK(IDRegState, (obj), TYPE_MACIO_ID_REGISTER)
+DECLARE_INSTANCE_CHECKER(IDRegState, MACIO_ID_REGISTER,
+                         TYPE_MACIO_ID_REGISTER)
 
 struct IDRegState {
     SysBusDevice parent_obj;
@@ -636,7 +636,8 @@ static const TypeInfo idreg_info = {
 
 #define TYPE_TCX_AFX "tcx_afx"
 typedef struct AFXState AFXState;
-#define TCX_AFX(obj) OBJECT_CHECK(AFXState, (obj), TYPE_TCX_AFX)
+DECLARE_INSTANCE_CHECKER(AFXState, TCX_AFX,
+                         TYPE_TCX_AFX)
 
 struct AFXState {
     SysBusDevice parent_obj;
@@ -690,7 +691,8 @@ static const TypeInfo afx_info = {
 
 #define TYPE_OPENPROM "openprom"
 typedef struct PROMState PROMState;
-#define OPENPROM(obj) OBJECT_CHECK(PROMState, (obj), TYPE_OPENPROM)
+DECLARE_INSTANCE_CHECKER(PROMState, OPENPROM,
+                         TYPE_OPENPROM)
 
 struct PROMState {
     SysBusDevice parent_obj;
@@ -779,7 +781,8 @@ static const TypeInfo prom_info = {
 
 #define TYPE_SUN4M_MEMORY "memory"
 typedef struct RamDevice RamDevice;
-#define SUN4M_RAM(obj) OBJECT_CHECK(RamDevice, (obj), TYPE_SUN4M_MEMORY)
+DECLARE_INSTANCE_CHECKER(RamDevice, SUN4M_RAM,
+                         TYPE_SUN4M_MEMORY)
 
 struct RamDevice {
     SysBusDevice parent_obj;
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 7aab59dea9..67985414e2 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -93,7 +93,8 @@ struct EbusState {
 typedef struct EbusState EbusState;
 
 #define TYPE_EBUS "ebus"
-#define EBUS(obj) OBJECT_CHECK(EbusState, (obj), TYPE_EBUS)
+DECLARE_INSTANCE_CHECKER(EbusState, EBUS,
+                         TYPE_EBUS)
 
 const char *fw_cfg_arch_key_name(uint16_t key)
 {
@@ -229,7 +230,8 @@ typedef struct ResetData {
 
 #define TYPE_SUN4U_POWER "power"
 typedef struct PowerDevice PowerDevice;
-#define SUN4U_POWER(obj) OBJECT_CHECK(PowerDevice, (obj), TYPE_SUN4U_POWER)
+DECLARE_INSTANCE_CHECKER(PowerDevice, SUN4U_POWER,
+                         TYPE_SUN4U_POWER)
 
 struct PowerDevice {
     SysBusDevice parent_obj;
@@ -403,7 +405,8 @@ static const TypeInfo ebus_info = {
 
 #define TYPE_OPENPROM "openprom"
 typedef struct PROMState PROMState;
-#define OPENPROM(obj) OBJECT_CHECK(PROMState, (obj), TYPE_OPENPROM)
+DECLARE_INSTANCE_CHECKER(PROMState, OPENPROM,
+                         TYPE_OPENPROM)
 
 struct PROMState {
     SysBusDevice parent_obj;
@@ -492,7 +495,8 @@ static const TypeInfo prom_info = {
 
 #define TYPE_SUN4U_MEMORY "memory"
 typedef struct RamDevice RamDevice;
-#define SUN4U_RAM(obj) OBJECT_CHECK(RamDevice, (obj), TYPE_SUN4U_MEMORY)
+DECLARE_INSTANCE_CHECKER(RamDevice, SUN4U_RAM,
+                         TYPE_SUN4U_MEMORY)
 
 struct RamDevice {
     SysBusDevice parent_obj;
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 5366a80d45..faf7633e70 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -24,7 +24,8 @@ struct SSIBus {
 };
 
 #define TYPE_SSI_BUS "SSI"
-#define SSI_BUS(obj) OBJECT_CHECK(SSIBus, (obj), TYPE_SSI_BUS)
+DECLARE_INSTANCE_CHECKER(SSIBus, SSI_BUS,
+                         TYPE_SSI_BUS)
 
 static const TypeInfo ssi_bus_info = {
     .name = TYPE_SSI_BUS,
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index 8ed83bec8a..34fc8da69a 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -80,7 +80,8 @@
 
 #define TYPE_XILINX_SPI "xlnx.xps-spi"
 typedef struct XilinxSPI XilinxSPI;
-#define XILINX_SPI(obj) OBJECT_CHECK(XilinxSPI, (obj), TYPE_XILINX_SPI)
+DECLARE_INSTANCE_CHECKER(XilinxSPI, XILINX_SPI,
+                         TYPE_XILINX_SPI)
 
 struct XilinxSPI {
     SysBusDevice parent_obj;
diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c
index 93bd5b9587..c694c98d08 100644
--- a/hw/timer/altera_timer.c
+++ b/hw/timer/altera_timer.c
@@ -46,8 +46,8 @@
 
 #define TYPE_ALTERA_TIMER "ALTR.timer"
 typedef struct AlteraTimer AlteraTimer;
-#define ALTERA_TIMER(obj) \
-    OBJECT_CHECK(AlteraTimer, (obj), TYPE_ALTERA_TIMER)
+DECLARE_INSTANCE_CHECKER(AlteraTimer, ALTERA_TIMER,
+                         TYPE_ALTERA_TIMER)
 
 struct AlteraTimer {
     SysBusDevice  busdev;
diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index d728a80937..79117f45b0 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -192,7 +192,8 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
 
 #define TYPE_SP804 "sp804"
 typedef struct SP804State SP804State;
-#define SP804(obj) OBJECT_CHECK(SP804State, (obj), TYPE_SP804)
+DECLARE_INSTANCE_CHECKER(SP804State, SP804,
+                         TYPE_SP804)
 
 struct SP804State {
     SysBusDevice parent_obj;
@@ -313,8 +314,8 @@ static void sp804_realize(DeviceState *dev, Error **errp)
 
 #define TYPE_INTEGRATOR_PIT "integrator_pit"
 typedef struct icp_pit_state icp_pit_state;
-#define INTEGRATOR_PIT(obj) \
-    OBJECT_CHECK(icp_pit_state, (obj), TYPE_INTEGRATOR_PIT)
+DECLARE_INSTANCE_CHECKER(icp_pit_state, INTEGRATOR_PIT,
+                         TYPE_INTEGRATOR_PIT)
 
 struct icp_pit_state {
     SysBusDevice parent_obj;
diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
index 24de679d9c..52e637545a 100644
--- a/hw/timer/cadence_ttc.c
+++ b/hw/timer/cadence_ttc.c
@@ -71,8 +71,8 @@ typedef struct {
 
 #define TYPE_CADENCE_TTC "cadence_ttc"
 typedef struct CadenceTTCState CadenceTTCState;
-#define CADENCE_TTC(obj) \
-    OBJECT_CHECK(CadenceTTCState, (obj), TYPE_CADENCE_TTC)
+DECLARE_INSTANCE_CHECKER(CadenceTTCState, CADENCE_TTC,
+                         TYPE_CADENCE_TTC)
 
 struct CadenceTTCState {
     SysBusDevice parent_obj;
diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 92b8999b79..48f2e3ade2 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -50,8 +50,8 @@
 
 #define TYPE_ETRAX_FS_TIMER "etraxfs,timer"
 typedef struct ETRAXTimerState ETRAXTimerState;
-#define ETRAX_TIMER(obj) \
-    OBJECT_CHECK(ETRAXTimerState, (obj), TYPE_ETRAX_FS_TIMER)
+DECLARE_INSTANCE_CHECKER(ETRAXTimerState, ETRAX_TIMER,
+                         TYPE_ETRAX_FS_TIMER)
 
 struct ETRAXTimerState {
     SysBusDevice parent_obj;
diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index aa8753ded8..0329cae3d9 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -244,8 +244,8 @@ typedef struct {
 
 #define TYPE_EXYNOS4210_MCT "exynos4210.mct"
 typedef struct Exynos4210MCTState Exynos4210MCTState;
-#define EXYNOS4210_MCT(obj) \
-    OBJECT_CHECK(Exynos4210MCTState, (obj), TYPE_EXYNOS4210_MCT)
+DECLARE_INSTANCE_CHECKER(Exynos4210MCTState, EXYNOS4210_MCT,
+                         TYPE_EXYNOS4210_MCT)
 
 struct Exynos4210MCTState {
     SysBusDevice parent_obj;
diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index 34224020c0..5340fc0425 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -104,8 +104,8 @@ typedef struct {
 
 #define TYPE_EXYNOS4210_PWM "exynos4210.pwm"
 typedef struct Exynos4210PWMState Exynos4210PWMState;
-#define EXYNOS4210_PWM(obj) \
-    OBJECT_CHECK(Exynos4210PWMState, (obj), TYPE_EXYNOS4210_PWM)
+DECLARE_INSTANCE_CHECKER(Exynos4210PWMState, EXYNOS4210_PWM,
+                         TYPE_EXYNOS4210_PWM)
 
 struct Exynos4210PWMState {
     SysBusDevice parent_obj;
diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index 91d42837c9..e539fc24f0 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -57,8 +57,8 @@
 #define TIMER_BASE            0x10
 
 typedef struct GPTimerUnit GPTimerUnit;
-#define GRLIB_GPTIMER(obj) \
-    OBJECT_CHECK(GPTimerUnit, (obj), TYPE_GRLIB_GPTIMER)
+DECLARE_INSTANCE_CHECKER(GPTimerUnit, GRLIB_GPTIMER,
+                         TYPE_GRLIB_GPTIMER)
 
 typedef struct GPTimer     GPTimer;
 
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 07b3c0f9be..44bbe3a536 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -49,7 +49,8 @@
 #define HPET_MSI_SUPPORT        0
 
 typedef struct HPETState HPETState;
-#define HPET(obj) OBJECT_CHECK(HPETState, (obj), TYPE_HPET)
+DECLARE_INSTANCE_CHECKER(HPETState, HPET,
+                         TYPE_HPET)
 
 struct HPETState;
 typedef struct HPETTimer {  /* timers */
diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
index 54639d13d8..c01ee2c72a 100644
--- a/hw/timer/i8254.c
+++ b/hw/timer/i8254.c
@@ -38,8 +38,8 @@
 #define RW_STATE_WORD1 4
 
 typedef struct PITClass PITClass;
-#define PIT_CLASS(class) OBJECT_CLASS_CHECK(PITClass, (class), TYPE_I8254)
-#define PIT_GET_CLASS(obj) OBJECT_GET_CLASS(PITClass, (obj), TYPE_I8254)
+DECLARE_CLASS_CHECKERS(PITClass, PIT,
+                       TYPE_I8254)
 
 struct PITClass {
     PITCommonClass parent_class;
diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c
index 807ceb514c..93ecb51a97 100644
--- a/hw/timer/lm32_timer.c
+++ b/hw/timer/lm32_timer.c
@@ -57,7 +57,8 @@ enum {
 
 #define TYPE_LM32_TIMER "lm32-timer"
 typedef struct LM32TimerState LM32TimerState;
-#define LM32_TIMER(obj) OBJECT_CHECK(LM32TimerState, (obj), TYPE_LM32_TIMER)
+DECLARE_INSTANCE_CHECKER(LM32TimerState, LM32_TIMER,
+                         TYPE_LM32_TIMER)
 
 struct LM32TimerState {
     SysBusDevice parent_obj;
diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
index 3667a09c99..29500e0457 100644
--- a/hw/timer/milkymist-sysctl.c
+++ b/hw/timer/milkymist-sysctl.c
@@ -64,8 +64,8 @@ enum {
 
 #define TYPE_MILKYMIST_SYSCTL "milkymist-sysctl"
 typedef struct MilkymistSysctlState MilkymistSysctlState;
-#define MILKYMIST_SYSCTL(obj) \
-    OBJECT_CHECK(MilkymistSysctlState, (obj), TYPE_MILKYMIST_SYSCTL)
+DECLARE_INSTANCE_CHECKER(MilkymistSysctlState, MILKYMIST_SYSCTL,
+                         TYPE_MILKYMIST_SYSCTL)
 
 struct MilkymistSysctlState {
     SysBusDevice parent_obj;
diff --git a/hw/timer/puv3_ost.c b/hw/timer/puv3_ost.c
index 8d61c670de..3a35ac2b0a 100644
--- a/hw/timer/puv3_ost.c
+++ b/hw/timer/puv3_ost.c
@@ -22,7 +22,8 @@
 
 #define TYPE_PUV3_OST "puv3_ost"
 typedef struct PUV3OSTState PUV3OSTState;
-#define PUV3_OST(obj) OBJECT_CHECK(PUV3OSTState, (obj), TYPE_PUV3_OST)
+DECLARE_INSTANCE_CHECKER(PUV3OSTState, PUV3_OST,
+                         TYPE_PUV3_OST)
 
 /* puv3 ostimer implementation. */
 struct PUV3OSTState {
diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index c73cc721e1..8c3a1f5489 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -68,8 +68,8 @@ static int pxa2xx_timer4_freq[8] = {
 
 #define TYPE_PXA2XX_TIMER "pxa2xx-timer"
 typedef struct PXA2xxTimerInfo PXA2xxTimerInfo;
-#define PXA2XX_TIMER(obj) \
-    OBJECT_CHECK(PXA2xxTimerInfo, (obj), TYPE_PXA2XX_TIMER)
+DECLARE_INSTANCE_CHECKER(PXA2xxTimerInfo, PXA2XX_TIMER,
+                         TYPE_PXA2XX_TIMER)
 
 
 typedef struct {
diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index 28d612372b..08d6888015 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -61,8 +61,8 @@ typedef struct CPUTimerState {
 
 #define TYPE_SLAVIO_TIMER "slavio_timer"
 typedef struct SLAVIO_TIMERState SLAVIO_TIMERState;
-#define SLAVIO_TIMER(obj) \
-    OBJECT_CHECK(SLAVIO_TIMERState, (obj), TYPE_SLAVIO_TIMER)
+DECLARE_INSTANCE_CHECKER(SLAVIO_TIMERState, SLAVIO_TIMER,
+                         TYPE_SLAVIO_TIMER)
 
 struct SLAVIO_TIMERState {
     SysBusDevice parent_obj;
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index c262f6d96f..1eb927eb84 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -62,8 +62,8 @@ struct xlx_timer
 };
 
 #define TYPE_XILINX_TIMER "xlnx.xps-timer"
-#define XILINX_TIMER(obj) \
-    OBJECT_CHECK(struct timerblock, (obj), TYPE_XILINX_TIMER)
+DECLARE_INSTANCE_CHECKER(struct timerblock, XILINX_TIMER,
+                         TYPE_XILINX_TIMER)
 
 struct timerblock
 {
diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index 53e89b43e5..aa9c00aad3 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -47,7 +47,8 @@ struct CRBState {
 };
 typedef struct CRBState CRBState;
 
-#define CRB(obj) OBJECT_CHECK(CRBState, (obj), TYPE_TPM_CRB)
+DECLARE_INSTANCE_CHECKER(CRBState, CRB,
+                         TYPE_TPM_CRB)
 
 #define CRB_INTF_TYPE_CRB_ACTIVE 0b1
 #define CRB_INTF_VERSION_CRB 0b1
diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
index 08db85baea..e3775adc57 100644
--- a/hw/tpm/tpm_spapr.c
+++ b/hw/tpm/tpm_spapr.c
@@ -31,8 +31,8 @@
 #define DEBUG_SPAPR 0
 
 typedef struct SpaprTpmState SpaprTpmState;
-#define VIO_SPAPR_VTPM(obj) \
-     OBJECT_CHECK(SpaprTpmState, (obj), TYPE_TPM_SPAPR)
+DECLARE_INSTANCE_CHECKER(SpaprTpmState, VIO_SPAPR_VTPM,
+                         TYPE_TPM_SPAPR)
 
 typedef struct TpmCrq {
     uint8_t valid;  /* 0x80: cmd; 0xc0: init crq */
diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
index 9a0ab24a27..fafdcffa9c 100644
--- a/hw/tpm/tpm_tis_isa.c
+++ b/hw/tpm/tpm_tis_isa.c
@@ -40,7 +40,8 @@ struct TPMStateISA {
 };
 typedef struct TPMStateISA TPMStateISA;
 
-#define TPM_TIS_ISA(obj) OBJECT_CHECK(TPMStateISA, (obj), TYPE_TPM_TIS_ISA)
+DECLARE_INSTANCE_CHECKER(TPMStateISA, TPM_TIS_ISA,
+                         TYPE_TPM_TIS_ISA)
 
 static int tpm_tis_pre_save_isa(void *opaque)
 {
diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
index 46a92182fc..20b28eeb28 100644
--- a/hw/tpm/tpm_tis_sysbus.c
+++ b/hw/tpm/tpm_tis_sysbus.c
@@ -40,7 +40,8 @@ struct TPMStateSysBus {
 };
 typedef struct TPMStateSysBus TPMStateSysBus;
 
-#define TPM_TIS_SYSBUS(obj) OBJECT_CHECK(TPMStateSysBus, (obj), TYPE_TPM_TIS_SYSBUS)
+DECLARE_INSTANCE_CHECKER(TPMStateSysBus, TPM_TIS_SYSBUS,
+                         TYPE_TPM_TIS_SYSBUS)
 
 static int tpm_tis_pre_save_sysbus(void *opaque)
 {
diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 0742455b87..2a5b6d7738 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -47,8 +47,8 @@ do {\
 
 #define TYPE_EMULATED_CCID "ccid-card-emulated"
 typedef struct EmulatedState EmulatedState;
-#define EMULATED_CCID_CARD(obj) \
-    OBJECT_CHECK(EmulatedState, (obj), TYPE_EMULATED_CCID)
+DECLARE_INSTANCE_CHECKER(EmulatedState, EMULATED_CCID_CARD,
+                         TYPE_EMULATED_CCID)
 
 #define BACKEND_NSS_EMULATED_NAME "nss-emulated"
 #define BACKEND_CERTIFICATES_NAME "certificates"
diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index 9c9d6857da..e8e9d37e88 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -65,8 +65,8 @@ struct PassthruState {
 };
 
 #define TYPE_CCID_PASSTHRU "ccid-card-passthru"
-#define PASSTHRU_CCID_CARD(obj) \
-    OBJECT_CHECK(PassthruState, (obj), TYPE_CCID_PASSTHRU)
+DECLARE_INSTANCE_CHECKER(PassthruState, PASSTHRU_CCID_CARD,
+                         TYPE_CCID_PASSTHRU)
 
 /*
  * VSCard protocol over chardev
diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index 3fc8addae1..65247ca799 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -657,7 +657,8 @@ struct USBAudioState {
 typedef struct USBAudioState USBAudioState;
 
 #define TYPE_USB_AUDIO "usb-audio"
-#define USB_AUDIO(obj) OBJECT_CHECK(USBAudioState, (obj), TYPE_USB_AUDIO)
+DECLARE_INSTANCE_CHECKER(USBAudioState, USB_AUDIO,
+                         TYPE_USB_AUDIO)
 
 static void output_callback(void *opaque, int avail)
 {
diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
index cf81759cac..4fa651cdc3 100644
--- a/hw/usb/dev-hid.c
+++ b/hw/usb/dev-hid.c
@@ -59,7 +59,8 @@ struct USBHIDState {
 typedef struct USBHIDState USBHIDState;
 
 #define TYPE_USB_HID "usb-hid"
-#define USB_HID(obj) OBJECT_CHECK(USBHIDState, (obj), TYPE_USB_HID)
+DECLARE_INSTANCE_CHECKER(USBHIDState, USB_HID,
+                         TYPE_USB_HID)
 
 enum {
     STR_MANUFACTURER = 1,
diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
index 07e395aa5f..7a182f9bec 100644
--- a/hw/usb/dev-hub.c
+++ b/hw/usb/dev-hub.c
@@ -53,7 +53,8 @@ struct USBHubState {
 typedef struct USBHubState USBHubState;
 
 #define TYPE_USB_HUB "usb-hub"
-#define USB_HUB(obj) OBJECT_CHECK(USBHubState, (obj), TYPE_USB_HUB)
+DECLARE_INSTANCE_CHECKER(USBHubState, USB_HUB,
+                         TYPE_USB_HUB)
 
 #define ClearHubFeature		(0x2000 | USB_REQ_CLEAR_FEATURE)
 #define ClearPortFeature	(0x2300 | USB_REQ_CLEAR_FEATURE)
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 6df70a0844..c61c0e0878 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -238,7 +238,8 @@ typedef struct {
 } QEMU_PACKED ObjectInfo;
 
 #define TYPE_USB_MTP "usb-mtp"
-#define USB_MTP(obj) OBJECT_CHECK(MTPState, (obj), TYPE_USB_MTP)
+DECLARE_INSTANCE_CHECKER(MTPState, USB_MTP,
+                         TYPE_USB_MTP)
 
 #define QEMU_STORAGE_ID 0x00010001
 
diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index b60f8e52f5..cd32f57685 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -656,7 +656,8 @@ struct USBNetState {
 typedef struct USBNetState USBNetState;
 
 #define TYPE_USB_NET "usb-net"
-#define USB_NET(obj) OBJECT_CHECK(USBNetState, (obj), TYPE_USB_NET)
+DECLARE_INSTANCE_CHECKER(USBNetState, USB_NET,
+                         TYPE_USB_NET)
 
 static int is_rndis(USBNetState *s)
 {
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index 8f13f2fd31..1a58851d4b 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -113,7 +113,8 @@ struct USBSerialState {
 typedef struct USBSerialState USBSerialState;
 
 #define TYPE_USB_SERIAL "usb-serial-dev"
-#define USB_SERIAL_DEV(obj) OBJECT_CHECK(USBSerialState, (obj), TYPE_USB_SERIAL)
+DECLARE_INSTANCE_CHECKER(USBSerialState, USB_SERIAL_DEV,
+                         TYPE_USB_SERIAL)
 
 enum {
     STR_MANUFACTURER = 1,
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index a9898187b8..432508c478 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -62,7 +62,8 @@ do { \
 
 #define CCID_DEV_NAME "usb-ccid"
 typedef struct USBCCIDState USBCCIDState;
-#define USB_CCID_DEV(obj) OBJECT_CHECK(USBCCIDState, (obj), CCID_DEV_NAME)
+DECLARE_INSTANCE_CHECKER(USBCCIDState, USB_CCID_DEV,
+                         CCID_DEV_NAME)
 /*
  * The two options for variable sized buffers:
  * make them constant size, for large enough constant,
@@ -1176,7 +1177,8 @@ static Property ccid_props[] = {
 };
 
 #define TYPE_CCID_BUS "ccid-bus"
-#define CCID_BUS(obj) OBJECT_CHECK(CCIDBus, (obj), TYPE_CCID_BUS)
+DECLARE_INSTANCE_CHECKER(CCIDBus, CCID_BUS,
+                         TYPE_CCID_BUS)
 
 static const TypeInfo ccid_bus_info = {
     .name = TYPE_CCID_BUS,
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 55a04293a4..648340323f 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -70,7 +70,8 @@ struct MSDState {
 typedef struct MSDState MSDState;
 
 #define TYPE_USB_STORAGE "usb-storage-dev"
-#define USB_STORAGE_DEV(obj) OBJECT_CHECK(MSDState, (obj), TYPE_USB_STORAGE)
+DECLARE_INSTANCE_CHECKER(MSDState, USB_STORAGE_DEV,
+                         TYPE_USB_STORAGE)
 
 struct usb_msd_cbw {
     uint32_t sig;
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index 1d27bb942b..c36c8e7820 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -133,7 +133,8 @@ struct UASDevice {
 };
 
 #define TYPE_USB_UAS "usb-uas"
-#define USB_UAS(obj) OBJECT_CHECK(UASDevice, (obj), TYPE_USB_UAS)
+DECLARE_INSTANCE_CHECKER(UASDevice, USB_UAS,
+                         TYPE_USB_UAS)
 
 struct UASRequest {
     uint16_t     tag;
diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
index 37f42e6b9a..6e049c5379 100644
--- a/hw/usb/dev-wacom.c
+++ b/hw/usb/dev-wacom.c
@@ -62,7 +62,8 @@ struct USBWacomState {
 typedef struct USBWacomState USBWacomState;
 
 #define TYPE_USB_WACOM "usb-wacom-tablet"
-#define USB_WACOM(obj) OBJECT_CHECK(USBWacomState, (obj), TYPE_USB_WACOM)
+DECLARE_INSTANCE_CHECKER(USBWacomState, USB_WACOM,
+                         TYPE_USB_WACOM)
 
 enum {
     STR_MANUFACTURER = 1,
diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
index 82fe967196..f8168a06a3 100644
--- a/hw/usb/hcd-ohci-pci.c
+++ b/hw/usb/hcd-ohci-pci.c
@@ -33,7 +33,8 @@
 
 #define TYPE_PCI_OHCI "pci-ohci"
 typedef struct OHCIPCIState OHCIPCIState;
-#define PCI_OHCI(obj) OBJECT_CHECK(OHCIPCIState, (obj), TYPE_PCI_OHCI)
+DECLARE_INSTANCE_CHECKER(OHCIPCIState, PCI_OHCI,
+                         TYPE_PCI_OHCI)
 
 struct OHCIPCIState {
     /*< private >*/
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 31ec5f4702..27ca237d71 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -161,7 +161,8 @@ static void uhci_queue_fill(UHCIQueue *q, UHCI_TD *td);
 static void uhci_resume(void *opaque);
 
 #define TYPE_UHCI "pci-uhci-usb"
-#define UHCI(obj) OBJECT_CHECK(UHCIState, (obj), TYPE_UHCI)
+DECLARE_INSTANCE_CHECKER(UHCIState, UHCI,
+                         TYPE_UHCI)
 
 static inline int32_t uhci_queue_token(UHCI_TD *td)
 {
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index fbece485f0..d4d89a20c9 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -57,8 +57,8 @@
 
 #define TYPE_USB_HOST_DEVICE "usb-host"
 typedef struct USBHostDevice USBHostDevice;
-#define USB_HOST_DEVICE(obj) \
-     OBJECT_CHECK(USBHostDevice, (obj), TYPE_USB_HOST_DEVICE)
+DECLARE_INSTANCE_CHECKER(USBHostDevice, USB_HOST_DEVICE,
+                         TYPE_USB_HOST_DEVICE)
 
 typedef struct USBHostRequest USBHostRequest;
 typedef struct USBHostIsoXfer USBHostIsoXfer;
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 344fdc3d66..a079ecd50c 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -145,7 +145,8 @@ struct USBRedirDevice {
 };
 
 #define TYPE_USB_REDIR "usb-redir"
-#define USB_REDIRECT(obj) OBJECT_CHECK(USBRedirDevice, (obj), TYPE_USB_REDIR)
+DECLARE_INSTANCE_CHECKER(USBRedirDevice, USB_REDIRECT,
+                         TYPE_USB_REDIR)
 
 static void usbredir_hello(void *priv, struct usb_redir_hello_header *h);
 static void usbredir_device_connect(void *priv,
diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
index a15ee515d7..2bee3ae59f 100644
--- a/hw/usb/tusb6010.c
+++ b/hw/usb/tusb6010.c
@@ -32,7 +32,8 @@
 
 #define TYPE_TUSB6010 "tusb6010"
 typedef struct TUSBState TUSBState;
-#define TUSB(obj) OBJECT_CHECK(TUSBState, (obj), TYPE_TUSB6010)
+DECLARE_INSTANCE_CHECKER(TUSBState, TUSB,
+                         TYPE_TUSB6010)
 
 struct TUSBState {
     SysBusDevice parent_obj;
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index eb74e57b23..f399ec0a31 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -38,8 +38,8 @@ struct VFIOAPDevice {
 };
 typedef struct VFIOAPDevice VFIOAPDevice;
 
-#define VFIO_AP_DEVICE(obj) \
-        OBJECT_CHECK(VFIOAPDevice, (obj), VFIO_AP_DEVICE_TYPE)
+DECLARE_INSTANCE_CHECKER(VFIOAPDevice, VFIO_AP_DEVICE,
+                         VFIO_AP_DEVICE_TYPE)
 
 static void vfio_ap_compute_needs_reset(VFIODevice *vdev)
 {
diff --git a/hw/virtio/vhost-scsi-pci.c b/hw/virtio/vhost-scsi-pci.c
index b30a04d7cd..cb71a294fa 100644
--- a/hw/virtio/vhost-scsi-pci.c
+++ b/hw/virtio/vhost-scsi-pci.c
@@ -30,8 +30,8 @@ typedef struct VHostSCSIPCI VHostSCSIPCI;
  * vhost-scsi-pci: This extends VirtioPCIProxy.
  */
 #define TYPE_VHOST_SCSI_PCI "vhost-scsi-pci-base"
-#define VHOST_SCSI_PCI(obj) \
-        OBJECT_CHECK(VHostSCSIPCI, (obj), TYPE_VHOST_SCSI_PCI)
+DECLARE_INSTANCE_CHECKER(VHostSCSIPCI, VHOST_SCSI_PCI,
+                         TYPE_VHOST_SCSI_PCI)
 
 struct VHostSCSIPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/vhost-user-blk-pci.c b/hw/virtio/vhost-user-blk-pci.c
index 51d0858281..33b404d8a2 100644
--- a/hw/virtio/vhost-user-blk-pci.c
+++ b/hw/virtio/vhost-user-blk-pci.c
@@ -35,8 +35,8 @@ typedef struct VHostUserBlkPCI VHostUserBlkPCI;
  * vhost-user-blk-pci: This extends VirtioPCIProxy.
  */
 #define TYPE_VHOST_USER_BLK_PCI "vhost-user-blk-pci-base"
-#define VHOST_USER_BLK_PCI(obj) \
-        OBJECT_CHECK(VHostUserBlkPCI, (obj), TYPE_VHOST_USER_BLK_PCI)
+DECLARE_INSTANCE_CHECKER(VHostUserBlkPCI, VHOST_USER_BLK_PCI,
+                         TYPE_VHOST_USER_BLK_PCI)
 
 struct VHostUserBlkPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
index 6b01561c2f..8bb389bd28 100644
--- a/hw/virtio/vhost-user-fs-pci.c
+++ b/hw/virtio/vhost-user-fs-pci.c
@@ -26,8 +26,8 @@ typedef struct VHostUserFSPCI VHostUserFSPCI;
 
 #define TYPE_VHOST_USER_FS_PCI "vhost-user-fs-pci-base"
 
-#define VHOST_USER_FS_PCI(obj) \
-        OBJECT_CHECK(VHostUserFSPCI, (obj), TYPE_VHOST_USER_FS_PCI)
+DECLARE_INSTANCE_CHECKER(VHostUserFSPCI, VHOST_USER_FS_PCI,
+                         TYPE_VHOST_USER_FS_PCI)
 
 static Property vhost_user_fs_pci_properties[] = {
     DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
diff --git a/hw/virtio/vhost-user-input-pci.c b/hw/virtio/vhost-user-input-pci.c
index b072fb576a..c9d3e9113a 100644
--- a/hw/virtio/vhost-user-input-pci.c
+++ b/hw/virtio/vhost-user-input-pci.c
@@ -16,8 +16,8 @@ typedef struct VHostUserInputPCI VHostUserInputPCI;
 
 #define TYPE_VHOST_USER_INPUT_PCI "vhost-user-input-pci"
 
-#define VHOST_USER_INPUT_PCI(obj) \
-    OBJECT_CHECK(VHostUserInputPCI, (obj), TYPE_VHOST_USER_INPUT_PCI)
+DECLARE_INSTANCE_CHECKER(VHostUserInputPCI, VHOST_USER_INPUT_PCI,
+                         TYPE_VHOST_USER_INPUT_PCI)
 
 struct VHostUserInputPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/vhost-user-scsi-pci.c b/hw/virtio/vhost-user-scsi-pci.c
index 773104e351..d5343412a1 100644
--- a/hw/virtio/vhost-user-scsi-pci.c
+++ b/hw/virtio/vhost-user-scsi-pci.c
@@ -36,8 +36,8 @@
 typedef struct VHostUserSCSIPCI VHostUserSCSIPCI;
 
 #define TYPE_VHOST_USER_SCSI_PCI "vhost-user-scsi-pci-base"
-#define VHOST_USER_SCSI_PCI(obj) \
-        OBJECT_CHECK(VHostUserSCSIPCI, (obj), TYPE_VHOST_USER_SCSI_PCI)
+DECLARE_INSTANCE_CHECKER(VHostUserSCSIPCI, VHOST_USER_SCSI_PCI,
+                         TYPE_VHOST_USER_SCSI_PCI)
 
 struct VHostUserSCSIPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/vhost-user-vsock-pci.c b/hw/virtio/vhost-user-vsock-pci.c
index 65bfc91d2d..763f89984e 100644
--- a/hw/virtio/vhost-user-vsock-pci.c
+++ b/hw/virtio/vhost-user-vsock-pci.c
@@ -21,8 +21,8 @@ typedef struct VHostUserVSockPCI VHostUserVSockPCI;
  * vhost-user-vsock-pci: This extends VirtioPCIProxy.
  */
 #define TYPE_VHOST_USER_VSOCK_PCI "vhost-user-vsock-pci-base"
-#define VHOST_USER_VSOCK_PCI(obj) \
-        OBJECT_CHECK(VHostUserVSockPCI, (obj), TYPE_VHOST_USER_VSOCK_PCI)
+DECLARE_INSTANCE_CHECKER(VHostUserVSockPCI, VHOST_USER_VSOCK_PCI,
+                         TYPE_VHOST_USER_VSOCK_PCI)
 
 struct VHostUserVSockPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/vhost-vsock-pci.c b/hw/virtio/vhost-vsock-pci.c
index 49fcddcb5a..e56067b427 100644
--- a/hw/virtio/vhost-vsock-pci.c
+++ b/hw/virtio/vhost-vsock-pci.c
@@ -25,8 +25,8 @@ typedef struct VHostVSockPCI VHostVSockPCI;
  * vhost-vsock-pci: This extends VirtioPCIProxy.
  */
 #define TYPE_VHOST_VSOCK_PCI "vhost-vsock-pci-base"
-#define VHOST_VSOCK_PCI(obj) \
-        OBJECT_CHECK(VHostVSockPCI, (obj), TYPE_VHOST_VSOCK_PCI)
+DECLARE_INSTANCE_CHECKER(VHostVSockPCI, VHOST_VSOCK_PCI,
+                         TYPE_VHOST_VSOCK_PCI)
 
 struct VHostVSockPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/virtio-9p-pci.c b/hw/virtio/virtio-9p-pci.c
index 8ea357b868..e07adcd9ea 100644
--- a/hw/virtio/virtio-9p-pci.c
+++ b/hw/virtio/virtio-9p-pci.c
@@ -27,8 +27,8 @@
 
 #define TYPE_VIRTIO_9P_PCI "virtio-9p-pci-base"
 typedef struct V9fsPCIState V9fsPCIState;
-#define VIRTIO_9P_PCI(obj) \
-        OBJECT_CHECK(V9fsPCIState, (obj), TYPE_VIRTIO_9P_PCI)
+DECLARE_INSTANCE_CHECKER(V9fsPCIState, VIRTIO_9P_PCI,
+                         TYPE_VIRTIO_9P_PCI)
 
 struct V9fsPCIState {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/virtio-balloon-pci.c b/hw/virtio/virtio-balloon-pci.c
index 35378c7309..a2c5cc7207 100644
--- a/hw/virtio/virtio-balloon-pci.c
+++ b/hw/virtio/virtio-balloon-pci.c
@@ -27,8 +27,8 @@ typedef struct VirtIOBalloonPCI VirtIOBalloonPCI;
  * virtio-balloon-pci: This extends VirtioPCIProxy.
  */
 #define TYPE_VIRTIO_BALLOON_PCI "virtio-balloon-pci-base"
-#define VIRTIO_BALLOON_PCI(obj) \
-        OBJECT_CHECK(VirtIOBalloonPCI, (obj), TYPE_VIRTIO_BALLOON_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIOBalloonPCI, VIRTIO_BALLOON_PCI,
+                         TYPE_VIRTIO_BALLOON_PCI)
 
 struct VirtIOBalloonPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/virtio-blk-pci.c b/hw/virtio/virtio-blk-pci.c
index a2aa614ef4..9d5795810c 100644
--- a/hw/virtio/virtio-blk-pci.c
+++ b/hw/virtio/virtio-blk-pci.c
@@ -30,8 +30,8 @@ typedef struct VirtIOBlkPCI VirtIOBlkPCI;
  * virtio-blk-pci: This extends VirtioPCIProxy.
  */
 #define TYPE_VIRTIO_BLK_PCI "virtio-blk-pci-base"
-#define VIRTIO_BLK_PCI(obj) \
-        OBJECT_CHECK(VirtIOBlkPCI, (obj), TYPE_VIRTIO_BLK_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIOBlkPCI, VIRTIO_BLK_PCI,
+                         TYPE_VIRTIO_BLK_PCI)
 
 struct VirtIOBlkPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/virtio-crypto-pci.c b/hw/virtio/virtio-crypto-pci.c
index 518a87a36e..0783dc2f7e 100644
--- a/hw/virtio/virtio-crypto-pci.c
+++ b/hw/virtio/virtio-crypto-pci.c
@@ -29,8 +29,8 @@ typedef struct VirtIOCryptoPCI VirtIOCryptoPCI;
  * virtio-crypto-pci: This extends VirtioPCIProxy.
  */
 #define TYPE_VIRTIO_CRYPTO_PCI "virtio-crypto-pci"
-#define VIRTIO_CRYPTO_PCI(obj) \
-        OBJECT_CHECK(VirtIOCryptoPCI, (obj), TYPE_VIRTIO_CRYPTO_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIOCryptoPCI, VIRTIO_CRYPTO_PCI,
+                         TYPE_VIRTIO_CRYPTO_PCI)
 
 struct VirtIOCryptoPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/virtio-input-host-pci.c b/hw/virtio/virtio-input-host-pci.c
index 4d8479c92e..0ac360de4f 100644
--- a/hw/virtio/virtio-input-host-pci.c
+++ b/hw/virtio/virtio-input-host-pci.c
@@ -16,8 +16,8 @@
 typedef struct VirtIOInputHostPCI VirtIOInputHostPCI;
 
 #define TYPE_VIRTIO_INPUT_HOST_PCI "virtio-input-host-pci"
-#define VIRTIO_INPUT_HOST_PCI(obj) \
-        OBJECT_CHECK(VirtIOInputHostPCI, (obj), TYPE_VIRTIO_INPUT_HOST_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIOInputHostPCI, VIRTIO_INPUT_HOST_PCI,
+                         TYPE_VIRTIO_INPUT_HOST_PCI)
 
 struct VirtIOInputHostPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/virtio-input-pci.c b/hw/virtio/virtio-input-pci.c
index 429dd4d7ab..85acd3d2eb 100644
--- a/hw/virtio/virtio-input-pci.c
+++ b/hw/virtio/virtio-input-pci.c
@@ -20,8 +20,8 @@ typedef struct VirtIOInputHIDPCI VirtIOInputHIDPCI;
 /*
  * virtio-input-pci: This extends VirtioPCIProxy.
  */
-#define VIRTIO_INPUT_PCI(obj) \
-        OBJECT_CHECK(VirtIOInputPCI, (obj), TYPE_VIRTIO_INPUT_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIOInputPCI, VIRTIO_INPUT_PCI,
+                         TYPE_VIRTIO_INPUT_PCI)
 
 struct VirtIOInputPCI {
     VirtIOPCIProxy parent_obj;
@@ -32,8 +32,8 @@ struct VirtIOInputPCI {
 #define TYPE_VIRTIO_KEYBOARD_PCI  "virtio-keyboard-pci"
 #define TYPE_VIRTIO_MOUSE_PCI     "virtio-mouse-pci"
 #define TYPE_VIRTIO_TABLET_PCI    "virtio-tablet-pci"
-#define VIRTIO_INPUT_HID_PCI(obj) \
-        OBJECT_CHECK(VirtIOInputHIDPCI, (obj), TYPE_VIRTIO_INPUT_HID_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIOInputHIDPCI, VIRTIO_INPUT_HID_PCI,
+                         TYPE_VIRTIO_INPUT_HID_PCI)
 
 struct VirtIOInputHIDPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 17451f5a78..76540e57b1 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -24,8 +24,8 @@ typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
  * virtio-iommu-pci: This extends VirtioPCIProxy.
  *
  */
-#define VIRTIO_IOMMU_PCI(obj) \
-        OBJECT_CHECK(VirtIOIOMMUPCI, (obj), TYPE_VIRTIO_IOMMU_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIOIOMMUPCI, VIRTIO_IOMMU_PCI,
+                         TYPE_VIRTIO_IOMMU_PCI)
 
 struct VirtIOIOMMUPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/virtio-net-pci.c b/hw/virtio/virtio-net-pci.c
index 498fc02d8f..292d13d278 100644
--- a/hw/virtio/virtio-net-pci.c
+++ b/hw/virtio/virtio-net-pci.c
@@ -30,8 +30,8 @@ typedef struct VirtIONetPCI VirtIONetPCI;
  * virtio-net-pci: This extends VirtioPCIProxy.
  */
 #define TYPE_VIRTIO_NET_PCI "virtio-net-pci-base"
-#define VIRTIO_NET_PCI(obj) \
-        OBJECT_CHECK(VirtIONetPCI, (obj), TYPE_VIRTIO_NET_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIONetPCI, VIRTIO_NET_PCI,
+                         TYPE_VIRTIO_NET_PCI)
 
 struct VirtIONetPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/virtio-rng-pci.c b/hw/virtio/virtio-rng-pci.c
index 8f953dff83..c1f916268b 100644
--- a/hw/virtio/virtio-rng-pci.c
+++ b/hw/virtio/virtio-rng-pci.c
@@ -23,8 +23,8 @@ typedef struct VirtIORngPCI VirtIORngPCI;
  * virtio-rng-pci: This extends VirtioPCIProxy.
  */
 #define TYPE_VIRTIO_RNG_PCI "virtio-rng-pci-base"
-#define VIRTIO_RNG_PCI(obj) \
-        OBJECT_CHECK(VirtIORngPCI, (obj), TYPE_VIRTIO_RNG_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIORngPCI, VIRTIO_RNG_PCI,
+                         TYPE_VIRTIO_RNG_PCI)
 
 struct VirtIORngPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/virtio-scsi-pci.c b/hw/virtio/virtio-scsi-pci.c
index 7a7ffa43f8..97fab74236 100644
--- a/hw/virtio/virtio-scsi-pci.c
+++ b/hw/virtio/virtio-scsi-pci.c
@@ -27,8 +27,8 @@ typedef struct VirtIOSCSIPCI VirtIOSCSIPCI;
  * virtio-scsi-pci: This extends VirtioPCIProxy.
  */
 #define TYPE_VIRTIO_SCSI_PCI "virtio-scsi-pci-base"
-#define VIRTIO_SCSI_PCI(obj) \
-        OBJECT_CHECK(VirtIOSCSIPCI, (obj), TYPE_VIRTIO_SCSI_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIOSCSIPCI, VIRTIO_SCSI_PCI,
+                         TYPE_VIRTIO_SCSI_PCI)
 
 struct VirtIOSCSIPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/virtio-serial-pci.c b/hw/virtio/virtio-serial-pci.c
index 1bd769e88d..35bcd961c9 100644
--- a/hw/virtio/virtio-serial-pci.c
+++ b/hw/virtio/virtio-serial-pci.c
@@ -29,8 +29,8 @@ typedef struct VirtIOSerialPCI VirtIOSerialPCI;
  * virtio-serial-pci: This extends VirtioPCIProxy.
  */
 #define TYPE_VIRTIO_SERIAL_PCI "virtio-serial-pci-base"
-#define VIRTIO_SERIAL_PCI(obj) \
-        OBJECT_CHECK(VirtIOSerialPCI, (obj), TYPE_VIRTIO_SERIAL_PCI)
+DECLARE_INSTANCE_CHECKER(VirtIOSerialPCI, VIRTIO_SERIAL_PCI,
+                         TYPE_VIRTIO_SERIAL_PCI)
 
 struct VirtIOSerialPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index eaa2b39ab8..4f64899a56 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -105,8 +105,8 @@ struct I6300State {
 typedef struct I6300State I6300State;
 
 #define TYPE_WATCHDOG_I6300ESB_DEVICE "i6300esb"
-#define WATCHDOG_I6300ESB_DEVICE(obj) \
-    OBJECT_CHECK(I6300State, (obj), TYPE_WATCHDOG_I6300ESB_DEVICE)
+DECLARE_INSTANCE_CHECKER(I6300State, WATCHDOG_I6300ESB_DEVICE,
+                         TYPE_WATCHDOG_I6300ESB_DEVICE)
 
 /* This function is called when the watchdog has either been enabled
  * (hence it starts counting down) or has been keep-alived.
diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
index 1a7a8f695f..177aaa503f 100644
--- a/hw/watchdog/wdt_ib700.c
+++ b/hw/watchdog/wdt_ib700.c
@@ -38,7 +38,8 @@
 
 #define TYPE_IB700 "ib700"
 typedef struct IB700state IB700State;
-#define IB700(obj) OBJECT_CHECK(IB700State, (obj), TYPE_IB700)
+DECLARE_INSTANCE_CHECKER(IB700State, IB700,
+                         TYPE_IB700)
 
 struct IB700state {
     ISADevice parent_obj;
diff --git a/iothread.c b/iothread.c
index 263ec6e5bc..3a3860a09c 100644
--- a/iothread.c
+++ b/iothread.c
@@ -26,10 +26,8 @@
 
 typedef ObjectClass IOThreadClass;
 
-#define IOTHREAD_GET_CLASS(obj) \
-   OBJECT_GET_CLASS(IOThreadClass, obj, TYPE_IOTHREAD)
-#define IOTHREAD_CLASS(klass) \
-   OBJECT_CLASS_CHECK(IOThreadClass, klass, TYPE_IOTHREAD)
+DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
+                       TYPE_IOTHREAD)
 
 #ifdef CONFIG_POSIX
 /* Benchmark results from 2016 on NVMe SSD drives show max polling times around
diff --git a/migration/rdma.c b/migration/rdma.c
index 0a90f0d420..1dc563ec3f 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -399,8 +399,8 @@ typedef struct RDMAContext {
 
 #define TYPE_QIO_CHANNEL_RDMA "qio-channel-rdma"
 typedef struct QIOChannelRDMA QIOChannelRDMA;
-#define QIO_CHANNEL_RDMA(obj)                                     \
-    OBJECT_CHECK(QIOChannelRDMA, (obj), TYPE_QIO_CHANNEL_RDMA)
+DECLARE_INSTANCE_CHECKER(QIOChannelRDMA, QIO_CHANNEL_RDMA,
+                         TYPE_QIO_CHANNEL_RDMA)
 
 
 
diff --git a/net/can/can_socketcan.c b/net/can/can_socketcan.c
index 0082aa6c3e..f933bd2db2 100644
--- a/net/can/can_socketcan.c
+++ b/net/can/can_socketcan.c
@@ -48,8 +48,8 @@
 
 #define TYPE_CAN_HOST_SOCKETCAN "can-host-socketcan"
 typedef struct CanHostSocketCAN CanHostSocketCAN;
-#define CAN_HOST_SOCKETCAN(obj) \
-     OBJECT_CHECK(CanHostSocketCAN, (obj), TYPE_CAN_HOST_SOCKETCAN)
+DECLARE_INSTANCE_CHECKER(CanHostSocketCAN, CAN_HOST_SOCKETCAN,
+                         TYPE_CAN_HOST_SOCKETCAN)
 
 #define CAN_READ_BUF_LEN  5
 struct CanHostSocketCAN {
diff --git a/net/colo-compare.c b/net/colo-compare.c
index be3ca5f8c5..bc3808fb4d 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -37,8 +37,8 @@
 
 #define TYPE_COLO_COMPARE "colo-compare"
 typedef struct CompareState CompareState;
-#define COLO_COMPARE(obj) \
-    OBJECT_CHECK(CompareState, (obj), TYPE_COLO_COMPARE)
+DECLARE_INSTANCE_CHECKER(CompareState, COLO_COMPARE,
+                         TYPE_COLO_COMPARE)
 
 static QTAILQ_HEAD(, CompareState) net_compares =
        QTAILQ_HEAD_INITIALIZER(net_compares);
diff --git a/net/dump.c b/net/dump.c
index 454672d73d..42e64a6f29 100644
--- a/net/dump.c
+++ b/net/dump.c
@@ -141,8 +141,8 @@ static int net_dump_state_init(DumpState *s, const char *filename,
 #define TYPE_FILTER_DUMP "filter-dump"
 
 typedef struct NetFilterDumpState NetFilterDumpState;
-#define FILTER_DUMP(obj) \
-    OBJECT_CHECK(NetFilterDumpState, (obj), TYPE_FILTER_DUMP)
+DECLARE_INSTANCE_CHECKER(NetFilterDumpState, FILTER_DUMP,
+                         TYPE_FILTER_DUMP)
 
 struct NetFilterDumpState {
     NetFilterState nfs;
diff --git a/net/filter-buffer.c b/net/filter-buffer.c
index 78f7f0b36b..6ade7a19b8 100644
--- a/net/filter-buffer.c
+++ b/net/filter-buffer.c
@@ -19,8 +19,8 @@
 #define TYPE_FILTER_BUFFER "filter-buffer"
 
 typedef struct FilterBufferState FilterBufferState;
-#define FILTER_BUFFER(obj) \
-    OBJECT_CHECK(FilterBufferState, (obj), TYPE_FILTER_BUFFER)
+DECLARE_INSTANCE_CHECKER(FilterBufferState, FILTER_BUFFER,
+                         TYPE_FILTER_BUFFER)
 
 struct FilterBufferState {
     NetFilterState parent_obj;
diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index 3fd3b90d1d..088d4dcace 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -23,12 +23,12 @@
 
 #define TYPE_FILTER_MIRROR "filter-mirror"
 typedef struct MirrorState MirrorState;
-#define FILTER_MIRROR(obj) \
-    OBJECT_CHECK(MirrorState, (obj), TYPE_FILTER_MIRROR)
+DECLARE_INSTANCE_CHECKER(MirrorState, FILTER_MIRROR,
+                         TYPE_FILTER_MIRROR)
 
 #define TYPE_FILTER_REDIRECTOR "filter-redirector"
-#define FILTER_REDIRECTOR(obj) \
-    OBJECT_CHECK(MirrorState, (obj), TYPE_FILTER_REDIRECTOR)
+DECLARE_INSTANCE_CHECKER(MirrorState, FILTER_REDIRECTOR,
+                         TYPE_FILTER_REDIRECTOR)
 
 #define REDIRECTOR_MAX_LEN NET_BUFSIZE
 
diff --git a/net/filter-replay.c b/net/filter-replay.c
index a0b99aaf86..78696c162e 100644
--- a/net/filter-replay.c
+++ b/net/filter-replay.c
@@ -24,8 +24,8 @@
 #define TYPE_FILTER_REPLAY "filter-replay"
 
 typedef struct NetFilterReplayState NetFilterReplayState;
-#define FILTER_REPLAY(obj) \
-    OBJECT_CHECK(NetFilterReplayState, (obj), TYPE_FILTER_REPLAY)
+DECLARE_INSTANCE_CHECKER(NetFilterReplayState, FILTER_REPLAY,
+                         TYPE_FILTER_REPLAY)
 
 struct NetFilterReplayState {
     NetFilterState nfs;
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index c28d959942..113e293207 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -25,8 +25,8 @@
 
 #define TYPE_FILTER_REWRITER "filter-rewriter"
 typedef struct RewriterState RewriterState;
-#define FILTER_COLO_REWRITER(obj) \
-    OBJECT_CHECK(RewriterState, (obj), TYPE_FILTER_REWRITER)
+DECLARE_INSTANCE_CHECKER(RewriterState, FILTER_COLO_REWRITER,
+                         TYPE_FILTER_REWRITER)
 
 #define FAILOVER_MODE_ON  true
 #define FAILOVER_MODE_OFF false
diff --git a/scsi/pr-manager-helper.c b/scsi/pr-manager-helper.c
index 59ba4b70ae..d735b1e7f6 100644
--- a/scsi/pr-manager-helper.c
+++ b/scsi/pr-manager-helper.c
@@ -28,9 +28,8 @@
 #define TYPE_PR_MANAGER_HELPER "pr-manager-helper"
 
 typedef struct PRManagerHelper PRManagerHelper;
-#define PR_MANAGER_HELPER(obj) \
-     OBJECT_CHECK(PRManagerHelper, (obj), \
-                  TYPE_PR_MANAGER_HELPER)
+DECLARE_INSTANCE_CHECKER(PRManagerHelper, PR_MANAGER_HELPER,
+                         TYPE_PR_MANAGER_HELPER)
 
 struct PRManagerHelper {
     /* <private> */
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 6a0d9dddd7..5f6c8a73d9 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -32,8 +32,8 @@
 
 #define TYPE_SEV_GUEST "sev-guest"
 typedef struct SevGuestState SevGuestState;
-#define SEV_GUEST(obj)                                          \
-    OBJECT_CHECK(SevGuestState, (obj), TYPE_SEV_GUEST)
+DECLARE_INSTANCE_CHECKER(SevGuestState, SEV_GUEST,
+                         TYPE_SEV_GUEST)
 
 
 /**
diff --git a/tests/check-qom-interface.c b/tests/check-qom-interface.c
index bfa9ad5d19..c99be97ed8 100644
--- a/tests/check-qom-interface.c
+++ b/tests/check-qom-interface.c
@@ -17,10 +17,8 @@
 
 #define TYPE_TEST_IF "test-interface"
 typedef struct TestIfClass TestIfClass;
-#define TEST_IF_CLASS(klass) \
-     OBJECT_CLASS_CHECK(TestIfClass, (klass), TYPE_TEST_IF)
-#define TEST_IF_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(TestIfClass, (obj), TYPE_TEST_IF)
+DECLARE_CLASS_CHECKERS(TestIfClass, TEST_IF,
+                       TYPE_TEST_IF)
 #define TEST_IF(obj) \
      INTERFACE_CHECK(TestIf, (obj), TYPE_TEST_IF)
 
diff --git a/tests/check-qom-proplist.c b/tests/check-qom-proplist.c
index e1e0a96661..1571606c1c 100644
--- a/tests/check-qom-proplist.c
+++ b/tests/check-qom-proplist.c
@@ -33,8 +33,8 @@
 typedef struct DummyObject DummyObject;
 typedef struct DummyObjectClass DummyObjectClass;
 
-#define DUMMY_OBJECT(obj)                               \
-    OBJECT_CHECK(DummyObject, (obj), TYPE_DUMMY)
+DECLARE_INSTANCE_CHECKER(DummyObject, DUMMY_OBJECT,
+                         TYPE_DUMMY)
 
 typedef enum DummyAnimal DummyAnimal;
 
@@ -196,12 +196,12 @@ typedef struct DummyBackendClass DummyBackendClass;
 #define TYPE_DUMMY_BUS "qemu-dummy-bus"
 #define TYPE_DUMMY_BACKEND "qemu-dummy-backend"
 
-#define DUMMY_DEV(obj)                               \
-    OBJECT_CHECK(DummyDev, (obj), TYPE_DUMMY_DEV)
-#define DUMMY_BUS(obj)                               \
-    OBJECT_CHECK(DummyBus, (obj), TYPE_DUMMY_BUS)
-#define DUMMY_BACKEND(obj)                               \
-    OBJECT_CHECK(DummyBackend, (obj), TYPE_DUMMY_BACKEND)
+DECLARE_INSTANCE_CHECKER(DummyDev, DUMMY_DEV,
+                         TYPE_DUMMY_DEV)
+DECLARE_INSTANCE_CHECKER(DummyBus, DUMMY_BUS,
+                         TYPE_DUMMY_BUS)
+DECLARE_INSTANCE_CHECKER(DummyBackend, DUMMY_BACKEND,
+                         TYPE_DUMMY_BACKEND)
 
 struct DummyDev {
     Object parent_obj;
diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-props.c
index c3e210a9ef..8a3c14d92c 100644
--- a/tests/test-qdev-global-props.c
+++ b/tests/test-qdev-global-props.c
@@ -32,8 +32,8 @@
 
 #define TYPE_STATIC_PROPS "static_prop_type"
 typedef struct MyType MyType;
-#define STATIC_TYPE(obj) \
-    OBJECT_CHECK(MyType, (obj), TYPE_STATIC_PROPS)
+DECLARE_INSTANCE_CHECKER(MyType, STATIC_TYPE,
+                         TYPE_STATIC_PROPS)
 
 #define TYPE_SUBCLASS "static_prop_subtype"
 
@@ -128,8 +128,8 @@ static void test_static_globalprop(void)
 }
 
 #define TYPE_DYNAMIC_PROPS "dynamic-prop-type"
-#define DYNAMIC_TYPE(obj) \
-    OBJECT_CHECK(MyType, (obj), TYPE_DYNAMIC_PROPS)
+DECLARE_INSTANCE_CHECKER(MyType, DYNAMIC_TYPE,
+                         TYPE_DYNAMIC_PROPS)
 
 #define TYPE_UNUSED_HOTPLUG   "hotplug-type"
 #define TYPE_UNUSED_NOHOTPLUG "nohotplug-type"
diff --git a/ui/console.c b/ui/console.c
index 37972cb5e0..f8d7643fe4 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1090,7 +1090,8 @@ struct VCChardev {
 typedef struct VCChardev VCChardev;
 
 #define TYPE_CHARDEV_VC "chardev-vc"
-#define VC_CHARDEV(obj) OBJECT_CHECK(VCChardev, (obj), TYPE_CHARDEV_VC)
+DECLARE_INSTANCE_CHECKER(VCChardev, VC_CHARDEV,
+                         TYPE_CHARDEV_VC)
 
 static int vc_chr_write(Chardev *chr, const uint8_t *buf, int len)
 {
diff --git a/ui/gtk.c b/ui/gtk.c
index 558c63dc22..d28d7545d3 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -179,7 +179,8 @@ struct VCChardev {
 typedef struct VCChardev VCChardev;
 
 #define TYPE_CHARDEV_VC "chardev-vc"
-#define VC_CHARDEV(obj) OBJECT_CHECK(VCChardev, (obj), TYPE_CHARDEV_VC)
+DECLARE_INSTANCE_CHECKER(VCChardev, VC_CHARDEV,
+                         TYPE_CHARDEV_VC)
 
 bool gtk_use_gl_area;
 
diff --git a/ui/input-barrier.c b/ui/input-barrier.c
index 477f6cd70e..67d52afbea 100644
--- a/ui/input-barrier.c
+++ b/ui/input-barrier.c
@@ -22,12 +22,8 @@
 #define TYPE_INPUT_BARRIER "input-barrier"
 typedef struct InputBarrier InputBarrier;
 typedef struct InputBarrierClass InputBarrierClass;
-#define INPUT_BARRIER(obj) \
-    OBJECT_CHECK(InputBarrier, (obj), TYPE_INPUT_BARRIER)
-#define INPUT_BARRIER_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(InputBarrierClass, (obj), TYPE_INPUT_BARRIER)
-#define INPUT_BARRIER_CLASS(klass) \
-    OBJECT_CLASS_CHECK(InputBarrierClass, (klass), TYPE_INPUT_BARRIER)
+DECLARE_OBJ_CHECKERS(InputBarrier, InputBarrierClass,
+                     INPUT_BARRIER, TYPE_INPUT_BARRIER)
 
 
 #define MAX_HELLO_LENGTH 1024
diff --git a/ui/input-linux.c b/ui/input-linux.c
index 1b35c044e6..bfdbd38c86 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -33,12 +33,8 @@ static bool linux_is_button(unsigned int lnx)
 #define TYPE_INPUT_LINUX "input-linux"
 typedef struct InputLinux InputLinux;
 typedef struct InputLinuxClass InputLinuxClass;
-#define INPUT_LINUX(obj) \
-    OBJECT_CHECK(InputLinux, (obj), TYPE_INPUT_LINUX)
-#define INPUT_LINUX_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(InputLinuxClass, (obj), TYPE_INPUT_LINUX)
-#define INPUT_LINUX_CLASS(klass) \
-    OBJECT_CLASS_CHECK(InputLinuxClass, (klass), TYPE_INPUT_LINUX)
+DECLARE_OBJ_CHECKERS(InputLinux, InputLinuxClass,
+                     INPUT_LINUX, TYPE_INPUT_LINUX)
 
 
 struct InputLinux {
diff --git a/ui/spice-app.c b/ui/spice-app.c
index d68a35c3b1..93e105c6ee 100644
--- a/ui/spice-app.c
+++ b/ui/spice-app.c
@@ -47,7 +47,8 @@ struct VCChardev {
 typedef struct VCChardev VCChardev;
 
 #define TYPE_CHARDEV_VC "chardev-vc"
-#define VC_CHARDEV(obj) OBJECT_CHECK(VCChardev, (obj), TYPE_CHARDEV_VC)
+DECLARE_INSTANCE_CHECKER(VCChardev, VC_CHARDEV,
+                         TYPE_CHARDEV_VC)
 
 static ChardevBackend *
 chr_spice_backend_new(void)
-- 
2.26.2


