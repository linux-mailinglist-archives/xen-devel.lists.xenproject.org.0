Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA8925260A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 06:16:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAmqH-0007bw-VB; Wed, 26 Aug 2020 04:15:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T2Dk=CD=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kAeZA-0005Ia-8H
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 19:25:08 +0000
X-Inumbo-ID: 5fad3083-ff02-4e71-ac67-3d19afc554e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5fad3083-ff02-4e71-ac67-3d19afc554e4;
 Tue, 25 Aug 2020 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HS4Z+772DI3msJJrd15rFgNkgWDHY0iJhIMFt5nSLZA=;
 b=ipvrEQgeTNQm7IilSY9rPc2mARK92sKFK0BldImU8RFmbntf7gZBVWm8teJ1Njq54Geuya
 gmF5GB8K3IxnGBaRz2DYEv3QjEbXeonaXWhYP2QDgEDKzr1r56I/vNhqHw/Uzir8+Crz72
 56XSEvIYDeGKwcfvxpVA0B9SKXPYfqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-kCzh2Sh4M-GUWZjSGrUlzg-1; Tue, 25 Aug 2020 15:24:29 -0400
X-MC-Unique: kCzh2Sh4M-GUWZjSGrUlzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D61881F025;
 Tue, 25 Aug 2020 19:24:24 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75E5A60FC2;
 Tue, 25 Aug 2020 19:23:56 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
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
 Hannes Reinecke <hare@suse.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Ben Warren <ben@skyportsystems.com>,
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
 Juan Quintela <quintela@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Zhang Chen <chen.zhang@intel.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Anthony Green <green@moxielogic.com>, Stafford Horne <shorne@gmail.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 64/74] [automated] Move QOM typedefs and add missing
 includes
Date: Tue, 25 Aug 2020 15:21:00 -0400
Message-Id: <20200825192110.3528606-65-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mailman-Approved-At: Wed, 26 Aug 2020 04:15:20 +0000
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

Some typedefs and macros are defined after the type check macros.
This makes it difficult to automatically replace their
definitions with OBJECT_DECLARE_TYPE.

Patch generated using:

 $ ./scripts/codeconverter/converter.py -i \
   --pattern=QOMStructTypedefSplit $(git grep -l '' -- '*.[ch]')

which will split "typdef struct { ... } TypedefName"
declarations.

Followed by:

 $ ./scripts/codeconverter/converter.py -i --pattern=MoveSymbols \
    $(git grep -l '' -- '*.[ch]')

which will:
- move the typedefs and #defines above the type check macros
- add missing #include "qom/object.h" lines if necessary

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Removed hunks due to rebase conflicts: hw/arm/integratorcp.c
  hw/arm/versatilepb.c hw/arm/vexpress.c hw/sd/pl181.c
  include/hw/ppc/xive.h
* Removed hunks due to conflicts with other patches in this
  series: include/hw/block/swim.h include/hw/display/macfb.h
  include/hw/rdma/rdma.h migration/migration.h
  target/rx/cpu-qom.h
* Reviewed-by line from Daniel was kept, as no additional hunks
  are introduced in this version

Changes v1 -> v2:
* Re-ran script after moving a few macros and typedefs.  Now the
  patch also changes:
  - SysbusAHCIState at hw/ide/ahci.h
  - VhostUserGPU at hw/virtio/virtio-gpu.h
  - I8257State at hw/dma/i8257.h
  - AllwinnerAHCIState at hw/ide/ahci.h
  - ISAKBDState at hw/input/i8042.h
  - PIIXState at hw/southbridge/piix.h
  - VFIOPCIDevice at hw/vfio/pci.h
  - missing include at hw/net/rocker/rocker.h
  - missing include at hw/scsi/mptsas.h
  - missing include at include/hw/arm/pxa.h
  - missing include at include/sysemu/kvm.h

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
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
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
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Tony Krowiak <akrowiak@linux.ibm.com>
Cc: Pierre Morel <pmorel@linux.ibm.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Ben Warren <ben@skyportsystems.com>
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
---
 chardev/chardev-internal.h               |  5 +-
 hw/9pfs/virtio-9p.h                      |  7 ++-
 hw/audio/intel-hda.h                     | 11 ++--
 hw/avr/atmega.h                          |  6 +-
 hw/block/nvme.h                          |  6 +-
 hw/display/ati_int.h                     |  6 +-
 hw/display/qxl.h                         |  6 +-
 hw/display/virtio-vga.h                  | 11 ++--
 hw/i386/amd_iommu.h                      |  6 +-
 hw/misc/tmp105.h                         |  6 +-
 hw/net/fsl_etsec/etsec.h                 |  6 +-
 hw/net/rocker/rocker.h                   |  1 +
 hw/net/tulip.h                           |  1 +
 hw/net/vmxnet3_defs.h                    |  6 +-
 hw/ppc/e500-ccsr.h                       |  6 +-
 hw/ppc/e500.h                            | 11 ++--
 hw/ppc/mac.h                             | 11 ++--
 hw/rdma/vmw/pvrdma.h                     |  6 +-
 hw/s390x/ccw-device.h                    | 10 ++--
 hw/s390x/ipl.h                           |  3 +-
 hw/s390x/s390-pci-bus.h                  | 18 +++---
 hw/s390x/virtio-ccw.h                    | 73 ++++++++++++++----------
 hw/scsi/mptsas.h                         |  1 +
 hw/usb/ccid.h                            |  6 +-
 hw/usb/hcd-dwc2.h                        |  1 +
 hw/usb/hcd-ehci.h                        | 21 ++++---
 hw/usb/hcd-ohci.h                        |  6 +-
 hw/usb/hcd-xhci.h                        |  3 +-
 hw/vfio/pci.h                            |  6 +-
 hw/virtio/virtio-mem-pci.h               |  1 +
 hw/virtio/virtio-pci.h                   |  6 +-
 hw/virtio/virtio-pmem-pci.h              |  1 +
 hw/xen/xen_pt.h                          |  1 +
 include/authz/base.h                     |  4 +-
 include/authz/list.h                     |  5 +-
 include/authz/listfile.h                 |  5 +-
 include/authz/pamacct.h                  |  5 +-
 include/authz/simple.h                   |  5 +-
 include/block/throttle-groups.h          |  1 +
 include/chardev/char-fd.h                |  6 +-
 include/chardev/char-win.h               |  6 +-
 include/chardev/char.h                   |  5 +-
 include/chardev/spice.h                  |  6 +-
 include/crypto/secret.h                  |  2 +-
 include/crypto/secret_common.h           |  4 +-
 include/crypto/secret_keyring.h          |  4 +-
 include/crypto/tls-cipher-suites.h       |  5 +-
 include/crypto/tlscreds.h                |  2 +-
 include/crypto/tlscredsanon.h            |  3 +-
 include/crypto/tlscredspsk.h             |  3 +-
 include/crypto/tlscredsx509.h            |  3 +-
 include/exec/memory.h                    |  5 +-
 include/hw/acpi/acpi_dev_interface.h     |  5 +-
 include/hw/acpi/generic_event_device.h   |  6 +-
 include/hw/acpi/vmgenid.h                |  6 +-
 include/hw/adc/stm32f2xx_adc.h           |  6 +-
 include/hw/arm/allwinner-a10.h           |  6 +-
 include/hw/arm/allwinner-h3.h            |  5 +-
 include/hw/arm/armsse.h                  | 11 ++--
 include/hw/arm/armv7m.h                  | 11 ++--
 include/hw/arm/aspeed.h                  |  6 +-
 include/hw/arm/aspeed_soc.h              | 11 ++--
 include/hw/arm/bcm2835_peripherals.h     |  6 +-
 include/hw/arm/bcm2836.h                 | 11 ++--
 include/hw/arm/digic.h                   |  6 +-
 include/hw/arm/exynos4210.h              |  6 +-
 include/hw/arm/fsl-imx25.h               |  6 +-
 include/hw/arm/fsl-imx31.h               |  6 +-
 include/hw/arm/fsl-imx6.h                |  6 +-
 include/hw/arm/fsl-imx6ul.h              |  6 +-
 include/hw/arm/fsl-imx7.h                |  6 +-
 include/hw/arm/linux-boot-if.h           |  5 +-
 include/hw/arm/msf2-soc.h                |  6 +-
 include/hw/arm/nrf51_soc.h               |  6 +-
 include/hw/arm/omap.h                    |  5 +-
 include/hw/arm/pxa.h                     |  1 +
 include/hw/arm/smmu-common.h             | 11 ++--
 include/hw/arm/smmuv3.h                  | 11 ++--
 include/hw/arm/stm32f205_soc.h           |  6 +-
 include/hw/arm/stm32f405_soc.h           |  6 +-
 include/hw/arm/virt.h                    | 11 ++--
 include/hw/arm/xlnx-versal.h             |  6 +-
 include/hw/arm/xlnx-zynqmp.h             |  6 +-
 include/hw/block/flash.h                 |  5 +-
 include/hw/char/avr_usart.h              |  6 +-
 include/hw/char/bcm2835_aux.h            |  6 +-
 include/hw/char/cadence_uart.h           |  6 +-
 include/hw/char/cmsdk-apb-uart.h         |  6 +-
 include/hw/char/digic-uart.h             |  6 +-
 include/hw/char/escc.h                   |  6 +-
 include/hw/char/ibex_uart.h              |  6 +-
 include/hw/char/imx_serial.h             |  6 +-
 include/hw/char/nrf51_uart.h             |  6 +-
 include/hw/char/pl011.h                  |  6 +-
 include/hw/char/renesas_sci.h            |  6 +-
 include/hw/char/serial.h                 | 16 ++++--
 include/hw/char/stm32f2xx_usart.h        |  6 +-
 include/hw/clock.h                       |  2 +-
 include/hw/core/cpu.h                    |  6 +-
 include/hw/core/generic-loader.h         |  6 +-
 include/hw/cpu/a15mpcore.h               |  6 +-
 include/hw/cpu/a9mpcore.h                |  6 +-
 include/hw/cpu/arm11mpcore.h             |  6 +-
 include/hw/cpu/cluster.h                 |  6 +-
 include/hw/cpu/core.h                    |  6 +-
 include/hw/display/bcm2835_fb.h          |  6 +-
 include/hw/display/dpcd.h                |  1 +
 include/hw/display/i2c-ddc.h             |  1 +
 include/hw/display/xlnx_dp.h             |  6 +-
 include/hw/dma/bcm2835_dma.h             |  6 +-
 include/hw/dma/i8257.h                   |  6 +-
 include/hw/dma/pl080.h                   |  6 +-
 include/hw/dma/xlnx-zdma.h               |  6 +-
 include/hw/dma/xlnx-zynq-devcfg.h        |  6 +-
 include/hw/dma/xlnx_dpdma.h              |  1 +
 include/hw/fw-path-provider.h            |  5 +-
 include/hw/gpio/aspeed_gpio.h            | 11 ++--
 include/hw/gpio/bcm2835_gpio.h           |  6 +-
 include/hw/gpio/imx_gpio.h               |  6 +-
 include/hw/gpio/nrf51_gpio.h             |  6 +-
 include/hw/hotplug.h                     |  5 +-
 include/hw/hyperv/vmbus-bridge.h         |  6 +-
 include/hw/hyperv/vmbus.h                |  8 ++-
 include/hw/i2c/arm_sbcon_i2c.h           |  6 +-
 include/hw/i2c/aspeed_i2c.h              | 11 ++--
 include/hw/i2c/i2c.h                     |  6 +-
 include/hw/i2c/imx_i2c.h                 |  6 +-
 include/hw/i2c/microbit_i2c.h            |  6 +-
 include/hw/i2c/ppc4xx_i2c.h              |  6 +-
 include/hw/i2c/smbus_slave.h             |  9 +--
 include/hw/i386/apic_internal.h          |  7 ++-
 include/hw/i386/ich9.h                   |  6 +-
 include/hw/i386/intel_iommu.h            |  3 +-
 include/hw/i386/ioapic_internal.h        |  6 +-
 include/hw/i386/microvm.h                | 11 ++--
 include/hw/i386/pc.h                     |  6 +-
 include/hw/i386/x86-iommu.h              |  5 +-
 include/hw/i386/x86.h                    | 11 ++--
 include/hw/ide/ahci.h                    | 11 ++--
 include/hw/ide/internal.h                |  6 +-
 include/hw/ide/pci.h                     |  6 +-
 include/hw/input/adb.h                   |  6 +-
 include/hw/input/i8042.h                 |  3 +-
 include/hw/intc/allwinner-a10-pic.h      |  6 +-
 include/hw/intc/arm_gic.h                |  6 +-
 include/hw/intc/arm_gic_common.h         | 11 ++--
 include/hw/intc/arm_gicv3.h              |  6 +-
 include/hw/intc/arm_gicv3_common.h       |  6 +-
 include/hw/intc/arm_gicv3_its_common.h   |  3 +-
 include/hw/intc/armv7m_nvic.h            |  6 +-
 include/hw/intc/aspeed_vic.h             |  6 +-
 include/hw/intc/bcm2835_ic.h             |  6 +-
 include/hw/intc/bcm2836_control.h        |  6 +-
 include/hw/intc/heathrow_pic.h           |  6 +-
 include/hw/intc/ibex_plic.h              |  6 +-
 include/hw/intc/imx_avic.h               |  6 +-
 include/hw/intc/imx_gpcv2.h              |  6 +-
 include/hw/intc/intc.h                   |  5 +-
 include/hw/intc/mips_gic.h               |  3 +-
 include/hw/intc/realview_gic.h           |  6 +-
 include/hw/intc/rx_icu.h                 |  1 +
 include/hw/intc/xlnx-pmu-iomod-intc.h    |  6 +-
 include/hw/intc/xlnx-zynqmp-ipi.h        |  6 +-
 include/hw/ipack/ipack.h                 |  1 +
 include/hw/ipmi/ipmi.h                   | 18 +++---
 include/hw/isa/i8259_internal.h          |  7 ++-
 include/hw/isa/isa.h                     | 11 ++--
 include/hw/isa/pc87312.h                 |  6 +-
 include/hw/isa/superio.h                 | 11 ++--
 include/hw/m68k/mcf_fec.h                |  1 +
 include/hw/mem/memory-device.h           |  5 +-
 include/hw/mem/nvdimm.h                  |  5 +-
 include/hw/mem/pc-dimm.h                 | 11 ++--
 include/hw/mips/cps.h                    |  6 +-
 include/hw/misc/a9scu.h                  |  6 +-
 include/hw/misc/allwinner-cpucfg.h       |  5 +-
 include/hw/misc/allwinner-h3-ccu.h       |  5 +-
 include/hw/misc/allwinner-h3-dramc.h     |  5 +-
 include/hw/misc/allwinner-h3-sysctrl.h   |  5 +-
 include/hw/misc/allwinner-sid.h          |  5 +-
 include/hw/misc/arm11scu.h               |  6 +-
 include/hw/misc/armsse-cpuid.h           |  6 +-
 include/hw/misc/armsse-mhu.h             |  6 +-
 include/hw/misc/aspeed_scu.h             | 11 ++--
 include/hw/misc/aspeed_sdmc.h            | 11 ++--
 include/hw/misc/aspeed_xdma.h            |  6 +-
 include/hw/misc/auxbus.h                 |  1 +
 include/hw/misc/avr_power.h              |  6 +-
 include/hw/misc/bcm2835_mbox.h           |  6 +-
 include/hw/misc/bcm2835_mphi.h           |  1 +
 include/hw/misc/bcm2835_property.h       |  6 +-
 include/hw/misc/bcm2835_rng.h            |  6 +-
 include/hw/misc/bcm2835_thermal.h        |  6 +-
 include/hw/misc/grlib_ahb_apb_pnp.h      |  5 +-
 include/hw/misc/imx25_ccm.h              |  6 +-
 include/hw/misc/imx31_ccm.h              |  6 +-
 include/hw/misc/imx6_ccm.h               |  6 +-
 include/hw/misc/imx6_src.h               |  6 +-
 include/hw/misc/imx6ul_ccm.h             |  6 +-
 include/hw/misc/imx7_ccm.h               | 11 ++--
 include/hw/misc/imx7_gpr.h               |  6 +-
 include/hw/misc/imx7_snvs.h              |  6 +-
 include/hw/misc/imx_ccm.h                | 11 ++--
 include/hw/misc/imx_rngc.h               |  6 +-
 include/hw/misc/iotkit-secctl.h          |  3 +-
 include/hw/misc/iotkit-sysctl.h          |  6 +-
 include/hw/misc/iotkit-sysinfo.h         |  6 +-
 include/hw/misc/mac_via.h                | 16 ++++--
 include/hw/misc/macio/cuda.h             | 11 ++--
 include/hw/misc/macio/gpio.h             |  6 +-
 include/hw/misc/macio/macio.h            | 26 +++++----
 include/hw/misc/macio/pmu.h              | 11 ++--
 include/hw/misc/max111x.h                |  6 +-
 include/hw/misc/mips_cmgcr.h             |  3 +-
 include/hw/misc/mips_cpc.h               |  6 +-
 include/hw/misc/mips_itu.h               |  6 +-
 include/hw/misc/mos6522.h                | 11 ++--
 include/hw/misc/mps2-fpgaio.h            |  6 +-
 include/hw/misc/mps2-scc.h               |  6 +-
 include/hw/misc/msf2-sysreg.h            |  6 +-
 include/hw/misc/nrf51_rng.h              |  6 +-
 include/hw/misc/pca9552.h                |  6 +-
 include/hw/misc/stm32f2xx_syscfg.h       |  6 +-
 include/hw/misc/stm32f4xx_exti.h         |  6 +-
 include/hw/misc/stm32f4xx_syscfg.h       |  6 +-
 include/hw/misc/tz-mpc.h                 |  3 +-
 include/hw/misc/tz-msc.h                 |  6 +-
 include/hw/misc/tz-ppc.h                 |  3 +-
 include/hw/misc/unimp.h                  |  6 +-
 include/hw/misc/vmcoreinfo.h             |  6 +-
 include/hw/misc/zynq-xadc.h              |  6 +-
 include/hw/net/allwinner-sun8i-emac.h    |  5 +-
 include/hw/net/allwinner_emac.h          |  6 +-
 include/hw/net/cadence_gem.h             |  6 +-
 include/hw/net/ftgmac100.h               | 11 ++--
 include/hw/net/imx_fec.h                 |  6 +-
 include/hw/net/lance.h                   |  6 +-
 include/hw/net/lasi_82596.h              |  6 +-
 include/hw/net/msf2-emac.h               |  6 +-
 include/hw/nmi.h                         |  5 +-
 include/hw/nubus/mac-nubus-bridge.h      |  6 +-
 include/hw/nubus/nubus.h                 | 11 ++--
 include/hw/nvram/fw_cfg.h                |  6 +-
 include/hw/nvram/nrf51_nvm.h             |  6 +-
 include/hw/pci-bridge/simba.h            |  6 +-
 include/hw/pci-host/designware.h         |  8 ++-
 include/hw/pci-host/gpex.h               | 11 ++--
 include/hw/pci-host/i440fx.h             |  6 +-
 include/hw/pci-host/pnv_phb3.h           | 11 ++--
 include/hw/pci-host/pnv_phb4.h           |  6 +-
 include/hw/pci-host/q35.h                | 11 ++--
 include/hw/pci-host/sabre.h              | 11 ++--
 include/hw/pci-host/spapr.h              |  3 +-
 include/hw/pci-host/uninorth.h           | 11 ++--
 include/hw/pci-host/xilinx-pcie.h        | 11 ++--
 include/hw/pci/pci.h                     |  6 +-
 include/hw/pci/pci_bridge.h              |  1 +
 include/hw/pci/pci_host.h                |  6 +-
 include/hw/pci/pcie_host.h               |  1 +
 include/hw/pci/pcie_port.h               |  6 +-
 include/hw/pcmcia.h                      | 11 ++--
 include/hw/platform-bus.h                |  1 +
 include/hw/ppc/mac_dbdma.h               |  6 +-
 include/hw/ppc/openpic.h                 |  6 +-
 include/hw/ppc/pnv.h                     | 33 ++++++-----
 include/hw/ppc/pnv_core.h                | 16 ++++--
 include/hw/ppc/pnv_homer.h               | 11 ++--
 include/hw/ppc/pnv_lpc.h                 | 11 ++--
 include/hw/ppc/pnv_occ.h                 | 11 ++--
 include/hw/ppc/pnv_pnor.h                |  6 +-
 include/hw/ppc/pnv_psi.h                 | 21 ++++---
 include/hw/ppc/pnv_xive.h                | 11 ++--
 include/hw/ppc/pnv_xscom.h               |  5 +-
 include/hw/ppc/spapr.h                   |  3 +-
 include/hw/ppc/spapr_cpu_core.h          | 11 ++--
 include/hw/ppc/spapr_drc.h               | 15 +++--
 include/hw/ppc/spapr_irq.h               |  6 +-
 include/hw/ppc/spapr_tpm_proxy.h         |  5 +-
 include/hw/ppc/spapr_vio.h               | 10 ++--
 include/hw/ppc/spapr_xive.h              | 11 ++--
 include/hw/ppc/xics.h                    |  6 +-
 include/hw/ppc/xics_spapr.h              |  1 +
 include/hw/qdev-core.h                   |  5 +-
 include/hw/register.h                    |  1 +
 include/hw/resettable.h                  |  5 +-
 include/hw/riscv/opentitan.h             |  6 +-
 include/hw/riscv/riscv_hart.h            |  6 +-
 include/hw/riscv/sifive_clint.h          |  6 +-
 include/hw/riscv/sifive_e.h              | 11 ++--
 include/hw/riscv/sifive_e_prci.h         |  6 +-
 include/hw/riscv/sifive_gpio.h           |  6 +-
 include/hw/riscv/sifive_plic.h           |  6 +-
 include/hw/riscv/sifive_test.h           |  6 +-
 include/hw/riscv/sifive_u.h              | 11 ++--
 include/hw/riscv/sifive_u_otp.h          |  6 +-
 include/hw/riscv/sifive_u_prci.h         |  6 +-
 include/hw/riscv/sifive_uart.h           |  6 +-
 include/hw/riscv/virt.h                  |  6 +-
 include/hw/rtc/allwinner-rtc.h           | 10 ++--
 include/hw/rtc/aspeed_rtc.h              |  6 +-
 include/hw/rtc/goldfish_rtc.h            |  6 +-
 include/hw/rtc/m48t59.h                  |  5 +-
 include/hw/rtc/mc146818rtc.h             |  6 +-
 include/hw/rtc/pl031.h                   |  6 +-
 include/hw/rtc/xlnx-zynqmp-rtc.h         |  6 +-
 include/hw/rx/rx62n.h                    |  6 +-
 include/hw/s390x/3270-ccw.h              | 11 ++--
 include/hw/s390x/ap-device.h             |  6 +-
 include/hw/s390x/css-bridge.h            | 10 ++--
 include/hw/s390x/event-facility.h        | 16 ++++--
 include/hw/s390x/s390-ccw.h              | 11 ++--
 include/hw/s390x/s390-virtio-ccw.h       | 11 ++--
 include/hw/s390x/s390_flic.h             | 16 ++++--
 include/hw/s390x/sclp.h                  | 11 ++--
 include/hw/s390x/storage-attributes.h    | 21 ++++---
 include/hw/s390x/storage-keys.h          | 16 ++++--
 include/hw/s390x/tod.h                   | 11 ++--
 include/hw/s390x/vfio-ccw.h              |  3 +-
 include/hw/scsi/esp.h                    |  6 +-
 include/hw/scsi/scsi.h                   |  6 +-
 include/hw/sd/allwinner-sdhost.h         | 10 ++--
 include/hw/sd/aspeed_sdhci.h             |  6 +-
 include/hw/sd/bcm2835_sdhost.h           |  6 +-
 include/hw/sd/sd.h                       | 11 ++--
 include/hw/sd/sdhci.h                    |  6 +-
 include/hw/southbridge/piix.h            |  6 +-
 include/hw/sparc/sparc32_dma.h           | 18 +++---
 include/hw/sparc/sun4m_iommu.h           |  6 +-
 include/hw/sparc/sun4u_iommu.h           |  6 +-
 include/hw/ssi/aspeed_smc.h              | 11 ++--
 include/hw/ssi/imx_spi.h                 |  6 +-
 include/hw/ssi/mss-spi.h                 |  6 +-
 include/hw/ssi/pl022.h                   |  6 +-
 include/hw/ssi/ssi.h                     |  1 +
 include/hw/ssi/stm32f2xx_spi.h           |  6 +-
 include/hw/ssi/xilinx_spips.h            | 16 ++++--
 include/hw/stream.h                      |  5 +-
 include/hw/sysbus.h                      |  6 +-
 include/hw/timer/a9gtimer.h              |  3 +-
 include/hw/timer/allwinner-a10-pit.h     |  3 +-
 include/hw/timer/arm_mptimer.h           |  6 +-
 include/hw/timer/armv7m_systick.h        |  6 +-
 include/hw/timer/aspeed_timer.h          | 13 +++--
 include/hw/timer/avr_timer16.h           |  6 +-
 include/hw/timer/bcm2835_systmr.h        |  6 +-
 include/hw/timer/cmsdk-apb-dualtimer.h   |  3 +-
 include/hw/timer/cmsdk-apb-timer.h       |  6 +-
 include/hw/timer/digic-timer.h           |  6 +-
 include/hw/timer/i8254.h                 |  1 +
 include/hw/timer/imx_epit.h              |  6 +-
 include/hw/timer/imx_gpt.h               |  6 +-
 include/hw/timer/mss-timer.h             |  6 +-
 include/hw/timer/nrf51_timer.h           |  6 +-
 include/hw/timer/renesas_cmt.h           |  6 +-
 include/hw/timer/renesas_tmr.h           |  6 +-
 include/hw/timer/stm32f2xx_timer.h       |  6 +-
 include/hw/usb.h                         |  6 +-
 include/hw/usb/chipidea.h                |  6 +-
 include/hw/usb/imx-usb-phy.h             |  6 +-
 include/hw/vfio/vfio-amd-xgbe.h          |  1 +
 include/hw/vfio/vfio-calxeda-xgmac.h     | 11 ++--
 include/hw/vfio/vfio-platform.h          | 11 ++--
 include/hw/virtio/vhost-scsi-common.h    |  6 +-
 include/hw/virtio/vhost-scsi.h           |  6 +-
 include/hw/virtio/vhost-user-blk.h       |  6 +-
 include/hw/virtio/vhost-user-fs.h        |  6 +-
 include/hw/virtio/vhost-user-scsi.h      |  6 +-
 include/hw/virtio/vhost-user-vsock.h     |  6 +-
 include/hw/virtio/vhost-vsock-common.h   |  6 +-
 include/hw/virtio/vhost-vsock.h          |  6 +-
 include/hw/virtio/virtio-balloon.h       |  6 +-
 include/hw/virtio/virtio-blk.h           |  6 +-
 include/hw/virtio/virtio-bus.h           |  8 ++-
 include/hw/virtio/virtio-crypto.h        |  6 +-
 include/hw/virtio/virtio-gpu-pci.h       |  1 +
 include/hw/virtio/virtio-gpu.h           | 21 ++++---
 include/hw/virtio/virtio-input.h         | 11 ++--
 include/hw/virtio/virtio-iommu.h         |  6 +-
 include/hw/virtio/virtio-mem.h           | 11 ++--
 include/hw/virtio/virtio-mmio.h          |  6 +-
 include/hw/virtio/virtio-net.h           |  3 +-
 include/hw/virtio/virtio-pmem.h          | 11 ++--
 include/hw/virtio/virtio-rng.h           |  6 +-
 include/hw/virtio/virtio-scsi.h          | 11 ++--
 include/hw/virtio/virtio-serial.h        |  8 ++-
 include/hw/virtio/virtio.h               |  6 +-
 include/hw/vmstate-if.h                  |  5 +-
 include/hw/watchdog/cmsdk-apb-watchdog.h |  6 +-
 include/hw/watchdog/wdt_aspeed.h         | 11 ++--
 include/hw/watchdog/wdt_diag288.h        | 11 ++--
 include/hw/watchdog/wdt_imx2.h           |  6 +-
 include/hw/xen/xen-block.h               | 21 ++++---
 include/hw/xen/xen-bus.h                 | 21 ++++---
 include/hw/xen/xen-legacy-backend.h      |  1 +
 include/io/channel-buffer.h              |  3 +-
 include/io/channel-command.h             |  3 +-
 include/io/channel-file.h                |  3 +-
 include/io/channel-socket.h              |  3 +-
 include/io/channel-tls.h                 |  3 +-
 include/io/channel-websock.h             |  3 +-
 include/io/channel.h                     |  4 +-
 include/io/dns-resolver.h                |  4 +-
 include/io/net-listener.h                |  5 +-
 include/net/can_host.h                   | 11 ++--
 include/net/filter.h                     |  5 +-
 include/qom/object.h                     |  1 +
 include/qom/object_interfaces.h          |  5 +-
 include/scsi/pr-manager.h                | 10 ++--
 include/sysemu/accel.h                   | 10 ++--
 include/sysemu/cryptodev.h               |  7 ++-
 include/sysemu/hostmem.h                 |  4 +-
 include/sysemu/hvf.h                     |  1 +
 include/sysemu/iothread.h                |  5 +-
 include/sysemu/kvm.h                     |  1 +
 include/sysemu/rng-random.h              |  2 +-
 include/sysemu/rng.h                     |  4 +-
 include/sysemu/tpm.h                     |  5 +-
 include/sysemu/tpm_backend.h             |  4 +-
 include/sysemu/vhost-user-backend.h      |  4 +-
 include/ui/console.h                     |  2 +-
 target/alpha/cpu-qom.h                   |  8 ++-
 target/arm/cpu-qom.h                     | 13 +++--
 target/arm/idau.h                        |  5 +-
 target/avr/cpu-qom.h                     |  8 ++-
 target/cris/cpu-qom.h                    |  8 ++-
 target/hppa/cpu-qom.h                    |  8 ++-
 target/i386/cpu-qom.h                    |  8 ++-
 target/lm32/cpu-qom.h                    |  8 ++-
 target/m68k/cpu-qom.h                    |  8 ++-
 target/microblaze/cpu-qom.h              |  8 ++-
 target/mips/cpu-qom.h                    |  8 ++-
 target/moxie/cpu.h                       | 11 ++--
 target/nios2/cpu.h                       | 11 ++--
 target/openrisc/cpu.h                    | 11 ++--
 target/ppc/cpu-qom.h                     |  8 ++-
 target/ppc/cpu.h                         |  1 +
 target/riscv/cpu.h                       | 11 ++--
 target/s390x/cpu-qom.h                   |  8 ++-
 target/sh4/cpu-qom.h                     |  8 ++-
 target/sparc/cpu-qom.h                   |  8 ++-
 target/tilegx/cpu.h                      | 11 ++--
 target/tricore/cpu-qom.h                 |  8 ++-
 target/unicore32/cpu-qom.h               |  8 ++-
 target/xtensa/cpu-qom.h                  |  8 ++-
 accel/tcg/tcg-all.c                      |  5 +-
 backends/cryptodev-builtin.c             |  5 +-
 backends/cryptodev-vhost-user.c          |  6 +-
 backends/dbus-vmstate.c                  |  1 +
 backends/hostmem-file.c                  |  3 +-
 backends/hostmem-memfd.c                 |  3 +-
 backends/rng-builtin.c                   |  6 +-
 backends/rng-egd.c                       |  7 ++-
 backends/tpm/tpm_emulator.c              |  6 +-
 backends/tpm/tpm_passthrough.c           |  3 +-
 chardev/baum.c                           |  6 +-
 chardev/char-parallel.c                  | 11 ++--
 chardev/char-pty.c                       |  6 +-
 chardev/char-ringbuf.c                   |  6 +-
 chardev/char-socket.c                    |  6 +-
 chardev/char-udp.c                       |  6 +-
 chardev/char-win-stdio.c                 |  6 +-
 chardev/msmouse.c                        |  6 +-
 chardev/testdev.c                        |  6 +-
 chardev/wctablet.c                       |  6 +-
 hw/acpi/piix4.c                          |  6 +-
 hw/alpha/typhoon.c                       |  6 +-
 hw/arm/collie.c                          |  6 +-
 hw/arm/highbank.c                        |  6 +-
 hw/arm/microbit.c                        |  6 +-
 hw/arm/mps2-tz.c                         | 11 ++--
 hw/arm/mps2.c                            | 11 ++--
 hw/arm/musca.c                           | 11 ++--
 hw/arm/musicpal.c                        | 41 +++++++------
 hw/arm/palm.c                            |  6 +-
 hw/arm/pxa2xx.c                          | 16 ++++--
 hw/arm/pxa2xx_gpio.c                     |  3 +-
 hw/arm/pxa2xx_pic.c                      |  6 +-
 hw/arm/raspi.c                           | 11 ++--
 hw/arm/sbsa-ref.c                        |  6 +-
 hw/arm/spitz.c                           | 36 +++++++-----
 hw/arm/stellaris.c                       | 16 ++++--
 hw/arm/strongarm.c                       | 25 ++++----
 hw/arm/tosa.c                            | 11 ++--
 hw/arm/xilinx_zynq.c                     |  6 +-
 hw/arm/xlnx-versal-virt.c                |  6 +-
 hw/arm/xlnx-zcu102.c                     |  6 +-
 hw/arm/z2.c                              | 11 ++--
 hw/audio/ac97.c                          |  6 +-
 hw/audio/adlib.c                         |  6 +-
 hw/audio/cs4231.c                        |  6 +-
 hw/audio/cs4231a.c                       |  6 +-
 hw/audio/es1370.c                        |  6 +-
 hw/audio/gus.c                           |  6 +-
 hw/audio/hda-codec.c                     |  1 +
 hw/audio/intel-hda.c                     |  1 +
 hw/audio/marvell_88w8618.c               |  6 +-
 hw/audio/milkymist-ac97.c                |  3 +-
 hw/audio/pcspk.c                         |  6 +-
 hw/audio/pl041.c                         |  6 +-
 hw/audio/sb16.c                          |  6 +-
 hw/audio/wm8750.c                        |  6 +-
 hw/avr/arduino.c                         | 11 ++--
 hw/avr/atmega.c                          |  6 +-
 hw/block/fdc.c                           | 21 ++++---
 hw/block/m25p80.c                        | 11 ++--
 hw/block/nand.c                          |  1 +
 hw/block/onenand.c                       |  6 +-
 hw/char/debugcon.c                       |  6 +-
 hw/char/etraxfs_ser.c                    |  6 +-
 hw/char/exynos4210_uart.c                |  6 +-
 hw/char/grlib_apbuart.c                  |  6 +-
 hw/char/ipoctal232.c                     |  1 +
 hw/char/lm32_juart.c                     |  3 +-
 hw/char/lm32_uart.c                      |  3 +-
 hw/char/mcf_uart.c                       |  6 +-
 hw/char/milkymist-uart.c                 |  3 +-
 hw/char/parallel.c                       |  6 +-
 hw/char/sclpconsole-lm.c                 |  6 +-
 hw/char/sclpconsole.c                    |  6 +-
 hw/char/serial-isa.c                     |  6 +-
 hw/char/serial-pci.c                     |  6 +-
 hw/char/spapr_vty.c                      |  6 +-
 hw/char/terminal3270.c                   |  6 +-
 hw/char/virtio-console.c                 |  6 +-
 hw/char/xilinx_uartlite.c                |  6 +-
 hw/cpu/realview_mpcore.c                 |  6 +-
 hw/display/ads7846.c                     |  6 +-
 hw/display/artist.c                      |  6 +-
 hw/display/bochs-display.c               |  6 +-
 hw/display/cg3.c                         |  6 +-
 hw/display/cirrus_vga.c                  |  6 +-
 hw/display/cirrus_vga_isa.c              |  6 +-
 hw/display/exynos4210_fimd.c             |  6 +-
 hw/display/g364fb.c                      |  6 +-
 hw/display/jazz_led.c                    |  6 +-
 hw/display/milkymist-tmu2.c              |  3 +-
 hw/display/milkymist-vgafb.c             |  3 +-
 hw/display/next-fb.c                     |  3 +-
 hw/display/pl110.c                       |  6 +-
 hw/display/ramfb-standalone.c            |  6 +-
 hw/display/sii9022.c                     |  6 +-
 hw/display/sm501.c                       | 11 ++--
 hw/display/ssd0303.c                     |  6 +-
 hw/display/ssd0323.c                     |  6 +-
 hw/display/tcx.c                         |  6 +-
 hw/display/vga-isa.c                     |  6 +-
 hw/display/vga-pci.c                     |  6 +-
 hw/display/vhost-user-gpu-pci.c          |  6 +-
 hw/display/vhost-user-vga.c              |  6 +-
 hw/display/virtio-gpu-pci.c              |  6 +-
 hw/display/virtio-vga.c                  |  6 +-
 hw/display/vmware_vga.c                  |  1 +
 hw/dma/i82374.c                          |  6 +-
 hw/dma/pl330.c                           |  1 +
 hw/dma/puv3_dma.c                        |  6 +-
 hw/dma/pxa2xx_dma.c                      |  6 +-
 hw/dma/rc4030.c                          |  6 +-
 hw/dma/xilinx_axidma.c                   |  5 +-
 hw/gpio/gpio_key.c                       |  6 +-
 hw/gpio/max7310.c                        |  6 +-
 hw/gpio/mpc8xxx.c                        |  6 +-
 hw/gpio/pl061.c                          |  6 +-
 hw/gpio/puv3_gpio.c                      |  6 +-
 hw/gpio/zaurus.c                         |  3 +-
 hw/hppa/dino.c                           |  6 +-
 hw/hppa/lasi.c                           |  6 +-
 hw/hyperv/hyperv.c                       |  6 +-
 hw/hyperv/hyperv_testdev.c               |  1 +
 hw/i2c/bitbang_i2c.c                     |  6 +-
 hw/i2c/exynos4210_i2c.c                  |  6 +-
 hw/i2c/mpc_i2c.c                         |  6 +-
 hw/i2c/smbus_eeprom.c                    |  6 +-
 hw/i2c/smbus_ich9.c                      |  6 +-
 hw/i2c/versatile_i2c.c                   |  3 +-
 hw/i386/kvm/clock.c                      |  6 +-
 hw/i386/kvm/i8254.c                      | 11 ++--
 hw/i386/kvm/i8259.c                      |  6 +-
 hw/i386/kvmvapic.c                       |  6 +-
 hw/i386/port92.c                         |  6 +-
 hw/i386/vmmouse.c                        |  7 ++-
 hw/i386/vmport.c                         |  6 +-
 hw/i386/xen/xen_platform.c               |  6 +-
 hw/i386/xen/xen_pvdevice.c               |  6 +-
 hw/ide/isa.c                             |  6 +-
 hw/ide/microdrive.c                      |  6 +-
 hw/ide/mmio.c                            |  6 +-
 hw/ide/sii3112.c                         |  6 +-
 hw/input/adb-kbd.c                       | 11 ++--
 hw/input/adb-mouse.c                     | 11 ++--
 hw/input/lm832x.c                        |  6 +-
 hw/input/milkymist-softusb.c             |  3 +-
 hw/input/pl050.c                         |  6 +-
 hw/intc/apic.c                           |  1 +
 hw/intc/arm_gic_kvm.c                    |  6 +-
 hw/intc/arm_gicv2m.c                     |  6 +-
 hw/intc/arm_gicv3_its_kvm.c              |  6 +-
 hw/intc/arm_gicv3_kvm.c                  |  6 +-
 hw/intc/etraxfs_pic.c                    |  1 +
 hw/intc/exynos4210_combiner.c            |  6 +-
 hw/intc/exynos4210_gic.c                 | 11 ++--
 hw/intc/grlib_irqmp.c                    |  6 +-
 hw/intc/i8259.c                          |  6 +-
 hw/intc/lm32_pic.c                       |  3 +-
 hw/intc/loongson_liointc.c               |  1 +
 hw/intc/nios2_iic.c                      |  6 +-
 hw/intc/ompic.c                          |  3 +-
 hw/intc/openpic_kvm.c                    |  6 +-
 hw/intc/pl190.c                          |  6 +-
 hw/intc/puv3_intc.c                      |  6 +-
 hw/intc/s390_flic_kvm.c                  |  6 +-
 hw/intc/slavio_intctl.c                  |  6 +-
 hw/intc/xilinx_intc.c                    |  1 +
 hw/ipack/tpci200.c                       |  6 +-
 hw/ipmi/ipmi_bmc_extern.c                |  6 +-
 hw/ipmi/isa_ipmi_bt.c                    |  6 +-
 hw/ipmi/isa_ipmi_kcs.c                   |  6 +-
 hw/ipmi/pci_ipmi_bt.c                    |  6 +-
 hw/ipmi/pci_ipmi_kcs.c                   |  6 +-
 hw/ipmi/smbus_ipmi.c                     |  6 +-
 hw/isa/i82378.c                          |  6 +-
 hw/isa/piix4.c                           |  6 +-
 hw/isa/vt82c686.c                        | 21 ++++---
 hw/m68k/mcf_intc.c                       |  6 +-
 hw/m68k/next-cube.c                      |  6 +-
 hw/m68k/next-kbd.c                       |  6 +-
 hw/microblaze/xlnx-zynqmp-pmu.c          |  6 +-
 hw/mips/boston.c                         |  6 +-
 hw/mips/gt64xxx_pci.c                    |  6 +-
 hw/mips/malta.c                          |  6 +-
 hw/misc/applesmc.c                       |  3 +-
 hw/misc/arm_integrator_debug.c           |  6 +-
 hw/misc/arm_l2x0.c                       |  6 +-
 hw/misc/arm_sysctl.c                     |  6 +-
 hw/misc/debugexit.c                      |  6 +-
 hw/misc/eccmemctl.c                      |  6 +-
 hw/misc/edu.c                            |  6 +-
 hw/misc/empty_slot.c                     |  6 +-
 hw/misc/exynos4210_clk.c                 |  6 +-
 hw/misc/exynos4210_pmu.c                 |  6 +-
 hw/misc/exynos4210_rng.c                 |  6 +-
 hw/misc/ivshmem.c                        |  6 +-
 hw/misc/milkymist-hpdmc.c                |  3 +-
 hw/misc/milkymist-pfpu.c                 |  3 +-
 hw/misc/mst_fpga.c                       |  6 +-
 hw/misc/pc-testdev.c                     |  6 +-
 hw/misc/pca9552.c                        |  6 +-
 hw/misc/pci-testdev.c                    |  6 +-
 hw/misc/puv3_pm.c                        |  6 +-
 hw/misc/pvpanic.c                        |  6 +-
 hw/misc/sga.c                            |  6 +-
 hw/misc/slavio_misc.c                    | 11 ++--
 hw/misc/tmp421.c                         | 11 ++--
 hw/misc/zynq_slcr.c                      |  6 +-
 hw/net/can/can_kvaser_pci.c              |  6 +-
 hw/net/can/can_mioe3680_pci.c            |  6 +-
 hw/net/can/can_pcm3680_pci.c             |  6 +-
 hw/net/dp8393x.c                         |  6 +-
 hw/net/e1000.c                           | 11 ++--
 hw/net/e1000e.c                          |  6 +-
 hw/net/etraxfs_eth.c                     |  7 ++-
 hw/net/lan9118.c                         |  6 +-
 hw/net/milkymist-minimac2.c              |  3 +-
 hw/net/mipsnet.c                         |  6 +-
 hw/net/ne2000-isa.c                      |  6 +-
 hw/net/opencores_eth.c                   |  6 +-
 hw/net/pcnet-pci.c                       |  6 +-
 hw/net/rtl8139.c                         |  6 +-
 hw/net/smc91c111.c                       |  6 +-
 hw/net/spapr_llan.c                      |  6 +-
 hw/net/stellaris_enet.c                  |  6 +-
 hw/net/sungem.c                          |  6 +-
 hw/net/sunhme.c                          |  6 +-
 hw/net/vmxnet3.c                         |  6 +-
 hw/net/xgmac.c                           |  6 +-
 hw/net/xilinx_axienet.c                  |  5 +-
 hw/net/xilinx_ethlite.c                  |  1 +
 hw/nvram/ds1225y.c                       |  6 +-
 hw/nvram/eeprom_at24c.c                  |  6 +-
 hw/nvram/spapr_nvram.c                   |  6 +-
 hw/pci-bridge/dec.c                      |  6 +-
 hw/pci-bridge/gen_pcie_root_port.c       |  6 +-
 hw/pci-bridge/pci_bridge_dev.c           |  3 +-
 hw/pci-bridge/pci_expander_bridge.c      | 11 ++--
 hw/pci-bridge/pcie_pci_bridge.c          |  6 +-
 hw/pci-host/bonito.c                     |  6 +-
 hw/pci-host/grackle.c                    |  6 +-
 hw/pci-host/i440fx.c                     |  6 +-
 hw/pci-host/pnv_phb3.c                   |  1 +
 hw/pci-host/pnv_phb4.c                   |  1 +
 hw/pci-host/ppce500.c                    |  5 +-
 hw/pci-host/prep.c                       | 11 ++--
 hw/pci-host/versatile.c                  |  6 +-
 hw/ppc/mpc8544_guts.c                    |  3 +-
 hw/ppc/ppc440_pcix.c                     |  6 +-
 hw/ppc/ppc440_uc.c                       |  6 +-
 hw/ppc/ppc4xx_pci.c                      |  3 +-
 hw/ppc/ppce500_spin.c                    |  6 +-
 hw/ppc/prep_systemio.c                   |  6 +-
 hw/ppc/rs6000_mc.c                       |  6 +-
 hw/ppc/spapr_rng.c                       |  3 +-
 hw/rtc/ds1338.c                          |  6 +-
 hw/rtc/exynos4210_rtc.c                  |  6 +-
 hw/rtc/m41t80.c                          |  6 +-
 hw/rtc/m48t59-isa.c                      | 11 ++--
 hw/rtc/m48t59.c                          | 11 ++--
 hw/rtc/sun4v-rtc.c                       |  6 +-
 hw/rtc/twl92230.c                        |  6 +-
 hw/rx/rx-gdbsim.c                        | 11 ++--
 hw/rx/rx62n.c                            |  6 +-
 hw/scsi/esp-pci.c                        | 11 ++--
 hw/scsi/lsi53c895a.c                     |  6 +-
 hw/scsi/megasas.c                        | 11 ++--
 hw/scsi/scsi-disk.c                      | 12 ++--
 hw/scsi/spapr_vscsi.c                    |  6 +-
 hw/scsi/vmw_pvscsi.c                     | 11 ++--
 hw/sd/allwinner-sdhost.c                 |  1 +
 hw/sd/bcm2835_sdhost.c                   |  1 +
 hw/sd/milkymist-memcard.c                |  3 +-
 hw/sd/pxa2xx_mmci.c                      |  1 +
 hw/sd/sdhci.c                            |  1 +
 hw/sd/ssi-sd.c                           |  6 +-
 hw/sh4/sh_pci.c                          |  6 +-
 hw/sparc/sun4m.c                         | 21 ++++---
 hw/sparc64/sun4u.c                       | 21 ++++---
 hw/ssi/ssi.c                             |  1 +
 hw/ssi/xilinx_spi.c                      |  6 +-
 hw/timer/altera_timer.c                  |  6 +-
 hw/timer/arm_timer.c                     | 11 ++--
 hw/timer/cadence_ttc.c                   |  6 +-
 hw/timer/etraxfs_timer.c                 |  6 +-
 hw/timer/exynos4210_mct.c                |  6 +-
 hw/timer/exynos4210_pwm.c                |  6 +-
 hw/timer/grlib_gptimer.c                 |  3 +-
 hw/timer/hpet.c                          |  6 +-
 hw/timer/i8254.c                         |  6 +-
 hw/timer/lm32_timer.c                    |  3 +-
 hw/timer/milkymist-sysctl.c              |  3 +-
 hw/timer/puv3_ost.c                      |  6 +-
 hw/timer/pxa2xx_timer.c                  |  3 +-
 hw/timer/slavio_timer.c                  |  6 +-
 hw/timer/xilinx_timer.c                  |  1 +
 hw/tpm/tpm_crb.c                         |  6 +-
 hw/tpm/tpm_spapr.c                       |  6 +-
 hw/tpm/tpm_tis_isa.c                     |  6 +-
 hw/tpm/tpm_tis_sysbus.c                  |  6 +-
 hw/usb/ccid-card-emulated.c              |  3 +-
 hw/usb/ccid-card-passthru.c              |  1 +
 hw/usb/dev-audio.c                       |  6 +-
 hw/usb/dev-hid.c                         |  6 +-
 hw/usb/dev-hub.c                         |  6 +-
 hw/usb/dev-mtp.c                         |  1 +
 hw/usb/dev-network.c                     |  6 +-
 hw/usb/dev-serial.c                      |  6 +-
 hw/usb/dev-smartcard-reader.c            | 11 ++--
 hw/usb/dev-storage.c                     |  6 +-
 hw/usb/dev-uas.c                         |  1 +
 hw/usb/dev-wacom.c                       |  6 +-
 hw/usb/hcd-ohci-pci.c                    |  6 +-
 hw/usb/hcd-uhci.c                        |  1 +
 hw/usb/host-libusb.c                     |  3 +-
 hw/usb/redirect.c                        |  1 +
 hw/usb/tusb6010.c                        |  6 +-
 hw/vfio/ap.c                             |  6 +-
 hw/virtio/vhost-scsi-pci.c               |  1 +
 hw/virtio/vhost-user-blk-pci.c           |  1 +
 hw/virtio/vhost-user-fs-pci.c            |  1 +
 hw/virtio/vhost-user-input-pci.c         |  1 +
 hw/virtio/vhost-user-scsi-pci.c          |  1 +
 hw/virtio/vhost-user-vsock-pci.c         |  1 +
 hw/virtio/vhost-vsock-pci.c              |  1 +
 hw/virtio/virtio-9p-pci.c                |  6 +-
 hw/virtio/virtio-balloon-pci.c           |  1 +
 hw/virtio/virtio-blk-pci.c               |  1 +
 hw/virtio/virtio-crypto-pci.c            |  1 +
 hw/virtio/virtio-input-host-pci.c        |  1 +
 hw/virtio/virtio-input-pci.c             |  1 +
 hw/virtio/virtio-iommu-pci.c             |  1 +
 hw/virtio/virtio-net-pci.c               |  1 +
 hw/virtio/virtio-rng-pci.c               |  1 +
 hw/virtio/virtio-scsi-pci.c              |  1 +
 hw/virtio/virtio-serial-pci.c            |  1 +
 hw/watchdog/wdt_i6300esb.c               |  1 +
 hw/watchdog/wdt_ib700.c                  |  6 +-
 migration/rdma.c                         |  3 +-
 net/can/can_socketcan.c                  |  6 +-
 net/colo-compare.c                       |  5 +-
 net/dump.c                               |  3 +-
 net/filter-buffer.c                      |  5 +-
 net/filter-mirror.c                      |  9 +--
 net/filter-replay.c                      |  3 +-
 net/filter-rewriter.c                    |  7 ++-
 scsi/pr-manager-helper.c                 |  6 +-
 target/i386/sev.c                        |  3 +-
 tests/check-qom-interface.c              |  5 +-
 tests/test-qdev-global-props.c           |  5 +-
 ui/console.c                             |  6 +-
 ui/gtk.c                                 |  5 +-
 ui/input-barrier.c                       |  5 +-
 ui/input-linux.c                         |  5 +-
 ui/spice-app.c                           |  6 +-
 800 files changed, 3377 insertions(+), 1820 deletions(-)

diff --git a/chardev/chardev-internal.h b/chardev/chardev-internal.h
index f4d0429763..2926a326e0 100644
--- a/chardev/chardev-internal.h
+++ b/chardev/chardev-internal.h
@@ -32,7 +32,7 @@
 #define MUX_BUFFER_SIZE 32 /* Must be a power of 2.  */
 #define MUX_BUFFER_MASK (MUX_BUFFER_SIZE - 1)
 
-typedef struct MuxChardev {
+struct MuxChardev {
     Chardev parent;
     CharBackend *backends[MAX_MUX];
     CharBackend chr;
@@ -51,7 +51,8 @@ typedef struct MuxChardev {
     /* Protected by the Chardev chr_write_lock.  */
     int linestart;
     int64_t timestamps_start;
-} MuxChardev;
+};
+typedef struct MuxChardev MuxChardev;
 
 #define MUX_CHARDEV(obj) OBJECT_CHECK(MuxChardev, (obj), TYPE_CHARDEV_MUX)
 #define CHARDEV_IS_MUX(chr)                             \
diff --git a/hw/9pfs/virtio-9p.h b/hw/9pfs/virtio-9p.h
index e763da2c02..6dd945ecda 100644
--- a/hw/9pfs/virtio-9p.h
+++ b/hw/9pfs/virtio-9p.h
@@ -4,15 +4,16 @@
 #include "standard-headers/linux/virtio_9p.h"
 #include "hw/virtio/virtio.h"
 #include "9p.h"
+#include "qom/object.h"
 
-typedef struct V9fsVirtioState
-{
+struct V9fsVirtioState {
     VirtIODevice parent_obj;
     VirtQueue *vq;
     size_t config_size;
     VirtQueueElement *elems[MAX_REQ];
     V9fsState state;
-} V9fsVirtioState;
+};
+typedef struct V9fsVirtioState V9fsVirtioState;
 
 #define TYPE_VIRTIO_9P "virtio-9p-device"
 #define VIRTIO_9P(obj) \
diff --git a/hw/audio/intel-hda.h b/hw/audio/intel-hda.h
index eee6fee5af..44a2897fff 100644
--- a/hw/audio/intel-hda.h
+++ b/hw/audio/intel-hda.h
@@ -2,11 +2,14 @@
 #define HW_INTEL_HDA_H
 
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 /* --------------------------------------------------------------------- */
 /* hda bus                                                               */
 
 #define TYPE_HDA_CODEC_DEVICE "hda-codec"
+typedef struct HDACodecDevice HDACodecDevice;
+typedef struct HDACodecDeviceClass HDACodecDeviceClass;
 #define HDA_CODEC_DEVICE(obj) \
      OBJECT_CHECK(HDACodecDevice, (obj), TYPE_HDA_CODEC_DEVICE)
 #define HDA_CODEC_DEVICE_CLASS(klass) \
@@ -15,10 +18,9 @@
      OBJECT_GET_CLASS(HDACodecDeviceClass, (obj), TYPE_HDA_CODEC_DEVICE)
 
 #define TYPE_HDA_BUS "HDA"
+typedef struct HDACodecBus HDACodecBus;
 #define HDA_BUS(obj) OBJECT_CHECK(HDACodecBus, (obj), TYPE_HDA_BUS)
 
-typedef struct HDACodecBus HDACodecBus;
-typedef struct HDACodecDevice HDACodecDevice;
 
 typedef void (*hda_codec_response_func)(HDACodecDevice *dev,
                                         bool solicited, uint32_t response);
@@ -33,15 +35,14 @@ struct HDACodecBus {
     hda_codec_xfer_func xfer;
 };
 
-typedef struct HDACodecDeviceClass
-{
+struct HDACodecDeviceClass {
     DeviceClass parent_class;
 
     int (*init)(HDACodecDevice *dev);
     void (*exit)(HDACodecDevice *dev);
     void (*command)(HDACodecDevice *dev, uint32_t nid, uint32_t data);
     void (*stream)(HDACodecDevice *dev, uint32_t stnr, bool running, bool output);
-} HDACodecDeviceClass;
+};
 
 struct HDACodecDevice {
     DeviceState         qdev;
diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
index 0928cb0ce6..2c46ecb904 100644
--- a/hw/avr/atmega.h
+++ b/hw/avr/atmega.h
@@ -15,6 +15,7 @@
 #include "hw/timer/avr_timer16.h"
 #include "hw/misc/avr_power.h"
 #include "target/avr/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_ATMEGA_MCU     "ATmega"
 #define TYPE_ATMEGA168_MCU  "ATmega168"
@@ -22,6 +23,7 @@
 #define TYPE_ATMEGA1280_MCU "ATmega1280"
 #define TYPE_ATMEGA2560_MCU "ATmega2560"
 
+typedef struct AtmegaMcuState AtmegaMcuState;
 #define ATMEGA_MCU(obj) OBJECT_CHECK(AtmegaMcuState, (obj), TYPE_ATMEGA_MCU)
 
 #define POWER_MAX 2
@@ -29,7 +31,7 @@
 #define TIMER_MAX 6
 #define GPIO_MAX 12
 
-typedef struct AtmegaMcuState {
+struct AtmegaMcuState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -43,6 +45,6 @@ typedef struct AtmegaMcuState {
     AVRUsartState usart[USART_MAX];
     AVRTimer16State timer[TIMER_MAX];
     uint64_t xtal_freq_hz;
-} AtmegaMcuState;
+};
 
 #endif /* HW_AVR_ATMEGA_H */
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 1d30c0bca2..02d576d7b2 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -2,6 +2,7 @@
 #define HW_NVME_H
 
 #include "block/nvme.h"
+#include "qom/object.h"
 
 typedef struct NvmeParams {
     char     *serial;
@@ -74,10 +75,11 @@ static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
 }
 
 #define TYPE_NVME "nvme"
+typedef struct NvmeCtrl NvmeCtrl;
 #define NVME(obj) \
         OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
 
-typedef struct NvmeCtrl {
+struct NvmeCtrl {
     PCIDevice    parent_obj;
     MemoryRegion iomem;
     MemoryRegion ctrl_mem;
@@ -107,7 +109,7 @@ typedef struct NvmeCtrl {
     NvmeSQueue      admin_sq;
     NvmeCQueue      admin_cq;
     NvmeIdCtrl      id_ctrl;
-} NvmeCtrl;
+};
 
 /* calculate the number of LBAs that the namespace can accomodate */
 static inline uint64_t nvme_ns_nlbas(NvmeCtrl *n, NvmeNamespace *ns)
diff --git a/hw/display/ati_int.h b/hw/display/ati_int.h
index 2a16708e4f..2a8a3306da 100644
--- a/hw/display/ati_int.h
+++ b/hw/display/ati_int.h
@@ -13,6 +13,7 @@
 #include "hw/pci/pci.h"
 #include "hw/i2c/bitbang_i2c.h"
 #include "vga_int.h"
+#include "qom/object.h"
 
 /*#define DEBUG_ATI*/
 
@@ -29,6 +30,7 @@
 #define PCI_DEVICE_ID_ATI_RADEON_QY 0x5159
 
 #define TYPE_ATI_VGA "ati-vga"
+typedef struct ATIVGAState ATIVGAState;
 #define ATI_VGA(obj) OBJECT_CHECK(ATIVGAState, (obj), TYPE_ATI_VGA)
 
 typedef struct ATIVGARegs {
@@ -82,7 +84,7 @@ typedef struct ATIVGARegs {
     uint32_t default_sc_bottom_right;
 } ATIVGARegs;
 
-typedef struct ATIVGAState {
+struct ATIVGAState {
     PCIDevice dev;
     VGACommonState vga;
     char *model;
@@ -97,7 +99,7 @@ typedef struct ATIVGAState {
     MemoryRegion io;
     MemoryRegion mm;
     ATIVGARegs regs;
-} ATIVGAState;
+};
 
 const char *ati_reg_name(int num);
 
diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index 707631a1f5..4ecb6b2934 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -8,6 +8,7 @@
 
 #include "ui/qemu-spice.h"
 #include "ui/spice-display.h"
+#include "qom/object.h"
 
 enum qxl_mode {
     QXL_MODE_UNDEFINED,
@@ -27,7 +28,7 @@ enum qxl_mode {
 #define QXL_PAGE_BITS 12
 #define QXL_PAGE_SIZE (1 << QXL_PAGE_BITS);
 
-typedef struct PCIQXLDevice {
+struct PCIQXLDevice {
     PCIDevice          pci;
     PortioList         vga_port_list;
     SimpleSpiceDisplay ssd;
@@ -126,7 +127,8 @@ typedef struct PCIQXLDevice {
     int                num_dirty_rects;
     QXLRect            dirty[QXL_NUM_DIRTY_RECTS];
     QEMUBH            *update_area_bh;
-} PCIQXLDevice;
+};
+typedef struct PCIQXLDevice PCIQXLDevice;
 
 #define TYPE_PCI_QXL "pci-qxl"
 #define PCI_QXL(obj) OBJECT_CHECK(PCIQXLDevice, (obj), TYPE_PCI_QXL)
diff --git a/hw/display/virtio-vga.h b/hw/display/virtio-vga.h
index c41281a010..2d3b765bf9 100644
--- a/hw/display/virtio-vga.h
+++ b/hw/display/virtio-vga.h
@@ -3,11 +3,14 @@
 
 #include "hw/virtio/virtio-gpu-pci.h"
 #include "vga_int.h"
+#include "qom/object.h"
 
 /*
  * virtio-vga-base: This extends VirtioPCIProxy.
  */
 #define TYPE_VIRTIO_VGA_BASE "virtio-vga-base"
+typedef struct VirtIOVGABase VirtIOVGABase;
+typedef struct VirtIOVGABaseClass VirtIOVGABaseClass;
 #define VIRTIO_VGA_BASE(obj)                                \
     OBJECT_CHECK(VirtIOVGABase, (obj), TYPE_VIRTIO_VGA_BASE)
 #define VIRTIO_VGA_BASE_GET_CLASS(obj)                      \
@@ -15,18 +18,18 @@
 #define VIRTIO_VGA_BASE_CLASS(klass)                        \
     OBJECT_CLASS_CHECK(VirtIOVGABaseClass, klass, TYPE_VIRTIO_VGA_BASE)
 
-typedef struct VirtIOVGABase {
+struct VirtIOVGABase {
     VirtIOPCIProxy parent_obj;
 
     VirtIOGPUBase *vgpu;
     VGACommonState vga;
     MemoryRegion vga_mrs[3];
-} VirtIOVGABase;
+};
 
-typedef struct VirtIOVGABaseClass {
+struct VirtIOVGABaseClass {
     VirtioPCIClass parent_class;
 
     DeviceReset parent_reset;
-} VirtIOVGABaseClass;
+};
 
 #endif /* VIRTIO_VGA_H */
diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
index e05a4eff5d..85860c36dd 100644
--- a/hw/i386/amd_iommu.h
+++ b/hw/i386/amd_iommu.h
@@ -23,6 +23,7 @@
 
 #include "hw/pci/pci.h"
 #include "hw/i386/x86-iommu.h"
+#include "qom/object.h"
 
 /* Capability registers */
 #define AMDVI_CAPAB_BAR_LOW           0x04
@@ -296,6 +297,7 @@ struct irte_ga {
 };
 
 #define TYPE_AMD_IOMMU_DEVICE "amd-iommu"
+typedef struct AMDVIState AMDVIState;
 #define AMD_IOMMU_DEVICE(obj)\
     OBJECT_CHECK(AMDVIState, (obj), TYPE_AMD_IOMMU_DEVICE)
 
@@ -310,7 +312,7 @@ typedef struct AMDVIPCIState {
     PCIDevice dev;               /* The PCI device itself        */
 } AMDVIPCIState;
 
-typedef struct AMDVIState {
+struct AMDVIState {
     X86IOMMUState iommu;        /* IOMMU bus device             */
     AMDVIPCIState pci;          /* IOMMU PCI device             */
 
@@ -367,6 +369,6 @@ typedef struct AMDVIState {
 
     /* Interrupt remapping */
     bool ga_enabled;
-} AMDVIState;
+};
 
 #endif
diff --git a/hw/misc/tmp105.h b/hw/misc/tmp105.h
index 9ba05ecc9c..634bb4a0d6 100644
--- a/hw/misc/tmp105.h
+++ b/hw/misc/tmp105.h
@@ -16,8 +16,10 @@
 
 #include "hw/i2c/i2c.h"
 #include "hw/misc/tmp105_regs.h"
+#include "qom/object.h"
 
 #define TYPE_TMP105 "tmp105"
+typedef struct TMP105State TMP105State;
 #define TMP105(obj) OBJECT_CHECK(TMP105State, (obj), TYPE_TMP105)
 
 /**
@@ -27,7 +29,7 @@
  *
  * @see_also: http://www.ti.com/lit/gpn/tmp105
  */
-typedef struct TMP105State {
+struct TMP105State {
     /*< private >*/
     I2CSlave i2c;
     /*< public >*/
@@ -42,6 +44,6 @@ typedef struct TMP105State {
     int16_t limit[2];
     int faults;
     uint8_t alarm;
-} TMP105State;
+};
 
 #endif
diff --git a/hw/net/fsl_etsec/etsec.h b/hw/net/fsl_etsec/etsec.h
index 7951c3ad65..132a87b1ba 100644
--- a/hw/net/fsl_etsec/etsec.h
+++ b/hw/net/fsl_etsec/etsec.h
@@ -28,6 +28,7 @@
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "hw/ptimer.h"
+#include "qom/object.h"
 
 /* Buffer Descriptors */
 
@@ -104,7 +105,7 @@ typedef struct eTSEC_Register {
     uint32_t    value;
 } eTSEC_Register;
 
-typedef struct eTSEC {
+struct eTSEC {
     SysBusDevice  busdev;
 
     MemoryRegion  io_area;
@@ -145,7 +146,8 @@ typedef struct eTSEC {
 
     /* Whether we should flush the rx queue when buffer becomes available. */
     bool need_flush;
-} eTSEC;
+};
+typedef struct eTSEC eTSEC;
 
 #define TYPE_ETSEC_COMMON "eTSEC"
 #define ETSEC_COMMON(obj) \
diff --git a/hw/net/rocker/rocker.h b/hw/net/rocker/rocker.h
index e4c22db4ff..0dd49d5f41 100644
--- a/hw/net/rocker/rocker.h
+++ b/hw/net/rocker/rocker.h
@@ -20,6 +20,7 @@
 #define ROCKER_H
 
 #include "qemu/sockets.h"
+#include "qom/object.h"
 
 #if defined(DEBUG_ROCKER)
 #  define DPRINTF(fmt, ...) \
diff --git a/hw/net/tulip.h b/hw/net/tulip.h
index c3fcd4d4e1..5fe4aee87d 100644
--- a/hw/net/tulip.h
+++ b/hw/net/tulip.h
@@ -3,6 +3,7 @@
 
 #include "qemu/units.h"
 #include "net/net.h"
+#include "qom/object.h"
 
 #define TYPE_TULIP "tulip"
 typedef struct TULIPState TULIPState;
diff --git a/hw/net/vmxnet3_defs.h b/hw/net/vmxnet3_defs.h
index 65780c576d..1df1e4c3a6 100644
--- a/hw/net/vmxnet3_defs.h
+++ b/hw/net/vmxnet3_defs.h
@@ -19,8 +19,10 @@
 
 #include "net/net.h"
 #include "hw/net/vmxnet3.h"
+#include "qom/object.h"
 
 #define TYPE_VMXNET3 "vmxnet3"
+typedef struct VMXNET3State VMXNET3State;
 #define VMXNET3(obj) OBJECT_CHECK(VMXNET3State, (obj), TYPE_VMXNET3)
 
 /* Device state and helper functions */
@@ -58,7 +60,7 @@ typedef struct {
     bool is_asserted;
 } Vmxnet3IntState;
 
-typedef struct {
+struct VMXNET3State {
         PCIDevice parent_obj;
         NICState *nic;
         NICConf conf;
@@ -132,6 +134,6 @@ typedef struct {
 
         /* Compatibility flags for migration */
         uint32_t compat_flags;
-} VMXNET3State;
+};
 
 #endif
diff --git a/hw/ppc/e500-ccsr.h b/hw/ppc/e500-ccsr.h
index 12a2ba4b97..f7fd73fc0d 100644
--- a/hw/ppc/e500-ccsr.h
+++ b/hw/ppc/e500-ccsr.h
@@ -2,14 +2,16 @@
 #define E500_CCSR_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
-typedef struct PPCE500CCSRState {
+struct PPCE500CCSRState {
     /*< private >*/
     SysBusDevice parent;
     /*< public >*/
 
     MemoryRegion ccsr_space;
-} PPCE500CCSRState;
+};
+typedef struct PPCE500CCSRState PPCE500CCSRState;
 
 #define TYPE_CCSR "e500-ccsr"
 #define CCSR(obj) OBJECT_CHECK(PPCE500CCSRState, (obj), TYPE_CCSR)
diff --git a/hw/ppc/e500.h b/hw/ppc/e500.h
index 3fd9f825ca..5773460d5e 100644
--- a/hw/ppc/e500.h
+++ b/hw/ppc/e500.h
@@ -3,8 +3,9 @@
 
 #include "hw/boards.h"
 #include "hw/platform-bus.h"
+#include "qom/object.h"
 
-typedef struct PPCE500MachineState {
+struct PPCE500MachineState {
     /*< private >*/
     MachineState parent_obj;
 
@@ -12,9 +13,10 @@ typedef struct PPCE500MachineState {
      * board supports dynamic sysbus devices
      */
     PlatformBusDevice *pbus_dev;
-} PPCE500MachineState;
+};
+typedef struct PPCE500MachineState PPCE500MachineState;
 
-typedef struct PPCE500MachineClass {
+struct PPCE500MachineClass {
     /*< private >*/
     MachineClass parent_class;
 
@@ -36,7 +38,8 @@ typedef struct PPCE500MachineClass {
     hwaddr pci_mmio_base;
     hwaddr pci_mmio_bus_base;
     hwaddr spin_base;
-} PPCE500MachineClass;
+};
+typedef struct PPCE500MachineClass PPCE500MachineClass;
 
 void ppce500_init(MachineState *machine);
 
diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index 6af87d1fa0..f4ef3f32b0 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -34,6 +34,7 @@
 #include "hw/misc/mos6522.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci-host/uninorth.h"
+#include "qom/object.h"
 
 /* SMP is not enabled, for now */
 #define MAX_CPUS 1
@@ -71,6 +72,7 @@
 
 /* Core99 machine */
 #define TYPE_CORE99_MACHINE MACHINE_TYPE_NAME("mac99")
+typedef struct Core99MachineState Core99MachineState;
 #define CORE99_MACHINE(obj) OBJECT_CHECK(Core99MachineState, (obj), \
                                          TYPE_CORE99_MACHINE)
 
@@ -78,22 +80,23 @@
 #define CORE99_VIA_CONFIG_PMU      0x1
 #define CORE99_VIA_CONFIG_PMU_ADB  0x2
 
-typedef struct Core99MachineState {
+struct Core99MachineState {
     /*< private >*/
     MachineState parent;
 
     uint8_t via_config;
-} Core99MachineState;
+};
 
 /* Grackle PCI */
 #define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
 
 /* Mac NVRAM */
 #define TYPE_MACIO_NVRAM "macio-nvram"
+typedef struct MacIONVRAMState MacIONVRAMState;
 #define MACIO_NVRAM(obj) \
     OBJECT_CHECK(MacIONVRAMState, (obj), TYPE_MACIO_NVRAM)
 
-typedef struct MacIONVRAMState {
+struct MacIONVRAMState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -103,7 +106,7 @@ typedef struct MacIONVRAMState {
 
     MemoryRegion mem;
     uint8_t *data;
-} MacIONVRAMState;
+};
 
 void pmac_format_nvram_partition (MacIONVRAMState *nvr, int len);
 #endif /* PPC_MAC_H */
diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h
index a8a04a253c..db9d9e2c73 100644
--- a/hw/rdma/vmw/pvrdma.h
+++ b/hw/rdma/vmw/pvrdma.h
@@ -29,6 +29,7 @@
 #include "standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h"
 #include "standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h"
 #include "pvrdma_dev_ring.h"
+#include "qom/object.h"
 
 /* BARs */
 #define RDMA_MSIX_BAR_IDX    0
@@ -78,7 +79,7 @@ typedef struct PVRDMADevStats {
     uint64_t interrupts;
 } PVRDMADevStats;
 
-typedef struct PVRDMADev {
+struct PVRDMADev {
     PCIDevice parent_obj;
     MemoryRegion msix;
     MemoryRegion regs;
@@ -98,7 +99,8 @@ typedef struct PVRDMADev {
     VMXNET3State *func0;
     Notifier shutdown_notifier;
     PVRDMADevStats stats;
-} PVRDMADev;
+};
+typedef struct PVRDMADev PVRDMADev;
 #define PVRDMA_DEV(dev) OBJECT_CHECK(PVRDMADev, (dev), PVRDMA_HW_NAME)
 
 static inline int get_reg_val(PVRDMADev *dev, hwaddr addr, uint32_t *val)
diff --git a/hw/s390x/ccw-device.h b/hw/s390x/ccw-device.h
index 4e6af287e7..867547b4eb 100644
--- a/hw/s390x/ccw-device.h
+++ b/hw/s390x/ccw-device.h
@@ -15,7 +15,7 @@
 #include "hw/qdev-core.h"
 #include "hw/s390x/css.h"
 
-typedef struct CcwDevice {
+struct CcwDevice {
     DeviceState parent_obj;
     SubchDev *sch;
     /* <cssid>.<ssid>.<device number> */
@@ -25,18 +25,20 @@ typedef struct CcwDevice {
     CssDevId dev_id;
     /* The actual busid of the virtual subchannel. */
     CssDevId subch_id;
-} CcwDevice;
+};
+typedef struct CcwDevice CcwDevice;
 
 extern const VMStateDescription vmstate_ccw_dev;
 #define VMSTATE_CCW_DEVICE(_field, _state)                     \
     VMSTATE_STRUCT(_field, _state, 1, vmstate_ccw_dev, CcwDevice)
 
-typedef struct CCWDeviceClass {
+struct CCWDeviceClass {
     DeviceClass parent_class;
     void (*unplug)(HotplugHandler *, DeviceState *, Error **);
     void (*realize)(CcwDevice *, Error **);
     void (*refill_ids)(CcwDevice *);
-} CCWDeviceClass;
+};
+typedef struct CCWDeviceClass CCWDeviceClass;
 
 static inline CcwDevice *to_ccw_dev_fast(DeviceState *d)
 {
diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
index 53cc9eb5ac..282b22cc4f 100644
--- a/hw/s390x/ipl.h
+++ b/hw/s390x/ipl.h
@@ -16,6 +16,7 @@
 #include "cpu.h"
 #include "exec/address-spaces.h"
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 struct IPLBlockPVComp {
     uint64_t tweak_pref;
@@ -152,6 +153,7 @@ struct QemuIplParameters {
 typedef struct QemuIplParameters QemuIplParameters;
 
 #define TYPE_S390_IPL "s390-ipl"
+typedef struct S390IPLState S390IPLState;
 #define S390_IPL(obj) OBJECT_CHECK(S390IPLState, (obj), TYPE_S390_IPL)
 
 struct S390IPLState {
@@ -183,7 +185,6 @@ struct S390IPLState {
     uint16_t devno;
     bool iplbext_migration;
 };
-typedef struct S390IPLState S390IPLState;
 QEMU_BUILD_BUG_MSG(offsetof(S390IPLState, iplb) & 3, "alignment of iplb wrong");
 
 #define DIAG_308_RC_OK              0x0001
diff --git a/hw/s390x/s390-pci-bus.h b/hw/s390x/s390-pci-bus.h
index 550f3cc5e9..06f046e73a 100644
--- a/hw/s390x/s390-pci-bus.h
+++ b/hw/s390x/s390-pci-bus.h
@@ -19,6 +19,7 @@
 #include "hw/s390x/sclp.h"
 #include "hw/s390x/s390_flic.h"
 #include "hw/s390x/css.h"
+#include "qom/object.h"
 
 #define TYPE_S390_PCI_HOST_BRIDGE "s390-pcihost"
 #define TYPE_S390_PCI_BUS "s390-pcibus"
@@ -36,12 +37,16 @@
 #define UID_UNDEFINED 0
 #define UID_CHECKING_ENABLED 0x01
 
+typedef struct S390pciState S390pciState;
 #define S390_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(S390pciState, (obj), TYPE_S390_PCI_HOST_BRIDGE)
+typedef struct S390PCIBus S390PCIBus;
 #define S390_PCI_BUS(obj) \
     OBJECT_CHECK(S390PCIBus, (obj), TYPE_S390_PCI_BUS)
+typedef struct S390PCIBusDevice S390PCIBusDevice;
 #define S390_PCI_DEVICE(obj) \
     OBJECT_CHECK(S390PCIBusDevice, (obj), TYPE_S390_PCI_DEVICE)
+typedef struct S390PCIIOMMU S390PCIIOMMU;
 #define S390_PCI_IOMMU(obj) \
     OBJECT_CHECK(S390PCIIOMMU, (obj), TYPE_S390_PCI_IOMMU)
 
@@ -265,8 +270,7 @@ typedef struct S390IOTLBEntry {
     uint64_t perm;
 } S390IOTLBEntry;
 
-typedef struct S390PCIBusDevice S390PCIBusDevice;
-typedef struct S390PCIIOMMU {
+struct S390PCIIOMMU {
     Object parent_obj;
     S390PCIBusDevice *pbdev;
     AddressSpace as;
@@ -277,7 +281,7 @@ typedef struct S390PCIIOMMU {
     uint64_t pba;
     uint64_t pal;
     GHashTable *iotlb;
-} S390PCIIOMMU;
+};
 
 typedef struct S390PCIIOMMUTable {
     uint64_t key;
@@ -339,11 +343,11 @@ struct S390PCIBusDevice {
     QTAILQ_ENTRY(S390PCIBusDevice) link;
 };
 
-typedef struct S390PCIBus {
+struct S390PCIBus {
     BusState qbus;
-} S390PCIBus;
+};
 
-typedef struct S390pciState {
+struct S390pciState {
     PCIHostState parent_obj;
     uint32_t next_idx;
     int bus_no;
@@ -352,7 +356,7 @@ typedef struct S390pciState {
     GHashTable *zpci_table;
     QTAILQ_HEAD(, SeiContainer) pending_sei;
     QTAILQ_HEAD(, S390PCIBusDevice) zpci_devs;
-} S390pciState;
+};
 
 S390pciState *s390_get_phb(void);
 int pci_chsc_sei_nt2_get_event(void *res);
diff --git a/hw/s390x/virtio-ccw.h b/hw/s390x/virtio-ccw.h
index b281896f7d..c046c816c9 100644
--- a/hw/s390x/virtio-ccw.h
+++ b/hw/s390x/virtio-ccw.h
@@ -17,6 +17,7 @@
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/virtio-serial.h"
 #include "hw/virtio/virtio-scsi.h"
+#include "qom/object.h"
 #ifdef CONFIG_VHOST_SCSI
 #include "hw/virtio/vhost-scsi.h"
 #endif
@@ -53,6 +54,8 @@
 #define CCW_CMD_SET_VIRTIO_REV 0x83
 
 #define TYPE_VIRTIO_CCW_DEVICE "virtio-ccw-device"
+typedef struct VirtIOCCWDeviceClass VirtIOCCWDeviceClass;
+typedef struct VirtioCcwDevice VirtioCcwDevice;
 #define VIRTIO_CCW_DEVICE(obj) \
      OBJECT_CHECK(VirtioCcwDevice, (obj), TYPE_VIRTIO_CCW_DEVICE)
 #define VIRTIO_CCW_DEVICE_CLASS(klass) \
@@ -71,14 +74,13 @@ typedef struct VirtioBusClass VirtioCcwBusClass;
 #define VIRTIO_CCW_BUS_CLASS(klass) \
     OBJECT_CLASS_CHECK(VirtioCcwBusClass, klass, TYPE_VIRTIO_CCW_BUS)
 
-typedef struct VirtioCcwDevice VirtioCcwDevice;
 
-typedef struct VirtIOCCWDeviceClass {
+struct VirtIOCCWDeviceClass {
     CCWDeviceClass parent_class;
     void (*realize)(VirtioCcwDevice *dev, Error **errp);
     void (*unrealize)(VirtioCcwDevice *dev);
     void (*parent_reset)(DeviceState *dev);
-} VirtIOCCWDeviceClass;
+};
 
 /* Performance improves when virtqueue kick processing is decoupled from the
  * vcpu thread using ioeventfd for some devices. */
@@ -111,92 +113,100 @@ static inline int virtio_ccw_rev_max(VirtioCcwDevice *dev)
 /* virtio-scsi-ccw */
 
 #define TYPE_VIRTIO_SCSI_CCW "virtio-scsi-ccw"
+typedef struct VirtIOSCSICcw VirtIOSCSICcw;
 #define VIRTIO_SCSI_CCW(obj) \
         OBJECT_CHECK(VirtIOSCSICcw, (obj), TYPE_VIRTIO_SCSI_CCW)
 
-typedef struct VirtIOSCSICcw {
+struct VirtIOSCSICcw {
     VirtioCcwDevice parent_obj;
     VirtIOSCSI vdev;
-} VirtIOSCSICcw;
+};
 
 #ifdef CONFIG_VHOST_SCSI
 /* vhost-scsi-ccw */
 
 #define TYPE_VHOST_SCSI_CCW "vhost-scsi-ccw"
+typedef struct VHostSCSICcw VHostSCSICcw;
 #define VHOST_SCSI_CCW(obj) \
         OBJECT_CHECK(VHostSCSICcw, (obj), TYPE_VHOST_SCSI_CCW)
 
-typedef struct VHostSCSICcw {
+struct VHostSCSICcw {
     VirtioCcwDevice parent_obj;
     VHostSCSI vdev;
-} VHostSCSICcw;
+};
 #endif
 
 /* virtio-blk-ccw */
 
 #define TYPE_VIRTIO_BLK_CCW "virtio-blk-ccw"
+typedef struct VirtIOBlkCcw VirtIOBlkCcw;
 #define VIRTIO_BLK_CCW(obj) \
         OBJECT_CHECK(VirtIOBlkCcw, (obj), TYPE_VIRTIO_BLK_CCW)
 
-typedef struct VirtIOBlkCcw {
+struct VirtIOBlkCcw {
     VirtioCcwDevice parent_obj;
     VirtIOBlock vdev;
-} VirtIOBlkCcw;
+};
 
 /* virtio-balloon-ccw */
 
 #define TYPE_VIRTIO_BALLOON_CCW "virtio-balloon-ccw"
+typedef struct VirtIOBalloonCcw VirtIOBalloonCcw;
 #define VIRTIO_BALLOON_CCW(obj) \
         OBJECT_CHECK(VirtIOBalloonCcw, (obj), TYPE_VIRTIO_BALLOON_CCW)
 
-typedef struct VirtIOBalloonCcw {
+struct VirtIOBalloonCcw {
     VirtioCcwDevice parent_obj;
     VirtIOBalloon vdev;
-} VirtIOBalloonCcw;
+};
 
 /* virtio-serial-ccw */
 
 #define TYPE_VIRTIO_SERIAL_CCW "virtio-serial-ccw"
+typedef struct VirtioSerialCcw VirtioSerialCcw;
 #define VIRTIO_SERIAL_CCW(obj) \
         OBJECT_CHECK(VirtioSerialCcw, (obj), TYPE_VIRTIO_SERIAL_CCW)
 
-typedef struct VirtioSerialCcw {
+struct VirtioSerialCcw {
     VirtioCcwDevice parent_obj;
     VirtIOSerial vdev;
-} VirtioSerialCcw;
+};
 
 /* virtio-net-ccw */
 
 #define TYPE_VIRTIO_NET_CCW "virtio-net-ccw"
+typedef struct VirtIONetCcw VirtIONetCcw;
 #define VIRTIO_NET_CCW(obj) \
         OBJECT_CHECK(VirtIONetCcw, (obj), TYPE_VIRTIO_NET_CCW)
 
-typedef struct VirtIONetCcw {
+struct VirtIONetCcw {
     VirtioCcwDevice parent_obj;
     VirtIONet vdev;
-} VirtIONetCcw;
+};
 
 /* virtio-rng-ccw */
 
 #define TYPE_VIRTIO_RNG_CCW "virtio-rng-ccw"
+typedef struct VirtIORNGCcw VirtIORNGCcw;
 #define VIRTIO_RNG_CCW(obj) \
         OBJECT_CHECK(VirtIORNGCcw, (obj), TYPE_VIRTIO_RNG_CCW)
 
-typedef struct VirtIORNGCcw {
+struct VirtIORNGCcw {
     VirtioCcwDevice parent_obj;
     VirtIORNG vdev;
-} VirtIORNGCcw;
+};
 
 /* virtio-crypto-ccw */
 
 #define TYPE_VIRTIO_CRYPTO_CCW "virtio-crypto-ccw"
+typedef struct VirtIOCryptoCcw VirtIOCryptoCcw;
 #define VIRTIO_CRYPTO_CCW(obj) \
         OBJECT_CHECK(VirtIOCryptoCcw, (obj), TYPE_VIRTIO_CRYPTO_CCW)
 
-typedef struct VirtIOCryptoCcw {
+struct VirtIOCryptoCcw {
     VirtioCcwDevice parent_obj;
     VirtIOCrypto vdev;
-} VirtIOCryptoCcw;
+};
 
 VirtIODevice *virtio_ccw_get_vdev(SubchDev *sch);
 
@@ -204,56 +214,61 @@ VirtIODevice *virtio_ccw_get_vdev(SubchDev *sch);
 #include "hw/9pfs/virtio-9p.h"
 
 #define TYPE_VIRTIO_9P_CCW "virtio-9p-ccw"
+typedef struct V9fsCCWState V9fsCCWState;
 #define VIRTIO_9P_CCW(obj) \
     OBJECT_CHECK(V9fsCCWState, (obj), TYPE_VIRTIO_9P_CCW)
 
-typedef struct V9fsCCWState {
+struct V9fsCCWState {
     VirtioCcwDevice parent_obj;
     V9fsVirtioState vdev;
-} V9fsCCWState;
+};
 
 #endif /* CONFIG_VIRTFS */
 
 #ifdef CONFIG_VHOST_VSOCK
 #define TYPE_VHOST_VSOCK_CCW "vhost-vsock-ccw"
+typedef struct VHostVSockCCWState VHostVSockCCWState;
 #define VHOST_VSOCK_CCW(obj) \
     OBJECT_CHECK(VHostVSockCCWState, (obj), TYPE_VHOST_VSOCK_CCW)
 
-typedef struct VHostVSockCCWState {
+struct VHostVSockCCWState {
     VirtioCcwDevice parent_obj;
     VHostVSock vdev;
-} VHostVSockCCWState;
+};
 
 #endif /* CONFIG_VHOST_VSOCK */
 
 #define TYPE_VIRTIO_GPU_CCW "virtio-gpu-ccw"
+typedef struct VirtIOGPUCcw VirtIOGPUCcw;
 #define VIRTIO_GPU_CCW(obj) \
         OBJECT_CHECK(VirtIOGPUCcw, (obj), TYPE_VIRTIO_GPU_CCW)
 
-typedef struct VirtIOGPUCcw {
+struct VirtIOGPUCcw {
     VirtioCcwDevice parent_obj;
     VirtIOGPU vdev;
-} VirtIOGPUCcw;
+};
 
 #define TYPE_VIRTIO_INPUT_CCW "virtio-input-ccw"
+typedef struct VirtIOInputCcw VirtIOInputCcw;
 #define VIRTIO_INPUT_CCW(obj) \
         OBJECT_CHECK(VirtIOInputCcw, (obj), TYPE_VIRTIO_INPUT_CCW)
 
-typedef struct VirtIOInputCcw {
+struct VirtIOInputCcw {
     VirtioCcwDevice parent_obj;
     VirtIOInput vdev;
-} VirtIOInputCcw;
+};
 
 #define TYPE_VIRTIO_INPUT_HID_CCW "virtio-input-hid-ccw"
 #define TYPE_VIRTIO_KEYBOARD_CCW "virtio-keyboard-ccw"
 #define TYPE_VIRTIO_MOUSE_CCW "virtio-mouse-ccw"
 #define TYPE_VIRTIO_TABLET_CCW "virtio-tablet-ccw"
+typedef struct VirtIOInputHIDCcw VirtIOInputHIDCcw;
 #define VIRTIO_INPUT_HID_CCW(obj) \
         OBJECT_CHECK(VirtIOInputHIDCcw, (obj), TYPE_VIRTIO_INPUT_HID_CCW)
 
-typedef struct VirtIOInputHIDCcw {
+struct VirtIOInputHIDCcw {
     VirtioCcwDevice parent_obj;
     VirtIOInputHID vdev;
-} VirtIOInputHIDCcw;
+};
 
 #endif
diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
index 9ac98fc20e..2e76bda79e 100644
--- a/hw/scsi/mptsas.h
+++ b/hw/scsi/mptsas.h
@@ -2,6 +2,7 @@
 #define MPTSAS_H
 
 #include "mpi.h"
+#include "qom/object.h"
 
 #define MPTSAS_NUM_PORTS 8
 #define MPTSAS_MAX_FRAMES 2048     /* Firmware limit at 65535 */
diff --git a/hw/usb/ccid.h b/hw/usb/ccid.h
index 531bf28fb0..b992d2ccf8 100644
--- a/hw/usb/ccid.h
+++ b/hw/usb/ccid.h
@@ -11,11 +11,13 @@
 #define CCID_H
 
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 typedef struct CCIDCardState CCIDCardState;
 typedef struct CCIDCardInfo CCIDCardInfo;
 
 #define TYPE_CCID_CARD "ccid-card"
+typedef struct CCIDCardClass CCIDCardClass;
 #define CCID_CARD(obj) \
      OBJECT_CHECK(CCIDCardState, (obj), TYPE_CCID_CARD)
 #define CCID_CARD_CLASS(klass) \
@@ -27,7 +29,7 @@ typedef struct CCIDCardInfo CCIDCardInfo;
  * callbacks to be used by the CCID device (hw/usb-ccid.c) to call
  * into the smartcard device (hw/ccid-card-*.c)
  */
-typedef struct CCIDCardClass {
+struct CCIDCardClass {
     /*< private >*/
     DeviceClass parent_class;
     /*< public >*/
@@ -37,7 +39,7 @@ typedef struct CCIDCardClass {
                             uint32_t len);
     void (*realize)(CCIDCardState *card, Error **errp);
     void (*unrealize)(CCIDCardState *card);
-} CCIDCardClass;
+};
 
 /*
  * state of the CCID Card device (i.e. hw/ccid-card-*.c)
diff --git a/hw/usb/hcd-dwc2.h b/hw/usb/hcd-dwc2.h
index 54111d835e..71b40f0d8a 100644
--- a/hw/usb/hcd-dwc2.h
+++ b/hw/usb/hcd-dwc2.h
@@ -24,6 +24,7 @@
 #include "hw/sysbus.h"
 #include "hw/usb.h"
 #include "sysemu/dma.h"
+#include "qom/object.h"
 
 #define DWC2_MMIO_SIZE      0x11000
 
diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index 57b38cfc05..c12c9bae46 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -23,6 +23,7 @@
 #include "sysemu/dma.h"
 #include "hw/pci/pci.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #ifndef EHCI_DEBUG
 #define EHCI_DEBUG   0
@@ -328,15 +329,16 @@ void usb_ehci_unrealize(EHCIState *s, DeviceState *dev);
 void ehci_reset(void *opaque);
 
 #define TYPE_PCI_EHCI "pci-ehci-usb"
+typedef struct EHCIPCIState EHCIPCIState;
 #define PCI_EHCI(obj) OBJECT_CHECK(EHCIPCIState, (obj), TYPE_PCI_EHCI)
 
-typedef struct EHCIPCIState {
+struct EHCIPCIState {
     /*< private >*/
     PCIDevice pcidev;
     /*< public >*/
 
     EHCIState ehci;
-} EHCIPCIState;
+};
 
 
 #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
@@ -347,6 +349,8 @@ typedef struct EHCIPCIState {
 #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
 #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
 
+typedef struct EHCISysBusState EHCISysBusState;
+typedef struct SysBusEHCIClass SysBusEHCIClass;
 #define SYS_BUS_EHCI(obj) \
     OBJECT_CHECK(EHCISysBusState, (obj), TYPE_SYS_BUS_EHCI)
 #define SYS_BUS_EHCI_CLASS(class) \
@@ -354,15 +358,15 @@ typedef struct EHCIPCIState {
 #define SYS_BUS_EHCI_GET_CLASS(obj) \
     OBJECT_GET_CLASS(SysBusEHCIClass, (obj), TYPE_SYS_BUS_EHCI)
 
-typedef struct EHCISysBusState {
+struct EHCISysBusState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
 
     EHCIState ehci;
-} EHCISysBusState;
+};
 
-typedef struct SysBusEHCIClass {
+struct SysBusEHCIClass {
     /*< private >*/
     SysBusDeviceClass parent_class;
     /*< public >*/
@@ -371,17 +375,18 @@ typedef struct SysBusEHCIClass {
     uint16_t opregbase;
     uint16_t portscbase;
     uint16_t portnr;
-} SysBusEHCIClass;
+};
 
+typedef struct FUSBH200EHCIState FUSBH200EHCIState;
 #define FUSBH200_EHCI(obj) \
     OBJECT_CHECK(FUSBH200EHCIState, (obj), TYPE_FUSBH200_EHCI)
 
-typedef struct FUSBH200EHCIState {
+struct FUSBH200EHCIState {
     /*< private >*/
     EHCISysBusState parent_obj;
     /*< public >*/
 
     MemoryRegion mem_vendor;
-} FUSBH200EHCIState;
+};
 
 #endif
diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
index 5c8819aedf..3e9053fb26 100644
--- a/hw/usb/hcd-ohci.h
+++ b/hw/usb/hcd-ohci.h
@@ -23,6 +23,7 @@
 
 #include "sysemu/dma.h"
 #include "hw/usb.h"
+#include "qom/object.h"
 
 /* Number of Downstream Ports on the root hub: */
 #define OHCI_MAX_PORTS 15
@@ -92,9 +93,10 @@ typedef struct OHCIState {
 } OHCIState;
 
 #define TYPE_SYSBUS_OHCI "sysbus-ohci"
+typedef struct OHCISysBusState OHCISysBusState;
 #define SYSBUS_OHCI(obj) OBJECT_CHECK(OHCISysBusState, (obj), TYPE_SYSBUS_OHCI)
 
-typedef struct {
+struct OHCISysBusState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -104,7 +106,7 @@ typedef struct {
     uint32_t num_ports;
     uint32_t firstport;
     dma_addr_t dma_offset;
-} OHCISysBusState;
+};
 
 extern const VMStateDescription vmstate_ohci_state;
 
diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 946af51fc2..867388a061 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -21,11 +21,13 @@
 
 #ifndef HW_USB_HCD_XHCI_H
 #define HW_USB_HCD_XHCI_H
+#include "qom/object.h"
 
 #define TYPE_XHCI "base-xhci"
 #define TYPE_NEC_XHCI "nec-usb-xhci"
 #define TYPE_QEMU_XHCI "qemu-xhci"
 
+typedef struct XHCIState XHCIState;
 #define XHCI(obj) \
     OBJECT_CHECK(XHCIState, (obj), TYPE_XHCI)
 
@@ -39,7 +41,6 @@
 /* Very pessimistic, let's hope it's enough for all cases */
 #define EV_QUEUE (((3 * 24) + 16) * MAXSLOTS)
 
-typedef struct XHCIState XHCIState;
 typedef struct XHCIStreamContext XHCIStreamContext;
 typedef struct XHCIEPContext XHCIEPContext;
 
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 3c0dca024b..8c1f94118a 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -18,6 +18,7 @@
 #include "qemu/event_notifier.h"
 #include "qemu/queue.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 
 #define PCI_ANY_ID (~0)
 
@@ -114,9 +115,10 @@ typedef struct VFIOMSIXInfo {
 } VFIOMSIXInfo;
 
 #define TYPE_VFIO_PCI "vfio-pci"
+typedef struct VFIOPCIDevice VFIOPCIDevice;
 #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
 
-typedef struct VFIOPCIDevice {
+struct VFIOPCIDevice {
     PCIDevice pdev;
     VFIODevice vbasedev;
     VFIOINTx intx;
@@ -173,7 +175,7 @@ typedef struct VFIOPCIDevice {
     VFIODisplay *dpy;
     Error *migration_blocker;
     Notifier irqchip_change_notifier;
-} VFIOPCIDevice;
+};
 
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
 static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
diff --git a/hw/virtio/virtio-mem-pci.h b/hw/virtio/virtio-mem-pci.h
index b51a28b275..65b86beac7 100644
--- a/hw/virtio/virtio-mem-pci.h
+++ b/hw/virtio/virtio-mem-pci.h
@@ -15,6 +15,7 @@
 
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-mem.h"
+#include "qom/object.h"
 
 typedef struct VirtIOMEMPCI VirtIOMEMPCI;
 
diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index e2eaaa9182..9175da6e81 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -17,6 +17,7 @@
 
 #include "hw/pci/msi.h"
 #include "hw/virtio/virtio-bus.h"
+#include "qom/object.h"
 
 typedef struct VirtIOPCIProxy VirtIOPCIProxy;
 
@@ -94,6 +95,7 @@ typedef struct {
  * virtio-pci: This is the PCIDevice which has a virtio-pci-bus.
  */
 #define TYPE_VIRTIO_PCI "virtio-pci"
+typedef struct VirtioPCIClass VirtioPCIClass;
 #define VIRTIO_PCI_GET_CLASS(obj) \
         OBJECT_GET_CLASS(VirtioPCIClass, obj, TYPE_VIRTIO_PCI)
 #define VIRTIO_PCI_CLASS(klass) \
@@ -101,11 +103,11 @@ typedef struct {
 #define VIRTIO_PCI(obj) \
         OBJECT_CHECK(VirtIOPCIProxy, (obj), TYPE_VIRTIO_PCI)
 
-typedef struct VirtioPCIClass {
+struct VirtioPCIClass {
     PCIDeviceClass parent_class;
     DeviceRealize parent_dc_realize;
     void (*realize)(VirtIOPCIProxy *vpci_dev, Error **errp);
-} VirtioPCIClass;
+};
 
 typedef struct VirtIOPCIRegion {
     MemoryRegion mr;
diff --git a/hw/virtio/virtio-pmem-pci.h b/hw/virtio/virtio-pmem-pci.h
index 616abef093..5ac8099637 100644
--- a/hw/virtio/virtio-pmem-pci.h
+++ b/hw/virtio/virtio-pmem-pci.h
@@ -16,6 +16,7 @@
 
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-pmem.h"
+#include "qom/object.h"
 
 typedef struct VirtIOPMEMPCI VirtIOPMEMPCI;
 
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 6e9cec95f3..c367c7da27 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -4,6 +4,7 @@
 #include "hw/xen/xen_common.h"
 #include "hw/pci/pci.h"
 #include "xen-host-pci-device.h"
+#include "qom/object.h"
 
 bool xen_igd_gfx_pt_enabled(void);
 void xen_igd_gfx_pt_set(bool value, Error **errp);
diff --git a/include/authz/base.h b/include/authz/base.h
index 0782981ad8..c01946b4ce 100644
--- a/include/authz/base.h
+++ b/include/authz/base.h
@@ -27,6 +27,8 @@
 
 #define TYPE_QAUTHZ "authz"
 
+typedef struct QAuthZ QAuthZ;
+typedef struct QAuthZClass QAuthZClass;
 #define QAUTHZ_CLASS(klass) \
      OBJECT_CLASS_CHECK(QAuthZClass, (klass), \
                         TYPE_QAUTHZ)
@@ -37,8 +39,6 @@
      OBJECT_CHECK(QAuthZ, (obj), \
                   TYPE_QAUTHZ)
 
-typedef struct QAuthZ QAuthZ;
-typedef struct QAuthZClass QAuthZClass;
 
 /**
  * QAuthZ:
diff --git a/include/authz/list.h b/include/authz/list.h
index a88cdbbcf8..5d5e8e803f 100644
--- a/include/authz/list.h
+++ b/include/authz/list.h
@@ -23,9 +23,12 @@
 
 #include "authz/base.h"
 #include "qapi/qapi-types-authz.h"
+#include "qom/object.h"
 
 #define TYPE_QAUTHZ_LIST "authz-list"
 
+typedef struct QAuthZList QAuthZList;
+typedef struct QAuthZListClass QAuthZListClass;
 #define QAUTHZ_LIST_CLASS(klass)                        \
     OBJECT_CLASS_CHECK(QAuthZListClass, (klass),        \
                        TYPE_QAUTHZ_LIST)
@@ -36,8 +39,6 @@
     OBJECT_CHECK(QAuthZList, (obj), \
                  TYPE_QAUTHZ_LIST)
 
-typedef struct QAuthZList QAuthZList;
-typedef struct QAuthZListClass QAuthZListClass;
 
 
 /**
diff --git a/include/authz/listfile.h b/include/authz/listfile.h
index 24ae2e606c..11169ac882 100644
--- a/include/authz/listfile.h
+++ b/include/authz/listfile.h
@@ -23,9 +23,12 @@
 
 #include "authz/list.h"
 #include "qemu/filemonitor.h"
+#include "qom/object.h"
 
 #define TYPE_QAUTHZ_LIST_FILE "authz-list-file"
 
+typedef struct QAuthZListFile QAuthZListFile;
+typedef struct QAuthZListFileClass QAuthZListFileClass;
 #define QAUTHZ_LIST_FILE_CLASS(klass)                        \
     OBJECT_CLASS_CHECK(QAuthZListFileClass, (klass),        \
                        TYPE_QAUTHZ_LIST_FILE)
@@ -36,8 +39,6 @@
     OBJECT_CHECK(QAuthZListFile, (obj), \
                  TYPE_QAUTHZ_LIST_FILE)
 
-typedef struct QAuthZListFile QAuthZListFile;
-typedef struct QAuthZListFileClass QAuthZListFileClass;
 
 
 /**
diff --git a/include/authz/pamacct.h b/include/authz/pamacct.h
index f3a7ef1011..a14cf33fb4 100644
--- a/include/authz/pamacct.h
+++ b/include/authz/pamacct.h
@@ -22,10 +22,13 @@
 #define QAUTHZ_PAMACCT_H
 
 #include "authz/base.h"
+#include "qom/object.h"
 
 
 #define TYPE_QAUTHZ_PAM "authz-pam"
 
+typedef struct QAuthZPAM QAuthZPAM;
+typedef struct QAuthZPAMClass QAuthZPAMClass;
 #define QAUTHZ_PAM_CLASS(klass) \
      OBJECT_CLASS_CHECK(QAuthZPAMClass, (klass), \
                         TYPE_QAUTHZ_PAM)
@@ -36,8 +39,6 @@
      OBJECT_CHECK(QAuthZPAM, (obj), \
                   TYPE_QAUTHZ_PAM)
 
-typedef struct QAuthZPAM QAuthZPAM;
-typedef struct QAuthZPAMClass QAuthZPAMClass;
 
 
 /**
diff --git a/include/authz/simple.h b/include/authz/simple.h
index 2b7ab0cdd9..df8c1bf39c 100644
--- a/include/authz/simple.h
+++ b/include/authz/simple.h
@@ -22,9 +22,12 @@
 #define QAUTHZ_SIMPLE_H
 
 #include "authz/base.h"
+#include "qom/object.h"
 
 #define TYPE_QAUTHZ_SIMPLE "authz-simple"
 
+typedef struct QAuthZSimple QAuthZSimple;
+typedef struct QAuthZSimpleClass QAuthZSimpleClass;
 #define QAUTHZ_SIMPLE_CLASS(klass)                        \
     OBJECT_CLASS_CHECK(QAuthZSimpleClass, (klass),        \
                        TYPE_QAUTHZ_SIMPLE)
@@ -35,8 +38,6 @@
     OBJECT_CHECK(QAuthZSimple, (obj), \
                  TYPE_QAUTHZ_SIMPLE)
 
-typedef struct QAuthZSimple QAuthZSimple;
-typedef struct QAuthZSimpleClass QAuthZSimpleClass;
 
 
 /**
diff --git a/include/block/throttle-groups.h b/include/block/throttle-groups.h
index 5e77db700f..7c6f572cf9 100644
--- a/include/block/throttle-groups.h
+++ b/include/block/throttle-groups.h
@@ -27,6 +27,7 @@
 
 #include "qemu/throttle.h"
 #include "block/block_int.h"
+#include "qom/object.h"
 
 /* The ThrottleGroupMember structure indicates membership in a ThrottleGroup
  * and holds related data.
diff --git a/include/chardev/char-fd.h b/include/chardev/char-fd.h
index e7c2b176f9..1442dcaa62 100644
--- a/include/chardev/char-fd.h
+++ b/include/chardev/char-fd.h
@@ -26,13 +26,15 @@
 
 #include "io/channel.h"
 #include "chardev/char.h"
+#include "qom/object.h"
 
-typedef struct FDChardev {
+struct FDChardev {
     Chardev parent;
 
     QIOChannel *ioc_in, *ioc_out;
     int max_size;
-} FDChardev;
+};
+typedef struct FDChardev FDChardev;
 
 #define TYPE_CHARDEV_FD "chardev-fd"
 
diff --git a/include/chardev/char-win.h b/include/chardev/char-win.h
index fa59e9e423..f1632330f1 100644
--- a/include/chardev/char-win.h
+++ b/include/chardev/char-win.h
@@ -25,8 +25,9 @@
 #define CHAR_WIN_H
 
 #include "chardev/char.h"
+#include "qom/object.h"
 
-typedef struct {
+struct WinChardev {
     Chardev parent;
 
     bool keep_open; /* console do not close file */
@@ -36,7 +37,8 @@ typedef struct {
 
     /* Protected by the Chardev chr_write_lock.  */
     OVERLAPPED osend;
-} WinChardev;
+};
+typedef struct WinChardev WinChardev;
 
 #define NSENDBUF 2048
 #define NRECVBUF 2048
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 00589a6025..d91d851b33 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -226,6 +226,7 @@ int qemu_chr_write(Chardev *s, const uint8_t *buf, int len, bool write_all);
 int qemu_chr_wait_connected(Chardev *chr, Error **errp);
 
 #define TYPE_CHARDEV "chardev"
+typedef struct ChardevClass ChardevClass;
 #define CHARDEV(obj) OBJECT_CHECK(Chardev, (obj), TYPE_CHARDEV)
 #define CHARDEV_CLASS(klass) \
     OBJECT_CLASS_CHECK(ChardevClass, (klass), TYPE_CHARDEV)
@@ -251,7 +252,7 @@ int qemu_chr_wait_connected(Chardev *chr, Error **errp);
 #define CHARDEV_IS_PTY(chr) \
     object_dynamic_cast(OBJECT(chr), TYPE_CHARDEV_PTY)
 
-typedef struct ChardevClass {
+struct ChardevClass {
     ObjectClass parent_class;
 
     bool internal; /* TODO: eventually use TYPE_USER_CREATABLE */
@@ -276,7 +277,7 @@ typedef struct ChardevClass {
     void (*chr_be_event)(Chardev *s, QEMUChrEvent event);
     /* Return 0 if succeeded, 1 if failed */
     int (*chr_machine_done)(Chardev *chr);
-} ChardevClass;
+};
 
 Chardev *qemu_chardev_new(const char *id, const char *typename,
                           ChardevBackend *backend, GMainContext *context,
diff --git a/include/chardev/spice.h b/include/chardev/spice.h
index 1f7339b649..5bccc47392 100644
--- a/include/chardev/spice.h
+++ b/include/chardev/spice.h
@@ -3,8 +3,9 @@
 
 #include <spice.h>
 #include "chardev/char-fe.h"
+#include "qom/object.h"
 
-typedef struct SpiceChardev {
+struct SpiceChardev {
     Chardev               parent;
 
     SpiceCharDeviceInstance sin;
@@ -13,7 +14,8 @@ typedef struct SpiceChardev {
     const uint8_t         *datapos;
     int                   datalen;
     QLIST_ENTRY(SpiceChardev) next;
-} SpiceChardev;
+};
+typedef struct SpiceChardev SpiceChardev;
 
 #define TYPE_CHARDEV_SPICE "chardev-spice"
 #define TYPE_CHARDEV_SPICEVMC "chardev-spicevmc"
diff --git a/include/crypto/secret.h b/include/crypto/secret.h
index 2deb461d2f..8c03971e75 100644
--- a/include/crypto/secret.h
+++ b/include/crypto/secret.h
@@ -26,10 +26,10 @@
 #include "crypto/secret_common.h"
 
 #define TYPE_QCRYPTO_SECRET "secret"
+typedef struct QCryptoSecret QCryptoSecret;
 #define QCRYPTO_SECRET(obj)                  \
     OBJECT_CHECK(QCryptoSecret, (obj), TYPE_QCRYPTO_SECRET)
 
-typedef struct QCryptoSecret QCryptoSecret;
 typedef struct QCryptoSecretClass QCryptoSecretClass;
 
 /**
diff --git a/include/crypto/secret_common.h b/include/crypto/secret_common.h
index 980c02ab71..db282a3872 100644
--- a/include/crypto/secret_common.h
+++ b/include/crypto/secret_common.h
@@ -25,6 +25,8 @@
 #include "qom/object.h"
 
 #define TYPE_QCRYPTO_SECRET_COMMON "secret_common"
+typedef struct QCryptoSecretCommon QCryptoSecretCommon;
+typedef struct QCryptoSecretCommonClass QCryptoSecretCommonClass;
 #define QCRYPTO_SECRET_COMMON(obj) \
     OBJECT_CHECK(QCryptoSecretCommon, (obj), TYPE_QCRYPTO_SECRET_COMMON)
 #define QCRYPTO_SECRET_COMMON_CLASS(class) \
@@ -34,8 +36,6 @@
     OBJECT_GET_CLASS(QCryptoSecretCommonClass, \
                      (obj), TYPE_QCRYPTO_SECRET_COMMON)
 
-typedef struct QCryptoSecretCommon QCryptoSecretCommon;
-typedef struct QCryptoSecretCommonClass QCryptoSecretCommonClass;
 
 struct QCryptoSecretCommon {
     Object parent_obj;
diff --git a/include/crypto/secret_keyring.h b/include/crypto/secret_keyring.h
index 4345eb048e..8b3b8ee67d 100644
--- a/include/crypto/secret_keyring.h
+++ b/include/crypto/secret_keyring.h
@@ -26,6 +26,8 @@
 #include "crypto/secret_common.h"
 
 #define TYPE_QCRYPTO_SECRET_KEYRING "secret_keyring"
+typedef struct QCryptoSecretKeyring QCryptoSecretKeyring;
+typedef struct QCryptoSecretKeyringClass QCryptoSecretKeyringClass;
 #define QCRYPTO_SECRET_KEYRING(obj) \
     OBJECT_CHECK(QCryptoSecretKeyring, (obj), \
                  TYPE_QCRYPTO_SECRET_KEYRING)
@@ -36,8 +38,6 @@
     OBJECT_GET_CLASS(QCryptoSecretKeyringClass, \
                      (class), TYPE_QCRYPTO_SECRET_KEYRING)
 
-typedef struct QCryptoSecretKeyring QCryptoSecretKeyring;
-typedef struct QCryptoSecretKeyringClass QCryptoSecretKeyringClass;
 
 struct QCryptoSecretKeyring {
     QCryptoSecretCommon parent;
diff --git a/include/crypto/tls-cipher-suites.h b/include/crypto/tls-cipher-suites.h
index 28b3a73ce1..23f031953f 100644
--- a/include/crypto/tls-cipher-suites.h
+++ b/include/crypto/tls-cipher-suites.h
@@ -15,14 +15,15 @@
 #include "crypto/tlscreds.h"
 
 #define TYPE_QCRYPTO_TLS_CIPHER_SUITES "tls-cipher-suites"
+typedef struct QCryptoTLSCipherSuites QCryptoTLSCipherSuites;
 #define QCRYPTO_TLS_CIPHER_SUITES(obj) \
     OBJECT_CHECK(QCryptoTLSCipherSuites, (obj), TYPE_QCRYPTO_TLS_CIPHER_SUITES)
 
-typedef struct QCryptoTLSCipherSuites {
+struct QCryptoTLSCipherSuites {
     /* <private> */
     QCryptoTLSCreds parent_obj;
     /* <public> */
-} QCryptoTLSCipherSuites;
+};
 
 /**
   * qcrypto_tls_cipher_suites_get_data:
diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
index fd7a284aa2..9f065a4def 100644
--- a/include/crypto/tlscreds.h
+++ b/include/crypto/tlscreds.h
@@ -29,10 +29,10 @@
 #endif
 
 #define TYPE_QCRYPTO_TLS_CREDS "tls-creds"
+typedef struct QCryptoTLSCreds QCryptoTLSCreds;
 #define QCRYPTO_TLS_CREDS(obj)                  \
     OBJECT_CHECK(QCryptoTLSCreds, (obj), TYPE_QCRYPTO_TLS_CREDS)
 
-typedef struct QCryptoTLSCreds QCryptoTLSCreds;
 typedef struct QCryptoTLSCredsClass QCryptoTLSCredsClass;
 
 #define QCRYPTO_TLS_CREDS_DH_PARAMS "dh-params.pem"
diff --git a/include/crypto/tlscredsanon.h b/include/crypto/tlscredsanon.h
index 9e9a5ce1a8..034ebd3fd9 100644
--- a/include/crypto/tlscredsanon.h
+++ b/include/crypto/tlscredsanon.h
@@ -22,13 +22,14 @@
 #define QCRYPTO_TLSCREDSANON_H
 
 #include "crypto/tlscreds.h"
+#include "qom/object.h"
 
 #define TYPE_QCRYPTO_TLS_CREDS_ANON "tls-creds-anon"
+typedef struct QCryptoTLSCredsAnon QCryptoTLSCredsAnon;
 #define QCRYPTO_TLS_CREDS_ANON(obj)                  \
     OBJECT_CHECK(QCryptoTLSCredsAnon, (obj), TYPE_QCRYPTO_TLS_CREDS_ANON)
 
 
-typedef struct QCryptoTLSCredsAnon QCryptoTLSCredsAnon;
 typedef struct QCryptoTLSCredsAnonClass QCryptoTLSCredsAnonClass;
 
 /**
diff --git a/include/crypto/tlscredspsk.h b/include/crypto/tlscredspsk.h
index 907035a29b..6e361366eb 100644
--- a/include/crypto/tlscredspsk.h
+++ b/include/crypto/tlscredspsk.h
@@ -22,12 +22,13 @@
 #define QCRYPTO_TLSCREDSPSK_H
 
 #include "crypto/tlscreds.h"
+#include "qom/object.h"
 
 #define TYPE_QCRYPTO_TLS_CREDS_PSK "tls-creds-psk"
+typedef struct QCryptoTLSCredsPSK QCryptoTLSCredsPSK;
 #define QCRYPTO_TLS_CREDS_PSK(obj)                  \
     OBJECT_CHECK(QCryptoTLSCredsPSK, (obj), TYPE_QCRYPTO_TLS_CREDS_PSK)
 
-typedef struct QCryptoTLSCredsPSK QCryptoTLSCredsPSK;
 typedef struct QCryptoTLSCredsPSKClass QCryptoTLSCredsPSKClass;
 
 #define QCRYPTO_TLS_CREDS_PSKFILE "keys.psk"
diff --git a/include/crypto/tlscredsx509.h b/include/crypto/tlscredsx509.h
index e1542e5c8c..e4d44ea22d 100644
--- a/include/crypto/tlscredsx509.h
+++ b/include/crypto/tlscredsx509.h
@@ -22,12 +22,13 @@
 #define QCRYPTO_TLSCREDSX509_H
 
 #include "crypto/tlscreds.h"
+#include "qom/object.h"
 
 #define TYPE_QCRYPTO_TLS_CREDS_X509 "tls-creds-x509"
+typedef struct QCryptoTLSCredsX509 QCryptoTLSCredsX509;
 #define QCRYPTO_TLS_CREDS_X509(obj)                  \
     OBJECT_CHECK(QCryptoTLSCredsX509, (obj), TYPE_QCRYPTO_TLS_CREDS_X509)
 
-typedef struct QCryptoTLSCredsX509 QCryptoTLSCredsX509;
 typedef struct QCryptoTLSCredsX509Class QCryptoTLSCredsX509Class;
 
 #define QCRYPTO_TLS_CREDS_X509_CA_CERT "ca-cert.pem"
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 0cfe987ab4..752b905e14 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -38,6 +38,7 @@
         OBJECT_CHECK(MemoryRegion, (obj), TYPE_MEMORY_REGION)
 
 #define TYPE_IOMMU_MEMORY_REGION "qemu:iommu-memory-region"
+typedef struct IOMMUMemoryRegionClass IOMMUMemoryRegionClass;
 #define IOMMU_MEMORY_REGION(obj) \
         OBJECT_CHECK(IOMMUMemoryRegion, (obj), TYPE_IOMMU_MEMORY_REGION)
 #define IOMMU_MEMORY_REGION_CLASS(klass) \
@@ -242,7 +243,7 @@ enum IOMMUMemoryRegionAttr {
  * only a single IOMMU index. A more complex IOMMU might have one index
  * for secure transactions and one for non-secure transactions.
  */
-typedef struct IOMMUMemoryRegionClass {
+struct IOMMUMemoryRegionClass {
     /* private */
     MemoryRegionClass parent_class;
 
@@ -355,7 +356,7 @@ typedef struct IOMMUMemoryRegionClass {
      * @iommu: the IOMMUMemoryRegion
      */
     int (*num_indexes)(IOMMUMemoryRegion *iommu);
-} IOMMUMemoryRegionClass;
+};
 
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
 typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index a2a12af9b9..4ef44d6fe8 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -18,6 +18,7 @@ typedef enum {
 
 #define TYPE_ACPI_DEVICE_IF "acpi-device-interface"
 
+typedef struct AcpiDeviceIfClass AcpiDeviceIfClass;
 #define ACPI_DEVICE_IF_CLASS(klass) \
      OBJECT_CLASS_CHECK(AcpiDeviceIfClass, (klass), \
                         TYPE_ACPI_DEVICE_IF)
@@ -48,7 +49,7 @@ void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event);
  * knowledge about internals of actual device that implements
  * ACPI interface.
  */
-typedef struct AcpiDeviceIfClass {
+struct AcpiDeviceIfClass {
     /* <private> */
     InterfaceClass parent_class;
 
@@ -57,5 +58,5 @@ typedef struct AcpiDeviceIfClass {
     void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
     void (*madt_cpu)(AcpiDeviceIf *adev, int uid,
                      const CPUArchIdList *apic_ids, GArray *entry);
-} AcpiDeviceIfClass;
+};
 #endif
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index 90a9180db5..2208f0b939 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -62,10 +62,12 @@
 #include "hw/sysbus.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/ghes.h"
+#include "qom/object.h"
 
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
 
 #define TYPE_ACPI_GED "acpi-ged"
+typedef struct AcpiGedState AcpiGedState;
 #define ACPI_GED(obj) \
     OBJECT_CHECK(AcpiGedState, (obj), TYPE_ACPI_GED)
 
@@ -90,7 +92,7 @@ typedef struct GEDState {
     uint32_t     sel;
 } GEDState;
 
-typedef struct AcpiGedState {
+struct AcpiGedState {
     SysBusDevice parent_obj;
     MemHotplugState memhp_state;
     MemoryRegion container_memhp;
@@ -98,7 +100,7 @@ typedef struct AcpiGedState {
     uint32_t ged_event_bitmap;
     qemu_irq irq;
     AcpiGhesState ghes_state;
-} AcpiGedState;
+};
 
 void build_ged_aml(Aml *table, const char* name, HotplugHandler *hotplug_dev,
                    uint32_t ged_irq, AmlRegionSpace rs, hwaddr ged_base);
diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
index c49d913f3e..0286fc0f09 100644
--- a/include/hw/acpi/vmgenid.h
+++ b/include/hw/acpi/vmgenid.h
@@ -4,6 +4,7 @@
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/qdev-core.h"
 #include "qemu/uuid.h"
+#include "qom/object.h"
 
 #define VMGENID_DEVICE           "vmgenid"
 #define VMGENID_GUID             "guid"
@@ -15,13 +16,14 @@
                                        * OVMF SDT Header Probe Supressor
                                        */
 
+typedef struct VmGenIdState VmGenIdState;
 #define VMGENID(obj) OBJECT_CHECK(VmGenIdState, (obj), VMGENID_DEVICE)
 
-typedef struct VmGenIdState {
+struct VmGenIdState {
     DeviceClass parent_obj;
     QemuUUID guid;                /* The 128-bit GUID seen by the guest */
     uint8_t vmgenid_addr_le[8];   /* Address of the GUID (little-endian) */
-} VmGenIdState;
+};
 
 /* returns NULL unless there is exactly one device */
 static inline Object *find_vmgenid_dev(void)
diff --git a/include/hw/adc/stm32f2xx_adc.h b/include/hw/adc/stm32f2xx_adc.h
index 663b79f4f3..60d4b65570 100644
--- a/include/hw/adc/stm32f2xx_adc.h
+++ b/include/hw/adc/stm32f2xx_adc.h
@@ -26,6 +26,7 @@
 #define HW_STM32F2XX_ADC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define ADC_SR    0x00
 #define ADC_CR1   0x04
@@ -58,10 +59,11 @@
 #define ADC_COMMON_ADDRESS 0x100
 
 #define TYPE_STM32F2XX_ADC "stm32f2xx-adc"
+typedef struct STM32F2XXADCState STM32F2XXADCState;
 #define STM32F2XX_ADC(obj) \
     OBJECT_CHECK(STM32F2XXADCState, (obj), TYPE_STM32F2XX_ADC)
 
-typedef struct {
+struct STM32F2XXADCState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -84,6 +86,6 @@ typedef struct {
     uint32_t adc_dr;
 
     qemu_irq irq;
-} STM32F2XXADCState;
+};
 
 #endif /* HW_STM32F2XX_ADC_H */
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 77c82a9982..631454f1c7 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -14,6 +14,7 @@
 #include "hw/rtc/allwinner-rtc.h"
 
 #include "target/arm/cpu.h"
+#include "qom/object.h"
 
 
 #define AW_A10_SDRAM_BASE       0x40000000
@@ -21,9 +22,10 @@
 #define AW_A10_NUM_USB          2
 
 #define TYPE_AW_A10 "allwinner-a10"
+typedef struct AwA10State AwA10State;
 #define AW_A10(obj) OBJECT_CHECK(AwA10State, (obj), TYPE_AW_A10)
 
-typedef struct AwA10State {
+struct AwA10State {
     /*< private >*/
     DeviceState parent_obj;
     /*< public >*/
@@ -38,6 +40,6 @@ typedef struct AwA10State {
     MemoryRegion sram_a;
     EHCISysBusState ehci[AW_A10_NUM_USB];
     OHCISysBusState ohci[AW_A10_NUM_USB];
-} AwA10State;
+};
 
 #endif
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index 626139dcb3..5fda95066f 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -106,6 +106,7 @@ enum {
 #define TYPE_AW_H3 "allwinner-h3"
 
 /** Convert input object to Allwinner H3 state object */
+typedef struct AwH3State AwH3State;
 #define AW_H3(obj) OBJECT_CHECK(AwH3State, (obj), TYPE_AW_H3)
 
 /** @} */
@@ -116,7 +117,7 @@ enum {
  * This struct contains the state of all the devices
  * which are currently emulated by the H3 SoC code.
  */
-typedef struct AwH3State {
+struct AwH3State {
     /*< private >*/
     DeviceState parent_obj;
     /*< public >*/
@@ -136,7 +137,7 @@ typedef struct AwH3State {
     MemoryRegion sram_a1;
     MemoryRegion sram_a2;
     MemoryRegion sram_c;
-} AwH3State;
+};
 
 /**
  * Emulate Boot ROM firmware setup functionality.
diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 529816286d..dca241d47f 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -105,8 +105,11 @@
 #include "hw/or-irq.h"
 #include "hw/core/split-irq.h"
 #include "hw/cpu/cluster.h"
+#include "qom/object.h"
 
 #define TYPE_ARM_SSE "arm-sse"
+typedef struct ARMSSE ARMSSE;
+typedef struct ARMSSEClass ARMSSEClass;
 #define ARM_SSE(obj) OBJECT_CHECK(ARMSSE, (obj), TYPE_ARM_SSE)
 
 /*
@@ -140,7 +143,7 @@
 #define RAM3_PPU 6
 #define NUM_PPUS 7
 
-typedef struct ARMSSE {
+struct ARMSSE {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -215,14 +218,14 @@ typedef struct ARMSSE {
     uint32_t init_svtor;
     bool cpu_fpu[SSE_MAX_CPUS];
     bool cpu_dsp[SSE_MAX_CPUS];
-} ARMSSE;
+};
 
 typedef struct ARMSSEInfo ARMSSEInfo;
 
-typedef struct ARMSSEClass {
+struct ARMSSEClass {
     DeviceClass parent_class;
     const ARMSSEInfo *info;
-} ARMSSEClass;
+};
 
 #define ARM_SSE_CLASS(klass) \
     OBJECT_CLASS_CHECK(ARMSSEClass, (klass), TYPE_ARM_SSE)
diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index a30e3c6471..c820d32ad5 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -13,11 +13,13 @@
 #include "hw/sysbus.h"
 #include "hw/intc/armv7m_nvic.h"
 #include "target/arm/idau.h"
+#include "qom/object.h"
 
 #define TYPE_BITBAND "ARM,bitband-memory"
+typedef struct BitBandState BitBandState;
 #define BITBAND(obj) OBJECT_CHECK(BitBandState, (obj), TYPE_BITBAND)
 
-typedef struct {
+struct BitBandState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -26,9 +28,10 @@ typedef struct {
     MemoryRegion iomem;
     uint32_t base;
     MemoryRegion *source_memory;
-} BitBandState;
+};
 
 #define TYPE_ARMV7M "armv7m"
+typedef struct ARMv7MState ARMv7MState;
 #define ARMV7M(obj) OBJECT_CHECK(ARMv7MState, (obj), TYPE_ARMV7M)
 
 #define ARMV7M_NUM_BITBANDS 2
@@ -49,7 +52,7 @@ typedef struct {
  * + Property "dsp": enable DSP (forwarded to CPU object)
  * + Property "enable-bitband": expose bitbanded IO
  */
-typedef struct ARMv7MState {
+struct ARMv7MState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -72,6 +75,6 @@ typedef struct ARMv7MState {
     bool start_powered_off;
     bool vfp;
     bool dsp;
-} ARMv7MState;
+};
 
 #endif
diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 09da9d9acc..4e5ec37acb 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -10,10 +10,12 @@
 #define ARM_ASPEED_H
 
 #include "hw/boards.h"
+#include "qom/object.h"
 
 typedef struct AspeedMachineState AspeedMachineState;
 
 #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
+typedef struct AspeedMachineClass AspeedMachineClass;
 #define ASPEED_MACHINE(obj) \
     OBJECT_CHECK(AspeedMachineState, (obj), TYPE_ASPEED_MACHINE)
 
@@ -27,7 +29,7 @@ typedef struct AspeedMachineState AspeedMachineState;
 #define ASPEED_MACHINE_GET_CLASS(obj) \
      OBJECT_GET_CLASS(AspeedMachineClass, (obj), TYPE_ASPEED_MACHINE)
 
-typedef struct AspeedMachineClass {
+struct AspeedMachineClass {
     MachineClass parent_obj;
 
     const char *name;
@@ -40,7 +42,7 @@ typedef struct AspeedMachineClass {
     uint32_t num_cs;
     uint32_t macs_mask;
     void (*i2c_init)(AspeedMachineState *bmc);
-} AspeedMachineClass;
+};
 
 
 #endif
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index d46f197cbe..31679ee42e 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -27,6 +27,7 @@
 #include "hw/gpio/aspeed_gpio.h"
 #include "hw/sd/aspeed_sdhci.h"
 #include "hw/usb/hcd-ehci.h"
+#include "qom/object.h"
 
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_EHCIS_NUM 2
@@ -34,7 +35,7 @@
 #define ASPEED_CPUS_NUM  2
 #define ASPEED_MACS_NUM  4
 
-typedef struct AspeedSoCState {
+struct AspeedSoCState {
     /*< private >*/
     DeviceState parent;
 
@@ -60,12 +61,14 @@ typedef struct AspeedSoCState {
     AspeedGPIOState gpio_1_8v;
     AspeedSDHCIState sdhci;
     AspeedSDHCIState emmc;
-} AspeedSoCState;
+};
+typedef struct AspeedSoCState AspeedSoCState;
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
+typedef struct AspeedSoCClass AspeedSoCClass;
 #define ASPEED_SOC(obj) OBJECT_CHECK(AspeedSoCState, (obj), TYPE_ASPEED_SOC)
 
-typedef struct AspeedSoCClass {
+struct AspeedSoCClass {
     DeviceClass parent_class;
 
     const char *name;
@@ -79,7 +82,7 @@ typedef struct AspeedSoCClass {
     const int *irqmap;
     const hwaddr *memmap;
     uint32_t num_cpus;
-} AspeedSoCClass;
+};
 
 #define ASPEED_SOC_CLASS(klass)                                         \
     OBJECT_CLASS_CHECK(AspeedSoCClass, (klass), TYPE_ASPEED_SOC)
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 48a0ad1633..67f5a5f8f5 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -29,12 +29,14 @@
 #include "hw/timer/bcm2835_systmr.h"
 #include "hw/usb/hcd-dwc2.h"
 #include "hw/misc/unimp.h"
+#include "qom/object.h"
 
 #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
+typedef struct BCM2835PeripheralState BCM2835PeripheralState;
 #define BCM2835_PERIPHERALS(obj) \
     OBJECT_CHECK(BCM2835PeripheralState, (obj), TYPE_BCM2835_PERIPHERALS)
 
-typedef struct BCM2835PeripheralState {
+struct BCM2835PeripheralState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -70,6 +72,6 @@ typedef struct BCM2835PeripheralState {
     UnimplementedDeviceState smi;
     DWC2State dwc2;
     UnimplementedDeviceState sdramc;
-} BCM2835PeripheralState;
+};
 
 #endif /* BCM2835_PERIPHERALS_H */
diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index 79dfff9d73..cf22dc96a0 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -15,8 +15,11 @@
 #include "hw/arm/bcm2835_peripherals.h"
 #include "hw/intc/bcm2836_control.h"
 #include "target/arm/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_BCM283X "bcm283x"
+typedef struct BCM283XClass BCM283XClass;
+typedef struct BCM283XState BCM283XState;
 #define BCM283X(obj) OBJECT_CHECK(BCM283XState, (obj), TYPE_BCM283X)
 
 #define BCM283X_NCPUS 4
@@ -28,7 +31,7 @@
 #define TYPE_BCM2836 "bcm2836"
 #define TYPE_BCM2837 "bcm2837"
 
-typedef struct BCM283XState {
+struct BCM283XState {
     /*< private >*/
     DeviceState parent_obj;
     /*< public >*/
@@ -40,14 +43,14 @@ typedef struct BCM283XState {
     } cpu[BCM283X_NCPUS];
     BCM2836ControlState control;
     BCM2835PeripheralState peripherals;
-} BCM283XState;
+};
 
 typedef struct BCM283XInfo BCM283XInfo;
 
-typedef struct BCM283XClass {
+struct BCM283XClass {
     DeviceClass parent_class;
     const BCM283XInfo *info;
-} BCM283XClass;
+};
 
 #define BCM283X_CLASS(klass) \
     OBJECT_CLASS_CHECK(BCM283XClass, (klass), TYPE_BCM283X)
diff --git a/include/hw/arm/digic.h b/include/hw/arm/digic.h
index 63785baaa8..f77833f6e3 100644
--- a/include/hw/arm/digic.h
+++ b/include/hw/arm/digic.h
@@ -21,14 +21,16 @@
 #include "cpu.h"
 #include "hw/timer/digic-timer.h"
 #include "hw/char/digic-uart.h"
+#include "qom/object.h"
 
 #define TYPE_DIGIC "digic"
 
+typedef struct DigicState DigicState;
 #define DIGIC(obj) OBJECT_CHECK(DigicState, (obj), TYPE_DIGIC)
 
 #define DIGIC4_NB_TIMERS 3
 
-typedef struct DigicState {
+struct DigicState {
     /*< private >*/
     DeviceState parent_obj;
     /*< public >*/
@@ -37,6 +39,6 @@ typedef struct DigicState {
 
     DigicTimerState timer[DIGIC4_NB_TIMERS];
     DigicUartState uart;
-} DigicState;
+};
 
 #endif /* HW_ARM_DIGIC_H */
diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 55260394af..114c594cd2 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -27,6 +27,7 @@
 #include "hw/or-irq.h"
 #include "hw/sysbus.h"
 #include "target/arm/cpu-qom.h"
+#include "qom/object.h"
 
 #define EXYNOS4210_NCPUS                    2
 
@@ -85,7 +86,7 @@ typedef struct Exynos4210Irq {
     qemu_irq board_irqs[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
 } Exynos4210Irq;
 
-typedef struct Exynos4210State {
+struct Exynos4210State {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -101,7 +102,8 @@ typedef struct Exynos4210State {
     MemoryRegion bootreg_mem;
     I2CBus *i2c_if[EXYNOS4210_I2C_NUMBER];
     qemu_or_irq pl330_irq_orgate[EXYNOS4210_NUM_DMA];
-} Exynos4210State;
+};
+typedef struct Exynos4210State Exynos4210State;
 
 #define TYPE_EXYNOS4210_SOC "exynos4210"
 #define EXYNOS4210_SOC(obj) \
diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index 54ee1bfd78..8b4c974f09 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -32,8 +32,10 @@
 #include "hw/watchdog/wdt_imx2.h"
 #include "exec/memory.h"
 #include "target/arm/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_FSL_IMX25 "fsl,imx25"
+typedef struct FslIMX25State FslIMX25State;
 #define FSL_IMX25(obj) OBJECT_CHECK(FslIMX25State, (obj), TYPE_FSL_IMX25)
 
 #define FSL_IMX25_NUM_UARTS 5
@@ -44,7 +46,7 @@
 #define FSL_IMX25_NUM_ESDHCS 2
 #define FSL_IMX25_NUM_USBS 2
 
-typedef struct FslIMX25State {
+struct FslIMX25State {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -66,7 +68,7 @@ typedef struct FslIMX25State {
     MemoryRegion   iram;
     MemoryRegion   iram_alias;
     uint32_t       phy_num;
-} FslIMX25State;
+};
 
 /**
  * i.MX25 memory map
diff --git a/include/hw/arm/fsl-imx31.h b/include/hw/arm/fsl-imx31.h
index dd8561b309..12368f2c8f 100644
--- a/include/hw/arm/fsl-imx31.h
+++ b/include/hw/arm/fsl-imx31.h
@@ -28,8 +28,10 @@
 #include "hw/watchdog/wdt_imx2.h"
 #include "exec/memory.h"
 #include "target/arm/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_FSL_IMX31 "fsl,imx31"
+typedef struct FslIMX31State FslIMX31State;
 #define FSL_IMX31(obj) OBJECT_CHECK(FslIMX31State, (obj), TYPE_FSL_IMX31)
 
 #define FSL_IMX31_NUM_UARTS 2
@@ -37,7 +39,7 @@
 #define FSL_IMX31_NUM_I2CS 3
 #define FSL_IMX31_NUM_GPIOS 3
 
-typedef struct FslIMX31State {
+struct FslIMX31State {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -55,7 +57,7 @@ typedef struct FslIMX31State {
     MemoryRegion   rom;
     MemoryRegion   iram;
     MemoryRegion   iram_alias;
-} FslIMX31State;
+};
 
 #define FSL_IMX31_SECURE_ROM_ADDR       0x00000000
 #define FSL_IMX31_SECURE_ROM_SIZE       0x4000
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 162fe99375..e66ea1e917 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -34,8 +34,10 @@
 #include "hw/usb/imx-usb-phy.h"
 #include "exec/memory.h"
 #include "cpu.h"
+#include "qom/object.h"
 
 #define TYPE_FSL_IMX6 "fsl,imx6"
+typedef struct FslIMX6State FslIMX6State;
 #define FSL_IMX6(obj) OBJECT_CHECK(FslIMX6State, (obj), TYPE_FSL_IMX6)
 
 #define FSL_IMX6_NUM_CPUS 4
@@ -49,7 +51,7 @@
 #define FSL_IMX6_NUM_USB_PHYS 2
 #define FSL_IMX6_NUM_USBS 4
 
-typedef struct FslIMX6State {
+struct FslIMX6State {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -74,7 +76,7 @@ typedef struct FslIMX6State {
     MemoryRegion   ocram;
     MemoryRegion   ocram_alias;
     uint32_t       phy_num;
-} FslIMX6State;
+};
 
 
 #define FSL_IMX6_MMDC_ADDR 0x10000000
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index fcbaf3dc86..e95c4820c6 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -38,8 +38,10 @@
 #include "hw/usb/imx-usb-phy.h"
 #include "exec/memory.h"
 #include "cpu.h"
+#include "qom/object.h"
 
 #define TYPE_FSL_IMX6UL "fsl,imx6ul"
+typedef struct FslIMX6ULState FslIMX6ULState;
 #define FSL_IMX6UL(obj) OBJECT_CHECK(FslIMX6ULState, (obj), TYPE_FSL_IMX6UL)
 
 enum FslIMX6ULConfiguration {
@@ -60,7 +62,7 @@ enum FslIMX6ULConfiguration {
     FSL_IMX6UL_NUM_USBS         = 2,
 };
 
-typedef struct FslIMX6ULState {
+struct FslIMX6ULState {
     /*< private >*/
     DeviceState    parent_obj;
 
@@ -89,7 +91,7 @@ typedef struct FslIMX6ULState {
     MemoryRegion       ocram_alias;
 
     uint32_t           phy_num[FSL_IMX6UL_NUM_ETHS];
-} FslIMX6ULState;
+};
 
 enum FslIMX6ULMemoryMap {
     FSL_IMX6UL_MMDC_ADDR            = 0x80000000,
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index ad88923707..8095e5544b 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -39,8 +39,10 @@
 #include "hw/pci-host/designware.h"
 #include "hw/usb/chipidea.h"
 #include "cpu.h"
+#include "qom/object.h"
 
 #define TYPE_FSL_IMX7 "fsl,imx7"
+typedef struct FslIMX7State FslIMX7State;
 #define FSL_IMX7(obj) OBJECT_CHECK(FslIMX7State, (obj), TYPE_FSL_IMX7)
 
 enum FslIMX7Configuration {
@@ -59,7 +61,7 @@ enum FslIMX7Configuration {
     FSL_IMX7_NUM_ADCS         = 2,
 };
 
-typedef struct FslIMX7State {
+struct FslIMX7State {
     /*< private >*/
     DeviceState    parent_obj;
 
@@ -82,7 +84,7 @@ typedef struct FslIMX7State {
     ChipideaState      usb[FSL_IMX7_NUM_USBS];
     DesignwarePCIEHost pcie;
     uint32_t           phy_num[FSL_IMX7_NUM_ETHS];
-} FslIMX7State;
+};
 
 enum FslIMX7MemoryMap {
     FSL_IMX7_MMDC_ADDR            = 0x80000000,
diff --git a/include/hw/arm/linux-boot-if.h b/include/hw/arm/linux-boot-if.h
index 7bbdfd1cc6..6d9e13fd36 100644
--- a/include/hw/arm/linux-boot-if.h
+++ b/include/hw/arm/linux-boot-if.h
@@ -9,6 +9,7 @@
 #include "qom/object.h"
 
 #define TYPE_ARM_LINUX_BOOT_IF "arm-linux-boot-if"
+typedef struct ARMLinuxBootIfClass ARMLinuxBootIfClass;
 #define ARM_LINUX_BOOT_IF_CLASS(klass) \
     OBJECT_CLASS_CHECK(ARMLinuxBootIfClass, (klass), TYPE_ARM_LINUX_BOOT_IF)
 #define ARM_LINUX_BOOT_IF_GET_CLASS(obj) \
@@ -18,7 +19,7 @@
 
 typedef struct ARMLinuxBootIf ARMLinuxBootIf;
 
-typedef struct ARMLinuxBootIfClass {
+struct ARMLinuxBootIfClass {
     /*< private >*/
     InterfaceClass parent_class;
 
@@ -35,6 +36,6 @@ typedef struct ARMLinuxBootIfClass {
      * (or for a CPU which doesn't support TrustZone)
      */
     void (*arm_linux_init)(ARMLinuxBootIf *obj, bool secure_boot);
-} ARMLinuxBootIfClass;
+};
 
 #endif
diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index c9cb214aa6..b4bc5ef96a 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -30,8 +30,10 @@
 #include "hw/misc/msf2-sysreg.h"
 #include "hw/ssi/mss-spi.h"
 #include "hw/net/msf2-emac.h"
+#include "qom/object.h"
 
 #define TYPE_MSF2_SOC     "msf2-soc"
+typedef struct MSF2State MSF2State;
 #define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
 
 #define MSF2_NUM_SPIS         2
@@ -44,7 +46,7 @@
  */
 #define MSF2_NUM_TIMERS       2
 
-typedef struct MSF2State {
+struct MSF2State {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -64,6 +66,6 @@ typedef struct MSF2State {
     MSSTimerState timer;
     MSSSpiState spi[MSF2_NUM_SPIS];
     MSF2EmacState emac;
-} MSF2State;
+};
 
 #endif
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index 0cb78aafea..727ac1ae04 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -17,14 +17,16 @@
 #include "hw/gpio/nrf51_gpio.h"
 #include "hw/nvram/nrf51_nvm.h"
 #include "hw/timer/nrf51_timer.h"
+#include "qom/object.h"
 
 #define TYPE_NRF51_SOC "nrf51-soc"
+typedef struct NRF51State NRF51State;
 #define NRF51_SOC(obj) \
     OBJECT_CHECK(NRF51State, (obj), TYPE_NRF51_SOC)
 
 #define NRF51_NUM_TIMERS 3
 
-typedef struct NRF51State {
+struct NRF51State {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -50,6 +52,6 @@ typedef struct NRF51State {
 
     MemoryRegion container;
 
-} NRF51State;
+};
 
 #endif
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 6be386d0e2..0d365edeec 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -24,6 +24,7 @@
 #include "hw/input/tsc2xxx.h"
 #include "target/arm/cpu-qom.h"
 #include "qemu/log.h"
+#include "qom/object.h"
 
 # define OMAP_EMIFS_BASE	0x00000000
 # define OMAP2_Q0_BASE		0x00000000
@@ -69,10 +70,10 @@ void omap_clk_reparent(omap_clk clk, omap_clk parent);
 
 /* omap_intc.c */
 #define TYPE_OMAP_INTC "common-omap-intc"
+typedef struct omap_intr_handler_s omap_intr_handler;
 #define OMAP_INTC(obj)                                              \
     OBJECT_CHECK(omap_intr_handler, (obj), TYPE_OMAP_INTC)
 
-typedef struct omap_intr_handler_s omap_intr_handler;
 
 /*
  * TODO: Ideally we should have a clock framework that
@@ -93,9 +94,9 @@ void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
 
 /* omap_i2c.c */
 #define TYPE_OMAP_I2C "omap_i2c"
+typedef struct OMAPI2CState OMAPI2CState;
 #define OMAP_I2C(obj) OBJECT_CHECK(OMAPI2CState, (obj), TYPE_OMAP_I2C)
 
-typedef struct OMAPI2CState OMAPI2CState;
 
 /* TODO: clock framework (see above) */
 void omap_i2c_set_iclk(OMAPI2CState *i2c, omap_clk clk);
diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index 09c1336071..b2f9a41468 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -13,6 +13,7 @@
 #include "exec/memory.h"
 #include "target/arm/cpu-qom.h"
 #include "hw/pcmcia.h"
+#include "qom/object.h"
 
 /* Interrupt numbers */
 # define PXA2XX_PIC_SSP3	0
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 880dccd7c0..b6b51a1cb1 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -21,6 +21,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/pci/pci.h"
+#include "qom/object.h"
 
 #define SMMU_PCI_BUS_MAX      256
 #define SMMU_PCI_DEVFN_MAX    256
@@ -102,7 +103,7 @@ typedef struct SMMUIOTLBKey {
     uint8_t level;
 } SMMUIOTLBKey;
 
-typedef struct SMMUState {
+struct SMMUState {
     /* <private> */
     SysBusDevice  dev;
     const char *mrtypename;
@@ -116,9 +117,10 @@ typedef struct SMMUState {
     QLIST_HEAD(, SMMUDevice) devices_with_notifiers;
     uint8_t bus_num;
     PCIBus *primary_bus;
-} SMMUState;
+};
+typedef struct SMMUState SMMUState;
 
-typedef struct {
+struct SMMUBaseClass {
     /* <private> */
     SysBusDeviceClass parent_class;
 
@@ -126,7 +128,8 @@ typedef struct {
 
     DeviceRealize parent_realize;
 
-} SMMUBaseClass;
+};
+typedef struct SMMUBaseClass SMMUBaseClass;
 
 #define TYPE_ARM_SMMU "arm-smmu"
 #define ARM_SMMU(obj) OBJECT_CHECK(SMMUState, (obj), TYPE_ARM_SMMU)
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index 68d7a963e0..698b89d234 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -21,6 +21,7 @@
 
 #include "hw/arm/smmu-common.h"
 #include "hw/registerfields.h"
+#include "qom/object.h"
 
 #define TYPE_SMMUV3_IOMMU_MEMORY_REGION "smmuv3-iommu-memory-region"
 
@@ -32,7 +33,7 @@ typedef struct SMMUQueue {
      uint8_t log2size;
 } SMMUQueue;
 
-typedef struct SMMUv3State {
+struct SMMUv3State {
     SMMUState     smmu_state;
 
     uint32_t features;
@@ -61,7 +62,8 @@ typedef struct SMMUv3State {
 
     qemu_irq     irq[4];
     QemuMutex mutex;
-} SMMUv3State;
+};
+typedef struct SMMUv3State SMMUv3State;
 
 typedef enum {
     SMMU_IRQ_EVTQ,
@@ -70,14 +72,15 @@ typedef enum {
     SMMU_IRQ_GERROR,
 } SMMUIrq;
 
-typedef struct {
+struct SMMUv3Class {
     /*< private >*/
     SMMUBaseClass smmu_base_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
     DeviceReset   parent_reset;
-} SMMUv3Class;
+};
+typedef struct SMMUv3Class SMMUv3Class;
 
 #define TYPE_ARM_SMMUV3   "arm-smmuv3"
 #define ARM_SMMUV3(obj) OBJECT_CHECK(SMMUv3State, (obj), TYPE_ARM_SMMUV3)
diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
index 922a733f88..6d86937e07 100644
--- a/include/hw/arm/stm32f205_soc.h
+++ b/include/hw/arm/stm32f205_soc.h
@@ -32,8 +32,10 @@
 #include "hw/or-irq.h"
 #include "hw/ssi/stm32f2xx_spi.h"
 #include "hw/arm/armv7m.h"
+#include "qom/object.h"
 
 #define TYPE_STM32F205_SOC "stm32f205-soc"
+typedef struct STM32F205State STM32F205State;
 #define STM32F205_SOC(obj) \
     OBJECT_CHECK(STM32F205State, (obj), TYPE_STM32F205_SOC)
 
@@ -47,7 +49,7 @@
 #define SRAM_BASE_ADDRESS 0x20000000
 #define SRAM_SIZE (128 * 1024)
 
-typedef struct STM32F205State {
+struct STM32F205State {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -63,6 +65,6 @@ typedef struct STM32F205State {
     STM32F2XXSPIState spi[STM_NUM_SPIS];
 
     qemu_or_irq *adc_irqs;
-} STM32F205State;
+};
 
 #endif
diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
index 1fe97f8c3a..8f44fb2046 100644
--- a/include/hw/arm/stm32f405_soc.h
+++ b/include/hw/arm/stm32f405_soc.h
@@ -33,8 +33,10 @@
 #include "hw/or-irq.h"
 #include "hw/ssi/stm32f2xx_spi.h"
 #include "hw/arm/armv7m.h"
+#include "qom/object.h"
 
 #define TYPE_STM32F405_SOC "stm32f405-soc"
+typedef struct STM32F405State STM32F405State;
 #define STM32F405_SOC(obj) \
     OBJECT_CHECK(STM32F405State, (obj), TYPE_STM32F405_SOC)
 
@@ -48,7 +50,7 @@
 #define SRAM_BASE_ADDRESS 0x20000000
 #define SRAM_SIZE (192 * 1024)
 
-typedef struct STM32F405State {
+struct STM32F405State {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -68,6 +70,6 @@ typedef struct STM32F405State {
     MemoryRegion sram;
     MemoryRegion flash;
     MemoryRegion flash_alias;
-} STM32F405State;
+};
 
 #endif
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index dff67e1bef..49ad860943 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -37,6 +37,7 @@
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "qom/object.h"
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
@@ -115,7 +116,7 @@ typedef struct MemMapEntry {
     hwaddr size;
 } MemMapEntry;
 
-typedef struct {
+struct VirtMachineClass {
     MachineClass parent;
     bool disallow_affinity_adjustment;
     bool no_its;
@@ -126,9 +127,10 @@ typedef struct {
     bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
     bool kvm_no_adjvtime;
     bool acpi_expose_flash;
-} VirtMachineClass;
+};
+typedef struct VirtMachineClass VirtMachineClass;
 
-typedef struct {
+struct VirtMachineState {
     MachineState parent;
     Notifier machine_done;
     DeviceState *platform_bus_dev;
@@ -162,7 +164,8 @@ typedef struct {
     DeviceState *gic;
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
-} VirtMachineState;
+};
+typedef struct VirtMachineState VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 9c9f47ba9d..a960619ec9 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -20,8 +20,10 @@
 #include "hw/dma/xlnx-zdma.h"
 #include "hw/net/cadence_gem.h"
 #include "hw/rtc/xlnx-zynqmp-rtc.h"
+#include "qom/object.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
+typedef struct Versal Versal;
 #define XLNX_VERSAL(obj) OBJECT_CHECK(Versal, (obj), TYPE_XLNX_VERSAL)
 
 #define XLNX_VERSAL_NR_ACPUS   2
@@ -31,7 +33,7 @@
 #define XLNX_VERSAL_NR_SDS     2
 #define XLNX_VERSAL_NR_IRQS    192
 
-typedef struct Versal {
+struct Versal {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -74,7 +76,7 @@ typedef struct Versal {
         MemoryRegion *mr_ddr;
         uint32_t psci_conduit;
     } cfg;
-} Versal;
+};
 
 /* Memory-map and IRQ definitions. Copied a subset from
  * auto-generated files.  */
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 53076fa29a..6a24216abf 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -32,8 +32,10 @@
 #include "hw/rtc/xlnx-zynqmp-rtc.h"
 #include "hw/cpu/cluster.h"
 #include "target/arm/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
+typedef struct XlnxZynqMPState XlnxZynqMPState;
 #define XLNX_ZYNQMP(obj) OBJECT_CHECK(XlnxZynqMPState, (obj), \
                                        TYPE_XLNX_ZYNQMP)
 
@@ -73,7 +75,7 @@
 #define XLNX_ZYNQMP_MAX_RAM_SIZE (XLNX_ZYNQMP_MAX_LOW_RAM_SIZE + \
                                   XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE)
 
-typedef struct XlnxZynqMPState {
+struct XlnxZynqMPState {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -112,6 +114,6 @@ typedef struct XlnxZynqMPState {
     bool virt;
     /* Has the RPU subsystem?  */
     bool has_rpu;
-}  XlnxZynqMPState;
+};
 
 #endif
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 2136a2d5e4..9b2fa7e92c 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -4,14 +4,15 @@
 /* NOR flash devices */
 
 #include "exec/hwaddr.h"
+#include "qom/object.h"
 
 /* pflash_cfi01.c */
 
 #define TYPE_PFLASH_CFI01 "cfi.pflash01"
+typedef struct PFlashCFI01 PFlashCFI01;
 #define PFLASH_CFI01(obj) \
     OBJECT_CHECK(PFlashCFI01, (obj), TYPE_PFLASH_CFI01)
 
-typedef struct PFlashCFI01 PFlashCFI01;
 
 PFlashCFI01 *pflash_cfi01_register(hwaddr base,
                                    const char *name,
@@ -29,10 +30,10 @@ void pflash_cfi01_legacy_drive(PFlashCFI01 *dev, DriveInfo *dinfo);
 /* pflash_cfi02.c */
 
 #define TYPE_PFLASH_CFI02 "cfi.pflash02"
+typedef struct PFlashCFI02 PFlashCFI02;
 #define PFLASH_CFI02(obj) \
     OBJECT_CHECK(PFlashCFI02, (obj), TYPE_PFLASH_CFI02)
 
-typedef struct PFlashCFI02 PFlashCFI02;
 
 PFlashCFI02 *pflash_cfi02_register(hwaddr base,
                                    const char *name,
diff --git a/include/hw/char/avr_usart.h b/include/hw/char/avr_usart.h
index 5739aaf26f..67ad345edd 100644
--- a/include/hw/char/avr_usart.h
+++ b/include/hw/char/avr_usart.h
@@ -25,6 +25,7 @@
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
 #include "hw/hw.h"
+#include "qom/object.h"
 
 /* Offsets of registers. */
 #define USART_DR   0x06
@@ -57,10 +58,11 @@
 #define USART_CSRC_CSZ0   (1 << 1)
 
 #define TYPE_AVR_USART "avr-usart"
+typedef struct AVRUsartState AVRUsartState;
 #define AVR_USART(obj) \
     OBJECT_CHECK(AVRUsartState, (obj), TYPE_AVR_USART)
 
-typedef struct {
+struct AVRUsartState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -88,6 +90,6 @@ typedef struct {
     qemu_irq txc_irq;
     /* Data Register Empty */
     qemu_irq dre_irq;
-} AVRUsartState;
+};
 
 #endif /* HW_CHAR_AVR_USART_H */
diff --git a/include/hw/char/bcm2835_aux.h b/include/hw/char/bcm2835_aux.h
index 934acf9c81..2647becc52 100644
--- a/include/hw/char/bcm2835_aux.h
+++ b/include/hw/char/bcm2835_aux.h
@@ -11,13 +11,15 @@
 
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
+#include "qom/object.h"
 
 #define TYPE_BCM2835_AUX "bcm2835-aux"
+typedef struct BCM2835AuxState BCM2835AuxState;
 #define BCM2835_AUX(obj) OBJECT_CHECK(BCM2835AuxState, (obj), TYPE_BCM2835_AUX)
 
 #define BCM2835_AUX_RX_FIFO_LEN 8
 
-typedef struct {
+struct BCM2835AuxState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -29,6 +31,6 @@ typedef struct {
     uint8_t read_fifo[BCM2835_AUX_RX_FIFO_LEN];
     uint8_t read_pos, read_count;
     uint8_t ier, iir;
-} BCM2835AuxState;
+};
 
 #endif
diff --git a/include/hw/char/cadence_uart.h b/include/hw/char/cadence_uart.h
index ed7b58d31d..3918ee8136 100644
--- a/include/hw/char/cadence_uart.h
+++ b/include/hw/char/cadence_uart.h
@@ -24,6 +24,7 @@
 #include "chardev/char-fe.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 
 #define CADENCE_UART_RX_FIFO_SIZE           16
 #define CADENCE_UART_TX_FIFO_SIZE           16
@@ -31,10 +32,11 @@
 #define CADENCE_UART_R_MAX (0x48/4)
 
 #define TYPE_CADENCE_UART "cadence_uart"
+typedef struct CadenceUARTState CadenceUARTState;
 #define CADENCE_UART(obj) OBJECT_CHECK(CadenceUARTState, (obj), \
                                        TYPE_CADENCE_UART)
 
-typedef struct {
+struct CadenceUARTState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -51,7 +53,7 @@ typedef struct {
     qemu_irq irq;
     QEMUTimer *fifo_trigger_handle;
     Clock *refclk;
-} CadenceUARTState;
+};
 
 static inline DeviceState *cadence_uart_create(hwaddr addr,
                                         qemu_irq irq,
diff --git a/include/hw/char/cmsdk-apb-uart.h b/include/hw/char/cmsdk-apb-uart.h
index bc9069f9fd..32c0df9df3 100644
--- a/include/hw/char/cmsdk-apb-uart.h
+++ b/include/hw/char/cmsdk-apb-uart.h
@@ -15,12 +15,14 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
+#include "qom/object.h"
 
 #define TYPE_CMSDK_APB_UART "cmsdk-apb-uart"
+typedef struct CMSDKAPBUART CMSDKAPBUART;
 #define CMSDK_APB_UART(obj) OBJECT_CHECK(CMSDKAPBUART, (obj), \
                                          TYPE_CMSDK_APB_UART)
 
-typedef struct {
+struct CMSDKAPBUART {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -42,7 +44,7 @@ typedef struct {
     /* This UART has no FIFO, only a 1-character buffer for each of Tx and Rx */
     uint8_t txbuf;
     uint8_t rxbuf;
-} CMSDKAPBUART;
+};
 
 /**
  * cmsdk_apb_uart_create - convenience function to create TYPE_CMSDK_APB_UART
diff --git a/include/hw/char/digic-uart.h b/include/hw/char/digic-uart.h
index de9a3e3551..7c6ec2a5c5 100644
--- a/include/hw/char/digic-uart.h
+++ b/include/hw/char/digic-uart.h
@@ -20,8 +20,10 @@
 
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
+#include "qom/object.h"
 
 #define TYPE_DIGIC_UART "digic-uart"
+typedef struct DigicUartState DigicUartState;
 #define DIGIC_UART(obj) \
     OBJECT_CHECK(DigicUartState, (obj), TYPE_DIGIC_UART)
 
@@ -32,7 +34,7 @@ enum {
     R_MAX
 };
 
-typedef struct DigicUartState {
+struct DigicUartState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -42,6 +44,6 @@ typedef struct DigicUartState {
 
     uint32_t reg_rx;
     uint32_t reg_st;
-} DigicUartState;
+};
 
 #endif /* HW_CHAR_DIGIC_UART_H */
diff --git a/include/hw/char/escc.h b/include/hw/char/escc.h
index 794b653484..5de2a39e77 100644
--- a/include/hw/char/escc.h
+++ b/include/hw/char/escc.h
@@ -5,11 +5,13 @@
 #include "chardev/char-serial.h"
 #include "hw/sysbus.h"
 #include "ui/input.h"
+#include "qom/object.h"
 
 /* escc.c */
 #define TYPE_ESCC "escc"
 #define ESCC_SIZE 4
 
+typedef struct ESCCState ESCCState;
 #define ESCC(obj) OBJECT_CHECK(ESCCState, (obj), TYPE_ESCC)
 
 typedef enum {
@@ -46,7 +48,7 @@ typedef struct ESCCChannelState {
     QemuInputHandlerState *hs;
 } ESCCChannelState;
 
-typedef struct ESCCState {
+struct ESCCState {
     SysBusDevice parent_obj;
 
     struct ESCCChannelState chn[2];
@@ -55,6 +57,6 @@ typedef struct ESCCState {
     MemoryRegion mmio;
     uint32_t disabled;
     uint32_t frequency;
-} ESCCState;
+};
 
 #endif
diff --git a/include/hw/char/ibex_uart.h b/include/hw/char/ibex_uart.h
index b6bd5a6700..ec9fcde8f0 100644
--- a/include/hw/char/ibex_uart.h
+++ b/include/hw/char/ibex_uart.h
@@ -29,6 +29,7 @@
 #include "hw/registerfields.h"
 #include "chardev/char-fe.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 
 REG32(INTR_STATE, 0x00)
     FIELD(INTR_STATE, TX_WATERMARK, 0, 1)
@@ -69,10 +70,11 @@ REG32(TIMEOUT_CTRL, 0x2c)
 #define IBEX_UART_CLOCK 50000000 /* 50MHz clock */
 
 #define TYPE_IBEX_UART "ibex-uart"
+typedef struct IbexUartState IbexUartState;
 #define IBEX_UART(obj) \
     OBJECT_CHECK(IbexUartState, (obj), TYPE_IBEX_UART)
 
-typedef struct {
+struct IbexUartState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -103,5 +105,5 @@ typedef struct {
     qemu_irq rx_watermark;
     qemu_irq tx_empty;
     qemu_irq rx_overflow;
-} IbexUartState;
+};
 #endif /* HW_IBEX_UART_H */
diff --git a/include/hw/char/imx_serial.h b/include/hw/char/imx_serial.h
index c8b74284f8..bfaf8ec695 100644
--- a/include/hw/char/imx_serial.h
+++ b/include/hw/char/imx_serial.h
@@ -20,8 +20,10 @@
 
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
+#include "qom/object.h"
 
 #define TYPE_IMX_SERIAL "imx.serial"
+typedef struct IMXSerialState IMXSerialState;
 #define IMX_SERIAL(obj) OBJECT_CHECK(IMXSerialState, (obj), TYPE_IMX_SERIAL)
 
 #define URXD_CHARRDY    (1<<15)   /* character read is valid */
@@ -76,7 +78,7 @@
 #define UTS1_TXFULL     (1<<4)
 #define UTS1_RXFULL     (1<<3)
 
-typedef struct IMXSerialState {
+struct IMXSerialState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -103,6 +105,6 @@ typedef struct IMXSerialState {
 
     qemu_irq irq;
     CharBackend chr;
-} IMXSerialState;
+};
 
 #endif
diff --git a/include/hw/char/nrf51_uart.h b/include/hw/char/nrf51_uart.h
index eb1c15b490..20560ba6dc 100644
--- a/include/hw/char/nrf51_uart.h
+++ b/include/hw/char/nrf51_uart.h
@@ -14,11 +14,13 @@
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
 #include "hw/registerfields.h"
+#include "qom/object.h"
 
 #define UART_FIFO_LENGTH 6
 #define UART_SIZE 0x1000
 
 #define TYPE_NRF51_UART "nrf51_soc.uart"
+typedef struct NRF51UARTState NRF51UARTState;
 #define NRF51_UART(obj) OBJECT_CHECK(NRF51UARTState, (obj), TYPE_NRF51_UART)
 
 REG32(UART_STARTRX, 0x000)
@@ -54,7 +56,7 @@ REG32(UART_TXD, 0x51C)
 REG32(UART_BAUDRATE, 0x524)
 REG32(UART_CONFIG, 0x56C)
 
-typedef struct NRF51UARTState {
+struct NRF51UARTState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -72,6 +74,6 @@ typedef struct NRF51UARTState {
     bool tx_started;
     bool pending_tx_byte;
     bool enabled;
-} NRF51UARTState;
+};
 
 #endif
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index bed758350f..ddbd8ad45b 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -19,14 +19,16 @@
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 
 #define TYPE_PL011 "pl011"
+typedef struct PL011State PL011State;
 #define PL011(obj) OBJECT_CHECK(PL011State, (obj), TYPE_PL011)
 
 /* This shares the same struct (and cast macro) as the base pl011 device */
 #define TYPE_PL011_LUMINARY "pl011_luminary"
 
-typedef struct PL011State {
+struct PL011State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -49,7 +51,7 @@ typedef struct PL011State {
     CharBackend chr;
     qemu_irq irq[6];
     const unsigned char *id;
-} PL011State;
+};
 
 static inline DeviceState *pl011_create(hwaddr addr,
                                         qemu_irq irq,
diff --git a/include/hw/char/renesas_sci.h b/include/hw/char/renesas_sci.h
index efdebc620a..5a5ebfd28c 100644
--- a/include/hw/char/renesas_sci.h
+++ b/include/hw/char/renesas_sci.h
@@ -11,8 +11,10 @@
 
 #include "chardev/char-fe.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_RENESAS_SCI "renesas-sci"
+typedef struct RSCIState RSCIState;
 #define RSCI(obj) OBJECT_CHECK(RSCIState, (obj), TYPE_RENESAS_SCI)
 
 enum {
@@ -23,7 +25,7 @@ enum {
     SCI_NR_IRQ = 4
 };
 
-typedef struct {
+struct RSCIState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -46,6 +48,6 @@ typedef struct {
     int64_t trtime;
     int64_t rx_next;
     uint64_t input_freq;
-} RSCIState;
+};
 
 #endif
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 535fa23a2b..dbeef43676 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -31,10 +31,11 @@
 #include "qemu/fifo8.h"
 #include "chardev/char.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define UART_FIFO_LENGTH    16      /* 16550A Fifo Length */
 
-typedef struct SerialState {
+struct SerialState {
     DeviceState parent;
 
     uint16_t divider;
@@ -77,22 +78,25 @@ typedef struct SerialState {
 
     QEMUTimer *modem_status_poll;
     MemoryRegion io;
-} SerialState;
+};
+typedef struct SerialState SerialState;
 
-typedef struct SerialMM {
+struct SerialMM {
     SysBusDevice parent;
 
     SerialState serial;
 
     uint8_t regshift;
     uint8_t endianness;
-} SerialMM;
+};
+typedef struct SerialMM SerialMM;
 
-typedef struct SerialIO {
+struct SerialIO {
     SysBusDevice parent;
 
     SerialState serial;
-} SerialIO;
+};
+typedef struct SerialIO SerialIO;
 
 extern const VMStateDescription vmstate_serial;
 extern const MemoryRegionOps serial_io_ops;
diff --git a/include/hw/char/stm32f2xx_usart.h b/include/hw/char/stm32f2xx_usart.h
index 8e112671e3..c44faca751 100644
--- a/include/hw/char/stm32f2xx_usart.h
+++ b/include/hw/char/stm32f2xx_usart.h
@@ -27,6 +27,7 @@
 
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
+#include "qom/object.h"
 
 #define USART_SR   0x00
 #define USART_DR   0x04
@@ -53,10 +54,11 @@
 #define USART_CR1_RE  (1 << 2)
 
 #define TYPE_STM32F2XX_USART "stm32f2xx-usart"
+typedef struct STM32F2XXUsartState STM32F2XXUsartState;
 #define STM32F2XX_USART(obj) \
     OBJECT_CHECK(STM32F2XXUsartState, (obj), TYPE_STM32F2XX_USART)
 
-typedef struct {
+struct STM32F2XXUsartState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -73,5 +75,5 @@ typedef struct {
 
     CharBackend chr;
     qemu_irq irq;
-} STM32F2XXUsartState;
+};
 #endif /* HW_STM32F2XX_USART_H */
diff --git a/include/hw/clock.h b/include/hw/clock.h
index f822a94220..cde89b3ef4 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -18,6 +18,7 @@
 #include "qemu/queue.h"
 
 #define TYPE_CLOCK "clock"
+typedef struct Clock Clock;
 #define CLOCK(obj) OBJECT_CHECK(Clock, (obj), TYPE_CLOCK)
 
 typedef void ClockCallback(void *opaque);
@@ -54,7 +55,6 @@ typedef void ClockCallback(void *opaque);
  * @sibling: structure used to form a clock list
  */
 
-typedef struct Clock Clock;
 
 struct Clock {
     /*< private >*/
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8f145733ce..5f319b9d22 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -30,6 +30,7 @@
 #include "qemu/queue.h"
 #include "qemu/thread.h"
 #include "qemu/plugin.h"
+#include "qom/object.h"
 
 typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
                                      void *opaque);
@@ -61,6 +62,7 @@ typedef uint64_t vaddr;
  */
 #define CPU(obj) ((CPUState *)(obj))
 
+typedef struct CPUClass CPUClass;
 #define CPU_CLASS(class) OBJECT_CLASS_CHECK(CPUClass, (class), TYPE_CPU)
 #define CPU_GET_CLASS(obj) OBJECT_GET_CLASS(CPUClass, (obj), TYPE_CPU)
 
@@ -156,7 +158,7 @@ struct TranslationBlock;
  *
  * Represents a CPU family or model.
  */
-typedef struct CPUClass {
+struct CPUClass {
     /*< private >*/
     DeviceClass parent_class;
     /*< public >*/
@@ -222,7 +224,7 @@ typedef struct CPUClass {
     /* Keep non-pointer data at the end to minimize holes.  */
     int gdb_num_core_regs;
     bool gdb_stop_before_watchpoint;
-} CPUClass;
+};
 
 /*
  * Low 16 bits: number of cycles left, used only in icount mode.
diff --git a/include/hw/core/generic-loader.h b/include/hw/core/generic-loader.h
index 9ffce1c5a3..f435af1884 100644
--- a/include/hw/core/generic-loader.h
+++ b/include/hw/core/generic-loader.h
@@ -20,8 +20,9 @@
 
 #include "elf.h"
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
-typedef struct GenericLoaderState {
+struct GenericLoaderState {
     /* <private> */
     DeviceState parent_obj;
 
@@ -38,7 +39,8 @@ typedef struct GenericLoaderState {
     bool force_raw;
     bool data_be;
     bool set_pc;
-} GenericLoaderState;
+};
+typedef struct GenericLoaderState GenericLoaderState;
 
 #define TYPE_GENERIC_LOADER "loader"
 #define GENERIC_LOADER(obj) OBJECT_CHECK(GenericLoaderState, (obj), \
diff --git a/include/hw/cpu/a15mpcore.h b/include/hw/cpu/a15mpcore.h
index b423533d20..01415728d0 100644
--- a/include/hw/cpu/a15mpcore.h
+++ b/include/hw/cpu/a15mpcore.h
@@ -22,14 +22,16 @@
 
 #include "hw/sysbus.h"
 #include "hw/intc/arm_gic.h"
+#include "qom/object.h"
 
 /* A15MP private memory region.  */
 
 #define TYPE_A15MPCORE_PRIV "a15mpcore_priv"
+typedef struct A15MPPrivState A15MPPrivState;
 #define A15MPCORE_PRIV(obj) \
     OBJECT_CHECK(A15MPPrivState, (obj), TYPE_A15MPCORE_PRIV)
 
-typedef struct A15MPPrivState {
+struct A15MPPrivState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -39,6 +41,6 @@ typedef struct A15MPPrivState {
     MemoryRegion container;
 
     GICState gic;
-} A15MPPrivState;
+};
 
 #endif
diff --git a/include/hw/cpu/a9mpcore.h b/include/hw/cpu/a9mpcore.h
index 5d67ca22c4..1a3b32cc4c 100644
--- a/include/hw/cpu/a9mpcore.h
+++ b/include/hw/cpu/a9mpcore.h
@@ -15,12 +15,14 @@
 #include "hw/misc/a9scu.h"
 #include "hw/timer/arm_mptimer.h"
 #include "hw/timer/a9gtimer.h"
+#include "qom/object.h"
 
 #define TYPE_A9MPCORE_PRIV "a9mpcore_priv"
+typedef struct A9MPPrivState A9MPPrivState;
 #define A9MPCORE_PRIV(obj) \
     OBJECT_CHECK(A9MPPrivState, (obj), TYPE_A9MPCORE_PRIV)
 
-typedef struct A9MPPrivState {
+struct A9MPPrivState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -34,6 +36,6 @@ typedef struct A9MPPrivState {
     A9GTimerState gtimer;
     ARMMPTimerState mptimer;
     ARMMPTimerState wdt;
-} A9MPPrivState;
+};
 
 #endif
diff --git a/include/hw/cpu/arm11mpcore.h b/include/hw/cpu/arm11mpcore.h
index 6196109ca2..5a5575b86d 100644
--- a/include/hw/cpu/arm11mpcore.h
+++ b/include/hw/cpu/arm11mpcore.h
@@ -14,12 +14,14 @@
 #include "hw/misc/arm11scu.h"
 #include "hw/intc/arm_gic.h"
 #include "hw/timer/arm_mptimer.h"
+#include "qom/object.h"
 
 #define TYPE_ARM11MPCORE_PRIV "arm11mpcore_priv"
+typedef struct ARM11MPCorePriveState ARM11MPCorePriveState;
 #define ARM11MPCORE_PRIV(obj) \
     OBJECT_CHECK(ARM11MPCorePriveState, (obj), TYPE_ARM11MPCORE_PRIV)
 
-typedef struct ARM11MPCorePriveState {
+struct ARM11MPCorePriveState {
     SysBusDevice parent_obj;
 
     uint32_t num_cpu;
@@ -30,6 +32,6 @@ typedef struct ARM11MPCorePriveState {
     GICState gic;
     ARMMPTimerState mptimer;
     ARMMPTimerState wdtimer;
-} ARM11MPCorePriveState;
+};
 
 #endif
diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index a616501a55..faacf9757e 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -21,6 +21,7 @@
 #define HW_CPU_CLUSTER_H
 
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 /*
  * CPU Cluster type
@@ -54,6 +55,7 @@
  */
 
 #define TYPE_CPU_CLUSTER "cpu-cluster"
+typedef struct CPUClusterState CPUClusterState;
 #define CPU_CLUSTER(obj) \
     OBJECT_CHECK(CPUClusterState, (obj), TYPE_CPU_CLUSTER)
 
@@ -70,12 +72,12 @@
  *
  * State of a CPU cluster.
  */
-typedef struct CPUClusterState {
+struct CPUClusterState {
     /*< private >*/
     DeviceState parent_obj;
 
     /*< public >*/
     uint32_t cluster_id;
-} CPUClusterState;
+};
 
 #endif
diff --git a/include/hw/cpu/core.h b/include/hw/cpu/core.h
index 555ad831bb..850191527e 100644
--- a/include/hw/cpu/core.h
+++ b/include/hw/cpu/core.h
@@ -10,20 +10,22 @@
 #define HW_CPU_CORE_H
 
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 #define TYPE_CPU_CORE "cpu-core"
 
+typedef struct CPUCore CPUCore;
 #define CPU_CORE(obj) \
     OBJECT_CHECK(CPUCore, (obj), TYPE_CPU_CORE)
 
-typedef struct CPUCore {
+struct CPUCore {
     /*< private >*/
     DeviceState parent_obj;
 
     /*< public >*/
     int core_id;
     int nr_threads;
-} CPUCore;
+};
 
 /* Note: topology field names need to be kept in sync with
  * 'CpuInstanceProperties' */
diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_fb.h
index 2246be74d8..5fc4d74a06 100644
--- a/include/hw/display/bcm2835_fb.h
+++ b/include/hw/display/bcm2835_fb.h
@@ -14,8 +14,10 @@
 
 #include "hw/sysbus.h"
 #include "ui/console.h"
+#include "qom/object.h"
 
 #define TYPE_BCM2835_FB "bcm2835-fb"
+typedef struct BCM2835FBState BCM2835FBState;
 #define BCM2835_FB(obj) OBJECT_CHECK(BCM2835FBState, (obj), TYPE_BCM2835_FB)
 
 /*
@@ -32,7 +34,7 @@ typedef struct {
     uint32_t alpha;
 } BCM2835FBConfig;
 
-typedef struct {
+struct BCM2835FBState {
     /*< private >*/
     SysBusDevice busdev;
     /*< public >*/
@@ -49,7 +51,7 @@ typedef struct {
 
     BCM2835FBConfig config;
     BCM2835FBConfig initial_config;
-} BCM2835FBState;
+};
 
 void bcm2835_fb_reconfigure(BCM2835FBState *s, BCM2835FBConfig *newconfig);
 
diff --git a/include/hw/display/dpcd.h b/include/hw/display/dpcd.h
index 6880ee36a3..6b96a463a7 100644
--- a/include/hw/display/dpcd.h
+++ b/include/hw/display/dpcd.h
@@ -24,6 +24,7 @@
 
 #ifndef DPCD_H
 #define DPCD_H
+#include "qom/object.h"
 
 typedef struct DPCDState DPCDState;
 
diff --git a/include/hw/display/i2c-ddc.h b/include/hw/display/i2c-ddc.h
index 1cf53a0c8d..8ab50641aa 100644
--- a/include/hw/display/i2c-ddc.h
+++ b/include/hw/display/i2c-ddc.h
@@ -21,6 +21,7 @@
 
 #include "hw/display/edid.h"
 #include "hw/i2c/i2c.h"
+#include "qom/object.h"
 
 /* A simple I2C slave which just returns the contents of its EDID blob. */
 struct I2CDDCState {
diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index ab0dd250cc..f76bde2e77 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -34,6 +34,7 @@
 #include "qemu/units.h"
 #include "hw/dma/xlnx_dpdma.h"
 #include "audio/audio.h"
+#include "qom/object.h"
 
 #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
 #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
@@ -48,7 +49,7 @@ struct PixmanPlane {
     DisplaySurface *surface;
 };
 
-typedef struct XlnxDPState {
+struct XlnxDPState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -101,7 +102,8 @@ typedef struct XlnxDPState {
      */
     DPCDState *dpcd;
     I2CDDCState *edid;
-} XlnxDPState;
+};
+typedef struct XlnxDPState XlnxDPState;
 
 #define TYPE_XLNX_DP "xlnx.v-dp"
 #define XLNX_DP(obj) OBJECT_CHECK(XlnxDPState, (obj), TYPE_XLNX_DP)
diff --git a/include/hw/dma/bcm2835_dma.h b/include/hw/dma/bcm2835_dma.h
index a6747842b7..31f335ec5b 100644
--- a/include/hw/dma/bcm2835_dma.h
+++ b/include/hw/dma/bcm2835_dma.h
@@ -9,6 +9,7 @@
 #define BCM2835_DMA_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 typedef struct {
     uint32_t cs;
@@ -25,12 +26,13 @@ typedef struct {
 } BCM2835DMAChan;
 
 #define TYPE_BCM2835_DMA "bcm2835-dma"
+typedef struct BCM2835DMAState BCM2835DMAState;
 #define BCM2835_DMA(obj) \
         OBJECT_CHECK(BCM2835DMAState, (obj), TYPE_BCM2835_DMA)
 
 #define BCM2835_DMA_NCHANS 16
 
-typedef struct {
+struct BCM2835DMAState {
     /*< private >*/
     SysBusDevice busdev;
     /*< public >*/
@@ -42,6 +44,6 @@ typedef struct {
     BCM2835DMAChan chan[BCM2835_DMA_NCHANS];
     uint32_t int_status;
     uint32_t enable;
-} BCM2835DMAState;
+};
 
 #endif
diff --git a/include/hw/dma/i8257.h b/include/hw/dma/i8257.h
index ee06371699..46eef1f581 100644
--- a/include/hw/dma/i8257.h
+++ b/include/hw/dma/i8257.h
@@ -3,8 +3,10 @@
 
 #include "hw/isa/isa.h"
 #include "exec/ioport.h"
+#include "qom/object.h"
 
 #define TYPE_I8257 "i8257"
+typedef struct I8257State I8257State;
 #define I8257(obj) \
     OBJECT_CHECK(I8257State, (obj), TYPE_I8257)
 
@@ -20,7 +22,7 @@ typedef struct I8257Regs {
     void *opaque;
 } I8257Regs;
 
-typedef struct I8257State {
+struct I8257State {
     /* <private> */
     ISADevice parent_obj;
 
@@ -43,7 +45,7 @@ typedef struct I8257State {
     int running;
     PortioList portio_page;
     PortioList portio_pageh;
-} I8257State;
+};
 
 void i8257_dma_init(ISABus *bus, bool high_page_enable);
 
diff --git a/include/hw/dma/pl080.h b/include/hw/dma/pl080.h
index 9d4b3df143..55a645b055 100644
--- a/include/hw/dma/pl080.h
+++ b/include/hw/dma/pl080.h
@@ -29,6 +29,7 @@
 #define HW_DMA_PL080_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define PL080_MAX_CHANNELS 8
 
@@ -42,9 +43,10 @@ typedef struct {
 
 #define TYPE_PL080 "pl080"
 #define TYPE_PL081 "pl081"
+typedef struct PL080State PL080State;
 #define PL080(obj) OBJECT_CHECK(PL080State, (obj), TYPE_PL080)
 
-typedef struct PL080State {
+struct PL080State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -66,6 +68,6 @@ typedef struct PL080State {
 
     MemoryRegion *downstream;
     AddressSpace downstream_as;
-} PL080State;
+};
 
 #endif
diff --git a/include/hw/dma/xlnx-zdma.h b/include/hw/dma/xlnx-zdma.h
index 0b240b4c3c..8be9ee5cc2 100644
--- a/include/hw/dma/xlnx-zdma.h
+++ b/include/hw/dma/xlnx-zdma.h
@@ -32,6 +32,7 @@
 #include "hw/sysbus.h"
 #include "hw/register.h"
 #include "sysemu/dma.h"
+#include "qom/object.h"
 
 #define ZDMA_R_MAX (0x204 / 4)
 
@@ -50,7 +51,7 @@ typedef union {
     uint32_t words[4];
 } XlnxZDMADescr;
 
-typedef struct XlnxZDMA {
+struct XlnxZDMA {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
     MemTxAttrs attr;
@@ -74,7 +75,8 @@ typedef struct XlnxZDMA {
     /* We don't model the common bufs. Must be at least 16 bytes
        to model write only mode.  */
     uint8_t buf[2048];
-} XlnxZDMA;
+};
+typedef struct XlnxZDMA XlnxZDMA;
 
 #define TYPE_XLNX_ZDMA "xlnx.zdma"
 
diff --git a/include/hw/dma/xlnx-zynq-devcfg.h b/include/hw/dma/xlnx-zynq-devcfg.h
index 1d3969d91f..52ba61b653 100644
--- a/include/hw/dma/xlnx-zynq-devcfg.h
+++ b/include/hw/dma/xlnx-zynq-devcfg.h
@@ -29,9 +29,11 @@
 
 #include "hw/register.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_XLNX_ZYNQ_DEVCFG "xlnx.ps7-dev-cfg"
 
+typedef struct XlnxZynqDevcfg XlnxZynqDevcfg;
 #define XLNX_ZYNQ_DEVCFG(obj) \
     OBJECT_CHECK(XlnxZynqDevcfg, (obj), TYPE_XLNX_ZYNQ_DEVCFG)
 
@@ -46,7 +48,7 @@ typedef struct XlnxZynqDevcfgDMACmd {
     uint32_t dest_len;
 } XlnxZynqDevcfgDMACmd;
 
-typedef struct XlnxZynqDevcfg {
+struct XlnxZynqDevcfg {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -57,6 +59,6 @@ typedef struct XlnxZynqDevcfg {
 
     uint32_t regs[XLNX_ZYNQ_DEVCFG_R_MAX];
     RegisterInfo regs_info[XLNX_ZYNQ_DEVCFG_R_MAX];
-} XlnxZynqDevcfg;
+};
 
 #endif
diff --git a/include/hw/dma/xlnx_dpdma.h b/include/hw/dma/xlnx_dpdma.h
index 7a304a5bb4..50952dd7ce 100644
--- a/include/hw/dma/xlnx_dpdma.h
+++ b/include/hw/dma/xlnx_dpdma.h
@@ -28,6 +28,7 @@
 #include "hw/sysbus.h"
 #include "ui/console.h"
 #include "sysemu/dma.h"
+#include "qom/object.h"
 
 #define XLNX_DPDMA_REG_ARRAY_SIZE (0x1000 >> 2)
 
diff --git a/include/hw/fw-path-provider.h b/include/hw/fw-path-provider.h
index 10d1bd4959..1231cca63b 100644
--- a/include/hw/fw-path-provider.h
+++ b/include/hw/fw-path-provider.h
@@ -22,6 +22,7 @@
 
 #define TYPE_FW_PATH_PROVIDER "fw-path-provider"
 
+typedef struct FWPathProviderClass FWPathProviderClass;
 #define FW_PATH_PROVIDER_CLASS(klass) \
      OBJECT_CLASS_CHECK(FWPathProviderClass, (klass), TYPE_FW_PATH_PROVIDER)
 #define FW_PATH_PROVIDER_GET_CLASS(obj) \
@@ -31,11 +32,11 @@
 
 typedef struct FWPathProvider FWPathProvider;
 
-typedef struct FWPathProviderClass {
+struct FWPathProviderClass {
     InterfaceClass parent_class;
 
     char *(*get_dev_path)(FWPathProvider *p, BusState *bus, DeviceState *dev);
-} FWPathProviderClass;
+};
 
 char *fw_path_provider_get_dev_path(FWPathProvider *p, BusState *bus,
                                     DeviceState *dev);
diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index a2deac046a..4dc0bc3f3d 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -11,8 +11,11 @@
 #define ASPEED_GPIO_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_ASPEED_GPIO "aspeed.gpio"
+typedef struct AspeedGPIOClass AspeedGPIOClass;
+typedef struct AspeedGPIOState AspeedGPIOState;
 #define ASPEED_GPIO(obj) OBJECT_CHECK(AspeedGPIOState, (obj), TYPE_ASPEED_GPIO)
 #define ASPEED_GPIO_CLASS(klass) \
      OBJECT_CLASS_CHECK(AspeedGPIOClass, (klass), TYPE_ASPEED_GPIO)
@@ -58,16 +61,16 @@ typedef struct AspeedGPIOReg {
     enum GPIORegType type;
  } AspeedGPIOReg;
 
-typedef struct  AspeedGPIOClass {
+struct AspeedGPIOClass {
     SysBusDevice parent_obj;
     const GPIOSetProperties *props;
     uint32_t nr_gpio_pins;
     uint32_t nr_gpio_sets;
     uint32_t gap;
     const AspeedGPIOReg *reg_table;
-}  AspeedGPIOClass;
+};
 
-typedef struct AspeedGPIOState {
+struct AspeedGPIOState {
     /* <private> */
     SysBusDevice parent;
 
@@ -95,6 +98,6 @@ typedef struct AspeedGPIOState {
         uint32_t debounce_2;
         uint32_t input_mask;
     } sets[ASPEED_GPIO_MAX_NR_SETS];
-} AspeedGPIOState;
+};
 
 #endif /* _ASPEED_GPIO_H_ */
diff --git a/include/hw/gpio/bcm2835_gpio.h b/include/hw/gpio/bcm2835_gpio.h
index b0de0a3c74..d8268f1461 100644
--- a/include/hw/gpio/bcm2835_gpio.h
+++ b/include/hw/gpio/bcm2835_gpio.h
@@ -16,8 +16,9 @@
 
 #include "hw/sd/sd.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
-typedef struct BCM2835GpioState {
+struct BCM2835GpioState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -31,7 +32,8 @@ typedef struct BCM2835GpioState {
     uint32_t lev0, lev1;
     uint8_t sd_fsel;
     qemu_irq out[54];
-} BCM2835GpioState;
+};
+typedef struct BCM2835GpioState BCM2835GpioState;
 
 #define TYPE_BCM2835_GPIO "bcm2835_gpio"
 #define BCM2835_GPIO(obj) \
diff --git a/include/hw/gpio/imx_gpio.h b/include/hw/gpio/imx_gpio.h
index ffab437f23..b7dc689f73 100644
--- a/include/hw/gpio/imx_gpio.h
+++ b/include/hw/gpio/imx_gpio.h
@@ -21,8 +21,10 @@
 #define IMX_GPIO_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_IMX_GPIO "imx.gpio"
+typedef struct IMXGPIOState IMXGPIOState;
 #define IMX_GPIO(obj) OBJECT_CHECK(IMXGPIOState, (obj), TYPE_IMX_GPIO)
 
 #define IMX_GPIO_MEM_SIZE 0x20
@@ -39,7 +41,7 @@
 
 #define IMX_GPIO_PIN_COUNT 32
 
-typedef struct IMXGPIOState {
+struct IMXGPIOState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -58,6 +60,6 @@ typedef struct IMXGPIOState {
 
     qemu_irq irq[2];
     qemu_irq output[IMX_GPIO_PIN_COUNT];
-} IMXGPIOState;
+};
 
 #endif /* IMX_GPIO_H */
diff --git a/include/hw/gpio/nrf51_gpio.h b/include/hw/gpio/nrf51_gpio.h
index 1d62bbc928..0c37dd74c0 100644
--- a/include/hw/gpio/nrf51_gpio.h
+++ b/include/hw/gpio/nrf51_gpio.h
@@ -27,7 +27,9 @@
 #define NRF51_GPIO_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 #define TYPE_NRF51_GPIO "nrf51_soc.gpio"
+typedef struct NRF51GPIOState NRF51GPIOState;
 #define NRF51_GPIO(obj) OBJECT_CHECK(NRF51GPIOState, (obj), TYPE_NRF51_GPIO)
 
 #define NRF51_GPIO_PINS 32
@@ -47,7 +49,7 @@
 #define NRF51_GPIO_PULLDOWN 1
 #define NRF51_GPIO_PULLUP 3
 
-typedef struct NRF51GPIOState {
+struct NRF51GPIOState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
@@ -63,7 +65,7 @@ typedef struct NRF51GPIOState {
     uint32_t old_out_connected;
 
     qemu_irq output[NRF51_GPIO_PINS];
-} NRF51GPIOState;
+};
 
 
 #endif
diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
index 6321e292fd..6536bb01a3 100644
--- a/include/hw/hotplug.h
+++ b/include/hw/hotplug.h
@@ -16,6 +16,7 @@
 
 #define TYPE_HOTPLUG_HANDLER "hotplug-handler"
 
+typedef struct HotplugHandlerClass HotplugHandlerClass;
 #define HOTPLUG_HANDLER_CLASS(klass) \
      OBJECT_CLASS_CHECK(HotplugHandlerClass, (klass), TYPE_HOTPLUG_HANDLER)
 #define HOTPLUG_HANDLER_GET_CLASS(obj) \
@@ -50,7 +51,7 @@ typedef void (*hotplug_fn)(HotplugHandler *plug_handler,
  *          Used for device removal with devices that implement
  *          asynchronous and synchronous (surprise) removal.
  */
-typedef struct HotplugHandlerClass {
+struct HotplugHandlerClass {
     /* <private> */
     InterfaceClass parent;
 
@@ -59,7 +60,7 @@ typedef struct HotplugHandlerClass {
     hotplug_fn plug;
     hotplug_fn unplug_request;
     hotplug_fn unplug;
-} HotplugHandlerClass;
+};
 
 /**
  * hotplug_handler_plug:
diff --git a/include/hw/hyperv/vmbus-bridge.h b/include/hw/hyperv/vmbus-bridge.h
index fe90bda01b..d090d46651 100644
--- a/include/hw/hyperv/vmbus-bridge.h
+++ b/include/hw/hyperv/vmbus-bridge.h
@@ -12,16 +12,18 @@
 
 #include "hw/sysbus.h"
 #include "hw/hyperv/vmbus.h"
+#include "qom/object.h"
 
 #define TYPE_VMBUS_BRIDGE "vmbus-bridge"
 
-typedef struct VMBusBridge {
+struct VMBusBridge {
     SysBusDevice parent_obj;
 
     uint8_t irq;
 
     VMBus *bus;
-} VMBusBridge;
+};
+typedef struct VMBusBridge VMBusBridge;
 
 #define VMBUS_BRIDGE(obj) OBJECT_CHECK(VMBusBridge, (obj), TYPE_VMBUS_BRIDGE)
 
diff --git a/include/hw/hyperv/vmbus.h b/include/hw/hyperv/vmbus.h
index cd98ec24e7..282399b8ce 100644
--- a/include/hw/hyperv/vmbus.h
+++ b/include/hw/hyperv/vmbus.h
@@ -16,9 +16,12 @@
 #include "migration/vmstate.h"
 #include "hw/hyperv/vmbus-proto.h"
 #include "qemu/uuid.h"
+#include "qom/object.h"
 
 #define TYPE_VMBUS_DEVICE "vmbus-dev"
 
+typedef struct VMBusDevice VMBusDevice;
+typedef struct VMBusDeviceClass VMBusDeviceClass;
 #define VMBUS_DEVICE(obj) \
     OBJECT_CHECK(VMBusDevice, (obj), TYPE_VMBUS_DEVICE)
 #define VMBUS_DEVICE_CLASS(klass) \
@@ -44,11 +47,10 @@ typedef struct VMBusChannel VMBusChannel;
  * Base class for VMBus devices.  Includes one or more channels.  Identified by
  * class GUID and instance GUID.
  */
-typedef struct VMBusDevice VMBusDevice;
 
 typedef void(*VMBusChannelNotifyCb)(struct VMBusChannel *chan);
 
-typedef struct VMBusDeviceClass {
+struct VMBusDeviceClass {
     DeviceClass parent;
 
     QemuUUID classid;
@@ -80,7 +82,7 @@ typedef struct VMBusDeviceClass {
      * side, when there's work to do with the data in the channel ring buffers.
      */
     VMBusChannelNotifyCb chan_notify_cb;
-} VMBusDeviceClass;
+};
 
 struct VMBusDevice {
     DeviceState parent;
diff --git a/include/hw/i2c/arm_sbcon_i2c.h b/include/hw/i2c/arm_sbcon_i2c.h
index 5d96507ab6..ca54867964 100644
--- a/include/hw/i2c/arm_sbcon_i2c.h
+++ b/include/hw/i2c/arm_sbcon_i2c.h
@@ -14,14 +14,16 @@
 
 #include "hw/sysbus.h"
 #include "hw/i2c/bitbang_i2c.h"
+#include "qom/object.h"
 
 #define TYPE_VERSATILE_I2C "versatile_i2c"
 #define TYPE_ARM_SBCON_I2C TYPE_VERSATILE_I2C
 
+typedef struct ArmSbconI2CState ArmSbconI2CState;
 #define ARM_SBCON_I2C(obj) \
     OBJECT_CHECK(ArmSbconI2CState, (obj), TYPE_ARM_SBCON_I2C)
 
-typedef struct ArmSbconI2CState {
+struct ArmSbconI2CState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -30,6 +32,6 @@ typedef struct ArmSbconI2CState {
     bitbang_i2c_interface bitbang;
     int out;
     int in;
-} ArmSbconI2CState;
+};
 
 #endif /* HW_I2C_ARM_SBCON_H */
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 243789ae5d..2c0198e314 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -23,11 +23,14 @@
 
 #include "hw/i2c/i2c.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_ASPEED_I2C "aspeed.i2c"
 #define TYPE_ASPEED_2400_I2C TYPE_ASPEED_I2C "-ast2400"
 #define TYPE_ASPEED_2500_I2C TYPE_ASPEED_I2C "-ast2500"
 #define TYPE_ASPEED_2600_I2C TYPE_ASPEED_I2C "-ast2600"
+typedef struct AspeedI2CClass AspeedI2CClass;
+typedef struct AspeedI2CState AspeedI2CState;
 #define ASPEED_I2C(obj) \
     OBJECT_CHECK(AspeedI2CState, (obj), TYPE_ASPEED_I2C)
 
@@ -56,7 +59,7 @@ typedef struct AspeedI2CBus {
     uint32_t dma_len;
 } AspeedI2CBus;
 
-typedef struct AspeedI2CState {
+struct AspeedI2CState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -70,14 +73,14 @@ typedef struct AspeedI2CState {
     AspeedI2CBus busses[ASPEED_I2C_NR_BUSSES];
     MemoryRegion *dram_mr;
     AddressSpace dram_as;
-} AspeedI2CState;
+};
 
 #define ASPEED_I2C_CLASS(klass) \
      OBJECT_CLASS_CHECK(AspeedI2CClass, (klass), TYPE_ASPEED_I2C)
 #define ASPEED_I2C_GET_CLASS(obj) \
      OBJECT_GET_CLASS(AspeedI2CClass, (obj), TYPE_ASPEED_I2C)
 
-typedef struct AspeedI2CClass {
+struct AspeedI2CClass {
     SysBusDeviceClass parent_class;
 
     uint8_t num_busses;
@@ -91,7 +94,7 @@ typedef struct AspeedI2CClass {
     bool check_sram;
     bool has_dma;
 
-} AspeedI2CClass;
+};
 
 I2CBus *aspeed_i2c_get_bus(AspeedI2CState *s, int busnr);
 
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index a9c030a512..bf501b9ac4 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -2,6 +2,7 @@
 #define QEMU_I2C_H
 
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 /* The QEMU I2C implementation only supports simple transfers that complete
    immediately.  It does not support slave devices that need to be able to
@@ -18,6 +19,7 @@ enum i2c_event {
 typedef struct I2CSlave I2CSlave;
 
 #define TYPE_I2C_SLAVE "i2c-slave"
+typedef struct I2CSlaveClass I2CSlaveClass;
 #define I2C_SLAVE(obj) \
      OBJECT_CHECK(I2CSlave, (obj), TYPE_I2C_SLAVE)
 #define I2C_SLAVE_CLASS(klass) \
@@ -25,7 +27,7 @@ typedef struct I2CSlave I2CSlave;
 #define I2C_SLAVE_GET_CLASS(obj) \
      OBJECT_GET_CLASS(I2CSlaveClass, (obj), TYPE_I2C_SLAVE)
 
-typedef struct I2CSlaveClass {
+struct I2CSlaveClass {
     DeviceClass parent_class;
 
     /* Master to slave. Returns non-zero for a NAK, 0 for success. */
@@ -43,7 +45,7 @@ typedef struct I2CSlaveClass {
      * return code is not used and should be zero.
      */
     int (*event)(I2CSlave *s, enum i2c_event event);
-} I2CSlaveClass;
+};
 
 struct I2CSlave {
     DeviceState qdev;
diff --git a/include/hw/i2c/imx_i2c.h b/include/hw/i2c/imx_i2c.h
index 7c73a1fa28..285a8f40a4 100644
--- a/include/hw/i2c/imx_i2c.h
+++ b/include/hw/i2c/imx_i2c.h
@@ -22,8 +22,10 @@
 #define IMX_I2C_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_IMX_I2C "imx.i2c"
+typedef struct IMXI2CState IMXI2CState;
 #define IMX_I2C(obj) OBJECT_CHECK(IMXI2CState, (obj), TYPE_IMX_I2C)
 
 #define IMX_I2C_MEM_SIZE           0x14
@@ -65,7 +67,7 @@
 
 #define ADDR_RESET                 0xFF00
 
-typedef struct IMXI2CState {
+struct IMXI2CState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -82,6 +84,6 @@ typedef struct IMXI2CState {
     uint16_t i2sr;
     uint16_t i2dr_read;
     uint16_t i2dr_write;
-} IMXI2CState;
+};
 
 #endif /* IMX_I2C_H */
diff --git a/include/hw/i2c/microbit_i2c.h b/include/hw/i2c/microbit_i2c.h
index 2bff36680c..76ffaff47a 100644
--- a/include/hw/i2c/microbit_i2c.h
+++ b/include/hw/i2c/microbit_i2c.h
@@ -13,6 +13,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/arm/nrf51.h"
+#include "qom/object.h"
 
 #define NRF51_TWI_TASK_STARTRX 0x000
 #define NRF51_TWI_TASK_STARTTX 0x008
@@ -26,17 +27,18 @@
 #define NRF51_TWI_REG_ADDRESS 0x588
 
 #define TYPE_MICROBIT_I2C "microbit.i2c"
+typedef struct MicrobitI2CState MicrobitI2CState;
 #define MICROBIT_I2C(obj) \
     OBJECT_CHECK(MicrobitI2CState, (obj), TYPE_MICROBIT_I2C)
 
 #define MICROBIT_I2C_NREGS (NRF51_PERIPHERAL_SIZE / sizeof(uint32_t))
 
-typedef struct {
+struct MicrobitI2CState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
     uint32_t regs[MICROBIT_I2C_NREGS];
     uint32_t read_idx;
-} MicrobitI2CState;
+};
 
 #endif /* MICROBIT_I2C_H */
diff --git a/include/hw/i2c/ppc4xx_i2c.h b/include/hw/i2c/ppc4xx_i2c.h
index f6f837fbec..3698e054b1 100644
--- a/include/hw/i2c/ppc4xx_i2c.h
+++ b/include/hw/i2c/ppc4xx_i2c.h
@@ -29,11 +29,13 @@
 
 #include "hw/sysbus.h"
 #include "hw/i2c/bitbang_i2c.h"
+#include "qom/object.h"
 
 #define TYPE_PPC4xx_I2C "ppc4xx-i2c"
+typedef struct PPC4xxI2CState PPC4xxI2CState;
 #define PPC4xx_I2C(obj) OBJECT_CHECK(PPC4xxI2CState, (obj), TYPE_PPC4xx_I2C)
 
-typedef struct PPC4xxI2CState {
+struct PPC4xxI2CState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -57,6 +59,6 @@ typedef struct PPC4xxI2CState {
     uint8_t xfrcnt;
     uint8_t xtcntlss;
     uint8_t directcntl;
-} PPC4xxI2CState;
+};
 
 #endif /* PPC4XX_I2C_H */
diff --git a/include/hw/i2c/smbus_slave.h b/include/hw/i2c/smbus_slave.h
index ebe068304e..17f2cd2d8d 100644
--- a/include/hw/i2c/smbus_slave.h
+++ b/include/hw/i2c/smbus_slave.h
@@ -26,8 +26,11 @@
 #define HW_SMBUS_SLAVE_H
 
 #include "hw/i2c/i2c.h"
+#include "qom/object.h"
 
 #define TYPE_SMBUS_DEVICE "smbus-device"
+typedef struct SMBusDevice SMBusDevice;
+typedef struct SMBusDeviceClass SMBusDeviceClass;
 #define SMBUS_DEVICE(obj) \
      OBJECT_CHECK(SMBusDevice, (obj), TYPE_SMBUS_DEVICE)
 #define SMBUS_DEVICE_CLASS(klass) \
@@ -35,10 +38,8 @@
 #define SMBUS_DEVICE_GET_CLASS(obj) \
      OBJECT_GET_CLASS(SMBusDeviceClass, (obj), TYPE_SMBUS_DEVICE)
 
-typedef struct SMBusDevice SMBusDevice;
 
-typedef struct SMBusDeviceClass
-{
+struct SMBusDeviceClass {
     I2CSlaveClass parent_class;
 
     /*
@@ -67,7 +68,7 @@ typedef struct SMBusDeviceClass
      * return 0xff in that case.
      */
     uint8_t (*receive_byte)(SMBusDevice *dev);
-} SMBusDeviceClass;
+};
 
 #define SMBUS_DATA_MAX_LEN 34  /* command + len + 32 bytes of data.  */
 
diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
index 2597000e03..124f1fad6f 100644
--- a/include/hw/i386/apic_internal.h
+++ b/include/hw/i386/apic_internal.h
@@ -25,6 +25,7 @@
 #include "exec/memory.h"
 #include "qemu/timer.h"
 #include "target/i386/cpu-qom.h"
+#include "qom/object.h"
 
 /* APIC Local Vector Table */
 #define APIC_LVT_TIMER                  0
@@ -125,6 +126,7 @@
 typedef struct APICCommonState APICCommonState;
 
 #define TYPE_APIC_COMMON "apic-common"
+typedef struct APICCommonClass APICCommonClass;
 #define APIC_COMMON(obj) \
      OBJECT_CHECK(APICCommonState, (obj), TYPE_APIC_COMMON)
 #define APIC_COMMON_CLASS(klass) \
@@ -132,8 +134,7 @@ typedef struct APICCommonState APICCommonState;
 #define APIC_COMMON_GET_CLASS(obj) \
      OBJECT_GET_CLASS(APICCommonClass, (obj), TYPE_APIC_COMMON)
 
-typedef struct APICCommonClass
-{
+struct APICCommonClass {
     DeviceClass parent_class;
 
     DeviceRealize realize;
@@ -151,7 +152,7 @@ typedef struct APICCommonClass
      * device, but it's convenient to have it here for now.
      */
     void (*send_msi)(MSIMessage *msi);
-} APICCommonClass;
+};
 
 struct APICCommonState {
     /*< private >*/
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index a98d10b252..8fdac227f2 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -11,6 +11,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
 #include "hw/pci/pci_bus.h"
+#include "qom/object.h"
 
 void ich9_lpc_set_irq(void *opaque, int irq_num, int level);
 int ich9_lpc_map_irq(PCIDevice *pci_dev, int intx);
@@ -23,10 +24,11 @@ void ich9_generate_smi(void);
 #define ICH9_CC_SIZE (16 * 1024) /* 16KB. Chipset configuration registers */
 
 #define TYPE_ICH9_LPC_DEVICE "ICH9-LPC"
+typedef struct ICH9LPCState ICH9LPCState;
 #define ICH9_LPC_DEVICE(obj) \
      OBJECT_CHECK(ICH9LPCState, (obj), TYPE_ICH9_LPC_DEVICE)
 
-typedef struct ICH9LPCState {
+struct ICH9LPCState {
     /* ICH9 LPC PCI to ISA bridge */
     PCIDevice d;
 
@@ -77,7 +79,7 @@ typedef struct ICH9LPCState {
     Notifier machine_ready;
 
     qemu_irq gsi[GSI_NUM_PINS];
-} ICH9LPCState;
+};
 
 #define Q35_MASK(bit, ms_bit, ls_bit) \
 ((uint##bit##_t)(((1ULL << ((ms_bit) + 1)) - 1) & ~((1ULL << ls_bit) - 1)))
diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index 3870052f5f..53e5d32d54 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -24,8 +24,10 @@
 
 #include "hw/i386/x86-iommu.h"
 #include "qemu/iova-tree.h"
+#include "qom/object.h"
 
 #define TYPE_INTEL_IOMMU_DEVICE "intel-iommu"
+typedef struct IntelIOMMUState IntelIOMMUState;
 #define INTEL_IOMMU_DEVICE(obj) \
      OBJECT_CHECK(IntelIOMMUState, (obj), TYPE_INTEL_IOMMU_DEVICE)
 
@@ -56,7 +58,6 @@
 
 typedef struct VTDContextEntry VTDContextEntry;
 typedef struct VTDContextCacheEntry VTDContextCacheEntry;
-typedef struct IntelIOMMUState IntelIOMMUState;
 typedef struct VTDAddressSpace VTDAddressSpace;
 typedef struct VTDIOTLBEntry VTDIOTLBEntry;
 typedef struct VTDBus VTDBus;
diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
index fe06938bda..29ae150727 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -25,6 +25,7 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 #include "qemu/notify.h"
+#include "qom/object.h"
 
 #define MAX_IOAPICS                     1
 
@@ -84,6 +85,7 @@
 typedef struct IOAPICCommonState IOAPICCommonState;
 
 #define TYPE_IOAPIC_COMMON "ioapic-common"
+typedef struct IOAPICCommonClass IOAPICCommonClass;
 #define IOAPIC_COMMON(obj) \
      OBJECT_CHECK(IOAPICCommonState, (obj), TYPE_IOAPIC_COMMON)
 #define IOAPIC_COMMON_CLASS(klass) \
@@ -91,14 +93,14 @@ typedef struct IOAPICCommonState IOAPICCommonState;
 #define IOAPIC_COMMON_GET_CLASS(obj) \
      OBJECT_GET_CLASS(IOAPICCommonClass, (obj), TYPE_IOAPIC_COMMON)
 
-typedef struct IOAPICCommonClass {
+struct IOAPICCommonClass {
     SysBusDeviceClass parent_class;
 
     DeviceRealize realize;
     DeviceUnrealize unrealize;
     void (*pre_save)(IOAPICCommonState *s);
     void (*post_load)(IOAPICCommonState *s);
-} IOAPICCommonClass;
+};
 
 struct IOAPICCommonState {
     SysBusDevice busdev;
diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index fd34b78e0d..0556f64206 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -24,6 +24,7 @@
 
 #include "hw/boards.h"
 #include "hw/i386/x86.h"
+#include "qom/object.h"
 
 /* Platform virtio definitions */
 #define VIRTIO_MMIO_BASE      0xfeb00000
@@ -39,13 +40,14 @@
 #define MICROVM_MACHINE_OPTION_ROMS         "x-option-roms"
 #define MICROVM_MACHINE_AUTO_KERNEL_CMDLINE "auto-kernel-cmdline"
 
-typedef struct {
+struct MicrovmMachineClass {
     X86MachineClass parent;
     HotplugHandler *(*orig_hotplug_handler)(MachineState *machine,
                                            DeviceState *dev);
-} MicrovmMachineClass;
+};
+typedef struct MicrovmMachineClass MicrovmMachineClass;
 
-typedef struct {
+struct MicrovmMachineState {
     X86MachineState parent;
 
     /* Machine type options */
@@ -58,7 +60,8 @@ typedef struct {
 
     /* Machine state */
     bool kernel_cmdline_fixed;
-} MicrovmMachineState;
+};
+typedef struct MicrovmMachineState MicrovmMachineState;
 
 #define TYPE_MICROVM_MACHINE   MACHINE_TYPE_NAME("microvm")
 #define MICROVM_MACHINE(obj) \
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index fe52e165b2..602b57dc5d 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -10,6 +10,7 @@
 
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/hotplug.h"
+#include "qom/object.h"
 
 #define HPET_INTCAP "hpet-intcap"
 
@@ -76,7 +77,7 @@ struct PCMachineState {
  *                  way we can use 1GByte pages in the host.
  *
  */
-typedef struct PCMachineClass {
+struct PCMachineClass {
     /*< private >*/
     X86MachineClass parent_class;
 
@@ -118,7 +119,8 @@ typedef struct PCMachineClass {
 
     /* use PVH to load kernels that support this feature */
     bool pvh_enabled;
-} PCMachineClass;
+};
+typedef struct PCMachineClass PCMachineClass;
 
 #define TYPE_PC_MACHINE "generic-pc-machine"
 #define PC_MACHINE(obj) \
diff --git a/include/hw/i386/x86-iommu.h b/include/hw/i386/x86-iommu.h
index 18420ada15..dae2eab800 100644
--- a/include/hw/i386/x86-iommu.h
+++ b/include/hw/i386/x86-iommu.h
@@ -23,8 +23,11 @@
 #include "hw/sysbus.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
+#include "qom/object.h"
 
 #define  TYPE_X86_IOMMU_DEVICE  ("x86-iommu")
+typedef struct X86IOMMUClass X86IOMMUClass;
+typedef struct X86IOMMUState X86IOMMUState;
 #define  X86_IOMMU_DEVICE(obj) \
     OBJECT_CHECK(X86IOMMUState, (obj), TYPE_X86_IOMMU_DEVICE)
 #define  X86_IOMMU_DEVICE_CLASS(klass) \
@@ -34,8 +37,6 @@
 
 #define X86_IOMMU_SID_INVALID             (0xffff)
 
-typedef struct X86IOMMUState X86IOMMUState;
-typedef struct X86IOMMUClass X86IOMMUClass;
 typedef struct X86IOMMUIrq X86IOMMUIrq;
 typedef struct X86IOMMU_MSIMessage X86IOMMU_MSIMessage;
 
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index b79f24e285..7084bb24e6 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -26,8 +26,9 @@
 #include "hw/nmi.h"
 #include "hw/isa/isa.h"
 #include "hw/i386/ioapic.h"
+#include "qom/object.h"
 
-typedef struct {
+struct X86MachineClass {
     /*< private >*/
     MachineClass parent;
 
@@ -37,9 +38,10 @@ typedef struct {
     bool save_tsc_khz;
     /* Enables contiguous-apic-ID mode */
     bool compat_apic_id_mode;
-} X86MachineClass;
+};
+typedef struct X86MachineClass X86MachineClass;
 
-typedef struct {
+struct X86MachineState {
     /*< private >*/
     MachineState parent;
 
@@ -77,7 +79,8 @@ typedef struct {
      * will be translated to MSI messages in the address space.
      */
     AddressSpace *ioapic_as;
-} X86MachineState;
+};
+typedef struct X86MachineState X86MachineState;
 
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
index 41bb517047..110269f152 100644
--- a/include/hw/ide/ahci.h
+++ b/include/hw/ide/ahci.h
@@ -25,6 +25,7 @@
 #define HW_IDE_AHCI_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 typedef struct AHCIDevice AHCIDevice;
 
@@ -60,31 +61,33 @@ int32_t ahci_get_num_ports(PCIDevice *dev);
 void ahci_ide_create_devs(PCIDevice *dev, DriveInfo **hd);
 
 #define TYPE_SYSBUS_AHCI "sysbus-ahci"
+typedef struct SysbusAHCIState SysbusAHCIState;
 #define SYSBUS_AHCI(obj) OBJECT_CHECK(SysbusAHCIState, (obj), TYPE_SYSBUS_AHCI)
 
-typedef struct SysbusAHCIState {
+struct SysbusAHCIState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
 
     AHCIState ahci;
     uint32_t num_ports;
-} SysbusAHCIState;
+};
 
 #define TYPE_ALLWINNER_AHCI "allwinner-ahci"
+typedef struct AllwinnerAHCIState AllwinnerAHCIState;
 #define ALLWINNER_AHCI(obj) \
         OBJECT_CHECK(AllwinnerAHCIState, (obj), TYPE_ALLWINNER_AHCI)
 
 #define ALLWINNER_AHCI_MMIO_OFF  0x80
 #define ALLWINNER_AHCI_MMIO_SIZE 0x80
 
-typedef struct AllwinnerAHCIState {
+struct AllwinnerAHCIState {
     /*< private >*/
     SysbusAHCIState parent_obj;
     /*< public >*/
 
     MemoryRegion mmio;
     uint32_t regs[ALLWINNER_AHCI_MMIO_SIZE/4];
-} AllwinnerAHCIState;
+};
 
 #endif /* HW_IDE_AHCI_H */
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 1a7869e85d..74ea1e324c 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -17,6 +17,7 @@
 
 /* debug IDE devices */
 #define USE_DMA_CDROM
+#include "qom/object.h"
 
 typedef struct IDEBus IDEBus;
 typedef struct IDEDevice IDEDevice;
@@ -486,6 +487,7 @@ struct IDEBus {
 };
 
 #define TYPE_IDE_DEVICE "ide-device"
+typedef struct IDEDeviceClass IDEDeviceClass;
 #define IDE_DEVICE(obj) \
      OBJECT_CHECK(IDEDevice, (obj), TYPE_IDE_DEVICE)
 #define IDE_DEVICE_CLASS(klass) \
@@ -493,10 +495,10 @@ struct IDEBus {
 #define IDE_DEVICE_GET_CLASS(obj) \
      OBJECT_GET_CLASS(IDEDeviceClass, (obj), TYPE_IDE_DEVICE)
 
-typedef struct IDEDeviceClass {
+struct IDEDeviceClass {
     DeviceClass parent_class;
     void (*realize)(IDEDevice *dev, Error **errp);
-} IDEDeviceClass;
+};
 
 struct IDEDevice {
     DeviceState qdev;
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index dd504e5a0b..7ed1fa101d 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -3,6 +3,7 @@
 
 #include "hw/ide/internal.h"
 #include "hw/pci/pci.h"
+#include "qom/object.h"
 
 #define BM_STATUS_DMAING 0x01
 #define BM_STATUS_ERROR  0x02
@@ -39,9 +40,10 @@ typedef struct BMDMAState {
 } BMDMAState;
 
 #define TYPE_PCI_IDE "pci-ide"
+typedef struct PCIIDEState PCIIDEState;
 #define PCI_IDE(obj) OBJECT_CHECK(PCIIDEState, (obj), TYPE_PCI_IDE)
 
-typedef struct PCIIDEState {
+struct PCIIDEState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -52,7 +54,7 @@ typedef struct PCIIDEState {
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
     MemoryRegion data_bar[2];
-} PCIIDEState;
+};
 
 static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
 {
diff --git a/include/hw/input/adb.h b/include/hw/input/adb.h
index bb75a7b1e3..ad89a21176 100644
--- a/include/hw/input/adb.h
+++ b/include/hw/input/adb.h
@@ -27,6 +27,7 @@
 #define ADB_H
 
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 #define MAX_ADB_DEVICES 16
 
@@ -42,6 +43,7 @@ typedef int ADBDeviceRequest(ADBDevice *d, uint8_t *buf_out,
 typedef bool ADBDeviceHasData(ADBDevice *d);
 
 #define TYPE_ADB_DEVICE "adb-device"
+typedef struct ADBDeviceClass ADBDeviceClass;
 #define ADB_DEVICE(obj) OBJECT_CHECK(ADBDevice, (obj), TYPE_ADB_DEVICE)
 
 struct ADBDevice {
@@ -58,14 +60,14 @@ struct ADBDevice {
 #define ADB_DEVICE_GET_CLASS(obj) \
     OBJECT_GET_CLASS(ADBDeviceClass, (obj), TYPE_ADB_DEVICE)
 
-typedef struct ADBDeviceClass {
+struct ADBDeviceClass {
     /*< private >*/
     DeviceClass parent_class;
     /*< public >*/
 
     ADBDeviceRequest *devreq;
     ADBDeviceHasData *devhasdata;
-} ADBDeviceClass;
+};
 
 #define TYPE_ADB_BUS "apple-desktop-bus"
 #define ADB_BUS(obj) OBJECT_CHECK(ADBBusState, (obj), TYPE_ADB_BUS)
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 4569dfddd9..d4bf584699 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -9,13 +9,14 @@
 #define HW_INPUT_I8042_H
 
 #include "hw/isa/isa.h"
+#include "qom/object.h"
 
 #define TYPE_I8042 "i8042"
+typedef struct ISAKBDState ISAKBDState;
 #define I8042(obj) OBJECT_CHECK(ISAKBDState, (obj), TYPE_I8042)
 
 #define I8042_A20_LINE "a20"
 
-typedef struct ISAKBDState ISAKBDState;
 
 void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
                    MemoryRegion *region, ram_addr_t size,
diff --git a/include/hw/intc/allwinner-a10-pic.h b/include/hw/intc/allwinner-a10-pic.h
index a5895401d1..692d2a88d0 100644
--- a/include/hw/intc/allwinner-a10-pic.h
+++ b/include/hw/intc/allwinner-a10-pic.h
@@ -2,8 +2,10 @@
 #define ALLWINNER_A10_PIC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_AW_A10_PIC  "allwinner-a10-pic"
+typedef struct AwA10PICState AwA10PICState;
 #define AW_A10_PIC(obj) OBJECT_CHECK(AwA10PICState, (obj), TYPE_AW_A10_PIC)
 
 #define AW_A10_PIC_VECTOR       0
@@ -19,7 +21,7 @@
 #define AW_A10_PIC_INT_NR       95
 #define AW_A10_PIC_REG_NUM      DIV_ROUND_UP(AW_A10_PIC_INT_NR, 32)
 
-typedef struct AwA10PICState {
+struct AwA10PICState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -37,6 +39,6 @@ typedef struct AwA10PICState {
     uint32_t enable[AW_A10_PIC_REG_NUM];
     uint32_t mask[AW_A10_PIC_REG_NUM];
     /*priority setting here*/
-} AwA10PICState;
+};
 
 #endif
diff --git a/include/hw/intc/arm_gic.h b/include/hw/intc/arm_gic.h
index 303b9748cb..704ef2b751 100644
--- a/include/hw/intc/arm_gic.h
+++ b/include/hw/intc/arm_gic.h
@@ -65,6 +65,7 @@
 #define HW_ARM_GIC_H
 
 #include "arm_gic_common.h"
+#include "qom/object.h"
 
 /* Number of SGI target-list bits */
 #define GIC_TARGETLIST_BITS 8
@@ -72,6 +73,7 @@
 #define GIC_MIN_PRIORITY_BITS 4
 
 #define TYPE_ARM_GIC "arm_gic"
+typedef struct ARMGICClass ARMGICClass;
 #define ARM_GIC(obj) \
      OBJECT_CHECK(GICState, (obj), TYPE_ARM_GIC)
 #define ARM_GIC_CLASS(klass) \
@@ -79,12 +81,12 @@
 #define ARM_GIC_GET_CLASS(obj) \
      OBJECT_GET_CLASS(ARMGICClass, (obj), TYPE_ARM_GIC)
 
-typedef struct ARMGICClass {
+struct ARMGICClass {
     /*< private >*/
     ARMGICCommonClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
-} ARMGICClass;
+};
 
 #endif
diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
index 6e0d6b8a88..2cbde9b7a9 100644
--- a/include/hw/intc/arm_gic_common.h
+++ b/include/hw/intc/arm_gic_common.h
@@ -22,6 +22,7 @@
 #define HW_ARM_GIC_COMMON_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 /* Maximum number of possible interrupts, determined by the GIC architecture */
 #define GIC_MAXIRQ 1020
@@ -61,7 +62,7 @@ typedef struct gic_irq_state {
     uint8_t group;
 } gic_irq_state;
 
-typedef struct GICState {
+struct GICState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -143,9 +144,11 @@ typedef struct GICState {
     bool irq_reset_nonsecure; /* configure IRQs as group 1 (NS) on reset? */
     int dev_fd; /* kvm device fd if backed by kvm vgic support */
     Error *migration_blocker;
-} GICState;
+};
+typedef struct GICState GICState;
 
 #define TYPE_ARM_GIC_COMMON "arm_gic_common"
+typedef struct ARMGICCommonClass ARMGICCommonClass;
 #define ARM_GIC_COMMON(obj) \
      OBJECT_CHECK(GICState, (obj), TYPE_ARM_GIC_COMMON)
 #define ARM_GIC_COMMON_CLASS(klass) \
@@ -153,14 +156,14 @@ typedef struct GICState {
 #define ARM_GIC_COMMON_GET_CLASS(obj) \
      OBJECT_GET_CLASS(ARMGICCommonClass, (obj), TYPE_ARM_GIC_COMMON)
 
-typedef struct ARMGICCommonClass {
+struct ARMGICCommonClass {
     /*< private >*/
     SysBusDeviceClass parent_class;
     /*< public >*/
 
     void (*pre_save)(GICState *s);
     void (*post_load)(GICState *s);
-} ARMGICCommonClass;
+};
 
 void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
                             const MemoryRegionOps *ops,
diff --git a/include/hw/intc/arm_gicv3.h b/include/hw/intc/arm_gicv3.h
index 4a6fd85e22..58e9131a33 100644
--- a/include/hw/intc/arm_gicv3.h
+++ b/include/hw/intc/arm_gicv3.h
@@ -13,20 +13,22 @@
 #define HW_ARM_GICV3_H
 
 #include "arm_gicv3_common.h"
+#include "qom/object.h"
 
 #define TYPE_ARM_GICV3 "arm-gicv3"
+typedef struct ARMGICv3Class ARMGICv3Class;
 #define ARM_GICV3(obj) OBJECT_CHECK(GICv3State, (obj), TYPE_ARM_GICV3)
 #define ARM_GICV3_CLASS(klass) \
      OBJECT_CLASS_CHECK(ARMGICv3Class, (klass), TYPE_ARM_GICV3)
 #define ARM_GICV3_GET_CLASS(obj) \
      OBJECT_GET_CLASS(ARMGICv3Class, (obj), TYPE_ARM_GICV3)
 
-typedef struct ARMGICv3Class {
+struct ARMGICv3Class {
     /*< private >*/
     ARMGICv3CommonClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
-} ARMGICv3Class;
+};
 
 #endif
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 31ec9a1ae4..86fb060320 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -26,6 +26,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/intc/arm_gic_common.h"
+#include "qom/object.h"
 
 /*
  * Maximum number of possible interrupts, determined by the GIC architecture.
@@ -279,6 +280,7 @@ GICV3_BITMAP_ACCESSORS(level)
 GICV3_BITMAP_ACCESSORS(edge_trigger)
 
 #define TYPE_ARM_GICV3_COMMON "arm-gicv3-common"
+typedef struct ARMGICv3CommonClass ARMGICv3CommonClass;
 #define ARM_GICV3_COMMON(obj) \
      OBJECT_CHECK(GICv3State, (obj), TYPE_ARM_GICV3_COMMON)
 #define ARM_GICV3_COMMON_CLASS(klass) \
@@ -286,14 +288,14 @@ GICV3_BITMAP_ACCESSORS(edge_trigger)
 #define ARM_GICV3_COMMON_GET_CLASS(obj) \
      OBJECT_GET_CLASS(ARMGICv3CommonClass, (obj), TYPE_ARM_GICV3_COMMON)
 
-typedef struct ARMGICv3CommonClass {
+struct ARMGICv3CommonClass {
     /*< private >*/
     SysBusDeviceClass parent_class;
     /*< public >*/
 
     void (*pre_save)(GICv3State *s);
     void (*post_load)(GICv3State *s);
-} ARMGICv3CommonClass;
+};
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
                               const MemoryRegionOps *ops, Error **errp);
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index fd1fe64c03..03a0fa335b 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -23,6 +23,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "qom/object.h"
 
 #define ITS_CONTROL_SIZE 0x10000
 #define ITS_TRANS_SIZE   0x10000
@@ -64,6 +65,7 @@ typedef struct GICv3ITSState GICv3ITSState;
 void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops);
 
 #define TYPE_ARM_GICV3_ITS_COMMON "arm-gicv3-its-common"
+typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;
 #define ARM_GICV3_ITS_COMMON(obj) \
      OBJECT_CHECK(GICv3ITSState, (obj), TYPE_ARM_GICV3_ITS_COMMON)
 #define ARM_GICV3_ITS_COMMON_CLASS(klass) \
@@ -81,6 +83,5 @@ struct GICv3ITSCommonClass {
     void (*post_load)(GICv3ITSState *s);
 };
 
-typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;
 
 #endif
diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index a472c9b8f0..63098822fa 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -13,9 +13,11 @@
 #include "target/arm/cpu.h"
 #include "hw/sysbus.h"
 #include "hw/timer/armv7m_systick.h"
+#include "qom/object.h"
 
 #define TYPE_NVIC "armv7m_nvic"
 
+typedef struct NVICState NVICState;
 #define NVIC(obj) \
     OBJECT_CHECK(NVICState, (obj), TYPE_NVIC)
 
@@ -35,7 +37,7 @@ typedef struct VecInfo {
     uint8_t level; /* exceptions <=15 never set level */
 } VecInfo;
 
-typedef struct NVICState {
+struct NVICState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -88,6 +90,6 @@ typedef struct NVICState {
     qemu_irq sysresetreq;
 
     SysTickState systick[M_REG_NUM_BANKS];
-} NVICState;
+};
 
 #endif
diff --git a/include/hw/intc/aspeed_vic.h b/include/hw/intc/aspeed_vic.h
index 107ff17c3b..f8844b3327 100644
--- a/include/hw/intc/aspeed_vic.h
+++ b/include/hw/intc/aspeed_vic.h
@@ -14,13 +14,15 @@
 #define ASPEED_VIC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_ASPEED_VIC "aspeed.vic"
+typedef struct AspeedVICState AspeedVICState;
 #define ASPEED_VIC(obj) OBJECT_CHECK(AspeedVICState, (obj), TYPE_ASPEED_VIC)
 
 #define ASPEED_VIC_NR_IRQS 51
 
-typedef struct AspeedVICState {
+struct AspeedVICState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -43,6 +45,6 @@ typedef struct AspeedVICState {
 
     /* 0=low-sensitive/falling-edge, 1=high-sensitive/rising-edge */
     uint64_t event;
-} AspeedVICState;
+};
 
 #endif /* ASPEED_VIC_H */
diff --git a/include/hw/intc/bcm2835_ic.h b/include/hw/intc/bcm2835_ic.h
index 392ded1cb3..4a9f093025 100644
--- a/include/hw/intc/bcm2835_ic.h
+++ b/include/hw/intc/bcm2835_ic.h
@@ -9,14 +9,16 @@
 #define BCM2835_IC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_BCM2835_IC "bcm2835-ic"
+typedef struct BCM2835ICState BCM2835ICState;
 #define BCM2835_IC(obj) OBJECT_CHECK(BCM2835ICState, (obj), TYPE_BCM2835_IC)
 
 #define BCM2835_IC_GPU_IRQ "gpu-irq"
 #define BCM2835_IC_ARM_IRQ "arm-irq"
 
-typedef struct BCM2835ICState {
+struct BCM2835ICState {
     /*< private >*/
     SysBusDevice busdev;
     /*< public >*/
@@ -30,6 +32,6 @@ typedef struct BCM2835ICState {
     uint8_t arm_irq_level, arm_irq_enable;
     bool fiq_enable;
     uint8_t fiq_select;
-} BCM2835ICState;
+};
 
 #endif
diff --git a/include/hw/intc/bcm2836_control.h b/include/hw/intc/bcm2836_control.h
index 2c22405686..7d8a51fc72 100644
--- a/include/hw/intc/bcm2836_control.h
+++ b/include/hw/intc/bcm2836_control.h
@@ -17,16 +17,18 @@
 
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 
 /* 4 mailboxes per core, for 16 total */
 #define BCM2836_NCORES 4
 #define BCM2836_MBPERCORE 4
 
 #define TYPE_BCM2836_CONTROL "bcm2836-control"
+typedef struct BCM2836ControlState BCM2836ControlState;
 #define BCM2836_CONTROL(obj) \
     OBJECT_CHECK(BCM2836ControlState, (obj), TYPE_BCM2836_CONTROL)
 
-typedef struct BCM2836ControlState {
+struct BCM2836ControlState {
     /*< private >*/
     SysBusDevice busdev;
     /*< public >*/
@@ -56,6 +58,6 @@ typedef struct BCM2836ControlState {
     /* outputs to CPU cores */
     qemu_irq irq[BCM2836_NCORES];
     qemu_irq fiq[BCM2836_NCORES];
-} BCM2836ControlState;
+};
 
 #endif
diff --git a/include/hw/intc/heathrow_pic.h b/include/hw/intc/heathrow_pic.h
index b163e27ab9..bd9fc115a8 100644
--- a/include/hw/intc/heathrow_pic.h
+++ b/include/hw/intc/heathrow_pic.h
@@ -27,8 +27,10 @@
 #define HW_INTC_HEATHROW_PIC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_HEATHROW "heathrow"
+typedef struct HeathrowState HeathrowState;
 #define HEATHROW(obj) OBJECT_CHECK(HeathrowState, (obj), TYPE_HEATHROW)
 
 typedef struct HeathrowPICState {
@@ -38,13 +40,13 @@ typedef struct HeathrowPICState {
     uint32_t level_triggered;
 } HeathrowPICState;
 
-typedef struct HeathrowState {
+struct HeathrowState {
     SysBusDevice parent_obj;
 
     MemoryRegion mem;
     HeathrowPICState pics[2];
     qemu_irq irqs[1];
-} HeathrowState;
+};
 
 #define HEATHROW_NUM_IRQS 64
 
diff --git a/include/hw/intc/ibex_plic.h b/include/hw/intc/ibex_plic.h
index d8eb09b258..0125b36267 100644
--- a/include/hw/intc/ibex_plic.h
+++ b/include/hw/intc/ibex_plic.h
@@ -20,12 +20,14 @@
 #define HW_IBEX_PLIC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_IBEX_PLIC "ibex-plic"
+typedef struct IbexPlicState IbexPlicState;
 #define IBEX_PLIC(obj) \
     OBJECT_CHECK(IbexPlicState, (obj), TYPE_IBEX_PLIC)
 
-typedef struct IbexPlicState {
+struct IbexPlicState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -59,6 +61,6 @@ typedef struct IbexPlicState {
     uint32_t threshold_base;
 
     uint32_t claim_base;
-} IbexPlicState;
+};
 
 #endif /* HW_IBEX_PLIC_H */
diff --git a/include/hw/intc/imx_avic.h b/include/hw/intc/imx_avic.h
index 1b80769018..124f29f763 100644
--- a/include/hw/intc/imx_avic.h
+++ b/include/hw/intc/imx_avic.h
@@ -18,8 +18,10 @@
 #define IMX_AVIC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_IMX_AVIC "imx.avic"
+typedef struct IMXAVICState IMXAVICState;
 #define IMX_AVIC(obj) OBJECT_CHECK(IMXAVICState, (obj), TYPE_IMX_AVIC)
 
 #define IMX_AVIC_NUM_IRQS 64
@@ -36,7 +38,7 @@
 #define PRIO_PER_WORD (sizeof(uint32_t) * 8 / 4)
 #define PRIO_WORDS (IMX_AVIC_NUM_IRQS/PRIO_PER_WORD)
 
-typedef struct IMXAVICState{
+struct IMXAVICState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -50,6 +52,6 @@ typedef struct IMXAVICState{
     qemu_irq irq;
     qemu_irq fiq;
     uint32_t prio[PRIO_WORDS]; /* Priorities are 4-bits each */
-} IMXAVICState;
+};
 
 #endif /* IMX_AVIC_H */
diff --git a/include/hw/intc/imx_gpcv2.h b/include/hw/intc/imx_gpcv2.h
index ed978b24bb..66befda3fd 100644
--- a/include/hw/intc/imx_gpcv2.h
+++ b/include/hw/intc/imx_gpcv2.h
@@ -2,19 +2,21 @@
 #define IMX_GPCV2_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 enum IMXGPCv2Registers {
     GPC_NUM        = 0xE00 / sizeof(uint32_t),
 };
 
-typedef struct IMXGPCv2State {
+struct IMXGPCv2State {
     /*< private >*/
     SysBusDevice parent_obj;
 
     /*< public >*/
     MemoryRegion iomem;
     uint32_t     regs[GPC_NUM];
-} IMXGPCv2State;
+};
+typedef struct IMXGPCv2State IMXGPCv2State;
 
 #define TYPE_IMX_GPCV2 "imx-gpcv2"
 #define IMX_GPCV2(obj) OBJECT_CHECK(IMXGPCv2State, (obj), TYPE_IMX_GPCV2)
diff --git a/include/hw/intc/intc.h b/include/hw/intc/intc.h
index fb3e8e621f..b51c0ac0f4 100644
--- a/include/hw/intc/intc.h
+++ b/include/hw/intc/intc.h
@@ -5,6 +5,7 @@
 
 #define TYPE_INTERRUPT_STATS_PROVIDER "intctrl"
 
+typedef struct InterruptStatsProviderClass InterruptStatsProviderClass;
 #define INTERRUPT_STATS_PROVIDER_CLASS(klass) \
     OBJECT_CLASS_CHECK(InterruptStatsProviderClass, (klass), \
                        TYPE_INTERRUPT_STATS_PROVIDER)
@@ -17,7 +18,7 @@
 
 typedef struct InterruptStatsProvider InterruptStatsProvider;
 
-typedef struct InterruptStatsProviderClass {
+struct InterruptStatsProviderClass {
     InterfaceClass parent;
 
     /* The returned pointer and statistics must remain valid until
@@ -26,6 +27,6 @@ typedef struct InterruptStatsProviderClass {
     bool (*get_statistics)(InterruptStatsProvider *obj, uint64_t **irq_counts,
                            unsigned int *nb_irqs);
     void (*print_info)(InterruptStatsProvider *obj, Monitor *mon);
-} InterruptStatsProviderClass;
+};
 
 #endif
diff --git a/include/hw/intc/mips_gic.h b/include/hw/intc/mips_gic.h
index 8428287bf9..5670421e62 100644
--- a/include/hw/intc/mips_gic.h
+++ b/include/hw/intc/mips_gic.h
@@ -15,6 +15,7 @@
 #include "hw/timer/mips_gictimer.h"
 #include "hw/sysbus.h"
 #include "cpu.h"
+#include "qom/object.h"
 /*
  * GIC Specific definitions
  */
@@ -170,13 +171,13 @@
 #define GIC_LOCAL_INT_WD        0 /* GIC watchdog */
 
 #define TYPE_MIPS_GIC "mips-gic"
+typedef struct MIPSGICState MIPSGICState;
 #define MIPS_GIC(obj) OBJECT_CHECK(MIPSGICState, (obj), TYPE_MIPS_GIC)
 
 /* Support up to 32 VPs and 256 IRQs */
 #define GIC_MAX_VPS             32
 #define GIC_MAX_INTRS           256
 
-typedef struct MIPSGICState MIPSGICState;
 typedef struct MIPSGICIRQState MIPSGICIRQState;
 typedef struct MIPSGICVPState MIPSGICVPState;
 
diff --git a/include/hw/intc/realview_gic.h b/include/hw/intc/realview_gic.h
index 1783ea11b9..e633992b9c 100644
--- a/include/hw/intc/realview_gic.h
+++ b/include/hw/intc/realview_gic.h
@@ -12,17 +12,19 @@
 
 #include "hw/sysbus.h"
 #include "hw/intc/arm_gic.h"
+#include "qom/object.h"
 
 #define TYPE_REALVIEW_GIC "realview_gic"
+typedef struct RealViewGICState RealViewGICState;
 #define REALVIEW_GIC(obj) \
     OBJECT_CHECK(RealViewGICState, (obj), TYPE_REALVIEW_GIC)
 
-typedef struct RealViewGICState {
+struct RealViewGICState {
     SysBusDevice parent_obj;
 
     MemoryRegion container;
 
     GICState gic;
-} RealViewGICState;
+};
 
 #endif
diff --git a/include/hw/intc/rx_icu.h b/include/hw/intc/rx_icu.h
index 7176015cd9..5660cb4e7f 100644
--- a/include/hw/intc/rx_icu.h
+++ b/include/hw/intc/rx_icu.h
@@ -22,6 +22,7 @@
 #define HW_INTC_RX_ICU_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 enum TRG_MODE {
     TRG_LEVEL = 0,
diff --git a/include/hw/intc/xlnx-pmu-iomod-intc.h b/include/hw/intc/xlnx-pmu-iomod-intc.h
index 0bd118884a..fce35ac941 100644
--- a/include/hw/intc/xlnx-pmu-iomod-intc.h
+++ b/include/hw/intc/xlnx-pmu-iomod-intc.h
@@ -27,16 +27,18 @@
 
 #include "hw/sysbus.h"
 #include "hw/register.h"
+#include "qom/object.h"
 
 #define TYPE_XLNX_PMU_IO_INTC "xlnx.pmu_io_intc"
 
+typedef struct XlnxPMUIOIntc XlnxPMUIOIntc;
 #define XLNX_PMU_IO_INTC(obj) \
      OBJECT_CHECK(XlnxPMUIOIntc, (obj), TYPE_XLNX_PMU_IO_INTC)
 
 /* This is R_PIT3_CONTROL + 1 */
 #define XLNXPMUIOINTC_R_MAX (0x78 + 1)
 
-typedef struct XlnxPMUIOIntc {
+struct XlnxPMUIOIntc {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
 
@@ -52,6 +54,6 @@ typedef struct XlnxPMUIOIntc {
 
     uint32_t regs[XLNXPMUIOINTC_R_MAX];
     RegisterInfo regs_info[XLNXPMUIOINTC_R_MAX];
-} XlnxPMUIOIntc;
+};
 
 #endif /* HW_INTC_XLNX_PMU_IOMOD_INTC_H */
diff --git a/include/hw/intc/xlnx-zynqmp-ipi.h b/include/hw/intc/xlnx-zynqmp-ipi.h
index 866c719c6f..9044ca5afe 100644
--- a/include/hw/intc/xlnx-zynqmp-ipi.h
+++ b/include/hw/intc/xlnx-zynqmp-ipi.h
@@ -27,9 +27,11 @@
 
 #include "hw/sysbus.h"
 #include "hw/register.h"
+#include "qom/object.h"
 
 #define TYPE_XLNX_ZYNQMP_IPI "xlnx.zynqmp_ipi"
 
+typedef struct XlnxZynqMPIPI XlnxZynqMPIPI;
 #define XLNX_ZYNQMP_IPI(obj) \
      OBJECT_CHECK(XlnxZynqMPIPI, (obj), TYPE_XLNX_ZYNQMP_IPI)
 
@@ -38,7 +40,7 @@
 
 #define NUM_IPIS 11
 
-typedef struct XlnxZynqMPIPI {
+struct XlnxZynqMPIPI {
     /* Private */
     SysBusDevice parent_obj;
 
@@ -51,6 +53,6 @@ typedef struct XlnxZynqMPIPI {
 
     uint32_t regs[R_XLNX_ZYNQMP_IPI_MAX];
     RegisterInfo regs_info[R_XLNX_ZYNQMP_IPI_MAX];
-} XlnxZynqMPIPI;
+};
 
 #endif /* XLNX_ZYNQMP_IPI_H */
diff --git a/include/hw/ipack/ipack.h b/include/hw/ipack/ipack.h
index 1c07969bc9..ac6105ff8b 100644
--- a/include/hw/ipack/ipack.h
+++ b/include/hw/ipack/ipack.h
@@ -12,6 +12,7 @@
 #define QEMU_IPACK_H
 
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 typedef struct IPackBus IPackBus;
 
diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
index 8a99d958bb..742c400533 100644
--- a/include/hw/ipmi/ipmi.h
+++ b/include/hw/ipmi/ipmi.h
@@ -27,6 +27,7 @@
 
 #include "exec/memory.h"
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 #define MAX_IPMI_MSG_SIZE 300
 
@@ -109,6 +110,7 @@ uint32_t ipmi_next_uuid(void);
 #define TYPE_IPMI_INTERFACE "ipmi-interface"
 #define IPMI_INTERFACE(obj) \
      INTERFACE_CHECK(IPMIInterface, (obj), TYPE_IPMI_INTERFACE)
+typedef struct IPMIInterfaceClass IPMIInterfaceClass;
 #define IPMI_INTERFACE_CLASS(class) \
      OBJECT_CLASS_CHECK(IPMIInterfaceClass, (class), TYPE_IPMI_INTERFACE)
 #define IPMI_INTERFACE_GET_CLASS(class) \
@@ -116,7 +118,7 @@ uint32_t ipmi_next_uuid(void);
 
 typedef struct IPMIInterface IPMIInterface;
 
-typedef struct IPMIInterfaceClass {
+struct IPMIInterfaceClass {
     InterfaceClass parent;
 
     /*
@@ -169,12 +171,14 @@ typedef struct IPMIInterfaceClass {
      * Return the firmware info for a device.
      */
     void (*get_fwinfo)(struct IPMIInterface *s, IPMIFwInfo *info);
-} IPMIInterfaceClass;
+};
 
 /*
  * Define a BMC simulator (or perhaps a connection to a real BMC)
  */
 #define TYPE_IPMI_BMC "ipmi-bmc"
+typedef struct IPMIBmc IPMIBmc;
+typedef struct IPMIBmcClass IPMIBmcClass;
 #define IPMI_BMC(obj) \
      OBJECT_CHECK(IPMIBmc, (obj), TYPE_IPMI_BMC)
 #define IPMI_BMC_CLASS(obj_class) \
@@ -182,15 +186,15 @@ typedef struct IPMIInterfaceClass {
 #define IPMI_BMC_GET_CLASS(obj) \
      OBJECT_GET_CLASS(IPMIBmcClass, (obj), TYPE_IPMI_BMC)
 
-typedef struct IPMIBmc {
+struct IPMIBmc {
     DeviceState parent;
 
     uint8_t slave_addr;
 
     IPMIInterface *intf;
-} IPMIBmc;
+};
 
-typedef struct IPMIBmcClass {
+struct IPMIBmcClass {
     DeviceClass parent;
 
     /* Called when the system resets to report to the bmc. */
@@ -203,7 +207,7 @@ typedef struct IPMIBmcClass {
                            uint8_t *cmd, unsigned int cmd_len,
                            unsigned int max_cmd_len,
                            uint8_t msg_id);
-} IPMIBmcClass;
+};
 
 /*
  * Add a link property to obj that points to a BMC.
@@ -267,10 +271,10 @@ int ipmi_bmc_sdr_find(IPMIBmc *b, uint16_t recid,
 void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, bool log);
 
 #define TYPE_IPMI_BMC_SIMULATOR "ipmi-bmc-sim"
+typedef struct IPMIBmcSim IPMIBmcSim;
 #define IPMI_BMC_SIMULATOR(obj) OBJECT_CHECK(IPMIBmcSim, (obj), \
                                         TYPE_IPMI_BMC_SIMULATOR)
 
-typedef struct IPMIBmcSim IPMIBmcSim;
 
 typedef struct RspBuffer {
     uint8_t buffer[MAX_IPMI_MSG_SIZE];
diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
index 861d70d8f8..69170df6f8 100644
--- a/include/hw/isa/i8259_internal.h
+++ b/include/hw/isa/i8259_internal.h
@@ -28,10 +28,12 @@
 #include "hw/isa/isa.h"
 #include "hw/intc/intc.h"
 #include "hw/intc/i8259.h"
+#include "qom/object.h"
 
 typedef struct PICCommonState PICCommonState;
 
 #define TYPE_PIC_COMMON "pic-common"
+typedef struct PICCommonClass PICCommonClass;
 #define PIC_COMMON(obj) \
      OBJECT_CHECK(PICCommonState, (obj), TYPE_PIC_COMMON)
 #define PIC_COMMON_CLASS(klass) \
@@ -39,13 +41,12 @@ typedef struct PICCommonState PICCommonState;
 #define PIC_COMMON_GET_CLASS(obj) \
      OBJECT_GET_CLASS(PICCommonClass, (obj), TYPE_PIC_COMMON)
 
-typedef struct PICCommonClass
-{
+struct PICCommonClass {
     ISADeviceClass parent_class;
 
     void (*pre_save)(PICCommonState *s);
     void (*post_load)(PICCommonState *s);
-} PICCommonClass;
+};
 
 struct PICCommonState {
     ISADevice parent_obj;
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 52b61eed88..c7f27d5aa9 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -6,10 +6,12 @@
 #include "exec/memory.h"
 #include "exec/ioport.h"
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 #define ISA_NUM_IRQS 16
 
 #define TYPE_ISA_DEVICE "isa-device"
+typedef struct ISADeviceClass ISADeviceClass;
 #define ISA_DEVICE(obj) \
      OBJECT_CHECK(ISADevice, (obj), TYPE_ISA_DEVICE)
 #define ISA_DEVICE_CLASS(klass) \
@@ -36,6 +38,7 @@ static inline uint16_t applesmc_port(void)
 
 #define TYPE_ISADMA "isa-dma"
 
+typedef struct IsaDmaClass IsaDmaClass;
 #define ISADMA_CLASS(klass) \
     OBJECT_CLASS_CHECK(IsaDmaClass, (klass), TYPE_ISADMA)
 #define ISADMA_GET_CLASS(obj) \
@@ -53,7 +56,7 @@ typedef enum {
 typedef int (*IsaDmaTransferHandler)(void *opaque, int nchan, int pos,
                                      int size);
 
-typedef struct IsaDmaClass {
+struct IsaDmaClass {
     InterfaceClass parent;
 
     bool (*has_autoinitialization)(IsaDma *obj, int nchan);
@@ -65,12 +68,12 @@ typedef struct IsaDmaClass {
     void (*register_channel)(IsaDma *obj, int nchan,
                              IsaDmaTransferHandler transfer_handler,
                              void *opaque);
-} IsaDmaClass;
+};
 
-typedef struct ISADeviceClass {
+struct ISADeviceClass {
     DeviceClass parent_class;
     void (*build_aml)(ISADevice *dev, Aml *scope);
-} ISADeviceClass;
+};
 
 struct ISABus {
     /*< private >*/
diff --git a/include/hw/isa/pc87312.h b/include/hw/isa/pc87312.h
index e16263d4b1..c8e98ea029 100644
--- a/include/hw/isa/pc87312.h
+++ b/include/hw/isa/pc87312.h
@@ -26,12 +26,14 @@
 #define QEMU_PC87312_H
 
 #include "hw/isa/superio.h"
+#include "qom/object.h"
 
 
 #define TYPE_PC87312_SUPERIO "pc87312"
+typedef struct PC87312State PC87312State;
 #define PC87312(obj) OBJECT_CHECK(PC87312State, (obj), TYPE_PC87312_SUPERIO)
 
-typedef struct PC87312State {
+struct PC87312State {
     /*< private >*/
     ISASuperIODevice parent_dev;
     /*< public >*/
@@ -49,7 +51,7 @@ typedef struct PC87312State {
     uint8_t selected_index;
 
     uint8_t regs[3];
-} PC87312State;
+};
 
 
 #endif
diff --git a/include/hw/isa/superio.h b/include/hw/isa/superio.h
index 147cc0a7b7..c782c8b64e 100644
--- a/include/hw/isa/superio.h
+++ b/include/hw/isa/superio.h
@@ -12,8 +12,11 @@
 
 #include "sysemu/sysemu.h"
 #include "hw/isa/isa.h"
+#include "qom/object.h"
 
 #define TYPE_ISA_SUPERIO "isa-superio"
+typedef struct ISASuperIOClass ISASuperIOClass;
+typedef struct ISASuperIODevice ISASuperIODevice;
 #define ISA_SUPERIO(obj) \
     OBJECT_CHECK(ISASuperIODevice, (obj), TYPE_ISA_SUPERIO)
 #define ISA_SUPERIO_GET_CLASS(obj) \
@@ -23,7 +26,7 @@
 
 #define SUPERIO_MAX_SERIAL_PORTS 4
 
-typedef struct ISASuperIODevice {
+struct ISASuperIODevice {
     /*< private >*/
     ISADevice parent_obj;
     /*< public >*/
@@ -33,7 +36,7 @@ typedef struct ISASuperIODevice {
     ISADevice *floppy;
     ISADevice *kbc;
     ISADevice *ide;
-} ISASuperIODevice;
+};
 
 typedef struct ISASuperIOFuncs {
     size_t count;
@@ -43,7 +46,7 @@ typedef struct ISASuperIOFuncs {
     unsigned int (*get_dma)(ISASuperIODevice *sio, uint8_t index);
 } ISASuperIOFuncs;
 
-typedef struct ISASuperIOClass {
+struct ISASuperIOClass {
     /*< private >*/
     ISADeviceClass parent_class;
     /*< public >*/
@@ -53,7 +56,7 @@ typedef struct ISASuperIOClass {
     ISASuperIOFuncs serial;
     ISASuperIOFuncs floppy;
     ISASuperIOFuncs ide;
-} ISASuperIOClass;
+};
 
 #define TYPE_FDC37M81X_SUPERIO  "fdc37m81x-superio"
 #define TYPE_SMC37C669_SUPERIO  "smc37c669-superio"
diff --git a/include/hw/m68k/mcf_fec.h b/include/hw/m68k/mcf_fec.h
index c09e33a57c..c8ece3cb4b 100644
--- a/include/hw/m68k/mcf_fec.h
+++ b/include/hw/m68k/mcf_fec.h
@@ -9,6 +9,7 @@
 
 #ifndef HW_M68K_MCF_FEC_H
 #define HW_M68K_MCF_FEC_H
+#include "qom/object.h"
 
 #define TYPE_MCF_FEC_NET "mcf-fec"
 typedef struct mcf_fec_state mcf_fec_state;
diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index 04476acb8f..d19bca5942 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -19,6 +19,7 @@
 
 #define TYPE_MEMORY_DEVICE "memory-device"
 
+typedef struct MemoryDeviceClass MemoryDeviceClass;
 #define MEMORY_DEVICE_CLASS(klass) \
      OBJECT_CLASS_CHECK(MemoryDeviceClass, (klass), TYPE_MEMORY_DEVICE)
 #define MEMORY_DEVICE_GET_CLASS(obj) \
@@ -43,7 +44,7 @@ typedef struct MemoryDeviceState MemoryDeviceState;
  * be provided. Scattered memory regions are not supported for single
  * devices.
  */
-typedef struct MemoryDeviceClass {
+struct MemoryDeviceClass {
     /* private */
     InterfaceClass parent_class;
 
@@ -94,7 +95,7 @@ typedef struct MemoryDeviceClass {
      */
     void (*fill_device_info)(const MemoryDeviceState *md,
                              MemoryDeviceInfo *info);
-} MemoryDeviceClass;
+};
 
 MemoryDeviceInfoList *qmp_memory_device_list(void);
 uint64_t get_plugged_memory_size(void);
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index b67a1aedf6..4b4a4b5b17 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -27,6 +27,7 @@
 #include "hw/acpi/bios-linker-loader.h"
 #include "qemu/uuid.h"
 #include "hw/acpi/aml-build.h"
+#include "qom/object.h"
 
 #define NVDIMM_DEBUG 0
 #define nvdimm_debug(fmt, ...)                                \
@@ -45,6 +46,8 @@
 #define MIN_NAMESPACE_LABEL_SIZE      (128UL << 10)
 
 #define TYPE_NVDIMM      "nvdimm"
+typedef struct NVDIMMClass NVDIMMClass;
+typedef struct NVDIMMDevice NVDIMMDevice;
 #define NVDIMM(obj)      OBJECT_CHECK(NVDIMMDevice, (obj), TYPE_NVDIMM)
 #define NVDIMM_CLASS(oc) OBJECT_CLASS_CHECK(NVDIMMClass, (oc), TYPE_NVDIMM)
 #define NVDIMM_GET_CLASS(obj) OBJECT_GET_CLASS(NVDIMMClass, (obj), \
@@ -92,7 +95,6 @@ struct NVDIMMDevice {
      */
     QemuUUID uuid;
 };
-typedef struct NVDIMMDevice NVDIMMDevice;
 
 struct NVDIMMClass {
     /* private */
@@ -107,7 +109,6 @@ struct NVDIMMClass {
     void (*write_label_data)(NVDIMMDevice *nvdimm, const void *buf,
                              uint64_t size, uint64_t offset);
 };
-typedef struct NVDIMMClass NVDIMMClass;
 
 #define NVDIMM_DSM_MEM_FILE     "etc/acpi/nvdimm-mem"
 
diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
index 289edc0f3d..41d4ff39ba 100644
--- a/include/hw/mem/pc-dimm.h
+++ b/include/hw/mem/pc-dimm.h
@@ -18,8 +18,11 @@
 
 #include "exec/memory.h"
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 #define TYPE_PC_DIMM "pc-dimm"
+typedef struct PCDIMMDevice PCDIMMDevice;
+typedef struct PCDIMMDeviceClass PCDIMMDeviceClass;
 #define PC_DIMM(obj) \
     OBJECT_CHECK(PCDIMMDevice, (obj), TYPE_PC_DIMM)
 #define PC_DIMM_CLASS(oc) \
@@ -44,7 +47,7 @@
  *        Default value: -1, means that slot is auto-allocated.
  * @hostmem: host memory backend providing memory for @PCDIMMDevice
  */
-typedef struct PCDIMMDevice {
+struct PCDIMMDevice {
     /* private */
     DeviceState parent_obj;
 
@@ -53,7 +56,7 @@ typedef struct PCDIMMDevice {
     uint32_t node;
     int32_t slot;
     HostMemoryBackend *hostmem;
-} PCDIMMDevice;
+};
 
 /**
  * PCDIMMDeviceClass:
@@ -63,7 +66,7 @@ typedef struct PCDIMMDevice {
  * memory of @dimm should be kept during live migration. Will not fail
  * after the device was realized.
  */
-typedef struct PCDIMMDeviceClass {
+struct PCDIMMDeviceClass {
     /* private */
     DeviceClass parent_class;
 
@@ -71,7 +74,7 @@ typedef struct PCDIMMDeviceClass {
     void (*realize)(PCDIMMDevice *dimm, Error **errp);
     MemoryRegion *(*get_vmstate_memory_region)(PCDIMMDevice *dimm,
                                                Error **errp);
-} PCDIMMDeviceClass;
+};
 
 void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
                       const uint64_t *legacy_align, Error **errp);
diff --git a/include/hw/mips/cps.h b/include/hw/mips/cps.h
index a941c55f27..ab79a66b1d 100644
--- a/include/hw/mips/cps.h
+++ b/include/hw/mips/cps.h
@@ -26,11 +26,13 @@
 #include "hw/misc/mips_cpc.h"
 #include "hw/misc/mips_itu.h"
 #include "target/mips/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_MIPS_CPS "mips-cps"
+typedef struct MIPSCPSState MIPSCPSState;
 #define MIPS_CPS(obj) OBJECT_CHECK(MIPSCPSState, (obj), TYPE_MIPS_CPS)
 
-typedef struct MIPSCPSState {
+struct MIPSCPSState {
     SysBusDevice parent_obj;
 
     uint32_t num_vp;
@@ -42,7 +44,7 @@ typedef struct MIPSCPSState {
     MIPSGICState gic;
     MIPSCPCState cpc;
     MIPSITUState itu;
-} MIPSCPSState;
+};
 
 qemu_irq get_cps_irq(MIPSCPSState *cps, int pin_number);
 
diff --git a/include/hw/misc/a9scu.h b/include/hw/misc/a9scu.h
index efb0c305c2..c5481f4dbb 100644
--- a/include/hw/misc/a9scu.h
+++ b/include/hw/misc/a9scu.h
@@ -11,10 +11,11 @@
 #define HW_MISC_A9SCU_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 /* A9MP private memory region.  */
 
-typedef struct A9SCUState {
+struct A9SCUState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -23,7 +24,8 @@ typedef struct A9SCUState {
     uint32_t control;
     uint32_t status;
     uint32_t num_cpu;
-} A9SCUState;
+};
+typedef struct A9SCUState A9SCUState;
 
 #define TYPE_A9_SCU "a9-scu"
 #define A9_SCU(obj) OBJECT_CHECK(A9SCUState, (obj), TYPE_A9_SCU)
diff --git a/include/hw/misc/allwinner-cpucfg.h b/include/hw/misc/allwinner-cpucfg.h
index 2c3693a8be..f5420b11d5 100644
--- a/include/hw/misc/allwinner-cpucfg.h
+++ b/include/hw/misc/allwinner-cpucfg.h
@@ -29,6 +29,7 @@
  */
 
 #define TYPE_AW_CPUCFG   "allwinner-cpucfg"
+typedef struct AwCpuCfgState AwCpuCfgState;
 #define AW_CPUCFG(obj) \
     OBJECT_CHECK(AwCpuCfgState, (obj), TYPE_AW_CPUCFG)
 
@@ -37,7 +38,7 @@
 /**
  * Allwinner CPU Configuration Module instance state
  */
-typedef struct AwCpuCfgState {
+struct AwCpuCfgState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -47,6 +48,6 @@ typedef struct AwCpuCfgState {
     uint32_t super_standby;
     uint32_t entry_addr;
 
-} AwCpuCfgState;
+};
 
 #endif /* HW_MISC_ALLWINNER_CPUCFG_H */
diff --git a/include/hw/misc/allwinner-h3-ccu.h b/include/hw/misc/allwinner-h3-ccu.h
index eec59649f3..60f0c56cd9 100644
--- a/include/hw/misc/allwinner-h3-ccu.h
+++ b/include/hw/misc/allwinner-h3-ccu.h
@@ -42,6 +42,7 @@
  */
 
 #define TYPE_AW_H3_CCU    "allwinner-h3-ccu"
+typedef struct AwH3ClockCtlState AwH3ClockCtlState;
 #define AW_H3_CCU(obj) \
     OBJECT_CHECK(AwH3ClockCtlState, (obj), TYPE_AW_H3_CCU)
 
@@ -50,7 +51,7 @@
 /**
  * Allwinner H3 CCU object instance state.
  */
-typedef struct AwH3ClockCtlState {
+struct AwH3ClockCtlState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -61,6 +62,6 @@ typedef struct AwH3ClockCtlState {
     /** Array of hardware registers */
     uint32_t regs[AW_H3_CCU_REGS_NUM];
 
-} AwH3ClockCtlState;
+};
 
 #endif /* HW_MISC_ALLWINNER_H3_CCU_H */
diff --git a/include/hw/misc/allwinner-h3-dramc.h b/include/hw/misc/allwinner-h3-dramc.h
index bacdf236b7..0538e598b0 100644
--- a/include/hw/misc/allwinner-h3-dramc.h
+++ b/include/hw/misc/allwinner-h3-dramc.h
@@ -58,6 +58,7 @@
  */
 
 #define TYPE_AW_H3_DRAMC "allwinner-h3-dramc"
+typedef struct AwH3DramCtlState AwH3DramCtlState;
 #define AW_H3_DRAMC(obj) \
     OBJECT_CHECK(AwH3DramCtlState, (obj), TYPE_AW_H3_DRAMC)
 
@@ -66,7 +67,7 @@
 /**
  * Allwinner H3 SDRAM Controller object instance state.
  */
-typedef struct AwH3DramCtlState {
+struct AwH3DramCtlState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -101,6 +102,6 @@ typedef struct AwH3DramCtlState {
 
     /** @} */
 
-} AwH3DramCtlState;
+};
 
 #endif /* HW_MISC_ALLWINNER_H3_DRAMC_H */
diff --git a/include/hw/misc/allwinner-h3-sysctrl.h b/include/hw/misc/allwinner-h3-sysctrl.h
index af4119e026..7360698f8f 100644
--- a/include/hw/misc/allwinner-h3-sysctrl.h
+++ b/include/hw/misc/allwinner-h3-sysctrl.h
@@ -43,6 +43,7 @@
  */
 
 #define TYPE_AW_H3_SYSCTRL    "allwinner-h3-sysctrl"
+typedef struct AwH3SysCtrlState AwH3SysCtrlState;
 #define AW_H3_SYSCTRL(obj) \
     OBJECT_CHECK(AwH3SysCtrlState, (obj), TYPE_AW_H3_SYSCTRL)
 
@@ -51,7 +52,7 @@
 /**
  * Allwinner H3 System Control object instance state
  */
-typedef struct AwH3SysCtrlState {
+struct AwH3SysCtrlState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -62,6 +63,6 @@ typedef struct AwH3SysCtrlState {
     /** Array of hardware registers */
     uint32_t regs[AW_H3_SYSCTRL_REGS_NUM];
 
-} AwH3SysCtrlState;
+};
 
 #endif /* HW_MISC_ALLWINNER_H3_SYSCTRL_H */
diff --git a/include/hw/misc/allwinner-sid.h b/include/hw/misc/allwinner-sid.h
index 4c1fa4762b..70cd7cc7c0 100644
--- a/include/hw/misc/allwinner-sid.h
+++ b/include/hw/misc/allwinner-sid.h
@@ -30,6 +30,7 @@
  */
 
 #define TYPE_AW_SID    "allwinner-sid"
+typedef struct AwSidState AwSidState;
 #define AW_SID(obj) \
     OBJECT_CHECK(AwSidState, (obj), TYPE_AW_SID)
 
@@ -38,7 +39,7 @@
 /**
  * Allwinner Security ID object instance state
  */
-typedef struct AwSidState {
+struct AwSidState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -55,6 +56,6 @@ typedef struct AwSidState {
     /** Stores the emulated device identifier */
     QemuUUID identifier;
 
-} AwSidState;
+};
 
 #endif /* HW_MISC_ALLWINNER_SID_H */
diff --git a/include/hw/misc/arm11scu.h b/include/hw/misc/arm11scu.h
index 5ad0f3d339..7e2e6d2b44 100644
--- a/include/hw/misc/arm11scu.h
+++ b/include/hw/misc/arm11scu.h
@@ -12,11 +12,13 @@
 #define HW_MISC_ARM11SCU_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_ARM11_SCU "arm11-scu"
+typedef struct ARM11SCUState ARM11SCUState;
 #define ARM11_SCU(obj) OBJECT_CHECK(ARM11SCUState, (obj), TYPE_ARM11_SCU)
 
-typedef struct ARM11SCUState {
+struct ARM11SCUState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -24,6 +26,6 @@ typedef struct ARM11SCUState {
     uint32_t control;
     uint32_t num_cpu;
     MemoryRegion iomem;
-} ARM11SCUState;
+};
 
 #endif
diff --git a/include/hw/misc/armsse-cpuid.h b/include/hw/misc/armsse-cpuid.h
index 0ef33fcaba..290a52cf10 100644
--- a/include/hw/misc/armsse-cpuid.h
+++ b/include/hw/misc/armsse-cpuid.h
@@ -23,11 +23,13 @@
 #define HW_MISC_ARMSSE_CPUID_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_ARMSSE_CPUID "armsse-cpuid"
+typedef struct ARMSSECPUID ARMSSECPUID;
 #define ARMSSE_CPUID(obj) OBJECT_CHECK(ARMSSECPUID, (obj), TYPE_ARMSSE_CPUID)
 
-typedef struct ARMSSECPUID {
+struct ARMSSECPUID {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -36,6 +38,6 @@ typedef struct ARMSSECPUID {
 
     /* Properties */
     uint32_t cpuid;
-} ARMSSECPUID;
+};
 
 #endif
diff --git a/include/hw/misc/armsse-mhu.h b/include/hw/misc/armsse-mhu.h
index cf5d8a73e6..d1ae4a463a 100644
--- a/include/hw/misc/armsse-mhu.h
+++ b/include/hw/misc/armsse-mhu.h
@@ -24,11 +24,13 @@
 #define HW_MISC_ARMSSE_MHU_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_ARMSSE_MHU "armsse-mhu"
+typedef struct ARMSSEMHU ARMSSEMHU;
 #define ARMSSE_MHU(obj) OBJECT_CHECK(ARMSSEMHU, (obj), TYPE_ARMSSE_MHU)
 
-typedef struct ARMSSEMHU {
+struct ARMSSEMHU {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -39,6 +41,6 @@ typedef struct ARMSSEMHU {
 
     uint32_t cpu0intr;
     uint32_t cpu1intr;
-} ARMSSEMHU;
+};
 
 #endif
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index a6739bb846..5e03f6db3a 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -12,8 +12,11 @@
 #define ASPEED_SCU_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_ASPEED_SCU "aspeed.scu"
+typedef struct AspeedSCUClass AspeedSCUClass;
+typedef struct AspeedSCUState AspeedSCUState;
 #define ASPEED_SCU(obj) OBJECT_CHECK(AspeedSCUState, (obj), TYPE_ASPEED_SCU)
 #define TYPE_ASPEED_2400_SCU TYPE_ASPEED_SCU "-ast2400"
 #define TYPE_ASPEED_2500_SCU TYPE_ASPEED_SCU "-ast2500"
@@ -22,7 +25,7 @@
 #define ASPEED_SCU_NR_REGS (0x1A8 >> 2)
 #define ASPEED_AST2600_SCU_NR_REGS (0xE20 >> 2)
 
-typedef struct AspeedSCUState {
+struct AspeedSCUState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -34,7 +37,7 @@ typedef struct AspeedSCUState {
     uint32_t hw_strap1;
     uint32_t hw_strap2;
     uint32_t hw_prot_key;
-} AspeedSCUState;
+};
 
 #define AST2400_A0_SILICON_REV   0x02000303U
 #define AST2400_A1_SILICON_REV   0x02010303U
@@ -52,7 +55,7 @@ extern bool is_supported_silicon_rev(uint32_t silicon_rev);
 #define ASPEED_SCU_GET_CLASS(obj) \
      OBJECT_GET_CLASS(AspeedSCUClass, (obj), TYPE_ASPEED_SCU)
 
-typedef struct  AspeedSCUClass {
+struct AspeedSCUClass {
     SysBusDeviceClass parent_class;
 
     const uint32_t *resets;
@@ -60,7 +63,7 @@ typedef struct  AspeedSCUClass {
     uint32_t apb_divider;
     uint32_t nr_regs;
     const MemoryRegionOps *ops;
-}  AspeedSCUClass;
+};
 
 #define ASPEED_SCU_PROT_KEY      0x1688A8A8
 
diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
index cea1e67fe3..8ee5e8e483 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -10,8 +10,11 @@
 #define ASPEED_SDMC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_ASPEED_SDMC "aspeed.sdmc"
+typedef struct AspeedSDMCClass AspeedSDMCClass;
+typedef struct AspeedSDMCState AspeedSDMCState;
 #define ASPEED_SDMC(obj) OBJECT_CHECK(AspeedSDMCState, (obj), TYPE_ASPEED_SDMC)
 #define TYPE_ASPEED_2400_SDMC TYPE_ASPEED_SDMC "-ast2400"
 #define TYPE_ASPEED_2500_SDMC TYPE_ASPEED_SDMC "-ast2500"
@@ -19,7 +22,7 @@
 
 #define ASPEED_SDMC_NR_REGS (0x174 >> 2)
 
-typedef struct AspeedSDMCState {
+struct AspeedSDMCState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -29,20 +32,20 @@ typedef struct AspeedSDMCState {
     uint32_t regs[ASPEED_SDMC_NR_REGS];
     uint64_t ram_size;
     uint64_t max_ram_size;
-} AspeedSDMCState;
+};
 
 #define ASPEED_SDMC_CLASS(klass) \
      OBJECT_CLASS_CHECK(AspeedSDMCClass, (klass), TYPE_ASPEED_SDMC)
 #define ASPEED_SDMC_GET_CLASS(obj) \
      OBJECT_GET_CLASS(AspeedSDMCClass, (obj), TYPE_ASPEED_SDMC)
 
-typedef struct AspeedSDMCClass {
+struct AspeedSDMCClass {
     SysBusDeviceClass parent_class;
 
     uint64_t max_ram_size;
     const uint64_t *valid_ram_sizes;
     uint32_t (*compute_conf)(AspeedSDMCState *s, uint32_t data);
     void (*write)(AspeedSDMCState *s, uint32_t reg, uint32_t data);
-} AspeedSDMCClass;
+};
 
 #endif /* ASPEED_SDMC_H */
diff --git a/include/hw/misc/aspeed_xdma.h b/include/hw/misc/aspeed_xdma.h
index 00b45d931f..e5177e2c02 100644
--- a/include/hw/misc/aspeed_xdma.h
+++ b/include/hw/misc/aspeed_xdma.h
@@ -10,14 +10,16 @@
 #define ASPEED_XDMA_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_ASPEED_XDMA "aspeed.xdma"
+typedef struct AspeedXDMAState AspeedXDMAState;
 #define ASPEED_XDMA(obj) OBJECT_CHECK(AspeedXDMAState, (obj), TYPE_ASPEED_XDMA)
 
 #define ASPEED_XDMA_NUM_REGS (ASPEED_XDMA_REG_SIZE / sizeof(uint32_t))
 #define ASPEED_XDMA_REG_SIZE 0x7C
 
-typedef struct AspeedXDMAState {
+struct AspeedXDMAState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
@@ -25,6 +27,6 @@ typedef struct AspeedXDMAState {
 
     char bmc_cmdq_readp_set;
     uint32_t regs[ASPEED_XDMA_NUM_REGS];
-} AspeedXDMAState;
+};
 
 #endif /* ASPEED_XDMA_H */
diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
index 041edfc9e9..f24f2fd789 100644
--- a/include/hw/misc/auxbus.h
+++ b/include/hw/misc/auxbus.h
@@ -27,6 +27,7 @@
 
 #include "exec/memory.h"
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 typedef struct AUXBus AUXBus;
 typedef struct AUXSlave AUXSlave;
diff --git a/include/hw/misc/avr_power.h b/include/hw/misc/avr_power.h
index e08e44f629..c230a2655c 100644
--- a/include/hw/misc/avr_power.h
+++ b/include/hw/misc/avr_power.h
@@ -27,12 +27,14 @@
 
 #include "hw/sysbus.h"
 #include "hw/hw.h"
+#include "qom/object.h"
 
 
 #define TYPE_AVR_MASK "avr-power"
+typedef struct AVRMaskState AVRMaskState;
 #define AVR_MASK(obj) OBJECT_CHECK(AVRMaskState, (obj), TYPE_AVR_MASK)
 
-typedef struct {
+struct AVRMaskState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -41,6 +43,6 @@ typedef struct {
 
     uint8_t val;
     qemu_irq irq[8];
-} AVRMaskState;
+};
 
 #endif /* HW_MISC_AVR_POWER_H */
diff --git a/include/hw/misc/bcm2835_mbox.h b/include/hw/misc/bcm2835_mbox.h
index 57f95cc35e..3ec6a2f0e8 100644
--- a/include/hw/misc/bcm2835_mbox.h
+++ b/include/hw/misc/bcm2835_mbox.h
@@ -10,8 +10,10 @@
 
 #include "bcm2835_mbox_defs.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_BCM2835_MBOX "bcm2835-mbox"
+typedef struct BCM2835MboxState BCM2835MboxState;
 #define BCM2835_MBOX(obj) \
         OBJECT_CHECK(BCM2835MboxState, (obj), TYPE_BCM2835_MBOX)
 
@@ -22,7 +24,7 @@ typedef struct {
     uint32_t config;
 } BCM2835Mbox;
 
-typedef struct {
+struct BCM2835MboxState {
     /*< private >*/
     SysBusDevice busdev;
     /*< public >*/
@@ -34,6 +36,6 @@ typedef struct {
     bool mbox_irq_disabled;
     bool available[MBOX_CHAN_COUNT];
     BCM2835Mbox mbox[2];
-} BCM2835MboxState;
+};
 
 #endif
diff --git a/include/hw/misc/bcm2835_mphi.h b/include/hw/misc/bcm2835_mphi.h
index e084314d0f..ce1c273cfb 100644
--- a/include/hw/misc/bcm2835_mphi.h
+++ b/include/hw/misc/bcm2835_mphi.h
@@ -19,6 +19,7 @@
 
 #include "hw/irq.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define MPHI_MMIO_SIZE      0x1000
 
diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_property.h
index b321f22499..28bf2b49b6 100644
--- a/include/hw/misc/bcm2835_property.h
+++ b/include/hw/misc/bcm2835_property.h
@@ -11,12 +11,14 @@
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "hw/display/bcm2835_fb.h"
+#include "qom/object.h"
 
 #define TYPE_BCM2835_PROPERTY "bcm2835-property"
+typedef struct BCM2835PropertyState BCM2835PropertyState;
 #define BCM2835_PROPERTY(obj) \
         OBJECT_CHECK(BCM2835PropertyState, (obj), TYPE_BCM2835_PROPERTY)
 
-typedef struct {
+struct BCM2835PropertyState {
     /*< private >*/
     SysBusDevice busdev;
     /*< public >*/
@@ -31,6 +33,6 @@ typedef struct {
     uint32_t board_rev;
     uint32_t addr;
     bool pending;
-} BCM2835PropertyState;
+};
 
 #endif
diff --git a/include/hw/misc/bcm2835_rng.h b/include/hw/misc/bcm2835_rng.h
index 41a531bce7..0921d9b3f1 100644
--- a/include/hw/misc/bcm2835_rng.h
+++ b/include/hw/misc/bcm2835_rng.h
@@ -11,17 +11,19 @@
 #define BCM2835_RNG_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_BCM2835_RNG "bcm2835-rng"
+typedef struct BCM2835RngState BCM2835RngState;
 #define BCM2835_RNG(obj) \
         OBJECT_CHECK(BCM2835RngState, (obj), TYPE_BCM2835_RNG)
 
-typedef struct {
+struct BCM2835RngState {
     SysBusDevice busdev;
     MemoryRegion iomem;
 
     uint32_t rng_ctrl;
     uint32_t rng_status;
-} BCM2835RngState;
+};
 
 #endif
diff --git a/include/hw/misc/bcm2835_thermal.h b/include/hw/misc/bcm2835_thermal.h
index c3651b27ec..2b937527eb 100644
--- a/include/hw/misc/bcm2835_thermal.h
+++ b/include/hw/misc/bcm2835_thermal.h
@@ -10,18 +10,20 @@
 #define HW_MISC_BCM2835_THERMAL_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_BCM2835_THERMAL "bcm2835-thermal"
 
+typedef struct Bcm2835ThermalState Bcm2835ThermalState;
 #define BCM2835_THERMAL(obj) \
     OBJECT_CHECK(Bcm2835ThermalState, (obj), TYPE_BCM2835_THERMAL)
 
-typedef struct {
+struct Bcm2835ThermalState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
     MemoryRegion iomem;
     uint32_t ctl;
-} Bcm2835ThermalState;
+};
 
 #endif
diff --git a/include/hw/misc/grlib_ahb_apb_pnp.h b/include/hw/misc/grlib_ahb_apb_pnp.h
index a0f6dcfda7..427606fd6b 100644
--- a/include/hw/misc/grlib_ahb_apb_pnp.h
+++ b/include/hw/misc/grlib_ahb_apb_pnp.h
@@ -23,16 +23,17 @@
 
 #ifndef GRLIB_AHB_APB_PNP_H
 #define GRLIB_AHB_APB_PNP_H
+#include "qom/object.h"
 
 #define TYPE_GRLIB_AHB_PNP "grlib,ahbpnp"
+typedef struct AHBPnp AHBPnp;
 #define GRLIB_AHB_PNP(obj) \
     OBJECT_CHECK(AHBPnp, (obj), TYPE_GRLIB_AHB_PNP)
-typedef struct AHBPnp AHBPnp;
 
 #define TYPE_GRLIB_APB_PNP "grlib,apbpnp"
+typedef struct APBPnp APBPnp;
 #define GRLIB_APB_PNP(obj) \
     OBJECT_CHECK(APBPnp, (obj), TYPE_GRLIB_APB_PNP)
-typedef struct APBPnp APBPnp;
 
 void grlib_ahb_pnp_add_entry(AHBPnp *dev, uint32_t address, uint32_t mask,
                              uint8_t vendor, uint16_t device, int slave,
diff --git a/include/hw/misc/imx25_ccm.h b/include/hw/misc/imx25_ccm.h
index 296321c612..8a7a9b675f 100644
--- a/include/hw/misc/imx25_ccm.h
+++ b/include/hw/misc/imx25_ccm.h
@@ -12,6 +12,7 @@
 #define IMX25_CCM_H
 
 #include "hw/misc/imx_ccm.h"
+#include "qom/object.h"
 
 #define IMX25_CCM_MPCTL_REG  0
 #define IMX25_CCM_UPCTL_REG  1
@@ -63,9 +64,10 @@
                              CCTL_##name##_SHIFT)
 
 #define TYPE_IMX25_CCM "imx25.ccm"
+typedef struct IMX25CCMState IMX25CCMState;
 #define IMX25_CCM(obj) OBJECT_CHECK(IMX25CCMState, (obj), TYPE_IMX25_CCM)
 
-typedef struct IMX25CCMState {
+struct IMX25CCMState {
     /* <private> */
     IMXCCMState parent_obj;
 
@@ -74,6 +76,6 @@ typedef struct IMX25CCMState {
 
     uint32_t reg[IMX25_CCM_MAX_REG];
 
-} IMX25CCMState;
+};
 
 #endif /* IMX25_CCM_H */
diff --git a/include/hw/misc/imx31_ccm.h b/include/hw/misc/imx31_ccm.h
index c376fad14c..a56ee992af 100644
--- a/include/hw/misc/imx31_ccm.h
+++ b/include/hw/misc/imx31_ccm.h
@@ -12,6 +12,7 @@
 #define IMX31_CCM_H
 
 #include "hw/misc/imx_ccm.h"
+#include "qom/object.h"
 
 #define IMX31_CCM_CCMR_REG  0
 #define IMX31_CCM_PDR0_REG  1
@@ -72,9 +73,10 @@
                              PDR0_##name##_PODF_SHIFT)
 
 #define TYPE_IMX31_CCM "imx31.ccm"
+typedef struct IMX31CCMState IMX31CCMState;
 #define IMX31_CCM(obj) OBJECT_CHECK(IMX31CCMState, (obj), TYPE_IMX31_CCM)
 
-typedef struct IMX31CCMState {
+struct IMX31CCMState {
     /* <private> */
     IMXCCMState parent_obj;
 
@@ -83,6 +85,6 @@ typedef struct IMX31CCMState {
 
     uint32_t reg[IMX31_CCM_MAX_REG];
 
-} IMX31CCMState;
+};
 
 #endif /* IMX31_CCM_H */
diff --git a/include/hw/misc/imx6_ccm.h b/include/hw/misc/imx6_ccm.h
index 80505809b4..affa13087e 100644
--- a/include/hw/misc/imx6_ccm.h
+++ b/include/hw/misc/imx6_ccm.h
@@ -13,6 +13,7 @@
 
 #include "hw/misc/imx_ccm.h"
 #include "qemu/bitops.h"
+#include "qom/object.h"
 
 #define CCM_CCR 0
 #define CCM_CCDR 1
@@ -178,9 +179,10 @@
 #define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)
 
 #define TYPE_IMX6_CCM "imx6.ccm"
+typedef struct IMX6CCMState IMX6CCMState;
 #define IMX6_CCM(obj) OBJECT_CHECK(IMX6CCMState, (obj), TYPE_IMX6_CCM)
 
-typedef struct IMX6CCMState {
+struct IMX6CCMState {
     /* <private> */
     IMXCCMState parent_obj;
 
@@ -192,6 +194,6 @@ typedef struct IMX6CCMState {
     uint32_t ccm[CCM_MAX];
     uint32_t analog[CCM_ANALOG_MAX];
 
-} IMX6CCMState;
+};
 
 #endif /* IMX6_CCM_H */
diff --git a/include/hw/misc/imx6_src.h b/include/hw/misc/imx6_src.h
index eb3640732e..f1d70ec177 100644
--- a/include/hw/misc/imx6_src.h
+++ b/include/hw/misc/imx6_src.h
@@ -13,6 +13,7 @@
 
 #include "hw/sysbus.h"
 #include "qemu/bitops.h"
+#include "qom/object.h"
 
 #define SRC_SCR 0
 #define SRC_SBMR1 1
@@ -57,9 +58,10 @@
 #define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)
 
 #define TYPE_IMX6_SRC "imx6.src"
+typedef struct IMX6SRCState IMX6SRCState;
 #define IMX6_SRC(obj) OBJECT_CHECK(IMX6SRCState, (obj), TYPE_IMX6_SRC)
 
-typedef struct IMX6SRCState {
+struct IMX6SRCState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -68,6 +70,6 @@ typedef struct IMX6SRCState {
 
     uint32_t regs[SRC_MAX];
 
-} IMX6SRCState;
+};
 
 #endif /* IMX6_SRC_H */
diff --git a/include/hw/misc/imx6ul_ccm.h b/include/hw/misc/imx6ul_ccm.h
index 377ddca244..2304c6e738 100644
--- a/include/hw/misc/imx6ul_ccm.h
+++ b/include/hw/misc/imx6ul_ccm.h
@@ -12,6 +12,7 @@
 
 #include "hw/misc/imx_ccm.h"
 #include "qemu/bitops.h"
+#include "qom/object.h"
 
 #define CCM_CCR 0
 #define CCM_CCDR 1
@@ -207,9 +208,10 @@
 #define CCM_ANALOG_PLL_LOCK      (1 << 31);
 
 #define TYPE_IMX6UL_CCM "imx6ul.ccm"
+typedef struct IMX6ULCCMState IMX6ULCCMState;
 #define IMX6UL_CCM(obj) OBJECT_CHECK(IMX6ULCCMState, (obj), TYPE_IMX6UL_CCM)
 
-typedef struct IMX6ULCCMState {
+struct IMX6ULCCMState {
     /* <private> */
     IMXCCMState parent_obj;
 
@@ -221,6 +223,6 @@ typedef struct IMX6ULCCMState {
     uint32_t ccm[CCM_MAX];
     uint32_t analog[CCM_ANALOG_MAX];
 
-} IMX6ULCCMState;
+};
 
 #endif /* IMX6UL_CCM_H */
diff --git a/include/hw/misc/imx7_ccm.h b/include/hw/misc/imx7_ccm.h
index 9538f37d98..9e9e58a5c2 100644
--- a/include/hw/misc/imx7_ccm.h
+++ b/include/hw/misc/imx7_ccm.h
@@ -14,6 +14,7 @@
 
 #include "hw/misc/imx_ccm.h"
 #include "qemu/bitops.h"
+#include "qom/object.h"
 
 enum IMX7AnalogRegisters {
     ANALOG_PLL_ARM,
@@ -104,9 +105,10 @@ enum IMX7PMURegisters {
 };
 
 #define TYPE_IMX7_CCM "imx7.ccm"
+typedef struct IMX7CCMState IMX7CCMState;
 #define IMX7_CCM(obj) OBJECT_CHECK(IMX7CCMState, (obj), TYPE_IMX7_CCM)
 
-typedef struct IMX7CCMState {
+struct IMX7CCMState {
     /* <private> */
     IMXCCMState parent_obj;
 
@@ -114,13 +116,14 @@ typedef struct IMX7CCMState {
     MemoryRegion iomem;
 
     uint32_t ccm[CCM_MAX];
-} IMX7CCMState;
+};
 
 
 #define TYPE_IMX7_ANALOG "imx7.analog"
+typedef struct IMX7AnalogState IMX7AnalogState;
 #define IMX7_ANALOG(obj) OBJECT_CHECK(IMX7AnalogState, (obj), TYPE_IMX7_ANALOG)
 
-typedef struct IMX7AnalogState {
+struct IMX7AnalogState {
     /* <private> */
     IMXCCMState parent_obj;
 
@@ -134,6 +137,6 @@ typedef struct IMX7AnalogState {
 
     uint32_t analog[ANALOG_MAX];
     uint32_t pmu[PMU_MAX];
-} IMX7AnalogState;
+};
 
 #endif /* IMX7_CCM_H */
diff --git a/include/hw/misc/imx7_gpr.h b/include/hw/misc/imx7_gpr.h
index e19373d274..83384ec0cc 100644
--- a/include/hw/misc/imx7_gpr.h
+++ b/include/hw/misc/imx7_gpr.h
@@ -14,15 +14,17 @@
 
 #include "qemu/bitops.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_IMX7_GPR "imx7.gpr"
+typedef struct IMX7GPRState IMX7GPRState;
 #define IMX7_GPR(obj) OBJECT_CHECK(IMX7GPRState, (obj), TYPE_IMX7_GPR)
 
-typedef struct IMX7GPRState {
+struct IMX7GPRState {
     /* <private> */
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
-} IMX7GPRState;
+};
 
 #endif /* IMX7_GPR_H */
diff --git a/include/hw/misc/imx7_snvs.h b/include/hw/misc/imx7_snvs.h
index 255f8f26f9..f8659acb7d 100644
--- a/include/hw/misc/imx7_snvs.h
+++ b/include/hw/misc/imx7_snvs.h
@@ -14,6 +14,7 @@
 
 #include "qemu/bitops.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 
 enum IMX7SNVSRegisters {
@@ -23,13 +24,14 @@ enum IMX7SNVSRegisters {
 };
 
 #define TYPE_IMX7_SNVS "imx7.snvs"
+typedef struct IMX7SNVSState IMX7SNVSState;
 #define IMX7_SNVS(obj) OBJECT_CHECK(IMX7SNVSState, (obj), TYPE_IMX7_SNVS)
 
-typedef struct IMX7SNVSState {
+struct IMX7SNVSState {
     /* <private> */
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
-} IMX7SNVSState;
+};
 
 #endif /* IMX7_SNVS_H */
diff --git a/include/hw/misc/imx_ccm.h b/include/hw/misc/imx_ccm.h
index efdc451eb0..174248e5df 100644
--- a/include/hw/misc/imx_ccm.h
+++ b/include/hw/misc/imx_ccm.h
@@ -12,6 +12,7 @@
 #define IMX_CCM_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define CKIL_FREQ 32768 /* nominal 32khz clock */
 
@@ -27,6 +28,8 @@
 #define PLL_MFN(x)              (((x) & 0x3ff) << 0)
 
 #define TYPE_IMX_CCM "imx.ccm"
+typedef struct IMXCCMClass IMXCCMClass;
+typedef struct IMXCCMState IMXCCMState;
 #define IMX_CCM(obj) \
      OBJECT_CHECK(IMXCCMState, (obj), TYPE_IMX_CCM)
 #define IMX_CCM_CLASS(klass) \
@@ -34,13 +37,13 @@
 #define IMX_CCM_GET_CLASS(obj) \
      OBJECT_GET_CLASS(IMXCCMClass, (obj), TYPE_IMX_CCM)
 
-typedef struct IMXCCMState {
+struct IMXCCMState {
     /* <private> */
     SysBusDevice parent_obj;
 
     /* <public> */
 
-} IMXCCMState;
+};
 
 typedef enum  {
     CLK_NONE,
@@ -52,13 +55,13 @@ typedef enum  {
     CLK_HIGH,
 } IMXClk;
 
-typedef struct IMXCCMClass {
+struct IMXCCMClass {
     /* <private> */
     SysBusDeviceClass parent_class;
 
     /* <public> */
     uint32_t (*get_clock_frequency)(IMXCCMState *s, IMXClk clk);
-} IMXCCMClass;
+};
 
 uint32_t imx_ccm_calc_pll(uint32_t pllreg, uint32_t base_freq);
 
diff --git a/include/hw/misc/imx_rngc.h b/include/hw/misc/imx_rngc.h
index f0d2b44d4f..cd7ba8f91e 100644
--- a/include/hw/misc/imx_rngc.h
+++ b/include/hw/misc/imx_rngc.h
@@ -11,11 +11,13 @@
 #define IMX_RNGC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_IMX_RNGC "imx.rngc"
+typedef struct IMXRNGCState IMXRNGCState;
 #define IMX_RNGC(obj) OBJECT_CHECK(IMXRNGCState, (obj), TYPE_IMX_RNGC)
 
-typedef struct IMXRNGCState {
+struct IMXRNGCState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -30,6 +32,6 @@ typedef struct IMXRNGCState {
     QEMUBH *self_test_bh;
     QEMUBH *seed_bh;
     qemu_irq irq;
-} IMXRNGCState;
+};
 
 #endif /* IMX_RNGC_H */
diff --git a/include/hw/misc/iotkit-secctl.h b/include/hw/misc/iotkit-secctl.h
index bcb0437be5..3d54d8f3de 100644
--- a/include/hw/misc/iotkit-secctl.h
+++ b/include/hw/misc/iotkit-secctl.h
@@ -56,8 +56,10 @@
 #define IOTKIT_SECCTL_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_IOTKIT_SECCTL "iotkit-secctl"
+typedef struct IoTKitSecCtl IoTKitSecCtl;
 #define IOTKIT_SECCTL(obj) OBJECT_CHECK(IoTKitSecCtl, (obj), TYPE_IOTKIT_SECCTL)
 
 #define IOTS_APB_PPC0_NUM_PORTS 3
@@ -70,7 +72,6 @@
 #define IOTS_NUM_MPC 4
 #define IOTS_NUM_EXP_MSC 16
 
-typedef struct IoTKitSecCtl IoTKitSecCtl;
 
 /* State and IRQ lines relating to a PPC. For the
  * PPCs in the IoTKit not all the IRQ lines are used.
diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
index 601c8ecc0d..27fe6346e6 100644
--- a/include/hw/misc/iotkit-sysctl.h
+++ b/include/hw/misc/iotkit-sysctl.h
@@ -28,12 +28,14 @@
 #define HW_MISC_IOTKIT_SYSCTL_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_IOTKIT_SYSCTL "iotkit-sysctl"
+typedef struct IoTKitSysCtl IoTKitSysCtl;
 #define IOTKIT_SYSCTL(obj) OBJECT_CHECK(IoTKitSysCtl, (obj), \
                                         TYPE_IOTKIT_SYSCTL)
 
-typedef struct IoTKitSysCtl {
+struct IoTKitSysCtl {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -67,6 +69,6 @@ typedef struct IoTKitSysCtl {
     uint32_t initsvtor1_rst;
 
     bool is_sse200;
-} IoTKitSysCtl;
+};
 
 #endif
diff --git a/include/hw/misc/iotkit-sysinfo.h b/include/hw/misc/iotkit-sysinfo.h
index d84eb203b9..e0e610c75c 100644
--- a/include/hw/misc/iotkit-sysinfo.h
+++ b/include/hw/misc/iotkit-sysinfo.h
@@ -23,12 +23,14 @@
 #define HW_MISC_IOTKIT_SYSINFO_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_IOTKIT_SYSINFO "iotkit-sysinfo"
+typedef struct IoTKitSysInfo IoTKitSysInfo;
 #define IOTKIT_SYSINFO(obj) OBJECT_CHECK(IoTKitSysInfo, (obj), \
                                         TYPE_IOTKIT_SYSINFO)
 
-typedef struct IoTKitSysInfo {
+struct IoTKitSysInfo {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -38,6 +40,6 @@ typedef struct IoTKitSysInfo {
     /* Properties */
     uint32_t sys_version;
     uint32_t sys_config;
-} IoTKitSysInfo;
+};
 
 #endif
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 0be05d649b..a59750634f 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -12,6 +12,7 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 #include "hw/misc/mos6522.h"
+#include "qom/object.h"
 
 
 /* VIA 1 */
@@ -31,10 +32,11 @@
 
 
 #define TYPE_MOS6522_Q800_VIA1 "mos6522-q800-via1"
+typedef struct MOS6522Q800VIA1State MOS6522Q800VIA1State;
 #define MOS6522_Q800_VIA1(obj)  OBJECT_CHECK(MOS6522Q800VIA1State, (obj), \
                                     TYPE_MOS6522_Q800_VIA1)
 
-typedef struct MOS6522Q800VIA1State {
+struct MOS6522Q800VIA1State {
     /*< private >*/
     MOS6522State parent_obj;
 
@@ -47,7 +49,7 @@ typedef struct MOS6522Q800VIA1State {
     int64_t next_second;
     QEMUTimer *VBL_timer;
     int64_t next_VBL;
-} MOS6522Q800VIA1State;
+};
 
 
 /* VIA 2 */
@@ -66,19 +68,21 @@ typedef struct MOS6522Q800VIA1State {
 #define VIA2_IRQ_ASC        (1 << VIA2_IRQ_ASC_BIT)
 
 #define TYPE_MOS6522_Q800_VIA2 "mos6522-q800-via2"
+typedef struct MOS6522Q800VIA2State MOS6522Q800VIA2State;
 #define MOS6522_Q800_VIA2(obj)  OBJECT_CHECK(MOS6522Q800VIA2State, (obj), \
                                     TYPE_MOS6522_Q800_VIA2)
 
-typedef struct MOS6522Q800VIA2State {
+struct MOS6522Q800VIA2State {
     /*< private >*/
     MOS6522State parent_obj;
-} MOS6522Q800VIA2State;
+};
 
 
 #define TYPE_MAC_VIA "mac_via"
+typedef struct MacVIAState MacVIAState;
 #define MAC_VIA(obj)   OBJECT_CHECK(MacVIAState, (obj), TYPE_MAC_VIA)
 
-typedef struct MacVIAState {
+struct MacVIAState {
     SysBusDevice busdev;
 
     VMChangeStateEntry *vmstate;
@@ -113,6 +117,6 @@ typedef struct MacVIAState {
     uint8_t adb_data_in[128];
     uint8_t adb_data_out[16];
     uint8_t adb_autopoll_cmd;
-} MacVIAState;
+};
 
 #endif
diff --git a/include/hw/misc/macio/cuda.h b/include/hw/misc/macio/cuda.h
index a8cf0be1ec..f2b0069262 100644
--- a/include/hw/misc/macio/cuda.h
+++ b/include/hw/misc/macio/cuda.h
@@ -27,6 +27,7 @@
 #define CUDA_H
 
 #include "hw/misc/mos6522.h"
+#include "qom/object.h"
 
 /* CUDA commands (2nd byte) */
 #define CUDA_WARM_START                0x0
@@ -58,10 +59,11 @@
 
 
 /* MOS6522 CUDA */
-typedef struct MOS6522CUDAState {
+struct MOS6522CUDAState {
     /*< private >*/
     MOS6522State parent_obj;
-} MOS6522CUDAState;
+};
+typedef struct MOS6522CUDAState MOS6522CUDAState;
 
 #define TYPE_MOS6522_CUDA "mos6522-cuda"
 #define MOS6522_CUDA(obj) OBJECT_CHECK(MOS6522CUDAState, (obj), \
@@ -69,9 +71,10 @@ typedef struct MOS6522CUDAState {
 
 /* Cuda */
 #define TYPE_CUDA "cuda"
+typedef struct CUDAState CUDAState;
 #define CUDA(obj) OBJECT_CHECK(CUDAState, (obj), TYPE_CUDA)
 
-typedef struct CUDAState {
+struct CUDAState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -97,6 +100,6 @@ typedef struct CUDAState {
     qemu_irq irq;
     uint8_t data_in[128];
     uint8_t data_out[16];
-} CUDAState;
+};
 
 #endif /* CUDA_H */
diff --git a/include/hw/misc/macio/gpio.h b/include/hw/misc/macio/gpio.h
index 24a4364b39..2234873250 100644
--- a/include/hw/misc/macio/gpio.h
+++ b/include/hw/misc/macio/gpio.h
@@ -28,11 +28,13 @@
 
 #include "hw/ppc/openpic.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_MACIO_GPIO "macio-gpio"
+typedef struct MacIOGPIOState MacIOGPIOState;
 #define MACIO_GPIO(obj) OBJECT_CHECK(MacIOGPIOState, (obj), TYPE_MACIO_GPIO)
 
-typedef struct MacIOGPIOState {
+struct MacIOGPIOState {
     /*< private >*/
     SysBusDevice parent;
     /*< public >*/
@@ -43,7 +45,7 @@ typedef struct MacIOGPIOState {
     qemu_irq gpio_extirqs[10];
     uint8_t gpio_levels[8];
     uint8_t gpio_regs[36]; /* XXX Check count */
-} MacIOGPIOState;
+};
 
 void macio_set_gpio(MacIOGPIOState *s, uint32_t gpio, bool state);
 
diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
index 87335a991c..81c28eeef7 100644
--- a/include/hw/misc/macio/macio.h
+++ b/include/hw/misc/macio/macio.h
@@ -36,21 +36,24 @@
 #include "hw/ppc/mac.h"
 #include "hw/ppc/mac_dbdma.h"
 #include "hw/ppc/openpic.h"
+#include "qom/object.h"
 
 /* MacIO virtual bus */
 #define TYPE_MACIO_BUS "macio-bus"
+typedef struct MacIOBusState MacIOBusState;
 #define MACIO_BUS(obj) OBJECT_CHECK(MacIOBusState, (obj), TYPE_MACIO_BUS)
 
-typedef struct MacIOBusState {
+struct MacIOBusState {
     /*< private >*/
     BusState parent_obj;
-} MacIOBusState;
+};
 
 /* MacIO IDE */
 #define TYPE_MACIO_IDE "macio-ide"
+typedef struct MACIOIDEState MACIOIDEState;
 #define MACIO_IDE(obj) OBJECT_CHECK(MACIOIDEState, (obj), TYPE_MACIO_IDE)
 
-typedef struct MACIOIDEState {
+struct MACIOIDEState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -68,15 +71,16 @@ typedef struct MACIOIDEState {
     bool dma_active;
     uint32_t timing_reg;
     uint32_t irq_reg;
-} MACIOIDEState;
+};
 
 void macio_ide_init_drives(MACIOIDEState *ide, DriveInfo **hd_table);
 void macio_ide_register_dma(MACIOIDEState *ide);
 
 #define TYPE_MACIO "macio"
+typedef struct MacIOState MacIOState;
 #define MACIO(obj) OBJECT_CHECK(MacIOState, (obj), TYPE_MACIO)
 
-typedef struct MacIOState {
+struct MacIOState {
     /*< private >*/
     PCIDevice parent;
     /*< public >*/
@@ -88,13 +92,14 @@ typedef struct MacIOState {
     DBDMAState dbdma;
     ESCCState escc;
     uint64_t frequency;
-} MacIOState;
+};
 
 #define TYPE_OLDWORLD_MACIO "macio-oldworld"
+typedef struct OldWorldMacIOState OldWorldMacIOState;
 #define OLDWORLD_MACIO(obj) \
     OBJECT_CHECK(OldWorldMacIOState, (obj), TYPE_OLDWORLD_MACIO)
 
-typedef struct OldWorldMacIOState {
+struct OldWorldMacIOState {
     /*< private >*/
     MacIOState parent_obj;
     /*< public >*/
@@ -103,13 +108,14 @@ typedef struct OldWorldMacIOState {
 
     MacIONVRAMState nvram;
     MACIOIDEState ide[2];
-} OldWorldMacIOState;
+};
 
 #define TYPE_NEWWORLD_MACIO "macio-newworld"
+typedef struct NewWorldMacIOState NewWorldMacIOState;
 #define NEWWORLD_MACIO(obj) \
     OBJECT_CHECK(NewWorldMacIOState, (obj), TYPE_NEWWORLD_MACIO)
 
-typedef struct NewWorldMacIOState {
+struct NewWorldMacIOState {
     /*< private >*/
     MacIOState parent_obj;
     /*< public >*/
@@ -119,6 +125,6 @@ typedef struct NewWorldMacIOState {
     OpenPICState *pic;
     MACIOIDEState ide[2];
     MacIOGPIOState gpio;
-} NewWorldMacIOState;
+};
 
 #endif /* MACIO_H */
diff --git a/include/hw/misc/macio/pmu.h b/include/hw/misc/macio/pmu.h
index 72f75612b6..b3982f6f32 100644
--- a/include/hw/misc/macio/pmu.h
+++ b/include/hw/misc/macio/pmu.h
@@ -12,6 +12,7 @@
 
 #include "hw/misc/mos6522.h"
 #include "hw/misc/macio/gpio.h"
+#include "qom/object.h"
 
 /*
  * PMU commands
@@ -173,10 +174,11 @@ typedef enum {
 } PMUCmdState;
 
 /* MOS6522 PMU */
-typedef struct MOS6522PMUState {
+struct MOS6522PMUState {
     /*< private >*/
     MOS6522State parent_obj;
-} MOS6522PMUState;
+};
+typedef struct MOS6522PMUState MOS6522PMUState;
 
 #define TYPE_MOS6522_PMU "mos6522-pmu"
 #define MOS6522_PMU(obj) OBJECT_CHECK(MOS6522PMUState, (obj), \
@@ -186,7 +188,7 @@ typedef struct MOS6522PMUState {
  * @last_b: last value of B register
  */
 
-typedef struct PMUState {
+struct PMUState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -228,7 +230,8 @@ typedef struct PMUState {
 
     /* GPIO */
     MacIOGPIOState *gpio;
-} PMUState;
+};
+typedef struct PMUState PMUState;
 
 #define TYPE_VIA_PMU "via-pmu"
 #define VIA_PMU(obj) OBJECT_CHECK(PMUState, (obj), TYPE_VIA_PMU)
diff --git a/include/hw/misc/max111x.h b/include/hw/misc/max111x.h
index af7f1017ef..e903a1af9c 100644
--- a/include/hw/misc/max111x.h
+++ b/include/hw/misc/max111x.h
@@ -14,6 +14,7 @@
 #define HW_MISC_MAX111X_H
 
 #include "hw/ssi/ssi.h"
+#include "qom/object.h"
 
 /*
  * This is a model of the Maxim MAX1110/1111 ADC chip, which for QEMU
@@ -31,7 +32,7 @@
  *  + the interrupt line is not correctly implemented, and will never
  *    be lowered once it has been asserted.
  */
-typedef struct {
+struct MAX111xState {
     SSISlave parent_obj;
 
     qemu_irq interrupt;
@@ -43,7 +44,8 @@ typedef struct {
 
     uint8_t input[8];
     int inputs, com;
-} MAX111xState;
+};
+typedef struct MAX111xState MAX111xState;
 
 #define TYPE_MAX_111X "max111x"
 
diff --git a/include/hw/misc/mips_cmgcr.h b/include/hw/misc/mips_cmgcr.h
index 3e6e223273..a334be8edd 100644
--- a/include/hw/misc/mips_cmgcr.h
+++ b/include/hw/misc/mips_cmgcr.h
@@ -11,8 +11,10 @@
 #define MIPS_CMGCR_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_MIPS_GCR "mips-gcr"
+typedef struct MIPSGCRState MIPSGCRState;
 #define MIPS_GCR(obj) OBJECT_CHECK(MIPSGCRState, (obj), TYPE_MIPS_GCR)
 
 #define GCR_BASE_ADDR           0x1fbf8000ULL
@@ -70,7 +72,6 @@ struct MIPSGCRVPState {
     uint64_t reset_base;
 };
 
-typedef struct MIPSGCRState MIPSGCRState;
 struct MIPSGCRState {
     SysBusDevice parent_obj;
 
diff --git a/include/hw/misc/mips_cpc.h b/include/hw/misc/mips_cpc.h
index 3f670578b0..b0131e4a54 100644
--- a/include/hw/misc/mips_cpc.h
+++ b/include/hw/misc/mips_cpc.h
@@ -21,6 +21,7 @@
 #define MIPS_CPC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define CPC_ADDRSPACE_SZ    0x6000
 
@@ -34,9 +35,10 @@
 #define CPC_VP_RUNNING_OFS  0x30
 
 #define TYPE_MIPS_CPC "mips-cpc"
+typedef struct MIPSCPCState MIPSCPCState;
 #define MIPS_CPC(obj) OBJECT_CHECK(MIPSCPCState, (obj), TYPE_MIPS_CPC)
 
-typedef struct MIPSCPCState {
+struct MIPSCPCState {
     SysBusDevice parent_obj;
 
     uint32_t num_vp;
@@ -44,6 +46,6 @@ typedef struct MIPSCPCState {
 
     MemoryRegion mr;
     uint64_t vp_running; /* Indicates which VPs are in the run state */
-} MIPSCPCState;
+};
 
 #endif /* MIPS_CPC_H */
diff --git a/include/hw/misc/mips_itu.h b/include/hw/misc/mips_itu.h
index c44e7672b6..9ddb04708a 100644
--- a/include/hw/misc/mips_itu.h
+++ b/include/hw/misc/mips_itu.h
@@ -21,8 +21,10 @@
 #define MIPS_ITU_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_MIPS_ITU "mips-itu"
+typedef struct MIPSITUState MIPSITUState;
 #define MIPS_ITU(obj) OBJECT_CHECK(MIPSITUState, (obj), TYPE_MIPS_ITU)
 
 #define ITC_CELL_DEPTH_SHIFT 2
@@ -51,7 +53,7 @@ typedef struct ITCStorageCell {
 
 #define ITC_ADDRESSMAP_NUM 2
 
-typedef struct MIPSITUState {
+struct MIPSITUState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -74,7 +76,7 @@ typedef struct MIPSITUState {
     bool saar_present;
     void *saar;
 
-} MIPSITUState;
+};
 
 /* Get ITC Configuration Tag memory region. */
 MemoryRegion *mips_itu_get_tag_region(MIPSITUState *itu);
diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index 6b25ffd439..b099814879 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -30,6 +30,7 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 #include "hw/input/adb.h"
+#include "qom/object.h"
 
 /* Bits in ACR */
 #define SR_CTRL            0x1c    /* Shift register control bits */
@@ -99,7 +100,7 @@ typedef struct MOS6522Timer {
  * @last_b: last value of B register
  * @last_acr: last value of ACR register
  */
-typedef struct MOS6522State {
+struct MOS6522State {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -120,12 +121,14 @@ typedef struct MOS6522State {
     uint64_t frequency;
 
     qemu_irq irq;
-} MOS6522State;
+};
+typedef struct MOS6522State MOS6522State;
 
 #define TYPE_MOS6522 "mos6522"
+typedef struct MOS6522DeviceClass MOS6522DeviceClass;
 #define MOS6522(obj) OBJECT_CHECK(MOS6522State, (obj), TYPE_MOS6522)
 
-typedef struct MOS6522DeviceClass {
+struct MOS6522DeviceClass {
     DeviceClass parent_class;
 
     DeviceReset parent_reset;
@@ -138,7 +141,7 @@ typedef struct MOS6522DeviceClass {
     uint64_t (*get_timer2_counter_value)(MOS6522State *dev, MOS6522Timer *ti);
     uint64_t (*get_timer1_load_time)(MOS6522State *dev, MOS6522Timer *ti);
     uint64_t (*get_timer2_load_time)(MOS6522State *dev, MOS6522Timer *ti);
-} MOS6522DeviceClass;
+};
 
 #define MOS6522_CLASS(cls) \
     OBJECT_CLASS_CHECK(MOS6522DeviceClass, (cls), TYPE_MOS6522)
diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index 69e265cd4b..e844041bb0 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -22,11 +22,13 @@
 #define MPS2_FPGAIO_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_MPS2_FPGAIO "mps2-fpgaio"
+typedef struct MPS2FPGAIO MPS2FPGAIO;
 #define MPS2_FPGAIO(obj) OBJECT_CHECK(MPS2FPGAIO, (obj), TYPE_MPS2_FPGAIO)
 
-typedef struct {
+struct MPS2FPGAIO {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -48,6 +50,6 @@ typedef struct {
     /* These hold the CLOCK_VIRTUAL ns tick when the CLK1HZ/CLK100HZ was zero */
     int64_t clk1hz_tick_offset;
     int64_t clk100hz_tick_offset;
-} MPS2FPGAIO;
+};
 
 #endif
diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
index 7045473788..10393c4e3a 100644
--- a/include/hw/misc/mps2-scc.h
+++ b/include/hw/misc/mps2-scc.h
@@ -13,13 +13,15 @@
 #define MPS2_SCC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_MPS2_SCC "mps2-scc"
+typedef struct MPS2SCC MPS2SCC;
 #define MPS2_SCC(obj) OBJECT_CHECK(MPS2SCC, (obj), TYPE_MPS2_SCC)
 
 #define NUM_OSCCLK 3
 
-typedef struct {
+struct MPS2SCC {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -38,6 +40,6 @@ typedef struct {
     uint32_t id;
     uint32_t oscclk[NUM_OSCCLK];
     uint32_t oscclk_reset[NUM_OSCCLK];
-} MPS2SCC;
+};
 
 #endif
diff --git a/include/hw/misc/msf2-sysreg.h b/include/hw/misc/msf2-sysreg.h
index 5993f67b4e..6b5d03608a 100644
--- a/include/hw/misc/msf2-sysreg.h
+++ b/include/hw/misc/msf2-sysreg.h
@@ -26,6 +26,7 @@
 #define HW_MSF2_SYSREG_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 enum {
     ESRAM_CR        = 0x00 / 4,
@@ -61,9 +62,10 @@ enum {
 #define MSF2_SYSREG_MMIO_SIZE     0x300
 
 #define TYPE_MSF2_SYSREG          "msf2-sysreg"
+typedef struct MSF2SysregState MSF2SysregState;
 #define MSF2_SYSREG(obj)  OBJECT_CHECK(MSF2SysregState, (obj), TYPE_MSF2_SYSREG)
 
-typedef struct MSF2SysregState {
+struct MSF2SysregState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -72,6 +74,6 @@ typedef struct MSF2SysregState {
     uint8_t apb1div;
 
     uint32_t regs[MSF2_SYSREG_MMIO_SIZE / 4];
-} MSF2SysregState;
+};
 
 #endif /* HW_MSF2_SYSREG_H */
diff --git a/include/hw/misc/nrf51_rng.h b/include/hw/misc/nrf51_rng.h
index b0133bf665..247f167100 100644
--- a/include/hw/misc/nrf51_rng.h
+++ b/include/hw/misc/nrf51_rng.h
@@ -36,7 +36,9 @@
 
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 #define TYPE_NRF51_RNG "nrf51_soc.rng"
+typedef struct NRF51RNGState NRF51RNGState;
 #define NRF51_RNG(obj) OBJECT_CHECK(NRF51RNGState, (obj), TYPE_NRF51_RNG)
 
 #define NRF51_RNG_SIZE         0x1000
@@ -54,7 +56,7 @@
 #define NRF51_RNG_REG_CONFIG_DECEN 0
 #define NRF51_RNG_REG_VALUE    0x508
 
-typedef struct {
+struct NRF51RNGState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
@@ -78,7 +80,7 @@ typedef struct {
     uint32_t interrupt_enabled;
     uint32_t filter_enabled;
 
-} NRF51RNGState;
+};
 
 
 #endif /* NRF51_RNG_H */
diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
index 600356fbf9..ebf8425903 100644
--- a/include/hw/misc/pca9552.h
+++ b/include/hw/misc/pca9552.h
@@ -10,15 +10,17 @@
 #define PCA9552_H
 
 #include "hw/i2c/i2c.h"
+#include "qom/object.h"
 
 #define TYPE_PCA9552 "pca9552"
 #define TYPE_PCA955X "pca955x"
+typedef struct PCA955xState PCA955xState;
 #define PCA955X(obj) OBJECT_CHECK(PCA955xState, (obj), TYPE_PCA955X)
 
 #define PCA955X_NR_REGS 10
 #define PCA955X_PIN_COUNT_MAX 16
 
-typedef struct PCA955xState {
+struct PCA955xState {
     /*< private >*/
     I2CSlave i2c;
     /*< public >*/
@@ -29,6 +31,6 @@ typedef struct PCA955xState {
     uint8_t regs[PCA955X_NR_REGS];
     qemu_irq gpio[PCA955X_PIN_COUNT_MAX];
     char *description; /* For debugging purpose only */
-} PCA955xState;
+};
 
 #endif
diff --git a/include/hw/misc/stm32f2xx_syscfg.h b/include/hw/misc/stm32f2xx_syscfg.h
index 84e06fdecf..ff7c976d66 100644
--- a/include/hw/misc/stm32f2xx_syscfg.h
+++ b/include/hw/misc/stm32f2xx_syscfg.h
@@ -26,6 +26,7 @@
 #define HW_STM32F2XX_SYSCFG_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define SYSCFG_MEMRMP  0x00
 #define SYSCFG_PMC     0x04
@@ -36,10 +37,11 @@
 #define SYSCFG_CMPCR   0x20
 
 #define TYPE_STM32F2XX_SYSCFG "stm32f2xx-syscfg"
+typedef struct STM32F2XXSyscfgState STM32F2XXSyscfgState;
 #define STM32F2XX_SYSCFG(obj) \
     OBJECT_CHECK(STM32F2XXSyscfgState, (obj), TYPE_STM32F2XX_SYSCFG)
 
-typedef struct {
+struct STM32F2XXSyscfgState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -55,6 +57,6 @@ typedef struct {
     uint32_t syscfg_cmpcr;
 
     qemu_irq irq;
-} STM32F2XXSyscfgState;
+};
 
 #endif /* HW_STM32F2XX_SYSCFG_H */
diff --git a/include/hw/misc/stm32f4xx_exti.h b/include/hw/misc/stm32f4xx_exti.h
index 707036a41b..7132615785 100644
--- a/include/hw/misc/stm32f4xx_exti.h
+++ b/include/hw/misc/stm32f4xx_exti.h
@@ -27,6 +27,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/hw.h"
+#include "qom/object.h"
 
 #define EXTI_IMR   0x00
 #define EXTI_EMR   0x04
@@ -36,13 +37,14 @@
 #define EXTI_PR    0x14
 
 #define TYPE_STM32F4XX_EXTI "stm32f4xx-exti"
+typedef struct STM32F4xxExtiState STM32F4xxExtiState;
 #define STM32F4XX_EXTI(obj) \
     OBJECT_CHECK(STM32F4xxExtiState, (obj), TYPE_STM32F4XX_EXTI)
 
 #define NUM_GPIO_EVENT_IN_LINES 16
 #define NUM_INTERRUPT_OUT_LINES 16
 
-typedef struct {
+struct STM32F4xxExtiState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
@@ -55,6 +57,6 @@ typedef struct {
     uint32_t exti_pr;
 
     qemu_irq irq[NUM_INTERRUPT_OUT_LINES];
-} STM32F4xxExtiState;
+};
 
 #endif
diff --git a/include/hw/misc/stm32f4xx_syscfg.h b/include/hw/misc/stm32f4xx_syscfg.h
index c62c6629e5..78130cb9c3 100644
--- a/include/hw/misc/stm32f4xx_syscfg.h
+++ b/include/hw/misc/stm32f4xx_syscfg.h
@@ -27,6 +27,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/hw.h"
+#include "qom/object.h"
 
 #define SYSCFG_MEMRMP  0x00
 #define SYSCFG_PMC     0x04
@@ -37,12 +38,13 @@
 #define SYSCFG_CMPCR   0x20
 
 #define TYPE_STM32F4XX_SYSCFG "stm32f4xx-syscfg"
+typedef struct STM32F4xxSyscfgState STM32F4xxSyscfgState;
 #define STM32F4XX_SYSCFG(obj) \
     OBJECT_CHECK(STM32F4xxSyscfgState, (obj), TYPE_STM32F4XX_SYSCFG)
 
 #define SYSCFG_NUM_EXTICR 4
 
-typedef struct {
+struct STM32F4xxSyscfgState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -56,6 +58,6 @@ typedef struct {
 
     qemu_irq irq;
     qemu_irq gpio_out[16];
-} STM32F4xxSyscfgState;
+};
 
 #endif
diff --git a/include/hw/misc/tz-mpc.h b/include/hw/misc/tz-mpc.h
index 6f15945410..2d3eae0834 100644
--- a/include/hw/misc/tz-mpc.h
+++ b/include/hw/misc/tz-mpc.h
@@ -32,15 +32,16 @@
 #define TZ_MPC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_TZ_MPC "tz-mpc"
+typedef struct TZMPC TZMPC;
 #define TZ_MPC(obj) OBJECT_CHECK(TZMPC, (obj), TYPE_TZ_MPC)
 
 #define TZ_NUM_PORTS 16
 
 #define TYPE_TZ_MPC_IOMMU_MEMORY_REGION "tz-mpc-iommu-memory-region"
 
-typedef struct TZMPC TZMPC;
 
 struct TZMPC {
     /*< private >*/
diff --git a/include/hw/misc/tz-msc.h b/include/hw/misc/tz-msc.h
index 116b96ae9b..3f719833a9 100644
--- a/include/hw/misc/tz-msc.h
+++ b/include/hw/misc/tz-msc.h
@@ -52,11 +52,13 @@
 
 #include "hw/sysbus.h"
 #include "target/arm/idau.h"
+#include "qom/object.h"
 
 #define TYPE_TZ_MSC "tz-msc"
+typedef struct TZMSC TZMSC;
 #define TZ_MSC(obj) OBJECT_CHECK(TZMSC, (obj), TYPE_TZ_MSC)
 
-typedef struct TZMSC {
+struct TZMSC {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -74,6 +76,6 @@ typedef struct TZMSC {
     AddressSpace downstream_as;
     MemoryRegion upstream;
     IDAUInterface *idau;
-} TZMSC;
+};
 
 #endif
diff --git a/include/hw/misc/tz-ppc.h b/include/hw/misc/tz-ppc.h
index 080d6e2ec1..4646005fa5 100644
--- a/include/hw/misc/tz-ppc.h
+++ b/include/hw/misc/tz-ppc.h
@@ -66,13 +66,14 @@
 #define TZ_PPC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_TZ_PPC "tz-ppc"
+typedef struct TZPPC TZPPC;
 #define TZ_PPC(obj) OBJECT_CHECK(TZPPC, (obj), TYPE_TZ_PPC)
 
 #define TZ_NUM_PORTS 16
 
-typedef struct TZPPC TZPPC;
 
 typedef struct TZPPCPort {
     TZPPC *ppc;
diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
index 4c1d13c9bf..8d537df3f9 100644
--- a/include/hw/misc/unimp.h
+++ b/include/hw/misc/unimp.h
@@ -11,18 +11,20 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 
 #define TYPE_UNIMPLEMENTED_DEVICE "unimplemented-device"
 
+typedef struct UnimplementedDeviceState UnimplementedDeviceState;
 #define UNIMPLEMENTED_DEVICE(obj) \
     OBJECT_CHECK(UnimplementedDeviceState, (obj), TYPE_UNIMPLEMENTED_DEVICE)
 
-typedef struct {
+struct UnimplementedDeviceState {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
     char *name;
     uint64_t size;
-} UnimplementedDeviceState;
+};
 
 /**
  * create_unimplemented_device: create and map a dummy device
diff --git a/include/hw/misc/vmcoreinfo.h b/include/hw/misc/vmcoreinfo.h
index d4f3d3a91c..cf0e51f863 100644
--- a/include/hw/misc/vmcoreinfo.h
+++ b/include/hw/misc/vmcoreinfo.h
@@ -14,18 +14,20 @@
 
 #include "hw/qdev-core.h"
 #include "standard-headers/linux/qemu_fw_cfg.h"
+#include "qom/object.h"
 
 #define VMCOREINFO_DEVICE "vmcoreinfo"
+typedef struct VMCoreInfoState VMCoreInfoState;
 #define VMCOREINFO(obj) OBJECT_CHECK(VMCoreInfoState, (obj), VMCOREINFO_DEVICE)
 
 typedef struct fw_cfg_vmcoreinfo FWCfgVMCoreInfo;
 
-typedef struct VMCoreInfoState {
+struct VMCoreInfoState {
     DeviceClass parent_obj;
 
     bool has_vmcoreinfo;
     FWCfgVMCoreInfo vmcoreinfo;
-} VMCoreInfoState;
+};
 
 /* returns NULL unless there is exactly one device */
 static inline VMCoreInfoState *vmcoreinfo_find(void)
diff --git a/include/hw/misc/zynq-xadc.h b/include/hw/misc/zynq-xadc.h
index f1a410a376..7e9767c74f 100644
--- a/include/hw/misc/zynq-xadc.h
+++ b/include/hw/misc/zynq-xadc.h
@@ -16,6 +16,7 @@
 #define ZYNQ_XADC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define ZYNQ_XADC_MMIO_SIZE     0x0020
 #define ZYNQ_XADC_NUM_IO_REGS   (ZYNQ_XADC_MMIO_SIZE / 4)
@@ -23,10 +24,11 @@
 #define ZYNQ_XADC_FIFO_DEPTH    15
 
 #define TYPE_ZYNQ_XADC          "xlnx,zynq-xadc"
+typedef struct ZynqXADCState ZynqXADCState;
 #define ZYNQ_XADC(obj) \
     OBJECT_CHECK(ZynqXADCState, (obj), TYPE_ZYNQ_XADC)
 
-typedef struct ZynqXADCState {
+struct ZynqXADCState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -41,6 +43,6 @@ typedef struct ZynqXADCState {
 
     struct IRQState *qemu_irq;
 
-} ZynqXADCState;
+};
 
 #endif /* ZYNQ_XADC_H */
diff --git a/include/hw/net/allwinner-sun8i-emac.h b/include/hw/net/allwinner-sun8i-emac.h
index eda034e96b..d39a8f0bf3 100644
--- a/include/hw/net/allwinner-sun8i-emac.h
+++ b/include/hw/net/allwinner-sun8i-emac.h
@@ -30,6 +30,7 @@
  */
 
 #define TYPE_AW_SUN8I_EMAC "allwinner-sun8i-emac"
+typedef struct AwSun8iEmacState AwSun8iEmacState;
 #define AW_SUN8I_EMAC(obj) \
     OBJECT_CHECK(AwSun8iEmacState, (obj), TYPE_AW_SUN8I_EMAC)
 
@@ -38,7 +39,7 @@
 /**
  * Allwinner Sun8i EMAC object instance state
  */
-typedef struct AwSun8iEmacState {
+struct AwSun8iEmacState {
     /*< private >*/
     SysBusDevice  parent_obj;
     /*< public >*/
@@ -94,6 +95,6 @@ typedef struct AwSun8iEmacState {
 
     /** @} */
 
-} AwSun8iEmacState;
+};
 
 #endif /* HW_NET_ALLWINNER_SUN8I_H */
diff --git a/include/hw/net/allwinner_emac.h b/include/hw/net/allwinner_emac.h
index 5013207d15..e927082580 100644
--- a/include/hw/net/allwinner_emac.h
+++ b/include/hw/net/allwinner_emac.h
@@ -28,8 +28,10 @@
 #include "qemu/fifo8.h"
 #include "hw/net/mii.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_AW_EMAC "allwinner-emac"
+typedef struct AwEmacState AwEmacState;
 #define AW_EMAC(obj) OBJECT_CHECK(AwEmacState, (obj), TYPE_AW_EMAC)
 
 /*
@@ -144,7 +146,7 @@ typedef struct RTL8201CPState {
     uint16_t anlpar;
 } RTL8201CPState;
 
-typedef struct AwEmacState {
+struct AwEmacState {
     /*< private >*/
     SysBusDevice  parent_obj;
     /*< public >*/
@@ -171,6 +173,6 @@ typedef struct AwEmacState {
     Fifo8          tx_fifo[NUM_TX_FIFOS];
     uint32_t       tx_length[NUM_TX_FIFOS];
     uint32_t       tx_channel;
-} AwEmacState;
+};
 
 #endif
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index 54e646ff79..04fd59a525 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -24,8 +24,10 @@
 
 #ifndef CADENCE_GEM_H
 #define CADENCE_GEM_H
+#include "qom/object.h"
 
 #define TYPE_CADENCE_GEM "cadence_gem"
+typedef struct CadenceGEMState CadenceGEMState;
 #define CADENCE_GEM(obj) OBJECT_CHECK(CadenceGEMState, (obj), TYPE_CADENCE_GEM)
 
 #include "net/net.h"
@@ -43,7 +45,7 @@
 #define MAX_JUMBO_FRAME_SIZE_MASK 0x3FFF
 #define MAX_FRAME_SIZE MAX_JUMBO_FRAME_SIZE_MASK
 
-typedef struct CadenceGEMState {
+struct CadenceGEMState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -89,6 +91,6 @@ typedef struct CadenceGEMState {
     uint32_t rx_desc[MAX_PRIORITY_QUEUES][DESC_MAX_NUM_WORDS];
 
     bool sar_active[4];
-} CadenceGEMState;
+};
 
 #endif
diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
index ab37e7b2b8..6371bf60ab 100644
--- a/include/hw/net/ftgmac100.h
+++ b/include/hw/net/ftgmac100.h
@@ -9,8 +9,10 @@
 
 #ifndef FTGMAC100_H
 #define FTGMAC100_H
+#include "qom/object.h"
 
 #define TYPE_FTGMAC100 "ftgmac100"
+typedef struct FTGMAC100State FTGMAC100State;
 #define FTGMAC100(obj) OBJECT_CHECK(FTGMAC100State, (obj), TYPE_FTGMAC100)
 
 #include "hw/sysbus.h"
@@ -21,7 +23,7 @@
  */
 #define FTGMAC100_MAX_FRAME_SIZE    9220
 
-typedef struct FTGMAC100State {
+struct FTGMAC100State {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -64,15 +66,16 @@ typedef struct FTGMAC100State {
     bool aspeed;
     uint32_t txdes0_edotr;
     uint32_t rxdes0_edorr;
-} FTGMAC100State;
+};
 
 #define TYPE_ASPEED_MII "aspeed-mmi"
+typedef struct AspeedMiiState AspeedMiiState;
 #define ASPEED_MII(obj) OBJECT_CHECK(AspeedMiiState, (obj), TYPE_ASPEED_MII)
 
 /*
  * AST2600 MII controller
  */
-typedef struct AspeedMiiState {
+struct AspeedMiiState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -81,6 +84,6 @@ typedef struct AspeedMiiState {
     MemoryRegion iomem;
     uint32_t phycr;
     uint32_t phydata;
-} AspeedMiiState;
+};
 
 #endif
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index 9f03034b89..4d6ac5e408 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -23,8 +23,10 @@
 
 #ifndef IMX_FEC_H
 #define IMX_FEC_H
+#include "qom/object.h"
 
 #define TYPE_IMX_FEC "imx.fec"
+typedef struct IMXFECState IMXFECState;
 #define IMX_FEC(obj) OBJECT_CHECK(IMXFECState, (obj), TYPE_IMX_FEC)
 
 #define TYPE_IMX_ENET "imx.enet"
@@ -247,7 +249,7 @@ typedef struct {
 
 #define FSL_IMX25_FEC_SIZE      0x4000
 
-typedef struct IMXFECState {
+struct IMXFECState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -274,6 +276,6 @@ typedef struct IMXFECState {
 
     /* Buffer used to assemble a Tx frame */
     uint8_t frame[ENET_MAX_FRAME_SIZE];
-} IMXFECState;
+};
 
 #endif
diff --git a/include/hw/net/lance.h b/include/hw/net/lance.h
index 0357f5f65c..fe459ffea7 100644
--- a/include/hw/net/lance.h
+++ b/include/hw/net/lance.h
@@ -32,15 +32,17 @@
 #include "net/net.h"
 #include "hw/net/pcnet.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_LANCE "lance"
+typedef struct SysBusPCNetState SysBusPCNetState;
 #define SYSBUS_PCNET(obj) \
     OBJECT_CHECK(SysBusPCNetState, (obj), TYPE_LANCE)
 
-typedef struct {
+struct SysBusPCNetState {
     SysBusDevice parent_obj;
 
     PCNetState state;
-} SysBusPCNetState;
+};
 
 #endif
diff --git a/include/hw/net/lasi_82596.h b/include/hw/net/lasi_82596.h
index e76ef8308e..141e0cc17a 100644
--- a/include/hw/net/lasi_82596.h
+++ b/include/hw/net/lasi_82596.h
@@ -10,18 +10,20 @@
 
 #include "net/net.h"
 #include "hw/net/i82596.h"
+#include "qom/object.h"
 
 #define TYPE_LASI_82596 "lasi_82596"
+typedef struct SysBusI82596State SysBusI82596State;
 #define SYSBUS_I82596(obj) \
     OBJECT_CHECK(SysBusI82596State, (obj), TYPE_LASI_82596)
 
-typedef struct {
+struct SysBusI82596State {
     SysBusDevice parent_obj;
 
     I82596State state;
     uint16_t last_val;
     int val_index:1;
-} SysBusI82596State;
+};
 
 SysBusI82596State *lasi_82596_init(MemoryRegion *addr_space,
                                     hwaddr hpa, qemu_irq irq);
diff --git a/include/hw/net/msf2-emac.h b/include/hw/net/msf2-emac.h
index 37966d3a81..6aef711007 100644
--- a/include/hw/net/msf2-emac.h
+++ b/include/hw/net/msf2-emac.h
@@ -26,15 +26,17 @@
 #include "exec/memory.h"
 #include "net/net.h"
 #include "net/eth.h"
+#include "qom/object.h"
 
 #define TYPE_MSS_EMAC "msf2-emac"
+typedef struct MSF2EmacState MSF2EmacState;
 #define MSS_EMAC(obj) \
     OBJECT_CHECK(MSF2EmacState, (obj), TYPE_MSS_EMAC)
 
 #define R_MAX         (0x1a0 / 4)
 #define PHY_MAX_REGS  32
 
-typedef struct MSF2EmacState {
+struct MSF2EmacState {
     SysBusDevice parent;
 
     MemoryRegion mmio;
@@ -50,4 +52,4 @@ typedef struct MSF2EmacState {
     uint16_t phy_regs[PHY_MAX_REGS];
 
     uint32_t regs[R_MAX];
-} MSF2EmacState;
+};
diff --git a/include/hw/nmi.h b/include/hw/nmi.h
index fe37ce3ad8..47fc036e74 100644
--- a/include/hw/nmi.h
+++ b/include/hw/nmi.h
@@ -26,6 +26,7 @@
 
 #define TYPE_NMI "nmi"
 
+typedef struct NMIClass NMIClass;
 #define NMI_CLASS(klass) \
      OBJECT_CLASS_CHECK(NMIClass, (klass), TYPE_NMI)
 #define NMI_GET_CLASS(obj) \
@@ -35,11 +36,11 @@
 
 typedef struct NMIState NMIState;
 
-typedef struct NMIClass {
+struct NMIClass {
     InterfaceClass parent_class;
 
     void (*nmi_monitor_handler)(NMIState *n, int cpu_index, Error **errp);
-} NMIClass;
+};
 
 void nmi_monitor_handle(int cpu_index, Error **errp);
 
diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index ce9c789d99..8407ad21f6 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -10,15 +10,17 @@
 #define HW_NUBUS_MAC_H
 
 #include "hw/nubus/nubus.h"
+#include "qom/object.h"
 
 #define TYPE_MAC_NUBUS_BRIDGE "mac-nubus-bridge"
+typedef struct MacNubusState MacNubusState;
 #define MAC_NUBUS_BRIDGE(obj) OBJECT_CHECK(MacNubusState, (obj), \
                                            TYPE_MAC_NUBUS_BRIDGE)
 
-typedef struct MacNubusState {
+struct MacNubusState {
     SysBusDevice sysbus_dev;
 
     NubusBus *bus;
-} MacNubusState;
+};
 
 #endif
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index c350948262..226efb2ff7 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -11,6 +11,7 @@
 
 #include "hw/qdev-properties.h"
 #include "exec/address-spaces.h"
+#include "qom/object.h"
 
 #define NUBUS_SUPER_SLOT_SIZE 0x10000000U
 #define NUBUS_SUPER_SLOT_NB   0x9
@@ -22,24 +23,26 @@
 #define NUBUS_LAST_SLOT       0xF
 
 #define TYPE_NUBUS_DEVICE "nubus-device"
+typedef struct NubusDevice NubusDevice;
 #define NUBUS_DEVICE(obj) \
      OBJECT_CHECK(NubusDevice, (obj), TYPE_NUBUS_DEVICE)
 
 #define TYPE_NUBUS_BUS "nubus-bus"
+typedef struct NubusBus NubusBus;
 #define NUBUS_BUS(obj) OBJECT_CHECK(NubusBus, (obj), TYPE_NUBUS_BUS)
 
 #define TYPE_NUBUS_BRIDGE "nubus-bridge"
 
-typedef struct NubusBus {
+struct NubusBus {
     BusState qbus;
 
     MemoryRegion super_slot_io;
     MemoryRegion slot_io;
 
     int current_slot;
-} NubusBus;
+};
 
-typedef struct NubusDevice {
+struct NubusDevice {
     DeviceState qdev;
 
     int slot_nb;
@@ -60,7 +63,7 @@ typedef struct NubusDevice {
 
     MemoryRegion rom_io;
     const uint8_t *rom;
-} NubusDevice;
+};
 
 void nubus_register_rom(NubusDevice *dev, const uint8_t *rom, uint32_t size,
                         int revision, int format, uint8_t byte_lanes);
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index f190c428e8..5e00fdc21e 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -5,6 +5,7 @@
 #include "standard-headers/linux/qemu_fw_cfg.h"
 #include "hw/sysbus.h"
 #include "sysemu/dma.h"
+#include "qom/object.h"
 
 #define TYPE_FW_CFG     "fw_cfg"
 #define TYPE_FW_CFG_IO  "fw_cfg_io"
@@ -15,6 +16,7 @@
 #define FW_CFG_IO(obj)  OBJECT_CHECK(FWCfgIoState,  (obj), TYPE_FW_CFG_IO)
 #define FW_CFG_MEM(obj) OBJECT_CHECK(FWCfgMemState, (obj), TYPE_FW_CFG_MEM)
 
+typedef struct FWCfgDataGeneratorClass FWCfgDataGeneratorClass;
 #define FW_CFG_DATA_GENERATOR_CLASS(class) \
     OBJECT_CLASS_CHECK(FWCfgDataGeneratorClass, (class), \
                        TYPE_FW_CFG_DATA_GENERATOR_INTERFACE)
@@ -22,7 +24,7 @@
     OBJECT_GET_CLASS(FWCfgDataGeneratorClass, (obj), \
                      TYPE_FW_CFG_DATA_GENERATOR_INTERFACE)
 
-typedef struct FWCfgDataGeneratorClass {
+struct FWCfgDataGeneratorClass {
     /*< private >*/
     InterfaceClass parent_class;
     /*< public >*/
@@ -39,7 +41,7 @@ typedef struct FWCfgDataGeneratorClass {
      * required.
      */
     GByteArray *(*get_data)(Object *obj, Error **errp);
-} FWCfgDataGeneratorClass;
+};
 
 typedef struct fw_cfg_file FWCfgFile;
 
diff --git a/include/hw/nvram/nrf51_nvm.h b/include/hw/nvram/nrf51_nvm.h
index 3792e4a9fe..48871667f1 100644
--- a/include/hw/nvram/nrf51_nvm.h
+++ b/include/hw/nvram/nrf51_nvm.h
@@ -23,7 +23,9 @@
 #define NRF51_NVM_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 #define TYPE_NRF51_NVM "nrf51_soc.nvm"
+typedef struct NRF51NVMState NRF51NVMState;
 #define NRF51_NVM(obj) OBJECT_CHECK(NRF51NVMState, (obj), TYPE_NRF51_NVM)
 
 #define NRF51_UICR_FIXTURE_SIZE 64
@@ -44,7 +46,7 @@
 
 #define NRF51_UICR_SIZE         0x100
 
-typedef struct NRF51NVMState {
+struct NRF51NVMState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
@@ -58,7 +60,7 @@ typedef struct NRF51NVMState {
 
     uint32_t config;
 
-} NRF51NVMState;
+};
 
 
 #endif
diff --git a/include/hw/pci-bridge/simba.h b/include/hw/pci-bridge/simba.h
index d8649973ee..300379b94d 100644
--- a/include/hw/pci-bridge/simba.h
+++ b/include/hw/pci-bridge/simba.h
@@ -28,12 +28,14 @@
 #define HW_PCI_BRIDGE_SIMBA_H
 
 #include "hw/pci/pci_bridge.h"
+#include "qom/object.h"
 
 
-typedef struct SimbaPCIBridge {
+struct SimbaPCIBridge {
     /*< private >*/
     PCIBridge parent_obj;
-} SimbaPCIBridge;
+};
+typedef struct SimbaPCIBridge SimbaPCIBridge;
 
 #define TYPE_SIMBA_PCI_BRIDGE "pbm-bridge"
 #define SIMBA_PCI_BRIDGE(obj) \
diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index 31c41231b1..43ee5b3a12 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -26,17 +26,19 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci_bridge.h"
+#include "qom/object.h"
 
 #define TYPE_DESIGNWARE_PCIE_HOST "designware-pcie-host"
+typedef struct DesignwarePCIEHost DesignwarePCIEHost;
 #define DESIGNWARE_PCIE_HOST(obj) \
      OBJECT_CHECK(DesignwarePCIEHost, (obj), TYPE_DESIGNWARE_PCIE_HOST)
 
 #define TYPE_DESIGNWARE_PCIE_ROOT "designware-pcie-root"
+typedef struct DesignwarePCIERoot DesignwarePCIERoot;
 #define DESIGNWARE_PCIE_ROOT(obj) \
      OBJECT_CHECK(DesignwarePCIERoot, (obj), TYPE_DESIGNWARE_PCIE_ROOT)
 
 struct DesignwarePCIERoot;
-typedef struct DesignwarePCIERoot DesignwarePCIERoot;
 
 typedef struct DesignwarePCIEViewport {
     DesignwarePCIERoot *root;
@@ -80,7 +82,7 @@ struct DesignwarePCIERoot {
     DesignwarePCIEMSI msi;
 };
 
-typedef struct DesignwarePCIEHost {
+struct DesignwarePCIEHost {
     PCIHostState parent_obj;
 
     DesignwarePCIERoot root;
@@ -96,6 +98,6 @@ typedef struct DesignwarePCIEHost {
     } pci;
 
     MemoryRegion mmio;
-} DesignwarePCIEHost;
+};
 
 #endif /* DESIGNWARE_H */
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index faea040a93..d70e1c69dc 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -23,24 +23,27 @@
 #include "hw/sysbus.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie_host.h"
+#include "qom/object.h"
 
 #define TYPE_GPEX_HOST "gpex-pcihost"
+typedef struct GPEXHost GPEXHost;
 #define GPEX_HOST(obj) \
      OBJECT_CHECK(GPEXHost, (obj), TYPE_GPEX_HOST)
 
 #define TYPE_GPEX_ROOT_DEVICE "gpex-root"
+typedef struct GPEXRootState GPEXRootState;
 #define MCH_PCI_DEVICE(obj) \
      OBJECT_CHECK(GPEXRootState, (obj), TYPE_GPEX_ROOT_DEVICE)
 
 #define GPEX_NUM_IRQS 4
 
-typedef struct GPEXRootState {
+struct GPEXRootState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
-} GPEXRootState;
+};
 
-typedef struct GPEXHost {
+struct GPEXHost {
     /*< private >*/
     PCIExpressHost parent_obj;
     /*< public >*/
@@ -51,7 +54,7 @@ typedef struct GPEXHost {
     MemoryRegion io_mmio;
     qemu_irq irq[GPEX_NUM_IRQS];
     int irq_num[GPEX_NUM_IRQS];
-} GPEXHost;
+};
 
 int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
 
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index cc58d82ed4..74fe300bff 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -14,14 +14,16 @@
 #include "hw/hw.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-host/pam.h"
+#include "qom/object.h"
 
 #define TYPE_I440FX_PCI_HOST_BRIDGE "i440FX-pcihost"
 #define TYPE_I440FX_PCI_DEVICE "i440FX"
 
+typedef struct PCII440FXState PCII440FXState;
 #define I440FX_PCI_DEVICE(obj) \
     OBJECT_CHECK(PCII440FXState, (obj), TYPE_I440FX_PCI_DEVICE)
 
-typedef struct PCII440FXState {
+struct PCII440FXState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -32,7 +34,7 @@ typedef struct PCII440FXState {
     PAMMemoryRegion pam_regions[13];
     MemoryRegion smram_region;
     MemoryRegion smram, low_smram;
-} PCII440FXState;
+};
 
 #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
 
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 75b787867a..43f9e873ae 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -13,6 +13,7 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pcie_port.h"
 #include "hw/ppc/xics.h"
+#include "qom/object.h"
 
 typedef struct PnvPHB3 PnvPHB3;
 
@@ -20,18 +21,19 @@ typedef struct PnvPHB3 PnvPHB3;
  * PHB3 XICS Source for MSIs
  */
 #define TYPE_PHB3_MSI "phb3-msi"
+typedef struct Phb3MsiState Phb3MsiState;
 #define PHB3_MSI(obj) OBJECT_CHECK(Phb3MsiState, (obj), TYPE_PHB3_MSI)
 
 #define PHB3_MAX_MSI     2048
 
-typedef struct Phb3MsiState {
+struct Phb3MsiState {
     ICSState ics;
     qemu_irq *qirqs;
 
     PnvPHB3 *phb;
     uint64_t rba[PHB3_MAX_MSI / 64];
     uint32_t rba_sum;
-} Phb3MsiState;
+};
 
 void pnv_phb3_msi_update_config(Phb3MsiState *msis, uint32_t base,
                                 uint32_t count);
@@ -69,9 +71,10 @@ typedef struct PnvPhb3DMASpace {
  * PHB3 Power Bus Common Queue
  */
 #define TYPE_PNV_PBCQ "pnv-pbcq"
+typedef struct PnvPBCQState PnvPBCQState;
 #define PNV_PBCQ(obj) OBJECT_CHECK(PnvPBCQState, (obj), TYPE_PNV_PBCQ)
 
-typedef struct PnvPBCQState {
+struct PnvPBCQState {
     DeviceState parent;
 
     uint32_t nest_xbase;
@@ -96,7 +99,7 @@ typedef struct PnvPBCQState {
     MemoryRegion xscom_nest_regs;
     MemoryRegion xscom_pci_regs;
     MemoryRegion xscom_spci_regs;
-} PnvPBCQState;
+};
 
 /*
  * PHB3 PCIe Root port
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index c882bfd0aa..450602cb72 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -13,6 +13,7 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pcie_port.h"
 #include "hw/ppc/xive.h"
+#include "qom/object.h"
 
 typedef struct PnvPhb4PecState PnvPhb4PecState;
 typedef struct PnvPhb4PecStack PnvPhb4PecStack;
@@ -140,6 +141,7 @@ extern const MemoryRegionOps pnv_phb4_xscom_ops;
  * PHB4 PEC (PCI Express Controller)
  */
 #define TYPE_PNV_PHB4_PEC "pnv-phb4-pec"
+typedef struct PnvPhb4PecClass PnvPhb4PecClass;
 #define PNV_PHB4_PEC(obj) \
     OBJECT_CHECK(PnvPhb4PecState, (obj), TYPE_PNV_PHB4_PEC)
 
@@ -214,7 +216,7 @@ struct PnvPhb4PecState {
 #define PNV_PHB4_PEC_GET_CLASS(obj) \
      OBJECT_GET_CLASS(PnvPhb4PecClass, (obj), TYPE_PNV_PHB4_PEC)
 
-typedef struct PnvPhb4PecClass {
+struct PnvPhb4PecClass {
     DeviceClass parent_class;
 
     uint32_t (*xscom_nest_base)(PnvPhb4PecState *pec);
@@ -225,6 +227,6 @@ typedef struct PnvPhb4PecClass {
     int compat_size;
     const char *stk_compat;
     int stk_compat_size;
-} PnvPhb4PecClass;
+};
 
 #endif /* PCI_HOST_PNV_PHB4_H */
diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index 070305f83d..5db5a763d4 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -27,16 +27,19 @@
 #include "hw/pci-host/pam.h"
 #include "qemu/units.h"
 #include "qemu/range.h"
+#include "qom/object.h"
 
 #define TYPE_Q35_HOST_DEVICE "q35-pcihost"
+typedef struct Q35PCIHost Q35PCIHost;
 #define Q35_HOST_DEVICE(obj) \
      OBJECT_CHECK(Q35PCIHost, (obj), TYPE_Q35_HOST_DEVICE)
 
 #define TYPE_MCH_PCI_DEVICE "mch"
+typedef struct MCHPCIState MCHPCIState;
 #define MCH_PCI_DEVICE(obj) \
      OBJECT_CHECK(MCHPCIState, (obj), TYPE_MCH_PCI_DEVICE)
 
-typedef struct MCHPCIState {
+struct MCHPCIState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -57,16 +60,16 @@ typedef struct MCHPCIState {
     uint64_t pci_hole64_size;
     uint32_t short_root_bus;
     uint16_t ext_tseg_mbytes;
-} MCHPCIState;
+};
 
-typedef struct Q35PCIHost {
+struct Q35PCIHost {
     /*< private >*/
     PCIExpressHost parent_obj;
     /*< public >*/
 
     bool pci_hole64_fix;
     MCHPCIState mch;
-} Q35PCIHost;
+};
 
 #define Q35_MASK(bit, ms_bit, ls_bit) \
 ((uint##bit##_t)(((1ULL << ((ms_bit) + 1)) - 1) & ~((1ULL << ls_bit) - 1)))
diff --git a/include/hw/pci-host/sabre.h b/include/hw/pci-host/sabre.h
index 99b5aefbec..5fb508e9ce 100644
--- a/include/hw/pci-host/sabre.h
+++ b/include/hw/pci-host/sabre.h
@@ -4,6 +4,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "hw/sparc/sun4u_iommu.h"
+#include "qom/object.h"
 
 #define MAX_IVEC 0x40
 
@@ -16,15 +17,16 @@
 #define OBIO_MSE_IRQ         0x2a
 #define OBIO_SER_IRQ         0x2b
 
-typedef struct SabrePCIState {
+struct SabrePCIState {
     PCIDevice parent_obj;
-} SabrePCIState;
+};
+typedef struct SabrePCIState SabrePCIState;
 
 #define TYPE_SABRE_PCI_DEVICE "sabre-pci"
 #define SABRE_PCI_DEVICE(obj) \
     OBJECT_CHECK(SabrePCIState, (obj), TYPE_SABRE_PCI_DEVICE)
 
-typedef struct SabreState {
+struct SabreState {
     PCIHostState parent_obj;
 
     hwaddr special_base;
@@ -45,7 +47,8 @@ typedef struct SabreState {
     unsigned int irq_request;
     uint32_t reset_control;
     unsigned int nr_resets;
-} SabreState;
+};
+typedef struct SabreState SabreState;
 
 #define TYPE_SABRE "sabre"
 #define SABRE_DEVICE(obj) \
diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index 600eb55c34..783e8905df 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -24,15 +24,16 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "hw/ppc/xics.h"
+#include "qom/object.h"
 
 #define TYPE_SPAPR_PCI_HOST_BRIDGE "spapr-pci-host-bridge"
 
+typedef struct SpaprPhbState SpaprPhbState;
 #define SPAPR_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(SpaprPhbState, (obj), TYPE_SPAPR_PCI_HOST_BRIDGE)
 
 #define SPAPR_PCI_DMA_MAX_WINDOWS    2
 
-typedef struct SpaprPhbState SpaprPhbState;
 
 typedef struct SpaprPciMsi {
     uint32_t first_irq;
diff --git a/include/hw/pci-host/uninorth.h b/include/hw/pci-host/uninorth.h
index 72d2a97355..a1f3aaaecd 100644
--- a/include/hw/pci-host/uninorth.h
+++ b/include/hw/pci-host/uninorth.h
@@ -27,6 +27,7 @@
 
 #include "hw/pci/pci_host.h"
 #include "hw/ppc/openpic.h"
+#include "qom/object.h"
 
 /* UniNorth version */
 #define UNINORTH_VERSION_10A    0x7
@@ -36,6 +37,7 @@
 #define TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE "uni-north-internal-pci-pcihost"
 #define TYPE_U3_AGP_HOST_BRIDGE "u3-agp-pcihost"
 
+typedef struct UNINHostState UNINHostState;
 #define UNI_NORTH_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(UNINHostState, (obj), TYPE_UNI_NORTH_PCI_HOST_BRIDGE)
 #define UNI_NORTH_AGP_HOST_BRIDGE(obj) \
@@ -45,7 +47,7 @@
 #define U3_AGP_HOST_BRIDGE(obj) \
     OBJECT_CHECK(UNINHostState, (obj), TYPE_U3_AGP_HOST_BRIDGE)
 
-typedef struct UNINHostState {
+struct UNINHostState {
     PCIHostState parent_obj;
 
     uint32_t ofw_addr;
@@ -54,13 +56,14 @@ typedef struct UNINHostState {
     MemoryRegion pci_mmio;
     MemoryRegion pci_hole;
     MemoryRegion pci_io;
-} UNINHostState;
+};
 
-typedef struct UNINState {
+struct UNINState {
     SysBusDevice parent_obj;
 
     MemoryRegion mem;
-} UNINState;
+};
+typedef struct UNINState UNINState;
 
 #define TYPE_UNI_NORTH "uni-north"
 #define UNI_NORTH(obj) \
diff --git a/include/hw/pci-host/xilinx-pcie.h b/include/hw/pci-host/xilinx-pcie.h
index c0f15314be..1cbd6d2f79 100644
--- a/include/hw/pci-host/xilinx-pcie.h
+++ b/include/hw/pci-host/xilinx-pcie.h
@@ -24,25 +24,28 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pcie_host.h"
+#include "qom/object.h"
 
 #define TYPE_XILINX_PCIE_HOST "xilinx-pcie-host"
+typedef struct XilinxPCIEHost XilinxPCIEHost;
 #define XILINX_PCIE_HOST(obj) \
      OBJECT_CHECK(XilinxPCIEHost, (obj), TYPE_XILINX_PCIE_HOST)
 
 #define TYPE_XILINX_PCIE_ROOT "xilinx-pcie-root"
+typedef struct XilinxPCIERoot XilinxPCIERoot;
 #define XILINX_PCIE_ROOT(obj) \
      OBJECT_CHECK(XilinxPCIERoot, (obj), TYPE_XILINX_PCIE_ROOT)
 
-typedef struct XilinxPCIERoot {
+struct XilinxPCIERoot {
     PCIBridge parent_obj;
-} XilinxPCIERoot;
+};
 
 typedef struct XilinxPCIEInt {
     uint32_t fifo_reg1;
     uint32_t fifo_reg2;
 } XilinxPCIEInt;
 
-typedef struct XilinxPCIEHost {
+struct XilinxPCIEHost {
     PCIExpressHost parent_obj;
 
     char name[16];
@@ -62,6 +65,6 @@ typedef struct XilinxPCIEHost {
     XilinxPCIEInt intr_fifo[16];
     unsigned int intr_fifo_r, intr_fifo_w;
     uint32_t rpscr;
-} XilinxPCIEHost;
+};
 
 #endif /* HW_XILINX_PCIE_H */
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 4ca7258b5b..be9e298dba 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -8,6 +8,7 @@
 #include "hw/isa/isa.h"
 
 #include "hw/pci/pcie.h"
+#include "qom/object.h"
 
 extern bool pci_available;
 
@@ -195,6 +196,7 @@ enum {
 };
 
 #define TYPE_PCI_DEVICE "pci-device"
+typedef struct PCIDeviceClass PCIDeviceClass;
 #define PCI_DEVICE(obj) \
      OBJECT_CHECK(PCIDevice, (obj), TYPE_PCI_DEVICE)
 #define PCI_DEVICE_CLASS(klass) \
@@ -217,7 +219,7 @@ typedef struct PCIINTxRoute {
     int irq;
 } PCIINTxRoute;
 
-typedef struct PCIDeviceClass {
+struct PCIDeviceClass {
     DeviceClass parent_class;
 
     void (*realize)(PCIDevice *dev, Error **errp);
@@ -241,7 +243,7 @@ typedef struct PCIDeviceClass {
 
     /* rom bar */
     const char *romfile;
-} PCIDeviceClass;
+};
 
 typedef void (*PCIINTxRoutingNotifier)(PCIDevice *dev);
 typedef int (*MSIVectorUseNotifier)(PCIDevice *dev, unsigned int vector,
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 99c674e949..b46d37faa8 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -28,6 +28,7 @@
 
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
+#include "qom/object.h"
 
 typedef struct PCIBridgeWindows PCIBridgeWindows;
 
diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
index 6210a7e14d..51ea53908f 100644
--- a/include/hw/pci/pci_host.h
+++ b/include/hw/pci/pci_host.h
@@ -29,8 +29,10 @@
 #define PCI_HOST_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_PCI_HOST_BRIDGE "pci-host-bridge"
+typedef struct PCIHostBridgeClass PCIHostBridgeClass;
 #define PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(PCIHostState, (obj), TYPE_PCI_HOST_BRIDGE)
 #define PCI_HOST_BRIDGE_CLASS(klass) \
@@ -51,11 +53,11 @@ struct PCIHostState {
     QLIST_ENTRY(PCIHostState) next;
 };
 
-typedef struct PCIHostBridgeClass {
+struct PCIHostBridgeClass {
     SysBusDeviceClass parent_class;
 
     const char *(*root_bus_path)(PCIHostState *, PCIBus *);
-} PCIHostBridgeClass;
+};
 
 /* common internal helpers for PCI/PCIe hosts, cut off overflows */
 void pci_host_config_write_common(PCIDevice *pci_dev, uint32_t addr,
diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
index 3f7b9886d1..c7d2ae5bf4 100644
--- a/include/hw/pci/pcie_host.h
+++ b/include/hw/pci/pcie_host.h
@@ -23,6 +23,7 @@
 
 #include "hw/pci/pci_host.h"
 #include "exec/memory.h"
+#include "qom/object.h"
 
 #define TYPE_PCIE_HOST_BRIDGE "pcie-host-bridge"
 #define PCIE_HOST_BRIDGE(obj) \
diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index caae57573b..765399159f 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -23,6 +23,7 @@
 
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_bus.h"
+#include "qom/object.h"
 
 #define TYPE_PCIE_PORT "pcie-port"
 #define PCIE_PORT(obj) OBJECT_CHECK(PCIEPort, (obj), TYPE_PCIE_PORT)
@@ -67,12 +68,13 @@ int pcie_chassis_add_slot(struct PCIESlot *slot);
 void pcie_chassis_del_slot(PCIESlot *s);
 
 #define TYPE_PCIE_ROOT_PORT         "pcie-root-port-base"
+typedef struct PCIERootPortClass PCIERootPortClass;
 #define PCIE_ROOT_PORT_CLASS(klass) \
      OBJECT_CLASS_CHECK(PCIERootPortClass, (klass), TYPE_PCIE_ROOT_PORT)
 #define PCIE_ROOT_PORT_GET_CLASS(obj) \
      OBJECT_GET_CLASS(PCIERootPortClass, (obj), TYPE_PCIE_ROOT_PORT)
 
-typedef struct PCIERootPortClass {
+struct PCIERootPortClass {
     PCIDeviceClass parent_class;
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
@@ -86,6 +88,6 @@ typedef struct PCIERootPortClass {
     int ssvid_offset;
     int acs_offset;    /* If nonzero, optional ACS capability offset */
     int ssid;
-} PCIERootPortClass;
+};
 
 #endif /* QEMU_PCIE_PORT_H */
diff --git a/include/hw/pcmcia.h b/include/hw/pcmcia.h
index ebad7bc504..0f9e41db02 100644
--- a/include/hw/pcmcia.h
+++ b/include/hw/pcmcia.h
@@ -4,6 +4,7 @@
 /* PCMCIA/Cardbus */
 
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 typedef struct PCMCIASocket {
     qemu_irq irq;
@@ -11,6 +12,8 @@ typedef struct PCMCIASocket {
 } PCMCIASocket;
 
 #define TYPE_PCMCIA_CARD "pcmcia-card"
+typedef struct PCMCIACardClass PCMCIACardClass;
+typedef struct PCMCIACardState PCMCIACardState;
 #define PCMCIA_CARD(obj) \
     OBJECT_CHECK(PCMCIACardState, (obj), TYPE_PCMCIA_CARD)
 #define PCMCIA_CARD_GET_CLASS(obj) \
@@ -18,15 +21,15 @@ typedef struct PCMCIASocket {
 #define PCMCIA_CARD_CLASS(cls) \
     OBJECT_CLASS_CHECK(PCMCIACardClass, cls, TYPE_PCMCIA_CARD)
 
-typedef struct PCMCIACardState {
+struct PCMCIACardState {
     /*< private >*/
     DeviceState parent_obj;
     /*< public >*/
 
     PCMCIASocket *slot;
-} PCMCIACardState;
+};
 
-typedef struct PCMCIACardClass {
+struct PCMCIACardClass {
     /*< private >*/
     DeviceClass parent_class;
     /*< public >*/
@@ -45,7 +48,7 @@ typedef struct PCMCIACardClass {
                          uint32_t address, uint16_t value);
     uint16_t (*io_read)(PCMCIACardState *card, uint32_t address);
     void (*io_write)(PCMCIACardState *card, uint32_t address, uint16_t value);
-} PCMCIACardClass;
+};
 
 #define CISTPL_DEVICE		0x01	/* 5V Device Information Tuple */
 #define CISTPL_NO_LINK		0x14	/* No Link Tuple */
diff --git a/include/hw/platform-bus.h b/include/hw/platform-bus.h
index 33745a418e..cda1346a4f 100644
--- a/include/hw/platform-bus.h
+++ b/include/hw/platform-bus.h
@@ -23,6 +23,7 @@
  */
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 typedef struct PlatformBusDevice PlatformBusDevice;
 
diff --git a/include/hw/ppc/mac_dbdma.h b/include/hw/ppc/mac_dbdma.h
index 26cc469de4..e1f42cdbd3 100644
--- a/include/hw/ppc/mac_dbdma.h
+++ b/include/hw/ppc/mac_dbdma.h
@@ -27,6 +27,7 @@
 #include "qemu/iov.h"
 #include "sysemu/dma.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 typedef struct DBDMA_io DBDMA_io;
 
@@ -160,13 +161,14 @@ typedef struct DBDMA_channel {
     dbdma_cmd current;
 } DBDMA_channel;
 
-typedef struct {
+struct DBDMAState {
     SysBusDevice parent_obj;
 
     MemoryRegion mem;
     DBDMA_channel channels[DBDMA_CHANNELS];
     QEMUBH *bh;
-} DBDMAState;
+};
+typedef struct DBDMAState DBDMAState;
 
 /* Externally callable functions */
 
diff --git a/include/hw/ppc/openpic.h b/include/hw/ppc/openpic.h
index db0d29e6c2..81a0b3b1ee 100644
--- a/include/hw/ppc/openpic.h
+++ b/include/hw/ppc/openpic.h
@@ -3,6 +3,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #define MAX_CPU     32
 #define MAX_MSI     8
@@ -136,9 +137,10 @@ typedef struct IRQDest {
 } IRQDest;
 
 #define TYPE_OPENPIC "openpic"
+typedef struct OpenPICState OpenPICState;
 #define OPENPIC(obj) OBJECT_CHECK(OpenPICState, (obj), TYPE_OPENPIC)
 
-typedef struct OpenPICState {
+struct OpenPICState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -183,6 +185,6 @@ typedef struct OpenPICState {
     uint32_t irq_ipi0;
     uint32_t irq_tim0;
     uint32_t irq_msi;
-} OpenPICState;
+};
 
 #endif /* OPENPIC_H */
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index d4b0b0e2ff..64f9ee8867 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -32,15 +32,18 @@
 #include "hw/ppc/pnv_core.h"
 #include "hw/pci-host/pnv_phb3.h"
 #include "hw/pci-host/pnv_phb4.h"
+#include "qom/object.h"
 
 #define TYPE_PNV_CHIP "pnv-chip"
+typedef struct PnvChip PnvChip;
+typedef struct PnvChipClass PnvChipClass;
 #define PNV_CHIP(obj) OBJECT_CHECK(PnvChip, (obj), TYPE_PNV_CHIP)
 #define PNV_CHIP_CLASS(klass) \
      OBJECT_CLASS_CHECK(PnvChipClass, (klass), TYPE_PNV_CHIP)
 #define PNV_CHIP_GET_CLASS(obj) \
      OBJECT_GET_CLASS(PnvChipClass, (obj), TYPE_PNV_CHIP)
 
-typedef struct PnvChip {
+struct PnvChip {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -61,12 +64,13 @@ typedef struct PnvChip {
     AddressSpace xscom_as;
 
     gchar        *dt_isa_nodename;
-} PnvChip;
+};
 
 #define TYPE_PNV8_CHIP "pnv8-chip"
+typedef struct Pnv8Chip Pnv8Chip;
 #define PNV8_CHIP(obj) OBJECT_CHECK(Pnv8Chip, (obj), TYPE_PNV8_CHIP)
 
-typedef struct Pnv8Chip {
+struct Pnv8Chip {
     /*< private >*/
     PnvChip      parent_obj;
 
@@ -82,12 +86,13 @@ typedef struct Pnv8Chip {
     PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
 
     XICSFabric    *xics;
-} Pnv8Chip;
+};
 
 #define TYPE_PNV9_CHIP "pnv9-chip"
+typedef struct Pnv9Chip Pnv9Chip;
 #define PNV9_CHIP(obj) OBJECT_CHECK(Pnv9Chip, (obj), TYPE_PNV9_CHIP)
 
-typedef struct Pnv9Chip {
+struct Pnv9Chip {
     /*< private >*/
     PnvChip      parent_obj;
 
@@ -103,7 +108,7 @@ typedef struct Pnv9Chip {
 
 #define PNV9_CHIP_MAX_PEC 3
     PnvPhb4PecState pecs[PNV9_CHIP_MAX_PEC];
-} Pnv9Chip;
+};
 
 /*
  * A SMT8 fused core is a pair of SMT4 cores.
@@ -112,18 +117,19 @@ typedef struct Pnv9Chip {
 #define PNV9_PIR2CHIP(pir)      (((pir) >> 8) & 0x7f)
 
 #define TYPE_PNV10_CHIP "pnv10-chip"
+typedef struct Pnv10Chip Pnv10Chip;
 #define PNV10_CHIP(obj) OBJECT_CHECK(Pnv10Chip, (obj), TYPE_PNV10_CHIP)
 
-typedef struct Pnv10Chip {
+struct Pnv10Chip {
     /*< private >*/
     PnvChip      parent_obj;
 
     /*< public >*/
     Pnv9Psi      psi;
     PnvLpcController lpc;
-} Pnv10Chip;
+};
 
-typedef struct PnvChipClass {
+struct PnvChipClass {
     /*< private >*/
     SysBusDeviceClass parent_class;
 
@@ -144,7 +150,7 @@ typedef struct PnvChipClass {
     void (*pic_print_info)(PnvChip *chip, Monitor *mon);
     uint64_t (*xscom_core_base)(PnvChip *chip, uint32_t core_id);
     uint32_t (*xscom_pcba)(PnvChip *chip, uint64_t addr);
-} PnvChipClass;
+};
 
 #define PNV_CHIP_TYPE_SUFFIX "-" TYPE_PNV_CHIP
 #define PNV_CHIP_TYPE_NAME(cpu_model) cpu_model PNV_CHIP_TYPE_SUFFIX
@@ -191,6 +197,8 @@ typedef struct PnvChipClass {
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
+typedef struct PnvMachineClass PnvMachineClass;
+typedef struct PnvMachineState PnvMachineState;
 #define PNV_MACHINE(obj) \
     OBJECT_CHECK(PnvMachineState, (obj), TYPE_PNV_MACHINE)
 #define PNV_MACHINE_GET_CLASS(obj) \
@@ -198,9 +206,8 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
 #define PNV_MACHINE_CLASS(klass) \
     OBJECT_CLASS_CHECK(PnvMachineClass, klass, TYPE_PNV_MACHINE)
 
-typedef struct PnvMachineState PnvMachineState;
 
-typedef struct PnvMachineClass {
+struct PnvMachineClass {
     /*< private >*/
     MachineClass parent_class;
 
@@ -209,7 +216,7 @@ typedef struct PnvMachineClass {
     int compat_size;
 
     void (*dt_power_mgt)(PnvMachineState *pnv, void *fdt);
-} PnvMachineClass;
+};
 
 struct PnvMachineState {
     /*< private >*/
diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
index 113550eb7f..2d91a7d519 100644
--- a/include/hw/ppc/pnv_core.h
+++ b/include/hw/ppc/pnv_core.h
@@ -22,8 +22,11 @@
 
 #include "hw/cpu/core.h"
 #include "target/ppc/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_PNV_CORE "powernv-cpu-core"
+typedef struct PnvCore PnvCore;
+typedef struct PnvCoreClass PnvCoreClass;
 #define PNV_CORE(obj) \
     OBJECT_CHECK(PnvCore, (obj), TYPE_PNV_CORE)
 #define PNV_CORE_CLASS(klass) \
@@ -33,7 +36,7 @@
 
 typedef struct PnvChip PnvChip;
 
-typedef struct PnvCore {
+struct PnvCore {
     /*< private >*/
     CPUCore parent_obj;
 
@@ -44,13 +47,13 @@ typedef struct PnvCore {
     PnvChip *chip;
 
     MemoryRegion xscom_regs;
-} PnvCore;
+};
 
-typedef struct PnvCoreClass {
+struct PnvCoreClass {
     DeviceClass parent_class;
 
     const MemoryRegionOps *xscom_ops;
-} PnvCoreClass;
+};
 
 #define PNV_CORE_TYPE_SUFFIX "-" TYPE_PNV_CORE
 #define PNV_CORE_TYPE_NAME(cpu_model) cpu_model PNV_CORE_TYPE_SUFFIX
@@ -65,13 +68,14 @@ static inline PnvCPUState *pnv_cpu_state(PowerPCCPU *cpu)
 }
 
 #define TYPE_PNV_QUAD "powernv-cpu-quad"
+typedef struct PnvQuad PnvQuad;
 #define PNV_QUAD(obj) \
     OBJECT_CHECK(PnvQuad, (obj), TYPE_PNV_QUAD)
 
-typedef struct PnvQuad {
+struct PnvQuad {
     DeviceState parent_obj;
 
     uint32_t id;
     MemoryRegion xscom_regs;
-} PnvQuad;
+};
 #endif /* PPC_PNV_CORE_H */
diff --git a/include/hw/ppc/pnv_homer.h b/include/hw/ppc/pnv_homer.h
index 1e91c950f6..bedba94e18 100644
--- a/include/hw/ppc/pnv_homer.h
+++ b/include/hw/ppc/pnv_homer.h
@@ -21,28 +21,31 @@
 #define PPC_PNV_HOMER_H
 
 #include "hw/ppc/pnv.h"
+#include "qom/object.h"
 
 #define TYPE_PNV_HOMER "pnv-homer"
+typedef struct PnvHomer PnvHomer;
+typedef struct PnvHomerClass PnvHomerClass;
 #define PNV_HOMER(obj) OBJECT_CHECK(PnvHomer, (obj), TYPE_PNV_HOMER)
 #define TYPE_PNV8_HOMER TYPE_PNV_HOMER "-POWER8"
 #define PNV8_HOMER(obj) OBJECT_CHECK(PnvHomer, (obj), TYPE_PNV8_HOMER)
 #define TYPE_PNV9_HOMER TYPE_PNV_HOMER "-POWER9"
 #define PNV9_HOMER(obj) OBJECT_CHECK(PnvHomer, (obj), TYPE_PNV9_HOMER)
 
-typedef struct PnvHomer {
+struct PnvHomer {
     DeviceState parent;
 
     struct PnvChip *chip;
     MemoryRegion pba_regs;
     MemoryRegion regs;
-} PnvHomer;
+};
 
 #define PNV_HOMER_CLASS(klass)   \
      OBJECT_CLASS_CHECK(PnvHomerClass, (klass), TYPE_PNV_HOMER)
 #define PNV_HOMER_GET_CLASS(obj) \
      OBJECT_GET_CLASS(PnvHomerClass, (obj), TYPE_PNV_HOMER)
 
-typedef struct PnvHomerClass {
+struct PnvHomerClass {
     DeviceClass parent_class;
 
     int pba_size;
@@ -51,6 +54,6 @@ typedef struct PnvHomerClass {
     const MemoryRegionOps *homer_ops;
 
     hwaddr core_max_base;
-} PnvHomerClass;
+};
 
 #endif /* PPC_PNV_HOMER_H */
diff --git a/include/hw/ppc/pnv_lpc.h b/include/hw/ppc/pnv_lpc.h
index c1ec85d5e2..50d92517f2 100644
--- a/include/hw/ppc/pnv_lpc.h
+++ b/include/hw/ppc/pnv_lpc.h
@@ -21,8 +21,11 @@
 #define PPC_PNV_LPC_H
 
 #include "hw/ppc/pnv_psi.h"
+#include "qom/object.h"
 
 #define TYPE_PNV_LPC "pnv-lpc"
+typedef struct PnvLpcClass PnvLpcClass;
+typedef struct PnvLpcController PnvLpcController;
 #define PNV_LPC(obj) \
      OBJECT_CHECK(PnvLpcController, (obj), TYPE_PNV_LPC)
 #define TYPE_PNV8_LPC TYPE_PNV_LPC "-POWER8"
@@ -34,7 +37,7 @@
 #define TYPE_PNV10_LPC TYPE_PNV_LPC "-POWER10"
 #define PNV10_LPC(obj) OBJECT_CHECK(PnvLpcController, (obj), TYPE_PNV10_LPC)
 
-typedef struct PnvLpcController {
+struct PnvLpcController {
     DeviceState parent;
 
     uint64_t eccb_stat_reg;
@@ -79,20 +82,20 @@ typedef struct PnvLpcController {
 
     /* PSI to generate interrupts */
     PnvPsi *psi;
-} PnvLpcController;
+};
 
 #define PNV_LPC_CLASS(klass) \
      OBJECT_CLASS_CHECK(PnvLpcClass, (klass), TYPE_PNV_LPC)
 #define PNV_LPC_GET_CLASS(obj) \
      OBJECT_GET_CLASS(PnvLpcClass, (obj), TYPE_PNV_LPC)
 
-typedef struct PnvLpcClass {
+struct PnvLpcClass {
     DeviceClass parent_class;
 
     int psi_irq;
 
     DeviceRealize parent_realize;
-} PnvLpcClass;
+};
 
 /*
  * Old compilers error on typdef forward declarations. Keep them happy.
diff --git a/include/hw/ppc/pnv_occ.h b/include/hw/ppc/pnv_occ.h
index f8d3061419..30a9faea78 100644
--- a/include/hw/ppc/pnv_occ.h
+++ b/include/hw/ppc/pnv_occ.h
@@ -21,8 +21,11 @@
 #define PPC_PNV_OCC_H
 
 #include "hw/ppc/pnv_psi.h"
+#include "qom/object.h"
 
 #define TYPE_PNV_OCC "pnv-occ"
+typedef struct PnvOCC PnvOCC;
+typedef struct PnvOCCClass PnvOCCClass;
 #define PNV_OCC(obj) OBJECT_CHECK(PnvOCC, (obj), TYPE_PNV_OCC)
 #define TYPE_PNV8_OCC TYPE_PNV_OCC "-POWER8"
 #define PNV8_OCC(obj) OBJECT_CHECK(PnvOCC, (obj), TYPE_PNV8_OCC)
@@ -32,7 +35,7 @@
 #define PNV_OCC_SENSOR_DATA_BLOCK_OFFSET 0x00580000
 #define PNV_OCC_SENSOR_DATA_BLOCK_SIZE   0x00025800
 
-typedef struct PnvOCC {
+struct PnvOCC {
     DeviceState xd;
 
     /* OCC Misc interrupt */
@@ -42,20 +45,20 @@ typedef struct PnvOCC {
 
     MemoryRegion xscom_regs;
     MemoryRegion sram_regs;
-} PnvOCC;
+};
 
 #define PNV_OCC_CLASS(klass) \
      OBJECT_CLASS_CHECK(PnvOCCClass, (klass), TYPE_PNV_OCC)
 #define PNV_OCC_GET_CLASS(obj) \
      OBJECT_GET_CLASS(PnvOCCClass, (obj), TYPE_PNV_OCC)
 
-typedef struct PnvOCCClass {
+struct PnvOCCClass {
     DeviceClass parent_class;
 
     int xscom_size;
     const MemoryRegionOps *xscom_ops;
     int psi_irq;
-} PnvOCCClass;
+};
 
 #define PNV_OCC_SENSOR_DATA_BLOCK_BASE(i)                               \
     (PNV_OCC_SENSOR_DATA_BLOCK_OFFSET + (i) * PNV_OCC_SENSOR_DATA_BLOCK_SIZE)
diff --git a/include/hw/ppc/pnv_pnor.h b/include/hw/ppc/pnv_pnor.h
index 4f96abdfb4..8b27bf111c 100644
--- a/include/hw/ppc/pnv_pnor.h
+++ b/include/hw/ppc/pnv_pnor.h
@@ -8,6 +8,7 @@
  */
 #ifndef _PPC_PNV_PNOR_H
 #define _PPC_PNV_PNOR_H
+#include "qom/object.h"
 
 /*
  * PNOR offset on the LPC FW address space
@@ -15,9 +16,10 @@
 #define PNOR_SPI_OFFSET         0x0c000000UL
 
 #define TYPE_PNV_PNOR  "pnv-pnor"
+typedef struct PnvPnor PnvPnor;
 #define PNV_PNOR(obj)  OBJECT_CHECK(PnvPnor, (obj), TYPE_PNV_PNOR)
 
-typedef struct PnvPnor {
+struct PnvPnor {
     SysBusDevice   parent_obj;
 
     BlockBackend   *blk;
@@ -25,6 +27,6 @@ typedef struct PnvPnor {
     uint8_t        *storage;
     int64_t        size;
     MemoryRegion   mmio;
-} PnvPnor;
+};
 
 #endif /* _PPC_PNV_PNOR_H */
diff --git a/include/hw/ppc/pnv_psi.h b/include/hw/ppc/pnv_psi.h
index 979fc59f33..060a7a110c 100644
--- a/include/hw/ppc/pnv_psi.h
+++ b/include/hw/ppc/pnv_psi.h
@@ -23,14 +23,17 @@
 #include "hw/sysbus.h"
 #include "hw/ppc/xics.h"
 #include "hw/ppc/xive.h"
+#include "qom/object.h"
 
 #define TYPE_PNV_PSI "pnv-psi"
+typedef struct PnvPsi PnvPsi;
+typedef struct PnvPsiClass PnvPsiClass;
 #define PNV_PSI(obj) \
      OBJECT_CHECK(PnvPsi, (obj), TYPE_PNV_PSI)
 
 #define PSIHB_XSCOM_MAX         0x20
 
-typedef struct PnvPsi {
+struct PnvPsi {
     DeviceState parent;
 
     MemoryRegion regs_mr;
@@ -47,27 +50,29 @@ typedef struct PnvPsi {
     uint64_t regs[PSIHB_XSCOM_MAX];
 
     MemoryRegion xscom_regs;
-} PnvPsi;
+};
 
 #define TYPE_PNV8_PSI TYPE_PNV_PSI "-POWER8"
+typedef struct Pnv8Psi Pnv8Psi;
 #define PNV8_PSI(obj) \
     OBJECT_CHECK(Pnv8Psi, (obj), TYPE_PNV8_PSI)
 
-typedef struct Pnv8Psi {
+struct Pnv8Psi {
     PnvPsi   parent;
 
     ICSState ics;
-} Pnv8Psi;
+};
 
 #define TYPE_PNV9_PSI TYPE_PNV_PSI "-POWER9"
+typedef struct Pnv9Psi Pnv9Psi;
 #define PNV9_PSI(obj) \
     OBJECT_CHECK(Pnv9Psi, (obj), TYPE_PNV9_PSI)
 
-typedef struct Pnv9Psi {
+struct Pnv9Psi {
     PnvPsi   parent;
 
     XiveSource source;
-} Pnv9Psi;
+};
 
 #define TYPE_PNV10_PSI TYPE_PNV_PSI "-POWER10"
 
@@ -76,7 +81,7 @@ typedef struct Pnv9Psi {
 #define PNV_PSI_GET_CLASS(obj) \
      OBJECT_GET_CLASS(PnvPsiClass, (obj), TYPE_PNV_PSI)
 
-typedef struct PnvPsiClass {
+struct PnvPsiClass {
     SysBusDeviceClass parent_class;
 
     uint32_t xscom_pcba;
@@ -86,7 +91,7 @@ typedef struct PnvPsiClass {
     int compat_size;
 
     void (*irq_set)(PnvPsi *psi, int, bool state);
-} PnvPsiClass;
+};
 
 /* The PSI and FSP interrupts are muxed on the same IRQ number */
 typedef enum PnvPsiIrq {
diff --git a/include/hw/ppc/pnv_xive.h b/include/hw/ppc/pnv_xive.h
index 76cf16f644..24c37de184 100644
--- a/include/hw/ppc/pnv_xive.h
+++ b/include/hw/ppc/pnv_xive.h
@@ -11,10 +11,13 @@
 #define PPC_PNV_XIVE_H
 
 #include "hw/ppc/xive.h"
+#include "qom/object.h"
 
 struct PnvChip;
 
 #define TYPE_PNV_XIVE "pnv-xive"
+typedef struct PnvXive PnvXive;
+typedef struct PnvXiveClass PnvXiveClass;
 #define PNV_XIVE(obj) OBJECT_CHECK(PnvXive, (obj), TYPE_PNV_XIVE)
 #define PNV_XIVE_CLASS(klass)                                   \
     OBJECT_CLASS_CHECK(PnvXiveClass, (klass), TYPE_PNV_XIVE)
@@ -28,7 +31,7 @@ struct PnvChip;
 #define XIVE_TABLE_VDT_MAX  16  /* VDT Domain Table (0-15) */
 #define XIVE_TABLE_EDT_MAX  64  /* EDT Domain Table (0-63) */
 
-typedef struct PnvXive {
+struct PnvXive {
     XiveRouter    parent_obj;
 
     /* Owning chip */
@@ -87,13 +90,13 @@ typedef struct PnvXive {
     uint64_t      mig[XIVE_TABLE_MIG_MAX];
     uint64_t      vdt[XIVE_TABLE_VDT_MAX];
     uint64_t      edt[XIVE_TABLE_EDT_MAX];
-} PnvXive;
+};
 
-typedef struct PnvXiveClass {
+struct PnvXiveClass {
     XiveRouterClass parent_class;
 
     DeviceRealize parent_realize;
-} PnvXiveClass;
+};
 
 void pnv_xive_pic_print_info(PnvXive *xive, Monitor *mon);
 
diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 09156a5a7a..fb9b97f5be 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -27,16 +27,17 @@ typedef struct PnvXScomInterface PnvXScomInterface;
 #define TYPE_PNV_XSCOM_INTERFACE "pnv-xscom-interface"
 #define PNV_XSCOM_INTERFACE(obj) \
     INTERFACE_CHECK(PnvXScomInterface, (obj), TYPE_PNV_XSCOM_INTERFACE)
+typedef struct PnvXScomInterfaceClass PnvXScomInterfaceClass;
 #define PNV_XSCOM_INTERFACE_CLASS(klass)                \
     OBJECT_CLASS_CHECK(PnvXScomInterfaceClass, (klass), \
                        TYPE_PNV_XSCOM_INTERFACE)
 #define PNV_XSCOM_INTERFACE_GET_CLASS(obj) \
      OBJECT_GET_CLASS(PnvXScomInterfaceClass, (obj), TYPE_PNV_XSCOM_INTERFACE)
 
-typedef struct PnvXScomInterfaceClass {
+struct PnvXScomInterfaceClass {
     InterfaceClass parent;
     int (*dt_xscom)(PnvXScomInterface *dev, void *fdt, int offset);
-} PnvXScomInterfaceClass;
+};
 
 /*
  * Layout of the XSCOM PCB addresses of EX core 1 (POWER 8)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index a1e230ad39..69eafe913a 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -8,6 +8,7 @@
 #include "hw/mem/pc-dimm.h"
 #include "hw/ppc/spapr_ovec.h"
 #include "hw/ppc/spapr_irq.h"
+#include "qom/object.h"
 #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
 #include "hw/ppc/xics.h"        /* For ICSState */
 #include "hw/ppc/spapr_tpm_proxy.h"
@@ -27,10 +28,10 @@ typedef struct SpaprPendingHpt SpaprPendingHpt;
 
 #define TYPE_SPAPR_RTC "spapr-rtc"
 
+typedef struct SpaprRtcState SpaprRtcState;
 #define SPAPR_RTC(obj)                                  \
     OBJECT_CHECK(SpaprRtcState, (obj), TYPE_SPAPR_RTC)
 
-typedef struct SpaprRtcState SpaprRtcState;
 struct SpaprRtcState {
     /*< private >*/
     DeviceState parent_obj;
diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
index 7aed8f555b..adcf74dbc3 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -13,8 +13,11 @@
 #include "hw/qdev-core.h"
 #include "target/ppc/cpu-qom.h"
 #include "target/ppc/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_SPAPR_CPU_CORE "spapr-cpu-core"
+typedef struct SpaprCpuCore SpaprCpuCore;
+typedef struct SpaprCpuCoreClass SpaprCpuCoreClass;
 #define SPAPR_CPU_CORE(obj) \
     OBJECT_CHECK(SpaprCpuCore, (obj), TYPE_SPAPR_CPU_CORE)
 #define SPAPR_CPU_CORE_CLASS(klass) \
@@ -24,7 +27,7 @@
 
 #define SPAPR_CPU_CORE_TYPE_NAME(model) model "-" TYPE_SPAPR_CPU_CORE
 
-typedef struct SpaprCpuCore {
+struct SpaprCpuCore {
     /*< private >*/
     CPUCore parent_obj;
 
@@ -32,12 +35,12 @@ typedef struct SpaprCpuCore {
     PowerPCCPU **threads;
     int node_id;
     bool pre_3_0_migration; /* older machine don't know about SpaprCpuState */
-} SpaprCpuCore;
+};
 
-typedef struct SpaprCpuCoreClass {
+struct SpaprCpuCoreClass {
     DeviceClass parent_class;
     const char *cpu_type;
-} SpaprCpuCoreClass;
+};
 
 const char *spapr_get_cpu_core_type(const char *cpu_type);
 void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip,
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 21af8deac1..ab799930bf 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -20,6 +20,8 @@
 #include "qapi/error.h"
 
 #define TYPE_SPAPR_DR_CONNECTOR "spapr-dr-connector"
+typedef struct SpaprDrc SpaprDrc;
+typedef struct SpaprDrcClass SpaprDrcClass;
 #define SPAPR_DR_CONNECTOR_GET_CLASS(obj) \
         OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DR_CONNECTOR)
 #define SPAPR_DR_CONNECTOR_CLASS(klass) \
@@ -29,6 +31,7 @@
                                              TYPE_SPAPR_DR_CONNECTOR)
 
 #define TYPE_SPAPR_DRC_PHYSICAL "spapr-drc-physical"
+typedef struct SpaprDrcPhysical SpaprDrcPhysical;
 #define SPAPR_DRC_PHYSICAL_GET_CLASS(obj) \
         OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_PHYSICAL)
 #define SPAPR_DRC_PHYSICAL_CLASS(klass) \
@@ -209,7 +212,7 @@ typedef enum {
     SPAPR_DRC_STATE_PHYSICAL_CONFIGURED = 8,
 } SpaprDrcState;
 
-typedef struct SpaprDrc {
+struct SpaprDrc {
     /*< private >*/
     DeviceState parent;
 
@@ -228,11 +231,11 @@ typedef struct SpaprDrc {
     bool unplug_requested;
     void *fdt;
     int fdt_start_offset;
-} SpaprDrc;
+};
 
 struct SpaprMachineState;
 
-typedef struct SpaprDrcClass {
+struct SpaprDrcClass {
     /*< private >*/
     DeviceClass parent;
     SpaprDrcState empty_state;
@@ -250,15 +253,15 @@ typedef struct SpaprDrcClass {
 
     int (*dt_populate)(SpaprDrc *drc, struct SpaprMachineState *spapr,
                        void *fdt, int *fdt_start_offset, Error **errp);
-} SpaprDrcClass;
+};
 
-typedef struct SpaprDrcPhysical {
+struct SpaprDrcPhysical {
     /*< private >*/
     SpaprDrc parent;
 
     /* DR-indicator */
     uint32_t dr_indicator;
-} SpaprDrcPhysical;
+};
 
 static inline bool spapr_drc_hotplugged(DeviceState *dev)
 {
diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index b161ccebc2..83addd0a0b 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -11,6 +11,7 @@
 #define HW_SPAPR_IRQ_H
 
 #include "target/ppc/cpu-qom.h"
+#include "qom/object.h"
 
 /*
  * IRQ range offsets per device type
@@ -35,12 +36,13 @@ typedef struct SpaprInterruptController SpaprInterruptController;
 #define TYPE_SPAPR_INTC "spapr-interrupt-controller"
 #define SPAPR_INTC(obj)                                     \
     INTERFACE_CHECK(SpaprInterruptController, (obj), TYPE_SPAPR_INTC)
+typedef struct SpaprInterruptControllerClass SpaprInterruptControllerClass;
 #define SPAPR_INTC_CLASS(klass)                                     \
     OBJECT_CLASS_CHECK(SpaprInterruptControllerClass, (klass), TYPE_SPAPR_INTC)
 #define SPAPR_INTC_GET_CLASS(obj)                                   \
     OBJECT_GET_CLASS(SpaprInterruptControllerClass, (obj), TYPE_SPAPR_INTC)
 
-typedef struct SpaprInterruptControllerClass {
+struct SpaprInterruptControllerClass {
     InterfaceClass parent;
 
     int (*activate)(SpaprInterruptController *intc, uint32_t nr_servers,
@@ -65,7 +67,7 @@ typedef struct SpaprInterruptControllerClass {
     void (*dt)(SpaprInterruptController *intc, uint32_t nr_servers,
                void *fdt, uint32_t phandle);
     int (*post_load)(SpaprInterruptController *intc, int version_id);
-} SpaprInterruptControllerClass;
+};
 
 void spapr_irq_update_active_intc(struct SpaprMachineState *spapr);
 
diff --git a/include/hw/ppc/spapr_tpm_proxy.h b/include/hw/ppc/spapr_tpm_proxy.h
index c574e22ba4..1e9890d978 100644
--- a/include/hw/ppc/spapr_tpm_proxy.h
+++ b/include/hw/ppc/spapr_tpm_proxy.h
@@ -17,15 +17,16 @@
 #include "hw/qdev-core.h"
 
 #define TYPE_SPAPR_TPM_PROXY "spapr-tpm-proxy"
+typedef struct SpaprTpmProxy SpaprTpmProxy;
 #define SPAPR_TPM_PROXY(obj) OBJECT_CHECK(SpaprTpmProxy, (obj), \
                                           TYPE_SPAPR_TPM_PROXY)
 
-typedef struct SpaprTpmProxy {
+struct SpaprTpmProxy {
     /*< private >*/
     DeviceState parent;
 
     char *host_path;
     int host_fd;
-} SpaprTpmProxy;
+};
 
 #endif /* HW_SPAPR_TPM_PROXY_H */
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index bed7df60e3..9c9d14e63b 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -25,8 +25,11 @@
 #include "hw/ppc/spapr.h"
 #include "sysemu/dma.h"
 #include "hw/irq.h"
+#include "qom/object.h"
 
 #define TYPE_VIO_SPAPR_DEVICE "vio-spapr-device"
+typedef struct SpaprVioDevice SpaprVioDevice;
+typedef struct SpaprVioDeviceClass SpaprVioDeviceClass;
 #define VIO_SPAPR_DEVICE(obj) \
      OBJECT_CHECK(SpaprVioDevice, (obj), TYPE_VIO_SPAPR_DEVICE)
 #define VIO_SPAPR_DEVICE_CLASS(klass) \
@@ -35,6 +38,7 @@
      OBJECT_GET_CLASS(SpaprVioDeviceClass, (obj), TYPE_VIO_SPAPR_DEVICE)
 
 #define TYPE_SPAPR_VIO_BUS "spapr-vio-bus"
+typedef struct SpaprVioBus SpaprVioBus;
 #define SPAPR_VIO_BUS(obj) OBJECT_CHECK(SpaprVioBus, (obj), TYPE_SPAPR_VIO_BUS)
 
 #define TYPE_SPAPR_VIO_BRIDGE "spapr-vio-bridge"
@@ -46,10 +50,8 @@ typedef struct SpaprVioCrq {
     int(*SendFunc)(struct SpaprVioDevice *vdev, uint8_t *crq);
 } SpaprVioCrq;
 
-typedef struct SpaprVioDevice SpaprVioDevice;
-typedef struct SpaprVioBus SpaprVioBus;
 
-typedef struct SpaprVioDeviceClass {
+struct SpaprVioDeviceClass {
     DeviceClass parent_class;
 
     const char *dt_name, *dt_type, *dt_compatible;
@@ -59,7 +61,7 @@ typedef struct SpaprVioDeviceClass {
     void (*reset)(SpaprVioDevice *dev);
     int (*devnode)(SpaprVioDevice *dev, void *fdt, int node_off);
     const char *(*get_dt_compatible)(SpaprVioDevice *dev);
-} SpaprVioDeviceClass;
+};
 
 struct SpaprVioDevice {
     DeviceState qdev;
diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index a1c8540ab4..620abc6639 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -12,15 +12,18 @@
 
 #include "hw/ppc/spapr_irq.h"
 #include "hw/ppc/xive.h"
+#include "qom/object.h"
 
 #define TYPE_SPAPR_XIVE "spapr-xive"
+typedef struct SpaprXive SpaprXive;
+typedef struct SpaprXiveClass SpaprXiveClass;
 #define SPAPR_XIVE(obj) OBJECT_CHECK(SpaprXive, (obj), TYPE_SPAPR_XIVE)
 #define SPAPR_XIVE_CLASS(klass)                                         \
     OBJECT_CLASS_CHECK(SpaprXiveClass, (klass), TYPE_SPAPR_XIVE)
 #define SPAPR_XIVE_GET_CLASS(obj)                               \
     OBJECT_GET_CLASS(SpaprXiveClass, (obj), TYPE_SPAPR_XIVE)
 
-typedef struct SpaprXive {
+struct SpaprXive {
     XiveRouter    parent;
 
     /* Internal interrupt source for IPIs and virtual devices */
@@ -49,13 +52,13 @@ typedef struct SpaprXive {
     void          *tm_mmap;
     MemoryRegion  tm_mmio_kvm;
     VMChangeStateEntry *change;
-} SpaprXive;
+};
 
-typedef struct SpaprXiveClass {
+struct SpaprXiveClass {
     XiveRouterClass parent;
 
     DeviceRealize parent_realize;
-} SpaprXiveClass;
+};
 
 /*
  * The sPAPR machine has a unique XIVE IC device. Assign a fixed value
diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
index 9ed58ec7e9..e5f48faba0 100644
--- a/include/hw/ppc/xics.h
+++ b/include/hw/ppc/xics.h
@@ -30,6 +30,7 @@
 
 #include "exec/memory.h"
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 #define XICS_IPI        0x2
 #define XICS_BUID       0x1
@@ -145,17 +146,18 @@ struct ICSIRQState {
 #define TYPE_XICS_FABRIC "xics-fabric"
 #define XICS_FABRIC(obj)                                     \
     INTERFACE_CHECK(XICSFabric, (obj), TYPE_XICS_FABRIC)
+typedef struct XICSFabricClass XICSFabricClass;
 #define XICS_FABRIC_CLASS(klass)                                     \
     OBJECT_CLASS_CHECK(XICSFabricClass, (klass), TYPE_XICS_FABRIC)
 #define XICS_FABRIC_GET_CLASS(obj)                                   \
     OBJECT_GET_CLASS(XICSFabricClass, (obj), TYPE_XICS_FABRIC)
 
-typedef struct XICSFabricClass {
+struct XICSFabricClass {
     InterfaceClass parent;
     ICSState *(*ics_get)(XICSFabric *xi, int irq);
     void (*ics_resend)(XICSFabric *xi);
     ICPState *(*icp_get)(XICSFabric *xi, int server);
-} XICSFabricClass;
+};
 
 ICPState *xics_icp_get(XICSFabric *xi, int server);
 
diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
index 1c65c96e3c..09e428de4e 100644
--- a/include/hw/ppc/xics_spapr.h
+++ b/include/hw/ppc/xics_spapr.h
@@ -28,6 +28,7 @@
 #define XICS_SPAPR_H
 
 #include "hw/ppc/spapr.h"
+#include "qom/object.h"
 
 #define TYPE_ICS_SPAPR "ics-spapr"
 #define ICS_SPAPR(obj) OBJECT_CHECK(ICSState, (obj), TYPE_ICS_SPAPR)
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index ea3f73a282..479377f37b 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -12,6 +12,7 @@ enum {
 };
 
 #define TYPE_DEVICE "device"
+typedef struct DeviceClass DeviceClass;
 #define DEVICE(obj) OBJECT_CHECK(DeviceState, (obj), TYPE_DEVICE)
 #define DEVICE_CLASS(klass) OBJECT_CLASS_CHECK(DeviceClass, (klass), TYPE_DEVICE)
 #define DEVICE_GET_CLASS(obj) OBJECT_GET_CLASS(DeviceClass, (obj), TYPE_DEVICE)
@@ -93,7 +94,7 @@ typedef void (*BusUnrealize)(BusState *bus);
  * until it was marked don't hide and qdev_device_add called again.
  *
  */
-typedef struct DeviceClass {
+struct DeviceClass {
     /*< private >*/
     ObjectClass parent_class;
     /*< public >*/
@@ -137,7 +138,7 @@ typedef struct DeviceClass {
 
     /* Private to qdev / bus.  */
     const char *bus_type;
-} DeviceClass;
+};
 
 typedef struct NamedGPIOList NamedGPIOList;
 
diff --git a/include/hw/register.h b/include/hw/register.h
index 5d2c565ae0..c4325914b2 100644
--- a/include/hw/register.h
+++ b/include/hw/register.h
@@ -14,6 +14,7 @@
 #include "hw/qdev-core.h"
 #include "exec/memory.h"
 #include "hw/registerfields.h"
+#include "qom/object.h"
 
 typedef struct RegisterInfo RegisterInfo;
 typedef struct RegisterAccessInfo RegisterAccessInfo;
diff --git a/include/hw/resettable.h b/include/hw/resettable.h
index f4c4bab0ef..bcd36bce06 100644
--- a/include/hw/resettable.h
+++ b/include/hw/resettable.h
@@ -17,6 +17,7 @@
 
 #define TYPE_RESETTABLE_INTERFACE "resettable"
 
+typedef struct ResettableClass ResettableClass;
 #define RESETTABLE_CLASS(class) \
     OBJECT_CLASS_CHECK(ResettableClass, (class), TYPE_RESETTABLE_INTERFACE)
 
@@ -119,7 +120,7 @@ typedef struct ResettablePhases {
     ResettableHoldPhase hold;
     ResettableExitPhase exit;
 } ResettablePhases;
-typedef struct ResettableClass {
+struct ResettableClass {
     InterfaceClass parent_class;
 
     /* Phase methods */
@@ -133,7 +134,7 @@ typedef struct ResettableClass {
 
     /* Hierarchy handling method */
     ResettableChildForeach child_foreach;
-} ResettableClass;
+};
 
 /**
  * ResettableState:
diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 835a80f896..b42599ff54 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -22,12 +22,14 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/intc/ibex_plic.h"
 #include "hw/char/ibex_uart.h"
+#include "qom/object.h"
 
 #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
+typedef struct LowRISCIbexSoCState LowRISCIbexSoCState;
 #define RISCV_IBEX_SOC(obj) \
     OBJECT_CHECK(LowRISCIbexSoCState, (obj), TYPE_RISCV_IBEX_SOC)
 
-typedef struct LowRISCIbexSoCState {
+struct LowRISCIbexSoCState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -38,7 +40,7 @@ typedef struct LowRISCIbexSoCState {
 
     MemoryRegion flash_mem;
     MemoryRegion rom;
-} LowRISCIbexSoCState;
+};
 
 typedef struct OpenTitanState {
     /*< private >*/
diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index c75856fa73..617b977214 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -23,13 +23,15 @@
 
 #include "hw/sysbus.h"
 #include "target/riscv/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_RISCV_HART_ARRAY "riscv.hart_array"
 
+typedef struct RISCVHartArrayState RISCVHartArrayState;
 #define RISCV_HART_ARRAY(obj) \
     OBJECT_CHECK(RISCVHartArrayState, (obj), TYPE_RISCV_HART_ARRAY)
 
-typedef struct RISCVHartArrayState {
+struct RISCVHartArrayState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -38,6 +40,6 @@ typedef struct RISCVHartArrayState {
     uint32_t hartid_base;
     char *cpu_type;
     RISCVCPU *harts;
-} RISCVHartArrayState;
+};
 
 #endif
diff --git a/include/hw/riscv/sifive_clint.h b/include/hw/riscv/sifive_clint.h
index 4a720bfece..e58f32b1e3 100644
--- a/include/hw/riscv/sifive_clint.h
+++ b/include/hw/riscv/sifive_clint.h
@@ -21,13 +21,15 @@
 #define HW_SIFIVE_CLINT_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_SIFIVE_CLINT "riscv.sifive.clint"
 
+typedef struct SiFiveCLINTState SiFiveCLINTState;
 #define SIFIVE_CLINT(obj) \
     OBJECT_CHECK(SiFiveCLINTState, (obj), TYPE_SIFIVE_CLINT)
 
-typedef struct SiFiveCLINTState {
+struct SiFiveCLINTState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -38,7 +40,7 @@ typedef struct SiFiveCLINTState {
     uint32_t timecmp_base;
     uint32_t time_base;
     uint32_t aperture_size;
-} SiFiveCLINTState;
+};
 
 DeviceState *sifive_clint_create(hwaddr addr, hwaddr size, uint32_t num_harts,
     uint32_t sip_base, uint32_t timecmp_base, uint32_t time_base,
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 7c2eb70189..67752dc8a0 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -22,12 +22,14 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_cpu.h"
 #include "hw/riscv/sifive_gpio.h"
+#include "qom/object.h"
 
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
+typedef struct SiFiveESoCState SiFiveESoCState;
 #define RISCV_E_SOC(obj) \
     OBJECT_CHECK(SiFiveESoCState, (obj), TYPE_RISCV_E_SOC)
 
-typedef struct SiFiveESoCState {
+struct SiFiveESoCState {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -37,16 +39,17 @@ typedef struct SiFiveESoCState {
     SIFIVEGPIOState gpio;
     MemoryRegion xip_mem;
     MemoryRegion mask_rom;
-} SiFiveESoCState;
+};
 
-typedef struct SiFiveEState {
+struct SiFiveEState {
     /*< private >*/
     SysBusDevice parent_obj;
 
     /*< public >*/
     SiFiveESoCState soc;
     bool revb;
-} SiFiveEState;
+};
+typedef struct SiFiveEState SiFiveEState;
 
 #define TYPE_RISCV_E_MACHINE MACHINE_TYPE_NAME("sifive_e")
 #define RISCV_E_MACHINE(obj) \
diff --git a/include/hw/riscv/sifive_e_prci.h b/include/hw/riscv/sifive_e_prci.h
index 698b0b451c..de1e502eea 100644
--- a/include/hw/riscv/sifive_e_prci.h
+++ b/include/hw/riscv/sifive_e_prci.h
@@ -18,6 +18,7 @@
 
 #ifndef HW_SIFIVE_E_PRCI_H
 #define HW_SIFIVE_E_PRCI_H
+#include "qom/object.h"
 
 enum {
     SIFIVE_E_PRCI_HFROSCCFG = 0x0,
@@ -51,10 +52,11 @@ enum {
 
 #define TYPE_SIFIVE_E_PRCI      "riscv.sifive.e.prci"
 
+typedef struct SiFiveEPRCIState SiFiveEPRCIState;
 #define SIFIVE_E_PRCI(obj) \
     OBJECT_CHECK(SiFiveEPRCIState, (obj), TYPE_SIFIVE_E_PRCI)
 
-typedef struct SiFiveEPRCIState {
+struct SiFiveEPRCIState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -64,7 +66,7 @@ typedef struct SiFiveEPRCIState {
     uint32_t hfxosccfg;
     uint32_t pllcfg;
     uint32_t plloutdiv;
-} SiFiveEPRCIState;
+};
 
 DeviceState *sifive_e_prci_create(hwaddr addr);
 
diff --git a/include/hw/riscv/sifive_gpio.h b/include/hw/riscv/sifive_gpio.h
index cf12fcfd62..af991fa44e 100644
--- a/include/hw/riscv/sifive_gpio.h
+++ b/include/hw/riscv/sifive_gpio.h
@@ -15,8 +15,10 @@
 #define SIFIVE_GPIO_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_SIFIVE_GPIO "sifive_soc.gpio"
+typedef struct SIFIVEGPIOState SIFIVEGPIOState;
 #define SIFIVE_GPIO(obj) OBJECT_CHECK(SIFIVEGPIOState, (obj), TYPE_SIFIVE_GPIO)
 
 #define SIFIVE_GPIO_PINS 32
@@ -41,7 +43,7 @@
 #define SIFIVE_GPIO_REG_IOF_SEL    0x03C
 #define SIFIVE_GPIO_REG_OUT_XOR    0x040
 
-typedef struct SIFIVEGPIOState {
+struct SIFIVEGPIOState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
@@ -71,6 +73,6 @@ typedef struct SIFIVEGPIOState {
 
     /* config */
     uint32_t ngpio;
-} SIFIVEGPIOState;
+};
 
 #endif /* SIFIVE_GPIO_H */
diff --git a/include/hw/riscv/sifive_plic.h b/include/hw/riscv/sifive_plic.h
index 4421e81249..d80c3ae5e6 100644
--- a/include/hw/riscv/sifive_plic.h
+++ b/include/hw/riscv/sifive_plic.h
@@ -22,9 +22,11 @@
 #define HW_SIFIVE_PLIC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_SIFIVE_PLIC "riscv.sifive.plic"
 
+typedef struct SiFivePLICState SiFivePLICState;
 #define SIFIVE_PLIC(obj) \
     OBJECT_CHECK(SiFivePLICState, (obj), TYPE_SIFIVE_PLIC)
 
@@ -41,7 +43,7 @@ typedef struct PLICAddr {
     PLICMode mode;
 } PLICAddr;
 
-typedef struct SiFivePLICState {
+struct SiFivePLICState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -67,7 +69,7 @@ typedef struct SiFivePLICState {
     uint32_t context_base;
     uint32_t context_stride;
     uint32_t aperture_size;
-} SiFivePLICState;
+};
 
 DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
     uint32_t num_sources, uint32_t num_priorities,
diff --git a/include/hw/riscv/sifive_test.h b/include/hw/riscv/sifive_test.h
index 1ec416ac1b..dc54b7af0c 100644
--- a/include/hw/riscv/sifive_test.h
+++ b/include/hw/riscv/sifive_test.h
@@ -20,19 +20,21 @@
 #define HW_SIFIVE_TEST_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_SIFIVE_TEST "riscv.sifive.test"
 
+typedef struct SiFiveTestState SiFiveTestState;
 #define SIFIVE_TEST(obj) \
     OBJECT_CHECK(SiFiveTestState, (obj), TYPE_SIFIVE_TEST)
 
-typedef struct SiFiveTestState {
+struct SiFiveTestState {
     /*< private >*/
     SysBusDevice parent_obj;
 
     /*< public >*/
     MemoryRegion mmio;
-} SiFiveTestState;
+};
 
 enum {
     FINISHER_FAIL = 0x3333,
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 2cefc611dd..7f956a55b3 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -25,12 +25,14 @@
 #include "hw/riscv/sifive_gpio.h"
 #include "hw/riscv/sifive_u_prci.h"
 #include "hw/riscv/sifive_u_otp.h"
+#include "qom/object.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
+typedef struct SiFiveUSoCState SiFiveUSoCState;
 #define RISCV_U_SOC(obj) \
     OBJECT_CHECK(SiFiveUSoCState, (obj), TYPE_RISCV_U_SOC)
 
-typedef struct SiFiveUSoCState {
+struct SiFiveUSoCState {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -46,13 +48,14 @@ typedef struct SiFiveUSoCState {
     CadenceGEMState gem;
 
     uint32_t serial;
-} SiFiveUSoCState;
+};
 
 #define TYPE_RISCV_U_MACHINE MACHINE_TYPE_NAME("sifive_u")
+typedef struct SiFiveUState SiFiveUState;
 #define RISCV_U_MACHINE(obj) \
     OBJECT_CHECK(SiFiveUState, (obj), TYPE_RISCV_U_MACHINE)
 
-typedef struct SiFiveUState {
+struct SiFiveUState {
     /*< private >*/
     MachineState parent_obj;
 
@@ -65,7 +68,7 @@ typedef struct SiFiveUState {
     bool start_in_flash;
     uint32_t msel;
     uint32_t serial;
-} SiFiveUState;
+};
 
 enum {
     SIFIVE_U_DEV_DEBUG,
diff --git a/include/hw/riscv/sifive_u_otp.h b/include/hw/riscv/sifive_u_otp.h
index 639297564a..4572534f50 100644
--- a/include/hw/riscv/sifive_u_otp.h
+++ b/include/hw/riscv/sifive_u_otp.h
@@ -18,6 +18,7 @@
 
 #ifndef HW_SIFIVE_U_OTP_H
 #define HW_SIFIVE_U_OTP_H
+#include "qom/object.h"
 
 #define SIFIVE_U_OTP_PA         0x00
 #define SIFIVE_U_OTP_PAIO       0x04
@@ -49,10 +50,11 @@
 
 #define TYPE_SIFIVE_U_OTP           "riscv.sifive.u.otp"
 
+typedef struct SiFiveUOTPState SiFiveUOTPState;
 #define SIFIVE_U_OTP(obj) \
     OBJECT_CHECK(SiFiveUOTPState, (obj), TYPE_SIFIVE_U_OTP)
 
-typedef struct SiFiveUOTPState {
+struct SiFiveUOTPState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -75,6 +77,6 @@ typedef struct SiFiveUOTPState {
     uint32_t fuse[SIFIVE_U_OTP_NUM_FUSES];
     /* config */
     uint32_t serial;
-} SiFiveUOTPState;
+};
 
 #endif /* HW_SIFIVE_U_OTP_H */
diff --git a/include/hw/riscv/sifive_u_prci.h b/include/hw/riscv/sifive_u_prci.h
index 0a531fdadc..83eab43686 100644
--- a/include/hw/riscv/sifive_u_prci.h
+++ b/include/hw/riscv/sifive_u_prci.h
@@ -18,6 +18,7 @@
 
 #ifndef HW_SIFIVE_U_PRCI_H
 #define HW_SIFIVE_U_PRCI_H
+#include "qom/object.h"
 
 #define SIFIVE_U_PRCI_HFXOSCCFG     0x00
 #define SIFIVE_U_PRCI_COREPLLCFG0   0x04
@@ -58,10 +59,11 @@
 
 #define TYPE_SIFIVE_U_PRCI      "riscv.sifive.u.prci"
 
+typedef struct SiFiveUPRCIState SiFiveUPRCIState;
 #define SIFIVE_U_PRCI(obj) \
     OBJECT_CHECK(SiFiveUPRCIState, (obj), TYPE_SIFIVE_U_PRCI)
 
-typedef struct SiFiveUPRCIState {
+struct SiFiveUPRCIState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -76,7 +78,7 @@ typedef struct SiFiveUPRCIState {
     uint32_t coreclksel;
     uint32_t devicesreset;
     uint32_t clkmuxstatus;
-} SiFiveUPRCIState;
+};
 
 /*
  * Clock indexes for use by Device Tree data and the PRCI driver.
diff --git a/include/hw/riscv/sifive_uart.h b/include/hw/riscv/sifive_uart.h
index 65668825a3..2bb72ac80b 100644
--- a/include/hw/riscv/sifive_uart.h
+++ b/include/hw/riscv/sifive_uart.h
@@ -22,6 +22,7 @@
 
 #include "chardev/char-fe.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 enum {
     SIFIVE_UART_TXFIFO        = 0,
@@ -51,10 +52,11 @@ enum {
 
 #define TYPE_SIFIVE_UART "riscv.sifive.uart"
 
+typedef struct SiFiveUARTState SiFiveUARTState;
 #define SIFIVE_UART(obj) \
     OBJECT_CHECK(SiFiveUARTState, (obj), TYPE_SIFIVE_UART)
 
-typedef struct SiFiveUARTState {
+struct SiFiveUARTState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -69,7 +71,7 @@ typedef struct SiFiveUARTState {
     uint32_t txctrl;
     uint32_t rxctrl;
     uint32_t div;
-} SiFiveUARTState;
+};
 
 SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
     Chardev *chr, qemu_irq irq);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e69355efaf..325ffa5728 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -22,12 +22,14 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/sysbus.h"
 #include "hw/block/flash.h"
+#include "qom/object.h"
 
 #define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+typedef struct RISCVVirtState RISCVVirtState;
 #define RISCV_VIRT_MACHINE(obj) \
     OBJECT_CHECK(RISCVVirtState, (obj), TYPE_RISCV_VIRT_MACHINE)
 
-typedef struct {
+struct RISCVVirtState {
     /*< private >*/
     MachineState parent;
 
@@ -38,7 +40,7 @@ typedef struct {
 
     void *fdt;
     int fdt_size;
-} RISCVVirtState;
+};
 
 enum {
     VIRT_DEBUG,
diff --git a/include/hw/rtc/allwinner-rtc.h b/include/hw/rtc/allwinner-rtc.h
index 7893f74795..1126e05f23 100644
--- a/include/hw/rtc/allwinner-rtc.h
+++ b/include/hw/rtc/allwinner-rtc.h
@@ -60,6 +60,8 @@
  * @{
  */
 
+typedef struct AwRtcClass AwRtcClass;
+typedef struct AwRtcState AwRtcState;
 #define AW_RTC(obj) \
     OBJECT_CHECK(AwRtcState, (obj), TYPE_AW_RTC)
 #define AW_RTC_CLASS(klass) \
@@ -72,7 +74,7 @@
 /**
  * Allwinner RTC per-object instance state.
  */
-typedef struct AwRtcState {
+struct AwRtcState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -92,7 +94,7 @@ typedef struct AwRtcState {
     /** Array of hardware registers */
     uint32_t regs[AW_RTC_REGS_NUM];
 
-} AwRtcState;
+};
 
 /**
  * Allwinner RTC class-level struct.
@@ -101,7 +103,7 @@ typedef struct AwRtcState {
  * such that the generic code can use this struct to support
  * all devices.
  */
-typedef struct AwRtcClass {
+struct AwRtcClass {
     /*< private >*/
     SysBusDeviceClass parent_class;
     /*< public >*/
@@ -129,6 +131,6 @@ typedef struct AwRtcClass {
      */
     bool (*write)(AwRtcState *s, uint32_t offset, uint32_t data);
 
-} AwRtcClass;
+};
 
 #endif /* HW_MISC_ALLWINNER_RTC_H */
diff --git a/include/hw/rtc/aspeed_rtc.h b/include/hw/rtc/aspeed_rtc.h
index b94a710268..295f4a7d30 100644
--- a/include/hw/rtc/aspeed_rtc.h
+++ b/include/hw/rtc/aspeed_rtc.h
@@ -9,8 +9,9 @@
 #define HW_RTC_ASPEED_RTC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
-typedef struct AspeedRtcState {
+struct AspeedRtcState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -19,7 +20,8 @@ typedef struct AspeedRtcState {
     uint32_t reg[0x18];
     int offset;
 
-} AspeedRtcState;
+};
+typedef struct AspeedRtcState AspeedRtcState;
 
 #define TYPE_ASPEED_RTC "aspeed.rtc"
 #define ASPEED_RTC(obj) OBJECT_CHECK(AspeedRtcState, (obj), TYPE_ASPEED_RTC)
diff --git a/include/hw/rtc/goldfish_rtc.h b/include/hw/rtc/goldfish_rtc.h
index 9bd8924f5f..f31b0cbb89 100644
--- a/include/hw/rtc/goldfish_rtc.h
+++ b/include/hw/rtc/goldfish_rtc.h
@@ -23,12 +23,14 @@
 #define HW_RTC_GOLDFISH_RTC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_GOLDFISH_RTC "goldfish_rtc"
+typedef struct GoldfishRTCState GoldfishRTCState;
 #define GOLDFISH_RTC(obj) \
     OBJECT_CHECK(GoldfishRTCState, (obj), TYPE_GOLDFISH_RTC)
 
-typedef struct GoldfishRTCState {
+struct GoldfishRTCState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -42,6 +44,6 @@ typedef struct GoldfishRTCState {
     uint32_t irq_pending;
     uint32_t irq_enabled;
     uint32_t time_high;
-} GoldfishRTCState;
+};
 
 #endif
diff --git a/include/hw/rtc/m48t59.h b/include/hw/rtc/m48t59.h
index e7ea4e8761..78aae2c072 100644
--- a/include/hw/rtc/m48t59.h
+++ b/include/hw/rtc/m48t59.h
@@ -31,6 +31,7 @@
 
 #define TYPE_NVRAM "nvram"
 
+typedef struct NvramClass NvramClass;
 #define NVRAM_CLASS(klass) \
     OBJECT_CLASS_CHECK(NvramClass, (klass), TYPE_NVRAM)
 #define NVRAM_GET_CLASS(obj) \
@@ -40,13 +41,13 @@
 
 typedef struct Nvram Nvram;
 
-typedef struct NvramClass {
+struct NvramClass {
     InterfaceClass parent;
 
     uint32_t (*read)(Nvram *obj, uint32_t addr);
     void (*write)(Nvram *obj, uint32_t addr, uint32_t val);
     void (*toggle_lock)(Nvram *obj, int lock);
-} NvramClass;
+};
 
 Nvram *m48t59_init_isa(ISABus *bus, uint32_t io_base, uint16_t size,
                        int base_year, int type);
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 3713181b56..7b42d9c534 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -13,11 +13,13 @@
 #include "qemu/queue.h"
 #include "qemu/timer.h"
 #include "hw/isa/isa.h"
+#include "qom/object.h"
 
 #define TYPE_MC146818_RTC "mc146818rtc"
+typedef struct RTCState RTCState;
 #define MC146818_RTC(obj) OBJECT_CHECK(RTCState, (obj), TYPE_MC146818_RTC)
 
-typedef struct RTCState {
+struct RTCState {
     ISADevice parent_obj;
 
     MemoryRegion io;
@@ -44,7 +46,7 @@ typedef struct RTCState {
     LostTickPolicy lost_tick_policy;
     Notifier suspend_notifier;
     QLIST_ENTRY(RTCState) link;
-} RTCState;
+};
 
 #define RTC_ISA_IRQ 8
 #define RTC_ISA_BASE 0x70
diff --git a/include/hw/rtc/pl031.h b/include/hw/rtc/pl031.h
index e3cb1d646f..3ddf48cc76 100644
--- a/include/hw/rtc/pl031.h
+++ b/include/hw/rtc/pl031.h
@@ -16,11 +16,13 @@
 
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 
 #define TYPE_PL031 "pl031"
+typedef struct PL031State PL031State;
 #define PL031(obj) OBJECT_CHECK(PL031State, (obj), TYPE_PL031)
 
-typedef struct PL031State {
+struct PL031State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -42,6 +44,6 @@ typedef struct PL031State {
     uint32_t cr;
     uint32_t im;
     uint32_t is;
-} PL031State;
+};
 
 #endif
diff --git a/include/hw/rtc/xlnx-zynqmp-rtc.h b/include/hw/rtc/xlnx-zynqmp-rtc.h
index 6fa1cb2f43..95c85d3bf1 100644
--- a/include/hw/rtc/xlnx-zynqmp-rtc.h
+++ b/include/hw/rtc/xlnx-zynqmp-rtc.h
@@ -29,9 +29,11 @@
 
 #include "hw/register.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_XLNX_ZYNQMP_RTC "xlnx-zynmp.rtc"
 
+typedef struct XlnxZynqMPRTC XlnxZynqMPRTC;
 #define XLNX_ZYNQMP_RTC(obj) \
      OBJECT_CHECK(XlnxZynqMPRTC, (obj), TYPE_XLNX_ZYNQMP_RTC)
 
@@ -77,7 +79,7 @@ REG32(SAFETY_CHK, 0x50)
 
 #define XLNX_ZYNQMP_RTC_R_MAX (R_SAFETY_CHK + 1)
 
-typedef struct XlnxZynqMPRTC {
+struct XlnxZynqMPRTC {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
     qemu_irq irq_rtc_int;
@@ -87,6 +89,6 @@ typedef struct XlnxZynqMPRTC {
 
     uint32_t regs[XLNX_ZYNQMP_RTC_R_MAX];
     RegisterInfo regs_info[XLNX_ZYNQMP_RTC_R_MAX];
-} XlnxZynqMPRTC;
+};
 
 #endif
diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
index aa94758c27..4451a9e006 100644
--- a/include/hw/rx/rx62n.h
+++ b/include/hw/rx/rx62n.h
@@ -30,8 +30,10 @@
 #include "hw/timer/renesas_cmt.h"
 #include "hw/char/renesas_sci.h"
 #include "qemu/units.h"
+#include "qom/object.h"
 
 #define TYPE_RX62N_MCU "rx62n-mcu"
+typedef struct RX62NState RX62NState;
 #define RX62N_MCU(obj) OBJECT_CHECK(RX62NState, (obj), TYPE_RX62N_MCU)
 
 #define TYPE_R5F562N7_MCU "r5f562n7-mcu"
@@ -45,7 +47,7 @@
 #define RX62N_NR_CMT    2
 #define RX62N_NR_SCI    6
 
-typedef struct RX62NState {
+struct RX62NState {
     /*< private >*/
     DeviceState parent_obj;
     /*< public >*/
@@ -71,6 +73,6 @@ typedef struct RX62NState {
     uint32_t xtal_freq_hz;
     /* Peripheral Module Clock frequency */
     uint32_t pclk_freq_hz;
-} RX62NState;
+};
 
 #endif
diff --git a/include/hw/s390x/3270-ccw.h b/include/hw/s390x/3270-ccw.h
index 9d1d18e2bd..ac254f95ed 100644
--- a/include/hw/s390x/3270-ccw.h
+++ b/include/hw/s390x/3270-ccw.h
@@ -16,6 +16,7 @@
 #include "hw/sysbus.h"
 #include "hw/s390x/css.h"
 #include "hw/s390x/ccw-device.h"
+#include "qom/object.h"
 
 #define EMULATED_CCW_3270_CU_TYPE 0x3270
 #define EMULATED_CCW_3270_CHPID_TYPE 0x1a
@@ -30,6 +31,8 @@
 #define TC_EWRITEA 0x0d         /* Erase write alternate */
 #define TC_WRITESF 0x11         /* Write structured field */
 
+typedef struct EmulatedCcw3270Class EmulatedCcw3270Class;
+typedef struct EmulatedCcw3270Device EmulatedCcw3270Device;
 #define EMULATED_CCW_3270(obj) \
      OBJECT_CHECK(EmulatedCcw3270Device, (obj), TYPE_EMULATED_CCW_3270)
 #define EMULATED_CCW_3270_CLASS(klass) \
@@ -37,16 +40,16 @@
 #define EMULATED_CCW_3270_GET_CLASS(obj) \
      OBJECT_GET_CLASS(EmulatedCcw3270Class, (obj), TYPE_EMULATED_CCW_3270)
 
-typedef struct EmulatedCcw3270Device {
+struct EmulatedCcw3270Device {
     CcwDevice parent_obj;
-} EmulatedCcw3270Device;
+};
 
-typedef struct EmulatedCcw3270Class {
+struct EmulatedCcw3270Class {
     CCWDeviceClass parent_class;
 
     void (*init)(EmulatedCcw3270Device *, Error **);
     int (*read_payload_3270)(EmulatedCcw3270Device *);
     int (*write_payload_3270)(EmulatedCcw3270Device *, uint8_t);
-} EmulatedCcw3270Class;
+};
 
 #endif
diff --git a/include/hw/s390x/ap-device.h b/include/hw/s390x/ap-device.h
index 8df9cd2954..b3b3e98a67 100644
--- a/include/hw/s390x/ap-device.h
+++ b/include/hw/s390x/ap-device.h
@@ -12,12 +12,14 @@
 #define HW_S390X_AP_DEVICE_H
 
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 #define AP_DEVICE_TYPE       "ap-device"
 
-typedef struct APDevice {
+struct APDevice {
     DeviceState parent_obj;
-} APDevice;
+};
+typedef struct APDevice APDevice;
 
 #define AP_DEVICE(obj) \
     OBJECT_CHECK(APDevice, (obj), AP_DEVICE_TYPE)
diff --git a/include/hw/s390x/css-bridge.h b/include/hw/s390x/css-bridge.h
index f7ed2d9a03..05786b38de 100644
--- a/include/hw/s390x/css-bridge.h
+++ b/include/hw/s390x/css-bridge.h
@@ -17,19 +17,21 @@
 #include "hw/sysbus.h"
 
 /* virtual css bridge */
-typedef struct VirtualCssBridge {
+struct VirtualCssBridge {
     SysBusDevice sysbus_dev;
     bool css_dev_path;
-} VirtualCssBridge;
+};
+typedef struct VirtualCssBridge VirtualCssBridge;
 
 #define TYPE_VIRTUAL_CSS_BRIDGE "virtual-css-bridge"
 #define VIRTUAL_CSS_BRIDGE(obj) \
     OBJECT_CHECK(VirtualCssBridge, (obj), TYPE_VIRTUAL_CSS_BRIDGE)
 
 /* virtual css bus type */
-typedef struct VirtualCssBus {
+struct VirtualCssBus {
     BusState parent_obj;
-} VirtualCssBus;
+};
+typedef struct VirtualCssBus VirtualCssBus;
 
 #define TYPE_VIRTUAL_CSS_BUS "virtual-css-bus"
 #define VIRTUAL_CSS_BUS(obj) \
diff --git a/include/hw/s390x/event-facility.h b/include/hw/s390x/event-facility.h
index e61c4651d7..dd1a6a44c0 100644
--- a/include/hw/s390x/event-facility.h
+++ b/include/hw/s390x/event-facility.h
@@ -18,6 +18,7 @@
 #include "qemu/thread.h"
 #include "hw/qdev-core.h"
 #include "hw/s390x/sclp.h"
+#include "qom/object.h"
 
 /* SCLP event types */
 #define SCLP_EVENT_OPRTNS_COMMAND               0x01
@@ -41,6 +42,8 @@
 #define SCLP_SELECTIVE_READ                     0x01
 
 #define TYPE_SCLP_EVENT "s390-sclp-event-type"
+typedef struct SCLPEvent SCLPEvent;
+typedef struct SCLPEventClass SCLPEventClass;
 #define SCLP_EVENT(obj) \
      OBJECT_CHECK(SCLPEvent, (obj), TYPE_SCLP_EVENT)
 #define SCLP_EVENT_CLASS(klass) \
@@ -169,13 +172,13 @@ typedef struct ReadEventData {
     };
 } QEMU_PACKED ReadEventData;
 
-typedef struct SCLPEvent {
+struct SCLPEvent {
     DeviceState qdev;
     bool event_pending;
     char *name;
-} SCLPEvent;
+};
 
-typedef struct SCLPEventClass {
+struct SCLPEventClass {
     DeviceClass parent_class;
     int (*init)(SCLPEvent *event);
 
@@ -192,10 +195,11 @@ typedef struct SCLPEventClass {
 
     /* can we handle this event type? */
     bool (*can_handle_event)(uint8_t type);
-} SCLPEventClass;
+};
 
 #define TYPE_SCLP_EVENT_FACILITY "s390-sclp-event-facility"
 typedef struct SCLPEventFacility SCLPEventFacility;
+typedef struct SCLPEventFacilityClass SCLPEventFacilityClass;
 #define EVENT_FACILITY(obj) \
      OBJECT_CHECK(SCLPEventFacility, (obj), TYPE_SCLP_EVENT_FACILITY)
 #define EVENT_FACILITY_CLASS(klass) \
@@ -205,11 +209,11 @@ typedef struct SCLPEventFacility SCLPEventFacility;
      OBJECT_GET_CLASS(SCLPEventFacilityClass, (obj), \
                       TYPE_SCLP_EVENT_FACILITY)
 
-typedef struct SCLPEventFacilityClass {
+struct SCLPEventFacilityClass {
     SysBusDeviceClass parent_class;
     void (*command_handler)(SCLPEventFacility *ef, SCCB *sccb, uint64_t code);
     bool (*event_pending)(SCLPEventFacility *ef);
-} SCLPEventFacilityClass;
+};
 
 BusState *sclp_get_event_facility_bus(void);
 
diff --git a/include/hw/s390x/s390-ccw.h b/include/hw/s390x/s390-ccw.h
index d8e08b5f4c..f0f96952f1 100644
--- a/include/hw/s390x/s390-ccw.h
+++ b/include/hw/s390x/s390-ccw.h
@@ -14,8 +14,11 @@
 #define HW_S390_CCW_H
 
 #include "hw/s390x/ccw-device.h"
+#include "qom/object.h"
 
 #define TYPE_S390_CCW "s390-ccw"
+typedef struct S390CCWDevice S390CCWDevice;
+typedef struct S390CCWDeviceClass S390CCWDeviceClass;
 #define S390_CCW_DEVICE(obj) \
     OBJECT_CHECK(S390CCWDevice, (obj), TYPE_S390_CCW)
 #define S390_CCW_DEVICE_CLASS(klass) \
@@ -23,14 +26,14 @@
 #define S390_CCW_DEVICE_GET_CLASS(obj) \
     OBJECT_GET_CLASS(S390CCWDeviceClass, (obj), TYPE_S390_CCW)
 
-typedef struct S390CCWDevice {
+struct S390CCWDevice {
     CcwDevice parent_obj;
     CssDevId hostid;
     char *mdevid;
     int32_t bootindex;
-} S390CCWDevice;
+};
 
-typedef struct S390CCWDeviceClass {
+struct S390CCWDeviceClass {
     CCWDeviceClass parent_class;
     void (*realize)(S390CCWDevice *dev, char *sysfsdev, Error **errp);
     void (*unrealize)(S390CCWDevice *dev);
@@ -38,6 +41,6 @@ typedef struct S390CCWDeviceClass {
     int (*handle_halt) (SubchDev *sch);
     int (*handle_clear) (SubchDev *sch);
     IOInstEnding (*handle_store) (SubchDev *sch);
-} S390CCWDeviceClass;
+};
 
 #endif
diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
index caf4962d29..f20c503b19 100644
--- a/include/hw/s390x/s390-virtio-ccw.h
+++ b/include/hw/s390x/s390-virtio-ccw.h
@@ -12,16 +12,19 @@
 #define HW_S390X_S390_VIRTIO_CCW_H
 
 #include "hw/boards.h"
+#include "qom/object.h"
 
 #define TYPE_S390_CCW_MACHINE               "s390-ccw-machine"
 
+typedef struct S390CcwMachineClass S390CcwMachineClass;
+typedef struct S390CcwMachineState S390CcwMachineState;
 #define S390_CCW_MACHINE(obj) \
     OBJECT_CHECK(S390CcwMachineState, (obj), TYPE_S390_CCW_MACHINE)
 
 #define S390_CCW_MACHINE_CLASS(klass) \
     OBJECT_CLASS_CHECK(S390CcwMachineClass, (klass), TYPE_S390_CCW_MACHINE)
 
-typedef struct S390CcwMachineState {
+struct S390CcwMachineState {
     /*< private >*/
     MachineState parent_obj;
 
@@ -30,9 +33,9 @@ typedef struct S390CcwMachineState {
     bool dea_key_wrap;
     bool pv;
     uint8_t loadparm[8];
-} S390CcwMachineState;
+};
 
-typedef struct S390CcwMachineClass {
+struct S390CcwMachineClass {
     /*< private >*/
     MachineClass parent_class;
 
@@ -41,7 +44,7 @@ typedef struct S390CcwMachineClass {
     bool cpu_model_allowed;
     bool css_migration_enabled;
     bool hpage_1m_allowed;
-} S390CcwMachineClass;
+};
 
 /* runtime-instrumentation allowed by the machine */
 bool ri_allowed(void);
diff --git a/include/hw/s390x/s390_flic.h b/include/hw/s390x/s390_flic.h
index df11de9b20..2ae7cca85b 100644
--- a/include/hw/s390x/s390_flic.h
+++ b/include/hw/s390x/s390_flic.h
@@ -17,6 +17,7 @@
 #include "hw/s390x/adapter.h"
 #include "hw/virtio/virtio.h"
 #include "qemu/queue.h"
+#include "qom/object.h"
 
 /*
  * Reserve enough gsis to accommodate all virtio devices.
@@ -38,22 +39,24 @@ extern const VMStateDescription vmstate_adapter_routes;
     VMSTATE_STRUCT(_f, _s, 1, vmstate_adapter_routes, AdapterRoutes)
 
 #define TYPE_S390_FLIC_COMMON "s390-flic"
+typedef struct S390FLICState S390FLICState;
+typedef struct S390FLICStateClass S390FLICStateClass;
 #define S390_FLIC_COMMON(obj) \
     OBJECT_CHECK(S390FLICState, (obj), TYPE_S390_FLIC_COMMON)
 
-typedef struct S390FLICState {
+struct S390FLICState {
     SysBusDevice parent_obj;
     /* to limit AdapterRoutes.num_routes for compat */
     uint32_t adapter_routes_max_batch;
     bool ais_supported;
-} S390FLICState;
+};
 
 #define S390_FLIC_COMMON_CLASS(klass) \
     OBJECT_CLASS_CHECK(S390FLICStateClass, (klass), TYPE_S390_FLIC_COMMON)
 #define S390_FLIC_COMMON_GET_CLASS(obj) \
     OBJECT_GET_CLASS(S390FLICStateClass, (obj), TYPE_S390_FLIC_COMMON)
 
-typedef struct S390FLICStateClass {
+struct S390FLICStateClass {
     DeviceClass parent_class;
 
     int (*register_io_adapter)(S390FLICState *fs, uint32_t id, uint8_t isc,
@@ -72,7 +75,7 @@ typedef struct S390FLICStateClass {
                       uint16_t subchannel_nr, uint32_t io_int_parm,
                       uint32_t io_int_word);
     void (*inject_crw_mchk)(S390FLICState *fs);
-} S390FLICStateClass;
+};
 
 #define TYPE_KVM_S390_FLIC "s390-flic-kvm"
 typedef struct KVMS390FLICState KVMS390FLICState;
@@ -80,6 +83,7 @@ typedef struct KVMS390FLICState KVMS390FLICState;
     OBJECT_CHECK(KVMS390FLICState, (obj), TYPE_KVM_S390_FLIC)
 
 #define TYPE_QEMU_S390_FLIC "s390-flic-qemu"
+typedef struct QEMUS390FLICState QEMUS390FLICState;
 #define QEMU_S390_FLIC(obj) \
     OBJECT_CHECK(QEMUS390FLICState, (obj), TYPE_QEMU_S390_FLIC)
 
@@ -115,14 +119,14 @@ typedef struct QEMUS390FlicIO {
     QLIST_ENTRY(QEMUS390FlicIO) next;
 } QEMUS390FlicIO;
 
-typedef struct QEMUS390FLICState {
+struct QEMUS390FLICState {
     S390FLICState parent_obj;
     uint32_t pending;
     uint32_t service_param;
     uint8_t simm;
     uint8_t nimm;
     QLIST_HEAD(, QEMUS390FlicIO) io[8];
-} QEMUS390FLICState;
+};
 
 uint32_t qemu_s390_flic_dequeue_service(QEMUS390FLICState *flic);
 QEMUS390FlicIO *qemu_s390_flic_dequeue_io(QEMUS390FLICState *flic,
diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
index a87ed2a0ab..2a5bdc6dfe 100644
--- a/include/hw/s390x/sclp.h
+++ b/include/hw/s390x/sclp.h
@@ -16,6 +16,7 @@
 
 #include "hw/sysbus.h"
 #include "target/s390x/cpu-qom.h"
+#include "qom/object.h"
 
 #define SCLP_CMD_CODE_MASK                      0xffff00ff
 
@@ -181,22 +182,24 @@ typedef struct SCCB {
  } QEMU_PACKED SCCB;
 
 #define TYPE_SCLP "sclp"
+typedef struct SCLPDevice SCLPDevice;
+typedef struct SCLPDeviceClass SCLPDeviceClass;
 #define SCLP(obj) OBJECT_CHECK(SCLPDevice, (obj), TYPE_SCLP)
 #define SCLP_CLASS(oc) OBJECT_CLASS_CHECK(SCLPDeviceClass, (oc), TYPE_SCLP)
 #define SCLP_GET_CLASS(obj) OBJECT_GET_CLASS(SCLPDeviceClass, (obj), TYPE_SCLP)
 
 struct SCLPEventFacility;
 
-typedef struct SCLPDevice {
+struct SCLPDevice {
     /* private */
     DeviceState parent_obj;
     struct SCLPEventFacility *event_facility;
     int increment_size;
 
     /* public */
-} SCLPDevice;
+};
 
-typedef struct SCLPDeviceClass {
+struct SCLPDeviceClass {
     /* private */
     DeviceClass parent_class;
     void (*read_SCP_info)(SCLPDevice *sclp, SCCB *sccb);
@@ -205,7 +208,7 @@ typedef struct SCLPDeviceClass {
     /* public */
     void (*execute)(SCLPDevice *sclp, SCCB *sccb, uint32_t code);
     void (*service_interrupt)(SCLPDevice *sclp, uint32_t sccb);
-} SCLPDeviceClass;
+};
 
 static inline int sccb_data_len(SCCB *sccb)
 {
diff --git a/include/hw/s390x/storage-attributes.h b/include/hw/s390x/storage-attributes.h
index 4f7c6c0877..b5d9663f7c 100644
--- a/include/hw/s390x/storage-attributes.h
+++ b/include/hw/s390x/storage-attributes.h
@@ -14,26 +14,29 @@
 
 #include "hw/qdev-core.h"
 #include "monitor/monitor.h"
+#include "qom/object.h"
 
 #define TYPE_S390_STATTRIB "s390-storage_attributes"
 #define TYPE_QEMU_S390_STATTRIB "s390-storage_attributes-qemu"
 #define TYPE_KVM_S390_STATTRIB "s390-storage_attributes-kvm"
 
+typedef struct S390StAttribClass S390StAttribClass;
+typedef struct S390StAttribState S390StAttribState;
 #define S390_STATTRIB(obj) \
     OBJECT_CHECK(S390StAttribState, (obj), TYPE_S390_STATTRIB)
 
-typedef struct S390StAttribState {
+struct S390StAttribState {
     DeviceState parent_obj;
     uint64_t migration_cur_gfn;
     bool migration_enabled;
-} S390StAttribState;
+};
 
 #define S390_STATTRIB_CLASS(klass) \
     OBJECT_CLASS_CHECK(S390StAttribClass, (klass), TYPE_S390_STATTRIB)
 #define S390_STATTRIB_GET_CLASS(obj) \
     OBJECT_GET_CLASS(S390StAttribClass, (obj), TYPE_S390_STATTRIB)
 
-typedef struct S390StAttribClass {
+struct S390StAttribClass {
     DeviceClass parent_class;
     /* Return value: < 0 on error, or new count */
     int (*get_stattr)(S390StAttribState *sa, uint64_t *start_gfn,
@@ -46,23 +49,25 @@ typedef struct S390StAttribClass {
     int (*set_migrationmode)(S390StAttribState *sa, bool value);
     int (*get_active)(S390StAttribState *sa);
     long long (*get_dirtycount)(S390StAttribState *sa);
-} S390StAttribClass;
+};
 
+typedef struct QEMUS390StAttribState QEMUS390StAttribState;
 #define QEMU_S390_STATTRIB(obj) \
     OBJECT_CHECK(QEMUS390StAttribState, (obj), TYPE_QEMU_S390_STATTRIB)
 
-typedef struct QEMUS390StAttribState {
+struct QEMUS390StAttribState {
     S390StAttribState parent_obj;
-} QEMUS390StAttribState;
+};
 
+typedef struct KVMS390StAttribState KVMS390StAttribState;
 #define KVM_S390_STATTRIB(obj) \
     OBJECT_CHECK(KVMS390StAttribState, (obj), TYPE_KVM_S390_STATTRIB)
 
-typedef struct KVMS390StAttribState {
+struct KVMS390StAttribState {
     S390StAttribState parent_obj;
     uint64_t still_dirty;
     uint8_t *incoming_buffer;
-} KVMS390StAttribState;
+};
 
 void s390_stattrib_init(void);
 
diff --git a/include/hw/s390x/storage-keys.h b/include/hw/s390x/storage-keys.h
index 3f1ae7e778..e94a201f71 100644
--- a/include/hw/s390x/storage-keys.h
+++ b/include/hw/s390x/storage-keys.h
@@ -14,41 +14,45 @@
 
 #include "hw/qdev-core.h"
 #include "monitor/monitor.h"
+#include "qom/object.h"
 
 #define TYPE_S390_SKEYS "s390-skeys"
+typedef struct S390SKeysClass S390SKeysClass;
+typedef struct S390SKeysState S390SKeysState;
 #define S390_SKEYS(obj) \
     OBJECT_CHECK(S390SKeysState, (obj), TYPE_S390_SKEYS)
 
-typedef struct S390SKeysState {
+struct S390SKeysState {
     DeviceState parent_obj;
     bool migration_enabled;
 
-} S390SKeysState;
+};
 
 #define S390_SKEYS_CLASS(klass) \
     OBJECT_CLASS_CHECK(S390SKeysClass, (klass), TYPE_S390_SKEYS)
 #define S390_SKEYS_GET_CLASS(obj) \
     OBJECT_GET_CLASS(S390SKeysClass, (obj), TYPE_S390_SKEYS)
 
-typedef struct S390SKeysClass {
+struct S390SKeysClass {
     DeviceClass parent_class;
     int (*skeys_enabled)(S390SKeysState *ks);
     int (*get_skeys)(S390SKeysState *ks, uint64_t start_gfn, uint64_t count,
                      uint8_t *keys);
     int (*set_skeys)(S390SKeysState *ks, uint64_t start_gfn, uint64_t count,
                      uint8_t *keys);
-} S390SKeysClass;
+};
 
 #define TYPE_KVM_S390_SKEYS "s390-skeys-kvm"
 #define TYPE_QEMU_S390_SKEYS "s390-skeys-qemu"
+typedef struct QEMUS390SKeysState QEMUS390SKeysState;
 #define QEMU_S390_SKEYS(obj) \
     OBJECT_CHECK(QEMUS390SKeysState, (obj), TYPE_QEMU_S390_SKEYS)
 
-typedef struct QEMUS390SKeysState {
+struct QEMUS390SKeysState {
     S390SKeysState parent_obj;
     uint8_t *keydata;
     uint32_t key_count;
-} QEMUS390SKeysState;
+};
 
 void s390_skeys_init(void);
 
diff --git a/include/hw/s390x/tod.h b/include/hw/s390x/tod.h
index 4251623f7f..e240faf11c 100644
--- a/include/hw/s390x/tod.h
+++ b/include/hw/s390x/tod.h
@@ -13,6 +13,7 @@
 
 #include "hw/qdev-core.h"
 #include "target/s390x/s390-tod.h"
+#include "qom/object.h"
 
 typedef struct S390TOD {
     uint8_t high;
@@ -20,6 +21,8 @@ typedef struct S390TOD {
 } S390TOD;
 
 #define TYPE_S390_TOD "s390-tod"
+typedef struct S390TODClass S390TODClass;
+typedef struct S390TODState S390TODState;
 #define S390_TOD(obj) OBJECT_CHECK(S390TODState, (obj), TYPE_S390_TOD)
 #define S390_TOD_CLASS(oc) OBJECT_CLASS_CHECK(S390TODClass, (oc), \
                                               TYPE_S390_TOD)
@@ -28,7 +31,7 @@ typedef struct S390TOD {
 #define TYPE_KVM_S390_TOD TYPE_S390_TOD "-kvm"
 #define TYPE_QEMU_S390_TOD TYPE_S390_TOD "-qemu"
 
-typedef struct S390TODState {
+struct S390TODState {
     /* private */
     DeviceState parent_obj;
 
@@ -39,9 +42,9 @@ typedef struct S390TODState {
     S390TOD base;
     /* Used by KVM to remember if the TOD is stopped and base is valid. */
     bool stopped;
-} S390TODState;
+};
 
-typedef struct S390TODClass {
+struct S390TODClass {
     /* private */
     DeviceClass parent_class;
     void (*parent_realize)(DeviceState *dev, Error **errp);
@@ -49,7 +52,7 @@ typedef struct S390TODClass {
     /* public */
     void (*get)(const S390TODState *td, S390TOD *tod, Error **errp);
     void (*set)(S390TODState *td, const S390TOD *tod, Error **errp);
-} S390TODClass;
+};
 
 void s390_init_tod(void);
 S390TODState *s390_get_todstate(void);
diff --git a/include/hw/s390x/vfio-ccw.h b/include/hw/s390x/vfio-ccw.h
index ee5250d0d7..7bd4640ac3 100644
--- a/include/hw/s390x/vfio-ccw.h
+++ b/include/hw/s390x/vfio-ccw.h
@@ -17,12 +17,13 @@
 #include "hw/vfio/vfio-common.h"
 #include "hw/s390x/s390-ccw.h"
 #include "hw/s390x/ccw-device.h"
+#include "qom/object.h"
 
 #define TYPE_VFIO_CCW "vfio-ccw"
+typedef struct VFIOCCWDevice VFIOCCWDevice;
 #define VFIO_CCW(obj) \
         OBJECT_CHECK(VFIOCCWDevice, (obj), TYPE_VFIO_CCW)
 
 #define TYPE_VFIO_CCW "vfio-ccw"
-typedef struct VFIOCCWDevice VFIOCCWDevice;
 
 #endif
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 6ba47dac41..d4a4e2930c 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -3,6 +3,7 @@
 
 #include "hw/scsi/scsi.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 /* esp.c */
 #define ESP_MAX_DEVS 7
@@ -65,9 +66,10 @@ struct ESPState {
 };
 
 #define TYPE_ESP "esp"
+typedef struct SysBusESPState SysBusESPState;
 #define ESP_STATE(obj) OBJECT_CHECK(SysBusESPState, (obj), TYPE_ESP)
 
-typedef struct {
+struct SysBusESPState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -76,7 +78,7 @@ typedef struct {
     MemoryRegion pdma;
     uint32_t it_shift;
     ESPState esp;
-} SysBusESPState;
+};
 
 #define ESP_TCLO   0x0
 #define ESP_TCMID  0x1
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 2fc23e44ba..bad4dfb223 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -6,6 +6,7 @@
 #include "hw/qdev-core.h"
 #include "scsi/utils.h"
 #include "qemu/notify.h"
+#include "qom/object.h"
 
 #define MAX_SCSI_DEVS	255
 
@@ -49,6 +50,7 @@ struct SCSIRequest {
 };
 
 #define TYPE_SCSI_DEVICE "scsi-device"
+typedef struct SCSIDeviceClass SCSIDeviceClass;
 #define SCSI_DEVICE(obj) \
      OBJECT_CHECK(SCSIDevice, (obj), TYPE_SCSI_DEVICE)
 #define SCSI_DEVICE_CLASS(klass) \
@@ -56,7 +58,7 @@ struct SCSIRequest {
 #define SCSI_DEVICE_GET_CLASS(obj) \
      OBJECT_GET_CLASS(SCSIDeviceClass, (obj), TYPE_SCSI_DEVICE)
 
-typedef struct SCSIDeviceClass {
+struct SCSIDeviceClass {
     DeviceClass parent_class;
     void (*realize)(SCSIDevice *dev, Error **errp);
     void (*unrealize)(SCSIDevice *dev);
@@ -65,7 +67,7 @@ typedef struct SCSIDeviceClass {
     SCSIRequest *(*alloc_req)(SCSIDevice *s, uint32_t tag, uint32_t lun,
                               uint8_t *buf, void *hba_private);
     void (*unit_attention_reported)(SCSIDevice *s);
-} SCSIDeviceClass;
+};
 
 struct SCSIDevice
 {
diff --git a/include/hw/sd/allwinner-sdhost.h b/include/hw/sd/allwinner-sdhost.h
index d94606a853..c5a2f93cf3 100644
--- a/include/hw/sd/allwinner-sdhost.h
+++ b/include/hw/sd/allwinner-sdhost.h
@@ -45,6 +45,8 @@
  * @{
  */
 
+typedef struct AwSdHostClass AwSdHostClass;
+typedef struct AwSdHostState AwSdHostState;
 #define AW_SDHOST(obj) \
     OBJECT_CHECK(AwSdHostState, (obj), TYPE_AW_SDHOST)
 #define AW_SDHOST_CLASS(klass) \
@@ -57,7 +59,7 @@
 /**
  * Allwinner SD Host Controller object instance state.
  */
-typedef struct AwSdHostState {
+struct AwSdHostState {
     /*< private >*/
     SysBusDevice busdev;
     /*< public >*/
@@ -113,7 +115,7 @@ typedef struct AwSdHostState {
 
     /** @} */
 
-} AwSdHostState;
+};
 
 /**
  * Allwinner SD Host Controller class-level struct.
@@ -122,7 +124,7 @@ typedef struct AwSdHostState {
  * such that the generic code can use this struct to support
  * all devices.
  */
-typedef struct AwSdHostClass {
+struct AwSdHostClass {
     /*< private >*/
     SysBusDeviceClass parent_class;
     /*< public >*/
@@ -130,6 +132,6 @@ typedef struct AwSdHostClass {
     /** Maximum buffer size in bytes per DMA descriptor */
     size_t max_desc_size;
 
-} AwSdHostClass;
+};
 
 #endif /* HW_SD_ALLWINNER_SDHOST_H */
diff --git a/include/hw/sd/aspeed_sdhci.h b/include/hw/sd/aspeed_sdhci.h
index dffbb46946..527075476b 100644
--- a/include/hw/sd/aspeed_sdhci.h
+++ b/include/hw/sd/aspeed_sdhci.h
@@ -10,8 +10,10 @@
 #define ASPEED_SDHCI_H
 
 #include "hw/sd/sdhci.h"
+#include "qom/object.h"
 
 #define TYPE_ASPEED_SDHCI "aspeed.sdhci"
+typedef struct AspeedSDHCIState AspeedSDHCIState;
 #define ASPEED_SDHCI(obj) OBJECT_CHECK(AspeedSDHCIState, (obj), \
                                        TYPE_ASPEED_SDHCI)
 
@@ -20,7 +22,7 @@
 #define ASPEED_SDHCI_NUM_REGS     (ASPEED_SDHCI_REG_SIZE / sizeof(uint32_t))
 #define ASPEED_SDHCI_REG_SIZE     0x100
 
-typedef struct AspeedSDHCIState {
+struct AspeedSDHCIState {
     SysBusDevice parent;
 
     SDHCIState slots[ASPEED_SDHCI_NUM_SLOTS];
@@ -30,6 +32,6 @@ typedef struct AspeedSDHCIState {
     qemu_irq irq;
 
     uint32_t regs[ASPEED_SDHCI_NUM_REGS];
-} AspeedSDHCIState;
+};
 
 #endif /* ASPEED_SDHCI_H */
diff --git a/include/hw/sd/bcm2835_sdhost.h b/include/hw/sd/bcm2835_sdhost.h
index 7520dd6507..233e74b002 100644
--- a/include/hw/sd/bcm2835_sdhost.h
+++ b/include/hw/sd/bcm2835_sdhost.h
@@ -16,14 +16,16 @@
 
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
+#include "qom/object.h"
 
 #define TYPE_BCM2835_SDHOST "bcm2835-sdhost"
+typedef struct BCM2835SDHostState BCM2835SDHostState;
 #define BCM2835_SDHOST(obj) \
         OBJECT_CHECK(BCM2835SDHostState, (obj), TYPE_BCM2835_SDHOST)
 
 #define BCM2835_SDHOST_FIFO_LEN 16
 
-typedef struct {
+struct BCM2835SDHostState {
     SysBusDevice busdev;
     SDBus sdbus;
     MemoryRegion iomem;
@@ -43,6 +45,6 @@ typedef struct {
     uint32_t datacnt;
 
     qemu_irq irq;
-} BCM2835SDHostState;
+};
 
 #endif
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index ac02d61a7a..850740ea92 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -31,6 +31,7 @@
 #define HW_SD_H
 
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 #define OUT_OF_RANGE		(1 << 31)
 #define ADDRESS_ERROR		(1 << 30)
@@ -92,13 +93,14 @@ typedef struct SDState SDState;
 typedef struct SDBus SDBus;
 
 #define TYPE_SD_CARD "sd-card"
+typedef struct SDCardClass SDCardClass;
 #define SD_CARD(obj) OBJECT_CHECK(SDState, (obj), TYPE_SD_CARD)
 #define SD_CARD_CLASS(klass) \
     OBJECT_CLASS_CHECK(SDCardClass, (klass), TYPE_SD_CARD)
 #define SD_CARD_GET_CLASS(obj) \
     OBJECT_GET_CLASS(SDCardClass, (obj), TYPE_SD_CARD)
 
-typedef struct {
+struct SDCardClass {
     /*< private >*/
     DeviceClass parent_class;
     /*< public >*/
@@ -128,9 +130,10 @@ typedef struct {
     void (*enable)(SDState *sd, bool enable);
     bool (*get_inserted)(SDState *sd);
     bool (*get_readonly)(SDState *sd);
-} SDCardClass;
+};
 
 #define TYPE_SD_BUS "sd-bus"
+typedef struct SDBusClass SDBusClass;
 #define SD_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_SD_BUS)
 #define SD_BUS_CLASS(klass) OBJECT_CLASS_CHECK(SDBusClass, (klass), TYPE_SD_BUS)
 #define SD_BUS_GET_CLASS(obj) OBJECT_GET_CLASS(SDBusClass, (obj), TYPE_SD_BUS)
@@ -139,7 +142,7 @@ struct SDBus {
     BusState qbus;
 };
 
-typedef struct {
+struct SDBusClass {
     /*< private >*/
     BusClass parent_class;
     /*< public >*/
@@ -149,7 +152,7 @@ typedef struct {
      */
     void (*set_inserted)(DeviceState *dev, bool inserted);
     void (*set_readonly)(DeviceState *dev, bool readonly);
-} SDBusClass;
+};
 
 /* Functions to be used by qdevified callers (working via
  * an SDBus rather than directly with SDState)
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 5d9275f3d6..67b01fcb28 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -28,9 +28,10 @@
 #include "hw/pci/pci.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
+#include "qom/object.h"
 
 /* SD/MMC host controller state */
-typedef struct SDHCIState {
+struct SDHCIState {
     /*< private >*/
     union {
         PCIDevice pcidev;
@@ -98,7 +99,8 @@ typedef struct SDHCIState {
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
     uint8_t vendor;        /* For vendor specific functionality */
-} SDHCIState;
+};
+typedef struct SDHCIState SDHCIState;
 
 #define SDHCI_VENDOR_NONE       0
 #define SDHCI_VENDOR_IMX        1
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index ac1d04ddc2..21ad6327d2 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -13,6 +13,7 @@
 #define HW_SOUTHBRIDGE_PIIX_H
 
 #include "hw/pci/pci.h"
+#include "qom/object.h"
 
 #define TYPE_PIIX4_PM "PIIX4_PM"
 
@@ -35,7 +36,7 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
 #define PIIX_NUM_PIC_IRQS       16      /* i8259 * 2 */
 #define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
 
-typedef struct PIIXState {
+struct PIIXState {
     PCIDevice dev;
 
     /*
@@ -62,7 +63,8 @@ typedef struct PIIXState {
 
     /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
     MemoryRegion rcr_mem;
-} PIIX3State;
+};
+typedef struct PIIXState PIIX3State;
 
 #define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
 #define PIIX3_PCI_DEVICE(obj) \
diff --git a/include/hw/sparc/sparc32_dma.h b/include/hw/sparc/sparc32_dma.h
index ab42c5421b..9c80ef54ff 100644
--- a/include/hw/sparc/sparc32_dma.h
+++ b/include/hw/sparc/sparc32_dma.h
@@ -4,14 +4,15 @@
 #include "hw/sysbus.h"
 #include "hw/scsi/esp.h"
 #include "hw/net/lance.h"
+#include "qom/object.h"
 
 #define DMA_REGS 4
 
 #define TYPE_SPARC32_DMA_DEVICE "sparc32-dma-device"
+typedef struct DMADeviceState DMADeviceState;
 #define SPARC32_DMA_DEVICE(obj) OBJECT_CHECK(DMADeviceState, (obj), \
                                              TYPE_SPARC32_DMA_DEVICE)
 
-typedef struct DMADeviceState DMADeviceState;
 
 struct DMADeviceState {
     SysBusDevice parent_obj;
@@ -24,37 +25,40 @@ struct DMADeviceState {
 };
 
 #define TYPE_SPARC32_ESPDMA_DEVICE "sparc32-espdma"
+typedef struct ESPDMADeviceState ESPDMADeviceState;
 #define SPARC32_ESPDMA_DEVICE(obj) OBJECT_CHECK(ESPDMADeviceState, (obj), \
                                                 TYPE_SPARC32_ESPDMA_DEVICE)
 
-typedef struct ESPDMADeviceState {
+struct ESPDMADeviceState {
     DMADeviceState parent_obj;
 
     SysBusESPState *esp;
-} ESPDMADeviceState;
+};
 
 #define TYPE_SPARC32_LEDMA_DEVICE "sparc32-ledma"
+typedef struct LEDMADeviceState LEDMADeviceState;
 #define SPARC32_LEDMA_DEVICE(obj) OBJECT_CHECK(LEDMADeviceState, (obj), \
                                                TYPE_SPARC32_LEDMA_DEVICE)
 
-typedef struct LEDMADeviceState {
+struct LEDMADeviceState {
     DMADeviceState parent_obj;
 
     SysBusPCNetState *lance;
-} LEDMADeviceState;
+};
 
 #define TYPE_SPARC32_DMA "sparc32-dma"
+typedef struct SPARC32DMAState SPARC32DMAState;
 #define SPARC32_DMA(obj) OBJECT_CHECK(SPARC32DMAState, (obj), \
                                       TYPE_SPARC32_DMA)
 
-typedef struct SPARC32DMAState {
+struct SPARC32DMAState {
     SysBusDevice parent_obj;
 
     MemoryRegion dmamem;
     MemoryRegion ledma_alias;
     ESPDMADeviceState *espdma;
     LEDMADeviceState *ledma;
-} SPARC32DMAState;
+};
 
 /* sparc32_dma.c */
 void ledma_memory_read(void *opaque, hwaddr addr,
diff --git a/include/hw/sparc/sun4m_iommu.h b/include/hw/sparc/sun4m_iommu.h
index 482266c6a7..6095eed0af 100644
--- a/include/hw/sparc/sun4m_iommu.h
+++ b/include/hw/sparc/sun4m_iommu.h
@@ -26,10 +26,11 @@
 #define SUN4M_IOMMU_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define IOMMU_NREGS         (4 * 4096 / 4)
 
-typedef struct IOMMUState {
+struct IOMMUState {
     SysBusDevice parent_obj;
 
     AddressSpace iommu_as;
@@ -40,7 +41,8 @@ typedef struct IOMMUState {
     hwaddr iostart;
     qemu_irq irq;
     uint32_t version;
-} IOMMUState;
+};
+typedef struct IOMMUState IOMMUState;
 
 #define TYPE_SUN4M_IOMMU "sun4m-iommu"
 #define SUN4M_IOMMU(obj) OBJECT_CHECK(IOMMUState, (obj), TYPE_SUN4M_IOMMU)
diff --git a/include/hw/sparc/sun4u_iommu.h b/include/hw/sparc/sun4u_iommu.h
index 5472d489cf..dfe10459e5 100644
--- a/include/hw/sparc/sun4u_iommu.h
+++ b/include/hw/sparc/sun4u_iommu.h
@@ -28,10 +28,11 @@
 #define SUN4U_IOMMU_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define IOMMU_NREGS             3
 
-typedef struct IOMMUState {
+struct IOMMUState {
     SysBusDevice parent_obj;
 
     AddressSpace iommu_as;
@@ -39,7 +40,8 @@ typedef struct IOMMUState {
 
     MemoryRegion iomem;
     uint64_t regs[IOMMU_NREGS];
-} IOMMUState;
+};
+typedef struct IOMMUState IOMMUState;
 
 #define TYPE_SUN4U_IOMMU "sun4u-iommu"
 #define SUN4U_IOMMU(obj) OBJECT_CHECK(IOMMUState, (obj), TYPE_SUN4U_IOMMU)
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 6fbbb238f1..a2072ffeea 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -27,6 +27,7 @@
 
 #include "hw/ssi/ssi.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 typedef struct AspeedSegments {
     hwaddr addr;
@@ -67,20 +68,22 @@ typedef struct AspeedSMCFlash {
 } AspeedSMCFlash;
 
 #define TYPE_ASPEED_SMC "aspeed.smc"
+typedef struct AspeedSMCClass AspeedSMCClass;
+typedef struct AspeedSMCState AspeedSMCState;
 #define ASPEED_SMC(obj) OBJECT_CHECK(AspeedSMCState, (obj), TYPE_ASPEED_SMC)
 #define ASPEED_SMC_CLASS(klass) \
      OBJECT_CLASS_CHECK(AspeedSMCClass, (klass), TYPE_ASPEED_SMC)
 #define ASPEED_SMC_GET_CLASS(obj) \
      OBJECT_GET_CLASS(AspeedSMCClass, (obj), TYPE_ASPEED_SMC)
 
-typedef struct  AspeedSMCClass {
+struct AspeedSMCClass {
     SysBusDevice parent_obj;
     const AspeedSMCController *ctrl;
-}  AspeedSMCClass;
+};
 
 #define ASPEED_SMC_R_MAX        (0x100 / 4)
 
-typedef struct AspeedSMCState {
+struct AspeedSMCState {
     SysBusDevice parent_obj;
 
     const AspeedSMCController *ctrl;
@@ -117,6 +120,6 @@ typedef struct AspeedSMCState {
 
     uint8_t snoop_index;
     uint8_t snoop_dummies;
-} AspeedSMCState;
+};
 
 #endif /* ASPEED_SMC_H */
diff --git a/include/hw/ssi/imx_spi.h b/include/hw/ssi/imx_spi.h
index 7103953581..3a966af0ec 100644
--- a/include/hw/ssi/imx_spi.h
+++ b/include/hw/ssi/imx_spi.h
@@ -14,6 +14,7 @@
 #include "hw/ssi/ssi.h"
 #include "qemu/bitops.h"
 #include "qemu/fifo32.h"
+#include "qom/object.h"
 
 #define ECSPI_FIFO_SIZE 64
 
@@ -77,9 +78,10 @@
 #define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)
 
 #define TYPE_IMX_SPI "imx.spi"
+typedef struct IMXSPIState IMXSPIState;
 #define IMX_SPI(obj) OBJECT_CHECK(IMXSPIState, (obj), TYPE_IMX_SPI)
 
-typedef struct IMXSPIState {
+struct IMXSPIState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -98,6 +100,6 @@ typedef struct IMXSPIState {
     Fifo32 tx_fifo;
 
     int16_t burst_length;
-} IMXSPIState;
+};
 
 #endif /* IMX_SPI_H */
diff --git a/include/hw/ssi/mss-spi.h b/include/hw/ssi/mss-spi.h
index f0cf3243e0..40e1a5ac90 100644
--- a/include/hw/ssi/mss-spi.h
+++ b/include/hw/ssi/mss-spi.h
@@ -28,13 +28,15 @@
 #include "hw/sysbus.h"
 #include "hw/ssi/ssi.h"
 #include "qemu/fifo32.h"
+#include "qom/object.h"
 
 #define TYPE_MSS_SPI   "mss-spi"
+typedef struct MSSSpiState MSSSpiState;
 #define MSS_SPI(obj)   OBJECT_CHECK(MSSSpiState, (obj), TYPE_MSS_SPI)
 
 #define R_SPI_MAX             16
 
-typedef struct MSSSpiState {
+struct MSSSpiState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
@@ -53,6 +55,6 @@ typedef struct MSSSpiState {
     bool enabled;
 
     uint32_t regs[R_SPI_MAX];
-} MSSSpiState;
+};
 
 #endif /* HW_MSS_SPI_H */
diff --git a/include/hw/ssi/pl022.h b/include/hw/ssi/pl022.h
index a080519366..64aeb61eef 100644
--- a/include/hw/ssi/pl022.h
+++ b/include/hw/ssi/pl022.h
@@ -22,11 +22,13 @@
 #define HW_SSI_PL022_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_PL022 "pl022"
+typedef struct PL022State PL022State;
 #define PL022(obj) OBJECT_CHECK(PL022State, (obj), TYPE_PL022)
 
-typedef struct PL022State {
+struct PL022State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -46,6 +48,6 @@ typedef struct PL022State {
     uint16_t rx_fifo[8];
     qemu_irq irq;
     SSIBus *ssi;
-} PL022State;
+};
 
 #endif
diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index eac168aa1d..b42765f415 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -12,6 +12,7 @@
 #define QEMU_SSI_H
 
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 typedef struct SSISlave SSISlave;
 typedef struct SSISlaveClass SSISlaveClass;
diff --git a/include/hw/ssi/stm32f2xx_spi.h b/include/hw/ssi/stm32f2xx_spi.h
index e24b007abf..1c8ff7d724 100644
--- a/include/hw/ssi/stm32f2xx_spi.h
+++ b/include/hw/ssi/stm32f2xx_spi.h
@@ -27,6 +27,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/ssi/ssi.h"
+#include "qom/object.h"
 
 #define STM_SPI_CR1     0x00
 #define STM_SPI_CR2     0x04
@@ -44,10 +45,11 @@
 #define STM_SPI_SR_RXNE   1
 
 #define TYPE_STM32F2XX_SPI "stm32f2xx-spi"
+typedef struct STM32F2XXSPIState STM32F2XXSPIState;
 #define STM32F2XX_SPI(obj) \
     OBJECT_CHECK(STM32F2XXSPIState, (obj), TYPE_STM32F2XX_SPI)
 
-typedef struct {
+struct STM32F2XXSPIState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -66,6 +68,6 @@ typedef struct {
 
     qemu_irq irq;
     SSIBus *ssi;
-} STM32F2XXSPIState;
+};
 
 #endif /* HW_STM32F2XX_SPI_H */
diff --git a/include/hw/ssi/xilinx_spips.h b/include/hw/ssi/xilinx_spips.h
index 6a39b55a7b..2171018601 100644
--- a/include/hw/ssi/xilinx_spips.h
+++ b/include/hw/ssi/xilinx_spips.h
@@ -29,6 +29,7 @@
 #include "qemu/fifo32.h"
 #include "hw/stream.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 typedef struct XilinxSPIPS XilinxSPIPS;
 
@@ -85,16 +86,17 @@ struct XilinxSPIPS {
     bool man_start_com;
 };
 
-typedef struct {
+struct XilinxQSPIPS {
     XilinxSPIPS parent_obj;
 
     uint8_t lqspi_buf[LQSPI_CACHE_SIZE];
     hwaddr lqspi_cached_addr;
     Error *migration_blocker;
     bool mmio_execution_enabled;
-} XilinxQSPIPS;
+};
+typedef struct XilinxQSPIPS XilinxQSPIPS;
 
-typedef struct {
+struct XlnxZynqMPQSPIPS {
     XilinxQSPIPS parent_obj;
 
     StreamSlave *dma;
@@ -117,16 +119,18 @@ typedef struct {
     bool man_start_com_g;
     uint32_t dma_burst_size;
     uint8_t dma_buf[QSPI_DMA_MAX_BURST_SIZE];
-} XlnxZynqMPQSPIPS;
+};
+typedef struct XlnxZynqMPQSPIPS XlnxZynqMPQSPIPS;
 
-typedef struct XilinxSPIPSClass {
+struct XilinxSPIPSClass {
     SysBusDeviceClass parent_class;
 
     const MemoryRegionOps *reg_ops;
 
     uint32_t rx_fifo_size;
     uint32_t tx_fifo_size;
-} XilinxSPIPSClass;
+};
+typedef struct XilinxSPIPSClass XilinxSPIPSClass;
 
 #define TYPE_XILINX_SPIPS "xlnx.ps7-spi"
 #define TYPE_XILINX_QSPIPS "xlnx.ps7-qspi"
diff --git a/include/hw/stream.h b/include/hw/stream.h
index ed09e83683..bd41750e94 100644
--- a/include/hw/stream.h
+++ b/include/hw/stream.h
@@ -6,6 +6,7 @@
 /* stream slave. Used until qdev provides a generic way.  */
 #define TYPE_STREAM_SLAVE "stream-slave"
 
+typedef struct StreamSlaveClass StreamSlaveClass;
 #define STREAM_SLAVE_CLASS(klass) \
      OBJECT_CLASS_CHECK(StreamSlaveClass, (klass), TYPE_STREAM_SLAVE)
 #define STREAM_SLAVE_GET_CLASS(obj) \
@@ -17,7 +18,7 @@ typedef struct StreamSlave StreamSlave;
 
 typedef void (*StreamCanPushNotifyFn)(void *opaque);
 
-typedef struct StreamSlaveClass {
+struct StreamSlaveClass {
     InterfaceClass parent;
     /**
      * can push - determine if a stream slave is capable of accepting at least
@@ -42,7 +43,7 @@ typedef struct StreamSlaveClass {
      * @eop: End of packet flag
      */
     size_t (*push)(StreamSlave *obj, unsigned char *buf, size_t len, bool eop);
-} StreamSlaveClass;
+};
 
 size_t
 stream_push(StreamSlave *sink, uint8_t *buf, size_t len, bool eop);
diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index da9f85c58c..3537e43f23 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -5,6 +5,7 @@
 
 #include "hw/qdev-core.h"
 #include "exec/memory.h"
+#include "qom/object.h"
 
 #define QDEV_MAX_MMIO 32
 #define QDEV_MAX_PIO 32
@@ -15,6 +16,7 @@
 typedef struct SysBusDevice SysBusDevice;
 
 #define TYPE_SYS_BUS_DEVICE "sys-bus-device"
+typedef struct SysBusDeviceClass SysBusDeviceClass;
 #define SYS_BUS_DEVICE(obj) \
      OBJECT_CHECK(SysBusDevice, (obj), TYPE_SYS_BUS_DEVICE)
 #define SYS_BUS_DEVICE_CLASS(klass) \
@@ -31,7 +33,7 @@ typedef struct SysBusDevice SysBusDevice;
 
 #define SYSBUS_DEVICE_GPIO_IRQ "sysbus-irq"
 
-typedef struct SysBusDeviceClass {
+struct SysBusDeviceClass {
     /*< private >*/
     DeviceClass parent_class;
 
@@ -52,7 +54,7 @@ typedef struct SysBusDeviceClass {
      */
     char *(*explicit_ofw_unit_address)(const SysBusDevice *dev);
     void (*connect_irq_notifier)(SysBusDevice *dev, qemu_irq irq);
-} SysBusDeviceClass;
+};
 
 struct SysBusDevice {
     /*< private >*/
diff --git a/include/hw/timer/a9gtimer.h b/include/hw/timer/a9gtimer.h
index 81c4388784..88811c6c8f 100644
--- a/include/hw/timer/a9gtimer.h
+++ b/include/hw/timer/a9gtimer.h
@@ -24,10 +24,12 @@
 #define A9GTIMER_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define A9_GTIMER_MAX_CPUS 4
 
 #define TYPE_A9_GTIMER "arm.cortex-a9-global-timer"
+typedef struct A9GTimerState A9GTimerState;
 #define A9_GTIMER(obj) OBJECT_CHECK(A9GTimerState, (obj), TYPE_A9_GTIMER)
 
 #define R_COUNTER_LO                0x00
@@ -55,7 +57,6 @@
 #define R_AUTO_INCREMENT            0x18
 
 typedef struct A9GTimerPerCPU A9GTimerPerCPU;
-typedef struct A9GTimerState A9GTimerState;
 
 struct A9GTimerPerCPU {
     A9GTimerState *parent;
diff --git a/include/hw/timer/allwinner-a10-pit.h b/include/hw/timer/allwinner-a10-pit.h
index 871c95b512..fa060c684d 100644
--- a/include/hw/timer/allwinner-a10-pit.h
+++ b/include/hw/timer/allwinner-a10-pit.h
@@ -3,8 +3,10 @@
 
 #include "hw/ptimer.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_AW_A10_PIT "allwinner-A10-timer"
+typedef struct AwA10PITState AwA10PITState;
 #define AW_A10_PIT(obj) OBJECT_CHECK(AwA10PITState, (obj), TYPE_AW_A10_PIT)
 
 #define AW_A10_PIT_TIMER_NR    6
@@ -36,7 +38,6 @@
 
 #define AW_A10_PIT_DEFAULT_CLOCK   0x4
 
-typedef struct AwA10PITState AwA10PITState;
 
 typedef struct AwA10TimerContext {
     AwA10PITState *container;
diff --git a/include/hw/timer/arm_mptimer.h b/include/hw/timer/arm_mptimer.h
index c46d8d2309..643a256ecf 100644
--- a/include/hw/timer/arm_mptimer.h
+++ b/include/hw/timer/arm_mptimer.h
@@ -22,6 +22,7 @@
 #define HW_TIMER_ARM_MPTIMER_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define ARM_MPTIMER_MAX_CPUS 4
 
@@ -35,10 +36,11 @@ typedef struct {
 } TimerBlock;
 
 #define TYPE_ARM_MPTIMER "arm_mptimer"
+typedef struct ARMMPTimerState ARMMPTimerState;
 #define ARM_MPTIMER(obj) \
     OBJECT_CHECK(ARMMPTimerState, (obj), TYPE_ARM_MPTIMER)
 
-typedef struct {
+struct ARMMPTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -46,6 +48,6 @@ typedef struct {
     uint32_t num_cpu;
     TimerBlock timerblock[ARM_MPTIMER_MAX_CPUS];
     MemoryRegion iomem;
-} ARMMPTimerState;
+};
 
 #endif
diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
index 25e5ceacc8..33df057958 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -13,12 +13,14 @@
 #define HW_TIMER_ARMV7M_SYSTICK_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_SYSTICK "armv7m_systick"
 
+typedef struct SysTickState SysTickState;
 #define SYSTICK(obj) OBJECT_CHECK(SysTickState, (obj), TYPE_SYSTICK)
 
-typedef struct SysTickState {
+struct SysTickState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -29,7 +31,7 @@ typedef struct SysTickState {
     QEMUTimer *timer;
     MemoryRegion iomem;
     qemu_irq irq;
-} SysTickState;
+};
 
 /*
  * Multiplication factor to convert from system clock ticks to qemu timer
diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
index d7c7d8ad28..c890aaa949 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -24,10 +24,13 @@
 
 #include "qemu/timer.h"
 #include "hw/misc/aspeed_scu.h"
+#include "qom/object.h"
 
+#define TYPE_ASPEED_TIMER "aspeed.timer"
+typedef struct AspeedTimerClass AspeedTimerClass;
+typedef struct AspeedTimerCtrlState AspeedTimerCtrlState;
 #define ASPEED_TIMER(obj) \
     OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER)
-#define TYPE_ASPEED_TIMER "aspeed.timer"
 #define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
 #define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
 #define TYPE_ASPEED_2600_TIMER TYPE_ASPEED_TIMER "-ast2600"
@@ -50,7 +53,7 @@ typedef struct AspeedTimer {
     uint64_t start;
 } AspeedTimer;
 
-typedef struct AspeedTimerCtrlState {
+struct AspeedTimerCtrlState {
     /*< private >*/
     SysBusDevice parent;
 
@@ -64,18 +67,18 @@ typedef struct AspeedTimerCtrlState {
     AspeedTimer timers[ASPEED_TIMER_NR_TIMERS];
 
     AspeedSCUState *scu;
-} AspeedTimerCtrlState;
+};
 
 #define ASPEED_TIMER_CLASS(klass) \
      OBJECT_CLASS_CHECK(AspeedTimerClass, (klass), TYPE_ASPEED_TIMER)
 #define ASPEED_TIMER_GET_CLASS(obj) \
      OBJECT_GET_CLASS(AspeedTimerClass, (obj), TYPE_ASPEED_TIMER)
 
-typedef struct AspeedTimerClass {
+struct AspeedTimerClass {
     SysBusDeviceClass parent_class;
 
     uint64_t (*read)(AspeedTimerCtrlState *s, hwaddr offset);
     void (*write)(AspeedTimerCtrlState *s, hwaddr offset, uint64_t value);
-} AspeedTimerClass;
+};
 
 #endif /* ASPEED_TIMER_H */
diff --git a/include/hw/timer/avr_timer16.h b/include/hw/timer/avr_timer16.h
index 982019d242..9efe75ce5e 100644
--- a/include/hw/timer/avr_timer16.h
+++ b/include/hw/timer/avr_timer16.h
@@ -31,6 +31,7 @@
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/hw.h"
+#include "qom/object.h"
 
 enum NextInterrupt {
     OVERFLOW,
@@ -41,10 +42,11 @@ enum NextInterrupt {
 };
 
 #define TYPE_AVR_TIMER16 "avr-timer16"
+typedef struct AVRTimer16State AVRTimer16State;
 #define AVR_TIMER16(obj) \
     OBJECT_CHECK(AVRTimer16State, (obj), TYPE_AVR_TIMER16)
 
-typedef struct AVRTimer16State {
+struct AVRTimer16State {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -89,6 +91,6 @@ typedef struct AVRTimer16State {
     uint64_t period_ns;
     uint64_t reset_time_ns;
     enum NextInterrupt next_interrupt;
-} AVRTimer16State;
+};
 
 #endif /* HW_TIMER_AVR_TIMER16_H */
diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835_systmr.h
index c0bc5c8127..796f62cf88 100644
--- a/include/hw/timer/bcm2835_systmr.h
+++ b/include/hw/timer/bcm2835_systmr.h
@@ -11,12 +11,14 @@
 
 #include "hw/sysbus.h"
 #include "hw/irq.h"
+#include "qom/object.h"
 
 #define TYPE_BCM2835_SYSTIMER "bcm2835-sys-timer"
+typedef struct BCM2835SystemTimerState BCM2835SystemTimerState;
 #define BCM2835_SYSTIMER(obj) \
     OBJECT_CHECK(BCM2835SystemTimerState, (obj), TYPE_BCM2835_SYSTIMER)
 
-typedef struct {
+struct BCM2835SystemTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -28,6 +30,6 @@ typedef struct {
         uint32_t status;
         uint32_t compare[4];
     } reg;
-} BCM2835SystemTimerState;
+};
 
 #endif
diff --git a/include/hw/timer/cmsdk-apb-dualtimer.h b/include/hw/timer/cmsdk-apb-dualtimer.h
index 9843a9dbb1..8a1137aec7 100644
--- a/include/hw/timer/cmsdk-apb-dualtimer.h
+++ b/include/hw/timer/cmsdk-apb-dualtimer.h
@@ -28,12 +28,13 @@
 
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
+#include "qom/object.h"
 
 #define TYPE_CMSDK_APB_DUALTIMER "cmsdk-apb-dualtimer"
+typedef struct CMSDKAPBDualTimer CMSDKAPBDualTimer;
 #define CMSDK_APB_DUALTIMER(obj) OBJECT_CHECK(CMSDKAPBDualTimer, (obj), \
                                               TYPE_CMSDK_APB_DUALTIMER)
 
-typedef struct CMSDKAPBDualTimer CMSDKAPBDualTimer;
 
 /* One of the two identical timer modules in the dual-timer module */
 typedef struct CMSDKAPBDualTimerModule {
diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index f24bda6a46..a7ca523529 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -15,12 +15,14 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
+#include "qom/object.h"
 
 #define TYPE_CMSDK_APB_TIMER "cmsdk-apb-timer"
+typedef struct CMSDKAPBTIMER CMSDKAPBTIMER;
 #define CMSDK_APB_TIMER(obj) OBJECT_CHECK(CMSDKAPBTIMER, (obj), \
                                          TYPE_CMSDK_APB_TIMER)
 
-typedef struct {
+struct CMSDKAPBTIMER {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -34,7 +36,7 @@ typedef struct {
     uint32_t value;
     uint32_t reload;
     uint32_t intstatus;
-} CMSDKAPBTIMER;
+};
 
 /**
  * cmsdk_apb_timer_create - convenience function to create TYPE_CMSDK_APB_TIMER
diff --git a/include/hw/timer/digic-timer.h b/include/hw/timer/digic-timer.h
index d9e67fe291..543bf8c6be 100644
--- a/include/hw/timer/digic-timer.h
+++ b/include/hw/timer/digic-timer.h
@@ -20,8 +20,10 @@
 
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
+#include "qom/object.h"
 
 #define TYPE_DIGIC_TIMER "digic-timer"
+typedef struct DigicTimerState DigicTimerState;
 #define DIGIC_TIMER(obj) OBJECT_CHECK(DigicTimerState, (obj), TYPE_DIGIC_TIMER)
 
 #define DIGIC_TIMER_CONTROL 0x00
@@ -30,7 +32,7 @@
 #define DIGIC_TIMER_RELVALUE 0x08
 #define DIGIC_TIMER_VALUE 0x0c
 
-typedef struct DigicTimerState {
+struct DigicTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -40,6 +42,6 @@ typedef struct DigicTimerState {
 
     uint32_t control;
     uint32_t relvalue;
-} DigicTimerState;
+};
 
 #endif /* HW_TIMER_DIGIC_TIMER_H */
diff --git a/include/hw/timer/i8254.h b/include/hw/timer/i8254.h
index 206b8f8464..6adbc31e7e 100644
--- a/include/hw/timer/i8254.h
+++ b/include/hw/timer/i8254.h
@@ -28,6 +28,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/isa/isa.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 
 #define PIT_FREQ 1193182
 
diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index 0730ac35e6..1ca110caf5 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -32,6 +32,7 @@
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
 #include "hw/misc/imx_ccm.h"
+#include "qom/object.h"
 
 /*
  * EPIT: Enhanced periodic interrupt timer
@@ -55,9 +56,10 @@
 #define EPIT_TIMER_MAX  0XFFFFFFFFUL
 
 #define TYPE_IMX_EPIT "imx.epit"
+typedef struct IMXEPITState IMXEPITState;
 #define IMX_EPIT(obj) OBJECT_CHECK(IMXEPITState, (obj), TYPE_IMX_EPIT)
 
-typedef struct IMXEPITState{
+struct IMXEPITState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -75,6 +77,6 @@ typedef struct IMXEPITState{
 
     uint32_t freq;
     qemu_irq irq;
-} IMXEPITState;
+};
 
 #endif /* IMX_EPIT_H */
diff --git a/include/hw/timer/imx_gpt.h b/include/hw/timer/imx_gpt.h
index 20ccb327c4..b96633d8b2 100644
--- a/include/hw/timer/imx_gpt.h
+++ b/include/hw/timer/imx_gpt.h
@@ -32,6 +32,7 @@
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
 #include "hw/misc/imx_ccm.h"
+#include "qom/object.h"
 
 /*
  * GPT : General purpose timer
@@ -81,9 +82,10 @@
 
 #define TYPE_IMX_GPT TYPE_IMX25_GPT
 
+typedef struct IMXGPTState IMXGPTState;
 #define IMX_GPT(obj) OBJECT_CHECK(IMXGPTState, (obj), TYPE_IMX_GPT)
 
-typedef struct IMXGPTState{
+struct IMXGPTState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -111,6 +113,6 @@ typedef struct IMXGPTState{
     qemu_irq irq;
 
     const IMXClk *clocks;
-} IMXGPTState;
+};
 
 #endif /* IMX_GPT_H */
diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer.h
index e5a784b27e..011c5f1ba9 100644
--- a/include/hw/timer/mss-timer.h
+++ b/include/hw/timer/mss-timer.h
@@ -27,8 +27,10 @@
 
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
+#include "qom/object.h"
 
 #define TYPE_MSS_TIMER     "mss-timer"
+typedef struct MSSTimerState MSSTimerState;
 #define MSS_TIMER(obj)     OBJECT_CHECK(MSSTimerState, \
                               (obj), TYPE_MSS_TIMER)
 
@@ -52,12 +54,12 @@ struct Msf2Timer {
     qemu_irq irq;
 };
 
-typedef struct MSSTimerState {
+struct MSSTimerState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
     uint32_t freq_hz;
     struct Msf2Timer timers[NUM_TIMERS];
-} MSSTimerState;
+};
 
 #endif /* HW_MSS_TIMER_H */
diff --git a/include/hw/timer/nrf51_timer.h b/include/hw/timer/nrf51_timer.h
index eb6815f21d..b4eb29bd76 100644
--- a/include/hw/timer/nrf51_timer.h
+++ b/include/hw/timer/nrf51_timer.h
@@ -15,7 +15,9 @@
 
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 #define TYPE_NRF51_TIMER "nrf51_soc.timer"
+typedef struct NRF51TimerState NRF51TimerState;
 #define NRF51_TIMER(obj) OBJECT_CHECK(NRF51TimerState, (obj), TYPE_NRF51_TIMER)
 
 #define NRF51_TIMER_REG_COUNT 4
@@ -53,7 +55,7 @@
 #define NRF51_TIMER_REG_CC0 0x540
 #define NRF51_TIMER_REG_CC3 0x54C
 
-typedef struct NRF51TimerState {
+struct NRF51TimerState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -75,7 +77,7 @@ typedef struct NRF51TimerState {
     uint32_t bitmode;
     uint32_t prescaler;
 
-} NRF51TimerState;
+};
 
 
 #endif
diff --git a/include/hw/timer/renesas_cmt.h b/include/hw/timer/renesas_cmt.h
index e28a15cb38..313f9e1965 100644
--- a/include/hw/timer/renesas_cmt.h
+++ b/include/hw/timer/renesas_cmt.h
@@ -11,8 +11,10 @@
 
 #include "qemu/timer.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_RENESAS_CMT "renesas-cmt"
+typedef struct RCMTState RCMTState;
 #define RCMT(obj) OBJECT_CHECK(RCMTState, (obj), TYPE_RENESAS_CMT)
 
 enum {
@@ -20,7 +22,7 @@ enum {
     CMT_NR_IRQ = 1 * CMT_CH
 };
 
-typedef struct RCMTState {
+struct RCMTState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -35,6 +37,6 @@ typedef struct RCMTState {
     int64_t tick[CMT_CH];
     qemu_irq cmi[CMT_CH];
     QEMUTimer timer[CMT_CH];
-} RCMTState;
+};
 
 #endif
diff --git a/include/hw/timer/renesas_tmr.h b/include/hw/timer/renesas_tmr.h
index cf3baa7a28..e2abcb13ad 100644
--- a/include/hw/timer/renesas_tmr.h
+++ b/include/hw/timer/renesas_tmr.h
@@ -11,8 +11,10 @@
 
 #include "qemu/timer.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_RENESAS_TMR "renesas-tmr"
+typedef struct RTMRState RTMRState;
 #define RTMR(obj) OBJECT_CHECK(RTMRState, (obj), TYPE_RENESAS_TMR)
 
 enum timer_event {
@@ -28,7 +30,7 @@ enum {
     TMR_NR_IRQ = 3 * TMR_CH
 };
 
-typedef struct RTMRState {
+struct RTMRState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -50,6 +52,6 @@ typedef struct RTMRState {
     qemu_irq cmib[TMR_CH];
     qemu_irq ovi[TMR_CH];
     QEMUTimer timer[TMR_CH];
-} RTMRState;
+};
 
 #endif
diff --git a/include/hw/timer/stm32f2xx_timer.h b/include/hw/timer/stm32f2xx_timer.h
index a96bc08b1b..9eb9201085 100644
--- a/include/hw/timer/stm32f2xx_timer.h
+++ b/include/hw/timer/stm32f2xx_timer.h
@@ -27,6 +27,7 @@
 
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 
 #define TIM_CR1      0x00
 #define TIM_CR2      0x04
@@ -61,10 +62,11 @@
 #define TIM_DIER_UIE  1
 
 #define TYPE_STM32F2XX_TIMER "stm32f2xx-timer"
+typedef struct STM32F2XXTimerState STM32F2XXTimerState;
 #define STM32F2XXTIMER(obj) OBJECT_CHECK(STM32F2XXTimerState, \
                             (obj), TYPE_STM32F2XX_TIMER)
 
-typedef struct STM32F2XXTimerState {
+struct STM32F2XXTimerState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -95,6 +97,6 @@ typedef struct STM32F2XXTimerState {
     uint32_t tim_dcr;
     uint32_t tim_dmar;
     uint32_t tim_or;
-} STM32F2XXTimerState;
+};
 
 #endif /* HW_STM32F2XX_TIMER_H */
diff --git a/include/hw/usb.h b/include/hw/usb.h
index e29a37635b..e6ec0c891c 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -29,6 +29,7 @@
 #include "hw/qdev-core.h"
 #include "qemu/iov.h"
 #include "qemu/queue.h"
+#include "qom/object.h"
 
 /* Constants related to the USB / PCI interaction */
 #define USB_SBRN    0x60 /* Serial Bus Release Number Register */
@@ -264,6 +265,7 @@ struct USBDevice {
 };
 
 #define TYPE_USB_DEVICE "usb-device"
+typedef struct USBDeviceClass USBDeviceClass;
 #define USB_DEVICE(obj) \
      OBJECT_CHECK(USBDevice, (obj), TYPE_USB_DEVICE)
 #define USB_DEVICE_CLASS(klass) \
@@ -274,7 +276,7 @@ struct USBDevice {
 typedef void (*USBDeviceRealize)(USBDevice *dev, Error **errp);
 typedef void (*USBDeviceUnrealize)(USBDevice *dev);
 
-typedef struct USBDeviceClass {
+struct USBDeviceClass {
     DeviceClass parent_class;
 
     USBDeviceRealize realize;
@@ -346,7 +348,7 @@ typedef struct USBDeviceClass {
     const char *product_desc;
     const USBDesc *usb_desc;
     bool attached_settable;
-} USBDeviceClass;
+};
 
 typedef struct USBPortOps {
     void (*attach)(USBPort *port);
diff --git a/include/hw/usb/chipidea.h b/include/hw/usb/chipidea.h
index 1ec2e9dbda..1db449e1c4 100644
--- a/include/hw/usb/chipidea.h
+++ b/include/hw/usb/chipidea.h
@@ -2,13 +2,15 @@
 #define CHIPIDEA_H
 
 #include "hw/usb/hcd-ehci.h"
+#include "qom/object.h"
 
-typedef struct ChipideaState {
+struct ChipideaState {
     /*< private >*/
     EHCISysBusState parent_obj;
 
     MemoryRegion iomem[3];
-} ChipideaState;
+};
+typedef struct ChipideaState ChipideaState;
 
 #define TYPE_CHIPIDEA "usb-chipidea"
 #define CHIPIDEA(obj) OBJECT_CHECK(ChipideaState, (obj), TYPE_CHIPIDEA)
diff --git a/include/hw/usb/imx-usb-phy.h b/include/hw/usb/imx-usb-phy.h
index 07f0235d10..9861acb5ac 100644
--- a/include/hw/usb/imx-usb-phy.h
+++ b/include/hw/usb/imx-usb-phy.h
@@ -3,6 +3,7 @@
 
 #include "hw/sysbus.h"
 #include "qemu/bitops.h"
+#include "qom/object.h"
 
 enum IMXUsbPhyRegisters {
     USBPHY_PWD,
@@ -38,9 +39,10 @@ enum IMXUsbPhyRegisters {
 #define USBPHY_CTRL_SFTRST BIT(31)
 
 #define TYPE_IMX_USBPHY "imx.usbphy"
+typedef struct IMXUSBPHYState IMXUSBPHYState;
 #define IMX_USBPHY(obj) OBJECT_CHECK(IMXUSBPHYState, (obj), TYPE_IMX_USBPHY)
 
-typedef struct IMXUSBPHYState {
+struct IMXUSBPHYState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -48,6 +50,6 @@ typedef struct IMXUSBPHYState {
     MemoryRegion iomem;
 
     uint32_t usbphy[USBPHY_MAX];
-} IMXUSBPHYState;
+};
 
 #endif /* IMX_USB_PHY_H */
diff --git a/include/hw/vfio/vfio-amd-xgbe.h b/include/hw/vfio/vfio-amd-xgbe.h
index 9fff65e99d..b860ac0446 100644
--- a/include/hw/vfio/vfio-amd-xgbe.h
+++ b/include/hw/vfio/vfio-amd-xgbe.h
@@ -15,6 +15,7 @@
 #define HW_VFIO_VFIO_AMD_XGBE_H
 
 #include "hw/vfio/vfio-platform.h"
+#include "qom/object.h"
 
 #define TYPE_VFIO_AMD_XGBE "vfio-amd-xgbe"
 
diff --git a/include/hw/vfio/vfio-calxeda-xgmac.h b/include/hw/vfio/vfio-calxeda-xgmac.h
index f994775c09..b19dc2160b 100644
--- a/include/hw/vfio/vfio-calxeda-xgmac.h
+++ b/include/hw/vfio/vfio-calxeda-xgmac.h
@@ -15,6 +15,7 @@
 #define HW_VFIO_VFIO_CALXEDA_XGMAC_H
 
 #include "hw/vfio/vfio-platform.h"
+#include "qom/object.h"
 
 #define TYPE_VFIO_CALXEDA_XGMAC "vfio-calxeda-xgmac"
 
@@ -23,16 +24,18 @@
  * - a single MMIO region corresponding to its register space
  * - 3 IRQS (main and 2 power related IRQs)
  */
-typedef struct VFIOCalxedaXgmacDevice {
+struct VFIOCalxedaXgmacDevice {
     VFIOPlatformDevice vdev;
-} VFIOCalxedaXgmacDevice;
+};
+typedef struct VFIOCalxedaXgmacDevice VFIOCalxedaXgmacDevice;
 
-typedef struct VFIOCalxedaXgmacDeviceClass {
+struct VFIOCalxedaXgmacDeviceClass {
     /*< private >*/
     VFIOPlatformDeviceClass parent_class;
     /*< public >*/
     DeviceRealize parent_realize;
-} VFIOCalxedaXgmacDeviceClass;
+};
+typedef struct VFIOCalxedaXgmacDeviceClass VFIOCalxedaXgmacDeviceClass;
 
 #define VFIO_CALXEDA_XGMAC_DEVICE(obj) \
      OBJECT_CHECK(VFIOCalxedaXgmacDevice, (obj), TYPE_VFIO_CALXEDA_XGMAC)
diff --git a/include/hw/vfio/vfio-platform.h b/include/hw/vfio/vfio-platform.h
index 4ec70c813a..248c23dba7 100644
--- a/include/hw/vfio/vfio-platform.h
+++ b/include/hw/vfio/vfio-platform.h
@@ -20,6 +20,7 @@
 #include "hw/vfio/vfio-common.h"
 #include "qemu/event_notifier.h"
 #include "qemu/queue.h"
+#include "qom/object.h"
 
 #define TYPE_VFIO_PLATFORM "vfio-platform"
 
@@ -46,7 +47,7 @@ typedef struct VFIOINTp {
 /* function type for user side eventfd handler */
 typedef void (*eventfd_user_side_handler_t)(VFIOINTp *intp);
 
-typedef struct VFIOPlatformDevice {
+struct VFIOPlatformDevice {
     SysBusDevice sbdev;
     VFIODevice vbasedev; /* not a QOM object */
     VFIORegion **regions;
@@ -59,13 +60,15 @@ typedef struct VFIOPlatformDevice {
     QEMUTimer *mmap_timer; /* allows fast-path resume after IRQ hit */
     QemuMutex intp_mutex; /* protect the intp_list IRQ state */
     bool irqfd_allowed; /* debug option to force irqfd on/off */
-} VFIOPlatformDevice;
+};
+typedef struct VFIOPlatformDevice VFIOPlatformDevice;
 
-typedef struct VFIOPlatformDeviceClass {
+struct VFIOPlatformDeviceClass {
     /*< private >*/
     SysBusDeviceClass parent_class;
     /*< public >*/
-} VFIOPlatformDeviceClass;
+};
+typedef struct VFIOPlatformDeviceClass VFIOPlatformDeviceClass;
 
 #define VFIO_PLATFORM_DEVICE(obj) \
      OBJECT_CHECK(VFIOPlatformDevice, (obj), TYPE_VFIO_PLATFORM)
diff --git a/include/hw/virtio/vhost-scsi-common.h b/include/hw/virtio/vhost-scsi-common.h
index 16bf1a73c1..f198f25119 100644
--- a/include/hw/virtio/vhost-scsi-common.h
+++ b/include/hw/virtio/vhost-scsi-common.h
@@ -17,12 +17,14 @@
 #include "hw/virtio/virtio-scsi.h"
 #include "hw/virtio/vhost.h"
 #include "hw/fw-path-provider.h"
+#include "qom/object.h"
 
 #define TYPE_VHOST_SCSI_COMMON "vhost-scsi-common"
+typedef struct VHostSCSICommon VHostSCSICommon;
 #define VHOST_SCSI_COMMON(obj) \
         OBJECT_CHECK(VHostSCSICommon, (obj), TYPE_VHOST_SCSI_COMMON)
 
-typedef struct VHostSCSICommon {
+struct VHostSCSICommon {
     VirtIOSCSICommon parent_obj;
 
     Error *migration_blocker;
@@ -35,7 +37,7 @@ typedef struct VHostSCSICommon {
     int lun;
     uint64_t host_features;
     bool migratable;
-} VHostSCSICommon;
+};
 
 int vhost_scsi_common_start(VHostSCSICommon *vsc);
 void vhost_scsi_common_stop(VHostSCSICommon *vsc);
diff --git a/include/hw/virtio/vhost-scsi.h b/include/hw/virtio/vhost-scsi.h
index 23252153ff..72ae842646 100644
--- a/include/hw/virtio/vhost-scsi.h
+++ b/include/hw/virtio/vhost-scsi.h
@@ -17,6 +17,7 @@
 #include "hw/virtio/virtio-scsi.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-scsi-common.h"
+#include "qom/object.h"
 
 enum vhost_scsi_vq_list {
     VHOST_SCSI_VQ_CONTROL = 0,
@@ -25,11 +26,12 @@ enum vhost_scsi_vq_list {
 };
 
 #define TYPE_VHOST_SCSI "vhost-scsi"
+typedef struct VHostSCSI VHostSCSI;
 #define VHOST_SCSI(obj) \
         OBJECT_CHECK(VHostSCSI, (obj), TYPE_VHOST_SCSI)
 
-typedef struct VHostSCSI {
+struct VHostSCSI {
     VHostSCSICommon parent_obj;
-} VHostSCSI;
+};
 
 #endif
diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost-user-blk.h
index 34ad6f0c0e..78b08f41da 100644
--- a/include/hw/virtio/vhost-user-blk.h
+++ b/include/hw/virtio/vhost-user-blk.h
@@ -20,12 +20,14 @@
 #include "chardev/char-fe.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user.h"
+#include "qom/object.h"
 
 #define TYPE_VHOST_USER_BLK "vhost-user-blk"
+typedef struct VHostUserBlk VHostUserBlk;
 #define VHOST_USER_BLK(obj) \
         OBJECT_CHECK(VHostUserBlk, (obj), TYPE_VHOST_USER_BLK)
 
-typedef struct VHostUserBlk {
+struct VHostUserBlk {
     VirtIODevice parent_obj;
     CharBackend chardev;
     int32_t bootindex;
@@ -39,6 +41,6 @@ typedef struct VHostUserBlk {
     struct vhost_virtqueue *vhost_vqs;
     VirtQueue **virtqs;
     bool connected;
-} VHostUserBlk;
+};
 
 #endif
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 6f3030d288..fa82be0e8a 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -18,8 +18,10 @@
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user.h"
 #include "chardev/char-fe.h"
+#include "qom/object.h"
 
 #define TYPE_VHOST_USER_FS "vhost-user-fs-device"
+typedef struct VHostUserFS VHostUserFS;
 #define VHOST_USER_FS(obj) \
         OBJECT_CHECK(VHostUserFS, (obj), TYPE_VHOST_USER_FS)
 
@@ -30,7 +32,7 @@ typedef struct {
     uint16_t queue_size;
 } VHostUserFSConf;
 
-typedef struct {
+struct VHostUserFS {
     /*< private >*/
     VirtIODevice parent;
     VHostUserFSConf conf;
@@ -41,6 +43,6 @@ typedef struct {
     VirtQueue *hiprio_vq;
 
     /*< public >*/
-} VHostUserFS;
+};
 
 #endif /* _QEMU_VHOST_USER_FS_H */
diff --git a/include/hw/virtio/vhost-user-scsi.h b/include/hw/virtio/vhost-user-scsi.h
index 99ab2f2cc4..c4c4c29bf9 100644
--- a/include/hw/virtio/vhost-user-scsi.h
+++ b/include/hw/virtio/vhost-user-scsi.h
@@ -21,14 +21,16 @@
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user.h"
 #include "hw/virtio/vhost-scsi-common.h"
+#include "qom/object.h"
 
 #define TYPE_VHOST_USER_SCSI "vhost-user-scsi"
+typedef struct VHostUserSCSI VHostUserSCSI;
 #define VHOST_USER_SCSI(obj) \
         OBJECT_CHECK(VHostUserSCSI, (obj), TYPE_VHOST_USER_SCSI)
 
-typedef struct VHostUserSCSI {
+struct VHostUserSCSI {
     VHostSCSICommon parent_obj;
     VhostUserState vhost_user;
-} VHostUserSCSI;
+};
 
 #endif /* VHOST_USER_SCSI_H */
diff --git a/include/hw/virtio/vhost-user-vsock.h b/include/hw/virtio/vhost-user-vsock.h
index 4e128a4b9f..d7eda986b6 100644
--- a/include/hw/virtio/vhost-user-vsock.h
+++ b/include/hw/virtio/vhost-user-vsock.h
@@ -14,8 +14,10 @@
 #include "hw/virtio/vhost-vsock-common.h"
 #include "hw/virtio/vhost-user.h"
 #include "standard-headers/linux/virtio_vsock.h"
+#include "qom/object.h"
 
 #define TYPE_VHOST_USER_VSOCK "vhost-user-vsock-device"
+typedef struct VHostUserVSock VHostUserVSock;
 #define VHOST_USER_VSOCK(obj) \
         OBJECT_CHECK(VHostUserVSock, (obj), TYPE_VHOST_USER_VSOCK)
 
@@ -23,7 +25,7 @@ typedef struct {
     CharBackend chardev;
 } VHostUserVSockConf;
 
-typedef struct {
+struct VHostUserVSock {
     /*< private >*/
     VHostVSockCommon parent;
     VhostUserState vhost_user;
@@ -31,6 +33,6 @@ typedef struct {
     struct virtio_vsock_config vsockcfg;
 
     /*< public >*/
-} VHostUserVSock;
+};
 
 #endif /* _QEMU_VHOST_USER_VSOCK_H */
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index f8b4aaae00..a181396215 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -13,8 +13,10 @@
 
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/vhost.h"
+#include "qom/object.h"
 
 #define TYPE_VHOST_VSOCK_COMMON "vhost-vsock-common"
+typedef struct VHostVSockCommon VHostVSockCommon;
 #define VHOST_VSOCK_COMMON(obj) \
         OBJECT_CHECK(VHostVSockCommon, (obj), TYPE_VHOST_VSOCK_COMMON)
 
@@ -24,7 +26,7 @@ enum {
     VHOST_VSOCK_QUEUE_SIZE = 128,
 };
 
-typedef struct {
+struct VHostVSockCommon {
     VirtIODevice parent;
 
     struct vhost_virtqueue vhost_vqs[2];
@@ -35,7 +37,7 @@ typedef struct {
     VirtQueue *trans_vq;
 
     QEMUTimer *post_load_timer;
-} VHostVSockCommon;
+};
 
 int vhost_vsock_common_start(VirtIODevice *vdev);
 void vhost_vsock_common_stop(VirtIODevice *vdev);
diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
index 8cbb7b90f9..e13ff85d12 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -15,8 +15,10 @@
 #define QEMU_VHOST_VSOCK_H
 
 #include "hw/virtio/vhost-vsock-common.h"
+#include "qom/object.h"
 
 #define TYPE_VHOST_VSOCK "vhost-vsock-device"
+typedef struct VHostVSock VHostVSock;
 #define VHOST_VSOCK(obj) \
         OBJECT_CHECK(VHostVSock, (obj), TYPE_VHOST_VSOCK)
 
@@ -25,12 +27,12 @@ typedef struct {
     char *vhostfd;
 } VHostVSockConf;
 
-typedef struct {
+struct VHostVSock {
     /*< private >*/
     VHostVSockCommon parent;
     VHostVSockConf conf;
 
     /*< public >*/
-} VHostVSock;
+};
 
 #endif /* QEMU_VHOST_VSOCK_H */
diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
index 28fd2b3960..a5b869a4d4 100644
--- a/include/hw/virtio/virtio-balloon.h
+++ b/include/hw/virtio/virtio-balloon.h
@@ -18,8 +18,10 @@
 #include "standard-headers/linux/virtio_balloon.h"
 #include "hw/virtio/virtio.h"
 #include "sysemu/iothread.h"
+#include "qom/object.h"
 
 #define TYPE_VIRTIO_BALLOON "virtio-balloon-device"
+typedef struct VirtIOBalloon VirtIOBalloon;
 #define VIRTIO_BALLOON(obj) \
         OBJECT_CHECK(VirtIOBalloon, (obj), TYPE_VIRTIO_BALLOON)
 
@@ -40,7 +42,7 @@ enum virtio_balloon_free_page_hint_status {
     FREE_PAGE_HINT_S_DONE = 3,
 };
 
-typedef struct VirtIOBalloon {
+struct VirtIOBalloon {
     VirtIODevice parent_obj;
     VirtQueue *ivq, *dvq, *svq, *free_page_vq, *reporting_vq;
     uint32_t free_page_hint_status;
@@ -71,6 +73,6 @@ typedef struct VirtIOBalloon {
 
     bool qemu_4_0_config_size;
     uint32_t poison_val;
-} VirtIOBalloon;
+};
 
 #endif
diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index b1334c3904..b9fb689b92 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -19,8 +19,10 @@
 #include "hw/block/block.h"
 #include "sysemu/iothread.h"
 #include "sysemu/block-backend.h"
+#include "qom/object.h"
 
 #define TYPE_VIRTIO_BLK "virtio-blk-device"
+typedef struct VirtIOBlock VirtIOBlock;
 #define VIRTIO_BLK(obj) \
         OBJECT_CHECK(VirtIOBlock, (obj), TYPE_VIRTIO_BLK)
 
@@ -47,7 +49,7 @@ struct VirtIOBlkConf
 struct VirtIOBlockDataPlane;
 
 struct VirtIOBlockReq;
-typedef struct VirtIOBlock {
+struct VirtIOBlock {
     VirtIODevice parent_obj;
     BlockBackend *blk;
     void *rq;
@@ -61,7 +63,7 @@ typedef struct VirtIOBlock {
     struct VirtIOBlockDataPlane *dataplane;
     uint64_t host_features;
     size_t config_size;
-} VirtIOBlock;
+};
 
 typedef struct VirtIOBlockReq {
     VirtQueueElement elem;
diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
index 0f6f215925..f3e9096370 100644
--- a/include/hw/virtio/virtio-bus.h
+++ b/include/hw/virtio/virtio-bus.h
@@ -27,17 +27,19 @@
 
 #include "hw/qdev-core.h"
 #include "hw/virtio/virtio.h"
+#include "qom/object.h"
 
 #define TYPE_VIRTIO_BUS "virtio-bus"
+typedef struct VirtioBusClass VirtioBusClass;
+typedef struct VirtioBusState VirtioBusState;
 #define VIRTIO_BUS_GET_CLASS(obj) \
         OBJECT_GET_CLASS(VirtioBusClass, obj, TYPE_VIRTIO_BUS)
 #define VIRTIO_BUS_CLASS(klass) \
         OBJECT_CLASS_CHECK(VirtioBusClass, klass, TYPE_VIRTIO_BUS)
 #define VIRTIO_BUS(obj) OBJECT_CHECK(VirtioBusState, (obj), TYPE_VIRTIO_BUS)
 
-typedef struct VirtioBusState VirtioBusState;
 
-typedef struct VirtioBusClass {
+struct VirtioBusClass {
     /* This is what a VirtioBus must implement */
     BusClass parent;
     void (*notify)(DeviceState *d, uint16_t vector);
@@ -94,7 +96,7 @@ typedef struct VirtioBusClass {
      */
     bool has_variable_vring_alignment;
     AddressSpace *(*get_dma_as)(DeviceState *d);
-} VirtioBusClass;
+};
 
 struct VirtioBusState {
     BusState parent_obj;
diff --git a/include/hw/virtio/virtio-crypto.h b/include/hw/virtio/virtio-crypto.h
index ffe2391ece..4134e1b7ca 100644
--- a/include/hw/virtio/virtio-crypto.h
+++ b/include/hw/virtio/virtio-crypto.h
@@ -18,6 +18,7 @@
 #include "hw/virtio/virtio.h"
 #include "sysemu/iothread.h"
 #include "sysemu/cryptodev.h"
+#include "qom/object.h"
 
 
 #define DEBUG_VIRTIO_CRYPTO 0
@@ -31,6 +32,7 @@ do { \
 
 
 #define TYPE_VIRTIO_CRYPTO "virtio-crypto-device"
+typedef struct VirtIOCrypto VirtIOCrypto;
 #define VIRTIO_CRYPTO(obj) \
         OBJECT_CHECK(VirtIOCrypto, (obj), TYPE_VIRTIO_CRYPTO)
 #define VIRTIO_CRYPTO_GET_PARENT_CLASS(obj) \
@@ -82,7 +84,7 @@ typedef struct VirtIOCryptoQueue {
     struct VirtIOCrypto *vcrypto;
 } VirtIOCryptoQueue;
 
-typedef struct VirtIOCrypto {
+struct VirtIOCrypto {
     VirtIODevice parent_obj;
 
     VirtQueue *ctrl_vq;
@@ -97,6 +99,6 @@ typedef struct VirtIOCrypto {
     uint32_t curr_queues;
     size_t config_size;
     uint8_t vhost_started;
-} VirtIOCrypto;
+};
 
 #endif /* QEMU_VIRTIO_CRYPTO_H */
diff --git a/include/hw/virtio/virtio-gpu-pci.h b/include/hw/virtio/virtio-gpu-pci.h
index 2f69b5a9cc..d727c8cada 100644
--- a/include/hw/virtio/virtio-gpu-pci.h
+++ b/include/hw/virtio/virtio-gpu-pci.h
@@ -16,6 +16,7 @@
 
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-gpu.h"
+#include "qom/object.h"
 
 typedef struct VirtIOGPUPCIBase VirtIOGPUPCIBase;
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 7517438e10..f464004bc2 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -22,8 +22,11 @@
 #include "sysemu/vhost-user-backend.h"
 
 #include "standard-headers/linux/virtio_gpu.h"
+#include "qom/object.h"
 
 #define TYPE_VIRTIO_GPU_BASE "virtio-gpu-base"
+typedef struct VirtIOGPUBase VirtIOGPUBase;
+typedef struct VirtIOGPUBaseClass VirtIOGPUBaseClass;
 #define VIRTIO_GPU_BASE(obj)                                                \
     OBJECT_CHECK(VirtIOGPUBase, (obj), TYPE_VIRTIO_GPU_BASE)
 #define VIRTIO_GPU_BASE_GET_CLASS(obj)                                      \
@@ -32,10 +35,12 @@
     OBJECT_CLASS_CHECK(VirtIOGPUBaseClass, klass, TYPE_VIRTIO_GPU_BASE)
 
 #define TYPE_VIRTIO_GPU "virtio-gpu-device"
+typedef struct VirtIOGPU VirtIOGPU;
 #define VIRTIO_GPU(obj)                                        \
         OBJECT_CHECK(VirtIOGPU, (obj), TYPE_VIRTIO_GPU)
 
 #define TYPE_VHOST_USER_GPU "vhost-user-gpu"
+typedef struct VhostUserGPU VhostUserGPU;
 #define VHOST_USER_GPU(obj)                                    \
     OBJECT_CHECK(VhostUserGPU, (obj), TYPE_VHOST_USER_GPU)
 
@@ -100,7 +105,7 @@ struct virtio_gpu_ctrl_command {
     QTAILQ_ENTRY(virtio_gpu_ctrl_command) next;
 };
 
-typedef struct VirtIOGPUBase {
+struct VirtIOGPUBase {
     VirtIODevice parent_obj;
 
     Error *migration_blocker;
@@ -116,13 +121,13 @@ typedef struct VirtIOGPUBase {
 
     int enabled_output_bitmask;
     struct virtio_gpu_requested_state req_state[VIRTIO_GPU_MAX_SCANOUTS];
-} VirtIOGPUBase;
+};
 
-typedef struct VirtIOGPUBaseClass {
+struct VirtIOGPUBaseClass {
     VirtioDeviceClass parent;
 
     void (*gl_unblock)(VirtIOGPUBase *g);
-} VirtIOGPUBaseClass;
+};
 
 #define VIRTIO_GPU_BASE_PROPERTIES(_state, _conf)                       \
     DEFINE_PROP_UINT32("max_outputs", _state, _conf.max_outputs, 1),    \
@@ -131,7 +136,7 @@ typedef struct VirtIOGPUBaseClass {
     DEFINE_PROP_UINT32("xres", _state, _conf.xres, 1024), \
     DEFINE_PROP_UINT32("yres", _state, _conf.yres, 768)
 
-typedef struct VirtIOGPU {
+struct VirtIOGPU {
     VirtIOGPUBase parent_obj;
 
     uint64_t conf_max_hostmem;
@@ -160,9 +165,9 @@ typedef struct VirtIOGPU {
         uint32_t req_3d;
         uint32_t bytes_3d;
     } stats;
-} VirtIOGPU;
+};
 
-typedef struct VhostUserGPU {
+struct VhostUserGPU {
     VirtIOGPUBase parent_obj;
 
     VhostUserBackend *vhost;
@@ -170,7 +175,7 @@ typedef struct VhostUserGPU {
     CharBackend vhost_chr;
     QemuDmaBuf dmabuf[VIRTIO_GPU_MAX_SCANOUTS];
     bool backend_blocked;
-} VhostUserGPU;
+};
 
 extern const GraphicHwOps virtio_gpu_ops;
 
diff --git a/include/hw/virtio/virtio-input.h b/include/hw/virtio/virtio-input.h
index 4fca03e796..c15e983d36 100644
--- a/include/hw/virtio/virtio-input.h
+++ b/include/hw/virtio/virtio-input.h
@@ -9,6 +9,7 @@
 
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/virtio_input.h"
+#include "qom/object.h"
 
 typedef struct virtio_input_absinfo virtio_input_absinfo;
 typedef struct virtio_input_config virtio_input_config;
@@ -18,6 +19,8 @@ typedef struct virtio_input_event virtio_input_event;
 /* qemu internals                                                    */
 
 #define TYPE_VIRTIO_INPUT "virtio-input-device"
+typedef struct VirtIOInput VirtIOInput;
+typedef struct VirtIOInputClass VirtIOInputClass;
 #define VIRTIO_INPUT(obj) \
         OBJECT_CHECK(VirtIOInput, (obj), TYPE_VIRTIO_INPUT)
 #define VIRTIO_INPUT_GET_PARENT_CLASS(obj) \
@@ -32,29 +35,27 @@ typedef struct virtio_input_event virtio_input_event;
 #define TYPE_VIRTIO_MOUSE     "virtio-mouse-device"
 #define TYPE_VIRTIO_TABLET    "virtio-tablet-device"
 
+typedef struct VirtIOInputHID VirtIOInputHID;
 #define VIRTIO_INPUT_HID(obj) \
         OBJECT_CHECK(VirtIOInputHID, (obj), TYPE_VIRTIO_INPUT_HID)
 #define VIRTIO_INPUT_HID_GET_PARENT_CLASS(obj) \
         OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_INPUT_HID)
 
 #define TYPE_VIRTIO_INPUT_HOST   "virtio-input-host-device"
+typedef struct VirtIOInputHost VirtIOInputHost;
 #define VIRTIO_INPUT_HOST(obj) \
         OBJECT_CHECK(VirtIOInputHost, (obj), TYPE_VIRTIO_INPUT_HOST)
 #define VIRTIO_INPUT_HOST_GET_PARENT_CLASS(obj) \
         OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_INPUT_HOST)
 
 #define TYPE_VHOST_USER_INPUT   "vhost-user-input"
+typedef struct VHostUserInput VHostUserInput;
 #define VHOST_USER_INPUT(obj)                              \
     OBJECT_CHECK(VHostUserInput, (obj), TYPE_VHOST_USER_INPUT)
 #define VHOST_USER_INPUT_GET_PARENT_CLASS(obj)             \
     OBJECT_GET_PARENT_CLASS(obj, TYPE_VHOST_USER_INPUT)
 
-typedef struct VirtIOInput VirtIOInput;
-typedef struct VirtIOInputClass VirtIOInputClass;
 typedef struct VirtIOInputConfig VirtIOInputConfig;
-typedef struct VirtIOInputHID VirtIOInputHID;
-typedef struct VirtIOInputHost VirtIOInputHost;
-typedef struct VHostUserInput VHostUserInput;
 
 struct VirtIOInputConfig {
     virtio_input_config               config;
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 49eb105cd8..d852980b30 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -23,9 +23,11 @@
 #include "standard-headers/linux/virtio_iommu.h"
 #include "hw/virtio/virtio.h"
 #include "hw/pci/pci.h"
+#include "qom/object.h"
 
 #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
 #define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-device-base"
+typedef struct VirtIOIOMMU VirtIOIOMMU;
 #define VIRTIO_IOMMU(obj) \
         OBJECT_CHECK(VirtIOIOMMU, (obj), TYPE_VIRTIO_IOMMU)
 
@@ -44,7 +46,7 @@ typedef struct IOMMUPciBus {
     IOMMUDevice  *pbdev[]; /* Parent array is sparse, so dynamically alloc */
 } IOMMUPciBus;
 
-typedef struct VirtIOIOMMU {
+struct VirtIOIOMMU {
     VirtIODevice parent_obj;
     VirtQueue *req_vq;
     VirtQueue *event_vq;
@@ -58,6 +60,6 @@ typedef struct VirtIOIOMMU {
     GTree *domains;
     QemuMutex mutex;
     GTree *endpoints;
-} VirtIOIOMMU;
+};
 
 #endif
diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index 0778224964..08e37d8e84 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -17,9 +17,12 @@
 #include "hw/virtio/virtio.h"
 #include "qapi/qapi-types-misc.h"
 #include "sysemu/hostmem.h"
+#include "qom/object.h"
 
 #define TYPE_VIRTIO_MEM "virtio-mem"
 
+typedef struct VirtIOMEM VirtIOMEM;
+typedef struct VirtIOMEMClass VirtIOMEMClass;
 #define VIRTIO_MEM(obj) \
         OBJECT_CHECK(VirtIOMEM, (obj), TYPE_VIRTIO_MEM)
 #define VIRTIO_MEM_CLASS(oc) \
@@ -34,7 +37,7 @@
 #define VIRTIO_MEM_BLOCK_SIZE_PROP "block-size"
 #define VIRTIO_MEM_ADDR_PROP "memaddr"
 
-typedef struct VirtIOMEM {
+struct VirtIOMEM {
     VirtIODevice parent_obj;
 
     /* guest -> host request queue */
@@ -70,9 +73,9 @@ typedef struct VirtIOMEM {
 
     /* don't migrate unplugged memory */
     NotifierWithReturn precopy_notifier;
-} VirtIOMEM;
+};
 
-typedef struct VirtIOMEMClass {
+struct VirtIOMEMClass {
     /* private */
     VirtIODevice parent;
 
@@ -81,6 +84,6 @@ typedef struct VirtIOMEMClass {
     MemoryRegion *(*get_memory_region)(VirtIOMEM *vmem, Error **errp);
     void (*add_size_change_notifier)(VirtIOMEM *vmem, Notifier *notifier);
     void (*remove_size_change_notifier)(VirtIOMEM *vmem, Notifier *notifier);
-} VirtIOMEMClass;
+};
 
 #endif
diff --git a/include/hw/virtio/virtio-mmio.h b/include/hw/virtio/virtio-mmio.h
index 7dbfd03dcf..947fb02d3e 100644
--- a/include/hw/virtio/virtio-mmio.h
+++ b/include/hw/virtio/virtio-mmio.h
@@ -23,6 +23,7 @@
 #define HW_VIRTIO_MMIO_H
 
 #include "hw/virtio/virtio-bus.h"
+#include "qom/object.h"
 
 /* QOM macros */
 /* virtio-mmio-bus */
@@ -36,6 +37,7 @@
 
 /* virtio-mmio */
 #define TYPE_VIRTIO_MMIO "virtio-mmio"
+typedef struct VirtIOMMIOProxy VirtIOMMIOProxy;
 #define VIRTIO_MMIO(obj) \
         OBJECT_CHECK(VirtIOMMIOProxy, (obj), TYPE_VIRTIO_MMIO)
 
@@ -52,7 +54,7 @@ typedef struct VirtIOMMIOQueue {
     uint32_t used[2];
 } VirtIOMMIOQueue;
 
-typedef struct {
+struct VirtIOMMIOProxy {
     /* Generic */
     SysBusDevice parent_obj;
     MemoryRegion iomem;
@@ -68,6 +70,6 @@ typedef struct {
     /* Fields only used for non-legacy (v2) devices */
     uint32_t guest_features[2];
     VirtIOMMIOQueue vqs[VIRTIO_QUEUE_MAX];
-} VirtIOMMIOProxy;
+};
 
 #endif
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index a45ef8278e..2e81b5bfcb 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -19,8 +19,10 @@
 #include "hw/virtio/virtio.h"
 #include "net/announce.h"
 #include "qemu/option_int.h"
+#include "qom/object.h"
 
 #define TYPE_VIRTIO_NET "virtio-net-device"
+typedef struct VirtIONet VirtIONet;
 #define VIRTIO_NET(obj) \
         OBJECT_CHECK(VirtIONet, (obj), TYPE_VIRTIO_NET)
 
@@ -109,7 +111,6 @@ typedef struct VirtioNetRscSeg {
     NetClientState *nc;
 } VirtioNetRscSeg;
 
-typedef struct VirtIONet VirtIONet;
 
 /* Chain is divided by protocol(ipv4/v6) and NetClientInfo */
 typedef struct VirtioNetRscChain {
diff --git a/include/hw/virtio/virtio-pmem.h b/include/hw/virtio/virtio-pmem.h
index 33f1999320..56bce2be7a 100644
--- a/include/hw/virtio/virtio-pmem.h
+++ b/include/hw/virtio/virtio-pmem.h
@@ -16,9 +16,12 @@
 
 #include "hw/virtio/virtio.h"
 #include "qapi/qapi-types-misc.h"
+#include "qom/object.h"
 
 #define TYPE_VIRTIO_PMEM "virtio-pmem"
 
+typedef struct VirtIOPMEM VirtIOPMEM;
+typedef struct VirtIOPMEMClass VirtIOPMEMClass;
 #define VIRTIO_PMEM(obj) \
         OBJECT_CHECK(VirtIOPMEM, (obj), TYPE_VIRTIO_PMEM)
 #define VIRTIO_PMEM_CLASS(oc) \
@@ -29,21 +32,21 @@
 #define VIRTIO_PMEM_ADDR_PROP "memaddr"
 #define VIRTIO_PMEM_MEMDEV_PROP "memdev"
 
-typedef struct VirtIOPMEM {
+struct VirtIOPMEM {
     VirtIODevice parent_obj;
 
     VirtQueue *rq_vq;
     uint64_t start;
     HostMemoryBackend *memdev;
-} VirtIOPMEM;
+};
 
-typedef struct VirtIOPMEMClass {
+struct VirtIOPMEMClass {
     /* private */
     VirtIODevice parent;
 
     /* public */
     void (*fill_device_info)(const VirtIOPMEM *pmem, VirtioPMEMDeviceInfo *vi);
     MemoryRegion *(*get_memory_region)(VirtIOPMEM *pmem, Error **errp);
-} VirtIOPMEMClass;
+};
 
 #endif
diff --git a/include/hw/virtio/virtio-rng.h b/include/hw/virtio/virtio-rng.h
index bd05d734b8..34fb5f695f 100644
--- a/include/hw/virtio/virtio-rng.h
+++ b/include/hw/virtio/virtio-rng.h
@@ -15,8 +15,10 @@
 #include "hw/virtio/virtio.h"
 #include "sysemu/rng.h"
 #include "standard-headers/linux/virtio_rng.h"
+#include "qom/object.h"
 
 #define TYPE_VIRTIO_RNG "virtio-rng-device"
+typedef struct VirtIORNG VirtIORNG;
 #define VIRTIO_RNG(obj) \
         OBJECT_CHECK(VirtIORNG, (obj), TYPE_VIRTIO_RNG)
 #define VIRTIO_RNG_GET_PARENT_CLASS(obj) \
@@ -28,7 +30,7 @@ struct VirtIORNGConf {
     uint32_t period_ms;
 };
 
-typedef struct VirtIORNG {
+struct VirtIORNG {
     VirtIODevice parent_obj;
 
     /* Only one vq - guest puts buffer(s) on it when it needs entropy */
@@ -46,6 +48,6 @@ typedef struct VirtIORNG {
     bool activate_timer;
 
     VMChangeStateEntry *vmstate;
-} VirtIORNG;
+};
 
 #endif
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index 24e768909d..911ccabb23 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -13,6 +13,7 @@
 
 #ifndef QEMU_VIRTIO_SCSI_H
 #define QEMU_VIRTIO_SCSI_H
+#include "qom/object.h"
 
 /* Override CDB/sense data size: they are dynamic (guest controlled) in QEMU */
 #define VIRTIO_SCSI_CDB_SIZE 0
@@ -25,10 +26,12 @@
 #include "sysemu/iothread.h"
 
 #define TYPE_VIRTIO_SCSI_COMMON "virtio-scsi-common"
+typedef struct VirtIOSCSICommon VirtIOSCSICommon;
 #define VIRTIO_SCSI_COMMON(obj) \
         OBJECT_CHECK(VirtIOSCSICommon, (obj), TYPE_VIRTIO_SCSI_COMMON)
 
 #define TYPE_VIRTIO_SCSI "virtio-scsi-device"
+typedef struct VirtIOSCSI VirtIOSCSI;
 #define VIRTIO_SCSI(obj) \
         OBJECT_CHECK(VirtIOSCSI, (obj), TYPE_VIRTIO_SCSI)
 
@@ -62,7 +65,7 @@ struct VirtIOSCSIConf {
 
 struct VirtIOSCSI;
 
-typedef struct VirtIOSCSICommon {
+struct VirtIOSCSICommon {
     VirtIODevice parent_obj;
     VirtIOSCSIConf conf;
 
@@ -71,9 +74,9 @@ typedef struct VirtIOSCSICommon {
     VirtQueue *ctrl_vq;
     VirtQueue *event_vq;
     VirtQueue **cmd_vqs;
-} VirtIOSCSICommon;
+};
 
-typedef struct VirtIOSCSI {
+struct VirtIOSCSI {
     VirtIOSCSICommon parent_obj;
 
     SCSIBus bus;
@@ -88,7 +91,7 @@ typedef struct VirtIOSCSI {
     bool dataplane_stopping;
     bool dataplane_fenced;
     uint32_t host_features;
-} VirtIOSCSI;
+};
 
 typedef struct VirtIOSCSIReq {
     /* Note:
diff --git a/include/hw/virtio/virtio-serial.h b/include/hw/virtio/virtio-serial.h
index 448615a6b3..94da09ec34 100644
--- a/include/hw/virtio/virtio-serial.h
+++ b/include/hw/virtio/virtio-serial.h
@@ -18,6 +18,7 @@
 
 #include "standard-headers/linux/virtio_console.h"
 #include "hw/virtio/virtio.h"
+#include "qom/object.h"
 
 struct virtio_serial_conf {
     /* Max. number of ports we can have for a virtio-serial device */
@@ -25,6 +26,8 @@ struct virtio_serial_conf {
 };
 
 #define TYPE_VIRTIO_SERIAL_PORT "virtio-serial-port"
+typedef struct VirtIOSerialPort VirtIOSerialPort;
+typedef struct VirtIOSerialPortClass VirtIOSerialPortClass;
 #define VIRTIO_SERIAL_PORT(obj) \
      OBJECT_CHECK(VirtIOSerialPort, (obj), TYPE_VIRTIO_SERIAL_PORT)
 #define VIRTIO_SERIAL_PORT_CLASS(klass) \
@@ -39,9 +42,8 @@ typedef struct VirtIOSerialBus VirtIOSerialBus;
 #define VIRTIO_SERIAL_BUS(obj) \
       OBJECT_CHECK(VirtIOSerialBus, (obj), TYPE_VIRTIO_SERIAL_BUS)
 
-typedef struct VirtIOSerialPort VirtIOSerialPort;
 
-typedef struct VirtIOSerialPortClass {
+struct VirtIOSerialPortClass {
     DeviceClass parent_class;
 
     /* Is this a device that binds with hvc in the guest? */
@@ -86,7 +88,7 @@ typedef struct VirtIOSerialPortClass {
      */
     ssize_t (*have_data)(VirtIOSerialPort *port, const uint8_t *buf,
                          ssize_t len);
-} VirtIOSerialPortClass;
+};
 
 /*
  * This is the state that's shared between all the ports.  Some of the
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index e424df12cf..261d087de8 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -21,6 +21,7 @@
 #include "qemu/event_notifier.h"
 #include "standard-headers/linux/virtio_config.h"
 #include "standard-headers/linux/virtio_ring.h"
+#include "qom/object.h"
 
 /* A guest should never accept this.  It implies negotiation is broken. */
 #define VIRTIO_F_BAD_FEATURE		30
@@ -67,6 +68,7 @@ typedef struct VirtQueueElement
 #define VIRTIO_NO_VECTOR 0xffff
 
 #define TYPE_VIRTIO_DEVICE "virtio-device"
+typedef struct VirtioDeviceClass VirtioDeviceClass;
 #define VIRTIO_DEVICE_GET_CLASS(obj) \
         OBJECT_GET_CLASS(VirtioDeviceClass, obj, TYPE_VIRTIO_DEVICE)
 #define VIRTIO_DEVICE_CLASS(klass) \
@@ -113,7 +115,7 @@ struct VirtIODevice
     QLIST_HEAD(, VirtQueue) *vector_queues;
 };
 
-typedef struct VirtioDeviceClass {
+struct VirtioDeviceClass {
     /*< private >*/
     DeviceClass parent;
     /*< public >*/
@@ -163,7 +165,7 @@ typedef struct VirtioDeviceClass {
     int (*post_load)(VirtIODevice *vdev);
     const VMStateDescription *vmsd;
     bool (*primary_unplug_pending)(void *opaque);
-} VirtioDeviceClass;
+};
 
 void virtio_instance_init_common(Object *proxy_obj, void *data,
                                  size_t vdev_size, const char *vdev_name);
diff --git a/include/hw/vmstate-if.h b/include/hw/vmstate-if.h
index 8ff7f0f292..eabf5b05ad 100644
--- a/include/hw/vmstate-if.h
+++ b/include/hw/vmstate-if.h
@@ -13,6 +13,7 @@
 
 #define TYPE_VMSTATE_IF "vmstate-if"
 
+typedef struct VMStateIfClass VMStateIfClass;
 #define VMSTATE_IF_CLASS(klass)                                     \
     OBJECT_CLASS_CHECK(VMStateIfClass, (klass), TYPE_VMSTATE_IF)
 #define VMSTATE_IF_GET_CLASS(obj)                           \
@@ -22,11 +23,11 @@
 
 typedef struct VMStateIf VMStateIf;
 
-typedef struct VMStateIfClass {
+struct VMStateIfClass {
     InterfaceClass parent_class;
 
     char * (*get_id)(VMStateIf *obj);
-} VMStateIfClass;
+};
 
 static inline char *vmstate_if_get_id(VMStateIf *vmif)
 {
diff --git a/include/hw/watchdog/cmsdk-apb-watchdog.h b/include/hw/watchdog/cmsdk-apb-watchdog.h
index 6ae9531370..be2983eefa 100644
--- a/include/hw/watchdog/cmsdk-apb-watchdog.h
+++ b/include/hw/watchdog/cmsdk-apb-watchdog.h
@@ -33,8 +33,10 @@
 
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
+#include "qom/object.h"
 
 #define TYPE_CMSDK_APB_WATCHDOG "cmsdk-apb-watchdog"
+typedef struct CMSDKAPBWatchdog CMSDKAPBWatchdog;
 #define CMSDK_APB_WATCHDOG(obj) OBJECT_CHECK(CMSDKAPBWatchdog, (obj), \
                                               TYPE_CMSDK_APB_WATCHDOG)
 
@@ -44,7 +46,7 @@
  */
 #define TYPE_LUMINARY_WATCHDOG "luminary-watchdog"
 
-typedef struct CMSDKAPBWatchdog {
+struct CMSDKAPBWatchdog {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -62,6 +64,6 @@ typedef struct CMSDKAPBWatchdog {
     uint32_t itop;
     uint32_t resetstatus;
     const uint32_t *id;
-} CMSDKAPBWatchdog;
+};
 
 #endif
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index 819c22993a..ba9a0a1fd8 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -12,8 +12,11 @@
 
 #include "hw/misc/aspeed_scu.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_ASPEED_WDT "aspeed.wdt"
+typedef struct AspeedWDTClass AspeedWDTClass;
+typedef struct AspeedWDTState AspeedWDTState;
 #define ASPEED_WDT(obj) \
     OBJECT_CHECK(AspeedWDTState, (obj), TYPE_ASPEED_WDT)
 #define TYPE_ASPEED_2400_WDT TYPE_ASPEED_WDT "-ast2400"
@@ -22,7 +25,7 @@
 
 #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
 
-typedef struct AspeedWDTState {
+struct AspeedWDTState {
     /*< private >*/
     SysBusDevice parent_obj;
     QEMUTimer *timer;
@@ -33,14 +36,14 @@ typedef struct AspeedWDTState {
 
     AspeedSCUState *scu;
     uint32_t pclk_freq;
-} AspeedWDTState;
+};
 
 #define ASPEED_WDT_CLASS(klass) \
      OBJECT_CLASS_CHECK(AspeedWDTClass, (klass), TYPE_ASPEED_WDT)
 #define ASPEED_WDT_GET_CLASS(obj) \
      OBJECT_GET_CLASS(AspeedWDTClass, (obj), TYPE_ASPEED_WDT)
 
-typedef struct AspeedWDTClass {
+struct AspeedWDTClass {
     SysBusDeviceClass parent_class;
 
     uint32_t offset;
@@ -48,6 +51,6 @@ typedef struct AspeedWDTClass {
     uint32_t reset_ctrl_reg;
     void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
     void (*wdt_reload)(AspeedWDTState *s);
-}  AspeedWDTClass;
+};
 
 #endif /* WDT_ASPEED_H */
diff --git a/include/hw/watchdog/wdt_diag288.h b/include/hw/watchdog/wdt_diag288.h
index 19d83a0937..e611163821 100644
--- a/include/hw/watchdog/wdt_diag288.h
+++ b/include/hw/watchdog/wdt_diag288.h
@@ -2,8 +2,11 @@
 #define WDT_DIAG288_H
 
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 #define TYPE_WDT_DIAG288 "diag288"
+typedef struct DIAG288Class DIAG288Class;
+typedef struct DIAG288State DIAG288State;
 #define DIAG288(obj) \
     OBJECT_CHECK(DIAG288State, (obj), TYPE_WDT_DIAG288)
 #define DIAG288_CLASS(klass) \
@@ -15,22 +18,22 @@
 #define WDT_DIAG288_CHANGE    1
 #define WDT_DIAG288_CANCEL    2
 
-typedef struct DIAG288State {
+struct DIAG288State {
     /*< private >*/
     DeviceState parent_obj;
     QEMUTimer *timer;
     bool enabled;
 
     /*< public >*/
-} DIAG288State;
+};
 
-typedef struct DIAG288Class {
+struct DIAG288Class {
     /*< private >*/
     DeviceClass parent_class;
 
     /*< public >*/
     int (*handle_timer)(DIAG288State *dev,
                         uint64_t func, uint64_t timeout);
-} DIAG288Class;
+};
 
 #endif /* WDT_DIAG288_H */
diff --git a/include/hw/watchdog/wdt_imx2.h b/include/hw/watchdog/wdt_imx2.h
index f9af6be4b6..8757418b46 100644
--- a/include/hw/watchdog/wdt_imx2.h
+++ b/include/hw/watchdog/wdt_imx2.h
@@ -16,8 +16,10 @@
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/ptimer.h"
+#include "qom/object.h"
 
 #define TYPE_IMX2_WDT "imx2.wdt"
+typedef struct IMX2WdtState IMX2WdtState;
 #define IMX2_WDT(obj) OBJECT_CHECK(IMX2WdtState, (obj), TYPE_IMX2_WDT)
 
 enum IMX2WdtRegisters {
@@ -62,7 +64,7 @@ enum IMX2WdtRegisters {
 /* Misc Control Register definitions */
 #define IMX2_WDT_WMCR_PDE       BIT(0)      /* Power-Down Enable */
 
-typedef struct IMX2WdtState {
+struct IMX2WdtState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -85,6 +87,6 @@ typedef struct IMX2WdtState {
     bool wcr_locked;            /* affects WDZST, WDBG, and WDW */
     bool wcr_wde_locked;        /* affects WDE */
     bool wcr_wdt_locked;        /* affects WDT (never cleared) */
-} IMX2WdtState;
+};
 
 #endif /* IMX2_WDT_H */
diff --git a/include/hw/xen/xen-block.h b/include/hw/xen/xen-block.h
index 2cd2fc2701..54f2e35122 100644
--- a/include/hw/xen/xen-block.h
+++ b/include/hw/xen/xen-block.h
@@ -12,6 +12,7 @@
 #include "hw/block/block.h"
 #include "hw/block/dataplane/xen-block.h"
 #include "sysemu/iothread.h"
+#include "qom/object.h"
 
 typedef enum XenBlockVdevType {
     XEN_BLOCK_VDEV_TYPE_INVALID,
@@ -46,7 +47,7 @@ typedef struct XenBlockIOThread {
     char *id;
 } XenBlockIOThread;
 
-typedef struct XenBlockDevice {
+struct XenBlockDevice {
     XenDevice xendev;
     XenBlockProperties props;
     const char *device_type;
@@ -54,18 +55,20 @@ typedef struct XenBlockDevice {
     XenBlockDataPlane *dataplane;
     XenBlockDrive *drive;
     XenBlockIOThread *iothread;
-} XenBlockDevice;
+};
+typedef struct XenBlockDevice XenBlockDevice;
 
 typedef void (*XenBlockDeviceRealize)(XenBlockDevice *blockdev, Error **errp);
 typedef void (*XenBlockDeviceUnrealize)(XenBlockDevice *blockdev);
 
-typedef struct XenBlockDeviceClass {
+struct XenBlockDeviceClass {
     /*< private >*/
     XenDeviceClass parent_class;
     /*< public >*/
     XenBlockDeviceRealize realize;
     XenBlockDeviceUnrealize unrealize;
-} XenBlockDeviceClass;
+};
+typedef struct XenBlockDeviceClass XenBlockDeviceClass;
 
 #define TYPE_XEN_BLOCK_DEVICE  "xen-block"
 #define XEN_BLOCK_DEVICE(obj) \
@@ -75,17 +78,19 @@ typedef struct XenBlockDeviceClass {
 #define XEN_BLOCK_DEVICE_GET_CLASS(obj) \
      OBJECT_GET_CLASS(XenBlockDeviceClass, (obj), TYPE_XEN_BLOCK_DEVICE)
 
-typedef struct XenDiskDevice {
+struct XenDiskDevice {
     XenBlockDevice blockdev;
-} XenDiskDevice;
+};
+typedef struct XenDiskDevice XenDiskDevice;
 
 #define TYPE_XEN_DISK_DEVICE  "xen-disk"
 #define XEN_DISK_DEVICE(obj) \
      OBJECT_CHECK(XenDiskDevice, (obj), TYPE_XEN_DISK_DEVICE)
 
-typedef struct XenCDRomDevice {
+struct XenCDRomDevice {
     XenBlockDevice blockdev;
-} XenCDRomDevice;
+};
+typedef struct XenCDRomDevice XenCDRomDevice;
 
 #define TYPE_XEN_CDROM_DEVICE  "xen-cdrom"
 #define XEN_CDROM_DEVICE(obj) \
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 4ec0bb072f..910cf49161 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -11,6 +11,7 @@
 #include "hw/xen/xen_common.h"
 #include "hw/sysbus.h"
 #include "qemu/notify.h"
+#include "qom/object.h"
 
 typedef void (*XenWatchHandler)(void *opaque);
 
@@ -18,7 +19,7 @@ typedef struct XenWatchList XenWatchList;
 typedef struct XenWatch XenWatch;
 typedef struct XenEventChannel XenEventChannel;
 
-typedef struct XenDevice {
+struct XenDevice {
     DeviceState qdev;
     domid_t frontend_id;
     char *name;
@@ -35,7 +36,8 @@ typedef struct XenDevice {
     bool inactive;
     QLIST_HEAD(, XenEventChannel) event_channels;
     QLIST_ENTRY(XenDevice) list;
-} XenDevice;
+};
+typedef struct XenDevice XenDevice;
 
 typedef char *(*XenDeviceGetName)(XenDevice *xendev, Error **errp);
 typedef void (*XenDeviceRealize)(XenDevice *xendev, Error **errp);
@@ -44,7 +46,7 @@ typedef void (*XenDeviceFrontendChanged)(XenDevice *xendev,
                                          Error **errp);
 typedef void (*XenDeviceUnrealize)(XenDevice *xendev);
 
-typedef struct XenDeviceClass {
+struct XenDeviceClass {
     /*< private >*/
     DeviceClass parent_class;
     /*< public >*/
@@ -54,7 +56,8 @@ typedef struct XenDeviceClass {
     XenDeviceRealize realize;
     XenDeviceFrontendChanged frontend_changed;
     XenDeviceUnrealize unrealize;
-} XenDeviceClass;
+};
+typedef struct XenDeviceClass XenDeviceClass;
 
 #define TYPE_XEN_DEVICE "xen-device"
 #define XEN_DEVICE(obj) \
@@ -64,19 +67,21 @@ typedef struct XenDeviceClass {
 #define XEN_DEVICE_GET_CLASS(obj) \
      OBJECT_GET_CLASS(XenDeviceClass, (obj), TYPE_XEN_DEVICE)
 
-typedef struct XenBus {
+struct XenBus {
     BusState qbus;
     domid_t backend_id;
     struct xs_handle *xsh;
     XenWatchList *watch_list;
     XenWatch *backend_watch;
     QLIST_HEAD(, XenDevice) inactive_devices;
-} XenBus;
+};
+typedef struct XenBus XenBus;
 
-typedef struct XenBusClass {
+struct XenBusClass {
     /*< private >*/
     BusClass parent_class;
-} XenBusClass;
+};
+typedef struct XenBusClass XenBusClass;
 
 #define TYPE_XEN_BUS "xen-bus"
 #define XEN_BUS(obj) \
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index 704bc7852b..89b51e05fc 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -4,6 +4,7 @@
 #include "hw/xen/xen_common.h"
 #include "hw/xen/xen_pvdev.h"
 #include "net/net.h"
+#include "qom/object.h"
 
 #define TYPE_XENSYSDEV "xen-sysdev"
 #define TYPE_XENSYSBUS "xen-sysbus"
diff --git a/include/io/channel-buffer.h b/include/io/channel-buffer.h
index 3f4b3f29e1..344d5957fd 100644
--- a/include/io/channel-buffer.h
+++ b/include/io/channel-buffer.h
@@ -22,12 +22,13 @@
 #define QIO_CHANNEL_BUFFER_H
 
 #include "io/channel.h"
+#include "qom/object.h"
 
 #define TYPE_QIO_CHANNEL_BUFFER "qio-channel-buffer"
+typedef struct QIOChannelBuffer QIOChannelBuffer;
 #define QIO_CHANNEL_BUFFER(obj)                                     \
     OBJECT_CHECK(QIOChannelBuffer, (obj), TYPE_QIO_CHANNEL_BUFFER)
 
-typedef struct QIOChannelBuffer QIOChannelBuffer;
 
 /**
  * QIOChannelBuffer:
diff --git a/include/io/channel-command.h b/include/io/channel-command.h
index 336d47fa5c..b1671062d0 100644
--- a/include/io/channel-command.h
+++ b/include/io/channel-command.h
@@ -22,12 +22,13 @@
 #define QIO_CHANNEL_COMMAND_H
 
 #include "io/channel.h"
+#include "qom/object.h"
 
 #define TYPE_QIO_CHANNEL_COMMAND "qio-channel-command"
+typedef struct QIOChannelCommand QIOChannelCommand;
 #define QIO_CHANNEL_COMMAND(obj)                                     \
     OBJECT_CHECK(QIOChannelCommand, (obj), TYPE_QIO_CHANNEL_COMMAND)
 
-typedef struct QIOChannelCommand QIOChannelCommand;
 
 
 /**
diff --git a/include/io/channel-file.h b/include/io/channel-file.h
index ebfe54ec70..d91c9f5bc1 100644
--- a/include/io/channel-file.h
+++ b/include/io/channel-file.h
@@ -22,12 +22,13 @@
 #define QIO_CHANNEL_FILE_H
 
 #include "io/channel.h"
+#include "qom/object.h"
 
 #define TYPE_QIO_CHANNEL_FILE "qio-channel-file"
+typedef struct QIOChannelFile QIOChannelFile;
 #define QIO_CHANNEL_FILE(obj)                                     \
     OBJECT_CHECK(QIOChannelFile, (obj), TYPE_QIO_CHANNEL_FILE)
 
-typedef struct QIOChannelFile QIOChannelFile;
 
 /**
  * QIOChannelFile:
diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index 777ff5954e..ee898d991b 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -24,12 +24,13 @@
 #include "io/channel.h"
 #include "io/task.h"
 #include "qemu/sockets.h"
+#include "qom/object.h"
 
 #define TYPE_QIO_CHANNEL_SOCKET "qio-channel-socket"
+typedef struct QIOChannelSocket QIOChannelSocket;
 #define QIO_CHANNEL_SOCKET(obj)                                     \
     OBJECT_CHECK(QIOChannelSocket, (obj), TYPE_QIO_CHANNEL_SOCKET)
 
-typedef struct QIOChannelSocket QIOChannelSocket;
 
 /**
  * QIOChannelSocket:
diff --git a/include/io/channel-tls.h b/include/io/channel-tls.h
index fdbdf12feb..ebd42f981e 100644
--- a/include/io/channel-tls.h
+++ b/include/io/channel-tls.h
@@ -24,12 +24,13 @@
 #include "io/channel.h"
 #include "io/task.h"
 #include "crypto/tlssession.h"
+#include "qom/object.h"
 
 #define TYPE_QIO_CHANNEL_TLS "qio-channel-tls"
+typedef struct QIOChannelTLS QIOChannelTLS;
 #define QIO_CHANNEL_TLS(obj)                                     \
     OBJECT_CHECK(QIOChannelTLS, (obj), TYPE_QIO_CHANNEL_TLS)
 
-typedef struct QIOChannelTLS QIOChannelTLS;
 
 /**
  * QIOChannelTLS
diff --git a/include/io/channel-websock.h b/include/io/channel-websock.h
index a7e5e92e61..5ab8811306 100644
--- a/include/io/channel-websock.h
+++ b/include/io/channel-websock.h
@@ -24,12 +24,13 @@
 #include "io/channel.h"
 #include "qemu/buffer.h"
 #include "io/task.h"
+#include "qom/object.h"
 
 #define TYPE_QIO_CHANNEL_WEBSOCK "qio-channel-websock"
+typedef struct QIOChannelWebsock QIOChannelWebsock;
 #define QIO_CHANNEL_WEBSOCK(obj)                                     \
     OBJECT_CHECK(QIOChannelWebsock, (obj), TYPE_QIO_CHANNEL_WEBSOCK)
 
-typedef struct QIOChannelWebsock QIOChannelWebsock;
 typedef union QIOChannelWebsockMask QIOChannelWebsockMask;
 
 union QIOChannelWebsockMask {
diff --git a/include/io/channel.h b/include/io/channel.h
index d4557f0930..67b9768eff 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -26,6 +26,8 @@
 #include "block/aio.h"
 
 #define TYPE_QIO_CHANNEL "qio-channel"
+typedef struct QIOChannel QIOChannel;
+typedef struct QIOChannelClass QIOChannelClass;
 #define QIO_CHANNEL(obj)                                    \
     OBJECT_CHECK(QIOChannel, (obj), TYPE_QIO_CHANNEL)
 #define QIO_CHANNEL_CLASS(klass)                                    \
@@ -33,8 +35,6 @@
 #define QIO_CHANNEL_GET_CLASS(obj)                                  \
     OBJECT_GET_CLASS(QIOChannelClass, obj, TYPE_QIO_CHANNEL)
 
-typedef struct QIOChannel QIOChannel;
-typedef struct QIOChannelClass QIOChannelClass;
 
 #define QIO_CHANNEL_ERR_BLOCK -2
 
diff --git a/include/io/dns-resolver.h b/include/io/dns-resolver.h
index a475e978c8..5e720bf267 100644
--- a/include/io/dns-resolver.h
+++ b/include/io/dns-resolver.h
@@ -26,6 +26,8 @@
 #include "io/task.h"
 
 #define TYPE_QIO_DNS_RESOLVER "qio-dns-resolver"
+typedef struct QIODNSResolver QIODNSResolver;
+typedef struct QIODNSResolverClass QIODNSResolverClass;
 #define QIO_DNS_RESOLVER(obj)                                    \
     OBJECT_CHECK(QIODNSResolver, (obj), TYPE_QIO_DNS_RESOLVER)
 #define QIO_DNS_RESOLVER_CLASS(klass)                                    \
@@ -33,8 +35,6 @@
 #define QIO_DNS_RESOLVER_GET_CLASS(obj)                                  \
     OBJECT_GET_CLASS(QIODNSResolverClass, obj, TYPE_QIO_DNS_RESOLVER)
 
-typedef struct QIODNSResolver QIODNSResolver;
-typedef struct QIODNSResolverClass QIODNSResolverClass;
 
 /**
  * QIODNSResolver:
diff --git a/include/io/net-listener.h b/include/io/net-listener.h
index fb101703e3..fbdd2dbf9a 100644
--- a/include/io/net-listener.h
+++ b/include/io/net-listener.h
@@ -22,8 +22,11 @@
 #define QIO_NET_LISTENER_H
 
 #include "io/channel-socket.h"
+#include "qom/object.h"
 
 #define TYPE_QIO_NET_LISTENER "qio-net-listener"
+typedef struct QIONetListener QIONetListener;
+typedef struct QIONetListenerClass QIONetListenerClass;
 #define QIO_NET_LISTENER(obj)                                    \
     OBJECT_CHECK(QIONetListener, (obj), TYPE_QIO_NET_LISTENER)
 #define QIO_NET_LISTENER_CLASS(klass)                                    \
@@ -31,8 +34,6 @@
 #define QIO_NET_LISTENER_GET_CLASS(obj)                                  \
     OBJECT_GET_CLASS(QIONetListenerClass, obj, TYPE_QIO_NET_LISTENER)
 
-typedef struct QIONetListener QIONetListener;
-typedef struct QIONetListenerClass QIONetListenerClass;
 
 typedef void (*QIONetListenerClientFunc)(QIONetListener *listener,
                                          QIOChannelSocket *sioc,
diff --git a/include/net/can_host.h b/include/net/can_host.h
index d79676746b..13b6a191dd 100644
--- a/include/net/can_host.h
+++ b/include/net/can_host.h
@@ -29,8 +29,11 @@
 #define NET_CAN_HOST_H
 
 #include "net/can_emu.h"
+#include "qom/object.h"
 
 #define TYPE_CAN_HOST "can-host"
+typedef struct CanHostClass CanHostClass;
+typedef struct CanHostState CanHostState;
 #define CAN_HOST_CLASS(klass) \
      OBJECT_CLASS_CHECK(CanHostClass, (klass), TYPE_CAN_HOST)
 #define CAN_HOST_GET_CLASS(obj) \
@@ -38,18 +41,18 @@
 #define CAN_HOST(obj) \
      OBJECT_CHECK(CanHostState, (obj), TYPE_CAN_HOST)
 
-typedef struct CanHostState {
+struct CanHostState {
     ObjectClass oc;
 
     CanBusState *bus;
     CanBusClientState bus_client;
-} CanHostState;
+};
 
-typedef struct CanHostClass {
+struct CanHostClass {
     ObjectClass oc;
 
     void (*connect)(CanHostState *ch, Error **errp);
     void (*disconnect)(CanHostState *ch);
-} CanHostClass;
+};
 
 #endif
diff --git a/include/net/filter.h b/include/net/filter.h
index 9393c59192..0d4f011bc0 100644
--- a/include/net/filter.h
+++ b/include/net/filter.h
@@ -15,6 +15,7 @@
 #include "net/queue.h"
 
 #define TYPE_NETFILTER "netfilter"
+typedef struct NetFilterClass NetFilterClass;
 #define NETFILTER(obj) \
     OBJECT_CHECK(NetFilterState, (obj), TYPE_NETFILTER)
 #define NETFILTER_GET_CLASS(obj) \
@@ -40,7 +41,7 @@ typedef void (FilterStatusChanged) (NetFilterState *nf, Error **errp);
 
 typedef void (FilterHandleEvent) (NetFilterState *nf, int event, Error **errp);
 
-typedef struct NetFilterClass {
+struct NetFilterClass {
     ObjectClass parent_class;
 
     /* optional */
@@ -50,7 +51,7 @@ typedef struct NetFilterClass {
     FilterHandleEvent *handle_event;
     /* mandatory */
     FilterReceiveIOV *receive_iov;
-} NetFilterClass;
+};
 
 
 struct NetFilterState {
diff --git a/include/qom/object.h b/include/qom/object.h
index 3c8fe1b603..78875d20e4 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -16,6 +16,7 @@
 
 #include "qapi/qapi-builtin-types.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 struct TypeImpl;
 typedef struct TypeImpl *Type;
diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index 7035829337..2be985f86e 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -6,6 +6,7 @@
 
 #define TYPE_USER_CREATABLE "user-creatable"
 
+typedef struct UserCreatableClass UserCreatableClass;
 #define USER_CREATABLE_CLASS(klass) \
      OBJECT_CLASS_CHECK(UserCreatableClass, (klass), \
                         TYPE_USER_CREATABLE)
@@ -40,14 +41,14 @@ typedef struct UserCreatable UserCreatable;
  * object's type implements USER_CREATABLE interface and needs
  * complete() callback to be called.
  */
-typedef struct UserCreatableClass {
+struct UserCreatableClass {
     /* <private> */
     InterfaceClass parent_class;
 
     /* <public> */
     void (*complete)(UserCreatable *uc, Error **errp);
     bool (*can_be_deleted)(UserCreatable *uc);
-} UserCreatableClass;
+};
 
 /**
  * user_creatable_complete:
diff --git a/include/scsi/pr-manager.h b/include/scsi/pr-manager.h
index 6ad5fd1ff7..2c699e4030 100644
--- a/include/scsi/pr-manager.h
+++ b/include/scsi/pr-manager.h
@@ -9,6 +9,8 @@
 
 #define TYPE_PR_MANAGER "pr-manager"
 
+typedef struct PRManager PRManager;
+typedef struct PRManagerClass PRManagerClass;
 #define PR_MANAGER_CLASS(klass) \
      OBJECT_CLASS_CHECK(PRManagerClass, (klass), TYPE_PR_MANAGER)
 #define PR_MANAGER_GET_CLASS(obj) \
@@ -18,24 +20,24 @@
 
 struct sg_io_hdr;
 
-typedef struct PRManager {
+struct PRManager {
     /* <private> */
     Object parent;
-} PRManager;
+};
 
 /**
  * PRManagerClass:
  * @parent_class: the base class
  * @run: callback invoked in thread pool context
  */
-typedef struct PRManagerClass {
+struct PRManagerClass {
     /* <private> */
     ObjectClass parent_class;
 
     /* <public> */
     int (*run)(PRManager *pr_mgr, int fd, struct sg_io_hdr *hdr);
     bool (*is_connected)(PRManager *pr_mgr);
-} PRManagerClass;
+};
 
 bool pr_manager_is_connected(PRManager *pr_mgr);
 int coroutine_fn pr_manager_execute(PRManager *pr_mgr, AioContext *ctx, int fd,
diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
index e08b8ab8fa..2bda18be12 100644
--- a/include/sysemu/accel.h
+++ b/include/sysemu/accel.h
@@ -26,12 +26,13 @@
 #include "qom/object.h"
 #include "exec/hwaddr.h"
 
-typedef struct AccelState {
+struct AccelState {
     /*< private >*/
     Object parent_obj;
-} AccelState;
+};
+typedef struct AccelState AccelState;
 
-typedef struct AccelClass {
+struct AccelClass {
     /*< private >*/
     ObjectClass parent_class;
     /*< public >*/
@@ -52,7 +53,8 @@ typedef struct AccelClass {
      * compat_props or user-provided global properties.
      */
     GPtrArray *compat_props;
-} AccelClass;
+};
+typedef struct AccelClass AccelClass;
 
 #define TYPE_ACCEL "accel"
 
diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
index 35eab06d0e..e11526271a 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -37,6 +37,8 @@
 
 #define TYPE_CRYPTODEV_BACKEND "cryptodev-backend"
 
+typedef struct CryptoDevBackend CryptoDevBackend;
+typedef struct CryptoDevBackendClass CryptoDevBackendClass;
 #define CRYPTODEV_BACKEND(obj) \
     OBJECT_CHECK(CryptoDevBackend, \
                  (obj), TYPE_CRYPTODEV_BACKEND)
@@ -54,7 +56,6 @@ typedef struct CryptoDevBackendConf CryptoDevBackendConf;
 typedef struct CryptoDevBackendPeers CryptoDevBackendPeers;
 typedef struct CryptoDevBackendClient
                      CryptoDevBackendClient;
-typedef struct CryptoDevBackend CryptoDevBackend;
 
 enum CryptoDevBackendAlgType {
     CRYPTODEV_BACKEND_ALG_SYM,
@@ -146,7 +147,7 @@ typedef struct CryptoDevBackendSymOpInfo {
     uint8_t data[];
 } CryptoDevBackendSymOpInfo;
 
-typedef struct CryptoDevBackendClass {
+struct CryptoDevBackendClass {
     ObjectClass parent_class;
 
     void (*init)(CryptoDevBackend *backend, Error **errp);
@@ -161,7 +162,7 @@ typedef struct CryptoDevBackendClass {
     int (*do_sym_op)(CryptoDevBackend *backend,
                      CryptoDevBackendSymOpInfo *op_info,
                      uint32_t queue_index, Error **errp);
-} CryptoDevBackendClass;
+};
 
 typedef enum CryptoDevBackendOptionsType {
     CRYPTODEV_BACKEND_TYPE_NONE = 0,
diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index 8276e53683..7b775b6687 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -20,6 +20,8 @@
 #include "qemu/bitmap.h"
 
 #define TYPE_MEMORY_BACKEND "memory-backend"
+typedef struct HostMemoryBackend HostMemoryBackend;
+typedef struct HostMemoryBackendClass HostMemoryBackendClass;
 #define MEMORY_BACKEND(obj) \
     OBJECT_CHECK(HostMemoryBackend, (obj), TYPE_MEMORY_BACKEND)
 #define MEMORY_BACKEND_GET_CLASS(obj) \
@@ -42,8 +44,6 @@
  */
 #define TYPE_MEMORY_BACKEND_FILE "memory-backend-file"
 
-typedef struct HostMemoryBackend HostMemoryBackend;
-typedef struct HostMemoryBackendClass HostMemoryBackendClass;
 
 /**
  * HostMemoryBackendClass:
diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
index 760d6c79a2..566b5f52fc 100644
--- a/include/sysemu/hvf.h
+++ b/include/sysemu/hvf.h
@@ -14,6 +14,7 @@
 #define HVF_H
 
 #include "sysemu/accel.h"
+#include "qom/object.h"
 
 #ifdef CONFIG_HVF
 uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
diff --git a/include/sysemu/iothread.h b/include/sysemu/iothread.h
index 6181486401..42902ffb9f 100644
--- a/include/sysemu/iothread.h
+++ b/include/sysemu/iothread.h
@@ -20,7 +20,7 @@
 
 #define TYPE_IOTHREAD "iothread"
 
-typedef struct {
+struct IOThread {
     Object parent_obj;
 
     QemuThread thread;
@@ -37,7 +37,8 @@ typedef struct {
     int64_t poll_max_ns;
     int64_t poll_grow;
     int64_t poll_shrink;
-} IOThread;
+};
+typedef struct IOThread IOThread;
 
 #define IOTHREAD(obj) \
    OBJECT_CHECK(IOThread, obj, TYPE_IOTHREAD)
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 8445a88db1..3e89884c54 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -18,6 +18,7 @@
 #include "hw/core/cpu.h"
 #include "exec/memattrs.h"
 #include "sysemu/accel.h"
+#include "qom/object.h"
 
 #ifdef NEED_CPU_H
 # ifdef CONFIG_KVM
diff --git a/include/sysemu/rng-random.h b/include/sysemu/rng-random.h
index 38186fe83d..87e82dd7a3 100644
--- a/include/sysemu/rng-random.h
+++ b/include/sysemu/rng-random.h
@@ -15,8 +15,8 @@
 #include "qom/object.h"
 
 #define TYPE_RNG_RANDOM "rng-random"
+typedef struct RngRandom RngRandom;
 #define RNG_RANDOM(obj) OBJECT_CHECK(RngRandom, (obj), TYPE_RNG_RANDOM)
 
-typedef struct RngRandom RngRandom;
 
 #endif
diff --git a/include/sysemu/rng.h b/include/sysemu/rng.h
index fa6eada78c..c38da7d342 100644
--- a/include/sysemu/rng.h
+++ b/include/sysemu/rng.h
@@ -17,6 +17,8 @@
 #include "qom/object.h"
 
 #define TYPE_RNG_BACKEND "rng-backend"
+typedef struct RngBackend RngBackend;
+typedef struct RngBackendClass RngBackendClass;
 #define RNG_BACKEND(obj) \
     OBJECT_CHECK(RngBackend, (obj), TYPE_RNG_BACKEND)
 #define RNG_BACKEND_GET_CLASS(obj) \
@@ -27,8 +29,6 @@
 #define TYPE_RNG_BUILTIN "rng-builtin"
 
 typedef struct RngRequest RngRequest;
-typedef struct RngBackendClass RngBackendClass;
-typedef struct RngBackend RngBackend;
 
 typedef void (EntropyReceiveFunc)(void *opaque,
                                   const void *data,
diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 730c61ac97..04673cab53 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -26,6 +26,7 @@ typedef enum TPMVersion {
 } TPMVersion;
 
 #define TYPE_TPM_IF "tpm-if"
+typedef struct TPMIfClass TPMIfClass;
 #define TPM_IF_CLASS(klass)                                 \
     OBJECT_CLASS_CHECK(TPMIfClass, (klass), TYPE_TPM_IF)
 #define TPM_IF_GET_CLASS(obj)                           \
@@ -35,13 +36,13 @@ typedef enum TPMVersion {
 
 typedef struct TPMIf TPMIf;
 
-typedef struct TPMIfClass {
+struct TPMIfClass {
     InterfaceClass parent_class;
 
     enum TpmModel model;
     void (*request_completed)(TPMIf *obj, int ret);
     enum TPMVersion (*get_version)(TPMIf *obj);
-} TPMIfClass;
+};
 
 #define TYPE_TPM_TIS_ISA            "tpm-tis"
 #define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
index 9e7451fb52..740c94c6cd 100644
--- a/include/sysemu/tpm_backend.h
+++ b/include/sysemu/tpm_backend.h
@@ -19,6 +19,8 @@
 #include "qapi/error.h"
 
 #define TYPE_TPM_BACKEND "tpm-backend"
+typedef struct TPMBackend TPMBackend;
+typedef struct TPMBackendClass TPMBackendClass;
 #define TPM_BACKEND(obj) \
     OBJECT_CHECK(TPMBackend, (obj), TYPE_TPM_BACKEND)
 #define TPM_BACKEND_GET_CLASS(obj) \
@@ -26,8 +28,6 @@
 #define TPM_BACKEND_CLASS(klass) \
     OBJECT_CLASS_CHECK(TPMBackendClass, (klass), TYPE_TPM_BACKEND)
 
-typedef struct TPMBackendClass TPMBackendClass;
-typedef struct TPMBackend TPMBackend;
 
 typedef struct TPMBackendCmd {
     uint8_t locty;
diff --git a/include/sysemu/vhost-user-backend.h b/include/sysemu/vhost-user-backend.h
index 9abf8f06a1..89eb5eaf65 100644
--- a/include/sysemu/vhost-user-backend.h
+++ b/include/sysemu/vhost-user-backend.h
@@ -22,6 +22,8 @@
 #include "io/channel.h"
 
 #define TYPE_VHOST_USER_BACKEND "vhost-user-backend"
+typedef struct VhostUserBackend VhostUserBackend;
+typedef struct VhostUserBackendClass VhostUserBackendClass;
 #define VHOST_USER_BACKEND(obj) \
     OBJECT_CHECK(VhostUserBackend, (obj), TYPE_VHOST_USER_BACKEND)
 #define VHOST_USER_BACKEND_GET_CLASS(obj) \
@@ -29,8 +31,6 @@
 #define VHOST_USER_BACKEND_CLASS(klass) \
     OBJECT_CLASS_CHECK(VhostUserBackendClass, (klass), TYPE_VHOST_USER_BACKEND)
 
-typedef struct VhostUserBackend VhostUserBackend;
-typedef struct VhostUserBackendClass VhostUserBackendClass;
 
 struct VhostUserBackendClass {
     ObjectClass parent_class;
diff --git a/include/ui/console.h b/include/ui/console.h
index f35b4fc082..2a74a27d50 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -106,6 +106,7 @@ void kbd_put_keysym(int keysym);
 /* consoles */
 
 #define TYPE_QEMU_CONSOLE "qemu-console"
+typedef struct QemuConsoleClass QemuConsoleClass;
 #define QEMU_CONSOLE(obj) \
     OBJECT_CHECK(QemuConsole, (obj), TYPE_QEMU_CONSOLE)
 #define QEMU_CONSOLE_GET_CLASS(obj) \
@@ -113,7 +114,6 @@ void kbd_put_keysym(int keysym);
 #define QEMU_CONSOLE_CLASS(klass) \
     OBJECT_CLASS_CHECK(QemuConsoleClass, (klass), TYPE_QEMU_CONSOLE)
 
-typedef struct QemuConsoleClass QemuConsoleClass;
 
 struct QemuConsoleClass {
     ObjectClass parent_class;
diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
index 08832fa767..1124668cf0 100644
--- a/target/alpha/cpu-qom.h
+++ b/target/alpha/cpu-qom.h
@@ -21,9 +21,12 @@
 #define QEMU_ALPHA_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_ALPHA_CPU "alpha-cpu"
 
+typedef struct AlphaCPU AlphaCPU;
+typedef struct AlphaCPUClass AlphaCPUClass;
 #define ALPHA_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(AlphaCPUClass, (klass), TYPE_ALPHA_CPU)
 #define ALPHA_CPU(obj) \
@@ -38,15 +41,14 @@
  *
  * An Alpha CPU model.
  */
-typedef struct AlphaCPUClass {
+struct AlphaCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} AlphaCPUClass;
+};
 
-typedef struct AlphaCPU AlphaCPU;
 
 #endif
diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index fdef05cacf..d0c68b01c5 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -21,11 +21,14 @@
 #define QEMU_ARM_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 struct arm_boot_info;
 
 #define TYPE_ARM_CPU "arm-cpu"
 
+typedef struct ARMCPU ARMCPU;
+typedef struct ARMCPUClass ARMCPUClass;
 #define ARM_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(ARMCPUClass, (klass), TYPE_ARM_CPU)
 #define ARM_CPU(obj) \
@@ -51,7 +54,7 @@ void aarch64_cpu_register(const ARMCPUInfo *info);
  *
  * An ARM CPU model.
  */
-typedef struct ARMCPUClass {
+struct ARMCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
@@ -59,21 +62,21 @@ typedef struct ARMCPUClass {
     const ARMCPUInfo *info;
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} ARMCPUClass;
+};
 
-typedef struct ARMCPU ARMCPU;
 
 #define TYPE_AARCH64_CPU "aarch64-cpu"
+typedef struct AArch64CPUClass AArch64CPUClass;
 #define AARCH64_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(AArch64CPUClass, (klass), TYPE_AARCH64_CPU)
 #define AARCH64_CPU_GET_CLASS(obj) \
     OBJECT_GET_CLASS(AArch64CPUClass, (obj), TYPE_AARCH64_CPU)
 
-typedef struct AArch64CPUClass {
+struct AArch64CPUClass {
     /*< private >*/
     ARMCPUClass parent_class;
     /*< public >*/
-} AArch64CPUClass;
+};
 
 void register_cp_regs_for_features(ARMCPU *cpu);
 void init_cpreg_list(ARMCPU *cpu);
diff --git a/target/arm/idau.h b/target/arm/idau.h
index 7c0e4e3776..2f09bbb34f 100644
--- a/target/arm/idau.h
+++ b/target/arm/idau.h
@@ -33,6 +33,7 @@
 #define TYPE_IDAU_INTERFACE "idau-interface"
 #define IDAU_INTERFACE(obj) \
     INTERFACE_CHECK(IDAUInterface, (obj), TYPE_IDAU_INTERFACE)
+typedef struct IDAUInterfaceClass IDAUInterfaceClass;
 #define IDAU_INTERFACE_CLASS(class) \
     OBJECT_CLASS_CHECK(IDAUInterfaceClass, (class), TYPE_IDAU_INTERFACE)
 #define IDAU_INTERFACE_GET_CLASS(obj) \
@@ -42,7 +43,7 @@ typedef struct IDAUInterface IDAUInterface;
 
 #define IREGION_NOTVALID -1
 
-typedef struct IDAUInterfaceClass {
+struct IDAUInterfaceClass {
     InterfaceClass parent;
 
     /* Check the specified address and return the IDAU security information
@@ -54,6 +55,6 @@ typedef struct IDAUInterfaceClass {
      */
     void (*check)(IDAUInterface *ii, uint32_t address, int *iregion,
                   bool *exempt, bool *ns, bool *nsc);
-} IDAUInterfaceClass;
+};
 
 #endif
diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
index d23ad43a99..fac8430253 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -22,9 +22,12 @@
 #define QEMU_AVR_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_AVR_CPU "avr-cpu"
 
+typedef struct AVRCPU AVRCPU;
+typedef struct AVRCPUClass AVRCPUClass;
 #define AVR_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(AVRCPUClass, (klass), TYPE_AVR_CPU)
 #define AVR_CPU(obj) \
@@ -40,14 +43,13 @@
  *
  *  A AVR CPU model.
  */
-typedef struct AVRCPUClass {
+struct AVRCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} AVRCPUClass;
+};
 
-typedef struct AVRCPU AVRCPU;
 
 #endif /* !defined (QEMU_AVR_CPU_QOM_H) */
diff --git a/target/cris/cpu-qom.h b/target/cris/cpu-qom.h
index f1de6041dc..cac3e9af1b 100644
--- a/target/cris/cpu-qom.h
+++ b/target/cris/cpu-qom.h
@@ -21,9 +21,12 @@
 #define QEMU_CRIS_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_CRIS_CPU "cris-cpu"
 
+typedef struct CRISCPU CRISCPU;
+typedef struct CRISCPUClass CRISCPUClass;
 #define CRIS_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(CRISCPUClass, (klass), TYPE_CRIS_CPU)
 #define CRIS_CPU(obj) \
@@ -39,7 +42,7 @@
  *
  * A CRIS CPU model.
  */
-typedef struct CRISCPUClass {
+struct CRISCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
@@ -48,8 +51,7 @@ typedef struct CRISCPUClass {
     DeviceReset parent_reset;
 
     uint32_t vr;
-} CRISCPUClass;
+};
 
-typedef struct CRISCPU CRISCPU;
 
 #endif
diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
index b1f6045495..295b2aaf19 100644
--- a/target/hppa/cpu-qom.h
+++ b/target/hppa/cpu-qom.h
@@ -21,9 +21,12 @@
 #define QEMU_HPPA_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_HPPA_CPU "hppa-cpu"
 
+typedef struct HPPACPU HPPACPU;
+typedef struct HPPACPUClass HPPACPUClass;
 #define HPPA_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(HPPACPUClass, (klass), TYPE_HPPA_CPU)
 #define HPPA_CPU(obj) \
@@ -38,15 +41,14 @@
  *
  * An HPPA CPU model.
  */
-typedef struct HPPACPUClass {
+struct HPPACPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} HPPACPUClass;
+};
 
-typedef struct HPPACPU HPPACPU;
 
 #endif
diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index 3e96f8d668..6b0bf476e5 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -22,6 +22,7 @@
 
 #include "hw/core/cpu.h"
 #include "qemu/notify.h"
+#include "qom/object.h"
 
 #ifdef TARGET_X86_64
 #define TYPE_X86_CPU "x86_64-cpu"
@@ -29,6 +30,8 @@
 #define TYPE_X86_CPU "i386-cpu"
 #endif
 
+typedef struct X86CPU X86CPU;
+typedef struct X86CPUClass X86CPUClass;
 #define X86_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(X86CPUClass, (klass), TYPE_X86_CPU)
 #define X86_CPU(obj) \
@@ -50,7 +53,7 @@ typedef struct X86CPUModel X86CPUModel;
  *
  * An x86 CPU model or family.
  */
-typedef struct X86CPUClass {
+struct X86CPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
@@ -72,8 +75,7 @@ typedef struct X86CPUClass {
     DeviceRealize parent_realize;
     DeviceUnrealize parent_unrealize;
     DeviceReset parent_reset;
-} X86CPUClass;
+};
 
-typedef struct X86CPU X86CPU;
 
 #endif
diff --git a/target/lm32/cpu-qom.h b/target/lm32/cpu-qom.h
index bdedb3759a..2c0654b695 100644
--- a/target/lm32/cpu-qom.h
+++ b/target/lm32/cpu-qom.h
@@ -21,9 +21,12 @@
 #define QEMU_LM32_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_LM32_CPU "lm32-cpu"
 
+typedef struct LM32CPU LM32CPU;
+typedef struct LM32CPUClass LM32CPUClass;
 #define LM32_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(LM32CPUClass, (klass), TYPE_LM32_CPU)
 #define LM32_CPU(obj) \
@@ -38,15 +41,14 @@
  *
  * A LatticeMico32 CPU model.
  */
-typedef struct LM32CPUClass {
+struct LM32CPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} LM32CPUClass;
+};
 
-typedef struct LM32CPU LM32CPU;
 
 #endif
diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
index 88b11b60f1..3b199be545 100644
--- a/target/m68k/cpu-qom.h
+++ b/target/m68k/cpu-qom.h
@@ -21,9 +21,12 @@
 #define QEMU_M68K_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_M68K_CPU "m68k-cpu"
 
+typedef struct M68kCPU M68kCPU;
+typedef struct M68kCPUClass M68kCPUClass;
 #define M68K_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(M68kCPUClass, (klass), TYPE_M68K_CPU)
 #define M68K_CPU(obj) \
@@ -38,15 +41,14 @@
  *
  * A Motorola 68k CPU model.
  */
-typedef struct M68kCPUClass {
+struct M68kCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} M68kCPUClass;
+};
 
-typedef struct M68kCPU M68kCPU;
 
 #endif
diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index 053ba44ee8..564fa18ccb 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -21,9 +21,12 @@
 #define QEMU_MICROBLAZE_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_MICROBLAZE_CPU "microblaze-cpu"
 
+typedef struct MicroBlazeCPU MicroBlazeCPU;
+typedef struct MicroBlazeCPUClass MicroBlazeCPUClass;
 #define MICROBLAZE_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(MicroBlazeCPUClass, (klass), TYPE_MICROBLAZE_CPU)
 #define MICROBLAZE_CPU(obj) \
@@ -38,15 +41,14 @@
  *
  * A MicroBlaze CPU model.
  */
-typedef struct MicroBlazeCPUClass {
+struct MicroBlazeCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} MicroBlazeCPUClass;
+};
 
-typedef struct MicroBlazeCPU MicroBlazeCPU;
 
 #endif
diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index 9d0df6c034..3a5fd9561e 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -21,6 +21,7 @@
 #define QEMU_MIPS_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #ifdef TARGET_MIPS64
 #define TYPE_MIPS_CPU "mips64-cpu"
@@ -28,6 +29,8 @@
 #define TYPE_MIPS_CPU "mips-cpu"
 #endif
 
+typedef struct MIPSCPU MIPSCPU;
+typedef struct MIPSCPUClass MIPSCPUClass;
 #define MIPS_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(MIPSCPUClass, (klass), TYPE_MIPS_CPU)
 #define MIPS_CPU(obj) \
@@ -42,7 +45,7 @@
  *
  * A MIPS CPU model.
  */
-typedef struct MIPSCPUClass {
+struct MIPSCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
@@ -50,8 +53,7 @@ typedef struct MIPSCPUClass {
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
     const struct mips_def_t *cpu_def;
-} MIPSCPUClass;
+};
 
-typedef struct MIPSCPU MIPSCPU;
 
 #endif
diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
index 455553b794..af4d6abf16 100644
--- a/target/moxie/cpu.h
+++ b/target/moxie/cpu.h
@@ -21,6 +21,7 @@
 #define MOXIE_CPU_H
 
 #include "exec/cpu-defs.h"
+#include "qom/object.h"
 
 #define MOXIE_EX_DIV0        0
 #define MOXIE_EX_BAD         1
@@ -50,6 +51,8 @@ typedef struct CPUMoxieState {
 
 #define TYPE_MOXIE_CPU "moxie-cpu"
 
+typedef struct MoxieCPU MoxieCPU;
+typedef struct MoxieCPUClass MoxieCPUClass;
 #define MOXIE_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(MoxieCPUClass, (klass), TYPE_MOXIE_CPU)
 #define MOXIE_CPU(obj) \
@@ -63,14 +66,14 @@ typedef struct CPUMoxieState {
  *
  * A Moxie CPU model.
  */
-typedef struct MoxieCPUClass {
+struct MoxieCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} MoxieCPUClass;
+};
 
 /**
  * MoxieCPU:
@@ -78,14 +81,14 @@ typedef struct MoxieCPUClass {
  *
  * A Moxie CPU.
  */
-typedef struct MoxieCPU {
+struct MoxieCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
 
     CPUNegativeOffsetState neg;
     CPUMoxieState env;
-} MoxieCPU;
+};
 
 
 void moxie_cpu_do_interrupt(CPUState *cs);
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 4dddf9c3a1..7162cbdf5c 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -23,6 +23,7 @@
 
 #include "exec/cpu-defs.h"
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 typedef struct CPUNios2State CPUNios2State;
 #if !defined(CONFIG_USER_ONLY)
@@ -31,6 +32,8 @@ typedef struct CPUNios2State CPUNios2State;
 
 #define TYPE_NIOS2_CPU "nios2-cpu"
 
+typedef struct Nios2CPU Nios2CPU;
+typedef struct Nios2CPUClass Nios2CPUClass;
 #define NIOS2_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(Nios2CPUClass, (klass), TYPE_NIOS2_CPU)
 #define NIOS2_CPU(obj) \
@@ -44,14 +47,14 @@ typedef struct CPUNios2State CPUNios2State;
  *
  * A Nios2 CPU model.
  */
-typedef struct Nios2CPUClass {
+struct Nios2CPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} Nios2CPUClass;
+};
 
 #define TARGET_HAS_ICE 1
 
@@ -174,7 +177,7 @@ struct CPUNios2State {
  *
  * A Nios2 CPU.
  */
-typedef struct Nios2CPU {
+struct Nios2CPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -191,7 +194,7 @@ typedef struct Nios2CPU {
     uint32_t reset_addr;
     uint32_t exception_addr;
     uint32_t fast_tlb_miss_addr;
-} Nios2CPU;
+};
 
 
 void nios2_tcg_init(void);
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index f37a52e153..ab0dd55358 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -22,12 +22,15 @@
 
 #include "exec/cpu-defs.h"
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 /* cpu_openrisc_map_address_* in CPUOpenRISCTLBContext need this decl.  */
 struct OpenRISCCPU;
 
 #define TYPE_OPENRISC_CPU "or1k-cpu"
 
+typedef struct OpenRISCCPU OpenRISCCPU;
+typedef struct OpenRISCCPUClass OpenRISCCPUClass;
 #define OPENRISC_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(OpenRISCCPUClass, (klass), TYPE_OPENRISC_CPU)
 #define OPENRISC_CPU(obj) \
@@ -42,14 +45,14 @@ struct OpenRISCCPU;
  *
  * A OpenRISC CPU model.
  */
-typedef struct OpenRISCCPUClass {
+struct OpenRISCCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} OpenRISCCPUClass;
+};
 
 #define TARGET_INSN_START_EXTRA_WORDS 1
 
@@ -305,14 +308,14 @@ typedef struct CPUOpenRISCState {
  *
  * A OpenRISC CPU.
  */
-typedef struct OpenRISCCPU {
+struct OpenRISCCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
 
     CPUNegativeOffsetState neg;
     CPUOpenRISCState env;
-} OpenRISCCPU;
+};
 
 
 void cpu_openrisc_list(void);
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 000c7d405b..017f0efc7b 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -21,6 +21,7 @@
 #define QEMU_PPC_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #ifdef TARGET_PPC64
 #define TYPE_POWERPC_CPU "powerpc64-cpu"
@@ -28,6 +29,8 @@
 #define TYPE_POWERPC_CPU "powerpc-cpu"
 #endif
 
+typedef struct PowerPCCPU PowerPCCPU;
+typedef struct PowerPCCPUClass PowerPCCPUClass;
 #define POWERPC_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(PowerPCCPUClass, (klass), TYPE_POWERPC_CPU)
 #define POWERPC_CPU(obj) \
@@ -35,7 +38,6 @@
 #define POWERPC_CPU_GET_CLASS(obj) \
     OBJECT_GET_CLASS(PowerPCCPUClass, (obj), TYPE_POWERPC_CPU)
 
-typedef struct PowerPCCPU PowerPCCPU;
 typedef struct CPUPPCState CPUPPCState;
 typedef struct ppc_tb_t ppc_tb_t;
 typedef struct ppc_dcr_t ppc_dcr_t;
@@ -159,7 +161,7 @@ typedef struct PPCHash64Options PPCHash64Options;
  *
  * A PowerPC CPU model.
  */
-typedef struct PowerPCCPUClass {
+struct PowerPCCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
@@ -197,7 +199,7 @@ typedef struct PowerPCCPUClass {
     int  (*check_pow)(CPUPPCState *env);
     int (*handle_mmu_fault)(PowerPCCPU *cpu, vaddr eaddr, int rwx, int mmu_idx);
     bool (*interrupts_big_endian)(PowerPCCPU *cpu);
-} PowerPCCPUClass;
+};
 
 #ifndef CONFIG_USER_ONLY
 typedef struct PPCTimebase {
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 3c4e1b3475..1c6fbfcfdb 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -23,6 +23,7 @@
 #include "qemu/int128.h"
 #include "exec/cpu-defs.h"
 #include "cpu-qom.h"
+#include "qom/object.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a804a5d0ba..7e4dde2547 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -24,6 +24,7 @@
 #include "hw/registerfields.h"
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
+#include "qom/object.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
@@ -231,6 +232,8 @@ struct CPURISCVState {
     QEMUTimer *timer; /* Internal timer */
 };
 
+typedef struct RISCVCPU RISCVCPU;
+typedef struct RISCVCPUClass RISCVCPUClass;
 #define RISCV_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(RISCVCPUClass, (klass), TYPE_RISCV_CPU)
 #define RISCV_CPU(obj) \
@@ -245,13 +248,13 @@ struct CPURISCVState {
  *
  * A RISCV CPU model.
  */
-typedef struct RISCVCPUClass {
+struct RISCVCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} RISCVCPUClass;
+};
 
 /**
  * RISCVCPU:
@@ -259,7 +262,7 @@ typedef struct RISCVCPUClass {
  *
  * A RISCV CPU.
  */
-typedef struct RISCVCPU {
+struct RISCVCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -292,7 +295,7 @@ typedef struct RISCVCPU {
         bool mmu;
         bool pmp;
     } cfg;
-} RISCVCPU;
+};
 
 static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
 {
diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index 1630818c28..13f1f2659e 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -21,9 +21,12 @@
 #define QEMU_S390_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_S390_CPU "s390x-cpu"
 
+typedef struct S390CPU S390CPU;
+typedef struct S390CPUClass S390CPUClass;
 #define S390_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(S390CPUClass, (klass), TYPE_S390_CPU)
 #define S390_CPU(obj) \
@@ -50,7 +53,7 @@ typedef enum cpu_reset_type {
  *
  * An S/390 CPU model.
  */
-typedef struct S390CPUClass {
+struct S390CPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
@@ -64,9 +67,8 @@ typedef struct S390CPUClass {
     DeviceReset parent_reset;
     void (*load_normal)(CPUState *cpu);
     void (*reset)(CPUState *cpu, cpu_reset_type type);
-} S390CPUClass;
+};
 
-typedef struct S390CPU S390CPU;
 typedef struct CPUS390XState CPUS390XState;
 
 #endif
diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
index 72a63f3fd3..bf71c0f8e5 100644
--- a/target/sh4/cpu-qom.h
+++ b/target/sh4/cpu-qom.h
@@ -21,6 +21,7 @@
 #define QEMU_SUPERH_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_SUPERH_CPU "superh-cpu"
 
@@ -28,6 +29,8 @@
 #define TYPE_SH7751R_CPU SUPERH_CPU_TYPE_NAME("sh7751r")
 #define TYPE_SH7785_CPU  SUPERH_CPU_TYPE_NAME("sh7785")
 
+typedef struct SuperHCPU SuperHCPU;
+typedef struct SuperHCPUClass SuperHCPUClass;
 #define SUPERH_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(SuperHCPUClass, (klass), TYPE_SUPERH_CPU)
 #define SUPERH_CPU(obj) \
@@ -45,7 +48,7 @@
  *
  * A SuperH CPU model.
  */
-typedef struct SuperHCPUClass {
+struct SuperHCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
@@ -56,8 +59,7 @@ typedef struct SuperHCPUClass {
     uint32_t pvr;
     uint32_t prr;
     uint32_t cvr;
-} SuperHCPUClass;
+};
 
-typedef struct SuperHCPU SuperHCPU;
 
 #endif
diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
index 8b4d33c21e..b7cc81e5f3 100644
--- a/target/sparc/cpu-qom.h
+++ b/target/sparc/cpu-qom.h
@@ -21,6 +21,7 @@
 #define QEMU_SPARC_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #ifdef TARGET_SPARC64
 #define TYPE_SPARC_CPU "sparc64-cpu"
@@ -28,6 +29,8 @@
 #define TYPE_SPARC_CPU "sparc-cpu"
 #endif
 
+typedef struct SPARCCPU SPARCCPU;
+typedef struct SPARCCPUClass SPARCCPUClass;
 #define SPARC_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(SPARCCPUClass, (klass), TYPE_SPARC_CPU)
 #define SPARC_CPU(obj) \
@@ -43,7 +46,7 @@ typedef struct sparc_def_t sparc_def_t;
  *
  * A SPARC CPU model.
  */
-typedef struct SPARCCPUClass {
+struct SPARCCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
@@ -51,8 +54,7 @@ typedef struct SPARCCPUClass {
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
     sparc_def_t *cpu_def;
-} SPARCCPUClass;
+};
 
-typedef struct SPARCCPU SPARCCPU;
 
 #endif
diff --git a/target/tilegx/cpu.h b/target/tilegx/cpu.h
index 193b6bbccb..d6cc1d2982 100644
--- a/target/tilegx/cpu.h
+++ b/target/tilegx/cpu.h
@@ -21,6 +21,7 @@
 #define TILEGX_CPU_H
 
 #include "exec/cpu-defs.h"
+#include "qom/object.h"
 
 /* TILE-Gx common register alias */
 #define TILEGX_R_RE    0   /*  0 register, for function/syscall return value */
@@ -98,6 +99,8 @@ typedef struct CPUTLGState {
 
 #define TYPE_TILEGX_CPU "tilegx-cpu"
 
+typedef struct TileGXCPU TileGXCPU;
+typedef struct TileGXCPUClass TileGXCPUClass;
 #define TILEGX_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(TileGXCPUClass, (klass), TYPE_TILEGX_CPU)
 #define TILEGX_CPU(obj) \
@@ -112,14 +115,14 @@ typedef struct CPUTLGState {
  *
  * A Tile-Gx CPU model.
  */
-typedef struct TileGXCPUClass {
+struct TileGXCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} TileGXCPUClass;
+};
 
 /**
  * TileGXCPU:
@@ -127,14 +130,14 @@ typedef struct TileGXCPUClass {
  *
  * A Tile-GX CPU.
  */
-typedef struct TileGXCPU {
+struct TileGXCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
 
     CPUNegativeOffsetState neg;
     CPUTLGState env;
-} TileGXCPU;
+};
 
 
 /* TILE-Gx memory attributes */
diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
index cd819e6f24..cef466da74 100644
--- a/target/tricore/cpu-qom.h
+++ b/target/tricore/cpu-qom.h
@@ -19,10 +19,13 @@
 #define QEMU_TRICORE_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 
 #define TYPE_TRICORE_CPU "tricore-cpu"
 
+typedef struct TriCoreCPU TriCoreCPU;
+typedef struct TriCoreCPUClass TriCoreCPUClass;
 #define TRICORE_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(TriCoreCPUClass, (klass), TYPE_TRICORE_CPU)
 #define TRICORE_CPU(obj) \
@@ -30,15 +33,14 @@
 #define TRICORE_CPU_GET_CLASS(obj) \
     OBJECT_GET_CLASS(TriCoreCPUClass, (obj), TYPE_TRICORE_CPU)
 
-typedef struct TriCoreCPUClass {
+struct TriCoreCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} TriCoreCPUClass;
+};
 
-typedef struct TriCoreCPU TriCoreCPU;
 
 #endif /* QEMU_TRICORE_CPU_QOM_H */
diff --git a/target/unicore32/cpu-qom.h b/target/unicore32/cpu-qom.h
index 7dd04515cb..6a1cb1c82d 100644
--- a/target/unicore32/cpu-qom.h
+++ b/target/unicore32/cpu-qom.h
@@ -12,9 +12,12 @@
 #define QEMU_UC32_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_UNICORE32_CPU "unicore32-cpu"
 
+typedef struct UniCore32CPU UniCore32CPU;
+typedef struct UniCore32CPUClass UniCore32CPUClass;
 #define UNICORE32_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(UniCore32CPUClass, (klass), TYPE_UNICORE32_CPU)
 #define UNICORE32_CPU(obj) \
@@ -28,14 +31,13 @@
  *
  * A UniCore32 CPU model.
  */
-typedef struct UniCore32CPUClass {
+struct UniCore32CPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
-} UniCore32CPUClass;
+};
 
-typedef struct UniCore32CPU UniCore32CPU;
 
 #endif
diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
index 3ea93ce1f9..cd9f31dc84 100644
--- a/target/xtensa/cpu-qom.h
+++ b/target/xtensa/cpu-qom.h
@@ -30,9 +30,12 @@
 #define QEMU_XTENSA_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "qom/object.h"
 
 #define TYPE_XTENSA_CPU "xtensa-cpu"
 
+typedef struct XtensaCPU XtensaCPU;
+typedef struct XtensaCPUClass XtensaCPUClass;
 #define XTENSA_CPU_CLASS(class) \
     OBJECT_CLASS_CHECK(XtensaCPUClass, (class), TYPE_XTENSA_CPU)
 #define XTENSA_CPU(obj) \
@@ -50,7 +53,7 @@ typedef struct XtensaConfig XtensaConfig;
  *
  * An Xtensa CPU model.
  */
-typedef struct XtensaCPUClass {
+struct XtensaCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
@@ -59,8 +62,7 @@ typedef struct XtensaCPUClass {
     DeviceReset parent_reset;
 
     const XtensaConfig *config;
-} XtensaCPUClass;
+};
 
-typedef struct XtensaCPU XtensaCPU;
 
 #endif
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index c29e72fb1f..39de5eab4b 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -36,12 +36,13 @@
 #include "hw/boards.h"
 #include "qapi/qapi-builtin-visit.h"
 
-typedef struct TCGState {
+struct TCGState {
     AccelState parent_obj;
 
     bool mttcg_enabled;
     unsigned long tb_size;
-} TCGState;
+};
+typedef struct TCGState TCGState;
 
 #define TYPE_TCG_ACCEL ACCEL_CLASS_NAME("tcg")
 
diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index cb3690383f..235c0c2572 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "standard-headers/linux/virtio_crypto.h"
 #include "crypto/cipher.h"
+#include "qom/object.h"
 
 
 /**
@@ -34,12 +35,12 @@
  */
 #define TYPE_CRYPTODEV_BACKEND_BUILTIN "cryptodev-backend-builtin"
 
+typedef struct CryptoDevBackendBuiltin
+                         CryptoDevBackendBuiltin;
 #define CRYPTODEV_BACKEND_BUILTIN(obj) \
     OBJECT_CHECK(CryptoDevBackendBuiltin, \
                  (obj), TYPE_CRYPTODEV_BACKEND_BUILTIN)
 
-typedef struct CryptoDevBackendBuiltin
-                         CryptoDevBackendBuiltin;
 
 typedef struct CryptoDevBackendBuiltinSession {
     QCryptoCipher *cipher;
diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-user.c
index 0fffa10214..ae7745cd22 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -30,6 +30,7 @@
 #include "sysemu/cryptodev-vhost.h"
 #include "chardev/char-fe.h"
 #include "sysemu/cryptodev-vhost-user.h"
+#include "qom/object.h"
 
 
 /**
@@ -38,12 +39,13 @@
  */
 #define TYPE_CRYPTODEV_BACKEND_VHOST_USER "cryptodev-vhost-user"
 
+typedef struct CryptoDevBackendVhostUser CryptoDevBackendVhostUser;
 #define CRYPTODEV_BACKEND_VHOST_USER(obj) \
     OBJECT_CHECK(CryptoDevBackendVhostUser, \
                  (obj), TYPE_CRYPTODEV_BACKEND_VHOST_USER)
 
 
-typedef struct CryptoDevBackendVhostUser {
+struct CryptoDevBackendVhostUser {
     CryptoDevBackend parent_obj;
 
     VhostUserState vhost_user;
@@ -51,7 +53,7 @@ typedef struct CryptoDevBackendVhostUser {
     char *chr_name;
     bool opened;
     CryptoDevBackendVhost *vhost_crypto[MAX_CRYPTO_QUEUE_NUM];
-} CryptoDevBackendVhostUser;
+};
 
 static int
 cryptodev_vhost_user_running(
diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index d8cc3e7e25..6a92a0f986 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -19,6 +19,7 @@
 #include "qapi/qmp/qerror.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "qom/object.h"
 
 typedef struct DBusVMState DBusVMState;
 typedef struct DBusVMStateClass DBusVMStateClass;
diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 5037357cd0..d4be9ac096 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -17,11 +17,12 @@
 #include "sysemu/hostmem.h"
 #include "sysemu/sysemu.h"
 #include "qom/object_interfaces.h"
+#include "qom/object.h"
 
+typedef struct HostMemoryBackendFile HostMemoryBackendFile;
 #define MEMORY_BACKEND_FILE(obj) \
     OBJECT_CHECK(HostMemoryBackendFile, (obj), TYPE_MEMORY_BACKEND_FILE)
 
-typedef struct HostMemoryBackendFile HostMemoryBackendFile;
 
 struct HostMemoryBackendFile {
     HostMemoryBackend parent_obj;
diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 4b4f13a3ca..a62e3f2784 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -17,13 +17,14 @@
 #include "qemu/memfd.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 
 #define TYPE_MEMORY_BACKEND_MEMFD "memory-backend-memfd"
 
+typedef struct HostMemoryBackendMemfd HostMemoryBackendMemfd;
 #define MEMORY_BACKEND_MEMFD(obj)                                        \
     OBJECT_CHECK(HostMemoryBackendMemfd, (obj), TYPE_MEMORY_BACKEND_MEMFD)
 
-typedef struct HostMemoryBackendMemfd HostMemoryBackendMemfd;
 
 struct HostMemoryBackendMemfd {
     HostMemoryBackend parent_obj;
diff --git a/backends/rng-builtin.c b/backends/rng-builtin.c
index d6afd54b3e..5e4d0a7292 100644
--- a/backends/rng-builtin.c
+++ b/backends/rng-builtin.c
@@ -9,13 +9,15 @@
 #include "sysemu/rng.h"
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
+#include "qom/object.h"
 
+typedef struct RngBuiltin RngBuiltin;
 #define RNG_BUILTIN(obj) OBJECT_CHECK(RngBuiltin, (obj), TYPE_RNG_BUILTIN)
 
-typedef struct RngBuiltin {
+struct RngBuiltin {
     RngBackend parent;
     QEMUBH *bh;
-} RngBuiltin;
+};
 
 static void rng_builtin_receive_entropy_bh(void *opaque)
 {
diff --git a/backends/rng-egd.c b/backends/rng-egd.c
index 90d57417ff..c01ec5ee71 100644
--- a/backends/rng-egd.c
+++ b/backends/rng-egd.c
@@ -16,17 +16,18 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define TYPE_RNG_EGD "rng-egd"
+typedef struct RngEgd RngEgd;
 #define RNG_EGD(obj) OBJECT_CHECK(RngEgd, (obj), TYPE_RNG_EGD)
 
-typedef struct RngEgd
-{
+struct RngEgd {
     RngBackend parent;
 
     CharBackend chr;
     char *chr_name;
-} RngEgd;
+};
 
 static void rng_egd_request_entropy(RngBackend *b, RngRequest *req)
 {
diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index ac441337d9..50e455f6fd 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -42,8 +42,10 @@
 #include "qapi/qapi-visit-tpm.h"
 #include "chardev/char-fe.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define TYPE_TPM_EMULATOR "tpm-emulator"
+typedef struct TPMEmulator TPMEmulator;
 #define TPM_EMULATOR(obj) \
     OBJECT_CHECK(TPMEmulator, (obj), TYPE_TPM_EMULATOR)
 
@@ -63,7 +65,7 @@ typedef struct TPMBlobBuffers {
     TPMSizedBuffer savestate;
 } TPMBlobBuffers;
 
-typedef struct TPMEmulator {
+struct TPMEmulator {
     TPMBackend parent;
 
     TPMEmulatorOptions *options;
@@ -80,7 +82,7 @@ typedef struct TPMEmulator {
     unsigned int established_flag_cached:1;
 
     TPMBlobBuffers state_blobs;
-} TPMEmulator;
+};
 
 struct tpm_error {
     uint32_t tpm_result;
diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.c
index 8e67b4b7d6..a82c4f324c 100644
--- a/backends/tpm/tpm_passthrough.c
+++ b/backends/tpm/tpm_passthrough.c
@@ -33,8 +33,10 @@
 #include "qapi/clone-visitor.h"
 #include "qapi/qapi-visit-tpm.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define TYPE_TPM_PASSTHROUGH "tpm-passthrough"
+typedef struct TPMPassthruState TPMPassthruState;
 #define TPM_PASSTHROUGH(obj) \
     OBJECT_CHECK(TPMPassthruState, (obj), TYPE_TPM_PASSTHROUGH)
 
@@ -53,7 +55,6 @@ struct TPMPassthruState {
     size_t tpm_buffersize;
 };
 
-typedef struct TPMPassthruState TPMPassthruState;
 
 #define TPM_PASSTHROUGH_DEFAULT_DEVICE "/dev/tpm0"
 
diff --git a/chardev/baum.c b/chardev/baum.c
index f111ebfe05..1efc61d017 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -33,6 +33,7 @@
 #include <brlapi.h>
 #include <brlapi_constants.h>
 #include <brlapi_keycodes.h>
+#include "qom/object.h"
 
 #if 0
 #define DPRINTF(fmt, ...) \
@@ -86,7 +87,7 @@
 
 #define BUF_SIZE 256
 
-typedef struct {
+struct BaumChardev {
     Chardev parent;
 
     brlapi_handle_t *brlapi;
@@ -100,7 +101,8 @@ typedef struct {
     uint8_t out_buf_used, out_buf_ptr;
 
     QEMUTimer *cellCount_timer;
-} BaumChardev;
+};
+typedef struct BaumChardev BaumChardev;
 
 #define TYPE_CHARDEV_BRAILLE "chardev-braille"
 #define BAUM_CHARDEV(obj) OBJECT_CHECK(BaumChardev, (obj), TYPE_CHARDEV_BRAILLE)
diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index dd60ef9898..78b29dd8c2 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -28,6 +28,7 @@
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include <sys/ioctl.h>
+#include "qom/object.h"
 
 #ifdef CONFIG_BSD
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
@@ -49,11 +50,12 @@
 
 #if defined(__linux__)
 
-typedef struct {
+struct ParallelChardev {
     Chardev parent;
     int fd;
     int mode;
-} ParallelChardev;
+};
+typedef struct ParallelChardev ParallelChardev;
 
 #define PARALLEL_CHARDEV(obj) \
     OBJECT_CHECK(ParallelChardev, (obj), TYPE_CHARDEV_PARALLEL)
@@ -177,10 +179,11 @@ static void qemu_chr_open_pp_fd(Chardev *chr,
 
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
 
-typedef struct {
+struct ParallelChardev {
     Chardev parent;
     int fd;
-} ParallelChardev;
+};
+typedef struct ParallelChardev ParallelChardev;
 
 #define PARALLEL_CHARDEV(obj)                                   \
     OBJECT_CHECK(ParallelChardev, (obj), TYPE_CHARDEV_PARALLEL)
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index 40d7bddba3..5b3453091a 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -33,15 +33,17 @@
 #include "qemu/qemu-print.h"
 
 #include "chardev/char-io.h"
+#include "qom/object.h"
 
-typedef struct {
+struct PtyChardev {
     Chardev parent;
     QIOChannel *ioc;
     int read_bytes;
 
     int connected;
     GSource *timer_src;
-} PtyChardev;
+};
+typedef struct PtyChardev PtyChardev;
 
 #define PTY_CHARDEV(obj) OBJECT_CHECK(PtyChardev, (obj), TYPE_CHARDEV_PTY)
 
diff --git a/chardev/char-ringbuf.c b/chardev/char-ringbuf.c
index fe9881b85b..e498b218ad 100644
--- a/chardev/char-ringbuf.c
+++ b/chardev/char-ringbuf.c
@@ -29,16 +29,18 @@
 #include "qemu/base64.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qom/object.h"
 
 /* Ring buffer chardev */
 
-typedef struct {
+struct RingBufChardev {
     Chardev parent;
     size_t size;
     size_t prod;
     size_t cons;
     uint8_t *cbuf;
-} RingBufChardev;
+};
+typedef struct RingBufChardev RingBufChardev;
 
 #define RINGBUF_CHARDEV(obj)                                    \
     OBJECT_CHECK(RingBufChardev, (obj), TYPE_CHARDEV_RINGBUF)
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 8c4ff2effb..86f6c21bf6 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -36,6 +36,7 @@
 #include "qapi/qapi-visit-sockets.h"
 
 #include "chardev/char-io.h"
+#include "qom/object.h"
 
 /***********************************************************/
 /* TCP Net console */
@@ -53,7 +54,7 @@ typedef enum {
     TCP_CHARDEV_STATE_CONNECTED,
 } TCPChardevState;
 
-typedef struct {
+struct SocketChardev {
     Chardev parent;
     QIOChannel *ioc; /* Client I/O channel */
     QIOChannelSocket *sioc; /* Client master channel */
@@ -84,7 +85,8 @@ typedef struct {
     bool connect_err_reported;
 
     QIOTask *connect_task;
-} SocketChardev;
+};
+typedef struct SocketChardev SocketChardev;
 
 #define SOCKET_CHARDEV(obj)                                     \
     OBJECT_CHECK(SocketChardev, (obj), TYPE_CHARDEV_SOCKET)
diff --git a/chardev/char-udp.c b/chardev/char-udp.c
index 0d175b62e0..fa7bfe2cbd 100644
--- a/chardev/char-udp.c
+++ b/chardev/char-udp.c
@@ -30,18 +30,20 @@
 #include "qemu/option.h"
 
 #include "chardev/char-io.h"
+#include "qom/object.h"
 
 /***********************************************************/
 /* UDP Net console */
 
-typedef struct {
+struct UdpChardev {
     Chardev parent;
     QIOChannel *ioc;
     uint8_t buf[CHR_READ_BUF_LEN];
     int bufcnt;
     int bufptr;
     int max_size;
-} UdpChardev;
+};
+typedef struct UdpChardev UdpChardev;
 
 #define UDP_CHARDEV(obj) OBJECT_CHECK(UdpChardev, (obj), TYPE_CHARDEV_UDP)
 
diff --git a/chardev/char-win-stdio.c b/chardev/char-win-stdio.c
index a6794d26d7..bd4e2598c1 100644
--- a/chardev/char-win-stdio.c
+++ b/chardev/char-win-stdio.c
@@ -28,15 +28,17 @@
 #include "qemu/module.h"
 #include "chardev/char-win.h"
 #include "chardev/char-win-stdio.h"
+#include "qom/object.h"
 
-typedef struct {
+struct WinStdioChardev {
     Chardev parent;
     HANDLE  hStdIn;
     HANDLE  hInputReadyEvent;
     HANDLE  hInputDoneEvent;
     HANDLE  hInputThread;
     uint8_t win_stdio_buf;
-} WinStdioChardev;
+};
+typedef struct WinStdioChardev WinStdioChardev;
 
 #define WIN_STDIO_CHARDEV(obj)                                          \
     OBJECT_CHECK(WinStdioChardev, (obj), TYPE_CHARDEV_WIN_STDIO)
diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index 680c772f6f..a901e01d45 100644
--- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -27,11 +27,12 @@
 #include "chardev/char.h"
 #include "ui/console.h"
 #include "ui/input.h"
+#include "qom/object.h"
 
 #define MSMOUSE_LO6(n) ((n) & 0x3f)
 #define MSMOUSE_HI2(n) (((n) & 0xc0) >> 6)
 
-typedef struct {
+struct MouseChardev {
     Chardev parent;
 
     QemuInputHandlerState *hs;
@@ -40,7 +41,8 @@ typedef struct {
     bool btnc[INPUT_BUTTON__MAX];
     uint8_t outbuf[32];
     int outlen;
-} MouseChardev;
+};
+typedef struct MouseChardev MouseChardev;
 
 #define TYPE_CHARDEV_MSMOUSE "chardev-msmouse"
 #define MOUSE_CHARDEV(obj)                                      \
diff --git a/chardev/testdev.c b/chardev/testdev.c
index 0c0ddc17d7..ce1370cd70 100644
--- a/chardev/testdev.c
+++ b/chardev/testdev.c
@@ -27,15 +27,17 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "chardev/char.h"
+#include "qom/object.h"
 
 #define BUF_SIZE 32
 
-typedef struct {
+struct TestdevChardev {
     Chardev parent;
 
     uint8_t in_buf[32];
     int in_buf_used;
-} TestdevChardev;
+};
+typedef struct TestdevChardev TestdevChardev;
 
 #define TYPE_CHARDEV_TESTDEV "chardev-testdev"
 #define TESTDEV_CHARDEV(obj)                                    \
diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index 95c7504002..76f29a793f 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -32,6 +32,7 @@
 #include "ui/console.h"
 #include "ui/input.h"
 #include "trace.h"
+#include "qom/object.h"
 
 
 #define WC_OUTPUT_BUF_MAX_LEN 512
@@ -64,7 +65,7 @@ uint8_t WC_FULL_CONFIG_STRING[WC_FULL_CONFIG_STRING_LENGTH + 1] = {
 };
 
 /* This structure is used to save private info for Wacom Tablet. */
-typedef struct {
+struct TabletChardev {
     Chardev parent;
     QemuInputHandlerState *hs;
 
@@ -81,7 +82,8 @@ typedef struct {
     int axis[INPUT_AXIS__MAX];
     bool btns[INPUT_BUTTON__MAX];
 
-} TabletChardev;
+};
+typedef struct TabletChardev TabletChardev;
 
 #define TYPE_CHARDEV_WCTABLET "chardev-wctablet"
 #define WCTABLET_CHARDEV(obj)                                      \
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index f27f6660f9..4ab0f2b6ae 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -45,6 +45,7 @@
 #include "migration/vmstate.h"
 #include "hw/core/cpu.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define GPE_BASE 0xafe0
 #define GPE_LEN 4
@@ -54,7 +55,7 @@ struct pci_status {
     uint32_t down;
 };
 
-typedef struct PIIX4PMState {
+struct PIIX4PMState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -88,7 +89,8 @@ typedef struct PIIX4PMState {
     CPUHotplugState cpuhp_state;
 
     MemHotplugState acpi_memory_hotplug;
-} PIIX4PMState;
+};
+typedef struct PIIX4PMState PIIX4PMState;
 
 #define PIIX4_PM(obj) \
     OBJECT_CHECK(PIIX4PMState, (obj), TYPE_PIIX4_PM)
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 637411c10b..d60f02fcde 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -15,6 +15,7 @@
 #include "hw/irq.h"
 #include "alpha_sys.h"
 #include "exec/address-spaces.h"
+#include "qom/object.h"
 
 
 #define TYPE_TYPHOON_PCI_HOST_BRIDGE "typhoon-pcihost"
@@ -49,16 +50,17 @@ typedef struct TyphoonPchip {
     TyphoonWindow win[4];
 } TyphoonPchip;
 
+typedef struct TyphoonState TyphoonState;
 #define TYPHOON_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(TyphoonState, (obj), TYPE_TYPHOON_PCI_HOST_BRIDGE)
 
-typedef struct TyphoonState {
+struct TyphoonState {
     PCIHostState parent_obj;
 
     TyphoonCchip cchip;
     TyphoonPchip pchip;
     MemoryRegion dchip_region;
-} TyphoonState;
+};
 
 /* Called when one of DRIR or DIM changes.  */
 static void cpu_irq_change(AlphaCPU *cpu, uint64_t req)
diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 041bab40ef..f2d8d3c529 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -18,12 +18,14 @@
 #include "hw/block/flash.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
+#include "qom/object.h"
 
-typedef struct {
+struct CollieMachineState {
     MachineState parent;
 
     StrongARMState *sa1110;
-} CollieMachineState;
+};
+typedef struct CollieMachineState CollieMachineState;
 
 #define TYPE_COLLIE_MACHINE MACHINE_TYPE_NAME("collie")
 #define COLLIE_MACHINE(obj) \
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 07dad406b4..fa7dc3875a 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -36,6 +36,7 @@
 #include "hw/cpu/a9mpcore.h"
 #include "hw/cpu/a15mpcore.h"
 #include "qemu/log.h"
+#include "qom/object.h"
 
 #define SMP_BOOT_ADDR           0x100
 #define SMP_BOOT_REG            0x40
@@ -155,17 +156,18 @@ static const MemoryRegionOps hb_mem_ops = {
 };
 
 #define TYPE_HIGHBANK_REGISTERS "highbank-regs"
+typedef struct HighbankRegsState HighbankRegsState;
 #define HIGHBANK_REGISTERS(obj) \
     OBJECT_CHECK(HighbankRegsState, (obj), TYPE_HIGHBANK_REGISTERS)
 
-typedef struct {
+struct HighbankRegsState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
 
     MemoryRegion iomem;
     uint32_t regs[NUM_REGS];
-} HighbankRegsState;
+};
 
 static VMStateDescription vmstate_highbank_regs = {
     .name = "highbank-regs",
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index 92331aebf1..a5b7319dcc 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -18,13 +18,15 @@
 #include "hw/arm/nrf51_soc.h"
 #include "hw/i2c/microbit_i2c.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
-typedef struct {
+struct MicrobitMachineState {
     MachineState parent;
 
     NRF51State nrf51;
     MicrobitI2CState i2c;
-} MicrobitMachineState;
+};
+typedef struct MicrobitMachineState MicrobitMachineState;
 
 #define TYPE_MICROBIT_MACHINE MACHINE_TYPE_NAME("microbit")
 
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 0a1819fd67..7c0efa6a9a 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -62,6 +62,7 @@
 #include "hw/net/lan9118.h"
 #include "net/net.h"
 #include "hw/core/split-irq.h"
+#include "qom/object.h"
 
 #define MPS2TZ_NUMIRQ 92
 
@@ -70,14 +71,15 @@ typedef enum MPS2TZFPGAType {
     FPGA_AN521,
 } MPS2TZFPGAType;
 
-typedef struct {
+struct MPS2TZMachineClass {
     MachineClass parent;
     MPS2TZFPGAType fpga_type;
     uint32_t scc_id;
     const char *armsse_type;
-} MPS2TZMachineClass;
+};
+typedef struct MPS2TZMachineClass MPS2TZMachineClass;
 
-typedef struct {
+struct MPS2TZMachineState {
     MachineState parent;
 
     ARMSSE iotkit;
@@ -99,7 +101,8 @@ typedef struct {
     qemu_or_irq uart_irq_orgate;
     DeviceState *lan9118;
     SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ];
-} MPS2TZMachineState;
+};
+typedef struct MPS2TZMachineState MPS2TZMachineState;
 
 #define TYPE_MPS2TZ_MACHINE "mps2tz"
 #define TYPE_MPS2TZ_AN505_MACHINE MACHINE_TYPE_NAME("mps2-an505")
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 4ca6e1ce12..45db6ec52f 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -44,19 +44,21 @@
 #include "hw/net/lan9118.h"
 #include "net/net.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
+#include "qom/object.h"
 
 typedef enum MPS2FPGAType {
     FPGA_AN385,
     FPGA_AN511,
 } MPS2FPGAType;
 
-typedef struct {
+struct MPS2MachineClass {
     MachineClass parent;
     MPS2FPGAType fpga_type;
     uint32_t scc_id;
-} MPS2MachineClass;
+};
+typedef struct MPS2MachineClass MPS2MachineClass;
 
-typedef struct {
+struct MPS2MachineState {
     MachineState parent;
 
     ARMv7MState armv7m;
@@ -75,7 +77,8 @@ typedef struct {
     /* CMSDK APB subsystem */
     CMSDKAPBDualTimer dualtimer;
     CMSDKAPBWatchdog watchdog;
-} MPS2MachineState;
+};
+typedef struct MPS2MachineState MPS2MachineState;
 
 #define TYPE_MPS2_MACHINE "mps2"
 #define TYPE_MPS2_AN385_MACHINE MACHINE_TYPE_NAME("mps2-an385")
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 8afc118134..9831f90820 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -33,6 +33,7 @@
 #include "hw/misc/tz-ppc.h"
 #include "hw/misc/unimp.h"
 #include "hw/rtc/pl031.h"
+#include "qom/object.h"
 
 #define MUSCA_NUMIRQ_MAX 96
 #define MUSCA_PPC_MAX 3
@@ -45,7 +46,7 @@ typedef enum MuscaType {
     MUSCA_B1,
 } MuscaType;
 
-typedef struct {
+struct MuscaMachineClass {
     MachineClass parent;
     MuscaType type;
     uint32_t init_svtor;
@@ -53,9 +54,10 @@ typedef struct {
     int num_irqs;
     const MPCInfo *mpc_info;
     int num_mpcs;
-} MuscaMachineClass;
+};
+typedef struct MuscaMachineClass MuscaMachineClass;
 
-typedef struct {
+struct MuscaMachineState {
     MachineState parent;
 
     ARMSSE sse;
@@ -81,7 +83,8 @@ typedef struct {
     UnimplementedDeviceState sdio;
     UnimplementedDeviceState gpio;
     UnimplementedDeviceState cryptoisland;
-} MuscaMachineState;
+};
+typedef struct MuscaMachineState MuscaMachineState;
 
 #define TYPE_MUSCA_MACHINE "musca"
 #define TYPE_MUSCA_A_MACHINE MACHINE_TYPE_NAME("musca-a")
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 9decd7abd1..79d202aa50 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -33,6 +33,7 @@
 #include "exec/address-spaces.h"
 #include "ui/pixel_ops.h"
 #include "qemu/cutils.h"
+#include "qom/object.h"
 
 #define MP_MISC_BASE            0x80002000
 #define MP_MISC_SIZE            0x00001000
@@ -153,10 +154,11 @@ typedef struct mv88w8618_rx_desc {
 } mv88w8618_rx_desc;
 
 #define TYPE_MV88W8618_ETH "mv88w8618_eth"
+typedef struct mv88w8618_eth_state mv88w8618_eth_state;
 #define MV88W8618_ETH(obj) \
     OBJECT_CHECK(mv88w8618_eth_state, (obj), TYPE_MV88W8618_ETH)
 
-typedef struct mv88w8618_eth_state {
+struct mv88w8618_eth_state {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -174,7 +176,7 @@ typedef struct mv88w8618_eth_state {
     uint32_t cur_rx[4];
     NICState *nic;
     NICConf conf;
-} mv88w8618_eth_state;
+};
 
 static void eth_rx_desc_put(uint32_t addr, mv88w8618_rx_desc *desc)
 {
@@ -469,10 +471,11 @@ TYPE_INFO(mv88w8618_eth_info)
 #define MP_LCD_TEXTCOLOR        0xe0e0ff /* RRGGBB */
 
 #define TYPE_MUSICPAL_LCD "musicpal_lcd"
+typedef struct musicpal_lcd_state musicpal_lcd_state;
 #define MUSICPAL_LCD(obj) \
     OBJECT_CHECK(musicpal_lcd_state, (obj), TYPE_MUSICPAL_LCD)
 
-typedef struct musicpal_lcd_state {
+struct musicpal_lcd_state {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -485,7 +488,7 @@ typedef struct musicpal_lcd_state {
     uint32_t page_off;
     QemuConsole *con;
     uint8_t video_ram[128*64/8];
-} musicpal_lcd_state;
+};
 
 static uint8_t scale_lcd_color(musicpal_lcd_state *s, uint8_t col)
 {
@@ -687,10 +690,11 @@ TYPE_INFO(musicpal_lcd_info)
 #define MP_PIC_ENABLE_CLR       0x0C
 
 #define TYPE_MV88W8618_PIC "mv88w8618_pic"
+typedef struct mv88w8618_pic_state mv88w8618_pic_state;
 #define MV88W8618_PIC(obj) \
     OBJECT_CHECK(mv88w8618_pic_state, (obj), TYPE_MV88W8618_PIC)
 
-typedef struct mv88w8618_pic_state {
+struct mv88w8618_pic_state {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -699,7 +703,7 @@ typedef struct mv88w8618_pic_state {
     uint32_t level;
     uint32_t enabled;
     qemu_irq parent_irq;
-} mv88w8618_pic_state;
+};
 
 static void mv88w8618_pic_update(mv88w8618_pic_state *s)
 {
@@ -825,17 +829,18 @@ typedef struct mv88w8618_timer_state {
 } mv88w8618_timer_state;
 
 #define TYPE_MV88W8618_PIT "mv88w8618_pit"
+typedef struct mv88w8618_pit_state mv88w8618_pit_state;
 #define MV88W8618_PIT(obj) \
     OBJECT_CHECK(mv88w8618_pit_state, (obj), TYPE_MV88W8618_PIT)
 
-typedef struct mv88w8618_pit_state {
+struct mv88w8618_pit_state {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
 
     MemoryRegion iomem;
     mv88w8618_timer_state timer[4];
-} mv88w8618_pit_state;
+};
 
 static void mv88w8618_timer_tick(void *opaque)
 {
@@ -993,17 +998,18 @@ TYPE_INFO(mv88w8618_pit_info)
 #define MP_FLASHCFG_CFGR0    0x04
 
 #define TYPE_MV88W8618_FLASHCFG "mv88w8618_flashcfg"
+typedef struct mv88w8618_flashcfg_state mv88w8618_flashcfg_state;
 #define MV88W8618_FLASHCFG(obj) \
     OBJECT_CHECK(mv88w8618_flashcfg_state, (obj), TYPE_MV88W8618_FLASHCFG)
 
-typedef struct mv88w8618_flashcfg_state {
+struct mv88w8618_flashcfg_state {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
 
     MemoryRegion iomem;
     uint32_t cfgr0;
-} mv88w8618_flashcfg_state;
+};
 
 static uint64_t mv88w8618_flashcfg_read(void *opaque,
                                         hwaddr offset,
@@ -1080,10 +1086,11 @@ TYPE_INFO(mv88w8618_flashcfg_info)
 
 #define MP_BOARD_REVISION       0x31
 
-typedef struct {
+struct MusicPalMiscState {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
-} MusicPalMiscState;
+};
+typedef struct MusicPalMiscState MusicPalMiscState;
 
 #define TYPE_MUSICPAL_MISC "musicpal-misc"
 #define MUSICPAL_MISC(obj) \
@@ -1193,10 +1200,11 @@ static void mv88w8618_wlan_realize(DeviceState *dev, Error **errp)
 #define MP_OE_LCD_BRIGHTNESS    0x0007
 
 #define TYPE_MUSICPAL_GPIO "musicpal_gpio"
+typedef struct musicpal_gpio_state musicpal_gpio_state;
 #define MUSICPAL_GPIO(obj) \
     OBJECT_CHECK(musicpal_gpio_state, (obj), TYPE_MUSICPAL_GPIO)
 
-typedef struct musicpal_gpio_state {
+struct musicpal_gpio_state {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -1210,7 +1218,7 @@ typedef struct musicpal_gpio_state {
     uint32_t isr;
     qemu_irq irq;
     qemu_irq out[5]; /* 3 brightness out + 2 lcd (data and clock ) */
-} musicpal_gpio_state;
+};
 
 static void musicpal_gpio_brightness_update(musicpal_gpio_state *s) {
     int i;
@@ -1444,10 +1452,11 @@ TYPE_INFO(musicpal_gpio_info)
 #define MP_KEY_BTN_NAVIGATION  (1 << 7)
 
 #define TYPE_MUSICPAL_KEY "musicpal_key"
+typedef struct musicpal_key_state musicpal_key_state;
 #define MUSICPAL_KEY(obj) \
     OBJECT_CHECK(musicpal_key_state, (obj), TYPE_MUSICPAL_KEY)
 
-typedef struct musicpal_key_state {
+struct musicpal_key_state {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -1456,7 +1465,7 @@ typedef struct musicpal_key_state {
     uint32_t kbd_extended;
     uint32_t pressed_keys;
     qemu_irq out[8];
-} musicpal_key_state;
+};
 
 static void musicpal_key_event(void *opaque, int keycode)
 {
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 7980d321ee..70fb1ef59b 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -32,6 +32,7 @@
 #include "exec/address-spaces.h"
 #include "cpu.h"
 #include "qemu/cutils.h"
+#include "qom/object.h"
 
 static uint64_t static_read(void *opaque, hwaddr offset, unsigned size)
 {
@@ -132,12 +133,13 @@ static void palmte_button_event(void *opaque, int keycode)
  */
 
 #define TYPE_PALM_MISC_GPIO "palm-misc-gpio"
+typedef struct PalmMiscGPIOState PalmMiscGPIOState;
 #define PALM_MISC_GPIO(obj) \
     OBJECT_CHECK(PalmMiscGPIOState, (obj), TYPE_PALM_MISC_GPIO)
 
-typedef struct PalmMiscGPIOState {
+struct PalmMiscGPIOState {
     SysBusDevice parent_obj;
-} PalmMiscGPIOState;
+};
 
 static void palmte_onoff_gpios(void *opaque, int line, int level)
 {
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 6bc8ff93d3..3be4a5ea86 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -28,6 +28,7 @@
 #include "sysemu/qtest.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
+#include "qom/object.h"
 
 static struct {
     hwaddr io_base;
@@ -469,11 +470,12 @@ static const VMStateDescription vmstate_pxa2xx_mm = {
 };
 
 #define TYPE_PXA2XX_SSP "pxa2xx-ssp"
+typedef struct PXA2xxSSPState PXA2xxSSPState;
 #define PXA2XX_SSP(obj) \
     OBJECT_CHECK(PXA2xxSSPState, (obj), TYPE_PXA2XX_SSP)
 
 /* Synchronous Serial Ports */
-typedef struct {
+struct PXA2xxSSPState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -495,7 +497,7 @@ typedef struct {
     uint32_t rx_fifo[16];
     uint32_t rx_level;
     uint32_t rx_start;
-} PXA2xxSSPState;
+};
 
 static bool pxa2xx_ssp_vmstate_validate(void *opaque, int version_id)
 {
@@ -809,10 +811,11 @@ static void pxa2xx_ssp_init(Object *obj)
 #define PIAR		0x38	/* RTC Periodic Interrupt Alarm register */
 
 #define TYPE_PXA2XX_RTC "pxa2xx_rtc"
+typedef struct PXA2xxRTCState PXA2xxRTCState;
 #define PXA2XX_RTC(obj) \
     OBJECT_CHECK(PXA2xxRTCState, (obj), TYPE_PXA2XX_RTC)
 
-typedef struct {
+struct PXA2xxRTCState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -843,7 +846,7 @@ typedef struct {
     QEMUTimer *rtc_swal2;
     QEMUTimer *rtc_pi;
     qemu_irq rtc_irq;
-} PXA2xxRTCState;
+};
 
 static inline void pxa2xx_rtc_int_update(PXA2xxRTCState *s)
 {
@@ -1243,14 +1246,15 @@ TYPE_INFO(pxa2xx_rtc_sysbus_info)
 /* I2C Interface */
 
 #define TYPE_PXA2XX_I2C_SLAVE "pxa2xx-i2c-slave"
+typedef struct PXA2xxI2CSlaveState PXA2xxI2CSlaveState;
 #define PXA2XX_I2C_SLAVE(obj) \
     OBJECT_CHECK(PXA2xxI2CSlaveState, (obj), TYPE_PXA2XX_I2C_SLAVE)
 
-typedef struct PXA2xxI2CSlaveState {
+struct PXA2xxI2CSlaveState {
     I2CSlave parent_obj;
 
     PXA2xxI2CState *host;
-} PXA2xxI2CSlaveState;
+};
 
 struct PXA2xxI2CState {
     /*< private >*/
diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
index a0f3592f17..817e7a1de5 100644
--- a/hw/arm/pxa2xx_gpio.c
+++ b/hw/arm/pxa2xx_gpio.c
@@ -17,14 +17,15 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define PXA2XX_GPIO_BANKS	4
 
 #define TYPE_PXA2XX_GPIO "pxa2xx-gpio"
+typedef struct PXA2xxGPIOInfo PXA2xxGPIOInfo;
 #define PXA2XX_GPIO(obj) \
     OBJECT_CHECK(PXA2xxGPIOInfo, (obj), TYPE_PXA2XX_GPIO)
 
-typedef struct PXA2xxGPIOInfo PXA2xxGPIOInfo;
 struct PXA2xxGPIOInfo {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index bfc0dd8df6..34b13f470f 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -16,6 +16,7 @@
 #include "hw/arm/pxa.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 #define ICIP	0x00	/* Interrupt Controller IRQ Pending register */
 #define ICMR	0x04	/* Interrupt Controller Mask register */
@@ -37,10 +38,11 @@
 #define PXA2XX_PIC_SRCS	40
 
 #define TYPE_PXA2XX_PIC "pxa2xx_pic"
+typedef struct PXA2xxPICState PXA2xxPICState;
 #define PXA2XX_PIC(obj) \
     OBJECT_CHECK(PXA2xxPICState, (obj), TYPE_PXA2XX_PIC)
 
-typedef struct {
+struct PXA2xxPICState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -52,7 +54,7 @@ typedef struct {
     uint32_t is_fiq[2];
     uint32_t int_idle;
     uint32_t priority[PXA2XX_PIC_SRCS];
-} PXA2xxPICState;
+};
 
 static void pxa2xx_pic_update(void *opaque)
 {
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index b2d6c9688f..d9f7eeb06b 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -24,6 +24,7 @@
 #include "hw/loader.h"
 #include "hw/arm/boot.h"
 #include "sysemu/sysemu.h"
+#include "qom/object.h"
 
 #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS */
 #define MVBAR_ADDR      0x400 /* secure vectors */
@@ -35,19 +36,21 @@
 /* Registered machine type (matches RPi Foundation bootloader and U-Boot) */
 #define MACH_TYPE_BCM2708   3138
 
-typedef struct RaspiMachineState {
+struct RaspiMachineState {
     /*< private >*/
     MachineState parent_obj;
     /*< public >*/
     BCM283XState soc;
-} RaspiMachineState;
+};
+typedef struct RaspiMachineState RaspiMachineState;
 
-typedef struct RaspiMachineClass {
+struct RaspiMachineClass {
     /*< private >*/
     MachineClass parent_obj;
     /*< public >*/
     uint32_t board_rev;
-} RaspiMachineClass;
+};
+typedef struct RaspiMachineClass RaspiMachineClass;
 
 #define TYPE_RASPI_MACHINE       MACHINE_TYPE_NAME("raspi-common")
 #define RASPI_MACHINE(obj) \
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index e6715ab638..3f01ad40d2 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -41,6 +41,7 @@
 #include "hw/usb.h"
 #include "hw/char/pl011.h"
 #include "net/net.h"
+#include "qom/object.h"
 
 #define RAMLIMIT_GB 8192
 #define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
@@ -83,7 +84,7 @@ typedef struct MemMapEntry {
     hwaddr size;
 } MemMapEntry;
 
-typedef struct {
+struct SBSAMachineState {
     MachineState parent;
     struct arm_boot_info bootinfo;
     int smp_cpus;
@@ -92,7 +93,8 @@ typedef struct {
     int psci_conduit;
     DeviceState *gic;
     PFlashCFI01 *flash[2];
-} SBSAMachineState;
+};
+typedef struct SBSAMachineState SBSAMachineState;
 
 #define TYPE_SBSA_MACHINE   MACHINE_TYPE_NAME("sbsa-ref")
 #define SBSA_MACHINE(obj) \
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 9c762ecedd..ecbe69dd04 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -34,16 +34,18 @@
 #include "migration/vmstate.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
+#include "qom/object.h"
 
 enum spitz_model_e { spitz, akita, borzoi, terrier };
 
-typedef struct {
+struct SpitzMachineClass {
     MachineClass parent;
     enum spitz_model_e model;
     int arm_id;
-} SpitzMachineClass;
+};
+typedef struct SpitzMachineClass SpitzMachineClass;
 
-typedef struct {
+struct SpitzMachineState {
     MachineState parent;
     PXA2xxState *mpu;
     DeviceState *mux;
@@ -53,7 +55,8 @@ typedef struct {
     DeviceState *scp0;
     DeviceState *scp1;
     DeviceState *misc_gpio;
-} SpitzMachineState;
+};
+typedef struct SpitzMachineState SpitzMachineState;
 
 #define TYPE_SPITZ_MACHINE "spitz-common"
 #define SPITZ_MACHINE(obj) \
@@ -85,9 +88,10 @@ typedef struct {
 #define FLASHCTL_NCE            (FLASHCTL_CE0 | FLASHCTL_CE1)
 
 #define TYPE_SL_NAND "sl-nand"
+typedef struct SLNANDState SLNANDState;
 #define SL_NAND(obj) OBJECT_CHECK(SLNANDState, (obj), TYPE_SL_NAND)
 
-typedef struct {
+struct SLNANDState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -96,7 +100,7 @@ typedef struct {
     uint8_t manf_id;
     uint8_t chip_id;
     ECCState ecc;
-} SLNANDState;
+};
 
 static uint64_t sl_read(void *opaque, hwaddr addr, unsigned size)
 {
@@ -261,10 +265,11 @@ static const int spitz_gpiomap[5] = {
 };
 
 #define TYPE_SPITZ_KEYBOARD "spitz-keyboard"
+typedef struct SpitzKeyboardState SpitzKeyboardState;
 #define SPITZ_KEYBOARD(obj) \
     OBJECT_CHECK(SpitzKeyboardState, (obj), TYPE_SPITZ_KEYBOARD)
 
-typedef struct {
+struct SpitzKeyboardState {
     SysBusDevice parent_obj;
 
     qemu_irq sense[SPITZ_KEY_SENSE_NUM];
@@ -280,7 +285,7 @@ typedef struct {
     uint8_t fifo[16];
     int fifopos, fifolen;
     QEMUTimer *kbdtimer;
-} SpitzKeyboardState;
+};
 
 static void spitz_keyboard_sense_update(SpitzKeyboardState *s)
 {
@@ -580,13 +585,14 @@ static void spitz_keyboard_realize(DeviceState *dev, Error **errp)
 #define LCDTG_POLCTRL   0x07
 
 #define TYPE_SPITZ_LCDTG "spitz-lcdtg"
+typedef struct SpitzLCDTG SpitzLCDTG;
 #define SPITZ_LCDTG(obj) OBJECT_CHECK(SpitzLCDTG, (obj), TYPE_SPITZ_LCDTG)
 
-typedef struct {
+struct SpitzLCDTG {
     SSISlave ssidev;
     uint32_t bl_intensity;
     uint32_t bl_power;
-} SpitzLCDTG;
+};
 
 static void spitz_bl_update(SpitzLCDTG *s)
 {
@@ -668,14 +674,15 @@ static void spitz_lcdtg_realize(SSISlave *ssi, Error **errp)
 #define SPITZ_GPIO_TP_INT       11
 
 #define TYPE_CORGI_SSP "corgi-ssp"
+typedef struct CorgiSSPState CorgiSSPState;
 #define CORGI_SSP(obj) OBJECT_CHECK(CorgiSSPState, (obj), TYPE_CORGI_SSP)
 
 /* "Demux" the signal based on current chipselect */
-typedef struct {
+struct CorgiSSPState {
     SSISlave ssidev;
     SSIBus *bus[3];
     uint32_t enable[3];
-} CorgiSSPState;
+};
 
 static uint32_t corgi_ssp_transfer(SSISlave *dev, uint32_t value)
 {
@@ -819,14 +826,15 @@ static void spitz_akita_i2c_setup(PXA2xxState *cpu)
  *  + named GPIO output "adc-temp": the ADC value, to be wired up to the max111x
  */
 #define TYPE_SPITZ_MISC_GPIO "spitz-misc-gpio"
+typedef struct SpitzMiscGPIOState SpitzMiscGPIOState;
 #define SPITZ_MISC_GPIO(obj) \
     OBJECT_CHECK(SpitzMiscGPIOState, (obj), TYPE_SPITZ_MISC_GPIO)
 
-typedef struct SpitzMiscGPIOState {
+struct SpitzMiscGPIOState {
     SysBusDevice parent_obj;
 
     qemu_irq adc_value;
-} SpitzMiscGPIOState;
+};
 
 static void spitz_misc_charging(void *opaque, int n, int level)
 {
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 0bf2be0e27..b52eb69aac 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -27,6 +27,7 @@
 #include "migration/vmstate.h"
 #include "hw/misc/unimp.h"
 #include "cpu.h"
+#include "qom/object.h"
 
 #define GPIO_A 0
 #define GPIO_B 1
@@ -57,10 +58,11 @@ typedef const struct {
 /* General purpose timer module.  */
 
 #define TYPE_STELLARIS_GPTM "stellaris-gptm"
+typedef struct gptm_state gptm_state;
 #define STELLARIS_GPTM(obj) \
     OBJECT_CHECK(gptm_state, (obj), TYPE_STELLARIS_GPTM)
 
-typedef struct gptm_state {
+struct gptm_state {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -80,7 +82,7 @@ typedef struct gptm_state {
     /* The timers have an alternate output used to trigger the ADC.  */
     qemu_irq trigger;
     qemu_irq irq;
-} gptm_state;
+};
 
 static void gptm_update_irq(gptm_state *s)
 {
@@ -719,10 +721,11 @@ static int stellaris_sys_init(uint32_t base, qemu_irq irq,
 /* I2C controller.  */
 
 #define TYPE_STELLARIS_I2C "stellaris-i2c"
+typedef struct stellaris_i2c_state stellaris_i2c_state;
 #define STELLARIS_I2C(obj) \
     OBJECT_CHECK(stellaris_i2c_state, (obj), TYPE_STELLARIS_I2C)
 
-typedef struct {
+struct stellaris_i2c_state {
     SysBusDevice parent_obj;
 
     I2CBus *bus;
@@ -735,7 +738,7 @@ typedef struct {
     uint32_t mimr;
     uint32_t mris;
     uint32_t mcr;
-} stellaris_i2c_state;
+};
 
 #define STELLARIS_I2C_MCS_BUSY    0x01
 #define STELLARIS_I2C_MCS_ERROR   0x02
@@ -932,10 +935,11 @@ static void stellaris_i2c_init(Object *obj)
 #define STELLARIS_ADC_FIFO_FULL     0x1000
 
 #define TYPE_STELLARIS_ADC "stellaris-adc"
+typedef struct StellarisADCState stellaris_adc_state;
 #define STELLARIS_ADC(obj) \
     OBJECT_CHECK(stellaris_adc_state, (obj), TYPE_STELLARIS_ADC)
 
-typedef struct StellarisADCState {
+struct StellarisADCState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -955,7 +959,7 @@ typedef struct StellarisADCState {
     uint32_t ssctl[4];
     uint32_t noise;
     qemu_irq irq[4];
-} stellaris_adc_state;
+};
 
 static uint32_t stellaris_adc_fifo_read(stellaris_adc_state *s, int n)
 {
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 5c1fb66b98..538eaccceb 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -45,6 +45,7 @@
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
+#include "qom/object.h"
 
 //#define DEBUG
 
@@ -84,10 +85,11 @@ static struct {
 /* Interrupt Controller */
 
 #define TYPE_STRONGARM_PIC "strongarm_pic"
+typedef struct StrongARMPICState StrongARMPICState;
 #define STRONGARM_PIC(obj) \
     OBJECT_CHECK(StrongARMPICState, (obj), TYPE_STRONGARM_PIC)
 
-typedef struct StrongARMPICState {
+struct StrongARMPICState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -98,7 +100,7 @@ typedef struct StrongARMPICState {
     uint32_t enabled;
     uint32_t is_fiq;
     uint32_t int_idle;
-} StrongARMPICState;
+};
 
 #define ICIP    0x00
 #define ICMR    0x04
@@ -253,10 +255,11 @@ TYPE_INFO(strongarm_pic_info)
  * f = 32 768 / (RTTR_trim + 1) */
 
 #define TYPE_STRONGARM_RTC "strongarm-rtc"
+typedef struct StrongARMRTCState StrongARMRTCState;
 #define STRONGARM_RTC(obj) \
     OBJECT_CHECK(StrongARMRTCState, (obj), TYPE_STRONGARM_RTC)
 
-typedef struct StrongARMRTCState {
+struct StrongARMRTCState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -269,7 +272,7 @@ typedef struct StrongARMRTCState {
     QEMUTimer *rtc_hz;
     qemu_irq rtc_irq;
     qemu_irq rtc_hz_irq;
-} StrongARMRTCState;
+};
 
 static inline void strongarm_rtc_int_update(StrongARMRTCState *s)
 {
@@ -480,10 +483,10 @@ TYPE_INFO(strongarm_rtc_sysbus_info)
 #define GAFR 0x1c
 
 #define TYPE_STRONGARM_GPIO "strongarm-gpio"
+typedef struct StrongARMGPIOInfo StrongARMGPIOInfo;
 #define STRONGARM_GPIO(obj) \
     OBJECT_CHECK(StrongARMGPIOInfo, (obj), TYPE_STRONGARM_GPIO)
 
-typedef struct StrongARMGPIOInfo StrongARMGPIOInfo;
 struct StrongARMGPIOInfo {
     SysBusDevice busdev;
     MemoryRegion iomem;
@@ -720,10 +723,10 @@ TYPE_INFO(strongarm_gpio_info)
 #define PPFR 0x10
 
 #define TYPE_STRONGARM_PPC "strongarm-ppc"
+typedef struct StrongARMPPCInfo StrongARMPPCInfo;
 #define STRONGARM_PPC(obj) \
     OBJECT_CHECK(StrongARMPPCInfo, (obj), TYPE_STRONGARM_PPC)
 
-typedef struct StrongARMPPCInfo StrongARMPPCInfo;
 struct StrongARMPPCInfo {
     SysBusDevice parent_obj;
 
@@ -922,10 +925,11 @@ TYPE_INFO(strongarm_ppc_info)
 #define RX_FIFO_ROR (1 << 10)
 
 #define TYPE_STRONGARM_UART "strongarm-uart"
+typedef struct StrongARMUARTState StrongARMUARTState;
 #define STRONGARM_UART(obj) \
     OBJECT_CHECK(StrongARMUARTState, (obj), TYPE_STRONGARM_UART)
 
-typedef struct StrongARMUARTState {
+struct StrongARMUARTState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -949,7 +953,7 @@ typedef struct StrongARMUARTState {
     bool wait_break_end;
     QEMUTimer *rx_timeout_timer;
     QEMUTimer *tx_timer;
-} StrongARMUARTState;
+};
 
 static void strongarm_uart_update_status(StrongARMUARTState *s)
 {
@@ -1354,10 +1358,11 @@ TYPE_INFO(strongarm_uart_info)
 /* Synchronous Serial Ports */
 
 #define TYPE_STRONGARM_SSP "strongarm-ssp"
+typedef struct StrongARMSSPState StrongARMSSPState;
 #define STRONGARM_SSP(obj) \
     OBJECT_CHECK(StrongARMSSPState, (obj), TYPE_STRONGARM_SSP)
 
-typedef struct StrongARMSSPState {
+struct StrongARMSSPState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -1370,7 +1375,7 @@ typedef struct StrongARMSSPState {
     uint16_t rx_fifo[8];
     uint8_t rx_level;
     uint8_t rx_start;
-} StrongARMSSPState;
+};
 
 #define SSCR0 0x60 /* SSP Control register 0 */
 #define SSCR1 0x64 /* SSP Control register 1 */
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 86a1a21adf..da48f4ddcd 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -25,6 +25,7 @@
 #include "hw/ssi/ssi.h"
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
+#include "qom/object.h"
 
 #define TOSA_RAM 0x04000000
 #define TOSA_ROM 0x00800000
@@ -74,12 +75,13 @@ static void tosa_microdrive_attach(PXA2xxState *cpu)
  */
 
 #define TYPE_TOSA_MISC_GPIO "tosa-misc-gpio"
+typedef struct TosaMiscGPIOState TosaMiscGPIOState;
 #define TOSA_MISC_GPIO(obj) \
     OBJECT_CHECK(TosaMiscGPIOState, (obj), TYPE_TOSA_MISC_GPIO)
 
-typedef struct TosaMiscGPIOState {
+struct TosaMiscGPIOState {
     SysBusDevice parent_obj;
-} TosaMiscGPIOState;
+};
 
 static void tosa_gpio_leds(void *opaque, int line, int level)
 {
@@ -170,14 +172,15 @@ static void tosa_ssp_realize(SSISlave *dev, Error **errp)
 }
 
 #define TYPE_TOSA_DAC "tosa_dac"
+typedef struct TosaDACState TosaDACState;
 #define TOSA_DAC(obj) OBJECT_CHECK(TosaDACState, (obj), TYPE_TOSA_DAC)
 
-typedef struct {
+struct TosaDACState {
     I2CSlave parent_obj;
 
     int len;
     char buf[3];
-} TosaDACState;
+};
 
 static int tosa_dac_send(I2CSlave *i2c, uint8_t data)
 {
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 0ba9e8c708..ef6b4c8a24 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -37,8 +37,10 @@
 #include "hw/cpu/a9mpcore.h"
 #include "hw/qdev-clock.h"
 #include "sysemu/reset.h"
+#include "qom/object.h"
 
 #define TYPE_ZYNQ_MACHINE MACHINE_TYPE_NAME("xilinx-zynq-a9")
+typedef struct ZynqMachineState ZynqMachineState;
 #define ZYNQ_MACHINE(obj) \
     OBJECT_CHECK(ZynqMachineState, (obj), TYPE_ZYNQ_MACHINE)
 
@@ -84,10 +86,10 @@ static const int dma_irqs[8] = {
     0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16)), /* movt r1 ... */ \
     0xe5801000 + (addr)
 
-typedef struct ZynqMachineState {
+struct ZynqMachineState {
     MachineState parent;
     Clock *ps_clk;
-} ZynqMachineState;
+};
 
 static void zynq_write_board_setup(ARMCPU *cpu,
                                    const struct arm_boot_info *info)
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index f55295a816..505960d836 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -22,12 +22,14 @@
 #include "cpu.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/xlnx-versal.h"
+#include "qom/object.h"
 
 #define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
+typedef struct VersalVirt VersalVirt;
 #define XLNX_VERSAL_VIRT_MACHINE(obj) \
     OBJECT_CHECK(VersalVirt, (obj), TYPE_XLNX_VERSAL_VIRT_MACHINE)
 
-typedef struct VersalVirt {
+struct VersalVirt {
     MachineState parent_obj;
 
     Versal soc;
@@ -45,7 +47,7 @@ typedef struct VersalVirt {
     struct {
         bool secure;
     } cfg;
-} VersalVirt;
+};
 
 static void fdt_create(VersalVirt *s)
 {
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 6d1f38a99c..3e32c57274 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -24,8 +24,9 @@
 #include "qemu/log.h"
 #include "sysemu/qtest.h"
 #include "sysemu/device_tree.h"
+#include "qom/object.h"
 
-typedef struct XlnxZCU102 {
+struct XlnxZCU102 {
     MachineState parent_obj;
 
     XlnxZynqMPState soc;
@@ -34,7 +35,8 @@ typedef struct XlnxZCU102 {
     bool virt;
 
     struct arm_boot_info binfo;
-} XlnxZCU102;
+};
+typedef struct XlnxZCU102 XlnxZCU102;
 
 #define TYPE_ZCU102_MACHINE   MACHINE_TYPE_NAME("xlnx-zcu102")
 #define ZCU102_MACHINE(obj) \
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 9a9bbc653b..9c69481269 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -26,6 +26,7 @@
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
 #include "cpu.h"
+#include "qom/object.h"
 
 #ifdef DEBUG_Z2
 #define DPRINTF(fmt, ...) \
@@ -102,14 +103,15 @@ static struct arm_boot_info z2_binfo = {
 #define Z2_GPIO_KEY_ON      1
 #define Z2_GPIO_LCD_CS      88
 
-typedef struct {
+struct ZipitLCD {
     SSISlave ssidev;
     int32_t selected;
     int32_t enabled;
     uint8_t buf[3];
     uint32_t cur_reg;
     int pos;
-} ZipitLCD;
+};
+typedef struct ZipitLCD ZipitLCD;
 
 #define TYPE_ZIPIT_LCD "zipit-lcd"
 #define ZIPIT_LCD(obj) OBJECT_CHECK(ZipitLCD, (obj), TYPE_ZIPIT_LCD)
@@ -195,14 +197,15 @@ static const TypeInfo zipit_lcd_info = {
 };
 
 #define TYPE_AER915 "aer915"
+typedef struct AER915State AER915State;
 #define AER915(obj) OBJECT_CHECK(AER915State, (obj), TYPE_AER915)
 
-typedef struct AER915State {
+struct AER915State {
     I2CSlave parent_obj;
 
     int len;
     uint8_t buf[3];
-} AER915State;
+};
 
 static int aer915_send(I2CSlave *i2c, uint8_t data)
 {
diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 96683b188c..2b48c43738 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -25,6 +25,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "sysemu/dma.h"
+#include "qom/object.h"
 
 enum {
     AC97_Reset                     = 0x00,
@@ -126,6 +127,7 @@ enum {
 #define MUTE_SHIFT 15
 
 #define TYPE_AC97 "AC97"
+typedef struct AC97LinkState AC97LinkState;
 #define AC97(obj) \
     OBJECT_CHECK(AC97LinkState, (obj), TYPE_AC97)
 
@@ -158,7 +160,7 @@ typedef struct AC97BusMasterRegs {
     BD bd;
 } AC97BusMasterRegs;
 
-typedef struct AC97LinkState {
+struct AC97LinkState {
     PCIDevice dev;
     QEMUSoundCard card;
     uint32_t glob_cnt;
@@ -175,7 +177,7 @@ typedef struct AC97LinkState {
     int bup_flag;
     MemoryRegion io_nam;
     MemoryRegion io_nabm;
-} AC97LinkState;
+};
 
 enum {
     BUP_SET = 1,
diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index 671f99a2e1..081a2265d0 100644
--- a/hw/audio/adlib.c
+++ b/hw/audio/adlib.c
@@ -29,6 +29,7 @@
 #include "audio/audio.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 //#define DEBUG
 
@@ -51,9 +52,10 @@
 #define SHIFT 1
 
 #define TYPE_ADLIB "adlib"
+typedef struct AdlibState AdlibState;
 #define ADLIB(obj) OBJECT_CHECK(AdlibState, (obj), TYPE_ADLIB)
 
-typedef struct {
+struct AdlibState {
     ISADevice parent_obj;
 
     QEMUSoundCard card;
@@ -73,7 +75,7 @@ typedef struct {
     QEMUAudioTimeStamp ats;
     FM_OPL *opl;
     PortioList port_list;
-} AdlibState;
+};
 
 static void adlib_stop_opl_timer (AdlibState *s, size_t n)
 {
diff --git a/hw/audio/cs4231.c b/hw/audio/cs4231.c
index 2f8f75845e..d645f9455f 100644
--- a/hw/audio/cs4231.c
+++ b/hw/audio/cs4231.c
@@ -27,6 +27,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qom/object.h"
 
 /*
  * In addition to Crystal CS4231 there is a DMA controller on Sparc.
@@ -37,17 +38,18 @@
 #define CS_MAXDREG (CS_DREGS - 1)
 
 #define TYPE_CS4231 "SUNW,CS4231"
+typedef struct CSState CSState;
 #define CS4231(obj) \
     OBJECT_CHECK(CSState, (obj), TYPE_CS4231)
 
-typedef struct CSState {
+struct CSState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
     qemu_irq irq;
     uint32_t regs[CS_REGS];
     uint8_t dregs[CS_DREGS];
-} CSState;
+};
 
 #define CS_RAP(s) ((s)->regs[0] & CS_MAXDREG)
 #define CS_VER 0xa0
diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index 176a96ffb3..53b2012c16 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -32,6 +32,7 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 
 /*
   Missing features:
@@ -62,9 +63,10 @@ static struct {
 #define CS_DREGS 32
 
 #define TYPE_CS4231A "cs4231a"
+typedef struct CSState CSState;
 #define CS4231A(obj) OBJECT_CHECK (CSState, (obj), TYPE_CS4231A)
 
-typedef struct CSState {
+struct CSState {
     ISADevice dev;
     QEMUSoundCard card;
     MemoryRegion ioports;
@@ -82,7 +84,7 @@ typedef struct CSState {
     int aci_counter;
     SWVoiceOut *voice;
     int16_t *tab;
-} CSState;
+};
 
 #define MODE2 (1 << 6)
 #define MCE (1 << 6)
diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 8c924946bd..b2497fee88 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -33,6 +33,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "sysemu/dma.h"
+#include "qom/object.h"
 
 /* Missing stuff:
    SCTRL_P[12](END|ST)INC
@@ -263,7 +264,7 @@ struct chan {
     uint32_t frame_cnt;
 };
 
-typedef struct ES1370State {
+struct ES1370State {
     PCIDevice dev;
     QEMUSoundCard card;
     MemoryRegion io;
@@ -276,7 +277,8 @@ typedef struct ES1370State {
     uint32_t mempage;
     uint32_t codec;
     uint32_t sctl;
-} ES1370State;
+};
+typedef struct ES1370State ES1370State;
 
 struct chan_bits {
     uint32_t ctl_en;
diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index 3f2733d168..b3d35bb9d6 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -33,6 +33,7 @@
 #include "migration/vmstate.h"
 #include "gusemu.h"
 #include "gustate.h"
+#include "qom/object.h"
 
 #define dolog(...) AUD_log ("audio", __VA_ARGS__)
 #ifdef DEBUG
@@ -42,9 +43,10 @@
 #endif
 
 #define TYPE_GUS "gus"
+typedef struct GUSState GUSState;
 #define GUS(obj) OBJECT_CHECK (GUSState, (obj), TYPE_GUS)
 
-typedef struct GUSState {
+struct GUSState {
     ISADevice dev;
     GUSEmuState emu;
     QEMUSoundCard card;
@@ -60,7 +62,7 @@ typedef struct GUSState {
     IsaDma *isa_dma;
     PortioList portio_list1;
     PortioList portio_list2;
-} GUSState;
+};
 
 static uint32_t gus_readb(void *opaque, uint32_t nport)
 {
diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index b6ea5b3b75..ce6ccee6a0 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -26,6 +26,7 @@
 #include "intel-hda-defs.h"
 #include "audio/audio.h"
 #include "trace.h"
+#include "qom/object.h"
 
 /* -------------------------------------------------------------------------- */
 
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index ceae0b33af..4bce3ab8bf 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -32,6 +32,7 @@
 #include "intel-hda-defs.h"
 #include "sysemu/dma.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 
 /* --------------------------------------------------------------------- */
 /* hda bus                                                               */
diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index 1dcee64ef0..6c13075e99 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -19,6 +19,7 @@
 #include "audio/audio.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define MP_AUDIO_SIZE           0x00001000
 
@@ -42,10 +43,11 @@
 #define MP_AUDIO_CLOCK_24MHZ    (1 << 9)
 #define MP_AUDIO_MONO           (1 << 14)
 
+typedef struct mv88w8618_audio_state mv88w8618_audio_state;
 #define MV88W8618_AUDIO(obj) \
     OBJECT_CHECK(mv88w8618_audio_state, (obj), TYPE_MV88W8618_AUDIO)
 
-typedef struct mv88w8618_audio_state {
+struct mv88w8618_audio_state {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -60,7 +62,7 @@ typedef struct mv88w8618_audio_state {
     uint32_t last_free;
     uint32_t clock_div;
     void *wm;
-} mv88w8618_audio_state;
+};
 
 static void mv88w8618_audio_callback(void *opaque, int free_out, int free_in)
 {
diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c
index 051dc3bfad..94b17f10cc 100644
--- a/hw/audio/milkymist-ac97.c
+++ b/hw/audio/milkymist-ac97.c
@@ -29,6 +29,7 @@
 #include "audio/audio.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 enum {
     R_AC97_CTRL = 0,
@@ -55,6 +56,7 @@ enum {
 };
 
 #define TYPE_MILKYMIST_AC97 "milkymist-ac97"
+typedef struct MilkymistAC97State MilkymistAC97State;
 #define MILKYMIST_AC97(obj) \
     OBJECT_CHECK(MilkymistAC97State, (obj), TYPE_MILKYMIST_AC97)
 
@@ -74,7 +76,6 @@ struct MilkymistAC97State {
     qemu_irq dmar_irq;
     qemu_irq dmaw_irq;
 };
-typedef struct MilkymistAC97State MilkymistAC97State;
 
 static void update_voices(MilkymistAC97State *s)
 {
diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index ed7730fc18..5467a6b69c 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -33,15 +33,17 @@
 #include "migration/vmstate.h"
 #include "hw/audio/pcspk.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 
 #define PCSPK_BUF_LEN 1792
 #define PCSPK_SAMPLE_RATE 32000
 #define PCSPK_MAX_FREQ (PCSPK_SAMPLE_RATE >> 1)
 #define PCSPK_MIN_COUNT DIV_ROUND_UP(PIT_FREQ, PCSPK_MAX_FREQ)
 
+typedef struct PCSpkState PCSpkState;
 #define PC_SPEAKER(obj) OBJECT_CHECK(PCSpkState, (obj), TYPE_PC_SPEAKER)
 
-typedef struct {
+struct PCSpkState {
     ISADevice parent_obj;
 
     MemoryRegion ioport;
@@ -56,7 +58,7 @@ typedef struct {
     uint8_t data_on;
     uint8_t dummy_refresh_clock;
     bool migrate;
-} PCSpkState;
+};
 
 static const char *s_spk = "pcspk";
 static PCSpkState *pcspk_state;
diff --git a/hw/audio/pl041.c b/hw/audio/pl041.c
index 96748cb15a..b99c151cf9 100644
--- a/hw/audio/pl041.c
+++ b/hw/audio/pl041.c
@@ -30,6 +30,7 @@
 #include "pl041.h"
 #include "lm4549.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 #if 0
 #define PL041_DEBUG_LEVEL 1
@@ -77,9 +78,10 @@ typedef struct {
 } pl041_channel;
 
 #define TYPE_PL041 "pl041"
+typedef struct PL041State PL041State;
 #define PL041(obj) OBJECT_CHECK(PL041State, (obj), TYPE_PL041)
 
-typedef struct PL041State {
+struct PL041State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -90,7 +92,7 @@ typedef struct PL041State {
     pl041_regfile regs;
     pl041_channel fifo1;
     lm4549_state codec;
-} PL041State;
+};
 
 
 static const unsigned char pl041_default_id[8] = {
diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 79984de7b9..5b09ee30c0 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -34,6 +34,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 
 #define dolog(...) AUD_log ("sb16", __VA_ARGS__)
 
@@ -49,9 +50,10 @@
 static const char e3[] = "COPYRIGHT (C) CREATIVE TECHNOLOGY LTD, 1992.";
 
 #define TYPE_SB16 "sb16"
+typedef struct SB16State SB16State;
 #define SB16(obj) OBJECT_CHECK (SB16State, (obj), TYPE_SB16)
 
-typedef struct SB16State {
+struct SB16State {
     ISADevice parent_obj;
 
     QEMUSoundCard card;
@@ -112,7 +114,7 @@ typedef struct SB16State {
     int mixer_nreg;
     uint8_t mixer_regs[256];
     PortioList portio_list;
-} SB16State;
+};
 
 static void SB_audio_callback (void *opaque, int free);
 
diff --git a/hw/audio/wm8750.c b/hw/audio/wm8750.c
index d867442d29..c2396fc206 100644
--- a/hw/audio/wm8750.c
+++ b/hw/audio/wm8750.c
@@ -13,6 +13,7 @@
 #include "qemu/module.h"
 #include "hw/audio/wm8750.h"
 #include "audio/audio.h"
+#include "qom/object.h"
 
 #define IN_PORT_N	3
 #define OUT_PORT_N	3
@@ -26,9 +27,10 @@ typedef struct {
     int dac_hz;
 } WMRate;
 
+typedef struct WM8750State WM8750State;
 #define WM8750(obj) OBJECT_CHECK(WM8750State, (obj), TYPE_WM8750)
 
-typedef struct WM8750State {
+struct WM8750State {
     I2CSlave parent_obj;
 
     uint8_t i2c_data[2];
@@ -54,7 +56,7 @@ typedef struct WM8750State {
     const WMRate *rate;
     uint8_t rate_vmstate;
     int adc_hz, dac_hz, ext_adc_hz, ext_dac_hz, master;
-} WM8750State;
+};
 
 /* pow(10.0, -i / 20.0) * 255, i = 0..42 */
 static const uint8_t wm8750_vol_db_table[] = {
diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
index 65093ab6fd..c24183c07f 100644
--- a/hw/avr/arduino.c
+++ b/hw/avr/arduino.c
@@ -15,21 +15,24 @@
 #include "hw/boards.h"
 #include "atmega.h"
 #include "boot.h"
+#include "qom/object.h"
 
-typedef struct ArduinoMachineState {
+struct ArduinoMachineState {
     /*< private >*/
     MachineState parent_obj;
     /*< public >*/
     AtmegaMcuState mcu;
-} ArduinoMachineState;
+};
+typedef struct ArduinoMachineState ArduinoMachineState;
 
-typedef struct ArduinoMachineClass {
+struct ArduinoMachineClass {
     /*< private >*/
     MachineClass parent_class;
     /*< public >*/
     const char *mcu_type;
     uint64_t xtal_hz;
-} ArduinoMachineClass;
+};
+typedef struct ArduinoMachineClass ArduinoMachineClass;
 
 #define TYPE_ARDUINO_MACHINE \
         MACHINE_TYPE_NAME("arduino")
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index 7131224431..c3b8e05110 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -17,6 +17,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 #include "hw/boards.h" /* FIXME memory_region_allocate_system_memory for sram */
 #include "hw/misc/unimp.h"
 #include "atmega.h"
@@ -45,7 +46,7 @@ typedef struct {
     bool is_timer16;
 } peripheral_cfg;
 
-typedef struct AtmegaMcuClass {
+struct AtmegaMcuClass {
     /*< private >*/
     SysBusDeviceClass parent_class;
     /*< public >*/
@@ -59,7 +60,8 @@ typedef struct AtmegaMcuClass {
     size_t adc_count;
     const uint8_t *irq;
     const peripheral_cfg *dev;
-} AtmegaMcuClass;
+};
+typedef struct AtmegaMcuClass AtmegaMcuClass;
 
 #define ATMEGA_MCU_CLASS(klass) \
     OBJECT_CLASS_CHECK(AtmegaMcuClass, (klass), TYPE_ATMEGA_MCU)
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 5e7013a752..f4bb0251dd 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -46,6 +46,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qom/object.h"
 
 /********************************************************/
 /* debug Floppy devices */
@@ -64,16 +65,17 @@
 /* qdev floppy bus                                      */
 
 #define TYPE_FLOPPY_BUS "floppy-bus"
+typedef struct FloppyBus FloppyBus;
 #define FLOPPY_BUS(obj) OBJECT_CHECK(FloppyBus, (obj), TYPE_FLOPPY_BUS)
 
 typedef struct FDCtrl FDCtrl;
 typedef struct FDrive FDrive;
 static FDrive *get_drv(FDCtrl *fdctrl, int unit);
 
-typedef struct FloppyBus {
+struct FloppyBus {
     BusState bus;
     FDCtrl *fdc;
-} FloppyBus;
+};
 
 static const TypeInfo floppy_bus_info = {
     .name = TYPE_FLOPPY_BUS,
@@ -495,15 +497,16 @@ static const BlockDevOps fd_block_ops = {
 
 
 #define TYPE_FLOPPY_DRIVE "floppy"
+typedef struct FloppyDrive FloppyDrive;
 #define FLOPPY_DRIVE(obj) \
      OBJECT_CHECK(FloppyDrive, (obj), TYPE_FLOPPY_DRIVE)
 
-typedef struct FloppyDrive {
+struct FloppyDrive {
     DeviceState     qdev;
     uint32_t        unit;
     BlockConf       conf;
     FloppyDriveType type;
-} FloppyDrive;
+};
 
 static Property floppy_drive_properties[] = {
     DEFINE_PROP_UINT32("unit", FloppyDrive, unit, -1),
@@ -888,19 +891,21 @@ static FloppyDriveType get_fallback_drive_type(FDrive *drv)
 }
 
 #define TYPE_SYSBUS_FDC "base-sysbus-fdc"
+typedef struct FDCtrlSysBus FDCtrlSysBus;
 #define SYSBUS_FDC(obj) OBJECT_CHECK(FDCtrlSysBus, (obj), TYPE_SYSBUS_FDC)
 
-typedef struct FDCtrlSysBus {
+struct FDCtrlSysBus {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
 
     struct FDCtrl state;
-} FDCtrlSysBus;
+};
 
+typedef struct FDCtrlISABus FDCtrlISABus;
 #define ISA_FDC(obj) OBJECT_CHECK(FDCtrlISABus, (obj), TYPE_ISA_FDC)
 
-typedef struct FDCtrlISABus {
+struct FDCtrlISABus {
     ISADevice parent_obj;
 
     uint32_t iobase;
@@ -909,7 +914,7 @@ typedef struct FDCtrlISABus {
     struct FDCtrl state;
     int32_t bootindexA;
     int32_t bootindexB;
-} FDCtrlISABus;
+};
 
 static uint32_t fdctrl_read (void *opaque, uint32_t reg)
 {
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 7f9492eee6..43b8eae529 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -33,6 +33,7 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "trace.h"
+#include "qom/object.h"
 
 /* Fields for FlashPartInfo->flags */
 
@@ -411,7 +412,7 @@ typedef enum {
 
 #define M25P80_INTERNAL_DATA_BUFFER_SZ 16
 
-typedef struct Flash {
+struct Flash {
     SSISlave parent_obj;
 
     BlockBackend *blk;
@@ -451,12 +452,14 @@ typedef struct Flash {
 
     const FlashPartInfo *pi;
 
-} Flash;
+};
+typedef struct Flash Flash;
 
-typedef struct M25P80Class {
+struct M25P80Class {
     SSISlaveClass parent_class;
     FlashPartInfo *pi;
-} M25P80Class;
+};
+typedef struct M25P80Class M25P80Class;
 
 #define TYPE_M25P80 "m25p80-generic"
 #define M25P80(obj) \
diff --git a/hw/block/nand.c b/hw/block/nand.c
index 991a6e13e8..e409d3d752 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -27,6 +27,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 # define NAND_CMD_READ0		0x00
 # define NAND_CMD_READ1		0x01
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index d2c4e140e9..39d9cf74f3 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -31,6 +31,7 @@
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 /* 11 for 2kB-page OneNAND ("2nd generation") and 10 for 1kB-page chips */
 #define PAGE_SHIFT	11
@@ -39,9 +40,10 @@
 #define BLOCK_SHIFT	(PAGE_SHIFT + 6)
 
 #define TYPE_ONE_NAND "onenand"
+typedef struct OneNANDState OneNANDState;
 #define ONE_NAND(obj) OBJECT_CHECK(OneNANDState, (obj), TYPE_ONE_NAND)
 
-typedef struct OneNANDState {
+struct OneNANDState {
     SysBusDevice parent_obj;
 
     struct {
@@ -85,7 +87,7 @@ typedef struct OneNANDState {
     int secs_cur;
     int blocks;
     uint8_t *blockwp;
-} OneNANDState;
+};
 
 enum {
     ONEN_BUF_BLOCK = 0,
diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index 7c29b9cbcf..62cad0636b 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -30,8 +30,10 @@
 #include "chardev/char-fe.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 #define TYPE_ISA_DEBUGCON_DEVICE "isa-debugcon"
+typedef struct ISADebugconState ISADebugconState;
 #define ISA_DEBUGCON_DEVICE(obj) \
      OBJECT_CHECK(ISADebugconState, (obj), TYPE_ISA_DEBUGCON_DEVICE)
 
@@ -43,12 +45,12 @@ typedef struct DebugconState {
     uint32_t readback;
 } DebugconState;
 
-typedef struct ISADebugconState {
+struct ISADebugconState {
     ISADevice parent_obj;
 
     uint32_t iobase;
     DebugconState state;
-} ISADebugconState;
+};
 
 static void debugcon_ioport_write(void *opaque, hwaddr addr, uint64_t val,
                                   unsigned width)
diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
index 5b70c85b9b..f2fbe4aab3 100644
--- a/hw/char/etraxfs_ser.c
+++ b/hw/char/etraxfs_ser.c
@@ -29,6 +29,7 @@
 #include "chardev/char-fe.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define D(x)
 
@@ -49,10 +50,11 @@
 #define STAT_TR_RDY  24
 
 #define TYPE_ETRAX_FS_SERIAL "etraxfs,serial"
+typedef struct ETRAXSerial ETRAXSerial;
 #define ETRAX_SERIAL(obj) \
     OBJECT_CHECK(ETRAXSerial, (obj), TYPE_ETRAX_FS_SERIAL)
 
-typedef struct ETRAXSerial {
+struct ETRAXSerial {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
@@ -67,7 +69,7 @@ typedef struct ETRAXSerial {
 
     /* Control registers.  */
     uint32_t regs[R_MAX];
-} ETRAXSerial;
+};
 
 static void ser_update_irq(ETRAXSerial *s)
 {
diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index a59826a3df..dadd50853f 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -34,6 +34,7 @@
 #include "hw/qdev-properties.h"
 
 #include "trace.h"
+#include "qom/object.h"
 
 /*
  *  Offsets for UART registers relative to SFR base address
@@ -138,10 +139,11 @@ typedef struct {
 } Exynos4210UartFIFO;
 
 #define TYPE_EXYNOS4210_UART "exynos4210.uart"
+typedef struct Exynos4210UartState Exynos4210UartState;
 #define EXYNOS4210_UART(obj) \
     OBJECT_CHECK(Exynos4210UartState, (obj), TYPE_EXYNOS4210_UART)
 
-typedef struct Exynos4210UartState {
+struct Exynos4210UartState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -159,7 +161,7 @@ typedef struct Exynos4210UartState {
 
     uint32_t channel;
 
-} Exynos4210UartState;
+};
 
 
 /* Used only for tracing */
diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index 581111ce75..9d5ad8b0b1 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -31,6 +31,7 @@
 #include "chardev/char-fe.h"
 
 #include "trace.h"
+#include "qom/object.h"
 
 #define UART_REG_SIZE 20     /* Size of memory mapped registers */
 
@@ -72,10 +73,11 @@
 
 #define FIFO_LENGTH 1024
 
+typedef struct UART UART;
 #define GRLIB_APB_UART(obj) \
     OBJECT_CHECK(UART, (obj), TYPE_GRLIB_APB_UART)
 
-typedef struct UART {
+struct UART {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -91,7 +93,7 @@ typedef struct UART {
     char buffer[FIFO_LENGTH];
     int  len;
     int  current;
-} UART;
+};
 
 static int uart_data_to_read(UART *uart)
 {
diff --git a/hw/char/ipoctal232.c b/hw/char/ipoctal232.c
index b94ebf2791..4077608114 100644
--- a/hw/char/ipoctal232.c
+++ b/hw/char/ipoctal232.c
@@ -16,6 +16,7 @@
 #include "qemu/bitops.h"
 #include "qemu/module.h"
 #include "chardev/char-fe.h"
+#include "qom/object.h"
 
 /* #define DEBUG_IPOCTAL */
 
diff --git a/hw/char/lm32_juart.c b/hw/char/lm32_juart.c
index bd4a778d38..22d072d4cc 100644
--- a/hw/char/lm32_juart.c
+++ b/hw/char/lm32_juart.c
@@ -26,6 +26,7 @@
 
 #include "hw/char/lm32_juart.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 enum {
     LM32_JUART_MIN_SAVE_VERSION = 0,
@@ -41,6 +42,7 @@ enum {
     JRX_FULL = (1<<8),
 };
 
+typedef struct LM32JuartState LM32JuartState;
 #define LM32_JUART(obj) OBJECT_CHECK(LM32JuartState, (obj), TYPE_LM32_JUART)
 
 struct LM32JuartState {
@@ -51,7 +53,6 @@ struct LM32JuartState {
     uint32_t jtx;
     uint32_t jrx;
 };
-typedef struct LM32JuartState LM32JuartState;
 
 uint32_t lm32_juart_get_jtx(DeviceState *d)
 {
diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
index 266808790f..0c66976e80 100644
--- a/hw/char/lm32_uart.c
+++ b/hw/char/lm32_uart.c
@@ -31,6 +31,7 @@
 #include "chardev/char-fe.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 enum {
     R_RXTX = 0,
@@ -94,6 +95,7 @@ enum {
 };
 
 #define TYPE_LM32_UART "lm32-uart"
+typedef struct LM32UartState LM32UartState;
 #define LM32_UART(obj) OBJECT_CHECK(LM32UartState, (obj), TYPE_LM32_UART)
 
 struct LM32UartState {
@@ -105,7 +107,6 @@ struct LM32UartState {
 
     uint32_t regs[R_MAX];
 };
-typedef struct LM32UartState LM32UartState;
 
 static void uart_update_irq(LM32UartState *s)
 {
diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
index ec41736980..d6c43105ec 100644
--- a/hw/char/mcf_uart.c
+++ b/hw/char/mcf_uart.c
@@ -14,8 +14,9 @@
 #include "hw/m68k/mcf.h"
 #include "hw/qdev-properties.h"
 #include "chardev/char-fe.h"
+#include "qom/object.h"
 
-typedef struct {
+struct mcf_uart_state {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -33,7 +34,8 @@ typedef struct {
     int rx_enabled;
     qemu_irq irq;
     CharBackend chr;
-} mcf_uart_state;
+};
+typedef struct mcf_uart_state mcf_uart_state;
 
 #define TYPE_MCF_UART "mcf-uart"
 #define MCF_UART(obj) OBJECT_CHECK(mcf_uart_state, (obj), TYPE_MCF_UART)
diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c
index d3cb7c9140..f148240e43 100644
--- a/hw/char/milkymist-uart.c
+++ b/hw/char/milkymist-uart.c
@@ -30,6 +30,7 @@
 #include "chardev/char-fe.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 enum {
     R_RXTX = 0,
@@ -57,6 +58,7 @@ enum {
 };
 
 #define TYPE_MILKYMIST_UART "milkymist-uart"
+typedef struct MilkymistUartState MilkymistUartState;
 #define MILKYMIST_UART(obj) \
     OBJECT_CHECK(MilkymistUartState, (obj), TYPE_MILKYMIST_UART)
 
@@ -69,7 +71,6 @@ struct MilkymistUartState {
 
     uint32_t regs[R_MAX];
 };
-typedef struct MilkymistUartState MilkymistUartState;
 
 static void uart_update_irq(MilkymistUartState *s)
 {
diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index 8f09384066..bf4708e277 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -37,6 +37,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
+#include "qom/object.h"
 
 //#define DEBUG_PARALLEL
 
@@ -92,17 +93,18 @@ typedef struct ParallelState {
 } ParallelState;
 
 #define TYPE_ISA_PARALLEL "isa-parallel"
+typedef struct ISAParallelState ISAParallelState;
 #define ISA_PARALLEL(obj) \
     OBJECT_CHECK(ISAParallelState, (obj), TYPE_ISA_PARALLEL)
 
-typedef struct ISAParallelState {
+struct ISAParallelState {
     ISADevice parent_obj;
 
     uint32_t index;
     uint32_t iobase;
     uint32_t isairq;
     ParallelState state;
-} ISAParallelState;
+};
 
 static void parallel_update_irq(ParallelState *s)
 {
diff --git a/hw/char/sclpconsole-lm.c b/hw/char/sclpconsole-lm.c
index 0a277b8c37..6ea976eabc 100644
--- a/hw/char/sclpconsole-lm.c
+++ b/hw/char/sclpconsole-lm.c
@@ -24,6 +24,7 @@
 #include "hw/s390x/event-facility.h"
 #include "hw/qdev-properties.h"
 #include "hw/s390x/ebcdic.h"
+#include "qom/object.h"
 
 #define SIZE_BUFFER 4096
 #define NEWLINE     "\n"
@@ -37,14 +38,15 @@ typedef struct OprtnsCommand {
 /* max size for line-mode data in 4K SCCB page */
 #define SIZE_CONSOLE_BUFFER (SCCB_DATA_LEN - sizeof(OprtnsCommand))
 
-typedef struct SCLPConsoleLM {
+struct SCLPConsoleLM {
     SCLPEvent event;
     CharBackend chr;
     bool echo;                  /* immediate echo of input if true        */
     uint32_t write_errors;      /* errors writing to char layer           */
     uint32_t length;            /* length of byte stream in buffer        */
     uint8_t buf[SIZE_CONSOLE_BUFFER];
-} SCLPConsoleLM;
+};
+typedef struct SCLPConsoleLM SCLPConsoleLM;
 
 #define TYPE_SCLPLM_CONSOLE "sclplmconsole"
 #define SCLPLM_CONSOLE(obj) \
diff --git a/hw/char/sclpconsole.c b/hw/char/sclpconsole.c
index 2e960973e2..4c58773f89 100644
--- a/hw/char/sclpconsole.c
+++ b/hw/char/sclpconsole.c
@@ -22,6 +22,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/s390x/event-facility.h"
 #include "chardev/char-fe.h"
+#include "qom/object.h"
 
 typedef struct ASCIIConsoleData {
     EventBufferHeader ebh;
@@ -31,7 +32,7 @@ typedef struct ASCIIConsoleData {
 /* max size for ASCII data in 4K SCCB page */
 #define SIZE_BUFFER_VT220 4080
 
-typedef struct SCLPConsole {
+struct SCLPConsole {
     SCLPEvent event;
     CharBackend chr;
     uint8_t iov[SIZE_BUFFER_VT220];
@@ -40,7 +41,8 @@ typedef struct SCLPConsole {
     uint32_t iov_data_len;  /* length of byte stream in buffer             */
     uint32_t iov_sclp_rest; /* length of byte stream not read via SCLP     */
     bool notify;            /* qemu_notify_event() req'd if true           */
-} SCLPConsole;
+};
+typedef struct SCLPConsole SCLPConsole;
 
 #define TYPE_SCLP_CONSOLE "sclpconsole"
 #define SCLP_CONSOLE(obj) \
diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index 35a1ee3a30..2b4e8006da 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -32,17 +32,19 @@
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
+typedef struct ISASerialState ISASerialState;
 #define ISA_SERIAL(obj) OBJECT_CHECK(ISASerialState, (obj), TYPE_ISA_SERIAL)
 
-typedef struct ISASerialState {
+struct ISASerialState {
     ISADevice parent_obj;
 
     uint32_t index;
     uint32_t iobase;
     uint32_t isairq;
     SerialState state;
-} ISASerialState;
+};
 
 static const int isa_serial_io[MAX_ISA_SERIAL_PORTS] = {
     0x3f8, 0x2f8, 0x3e8, 0x2e8
diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 02264f8b73..de4b3b2584 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -33,12 +33,14 @@
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
-typedef struct PCISerialState {
+struct PCISerialState {
     PCIDevice dev;
     SerialState state;
     uint8_t prog_if;
-} PCISerialState;
+};
+typedef struct PCISerialState PCISerialState;
 
 #define TYPE_PCI_SERIAL "pci-serial"
 #define PCI_SERIAL(s) OBJECT_CHECK(PCISerialState, (s), TYPE_PCI_SERIAL)
diff --git a/hw/char/spapr_vty.c b/hw/char/spapr_vty.c
index 236dc2194a..79b68d0c77 100644
--- a/hw/char/spapr_vty.c
+++ b/hw/char/spapr_vty.c
@@ -8,15 +8,17 @@
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_vio.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 #define VTERM_BUFSIZE   16
 
-typedef struct SpaprVioVty {
+struct SpaprVioVty {
     SpaprVioDevice sdev;
     CharBackend chardev;
     uint32_t in, out;
     uint8_t buf[VTERM_BUFSIZE];
-} SpaprVioVty;
+};
+typedef struct SpaprVioVty SpaprVioVty;
 
 #define TYPE_VIO_SPAPR_VTY_DEVICE "spapr-vty"
 #define VIO_SPAPR_VTY_DEVICE(obj) \
diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
index 6ba6052ac9..aa151bc1c3 100644
--- a/hw/char/terminal3270.c
+++ b/hw/char/terminal3270.c
@@ -17,6 +17,7 @@
 #include "chardev/char-fe.h"
 #include "hw/qdev-properties.h"
 #include "hw/s390x/3270-ccw.h"
+#include "qom/object.h"
 
 /* Enough spaces for different window sizes. */
 #define INPUT_BUFFER_SIZE  1000
@@ -26,7 +27,7 @@
  */
 #define OUTPUT_BUFFER_SIZE 2051
 
-typedef struct Terminal3270 {
+struct Terminal3270 {
     EmulatedCcw3270Device cdev;
     CharBackend chr;
     uint8_t inv[INPUT_BUFFER_SIZE];
@@ -34,7 +35,8 @@ typedef struct Terminal3270 {
     int in_len;
     bool handshake_done;
     guint timer_tag;
-} Terminal3270;
+};
+typedef struct Terminal3270 Terminal3270;
 
 #define TYPE_TERMINAL_3270 "x-terminal3270"
 #define TERMINAL_3270(obj) \
diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
index 0ac862df15..9a8c74d5c2 100644
--- a/hw/char/virtio-console.c
+++ b/hw/char/virtio-console.c
@@ -19,17 +19,19 @@
 #include "hw/virtio/virtio-serial.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-char.h"
+#include "qom/object.h"
 
 #define TYPE_VIRTIO_CONSOLE_SERIAL_PORT "virtserialport"
+typedef struct VirtConsole VirtConsole;
 #define VIRTIO_CONSOLE(obj) \
     OBJECT_CHECK(VirtConsole, (obj), TYPE_VIRTIO_CONSOLE_SERIAL_PORT)
 
-typedef struct VirtConsole {
+struct VirtConsole {
     VirtIOSerialPort parent_obj;
 
     CharBackend chr;
     guint watch;
-} VirtConsole;
+};
 
 /*
  * Callback function that's called from chardevs when backend becomes
diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index aad3fbc31e..14ba0707a2 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -29,6 +29,7 @@
 #include "hw/sysbus.h"
 #include "qemu/module.h"
 #include "chardev/char-fe.h"
+#include "qom/object.h"
 
 #define DUART(x)
 
@@ -52,10 +53,11 @@
 #define CONTROL_IE        0x10
 
 #define TYPE_XILINX_UARTLITE "xlnx.xps-uartlite"
+typedef struct XilinxUARTLite XilinxUARTLite;
 #define XILINX_UARTLITE(obj) \
     OBJECT_CHECK(XilinxUARTLite, (obj), TYPE_XILINX_UARTLITE)
 
-typedef struct XilinxUARTLite {
+struct XilinxUARTLite {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
@@ -67,7 +69,7 @@ typedef struct XilinxUARTLite {
     unsigned int rx_fifo_len;
 
     uint32_t regs[R_MAX];
-} XilinxUARTLite;
+};
 
 static void uart_update_irq(XilinxUARTLite *s)
 {
diff --git a/hw/cpu/realview_mpcore.c b/hw/cpu/realview_mpcore.c
index 0ae3019045..386a7b1f58 100644
--- a/hw/cpu/realview_mpcore.c
+++ b/hw/cpu/realview_mpcore.c
@@ -15,15 +15,17 @@
 #include "hw/intc/realview_gic.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 #define TYPE_REALVIEW_MPCORE_RIRQ "realview_mpcore"
+typedef struct mpcore_rirq_state mpcore_rirq_state;
 #define REALVIEW_MPCORE_RIRQ(obj) \
     OBJECT_CHECK(mpcore_rirq_state, (obj), TYPE_REALVIEW_MPCORE_RIRQ)
 
 /* Dummy PIC to route IRQ lines.  The baseboard has 4 independent IRQ
    controllers.  The output of these, plus some of the raw input lines
    are fed into a single SMP-aware interrupt controller on the CPU.  */
-typedef struct {
+struct mpcore_rirq_state {
     SysBusDevice parent_obj;
 
     qemu_irq cpuic[32];
@@ -32,7 +34,7 @@ typedef struct {
 
     ARM11MPCorePriveState priv;
     RealViewGICState gic[4];
-} mpcore_rirq_state;
+};
 
 /* Map baseboard IRQs onto CPU IRQ lines.  */
 static const int mpcore_irq_map[32] = {
diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
index 94bb9db052..9118438f32 100644
--- a/hw/display/ads7846.c
+++ b/hw/display/ads7846.c
@@ -16,8 +16,9 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "ui/console.h"
+#include "qom/object.h"
 
-typedef struct {
+struct ADS7846State {
     SSISlave ssidev;
     qemu_irq interrupt;
 
@@ -27,7 +28,8 @@ typedef struct {
 
     int cycle;
     int output;
-} ADS7846State;
+};
+typedef struct ADS7846State ADS7846State;
 
 #define TYPE_ADS7846 "ads7846"
 #define ADS7846(obj) OBJECT_CHECK(ADS7846State, (obj), TYPE_ADS7846)
diff --git a/hw/display/artist.c b/hw/display/artist.c
index 2e1b793a86..2e8272665b 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -22,8 +22,10 @@
 #include "ui/console.h"
 #include "trace.h"
 #include "framebuffer.h"
+#include "qom/object.h"
 
 #define TYPE_ARTIST "artist"
+typedef struct ARTISTState ARTISTState;
 #define ARTIST(obj) OBJECT_CHECK(ARTISTState, (obj), TYPE_ARTIST)
 
 #ifdef HOST_WORDS_BIGENDIAN
@@ -40,7 +42,7 @@ struct vram_buffer {
     int height;
 };
 
-typedef struct ARTISTState {
+struct ARTISTState {
     SysBusDevice parent_obj;
 
     QemuConsole *con;
@@ -103,7 +105,7 @@ typedef struct ARTISTState {
     uint32_t font_write_pos_y;
 
     int draw_line_pattern;
-} ARTISTState;
+};
 
 typedef enum {
     ARTIST_BUFFER_AP = 1,
diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 86869778ed..10f0ad01d2 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -18,6 +18,7 @@
 
 #include "ui/console.h"
 #include "ui/qemu-pixman.h"
+#include "qom/object.h"
 
 typedef struct BochsDisplayMode {
     pixman_format_code_t format;
@@ -29,7 +30,7 @@ typedef struct BochsDisplayMode {
     uint64_t             size;
 } BochsDisplayMode;
 
-typedef struct BochsDisplayState {
+struct BochsDisplayState {
     /* parent */
     PCIDevice        pci;
 
@@ -53,7 +54,8 @@ typedef struct BochsDisplayState {
 
     /* device state */
     BochsDisplayMode mode;
-} BochsDisplayState;
+};
+typedef struct BochsDisplayState BochsDisplayState;
 
 #define TYPE_BOCHS_DISPLAY "bochs-display"
 #define BOCHS_DISPLAY(obj) OBJECT_CHECK(BochsDisplayState, (obj), \
diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index 0e7e260ccf..12185f89ee 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -36,6 +36,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qom/object.h"
 
 /* Change to 1 to enable debugging */
 #define DEBUG_CG3 0
@@ -65,9 +66,10 @@
 #define CG3_VRAM_OFFSET 0x800000
 
 #define TYPE_CG3 "cgthree"
+typedef struct CG3State CG3State;
 #define CG3(obj) OBJECT_CHECK(CG3State, (obj), TYPE_CG3)
 
-typedef struct CG3State {
+struct CG3State {
     SysBusDevice parent_obj;
 
     QemuConsole *con;
@@ -82,7 +84,7 @@ typedef struct CG3State {
     uint8_t r[256], g[256], b[256];
     uint16_t width, height, depth;
     uint8_t dac_index, dac_state;
-} CG3State;
+};
 
 static void cg3_update_display(void *opaque)
 {
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index fe4d8a4fb8..055ffa2082 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -44,6 +44,7 @@
 #include "migration/vmstate.h"
 #include "ui/pixel_ops.h"
 #include "cirrus_vga_internal.h"
+#include "qom/object.h"
 
 /*
  * TODO:
@@ -178,10 +179,11 @@ typedef void (*cirrus_fill_t)(struct CirrusVGAState *s,
                               uint32_t dstaddr, int dst_pitch,
                               int width, int height);
 
-typedef struct PCICirrusVGAState {
+struct PCICirrusVGAState {
     PCIDevice dev;
     CirrusVGAState cirrus_vga;
-} PCICirrusVGAState;
+};
+typedef struct PCICirrusVGAState PCICirrusVGAState;
 
 #define TYPE_PCI_CIRRUS_VGA "cirrus-vga"
 #define PCI_CIRRUS_VGA(obj) \
diff --git a/hw/display/cirrus_vga_isa.c b/hw/display/cirrus_vga_isa.c
index 4d0e54b0f2..9c59593c7c 100644
--- a/hw/display/cirrus_vga_isa.c
+++ b/hw/display/cirrus_vga_isa.c
@@ -30,16 +30,18 @@
 #include "hw/qdev-properties.h"
 #include "hw/isa/isa.h"
 #include "cirrus_vga_internal.h"
+#include "qom/object.h"
 
 #define TYPE_ISA_CIRRUS_VGA "isa-cirrus-vga"
+typedef struct ISACirrusVGAState ISACirrusVGAState;
 #define ISA_CIRRUS_VGA(obj) \
     OBJECT_CHECK(ISACirrusVGAState, (obj), TYPE_ISA_CIRRUS_VGA)
 
-typedef struct ISACirrusVGAState {
+struct ISACirrusVGAState {
     ISADevice parent_obj;
 
     CirrusVGAState cirrus_vga;
-} ISACirrusVGAState;
+};
 
 static void isa_cirrus_vga_realizefn(DeviceState *dev, Error **errp)
 {
diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index bfd7f4fc6f..e280e61cc9 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -32,6 +32,7 @@
 #include "qemu/bswap.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
+#include "qom/object.h"
 
 /* Debug messages configuration */
 #define EXYNOS4210_FIMD_DEBUG              0
@@ -293,10 +294,11 @@ struct Exynos4210fimdWindow {
 };
 
 #define TYPE_EXYNOS4210_FIMD "exynos4210.fimd"
+typedef struct Exynos4210fimdState Exynos4210fimdState;
 #define EXYNOS4210_FIMD(obj) \
     OBJECT_CHECK(Exynos4210fimdState, (obj), TYPE_EXYNOS4210_FIMD)
 
-typedef struct {
+struct Exynos4210fimdState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -325,7 +327,7 @@ typedef struct {
     uint8_t *ifb;           /* Internal frame buffer */
     bool invalidate;        /* Image needs to be redrawn */
     bool enabled;           /* Display controller is enabled */
-} Exynos4210fimdState;
+};
 
 /* Perform byte/halfword/word swap of data according to WINCON */
 static inline void fimd_swap_data(unsigned int swap_ctl, uint64_t *data)
diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index 33f2822445..2158240dde 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -29,6 +29,7 @@
 #include "trace.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 typedef struct G364State {
     /* hardware */
@@ -486,13 +487,14 @@ static void g364fb_init(DeviceState *dev, G364State *s)
 }
 
 #define TYPE_G364 "sysbus-g364"
+typedef struct G364SysBusState G364SysBusState;
 #define G364(obj) OBJECT_CHECK(G364SysBusState, (obj), TYPE_G364)
 
-typedef struct {
+struct G364SysBusState {
     SysBusDevice parent_obj;
 
     G364State g364;
-} G364SysBusState;
+};
 
 static void g364fb_sysbus_realize(DeviceState *dev, Error **errp)
 {
diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
index 1b1002e14a..66f6a59a26 100644
--- a/hw/display/jazz_led.c
+++ b/hw/display/jazz_led.c
@@ -29,22 +29,24 @@
 #include "trace.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 typedef enum {
     REDRAW_NONE = 0, REDRAW_SEGMENTS = 1, REDRAW_BACKGROUND = 2,
 } screen_state_t;
 
 #define TYPE_JAZZ_LED "jazz-led"
+typedef struct LedState LedState;
 #define JAZZ_LED(obj) OBJECT_CHECK(LedState, (obj), TYPE_JAZZ_LED)
 
-typedef struct LedState {
+struct LedState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
     uint8_t segments;
     QemuConsole *con;
     screen_state_t state;
-} LedState;
+};
 
 static uint64_t jazz_led_read(void *opaque, hwaddr addr,
                               unsigned int size)
diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
index 495b6c960f..53f5707c9c 100644
--- a/hw/display/milkymist-tmu2.c
+++ b/hw/display/milkymist-tmu2.c
@@ -38,6 +38,7 @@
 #include <X11/Xlib.h>
 #include <epoxy/gl.h>
 #include <epoxy/glx.h>
+#include "qom/object.h"
 
 enum {
     R_CTL = 0,
@@ -82,6 +83,7 @@ struct vertex {
 } QEMU_PACKED;
 
 #define TYPE_MILKYMIST_TMU2 "milkymist-tmu2"
+typedef struct MilkymistTMU2State MilkymistTMU2State;
 #define MILKYMIST_TMU2(obj) \
     OBJECT_CHECK(MilkymistTMU2State, (obj), TYPE_MILKYMIST_TMU2)
 
@@ -98,7 +100,6 @@ struct MilkymistTMU2State {
     GLXFBConfig glx_fb_config;
     GLXContext glx_context;
 };
-typedef struct MilkymistTMU2State MilkymistTMU2State;
 
 static const int glx_fbconfig_attr[] = {
     GLX_GREEN_SIZE, 5,
diff --git a/hw/display/milkymist-vgafb.c b/hw/display/milkymist-vgafb.c
index 634bf4571a..54cdc612a4 100644
--- a/hw/display/milkymist-vgafb.c
+++ b/hw/display/milkymist-vgafb.c
@@ -32,6 +32,7 @@
 #include "ui/pixel_ops.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define BITS 8
 #include "migration/vmstate.h"
@@ -68,6 +69,7 @@ enum {
 };
 
 #define TYPE_MILKYMIST_VGAFB "milkymist-vgafb"
+typedef struct MilkymistVgafbState MilkymistVgafbState;
 #define MILKYMIST_VGAFB(obj) \
     OBJECT_CHECK(MilkymistVgafbState, (obj), TYPE_MILKYMIST_VGAFB)
 
@@ -84,7 +86,6 @@ struct MilkymistVgafbState {
 
     uint32_t regs[R_MAX];
 };
-typedef struct MilkymistVgafbState MilkymistVgafbState;
 
 static int vgafb_enabled(MilkymistVgafbState *s)
 {
diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
index 7839643757..aef7058c76 100644
--- a/hw/display/next-fb.c
+++ b/hw/display/next-fb.c
@@ -30,7 +30,9 @@
 #include "framebuffer.h"
 #include "ui/pixel_ops.h"
 #include "hw/m68k/next-cube.h"
+#include "qom/object.h"
 
+typedef struct NeXTFbState NeXTFbState;
 #define NEXTFB(obj) OBJECT_CHECK(NeXTFbState, (obj), TYPE_NEXTFB)
 
 struct NeXTFbState {
@@ -44,7 +46,6 @@ struct NeXTFbState {
     uint32_t rows;
     int invalidate;
 };
-typedef struct NeXTFbState NeXTFbState;
 
 static void nextfb_draw_line(void *opaque, uint8_t *d, const uint8_t *s,
                              int width, int pitch)
diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index 0a65733a23..e91de8a2f0 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -17,6 +17,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define PL110_CR_EN   0x001
 #define PL110_CR_BGR  0x100
@@ -48,9 +49,10 @@ enum pl110_version
 };
 
 #define TYPE_PL110 "pl110"
+typedef struct PL110State PL110State;
 #define PL110(obj) OBJECT_CHECK(PL110State, (obj), TYPE_PL110)
 
-typedef struct PL110State {
+struct PL110State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -73,7 +75,7 @@ typedef struct PL110State {
     uint32_t palette[256];
     uint32_t raw_palette[128];
     qemu_irq irq;
-} PL110State;
+};
 
 static int vmstate_pl110_post_load(void *opaque, int version_id);
 
diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
index 28e25acc96..b15fc7e580 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -5,14 +5,16 @@
 #include "hw/qdev-properties.h"
 #include "hw/display/ramfb.h"
 #include "ui/console.h"
+#include "qom/object.h"
 
+typedef struct RAMFBStandaloneState RAMFBStandaloneState;
 #define RAMFB(obj) OBJECT_CHECK(RAMFBStandaloneState, (obj), TYPE_RAMFB_DEVICE)
 
-typedef struct RAMFBStandaloneState {
+struct RAMFBStandaloneState {
     SysBusDevice parent_obj;
     QemuConsole *con;
     RAMFBState *state;
-} RAMFBStandaloneState;
+};
 
 static void display_update_wrapper(void *dev)
 {
diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
index 7d0a97da6c..636bf66c1d 100644
--- a/hw/display/sii9022.c
+++ b/hw/display/sii9022.c
@@ -19,6 +19,7 @@
 #include "migration/vmstate.h"
 #include "hw/display/i2c-ddc.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define SII9022_SYS_CTRL_DATA 0x1a
 #define SII9022_SYS_CTRL_PWR_DWN 0x10
@@ -35,16 +36,17 @@
 #define SII9022_INT_STATUS_PLUGGED 0x04;
 
 #define TYPE_SII9022 "sii9022"
+typedef struct sii9022_state sii9022_state;
 #define SII9022(obj) OBJECT_CHECK(sii9022_state, (obj), TYPE_SII9022)
 
-typedef struct sii9022_state {
+struct sii9022_state {
     I2CSlave parent_obj;
     uint8_t ptr;
     bool addr_byte;
     bool ddc_req;
     bool ddc_skip_finish;
     bool ddc;
-} sii9022_state;
+};
 
 static const VMStateDescription vmstate_sii9022 = {
     .name = "sii9022",
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 626f7393a0..7e456c4a0a 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -40,6 +40,7 @@
 #include "ui/pixel_ops.h"
 #include "qemu/bswap.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define MMIO_BASE_OFFSET 0x3e00000
 #define MMIO_SIZE 0x200000
@@ -1931,10 +1932,11 @@ static const VMStateDescription vmstate_sm501_state = {
 };
 
 #define TYPE_SYSBUS_SM501 "sysbus-sm501"
+typedef struct SM501SysBusState SM501SysBusState;
 #define SYSBUS_SM501(obj) \
     OBJECT_CHECK(SM501SysBusState, (obj), TYPE_SYSBUS_SM501)
 
-typedef struct {
+struct SM501SysBusState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -1942,7 +1944,7 @@ typedef struct {
     uint32_t vram_size;
     uint32_t base;
     SerialMM serial;
-} SM501SysBusState;
+};
 
 static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
 {
@@ -2035,15 +2037,16 @@ static const TypeInfo sm501_sysbus_info = {
 TYPE_INFO(sm501_sysbus_info)
 
 #define TYPE_PCI_SM501 "sm501"
+typedef struct SM501PCIState SM501PCIState;
 #define PCI_SM501(obj) OBJECT_CHECK(SM501PCIState, (obj), TYPE_PCI_SM501)
 
-typedef struct {
+struct SM501PCIState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
     SM501State state;
     uint32_t vram_size;
-} SM501PCIState;
+};
 
 static void sm501_realize_pci(PCIDevice *dev, Error **errp)
 {
diff --git a/hw/display/ssd0303.c b/hw/display/ssd0303.c
index 24e7fc1598..87f5b909ce 100644
--- a/hw/display/ssd0303.c
+++ b/hw/display/ssd0303.c
@@ -16,6 +16,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "ui/console.h"
+#include "qom/object.h"
 
 //#define DEBUG_SSD0303 1
 
@@ -46,9 +47,10 @@ enum ssd0303_cmd {
 };
 
 #define TYPE_SSD0303 "ssd0303"
+typedef struct ssd0303_state ssd0303_state;
 #define SSD0303(obj) OBJECT_CHECK(ssd0303_state, (obj), TYPE_SSD0303)
 
-typedef struct {
+struct ssd0303_state {
     I2CSlave parent_obj;
 
     QemuConsole *con;
@@ -63,7 +65,7 @@ typedef struct {
     enum ssd0303_mode mode;
     enum ssd0303_cmd cmd_state;
     uint8_t framebuffer[132*8];
-} ssd0303_state;
+};
 
 static uint8_t ssd0303_recv(I2CSlave *i2c)
 {
diff --git a/hw/display/ssd0323.c b/hw/display/ssd0323.c
index 056cc0b094..4818a3f648 100644
--- a/hw/display/ssd0323.c
+++ b/hw/display/ssd0323.c
@@ -16,6 +16,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "ui/console.h"
+#include "qom/object.h"
 
 //#define DEBUG_SSD0323 1
 
@@ -47,7 +48,7 @@ enum ssd0323_mode
     SSD0323_DATA
 };
 
-typedef struct {
+struct ssd0323_state {
     SSISlave ssidev;
     QemuConsole *con;
 
@@ -64,7 +65,8 @@ typedef struct {
     int32_t remap;
     uint32_t mode;
     uint8_t framebuffer[128 * 80 / 2];
-} ssd0323_state;
+};
+typedef struct ssd0323_state ssd0323_state;
 
 #define TYPE_SSD0323 "ssd0323"
 #define SSD0323(obj) OBJECT_CHECK(ssd0323_state, (obj), TYPE_SSD0323)
diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index 0d05421868..029bb2e4e9 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -33,6 +33,7 @@
 #include "migration/vmstate.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define TCX_ROM_FILE "QEMU,tcx.bin"
 #define FCODE_MAX_ROM_SIZE 0x10000
@@ -55,9 +56,10 @@
 #define TCX_THC_CURSBITS 0x980
 
 #define TYPE_TCX "SUNW,tcx"
+typedef struct TCXState TCXState;
 #define TCX(obj) OBJECT_CHECK(TCXState, (obj), TYPE_TCX)
 
-typedef struct TCXState {
+struct TCXState {
     SysBusDevice parent_obj;
 
     QemuConsole *con;
@@ -93,7 +95,7 @@ typedef struct TCXState {
     uint32_t cursbits[32];
     uint16_t cursx;
     uint16_t cursy;
-} TCXState;
+};
 
 static void tcx_set_dirty(TCXState *s, ram_addr_t addr, int len)
 {
diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 1561f702b9..896cd4c611 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -32,17 +32,19 @@
 #include "qemu/timer.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 #define TYPE_ISA_VGA "isa-vga"
+typedef struct ISAVGAState ISAVGAState;
 #define ISA_VGA(obj) OBJECT_CHECK(ISAVGAState, (obj), TYPE_ISA_VGA)
 
-typedef struct ISAVGAState {
+struct ISAVGAState {
     ISADevice parent_obj;
 
     struct VGACommonState state;
     PortioList portio_vga;
     PortioList portio_vbe;
-} ISAVGAState;
+};
 
 static void vga_isa_reset(DeviceState *dev)
 {
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 5e8ddc9ac5..092e99787e 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -34,6 +34,7 @@
 #include "qemu/timer.h"
 #include "hw/loader.h"
 #include "hw/display/edid.h"
+#include "qom/object.h"
 
 enum vga_pci_flags {
     PCI_VGA_FLAG_ENABLE_MMIO = 1,
@@ -41,7 +42,7 @@ enum vga_pci_flags {
     PCI_VGA_FLAG_ENABLE_EDID = 3,
 };
 
-typedef struct PCIVGAState {
+struct PCIVGAState {
     PCIDevice dev;
     VGACommonState vga;
     uint32_t flags;
@@ -49,7 +50,8 @@ typedef struct PCIVGAState {
     MemoryRegion mmio;
     MemoryRegion mrs[4];
     uint8_t edid[256];
-} PCIVGAState;
+};
+typedef struct PCIVGAState PCIVGAState;
 
 #define TYPE_PCI_VGA "pci-vga"
 #define PCI_VGA(obj) OBJECT_CHECK(PCIVGAState, (obj), TYPE_PCI_VGA)
diff --git a/hw/display/vhost-user-gpu-pci.c b/hw/display/vhost-user-gpu-pci.c
index 23ce655e0f..678b762bbb 100644
--- a/hw/display/vhost-user-gpu-pci.c
+++ b/hw/display/vhost-user-gpu-pci.c
@@ -11,16 +11,18 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/virtio/virtio-gpu-pci.h"
+#include "qom/object.h"
 
 #define TYPE_VHOST_USER_GPU_PCI "vhost-user-gpu-pci"
+typedef struct VhostUserGPUPCI VhostUserGPUPCI;
 #define VHOST_USER_GPU_PCI(obj)                                     \
     OBJECT_CHECK(VhostUserGPUPCI, (obj), TYPE_VHOST_USER_GPU_PCI)
 
-typedef struct VhostUserGPUPCI {
+struct VhostUserGPUPCI {
     VirtIOGPUPCIBase parent_obj;
 
     VhostUserGPU vdev;
-} VhostUserGPUPCI;
+};
 
 static void vhost_user_gpu_pci_initfn(Object *obj)
 {
diff --git a/hw/display/vhost-user-vga.c b/hw/display/vhost-user-vga.c
index 1690f6b610..2cc9616bea 100644
--- a/hw/display/vhost-user-vga.c
+++ b/hw/display/vhost-user-vga.c
@@ -11,17 +11,19 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "virtio-vga.h"
+#include "qom/object.h"
 
 #define TYPE_VHOST_USER_VGA "vhost-user-vga"
 
+typedef struct VhostUserVGA VhostUserVGA;
 #define VHOST_USER_VGA(obj)                                \
     OBJECT_CHECK(VhostUserVGA, (obj), TYPE_VHOST_USER_VGA)
 
-typedef struct VhostUserVGA {
+struct VhostUserVGA {
     VirtIOVGABase parent_obj;
 
     VhostUserGPU vdev;
-} VhostUserVGA;
+};
 
 static void vhost_user_vga_inst_initfn(Object *obj)
 {
diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index 8a71ee4f7e..949ec88e12 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -19,6 +19,7 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-gpu-pci.h"
+#include "qom/object.h"
 
 static Property virtio_gpu_pci_base_properties[] = {
     DEFINE_VIRTIO_GPU_PCI_PROPERTIES(VirtIOPCIProxy),
@@ -66,13 +67,14 @@ static const TypeInfo virtio_gpu_pci_base_info = {
 TYPE_INFO(virtio_gpu_pci_base_info)
 
 #define TYPE_VIRTIO_GPU_PCI "virtio-gpu-pci"
+typedef struct VirtIOGPUPCI VirtIOGPUPCI;
 #define VIRTIO_GPU_PCI(obj)                                 \
     OBJECT_CHECK(VirtIOGPUPCI, (obj), TYPE_VIRTIO_GPU_PCI)
 
-typedef struct VirtIOGPUPCI {
+struct VirtIOGPUPCI {
     VirtIOGPUPCIBase parent_obj;
     VirtIOGPU vdev;
-} VirtIOGPUPCI;
+};
 
 static void virtio_gpu_initfn(Object *obj)
 {
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index e1342c2ea1..66fafce541 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -5,6 +5,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "virtio-vga.h"
+#include "qom/object.h"
 
 static void virtio_vga_base_invalidate_display(void *opaque)
 {
@@ -203,14 +204,15 @@ TYPE_INFO(virtio_vga_base_info)
 
 #define TYPE_VIRTIO_VGA "virtio-vga"
 
+typedef struct VirtIOVGA VirtIOVGA;
 #define VIRTIO_VGA(obj)                             \
     OBJECT_CHECK(VirtIOVGA, (obj), TYPE_VIRTIO_VGA)
 
-typedef struct VirtIOVGA {
+struct VirtIOVGA {
     VirtIOVGABase parent_obj;
 
     VirtIOGPU     vdev;
-} VirtIOVGA;
+};
 
 static void virtio_vga_inst_initfn(Object *obj)
 {
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 487d29f5c0..ac6d6b2b68 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -33,6 +33,7 @@
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 #undef VERBOSE
 #define HW_RECT_ACCEL
diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index 6c433137a0..da9e6c99a7 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -29,8 +29,10 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "hw/dma/i8257.h"
+#include "qom/object.h"
 
 #define TYPE_I82374 "i82374"
+typedef struct I82374State I82374State;
 #define I82374(obj) OBJECT_CHECK(I82374State, (obj), TYPE_I82374)
 
 //#define DEBUG_I82374
@@ -45,13 +47,13 @@ do {} while (0)
 #define BADF(fmt, ...) \
 do { fprintf(stderr, "i82374 ERROR: " fmt , ## __VA_ARGS__); } while (0)
 
-typedef struct I82374State {
+struct I82374State {
     ISADevice parent_obj;
 
     uint32_t iobase;
     uint8_t commands[8];
     PortioList port_list;
-} I82374State;
+};
 
 static const VMStateDescription vmstate_i82374 = {
     .name = "i82374",
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 3288f31678..6724a989dc 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -26,6 +26,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #ifndef PL330_ERR_DEBUG
 #define PL330_ERR_DEBUG 0
diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c
index 225aa5146f..eb5c3de582 100644
--- a/hw/dma/puv3_dma.c
+++ b/hw/dma/puv3_dma.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #undef DEBUG_PUV3
 #include "hw/unicore32/puv3.h"
@@ -22,14 +23,15 @@
 #define PUV3_DMA_CH(offset)     ((offset) >> 8)
 
 #define TYPE_PUV3_DMA "puv3_dma"
+typedef struct PUV3DMAState PUV3DMAState;
 #define PUV3_DMA(obj) OBJECT_CHECK(PUV3DMAState, (obj), TYPE_PUV3_DMA)
 
-typedef struct PUV3DMAState {
+struct PUV3DMAState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
     uint32_t reg_CFG[PUV3_DMA_CH_NR];
-} PUV3DMAState;
+};
 
 static uint64_t puv3_dma_read(void *opaque, hwaddr offset,
         unsigned size)
diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
index b2f1f1b236..c81a2fbe72 100644
--- a/hw/dma/pxa2xx_dma.c
+++ b/hw/dma/pxa2xx_dma.c
@@ -18,6 +18,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define PXA255_DMA_NUM_CHANNELS 16
 #define PXA27X_DMA_NUM_CHANNELS 32
@@ -34,9 +35,10 @@ typedef struct {
 } PXA2xxDMAChannel;
 
 #define TYPE_PXA2XX_DMA "pxa2xx-dma"
+typedef struct PXA2xxDMAState PXA2xxDMAState;
 #define PXA2XX_DMA(obj) OBJECT_CHECK(PXA2xxDMAState, (obj), TYPE_PXA2XX_DMA)
 
-typedef struct PXA2xxDMAState {
+struct PXA2xxDMAState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -58,7 +60,7 @@ typedef struct PXA2xxDMAState {
 
     /* Flag to avoid recursive DMA invocations.  */
     int running;
-} PXA2xxDMAState;
+};
 
 #define DCSR0	0x0000	/* DMA Control / Status register for Channel 0 */
 #define DCSR31	0x007c	/* DMA Control / Status register for Channel 31 */
diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index ccbda2ce82..b686a2ea33 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -34,6 +34,7 @@
 #include "qemu/module.h"
 #include "exec/address-spaces.h"
 #include "trace.h"
+#include "qom/object.h"
 
 /********************************************************/
 /* rc4030 emulation                                     */
@@ -55,12 +56,13 @@ typedef struct dma_pagetable_entry {
 #define DMA_FLAG_ADDR_INTR  0x0400
 
 #define TYPE_RC4030 "rc4030"
+typedef struct rc4030State rc4030State;
 #define RC4030(obj) \
     OBJECT_CHECK(rc4030State, (obj), TYPE_RC4030)
 
 #define TYPE_RC4030_IOMMU_MEMORY_REGION "rc4030-iommu-memory-region"
 
-typedef struct rc4030State {
+struct rc4030State {
 
     SysBusDevice parent;
 
@@ -101,7 +103,7 @@ typedef struct rc4030State {
 
     MemoryRegion iomem_chipset;
     MemoryRegion iomem_jazzio;
-} rc4030State;
+};
 
 static void set_next_tick(rc4030State *s)
 {
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 4c5c0c994b..39c8a49493 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -35,6 +35,7 @@
 
 #include "sysemu/dma.h"
 #include "hw/stream.h"
+#include "qom/object.h"
 
 #define D(x)
 
@@ -42,9 +43,11 @@
 #define TYPE_XILINX_AXI_DMA_DATA_STREAM "xilinx-axi-dma-data-stream"
 #define TYPE_XILINX_AXI_DMA_CONTROL_STREAM "xilinx-axi-dma-control-stream"
 
+typedef struct XilinxAXIDMA XilinxAXIDMA;
 #define XILINX_AXI_DMA(obj) \
      OBJECT_CHECK(XilinxAXIDMA, (obj), TYPE_XILINX_AXI_DMA)
 
+typedef struct XilinxAXIDMAStreamSlave XilinxAXIDMAStreamSlave;
 #define XILINX_AXI_DMA_DATA_STREAM(obj) \
      OBJECT_CHECK(XilinxAXIDMAStreamSlave, (obj),\
      TYPE_XILINX_AXI_DMA_DATA_STREAM)
@@ -62,8 +65,6 @@
 #define CONTROL_PAYLOAD_WORDS 5
 #define CONTROL_PAYLOAD_SIZE (CONTROL_PAYLOAD_WORDS * (sizeof(uint32_t)))
 
-typedef struct XilinxAXIDMA XilinxAXIDMA;
-typedef struct XilinxAXIDMAStreamSlave XilinxAXIDMAStreamSlave;
 
 enum {
     DMACR_RUNSTOP = 1,
diff --git a/hw/gpio/gpio_key.c b/hw/gpio/gpio_key.c
index 571b74a5e5..f1d6c8ff0e 100644
--- a/hw/gpio/gpio_key.c
+++ b/hw/gpio/gpio_key.c
@@ -28,17 +28,19 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 
 #define TYPE_GPIOKEY "gpio-key"
+typedef struct GPIOKEYState GPIOKEYState;
 #define GPIOKEY(obj) OBJECT_CHECK(GPIOKEYState, (obj), TYPE_GPIOKEY)
 #define GPIO_KEY_LATENCY 100 /* 100ms */
 
-typedef struct GPIOKEYState {
+struct GPIOKEYState {
     SysBusDevice parent_obj;
 
     QEMUTimer *timer;
     qemu_irq irq;
-} GPIOKEYState;
+};
 
 static const VMStateDescription vmstate_gpio_key = {
     .name = "gpio-key",
diff --git a/hw/gpio/max7310.c b/hw/gpio/max7310.c
index 3a8e4ab1d5..969ca5bbf7 100644
--- a/hw/gpio/max7310.c
+++ b/hw/gpio/max7310.c
@@ -14,11 +14,13 @@
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define TYPE_MAX7310 "max7310"
+typedef struct MAX7310State MAX7310State;
 #define MAX7310(obj) OBJECT_CHECK(MAX7310State, (obj), TYPE_MAX7310)
 
-typedef struct MAX7310State {
+struct MAX7310State {
     I2CSlave parent_obj;
 
     int i2c_command_byte;
@@ -31,7 +33,7 @@ typedef struct MAX7310State {
     uint8_t command;
     qemu_irq handler[8];
     qemu_irq *gpio_in;
-} MAX7310State;
+};
 
 static void max7310_reset(DeviceState *dev)
 {
diff --git a/hw/gpio/mpc8xxx.c b/hw/gpio/mpc8xxx.c
index b1bdcc2851..acf45f6e2c 100644
--- a/hw/gpio/mpc8xxx.c
+++ b/hw/gpio/mpc8xxx.c
@@ -24,11 +24,13 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define TYPE_MPC8XXX_GPIO "mpc8xxx_gpio"
+typedef struct MPC8XXXGPIOState MPC8XXXGPIOState;
 #define MPC8XXX_GPIO(obj) OBJECT_CHECK(MPC8XXXGPIOState, (obj), TYPE_MPC8XXX_GPIO)
 
-typedef struct MPC8XXXGPIOState {
+struct MPC8XXXGPIOState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -41,7 +43,7 @@ typedef struct MPC8XXXGPIOState {
     uint32_t ier;
     uint32_t imr;
     uint32_t icr;
-} MPC8XXXGPIOState;
+};
 
 static const VMStateDescription vmstate_mpc8xxx_gpio = {
     .name = "mpc8xxx_gpio",
diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index b6ef1c7340..352c46d2c4 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -14,6 +14,7 @@
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 //#define DEBUG_PL061 1
 
@@ -34,11 +35,12 @@ static const uint8_t pl061_id_luminary[12] =
   { 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1 };
 
 #define TYPE_PL061 "pl061"
+typedef struct PL061State PL061State;
 #define PL061(obj) OBJECT_CHECK(PL061State, (obj), TYPE_PL061)
 
 #define N_GPIOS 8
 
-typedef struct PL061State {
+struct PL061State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -67,7 +69,7 @@ typedef struct PL061State {
     qemu_irq out[N_GPIOS];
     const unsigned char *id;
     uint32_t rsvd_start; /* reserved area: [rsvd_start, 0xfcc] */
-} PL061State;
+};
 
 static const VMStateDescription vmstate_pl061 = {
     .name = "pl061",
diff --git a/hw/gpio/puv3_gpio.c b/hw/gpio/puv3_gpio.c
index 4c2edda889..d4ef5cf0dc 100644
--- a/hw/gpio/puv3_gpio.c
+++ b/hw/gpio/puv3_gpio.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #undef DEBUG_PUV3
 #include "hw/unicore32/puv3.h"
@@ -18,9 +19,10 @@
 #include "qemu/log.h"
 
 #define TYPE_PUV3_GPIO "puv3_gpio"
+typedef struct PUV3GPIOState PUV3GPIOState;
 #define PUV3_GPIO(obj) OBJECT_CHECK(PUV3GPIOState, (obj), TYPE_PUV3_GPIO)
 
-typedef struct PUV3GPIOState {
+struct PUV3GPIOState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -29,7 +31,7 @@ typedef struct PUV3GPIOState {
     uint32_t reg_GPLR;
     uint32_t reg_GPDR;
     uint32_t reg_GPIR;
-} PUV3GPIOState;
+};
 
 static uint64_t puv3_gpio_read(void *opaque, hwaddr offset,
         unsigned size)
diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index 1100850a6c..a9c2bc7102 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -23,13 +23,14 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
+#include "qom/object.h"
 
 /* SCOOP devices */
 
 #define TYPE_SCOOP "scoop"
+typedef struct ScoopInfo ScoopInfo;
 #define SCOOP(obj) OBJECT_CHECK(ScoopInfo, (obj), TYPE_SCOOP)
 
-typedef struct ScoopInfo ScoopInfo;
 struct ScoopInfo {
     SysBusDevice parent_obj;
 
diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 27faa97644..853d65e304 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -22,6 +22,7 @@
 #include "hppa_sys.h"
 #include "exec/address-spaces.h"
 #include "trace.h"
+#include "qom/object.h"
 
 
 #define TYPE_DINO_PCI_HOST_BRIDGE "dino-pcihost"
@@ -80,6 +81,7 @@
 
 #define DINO_MEM_CHUNK_SIZE (8 * MiB)
 
+typedef struct DinoState DinoState;
 #define DINO_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(DinoState, (obj), TYPE_DINO_PCI_HOST_BRIDGE)
 
@@ -100,7 +102,7 @@ static const uint32_t reg800_keep_bits[DINO800_REGS] = {
     MAKE_64BIT_MASK(0, 9),  /* TLTIM */
 };
 
-typedef struct DinoState {
+struct DinoState {
     PCIHostState parent_obj;
 
     /* PCI_CONFIG_ADDR is parent_obj.config_reg, via pci_host_conf_be_ops,
@@ -129,7 +131,7 @@ typedef struct DinoState {
     MemoryRegion bm_ram_alias;
     MemoryRegion bm_pci_alias;
     MemoryRegion bm_cpu_alias;
-} DinoState;
+};
 
 /*
  * Dino can forward memory accesses from the CPU in the range between
diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 8a54923c26..a3dd8761fa 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -25,6 +25,7 @@
 #include "hw/input/lasips2.h"
 #include "exec/address-spaces.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 #define TYPE_LASI_CHIP "lasi-chip"
 
@@ -51,12 +52,13 @@
 #define ICR_BUS_ERROR_BIT  LASI_BIT(8)  /* bit 8 in ICR */
 #define ICR_TOC_BIT        LASI_BIT(1)  /* bit 1 in ICR */
 
+typedef struct LasiState LasiState;
 #define LASI_CHIP(obj) \
     OBJECT_CHECK(LasiState, (obj), TYPE_LASI_CHIP)
 
 #define LASI_RTC_HPA    (LASI_HPA + 0x9000)
 
-typedef struct LasiState {
+struct LasiState {
     PCIHostState parent_obj;
 
     uint32_t irr;
@@ -71,7 +73,7 @@ typedef struct LasiState {
     time_t rtc_ref;
 
     MemoryRegion this_mem;
-} LasiState;
+};
 
 static bool lasi_chip_mem_valid(void *opaque, hwaddr addr,
                                 unsigned size, bool is_write,
diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index 07c9214bf1..89c6a0b6f9 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -20,8 +20,9 @@
 #include "qemu/rcu.h"
 #include "qemu/rcu_queue.h"
 #include "hw/hyperv/hyperv.h"
+#include "qom/object.h"
 
-typedef struct SynICState {
+struct SynICState {
     DeviceState parent_obj;
 
     CPUState *cs;
@@ -33,7 +34,8 @@ typedef struct SynICState {
     MemoryRegion event_page_mr;
     struct hyperv_message_page *msg_page;
     struct hyperv_event_flags_page *event_page;
-} SynICState;
+};
+typedef struct SynICState SynICState;
 
 #define TYPE_SYNIC "hyperv-synic"
 #define SYNIC(obj) OBJECT_CHECK(SynICState, (obj), TYPE_SYNIC)
diff --git a/hw/hyperv/hyperv_testdev.c b/hw/hyperv/hyperv_testdev.c
index c83d0a9325..46b67c140e 100644
--- a/hw/hyperv/hyperv_testdev.c
+++ b/hw/hyperv/hyperv_testdev.c
@@ -17,6 +17,7 @@
 #include "qemu/queue.h"
 #include "hw/isa/isa.h"
 #include "hw/hyperv/hyperv.h"
+#include "qom/object.h"
 
 typedef struct TestSintRoute {
     QLIST_ENTRY(TestSintRoute) le;
diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index 566ccf0d74..71d5cc89ae 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -15,6 +15,7 @@
 #include "hw/i2c/bitbang_i2c.h"
 #include "hw/sysbus.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 //#define DEBUG_BITBANG_I2C
 
@@ -162,16 +163,17 @@ void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus)
 /* GPIO interface.  */
 
 #define TYPE_GPIO_I2C "gpio_i2c"
+typedef struct GPIOI2CState GPIOI2CState;
 #define GPIO_I2C(obj) OBJECT_CHECK(GPIOI2CState, (obj), TYPE_GPIO_I2C)
 
-typedef struct GPIOI2CState {
+struct GPIOI2CState {
     SysBusDevice parent_obj;
 
     MemoryRegion dummy_iomem;
     bitbang_i2c_interface bitbang;
     int last_level;
     qemu_irq out;
-} GPIOI2CState;
+};
 
 static void bitbang_i2c_gpio_set(void *opaque, int irq, int level)
 {
diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
index 3a803ebc8b..a8f49e32b6 100644
--- a/hw/i2c/exynos4210_i2c.c
+++ b/hw/i2c/exynos4210_i2c.c
@@ -27,12 +27,14 @@
 #include "migration/vmstate.h"
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
+#include "qom/object.h"
 
 #ifndef EXYNOS4_I2C_DEBUG
 #define EXYNOS4_I2C_DEBUG                 0
 #endif
 
 #define TYPE_EXYNOS4_I2C                  "exynos4210.i2c"
+typedef struct Exynos4210I2CState Exynos4210I2CState;
 #define EXYNOS4_I2C(obj)                  \
     OBJECT_CHECK(Exynos4210I2CState, (obj), TYPE_EXYNOS4_I2C)
 
@@ -83,7 +85,7 @@ static const char *exynos4_i2c_get_regname(unsigned offset)
 #define DPRINT(fmt, args...)              do { } while (0)
 #endif
 
-typedef struct Exynos4210I2CState {
+struct Exynos4210I2CState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -96,7 +98,7 @@ typedef struct Exynos4210I2CState {
     uint8_t i2cds;
     uint8_t i2clc;
     bool scl_free;
-} Exynos4210I2CState;
+};
 
 static inline void exynos4210_i2c_raise_interrupt(Exynos4210I2CState *s)
 {
diff --git a/hw/i2c/mpc_i2c.c b/hw/i2c/mpc_i2c.c
index c65fb2775b..30a9f737be 100644
--- a/hw/i2c/mpc_i2c.c
+++ b/hw/i2c/mpc_i2c.c
@@ -24,6 +24,7 @@
 #include "qemu/module.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 /* #define DEBUG_I2C */
 
@@ -36,6 +37,7 @@
 #endif
 
 #define TYPE_MPC_I2C "mpc-i2c"
+typedef struct MPCI2CState MPCI2CState;
 #define MPC_I2C(obj) \
     OBJECT_CHECK(MPCI2CState, (obj), TYPE_MPC_I2C)
 
@@ -70,7 +72,7 @@
 
 #define CYCLE_RESET 0xFF
 
-typedef struct MPCI2CState {
+struct MPCI2CState {
     SysBusDevice parent_obj;
 
     I2CBus *bus;
@@ -84,7 +86,7 @@ typedef struct MPCI2CState {
     uint8_t sr;
     uint8_t dr;
     uint8_t dfssr;
-} MPCI2CState;
+};
 
 static bool mpc_i2c_is_enabled(MPCI2CState *s)
 {
diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
index cc506b6d4a..fefc6360a7 100644
--- a/hw/i2c/smbus_eeprom.c
+++ b/hw/i2c/smbus_eeprom.c
@@ -31,23 +31,25 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "hw/i2c/smbus_eeprom.h"
+#include "qom/object.h"
 
 //#define DEBUG
 
 #define TYPE_SMBUS_EEPROM "smbus-eeprom"
 
+typedef struct SMBusEEPROMDevice SMBusEEPROMDevice;
 #define SMBUS_EEPROM(obj) \
     OBJECT_CHECK(SMBusEEPROMDevice, (obj), TYPE_SMBUS_EEPROM)
 
 #define SMBUS_EEPROM_SIZE 256
 
-typedef struct SMBusEEPROMDevice {
+struct SMBusEEPROMDevice {
     SMBusDevice smbusdev;
     uint8_t data[SMBUS_EEPROM_SIZE];
     uint8_t *init_data;
     uint8_t offset;
     bool accessed;
-} SMBusEEPROMDevice;
+};
 
 static uint8_t eeprom_receive_byte(SMBusDevice *dev)
 {
diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index 37a41b5b77..15e1b6ced5 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -28,17 +28,19 @@
 #include "qemu/module.h"
 
 #include "hw/i386/ich9.h"
+#include "qom/object.h"
 
+typedef struct ICH9SMBState ICH9SMBState;
 #define ICH9_SMB_DEVICE(obj) \
      OBJECT_CHECK(ICH9SMBState, (obj), TYPE_ICH9_SMB_DEVICE)
 
-typedef struct ICH9SMBState {
+struct ICH9SMBState {
     PCIDevice dev;
 
     bool irq_enabled;
 
     PMSMBus smb;
-} ICH9SMBState;
+};
 
 static bool ich9_vmstate_need_smbus(void *opaque, int version_id)
 {
diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index 13ddddef90..acd9617e9c 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -27,11 +27,12 @@
 #include "hw/registerfields.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
+typedef ArmSbconI2CState VersatileI2CState;
 #define VERSATILE_I2C(obj) \
     OBJECT_CHECK(VersatileI2CState, (obj), TYPE_VERSATILE_I2C)
 
-typedef ArmSbconI2CState VersatileI2CState;
 
 
 REG32(CONTROL_GET, 0)
diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index e9f57d0e2b..1909c8a1dc 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -29,11 +29,13 @@
 
 #include <linux/kvm.h>
 #include "standard-headers/asm-x86/kvm_para.h"
+#include "qom/object.h"
 
 #define TYPE_KVM_CLOCK "kvmclock"
+typedef struct KVMClockState KVMClockState;
 #define KVM_CLOCK(obj) OBJECT_CHECK(KVMClockState, (obj), TYPE_KVM_CLOCK)
 
-typedef struct KVMClockState {
+struct KVMClockState {
     /*< private >*/
     SysBusDevice busdev;
     /*< public >*/
@@ -50,7 +52,7 @@ typedef struct KVMClockState {
     /* whether the 'clock' value was obtained in a host with
      * reliable KVM_GET_CLOCK */
     bool clock_is_reliable;
-} KVMClockState;
+};
 
 struct pvclock_vcpu_time_info {
     uint32_t   version;
diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
index 0f3d10d123..2f82f6d5f4 100644
--- a/hw/i386/kvm/i8254.c
+++ b/hw/i386/kvm/i8254.c
@@ -33,30 +33,33 @@
 #include "hw/timer/i8254.h"
 #include "hw/timer/i8254_internal.h"
 #include "sysemu/kvm.h"
+#include "qom/object.h"
 
 #define KVM_PIT_REINJECT_BIT 0
 
 #define CALIBRATION_ROUNDS   3
 
+typedef struct KVMPITClass KVMPITClass;
+typedef struct KVMPITState KVMPITState;
 #define KVM_PIT(obj) OBJECT_CHECK(KVMPITState, (obj), TYPE_KVM_I8254)
 #define KVM_PIT_CLASS(class) \
     OBJECT_CLASS_CHECK(KVMPITClass, (class), TYPE_KVM_I8254)
 #define KVM_PIT_GET_CLASS(obj) \
     OBJECT_GET_CLASS(KVMPITClass, (obj), TYPE_KVM_I8254)
 
-typedef struct KVMPITState {
+struct KVMPITState {
     PITCommonState parent_obj;
 
     LostTickPolicy lost_tick_policy;
     bool vm_stopped;
     int64_t kernel_clock_offset;
-} KVMPITState;
+};
 
-typedef struct KVMPITClass {
+struct KVMPITClass {
     PITCommonClass parent_class;
 
     DeviceRealize parent_realize;
-} KVMPITClass;
+};
 
 static int64_t abs64(int64_t v)
 {
diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
index f7844260d5..82986aff66 100644
--- a/hw/i386/kvm/i8259.c
+++ b/hw/i386/kvm/i8259.c
@@ -17,8 +17,10 @@
 #include "hw/i386/apic_internal.h"
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
+#include "qom/object.h"
 
 #define TYPE_KVM_I8259 "kvm-i8259"
+typedef struct KVMPICClass KVMPICClass;
 #define KVM_PIC_CLASS(class) \
     OBJECT_CLASS_CHECK(KVMPICClass, (class), TYPE_KVM_I8259)
 #define KVM_PIC_GET_CLASS(obj) \
@@ -28,11 +30,11 @@
  * KVMPICClass:
  * @parent_realize: The parent's realizefn.
  */
-typedef struct KVMPICClass {
+struct KVMPICClass {
     PICCommonClass parent_class;
 
     DeviceRealize parent_realize;
-} KVMPICClass;
+};
 
 static void kvm_pic_get(PICCommonState *s)
 {
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index a08519ee70..57360ebc43 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -22,6 +22,7 @@
 #include "hw/boards.h"
 #include "migration/vmstate.h"
 #include "tcg/tcg.h"
+#include "qom/object.h"
 
 #define VAPIC_IO_PORT           0x7e
 
@@ -56,7 +57,7 @@ typedef struct GuestROMState {
     VAPICHandlers mp;
 } QEMU_PACKED GuestROMState;
 
-typedef struct VAPICROMState {
+struct VAPICROMState {
     SysBusDevice busdev;
     MemoryRegion io;
     MemoryRegion rom;
@@ -69,7 +70,8 @@ typedef struct VAPICROMState {
     size_t rom_size;
     bool rom_mapped_writable;
     VMChangeStateEntry *vmsentry;
-} VAPICROMState;
+};
+typedef struct VAPICROMState VAPICROMState;
 
 #define TYPE_VAPIC "kvmvapic"
 #define VAPIC(obj) OBJECT_CHECK(VAPICROMState, (obj), TYPE_VAPIC)
diff --git a/hw/i386/port92.c b/hw/i386/port92.c
index cc41fb034f..6074e5088f 100644
--- a/hw/i386/port92.c
+++ b/hw/i386/port92.c
@@ -12,16 +12,18 @@
 #include "hw/irq.h"
 #include "hw/i386/pc.h"
 #include "trace.h"
+#include "qom/object.h"
 
+typedef struct Port92State Port92State;
 #define PORT92(obj) OBJECT_CHECK(Port92State, (obj), TYPE_PORT92)
 
-typedef struct Port92State {
+struct Port92State {
     ISADevice parent_obj;
 
     MemoryRegion io;
     uint8_t outport;
     qemu_irq a20_out;
-} Port92State;
+};
 
 static void port92_write(void *opaque, hwaddr addr, uint64_t val,
                          unsigned size)
diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index cea1924e69..c3b14c23df 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -30,6 +30,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "cpu.h"
+#include "qom/object.h"
 
 /* debug only vmmouse */
 //#define DEBUG_VMMOUSE
@@ -50,10 +51,10 @@
 #endif
 
 #define TYPE_VMMOUSE "vmmouse"
+typedef struct VMMouseState VMMouseState;
 #define VMMOUSE(obj) OBJECT_CHECK(VMMouseState, (obj), TYPE_VMMOUSE)
 
-typedef struct VMMouseState
-{
+struct VMMouseState {
     ISADevice parent_obj;
 
     uint32_t queue[VMMOUSE_QUEUE_SIZE];
@@ -63,7 +64,7 @@ typedef struct VMMouseState
     uint8_t absolute;
     QEMUPutMouseEntry *entry;
     ISAKBDState *i8042;
-} VMMouseState;
+};
 
 static void vmmouse_get_data(uint32_t *data)
 {
diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index 6379e14401..0fd6af31a8 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -38,6 +38,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define VMPORT_MAGIC   0x564D5868
 
@@ -62,9 +63,10 @@
 #define VCPU_INFO_LEGACY_X2APIC_BIT     3
 #define VCPU_INFO_RESERVED_BIT          31
 
+typedef struct VMPortState VMPortState;
 #define VMPORT(obj) OBJECT_CHECK(VMPortState, (obj), TYPE_VMPORT)
 
-typedef struct VMPortState {
+struct VMPortState {
     ISADevice parent_obj;
 
     MemoryRegion io;
@@ -75,7 +77,7 @@ typedef struct VMPortState {
     uint8_t vmware_vmx_type;
 
     uint32_t compat_flags;
-} VMPortState;
+};
 
 static VMPortState *port_state;
 
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 93de73323b..fa0e86d26e 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -39,6 +39,7 @@
 #include "qemu/module.h"
 
 #include <xenguest.h>
+#include "qom/object.h"
 
 //#define DEBUG_PLATFORM
 
@@ -52,7 +53,7 @@
 
 #define PFFLAG_ROM_LOCK 1 /* Sets whether ROM memory area is RW or RO */
 
-typedef struct PCIXenPlatformState {
+struct PCIXenPlatformState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -67,7 +68,8 @@ typedef struct PCIXenPlatformState {
     /* Log from guest drivers */
     char log_buffer[4096];
     int log_buffer_off;
-} PCIXenPlatformState;
+};
+typedef struct PCIXenPlatformState PCIXenPlatformState;
 
 #define TYPE_XEN_PLATFORM "xen-platform"
 #define XEN_PLATFORM(obj) \
diff --git a/hw/i386/xen/xen_pvdevice.c b/hw/i386/xen/xen_pvdevice.c
index d62d26e0b6..7c65690689 100644
--- a/hw/i386/xen/xen_pvdevice.c
+++ b/hw/i386/xen/xen_pvdevice.c
@@ -36,13 +36,15 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define TYPE_XEN_PV_DEVICE  "xen-pvdevice"
 
+typedef struct XenPVDevice XenPVDevice;
 #define XEN_PV_DEVICE(obj) \
      OBJECT_CHECK(XenPVDevice, (obj), TYPE_XEN_PV_DEVICE)
 
-typedef struct XenPVDevice {
+struct XenPVDevice {
     /*< private >*/
     PCIDevice       parent_obj;
     /*< public >*/
@@ -51,7 +53,7 @@ typedef struct XenPVDevice {
     uint8_t         revision;
     uint32_t        size;
     MemoryRegion    mmio;
-} XenPVDevice;
+};
 
 static uint64_t xen_pv_mmio_read(void *opaque, hwaddr addr,
                                  unsigned size)
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index f63166f31d..cffd839d94 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -32,14 +32,16 @@
 #include "sysemu/dma.h"
 
 #include "hw/ide/internal.h"
+#include "qom/object.h"
 
 /***********************************************************/
 /* ISA IDE definitions */
 
 #define TYPE_ISA_IDE "isa-ide"
+typedef struct ISAIDEState ISAIDEState;
 #define ISA_IDE(obj) OBJECT_CHECK(ISAIDEState, (obj), TYPE_ISA_IDE)
 
-typedef struct ISAIDEState {
+struct ISAIDEState {
     ISADevice parent_obj;
 
     IDEBus    bus;
@@ -47,7 +49,7 @@ typedef struct ISAIDEState {
     uint32_t  iobase2;
     uint32_t  isairq;
     qemu_irq  irq;
-} ISAIDEState;
+};
 
 static void isa_ide_reset(DeviceState *d)
 {
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 97483e5836..7676e9383f 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -31,8 +31,10 @@
 #include "sysemu/dma.h"
 
 #include "hw/ide/internal.h"
+#include "qom/object.h"
 
 #define TYPE_MICRODRIVE "microdrive"
+typedef struct MicroDriveState MicroDriveState;
 #define MICRODRIVE(obj) OBJECT_CHECK(MicroDriveState, (obj), TYPE_MICRODRIVE)
 
 /***********************************************************/
@@ -42,7 +44,7 @@
 
 /* DSCM-1XXXX Microdrive hard disk with CF+ II / PCMCIA interface.  */
 
-typedef struct MicroDriveState {
+struct MicroDriveState {
     /*< private >*/
     PCMCIACardState parent_obj;
     /*< public >*/
@@ -59,7 +61,7 @@ typedef struct MicroDriveState {
     uint8_t ctrl;
     uint16_t io;
     uint8_t cycle;
-} MicroDriveState;
+};
 
 /* Register bitfields */
 enum md_opt {
diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index 83f0d4a583..ff4bbbf938 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -31,6 +31,7 @@
 
 #include "hw/ide/internal.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 /***********************************************************/
 /* MMIO based ide port
@@ -39,9 +40,10 @@
  */
 
 #define TYPE_MMIO_IDE "mmio-ide"
+typedef struct MMIOIDEState MMIOState;
 #define MMIO_IDE(obj) OBJECT_CHECK(MMIOState, (obj), TYPE_MMIO_IDE)
 
-typedef struct MMIOIDEState {
+struct MMIOIDEState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -51,7 +53,7 @@ typedef struct MMIOIDEState {
     uint32_t shift;
     qemu_irq irq;
     MemoryRegion iomem1, iomem2;
-} MMIOState;
+};
 
 static void mmio_ide_reset(DeviceState *dev)
 {
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 68279530fd..4730e798f3 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -16,8 +16,10 @@
 #include "hw/ide/pci.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define TYPE_SII3112_PCI "sii3112"
+typedef struct SiI3112PCIState SiI3112PCIState;
 #define SII3112_PCI(obj) OBJECT_CHECK(SiI3112PCIState, (obj), \
                          TYPE_SII3112_PCI)
 
@@ -28,11 +30,11 @@ typedef struct SiI3112Regs {
     uint8_t swdata;
 } SiI3112Regs;
 
-typedef struct SiI3112PCIState {
+struct SiI3112PCIState {
     PCIIDEState i;
     MemoryRegion mmio;
     SiI3112Regs regs[2];
-} SiI3112PCIState;
+};
 
 /* The sii3112_reg_read and sii3112_reg_write functions implement the
  * Internal Register Space - BAR5 (section 6.7 of the data sheet).
diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
index 4f0f546581..cb7c1f4306 100644
--- a/hw/input/adb-kbd.c
+++ b/hw/input/adb-kbd.c
@@ -30,30 +30,33 @@
 #include "hw/input/adb-keys.h"
 #include "adb-internal.h"
 #include "trace.h"
+#include "qom/object.h"
 
+typedef struct ADBKeyboardClass ADBKeyboardClass;
+typedef struct KBDState KBDState;
 #define ADB_KEYBOARD(obj) OBJECT_CHECK(KBDState, (obj), TYPE_ADB_KEYBOARD)
 
-typedef struct KBDState {
+struct KBDState {
     /*< private >*/
     ADBDevice parent_obj;
     /*< public >*/
 
     uint8_t data[128];
     int rptr, wptr, count;
-} KBDState;
+};
 
 #define ADB_KEYBOARD_CLASS(class) \
     OBJECT_CLASS_CHECK(ADBKeyboardClass, (class), TYPE_ADB_KEYBOARD)
 #define ADB_KEYBOARD_GET_CLASS(obj) \
     OBJECT_GET_CLASS(ADBKeyboardClass, (obj), TYPE_ADB_KEYBOARD)
 
-typedef struct ADBKeyboardClass {
+struct ADBKeyboardClass {
     /*< private >*/
     ADBDeviceClass parent_class;
     /*< public >*/
 
     DeviceRealize parent_realize;
-} ADBKeyboardClass;
+};
 
 /* The adb keyboard doesn't have every key imaginable */
 #define NO_KEY 0xff
diff --git a/hw/input/adb-mouse.c b/hw/input/adb-mouse.c
index c0c8dead39..27cc9d40b9 100644
--- a/hw/input/adb-mouse.c
+++ b/hw/input/adb-mouse.c
@@ -29,30 +29,33 @@
 #include "qemu/module.h"
 #include "adb-internal.h"
 #include "trace.h"
+#include "qom/object.h"
 
+typedef struct ADBMouseClass ADBMouseClass;
+typedef struct MouseState MouseState;
 #define ADB_MOUSE(obj) OBJECT_CHECK(MouseState, (obj), TYPE_ADB_MOUSE)
 
-typedef struct MouseState {
+struct MouseState {
     /*< public >*/
     ADBDevice parent_obj;
     /*< private >*/
 
     int buttons_state, last_buttons_state;
     int dx, dy, dz;
-} MouseState;
+};
 
 #define ADB_MOUSE_CLASS(class) \
     OBJECT_CLASS_CHECK(ADBMouseClass, (class), TYPE_ADB_MOUSE)
 #define ADB_MOUSE_GET_CLASS(obj) \
     OBJECT_GET_CLASS(ADBMouseClass, (obj), TYPE_ADB_MOUSE)
 
-typedef struct ADBMouseClass {
+struct ADBMouseClass {
     /*< public >*/
     ADBDeviceClass parent_class;
     /*< private >*/
 
     DeviceRealize parent_realize;
-} ADBMouseClass;
+};
 
 static void adb_mouse_event(void *opaque,
                             int dx1, int dy1, int dz1, int buttons_state)
diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index ffe68b081a..569cd26a44 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -25,11 +25,13 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "ui/console.h"
+#include "qom/object.h"
 
 #define TYPE_LM8323 "lm8323"
+typedef struct LM823KbdState LM823KbdState;
 #define LM8323(obj) OBJECT_CHECK(LM823KbdState, (obj), TYPE_LM8323)
 
-typedef struct {
+struct LM823KbdState {
     I2CSlave parent_obj;
 
     uint8_t i2c_dir;
@@ -72,7 +74,7 @@ typedef struct {
         uint8_t addr[3];
         QEMUTimer *tm[3];
     } pwm;
-} LM823KbdState;
+};
 
 #define INT_KEYPAD		(1 << 0)
 #define INT_ERROR		(1 << 3)
diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb.c
index 73ee7edbd0..4dfa04bef0 100644
--- a/hw/input/milkymist-softusb.c
+++ b/hw/input/milkymist-softusb.c
@@ -32,6 +32,7 @@
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 enum {
     R_CTRL = 0,
@@ -50,6 +51,7 @@ enum {
 #define COMLOC_KEVT_BASE     0x1143
 
 #define TYPE_MILKYMIST_SOFTUSB "milkymist-softusb"
+typedef struct MilkymistSoftUsbState MilkymistSoftUsbState;
 #define MILKYMIST_SOFTUSB(obj) \
     OBJECT_CHECK(MilkymistSoftUsbState, (obj), TYPE_MILKYMIST_SOFTUSB)
 
@@ -80,7 +82,6 @@ struct MilkymistSoftUsbState {
     /* keyboard state */
     uint8_t kbd_hid_buffer[8];
 };
-typedef struct MilkymistSoftUsbState MilkymistSoftUsbState;
 
 static uint64_t softusb_read(void *opaque, hwaddr addr,
                              unsigned size)
diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index b018e708a6..af2b81f5c0 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -14,11 +14,13 @@
 #include "hw/irq.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define TYPE_PL050 "pl050"
+typedef struct PL050State PL050State;
 #define PL050(obj) OBJECT_CHECK(PL050State, (obj), TYPE_PL050)
 
-typedef struct PL050State {
+struct PL050State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -29,7 +31,7 @@ typedef struct PL050State {
     int pending;
     qemu_irq irq;
     bool is_mouse;
-} PL050State;
+};
 
 static const VMStateDescription vmstate_pl050 = {
     .name = "pl050",
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 770e14fc3e..afbb653497 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -28,6 +28,7 @@
 #include "trace.h"
 #include "hw/i386/apic-msidef.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 
 #define MAX_APICS 255
 #define MAX_APIC_WORDS 8
diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index b0379ea4c5..8bc90aa65d 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -29,8 +29,10 @@
 #include "kvm_arm.h"
 #include "gic_internal.h"
 #include "vgic_common.h"
+#include "qom/object.h"
 
 #define TYPE_KVM_ARM_GIC "kvm-arm-gic"
+typedef struct KVMARMGICClass KVMARMGICClass;
 #define KVM_ARM_GIC(obj) \
      OBJECT_CHECK(GICState, (obj), TYPE_KVM_ARM_GIC)
 #define KVM_ARM_GIC_CLASS(klass) \
@@ -38,11 +40,11 @@
 #define KVM_ARM_GIC_GET_CLASS(obj) \
      OBJECT_GET_CLASS(KVMARMGICClass, (obj), TYPE_KVM_ARM_GIC)
 
-typedef struct KVMARMGICClass {
+struct KVMARMGICClass {
     ARMGICCommonClass parent_class;
     DeviceRealize parent_realize;
     void (*parent_reset)(DeviceState *dev);
-} KVMARMGICClass;
+};
 
 void kvm_arm_gic_set_irq(uint32_t num_irq, int irq, int level)
 {
diff --git a/hw/intc/arm_gicv2m.c b/hw/intc/arm_gicv2m.c
index d129a8c9f1..99a3cfbad5 100644
--- a/hw/intc/arm_gicv2m.c
+++ b/hw/intc/arm_gicv2m.c
@@ -34,8 +34,10 @@
 #include "sysemu/kvm.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define TYPE_ARM_GICV2M "arm-gicv2m"
+typedef struct ARMGICv2mState ARMGICv2mState;
 #define ARM_GICV2M(obj) OBJECT_CHECK(ARMGICv2mState, (obj), TYPE_ARM_GICV2M)
 
 #define GICV2M_NUM_SPI_MAX 128
@@ -48,7 +50,7 @@
 
 #define PRODUCT_ID_QEMU         0x51 /* ASCII code Q */
 
-typedef struct ARMGICv2mState {
+struct ARMGICv2mState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -56,7 +58,7 @@ typedef struct ARMGICv2mState {
 
     uint32_t base_spi;
     uint32_t num_spi;
-} ARMGICv2mState;
+};
 
 static void gicv2m_set_irq(void *opaque, int irq)
 {
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index ddd3a5a665..198be30cf5 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -27,18 +27,20 @@
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
 #include "migration/blocker.h"
+#include "qom/object.h"
 
 #define TYPE_KVM_ARM_ITS "arm-its-kvm"
+typedef struct KVMARMITSClass KVMARMITSClass;
 #define KVM_ARM_ITS(obj) OBJECT_CHECK(GICv3ITSState, (obj), TYPE_KVM_ARM_ITS)
 #define KVM_ARM_ITS_CLASS(klass) \
      OBJECT_CLASS_CHECK(KVMARMITSClass, (klass), TYPE_KVM_ARM_ITS)
 #define KVM_ARM_ITS_GET_CLASS(obj) \
      OBJECT_GET_CLASS(KVMARMITSClass, (obj), TYPE_KVM_ARM_ITS)
 
-typedef struct KVMARMITSClass {
+struct KVMARMITSClass {
     GICv3ITSCommonClass parent_class;
     void (*parent_reset)(DeviceState *dev);
-} KVMARMITSClass;
+};
 
 
 static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 30d09d307e..87092795e6 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -31,6 +31,7 @@
 #include "gicv3_internal.h"
 #include "vgic_common.h"
 #include "migration/blocker.h"
+#include "qom/object.h"
 
 #ifdef DEBUG_GICV3_KVM
 #define DPRINTF(fmt, ...) \
@@ -41,6 +42,7 @@
 #endif
 
 #define TYPE_KVM_ARM_GICV3 "kvm-arm-gicv3"
+typedef struct KVMARMGICv3Class KVMARMGICv3Class;
 #define KVM_ARM_GICV3(obj) \
      OBJECT_CHECK(GICv3State, (obj), TYPE_KVM_ARM_GICV3)
 #define KVM_ARM_GICV3_CLASS(klass) \
@@ -74,11 +76,11 @@
 #define ICC_IGRPEN1_EL1 \
     KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 7)
 
-typedef struct KVMARMGICv3Class {
+struct KVMARMGICv3Class {
     ARMGICv3CommonClass parent_class;
     DeviceRealize parent_realize;
     void (*parent_reset)(DeviceState *dev);
-} KVMARMGICv3Class;
+};
 
 static void kvm_arm_gicv3_set_irq(void *opaque, int irq, int level)
 {
diff --git a/hw/intc/etraxfs_pic.c b/hw/intc/etraxfs_pic.c
index d77d65ed38..0dae5ec090 100644
--- a/hw/intc/etraxfs_pic.c
+++ b/hw/intc/etraxfs_pic.c
@@ -27,6 +27,7 @@
 #include "qemu/module.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 #define D(x)
 
diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index d0365915af..296cd2c5d1 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -36,6 +36,7 @@
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 //#define DEBUG_COMBINER
 
@@ -63,10 +64,11 @@ typedef struct CombinerGroupState {
 } CombinerGroupState;
 
 #define TYPE_EXYNOS4210_COMBINER "exynos4210.combiner"
+typedef struct Exynos4210CombinerState Exynos4210CombinerState;
 #define EXYNOS4210_COMBINER(obj) \
     OBJECT_CHECK(Exynos4210CombinerState, (obj), TYPE_EXYNOS4210_COMBINER)
 
-typedef struct Exynos4210CombinerState {
+struct Exynos4210CombinerState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -77,7 +79,7 @@ typedef struct Exynos4210CombinerState {
     uint32_t external;          /* 1 means that this combiner is external */
 
     qemu_irq output_irq[IIC_NGRP];
-} Exynos4210CombinerState;
+};
 
 static const VMStateDescription vmstate_exynos4210_combiner_group_state = {
     .name = "exynos4210.combiner.groupstate",
diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index a01ab137eb..711f0597b8 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -28,6 +28,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/exynos4210.h"
+#include "qom/object.h"
 
 enum ExtGicId {
     EXT_GIC_ID_MDMA_LCD0 = 66,
@@ -264,10 +265,11 @@ uint32_t exynos4210_get_irq(uint32_t grp, uint32_t bit)
 /********* GIC part *********/
 
 #define TYPE_EXYNOS4210_GIC "exynos4210.gic"
+typedef struct Exynos4210GicState Exynos4210GicState;
 #define EXYNOS4210_GIC(obj) \
     OBJECT_CHECK(Exynos4210GicState, (obj), TYPE_EXYNOS4210_GIC)
 
-typedef struct {
+struct Exynos4210GicState {
     SysBusDevice parent_obj;
 
     MemoryRegion cpu_container;
@@ -276,7 +278,7 @@ typedef struct {
     MemoryRegion dist_alias[EXYNOS4210_NCPUS];
     uint32_t num_cpu;
     DeviceState *gic;
-} Exynos4210GicState;
+};
 
 static void exynos4210_gic_set_irq(void *opaque, int irq, int level)
 {
@@ -378,16 +380,17 @@ TYPE_INFO(exynos4210_gic_info)
  */
 
 #define TYPE_EXYNOS4210_IRQ_GATE "exynos4210.irq_gate"
+typedef struct Exynos4210IRQGateState Exynos4210IRQGateState;
 #define EXYNOS4210_IRQ_GATE(obj) \
     OBJECT_CHECK(Exynos4210IRQGateState, (obj), TYPE_EXYNOS4210_IRQ_GATE)
 
-typedef struct Exynos4210IRQGateState {
+struct Exynos4210IRQGateState {
     SysBusDevice parent_obj;
 
     uint32_t n_in;      /* inputs amount */
     uint32_t *level;    /* input levels */
     qemu_irq out;       /* output IRQ */
-} Exynos4210IRQGateState;
+};
 
 static Property exynos4210_irq_gate_properties[] = {
     DEFINE_PROP_UINT32("n_in", Exynos4210IRQGateState, n_in, 1),
diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index 1a3c846cee..734f3803cf 100644
--- a/hw/intc/grlib_irqmp.c
+++ b/hw/intc/grlib_irqmp.c
@@ -35,6 +35,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define IRQMP_MAX_CPU 16
 #define IRQMP_REG_SIZE 256      /* Size of memory mapped registers */
@@ -50,18 +51,19 @@
 #define FORCE_OFFSET     0x80
 #define EXTENDED_OFFSET  0xC0
 
+typedef struct IRQMP IRQMP;
 #define GRLIB_IRQMP(obj) OBJECT_CHECK(IRQMP, (obj), TYPE_GRLIB_IRQMP)
 
 typedef struct IRQMPState IRQMPState;
 
-typedef struct IRQMP {
+struct IRQMP {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
 
     IRQMPState *state;
     qemu_irq irq;
-} IRQMP;
+};
 
 struct IRQMPState {
     uint32_t level;
diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index a213683f44..cf69921d31 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -30,6 +30,7 @@
 #include "qemu/log.h"
 #include "hw/isa/i8259_internal.h"
 #include "trace.h"
+#include "qom/object.h"
 
 /* debug PIC */
 //#define DEBUG_PIC
@@ -37,6 +38,7 @@
 //#define DEBUG_IRQ_LATENCY
 
 #define TYPE_I8259 "isa-i8259"
+typedef struct PICClass PICClass;
 #define PIC_CLASS(class) OBJECT_CLASS_CHECK(PICClass, (class), TYPE_I8259)
 #define PIC_GET_CLASS(obj) OBJECT_GET_CLASS(PICClass, (obj), TYPE_I8259)
 
@@ -44,11 +46,11 @@
  * PICClass:
  * @parent_realize: The parent's realizefn.
  */
-typedef struct PICClass {
+struct PICClass {
     PICCommonClass parent_class;
 
     DeviceRealize parent_realize;
-} PICClass;
+};
 
 #ifdef DEBUG_IRQ_LATENCY
 static int64_t irq_time[16];
diff --git a/hw/intc/lm32_pic.c b/hw/intc/lm32_pic.c
index 2f609dc93f..ec6535d37b 100644
--- a/hw/intc/lm32_pic.c
+++ b/hw/intc/lm32_pic.c
@@ -27,8 +27,10 @@
 #include "hw/lm32/lm32_pic.h"
 #include "hw/intc/intc.h"
 #include "hw/irq.h"
+#include "qom/object.h"
 
 #define TYPE_LM32_PIC "lm32-pic"
+typedef struct LM32PicState LM32PicState;
 #define LM32_PIC(obj) OBJECT_CHECK(LM32PicState, (obj), TYPE_LM32_PIC)
 
 struct LM32PicState {
@@ -42,7 +44,6 @@ struct LM32PicState {
     /* statistics */
     uint64_t stats_irq_count[32];
 };
-typedef struct LM32PicState LM32PicState;
 
 static void update_irq(LM32PicState *s)
 {
diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
index 10e4c7278b..81b2672cd3 100644
--- a/hw/intc/loongson_liointc.c
+++ b/hw/intc/loongson_liointc.c
@@ -23,6 +23,7 @@
 #include "qemu/module.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 #define D(x)
 
diff --git a/hw/intc/nios2_iic.c b/hw/intc/nios2_iic.c
index 43abcd95aa..156139792e 100644
--- a/hw/intc/nios2_iic.c
+++ b/hw/intc/nios2_iic.c
@@ -25,16 +25,18 @@
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "cpu.h"
+#include "qom/object.h"
 
 #define TYPE_ALTERA_IIC "altera,iic"
+typedef struct AlteraIIC AlteraIIC;
 #define ALTERA_IIC(obj) \
     OBJECT_CHECK(AlteraIIC, (obj), TYPE_ALTERA_IIC)
 
-typedef struct AlteraIIC {
+struct AlteraIIC {
     SysBusDevice  parent_obj;
     void         *cpu;
     qemu_irq      parent_irq;
-} AlteraIIC;
+};
 
 static void update_irq(AlteraIIC *pv)
 {
diff --git a/hw/intc/ompic.c b/hw/intc/ompic.c
index d01b593cc4..8db109298f 100644
--- a/hw/intc/ompic.c
+++ b/hw/intc/ompic.c
@@ -15,8 +15,10 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "exec/memory.h"
+#include "qom/object.h"
 
 #define TYPE_OR1K_OMPIC "or1k-ompic"
+typedef struct OR1KOMPICState OR1KOMPICState;
 #define OR1K_OMPIC(obj) OBJECT_CHECK(OR1KOMPICState, (obj), TYPE_OR1K_OMPIC)
 
 #define OMPIC_CTRL_IRQ_ACK  (1 << 31)
@@ -37,7 +39,6 @@
 #define OMPIC_MAX_CPUS 4 /* Real max is much higher, but dont waste memory */
 #define OMPIC_ADDRSPACE_SZ (OMPIC_MAX_CPUS * 2 * 4) /* 2 32-bit regs per cpu */
 
-typedef struct OR1KOMPICState OR1KOMPICState;
 typedef struct OR1KOMPICCPUState OR1KOMPICCPUState;
 
 struct OR1KOMPICCPUState {
diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
index f0add3e3ee..0f67683b1a 100644
--- a/hw/intc/openpic_kvm.c
+++ b/hw/intc/openpic_kvm.c
@@ -35,13 +35,15 @@
 #include "sysemu/kvm.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define GCR_RESET        0x80000000
 
+typedef struct KVMOpenPICState KVMOpenPICState;
 #define KVM_OPENPIC(obj) \
     OBJECT_CHECK(KVMOpenPICState, (obj), TYPE_KVM_OPENPIC)
 
-typedef struct KVMOpenPICState {
+struct KVMOpenPICState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -51,7 +53,7 @@ typedef struct KVMOpenPICState {
     uint32_t fd;
     uint32_t model;
     hwaddr mapped;
-} KVMOpenPICState;
+};
 
 static void kvm_openpic_set_irq(void *opaque, int n_IRQ, int level)
 {
diff --git a/hw/intc/pl190.c b/hw/intc/pl190.c
index 5b237c0920..6fd0d6856b 100644
--- a/hw/intc/pl190.c
+++ b/hw/intc/pl190.c
@@ -13,6 +13,7 @@
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 /* The number of virtual priority levels.  16 user vectors plus the
    unvectored IRQ.  Chained interrupts would require an additional level
@@ -21,9 +22,10 @@
 #define PL190_NUM_PRIO 17
 
 #define TYPE_PL190 "pl190"
+typedef struct PL190State PL190State;
 #define PL190(obj) OBJECT_CHECK(PL190State, (obj), TYPE_PL190)
 
-typedef struct PL190State {
+struct PL190State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -41,7 +43,7 @@ typedef struct PL190State {
     int prev_prio[PL190_NUM_PRIO];
     qemu_irq irq;
     qemu_irq fiq;
-} PL190State;
+};
 
 static const unsigned char pl190_id[] =
 { 0x90, 0x11, 0x04, 0x00, 0x0D, 0xf0, 0x05, 0xb1 };
diff --git a/hw/intc/puv3_intc.c b/hw/intc/puv3_intc.c
index 3f43aea812..cf8b472639 100644
--- a/hw/intc/puv3_intc.c
+++ b/hw/intc/puv3_intc.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #undef DEBUG_PUV3
 #include "hw/unicore32/puv3.h"
@@ -19,9 +20,10 @@
 #include "qemu/log.h"
 
 #define TYPE_PUV3_INTC "puv3_intc"
+typedef struct PUV3INTCState PUV3INTCState;
 #define PUV3_INTC(obj) OBJECT_CHECK(PUV3INTCState, (obj), TYPE_PUV3_INTC)
 
-typedef struct PUV3INTCState {
+struct PUV3INTCState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -29,7 +31,7 @@ typedef struct PUV3INTCState {
 
     uint32_t reg_ICMR;
     uint32_t reg_ICPR;
-} PUV3INTCState;
+};
 
 /* Update interrupt status after enabled or pending bits have been changed.  */
 static void puv3_intc_update(PUV3INTCState *s)
diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
index a48adef68d..bac2ac3c13 100644
--- a/hw/intc/s390_flic_kvm.c
+++ b/hw/intc/s390_flic_kvm.c
@@ -24,6 +24,7 @@
 #include "hw/s390x/css.h"
 #include "migration/qemu-file-types.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define FLIC_SAVE_INITIAL_SIZE qemu_real_host_page_size
 #define FLIC_FAILED (-1UL)
@@ -569,10 +570,11 @@ static const VMStateDescription kvm_s390_flic_vmstate = {
     }
 };
 
-typedef struct KVMS390FLICStateClass {
+struct KVMS390FLICStateClass {
     S390FLICStateClass parent_class;
     DeviceRealize parent_realize;
-} KVMS390FLICStateClass;
+};
+typedef struct KVMS390FLICStateClass KVMS390FLICStateClass;
 
 #define KVM_S390_FLIC_GET_CLASS(obj) \
     OBJECT_GET_CLASS(KVMS390FLICStateClass, (obj), TYPE_KVM_S390_FLIC)
diff --git a/hw/intc/slavio_intctl.c b/hw/intc/slavio_intctl.c
index 65aea84cf3..890a55dbec 100644
--- a/hw/intc/slavio_intctl.c
+++ b/hw/intc/slavio_intctl.c
@@ -30,6 +30,7 @@
 #include "hw/intc/intc.h"
 #include "hw/irq.h"
 #include "trace.h"
+#include "qom/object.h"
 
 //#define DEBUG_IRQ_COUNT
 
@@ -58,10 +59,11 @@ typedef struct SLAVIO_CPUINTCTLState {
 } SLAVIO_CPUINTCTLState;
 
 #define TYPE_SLAVIO_INTCTL "slavio_intctl"
+typedef struct SLAVIO_INTCTLState SLAVIO_INTCTLState;
 #define SLAVIO_INTCTL(obj) \
     OBJECT_CHECK(SLAVIO_INTCTLState, (obj), TYPE_SLAVIO_INTCTL)
 
-typedef struct SLAVIO_INTCTLState {
+struct SLAVIO_INTCTLState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -73,7 +75,7 @@ typedef struct SLAVIO_INTCTLState {
     uint32_t intregm_pending;
     uint32_t intregm_disabled;
     uint32_t target_cpu;
-} SLAVIO_INTCTLState;
+};
 
 #define INTCTL_MAXADDR 0xf
 #define INTCTL_SIZE (INTCTL_MAXADDR + 1)
diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
index 4efd6297ca..66ce18955e 100644
--- a/hw/intc/xilinx_intc.c
+++ b/hw/intc/xilinx_intc.c
@@ -27,6 +27,7 @@
 #include "qemu/module.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 #define D(x)
 
diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
index 292836b379..71dfb046da 100644
--- a/hw/ipack/tpci200.c
+++ b/hw/ipack/tpci200.c
@@ -16,6 +16,7 @@
 #include "migration/vmstate.h"
 #include "qemu/bitops.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 /* #define DEBUG_TPCI */
 
@@ -54,7 +55,7 @@
 #define REG_STATUS    0x0C
 #define IP_N_FROM_REG(REG) ((REG) / 2 - 1)
 
-typedef struct {
+struct TPCI200State {
     PCIDevice dev;
     IPackBus bus;
     MemoryRegion mmio;
@@ -67,7 +68,8 @@ typedef struct {
     uint8_t ctrl[N_MODULES];
     uint16_t status;
     uint8_t int_set;
-} TPCI200State;
+};
+typedef struct TPCI200State TPCI200State;
 
 #define TYPE_TPCI200 "tpci200"
 
diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index 0d3dff02c4..bf9200ccb4 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -36,6 +36,7 @@
 #include "hw/ipmi/ipmi.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 #define VM_MSG_CHAR        0xA0 /* Marks end of message */
 #define VM_CMD_CHAR        0xA1 /* Marks end of a command */
@@ -61,9 +62,10 @@
 #define VM_CMD_GRACEFUL_SHUTDOWN   0x09
 
 #define TYPE_IPMI_BMC_EXTERN "ipmi-bmc-extern"
+typedef struct IPMIBmcExtern IPMIBmcExtern;
 #define IPMI_BMC_EXTERN(obj) OBJECT_CHECK(IPMIBmcExtern, (obj), \
                                         TYPE_IPMI_BMC_EXTERN)
-typedef struct IPMIBmcExtern {
+struct IPMIBmcExtern {
     IPMIBmc parent;
 
     CharBackend chr;
@@ -85,7 +87,7 @@ typedef struct IPMIBmcExtern {
 
     /* A reset event is pending to be sent upstream. */
     bool send_reset;
-} IPMIBmcExtern;
+};
 
 static unsigned char
 ipmb_checksum(const unsigned char *data, int size, unsigned char start)
diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index 389b4ece7f..f8a38cef74 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -31,18 +31,20 @@
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 #define TYPE_ISA_IPMI_BT "isa-ipmi-bt"
+typedef struct ISAIPMIBTDevice ISAIPMIBTDevice;
 #define ISA_IPMI_BT(obj) OBJECT_CHECK(ISAIPMIBTDevice, (obj), \
                                       TYPE_ISA_IPMI_BT)
 
-typedef struct ISAIPMIBTDevice {
+struct ISAIPMIBTDevice {
     ISADevice dev;
     int32_t isairq;
     qemu_irq irq;
     IPMIBT bt;
     uint32_t uuid;
-} ISAIPMIBTDevice;
+};
 
 static void isa_ipmi_bt_get_fwinfo(struct IPMIInterface *ii, IPMIFwInfo *info)
 {
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index 465aba5ac8..c2885bafee 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -31,18 +31,20 @@
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 #define TYPE_ISA_IPMI_KCS "isa-ipmi-kcs"
+typedef struct ISAIPMIKCSDevice ISAIPMIKCSDevice;
 #define ISA_IPMI_KCS(obj) OBJECT_CHECK(ISAIPMIKCSDevice, (obj), \
                                        TYPE_ISA_IPMI_KCS)
 
-typedef struct ISAIPMIKCSDevice {
+struct ISAIPMIKCSDevice {
     ISADevice dev;
     int32_t isairq;
     qemu_irq irq;
     IPMIKCS kcs;
     uint32_t uuid;
-} ISAIPMIKCSDevice;
+};
 
 static void isa_ipmi_kcs_get_fwinfo(IPMIInterface *ii, IPMIFwInfo *info)
 {
diff --git a/hw/ipmi/pci_ipmi_bt.c b/hw/ipmi/pci_ipmi_bt.c
index 4d20d36ed1..0a2a04b368 100644
--- a/hw/ipmi/pci_ipmi_bt.c
+++ b/hw/ipmi/pci_ipmi_bt.c
@@ -26,17 +26,19 @@
 #include "qapi/error.h"
 #include "hw/ipmi/ipmi_bt.h"
 #include "hw/pci/pci.h"
+#include "qom/object.h"
 
 #define TYPE_PCI_IPMI_BT "pci-ipmi-bt"
+typedef struct PCIIPMIBTDevice PCIIPMIBTDevice;
 #define PCI_IPMI_BT(obj) OBJECT_CHECK(PCIIPMIBTDevice, (obj), \
                                        TYPE_PCI_IPMI_BT)
 
-typedef struct PCIIPMIBTDevice {
+struct PCIIPMIBTDevice {
     PCIDevice dev;
     IPMIBT bt;
     bool irq_enabled;
     uint32_t uuid;
-} PCIIPMIBTDevice;
+};
 
 static void pci_ipmi_raise_irq(IPMIBT *ik)
 {
diff --git a/hw/ipmi/pci_ipmi_kcs.c b/hw/ipmi/pci_ipmi_kcs.c
index f3f4cee8f5..2bd5311200 100644
--- a/hw/ipmi/pci_ipmi_kcs.c
+++ b/hw/ipmi/pci_ipmi_kcs.c
@@ -26,17 +26,19 @@
 #include "qapi/error.h"
 #include "hw/ipmi/ipmi_kcs.h"
 #include "hw/pci/pci.h"
+#include "qom/object.h"
 
 #define TYPE_PCI_IPMI_KCS "pci-ipmi-kcs"
+typedef struct PCIIPMIKCSDevice PCIIPMIKCSDevice;
 #define PCI_IPMI_KCS(obj) OBJECT_CHECK(PCIIPMIKCSDevice, (obj), \
                                        TYPE_PCI_IPMI_KCS)
 
-typedef struct PCIIPMIKCSDevice {
+struct PCIIPMIKCSDevice {
     PCIDevice dev;
     IPMIKCS kcs;
     bool irq_enabled;
     uint32_t uuid;
-} PCIIPMIKCSDevice;
+};
 
 static void pci_ipmi_raise_irq(IPMIKCS *ik)
 {
diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
index dbfe949890..45636be1af 100644
--- a/hw/ipmi/smbus_ipmi.c
+++ b/hw/ipmi/smbus_ipmi.c
@@ -27,8 +27,10 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/ipmi/ipmi.h"
+#include "qom/object.h"
 
 #define TYPE_SMBUS_IPMI "smbus-ipmi"
+typedef struct SMBusIPMIDevice SMBusIPMIDevice;
 #define SMBUS_IPMI(obj) OBJECT_CHECK(SMBusIPMIDevice, (obj), TYPE_SMBUS_IPMI)
 
 #define SSIF_IPMI_REQUEST                       2
@@ -44,7 +46,7 @@
 
 #define IPMI_GET_SYS_INTF_CAP_CMD 0x57
 
-typedef struct SMBusIPMIDevice {
+struct SMBusIPMIDevice {
     SMBusDevice parent;
 
     IPMIBmc *bmc;
@@ -67,7 +69,7 @@ typedef struct SMBusIPMIDevice {
     uint8_t waiting_rsp;
 
     uint32_t uuid;
-} SMBusIPMIDevice;
+};
 
 static void smbus_ipmi_handle_event(IPMIInterface *ii)
 {
diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 2341e13bc3..e4f62d9d43 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -24,18 +24,20 @@
 #include "hw/timer/i8254.h"
 #include "migration/vmstate.h"
 #include "hw/audio/pcspk.h"
+#include "qom/object.h"
 
 #define TYPE_I82378 "i82378"
+typedef struct I82378State I82378State;
 #define I82378(obj) \
     OBJECT_CHECK(I82378State, (obj), TYPE_I82378)
 
-typedef struct I82378State {
+struct I82378State {
     PCIDevice parent_obj;
 
     qemu_irq out[2];
     qemu_irq *i8259;
     MemoryRegion io;
-} I82378State;
+};
 
 static const VMStateDescription vmstate_i82378 = {
     .name = "pci-i82378",
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 705c5c5567..95e2046773 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -38,10 +38,11 @@
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
+#include "qom/object.h"
 
 PCIDevice *piix4_dev;
 
-typedef struct PIIX4State {
+struct PIIX4State {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa;
@@ -50,7 +51,8 @@ typedef struct PIIX4State {
     /* Reset Control Register */
     MemoryRegion rcr_mem;
     uint8_t rcr;
-} PIIX4State;
+};
+typedef struct PIIX4State PIIX4State;
 
 #define PIIX4_PCI_DEVICE(obj) \
     OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 2b68111629..872fb6c62e 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -27,6 +27,7 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "exec/address-spaces.h"
+#include "qom/object.h"
 
 /* #define DEBUG_VT82C686B */
 
@@ -42,11 +43,12 @@ typedef struct SuperIOConfig {
     uint8_t data;
 } SuperIOConfig;
 
-typedef struct VT82C686BState {
+struct VT82C686BState {
     PCIDevice dev;
     MemoryRegion superio;
     SuperIOConfig superio_conf;
-} VT82C686BState;
+};
+typedef struct VT82C686BState VT82C686BState;
 
 #define TYPE_VT82C686B_DEVICE "VT82C686B"
 #define VT82C686B_DEVICE(obj) \
@@ -159,22 +161,25 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t address,
 
 #define ACPI_DBG_IO_ADDR  0xb044
 
-typedef struct VT686PMState {
+struct VT686PMState {
     PCIDevice dev;
     MemoryRegion io;
     ACPIREGS ar;
     APMState apm;
     PMSMBus smb;
     uint32_t smb_io_base;
-} VT686PMState;
+};
+typedef struct VT686PMState VT686PMState;
 
-typedef struct VT686AC97State {
+struct VT686AC97State {
     PCIDevice dev;
-} VT686AC97State;
+};
+typedef struct VT686AC97State VT686AC97State;
 
-typedef struct VT686MC97State {
+struct VT686MC97State {
     PCIDevice dev;
-} VT686MC97State;
+};
+typedef struct VT686MC97State VT686MC97State;
 
 #define TYPE_VT82C686B_PM_DEVICE "VT82C686B_PM"
 #define VT82C686B_PM_DEVICE(obj) \
diff --git a/hw/m68k/mcf_intc.c b/hw/m68k/mcf_intc.c
index e6e9d7c03e..cc3d4edc20 100644
--- a/hw/m68k/mcf_intc.c
+++ b/hw/m68k/mcf_intc.c
@@ -15,11 +15,13 @@
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "hw/m68k/mcf.h"
+#include "qom/object.h"
 
 #define TYPE_MCF_INTC "mcf-intc"
+typedef struct mcf_intc_state mcf_intc_state;
 #define MCF_INTC(obj) OBJECT_CHECK(mcf_intc_state, (obj), TYPE_MCF_INTC)
 
-typedef struct {
+struct mcf_intc_state {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -30,7 +32,7 @@ typedef struct {
     uint8_t icr[64];
     M68kCPU *cpu;
     int active_vector;
-} mcf_intc_state;
+};
 
 static void mcf_intc_update(mcf_intc_state *s)
 {
diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index e839765cb7..989f990e5e 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -21,6 +21,7 @@
 #include "hw/loader.h"
 #include "hw/scsi/esp.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 #include "hw/char/escc.h" /* ZILOG 8530 Serial Emulation */
 #include "hw/block/fdc.h"
 #include "hw/qdev-properties.h"
@@ -37,6 +38,7 @@
 #endif
 
 #define TYPE_NEXT_MACHINE MACHINE_TYPE_NAME("next-cube")
+typedef struct NeXTState NeXTState;
 #define NEXT_MACHINE(obj) OBJECT_CHECK(NeXTState, (obj), TYPE_NEXT_MACHINE)
 
 #define ENTRY       0x0100001e
@@ -69,7 +71,7 @@ typedef struct NextRtc {
     uint8_t retval;
 } NextRtc;
 
-typedef struct {
+struct NeXTState {
     MachineState parent;
 
     uint32_t int_mask;
@@ -87,7 +89,7 @@ typedef struct {
     uint32_t scr2;
 
     NextRtc rtc;
-} NeXTState;
+};
 
 /* Thanks to NeXT forums for this */
 /*
diff --git a/hw/m68k/next-kbd.c b/hw/m68k/next-kbd.c
index fc000ae694..955f28661e 100644
--- a/hw/m68k/next-kbd.c
+++ b/hw/m68k/next-kbd.c
@@ -36,7 +36,9 @@
 #include "ui/console.h"
 #include "sysemu/sysemu.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
+typedef struct NextKBDState NextKBDState;
 #define NEXTKBD(obj) OBJECT_CHECK(NextKBDState, (obj), TYPE_NEXTKBD)
 
 /* following defintions from next68k netbsd */
@@ -63,12 +65,12 @@ typedef struct {
 } KBDQueue;
 
 
-typedef struct NextKBDState {
+struct NextKBDState {
     SysBusDevice sbd;
     MemoryRegion mr;
     KBDQueue queue;
     uint16_t shift;
-} NextKBDState;
+};
 
 static void queue_code(void *opaque, int code);
 
diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index e025070a9b..7a1af64b0a 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -24,10 +24,12 @@
 
 #include "hw/intc/xlnx-zynqmp-ipi.h"
 #include "hw/intc/xlnx-pmu-iomod-intc.h"
+#include "qom/object.h"
 
 /* Define the PMU device */
 
 #define TYPE_XLNX_ZYNQMP_PMU_SOC "xlnx,zynqmp-pmu-soc"
+typedef struct XlnxZynqMPPMUSoCState XlnxZynqMPPMUSoCState;
 #define XLNX_ZYNQMP_PMU_SOC(obj) OBJECT_CHECK(XlnxZynqMPPMUSoCState, (obj), \
                                               TYPE_XLNX_ZYNQMP_PMU_SOC)
 
@@ -46,7 +48,7 @@ static const uint64_t ipi_irq[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
     19, 20, 21, 22,
 };
 
-typedef struct XlnxZynqMPPMUSoCState {
+struct XlnxZynqMPPMUSoCState {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -54,7 +56,7 @@ typedef struct XlnxZynqMPPMUSoCState {
     MicroBlazeCPU cpu;
     XlnxPMUIOIntc intc;
     XlnxZynqMPIPI ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
-}  XlnxZynqMPPMUSoCState;
+};
 
 
 static void xlnx_zynqmp_pmu_soc_init(Object *obj)
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 55deb9c74a..b09407217c 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -41,11 +41,13 @@
 #include "sysemu/runstate.h"
 
 #include <libfdt.h>
+#include "qom/object.h"
 
 #define TYPE_MIPS_BOSTON "mips-boston"
+typedef struct BostonState BostonState;
 #define BOSTON(obj) OBJECT_CHECK(BostonState, (obj), TYPE_MIPS_BOSTON)
 
-typedef struct {
+struct BostonState {
     SysBusDevice parent_obj;
 
     MachineState *mach;
@@ -58,7 +60,7 @@ typedef struct {
 
     hwaddr kernel_entry;
     hwaddr fdt_base;
-} BostonState;
+};
 
 enum boston_plat_reg {
     PLAT_FPGA_BUILD     = 0x00,
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 1a69c18e38..553f227c3b 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -35,6 +35,7 @@
 #include "hw/irq.h"
 #include "exec/address-spaces.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define GT_REGS                 (0x1000 >> 2)
 
@@ -230,10 +231,11 @@
 
 #define TYPE_GT64120_PCI_HOST_BRIDGE "gt64120"
 
+typedef struct GT64120State GT64120State;
 #define GT64120_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(GT64120State, (obj), TYPE_GT64120_PCI_HOST_BRIDGE)
 
-typedef struct GT64120State {
+struct GT64120State {
     PCIHostState parent_obj;
 
     uint32_t regs[GT_REGS];
@@ -243,7 +245,7 @@ typedef struct GT64120State {
     PCI_MAPPING_ENTRY(ISD);
     MemoryRegion pci0_mem;
     AddressSpace pci0_mem_as;
-} GT64120State;
+};
 
 /* Adjust range to avoid touching space which isn't mappable via PCI */
 /*
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 1c16bc6c0c..a6135503ab 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -45,6 +45,7 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "exec/address-spaces.h"
+#include "qom/object.h"
 #include "hw/sysbus.h"             /* SysBusDevice */
 #include "qemu/host-utils.h"
 #include "sysemu/qtest.h"
@@ -88,14 +89,15 @@ typedef struct {
 } MaltaFPGAState;
 
 #define TYPE_MIPS_MALTA "mips-malta"
+typedef struct MaltaState MaltaState;
 #define MIPS_MALTA(obj) OBJECT_CHECK(MaltaState, (obj), TYPE_MIPS_MALTA)
 
-typedef struct {
+struct MaltaState {
     SysBusDevice parent_obj;
 
     MIPSCPSState cps;
     qemu_irq i8259[ISA_NUM_IRQS];
-} MaltaState;
+};
 
 static struct _loaderparams {
     int ram_size, ram_low_size;
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 8eebd48f81..45c3a17919 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -36,6 +36,7 @@
 #include "ui/console.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 
 /* #define DEBUG_SMC */
 
@@ -89,9 +90,9 @@ struct AppleSMCData {
     QLIST_ENTRY(AppleSMCData) node;
 };
 
+typedef struct AppleSMCState AppleSMCState;
 #define APPLE_SMC(obj) OBJECT_CHECK(AppleSMCState, (obj), TYPE_APPLE_SMC)
 
-typedef struct AppleSMCState AppleSMCState;
 struct AppleSMCState {
     ISADevice parent_obj;
 
diff --git a/hw/misc/arm_integrator_debug.c b/hw/misc/arm_integrator_debug.c
index 71b1c3c117..b39fe10c6f 100644
--- a/hw/misc/arm_integrator_debug.c
+++ b/hw/misc/arm_integrator_debug.c
@@ -19,15 +19,17 @@
 #include "hw/misc/arm_integrator_debug.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
+typedef struct IntegratorDebugState IntegratorDebugState;
 #define INTEGRATOR_DEBUG(obj) \
     OBJECT_CHECK(IntegratorDebugState, (obj), TYPE_INTEGRATOR_DEBUG)
 
-typedef struct {
+struct IntegratorDebugState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
-} IntegratorDebugState;
+};
 
 static uint64_t intdbg_control_read(void *opaque, hwaddr offset,
                                     unsigned size)
diff --git a/hw/misc/arm_l2x0.c b/hw/misc/arm_l2x0.c
index d395a9f354..ff8e999beb 100644
--- a/hw/misc/arm_l2x0.c
+++ b/hw/misc/arm_l2x0.c
@@ -24,14 +24,16 @@
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 /* L2C-310 r3p2 */
 #define CACHE_ID 0x410000c8
 
 #define TYPE_ARM_L2X0 "l2x0"
+typedef struct L2x0State L2x0State;
 #define ARM_L2X0(obj) OBJECT_CHECK(L2x0State, (obj), TYPE_ARM_L2X0)
 
-typedef struct L2x0State {
+struct L2x0State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -42,7 +44,7 @@ typedef struct L2x0State {
     uint32_t tag_ctrl;
     uint32_t filter_start;
     uint32_t filter_end;
-} L2x0State;
+};
 
 static const VMStateDescription vmstate_l2x0 = {
     .name = "l2x0",
diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
index 3f3d61ebb1..b905d2d48a 100644
--- a/hw/misc/arm_sysctl.c
+++ b/hw/misc/arm_sysctl.c
@@ -18,14 +18,16 @@
 #include "hw/arm/primecell.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define LOCK_VALUE 0xa05f
 
 #define TYPE_ARM_SYSCTL "realview_sysctl"
+typedef struct arm_sysctl_state arm_sysctl_state;
 #define ARM_SYSCTL(obj) \
     OBJECT_CHECK(arm_sysctl_state, (obj), TYPE_ARM_SYSCTL)
 
-typedef struct {
+struct arm_sysctl_state {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -51,7 +53,7 @@ typedef struct {
     uint32_t *db_voltage;
     uint32_t db_num_clocks;
     uint32_t *db_clock_reset;
-} arm_sysctl_state;
+};
 
 static const VMStateDescription vmstate_arm_sysctl = {
     .name = "realview_sysctl",
diff --git a/hw/misc/debugexit.c b/hw/misc/debugexit.c
index e0f00d2a96..1aff146f5e 100644
--- a/hw/misc/debugexit.c
+++ b/hw/misc/debugexit.c
@@ -11,18 +11,20 @@
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define TYPE_ISA_DEBUG_EXIT_DEVICE "isa-debug-exit"
+typedef struct ISADebugExitState ISADebugExitState;
 #define ISA_DEBUG_EXIT_DEVICE(obj) \
      OBJECT_CHECK(ISADebugExitState, (obj), TYPE_ISA_DEBUG_EXIT_DEVICE)
 
-typedef struct ISADebugExitState {
+struct ISADebugExitState {
     ISADevice parent_obj;
 
     uint32_t iobase;
     uint32_t iosize;
     MemoryRegion io;
-} ISADebugExitState;
+};
 
 static uint64_t debug_exit_read(void *opaque, hwaddr addr, unsigned size)
 {
diff --git a/hw/misc/eccmemctl.c b/hw/misc/eccmemctl.c
index daf75f1335..e54c6abda8 100644
--- a/hw/misc/eccmemctl.c
+++ b/hw/misc/eccmemctl.c
@@ -29,6 +29,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qom/object.h"
 
 /* There are 3 versions of this chip used in SMP sun4m systems:
  * MCC (version 0, implementation 0) SS-600MP
@@ -126,9 +127,10 @@
 #define ECC_DIAG_MASK  (ECC_DIAG_SIZE - 1)
 
 #define TYPE_ECC_MEMCTL "eccmemctl"
+typedef struct ECCState ECCState;
 #define ECC_MEMCTL(obj) OBJECT_CHECK(ECCState, (obj), TYPE_ECC_MEMCTL)
 
-typedef struct ECCState {
+struct ECCState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem, iomem_diag;
@@ -136,7 +138,7 @@ typedef struct ECCState {
     uint32_t regs[ECC_NREGS];
     uint8_t diag[ECC_DIAG_SIZE];
     uint32_t version;
-} ECCState;
+};
 
 static void ecc_mem_write(void *opaque, hwaddr addr, uint64_t val,
                           unsigned size)
diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index ec617e63f3..2db9d63eeb 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -28,11 +28,13 @@
 #include "hw/hw.h"
 #include "hw/pci/msi.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 #include "qemu/main-loop.h" /* iothread mutex */
 #include "qemu/module.h"
 #include "qapi/visitor.h"
 
 #define TYPE_PCI_EDU_DEVICE "edu"
+typedef struct EduState EduState;
 #define EDU(obj)        OBJECT_CHECK(EduState, obj, TYPE_PCI_EDU_DEVICE)
 
 #define FACT_IRQ        0x00000001
@@ -41,7 +43,7 @@
 #define DMA_START       0x40000
 #define DMA_SIZE        4096
 
-typedef struct {
+struct EduState {
     PCIDevice pdev;
     MemoryRegion mmio;
 
@@ -72,7 +74,7 @@ typedef struct {
     QEMUTimer dma_timer;
     char dma_buf[DMA_SIZE];
     uint64_t dma_mask;
-} EduState;
+};
 
 static bool edu_msi_enabled(EduState *edu)
 {
diff --git a/hw/misc/empty_slot.c b/hw/misc/empty_slot.c
index d1736d784d..50cfd0e871 100644
--- a/hw/misc/empty_slot.c
+++ b/hw/misc/empty_slot.c
@@ -15,17 +15,19 @@
 #include "hw/misc/empty_slot.h"
 #include "qapi/error.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define TYPE_EMPTY_SLOT "empty_slot"
+typedef struct EmptySlot EmptySlot;
 #define EMPTY_SLOT(obj) OBJECT_CHECK(EmptySlot, (obj), TYPE_EMPTY_SLOT)
 
-typedef struct EmptySlot {
+struct EmptySlot {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
     char *name;
     uint64_t size;
-} EmptySlot;
+};
 
 static uint64_t empty_slot_read(void *opaque, hwaddr addr,
                                 unsigned size)
diff --git a/hw/misc/exynos4210_clk.c b/hw/misc/exynos4210_clk.c
index da18bc974c..f84008d4d8 100644
--- a/hw/misc/exynos4210_clk.c
+++ b/hw/misc/exynos4210_clk.c
@@ -22,8 +22,10 @@
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define TYPE_EXYNOS4210_CLK             "exynos4210.clk"
+typedef struct Exynos4210ClkState Exynos4210ClkState;
 #define EXYNOS4210_CLK(obj) \
     OBJECT_CHECK(Exynos4210ClkState, (obj), TYPE_EXYNOS4210_CLK)
 
@@ -55,12 +57,12 @@ static const Exynos4210Reg exynos4210_clk_regs[] = {
 
 #define EXYNOS4210_REGS_NUM       ARRAY_SIZE(exynos4210_clk_regs)
 
-typedef struct Exynos4210ClkState {
+struct Exynos4210ClkState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
     uint32_t reg[EXYNOS4210_REGS_NUM];
-} Exynos4210ClkState;
+};
 
 static uint64_t exynos4210_clk_read(void *opaque, hwaddr offset,
                                     unsigned size)
diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
index 12ce99969c..8f6081e5cc 100644
--- a/hw/misc/exynos4210_pmu.c
+++ b/hw/misc/exynos4210_pmu.c
@@ -29,6 +29,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
+#include "qom/object.h"
 
 #ifndef DEBUG_PMU
 #define DEBUG_PMU           0
@@ -394,15 +395,16 @@ static const Exynos4210PmuReg exynos4210_pmu_regs[] = {
 #define PMU_NUM_OF_REGISTERS ARRAY_SIZE(exynos4210_pmu_regs)
 
 #define TYPE_EXYNOS4210_PMU "exynos4210.pmu"
+typedef struct Exynos4210PmuState Exynos4210PmuState;
 #define EXYNOS4210_PMU(obj) \
     OBJECT_CHECK(Exynos4210PmuState, (obj), TYPE_EXYNOS4210_PMU)
 
-typedef struct Exynos4210PmuState {
+struct Exynos4210PmuState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
     uint32_t reg[PMU_NUM_OF_REGISTERS];
-} Exynos4210PmuState;
+};
 
 static void exynos4210_pmu_poweroff(void)
 {
diff --git a/hw/misc/exynos4210_rng.c b/hw/misc/exynos4210_rng.c
index b4938fe848..620b6a867b 100644
--- a/hw/misc/exynos4210_rng.c
+++ b/hw/misc/exynos4210_rng.c
@@ -24,6 +24,7 @@
 #include "qemu/log.h"
 #include "qemu/guest-random.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define DEBUG_EXYNOS_RNG 0
 
@@ -35,6 +36,7 @@
     } while (0)
 
 #define TYPE_EXYNOS4210_RNG             "exynos4210.rng"
+typedef struct Exynos4210RngState Exynos4210RngState;
 #define EXYNOS4210_RNG(obj) \
     OBJECT_CHECK(Exynos4210RngState, (obj), TYPE_EXYNOS4210_RNG)
 
@@ -68,7 +70,7 @@
 
 #define EXYNOS4210_RNG_REGS_MEM_SIZE            0x200
 
-typedef struct Exynos4210RngState {
+struct Exynos4210RngState {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
 
@@ -79,7 +81,7 @@ typedef struct Exynos4210RngState {
     /* Register values */
     uint32_t reg_control;
     uint32_t reg_status;
-} Exynos4210RngState;
+};
 
 static bool exynos4210_rng_seed_ready(const Exynos4210RngState *s)
 {
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index e61062a2ed..890cd9445d 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -38,6 +38,7 @@
 #include "qapi/visitor.h"
 
 #include "hw/misc/ivshmem.h"
+#include "qom/object.h"
 
 #define PCI_VENDOR_ID_IVSHMEM   PCI_VENDOR_ID_REDHAT_QUMRANET
 #define PCI_DEVICE_ID_IVSHMEM   0x1110
@@ -57,6 +58,7 @@
     } while (0)
 
 #define TYPE_IVSHMEM_COMMON "ivshmem-common"
+typedef struct IVShmemState IVShmemState;
 #define IVSHMEM_COMMON(obj) \
     OBJECT_CHECK(IVShmemState, (obj), TYPE_IVSHMEM_COMMON)
 
@@ -83,7 +85,7 @@ typedef struct MSIVector {
     bool unmasked;
 } MSIVector;
 
-typedef struct IVShmemState {
+struct IVShmemState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -115,7 +117,7 @@ typedef struct IVShmemState {
     /* migration stuff */
     OnOffAuto master;
     Error *migration_blocker;
-} IVShmemState;
+};
 
 /* registers for the Inter-VM shared memory device */
 enum ivshmem_registers {
diff --git a/hw/misc/milkymist-hpdmc.c b/hw/misc/milkymist-hpdmc.c
index bb21fd7a4b..64e226e5f9 100644
--- a/hw/misc/milkymist-hpdmc.c
+++ b/hw/misc/milkymist-hpdmc.c
@@ -27,6 +27,7 @@
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 enum {
     R_SYSTEM = 0,
@@ -43,6 +44,7 @@ enum {
 };
 
 #define TYPE_MILKYMIST_HPDMC "milkymist-hpdmc"
+typedef struct MilkymistHpdmcState MilkymistHpdmcState;
 #define MILKYMIST_HPDMC(obj) \
     OBJECT_CHECK(MilkymistHpdmcState, (obj), TYPE_MILKYMIST_HPDMC)
 
@@ -53,7 +55,6 @@ struct MilkymistHpdmcState {
 
     uint32_t regs[R_MAX];
 };
-typedef struct MilkymistHpdmcState MilkymistHpdmcState;
 
 static uint64_t hpdmc_read(void *opaque, hwaddr addr,
                            unsigned size)
diff --git a/hw/misc/milkymist-pfpu.c b/hw/misc/milkymist-pfpu.c
index f78de71df4..43b85b88fc 100644
--- a/hw/misc/milkymist-pfpu.c
+++ b/hw/misc/milkymist-pfpu.c
@@ -31,6 +31,7 @@
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include <math.h>
+#include "qom/object.h"
 
 /* #define TRACE_EXEC */
 
@@ -120,6 +121,7 @@ static const char *opcode_to_str[] = {
 #endif
 
 #define TYPE_MILKYMIST_PFPU "milkymist-pfpu"
+typedef struct MilkymistPFPUState MilkymistPFPUState;
 #define MILKYMIST_PFPU(obj) \
     OBJECT_CHECK(MilkymistPFPUState, (obj), TYPE_MILKYMIST_PFPU)
 
@@ -137,7 +139,6 @@ struct MilkymistPFPUState {
     int output_queue_pos;
     uint32_t output_queue[MAX_LATENCY];
 };
-typedef struct MilkymistPFPUState MilkymistPFPUState;
 
 static inline uint32_t
 get_dma_address(uint32_t base, uint32_t x, uint32_t y)
diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c
index fc4100e1b5..5a5c7e814a 100644
--- a/hw/misc/mst_fpga.c
+++ b/hw/misc/mst_fpga.c
@@ -16,6 +16,7 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 /* Mainstone FPGA for extern irqs */
 #define FPGA_GPIO_PIN	0
@@ -40,10 +41,11 @@
 #define MST_PCMCIA_CD1_IRQ	13
 
 #define TYPE_MAINSTONE_FPGA "mainstone-fpga"
+typedef struct mst_irq_state mst_irq_state;
 #define MAINSTONE_FPGA(obj) \
     OBJECT_CHECK(mst_irq_state, (obj), TYPE_MAINSTONE_FPGA)
 
-typedef struct mst_irq_state{
+struct mst_irq_state {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -63,7 +65,7 @@ typedef struct mst_irq_state{
     uint32_t intsetclr;
     uint32_t pcmcia0;
     uint32_t pcmcia1;
-}mst_irq_state;
+};
 
 static void
 mst_fpga_set_irq(void *opaque, int irq, int level)
diff --git a/hw/misc/pc-testdev.c b/hw/misc/pc-testdev.c
index 9d5a17f747..275740762e 100644
--- a/hw/misc/pc-testdev.c
+++ b/hw/misc/pc-testdev.c
@@ -39,10 +39,11 @@
 #include "qemu/module.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
+#include "qom/object.h"
 
 #define IOMEM_LEN    0x10000
 
-typedef struct PCTestdev {
+struct PCTestdev {
     ISADevice parent_obj;
 
     MemoryRegion ioport;
@@ -52,7 +53,8 @@ typedef struct PCTestdev {
     MemoryRegion iomem;
     uint32_t ioport_data;
     char iomem_buf[IOMEM_LEN];
-} PCTestdev;
+};
+typedef struct PCTestdev PCTestdev;
 
 #define TYPE_TESTDEV "pc-testdev"
 #define TESTDEV(obj) \
diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index 60f73dd257..597c390639 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -22,15 +22,17 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "trace.h"
+#include "qom/object.h"
 
-typedef struct PCA955xClass {
+struct PCA955xClass {
     /*< private >*/
     I2CSlaveClass parent_class;
     /*< public >*/
 
     uint8_t pin_count;
     uint8_t max_reg;
-} PCA955xClass;
+};
+typedef struct PCA955xClass PCA955xClass;
 
 #define PCA955X_CLASS(klass) \
     OBJECT_CLASS_CHECK(PCA955xClass, (klass), TYPE_PCA955X)
diff --git a/hw/misc/pci-testdev.c b/hw/misc/pci-testdev.c
index 1b0aba0429..9e524507f2 100644
--- a/hw/misc/pci-testdev.c
+++ b/hw/misc/pci-testdev.c
@@ -24,6 +24,7 @@
 #include "qemu/event_notifier.h"
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
+#include "qom/object.h"
 
 typedef struct PCITestDevHdr {
     uint8_t test;
@@ -78,7 +79,7 @@ enum {
 #define IOTEST_ACCESS_TYPE uint8_t
 #define IOTEST_ACCESS_WIDTH (sizeof(uint8_t))
 
-typedef struct PCITestDevState {
+struct PCITestDevState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -90,7 +91,8 @@ typedef struct PCITestDevState {
 
     uint64_t membar_size;
     MemoryRegion membar;
-} PCITestDevState;
+};
+typedef struct PCITestDevState PCITestDevState;
 
 #define TYPE_PCI_TEST_DEV "pci-testdev"
 
diff --git a/hw/misc/puv3_pm.c b/hw/misc/puv3_pm.c
index 8cc3d44efa..811424a1a7 100644
--- a/hw/misc/puv3_pm.c
+++ b/hw/misc/puv3_pm.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #undef DEBUG_PUV3
 #include "hw/unicore32/puv3.h"
@@ -18,9 +19,10 @@
 #include "qemu/log.h"
 
 #define TYPE_PUV3_PM "puv3_pm"
+typedef struct PUV3PMState PUV3PMState;
 #define PUV3_PM(obj) OBJECT_CHECK(PUV3PMState, (obj), TYPE_PUV3_PM)
 
-typedef struct PUV3PMState {
+struct PUV3PMState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -31,7 +33,7 @@ typedef struct PUV3PMState {
     uint32_t reg_PLL_DDR_CFG;
     uint32_t reg_PLL_VGA_CFG;
     uint32_t reg_DIVCFG;
-} PUV3PMState;
+};
 
 static uint64_t puv3_pm_read(void *opaque, hwaddr offset,
         unsigned size)
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 98ce4e3289..be2ab91832 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -20,6 +20,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "hw/qdev-properties.h"
 #include "hw/misc/pvpanic.h"
+#include "qom/object.h"
 
 /* The bit of supported pv event, TODO: include uapi header and remove this */
 #define PVPANIC_F_PANICKED      0
@@ -29,6 +30,7 @@
 #define PVPANIC_PANICKED        (1 << PVPANIC_F_PANICKED)
 #define PVPANIC_CRASHLOADED     (1 << PVPANIC_F_CRASHLOADED)
 
+typedef struct PVPanicState PVPanicState;
 #define ISA_PVPANIC_DEVICE(obj)    \
     OBJECT_CHECK(PVPanicState, (obj), TYPE_PVPANIC)
 
@@ -54,12 +56,12 @@ static void handle_event(int event)
 
 #include "hw/isa/isa.h"
 
-typedef struct PVPanicState {
+struct PVPanicState {
     ISADevice parent_obj;
 
     MemoryRegion io;
     uint16_t ioport;
-} PVPanicState;
+};
 
 /* return supported events on read */
 static uint64_t pvpanic_ioport_read(void *opaque, hwaddr addr, unsigned size)
diff --git a/hw/misc/sga.c b/hw/misc/sga.c
index c1a5625d6a..a2167a9a97 100644
--- a/hw/misc/sga.c
+++ b/hw/misc/sga.c
@@ -29,15 +29,17 @@
 #include "hw/isa/isa.h"
 #include "hw/loader.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define SGABIOS_FILENAME "sgabios.bin"
 
 #define TYPE_SGA "sga"
+typedef struct ISASGAState ISASGAState;
 #define SGA(obj) OBJECT_CHECK(ISASGAState, (obj), TYPE_SGA)
 
-typedef struct ISASGAState {
+struct ISASGAState {
     ISADevice parent_obj;
-} ISASGAState;
+};
 
 static void sga_realizefn(DeviceState *dev, Error **errp)
 {
diff --git a/hw/misc/slavio_misc.c b/hw/misc/slavio_misc.c
index 41be8d7598..ee735137de 100644
--- a/hw/misc/slavio_misc.c
+++ b/hw/misc/slavio_misc.c
@@ -29,6 +29,7 @@
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
 #include "trace.h"
+#include "qom/object.h"
 
 /*
  * This is the auxio port, chip control and system control part of
@@ -39,9 +40,10 @@
  */
 
 #define TYPE_SLAVIO_MISC "slavio_misc"
+typedef struct MiscState MiscState;
 #define SLAVIO_MISC(obj) OBJECT_CHECK(MiscState, (obj), TYPE_SLAVIO_MISC)
 
-typedef struct MiscState {
+struct MiscState {
     SysBusDevice parent_obj;
 
     MemoryRegion cfg_iomem;
@@ -59,17 +61,18 @@ typedef struct MiscState {
     uint8_t diag, mctrl;
     uint8_t sysctrl;
     uint16_t leds;
-} MiscState;
+};
 
 #define TYPE_APC "apc"
+typedef struct APCState APCState;
 #define APC(obj) OBJECT_CHECK(APCState, (obj), TYPE_APC)
 
-typedef struct APCState {
+struct APCState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
     qemu_irq cpu_halt;
-} APCState;
+};
 
 #define MISC_SIZE 1
 #define LED_SIZE 2
diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
index 7ae88322b7..19026b3662 100644
--- a/hw/misc/tmp421.c
+++ b/hw/misc/tmp421.c
@@ -30,6 +30,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 /* Manufacturer / Device ID's */
 #define TMP421_MANUFACTURER_ID          0x55
@@ -48,7 +49,7 @@ static const DeviceInfo devices[] = {
     { TMP423_DEVICE_ID, "tmp423" },
 };
 
-typedef struct TMP421State {
+struct TMP421State {
     /*< private >*/
     I2CSlave i2c;
     /*< public >*/
@@ -63,12 +64,14 @@ typedef struct TMP421State {
     uint8_t buf[2];
     uint8_t pointer;
 
-} TMP421State;
+};
+typedef struct TMP421State TMP421State;
 
-typedef struct TMP421Class {
+struct TMP421Class {
     I2CSlaveClass parent_class;
     DeviceInfo *dev;
-} TMP421Class;
+};
+typedef struct TMP421Class TMP421Class;
 
 #define TYPE_TMP421 "tmp421-generic"
 #define TMP421(obj) OBJECT_CHECK(TMP421State, (obj), TYPE_TMP421)
diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index 51d14a29a1..ed7edbafcc 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -23,6 +23,7 @@
 #include "qemu/module.h"
 #include "hw/registerfields.h"
 #include "hw/qdev-clock.h"
+#include "qom/object.h"
 
 #ifndef ZYNQ_SLCR_ERR_DEBUG
 #define ZYNQ_SLCR_ERR_DEBUG 0
@@ -182,9 +183,10 @@ REG32(DDRIOB, 0xb40)
 #define ZYNQ_SLCR_NUM_REGS      (ZYNQ_SLCR_MMIO_SIZE / 4)
 
 #define TYPE_ZYNQ_SLCR "xilinx,zynq_slcr"
+typedef struct ZynqSLCRState ZynqSLCRState;
 #define ZYNQ_SLCR(obj) OBJECT_CHECK(ZynqSLCRState, (obj), TYPE_ZYNQ_SLCR)
 
-typedef struct ZynqSLCRState {
+struct ZynqSLCRState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -194,7 +196,7 @@ typedef struct ZynqSLCRState {
     Clock *ps_clk;
     Clock *uart0_ref_clk;
     Clock *uart1_ref_clk;
-} ZynqSLCRState;
+};
 
 /*
  * return the output frequency of ARM/DDR/IO pll
diff --git a/hw/net/can/can_kvaser_pci.c b/hw/net/can/can_kvaser_pci.c
index ae35e51434..52fa81d76d 100644
--- a/hw/net/can/can_kvaser_pci.c
+++ b/hw/net/can/can_kvaser_pci.c
@@ -43,9 +43,11 @@
 #include "net/can_emu.h"
 
 #include "can_sja1000.h"
+#include "qom/object.h"
 
 #define TYPE_CAN_PCI_DEV "kvaser_pci"
 
+typedef struct KvaserPCIState KvaserPCIState;
 #define KVASER_PCI_DEV(obj) \
     OBJECT_CHECK(KvaserPCIState, (obj), TYPE_CAN_PCI_DEV)
 
@@ -78,7 +80,7 @@
 
 #define KVASER_PCI_XILINX_VERSION_NUMBER 13
 
-typedef struct KvaserPCIState {
+struct KvaserPCIState {
     /*< private >*/
     PCIDevice       dev;
     /*< public >*/
@@ -93,7 +95,7 @@ typedef struct KvaserPCIState {
     uint32_t        s5920_irqstate;
 
     CanBusState     *canbus;
-} KvaserPCIState;
+};
 
 static void kvaser_pci_irq_handler(void *opaque, int irq_num, int level)
 {
diff --git a/hw/net/can/can_mioe3680_pci.c b/hw/net/can/can_mioe3680_pci.c
index 271f44d5af..28cbfb79ec 100644
--- a/hw/net/can/can_mioe3680_pci.c
+++ b/hw/net/can/can_mioe3680_pci.c
@@ -39,9 +39,11 @@
 #include "net/can_emu.h"
 
 #include "can_sja1000.h"
+#include "qom/object.h"
 
 #define TYPE_CAN_PCI_DEV "mioe3680_pci"
 
+typedef struct Mioe3680PCIState Mioe3680PCIState;
 #define MIOe3680_PCI_DEV(obj) \
     OBJECT_CHECK(Mioe3680PCIState, (obj), TYPE_CAN_PCI_DEV)
 
@@ -59,7 +61,7 @@
 
 #define MIOe3680_PCI_BYTES_PER_SJA 0x80
 
-typedef struct Mioe3680PCIState {
+struct Mioe3680PCIState {
     /*< private >*/
     PCIDevice       dev;
     /*< public >*/
@@ -70,7 +72,7 @@ typedef struct Mioe3680PCIState {
 
     char            *model; /* The model that support, only SJA1000 now. */
     CanBusState     *canbus[MIOe3680_PCI_SJA_COUNT];
-} Mioe3680PCIState;
+};
 
 static void mioe3680_pci_reset(DeviceState *dev)
 {
diff --git a/hw/net/can/can_pcm3680_pci.c b/hw/net/can/can_pcm3680_pci.c
index e3173a6f1c..aeaebd3562 100644
--- a/hw/net/can/can_pcm3680_pci.c
+++ b/hw/net/can/can_pcm3680_pci.c
@@ -39,9 +39,11 @@
 #include "net/can_emu.h"
 
 #include "can_sja1000.h"
+#include "qom/object.h"
 
 #define TYPE_CAN_PCI_DEV "pcm3680_pci"
 
+typedef struct Pcm3680iPCIState Pcm3680iPCIState;
 #define PCM3680i_PCI_DEV(obj) \
     OBJECT_CHECK(Pcm3680iPCIState, (obj), TYPE_CAN_PCI_DEV)
 
@@ -59,7 +61,7 @@
 
 #define PCM3680i_PCI_BYTES_PER_SJA 0x20
 
-typedef struct Pcm3680iPCIState {
+struct Pcm3680iPCIState {
     /*< private >*/
     PCIDevice       dev;
     /*< public >*/
@@ -70,7 +72,7 @@ typedef struct Pcm3680iPCIState {
 
     char            *model; /* The model that support, only SJA1000 now. */
     CanBusState     *canbus[PCM3680i_PCI_SJA_COUNT];
-} Pcm3680iPCIState;
+};
 
 static void pcm3680i_pci_reset(DeviceState *dev)
 {
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 86bb2b6529..e20780d0ae 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -27,6 +27,7 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include <zlib.h>
+#include "qom/object.h"
 
 //#define DEBUG_SONIC
 
@@ -150,9 +151,10 @@ do { printf("sonic ERROR: %s: " fmt, __func__ , ## __VA_ARGS__); } while (0)
 #define SONIC_DESC_ADDR  0xFFFE
 
 #define TYPE_DP8393X "dp8393x"
+typedef struct dp8393xState dp8393xState;
 #define DP8393X(obj) OBJECT_CHECK(dp8393xState, (obj), TYPE_DP8393X)
 
-typedef struct dp8393xState {
+struct dp8393xState {
     SysBusDevice parent_obj;
 
     /* Hardware */
@@ -182,7 +184,7 @@ typedef struct dp8393xState {
     /* Memory access */
     MemoryRegion *dma_mr;
     AddressSpace as;
-} dp8393xState;
+};
 
 /* Accessor functions for values which are formed by
  * concatenating two 16 bit device registers. By putting these
diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index ce0540face..2ec24acad3 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -39,6 +39,7 @@
 
 #include "e1000x_common.h"
 #include "trace.h"
+#include "qom/object.h"
 
 static const uint8_t bcast[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
@@ -76,7 +77,7 @@ static int debugflags = DBGBIT(TXERR) | DBGBIT(GENERAL);
  *  Others never tested
  */
 
-typedef struct E1000State_st {
+struct E1000State_st {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -137,14 +138,16 @@ typedef struct E1000State_st {
     bool received_tx_tso;
     bool use_tso_for_migration;
     e1000x_txd_props mig_props;
-} E1000State;
+};
+typedef struct E1000State_st E1000State;
 
 #define chkflag(x)     (s->compat_flags & E1000_FLAG_##x)
 
-typedef struct E1000BaseClass {
+struct E1000BaseClass {
     PCIDeviceClass parent_class;
     uint16_t phy_id2;
-} E1000BaseClass;
+};
+typedef struct E1000BaseClass E1000BaseClass;
 
 #define TYPE_E1000_BASE "e1000-base"
 
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index b955f76869..2bbefc89de 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -53,11 +53,13 @@
 
 #include "trace.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 
 #define TYPE_E1000E "e1000e"
+typedef struct E1000EState E1000EState;
 #define E1000E(obj) OBJECT_CHECK(E1000EState, (obj), TYPE_E1000E)
 
-typedef struct E1000EState {
+struct E1000EState {
     PCIDevice parent_obj;
     NICState *nic;
     NICConf conf;
@@ -79,7 +81,7 @@ typedef struct E1000EState {
 
     E1000ECore core;
 
-} E1000EState;
+};
 
 #define E1000E_MMIO_IDX     0
 #define E1000E_FLASH_IDX    1
diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index d7712e2924..ca5e5dd805 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -30,6 +30,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define D(x)
 
@@ -323,11 +324,11 @@ static void mdio_cycle(struct qemu_mdio *bus)
 #define FS_ETH_MAX_REGS      0x17
 
 #define TYPE_ETRAX_FS_ETH "etraxfs-eth"
+typedef struct ETRAXFSEthState ETRAXFSEthState;
 #define ETRAX_FS_ETH(obj) \
     OBJECT_CHECK(ETRAXFSEthState, (obj), TYPE_ETRAX_FS_ETH)
 
-typedef struct ETRAXFSEthState
-{
+struct ETRAXFSEthState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
@@ -348,7 +349,7 @@ typedef struct ETRAXFSEthState
 
     /* PHY.     */
     struct qemu_phy phy;
-} ETRAXFSEthState;
+};
 
 static void eth_validate_duplex(ETRAXFSEthState *eth)
 {
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 32cee7b116..4eb9f68200 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -25,6 +25,7 @@
 #include "qemu/module.h"
 /* For crc32 */
 #include <zlib.h>
+#include "qom/object.h"
 
 //#define DEBUG_LAN9118
 
@@ -180,9 +181,10 @@ static const VMStateDescription vmstate_lan9118_packet = {
     }
 };
 
+typedef struct lan9118_state lan9118_state;
 #define LAN9118(obj) OBJECT_CHECK(lan9118_state, (obj), TYPE_LAN9118)
 
-typedef struct {
+struct lan9118_state {
     SysBusDevice parent_obj;
 
     NICState *nic;
@@ -258,7 +260,7 @@ typedef struct {
     uint32_t read_long;
 
     uint32_t mode_16bit;
-} lan9118_state;
+};
 
 static const VMStateDescription vmstate_lan9118 = {
     .name = "lan9118",
diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index c1531a8637..e042970ba6 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 #include "cpu.h" /* FIXME: why does this use TARGET_PAGE_ALIGN? */
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
@@ -98,6 +99,7 @@ struct MilkymistMinimac2MdioState {
 typedef struct MilkymistMinimac2MdioState MilkymistMinimac2MdioState;
 
 #define TYPE_MILKYMIST_MINIMAC2 "milkymist-minimac2"
+typedef struct MilkymistMinimac2State MilkymistMinimac2State;
 #define MILKYMIST_MINIMAC2(obj) \
     OBJECT_CHECK(MilkymistMinimac2State, (obj), TYPE_MILKYMIST_MINIMAC2)
 
@@ -123,7 +125,6 @@ struct MilkymistMinimac2State {
     uint8_t *rx1_buf;
     uint8_t *tx_buf;
 };
-typedef struct MilkymistMinimac2State MilkymistMinimac2State;
 
 static const uint8_t preamble_sfd[] = {
         0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0xd5
diff --git a/hw/net/mipsnet.c b/hw/net/mipsnet.c
index 137a964795..f58f3f83bd 100644
--- a/hw/net/mipsnet.c
+++ b/hw/net/mipsnet.c
@@ -6,6 +6,7 @@
 #include "trace.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 /* MIPSnet register offsets */
 
@@ -24,9 +25,10 @@
 #define MAX_ETH_FRAME_SIZE      1514
 
 #define TYPE_MIPS_NET "mipsnet"
+typedef struct MIPSnetState MIPSnetState;
 #define MIPS_NET(obj) OBJECT_CHECK(MIPSnetState, (obj), TYPE_MIPS_NET)
 
-typedef struct MIPSnetState {
+struct MIPSnetState {
     SysBusDevice parent_obj;
 
     uint32_t busy;
@@ -41,7 +43,7 @@ typedef struct MIPSnetState {
     qemu_irq irq;
     NICState *nic;
     NICConf conf;
-} MIPSnetState;
+};
 
 static void mipsnet_reset(MIPSnetState *s)
 {
diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
index 8d1fa0fc32..aa20a0d702 100644
--- a/hw/net/ne2000-isa.c
+++ b/hw/net/ne2000-isa.c
@@ -31,16 +31,18 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
+typedef struct ISANE2000State ISANE2000State;
 #define ISA_NE2000(obj) OBJECT_CHECK(ISANE2000State, (obj), TYPE_ISA_NE2000)
 
-typedef struct ISANE2000State {
+struct ISANE2000State {
     ISADevice parent_obj;
 
     uint32_t iobase;
     uint32_t isairq;
     NE2000State ne2000;
-} ISANE2000State;
+};
 
 static NetClientInfo net_ne2000_isa_info = {
     .type = NET_CLIENT_DRIVER_NIC,
diff --git a/hw/net/opencores_eth.c b/hw/net/opencores_eth.c
index 8ef1197157..f92008c3d1 100644
--- a/hw/net/opencores_eth.c
+++ b/hw/net/opencores_eth.c
@@ -40,6 +40,7 @@
 #include "qemu/module.h"
 #include "net/eth.h"
 #include "trace.h"
+#include "qom/object.h"
 
 /* RECSMALL is not used because it breaks tap networking in linux:
  * incoming ARP responses are too short
@@ -271,9 +272,10 @@ typedef struct desc {
 #define DEFAULT_PHY 1
 
 #define TYPE_OPEN_ETH "open_eth"
+typedef struct OpenEthState OpenEthState;
 #define OPEN_ETH(obj) OBJECT_CHECK(OpenEthState, (obj), TYPE_OPEN_ETH)
 
-typedef struct OpenEthState {
+struct OpenEthState {
     SysBusDevice parent_obj;
 
     NICState *nic;
@@ -287,7 +289,7 @@ typedef struct OpenEthState {
     unsigned tx_desc;
     unsigned rx_desc;
     desc desc[128];
-} OpenEthState;
+};
 
 static desc *rx_desc(OpenEthState *s)
 {
diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
index aba8f19048..bc553e3c4a 100644
--- a/hw/net/pcnet-pci.c
+++ b/hw/net/pcnet-pci.c
@@ -40,6 +40,7 @@
 #include "trace.h"
 
 #include "pcnet.h"
+#include "qom/object.h"
 
 //#define PCNET_DEBUG
 //#define PCNET_DEBUG_IO
@@ -51,17 +52,18 @@
 
 #define TYPE_PCI_PCNET "pcnet"
 
+typedef struct PCIPCNetState PCIPCNetState;
 #define PCI_PCNET(obj) \
      OBJECT_CHECK(PCIPCNetState, (obj), TYPE_PCI_PCNET)
 
-typedef struct {
+struct PCIPCNetState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
 
     PCNetState state;
     MemoryRegion io_bar;
-} PCIPCNetState;
+};
 
 static void pcnet_aprom_writeb(void *opaque, uint32_t addr, uint32_t val)
 {
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index c6e9207f74..78d652a331 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -62,6 +62,7 @@
 #include "net/net.h"
 #include "net/eth.h"
 #include "sysemu/sysemu.h"
+#include "qom/object.h"
 
 /* debug RTL8139 card */
 //#define DEBUG_RTL8139 1
@@ -93,6 +94,7 @@ static inline GCC_FMT_ATTR(1, 2) int DPRINTF(const char *fmt, ...)
 
 #define TYPE_RTL8139 "rtl8139"
 
+typedef struct RTL8139State RTL8139State;
 #define RTL8139(obj) \
      OBJECT_CHECK(RTL8139State, (obj), TYPE_RTL8139)
 
@@ -431,7 +433,7 @@ typedef struct RTL8139TallyCounters
 /* Clears all tally counters */
 static void RTL8139TallyCounters_clear(RTL8139TallyCounters* counters);
 
-typedef struct RTL8139State {
+struct RTL8139State {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -513,7 +515,7 @@ typedef struct RTL8139State {
 
     /* Support migration to/from old versions */
     int rtl8139_mmio_io_addr_dummy;
-} RTL8139State;
+};
 
 /* Writes tally counters to memory via DMA */
 static void RTL8139TallyCounters_dma_write(RTL8139State *s, dma_addr_t tc_addr);
diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index bf7e3e6830..cfbf7dc867 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -19,14 +19,16 @@
 #include "qemu/module.h"
 /* For crc32 */
 #include <zlib.h>
+#include "qom/object.h"
 
 /* Number of 2k memory pages available.  */
 #define NUM_PACKETS 4
 
 #define TYPE_SMC91C111 "smc91c111"
+typedef struct smc91c111_state smc91c111_state;
 #define SMC91C111(obj) OBJECT_CHECK(smc91c111_state, (obj), TYPE_SMC91C111)
 
-typedef struct {
+struct smc91c111_state {
     SysBusDevice parent_obj;
 
     NICState *nic;
@@ -55,7 +57,7 @@ typedef struct {
     uint8_t int_level;
     uint8_t int_mask;
     MemoryRegion mmio;
-} smc91c111_state;
+};
 
 static const VMStateDescription vmstate_smc91c111 = {
     .name = "smc91c111",
diff --git a/hw/net/spapr_llan.c b/hw/net/spapr_llan.c
index a6139568bb..3dc35bfb7e 100644
--- a/hw/net/spapr_llan.c
+++ b/hw/net/spapr_llan.c
@@ -38,6 +38,7 @@
 #include "trace.h"
 
 #include <libfdt.h>
+#include "qom/object.h"
 
 #define ETH_ALEN        6
 #define MAX_PACKET_SIZE 65536
@@ -84,6 +85,7 @@ typedef uint64_t vlan_bd_t;
 #define VLAN_MAX_BUFS        (VLAN_RX_BDS_LEN / 8)
 
 #define TYPE_VIO_SPAPR_VLAN_DEVICE "spapr-vlan"
+typedef struct SpaprVioVlan SpaprVioVlan;
 #define VIO_SPAPR_VLAN_DEVICE(obj) \
      OBJECT_CHECK(SpaprVioVlan, (obj), TYPE_VIO_SPAPR_VLAN_DEVICE)
 
@@ -96,7 +98,7 @@ typedef struct {
     vlan_bd_t bds[RX_POOL_MAX_BDS];
 } RxBufPool;
 
-typedef struct SpaprVioVlan {
+struct SpaprVioVlan {
     SpaprVioDevice sdev;
     NICConf nicconf;
     NICState *nic;
@@ -108,7 +110,7 @@ typedef struct SpaprVioVlan {
     QEMUTimer *rxp_timer;
     uint32_t compat_flags;             /* Compatibility flags for migration */
     RxBufPool *rx_pool[RX_MAX_POOLS];  /* Receive buffer descriptor pools */
-} SpaprVioVlan;
+};
 
 static bool spapr_vlan_can_receive(NetClientState *nc)
 {
diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 87399c89b6..6708b99bbb 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -16,6 +16,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include <zlib.h>
+#include "qom/object.h"
 
 //#define DEBUG_STELLARIS_ENET 1
 
@@ -50,6 +51,7 @@ do { fprintf(stderr, "stellaris_enet: error: " fmt , ## __VA_ARGS__);} while (0)
 #define SE_TCTL_DUPLEX  0x08
 
 #define TYPE_STELLARIS_ENET "stellaris_enet"
+typedef struct stellaris_enet_state stellaris_enet_state;
 #define STELLARIS_ENET(obj) \
     OBJECT_CHECK(stellaris_enet_state, (obj), TYPE_STELLARIS_ENET)
 
@@ -58,7 +60,7 @@ typedef struct {
     uint32_t len;
 } StellarisEnetRxFrame;
 
-typedef struct {
+struct stellaris_enet_state {
     SysBusDevice parent_obj;
 
     uint32_t ris;
@@ -82,7 +84,7 @@ typedef struct {
     NICConf conf;
     qemu_irq irq;
     MemoryRegion mmio;
-} stellaris_enet_state;
+};
 
 static const VMStateDescription vmstate_rx_frame = {
     .name = "stellaris_enet/rx_frame",
diff --git a/hw/net/sungem.c b/hw/net/sungem.c
index 4c9e2bbda5..929ce13b9e 100644
--- a/hw/net/sungem.c
+++ b/hw/net/sungem.c
@@ -19,9 +19,11 @@
 #include "hw/net/mii.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define TYPE_SUNGEM "sungem"
 
+typedef struct SunGEMState SunGEMState;
 #define SUNGEM(obj) OBJECT_CHECK(SunGEMState, (obj), TYPE_SUNGEM)
 
 #define MAX_PACKET_SIZE 9016
@@ -192,7 +194,7 @@ struct gem_rxd {
 #define RXDCTRL_ALTMAC    0x2000000000000000ULL  /* Matched ALT MAC */
 
 
-typedef struct {
+struct SunGEMState {
     PCIDevice pdev;
 
     MemoryRegion sungem;
@@ -221,7 +223,7 @@ typedef struct {
     uint8_t tx_data[MAX_PACKET_SIZE];
     uint32_t tx_size;
     uint64_t tx_first_ctl;
-} SunGEMState;
+};
 
 
 static void sungem_eval_irq(SunGEMState *s)
diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index 6c38d3d5c6..832cdfd0c2 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -33,6 +33,7 @@
 #include "net/eth.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define HME_REG_SIZE                   0x8000
 
@@ -129,6 +130,7 @@
 #define MII_COMMAND_WRITE      0x1
 
 #define TYPE_SUNHME "sunhme"
+typedef struct SunHMEState SunHMEState;
 #define SUNHME(obj) OBJECT_CHECK(SunHMEState, (obj), TYPE_SUNHME)
 
 /* Maximum size of buffer */
@@ -153,7 +155,7 @@
 
 #define HME_MII_REGS_SIZE      0x20
 
-typedef struct SunHMEState {
+struct SunHMEState {
     /*< private >*/
     PCIDevice parent_obj;
 
@@ -174,7 +176,7 @@ typedef struct SunHMEState {
     uint32_t mifregs[HME_MIF_REG_SIZE >> 2];
 
     uint16_t miiregs[HME_MII_REGS_SIZE];
-} SunHMEState;
+};
 
 static Property sunhme_properties[] = {
     DEFINE_NIC_PROPERTIES(SunHMEState, conf),
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index b484a2faf2..c599639a28 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -35,6 +35,7 @@
 #include "vmware_utils.h"
 #include "net_tx_pkt.h"
 #include "net_rx_pkt.h"
+#include "qom/object.h"
 
 #define PCI_DEVICE_ID_VMWARE_VMXNET3_REVISION 0x1
 #define VMXNET3_MSIX_BAR_SIZE 0x2000
@@ -128,10 +129,11 @@
 
 #define VMXNET_FLAG_IS_SET(field, flag) (((field) & (flag)) == (flag))
 
-typedef struct VMXNET3Class {
+struct VMXNET3Class {
     PCIDeviceClass parent_class;
     DeviceRealize parent_dc_realize;
-} VMXNET3Class;
+};
+typedef struct VMXNET3Class VMXNET3Class;
 
 #define VMXNET3_DEVICE_CLASS(klass) \
     OBJECT_CLASS_CHECK(VMXNET3Class, (klass), TYPE_VMXNET3)
diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
index 00f71dc951..9ccb95a4d9 100644
--- a/hw/net/xgmac.c
+++ b/hw/net/xgmac.c
@@ -32,6 +32,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "net/net.h"
+#include "qom/object.h"
 
 #ifdef DEBUG_XGMAC
 #define DEBUGF_BRK(message, args...) do { \
@@ -139,9 +140,10 @@ typedef struct RxTxStats {
 } RxTxStats;
 
 #define TYPE_XGMAC "xgmac"
+typedef struct XgmacState XgmacState;
 #define XGMAC(obj) OBJECT_CHECK(XgmacState, (obj), TYPE_XGMAC)
 
-typedef struct XgmacState {
+struct XgmacState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -153,7 +155,7 @@ typedef struct XgmacState {
 
     struct RxTxStats stats;
     uint32_t regs[R_MAX];
-} XgmacState;
+};
 
 static const VMStateDescription vmstate_rxtx_stats = {
     .name = "xgmac_stats",
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 9711a1dd8e..40980e9a29 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -35,6 +35,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/stream.h"
+#include "qom/object.h"
 
 #define DPHY(x)
 
@@ -42,9 +43,11 @@
 #define TYPE_XILINX_AXI_ENET_DATA_STREAM "xilinx-axienet-data-stream"
 #define TYPE_XILINX_AXI_ENET_CONTROL_STREAM "xilinx-axienet-control-stream"
 
+typedef struct XilinxAXIEnet XilinxAXIEnet;
 #define XILINX_AXI_ENET(obj) \
      OBJECT_CHECK(XilinxAXIEnet, (obj), TYPE_XILINX_AXI_ENET)
 
+typedef struct XilinxAXIEnetStreamSlave XilinxAXIEnetStreamSlave;
 #define XILINX_AXI_ENET_DATA_STREAM(obj) \
      OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
      TYPE_XILINX_AXI_ENET_DATA_STREAM)
@@ -333,8 +336,6 @@ struct TEMAC  {
     void *parent;
 };
 
-typedef struct XilinxAXIEnetStreamSlave XilinxAXIEnetStreamSlave;
-typedef struct XilinxAXIEnet XilinxAXIEnet;
 
 struct XilinxAXIEnetStreamSlave {
     Object parent;
diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 735236cb0d..bc43adf985 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 #include "cpu.h" /* FIXME should not use tswap* */
 #include "hw/sysbus.h"
 #include "hw/irq.h"
diff --git a/hw/nvram/ds1225y.c b/hw/nvram/ds1225y.c
index 6daef757aa..9c35f5ea27 100644
--- a/hw/nvram/ds1225y.c
+++ b/hw/nvram/ds1225y.c
@@ -29,6 +29,7 @@
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 typedef struct {
     MemoryRegion iomem;
@@ -109,13 +110,14 @@ static const VMStateDescription vmstate_nvram = {
 };
 
 #define TYPE_DS1225Y "ds1225y"
+typedef struct SysBusNvRamState SysBusNvRamState;
 #define DS1225Y(obj) OBJECT_CHECK(SysBusNvRamState, (obj), TYPE_DS1225Y)
 
-typedef struct {
+struct SysBusNvRamState {
     SysBusDevice parent_obj;
 
     NvRamState nvram;
-} SysBusNvRamState;
+};
 
 static void nvram_sysbus_realize(DeviceState *dev, Error **errp)
 {
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 95582d67a7..7a76ab27aa 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -14,6 +14,7 @@
 #include "hw/i2c/i2c.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/block-backend.h"
+#include "qom/object.h"
 
 /* #define DEBUG_AT24C */
 
@@ -27,9 +28,10 @@
                             ## __VA_ARGS__)
 
 #define TYPE_AT24C_EE "at24c-eeprom"
+typedef struct EEPROMState EEPROMState;
 #define AT24C_EE(obj) OBJECT_CHECK(EEPROMState, (obj), TYPE_AT24C_EE)
 
-typedef struct EEPROMState {
+struct EEPROMState {
     I2CSlave parent_obj;
 
     /* address counter */
@@ -45,7 +47,7 @@ typedef struct EEPROMState {
     uint8_t *mem;
 
     BlockBackend *blk;
-} EEPROMState;
+};
 
 static
 int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
index b1c33a5883..3885d0c1e6 100644
--- a/hw/nvram/spapr_nvram.c
+++ b/hw/nvram/spapr_nvram.c
@@ -39,14 +39,16 @@
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_vio.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
-typedef struct SpaprNvram {
+struct SpaprNvram {
     SpaprVioDevice sdev;
     uint32_t size;
     uint8_t *buf;
     BlockBackend *blk;
     VMChangeStateEntry *vmstate;
-} SpaprNvram;
+};
+typedef struct SpaprNvram SpaprNvram;
 
 #define TYPE_VIO_SPAPR_NVRAM "spapr-nvram"
 #define VIO_SPAPR_NVRAM(obj) \
diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
index b36e7f90a3..91e24f68c8 100644
--- a/hw/pci-bridge/dec.c
+++ b/hw/pci-bridge/dec.c
@@ -32,12 +32,14 @@
 #include "hw/pci/pci_host.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_bus.h"
+#include "qom/object.h"
 
+typedef struct DECState DECState;
 #define DEC_21154(obj) OBJECT_CHECK(DECState, (obj), TYPE_DEC_21154)
 
-typedef struct DECState {
+struct DECState {
     PCIHostState parent_obj;
-} DECState;
+};
 
 static int dec_map_irq(PCIDevice *pci_dev, int irq_num)
 {
diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
index bb26e272c1..b62e20a648 100644
--- a/hw/pci-bridge/gen_pcie_root_port.c
+++ b/hw/pci-bridge/gen_pcie_root_port.c
@@ -17,8 +17,10 @@
 #include "hw/pci/pcie_port.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 #define TYPE_GEN_PCIE_ROOT_PORT                "pcie-root-port"
+typedef struct GenPCIERootPort GenPCIERootPort;
 #define GEN_PCIE_ROOT_PORT(obj) \
         OBJECT_CHECK(GenPCIERootPort, (obj), TYPE_GEN_PCIE_ROOT_PORT)
 
@@ -28,7 +30,7 @@
 
 #define GEN_PCIE_ROOT_PORT_MSIX_NR_VECTOR       1
 
-typedef struct GenPCIERootPort {
+struct GenPCIERootPort {
     /*< private >*/
     PCIESlot parent_obj;
     /*< public >*/
@@ -37,7 +39,7 @@ typedef struct GenPCIERootPort {
 
     /* additional resources to reserve */
     PCIResReserve res_reserve;
-} GenPCIERootPort;
+};
 
 static uint8_t gen_rp_aer_vector(const PCIDevice *d)
 {
diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index d080a0ca18..7f57f90969 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -31,9 +31,11 @@
 #include "exec/memory.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/hotplug.h"
+#include "qom/object.h"
 
 #define TYPE_PCI_BRIDGE_DEV      "pci-bridge"
 #define TYPE_PCI_BRIDGE_SEAT_DEV "pci-bridge-seat"
+typedef struct PCIBridgeDev PCIBridgeDev;
 #define PCI_BRIDGE_DEV(obj) \
     OBJECT_CHECK(PCIBridgeDev, (obj), TYPE_PCI_BRIDGE_DEV)
 
@@ -52,7 +54,6 @@ struct PCIBridgeDev {
     /* additional resources to reserve */
     PCIResReserve res_reserve;
 };
-typedef struct PCIBridgeDev PCIBridgeDev;
 
 static void pci_bridge_dev_realize(PCIDevice *dev, Error **errp)
 {
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 4c19a5051b..7d9f44e314 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -22,35 +22,38 @@
 #include "qemu/module.h"
 #include "sysemu/numa.h"
 #include "hw/boards.h"
+#include "qom/object.h"
 
 #define TYPE_PXB_BUS "pxb-bus"
+typedef struct PXBBus PXBBus;
 #define PXB_BUS(obj) OBJECT_CHECK(PXBBus, (obj), TYPE_PXB_BUS)
 
 #define TYPE_PXB_PCIE_BUS "pxb-pcie-bus"
 #define PXB_PCIE_BUS(obj) OBJECT_CHECK(PXBBus, (obj), TYPE_PXB_PCIE_BUS)
 
-typedef struct PXBBus {
+struct PXBBus {
     /*< private >*/
     PCIBus parent_obj;
     /*< public >*/
 
     char bus_path[8];
-} PXBBus;
+};
 
 #define TYPE_PXB_DEVICE "pxb"
+typedef struct PXBDev PXBDev;
 #define PXB_DEV(obj) OBJECT_CHECK(PXBDev, (obj), TYPE_PXB_DEVICE)
 
 #define TYPE_PXB_PCIE_DEVICE "pxb-pcie"
 #define PXB_PCIE_DEV(obj) OBJECT_CHECK(PXBDev, (obj), TYPE_PXB_PCIE_DEVICE)
 
-typedef struct PXBDev {
+struct PXBDev {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
 
     uint8_t bus_nr;
     uint16_t numa_node;
-} PXBDev;
+};
 
 static PXBDev *convert_to_pxb(PCIDevice *dev)
 {
diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index 00b30b2a4b..0f4c8a0cae 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -17,15 +17,17 @@
 #include "hw/pci/shpc.h"
 #include "hw/pci/slotid_cap.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
-typedef struct PCIEPCIBridge {
+struct PCIEPCIBridge {
     /*< private >*/
     PCIBridge parent_obj;
 
     OnOffAuto msi;
     MemoryRegion shpc_bar;
     /*< public >*/
-} PCIEPCIBridge;
+};
+typedef struct PCIEPCIBridge PCIEPCIBridge;
 
 #define TYPE_PCIE_PCI_BRIDGE_DEV "pcie-pci-bridge"
 #define PCIE_PCI_BRIDGE_DEV(obj) \
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index ea7e30155c..f4d5a052aa 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -52,6 +52,7 @@
 #include "exec/address-spaces.h"
 #include "hw/misc/unimp.h"
 #include "hw/registerfields.h"
+#include "qom/object.h"
 
 /* #define DEBUG_BONITO */
 
@@ -200,7 +201,7 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 
 typedef struct BonitoState BonitoState;
 
-typedef struct PCIBonitoState {
+struct PCIBonitoState {
     PCIDevice dev;
 
     BonitoState *pcihost;
@@ -228,7 +229,8 @@ typedef struct PCIBonitoState {
     MemoryRegion bonito_pciio;
     MemoryRegion bonito_localio;
 
-} PCIBonitoState;
+};
+typedef struct PCIBonitoState PCIBonitoState;
 
 struct BonitoState {
     PCIHostState parent_obj;
diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index 066dc773e2..0f38e31d1e 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -33,11 +33,13 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qom/object.h"
 
+typedef struct GrackleState GrackleState;
 #define GRACKLE_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(GrackleState, (obj), TYPE_GRACKLE_PCI_HOST_BRIDGE)
 
-typedef struct GrackleState {
+struct GrackleState {
     PCIHostState parent_obj;
 
     uint32_t ofw_addr;
@@ -46,7 +48,7 @@ typedef struct GrackleState {
     MemoryRegion pci_mmio;
     MemoryRegion pci_hole;
     MemoryRegion pci_io;
-} GrackleState;
+};
 
 /* Don't know if this matches real hardware, but it agrees with OHW.  */
 static int pci_grackle_map_irq(PCIDevice *pci_dev, int irq_num)
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 56ac1089b6..21896f96ed 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -35,22 +35,24 @@
 #include "migration/vmstate.h"
 #include "qapi/visitor.h"
 #include "qemu/error-report.h"
+#include "qom/object.h"
 
 /*
  * I440FX chipset data sheet.
  * https://wiki.qemu.org/File:29054901.pdf
  */
 
+typedef struct I440FXState I440FXState;
 #define I440FX_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(I440FXState, (obj), TYPE_I440FX_PCI_HOST_BRIDGE)
 
-typedef struct I440FXState {
+struct I440FXState {
     PCIHostState parent_obj;
     Range pci_hole;
     uint64_t pci_hole64_size;
     bool pci_hole64_fix;
     uint32_t short_root_bus;
-} I440FXState;
+};
 
 #define I440FX_PAM      0x59
 #define I440FX_PAM_SIZE 7
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 171e4e1c71..2cc429ba7b 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -18,6 +18,7 @@
 #include "hw/ppc/pnv.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 #define phb3_error(phb, fmt, ...)                                       \
     qemu_log_mask(LOG_GUEST_ERROR, "phb3[%d:%d]: " fmt "\n",            \
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 6e8c45e200..0802d4d64b 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -21,6 +21,7 @@
 #include "hw/ppc/pnv_xscom.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 #define phb_error(phb, fmt, ...)                                        \
     qemu_log_mask(LOG_GUEST_ERROR, "phb4[%d:%d]: " fmt "\n",            \
diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
index c2a8527521..3ba0204601 100644
--- a/hw/pci-host/ppce500.c
+++ b/hw/pci-host/ppce500.c
@@ -24,6 +24,7 @@
 #include "qemu/bswap.h"
 #include "qemu/module.h"
 #include "hw/pci-host/ppce500.h"
+#include "qom/object.h"
 
 #ifdef DEBUG_PCI
 #define pci_debug(fmt, ...) fprintf(stderr, fmt, ## __VA_ARGS__)
@@ -91,6 +92,7 @@ struct pci_inbound {
 
 #define TYPE_PPC_E500_PCI_HOST_BRIDGE "e500-pcihost"
 
+typedef struct PPCE500PCIState PPCE500PCIState;
 #define PPC_E500_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(PPCE500PCIState, (obj), TYPE_PPC_E500_PCI_HOST_BRIDGE)
 
@@ -114,6 +116,7 @@ struct PPCE500PCIState {
 };
 
 #define TYPE_PPC_E500_PCI_BRIDGE "e500-host-bridge"
+typedef struct PPCE500PCIBridgeState PPCE500PCIBridgeState;
 #define PPC_E500_PCI_BRIDGE(obj) \
     OBJECT_CHECK(PPCE500PCIBridgeState, (obj), TYPE_PPC_E500_PCI_BRIDGE)
 
@@ -125,8 +128,6 @@ struct PPCE500PCIBridgeState {
     MemoryRegion bar0;
 };
 
-typedef struct PPCE500PCIBridgeState PPCE500PCIBridgeState;
-typedef struct PPCE500PCIState PPCE500PCIState;
 
 static uint64_t pci_reg_read4(void *opaque, hwaddr addr,
                               unsigned size)
diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 5de4ab83f9..e6d262db1e 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -38,25 +38,28 @@
 #include "hw/or-irq.h"
 #include "exec/address-spaces.h"
 #include "elf.h"
+#include "qom/object.h"
 
 #define TYPE_RAVEN_PCI_DEVICE "raven"
 #define TYPE_RAVEN_PCI_HOST_BRIDGE "raven-pcihost"
 
+typedef struct RavenPCIState RavenPCIState;
 #define RAVEN_PCI_DEVICE(obj) \
     OBJECT_CHECK(RavenPCIState, (obj), TYPE_RAVEN_PCI_DEVICE)
 
-typedef struct RavenPCIState {
+struct RavenPCIState {
     PCIDevice dev;
 
     uint32_t elf_machine;
     char *bios_name;
     MemoryRegion bios;
-} RavenPCIState;
+};
 
+typedef struct PRePPCIState PREPPCIState;
 #define RAVEN_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(PREPPCIState, (obj), TYPE_RAVEN_PCI_HOST_BRIDGE)
 
-typedef struct PRePPCIState {
+struct PRePPCIState {
     PCIHostState parent_obj;
 
     qemu_or_irq *or_irq;
@@ -75,7 +78,7 @@ typedef struct PRePPCIState {
 
     int contiguous_map;
     bool is_legacy_prep;
-} PREPPCIState;
+};
 
 #define BIOS_SIZE (1 * MiB)
 
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index fd71ae8d19..bcb0f96885 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -18,6 +18,7 @@
 #include "hw/qdev-properties.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 /* Old and buggy versions of QEMU used the wrong mapping from
  * PCI IRQs to system interrupt lines. Unfortunately the Linux
@@ -71,7 +72,7 @@ enum {
     PCI_VPB_IRQMAP_FORCE_OK,
 };
 
-typedef struct {
+struct PCIVPBState {
     PCIHostState parent_obj;
 
     qemu_irq irq[4];
@@ -100,7 +101,8 @@ typedef struct {
     uint32_t selfid;
     uint32_t flags;
     uint8_t irq_mapping;
-} PCIVPBState;
+};
+typedef struct PCIVPBState PCIVPBState;
 
 static void pci_vpb_update_window(PCIVPBState *s, int i)
 {
diff --git a/hw/ppc/mpc8544_guts.c b/hw/ppc/mpc8544_guts.c
index 3a2a6f5f5d..7949f7004a 100644
--- a/hw/ppc/mpc8544_guts.c
+++ b/hw/ppc/mpc8544_guts.c
@@ -22,6 +22,7 @@
 #include "sysemu/runstate.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define MPC8544_GUTS_MMIO_SIZE        0x1000
 #define MPC8544_GUTS_RSTCR_RESET      0x02
@@ -54,6 +55,7 @@
 #define MPC8544_GUTS_ADDR_SRDS2CR3    0xF18
 
 #define TYPE_MPC8544_GUTS "mpc8544-guts"
+typedef struct GutsState GutsState;
 #define MPC8544_GUTS(obj) OBJECT_CHECK(GutsState, (obj), TYPE_MPC8544_GUTS)
 
 struct GutsState {
@@ -64,7 +66,6 @@ struct GutsState {
     MemoryRegion iomem;
 };
 
-typedef struct GutsState GutsState;
 
 static uint64_t mpc8544_guts_read(void *opaque, hwaddr addr,
                                   unsigned size)
diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index 37feaa2f06..7c3145ce43 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -30,6 +30,7 @@
 #include "hw/pci/pci_host.h"
 #include "exec/address-spaces.h"
 #include "trace.h"
+#include "qom/object.h"
 
 struct PLBOutMap {
     uint64_t la;
@@ -45,13 +46,14 @@ struct PLBInMap {
 };
 
 #define TYPE_PPC440_PCIX_HOST_BRIDGE "ppc440-pcix-host"
+typedef struct PPC440PCIXState PPC440PCIXState;
 #define PPC440_PCIX_HOST_BRIDGE(obj) \
     OBJECT_CHECK(PPC440PCIXState, (obj), TYPE_PPC440_PCIX_HOST_BRIDGE)
 
 #define PPC440_PCIX_NR_POMS 3
 #define PPC440_PCIX_NR_PIMS 3
 
-typedef struct PPC440PCIXState {
+struct PPC440PCIXState {
     PCIHostState parent_obj;
 
     PCIDevice *dev;
@@ -65,7 +67,7 @@ typedef struct PPC440PCIXState {
     MemoryRegion container;
     MemoryRegion iomem;
     MemoryRegion busmem;
-} PPC440PCIXState;
+};
 
 #define PPC440_REG_BASE     0x80000
 #define PPC440_REG_SIZE     0xff
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index c1167aa6da..1ff714458d 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -24,6 +24,7 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/reset.h"
 #include "ppc440.h"
+#include "qom/object.h"
 
 /*****************************************************************************/
 /* L2 Cache as SRAM */
@@ -1032,10 +1033,11 @@ void ppc4xx_dma_init(CPUPPCState *env, int dcr_base)
 #include "hw/pci/pcie_host.h"
 
 #define TYPE_PPC460EX_PCIE_HOST "ppc460ex-pcie-host"
+typedef struct PPC460EXPCIEState PPC460EXPCIEState;
 #define PPC460EX_PCIE_HOST(obj) \
     OBJECT_CHECK(PPC460EXPCIEState, (obj), TYPE_PPC460EX_PCIE_HOST)
 
-typedef struct PPC460EXPCIEState {
+struct PPC460EXPCIEState {
     PCIExpressHost host;
 
     MemoryRegion iomem;
@@ -1056,7 +1058,7 @@ typedef struct PPC460EXPCIEState {
     uint32_t reg_mask;
     uint32_t special;
     uint32_t cfg;
-} PPC460EXPCIEState;
+};
 
 #define DCRN_PCIE0_BASE 0x100
 #define DCRN_PCIE1_BASE 0x120
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index b22df26c70..8eb83080b0 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -30,6 +30,7 @@
 #include "hw/pci/pci_host.h"
 #include "exec/address-spaces.h"
 #include "trace.h"
+#include "qom/object.h"
 
 struct PCIMasterMap {
     uint32_t la;
@@ -43,6 +44,7 @@ struct PCITargetMap {
     uint32_t la;
 };
 
+typedef struct PPC4xxPCIState PPC4xxPCIState;
 #define PPC4xx_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(PPC4xxPCIState, (obj), TYPE_PPC4xx_PCI_HOST_BRIDGE)
 
@@ -59,7 +61,6 @@ struct PPC4xxPCIState {
     MemoryRegion container;
     MemoryRegion iomem;
 };
-typedef struct PPC4xxPCIState PPC4xxPCIState;
 
 #define PCIC0_CFGADDR       0x0
 #define PCIC0_CFGDATA       0x4
diff --git a/hw/ppc/ppce500_spin.c b/hw/ppc/ppce500_spin.c
index a5d13ec583..5858fdaa10 100644
--- a/hw/ppc/ppce500_spin.c
+++ b/hw/ppc/ppce500_spin.c
@@ -34,6 +34,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/hw_accel.h"
 #include "e500.h"
+#include "qom/object.h"
 
 #define MAX_CPUS 32
 
@@ -46,14 +47,15 @@ typedef struct spin_info {
 } QEMU_PACKED SpinInfo;
 
 #define TYPE_E500_SPIN "e500-spin"
+typedef struct SpinState SpinState;
 #define E500_SPIN(obj) OBJECT_CHECK(SpinState, (obj), TYPE_E500_SPIN)
 
-typedef struct SpinState {
+struct SpinState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
     SpinInfo spin[MAX_CPUS];
-} SpinState;
+};
 
 static void spin_reset(DeviceState *dev)
 {
diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
index c326518509..338de2209d 100644
--- a/hw/ppc/prep_systemio.c
+++ b/hw/ppc/prep_systemio.c
@@ -28,6 +28,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "exec/address-spaces.h"
+#include "qom/object.h"
 #include "qemu/error-report.h" /* for error_report() */
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
@@ -35,13 +36,14 @@
 #include "trace.h"
 
 #define TYPE_PREP_SYSTEMIO "prep-systemio"
+typedef struct PrepSystemIoState PrepSystemIoState;
 #define PREP_SYSTEMIO(obj) \
     OBJECT_CHECK(PrepSystemIoState, (obj), TYPE_PREP_SYSTEMIO)
 
 /* Bit as defined in PowerPC Reference Plaform v1.1, sect. 6.1.5, p. 132 */
 #define PREP_BIT(n) (1 << (7 - (n)))
 
-typedef struct PrepSystemIoState {
+struct PrepSystemIoState {
     ISADevice parent_obj;
     MemoryRegion ppc_parity_mem;
 
@@ -53,7 +55,7 @@ typedef struct PrepSystemIoState {
     uint8_t ibm_planar_id; /* 0x0852 */
     qemu_irq softreset_irq;
     PortioList portio;
-} PrepSystemIoState;
+};
 
 /* PORT 0092 -- Special Port 92 (Read/Write) */
 
diff --git a/hw/ppc/rs6000_mc.c b/hw/ppc/rs6000_mc.c
index a5c32c8ed5..5ca15d8116 100644
--- a/hw/ppc/rs6000_mc.c
+++ b/hw/ppc/rs6000_mc.c
@@ -26,12 +26,14 @@
 #include "hw/boards.h"
 #include "qapi/error.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define TYPE_RS6000MC "rs6000-mc"
+typedef struct RS6000MCState RS6000MCState;
 #define RS6000MC_DEVICE(obj) \
     OBJECT_CHECK(RS6000MCState, (obj), TYPE_RS6000MC)
 
-typedef struct RS6000MCState {
+struct RS6000MCState {
     ISADevice parent_obj;
     /* see US patent 5,684,979 for details (expired 2001-11-04) */
     uint32_t ram_size;
@@ -41,7 +43,7 @@ typedef struct RS6000MCState {
     uint32_t end_address[8];
     uint8_t port0820_index;
     PortioList portio;
-} RS6000MCState;
+};
 
 /* P0RT 0803 -- SIMM ID Register (32/8 MB) (Read Only) */
 
diff --git a/hw/ppc/spapr_rng.c b/hw/ppc/spapr_rng.c
index f25a10d26a..fb19e6c65d 100644
--- a/hw/ppc/spapr_rng.c
+++ b/hw/ppc/spapr_rng.c
@@ -28,7 +28,9 @@
 #include "hw/ppc/spapr.h"
 #include "hw/qdev-properties.h"
 #include "kvm_ppc.h"
+#include "qom/object.h"
 
+typedef struct SpaprRngState SpaprRngState;
 #define SPAPR_RNG(obj) \
     OBJECT_CHECK(SpaprRngState, (obj), TYPE_SPAPR_RNG)
 
@@ -38,7 +40,6 @@ struct SpaprRngState {
     RngBackend *backend;
     bool use_kvm;
 };
-typedef struct SpaprRngState SpaprRngState;
 
 struct HRandomData {
     QemuSemaphore sem;
diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 985d07f8f1..3f0b5f0bfd 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -16,6 +16,7 @@
 #include "migration/vmstate.h"
 #include "qemu/bcd.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 /* Size of NVRAM including both the user-accessible area and the
  * secondary register area.
@@ -29,9 +30,10 @@
 #define CTRL_OSF   0x20
 
 #define TYPE_DS1338 "ds1338"
+typedef struct DS1338State DS1338State;
 #define DS1338(obj) OBJECT_CHECK(DS1338State, (obj), TYPE_DS1338)
 
-typedef struct DS1338State {
+struct DS1338State {
     I2CSlave parent_obj;
 
     int64_t offset;
@@ -39,7 +41,7 @@ typedef struct DS1338State {
     uint8_t nvram[NVRAM_SIZE];
     int32_t ptr;
     bool addr_byte;
-} DS1338State;
+};
 
 static const VMStateDescription vmstate_ds1338 = {
     .name = "ds1338",
diff --git a/hw/rtc/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
index 375f682f5d..7aa29740fe 100644
--- a/hw/rtc/exynos4210_rtc.c
+++ b/hw/rtc/exynos4210_rtc.c
@@ -38,6 +38,7 @@
 #include "hw/irq.h"
 
 #include "hw/arm/exynos4210.h"
+#include "qom/object.h"
 
 #define DEBUG_RTC 0
 
@@ -84,10 +85,11 @@
 #define     RTC_BASE_FREQ       32768
 
 #define TYPE_EXYNOS4210_RTC "exynos4210.rtc"
+typedef struct Exynos4210RTCState Exynos4210RTCState;
 #define EXYNOS4210_RTC(obj) \
     OBJECT_CHECK(Exynos4210RTCState, (obj), TYPE_EXYNOS4210_RTC)
 
-typedef struct Exynos4210RTCState {
+struct Exynos4210RTCState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -113,7 +115,7 @@ typedef struct Exynos4210RTCState {
     qemu_irq        alm_irq;    /* alarm irq */
 
     struct tm   current_tm;     /* current time */
-} Exynos4210RTCState;
+};
 
 #define TICCKSEL(value) ((value & (0x0F << 4)) >> 4)
 
diff --git a/hw/rtc/m41t80.c b/hw/rtc/m41t80.c
index 8b44b70eba..10b501194a 100644
--- a/hw/rtc/m41t80.c
+++ b/hw/rtc/m41t80.c
@@ -14,14 +14,16 @@
 #include "qemu/timer.h"
 #include "qemu/bcd.h"
 #include "hw/i2c/i2c.h"
+#include "qom/object.h"
 
 #define TYPE_M41T80 "m41t80"
+typedef struct M41t80State M41t80State;
 #define M41T80(obj) OBJECT_CHECK(M41t80State, (obj), TYPE_M41T80)
 
-typedef struct M41t80State {
+struct M41t80State {
     I2CSlave parent_obj;
     int8_t addr;
-} M41t80State;
+};
 
 static void m41t80_realize(DeviceState *dev, Error **errp)
 {
diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
index 6e72e132e4..13ceed424a 100644
--- a/hw/rtc/m48t59-isa.c
+++ b/hw/rtc/m48t59-isa.c
@@ -30,8 +30,11 @@
 #include "m48t59-internal.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define TYPE_M48TXX_ISA "isa-m48txx"
+typedef struct M48txxISADeviceClass M48txxISADeviceClass;
+typedef struct M48txxISAState M48txxISAState;
 #define M48TXX_ISA_GET_CLASS(obj) \
     OBJECT_GET_CLASS(M48txxISADeviceClass, (obj), TYPE_M48TXX_ISA)
 #define M48TXX_ISA_CLASS(klass) \
@@ -39,17 +42,17 @@
 #define M48TXX_ISA(obj) \
     OBJECT_CHECK(M48txxISAState, (obj), TYPE_M48TXX_ISA)
 
-typedef struct M48txxISAState {
+struct M48txxISAState {
     ISADevice parent_obj;
     M48t59State state;
     uint32_t io_base;
     MemoryRegion io;
-} M48txxISAState;
+};
 
-typedef struct M48txxISADeviceClass {
+struct M48txxISADeviceClass {
     ISADeviceClass parent_class;
     M48txxInfo info;
-} M48txxISADeviceClass;
+};
 
 static M48txxInfo m48txx_isa_info[] = {
     {
diff --git a/hw/rtc/m48t59.c b/hw/rtc/m48t59.c
index 1057e225d0..ad305e0825 100644
--- a/hw/rtc/m48t59.c
+++ b/hw/rtc/m48t59.c
@@ -40,8 +40,11 @@
 
 #include "m48t59-internal.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 #define TYPE_M48TXX_SYS_BUS "sysbus-m48txx"
+typedef struct M48txxSysBusDeviceClass M48txxSysBusDeviceClass;
+typedef struct M48txxSysBusState M48txxSysBusState;
 #define M48TXX_SYS_BUS_GET_CLASS(obj) \
     OBJECT_GET_CLASS(M48txxSysBusDeviceClass, (obj), TYPE_M48TXX_SYS_BUS)
 #define M48TXX_SYS_BUS_CLASS(klass) \
@@ -56,16 +59,16 @@
  * http://www.st.com/stonline/products/literature/od/7001/m48t59y.pdf
  */
 
-typedef struct M48txxSysBusState {
+struct M48txxSysBusState {
     SysBusDevice parent_obj;
     M48t59State state;
     MemoryRegion io;
-} M48txxSysBusState;
+};
 
-typedef struct M48txxSysBusDeviceClass {
+struct M48txxSysBusDeviceClass {
     SysBusDeviceClass parent_class;
     M48txxInfo info;
-} M48txxSysBusDeviceClass;
+};
 
 static M48txxInfo m48txx_sysbus_info[] = {
     {
diff --git a/hw/rtc/sun4v-rtc.c b/hw/rtc/sun4v-rtc.c
index 8e242e8416..486a16d0cf 100644
--- a/hw/rtc/sun4v-rtc.c
+++ b/hw/rtc/sun4v-rtc.c
@@ -16,16 +16,18 @@
 #include "qemu/timer.h"
 #include "hw/rtc/sun4v-rtc.h"
 #include "trace.h"
+#include "qom/object.h"
 
 
 #define TYPE_SUN4V_RTC "sun4v_rtc"
+typedef struct Sun4vRtc Sun4vRtc;
 #define SUN4V_RTC(obj) OBJECT_CHECK(Sun4vRtc, (obj), TYPE_SUN4V_RTC)
 
-typedef struct Sun4vRtc {
+struct Sun4vRtc {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
-} Sun4vRtc;
+};
 
 static uint64_t sun4v_rtc_read(void *opaque, hwaddr addr,
                                 unsigned size)
diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
index 782d77d6fc..9a3b8c3411 100644
--- a/hw/rtc/twl92230.c
+++ b/hw/rtc/twl92230.c
@@ -29,13 +29,15 @@
 #include "sysemu/sysemu.h"
 #include "qemu/bcd.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define VERBOSE 1
 
 #define TYPE_TWL92230 "twl92230"
+typedef struct MenelausState MenelausState;
 #define TWL92230(obj) OBJECT_CHECK(MenelausState, (obj), TYPE_TWL92230)
 
-typedef struct MenelausState {
+struct MenelausState {
     I2CSlave parent_obj;
 
     int firstbyte;
@@ -71,7 +73,7 @@ typedef struct MenelausState {
     uint16_t rtc_next_vmstate;
     qemu_irq out[4];
     uint8_t pwrbtn_state;
-} MenelausState;
+};
 
 static inline void menelaus_update(MenelausState *s)
 {
diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 6914de2e59..ed7f695c2a 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -30,24 +30,27 @@
 #include "sysemu/qtest.h"
 #include "sysemu/device_tree.h"
 #include "hw/boards.h"
+#include "qom/object.h"
 
 /* Same address of GDB integrated simulator */
 #define SDRAM_BASE  EXT_CS_BASE
 
-typedef struct RxGdbSimMachineClass {
+struct RxGdbSimMachineClass {
     /*< private >*/
     MachineClass parent_class;
     /*< public >*/
     const char *mcu_name;
     uint32_t xtal_freq_hz;
-} RxGdbSimMachineClass;
+};
+typedef struct RxGdbSimMachineClass RxGdbSimMachineClass;
 
-typedef struct RxGdbSimMachineState {
+struct RxGdbSimMachineState {
     /*< private >*/
     MachineState parent_obj;
     /*< public >*/
     RX62NState mcu;
-} RxGdbSimMachineState;
+};
+typedef struct RxGdbSimMachineState RxGdbSimMachineState;
 
 #define TYPE_RX_GDBSIM_MACHINE MACHINE_TYPE_NAME("rx62n-common")
 
diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index b9c217ebfa..d2935c5429 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -31,6 +31,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
 #include "cpu.h"
+#include "qom/object.h"
 
 /*
  * RX62N Internal Memory
@@ -60,7 +61,7 @@
 #define RX62N_XTAL_MAX_HZ (14 * 1000 * 1000)
 #define RX62N_PCLK_MAX_HZ (50 * 1000 * 1000)
 
-typedef struct RX62NClass {
+struct RX62NClass {
     /*< private >*/
     DeviceClass parent_class;
     /*< public >*/
@@ -68,7 +69,8 @@ typedef struct RX62NClass {
     uint64_t ram_size;
     uint64_t rom_flash_size;
     uint64_t data_flash_size;
-} RX62NClass;
+};
+typedef struct RX62NClass RX62NClass;
 
 #define RX62N_MCU_CLASS(klass) \
     OBJECT_CLASS_CHECK(RX62NClass, (klass), TYPE_RX62N_MCU)
diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 0fa2e1cc45..652b750f5e 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -33,9 +33,11 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define TYPE_AM53C974_DEVICE "am53c974"
 
+typedef struct PCIESPState PCIESPState;
 #define PCI_ESP(obj) \
     OBJECT_CHECK(PCIESPState, (obj), TYPE_AM53C974_DEVICE)
 
@@ -64,7 +66,7 @@
 
 #define SBAC_STATUS (1 << 24)
 
-typedef struct PCIESPState {
+struct PCIESPState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -73,7 +75,7 @@ typedef struct PCIESPState {
     uint32_t dma_regs[8];
     uint32_t sbac;
     ESPState esp;
-} PCIESPState;
+};
 
 static void esp_pci_handle_idle(PCIESPState *pci, uint32_t val)
 {
@@ -409,10 +411,11 @@ static const TypeInfo esp_pci_info = {
 };
 TYPE_INFO(esp_pci_info)
 
-typedef struct {
+struct DC390State {
     PCIESPState pci;
     eeprom_t *eeprom;
-} DC390State;
+};
+typedef struct DC390State DC390State;
 
 #define TYPE_DC390_DEVICE "dc390"
 #define DC390(obj) \
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 4c02f32182..3651ef2e95 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -23,6 +23,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qom/object.h"
 
 static const char *names[] = {
     "SCNTL0", "SCNTL1", "SCNTL2", "SCNTL3", "SCID", "SXFER", "SDID", "GPREG",
@@ -213,7 +214,7 @@ enum {
     LSI_MSG_ACTION_DIN = 3,
 };
 
-typedef struct {
+struct LSIState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -303,7 +304,8 @@ typedef struct {
     uint32_t adder;
 
     uint8_t script_ram[2048 * sizeof(uint32_t)];
-} LSIState;
+};
+typedef struct LSIState LSIState;
 
 #define TYPE_LSI53C810  "lsi53c810"
 #define TYPE_LSI53C895A "lsi53c895a"
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index eda0c22f03..6f0d21804d 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -34,6 +34,7 @@
 #include "qapi/error.h"
 #include "mfi.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 #define MEGASAS_VERSION_GEN1 "1.70"
 #define MEGASAS_VERSION_GEN2 "1.80"
@@ -72,7 +73,7 @@ typedef struct MegasasCmd {
     struct MegasasState *state;
 } MegasasCmd;
 
-typedef struct MegasasState {
+struct MegasasState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -116,16 +117,18 @@ typedef struct MegasasState {
     MegasasCmd frames[MEGASAS_MAX_FRAMES];
     DECLARE_BITMAP(frame_map, MEGASAS_MAX_FRAMES);
     SCSIBus bus;
-} MegasasState;
+};
+typedef struct MegasasState MegasasState;
 
-typedef struct MegasasBaseClass {
+struct MegasasBaseClass {
     PCIDeviceClass parent_class;
     const char *product_name;
     const char *product_version;
     int mmio_bar;
     int ioport_bar;
     int osts;
-} MegasasBaseClass;
+};
+typedef struct MegasasBaseClass MegasasBaseClass;
 
 #define TYPE_MEGASAS_BASE "megasas-base"
 #define TYPE_MEGASAS_GEN1 "megasas"
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index f0777dd4ee..3a2978d6d3 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -38,6 +38,7 @@
 #include "sysemu/sysemu.h"
 #include "qemu/cutils.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #ifdef __linux
 #include <scsi/sg.h>
@@ -54,6 +55,8 @@
 
 #define TYPE_SCSI_DISK_BASE         "scsi-disk-base"
 
+typedef struct SCSIDiskClass SCSIDiskClass;
+typedef struct SCSIDiskState SCSIDiskState;
 #define SCSI_DISK_BASE(obj) \
      OBJECT_CHECK(SCSIDiskState, (obj), TYPE_SCSI_DISK_BASE)
 #define SCSI_DISK_BASE_CLASS(klass) \
@@ -61,13 +64,13 @@
 #define SCSI_DISK_BASE_GET_CLASS(obj) \
      OBJECT_GET_CLASS(SCSIDiskClass, (obj), TYPE_SCSI_DISK_BASE)
 
-typedef struct SCSIDiskClass {
+struct SCSIDiskClass {
     SCSIDeviceClass parent_class;
     DMAIOFunc       *dma_readv;
     DMAIOFunc       *dma_writev;
     bool            (*need_fua_emulation)(SCSICommand *cmd);
     void            (*update_sense)(SCSIRequest *r);
-} SCSIDiskClass;
+};
 
 typedef struct SCSIDiskReq {
     SCSIRequest req;
@@ -87,8 +90,7 @@ typedef struct SCSIDiskReq {
 #define SCSI_DISK_F_DPOFUA                1
 #define SCSI_DISK_F_NO_REMOVABLE_DEVOPS   2
 
-typedef struct SCSIDiskState
-{
+struct SCSIDiskState {
     SCSIDevice qdev;
     uint32_t features;
     bool media_changed;
@@ -113,7 +115,7 @@ typedef struct SCSIDiskState
      * 0xffff        - reserved
      */
     uint16_t rotation_rate;
-} SCSIDiskState;
+};
 
 static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed);
 
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index 10c64396d6..65b84395df 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -46,6 +46,7 @@
 #include "trace.h"
 
 #include <libfdt.h>
+#include "qom/object.h"
 
 /*
  * Virtual SCSI device
@@ -90,14 +91,15 @@ typedef struct vscsi_req {
 } vscsi_req;
 
 #define TYPE_VIO_SPAPR_VSCSI_DEVICE "spapr-vscsi"
+typedef struct VSCSIState VSCSIState;
 #define VIO_SPAPR_VSCSI_DEVICE(obj) \
      OBJECT_CHECK(VSCSIState, (obj), TYPE_VIO_SPAPR_VSCSI_DEVICE)
 
-typedef struct {
+struct VSCSIState {
     SpaprVioDevice vdev;
     SCSIBus bus;
     vscsi_req reqs[VSCSI_REQ_LIMIT];
-} VSCSIState;
+};
 
 static union viosrp_iu *req_iu(vscsi_req *req)
 {
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 796dbc14d6..6afe5d1a5f 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -36,6 +36,7 @@
 #include "hw/qdev-properties.h"
 #include "vmw_pvscsi.h"
 #include "trace.h"
+#include "qom/object.h"
 
 
 #define PVSCSI_USE_64BIT         (true)
@@ -56,12 +57,14 @@
     (stl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), val))
 
-typedef struct PVSCSIClass {
+struct PVSCSIClass {
     PCIDeviceClass parent_class;
     DeviceRealize parent_dc_realize;
-} PVSCSIClass;
+};
+typedef struct PVSCSIClass PVSCSIClass;
 
 #define TYPE_PVSCSI "pvscsi"
+typedef struct PVSCSIState PVSCSIState;
 #define PVSCSI(obj) OBJECT_CHECK(PVSCSIState, (obj), TYPE_PVSCSI)
 
 #define PVSCSI_CLASS(klass) \
@@ -104,7 +107,7 @@ typedef struct PVSCSISGState {
 
 typedef QTAILQ_HEAD(, PVSCSIRequest) PVSCSIRequestList;
 
-typedef struct {
+struct PVSCSIState {
     PCIDevice parent_obj;
     MemoryRegion io_space;
     SCSIBus bus;
@@ -132,7 +135,7 @@ typedef struct {
     uint32_t resetting;                  /* Reset in progress                */
 
     uint32_t compat_flags;
-} PVSCSIState;
+};
 
 typedef struct PVSCSIRequest {
     SCSIRequest *sreq;
diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index 435be3ec5e..c8dae27083 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -26,6 +26,7 @@
 #include "hw/sd/allwinner-sdhost.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define TYPE_AW_SDHOST_BUS "allwinner-sdhost-bus"
 #define AW_SDHOST_BUS(obj) \
diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
index 8b7e600d92..bcf9e27e76 100644
--- a/hw/sd/bcm2835_sdhost.c
+++ b/hw/sd/bcm2835_sdhost.c
@@ -19,6 +19,7 @@
 #include "hw/sd/bcm2835_sdhost.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define TYPE_BCM2835_SDHOST_BUS "bcm2835-sdhost-bus"
 #define BCM2835_SDHOST_BUS(obj) \
diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 76f6ae9d23..1a859d6d93 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -32,6 +32,7 @@
 #include "sysemu/blockdev.h"
 #include "hw/qdev-properties.h"
 #include "hw/sd/sd.h"
+#include "qom/object.h"
 
 enum {
     ENABLE_CMD_TX   = (1<<0),
@@ -63,6 +64,7 @@ enum {
 };
 
 #define TYPE_MILKYMIST_MEMCARD "milkymist-memcard"
+typedef struct MilkymistMemcardState MilkymistMemcardState;
 #define MILKYMIST_MEMCARD(obj) \
     OBJECT_CHECK(MilkymistMemcardState, (obj), TYPE_MILKYMIST_MEMCARD)
 
@@ -83,7 +85,6 @@ struct MilkymistMemcardState {
     uint8_t response[17];
     uint32_t regs[R_MAX];
 };
-typedef struct MilkymistMemcardState MilkymistMemcardState;
 
 static void update_pending_bits(MilkymistMemcardState *s)
 {
diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 499dd48a3a..4ef76290c6 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define TYPE_PXA2XX_MMCI_BUS "pxa2xx-mmci-bus"
 #define PXA2XX_MMCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_PXA2XX_MMCI_BUS)
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index c57e336a73..b7d91e7598 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -37,6 +37,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define TYPE_SDHCI_BUS "sdhci-bus"
 #define SDHCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_SDHCI_BUS)
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 21b761e5d5..83cf0f086f 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -18,6 +18,7 @@
 #include "hw/sd/sd.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 //#define DEBUG_SSI_SD 1
 
@@ -40,7 +41,7 @@ typedef enum {
     SSI_SD_DATA_READ,
 } ssi_sd_mode;
 
-typedef struct {
+struct ssi_sd_state {
     SSISlave ssidev;
     uint32_t mode;
     int cmd;
@@ -50,7 +51,8 @@ typedef struct {
     int32_t response_pos;
     int32_t stopping;
     SDBus sdbus;
-} ssi_sd_state;
+};
+typedef struct ssi_sd_state ssi_sd_state;
 
 #define TYPE_SSI_SD "ssi-sd"
 #define SSI_SD(obj) OBJECT_CHECK(ssi_sd_state, (obj), TYPE_SSI_SD)
diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
index b6f5a54781..e3d11f7fad 100644
--- a/hw/sh4/sh_pci.c
+++ b/hw/sh4/sh_pci.c
@@ -31,13 +31,15 @@
 #include "qemu/bswap.h"
 #include "qemu/module.h"
 #include "exec/address-spaces.h"
+#include "qom/object.h"
 
 #define TYPE_SH_PCI_HOST_BRIDGE "sh_pci"
 
+typedef struct SHPCIState SHPCIState;
 #define SH_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(SHPCIState, (obj), TYPE_SH_PCI_HOST_BRIDGE)
 
-typedef struct SHPCIState {
+struct SHPCIState {
     PCIHostState parent_obj;
 
     PCIDevice *dev;
@@ -48,7 +50,7 @@ typedef struct SHPCIState {
     uint32_t par;
     uint32_t mbr;
     uint32_t iobr;
-} SHPCIState;
+};
 
 static void sh_pci_reg_write (void *p, hwaddr addr, uint64_t val,
                               unsigned size)
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index d5553824bd..a2c8e7cde7 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -52,6 +52,7 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "trace.h"
+#include "qom/object.h"
 
 /*
  * Sun4m architecture was used in the following machines:
@@ -591,14 +592,15 @@ static void idreg_init(hwaddr addr)
                             idreg_data, sizeof(idreg_data));
 }
 
+typedef struct IDRegState IDRegState;
 #define MACIO_ID_REGISTER(obj) \
     OBJECT_CHECK(IDRegState, (obj), TYPE_MACIO_ID_REGISTER)
 
-typedef struct IDRegState {
+struct IDRegState {
     SysBusDevice parent_obj;
 
     MemoryRegion mem;
-} IDRegState;
+};
 
 static void idreg_realize(DeviceState *ds, Error **errp)
 {
@@ -634,13 +636,14 @@ static const TypeInfo idreg_info = {
 TYPE_INFO(idreg_info)
 
 #define TYPE_TCX_AFX "tcx_afx"
+typedef struct AFXState AFXState;
 #define TCX_AFX(obj) OBJECT_CHECK(AFXState, (obj), TYPE_TCX_AFX)
 
-typedef struct AFXState {
+struct AFXState {
     SysBusDevice parent_obj;
 
     MemoryRegion mem;
-} AFXState;
+};
 
 /* SS-5 TCX AFX register */
 static void afx_init(hwaddr addr)
@@ -688,13 +691,14 @@ static const TypeInfo afx_info = {
 TYPE_INFO(afx_info)
 
 #define TYPE_OPENPROM "openprom"
+typedef struct PROMState PROMState;
 #define OPENPROM(obj) OBJECT_CHECK(PROMState, (obj), TYPE_OPENPROM)
 
-typedef struct PROMState {
+struct PROMState {
     SysBusDevice parent_obj;
 
     MemoryRegion prom;
-} PROMState;
+};
 
 /* Boot PROM (OpenBIOS) */
 static uint64_t translate_prom_address(void *opaque, uint64_t addr)
@@ -777,12 +781,13 @@ static const TypeInfo prom_info = {
 TYPE_INFO(prom_info)
 
 #define TYPE_SUN4M_MEMORY "memory"
+typedef struct RamDevice RamDevice;
 #define SUN4M_RAM(obj) OBJECT_CHECK(RamDevice, (obj), TYPE_SUN4M_MEMORY)
 
-typedef struct RamDevice {
+struct RamDevice {
     SysBusDevice parent_obj;
     HostMemoryBackend *memdev;
-} RamDevice;
+};
 
 /* System RAM */
 static void ram_realize(DeviceState *dev, Error **errp)
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 326e32b911..5f1f888d12 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -55,6 +55,7 @@
 #include "hw/fw-path-provider.h"
 #include "elf.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define KERNEL_LOAD_ADDR     0x00404000
 #define CMDLINE_ADDR         0x003ff000
@@ -79,7 +80,7 @@ struct hwdef {
     uint64_t console_serial_base;
 };
 
-typedef struct EbusState {
+struct EbusState {
     /*< private >*/
     PCIDevice parent_obj;
 
@@ -88,7 +89,8 @@ typedef struct EbusState {
     uint64_t console_serial_base;
     MemoryRegion bar0;
     MemoryRegion bar1;
-} EbusState;
+};
+typedef struct EbusState EbusState;
 
 #define TYPE_EBUS "ebus"
 #define EBUS(obj) OBJECT_CHECK(EbusState, (obj), TYPE_EBUS)
@@ -226,13 +228,14 @@ typedef struct ResetData {
 } ResetData;
 
 #define TYPE_SUN4U_POWER "power"
+typedef struct PowerDevice PowerDevice;
 #define SUN4U_POWER(obj) OBJECT_CHECK(PowerDevice, (obj), TYPE_SUN4U_POWER)
 
-typedef struct PowerDevice {
+struct PowerDevice {
     SysBusDevice parent_obj;
 
     MemoryRegion power_mmio;
-} PowerDevice;
+};
 
 /* Power */
 static uint64_t power_mem_read(void *opaque, hwaddr addr, unsigned size)
@@ -401,13 +404,14 @@ static const TypeInfo ebus_info = {
 TYPE_INFO(ebus_info)
 
 #define TYPE_OPENPROM "openprom"
+typedef struct PROMState PROMState;
 #define OPENPROM(obj) OBJECT_CHECK(PROMState, (obj), TYPE_OPENPROM)
 
-typedef struct PROMState {
+struct PROMState {
     SysBusDevice parent_obj;
 
     MemoryRegion prom;
-} PROMState;
+};
 
 static uint64_t translate_prom_address(void *opaque, uint64_t addr)
 {
@@ -490,14 +494,15 @@ TYPE_INFO(prom_info)
 
 
 #define TYPE_SUN4U_MEMORY "memory"
+typedef struct RamDevice RamDevice;
 #define SUN4U_RAM(obj) OBJECT_CHECK(RamDevice, (obj), TYPE_SUN4U_MEMORY)
 
-typedef struct RamDevice {
+struct RamDevice {
     SysBusDevice parent_obj;
 
     MemoryRegion ram;
     uint64_t size;
-} RamDevice;
+};
 
 /* System RAM */
 static void ram_realize(DeviceState *dev, Error **errp)
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 9461e57b8b..d9b6da316b 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -17,6 +17,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 
 struct SSIBus {
     BusState parent_obj;
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index 4f6f50e313..a895621ff1 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -34,6 +34,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/ssi/ssi.h"
+#include "qom/object.h"
 
 #ifdef XILINX_SPI_ERR_DEBUG
 #define DB_PRINT(...) do { \
@@ -78,9 +79,10 @@
 #define FIFO_CAPACITY 256
 
 #define TYPE_XILINX_SPI "xlnx.xps-spi"
+typedef struct XilinxSPI XilinxSPI;
 #define XILINX_SPI(obj) OBJECT_CHECK(XilinxSPI, (obj), TYPE_XILINX_SPI)
 
-typedef struct XilinxSPI {
+struct XilinxSPI {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
@@ -97,7 +99,7 @@ typedef struct XilinxSPI {
     Fifo8 tx_fifo;
 
     uint32_t regs[R_MAX];
-} XilinxSPI;
+};
 
 static void txfifo_reset(XilinxSPI *s)
 {
diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c
index 922b14c335..f22729261f 100644
--- a/hw/timer/altera_timer.c
+++ b/hw/timer/altera_timer.c
@@ -26,6 +26,7 @@
 #include "hw/irq.h"
 #include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 #define R_STATUS      0
 #define R_CONTROL     1
@@ -44,17 +45,18 @@
 #define CONTROL_STOP  0x0008
 
 #define TYPE_ALTERA_TIMER "ALTR.timer"
+typedef struct AlteraTimer AlteraTimer;
 #define ALTERA_TIMER(obj) \
     OBJECT_CHECK(AlteraTimer, (obj), TYPE_ALTERA_TIMER)
 
-typedef struct AlteraTimer {
+struct AlteraTimer {
     SysBusDevice  busdev;
     MemoryRegion  mmio;
     qemu_irq      irq;
     uint32_t      freq_hz;
     ptimer_state *ptimer;
     uint32_t      regs[R_MAX];
-} AlteraTimer;
+};
 
 static int timer_irq_state(AlteraTimer *t)
 {
diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 664c2d9bfc..c9aa82fc09 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -16,6 +16,7 @@
 #include "hw/qdev-properties.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
+#include "qom/object.h"
 
 /* Common timer implementation.  */
 
@@ -190,9 +191,10 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
 */
 
 #define TYPE_SP804 "sp804"
+typedef struct SP804State SP804State;
 #define SP804(obj) OBJECT_CHECK(SP804State, (obj), TYPE_SP804)
 
-typedef struct SP804State {
+struct SP804State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -200,7 +202,7 @@ typedef struct SP804State {
     uint32_t freq0, freq1;
     int level[2];
     qemu_irq irq;
-} SP804State;
+};
 
 static const uint8_t sp804_ids[] = {
     /* Timer ID */
@@ -310,15 +312,16 @@ static void sp804_realize(DeviceState *dev, Error **errp)
 /* Integrator/CP timer module.  */
 
 #define TYPE_INTEGRATOR_PIT "integrator_pit"
+typedef struct icp_pit_state icp_pit_state;
 #define INTEGRATOR_PIT(obj) \
     OBJECT_CHECK(icp_pit_state, (obj), TYPE_INTEGRATOR_PIT)
 
-typedef struct {
+struct icp_pit_state {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
     arm_timer_state *timer[3];
-} icp_pit_state;
+};
 
 static uint64_t icp_pit_read(void *opaque, hwaddr offset,
                              unsigned size)
diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
index 9ab120cf9c..35a9887fea 100644
--- a/hw/timer/cadence_ttc.c
+++ b/hw/timer/cadence_ttc.c
@@ -22,6 +22,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 
 #ifdef CADENCE_TTC_ERR_DEBUG
 #define DB_PRINT(...) do { \
@@ -69,15 +70,16 @@ typedef struct {
 } CadenceTimerState;
 
 #define TYPE_CADENCE_TTC "cadence_ttc"
+typedef struct CadenceTTCState CadenceTTCState;
 #define CADENCE_TTC(obj) \
     OBJECT_CHECK(CadenceTTCState, (obj), TYPE_CADENCE_TTC)
 
-typedef struct CadenceTTCState {
+struct CadenceTTCState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
     CadenceTimerState timer[3];
-} CadenceTTCState;
+};
 
 static void cadence_timer_update(CadenceTimerState *s)
 {
diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 77767a1beb..a16c9c6f62 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -30,6 +30,7 @@
 #include "qemu/timer.h"
 #include "hw/irq.h"
 #include "hw/ptimer.h"
+#include "qom/object.h"
 
 #define D(x)
 
@@ -48,10 +49,11 @@
 #define R_MASKED_INTR 0x54
 
 #define TYPE_ETRAX_FS_TIMER "etraxfs,timer"
+typedef struct ETRAXTimerState ETRAXTimerState;
 #define ETRAX_TIMER(obj) \
     OBJECT_CHECK(ETRAXTimerState, (obj), TYPE_ETRAX_FS_TIMER)
 
-typedef struct ETRAXTimerState {
+struct ETRAXTimerState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
@@ -79,7 +81,7 @@ typedef struct ETRAXTimerState {
     uint32_t rw_ack_intr;
     uint32_t r_intr;
     uint32_t r_masked_intr;
-} ETRAXTimerState;
+};
 
 static uint64_t
 timer_read(void *opaque, hwaddr addr, unsigned int size)
diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 077c820f3b..2848b6fcbd 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -62,6 +62,7 @@
 
 #include "hw/arm/exynos4210.h"
 #include "hw/irq.h"
+#include "qom/object.h"
 
 //#define DEBUG_MCT
 
@@ -242,10 +243,11 @@ typedef struct {
 } Exynos4210MCTLT;
 
 #define TYPE_EXYNOS4210_MCT "exynos4210.mct"
+typedef struct Exynos4210MCTState Exynos4210MCTState;
 #define EXYNOS4210_MCT(obj) \
     OBJECT_CHECK(Exynos4210MCTState, (obj), TYPE_EXYNOS4210_MCT)
 
-typedef struct Exynos4210MCTState {
+struct Exynos4210MCTState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -257,7 +259,7 @@ typedef struct Exynos4210MCTState {
     Exynos4210MCTGT g_timer;
 
     uint32_t    freq;                   /* all timers tick frequency, TCLK */
-} Exynos4210MCTState;
+};
 
 /*** VMState ***/
 static const VMStateDescription vmstate_tick_timer = {
diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index c71063f6b0..25970c3182 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -30,6 +30,7 @@
 
 #include "hw/arm/exynos4210.h"
 #include "hw/irq.h"
+#include "qom/object.h"
 
 //#define DEBUG_PWM
 
@@ -102,10 +103,11 @@ typedef struct {
 } Exynos4210PWM;
 
 #define TYPE_EXYNOS4210_PWM "exynos4210.pwm"
+typedef struct Exynos4210PWMState Exynos4210PWMState;
 #define EXYNOS4210_PWM(obj) \
     OBJECT_CHECK(Exynos4210PWMState, (obj), TYPE_EXYNOS4210_PWM)
 
-typedef struct Exynos4210PWMState {
+struct Exynos4210PWMState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -116,7 +118,7 @@ typedef struct Exynos4210PWMState {
 
     Exynos4210PWM timer[EXYNOS4210_PWM_TIMERS_NUM];
 
-} Exynos4210PWMState;
+};
 
 /*** VMState ***/
 static const VMStateDescription vmstate_exynos4210_pwm = {
diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index d5bf6cb1f7..c05f94ec3b 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -32,6 +32,7 @@
 #include "qemu/module.h"
 
 #include "trace.h"
+#include "qom/object.h"
 
 #define UNIT_REG_SIZE    16     /* Size of memory mapped regs for the unit */
 #define GPTIMER_REG_SIZE 16     /* Size of memory mapped regs for a GPTimer */
@@ -55,11 +56,11 @@
 #define COUNTER_RELOAD_OFFSET 0x04
 #define TIMER_BASE            0x10
 
+typedef struct GPTimerUnit GPTimerUnit;
 #define GRLIB_GPTIMER(obj) \
     OBJECT_CHECK(GPTimerUnit, (obj), TYPE_GRLIB_GPTIMER)
 
 typedef struct GPTimer     GPTimer;
-typedef struct GPTimerUnit GPTimerUnit;
 
 struct GPTimer {
     struct ptimer_state *ptimer;
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 37f02c3c34..5f469e726f 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -37,6 +37,7 @@
 #include "migration/vmstate.h"
 #include "hw/timer/i8254.h"
 #include "exec/address-spaces.h"
+#include "qom/object.h"
 
 //#define HPET_DEBUG
 #ifdef HPET_DEBUG
@@ -47,6 +48,7 @@
 
 #define HPET_MSI_SUPPORT        0
 
+typedef struct HPETState HPETState;
 #define HPET(obj) OBJECT_CHECK(HPETState, (obj), TYPE_HPET)
 
 struct HPETState;
@@ -65,7 +67,7 @@ typedef struct HPETTimer {  /* timers */
                              */
 } HPETTimer;
 
-typedef struct HPETState {
+struct HPETState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -87,7 +89,7 @@ typedef struct HPETState {
     uint64_t isr;               /* interrupt status reg */
     uint64_t hpet_counter;      /* main counter */
     uint8_t  hpet_id;           /* instance id */
-} HPETState;
+};
 
 static uint32_t hpet_in_legacy_mode(HPETState *s)
 {
diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
index f20d3d53e2..7e5abd7fc7 100644
--- a/hw/timer/i8254.c
+++ b/hw/timer/i8254.c
@@ -28,6 +28,7 @@
 #include "qemu/timer.h"
 #include "hw/timer/i8254.h"
 #include "hw/timer/i8254_internal.h"
+#include "qom/object.h"
 
 //#define DEBUG_PIT
 
@@ -36,14 +37,15 @@
 #define RW_STATE_WORD0 3
 #define RW_STATE_WORD1 4
 
+typedef struct PITClass PITClass;
 #define PIT_CLASS(class) OBJECT_CLASS_CHECK(PITClass, (class), TYPE_I8254)
 #define PIT_GET_CLASS(obj) OBJECT_GET_CLASS(PITClass, (obj), TYPE_I8254)
 
-typedef struct PITClass {
+struct PITClass {
     PITCommonClass parent_class;
 
     DeviceRealize parent_realize;
-} PITClass;
+};
 
 static void pit_irq_timer_update(PITChannelState *s, int64_t current_time);
 
diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c
index 929e8fee10..ccbbdaa102 100644
--- a/hw/timer/lm32_timer.c
+++ b/hw/timer/lm32_timer.c
@@ -31,6 +31,7 @@
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define DEFAULT_FREQUENCY (50*1000000)
 
@@ -55,6 +56,7 @@ enum {
 };
 
 #define TYPE_LM32_TIMER "lm32-timer"
+typedef struct LM32TimerState LM32TimerState;
 #define LM32_TIMER(obj) OBJECT_CHECK(LM32TimerState, (obj), TYPE_LM32_TIMER)
 
 struct LM32TimerState {
@@ -69,7 +71,6 @@ struct LM32TimerState {
 
     uint32_t regs[R_MAX];
 };
-typedef struct LM32TimerState LM32TimerState;
 
 static void timer_update_irq(LM32TimerState *s)
 {
diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
index 0e3787546a..cbbb3c991c 100644
--- a/hw/timer/milkymist-sysctl.c
+++ b/hw/timer/milkymist-sysctl.c
@@ -32,6 +32,7 @@
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 enum {
     CTRL_ENABLE      = (1<<0),
@@ -62,6 +63,7 @@ enum {
 };
 
 #define TYPE_MILKYMIST_SYSCTL "milkymist-sysctl"
+typedef struct MilkymistSysctlState MilkymistSysctlState;
 #define MILKYMIST_SYSCTL(obj) \
     OBJECT_CHECK(MilkymistSysctlState, (obj), TYPE_MILKYMIST_SYSCTL)
 
@@ -84,7 +86,6 @@ struct MilkymistSysctlState {
     qemu_irq timer0_irq;
     qemu_irq timer1_irq;
 };
-typedef struct MilkymistSysctlState MilkymistSysctlState;
 
 static void sysctl_icap_write(MilkymistSysctlState *s, uint32_t value)
 {
diff --git a/hw/timer/puv3_ost.c b/hw/timer/puv3_ost.c
index a9fff5b89f..86143380d5 100644
--- a/hw/timer/puv3_ost.c
+++ b/hw/timer/puv3_ost.c
@@ -15,15 +15,17 @@
 #include "hw/ptimer.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
+#include "qom/object.h"
 
 #undef DEBUG_PUV3
 #include "hw/unicore32/puv3.h"
 
 #define TYPE_PUV3_OST "puv3_ost"
+typedef struct PUV3OSTState PUV3OSTState;
 #define PUV3_OST(obj) OBJECT_CHECK(PUV3OSTState, (obj), TYPE_PUV3_OST)
 
 /* puv3 ostimer implementation. */
-typedef struct PUV3OSTState {
+struct PUV3OSTState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -34,7 +36,7 @@ typedef struct PUV3OSTState {
     uint32_t reg_OSCR;
     uint32_t reg_OSSR;
     uint32_t reg_OIER;
-} PUV3OSTState;
+};
 
 static uint64_t puv3_ost_read(void *opaque, hwaddr offset,
         unsigned size)
diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index 46a315e6db..e2b161d2b5 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -17,6 +17,7 @@
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define OSMR0	0x00
 #define OSMR1	0x04
@@ -66,10 +67,10 @@ static int pxa2xx_timer4_freq[8] = {
 };
 
 #define TYPE_PXA2XX_TIMER "pxa2xx-timer"
+typedef struct PXA2xxTimerInfo PXA2xxTimerInfo;
 #define PXA2XX_TIMER(obj) \
     OBJECT_CHECK(PXA2xxTimerInfo, (obj), TYPE_PXA2XX_TIMER)
 
-typedef struct PXA2xxTimerInfo PXA2xxTimerInfo;
 
 typedef struct {
     uint32_t value;
diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index 36734c07e6..1c6c7b96a7 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -31,6 +31,7 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 /*
  * Registers of hardware timer in sun4m.
@@ -59,16 +60,17 @@ typedef struct CPUTimerState {
 } CPUTimerState;
 
 #define TYPE_SLAVIO_TIMER "slavio_timer"
+typedef struct SLAVIO_TIMERState SLAVIO_TIMERState;
 #define SLAVIO_TIMER(obj) \
     OBJECT_CHECK(SLAVIO_TIMERState, (obj), TYPE_SLAVIO_TIMER)
 
-typedef struct SLAVIO_TIMERState {
+struct SLAVIO_TIMERState {
     SysBusDevice parent_obj;
 
     uint32_t num_cpus;
     uint32_t cputimer_mode;
     CPUTimerState cputimer[MAX_CPUS + 1];
-} SLAVIO_TIMERState;
+};
 
 typedef struct TimerContext {
     MemoryRegion iomem;
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index f14d4c14bb..bd36d906a2 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -29,6 +29,7 @@
 #include "hw/qdev-properties.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define D(x)
 
diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index 788d05adc5..a1e239813e 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -29,8 +29,9 @@
 #include "tpm_prop.h"
 #include "tpm_ppi.h"
 #include "trace.h"
+#include "qom/object.h"
 
-typedef struct CRBState {
+struct CRBState {
     DeviceState parent_obj;
 
     TPMBackend *tpmbe;
@@ -43,7 +44,8 @@ typedef struct CRBState {
 
     bool ppi_enabled;
     TPMPPI ppi;
-} CRBState;
+};
+typedef struct CRBState CRBState;
 
 #define CRB(obj) OBJECT_CHECK(CRBState, (obj), TYPE_TPM_CRB)
 
diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
index 7f83a8b3b2..c96f869ebf 100644
--- a/hw/tpm/tpm_spapr.c
+++ b/hw/tpm/tpm_spapr.c
@@ -26,9 +26,11 @@
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_vio.h"
 #include "trace.h"
+#include "qom/object.h"
 
 #define DEBUG_SPAPR 0
 
+typedef struct SpaprTpmState SpaprTpmState;
 #define VIO_SPAPR_VTPM(obj) \
      OBJECT_CHECK(SpaprTpmState, (obj), TYPE_TPM_SPAPR)
 
@@ -64,7 +66,7 @@ typedef struct TpmCrq {
 
 #define TPM_SPAPR_BUFFER_MAX                 4096
 
-typedef struct {
+struct SpaprTpmState {
     SpaprVioDevice vdev;
 
     TpmCrq crq; /* track single TPM command */
@@ -84,7 +86,7 @@ typedef struct {
     TPMVersion be_tpm_version;
 
     size_t be_buffer_size;
-} SpaprTpmState;
+};
 
 /*
  * Send a request to the TPM.
diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
index 3bb4ec10fa..2daef11cde 100644
--- a/hw/tpm/tpm_tis_isa.c
+++ b/hw/tpm/tpm_tis_isa.c
@@ -29,14 +29,16 @@
 #include "hw/acpi/tpm.h"
 #include "tpm_prop.h"
 #include "tpm_tis.h"
+#include "qom/object.h"
 
-typedef struct TPMStateISA {
+struct TPMStateISA {
     /*< private >*/
     ISADevice parent_obj;
 
     /*< public >*/
     TPMState state; /* not a QOM object */
-} TPMStateISA;
+};
+typedef struct TPMStateISA TPMStateISA;
 
 #define TPM_TIS_ISA(obj) OBJECT_CHECK(TPMStateISA, (obj), TYPE_TPM_TIS_ISA)
 
diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
index 2a63c68f22..4a05f1cfa3 100644
--- a/hw/tpm/tpm_tis_sysbus.c
+++ b/hw/tpm/tpm_tis_sysbus.c
@@ -29,14 +29,16 @@
 #include "tpm_prop.h"
 #include "hw/sysbus.h"
 #include "tpm_tis.h"
+#include "qom/object.h"
 
-typedef struct TPMStateSysBus {
+struct TPMStateSysBus {
     /*< private >*/
     SysBusDevice parent_obj;
 
     /*< public >*/
     TPMState state; /* not a QOM object */
-} TPMStateSysBus;
+};
+typedef struct TPMStateSysBus TPMStateSysBus;
 
 #define TPM_TIS_SYSBUS(obj) OBJECT_CHECK(TPMStateSysBus, (obj), TYPE_TPM_TIS_SYSBUS)
 
diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index e4647413c6..50f60f656f 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -35,6 +35,7 @@
 #include "ccid.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 
 #define DPRINTF(card, lvl, fmt, ...) \
 do {\
@@ -45,6 +46,7 @@ do {\
 
 
 #define TYPE_EMULATED_CCID "ccid-card-emulated"
+typedef struct EmulatedState EmulatedState;
 #define EMULATED_CCID_CARD(obj) \
     OBJECT_CHECK(EmulatedState, (obj), TYPE_EMULATED_CCID)
 
@@ -58,7 +60,6 @@ enum {
 
 #define DEFAULT_BACKEND BACKEND_NSS_EMULATED
 
-typedef struct EmulatedState EmulatedState;
 
 enum {
     EMUL_READER_INSERT = 0,
diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index 4a53ab2742..a8a241f4d3 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -20,6 +20,7 @@
 #include "qemu/sockets.h"
 #include "ccid.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 
 #define DPRINTF(card, lvl, fmt, ...)                    \
 do {                                                    \
diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index eaef43d2b9..74215edd04 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -36,6 +36,7 @@
 #include "migration/vmstate.h"
 #include "desc.h"
 #include "audio/audio.h"
+#include "qom/object.h"
 
 static void usb_audio_reinit(USBDevice *dev, unsigned channels);
 
@@ -633,7 +634,7 @@ static uint8_t *streambuf_get(struct streambuf *buf, size_t *len)
     return data;
 }
 
-typedef struct USBAudioState {
+struct USBAudioState {
     /* qemu interfaces */
     USBDevice dev;
     QEMUSoundCard card;
@@ -652,7 +653,8 @@ typedef struct USBAudioState {
     uint32_t debug;
     uint32_t buffer_user, buffer;
     bool multi;
-} USBAudioState;
+};
+typedef struct USBAudioState USBAudioState;
 
 #define TYPE_USB_AUDIO "usb-audio"
 #define USB_AUDIO(obj) OBJECT_CHECK(USBAudioState, (obj), TYPE_USB_AUDIO)
diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
index 30aff4499f..7872ba25a3 100644
--- a/hw/usb/dev-hid.c
+++ b/hw/usb/dev-hid.c
@@ -33,6 +33,7 @@
 #include "qemu/timer.h"
 #include "hw/input/hid.h"
 #include "hw/qdev-properties.h"
+#include "qom/object.h"
 
 /* HID interface requests */
 #define GET_REPORT   0xa101
@@ -47,14 +48,15 @@
 #define USB_DT_REPORT 0x22
 #define USB_DT_PHY    0x23
 
-typedef struct USBHIDState {
+struct USBHIDState {
     USBDevice dev;
     USBEndpoint *intr;
     HIDState hid;
     uint32_t usb_version;
     char *display;
     uint32_t head;
-} USBHIDState;
+};
+typedef struct USBHIDState USBHIDState;
 
 #define TYPE_USB_HID "usb-hid"
 #define USB_HID(obj) OBJECT_CHECK(USBHIDState, (obj), TYPE_USB_HID)
diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
index f4193dfe85..ceeda6b464 100644
--- a/hw/usb/dev-hub.c
+++ b/hw/usb/dev-hub.c
@@ -32,6 +32,7 @@
 #include "desc.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define MAX_PORTS 8
 
@@ -41,14 +42,15 @@ typedef struct USBHubPort {
     uint16_t wPortChange;
 } USBHubPort;
 
-typedef struct USBHubState {
+struct USBHubState {
     USBDevice dev;
     USBEndpoint *intr;
     uint32_t num_ports;
     bool port_power;
     QEMUTimer *port_timer;
     USBHubPort ports[MAX_PORTS];
-} USBHubState;
+};
+typedef struct USBHubState USBHubState;
 
 #define TYPE_USB_HUB "usb-hub"
 #define USB_HUB(obj) OBJECT_CHECK(USBHubState, (obj), TYPE_USB_HUB)
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 2e42a799eb..eff0247d85 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -28,6 +28,7 @@
 #include "migration/vmstate.h"
 #include "desc.h"
 #include "qemu/units.h"
+#include "qom/object.h"
 
 /* ----------------------------------------------------------------------- */
 
diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index e5eb181d9e..59b637e398 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -37,6 +37,7 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
+#include "qom/object.h"
 
 /*#define TRAFFIC_DEBUG*/
 /* Thanks to NetChip Technologies for donating this product ID.
@@ -629,7 +630,7 @@ struct rndis_response {
     uint8_t buf[];
 };
 
-typedef struct USBNetState {
+struct USBNetState {
     USBDevice dev;
 
     enum rndis_state rndis_state;
@@ -651,7 +652,8 @@ typedef struct USBNetState {
     NICState *nic;
     NICConf conf;
     QTAILQ_HEAD(, rndis_response) rndis_resp;
-} USBNetState;
+};
+typedef struct USBNetState USBNetState;
 
 #define TYPE_USB_NET "usb-net"
 #define USB_NET(obj) OBJECT_CHECK(USBNetState, (obj), TYPE_USB_NET)
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index a6d85abd12..4b2d59f740 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -19,6 +19,7 @@
 #include "desc.h"
 #include "chardev/char-serial.h"
 #include "chardev/char-fe.h"
+#include "qom/object.h"
 
 //#define DEBUG_Serial
 
@@ -96,7 +97,7 @@ do { printf("usb-serial: " fmt , ## __VA_ARGS__); } while (0)
 #define FTDI_TEMT (1<<6)        // Transmitter Empty
 #define FTDI_FIFO (1<<7)        // Error in FIFO
 
-typedef struct {
+struct USBSerialState {
     USBDevice dev;
     USBEndpoint *intr;
     uint8_t recv_buf[RECV_BUF];
@@ -108,7 +109,8 @@ typedef struct {
     QEMUSerialSetParams params;
     int latency;        /* ms */
     CharBackend cs;
-} USBSerialState;
+};
+typedef struct USBSerialState USBSerialState;
 
 #define TYPE_USB_SERIAL "usb-serial-dev"
 #define USB_SERIAL_DEV(obj) OBJECT_CHECK(USBSerialState, (obj), TYPE_USB_SERIAL)
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index a34aba700f..399de75fe4 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -46,6 +46,7 @@
 #include "desc.h"
 
 #include "ccid.h"
+#include "qom/object.h"
 
 #define DPRINTF(s, lvl, fmt, ...) \
 do { \
@@ -60,6 +61,7 @@ do { \
 #define D_VERBOSE 4
 
 #define CCID_DEV_NAME "usb-ccid"
+typedef struct USBCCIDState USBCCIDState;
 #define USB_CCID_DEV(obj) OBJECT_CHECK(USBCCIDState, (obj), CCID_DEV_NAME)
 /*
  * The two options for variable sized buffers:
@@ -274,14 +276,15 @@ typedef struct BulkIn {
     uint32_t pos;
 } BulkIn;
 
-typedef struct CCIDBus {
+struct CCIDBus {
     BusState qbus;
-} CCIDBus;
+};
+typedef struct CCIDBus CCIDBus;
 
 /*
  * powered - defaults to true, changed by PowerOn/PowerOff messages
  */
-typedef struct USBCCIDState {
+struct USBCCIDState {
     USBDevice dev;
     USBEndpoint *intr;
     USBEndpoint *bulk;
@@ -309,7 +312,7 @@ typedef struct USBCCIDState {
     uint8_t  powered;
     uint8_t  notify_slot_change;
     uint8_t  debug;
-} USBCCIDState;
+};
 
 /*
  * CCID Spec chapter 4: CCID uses a standard device descriptor per Chapter 9,
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 1b1b42016b..d6c694e77f 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -22,6 +22,7 @@
 #include "sysemu/block-backend.h"
 #include "qapi/visitor.h"
 #include "qemu/cutils.h"
+#include "qom/object.h"
 
 //#define DEBUG_MSD
 
@@ -50,7 +51,7 @@ struct usb_msd_csw {
     uint8_t status;
 };
 
-typedef struct {
+struct MSDState {
     USBDevice dev;
     enum USBMSDMode mode;
     uint32_t scsi_off;
@@ -65,7 +66,8 @@ typedef struct {
     BlockConf conf;
     uint32_t removable;
     SCSIDevice *scsi_dev;
-} MSDState;
+};
+typedef struct MSDState MSDState;
 
 #define TYPE_USB_STORAGE "usb-storage-dev"
 #define USB_STORAGE_DEV(obj) OBJECT_CHECK(MSDState, (obj), TYPE_USB_STORAGE)
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index 57f38da477..8bc6045267 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -23,6 +23,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/scsi/scsi.h"
 #include "scsi/constants.h"
+#include "qom/object.h"
 
 /* --------------------------------------------------------------------- */
 
diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
index cb8f156f8f..e6833a2a45 100644
--- a/hw/usb/dev-wacom.c
+++ b/hw/usb/dev-wacom.c
@@ -32,6 +32,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "desc.h"
+#include "qom/object.h"
 
 /* Interface requests */
 #define WACOM_GET_REPORT	0x2101
@@ -44,7 +45,7 @@
 #define HID_SET_IDLE		0x210a
 #define HID_SET_PROTOCOL	0x210b
 
-typedef struct USBWacomState {
+struct USBWacomState {
     USBDevice dev;
     USBEndpoint *intr;
     QEMUPutMouseEntry *eh_entry;
@@ -57,7 +58,8 @@ typedef struct USBWacomState {
     } mode;
     uint8_t idle;
     int changed;
-} USBWacomState;
+};
+typedef struct USBWacomState USBWacomState;
 
 #define TYPE_USB_WACOM "usb-wacom-tablet"
 #define USB_WACOM(obj) OBJECT_CHECK(USBWacomState, (obj), TYPE_USB_WACOM)
diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
index aa461de292..a66379ef13 100644
--- a/hw/usb/hcd-ohci-pci.c
+++ b/hw/usb/hcd-ohci-pci.c
@@ -29,11 +29,13 @@
 #include "hw/qdev-properties.h"
 #include "trace.h"
 #include "hcd-ohci.h"
+#include "qom/object.h"
 
 #define TYPE_PCI_OHCI "pci-ohci"
+typedef struct OHCIPCIState OHCIPCIState;
 #define PCI_OHCI(obj) OBJECT_CHECK(OHCIPCIState, (obj), TYPE_PCI_OHCI)
 
-typedef struct {
+struct OHCIPCIState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -42,7 +44,7 @@ typedef struct {
     char *masterbus;
     uint32_t num_ports;
     uint32_t firstport;
-} OHCIPCIState;
+};
 
 /**
  * A typical PCI OHCI will additionally set PERR in its configspace to
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index a30964ac2c..7540206b93 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -39,6 +39,7 @@
 #include "trace.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define FRAME_TIMER_FREQ 1000
 
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 89d313e7e1..71a03ff0f3 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -34,6 +34,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qom/object.h"
 #ifndef CONFIG_WIN32
 #include <poll.h>
 #endif
@@ -55,10 +56,10 @@
 /* ------------------------------------------------------------------------ */
 
 #define TYPE_USB_HOST_DEVICE "usb-host"
+typedef struct USBHostDevice USBHostDevice;
 #define USB_HOST_DEVICE(obj) \
      OBJECT_CHECK(USBHostDevice, (obj), TYPE_USB_HOST_DEVICE)
 
-typedef struct USBHostDevice USBHostDevice;
 typedef struct USBHostRequest USBHostRequest;
 typedef struct USBHostIsoXfer USBHostIsoXfer;
 typedef struct USBHostIsoRing USBHostIsoRing;
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index b5c1e656bd..16e8b06198 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -45,6 +45,7 @@
 #include "hw/usb.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 /* ERROR is defined below. Remove any previous definition. */
 #undef ERROR
diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
index fc1263fcd0..55e6aca3a1 100644
--- a/hw/usb/tusb6010.c
+++ b/hw/usb/tusb6010.c
@@ -28,11 +28,13 @@
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_TUSB6010 "tusb6010"
+typedef struct TUSBState TUSBState;
 #define TUSB(obj) OBJECT_CHECK(TUSBState, (obj), TYPE_TUSB6010)
 
-typedef struct TUSBState {
+struct TUSBState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem[2];
@@ -68,7 +70,7 @@ typedef struct TUSBState {
     uint32_t pullup[2];
     uint32_t control_config;
     uint32_t otg_timer_val;
-} TUSBState;
+};
 
 #define TUSB_DEVCLOCK			60000000	/* 60 MHz */
 
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index a45da2aa82..22ee36404c 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -28,13 +28,15 @@
 #include "hw/qdev-properties.h"
 #include "hw/s390x/ap-bridge.h"
 #include "exec/address-spaces.h"
+#include "qom/object.h"
 
 #define VFIO_AP_DEVICE_TYPE      "vfio-ap"
 
-typedef struct VFIOAPDevice {
+struct VFIOAPDevice {
     APDevice apdev;
     VFIODevice vdev;
-} VFIOAPDevice;
+};
+typedef struct VFIOAPDevice VFIOAPDevice;
 
 #define VFIO_AP_DEVICE(obj) \
         OBJECT_CHECK(VFIOAPDevice, (obj), VFIO_AP_DEVICE_TYPE)
diff --git a/hw/virtio/vhost-scsi-pci.c b/hw/virtio/vhost-scsi-pci.c
index 095af23f3f..2e836c3529 100644
--- a/hw/virtio/vhost-scsi-pci.c
+++ b/hw/virtio/vhost-scsi-pci.c
@@ -22,6 +22,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "virtio-pci.h"
+#include "qom/object.h"
 
 typedef struct VHostSCSIPCI VHostSCSIPCI;
 
diff --git a/hw/virtio/vhost-user-blk-pci.c b/hw/virtio/vhost-user-blk-pci.c
index 4f5d5cbf44..72ae695d24 100644
--- a/hw/virtio/vhost-user-blk-pci.c
+++ b/hw/virtio/vhost-user-blk-pci.c
@@ -27,6 +27,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "virtio-pci.h"
+#include "qom/object.h"
 
 typedef struct VHostUserBlkPCI VHostUserBlkPCI;
 
diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
index e11c889d82..6b01561c2f 100644
--- a/hw/virtio/vhost-user-fs-pci.c
+++ b/hw/virtio/vhost-user-fs-pci.c
@@ -15,6 +15,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-user-fs.h"
 #include "virtio-pci.h"
+#include "qom/object.h"
 
 struct VHostUserFSPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/vhost-user-input-pci.c b/hw/virtio/vhost-user-input-pci.c
index 0a50015599..b072fb576a 100644
--- a/hw/virtio/vhost-user-input-pci.c
+++ b/hw/virtio/vhost-user-input-pci.c
@@ -10,6 +10,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "virtio-pci.h"
+#include "qom/object.h"
 
 typedef struct VHostUserInputPCI VHostUserInputPCI;
 
diff --git a/hw/virtio/vhost-user-scsi-pci.c b/hw/virtio/vhost-user-scsi-pci.c
index 4705cd54e8..331f3e4346 100644
--- a/hw/virtio/vhost-user-scsi-pci.c
+++ b/hw/virtio/vhost-user-scsi-pci.c
@@ -31,6 +31,7 @@
 #include "hw/loader.h"
 #include "sysemu/kvm.h"
 #include "virtio-pci.h"
+#include "qom/object.h"
 
 typedef struct VHostUserSCSIPCI VHostUserSCSIPCI;
 
diff --git a/hw/virtio/vhost-user-vsock-pci.c b/hw/virtio/vhost-user-vsock-pci.c
index f4cf95873d..65bfc91d2d 100644
--- a/hw/virtio/vhost-user-vsock-pci.c
+++ b/hw/virtio/vhost-user-vsock-pci.c
@@ -13,6 +13,7 @@
 #include "virtio-pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-user-vsock.h"
+#include "qom/object.h"
 
 typedef struct VHostUserVSockPCI VHostUserVSockPCI;
 
diff --git a/hw/virtio/vhost-vsock-pci.c b/hw/virtio/vhost-vsock-pci.c
index a815278e69..49fcddcb5a 100644
--- a/hw/virtio/vhost-vsock-pci.c
+++ b/hw/virtio/vhost-vsock-pci.c
@@ -17,6 +17,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-vsock.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 typedef struct VHostVSockPCI VHostVSockPCI;
 
diff --git a/hw/virtio/virtio-9p-pci.c b/hw/virtio/virtio-9p-pci.c
index cbcb062faa..8ea357b868 100644
--- a/hw/virtio/virtio-9p-pci.c
+++ b/hw/virtio/virtio-9p-pci.c
@@ -19,19 +19,21 @@
 #include "hw/9pfs/virtio-9p.h"
 #include "hw/qdev-properties.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 /*
  * virtio-9p-pci: This extends VirtioPCIProxy.
  */
 
 #define TYPE_VIRTIO_9P_PCI "virtio-9p-pci-base"
+typedef struct V9fsPCIState V9fsPCIState;
 #define VIRTIO_9P_PCI(obj) \
         OBJECT_CHECK(V9fsPCIState, (obj), TYPE_VIRTIO_9P_PCI)
 
-typedef struct V9fsPCIState {
+struct V9fsPCIState {
     VirtIOPCIProxy parent_obj;
     V9fsVirtioState vdev;
-} V9fsPCIState;
+};
 
 static void virtio_9p_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
diff --git a/hw/virtio/virtio-balloon-pci.c b/hw/virtio/virtio-balloon-pci.c
index 5adc4e5819..35378c7309 100644
--- a/hw/virtio/virtio-balloon-pci.c
+++ b/hw/virtio/virtio-balloon-pci.c
@@ -19,6 +19,7 @@
 #include "hw/virtio/virtio-balloon.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 typedef struct VirtIOBalloonPCI VirtIOBalloonPCI;
 
diff --git a/hw/virtio/virtio-blk-pci.c b/hw/virtio/virtio-blk-pci.c
index 849cc7dfd8..80771954ee 100644
--- a/hw/virtio/virtio-blk-pci.c
+++ b/hw/virtio/virtio-blk-pci.c
@@ -22,6 +22,7 @@
 #include "virtio-pci.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 typedef struct VirtIOBlkPCI VirtIOBlkPCI;
 
diff --git a/hw/virtio/virtio-crypto-pci.c b/hw/virtio/virtio-crypto-pci.c
index 198f86e08c..518a87a36e 100644
--- a/hw/virtio/virtio-crypto-pci.c
+++ b/hw/virtio/virtio-crypto-pci.c
@@ -21,6 +21,7 @@
 #include "hw/virtio/virtio-crypto.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 typedef struct VirtIOCryptoPCI VirtIOCryptoPCI;
 
diff --git a/hw/virtio/virtio-input-host-pci.c b/hw/virtio/virtio-input-host-pci.c
index a82eb5d914..4d8479c92e 100644
--- a/hw/virtio/virtio-input-host-pci.c
+++ b/hw/virtio/virtio-input-host-pci.c
@@ -11,6 +11,7 @@
 #include "virtio-pci.h"
 #include "hw/virtio/virtio-input.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 typedef struct VirtIOInputHostPCI VirtIOInputHostPCI;
 
diff --git a/hw/virtio/virtio-input-pci.c b/hw/virtio/virtio-input-pci.c
index 29c633b3d8..205ed7bec9 100644
--- a/hw/virtio/virtio-input-pci.c
+++ b/hw/virtio/virtio-input-pci.c
@@ -12,6 +12,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-input.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 typedef struct VirtIOInputPCI VirtIOInputPCI;
 typedef struct VirtIOInputHIDPCI VirtIOInputHIDPCI;
diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index ba62d60a0a..17451f5a78 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -16,6 +16,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "qom/object.h"
 
 typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
 
diff --git a/hw/virtio/virtio-net-pci.c b/hw/virtio/virtio-net-pci.c
index 489b5dbad6..498fc02d8f 100644
--- a/hw/virtio/virtio-net-pci.c
+++ b/hw/virtio/virtio-net-pci.c
@@ -22,6 +22,7 @@
 #include "virtio-pci.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 typedef struct VirtIONetPCI VirtIONetPCI;
 
diff --git a/hw/virtio/virtio-rng-pci.c b/hw/virtio/virtio-rng-pci.c
index 8afbb4c209..8f953dff83 100644
--- a/hw/virtio/virtio-rng-pci.c
+++ b/hw/virtio/virtio-rng-pci.c
@@ -15,6 +15,7 @@
 #include "hw/virtio/virtio-rng.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 typedef struct VirtIORngPCI VirtIORngPCI;
 
diff --git a/hw/virtio/virtio-scsi-pci.c b/hw/virtio/virtio-scsi-pci.c
index c23a134202..6106bb38ae 100644
--- a/hw/virtio/virtio-scsi-pci.c
+++ b/hw/virtio/virtio-scsi-pci.c
@@ -19,6 +19,7 @@
 #include "hw/virtio/virtio-scsi.h"
 #include "qemu/module.h"
 #include "virtio-pci.h"
+#include "qom/object.h"
 
 typedef struct VirtIOSCSIPCI VirtIOSCSIPCI;
 
diff --git a/hw/virtio/virtio-serial-pci.c b/hw/virtio/virtio-serial-pci.c
index 95d25d54da..1bd769e88d 100644
--- a/hw/virtio/virtio-serial-pci.c
+++ b/hw/virtio/virtio-serial-pci.c
@@ -21,6 +21,7 @@
 #include "hw/virtio/virtio-serial.h"
 #include "qemu/module.h"
 #include "virtio-pci.h"
+#include "qom/object.h"
 
 typedef struct VirtIOSerialPCI VirtIOSerialPCI;
 
diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index 989713fa4b..219c628f66 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -26,6 +26,7 @@
 #include "sysemu/watchdog.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 /*#define I6300ESB_DEBUG 1*/
 
diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
index ead7d0dbbd..61d80c0913 100644
--- a/hw/watchdog/wdt_ib700.c
+++ b/hw/watchdog/wdt_ib700.c
@@ -25,6 +25,7 @@
 #include "sysemu/watchdog.h"
 #include "hw/isa/isa.h"
 #include "migration/vmstate.h"
+#include "qom/object.h"
 
 /*#define IB700_DEBUG 1*/
 
@@ -36,15 +37,16 @@
 #endif
 
 #define TYPE_IB700 "ib700"
+typedef struct IB700state IB700State;
 #define IB700(obj) OBJECT_CHECK(IB700State, (obj), TYPE_IB700)
 
-typedef struct IB700state {
+struct IB700state {
     ISADevice parent_obj;
 
     QEMUTimer *timer;
 
     PortioList port_list;
-} IB700State;
+};
 
 /* This is the timer.  We use a global here because the watchdog
  * code ensures there is only one watchdog (it is located at a fixed,
diff --git a/migration/rdma.c b/migration/rdma.c
index 15ad985d26..e3eac913bc 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -35,6 +35,7 @@
 #include <arpa/inet.h>
 #include <rdma/rdma_cma.h>
 #include "trace.h"
+#include "qom/object.h"
 
 /*
  * Print and error on both the Monitor and the Log file.
@@ -397,10 +398,10 @@ typedef struct RDMAContext {
 } RDMAContext;
 
 #define TYPE_QIO_CHANNEL_RDMA "qio-channel-rdma"
+typedef struct QIOChannelRDMA QIOChannelRDMA;
 #define QIO_CHANNEL_RDMA(obj)                                     \
     OBJECT_CHECK(QIOChannelRDMA, (obj), TYPE_QIO_CHANNEL_RDMA)
 
-typedef struct QIOChannelRDMA QIOChannelRDMA;
 
 
 struct QIOChannelRDMA {
diff --git a/net/can/can_socketcan.c b/net/can/can_socketcan.c
index c083e92735..b6fc55dc44 100644
--- a/net/can/can_socketcan.c
+++ b/net/can/can_socketcan.c
@@ -40,17 +40,19 @@
 #include <net/if.h>
 #include <linux/can.h>
 #include <linux/can/raw.h>
+#include "qom/object.h"
 
 #ifndef DEBUG_CAN
 #define DEBUG_CAN 0
 #endif /*DEBUG_CAN*/
 
 #define TYPE_CAN_HOST_SOCKETCAN "can-host-socketcan"
+typedef struct CanHostSocketCAN CanHostSocketCAN;
 #define CAN_HOST_SOCKETCAN(obj) \
      OBJECT_CHECK(CanHostSocketCAN, (obj), TYPE_CAN_HOST_SOCKETCAN)
 
 #define CAN_READ_BUF_LEN  5
-typedef struct CanHostSocketCAN {
+struct CanHostSocketCAN {
     CanHostState       parent;
     char               *ifname;
 
@@ -63,7 +65,7 @@ typedef struct CanHostSocketCAN {
     int                bufptr;
 
     int                fd;
-} CanHostSocketCAN;
+};
 
 /* Check that QEMU and Linux kernel flags encoding and structure matches */
 QEMU_BUILD_BUG_ON(QEMU_CAN_EFF_FLAG != CAN_EFF_FLAG);
diff --git a/net/colo-compare.c b/net/colo-compare.c
index b6f56fc915..01fc7027ae 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -36,6 +36,7 @@
 #include "qemu/coroutine.h"
 
 #define TYPE_COLO_COMPARE "colo-compare"
+typedef struct CompareState CompareState;
 #define COLO_COMPARE(obj) \
     OBJECT_CHECK(CompareState, (obj), TYPE_COLO_COMPARE)
 
@@ -100,7 +101,7 @@ typedef struct SendEntry {
     uint8_t *buf;
 } SendEntry;
 
-typedef struct CompareState {
+struct CompareState {
     Object parent;
 
     char *pri_indev;
@@ -136,7 +137,7 @@ typedef struct CompareState {
     enum colo_event event;
 
     QTAILQ_ENTRY(CompareState) next;
-} CompareState;
+};
 
 typedef struct CompareClass {
     ObjectClass parent_class;
diff --git a/net/dump.c b/net/dump.c
index ec9f20bea5..b3d69ece8f 100644
--- a/net/dump.c
+++ b/net/dump.c
@@ -33,6 +33,7 @@
 #include "qemu/timer.h"
 #include "qapi/visitor.h"
 #include "net/filter.h"
+#include "qom/object.h"
 
 typedef struct DumpState {
     int64_t start_ts;
@@ -139,6 +140,7 @@ static int net_dump_state_init(DumpState *s, const char *filename,
 
 #define TYPE_FILTER_DUMP "filter-dump"
 
+typedef struct NetFilterDumpState NetFilterDumpState;
 #define FILTER_DUMP(obj) \
     OBJECT_CHECK(NetFilterDumpState, (obj), TYPE_FILTER_DUMP)
 
@@ -148,7 +150,6 @@ struct NetFilterDumpState {
     char *filename;
     uint32_t maxlen;
 };
-typedef struct NetFilterDumpState NetFilterDumpState;
 
 static ssize_t filter_dump_receive_iov(NetFilterState *nf, NetClientState *sndr,
                                        unsigned flags, const struct iovec *iov,
diff --git a/net/filter-buffer.c b/net/filter-buffer.c
index 9a6b8132ea..c6b87f6b5f 100644
--- a/net/filter-buffer.c
+++ b/net/filter-buffer.c
@@ -18,16 +18,17 @@
 
 #define TYPE_FILTER_BUFFER "filter-buffer"
 
+typedef struct FilterBufferState FilterBufferState;
 #define FILTER_BUFFER(obj) \
     OBJECT_CHECK(FilterBufferState, (obj), TYPE_FILTER_BUFFER)
 
-typedef struct FilterBufferState {
+struct FilterBufferState {
     NetFilterState parent_obj;
 
     NetQueue *incoming_queue;
     uint32_t interval;
     QEMUTimer release_timer;
-} FilterBufferState;
+};
 
 static void filter_buffer_flush(NetFilterState *nf)
 {
diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index 09cb97332d..e34542db42 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -21,17 +21,18 @@
 #include "qemu/iov.h"
 #include "qemu/sockets.h"
 
+#define TYPE_FILTER_MIRROR "filter-mirror"
+typedef struct MirrorState MirrorState;
 #define FILTER_MIRROR(obj) \
     OBJECT_CHECK(MirrorState, (obj), TYPE_FILTER_MIRROR)
 
+#define TYPE_FILTER_REDIRECTOR "filter-redirector"
 #define FILTER_REDIRECTOR(obj) \
     OBJECT_CHECK(MirrorState, (obj), TYPE_FILTER_REDIRECTOR)
 
-#define TYPE_FILTER_MIRROR "filter-mirror"
-#define TYPE_FILTER_REDIRECTOR "filter-redirector"
 #define REDIRECTOR_MAX_LEN NET_BUFSIZE
 
-typedef struct MirrorState {
+struct MirrorState {
     NetFilterState parent_obj;
     char *indev;
     char *outdev;
@@ -39,7 +40,7 @@ typedef struct MirrorState {
     CharBackend chr_out;
     SocketReadState rs;
     bool vnet_hdr;
-} MirrorState;
+};
 
 static int filter_send(MirrorState *s,
                        const struct iovec *iov,
diff --git a/net/filter-replay.c b/net/filter-replay.c
index 9f95ee305b..bc8e641dda 100644
--- a/net/filter-replay.c
+++ b/net/filter-replay.c
@@ -19,9 +19,11 @@
 #include "qapi/visitor.h"
 #include "net/filter.h"
 #include "sysemu/replay.h"
+#include "qom/object.h"
 
 #define TYPE_FILTER_REPLAY "filter-replay"
 
+typedef struct NetFilterReplayState NetFilterReplayState;
 #define FILTER_REPLAY(obj) \
     OBJECT_CHECK(NetFilterReplayState, (obj), TYPE_FILTER_REPLAY)
 
@@ -29,7 +31,6 @@ struct NetFilterReplayState {
     NetFilterState nfs;
     ReplayNetState *rns;
 };
-typedef struct NetFilterReplayState NetFilterReplayState;
 
 static ssize_t filter_replay_receive_iov(NetFilterState *nf,
                                          NetClientState *sndr,
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index 891fa95264..8538942c1c 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -23,21 +23,22 @@
 #include "migration/colo.h"
 #include "util.h"
 
+#define TYPE_FILTER_REWRITER "filter-rewriter"
+typedef struct RewriterState RewriterState;
 #define FILTER_COLO_REWRITER(obj) \
     OBJECT_CHECK(RewriterState, (obj), TYPE_FILTER_REWRITER)
 
-#define TYPE_FILTER_REWRITER "filter-rewriter"
 #define FAILOVER_MODE_ON  true
 #define FAILOVER_MODE_OFF false
 
-typedef struct RewriterState {
+struct RewriterState {
     NetFilterState parent_obj;
     NetQueue *incoming_queue;
     /* hashtable to save connection */
     GHashTable *connection_track_table;
     bool vnet_hdr;
     bool failover_mode;
-} RewriterState;
+};
 
 static void filter_rewriter_failover_mode(RewriterState *s)
 {
diff --git a/scsi/pr-manager-helper.c b/scsi/pr-manager-helper.c
index 466f11f4c8..4fb64e387d 100644
--- a/scsi/pr-manager-helper.c
+++ b/scsi/pr-manager-helper.c
@@ -21,16 +21,18 @@
 #include "qemu/module.h"
 
 #include <scsi/sg.h>
+#include "qom/object.h"
 
 #define PR_MAX_RECONNECT_ATTEMPTS 5
 
 #define TYPE_PR_MANAGER_HELPER "pr-manager-helper"
 
+typedef struct PRManagerHelper PRManagerHelper;
 #define PR_MANAGER_HELPER(obj) \
      OBJECT_CHECK(PRManagerHelper, (obj), \
                   TYPE_PR_MANAGER_HELPER)
 
-typedef struct PRManagerHelper {
+struct PRManagerHelper {
     /* <private> */
     PRManager parent;
 
@@ -38,7 +40,7 @@ typedef struct PRManagerHelper {
 
     QemuMutex lock;
     QIOChannel *ioc;
-} PRManagerHelper;
+};
 
 static void pr_manager_send_status_changed_event(PRManagerHelper *pr_mgr)
 {
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 404762b68f..8f9afa5aa1 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -28,12 +28,13 @@
 #include "sysemu/runstate.h"
 #include "trace.h"
 #include "migration/blocker.h"
+#include "qom/object.h"
 
 #define TYPE_SEV_GUEST "sev-guest"
+typedef struct SevGuestState SevGuestState;
 #define SEV_GUEST(obj)                                          \
     OBJECT_CHECK(SevGuestState, (obj), TYPE_SEV_GUEST)
 
-typedef struct SevGuestState SevGuestState;
 
 /**
  * SevGuestState:
diff --git a/tests/check-qom-interface.c b/tests/check-qom-interface.c
index 2177f0dce5..bfa9ad5d19 100644
--- a/tests/check-qom-interface.c
+++ b/tests/check-qom-interface.c
@@ -16,6 +16,7 @@
 
 
 #define TYPE_TEST_IF "test-interface"
+typedef struct TestIfClass TestIfClass;
 #define TEST_IF_CLASS(klass) \
      OBJECT_CLASS_CHECK(TestIfClass, (klass), TYPE_TEST_IF)
 #define TEST_IF_GET_CLASS(obj) \
@@ -25,11 +26,11 @@
 
 typedef struct TestIf TestIf;
 
-typedef struct TestIfClass {
+struct TestIfClass {
     InterfaceClass parent_class;
 
     uint32_t test;
-} TestIfClass;
+};
 
 static const TypeInfo test_if_info = {
     .name          = TYPE_TEST_IF,
diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-props.c
index 1e6b0f33ff..c3e210a9ef 100644
--- a/tests/test-qdev-global-props.c
+++ b/tests/test-qdev-global-props.c
@@ -31,6 +31,7 @@
 
 
 #define TYPE_STATIC_PROPS "static_prop_type"
+typedef struct MyType MyType;
 #define STATIC_TYPE(obj) \
     OBJECT_CHECK(MyType, (obj), TYPE_STATIC_PROPS)
 
@@ -38,12 +39,12 @@
 
 #define PROP_DEFAULT 100
 
-typedef struct MyType {
+struct MyType {
     DeviceState parent_obj;
 
     uint32_t prop1;
     uint32_t prop2;
-} MyType;
+};
 
 static Property static_props[] = {
     DEFINE_PROP_UINT32("prop1", MyType, prop1, PROP_DEFAULT),
diff --git a/ui/console.c b/ui/console.c
index ae54bf6c1a..b9072bdaf9 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -34,6 +34,7 @@
 #include "trace.h"
 #include "exec/memory.h"
 #include "io/channel-file.h"
+#include "qom/object.h"
 
 #define DEFAULT_BACKSCROLL 512
 #define CONSOLE_CURSOR_PERIOD 500
@@ -1082,10 +1083,11 @@ void console_select(unsigned int index)
     }
 }
 
-typedef struct VCChardev {
+struct VCChardev {
     Chardev parent;
     QemuConsole *console;
-} VCChardev;
+};
+typedef struct VCChardev VCChardev;
 
 #define TYPE_CHARDEV_VC "chardev-vc"
 #define VC_CHARDEV(obj) OBJECT_CHECK(VCChardev, (obj), TYPE_CHARDEV_VC)
diff --git a/ui/gtk.c b/ui/gtk.c
index b0cc08ad6d..558c63dc22 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -171,11 +171,12 @@ struct GtkDisplayState {
     DisplayOptions *opts;
 };
 
-typedef struct VCChardev {
+struct VCChardev {
     Chardev parent;
     VirtualConsole *console;
     bool echo;
-} VCChardev;
+};
+typedef struct VCChardev VCChardev;
 
 #define TYPE_CHARDEV_VC "chardev-vc"
 #define VC_CHARDEV(obj) OBJECT_CHECK(VCChardev, (obj), TYPE_CHARDEV_VC)
diff --git a/ui/input-barrier.c b/ui/input-barrier.c
index 2082f5dd1e..52208e5658 100644
--- a/ui/input-barrier.c
+++ b/ui/input-barrier.c
@@ -13,12 +13,15 @@
 #include "qom/object_interfaces.h"
 #include "io/channel-socket.h"
 #include "ui/input.h"
+#include "qom/object.h"
 #include "ui/vnc_keysym.h" /* use name2keysym from VNC as we use X11 values */
 #include "qemu/cutils.h"
 #include "qapi/qmp/qerror.h"
 #include "input-barrier.h"
 
 #define TYPE_INPUT_BARRIER "input-barrier"
+typedef struct InputBarrier InputBarrier;
+typedef struct InputBarrierClass InputBarrierClass;
 #define INPUT_BARRIER(obj) \
     OBJECT_CHECK(InputBarrier, (obj), TYPE_INPUT_BARRIER)
 #define INPUT_BARRIER_GET_CLASS(obj) \
@@ -26,8 +29,6 @@
 #define INPUT_BARRIER_CLASS(klass) \
     OBJECT_CLASS_CHECK(InputBarrierClass, (klass), TYPE_INPUT_BARRIER)
 
-typedef struct InputBarrier InputBarrier;
-typedef struct InputBarrierClass InputBarrierClass;
 
 #define MAX_HELLO_LENGTH 1024
 
diff --git a/ui/input-linux.c b/ui/input-linux.c
index 3709800898..9e5688e3f6 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -17,6 +17,7 @@
 
 #include <sys/ioctl.h>
 #include "standard-headers/linux/input.h"
+#include "qom/object.h"
 
 static bool linux_is_button(unsigned int lnx)
 {
@@ -30,6 +31,8 @@ static bool linux_is_button(unsigned int lnx)
 }
 
 #define TYPE_INPUT_LINUX "input-linux"
+typedef struct InputLinux InputLinux;
+typedef struct InputLinuxClass InputLinuxClass;
 #define INPUT_LINUX(obj) \
     OBJECT_CHECK(InputLinux, (obj), TYPE_INPUT_LINUX)
 #define INPUT_LINUX_GET_CLASS(obj) \
@@ -37,8 +40,6 @@ static bool linux_is_button(unsigned int lnx)
 #define INPUT_LINUX_CLASS(klass) \
     OBJECT_CLASS_CHECK(InputLinuxClass, (klass), TYPE_INPUT_LINUX)
 
-typedef struct InputLinux InputLinux;
-typedef struct InputLinuxClass InputLinuxClass;
 
 struct InputLinux {
     Object parent;
diff --git a/ui/spice-app.c b/ui/spice-app.c
index 40fb2ef573..d68a35c3b1 100644
--- a/ui/spice-app.c
+++ b/ui/spice-app.c
@@ -35,14 +35,16 @@
 #include "io/channel-command.h"
 #include "chardev/spice.h"
 #include "sysemu/sysemu.h"
+#include "qom/object.h"
 
 static const char *tmp_dir;
 static char *app_dir;
 static char *sock_path;
 
-typedef struct VCChardev {
+struct VCChardev {
     SpiceChardev parent;
-} VCChardev;
+};
+typedef struct VCChardev VCChardev;
 
 #define TYPE_CHARDEV_VC "chardev-vc"
 #define VC_CHARDEV(obj) OBJECT_CHECK(VCChardev, (obj), TYPE_CHARDEV_VC)
-- 
2.26.2


