Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9CB26D244
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 06:20:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIlPK-0006h1-KJ; Thu, 17 Sep 2020 04:20:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C/c7=CZ=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kIc96-0007cv-FE
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 18:27:08 +0000
X-Inumbo-ID: 7b100545-be24-4056-bab0-901c06f3d48b
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7b100545-be24-4056-bab0-901c06f3d48b;
 Wed, 16 Sep 2020 18:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600280813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZDpDw5iXw64DulkJqv9rfwgNfNDeDsZmYxSE24MqXQ=;
 b=jK6y5ALmo6qaTlFoqlzCRJvGm3d/9gQFPkGP8axTC8WB/3eKjJHIkOxWxRFGHs5naE+r4C
 zEgfL3l/gBxFkZu0PUmoWu+LBbS07j+vo7CFQCLVd6b8PdifSdi79AqFAx907sfPx9UGnh
 Xh9Rhm2tpqtzPm+9fb0Azkr8W82Exx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-Cs9VDO7tMq2o90ShcsQjKQ-1; Wed, 16 Sep 2020 14:26:44 -0400
X-MC-Unique: Cs9VDO7tMq2o90ShcsQjKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D85F425EE;
 Wed, 16 Sep 2020 18:26:40 +0000 (UTC)
Received: from localhost (ovpn-119-217.rdu2.redhat.com [10.10.119.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E5E178805;
 Wed, 16 Sep 2020 18:26:12 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Jan Kiszka <jan.kiszka@web.de>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm <leif@nuviainc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Walle <michael@walle.cc>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alberto Garcia <berto@igalia.com>, Thomas Huth <huth@tuxfamily.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Helge Deller <deller@gmx.de>, Corey Minyard <cminyard@mvista.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Sven Schnelle <svens@stackframe.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ben Warren <ben@skyportsystems.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Laszlo Ersek <lersek@redhat.com>,
 Paul Burton <paulburton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, Eric Farman <farman@linux.ibm.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 5/5] [automated] Use OBJECT_DECLARE_SIMPLE_TYPE when possible
Date: Wed, 16 Sep 2020 14:25:19 -0400
Message-Id: <20200916182519.415636-6-ehabkost@redhat.com>
In-Reply-To: <20200916182519.415636-1-ehabkost@redhat.com>
References: <20200916182519.415636-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mailman-Approved-At: Thu, 17 Sep 2020 04:20:29 +0000
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

This converts existing DECLARE_INSTANCE_CHECKER usage to
OBJECT_DECLARE_SIMPLE_TYPE when possible.

$ ./scripts/codeconverter/converter.py -i \
  --pattern=AddObjectDeclareSimpleType $(git grep -l '' -- '*.[ch]')

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Amit Shah <amit@kernel.org>
Cc: Stefan Berger <stefanb@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Jan Kiszka <jan.kiszka@web.de>
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Radoslaw Biernacki <rad@semihalf.com>
Cc: Leif Lindholm <leif@nuviainc.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Michael Walle <michael@walle.cc>
Cc: John Snow <jsnow@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Fabien Chouteau <chouteau@adacore.com>
Cc: KONRAD Frederic <frederic.konrad@adacore.com>
Cc: Alberto Garcia <berto@igalia.com>
Cc: Thomas Huth <huth@tuxfamily.org>
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
Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Huacai Chen <chenhc@lemote.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Sven Schnelle <svens@stackframe.org>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>
Cc: Fam Zheng <fam@euphon.net>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Tony Krowiak <akrowiak@linux.ibm.com>
Cc: Pierre Morel <pmorel@linux.ibm.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Ben Warren <ben@skyportsystems.com>
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Cc: Michael Rolnik <mrolnik@gmail.com>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>
Cc: Peter Xu <peterx@redhat.com>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Laszlo Ersek <lersek@redhat.com>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Eric Farman <farman@linux.ibm.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Cc: Zhang Chen <chen.zhang@intel.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: qemu-block@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: kvm@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: qemu-s390x@nongnu.org
Cc: qemu-riscv@nongnu.org
---
 hw/9pfs/virtio-9p.h                      |  4 +-
 hw/audio/intel-hda.h                     |  4 +-
 hw/display/ati_int.h                     |  4 +-
 hw/display/qxl.h                         |  4 +-
 hw/i386/amd_iommu.h                      |  4 +-
 hw/misc/tmp105.h                         |  4 +-
 hw/net/fsl_etsec/etsec.h                 |  3 +-
 hw/net/tulip.h                           |  4 +-
 hw/ppc/e500-ccsr.h                       |  4 +-
 hw/ppc/mac.h                             |  4 +-
 hw/s390x/ipl.h                           |  4 +-
 hw/s390x/s390-pci-bus.h                  | 16 ++------
 hw/s390x/virtio-ccw.h                    | 52 ++++++------------------
 hw/usb/hcd-ehci.h                        |  8 +---
 hw/usb/hcd-ohci.h                        |  4 +-
 hw/usb/hcd-xhci.h                        |  4 +-
 hw/vfio/pci.h                            |  4 +-
 hw/xen/xen_pt.h                          |  4 +-
 include/block/throttle-groups.h          |  4 +-
 include/hw/acpi/generic_event_device.h   |  4 +-
 include/hw/acpi/vmgenid.h                |  4 +-
 include/hw/adc/stm32f2xx_adc.h           |  4 +-
 include/hw/arm/allwinner-a10.h           |  4 +-
 include/hw/arm/allwinner-h3.h            |  4 +-
 include/hw/arm/armv7m.h                  |  8 +---
 include/hw/arm/bcm2835_peripherals.h     |  4 +-
 include/hw/arm/digic.h                   |  4 +-
 include/hw/arm/exynos4210.h              |  4 +-
 include/hw/arm/fsl-imx25.h               |  4 +-
 include/hw/arm/fsl-imx31.h               |  4 +-
 include/hw/arm/fsl-imx6.h                |  4 +-
 include/hw/arm/fsl-imx6ul.h              |  4 +-
 include/hw/arm/fsl-imx7.h                |  4 +-
 include/hw/arm/msf2-soc.h                |  4 +-
 include/hw/arm/nrf51_soc.h               |  4 +-
 include/hw/arm/omap.h                    |  4 +-
 include/hw/arm/pxa.h                     | 15 ++-----
 include/hw/arm/stm32f205_soc.h           |  4 +-
 include/hw/arm/stm32f405_soc.h           |  4 +-
 include/hw/arm/xlnx-versal.h             |  4 +-
 include/hw/arm/xlnx-zynqmp.h             |  4 +-
 include/hw/block/flash.h                 |  8 +---
 include/hw/block/swim.h                  | 12 ++----
 include/hw/char/avr_usart.h              |  4 +-
 include/hw/char/bcm2835_aux.h            |  4 +-
 include/hw/char/cadence_uart.h           |  4 +-
 include/hw/char/cmsdk-apb-uart.h         |  4 +-
 include/hw/char/digic-uart.h             |  4 +-
 include/hw/char/escc.h                   |  4 +-
 include/hw/char/ibex_uart.h              |  4 +-
 include/hw/char/imx_serial.h             |  4 +-
 include/hw/char/nrf51_uart.h             |  4 +-
 include/hw/char/pl011.h                  |  4 +-
 include/hw/char/serial.h                 | 11 ++---
 include/hw/char/stm32f2xx_usart.h        |  4 +-
 include/hw/clock.h                       |  4 +-
 include/hw/core/generic-loader.h         |  4 +-
 include/hw/core/split-irq.h              |  4 +-
 include/hw/cpu/a15mpcore.h               |  4 +-
 include/hw/cpu/a9mpcore.h                |  4 +-
 include/hw/cpu/arm11mpcore.h             |  4 +-
 include/hw/cpu/cluster.h                 |  4 +-
 include/hw/cpu/core.h                    |  4 +-
 include/hw/display/bcm2835_fb.h          |  4 +-
 include/hw/display/dpcd.h                |  4 +-
 include/hw/display/i2c-ddc.h             |  4 +-
 include/hw/display/macfb.h               |  4 +-
 include/hw/display/xlnx_dp.h             |  4 +-
 include/hw/dma/bcm2835_dma.h             |  4 +-
 include/hw/dma/i8257.h                   |  4 +-
 include/hw/dma/pl080.h                   |  4 +-
 include/hw/dma/xlnx-zdma.h               |  4 +-
 include/hw/dma/xlnx-zynq-devcfg.h        |  4 +-
 include/hw/dma/xlnx_dpdma.h              |  4 +-
 include/hw/gpio/bcm2835_gpio.h           |  4 +-
 include/hw/gpio/imx_gpio.h               |  4 +-
 include/hw/gpio/nrf51_gpio.h             |  4 +-
 include/hw/hyperv/vmbus-bridge.h         |  4 +-
 include/hw/hyperv/vmbus.h                |  4 +-
 include/hw/i2c/i2c.h                     |  3 +-
 include/hw/i2c/imx_i2c.h                 |  4 +-
 include/hw/i2c/microbit_i2c.h            |  4 +-
 include/hw/i2c/ppc4xx_i2c.h              |  4 +-
 include/hw/i386/ich9.h                   |  4 +-
 include/hw/i386/intel_iommu.h            |  4 +-
 include/hw/ide/ahci.h                    | 12 ++----
 include/hw/ide/internal.h                |  4 +-
 include/hw/ide/pci.h                     |  4 +-
 include/hw/input/adb.h                   |  4 +-
 include/hw/input/i8042.h                 |  4 +-
 include/hw/intc/allwinner-a10-pic.h      |  4 +-
 include/hw/intc/aspeed_vic.h             |  4 +-
 include/hw/intc/bcm2835_ic.h             |  4 +-
 include/hw/intc/bcm2836_control.h        |  4 +-
 include/hw/intc/heathrow_pic.h           |  4 +-
 include/hw/intc/ibex_plic.h              |  4 +-
 include/hw/intc/imx_avic.h               |  4 +-
 include/hw/intc/imx_gpcv2.h              |  4 +-
 include/hw/intc/mips_gic.h               |  4 +-
 include/hw/intc/realview_gic.h           |  4 +-
 include/hw/intc/rx_icu.h                 |  4 +-
 include/hw/intc/xlnx-pmu-iomod-intc.h    |  4 +-
 include/hw/intc/xlnx-zynqmp-ipi.h        |  4 +-
 include/hw/ipack/ipack.h                 |  4 +-
 include/hw/ipmi/ipmi.h                   |  4 +-
 include/hw/isa/isa.h                     |  3 +-
 include/hw/isa/pc87312.h                 |  4 +-
 include/hw/m68k/mcf_fec.h                |  4 +-
 include/hw/mips/cps.h                    |  4 +-
 include/hw/misc/a9scu.h                  |  4 +-
 include/hw/misc/allwinner-cpucfg.h       |  4 +-
 include/hw/misc/allwinner-h3-ccu.h       |  4 +-
 include/hw/misc/allwinner-h3-dramc.h     |  4 +-
 include/hw/misc/allwinner-h3-sysctrl.h   |  4 +-
 include/hw/misc/allwinner-sid.h          |  4 +-
 include/hw/misc/arm11scu.h               |  4 +-
 include/hw/misc/armsse-cpuid.h           |  4 +-
 include/hw/misc/armsse-mhu.h             |  4 +-
 include/hw/misc/aspeed_xdma.h            |  4 +-
 include/hw/misc/auxbus.h                 | 11 ++---
 include/hw/misc/avr_power.h              |  4 +-
 include/hw/misc/bcm2835_mbox.h           |  4 +-
 include/hw/misc/bcm2835_mphi.h           |  3 +-
 include/hw/misc/bcm2835_property.h       |  4 +-
 include/hw/misc/bcm2835_rng.h            |  4 +-
 include/hw/misc/bcm2835_thermal.h        |  4 +-
 include/hw/misc/grlib_ahb_apb_pnp.h      |  8 +---
 include/hw/misc/imx25_ccm.h              |  4 +-
 include/hw/misc/imx31_ccm.h              |  4 +-
 include/hw/misc/imx6_ccm.h               |  4 +-
 include/hw/misc/imx6_src.h               |  4 +-
 include/hw/misc/imx6ul_ccm.h             |  4 +-
 include/hw/misc/imx7_ccm.h               |  8 +---
 include/hw/misc/imx7_gpr.h               |  4 +-
 include/hw/misc/imx7_snvs.h              |  4 +-
 include/hw/misc/imx_rngc.h               |  4 +-
 include/hw/misc/iotkit-secctl.h          |  4 +-
 include/hw/misc/iotkit-sysctl.h          |  4 +-
 include/hw/misc/iotkit-sysinfo.h         |  4 +-
 include/hw/misc/mac_via.h                | 12 ++----
 include/hw/misc/macio/cuda.h             |  8 +---
 include/hw/misc/macio/gpio.h             |  4 +-
 include/hw/misc/macio/macio.h            | 20 +++------
 include/hw/misc/macio/pmu.h              |  8 +---
 include/hw/misc/max111x.h                |  4 +-
 include/hw/misc/mips_cmgcr.h             |  4 +-
 include/hw/misc/mips_cpc.h               |  4 +-
 include/hw/misc/mips_itu.h               |  4 +-
 include/hw/misc/mps2-fpgaio.h            |  4 +-
 include/hw/misc/mps2-scc.h               |  4 +-
 include/hw/misc/msf2-sysreg.h            |  4 +-
 include/hw/misc/nrf51_rng.h              |  4 +-
 include/hw/misc/stm32f2xx_syscfg.h       |  4 +-
 include/hw/misc/stm32f4xx_exti.h         |  4 +-
 include/hw/misc/stm32f4xx_syscfg.h       |  4 +-
 include/hw/misc/tz-mpc.h                 |  4 +-
 include/hw/misc/tz-msc.h                 |  4 +-
 include/hw/misc/tz-ppc.h                 |  4 +-
 include/hw/misc/unimp.h                  |  4 +-
 include/hw/misc/zynq-xadc.h              |  4 +-
 include/hw/net/allwinner-sun8i-emac.h    |  4 +-
 include/hw/net/allwinner_emac.h          |  4 +-
 include/hw/net/cadence_gem.h             |  4 +-
 include/hw/net/ftgmac100.h               |  8 +---
 include/hw/net/imx_fec.h                 |  4 +-
 include/hw/net/msf2-emac.h               |  4 +-
 include/hw/nubus/mac-nubus-bridge.h      |  4 +-
 include/hw/nubus/nubus.h                 |  8 +---
 include/hw/nvram/fw_cfg.h                |  9 ++--
 include/hw/nvram/nrf51_nvm.h             |  4 +-
 include/hw/pci-bridge/simba.h            |  4 +-
 include/hw/pci-host/designware.h         |  8 +---
 include/hw/pci-host/gpex.h               |  8 +---
 include/hw/pci-host/i440fx.h             |  4 +-
 include/hw/pci-host/pnv_phb3.h           |  7 +---
 include/hw/pci-host/pnv_phb4.h           |  6 +--
 include/hw/pci-host/q35.h                |  8 +---
 include/hw/pci-host/sabre.h              |  8 +---
 include/hw/pci-host/spapr.h              |  4 +-
 include/hw/pci-host/uninorth.h           |  4 +-
 include/hw/pci-host/xilinx-pcie.h        |  8 +---
 include/hw/pci/pci_bridge.h              |  3 +-
 include/hw/pci/pcie_host.h               |  3 +-
 include/hw/pci/pcie_port.h               |  6 +--
 include/hw/platform-bus.h                |  4 +-
 include/hw/ppc/mac_dbdma.h               |  3 +-
 include/hw/ppc/openpic.h                 |  4 +-
 include/hw/ppc/pnv_core.h                |  4 +-
 include/hw/ppc/pnv_pnor.h                |  4 +-
 include/hw/ppc/pnv_psi.h                 |  8 +---
 include/hw/ppc/spapr.h                   |  8 +---
 include/hw/ppc/spapr_tpm_proxy.h         |  4 +-
 include/hw/ppc/spapr_vio.h               |  4 +-
 include/hw/ppc/xive.h                    | 12 ++----
 include/hw/riscv/opentitan.h             |  4 +-
 include/hw/riscv/riscv_hart.h            |  4 +-
 include/hw/rtc/aspeed_rtc.h              |  4 +-
 include/hw/rtc/goldfish_rtc.h            |  4 +-
 include/hw/rtc/mc146818rtc.h             |  4 +-
 include/hw/rtc/pl031.h                   |  4 +-
 include/hw/rtc/xlnx-zynqmp-rtc.h         |  4 +-
 include/hw/s390x/css-bridge.h            |  8 +---
 include/hw/s390x/s390_flic.h             |  4 +-
 include/hw/s390x/vfio-ccw.h              |  4 +-
 include/hw/scsi/esp.h                    |  4 +-
 include/hw/scsi/scsi.h                   |  3 +-
 include/hw/sd/aspeed_sdhci.h             |  4 +-
 include/hw/sd/bcm2835_sdhost.h           |  4 +-
 include/hw/sparc/sparc32_dma.h           | 16 ++------
 include/hw/ssi/imx_spi.h                 |  4 +-
 include/hw/ssi/mss-spi.h                 |  4 +-
 include/hw/ssi/pl022.h                   |  4 +-
 include/hw/ssi/stm32f2xx_spi.h           |  4 +-
 include/hw/ssi/xilinx_spips.h            |  7 +---
 include/hw/timer/a9gtimer.h              |  4 +-
 include/hw/timer/allwinner-a10-pit.h     |  4 +-
 include/hw/timer/arm_mptimer.h           |  4 +-
 include/hw/timer/armv7m_systick.h        |  4 +-
 include/hw/timer/avr_timer16.h           |  4 +-
 include/hw/timer/bcm2835_systmr.h        |  4 +-
 include/hw/timer/cmsdk-apb-dualtimer.h   |  4 +-
 include/hw/timer/cmsdk-apb-timer.h       |  4 +-
 include/hw/timer/digic-timer.h           |  4 +-
 include/hw/timer/imx_epit.h              |  4 +-
 include/hw/timer/mss-timer.h             |  4 +-
 include/hw/timer/nrf51_timer.h           |  4 +-
 include/hw/usb.h                         |  4 +-
 include/hw/usb/chipidea.h                |  4 +-
 include/hw/usb/imx-usb-phy.h             |  4 +-
 include/hw/virtio/vhost-scsi-common.h    |  4 +-
 include/hw/virtio/vhost-scsi.h           |  4 +-
 include/hw/virtio/vhost-user-blk.h       |  4 +-
 include/hw/virtio/vhost-user-fs.h        |  4 +-
 include/hw/virtio/vhost-user-scsi.h      |  4 +-
 include/hw/virtio/vhost-user-vsock.h     |  4 +-
 include/hw/virtio/vhost-vsock-common.h   |  4 +-
 include/hw/virtio/vhost-vsock.h          |  4 +-
 include/hw/virtio/virtio-balloon.h       |  4 +-
 include/hw/virtio/virtio-blk.h           |  4 +-
 include/hw/virtio/virtio-crypto.h        |  4 +-
 include/hw/virtio/virtio-gpu-pci.h       |  4 +-
 include/hw/virtio/virtio-gpu.h           |  8 +---
 include/hw/virtio/virtio-input.h         | 12 ++----
 include/hw/virtio/virtio-iommu.h         |  4 +-
 include/hw/virtio/virtio-mmio.h          |  4 +-
 include/hw/virtio/virtio-net.h           |  4 +-
 include/hw/virtio/virtio-rng.h           |  4 +-
 include/hw/virtio/virtio-scsi.h          |  8 +---
 include/hw/virtio/virtio-serial.h        |  7 +---
 include/hw/watchdog/cmsdk-apb-watchdog.h |  4 +-
 include/hw/watchdog/wdt_imx2.h           |  4 +-
 include/hw/xen/xen-block.h               |  8 +---
 include/io/channel-buffer.h              |  4 +-
 include/io/channel-command.h             |  4 +-
 include/io/channel-file.h                |  4 +-
 include/io/channel-socket.h              |  4 +-
 include/io/channel-tls.h                 |  4 +-
 include/io/channel-websock.h             |  4 +-
 include/net/can_emu.h                    |  3 +-
 include/sysemu/rng-random.h              |  4 +-
 backends/cryptodev-builtin.c             |  5 +--
 backends/cryptodev-vhost-user.c          |  4 +-
 backends/hostmem-file.c                  |  4 +-
 backends/hostmem-memfd.c                 |  4 +-
 backends/rng-builtin.c                   |  4 +-
 backends/rng-egd.c                       |  4 +-
 backends/tpm/tpm_emulator.c              |  4 +-
 backends/tpm/tpm_passthrough.c           |  4 +-
 hw/acpi/piix4.c                          |  4 +-
 hw/alpha/typhoon.c                       |  4 +-
 hw/arm/collie.c                          |  4 +-
 hw/arm/highbank.c                        |  4 +-
 hw/arm/integratorcp.c                    | 12 ++----
 hw/arm/microbit.c                        |  4 +-
 hw/arm/musicpal.c                        | 32 ++++-----------
 hw/arm/palm.c                            |  4 +-
 hw/arm/pxa2xx.c                          | 12 ++----
 hw/arm/pxa2xx_gpio.c                     |  4 +-
 hw/arm/pxa2xx_pic.c                      |  4 +-
 hw/arm/sbsa-ref.c                        |  4 +-
 hw/arm/spitz.c                           | 20 +++------
 hw/arm/stellaris.c                       |  8 +---
 hw/arm/strongarm.c                       | 24 +++--------
 hw/arm/tosa.c                            |  8 +---
 hw/arm/versatilepb.c                     |  4 +-
 hw/arm/xilinx_zynq.c                     |  4 +-
 hw/arm/xlnx-versal-virt.c                |  4 +-
 hw/arm/xlnx-zcu102.c                     |  4 +-
 hw/arm/z2.c                              |  8 +---
 hw/audio/ac97.c                          |  4 +-
 hw/audio/adlib.c                         |  4 +-
 hw/audio/es1370.c                        |  3 +-
 hw/audio/gus.c                           |  4 +-
 hw/audio/hda-codec.c                     |  3 +-
 hw/audio/marvell_88w8618.c               |  4 +-
 hw/audio/milkymist-ac97.c                |  4 +-
 hw/audio/pcspk.c                         |  4 +-
 hw/audio/pl041.c                         |  4 +-
 hw/audio/sb16.c                          |  4 +-
 hw/audio/wm8750.c                        |  4 +-
 hw/block/fdc.c                           | 16 ++------
 hw/block/nand.c                          |  3 +-
 hw/block/onenand.c                       |  4 +-
 hw/char/debugcon.c                       |  4 +-
 hw/char/exynos4210_uart.c                |  4 +-
 hw/char/grlib_apbuart.c                  |  4 +-
 hw/char/ipoctal232.c                     |  3 +-
 hw/char/lm32_juart.c                     |  4 +-
 hw/char/lm32_uart.c                      |  4 +-
 hw/char/mcf_uart.c                       |  4 +-
 hw/char/milkymist-uart.c                 |  4 +-
 hw/char/parallel.c                       |  4 +-
 hw/char/serial-isa.c                     |  4 +-
 hw/char/serial-pci.c                     |  4 +-
 hw/char/spapr_vty.c                      |  4 +-
 hw/char/xilinx_uartlite.c                |  4 +-
 hw/cpu/realview_mpcore.c                 |  4 +-
 hw/display/ads7846.c                     |  4 +-
 hw/display/artist.c                      |  4 +-
 hw/display/bochs-display.c               |  4 +-
 hw/display/cg3.c                         |  4 +-
 hw/display/cirrus_vga.c                  |  4 +-
 hw/display/cirrus_vga_isa.c              |  4 +-
 hw/display/exynos4210_fimd.c             |  4 +-
 hw/display/g364fb.c                      |  4 +-
 hw/display/jazz_led.c                    |  4 +-
 hw/display/milkymist-tmu2.c              |  4 +-
 hw/display/milkymist-vgafb.c             |  4 +-
 hw/display/next-fb.c                     |  4 +-
 hw/display/pl110.c                       |  4 +-
 hw/display/sii9022.c                     |  4 +-
 hw/display/sm501.c                       |  8 +---
 hw/display/ssd0303.c                     |  4 +-
 hw/display/ssd0323.c                     |  4 +-
 hw/display/tcx.c                         |  4 +-
 hw/display/vga-isa.c                     |  4 +-
 hw/display/vga-pci.c                     |  4 +-
 hw/dma/i82374.c                          |  4 +-
 hw/dma/pl330.c                           |  3 +-
 hw/dma/puv3_dma.c                        |  4 +-
 hw/dma/pxa2xx_dma.c                      |  4 +-
 hw/dma/rc4030.c                          |  4 +-
 hw/dma/xilinx_axidma.c                   |  4 +-
 hw/gpio/gpio_key.c                       |  4 +-
 hw/gpio/max7310.c                        |  4 +-
 hw/gpio/mpc8xxx.c                        |  4 +-
 hw/gpio/pl061.c                          |  4 +-
 hw/gpio/puv3_gpio.c                      |  4 +-
 hw/gpio/zaurus.c                         |  4 +-
 hw/hppa/dino.c                           |  4 +-
 hw/hppa/lasi.c                           |  4 +-
 hw/hyperv/hyperv.c                       |  4 +-
 hw/hyperv/hyperv_testdev.c               |  4 +-
 hw/i2c/bitbang_i2c.c                     |  4 +-
 hw/i2c/exynos4210_i2c.c                  |  4 +-
 hw/i2c/mpc_i2c.c                         |  4 +-
 hw/i2c/smbus_eeprom.c                    |  4 +-
 hw/i2c/smbus_ich9.c                      |  4 +-
 hw/i386/kvm/clock.c                      |  4 +-
 hw/i386/kvmvapic.c                       |  4 +-
 hw/i386/port92.c                         |  4 +-
 hw/i386/vmmouse.c                        |  4 +-
 hw/i386/vmport.c                         |  4 +-
 hw/i386/xen/xen_platform.c               |  4 +-
 hw/i386/xen/xen_pvdevice.c               |  4 +-
 hw/ide/isa.c                             |  4 +-
 hw/ide/microdrive.c                      |  4 +-
 hw/ide/sii3112.c                         |  4 +-
 hw/input/lm832x.c                        |  4 +-
 hw/input/milkymist-softusb.c             |  4 +-
 hw/input/pl050.c                         |  4 +-
 hw/intc/arm_gicv2m.c                     |  4 +-
 hw/intc/exynos4210_combiner.c            |  4 +-
 hw/intc/exynos4210_gic.c                 |  8 +---
 hw/intc/grlib_irqmp.c                    |  4 +-
 hw/intc/lm32_pic.c                       |  4 +-
 hw/intc/nios2_iic.c                      |  4 +-
 hw/intc/ompic.c                          |  4 +-
 hw/intc/openpic_kvm.c                    |  4 +-
 hw/intc/pl190.c                          |  4 +-
 hw/intc/puv3_intc.c                      |  4 +-
 hw/intc/slavio_intctl.c                  |  4 +-
 hw/ipack/tpci200.c                       |  4 +-
 hw/ipmi/ipmi_bmc_extern.c                |  4 +-
 hw/ipmi/isa_ipmi_bt.c                    |  4 +-
 hw/ipmi/isa_ipmi_kcs.c                   |  4 +-
 hw/ipmi/pci_ipmi_bt.c                    |  4 +-
 hw/ipmi/pci_ipmi_kcs.c                   |  4 +-
 hw/ipmi/smbus_ipmi.c                     |  4 +-
 hw/isa/i82378.c                          |  4 +-
 hw/isa/piix4.c                           |  4 +-
 hw/isa/vt82c686.c                        | 16 ++------
 hw/m68k/mcf_intc.c                       |  4 +-
 hw/m68k/next-cube.c                      |  4 +-
 hw/m68k/next-kbd.c                       |  4 +-
 hw/microblaze/xlnx-zynqmp-pmu.c          |  4 +-
 hw/mips/gt64xxx_pci.c                    |  4 +-
 hw/mips/malta.c                          |  4 +-
 hw/misc/applesmc.c                       |  4 +-
 hw/misc/arm_integrator_debug.c           |  4 +-
 hw/misc/arm_l2x0.c                       |  4 +-
 hw/misc/arm_sysctl.c                     |  4 +-
 hw/misc/debugexit.c                      |  4 +-
 hw/misc/eccmemctl.c                      |  4 +-
 hw/misc/empty_slot.c                     |  4 +-
 hw/misc/exynos4210_clk.c                 |  4 +-
 hw/misc/exynos4210_pmu.c                 |  4 +-
 hw/misc/exynos4210_rng.c                 |  4 +-
 hw/misc/milkymist-hpdmc.c                |  4 +-
 hw/misc/milkymist-pfpu.c                 |  4 +-
 hw/misc/mst_fpga.c                       |  4 +-
 hw/misc/pc-testdev.c                     |  4 +-
 hw/misc/pci-testdev.c                    |  4 +-
 hw/misc/puv3_pm.c                        |  4 +-
 hw/misc/sga.c                            |  4 +-
 hw/misc/slavio_misc.c                    |  4 +-
 hw/misc/zynq_slcr.c                      |  4 +-
 hw/net/dp8393x.c                         |  4 +-
 hw/net/e1000e.c                          |  4 +-
 hw/net/etraxfs_eth.c                     |  4 +-
 hw/net/lan9118.c                         |  4 +-
 hw/net/milkymist-minimac2.c              |  4 +-
 hw/net/mipsnet.c                         |  4 +-
 hw/net/ne2000-isa.c                      |  4 +-
 hw/net/opencores_eth.c                   |  4 +-
 hw/net/pcnet-pci.c                       |  4 +-
 hw/net/rtl8139.c                         |  4 +-
 hw/net/smc91c111.c                       |  4 +-
 hw/net/spapr_llan.c                      |  4 +-
 hw/net/stellaris_enet.c                  |  4 +-
 hw/net/sungem.c                          |  4 +-
 hw/net/sunhme.c                          |  4 +-
 hw/net/xgmac.c                           |  4 +-
 hw/net/xilinx_axienet.c                  |  4 +-
 hw/nvram/ds1225y.c                       |  4 +-
 hw/nvram/spapr_nvram.c                   |  4 +-
 hw/pci-bridge/dec.c                      |  4 +-
 hw/pci-bridge/gen_pcie_root_port.c       |  4 +-
 hw/pci-bridge/pci_bridge_dev.c           |  4 +-
 hw/pci-bridge/pcie_pci_bridge.c          |  4 +-
 hw/pci-host/bonito.c                     |  6 +--
 hw/pci-host/grackle.c                    |  4 +-
 hw/pci-host/i440fx.c                     |  4 +-
 hw/pci-host/ppce500.c                    |  8 +---
 hw/pci-host/prep.c                       |  4 +-
 hw/ppc/mpc8544_guts.c                    |  4 +-
 hw/ppc/ppc440_pcix.c                     |  4 +-
 hw/ppc/ppc440_uc.c                       |  4 +-
 hw/ppc/ppc4xx_pci.c                      |  4 +-
 hw/ppc/ppce500_spin.c                    |  4 +-
 hw/ppc/prep_systemio.c                   |  4 +-
 hw/ppc/rs6000_mc.c                       |  4 +-
 hw/ppc/spapr_rng.c                       |  4 +-
 hw/rtc/ds1338.c                          |  4 +-
 hw/rtc/exynos4210_rtc.c                  |  4 +-
 hw/rtc/m41t80.c                          |  4 +-
 hw/rtc/sun4v-rtc.c                       |  4 +-
 hw/rtc/twl92230.c                        |  4 +-
 hw/scsi/lsi53c895a.c                     |  4 +-
 hw/scsi/spapr_vscsi.c                    |  4 +-
 hw/sd/milkymist-memcard.c                |  4 +-
 hw/sd/pl181.c                            |  4 +-
 hw/sd/ssi-sd.c                           |  4 +-
 hw/sh4/sh_pci.c                          |  4 +-
 hw/sparc/sun4m.c                         |  8 +---
 hw/sparc64/sun4u.c                       |  8 +---
 hw/ssi/ssi.c                             |  3 +-
 hw/ssi/xilinx_spi.c                      |  4 +-
 hw/timer/altera_timer.c                  |  4 +-
 hw/timer/arm_timer.c                     |  8 +---
 hw/timer/cadence_ttc.c                   |  4 +-
 hw/timer/exynos4210_mct.c                |  4 +-
 hw/timer/exynos4210_pwm.c                |  4 +-
 hw/timer/grlib_gptimer.c                 |  4 +-
 hw/timer/hpet.c                          |  4 +-
 hw/timer/lm32_timer.c                    |  4 +-
 hw/timer/milkymist-sysctl.c              |  4 +-
 hw/timer/puv3_ost.c                      |  4 +-
 hw/timer/pxa2xx_timer.c                  |  4 +-
 hw/timer/slavio_timer.c                  |  4 +-
 hw/tpm/tpm_tis_isa.c                     |  4 +-
 hw/tpm/tpm_tis_sysbus.c                  |  4 +-
 hw/usb/dev-audio.c                       |  4 +-
 hw/usb/dev-hid.c                         |  4 +-
 hw/usb/dev-hub.c                         |  4 +-
 hw/usb/dev-mtp.c                         |  3 +-
 hw/usb/dev-network.c                     |  4 +-
 hw/usb/dev-serial.c                      |  4 +-
 hw/usb/dev-smartcard-reader.c            |  7 +---
 hw/usb/dev-uas.c                         |  3 +-
 hw/usb/dev-wacom.c                       |  4 +-
 hw/usb/hcd-ohci-pci.c                    |  4 +-
 hw/usb/host-libusb.c                     |  4 +-
 hw/usb/tusb6010.c                        |  4 +-
 hw/vfio/ap.c                             |  4 +-
 hw/virtio/virtio-input-pci.c             |  8 +---
 hw/watchdog/wdt_i6300esb.c               |  4 +-
 migration/rdma.c                         |  4 +-
 net/can/can_socketcan.c                  |  4 +-
 net/dump.c                               |  4 +-
 net/filter-buffer.c                      |  4 +-
 net/filter-replay.c                      |  4 +-
 net/filter-rewriter.c                    |  4 +-
 scsi/pr-manager-helper.c                 |  4 +-
 target/i386/sev.c                        |  4 +-
 505 files changed, 609 insertions(+), 1795 deletions(-)

diff --git a/hw/9pfs/virtio-9p.h b/hw/9pfs/virtio-9p.h
index ff70c5a971..20fa118f3a 100644
--- a/hw/9pfs/virtio-9p.h
+++ b/hw/9pfs/virtio-9p.h
@@ -13,10 +13,8 @@ struct V9fsVirtioState {
     VirtQueueElement *elems[MAX_REQ];
     V9fsState state;
 };
-typedef struct V9fsVirtioState V9fsVirtioState;
 
 #define TYPE_VIRTIO_9P "virtio-9p-device"
-DECLARE_INSTANCE_CHECKER(V9fsVirtioState, VIRTIO_9P,
-                         TYPE_VIRTIO_9P)
+OBJECT_DECLARE_SIMPLE_TYPE(V9fsVirtioState, VIRTIO_9P)
 
 #endif
diff --git a/hw/audio/intel-hda.h b/hw/audio/intel-hda.h
index e2372abbdc..f78c1833e3 100644
--- a/hw/audio/intel-hda.h
+++ b/hw/audio/intel-hda.h
@@ -12,9 +12,7 @@ OBJECT_DECLARE_TYPE(HDACodecDevice, HDACodecDeviceClass,
                     HDA_CODEC_DEVICE)
 
 #define TYPE_HDA_BUS "HDA"
-typedef struct HDACodecBus HDACodecBus;
-DECLARE_INSTANCE_CHECKER(HDACodecBus, HDA_BUS,
-                         TYPE_HDA_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(HDACodecBus, HDA_BUS)
 
 
 typedef void (*hda_codec_response_func)(HDACodecDevice *dev,
diff --git a/hw/display/ati_int.h b/hw/display/ati_int.h
index 714005447d..8acb9c7466 100644
--- a/hw/display/ati_int.h
+++ b/hw/display/ati_int.h
@@ -30,9 +30,7 @@
 #define PCI_DEVICE_ID_ATI_RADEON_QY 0x5159
 
 #define TYPE_ATI_VGA "ati-vga"
-typedef struct ATIVGAState ATIVGAState;
-DECLARE_INSTANCE_CHECKER(ATIVGAState, ATI_VGA,
-                         TYPE_ATI_VGA)
+OBJECT_DECLARE_SIMPLE_TYPE(ATIVGAState, ATI_VGA)
 
 typedef struct ATIVGARegs {
     uint32_t mm_index;
diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index 714cd01b63..379d3304ab 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -128,11 +128,9 @@ struct PCIQXLDevice {
     QXLRect            dirty[QXL_NUM_DIRTY_RECTS];
     QEMUBH            *update_area_bh;
 };
-typedef struct PCIQXLDevice PCIQXLDevice;
 
 #define TYPE_PCI_QXL "pci-qxl"
-DECLARE_INSTANCE_CHECKER(PCIQXLDevice, PCI_QXL,
-                         TYPE_PCI_QXL)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
 
 #define PANIC_ON(x) if ((x)) {                         \
     printf("%s: PANIC %s failed\n", __func__, #x); \
diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
index fa5feb183c..79d38a3e41 100644
--- a/hw/i386/amd_iommu.h
+++ b/hw/i386/amd_iommu.h
@@ -297,9 +297,7 @@ struct irte_ga {
 };
 
 #define TYPE_AMD_IOMMU_DEVICE "amd-iommu"
-typedef struct AMDVIState AMDVIState;
-DECLARE_INSTANCE_CHECKER(AMDVIState, AMD_IOMMU_DEVICE,
-                         TYPE_AMD_IOMMU_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(AMDVIState, AMD_IOMMU_DEVICE)
 
 #define TYPE_AMD_IOMMU_PCI "AMDVI-PCI"
 
diff --git a/hw/misc/tmp105.h b/hw/misc/tmp105.h
index 7ee8a496ff..e5198fce80 100644
--- a/hw/misc/tmp105.h
+++ b/hw/misc/tmp105.h
@@ -19,9 +19,7 @@
 #include "qom/object.h"
 
 #define TYPE_TMP105 "tmp105"
-typedef struct TMP105State TMP105State;
-DECLARE_INSTANCE_CHECKER(TMP105State, TMP105,
-                         TYPE_TMP105)
+OBJECT_DECLARE_SIMPLE_TYPE(TMP105State, TMP105)
 
 /**
  * TMP105State:
diff --git a/hw/net/fsl_etsec/etsec.h b/hw/net/fsl_etsec/etsec.h
index 0c929d9afd..fddf551544 100644
--- a/hw/net/fsl_etsec/etsec.h
+++ b/hw/net/fsl_etsec/etsec.h
@@ -150,8 +150,7 @@ struct eTSEC {
 typedef struct eTSEC eTSEC;
 
 #define TYPE_ETSEC_COMMON "eTSEC"
-DECLARE_INSTANCE_CHECKER(eTSEC, ETSEC_COMMON,
-                         TYPE_ETSEC_COMMON)
+OBJECT_DECLARE_SIMPLE_TYPE(eTSEC, ETSEC_COMMON)
 
 #define eTSEC_TRANSMIT 1
 #define eTSEC_RECEIVE  2
diff --git a/hw/net/tulip.h b/hw/net/tulip.h
index 87e3ab79bc..ffd1f88d57 100644
--- a/hw/net/tulip.h
+++ b/hw/net/tulip.h
@@ -6,9 +6,7 @@
 #include "qom/object.h"
 
 #define TYPE_TULIP "tulip"
-typedef struct TULIPState TULIPState;
-DECLARE_INSTANCE_CHECKER(TULIPState, TULIP,
-                         TYPE_TULIP)
+OBJECT_DECLARE_SIMPLE_TYPE(TULIPState, TULIP)
 
 #define CSR(_x) ((_x) << 3)
 
diff --git a/hw/ppc/e500-ccsr.h b/hw/ppc/e500-ccsr.h
index de4b9d2bc3..249c17be3b 100644
--- a/hw/ppc/e500-ccsr.h
+++ b/hw/ppc/e500-ccsr.h
@@ -11,10 +11,8 @@ struct PPCE500CCSRState {
 
     MemoryRegion ccsr_space;
 };
-typedef struct PPCE500CCSRState PPCE500CCSRState;
 
 #define TYPE_CCSR "e500-ccsr"
-DECLARE_INSTANCE_CHECKER(PPCE500CCSRState, CCSR,
-                         TYPE_CCSR)
+OBJECT_DECLARE_SIMPLE_TYPE(PPCE500CCSRState, CCSR)
 
 #endif /* E500_CCSR_H */
diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index 2b6425f600..f3976b9a45 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -92,9 +92,7 @@ struct Core99MachineState {
 
 /* Mac NVRAM */
 #define TYPE_MACIO_NVRAM "macio-nvram"
-typedef struct MacIONVRAMState MacIONVRAMState;
-DECLARE_INSTANCE_CHECKER(MacIONVRAMState, MACIO_NVRAM,
-                         TYPE_MACIO_NVRAM)
+OBJECT_DECLARE_SIMPLE_TYPE(MacIONVRAMState, MACIO_NVRAM)
 
 struct MacIONVRAMState {
     /*< private >*/
diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
index 9e6061a043..9e90169695 100644
--- a/hw/s390x/ipl.h
+++ b/hw/s390x/ipl.h
@@ -153,9 +153,7 @@ struct QemuIplParameters {
 typedef struct QemuIplParameters QemuIplParameters;
 
 #define TYPE_S390_IPL "s390-ipl"
-typedef struct S390IPLState S390IPLState;
-DECLARE_INSTANCE_CHECKER(S390IPLState, S390_IPL,
-                         TYPE_S390_IPL)
+OBJECT_DECLARE_SIMPLE_TYPE(S390IPLState, S390_IPL)
 
 struct S390IPLState {
     /*< private >*/
diff --git a/hw/s390x/s390-pci-bus.h b/hw/s390x/s390-pci-bus.h
index 045805980f..97464d0ad3 100644
--- a/hw/s390x/s390-pci-bus.h
+++ b/hw/s390x/s390-pci-bus.h
@@ -37,18 +37,10 @@
 #define UID_UNDEFINED 0
 #define UID_CHECKING_ENABLED 0x01
 
-typedef struct S390pciState S390pciState;
-DECLARE_INSTANCE_CHECKER(S390pciState, S390_PCI_HOST_BRIDGE,
-                         TYPE_S390_PCI_HOST_BRIDGE)
-typedef struct S390PCIBus S390PCIBus;
-DECLARE_INSTANCE_CHECKER(S390PCIBus, S390_PCI_BUS,
-                         TYPE_S390_PCI_BUS)
-typedef struct S390PCIBusDevice S390PCIBusDevice;
-DECLARE_INSTANCE_CHECKER(S390PCIBusDevice, S390_PCI_DEVICE,
-                         TYPE_S390_PCI_DEVICE)
-typedef struct S390PCIIOMMU S390PCIIOMMU;
-DECLARE_INSTANCE_CHECKER(S390PCIIOMMU, S390_PCI_IOMMU,
-                         TYPE_S390_PCI_IOMMU)
+OBJECT_DECLARE_SIMPLE_TYPE(S390pciState, S390_PCI_HOST_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBus, S390_PCI_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBusDevice, S390_PCI_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(S390PCIIOMMU, S390_PCI_IOMMU)
 
 #define HP_EVENT_TO_CONFIGURED        0x0301
 #define HP_EVENT_RESERVED_TO_STANDBY  0x0302
diff --git a/hw/s390x/virtio-ccw.h b/hw/s390x/virtio-ccw.h
index 21790608b4..49a2b8ca42 100644
--- a/hw/s390x/virtio-ccw.h
+++ b/hw/s390x/virtio-ccw.h
@@ -102,9 +102,7 @@ static inline int virtio_ccw_rev_max(VirtioCcwDevice *dev)
 /* virtio-scsi-ccw */
 
 #define TYPE_VIRTIO_SCSI_CCW "virtio-scsi-ccw"
-typedef struct VirtIOSCSICcw VirtIOSCSICcw;
-DECLARE_INSTANCE_CHECKER(VirtIOSCSICcw, VIRTIO_SCSI_CCW,
-                         TYPE_VIRTIO_SCSI_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOSCSICcw, VIRTIO_SCSI_CCW)
 
 struct VirtIOSCSICcw {
     VirtioCcwDevice parent_obj;
@@ -115,9 +113,7 @@ struct VirtIOSCSICcw {
 /* vhost-scsi-ccw */
 
 #define TYPE_VHOST_SCSI_CCW "vhost-scsi-ccw"
-typedef struct VHostSCSICcw VHostSCSICcw;
-DECLARE_INSTANCE_CHECKER(VHostSCSICcw, VHOST_SCSI_CCW,
-                         TYPE_VHOST_SCSI_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VHostSCSICcw, VHOST_SCSI_CCW)
 
 struct VHostSCSICcw {
     VirtioCcwDevice parent_obj;
@@ -128,9 +124,7 @@ struct VHostSCSICcw {
 /* virtio-blk-ccw */
 
 #define TYPE_VIRTIO_BLK_CCW "virtio-blk-ccw"
-typedef struct VirtIOBlkCcw VirtIOBlkCcw;
-DECLARE_INSTANCE_CHECKER(VirtIOBlkCcw, VIRTIO_BLK_CCW,
-                         TYPE_VIRTIO_BLK_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOBlkCcw, VIRTIO_BLK_CCW)
 
 struct VirtIOBlkCcw {
     VirtioCcwDevice parent_obj;
@@ -140,9 +134,7 @@ struct VirtIOBlkCcw {
 /* virtio-balloon-ccw */
 
 #define TYPE_VIRTIO_BALLOON_CCW "virtio-balloon-ccw"
-typedef struct VirtIOBalloonCcw VirtIOBalloonCcw;
-DECLARE_INSTANCE_CHECKER(VirtIOBalloonCcw, VIRTIO_BALLOON_CCW,
-                         TYPE_VIRTIO_BALLOON_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOBalloonCcw, VIRTIO_BALLOON_CCW)
 
 struct VirtIOBalloonCcw {
     VirtioCcwDevice parent_obj;
@@ -152,9 +144,7 @@ struct VirtIOBalloonCcw {
 /* virtio-serial-ccw */
 
 #define TYPE_VIRTIO_SERIAL_CCW "virtio-serial-ccw"
-typedef struct VirtioSerialCcw VirtioSerialCcw;
-DECLARE_INSTANCE_CHECKER(VirtioSerialCcw, VIRTIO_SERIAL_CCW,
-                         TYPE_VIRTIO_SERIAL_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtioSerialCcw, VIRTIO_SERIAL_CCW)
 
 struct VirtioSerialCcw {
     VirtioCcwDevice parent_obj;
@@ -164,9 +154,7 @@ struct VirtioSerialCcw {
 /* virtio-net-ccw */
 
 #define TYPE_VIRTIO_NET_CCW "virtio-net-ccw"
-typedef struct VirtIONetCcw VirtIONetCcw;
-DECLARE_INSTANCE_CHECKER(VirtIONetCcw, VIRTIO_NET_CCW,
-                         TYPE_VIRTIO_NET_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIONetCcw, VIRTIO_NET_CCW)
 
 struct VirtIONetCcw {
     VirtioCcwDevice parent_obj;
@@ -176,9 +164,7 @@ struct VirtIONetCcw {
 /* virtio-rng-ccw */
 
 #define TYPE_VIRTIO_RNG_CCW "virtio-rng-ccw"
-typedef struct VirtIORNGCcw VirtIORNGCcw;
-DECLARE_INSTANCE_CHECKER(VirtIORNGCcw, VIRTIO_RNG_CCW,
-                         TYPE_VIRTIO_RNG_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIORNGCcw, VIRTIO_RNG_CCW)
 
 struct VirtIORNGCcw {
     VirtioCcwDevice parent_obj;
@@ -188,9 +174,7 @@ struct VirtIORNGCcw {
 /* virtio-crypto-ccw */
 
 #define TYPE_VIRTIO_CRYPTO_CCW "virtio-crypto-ccw"
-typedef struct VirtIOCryptoCcw VirtIOCryptoCcw;
-DECLARE_INSTANCE_CHECKER(VirtIOCryptoCcw, VIRTIO_CRYPTO_CCW,
-                         TYPE_VIRTIO_CRYPTO_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOCryptoCcw, VIRTIO_CRYPTO_CCW)
 
 struct VirtIOCryptoCcw {
     VirtioCcwDevice parent_obj;
@@ -203,9 +187,7 @@ VirtIODevice *virtio_ccw_get_vdev(SubchDev *sch);
 #include "hw/9pfs/virtio-9p.h"
 
 #define TYPE_VIRTIO_9P_CCW "virtio-9p-ccw"
-typedef struct V9fsCCWState V9fsCCWState;
-DECLARE_INSTANCE_CHECKER(V9fsCCWState, VIRTIO_9P_CCW,
-                         TYPE_VIRTIO_9P_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(V9fsCCWState, VIRTIO_9P_CCW)
 
 struct V9fsCCWState {
     VirtioCcwDevice parent_obj;
@@ -216,9 +198,7 @@ struct V9fsCCWState {
 
 #ifdef CONFIG_VHOST_VSOCK
 #define TYPE_VHOST_VSOCK_CCW "vhost-vsock-ccw"
-typedef struct VHostVSockCCWState VHostVSockCCWState;
-DECLARE_INSTANCE_CHECKER(VHostVSockCCWState, VHOST_VSOCK_CCW,
-                         TYPE_VHOST_VSOCK_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VHostVSockCCWState, VHOST_VSOCK_CCW)
 
 struct VHostVSockCCWState {
     VirtioCcwDevice parent_obj;
@@ -228,9 +208,7 @@ struct VHostVSockCCWState {
 #endif /* CONFIG_VHOST_VSOCK */
 
 #define TYPE_VIRTIO_GPU_CCW "virtio-gpu-ccw"
-typedef struct VirtIOGPUCcw VirtIOGPUCcw;
-DECLARE_INSTANCE_CHECKER(VirtIOGPUCcw, VIRTIO_GPU_CCW,
-                         TYPE_VIRTIO_GPU_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPUCcw, VIRTIO_GPU_CCW)
 
 struct VirtIOGPUCcw {
     VirtioCcwDevice parent_obj;
@@ -238,9 +216,7 @@ struct VirtIOGPUCcw {
 };
 
 #define TYPE_VIRTIO_INPUT_CCW "virtio-input-ccw"
-typedef struct VirtIOInputCcw VirtIOInputCcw;
-DECLARE_INSTANCE_CHECKER(VirtIOInputCcw, VIRTIO_INPUT_CCW,
-                         TYPE_VIRTIO_INPUT_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputCcw, VIRTIO_INPUT_CCW)
 
 struct VirtIOInputCcw {
     VirtioCcwDevice parent_obj;
@@ -251,9 +227,7 @@ struct VirtIOInputCcw {
 #define TYPE_VIRTIO_KEYBOARD_CCW "virtio-keyboard-ccw"
 #define TYPE_VIRTIO_MOUSE_CCW "virtio-mouse-ccw"
 #define TYPE_VIRTIO_TABLET_CCW "virtio-tablet-ccw"
-typedef struct VirtIOInputHIDCcw VirtIOInputHIDCcw;
-DECLARE_INSTANCE_CHECKER(VirtIOInputHIDCcw, VIRTIO_INPUT_HID_CCW,
-                         TYPE_VIRTIO_INPUT_HID_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputHIDCcw, VIRTIO_INPUT_HID_CCW)
 
 struct VirtIOInputHIDCcw {
     VirtioCcwDevice parent_obj;
diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index 199913bca5..fd122dd4cd 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -329,9 +329,7 @@ void usb_ehci_unrealize(EHCIState *s, DeviceState *dev);
 void ehci_reset(void *opaque);
 
 #define TYPE_PCI_EHCI "pci-ehci-usb"
-typedef struct EHCIPCIState EHCIPCIState;
-DECLARE_INSTANCE_CHECKER(EHCIPCIState, PCI_EHCI,
-                         TYPE_PCI_EHCI)
+OBJECT_DECLARE_SIMPLE_TYPE(EHCIPCIState, PCI_EHCI)
 
 struct EHCIPCIState {
     /*< private >*/
@@ -371,9 +369,7 @@ struct SysBusEHCIClass {
     uint16_t portnr;
 };
 
-typedef struct FUSBH200EHCIState FUSBH200EHCIState;
-DECLARE_INSTANCE_CHECKER(FUSBH200EHCIState, FUSBH200_EHCI,
-                         TYPE_FUSBH200_EHCI)
+OBJECT_DECLARE_SIMPLE_TYPE(FUSBH200EHCIState, FUSBH200_EHCI)
 
 struct FUSBH200EHCIState {
     /*< private >*/
diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
index 6e28e97839..11ac57058d 100644
--- a/hw/usb/hcd-ohci.h
+++ b/hw/usb/hcd-ohci.h
@@ -93,9 +93,7 @@ typedef struct OHCIState {
 } OHCIState;
 
 #define TYPE_SYSBUS_OHCI "sysbus-ohci"
-typedef struct OHCISysBusState OHCISysBusState;
-DECLARE_INSTANCE_CHECKER(OHCISysBusState, SYSBUS_OHCI,
-                         TYPE_SYSBUS_OHCI)
+OBJECT_DECLARE_SIMPLE_TYPE(OHCISysBusState, SYSBUS_OHCI)
 
 struct OHCISysBusState {
     /*< private >*/
diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 2110c0399e..c3dfc14405 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -27,9 +27,7 @@
 #define TYPE_NEC_XHCI "nec-usb-xhci"
 #define TYPE_QEMU_XHCI "qemu-xhci"
 
-typedef struct XHCIState XHCIState;
-DECLARE_INSTANCE_CHECKER(XHCIState, XHCI,
-                         TYPE_XHCI)
+OBJECT_DECLARE_SIMPLE_TYPE(XHCIState, XHCI)
 
 #define MAXPORTS_2 15
 #define MAXPORTS_3 15
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 5e53d5b863..bce71a9ac9 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -115,9 +115,7 @@ typedef struct VFIOMSIXInfo {
 } VFIOMSIXInfo;
 
 #define TYPE_VFIO_PCI "vfio-pci"
-typedef struct VFIOPCIDevice VFIOPCIDevice;
-DECLARE_INSTANCE_CHECKER(VFIOPCIDevice, VFIO_PCI,
-                         TYPE_VFIO_PCI)
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI)
 
 struct VFIOPCIDevice {
     PCIDevice pdev;
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index f46971eac6..c74c4678f2 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -37,11 +37,9 @@ void xen_pt_log(const PCIDevice *d, const char *f, ...) GCC_FMT_ATTR(2, 3);
 typedef const struct XenPTRegInfo XenPTRegInfo;
 typedef struct XenPTReg XenPTReg;
 
-typedef struct XenPCIPassthroughState XenPCIPassthroughState;
 
 #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
-DECLARE_INSTANCE_CHECKER(XenPCIPassthroughState, XEN_PT_DEVICE,
-                         TYPE_XEN_PT_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
 
 uint32_t igd_read_opregion(XenPCIPassthroughState *s);
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
diff --git a/include/block/throttle-groups.h b/include/block/throttle-groups.h
index 20b308f619..8bf7d233fa 100644
--- a/include/block/throttle-groups.h
+++ b/include/block/throttle-groups.h
@@ -60,9 +60,7 @@ typedef struct ThrottleGroupMember {
 } ThrottleGroupMember;
 
 #define TYPE_THROTTLE_GROUP "throttle-group"
-typedef struct ThrottleGroup ThrottleGroup;
-DECLARE_INSTANCE_CHECKER(ThrottleGroup, THROTTLE_GROUP,
-                         TYPE_THROTTLE_GROUP)
+OBJECT_DECLARE_SIMPLE_TYPE(ThrottleGroup, THROTTLE_GROUP)
 
 const char *throttle_group_get_name(ThrottleGroupMember *tgm);
 
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index 1be05a3c0f..c49cafc057 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -67,9 +67,7 @@
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
 
 #define TYPE_ACPI_GED "acpi-ged"
-typedef struct AcpiGedState AcpiGedState;
-DECLARE_INSTANCE_CHECKER(AcpiGedState, ACPI_GED,
-                         TYPE_ACPI_GED)
+OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
 
 #define ACPI_GED_EVT_SEL_OFFSET    0x0
 #define ACPI_GED_EVT_SEL_LEN       0x4
diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
index aff574df5f..d50fbacb8e 100644
--- a/include/hw/acpi/vmgenid.h
+++ b/include/hw/acpi/vmgenid.h
@@ -16,9 +16,7 @@
                                        * OVMF SDT Header Probe Supressor
                                        */
 
-typedef struct VmGenIdState VmGenIdState;
-DECLARE_INSTANCE_CHECKER(VmGenIdState, VMGENID,
-                         TYPE_VMGENID)
+OBJECT_DECLARE_SIMPLE_TYPE(VmGenIdState, VMGENID)
 
 struct VmGenIdState {
     DeviceClass parent_obj;
diff --git a/include/hw/adc/stm32f2xx_adc.h b/include/hw/adc/stm32f2xx_adc.h
index 6a4f8e955b..42b48981f2 100644
--- a/include/hw/adc/stm32f2xx_adc.h
+++ b/include/hw/adc/stm32f2xx_adc.h
@@ -59,9 +59,7 @@
 #define ADC_COMMON_ADDRESS 0x100
 
 #define TYPE_STM32F2XX_ADC "stm32f2xx-adc"
-typedef struct STM32F2XXADCState STM32F2XXADCState;
-DECLARE_INSTANCE_CHECKER(STM32F2XXADCState, STM32F2XX_ADC,
-                         TYPE_STM32F2XX_ADC)
+OBJECT_DECLARE_SIMPLE_TYPE(STM32F2XXADCState, STM32F2XX_ADC)
 
 struct STM32F2XXADCState {
     /* <private> */
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index d13b6cf50f..a76dc7b84d 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -22,9 +22,7 @@
 #define AW_A10_NUM_USB          2
 
 #define TYPE_AW_A10 "allwinner-a10"
-typedef struct AwA10State AwA10State;
-DECLARE_INSTANCE_CHECKER(AwA10State, AW_A10,
-                         TYPE_AW_A10)
+OBJECT_DECLARE_SIMPLE_TYPE(AwA10State, AW_A10)
 
 struct AwA10State {
     /*< private >*/
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index a93e019521..cc308a5d2c 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -106,9 +106,7 @@ enum {
 #define TYPE_AW_H3 "allwinner-h3"
 
 /** Convert input object to Allwinner H3 state object */
-typedef struct AwH3State AwH3State;
-DECLARE_INSTANCE_CHECKER(AwH3State, AW_H3,
-                         TYPE_AW_H3)
+OBJECT_DECLARE_SIMPLE_TYPE(AwH3State, AW_H3)
 
 /** @} */
 
diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index dcb891d9cc..0791dcb68a 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -16,9 +16,7 @@
 #include "qom/object.h"
 
 #define TYPE_BITBAND "ARM,bitband-memory"
-typedef struct BitBandState BitBandState;
-DECLARE_INSTANCE_CHECKER(BitBandState, BITBAND,
-                         TYPE_BITBAND)
+OBJECT_DECLARE_SIMPLE_TYPE(BitBandState, BITBAND)
 
 struct BitBandState {
     /*< private >*/
@@ -32,9 +30,7 @@ struct BitBandState {
 };
 
 #define TYPE_ARMV7M "armv7m"
-typedef struct ARMv7MState ARMv7MState;
-DECLARE_INSTANCE_CHECKER(ARMv7MState, ARMV7M,
-                         TYPE_ARMV7M)
+OBJECT_DECLARE_SIMPLE_TYPE(ARMv7MState, ARMV7M)
 
 #define ARMV7M_NUM_BITBANDS 2
 
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index b4d3ae121a..13d7c4c553 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -32,9 +32,7 @@
 #include "qom/object.h"
 
 #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
-typedef struct BCM2835PeripheralState BCM2835PeripheralState;
-DECLARE_INSTANCE_CHECKER(BCM2835PeripheralState, BCM2835_PERIPHERALS,
-                         TYPE_BCM2835_PERIPHERALS)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835PeripheralState, BCM2835_PERIPHERALS)
 
 struct BCM2835PeripheralState {
     /*< private >*/
diff --git a/include/hw/arm/digic.h b/include/hw/arm/digic.h
index f3ba398914..8f2735c284 100644
--- a/include/hw/arm/digic.h
+++ b/include/hw/arm/digic.h
@@ -25,9 +25,7 @@
 
 #define TYPE_DIGIC "digic"
 
-typedef struct DigicState DigicState;
-DECLARE_INSTANCE_CHECKER(DigicState, DIGIC,
-                         TYPE_DIGIC)
+OBJECT_DECLARE_SIMPLE_TYPE(DigicState, DIGIC)
 
 #define DIGIC4_NB_TIMERS 3
 
diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index c2de1dc102..60b9e126f5 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -103,11 +103,9 @@ struct Exynos4210State {
     I2CBus *i2c_if[EXYNOS4210_I2C_NUMBER];
     qemu_or_irq pl330_irq_orgate[EXYNOS4210_NUM_DMA];
 };
-typedef struct Exynos4210State Exynos4210State;
 
 #define TYPE_EXYNOS4210_SOC "exynos4210"
-DECLARE_INSTANCE_CHECKER(Exynos4210State, EXYNOS4210_SOC,
-                         TYPE_EXYNOS4210_SOC)
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210State, EXYNOS4210_SOC)
 
 void exynos4210_write_secondary(ARMCPU *cpu,
         const struct arm_boot_info *info);
diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index e239505724..971f35dd16 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -35,9 +35,7 @@
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX25 "fsl,imx25"
-typedef struct FslIMX25State FslIMX25State;
-DECLARE_INSTANCE_CHECKER(FslIMX25State, FSL_IMX25,
-                         TYPE_FSL_IMX25)
+OBJECT_DECLARE_SIMPLE_TYPE(FslIMX25State, FSL_IMX25)
 
 #define FSL_IMX25_NUM_UARTS 5
 #define FSL_IMX25_NUM_GPTS 4
diff --git a/include/hw/arm/fsl-imx31.h b/include/hw/arm/fsl-imx31.h
index 64b4ca07b7..b9792d58ae 100644
--- a/include/hw/arm/fsl-imx31.h
+++ b/include/hw/arm/fsl-imx31.h
@@ -31,9 +31,7 @@
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX31 "fsl,imx31"
-typedef struct FslIMX31State FslIMX31State;
-DECLARE_INSTANCE_CHECKER(FslIMX31State, FSL_IMX31,
-                         TYPE_FSL_IMX31)
+OBJECT_DECLARE_SIMPLE_TYPE(FslIMX31State, FSL_IMX31)
 
 #define FSL_IMX31_NUM_UARTS 2
 #define FSL_IMX31_NUM_EPITS 2
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 602b9aff36..29cc425acc 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -37,9 +37,7 @@
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX6 "fsl,imx6"
-typedef struct FslIMX6State FslIMX6State;
-DECLARE_INSTANCE_CHECKER(FslIMX6State, FSL_IMX6,
-                         TYPE_FSL_IMX6)
+OBJECT_DECLARE_SIMPLE_TYPE(FslIMX6State, FSL_IMX6)
 
 #define FSL_IMX6_NUM_CPUS 4
 #define FSL_IMX6_NUM_UARTS 5
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index e4862fdb2c..f8ebfba4f9 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -41,9 +41,7 @@
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX6UL "fsl,imx6ul"
-typedef struct FslIMX6ULState FslIMX6ULState;
-DECLARE_INSTANCE_CHECKER(FslIMX6ULState, FSL_IMX6UL,
-                         TYPE_FSL_IMX6UL)
+OBJECT_DECLARE_SIMPLE_TYPE(FslIMX6ULState, FSL_IMX6UL)
 
 enum FslIMX6ULConfiguration {
     FSL_IMX6UL_NUM_CPUS         = 1,
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 434d1d0641..161fdc36da 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -42,9 +42,7 @@
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX7 "fsl,imx7"
-typedef struct FslIMX7State FslIMX7State;
-DECLARE_INSTANCE_CHECKER(FslIMX7State, FSL_IMX7,
-                         TYPE_FSL_IMX7)
+OBJECT_DECLARE_SIMPLE_TYPE(FslIMX7State, FSL_IMX7)
 
 enum FslIMX7Configuration {
     FSL_IMX7_NUM_CPUS         = 2,
diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index 9b93d0d64e..d406184685 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -33,9 +33,7 @@
 #include "qom/object.h"
 
 #define TYPE_MSF2_SOC     "msf2-soc"
-typedef struct MSF2State MSF2State;
-DECLARE_INSTANCE_CHECKER(MSF2State, MSF2_SOC,
-                         TYPE_MSF2_SOC)
+OBJECT_DECLARE_SIMPLE_TYPE(MSF2State, MSF2_SOC)
 
 #define MSF2_NUM_SPIS         2
 #define MSF2_NUM_UARTS        2
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index b69492b29d..f8a6725b77 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -20,9 +20,7 @@
 #include "qom/object.h"
 
 #define TYPE_NRF51_SOC "nrf51-soc"
-typedef struct NRF51State NRF51State;
-DECLARE_INSTANCE_CHECKER(NRF51State, NRF51_SOC,
-                         TYPE_NRF51_SOC)
+OBJECT_DECLARE_SIMPLE_TYPE(NRF51State, NRF51_SOC)
 
 #define NRF51_NUM_TIMERS 3
 
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 0dbf1712f4..ff6a173f8a 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -94,9 +94,7 @@ void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
 
 /* omap_i2c.c */
 #define TYPE_OMAP_I2C "omap_i2c"
-typedef struct OMAPI2CState OMAPI2CState;
-DECLARE_INSTANCE_CHECKER(OMAPI2CState, OMAP_I2C,
-                         TYPE_OMAP_I2C)
+OBJECT_DECLARE_SIMPLE_TYPE(OMAPI2CState, OMAP_I2C)
 
 
 /* TODO: clock framework (see above) */
diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index 9046876134..1095504b86 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -88,9 +88,7 @@ void pxa2xx_lcd_vsync_notifier(PXA2xxLCDState *s, qemu_irq handler);
 
 /* pxa2xx_mmci.c */
 #define TYPE_PXA2XX_MMCI "pxa2xx-mmci"
-typedef struct PXA2xxMMCIState PXA2xxMMCIState;
-DECLARE_INSTANCE_CHECKER(PXA2xxMMCIState, PXA2XX_MMCI,
-                         TYPE_PXA2XX_MMCI)
+OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxMMCIState, PXA2XX_MMCI)
 
 PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
                 hwaddr base,
@@ -100,9 +98,7 @@ void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
 
 /* pxa2xx_pcmcia.c */
 #define TYPE_PXA2XX_PCMCIA "pxa2xx-pcmcia"
-typedef struct PXA2xxPCMCIAState PXA2xxPCMCIAState;
-DECLARE_INSTANCE_CHECKER(PXA2xxPCMCIAState, PXA2XX_PCMCIA,
-                         TYPE_PXA2XX_PCMCIA)
+OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxPCMCIAState, PXA2XX_PCMCIA)
 
 PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
                                       hwaddr base);
@@ -130,13 +126,10 @@ I2CBus *pxa2xx_i2c_bus(PXA2xxI2CState *s);
 
 #define TYPE_PXA2XX_I2C "pxa2xx_i2c"
 typedef struct PXA2xxI2SState PXA2xxI2SState;
-DECLARE_INSTANCE_CHECKER(PXA2xxI2CState, PXA2XX_I2C,
-                         TYPE_PXA2XX_I2C)
+OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxI2CState, PXA2XX_I2C)
 
 #define TYPE_PXA2XX_FIR "pxa2xx-fir"
-typedef struct PXA2xxFIrState PXA2xxFIrState;
-DECLARE_INSTANCE_CHECKER(PXA2xxFIrState, PXA2XX_FIR,
-                         TYPE_PXA2XX_FIR)
+OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxFIrState, PXA2XX_FIR)
 
 typedef struct {
     ARMCPU *cpu;
diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
index 9c2f4818a6..985ff63aa9 100644
--- a/include/hw/arm/stm32f205_soc.h
+++ b/include/hw/arm/stm32f205_soc.h
@@ -35,9 +35,7 @@
 #include "qom/object.h"
 
 #define TYPE_STM32F205_SOC "stm32f205-soc"
-typedef struct STM32F205State STM32F205State;
-DECLARE_INSTANCE_CHECKER(STM32F205State, STM32F205_SOC,
-                         TYPE_STM32F205_SOC)
+OBJECT_DECLARE_SIMPLE_TYPE(STM32F205State, STM32F205_SOC)
 
 #define STM_NUM_USARTS 6
 #define STM_NUM_TIMERS 4
diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
index f1a22763f4..347105e709 100644
--- a/include/hw/arm/stm32f405_soc.h
+++ b/include/hw/arm/stm32f405_soc.h
@@ -36,9 +36,7 @@
 #include "qom/object.h"
 
 #define TYPE_STM32F405_SOC "stm32f405-soc"
-typedef struct STM32F405State STM32F405State;
-DECLARE_INSTANCE_CHECKER(STM32F405State, STM32F405_SOC,
-                         TYPE_STM32F405_SOC)
+OBJECT_DECLARE_SIMPLE_TYPE(STM32F405State, STM32F405_SOC)
 
 #define STM_NUM_USARTS 7
 #define STM_NUM_TIMERS 4
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index eaa9023fd6..8ce8e63b56 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -23,9 +23,7 @@
 #include "qom/object.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
-typedef struct Versal Versal;
-DECLARE_INSTANCE_CHECKER(Versal, XLNX_VERSAL,
-                         TYPE_XLNX_VERSAL)
+OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
 
 #define XLNX_VERSAL_NR_ACPUS   2
 #define XLNX_VERSAL_NR_UARTS   2
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 4cc97b4610..567d0dba09 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -35,9 +35,7 @@
 #include "qom/object.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
-typedef struct XlnxZynqMPState XlnxZynqMPState;
-DECLARE_INSTANCE_CHECKER(XlnxZynqMPState, XLNX_ZYNQMP,
-                         TYPE_XLNX_ZYNQMP)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 
 #define XLNX_ZYNQMP_NUM_APU_CPUS 4
 #define XLNX_ZYNQMP_NUM_RPU_CPUS 2
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 3e26303705..7dde0adcee 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -9,9 +9,7 @@
 /* pflash_cfi01.c */
 
 #define TYPE_PFLASH_CFI01 "cfi.pflash01"
-typedef struct PFlashCFI01 PFlashCFI01;
-DECLARE_INSTANCE_CHECKER(PFlashCFI01, PFLASH_CFI01,
-                         TYPE_PFLASH_CFI01)
+OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI01, PFLASH_CFI01)
 
 
 PFlashCFI01 *pflash_cfi01_register(hwaddr base,
@@ -30,9 +28,7 @@ void pflash_cfi01_legacy_drive(PFlashCFI01 *dev, DriveInfo *dinfo);
 /* pflash_cfi02.c */
 
 #define TYPE_PFLASH_CFI02 "cfi.pflash02"
-typedef struct PFlashCFI02 PFlashCFI02;
-DECLARE_INSTANCE_CHECKER(PFlashCFI02, PFLASH_CFI02,
-                         TYPE_PFLASH_CFI02)
+OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI02, PFLASH_CFI02)
 
 
 PFlashCFI02 *pflash_cfi02_register(hwaddr base,
diff --git a/include/hw/block/swim.h b/include/hw/block/swim.h
index 8287da7c30..5a49029543 100644
--- a/include/hw/block/swim.h
+++ b/include/hw/block/swim.h
@@ -17,13 +17,10 @@
 
 #define SWIM_MAX_FD            2
 
-typedef struct SWIMDrive SWIMDrive;
-typedef struct SWIMBus SWIMBus;
 typedef struct SWIMCtrl SWIMCtrl;
 
 #define TYPE_SWIM_DRIVE "swim-drive"
-DECLARE_INSTANCE_CHECKER(SWIMDrive, SWIM_DRIVE,
-                         TYPE_SWIM_DRIVE)
+OBJECT_DECLARE_SIMPLE_TYPE(SWIMDrive, SWIM_DRIVE)
 
 struct SWIMDrive {
     DeviceState qdev;
@@ -32,8 +29,7 @@ struct SWIMDrive {
 };
 
 #define TYPE_SWIM_BUS "swim-bus"
-DECLARE_INSTANCE_CHECKER(SWIMBus, SWIM_BUS,
-                         TYPE_SWIM_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(SWIMBus, SWIM_BUS)
 
 struct SWIMBus {
     BusState bus;
@@ -70,9 +66,7 @@ struct SWIMCtrl {
 };
 
 #define TYPE_SWIM "swim"
-typedef struct Swim Swim;
-DECLARE_INSTANCE_CHECKER(Swim, SWIM,
-                         TYPE_SWIM)
+OBJECT_DECLARE_SIMPLE_TYPE(Swim, SWIM)
 
 struct Swim {
     SysBusDevice parent_obj;
diff --git a/include/hw/char/avr_usart.h b/include/hw/char/avr_usart.h
index 5202f152b0..bb57532403 100644
--- a/include/hw/char/avr_usart.h
+++ b/include/hw/char/avr_usart.h
@@ -58,9 +58,7 @@
 #define USART_CSRC_CSZ0   (1 << 1)
 
 #define TYPE_AVR_USART "avr-usart"
-typedef struct AVRUsartState AVRUsartState;
-DECLARE_INSTANCE_CHECKER(AVRUsartState, AVR_USART,
-                         TYPE_AVR_USART)
+OBJECT_DECLARE_SIMPLE_TYPE(AVRUsartState, AVR_USART)
 
 struct AVRUsartState {
     /* <private> */
diff --git a/include/hw/char/bcm2835_aux.h b/include/hw/char/bcm2835_aux.h
index a08795c47f..9e081793a0 100644
--- a/include/hw/char/bcm2835_aux.h
+++ b/include/hw/char/bcm2835_aux.h
@@ -14,9 +14,7 @@
 #include "qom/object.h"
 
 #define TYPE_BCM2835_AUX "bcm2835-aux"
-typedef struct BCM2835AuxState BCM2835AuxState;
-DECLARE_INSTANCE_CHECKER(BCM2835AuxState, BCM2835_AUX,
-                         TYPE_BCM2835_AUX)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835AuxState, BCM2835_AUX)
 
 #define BCM2835_AUX_RX_FIFO_LEN 8
 
diff --git a/include/hw/char/cadence_uart.h b/include/hw/char/cadence_uart.h
index 1734f53541..e7f7cd8468 100644
--- a/include/hw/char/cadence_uart.h
+++ b/include/hw/char/cadence_uart.h
@@ -32,9 +32,7 @@
 #define CADENCE_UART_R_MAX (0x48/4)
 
 #define TYPE_CADENCE_UART "cadence_uart"
-typedef struct CadenceUARTState CadenceUARTState;
-DECLARE_INSTANCE_CHECKER(CadenceUARTState, CADENCE_UART,
-                         TYPE_CADENCE_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(CadenceUARTState, CADENCE_UART)
 
 struct CadenceUARTState {
     /*< private >*/
diff --git a/include/hw/char/cmsdk-apb-uart.h b/include/hw/char/cmsdk-apb-uart.h
index 2c3869aa16..9daff0eeee 100644
--- a/include/hw/char/cmsdk-apb-uart.h
+++ b/include/hw/char/cmsdk-apb-uart.h
@@ -18,9 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_CMSDK_APB_UART "cmsdk-apb-uart"
-typedef struct CMSDKAPBUART CMSDKAPBUART;
-DECLARE_INSTANCE_CHECKER(CMSDKAPBUART, CMSDK_APB_UART,
-                         TYPE_CMSDK_APB_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBUART, CMSDK_APB_UART)
 
 struct CMSDKAPBUART {
     /*< private >*/
diff --git a/include/hw/char/digic-uart.h b/include/hw/char/digic-uart.h
index 01d406833d..f710a1a099 100644
--- a/include/hw/char/digic-uart.h
+++ b/include/hw/char/digic-uart.h
@@ -23,9 +23,7 @@
 #include "qom/object.h"
 
 #define TYPE_DIGIC_UART "digic-uart"
-typedef struct DigicUartState DigicUartState;
-DECLARE_INSTANCE_CHECKER(DigicUartState, DIGIC_UART,
-                         TYPE_DIGIC_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(DigicUartState, DIGIC_UART)
 
 enum {
     R_TX = 0x00,
diff --git a/include/hw/char/escc.h b/include/hw/char/escc.h
index 5eaec507da..7e9482dee2 100644
--- a/include/hw/char/escc.h
+++ b/include/hw/char/escc.h
@@ -11,9 +11,7 @@
 #define TYPE_ESCC "escc"
 #define ESCC_SIZE 4
 
-typedef struct ESCCState ESCCState;
-DECLARE_INSTANCE_CHECKER(ESCCState, ESCC,
-                         TYPE_ESCC)
+OBJECT_DECLARE_SIMPLE_TYPE(ESCCState, ESCC)
 
 typedef enum {
     escc_chn_a, escc_chn_b,
diff --git a/include/hw/char/ibex_uart.h b/include/hw/char/ibex_uart.h
index 36eb75fc4c..03d19e3f6f 100644
--- a/include/hw/char/ibex_uart.h
+++ b/include/hw/char/ibex_uart.h
@@ -70,9 +70,7 @@ REG32(TIMEOUT_CTRL, 0x2c)
 #define IBEX_UART_CLOCK 50000000 /* 50MHz clock */
 
 #define TYPE_IBEX_UART "ibex-uart"
-typedef struct IbexUartState IbexUartState;
-DECLARE_INSTANCE_CHECKER(IbexUartState, IBEX_UART,
-                         TYPE_IBEX_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(IbexUartState, IBEX_UART)
 
 struct IbexUartState {
     /* <private> */
diff --git a/include/hw/char/imx_serial.h b/include/hw/char/imx_serial.h
index 200f1ec33a..91c9894ad5 100644
--- a/include/hw/char/imx_serial.h
+++ b/include/hw/char/imx_serial.h
@@ -23,9 +23,7 @@
 #include "qom/object.h"
 
 #define TYPE_IMX_SERIAL "imx.serial"
-typedef struct IMXSerialState IMXSerialState;
-DECLARE_INSTANCE_CHECKER(IMXSerialState, IMX_SERIAL,
-                         TYPE_IMX_SERIAL)
+OBJECT_DECLARE_SIMPLE_TYPE(IMXSerialState, IMX_SERIAL)
 
 #define URXD_CHARRDY    (1<<15)   /* character read is valid */
 #define URXD_ERR        (1<<14)   /* Character has error */
diff --git a/include/hw/char/nrf51_uart.h b/include/hw/char/nrf51_uart.h
index 0cf3c4e328..561b6383c4 100644
--- a/include/hw/char/nrf51_uart.h
+++ b/include/hw/char/nrf51_uart.h
@@ -20,9 +20,7 @@
 #define UART_SIZE 0x1000
 
 #define TYPE_NRF51_UART "nrf51_soc.uart"
-typedef struct NRF51UARTState NRF51UARTState;
-DECLARE_INSTANCE_CHECKER(NRF51UARTState, NRF51_UART,
-                         TYPE_NRF51_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(NRF51UARTState, NRF51_UART)
 
 REG32(UART_STARTRX, 0x000)
 REG32(UART_STOPRX, 0x004)
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index 80de4ecde6..a91ea50e11 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -22,9 +22,7 @@
 #include "qom/object.h"
 
 #define TYPE_PL011 "pl011"
-typedef struct PL011State PL011State;
-DECLARE_INSTANCE_CHECKER(PL011State, PL011,
-                         TYPE_PL011)
+OBJECT_DECLARE_SIMPLE_TYPE(PL011State, PL011)
 
 /* This shares the same struct (and cast macro) as the base pl011 device */
 #define TYPE_PL011_LUMINARY "pl011_luminary"
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 264f529a7f..db4f9af18c 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -89,14 +89,12 @@ struct SerialMM {
     uint8_t regshift;
     uint8_t endianness;
 };
-typedef struct SerialMM SerialMM;
 
 struct SerialIO {
     SysBusDevice parent;
 
     SerialState serial;
 };
-typedef struct SerialIO SerialIO;
 
 extern const VMStateDescription vmstate_serial;
 extern const MemoryRegionOps serial_io_ops;
@@ -104,16 +102,13 @@ extern const MemoryRegionOps serial_io_ops;
 void serial_set_frequency(SerialState *s, uint32_t frequency);
 
 #define TYPE_SERIAL "serial"
-DECLARE_INSTANCE_CHECKER(SerialState, SERIAL,
-                         TYPE_SERIAL)
+OBJECT_DECLARE_SIMPLE_TYPE(SerialState, SERIAL)
 
 #define TYPE_SERIAL_MM "serial-mm"
-DECLARE_INSTANCE_CHECKER(SerialMM, SERIAL_MM,
-                         TYPE_SERIAL_MM)
+OBJECT_DECLARE_SIMPLE_TYPE(SerialMM, SERIAL_MM)
 
 #define TYPE_SERIAL_IO "serial-io"
-DECLARE_INSTANCE_CHECKER(SerialIO, SERIAL_IO,
-                         TYPE_SERIAL_IO)
+OBJECT_DECLARE_SIMPLE_TYPE(SerialIO, SERIAL_IO)
 
 SerialMM *serial_mm_init(MemoryRegion *address_space,
                          hwaddr base, int regshift,
diff --git a/include/hw/char/stm32f2xx_usart.h b/include/hw/char/stm32f2xx_usart.h
index 1670c076d4..65bcc85470 100644
--- a/include/hw/char/stm32f2xx_usart.h
+++ b/include/hw/char/stm32f2xx_usart.h
@@ -54,9 +54,7 @@
 #define USART_CR1_RE  (1 << 2)
 
 #define TYPE_STM32F2XX_USART "stm32f2xx-usart"
-typedef struct STM32F2XXUsartState STM32F2XXUsartState;
-DECLARE_INSTANCE_CHECKER(STM32F2XXUsartState, STM32F2XX_USART,
-                         TYPE_STM32F2XX_USART)
+OBJECT_DECLARE_SIMPLE_TYPE(STM32F2XXUsartState, STM32F2XX_USART)
 
 struct STM32F2XXUsartState {
     /* <private> */
diff --git a/include/hw/clock.h b/include/hw/clock.h
index b524509b47..d357594df9 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -18,9 +18,7 @@
 #include "qemu/queue.h"
 
 #define TYPE_CLOCK "clock"
-typedef struct Clock Clock;
-DECLARE_INSTANCE_CHECKER(Clock, CLOCK,
-                         TYPE_CLOCK)
+OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
 
 typedef void ClockCallback(void *opaque);
 
diff --git a/include/hw/core/generic-loader.h b/include/hw/core/generic-loader.h
index 8e86532df6..19d87b39c8 100644
--- a/include/hw/core/generic-loader.h
+++ b/include/hw/core/generic-loader.h
@@ -40,10 +40,8 @@ struct GenericLoaderState {
     bool data_be;
     bool set_pc;
 };
-typedef struct GenericLoaderState GenericLoaderState;
 
 #define TYPE_GENERIC_LOADER "loader"
-DECLARE_INSTANCE_CHECKER(GenericLoaderState, GENERIC_LOADER,
-                         TYPE_GENERIC_LOADER)
+OBJECT_DECLARE_SIMPLE_TYPE(GenericLoaderState, GENERIC_LOADER)
 
 #endif
diff --git a/include/hw/core/split-irq.h b/include/hw/core/split-irq.h
index 76d42b29aa..ff8852f407 100644
--- a/include/hw/core/split-irq.h
+++ b/include/hw/core/split-irq.h
@@ -42,10 +42,8 @@
 
 #define MAX_SPLIT_LINES 16
 
-typedef struct SplitIRQ SplitIRQ;
 
-DECLARE_INSTANCE_CHECKER(SplitIRQ, SPLIT_IRQ,
-                         TYPE_SPLIT_IRQ)
+OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
 
 struct SplitIRQ {
     DeviceState parent_obj;
diff --git a/include/hw/cpu/a15mpcore.h b/include/hw/cpu/a15mpcore.h
index 58d8ac7415..75d39e5458 100644
--- a/include/hw/cpu/a15mpcore.h
+++ b/include/hw/cpu/a15mpcore.h
@@ -27,9 +27,7 @@
 /* A15MP private memory region.  */
 
 #define TYPE_A15MPCORE_PRIV "a15mpcore_priv"
-typedef struct A15MPPrivState A15MPPrivState;
-DECLARE_INSTANCE_CHECKER(A15MPPrivState, A15MPCORE_PRIV,
-                         TYPE_A15MPCORE_PRIV)
+OBJECT_DECLARE_SIMPLE_TYPE(A15MPPrivState, A15MPCORE_PRIV)
 
 struct A15MPPrivState {
     /*< private >*/
diff --git a/include/hw/cpu/a9mpcore.h b/include/hw/cpu/a9mpcore.h
index 37e5cfce08..e0396ab6af 100644
--- a/include/hw/cpu/a9mpcore.h
+++ b/include/hw/cpu/a9mpcore.h
@@ -18,9 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_A9MPCORE_PRIV "a9mpcore_priv"
-typedef struct A9MPPrivState A9MPPrivState;
-DECLARE_INSTANCE_CHECKER(A9MPPrivState, A9MPCORE_PRIV,
-                         TYPE_A9MPCORE_PRIV)
+OBJECT_DECLARE_SIMPLE_TYPE(A9MPPrivState, A9MPCORE_PRIV)
 
 struct A9MPPrivState {
     /*< private >*/
diff --git a/include/hw/cpu/arm11mpcore.h b/include/hw/cpu/arm11mpcore.h
index 411d7e6659..2cac8c1232 100644
--- a/include/hw/cpu/arm11mpcore.h
+++ b/include/hw/cpu/arm11mpcore.h
@@ -17,9 +17,7 @@
 #include "qom/object.h"
 
 #define TYPE_ARM11MPCORE_PRIV "arm11mpcore_priv"
-typedef struct ARM11MPCorePriveState ARM11MPCorePriveState;
-DECLARE_INSTANCE_CHECKER(ARM11MPCorePriveState, ARM11MPCORE_PRIV,
-                         TYPE_ARM11MPCORE_PRIV)
+OBJECT_DECLARE_SIMPLE_TYPE(ARM11MPCorePriveState, ARM11MPCORE_PRIV)
 
 struct ARM11MPCorePriveState {
     SysBusDevice parent_obj;
diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index 1c807c5902..53fbf36af5 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -55,9 +55,7 @@
  */
 
 #define TYPE_CPU_CLUSTER "cpu-cluster"
-typedef struct CPUClusterState CPUClusterState;
-DECLARE_INSTANCE_CHECKER(CPUClusterState, CPU_CLUSTER,
-                         TYPE_CPU_CLUSTER)
+OBJECT_DECLARE_SIMPLE_TYPE(CPUClusterState, CPU_CLUSTER)
 
 /*
  * This limit is imposed by TCG, which puts the cluster ID into an
diff --git a/include/hw/cpu/core.h b/include/hw/cpu/core.h
index 61ea3481f8..98ab91647e 100644
--- a/include/hw/cpu/core.h
+++ b/include/hw/cpu/core.h
@@ -14,9 +14,7 @@
 
 #define TYPE_CPU_CORE "cpu-core"
 
-typedef struct CPUCore CPUCore;
-DECLARE_INSTANCE_CHECKER(CPUCore, CPU_CORE,
-                         TYPE_CPU_CORE)
+OBJECT_DECLARE_SIMPLE_TYPE(CPUCore, CPU_CORE)
 
 struct CPUCore {
     /*< private >*/
diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_fb.h
index 226d77a264..38671afffd 100644
--- a/include/hw/display/bcm2835_fb.h
+++ b/include/hw/display/bcm2835_fb.h
@@ -17,9 +17,7 @@
 #include "qom/object.h"
 
 #define TYPE_BCM2835_FB "bcm2835-fb"
-typedef struct BCM2835FBState BCM2835FBState;
-DECLARE_INSTANCE_CHECKER(BCM2835FBState, BCM2835_FB,
-                         TYPE_BCM2835_FB)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835FBState, BCM2835_FB)
 
 /*
  * Configuration information about the fb which the guest can program
diff --git a/include/hw/display/dpcd.h b/include/hw/display/dpcd.h
index 09304dd1f6..a4e37abf6f 100644
--- a/include/hw/display/dpcd.h
+++ b/include/hw/display/dpcd.h
@@ -26,11 +26,9 @@
 #define DPCD_H
 #include "qom/object.h"
 
-typedef struct DPCDState DPCDState;
 
 #define TYPE_DPCD "dpcd"
-DECLARE_INSTANCE_CHECKER(DPCDState, DPCD,
-                         TYPE_DPCD)
+OBJECT_DECLARE_SIMPLE_TYPE(DPCDState, DPCD)
 
 /* DCPD Revision. */
 #define DPCD_REVISION                           0x00
diff --git a/include/hw/display/i2c-ddc.h b/include/hw/display/i2c-ddc.h
index fbabfea5a9..94b5880587 100644
--- a/include/hw/display/i2c-ddc.h
+++ b/include/hw/display/i2c-ddc.h
@@ -34,10 +34,8 @@ struct I2CDDCState {
     uint8_t edid_blob[128];
 };
 
-typedef struct I2CDDCState I2CDDCState;
 
 #define TYPE_I2CDDC "i2c-ddc"
-DECLARE_INSTANCE_CHECKER(I2CDDCState, I2CDDC,
-                         TYPE_I2CDDC)
+OBJECT_DECLARE_SIMPLE_TYPE(I2CDDCState, I2CDDC)
 
 #endif /* I2C_DDC_H */
diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
index 4adfaa725a..c133fa271e 100644
--- a/include/hw/display/macfb.h
+++ b/include/hw/display/macfb.h
@@ -32,9 +32,7 @@ typedef struct MacfbState {
 } MacfbState;
 
 #define TYPE_MACFB "sysbus-macfb"
-typedef struct MacfbSysBusState MacfbSysBusState;
-DECLARE_INSTANCE_CHECKER(MacfbSysBusState, MACFB,
-                         TYPE_MACFB)
+OBJECT_DECLARE_SIMPLE_TYPE(MacfbSysBusState, MACFB)
 
 struct MacfbSysBusState {
     SysBusDevice busdev;
diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index 3b7d9e5a2a..8ab4733bb8 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -103,10 +103,8 @@ struct XlnxDPState {
     DPCDState *dpcd;
     I2CDDCState *edid;
 };
-typedef struct XlnxDPState XlnxDPState;
 
 #define TYPE_XLNX_DP "xlnx.v-dp"
-DECLARE_INSTANCE_CHECKER(XlnxDPState, XLNX_DP,
-                         TYPE_XLNX_DP)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxDPState, XLNX_DP)
 
 #endif
diff --git a/include/hw/dma/bcm2835_dma.h b/include/hw/dma/bcm2835_dma.h
index b94dae779a..1d26b1d8d0 100644
--- a/include/hw/dma/bcm2835_dma.h
+++ b/include/hw/dma/bcm2835_dma.h
@@ -26,9 +26,7 @@ typedef struct {
 } BCM2835DMAChan;
 
 #define TYPE_BCM2835_DMA "bcm2835-dma"
-typedef struct BCM2835DMAState BCM2835DMAState;
-DECLARE_INSTANCE_CHECKER(BCM2835DMAState, BCM2835_DMA,
-                         TYPE_BCM2835_DMA)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835DMAState, BCM2835_DMA)
 
 #define BCM2835_DMA_NCHANS 16
 
diff --git a/include/hw/dma/i8257.h b/include/hw/dma/i8257.h
index 362ce7b8dc..f652345d65 100644
--- a/include/hw/dma/i8257.h
+++ b/include/hw/dma/i8257.h
@@ -6,9 +6,7 @@
 #include "qom/object.h"
 
 #define TYPE_I8257 "i8257"
-typedef struct I8257State I8257State;
-DECLARE_INSTANCE_CHECKER(I8257State, I8257,
-                         TYPE_I8257)
+OBJECT_DECLARE_SIMPLE_TYPE(I8257State, I8257)
 
 typedef struct I8257Regs {
     int now[2];
diff --git a/include/hw/dma/pl080.h b/include/hw/dma/pl080.h
index e9669bf5ae..1883f04270 100644
--- a/include/hw/dma/pl080.h
+++ b/include/hw/dma/pl080.h
@@ -43,9 +43,7 @@ typedef struct {
 
 #define TYPE_PL080 "pl080"
 #define TYPE_PL081 "pl081"
-typedef struct PL080State PL080State;
-DECLARE_INSTANCE_CHECKER(PL080State, PL080,
-                         TYPE_PL080)
+OBJECT_DECLARE_SIMPLE_TYPE(PL080State, PL080)
 
 struct PL080State {
     SysBusDevice parent_obj;
diff --git a/include/hw/dma/xlnx-zdma.h b/include/hw/dma/xlnx-zdma.h
index f638abe568..6602e7ffa7 100644
--- a/include/hw/dma/xlnx-zdma.h
+++ b/include/hw/dma/xlnx-zdma.h
@@ -76,11 +76,9 @@ struct XlnxZDMA {
        to model write only mode.  */
     uint8_t buf[2048];
 };
-typedef struct XlnxZDMA XlnxZDMA;
 
 #define TYPE_XLNX_ZDMA "xlnx.zdma"
 
-DECLARE_INSTANCE_CHECKER(XlnxZDMA, XLNX_ZDMA,
-                         TYPE_XLNX_ZDMA)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxZDMA, XLNX_ZDMA)
 
 #endif /* XLNX_ZDMA_H */
diff --git a/include/hw/dma/xlnx-zynq-devcfg.h b/include/hw/dma/xlnx-zynq-devcfg.h
index e16b08f9c5..e4cf085d70 100644
--- a/include/hw/dma/xlnx-zynq-devcfg.h
+++ b/include/hw/dma/xlnx-zynq-devcfg.h
@@ -33,9 +33,7 @@
 
 #define TYPE_XLNX_ZYNQ_DEVCFG "xlnx.ps7-dev-cfg"
 
-typedef struct XlnxZynqDevcfg XlnxZynqDevcfg;
-DECLARE_INSTANCE_CHECKER(XlnxZynqDevcfg, XLNX_ZYNQ_DEVCFG,
-                         TYPE_XLNX_ZYNQ_DEVCFG)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqDevcfg, XLNX_ZYNQ_DEVCFG)
 
 #define XLNX_ZYNQ_DEVCFG_R_MAX (0x100 / 4)
 
diff --git a/include/hw/dma/xlnx_dpdma.h b/include/hw/dma/xlnx_dpdma.h
index 94b01cad0a..40537a848b 100644
--- a/include/hw/dma/xlnx_dpdma.h
+++ b/include/hw/dma/xlnx_dpdma.h
@@ -43,11 +43,9 @@ struct XlnxDPDMAState {
     qemu_irq irq;
 };
 
-typedef struct XlnxDPDMAState XlnxDPDMAState;
 
 #define TYPE_XLNX_DPDMA "xlnx.dpdma"
-DECLARE_INSTANCE_CHECKER(XlnxDPDMAState, XLNX_DPDMA,
-                         TYPE_XLNX_DPDMA)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxDPDMAState, XLNX_DPDMA)
 
 /*
  * xlnx_dpdma_start_operation: Start the operation on the specified channel. The
diff --git a/include/hw/gpio/bcm2835_gpio.h b/include/hw/gpio/bcm2835_gpio.h
index e06e08a0fe..1c53a05090 100644
--- a/include/hw/gpio/bcm2835_gpio.h
+++ b/include/hw/gpio/bcm2835_gpio.h
@@ -33,10 +33,8 @@ struct BCM2835GpioState {
     uint8_t sd_fsel;
     qemu_irq out[54];
 };
-typedef struct BCM2835GpioState BCM2835GpioState;
 
 #define TYPE_BCM2835_GPIO "bcm2835_gpio"
-DECLARE_INSTANCE_CHECKER(BCM2835GpioState, BCM2835_GPIO,
-                         TYPE_BCM2835_GPIO)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835GpioState, BCM2835_GPIO)
 
 #endif
diff --git a/include/hw/gpio/imx_gpio.h b/include/hw/gpio/imx_gpio.h
index a72b272ace..227860b9f0 100644
--- a/include/hw/gpio/imx_gpio.h
+++ b/include/hw/gpio/imx_gpio.h
@@ -24,9 +24,7 @@
 #include "qom/object.h"
 
 #define TYPE_IMX_GPIO "imx.gpio"
-typedef struct IMXGPIOState IMXGPIOState;
-DECLARE_INSTANCE_CHECKER(IMXGPIOState, IMX_GPIO,
-                         TYPE_IMX_GPIO)
+OBJECT_DECLARE_SIMPLE_TYPE(IMXGPIOState, IMX_GPIO)
 
 #define IMX_GPIO_MEM_SIZE 0x20
 
diff --git a/include/hw/gpio/nrf51_gpio.h b/include/hw/gpio/nrf51_gpio.h
index 55d7d24a52..8f9c2f86da 100644
--- a/include/hw/gpio/nrf51_gpio.h
+++ b/include/hw/gpio/nrf51_gpio.h
@@ -29,9 +29,7 @@
 #include "hw/sysbus.h"
 #include "qom/object.h"
 #define TYPE_NRF51_GPIO "nrf51_soc.gpio"
-typedef struct NRF51GPIOState NRF51GPIOState;
-DECLARE_INSTANCE_CHECKER(NRF51GPIOState, NRF51_GPIO,
-                         TYPE_NRF51_GPIO)
+OBJECT_DECLARE_SIMPLE_TYPE(NRF51GPIOState, NRF51_GPIO)
 
 #define NRF51_GPIO_PINS 32
 
diff --git a/include/hw/hyperv/vmbus-bridge.h b/include/hw/hyperv/vmbus-bridge.h
index 1324873775..1e5419574e 100644
--- a/include/hw/hyperv/vmbus-bridge.h
+++ b/include/hw/hyperv/vmbus-bridge.h
@@ -23,10 +23,8 @@ struct VMBusBridge {
 
     VMBus *bus;
 };
-typedef struct VMBusBridge VMBusBridge;
 
-DECLARE_INSTANCE_CHECKER(VMBusBridge, VMBUS_BRIDGE,
-                         TYPE_VMBUS_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(VMBusBridge, VMBUS_BRIDGE)
 
 static inline VMBusBridge *vmbus_bridge_find(void)
 {
diff --git a/include/hw/hyperv/vmbus.h b/include/hw/hyperv/vmbus.h
index 6e9d1c16be..f98bea3888 100644
--- a/include/hw/hyperv/vmbus.h
+++ b/include/hw/hyperv/vmbus.h
@@ -24,9 +24,7 @@ OBJECT_DECLARE_TYPE(VMBusDevice, VMBusDeviceClass,
                     VMBUS_DEVICE)
 
 #define TYPE_VMBUS "vmbus"
-typedef struct VMBus VMBus;
-DECLARE_INSTANCE_CHECKER(VMBus, VMBUS,
-                         TYPE_VMBUS)
+OBJECT_DECLARE_SIMPLE_TYPE(VMBus, VMBUS)
 
 /*
  * Object wrapping a GPADL -- GPA Descriptor List -- an array of guest physical
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 17e57436ce..277dd9f2d6 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -49,8 +49,7 @@ struct I2CSlave {
 };
 
 #define TYPE_I2C_BUS "i2c-bus"
-DECLARE_INSTANCE_CHECKER(I2CBus, I2C_BUS,
-                         TYPE_I2C_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(I2CBus, I2C_BUS)
 
 typedef struct I2CNode I2CNode;
 
diff --git a/include/hw/i2c/imx_i2c.h b/include/hw/i2c/imx_i2c.h
index e7f09104cf..e4f91339f5 100644
--- a/include/hw/i2c/imx_i2c.h
+++ b/include/hw/i2c/imx_i2c.h
@@ -25,9 +25,7 @@
 #include "qom/object.h"
 
 #define TYPE_IMX_I2C "imx.i2c"
-typedef struct IMXI2CState IMXI2CState;
-DECLARE_INSTANCE_CHECKER(IMXI2CState, IMX_I2C,
-                         TYPE_IMX_I2C)
+OBJECT_DECLARE_SIMPLE_TYPE(IMXI2CState, IMX_I2C)
 
 #define IMX_I2C_MEM_SIZE           0x14
 
diff --git a/include/hw/i2c/microbit_i2c.h b/include/hw/i2c/microbit_i2c.h
index 69d70287d7..3c29e09bf3 100644
--- a/include/hw/i2c/microbit_i2c.h
+++ b/include/hw/i2c/microbit_i2c.h
@@ -27,9 +27,7 @@
 #define NRF51_TWI_REG_ADDRESS 0x588
 
 #define TYPE_MICROBIT_I2C "microbit.i2c"
-typedef struct MicrobitI2CState MicrobitI2CState;
-DECLARE_INSTANCE_CHECKER(MicrobitI2CState, MICROBIT_I2C,
-                         TYPE_MICROBIT_I2C)
+OBJECT_DECLARE_SIMPLE_TYPE(MicrobitI2CState, MICROBIT_I2C)
 
 #define MICROBIT_I2C_NREGS (NRF51_PERIPHERAL_SIZE / sizeof(uint32_t))
 
diff --git a/include/hw/i2c/ppc4xx_i2c.h b/include/hw/i2c/ppc4xx_i2c.h
index 7cbcdaf12f..4e882fa3c8 100644
--- a/include/hw/i2c/ppc4xx_i2c.h
+++ b/include/hw/i2c/ppc4xx_i2c.h
@@ -32,9 +32,7 @@
 #include "qom/object.h"
 
 #define TYPE_PPC4xx_I2C "ppc4xx-i2c"
-typedef struct PPC4xxI2CState PPC4xxI2CState;
-DECLARE_INSTANCE_CHECKER(PPC4xxI2CState, PPC4xx_I2C,
-                         TYPE_PPC4xx_I2C)
+OBJECT_DECLARE_SIMPLE_TYPE(PPC4xxI2CState, PPC4xx_I2C)
 
 struct PPC4xxI2CState {
     /*< private >*/
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index e750d67975..48b442bc0b 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -24,9 +24,7 @@ void ich9_generate_smi(void);
 #define ICH9_CC_SIZE (16 * 1024) /* 16KB. Chipset configuration registers */
 
 #define TYPE_ICH9_LPC_DEVICE "ICH9-LPC"
-typedef struct ICH9LPCState ICH9LPCState;
-DECLARE_INSTANCE_CHECKER(ICH9LPCState, ICH9_LPC_DEVICE,
-                         TYPE_ICH9_LPC_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(ICH9LPCState, ICH9_LPC_DEVICE)
 
 struct ICH9LPCState {
     /* ICH9 LPC PCI to ISA bridge */
diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index 98cfc77723..41783ee46d 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -27,9 +27,7 @@
 #include "qom/object.h"
 
 #define TYPE_INTEL_IOMMU_DEVICE "intel-iommu"
-typedef struct IntelIOMMUState IntelIOMMUState;
-DECLARE_INSTANCE_CHECKER(IntelIOMMUState, INTEL_IOMMU_DEVICE,
-                         TYPE_INTEL_IOMMU_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(IntelIOMMUState, INTEL_IOMMU_DEVICE)
 
 #define TYPE_INTEL_IOMMU_MEMORY_REGION "intel-iommu-iommu-memory-region"
 
diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
index da3cddcc65..b1bdf648f8 100644
--- a/include/hw/ide/ahci.h
+++ b/include/hw/ide/ahci.h
@@ -51,19 +51,15 @@ typedef struct AHCIState {
     AddressSpace *as;
 } AHCIState;
 
-typedef struct AHCIPCIState AHCIPCIState;
 
 #define TYPE_ICH9_AHCI "ich9-ahci"
-DECLARE_INSTANCE_CHECKER(AHCIPCIState, ICH9_AHCI,
-                         TYPE_ICH9_AHCI)
+OBJECT_DECLARE_SIMPLE_TYPE(AHCIPCIState, ICH9_AHCI)
 
 int32_t ahci_get_num_ports(PCIDevice *dev);
 void ahci_ide_create_devs(PCIDevice *dev, DriveInfo **hd);
 
 #define TYPE_SYSBUS_AHCI "sysbus-ahci"
-typedef struct SysbusAHCIState SysbusAHCIState;
-DECLARE_INSTANCE_CHECKER(SysbusAHCIState, SYSBUS_AHCI,
-                         TYPE_SYSBUS_AHCI)
+OBJECT_DECLARE_SIMPLE_TYPE(SysbusAHCIState, SYSBUS_AHCI)
 
 struct SysbusAHCIState {
     /*< private >*/
@@ -75,9 +71,7 @@ struct SysbusAHCIState {
 };
 
 #define TYPE_ALLWINNER_AHCI "allwinner-ahci"
-typedef struct AllwinnerAHCIState AllwinnerAHCIState;
-DECLARE_INSTANCE_CHECKER(AllwinnerAHCIState, ALLWINNER_AHCI,
-                         TYPE_ALLWINNER_AHCI)
+OBJECT_DECLARE_SIMPLE_TYPE(AllwinnerAHCIState, ALLWINNER_AHCI)
 
 #define ALLWINNER_AHCI_MMIO_OFF  0x80
 #define ALLWINNER_AHCI_MMIO_SIZE 0x80
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 77c9372c27..8a95ad8c4d 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -19,15 +19,13 @@
 #define USE_DMA_CDROM
 #include "qom/object.h"
 
-typedef struct IDEBus IDEBus;
 typedef struct IDEDevice IDEDevice;
 typedef struct IDEState IDEState;
 typedef struct IDEDMA IDEDMA;
 typedef struct IDEDMAOps IDEDMAOps;
 
 #define TYPE_IDE_BUS "IDE"
-DECLARE_INSTANCE_CHECKER(IDEBus, IDE_BUS,
-                         TYPE_IDE_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(IDEBus, IDE_BUS)
 
 #define MAX_IDE_DEVS 2
 
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index b8d7270ec8..d8384e1c42 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -40,9 +40,7 @@ typedef struct BMDMAState {
 } BMDMAState;
 
 #define TYPE_PCI_IDE "pci-ide"
-typedef struct PCIIDEState PCIIDEState;
-DECLARE_INSTANCE_CHECKER(PCIIDEState, PCI_IDE,
-                         TYPE_PCI_IDE)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIIDEState, PCI_IDE)
 
 struct PCIIDEState {
     /*< private >*/
diff --git a/include/hw/input/adb.h b/include/hw/input/adb.h
index 3d1c2f4b10..20fced15f7 100644
--- a/include/hw/input/adb.h
+++ b/include/hw/input/adb.h
@@ -33,7 +33,6 @@
 
 #define ADB_MAX_OUT_LEN 16
 
-typedef struct ADBBusState ADBBusState;
 typedef struct ADBDevice ADBDevice;
 
 /* buf = NULL means polling */
@@ -65,8 +64,7 @@ struct ADBDeviceClass {
 };
 
 #define TYPE_ADB_BUS "apple-desktop-bus"
-DECLARE_INSTANCE_CHECKER(ADBBusState, ADB_BUS,
-                         TYPE_ADB_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(ADBBusState, ADB_BUS)
 
 #define ADB_STATUS_BUSTIMEOUT  0x1
 #define ADB_STATUS_POLLREPLY   0x2
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index f8a3bf88ac..1d90432dae 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -12,9 +12,7 @@
 #include "qom/object.h"
 
 #define TYPE_I8042 "i8042"
-typedef struct ISAKBDState ISAKBDState;
-DECLARE_INSTANCE_CHECKER(ISAKBDState, I8042,
-                         TYPE_I8042)
+OBJECT_DECLARE_SIMPLE_TYPE(ISAKBDState, I8042)
 
 #define I8042_A20_LINE "a20"
 
diff --git a/include/hw/intc/allwinner-a10-pic.h b/include/hw/intc/allwinner-a10-pic.h
index 4d7199480a..b8364d3ed4 100644
--- a/include/hw/intc/allwinner-a10-pic.h
+++ b/include/hw/intc/allwinner-a10-pic.h
@@ -5,9 +5,7 @@
 #include "qom/object.h"
 
 #define TYPE_AW_A10_PIC  "allwinner-a10-pic"
-typedef struct AwA10PICState AwA10PICState;
-DECLARE_INSTANCE_CHECKER(AwA10PICState, AW_A10_PIC,
-                         TYPE_AW_A10_PIC)
+OBJECT_DECLARE_SIMPLE_TYPE(AwA10PICState, AW_A10_PIC)
 
 #define AW_A10_PIC_VECTOR       0
 #define AW_A10_PIC_BASE_ADDR    4
diff --git a/include/hw/intc/aspeed_vic.h b/include/hw/intc/aspeed_vic.h
index 8f2e67db5a..68d6ab997a 100644
--- a/include/hw/intc/aspeed_vic.h
+++ b/include/hw/intc/aspeed_vic.h
@@ -17,9 +17,7 @@
 #include "qom/object.h"
 
 #define TYPE_ASPEED_VIC "aspeed.vic"
-typedef struct AspeedVICState AspeedVICState;
-DECLARE_INSTANCE_CHECKER(AspeedVICState, ASPEED_VIC,
-                         TYPE_ASPEED_VIC)
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedVICState, ASPEED_VIC)
 
 #define ASPEED_VIC_NR_IRQS 51
 
diff --git a/include/hw/intc/bcm2835_ic.h b/include/hw/intc/bcm2835_ic.h
index fd4a767845..588eb76c5c 100644
--- a/include/hw/intc/bcm2835_ic.h
+++ b/include/hw/intc/bcm2835_ic.h
@@ -12,9 +12,7 @@
 #include "qom/object.h"
 
 #define TYPE_BCM2835_IC "bcm2835-ic"
-typedef struct BCM2835ICState BCM2835ICState;
-DECLARE_INSTANCE_CHECKER(BCM2835ICState, BCM2835_IC,
-                         TYPE_BCM2835_IC)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835ICState, BCM2835_IC)
 
 #define BCM2835_IC_GPU_IRQ "gpu-irq"
 #define BCM2835_IC_ARM_IRQ "arm-irq"
diff --git a/include/hw/intc/bcm2836_control.h b/include/hw/intc/bcm2836_control.h
index f23292776e..a410c817e8 100644
--- a/include/hw/intc/bcm2836_control.h
+++ b/include/hw/intc/bcm2836_control.h
@@ -24,9 +24,7 @@
 #define BCM2836_MBPERCORE 4
 
 #define TYPE_BCM2836_CONTROL "bcm2836-control"
-typedef struct BCM2836ControlState BCM2836ControlState;
-DECLARE_INSTANCE_CHECKER(BCM2836ControlState, BCM2836_CONTROL,
-                         TYPE_BCM2836_CONTROL)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2836ControlState, BCM2836_CONTROL)
 
 struct BCM2836ControlState {
     /*< private >*/
diff --git a/include/hw/intc/heathrow_pic.h b/include/hw/intc/heathrow_pic.h
index f8c9bc20ab..c0a7f6f546 100644
--- a/include/hw/intc/heathrow_pic.h
+++ b/include/hw/intc/heathrow_pic.h
@@ -30,9 +30,7 @@
 #include "qom/object.h"
 
 #define TYPE_HEATHROW "heathrow"
-typedef struct HeathrowState HeathrowState;
-DECLARE_INSTANCE_CHECKER(HeathrowState, HEATHROW,
-                         TYPE_HEATHROW)
+OBJECT_DECLARE_SIMPLE_TYPE(HeathrowState, HEATHROW)
 
 typedef struct HeathrowPICState {
     uint32_t events;
diff --git a/include/hw/intc/ibex_plic.h b/include/hw/intc/ibex_plic.h
index 8da6b03805..37f03356b3 100644
--- a/include/hw/intc/ibex_plic.h
+++ b/include/hw/intc/ibex_plic.h
@@ -23,9 +23,7 @@
 #include "qom/object.h"
 
 #define TYPE_IBEX_PLIC "ibex-plic"
-typedef struct IbexPlicState IbexPlicState;
-DECLARE_INSTANCE_CHECKER(IbexPlicState, IBEX_PLIC,
-                         TYPE_IBEX_PLIC)
+OBJECT_DECLARE_SIMPLE_TYPE(IbexPlicState, IBEX_PLIC)
 
 struct IbexPlicState {
     /*< private >*/
diff --git a/include/hw/intc/imx_avic.h b/include/hw/intc/imx_avic.h
index 621742533c..75fbd1a89c 100644
--- a/include/hw/intc/imx_avic.h
+++ b/include/hw/intc/imx_avic.h
@@ -21,9 +21,7 @@
 #include "qom/object.h"
 
 #define TYPE_IMX_AVIC "imx.avic"
-typedef struct IMXAVICState IMXAVICState;
-DECLARE_INSTANCE_CHECKER(IMXAVICState, IMX_AVIC,
-                         TYPE_IMX_AVIC)
+OBJECT_DECLARE_SIMPLE_TYPE(IMXAVICState, IMX_AVIC)
 
 #define IMX_AVIC_NUM_IRQS 64
 
diff --git a/include/hw/intc/imx_gpcv2.h b/include/hw/intc/imx_gpcv2.h
index 2d8075e527..7bdee7e80a 100644
--- a/include/hw/intc/imx_gpcv2.h
+++ b/include/hw/intc/imx_gpcv2.h
@@ -16,10 +16,8 @@ struct IMXGPCv2State {
     MemoryRegion iomem;
     uint32_t     regs[GPC_NUM];
 };
-typedef struct IMXGPCv2State IMXGPCv2State;
 
 #define TYPE_IMX_GPCV2 "imx-gpcv2"
-DECLARE_INSTANCE_CHECKER(IMXGPCv2State, IMX_GPCV2,
-                         TYPE_IMX_GPCV2)
+OBJECT_DECLARE_SIMPLE_TYPE(IMXGPCv2State, IMX_GPCV2)
 
 #endif /* IMX_GPCV2_H */
diff --git a/include/hw/intc/mips_gic.h b/include/hw/intc/mips_gic.h
index 65aa3a9a5e..eeb136e261 100644
--- a/include/hw/intc/mips_gic.h
+++ b/include/hw/intc/mips_gic.h
@@ -171,9 +171,7 @@
 #define GIC_LOCAL_INT_WD        0 /* GIC watchdog */
 
 #define TYPE_MIPS_GIC "mips-gic"
-typedef struct MIPSGICState MIPSGICState;
-DECLARE_INSTANCE_CHECKER(MIPSGICState, MIPS_GIC,
-                         TYPE_MIPS_GIC)
+OBJECT_DECLARE_SIMPLE_TYPE(MIPSGICState, MIPS_GIC)
 
 /* Support up to 32 VPs and 256 IRQs */
 #define GIC_MAX_VPS             32
diff --git a/include/hw/intc/realview_gic.h b/include/hw/intc/realview_gic.h
index a93ace87c8..f37339dc0b 100644
--- a/include/hw/intc/realview_gic.h
+++ b/include/hw/intc/realview_gic.h
@@ -15,9 +15,7 @@
 #include "qom/object.h"
 
 #define TYPE_REALVIEW_GIC "realview_gic"
-typedef struct RealViewGICState RealViewGICState;
-DECLARE_INSTANCE_CHECKER(RealViewGICState, REALVIEW_GIC,
-                         TYPE_REALVIEW_GIC)
+OBJECT_DECLARE_SIMPLE_TYPE(RealViewGICState, REALVIEW_GIC)
 
 struct RealViewGICState {
     SysBusDevice parent_obj;
diff --git a/include/hw/intc/rx_icu.h b/include/hw/intc/rx_icu.h
index ec02df35e3..7f5889b36f 100644
--- a/include/hw/intc/rx_icu.h
+++ b/include/hw/intc/rx_icu.h
@@ -69,10 +69,8 @@ struct RXICUState {
     qemu_irq _fir;
     qemu_irq _swi;
 };
-typedef struct RXICUState RXICUState;
 
 #define TYPE_RX_ICU "rx-icu"
-DECLARE_INSTANCE_CHECKER(RXICUState, RX_ICU,
-                         TYPE_RX_ICU)
+OBJECT_DECLARE_SIMPLE_TYPE(RXICUState, RX_ICU)
 
 #endif /* RX_ICU_H */
diff --git a/include/hw/intc/xlnx-pmu-iomod-intc.h b/include/hw/intc/xlnx-pmu-iomod-intc.h
index 7a560e97af..ccc8bd272a 100644
--- a/include/hw/intc/xlnx-pmu-iomod-intc.h
+++ b/include/hw/intc/xlnx-pmu-iomod-intc.h
@@ -31,9 +31,7 @@
 
 #define TYPE_XLNX_PMU_IO_INTC "xlnx.pmu_io_intc"
 
-typedef struct XlnxPMUIOIntc XlnxPMUIOIntc;
-DECLARE_INSTANCE_CHECKER(XlnxPMUIOIntc, XLNX_PMU_IO_INTC,
-                         TYPE_XLNX_PMU_IO_INTC)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxPMUIOIntc, XLNX_PMU_IO_INTC)
 
 /* This is R_PIT3_CONTROL + 1 */
 #define XLNXPMUIOINTC_R_MAX (0x78 + 1)
diff --git a/include/hw/intc/xlnx-zynqmp-ipi.h b/include/hw/intc/xlnx-zynqmp-ipi.h
index 29c48db307..33eff1d4f6 100644
--- a/include/hw/intc/xlnx-zynqmp-ipi.h
+++ b/include/hw/intc/xlnx-zynqmp-ipi.h
@@ -31,9 +31,7 @@
 
 #define TYPE_XLNX_ZYNQMP_IPI "xlnx.zynqmp_ipi"
 
-typedef struct XlnxZynqMPIPI XlnxZynqMPIPI;
-DECLARE_INSTANCE_CHECKER(XlnxZynqMPIPI, XLNX_ZYNQMP_IPI,
-                         TYPE_XLNX_ZYNQMP_IPI)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPIPI, XLNX_ZYNQMP_IPI)
 
 /* This is R_IPI_IDR + 1 */
 #define R_XLNX_ZYNQMP_IPI_MAX ((0x1c / 4) + 1)
diff --git a/include/hw/ipack/ipack.h b/include/hw/ipack/ipack.h
index 58c611af25..75014e74ae 100644
--- a/include/hw/ipack/ipack.h
+++ b/include/hw/ipack/ipack.h
@@ -14,11 +14,9 @@
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
-typedef struct IPackBus IPackBus;
 
 #define TYPE_IPACK_BUS "IndustryPack"
-DECLARE_INSTANCE_CHECKER(IPackBus, IPACK_BUS,
-                         TYPE_IPACK_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(IPackBus, IPACK_BUS)
 
 struct IPackBus {
     /*< private >*/
diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
index 5290dab1d6..77a7213ed9 100644
--- a/include/hw/ipmi/ipmi.h
+++ b/include/hw/ipmi/ipmi.h
@@ -264,9 +264,7 @@ int ipmi_bmc_sdr_find(IPMIBmc *b, uint16_t recid,
 void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, bool log);
 
 #define TYPE_IPMI_BMC_SIMULATOR "ipmi-bmc-sim"
-typedef struct IPMIBmcSim IPMIBmcSim;
-DECLARE_INSTANCE_CHECKER(IPMIBmcSim, IPMI_BMC_SIMULATOR,
-                         TYPE_IPMI_BMC_SIMULATOR)
+OBJECT_DECLARE_SIMPLE_TYPE(IPMIBmcSim, IPMI_BMC_SIMULATOR)
 
 
 typedef struct RspBuffer {
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 5f7943fa67..ddaae89a85 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -14,8 +14,7 @@
 OBJECT_DECLARE_TYPE(ISADevice, ISADeviceClass, ISA_DEVICE)
 
 #define TYPE_ISA_BUS "ISA"
-DECLARE_INSTANCE_CHECKER(ISABus, ISA_BUS,
-                         TYPE_ISA_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(ISABus, ISA_BUS)
 
 #define TYPE_APPLE_SMC "isa-applesmc"
 #define APPLESMC_MAX_DATA_LENGTH       32
diff --git a/include/hw/isa/pc87312.h b/include/hw/isa/pc87312.h
index da8dc5ddf5..edaf723f4d 100644
--- a/include/hw/isa/pc87312.h
+++ b/include/hw/isa/pc87312.h
@@ -30,9 +30,7 @@
 
 
 #define TYPE_PC87312 "pc87312"
-typedef struct PC87312State PC87312State;
-DECLARE_INSTANCE_CHECKER(PC87312State, PC87312,
-                         TYPE_PC87312)
+OBJECT_DECLARE_SIMPLE_TYPE(PC87312State, PC87312)
 
 struct PC87312State {
     /*< private >*/
diff --git a/include/hw/m68k/mcf_fec.h b/include/hw/m68k/mcf_fec.h
index 840c5bbf53..80d4f651ba 100644
--- a/include/hw/m68k/mcf_fec.h
+++ b/include/hw/m68k/mcf_fec.h
@@ -12,9 +12,7 @@
 #include "qom/object.h"
 
 #define TYPE_MCF_FEC_NET "mcf-fec"
-typedef struct mcf_fec_state mcf_fec_state;
-DECLARE_INSTANCE_CHECKER(mcf_fec_state, MCF_FEC_NET,
-                         TYPE_MCF_FEC_NET)
+OBJECT_DECLARE_SIMPLE_TYPE(mcf_fec_state, MCF_FEC_NET)
 
 #define FEC_NUM_IRQ 13
 
diff --git a/include/hw/mips/cps.h b/include/hw/mips/cps.h
index 849e640570..9e35a88136 100644
--- a/include/hw/mips/cps.h
+++ b/include/hw/mips/cps.h
@@ -29,9 +29,7 @@
 #include "qom/object.h"
 
 #define TYPE_MIPS_CPS "mips-cps"
-typedef struct MIPSCPSState MIPSCPSState;
-DECLARE_INSTANCE_CHECKER(MIPSCPSState, MIPS_CPS,
-                         TYPE_MIPS_CPS)
+OBJECT_DECLARE_SIMPLE_TYPE(MIPSCPSState, MIPS_CPS)
 
 struct MIPSCPSState {
     SysBusDevice parent_obj;
diff --git a/include/hw/misc/a9scu.h b/include/hw/misc/a9scu.h
index fd1b92e923..c3759fb8c8 100644
--- a/include/hw/misc/a9scu.h
+++ b/include/hw/misc/a9scu.h
@@ -25,10 +25,8 @@ struct A9SCUState {
     uint32_t status;
     uint32_t num_cpu;
 };
-typedef struct A9SCUState A9SCUState;
 
 #define TYPE_A9_SCU "a9-scu"
-DECLARE_INSTANCE_CHECKER(A9SCUState, A9_SCU,
-                         TYPE_A9_SCU)
+OBJECT_DECLARE_SIMPLE_TYPE(A9SCUState, A9_SCU)
 
 #endif
diff --git a/include/hw/misc/allwinner-cpucfg.h b/include/hw/misc/allwinner-cpucfg.h
index 058514de15..a717b47299 100644
--- a/include/hw/misc/allwinner-cpucfg.h
+++ b/include/hw/misc/allwinner-cpucfg.h
@@ -29,9 +29,7 @@
  */
 
 #define TYPE_AW_CPUCFG   "allwinner-cpucfg"
-typedef struct AwCpuCfgState AwCpuCfgState;
-DECLARE_INSTANCE_CHECKER(AwCpuCfgState, AW_CPUCFG,
-                         TYPE_AW_CPUCFG)
+OBJECT_DECLARE_SIMPLE_TYPE(AwCpuCfgState, AW_CPUCFG)
 
 /** @} */
 
diff --git a/include/hw/misc/allwinner-h3-ccu.h b/include/hw/misc/allwinner-h3-ccu.h
index 05f5c7bd8e..a04875bfca 100644
--- a/include/hw/misc/allwinner-h3-ccu.h
+++ b/include/hw/misc/allwinner-h3-ccu.h
@@ -42,9 +42,7 @@
  */
 
 #define TYPE_AW_H3_CCU    "allwinner-h3-ccu"
-typedef struct AwH3ClockCtlState AwH3ClockCtlState;
-DECLARE_INSTANCE_CHECKER(AwH3ClockCtlState, AW_H3_CCU,
-                         TYPE_AW_H3_CCU)
+OBJECT_DECLARE_SIMPLE_TYPE(AwH3ClockCtlState, AW_H3_CCU)
 
 /** @} */
 
diff --git a/include/hw/misc/allwinner-h3-dramc.h b/include/hw/misc/allwinner-h3-dramc.h
index 60a13a6958..0b6c877ef7 100644
--- a/include/hw/misc/allwinner-h3-dramc.h
+++ b/include/hw/misc/allwinner-h3-dramc.h
@@ -58,9 +58,7 @@
  */
 
 #define TYPE_AW_H3_DRAMC "allwinner-h3-dramc"
-typedef struct AwH3DramCtlState AwH3DramCtlState;
-DECLARE_INSTANCE_CHECKER(AwH3DramCtlState, AW_H3_DRAMC,
-                         TYPE_AW_H3_DRAMC)
+OBJECT_DECLARE_SIMPLE_TYPE(AwH3DramCtlState, AW_H3_DRAMC)
 
 /** @} */
 
diff --git a/include/hw/misc/allwinner-h3-sysctrl.h b/include/hw/misc/allwinner-h3-sysctrl.h
index 50baa8eb07..ec1c220535 100644
--- a/include/hw/misc/allwinner-h3-sysctrl.h
+++ b/include/hw/misc/allwinner-h3-sysctrl.h
@@ -43,9 +43,7 @@
  */
 
 #define TYPE_AW_H3_SYSCTRL    "allwinner-h3-sysctrl"
-typedef struct AwH3SysCtrlState AwH3SysCtrlState;
-DECLARE_INSTANCE_CHECKER(AwH3SysCtrlState, AW_H3_SYSCTRL,
-                         TYPE_AW_H3_SYSCTRL)
+OBJECT_DECLARE_SIMPLE_TYPE(AwH3SysCtrlState, AW_H3_SYSCTRL)
 
 /** @} */
 
diff --git a/include/hw/misc/allwinner-sid.h b/include/hw/misc/allwinner-sid.h
index b8e83bb7ce..3bfa887a96 100644
--- a/include/hw/misc/allwinner-sid.h
+++ b/include/hw/misc/allwinner-sid.h
@@ -30,9 +30,7 @@
  */
 
 #define TYPE_AW_SID    "allwinner-sid"
-typedef struct AwSidState AwSidState;
-DECLARE_INSTANCE_CHECKER(AwSidState, AW_SID,
-                         TYPE_AW_SID)
+OBJECT_DECLARE_SIMPLE_TYPE(AwSidState, AW_SID)
 
 /** @} */
 
diff --git a/include/hw/misc/arm11scu.h b/include/hw/misc/arm11scu.h
index 71b4bc9a22..e5c0282aec 100644
--- a/include/hw/misc/arm11scu.h
+++ b/include/hw/misc/arm11scu.h
@@ -15,9 +15,7 @@
 #include "qom/object.h"
 
 #define TYPE_ARM11_SCU "arm11-scu"
-typedef struct ARM11SCUState ARM11SCUState;
-DECLARE_INSTANCE_CHECKER(ARM11SCUState, ARM11_SCU,
-                         TYPE_ARM11_SCU)
+OBJECT_DECLARE_SIMPLE_TYPE(ARM11SCUState, ARM11_SCU)
 
 struct ARM11SCUState {
     /*< private >*/
diff --git a/include/hw/misc/armsse-cpuid.h b/include/hw/misc/armsse-cpuid.h
index 80691c7180..a61355e516 100644
--- a/include/hw/misc/armsse-cpuid.h
+++ b/include/hw/misc/armsse-cpuid.h
@@ -26,9 +26,7 @@
 #include "qom/object.h"
 
 #define TYPE_ARMSSE_CPUID "armsse-cpuid"
-typedef struct ARMSSECPUID ARMSSECPUID;
-DECLARE_INSTANCE_CHECKER(ARMSSECPUID, ARMSSE_CPUID,
-                         TYPE_ARMSSE_CPUID)
+OBJECT_DECLARE_SIMPLE_TYPE(ARMSSECPUID, ARMSSE_CPUID)
 
 struct ARMSSECPUID {
     /*< private >*/
diff --git a/include/hw/misc/armsse-mhu.h b/include/hw/misc/armsse-mhu.h
index 310643a022..2671b5b978 100644
--- a/include/hw/misc/armsse-mhu.h
+++ b/include/hw/misc/armsse-mhu.h
@@ -27,9 +27,7 @@
 #include "qom/object.h"
 
 #define TYPE_ARMSSE_MHU "armsse-mhu"
-typedef struct ARMSSEMHU ARMSSEMHU;
-DECLARE_INSTANCE_CHECKER(ARMSSEMHU, ARMSSE_MHU,
-                         TYPE_ARMSSE_MHU)
+OBJECT_DECLARE_SIMPLE_TYPE(ARMSSEMHU, ARMSSE_MHU)
 
 struct ARMSSEMHU {
     /*< private >*/
diff --git a/include/hw/misc/aspeed_xdma.h b/include/hw/misc/aspeed_xdma.h
index 0e62c04520..9869ef4728 100644
--- a/include/hw/misc/aspeed_xdma.h
+++ b/include/hw/misc/aspeed_xdma.h
@@ -13,9 +13,7 @@
 #include "qom/object.h"
 
 #define TYPE_ASPEED_XDMA "aspeed.xdma"
-typedef struct AspeedXDMAState AspeedXDMAState;
-DECLARE_INSTANCE_CHECKER(AspeedXDMAState, ASPEED_XDMA,
-                         TYPE_ASPEED_XDMA)
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedXDMAState, ASPEED_XDMA)
 
 #define ASPEED_XDMA_NUM_REGS (ASPEED_XDMA_REG_SIZE / sizeof(uint32_t))
 #define ASPEED_XDMA_REG_SIZE 0x7C
diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
index f910d94118..b05799d2f7 100644
--- a/include/hw/misc/auxbus.h
+++ b/include/hw/misc/auxbus.h
@@ -29,15 +29,12 @@
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
-typedef struct AUXBus AUXBus;
 typedef struct AUXSlave AUXSlave;
 typedef enum AUXCommand AUXCommand;
 typedef enum AUXReply AUXReply;
 
 #define TYPE_AUXTOI2C "aux-to-i2c-bridge"
-typedef struct AUXTOI2CState AUXTOI2CState;
-DECLARE_INSTANCE_CHECKER(AUXTOI2CState, AUXTOI2C,
-                         TYPE_AUXTOI2C)
+OBJECT_DECLARE_SIMPLE_TYPE(AUXTOI2CState, AUXTOI2C)
 
 enum AUXCommand {
     WRITE_I2C = 0,
@@ -58,8 +55,7 @@ enum AUXReply {
 };
 
 #define TYPE_AUX_BUS "aux-bus"
-DECLARE_INSTANCE_CHECKER(AUXBus, AUX_BUS,
-                         TYPE_AUX_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(AUXBus, AUX_BUS)
 
 struct AUXBus {
     /* < private > */
@@ -78,8 +74,7 @@ struct AUXBus {
 };
 
 #define TYPE_AUX_SLAVE "aux-slave"
-DECLARE_INSTANCE_CHECKER(AUXSlave, AUX_SLAVE,
-                         TYPE_AUX_SLAVE)
+OBJECT_DECLARE_SIMPLE_TYPE(AUXSlave, AUX_SLAVE)
 
 struct AUXSlave {
     /* < private > */
diff --git a/include/hw/misc/avr_power.h b/include/hw/misc/avr_power.h
index 938ab3e21b..707df030b1 100644
--- a/include/hw/misc/avr_power.h
+++ b/include/hw/misc/avr_power.h
@@ -31,9 +31,7 @@
 
 
 #define TYPE_AVR_MASK "avr-power"
-typedef struct AVRMaskState AVRMaskState;
-DECLARE_INSTANCE_CHECKER(AVRMaskState, AVR_MASK,
-                         TYPE_AVR_MASK)
+OBJECT_DECLARE_SIMPLE_TYPE(AVRMaskState, AVR_MASK)
 
 struct AVRMaskState {
     /* <private> */
diff --git a/include/hw/misc/bcm2835_mbox.h b/include/hw/misc/bcm2835_mbox.h
index d8c8017f4e..ade27af25d 100644
--- a/include/hw/misc/bcm2835_mbox.h
+++ b/include/hw/misc/bcm2835_mbox.h
@@ -13,9 +13,7 @@
 #include "qom/object.h"
 
 #define TYPE_BCM2835_MBOX "bcm2835-mbox"
-typedef struct BCM2835MboxState BCM2835MboxState;
-DECLARE_INSTANCE_CHECKER(BCM2835MboxState, BCM2835_MBOX,
-                         TYPE_BCM2835_MBOX)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835MboxState, BCM2835_MBOX)
 
 typedef struct {
     uint32_t reg[MBOX_SIZE];
diff --git a/include/hw/misc/bcm2835_mphi.h b/include/hw/misc/bcm2835_mphi.h
index 249511182e..751363f496 100644
--- a/include/hw/misc/bcm2835_mphi.h
+++ b/include/hw/misc/bcm2835_mphi.h
@@ -39,7 +39,6 @@ struct BCM2835MphiState {
 
 #define TYPE_BCM2835_MPHI   "bcm2835-mphi"
 
-DECLARE_INSTANCE_CHECKER(BCM2835MphiState, BCM2835_MPHI,
-                         TYPE_BCM2835_MPHI)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835MphiState, BCM2835_MPHI)
 
 #endif
diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_property.h
index 5c827a1900..712b76b7a3 100644
--- a/include/hw/misc/bcm2835_property.h
+++ b/include/hw/misc/bcm2835_property.h
@@ -14,9 +14,7 @@
 #include "qom/object.h"
 
 #define TYPE_BCM2835_PROPERTY "bcm2835-property"
-typedef struct BCM2835PropertyState BCM2835PropertyState;
-DECLARE_INSTANCE_CHECKER(BCM2835PropertyState, BCM2835_PROPERTY,
-                         TYPE_BCM2835_PROPERTY)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835PropertyState, BCM2835_PROPERTY)
 
 struct BCM2835PropertyState {
     /*< private >*/
diff --git a/include/hw/misc/bcm2835_rng.h b/include/hw/misc/bcm2835_rng.h
index fec76eef8e..7c1fb3ef40 100644
--- a/include/hw/misc/bcm2835_rng.h
+++ b/include/hw/misc/bcm2835_rng.h
@@ -14,9 +14,7 @@
 #include "qom/object.h"
 
 #define TYPE_BCM2835_RNG "bcm2835-rng"
-typedef struct BCM2835RngState BCM2835RngState;
-DECLARE_INSTANCE_CHECKER(BCM2835RngState, BCM2835_RNG,
-                         TYPE_BCM2835_RNG)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835RngState, BCM2835_RNG)
 
 struct BCM2835RngState {
     SysBusDevice busdev;
diff --git a/include/hw/misc/bcm2835_thermal.h b/include/hw/misc/bcm2835_thermal.h
index 5b827c970e..f90f9e487c 100644
--- a/include/hw/misc/bcm2835_thermal.h
+++ b/include/hw/misc/bcm2835_thermal.h
@@ -14,9 +14,7 @@
 
 #define TYPE_BCM2835_THERMAL "bcm2835-thermal"
 
-typedef struct Bcm2835ThermalState Bcm2835ThermalState;
-DECLARE_INSTANCE_CHECKER(Bcm2835ThermalState, BCM2835_THERMAL,
-                         TYPE_BCM2835_THERMAL)
+OBJECT_DECLARE_SIMPLE_TYPE(Bcm2835ThermalState, BCM2835_THERMAL)
 
 struct Bcm2835ThermalState {
     /*< private >*/
diff --git a/include/hw/misc/grlib_ahb_apb_pnp.h b/include/hw/misc/grlib_ahb_apb_pnp.h
index 34b18e3193..341451bff6 100644
--- a/include/hw/misc/grlib_ahb_apb_pnp.h
+++ b/include/hw/misc/grlib_ahb_apb_pnp.h
@@ -26,14 +26,10 @@
 #include "qom/object.h"
 
 #define TYPE_GRLIB_AHB_PNP "grlib,ahbpnp"
-typedef struct AHBPnp AHBPnp;
-DECLARE_INSTANCE_CHECKER(AHBPnp, GRLIB_AHB_PNP,
-                         TYPE_GRLIB_AHB_PNP)
+OBJECT_DECLARE_SIMPLE_TYPE(AHBPnp, GRLIB_AHB_PNP)
 
 #define TYPE_GRLIB_APB_PNP "grlib,apbpnp"
-typedef struct APBPnp APBPnp;
-DECLARE_INSTANCE_CHECKER(APBPnp, GRLIB_APB_PNP,
-                         TYPE_GRLIB_APB_PNP)
+OBJECT_DECLARE_SIMPLE_TYPE(APBPnp, GRLIB_APB_PNP)
 
 void grlib_ahb_pnp_add_entry(AHBPnp *dev, uint32_t address, uint32_t mask,
                              uint8_t vendor, uint16_t device, int slave,
diff --git a/include/hw/misc/imx25_ccm.h b/include/hw/misc/imx25_ccm.h
index 55c5db8815..c3b89018c6 100644
--- a/include/hw/misc/imx25_ccm.h
+++ b/include/hw/misc/imx25_ccm.h
@@ -64,9 +64,7 @@
                              CCTL_##name##_SHIFT)
 
 #define TYPE_IMX25_CCM "imx25.ccm"
-typedef struct IMX25CCMState IMX25CCMState;
-DECLARE_INSTANCE_CHECKER(IMX25CCMState, IMX25_CCM,
-                         TYPE_IMX25_CCM)
+OBJECT_DECLARE_SIMPLE_TYPE(IMX25CCMState, IMX25_CCM)
 
 struct IMX25CCMState {
     /* <private> */
diff --git a/include/hw/misc/imx31_ccm.h b/include/hw/misc/imx31_ccm.h
index 25e280e976..18e08ee84f 100644
--- a/include/hw/misc/imx31_ccm.h
+++ b/include/hw/misc/imx31_ccm.h
@@ -73,9 +73,7 @@
                              PDR0_##name##_PODF_SHIFT)
 
 #define TYPE_IMX31_CCM "imx31.ccm"
-typedef struct IMX31CCMState IMX31CCMState;
-DECLARE_INSTANCE_CHECKER(IMX31CCMState, IMX31_CCM,
-                         TYPE_IMX31_CCM)
+OBJECT_DECLARE_SIMPLE_TYPE(IMX31CCMState, IMX31_CCM)
 
 struct IMX31CCMState {
     /* <private> */
diff --git a/include/hw/misc/imx6_ccm.h b/include/hw/misc/imx6_ccm.h
index 85f32417d6..ccf46d7353 100644
--- a/include/hw/misc/imx6_ccm.h
+++ b/include/hw/misc/imx6_ccm.h
@@ -179,9 +179,7 @@
 #define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)
 
 #define TYPE_IMX6_CCM "imx6.ccm"
-typedef struct IMX6CCMState IMX6CCMState;
-DECLARE_INSTANCE_CHECKER(IMX6CCMState, IMX6_CCM,
-                         TYPE_IMX6_CCM)
+OBJECT_DECLARE_SIMPLE_TYPE(IMX6CCMState, IMX6_CCM)
 
 struct IMX6CCMState {
     /* <private> */
diff --git a/include/hw/misc/imx6_src.h b/include/hw/misc/imx6_src.h
index 15b51757ba..f380da3810 100644
--- a/include/hw/misc/imx6_src.h
+++ b/include/hw/misc/imx6_src.h
@@ -58,9 +58,7 @@
 #define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)
 
 #define TYPE_IMX6_SRC "imx6.src"
-typedef struct IMX6SRCState IMX6SRCState;
-DECLARE_INSTANCE_CHECKER(IMX6SRCState, IMX6_SRC,
-                         TYPE_IMX6_SRC)
+OBJECT_DECLARE_SIMPLE_TYPE(IMX6SRCState, IMX6_SRC)
 
 struct IMX6SRCState {
     /* <private> */
diff --git a/include/hw/misc/imx6ul_ccm.h b/include/hw/misc/imx6ul_ccm.h
index d614de0edd..edb5f784d5 100644
--- a/include/hw/misc/imx6ul_ccm.h
+++ b/include/hw/misc/imx6ul_ccm.h
@@ -208,9 +208,7 @@
 #define CCM_ANALOG_PLL_LOCK      (1 << 31);
 
 #define TYPE_IMX6UL_CCM "imx6ul.ccm"
-typedef struct IMX6ULCCMState IMX6ULCCMState;
-DECLARE_INSTANCE_CHECKER(IMX6ULCCMState, IMX6UL_CCM,
-                         TYPE_IMX6UL_CCM)
+OBJECT_DECLARE_SIMPLE_TYPE(IMX6ULCCMState, IMX6UL_CCM)
 
 struct IMX6ULCCMState {
     /* <private> */
diff --git a/include/hw/misc/imx7_ccm.h b/include/hw/misc/imx7_ccm.h
index e2757622d0..dcaebfb4ef 100644
--- a/include/hw/misc/imx7_ccm.h
+++ b/include/hw/misc/imx7_ccm.h
@@ -105,9 +105,7 @@ enum IMX7PMURegisters {
 };
 
 #define TYPE_IMX7_CCM "imx7.ccm"
-typedef struct IMX7CCMState IMX7CCMState;
-DECLARE_INSTANCE_CHECKER(IMX7CCMState, IMX7_CCM,
-                         TYPE_IMX7_CCM)
+OBJECT_DECLARE_SIMPLE_TYPE(IMX7CCMState, IMX7_CCM)
 
 struct IMX7CCMState {
     /* <private> */
@@ -121,9 +119,7 @@ struct IMX7CCMState {
 
 
 #define TYPE_IMX7_ANALOG "imx7.analog"
-typedef struct IMX7AnalogState IMX7AnalogState;
-DECLARE_INSTANCE_CHECKER(IMX7AnalogState, IMX7_ANALOG,
-                         TYPE_IMX7_ANALOG)
+OBJECT_DECLARE_SIMPLE_TYPE(IMX7AnalogState, IMX7_ANALOG)
 
 struct IMX7AnalogState {
     /* <private> */
diff --git a/include/hw/misc/imx7_gpr.h b/include/hw/misc/imx7_gpr.h
index f80b3ed28c..df364bd8f0 100644
--- a/include/hw/misc/imx7_gpr.h
+++ b/include/hw/misc/imx7_gpr.h
@@ -17,9 +17,7 @@
 #include "qom/object.h"
 
 #define TYPE_IMX7_GPR "imx7.gpr"
-typedef struct IMX7GPRState IMX7GPRState;
-DECLARE_INSTANCE_CHECKER(IMX7GPRState, IMX7_GPR,
-                         TYPE_IMX7_GPR)
+OBJECT_DECLARE_SIMPLE_TYPE(IMX7GPRState, IMX7_GPR)
 
 struct IMX7GPRState {
     /* <private> */
diff --git a/include/hw/misc/imx7_snvs.h b/include/hw/misc/imx7_snvs.h
index ea5395c107..14a1d6fe6b 100644
--- a/include/hw/misc/imx7_snvs.h
+++ b/include/hw/misc/imx7_snvs.h
@@ -24,9 +24,7 @@ enum IMX7SNVSRegisters {
 };
 
 #define TYPE_IMX7_SNVS "imx7.snvs"
-typedef struct IMX7SNVSState IMX7SNVSState;
-DECLARE_INSTANCE_CHECKER(IMX7SNVSState, IMX7_SNVS,
-                         TYPE_IMX7_SNVS)
+OBJECT_DECLARE_SIMPLE_TYPE(IMX7SNVSState, IMX7_SNVS)
 
 struct IMX7SNVSState {
     /* <private> */
diff --git a/include/hw/misc/imx_rngc.h b/include/hw/misc/imx_rngc.h
index f7b569cac5..34ad699225 100644
--- a/include/hw/misc/imx_rngc.h
+++ b/include/hw/misc/imx_rngc.h
@@ -14,9 +14,7 @@
 #include "qom/object.h"
 
 #define TYPE_IMX_RNGC "imx.rngc"
-typedef struct IMXRNGCState IMXRNGCState;
-DECLARE_INSTANCE_CHECKER(IMXRNGCState, IMX_RNGC,
-                         TYPE_IMX_RNGC)
+OBJECT_DECLARE_SIMPLE_TYPE(IMXRNGCState, IMX_RNGC)
 
 struct IMXRNGCState {
     /*< private >*/
diff --git a/include/hw/misc/iotkit-secctl.h b/include/hw/misc/iotkit-secctl.h
index d062ed43e7..54c212b515 100644
--- a/include/hw/misc/iotkit-secctl.h
+++ b/include/hw/misc/iotkit-secctl.h
@@ -59,9 +59,7 @@
 #include "qom/object.h"
 
 #define TYPE_IOTKIT_SECCTL "iotkit-secctl"
-typedef struct IoTKitSecCtl IoTKitSecCtl;
-DECLARE_INSTANCE_CHECKER(IoTKitSecCtl, IOTKIT_SECCTL,
-                         TYPE_IOTKIT_SECCTL)
+OBJECT_DECLARE_SIMPLE_TYPE(IoTKitSecCtl, IOTKIT_SECCTL)
 
 #define IOTS_APB_PPC0_NUM_PORTS 3
 #define IOTS_APB_PPC1_NUM_PORTS 1
diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
index 22ceb5d76d..2b5636b218 100644
--- a/include/hw/misc/iotkit-sysctl.h
+++ b/include/hw/misc/iotkit-sysctl.h
@@ -31,9 +31,7 @@
 #include "qom/object.h"
 
 #define TYPE_IOTKIT_SYSCTL "iotkit-sysctl"
-typedef struct IoTKitSysCtl IoTKitSysCtl;
-DECLARE_INSTANCE_CHECKER(IoTKitSysCtl, IOTKIT_SYSCTL,
-                         TYPE_IOTKIT_SYSCTL)
+OBJECT_DECLARE_SIMPLE_TYPE(IoTKitSysCtl, IOTKIT_SYSCTL)
 
 struct IoTKitSysCtl {
     /*< private >*/
diff --git a/include/hw/misc/iotkit-sysinfo.h b/include/hw/misc/iotkit-sysinfo.h
index 23ae43e549..7e620e2eaf 100644
--- a/include/hw/misc/iotkit-sysinfo.h
+++ b/include/hw/misc/iotkit-sysinfo.h
@@ -26,9 +26,7 @@
 #include "qom/object.h"
 
 #define TYPE_IOTKIT_SYSINFO "iotkit-sysinfo"
-typedef struct IoTKitSysInfo IoTKitSysInfo;
-DECLARE_INSTANCE_CHECKER(IoTKitSysInfo, IOTKIT_SYSINFO,
-                         TYPE_IOTKIT_SYSINFO)
+OBJECT_DECLARE_SIMPLE_TYPE(IoTKitSysInfo, IOTKIT_SYSINFO)
 
 struct IoTKitSysInfo {
     /*< private >*/
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 862cbba3ab..a59f0bd422 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -32,9 +32,7 @@
 
 
 #define TYPE_MOS6522_Q800_VIA1 "mos6522-q800-via1"
-typedef struct MOS6522Q800VIA1State MOS6522Q800VIA1State;
-DECLARE_INSTANCE_CHECKER(MOS6522Q800VIA1State, MOS6522_Q800_VIA1,
-                         TYPE_MOS6522_Q800_VIA1)
+OBJECT_DECLARE_SIMPLE_TYPE(MOS6522Q800VIA1State, MOS6522_Q800_VIA1)
 
 struct MOS6522Q800VIA1State {
     /*< private >*/
@@ -68,9 +66,7 @@ struct MOS6522Q800VIA1State {
 #define VIA2_IRQ_ASC        (1 << VIA2_IRQ_ASC_BIT)
 
 #define TYPE_MOS6522_Q800_VIA2 "mos6522-q800-via2"
-typedef struct MOS6522Q800VIA2State MOS6522Q800VIA2State;
-DECLARE_INSTANCE_CHECKER(MOS6522Q800VIA2State, MOS6522_Q800_VIA2,
-                         TYPE_MOS6522_Q800_VIA2)
+OBJECT_DECLARE_SIMPLE_TYPE(MOS6522Q800VIA2State, MOS6522_Q800_VIA2)
 
 struct MOS6522Q800VIA2State {
     /*< private >*/
@@ -79,9 +75,7 @@ struct MOS6522Q800VIA2State {
 
 
 #define TYPE_MAC_VIA "mac_via"
-typedef struct MacVIAState MacVIAState;
-DECLARE_INSTANCE_CHECKER(MacVIAState, MAC_VIA,
-                         TYPE_MAC_VIA)
+OBJECT_DECLARE_SIMPLE_TYPE(MacVIAState, MAC_VIA)
 
 struct MacVIAState {
     SysBusDevice busdev;
diff --git a/include/hw/misc/macio/cuda.h b/include/hw/misc/macio/cuda.h
index e738b6376f..a71deec968 100644
--- a/include/hw/misc/macio/cuda.h
+++ b/include/hw/misc/macio/cuda.h
@@ -63,17 +63,13 @@ struct MOS6522CUDAState {
     /*< private >*/
     MOS6522State parent_obj;
 };
-typedef struct MOS6522CUDAState MOS6522CUDAState;
 
 #define TYPE_MOS6522_CUDA "mos6522-cuda"
-DECLARE_INSTANCE_CHECKER(MOS6522CUDAState, MOS6522_CUDA,
-                         TYPE_MOS6522_CUDA)
+OBJECT_DECLARE_SIMPLE_TYPE(MOS6522CUDAState, MOS6522_CUDA)
 
 /* Cuda */
 #define TYPE_CUDA "cuda"
-typedef struct CUDAState CUDAState;
-DECLARE_INSTANCE_CHECKER(CUDAState, CUDA,
-                         TYPE_CUDA)
+OBJECT_DECLARE_SIMPLE_TYPE(CUDAState, CUDA)
 
 struct CUDAState {
     /*< private >*/
diff --git a/include/hw/misc/macio/gpio.h b/include/hw/misc/macio/gpio.h
index 1d0c8434ae..4dee09a9dd 100644
--- a/include/hw/misc/macio/gpio.h
+++ b/include/hw/misc/macio/gpio.h
@@ -31,9 +31,7 @@
 #include "qom/object.h"
 
 #define TYPE_MACIO_GPIO "macio-gpio"
-typedef struct MacIOGPIOState MacIOGPIOState;
-DECLARE_INSTANCE_CHECKER(MacIOGPIOState, MACIO_GPIO,
-                         TYPE_MACIO_GPIO)
+OBJECT_DECLARE_SIMPLE_TYPE(MacIOGPIOState, MACIO_GPIO)
 
 struct MacIOGPIOState {
     /*< private >*/
diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
index 02dbf37630..22b4e64b2c 100644
--- a/include/hw/misc/macio/macio.h
+++ b/include/hw/misc/macio/macio.h
@@ -40,9 +40,7 @@
 
 /* MacIO virtual bus */
 #define TYPE_MACIO_BUS "macio-bus"
-typedef struct MacIOBusState MacIOBusState;
-DECLARE_INSTANCE_CHECKER(MacIOBusState, MACIO_BUS,
-                         TYPE_MACIO_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(MacIOBusState, MACIO_BUS)
 
 struct MacIOBusState {
     /*< private >*/
@@ -51,9 +49,7 @@ struct MacIOBusState {
 
 /* MacIO IDE */
 #define TYPE_MACIO_IDE "macio-ide"
-typedef struct MACIOIDEState MACIOIDEState;
-DECLARE_INSTANCE_CHECKER(MACIOIDEState, MACIO_IDE,
-                         TYPE_MACIO_IDE)
+OBJECT_DECLARE_SIMPLE_TYPE(MACIOIDEState, MACIO_IDE)
 
 struct MACIOIDEState {
     /*< private >*/
@@ -79,9 +75,7 @@ void macio_ide_init_drives(MACIOIDEState *ide, DriveInfo **hd_table);
 void macio_ide_register_dma(MACIOIDEState *ide);
 
 #define TYPE_MACIO "macio"
-typedef struct MacIOState MacIOState;
-DECLARE_INSTANCE_CHECKER(MacIOState, MACIO,
-                         TYPE_MACIO)
+OBJECT_DECLARE_SIMPLE_TYPE(MacIOState, MACIO)
 
 struct MacIOState {
     /*< private >*/
@@ -98,9 +92,7 @@ struct MacIOState {
 };
 
 #define TYPE_OLDWORLD_MACIO "macio-oldworld"
-typedef struct OldWorldMacIOState OldWorldMacIOState;
-DECLARE_INSTANCE_CHECKER(OldWorldMacIOState, OLDWORLD_MACIO,
-                         TYPE_OLDWORLD_MACIO)
+OBJECT_DECLARE_SIMPLE_TYPE(OldWorldMacIOState, OLDWORLD_MACIO)
 
 struct OldWorldMacIOState {
     /*< private >*/
@@ -114,9 +106,7 @@ struct OldWorldMacIOState {
 };
 
 #define TYPE_NEWWORLD_MACIO "macio-newworld"
-typedef struct NewWorldMacIOState NewWorldMacIOState;
-DECLARE_INSTANCE_CHECKER(NewWorldMacIOState, NEWWORLD_MACIO,
-                         TYPE_NEWWORLD_MACIO)
+OBJECT_DECLARE_SIMPLE_TYPE(NewWorldMacIOState, NEWWORLD_MACIO)
 
 struct NewWorldMacIOState {
     /*< private >*/
diff --git a/include/hw/misc/macio/pmu.h b/include/hw/misc/macio/pmu.h
index 0d1a5c1406..78237d99a2 100644
--- a/include/hw/misc/macio/pmu.h
+++ b/include/hw/misc/macio/pmu.h
@@ -178,11 +178,9 @@ struct MOS6522PMUState {
     /*< private >*/
     MOS6522State parent_obj;
 };
-typedef struct MOS6522PMUState MOS6522PMUState;
 
 #define TYPE_MOS6522_PMU "mos6522-pmu"
-DECLARE_INSTANCE_CHECKER(MOS6522PMUState, MOS6522_PMU,
-                         TYPE_MOS6522_PMU)
+OBJECT_DECLARE_SIMPLE_TYPE(MOS6522PMUState, MOS6522_PMU)
 /**
  * PMUState:
  * @last_b: last value of B register
@@ -231,10 +229,8 @@ struct PMUState {
     /* GPIO */
     MacIOGPIOState *gpio;
 };
-typedef struct PMUState PMUState;
 
 #define TYPE_VIA_PMU "via-pmu"
-DECLARE_INSTANCE_CHECKER(PMUState, VIA_PMU,
-                         TYPE_VIA_PMU)
+OBJECT_DECLARE_SIMPLE_TYPE(PMUState, VIA_PMU)
 
 #endif /* PMU_H */
diff --git a/include/hw/misc/max111x.h b/include/hw/misc/max111x.h
index 6350a3f7c0..606cf1e0a2 100644
--- a/include/hw/misc/max111x.h
+++ b/include/hw/misc/max111x.h
@@ -45,12 +45,10 @@ struct MAX111xState {
     uint8_t input[8];
     int inputs, com;
 };
-typedef struct MAX111xState MAX111xState;
 
 #define TYPE_MAX_111X "max111x"
 
-DECLARE_INSTANCE_CHECKER(MAX111xState, MAX_111X,
-                         TYPE_MAX_111X)
+OBJECT_DECLARE_SIMPLE_TYPE(MAX111xState, MAX_111X)
 
 #define TYPE_MAX_1110 "max1110"
 #define TYPE_MAX_1111 "max1111"
diff --git a/include/hw/misc/mips_cmgcr.h b/include/hw/misc/mips_cmgcr.h
index 923df4f112..9fa58942d7 100644
--- a/include/hw/misc/mips_cmgcr.h
+++ b/include/hw/misc/mips_cmgcr.h
@@ -14,9 +14,7 @@
 #include "qom/object.h"
 
 #define TYPE_MIPS_GCR "mips-gcr"
-typedef struct MIPSGCRState MIPSGCRState;
-DECLARE_INSTANCE_CHECKER(MIPSGCRState, MIPS_GCR,
-                         TYPE_MIPS_GCR)
+OBJECT_DECLARE_SIMPLE_TYPE(MIPSGCRState, MIPS_GCR)
 
 #define GCR_BASE_ADDR           0x1fbf8000ULL
 #define GCR_ADDRSPACE_SZ        0x8000
diff --git a/include/hw/misc/mips_cpc.h b/include/hw/misc/mips_cpc.h
index 7dc188e8a2..e5dccea151 100644
--- a/include/hw/misc/mips_cpc.h
+++ b/include/hw/misc/mips_cpc.h
@@ -35,9 +35,7 @@
 #define CPC_VP_RUNNING_OFS  0x30
 
 #define TYPE_MIPS_CPC "mips-cpc"
-typedef struct MIPSCPCState MIPSCPCState;
-DECLARE_INSTANCE_CHECKER(MIPSCPCState, MIPS_CPC,
-                         TYPE_MIPS_CPC)
+OBJECT_DECLARE_SIMPLE_TYPE(MIPSCPCState, MIPS_CPC)
 
 struct MIPSCPCState {
     SysBusDevice parent_obj;
diff --git a/include/hw/misc/mips_itu.h b/include/hw/misc/mips_itu.h
index 7c19f61fbb..96347dbf65 100644
--- a/include/hw/misc/mips_itu.h
+++ b/include/hw/misc/mips_itu.h
@@ -24,9 +24,7 @@
 #include "qom/object.h"
 
 #define TYPE_MIPS_ITU "mips-itu"
-typedef struct MIPSITUState MIPSITUState;
-DECLARE_INSTANCE_CHECKER(MIPSITUState, MIPS_ITU,
-                         TYPE_MIPS_ITU)
+OBJECT_DECLARE_SIMPLE_TYPE(MIPSITUState, MIPS_ITU)
 
 #define ITC_CELL_DEPTH_SHIFT 2
 #define ITC_CELL_DEPTH (1u << ITC_CELL_DEPTH_SHIFT)
diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index 991f5b731e..80f9227aa6 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -25,9 +25,7 @@
 #include "qom/object.h"
 
 #define TYPE_MPS2_FPGAIO "mps2-fpgaio"
-typedef struct MPS2FPGAIO MPS2FPGAIO;
-DECLARE_INSTANCE_CHECKER(MPS2FPGAIO, MPS2_FPGAIO,
-                         TYPE_MPS2_FPGAIO)
+OBJECT_DECLARE_SIMPLE_TYPE(MPS2FPGAIO, MPS2_FPGAIO)
 
 struct MPS2FPGAIO {
     /*< private >*/
diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
index 445e268b1f..e922b3c8e0 100644
--- a/include/hw/misc/mps2-scc.h
+++ b/include/hw/misc/mps2-scc.h
@@ -16,9 +16,7 @@
 #include "qom/object.h"
 
 #define TYPE_MPS2_SCC "mps2-scc"
-typedef struct MPS2SCC MPS2SCC;
-DECLARE_INSTANCE_CHECKER(MPS2SCC, MPS2_SCC,
-                         TYPE_MPS2_SCC)
+OBJECT_DECLARE_SIMPLE_TYPE(MPS2SCC, MPS2_SCC)
 
 #define NUM_OSCCLK 3
 
diff --git a/include/hw/misc/msf2-sysreg.h b/include/hw/misc/msf2-sysreg.h
index 625932354a..fc1890e710 100644
--- a/include/hw/misc/msf2-sysreg.h
+++ b/include/hw/misc/msf2-sysreg.h
@@ -62,9 +62,7 @@ enum {
 #define MSF2_SYSREG_MMIO_SIZE     0x300
 
 #define TYPE_MSF2_SYSREG          "msf2-sysreg"
-typedef struct MSF2SysregState MSF2SysregState;
-DECLARE_INSTANCE_CHECKER(MSF2SysregState, MSF2_SYSREG,
-                         TYPE_MSF2_SYSREG)
+OBJECT_DECLARE_SIMPLE_TYPE(MSF2SysregState, MSF2_SYSREG)
 
 struct MSF2SysregState {
     SysBusDevice parent_obj;
diff --git a/include/hw/misc/nrf51_rng.h b/include/hw/misc/nrf51_rng.h
index 7f2263a906..9aff9a76f8 100644
--- a/include/hw/misc/nrf51_rng.h
+++ b/include/hw/misc/nrf51_rng.h
@@ -38,9 +38,7 @@
 #include "qemu/timer.h"
 #include "qom/object.h"
 #define TYPE_NRF51_RNG "nrf51_soc.rng"
-typedef struct NRF51RNGState NRF51RNGState;
-DECLARE_INSTANCE_CHECKER(NRF51RNGState, NRF51_RNG,
-                         TYPE_NRF51_RNG)
+OBJECT_DECLARE_SIMPLE_TYPE(NRF51RNGState, NRF51_RNG)
 
 #define NRF51_RNG_SIZE         0x1000
 
diff --git a/include/hw/misc/stm32f2xx_syscfg.h b/include/hw/misc/stm32f2xx_syscfg.h
index 82ccd7cc24..57a98c533d 100644
--- a/include/hw/misc/stm32f2xx_syscfg.h
+++ b/include/hw/misc/stm32f2xx_syscfg.h
@@ -37,9 +37,7 @@
 #define SYSCFG_CMPCR   0x20
 
 #define TYPE_STM32F2XX_SYSCFG "stm32f2xx-syscfg"
-typedef struct STM32F2XXSyscfgState STM32F2XXSyscfgState;
-DECLARE_INSTANCE_CHECKER(STM32F2XXSyscfgState, STM32F2XX_SYSCFG,
-                         TYPE_STM32F2XX_SYSCFG)
+OBJECT_DECLARE_SIMPLE_TYPE(STM32F2XXSyscfgState, STM32F2XX_SYSCFG)
 
 struct STM32F2XXSyscfgState {
     /* <private> */
diff --git a/include/hw/misc/stm32f4xx_exti.h b/include/hw/misc/stm32f4xx_exti.h
index 4987c286ed..24b6fa7724 100644
--- a/include/hw/misc/stm32f4xx_exti.h
+++ b/include/hw/misc/stm32f4xx_exti.h
@@ -37,9 +37,7 @@
 #define EXTI_PR    0x14
 
 #define TYPE_STM32F4XX_EXTI "stm32f4xx-exti"
-typedef struct STM32F4xxExtiState STM32F4xxExtiState;
-DECLARE_INSTANCE_CHECKER(STM32F4xxExtiState, STM32F4XX_EXTI,
-                         TYPE_STM32F4XX_EXTI)
+OBJECT_DECLARE_SIMPLE_TYPE(STM32F4xxExtiState, STM32F4XX_EXTI)
 
 #define NUM_GPIO_EVENT_IN_LINES 16
 #define NUM_INTERRUPT_OUT_LINES 16
diff --git a/include/hw/misc/stm32f4xx_syscfg.h b/include/hw/misc/stm32f4xx_syscfg.h
index c3d89d4536..8c31feccd3 100644
--- a/include/hw/misc/stm32f4xx_syscfg.h
+++ b/include/hw/misc/stm32f4xx_syscfg.h
@@ -38,9 +38,7 @@
 #define SYSCFG_CMPCR   0x20
 
 #define TYPE_STM32F4XX_SYSCFG "stm32f4xx-syscfg"
-typedef struct STM32F4xxSyscfgState STM32F4xxSyscfgState;
-DECLARE_INSTANCE_CHECKER(STM32F4xxSyscfgState, STM32F4XX_SYSCFG,
-                         TYPE_STM32F4XX_SYSCFG)
+OBJECT_DECLARE_SIMPLE_TYPE(STM32F4xxSyscfgState, STM32F4XX_SYSCFG)
 
 #define SYSCFG_NUM_EXTICR 4
 
diff --git a/include/hw/misc/tz-mpc.h b/include/hw/misc/tz-mpc.h
index 34e45fdb97..74d5d822cf 100644
--- a/include/hw/misc/tz-mpc.h
+++ b/include/hw/misc/tz-mpc.h
@@ -35,9 +35,7 @@
 #include "qom/object.h"
 
 #define TYPE_TZ_MPC "tz-mpc"
-typedef struct TZMPC TZMPC;
-DECLARE_INSTANCE_CHECKER(TZMPC, TZ_MPC,
-                         TYPE_TZ_MPC)
+OBJECT_DECLARE_SIMPLE_TYPE(TZMPC, TZ_MPC)
 
 #define TZ_NUM_PORTS 16
 
diff --git a/include/hw/misc/tz-msc.h b/include/hw/misc/tz-msc.h
index 7169f330ff..77cc7f2404 100644
--- a/include/hw/misc/tz-msc.h
+++ b/include/hw/misc/tz-msc.h
@@ -55,9 +55,7 @@
 #include "qom/object.h"
 
 #define TYPE_TZ_MSC "tz-msc"
-typedef struct TZMSC TZMSC;
-DECLARE_INSTANCE_CHECKER(TZMSC, TZ_MSC,
-                         TYPE_TZ_MSC)
+OBJECT_DECLARE_SIMPLE_TYPE(TZMSC, TZ_MSC)
 
 struct TZMSC {
     /*< private >*/
diff --git a/include/hw/misc/tz-ppc.h b/include/hw/misc/tz-ppc.h
index b5251b715e..021d671b29 100644
--- a/include/hw/misc/tz-ppc.h
+++ b/include/hw/misc/tz-ppc.h
@@ -69,9 +69,7 @@
 #include "qom/object.h"
 
 #define TYPE_TZ_PPC "tz-ppc"
-typedef struct TZPPC TZPPC;
-DECLARE_INSTANCE_CHECKER(TZPPC, TZ_PPC,
-                         TYPE_TZ_PPC)
+OBJECT_DECLARE_SIMPLE_TYPE(TZPPC, TZ_PPC)
 
 #define TZ_NUM_PORTS 16
 
diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
index 7c724bab94..518d627dc5 100644
--- a/include/hw/misc/unimp.h
+++ b/include/hw/misc/unimp.h
@@ -15,9 +15,7 @@
 
 #define TYPE_UNIMPLEMENTED_DEVICE "unimplemented-device"
 
-typedef struct UnimplementedDeviceState UnimplementedDeviceState;
-DECLARE_INSTANCE_CHECKER(UnimplementedDeviceState, UNIMPLEMENTED_DEVICE,
-                         TYPE_UNIMPLEMENTED_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(UnimplementedDeviceState, UNIMPLEMENTED_DEVICE)
 
 struct UnimplementedDeviceState {
     SysBusDevice parent_obj;
diff --git a/include/hw/misc/zynq-xadc.h b/include/hw/misc/zynq-xadc.h
index 052f47954f..602bfb4ab1 100644
--- a/include/hw/misc/zynq-xadc.h
+++ b/include/hw/misc/zynq-xadc.h
@@ -24,9 +24,7 @@
 #define ZYNQ_XADC_FIFO_DEPTH    15
 
 #define TYPE_ZYNQ_XADC          "xlnx,zynq-xadc"
-typedef struct ZynqXADCState ZynqXADCState;
-DECLARE_INSTANCE_CHECKER(ZynqXADCState, ZYNQ_XADC,
-                         TYPE_ZYNQ_XADC)
+OBJECT_DECLARE_SIMPLE_TYPE(ZynqXADCState, ZYNQ_XADC)
 
 struct ZynqXADCState {
     /*< private >*/
diff --git a/include/hw/net/allwinner-sun8i-emac.h b/include/hw/net/allwinner-sun8i-emac.h
index 89e56b815b..460a58f1ca 100644
--- a/include/hw/net/allwinner-sun8i-emac.h
+++ b/include/hw/net/allwinner-sun8i-emac.h
@@ -30,9 +30,7 @@
  */
 
 #define TYPE_AW_SUN8I_EMAC "allwinner-sun8i-emac"
-typedef struct AwSun8iEmacState AwSun8iEmacState;
-DECLARE_INSTANCE_CHECKER(AwSun8iEmacState, AW_SUN8I_EMAC,
-                         TYPE_AW_SUN8I_EMAC)
+OBJECT_DECLARE_SIMPLE_TYPE(AwSun8iEmacState, AW_SUN8I_EMAC)
 
 /** @} */
 
diff --git a/include/hw/net/allwinner_emac.h b/include/hw/net/allwinner_emac.h
index f5f5b67939..534e748982 100644
--- a/include/hw/net/allwinner_emac.h
+++ b/include/hw/net/allwinner_emac.h
@@ -31,9 +31,7 @@
 #include "qom/object.h"
 
 #define TYPE_AW_EMAC "allwinner-emac"
-typedef struct AwEmacState AwEmacState;
-DECLARE_INSTANCE_CHECKER(AwEmacState, AW_EMAC,
-                         TYPE_AW_EMAC)
+OBJECT_DECLARE_SIMPLE_TYPE(AwEmacState, AW_EMAC)
 
 /*
  * Allwinner EMAC register list
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index 89d2dab513..91ebb5c8ae 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -27,9 +27,7 @@
 #include "qom/object.h"
 
 #define TYPE_CADENCE_GEM "cadence_gem"
-typedef struct CadenceGEMState CadenceGEMState;
-DECLARE_INSTANCE_CHECKER(CadenceGEMState, CADENCE_GEM,
-                         TYPE_CADENCE_GEM)
+OBJECT_DECLARE_SIMPLE_TYPE(CadenceGEMState, CADENCE_GEM)
 
 #include "net/net.h"
 #include "hw/sysbus.h"
diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
index c6b1c11fca..765d1538a4 100644
--- a/include/hw/net/ftgmac100.h
+++ b/include/hw/net/ftgmac100.h
@@ -12,9 +12,7 @@
 #include "qom/object.h"
 
 #define TYPE_FTGMAC100 "ftgmac100"
-typedef struct FTGMAC100State FTGMAC100State;
-DECLARE_INSTANCE_CHECKER(FTGMAC100State, FTGMAC100,
-                         TYPE_FTGMAC100)
+OBJECT_DECLARE_SIMPLE_TYPE(FTGMAC100State, FTGMAC100)
 
 #include "hw/sysbus.h"
 #include "net/net.h"
@@ -70,9 +68,7 @@ struct FTGMAC100State {
 };
 
 #define TYPE_ASPEED_MII "aspeed-mmi"
-typedef struct AspeedMiiState AspeedMiiState;
-DECLARE_INSTANCE_CHECKER(AspeedMiiState, ASPEED_MII,
-                         TYPE_ASPEED_MII)
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedMiiState, ASPEED_MII)
 
 /*
  * AST2600 MII controller
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index ffdbc304b6..e3a8755db9 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -26,9 +26,7 @@
 #include "qom/object.h"
 
 #define TYPE_IMX_FEC "imx.fec"
-typedef struct IMXFECState IMXFECState;
-DECLARE_INSTANCE_CHECKER(IMXFECState, IMX_FEC,
-                         TYPE_IMX_FEC)
+OBJECT_DECLARE_SIMPLE_TYPE(IMXFECState, IMX_FEC)
 
 #define TYPE_IMX_ENET "imx.enet"
 
diff --git a/include/hw/net/msf2-emac.h b/include/hw/net/msf2-emac.h
index 68194d798c..846ba6e6dc 100644
--- a/include/hw/net/msf2-emac.h
+++ b/include/hw/net/msf2-emac.h
@@ -29,9 +29,7 @@
 #include "qom/object.h"
 
 #define TYPE_MSS_EMAC "msf2-emac"
-typedef struct MSF2EmacState MSF2EmacState;
-DECLARE_INSTANCE_CHECKER(MSF2EmacState, MSS_EMAC,
-                         TYPE_MSS_EMAC)
+OBJECT_DECLARE_SIMPLE_TYPE(MSF2EmacState, MSS_EMAC)
 
 #define R_MAX         (0x1a0 / 4)
 #define PHY_MAX_REGS  32
diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index 6856d7e095..36aa098dd4 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -13,9 +13,7 @@
 #include "qom/object.h"
 
 #define TYPE_MAC_NUBUS_BRIDGE "mac-nubus-bridge"
-typedef struct MacNubusState MacNubusState;
-DECLARE_INSTANCE_CHECKER(MacNubusState, MAC_NUBUS_BRIDGE,
-                         TYPE_MAC_NUBUS_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(MacNubusState, MAC_NUBUS_BRIDGE)
 
 struct MacNubusState {
     SysBusDevice sysbus_dev;
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 9370f0d8f0..e2b5cf260b 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -23,14 +23,10 @@
 #define NUBUS_LAST_SLOT       0xF
 
 #define TYPE_NUBUS_DEVICE "nubus-device"
-typedef struct NubusDevice NubusDevice;
-DECLARE_INSTANCE_CHECKER(NubusDevice, NUBUS_DEVICE,
-                         TYPE_NUBUS_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(NubusDevice, NUBUS_DEVICE)
 
 #define TYPE_NUBUS_BUS "nubus-bus"
-typedef struct NubusBus NubusBus;
-DECLARE_INSTANCE_CHECKER(NubusBus, NUBUS_BUS,
-                         TYPE_NUBUS_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(NubusBus, NUBUS_BUS)
 
 #define TYPE_NUBUS_BRIDGE "nubus-bridge"
 
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index f85393400c..8a9f5738bf 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -12,12 +12,9 @@
 #define TYPE_FW_CFG_MEM "fw_cfg_mem"
 #define TYPE_FW_CFG_DATA_GENERATOR_INTERFACE "fw_cfg-data-generator"
 
-DECLARE_INSTANCE_CHECKER(FWCfgState, FW_CFG,
-                         TYPE_FW_CFG)
-DECLARE_INSTANCE_CHECKER(FWCfgIoState, FW_CFG_IO,
-                         TYPE_FW_CFG_IO)
-DECLARE_INSTANCE_CHECKER(FWCfgMemState, FW_CFG_MEM,
-                         TYPE_FW_CFG_MEM)
+OBJECT_DECLARE_SIMPLE_TYPE(FWCfgState, FW_CFG)
+OBJECT_DECLARE_SIMPLE_TYPE(FWCfgIoState, FW_CFG_IO)
+OBJECT_DECLARE_SIMPLE_TYPE(FWCfgMemState, FW_CFG_MEM)
 
 typedef struct FWCfgDataGeneratorClass FWCfgDataGeneratorClass;
 DECLARE_CLASS_CHECKERS(FWCfgDataGeneratorClass, FW_CFG_DATA_GENERATOR,
diff --git a/include/hw/nvram/nrf51_nvm.h b/include/hw/nvram/nrf51_nvm.h
index ab99b09206..d85e788df5 100644
--- a/include/hw/nvram/nrf51_nvm.h
+++ b/include/hw/nvram/nrf51_nvm.h
@@ -25,9 +25,7 @@
 #include "hw/sysbus.h"
 #include "qom/object.h"
 #define TYPE_NRF51_NVM "nrf51_soc.nvm"
-typedef struct NRF51NVMState NRF51NVMState;
-DECLARE_INSTANCE_CHECKER(NRF51NVMState, NRF51_NVM,
-                         TYPE_NRF51_NVM)
+OBJECT_DECLARE_SIMPLE_TYPE(NRF51NVMState, NRF51_NVM)
 
 #define NRF51_UICR_FIXTURE_SIZE 64
 
diff --git a/include/hw/pci-bridge/simba.h b/include/hw/pci-bridge/simba.h
index 675aa5a990..979cb17435 100644
--- a/include/hw/pci-bridge/simba.h
+++ b/include/hw/pci-bridge/simba.h
@@ -35,10 +35,8 @@ struct SimbaPCIBridge {
     /*< private >*/
     PCIBridge parent_obj;
 };
-typedef struct SimbaPCIBridge SimbaPCIBridge;
 
 #define TYPE_SIMBA_PCI_BRIDGE "pbm-bridge"
-DECLARE_INSTANCE_CHECKER(SimbaPCIBridge, SIMBA_PCI_BRIDGE,
-                         TYPE_SIMBA_PCI_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(SimbaPCIBridge, SIMBA_PCI_BRIDGE)
 
 #endif
diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index 551eec3107..79869c7066 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -29,14 +29,10 @@
 #include "qom/object.h"
 
 #define TYPE_DESIGNWARE_PCIE_HOST "designware-pcie-host"
-typedef struct DesignwarePCIEHost DesignwarePCIEHost;
-DECLARE_INSTANCE_CHECKER(DesignwarePCIEHost, DESIGNWARE_PCIE_HOST,
-                         TYPE_DESIGNWARE_PCIE_HOST)
+OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIEHost, DESIGNWARE_PCIE_HOST)
 
 #define TYPE_DESIGNWARE_PCIE_ROOT "designware-pcie-root"
-typedef struct DesignwarePCIERoot DesignwarePCIERoot;
-DECLARE_INSTANCE_CHECKER(DesignwarePCIERoot, DESIGNWARE_PCIE_ROOT,
-                         TYPE_DESIGNWARE_PCIE_ROOT)
+OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIERoot, DESIGNWARE_PCIE_ROOT)
 
 struct DesignwarePCIERoot;
 
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index 2f4e852eee..7abdb8b406 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -26,14 +26,10 @@
 #include "qom/object.h"
 
 #define TYPE_GPEX_HOST "gpex-pcihost"
-typedef struct GPEXHost GPEXHost;
-DECLARE_INSTANCE_CHECKER(GPEXHost, GPEX_HOST,
-                         TYPE_GPEX_HOST)
+OBJECT_DECLARE_SIMPLE_TYPE(GPEXHost, GPEX_HOST)
 
 #define TYPE_GPEX_ROOT_DEVICE "gpex-root"
-typedef struct GPEXRootState GPEXRootState;
-DECLARE_INSTANCE_CHECKER(GPEXRootState, GPEX_ROOT_DEVICE,
-                         TYPE_GPEX_ROOT_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(GPEXRootState, GPEX_ROOT_DEVICE)
 
 #define GPEX_NUM_IRQS 4
 
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index 046c64576d..6c16eaf876 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -19,9 +19,7 @@
 #define TYPE_I440FX_PCI_HOST_BRIDGE "i440FX-pcihost"
 #define TYPE_I440FX_PCI_DEVICE "i440FX"
 
-typedef struct PCII440FXState PCII440FXState;
-DECLARE_INSTANCE_CHECKER(PCII440FXState, I440FX_PCI_DEVICE,
-                         TYPE_I440FX_PCI_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(PCII440FXState, I440FX_PCI_DEVICE)
 
 struct PCII440FXState {
     /*< private >*/
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 182f29d681..e2a2e36245 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -72,9 +72,7 @@ typedef struct PnvPhb3DMASpace {
  * PHB3 Power Bus Common Queue
  */
 #define TYPE_PNV_PBCQ "pnv-pbcq"
-typedef struct PnvPBCQState PnvPBCQState;
-DECLARE_INSTANCE_CHECKER(PnvPBCQState, PNV_PBCQ,
-                         TYPE_PNV_PBCQ)
+OBJECT_DECLARE_SIMPLE_TYPE(PnvPBCQState, PNV_PBCQ)
 
 struct PnvPBCQState {
     DeviceState parent;
@@ -118,8 +116,7 @@ typedef struct PnvPHB3RootPort {
  * PHB3 PCIe Host Bridge for PowerNV machines (POWER8)
  */
 #define TYPE_PNV_PHB3 "pnv-phb3"
-DECLARE_INSTANCE_CHECKER(PnvPHB3, PNV_PHB3,
-                         TYPE_PNV_PHB3)
+OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB3, PNV_PHB3)
 
 #define PNV_PHB3_NUM_M64      16
 #define PNV_PHB3_NUM_REGS     (0x1000 >> 3)
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 05efb4e6b9..27556ae534 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -57,8 +57,7 @@ typedef struct PnvPHB4RootPort {
  * PHB4 PCIe Host Bridge for PowerNV machines (POWER9)
  */
 #define TYPE_PNV_PHB4 "pnv-phb4"
-DECLARE_INSTANCE_CHECKER(PnvPHB4, PNV_PHB4,
-                         TYPE_PNV_PHB4)
+OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
 
 #define PNV_PHB4_MAX_LSIs          8
 #define PNV_PHB4_MAX_INTs          4096
@@ -144,8 +143,7 @@ extern const MemoryRegionOps pnv_phb4_xscom_ops;
 OBJECT_DECLARE_TYPE(PnvPhb4PecState, PnvPhb4PecClass, PNV_PHB4_PEC)
 
 #define TYPE_PNV_PHB4_PEC_STACK "pnv-phb4-pec-stack"
-DECLARE_INSTANCE_CHECKER(PnvPhb4PecStack, PNV_PHB4_PEC_STACK,
-                         TYPE_PNV_PHB4_PEC_STACK)
+OBJECT_DECLARE_SIMPLE_TYPE(PnvPhb4PecStack, PNV_PHB4_PEC_STACK)
 
 /* Per-stack data */
 struct PnvPhb4PecStack {
diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index 0f5a534f77..bbb9581765 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -30,14 +30,10 @@
 #include "qom/object.h"
 
 #define TYPE_Q35_HOST_DEVICE "q35-pcihost"
-typedef struct Q35PCIHost Q35PCIHost;
-DECLARE_INSTANCE_CHECKER(Q35PCIHost, Q35_HOST_DEVICE,
-                         TYPE_Q35_HOST_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(Q35PCIHost, Q35_HOST_DEVICE)
 
 #define TYPE_MCH_PCI_DEVICE "mch"
-typedef struct MCHPCIState MCHPCIState;
-DECLARE_INSTANCE_CHECKER(MCHPCIState, MCH_PCI_DEVICE,
-                         TYPE_MCH_PCI_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(MCHPCIState, MCH_PCI_DEVICE)
 
 struct MCHPCIState {
     /*< private >*/
diff --git a/include/hw/pci-host/sabre.h b/include/hw/pci-host/sabre.h
index 7a76de4b9e..01190241bb 100644
--- a/include/hw/pci-host/sabre.h
+++ b/include/hw/pci-host/sabre.h
@@ -20,11 +20,9 @@
 struct SabrePCIState {
     PCIDevice parent_obj;
 };
-typedef struct SabrePCIState SabrePCIState;
 
 #define TYPE_SABRE_PCI_DEVICE "sabre-pci"
-DECLARE_INSTANCE_CHECKER(SabrePCIState, SABRE_PCI_DEVICE,
-                         TYPE_SABRE_PCI_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(SabrePCIState, SABRE_PCI_DEVICE)
 
 struct SabreState {
     PCIHostState parent_obj;
@@ -48,10 +46,8 @@ struct SabreState {
     uint32_t reset_control;
     unsigned int nr_resets;
 };
-typedef struct SabreState SabreState;
 
 #define TYPE_SABRE "sabre"
-DECLARE_INSTANCE_CHECKER(SabreState, SABRE,
-                         TYPE_SABRE)
+OBJECT_DECLARE_SIMPLE_TYPE(SabreState, SABRE)
 
 #endif
diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index 0431ce1048..04917f31ef 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -28,9 +28,7 @@
 
 #define TYPE_SPAPR_PCI_HOST_BRIDGE "spapr-pci-host-bridge"
 
-typedef struct SpaprPhbState SpaprPhbState;
-DECLARE_INSTANCE_CHECKER(SpaprPhbState, SPAPR_PCI_HOST_BRIDGE,
-                         TYPE_SPAPR_PCI_HOST_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(SpaprPhbState, SPAPR_PCI_HOST_BRIDGE)
 
 #define SPAPR_PCI_DMA_MAX_WINDOWS    2
 
diff --git a/include/hw/pci-host/uninorth.h b/include/hw/pci-host/uninorth.h
index d10c598298..a6ba5f21a8 100644
--- a/include/hw/pci-host/uninorth.h
+++ b/include/hw/pci-host/uninorth.h
@@ -63,10 +63,8 @@ struct UNINState {
 
     MemoryRegion mem;
 };
-typedef struct UNINState UNINState;
 
 #define TYPE_UNI_NORTH "uni-north"
-DECLARE_INSTANCE_CHECKER(UNINState, UNI_NORTH,
-                         TYPE_UNI_NORTH)
+OBJECT_DECLARE_SIMPLE_TYPE(UNINState, UNI_NORTH)
 
 #endif /* UNINORTH_H */
diff --git a/include/hw/pci-host/xilinx-pcie.h b/include/hw/pci-host/xilinx-pcie.h
index 6058c8c9e2..f079e50db4 100644
--- a/include/hw/pci-host/xilinx-pcie.h
+++ b/include/hw/pci-host/xilinx-pcie.h
@@ -27,14 +27,10 @@
 #include "qom/object.h"
 
 #define TYPE_XILINX_PCIE_HOST "xilinx-pcie-host"
-typedef struct XilinxPCIEHost XilinxPCIEHost;
-DECLARE_INSTANCE_CHECKER(XilinxPCIEHost, XILINX_PCIE_HOST,
-                         TYPE_XILINX_PCIE_HOST)
+OBJECT_DECLARE_SIMPLE_TYPE(XilinxPCIEHost, XILINX_PCIE_HOST)
 
 #define TYPE_XILINX_PCIE_ROOT "xilinx-pcie-root"
-typedef struct XilinxPCIERoot XilinxPCIERoot;
-DECLARE_INSTANCE_CHECKER(XilinxPCIERoot, XILINX_PCIE_ROOT,
-                         TYPE_XILINX_PCIE_ROOT)
+OBJECT_DECLARE_SIMPLE_TYPE(XilinxPCIERoot, XILINX_PCIE_ROOT)
 
 struct XilinxPCIERoot {
     PCIBridge parent_obj;
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 7ab145955a..a94d350034 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -51,8 +51,7 @@ struct PCIBridgeWindows {
 };
 
 #define TYPE_PCI_BRIDGE "base-pci-bridge"
-DECLARE_INSTANCE_CHECKER(PCIBridge, PCI_BRIDGE,
-                         TYPE_PCI_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIBridge, PCI_BRIDGE)
 
 struct PCIBridge {
     /*< private >*/
diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
index f512646c0c..076457b270 100644
--- a/include/hw/pci/pcie_host.h
+++ b/include/hw/pci/pcie_host.h
@@ -26,8 +26,7 @@
 #include "qom/object.h"
 
 #define TYPE_PCIE_HOST_BRIDGE "pcie-host-bridge"
-DECLARE_INSTANCE_CHECKER(PCIExpressHost, PCIE_HOST_BRIDGE,
-                         TYPE_PCIE_HOST_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIExpressHost, PCIE_HOST_BRIDGE)
 
 #define PCIE_HOST_MCFG_BASE "MCFG"
 #define PCIE_HOST_MCFG_SIZE "mcfg_size"
diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index 2463c07fa7..bea8ecad0f 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -26,8 +26,7 @@
 #include "qom/object.h"
 
 #define TYPE_PCIE_PORT "pcie-port"
-DECLARE_INSTANCE_CHECKER(PCIEPort, PCIE_PORT,
-                         TYPE_PCIE_PORT)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIEPort, PCIE_PORT)
 
 struct PCIEPort {
     /*< private >*/
@@ -41,8 +40,7 @@ struct PCIEPort {
 void pcie_port_init_reg(PCIDevice *d);
 
 #define TYPE_PCIE_SLOT "pcie-slot"
-DECLARE_INSTANCE_CHECKER(PCIESlot, PCIE_SLOT,
-                         TYPE_PCIE_SLOT)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIESlot, PCIE_SLOT)
 
 struct PCIESlot {
     /*< private >*/
diff --git a/include/hw/platform-bus.h b/include/hw/platform-bus.h
index 0d035e1b71..1f3d1ce869 100644
--- a/include/hw/platform-bus.h
+++ b/include/hw/platform-bus.h
@@ -25,11 +25,9 @@
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
-typedef struct PlatformBusDevice PlatformBusDevice;
 
 #define TYPE_PLATFORM_BUS_DEVICE "platform-bus-device"
-DECLARE_INSTANCE_CHECKER(PlatformBusDevice, PLATFORM_BUS_DEVICE,
-                         TYPE_PLATFORM_BUS_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(PlatformBusDevice, PLATFORM_BUS_DEVICE)
 
 struct PlatformBusDevice {
     /*< private >*/
diff --git a/include/hw/ppc/mac_dbdma.h b/include/hw/ppc/mac_dbdma.h
index 9166d5f758..4a3f644516 100644
--- a/include/hw/ppc/mac_dbdma.h
+++ b/include/hw/ppc/mac_dbdma.h
@@ -178,7 +178,6 @@ void DBDMA_register_channel(void *dbdma, int nchan, qemu_irq irq,
 void DBDMA_kick(DBDMAState *dbdma);
 
 #define TYPE_MAC_DBDMA "mac-dbdma"
-DECLARE_INSTANCE_CHECKER(DBDMAState, MAC_DBDMA,
-                         TYPE_MAC_DBDMA)
+OBJECT_DECLARE_SIMPLE_TYPE(DBDMAState, MAC_DBDMA)
 
 #endif
diff --git a/include/hw/ppc/openpic.h b/include/hw/ppc/openpic.h
index 61908c7858..74ff44bff0 100644
--- a/include/hw/ppc/openpic.h
+++ b/include/hw/ppc/openpic.h
@@ -137,9 +137,7 @@ typedef struct IRQDest {
 } IRQDest;
 
 #define TYPE_OPENPIC "openpic"
-typedef struct OpenPICState OpenPICState;
-DECLARE_INSTANCE_CHECKER(OpenPICState, OPENPIC,
-                         TYPE_OPENPIC)
+OBJECT_DECLARE_SIMPLE_TYPE(OpenPICState, OPENPIC)
 
 struct OpenPICState {
     /*< private >*/
diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
index fc11edee28..f15829dfae 100644
--- a/include/hw/ppc/pnv_core.h
+++ b/include/hw/ppc/pnv_core.h
@@ -62,9 +62,7 @@ static inline PnvCPUState *pnv_cpu_state(PowerPCCPU *cpu)
 }
 
 #define TYPE_PNV_QUAD "powernv-cpu-quad"
-typedef struct PnvQuad PnvQuad;
-DECLARE_INSTANCE_CHECKER(PnvQuad, PNV_QUAD,
-                         TYPE_PNV_QUAD)
+OBJECT_DECLARE_SIMPLE_TYPE(PnvQuad, PNV_QUAD)
 
 struct PnvQuad {
     DeviceState parent_obj;
diff --git a/include/hw/ppc/pnv_pnor.h b/include/hw/ppc/pnv_pnor.h
index 1ec4098bb9..99f9a3adfb 100644
--- a/include/hw/ppc/pnv_pnor.h
+++ b/include/hw/ppc/pnv_pnor.h
@@ -16,9 +16,7 @@
 #define PNOR_SPI_OFFSET         0x0c000000UL
 
 #define TYPE_PNV_PNOR  "pnv-pnor"
-typedef struct PnvPnor PnvPnor;
-DECLARE_INSTANCE_CHECKER(PnvPnor, PNV_PNOR,
-                         TYPE_PNV_PNOR)
+OBJECT_DECLARE_SIMPLE_TYPE(PnvPnor, PNV_PNOR)
 
 struct PnvPnor {
     SysBusDevice   parent_obj;
diff --git a/include/hw/ppc/pnv_psi.h b/include/hw/ppc/pnv_psi.h
index a1fe25b3eb..682b09f874 100644
--- a/include/hw/ppc/pnv_psi.h
+++ b/include/hw/ppc/pnv_psi.h
@@ -51,9 +51,7 @@ struct PnvPsi {
 };
 
 #define TYPE_PNV8_PSI TYPE_PNV_PSI "-POWER8"
-typedef struct Pnv8Psi Pnv8Psi;
-DECLARE_INSTANCE_CHECKER(Pnv8Psi, PNV8_PSI,
-                         TYPE_PNV8_PSI)
+OBJECT_DECLARE_SIMPLE_TYPE(Pnv8Psi, PNV8_PSI)
 
 struct Pnv8Psi {
     PnvPsi   parent;
@@ -62,9 +60,7 @@ struct Pnv8Psi {
 };
 
 #define TYPE_PNV9_PSI TYPE_PNV_PSI "-POWER9"
-typedef struct Pnv9Psi Pnv9Psi;
-DECLARE_INSTANCE_CHECKER(Pnv9Psi, PNV9_PSI,
-                         TYPE_PNV9_PSI)
+OBJECT_DECLARE_SIMPLE_TYPE(Pnv9Psi, PNV9_PSI)
 
 struct Pnv9Psi {
     PnvPsi   parent;
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index eea7ac8624..194f3b9d07 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -28,9 +28,7 @@ typedef struct SpaprPendingHpt SpaprPendingHpt;
 
 #define TYPE_SPAPR_RTC "spapr-rtc"
 
-typedef struct SpaprRtcState SpaprRtcState;
-DECLARE_INSTANCE_CHECKER(SpaprRtcState, SPAPR_RTC,
-                         TYPE_SPAPR_RTC)
+OBJECT_DECLARE_SIMPLE_TYPE(SpaprRtcState, SPAPR_RTC)
 
 struct SpaprRtcState {
     /*< private >*/
@@ -781,11 +779,9 @@ static inline void spapr_dt_irq(uint32_t *intspec, int irq, bool is_lsi)
     intspec[1] = is_lsi ? cpu_to_be32(1) : 0;
 }
 
-typedef struct SpaprTceTable SpaprTceTable;
 
 #define TYPE_SPAPR_TCE_TABLE "spapr-tce-table"
-DECLARE_INSTANCE_CHECKER(SpaprTceTable, SPAPR_TCE_TABLE,
-                         TYPE_SPAPR_TCE_TABLE)
+OBJECT_DECLARE_SIMPLE_TYPE(SpaprTceTable, SPAPR_TCE_TABLE)
 
 #define TYPE_SPAPR_IOMMU_MEMORY_REGION "spapr-iommu-memory-region"
 DECLARE_INSTANCE_CHECKER(IOMMUMemoryRegion, SPAPR_IOMMU_MEMORY_REGION,
diff --git a/include/hw/ppc/spapr_tpm_proxy.h b/include/hw/ppc/spapr_tpm_proxy.h
index 300c81b1f0..96d2a9697e 100644
--- a/include/hw/ppc/spapr_tpm_proxy.h
+++ b/include/hw/ppc/spapr_tpm_proxy.h
@@ -17,9 +17,7 @@
 #include "hw/qdev-core.h"
 
 #define TYPE_SPAPR_TPM_PROXY "spapr-tpm-proxy"
-typedef struct SpaprTpmProxy SpaprTpmProxy;
-DECLARE_INSTANCE_CHECKER(SpaprTpmProxy, SPAPR_TPM_PROXY,
-                         TYPE_SPAPR_TPM_PROXY)
+OBJECT_DECLARE_SIMPLE_TYPE(SpaprTpmProxy, SPAPR_TPM_PROXY)
 
 struct SpaprTpmProxy {
     /*< private >*/
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index aae03ea6ab..356751e2d7 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -32,9 +32,7 @@ OBJECT_DECLARE_TYPE(SpaprVioDevice, SpaprVioDeviceClass,
                     VIO_SPAPR_DEVICE)
 
 #define TYPE_SPAPR_VIO_BUS "spapr-vio-bus"
-typedef struct SpaprVioBus SpaprVioBus;
-DECLARE_INSTANCE_CHECKER(SpaprVioBus, SPAPR_VIO_BUS,
-                         TYPE_SPAPR_VIO_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(SpaprVioBus, SPAPR_VIO_BUS)
 
 #define TYPE_SPAPR_VIO_BRIDGE "spapr-vio-bridge"
 
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 26771bb2b3..445eccfe6b 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -168,9 +168,7 @@ struct XiveNotifierClass {
  */
 
 #define TYPE_XIVE_SOURCE "xive-source"
-typedef struct XiveSource XiveSource;
-DECLARE_INSTANCE_CHECKER(XiveSource, XIVE_SOURCE,
-                         TYPE_XIVE_SOURCE)
+OBJECT_DECLARE_SIMPLE_TYPE(XiveSource, XIVE_SOURCE)
 
 /*
  * XIVE Interrupt Source characteristics, which define how the ESB are
@@ -306,9 +304,7 @@ void xive_source_set_irq(void *opaque, int srcno, int val);
  */
 
 #define TYPE_XIVE_TCTX "xive-tctx"
-typedef struct XiveTCTX XiveTCTX;
-DECLARE_INSTANCE_CHECKER(XiveTCTX, XIVE_TCTX,
-                         TYPE_XIVE_TCTX)
+OBJECT_DECLARE_SIMPLE_TYPE(XiveTCTX, XIVE_TCTX)
 
 /*
  * XIVE Thread interrupt Management register rings :
@@ -433,9 +429,7 @@ struct XiveFabricClass {
  */
 
 #define TYPE_XIVE_END_SOURCE "xive-end-source"
-typedef struct XiveENDSource XiveENDSource;
-DECLARE_INSTANCE_CHECKER(XiveENDSource, XIVE_END_SOURCE,
-                         TYPE_XIVE_END_SOURCE)
+OBJECT_DECLARE_SIMPLE_TYPE(XiveENDSource, XIVE_END_SOURCE)
 
 struct XiveENDSource {
     DeviceState parent;
diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 8c15b6325f..5ff0c0f85e 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -25,9 +25,7 @@
 #include "qom/object.h"
 
 #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
-typedef struct LowRISCIbexSoCState LowRISCIbexSoCState;
-DECLARE_INSTANCE_CHECKER(LowRISCIbexSoCState, RISCV_IBEX_SOC,
-                         TYPE_RISCV_IBEX_SOC)
+OBJECT_DECLARE_SIMPLE_TYPE(LowRISCIbexSoCState, RISCV_IBEX_SOC)
 
 struct LowRISCIbexSoCState {
     /*< private >*/
diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index ac2cb62e1b..bbc21cdc9a 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -27,9 +27,7 @@
 
 #define TYPE_RISCV_HART_ARRAY "riscv.hart_array"
 
-typedef struct RISCVHartArrayState RISCVHartArrayState;
-DECLARE_INSTANCE_CHECKER(RISCVHartArrayState, RISCV_HART_ARRAY,
-                         TYPE_RISCV_HART_ARRAY)
+OBJECT_DECLARE_SIMPLE_TYPE(RISCVHartArrayState, RISCV_HART_ARRAY)
 
 struct RISCVHartArrayState {
     /*< private >*/
diff --git a/include/hw/rtc/aspeed_rtc.h b/include/hw/rtc/aspeed_rtc.h
index d7691ab88f..df61e46059 100644
--- a/include/hw/rtc/aspeed_rtc.h
+++ b/include/hw/rtc/aspeed_rtc.h
@@ -21,10 +21,8 @@ struct AspeedRtcState {
     int offset;
 
 };
-typedef struct AspeedRtcState AspeedRtcState;
 
 #define TYPE_ASPEED_RTC "aspeed.rtc"
-DECLARE_INSTANCE_CHECKER(AspeedRtcState, ASPEED_RTC,
-                         TYPE_ASPEED_RTC)
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedRtcState, ASPEED_RTC)
 
 #endif /* HW_RTC_ASPEED_RTC_H */
diff --git a/include/hw/rtc/goldfish_rtc.h b/include/hw/rtc/goldfish_rtc.h
index b710c21c94..79ca7daf5d 100644
--- a/include/hw/rtc/goldfish_rtc.h
+++ b/include/hw/rtc/goldfish_rtc.h
@@ -26,9 +26,7 @@
 #include "qom/object.h"
 
 #define TYPE_GOLDFISH_RTC "goldfish_rtc"
-typedef struct GoldfishRTCState GoldfishRTCState;
-DECLARE_INSTANCE_CHECKER(GoldfishRTCState, GOLDFISH_RTC,
-                         TYPE_GOLDFISH_RTC)
+OBJECT_DECLARE_SIMPLE_TYPE(GoldfishRTCState, GOLDFISH_RTC)
 
 struct GoldfishRTCState {
     SysBusDevice parent_obj;
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index e58e006d0d..6224b5276a 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -16,9 +16,7 @@
 #include "qom/object.h"
 
 #define TYPE_MC146818_RTC "mc146818rtc"
-typedef struct RTCState RTCState;
-DECLARE_INSTANCE_CHECKER(RTCState, MC146818_RTC,
-                         TYPE_MC146818_RTC)
+OBJECT_DECLARE_SIMPLE_TYPE(RTCState, MC146818_RTC)
 
 struct RTCState {
     ISADevice parent_obj;
diff --git a/include/hw/rtc/pl031.h b/include/hw/rtc/pl031.h
index 3897b424d4..9fd4be1abb 100644
--- a/include/hw/rtc/pl031.h
+++ b/include/hw/rtc/pl031.h
@@ -19,9 +19,7 @@
 #include "qom/object.h"
 
 #define TYPE_PL031 "pl031"
-typedef struct PL031State PL031State;
-DECLARE_INSTANCE_CHECKER(PL031State, PL031,
-                         TYPE_PL031)
+OBJECT_DECLARE_SIMPLE_TYPE(PL031State, PL031)
 
 struct PL031State {
     SysBusDevice parent_obj;
diff --git a/include/hw/rtc/xlnx-zynqmp-rtc.h b/include/hw/rtc/xlnx-zynqmp-rtc.h
index 209de85ae6..5f1ad0a946 100644
--- a/include/hw/rtc/xlnx-zynqmp-rtc.h
+++ b/include/hw/rtc/xlnx-zynqmp-rtc.h
@@ -33,9 +33,7 @@
 
 #define TYPE_XLNX_ZYNQMP_RTC "xlnx-zynmp.rtc"
 
-typedef struct XlnxZynqMPRTC XlnxZynqMPRTC;
-DECLARE_INSTANCE_CHECKER(XlnxZynqMPRTC, XLNX_ZYNQMP_RTC,
-                         TYPE_XLNX_ZYNQMP_RTC)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPRTC, XLNX_ZYNQMP_RTC)
 
 REG32(SET_TIME_WRITE, 0x0)
 REG32(SET_TIME_READ, 0x4)
diff --git a/include/hw/s390x/css-bridge.h b/include/hw/s390x/css-bridge.h
index 9fd4484204..deb606d71f 100644
--- a/include/hw/s390x/css-bridge.h
+++ b/include/hw/s390x/css-bridge.h
@@ -21,21 +21,17 @@ struct VirtualCssBridge {
     SysBusDevice sysbus_dev;
     bool css_dev_path;
 };
-typedef struct VirtualCssBridge VirtualCssBridge;
 
 #define TYPE_VIRTUAL_CSS_BRIDGE "virtual-css-bridge"
-DECLARE_INSTANCE_CHECKER(VirtualCssBridge, VIRTUAL_CSS_BRIDGE,
-                         TYPE_VIRTUAL_CSS_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtualCssBridge, VIRTUAL_CSS_BRIDGE)
 
 /* virtual css bus type */
 struct VirtualCssBus {
     BusState parent_obj;
 };
-typedef struct VirtualCssBus VirtualCssBus;
 
 #define TYPE_VIRTUAL_CSS_BUS "virtual-css-bus"
-DECLARE_INSTANCE_CHECKER(VirtualCssBus, VIRTUAL_CSS_BUS,
-                         TYPE_VIRTUAL_CSS_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtualCssBus, VIRTUAL_CSS_BUS)
 VirtualCssBus *virtual_css_bus_init(void);
 
 #endif
diff --git a/include/hw/s390x/s390_flic.h b/include/hw/s390x/s390_flic.h
index 648ae793a1..e91b15d2d6 100644
--- a/include/hw/s390x/s390_flic.h
+++ b/include/hw/s390x/s390_flic.h
@@ -77,9 +77,7 @@ DECLARE_INSTANCE_CHECKER(KVMS390FLICState, KVM_S390_FLIC,
                          TYPE_KVM_S390_FLIC)
 
 #define TYPE_QEMU_S390_FLIC "s390-flic-qemu"
-typedef struct QEMUS390FLICState QEMUS390FLICState;
-DECLARE_INSTANCE_CHECKER(QEMUS390FLICState, QEMU_S390_FLIC,
-                         TYPE_QEMU_S390_FLIC)
+OBJECT_DECLARE_SIMPLE_TYPE(QEMUS390FLICState, QEMU_S390_FLIC)
 
 #define SIC_IRQ_MODE_ALL 0
 #define SIC_IRQ_MODE_SINGLE 1
diff --git a/include/hw/s390x/vfio-ccw.h b/include/hw/s390x/vfio-ccw.h
index 9c9c8944ad..63a909eb7e 100644
--- a/include/hw/s390x/vfio-ccw.h
+++ b/include/hw/s390x/vfio-ccw.h
@@ -20,9 +20,7 @@
 #include "qom/object.h"
 
 #define TYPE_VFIO_CCW "vfio-ccw"
-typedef struct VFIOCCWDevice VFIOCCWDevice;
-DECLARE_INSTANCE_CHECKER(VFIOCCWDevice, VFIO_CCW,
-                         TYPE_VFIO_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOCCWDevice, VFIO_CCW)
 
 #define TYPE_VFIO_CCW "vfio-ccw"
 
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 20800dbf5b..60cc3047a5 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -66,9 +66,7 @@ struct ESPState {
 };
 
 #define TYPE_ESP "esp"
-typedef struct SysBusESPState SysBusESPState;
-DECLARE_INSTANCE_CHECKER(SysBusESPState, ESP,
-                         TYPE_ESP)
+OBJECT_DECLARE_SIMPLE_TYPE(SysBusESPState, ESP)
 
 struct SysBusESPState {
     /*< private >*/
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index b1e2ed7c35..7a55cdbd74 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -132,8 +132,7 @@ struct SCSIBusInfo {
 };
 
 #define TYPE_SCSI_BUS "SCSI"
-DECLARE_INSTANCE_CHECKER(SCSIBus, SCSI_BUS,
-                         TYPE_SCSI_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(SCSIBus, SCSI_BUS)
 
 struct SCSIBus {
     BusState qbus;
diff --git a/include/hw/sd/aspeed_sdhci.h b/include/hw/sd/aspeed_sdhci.h
index 783ccc2956..b093d1b861 100644
--- a/include/hw/sd/aspeed_sdhci.h
+++ b/include/hw/sd/aspeed_sdhci.h
@@ -13,9 +13,7 @@
 #include "qom/object.h"
 
 #define TYPE_ASPEED_SDHCI "aspeed.sdhci"
-typedef struct AspeedSDHCIState AspeedSDHCIState;
-DECLARE_INSTANCE_CHECKER(AspeedSDHCIState, ASPEED_SDHCI,
-                         TYPE_ASPEED_SDHCI)
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedSDHCIState, ASPEED_SDHCI)
 
 #define ASPEED_SDHCI_CAPABILITIES 0x01E80080
 #define ASPEED_SDHCI_NUM_SLOTS    2
diff --git a/include/hw/sd/bcm2835_sdhost.h b/include/hw/sd/bcm2835_sdhost.h
index 751ba531d6..f6bca5c397 100644
--- a/include/hw/sd/bcm2835_sdhost.h
+++ b/include/hw/sd/bcm2835_sdhost.h
@@ -19,9 +19,7 @@
 #include "qom/object.h"
 
 #define TYPE_BCM2835_SDHOST "bcm2835-sdhost"
-typedef struct BCM2835SDHostState BCM2835SDHostState;
-DECLARE_INSTANCE_CHECKER(BCM2835SDHostState, BCM2835_SDHOST,
-                         TYPE_BCM2835_SDHOST)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835SDHostState, BCM2835_SDHOST)
 
 #define BCM2835_SDHOST_FIFO_LEN 16
 
diff --git a/include/hw/sparc/sparc32_dma.h b/include/hw/sparc/sparc32_dma.h
index a402665a9c..e650489414 100644
--- a/include/hw/sparc/sparc32_dma.h
+++ b/include/hw/sparc/sparc32_dma.h
@@ -9,9 +9,7 @@
 #define DMA_REGS 4
 
 #define TYPE_SPARC32_DMA_DEVICE "sparc32-dma-device"
-typedef struct DMADeviceState DMADeviceState;
-DECLARE_INSTANCE_CHECKER(DMADeviceState, SPARC32_DMA_DEVICE,
-                         TYPE_SPARC32_DMA_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(DMADeviceState, SPARC32_DMA_DEVICE)
 
 
 struct DMADeviceState {
@@ -25,9 +23,7 @@ struct DMADeviceState {
 };
 
 #define TYPE_SPARC32_ESPDMA_DEVICE "sparc32-espdma"
-typedef struct ESPDMADeviceState ESPDMADeviceState;
-DECLARE_INSTANCE_CHECKER(ESPDMADeviceState, SPARC32_ESPDMA_DEVICE,
-                         TYPE_SPARC32_ESPDMA_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(ESPDMADeviceState, SPARC32_ESPDMA_DEVICE)
 
 struct ESPDMADeviceState {
     DMADeviceState parent_obj;
@@ -36,9 +32,7 @@ struct ESPDMADeviceState {
 };
 
 #define TYPE_SPARC32_LEDMA_DEVICE "sparc32-ledma"
-typedef struct LEDMADeviceState LEDMADeviceState;
-DECLARE_INSTANCE_CHECKER(LEDMADeviceState, SPARC32_LEDMA_DEVICE,
-                         TYPE_SPARC32_LEDMA_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(LEDMADeviceState, SPARC32_LEDMA_DEVICE)
 
 struct LEDMADeviceState {
     DMADeviceState parent_obj;
@@ -47,9 +41,7 @@ struct LEDMADeviceState {
 };
 
 #define TYPE_SPARC32_DMA "sparc32-dma"
-typedef struct SPARC32DMAState SPARC32DMAState;
-DECLARE_INSTANCE_CHECKER(SPARC32DMAState, SPARC32_DMA,
-                         TYPE_SPARC32_DMA)
+OBJECT_DECLARE_SIMPLE_TYPE(SPARC32DMAState, SPARC32_DMA)
 
 struct SPARC32DMAState {
     SysBusDevice parent_obj;
diff --git a/include/hw/ssi/imx_spi.h b/include/hw/ssi/imx_spi.h
index 874fea492d..b82b17f364 100644
--- a/include/hw/ssi/imx_spi.h
+++ b/include/hw/ssi/imx_spi.h
@@ -78,9 +78,7 @@
 #define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)
 
 #define TYPE_IMX_SPI "imx.spi"
-typedef struct IMXSPIState IMXSPIState;
-DECLARE_INSTANCE_CHECKER(IMXSPIState, IMX_SPI,
-                         TYPE_IMX_SPI)
+OBJECT_DECLARE_SIMPLE_TYPE(IMXSPIState, IMX_SPI)
 
 struct IMXSPIState {
     /* <private> */
diff --git a/include/hw/ssi/mss-spi.h b/include/hw/ssi/mss-spi.h
index 7c16cf6b49..ce6279c431 100644
--- a/include/hw/ssi/mss-spi.h
+++ b/include/hw/ssi/mss-spi.h
@@ -31,9 +31,7 @@
 #include "qom/object.h"
 
 #define TYPE_MSS_SPI   "mss-spi"
-typedef struct MSSSpiState MSSSpiState;
-DECLARE_INSTANCE_CHECKER(MSSSpiState, MSS_SPI,
-                         TYPE_MSS_SPI)
+OBJECT_DECLARE_SIMPLE_TYPE(MSSSpiState, MSS_SPI)
 
 #define R_SPI_MAX             16
 
diff --git a/include/hw/ssi/pl022.h b/include/hw/ssi/pl022.h
index 1f5da7cc44..545b52689c 100644
--- a/include/hw/ssi/pl022.h
+++ b/include/hw/ssi/pl022.h
@@ -25,9 +25,7 @@
 #include "qom/object.h"
 
 #define TYPE_PL022 "pl022"
-typedef struct PL022State PL022State;
-DECLARE_INSTANCE_CHECKER(PL022State, PL022,
-                         TYPE_PL022)
+OBJECT_DECLARE_SIMPLE_TYPE(PL022State, PL022)
 
 struct PL022State {
     SysBusDevice parent_obj;
diff --git a/include/hw/ssi/stm32f2xx_spi.h b/include/hw/ssi/stm32f2xx_spi.h
index 4bb36d04ed..3683b4ad32 100644
--- a/include/hw/ssi/stm32f2xx_spi.h
+++ b/include/hw/ssi/stm32f2xx_spi.h
@@ -45,9 +45,7 @@
 #define STM_SPI_SR_RXNE   1
 
 #define TYPE_STM32F2XX_SPI "stm32f2xx-spi"
-typedef struct STM32F2XXSPIState STM32F2XXSPIState;
-DECLARE_INSTANCE_CHECKER(STM32F2XXSPIState, STM32F2XX_SPI,
-                         TYPE_STM32F2XX_SPI)
+OBJECT_DECLARE_SIMPLE_TYPE(STM32F2XXSPIState, STM32F2XX_SPI)
 
 struct STM32F2XXSPIState {
     /* <private> */
diff --git a/include/hw/ssi/xilinx_spips.h b/include/hw/ssi/xilinx_spips.h
index a2bf2cf3c7..b96de21b34 100644
--- a/include/hw/ssi/xilinx_spips.h
+++ b/include/hw/ssi/xilinx_spips.h
@@ -120,7 +120,6 @@ struct XlnxZynqMPQSPIPS {
     uint32_t dma_burst_size;
     uint8_t dma_buf[QSPI_DMA_MAX_BURST_SIZE];
 };
-typedef struct XlnxZynqMPQSPIPS XlnxZynqMPQSPIPS;
 
 struct XilinxSPIPSClass {
     SysBusDeviceClass parent_class;
@@ -137,10 +136,8 @@ struct XilinxSPIPSClass {
 
 OBJECT_DECLARE_TYPE(XilinxSPIPS, XilinxSPIPSClass, XILINX_SPIPS)
 
-DECLARE_INSTANCE_CHECKER(XilinxQSPIPS, XILINX_QSPIPS,
-                         TYPE_XILINX_QSPIPS)
+OBJECT_DECLARE_SIMPLE_TYPE(XilinxQSPIPS, XILINX_QSPIPS)
 
-DECLARE_INSTANCE_CHECKER(XlnxZynqMPQSPIPS, XLNX_ZYNQMP_QSPIPS,
-                         TYPE_XLNX_ZYNQMP_QSPIPS)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPQSPIPS, XLNX_ZYNQMP_QSPIPS)
 
 #endif /* XILINX_SPIPS_H */
diff --git a/include/hw/timer/a9gtimer.h b/include/hw/timer/a9gtimer.h
index f6fcc4bfc6..6ae9122e4b 100644
--- a/include/hw/timer/a9gtimer.h
+++ b/include/hw/timer/a9gtimer.h
@@ -29,9 +29,7 @@
 #define A9_GTIMER_MAX_CPUS 4
 
 #define TYPE_A9_GTIMER "arm.cortex-a9-global-timer"
-typedef struct A9GTimerState A9GTimerState;
-DECLARE_INSTANCE_CHECKER(A9GTimerState, A9_GTIMER,
-                         TYPE_A9_GTIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(A9GTimerState, A9_GTIMER)
 
 #define R_COUNTER_LO                0x00
 #define R_COUNTER_HI                0x04
diff --git a/include/hw/timer/allwinner-a10-pit.h b/include/hw/timer/allwinner-a10-pit.h
index 9638e3c84c..8435758ad6 100644
--- a/include/hw/timer/allwinner-a10-pit.h
+++ b/include/hw/timer/allwinner-a10-pit.h
@@ -6,9 +6,7 @@
 #include "qom/object.h"
 
 #define TYPE_AW_A10_PIT "allwinner-A10-timer"
-typedef struct AwA10PITState AwA10PITState;
-DECLARE_INSTANCE_CHECKER(AwA10PITState, AW_A10_PIT,
-                         TYPE_AW_A10_PIT)
+OBJECT_DECLARE_SIMPLE_TYPE(AwA10PITState, AW_A10_PIT)
 
 #define AW_A10_PIT_TIMER_NR    6
 #define AW_A10_PIT_TIMER_IRQ   0x1
diff --git a/include/hw/timer/arm_mptimer.h b/include/hw/timer/arm_mptimer.h
index 47d5e51686..65a96e2a0d 100644
--- a/include/hw/timer/arm_mptimer.h
+++ b/include/hw/timer/arm_mptimer.h
@@ -36,9 +36,7 @@ typedef struct {
 } TimerBlock;
 
 #define TYPE_ARM_MPTIMER "arm_mptimer"
-typedef struct ARMMPTimerState ARMMPTimerState;
-DECLARE_INSTANCE_CHECKER(ARMMPTimerState, ARM_MPTIMER,
-                         TYPE_ARM_MPTIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(ARMMPTimerState, ARM_MPTIMER)
 
 struct ARMMPTimerState {
     /*< private >*/
diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
index b605688fee..97cb345ddb 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -17,9 +17,7 @@
 
 #define TYPE_SYSTICK "armv7m_systick"
 
-typedef struct SysTickState SysTickState;
-DECLARE_INSTANCE_CHECKER(SysTickState, SYSTICK,
-                         TYPE_SYSTICK)
+OBJECT_DECLARE_SIMPLE_TYPE(SysTickState, SYSTICK)
 
 struct SysTickState {
     /*< private >*/
diff --git a/include/hw/timer/avr_timer16.h b/include/hw/timer/avr_timer16.h
index d454bb31cb..0536254337 100644
--- a/include/hw/timer/avr_timer16.h
+++ b/include/hw/timer/avr_timer16.h
@@ -42,9 +42,7 @@ enum NextInterrupt {
 };
 
 #define TYPE_AVR_TIMER16 "avr-timer16"
-typedef struct AVRTimer16State AVRTimer16State;
-DECLARE_INSTANCE_CHECKER(AVRTimer16State, AVR_TIMER16,
-                         TYPE_AVR_TIMER16)
+OBJECT_DECLARE_SIMPLE_TYPE(AVRTimer16State, AVR_TIMER16)
 
 struct AVRTimer16State {
     /* <private> */
diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835_systmr.h
index 64166bd712..7ce8f6ef4d 100644
--- a/include/hw/timer/bcm2835_systmr.h
+++ b/include/hw/timer/bcm2835_systmr.h
@@ -14,9 +14,7 @@
 #include "qom/object.h"
 
 #define TYPE_BCM2835_SYSTIMER "bcm2835-sys-timer"
-typedef struct BCM2835SystemTimerState BCM2835SystemTimerState;
-DECLARE_INSTANCE_CHECKER(BCM2835SystemTimerState, BCM2835_SYSTIMER,
-                         TYPE_BCM2835_SYSTIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835SystemTimerState, BCM2835_SYSTIMER)
 
 struct BCM2835SystemTimerState {
     /*< private >*/
diff --git a/include/hw/timer/cmsdk-apb-dualtimer.h b/include/hw/timer/cmsdk-apb-dualtimer.h
index 7a5b9df5e5..08d9e6fa3d 100644
--- a/include/hw/timer/cmsdk-apb-dualtimer.h
+++ b/include/hw/timer/cmsdk-apb-dualtimer.h
@@ -31,9 +31,7 @@
 #include "qom/object.h"
 
 #define TYPE_CMSDK_APB_DUALTIMER "cmsdk-apb-dualtimer"
-typedef struct CMSDKAPBDualTimer CMSDKAPBDualTimer;
-DECLARE_INSTANCE_CHECKER(CMSDKAPBDualTimer, CMSDK_APB_DUALTIMER,
-                         TYPE_CMSDK_APB_DUALTIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBDualTimer, CMSDK_APB_DUALTIMER)
 
 
 /* One of the two identical timer modules in the dual-timer module */
diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index 0912bc0f3c..0d80b2a48c 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -18,9 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_CMSDK_APB_TIMER "cmsdk-apb-timer"
-typedef struct CMSDKAPBTIMER CMSDKAPBTIMER;
-DECLARE_INSTANCE_CHECKER(CMSDKAPBTIMER, CMSDK_APB_TIMER,
-                         TYPE_CMSDK_APB_TIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBTIMER, CMSDK_APB_TIMER)
 
 struct CMSDKAPBTIMER {
     /*< private >*/
diff --git a/include/hw/timer/digic-timer.h b/include/hw/timer/digic-timer.h
index 84a0ef473a..da82fb4663 100644
--- a/include/hw/timer/digic-timer.h
+++ b/include/hw/timer/digic-timer.h
@@ -23,9 +23,7 @@
 #include "qom/object.h"
 
 #define TYPE_DIGIC_TIMER "digic-timer"
-typedef struct DigicTimerState DigicTimerState;
-DECLARE_INSTANCE_CHECKER(DigicTimerState, DIGIC_TIMER,
-                         TYPE_DIGIC_TIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(DigicTimerState, DIGIC_TIMER)
 
 #define DIGIC_TIMER_CONTROL 0x00
 #define DIGIC_TIMER_CONTROL_RST 0x80000000
diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index 39bcf81331..2acc41e982 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -56,9 +56,7 @@
 #define EPIT_TIMER_MAX  0XFFFFFFFFUL
 
 #define TYPE_IMX_EPIT "imx.epit"
-typedef struct IMXEPITState IMXEPITState;
-DECLARE_INSTANCE_CHECKER(IMXEPITState, IMX_EPIT,
-                         TYPE_IMX_EPIT)
+OBJECT_DECLARE_SIMPLE_TYPE(IMXEPITState, IMX_EPIT)
 
 struct IMXEPITState {
     /*< private >*/
diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer.h
index d207bae2c0..da38512904 100644
--- a/include/hw/timer/mss-timer.h
+++ b/include/hw/timer/mss-timer.h
@@ -30,9 +30,7 @@
 #include "qom/object.h"
 
 #define TYPE_MSS_TIMER     "mss-timer"
-typedef struct MSSTimerState MSSTimerState;
-DECLARE_INSTANCE_CHECKER(MSSTimerState, MSS_TIMER,
-                         TYPE_MSS_TIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(MSSTimerState, MSS_TIMER)
 
 /*
  * There are two 32-bit down counting timers.
diff --git a/include/hw/timer/nrf51_timer.h b/include/hw/timer/nrf51_timer.h
index 4261a03b95..76827c11dc 100644
--- a/include/hw/timer/nrf51_timer.h
+++ b/include/hw/timer/nrf51_timer.h
@@ -17,9 +17,7 @@
 #include "qemu/timer.h"
 #include "qom/object.h"
 #define TYPE_NRF51_TIMER "nrf51_soc.timer"
-typedef struct NRF51TimerState NRF51TimerState;
-DECLARE_INSTANCE_CHECKER(NRF51TimerState, NRF51_TIMER,
-                         TYPE_NRF51_TIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(NRF51TimerState, NRF51_TIMER)
 
 #define NRF51_TIMER_REG_COUNT 4
 
diff --git a/include/hw/usb.h b/include/hw/usb.h
index 355745c23a..a70a72e917 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -175,7 +175,6 @@
 
 #define USB_INTERFACE_INVALID         255
 
-typedef struct USBBus USBBus;
 typedef struct USBBusOps USBBusOps;
 typedef struct USBPort USBPort;
 typedef struct USBDevice USBDevice;
@@ -473,8 +472,7 @@ bool usb_host_dev_is_scsi_storage(USBDevice *usbdev);
 /* usb-bus.c */
 
 #define TYPE_USB_BUS "usb-bus"
-DECLARE_INSTANCE_CHECKER(USBBus, USB_BUS,
-                         TYPE_USB_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(USBBus, USB_BUS)
 
 struct USBBus {
     BusState qbus;
diff --git a/include/hw/usb/chipidea.h b/include/hw/usb/chipidea.h
index f0303b8721..fe4113ee01 100644
--- a/include/hw/usb/chipidea.h
+++ b/include/hw/usb/chipidea.h
@@ -10,10 +10,8 @@ struct ChipideaState {
 
     MemoryRegion iomem[3];
 };
-typedef struct ChipideaState ChipideaState;
 
 #define TYPE_CHIPIDEA "usb-chipidea"
-DECLARE_INSTANCE_CHECKER(ChipideaState, CHIPIDEA,
-                         TYPE_CHIPIDEA)
+OBJECT_DECLARE_SIMPLE_TYPE(ChipideaState, CHIPIDEA)
 
 #endif /* CHIPIDEA_H */
diff --git a/include/hw/usb/imx-usb-phy.h b/include/hw/usb/imx-usb-phy.h
index f7f92fc462..d1e867b77a 100644
--- a/include/hw/usb/imx-usb-phy.h
+++ b/include/hw/usb/imx-usb-phy.h
@@ -39,9 +39,7 @@ enum IMXUsbPhyRegisters {
 #define USBPHY_CTRL_SFTRST BIT(31)
 
 #define TYPE_IMX_USBPHY "imx.usbphy"
-typedef struct IMXUSBPHYState IMXUSBPHYState;
-DECLARE_INSTANCE_CHECKER(IMXUSBPHYState, IMX_USBPHY,
-                         TYPE_IMX_USBPHY)
+OBJECT_DECLARE_SIMPLE_TYPE(IMXUSBPHYState, IMX_USBPHY)
 
 struct IMXUSBPHYState {
     /* <private> */
diff --git a/include/hw/virtio/vhost-scsi-common.h b/include/hw/virtio/vhost-scsi-common.h
index 5f0bf73d9d..0c8909d12a 100644
--- a/include/hw/virtio/vhost-scsi-common.h
+++ b/include/hw/virtio/vhost-scsi-common.h
@@ -20,9 +20,7 @@
 #include "qom/object.h"
 
 #define TYPE_VHOST_SCSI_COMMON "vhost-scsi-common"
-typedef struct VHostSCSICommon VHostSCSICommon;
-DECLARE_INSTANCE_CHECKER(VHostSCSICommon, VHOST_SCSI_COMMON,
-                         TYPE_VHOST_SCSI_COMMON)
+OBJECT_DECLARE_SIMPLE_TYPE(VHostSCSICommon, VHOST_SCSI_COMMON)
 
 struct VHostSCSICommon {
     VirtIOSCSICommon parent_obj;
diff --git a/include/hw/virtio/vhost-scsi.h b/include/hw/virtio/vhost-scsi.h
index 7a77644150..7dc2bdd69d 100644
--- a/include/hw/virtio/vhost-scsi.h
+++ b/include/hw/virtio/vhost-scsi.h
@@ -26,9 +26,7 @@ enum vhost_scsi_vq_list {
 };
 
 #define TYPE_VHOST_SCSI "vhost-scsi"
-typedef struct VHostSCSI VHostSCSI;
-DECLARE_INSTANCE_CHECKER(VHostSCSI, VHOST_SCSI,
-                         TYPE_VHOST_SCSI)
+OBJECT_DECLARE_SIMPLE_TYPE(VHostSCSI, VHOST_SCSI)
 
 struct VHostSCSI {
     VHostSCSICommon parent_obj;
diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost-user-blk.h
index dc40ab6f11..f536576d20 100644
--- a/include/hw/virtio/vhost-user-blk.h
+++ b/include/hw/virtio/vhost-user-blk.h
@@ -23,9 +23,7 @@
 #include "qom/object.h"
 
 #define TYPE_VHOST_USER_BLK "vhost-user-blk"
-typedef struct VHostUserBlk VHostUserBlk;
-DECLARE_INSTANCE_CHECKER(VHostUserBlk, VHOST_USER_BLK,
-                         TYPE_VHOST_USER_BLK)
+OBJECT_DECLARE_SIMPLE_TYPE(VHostUserBlk, VHOST_USER_BLK)
 
 #define VHOST_USER_BLK_AUTO_NUM_QUEUES UINT16_MAX
 
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 9033e6f902..6985752771 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -21,9 +21,7 @@
 #include "qom/object.h"
 
 #define TYPE_VHOST_USER_FS "vhost-user-fs-device"
-typedef struct VHostUserFS VHostUserFS;
-DECLARE_INSTANCE_CHECKER(VHostUserFS, VHOST_USER_FS,
-                         TYPE_VHOST_USER_FS)
+OBJECT_DECLARE_SIMPLE_TYPE(VHostUserFS, VHOST_USER_FS)
 
 typedef struct {
     CharBackend chardev;
diff --git a/include/hw/virtio/vhost-user-scsi.h b/include/hw/virtio/vhost-user-scsi.h
index 342d67ee9e..521b08e559 100644
--- a/include/hw/virtio/vhost-user-scsi.h
+++ b/include/hw/virtio/vhost-user-scsi.h
@@ -24,9 +24,7 @@
 #include "qom/object.h"
 
 #define TYPE_VHOST_USER_SCSI "vhost-user-scsi"
-typedef struct VHostUserSCSI VHostUserSCSI;
-DECLARE_INSTANCE_CHECKER(VHostUserSCSI, VHOST_USER_SCSI,
-                         TYPE_VHOST_USER_SCSI)
+OBJECT_DECLARE_SIMPLE_TYPE(VHostUserSCSI, VHOST_USER_SCSI)
 
 struct VHostUserSCSI {
     VHostSCSICommon parent_obj;
diff --git a/include/hw/virtio/vhost-user-vsock.h b/include/hw/virtio/vhost-user-vsock.h
index b3c40c16a3..4cfd558245 100644
--- a/include/hw/virtio/vhost-user-vsock.h
+++ b/include/hw/virtio/vhost-user-vsock.h
@@ -17,9 +17,7 @@
 #include "qom/object.h"
 
 #define TYPE_VHOST_USER_VSOCK "vhost-user-vsock-device"
-typedef struct VHostUserVSock VHostUserVSock;
-DECLARE_INSTANCE_CHECKER(VHostUserVSock, VHOST_USER_VSOCK,
-                         TYPE_VHOST_USER_VSOCK)
+OBJECT_DECLARE_SIMPLE_TYPE(VHostUserVSock, VHOST_USER_VSOCK)
 
 typedef struct {
     CharBackend chardev;
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index 60bfb68db1..e412b5ee98 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -16,9 +16,7 @@
 #include "qom/object.h"
 
 #define TYPE_VHOST_VSOCK_COMMON "vhost-vsock-common"
-typedef struct VHostVSockCommon VHostVSockCommon;
-DECLARE_INSTANCE_CHECKER(VHostVSockCommon, VHOST_VSOCK_COMMON,
-                         TYPE_VHOST_VSOCK_COMMON)
+OBJECT_DECLARE_SIMPLE_TYPE(VHostVSockCommon, VHOST_VSOCK_COMMON)
 
 enum {
     VHOST_VSOCK_SAVEVM_VERSION = 0,
diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
index c561cc427a..84f4e727c7 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -18,9 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_VHOST_VSOCK "vhost-vsock-device"
-typedef struct VHostVSock VHostVSock;
-DECLARE_INSTANCE_CHECKER(VHostVSock, VHOST_VSOCK,
-                         TYPE_VHOST_VSOCK)
+OBJECT_DECLARE_SIMPLE_TYPE(VHostVSock, VHOST_VSOCK)
 
 typedef struct {
     uint64_t guest_cid;
diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
index 0d08f496d9..5139cf8ab6 100644
--- a/include/hw/virtio/virtio-balloon.h
+++ b/include/hw/virtio/virtio-balloon.h
@@ -21,9 +21,7 @@
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_BALLOON "virtio-balloon-device"
-typedef struct VirtIOBalloon VirtIOBalloon;
-DECLARE_INSTANCE_CHECKER(VirtIOBalloon, VIRTIO_BALLOON,
-                         TYPE_VIRTIO_BALLOON)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOBalloon, VIRTIO_BALLOON)
 
 #define VIRTIO_BALLOON_FREE_PAGE_HINT_CMD_ID_MIN 0x80000000
 
diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index 29c9f32353..5953cf8961 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -22,9 +22,7 @@
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_BLK "virtio-blk-device"
-typedef struct VirtIOBlock VirtIOBlock;
-DECLARE_INSTANCE_CHECKER(VirtIOBlock, VIRTIO_BLK,
-                         TYPE_VIRTIO_BLK)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOBlock, VIRTIO_BLK)
 
 /* This is the last element of the write scatter-gather list */
 struct virtio_blk_inhdr
diff --git a/include/hw/virtio/virtio-crypto.h b/include/hw/virtio/virtio-crypto.h
index 7969695983..a2228d7b2e 100644
--- a/include/hw/virtio/virtio-crypto.h
+++ b/include/hw/virtio/virtio-crypto.h
@@ -32,9 +32,7 @@ do { \
 
 
 #define TYPE_VIRTIO_CRYPTO "virtio-crypto-device"
-typedef struct VirtIOCrypto VirtIOCrypto;
-DECLARE_INSTANCE_CHECKER(VirtIOCrypto, VIRTIO_CRYPTO,
-                         TYPE_VIRTIO_CRYPTO)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOCrypto, VIRTIO_CRYPTO)
 #define VIRTIO_CRYPTO_GET_PARENT_CLASS(obj) \
         OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_CRYPTO)
 
diff --git a/include/hw/virtio/virtio-gpu-pci.h b/include/hw/virtio/virtio-gpu-pci.h
index 5201792ede..225cbbc2e4 100644
--- a/include/hw/virtio/virtio-gpu-pci.h
+++ b/include/hw/virtio/virtio-gpu-pci.h
@@ -18,14 +18,12 @@
 #include "hw/virtio/virtio-gpu.h"
 #include "qom/object.h"
 
-typedef struct VirtIOGPUPCIBase VirtIOGPUPCIBase;
 
 /*
  * virtio-gpu-pci-base: This extends VirtioPCIProxy.
  */
 #define TYPE_VIRTIO_GPU_PCI_BASE "virtio-gpu-pci-base"
-DECLARE_INSTANCE_CHECKER(VirtIOGPUPCIBase, VIRTIO_GPU_PCI_BASE,
-                         TYPE_VIRTIO_GPU_PCI_BASE)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPUPCIBase, VIRTIO_GPU_PCI_BASE)
 
 struct VirtIOGPUPCIBase {
     VirtIOPCIProxy parent_obj;
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 7ef405975a..455e0a7433 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -29,14 +29,10 @@ OBJECT_DECLARE_TYPE(VirtIOGPUBase, VirtIOGPUBaseClass,
                     VIRTIO_GPU_BASE)
 
 #define TYPE_VIRTIO_GPU "virtio-gpu-device"
-typedef struct VirtIOGPU VirtIOGPU;
-DECLARE_INSTANCE_CHECKER(VirtIOGPU, VIRTIO_GPU,
-                         TYPE_VIRTIO_GPU)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPU, VIRTIO_GPU)
 
 #define TYPE_VHOST_USER_GPU "vhost-user-gpu"
-typedef struct VhostUserGPU VhostUserGPU;
-DECLARE_INSTANCE_CHECKER(VhostUserGPU, VHOST_USER_GPU,
-                         TYPE_VHOST_USER_GPU)
+OBJECT_DECLARE_SIMPLE_TYPE(VhostUserGPU, VHOST_USER_GPU)
 
 #define VIRTIO_ID_GPU 16
 
diff --git a/include/hw/virtio/virtio-input.h b/include/hw/virtio/virtio-input.h
index 91df34b534..f2da63d309 100644
--- a/include/hw/virtio/virtio-input.h
+++ b/include/hw/virtio/virtio-input.h
@@ -29,23 +29,17 @@ OBJECT_DECLARE_TYPE(VirtIOInput, VirtIOInputClass,
 #define TYPE_VIRTIO_MOUSE     "virtio-mouse-device"
 #define TYPE_VIRTIO_TABLET    "virtio-tablet-device"
 
-typedef struct VirtIOInputHID VirtIOInputHID;
-DECLARE_INSTANCE_CHECKER(VirtIOInputHID, VIRTIO_INPUT_HID,
-                         TYPE_VIRTIO_INPUT_HID)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputHID, VIRTIO_INPUT_HID)
 #define VIRTIO_INPUT_HID_GET_PARENT_CLASS(obj) \
         OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_INPUT_HID)
 
 #define TYPE_VIRTIO_INPUT_HOST   "virtio-input-host-device"
-typedef struct VirtIOInputHost VirtIOInputHost;
-DECLARE_INSTANCE_CHECKER(VirtIOInputHost, VIRTIO_INPUT_HOST,
-                         TYPE_VIRTIO_INPUT_HOST)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputHost, VIRTIO_INPUT_HOST)
 #define VIRTIO_INPUT_HOST_GET_PARENT_CLASS(obj) \
         OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_INPUT_HOST)
 
 #define TYPE_VHOST_USER_INPUT   "vhost-user-input"
-typedef struct VHostUserInput VHostUserInput;
-DECLARE_INSTANCE_CHECKER(VHostUserInput, VHOST_USER_INPUT,
-                         TYPE_VHOST_USER_INPUT)
+OBJECT_DECLARE_SIMPLE_TYPE(VHostUserInput, VHOST_USER_INPUT)
 #define VHOST_USER_INPUT_GET_PARENT_CLASS(obj)             \
     OBJECT_GET_PARENT_CLASS(obj, TYPE_VHOST_USER_INPUT)
 
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index ae9dc566c7..273e35c04b 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -27,9 +27,7 @@
 
 #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
 #define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-device-base"
-typedef struct VirtIOIOMMU VirtIOIOMMU;
-DECLARE_INSTANCE_CHECKER(VirtIOIOMMU, VIRTIO_IOMMU,
-                         TYPE_VIRTIO_IOMMU)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOIOMMU, VIRTIO_IOMMU)
 
 #define TYPE_VIRTIO_IOMMU_MEMORY_REGION "virtio-iommu-memory-region"
 
diff --git a/include/hw/virtio/virtio-mmio.h b/include/hw/virtio/virtio-mmio.h
index 6a1c2c20d4..d4c4c386ab 100644
--- a/include/hw/virtio/virtio-mmio.h
+++ b/include/hw/virtio/virtio-mmio.h
@@ -34,9 +34,7 @@ DECLARE_OBJ_CHECKERS(VirtioBusState, VirtioBusClass,
 
 /* virtio-mmio */
 #define TYPE_VIRTIO_MMIO "virtio-mmio"
-typedef struct VirtIOMMIOProxy VirtIOMMIOProxy;
-DECLARE_INSTANCE_CHECKER(VirtIOMMIOProxy, VIRTIO_MMIO,
-                         TYPE_VIRTIO_MMIO)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOMMIOProxy, VIRTIO_MMIO)
 
 #define VIRT_MAGIC 0x74726976 /* 'virt' */
 #define VIRT_VERSION 2
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 929ed232dd..f4852ac27b 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -22,9 +22,7 @@
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_NET "virtio-net-device"
-typedef struct VirtIONet VirtIONet;
-DECLARE_INSTANCE_CHECKER(VirtIONet, VIRTIO_NET,
-                         TYPE_VIRTIO_NET)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIONet, VIRTIO_NET)
 
 #define TX_TIMER_INTERVAL 150000 /* 150 us */
 
diff --git a/include/hw/virtio/virtio-rng.h b/include/hw/virtio/virtio-rng.h
index 3671c9ba19..82734255d9 100644
--- a/include/hw/virtio/virtio-rng.h
+++ b/include/hw/virtio/virtio-rng.h
@@ -18,9 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_RNG "virtio-rng-device"
-typedef struct VirtIORNG VirtIORNG;
-DECLARE_INSTANCE_CHECKER(VirtIORNG, VIRTIO_RNG,
-                         TYPE_VIRTIO_RNG)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIORNG, VIRTIO_RNG)
 #define VIRTIO_RNG_GET_PARENT_CLASS(obj) \
         OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_RNG)
 
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index 9a8a06fdd1..543681bc18 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -26,14 +26,10 @@
 #include "sysemu/iothread.h"
 
 #define TYPE_VIRTIO_SCSI_COMMON "virtio-scsi-common"
-typedef struct VirtIOSCSICommon VirtIOSCSICommon;
-DECLARE_INSTANCE_CHECKER(VirtIOSCSICommon, VIRTIO_SCSI_COMMON,
-                         TYPE_VIRTIO_SCSI_COMMON)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOSCSICommon, VIRTIO_SCSI_COMMON)
 
 #define TYPE_VIRTIO_SCSI "virtio-scsi-device"
-typedef struct VirtIOSCSI VirtIOSCSI;
-DECLARE_INSTANCE_CHECKER(VirtIOSCSI, VIRTIO_SCSI,
-                         TYPE_VIRTIO_SCSI)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOSCSI, VIRTIO_SCSI)
 
 #define VIRTIO_SCSI_MAX_CHANNEL 0
 #define VIRTIO_SCSI_MAX_TARGET  255
diff --git a/include/hw/virtio/virtio-serial.h b/include/hw/virtio/virtio-serial.h
index 17359918f7..d87c62eab7 100644
--- a/include/hw/virtio/virtio-serial.h
+++ b/include/hw/virtio/virtio-serial.h
@@ -32,9 +32,7 @@ OBJECT_DECLARE_TYPE(VirtIOSerialPort, VirtIOSerialPortClass,
 typedef struct VirtIOSerial VirtIOSerial;
 
 #define TYPE_VIRTIO_SERIAL_BUS "virtio-serial-bus"
-typedef struct VirtIOSerialBus VirtIOSerialBus;
-DECLARE_INSTANCE_CHECKER(VirtIOSerialBus, VIRTIO_SERIAL_BUS,
-                         TYPE_VIRTIO_SERIAL_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOSerialBus, VIRTIO_SERIAL_BUS)
 
 
 struct VirtIOSerialPortClass {
@@ -224,7 +222,6 @@ size_t virtio_serial_guest_ready(VirtIOSerialPort *port);
 void virtio_serial_throttle_port(VirtIOSerialPort *port, bool throttle);
 
 #define TYPE_VIRTIO_SERIAL "virtio-serial-device"
-DECLARE_INSTANCE_CHECKER(VirtIOSerial, VIRTIO_SERIAL,
-                         TYPE_VIRTIO_SERIAL)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOSerial, VIRTIO_SERIAL)
 
 #endif
diff --git a/include/hw/watchdog/cmsdk-apb-watchdog.h b/include/hw/watchdog/cmsdk-apb-watchdog.h
index 63f4becf86..3da0d43e35 100644
--- a/include/hw/watchdog/cmsdk-apb-watchdog.h
+++ b/include/hw/watchdog/cmsdk-apb-watchdog.h
@@ -36,9 +36,7 @@
 #include "qom/object.h"
 
 #define TYPE_CMSDK_APB_WATCHDOG "cmsdk-apb-watchdog"
-typedef struct CMSDKAPBWatchdog CMSDKAPBWatchdog;
-DECLARE_INSTANCE_CHECKER(CMSDKAPBWatchdog, CMSDK_APB_WATCHDOG,
-                         TYPE_CMSDK_APB_WATCHDOG)
+OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBWatchdog, CMSDK_APB_WATCHDOG)
 
 /*
  * This shares the same struct (and cast macro) as the base
diff --git a/include/hw/watchdog/wdt_imx2.h b/include/hw/watchdog/wdt_imx2.h
index 7665d93640..023d83f48f 100644
--- a/include/hw/watchdog/wdt_imx2.h
+++ b/include/hw/watchdog/wdt_imx2.h
@@ -19,9 +19,7 @@
 #include "qom/object.h"
 
 #define TYPE_IMX2_WDT "imx2.wdt"
-typedef struct IMX2WdtState IMX2WdtState;
-DECLARE_INSTANCE_CHECKER(IMX2WdtState, IMX2_WDT,
-                         TYPE_IMX2_WDT)
+OBJECT_DECLARE_SIMPLE_TYPE(IMX2WdtState, IMX2_WDT)
 
 enum IMX2WdtRegisters {
     IMX2_WDT_WCR  = 0x0000, /* Control Register */
diff --git a/include/hw/xen/xen-block.h b/include/hw/xen/xen-block.h
index a74fd9384f..d692ea7580 100644
--- a/include/hw/xen/xen-block.h
+++ b/include/hw/xen/xen-block.h
@@ -75,19 +75,15 @@ OBJECT_DECLARE_TYPE(XenBlockDevice, XenBlockDeviceClass, XEN_BLOCK_DEVICE)
 struct XenDiskDevice {
     XenBlockDevice blockdev;
 };
-typedef struct XenDiskDevice XenDiskDevice;
 
 #define TYPE_XEN_DISK_DEVICE  "xen-disk"
-DECLARE_INSTANCE_CHECKER(XenDiskDevice, XEN_DISK_DEVICE,
-                         TYPE_XEN_DISK_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(XenDiskDevice, XEN_DISK_DEVICE)
 
 struct XenCDRomDevice {
     XenBlockDevice blockdev;
 };
-typedef struct XenCDRomDevice XenCDRomDevice;
 
 #define TYPE_XEN_CDROM_DEVICE  "xen-cdrom"
-DECLARE_INSTANCE_CHECKER(XenCDRomDevice, XEN_CDROM_DEVICE,
-                         TYPE_XEN_CDROM_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(XenCDRomDevice, XEN_CDROM_DEVICE)
 
 #endif /* HW_XEN_BLOCK_H */
diff --git a/include/io/channel-buffer.h b/include/io/channel-buffer.h
index 89632ef437..518c28f13f 100644
--- a/include/io/channel-buffer.h
+++ b/include/io/channel-buffer.h
@@ -25,9 +25,7 @@
 #include "qom/object.h"
 
 #define TYPE_QIO_CHANNEL_BUFFER "qio-channel-buffer"
-typedef struct QIOChannelBuffer QIOChannelBuffer;
-DECLARE_INSTANCE_CHECKER(QIOChannelBuffer, QIO_CHANNEL_BUFFER,
-                         TYPE_QIO_CHANNEL_BUFFER)
+OBJECT_DECLARE_SIMPLE_TYPE(QIOChannelBuffer, QIO_CHANNEL_BUFFER)
 
 
 /**
diff --git a/include/io/channel-command.h b/include/io/channel-command.h
index 4b64ff011b..5556a38d7e 100644
--- a/include/io/channel-command.h
+++ b/include/io/channel-command.h
@@ -25,9 +25,7 @@
 #include "qom/object.h"
 
 #define TYPE_QIO_CHANNEL_COMMAND "qio-channel-command"
-typedef struct QIOChannelCommand QIOChannelCommand;
-DECLARE_INSTANCE_CHECKER(QIOChannelCommand, QIO_CHANNEL_COMMAND,
-                         TYPE_QIO_CHANNEL_COMMAND)
+OBJECT_DECLARE_SIMPLE_TYPE(QIOChannelCommand, QIO_CHANNEL_COMMAND)
 
 
 
diff --git a/include/io/channel-file.h b/include/io/channel-file.h
index c6caf179d9..c61d6e0ef7 100644
--- a/include/io/channel-file.h
+++ b/include/io/channel-file.h
@@ -25,9 +25,7 @@
 #include "qom/object.h"
 
 #define TYPE_QIO_CHANNEL_FILE "qio-channel-file"
-typedef struct QIOChannelFile QIOChannelFile;
-DECLARE_INSTANCE_CHECKER(QIOChannelFile, QIO_CHANNEL_FILE,
-                         TYPE_QIO_CHANNEL_FILE)
+OBJECT_DECLARE_SIMPLE_TYPE(QIOChannelFile, QIO_CHANNEL_FILE)
 
 
 /**
diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index 62e3e2e970..d07d67fab6 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -27,9 +27,7 @@
 #include "qom/object.h"
 
 #define TYPE_QIO_CHANNEL_SOCKET "qio-channel-socket"
-typedef struct QIOChannelSocket QIOChannelSocket;
-DECLARE_INSTANCE_CHECKER(QIOChannelSocket, QIO_CHANNEL_SOCKET,
-                         TYPE_QIO_CHANNEL_SOCKET)
+OBJECT_DECLARE_SIMPLE_TYPE(QIOChannelSocket, QIO_CHANNEL_SOCKET)
 
 
 /**
diff --git a/include/io/channel-tls.h b/include/io/channel-tls.h
index 036bf54195..6dd1a3cd3c 100644
--- a/include/io/channel-tls.h
+++ b/include/io/channel-tls.h
@@ -27,9 +27,7 @@
 #include "qom/object.h"
 
 #define TYPE_QIO_CHANNEL_TLS "qio-channel-tls"
-typedef struct QIOChannelTLS QIOChannelTLS;
-DECLARE_INSTANCE_CHECKER(QIOChannelTLS, QIO_CHANNEL_TLS,
-                         TYPE_QIO_CHANNEL_TLS)
+OBJECT_DECLARE_SIMPLE_TYPE(QIOChannelTLS, QIO_CHANNEL_TLS)
 
 
 /**
diff --git a/include/io/channel-websock.h b/include/io/channel-websock.h
index b07eddabe1..9c40513e74 100644
--- a/include/io/channel-websock.h
+++ b/include/io/channel-websock.h
@@ -27,9 +27,7 @@
 #include "qom/object.h"
 
 #define TYPE_QIO_CHANNEL_WEBSOCK "qio-channel-websock"
-typedef struct QIOChannelWebsock QIOChannelWebsock;
-DECLARE_INSTANCE_CHECKER(QIOChannelWebsock, QIO_CHANNEL_WEBSOCK,
-                         TYPE_QIO_CHANNEL_WEBSOCK)
+OBJECT_DECLARE_SIMPLE_TYPE(QIOChannelWebsock, QIO_CHANNEL_WEBSOCK)
 
 typedef union QIOChannelWebsockMask QIOChannelWebsockMask;
 
diff --git a/include/net/can_emu.h b/include/net/can_emu.h
index 150f91a657..743c6647c1 100644
--- a/include/net/can_emu.h
+++ b/include/net/can_emu.h
@@ -100,8 +100,7 @@ struct CanBusClientState {
 };
 
 #define TYPE_CAN_BUS "can-bus"
-DECLARE_INSTANCE_CHECKER(CanBusState, CAN_BUS,
-                         TYPE_CAN_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(CanBusState, CAN_BUS)
 
 int can_bus_filter_match(struct qemu_can_filter *filter, qemu_canid_t can_id);
 
diff --git a/include/sysemu/rng-random.h b/include/sysemu/rng-random.h
index 58033ac3fe..0fdc6c6974 100644
--- a/include/sysemu/rng-random.h
+++ b/include/sysemu/rng-random.h
@@ -15,9 +15,7 @@
 #include "qom/object.h"
 
 #define TYPE_RNG_RANDOM "rng-random"
-typedef struct RngRandom RngRandom;
-DECLARE_INSTANCE_CHECKER(RngRandom, RNG_RANDOM,
-                         TYPE_RNG_RANDOM)
+OBJECT_DECLARE_SIMPLE_TYPE(RngRandom, RNG_RANDOM)
 
 
 #endif
diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index f047ad0362..c6edb1b28a 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -35,10 +35,7 @@
  */
 #define TYPE_CRYPTODEV_BACKEND_BUILTIN "cryptodev-backend-builtin"
 
-typedef struct CryptoDevBackendBuiltin
-                         CryptoDevBackendBuiltin;
-DECLARE_INSTANCE_CHECKER(CryptoDevBackendBuiltin, CRYPTODEV_BACKEND_BUILTIN,
-                         TYPE_CRYPTODEV_BACKEND_BUILTIN)
+OBJECT_DECLARE_SIMPLE_TYPE(CryptoDevBackendBuiltin, CRYPTODEV_BACKEND_BUILTIN)
 
 
 typedef struct CryptoDevBackendBuiltinSession {
diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-user.c
index 41089dede1..60ec4908aa 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -39,9 +39,7 @@
  */
 #define TYPE_CRYPTODEV_BACKEND_VHOST_USER "cryptodev-vhost-user"
 
-typedef struct CryptoDevBackendVhostUser CryptoDevBackendVhostUser;
-DECLARE_INSTANCE_CHECKER(CryptoDevBackendVhostUser, CRYPTODEV_BACKEND_VHOST_USER,
-                         TYPE_CRYPTODEV_BACKEND_VHOST_USER)
+OBJECT_DECLARE_SIMPLE_TYPE(CryptoDevBackendVhostUser, CRYPTODEV_BACKEND_VHOST_USER)
 
 
 struct CryptoDevBackendVhostUser {
diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index a3b2e8209e..40e1e5b3e3 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -19,9 +19,7 @@
 #include "qom/object_interfaces.h"
 #include "qom/object.h"
 
-typedef struct HostMemoryBackendFile HostMemoryBackendFile;
-DECLARE_INSTANCE_CHECKER(HostMemoryBackendFile, MEMORY_BACKEND_FILE,
-                         TYPE_MEMORY_BACKEND_FILE)
+OBJECT_DECLARE_SIMPLE_TYPE(HostMemoryBackendFile, MEMORY_BACKEND_FILE)
 
 
 struct HostMemoryBackendFile {
diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 8cf6bcbda2..e5626d4330 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -21,9 +21,7 @@
 
 #define TYPE_MEMORY_BACKEND_MEMFD "memory-backend-memfd"
 
-typedef struct HostMemoryBackendMemfd HostMemoryBackendMemfd;
-DECLARE_INSTANCE_CHECKER(HostMemoryBackendMemfd, MEMORY_BACKEND_MEMFD,
-                         TYPE_MEMORY_BACKEND_MEMFD)
+OBJECT_DECLARE_SIMPLE_TYPE(HostMemoryBackendMemfd, MEMORY_BACKEND_MEMFD)
 
 
 struct HostMemoryBackendMemfd {
diff --git a/backends/rng-builtin.c b/backends/rng-builtin.c
index 459be97a5a..f38dff117d 100644
--- a/backends/rng-builtin.c
+++ b/backends/rng-builtin.c
@@ -11,9 +11,7 @@
 #include "qemu/guest-random.h"
 #include "qom/object.h"
 
-typedef struct RngBuiltin RngBuiltin;
-DECLARE_INSTANCE_CHECKER(RngBuiltin, RNG_BUILTIN,
-                         TYPE_RNG_BUILTIN)
+OBJECT_DECLARE_SIMPLE_TYPE(RngBuiltin, RNG_BUILTIN)
 
 struct RngBuiltin {
     RngBackend parent;
diff --git a/backends/rng-egd.c b/backends/rng-egd.c
index d905fe657c..20198ff26e 100644
--- a/backends/rng-egd.c
+++ b/backends/rng-egd.c
@@ -19,9 +19,7 @@
 #include "qom/object.h"
 
 #define TYPE_RNG_EGD "rng-egd"
-typedef struct RngEgd RngEgd;
-DECLARE_INSTANCE_CHECKER(RngEgd, RNG_EGD,
-                         TYPE_RNG_EGD)
+OBJECT_DECLARE_SIMPLE_TYPE(RngEgd, RNG_EGD)
 
 struct RngEgd {
     RngBackend parent;
diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 13657d9aba..201cd38503 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -45,9 +45,7 @@
 #include "qom/object.h"
 
 #define TYPE_TPM_EMULATOR "tpm-emulator"
-typedef struct TPMEmulator TPMEmulator;
-DECLARE_INSTANCE_CHECKER(TPMEmulator, TPM_EMULATOR,
-                         TYPE_TPM_EMULATOR)
+OBJECT_DECLARE_SIMPLE_TYPE(TPMEmulator, TPM_EMULATOR)
 
 #define TPM_EMULATOR_IMPLEMENTS_ALL_CAPS(S, cap) (((S)->caps & (cap)) == (cap))
 
diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.c
index 10722e0a41..a1f93d4646 100644
--- a/backends/tpm/tpm_passthrough.c
+++ b/backends/tpm/tpm_passthrough.c
@@ -36,9 +36,7 @@
 #include "qom/object.h"
 
 #define TYPE_TPM_PASSTHROUGH "tpm-passthrough"
-typedef struct TPMPassthruState TPMPassthruState;
-DECLARE_INSTANCE_CHECKER(TPMPassthruState, TPM_PASSTHROUGH,
-                         TYPE_TPM_PASSTHROUGH)
+OBJECT_DECLARE_SIMPLE_TYPE(TPMPassthruState, TPM_PASSTHROUGH)
 
 /* data structures */
 struct TPMPassthruState {
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 1574f7db3e..832f8fba82 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -91,10 +91,8 @@ struct PIIX4PMState {
 
     MemHotplugState acpi_memory_hotplug;
 };
-typedef struct PIIX4PMState PIIX4PMState;
 
-DECLARE_INSTANCE_CHECKER(PIIX4PMState, PIIX4_PM,
-                         TYPE_PIIX4_PM)
+OBJECT_DECLARE_SIMPLE_TYPE(PIIX4PMState, PIIX4_PM)
 
 static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
                                            PCIBus *bus, PIIX4PMState *s);
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index d02b14d89f..a42b319812 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -50,9 +50,7 @@ typedef struct TyphoonPchip {
     TyphoonWindow win[4];
 } TyphoonPchip;
 
-typedef struct TyphoonState TyphoonState;
-DECLARE_INSTANCE_CHECKER(TyphoonState, TYPHOON_PCI_HOST_BRIDGE,
-                         TYPE_TYPHOON_PCI_HOST_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(TyphoonState, TYPHOON_PCI_HOST_BRIDGE)
 
 struct TyphoonState {
     PCIHostState parent_obj;
diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index a49f4a1c7c..8df31e2793 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -25,11 +25,9 @@ struct CollieMachineState {
 
     StrongARMState *sa1110;
 };
-typedef struct CollieMachineState CollieMachineState;
 
 #define TYPE_COLLIE_MACHINE MACHINE_TYPE_NAME("collie")
-DECLARE_INSTANCE_CHECKER(CollieMachineState, COLLIE_MACHINE,
-                         TYPE_COLLIE_MACHINE)
+OBJECT_DECLARE_SIMPLE_TYPE(CollieMachineState, COLLIE_MACHINE)
 
 static struct arm_boot_info collie_binfo = {
     .loader_start = SA_SDCS0,
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index e2ace803ef..7da984171b 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -156,9 +156,7 @@ static const MemoryRegionOps hb_mem_ops = {
 };
 
 #define TYPE_HIGHBANK_REGISTERS "highbank-regs"
-typedef struct HighbankRegsState HighbankRegsState;
-DECLARE_INSTANCE_CHECKER(HighbankRegsState, HIGHBANK_REGISTERS,
-                         TYPE_HIGHBANK_REGISTERS)
+OBJECT_DECLARE_SIMPLE_TYPE(HighbankRegsState, HIGHBANK_REGISTERS)
 
 struct HighbankRegsState {
     /*< private >*/
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 19989b61b9..de670b08a9 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -29,9 +29,7 @@
 #include "qom/object.h"
 
 #define TYPE_INTEGRATOR_CM "integrator_core"
-typedef struct IntegratorCMState IntegratorCMState;
-DECLARE_INSTANCE_CHECKER(IntegratorCMState, INTEGRATOR_CM,
-                         TYPE_INTEGRATOR_CM)
+OBJECT_DECLARE_SIMPLE_TYPE(IntegratorCMState, INTEGRATOR_CM)
 
 struct IntegratorCMState {
     /*< private >*/
@@ -328,9 +326,7 @@ static void integratorcm_realize(DeviceState *d, Error **errp)
 /* Primary interrupt controller.  */
 
 #define TYPE_INTEGRATOR_PIC "integrator_pic"
-typedef struct icp_pic_state icp_pic_state;
-DECLARE_INSTANCE_CHECKER(icp_pic_state, INTEGRATOR_PIC,
-                         TYPE_INTEGRATOR_PIC)
+OBJECT_DECLARE_SIMPLE_TYPE(icp_pic_state, INTEGRATOR_PIC)
 
 struct icp_pic_state {
     /*< private >*/
@@ -468,9 +464,7 @@ static void icp_pic_init(Object *obj)
 /* CP control registers.  */
 
 #define TYPE_ICP_CONTROL_REGS "icp-ctrl-regs"
-typedef struct ICPCtrlRegsState ICPCtrlRegsState;
-DECLARE_INSTANCE_CHECKER(ICPCtrlRegsState, ICP_CONTROL_REGS,
-                         TYPE_ICP_CONTROL_REGS)
+OBJECT_DECLARE_SIMPLE_TYPE(ICPCtrlRegsState, ICP_CONTROL_REGS)
 
 struct ICPCtrlRegsState {
     /*< private >*/
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index 9a4a3d357a..0947491cb9 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -26,12 +26,10 @@ struct MicrobitMachineState {
     NRF51State nrf51;
     MicrobitI2CState i2c;
 };
-typedef struct MicrobitMachineState MicrobitMachineState;
 
 #define TYPE_MICROBIT_MACHINE MACHINE_TYPE_NAME("microbit")
 
-DECLARE_INSTANCE_CHECKER(MicrobitMachineState, MICROBIT_MACHINE,
-                         TYPE_MICROBIT_MACHINE)
+OBJECT_DECLARE_SIMPLE_TYPE(MicrobitMachineState, MICROBIT_MACHINE)
 
 static void microbit_init(MachineState *machine)
 {
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 2117a04171..5eb3f969fb 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -155,9 +155,7 @@ typedef struct mv88w8618_rx_desc {
 } mv88w8618_rx_desc;
 
 #define TYPE_MV88W8618_ETH "mv88w8618_eth"
-typedef struct mv88w8618_eth_state mv88w8618_eth_state;
-DECLARE_INSTANCE_CHECKER(mv88w8618_eth_state, MV88W8618_ETH,
-                         TYPE_MV88W8618_ETH)
+OBJECT_DECLARE_SIMPLE_TYPE(mv88w8618_eth_state, MV88W8618_ETH)
 
 struct mv88w8618_eth_state {
     /*< private >*/
@@ -485,9 +483,7 @@ static const TypeInfo mv88w8618_eth_info = {
 #define MP_LCD_TEXTCOLOR        0xe0e0ff /* RRGGBB */
 
 #define TYPE_MUSICPAL_LCD "musicpal_lcd"
-typedef struct musicpal_lcd_state musicpal_lcd_state;
-DECLARE_INSTANCE_CHECKER(musicpal_lcd_state, MUSICPAL_LCD,
-                         TYPE_MUSICPAL_LCD)
+OBJECT_DECLARE_SIMPLE_TYPE(musicpal_lcd_state, MUSICPAL_LCD)
 
 struct musicpal_lcd_state {
     /*< private >*/
@@ -703,9 +699,7 @@ static const TypeInfo musicpal_lcd_info = {
 #define MP_PIC_ENABLE_CLR       0x0C
 
 #define TYPE_MV88W8618_PIC "mv88w8618_pic"
-typedef struct mv88w8618_pic_state mv88w8618_pic_state;
-DECLARE_INSTANCE_CHECKER(mv88w8618_pic_state, MV88W8618_PIC,
-                         TYPE_MV88W8618_PIC)
+OBJECT_DECLARE_SIMPLE_TYPE(mv88w8618_pic_state, MV88W8618_PIC)
 
 struct mv88w8618_pic_state {
     /*< private >*/
@@ -841,9 +835,7 @@ typedef struct mv88w8618_timer_state {
 } mv88w8618_timer_state;
 
 #define TYPE_MV88W8618_PIT "mv88w8618_pit"
-typedef struct mv88w8618_pit_state mv88w8618_pit_state;
-DECLARE_INSTANCE_CHECKER(mv88w8618_pit_state, MV88W8618_PIT,
-                         TYPE_MV88W8618_PIT)
+OBJECT_DECLARE_SIMPLE_TYPE(mv88w8618_pit_state, MV88W8618_PIT)
 
 struct mv88w8618_pit_state {
     /*< private >*/
@@ -1009,9 +1001,7 @@ static const TypeInfo mv88w8618_pit_info = {
 #define MP_FLASHCFG_CFGR0    0x04
 
 #define TYPE_MV88W8618_FLASHCFG "mv88w8618_flashcfg"
-typedef struct mv88w8618_flashcfg_state mv88w8618_flashcfg_state;
-DECLARE_INSTANCE_CHECKER(mv88w8618_flashcfg_state, MV88W8618_FLASHCFG,
-                         TYPE_MV88W8618_FLASHCFG)
+OBJECT_DECLARE_SIMPLE_TYPE(mv88w8618_flashcfg_state, MV88W8618_FLASHCFG)
 
 struct mv88w8618_flashcfg_state {
     /*< private >*/
@@ -1100,11 +1090,9 @@ struct MusicPalMiscState {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
 };
-typedef struct MusicPalMiscState MusicPalMiscState;
 
 #define TYPE_MUSICPAL_MISC "musicpal-misc"
-DECLARE_INSTANCE_CHECKER(MusicPalMiscState, MUSICPAL_MISC,
-                         TYPE_MUSICPAL_MISC)
+OBJECT_DECLARE_SIMPLE_TYPE(MusicPalMiscState, MUSICPAL_MISC)
 
 static uint64_t musicpal_misc_read(void *opaque, hwaddr offset,
                                    unsigned size)
@@ -1209,9 +1197,7 @@ static void mv88w8618_wlan_realize(DeviceState *dev, Error **errp)
 #define MP_OE_LCD_BRIGHTNESS    0x0007
 
 #define TYPE_MUSICPAL_GPIO "musicpal_gpio"
-typedef struct musicpal_gpio_state musicpal_gpio_state;
-DECLARE_INSTANCE_CHECKER(musicpal_gpio_state, MUSICPAL_GPIO,
-                         TYPE_MUSICPAL_GPIO)
+OBJECT_DECLARE_SIMPLE_TYPE(musicpal_gpio_state, MUSICPAL_GPIO)
 
 struct musicpal_gpio_state {
     /*< private >*/
@@ -1460,9 +1446,7 @@ static const TypeInfo musicpal_gpio_info = {
 #define MP_KEY_BTN_NAVIGATION  (1 << 7)
 
 #define TYPE_MUSICPAL_KEY "musicpal_key"
-typedef struct musicpal_key_state musicpal_key_state;
-DECLARE_INSTANCE_CHECKER(musicpal_key_state, MUSICPAL_KEY,
-                         TYPE_MUSICPAL_KEY)
+OBJECT_DECLARE_SIMPLE_TYPE(musicpal_key_state, MUSICPAL_KEY)
 
 struct musicpal_key_state {
     /*< private >*/
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index abc6495489..4e3dc5fbbf 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -133,9 +133,7 @@ static void palmte_button_event(void *opaque, int keycode)
  */
 
 #define TYPE_PALM_MISC_GPIO "palm-misc-gpio"
-typedef struct PalmMiscGPIOState PalmMiscGPIOState;
-DECLARE_INSTANCE_CHECKER(PalmMiscGPIOState, PALM_MISC_GPIO,
-                         TYPE_PALM_MISC_GPIO)
+OBJECT_DECLARE_SIMPLE_TYPE(PalmMiscGPIOState, PALM_MISC_GPIO)
 
 struct PalmMiscGPIOState {
     SysBusDevice parent_obj;
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 33074dbf82..591776ba88 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -470,9 +470,7 @@ static const VMStateDescription vmstate_pxa2xx_mm = {
 };
 
 #define TYPE_PXA2XX_SSP "pxa2xx-ssp"
-typedef struct PXA2xxSSPState PXA2xxSSPState;
-DECLARE_INSTANCE_CHECKER(PXA2xxSSPState, PXA2XX_SSP,
-                         TYPE_PXA2XX_SSP)
+OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxSSPState, PXA2XX_SSP)
 
 /* Synchronous Serial Ports */
 struct PXA2xxSSPState {
@@ -811,9 +809,7 @@ static void pxa2xx_ssp_init(Object *obj)
 #define PIAR		0x38	/* RTC Periodic Interrupt Alarm register */
 
 #define TYPE_PXA2XX_RTC "pxa2xx_rtc"
-typedef struct PXA2xxRTCState PXA2xxRTCState;
-DECLARE_INSTANCE_CHECKER(PXA2xxRTCState, PXA2XX_RTC,
-                         TYPE_PXA2XX_RTC)
+OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxRTCState, PXA2XX_RTC)
 
 struct PXA2xxRTCState {
     /*< private >*/
@@ -1245,9 +1241,7 @@ static const TypeInfo pxa2xx_rtc_sysbus_info = {
 /* I2C Interface */
 
 #define TYPE_PXA2XX_I2C_SLAVE "pxa2xx-i2c-slave"
-typedef struct PXA2xxI2CSlaveState PXA2xxI2CSlaveState;
-DECLARE_INSTANCE_CHECKER(PXA2xxI2CSlaveState, PXA2XX_I2C_SLAVE,
-                         TYPE_PXA2XX_I2C_SLAVE)
+OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxI2CSlaveState, PXA2XX_I2C_SLAVE)
 
 struct PXA2xxI2CSlaveState {
     I2CSlave parent_obj;
diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
index 16bbe4fb70..e7c3d99224 100644
--- a/hw/arm/pxa2xx_gpio.c
+++ b/hw/arm/pxa2xx_gpio.c
@@ -22,9 +22,7 @@
 #define PXA2XX_GPIO_BANKS	4
 
 #define TYPE_PXA2XX_GPIO "pxa2xx-gpio"
-typedef struct PXA2xxGPIOInfo PXA2xxGPIOInfo;
-DECLARE_INSTANCE_CHECKER(PXA2xxGPIOInfo, PXA2XX_GPIO,
-                         TYPE_PXA2XX_GPIO)
+OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxGPIOInfo, PXA2XX_GPIO)
 
 struct PXA2xxGPIOInfo {
     /*< private >*/
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index cb52a9dff3..cf6cb2a373 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -38,9 +38,7 @@
 #define PXA2XX_PIC_SRCS	40
 
 #define TYPE_PXA2XX_PIC "pxa2xx_pic"
-typedef struct PXA2xxPICState PXA2xxPICState;
-DECLARE_INSTANCE_CHECKER(PXA2xxPICState, PXA2XX_PIC,
-                         TYPE_PXA2XX_PIC)
+OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxPICState, PXA2XX_PIC)
 
 struct PXA2xxPICState {
     /*< private >*/
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index ac68b4640d..bcb2cb4761 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -95,11 +95,9 @@ struct SBSAMachineState {
     DeviceState *gic;
     PFlashCFI01 *flash[2];
 };
-typedef struct SBSAMachineState SBSAMachineState;
 
 #define TYPE_SBSA_MACHINE   MACHINE_TYPE_NAME("sbsa-ref")
-DECLARE_INSTANCE_CHECKER(SBSAMachineState, SBSA_MACHINE,
-                         TYPE_SBSA_MACHINE)
+OBJECT_DECLARE_SIMPLE_TYPE(SBSAMachineState, SBSA_MACHINE)
 
 static const MemMapEntry sbsa_ref_memmap[] = {
     /* 512M boot ROM */
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index b5b867e6ed..32bdeacfd3 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -81,9 +81,7 @@ OBJECT_DECLARE_TYPE(SpitzMachineState, SpitzMachineClass, SPITZ_MACHINE)
 #define FLASHCTL_NCE            (FLASHCTL_CE0 | FLASHCTL_CE1)
 
 #define TYPE_SL_NAND "sl-nand"
-typedef struct SLNANDState SLNANDState;
-DECLARE_INSTANCE_CHECKER(SLNANDState, SL_NAND,
-                         TYPE_SL_NAND)
+OBJECT_DECLARE_SIMPLE_TYPE(SLNANDState, SL_NAND)
 
 struct SLNANDState {
     SysBusDevice parent_obj;
@@ -259,9 +257,7 @@ static const int spitz_gpiomap[5] = {
 };
 
 #define TYPE_SPITZ_KEYBOARD "spitz-keyboard"
-typedef struct SpitzKeyboardState SpitzKeyboardState;
-DECLARE_INSTANCE_CHECKER(SpitzKeyboardState, SPITZ_KEYBOARD,
-                         TYPE_SPITZ_KEYBOARD)
+OBJECT_DECLARE_SIMPLE_TYPE(SpitzKeyboardState, SPITZ_KEYBOARD)
 
 struct SpitzKeyboardState {
     SysBusDevice parent_obj;
@@ -579,9 +575,7 @@ static void spitz_keyboard_realize(DeviceState *dev, Error **errp)
 #define LCDTG_POLCTRL   0x07
 
 #define TYPE_SPITZ_LCDTG "spitz-lcdtg"
-typedef struct SpitzLCDTG SpitzLCDTG;
-DECLARE_INSTANCE_CHECKER(SpitzLCDTG, SPITZ_LCDTG,
-                         TYPE_SPITZ_LCDTG)
+OBJECT_DECLARE_SIMPLE_TYPE(SpitzLCDTG, SPITZ_LCDTG)
 
 struct SpitzLCDTG {
     SSISlave ssidev;
@@ -669,9 +663,7 @@ static void spitz_lcdtg_realize(SSISlave *ssi, Error **errp)
 #define SPITZ_GPIO_TP_INT       11
 
 #define TYPE_CORGI_SSP "corgi-ssp"
-typedef struct CorgiSSPState CorgiSSPState;
-DECLARE_INSTANCE_CHECKER(CorgiSSPState, CORGI_SSP,
-                         TYPE_CORGI_SSP)
+OBJECT_DECLARE_SIMPLE_TYPE(CorgiSSPState, CORGI_SSP)
 
 /* "Demux" the signal based on current chipselect */
 struct CorgiSSPState {
@@ -822,9 +814,7 @@ static void spitz_akita_i2c_setup(PXA2xxState *cpu)
  *  + named GPIO output "adc-temp": the ADC value, to be wired up to the max111x
  */
 #define TYPE_SPITZ_MISC_GPIO "spitz-misc-gpio"
-typedef struct SpitzMiscGPIOState SpitzMiscGPIOState;
-DECLARE_INSTANCE_CHECKER(SpitzMiscGPIOState, SPITZ_MISC_GPIO,
-                         TYPE_SPITZ_MISC_GPIO)
+OBJECT_DECLARE_SIMPLE_TYPE(SpitzMiscGPIOState, SPITZ_MISC_GPIO)
 
 struct SpitzMiscGPIOState {
     SysBusDevice parent_obj;
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index d6fc4a4681..1237f5af02 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -58,9 +58,7 @@ typedef const struct {
 /* General purpose timer module.  */
 
 #define TYPE_STELLARIS_GPTM "stellaris-gptm"
-typedef struct gptm_state gptm_state;
-DECLARE_INSTANCE_CHECKER(gptm_state, STELLARIS_GPTM,
-                         TYPE_STELLARIS_GPTM)
+OBJECT_DECLARE_SIMPLE_TYPE(gptm_state, STELLARIS_GPTM)
 
 struct gptm_state {
     SysBusDevice parent_obj;
@@ -721,9 +719,7 @@ static int stellaris_sys_init(uint32_t base, qemu_irq irq,
 /* I2C controller.  */
 
 #define TYPE_STELLARIS_I2C "stellaris-i2c"
-typedef struct stellaris_i2c_state stellaris_i2c_state;
-DECLARE_INSTANCE_CHECKER(stellaris_i2c_state, STELLARIS_I2C,
-                         TYPE_STELLARIS_I2C)
+OBJECT_DECLARE_SIMPLE_TYPE(stellaris_i2c_state, STELLARIS_I2C)
 
 struct stellaris_i2c_state {
     SysBusDevice parent_obj;
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 0fe829b868..d7133eea6f 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -85,9 +85,7 @@ static struct {
 /* Interrupt Controller */
 
 #define TYPE_STRONGARM_PIC "strongarm_pic"
-typedef struct StrongARMPICState StrongARMPICState;
-DECLARE_INSTANCE_CHECKER(StrongARMPICState, STRONGARM_PIC,
-                         TYPE_STRONGARM_PIC)
+OBJECT_DECLARE_SIMPLE_TYPE(StrongARMPICState, STRONGARM_PIC)
 
 struct StrongARMPICState {
     SysBusDevice parent_obj;
@@ -254,9 +252,7 @@ static const TypeInfo strongarm_pic_info = {
  * f = 32 768 / (RTTR_trim + 1) */
 
 #define TYPE_STRONGARM_RTC "strongarm-rtc"
-typedef struct StrongARMRTCState StrongARMRTCState;
-DECLARE_INSTANCE_CHECKER(StrongARMRTCState, STRONGARM_RTC,
-                         TYPE_STRONGARM_RTC)
+OBJECT_DECLARE_SIMPLE_TYPE(StrongARMRTCState, STRONGARM_RTC)
 
 struct StrongARMRTCState {
     SysBusDevice parent_obj;
@@ -481,9 +477,7 @@ static const TypeInfo strongarm_rtc_sysbus_info = {
 #define GAFR 0x1c
 
 #define TYPE_STRONGARM_GPIO "strongarm-gpio"
-typedef struct StrongARMGPIOInfo StrongARMGPIOInfo;
-DECLARE_INSTANCE_CHECKER(StrongARMGPIOInfo, STRONGARM_GPIO,
-                         TYPE_STRONGARM_GPIO)
+OBJECT_DECLARE_SIMPLE_TYPE(StrongARMGPIOInfo, STRONGARM_GPIO)
 
 struct StrongARMGPIOInfo {
     SysBusDevice busdev;
@@ -720,9 +714,7 @@ static const TypeInfo strongarm_gpio_info = {
 #define PPFR 0x10
 
 #define TYPE_STRONGARM_PPC "strongarm-ppc"
-typedef struct StrongARMPPCInfo StrongARMPPCInfo;
-DECLARE_INSTANCE_CHECKER(StrongARMPPCInfo, STRONGARM_PPC,
-                         TYPE_STRONGARM_PPC)
+OBJECT_DECLARE_SIMPLE_TYPE(StrongARMPPCInfo, STRONGARM_PPC)
 
 struct StrongARMPPCInfo {
     SysBusDevice parent_obj;
@@ -921,9 +913,7 @@ static const TypeInfo strongarm_ppc_info = {
 #define RX_FIFO_ROR (1 << 10)
 
 #define TYPE_STRONGARM_UART "strongarm-uart"
-typedef struct StrongARMUARTState StrongARMUARTState;
-DECLARE_INSTANCE_CHECKER(StrongARMUARTState, STRONGARM_UART,
-                         TYPE_STRONGARM_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(StrongARMUARTState, STRONGARM_UART)
 
 struct StrongARMUARTState {
     SysBusDevice parent_obj;
@@ -1353,9 +1343,7 @@ static const TypeInfo strongarm_uart_info = {
 /* Synchronous Serial Ports */
 
 #define TYPE_STRONGARM_SSP "strongarm-ssp"
-typedef struct StrongARMSSPState StrongARMSSPState;
-DECLARE_INSTANCE_CHECKER(StrongARMSSPState, STRONGARM_SSP,
-                         TYPE_STRONGARM_SSP)
+OBJECT_DECLARE_SIMPLE_TYPE(StrongARMSSPState, STRONGARM_SSP)
 
 struct StrongARMSSPState {
     SysBusDevice parent_obj;
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 2ef6c7b288..c196f0d2f8 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -75,9 +75,7 @@ static void tosa_microdrive_attach(PXA2xxState *cpu)
  */
 
 #define TYPE_TOSA_MISC_GPIO "tosa-misc-gpio"
-typedef struct TosaMiscGPIOState TosaMiscGPIOState;
-DECLARE_INSTANCE_CHECKER(TosaMiscGPIOState, TOSA_MISC_GPIO,
-                         TYPE_TOSA_MISC_GPIO)
+OBJECT_DECLARE_SIMPLE_TYPE(TosaMiscGPIOState, TOSA_MISC_GPIO)
 
 struct TosaMiscGPIOState {
     SysBusDevice parent_obj;
@@ -172,9 +170,7 @@ static void tosa_ssp_realize(SSISlave *dev, Error **errp)
 }
 
 #define TYPE_TOSA_DAC "tosa_dac"
-typedef struct TosaDACState TosaDACState;
-DECLARE_INSTANCE_CHECKER(TosaDACState, TOSA_DAC,
-                         TYPE_TOSA_DAC)
+OBJECT_DECLARE_SIMPLE_TYPE(TosaDACState, TOSA_DAC)
 
 struct TosaDACState {
     I2CSlave parent_obj;
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 2ba69f24b7..84d4677abb 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -35,9 +35,7 @@
 /* Primary interrupt controller.  */
 
 #define TYPE_VERSATILE_PB_SIC "versatilepb_sic"
-typedef struct vpb_sic_state vpb_sic_state;
-DECLARE_INSTANCE_CHECKER(vpb_sic_state, VERSATILE_PB_SIC,
-                         TYPE_VERSATILE_PB_SIC)
+OBJECT_DECLARE_SIMPLE_TYPE(vpb_sic_state, VERSATILE_PB_SIC)
 
 struct vpb_sic_state {
     SysBusDevice parent_obj;
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index f45e71e89b..2c0bff4fa6 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -40,9 +40,7 @@
 #include "qom/object.h"
 
 #define TYPE_ZYNQ_MACHINE MACHINE_TYPE_NAME("xilinx-zynq-a9")
-typedef struct ZynqMachineState ZynqMachineState;
-DECLARE_INSTANCE_CHECKER(ZynqMachineState, ZYNQ_MACHINE,
-                         TYPE_ZYNQ_MACHINE)
+OBJECT_DECLARE_SIMPLE_TYPE(ZynqMachineState, ZYNQ_MACHINE)
 
 /* board base frequency: 33.333333 MHz */
 #define PS_CLK_FREQUENCY (100 * 1000 * 1000 / 3)
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 1f9409eb32..03e23201b1 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -25,9 +25,7 @@
 #include "qom/object.h"
 
 #define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
-typedef struct VersalVirt VersalVirt;
-DECLARE_INSTANCE_CHECKER(VersalVirt, XLNX_VERSAL_VIRT_MACHINE,
-                         TYPE_XLNX_VERSAL_VIRT_MACHINE)
+OBJECT_DECLARE_SIMPLE_TYPE(VersalVirt, XLNX_VERSAL_VIRT_MACHINE)
 
 struct VersalVirt {
     MachineState parent_obj;
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 19d5a4d4e0..066571a972 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -36,11 +36,9 @@ struct XlnxZCU102 {
 
     struct arm_boot_info binfo;
 };
-typedef struct XlnxZCU102 XlnxZCU102;
 
 #define TYPE_ZCU102_MACHINE   MACHINE_TYPE_NAME("xlnx-zcu102")
-DECLARE_INSTANCE_CHECKER(XlnxZCU102, ZCU102_MACHINE,
-                         TYPE_ZCU102_MACHINE)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxZCU102, ZCU102_MACHINE)
 
 
 static bool zcu102_get_secure(Object *obj, Error **errp)
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 72ecb6df29..4fc5699dae 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -111,11 +111,9 @@ struct ZipitLCD {
     uint32_t cur_reg;
     int pos;
 };
-typedef struct ZipitLCD ZipitLCD;
 
 #define TYPE_ZIPIT_LCD "zipit-lcd"
-DECLARE_INSTANCE_CHECKER(ZipitLCD, ZIPIT_LCD,
-                         TYPE_ZIPIT_LCD)
+OBJECT_DECLARE_SIMPLE_TYPE(ZipitLCD, ZIPIT_LCD)
 
 static uint32_t zipit_lcd_transfer(SSISlave *dev, uint32_t value)
 {
@@ -198,9 +196,7 @@ static const TypeInfo zipit_lcd_info = {
 };
 
 #define TYPE_AER915 "aer915"
-typedef struct AER915State AER915State;
-DECLARE_INSTANCE_CHECKER(AER915State, AER915,
-                         TYPE_AER915)
+OBJECT_DECLARE_SIMPLE_TYPE(AER915State, AER915)
 
 struct AER915State {
     I2CSlave parent_obj;
diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index eb8a7f032d..3cb8131060 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -127,9 +127,7 @@ enum {
 #define MUTE_SHIFT 15
 
 #define TYPE_AC97 "AC97"
-typedef struct AC97LinkState AC97LinkState;
-DECLARE_INSTANCE_CHECKER(AC97LinkState, AC97,
-                         TYPE_AC97)
+OBJECT_DECLARE_SIMPLE_TYPE(AC97LinkState, AC97)
 
 #define REC_MASK 7
 enum {
diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index 870116e324..42d50d2fdc 100644
--- a/hw/audio/adlib.c
+++ b/hw/audio/adlib.c
@@ -52,9 +52,7 @@
 #define SHIFT 1
 
 #define TYPE_ADLIB "adlib"
-typedef struct AdlibState AdlibState;
-DECLARE_INSTANCE_CHECKER(AdlibState, ADLIB,
-                         TYPE_ADLIB)
+OBJECT_DECLARE_SIMPLE_TYPE(AdlibState, ADLIB)
 
 struct AdlibState {
     ISADevice parent_obj;
diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index a824f8949e..6904589814 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -293,8 +293,7 @@ struct chan_bits {
 };
 
 #define TYPE_ES1370 "ES1370"
-DECLARE_INSTANCE_CHECKER(ES1370State, ES1370,
-                         TYPE_ES1370)
+OBJECT_DECLARE_SIMPLE_TYPE(ES1370State, ES1370)
 
 static void es1370_dac1_calc_freq (ES1370State *s, uint32_t ctl,
                                    uint32_t *old_freq, uint32_t *new_freq);
diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index 307fd48315..e8719ee117 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -43,9 +43,7 @@
 #endif
 
 #define TYPE_GUS "gus"
-typedef struct GUSState GUSState;
-DECLARE_INSTANCE_CHECKER(GUSState, GUS,
-                         TYPE_GUS)
+OBJECT_DECLARE_SIMPLE_TYPE(GUSState, GUS)
 
 struct GUSState {
     ISADevice dev;
diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index 77d31b91a4..feb8f9e2bb 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -172,8 +172,7 @@ struct HDAAudioStream {
 };
 
 #define TYPE_HDA_AUDIO "hda-audio"
-DECLARE_INSTANCE_CHECKER(HDAAudioState, HDA_AUDIO,
-                         TYPE_HDA_AUDIO)
+OBJECT_DECLARE_SIMPLE_TYPE(HDAAudioState, HDA_AUDIO)
 
 struct HDAAudioState {
     HDACodecDevice hda;
diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index c8641562cc..e6c09bdb8e 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -43,9 +43,7 @@
 #define MP_AUDIO_CLOCK_24MHZ    (1 << 9)
 #define MP_AUDIO_MONO           (1 << 14)
 
-typedef struct mv88w8618_audio_state mv88w8618_audio_state;
-DECLARE_INSTANCE_CHECKER(mv88w8618_audio_state, MV88W8618_AUDIO,
-                         TYPE_MV88W8618_AUDIO)
+OBJECT_DECLARE_SIMPLE_TYPE(mv88w8618_audio_state, MV88W8618_AUDIO)
 
 struct mv88w8618_audio_state {
     SysBusDevice parent_obj;
diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c
index 7893539019..04b39f8345 100644
--- a/hw/audio/milkymist-ac97.c
+++ b/hw/audio/milkymist-ac97.c
@@ -56,9 +56,7 @@ enum {
 };
 
 #define TYPE_MILKYMIST_AC97 "milkymist-ac97"
-typedef struct MilkymistAC97State MilkymistAC97State;
-DECLARE_INSTANCE_CHECKER(MilkymistAC97State, MILKYMIST_AC97,
-                         TYPE_MILKYMIST_AC97)
+OBJECT_DECLARE_SIMPLE_TYPE(MilkymistAC97State, MILKYMIST_AC97)
 
 struct MilkymistAC97State {
     SysBusDevice parent_obj;
diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index cbee8855fb..b056c05387 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -40,9 +40,7 @@
 #define PCSPK_MAX_FREQ (PCSPK_SAMPLE_RATE >> 1)
 #define PCSPK_MIN_COUNT DIV_ROUND_UP(PIT_FREQ, PCSPK_MAX_FREQ)
 
-typedef struct PCSpkState PCSpkState;
-DECLARE_INSTANCE_CHECKER(PCSpkState, PC_SPEAKER,
-                         TYPE_PC_SPEAKER)
+OBJECT_DECLARE_SIMPLE_TYPE(PCSpkState, PC_SPEAKER)
 
 struct PCSpkState {
     ISADevice parent_obj;
diff --git a/hw/audio/pl041.c b/hw/audio/pl041.c
index 570a234b72..03acd4fe34 100644
--- a/hw/audio/pl041.c
+++ b/hw/audio/pl041.c
@@ -78,9 +78,7 @@ typedef struct {
 } pl041_channel;
 
 #define TYPE_PL041 "pl041"
-typedef struct PL041State PL041State;
-DECLARE_INSTANCE_CHECKER(PL041State, PL041,
-                         TYPE_PL041)
+OBJECT_DECLARE_SIMPLE_TYPE(PL041State, PL041)
 
 struct PL041State {
     SysBusDevice parent_obj;
diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 6aa2c0fb93..8b20700410 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -50,9 +50,7 @@
 static const char e3[] = "COPYRIGHT (C) CREATIVE TECHNOLOGY LTD, 1992.";
 
 #define TYPE_SB16 "sb16"
-typedef struct SB16State SB16State;
-DECLARE_INSTANCE_CHECKER(SB16State, SB16,
-                         TYPE_SB16)
+OBJECT_DECLARE_SIMPLE_TYPE(SB16State, SB16)
 
 struct SB16State {
     ISADevice parent_obj;
diff --git a/hw/audio/wm8750.c b/hw/audio/wm8750.c
index 7d6fcfec03..b5722b37c3 100644
--- a/hw/audio/wm8750.c
+++ b/hw/audio/wm8750.c
@@ -27,9 +27,7 @@ typedef struct {
     int dac_hz;
 } WMRate;
 
-typedef struct WM8750State WM8750State;
-DECLARE_INSTANCE_CHECKER(WM8750State, WM8750,
-                         TYPE_WM8750)
+OBJECT_DECLARE_SIMPLE_TYPE(WM8750State, WM8750)
 
 struct WM8750State {
     I2CSlave parent_obj;
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 224bac504f..4c2c35e223 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -65,9 +65,7 @@
 /* qdev floppy bus                                      */
 
 #define TYPE_FLOPPY_BUS "floppy-bus"
-typedef struct FloppyBus FloppyBus;
-DECLARE_INSTANCE_CHECKER(FloppyBus, FLOPPY_BUS,
-                         TYPE_FLOPPY_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(FloppyBus, FLOPPY_BUS)
 
 typedef struct FDCtrl FDCtrl;
 typedef struct FDrive FDrive;
@@ -497,9 +495,7 @@ static const BlockDevOps fd_block_ops = {
 
 
 #define TYPE_FLOPPY_DRIVE "floppy"
-typedef struct FloppyDrive FloppyDrive;
-DECLARE_INSTANCE_CHECKER(FloppyDrive, FLOPPY_DRIVE,
-                         TYPE_FLOPPY_DRIVE)
+OBJECT_DECLARE_SIMPLE_TYPE(FloppyDrive, FLOPPY_DRIVE)
 
 struct FloppyDrive {
     DeviceState     qdev;
@@ -890,9 +886,7 @@ static FloppyDriveType get_fallback_drive_type(FDrive *drv)
 }
 
 #define TYPE_SYSBUS_FDC "base-sysbus-fdc"
-typedef struct FDCtrlSysBus FDCtrlSysBus;
-DECLARE_INSTANCE_CHECKER(FDCtrlSysBus, SYSBUS_FDC,
-                         TYPE_SYSBUS_FDC)
+OBJECT_DECLARE_SIMPLE_TYPE(FDCtrlSysBus, SYSBUS_FDC)
 
 struct FDCtrlSysBus {
     /*< private >*/
@@ -902,9 +896,7 @@ struct FDCtrlSysBus {
     struct FDCtrl state;
 };
 
-typedef struct FDCtrlISABus FDCtrlISABus;
-DECLARE_INSTANCE_CHECKER(FDCtrlISABus, ISA_FDC,
-                         TYPE_ISA_FDC)
+OBJECT_DECLARE_SIMPLE_TYPE(FDCtrlISABus, ISA_FDC)
 
 struct FDCtrlISABus {
     ISADevice parent_obj;
diff --git a/hw/block/nand.c b/hw/block/nand.c
index 5c8112ed5a..bcceb64ebb 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -90,8 +90,7 @@ struct NANDFlashState {
 
 #define TYPE_NAND "nand"
 
-DECLARE_INSTANCE_CHECKER(NANDFlashState, NAND,
-                         TYPE_NAND)
+OBJECT_DECLARE_SIMPLE_TYPE(NANDFlashState, NAND)
 
 static void mem_and(uint8_t *dest, const uint8_t *src, size_t n)
 {
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 19f55aba66..5ff7be86bb 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -40,9 +40,7 @@
 #define BLOCK_SHIFT	(PAGE_SHIFT + 6)
 
 #define TYPE_ONE_NAND "onenand"
-typedef struct OneNANDState OneNANDState;
-DECLARE_INSTANCE_CHECKER(OneNANDState, ONE_NAND,
-                         TYPE_ONE_NAND)
+OBJECT_DECLARE_SIMPLE_TYPE(OneNANDState, ONE_NAND)
 
 struct OneNANDState {
     SysBusDevice parent_obj;
diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index daaaca0f39..2a063ad72c 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -33,9 +33,7 @@
 #include "qom/object.h"
 
 #define TYPE_ISA_DEBUGCON_DEVICE "isa-debugcon"
-typedef struct ISADebugconState ISADebugconState;
-DECLARE_INSTANCE_CHECKER(ISADebugconState, ISA_DEBUGCON_DEVICE,
-                         TYPE_ISA_DEBUGCON_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(ISADebugconState, ISA_DEBUGCON_DEVICE)
 
 //#define DEBUG_DEBUGCON
 
diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index b8ea34edbd..96afe3580f 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -139,9 +139,7 @@ typedef struct {
 } Exynos4210UartFIFO;
 
 #define TYPE_EXYNOS4210_UART "exynos4210.uart"
-typedef struct Exynos4210UartState Exynos4210UartState;
-DECLARE_INSTANCE_CHECKER(Exynos4210UartState, EXYNOS4210_UART,
-                         TYPE_EXYNOS4210_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210UartState, EXYNOS4210_UART)
 
 struct Exynos4210UartState {
     SysBusDevice parent_obj;
diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index 6fd88d83ad..3f80f6824e 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -73,9 +73,7 @@
 
 #define FIFO_LENGTH 1024
 
-typedef struct UART UART;
-DECLARE_INSTANCE_CHECKER(UART, GRLIB_APB_UART,
-                         TYPE_GRLIB_APB_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(UART, GRLIB_APB_UART)
 
 struct UART {
     SysBusDevice parent_obj;
diff --git a/hw/char/ipoctal232.c b/hw/char/ipoctal232.c
index 2c987df8ad..ad000a39b9 100644
--- a/hw/char/ipoctal232.c
+++ b/hw/char/ipoctal232.c
@@ -123,8 +123,7 @@ struct IPOctalState {
 
 #define TYPE_IPOCTAL "ipoctal232"
 
-DECLARE_INSTANCE_CHECKER(IPOctalState, IPOCTAL,
-                         TYPE_IPOCTAL)
+OBJECT_DECLARE_SIMPLE_TYPE(IPOctalState, IPOCTAL)
 
 static const VMStateDescription vmstate_scc2698_channel = {
     .name = "scc2698_channel",
diff --git a/hw/char/lm32_juart.c b/hw/char/lm32_juart.c
index 5723f2e189..b97aacba91 100644
--- a/hw/char/lm32_juart.c
+++ b/hw/char/lm32_juart.c
@@ -42,9 +42,7 @@ enum {
     JRX_FULL = (1<<8),
 };
 
-typedef struct LM32JuartState LM32JuartState;
-DECLARE_INSTANCE_CHECKER(LM32JuartState, LM32_JUART,
-                         TYPE_LM32_JUART)
+OBJECT_DECLARE_SIMPLE_TYPE(LM32JuartState, LM32_JUART)
 
 struct LM32JuartState {
     SysBusDevice parent_obj;
diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
index 624bc83c5f..0e8b4e46a3 100644
--- a/hw/char/lm32_uart.c
+++ b/hw/char/lm32_uart.c
@@ -95,9 +95,7 @@ enum {
 };
 
 #define TYPE_LM32_UART "lm32-uart"
-typedef struct LM32UartState LM32UartState;
-DECLARE_INSTANCE_CHECKER(LM32UartState, LM32_UART,
-                         TYPE_LM32_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(LM32UartState, LM32_UART)
 
 struct LM32UartState {
     SysBusDevice parent_obj;
diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
index f6baa3ce77..e6814faffb 100644
--- a/hw/char/mcf_uart.c
+++ b/hw/char/mcf_uart.c
@@ -35,11 +35,9 @@ struct mcf_uart_state {
     qemu_irq irq;
     CharBackend chr;
 };
-typedef struct mcf_uart_state mcf_uart_state;
 
 #define TYPE_MCF_UART "mcf-uart"
-DECLARE_INSTANCE_CHECKER(mcf_uart_state, MCF_UART,
-                         TYPE_MCF_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(mcf_uart_state, MCF_UART)
 
 /* UART Status Register bits.  */
 #define MCF_UART_RxRDY  0x01
diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c
index 41204a0e28..1e83dbcafa 100644
--- a/hw/char/milkymist-uart.c
+++ b/hw/char/milkymist-uart.c
@@ -58,9 +58,7 @@ enum {
 };
 
 #define TYPE_MILKYMIST_UART "milkymist-uart"
-typedef struct MilkymistUartState MilkymistUartState;
-DECLARE_INSTANCE_CHECKER(MilkymistUartState, MILKYMIST_UART,
-                         TYPE_MILKYMIST_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(MilkymistUartState, MILKYMIST_UART)
 
 struct MilkymistUartState {
     SysBusDevice parent_obj;
diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index ddb14f3197..8b418abf71 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -93,9 +93,7 @@ typedef struct ParallelState {
 } ParallelState;
 
 #define TYPE_ISA_PARALLEL "isa-parallel"
-typedef struct ISAParallelState ISAParallelState;
-DECLARE_INSTANCE_CHECKER(ISAParallelState, ISA_PARALLEL,
-                         TYPE_ISA_PARALLEL)
+OBJECT_DECLARE_SIMPLE_TYPE(ISAParallelState, ISA_PARALLEL)
 
 struct ISAParallelState {
     ISADevice parent_obj;
diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index d4aad81a85..32c2fc0ebe 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -34,9 +34,7 @@
 #include "migration/vmstate.h"
 #include "qom/object.h"
 
-typedef struct ISASerialState ISASerialState;
-DECLARE_INSTANCE_CHECKER(ISASerialState, ISA_SERIAL,
-                         TYPE_ISA_SERIAL)
+OBJECT_DECLARE_SIMPLE_TYPE(ISASerialState, ISA_SERIAL)
 
 struct ISASerialState {
     ISADevice parent_obj;
diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index f68948154e..b0520a5a09 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -40,11 +40,9 @@ struct PCISerialState {
     SerialState state;
     uint8_t prog_if;
 };
-typedef struct PCISerialState PCISerialState;
 
 #define TYPE_PCI_SERIAL "pci-serial"
-DECLARE_INSTANCE_CHECKER(PCISerialState, PCI_SERIAL,
-                         TYPE_PCI_SERIAL)
+OBJECT_DECLARE_SIMPLE_TYPE(PCISerialState, PCI_SERIAL)
 
 static void serial_pci_realize(PCIDevice *dev, Error **errp)
 {
diff --git a/hw/char/spapr_vty.c b/hw/char/spapr_vty.c
index dd6dd2d8c3..e726d4d915 100644
--- a/hw/char/spapr_vty.c
+++ b/hw/char/spapr_vty.c
@@ -18,11 +18,9 @@ struct SpaprVioVty {
     uint32_t in, out;
     uint8_t buf[VTERM_BUFSIZE];
 };
-typedef struct SpaprVioVty SpaprVioVty;
 
 #define TYPE_VIO_SPAPR_VTY_DEVICE "spapr-vty"
-DECLARE_INSTANCE_CHECKER(SpaprVioVty, VIO_SPAPR_VTY_DEVICE,
-                         TYPE_VIO_SPAPR_VTY_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(SpaprVioVty, VIO_SPAPR_VTY_DEVICE)
 
 static int vty_can_receive(void *opaque)
 {
diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index 8e9f9cd9ec..2e773ec4c4 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -53,9 +53,7 @@
 #define CONTROL_IE        0x10
 
 #define TYPE_XILINX_UARTLITE "xlnx.xps-uartlite"
-typedef struct XilinxUARTLite XilinxUARTLite;
-DECLARE_INSTANCE_CHECKER(XilinxUARTLite, XILINX_UARTLITE,
-                         TYPE_XILINX_UARTLITE)
+OBJECT_DECLARE_SIMPLE_TYPE(XilinxUARTLite, XILINX_UARTLITE)
 
 struct XilinxUARTLite {
     SysBusDevice parent_obj;
diff --git a/hw/cpu/realview_mpcore.c b/hw/cpu/realview_mpcore.c
index fb547aceef..72c792eef1 100644
--- a/hw/cpu/realview_mpcore.c
+++ b/hw/cpu/realview_mpcore.c
@@ -18,9 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_REALVIEW_MPCORE_RIRQ "realview_mpcore"
-typedef struct mpcore_rirq_state mpcore_rirq_state;
-DECLARE_INSTANCE_CHECKER(mpcore_rirq_state, REALVIEW_MPCORE_RIRQ,
-                         TYPE_REALVIEW_MPCORE_RIRQ)
+OBJECT_DECLARE_SIMPLE_TYPE(mpcore_rirq_state, REALVIEW_MPCORE_RIRQ)
 
 /* Dummy PIC to route IRQ lines.  The baseboard has 4 independent IRQ
    controllers.  The output of these, plus some of the raw input lines
diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
index 4b87ee7135..023165b2a3 100644
--- a/hw/display/ads7846.c
+++ b/hw/display/ads7846.c
@@ -29,11 +29,9 @@ struct ADS7846State {
     int cycle;
     int output;
 };
-typedef struct ADS7846State ADS7846State;
 
 #define TYPE_ADS7846 "ads7846"
-DECLARE_INSTANCE_CHECKER(ADS7846State, ADS7846,
-                         TYPE_ADS7846)
+OBJECT_DECLARE_SIMPLE_TYPE(ADS7846State, ADS7846)
 
 /* Control-byte bitfields */
 #define CB_PD0		(1 << 0)
diff --git a/hw/display/artist.c b/hw/display/artist.c
index 80cd66e41d..ed0e637f25 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -25,9 +25,7 @@
 #include "qom/object.h"
 
 #define TYPE_ARTIST "artist"
-typedef struct ARTISTState ARTISTState;
-DECLARE_INSTANCE_CHECKER(ARTISTState, ARTIST,
-                         TYPE_ARTIST)
+OBJECT_DECLARE_SIMPLE_TYPE(ARTISTState, ARTIST)
 
 #ifdef HOST_WORDS_BIGENDIAN
 #define ROP8OFF(_i) (3 - (_i))
diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 41587388c4..8ed734b195 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -55,11 +55,9 @@ struct BochsDisplayState {
     /* device state */
     BochsDisplayMode mode;
 };
-typedef struct BochsDisplayState BochsDisplayState;
 
 #define TYPE_BOCHS_DISPLAY "bochs-display"
-DECLARE_INSTANCE_CHECKER(BochsDisplayState, BOCHS_DISPLAY,
-                         TYPE_BOCHS_DISPLAY)
+OBJECT_DECLARE_SIMPLE_TYPE(BochsDisplayState, BOCHS_DISPLAY)
 
 static const VMStateDescription vmstate_bochs_display = {
     .name = "bochs-display",
diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index d66ba9ad6a..42fcf40010 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -66,9 +66,7 @@
 #define CG3_VRAM_OFFSET 0x800000
 
 #define TYPE_CG3 "cgthree"
-typedef struct CG3State CG3State;
-DECLARE_INSTANCE_CHECKER(CG3State, CG3,
-                         TYPE_CG3)
+OBJECT_DECLARE_SIMPLE_TYPE(CG3State, CG3)
 
 struct CG3State {
     SysBusDevice parent_obj;
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index c088f38cf8..722b9e7004 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -183,11 +183,9 @@ struct PCICirrusVGAState {
     PCIDevice dev;
     CirrusVGAState cirrus_vga;
 };
-typedef struct PCICirrusVGAState PCICirrusVGAState;
 
 #define TYPE_PCI_CIRRUS_VGA "cirrus-vga"
-DECLARE_INSTANCE_CHECKER(PCICirrusVGAState, PCI_CIRRUS_VGA,
-                         TYPE_PCI_CIRRUS_VGA)
+OBJECT_DECLARE_SIMPLE_TYPE(PCICirrusVGAState, PCI_CIRRUS_VGA)
 
 static uint8_t rop_to_index[256];
 
diff --git a/hw/display/cirrus_vga_isa.c b/hw/display/cirrus_vga_isa.c
index e6adee1df4..4f6fb1af3b 100644
--- a/hw/display/cirrus_vga_isa.c
+++ b/hw/display/cirrus_vga_isa.c
@@ -33,9 +33,7 @@
 #include "qom/object.h"
 
 #define TYPE_ISA_CIRRUS_VGA "isa-cirrus-vga"
-typedef struct ISACirrusVGAState ISACirrusVGAState;
-DECLARE_INSTANCE_CHECKER(ISACirrusVGAState, ISA_CIRRUS_VGA,
-                         TYPE_ISA_CIRRUS_VGA)
+OBJECT_DECLARE_SIMPLE_TYPE(ISACirrusVGAState, ISA_CIRRUS_VGA)
 
 struct ISACirrusVGAState {
     ISADevice parent_obj;
diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 3ef8698eb7..4c16e1f5a0 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -294,9 +294,7 @@ struct Exynos4210fimdWindow {
 };
 
 #define TYPE_EXYNOS4210_FIMD "exynos4210.fimd"
-typedef struct Exynos4210fimdState Exynos4210fimdState;
-DECLARE_INSTANCE_CHECKER(Exynos4210fimdState, EXYNOS4210_FIMD,
-                         TYPE_EXYNOS4210_FIMD)
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210fimdState, EXYNOS4210_FIMD)
 
 struct Exynos4210fimdState {
     SysBusDevice parent_obj;
diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index 4a32fe4c94..8f1725432c 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -487,9 +487,7 @@ static void g364fb_init(DeviceState *dev, G364State *s)
 }
 
 #define TYPE_G364 "sysbus-g364"
-typedef struct G364SysBusState G364SysBusState;
-DECLARE_INSTANCE_CHECKER(G364SysBusState, G364,
-                         TYPE_G364)
+OBJECT_DECLARE_SIMPLE_TYPE(G364SysBusState, G364)
 
 struct G364SysBusState {
     SysBusDevice parent_obj;
diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
index 647d05f602..dd5f4696c4 100644
--- a/hw/display/jazz_led.c
+++ b/hw/display/jazz_led.c
@@ -36,9 +36,7 @@ typedef enum {
 } screen_state_t;
 
 #define TYPE_JAZZ_LED "jazz-led"
-typedef struct LedState LedState;
-DECLARE_INSTANCE_CHECKER(LedState, JAZZ_LED,
-                         TYPE_JAZZ_LED)
+OBJECT_DECLARE_SIMPLE_TYPE(LedState, JAZZ_LED)
 
 struct LedState {
     SysBusDevice parent_obj;
diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
index 8a9e7c23fb..64636db86f 100644
--- a/hw/display/milkymist-tmu2.c
+++ b/hw/display/milkymist-tmu2.c
@@ -83,9 +83,7 @@ struct vertex {
 } QEMU_PACKED;
 
 #define TYPE_MILKYMIST_TMU2 "milkymist-tmu2"
-typedef struct MilkymistTMU2State MilkymistTMU2State;
-DECLARE_INSTANCE_CHECKER(MilkymistTMU2State, MILKYMIST_TMU2,
-                         TYPE_MILKYMIST_TMU2)
+OBJECT_DECLARE_SIMPLE_TYPE(MilkymistTMU2State, MILKYMIST_TMU2)
 
 struct MilkymistTMU2State {
     SysBusDevice parent_obj;
diff --git a/hw/display/milkymist-vgafb.c b/hw/display/milkymist-vgafb.c
index 2c879129fb..6f2b11d6c9 100644
--- a/hw/display/milkymist-vgafb.c
+++ b/hw/display/milkymist-vgafb.c
@@ -69,9 +69,7 @@ enum {
 };
 
 #define TYPE_MILKYMIST_VGAFB "milkymist-vgafb"
-typedef struct MilkymistVgafbState MilkymistVgafbState;
-DECLARE_INSTANCE_CHECKER(MilkymistVgafbState, MILKYMIST_VGAFB,
-                         TYPE_MILKYMIST_VGAFB)
+OBJECT_DECLARE_SIMPLE_TYPE(MilkymistVgafbState, MILKYMIST_VGAFB)
 
 struct MilkymistVgafbState {
     SysBusDevice parent_obj;
diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
index 94db0202a3..e2d895109d 100644
--- a/hw/display/next-fb.c
+++ b/hw/display/next-fb.c
@@ -32,9 +32,7 @@
 #include "hw/m68k/next-cube.h"
 #include "qom/object.h"
 
-typedef struct NeXTFbState NeXTFbState;
-DECLARE_INSTANCE_CHECKER(NeXTFbState, NEXTFB,
-                         TYPE_NEXTFB)
+OBJECT_DECLARE_SIMPLE_TYPE(NeXTFbState, NEXTFB)
 
 struct NeXTFbState {
     SysBusDevice parent_obj;
diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index af51a2b9e7..02b0d45f06 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -49,9 +49,7 @@ enum pl110_version
 };
 
 #define TYPE_PL110 "pl110"
-typedef struct PL110State PL110State;
-DECLARE_INSTANCE_CHECKER(PL110State, PL110,
-                         TYPE_PL110)
+OBJECT_DECLARE_SIMPLE_TYPE(PL110State, PL110)
 
 struct PL110State {
     SysBusDevice parent_obj;
diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
index d88166f449..b591a58789 100644
--- a/hw/display/sii9022.c
+++ b/hw/display/sii9022.c
@@ -36,9 +36,7 @@
 #define SII9022_INT_STATUS_PLUGGED 0x04;
 
 #define TYPE_SII9022 "sii9022"
-typedef struct sii9022_state sii9022_state;
-DECLARE_INSTANCE_CHECKER(sii9022_state, SII9022,
-                         TYPE_SII9022)
+OBJECT_DECLARE_SIMPLE_TYPE(sii9022_state, SII9022)
 
 struct sii9022_state {
     I2CSlave parent_obj;
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 51120c6c3e..8966b69bc7 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1932,9 +1932,7 @@ static const VMStateDescription vmstate_sm501_state = {
 };
 
 #define TYPE_SYSBUS_SM501 "sysbus-sm501"
-typedef struct SM501SysBusState SM501SysBusState;
-DECLARE_INSTANCE_CHECKER(SM501SysBusState, SYSBUS_SM501,
-                         TYPE_SYSBUS_SM501)
+OBJECT_DECLARE_SIMPLE_TYPE(SM501SysBusState, SYSBUS_SM501)
 
 struct SM501SysBusState {
     /*< private >*/
@@ -2036,9 +2034,7 @@ static const TypeInfo sm501_sysbus_info = {
 };
 
 #define TYPE_PCI_SM501 "sm501"
-typedef struct SM501PCIState SM501PCIState;
-DECLARE_INSTANCE_CHECKER(SM501PCIState, PCI_SM501,
-                         TYPE_PCI_SM501)
+OBJECT_DECLARE_SIMPLE_TYPE(SM501PCIState, PCI_SM501)
 
 struct SM501PCIState {
     /*< private >*/
diff --git a/hw/display/ssd0303.c b/hw/display/ssd0303.c
index 0378573a42..aeae22da9c 100644
--- a/hw/display/ssd0303.c
+++ b/hw/display/ssd0303.c
@@ -47,9 +47,7 @@ enum ssd0303_cmd {
 };
 
 #define TYPE_SSD0303 "ssd0303"
-typedef struct ssd0303_state ssd0303_state;
-DECLARE_INSTANCE_CHECKER(ssd0303_state, SSD0303,
-                         TYPE_SSD0303)
+OBJECT_DECLARE_SIMPLE_TYPE(ssd0303_state, SSD0303)
 
 struct ssd0303_state {
     I2CSlave parent_obj;
diff --git a/hw/display/ssd0323.c b/hw/display/ssd0323.c
index 037da81127..17d4b32ae3 100644
--- a/hw/display/ssd0323.c
+++ b/hw/display/ssd0323.c
@@ -66,11 +66,9 @@ struct ssd0323_state {
     uint32_t mode;
     uint8_t framebuffer[128 * 80 / 2];
 };
-typedef struct ssd0323_state ssd0323_state;
 
 #define TYPE_SSD0323 "ssd0323"
-DECLARE_INSTANCE_CHECKER(ssd0323_state, SSD0323,
-                         TYPE_SSD0323)
+OBJECT_DECLARE_SIMPLE_TYPE(ssd0323_state, SSD0323)
 
 
 static uint32_t ssd0323_transfer(SSISlave *dev, uint32_t data)
diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index 69e901a800..c9d5e45cd1 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -56,9 +56,7 @@
 #define TCX_THC_CURSBITS 0x980
 
 #define TYPE_TCX "SUNW,tcx"
-typedef struct TCXState TCXState;
-DECLARE_INSTANCE_CHECKER(TCXState, TCX,
-                         TYPE_TCX)
+OBJECT_DECLARE_SIMPLE_TYPE(TCXState, TCX)
 
 struct TCXState {
     SysBusDevice parent_obj;
diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 0ebfcca9d1..90851e730b 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -35,9 +35,7 @@
 #include "qom/object.h"
 
 #define TYPE_ISA_VGA "isa-vga"
-typedef struct ISAVGAState ISAVGAState;
-DECLARE_INSTANCE_CHECKER(ISAVGAState, ISA_VGA,
-                         TYPE_ISA_VGA)
+OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
 
 struct ISAVGAState {
     ISADevice parent_obj;
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 3b45fa3bad..e5d9af5868 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -51,11 +51,9 @@ struct PCIVGAState {
     MemoryRegion mrs[4];
     uint8_t edid[256];
 };
-typedef struct PCIVGAState PCIVGAState;
 
 #define TYPE_PCI_VGA "pci-vga"
-DECLARE_INSTANCE_CHECKER(PCIVGAState, PCI_VGA,
-                         TYPE_PCI_VGA)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIVGAState, PCI_VGA)
 
 static const VMStateDescription vmstate_vga_pci = {
     .name = "vga",
diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index 5b7ff635f7..34c3aaf7d3 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -32,9 +32,7 @@
 #include "qom/object.h"
 
 #define TYPE_I82374 "i82374"
-typedef struct I82374State I82374State;
-DECLARE_INSTANCE_CHECKER(I82374State, I82374,
-                         TYPE_I82374)
+OBJECT_DECLARE_SIMPLE_TYPE(I82374State, I82374)
 
 //#define DEBUG_I82374
 
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 859586fd2f..944ba296b0 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -272,8 +272,7 @@ struct PL330State {
 };
 
 #define TYPE_PL330 "pl330"
-DECLARE_INSTANCE_CHECKER(PL330State, PL330,
-                         TYPE_PL330)
+OBJECT_DECLARE_SIMPLE_TYPE(PL330State, PL330)
 
 static const VMStateDescription vmstate_pl330 = {
     .name = "pl330",
diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c
index 825e3dc0ac..cca1e9ec21 100644
--- a/hw/dma/puv3_dma.c
+++ b/hw/dma/puv3_dma.c
@@ -23,9 +23,7 @@
 #define PUV3_DMA_CH(offset)     ((offset) >> 8)
 
 #define TYPE_PUV3_DMA "puv3_dma"
-typedef struct PUV3DMAState PUV3DMAState;
-DECLARE_INSTANCE_CHECKER(PUV3DMAState, PUV3_DMA,
-                         TYPE_PUV3_DMA)
+OBJECT_DECLARE_SIMPLE_TYPE(PUV3DMAState, PUV3_DMA)
 
 struct PUV3DMAState {
     SysBusDevice parent_obj;
diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
index 4f6c0e5e5e..b3707ff3de 100644
--- a/hw/dma/pxa2xx_dma.c
+++ b/hw/dma/pxa2xx_dma.c
@@ -35,9 +35,7 @@ typedef struct {
 } PXA2xxDMAChannel;
 
 #define TYPE_PXA2XX_DMA "pxa2xx-dma"
-typedef struct PXA2xxDMAState PXA2xxDMAState;
-DECLARE_INSTANCE_CHECKER(PXA2xxDMAState, PXA2XX_DMA,
-                         TYPE_PXA2XX_DMA)
+OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxDMAState, PXA2XX_DMA)
 
 struct PXA2xxDMAState {
     SysBusDevice parent_obj;
diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index c584815d06..e4d2f1725b 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -56,9 +56,7 @@ typedef struct dma_pagetable_entry {
 #define DMA_FLAG_ADDR_INTR  0x0400
 
 #define TYPE_RC4030 "rc4030"
-typedef struct rc4030State rc4030State;
-DECLARE_INSTANCE_CHECKER(rc4030State, RC4030,
-                         TYPE_RC4030)
+OBJECT_DECLARE_SIMPLE_TYPE(rc4030State, RC4030)
 
 #define TYPE_RC4030_IOMMU_MEMORY_REGION "rc4030-iommu-memory-region"
 
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 498fc17d8a..0a7f5acb4b 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -43,9 +43,7 @@
 #define TYPE_XILINX_AXI_DMA_DATA_STREAM "xilinx-axi-dma-data-stream"
 #define TYPE_XILINX_AXI_DMA_CONTROL_STREAM "xilinx-axi-dma-control-stream"
 
-typedef struct XilinxAXIDMA XilinxAXIDMA;
-DECLARE_INSTANCE_CHECKER(XilinxAXIDMA, XILINX_AXI_DMA,
-                         TYPE_XILINX_AXI_DMA)
+OBJECT_DECLARE_SIMPLE_TYPE(XilinxAXIDMA, XILINX_AXI_DMA)
 
 typedef struct XilinxAXIDMAStreamSlave XilinxAXIDMAStreamSlave;
 DECLARE_INSTANCE_CHECKER(XilinxAXIDMAStreamSlave, XILINX_AXI_DMA_DATA_STREAM,
diff --git a/hw/gpio/gpio_key.c b/hw/gpio/gpio_key.c
index 86aa78aae4..74f6138356 100644
--- a/hw/gpio/gpio_key.c
+++ b/hw/gpio/gpio_key.c
@@ -31,9 +31,7 @@
 #include "qom/object.h"
 
 #define TYPE_GPIOKEY "gpio-key"
-typedef struct GPIOKEYState GPIOKEYState;
-DECLARE_INSTANCE_CHECKER(GPIOKEYState, GPIOKEY,
-                         TYPE_GPIOKEY)
+OBJECT_DECLARE_SIMPLE_TYPE(GPIOKEYState, GPIOKEY)
 #define GPIO_KEY_LATENCY 100 /* 100ms */
 
 struct GPIOKEYState {
diff --git a/hw/gpio/max7310.c b/hw/gpio/max7310.c
index 2888d071ac..256d833c3a 100644
--- a/hw/gpio/max7310.c
+++ b/hw/gpio/max7310.c
@@ -18,9 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_MAX7310 "max7310"
-typedef struct MAX7310State MAX7310State;
-DECLARE_INSTANCE_CHECKER(MAX7310State, MAX7310,
-                         TYPE_MAX7310)
+OBJECT_DECLARE_SIMPLE_TYPE(MAX7310State, MAX7310)
 
 struct MAX7310State {
     I2CSlave parent_obj;
diff --git a/hw/gpio/mpc8xxx.c b/hw/gpio/mpc8xxx.c
index dac8b1be38..e60c919a13 100644
--- a/hw/gpio/mpc8xxx.c
+++ b/hw/gpio/mpc8xxx.c
@@ -27,9 +27,7 @@
 #include "qom/object.h"
 
 #define TYPE_MPC8XXX_GPIO "mpc8xxx_gpio"
-typedef struct MPC8XXXGPIOState MPC8XXXGPIOState;
-DECLARE_INSTANCE_CHECKER(MPC8XXXGPIOState, MPC8XXX_GPIO,
-                         TYPE_MPC8XXX_GPIO)
+OBJECT_DECLARE_SIMPLE_TYPE(MPC8XXXGPIOState, MPC8XXX_GPIO)
 
 struct MPC8XXXGPIOState {
     SysBusDevice parent_obj;
diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 3420df0d1f..e72e77572a 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -35,9 +35,7 @@ static const uint8_t pl061_id_luminary[12] =
   { 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1 };
 
 #define TYPE_PL061 "pl061"
-typedef struct PL061State PL061State;
-DECLARE_INSTANCE_CHECKER(PL061State, PL061,
-                         TYPE_PL061)
+OBJECT_DECLARE_SIMPLE_TYPE(PL061State, PL061)
 
 #define N_GPIOS 8
 
diff --git a/hw/gpio/puv3_gpio.c b/hw/gpio/puv3_gpio.c
index 98ea2b4c2e..e003ae505c 100644
--- a/hw/gpio/puv3_gpio.c
+++ b/hw/gpio/puv3_gpio.c
@@ -19,9 +19,7 @@
 #include "qemu/log.h"
 
 #define TYPE_PUV3_GPIO "puv3_gpio"
-typedef struct PUV3GPIOState PUV3GPIOState;
-DECLARE_INSTANCE_CHECKER(PUV3GPIOState, PUV3_GPIO,
-                         TYPE_PUV3_GPIO)
+OBJECT_DECLARE_SIMPLE_TYPE(PUV3GPIOState, PUV3_GPIO)
 
 struct PUV3GPIOState {
     SysBusDevice parent_obj;
diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index 3d25c55d06..7cf52a5041 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -28,9 +28,7 @@
 /* SCOOP devices */
 
 #define TYPE_SCOOP "scoop"
-typedef struct ScoopInfo ScoopInfo;
-DECLARE_INSTANCE_CHECKER(ScoopInfo, SCOOP,
-                         TYPE_SCOOP)
+OBJECT_DECLARE_SIMPLE_TYPE(ScoopInfo, SCOOP)
 
 struct ScoopInfo {
     SysBusDevice parent_obj;
diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index c0c9b8a2b8..81053b5fb6 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -81,9 +81,7 @@
 
 #define DINO_MEM_CHUNK_SIZE (8 * MiB)
 
-typedef struct DinoState DinoState;
-DECLARE_INSTANCE_CHECKER(DinoState, DINO_PCI_HOST_BRIDGE,
-                         TYPE_DINO_PCI_HOST_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(DinoState, DINO_PCI_HOST_BRIDGE)
 
 #define DINO800_REGS (1 + (DINO_TLTIM - DINO_GMASK) / 4)
 static const uint32_t reg800_keep_bits[DINO800_REGS] = {
diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index c0b970f55c..1a85657948 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -53,9 +53,7 @@
 #define ICR_BUS_ERROR_BIT  LASI_BIT(8)  /* bit 8 in ICR */
 #define ICR_TOC_BIT        LASI_BIT(1)  /* bit 1 in ICR */
 
-typedef struct LasiState LasiState;
-DECLARE_INSTANCE_CHECKER(LasiState, LASI_CHIP,
-                         TYPE_LASI_CHIP)
+OBJECT_DECLARE_SIMPLE_TYPE(LasiState, LASI_CHIP)
 
 struct LasiState {
     PCIHostState parent_obj;
diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index aa5a2a9bd8..4b26db1365 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -35,11 +35,9 @@ struct SynICState {
     struct hyperv_message_page *msg_page;
     struct hyperv_event_flags_page *event_page;
 };
-typedef struct SynICState SynICState;
 
 #define TYPE_SYNIC "hyperv-synic"
-DECLARE_INSTANCE_CHECKER(SynICState, SYNIC,
-                         TYPE_SYNIC)
+OBJECT_DECLARE_SIMPLE_TYPE(SynICState, SYNIC)
 
 static bool synic_enabled;
 
diff --git a/hw/hyperv/hyperv_testdev.c b/hw/hyperv/hyperv_testdev.c
index f6ee98e00c..9a56ddf83f 100644
--- a/hw/hyperv/hyperv_testdev.c
+++ b/hw/hyperv/hyperv_testdev.c
@@ -47,11 +47,9 @@ struct HypervTestDev {
     QLIST_HEAD(, TestMsgConn) msg_conns;
     QLIST_HEAD(, TestEvtConn) evt_conns;
 };
-typedef struct HypervTestDev HypervTestDev;
 
 #define TYPE_HYPERV_TEST_DEV "hyperv-testdev"
-DECLARE_INSTANCE_CHECKER(HypervTestDev, HYPERV_TEST_DEV,
-                         TYPE_HYPERV_TEST_DEV)
+OBJECT_DECLARE_SIMPLE_TYPE(HypervTestDev, HYPERV_TEST_DEV)
 
 enum {
     HV_TEST_DEV_SINT_ROUTE_CREATE = 1,
diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index c1b9f298d9..e9a0612a04 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -163,9 +163,7 @@ void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus)
 /* GPIO interface.  */
 
 #define TYPE_GPIO_I2C "gpio_i2c"
-typedef struct GPIOI2CState GPIOI2CState;
-DECLARE_INSTANCE_CHECKER(GPIOI2CState, GPIO_I2C,
-                         TYPE_GPIO_I2C)
+OBJECT_DECLARE_SIMPLE_TYPE(GPIOI2CState, GPIO_I2C)
 
 struct GPIOI2CState {
     SysBusDevice parent_obj;
diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
index ff82226e9f..b65a7d0222 100644
--- a/hw/i2c/exynos4210_i2c.c
+++ b/hw/i2c/exynos4210_i2c.c
@@ -34,9 +34,7 @@
 #endif
 
 #define TYPE_EXYNOS4_I2C                  "exynos4210.i2c"
-typedef struct Exynos4210I2CState Exynos4210I2CState;
-DECLARE_INSTANCE_CHECKER(Exynos4210I2CState, EXYNOS4_I2C,
-                         TYPE_EXYNOS4_I2C)
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210I2CState, EXYNOS4_I2C)
 
 /* Exynos4210 I2C memory map */
 #define EXYNOS4_I2C_MEM_SIZE              0x14
diff --git a/hw/i2c/mpc_i2c.c b/hw/i2c/mpc_i2c.c
index 156a25a8e9..720d2331e9 100644
--- a/hw/i2c/mpc_i2c.c
+++ b/hw/i2c/mpc_i2c.c
@@ -37,9 +37,7 @@
 #endif
 
 #define TYPE_MPC_I2C "mpc-i2c"
-typedef struct MPCI2CState MPCI2CState;
-DECLARE_INSTANCE_CHECKER(MPCI2CState, MPC_I2C,
-                         TYPE_MPC_I2C)
+OBJECT_DECLARE_SIMPLE_TYPE(MPCI2CState, MPC_I2C)
 
 #define MPC_I2C_ADR   0x00
 #define MPC_I2C_FDR   0x04
diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
index c6777844cf..4d2bf99207 100644
--- a/hw/i2c/smbus_eeprom.c
+++ b/hw/i2c/smbus_eeprom.c
@@ -37,9 +37,7 @@
 
 #define TYPE_SMBUS_EEPROM "smbus-eeprom"
 
-typedef struct SMBusEEPROMDevice SMBusEEPROMDevice;
-DECLARE_INSTANCE_CHECKER(SMBusEEPROMDevice, SMBUS_EEPROM,
-                         TYPE_SMBUS_EEPROM)
+OBJECT_DECLARE_SIMPLE_TYPE(SMBusEEPROMDevice, SMBUS_EEPROM)
 
 #define SMBUS_EEPROM_SIZE 256
 
diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index 2d4578511d..44dd5653b7 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -30,9 +30,7 @@
 #include "hw/i386/ich9.h"
 #include "qom/object.h"
 
-typedef struct ICH9SMBState ICH9SMBState;
-DECLARE_INSTANCE_CHECKER(ICH9SMBState, ICH9_SMB_DEVICE,
-                         TYPE_ICH9_SMB_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(ICH9SMBState, ICH9_SMB_DEVICE)
 
 struct ICH9SMBState {
     PCIDevice dev;
diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index 37f47540e5..7b296ae192 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -32,9 +32,7 @@
 #include "qom/object.h"
 
 #define TYPE_KVM_CLOCK "kvmclock"
-typedef struct KVMClockState KVMClockState;
-DECLARE_INSTANCE_CHECKER(KVMClockState, KVM_CLOCK,
-                         TYPE_KVM_CLOCK)
+OBJECT_DECLARE_SIMPLE_TYPE(KVMClockState, KVM_CLOCK)
 
 struct KVMClockState {
     /*< private >*/
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index a4e05f086e..077c3f4866 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -71,11 +71,9 @@ struct VAPICROMState {
     bool rom_mapped_writable;
     VMChangeStateEntry *vmsentry;
 };
-typedef struct VAPICROMState VAPICROMState;
 
 #define TYPE_VAPIC "kvmvapic"
-DECLARE_INSTANCE_CHECKER(VAPICROMState, VAPIC,
-                         TYPE_VAPIC)
+OBJECT_DECLARE_SIMPLE_TYPE(VAPICROMState, VAPIC)
 
 #define TPR_INSTR_ABS_MODRM             0x1
 #define TPR_INSTR_MATCH_MODRM_REG       0x2
diff --git a/hw/i386/port92.c b/hw/i386/port92.c
index c00dcb261b..e1379a4f98 100644
--- a/hw/i386/port92.c
+++ b/hw/i386/port92.c
@@ -14,9 +14,7 @@
 #include "trace.h"
 #include "qom/object.h"
 
-typedef struct Port92State Port92State;
-DECLARE_INSTANCE_CHECKER(Port92State, PORT92,
-                         TYPE_PORT92)
+OBJECT_DECLARE_SIMPLE_TYPE(Port92State, PORT92)
 
 struct Port92State {
     ISADevice parent_obj;
diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index ae4cbc7add..a3556438f0 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -51,9 +51,7 @@
 #endif
 
 #define TYPE_VMMOUSE "vmmouse"
-typedef struct VMMouseState VMMouseState;
-DECLARE_INSTANCE_CHECKER(VMMouseState, VMMOUSE,
-                         TYPE_VMMOUSE)
+OBJECT_DECLARE_SIMPLE_TYPE(VMMouseState, VMMOUSE)
 
 struct VMMouseState {
     ISADevice parent_obj;
diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index df52b6f903..20d605506b 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -63,9 +63,7 @@
 #define VCPU_INFO_LEGACY_X2APIC_BIT     3
 #define VCPU_INFO_RESERVED_BIT          31
 
-typedef struct VMPortState VMPortState;
-DECLARE_INSTANCE_CHECKER(VMPortState, VMPORT,
-                         TYPE_VMPORT)
+OBJECT_DECLARE_SIMPLE_TYPE(VMPortState, VMPORT)
 
 struct VMPortState {
     ISADevice parent_obj;
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index a8bbe8c833..e9601031bf 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -69,11 +69,9 @@ struct PCIXenPlatformState {
     char log_buffer[4096];
     int log_buffer_off;
 };
-typedef struct PCIXenPlatformState PCIXenPlatformState;
 
 #define TYPE_XEN_PLATFORM "xen-platform"
-DECLARE_INSTANCE_CHECKER(PCIXenPlatformState, XEN_PLATFORM,
-                         TYPE_XEN_PLATFORM)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIXenPlatformState, XEN_PLATFORM)
 
 #define XEN_PLATFORM_IOPORT 0x10
 
diff --git a/hw/i386/xen/xen_pvdevice.c b/hw/i386/xen/xen_pvdevice.c
index 67f83616d3..1ea95fa601 100644
--- a/hw/i386/xen/xen_pvdevice.c
+++ b/hw/i386/xen/xen_pvdevice.c
@@ -40,9 +40,7 @@
 
 #define TYPE_XEN_PV_DEVICE  "xen-pvdevice"
 
-typedef struct XenPVDevice XenPVDevice;
-DECLARE_INSTANCE_CHECKER(XenPVDevice, XEN_PV_DEVICE,
-                         TYPE_XEN_PV_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(XenPVDevice, XEN_PV_DEVICE)
 
 struct XenPVDevice {
     /*< private >*/
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 9a3489691b..6bc19de226 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -38,9 +38,7 @@
 /* ISA IDE definitions */
 
 #define TYPE_ISA_IDE "isa-ide"
-typedef struct ISAIDEState ISAIDEState;
-DECLARE_INSTANCE_CHECKER(ISAIDEState, ISA_IDE,
-                         TYPE_ISA_IDE)
+OBJECT_DECLARE_SIMPLE_TYPE(ISAIDEState, ISA_IDE)
 
 struct ISAIDEState {
     ISADevice parent_obj;
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 6e7f5df901..58a14fea36 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -34,9 +34,7 @@
 #include "qom/object.h"
 
 #define TYPE_MICRODRIVE "microdrive"
-typedef struct MicroDriveState MicroDriveState;
-DECLARE_INSTANCE_CHECKER(MicroDriveState, MICRODRIVE,
-                         TYPE_MICRODRIVE)
+OBJECT_DECLARE_SIMPLE_TYPE(MicroDriveState, MICRODRIVE)
 
 /***********************************************************/
 /* CF-ATA Microdrive */
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 968c239ab8..34c347b9c2 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -19,9 +19,7 @@
 #include "qom/object.h"
 
 #define TYPE_SII3112_PCI "sii3112"
-typedef struct SiI3112PCIState SiI3112PCIState;
-DECLARE_INSTANCE_CHECKER(SiI3112PCIState, SII3112_PCI,
-                         TYPE_SII3112_PCI)
+OBJECT_DECLARE_SIMPLE_TYPE(SiI3112PCIState, SII3112_PCI)
 
 typedef struct SiI3112Regs {
     uint32_t confstat;
diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index 70245fd817..4cb1e9de01 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -28,9 +28,7 @@
 #include "qom/object.h"
 
 #define TYPE_LM8323 "lm8323"
-typedef struct LM823KbdState LM823KbdState;
-DECLARE_INSTANCE_CHECKER(LM823KbdState, LM8323,
-                         TYPE_LM8323)
+OBJECT_DECLARE_SIMPLE_TYPE(LM823KbdState, LM8323)
 
 struct LM823KbdState {
     I2CSlave parent_obj;
diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb.c
index eaaf8adde4..5acd7a6f7d 100644
--- a/hw/input/milkymist-softusb.c
+++ b/hw/input/milkymist-softusb.c
@@ -51,9 +51,7 @@ enum {
 #define COMLOC_KEVT_BASE     0x1143
 
 #define TYPE_MILKYMIST_SOFTUSB "milkymist-softusb"
-typedef struct MilkymistSoftUsbState MilkymistSoftUsbState;
-DECLARE_INSTANCE_CHECKER(MilkymistSoftUsbState, MILKYMIST_SOFTUSB,
-                         TYPE_MILKYMIST_SOFTUSB)
+OBJECT_DECLARE_SIMPLE_TYPE(MilkymistSoftUsbState, MILKYMIST_SOFTUSB)
 
 struct MilkymistSoftUsbState {
     SysBusDevice parent_obj;
diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 7c53ae97da..d279b6c148 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -17,9 +17,7 @@
 #include "qom/object.h"
 
 #define TYPE_PL050 "pl050"
-typedef struct PL050State PL050State;
-DECLARE_INSTANCE_CHECKER(PL050State, PL050,
-                         TYPE_PL050)
+OBJECT_DECLARE_SIMPLE_TYPE(PL050State, PL050)
 
 struct PL050State {
     SysBusDevice parent_obj;
diff --git a/hw/intc/arm_gicv2m.c b/hw/intc/arm_gicv2m.c
index 04d7a6d68b..596fa66648 100644
--- a/hw/intc/arm_gicv2m.c
+++ b/hw/intc/arm_gicv2m.c
@@ -37,9 +37,7 @@
 #include "qom/object.h"
 
 #define TYPE_ARM_GICV2M "arm-gicv2m"
-typedef struct ARMGICv2mState ARMGICv2mState;
-DECLARE_INSTANCE_CHECKER(ARMGICv2mState, ARM_GICV2M,
-                         TYPE_ARM_GICV2M)
+OBJECT_DECLARE_SIMPLE_TYPE(ARMGICv2mState, ARM_GICV2M)
 
 #define GICV2M_NUM_SPI_MAX 128
 
diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index 7b01481ab8..4534ee248d 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -64,9 +64,7 @@ typedef struct CombinerGroupState {
 } CombinerGroupState;
 
 #define TYPE_EXYNOS4210_COMBINER "exynos4210.combiner"
-typedef struct Exynos4210CombinerState Exynos4210CombinerState;
-DECLARE_INSTANCE_CHECKER(Exynos4210CombinerState, EXYNOS4210_COMBINER,
-                         TYPE_EXYNOS4210_COMBINER)
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210CombinerState, EXYNOS4210_COMBINER)
 
 struct Exynos4210CombinerState {
     SysBusDevice parent_obj;
diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index f9487673fc..bc73d1f115 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -265,9 +265,7 @@ uint32_t exynos4210_get_irq(uint32_t grp, uint32_t bit)
 /********* GIC part *********/
 
 #define TYPE_EXYNOS4210_GIC "exynos4210.gic"
-typedef struct Exynos4210GicState Exynos4210GicState;
-DECLARE_INSTANCE_CHECKER(Exynos4210GicState, EXYNOS4210_GIC,
-                         TYPE_EXYNOS4210_GIC)
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210GicState, EXYNOS4210_GIC)
 
 struct Exynos4210GicState {
     SysBusDevice parent_obj;
@@ -384,9 +382,7 @@ type_init(exynos4210_gic_register_types)
  */
 
 #define TYPE_EXYNOS4210_IRQ_GATE "exynos4210.irq_gate"
-typedef struct Exynos4210IRQGateState Exynos4210IRQGateState;
-DECLARE_INSTANCE_CHECKER(Exynos4210IRQGateState, EXYNOS4210_IRQ_GATE,
-                         TYPE_EXYNOS4210_IRQ_GATE)
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210IRQGateState, EXYNOS4210_IRQ_GATE)
 
 struct Exynos4210IRQGateState {
     SysBusDevice parent_obj;
diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index 9b34a8ae03..ffec4a07ee 100644
--- a/hw/intc/grlib_irqmp.c
+++ b/hw/intc/grlib_irqmp.c
@@ -51,9 +51,7 @@
 #define FORCE_OFFSET     0x80
 #define EXTENDED_OFFSET  0xC0
 
-typedef struct IRQMP IRQMP;
-DECLARE_INSTANCE_CHECKER(IRQMP, GRLIB_IRQMP,
-                         TYPE_GRLIB_IRQMP)
+OBJECT_DECLARE_SIMPLE_TYPE(IRQMP, GRLIB_IRQMP)
 
 typedef struct IRQMPState IRQMPState;
 
diff --git a/hw/intc/lm32_pic.c b/hw/intc/lm32_pic.c
index e8b4015efd..0c48a9cd85 100644
--- a/hw/intc/lm32_pic.c
+++ b/hw/intc/lm32_pic.c
@@ -30,9 +30,7 @@
 #include "qom/object.h"
 
 #define TYPE_LM32_PIC "lm32-pic"
-typedef struct LM32PicState LM32PicState;
-DECLARE_INSTANCE_CHECKER(LM32PicState, LM32_PIC,
-                         TYPE_LM32_PIC)
+OBJECT_DECLARE_SIMPLE_TYPE(LM32PicState, LM32_PIC)
 
 struct LM32PicState {
     SysBusDevice parent_obj;
diff --git a/hw/intc/nios2_iic.c b/hw/intc/nios2_iic.c
index aa26f059a1..216db67059 100644
--- a/hw/intc/nios2_iic.c
+++ b/hw/intc/nios2_iic.c
@@ -28,9 +28,7 @@
 #include "qom/object.h"
 
 #define TYPE_ALTERA_IIC "altera,iic"
-typedef struct AlteraIIC AlteraIIC;
-DECLARE_INSTANCE_CHECKER(AlteraIIC, ALTERA_IIC,
-                         TYPE_ALTERA_IIC)
+OBJECT_DECLARE_SIMPLE_TYPE(AlteraIIC, ALTERA_IIC)
 
 struct AlteraIIC {
     SysBusDevice  parent_obj;
diff --git a/hw/intc/ompic.c b/hw/intc/ompic.c
index a8ea621d9e..1731a10683 100644
--- a/hw/intc/ompic.c
+++ b/hw/intc/ompic.c
@@ -18,9 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_OR1K_OMPIC "or1k-ompic"
-typedef struct OR1KOMPICState OR1KOMPICState;
-DECLARE_INSTANCE_CHECKER(OR1KOMPICState, OR1K_OMPIC,
-                         TYPE_OR1K_OMPIC)
+OBJECT_DECLARE_SIMPLE_TYPE(OR1KOMPICState, OR1K_OMPIC)
 
 #define OMPIC_CTRL_IRQ_ACK  (1 << 31)
 #define OMPIC_CTRL_IRQ_GEN  (1 << 30)
diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
index 8c8fbeddfe..e1a39e33cb 100644
--- a/hw/intc/openpic_kvm.c
+++ b/hw/intc/openpic_kvm.c
@@ -39,9 +39,7 @@
 
 #define GCR_RESET        0x80000000
 
-typedef struct KVMOpenPICState KVMOpenPICState;
-DECLARE_INSTANCE_CHECKER(KVMOpenPICState, KVM_OPENPIC,
-                         TYPE_KVM_OPENPIC)
+OBJECT_DECLARE_SIMPLE_TYPE(KVMOpenPICState, KVM_OPENPIC)
 
 struct KVMOpenPICState {
     /*< private >*/
diff --git a/hw/intc/pl190.c b/hw/intc/pl190.c
index ee3206132f..cd88443601 100644
--- a/hw/intc/pl190.c
+++ b/hw/intc/pl190.c
@@ -22,9 +22,7 @@
 #define PL190_NUM_PRIO 17
 
 #define TYPE_PL190 "pl190"
-typedef struct PL190State PL190State;
-DECLARE_INSTANCE_CHECKER(PL190State, PL190,
-                         TYPE_PL190)
+OBJECT_DECLARE_SIMPLE_TYPE(PL190State, PL190)
 
 struct PL190State {
     SysBusDevice parent_obj;
diff --git a/hw/intc/puv3_intc.c b/hw/intc/puv3_intc.c
index 8bceede256..65226f5e7c 100644
--- a/hw/intc/puv3_intc.c
+++ b/hw/intc/puv3_intc.c
@@ -20,9 +20,7 @@
 #include "qemu/log.h"
 
 #define TYPE_PUV3_INTC "puv3_intc"
-typedef struct PUV3INTCState PUV3INTCState;
-DECLARE_INSTANCE_CHECKER(PUV3INTCState, PUV3_INTC,
-                         TYPE_PUV3_INTC)
+OBJECT_DECLARE_SIMPLE_TYPE(PUV3INTCState, PUV3_INTC)
 
 struct PUV3INTCState {
     SysBusDevice parent_obj;
diff --git a/hw/intc/slavio_intctl.c b/hw/intc/slavio_intctl.c
index 4a72ef5d0d..f7e59ba643 100644
--- a/hw/intc/slavio_intctl.c
+++ b/hw/intc/slavio_intctl.c
@@ -59,9 +59,7 @@ typedef struct SLAVIO_CPUINTCTLState {
 } SLAVIO_CPUINTCTLState;
 
 #define TYPE_SLAVIO_INTCTL "slavio_intctl"
-typedef struct SLAVIO_INTCTLState SLAVIO_INTCTLState;
-DECLARE_INSTANCE_CHECKER(SLAVIO_INTCTLState, SLAVIO_INTCTL,
-                         TYPE_SLAVIO_INTCTL)
+OBJECT_DECLARE_SIMPLE_TYPE(SLAVIO_INTCTLState, SLAVIO_INTCTL)
 
 struct SLAVIO_INTCTLState {
     SysBusDevice parent_obj;
diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
index b35e1d2ac4..d107e134c4 100644
--- a/hw/ipack/tpci200.c
+++ b/hw/ipack/tpci200.c
@@ -69,12 +69,10 @@ struct TPCI200State {
     uint16_t status;
     uint8_t int_set;
 };
-typedef struct TPCI200State TPCI200State;
 
 #define TYPE_TPCI200 "tpci200"
 
-DECLARE_INSTANCE_CHECKER(TPCI200State, TPCI200,
-                         TYPE_TPCI200)
+OBJECT_DECLARE_SIMPLE_TYPE(TPCI200State, TPCI200)
 
 static const uint8_t local_config_regs[] = {
     0x00, 0xFF, 0xFF, 0x0F, 0x00, 0xFC, 0xFF, 0x0F, 0x00, 0x00, 0x00,
diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index 159831cbc5..c3f3306e66 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -62,9 +62,7 @@
 #define VM_CMD_GRACEFUL_SHUTDOWN   0x09
 
 #define TYPE_IPMI_BMC_EXTERN "ipmi-bmc-extern"
-typedef struct IPMIBmcExtern IPMIBmcExtern;
-DECLARE_INSTANCE_CHECKER(IPMIBmcExtern, IPMI_BMC_EXTERN,
-                         TYPE_IPMI_BMC_EXTERN)
+OBJECT_DECLARE_SIMPLE_TYPE(IPMIBmcExtern, IPMI_BMC_EXTERN)
 struct IPMIBmcExtern {
     IPMIBmc parent;
 
diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index 0b69acc2e9..b7c2ad557b 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -34,9 +34,7 @@
 #include "qom/object.h"
 
 #define TYPE_ISA_IPMI_BT "isa-ipmi-bt"
-typedef struct ISAIPMIBTDevice ISAIPMIBTDevice;
-DECLARE_INSTANCE_CHECKER(ISAIPMIBTDevice, ISA_IPMI_BT,
-                         TYPE_ISA_IPMI_BT)
+OBJECT_DECLARE_SIMPLE_TYPE(ISAIPMIBTDevice, ISA_IPMI_BT)
 
 struct ISAIPMIBTDevice {
     ISADevice dev;
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index af69e9a008..7dd6bf0040 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -34,9 +34,7 @@
 #include "qom/object.h"
 
 #define TYPE_ISA_IPMI_KCS "isa-ipmi-kcs"
-typedef struct ISAIPMIKCSDevice ISAIPMIKCSDevice;
-DECLARE_INSTANCE_CHECKER(ISAIPMIKCSDevice, ISA_IPMI_KCS,
-                         TYPE_ISA_IPMI_KCS)
+OBJECT_DECLARE_SIMPLE_TYPE(ISAIPMIKCSDevice, ISA_IPMI_KCS)
 
 struct ISAIPMIKCSDevice {
     ISADevice dev;
diff --git a/hw/ipmi/pci_ipmi_bt.c b/hw/ipmi/pci_ipmi_bt.c
index 7e5ecea6cc..b6e52730d3 100644
--- a/hw/ipmi/pci_ipmi_bt.c
+++ b/hw/ipmi/pci_ipmi_bt.c
@@ -29,9 +29,7 @@
 #include "qom/object.h"
 
 #define TYPE_PCI_IPMI_BT "pci-ipmi-bt"
-typedef struct PCIIPMIBTDevice PCIIPMIBTDevice;
-DECLARE_INSTANCE_CHECKER(PCIIPMIBTDevice, PCI_IPMI_BT,
-                         TYPE_PCI_IPMI_BT)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIIPMIBTDevice, PCI_IPMI_BT)
 
 struct PCIIPMIBTDevice {
     PCIDevice dev;
diff --git a/hw/ipmi/pci_ipmi_kcs.c b/hw/ipmi/pci_ipmi_kcs.c
index c2a283a982..de13418862 100644
--- a/hw/ipmi/pci_ipmi_kcs.c
+++ b/hw/ipmi/pci_ipmi_kcs.c
@@ -29,9 +29,7 @@
 #include "qom/object.h"
 
 #define TYPE_PCI_IPMI_KCS "pci-ipmi-kcs"
-typedef struct PCIIPMIKCSDevice PCIIPMIKCSDevice;
-DECLARE_INSTANCE_CHECKER(PCIIPMIKCSDevice, PCI_IPMI_KCS,
-                         TYPE_PCI_IPMI_KCS)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIIPMIKCSDevice, PCI_IPMI_KCS)
 
 struct PCIIPMIKCSDevice {
     PCIDevice dev;
diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
index cd4c05dd1b..1fdf0a66b6 100644
--- a/hw/ipmi/smbus_ipmi.c
+++ b/hw/ipmi/smbus_ipmi.c
@@ -30,9 +30,7 @@
 #include "qom/object.h"
 
 #define TYPE_SMBUS_IPMI "smbus-ipmi"
-typedef struct SMBusIPMIDevice SMBusIPMIDevice;
-DECLARE_INSTANCE_CHECKER(SMBusIPMIDevice, SMBUS_IPMI,
-                         TYPE_SMBUS_IPMI)
+OBJECT_DECLARE_SIMPLE_TYPE(SMBusIPMIDevice, SMBUS_IPMI)
 
 #define SSIF_IPMI_REQUEST                       2
 #define SSIF_IPMI_MULTI_PART_REQUEST_START      6
diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 1dcf525f3f..8285b06e1d 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -27,9 +27,7 @@
 #include "qom/object.h"
 
 #define TYPE_I82378 "i82378"
-typedef struct I82378State I82378State;
-DECLARE_INSTANCE_CHECKER(I82378State, I82378,
-                         TYPE_I82378)
+OBJECT_DECLARE_SIMPLE_TYPE(I82378State, I82378)
 
 struct I82378State {
     PCIDevice parent_obj;
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 8e3ac845b8..a50d97834c 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -52,10 +52,8 @@ struct PIIX4State {
     MemoryRegion rcr_mem;
     uint8_t rcr;
 };
-typedef struct PIIX4State PIIX4State;
 
-DECLARE_INSTANCE_CHECKER(PIIX4State, PIIX4_PCI_DEVICE,
-                         TYPE_PIIX4_PCI_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
 
 static void piix4_isa_reset(DeviceState *dev)
 {
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 1e6b48b2a2..b3170c70c3 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -48,11 +48,9 @@ struct VT82C686BState {
     MemoryRegion superio;
     SuperIOConfig superio_conf;
 };
-typedef struct VT82C686BState VT82C686BState;
 
 #define TYPE_VT82C686B_DEVICE "VT82C686B"
-DECLARE_INSTANCE_CHECKER(VT82C686BState, VT82C686B_DEVICE,
-                         TYPE_VT82C686B_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B_DEVICE)
 
 static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
                                   unsigned size)
@@ -169,29 +167,23 @@ struct VT686PMState {
     PMSMBus smb;
     uint32_t smb_io_base;
 };
-typedef struct VT686PMState VT686PMState;
 
 struct VT686AC97State {
     PCIDevice dev;
 };
-typedef struct VT686AC97State VT686AC97State;
 
 struct VT686MC97State {
     PCIDevice dev;
 };
-typedef struct VT686MC97State VT686MC97State;
 
 #define TYPE_VT82C686B_PM_DEVICE "VT82C686B_PM"
-DECLARE_INSTANCE_CHECKER(VT686PMState, VT82C686B_PM_DEVICE,
-                         TYPE_VT82C686B_PM_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM_DEVICE)
 
 #define TYPE_VT82C686B_MC97_DEVICE "VT82C686B_MC97"
-DECLARE_INSTANCE_CHECKER(VT686MC97State, VT82C686B_MC97_DEVICE,
-                         TYPE_VT82C686B_MC97_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(VT686MC97State, VT82C686B_MC97_DEVICE)
 
 #define TYPE_VT82C686B_AC97_DEVICE "VT82C686B_AC97"
-DECLARE_INSTANCE_CHECKER(VT686AC97State, VT82C686B_AC97_DEVICE,
-                         TYPE_VT82C686B_AC97_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(VT686AC97State, VT82C686B_AC97_DEVICE)
 
 static void pm_update_sci(VT686PMState *s)
 {
diff --git a/hw/m68k/mcf_intc.c b/hw/m68k/mcf_intc.c
index 7ee447240b..cf02f57a71 100644
--- a/hw/m68k/mcf_intc.c
+++ b/hw/m68k/mcf_intc.c
@@ -18,9 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_MCF_INTC "mcf-intc"
-typedef struct mcf_intc_state mcf_intc_state;
-DECLARE_INSTANCE_CHECKER(mcf_intc_state, MCF_INTC,
-                         TYPE_MCF_INTC)
+OBJECT_DECLARE_SIMPLE_TYPE(mcf_intc_state, MCF_INTC)
 
 struct mcf_intc_state {
     SysBusDevice parent_obj;
diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index cbd913b0a2..e7045980b7 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -38,9 +38,7 @@
 #endif
 
 #define TYPE_NEXT_MACHINE MACHINE_TYPE_NAME("next-cube")
-typedef struct NeXTState NeXTState;
-DECLARE_INSTANCE_CHECKER(NeXTState, NEXT_MACHINE,
-                         TYPE_NEXT_MACHINE)
+OBJECT_DECLARE_SIMPLE_TYPE(NeXTState, NEXT_MACHINE)
 
 #define ENTRY       0x0100001e
 #define RAM_SIZE    0x4000000
diff --git a/hw/m68k/next-kbd.c b/hw/m68k/next-kbd.c
index c7ca3fbbc9..c11b5281f1 100644
--- a/hw/m68k/next-kbd.c
+++ b/hw/m68k/next-kbd.c
@@ -38,9 +38,7 @@
 #include "migration/vmstate.h"
 #include "qom/object.h"
 
-typedef struct NextKBDState NextKBDState;
-DECLARE_INSTANCE_CHECKER(NextKBDState, NEXTKBD,
-                         TYPE_NEXTKBD)
+OBJECT_DECLARE_SIMPLE_TYPE(NextKBDState, NEXTKBD)
 
 /* following defintions from next68k netbsd */
 #define CSR_INT 0x00800000
diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index ab9924bf20..1d1b4b5c19 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -29,9 +29,7 @@
 /* Define the PMU device */
 
 #define TYPE_XLNX_ZYNQMP_PMU_SOC "xlnx,zynqmp-pmu-soc"
-typedef struct XlnxZynqMPPMUSoCState XlnxZynqMPPMUSoCState;
-DECLARE_INSTANCE_CHECKER(XlnxZynqMPPMUSoCState, XLNX_ZYNQMP_PMU_SOC,
-                         TYPE_XLNX_ZYNQMP_PMU_SOC)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPPMUSoCState, XLNX_ZYNQMP_PMU_SOC)
 
 #define XLNX_ZYNQMP_PMU_ROM_SIZE    0x8000
 #define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index b613e1e011..e091bc4ed5 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -231,9 +231,7 @@
 
 #define TYPE_GT64120_PCI_HOST_BRIDGE "gt64120"
 
-typedef struct GT64120State GT64120State;
-DECLARE_INSTANCE_CHECKER(GT64120State, GT64120_PCI_HOST_BRIDGE,
-                         TYPE_GT64120_PCI_HOST_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(GT64120State, GT64120_PCI_HOST_BRIDGE)
 
 struct GT64120State {
     PCIHostState parent_obj;
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 5b73ea4692..4019c9dc1a 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -89,9 +89,7 @@ typedef struct {
 } MaltaFPGAState;
 
 #define TYPE_MIPS_MALTA "mips-malta"
-typedef struct MaltaState MaltaState;
-DECLARE_INSTANCE_CHECKER(MaltaState, MIPS_MALTA,
-                         TYPE_MIPS_MALTA)
+OBJECT_DECLARE_SIMPLE_TYPE(MaltaState, MIPS_MALTA)
 
 struct MaltaState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index dca3fba028..a4deb3e7a0 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -90,9 +90,7 @@ struct AppleSMCData {
     QLIST_ENTRY(AppleSMCData) node;
 };
 
-typedef struct AppleSMCState AppleSMCState;
-DECLARE_INSTANCE_CHECKER(AppleSMCState, APPLE_SMC,
-                         TYPE_APPLE_SMC)
+OBJECT_DECLARE_SIMPLE_TYPE(AppleSMCState, APPLE_SMC)
 
 struct AppleSMCState {
     ISADevice parent_obj;
diff --git a/hw/misc/arm_integrator_debug.c b/hw/misc/arm_integrator_debug.c
index 822deffc0c..ec0d4b90d3 100644
--- a/hw/misc/arm_integrator_debug.c
+++ b/hw/misc/arm_integrator_debug.c
@@ -21,9 +21,7 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 
-typedef struct IntegratorDebugState IntegratorDebugState;
-DECLARE_INSTANCE_CHECKER(IntegratorDebugState, INTEGRATOR_DEBUG,
-                         TYPE_INTEGRATOR_DEBUG)
+OBJECT_DECLARE_SIMPLE_TYPE(IntegratorDebugState, INTEGRATOR_DEBUG)
 
 struct IntegratorDebugState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/arm_l2x0.c b/hw/misc/arm_l2x0.c
index 93948c3bd8..75c3eb8982 100644
--- a/hw/misc/arm_l2x0.c
+++ b/hw/misc/arm_l2x0.c
@@ -30,9 +30,7 @@
 #define CACHE_ID 0x410000c8
 
 #define TYPE_ARM_L2X0 "l2x0"
-typedef struct L2x0State L2x0State;
-DECLARE_INSTANCE_CHECKER(L2x0State, ARM_L2X0,
-                         TYPE_ARM_L2X0)
+OBJECT_DECLARE_SIMPLE_TYPE(L2x0State, ARM_L2X0)
 
 struct L2x0State {
     SysBusDevice parent_obj;
diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
index f0f49e76e8..42d4693854 100644
--- a/hw/misc/arm_sysctl.c
+++ b/hw/misc/arm_sysctl.c
@@ -23,9 +23,7 @@
 #define LOCK_VALUE 0xa05f
 
 #define TYPE_ARM_SYSCTL "realview_sysctl"
-typedef struct arm_sysctl_state arm_sysctl_state;
-DECLARE_INSTANCE_CHECKER(arm_sysctl_state, ARM_SYSCTL,
-                         TYPE_ARM_SYSCTL)
+OBJECT_DECLARE_SIMPLE_TYPE(arm_sysctl_state, ARM_SYSCTL)
 
 struct arm_sysctl_state {
     SysBusDevice parent_obj;
diff --git a/hw/misc/debugexit.c b/hw/misc/debugexit.c
index c6b0cffd77..ab6de69ce7 100644
--- a/hw/misc/debugexit.c
+++ b/hw/misc/debugexit.c
@@ -14,9 +14,7 @@
 #include "qom/object.h"
 
 #define TYPE_ISA_DEBUG_EXIT_DEVICE "isa-debug-exit"
-typedef struct ISADebugExitState ISADebugExitState;
-DECLARE_INSTANCE_CHECKER(ISADebugExitState, ISA_DEBUG_EXIT_DEVICE,
-                         TYPE_ISA_DEBUG_EXIT_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(ISADebugExitState, ISA_DEBUG_EXIT_DEVICE)
 
 struct ISADebugExitState {
     ISADevice parent_obj;
diff --git a/hw/misc/eccmemctl.c b/hw/misc/eccmemctl.c
index 468c2a491d..c65806e3d9 100644
--- a/hw/misc/eccmemctl.c
+++ b/hw/misc/eccmemctl.c
@@ -127,9 +127,7 @@
 #define ECC_DIAG_MASK  (ECC_DIAG_SIZE - 1)
 
 #define TYPE_ECC_MEMCTL "eccmemctl"
-typedef struct ECCState ECCState;
-DECLARE_INSTANCE_CHECKER(ECCState, ECC_MEMCTL,
-                         TYPE_ECC_MEMCTL)
+OBJECT_DECLARE_SIMPLE_TYPE(ECCState, ECC_MEMCTL)
 
 struct ECCState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/empty_slot.c b/hw/misc/empty_slot.c
index 57dcdfbe14..37b0ddfb02 100644
--- a/hw/misc/empty_slot.c
+++ b/hw/misc/empty_slot.c
@@ -18,9 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_EMPTY_SLOT "empty_slot"
-typedef struct EmptySlot EmptySlot;
-DECLARE_INSTANCE_CHECKER(EmptySlot, EMPTY_SLOT,
-                         TYPE_EMPTY_SLOT)
+OBJECT_DECLARE_SIMPLE_TYPE(EmptySlot, EMPTY_SLOT)
 
 struct EmptySlot {
     SysBusDevice parent_obj;
diff --git a/hw/misc/exynos4210_clk.c b/hw/misc/exynos4210_clk.c
index 4b469f6419..58cec282f7 100644
--- a/hw/misc/exynos4210_clk.c
+++ b/hw/misc/exynos4210_clk.c
@@ -25,9 +25,7 @@
 #include "qom/object.h"
 
 #define TYPE_EXYNOS4210_CLK             "exynos4210.clk"
-typedef struct Exynos4210ClkState Exynos4210ClkState;
-DECLARE_INSTANCE_CHECKER(Exynos4210ClkState, EXYNOS4210_CLK,
-                         TYPE_EXYNOS4210_CLK)
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210ClkState, EXYNOS4210_CLK)
 
 #define CLK_PLL_LOCKED                  BIT(29)
 
diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
index b19b82a88c..e24139c630 100644
--- a/hw/misc/exynos4210_pmu.c
+++ b/hw/misc/exynos4210_pmu.c
@@ -395,9 +395,7 @@ static const Exynos4210PmuReg exynos4210_pmu_regs[] = {
 #define PMU_NUM_OF_REGISTERS ARRAY_SIZE(exynos4210_pmu_regs)
 
 #define TYPE_EXYNOS4210_PMU "exynos4210.pmu"
-typedef struct Exynos4210PmuState Exynos4210PmuState;
-DECLARE_INSTANCE_CHECKER(Exynos4210PmuState, EXYNOS4210_PMU,
-                         TYPE_EXYNOS4210_PMU)
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210PmuState, EXYNOS4210_PMU)
 
 struct Exynos4210PmuState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/exynos4210_rng.c b/hw/misc/exynos4210_rng.c
index 13ec6e188b..1b9e8347a1 100644
--- a/hw/misc/exynos4210_rng.c
+++ b/hw/misc/exynos4210_rng.c
@@ -36,9 +36,7 @@
     } while (0)
 
 #define TYPE_EXYNOS4210_RNG             "exynos4210.rng"
-typedef struct Exynos4210RngState Exynos4210RngState;
-DECLARE_INSTANCE_CHECKER(Exynos4210RngState, EXYNOS4210_RNG,
-                         TYPE_EXYNOS4210_RNG)
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210RngState, EXYNOS4210_RNG)
 
 /*
  * Exynos4220, PRNG, only polling mode is supported.
diff --git a/hw/misc/milkymist-hpdmc.c b/hw/misc/milkymist-hpdmc.c
index f25715e09e..5e26d90ceb 100644
--- a/hw/misc/milkymist-hpdmc.c
+++ b/hw/misc/milkymist-hpdmc.c
@@ -44,9 +44,7 @@ enum {
 };
 
 #define TYPE_MILKYMIST_HPDMC "milkymist-hpdmc"
-typedef struct MilkymistHpdmcState MilkymistHpdmcState;
-DECLARE_INSTANCE_CHECKER(MilkymistHpdmcState, MILKYMIST_HPDMC,
-                         TYPE_MILKYMIST_HPDMC)
+OBJECT_DECLARE_SIMPLE_TYPE(MilkymistHpdmcState, MILKYMIST_HPDMC)
 
 struct MilkymistHpdmcState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/milkymist-pfpu.c b/hw/misc/milkymist-pfpu.c
index 489bb8873f..83491dbca2 100644
--- a/hw/misc/milkymist-pfpu.c
+++ b/hw/misc/milkymist-pfpu.c
@@ -121,9 +121,7 @@ static const char *opcode_to_str[] = {
 #endif
 
 #define TYPE_MILKYMIST_PFPU "milkymist-pfpu"
-typedef struct MilkymistPFPUState MilkymistPFPUState;
-DECLARE_INSTANCE_CHECKER(MilkymistPFPUState, MILKYMIST_PFPU,
-                         TYPE_MILKYMIST_PFPU)
+OBJECT_DECLARE_SIMPLE_TYPE(MilkymistPFPUState, MILKYMIST_PFPU)
 
 struct MilkymistPFPUState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c
index f74d8cdd4a..edfc35d5f0 100644
--- a/hw/misc/mst_fpga.c
+++ b/hw/misc/mst_fpga.c
@@ -41,9 +41,7 @@
 #define MST_PCMCIA_CD1_IRQ	13
 
 #define TYPE_MAINSTONE_FPGA "mainstone-fpga"
-typedef struct mst_irq_state mst_irq_state;
-DECLARE_INSTANCE_CHECKER(mst_irq_state, MAINSTONE_FPGA,
-                         TYPE_MAINSTONE_FPGA)
+OBJECT_DECLARE_SIMPLE_TYPE(mst_irq_state, MAINSTONE_FPGA)
 
 struct mst_irq_state {
     SysBusDevice parent_obj;
diff --git a/hw/misc/pc-testdev.c b/hw/misc/pc-testdev.c
index 577a15bf58..e389651869 100644
--- a/hw/misc/pc-testdev.c
+++ b/hw/misc/pc-testdev.c
@@ -54,11 +54,9 @@ struct PCTestdev {
     uint32_t ioport_data;
     char iomem_buf[IOMEM_LEN];
 };
-typedef struct PCTestdev PCTestdev;
 
 #define TYPE_TESTDEV "pc-testdev"
-DECLARE_INSTANCE_CHECKER(PCTestdev, TESTDEV,
-                         TYPE_TESTDEV)
+OBJECT_DECLARE_SIMPLE_TYPE(PCTestdev, TESTDEV)
 
 static uint64_t test_irq_line_read(void *opaque, hwaddr addr, unsigned size)
 {
diff --git a/hw/misc/pci-testdev.c b/hw/misc/pci-testdev.c
index 86d4816769..03845c8de3 100644
--- a/hw/misc/pci-testdev.c
+++ b/hw/misc/pci-testdev.c
@@ -92,12 +92,10 @@ struct PCITestDevState {
     uint64_t membar_size;
     MemoryRegion membar;
 };
-typedef struct PCITestDevState PCITestDevState;
 
 #define TYPE_PCI_TEST_DEV "pci-testdev"
 
-DECLARE_INSTANCE_CHECKER(PCITestDevState, PCI_TEST_DEV,
-                         TYPE_PCI_TEST_DEV)
+OBJECT_DECLARE_SIMPLE_TYPE(PCITestDevState, PCI_TEST_DEV)
 
 #define IOTEST_IS_MEM(i) (strcmp(IOTEST_TYPE(i), "portio"))
 #define IOTEST_REGION(d, i) (IOTEST_IS_MEM(i) ?  &(d)->mmio : &(d)->portio)
diff --git a/hw/misc/puv3_pm.c b/hw/misc/puv3_pm.c
index cac8497f81..676c23f7db 100644
--- a/hw/misc/puv3_pm.c
+++ b/hw/misc/puv3_pm.c
@@ -19,9 +19,7 @@
 #include "qemu/log.h"
 
 #define TYPE_PUV3_PM "puv3_pm"
-typedef struct PUV3PMState PUV3PMState;
-DECLARE_INSTANCE_CHECKER(PUV3PMState, PUV3_PM,
-                         TYPE_PUV3_PM)
+OBJECT_DECLARE_SIMPLE_TYPE(PUV3PMState, PUV3_PM)
 
 struct PUV3PMState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/sga.c b/hw/misc/sga.c
index 477f587ef3..4dbe6d78f9 100644
--- a/hw/misc/sga.c
+++ b/hw/misc/sga.c
@@ -34,9 +34,7 @@
 #define SGABIOS_FILENAME "sgabios.bin"
 
 #define TYPE_SGA "sga"
-typedef struct ISASGAState ISASGAState;
-DECLARE_INSTANCE_CHECKER(ISASGAState, SGA,
-                         TYPE_SGA)
+OBJECT_DECLARE_SIMPLE_TYPE(ISASGAState, SGA)
 
 struct ISASGAState {
     ISADevice parent_obj;
diff --git a/hw/misc/slavio_misc.c b/hw/misc/slavio_misc.c
index ab27ad462e..e8eb71570a 100644
--- a/hw/misc/slavio_misc.c
+++ b/hw/misc/slavio_misc.c
@@ -40,9 +40,7 @@
  */
 
 #define TYPE_SLAVIO_MISC "slavio_misc"
-typedef struct MiscState MiscState;
-DECLARE_INSTANCE_CHECKER(MiscState, SLAVIO_MISC,
-                         TYPE_SLAVIO_MISC)
+OBJECT_DECLARE_SIMPLE_TYPE(MiscState, SLAVIO_MISC)
 
 struct MiscState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index bedf09a6f5..a2b28019e3 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -183,9 +183,7 @@ REG32(DDRIOB, 0xb40)
 #define ZYNQ_SLCR_NUM_REGS      (ZYNQ_SLCR_MMIO_SIZE / 4)
 
 #define TYPE_ZYNQ_SLCR "xilinx,zynq_slcr"
-typedef struct ZynqSLCRState ZynqSLCRState;
-DECLARE_INSTANCE_CHECKER(ZynqSLCRState, ZYNQ_SLCR,
-                         TYPE_ZYNQ_SLCR)
+OBJECT_DECLARE_SIMPLE_TYPE(ZynqSLCRState, ZYNQ_SLCR)
 
 struct ZynqSLCRState {
     SysBusDevice parent_obj;
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 56b96e9b0f..674b04b354 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -151,9 +151,7 @@ do { printf("sonic ERROR: %s: " fmt, __func__ , ## __VA_ARGS__); } while (0)
 #define SONIC_DESC_ADDR  0xFFFE
 
 #define TYPE_DP8393X "dp8393x"
-typedef struct dp8393xState dp8393xState;
-DECLARE_INSTANCE_CHECKER(dp8393xState, DP8393X,
-                         TYPE_DP8393X)
+OBJECT_DECLARE_SIMPLE_TYPE(dp8393xState, DP8393X)
 
 struct dp8393xState {
     SysBusDevice parent_obj;
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 938d44f198..b6f1ae3c8f 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -56,9 +56,7 @@
 #include "qom/object.h"
 
 #define TYPE_E1000E "e1000e"
-typedef struct E1000EState E1000EState;
-DECLARE_INSTANCE_CHECKER(E1000EState, E1000E,
-                         TYPE_E1000E)
+OBJECT_DECLARE_SIMPLE_TYPE(E1000EState, E1000E)
 
 struct E1000EState {
     PCIDevice parent_obj;
diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index 36d898ad16..1b82aec794 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -324,9 +324,7 @@ static void mdio_cycle(struct qemu_mdio *bus)
 #define FS_ETH_MAX_REGS      0x17
 
 #define TYPE_ETRAX_FS_ETH "etraxfs-eth"
-typedef struct ETRAXFSEthState ETRAXFSEthState;
-DECLARE_INSTANCE_CHECKER(ETRAXFSEthState, ETRAX_FS_ETH,
-                         TYPE_ETRAX_FS_ETH)
+OBJECT_DECLARE_SIMPLE_TYPE(ETRAXFSEthState, ETRAX_FS_ETH)
 
 struct ETRAXFSEthState {
     SysBusDevice parent_obj;
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 57a59accd0..ab57c02c8e 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -181,9 +181,7 @@ static const VMStateDescription vmstate_lan9118_packet = {
     }
 };
 
-typedef struct lan9118_state lan9118_state;
-DECLARE_INSTANCE_CHECKER(lan9118_state, LAN9118,
-                         TYPE_LAN9118)
+OBJECT_DECLARE_SIMPLE_TYPE(lan9118_state, LAN9118)
 
 struct lan9118_state {
     SysBusDevice parent_obj;
diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 41a8543edf..78c20c94e5 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -99,9 +99,7 @@ struct MilkymistMinimac2MdioState {
 typedef struct MilkymistMinimac2MdioState MilkymistMinimac2MdioState;
 
 #define TYPE_MILKYMIST_MINIMAC2 "milkymist-minimac2"
-typedef struct MilkymistMinimac2State MilkymistMinimac2State;
-DECLARE_INSTANCE_CHECKER(MilkymistMinimac2State, MILKYMIST_MINIMAC2,
-                         TYPE_MILKYMIST_MINIMAC2)
+OBJECT_DECLARE_SIMPLE_TYPE(MilkymistMinimac2State, MILKYMIST_MINIMAC2)
 
 struct MilkymistMinimac2State {
     SysBusDevice parent_obj;
diff --git a/hw/net/mipsnet.c b/hw/net/mipsnet.c
index 61dbd575da..2ade72dea0 100644
--- a/hw/net/mipsnet.c
+++ b/hw/net/mipsnet.c
@@ -25,9 +25,7 @@
 #define MAX_ETH_FRAME_SIZE      1514
 
 #define TYPE_MIPS_NET "mipsnet"
-typedef struct MIPSnetState MIPSnetState;
-DECLARE_INSTANCE_CHECKER(MIPSnetState, MIPS_NET,
-                         TYPE_MIPS_NET)
+OBJECT_DECLARE_SIMPLE_TYPE(MIPSnetState, MIPS_NET)
 
 struct MIPSnetState {
     SysBusDevice parent_obj;
diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
index 688a0cc4f6..dd6f6e34d3 100644
--- a/hw/net/ne2000-isa.c
+++ b/hw/net/ne2000-isa.c
@@ -33,9 +33,7 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 
-typedef struct ISANE2000State ISANE2000State;
-DECLARE_INSTANCE_CHECKER(ISANE2000State, ISA_NE2000,
-                         TYPE_ISA_NE2000)
+OBJECT_DECLARE_SIMPLE_TYPE(ISANE2000State, ISA_NE2000)
 
 struct ISANE2000State {
     ISADevice parent_obj;
diff --git a/hw/net/opencores_eth.c b/hw/net/opencores_eth.c
index 5cd204c30c..0b3dc3146e 100644
--- a/hw/net/opencores_eth.c
+++ b/hw/net/opencores_eth.c
@@ -272,9 +272,7 @@ typedef struct desc {
 #define DEFAULT_PHY 1
 
 #define TYPE_OPEN_ETH "open_eth"
-typedef struct OpenEthState OpenEthState;
-DECLARE_INSTANCE_CHECKER(OpenEthState, OPEN_ETH,
-                         TYPE_OPEN_ETH)
+OBJECT_DECLARE_SIMPLE_TYPE(OpenEthState, OPEN_ETH)
 
 struct OpenEthState {
     SysBusDevice parent_obj;
diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
index 449970bc52..ccc3fce2a0 100644
--- a/hw/net/pcnet-pci.c
+++ b/hw/net/pcnet-pci.c
@@ -52,9 +52,7 @@
 
 #define TYPE_PCI_PCNET "pcnet"
 
-typedef struct PCIPCNetState PCIPCNetState;
-DECLARE_INSTANCE_CHECKER(PCIPCNetState, PCI_PCNET,
-                         TYPE_PCI_PCNET)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIPCNetState, PCI_PCNET)
 
 struct PCIPCNetState {
     /*< private >*/
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 9246388f58..ba5ace1ab7 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -94,9 +94,7 @@ static inline GCC_FMT_ATTR(1, 2) int DPRINTF(const char *fmt, ...)
 
 #define TYPE_RTL8139 "rtl8139"
 
-typedef struct RTL8139State RTL8139State;
-DECLARE_INSTANCE_CHECKER(RTL8139State, RTL8139,
-                         TYPE_RTL8139)
+OBJECT_DECLARE_SIMPLE_TYPE(RTL8139State, RTL8139)
 
 /* Symbolic offsets to registers. */
 enum RTL8139_registers {
diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 9fad904321..ad778cd8fc 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -25,9 +25,7 @@
 #define NUM_PACKETS 4
 
 #define TYPE_SMC91C111 "smc91c111"
-typedef struct smc91c111_state smc91c111_state;
-DECLARE_INSTANCE_CHECKER(smc91c111_state, SMC91C111,
-                         TYPE_SMC91C111)
+OBJECT_DECLARE_SIMPLE_TYPE(smc91c111_state, SMC91C111)
 
 struct smc91c111_state {
     SysBusDevice parent_obj;
diff --git a/hw/net/spapr_llan.c b/hw/net/spapr_llan.c
index d34cb29607..2093f1bad0 100644
--- a/hw/net/spapr_llan.c
+++ b/hw/net/spapr_llan.c
@@ -85,9 +85,7 @@ typedef uint64_t vlan_bd_t;
 #define VLAN_MAX_BUFS        (VLAN_RX_BDS_LEN / 8)
 
 #define TYPE_VIO_SPAPR_VLAN_DEVICE "spapr-vlan"
-typedef struct SpaprVioVlan SpaprVioVlan;
-DECLARE_INSTANCE_CHECKER(SpaprVioVlan, VIO_SPAPR_VLAN_DEVICE,
-                         TYPE_VIO_SPAPR_VLAN_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(SpaprVioVlan, VIO_SPAPR_VLAN_DEVICE)
 
 #define RX_POOL_MAX_BDS 4096
 #define RX_MAX_POOLS 5
diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 9f13afa4e4..8dd60783d8 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -51,9 +51,7 @@ do { fprintf(stderr, "stellaris_enet: error: " fmt , ## __VA_ARGS__);} while (0)
 #define SE_TCTL_DUPLEX  0x08
 
 #define TYPE_STELLARIS_ENET "stellaris_enet"
-typedef struct stellaris_enet_state stellaris_enet_state;
-DECLARE_INSTANCE_CHECKER(stellaris_enet_state, STELLARIS_ENET,
-                         TYPE_STELLARIS_ENET)
+OBJECT_DECLARE_SIMPLE_TYPE(stellaris_enet_state, STELLARIS_ENET)
 
 typedef struct {
     uint8_t data[2048];
diff --git a/hw/net/sungem.c b/hw/net/sungem.c
index 91753830a7..33c3722df6 100644
--- a/hw/net/sungem.c
+++ b/hw/net/sungem.c
@@ -23,9 +23,7 @@
 
 #define TYPE_SUNGEM "sungem"
 
-typedef struct SunGEMState SunGEMState;
-DECLARE_INSTANCE_CHECKER(SunGEMState, SUNGEM,
-                         TYPE_SUNGEM)
+OBJECT_DECLARE_SIMPLE_TYPE(SunGEMState, SUNGEM)
 
 #define MAX_PACKET_SIZE 9016
 
diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index 7364ba1019..fc34905f87 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -130,9 +130,7 @@
 #define MII_COMMAND_WRITE      0x1
 
 #define TYPE_SUNHME "sunhme"
-typedef struct SunHMEState SunHMEState;
-DECLARE_INSTANCE_CHECKER(SunHMEState, SUNHME,
-                         TYPE_SUNHME)
+OBJECT_DECLARE_SIMPLE_TYPE(SunHMEState, SUNHME)
 
 /* Maximum size of buffer */
 #define HME_FIFO_SIZE          0x800
diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
index a066550023..00859a7d50 100644
--- a/hw/net/xgmac.c
+++ b/hw/net/xgmac.c
@@ -140,9 +140,7 @@ typedef struct RxTxStats {
 } RxTxStats;
 
 #define TYPE_XGMAC "xgmac"
-typedef struct XgmacState XgmacState;
-DECLARE_INSTANCE_CHECKER(XgmacState, XGMAC,
-                         TYPE_XGMAC)
+OBJECT_DECLARE_SIMPLE_TYPE(XgmacState, XGMAC)
 
 struct XgmacState {
     SysBusDevice parent_obj;
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 4e13786e50..f8cf5290e1 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -43,9 +43,7 @@
 #define TYPE_XILINX_AXI_ENET_DATA_STREAM "xilinx-axienet-data-stream"
 #define TYPE_XILINX_AXI_ENET_CONTROL_STREAM "xilinx-axienet-control-stream"
 
-typedef struct XilinxAXIEnet XilinxAXIEnet;
-DECLARE_INSTANCE_CHECKER(XilinxAXIEnet, XILINX_AXI_ENET,
-                         TYPE_XILINX_AXI_ENET)
+OBJECT_DECLARE_SIMPLE_TYPE(XilinxAXIEnet, XILINX_AXI_ENET)
 
 typedef struct XilinxAXIEnetStreamSlave XilinxAXIEnetStreamSlave;
 DECLARE_INSTANCE_CHECKER(XilinxAXIEnetStreamSlave, XILINX_AXI_ENET_DATA_STREAM,
diff --git a/hw/nvram/ds1225y.c b/hw/nvram/ds1225y.c
index 44fb7a94d3..3660a47c51 100644
--- a/hw/nvram/ds1225y.c
+++ b/hw/nvram/ds1225y.c
@@ -110,9 +110,7 @@ static const VMStateDescription vmstate_nvram = {
 };
 
 #define TYPE_DS1225Y "ds1225y"
-typedef struct SysBusNvRamState SysBusNvRamState;
-DECLARE_INSTANCE_CHECKER(SysBusNvRamState, DS1225Y,
-                         TYPE_DS1225Y)
+OBJECT_DECLARE_SIMPLE_TYPE(SysBusNvRamState, DS1225Y)
 
 struct SysBusNvRamState {
     SysBusDevice parent_obj;
diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
index 57ccc174f2..fc53a42572 100644
--- a/hw/nvram/spapr_nvram.c
+++ b/hw/nvram/spapr_nvram.c
@@ -48,11 +48,9 @@ struct SpaprNvram {
     BlockBackend *blk;
     VMChangeStateEntry *vmstate;
 };
-typedef struct SpaprNvram SpaprNvram;
 
 #define TYPE_VIO_SPAPR_NVRAM "spapr-nvram"
-DECLARE_INSTANCE_CHECKER(SpaprNvram, VIO_SPAPR_NVRAM,
-                         TYPE_VIO_SPAPR_NVRAM)
+OBJECT_DECLARE_SIMPLE_TYPE(SpaprNvram, VIO_SPAPR_NVRAM)
 
 #define MIN_NVRAM_SIZE      (8 * KiB)
 #define DEFAULT_NVRAM_SIZE  (64 * KiB)
diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
index e88998d88c..4773d07e6d 100644
--- a/hw/pci-bridge/dec.c
+++ b/hw/pci-bridge/dec.c
@@ -34,9 +34,7 @@
 #include "hw/pci/pci_bus.h"
 #include "qom/object.h"
 
-typedef struct DECState DECState;
-DECLARE_INSTANCE_CHECKER(DECState, DEC_21154,
-                         TYPE_DEC_21154)
+OBJECT_DECLARE_SIMPLE_TYPE(DECState, DEC_21154)
 
 struct DECState {
     PCIHostState parent_obj;
diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
index 67c71d566b..8931afc049 100644
--- a/hw/pci-bridge/gen_pcie_root_port.c
+++ b/hw/pci-bridge/gen_pcie_root_port.c
@@ -20,9 +20,7 @@
 #include "qom/object.h"
 
 #define TYPE_GEN_PCIE_ROOT_PORT                "pcie-root-port"
-typedef struct GenPCIERootPort GenPCIERootPort;
-DECLARE_INSTANCE_CHECKER(GenPCIERootPort, GEN_PCIE_ROOT_PORT,
-                         TYPE_GEN_PCIE_ROOT_PORT)
+OBJECT_DECLARE_SIMPLE_TYPE(GenPCIERootPort, GEN_PCIE_ROOT_PORT)
 
 #define GEN_PCIE_ROOT_PORT_AER_OFFSET           0x100
 #define GEN_PCIE_ROOT_PORT_ACS_OFFSET \
diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index b86d76caf3..657a06ddbe 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -35,9 +35,7 @@
 
 #define TYPE_PCI_BRIDGE_DEV      "pci-bridge"
 #define TYPE_PCI_BRIDGE_SEAT_DEV "pci-bridge-seat"
-typedef struct PCIBridgeDev PCIBridgeDev;
-DECLARE_INSTANCE_CHECKER(PCIBridgeDev, PCI_BRIDGE_DEV,
-                         TYPE_PCI_BRIDGE_DEV)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIBridgeDev, PCI_BRIDGE_DEV)
 
 struct PCIBridgeDev {
     /*< private >*/
diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index abc98f8cd9..1cd917a459 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -27,11 +27,9 @@ struct PCIEPCIBridge {
     MemoryRegion shpc_bar;
     /*< public >*/
 };
-typedef struct PCIEPCIBridge PCIEPCIBridge;
 
 #define TYPE_PCIE_PCI_BRIDGE_DEV "pcie-pci-bridge"
-DECLARE_INSTANCE_CHECKER(PCIEPCIBridge, PCIE_PCI_BRIDGE_DEV,
-                         TYPE_PCIE_PCI_BRIDGE_DEV)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIEPCIBridge, PCIE_PCI_BRIDGE_DEV)
 
 static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
 {
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index d10fbd39d3..a99eced065 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -240,12 +240,10 @@ struct BonitoState {
 };
 
 #define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
-DECLARE_INSTANCE_CHECKER(BonitoState, BONITO_PCI_HOST_BRIDGE,
-                         TYPE_BONITO_PCI_HOST_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(BonitoState, BONITO_PCI_HOST_BRIDGE)
 
 #define TYPE_PCI_BONITO "Bonito"
-DECLARE_INSTANCE_CHECKER(PCIBonitoState, PCI_BONITO,
-                         TYPE_PCI_BONITO)
+OBJECT_DECLARE_SIMPLE_TYPE(PCIBonitoState, PCI_BONITO)
 
 static void bonito_writel(void *opaque, hwaddr addr,
                           uint64_t val, unsigned size)
diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index fd7d6dcc06..57c29b20af 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -35,9 +35,7 @@
 #include "trace.h"
 #include "qom/object.h"
 
-typedef struct GrackleState GrackleState;
-DECLARE_INSTANCE_CHECKER(GrackleState, GRACKLE_PCI_HOST_BRIDGE,
-                         TYPE_GRACKLE_PCI_HOST_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(GrackleState, GRACKLE_PCI_HOST_BRIDGE)
 
 struct GrackleState {
     PCIHostState parent_obj;
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 93c62235ca..aecbcc2446 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -42,9 +42,7 @@
  * https://wiki.qemu.org/File:29054901.pdf
  */
 
-typedef struct I440FXState I440FXState;
-DECLARE_INSTANCE_CHECKER(I440FXState, I440FX_PCI_HOST_BRIDGE,
-                         TYPE_I440FX_PCI_HOST_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(I440FXState, I440FX_PCI_HOST_BRIDGE)
 
 struct I440FXState {
     PCIHostState parent_obj;
diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
index f376374e24..9517aab913 100644
--- a/hw/pci-host/ppce500.c
+++ b/hw/pci-host/ppce500.c
@@ -92,9 +92,7 @@ struct pci_inbound {
 
 #define TYPE_PPC_E500_PCI_HOST_BRIDGE "e500-pcihost"
 
-typedef struct PPCE500PCIState PPCE500PCIState;
-DECLARE_INSTANCE_CHECKER(PPCE500PCIState, PPC_E500_PCI_HOST_BRIDGE,
-                         TYPE_PPC_E500_PCI_HOST_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(PPCE500PCIState, PPC_E500_PCI_HOST_BRIDGE)
 
 struct PPCE500PCIState {
     PCIHostState parent_obj;
@@ -116,9 +114,7 @@ struct PPCE500PCIState {
 };
 
 #define TYPE_PPC_E500_PCI_BRIDGE "e500-host-bridge"
-typedef struct PPCE500PCIBridgeState PPCE500PCIBridgeState;
-DECLARE_INSTANCE_CHECKER(PPCE500PCIBridgeState, PPC_E500_PCI_BRIDGE,
-                         TYPE_PPC_E500_PCI_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(PPCE500PCIBridgeState, PPC_E500_PCI_BRIDGE)
 
 struct PPCE500PCIBridgeState {
     /*< private >*/
diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index b234fd7c8a..d0323fefb1 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -43,9 +43,7 @@
 #define TYPE_RAVEN_PCI_DEVICE "raven"
 #define TYPE_RAVEN_PCI_HOST_BRIDGE "raven-pcihost"
 
-typedef struct RavenPCIState RavenPCIState;
-DECLARE_INSTANCE_CHECKER(RavenPCIState, RAVEN_PCI_DEVICE,
-                         TYPE_RAVEN_PCI_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(RavenPCIState, RAVEN_PCI_DEVICE)
 
 struct RavenPCIState {
     PCIDevice dev;
diff --git a/hw/ppc/mpc8544_guts.c b/hw/ppc/mpc8544_guts.c
index b76b5e4701..e8d2d51c20 100644
--- a/hw/ppc/mpc8544_guts.c
+++ b/hw/ppc/mpc8544_guts.c
@@ -55,9 +55,7 @@
 #define MPC8544_GUTS_ADDR_SRDS2CR3    0xF18
 
 #define TYPE_MPC8544_GUTS "mpc8544-guts"
-typedef struct GutsState GutsState;
-DECLARE_INSTANCE_CHECKER(GutsState, MPC8544_GUTS,
-                         TYPE_MPC8544_GUTS)
+OBJECT_DECLARE_SIMPLE_TYPE(GutsState, MPC8544_GUTS)
 
 struct GutsState {
     /*< private >*/
diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index a564fcd600..ee952314c8 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -46,9 +46,7 @@ struct PLBInMap {
 };
 
 #define TYPE_PPC440_PCIX_HOST_BRIDGE "ppc440-pcix-host"
-typedef struct PPC440PCIXState PPC440PCIXState;
-DECLARE_INSTANCE_CHECKER(PPC440PCIXState, PPC440_PCIX_HOST_BRIDGE,
-                         TYPE_PPC440_PCIX_HOST_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(PPC440PCIXState, PPC440_PCIX_HOST_BRIDGE)
 
 #define PPC440_PCIX_NR_POMS 3
 #define PPC440_PCIX_NR_PIMS 3
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index d9ca6bba9b..f6f89058ab 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -1033,9 +1033,7 @@ void ppc4xx_dma_init(CPUPPCState *env, int dcr_base)
 #include "hw/pci/pcie_host.h"
 
 #define TYPE_PPC460EX_PCIE_HOST "ppc460ex-pcie-host"
-typedef struct PPC460EXPCIEState PPC460EXPCIEState;
-DECLARE_INSTANCE_CHECKER(PPC460EXPCIEState, PPC460EX_PCIE_HOST,
-                         TYPE_PPC460EX_PCIE_HOST)
+OBJECT_DECLARE_SIMPLE_TYPE(PPC460EXPCIEState, PPC460EX_PCIE_HOST)
 
 struct PPC460EXPCIEState {
     PCIExpressHost host;
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index c24bac96c3..c812d3408f 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -44,9 +44,7 @@ struct PCITargetMap {
     uint32_t la;
 };
 
-typedef struct PPC4xxPCIState PPC4xxPCIState;
-DECLARE_INSTANCE_CHECKER(PPC4xxPCIState, PPC4xx_PCI_HOST_BRIDGE,
-                         TYPE_PPC4xx_PCI_HOST_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(PPC4xxPCIState, PPC4xx_PCI_HOST_BRIDGE)
 
 #define PPC4xx_PCI_NR_PMMS 3
 #define PPC4xx_PCI_NR_PTMS 2
diff --git a/hw/ppc/ppce500_spin.c b/hw/ppc/ppce500_spin.c
index cd8000ad73..25c9ce745f 100644
--- a/hw/ppc/ppce500_spin.c
+++ b/hw/ppc/ppce500_spin.c
@@ -47,9 +47,7 @@ typedef struct spin_info {
 } QEMU_PACKED SpinInfo;
 
 #define TYPE_E500_SPIN "e500-spin"
-typedef struct SpinState SpinState;
-DECLARE_INSTANCE_CHECKER(SpinState, E500_SPIN,
-                         TYPE_E500_SPIN)
+OBJECT_DECLARE_SIMPLE_TYPE(SpinState, E500_SPIN)
 
 struct SpinState {
     SysBusDevice parent_obj;
diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
index d1e2fb3f8b..4e48ef245c 100644
--- a/hw/ppc/prep_systemio.c
+++ b/hw/ppc/prep_systemio.c
@@ -36,9 +36,7 @@
 #include "trace.h"
 
 #define TYPE_PREP_SYSTEMIO "prep-systemio"
-typedef struct PrepSystemIoState PrepSystemIoState;
-DECLARE_INSTANCE_CHECKER(PrepSystemIoState, PREP_SYSTEMIO,
-                         TYPE_PREP_SYSTEMIO)
+OBJECT_DECLARE_SIMPLE_TYPE(PrepSystemIoState, PREP_SYSTEMIO)
 
 /* Bit as defined in PowerPC Reference Plaform v1.1, sect. 6.1.5, p. 132 */
 #define PREP_BIT(n) (1 << (7 - (n)))
diff --git a/hw/ppc/rs6000_mc.c b/hw/ppc/rs6000_mc.c
index 8611ffa96d..4db5b51a2d 100644
--- a/hw/ppc/rs6000_mc.c
+++ b/hw/ppc/rs6000_mc.c
@@ -29,9 +29,7 @@
 #include "qom/object.h"
 
 #define TYPE_RS6000MC "rs6000-mc"
-typedef struct RS6000MCState RS6000MCState;
-DECLARE_INSTANCE_CHECKER(RS6000MCState, RS6000MC,
-                         TYPE_RS6000MC)
+OBJECT_DECLARE_SIMPLE_TYPE(RS6000MCState, RS6000MC)
 
 struct RS6000MCState {
     ISADevice parent_obj;
diff --git a/hw/ppc/spapr_rng.c b/hw/ppc/spapr_rng.c
index 6c99633faa..d14800e9de 100644
--- a/hw/ppc/spapr_rng.c
+++ b/hw/ppc/spapr_rng.c
@@ -30,9 +30,7 @@
 #include "kvm_ppc.h"
 #include "qom/object.h"
 
-typedef struct SpaprRngState SpaprRngState;
-DECLARE_INSTANCE_CHECKER(SpaprRngState, SPAPR_RNG,
-                         TYPE_SPAPR_RNG)
+OBJECT_DECLARE_SIMPLE_TYPE(SpaprRngState, SPAPR_RNG)
 
 struct SpaprRngState {
     /*< private >*/
diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 10fac3d9c9..bc5ce1a9f4 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -30,9 +30,7 @@
 #define CTRL_OSF   0x20
 
 #define TYPE_DS1338 "ds1338"
-typedef struct DS1338State DS1338State;
-DECLARE_INSTANCE_CHECKER(DS1338State, DS1338,
-                         TYPE_DS1338)
+OBJECT_DECLARE_SIMPLE_TYPE(DS1338State, DS1338)
 
 struct DS1338State {
     I2CSlave parent_obj;
diff --git a/hw/rtc/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
index f8a4fe8a47..4c97624478 100644
--- a/hw/rtc/exynos4210_rtc.c
+++ b/hw/rtc/exynos4210_rtc.c
@@ -85,9 +85,7 @@
 #define     RTC_BASE_FREQ       32768
 
 #define TYPE_EXYNOS4210_RTC "exynos4210.rtc"
-typedef struct Exynos4210RTCState Exynos4210RTCState;
-DECLARE_INSTANCE_CHECKER(Exynos4210RTCState, EXYNOS4210_RTC,
-                         TYPE_EXYNOS4210_RTC)
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210RTCState, EXYNOS4210_RTC)
 
 struct Exynos4210RTCState {
     SysBusDevice parent_obj;
diff --git a/hw/rtc/m41t80.c b/hw/rtc/m41t80.c
index 0b7048c3f4..396d110ba2 100644
--- a/hw/rtc/m41t80.c
+++ b/hw/rtc/m41t80.c
@@ -17,9 +17,7 @@
 #include "qom/object.h"
 
 #define TYPE_M41T80 "m41t80"
-typedef struct M41t80State M41t80State;
-DECLARE_INSTANCE_CHECKER(M41t80State, M41T80,
-                         TYPE_M41T80)
+OBJECT_DECLARE_SIMPLE_TYPE(M41t80State, M41T80)
 
 struct M41t80State {
     I2CSlave parent_obj;
diff --git a/hw/rtc/sun4v-rtc.c b/hw/rtc/sun4v-rtc.c
index 18979d25d0..e037acd1b5 100644
--- a/hw/rtc/sun4v-rtc.c
+++ b/hw/rtc/sun4v-rtc.c
@@ -20,9 +20,7 @@
 
 
 #define TYPE_SUN4V_RTC "sun4v_rtc"
-typedef struct Sun4vRtc Sun4vRtc;
-DECLARE_INSTANCE_CHECKER(Sun4vRtc, SUN4V_RTC,
-                         TYPE_SUN4V_RTC)
+OBJECT_DECLARE_SIMPLE_TYPE(Sun4vRtc, SUN4V_RTC)
 
 struct Sun4vRtc {
     SysBusDevice parent_obj;
diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
index 4f83eff5c3..f838913b37 100644
--- a/hw/rtc/twl92230.c
+++ b/hw/rtc/twl92230.c
@@ -34,9 +34,7 @@
 #define VERBOSE 1
 
 #define TYPE_TWL92230 "twl92230"
-typedef struct MenelausState MenelausState;
-DECLARE_INSTANCE_CHECKER(MenelausState, TWL92230,
-                         TYPE_TWL92230)
+OBJECT_DECLARE_SIMPLE_TYPE(MenelausState, TWL92230)
 
 struct MenelausState {
     I2CSlave parent_obj;
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index e8354a47da..7d13c7dc1c 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -305,13 +305,11 @@ struct LSIState {
 
     uint8_t script_ram[2048 * sizeof(uint32_t)];
 };
-typedef struct LSIState LSIState;
 
 #define TYPE_LSI53C810  "lsi53c810"
 #define TYPE_LSI53C895A "lsi53c895a"
 
-DECLARE_INSTANCE_CHECKER(LSIState, LSI53C895A,
-                         TYPE_LSI53C895A)
+OBJECT_DECLARE_SIMPLE_TYPE(LSIState, LSI53C895A)
 
 static const char *scsi_phases[] = {
     "DOUT",
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index c3e6d1ecef..4aa0224c47 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -91,9 +91,7 @@ typedef struct vscsi_req {
 } vscsi_req;
 
 #define TYPE_VIO_SPAPR_VSCSI_DEVICE "spapr-vscsi"
-typedef struct VSCSIState VSCSIState;
-DECLARE_INSTANCE_CHECKER(VSCSIState, VIO_SPAPR_VSCSI_DEVICE,
-                         TYPE_VIO_SPAPR_VSCSI_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(VSCSIState, VIO_SPAPR_VSCSI_DEVICE)
 
 struct VSCSIState {
     SpaprVioDevice vdev;
diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 4d3ec28f5d..8cde32049e 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -64,9 +64,7 @@ enum {
 };
 
 #define TYPE_MILKYMIST_MEMCARD "milkymist-memcard"
-typedef struct MilkymistMemcardState MilkymistMemcardState;
-DECLARE_INSTANCE_CHECKER(MilkymistMemcardState, MILKYMIST_MEMCARD,
-                         TYPE_MILKYMIST_MEMCARD)
+OBJECT_DECLARE_SIMPLE_TYPE(MilkymistMemcardState, MILKYMIST_MEMCARD)
 
 #define TYPE_MILKYMIST_SDBUS "milkymist-sdbus"
 
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 7829e933a5..960f155098 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -23,9 +23,7 @@
 #define PL181_FIFO_LEN 16
 
 #define TYPE_PL181 "pl181"
-typedef struct PL181State PL181State;
-DECLARE_INSTANCE_CHECKER(PL181State, PL181,
-                         TYPE_PL181)
+OBJECT_DECLARE_SIMPLE_TYPE(PL181State, PL181)
 
 #define TYPE_PL181_BUS "pl181-bus"
 
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index dd07258d4e..14c8e04a89 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -52,11 +52,9 @@ struct ssi_sd_state {
     int32_t stopping;
     SDBus sdbus;
 };
-typedef struct ssi_sd_state ssi_sd_state;
 
 #define TYPE_SSI_SD "ssi-sd"
-DECLARE_INSTANCE_CHECKER(ssi_sd_state, SSI_SD,
-                         TYPE_SSI_SD)
+OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 
 /* State word bits.  */
 #define SSI_SDR_LOCKED          0x0001
diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
index dc73845125..73d2d0bccb 100644
--- a/hw/sh4/sh_pci.c
+++ b/hw/sh4/sh_pci.c
@@ -35,9 +35,7 @@
 
 #define TYPE_SH_PCI_HOST_BRIDGE "sh_pci"
 
-typedef struct SHPCIState SHPCIState;
-DECLARE_INSTANCE_CHECKER(SHPCIState, SH_PCI_HOST_BRIDGE,
-                         TYPE_SH_PCI_HOST_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(SHPCIState, SH_PCI_HOST_BRIDGE)
 
 struct SHPCIState {
     PCIHostState parent_obj;
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 947b69d159..54a2b2f9ef 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -582,9 +582,7 @@ static void idreg_init(hwaddr addr)
                             idreg_data, sizeof(idreg_data));
 }
 
-typedef struct IDRegState IDRegState;
-DECLARE_INSTANCE_CHECKER(IDRegState, MACIO_ID_REGISTER,
-                         TYPE_MACIO_ID_REGISTER)
+OBJECT_DECLARE_SIMPLE_TYPE(IDRegState, MACIO_ID_REGISTER)
 
 struct IDRegState {
     SysBusDevice parent_obj;
@@ -625,9 +623,7 @@ static const TypeInfo idreg_info = {
 };
 
 #define TYPE_TCX_AFX "tcx_afx"
-typedef struct AFXState AFXState;
-DECLARE_INSTANCE_CHECKER(AFXState, TCX_AFX,
-                         TYPE_TCX_AFX)
+OBJECT_DECLARE_SIMPLE_TYPE(AFXState, TCX_AFX)
 
 struct AFXState {
     SysBusDevice parent_obj;
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index b4aabfc076..ad5ca2472a 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -90,11 +90,9 @@ struct EbusState {
     MemoryRegion bar0;
     MemoryRegion bar1;
 };
-typedef struct EbusState EbusState;
 
 #define TYPE_EBUS "ebus"
-DECLARE_INSTANCE_CHECKER(EbusState, EBUS,
-                         TYPE_EBUS)
+OBJECT_DECLARE_SIMPLE_TYPE(EbusState, EBUS)
 
 const char *fw_cfg_arch_key_name(uint16_t key)
 {
@@ -229,9 +227,7 @@ typedef struct ResetData {
 } ResetData;
 
 #define TYPE_SUN4U_POWER "power"
-typedef struct PowerDevice PowerDevice;
-DECLARE_INSTANCE_CHECKER(PowerDevice, SUN4U_POWER,
-                         TYPE_SUN4U_POWER)
+OBJECT_DECLARE_SIMPLE_TYPE(PowerDevice, SUN4U_POWER)
 
 struct PowerDevice {
     SysBusDevice parent_obj;
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index faf7633e70..4278d0e444 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -24,8 +24,7 @@ struct SSIBus {
 };
 
 #define TYPE_SSI_BUS "SSI"
-DECLARE_INSTANCE_CHECKER(SSIBus, SSI_BUS,
-                         TYPE_SSI_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(SSIBus, SSI_BUS)
 
 static const TypeInfo ssi_bus_info = {
     .name = TYPE_SSI_BUS,
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index 34fc8da69a..fec8817d94 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -79,9 +79,7 @@
 #define FIFO_CAPACITY 256
 
 #define TYPE_XILINX_SPI "xlnx.xps-spi"
-typedef struct XilinxSPI XilinxSPI;
-DECLARE_INSTANCE_CHECKER(XilinxSPI, XILINX_SPI,
-                         TYPE_XILINX_SPI)
+OBJECT_DECLARE_SIMPLE_TYPE(XilinxSPI, XILINX_SPI)
 
 struct XilinxSPI {
     SysBusDevice parent_obj;
diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c
index c694c98d08..c6e02d2b5a 100644
--- a/hw/timer/altera_timer.c
+++ b/hw/timer/altera_timer.c
@@ -45,9 +45,7 @@
 #define CONTROL_STOP  0x0008
 
 #define TYPE_ALTERA_TIMER "ALTR.timer"
-typedef struct AlteraTimer AlteraTimer;
-DECLARE_INSTANCE_CHECKER(AlteraTimer, ALTERA_TIMER,
-                         TYPE_ALTERA_TIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(AlteraTimer, ALTERA_TIMER)
 
 struct AlteraTimer {
     SysBusDevice  busdev;
diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 79117f45b0..98e70b2d26 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -191,9 +191,7 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
 */
 
 #define TYPE_SP804 "sp804"
-typedef struct SP804State SP804State;
-DECLARE_INSTANCE_CHECKER(SP804State, SP804,
-                         TYPE_SP804)
+OBJECT_DECLARE_SIMPLE_TYPE(SP804State, SP804)
 
 struct SP804State {
     SysBusDevice parent_obj;
@@ -313,9 +311,7 @@ static void sp804_realize(DeviceState *dev, Error **errp)
 /* Integrator/CP timer module.  */
 
 #define TYPE_INTEGRATOR_PIT "integrator_pit"
-typedef struct icp_pit_state icp_pit_state;
-DECLARE_INSTANCE_CHECKER(icp_pit_state, INTEGRATOR_PIT,
-                         TYPE_INTEGRATOR_PIT)
+OBJECT_DECLARE_SIMPLE_TYPE(icp_pit_state, INTEGRATOR_PIT)
 
 struct icp_pit_state {
     SysBusDevice parent_obj;
diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
index 52e637545a..64108241ba 100644
--- a/hw/timer/cadence_ttc.c
+++ b/hw/timer/cadence_ttc.c
@@ -70,9 +70,7 @@ typedef struct {
 } CadenceTimerState;
 
 #define TYPE_CADENCE_TTC "cadence_ttc"
-typedef struct CadenceTTCState CadenceTTCState;
-DECLARE_INSTANCE_CHECKER(CadenceTTCState, CADENCE_TTC,
-                         TYPE_CADENCE_TTC)
+OBJECT_DECLARE_SIMPLE_TYPE(CadenceTTCState, CADENCE_TTC)
 
 struct CadenceTTCState {
     SysBusDevice parent_obj;
diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 0329cae3d9..08ee3ca76c 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -243,9 +243,7 @@ typedef struct {
 } Exynos4210MCTLT;
 
 #define TYPE_EXYNOS4210_MCT "exynos4210.mct"
-typedef struct Exynos4210MCTState Exynos4210MCTState;
-DECLARE_INSTANCE_CHECKER(Exynos4210MCTState, EXYNOS4210_MCT,
-                         TYPE_EXYNOS4210_MCT)
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210MCTState, EXYNOS4210_MCT)
 
 struct Exynos4210MCTState {
     SysBusDevice parent_obj;
diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index 5340fc0425..4fa3d87396 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -103,9 +103,7 @@ typedef struct {
 } Exynos4210PWM;
 
 #define TYPE_EXYNOS4210_PWM "exynos4210.pwm"
-typedef struct Exynos4210PWMState Exynos4210PWMState;
-DECLARE_INSTANCE_CHECKER(Exynos4210PWMState, EXYNOS4210_PWM,
-                         TYPE_EXYNOS4210_PWM)
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210PWMState, EXYNOS4210_PWM)
 
 struct Exynos4210PWMState {
     SysBusDevice parent_obj;
diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index e539fc24f0..d511890109 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -56,9 +56,7 @@
 #define COUNTER_RELOAD_OFFSET 0x04
 #define TIMER_BASE            0x10
 
-typedef struct GPTimerUnit GPTimerUnit;
-DECLARE_INSTANCE_CHECKER(GPTimerUnit, GRLIB_GPTIMER,
-                         TYPE_GRLIB_GPTIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(GPTimerUnit, GRLIB_GPTIMER)
 
 typedef struct GPTimer     GPTimer;
 
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 44bbe3a536..b5d4072490 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -48,9 +48,7 @@
 
 #define HPET_MSI_SUPPORT        0
 
-typedef struct HPETState HPETState;
-DECLARE_INSTANCE_CHECKER(HPETState, HPET,
-                         TYPE_HPET)
+OBJECT_DECLARE_SIMPLE_TYPE(HPETState, HPET)
 
 struct HPETState;
 typedef struct HPETTimer {  /* timers */
diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c
index 93ecb51a97..be87c65b3e 100644
--- a/hw/timer/lm32_timer.c
+++ b/hw/timer/lm32_timer.c
@@ -56,9 +56,7 @@ enum {
 };
 
 #define TYPE_LM32_TIMER "lm32-timer"
-typedef struct LM32TimerState LM32TimerState;
-DECLARE_INSTANCE_CHECKER(LM32TimerState, LM32_TIMER,
-                         TYPE_LM32_TIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(LM32TimerState, LM32_TIMER)
 
 struct LM32TimerState {
     SysBusDevice parent_obj;
diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
index 29500e0457..950437b685 100644
--- a/hw/timer/milkymist-sysctl.c
+++ b/hw/timer/milkymist-sysctl.c
@@ -63,9 +63,7 @@ enum {
 };
 
 #define TYPE_MILKYMIST_SYSCTL "milkymist-sysctl"
-typedef struct MilkymistSysctlState MilkymistSysctlState;
-DECLARE_INSTANCE_CHECKER(MilkymistSysctlState, MILKYMIST_SYSCTL,
-                         TYPE_MILKYMIST_SYSCTL)
+OBJECT_DECLARE_SIMPLE_TYPE(MilkymistSysctlState, MILKYMIST_SYSCTL)
 
 struct MilkymistSysctlState {
     SysBusDevice parent_obj;
diff --git a/hw/timer/puv3_ost.c b/hw/timer/puv3_ost.c
index 3a35ac2b0a..d5bf26b56b 100644
--- a/hw/timer/puv3_ost.c
+++ b/hw/timer/puv3_ost.c
@@ -21,9 +21,7 @@
 #include "hw/unicore32/puv3.h"
 
 #define TYPE_PUV3_OST "puv3_ost"
-typedef struct PUV3OSTState PUV3OSTState;
-DECLARE_INSTANCE_CHECKER(PUV3OSTState, PUV3_OST,
-                         TYPE_PUV3_OST)
+OBJECT_DECLARE_SIMPLE_TYPE(PUV3OSTState, PUV3_OST)
 
 /* puv3 ostimer implementation. */
 struct PUV3OSTState {
diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index 8c3a1f5489..2ae5ae3212 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -67,9 +67,7 @@ static int pxa2xx_timer4_freq[8] = {
 };
 
 #define TYPE_PXA2XX_TIMER "pxa2xx-timer"
-typedef struct PXA2xxTimerInfo PXA2xxTimerInfo;
-DECLARE_INSTANCE_CHECKER(PXA2xxTimerInfo, PXA2XX_TIMER,
-                         TYPE_PXA2XX_TIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxTimerInfo, PXA2XX_TIMER)
 
 
 typedef struct {
diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index 08d6888015..5b2d20cb6a 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -60,9 +60,7 @@ typedef struct CPUTimerState {
 } CPUTimerState;
 
 #define TYPE_SLAVIO_TIMER "slavio_timer"
-typedef struct SLAVIO_TIMERState SLAVIO_TIMERState;
-DECLARE_INSTANCE_CHECKER(SLAVIO_TIMERState, SLAVIO_TIMER,
-                         TYPE_SLAVIO_TIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(SLAVIO_TIMERState, SLAVIO_TIMER)
 
 struct SLAVIO_TIMERState {
     SysBusDevice parent_obj;
diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
index fafdcffa9c..6fd876eebf 100644
--- a/hw/tpm/tpm_tis_isa.c
+++ b/hw/tpm/tpm_tis_isa.c
@@ -38,10 +38,8 @@ struct TPMStateISA {
     /*< public >*/
     TPMState state; /* not a QOM object */
 };
-typedef struct TPMStateISA TPMStateISA;
 
-DECLARE_INSTANCE_CHECKER(TPMStateISA, TPM_TIS_ISA,
-                         TYPE_TPM_TIS_ISA)
+OBJECT_DECLARE_SIMPLE_TYPE(TPMStateISA, TPM_TIS_ISA)
 
 static int tpm_tis_pre_save_isa(void *opaque)
 {
diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
index 20b28eeb28..2c32aa7099 100644
--- a/hw/tpm/tpm_tis_sysbus.c
+++ b/hw/tpm/tpm_tis_sysbus.c
@@ -38,10 +38,8 @@ struct TPMStateSysBus {
     /*< public >*/
     TPMState state; /* not a QOM object */
 };
-typedef struct TPMStateSysBus TPMStateSysBus;
 
-DECLARE_INSTANCE_CHECKER(TPMStateSysBus, TPM_TIS_SYSBUS,
-                         TYPE_TPM_TIS_SYSBUS)
+OBJECT_DECLARE_SIMPLE_TYPE(TPMStateSysBus, TPM_TIS_SYSBUS)
 
 static int tpm_tis_pre_save_sysbus(void *opaque)
 {
diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index 65247ca799..e1486f81e0 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -654,11 +654,9 @@ struct USBAudioState {
     uint32_t buffer_user, buffer;
     bool multi;
 };
-typedef struct USBAudioState USBAudioState;
 
 #define TYPE_USB_AUDIO "usb-audio"
-DECLARE_INSTANCE_CHECKER(USBAudioState, USB_AUDIO,
-                         TYPE_USB_AUDIO)
+OBJECT_DECLARE_SIMPLE_TYPE(USBAudioState, USB_AUDIO)
 
 static void output_callback(void *opaque, int avail)
 {
diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
index 05cfe6baca..fc39bab79f 100644
--- a/hw/usb/dev-hid.c
+++ b/hw/usb/dev-hid.c
@@ -44,11 +44,9 @@ struct USBHIDState {
     char *display;
     uint32_t head;
 };
-typedef struct USBHIDState USBHIDState;
 
 #define TYPE_USB_HID "usb-hid"
-DECLARE_INSTANCE_CHECKER(USBHIDState, USB_HID,
-                         TYPE_USB_HID)
+OBJECT_DECLARE_SIMPLE_TYPE(USBHIDState, USB_HID)
 
 enum {
     STR_MANUFACTURER = 1,
diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
index 7a182f9bec..40c1f90694 100644
--- a/hw/usb/dev-hub.c
+++ b/hw/usb/dev-hub.c
@@ -50,11 +50,9 @@ struct USBHubState {
     QEMUTimer *port_timer;
     USBHubPort ports[MAX_PORTS];
 };
-typedef struct USBHubState USBHubState;
 
 #define TYPE_USB_HUB "usb-hub"
-DECLARE_INSTANCE_CHECKER(USBHubState, USB_HUB,
-                         TYPE_USB_HUB)
+OBJECT_DECLARE_SIMPLE_TYPE(USBHubState, USB_HUB)
 
 #define ClearHubFeature		(0x2000 | USB_REQ_CLEAR_FEATURE)
 #define ClearPortFeature	(0x2300 | USB_REQ_CLEAR_FEATURE)
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index c61c0e0878..bbb8274344 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -238,8 +238,7 @@ typedef struct {
 } QEMU_PACKED ObjectInfo;
 
 #define TYPE_USB_MTP "usb-mtp"
-DECLARE_INSTANCE_CHECKER(MTPState, USB_MTP,
-                         TYPE_USB_MTP)
+OBJECT_DECLARE_SIMPLE_TYPE(MTPState, USB_MTP)
 
 #define QEMU_STORAGE_ID 0x00010001
 
diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index cd32f57685..6c49c16015 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -653,11 +653,9 @@ struct USBNetState {
     NICConf conf;
     QTAILQ_HEAD(, rndis_response) rndis_resp;
 };
-typedef struct USBNetState USBNetState;
 
 #define TYPE_USB_NET "usb-net"
-DECLARE_INSTANCE_CHECKER(USBNetState, USB_NET,
-                         TYPE_USB_NET)
+OBJECT_DECLARE_SIMPLE_TYPE(USBNetState, USB_NET)
 
 static int is_rndis(USBNetState *s)
 {
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index 1a038a222e..b1622b7c7f 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -110,11 +110,9 @@ struct USBSerialState {
     int latency;        /* ms */
     CharBackend cs;
 };
-typedef struct USBSerialState USBSerialState;
 
 #define TYPE_USB_SERIAL "usb-serial-dev"
-DECLARE_INSTANCE_CHECKER(USBSerialState, USB_SERIAL,
-                         TYPE_USB_SERIAL)
+OBJECT_DECLARE_SIMPLE_TYPE(USBSerialState, USB_SERIAL)
 
 enum {
     STR_MANUFACTURER = 1,
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 59b2248f34..946df9734a 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -61,9 +61,7 @@ do { \
 #define D_VERBOSE 4
 
 #define TYPE_USB_CCID_DEV "usb-ccid"
-typedef struct USBCCIDState USBCCIDState;
-DECLARE_INSTANCE_CHECKER(USBCCIDState, USB_CCID_DEV,
-                         TYPE_USB_CCID_DEV)
+OBJECT_DECLARE_SIMPLE_TYPE(USBCCIDState, USB_CCID_DEV)
 /*
  * The two options for variable sized buffers:
  * make them constant size, for large enough constant,
@@ -1177,8 +1175,7 @@ static Property ccid_props[] = {
 };
 
 #define TYPE_CCID_BUS "ccid-bus"
-DECLARE_INSTANCE_CHECKER(CCIDBus, CCID_BUS,
-                         TYPE_CCID_BUS)
+OBJECT_DECLARE_SIMPLE_TYPE(CCIDBus, CCID_BUS)
 
 static const TypeInfo ccid_bus_info = {
     .name = TYPE_CCID_BUS,
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index c36c8e7820..cec071d96c 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -133,8 +133,7 @@ struct UASDevice {
 };
 
 #define TYPE_USB_UAS "usb-uas"
-DECLARE_INSTANCE_CHECKER(UASDevice, USB_UAS,
-                         TYPE_USB_UAS)
+OBJECT_DECLARE_SIMPLE_TYPE(UASDevice, USB_UAS)
 
 struct UASRequest {
     uint16_t     tag;
diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
index 85c4d827bf..b595048635 100644
--- a/hw/usb/dev-wacom.c
+++ b/hw/usb/dev-wacom.c
@@ -53,11 +53,9 @@ struct USBWacomState {
     uint8_t idle;
     int changed;
 };
-typedef struct USBWacomState USBWacomState;
 
 #define TYPE_USB_WACOM "usb-wacom-tablet"
-DECLARE_INSTANCE_CHECKER(USBWacomState, USB_WACOM,
-                         TYPE_USB_WACOM)
+OBJECT_DECLARE_SIMPLE_TYPE(USBWacomState, USB_WACOM)
 
 enum {
     STR_MANUFACTURER = 1,
diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
index f8168a06a3..f95199e0bb 100644
--- a/hw/usb/hcd-ohci-pci.c
+++ b/hw/usb/hcd-ohci-pci.c
@@ -32,9 +32,7 @@
 #include "qom/object.h"
 
 #define TYPE_PCI_OHCI "pci-ohci"
-typedef struct OHCIPCIState OHCIPCIState;
-DECLARE_INSTANCE_CHECKER(OHCIPCIState, PCI_OHCI,
-                         TYPE_PCI_OHCI)
+OBJECT_DECLARE_SIMPLE_TYPE(OHCIPCIState, PCI_OHCI)
 
 struct OHCIPCIState {
     /*< private >*/
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 43c93504a2..b0f7dcd7cf 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -61,9 +61,7 @@
 /* ------------------------------------------------------------------------ */
 
 #define TYPE_USB_HOST_DEVICE "usb-host"
-typedef struct USBHostDevice USBHostDevice;
-DECLARE_INSTANCE_CHECKER(USBHostDevice, USB_HOST_DEVICE,
-                         TYPE_USB_HOST_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(USBHostDevice, USB_HOST_DEVICE)
 
 typedef struct USBHostRequest USBHostRequest;
 typedef struct USBHostIsoXfer USBHostIsoXfer;
diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
index dd20996d13..1dd4071e68 100644
--- a/hw/usb/tusb6010.c
+++ b/hw/usb/tusb6010.c
@@ -31,9 +31,7 @@
 #include "qom/object.h"
 
 #define TYPE_TUSB6010 "tusb6010"
-typedef struct TUSBState TUSBState;
-DECLARE_INSTANCE_CHECKER(TUSBState, TUSB6010,
-                         TYPE_TUSB6010)
+OBJECT_DECLARE_SIMPLE_TYPE(TUSBState, TUSB6010)
 
 struct TUSBState {
     SysBusDevice parent_obj;
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index 582c091a24..9571c2f91f 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -36,10 +36,8 @@ struct VFIOAPDevice {
     APDevice apdev;
     VFIODevice vdev;
 };
-typedef struct VFIOAPDevice VFIOAPDevice;
 
-DECLARE_INSTANCE_CHECKER(VFIOAPDevice, VFIO_AP_DEVICE,
-                         TYPE_VFIO_AP_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOAPDevice, VFIO_AP_DEVICE)
 
 static void vfio_ap_compute_needs_reset(VFIODevice *vdev)
 {
diff --git a/hw/virtio/virtio-input-pci.c b/hw/virtio/virtio-input-pci.c
index 85acd3d2eb..48e9ff38e2 100644
--- a/hw/virtio/virtio-input-pci.c
+++ b/hw/virtio/virtio-input-pci.c
@@ -14,14 +14,11 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 
-typedef struct VirtIOInputPCI VirtIOInputPCI;
-typedef struct VirtIOInputHIDPCI VirtIOInputHIDPCI;
 
 /*
  * virtio-input-pci: This extends VirtioPCIProxy.
  */
-DECLARE_INSTANCE_CHECKER(VirtIOInputPCI, VIRTIO_INPUT_PCI,
-                         TYPE_VIRTIO_INPUT_PCI)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputPCI, VIRTIO_INPUT_PCI)
 
 struct VirtIOInputPCI {
     VirtIOPCIProxy parent_obj;
@@ -32,8 +29,7 @@ struct VirtIOInputPCI {
 #define TYPE_VIRTIO_KEYBOARD_PCI  "virtio-keyboard-pci"
 #define TYPE_VIRTIO_MOUSE_PCI     "virtio-mouse-pci"
 #define TYPE_VIRTIO_TABLET_PCI    "virtio-tablet-pci"
-DECLARE_INSTANCE_CHECKER(VirtIOInputHIDPCI, VIRTIO_INPUT_HID_PCI,
-                         TYPE_VIRTIO_INPUT_HID_PCI)
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputHIDPCI, VIRTIO_INPUT_HID_PCI)
 
 struct VirtIOInputHIDPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index 4f64899a56..502f45a939 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -102,11 +102,9 @@ struct I6300State {
                                  */
 };
 
-typedef struct I6300State I6300State;
 
 #define TYPE_WATCHDOG_I6300ESB_DEVICE "i6300esb"
-DECLARE_INSTANCE_CHECKER(I6300State, WATCHDOG_I6300ESB_DEVICE,
-                         TYPE_WATCHDOG_I6300ESB_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(I6300State, WATCHDOG_I6300ESB_DEVICE)
 
 /* This function is called when the watchdog has either been enabled
  * (hence it starts counting down) or has been keep-alived.
diff --git a/migration/rdma.c b/migration/rdma.c
index 1dc563ec3f..6546509ebf 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -398,9 +398,7 @@ typedef struct RDMAContext {
 } RDMAContext;
 
 #define TYPE_QIO_CHANNEL_RDMA "qio-channel-rdma"
-typedef struct QIOChannelRDMA QIOChannelRDMA;
-DECLARE_INSTANCE_CHECKER(QIOChannelRDMA, QIO_CHANNEL_RDMA,
-                         TYPE_QIO_CHANNEL_RDMA)
+OBJECT_DECLARE_SIMPLE_TYPE(QIOChannelRDMA, QIO_CHANNEL_RDMA)
 
 
 
diff --git a/net/can/can_socketcan.c b/net/can/can_socketcan.c
index f933bd2db2..ce8c2549ed 100644
--- a/net/can/can_socketcan.c
+++ b/net/can/can_socketcan.c
@@ -47,9 +47,7 @@
 #endif /*DEBUG_CAN*/
 
 #define TYPE_CAN_HOST_SOCKETCAN "can-host-socketcan"
-typedef struct CanHostSocketCAN CanHostSocketCAN;
-DECLARE_INSTANCE_CHECKER(CanHostSocketCAN, CAN_HOST_SOCKETCAN,
-                         TYPE_CAN_HOST_SOCKETCAN)
+OBJECT_DECLARE_SIMPLE_TYPE(CanHostSocketCAN, CAN_HOST_SOCKETCAN)
 
 #define CAN_READ_BUF_LEN  5
 struct CanHostSocketCAN {
diff --git a/net/dump.c b/net/dump.c
index 42e64a6f29..7fd448d2e1 100644
--- a/net/dump.c
+++ b/net/dump.c
@@ -140,9 +140,7 @@ static int net_dump_state_init(DumpState *s, const char *filename,
 
 #define TYPE_FILTER_DUMP "filter-dump"
 
-typedef struct NetFilterDumpState NetFilterDumpState;
-DECLARE_INSTANCE_CHECKER(NetFilterDumpState, FILTER_DUMP,
-                         TYPE_FILTER_DUMP)
+OBJECT_DECLARE_SIMPLE_TYPE(NetFilterDumpState, FILTER_DUMP)
 
 struct NetFilterDumpState {
     NetFilterState nfs;
diff --git a/net/filter-buffer.c b/net/filter-buffer.c
index 6ade7a19b8..d8392be53c 100644
--- a/net/filter-buffer.c
+++ b/net/filter-buffer.c
@@ -18,9 +18,7 @@
 
 #define TYPE_FILTER_BUFFER "filter-buffer"
 
-typedef struct FilterBufferState FilterBufferState;
-DECLARE_INSTANCE_CHECKER(FilterBufferState, FILTER_BUFFER,
-                         TYPE_FILTER_BUFFER)
+OBJECT_DECLARE_SIMPLE_TYPE(FilterBufferState, FILTER_BUFFER)
 
 struct FilterBufferState {
     NetFilterState parent_obj;
diff --git a/net/filter-replay.c b/net/filter-replay.c
index 78696c162e..eef8443059 100644
--- a/net/filter-replay.c
+++ b/net/filter-replay.c
@@ -23,9 +23,7 @@
 
 #define TYPE_FILTER_REPLAY "filter-replay"
 
-typedef struct NetFilterReplayState NetFilterReplayState;
-DECLARE_INSTANCE_CHECKER(NetFilterReplayState, FILTER_REPLAY,
-                         TYPE_FILTER_REPLAY)
+OBJECT_DECLARE_SIMPLE_TYPE(NetFilterReplayState, FILTER_REPLAY)
 
 struct NetFilterReplayState {
     NetFilterState nfs;
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index 3070b6d59e..dc3c27a489 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -24,9 +24,7 @@
 #include "util.h"
 
 #define TYPE_FILTER_REWRITER "filter-rewriter"
-typedef struct RewriterState RewriterState;
-DECLARE_INSTANCE_CHECKER(RewriterState, FILTER_REWRITER,
-                         TYPE_FILTER_REWRITER)
+OBJECT_DECLARE_SIMPLE_TYPE(RewriterState, FILTER_REWRITER)
 
 #define FAILOVER_MODE_ON  true
 #define FAILOVER_MODE_OFF false
diff --git a/scsi/pr-manager-helper.c b/scsi/pr-manager-helper.c
index d735b1e7f6..b531dae2e8 100644
--- a/scsi/pr-manager-helper.c
+++ b/scsi/pr-manager-helper.c
@@ -27,9 +27,7 @@
 
 #define TYPE_PR_MANAGER_HELPER "pr-manager-helper"
 
-typedef struct PRManagerHelper PRManagerHelper;
-DECLARE_INSTANCE_CHECKER(PRManagerHelper, PR_MANAGER_HELPER,
-                         TYPE_PR_MANAGER_HELPER)
+OBJECT_DECLARE_SIMPLE_TYPE(PRManagerHelper, PR_MANAGER_HELPER)
 
 struct PRManagerHelper {
     /* <private> */
diff --git a/target/i386/sev.c b/target/i386/sev.c
index d976634b8f..93c4d60b82 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -31,9 +31,7 @@
 #include "qom/object.h"
 
 #define TYPE_SEV_GUEST "sev-guest"
-typedef struct SevGuestState SevGuestState;
-DECLARE_INSTANCE_CHECKER(SevGuestState, SEV_GUEST,
-                         TYPE_SEV_GUEST)
+OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
 
 
 /**
-- 
2.26.2


