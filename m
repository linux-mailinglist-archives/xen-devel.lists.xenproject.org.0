Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07E1252609
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 06:16:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAmqG-0007bk-Tg; Wed, 26 Aug 2020 04:15:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T2Dk=CD=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kAeYB-0005H4-Th
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 19:24:08 +0000
X-Inumbo-ID: f9e316eb-4837-4e0d-a124-b9c565066076
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f9e316eb-4837-4e0d-a124-b9c565066076;
 Tue, 25 Aug 2020 19:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ruklKoeCY2XMqPYd5mVYeksqfavOOSNkAeSXKzb4oxA=;
 b=Ro2OaiEMo+vdH3hz34xcP3WB/gEBvIGKTwTJUPl0mRzHh0HnGgxZLA59B54AMMJZBOLPBY
 XdOvrHzJJYUc59/dh1j6Wh3IP9HdQFk2DZViSp43y/tK+jsTv9REyxBIblrpL9zSF4JQeN
 /HDAn+gBJ1vehokzI2BBqfuTlW/GOQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-BgGdU8-aPM6U3qQxDqL__g-1; Tue, 25 Aug 2020 15:23:57 -0400
X-MC-Unique: BgGdU8-aPM6U3qQxDqL__g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B3331074641;
 Tue, 25 Aug 2020 19:23:51 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 808495C1C2;
 Tue, 25 Aug 2020 19:23:21 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Amit Shah <amit@kernel.org>,
 Stefan Berger <stefanb@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alberto Garcia <berto@igalia.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ben Warren <ben@skyportsystems.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Andrzej Zaborowski <balrogg@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm <leif@nuviainc.com>,
 Eric Auger <eric.auger@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Walle <michael@walle.cc>,
 John Snow <jsnow@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Corey Minyard <cminyard@mvista.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Paul Burton <pburton@wavecomp.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Sven Schnelle <svens@stackframe.org>, Laszlo Ersek <lersek@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, David Hildenbrand <david@redhat.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Wenchao Wang <wenchao.wang@intel.com>, Colin Xu <colin.xu@intel.com>,
 Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 haxm-team@intel.com
Subject: [PATCH v3 62/74] [automated] Use TYPE_INFO macro
Date: Tue, 25 Aug 2020 15:20:58 -0400
Message-Id: <20200825192110.3528606-63-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Generated using:
  $ ./scripts/codeconverter/converter.py -i --passes=2 \
    --pattern=TypeRegisterCall,TypeInitMacro $(git grep -l TypeInfo -- '*.[ch]')

One notable difference is that files declaring multiple types
will now have multiple separate __construtor__ functions
declared, instead of one for all types.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Removed hunks due to rebase conflicts:
  hw/sd/milkymist-memcard.c hw/sd/pl181.c
* Reviewed-by line from Daniel was kept, as no additional hunks
  are introduced in this version

Changes v1 -> v2:
* Add note about multiple constructor functions to commit message
  (suggested by Daniel)
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

---
Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Amit Shah <amit@kernel.org>
Cc: Stefan Berger <stefanb@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alberto Garcia <berto@igalia.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Ben Warren <ben@skyportsystems.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Cc: Jan Kiszka <jan.kiszka@web.de>
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Radoslaw Biernacki <rad@semihalf.com>
Cc: Leif Lindholm <leif@nuviainc.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Michael Walle <michael@walle.cc>
Cc: John Snow <jsnow@redhat.com>
Cc: Keith Busch <kbusch@kernel.org>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Michael Rolnik <mrolnik@gmail.com>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>
Cc: Fabien Chouteau <chouteau@adacore.com>
Cc: KONRAD Frederic <frederic.konrad@adacore.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: "Hervé Poussineau" <hpoussin@reactos.org>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Helge Deller <deller@gmx.de>
Cc: Corey Minyard <cminyard@mvista.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Sergio Lopez <slp@redhat.com>
Cc: Huacai Chen <chenhc@lemote.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Cc: Paul Burton <pburton@wavecomp.com>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: Sven Schnelle <svens@stackframe.org>
Cc: Laszlo Ersek <lersek@redhat.com>
Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Tony Krowiak <akrowiak@linux.ibm.com>
Cc: Pierre Morel <pmorel@linux.ibm.com>
Cc: Eric Farman <farman@linux.ibm.com>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>
Cc: Fam Zheng <fam@euphon.net>
Cc: Hannes Reinecke <hare@suse.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Zhang Chen <chen.zhang@intel.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Cc: Wenchao Wang <wenchao.wang@intel.com>
Cc: Colin Xu <colin.xu@intel.com>
Cc: Cameron Esfahani <dirty@apple.com>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
Cc: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: qemu-block@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: haxm-team@intel.com
---
 accel/accel.c                       |  6 +-----
 accel/kvm/kvm-all.c                 |  6 +-----
 accel/qtest.c                       |  6 +-----
 accel/tcg/tcg-all.c                 |  6 +-----
 accel/xen/xen-all.c                 |  6 +-----
 authz/base.c                        |  6 +-----
 authz/list.c                        |  7 +------
 authz/listfile.c                    |  7 +------
 authz/pamacct.c                     |  7 +------
 authz/simple.c                      |  7 +------
 backends/cryptodev-builtin.c        |  7 +------
 backends/cryptodev-vhost-user.c     |  7 +------
 backends/cryptodev.c                |  7 +------
 backends/dbus-vmstate.c             |  7 +------
 backends/hostmem-file.c             |  6 +-----
 backends/hostmem-memfd.c            |  2 +-
 backends/hostmem-ram.c              |  6 +-----
 backends/hostmem.c                  |  6 +-----
 backends/rng-builtin.c              |  6 +-----
 backends/rng-egd.c                  |  6 +-----
 backends/rng-random.c               |  6 +-----
 backends/rng.c                      |  6 +-----
 backends/tpm/tpm_backend.c          |  8 ++------
 backends/tpm/tpm_emulator.c         |  6 +-----
 backends/tpm/tpm_passthrough.c      |  6 +-----
 backends/vhost-user.c               |  6 +-----
 block/throttle-groups.c             |  6 +-----
 chardev/baum.c                      |  6 +-----
 chardev/char-console.c              |  6 +-----
 chardev/char-fd.c                   |  6 +-----
 chardev/char-mux.c                  |  6 +-----
 chardev/char-null.c                 |  6 +-----
 chardev/char-parallel.c             |  6 +-----
 chardev/char-pty.c                  |  6 +-----
 chardev/char-ringbuf.c              |  8 ++------
 chardev/char-socket.c               |  6 +-----
 chardev/char-udp.c                  |  6 +-----
 chardev/char-win-stdio.c            |  6 +-----
 chardev/char-win.c                  |  6 +-----
 chardev/char.c                      |  6 +-----
 chardev/msmouse.c                   |  6 +-----
 chardev/spice.c                     | 10 +++-------
 chardev/testdev.c                   |  6 +-----
 chardev/wctablet.c                  |  6 +-----
 crypto/secret.c                     |  7 +------
 crypto/secret_common.c              |  7 +------
 crypto/secret_keyring.c             |  7 +------
 crypto/tls-cipher-suites.c          |  6 +-----
 crypto/tlscreds.c                   |  7 +------
 crypto/tlscredsanon.c               |  7 +------
 crypto/tlscredspsk.c                |  7 +------
 crypto/tlscredsx509.c               |  7 +------
 gdbstub.c                           |  6 +-----
 hw/9pfs/virtio-9p-device.c          |  6 +-----
 hw/acpi/generic_event_device.c      |  6 +-----
 hw/acpi/piix4.c                     |  6 +-----
 hw/acpi/vmgenid.c                   |  6 +-----
 hw/adc/stm32f2xx_adc.c              |  6 +-----
 hw/alpha/typhoon.c                  |  8 ++------
 hw/arm/allwinner-a10.c              |  6 +-----
 hw/arm/allwinner-h3.c               |  6 +-----
 hw/arm/armsse.c                     |  2 +-
 hw/arm/armv7m.c                     |  8 ++------
 hw/arm/bcm2835_peripherals.c        |  6 +-----
 hw/arm/bcm2836.c                    |  2 +-
 hw/arm/boot.c                       |  6 +-----
 hw/arm/collie.c                     |  6 +-----
 hw/arm/digic.c                      |  6 +-----
 hw/arm/exynos4210.c                 |  6 +-----
 hw/arm/exynos4_boards.c             |  8 ++------
 hw/arm/fsl-imx25.c                  |  6 +-----
 hw/arm/fsl-imx31.c                  |  6 +-----
 hw/arm/fsl-imx6.c                   |  6 +-----
 hw/arm/fsl-imx6ul.c                 |  6 +-----
 hw/arm/fsl-imx7.c                   |  6 +-----
 hw/arm/gumstix.c                    |  8 ++------
 hw/arm/highbank.c                   | 14 +++-----------
 hw/arm/integratorcp.c               | 10 +++-------
 hw/arm/microbit.c                   |  6 +-----
 hw/arm/mps2-tz.c                    | 10 +++-------
 hw/arm/mps2.c                       | 10 +++-------
 hw/arm/msf2-soc.c                   |  6 +-----
 hw/arm/musca.c                      | 10 +++-------
 hw/arm/musicpal.c                   | 22 +++++++++-------------
 hw/arm/nrf51_soc.c                  |  6 +-----
 hw/arm/nseries.c                    |  8 ++------
 hw/arm/omap_sx1.c                   |  8 ++------
 hw/arm/palm.c                       |  6 +-----
 hw/arm/pxa2xx.c                     | 14 +++++---------
 hw/arm/pxa2xx_gpio.c                |  6 +-----
 hw/arm/pxa2xx_pic.c                 |  6 +-----
 hw/arm/realview.c                   | 12 ++++--------
 hw/arm/sbsa-ref.c                   |  6 +-----
 hw/arm/smmu-common.c                |  6 +-----
 hw/arm/spitz.c                      | 28 ++++++++++------------------
 hw/arm/stellaris.c                  | 18 +++++-------------
 hw/arm/stm32f205_soc.c              |  6 +-----
 hw/arm/stm32f405_soc.c              |  6 +-----
 hw/arm/strongarm.c                  | 16 ++++++----------
 hw/arm/tosa.c                       | 10 +++-------
 hw/arm/versatilepb.c                | 14 +++-----------
 hw/arm/vexpress.c                   | 10 +++-------
 hw/arm/virt.c                       |  6 +-----
 hw/arm/xilinx_zynq.c                |  6 +-----
 hw/arm/xlnx-versal-virt.c           |  6 +-----
 hw/arm/xlnx-versal.c                |  6 +-----
 hw/arm/xlnx-zcu102.c                |  6 +-----
 hw/arm/xlnx-zynqmp.c                |  6 +-----
 hw/audio/cs4231.c                   |  6 +-----
 hw/audio/hda-codec.c                | 12 ++++--------
 hw/audio/intel-hda.c                | 10 +++++-----
 hw/audio/marvell_88w8618.c          |  6 +-----
 hw/audio/milkymist-ac97.c           |  6 +-----
 hw/audio/pcspk.c                    |  2 +-
 hw/audio/pl041.c                    |  6 +-----
 hw/audio/wm8750.c                   |  6 +-----
 hw/block/fdc.c                      | 16 ++++++----------
 hw/block/m25p80.c                   |  2 +-
 hw/block/nand.c                     |  6 +-----
 hw/block/nvme.c                     |  6 +-----
 hw/block/onenand.c                  |  6 +-----
 hw/block/pflash_cfi01.c             |  6 +-----
 hw/block/pflash_cfi02.c             |  6 +-----
 hw/block/swim.c                     | 10 +++-------
 hw/block/vhost-user-blk.c           |  6 +-----
 hw/block/virtio-blk.c               |  6 +-----
 hw/block/xen-block.c                | 10 +++-------
 hw/char/avr_usart.c                 |  6 +-----
 hw/char/bcm2835_aux.c               |  6 +-----
 hw/char/cadence_uart.c              |  6 +-----
 hw/char/cmsdk-apb-uart.c            |  6 +-----
 hw/char/debugcon.c                  |  6 +-----
 hw/char/digic-uart.c                |  6 +-----
 hw/char/escc.c                      |  6 +-----
 hw/char/etraxfs_ser.c               |  6 +-----
 hw/char/exynos4210_uart.c           |  6 +-----
 hw/char/grlib_apbuart.c             |  6 +-----
 hw/char/ibex_uart.c                 |  6 +-----
 hw/char/imx_serial.c                |  6 +-----
 hw/char/ipoctal232.c                |  6 +-----
 hw/char/lm32_juart.c                |  6 +-----
 hw/char/lm32_uart.c                 |  6 +-----
 hw/char/mcf_uart.c                  |  6 +-----
 hw/char/milkymist-uart.c            |  6 +-----
 hw/char/nrf51_uart.c                |  6 +-----
 hw/char/parallel.c                  |  6 +-----
 hw/char/pl011.c                     |  8 ++------
 hw/char/renesas_sci.c               |  6 +-----
 hw/char/sclpconsole-lm.c            |  6 +-----
 hw/char/sclpconsole.c               |  6 +-----
 hw/char/serial-isa.c                |  6 +-----
 hw/char/serial-pci-multi.c          |  8 ++------
 hw/char/serial-pci.c                |  6 +-----
 hw/char/serial.c                    | 10 +++-------
 hw/char/spapr_vty.c                 |  2 +-
 hw/char/stm32f2xx_usart.c           |  6 +-----
 hw/char/terminal3270.c              |  6 +-----
 hw/char/virtio-console.c            |  8 ++------
 hw/char/virtio-serial-bus.c         | 10 +++-------
 hw/char/xilinx_uartlite.c           |  6 +-----
 hw/core/bus.c                       |  6 +-----
 hw/core/clock.c                     |  6 +-----
 hw/core/cpu.c                       |  6 +-----
 hw/core/fw-path-provider.c          |  6 +-----
 hw/core/generic-loader.c            |  6 +-----
 hw/core/hotplug.c                   |  6 +-----
 hw/core/irq.c                       |  6 +-----
 hw/core/machine.c                   |  6 +-----
 hw/core/nmi.c                       |  6 +-----
 hw/core/or-irq.c                    |  6 +-----
 hw/core/platform-bus.c              |  6 +-----
 hw/core/qdev.c                      |  6 +-----
 hw/core/register.c                  |  6 +-----
 hw/core/resettable.c                |  6 +-----
 hw/core/split-irq.c                 |  6 +-----
 hw/core/stream.c                    |  6 +-----
 hw/core/sysbus.c                    |  8 ++------
 hw/core/vmstate-if.c                |  6 +-----
 hw/cpu/a15mpcore.c                  |  6 +-----
 hw/cpu/a9mpcore.c                   |  6 +-----
 hw/cpu/arm11mpcore.c                |  6 +-----
 hw/cpu/cluster.c                    |  6 +-----
 hw/cpu/core.c                       |  6 +-----
 hw/cpu/realview_mpcore.c            |  6 +-----
 hw/display/ads7846.c                |  6 +-----
 hw/display/artist.c                 |  6 +-----
 hw/display/ati.c                    |  6 +-----
 hw/display/bcm2835_fb.c             |  6 +-----
 hw/display/bochs-display.c          |  6 +-----
 hw/display/cg3.c                    |  6 +-----
 hw/display/cirrus_vga.c             |  6 +-----
 hw/display/cirrus_vga_isa.c         |  6 +-----
 hw/display/dpcd.c                   |  6 +-----
 hw/display/exynos4210_fimd.c        |  6 +-----
 hw/display/g364fb.c                 |  6 +-----
 hw/display/i2c-ddc.c                |  6 +-----
 hw/display/jazz_led.c               |  6 +-----
 hw/display/macfb.c                  |  8 ++------
 hw/display/milkymist-tmu2.c         |  6 +-----
 hw/display/milkymist-vgafb.c        |  6 +-----
 hw/display/next-fb.c                |  6 +-----
 hw/display/pl110.c                  | 10 +++-------
 hw/display/qxl.c                    | 10 +++-------
 hw/display/ramfb-standalone.c       |  6 +-----
 hw/display/sii9022.c                |  6 +-----
 hw/display/sm501.c                  |  8 ++------
 hw/display/ssd0303.c                |  6 +-----
 hw/display/ssd0323.c                |  6 +-----
 hw/display/tcx.c                    |  6 +-----
 hw/display/vga-isa.c                |  6 +-----
 hw/display/vga-pci.c                | 10 +++-------
 hw/display/vhost-user-gpu.c         |  6 +-----
 hw/display/virtio-gpu-base.c        |  7 +------
 hw/display/virtio-gpu-pci.c         |  2 +-
 hw/display/virtio-gpu.c             |  6 +-----
 hw/display/virtio-vga.c             |  2 +-
 hw/display/vmware_vga.c             |  6 +-----
 hw/display/xlnx_dp.c                |  6 +-----
 hw/dma/bcm2835_dma.c                |  6 +-----
 hw/dma/i82374.c                     |  6 +-----
 hw/dma/i8257.c                      |  6 +-----
 hw/dma/pl080.c                      |  8 ++------
 hw/dma/pl330.c                      |  6 +-----
 hw/dma/puv3_dma.c                   |  6 +-----
 hw/dma/pxa2xx_dma.c                 |  6 +-----
 hw/dma/rc4030.c                     |  8 ++------
 hw/dma/sparc32_dma.c                | 12 ++++--------
 hw/dma/xilinx_axidma.c              | 10 +++-------
 hw/dma/xlnx-zdma.c                  |  6 +-----
 hw/dma/xlnx-zynq-devcfg.c           |  6 +-----
 hw/dma/xlnx_dpdma.c                 |  6 +-----
 hw/gpio/aspeed_gpio.c               | 14 +++++---------
 hw/gpio/bcm2835_gpio.c              |  6 +-----
 hw/gpio/gpio_key.c                  |  6 +-----
 hw/gpio/imx_gpio.c                  |  6 +-----
 hw/gpio/max7310.c                   |  6 +-----
 hw/gpio/mpc8xxx.c                   |  6 +-----
 hw/gpio/nrf51_gpio.c                |  6 +-----
 hw/gpio/omap_gpio.c                 |  8 ++------
 hw/gpio/pl061.c                     |  8 ++------
 hw/gpio/puv3_gpio.c                 |  6 +-----
 hw/gpio/zaurus.c                    |  6 +-----
 hw/hppa/dino.c                      |  6 +-----
 hw/hppa/lasi.c                      |  6 +-----
 hw/hyperv/hyperv.c                  |  6 +-----
 hw/hyperv/hyperv_testdev.c          |  6 +-----
 hw/hyperv/vmbus.c                   | 10 +++-------
 hw/i2c/aspeed_i2c.c                 | 12 ++++--------
 hw/i2c/bitbang_i2c.c                |  6 +-----
 hw/i2c/core.c                       |  8 ++------
 hw/i2c/exynos4210_i2c.c             |  6 +-----
 hw/i2c/imx_i2c.c                    |  6 +-----
 hw/i2c/microbit_i2c.c               |  6 +-----
 hw/i2c/mpc_i2c.c                    |  6 +-----
 hw/i2c/omap_i2c.c                   |  6 +-----
 hw/i2c/ppc4xx_i2c.c                 |  6 +-----
 hw/i2c/smbus_eeprom.c               |  6 +-----
 hw/i2c/smbus_ich9.c                 |  6 +-----
 hw/i2c/smbus_slave.c                |  6 +-----
 hw/i2c/versatile_i2c.c              |  6 +-----
 hw/i386/amd_iommu.c                 | 10 +++-------
 hw/i386/intel_iommu.c               |  8 ++------
 hw/i386/kvm/apic.c                  |  6 +-----
 hw/i386/kvm/clock.c                 |  6 +-----
 hw/i386/kvm/i8254.c                 |  6 +-----
 hw/i386/kvm/i8259.c                 |  6 +-----
 hw/i386/kvm/ioapic.c                |  6 +-----
 hw/i386/kvmvapic.c                  |  6 +-----
 hw/i386/microvm.c                   |  6 +-----
 hw/i386/pc.c                        |  6 +-----
 hw/i386/pc_piix.c                   |  6 +-----
 hw/i386/port92.c                    |  6 +-----
 hw/i386/vmmouse.c                   |  6 +-----
 hw/i386/vmport.c                    |  6 +-----
 hw/i386/x86-iommu.c                 |  6 +-----
 hw/i386/x86.c                       |  6 +-----
 hw/i386/xen/xen_apic.c              |  6 +-----
 hw/i386/xen/xen_platform.c          |  6 +-----
 hw/i386/xen/xen_pvdevice.c          |  6 +-----
 hw/ide/ahci-allwinner.c             |  6 +-----
 hw/ide/ahci.c                       |  6 +-----
 hw/ide/cmd646.c                     |  6 +-----
 hw/ide/ich.c                        |  6 +-----
 hw/ide/isa.c                        |  6 +-----
 hw/ide/macio.c                      |  6 +-----
 hw/ide/microdrive.c                 |  8 ++------
 hw/ide/mmio.c                       |  6 +-----
 hw/ide/pci.c                        |  6 +-----
 hw/ide/piix.c                       | 10 +++-------
 hw/ide/qdev.c                       | 14 +++++---------
 hw/ide/sii3112.c                    |  6 +-----
 hw/ide/via.c                        |  6 +-----
 hw/input/adb-kbd.c                  |  6 +-----
 hw/input/adb-mouse.c                |  6 +-----
 hw/input/adb.c                      |  8 ++------
 hw/input/lm832x.c                   |  6 +-----
 hw/input/milkymist-softusb.c        |  6 +-----
 hw/input/pckbd.c                    |  6 +-----
 hw/input/pl050.c                    | 10 +++-------
 hw/input/vhost-user-input.c         |  6 +-----
 hw/input/virtio-input-hid.c         | 12 ++++--------
 hw/input/virtio-input-host.c        |  6 +-----
 hw/input/virtio-input.c             |  6 +-----
 hw/intc/allwinner-a10-pic.c         |  6 +-----
 hw/intc/apic.c                      |  6 +-----
 hw/intc/apic_common.c               |  6 +-----
 hw/intc/arm_gic.c                   |  6 +-----
 hw/intc/arm_gic_common.c            |  6 +-----
 hw/intc/arm_gic_kvm.c               |  6 +-----
 hw/intc/arm_gicv2m.c                |  6 +-----
 hw/intc/arm_gicv3.c                 |  6 +-----
 hw/intc/arm_gicv3_common.c          |  6 +-----
 hw/intc/arm_gicv3_its_common.c      |  6 +-----
 hw/intc/arm_gicv3_its_kvm.c         |  6 +-----
 hw/intc/arm_gicv3_kvm.c             |  6 +-----
 hw/intc/armv7m_nvic.c               |  6 +-----
 hw/intc/aspeed_vic.c                |  6 +-----
 hw/intc/bcm2835_ic.c                |  6 +-----
 hw/intc/bcm2836_control.c           |  6 +-----
 hw/intc/etraxfs_pic.c               |  6 +-----
 hw/intc/exynos4210_combiner.c       |  6 +-----
 hw/intc/exynos4210_gic.c            | 12 ++----------
 hw/intc/grlib_irqmp.c               |  6 +-----
 hw/intc/heathrow_pic.c              |  6 +-----
 hw/intc/i8259.c                     |  6 +-----
 hw/intc/i8259_common.c              |  6 +-----
 hw/intc/ibex_plic.c                 |  6 +-----
 hw/intc/imx_avic.c                  |  6 +-----
 hw/intc/imx_gpcv2.c                 |  6 +-----
 hw/intc/intc.c                      |  6 +-----
 hw/intc/ioapic.c                    |  6 +-----
 hw/intc/ioapic_common.c             |  6 +-----
 hw/intc/lm32_pic.c                  |  6 +-----
 hw/intc/loongson_liointc.c          |  6 +-----
 hw/intc/mips_gic.c                  |  6 +-----
 hw/intc/nios2_iic.c                 |  6 +-----
 hw/intc/omap_intc.c                 | 10 +++-------
 hw/intc/ompic.c                     |  6 +-----
 hw/intc/openpic.c                   |  6 +-----
 hw/intc/openpic_kvm.c               |  6 +-----
 hw/intc/pl190.c                     |  6 +-----
 hw/intc/pnv_xive.c                  |  6 +-----
 hw/intc/puv3_intc.c                 |  6 +-----
 hw/intc/realview_gic.c              |  6 +-----
 hw/intc/rx_icu.c                    |  6 +-----
 hw/intc/s390_flic.c                 |  8 ++------
 hw/intc/s390_flic_kvm.c             |  6 +-----
 hw/intc/slavio_intctl.c             |  6 +-----
 hw/intc/spapr_xive.c                |  6 +-----
 hw/intc/xics.c                      | 10 +++-------
 hw/intc/xics_pnv.c                  |  6 +-----
 hw/intc/xics_spapr.c                |  6 +-----
 hw/intc/xilinx_intc.c               |  6 +-----
 hw/intc/xive.c                      | 18 +++++++-----------
 hw/intc/xlnx-pmu-iomod-intc.c       |  6 +-----
 hw/intc/xlnx-zynqmp-ipi.c           |  6 +-----
 hw/ipack/ipack.c                    |  8 ++------
 hw/ipack/tpci200.c                  |  6 +-----
 hw/ipmi/ipmi.c                      |  8 ++------
 hw/ipmi/ipmi_bmc_sim.c              |  6 +-----
 hw/ipmi/isa_ipmi_bt.c               |  6 +-----
 hw/ipmi/isa_ipmi_kcs.c              |  6 +-----
 hw/ipmi/pci_ipmi_bt.c               |  6 +-----
 hw/ipmi/pci_ipmi_kcs.c              |  6 +-----
 hw/ipmi/smbus_ipmi.c                |  6 +-----
 hw/isa/i82378.c                     |  6 +-----
 hw/isa/isa-bus.c                    | 12 ++++--------
 hw/isa/isa-superio.c                |  8 ++------
 hw/isa/lpc_ich9.c                   |  6 +-----
 hw/isa/pc87312.c                    |  6 +-----
 hw/isa/piix3.c                      | 10 +++-------
 hw/isa/piix4.c                      |  6 +-----
 hw/isa/smc37c669-superio.c          |  6 +-----
 hw/isa/vt82c686.c                   | 14 +++++---------
 hw/lm32/lm32_boards.c               |  8 ++------
 hw/m68k/mcf_intc.c                  |  6 +-----
 hw/m68k/next-cube.c                 |  6 +-----
 hw/m68k/next-kbd.c                  |  6 +-----
 hw/m68k/q800.c                      |  6 +-----
 hw/mem/memory-device.c              |  6 +-----
 hw/mem/nvdimm.c                     |  6 +-----
 hw/mem/pc-dimm.c                    |  6 +-----
 hw/microblaze/xlnx-zynqmp-pmu.c     |  6 +-----
 hw/mips/boston.c                    |  6 +-----
 hw/mips/cps.c                       |  6 +-----
 hw/mips/gt64xxx_pci.c               |  8 ++------
 hw/mips/jazz.c                      |  8 ++------
 hw/mips/malta.c                     |  6 +-----
 hw/misc/a9scu.c                     |  6 +-----
 hw/misc/allwinner-cpucfg.c          |  6 +-----
 hw/misc/allwinner-h3-ccu.c          |  6 +-----
 hw/misc/allwinner-h3-dramc.c        |  6 +-----
 hw/misc/allwinner-h3-sysctrl.c      |  6 +-----
 hw/misc/allwinner-sid.c             |  6 +-----
 hw/misc/applesmc.c                  |  6 +-----
 hw/misc/arm11scu.c                  |  6 +-----
 hw/misc/arm_integrator_debug.c      |  6 +-----
 hw/misc/arm_l2x0.c                  |  6 +-----
 hw/misc/arm_sysctl.c                |  6 +-----
 hw/misc/armsse-cpuid.c              |  6 +-----
 hw/misc/armsse-mhu.c                |  6 +-----
 hw/misc/aspeed_scu.c                | 12 ++++--------
 hw/misc/aspeed_sdmc.c               | 12 ++++--------
 hw/misc/aspeed_xdma.c               |  6 +-----
 hw/misc/auxbus.c                    | 10 +++-------
 hw/misc/avr_power.c                 |  6 +-----
 hw/misc/bcm2835_mbox.c              |  6 +-----
 hw/misc/bcm2835_mphi.c              |  6 +-----
 hw/misc/bcm2835_property.c          |  6 +-----
 hw/misc/bcm2835_rng.c               |  6 +-----
 hw/misc/bcm2835_thermal.c           |  6 +-----
 hw/misc/debugexit.c                 |  6 +-----
 hw/misc/eccmemctl.c                 |  6 +-----
 hw/misc/empty_slot.c                |  6 +-----
 hw/misc/exynos4210_clk.c            |  2 +-
 hw/misc/exynos4210_pmu.c            |  6 +-----
 hw/misc/exynos4210_rng.c            |  6 +-----
 hw/misc/grlib_ahb_apb_pnp.c         |  8 ++------
 hw/misc/imx25_ccm.c                 |  6 +-----
 hw/misc/imx31_ccm.c                 |  6 +-----
 hw/misc/imx6_ccm.c                  |  6 +-----
 hw/misc/imx6_src.c                  |  6 +-----
 hw/misc/imx6ul_ccm.c                |  6 +-----
 hw/misc/imx7_ccm.c                  |  8 ++------
 hw/misc/imx7_gpr.c                  |  6 +-----
 hw/misc/imx7_snvs.c                 |  6 +-----
 hw/misc/imx_ccm.c                   |  6 +-----
 hw/misc/imx_rngc.c                  |  6 +-----
 hw/misc/iotkit-secctl.c             |  6 +-----
 hw/misc/iotkit-sysctl.c             |  6 +-----
 hw/misc/iotkit-sysinfo.c            |  6 +-----
 hw/misc/ivshmem.c                   | 10 +++-------
 hw/misc/mac_via.c                   | 10 +++-------
 hw/misc/macio/cuda.c                |  8 ++------
 hw/misc/macio/gpio.c                |  6 +-----
 hw/misc/macio/mac_dbdma.c           |  6 +-----
 hw/misc/macio/macio.c               | 12 ++++--------
 hw/misc/macio/pmu.c                 |  8 ++------
 hw/misc/max111x.c                   | 10 +++-------
 hw/misc/milkymist-hpdmc.c           |  6 +-----
 hw/misc/milkymist-pfpu.c            |  6 +-----
 hw/misc/mips_cmgcr.c                |  6 +-----
 hw/misc/mips_cpc.c                  |  6 +-----
 hw/misc/mips_itu.c                  |  6 +-----
 hw/misc/mos6522.c                   |  6 +-----
 hw/misc/mps2-fpgaio.c               |  6 +-----
 hw/misc/mps2-scc.c                  |  6 +-----
 hw/misc/msf2-sysreg.c               |  6 +-----
 hw/misc/mst_fpga.c                  |  6 +-----
 hw/misc/nrf51_rng.c                 |  6 +-----
 hw/misc/pc-testdev.c                |  6 +-----
 hw/misc/pca9552.c                   |  8 ++------
 hw/misc/pci-testdev.c               |  6 +-----
 hw/misc/puv3_pm.c                   |  6 +-----
 hw/misc/pvpanic.c                   |  6 +-----
 hw/misc/sga.c                       |  6 +-----
 hw/misc/slavio_misc.c               |  8 ++------
 hw/misc/stm32f2xx_syscfg.c          |  6 +-----
 hw/misc/stm32f4xx_exti.c            |  6 +-----
 hw/misc/stm32f4xx_syscfg.c          |  6 +-----
 hw/misc/tmp105.c                    |  6 +-----
 hw/misc/tmp421.c                    |  2 +-
 hw/misc/tz-mpc.c                    |  8 ++------
 hw/misc/tz-msc.c                    |  6 +-----
 hw/misc/tz-ppc.c                    |  6 +-----
 hw/misc/unimp.c                     |  6 +-----
 hw/misc/vmcoreinfo.c                |  6 +-----
 hw/misc/zynq-xadc.c                 |  6 +-----
 hw/misc/zynq_slcr.c                 |  6 +-----
 hw/net/allwinner-sun8i-emac.c       |  6 +-----
 hw/net/allwinner_emac.c             |  6 +-----
 hw/net/cadence_gem.c                |  6 +-----
 hw/net/can/can_kvaser_pci.c         |  6 +-----
 hw/net/can/can_mioe3680_pci.c       |  6 +-----
 hw/net/can/can_pcm3680_pci.c        |  6 +-----
 hw/net/dp8393x.c                    |  6 +-----
 hw/net/e1000.c                      |  2 +-
 hw/net/e1000e.c                     |  6 +-----
 hw/net/etraxfs_eth.c                |  6 +-----
 hw/net/fsl_etsec/etsec.c            |  6 +-----
 hw/net/ftgmac100.c                  |  8 ++------
 hw/net/imx_fec.c                    |  8 ++------
 hw/net/lan9118.c                    |  6 +-----
 hw/net/lance.c                      |  6 +-----
 hw/net/lasi_i82596.c                |  6 +-----
 hw/net/mcf_fec.c                    |  6 +-----
 hw/net/milkymist-minimac2.c         |  6 +-----
 hw/net/mipsnet.c                    |  6 +-----
 hw/net/msf2-emac.c                  |  6 +-----
 hw/net/ne2000-isa.c                 |  6 +-----
 hw/net/ne2000-pci.c                 |  6 +-----
 hw/net/opencores_eth.c              |  6 +-----
 hw/net/pcnet-pci.c                  |  6 +-----
 hw/net/rocker/rocker.c              |  6 +-----
 hw/net/rtl8139.c                    |  6 +-----
 hw/net/smc91c111.c                  |  6 +-----
 hw/net/spapr_llan.c                 |  2 +-
 hw/net/stellaris_enet.c             |  6 +-----
 hw/net/sungem.c                     |  6 +-----
 hw/net/sunhme.c                     |  6 +-----
 hw/net/tulip.c                      |  6 +-----
 hw/net/virtio-net.c                 |  6 +-----
 hw/net/vmxnet3.c                    |  2 +-
 hw/net/xgmac.c                      |  6 +-----
 hw/net/xilinx_axienet.c             | 10 +++-------
 hw/net/xilinx_ethlite.c             |  6 +-----
 hw/nubus/mac-nubus-bridge.c         |  6 +-----
 hw/nubus/nubus-bridge.c             |  6 +-----
 hw/nubus/nubus-bus.c                |  6 +-----
 hw/nubus/nubus-device.c             |  6 +-----
 hw/nvram/ds1225y.c                  |  6 +-----
 hw/nvram/eeprom_at24c.c             |  6 +-----
 hw/nvram/fw_cfg.c                   | 12 ++++--------
 hw/nvram/mac_nvram.c                |  6 +-----
 hw/nvram/nrf51_nvm.c                |  6 +-----
 hw/nvram/spapr_nvram.c              |  6 +-----
 hw/pci-bridge/dec.c                 | 10 +++-------
 hw/pci-bridge/i82801b11.c           |  6 +-----
 hw/pci-bridge/ioh3420.c             |  6 +-----
 hw/pci-bridge/pci_bridge_dev.c      |  8 ++------
 hw/pci-bridge/pci_expander_bridge.c | 14 +++++---------
 hw/pci-bridge/pcie_pci_bridge.c     |  6 +-----
 hw/pci-bridge/pcie_root_port.c      |  6 +-----
 hw/pci-bridge/simba.c               |  6 +-----
 hw/pci-bridge/xio3130_downstream.c  |  6 +-----
 hw/pci-bridge/xio3130_upstream.c    |  6 +-----
 hw/pci-host/bonito.c                |  8 ++------
 hw/pci-host/designware.c            |  8 ++------
 hw/pci-host/gpex.c                  |  8 ++------
 hw/pci-host/grackle.c               |  8 ++------
 hw/pci-host/i440fx.c                |  8 ++------
 hw/pci-host/pnv_phb3.c              | 12 ++++--------
 hw/pci-host/pnv_phb3_msi.c          |  6 +-----
 hw/pci-host/pnv_phb3_pbcq.c         |  6 +-----
 hw/pci-host/pnv_phb4.c              | 12 ++++--------
 hw/pci-host/pnv_phb4_pec.c          |  8 ++------
 hw/pci-host/ppce500.c               |  8 ++------
 hw/pci-host/prep.c                  |  8 ++------
 hw/pci-host/q35.c                   |  8 ++------
 hw/pci-host/sabre.c                 |  8 ++------
 hw/pci-host/uninorth.c              | 18 +++++++++---------
 hw/pci-host/versatile.c             | 10 +++-------
 hw/pci-host/xen_igd_pt.c            |  6 +-----
 hw/pci-host/xilinx-pcie.c           |  8 ++------
 hw/pci/pci.c                        | 14 +++++---------
 hw/pci/pci_bridge.c                 |  6 +-----
 hw/pci/pci_host.c                   |  6 +-----
 hw/pci/pcie_host.c                  |  6 +-----
 hw/pci/pcie_port.c                  |  8 ++------
 hw/pcmcia/pcmcia.c                  |  6 +-----
 hw/pcmcia/pxa2xx.c                  |  6 +-----
 hw/ppc/e500.c                       |  8 ++------
 hw/ppc/e500plat.c                   |  6 +-----
 hw/ppc/mac_newworld.c               |  6 +-----
 hw/ppc/mac_oldworld.c               |  6 +-----
 hw/ppc/mpc8544_guts.c               |  6 +-----
 hw/ppc/mpc8544ds.c                  |  6 +-----
 hw/ppc/pnv_core.c                   |  6 +-----
 hw/ppc/pnv_homer.c                  | 10 +++-------
 hw/ppc/pnv_lpc.c                    | 12 ++++--------
 hw/ppc/pnv_occ.c                    | 10 +++-------
 hw/ppc/pnv_pnor.c                   |  6 +-----
 hw/ppc/pnv_psi.c                    | 12 ++++--------
 hw/ppc/pnv_xscom.c                  |  6 +-----
 hw/ppc/ppc405_boards.c              |  8 ++------
 hw/ppc/ppc440_pcix.c                |  6 +-----
 hw/ppc/ppc440_uc.c                  |  6 +-----
 hw/ppc/ppc4xx_pci.c                 |  8 ++------
 hw/ppc/ppce500_spin.c               |  6 +-----
 hw/ppc/prep_systemio.c              |  6 +-----
 hw/ppc/rs6000_mc.c                  |  6 +-----
 hw/ppc/spapr.c                      |  6 +-----
 hw/ppc/spapr_drc.c                  | 16 ++++++++--------
 hw/ppc/spapr_iommu.c                |  8 ++------
 hw/ppc/spapr_irq.c                  |  6 +-----
 hw/ppc/spapr_pci.c                  |  6 +-----
 hw/ppc/spapr_rng.c                  |  6 +-----
 hw/ppc/spapr_rtc.c                  |  6 +-----
 hw/ppc/spapr_tpm_proxy.c            |  2 +-
 hw/ppc/spapr_vio.c                  | 10 +++-------
 hw/rdma/rdma.c                      |  6 +-----
 hw/rdma/vmw/pvrdma_main.c           |  6 +-----
 hw/riscv/opentitan.c                |  6 +-----
 hw/riscv/riscv_hart.c               |  6 +-----
 hw/riscv/sifive_clint.c             |  6 +-----
 hw/riscv/sifive_e.c                 | 12 ++----------
 hw/riscv/sifive_e_prci.c            |  6 +-----
 hw/riscv/sifive_gpio.c              |  6 +-----
 hw/riscv/sifive_plic.c              |  6 +-----
 hw/riscv/sifive_test.c              |  6 +-----
 hw/riscv/sifive_u.c                 | 12 ++----------
 hw/riscv/sifive_u_otp.c             |  6 +-----
 hw/riscv/sifive_u_prci.c            |  6 +-----
 hw/riscv/virt.c                     |  6 +-----
 hw/rtc/allwinner-rtc.c              | 12 ++++--------
 hw/rtc/aspeed_rtc.c                 |  6 +-----
 hw/rtc/ds1338.c                     |  6 +-----
 hw/rtc/exynos4210_rtc.c             |  6 +-----
 hw/rtc/goldfish_rtc.c               |  6 +-----
 hw/rtc/m41t80.c                     |  6 +-----
 hw/rtc/m48t59-isa.c                 |  2 +-
 hw/rtc/m48t59.c                     |  4 ++--
 hw/rtc/mc146818rtc.c                |  6 +-----
 hw/rtc/pl031.c                      |  6 +-----
 hw/rtc/sun4v-rtc.c                  |  6 +-----
 hw/rtc/twl92230.c                   |  6 +-----
 hw/rtc/xlnx-zynqmp-rtc.c            |  6 +-----
 hw/s390x/3270-ccw.c                 |  6 +-----
 hw/s390x/ap-bridge.c                |  8 ++------
 hw/s390x/ap-device.c                |  6 +-----
 hw/s390x/ccw-device.c               |  6 +-----
 hw/s390x/css-bridge.c               |  8 ++------
 hw/s390x/event-facility.c           | 10 +++-------
 hw/s390x/ipl.c                      |  6 +-----
 hw/s390x/s390-ccw.c                 |  6 +-----
 hw/s390x/s390-pci-bus.c             | 14 +++++---------
 hw/s390x/s390-skeys-kvm.c           |  6 +-----
 hw/s390x/s390-skeys.c               |  8 ++------
 hw/s390x/s390-stattrib-kvm.c        |  6 +-----
 hw/s390x/s390-stattrib.c            |  8 ++------
 hw/s390x/s390-virtio-ccw.c          |  6 +-----
 hw/s390x/sclp.c                     |  6 +-----
 hw/s390x/sclpcpu.c                  |  6 +-----
 hw/s390x/sclpquiesce.c              |  6 +-----
 hw/s390x/tod-kvm.c                  |  6 +-----
 hw/s390x/tod-qemu.c                 |  6 +-----
 hw/s390x/tod.c                      |  6 +-----
 hw/s390x/vhost-vsock-ccw.c          |  6 +-----
 hw/s390x/virtio-ccw-9p.c            |  6 +-----
 hw/s390x/virtio-ccw-balloon.c       |  6 +-----
 hw/s390x/virtio-ccw-blk.c           |  6 +-----
 hw/s390x/virtio-ccw-crypto.c        |  6 +-----
 hw/s390x/virtio-ccw-gpu.c           |  6 +-----
 hw/s390x/virtio-ccw-input.c         | 14 +++++---------
 hw/s390x/virtio-ccw-net.c           |  6 +-----
 hw/s390x/virtio-ccw-rng.c           |  6 +-----
 hw/s390x/virtio-ccw-scsi.c          |  4 ++--
 hw/s390x/virtio-ccw-serial.c        |  6 +-----
 hw/s390x/virtio-ccw.c               |  8 ++------
 hw/scsi/esp-pci.c                   |  8 ++------
 hw/scsi/esp.c                       |  6 +-----
 hw/scsi/lsi53c895a.c                |  8 ++------
 hw/scsi/megasas.c                   |  2 +-
 hw/scsi/scsi-bus.c                  |  8 ++------
 hw/scsi/scsi-disk.c                 | 10 +++++-----
 hw/scsi/scsi-generic.c              |  6 +-----
 hw/scsi/spapr_vscsi.c               |  6 +-----
 hw/scsi/vhost-scsi-common.c         |  6 +-----
 hw/scsi/vhost-scsi.c                |  6 +-----
 hw/scsi/vhost-user-scsi.c           |  6 +-----
 hw/scsi/virtio-scsi.c               |  8 ++------
 hw/scsi/vmw_pvscsi.c                |  7 +------
 hw/sd/allwinner-sdhost.c            | 12 ++++--------
 hw/sd/aspeed_sdhci.c                |  6 +-----
 hw/sd/bcm2835_sdhost.c              |  8 ++------
 hw/sd/core.c                        |  6 +-----
 hw/sd/pxa2xx_mmci.c                 |  8 ++------
 hw/sd/sd.c                          |  6 +-----
 hw/sd/sdhci-pci.c                   |  6 +-----
 hw/sd/sdhci.c                       | 12 ++++--------
 hw/sd/ssi-sd.c                      |  6 +-----
 hw/sh4/sh_pci.c                     |  8 ++------
 hw/sparc/sun4m.c                    | 28 ++++++++++++++--------------
 hw/sparc/sun4m_iommu.c              |  8 ++------
 hw/sparc64/niagara.c                |  6 +-----
 hw/sparc64/sun4u.c                  | 12 ++++++------
 hw/sparc64/sun4u_iommu.c            |  8 ++------
 hw/ssi/aspeed_smc.c                 |  2 +-
 hw/ssi/imx_spi.c                    |  6 +-----
 hw/ssi/mss-spi.c                    |  6 +-----
 hw/ssi/pl022.c                      |  6 +-----
 hw/ssi/ssi.c                        |  8 ++------
 hw/ssi/stm32f2xx_spi.c              |  6 +-----
 hw/ssi/xilinx_spi.c                 |  6 +-----
 hw/ssi/xilinx_spips.c               | 10 +++-------
 hw/timer/a9gtimer.c                 |  6 +-----
 hw/timer/allwinner-a10-pit.c        |  6 +-----
 hw/timer/altera_timer.c             |  6 +-----
 hw/timer/arm_mptimer.c              |  6 +-----
 hw/timer/arm_timer.c                |  8 ++------
 hw/timer/armv7m_systick.c           |  6 +-----
 hw/timer/aspeed_timer.c             | 12 ++++--------
 hw/timer/avr_timer16.c              |  6 +-----
 hw/timer/bcm2835_systmr.c           |  6 +-----
 hw/timer/cadence_ttc.c              |  6 +-----
 hw/timer/cmsdk-apb-dualtimer.c      |  6 +-----
 hw/timer/cmsdk-apb-timer.c          |  6 +-----
 hw/timer/digic-timer.c              |  6 +-----
 hw/timer/etraxfs_timer.c            |  6 +-----
 hw/timer/exynos4210_mct.c           |  6 +-----
 hw/timer/exynos4210_pwm.c           |  6 +-----
 hw/timer/grlib_gptimer.c            |  6 +-----
 hw/timer/hpet.c                     |  6 +-----
 hw/timer/i8254.c                    |  6 +-----
 hw/timer/i8254_common.c             |  6 +-----
 hw/timer/imx_epit.c                 |  6 +-----
 hw/timer/imx_gpt.c                  | 12 ++++--------
 hw/timer/lm32_timer.c               |  6 +-----
 hw/timer/milkymist-sysctl.c         |  6 +-----
 hw/timer/mss-timer.c                |  6 +-----
 hw/timer/nrf51_timer.c              |  6 +-----
 hw/timer/puv3_ost.c                 |  6 +-----
 hw/timer/pxa2xx_timer.c             | 10 +++-------
 hw/timer/renesas_cmt.c              |  6 +-----
 hw/timer/renesas_tmr.c              |  6 +-----
 hw/timer/slavio_timer.c             |  6 +-----
 hw/timer/stm32f2xx_timer.c          |  6 +-----
 hw/timer/xilinx_timer.c             |  6 +-----
 hw/tpm/tpm_crb.c                    |  6 +-----
 hw/tpm/tpm_spapr.c                  |  6 +-----
 hw/tpm/tpm_tis_isa.c                |  6 +-----
 hw/tpm/tpm_tis_sysbus.c             |  6 +-----
 hw/usb/bus.c                        |  8 ++------
 hw/usb/ccid-card-emulated.c         |  6 +-----
 hw/usb/ccid-card-passthru.c         |  6 +-----
 hw/usb/chipidea.c                   |  6 +-----
 hw/usb/dev-audio.c                  |  2 +-
 hw/usb/dev-hid.c                    |  8 ++++----
 hw/usb/dev-hub.c                    |  6 +-----
 hw/usb/dev-mtp.c                    |  6 +-----
 hw/usb/dev-network.c                |  6 +-----
 hw/usb/dev-serial.c                 |  6 +++---
 hw/usb/dev-smartcard-reader.c       |  6 +++---
 hw/usb/dev-storage.c                | 10 +++-------
 hw/usb/dev-uas.c                    |  6 +-----
 hw/usb/dev-wacom.c                  |  2 +-
 hw/usb/hcd-dwc2.c                   |  6 +-----
 hw/usb/hcd-ehci-pci.c               |  2 +-
 hw/usb/hcd-ehci-sysbus.c            | 18 +++++++-----------
 hw/usb/hcd-ohci-pci.c               |  6 +-----
 hw/usb/hcd-ohci.c                   |  6 +-----
 hw/usb/hcd-uhci.c                   |  2 +-
 hw/usb/hcd-xhci-nec.c               |  6 +-----
 hw/usb/hcd-xhci.c                   |  8 ++------
 hw/usb/host-libusb.c                |  6 +-----
 hw/usb/imx-usb-phy.c                |  6 +-----
 hw/usb/redirect.c                   |  6 +-----
 hw/usb/tusb6010.c                   |  6 +-----
 hw/vfio/amd-xgbe.c                  |  6 +-----
 hw/vfio/ap.c                        |  6 +-----
 hw/vfio/calxeda-xgmac.c             |  6 +-----
 hw/vfio/ccw.c                       |  6 +-----
 hw/vfio/igd.c                       |  6 +-----
 hw/vfio/pci.c                       |  8 ++------
 hw/vfio/platform.c                  |  6 +-----
 hw/virtio/vhost-user-fs.c           |  6 +-----
 hw/virtio/vhost-user-vsock.c        |  6 +-----
 hw/virtio/vhost-vsock-common.c      |  6 +-----
 hw/virtio/vhost-vsock.c             |  6 +-----
 hw/virtio/virtio-balloon.c          |  6 +-----
 hw/virtio/virtio-bus.c              |  6 +-----
 hw/virtio/virtio-crypto.c           |  6 +-----
 hw/virtio/virtio-input-pci.c        |  4 ++--
 hw/virtio/virtio-iommu.c            |  8 ++------
 hw/virtio/virtio-mem.c              |  6 +-----
 hw/virtio/virtio-mmio.c             |  8 ++------
 hw/virtio/virtio-pci.c              |  4 ++--
 hw/virtio/virtio-pmem.c             |  6 +-----
 hw/virtio/virtio-rng.c              |  6 +-----
 hw/virtio/virtio.c                  |  6 +-----
 hw/watchdog/cmsdk-apb-watchdog.c    |  8 ++------
 hw/watchdog/wdt_aspeed.c            |  8 ++++----
 hw/watchdog/wdt_diag288.c           |  2 +-
 hw/watchdog/wdt_i6300esb.c          |  2 +-
 hw/watchdog/wdt_ib700.c             |  2 +-
 hw/watchdog/wdt_imx2.c              |  2 +-
 hw/xen/xen-bus.c                    | 10 +++-------
 hw/xen/xen-legacy-backend.c         | 10 +++-------
 hw/xen/xen_pt.c                     |  6 +-----
 hw/xtensa/xtfpga.c                  | 20 ++++++++------------
 io/channel-buffer.c                 |  6 +-----
 io/channel-command.c                |  6 +-----
 io/channel-file.c                   |  6 +-----
 io/channel-socket.c                 |  6 +-----
 io/channel-tls.c                    |  6 +-----
 io/channel-websock.c                |  6 +-----
 io/channel.c                        |  6 +-----
 io/dns-resolver.c                   |  6 +-----
 io/net-listener.c                   |  6 +-----
 iothread.c                          |  6 +-----
 migration/migration.c               |  6 +-----
 migration/rdma.c                    |  6 +-----
 net/can/can_core.c                  |  6 +-----
 net/can/can_host.c                  |  6 +-----
 net/can/can_socketcan.c             |  6 +-----
 net/colo-compare.c                  |  6 +-----
 net/dump.c                          |  6 +-----
 net/filter-buffer.c                 |  6 +-----
 net/filter-mirror.c                 |  8 ++------
 net/filter-replay.c                 |  6 +-----
 net/filter-rewriter.c               |  6 +-----
 net/filter.c                        |  6 +-----
 qom/container.c                     |  6 +-----
 scsi/pr-manager-helper.c            |  6 +-----
 scsi/pr-manager.c                   |  7 +------
 softmmu/memory.c                    |  8 ++------
 target/arm/cpu.c                    |  4 ++--
 target/arm/cpu64.c                  |  2 +-
 target/hppa/cpu.c                   |  6 +-----
 target/i386/cpu.c                   |  8 ++++----
 target/i386/hax-all.c               |  6 +-----
 target/i386/hvf/hvf.c               |  6 +-----
 target/i386/sev.c                   |  7 +------
 target/i386/whpx-all.c              |  6 +-----
 target/microblaze/cpu.c             |  6 +-----
 target/mips/cpu.c                   |  2 +-
 target/nios2/cpu.c                  |  6 +-----
 target/rx/cpu.c                     |  8 ++------
 target/s390x/cpu.c                  |  6 +-----
 target/s390x/cpu_models.c           |  6 +++---
 target/sparc/cpu.c                  |  2 +-
 target/tilegx/cpu.c                 |  6 +-----
 target/xtensa/cpu.c                 |  6 +-----
 ui/console.c                        |  6 +-----
 ui/input-barrier.c                  |  6 +-----
 ui/input-linux.c                    |  6 +-----
 target/ppc/translate_init.c.inc     |  4 ++--
 817 files changed, 1181 insertions(+), 4312 deletions(-)

diff --git a/accel/accel.c b/accel/accel.c
index cb555e3b06..5239dd7f45 100644
--- a/accel/accel.c
+++ b/accel/accel.c
@@ -36,6 +36,7 @@ static const TypeInfo accel_type = {
     .class_size = sizeof(AccelClass),
     .instance_size = sizeof(AccelState),
 };
+TYPE_INFO(accel_type)
 
 /* Lookup AccelClass from opt_name. Returns NULL if not found */
 AccelClass *accel_find(const char *opt_name)
@@ -77,9 +78,4 @@ void accel_setup_post(MachineState *ms)
     }
 }
 
-static void register_accel_types(void)
-{
-    type_register_static(&accel_type);
-}
 
-type_init(register_accel_types);
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 63ef6af9a1..ab89d0ef94 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3208,10 +3208,6 @@ static const TypeInfo kvm_accel_type = {
     .class_init = kvm_accel_class_init,
     .instance_size = sizeof(KVMState),
 };
+TYPE_INFO(kvm_accel_type)
 
-static void kvm_type_init(void)
-{
-    type_register_static(&kvm_accel_type);
-}
 
-type_init(kvm_type_init);
diff --git a/accel/qtest.c b/accel/qtest.c
index 5b88f55921..d19a6297bb 100644
--- a/accel/qtest.c
+++ b/accel/qtest.c
@@ -45,10 +45,6 @@ static const TypeInfo qtest_accel_type = {
     .parent = TYPE_ACCEL,
     .class_init = qtest_accel_class_init,
 };
+TYPE_INFO(qtest_accel_type)
 
-static void qtest_type_init(void)
-{
-    type_register_static(&qtest_accel_type);
-}
 
-type_init(qtest_type_init);
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index eace2c113b..c29e72fb1f 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -217,10 +217,6 @@ static const TypeInfo tcg_accel_type = {
     .class_init = tcg_accel_class_init,
     .instance_size = sizeof(TCGState),
 };
+TYPE_INFO(tcg_accel_type)
 
-static void register_accel_types(void)
-{
-    type_register_static(&tcg_accel_type);
-}
 
-type_init(register_accel_types);
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 60b971d0a8..888053a39f 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -213,10 +213,6 @@ static const TypeInfo xen_accel_type = {
     .parent = TYPE_ACCEL,
     .class_init = xen_accel_class_init,
 };
+TYPE_INFO(xen_accel_type)
 
-static void xen_type_init(void)
-{
-    type_register_static(&xen_accel_type);
-}
 
-type_init(xen_type_init);
diff --git a/authz/base.c b/authz/base.c
index c75bce3fd1..619b4bb706 100644
--- a/authz/base.c
+++ b/authz/base.c
@@ -73,11 +73,7 @@ static const TypeInfo authz_info = {
     .class_size = sizeof(QAuthZClass),
     .abstract = true,
 };
+TYPE_INFO(authz_info)
 
-static void qauthz_register_types(void)
-{
-    type_register_static(&authz_info);
-}
 
-type_init(qauthz_register_types)
 
diff --git a/authz/list.c b/authz/list.c
index 8e904bfc93..bfe1310d47 100644
--- a/authz/list.c
+++ b/authz/list.c
@@ -259,13 +259,8 @@ static const TypeInfo qauthz_list_info = {
         { }
     }
 };
+TYPE_INFO(qauthz_list_info)
 
 
-static void
-qauthz_list_register_types(void)
-{
-    type_register_static(&qauthz_list_info);
-}
 
 
-type_init(qauthz_list_register_types);
diff --git a/authz/listfile.c b/authz/listfile.c
index 666df872ad..048255aa76 100644
--- a/authz/listfile.c
+++ b/authz/listfile.c
@@ -270,13 +270,8 @@ static const TypeInfo qauthz_list_file_info = {
         { }
     }
 };
+TYPE_INFO(qauthz_list_file_info)
 
 
-static void
-qauthz_list_file_register_types(void)
-{
-    type_register_static(&qauthz_list_file_info);
-}
 
 
-type_init(qauthz_list_file_register_types);
diff --git a/authz/pamacct.c b/authz/pamacct.c
index 3c6be43916..7dd240f654 100644
--- a/authz/pamacct.c
+++ b/authz/pamacct.c
@@ -136,13 +136,8 @@ static const TypeInfo qauthz_pam_info = {
         { }
     }
 };
+TYPE_INFO(qauthz_pam_info)
 
 
-static void
-qauthz_pam_register_types(void)
-{
-    type_register_static(&qauthz_pam_info);
-}
 
 
-type_init(qauthz_pam_register_types);
diff --git a/authz/simple.c b/authz/simple.c
index 84954b80a5..f9c53df352 100644
--- a/authz/simple.c
+++ b/authz/simple.c
@@ -103,13 +103,8 @@ static const TypeInfo qauthz_simple_info = {
         { }
     }
 };
+TYPE_INFO(qauthz_simple_info)
 
 
-static void
-qauthz_simple_register_types(void)
-{
-    type_register_static(&qauthz_simple_info);
-}
 
 
-type_init(qauthz_simple_register_types);
diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index 14316333fe..cb3690383f 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -384,11 +384,6 @@ static const TypeInfo cryptodev_builtin_info = {
     .class_init = cryptodev_builtin_class_init,
     .instance_size = sizeof(CryptoDevBackendBuiltin),
 };
+TYPE_INFO(cryptodev_builtin_info)
 
-static void
-cryptodev_builtin_register_types(void)
-{
-    type_register_static(&cryptodev_builtin_info);
-}
 
-type_init(cryptodev_builtin_register_types);
diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-user.c
index dbe5a8aae6..0fffa10214 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -372,11 +372,6 @@ static const TypeInfo cryptodev_vhost_user_info = {
     .instance_finalize = cryptodev_vhost_user_finalize,
     .instance_size = sizeof(CryptoDevBackendVhostUser),
 };
+TYPE_INFO(cryptodev_vhost_user_info)
 
-static void
-cryptodev_vhost_user_register_types(void)
-{
-    type_register_static(&cryptodev_vhost_user_info);
-}
 
-type_init(cryptodev_vhost_user_register_types);
diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index ada4ebe78b..9180af54e9 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -245,11 +245,6 @@ static const TypeInfo cryptodev_backend_info = {
         { }
     }
 };
+TYPE_INFO(cryptodev_backend_info)
 
-static void
-cryptodev_backend_register_types(void)
-{
-    type_register_static(&cryptodev_backend_info);
-}
 
-type_init(cryptodev_backend_register_types);
diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index 56361a6272..d8cc3e7e25 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -499,11 +499,6 @@ static const TypeInfo dbus_vmstate_info = {
         { }
     }
 };
+TYPE_INFO(dbus_vmstate_info)
 
-static void
-register_types(void)
-{
-    type_register_static(&dbus_vmstate_info);
-}
 
-type_init(register_types);
diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 5b819020b4..5037357cd0 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -199,10 +199,6 @@ static const TypeInfo file_backend_info = {
     .instance_finalize = file_backend_instance_finalize,
     .instance_size = sizeof(HostMemoryBackendFile),
 };
+TYPE_INFO(file_backend_info)
 
-static void register_types(void)
-{
-    type_register_static(&file_backend_info);
-}
 
-type_init(register_types);
diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 4c040a7541..4b4f13a3ca 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -161,11 +161,11 @@ static const TypeInfo memfd_backend_info = {
     .class_init = memfd_backend_class_init,
     .instance_size = sizeof(HostMemoryBackendMemfd),
 };
+TYPE_INFO(memfd_backend_info)
 
 static void register_types(void)
 {
     if (qemu_memfd_check(MFD_ALLOW_SEALING)) {
-        type_register_static(&memfd_backend_info);
     }
 }
 
diff --git a/backends/hostmem-ram.c b/backends/hostmem-ram.c
index 5cc53e76c9..3bbe53f1ce 100644
--- a/backends/hostmem-ram.c
+++ b/backends/hostmem-ram.c
@@ -45,10 +45,6 @@ static const TypeInfo ram_backend_info = {
     .parent = TYPE_MEMORY_BACKEND,
     .class_init = ram_backend_class_init,
 };
+TYPE_INFO(ram_backend_info)
 
-static void register_types(void)
-{
-    type_register_static(&ram_backend_info);
-}
 
-type_init(register_types);
diff --git a/backends/hostmem.c b/backends/hostmem.c
index 4bde00e8e7..49d15e61be 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -516,10 +516,6 @@ static const TypeInfo host_memory_backend_info = {
         { }
     }
 };
+TYPE_INFO(host_memory_backend_info)
 
-static void register_types(void)
-{
-    type_register_static(&host_memory_backend_info);
-}
 
-type_init(register_types);
diff --git a/backends/rng-builtin.c b/backends/rng-builtin.c
index ba1b8d66b8..d6afd54b3e 100644
--- a/backends/rng-builtin.c
+++ b/backends/rng-builtin.c
@@ -68,10 +68,6 @@ static const TypeInfo rng_builtin_info = {
     .instance_finalize = rng_builtin_finalize,
     .class_init = rng_builtin_class_init,
 };
+TYPE_INFO(rng_builtin_info)
 
-static void register_types(void)
-{
-    type_register_static(&rng_builtin_info);
-}
 
-type_init(register_types);
diff --git a/backends/rng-egd.c b/backends/rng-egd.c
index 7aaa6ee239..90d57417ff 100644
--- a/backends/rng-egd.c
+++ b/backends/rng-egd.c
@@ -165,10 +165,6 @@ static const TypeInfo rng_egd_info = {
     .instance_init = rng_egd_init,
     .instance_finalize = rng_egd_finalize,
 };
+TYPE_INFO(rng_egd_info)
 
-static void register_types(void)
-{
-    type_register_static(&rng_egd_info);
-}
 
-type_init(register_types);
diff --git a/backends/rng-random.c b/backends/rng-random.c
index 32998d8ee7..59dba2b3f4 100644
--- a/backends/rng-random.c
+++ b/backends/rng-random.c
@@ -144,10 +144,6 @@ static const TypeInfo rng_random_info = {
     .instance_init = rng_random_init,
     .instance_finalize = rng_random_finalize,
 };
+TYPE_INFO(rng_random_info)
 
-static void register_types(void)
-{
-    type_register_static(&rng_random_info);
-}
 
-type_init(register_types);
diff --git a/backends/rng.c b/backends/rng.c
index 484f04e891..dcea7a89e9 100644
--- a/backends/rng.c
+++ b/backends/rng.c
@@ -139,10 +139,6 @@ static const TypeInfo rng_backend_info = {
         { }
     }
 };
+TYPE_INFO(rng_backend_info)
 
-static void register_types(void)
-{
-    type_register_static(&rng_backend_info);
-}
 
-type_init(register_types);
diff --git a/backends/tpm/tpm_backend.c b/backends/tpm/tpm_backend.c
index 375587e743..9aac3df542 100644
--- a/backends/tpm/tpm_backend.c
+++ b/backends/tpm/tpm_backend.c
@@ -192,17 +192,13 @@ static const TypeInfo tpm_backend_info = {
     .class_size = sizeof(TPMBackendClass),
     .abstract = true,
 };
+TYPE_INFO(tpm_backend_info)
 
 static const TypeInfo tpm_if_info = {
     .name = TYPE_TPM_IF,
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(TPMIfClass),
 };
+TYPE_INFO(tpm_if_info)
 
-static void register_types(void)
-{
-    type_register_static(&tpm_backend_info);
-    type_register_static(&tpm_if_info);
-}
 
-type_init(register_types);
diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index a9b0f55e67..ac441337d9 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -996,10 +996,6 @@ static const TypeInfo tpm_emulator_info = {
     .instance_init = tpm_emulator_inst_init,
     .instance_finalize = tpm_emulator_inst_finalize,
 };
+TYPE_INFO(tpm_emulator_info)
 
-static void tpm_emulator_register(void)
-{
-    type_register_static(&tpm_emulator_info);
-}
 
-type_init(tpm_emulator_register)
diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.c
index 7403807ec4..8e67b4b7d6 100644
--- a/backends/tpm/tpm_passthrough.c
+++ b/backends/tpm/tpm_passthrough.c
@@ -396,10 +396,6 @@ static const TypeInfo tpm_passthrough_info = {
     .instance_init = tpm_passthrough_inst_init,
     .instance_finalize = tpm_passthrough_inst_finalize,
 };
+TYPE_INFO(tpm_passthrough_info)
 
-static void tpm_passthrough_register(void)
-{
-    type_register_static(&tpm_passthrough_info);
-}
 
-type_init(tpm_passthrough_register)
diff --git a/backends/vhost-user.c b/backends/vhost-user.c
index 9e6e198546..25873b1981 100644
--- a/backends/vhost-user.c
+++ b/backends/vhost-user.c
@@ -199,10 +199,6 @@ static const TypeInfo vhost_user_backend_info = {
     .instance_finalize = vhost_user_backend_finalize,
     .class_size = sizeof(VhostUserBackendClass),
 };
+TYPE_INFO(vhost_user_backend_info)
 
-static void register_types(void)
-{
-    type_register_static(&vhost_user_backend_info);
-}
 
-type_init(register_types);
diff --git a/block/throttle-groups.c b/block/throttle-groups.c
index 4e28365d8d..49f68bef50 100644
--- a/block/throttle-groups.c
+++ b/block/throttle-groups.c
@@ -968,10 +968,6 @@ static const TypeInfo throttle_group_info = {
         { }
     },
 };
+TYPE_INFO(throttle_group_info)
 
-static void throttle_groups_init(void)
-{
-    type_register_static(&throttle_group_info);
-}
 
-type_init(throttle_groups_init);
diff --git a/chardev/baum.c b/chardev/baum.c
index 9c95e7bc79..f111ebfe05 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -677,10 +677,6 @@ static const TypeInfo char_braille_type_info = {
     .instance_finalize = char_braille_finalize,
     .class_init = char_braille_class_init,
 };
+TYPE_INFO(char_braille_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_braille_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/char-console.c b/chardev/char-console.c
index 6c4ce5dbce..89b083c5b9 100644
--- a/chardev/char-console.c
+++ b/chardev/char-console.c
@@ -46,10 +46,6 @@ static const TypeInfo char_console_type_info = {
     .parent = TYPE_CHARDEV_WIN,
     .class_init = char_console_class_init,
 };
+TYPE_INFO(char_console_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_console_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index c2d8101106..b263e285f0 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -161,10 +161,6 @@ static const TypeInfo char_fd_type_info = {
     .class_init = char_fd_class_init,
     .abstract = true,
 };
+TYPE_INFO(char_fd_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_fd_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index 6f980bb836..c3be4e40e5 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -394,10 +394,6 @@ static const TypeInfo char_mux_type_info = {
     .instance_size = sizeof(MuxChardev),
     .instance_finalize = char_mux_finalize,
 };
+TYPE_INFO(char_mux_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_mux_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/char-null.c b/chardev/char-null.c
index 1c6a2900f9..ce43ccdda6 100644
--- a/chardev/char-null.c
+++ b/chardev/char-null.c
@@ -47,10 +47,6 @@ static const TypeInfo char_null_type_info = {
     .instance_size = sizeof(Chardev),
     .class_init = char_null_class_init,
 };
+TYPE_INFO(char_null_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_null_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index 05e7efbd6c..dd60ef9898 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -308,12 +308,8 @@ static const TypeInfo char_parallel_type_info = {
     .instance_finalize = char_parallel_finalize,
     .class_init = char_parallel_class_init,
 };
+TYPE_INFO(char_parallel_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_parallel_type_info);
-}
 
-type_init(register_types);
 
 #endif
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index 1cc501a481..40d7bddba3 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -243,10 +243,6 @@ static const TypeInfo char_pty_type_info = {
     .instance_finalize = char_pty_finalize,
     .class_init = char_pty_class_init,
 };
+TYPE_INFO(char_pty_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_pty_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/char-ringbuf.c b/chardev/char-ringbuf.c
index 67397a8ce9..fe9881b85b 100644
--- a/chardev/char-ringbuf.c
+++ b/chardev/char-ringbuf.c
@@ -237,17 +237,13 @@ static const TypeInfo char_ringbuf_type_info = {
     .instance_size = sizeof(RingBufChardev),
     .instance_finalize = char_ringbuf_finalize,
 };
+TYPE_INFO(char_ringbuf_type_info)
 
 /* Bug-compatibility: */
 static const TypeInfo char_memory_type_info = {
     .name = TYPE_CHARDEV_MEMORY,
     .parent = TYPE_CHARDEV_RINGBUF,
 };
+TYPE_INFO(char_memory_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_ringbuf_type_info);
-    type_register_static(&char_memory_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index ef62dbf3d7..8c4ff2effb 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1510,10 +1510,6 @@ static const TypeInfo char_socket_type_info = {
     .instance_finalize = char_socket_finalize,
     .class_init = char_socket_class_init,
 };
+TYPE_INFO(char_socket_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_socket_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/char-udp.c b/chardev/char-udp.c
index bba4145f96..0d175b62e0 100644
--- a/chardev/char-udp.c
+++ b/chardev/char-udp.c
@@ -234,10 +234,6 @@ static const TypeInfo char_udp_type_info = {
     .instance_finalize = char_udp_finalize,
     .class_init = char_udp_class_init,
 };
+TYPE_INFO(char_udp_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_udp_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/char-win-stdio.c b/chardev/char-win-stdio.c
index 99afda353c..a6794d26d7 100644
--- a/chardev/char-win-stdio.c
+++ b/chardev/char-win-stdio.c
@@ -260,10 +260,6 @@ static const TypeInfo char_win_stdio_type_info = {
     .class_init = char_win_stdio_class_init,
     .abstract = true,
 };
+TYPE_INFO(char_win_stdio_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_win_stdio_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/char-win.c b/chardev/char-win.c
index d4fb44c4dc..f7965c1aca 100644
--- a/chardev/char-win.c
+++ b/chardev/char-win.c
@@ -235,10 +235,6 @@ static const TypeInfo char_win_type_info = {
     .class_init = char_win_class_init,
     .abstract = true,
 };
+TYPE_INFO(char_win_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_win_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/char.c b/chardev/char.c
index 77e7ec814f..9665aa5b20 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -304,6 +304,7 @@ static const TypeInfo char_type_info = {
     .class_size = sizeof(ChardevClass),
     .class_init = char_class_init,
 };
+TYPE_INFO(char_type_info)
 
 static bool qemu_chr_is_busy(Chardev *s)
 {
@@ -1168,9 +1169,4 @@ void qemu_chr_cleanup(void)
     object_unparent(get_chardevs_root());
 }
 
-static void register_types(void)
-{
-    type_register_static(&char_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index 6d8f06fed4..680c772f6f 100644
--- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -182,10 +182,6 @@ static const TypeInfo char_msmouse_type_info = {
     .instance_finalize = char_msmouse_finalize,
     .class_init = char_msmouse_class_init,
 };
+TYPE_INFO(char_msmouse_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_msmouse_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/spice.c b/chardev/spice.c
index bf7ea1e294..08555d6c43 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -383,6 +383,7 @@ static const TypeInfo char_spice_type_info = {
     .class_init = char_spice_class_init,
     .abstract = true,
 };
+TYPE_INFO(char_spice_type_info)
 
 static void char_spicevmc_class_init(ObjectClass *oc, void *data)
 {
@@ -398,6 +399,7 @@ static const TypeInfo char_spicevmc_type_info = {
     .parent = TYPE_CHARDEV_SPICE,
     .class_init = char_spicevmc_class_init,
 };
+TYPE_INFO(char_spicevmc_type_info)
 
 static void char_spiceport_class_init(ObjectClass *oc, void *data)
 {
@@ -413,12 +415,6 @@ static const TypeInfo char_spiceport_type_info = {
     .parent = TYPE_CHARDEV_SPICE,
     .class_init = char_spiceport_class_init,
 };
+TYPE_INFO(char_spiceport_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_spice_type_info);
-    type_register_static(&char_spicevmc_type_info);
-    type_register_static(&char_spiceport_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/testdev.c b/chardev/testdev.c
index 368a8c041e..0c0ddc17d7 100644
--- a/chardev/testdev.c
+++ b/chardev/testdev.c
@@ -121,10 +121,6 @@ static const TypeInfo char_testdev_type_info = {
     .instance_size = sizeof(TestdevChardev),
     .class_init = char_testdev_class_init,
 };
+TYPE_INFO(char_testdev_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&char_testdev_type_info);
-}
 
-type_init(register_types);
diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index e9cb7ca710..95c7504002 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -356,10 +356,6 @@ static const TypeInfo wctablet_type_info = {
     .instance_finalize = wctablet_chr_finalize,
     .class_init = wctablet_chr_class_init,
 };
+TYPE_INFO(wctablet_type_info)
 
-static void register_types(void)
-{
-     type_register_static(&wctablet_type_info);
-}
 
-type_init(register_types);
diff --git a/crypto/secret.c b/crypto/secret.c
index 281cb81f0f..c07011d388 100644
--- a/crypto/secret.c
+++ b/crypto/secret.c
@@ -153,13 +153,8 @@ static const TypeInfo qcrypto_secret_info = {
         { }
     }
 };
+TYPE_INFO(qcrypto_secret_info)
 
 
-static void
-qcrypto_secret_register_types(void)
-{
-    type_register_static(&qcrypto_secret_info);
-}
 
 
-type_init(qcrypto_secret_register_types);
diff --git a/crypto/secret_common.c b/crypto/secret_common.c
index b03d530867..80d7d75b4d 100644
--- a/crypto/secret_common.c
+++ b/crypto/secret_common.c
@@ -391,13 +391,8 @@ static const TypeInfo qcrypto_secret_info = {
     .class_init = qcrypto_secret_class_init,
     .abstract = true,
 };
+TYPE_INFO(qcrypto_secret_info)
 
 
-static void
-qcrypto_secret_register_types(void)
-{
-    type_register_static(&qcrypto_secret_info);
-}
 
 
-type_init(qcrypto_secret_register_types);
diff --git a/crypto/secret_keyring.c b/crypto/secret_keyring.c
index 8bfc58ebf4..821d2e421b 100644
--- a/crypto/secret_keyring.c
+++ b/crypto/secret_keyring.c
@@ -136,13 +136,8 @@ static const TypeInfo qcrypto_secret_info = {
         { }
     }
 };
+TYPE_INFO(qcrypto_secret_info)
 
 
-static void
-qcrypto_secret_register_types(void)
-{
-    type_register_static(&qcrypto_secret_info);
-}
 
 
-type_init(qcrypto_secret_register_types);
diff --git a/crypto/tls-cipher-suites.c b/crypto/tls-cipher-suites.c
index 0d305b684b..e92a380a24 100644
--- a/crypto/tls-cipher-suites.c
+++ b/crypto/tls-cipher-suites.c
@@ -117,10 +117,6 @@ static const TypeInfo qcrypto_tls_cipher_suites_info = {
         { }
     }
 };
+TYPE_INFO(qcrypto_tls_cipher_suites_info)
 
-static void qcrypto_tls_cipher_suites_register_types(void)
-{
-    type_register_static(&qcrypto_tls_cipher_suites_info);
-}
 
-type_init(qcrypto_tls_cipher_suites_register_types);
diff --git a/crypto/tlscreds.c b/crypto/tlscreds.c
index b68735f06f..bb3e6667b9 100644
--- a/crypto/tlscreds.c
+++ b/crypto/tlscreds.c
@@ -270,13 +270,8 @@ static const TypeInfo qcrypto_tls_creds_info = {
     .class_size = sizeof(QCryptoTLSCredsClass),
     .abstract = true,
 };
+TYPE_INFO(qcrypto_tls_creds_info)
 
 
-static void
-qcrypto_tls_creds_register_types(void)
-{
-    type_register_static(&qcrypto_tls_creds_info);
-}
 
 
-type_init(qcrypto_tls_creds_register_types);
diff --git a/crypto/tlscredsanon.c b/crypto/tlscredsanon.c
index 30275b6847..16162e60b6 100644
--- a/crypto/tlscredsanon.c
+++ b/crypto/tlscredsanon.c
@@ -203,13 +203,8 @@ static const TypeInfo qcrypto_tls_creds_anon_info = {
         { }
     }
 };
+TYPE_INFO(qcrypto_tls_creds_anon_info)
 
 
-static void
-qcrypto_tls_creds_anon_register_types(void)
-{
-    type_register_static(&qcrypto_tls_creds_anon_info);
-}
 
 
-type_init(qcrypto_tls_creds_anon_register_types);
diff --git a/crypto/tlscredspsk.c b/crypto/tlscredspsk.c
index e26807b899..ea890f5837 100644
--- a/crypto/tlscredspsk.c
+++ b/crypto/tlscredspsk.c
@@ -294,13 +294,8 @@ static const TypeInfo qcrypto_tls_creds_psk_info = {
         { }
     }
 };
+TYPE_INFO(qcrypto_tls_creds_psk_info)
 
 
-static void
-qcrypto_tls_creds_psk_register_types(void)
-{
-    type_register_static(&qcrypto_tls_creds_psk_info);
-}
 
 
-type_init(qcrypto_tls_creds_psk_register_types);
diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index dd7267ccdb..77f1beaf8b 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -829,13 +829,8 @@ static const TypeInfo qcrypto_tls_creds_x509_info = {
         { }
     }
 };
+TYPE_INFO(qcrypto_tls_creds_x509_info)
 
 
-static void
-qcrypto_tls_creds_x509_register_types(void)
-{
-    type_register_static(&qcrypto_tls_creds_x509_info);
-}
 
 
-type_init(qcrypto_tls_creds_x509_register_types);
diff --git a/gdbstub.c b/gdbstub.c
index 9dfb6e4142..7d10ee0bbf 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3308,6 +3308,7 @@ static const TypeInfo char_gdb_type_info = {
     .parent = TYPE_CHARDEV,
     .class_init = char_gdb_class_init,
 };
+TYPE_INFO(char_gdb_type_info)
 
 static int find_cpu_clusters(Object *child, void *opaque)
 {
@@ -3440,10 +3441,5 @@ void gdbserver_cleanup(void)
     }
 }
 
-static void register_types(void)
-{
-    type_register_static(&char_gdb_type_info);
-}
 
-type_init(register_types);
 #endif
diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 36f3aa9352..4d16e2033f 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -259,10 +259,6 @@ static const TypeInfo virtio_device_info = {
     .instance_size = sizeof(V9fsVirtioState),
     .class_init = virtio_9p_class_init,
 };
+TYPE_INFO(virtio_device_info)
 
-static void virtio_9p_register_types(void)
-{
-    type_register_static(&virtio_device_info);
-}
 
-type_init(virtio_9p_register_types)
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index b8abdefa1c..e766835af6 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -363,10 +363,6 @@ static const TypeInfo acpi_ged_info = {
         { }
     }
 };
+TYPE_INFO(acpi_ged_info)
 
-static void acpi_ged_register_types(void)
-{
-    type_register_static(&acpi_ged_info);
-}
 
-type_init(acpi_ged_register_types)
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 26bac4f16c..f27f6660f9 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -684,10 +684,6 @@ static const TypeInfo piix4_pm_info = {
         { }
     }
 };
+TYPE_INFO(piix4_pm_info)
 
-static void piix4_pm_register_types(void)
-{
-    type_register_static(&piix4_pm_info);
-}
 
-type_init(piix4_pm_register_types)
diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
index 2df7623d74..ca62b6f161 100644
--- a/hw/acpi/vmgenid.c
+++ b/hw/acpi/vmgenid.c
@@ -237,13 +237,9 @@ static const TypeInfo vmgenid_device_info = {
     .instance_size = sizeof(VmGenIdState),
     .class_init    = vmgenid_device_class_init,
 };
+TYPE_INFO(vmgenid_device_info)
 
-static void vmgenid_register_types(void)
-{
-    type_register_static(&vmgenid_device_info);
-}
 
-type_init(vmgenid_register_types)
 
 GuidInfo *qmp_query_vm_generation_id(Error **errp)
 {
diff --git a/hw/adc/stm32f2xx_adc.c b/hw/adc/stm32f2xx_adc.c
index 01a0b14e69..647a47c706 100644
--- a/hw/adc/stm32f2xx_adc.c
+++ b/hw/adc/stm32f2xx_adc.c
@@ -299,10 +299,6 @@ static const TypeInfo stm32f2xx_adc_info = {
     .instance_init = stm32f2xx_adc_init,
     .class_init    = stm32f2xx_adc_class_init,
 };
+TYPE_INFO(stm32f2xx_adc_info)
 
-static void stm32f2xx_adc_register_types(void)
-{
-    type_register_static(&stm32f2xx_adc_info);
-}
 
-type_init(stm32f2xx_adc_register_types)
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 29d44dfb06..637411c10b 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -940,6 +940,7 @@ static const TypeInfo typhoon_pcihost_info = {
     .parent        = TYPE_PCI_HOST_BRIDGE,
     .instance_size = sizeof(TyphoonState),
 };
+TYPE_INFO(typhoon_pcihost_info)
 
 static void typhoon_iommu_memory_region_class_init(ObjectClass *klass,
                                                    void *data)
@@ -954,11 +955,6 @@ static const TypeInfo typhoon_iommu_memory_region_info = {
     .name = TYPE_TYPHOON_IOMMU_MEMORY_REGION,
     .class_init = typhoon_iommu_memory_region_class_init,
 };
+TYPE_INFO(typhoon_iommu_memory_region_info)
 
-static void typhoon_register_types(void)
-{
-    type_register_static(&typhoon_pcihost_info);
-    type_register_static(&typhoon_iommu_memory_region_info);
-}
 
-type_init(typhoon_register_types)
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index e258463747..1dad8a226b 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -182,10 +182,6 @@ static const TypeInfo aw_a10_type_info = {
     .instance_init = aw_a10_init,
     .class_init = aw_a10_class_init,
 };
+TYPE_INFO(aw_a10_type_info)
 
-static void aw_a10_register_types(void)
-{
-    type_register_static(&aw_a10_type_info);
-}
 
-type_init(aw_a10_register_types)
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 341abe6718..c59d2ffc3e 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -446,10 +446,6 @@ static const TypeInfo allwinner_h3_type_info = {
     .instance_init = allwinner_h3_init,
     .class_init = allwinner_h3_class_init,
 };
+TYPE_INFO(allwinner_h3_type_info)
 
-static void allwinner_h3_register_types(void)
-{
-    type_register_static(&allwinner_h3_type_info);
-}
 
-type_init(allwinner_h3_register_types)
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 6264eab16b..dcd5798041 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -1167,12 +1167,12 @@ static const TypeInfo armsse_info = {
         { }
     }
 };
+TYPE_INFO(armsse_info)
 
 static void armsse_register_types(void)
 {
     int i;
 
-    type_register_static(&armsse_info);
 
     for (i = 0; i < ARRAY_SIZE(armsse_variants); i++) {
         TypeInfo ti = {
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index aa831d6653..684cdd5417 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -280,6 +280,7 @@ static const TypeInfo armv7m_info = {
     .instance_init = armv7m_instance_init,
     .class_init = armv7m_class_init,
 };
+TYPE_INFO(armv7m_info)
 
 static void armv7m_reset(void *opaque)
 {
@@ -359,11 +360,6 @@ static const TypeInfo bitband_info = {
     .instance_init = bitband_init,
     .class_init    = bitband_class_init,
 };
+TYPE_INFO(bitband_info)
 
-static void armv7m_register_types(void)
-{
-    type_register_static(&bitband_info);
-    type_register_static(&armv7m_info);
-}
 
-type_init(armv7m_register_types)
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index a9d7f53f6e..3d45e4ab7f 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -373,10 +373,6 @@ static const TypeInfo bcm2835_peripherals_type_info = {
     .instance_init = bcm2835_peripherals_init,
     .class_init = bcm2835_peripherals_class_init,
 };
+TYPE_INFO(bcm2835_peripherals_type_info)
 
-static void bcm2835_peripherals_register_types(void)
-{
-    type_register_static(&bcm2835_peripherals_type_info);
-}
 
-type_init(bcm2835_peripherals_register_types)
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index f15cc3b405..7ae9bbdbca 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -168,12 +168,12 @@ static const TypeInfo bcm283x_type_info = {
     .class_size = sizeof(BCM283XClass),
     .abstract = true,
 };
+TYPE_INFO(bcm283x_type_info)
 
 static void bcm2836_register_types(void)
 {
     int i;
 
-    type_register_static(&bcm283x_type_info);
     for (i = 0; i < ARRAY_SIZE(bcm283x_socs); i++) {
         TypeInfo ti = {
             .name = bcm283x_socs[i].name,
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3e9816af80..0ee0934e81 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1317,10 +1317,6 @@ static const TypeInfo arm_linux_boot_if_info = {
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(ARMLinuxBootIfClass),
 };
+TYPE_INFO(arm_linux_boot_if_info)
 
-static void arm_linux_boot_register_types(void)
-{
-    type_register_static(&arm_linux_boot_if_info);
-}
 
-type_init(arm_linux_boot_register_types)
diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 4b35ef4bed..041bab40ef 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -85,9 +85,5 @@ static const TypeInfo collie_machine_typeinfo = {
     .class_init = collie_machine_class_init,
     .instance_size = sizeof(CollieMachineState),
 };
+TYPE_INFO(collie_machine_typeinfo)
 
-static void collie_machine_register_types(void)
-{
-    type_register_static(&collie_machine_typeinfo);
-}
-type_init(collie_machine_register_types);
diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index 614232165c..aae48a4f04 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -98,10 +98,6 @@ static const TypeInfo digic_type_info = {
     .instance_init = digic_init,
     .class_init = digic_class_init,
 };
+TYPE_INFO(digic_type_info)
 
-static void digic_register_types(void)
-{
-    type_register_static(&digic_type_info);
-}
 
-type_init(digic_register_types)
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 081bbff317..e42677ded7 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -502,10 +502,6 @@ static const TypeInfo exynos4210_info = {
     .instance_init = exynos4210_init,
     .class_init = exynos4210_class_init,
 };
+TYPE_INFO(exynos4210_info)
 
-static void exynos4210_register_types(void)
-{
-    type_register_static(&exynos4210_info);
-}
 
-type_init(exynos4210_register_types)
diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index 56b729141b..7761a0fe97 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -169,6 +169,7 @@ static const TypeInfo nuri_type = {
     .parent = TYPE_MACHINE,
     .class_init = nuri_class_init,
 };
+TYPE_INFO(nuri_type)
 
 static void smdkc210_class_init(ObjectClass *oc, void *data)
 {
@@ -187,11 +188,6 @@ static const TypeInfo smdkc210_type = {
     .parent = TYPE_MACHINE,
     .class_init = smdkc210_class_init,
 };
+TYPE_INFO(smdkc210_type)
 
-static void exynos4_machines_init(void)
-{
-    type_register_static(&nuri_type);
-    type_register_static(&smdkc210_type);
-}
 
-type_init(exynos4_machines_init)
diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 08a98f828f..256681a31a 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -342,10 +342,6 @@ static const TypeInfo fsl_imx25_type_info = {
     .instance_init = fsl_imx25_init,
     .class_init = fsl_imx25_class_init,
 };
+TYPE_INFO(fsl_imx25_type_info)
 
-static void fsl_imx25_register_types(void)
-{
-    type_register_static(&fsl_imx25_type_info);
-}
 
-type_init(fsl_imx25_register_types)
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 0983998bb4..6e8c780737 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -245,10 +245,6 @@ static const TypeInfo fsl_imx31_type_info = {
     .instance_init = fsl_imx31_init,
     .class_init = fsl_imx31_class_init,
 };
+TYPE_INFO(fsl_imx31_type_info)
 
-static void fsl_imx31_register_types(void)
-{
-    type_register_static(&fsl_imx31_type_info);
-}
 
-type_init(fsl_imx31_register_types)
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 00dafe3f62..917642a97f 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -473,10 +473,6 @@ static const TypeInfo fsl_imx6_type_info = {
     .instance_init = fsl_imx6_init,
     .class_init = fsl_imx6_class_init,
 };
+TYPE_INFO(fsl_imx6_type_info)
 
-static void fsl_imx6_register_types(void)
-{
-    type_register_static(&fsl_imx6_type_info);
-}
 
-type_init(fsl_imx6_register_types)
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index e0128d7316..39b5ab528f 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -631,9 +631,5 @@ static const TypeInfo fsl_imx6ul_type_info = {
     .instance_init = fsl_imx6ul_init,
     .class_init = fsl_imx6ul_class_init,
 };
+TYPE_INFO(fsl_imx6ul_type_info)
 
-static void fsl_imx6ul_register_types(void)
-{
-    type_register_static(&fsl_imx6ul_type_info);
-}
-type_init(fsl_imx6ul_register_types)
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 2ff2cab924..5b062dd294 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -577,9 +577,5 @@ static const TypeInfo fsl_imx7_type_info = {
     .instance_init = fsl_imx7_init,
     .class_init = fsl_imx7_class_init,
 };
+TYPE_INFO(fsl_imx7_type_info)
 
-static void fsl_imx7_register_types(void)
-{
-    type_register_static(&fsl_imx7_type_info);
-}
-type_init(fsl_imx7_register_types)
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 3a4bc332c4..bb88fae49c 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -121,6 +121,7 @@ static const TypeInfo connex_type = {
     .parent = TYPE_MACHINE,
     .class_init = connex_class_init,
 };
+TYPE_INFO(connex_type)
 
 static void verdex_class_init(ObjectClass *oc, void *data)
 {
@@ -137,11 +138,6 @@ static const TypeInfo verdex_type = {
     .parent = TYPE_MACHINE,
     .class_init = verdex_class_init,
 };
+TYPE_INFO(verdex_type)
 
-static void gumstix_machine_init(void)
-{
-    type_register_static(&connex_type);
-    type_register_static(&verdex_type);
-}
 
-type_init(gumstix_machine_init)
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index c96f2ab9cf..07dad406b4 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -213,13 +213,9 @@ static const TypeInfo highbank_regs_info = {
     .instance_init = highbank_regs_init,
     .class_init    = highbank_regs_class_init,
 };
+TYPE_INFO(highbank_regs_info)
 
-static void highbank_regs_register_types(void)
-{
-    type_register_static(&highbank_regs_info);
-}
 
-type_init(highbank_regs_register_types)
 
 static struct arm_boot_info highbank_binfo;
 
@@ -434,6 +430,7 @@ static const TypeInfo highbank_type = {
     .parent = TYPE_MACHINE,
     .class_init = highbank_class_init,
 };
+TYPE_INFO(highbank_type)
 
 static void midway_class_init(ObjectClass *oc, void *data)
 {
@@ -453,11 +450,6 @@ static const TypeInfo midway_type = {
     .parent = TYPE_MACHINE,
     .class_init = midway_class_init,
 };
+TYPE_INFO(midway_type)
 
-static void calxeda_machines_init(void)
-{
-    type_register_static(&highbank_type);
-    type_register_static(&midway_type);
-}
 
-type_init(calxeda_machines_init)
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index fe7c2b9d4b..2329cb0f4c 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -719,6 +719,7 @@ static const TypeInfo core_info = {
     .instance_init = integratorcm_init,
     .class_init    = core_class_init,
 };
+TYPE_INFO(core_info)
 
 static const TypeInfo icp_pic_info = {
     .name          = TYPE_INTEGRATOR_PIC,
@@ -727,6 +728,7 @@ static const TypeInfo icp_pic_info = {
     .instance_init = icp_pic_init,
     .class_init    = icp_pic_class_init,
 };
+TYPE_INFO(icp_pic_info)
 
 static const TypeInfo icp_ctrl_regs_info = {
     .name          = TYPE_ICP_CONTROL_REGS,
@@ -735,12 +737,6 @@ static const TypeInfo icp_ctrl_regs_info = {
     .instance_init = icp_control_init,
     .class_init    = icp_control_class_init,
 };
+TYPE_INFO(icp_ctrl_regs_info)
 
-static void integratorcp_register_types(void)
-{
-    type_register_static(&icp_pic_info);
-    type_register_static(&core_info);
-    type_register_static(&icp_ctrl_regs_info);
-}
 
-type_init(integratorcp_register_types)
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index a91acab1cb..92331aebf1 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -75,10 +75,6 @@ static const TypeInfo microbit_info = {
     .instance_size = sizeof(MicrobitMachineState),
     .class_init = microbit_machine_class_init,
 };
+TYPE_INFO(microbit_info)
 
-static void microbit_machine_init(void)
-{
-    type_register_static(&microbit_info);
-}
 
-type_init(microbit_machine_init);
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 28d9e8bfac..0a1819fd67 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -692,24 +692,20 @@ static const TypeInfo mps2tz_info = {
         { }
     },
 };
+TYPE_INFO(mps2tz_info)
 
 static const TypeInfo mps2tz_an505_info = {
     .name = TYPE_MPS2TZ_AN505_MACHINE,
     .parent = TYPE_MPS2TZ_MACHINE,
     .class_init = mps2tz_an505_class_init,
 };
+TYPE_INFO(mps2tz_an505_info)
 
 static const TypeInfo mps2tz_an521_info = {
     .name = TYPE_MPS2TZ_AN521_MACHINE,
     .parent = TYPE_MPS2TZ_MACHINE,
     .class_init = mps2tz_an521_class_init,
 };
+TYPE_INFO(mps2tz_an521_info)
 
-static void mps2tz_machine_init(void)
-{
-    type_register_static(&mps2tz_info);
-    type_register_static(&mps2tz_an505_info);
-    type_register_static(&mps2tz_an521_info);
-}
 
-type_init(mps2tz_machine_init);
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 9f12934ca8..4ca6e1ce12 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -428,24 +428,20 @@ static const TypeInfo mps2_info = {
     .class_size = sizeof(MPS2MachineClass),
     .class_init = mps2_class_init,
 };
+TYPE_INFO(mps2_info)
 
 static const TypeInfo mps2_an385_info = {
     .name = TYPE_MPS2_AN385_MACHINE,
     .parent = TYPE_MPS2_MACHINE,
     .class_init = mps2_an385_class_init,
 };
+TYPE_INFO(mps2_an385_info)
 
 static const TypeInfo mps2_an511_info = {
     .name = TYPE_MPS2_AN511_MACHINE,
     .parent = TYPE_MPS2_MACHINE,
     .class_init = mps2_an511_class_init,
 };
+TYPE_INFO(mps2_an511_info)
 
-static void mps2_machine_init(void)
-{
-    type_register_static(&mps2_info);
-    type_register_static(&mps2_an385_info);
-    type_register_static(&mps2_an511_info);
-}
 
-type_init(mps2_machine_init);
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index d2c29e82d1..5e922b1942 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -234,10 +234,6 @@ static const TypeInfo m2sxxx_soc_info = {
     .instance_init = m2sxxx_soc_initfn,
     .class_init    = m2sxxx_soc_class_init,
 };
+TYPE_INFO(m2sxxx_soc_info)
 
-static void m2sxxx_soc_types(void)
-{
-    type_register_static(&m2sxxx_soc_info);
-}
 
-type_init(m2sxxx_soc_types)
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 4bc737f93b..8afc118134 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -647,24 +647,20 @@ static const TypeInfo musca_info = {
     .class_size = sizeof(MuscaMachineClass),
     .class_init = musca_class_init,
 };
+TYPE_INFO(musca_info)
 
 static const TypeInfo musca_a_info = {
     .name = TYPE_MUSCA_A_MACHINE,
     .parent = TYPE_MUSCA_MACHINE,
     .class_init = musca_a_class_init,
 };
+TYPE_INFO(musca_a_info)
 
 static const TypeInfo musca_b1_info = {
     .name = TYPE_MUSCA_B1_MACHINE,
     .parent = TYPE_MUSCA_MACHINE,
     .class_init = musca_b1_class_init,
 };
+TYPE_INFO(musca_b1_info)
 
-static void musca_machine_init(void)
-{
-    type_register_static(&musca_info);
-    type_register_static(&musca_a_info);
-    type_register_static(&musca_b1_info);
-}
 
-type_init(musca_machine_init);
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index c3b9780f35..9decd7abd1 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -447,6 +447,7 @@ static const TypeInfo mv88w8618_eth_info = {
     .instance_init = mv88w8618_eth_init,
     .class_init    = mv88w8618_eth_class_init,
 };
+TYPE_INFO(mv88w8618_eth_info)
 
 /* LCD register offsets */
 #define MP_LCD_IRQCTRL          0x180
@@ -678,6 +679,7 @@ static const TypeInfo musicpal_lcd_info = {
     .instance_init = musicpal_lcd_init,
     .class_init    = musicpal_lcd_class_init,
 };
+TYPE_INFO(musicpal_lcd_info)
 
 /* PIC register offsets */
 #define MP_PIC_STATUS           0x00
@@ -800,6 +802,7 @@ static const TypeInfo mv88w8618_pic_info = {
     .instance_init = mv88w8618_pic_init,
     .class_init    = mv88w8618_pic_class_init,
 };
+TYPE_INFO(mv88w8618_pic_info)
 
 /* PIT register offsets */
 #define MP_PIT_TIMER1_LENGTH    0x00
@@ -984,6 +987,7 @@ static const TypeInfo mv88w8618_pit_info = {
     .instance_init = mv88w8618_pit_init,
     .class_init    = mv88w8618_pit_class_init,
 };
+TYPE_INFO(mv88w8618_pit_info)
 
 /* Flash config register offsets */
 #define MP_FLASHCFG_CFGR0    0x04
@@ -1069,6 +1073,7 @@ static const TypeInfo mv88w8618_flashcfg_info = {
     .instance_init = mv88w8618_flashcfg_init,
     .class_init    = mv88w8618_flashcfg_class_init,
 };
+TYPE_INFO(mv88w8618_flashcfg_info)
 
 /* Misc register offsets */
 #define MP_MISC_BOARD_REVISION  0x18
@@ -1123,6 +1128,7 @@ static const TypeInfo musicpal_misc_info = {
     .instance_init = musicpal_misc_init,
     .instance_size = sizeof(MusicPalMiscState),
 };
+TYPE_INFO(musicpal_misc_info)
 
 /* WLAN register offsets */
 #define MP_WLAN_MAGIC1          0x11c
@@ -1411,6 +1417,7 @@ static const TypeInfo musicpal_gpio_info = {
     .instance_init = musicpal_gpio_init,
     .class_init    = musicpal_gpio_class_init,
 };
+TYPE_INFO(musicpal_gpio_info)
 
 /* Keyboard codes & masks */
 #define KEY_RELEASED            0x80
@@ -1570,6 +1577,7 @@ static const TypeInfo musicpal_key_info = {
     .instance_init = musicpal_key_init,
     .class_init    = musicpal_key_class_init,
 };
+TYPE_INFO(musicpal_key_info)
 
 static struct arm_boot_info musicpal_binfo = {
     .loader_start = 0x0,
@@ -1725,18 +1733,6 @@ static const TypeInfo mv88w8618_wlan_info = {
     .instance_size = sizeof(SysBusDevice),
     .class_init    = mv88w8618_wlan_class_init,
 };
+TYPE_INFO(mv88w8618_wlan_info)
 
-static void musicpal_register_types(void)
-{
-    type_register_static(&mv88w8618_pic_info);
-    type_register_static(&mv88w8618_pit_info);
-    type_register_static(&mv88w8618_flashcfg_info);
-    type_register_static(&mv88w8618_eth_info);
-    type_register_static(&mv88w8618_wlan_info);
-    type_register_static(&musicpal_lcd_info);
-    type_register_static(&musicpal_gpio_info);
-    type_register_static(&musicpal_key_info);
-    type_register_static(&musicpal_misc_info);
-}
 
-type_init(musicpal_register_types)
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index e15981e019..aabb59330c 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -219,9 +219,5 @@ static const TypeInfo nrf51_soc_info = {
     .instance_init = nrf51_soc_init,
     .class_init    = nrf51_soc_class_init,
 };
+TYPE_INFO(nrf51_soc_info)
 
-static void nrf51_soc_types(void)
-{
-    type_register_static(&nrf51_soc_info);
-}
-type_init(nrf51_soc_types)
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index e48092ca04..08e7a604c0 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1441,6 +1441,7 @@ static const TypeInfo n800_type = {
     .parent = TYPE_MACHINE,
     .class_init = n800_class_init,
 };
+TYPE_INFO(n800_type)
 
 static void n810_class_init(ObjectClass *oc, void *data)
 {
@@ -1461,11 +1462,6 @@ static const TypeInfo n810_type = {
     .parent = TYPE_MACHINE,
     .class_init = n810_class_init,
 };
+TYPE_INFO(n810_type)
 
-static void nseries_machine_init(void)
-{
-    type_register_static(&n800_type);
-    type_register_static(&n810_type);
-}
 
-type_init(nseries_machine_init)
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 57829b3744..f453c18067 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -229,6 +229,7 @@ static const TypeInfo sx1_machine_v2_type = {
     .parent = TYPE_MACHINE,
     .class_init = sx1_machine_v2_class_init,
 };
+TYPE_INFO(sx1_machine_v2_type)
 
 static void sx1_machine_v1_class_init(ObjectClass *oc, void *data)
 {
@@ -247,11 +248,6 @@ static const TypeInfo sx1_machine_v1_type = {
     .parent = TYPE_MACHINE,
     .class_init = sx1_machine_v1_class_init,
 };
+TYPE_INFO(sx1_machine_v1_type)
 
-static void sx1_machine_init(void)
-{
-    type_register_static(&sx1_machine_v1_type);
-    type_register_static(&sx1_machine_v2_type);
-}
 
-type_init(sx1_machine_init)
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index e7bc9ea4c6..7980d321ee 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -183,6 +183,7 @@ static const TypeInfo palm_misc_gpio_info = {
      * need to set up reset or vmstate, and has no realize method.
      */
 };
+TYPE_INFO(palm_misc_gpio_info)
 
 static void palmte_gpio_setup(struct omap_mpu_state_s *cpu)
 {
@@ -313,9 +314,4 @@ static void palmte_machine_init(MachineClass *mc)
 
 DEFINE_MACHINE("cheetah", palmte_machine_init)
 
-static void palm_register_types(void)
-{
-    type_register_static(&palm_misc_gpio_info);
-}
 
-type_init(palm_register_types)
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 76975d17a4..6bc8ff93d3 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1238,6 +1238,7 @@ static const TypeInfo pxa2xx_rtc_sysbus_info = {
     .instance_init = pxa2xx_rtc_init,
     .class_init    = pxa2xx_rtc_sysbus_class_init,
 };
+TYPE_INFO(pxa2xx_rtc_sysbus_info)
 
 /* I2C Interface */
 
@@ -1498,6 +1499,7 @@ static const TypeInfo pxa2xx_i2c_slave_info = {
     .instance_size = sizeof(PXA2xxI2CSlaveState),
     .class_init    = pxa2xx_i2c_slave_class_init,
 };
+TYPE_INFO(pxa2xx_i2c_slave_info)
 
 PXA2xxI2CState *pxa2xx_i2c_init(hwaddr base,
                 qemu_irq irq, uint32_t region_size)
@@ -1568,6 +1570,7 @@ static const TypeInfo pxa2xx_i2c_info = {
     .instance_init = pxa2xx_i2c_initfn,
     .class_init    = pxa2xx_i2c_class_init,
 };
+TYPE_INFO(pxa2xx_i2c_info)
 
 /* PXA Inter-IC Sound Controller */
 static void pxa2xx_i2s_reset(PXA2xxI2SState *i2s)
@@ -2058,6 +2061,7 @@ static const TypeInfo pxa2xx_fir_info = {
     .class_init = pxa2xx_fir_class_init,
     .instance_init = pxa2xx_fir_instance_init,
 };
+TYPE_INFO(pxa2xx_fir_info)
 
 static PXA2xxFIrState *pxa2xx_fir_init(MemoryRegion *sysmem,
                                        hwaddr base,
@@ -2372,14 +2376,6 @@ static const TypeInfo pxa2xx_ssp_info = {
     .instance_init = pxa2xx_ssp_init,
     .class_init    = pxa2xx_ssp_class_init,
 };
+TYPE_INFO(pxa2xx_ssp_info)
 
-static void pxa2xx_register_types(void)
-{
-    type_register_static(&pxa2xx_i2c_slave_info);
-    type_register_static(&pxa2xx_ssp_info);
-    type_register_static(&pxa2xx_i2c_info);
-    type_register_static(&pxa2xx_rtc_sysbus_info);
-    type_register_static(&pxa2xx_fir_info);
-}
 
-type_init(pxa2xx_register_types)
diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
index d6d0d0b08e..a0f3592f17 100644
--- a/hw/arm/pxa2xx_gpio.c
+++ b/hw/arm/pxa2xx_gpio.c
@@ -361,10 +361,6 @@ static const TypeInfo pxa2xx_gpio_info = {
     .instance_init = pxa2xx_gpio_initfn,
     .class_init    = pxa2xx_gpio_class_init,
 };
+TYPE_INFO(pxa2xx_gpio_info)
 
-static void pxa2xx_gpio_register_types(void)
-{
-    type_register_static(&pxa2xx_gpio_info);
-}
 
-type_init(pxa2xx_gpio_register_types)
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index ceee6aa48d..bfc0dd8df6 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -330,10 +330,6 @@ static const TypeInfo pxa2xx_pic_info = {
     .instance_size = sizeof(PXA2xxPICState),
     .class_init    = pxa2xx_pic_class_init,
 };
+TYPE_INFO(pxa2xx_pic_info)
 
-static void pxa2xx_pic_register_types(void)
-{
-    type_register_static(&pxa2xx_pic_info);
-}
 
-type_init(pxa2xx_pic_register_types)
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 5f1f36b15c..ed02727ec4 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -406,6 +406,7 @@ static const TypeInfo realview_eb_type = {
     .parent = TYPE_MACHINE,
     .class_init = realview_eb_class_init,
 };
+TYPE_INFO(realview_eb_type)
 
 static void realview_eb_mpcore_class_init(ObjectClass *oc, void *data)
 {
@@ -424,6 +425,7 @@ static const TypeInfo realview_eb_mpcore_type = {
     .parent = TYPE_MACHINE,
     .class_init = realview_eb_mpcore_class_init,
 };
+TYPE_INFO(realview_eb_mpcore_type)
 
 static void realview_pb_a8_class_init(ObjectClass *oc, void *data)
 {
@@ -440,6 +442,7 @@ static const TypeInfo realview_pb_a8_type = {
     .parent = TYPE_MACHINE,
     .class_init = realview_pb_a8_class_init,
 };
+TYPE_INFO(realview_pb_a8_type)
 
 static void realview_pbx_a9_class_init(ObjectClass *oc, void *data)
 {
@@ -457,13 +460,6 @@ static const TypeInfo realview_pbx_a9_type = {
     .parent = TYPE_MACHINE,
     .class_init = realview_pbx_a9_class_init,
 };
+TYPE_INFO(realview_pbx_a9_type)
 
-static void realview_machine_init(void)
-{
-    type_register_static(&realview_eb_type);
-    type_register_static(&realview_eb_mpcore_type);
-    type_register_static(&realview_pb_a8_type);
-    type_register_static(&realview_pbx_a9_type);
-}
 
-type_init(realview_machine_init)
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f030a416fd..e6715ab638 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -797,10 +797,6 @@ static const TypeInfo sbsa_ref_info = {
     .class_init    = sbsa_ref_class_init,
     .instance_size = sizeof(SBSAMachineState),
 };
+TYPE_INFO(sbsa_ref_info)
 
-static void sbsa_ref_machine_init(void)
-{
-    type_register_static(&sbsa_ref_info);
-}
 
-type_init(sbsa_ref_machine_init);
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 3838db1395..d4c53e8704 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -553,11 +553,7 @@ static const TypeInfo smmu_base_info = {
     .class_init    = smmu_base_class_init,
     .abstract      = true,
 };
+TYPE_INFO(smmu_base_info)
 
-static void smmu_base_register_types(void)
-{
-    type_register_static(&smmu_base_info);
-}
 
-type_init(smmu_base_register_types)
 
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 7ac8254aa6..9c762ecedd 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -1055,6 +1055,7 @@ static const TypeInfo spitz_common_info = {
     .class_size = sizeof(SpitzMachineClass),
     .class_init = spitz_common_class_init,
 };
+TYPE_INFO(spitz_common_info)
 
 static void akitapda_class_init(ObjectClass *oc, void *data)
 {
@@ -1072,6 +1073,7 @@ static const TypeInfo akitapda_type = {
     .parent = TYPE_SPITZ_MACHINE,
     .class_init = akitapda_class_init,
 };
+TYPE_INFO(akitapda_type)
 
 static void spitzpda_class_init(ObjectClass *oc, void *data)
 {
@@ -1089,6 +1091,7 @@ static const TypeInfo spitzpda_type = {
     .parent = TYPE_SPITZ_MACHINE,
     .class_init = spitzpda_class_init,
 };
+TYPE_INFO(spitzpda_type)
 
 static void borzoipda_class_init(ObjectClass *oc, void *data)
 {
@@ -1106,6 +1109,7 @@ static const TypeInfo borzoipda_type = {
     .parent = TYPE_SPITZ_MACHINE,
     .class_init = borzoipda_class_init,
 };
+TYPE_INFO(borzoipda_type)
 
 static void terrierpda_class_init(ObjectClass *oc, void *data)
 {
@@ -1123,17 +1127,9 @@ static const TypeInfo terrierpda_type = {
     .parent = TYPE_SPITZ_MACHINE,
     .class_init = terrierpda_class_init,
 };
+TYPE_INFO(terrierpda_type)
 
-static void spitz_machine_init(void)
-{
-    type_register_static(&spitz_common_info);
-    type_register_static(&akitapda_type);
-    type_register_static(&spitzpda_type);
-    type_register_static(&borzoipda_type);
-    type_register_static(&terrierpda_type);
-}
 
-type_init(spitz_machine_init)
 
 static bool is_version_0(void *opaque, int version_id)
 {
@@ -1175,6 +1171,7 @@ static const TypeInfo sl_nand_info = {
     .instance_init = sl_nand_init,
     .class_init    = sl_nand_class_init,
 };
+TYPE_INFO(sl_nand_info)
 
 static VMStateDescription vmstate_spitz_kbd = {
     .name = "spitz-keyboard",
@@ -1204,6 +1201,7 @@ static const TypeInfo spitz_keyboard_info = {
     .instance_init = spitz_keyboard_init,
     .class_init    = spitz_keyboard_class_init,
 };
+TYPE_INFO(spitz_keyboard_info)
 
 static const VMStateDescription vmstate_corgi_ssp_regs = {
     .name = "corgi-ssp",
@@ -1232,6 +1230,7 @@ static const TypeInfo corgi_ssp_info = {
     .instance_size = sizeof(CorgiSSPState),
     .class_init    = corgi_ssp_class_init,
 };
+TYPE_INFO(corgi_ssp_info)
 
 static const VMStateDescription vmstate_spitz_lcdtg_regs = {
     .name = "spitz-lcdtg",
@@ -1261,6 +1260,7 @@ static const TypeInfo spitz_lcdtg_info = {
     .instance_size = sizeof(SpitzLCDTG),
     .class_init    = spitz_lcdtg_class_init,
 };
+TYPE_INFO(spitz_lcdtg_info)
 
 static const TypeInfo spitz_misc_gpio_info = {
     .name = TYPE_SPITZ_MISC_GPIO,
@@ -1272,14 +1272,6 @@ static const TypeInfo spitz_misc_gpio_info = {
      * need to set up reset or vmstate, and does not have a realize method.
      */
 };
+TYPE_INFO(spitz_misc_gpio_info)
 
-static void spitz_register_types(void)
-{
-    type_register_static(&corgi_ssp_info);
-    type_register_static(&spitz_lcdtg_info);
-    type_register_static(&spitz_keyboard_info);
-    type_register_static(&sl_nand_info);
-    type_register_static(&spitz_misc_gpio_info);
-}
 
-type_init(spitz_register_types)
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 5f9d080180..0bf2be0e27 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1482,6 +1482,7 @@ static const TypeInfo lm3s811evb_type = {
     .parent = TYPE_MACHINE,
     .class_init = lm3s811evb_class_init,
 };
+TYPE_INFO(lm3s811evb_type)
 
 static void lm3s6965evb_class_init(ObjectClass *oc, void *data)
 {
@@ -1498,14 +1499,9 @@ static const TypeInfo lm3s6965evb_type = {
     .parent = TYPE_MACHINE,
     .class_init = lm3s6965evb_class_init,
 };
+TYPE_INFO(lm3s6965evb_type)
 
-static void stellaris_machine_init(void)
-{
-    type_register_static(&lm3s811evb_type);
-    type_register_static(&lm3s6965evb_type);
-}
 
-type_init(stellaris_machine_init)
 
 static void stellaris_i2c_class_init(ObjectClass *klass, void *data)
 {
@@ -1521,6 +1517,7 @@ static const TypeInfo stellaris_i2c_info = {
     .instance_init = stellaris_i2c_init,
     .class_init    = stellaris_i2c_class_init,
 };
+TYPE_INFO(stellaris_i2c_info)
 
 static void stellaris_gptm_class_init(ObjectClass *klass, void *data)
 {
@@ -1537,6 +1534,7 @@ static const TypeInfo stellaris_gptm_info = {
     .instance_init = stellaris_gptm_init,
     .class_init    = stellaris_gptm_class_init,
 };
+TYPE_INFO(stellaris_gptm_info)
 
 static void stellaris_adc_class_init(ObjectClass *klass, void *data)
 {
@@ -1552,12 +1550,6 @@ static const TypeInfo stellaris_adc_info = {
     .instance_init = stellaris_adc_init,
     .class_init    = stellaris_adc_class_init,
 };
+TYPE_INFO(stellaris_adc_info)
 
-static void stellaris_register_types(void)
-{
-    type_register_static(&stellaris_i2c_info);
-    type_register_static(&stellaris_gptm_info);
-    type_register_static(&stellaris_adc_info);
-}
 
-type_init(stellaris_register_types)
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index a4f3344db2..38d2ea8b77 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -195,10 +195,6 @@ static const TypeInfo stm32f205_soc_info = {
     .instance_init = stm32f205_soc_initfn,
     .class_init    = stm32f205_soc_class_init,
 };
+TYPE_INFO(stm32f205_soc_info)
 
-static void stm32f205_soc_types(void)
-{
-    type_register_static(&stm32f205_soc_info);
-}
 
-type_init(stm32f205_soc_types)
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index cb04c11198..e24ff4c472 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -271,10 +271,6 @@ static const TypeInfo stm32f405_soc_info = {
     .instance_init = stm32f405_soc_initfn,
     .class_init    = stm32f405_soc_class_init,
 };
+TYPE_INFO(stm32f405_soc_info)
 
-static void stm32f405_soc_types(void)
-{
-    type_register_static(&stm32f405_soc_info);
-}
 
-type_init(stm32f405_soc_types)
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 2639b9ae55..5c1fb66b98 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -235,6 +235,7 @@ static const TypeInfo strongarm_pic_info = {
     .instance_init = strongarm_pic_initfn,
     .class_init    = strongarm_pic_class_init,
 };
+TYPE_INFO(strongarm_pic_info)
 
 /* Real-Time Clock */
 #define RTAR 0x00 /* RTC Alarm register */
@@ -466,6 +467,7 @@ static const TypeInfo strongarm_rtc_sysbus_info = {
     .instance_init = strongarm_rtc_init,
     .class_init    = strongarm_rtc_sysbus_class_init,
 };
+TYPE_INFO(strongarm_rtc_sysbus_info)
 
 /* GPIO */
 #define GPLR 0x00
@@ -708,6 +710,7 @@ static const TypeInfo strongarm_gpio_info = {
     .instance_init = strongarm_gpio_initfn,
     .class_init    = strongarm_gpio_class_init,
 };
+TYPE_INFO(strongarm_gpio_info)
 
 /* Peripheral Pin Controller */
 #define PPDR 0x00
@@ -878,6 +881,7 @@ static const TypeInfo strongarm_ppc_info = {
     .instance_init = strongarm_ppc_init,
     .class_init    = strongarm_ppc_class_init,
 };
+TYPE_INFO(strongarm_ppc_info)
 
 /* UART Ports */
 #define UTCR0 0x00
@@ -1345,6 +1349,7 @@ static const TypeInfo strongarm_uart_info = {
     .instance_init = strongarm_uart_init,
     .class_init    = strongarm_uart_class_init,
 };
+TYPE_INFO(strongarm_uart_info)
 
 /* Synchronous Serial Ports */
 
@@ -1591,6 +1596,7 @@ static const TypeInfo strongarm_ssp_info = {
     .instance_init = strongarm_ssp_init,
     .class_init    = strongarm_ssp_class_init,
 };
+TYPE_INFO(strongarm_ssp_info)
 
 /* Main CPU functions */
 StrongARMState *sa1110_init(const char *cpu_type)
@@ -1643,14 +1649,4 @@ StrongARMState *sa1110_init(const char *cpu_type)
     return s;
 }
 
-static void strongarm_register_types(void)
-{
-    type_register_static(&strongarm_pic_info);
-    type_register_static(&strongarm_rtc_sysbus_info);
-    type_register_static(&strongarm_gpio_info);
-    type_register_static(&strongarm_ppc_info);
-    type_register_static(&strongarm_uart_info);
-    type_register_static(&strongarm_ssp_info);
-}
 
-type_init(strongarm_register_types)
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index e29566f7b3..86a1a21adf 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -299,6 +299,7 @@ static const TypeInfo tosa_dac_info = {
     .instance_size = sizeof(TosaDACState),
     .class_init    = tosa_dac_class_init,
 };
+TYPE_INFO(tosa_dac_info)
 
 static void tosa_ssp_class_init(ObjectClass *klass, void *data)
 {
@@ -314,6 +315,7 @@ static const TypeInfo tosa_ssp_info = {
     .instance_size = sizeof(SSISlave),
     .class_init    = tosa_ssp_class_init,
 };
+TYPE_INFO(tosa_ssp_info)
 
 static const TypeInfo tosa_misc_gpio_info = {
     .name          = "tosa-misc-gpio",
@@ -325,12 +327,6 @@ static const TypeInfo tosa_misc_gpio_info = {
      * need to set up reset or vmstate, and has no realize method.
      */
 };
+TYPE_INFO(tosa_misc_gpio_info)
 
-static void tosa_register_types(void)
-{
-    type_register_static(&tosa_dac_info);
-    type_register_static(&tosa_ssp_info);
-    type_register_static(&tosa_misc_gpio_info);
-}
 
-type_init(tosa_register_types)
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 9127579984..312a8d3c4b 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -426,6 +426,7 @@ static const TypeInfo versatilepb_type = {
     .parent = TYPE_MACHINE,
     .class_init = versatilepb_class_init,
 };
+TYPE_INFO(versatilepb_type)
 
 static void versatileab_class_init(ObjectClass *oc, void *data)
 {
@@ -444,14 +445,9 @@ static const TypeInfo versatileab_type = {
     .parent = TYPE_MACHINE,
     .class_init = versatileab_class_init,
 };
+TYPE_INFO(versatileab_type)
 
-static void versatile_machine_init(void)
-{
-    type_register_static(&versatilepb_type);
-    type_register_static(&versatileab_type);
-}
 
-type_init(versatile_machine_init)
 
 static void vpb_sic_class_init(ObjectClass *klass, void *data)
 {
@@ -467,10 +463,6 @@ static const TypeInfo vpb_sic_info = {
     .instance_init = vpb_sic_init,
     .class_init    = vpb_sic_class_init,
 };
+TYPE_INFO(vpb_sic_info)
 
-static void versatilepb_register_types(void)
-{
-    type_register_static(&vpb_sic_info);
-}
 
-type_init(versatilepb_register_types)
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 95405f5940..4a71c9fa6e 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -833,6 +833,7 @@ static const TypeInfo vexpress_info = {
     .class_size = sizeof(VexpressMachineClass),
     .class_init = vexpress_class_init,
 };
+TYPE_INFO(vexpress_info)
 
 static const TypeInfo vexpress_a9_info = {
     .name = TYPE_VEXPRESS_A9_MACHINE,
@@ -840,6 +841,7 @@ static const TypeInfo vexpress_a9_info = {
     .class_init = vexpress_a9_class_init,
     .instance_init = vexpress_a9_instance_init,
 };
+TYPE_INFO(vexpress_a9_info)
 
 static const TypeInfo vexpress_a15_info = {
     .name = TYPE_VEXPRESS_A15_MACHINE,
@@ -847,12 +849,6 @@ static const TypeInfo vexpress_a15_info = {
     .class_init = vexpress_a15_class_init,
     .instance_init = vexpress_a15_instance_init,
 };
+TYPE_INFO(vexpress_a15_info)
 
-static void vexpress_machine_init(void)
-{
-    type_register_static(&vexpress_info);
-    type_register_static(&vexpress_a9_info);
-    type_register_static(&vexpress_a15_info);
-}
 
-type_init(vexpress_machine_init);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index acf9bfbece..e8995e71e9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2539,12 +2539,8 @@ static const TypeInfo virt_machine_info = {
          { }
     },
 };
+TYPE_INFO(virt_machine_info)
 
-static void machvirt_machine_init(void)
-{
-    type_register_static(&virt_machine_info);
-}
-type_init(machvirt_machine_init);
 
 static void virt_machine_5_2_options(MachineClass *mc)
 {
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 32aa7323d9..0ba9e8c708 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -355,10 +355,6 @@ static const TypeInfo zynq_machine_type = {
     .class_init = zynq_machine_class_init,
     .instance_size = sizeof(ZynqMachineState),
 };
+TYPE_INFO(zynq_machine_type)
 
-static void zynq_machine_register_types(void)
-{
-    type_register_static(&zynq_machine_type);
-}
 
-type_init(zynq_machine_register_types)
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 4b3152ee77..f55295a816 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -574,11 +574,7 @@ static const TypeInfo versal_virt_machine_init_typeinfo = {
     .instance_init = versal_virt_machine_instance_init,
     .instance_size = sizeof(VersalVirt),
 };
+TYPE_INFO(versal_virt_machine_init_typeinfo)
 
-static void versal_virt_machine_init_register_types(void)
-{
-    type_register_static(&versal_virt_machine_init_typeinfo);
-}
 
-type_init(versal_virt_machine_init_register_types)
 
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index e3aa4bd1e5..7f3bc84962 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -378,10 +378,6 @@ static const TypeInfo versal_info = {
     .instance_init = versal_init,
     .class_init = versal_class_init,
 };
+TYPE_INFO(versal_info)
 
-static void versal_register_types(void)
-{
-    type_register_static(&versal_info);
-}
 
-type_init(versal_register_types);
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 5997262459..6d1f38a99c 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -244,10 +244,6 @@ static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
     .instance_init = xlnx_zcu102_machine_instance_init,
     .instance_size = sizeof(XlnxZCU102),
 };
+TYPE_INFO(xlnx_zcu102_machine_init_typeinfo)
 
-static void xlnx_zcu102_machine_init_register_types(void)
-{
-    type_register_static(&xlnx_zcu102_machine_init_typeinfo);
-}
 
-type_init(xlnx_zcu102_machine_init_register_types)
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index c435b9d52a..9448e71059 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -637,10 +637,6 @@ static const TypeInfo xlnx_zynqmp_type_info = {
     .instance_init = xlnx_zynqmp_init,
     .class_init = xlnx_zynqmp_class_init,
 };
+TYPE_INFO(xlnx_zynqmp_type_info)
 
-static void xlnx_zynqmp_register_types(void)
-{
-    type_register_static(&xlnx_zynqmp_type_info);
-}
 
-type_init(xlnx_zynqmp_register_types)
diff --git a/hw/audio/cs4231.c b/hw/audio/cs4231.c
index 11a6328fc2..2f8f75845e 100644
--- a/hw/audio/cs4231.c
+++ b/hw/audio/cs4231.c
@@ -178,10 +178,6 @@ static const TypeInfo cs4231_info = {
     .instance_init = cs4231_init,
     .class_init    = cs4231_class_init,
 };
+TYPE_INFO(cs4231_info)
 
-static void cs4231_register_types(void)
-{
-    type_register_static(&cs4231_info);
-}
 
-type_init(cs4231_register_types)
diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index cbd92b72f2..b6ea5b3b75 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -901,6 +901,7 @@ static const TypeInfo hda_audio_info = {
     .class_init    = hda_audio_base_class_init,
     .abstract      = true,
 };
+TYPE_INFO(hda_audio_info)
 
 static void hda_audio_output_class_init(ObjectClass *klass, void *data)
 {
@@ -917,6 +918,7 @@ static const TypeInfo hda_audio_output_info = {
     .instance_size = sizeof(HDAAudioState),
     .class_init    = hda_audio_output_class_init,
 };
+TYPE_INFO(hda_audio_output_info)
 
 static void hda_audio_duplex_class_init(ObjectClass *klass, void *data)
 {
@@ -933,6 +935,7 @@ static const TypeInfo hda_audio_duplex_info = {
     .instance_size = sizeof(HDAAudioState),
     .class_init    = hda_audio_duplex_class_init,
 };
+TYPE_INFO(hda_audio_duplex_info)
 
 static void hda_audio_micro_class_init(ObjectClass *klass, void *data)
 {
@@ -949,13 +952,6 @@ static const TypeInfo hda_audio_micro_info = {
     .instance_size = sizeof(HDAAudioState),
     .class_init    = hda_audio_micro_class_init,
 };
+TYPE_INFO(hda_audio_micro_info)
 
-static void hda_audio_register_types(void)
-{
-    type_register_static(&hda_audio_info);
-    type_register_static(&hda_audio_output_info);
-    type_register_static(&hda_audio_duplex_info);
-    type_register_static(&hda_audio_micro_info);
-}
 
-type_init(hda_audio_register_types)
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index f6cea49686..ceae0b33af 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -46,6 +46,7 @@ static const TypeInfo hda_codec_bus_info = {
     .parent = TYPE_BUS,
     .instance_size = sizeof(HDACodecBus),
 };
+TYPE_INFO(hda_codec_bus_info)
 
 void hda_codec_bus_init(DeviceState *dev, HDACodecBus *bus, size_t bus_size,
                         hda_codec_response_func response,
@@ -1266,18 +1267,21 @@ static const TypeInfo intel_hda_info = {
         { },
     },
 };
+TYPE_INFO(intel_hda_info)
 
 static const TypeInfo intel_hda_info_ich6 = {
     .name          = "intel-hda",
     .parent        = TYPE_INTEL_HDA_GENERIC,
     .class_init    = intel_hda_class_init_ich6,
 };
+TYPE_INFO(intel_hda_info_ich6)
 
 static const TypeInfo intel_hda_info_ich9 = {
     .name          = "ich9-intel-hda",
     .parent        = TYPE_INTEL_HDA_GENERIC,
     .class_init    = intel_hda_class_init_ich9,
 };
+TYPE_INFO(intel_hda_info_ich9)
 
 static void hda_codec_device_class_init(ObjectClass *klass, void *data)
 {
@@ -1297,6 +1301,7 @@ static const TypeInfo hda_codec_device_type_info = {
     .class_size = sizeof(HDACodecDeviceClass),
     .class_init = hda_codec_device_class_init,
 };
+TYPE_INFO(hda_codec_device_type_info)
 
 /*
  * create intel hda controller with codec attached to it,
@@ -1319,11 +1324,6 @@ static int intel_hda_and_codec_init(PCIBus *bus)
 
 static void intel_hda_register_types(void)
 {
-    type_register_static(&hda_codec_bus_info);
-    type_register_static(&intel_hda_info);
-    type_register_static(&intel_hda_info_ich6);
-    type_register_static(&intel_hda_info_ich9);
-    type_register_static(&hda_codec_device_type_info);
     pci_register_soundhw("hda", "Intel HD Audio", intel_hda_and_codec_init);
 }
 
diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index 8dfacec693..1dcee64ef0 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -304,10 +304,6 @@ static const TypeInfo mv88w8618_audio_info = {
     .instance_init = mv88w8618_audio_init,
     .class_init    = mv88w8618_audio_class_init,
 };
+TYPE_INFO(mv88w8618_audio_info)
 
-static void mv88w8618_register_types(void)
-{
-    type_register_static(&mv88w8618_audio_info);
-}
 
-type_init(mv88w8618_register_types)
diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c
index 0fa38adbe2..051dc3bfad 100644
--- a/hw/audio/milkymist-ac97.c
+++ b/hw/audio/milkymist-ac97.c
@@ -352,10 +352,6 @@ static const TypeInfo milkymist_ac97_info = {
     .instance_init = milkymist_ac97_init,
     .class_init    = milkymist_ac97_class_init,
 };
+TYPE_INFO(milkymist_ac97_info)
 
-static void milkymist_ac97_register_types(void)
-{
-    type_register_static(&milkymist_ac97_info);
-}
 
-type_init(milkymist_ac97_register_types)
diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index ea539e7605..ed7730fc18 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -244,6 +244,7 @@ static const TypeInfo pcspk_info = {
     .instance_init  = pcspk_initfn,
     .class_init     = pcspk_class_initfn,
 };
+TYPE_INFO(pcspk_info)
 
 static int pcspk_audio_init_soundhw(ISABus *bus)
 {
@@ -256,7 +257,6 @@ static int pcspk_audio_init_soundhw(ISABus *bus)
 
 static void pcspk_register(void)
 {
-    type_register_static(&pcspk_info);
     isa_register_soundhw("pcspk", "PC speaker", pcspk_audio_init_soundhw);
 }
 type_init(pcspk_register)
diff --git a/hw/audio/pl041.c b/hw/audio/pl041.c
index c3d3eab6ed..96748cb15a 100644
--- a/hw/audio/pl041.c
+++ b/hw/audio/pl041.c
@@ -650,10 +650,6 @@ static const TypeInfo pl041_device_info = {
     .instance_init = pl041_init,
     .class_init    = pl041_device_class_init,
 };
+TYPE_INFO(pl041_device_info)
 
-static void pl041_register_types(void)
-{
-    type_register_static(&pl041_device_info);
-}
 
-type_init(pl041_register_types)
diff --git a/hw/audio/wm8750.c b/hw/audio/wm8750.c
index 92b2902a10..d867442d29 100644
--- a/hw/audio/wm8750.c
+++ b/hw/audio/wm8750.c
@@ -726,10 +726,6 @@ static const TypeInfo wm8750_info = {
     .instance_size = sizeof(WM8750State),
     .class_init    = wm8750_class_init,
 };
+TYPE_INFO(wm8750_info)
 
-static void wm8750_register_types(void)
-{
-    type_register_static(&wm8750_info);
-}
 
-type_init(wm8750_register_types)
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index e9ed3eef45..5e7013a752 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -80,6 +80,7 @@ static const TypeInfo floppy_bus_info = {
     .parent = TYPE_BUS,
     .instance_size = sizeof(FloppyBus),
 };
+TYPE_INFO(floppy_bus_info)
 
 static void floppy_bus_create(FDCtrl *fdc, FloppyBus *bus, DeviceState *dev)
 {
@@ -620,6 +621,7 @@ static const TypeInfo floppy_drive_info = {
     .instance_size = sizeof(FloppyDrive),
     .class_init = floppy_drive_class_init,
 };
+TYPE_INFO(floppy_drive_info)
 
 /********************************************************/
 /* Intel 82078 floppy disk controller emulation          */
@@ -2940,6 +2942,7 @@ static const TypeInfo isa_fdc_info = {
     .class_init    = isabus_fdc_class_init,
     .instance_init = isabus_fdc_instance_init,
 };
+TYPE_INFO(isa_fdc_info)
 
 static const VMStateDescription vmstate_sysbus_fdc ={
     .name = "fdc",
@@ -2980,6 +2983,7 @@ static const TypeInfo sysbus_fdc_info = {
     .instance_init = sysbus_fdc_initfn,
     .class_init    = sysbus_fdc_class_init,
 };
+TYPE_INFO(sysbus_fdc_info)
 
 static Property sun4m_fdc_properties[] = {
     DEFINE_PROP_DRIVE("drive", FDCtrlSysBus, state.qdev_for_drives[0].blk),
@@ -3006,6 +3010,7 @@ static const TypeInfo sun4m_fdc_info = {
     .instance_init = sun4m_fdc_initfn,
     .class_init    = sun4m_fdc_class_init,
 };
+TYPE_INFO(sun4m_fdc_info)
 
 static void sysbus_fdc_common_class_init(ObjectClass *klass, void *data)
 {
@@ -3024,15 +3029,6 @@ static const TypeInfo sysbus_fdc_type_info = {
     .abstract      = true,
     .class_init    = sysbus_fdc_common_class_init,
 };
+TYPE_INFO(sysbus_fdc_type_info)
 
-static void fdc_register_types(void)
-{
-    type_register_static(&isa_fdc_info);
-    type_register_static(&sysbus_fdc_type_info);
-    type_register_static(&sysbus_fdc_info);
-    type_register_static(&sun4m_fdc_info);
-    type_register_static(&floppy_bus_info);
-    type_register_static(&floppy_drive_info);
-}
 
-type_init(fdc_register_types)
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 8227088441..7f9492eee6 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1407,12 +1407,12 @@ static const TypeInfo m25p80_info = {
     .class_size     = sizeof(M25P80Class),
     .abstract       = true,
 };
+TYPE_INFO(m25p80_info)
 
 static void m25p80_register_types(void)
 {
     int i;
 
-    type_register_static(&m25p80_info);
     for (i = 0; i < ARRAY_SIZE(known_devices); ++i) {
         TypeInfo ti = {
             .name       = known_devices[i].part_name,
diff --git a/hw/block/nand.c b/hw/block/nand.c
index 654e0cb5d1..991a6e13e8 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -457,11 +457,8 @@ static const TypeInfo nand_info = {
     .instance_size = sizeof(NANDFlashState),
     .class_init    = nand_class_init,
 };
+TYPE_INFO(nand_info)
 
-static void nand_register_types(void)
-{
-    type_register_static(&nand_info);
-}
 
 /*
  * Chip inputs are CLE, ALE, CE, WP, GND and eight I/O pins.  Chip
@@ -655,7 +652,6 @@ DeviceState *nand_init(BlockBackend *blk, int manf_id, int chip_id)
     return dev;
 }
 
-type_init(nand_register_types)
 
 #else
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 3426e17e65..a8fe997626 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1697,10 +1697,6 @@ static const TypeInfo nvme_info = {
         { }
     },
 };
+TYPE_INFO(nvme_info)
 
-static void nvme_register_types(void)
-{
-    type_register_static(&nvme_info);
-}
 
-type_init(nvme_register_types)
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 898ac563a3..d2c4e140e9 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -854,11 +854,8 @@ static const TypeInfo onenand_info = {
     .instance_size = sizeof(OneNANDState),
     .class_init    = onenand_class_init,
 };
+TYPE_INFO(onenand_info)
 
-static void onenand_register_types(void)
-{
-    type_register_static(&onenand_info);
-}
 
 void *onenand_raw_otp(DeviceState *onenand_device)
 {
@@ -867,4 +864,3 @@ void *onenand_raw_otp(DeviceState *onenand_device)
     return s->otp;
 }
 
-type_init(onenand_register_types)
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 8ab1d66310..252a6e340b 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -940,13 +940,9 @@ static const TypeInfo pflash_cfi01_info = {
     .instance_size  = sizeof(PFlashCFI01),
     .class_init     = pflash_cfi01_class_init,
 };
+TYPE_INFO(pflash_cfi01_info)
 
-static void pflash_cfi01_register_types(void)
-{
-    type_register_static(&pflash_cfi01_info);
-}
 
-type_init(pflash_cfi01_register_types)
 
 PFlashCFI01 *pflash_cfi01_register(hwaddr base,
                                    const char *name,
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index eb02fccfa5..4806761e9c 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -977,13 +977,9 @@ static const TypeInfo pflash_cfi02_info = {
     .instance_size  = sizeof(PFlashCFI02),
     .class_init     = pflash_cfi02_class_init,
 };
+TYPE_INFO(pflash_cfi02_info)
 
-static void pflash_cfi02_register_types(void)
-{
-    type_register_static(&pflash_cfi02_info);
-}
 
-type_init(pflash_cfi02_register_types)
 
 PFlashCFI02 *pflash_cfi02_register(hwaddr base,
                                    const char *name,
diff --git a/hw/block/swim.c b/hw/block/swim.c
index 20133a814c..db67d0a9cd 100644
--- a/hw/block/swim.c
+++ b/hw/block/swim.c
@@ -252,12 +252,14 @@ static const TypeInfo swim_drive_info = {
     .instance_size = sizeof(SWIMDrive),
     .class_init = swim_drive_class_init,
 };
+TYPE_INFO(swim_drive_info)
 
 static const TypeInfo swim_bus_info = {
     .name = TYPE_SWIM_BUS,
     .parent = TYPE_BUS,
     .instance_size = sizeof(SWIMBus),
 };
+TYPE_INFO(swim_bus_info)
 
 static void iwmctrl_write(void *opaque, hwaddr reg, uint64_t value,
                           unsigned size)
@@ -481,12 +483,6 @@ static const TypeInfo sysbus_swim_info = {
     .instance_init = sysbus_swim_init,
     .class_init    = sysbus_swim_class_init,
 };
+TYPE_INFO(sysbus_swim_info)
 
-static void swim_register_types(void)
-{
-    type_register_static(&sysbus_swim_info);
-    type_register_static(&swim_bus_info);
-    type_register_static(&swim_drive_info);
-}
 
-type_init(swim_register_types)
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index a00b854736..f8490ece8f 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -561,10 +561,6 @@ static const TypeInfo vhost_user_blk_info = {
     .instance_init = vhost_user_blk_instance_init,
     .class_init = vhost_user_blk_class_init,
 };
+TYPE_INFO(vhost_user_blk_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&vhost_user_blk_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 413783693c..aedc9dbeec 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1327,10 +1327,6 @@ static const TypeInfo virtio_blk_info = {
     .instance_init = virtio_blk_instance_init,
     .class_init = virtio_blk_class_init,
 };
+TYPE_INFO(virtio_blk_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_blk_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 8a7a3f5452..055b55dcf6 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -555,6 +555,7 @@ static const TypeInfo xen_block_type_info = {
     .class_size = sizeof(XenBlockDeviceClass),
     .class_init = xen_block_class_init,
 };
+TYPE_INFO(xen_block_type_info)
 
 static void xen_disk_unrealize(XenBlockDevice *blockdev)
 {
@@ -594,6 +595,7 @@ static const TypeInfo xen_disk_type_info = {
     .instance_size = sizeof(XenDiskDevice),
     .class_init = xen_disk_class_init,
 };
+TYPE_INFO(xen_disk_type_info)
 
 static void xen_cdrom_unrealize(XenBlockDevice *blockdev)
 {
@@ -641,15 +643,9 @@ static const TypeInfo xen_cdrom_type_info = {
     .instance_size = sizeof(XenCDRomDevice),
     .class_init = xen_cdrom_class_init,
 };
+TYPE_INFO(xen_cdrom_type_info)
 
-static void xen_block_register_types(void)
-{
-    type_register_static(&xen_block_type_info);
-    type_register_static(&xen_disk_type_info);
-    type_register_static(&xen_cdrom_type_info);
-}
 
-type_init(xen_block_register_types)
 
 static void xen_block_blockdev_del(const char *node_name, Error **errp)
 {
diff --git a/hw/char/avr_usart.c b/hw/char/avr_usart.c
index fbe2a112b7..da605c9f96 100644
--- a/hw/char/avr_usart.c
+++ b/hw/char/avr_usart.c
@@ -311,10 +311,6 @@ static const TypeInfo avr_usart_info = {
     .instance_init = avr_usart_init,
     .class_init    = avr_usart_class_init,
 };
+TYPE_INFO(avr_usart_info)
 
-static void avr_usart_register_types(void)
-{
-    type_register_static(&avr_usart_info);
-}
 
-type_init(avr_usart_register_types)
diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
index ee3dd40e3c..7f19205355 100644
--- a/hw/char/bcm2835_aux.c
+++ b/hw/char/bcm2835_aux.c
@@ -309,10 +309,6 @@ static const TypeInfo bcm2835_aux_info = {
     .instance_init = bcm2835_aux_init,
     .class_init    = bcm2835_aux_class_init,
 };
+TYPE_INFO(bcm2835_aux_info)
 
-static void bcm2835_aux_register_types(void)
-{
-    type_register_static(&bcm2835_aux_info);
-}
 
-type_init(bcm2835_aux_register_types)
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index e196906c92..cdc8b9c71d 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -613,10 +613,6 @@ static const TypeInfo cadence_uart_info = {
     .instance_init = cadence_uart_init,
     .class_init    = cadence_uart_class_init,
 };
+TYPE_INFO(cadence_uart_info)
 
-static void cadence_uart_register_types(void)
-{
-    type_register_static(&cadence_uart_info);
-}
 
-type_init(cadence_uart_register_types)
diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
index 626b68f2ec..2b5e10a5e9 100644
--- a/hw/char/cmsdk-apb-uart.c
+++ b/hw/char/cmsdk-apb-uart.c
@@ -399,10 +399,6 @@ static const TypeInfo cmsdk_apb_uart_info = {
     .instance_init = cmsdk_apb_uart_init,
     .class_init = cmsdk_apb_uart_class_init,
 };
+TYPE_INFO(cmsdk_apb_uart_info)
 
-static void cmsdk_apb_uart_register_types(void)
-{
-    type_register_static(&cmsdk_apb_uart_info);
-}
 
-type_init(cmsdk_apb_uart_register_types);
diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index c8d938efb5..7c29b9cbcf 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -135,10 +135,6 @@ static const TypeInfo debugcon_isa_info = {
     .instance_size = sizeof(ISADebugconState),
     .class_init    = debugcon_isa_class_initfn,
 };
+TYPE_INFO(debugcon_isa_info)
 
-static void debugcon_register_types(void)
-{
-    type_register_static(&debugcon_isa_info);
-}
 
-type_init(debugcon_register_types)
diff --git a/hw/char/digic-uart.c b/hw/char/digic-uart.c
index e130cb4692..c86059ed0b 100644
--- a/hw/char/digic-uart.c
+++ b/hw/char/digic-uart.c
@@ -193,10 +193,6 @@ static const TypeInfo digic_uart_info = {
     .instance_init = digic_uart_init,
     .class_init = digic_uart_class_init,
 };
+TYPE_INFO(digic_uart_info)
 
-static void digic_uart_register_types(void)
-{
-    type_register_static(&digic_uart_info);
-}
 
-type_init(digic_uart_register_types)
diff --git a/hw/char/escc.c b/hw/char/escc.c
index 7d16ee8688..da8e089407 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -876,10 +876,6 @@ static const TypeInfo escc_info = {
     .instance_init = escc_init1,
     .class_init    = escc_class_init,
 };
+TYPE_INFO(escc_info)
 
-static void escc_register_types(void)
-{
-    type_register_static(&escc_info);
-}
 
-type_init(escc_register_types)
diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
index 947bdb649a..5b70c85b9b 100644
--- a/hw/char/etraxfs_ser.c
+++ b/hw/char/etraxfs_ser.c
@@ -255,10 +255,6 @@ static const TypeInfo etraxfs_ser_info = {
     .instance_init = etraxfs_ser_init,
     .class_init    = etraxfs_ser_class_init,
 };
+TYPE_INFO(etraxfs_ser_info)
 
-static void etraxfs_serial_register_types(void)
-{
-    type_register_static(&etraxfs_ser_info);
-}
 
-type_init(etraxfs_serial_register_types)
diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 9c8ab3a77d..a59826a3df 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -723,10 +723,6 @@ static const TypeInfo exynos4210_uart_info = {
     .instance_init = exynos4210_uart_init,
     .class_init    = exynos4210_uart_class_init,
 };
+TYPE_INFO(exynos4210_uart_info)
 
-static void exynos4210_uart_register(void)
-{
-    type_register_static(&exynos4210_uart_info);
-}
 
-type_init(exynos4210_uart_register)
diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index 16d0feac59..581111ce75 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -294,10 +294,6 @@ static const TypeInfo grlib_apbuart_info = {
     .instance_size = sizeof(UART),
     .class_init    = grlib_apbuart_class_init,
 };
+TYPE_INFO(grlib_apbuart_info)
 
-static void grlib_apbuart_register_types(void)
-{
-    type_register_static(&grlib_apbuart_info);
-}
 
-type_init(grlib_apbuart_register_types)
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index cc49a35013..f88f69f98c 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -507,10 +507,6 @@ static const TypeInfo ibex_uart_info = {
     .instance_init = ibex_uart_init,
     .class_init    = ibex_uart_class_init,
 };
+TYPE_INFO(ibex_uart_info)
 
-static void ibex_uart_register_types(void)
-{
-    type_register_static(&ibex_uart_info);
-}
 
-type_init(ibex_uart_register_types)
diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index 731b8fc64c..17abb067ea 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -382,10 +382,6 @@ static const TypeInfo imx_serial_info = {
     .instance_init  = imx_serial_init,
     .class_init     = imx_serial_class_init,
 };
+TYPE_INFO(imx_serial_info)
 
-static void imx_serial_register_types(void)
-{
-    type_register_static(&imx_serial_info);
-}
 
-type_init(imx_serial_register_types)
diff --git a/hw/char/ipoctal232.c b/hw/char/ipoctal232.c
index d7c497b939..b94ebf2791 100644
--- a/hw/char/ipoctal232.c
+++ b/hw/char/ipoctal232.c
@@ -598,10 +598,6 @@ static const TypeInfo ipoctal_info = {
     .instance_size = sizeof(IPOctalState),
     .class_init    = ipoctal_class_init,
 };
+TYPE_INFO(ipoctal_info)
 
-static void ipoctal_register_types(void)
-{
-    type_register_static(&ipoctal_info);
-}
 
-type_init(ipoctal_register_types)
diff --git a/hw/char/lm32_juart.c b/hw/char/lm32_juart.c
index 3f34861233..bd4a778d38 100644
--- a/hw/char/lm32_juart.c
+++ b/hw/char/lm32_juart.c
@@ -156,10 +156,6 @@ static const TypeInfo lm32_juart_info = {
     .instance_size = sizeof(LM32JuartState),
     .class_init    = lm32_juart_class_init,
 };
+TYPE_INFO(lm32_juart_info)
 
-static void lm32_juart_register_types(void)
-{
-    type_register_static(&lm32_juart_info);
-}
 
-type_init(lm32_juart_register_types)
diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
index b0b1092889..266808790f 100644
--- a/hw/char/lm32_uart.c
+++ b/hw/char/lm32_uart.c
@@ -304,10 +304,6 @@ static const TypeInfo lm32_uart_info = {
     .instance_init = lm32_uart_init,
     .class_init    = lm32_uart_class_init,
 };
+TYPE_INFO(lm32_uart_info)
 
-static void lm32_uart_register_types(void)
-{
-    type_register_static(&lm32_uart_info);
-}
 
-type_init(lm32_uart_register_types)
diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
index 8d1b7f2bca..ec41736980 100644
--- a/hw/char/mcf_uart.c
+++ b/hw/char/mcf_uart.c
@@ -332,13 +332,9 @@ static const TypeInfo mcf_uart_info = {
     .instance_init = mcf_uart_instance_init,
     .class_init    = mcf_uart_class_init,
 };
+TYPE_INFO(mcf_uart_info)
 
-static void mcf_uart_register(void)
-{
-    type_register_static(&mcf_uart_info);
-}
 
-type_init(mcf_uart_register)
 
 void *mcf_uart_init(qemu_irq irq, Chardev *chrdrv)
 {
diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c
index 1439efb42a..d3cb7c9140 100644
--- a/hw/char/milkymist-uart.c
+++ b/hw/char/milkymist-uart.c
@@ -249,10 +249,6 @@ static const TypeInfo milkymist_uart_info = {
     .instance_init = milkymist_uart_init,
     .class_init    = milkymist_uart_class_init,
 };
+TYPE_INFO(milkymist_uart_info)
 
-static void milkymist_uart_register_types(void)
-{
-    type_register_static(&milkymist_uart_info);
-}
 
-type_init(milkymist_uart_register_types)
diff --git a/hw/char/nrf51_uart.c b/hw/char/nrf51_uart.c
index d1fef77acd..0715f8b019 100644
--- a/hw/char/nrf51_uart.c
+++ b/hw/char/nrf51_uart.c
@@ -325,10 +325,6 @@ static const TypeInfo nrf51_uart_info = {
     .instance_init = nrf51_uart_init,
     .class_init = nrf51_uart_class_init
 };
+TYPE_INFO(nrf51_uart_info)
 
-static void nrf51_uart_register_types(void)
-{
-    type_register_static(&nrf51_uart_info);
-}
 
-type_init(nrf51_uart_register_types)
diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index c0f34bf924..8f09384066 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -659,10 +659,6 @@ static const TypeInfo parallel_isa_info = {
     .instance_size = sizeof(ISAParallelState),
     .class_init    = parallel_isa_class_initfn,
 };
+TYPE_INFO(parallel_isa_info)
 
-static void parallel_register_types(void)
-{
-    type_register_static(&parallel_isa_info);
-}
 
-type_init(parallel_register_types)
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 13e784f9d9..422c9e660a 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -366,6 +366,7 @@ static const TypeInfo pl011_arm_info = {
     .instance_init = pl011_init,
     .class_init    = pl011_class_init,
 };
+TYPE_INFO(pl011_arm_info)
 
 static void pl011_luminary_init(Object *obj)
 {
@@ -379,11 +380,6 @@ static const TypeInfo pl011_luminary_info = {
     .parent        = TYPE_PL011,
     .instance_init = pl011_luminary_init,
 };
+TYPE_INFO(pl011_luminary_info)
 
-static void pl011_register_types(void)
-{
-    type_register_static(&pl011_arm_info);
-    type_register_static(&pl011_luminary_info);
-}
 
-type_init(pl011_register_types)
diff --git a/hw/char/renesas_sci.c b/hw/char/renesas_sci.c
index 5d7c6e6523..041557a4f1 100644
--- a/hw/char/renesas_sci.c
+++ b/hw/char/renesas_sci.c
@@ -341,10 +341,6 @@ static const TypeInfo rsci_info = {
     .instance_init = rsci_init,
     .class_init = rsci_class_init,
 };
+TYPE_INFO(rsci_info)
 
-static void rsci_register_types(void)
-{
-    type_register_static(&rsci_info);
-}
 
-type_init(rsci_register_types)
diff --git a/hw/char/sclpconsole-lm.c b/hw/char/sclpconsole-lm.c
index 2b5f37b6a2..0a277b8c37 100644
--- a/hw/char/sclpconsole-lm.c
+++ b/hw/char/sclpconsole-lm.c
@@ -361,10 +361,6 @@ static const TypeInfo sclp_console_info = {
     .class_init    = console_class_init,
     .class_size    = sizeof(SCLPEventClass),
 };
+TYPE_INFO(sclp_console_info)
 
-static void register_types(void)
-{
-    type_register_static(&sclp_console_info);
-}
 
-type_init(register_types)
diff --git a/hw/char/sclpconsole.c b/hw/char/sclpconsole.c
index 5c7664905e..2e960973e2 100644
--- a/hw/char/sclpconsole.c
+++ b/hw/char/sclpconsole.c
@@ -277,10 +277,6 @@ static const TypeInfo sclp_console_info = {
     .class_init    = console_class_init,
     .class_size    = sizeof(SCLPEventClass),
 };
+TYPE_INFO(sclp_console_info)
 
-static void register_types(void)
-{
-    type_register_static(&sclp_console_info);
-}
 
-type_init(register_types)
diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index b4c65949cd..35a1ee3a30 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -146,13 +146,9 @@ static const TypeInfo serial_isa_info = {
     .instance_init = serial_isa_initfn,
     .class_init    = serial_isa_class_initfn,
 };
+TYPE_INFO(serial_isa_info)
 
-static void serial_register_types(void)
-{
-    type_register_static(&serial_isa_info);
-}
 
-type_init(serial_register_types)
 
 static void serial_isa_init(ISABus *bus, int index, Chardev *chr)
 {
diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index 2cf3e44177..591c625b1d 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -199,6 +199,7 @@ static const TypeInfo multi_2x_serial_pci_info = {
         { },
     },
 };
+TYPE_INFO(multi_2x_serial_pci_info)
 
 static const TypeInfo multi_4x_serial_pci_info = {
     .name          = "pci-serial-4x",
@@ -211,11 +212,6 @@ static const TypeInfo multi_4x_serial_pci_info = {
         { },
     },
 };
+TYPE_INFO(multi_4x_serial_pci_info)
 
-static void multi_serial_pci_register_types(void)
-{
-    type_register_static(&multi_2x_serial_pci_info);
-    type_register_static(&multi_4x_serial_pci_info);
-}
 
-type_init(multi_serial_pci_register_types)
diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index cd56924a43..02264f8b73 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -119,10 +119,6 @@ static const TypeInfo serial_pci_info = {
         { },
     },
 };
+TYPE_INFO(serial_pci_info)
 
-static void serial_pci_register_types(void)
-{
-    type_register_static(&serial_pci_info);
-}
 
-type_init(serial_pci_register_types)
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 2386479492..a40d967d70 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -1024,6 +1024,7 @@ static const TypeInfo serial_io_info = {
     .instance_init = serial_io_instance_init,
     .class_init = serial_io_class_init,
 };
+TYPE_INFO(serial_io_info)
 
 static Property serial_properties[] = {
     DEFINE_PROP_CHR("chardev", SerialState, chr),
@@ -1048,6 +1049,7 @@ static const TypeInfo serial_info = {
     .instance_size = sizeof(SerialState),
     .class_init = serial_class_init,
 };
+TYPE_INFO(serial_info)
 
 /* Memory mapped interface */
 static uint64_t serial_mm_read(void *opaque, hwaddr addr,
@@ -1174,12 +1176,6 @@ static const TypeInfo serial_mm_info = {
     .instance_size = sizeof(SerialMM),
     .class_init = serial_mm_class_init,
 };
+TYPE_INFO(serial_mm_info)
 
-static void serial_register_types(void)
-{
-    type_register_static(&serial_info);
-    type_register_static(&serial_io_info);
-    type_register_static(&serial_mm_info);
-}
 
-type_init(serial_register_types)
diff --git a/hw/char/spapr_vty.c b/hw/char/spapr_vty.c
index 464a52342a..236dc2194a 100644
--- a/hw/char/spapr_vty.c
+++ b/hw/char/spapr_vty.c
@@ -203,6 +203,7 @@ static const TypeInfo spapr_vty_info = {
     .instance_size = sizeof(SpaprVioVty),
     .class_init    = spapr_vty_class_init,
 };
+TYPE_INFO(spapr_vty_info)
 
 SpaprVioDevice *spapr_vty_get_default(SpaprVioBus *bus)
 {
@@ -266,7 +267,6 @@ static void spapr_vty_register_types(void)
 {
     spapr_register_hypercall(H_PUT_TERM_CHAR, h_put_term_char);
     spapr_register_hypercall(H_GET_TERM_CHAR, h_get_term_char);
-    type_register_static(&spapr_vty_info);
 }
 
 type_init(spapr_vty_register_types)
diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
index 0d661be6d3..f66bdbf796 100644
--- a/hw/char/stm32f2xx_usart.c
+++ b/hw/char/stm32f2xx_usart.c
@@ -233,10 +233,6 @@ static const TypeInfo stm32f2xx_usart_info = {
     .instance_init = stm32f2xx_usart_init,
     .class_init    = stm32f2xx_usart_class_init,
 };
+TYPE_INFO(stm32f2xx_usart_info)
 
-static void stm32f2xx_usart_register_types(void)
-{
-    type_register_static(&stm32f2xx_usart_info);
-}
 
-type_init(stm32f2xx_usart_register_types)
diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
index 2c47ebf007..6ba6052ac9 100644
--- a/hw/char/terminal3270.c
+++ b/hw/char/terminal3270.c
@@ -302,10 +302,6 @@ static const TypeInfo ccw_terminal_info = {
     .class_init = terminal_class_init,
     .class_size = sizeof(EmulatedCcw3270Class),
 };
+TYPE_INFO(ccw_terminal_info)
 
-static void register_types(void)
-{
-    type_register_static(&ccw_terminal_info);
-}
 
-type_init(register_types)
diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
index 4f46753ea3..0ac862df15 100644
--- a/hw/char/virtio-console.c
+++ b/hw/char/virtio-console.c
@@ -270,6 +270,7 @@ static const TypeInfo virtconsole_info = {
     .parent        = TYPE_VIRTIO_CONSOLE_SERIAL_PORT,
     .class_init    = virtconsole_class_init,
 };
+TYPE_INFO(virtconsole_info)
 
 static Property virtserialport_properties[] = {
     DEFINE_PROP_CHR("chardev", VirtConsole, chr),
@@ -296,11 +297,6 @@ static const TypeInfo virtserialport_info = {
     .instance_size = sizeof(VirtConsole),
     .class_init    = virtserialport_class_init,
 };
+TYPE_INFO(virtserialport_info)
 
-static void virtconsole_register_types(void)
-{
-    type_register_static(&virtserialport_info);
-    type_register_static(&virtconsole_info);
-}
 
-type_init(virtconsole_register_types)
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index cf08ef9728..daf6274223 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -855,6 +855,7 @@ static const TypeInfo virtser_bus_info = {
     .instance_size = sizeof(VirtIOSerialBus),
     .class_init = virtser_bus_class_init,
 };
+TYPE_INFO(virtser_bus_info)
 
 static void virtser_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
 {
@@ -1117,6 +1118,7 @@ static const TypeInfo virtio_serial_port_type_info = {
     .class_size = sizeof(VirtIOSerialPortClass),
     .class_init = virtio_serial_port_class_init,
 };
+TYPE_INFO(virtio_serial_port_type_info)
 
 static void virtio_serial_device_unrealize(DeviceState *dev)
 {
@@ -1201,12 +1203,6 @@ static const TypeInfo virtio_device_info = {
         { }
     }
 };
+TYPE_INFO(virtio_device_info)
 
-static void virtio_serial_register_types(void)
-{
-    type_register_static(&virtser_bus_info);
-    type_register_static(&virtio_serial_port_type_info);
-    type_register_static(&virtio_device_info);
-}
 
-type_init(virtio_serial_register_types)
diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index ae4ccd00c7..aad3fbc31e 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -247,10 +247,6 @@ static const TypeInfo xilinx_uartlite_info = {
     .instance_init = xilinx_uartlite_init,
     .class_init    = xilinx_uartlite_class_init,
 };
+TYPE_INFO(xilinx_uartlite_info)
 
-static void xilinx_uart_register_types(void)
-{
-    type_register_static(&xilinx_uartlite_info);
-}
 
-type_init(xilinx_uart_register_types)
diff --git a/hw/core/bus.c b/hw/core/bus.c
index 6b987b6946..76762e3ab3 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -325,10 +325,6 @@ static const TypeInfo bus_info = {
         { }
     },
 };
+TYPE_INFO(bus_info)
 
-static void bus_register_types(void)
-{
-    type_register_static(&bus_info);
-}
 
-type_init(bus_register_types)
diff --git a/hw/core/clock.c b/hw/core/clock.c
index 3c0daf7d4c..9ee9aeb932 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -121,10 +121,6 @@ static const TypeInfo clock_info = {
     .instance_init     = clock_initfn,
     .instance_finalize = clock_finalizefn,
 };
+TYPE_INFO(clock_info)
 
-static void clock_register_types(void)
-{
-    type_register_static(&clock_info);
-}
 
-type_init(clock_register_types)
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 22bc3f974a..2c325edb1e 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -449,10 +449,6 @@ static const TypeInfo cpu_type_info = {
     .class_size = sizeof(CPUClass),
     .class_init = cpu_class_init,
 };
+TYPE_INFO(cpu_type_info)
 
-static void cpu_register_types(void)
-{
-    type_register_static(&cpu_type_info);
-}
 
-type_init(cpu_register_types)
diff --git a/hw/core/fw-path-provider.c b/hw/core/fw-path-provider.c
index 4840faefd1..7f9f7eff15 100644
--- a/hw/core/fw-path-provider.c
+++ b/hw/core/fw-path-provider.c
@@ -45,10 +45,6 @@ static const TypeInfo fw_path_provider_info = {
     .parent        = TYPE_INTERFACE,
     .class_size    = sizeof(FWPathProviderClass),
 };
+TYPE_INFO(fw_path_provider_info)
 
-static void fw_path_provider_register_types(void)
-{
-    type_register_static(&fw_path_provider_info);
-}
 
-type_init(fw_path_provider_register_types)
diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index a242c076f6..e463b0dc18 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -212,10 +212,6 @@ static TypeInfo generic_loader_info = {
     .instance_size = sizeof(GenericLoaderState),
     .class_init = generic_loader_class_init,
 };
+TYPE_INFO(generic_loader_info)
 
-static void generic_loader_register_type(void)
-{
-    type_register_static(&generic_loader_info);
-}
 
-type_init(generic_loader_register_type)
diff --git a/hw/core/hotplug.c b/hw/core/hotplug.c
index 17ac986685..6460ac5e8f 100644
--- a/hw/core/hotplug.c
+++ b/hw/core/hotplug.c
@@ -62,10 +62,6 @@ static const TypeInfo hotplug_handler_info = {
     .parent        = TYPE_INTERFACE,
     .class_size = sizeof(HotplugHandlerClass),
 };
+TYPE_INFO(hotplug_handler_info)
 
-static void hotplug_handler_register_types(void)
-{
-    type_register_static(&hotplug_handler_info);
-}
 
-type_init(hotplug_handler_register_types)
diff --git a/hw/core/irq.c b/hw/core/irq.c
index fb3045b912..8aebc22cb2 100644
--- a/hw/core/irq.c
+++ b/hw/core/irq.c
@@ -136,10 +136,6 @@ static const TypeInfo irq_type_info = {
    .parent = TYPE_OBJECT,
    .instance_size = sizeof(struct IRQState),
 };
+TYPE_INFO(irq_type_info)
 
-static void irq_register_types(void)
-{
-    type_register_static(&irq_type_info);
-}
 
-type_init(irq_register_types)
diff --git a/hw/core/machine.c b/hw/core/machine.c
index cf5f2dfaeb..a2331b0f4d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1149,10 +1149,6 @@ static const TypeInfo machine_info = {
     .instance_init = machine_initfn,
     .instance_finalize = machine_finalize,
 };
+TYPE_INFO(machine_info)
 
-static void machine_register_types(void)
-{
-    type_register_static(&machine_info);
-}
 
-type_init(machine_register_types)
diff --git a/hw/core/nmi.c b/hw/core/nmi.c
index 481c4b3c7e..e14906f74d 100644
--- a/hw/core/nmi.c
+++ b/hw/core/nmi.c
@@ -79,10 +79,6 @@ static const TypeInfo nmi_info = {
     .parent        = TYPE_INTERFACE,
     .class_size    = sizeof(NMIClass),
 };
+TYPE_INFO(nmi_info)
 
-static void nmi_register_types(void)
-{
-    type_register_static(&nmi_info);
-}
 
-type_init(nmi_register_types)
diff --git a/hw/core/or-irq.c b/hw/core/or-irq.c
index d8f3754e96..4ff195b3e2 100644
--- a/hw/core/or-irq.c
+++ b/hw/core/or-irq.c
@@ -140,10 +140,6 @@ static const TypeInfo or_irq_type_info = {
    .instance_init = or_irq_init,
    .class_init = or_irq_class_init,
 };
+TYPE_INFO(or_irq_type_info)
 
-static void or_irq_register_types(void)
-{
-    type_register_static(&or_irq_type_info);
-}
 
-type_init(or_irq_register_types)
diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
index 5037ca265e..5398bf92f5 100644
--- a/hw/core/platform-bus.c
+++ b/hw/core/platform-bus.c
@@ -221,10 +221,6 @@ static const TypeInfo platform_bus_info = {
     .instance_size = sizeof(PlatformBusDevice),
     .class_init    = platform_bus_class_init,
 };
+TYPE_INFO(platform_bus_info)
 
-static void platform_bus_register_types(void)
-{
-    type_register_static(&platform_bus_info);
-}
 
-type_init(platform_bus_register_types)
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 96772a15bd..1b82b3fbf9 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1251,10 +1251,6 @@ static const TypeInfo device_type_info = {
         { }
     }
 };
+TYPE_INFO(device_type_info)
 
-static void qdev_register_types(void)
-{
-    type_register_static(&device_type_info);
-}
 
-type_init(qdev_register_types)
diff --git a/hw/core/register.c b/hw/core/register.c
index ddf91eb445..2b25f993ce 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -330,10 +330,6 @@ static const TypeInfo register_info = {
     .parent = TYPE_DEVICE,
     .class_init = register_class_init,
 };
+TYPE_INFO(register_info)
 
-static void register_register_types(void)
-{
-    type_register_static(&register_info);
-}
 
-type_init(register_register_types)
diff --git a/hw/core/resettable.c b/hw/core/resettable.c
index 96a99ce39e..88ba81de71 100644
--- a/hw/core/resettable.c
+++ b/hw/core/resettable.c
@@ -292,10 +292,6 @@ static const TypeInfo resettable_interface_info = {
     .parent     = TYPE_INTERFACE,
     .class_size = sizeof(ResettableClass),
 };
+TYPE_INFO(resettable_interface_info)
 
-static void reset_register_types(void)
-{
-    type_register_static(&resettable_interface_info);
-}
 
-type_init(reset_register_types)
diff --git a/hw/core/split-irq.c b/hw/core/split-irq.c
index 3b90af2e8f..35653c5d4d 100644
--- a/hw/core/split-irq.c
+++ b/hw/core/split-irq.c
@@ -83,10 +83,6 @@ static const TypeInfo split_irq_type_info = {
    .instance_init = split_irq_init,
    .class_init = split_irq_class_init,
 };
+TYPE_INFO(split_irq_type_info)
 
-static void split_irq_register_types(void)
-{
-    type_register_static(&split_irq_type_info);
-}
 
-type_init(split_irq_register_types)
diff --git a/hw/core/stream.c b/hw/core/stream.c
index a65ad1208d..c1bb12537e 100644
--- a/hw/core/stream.c
+++ b/hw/core/stream.c
@@ -24,11 +24,7 @@ static const TypeInfo stream_slave_info = {
     .parent        = TYPE_INTERFACE,
     .class_size = sizeof(StreamSlaveClass),
 };
+TYPE_INFO(stream_slave_info)
 
 
-static void stream_slave_register_types(void)
-{
-    type_register_static(&stream_slave_info);
-}
 
-type_init(stream_slave_register_types)
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 70239b7e7d..9e89bfd8d4 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -86,6 +86,7 @@ static const TypeInfo system_bus_info = {
     .instance_size = sizeof(BusState),
     .class_init = system_bus_class_init,
 };
+TYPE_INFO(system_bus_info)
 
 /* Check whether an IRQ source exists */
 bool sysbus_has_irq(SysBusDevice *dev, int n)
@@ -334,6 +335,7 @@ static const TypeInfo sysbus_device_type_info = {
     .class_size = sizeof(SysBusDeviceClass),
     .class_init = sysbus_device_class_init,
 };
+TYPE_INFO(sysbus_device_type_info)
 
 static BusState *main_system_bus;
 
@@ -355,10 +357,4 @@ BusState *sysbus_get_default(void)
     return main_system_bus;
 }
 
-static void sysbus_register_types(void)
-{
-    type_register_static(&system_bus_info);
-    type_register_static(&sysbus_device_type_info);
-}
 
-type_init(sysbus_register_types)
diff --git a/hw/core/vmstate-if.c b/hw/core/vmstate-if.c
index bf453620fe..3ad0c95df0 100644
--- a/hw/core/vmstate-if.c
+++ b/hw/core/vmstate-if.c
@@ -14,10 +14,6 @@ static const TypeInfo vmstate_if_info = {
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(VMStateIfClass),
 };
+TYPE_INFO(vmstate_if_info)
 
-static void vmstate_register_types(void)
-{
-    type_register_static(&vmstate_if_info);
-}
 
-type_init(vmstate_register_types);
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index c377be398d..78eb2a9517 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -171,10 +171,6 @@ static const TypeInfo a15mp_priv_info = {
     .instance_init = a15mp_priv_initfn,
     .class_init = a15mp_priv_class_init,
 };
+TYPE_INFO(a15mp_priv_info)
 
-static void a15mp_register_types(void)
-{
-    type_register_static(&a15mp_priv_info);
-}
 
-type_init(a15mp_register_types)
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index ec186d49ab..b5103035d8 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -185,10 +185,6 @@ static const TypeInfo a9mp_priv_info = {
     .instance_init = a9mp_priv_initfn,
     .class_init    = a9mp_priv_class_init,
 };
+TYPE_INFO(a9mp_priv_info)
 
-static void a9mp_register_types(void)
-{
-    type_register_static(&a9mp_priv_info);
-}
 
-type_init(a9mp_register_types)
diff --git a/hw/cpu/arm11mpcore.c b/hw/cpu/arm11mpcore.c
index 89c4e35143..55b0f0aaad 100644
--- a/hw/cpu/arm11mpcore.c
+++ b/hw/cpu/arm11mpcore.c
@@ -160,10 +160,6 @@ static const TypeInfo mpcore_priv_info = {
     .instance_init = mpcore_priv_initfn,
     .class_init    = mpcore_priv_class_init,
 };
+TYPE_INFO(mpcore_priv_info)
 
-static void arm11mpcore_register_types(void)
-{
-    type_register_static(&mpcore_priv_info);
-}
 
-type_init(arm11mpcore_register_types)
diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index e444b7c29d..016b320889 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -91,10 +91,6 @@ static const TypeInfo cpu_cluster_type_info = {
     .instance_size = sizeof(CPUClusterState),
     .class_init = cpu_cluster_class_init,
 };
+TYPE_INFO(cpu_cluster_type_info)
 
-static void cpu_cluster_register_types(void)
-{
-    type_register_static(&cpu_cluster_type_info);
-}
 
-type_init(cpu_cluster_register_types)
diff --git a/hw/cpu/core.c b/hw/cpu/core.c
index 3a659291ea..2fc8b72a74 100644
--- a/hw/cpu/core.c
+++ b/hw/cpu/core.c
@@ -91,10 +91,6 @@ static const TypeInfo cpu_core_type_info = {
     .instance_size = sizeof(CPUCore),
     .instance_init = cpu_core_instance_init,
 };
+TYPE_INFO(cpu_core_type_info)
 
-static void cpu_core_register_types(void)
-{
-    type_register_static(&cpu_core_type_info);
-}
 
-type_init(cpu_core_register_types)
diff --git a/hw/cpu/realview_mpcore.c b/hw/cpu/realview_mpcore.c
index 96f4d2517a..0ae3019045 100644
--- a/hw/cpu/realview_mpcore.c
+++ b/hw/cpu/realview_mpcore.c
@@ -128,10 +128,6 @@ static const TypeInfo mpcore_rirq_info = {
     .instance_init = mpcore_rirq_init,
     .class_init    = mpcore_rirq_class_init,
 };
+TYPE_INFO(mpcore_rirq_info)
 
-static void realview_mpcore_register_types(void)
-{
-    type_register_static(&mpcore_rirq_info);
-}
 
-type_init(realview_mpcore_register_types)
diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
index 56bf82fe07..94bb9db052 100644
--- a/hw/display/ads7846.c
+++ b/hw/display/ads7846.c
@@ -174,10 +174,6 @@ static const TypeInfo ads7846_info = {
     .instance_size = sizeof(ADS7846State),
     .class_init    = ads7846_class_init,
 };
+TYPE_INFO(ads7846_info)
 
-static void ads7846_register_types(void)
-{
-    type_register_static(&ads7846_info);
-}
 
-type_init(ads7846_register_types)
diff --git a/hw/display/artist.c b/hw/display/artist.c
index 6261bfe65b..2e1b793a86 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1434,10 +1434,6 @@ static const TypeInfo artist_info = {
     .instance_init = artist_initfn,
     .class_init    = artist_class_init,
 };
+TYPE_INFO(artist_info)
 
-static void artist_register_types(void)
-{
-    type_register_static(&artist_info);
-}
 
-type_init(artist_register_types)
diff --git a/hw/display/ati.c b/hw/display/ati.c
index 4c3ad8f47b..5ddd252f34 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -1043,10 +1043,6 @@ static const TypeInfo ati_vga_info = {
           { },
     },
 };
+TYPE_INFO(ati_vga_info)
 
-static void ati_vga_register_types(void)
-{
-    type_register_static(&ati_vga_info);
-}
 
-type_init(ati_vga_register_types)
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 986c994522..e1f85fa948 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -461,10 +461,6 @@ static TypeInfo bcm2835_fb_info = {
     .class_init    = bcm2835_fb_class_init,
     .instance_init = bcm2835_fb_init,
 };
+TYPE_INFO(bcm2835_fb_info)
 
-static void bcm2835_fb_register_types(void)
-{
-    type_register_static(&bcm2835_fb_info);
-}
 
-type_init(bcm2835_fb_register_types)
diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index a8e8ab8325..86869778ed 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -381,10 +381,6 @@ static const TypeInfo bochs_display_type_info = {
         { },
     },
 };
+TYPE_INFO(bochs_display_type_info)
 
-static void bochs_display_register_types(void)
-{
-    type_register_static(&bochs_display_type_info);
-}
 
-type_init(bochs_display_register_types)
diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index 7cbe6e56ff..0e7e260ccf 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -385,10 +385,6 @@ static const TypeInfo cg3_info = {
     .instance_init = cg3_initfn,
     .class_init    = cg3_class_init,
 };
+TYPE_INFO(cg3_info)
 
-static void cg3_register_types(void)
-{
-    type_register_static(&cg3_info);
-}
 
-type_init(cg3_register_types)
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 212d6f5e61..fe4d8a4fb8 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -3028,10 +3028,6 @@ static const TypeInfo cirrus_vga_info = {
         { },
     },
 };
+TYPE_INFO(cirrus_vga_info)
 
-static void cirrus_vga_register_types(void)
-{
-    type_register_static(&cirrus_vga_info);
-}
 
-type_init(cirrus_vga_register_types)
diff --git a/hw/display/cirrus_vga_isa.c b/hw/display/cirrus_vga_isa.c
index 825ba57298..4d0e54b0f2 100644
--- a/hw/display/cirrus_vga_isa.c
+++ b/hw/display/cirrus_vga_isa.c
@@ -90,10 +90,6 @@ static const TypeInfo isa_cirrus_vga_info = {
     .instance_size = sizeof(ISACirrusVGAState),
     .class_init = isa_cirrus_vga_class_init,
 };
+TYPE_INFO(isa_cirrus_vga_info)
 
-static void cirrus_vga_isa_register_types(void)
-{
-    type_register_static(&isa_cirrus_vga_info);
-}
 
-type_init(cirrus_vga_isa_register_types)
diff --git a/hw/display/dpcd.c b/hw/display/dpcd.c
index 64463654a1..ff5b655f0e 100644
--- a/hw/display/dpcd.c
+++ b/hw/display/dpcd.c
@@ -156,10 +156,6 @@ static const TypeInfo dpcd_info = {
     .class_init    = dpcd_class_init,
     .instance_init = dpcd_init,
 };
+TYPE_INFO(dpcd_info)
 
-static void dpcd_register_types(void)
-{
-    type_register_static(&dpcd_info);
-}
 
-type_init(dpcd_register_types)
diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 4b7286b7c9..bfd7f4fc6f 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1961,10 +1961,6 @@ static const TypeInfo exynos4210_fimd_info = {
     .instance_init = exynos4210_fimd_init,
     .class_init = exynos4210_fimd_class_init,
 };
+TYPE_INFO(exynos4210_fimd_info)
 
-static void exynos4210_fimd_register_types(void)
-{
-    type_register_static(&exynos4210_fimd_info);
-}
 
-type_init(exynos4210_fimd_register_types)
diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index adcba96e34..33f2822445 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -536,10 +536,6 @@ static const TypeInfo g364fb_sysbus_info = {
     .instance_size = sizeof(G364SysBusState),
     .class_init    = g364fb_sysbus_class_init,
 };
+TYPE_INFO(g364fb_sysbus_info)
 
-static void g364fb_register_types(void)
-{
-    type_register_static(&g364fb_sysbus_info);
-}
 
-type_init(g364fb_register_types)
diff --git a/hw/display/i2c-ddc.c b/hw/display/i2c-ddc.c
index 13eb529fc1..5c5c255eb1 100644
--- a/hw/display/i2c-ddc.c
+++ b/hw/display/i2c-ddc.c
@@ -120,10 +120,6 @@ static TypeInfo i2c_ddc_info = {
     .instance_init = i2c_ddc_init,
     .class_init = i2c_ddc_class_init
 };
+TYPE_INFO(i2c_ddc_info)
 
-static void ddc_register_devices(void)
-{
-    type_register_static(&i2c_ddc_info);
-}
 
-type_init(ddc_register_devices);
diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
index 1d845597f9..1b1002e14a 100644
--- a/hw/display/jazz_led.c
+++ b/hw/display/jazz_led.c
@@ -310,10 +310,6 @@ static const TypeInfo jazz_led_info = {
     .instance_init = jazz_led_init,
     .class_init    = jazz_led_class_init,
 };
+TYPE_INFO(jazz_led_info)
 
-static void jazz_led_register(void)
-{
-    type_register_static(&jazz_led_info);
-}
 
-type_init(jazz_led_register);
diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index ff8bdb846b..f4ac71dc18 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -459,6 +459,7 @@ static TypeInfo macfb_sysbus_info = {
     .instance_size = sizeof(MacfbSysBusState),
     .class_init    = macfb_sysbus_class_init,
 };
+TYPE_INFO(macfb_sysbus_info)
 
 static TypeInfo macfb_nubus_info = {
     .name          = TYPE_NUBUS_MACFB,
@@ -467,11 +468,6 @@ static TypeInfo macfb_nubus_info = {
     .class_init    = macfb_nubus_class_init,
     .class_size    = sizeof(MacfbNubusDeviceClass),
 };
+TYPE_INFO(macfb_nubus_info)
 
-static void macfb_register_types(void)
-{
-    type_register_static(&macfb_sysbus_info);
-    type_register_static(&macfb_nubus_info);
-}
 
-type_init(macfb_register_types)
diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
index c34ef1a1bf..495b6c960f 100644
--- a/hw/display/milkymist-tmu2.c
+++ b/hw/display/milkymist-tmu2.c
@@ -495,13 +495,9 @@ static const TypeInfo milkymist_tmu2_info = {
     .instance_init = milkymist_tmu2_init,
     .class_init    = milkymist_tmu2_class_init,
 };
+TYPE_INFO(milkymist_tmu2_info)
 
-static void milkymist_tmu2_register_types(void)
-{
-    type_register_static(&milkymist_tmu2_info);
-}
 
-type_init(milkymist_tmu2_register_types)
 
 DeviceState *milkymist_tmu2_create(hwaddr base, qemu_irq irq)
 {
diff --git a/hw/display/milkymist-vgafb.c b/hw/display/milkymist-vgafb.c
index 6a6441e6ea..634bf4571a 100644
--- a/hw/display/milkymist-vgafb.c
+++ b/hw/display/milkymist-vgafb.c
@@ -352,10 +352,6 @@ static const TypeInfo milkymist_vgafb_info = {
     .instance_init = milkymist_vgafb_init,
     .class_init    = milkymist_vgafb_class_init,
 };
+TYPE_INFO(milkymist_vgafb_info)
 
-static void milkymist_vgafb_register_types(void)
-{
-    type_register_static(&milkymist_vgafb_info);
-}
 
-type_init(milkymist_vgafb_register_types)
diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
index b0513a8fba..7839643757 100644
--- a/hw/display/next-fb.c
+++ b/hw/display/next-fb.c
@@ -137,10 +137,6 @@ static const TypeInfo nextfb_info = {
     .instance_size = sizeof(NeXTFbState),
     .class_init    = nextfb_class_init,
 };
+TYPE_INFO(nextfb_info)
 
-static void nextfb_register_types(void)
-{
-    type_register_static(&nextfb_info);
-}
 
-type_init(nextfb_register_types)
diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index 61fefbffb3..0a65733a23 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -546,24 +546,20 @@ static const TypeInfo pl110_info = {
     .instance_init = pl110_init,
     .class_init    = pl110_class_init,
 };
+TYPE_INFO(pl110_info)
 
 static const TypeInfo pl110_versatile_info = {
     .name          = "pl110_versatile",
     .parent        = TYPE_PL110,
     .instance_init = pl110_versatile_init,
 };
+TYPE_INFO(pl110_versatile_info)
 
 static const TypeInfo pl111_info = {
     .name          = "pl111",
     .parent        = TYPE_PL110,
     .instance_init = pl111_init,
 };
+TYPE_INFO(pl111_info)
 
-static void pl110_register_types(void)
-{
-    type_register_static(&pl110_info);
-    type_register_static(&pl110_versatile_info);
-    type_register_static(&pl111_info);
-}
 
-type_init(pl110_register_types)
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 11871340e7..4b9f97f5aa 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2503,6 +2503,7 @@ static const TypeInfo qxl_pci_type_info = {
         { },
     },
 };
+TYPE_INFO(qxl_pci_type_info)
 
 static void qxl_primary_class_init(ObjectClass *klass, void *data)
 {
@@ -2521,6 +2522,7 @@ static const TypeInfo qxl_primary_info = {
     .parent        = TYPE_PCI_QXL,
     .class_init    = qxl_primary_class_init,
 };
+TYPE_INFO(qxl_primary_info)
 
 static void qxl_secondary_class_init(ObjectClass *klass, void *data)
 {
@@ -2537,12 +2539,6 @@ static const TypeInfo qxl_secondary_info = {
     .parent        = TYPE_PCI_QXL,
     .class_init    = qxl_secondary_class_init,
 };
+TYPE_INFO(qxl_secondary_info)
 
-static void qxl_register_types(void)
-{
-    type_register_static(&qxl_pci_type_info);
-    type_register_static(&qxl_primary_info);
-    type_register_static(&qxl_secondary_info);
-}
 
-type_init(qxl_register_types)
diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
index b18db97eeb..28e25acc96 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -53,10 +53,6 @@ static const TypeInfo ramfb_info = {
     .instance_size = sizeof(RAMFBStandaloneState),
     .class_init    = ramfb_class_initfn,
 };
+TYPE_INFO(ramfb_info)
 
-static void ramfb_register_types(void)
-{
-    type_register_static(&ramfb_info);
-}
 
-type_init(ramfb_register_types)
diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
index 3b82a8567f..7d0a97da6c 100644
--- a/hw/display/sii9022.c
+++ b/hw/display/sii9022.c
@@ -183,10 +183,6 @@ static const TypeInfo sii9022_info = {
     .instance_size = sizeof(sii9022_state),
     .class_init    = sii9022_class_init,
 };
+TYPE_INFO(sii9022_info)
 
-static void sii9022_register_types(void)
-{
-    type_register_static(&sii9022_info);
-}
 
-type_init(sii9022_register_types)
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 9cccc68c35..626f7393a0 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -2032,6 +2032,7 @@ static const TypeInfo sm501_sysbus_info = {
     .class_init    = sm501_sysbus_class_init,
     .instance_init = sm501_sysbus_init,
 };
+TYPE_INFO(sm501_sysbus_info)
 
 #define TYPE_PCI_SM501 "sm501"
 #define PCI_SM501(obj) OBJECT_CHECK(SM501PCIState, (obj), TYPE_PCI_SM501)
@@ -2112,11 +2113,6 @@ static const TypeInfo sm501_pci_info = {
         { },
     },
 };
+TYPE_INFO(sm501_pci_info)
 
-static void sm501_register_types(void)
-{
-    type_register_static(&sm501_sysbus_info);
-    type_register_static(&sm501_pci_info);
-}
 
-type_init(sm501_register_types)
diff --git a/hw/display/ssd0303.c b/hw/display/ssd0303.c
index 718378f6de..24e7fc1598 100644
--- a/hw/display/ssd0303.c
+++ b/hw/display/ssd0303.c
@@ -326,10 +326,6 @@ static const TypeInfo ssd0303_info = {
     .instance_size = sizeof(ssd0303_state),
     .class_init    = ssd0303_class_init,
 };
+TYPE_INFO(ssd0303_info)
 
-static void ssd0303_register_types(void)
-{
-    type_register_static(&ssd0303_info);
-}
 
-type_init(ssd0303_register_types)
diff --git a/hw/display/ssd0323.c b/hw/display/ssd0323.c
index 32d27f008a..056cc0b094 100644
--- a/hw/display/ssd0323.c
+++ b/hw/display/ssd0323.c
@@ -377,10 +377,6 @@ static const TypeInfo ssd0323_info = {
     .instance_size = sizeof(ssd0323_state),
     .class_init    = ssd0323_class_init,
 };
+TYPE_INFO(ssd0323_info)
 
-static void ssd03232_register_types(void)
-{
-    type_register_static(&ssd0323_info);
-}
 
-type_init(ssd03232_register_types)
diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index 1fb45b1aab..0d05421868 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -902,10 +902,6 @@ static const TypeInfo tcx_info = {
     .instance_init = tcx_initfn,
     .class_init    = tcx_class_init,
 };
+TYPE_INFO(tcx_info)
 
-static void tcx_register_types(void)
-{
-    type_register_static(&tcx_info);
-}
 
-type_init(tcx_register_types)
diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 3aaeeeca1e..1561f702b9 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -105,10 +105,6 @@ static const TypeInfo vga_isa_info = {
     .instance_size = sizeof(ISAVGAState),
     .class_init    = vga_isa_class_initfn,
 };
+TYPE_INFO(vga_isa_info)
 
-static void vga_isa_register_types(void)
-{
-    type_register_static(&vga_isa_info);
-}
 
-type_init(vga_isa_register_types)
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index a640fd866d..5e8ddc9ac5 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -374,6 +374,7 @@ static const TypeInfo vga_pci_type_info = {
         { },
     },
 };
+TYPE_INFO(vga_pci_type_info)
 
 static void vga_class_init(ObjectClass *klass, void *data)
 {
@@ -405,6 +406,7 @@ static const TypeInfo vga_info = {
     .instance_init = pci_std_vga_init,
     .class_init    = vga_class_init,
 };
+TYPE_INFO(vga_info)
 
 static const TypeInfo secondary_info = {
     .name          = "secondary-vga",
@@ -412,12 +414,6 @@ static const TypeInfo secondary_info = {
     .instance_init = pci_secondary_vga_init,
     .class_init    = secondary_class_init,
 };
+TYPE_INFO(secondary_info)
 
-static void vga_register_types(void)
-{
-    type_register_static(&vga_pci_type_info);
-    type_register_static(&vga_info);
-    type_register_static(&secondary_info);
-}
 
-type_init(vga_register_types)
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 51f1747c4a..b892774ce7 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -596,10 +596,6 @@ static const TypeInfo vhost_user_gpu_info = {
     .instance_finalize = vhost_user_gpu_instance_finalize,
     .class_init = vhost_user_gpu_class_init,
 };
+TYPE_INFO(vhost_user_gpu_info)
 
-static void vhost_user_gpu_register_types(void)
-{
-    type_register_static(&vhost_user_gpu_info);
-}
 
-type_init(vhost_user_gpu_register_types)
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 7961308606..6cc4858daa 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -232,14 +232,9 @@ static const TypeInfo virtio_gpu_base_info = {
     .class_init = virtio_gpu_base_class_init,
     .abstract = true
 };
+TYPE_INFO(virtio_gpu_base_info)
 
-static void
-virtio_register_types(void)
-{
-    type_register_static(&virtio_gpu_base_info);
-}
 
-type_init(virtio_register_types)
 
 QEMU_BUILD_BUG_ON(sizeof(struct virtio_gpu_ctrl_hdr)                != 24);
 QEMU_BUILD_BUG_ON(sizeof(struct virtio_gpu_update_cursor)           != 56);
diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index 34d8e93f28..8a71ee4f7e 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -63,6 +63,7 @@ static const TypeInfo virtio_gpu_pci_base_info = {
     .class_init = virtio_gpu_pci_base_class_init,
     .abstract = true
 };
+TYPE_INFO(virtio_gpu_pci_base_info)
 
 #define TYPE_VIRTIO_GPU_PCI "virtio-gpu-pci"
 #define VIRTIO_GPU_PCI(obj)                                 \
@@ -91,7 +92,6 @@ static const VirtioPCIDeviceTypeInfo virtio_gpu_pci_info = {
 
 static void virtio_gpu_pci_register_types(void)
 {
-    type_register_static(&virtio_gpu_pci_base_info);
     virtio_pci_types_register(&virtio_gpu_pci_info);
 }
 
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 5f0dd7c150..790ea40637 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1263,10 +1263,6 @@ static const TypeInfo virtio_gpu_info = {
     .instance_size = sizeof(VirtIOGPU),
     .class_init = virtio_gpu_class_init,
 };
+TYPE_INFO(virtio_gpu_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_gpu_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index f533d7d1b4..e1342c2ea1 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -199,6 +199,7 @@ static TypeInfo virtio_vga_base_info = {
     .class_init    = virtio_vga_base_class_init,
     .abstract      = true,
 };
+TYPE_INFO(virtio_vga_base_info)
 
 #define TYPE_VIRTIO_VGA "virtio-vga"
 
@@ -230,7 +231,6 @@ static VirtioPCIDeviceTypeInfo virtio_vga_info = {
 
 static void virtio_vga_register_types(void)
 {
-    type_register_static(&virtio_vga_base_info);
     virtio_pci_types_register(&virtio_vga_info);
 }
 
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 2579f6b218..487d29f5c0 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -1357,10 +1357,6 @@ static const TypeInfo vmsvga_info = {
         { },
     },
 };
+TYPE_INFO(vmsvga_info)
 
-static void vmsvga_register_types(void)
-{
-    type_register_static(&vmsvga_info);
-}
 
-type_init(vmsvga_register_types)
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index c56e6ec593..95accb9442 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1361,10 +1361,6 @@ static const TypeInfo xlnx_dp_info = {
     .instance_init = xlnx_dp_init,
     .class_init    = xlnx_dp_class_init,
 };
+TYPE_INFO(xlnx_dp_info)
 
-static void xlnx_dp_register_types(void)
-{
-    type_register_static(&xlnx_dp_info);
-}
 
-type_init(xlnx_dp_register_types)
diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index eb0002a2b9..f7478c3954 100644
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -401,10 +401,6 @@ static TypeInfo bcm2835_dma_info = {
     .class_init    = bcm2835_dma_class_init,
     .instance_init = bcm2835_dma_init,
 };
+TYPE_INFO(bcm2835_dma_info)
 
-static void bcm2835_dma_register_types(void)
-{
-    type_register_static(&bcm2835_dma_info);
-}
 
-type_init(bcm2835_dma_register_types)
diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index 6977d85ef8..6c433137a0 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -158,10 +158,6 @@ static const TypeInfo i82374_info = {
     .instance_size  = sizeof(I82374State),
     .class_init = i82374_class_init,
 };
+TYPE_INFO(i82374_info)
 
-static void i82374_register_types(void)
-{
-    type_register_static(&i82374_info);
-}
 
-type_init(i82374_register_types)
diff --git a/hw/dma/i8257.c b/hw/dma/i8257.c
index de5f696919..fe1639443b 100644
--- a/hw/dma/i8257.c
+++ b/hw/dma/i8257.c
@@ -624,13 +624,9 @@ static const TypeInfo i8257_info = {
         { }
     }
 };
+TYPE_INFO(i8257_info)
 
-static void i8257_register_types(void)
-{
-    type_register_static(&i8257_info);
-}
 
-type_init(i8257_register_types)
 
 void i8257_dma_init(ISABus *bus, bool high_page_enable)
 {
diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index f1a586b1d7..823646a29a 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -432,19 +432,15 @@ static const TypeInfo pl080_info = {
     .instance_init = pl080_init,
     .class_init    = pl080_class_init,
 };
+TYPE_INFO(pl080_info)
 
 static const TypeInfo pl081_info = {
     .name          = TYPE_PL081,
     .parent        = TYPE_PL080,
     .instance_init = pl081_init,
 };
+TYPE_INFO(pl081_info)
 
 /* The PL080 and PL081 are the same except for the number of channels
    they implement (8 and 2 respectively).  */
-static void pl080_register_types(void)
-{
-    type_register_static(&pl080_info);
-    type_register_static(&pl081_info);
-}
 
-type_init(pl080_register_types)
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 0bd63a43f5..3288f31678 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1674,10 +1674,6 @@ static const TypeInfo pl330_type_info = {
     .instance_size  = sizeof(PL330State),
     .class_init      = pl330_class_init,
 };
+TYPE_INFO(pl330_type_info)
 
-static void pl330_register_types(void)
-{
-    type_register_static(&pl330_type_info);
-}
 
-type_init(pl330_register_types)
diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c
index 7fa979180f..225aa5146f 100644
--- a/hw/dma/puv3_dma.c
+++ b/hw/dma/puv3_dma.c
@@ -109,10 +109,6 @@ static const TypeInfo puv3_dma_info = {
     .instance_size = sizeof(PUV3DMAState),
     .class_init = puv3_dma_class_init,
 };
+TYPE_INFO(puv3_dma_info)
 
-static void puv3_dma_register_type(void)
-{
-    type_register_static(&puv3_dma_info);
-}
 
-type_init(puv3_dma_register_type)
diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
index 78b2849bcb..b2f1f1b236 100644
--- a/hw/dma/pxa2xx_dma.c
+++ b/hw/dma/pxa2xx_dma.c
@@ -581,10 +581,6 @@ static const TypeInfo pxa2xx_dma_info = {
     .instance_init = pxa2xx_dma_init,
     .class_init    = pxa2xx_dma_class_init,
 };
+TYPE_INFO(pxa2xx_dma_info)
 
-static void pxa2xx_dma_register_types(void)
-{
-    type_register_static(&pxa2xx_dma_info);
-}
 
-type_init(pxa2xx_dma_register_types)
diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index 7eddc9a776..ccbda2ce82 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -718,6 +718,7 @@ static const TypeInfo rc4030_info = {
     .instance_init = rc4030_initfn,
     .class_init = rc4030_class_init,
 };
+TYPE_INFO(rc4030_info)
 
 static void rc4030_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
@@ -732,14 +733,9 @@ static const TypeInfo rc4030_iommu_memory_region_info = {
     .name = TYPE_RC4030_IOMMU_MEMORY_REGION,
     .class_init = rc4030_iommu_memory_region_class_init,
 };
+TYPE_INFO(rc4030_iommu_memory_region_info)
 
-static void rc4030_register_types(void)
-{
-    type_register_static(&rc4030_info);
-    type_register_static(&rc4030_iommu_memory_region_info);
-}
 
-type_init(rc4030_register_types)
 
 DeviceState *rc4030_init(rc4030_dma **dmas, IOMMUMemoryRegion **dma_mr)
 {
diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index bcd1626fbd..774669345b 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -286,6 +286,7 @@ static const TypeInfo sparc32_dma_device_info = {
     .instance_init = sparc32_dma_device_init,
     .class_init    = sparc32_dma_device_class_init,
 };
+TYPE_INFO(sparc32_dma_device_info)
 
 static void sparc32_espdma_device_init(Object *obj)
 {
@@ -327,6 +328,7 @@ static const TypeInfo sparc32_espdma_device_info = {
     .instance_init = sparc32_espdma_device_init,
     .class_init    = sparc32_espdma_device_class_init,
 };
+TYPE_INFO(sparc32_espdma_device_info)
 
 static void sparc32_ledma_device_init(Object *obj)
 {
@@ -365,6 +367,7 @@ static const TypeInfo sparc32_ledma_device_info = {
     .instance_init = sparc32_ledma_device_init,
     .class_init    = sparc32_ledma_device_class_init,
 };
+TYPE_INFO(sparc32_ledma_device_info)
 
 static void sparc32_dma_realize(DeviceState *dev, Error **errp)
 {
@@ -437,14 +440,7 @@ static const TypeInfo sparc32_dma_info = {
     .instance_init = sparc32_dma_init,
     .class_init    = sparc32_dma_class_init,
 };
+TYPE_INFO(sparc32_dma_info)
 
 
-static void sparc32_dma_register_types(void)
-{
-    type_register_static(&sparc32_dma_device_info);
-    type_register_static(&sparc32_espdma_device_info);
-    type_register_static(&sparc32_ledma_device_info);
-    type_register_static(&sparc32_dma_info);
-}
 
-type_init(sparc32_dma_register_types)
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index a4812e480a..4c5c0c994b 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -630,6 +630,7 @@ static const TypeInfo axidma_info = {
     .class_init    = axidma_class_init,
     .instance_init = xilinx_axidma_init,
 };
+TYPE_INFO(axidma_info)
 
 static const TypeInfo xilinx_axidma_data_stream_info = {
     .name          = TYPE_XILINX_AXI_DMA_DATA_STREAM,
@@ -642,6 +643,7 @@ static const TypeInfo xilinx_axidma_data_stream_info = {
         { }
     }
 };
+TYPE_INFO(xilinx_axidma_data_stream_info)
 
 static const TypeInfo xilinx_axidma_control_stream_info = {
     .name          = TYPE_XILINX_AXI_DMA_CONTROL_STREAM,
@@ -654,12 +656,6 @@ static const TypeInfo xilinx_axidma_control_stream_info = {
         { }
     }
 };
+TYPE_INFO(xilinx_axidma_control_stream_info)
 
-static void xilinx_axidma_register_types(void)
-{
-    type_register_static(&axidma_info);
-    type_register_static(&xilinx_axidma_data_stream_info);
-    type_register_static(&xilinx_axidma_control_stream_info);
-}
 
-type_init(xilinx_axidma_register_types)
diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index fa38a55634..6d7df3a589 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -838,10 +838,6 @@ static const TypeInfo zdma_info = {
     .class_init    = zdma_class_init,
     .instance_init = zdma_init,
 };
+TYPE_INFO(zdma_info)
 
-static void zdma_register_types(void)
-{
-    type_register_static(&zdma_info);
-}
 
-type_init(zdma_register_types)
diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
index e33112b6f0..4ee247d855 100644
--- a/hw/dma/xlnx-zynq-devcfg.c
+++ b/hw/dma/xlnx-zynq-devcfg.c
@@ -393,10 +393,6 @@ static const TypeInfo xlnx_zynq_devcfg_info = {
     .instance_init  = xlnx_zynq_devcfg_init,
     .class_init     = xlnx_zynq_devcfg_class_init,
 };
+TYPE_INFO(xlnx_zynq_devcfg_info)
 
-static void xlnx_zynq_devcfg_register_types(void)
-{
-    type_register_static(&xlnx_zynq_devcfg_info);
-}
 
-type_init(xlnx_zynq_devcfg_register_types)
diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index b40c897de2..c5b0864a08 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -608,11 +608,8 @@ static const TypeInfo xlnx_dpdma_info = {
     .instance_init = xlnx_dpdma_init,
     .class_init    = xlnx_dpdma_class_init,
 };
+TYPE_INFO(xlnx_dpdma_info)
 
-static void xlnx_dpdma_register_types(void)
-{
-    type_register_static(&xlnx_dpdma_info);
-}
 
 size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
                                     bool one_desc)
@@ -787,4 +784,3 @@ void xlnx_dpdma_trigger_vsync_irq(XlnxDPDMAState *s)
     xlnx_dpdma_update_irq(s);
 }
 
-type_init(xlnx_dpdma_register_types)
diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 985a259e05..f00630e2ea 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -971,6 +971,7 @@ static const TypeInfo aspeed_gpio_info = {
     .class_init     = aspeed_gpio_class_init,
     .abstract       = true,
 };
+TYPE_INFO(aspeed_gpio_info)
 
 static const TypeInfo aspeed_gpio_ast2400_info = {
     .name           = TYPE_ASPEED_GPIO "-ast2400",
@@ -978,6 +979,7 @@ static const TypeInfo aspeed_gpio_ast2400_info = {
     .class_init     = aspeed_gpio_ast2400_class_init,
     .instance_init  = aspeed_gpio_init,
 };
+TYPE_INFO(aspeed_gpio_ast2400_info)
 
 static const TypeInfo aspeed_gpio_ast2500_info = {
     .name           = TYPE_ASPEED_GPIO "-ast2500",
@@ -985,6 +987,7 @@ static const TypeInfo aspeed_gpio_ast2500_info = {
     .class_init     = aspeed_gpio_2500_class_init,
     .instance_init  = aspeed_gpio_init,
 };
+TYPE_INFO(aspeed_gpio_ast2500_info)
 
 static const TypeInfo aspeed_gpio_ast2600_3_6v_info = {
     .name           = TYPE_ASPEED_GPIO "-ast2600",
@@ -992,6 +995,7 @@ static const TypeInfo aspeed_gpio_ast2600_3_6v_info = {
     .class_init     = aspeed_gpio_ast2600_3_6v_class_init,
     .instance_init  = aspeed_gpio_init,
 };
+TYPE_INFO(aspeed_gpio_ast2600_3_6v_info)
 
 static const TypeInfo aspeed_gpio_ast2600_1_8v_info = {
     .name           = TYPE_ASPEED_GPIO "-ast2600-1_8v",
@@ -999,14 +1003,6 @@ static const TypeInfo aspeed_gpio_ast2600_1_8v_info = {
     .class_init     = aspeed_gpio_ast2600_1_8v_class_init,
     .instance_init  = aspeed_gpio_init,
 };
+TYPE_INFO(aspeed_gpio_ast2600_1_8v_info)
 
-static void aspeed_gpio_register_types(void)
-{
-    type_register_static(&aspeed_gpio_info);
-    type_register_static(&aspeed_gpio_ast2400_info);
-    type_register_static(&aspeed_gpio_ast2500_info);
-    type_register_static(&aspeed_gpio_ast2600_3_6v_info);
-    type_register_static(&aspeed_gpio_ast2600_1_8v_info);
-}
 
-type_init(aspeed_gpio_register_types);
diff --git a/hw/gpio/bcm2835_gpio.c b/hw/gpio/bcm2835_gpio.c
index abdddbc67c..2ea64a77e8 100644
--- a/hw/gpio/bcm2835_gpio.c
+++ b/hw/gpio/bcm2835_gpio.c
@@ -336,10 +336,6 @@ static const TypeInfo bcm2835_gpio_info = {
     .instance_init = bcm2835_gpio_init,
     .class_init    = bcm2835_gpio_class_init,
 };
+TYPE_INFO(bcm2835_gpio_info)
 
-static void bcm2835_gpio_register_types(void)
-{
-    type_register_static(&bcm2835_gpio_info);
-}
 
-type_init(bcm2835_gpio_register_types)
diff --git a/hw/gpio/gpio_key.c b/hw/gpio/gpio_key.c
index 46bbd42772..571b74a5e5 100644
--- a/hw/gpio/gpio_key.c
+++ b/hw/gpio/gpio_key.c
@@ -99,10 +99,6 @@ static const TypeInfo gpio_key_info = {
     .instance_size = sizeof(GPIOKEYState),
     .class_init    = gpio_key_class_init,
 };
+TYPE_INFO(gpio_key_info)
 
-static void gpio_key_register_types(void)
-{
-    type_register_static(&gpio_key_info);
-}
 
-type_init(gpio_key_register_types)
diff --git a/hw/gpio/imx_gpio.c b/hw/gpio/imx_gpio.c
index 7a591804a9..df533846f7 100644
--- a/hw/gpio/imx_gpio.c
+++ b/hw/gpio/imx_gpio.c
@@ -346,10 +346,6 @@ static const TypeInfo imx_gpio_info = {
     .instance_size = sizeof(IMXGPIOState),
     .class_init = imx_gpio_class_init,
 };
+TYPE_INFO(imx_gpio_info)
 
-static void imx_gpio_register_types(void)
-{
-    type_register_static(&imx_gpio_info);
-}
 
-type_init(imx_gpio_register_types)
diff --git a/hw/gpio/max7310.c b/hw/gpio/max7310.c
index bebb4030d2..3a8e4ab1d5 100644
--- a/hw/gpio/max7310.c
+++ b/hw/gpio/max7310.c
@@ -215,10 +215,6 @@ static const TypeInfo max7310_info = {
     .instance_size = sizeof(MAX7310State),
     .class_init    = max7310_class_init,
 };
+TYPE_INFO(max7310_info)
 
-static void max7310_register_types(void)
-{
-    type_register_static(&max7310_info);
-}
 
-type_init(max7310_register_types)
diff --git a/hw/gpio/mpc8xxx.c b/hw/gpio/mpc8xxx.c
index 1d99667094..b1bdcc2851 100644
--- a/hw/gpio/mpc8xxx.c
+++ b/hw/gpio/mpc8xxx.c
@@ -214,10 +214,6 @@ static const TypeInfo mpc8xxx_gpio_info = {
     .instance_init = mpc8xxx_gpio_initfn,
     .class_init    = mpc8xxx_gpio_class_init,
 };
+TYPE_INFO(mpc8xxx_gpio_info)
 
-static void mpc8xxx_gpio_register_types(void)
-{
-    type_register_static(&mpc8xxx_gpio_info);
-}
 
-type_init(mpc8xxx_gpio_register_types)
diff --git a/hw/gpio/nrf51_gpio.c b/hw/gpio/nrf51_gpio.c
index b47fddf4ed..e59d975a0c 100644
--- a/hw/gpio/nrf51_gpio.c
+++ b/hw/gpio/nrf51_gpio.c
@@ -309,10 +309,6 @@ static const TypeInfo nrf51_gpio_info = {
     .instance_init = nrf51_gpio_init,
     .class_init = nrf51_gpio_class_init
 };
+TYPE_INFO(nrf51_gpio_info)
 
-static void nrf51_gpio_register_types(void)
-{
-    type_register_static(&nrf51_gpio_info);
-}
 
-type_init(nrf51_gpio_register_types)
diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index f662c4cb95..f8ab9a49df 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -767,6 +767,7 @@ static const TypeInfo omap_gpio_info = {
     .instance_init = omap_gpio_init,
     .class_init    = omap_gpio_class_init,
 };
+TYPE_INFO(omap_gpio_info)
 
 void omap2_gpio_set_iclk(omap2_gpif *gpio, omap_clk clk)
 {
@@ -801,11 +802,6 @@ static const TypeInfo omap2_gpio_info = {
     .instance_size = sizeof(struct omap2_gpif_s),
     .class_init    = omap2_gpio_class_init,
 };
+TYPE_INFO(omap2_gpio_info)
 
-static void omap_gpio_register_types(void)
-{
-    type_register_static(&omap_gpio_info);
-    type_register_static(&omap2_gpio_info);
-}
 
-type_init(omap_gpio_register_types)
diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 6d3c36bc16..b6ef1c7340 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -385,17 +385,13 @@ static const TypeInfo pl061_info = {
     .instance_init = pl061_init,
     .class_init    = pl061_class_init,
 };
+TYPE_INFO(pl061_info)
 
 static const TypeInfo pl061_luminary_info = {
     .name          = "pl061_luminary",
     .parent        = TYPE_PL061,
     .instance_init = pl061_luminary_init,
 };
+TYPE_INFO(pl061_luminary_info)
 
-static void pl061_register_types(void)
-{
-    type_register_static(&pl061_info);
-    type_register_static(&pl061_luminary_info);
-}
 
-type_init(pl061_register_types)
diff --git a/hw/gpio/puv3_gpio.c b/hw/gpio/puv3_gpio.c
index 7362b6715f..4c2edda889 100644
--- a/hw/gpio/puv3_gpio.c
+++ b/hw/gpio/puv3_gpio.c
@@ -144,10 +144,6 @@ static const TypeInfo puv3_gpio_info = {
     .instance_size = sizeof(PUV3GPIOState),
     .class_init = puv3_gpio_class_init,
 };
+TYPE_INFO(puv3_gpio_info)
 
-static void puv3_gpio_register_type(void)
-{
-    type_register_static(&puv3_gpio_info);
-}
 
-type_init(puv3_gpio_register_type)
diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index 258e926493..1100850a6c 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -255,13 +255,9 @@ static const TypeInfo scoop_sysbus_info = {
     .instance_init = scoop_init,
     .class_init    = scoop_sysbus_class_init,
 };
+TYPE_INFO(scoop_sysbus_info)
 
-static void scoop_register_types(void)
-{
-    type_register_static(&scoop_sysbus_info);
-}
 
-type_init(scoop_register_types)
 
 /* Write the bootloader parameters memory area.  */
 
diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 7f0c6223a8..27faa97644 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -601,10 +601,6 @@ static const TypeInfo dino_pcihost_info = {
     .instance_size = sizeof(DinoState),
     .class_init    = dino_pcihost_class_init,
 };
+TYPE_INFO(dino_pcihost_info)
 
-static void dino_register_types(void)
-{
-    type_register_static(&dino_pcihost_info);
-}
 
-type_init(dino_register_types)
diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 19974034f3..8a54923c26 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -359,10 +359,6 @@ static const TypeInfo lasi_pcihost_info = {
     .instance_size = sizeof(LasiState),
     .class_init    = lasi_class_init,
 };
+TYPE_INFO(lasi_pcihost_info)
 
-static void lasi_register_types(void)
-{
-    type_register_static(&lasi_pcihost_info);
-}
 
-type_init(lasi_register_types)
diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index 844d00776d..07c9214bf1 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -159,13 +159,9 @@ static const TypeInfo synic_type_info = {
     .instance_size = sizeof(SynICState),
     .class_init = synic_class_init,
 };
+TYPE_INFO(synic_type_info)
 
-static void synic_register_types(void)
-{
-    type_register_static(&synic_type_info);
-}
 
-type_init(synic_register_types)
 
 /*
  * KVM has its own message producers (SynIC timers).  To guarantee
diff --git a/hw/hyperv/hyperv_testdev.c b/hw/hyperv/hyperv_testdev.c
index 88a5a63782..c83d0a9325 100644
--- a/hw/hyperv/hyperv_testdev.c
+++ b/hw/hyperv/hyperv_testdev.c
@@ -319,9 +319,5 @@ static const TypeInfo hv_test_dev_info = {
     .instance_size  = sizeof(HypervTestDev),
     .class_init     = hv_test_dev_class_init,
 };
+TYPE_INFO(hv_test_dev_info)
 
-static void hv_test_dev_register_types(void)
-{
-    type_register_static(&hv_test_dev_info);
-}
-type_init(hv_test_dev_register_types);
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 75af6b83dd..d4cc8edfba 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -2485,6 +2485,7 @@ static const TypeInfo vmbus_dev_type_info = {
     .class_init = vmbus_dev_class_init,
     .instance_init = vmbus_dev_instance_init,
 };
+TYPE_INFO(vmbus_dev_type_info)
 
 static void vmbus_realize(BusState *bus, Error **errp)
 {
@@ -2697,6 +2698,7 @@ static const TypeInfo vmbus_type_info = {
     .instance_size = sizeof(VMBus),
     .class_init = vmbus_class_init,
 };
+TYPE_INFO(vmbus_type_info)
 
 static void vmbus_bridge_realize(DeviceState *dev, Error **errp)
 {
@@ -2762,12 +2764,6 @@ static const TypeInfo vmbus_bridge_type_info = {
     .instance_size = sizeof(VMBusBridge),
     .class_init = vmbus_bridge_class_init,
 };
+TYPE_INFO(vmbus_bridge_type_info)
 
-static void vmbus_register_types(void)
-{
-    type_register_static(&vmbus_bridge_type_info);
-    type_register_static(&vmbus_dev_type_info);
-    type_register_static(&vmbus_type_info);
-}
 
-type_init(vmbus_register_types)
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 518a3f5c6f..ecbbc22524 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -845,6 +845,7 @@ static const TypeInfo aspeed_i2c_info = {
     .class_size = sizeof(AspeedI2CClass),
     .abstract   = true,
 };
+TYPE_INFO(aspeed_i2c_info)
 
 static qemu_irq aspeed_2400_i2c_bus_get_irq(AspeedI2CBus *bus)
 {
@@ -880,6 +881,7 @@ static const TypeInfo aspeed_2400_i2c_info = {
     .parent = TYPE_ASPEED_I2C,
     .class_init = aspeed_2400_i2c_class_init,
 };
+TYPE_INFO(aspeed_2400_i2c_info)
 
 static qemu_irq aspeed_2500_i2c_bus_get_irq(AspeedI2CBus *bus)
 {
@@ -914,6 +916,7 @@ static const TypeInfo aspeed_2500_i2c_info = {
     .parent = TYPE_ASPEED_I2C,
     .class_init = aspeed_2500_i2c_class_init,
 };
+TYPE_INFO(aspeed_2500_i2c_info)
 
 static qemu_irq aspeed_2600_i2c_bus_get_irq(AspeedI2CBus *bus)
 {
@@ -947,16 +950,9 @@ static const TypeInfo aspeed_2600_i2c_info = {
     .parent = TYPE_ASPEED_I2C,
     .class_init = aspeed_2600_i2c_class_init,
 };
+TYPE_INFO(aspeed_2600_i2c_info)
 
-static void aspeed_i2c_register_types(void)
-{
-    type_register_static(&aspeed_i2c_info);
-    type_register_static(&aspeed_2400_i2c_info);
-    type_register_static(&aspeed_2500_i2c_info);
-    type_register_static(&aspeed_2600_i2c_info);
-}
 
-type_init(aspeed_i2c_register_types)
 
 
 I2CBus *aspeed_i2c_get_bus(AspeedI2CState *s, int busnr)
diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index b000952b98..566ccf0d74 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -216,10 +216,6 @@ static const TypeInfo gpio_i2c_info = {
     .instance_init = gpio_i2c_init,
     .class_init    = gpio_i2c_class_init,
 };
+TYPE_INFO(gpio_i2c_info)
 
-static void bitbang_i2c_register_types(void)
-{
-    type_register_static(&gpio_i2c_info);
-}
 
-type_init(bitbang_i2c_register_types)
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 21ec52ac5a..81bfce2797 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -27,6 +27,7 @@ static const TypeInfo i2c_bus_info = {
     .parent = TYPE_BUS,
     .instance_size = sizeof(I2CBus),
 };
+TYPE_INFO(i2c_bus_info)
 
 static int i2c_bus_pre_save(void *opaque)
 {
@@ -306,11 +307,6 @@ static const TypeInfo i2c_slave_type_info = {
     .class_size = sizeof(I2CSlaveClass),
     .class_init = i2c_slave_class_init,
 };
+TYPE_INFO(i2c_slave_type_info)
 
-static void i2c_slave_register_types(void)
-{
-    type_register_static(&i2c_bus_info);
-    type_register_static(&i2c_slave_type_info);
-}
 
-type_init(i2c_slave_register_types)
diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
index a600f65560..3a803ebc8b 100644
--- a/hw/i2c/exynos4210_i2c.c
+++ b/hw/i2c/exynos4210_i2c.c
@@ -324,10 +324,6 @@ static const TypeInfo exynos4210_i2c_type_info = {
     .instance_init = exynos4210_i2c_init,
     .class_init = exynos4210_i2c_class_init,
 };
+TYPE_INFO(exynos4210_i2c_type_info)
 
-static void exynos4210_i2c_register_types(void)
-{
-    type_register_static(&exynos4210_i2c_type_info);
-}
 
-type_init(exynos4210_i2c_register_types)
diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
index 2e02e1c4fa..a38eb18e33 100644
--- a/hw/i2c/imx_i2c.c
+++ b/hw/i2c/imx_i2c.c
@@ -324,10 +324,6 @@ static const TypeInfo imx_i2c_type_info = {
     .instance_size = sizeof(IMXI2CState),
     .class_init = imx_i2c_class_init,
 };
+TYPE_INFO(imx_i2c_type_info)
 
-static void imx_i2c_register_types(void)
-{
-    type_register_static(&imx_i2c_type_info);
-}
 
-type_init(imx_i2c_register_types)
diff --git a/hw/i2c/microbit_i2c.c b/hw/i2c/microbit_i2c.c
index 8024739820..51eb28bf21 100644
--- a/hw/i2c/microbit_i2c.c
+++ b/hw/i2c/microbit_i2c.c
@@ -120,10 +120,6 @@ static const TypeInfo microbit_i2c_info = {
     .instance_size = sizeof(MicrobitI2CState),
     .class_init = microbit_i2c_class_init,
 };
+TYPE_INFO(microbit_i2c_info)
 
-static void microbit_i2c_register_types(void)
-{
-    type_register_static(&microbit_i2c_info);
-}
 
-type_init(microbit_i2c_register_types)
diff --git a/hw/i2c/mpc_i2c.c b/hw/i2c/mpc_i2c.c
index 9a724f3a3e..c65fb2775b 100644
--- a/hw/i2c/mpc_i2c.c
+++ b/hw/i2c/mpc_i2c.c
@@ -351,10 +351,6 @@ static const TypeInfo mpc_i2c_type_info = {
     .instance_size = sizeof(MPCI2CState),
     .class_init    = mpc_i2c_class_init,
 };
+TYPE_INFO(mpc_i2c_type_info)
 
-static void mpc_i2c_register_types(void)
-{
-    type_register_static(&mpc_i2c_type_info);
-}
 
-type_init(mpc_i2c_register_types)
diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
index e5d205dda5..ba7b7ee734 100644
--- a/hw/i2c/omap_i2c.c
+++ b/hw/i2c/omap_i2c.c
@@ -534,11 +534,8 @@ static const TypeInfo omap_i2c_info = {
     .instance_init = omap_i2c_init,
     .class_init = omap_i2c_class_init,
 };
+TYPE_INFO(omap_i2c_info)
 
-static void omap_i2c_register_types(void)
-{
-    type_register_static(&omap_i2c_info);
-}
 
 I2CBus *omap_i2c_bus(DeviceState *omap_i2c)
 {
@@ -546,4 +543,3 @@ I2CBus *omap_i2c_bus(DeviceState *omap_i2c)
     return s->bus;
 }
 
-type_init(omap_i2c_register_types)
diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
index c0a8e04567..49ca51516e 100644
--- a/hw/i2c/ppc4xx_i2c.c
+++ b/hw/i2c/ppc4xx_i2c.c
@@ -363,10 +363,6 @@ static const TypeInfo ppc4xx_i2c_type_info = {
     .instance_init = ppc4xx_i2c_init,
     .class_init = ppc4xx_i2c_class_init,
 };
+TYPE_INFO(ppc4xx_i2c_type_info)
 
-static void ppc4xx_i2c_register_types(void)
-{
-    type_register_static(&ppc4xx_i2c_type_info);
-}
 
-type_init(ppc4xx_i2c_register_types)
diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
index b7def9eeb8..cc506b6d4a 100644
--- a/hw/i2c/smbus_eeprom.c
+++ b/hw/i2c/smbus_eeprom.c
@@ -157,13 +157,9 @@ static const TypeInfo smbus_eeprom_info = {
     .instance_size = sizeof(SMBusEEPROMDevice),
     .class_init    = smbus_eeprom_class_initfn,
 };
+TYPE_INFO(smbus_eeprom_info)
 
-static void smbus_eeprom_register_types(void)
-{
-    type_register_static(&smbus_eeprom_info);
-}
 
-type_init(smbus_eeprom_register_types)
 
 void smbus_eeprom_init_one(I2CBus *smbus, uint8_t address, uint8_t *eeprom_buf)
 {
diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index 48f1ff4191..37a41b5b77 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -146,10 +146,6 @@ static const TypeInfo ich9_smb_info = {
         { },
     },
 };
+TYPE_INFO(ich9_smb_info)
 
-static void ich9_smb_register(void)
-{
-    type_register_static(&ich9_smb_info);
-}
 
-type_init(ich9_smb_register);
diff --git a/hw/i2c/smbus_slave.c b/hw/i2c/smbus_slave.c
index 5d10e27664..6a8b0846c7 100644
--- a/hw/i2c/smbus_slave.c
+++ b/hw/i2c/smbus_slave.c
@@ -228,10 +228,6 @@ static const TypeInfo smbus_device_type_info = {
     .class_size = sizeof(SMBusDeviceClass),
     .class_init = smbus_device_class_init,
 };
+TYPE_INFO(smbus_device_type_info)
 
-static void smbus_device_register_types(void)
-{
-    type_register_static(&smbus_device_type_info);
-}
 
-type_init(smbus_device_register_types)
diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index da8cda2ec1..13ddddef90 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -102,10 +102,6 @@ static const TypeInfo versatile_i2c_info = {
     .instance_size = sizeof(VersatileI2CState),
     .instance_init = versatile_i2c_init,
 };
+TYPE_INFO(versatile_i2c_info)
 
-static void versatile_i2c_register_types(void)
-{
-    type_register_static(&versatile_i2c_info);
-}
 
-type_init(versatile_i2c_register_types)
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 88373047e2..dc89bf39f5 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1620,6 +1620,7 @@ static const TypeInfo amdvi = {
     .instance_init = amdvi_instance_init,
     .class_init = amdvi_class_init
 };
+TYPE_INFO(amdvi)
 
 static const TypeInfo amdviPCI = {
     .name = "AMDVI-PCI",
@@ -1630,6 +1631,7 @@ static const TypeInfo amdviPCI = {
         { },
     },
 };
+TYPE_INFO(amdviPCI)
 
 static void amdvi_iommu_memory_region_class_init(ObjectClass *klass, void *data)
 {
@@ -1644,12 +1646,6 @@ static const TypeInfo amdvi_iommu_memory_region_info = {
     .name = TYPE_AMD_IOMMU_MEMORY_REGION,
     .class_init = amdvi_iommu_memory_region_class_init,
 };
+TYPE_INFO(amdvi_iommu_memory_region_info)
 
-static void amdviPCI_register_types(void)
-{
-    type_register_static(&amdviPCI);
-    type_register_static(&amdvi);
-    type_register_static(&amdvi_iommu_memory_region_info);
-}
 
-type_init(amdviPCI_register_types);
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index ac4c99258e..188e18dc28 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3874,6 +3874,7 @@ static const TypeInfo vtd_info = {
     .instance_size = sizeof(IntelIOMMUState),
     .class_init    = vtd_class_init,
 };
+TYPE_INFO(vtd_info)
 
 static void vtd_iommu_memory_region_class_init(ObjectClass *klass,
                                                      void *data)
@@ -3890,11 +3891,6 @@ static const TypeInfo vtd_iommu_memory_region_info = {
     .name = TYPE_INTEL_IOMMU_MEMORY_REGION,
     .class_init = vtd_iommu_memory_region_class_init,
 };
+TYPE_INFO(vtd_iommu_memory_region_info)
 
-static void vtd_register_types(void)
-{
-    type_register_static(&vtd_info);
-    type_register_static(&vtd_iommu_memory_region_info);
-}
 
-type_init(vtd_register_types)
diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
index 4eb2d77b87..06dd7f8c9a 100644
--- a/hw/i386/kvm/apic.c
+++ b/hw/i386/kvm/apic.c
@@ -257,10 +257,6 @@ static const TypeInfo kvm_apic_info = {
     .instance_size = sizeof(APICCommonState),
     .class_init = kvm_apic_class_init,
 };
+TYPE_INFO(kvm_apic_info)
 
-static void kvm_apic_register_types(void)
-{
-    type_register_static(&kvm_apic_info);
-}
 
-type_init(kvm_apic_register_types)
diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index 64283358f9..e9f57d0e2b 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -326,6 +326,7 @@ static const TypeInfo kvmclock_info = {
     .instance_size = sizeof(KVMClockState),
     .class_init    = kvmclock_class_init,
 };
+TYPE_INFO(kvmclock_info)
 
 /* Note: Must be called after VCPU initialization. */
 void kvmclock_create(void)
@@ -339,9 +340,4 @@ void kvmclock_create(void)
     }
 }
 
-static void kvmclock_register_types(void)
-{
-    type_register_static(&kvmclock_info);
-}
 
-type_init(kvmclock_register_types)
diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
index 876f5aa6fa..0f3d10d123 100644
--- a/hw/i386/kvm/i8254.c
+++ b/hw/i386/kvm/i8254.c
@@ -332,10 +332,6 @@ static const TypeInfo kvm_pit_info = {
     .class_init = kvm_pit_class_init,
     .class_size = sizeof(KVMPITClass),
 };
+TYPE_INFO(kvm_pit_info)
 
-static void kvm_pit_register(void)
-{
-    type_register_static(&kvm_pit_info);
-}
 
-type_init(kvm_pit_register)
diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
index e404fdcdac..f7844260d5 100644
--- a/hw/i386/kvm/i8259.c
+++ b/hw/i386/kvm/i8259.c
@@ -158,10 +158,6 @@ static const TypeInfo kvm_i8259_info = {
     .class_init = kvm_i8259_class_init,
     .class_size = sizeof(KVMPICClass),
 };
+TYPE_INFO(kvm_i8259_info)
 
-static void kvm_pic_register_types(void)
-{
-    type_register_static(&kvm_i8259_info);
-}
 
-type_init(kvm_pic_register_types)
diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index 4ba8e47251..751cc5b6e0 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -158,10 +158,6 @@ static const TypeInfo kvm_ioapic_info = {
     .instance_size = sizeof(KVMIOAPICState),
     .class_init = kvm_ioapic_class_init,
 };
+TYPE_INFO(kvm_ioapic_info)
 
-static void kvm_ioapic_register_types(void)
-{
-    type_register_static(&kvm_ioapic_info);
-}
 
-type_init(kvm_ioapic_register_types)
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 51639202c2..a08519ee70 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -863,10 +863,6 @@ static const TypeInfo vapic_type = {
     .instance_size = sizeof(VAPICROMState),
     .class_init    = vapic_class_init,
 };
+TYPE_INFO(vapic_type)
 
-static void vapic_register(void)
-{
-    type_register_static(&vapic_type);
-}
 
-type_init(vapic_register);
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 81d0888930..a332e9b9e1 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -527,9 +527,5 @@ static const TypeInfo microvm_machine_info = {
          { }
     },
 };
+TYPE_INFO(microvm_machine_info)
 
-static void microvm_machine_init(void)
-{
-    type_register_static(&microvm_machine_info);
-}
-type_init(microvm_machine_init);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 5d8d5ef8b3..391b82205b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2021,10 +2021,6 @@ static const TypeInfo pc_machine_info = {
          { }
     },
 };
+TYPE_INFO(pc_machine_info)
 
-static void pc_machine_register_types(void)
-{
-    type_register_static(&pc_machine_info);
-}
 
-type_init(pc_machine_register_types)
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 32b1453e6a..93740d1e87 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -918,12 +918,8 @@ static TypeInfo isa_bridge_info = {
         { },
     },
 };
+TYPE_INFO(isa_bridge_info)
 
-static void pt_graphics_register_types(void)
-{
-    type_register_static(&isa_bridge_info);
-}
-type_init(pt_graphics_register_types)
 
 void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
 {
diff --git a/hw/i386/port92.c b/hw/i386/port92.c
index 19866c44ef..cc41fb034f 100644
--- a/hw/i386/port92.c
+++ b/hw/i386/port92.c
@@ -117,10 +117,6 @@ static const TypeInfo port92_info = {
     .instance_init = port92_initfn,
     .class_init    = port92_class_initfn,
 };
+TYPE_INFO(port92_info)
 
-static void port92_register_types(void)
-{
-    type_register_static(&port92_info);
-}
 
-type_init(port92_register_types)
diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index ba5c987bd2..cea1924e69 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -316,10 +316,6 @@ static const TypeInfo vmmouse_info = {
     .instance_size = sizeof(VMMouseState),
     .class_init    = vmmouse_class_initfn,
 };
+TYPE_INFO(vmmouse_info)
 
-static void vmmouse_register_types(void)
-{
-    type_register_static(&vmmouse_info);
-}
 
-type_init(vmmouse_register_types)
diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index 89bda9108e..6379e14401 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -303,10 +303,6 @@ static const TypeInfo vmport_info = {
     .instance_size = sizeof(VMPortState),
     .class_init    = vmport_class_initfn,
 };
+TYPE_INFO(vmport_info)
 
-static void vmport_register_types(void)
-{
-    type_register_static(&vmport_info);
-}
 
-type_init(vmport_register_types)
diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
index 5f4301639c..2f5fc9992c 100644
--- a/hw/i386/x86-iommu.c
+++ b/hw/i386/x86-iommu.c
@@ -169,10 +169,6 @@ static const TypeInfo x86_iommu_info = {
     .class_size    = sizeof(X86IOMMUClass),
     .abstract      = true,
 };
+TYPE_INFO(x86_iommu_info)
 
-static void x86_iommu_register_types(void)
-{
-    type_register_static(&x86_iommu_info);
-}
 
-type_init(x86_iommu_register_types)
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index cf384b9743..1d10282516 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -965,10 +965,6 @@ static const TypeInfo x86_machine_info = {
          { }
     },
 };
+TYPE_INFO(x86_machine_info)
 
-static void x86_machine_register_types(void)
-{
-    type_register_static(&x86_machine_info);
-}
 
-type_init(x86_machine_register_types)
diff --git a/hw/i386/xen/xen_apic.c b/hw/i386/xen/xen_apic.c
index 7c7a60b166..9578463a48 100644
--- a/hw/i386/xen/xen_apic.c
+++ b/hw/i386/xen/xen_apic.c
@@ -94,10 +94,6 @@ static const TypeInfo xen_apic_info = {
     .instance_size = sizeof(APICCommonState),
     .class_init = xen_apic_class_init,
 };
+TYPE_INFO(xen_apic_info)
 
-static void xen_apic_register_types(void)
-{
-    type_register_static(&xen_apic_info);
-}
 
-type_init(xen_apic_register_types)
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index a1492fdecd..93de73323b 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -523,10 +523,6 @@ static const TypeInfo xen_platform_info = {
         { },
     },
 };
+TYPE_INFO(xen_platform_info)
 
-static void xen_platform_register_types(void)
-{
-    type_register_static(&xen_platform_info);
-}
 
-type_init(xen_platform_register_types)
diff --git a/hw/i386/xen/xen_pvdevice.c b/hw/i386/xen/xen_pvdevice.c
index ee2610c7a0..d62d26e0b6 100644
--- a/hw/i386/xen/xen_pvdevice.c
+++ b/hw/i386/xen/xen_pvdevice.c
@@ -145,10 +145,6 @@ static const TypeInfo xen_pv_type_info = {
         { },
     },
 };
+TYPE_INFO(xen_pv_type_info)
 
-static void xen_pv_register_types(void)
-{
-    type_register_static(&xen_pv_type_info);
-}
 
-type_init(xen_pv_register_types)
diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c
index 227e747ba7..84197b794d 100644
--- a/hw/ide/ahci-allwinner.c
+++ b/hw/ide/ahci-allwinner.c
@@ -118,10 +118,6 @@ static const TypeInfo allwinner_ahci_info = {
     .instance_init = allwinner_ahci_init,
     .class_init    = allwinner_ahci_class_init,
 };
+TYPE_INFO(allwinner_ahci_info)
 
-static void sysbus_ahci_register_types(void)
-{
-    type_register_static(&allwinner_ahci_info);
-}
 
-type_init(sysbus_ahci_register_types)
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 009120f88b..299a9bba56 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1808,13 +1808,9 @@ static const TypeInfo sysbus_ahci_info = {
     .instance_init = sysbus_ahci_init,
     .class_init    = sysbus_ahci_class_init,
 };
+TYPE_INFO(sysbus_ahci_info)
 
-static void sysbus_ahci_register_types(void)
-{
-    type_register_static(&sysbus_ahci_info);
-}
 
-type_init(sysbus_ahci_register_types)
 
 int32_t ahci_get_num_ports(PCIDevice *dev)
 {
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index c254631485..390a3dc679 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -342,10 +342,6 @@ static const TypeInfo cmd646_ide_info = {
     .parent        = TYPE_PCI_IDE,
     .class_init    = cmd646_ide_class_init,
 };
+TYPE_INFO(cmd646_ide_info)
 
-static void cmd646_ide_register_types(void)
-{
-    type_register_static(&cmd646_ide_info);
-}
 
-type_init(cmd646_ide_register_types)
diff --git a/hw/ide/ich.c b/hw/ide/ich.c
index eff3188fff..f7fb430a3c 100644
--- a/hw/ide/ich.c
+++ b/hw/ide/ich.c
@@ -188,10 +188,6 @@ static const TypeInfo ich_ahci_info = {
         { },
     },
 };
+TYPE_INFO(ich_ahci_info)
 
-static void ich_ahci_register_types(void)
-{
-    type_register_static(&ich_ahci_info);
-}
 
-type_init(ich_ahci_register_types)
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index f28c8fba6c..f63166f31d 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -128,10 +128,6 @@ static const TypeInfo isa_ide_info = {
     .instance_size = sizeof(ISAIDEState),
     .class_init    = isa_ide_class_initfn,
 };
+TYPE_INFO(isa_ide_info)
 
-static void isa_ide_register_types(void)
-{
-    type_register_static(&isa_ide_info);
-}
 
-type_init(isa_ide_register_types)
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 62a599a075..4e74dafa03 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -486,11 +486,8 @@ static const TypeInfo macio_ide_type_info = {
     .instance_init = macio_ide_initfn,
     .class_init = macio_ide_class_init,
 };
+TYPE_INFO(macio_ide_type_info)
 
-static void macio_ide_register_types(void)
-{
-    type_register_static(&macio_ide_type_info);
-}
 
 /* hd_table must contain 2 block drivers */
 void macio_ide_init_drives(MACIOIDEState *s, DriveInfo **hd_table)
@@ -510,4 +507,3 @@ void macio_ide_register_dma(MACIOIDEState *s)
                            pmac_ide_transfer, pmac_ide_flush, s);
 }
 
-type_init(macio_ide_register_types)
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index c4cc0a84eb..97483e5836 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -592,6 +592,7 @@ static const TypeInfo dscm1xxxx_type_info = {
     .parent = TYPE_MICRODRIVE,
     .class_init = dscm1xxxx_class_init,
 };
+TYPE_INFO(dscm1xxxx_type_info)
 
 static void microdrive_realize(DeviceState *dev, Error **errp)
 {
@@ -632,11 +633,6 @@ static const TypeInfo microdrive_type_info = {
     .abstract = true,
     .class_init = microdrive_class_init,
 };
+TYPE_INFO(microdrive_type_info)
 
-static void microdrive_register_types(void)
-{
-    type_register_static(&microdrive_type_info);
-    type_register_static(&dscm1xxxx_type_info);
-}
 
-type_init(microdrive_register_types)
diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index d233bd8c01..83f0d4a583 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -165,11 +165,8 @@ static const TypeInfo mmio_ide_type_info = {
     .instance_init = mmio_ide_initfn,
     .class_init = mmio_ide_class_init,
 };
+TYPE_INFO(mmio_ide_type_info)
 
-static void mmio_ide_register_types(void)
-{
-    type_register_static(&mmio_ide_type_info);
-}
 
 void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1)
 {
@@ -183,4 +180,3 @@ void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1)
     }
 }
 
-type_init(mmio_ide_register_types)
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 5e85c4ad17..7b20224754 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -525,10 +525,6 @@ static const TypeInfo pci_ide_type_info = {
         { },
     },
 };
+TYPE_INFO(pci_ide_type_info)
 
-static void pci_ide_register_types(void)
-{
-    type_register_static(&pci_ide_type_info);
-}
 
-type_init(pci_ide_register_types)
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index b402a93636..804c241c1f 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -229,12 +229,14 @@ static const TypeInfo piix3_ide_info = {
     .parent        = TYPE_PCI_IDE,
     .class_init    = piix3_ide_class_init,
 };
+TYPE_INFO(piix3_ide_info)
 
 static const TypeInfo piix3_ide_xen_info = {
     .name          = "piix3-ide-xen",
     .parent        = TYPE_PCI_IDE,
     .class_init    = piix3_ide_class_init,
 };
+TYPE_INFO(piix3_ide_xen_info)
 
 /* NOTE: for the PIIX4, the IRQs and IOports are hardcoded */
 static void piix4_ide_class_init(ObjectClass *klass, void *data)
@@ -257,12 +259,6 @@ static const TypeInfo piix4_ide_info = {
     .parent        = TYPE_PCI_IDE,
     .class_init    = piix4_ide_class_init,
 };
+TYPE_INFO(piix4_ide_info)
 
-static void piix_ide_register_types(void)
-{
-    type_register_static(&piix3_ide_info);
-    type_register_static(&piix3_ide_xen_info);
-    type_register_static(&piix4_ide_info);
-}
 
-type_init(piix_ide_register_types)
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 27ff1f7f66..4e03200438 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -66,6 +66,7 @@ static const TypeInfo ide_bus_info = {
     .instance_size = sizeof(IDEBus),
     .class_init = ide_bus_class_init,
 };
+TYPE_INFO(ide_bus_info)
 
 void ide_bus_new(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
                  int bus_id, int max_units)
@@ -330,6 +331,7 @@ static const TypeInfo ide_hd_info = {
     .instance_size = sizeof(IDEDrive),
     .class_init    = ide_hd_class_init,
 };
+TYPE_INFO(ide_hd_info)
 
 static Property ide_cd_properties[] = {
     DEFINE_IDE_DEV_PROPERTIES(),
@@ -353,6 +355,7 @@ static const TypeInfo ide_cd_info = {
     .instance_size = sizeof(IDEDrive),
     .class_init    = ide_cd_class_init,
 };
+TYPE_INFO(ide_cd_info)
 
 static Property ide_drive_properties[] = {
     DEFINE_IDE_DEV_PROPERTIES(),
@@ -376,6 +379,7 @@ static const TypeInfo ide_drive_info = {
     .instance_size = sizeof(IDEDrive),
     .class_init    = ide_drive_class_init,
 };
+TYPE_INFO(ide_drive_info)
 
 static void ide_device_class_init(ObjectClass *klass, void *data)
 {
@@ -395,14 +399,6 @@ static const TypeInfo ide_device_type_info = {
     .class_init = ide_device_class_init,
     .instance_init = ide_dev_instance_init,
 };
+TYPE_INFO(ide_device_type_info)
 
-static void ide_register_types(void)
-{
-    type_register_static(&ide_bus_info);
-    type_register_static(&ide_hd_info);
-    type_register_static(&ide_cd_info);
-    type_register_static(&ide_drive_info);
-    type_register_static(&ide_device_type_info);
-}
 
-type_init(ide_register_types)
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 94d2b57f95..68279530fd 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -313,10 +313,6 @@ static const TypeInfo sii3112_pci_info = {
     .instance_size = sizeof(SiI3112PCIState),
     .class_init = sii3112_pci_class_init,
 };
+TYPE_INFO(sii3112_pci_info)
 
-static void sii3112_register_types(void)
-{
-    type_register_static(&sii3112_pci_info);
-}
 
-type_init(sii3112_register_types)
diff --git a/hw/ide/via.c b/hw/ide/via.c
index be09912b33..00a995acd7 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -231,10 +231,6 @@ static const TypeInfo via_ide_info = {
     .parent        = TYPE_PCI_IDE,
     .class_init    = via_ide_class_init,
 };
+TYPE_INFO(via_ide_info)
 
-static void via_ide_register_types(void)
-{
-    type_register_static(&via_ide_info);
-}
 
-type_init(via_ide_register_types)
diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
index 3cfb6a7a20..4f0f546581 100644
--- a/hw/input/adb-kbd.c
+++ b/hw/input/adb-kbd.c
@@ -402,10 +402,6 @@ static const TypeInfo adb_kbd_type_info = {
     .class_init = adb_kbd_class_init,
     .class_size = sizeof(ADBKeyboardClass),
 };
+TYPE_INFO(adb_kbd_type_info)
 
-static void adb_kbd_register_types(void)
-{
-    type_register_static(&adb_kbd_type_info);
-}
 
-type_init(adb_kbd_register_types)
diff --git a/hw/input/adb-mouse.c b/hw/input/adb-mouse.c
index 577a38ff2e..c0c8dead39 100644
--- a/hw/input/adb-mouse.c
+++ b/hw/input/adb-mouse.c
@@ -273,10 +273,6 @@ static const TypeInfo adb_mouse_type_info = {
     .class_init = adb_mouse_class_init,
     .class_size = sizeof(ADBMouseClass),
 };
+TYPE_INFO(adb_mouse_type_info)
 
-static void adb_mouse_register_types(void)
-{
-    type_register_static(&adb_mouse_type_info);
-}
 
-type_init(adb_mouse_register_types)
diff --git a/hw/input/adb.c b/hw/input/adb.c
index 013fcc9c54..3afbe59217 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -274,6 +274,7 @@ static const TypeInfo adb_bus_type_info = {
     .instance_size = sizeof(ADBBusState),
     .class_init = adb_bus_class_init,
 };
+TYPE_INFO(adb_bus_type_info)
 
 const VMStateDescription vmstate_adb_device = {
     .name = "adb_device",
@@ -313,11 +314,6 @@ static const TypeInfo adb_device_type_info = {
     .abstract = true,
     .class_init = adb_device_class_init,
 };
+TYPE_INFO(adb_device_type_info)
 
-static void adb_register_types(void)
-{
-    type_register_static(&adb_bus_type_info);
-    type_register_static(&adb_device_type_info);
-}
 
-type_init(adb_register_types)
diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index aa629ddbf1..ffe68b081a 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -518,10 +518,6 @@ static const TypeInfo lm8323_info = {
     .instance_size = sizeof(LM823KbdState),
     .class_init    = lm8323_class_init,
 };
+TYPE_INFO(lm8323_info)
 
-static void lm832x_register_types(void)
-{
-    type_register_static(&lm8323_info);
-}
 
-type_init(lm832x_register_types)
diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb.c
index 3e0a7eb0bd..73ee7edbd0 100644
--- a/hw/input/milkymist-softusb.c
+++ b/hw/input/milkymist-softusb.c
@@ -311,10 +311,6 @@ static const TypeInfo milkymist_softusb_info = {
     .instance_size = sizeof(MilkymistSoftUsbState),
     .class_init    = milkymist_softusb_class_init,
 };
+TYPE_INFO(milkymist_softusb_info)
 
-static void milkymist_softusb_register_types(void)
-{
-    type_register_static(&milkymist_softusb_info);
-}
 
-type_init(milkymist_softusb_register_types)
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index dde85ba6c6..4caa5b3ce3 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -606,10 +606,6 @@ static const TypeInfo i8042_info = {
     .instance_init = i8042_initfn,
     .class_init    = i8042_class_initfn,
 };
+TYPE_INFO(i8042_info)
 
-static void i8042_register_types(void)
-{
-    type_register_static(&i8042_info);
-}
 
-type_init(i8042_register_types)
diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 1123037b38..b018e708a6 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -176,12 +176,14 @@ static const TypeInfo pl050_kbd_info = {
     .parent        = TYPE_PL050,
     .instance_init = pl050_keyboard_init,
 };
+TYPE_INFO(pl050_kbd_info)
 
 static const TypeInfo pl050_mouse_info = {
     .name          = "pl050_mouse",
     .parent        = TYPE_PL050,
     .instance_init = pl050_mouse_init,
 };
+TYPE_INFO(pl050_mouse_info)
 
 static void pl050_class_init(ObjectClass *oc, void *data)
 {
@@ -198,12 +200,6 @@ static const TypeInfo pl050_type_info = {
     .abstract      = true,
     .class_init    = pl050_class_init,
 };
+TYPE_INFO(pl050_type_info)
 
-static void pl050_register_types(void)
-{
-    type_register_static(&pl050_type_info);
-    type_register_static(&pl050_kbd_info);
-    type_register_static(&pl050_mouse_info);
-}
 
-type_init(pl050_register_types)
diff --git a/hw/input/vhost-user-input.c b/hw/input/vhost-user-input.c
index 63984a8ba7..32318bf1ca 100644
--- a/hw/input/vhost-user-input.c
+++ b/hw/input/vhost-user-input.c
@@ -119,10 +119,6 @@ static const TypeInfo vhost_input_info = {
     .instance_finalize = vhost_input_finalize,
     .class_init    = vhost_input_class_init,
 };
+TYPE_INFO(vhost_input_info)
 
-static void vhost_input_register_types(void)
-{
-    type_register_static(&vhost_input_info);
-}
 
-type_init(vhost_input_register_types)
diff --git a/hw/input/virtio-input-hid.c b/hw/input/virtio-input-hid.c
index a7a244a95d..70e27e2c64 100644
--- a/hw/input/virtio-input-hid.c
+++ b/hw/input/virtio-input-hid.c
@@ -235,6 +235,7 @@ static const TypeInfo virtio_input_hid_info = {
     .class_init    = virtio_input_hid_class_init,
     .abstract      = true,
 };
+TYPE_INFO(virtio_input_hid_info)
 
 /* ----------------------------------------------------------------- */
 
@@ -291,6 +292,7 @@ static const TypeInfo virtio_keyboard_info = {
     .instance_size = sizeof(VirtIOInputHID),
     .instance_init = virtio_keyboard_init,
 };
+TYPE_INFO(virtio_keyboard_info)
 
 /* ----------------------------------------------------------------- */
 
@@ -384,6 +386,7 @@ static const TypeInfo virtio_mouse_info = {
     .instance_init = virtio_mouse_init,
     .class_init    = virtio_mouse_class_init,
 };
+TYPE_INFO(virtio_mouse_info)
 
 /* ----------------------------------------------------------------- */
 
@@ -508,15 +511,8 @@ static const TypeInfo virtio_tablet_info = {
     .instance_init = virtio_tablet_init,
     .class_init    = virtio_tablet_class_init,
 };
+TYPE_INFO(virtio_tablet_info)
 
 /* ----------------------------------------------------------------- */
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_input_hid_info);
-    type_register_static(&virtio_keyboard_info);
-    type_register_static(&virtio_mouse_info);
-    type_register_static(&virtio_tablet_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/input/virtio-input-host.c b/hw/input/virtio-input-host.c
index 85daf73f1a..aa4d17a903 100644
--- a/hw/input/virtio-input-host.c
+++ b/hw/input/virtio-input-host.c
@@ -246,12 +246,8 @@ static const TypeInfo virtio_input_host_info = {
     .instance_init = virtio_input_host_init,
     .class_init    = virtio_input_host_class_init,
 };
+TYPE_INFO(virtio_input_host_info)
 
 /* ----------------------------------------------------------------- */
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_input_host_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
index 54bcb46c74..044d1599e4 100644
--- a/hw/input/virtio-input.c
+++ b/hw/input/virtio-input.c
@@ -332,12 +332,8 @@ static const TypeInfo virtio_input_info = {
     .abstract      = true,
     .instance_finalize = virtio_input_finalize,
 };
+TYPE_INFO(virtio_input_info)
 
 /* ----------------------------------------------------------------- */
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_input_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/intc/allwinner-a10-pic.c b/hw/intc/allwinner-a10-pic.c
index 8cca124807..63ad2de08f 100644
--- a/hw/intc/allwinner-a10-pic.c
+++ b/hw/intc/allwinner-a10-pic.c
@@ -206,10 +206,6 @@ static const TypeInfo aw_a10_pic_info = {
     .instance_init = aw_a10_pic_init,
     .class_init = aw_a10_pic_class_init,
 };
+TYPE_INFO(aw_a10_pic_info)
 
-static void aw_a10_register_types(void)
-{
-    type_register_static(&aw_a10_pic_info);
-}
 
-type_init(aw_a10_register_types);
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 38aabd60cd..770e14fc3e 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -913,10 +913,6 @@ static const TypeInfo apic_info = {
     .parent        = TYPE_APIC_COMMON,
     .class_init    = apic_class_init,
 };
+TYPE_INFO(apic_info)
 
-static void apic_register_types(void)
-{
-    type_register_static(&apic_info);
-}
 
-type_init(apic_register_types)
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 81addd6390..a4851ba64a 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -488,10 +488,6 @@ static const TypeInfo apic_common_type = {
     .class_init = apic_common_class_init,
     .abstract = true,
 };
+TYPE_INFO(apic_common_type)
 
-static void apic_common_register_types(void)
-{
-    type_register_static(&apic_common_type);
-}
 
-type_init(apic_common_register_types)
diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index c60dc6b5e6..cf16727da2 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -2134,10 +2134,6 @@ static const TypeInfo arm_gic_info = {
     .class_init = arm_gic_class_init,
     .class_size = sizeof(ARMGICClass),
 };
+TYPE_INFO(arm_gic_info)
 
-static void arm_gic_register_types(void)
-{
-    type_register_static(&arm_gic_info);
-}
 
-type_init(arm_gic_register_types)
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 7b44d5625b..fef492f476 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -385,10 +385,6 @@ static const TypeInfo arm_gic_common_type = {
         { },
     },
 };
+TYPE_INFO(arm_gic_common_type)
 
-static void register_types(void)
-{
-    type_register_static(&arm_gic_common_type);
-}
 
-type_init(register_types)
diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 07b95143c9..b0379ea4c5 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -613,10 +613,6 @@ static const TypeInfo kvm_arm_gic_info = {
     .class_init = kvm_arm_gic_class_init,
     .class_size = sizeof(KVMARMGICClass),
 };
+TYPE_INFO(kvm_arm_gic_info)
 
-static void kvm_arm_gic_register_types(void)
-{
-    type_register_static(&kvm_arm_gic_info);
-}
 
-type_init(kvm_arm_gic_register_types)
diff --git a/hw/intc/arm_gicv2m.c b/hw/intc/arm_gicv2m.c
index 0b7e2b4f84..d129a8c9f1 100644
--- a/hw/intc/arm_gicv2m.c
+++ b/hw/intc/arm_gicv2m.c
@@ -190,10 +190,6 @@ static const TypeInfo gicv2m_info = {
     .instance_init = gicv2m_init,
     .class_init    = gicv2m_class_init,
 };
+TYPE_INFO(gicv2m_info)
 
-static void gicv2m_register_types(void)
-{
-    type_register_static(&gicv2m_info);
-}
 
-type_init(gicv2m_register_types)
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 66eaa97198..17f169087d 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -406,10 +406,6 @@ static const TypeInfo arm_gicv3_info = {
     .class_init = arm_gicv3_class_init,
     .class_size = sizeof(ARMGICv3Class),
 };
+TYPE_INFO(arm_gicv3_info)
 
-static void arm_gicv3_register_types(void)
-{
-    type_register_static(&arm_gicv3_info);
-}
 
-type_init(arm_gicv3_register_types)
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589..3cb906125a 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -525,10 +525,6 @@ static const TypeInfo arm_gicv3_common_type = {
         { },
     },
 };
+TYPE_INFO(arm_gicv3_common_type)
 
-static void register_types(void)
-{
-    type_register_static(&arm_gicv3_common_type);
-}
 
-type_init(register_types)
diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 66c4c6a188..05e385222d 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -149,10 +149,6 @@ static const TypeInfo gicv3_its_common_info = {
     .class_init = gicv3_its_common_class_init,
     .abstract = true,
 };
+TYPE_INFO(gicv3_its_common_info)
 
-static void gicv3_its_common_register_types(void)
-{
-    type_register_static(&gicv3_its_common_info);
-}
 
-type_init(gicv3_its_common_register_types)
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 46835ed085..ddd3a5a665 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -257,10 +257,6 @@ static const TypeInfo kvm_arm_its_info = {
     .class_init = kvm_arm_its_class_init,
     .class_size = sizeof(KVMARMITSClass),
 };
+TYPE_INFO(kvm_arm_its_info)
 
-static void kvm_arm_its_register_types(void)
-{
-    type_register_static(&kvm_arm_its_info);
-}
 
-type_init(kvm_arm_its_register_types)
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index eddd07c743..30d09d307e 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -889,10 +889,6 @@ static const TypeInfo kvm_arm_gicv3_info = {
     .class_init = kvm_arm_gicv3_class_init,
     .class_size = sizeof(KVMARMGICv3Class),
 };
+TYPE_INFO(kvm_arm_gicv3_info)
 
-static void kvm_arm_gicv3_register_types(void)
-{
-    type_register_static(&kvm_arm_gicv3_info);
-}
 
-type_init(kvm_arm_gicv3_register_types)
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 277a98b87b..819a77ceb4 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2775,10 +2775,6 @@ static const TypeInfo armv7m_nvic_info = {
     .class_init    = armv7m_nvic_class_init,
     .class_size    = sizeof(SysBusDeviceClass),
 };
+TYPE_INFO(armv7m_nvic_info)
 
-static void armv7m_nvic_register_types(void)
-{
-    type_register_static(&armv7m_nvic_info);
-}
 
-type_init(armv7m_nvic_register_types)
diff --git a/hw/intc/aspeed_vic.c b/hw/intc/aspeed_vic.c
index 5ba06c5262..e60d23bc34 100644
--- a/hw/intc/aspeed_vic.c
+++ b/hw/intc/aspeed_vic.c
@@ -354,10 +354,6 @@ static const TypeInfo aspeed_vic_info = {
     .instance_size = sizeof(AspeedVICState),
     .class_init = aspeed_vic_class_init,
 };
+TYPE_INFO(aspeed_vic_info)
 
-static void aspeed_vic_register_types(void)
-{
-    type_register_static(&aspeed_vic_info);
-}
 
-type_init(aspeed_vic_register_types);
diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c
index 53ab8f5881..4a0b62a356 100644
--- a/hw/intc/bcm2835_ic.c
+++ b/hw/intc/bcm2835_ic.c
@@ -232,10 +232,6 @@ static TypeInfo bcm2835_ic_info = {
     .class_init    = bcm2835_ic_class_init,
     .instance_init = bcm2835_ic_init,
 };
+TYPE_INFO(bcm2835_ic_info)
 
-static void bcm2835_ic_register_types(void)
-{
-    type_register_static(&bcm2835_ic_info);
-}
 
-type_init(bcm2835_ic_register_types)
diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
index 53dba0080c..7c9568f5ff 100644
--- a/hw/intc/bcm2836_control.c
+++ b/hw/intc/bcm2836_control.c
@@ -399,10 +399,6 @@ static TypeInfo bcm2836_control_info = {
     .class_init    = bcm2836_control_class_init,
     .instance_init = bcm2836_control_init,
 };
+TYPE_INFO(bcm2836_control_info)
 
-static void bcm2836_control_register_types(void)
-{
-    type_register_static(&bcm2836_control_info);
-}
 
-type_init(bcm2836_control_register_types)
diff --git a/hw/intc/etraxfs_pic.c b/hw/intc/etraxfs_pic.c
index 12988c7aa9..d77d65ed38 100644
--- a/hw/intc/etraxfs_pic.c
+++ b/hw/intc/etraxfs_pic.c
@@ -162,10 +162,6 @@ static const TypeInfo etraxfs_pic_info = {
     .instance_size = sizeof(struct etrax_pic),
     .instance_init = etraxfs_pic_init,
 };
+TYPE_INFO(etraxfs_pic_info)
 
-static void etraxfs_pic_register_types(void)
-{
-    type_register_static(&etraxfs_pic_info);
-}
 
-type_init(etraxfs_pic_register_types)
diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index b8561e4180..d0365915af 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -453,10 +453,6 @@ static const TypeInfo exynos4210_combiner_info = {
     .instance_init = exynos4210_combiner_init,
     .class_init    = exynos4210_combiner_class_init,
 };
+TYPE_INFO(exynos4210_combiner_info)
 
-static void exynos4210_combiner_register_types(void)
-{
-    type_register_static(&exynos4210_combiner_info);
-}
 
-type_init(exynos4210_combiner_register_types)
diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index 0aa3b843a9..a01ab137eb 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -366,13 +366,9 @@ static const TypeInfo exynos4210_gic_info = {
     .instance_size = sizeof(Exynos4210GicState),
     .class_init    = exynos4210_gic_class_init,
 };
+TYPE_INFO(exynos4210_gic_info)
 
-static void exynos4210_gic_register_types(void)
-{
-    type_register_static(&exynos4210_gic_info);
-}
 
-type_init(exynos4210_gic_register_types)
 
 /* IRQ OR Gate struct.
  *
@@ -474,10 +470,6 @@ static const TypeInfo exynos4210_irq_gate_info = {
     .instance_init = exynos4210_irq_gate_init,
     .class_init    = exynos4210_irq_gate_class_init,
 };
+TYPE_INFO(exynos4210_irq_gate_info)
 
-static void exynos4210_irq_gate_register_types(void)
-{
-    type_register_static(&exynos4210_irq_gate_info);
-}
 
-type_init(exynos4210_irq_gate_register_types)
diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index 794c643af2..1a3c846cee 100644
--- a/hw/intc/grlib_irqmp.c
+++ b/hw/intc/grlib_irqmp.c
@@ -350,10 +350,6 @@ static const TypeInfo grlib_irqmp_info = {
     .instance_init = grlib_irqmp_init,
     .class_init    = grlib_irqmp_class_init,
 };
+TYPE_INFO(grlib_irqmp_info)
 
-static void grlib_irqmp_register_types(void)
-{
-    type_register_static(&grlib_irqmp_info);
-}
 
-type_init(grlib_irqmp_register_types)
diff --git a/hw/intc/heathrow_pic.c b/hw/intc/heathrow_pic.c
index cb97c315da..8faa8a5582 100644
--- a/hw/intc/heathrow_pic.c
+++ b/hw/intc/heathrow_pic.c
@@ -201,10 +201,6 @@ static const TypeInfo heathrow_type_info = {
     .instance_init = heathrow_init,
     .class_init = heathrow_class_init,
 };
+TYPE_INFO(heathrow_type_info)
 
-static void heathrow_register_types(void)
-{
-    type_register_static(&heathrow_type_info);
-}
 
-type_init(heathrow_register_types)
diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 51b27f6a34..a213683f44 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -455,10 +455,6 @@ static const TypeInfo i8259_info = {
     .class_init = i8259_class_init,
     .class_size = sizeof(PICClass),
 };
+TYPE_INFO(i8259_info)
 
-static void pic_register_types(void)
-{
-    type_register_static(&i8259_info);
-}
 
-type_init(pic_register_types)
diff --git a/hw/intc/i8259_common.c b/hw/intc/i8259_common.c
index d90b40fe4c..a859ec4783 100644
--- a/hw/intc/i8259_common.c
+++ b/hw/intc/i8259_common.c
@@ -210,10 +210,6 @@ static const TypeInfo pic_common_type = {
         { }
     },
 };
+TYPE_INFO(pic_common_type)
 
-static void pic_common_register_types(void)
-{
-    type_register_static(&pic_common_type);
-}
 
-type_init(pic_common_register_types)
diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index f49fa67c91..2a692db176 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -278,10 +278,6 @@ static const TypeInfo ibex_plic_info = {
     .instance_init = ibex_plic_init,
     .class_init    = ibex_plic_class_init,
 };
+TYPE_INFO(ibex_plic_info)
 
-static void ibex_plic_register_types(void)
-{
-    type_register_static(&ibex_plic_info);
-}
 
-type_init(ibex_plic_register_types)
diff --git a/hw/intc/imx_avic.c b/hw/intc/imx_avic.c
index 63fc602a1a..805da5e2f2 100644
--- a/hw/intc/imx_avic.c
+++ b/hw/intc/imx_avic.c
@@ -357,10 +357,6 @@ static const TypeInfo imx_avic_info = {
     .instance_init = imx_avic_init,
     .class_init = imx_avic_class_init,
 };
+TYPE_INFO(imx_avic_info)
 
-static void imx_avic_register_types(void)
-{
-    type_register_static(&imx_avic_info);
-}
 
-type_init(imx_avic_register_types)
diff --git a/hw/intc/imx_gpcv2.c b/hw/intc/imx_gpcv2.c
index 17007a4078..b04fa35211 100644
--- a/hw/intc/imx_gpcv2.c
+++ b/hw/intc/imx_gpcv2.c
@@ -119,9 +119,5 @@ static const TypeInfo imx_gpcv2_info = {
     .instance_init = imx_gpcv2_init,
     .class_init    = imx_gpcv2_class_init,
 };
+TYPE_INFO(imx_gpcv2_info)
 
-static void imx_gpcv2_register_type(void)
-{
-    type_register_static(&imx_gpcv2_info);
-}
-type_init(imx_gpcv2_register_type)
diff --git a/hw/intc/intc.c b/hw/intc/intc.c
index 2e1e29e753..c526f90672 100644
--- a/hw/intc/intc.c
+++ b/hw/intc/intc.c
@@ -31,11 +31,7 @@ static const TypeInfo intctrl_info = {
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(InterruptStatsProviderClass),
 };
+TYPE_INFO(intctrl_info)
 
-static void intc_register_types(void)
-{
-    type_register_static(&intctrl_info);
-}
 
-type_init(intc_register_types)
 
diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index bca71b5934..4e865aac74 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -505,10 +505,6 @@ static const TypeInfo ioapic_info = {
     .instance_size = sizeof(IOAPICCommonState),
     .class_init    = ioapic_class_init,
 };
+TYPE_INFO(ioapic_info)
 
-static void ioapic_register_types(void)
-{
-    type_register_static(&ioapic_info);
-}
 
-type_init(ioapic_register_types)
diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
index 5538b5b86e..98a20fddf7 100644
--- a/hw/intc/ioapic_common.c
+++ b/hw/intc/ioapic_common.c
@@ -215,10 +215,6 @@ static const TypeInfo ioapic_common_type = {
         { }
     },
 };
+TYPE_INFO(ioapic_common_type)
 
-static void ioapic_common_register_types(void)
-{
-    type_register_static(&ioapic_common_type);
-}
 
-type_init(ioapic_common_register_types)
diff --git a/hw/intc/lm32_pic.c b/hw/intc/lm32_pic.c
index 36de670c9e..2f609dc93f 100644
--- a/hw/intc/lm32_pic.c
+++ b/hw/intc/lm32_pic.c
@@ -186,10 +186,6 @@ static const TypeInfo lm32_pic_info = {
         { }
     },
 };
+TYPE_INFO(lm32_pic_info)
 
-static void lm32_pic_register_types(void)
-{
-    type_register_static(&lm32_pic_info);
-}
 
-type_init(lm32_pic_register_types)
diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
index 23ca51cc2e..10e4c7278b 100644
--- a/hw/intc/loongson_liointc.c
+++ b/hw/intc/loongson_liointc.c
@@ -233,10 +233,6 @@ static const TypeInfo loongson_liointc_info = {
     .instance_size = sizeof(struct loongson_liointc),
     .instance_init = loongson_liointc_init,
 };
+TYPE_INFO(loongson_liointc_info)
 
-static void loongson_liointc_register_types(void)
-{
-    type_register_static(&loongson_liointc_info);
-}
 
-type_init(loongson_liointc_register_types)
diff --git a/hw/intc/mips_gic.c b/hw/intc/mips_gic.c
index bda4549925..1d2efed60a 100644
--- a/hw/intc/mips_gic.c
+++ b/hw/intc/mips_gic.c
@@ -459,10 +459,6 @@ static const TypeInfo mips_gic_info = {
     .instance_init = mips_gic_init,
     .class_init    = mips_gic_class_init,
 };
+TYPE_INFO(mips_gic_info)
 
-static void mips_gic_register_types(void)
-{
-    type_register_static(&mips_gic_info);
-}
 
-type_init(mips_gic_register_types)
diff --git a/hw/intc/nios2_iic.c b/hw/intc/nios2_iic.c
index 1a5df8c89a..43abcd95aa 100644
--- a/hw/intc/nios2_iic.c
+++ b/hw/intc/nios2_iic.c
@@ -86,10 +86,6 @@ static TypeInfo altera_iic_info = {
     .instance_init = altera_iic_init,
     .class_init    = altera_iic_class_init,
 };
+TYPE_INFO(altera_iic_info)
 
-static void altera_iic_register(void)
-{
-    type_register_static(&altera_iic_info);
-}
 
-type_init(altera_iic_register)
diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index b8a1d1fd7d..6f6a490db9 100644
--- a/hw/intc/omap_intc.c
+++ b/hw/intc/omap_intc.c
@@ -419,6 +419,7 @@ static const TypeInfo omap_intc_info = {
     .instance_init = omap_intc_init,
     .class_init    = omap_intc_class_init,
 };
+TYPE_INFO(omap_intc_info)
 
 static uint64_t omap2_inth_read(void *opaque, hwaddr addr,
                                 unsigned size)
@@ -672,6 +673,7 @@ static const TypeInfo omap2_intc_info = {
     .instance_init = omap2_intc_init,
     .class_init    = omap2_intc_class_init,
 };
+TYPE_INFO(omap2_intc_info)
 
 static const TypeInfo omap_intc_type_info = {
     .name          = TYPE_OMAP_INTC,
@@ -679,12 +681,6 @@ static const TypeInfo omap_intc_type_info = {
     .instance_size = sizeof(struct omap_intr_handler_s),
     .abstract      = true,
 };
+TYPE_INFO(omap_intc_type_info)
 
-static void omap_intc_register_types(void)
-{
-    type_register_static(&omap_intc_type_info);
-    type_register_static(&omap_intc_info);
-    type_register_static(&omap2_intc_info);
-}
 
-type_init(omap_intc_register_types)
diff --git a/hw/intc/ompic.c b/hw/intc/ompic.c
index c354427a61..d01b593cc4 100644
--- a/hw/intc/ompic.c
+++ b/hw/intc/ompic.c
@@ -173,10 +173,6 @@ static const TypeInfo or1k_ompic_info = {
     .instance_init = or1k_ompic_init,
     .class_init    = or1k_ompic_class_init,
 };
+TYPE_INFO(or1k_ompic_info)
 
-static void or1k_ompic_register_types(void)
-{
-    type_register_static(&or1k_ompic_info);
-}
 
-type_init(or1k_ompic_register_types)
diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 65970e1b37..1d86d5b6b1 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -1641,10 +1641,6 @@ static const TypeInfo openpic_info = {
     .instance_init = openpic_init,
     .class_init    = openpic_class_init,
 };
+TYPE_INFO(openpic_info)
 
-static void openpic_register_types(void)
-{
-    type_register_static(&openpic_info);
-}
 
-type_init(openpic_register_types)
diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
index e4bf47d885..f0add3e3ee 100644
--- a/hw/intc/openpic_kvm.c
+++ b/hw/intc/openpic_kvm.c
@@ -286,10 +286,6 @@ static const TypeInfo kvm_openpic_info = {
     .instance_init = kvm_openpic_init,
     .class_init    = kvm_openpic_class_init,
 };
+TYPE_INFO(kvm_openpic_info)
 
-static void kvm_openpic_register_types(void)
-{
-    type_register_static(&kvm_openpic_info);
-}
 
-type_init(kvm_openpic_register_types)
diff --git a/hw/intc/pl190.c b/hw/intc/pl190.c
index e3bd3dd121..5b237c0920 100644
--- a/hw/intc/pl190.c
+++ b/hw/intc/pl190.c
@@ -287,10 +287,6 @@ static const TypeInfo pl190_info = {
     .instance_init = pl190_init,
     .class_init    = pl190_class_init,
 };
+TYPE_INFO(pl190_info)
 
-static void pl190_register_types(void)
-{
-    type_register_static(&pl190_info);
-}
 
-type_init(pl190_register_types)
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 5f69626b3a..e333c85162 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -1975,10 +1975,6 @@ static const TypeInfo pnv_xive_info = {
         { }
     }
 };
+TYPE_INFO(pnv_xive_info)
 
-static void pnv_xive_register_types(void)
-{
-    type_register_static(&pnv_xive_info);
-}
 
-type_init(pnv_xive_register_types)
diff --git a/hw/intc/puv3_intc.c b/hw/intc/puv3_intc.c
index 090d4839d1..3f43aea812 100644
--- a/hw/intc/puv3_intc.c
+++ b/hw/intc/puv3_intc.c
@@ -137,10 +137,6 @@ static const TypeInfo puv3_intc_info = {
     .instance_size = sizeof(PUV3INTCState),
     .class_init = puv3_intc_class_init,
 };
+TYPE_INFO(puv3_intc_info)
 
-static void puv3_intc_register_type(void)
-{
-    type_register_static(&puv3_intc_info);
-}
 
-type_init(puv3_intc_register_type)
diff --git a/hw/intc/realview_gic.c b/hw/intc/realview_gic.c
index 9b12116b2a..e85422f40d 100644
--- a/hw/intc/realview_gic.c
+++ b/hw/intc/realview_gic.c
@@ -77,10 +77,6 @@ static const TypeInfo realview_gic_info = {
     .instance_init = realview_gic_init,
     .class_init    = realview_gic_class_init,
 };
+TYPE_INFO(realview_gic_info)
 
-static void realview_gic_register_types(void)
-{
-    type_register_static(&realview_gic_info);
-}
 
-type_init(realview_gic_register_types)
diff --git a/hw/intc/rx_icu.c b/hw/intc/rx_icu.c
index df4b6a8d22..2e47e6e099 100644
--- a/hw/intc/rx_icu.c
+++ b/hw/intc/rx_icu.c
@@ -388,10 +388,6 @@ static const TypeInfo rxicu_info = {
     .instance_finalize = rxicu_fini,
     .class_init = rxicu_class_init,
 };
+TYPE_INFO(rxicu_info)
 
-static void rxicu_register_types(void)
-{
-    type_register_static(&rxicu_info);
-}
 
-type_init(rxicu_register_types)
diff --git a/hw/intc/s390_flic.c b/hw/intc/s390_flic.c
index aacdb1bbc2..d9a51ddb2a 100644
--- a/hw/intc/s390_flic.c
+++ b/hw/intc/s390_flic.c
@@ -438,6 +438,7 @@ static const TypeInfo qemu_s390_flic_info = {
     .instance_init = qemu_s390_flic_instance_init,
     .class_init    = qemu_s390_flic_class_init,
 };
+TYPE_INFO(qemu_s390_flic_info)
 
 
 static const TypeInfo s390_flic_common_info = {
@@ -447,14 +448,9 @@ static const TypeInfo s390_flic_common_info = {
     .class_init    = s390_flic_class_init,
     .class_size    = sizeof(S390FLICStateClass),
 };
+TYPE_INFO(s390_flic_common_info)
 
-static void qemu_s390_flic_register_types(void)
-{
-    type_register_static(&s390_flic_common_info);
-    type_register_static(&qemu_s390_flic_info);
-}
 
-type_init(qemu_s390_flic_register_types)
 
 static bool adapter_info_so_needed(void *opaque)
 {
diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
index dbd4e682ce..a48adef68d 100644
--- a/hw/intc/s390_flic_kvm.c
+++ b/hw/intc/s390_flic_kvm.c
@@ -672,10 +672,6 @@ static const TypeInfo kvm_s390_flic_info = {
     .class_size    = sizeof(KVMS390FLICStateClass),
     .class_init    = kvm_s390_flic_class_init,
 };
+TYPE_INFO(kvm_s390_flic_info)
 
-static void kvm_s390_flic_register_types(void)
-{
-    type_register_static(&kvm_s390_flic_info);
-}
 
-type_init(kvm_s390_flic_register_types)
diff --git a/hw/intc/slavio_intctl.c b/hw/intc/slavio_intctl.c
index c4cf9096eb..65aea84cf3 100644
--- a/hw/intc/slavio_intctl.c
+++ b/hw/intc/slavio_intctl.c
@@ -466,10 +466,6 @@ static const TypeInfo slavio_intctl_info = {
         { }
     },
 };
+TYPE_INFO(slavio_intctl_info)
 
-static void slavio_intctl_register_types(void)
-{
-    type_register_static(&slavio_intctl_info);
-}
 
-type_init(slavio_intctl_register_types)
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 4bd0d606ba..d91d29959c 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -819,13 +819,9 @@ static const TypeInfo spapr_xive_info = {
         { }
     },
 };
+TYPE_INFO(spapr_xive_info)
 
-static void spapr_xive_register_types(void)
-{
-    type_register_static(&spapr_xive_info);
-}
 
-type_init(spapr_xive_register_types)
 
 /*
  * XIVE hcalls
diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index 68f9d44feb..12cae926cc 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -373,6 +373,7 @@ static const TypeInfo icp_info = {
     .class_init = icp_class_init,
     .class_size = sizeof(ICPStateClass),
 };
+TYPE_INFO(icp_info)
 
 Object *icp_create(Object *cpu, const char *type, XICSFabric *xi, Error **errp)
 {
@@ -707,12 +708,14 @@ static const TypeInfo ics_info = {
     .class_init = ics_class_init,
     .class_size = sizeof(ICSStateClass),
 };
+TYPE_INFO(ics_info)
 
 static const TypeInfo xics_fabric_info = {
     .name = TYPE_XICS_FABRIC,
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(XICSFabricClass),
 };
+TYPE_INFO(xics_fabric_info)
 
 /*
  * Exported functions
@@ -742,11 +745,4 @@ void ics_set_irq_type(ICSState *ics, int srcno, bool lsi)
     }
 }
 
-static void xics_register_types(void)
-{
-    type_register_static(&ics_info);
-    type_register_static(&icp_info);
-    type_register_static(&xics_fabric_info);
-}
 
-type_init(xics_register_types)
diff --git a/hw/intc/xics_pnv.c b/hw/intc/xics_pnv.c
index 35f3811264..dd7cb00a16 100644
--- a/hw/intc/xics_pnv.c
+++ b/hw/intc/xics_pnv.c
@@ -193,10 +193,6 @@ static const TypeInfo pnv_icp_info = {
     .class_init    = pnv_icp_class_init,
     .class_size    = sizeof(ICPStateClass),
 };
+TYPE_INFO(pnv_icp_info)
 
-static void pnv_icp_register_types(void)
-{
-    type_register_static(&pnv_icp_info);
-}
 
-type_init(pnv_icp_register_types)
diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
index 8ae4f41459..01a9481b9a 100644
--- a/hw/intc/xics_spapr.c
+++ b/hw/intc/xics_spapr.c
@@ -468,10 +468,6 @@ static const TypeInfo ics_spapr_info = {
         { }
     },
 };
+TYPE_INFO(ics_spapr_info)
 
-static void xics_spapr_register_types(void)
-{
-    type_register_static(&ics_spapr_info);
-}
 
-type_init(xics_spapr_register_types)
diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
index 3e65e68619..4efd6297ca 100644
--- a/hw/intc/xilinx_intc.c
+++ b/hw/intc/xilinx_intc.c
@@ -195,10 +195,6 @@ static const TypeInfo xilinx_intc_info = {
     .instance_init = xilinx_intc_init,
     .class_init    = xilinx_intc_class_init,
 };
+TYPE_INFO(xilinx_intc_info)
 
-static void xilinx_intc_register_types(void)
-{
-    type_register_static(&xilinx_intc_info);
-}
 
-type_init(xilinx_intc_register_types)
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 489e6256ef..0f03565b46 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -766,6 +766,7 @@ static const TypeInfo xive_tctx_info = {
     .instance_size = sizeof(XiveTCTX),
     .class_init    = xive_tctx_class_init,
 };
+TYPE_INFO(xive_tctx_info)
 
 Object *xive_tctx_create(Object *cpu, XivePresenter *xptr, Error **errp)
 {
@@ -1214,6 +1215,7 @@ static const TypeInfo xive_source_info = {
     .instance_size = sizeof(XiveSource),
     .class_init    = xive_source_class_init,
 };
+TYPE_INFO(xive_source_info)
 
 /*
  * XiveEND helpers
@@ -1761,6 +1763,7 @@ static const TypeInfo xive_router_info = {
         { }
     }
 };
+TYPE_INFO(xive_router_info)
 
 void xive_eas_pic_print_info(XiveEAS *eas, uint32_t lisn, Monitor *mon)
 {
@@ -1920,6 +1923,7 @@ static const TypeInfo xive_end_source_info = {
     .instance_size = sizeof(XiveENDSource),
     .class_init    = xive_end_source_class_init,
 };
+TYPE_INFO(xive_end_source_info)
 
 /*
  * XIVE Notifier
@@ -1929,6 +1933,7 @@ static const TypeInfo xive_notifier_info = {
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(XiveNotifierClass),
 };
+TYPE_INFO(xive_notifier_info)
 
 /*
  * XIVE Presenter
@@ -1938,6 +1943,7 @@ static const TypeInfo xive_presenter_info = {
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(XivePresenterClass),
 };
+TYPE_INFO(xive_presenter_info)
 
 /*
  * XIVE Fabric
@@ -1947,16 +1953,6 @@ static const TypeInfo xive_fabric_info = {
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(XiveFabricClass),
 };
+TYPE_INFO(xive_fabric_info)
 
-static void xive_register_types(void)
-{
-    type_register_static(&xive_fabric_info);
-    type_register_static(&xive_source_info);
-    type_register_static(&xive_notifier_info);
-    type_register_static(&xive_presenter_info);
-    type_register_static(&xive_router_info);
-    type_register_static(&xive_end_source_info);
-    type_register_static(&xive_tctx_info);
-}
 
-type_init(xive_register_types)
diff --git a/hw/intc/xlnx-pmu-iomod-intc.c b/hw/intc/xlnx-pmu-iomod-intc.c
index acaa1c3e6f..bc1f431407 100644
--- a/hw/intc/xlnx-pmu-iomod-intc.c
+++ b/hw/intc/xlnx-pmu-iomod-intc.c
@@ -549,10 +549,6 @@ static const TypeInfo xlnx_pmu_io_intc_info = {
     .class_init    = xlnx_pmu_io_intc_class_init,
     .instance_init = xlnx_pmu_io_intc_init,
 };
+TYPE_INFO(xlnx_pmu_io_intc_info)
 
-static void xlnx_pmu_io_intc_register_types(void)
-{
-    type_register_static(&xlnx_pmu_io_intc_info);
-}
 
-type_init(xlnx_pmu_io_intc_register_types)
diff --git a/hw/intc/xlnx-zynqmp-ipi.c b/hw/intc/xlnx-zynqmp-ipi.c
index adc1179014..3895061f87 100644
--- a/hw/intc/xlnx-zynqmp-ipi.c
+++ b/hw/intc/xlnx-zynqmp-ipi.c
@@ -371,10 +371,6 @@ static const TypeInfo xlnx_zynqmp_ipi_info = {
     .class_init    = xlnx_zynqmp_ipi_class_init,
     .instance_init = xlnx_zynqmp_ipi_init,
 };
+TYPE_INFO(xlnx_zynqmp_ipi_info)
 
-static void xlnx_zynqmp_ipi_register_types(void)
-{
-    type_register_static(&xlnx_zynqmp_ipi_info);
-}
 
-type_init(xlnx_zynqmp_ipi_register_types)
diff --git a/hw/ipack/ipack.c b/hw/ipack/ipack.c
index f19ecaeb1c..9cb74e3d32 100644
--- a/hw/ipack/ipack.c
+++ b/hw/ipack/ipack.c
@@ -107,17 +107,13 @@ static const TypeInfo ipack_device_info = {
     .class_init    = ipack_device_class_init,
     .abstract      = true,
 };
+TYPE_INFO(ipack_device_info)
 
 static const TypeInfo ipack_bus_info = {
     .name = TYPE_IPACK_BUS,
     .parent = TYPE_BUS,
     .instance_size = sizeof(IPackBus),
 };
+TYPE_INFO(ipack_bus_info)
 
-static void ipack_register_types(void)
-{
-    type_register_static(&ipack_device_info);
-    type_register_static(&ipack_bus_info);
-}
 
-type_init(ipack_register_types)
diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
index f931d4df62..292836b379 100644
--- a/hw/ipack/tpci200.c
+++ b/hw/ipack/tpci200.c
@@ -655,10 +655,6 @@ static const TypeInfo tpci200_info = {
         { },
     },
 };
+TYPE_INFO(tpci200_info)
 
-static void tpci200_register_types(void)
-{
-    type_register_static(&tpci200_info);
-}
 
-type_init(tpci200_register_types)
diff --git a/hw/ipmi/ipmi.c b/hw/ipmi/ipmi.c
index 8d35c9fdd6..aa5428e7e9 100644
--- a/hw/ipmi/ipmi.c
+++ b/hw/ipmi/ipmi.c
@@ -91,6 +91,7 @@ static TypeInfo ipmi_interface_type_info = {
     .class_size = sizeof(IPMIInterfaceClass),
     .class_init = ipmi_interface_class_init,
 };
+TYPE_INFO(ipmi_interface_type_info)
 
 static void isa_ipmi_bmc_check(const Object *obj, const char *name,
                                Object *val, Error **errp)
@@ -128,11 +129,6 @@ static TypeInfo ipmi_bmc_type_info = {
     .class_size = sizeof(IPMIBmcClass),
     .class_init = bmc_class_init,
 };
+TYPE_INFO(ipmi_bmc_type_info)
 
-static void ipmi_register_types(void)
-{
-    type_register_static(&ipmi_interface_type_info);
-    type_register_static(&ipmi_bmc_type_info);
-}
 
-type_init(ipmi_register_types)
diff --git a/hw/ipmi/ipmi_bmc_sim.c b/hw/ipmi/ipmi_bmc_sim.c
index f78e92d3d5..caa4d75915 100644
--- a/hw/ipmi/ipmi_bmc_sim.c
+++ b/hw/ipmi/ipmi_bmc_sim.c
@@ -2222,10 +2222,6 @@ static const TypeInfo ipmi_sim_type = {
     .instance_size = sizeof(IPMIBmcSim),
     .class_init    = ipmi_sim_class_init,
 };
+TYPE_INFO(ipmi_sim_type)
 
-static void ipmi_sim_register_types(void)
-{
-    type_register_static(&ipmi_sim_type);
-}
 
-type_init(ipmi_sim_register_types)
diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index c8dc0a09dc..389b4ece7f 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -165,10 +165,6 @@ static const TypeInfo isa_ipmi_bt_info = {
         { }
     }
 };
+TYPE_INFO(isa_ipmi_bt_info)
 
-static void ipmi_register_types(void)
-{
-    type_register_static(&isa_ipmi_bt_info);
-}
 
-type_init(ipmi_register_types)
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index 4b421c33f4..465aba5ac8 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -172,10 +172,6 @@ static const TypeInfo isa_ipmi_kcs_info = {
         { }
     }
 };
+TYPE_INFO(isa_ipmi_kcs_info)
 
-static void ipmi_register_types(void)
-{
-    type_register_static(&isa_ipmi_kcs_info);
-}
 
-type_init(ipmi_register_types)
diff --git a/hw/ipmi/pci_ipmi_bt.c b/hw/ipmi/pci_ipmi_bt.c
index ba9cf016b5..4d20d36ed1 100644
--- a/hw/ipmi/pci_ipmi_bt.c
+++ b/hw/ipmi/pci_ipmi_bt.c
@@ -139,10 +139,6 @@ static const TypeInfo pci_ipmi_bt_info = {
         { }
     }
 };
+TYPE_INFO(pci_ipmi_bt_info)
 
-static void pci_ipmi_bt_register_types(void)
-{
-    type_register_static(&pci_ipmi_bt_info);
-}
 
-type_init(pci_ipmi_bt_register_types)
diff --git a/hw/ipmi/pci_ipmi_kcs.c b/hw/ipmi/pci_ipmi_kcs.c
index 99f46152f4..f3f4cee8f5 100644
--- a/hw/ipmi/pci_ipmi_kcs.c
+++ b/hw/ipmi/pci_ipmi_kcs.c
@@ -139,10 +139,6 @@ static const TypeInfo pci_ipmi_kcs_info = {
         { }
     }
 };
+TYPE_INFO(pci_ipmi_kcs_info)
 
-static void pci_ipmi_kcs_register_types(void)
-{
-    type_register_static(&pci_ipmi_kcs_info);
-}
 
-type_init(pci_ipmi_kcs_register_types)
diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
index f1a0148755..dbfe949890 100644
--- a/hw/ipmi/smbus_ipmi.c
+++ b/hw/ipmi/smbus_ipmi.c
@@ -375,10 +375,6 @@ static const TypeInfo smbus_ipmi_info = {
         { }
     }
 };
+TYPE_INFO(smbus_ipmi_info)
 
-static void smbus_ipmi_register_types(void)
-{
-    type_register_static(&smbus_ipmi_info);
-}
 
-type_init(smbus_ipmi_register_types)
diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 75a2da2881..2341e13bc3 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -142,10 +142,6 @@ static const TypeInfo i82378_type_info = {
         { },
     },
 };
+TYPE_INFO(i82378_type_info)
 
-static void i82378_register_types(void)
-{
-    type_register_static(&i82378_type_info);
-}
 
-type_init(i82378_register_types)
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 58fde178f9..6a52f350a5 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -45,6 +45,7 @@ static const TypeInfo isa_dma_info = {
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(IsaDmaClass),
 };
+TYPE_INFO(isa_dma_info)
 
 static const TypeInfo isa_bus_info = {
     .name = TYPE_ISA_BUS,
@@ -52,6 +53,7 @@ static const TypeInfo isa_bus_info = {
     .instance_size = sizeof(ISABus),
     .class_init = isa_bus_class_init,
 };
+TYPE_INFO(isa_bus_info)
 
 ISABus *isa_bus_new(DeviceState *dev, MemoryRegion* address_space,
                     MemoryRegion *address_space_io, Error **errp)
@@ -248,6 +250,7 @@ static const TypeInfo isabus_bridge_info = {
     .instance_size = sizeof(SysBusDevice),
     .class_init    = isabus_bridge_class_init,
 };
+TYPE_INFO(isabus_bridge_info)
 
 static void isa_device_class_init(ObjectClass *klass, void *data)
 {
@@ -264,14 +267,8 @@ static const TypeInfo isa_device_type_info = {
     .class_size = sizeof(ISADeviceClass),
     .class_init = isa_device_class_init,
 };
+TYPE_INFO(isa_device_type_info)
 
-static void isabus_register_types(void)
-{
-    type_register_static(&isa_dma_info);
-    type_register_static(&isa_bus_info);
-    type_register_static(&isabus_bridge_info);
-    type_register_static(&isa_device_type_info);
-}
 
 static char *isabus_get_fw_dev_path(DeviceState *dev)
 {
@@ -305,4 +302,3 @@ MemoryRegion *isa_address_space_io(ISADevice *dev)
     return isabus->address_space_io;
 }
 
-type_init(isabus_register_types)
diff --git a/hw/isa/isa-superio.c b/hw/isa/isa-superio.c
index e2e47d8fd9..803cf27f6b 100644
--- a/hw/isa/isa-superio.c
+++ b/hw/isa/isa-superio.c
@@ -185,6 +185,7 @@ static const TypeInfo isa_superio_type_info = {
     .class_size = sizeof(ISASuperIOClass),
     .class_init = isa_superio_class_init,
 };
+TYPE_INFO(isa_superio_type_info)
 
 /* SMS FDC37M817 Super I/O */
 static void fdc37m81x_class_init(ObjectClass *klass, void *data)
@@ -203,11 +204,6 @@ static const TypeInfo fdc37m81x_type_info = {
     .instance_size = sizeof(ISASuperIODevice),
     .class_init    = fdc37m81x_class_init,
 };
+TYPE_INFO(fdc37m81x_type_info)
 
-static void isa_superio_register_types(void)
-{
-    type_register_static(&isa_superio_type_info);
-    type_register_static(&fdc37m81x_type_info);
-}
 
-type_init(isa_superio_register_types)
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index cd6e169d47..6011ae073f 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -802,10 +802,6 @@ static const TypeInfo ich9_lpc_info = {
         { }
     }
 };
+TYPE_INFO(ich9_lpc_info)
 
-static void ich9_lpc_register(void)
-{
-    type_register_static(&ich9_lpc_info);
-}
 
-type_init(ich9_lpc_register);
diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
index 0cacbbc91b..db22a75e28 100644
--- a/hw/isa/pc87312.c
+++ b/hw/isa/pc87312.c
@@ -378,10 +378,6 @@ static const TypeInfo pc87312_type_info = {
     .class_init    = pc87312_class_init,
     /* FIXME use a qdev drive property instead of drive_get() */
 };
+TYPE_INFO(pc87312_type_info)
 
-static void pc87312_register_types(void)
-{
-    type_register_static(&pc87312_type_info);
-}
 
-type_init(pc87312_register_types)
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 587850b888..14a30f274f 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -318,6 +318,7 @@ static const TypeInfo piix3_pci_type_info = {
         { },
     },
 };
+TYPE_INFO(piix3_pci_type_info)
 
 static void piix3_class_init(ObjectClass *klass, void *data)
 {
@@ -331,6 +332,7 @@ static const TypeInfo piix3_info = {
     .parent        = TYPE_PIIX3_PCI_DEVICE,
     .class_init    = piix3_class_init,
 };
+TYPE_INFO(piix3_info)
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
@@ -344,15 +346,9 @@ static const TypeInfo piix3_xen_info = {
     .parent        = TYPE_PIIX3_PCI_DEVICE,
     .class_init    = piix3_xen_class_init,
 };
+TYPE_INFO(piix3_xen_info)
 
-static void piix3_register_types(void)
-{
-    type_register_static(&piix3_pci_type_info);
-    type_register_static(&piix3_info);
-    type_register_static(&piix3_xen_info);
-}
 
-type_init(piix3_register_types)
 
 /*
  * Return the global irq number corresponding to a given device irq
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index ac044afa95..705c5c5567 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -228,13 +228,9 @@ static const TypeInfo piix4_info = {
         { },
     },
 };
+TYPE_INFO(piix4_info)
 
-static void piix4_register_types(void)
-{
-    type_register_static(&piix4_info);
-}
 
-type_init(piix4_register_types)
 
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
diff --git a/hw/isa/smc37c669-superio.c b/hw/isa/smc37c669-superio.c
index 18287741cb..f26769ba6d 100644
--- a/hw/isa/smc37c669-superio.c
+++ b/hw/isa/smc37c669-superio.c
@@ -107,10 +107,6 @@ static const TypeInfo smc37c669_type_info = {
     .class_size    = sizeof(ISASuperIOClass),
     .class_init    = smc37c669_class_init,
 };
+TYPE_INFO(smc37c669_type_info)
 
-static void smc37c669_register_types(void)
-{
-    type_register_static(&smc37c669_type_info);
-}
 
-type_init(smc37c669_register_types)
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 18160ca445..2b68111629 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -305,6 +305,7 @@ static const TypeInfo via_ac97_info = {
         { },
     },
 };
+TYPE_INFO(via_ac97_info)
 
 static void vt82c686b_mc97_realize(PCIDevice *dev, Error **errp)
 {
@@ -349,6 +350,7 @@ static const TypeInfo via_mc97_info = {
         { },
     },
 };
+TYPE_INFO(via_mc97_info)
 
 /* vt82c686 pm init */
 static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
@@ -431,6 +433,7 @@ static const TypeInfo via_pm_info = {
         { },
     },
 };
+TYPE_INFO(via_pm_info)
 
 static const VMStateDescription vmstate_via = {
     .name = "vt82c686b",
@@ -519,6 +522,7 @@ static const TypeInfo via_info = {
         { },
     },
 };
+TYPE_INFO(via_info)
 
 static void vt82c686b_superio_class_init(ObjectClass *klass, void *data)
 {
@@ -537,14 +541,6 @@ static const TypeInfo via_superio_info = {
     .class_size    = sizeof(ISASuperIOClass),
     .class_init    = vt82c686b_superio_class_init,
 };
+TYPE_INFO(via_superio_info)
 
-static void vt82c686b_register_types(void)
-{
-    type_register_static(&via_ac97_info);
-    type_register_static(&via_mc97_info);
-    type_register_static(&via_pm_info);
-    type_register_static(&via_superio_info);
-    type_register_static(&via_info);
-}
 
-type_init(vt82c686b_register_types)
diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index b842f74344..1541d53b5e 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -306,6 +306,7 @@ static const TypeInfo lm32_evr_type = {
     .parent = TYPE_MACHINE,
     .class_init = lm32_evr_class_init,
 };
+TYPE_INFO(lm32_evr_type)
 
 static void lm32_uclinux_class_init(ObjectClass *oc, void *data)
 {
@@ -323,11 +324,6 @@ static const TypeInfo lm32_uclinux_type = {
     .parent = TYPE_MACHINE,
     .class_init = lm32_uclinux_class_init,
 };
+TYPE_INFO(lm32_uclinux_type)
 
-static void lm32_machine_init(void)
-{
-    type_register_static(&lm32_evr_type);
-    type_register_static(&lm32_uclinux_type);
-}
 
-type_init(lm32_machine_init)
diff --git a/hw/m68k/mcf_intc.c b/hw/m68k/mcf_intc.c
index e01e2e111b..e6e9d7c03e 100644
--- a/hw/m68k/mcf_intc.c
+++ b/hw/m68k/mcf_intc.c
@@ -190,13 +190,9 @@ static const TypeInfo mcf_intc_gate_info = {
     .instance_init = mcf_intc_instance_init,
     .class_init    = mcf_intc_class_init,
 };
+TYPE_INFO(mcf_intc_gate_info)
 
-static void mcf_intc_register_types(void)
-{
-    type_register_static(&mcf_intc_gate_info);
-}
 
-type_init(mcf_intc_register_types)
 
 qemu_irq *mcf_intc_init(MemoryRegion *sysmem,
                         hwaddr base,
diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index d3f25cd6d7..e839765cb7 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -975,10 +975,6 @@ static const TypeInfo next_typeinfo = {
     .class_init = next_machine_class_init,
     .instance_size = sizeof(NeXTState),
 };
+TYPE_INFO(next_typeinfo)
 
-static void next_register_type(void)
-{
-    type_register_static(&next_typeinfo);
-}
 
-type_init(next_register_type)
diff --git a/hw/m68k/next-kbd.c b/hw/m68k/next-kbd.c
index 2dff87be15..fc000ae694 100644
--- a/hw/m68k/next-kbd.c
+++ b/hw/m68k/next-kbd.c
@@ -282,10 +282,6 @@ static const TypeInfo nextkbd_info = {
     .instance_size = sizeof(NextKBDState),
     .class_init    = nextkbd_class_init,
 };
+TYPE_INFO(nextkbd_info)
 
-static void nextkbd_register_types(void)
-{
-    type_register_static(&nextkbd_info);
-}
 
-type_init(nextkbd_register_types)
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1ca482ad81..35dfb8d858 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -445,10 +445,6 @@ static const TypeInfo q800_machine_typeinfo = {
     .parent     = TYPE_MACHINE,
     .class_init = q800_machine_class_init,
 };
+TYPE_INFO(q800_machine_typeinfo)
 
-static void q800_machine_register_types(void)
-{
-    type_register_static(&q800_machine_typeinfo);
-}
 
-type_init(q800_machine_register_types)
diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 4bc9cf0917..cc5b67da8b 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -337,10 +337,6 @@ static const TypeInfo memory_device_info = {
     .parent        = TYPE_INTERFACE,
     .class_size = sizeof(MemoryDeviceClass),
 };
+TYPE_INFO(memory_device_info)
 
-static void memory_device_register_types(void)
-{
-    type_register_static(&memory_device_info);
-}
 
-type_init(memory_device_register_types)
diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index e1574bc07c..dff6e553de 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -247,10 +247,6 @@ static TypeInfo nvdimm_info = {
     .instance_init = nvdimm_init,
     .instance_finalize = nvdimm_finalize,
 };
+TYPE_INFO(nvdimm_info)
 
-static void nvdimm_register_types(void)
-{
-    type_register_static(&nvdimm_info);
-}
 
-type_init(nvdimm_register_types)
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index c30351070b..58657be673 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -296,10 +296,6 @@ static TypeInfo pc_dimm_info = {
         { }
     },
 };
+TYPE_INFO(pc_dimm_info)
 
-static void pc_dimm_register_types(void)
-{
-    type_register_static(&pc_dimm_info);
-}
 
-type_init(pc_dimm_register_types)
diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 5f994547f7..e025070a9b 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -135,13 +135,9 @@ static const TypeInfo xlnx_zynqmp_pmu_soc_type_info = {
     .instance_init = xlnx_zynqmp_pmu_soc_init,
     .class_init = xlnx_zynqmp_pmu_soc_class_init,
 };
+TYPE_INFO(xlnx_zynqmp_pmu_soc_type_info)
 
-static void xlnx_zynqmp_pmu_soc_register_types(void)
-{
-    type_register_static(&xlnx_zynqmp_pmu_soc_type_info);
-}
 
-type_init(xlnx_zynqmp_pmu_soc_register_types)
 
 /* Define the PMU Machine */
 
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 766458c015..55deb9c74a 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -253,12 +253,8 @@ static const TypeInfo boston_device = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(BostonState),
 };
+TYPE_INFO(boston_device)
 
-static void boston_register_types(void)
-{
-    type_register_static(&boston_device);
-}
-type_init(boston_register_types)
 
 static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr,
                          bool is_64b)
diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 615e1a1ad2..d1a3b59638 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -186,10 +186,6 @@ static const TypeInfo mips_cps_info = {
     .instance_init = mips_cps_init,
     .class_init = mips_cps_class_init,
 };
+TYPE_INFO(mips_cps_info)
 
-static void mips_cps_register_types(void)
-{
-    type_register_static(&mips_cps_info);
-}
 
-type_init(mips_cps_register_types)
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 756ac9ae12..1a69c18e38 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -1264,6 +1264,7 @@ static const TypeInfo gt64120_pci_info = {
         { },
     },
 };
+TYPE_INFO(gt64120_pci_info)
 
 static void gt64120_class_init(ObjectClass *klass, void *data)
 {
@@ -1280,11 +1281,6 @@ static const TypeInfo gt64120_info = {
     .instance_size = sizeof(GT64120State),
     .class_init    = gt64120_class_init,
 };
+TYPE_INFO(gt64120_info)
 
-static void gt64120_pci_register_types(void)
-{
-    type_register_static(&gt64120_info);
-    type_register_static(&gt64120_pci_info);
-}
 
-type_init(gt64120_pci_register_types)
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 82a6e3220e..acac5ab567 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -401,6 +401,7 @@ static const TypeInfo mips_magnum_type = {
     .parent = TYPE_MACHINE,
     .class_init = mips_magnum_class_init,
 };
+TYPE_INFO(mips_magnum_type)
 
 static void mips_pica61_class_init(ObjectClass *oc, void *data)
 {
@@ -418,11 +419,6 @@ static const TypeInfo mips_pica61_type = {
     .parent = TYPE_MACHINE,
     .class_init = mips_pica61_class_init,
 };
+TYPE_INFO(mips_pica61_type)
 
-static void mips_jazz_machine_init(void)
-{
-    type_register_static(&mips_magnum_type);
-    type_register_static(&mips_pica61_type);
-}
 
-type_init(mips_jazz_machine_init)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index a59e20c81c..1c16bc6c0c 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1425,6 +1425,7 @@ static const TypeInfo mips_malta_device = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(MaltaState),
 };
+TYPE_INFO(mips_malta_device)
 
 static void mips_malta_machine_init(MachineClass *mc)
 {
@@ -1443,9 +1444,4 @@ static void mips_malta_machine_init(MachineClass *mc)
 
 DEFINE_MACHINE("malta", mips_malta_machine_init)
 
-static void mips_malta_register_types(void)
-{
-    type_register_static(&mips_malta_device);
-}
 
-type_init(mips_malta_register_types)
diff --git a/hw/misc/a9scu.c b/hw/misc/a9scu.c
index 324371a1c0..3d68782cd5 100644
--- a/hw/misc/a9scu.c
+++ b/hw/misc/a9scu.c
@@ -147,10 +147,6 @@ static const TypeInfo a9_scu_info = {
     .instance_init = a9_scu_init,
     .class_init    = a9_scu_class_init,
 };
+TYPE_INFO(a9_scu_info)
 
-static void a9mp_register_types(void)
-{
-    type_register_static(&a9_scu_info);
-}
 
-type_init(a9mp_register_types)
diff --git a/hw/misc/allwinner-cpucfg.c b/hw/misc/allwinner-cpucfg.c
index bbd33a7dac..36327860bf 100644
--- a/hw/misc/allwinner-cpucfg.c
+++ b/hw/misc/allwinner-cpucfg.c
@@ -273,10 +273,6 @@ static const TypeInfo allwinner_cpucfg_info = {
     .instance_size = sizeof(AwCpuCfgState),
     .class_init    = allwinner_cpucfg_class_init,
 };
+TYPE_INFO(allwinner_cpucfg_info)
 
-static void allwinner_cpucfg_register(void)
-{
-    type_register_static(&allwinner_cpucfg_info);
-}
 
-type_init(allwinner_cpucfg_register)
diff --git a/hw/misc/allwinner-h3-ccu.c b/hw/misc/allwinner-h3-ccu.c
index 18d1074545..0ac0efcd18 100644
--- a/hw/misc/allwinner-h3-ccu.c
+++ b/hw/misc/allwinner-h3-ccu.c
@@ -233,10 +233,6 @@ static const TypeInfo allwinner_h3_ccu_info = {
     .instance_size = sizeof(AwH3ClockCtlState),
     .class_init    = allwinner_h3_ccu_class_init,
 };
+TYPE_INFO(allwinner_h3_ccu_info)
 
-static void allwinner_h3_ccu_register(void)
-{
-    type_register_static(&allwinner_h3_ccu_info);
-}
 
-type_init(allwinner_h3_ccu_register)
diff --git a/hw/misc/allwinner-h3-dramc.c b/hw/misc/allwinner-h3-dramc.c
index 1d37cf422c..015f5c71dd 100644
--- a/hw/misc/allwinner-h3-dramc.c
+++ b/hw/misc/allwinner-h3-dramc.c
@@ -349,10 +349,6 @@ static const TypeInfo allwinner_h3_dramc_info = {
     .instance_size = sizeof(AwH3DramCtlState),
     .class_init    = allwinner_h3_dramc_class_init,
 };
+TYPE_INFO(allwinner_h3_dramc_info)
 
-static void allwinner_h3_dramc_register(void)
-{
-    type_register_static(&allwinner_h3_dramc_info);
-}
 
-type_init(allwinner_h3_dramc_register)
diff --git a/hw/misc/allwinner-h3-sysctrl.c b/hw/misc/allwinner-h3-sysctrl.c
index 1d07efa880..3f404ab0e7 100644
--- a/hw/misc/allwinner-h3-sysctrl.c
+++ b/hw/misc/allwinner-h3-sysctrl.c
@@ -131,10 +131,6 @@ static const TypeInfo allwinner_h3_sysctrl_info = {
     .instance_size = sizeof(AwH3SysCtrlState),
     .class_init    = allwinner_h3_sysctrl_class_init,
 };
+TYPE_INFO(allwinner_h3_sysctrl_info)
 
-static void allwinner_h3_sysctrl_register(void)
-{
-    type_register_static(&allwinner_h3_sysctrl_info);
-}
 
-type_init(allwinner_h3_sysctrl_register)
diff --git a/hw/misc/allwinner-sid.c b/hw/misc/allwinner-sid.c
index 196380c33a..a0c870552a 100644
--- a/hw/misc/allwinner-sid.c
+++ b/hw/misc/allwinner-sid.c
@@ -159,10 +159,6 @@ static const TypeInfo allwinner_sid_info = {
     .instance_size = sizeof(AwSidState),
     .class_init    = allwinner_sid_class_init,
 };
+TYPE_INFO(allwinner_sid_info)
 
-static void allwinner_sid_register(void)
-{
-    type_register_static(&allwinner_sid_info);
-}
 
-type_init(allwinner_sid_register)
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 1c4addb201..8eebd48f81 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -363,10 +363,6 @@ static const TypeInfo applesmc_isa_info = {
     .instance_size = sizeof(AppleSMCState),
     .class_init    = qdev_applesmc_class_init,
 };
+TYPE_INFO(applesmc_isa_info)
 
-static void applesmc_register_types(void)
-{
-    type_register_static(&applesmc_isa_info);
-}
 
-type_init(applesmc_register_types)
diff --git a/hw/misc/arm11scu.c b/hw/misc/arm11scu.c
index 17c36a0545..a6d171b708 100644
--- a/hw/misc/arm11scu.c
+++ b/hw/misc/arm11scu.c
@@ -95,10 +95,6 @@ static const TypeInfo arm11_scu_type_info = {
     .instance_init = arm11_scu_init,
     .class_init    = arm11_scu_class_init,
 };
+TYPE_INFO(arm11_scu_type_info)
 
-static void arm11_scu_register_types(void)
-{
-    type_register_static(&arm11_scu_type_info);
-}
 
-type_init(arm11_scu_register_types)
diff --git a/hw/misc/arm_integrator_debug.c b/hw/misc/arm_integrator_debug.c
index 3e23201ae6..71b1c3c117 100644
--- a/hw/misc/arm_integrator_debug.c
+++ b/hw/misc/arm_integrator_debug.c
@@ -91,10 +91,6 @@ static const TypeInfo intdbg_info = {
     .instance_size = sizeof(IntegratorDebugState),
     .instance_init = intdbg_control_init,
 };
+TYPE_INFO(intdbg_info)
 
-static void intdbg_register_types(void)
-{
-    type_register_static(&intdbg_info);
-}
 
-type_init(intdbg_register_types)
diff --git a/hw/misc/arm_l2x0.c b/hw/misc/arm_l2x0.c
index 2066c97f5f..d395a9f354 100644
--- a/hw/misc/arm_l2x0.c
+++ b/hw/misc/arm_l2x0.c
@@ -193,10 +193,6 @@ static const TypeInfo l2x0_info = {
     .instance_init = l2x0_priv_init,
     .class_init = l2x0_class_init,
 };
+TYPE_INFO(l2x0_info)
 
-static void l2x0_register_types(void)
-{
-    type_register_static(&l2x0_info);
-}
 
-type_init(l2x0_register_types)
diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
index a474bbdd19..3f3d61ebb1 100644
--- a/hw/misc/arm_sysctl.c
+++ b/hw/misc/arm_sysctl.c
@@ -653,10 +653,6 @@ static const TypeInfo arm_sysctl_info = {
     .instance_finalize = arm_sysctl_finalize,
     .class_init    = arm_sysctl_class_init,
 };
+TYPE_INFO(arm_sysctl_info)
 
-static void arm_sysctl_register_types(void)
-{
-    type_register_static(&arm_sysctl_info);
-}
 
-type_init(arm_sysctl_register_types)
diff --git a/hw/misc/armsse-cpuid.c b/hw/misc/armsse-cpuid.c
index d58138dc28..d191ab1bda 100644
--- a/hw/misc/armsse-cpuid.c
+++ b/hw/misc/armsse-cpuid.c
@@ -126,10 +126,6 @@ static const TypeInfo armsse_cpuid_info = {
     .instance_init = armsse_cpuid_init,
     .class_init = armsse_cpuid_class_init,
 };
+TYPE_INFO(armsse_cpuid_info)
 
-static void armsse_cpuid_register_types(void)
-{
-    type_register_static(&armsse_cpuid_info);
-}
 
-type_init(armsse_cpuid_register_types);
diff --git a/hw/misc/armsse-mhu.c b/hw/misc/armsse-mhu.c
index a45d97fada..4083d7e1d2 100644
--- a/hw/misc/armsse-mhu.c
+++ b/hw/misc/armsse-mhu.c
@@ -191,10 +191,6 @@ static const TypeInfo armsse_mhu_info = {
     .instance_init = armsse_mhu_init,
     .class_init = armsse_mhu_class_init,
 };
+TYPE_INFO(armsse_mhu_info)
 
-static void armsse_mhu_register_types(void)
-{
-    type_register_static(&armsse_mhu_info);
-}
 
-type_init(armsse_mhu_register_types);
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index ec4fef900e..4dfc480e46 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -501,6 +501,7 @@ static const TypeInfo aspeed_scu_info = {
     .class_size    = sizeof(AspeedSCUClass),
     .abstract      = true,
 };
+TYPE_INFO(aspeed_scu_info)
 
 static void aspeed_2400_scu_class_init(ObjectClass *klass, void *data)
 {
@@ -521,6 +522,7 @@ static const TypeInfo aspeed_2400_scu_info = {
     .instance_size = sizeof(AspeedSCUState),
     .class_init = aspeed_2400_scu_class_init,
 };
+TYPE_INFO(aspeed_2400_scu_info)
 
 static void aspeed_2500_scu_class_init(ObjectClass *klass, void *data)
 {
@@ -541,6 +543,7 @@ static const TypeInfo aspeed_2500_scu_info = {
     .instance_size = sizeof(AspeedSCUState),
     .class_init = aspeed_2500_scu_class_init,
 };
+TYPE_INFO(aspeed_2500_scu_info)
 
 static uint64_t aspeed_ast2600_scu_read(void *opaque, hwaddr offset,
                                         unsigned size)
@@ -696,13 +699,6 @@ static const TypeInfo aspeed_2600_scu_info = {
     .instance_size = sizeof(AspeedSCUState),
     .class_init = aspeed_2600_scu_class_init,
 };
+TYPE_INFO(aspeed_2600_scu_info)
 
-static void aspeed_scu_register_types(void)
-{
-    type_register_static(&aspeed_scu_info);
-    type_register_static(&aspeed_2400_scu_info);
-    type_register_static(&aspeed_2500_scu_info);
-    type_register_static(&aspeed_2600_scu_info);
-}
 
-type_init(aspeed_scu_register_types);
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 855848b7d2..77365b46e3 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -297,6 +297,7 @@ static const TypeInfo aspeed_sdmc_info = {
     .class_size = sizeof(AspeedSDMCClass),
     .abstract   = true,
 };
+TYPE_INFO(aspeed_sdmc_info)
 
 static uint32_t aspeed_2400_sdmc_compute_conf(AspeedSDMCState *s, uint32_t data)
 {
@@ -353,6 +354,7 @@ static const TypeInfo aspeed_2400_sdmc_info = {
     .parent = TYPE_ASPEED_SDMC,
     .class_init = aspeed_2400_sdmc_class_init,
 };
+TYPE_INFO(aspeed_2400_sdmc_info)
 
 static uint32_t aspeed_2500_sdmc_compute_conf(AspeedSDMCState *s, uint32_t data)
 {
@@ -420,6 +422,7 @@ static const TypeInfo aspeed_2500_sdmc_info = {
     .parent = TYPE_ASPEED_SDMC,
     .class_init = aspeed_2500_sdmc_class_init,
 };
+TYPE_INFO(aspeed_2500_sdmc_info)
 
 static uint32_t aspeed_2600_sdmc_compute_conf(AspeedSDMCState *s, uint32_t data)
 {
@@ -497,13 +500,6 @@ static const TypeInfo aspeed_2600_sdmc_info = {
     .parent = TYPE_ASPEED_SDMC,
     .class_init = aspeed_2600_sdmc_class_init,
 };
+TYPE_INFO(aspeed_2600_sdmc_info)
 
-static void aspeed_sdmc_register_types(void)
-{
-    type_register_static(&aspeed_sdmc_info);
-    type_register_static(&aspeed_2400_sdmc_info);
-    type_register_static(&aspeed_2500_sdmc_info);
-    type_register_static(&aspeed_2600_sdmc_info);
-}
 
-type_init(aspeed_sdmc_register_types);
diff --git a/hw/misc/aspeed_xdma.c b/hw/misc/aspeed_xdma.c
index dca5585a75..82d864fe68 100644
--- a/hw/misc/aspeed_xdma.c
+++ b/hw/misc/aspeed_xdma.c
@@ -159,9 +159,5 @@ static const TypeInfo aspeed_xdma_info = {
     .instance_size = sizeof(AspeedXDMAState),
     .class_init    = aspeed_xdma_class_init,
 };
+TYPE_INFO(aspeed_xdma_info)
 
-static void aspeed_xdma_register_type(void)
-{
-    type_register_static(&aspeed_xdma_info);
-}
-type_init(aspeed_xdma_register_type);
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 6c099ae2a2..909bc80f59 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -212,6 +212,7 @@ static const TypeInfo aux_bus_info = {
     .instance_size = sizeof(AUXBus),
     .class_init = aux_bus_class_init
 };
+TYPE_INFO(aux_bus_info)
 
 /* aux-i2c implementation (internal not public) */
 struct AUXTOI2CState {
@@ -251,6 +252,7 @@ static const TypeInfo aux_to_i2c_type_info = {
     .instance_size = sizeof(AUXTOI2CState),
     .instance_init = aux_bridge_init
 };
+TYPE_INFO(aux_to_i2c_type_info)
 
 /* aux-slave implementation */
 static void aux_slave_dev_print(Monitor *mon, DeviceState *dev, int indent)
@@ -292,12 +294,6 @@ static const TypeInfo aux_slave_type_info = {
     .abstract = true,
     .class_init = aux_slave_class_init,
 };
+TYPE_INFO(aux_slave_type_info)
 
-static void aux_register_types(void)
-{
-    type_register_static(&aux_bus_info);
-    type_register_static(&aux_slave_type_info);
-    type_register_static(&aux_to_i2c_type_info);
-}
 
-type_init(aux_register_types)
diff --git a/hw/misc/avr_power.c b/hw/misc/avr_power.c
index a5412f2cfe..ca413fd5a5 100644
--- a/hw/misc/avr_power.c
+++ b/hw/misc/avr_power.c
@@ -104,10 +104,6 @@ static const TypeInfo avr_mask_info = {
     .class_init    = avr_mask_class_init,
     .instance_init = avr_mask_init,
 };
+TYPE_INFO(avr_mask_info)
 
-static void avr_mask_register_types(void)
-{
-    type_register_static(&avr_mask_info);
-}
 
-type_init(avr_mask_register_types)
diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
index 9f73cbd5e4..eabe45eb96 100644
--- a/hw/misc/bcm2835_mbox.c
+++ b/hw/misc/bcm2835_mbox.c
@@ -331,10 +331,6 @@ static TypeInfo bcm2835_mbox_info = {
     .class_init    = bcm2835_mbox_class_init,
     .instance_init = bcm2835_mbox_init,
 };
+TYPE_INFO(bcm2835_mbox_info)
 
-static void bcm2835_mbox_register_types(void)
-{
-    type_register_static(&bcm2835_mbox_info);
-}
 
-type_init(bcm2835_mbox_register_types)
diff --git a/hw/misc/bcm2835_mphi.c b/hw/misc/bcm2835_mphi.c
index 0428e10ba5..7bf8156e69 100644
--- a/hw/misc/bcm2835_mphi.c
+++ b/hw/misc/bcm2835_mphi.c
@@ -182,10 +182,6 @@ static const TypeInfo bcm2835_mphi_type_info = {
     .instance_init = mphi_init,
     .class_init    = mphi_class_init,
 };
+TYPE_INFO(bcm2835_mphi_type_info)
 
-static void bcm2835_mphi_register_types(void)
-{
-    type_register_static(&bcm2835_mphi_type_info);
-}
 
-type_init(bcm2835_mphi_register_types)
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 73941bdae9..7b5375f264 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -427,10 +427,6 @@ static TypeInfo bcm2835_property_info = {
     .class_init    = bcm2835_property_class_init,
     .instance_init = bcm2835_property_init,
 };
+TYPE_INFO(bcm2835_property_info)
 
-static void bcm2835_property_register_types(void)
-{
-    type_register_static(&bcm2835_property_info);
-}
 
-type_init(bcm2835_property_register_types)
diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c
index d0c4e64e88..ff99501644 100644
--- a/hw/misc/bcm2835_rng.c
+++ b/hw/misc/bcm2835_rng.c
@@ -138,10 +138,6 @@ static TypeInfo bcm2835_rng_info = {
     .class_init    = bcm2835_rng_class_init,
     .instance_init = bcm2835_rng_init,
 };
+TYPE_INFO(bcm2835_rng_info)
 
-static void bcm2835_rng_register_types(void)
-{
-    type_register_static(&bcm2835_rng_info);
-}
 
-type_init(bcm2835_rng_register_types)
diff --git a/hw/misc/bcm2835_thermal.c b/hw/misc/bcm2835_thermal.c
index c6f3b1ad60..210a943581 100644
--- a/hw/misc/bcm2835_thermal.c
+++ b/hw/misc/bcm2835_thermal.c
@@ -126,10 +126,6 @@ static const TypeInfo bcm2835_thermal_info = {
     .instance_size = sizeof(Bcm2835ThermalState),
     .class_init = bcm2835_thermal_class_init,
 };
+TYPE_INFO(bcm2835_thermal_info)
 
-static void bcm2835_thermal_register_types(void)
-{
-    type_register_static(&bcm2835_thermal_info);
-}
 
-type_init(bcm2835_thermal_register_types)
diff --git a/hw/misc/debugexit.c b/hw/misc/debugexit.c
index 99a814f10c..e0f00d2a96 100644
--- a/hw/misc/debugexit.c
+++ b/hw/misc/debugexit.c
@@ -75,10 +75,6 @@ static const TypeInfo debug_exit_info = {
     .instance_size = sizeof(ISADebugExitState),
     .class_init    = debug_exit_class_initfn,
 };
+TYPE_INFO(debug_exit_info)
 
-static void debug_exit_register_types(void)
-{
-    type_register_static(&debug_exit_info);
-}
 
-type_init(debug_exit_register_types)
diff --git a/hw/misc/eccmemctl.c b/hw/misc/eccmemctl.c
index aec447368e..daf75f1335 100644
--- a/hw/misc/eccmemctl.c
+++ b/hw/misc/eccmemctl.c
@@ -346,11 +346,7 @@ static const TypeInfo ecc_info = {
     .instance_init = ecc_init,
     .class_init    = ecc_class_init,
 };
+TYPE_INFO(ecc_info)
 
 
-static void ecc_register_types(void)
-{
-    type_register_static(&ecc_info);
-}
 
-type_init(ecc_register_types)
diff --git a/hw/misc/empty_slot.c b/hw/misc/empty_slot.c
index 9a011b1c11..d1736d784d 100644
--- a/hw/misc/empty_slot.c
+++ b/hw/misc/empty_slot.c
@@ -99,10 +99,6 @@ static const TypeInfo empty_slot_info = {
     .instance_size = sizeof(EmptySlot),
     .class_init    = empty_slot_class_init,
 };
+TYPE_INFO(empty_slot_info)
 
-static void empty_slot_register_types(void)
-{
-    type_register_static(&empty_slot_info);
-}
 
-type_init(empty_slot_register_types)
diff --git a/hw/misc/exynos4210_clk.c b/hw/misc/exynos4210_clk.c
index bc1463ff89..da18bc974c 100644
--- a/hw/misc/exynos4210_clk.c
+++ b/hw/misc/exynos4210_clk.c
@@ -156,11 +156,11 @@ static const TypeInfo exynos4210_clk_info = {
     .instance_init = exynos4210_clk_init,
     .class_init    = exynos4210_clk_class_init,
 };
+TYPE_INFO(exynos4210_clk_info)
 
 static void exynos4210_clk_register(void)
 {
     qemu_log_mask(LOG_GUEST_ERROR, "Clock init\n");
-    type_register_static(&exynos4210_clk_info);
 }
 
 type_init(exynos4210_clk_register)
diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
index 500f28343f..12ce99969c 100644
--- a/hw/misc/exynos4210_pmu.c
+++ b/hw/misc/exynos4210_pmu.c
@@ -513,10 +513,6 @@ static const TypeInfo exynos4210_pmu_info = {
     .instance_init = exynos4210_pmu_init,
     .class_init    = exynos4210_pmu_class_init,
 };
+TYPE_INFO(exynos4210_pmu_info)
 
-static void exynos4210_pmu_register(void)
-{
-    type_register_static(&exynos4210_pmu_info);
-}
 
-type_init(exynos4210_pmu_register)
diff --git a/hw/misc/exynos4210_rng.c b/hw/misc/exynos4210_rng.c
index 38cd61c7ea..b4938fe848 100644
--- a/hw/misc/exynos4210_rng.c
+++ b/hw/misc/exynos4210_rng.c
@@ -268,10 +268,6 @@ static const TypeInfo exynos4210_rng_info = {
     .instance_init = exynos4210_rng_init,
     .class_init    = exynos4210_rng_class_init,
 };
+TYPE_INFO(exynos4210_rng_info)
 
-static void exynos4210_rng_register(void)
-{
-    type_register_static(&exynos4210_rng_info);
-}
 
-type_init(exynos4210_rng_register)
diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
index 43e001c3c7..1c0178deb3 100644
--- a/hw/misc/grlib_ahb_apb_pnp.c
+++ b/hw/misc/grlib_ahb_apb_pnp.c
@@ -180,6 +180,7 @@ static const TypeInfo grlib_ahb_pnp_info = {
     .instance_size = sizeof(AHBPnp),
     .class_init    = grlib_ahb_pnp_class_init,
 };
+TYPE_INFO(grlib_ahb_pnp_info)
 
 /* APBPnp */
 
@@ -291,11 +292,6 @@ static const TypeInfo grlib_apb_pnp_info = {
     .instance_size = sizeof(APBPnp),
     .class_init    = grlib_apb_pnp_class_init,
 };
+TYPE_INFO(grlib_apb_pnp_info)
 
-static void grlib_ahb_apb_pnp_register_types(void)
-{
-    type_register_static(&grlib_ahb_pnp_info);
-    type_register_static(&grlib_apb_pnp_info);
-}
 
-type_init(grlib_ahb_apb_pnp_register_types)
diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c
index d3107e5ca2..7b9d9dc5b5 100644
--- a/hw/misc/imx25_ccm.c
+++ b/hw/misc/imx25_ccm.c
@@ -311,10 +311,6 @@ static const TypeInfo imx25_ccm_info = {
     .instance_init = imx25_ccm_init,
     .class_init    = imx25_ccm_class_init,
 };
+TYPE_INFO(imx25_ccm_info)
 
-static void imx25_ccm_register_types(void)
-{
-    type_register_static(&imx25_ccm_info);
-}
 
-type_init(imx25_ccm_register_types)
diff --git a/hw/misc/imx31_ccm.c b/hw/misc/imx31_ccm.c
index 6e246827ab..c12610e69b 100644
--- a/hw/misc/imx31_ccm.c
+++ b/hw/misc/imx31_ccm.c
@@ -338,10 +338,6 @@ static const TypeInfo imx31_ccm_info = {
     .instance_init = imx31_ccm_init,
     .class_init    = imx31_ccm_class_init,
 };
+TYPE_INFO(imx31_ccm_info)
 
-static void imx31_ccm_register_types(void)
-{
-    type_register_static(&imx31_ccm_info);
-}
 
-type_init(imx31_ccm_register_types)
diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 7fec8f0a47..582e070287 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -774,10 +774,6 @@ static const TypeInfo imx6_ccm_info = {
     .instance_init = imx6_ccm_init,
     .class_init    = imx6_ccm_class_init,
 };
+TYPE_INFO(imx6_ccm_info)
 
-static void imx6_ccm_register_types(void)
-{
-    type_register_static(&imx6_ccm_info);
-}
 
-type_init(imx6_ccm_register_types)
diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index dd99cc7acf..00af88e31b 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -302,10 +302,6 @@ static const TypeInfo imx6_src_info = {
     .instance_size = sizeof(IMX6SRCState),
     .class_init    = imx6_src_class_init,
 };
+TYPE_INFO(imx6_src_info)
 
-static void imx6_src_register_types(void)
-{
-    type_register_static(&imx6_src_info);
-}
 
-type_init(imx6_src_register_types)
diff --git a/hw/misc/imx6ul_ccm.c b/hw/misc/imx6ul_ccm.c
index 5e0661dacf..48e10f644d 100644
--- a/hw/misc/imx6ul_ccm.c
+++ b/hw/misc/imx6ul_ccm.c
@@ -929,10 +929,6 @@ static const TypeInfo imx6ul_ccm_info = {
     .instance_init = imx6ul_ccm_init,
     .class_init    = imx6ul_ccm_class_init,
 };
+TYPE_INFO(imx6ul_ccm_info)
 
-static void imx6ul_ccm_register_types(void)
-{
-    type_register_static(&imx6ul_ccm_info);
-}
 
-type_init(imx6ul_ccm_register_types)
diff --git a/hw/misc/imx7_ccm.c b/hw/misc/imx7_ccm.c
index 02fc1ae8d0..08642e103b 100644
--- a/hw/misc/imx7_ccm.c
+++ b/hw/misc/imx7_ccm.c
@@ -242,6 +242,7 @@ static const TypeInfo imx7_ccm_info = {
     .instance_init = imx7_ccm_init,
     .class_init    = imx7_ccm_class_init,
 };
+TYPE_INFO(imx7_ccm_info)
 
 static const VMStateDescription vmstate_imx7_analog = {
     .name = TYPE_IMX7_ANALOG,
@@ -270,10 +271,5 @@ static const TypeInfo imx7_analog_info = {
     .instance_init = imx7_analog_init,
     .class_init    = imx7_analog_class_init,
 };
+TYPE_INFO(imx7_analog_info)
 
-static void imx7_ccm_register_type(void)
-{
-    type_register_static(&imx7_ccm_info);
-    type_register_static(&imx7_analog_info);
-}
-type_init(imx7_ccm_register_type)
diff --git a/hw/misc/imx7_gpr.c b/hw/misc/imx7_gpr.c
index b03341a2eb..d1ae539f59 100644
--- a/hw/misc/imx7_gpr.c
+++ b/hw/misc/imx7_gpr.c
@@ -116,9 +116,5 @@ static const TypeInfo imx7_gpr_info = {
     .instance_init = imx7_gpr_init,
     .class_init    = imx7_gpr_class_init,
 };
+TYPE_INFO(imx7_gpr_info)
 
-static void imx7_gpr_register_type(void)
-{
-    type_register_static(&imx7_gpr_info);
-}
-type_init(imx7_gpr_register_type)
diff --git a/hw/misc/imx7_snvs.c b/hw/misc/imx7_snvs.c
index 45972a5920..e92b3bd9a5 100644
--- a/hw/misc/imx7_snvs.c
+++ b/hw/misc/imx7_snvs.c
@@ -76,9 +76,5 @@ static const TypeInfo imx7_snvs_info = {
     .instance_init = imx7_snvs_init,
     .class_init    = imx7_snvs_class_init,
 };
+TYPE_INFO(imx7_snvs_info)
 
-static void imx7_snvs_register_type(void)
-{
-    type_register_static(&imx7_snvs_info);
-}
-type_init(imx7_snvs_register_type)
diff --git a/hw/misc/imx_ccm.c b/hw/misc/imx_ccm.c
index 52882071d3..c1df2adbd0 100644
--- a/hw/misc/imx_ccm.c
+++ b/hw/misc/imx_ccm.c
@@ -78,10 +78,6 @@ static const TypeInfo imx_ccm_info = {
     .class_size    = sizeof(IMXCCMClass),
     .abstract      = true,
 };
+TYPE_INFO(imx_ccm_info)
 
-static void imx_ccm_register_types(void)
-{
-    type_register_static(&imx_ccm_info);
-}
 
-type_init(imx_ccm_register_types)
diff --git a/hw/misc/imx_rngc.c b/hw/misc/imx_rngc.c
index 4c270df2db..8e67d3ef2a 100644
--- a/hw/misc/imx_rngc.c
+++ b/hw/misc/imx_rngc.c
@@ -269,10 +269,6 @@ static const TypeInfo imx_rngc_info = {
     .instance_size = sizeof(IMXRNGCState),
     .class_init    = imx_rngc_class_init,
 };
+TYPE_INFO(imx_rngc_info)
 
-static void imx_rngc_register_types(void)
-{
-    type_register_static(&imx_rngc_info);
-}
 
-type_init(imx_rngc_register_types)
diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index 9fdb82056a..0c93ed02d8 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -790,10 +790,6 @@ static const TypeInfo iotkit_secctl_info = {
     .instance_init = iotkit_secctl_init,
     .class_init = iotkit_secctl_class_init,
 };
+TYPE_INFO(iotkit_secctl_info)
 
-static void iotkit_secctl_register_types(void)
-{
-    type_register_static(&iotkit_secctl_info);
-}
 
-type_init(iotkit_secctl_register_types);
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 269783366d..b145a76680 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -519,10 +519,6 @@ static const TypeInfo iotkit_sysctl_info = {
     .instance_init = iotkit_sysctl_init,
     .class_init = iotkit_sysctl_class_init,
 };
+TYPE_INFO(iotkit_sysctl_info)
 
-static void iotkit_sysctl_register_types(void)
-{
-    type_register_static(&iotkit_sysctl_info);
-}
 
-type_init(iotkit_sysctl_register_types);
diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
index b2dcfc4376..559f640cd1 100644
--- a/hw/misc/iotkit-sysinfo.c
+++ b/hw/misc/iotkit-sysinfo.c
@@ -131,10 +131,6 @@ static const TypeInfo iotkit_sysinfo_info = {
     .instance_init = iotkit_sysinfo_init,
     .class_init = iotkit_sysinfo_class_init,
 };
+TYPE_INFO(iotkit_sysinfo_info)
 
-static void iotkit_sysinfo_register_types(void)
-{
-    type_register_static(&iotkit_sysinfo_info);
-}
 
-type_init(iotkit_sysinfo_register_types);
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 2b6882face..e61062a2ed 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -1007,6 +1007,7 @@ static const TypeInfo ivshmem_common_info = {
         { },
     },
 };
+TYPE_INFO(ivshmem_common_info)
 
 static const VMStateDescription ivshmem_plain_vmsd = {
     .name = TYPE_IVSHMEM_PLAIN,
@@ -1061,6 +1062,7 @@ static const TypeInfo ivshmem_plain_info = {
     .instance_size = sizeof(IVShmemState),
     .class_init    = ivshmem_plain_class_init,
 };
+TYPE_INFO(ivshmem_plain_info)
 
 static const VMStateDescription ivshmem_doorbell_vmsd = {
     .name = TYPE_IVSHMEM_DOORBELL,
@@ -1122,12 +1124,6 @@ static const TypeInfo ivshmem_doorbell_info = {
     .instance_init = ivshmem_doorbell_init,
     .class_init    = ivshmem_doorbell_class_init,
 };
+TYPE_INFO(ivshmem_doorbell_info)
 
-static void ivshmem_register_types(void)
-{
-    type_register_static(&ivshmem_common_info);
-    type_register_static(&ivshmem_plain_info);
-    type_register_static(&ivshmem_doorbell_info);
-}
 
-type_init(ivshmem_register_types)
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 6db62dab7d..4d6106f74e 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1178,6 +1178,7 @@ static TypeInfo mac_via_info = {
     .instance_init = mac_via_init,
     .class_init = mac_via_class_init,
 };
+TYPE_INFO(mac_via_info)
 
 /* VIA 1 */
 static void mos6522_q800_via1_reset(DeviceState *dev)
@@ -1213,6 +1214,7 @@ static const TypeInfo mos6522_q800_via1_type_info = {
     .instance_init = mos6522_q800_via1_init,
     .class_init = mos6522_q800_via1_class_init,
 };
+TYPE_INFO(mos6522_q800_via1_type_info)
 
 /* VIA 2 */
 static void mos6522_q800_via2_portB_write(MOS6522State *s)
@@ -1259,12 +1261,6 @@ static const TypeInfo mos6522_q800_via2_type_info = {
     .instance_init = mos6522_q800_via2_init,
     .class_init = mos6522_q800_via2_class_init,
 };
+TYPE_INFO(mos6522_q800_via2_type_info)
 
-static void mac_via_register_types(void)
-{
-    type_register_static(&mos6522_q800_via1_type_info);
-    type_register_static(&mos6522_q800_via2_type_info);
-    type_register_static(&mac_via_info);
-}
 
-type_init(mac_via_register_types);
diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index edbd4186b2..faaa2f88a3 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -580,6 +580,7 @@ static const TypeInfo cuda_type_info = {
     .instance_init = cuda_init,
     .class_init = cuda_class_init,
 };
+TYPE_INFO(cuda_type_info)
 
 static void mos6522_cuda_portB_write(MOS6522State *s)
 {
@@ -619,11 +620,6 @@ static const TypeInfo mos6522_cuda_type_info = {
     .instance_size = sizeof(MOS6522CUDAState),
     .class_init = mos6522_cuda_class_init,
 };
+TYPE_INFO(mos6522_cuda_type_info)
 
-static void cuda_register_types(void)
-{
-    type_register_static(&mos6522_cuda_type_info);
-    type_register_static(&cuda_type_info);
-}
 
-type_init(cuda_register_types)
diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c
index 0fef8fb335..f77db07c67 100644
--- a/hw/misc/macio/gpio.c
+++ b/hw/misc/macio/gpio.c
@@ -224,10 +224,6 @@ static const TypeInfo macio_gpio_init_info = {
         { }
     },
 };
+TYPE_INFO(macio_gpio_init_info)
 
-static void macio_gpio_register_types(void)
-{
-    type_register_static(&macio_gpio_init_info);
-}
 
-type_init(macio_gpio_register_types)
diff --git a/hw/misc/macio/mac_dbdma.c b/hw/misc/macio/mac_dbdma.c
index e220f1a927..13c201c74f 100644
--- a/hw/misc/macio/mac_dbdma.c
+++ b/hw/misc/macio/mac_dbdma.c
@@ -931,10 +931,6 @@ static const TypeInfo mac_dbdma_type_info = {
     .instance_init = mac_dbdma_init,
     .class_init = mac_dbdma_class_init
 };
+TYPE_INFO(mac_dbdma_type_info)
 
-static void mac_dbdma_register_types(void)
-{
-    type_register_static(&mac_dbdma_type_info);
-}
 
-type_init(mac_dbdma_register_types)
diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 679722628e..b9aba19d18 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -467,6 +467,7 @@ static const TypeInfo macio_bus_info = {
     .parent = TYPE_SYSTEM_BUS,
     .instance_size = sizeof(MacIOBusState),
 };
+TYPE_INFO(macio_bus_info)
 
 static const TypeInfo macio_oldworld_type_info = {
     .name          = TYPE_OLDWORLD_MACIO,
@@ -475,6 +476,7 @@ static const TypeInfo macio_oldworld_type_info = {
     .instance_init = macio_oldworld_init,
     .class_init    = macio_oldworld_class_init,
 };
+TYPE_INFO(macio_oldworld_type_info)
 
 static const TypeInfo macio_newworld_type_info = {
     .name          = TYPE_NEWWORLD_MACIO,
@@ -483,6 +485,7 @@ static const TypeInfo macio_newworld_type_info = {
     .instance_init = macio_newworld_init,
     .class_init    = macio_newworld_class_init,
 };
+TYPE_INFO(macio_newworld_type_info)
 
 static const TypeInfo macio_type_info = {
     .name          = TYPE_MACIO,
@@ -496,13 +499,6 @@ static const TypeInfo macio_type_info = {
         { },
     },
 };
+TYPE_INFO(macio_type_info)
 
-static void macio_register_types(void)
-{
-    type_register_static(&macio_bus_info);
-    type_register_static(&macio_type_info);
-    type_register_static(&macio_oldworld_type_info);
-    type_register_static(&macio_newworld_type_info);
-}
 
-type_init(macio_register_types)
diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
index 71924d4768..f82d8ffe1d 100644
--- a/hw/misc/macio/pmu.c
+++ b/hw/misc/macio/pmu.c
@@ -801,6 +801,7 @@ static const TypeInfo pmu_type_info = {
     .instance_init = pmu_init,
     .class_init = pmu_class_init,
 };
+TYPE_INFO(pmu_type_info)
 
 static void mos6522_pmu_portB_write(MOS6522State *s)
 {
@@ -860,11 +861,6 @@ static const TypeInfo mos6522_pmu_type_info = {
     .instance_size = sizeof(MOS6522PMUState),
     .class_init = mos6522_pmu_class_init,
 };
+TYPE_INFO(mos6522_pmu_type_info)
 
-static void pmu_register_types(void)
-{
-    type_register_static(&pmu_type_info);
-    type_register_static(&mos6522_pmu_type_info);
-}
 
-type_init(pmu_register_types)
diff --git a/hw/misc/max111x.c b/hw/misc/max111x.c
index 7e6723f343..3db545c99a 100644
--- a/hw/misc/max111x.c
+++ b/hw/misc/max111x.c
@@ -194,6 +194,7 @@ static const TypeInfo max111x_info = {
     .class_init    = max111x_class_init,
     .abstract      = true,
 };
+TYPE_INFO(max111x_info)
 
 static void max1110_class_init(ObjectClass *klass, void *data)
 {
@@ -209,6 +210,7 @@ static const TypeInfo max1110_info = {
     .parent        = TYPE_MAX_111X,
     .class_init    = max1110_class_init,
 };
+TYPE_INFO(max1110_info)
 
 static void max1111_class_init(ObjectClass *klass, void *data)
 {
@@ -224,12 +226,6 @@ static const TypeInfo max1111_info = {
     .parent        = TYPE_MAX_111X,
     .class_init    = max1111_class_init,
 };
+TYPE_INFO(max1111_info)
 
-static void max111x_register_types(void)
-{
-    type_register_static(&max111x_info);
-    type_register_static(&max1110_info);
-    type_register_static(&max1111_info);
-}
 
-type_init(max111x_register_types)
diff --git a/hw/misc/milkymist-hpdmc.c b/hw/misc/milkymist-hpdmc.c
index 61e86e6b34..bb21fd7a4b 100644
--- a/hw/misc/milkymist-hpdmc.c
+++ b/hw/misc/milkymist-hpdmc.c
@@ -164,10 +164,6 @@ static const TypeInfo milkymist_hpdmc_info = {
     .instance_size = sizeof(MilkymistHpdmcState),
     .class_init    = milkymist_hpdmc_class_init,
 };
+TYPE_INFO(milkymist_hpdmc_info)
 
-static void milkymist_hpdmc_register_types(void)
-{
-    type_register_static(&milkymist_hpdmc_info);
-}
 
-type_init(milkymist_hpdmc_register_types)
diff --git a/hw/misc/milkymist-pfpu.c b/hw/misc/milkymist-pfpu.c
index 516825e83d..f78de71df4 100644
--- a/hw/misc/milkymist-pfpu.c
+++ b/hw/misc/milkymist-pfpu.c
@@ -540,10 +540,6 @@ static const TypeInfo milkymist_pfpu_info = {
     .instance_size = sizeof(MilkymistPFPUState),
     .class_init    = milkymist_pfpu_class_init,
 };
+TYPE_INFO(milkymist_pfpu_info)
 
-static void milkymist_pfpu_register_types(void)
-{
-    type_register_static(&milkymist_pfpu_info);
-}
 
-type_init(milkymist_pfpu_register_types)
diff --git a/hw/misc/mips_cmgcr.c b/hw/misc/mips_cmgcr.c
index 3c8b37f700..ddb46df9fa 100644
--- a/hw/misc/mips_cmgcr.c
+++ b/hw/misc/mips_cmgcr.c
@@ -246,10 +246,6 @@ static const TypeInfo mips_gcr_info = {
     .instance_init = mips_gcr_init,
     .class_init    = mips_gcr_class_init,
 };
+TYPE_INFO(mips_gcr_info)
 
-static void mips_gcr_register_types(void)
-{
-    type_register_static(&mips_gcr_info);
-}
 
-type_init(mips_gcr_register_types)
diff --git a/hw/misc/mips_cpc.c b/hw/misc/mips_cpc.c
index 2f7b2c9592..9b155b1326 100644
--- a/hw/misc/mips_cpc.c
+++ b/hw/misc/mips_cpc.c
@@ -185,10 +185,6 @@ static const TypeInfo mips_cpc_info = {
     .instance_init = mips_cpc_init,
     .class_init    = mips_cpc_class_init,
 };
+TYPE_INFO(mips_cpc_info)
 
-static void mips_cpc_register_types(void)
-{
-    type_register_static(&mips_cpc_info);
-}
 
-type_init(mips_cpc_register_types)
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index 3540985258..7afc7c053d 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -573,10 +573,6 @@ static const TypeInfo mips_itu_info = {
     .instance_init = mips_itu_init,
     .class_init    = mips_itu_class_init,
 };
+TYPE_INFO(mips_itu_info)
 
-static void mips_itu_register_types(void)
-{
-    type_register_static(&mips_itu_info);
-}
 
-type_init(mips_itu_register_types)
diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index ac4cd1d58e..0590e0edcc 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -523,10 +523,6 @@ static const TypeInfo mos6522_type_info = {
     .class_size = sizeof(MOS6522DeviceClass),
     .class_init = mos6522_class_init,
 };
+TYPE_INFO(mos6522_type_info)
 
-static void mos6522_register_types(void)
-{
-    type_register_static(&mos6522_type_info);
-}
 
-type_init(mos6522_register_types)
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index 2f3fbeef34..83c060f0ca 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -310,10 +310,6 @@ static const TypeInfo mps2_fpgaio_info = {
     .instance_init = mps2_fpgaio_init,
     .class_init = mps2_fpgaio_class_init,
 };
+TYPE_INFO(mps2_fpgaio_info)
 
-static void mps2_fpgaio_register_types(void)
-{
-    type_register_static(&mps2_fpgaio_info);
-}
 
-type_init(mps2_fpgaio_register_types);
diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index 9d0909e7b3..c3de3813e8 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -303,10 +303,6 @@ static const TypeInfo mps2_scc_info = {
     .instance_init = mps2_scc_init,
     .class_init = mps2_scc_class_init,
 };
+TYPE_INFO(mps2_scc_info)
 
-static void mps2_scc_register_types(void)
-{
-    type_register_static(&mps2_scc_info);
-}
 
-type_init(mps2_scc_register_types);
diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
index 2dce55c364..6ea5b97456 100644
--- a/hw/misc/msf2-sysreg.c
+++ b/hw/misc/msf2-sysreg.c
@@ -154,10 +154,6 @@ static const TypeInfo msf2_sysreg_info = {
     .instance_size  = sizeof(MSF2SysregState),
     .instance_init = msf2_sysreg_init,
 };
+TYPE_INFO(msf2_sysreg_info)
 
-static void msf2_sysreg_register_types(void)
-{
-    type_register_static(&msf2_sysreg_info);
-}
 
-type_init(msf2_sysreg_register_types)
diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c
index 81abdf8ede..fc4100e1b5 100644
--- a/hw/misc/mst_fpga.c
+++ b/hw/misc/mst_fpga.c
@@ -260,10 +260,6 @@ static const TypeInfo mst_fpga_info = {
     .instance_init = mst_fpga_init,
     .class_init    = mst_fpga_class_init,
 };
+TYPE_INFO(mst_fpga_info)
 
-static void mst_fpga_register_types(void)
-{
-    type_register_static(&mst_fpga_info);
-}
 
-type_init(mst_fpga_register_types)
diff --git a/hw/misc/nrf51_rng.c b/hw/misc/nrf51_rng.c
index fc86e1b697..1f71b295f5 100644
--- a/hw/misc/nrf51_rng.c
+++ b/hw/misc/nrf51_rng.c
@@ -257,10 +257,6 @@ static const TypeInfo nrf51_rng_info = {
     .instance_init = nrf51_rng_init,
     .class_init = nrf51_rng_class_init
 };
+TYPE_INFO(nrf51_rng_info)
 
-static void nrf51_rng_register_types(void)
-{
-    type_register_static(&nrf51_rng_info);
-}
 
-type_init(nrf51_rng_register_types)
diff --git a/hw/misc/pc-testdev.c b/hw/misc/pc-testdev.c
index 8aa8e6549f..9d5a17f747 100644
--- a/hw/misc/pc-testdev.c
+++ b/hw/misc/pc-testdev.c
@@ -207,10 +207,6 @@ static const TypeInfo testdev_info = {
     .instance_size  = sizeof(PCTestdev),
     .class_init     = testdev_class_init,
 };
+TYPE_INFO(testdev_info)
 
-static void testdev_register_types(void)
-{
-    type_register_static(&testdev_info);
-}
 
-type_init(testdev_register_types)
diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index e4ccdeaf78..60f73dd257 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -410,6 +410,7 @@ static const TypeInfo pca955x_info = {
     .class_size    = sizeof(PCA955xClass),
     .abstract      = true,
 };
+TYPE_INFO(pca955x_info)
 
 static void pca9552_class_init(ObjectClass *oc, void *data)
 {
@@ -427,11 +428,6 @@ static const TypeInfo pca9552_info = {
     .parent        = TYPE_PCA955X,
     .class_init    = pca9552_class_init,
 };
+TYPE_INFO(pca9552_info)
 
-static void pca955x_register_types(void)
-{
-    type_register_static(&pca955x_info);
-    type_register_static(&pca9552_info);
-}
 
-type_init(pca955x_register_types)
diff --git a/hw/misc/pci-testdev.c b/hw/misc/pci-testdev.c
index 188de4d9cc..1b0aba0429 100644
--- a/hw/misc/pci-testdev.c
+++ b/hw/misc/pci-testdev.c
@@ -352,10 +352,6 @@ static const TypeInfo pci_testdev_info = {
         { },
     },
 };
+TYPE_INFO(pci_testdev_info)
 
-static void pci_testdev_register_types(void)
-{
-    type_register_static(&pci_testdev_info);
-}
 
-type_init(pci_testdev_register_types)
diff --git a/hw/misc/puv3_pm.c b/hw/misc/puv3_pm.c
index 8989d363cd..8cc3d44efa 100644
--- a/hw/misc/puv3_pm.c
+++ b/hw/misc/puv3_pm.c
@@ -149,10 +149,6 @@ static const TypeInfo puv3_pm_info = {
     .instance_size = sizeof(PUV3PMState),
     .class_init = puv3_pm_class_init,
 };
+TYPE_INFO(puv3_pm_info)
 
-static void puv3_pm_register_type(void)
-{
-    type_register_static(&puv3_pm_info);
-}
 
-type_init(puv3_pm_register_type)
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index abb10bbcaf..98ce4e3289 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -129,10 +129,6 @@ static TypeInfo pvpanic_isa_info = {
     .instance_init = pvpanic_isa_initfn,
     .class_init    = pvpanic_isa_class_init,
 };
+TYPE_INFO(pvpanic_isa_info)
 
-static void pvpanic_register_types(void)
-{
-    type_register_static(&pvpanic_isa_info);
-}
 
-type_init(pvpanic_register_types)
diff --git a/hw/misc/sga.c b/hw/misc/sga.c
index 6866bf72cb..c1a5625d6a 100644
--- a/hw/misc/sga.c
+++ b/hw/misc/sga.c
@@ -59,10 +59,6 @@ static const TypeInfo sga_info = {
     .instance_size = sizeof(ISASGAState),
     .class_init    = sga_class_initfn,
 };
+TYPE_INFO(sga_info)
 
-static void sga_register_types(void)
-{
-    type_register_static(&sga_info);
-}
 
-type_init(sga_register_types)
diff --git a/hw/misc/slavio_misc.c b/hw/misc/slavio_misc.c
index 279b38dfc7..41be8d7598 100644
--- a/hw/misc/slavio_misc.c
+++ b/hw/misc/slavio_misc.c
@@ -495,6 +495,7 @@ static const TypeInfo slavio_misc_info = {
     .instance_init = slavio_misc_init,
     .class_init    = slavio_misc_class_init,
 };
+TYPE_INFO(slavio_misc_info)
 
 static const TypeInfo apc_info = {
     .name          = TYPE_APC,
@@ -502,11 +503,6 @@ static const TypeInfo apc_info = {
     .instance_size = sizeof(MiscState),
     .instance_init = apc_init,
 };
+TYPE_INFO(apc_info)
 
-static void slavio_misc_register_types(void)
-{
-    type_register_static(&slavio_misc_info);
-    type_register_static(&apc_info);
-}
 
-type_init(slavio_misc_register_types)
diff --git a/hw/misc/stm32f2xx_syscfg.c b/hw/misc/stm32f2xx_syscfg.c
index aa59b43549..c106f28257 100644
--- a/hw/misc/stm32f2xx_syscfg.c
+++ b/hw/misc/stm32f2xx_syscfg.c
@@ -154,10 +154,6 @@ static const TypeInfo stm32f2xx_syscfg_info = {
     .instance_init = stm32f2xx_syscfg_init,
     .class_init    = stm32f2xx_syscfg_class_init,
 };
+TYPE_INFO(stm32f2xx_syscfg_info)
 
-static void stm32f2xx_syscfg_register_types(void)
-{
-    type_register_static(&stm32f2xx_syscfg_info);
-}
 
-type_init(stm32f2xx_syscfg_register_types)
diff --git a/hw/misc/stm32f4xx_exti.c b/hw/misc/stm32f4xx_exti.c
index 02e7810046..d00a0240ef 100644
--- a/hw/misc/stm32f4xx_exti.c
+++ b/hw/misc/stm32f4xx_exti.c
@@ -179,10 +179,6 @@ static const TypeInfo stm32f4xx_exti_info = {
     .instance_init = stm32f4xx_exti_init,
     .class_init    = stm32f4xx_exti_class_init,
 };
+TYPE_INFO(stm32f4xx_exti_info)
 
-static void stm32f4xx_exti_register_types(void)
-{
-    type_register_static(&stm32f4xx_exti_info);
-}
 
-type_init(stm32f4xx_exti_register_types)
diff --git a/hw/misc/stm32f4xx_syscfg.c b/hw/misc/stm32f4xx_syscfg.c
index f960e4ea1e..fe70ba4c7b 100644
--- a/hw/misc/stm32f4xx_syscfg.c
+++ b/hw/misc/stm32f4xx_syscfg.c
@@ -162,10 +162,6 @@ static const TypeInfo stm32f4xx_syscfg_info = {
     .instance_init = stm32f4xx_syscfg_init,
     .class_init    = stm32f4xx_syscfg_class_init,
 };
+TYPE_INFO(stm32f4xx_syscfg_info)
 
-static void stm32f4xx_syscfg_register_types(void)
-{
-    type_register_static(&stm32f4xx_syscfg_info);
-}
 
-type_init(stm32f4xx_syscfg_register_types)
diff --git a/hw/misc/tmp105.c b/hw/misc/tmp105.c
index b47120492a..59cea18752 100644
--- a/hw/misc/tmp105.c
+++ b/hw/misc/tmp105.c
@@ -264,10 +264,6 @@ static const TypeInfo tmp105_info = {
     .instance_init = tmp105_initfn,
     .class_init    = tmp105_class_init,
 };
+TYPE_INFO(tmp105_info)
 
-static void tmp105_register_types(void)
-{
-    type_register_static(&tmp105_info);
-}
 
-type_init(tmp105_register_types)
diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
index 49abe2d246..7ae88322b7 100644
--- a/hw/misc/tmp421.c
+++ b/hw/misc/tmp421.c
@@ -378,12 +378,12 @@ static const TypeInfo tmp421_info = {
     .instance_init = tmp421_initfn,
     .abstract      = true,
 };
+TYPE_INFO(tmp421_info)
 
 static void tmp421_register_types(void)
 {
     int i;
 
-    type_register_static(&tmp421_info);
     for (i = 0; i < ARRAY_SIZE(devices); ++i) {
         TypeInfo ti = {
             .name       = devices[i].name,
diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index 98f151237f..415e067676 100644
--- a/hw/misc/tz-mpc.c
+++ b/hw/misc/tz-mpc.c
@@ -606,6 +606,7 @@ static const TypeInfo tz_mpc_info = {
     .instance_init = tz_mpc_init,
     .class_init = tz_mpc_class_init,
 };
+TYPE_INFO(tz_mpc_info)
 
 static void tz_mpc_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
@@ -622,11 +623,6 @@ static const TypeInfo tz_mpc_iommu_memory_region_info = {
     .parent = TYPE_IOMMU_MEMORY_REGION,
     .class_init = tz_mpc_iommu_memory_region_class_init,
 };
+TYPE_INFO(tz_mpc_iommu_memory_region_info)
 
-static void tz_mpc_register_types(void)
-{
-    type_register_static(&tz_mpc_info);
-    type_register_static(&tz_mpc_iommu_memory_region_info);
-}
 
-type_init(tz_mpc_register_types);
diff --git a/hw/misc/tz-msc.c b/hw/misc/tz-msc.c
index acbe94400b..6ece4c15a5 100644
--- a/hw/misc/tz-msc.c
+++ b/hw/misc/tz-msc.c
@@ -303,10 +303,6 @@ static const TypeInfo tz_msc_info = {
     .instance_init = tz_msc_init,
     .class_init = tz_msc_class_init,
 };
+TYPE_INFO(tz_msc_info)
 
-static void tz_msc_register_types(void)
-{
-    type_register_static(&tz_msc_info);
-}
 
-type_init(tz_msc_register_types);
diff --git a/hw/misc/tz-ppc.c b/hw/misc/tz-ppc.c
index 6431257b52..58c39757d4 100644
--- a/hw/misc/tz-ppc.c
+++ b/hw/misc/tz-ppc.c
@@ -329,10 +329,6 @@ static const TypeInfo tz_ppc_info = {
     .instance_init = tz_ppc_init,
     .class_init = tz_ppc_class_init,
 };
+TYPE_INFO(tz_ppc_info)
 
-static void tz_ppc_register_types(void)
-{
-    type_register_static(&tz_ppc_info);
-}
 
-type_init(tz_ppc_register_types);
diff --git a/hw/misc/unimp.c b/hw/misc/unimp.c
index bc4084d344..cb5ba7b363 100644
--- a/hw/misc/unimp.c
+++ b/hw/misc/unimp.c
@@ -88,10 +88,6 @@ static const TypeInfo unimp_info = {
     .instance_size = sizeof(UnimplementedDeviceState),
     .class_init = unimp_class_init,
 };
+TYPE_INFO(unimp_info)
 
-static void unimp_register_types(void)
-{
-    type_register_static(&unimp_info);
-}
 
-type_init(unimp_register_types)
diff --git a/hw/misc/vmcoreinfo.c b/hw/misc/vmcoreinfo.c
index a9d718fc23..7b88db0413 100644
--- a/hw/misc/vmcoreinfo.c
+++ b/hw/misc/vmcoreinfo.c
@@ -99,10 +99,6 @@ static const TypeInfo vmcoreinfo_device_info = {
     .instance_size = sizeof(VMCoreInfoState),
     .class_init    = vmcoreinfo_device_class_init,
 };
+TYPE_INFO(vmcoreinfo_device_info)
 
-static void vmcoreinfo_register_types(void)
-{
-    type_register_static(&vmcoreinfo_device_info);
-}
 
-type_init(vmcoreinfo_register_types)
diff --git a/hw/misc/zynq-xadc.c b/hw/misc/zynq-xadc.c
index 7b1972ce06..f95ccd4c85 100644
--- a/hw/misc/zynq-xadc.c
+++ b/hw/misc/zynq-xadc.c
@@ -296,10 +296,6 @@ static const TypeInfo zynq_xadc_info = {
     .instance_size  = sizeof(ZynqXADCState),
     .instance_init = zynq_xadc_init,
 };
+TYPE_INFO(zynq_xadc_info)
 
-static void zynq_xadc_register_types(void)
-{
-    type_register_static(&zynq_xadc_info);
-}
 
-type_init(zynq_xadc_register_types)
diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index f7472d1f3c..51d14a29a1 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -616,10 +616,6 @@ static const TypeInfo zynq_slcr_info = {
     .instance_size  = sizeof(ZynqSLCRState),
     .instance_init = zynq_slcr_init,
 };
+TYPE_INFO(zynq_slcr_info)
 
-static void zynq_slcr_register_types(void)
-{
-    type_register_static(&zynq_slcr_info);
-}
 
-type_init(zynq_slcr_register_types)
diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
index 28637ff4c1..d2f1df3a84 100644
--- a/hw/net/allwinner-sun8i-emac.c
+++ b/hw/net/allwinner-sun8i-emac.c
@@ -858,10 +858,6 @@ static const TypeInfo allwinner_sun8i_emac_info = {
     .instance_init  = allwinner_sun8i_emac_init,
     .class_init     = allwinner_sun8i_emac_class_init,
 };
+TYPE_INFO(allwinner_sun8i_emac_info)
 
-static void allwinner_sun8i_emac_register_types(void)
-{
-    type_register_static(&allwinner_sun8i_emac_info);
-}
 
-type_init(allwinner_sun8i_emac_register_types)
diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
index ddddf35c45..bdd4c97162 100644
--- a/hw/net/allwinner_emac.c
+++ b/hw/net/allwinner_emac.c
@@ -531,10 +531,6 @@ static const TypeInfo aw_emac_info = {
     .instance_init   = aw_emac_init,
     .class_init     = aw_emac_class_init,
 };
+TYPE_INFO(aw_emac_info)
 
-static void aw_emac_register_types(void)
-{
-    type_register_static(&aw_emac_info);
-}
 
-type_init(aw_emac_register_types)
diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index a93b5c07ce..b39b289104 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1710,10 +1710,6 @@ static const TypeInfo gem_info = {
     .instance_init = gem_init,
     .class_init = gem_class_init,
 };
+TYPE_INFO(gem_info)
 
-static void gem_register_types(void)
-{
-    type_register_static(&gem_info);
-}
 
-type_init(gem_register_types)
diff --git a/hw/net/can/can_kvaser_pci.c b/hw/net/can/can_kvaser_pci.c
index 4b941370d0..ae35e51434 100644
--- a/hw/net/can/can_kvaser_pci.c
+++ b/hw/net/can/can_kvaser_pci.c
@@ -313,10 +313,6 @@ static const TypeInfo kvaser_pci_info = {
         { },
     },
 };
+TYPE_INFO(kvaser_pci_info)
 
-static void kvaser_pci_register_types(void)
-{
-    type_register_static(&kvaser_pci_info);
-}
 
-type_init(kvaser_pci_register_types)
diff --git a/hw/net/can/can_mioe3680_pci.c b/hw/net/can/can_mioe3680_pci.c
index 695e762a8d..271f44d5af 100644
--- a/hw/net/can/can_mioe3680_pci.c
+++ b/hw/net/can/can_mioe3680_pci.c
@@ -256,10 +256,6 @@ static const TypeInfo mioe3680_pci_info = {
         { },
     },
 };
+TYPE_INFO(mioe3680_pci_info)
 
-static void mioe3680_pci_register_types(void)
-{
-    type_register_static(&mioe3680_pci_info);
-}
 
-type_init(mioe3680_pci_register_types)
diff --git a/hw/net/can/can_pcm3680_pci.c b/hw/net/can/can_pcm3680_pci.c
index 4218e63eb2..e3173a6f1c 100644
--- a/hw/net/can/can_pcm3680_pci.c
+++ b/hw/net/can/can_pcm3680_pci.c
@@ -257,10 +257,6 @@ static const TypeInfo pcm3680i_pci_info = {
         { },
     },
 };
+TYPE_INFO(pcm3680i_pci_info)
 
-static void pcm3680i_pci_register_types(void)
-{
-    type_register_static(&pcm3680i_pci_info);
-}
 
-type_init(pcm3680i_pci_register_types)
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index c54db0d62d..86bb2b6529 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -1040,10 +1040,6 @@ static const TypeInfo dp8393x_info = {
     .instance_init = dp8393x_instance_init,
     .class_init    = dp8393x_class_init,
 };
+TYPE_INFO(dp8393x_info)
 
-static void dp8393x_register_types(void)
-{
-    type_register_static(&dp8393x_info);
-}
 
-type_init(dp8393x_register_types)
diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index c4d896a9e6..ce0540face 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1789,6 +1789,7 @@ static const TypeInfo e1000_base_info = {
         { },
     },
 };
+TYPE_INFO(e1000_base_info)
 
 static const E1000Info e1000_devices[] = {
     {
@@ -1815,7 +1816,6 @@ static void e1000_register_types(void)
 {
     int i;
 
-    type_register_static(&e1000_base_info);
     for (i = 0; i < ARRAY_SIZE(e1000_devices); i++) {
         const E1000Info *info = &e1000_devices[i];
         TypeInfo type_info = {};
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index fda34518c9..b955f76869 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -719,10 +719,6 @@ static const TypeInfo e1000e_info = {
         { }
     },
 };
+TYPE_INFO(e1000e_info)
 
-static void e1000e_register_types(void)
-{
-    type_register_static(&e1000e_info);
-}
 
-type_init(e1000e_register_types)
diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index 3408ceacb5..d7712e2924 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -680,10 +680,6 @@ static const TypeInfo etraxfs_eth_info = {
     .instance_size = sizeof(ETRAXFSEthState),
     .class_init    = etraxfs_eth_class_init,
 };
+TYPE_INFO(etraxfs_eth_info)
 
-static void etraxfs_eth_register_types(void)
-{
-    type_register_static(&etraxfs_eth_info);
-}
 
-type_init(etraxfs_eth_register_types)
diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index 7035cf4eb9..410ae10553 100644
--- a/hw/net/fsl_etsec/etsec.c
+++ b/hw/net/fsl_etsec/etsec.c
@@ -436,13 +436,9 @@ static TypeInfo etsec_info = {
     .class_init            = etsec_class_init,
     .instance_init         = etsec_instance_init,
 };
+TYPE_INFO(etsec_info)
 
-static void etsec_register_types(void)
-{
-    type_register_static(&etsec_info);
-}
 
-type_init(etsec_register_types)
 
 DeviceState *etsec_create(hwaddr         base,
                           MemoryRegion * mr,
diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 5f4b26fc5f..70620d864b 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -1123,6 +1123,7 @@ static const TypeInfo ftgmac100_info = {
     .instance_size = sizeof(FTGMAC100State),
     .class_init = ftgmac100_class_init,
 };
+TYPE_INFO(ftgmac100_info)
 
 /*
  * AST2600 MII controller
@@ -1282,11 +1283,6 @@ static const TypeInfo aspeed_mii_info = {
     .instance_size = sizeof(AspeedMiiState),
     .class_init = aspeed_mii_class_init,
 };
+TYPE_INFO(aspeed_mii_info)
 
-static void ftgmac100_register_types(void)
-{
-    type_register_static(&ftgmac100_info);
-    type_register_static(&aspeed_mii_info);
-}
 
-type_init(ftgmac100_register_types)
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 2c14804041..372fdd839b 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1360,17 +1360,13 @@ static const TypeInfo imx_fec_info = {
     .instance_init = imx_fec_init,
     .class_init    = imx_eth_class_init,
 };
+TYPE_INFO(imx_fec_info)
 
 static const TypeInfo imx_enet_info = {
     .name          = TYPE_IMX_ENET,
     .parent        = TYPE_IMX_FEC,
     .instance_init = imx_enet_init,
 };
+TYPE_INFO(imx_enet_info)
 
-static void imx_eth_register_types(void)
-{
-    type_register_static(&imx_fec_info);
-    type_register_static(&imx_enet_info);
-}
 
-type_init(imx_eth_register_types)
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 8e2a432179..32cee7b116 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1381,11 +1381,8 @@ static const TypeInfo lan9118_info = {
     .instance_size = sizeof(lan9118_state),
     .class_init    = lan9118_class_init,
 };
+TYPE_INFO(lan9118_info)
 
-static void lan9118_register_types(void)
-{
-    type_register_static(&lan9118_info);
-}
 
 /* Legacy helper function.  Should go away when machine config files are
    implemented.  */
@@ -1403,4 +1400,3 @@ void lan9118_init(NICInfo *nd, uint32_t base, qemu_irq irq)
     sysbus_connect_irq(s, 0, irq);
 }
 
-type_init(lan9118_register_types)
diff --git a/hw/net/lance.c b/hw/net/lance.c
index 4c5f01baad..9190a4f178 100644
--- a/hw/net/lance.c
+++ b/hw/net/lance.c
@@ -163,10 +163,6 @@ static const TypeInfo lance_info = {
     .class_init    = lance_class_init,
     .instance_init = lance_instance_init,
 };
+TYPE_INFO(lance_info)
 
-static void lance_register_types(void)
-{
-    type_register_static(&lance_info);
-}
 
-type_init(lance_register_types)
diff --git a/hw/net/lasi_i82596.c b/hw/net/lasi_i82596.c
index 820b63f350..e17ab6d394 100644
--- a/hw/net/lasi_i82596.c
+++ b/hw/net/lasi_i82596.c
@@ -181,10 +181,6 @@ static const TypeInfo lasi_82596_info = {
     .class_init    = lasi_82596_class_init,
     .instance_init = lasi_82596_instance_init,
 };
+TYPE_INFO(lasi_82596_info)
 
-static void lasi_82596_register_types(void)
-{
-    type_register_static(&lasi_82596_info);
-}
 
-type_init(lasi_82596_register_types)
diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
index 25e3e453ab..1da49cf688 100644
--- a/hw/net/mcf_fec.c
+++ b/hw/net/mcf_fec.c
@@ -683,10 +683,6 @@ static const TypeInfo mcf_fec_info = {
     .instance_init = mcf_fec_instance_init,
     .class_init    = mcf_fec_class_init,
 };
+TYPE_INFO(mcf_fec_info)
 
-static void mcf_fec_register_types(void)
-{
-    type_register_static(&mcf_fec_info);
-}
 
-type_init(mcf_fec_register_types)
diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 1ba01754ee..c1531a8637 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -539,10 +539,6 @@ static const TypeInfo milkymist_minimac2_info = {
     .instance_size = sizeof(MilkymistMinimac2State),
     .class_init    = milkymist_minimac2_class_init,
 };
+TYPE_INFO(milkymist_minimac2_info)
 
-static void milkymist_minimac2_register_types(void)
-{
-    type_register_static(&milkymist_minimac2_info);
-}
 
-type_init(milkymist_minimac2_register_types)
diff --git a/hw/net/mipsnet.c b/hw/net/mipsnet.c
index 0c578c430c..137a964795 100644
--- a/hw/net/mipsnet.c
+++ b/hw/net/mipsnet.c
@@ -287,10 +287,6 @@ static const TypeInfo mipsnet_info = {
     .instance_size = sizeof(MIPSnetState),
     .class_init    = mipsnet_class_init,
 };
+TYPE_INFO(mipsnet_info)
 
-static void mipsnet_register_types(void)
-{
-    type_register_static(&mipsnet_info);
-}
 
-type_init(mipsnet_register_types)
diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
index 32ba9e8412..8bc6bcf46d 100644
--- a/hw/net/msf2-emac.c
+++ b/hw/net/msf2-emac.c
@@ -580,10 +580,6 @@ static const TypeInfo msf2_emac_info = {
     .instance_init = msf2_emac_init,
     .class_init    = msf2_emac_class_init,
 };
+TYPE_INFO(msf2_emac_info)
 
-static void msf2_emac_register_types(void)
-{
-    type_register_static(&msf2_emac_info);
-}
 
-type_init(msf2_emac_register_types)
diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
index a878056426..8d1fa0fc32 100644
--- a/hw/net/ne2000-isa.c
+++ b/hw/net/ne2000-isa.c
@@ -142,10 +142,6 @@ static const TypeInfo ne2000_isa_info = {
     .class_init    = isa_ne2000_class_initfn,
     .instance_init = isa_ne2000_instance_init,
 };
+TYPE_INFO(ne2000_isa_info)
 
-static void ne2000_isa_register_types(void)
-{
-    type_register_static(&ne2000_isa_info);
-}
 
-type_init(ne2000_isa_register_types)
diff --git a/hw/net/ne2000-pci.c b/hw/net/ne2000-pci.c
index 9e5d10859a..7508125610 100644
--- a/hw/net/ne2000-pci.c
+++ b/hw/net/ne2000-pci.c
@@ -127,10 +127,6 @@ static const TypeInfo ne2000_info = {
         { },
     },
 };
+TYPE_INFO(ne2000_info)
 
-static void ne2000_register_types(void)
-{
-    type_register_static(&ne2000_info);
-}
 
-type_init(ne2000_register_types)
diff --git a/hw/net/opencores_eth.c b/hw/net/opencores_eth.c
index 2ba0dc8c2f..8ef1197157 100644
--- a/hw/net/opencores_eth.c
+++ b/hw/net/opencores_eth.c
@@ -763,10 +763,6 @@ static const TypeInfo open_eth_info = {
     .instance_size = sizeof(OpenEthState),
     .class_init    = open_eth_class_init,
 };
+TYPE_INFO(open_eth_info)
 
-static void open_eth_register_types(void)
-{
-    type_register_static(&open_eth_info);
-}
 
-type_init(open_eth_register_types)
diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
index 49d3e42e83..aba8f19048 100644
--- a/hw/net/pcnet-pci.c
+++ b/hw/net/pcnet-pci.c
@@ -287,10 +287,6 @@ static const TypeInfo pcnet_info = {
         { },
     },
 };
+TYPE_INFO(pcnet_info)
 
-static void pci_pcnet_register_types(void)
-{
-    type_register_static(&pcnet_info);
-}
 
-type_init(pci_pcnet_register_types)
diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 1af1e6fa2f..0f9d4660a9 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -1531,10 +1531,6 @@ static const TypeInfo rocker_info = {
         { },
     },
 };
+TYPE_INFO(rocker_info)
 
-static void rocker_register_types(void)
-{
-    type_register_static(&rocker_info);
-}
 
-type_init(rocker_register_types)
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index ab93d78ab3..c6e9207f74 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -3452,10 +3452,6 @@ static const TypeInfo rtl8139_info = {
         { },
     },
 };
+TYPE_INFO(rtl8139_info)
 
-static void rtl8139_register_types(void)
-{
-    type_register_static(&rtl8139_info);
-}
 
-type_init(rtl8139_register_types)
diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index a347b6a4d5..bf7e3e6830 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -808,11 +808,8 @@ static const TypeInfo smc91c111_info = {
     .instance_size = sizeof(smc91c111_state),
     .class_init    = smc91c111_class_init,
 };
+TYPE_INFO(smc91c111_info)
 
-static void smc91c111_register_types(void)
-{
-    type_register_static(&smc91c111_info);
-}
 
 /* Legacy helper function.  Should go away when machine config files are
    implemented.  */
@@ -830,4 +827,3 @@ void smc91c111_init(NICInfo *nd, uint32_t base, qemu_irq irq)
     sysbus_connect_irq(s, 0, irq);
 }
 
-type_init(smc91c111_register_types)
diff --git a/hw/net/spapr_llan.c b/hw/net/spapr_llan.c
index 4cd02dda01..a6139568bb 100644
--- a/hw/net/spapr_llan.c
+++ b/hw/net/spapr_llan.c
@@ -869,6 +869,7 @@ static const TypeInfo spapr_vlan_info = {
     .instance_init = spapr_vlan_instance_init,
     .instance_finalize = spapr_vlan_instance_finalize,
 };
+TYPE_INFO(spapr_vlan_info)
 
 static void spapr_vlan_register_types(void)
 {
@@ -880,7 +881,6 @@ static void spapr_vlan_register_types(void)
     spapr_register_hypercall(H_MULTICAST_CTRL, h_multicast_ctrl);
     spapr_register_hypercall(H_CHANGE_LOGICAL_LAN_MAC,
                              h_change_logical_lan_mac);
-    type_register_static(&spapr_vlan_info);
 }
 
 type_init(spapr_vlan_register_types)
diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index cb6e2509ea..87399c89b6 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -517,10 +517,6 @@ static const TypeInfo stellaris_enet_info = {
     .instance_size = sizeof(stellaris_enet_state),
     .class_init    = stellaris_enet_class_init,
 };
+TYPE_INFO(stellaris_enet_info)
 
-static void stellaris_enet_register_types(void)
-{
-    type_register_static(&stellaris_enet_info);
-}
 
-type_init(stellaris_enet_register_types)
diff --git a/hw/net/sungem.c b/hw/net/sungem.c
index e4b7b57704..4c9e2bbda5 100644
--- a/hw/net/sungem.c
+++ b/hw/net/sungem.c
@@ -1444,10 +1444,6 @@ static const TypeInfo sungem_info = {
         { }
     }
 };
+TYPE_INFO(sungem_info)
 
-static void sungem_register_types(void)
-{
-    type_register_static(&sungem_info);
-}
 
-type_init(sungem_register_types)
diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index bc48d46b9f..6c38d3d5c6 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -973,10 +973,6 @@ static const TypeInfo sunhme_info = {
         { }
     }
 };
+TYPE_INFO(sunhme_info)
 
-static void sunhme_register_types(void)
-{
-    type_register_static(&sunhme_info);
-}
 
-type_init(sunhme_register_types)
diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index ca69f7ea5e..21f9a18655 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -1038,10 +1038,6 @@ static const TypeInfo tulip_info = {
         { },
     },
 };
+TYPE_INFO(tulip_info)
 
-static void tulip_register_types(void)
-{
-    type_register_static(&tulip_info);
-}
 
-type_init(tulip_register_types)
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index a1fe9e9285..1c0c9184ef 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3602,10 +3602,6 @@ static const TypeInfo virtio_net_info = {
     .instance_init = virtio_net_instance_init,
     .class_init = virtio_net_class_init,
 };
+TYPE_INFO(virtio_net_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_net_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 7a6ca4ec35..b484a2faf2 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -2523,11 +2523,11 @@ static const TypeInfo vmxnet3_info = {
         { }
     },
 };
+TYPE_INFO(vmxnet3_info)
 
 static void vmxnet3_register_types(void)
 {
     VMW_CBPRN("vmxnet3_register_types called...");
-    type_register_static(&vmxnet3_info);
 }
 
 type_init(vmxnet3_register_types)
diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
index 5bf1b61012..00f71dc951 100644
--- a/hw/net/xgmac.c
+++ b/hw/net/xgmac.c
@@ -433,10 +433,6 @@ static const TypeInfo xgmac_enet_info = {
     .instance_size = sizeof(XgmacState),
     .class_init    = xgmac_enet_class_init,
 };
+TYPE_INFO(xgmac_enet_info)
 
-static void xgmac_enet_register_types(void)
-{
-    type_register_static(&xgmac_enet_info);
-}
 
-type_init(xgmac_enet_register_types)
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 1e48eb70c9..9711a1dd8e 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -1065,6 +1065,7 @@ static const TypeInfo xilinx_enet_info = {
     .class_init    = xilinx_enet_class_init,
     .instance_init = xilinx_enet_init,
 };
+TYPE_INFO(xilinx_enet_info)
 
 static const TypeInfo xilinx_enet_data_stream_info = {
     .name          = TYPE_XILINX_AXI_ENET_DATA_STREAM,
@@ -1076,6 +1077,7 @@ static const TypeInfo xilinx_enet_data_stream_info = {
             { }
     }
 };
+TYPE_INFO(xilinx_enet_data_stream_info)
 
 static const TypeInfo xilinx_enet_control_stream_info = {
     .name          = TYPE_XILINX_AXI_ENET_CONTROL_STREAM,
@@ -1087,12 +1089,6 @@ static const TypeInfo xilinx_enet_control_stream_info = {
             { }
     }
 };
+TYPE_INFO(xilinx_enet_control_stream_info)
 
-static void xilinx_enet_register_types(void)
-{
-    type_register_static(&xilinx_enet_info);
-    type_register_static(&xilinx_enet_data_stream_info);
-    type_register_static(&xilinx_enet_control_stream_info);
-}
 
-type_init(xilinx_enet_register_types)
diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 71d16fef3d..735236cb0d 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -272,10 +272,6 @@ static const TypeInfo xilinx_ethlite_info = {
     .instance_init = xilinx_ethlite_init,
     .class_init    = xilinx_ethlite_class_init,
 };
+TYPE_INFO(xilinx_ethlite_info)
 
-static void xilinx_ethlite_register_types(void)
-{
-    type_register_static(&xilinx_ethlite_info);
-}
 
-type_init(xilinx_ethlite_register_types)
diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index 7c329300b8..42e32ff107 100644
--- a/hw/nubus/mac-nubus-bridge.c
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -36,10 +36,6 @@ static const TypeInfo mac_nubus_bridge_info = {
     .instance_size = sizeof(MacNubusState),
     .class_init    = mac_nubus_bridge_class_init,
 };
+TYPE_INFO(mac_nubus_bridge_info)
 
-static void mac_nubus_bridge_register_types(void)
-{
-    type_register_static(&mac_nubus_bridge_info);
-}
 
-type_init(mac_nubus_bridge_register_types)
diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
index cd8c6a91eb..678da60ddd 100644
--- a/hw/nubus/nubus-bridge.c
+++ b/hw/nubus/nubus-bridge.c
@@ -25,10 +25,6 @@ static const TypeInfo nubus_bridge_info = {
     .instance_size = sizeof(SysBusDevice),
     .class_init    = nubus_bridge_class_init,
 };
+TYPE_INFO(nubus_bridge_info)
 
-static void nubus_register_types(void)
-{
-    type_register_static(&nubus_bridge_info);
-}
 
-type_init(nubus_register_types)
diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index 942a6d5342..0b44ce3c34 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -102,10 +102,6 @@ static const TypeInfo nubus_bus_info = {
     .instance_init = nubus_init,
     .class_init = nubus_class_init,
 };
+TYPE_INFO(nubus_bus_info)
 
-static void nubus_register_types(void)
-{
-    type_register_static(&nubus_bus_info);
-}
 
-type_init(nubus_register_types)
diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index ffe78a8823..5a2f5a55d5 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -206,10 +206,6 @@ static const TypeInfo nubus_device_type_info = {
     .instance_size = sizeof(NubusDevice),
     .class_init = nubus_device_class_init,
 };
+TYPE_INFO(nubus_device_type_info)
 
-static void nubus_register_types(void)
-{
-    type_register_static(&nubus_device_type_info);
-}
 
-type_init(nubus_register_types)
diff --git a/hw/nvram/ds1225y.c b/hw/nvram/ds1225y.c
index d5cb922287..6daef757aa 100644
--- a/hw/nvram/ds1225y.c
+++ b/hw/nvram/ds1225y.c
@@ -162,10 +162,6 @@ static const TypeInfo nvram_sysbus_info = {
     .instance_size = sizeof(SysBusNvRamState),
     .class_init    = nvram_sysbus_class_init,
 };
+TYPE_INFO(nvram_sysbus_info)
 
-static void nvram_register_types(void)
-{
-    type_register_static(&nvram_sysbus_info);
-}
 
-type_init(nvram_register_types)
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index d46a2bec3f..95582d67a7 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -194,10 +194,6 @@ const TypeInfo at24c_eeprom_type = {
     .class_size = sizeof(I2CSlaveClass),
     .class_init = at24c_eeprom_class_init,
 };
+TYPE_INFO(at24c_eeprom_type)
 
-static void at24c_eeprom_register(void)
-{
-    type_register_static(&at24c_eeprom_type);
-}
 
-type_init(at24c_eeprom_register)
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index f3a4728288..0615197196 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1224,6 +1224,7 @@ static const TypeInfo fw_cfg_info = {
     .instance_size = sizeof(FWCfgState),
     .class_init    = fw_cfg_class_init,
 };
+TYPE_INFO(fw_cfg_info)
 
 static void fw_cfg_file_slots_allocate(FWCfgState *s, Error **errp)
 {
@@ -1297,6 +1298,7 @@ static const TypeInfo fw_cfg_io_info = {
     .instance_size = sizeof(FWCfgIoState),
     .class_init    = fw_cfg_io_class_init,
 };
+TYPE_INFO(fw_cfg_io_info)
 
 
 static Property fw_cfg_mem_properties[] = {
@@ -1359,19 +1361,13 @@ static const TypeInfo fw_cfg_mem_info = {
     .instance_size = sizeof(FWCfgMemState),
     .class_init    = fw_cfg_mem_class_init,
 };
+TYPE_INFO(fw_cfg_mem_info)
 
 static const TypeInfo fw_cfg_data_generator_interface_info = {
     .parent = TYPE_INTERFACE,
     .name = TYPE_FW_CFG_DATA_GENERATOR_INTERFACE,
     .class_size = sizeof(FWCfgDataGeneratorClass),
 };
+TYPE_INFO(fw_cfg_data_generator_interface_info)
 
-static void fw_cfg_register_types(void)
-{
-    type_register_static(&fw_cfg_info);
-    type_register_static(&fw_cfg_io_info);
-    type_register_static(&fw_cfg_mem_info);
-    type_register_static(&fw_cfg_data_generator_interface_info);
-}
 
-type_init(fw_cfg_register_types)
diff --git a/hw/nvram/mac_nvram.c b/hw/nvram/mac_nvram.c
index 11f2d31cdb..e2854a7a8d 100644
--- a/hw/nvram/mac_nvram.c
+++ b/hw/nvram/mac_nvram.c
@@ -127,11 +127,8 @@ static const TypeInfo macio_nvram_type_info = {
     .instance_size = sizeof(MacIONVRAMState),
     .class_init = macio_nvram_class_init,
 };
+TYPE_INFO(macio_nvram_type_info)
 
-static void macio_nvram_register_types(void)
-{
-    type_register_static(&macio_nvram_type_info);
-}
 
 /* Set up a system OpenBIOS NVRAM partition */
 static void pmac_format_nvram_partition_of(MacIONVRAMState *nvr, int off,
@@ -182,4 +179,3 @@ void pmac_format_nvram_partition(MacIONVRAMState *nvr, int len)
     pmac_format_nvram_partition_of(nvr, 0, len / 2);
     pmac_format_nvram_partition_osx(nvr, len / 2, len / 2);
 }
-type_init(macio_nvram_register_types)
diff --git a/hw/nvram/nrf51_nvm.c b/hw/nvram/nrf51_nvm.c
index f2283c1a8d..c410a4c483 100644
--- a/hw/nvram/nrf51_nvm.c
+++ b/hw/nvram/nrf51_nvm.c
@@ -382,10 +382,6 @@ static const TypeInfo nrf51_nvm_info = {
     .instance_init = nrf51_nvm_init,
     .class_init = nrf51_nvm_class_init
 };
+TYPE_INFO(nrf51_nvm_info)
 
-static void nrf51_nvm_register_types(void)
-{
-    type_register_static(&nrf51_nvm_info);
-}
 
-type_init(nrf51_nvm_register_types)
diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
index 386513499f..b1c33a5883 100644
--- a/hw/nvram/spapr_nvram.c
+++ b/hw/nvram/spapr_nvram.c
@@ -282,10 +282,6 @@ static const TypeInfo spapr_nvram_type_info = {
     .instance_size = sizeof(SpaprNvram),
     .class_init    = spapr_nvram_class_init,
 };
+TYPE_INFO(spapr_nvram_type_info)
 
-static void spapr_nvram_register_types(void)
-{
-    type_register_static(&spapr_nvram_type_info);
-}
 
-type_init(spapr_nvram_register_types)
diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
index 677a310b96..b36e7f90a3 100644
--- a/hw/pci-bridge/dec.c
+++ b/hw/pci-bridge/dec.c
@@ -76,6 +76,7 @@ static const TypeInfo dec_21154_pci_bridge_info = {
         { },
     },
 };
+TYPE_INFO(dec_21154_pci_bridge_info)
 
 PCIBus *pci_dec_21154_init(PCIBus *parent_bus, int devfn)
 {
@@ -138,6 +139,7 @@ static const TypeInfo dec_21154_pci_host_info = {
         { },
     },
 };
+TYPE_INFO(dec_21154_pci_host_info)
 
 static void pci_dec_21154_device_class_init(ObjectClass *klass, void *data)
 {
@@ -152,12 +154,6 @@ static const TypeInfo pci_dec_21154_device_info = {
     .instance_size = sizeof(DECState),
     .class_init    = pci_dec_21154_device_class_init,
 };
+TYPE_INFO(pci_dec_21154_device_info)
 
-static void dec_register_types(void)
-{
-    type_register_static(&pci_dec_21154_device_info);
-    type_register_static(&dec_21154_pci_host_info);
-    type_register_static(&dec_21154_pci_bridge_info);
-}
 
-type_init(dec_register_types)
diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index 2b3907655b..1ff0c82142 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -113,10 +113,6 @@ static const TypeInfo i82801b11_bridge_info = {
         { },
     },
 };
+TYPE_INFO(i82801b11_bridge_info)
 
-static void d2pbr_register(void)
-{
-    type_register_static(&i82801b11_bridge_info);
-}
 
-type_init(d2pbr_register);
diff --git a/hw/pci-bridge/ioh3420.c b/hw/pci-bridge/ioh3420.c
index f1e16135a3..c16bb0aafc 100644
--- a/hw/pci-bridge/ioh3420.c
+++ b/hw/pci-bridge/ioh3420.c
@@ -121,10 +121,6 @@ static const TypeInfo ioh3420_info = {
     .parent        = TYPE_PCIE_ROOT_PORT,
     .class_init    = ioh3420_class_init,
 };
+TYPE_INFO(ioh3420_info)
 
-static void ioh3420_register_types(void)
-{
-    type_register_static(&ioh3420_info);
-}
 
-type_init(ioh3420_register_types)
diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index 4a080b7c7b..d080a0ca18 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -278,6 +278,7 @@ static const TypeInfo pci_bridge_dev_info = {
         { }
     }
 };
+TYPE_INFO(pci_bridge_dev_info)
 
 /*
  * Multiseat bridge.  Same as the standard pci bridge, only with a
@@ -299,11 +300,6 @@ static const TypeInfo pci_bridge_dev_seat_info = {
     .instance_size     = sizeof(PCIBridgeDev),
     .class_init        = pci_bridge_dev_seat_class_init,
 };
+TYPE_INFO(pci_bridge_dev_seat_info)
 
-static void pci_bridge_dev_register(void)
-{
-    type_register_static(&pci_bridge_dev_info);
-    type_register_static(&pci_bridge_dev_seat_info);
-}
 
-type_init(pci_bridge_dev_register);
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 22f9fc223b..4c19a5051b 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -90,6 +90,7 @@ static const TypeInfo pxb_bus_info = {
     .instance_size = sizeof(PXBBus),
     .class_init    = pxb_bus_class_init,
 };
+TYPE_INFO(pxb_bus_info)
 
 static const TypeInfo pxb_pcie_bus_info = {
     .name          = TYPE_PXB_PCIE_BUS,
@@ -97,6 +98,7 @@ static const TypeInfo pxb_pcie_bus_info = {
     .instance_size = sizeof(PXBBus),
     .class_init    = pxb_bus_class_init,
 };
+TYPE_INFO(pxb_pcie_bus_info)
 
 static const char *pxb_host_root_bus_path(PCIHostState *host_bridge,
                                           PCIBus *rootbus)
@@ -157,6 +159,7 @@ static const TypeInfo pxb_host_info = {
     .parent        = TYPE_PCI_HOST_BRIDGE,
     .class_init    = pxb_host_class_init,
 };
+TYPE_INFO(pxb_host_info)
 
 /*
  * Registers the PXB bus as a child of pci host root bus.
@@ -324,6 +327,7 @@ static const TypeInfo pxb_dev_info = {
         { },
     },
 };
+TYPE_INFO(pxb_dev_info)
 
 static void pxb_pcie_dev_realize(PCIDevice *dev, Error **errp)
 {
@@ -362,14 +366,6 @@ static const TypeInfo pxb_pcie_dev_info = {
         { },
     },
 };
+TYPE_INFO(pxb_pcie_dev_info)
 
-static void pxb_register_types(void)
-{
-    type_register_static(&pxb_bus_info);
-    type_register_static(&pxb_pcie_bus_info);
-    type_register_static(&pxb_host_info);
-    type_register_static(&pxb_dev_info);
-    type_register_static(&pxb_pcie_dev_info);
-}
 
-type_init(pxb_register_types)
diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index eade133968..00b30b2a4b 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -171,10 +171,6 @@ static const TypeInfo pcie_pci_bridge_info = {
             { },
         }
 };
+TYPE_INFO(pcie_pci_bridge_info)
 
-static void pciepci_register(void)
-{
-    type_register_static(&pcie_pci_bridge_info);
-}
 
-type_init(pciepci_register);
diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
index f1cfe9d14a..b48d4b0ef1 100644
--- a/hw/pci-bridge/pcie_root_port.c
+++ b/hw/pci-bridge/pcie_root_port.c
@@ -189,10 +189,6 @@ static const TypeInfo rp_info = {
         { }
     },
 };
+TYPE_INFO(rp_info)
 
-static void rp_register_types(void)
-{
-    type_register_static(&rp_info);
-}
 
-type_init(rp_register_types)
diff --git a/hw/pci-bridge/simba.c b/hw/pci-bridge/simba.c
index ba55ab1939..c2783b3c0e 100644
--- a/hw/pci-bridge/simba.c
+++ b/hw/pci-bridge/simba.c
@@ -93,10 +93,6 @@ static const TypeInfo simba_pci_bridge_info = {
         { },
     },
 };
+TYPE_INFO(simba_pci_bridge_info)
 
-static void simba_register_types(void)
-{
-    type_register_static(&simba_pci_bridge_info);
-}
 
-type_init(simba_register_types)
diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 04aae72cd6..1ff57a0358 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -181,10 +181,6 @@ static const TypeInfo xio3130_downstream_info = {
         { }
     },
 };
+TYPE_INFO(xio3130_downstream_info)
 
-static void xio3130_downstream_register_types(void)
-{
-    type_register_static(&xio3130_downstream_info);
-}
 
-type_init(xio3130_downstream_register_types)
diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_upstream.c
index 5cd3af4fbc..4fe1695278 100644
--- a/hw/pci-bridge/xio3130_upstream.c
+++ b/hw/pci-bridge/xio3130_upstream.c
@@ -150,10 +150,6 @@ static const TypeInfo xio3130_upstream_info = {
         { }
     },
 };
+TYPE_INFO(xio3130_upstream_info)
 
-static void xio3130_upstream_register_types(void)
-{
-    type_register_static(&xio3130_upstream_info);
-}
 
-type_init(xio3130_upstream_register_types)
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 1405b3fc70..ea7e30155c 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -788,6 +788,7 @@ static const TypeInfo bonito_info = {
         { },
     },
 };
+TYPE_INFO(bonito_info)
 
 static void bonito_pcihost_class_init(ObjectClass *klass, void *data)
 {
@@ -802,11 +803,6 @@ static const TypeInfo bonito_pcihost_info = {
     .instance_size = sizeof(BonitoState),
     .class_init    = bonito_pcihost_class_init,
 };
+TYPE_INFO(bonito_pcihost_info)
 
-static void bonito_register_types(void)
-{
-    type_register_static(&bonito_pcihost_info);
-    type_register_static(&bonito_info);
-}
 
-type_init(bonito_register_types)
diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 8492c18991..d96f3a3a3a 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -737,6 +737,7 @@ static const TypeInfo designware_pcie_root_info = {
         { }
     },
 };
+TYPE_INFO(designware_pcie_root_info)
 
 static const TypeInfo designware_pcie_host_info = {
     .name       = TYPE_DESIGNWARE_PCIE_HOST,
@@ -745,10 +746,5 @@ static const TypeInfo designware_pcie_host_info = {
     .instance_init = designware_pcie_host_init,
     .class_init = designware_pcie_host_class_init,
 };
+TYPE_INFO(designware_pcie_host_info)
 
-static void designware_pcie_register(void)
-{
-    type_register_static(&designware_pcie_root_info);
-    type_register_static(&designware_pcie_host_info);
-}
-type_init(designware_pcie_register)
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 2bdbe7b456..fa1d12744e 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -136,6 +136,7 @@ static const TypeInfo gpex_host_info = {
     .instance_init = gpex_host_initfn,
     .class_init = gpex_host_class_init,
 };
+TYPE_INFO(gpex_host_info)
 
 /****************************************************************************
  * GPEX Root D0:F0
@@ -180,11 +181,6 @@ static const TypeInfo gpex_root_info = {
         { },
     },
 };
+TYPE_INFO(gpex_root_info)
 
-static void gpex_register(void)
-{
-    type_register_static(&gpex_root_info);
-    type_register_static(&gpex_host_info);
-}
 
-type_init(gpex_register)
diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index 4b3af0c704..066dc773e2 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -149,6 +149,7 @@ static const TypeInfo grackle_pci_info = {
         { },
     },
 };
+TYPE_INFO(grackle_pci_info)
 
 static char *grackle_ofw_unit_address(const SysBusDevice *dev)
 {
@@ -181,11 +182,6 @@ static const TypeInfo grackle_host_info = {
     .instance_init = grackle_init,
     .class_init    = grackle_class_init,
 };
+TYPE_INFO(grackle_host_info)
 
-static void grackle_register_types(void)
-{
-    type_register_static(&grackle_pci_info);
-    type_register_static(&grackle_host_info);
-}
 
-type_init(grackle_register_types)
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 8ed2417f0c..56ac1089b6 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -369,6 +369,7 @@ static const TypeInfo i440fx_info = {
         { },
     },
 };
+TYPE_INFO(i440fx_info)
 
 static const char *i440fx_pcihost_root_bus_path(PCIHostState *host_bridge,
                                                 PCIBus *rootbus)
@@ -410,11 +411,6 @@ static const TypeInfo i440fx_pcihost_info = {
     .instance_init = i440fx_pcihost_initfn,
     .class_init    = i440fx_pcihost_class_init,
 };
+TYPE_INFO(i440fx_pcihost_info)
 
-static void i440fx_register_types(void)
-{
-    type_register_static(&i440fx_info);
-    type_register_static(&i440fx_pcihost_info);
-}
 
-type_init(i440fx_register_types)
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 82132c12ca..171e4e1c71 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -893,6 +893,7 @@ static const TypeInfo pnv_phb3_iommu_memory_region_info = {
     .name = TYPE_PNV_PHB3_IOMMU_MEMORY_REGION,
     .class_init = pnv_phb3_iommu_memory_region_class_init,
 };
+TYPE_INFO(pnv_phb3_iommu_memory_region_info)
 
 /*
  * MSI/MSIX memory region implementation.
@@ -1113,6 +1114,7 @@ static const TypeInfo pnv_phb3_type_info = {
     .class_init    = pnv_phb3_class_init,
     .instance_init = pnv_phb3_instance_init,
 };
+TYPE_INFO(pnv_phb3_type_info)
 
 static void pnv_phb3_root_bus_class_init(ObjectClass *klass, void *data)
 {
@@ -1134,6 +1136,7 @@ static const TypeInfo pnv_phb3_root_bus_info = {
         { }
     },
 };
+TYPE_INFO(pnv_phb3_root_bus_info)
 
 static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
 {
@@ -1173,13 +1176,6 @@ static const TypeInfo pnv_phb3_root_port_info = {
     .instance_size = sizeof(PnvPHB3RootPort),
     .class_init    = pnv_phb3_root_port_class_init,
 };
+TYPE_INFO(pnv_phb3_root_port_info)
 
-static void pnv_phb3_register_types(void)
-{
-    type_register_static(&pnv_phb3_root_bus_info);
-    type_register_static(&pnv_phb3_root_port_info);
-    type_register_static(&pnv_phb3_type_info);
-    type_register_static(&pnv_phb3_iommu_memory_region_info);
-}
 
-type_init(pnv_phb3_register_types)
diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
index 099d2092a2..a57a34c405 100644
--- a/hw/pci-host/pnv_phb3_msi.c
+++ b/hw/pci-host/pnv_phb3_msi.c
@@ -310,13 +310,9 @@ static const TypeInfo phb3_msi_info = {
     .class_size = sizeof(ICSStateClass),
     .instance_init = phb3_msi_instance_init,
 };
+TYPE_INFO(phb3_msi_info)
 
-static void pnv_phb3_msi_register_types(void)
-{
-    type_register_static(&phb3_msi_info);
-}
 
-type_init(pnv_phb3_msi_register_types);
 
 void pnv_phb3_msi_pic_print_info(Phb3MsiState *msi, Monitor *mon)
 {
diff --git a/hw/pci-host/pnv_phb3_pbcq.c b/hw/pci-host/pnv_phb3_pbcq.c
index a0526aa1ec..edb7eb1f70 100644
--- a/hw/pci-host/pnv_phb3_pbcq.c
+++ b/hw/pci-host/pnv_phb3_pbcq.c
@@ -349,10 +349,6 @@ static const TypeInfo pnv_pbcq_type_info = {
         { }
     }
 };
+TYPE_INFO(pnv_pbcq_type_info)
 
-static void pnv_pbcq_register_types(void)
-{
-    type_register_static(&pnv_pbcq_type_info);
-}
 
-type_init(pnv_pbcq_register_types)
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 75ad766fe0..6e8c45e200 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1058,6 +1058,7 @@ static const TypeInfo pnv_phb4_iommu_memory_region_info = {
     .name = TYPE_PNV_PHB4_IOMMU_MEMORY_REGION,
     .class_init = pnv_phb4_iommu_memory_region_class_init,
 };
+TYPE_INFO(pnv_phb4_iommu_memory_region_info)
 
 /*
  * MSI/MSIX memory region implementation.
@@ -1301,6 +1302,7 @@ static const TypeInfo pnv_phb4_type_info = {
             { },
     }
 };
+TYPE_INFO(pnv_phb4_type_info)
 
 static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
 {
@@ -1322,6 +1324,7 @@ static const TypeInfo pnv_phb4_root_bus_info = {
         { }
     },
 };
+TYPE_INFO(pnv_phb4_root_bus_info)
 
 static void pnv_phb4_root_port_reset(DeviceState *dev)
 {
@@ -1385,16 +1388,9 @@ static const TypeInfo pnv_phb4_root_port_info = {
     .instance_size = sizeof(PnvPHB4RootPort),
     .class_init    = pnv_phb4_root_port_class_init,
 };
+TYPE_INFO(pnv_phb4_root_port_info)
 
-static void pnv_phb4_register_types(void)
-{
-    type_register_static(&pnv_phb4_root_bus_info);
-    type_register_static(&pnv_phb4_root_port_info);
-    type_register_static(&pnv_phb4_type_info);
-    type_register_static(&pnv_phb4_iommu_memory_region_info);
-}
 
-type_init(pnv_phb4_register_types);
 
 void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
 {
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 741ddc90ed..dcbbce0d20 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -513,6 +513,7 @@ static const TypeInfo pnv_pec_type_info = {
         { }
     }
 };
+TYPE_INFO(pnv_pec_type_info)
 
 static void pnv_pec_stk_instance_init(Object *obj)
 {
@@ -583,11 +584,6 @@ static const TypeInfo pnv_pec_stk_type_info = {
         { }
     }
 };
+TYPE_INFO(pnv_pec_stk_type_info)
 
-static void pnv_pec_register_types(void)
-{
-    type_register_static(&pnv_pec_type_info);
-    type_register_static(&pnv_pec_stk_type_info);
-}
 
-type_init(pnv_pec_register_types);
diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
index d71072731d..c2a8527521 100644
--- a/hw/pci-host/ppce500.c
+++ b/hw/pci-host/ppce500.c
@@ -518,6 +518,7 @@ static const TypeInfo e500_host_bridge_info = {
         { },
     },
 };
+TYPE_INFO(e500_host_bridge_info)
 
 static Property pcihost_properties[] = {
     DEFINE_PROP_UINT32("first_slot", PPCE500PCIState, first_slot, 0x11),
@@ -541,11 +542,6 @@ static const TypeInfo e500_pcihost_info = {
     .instance_size = sizeof(PPCE500PCIState),
     .class_init    = e500_pcihost_class_init,
 };
+TYPE_INFO(e500_pcihost_info)
 
-static void e500_pci_register_types(void)
-{
-    type_register_static(&e500_pcihost_info);
-    type_register_static(&e500_host_bridge_info);
-}
 
-type_init(e500_pci_register_types)
diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 4b93fd2b01..5de4ab83f9 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -395,6 +395,7 @@ static const TypeInfo raven_info = {
         { },
     },
 };
+TYPE_INFO(raven_info)
 
 static Property raven_pcihost_properties[] = {
     DEFINE_PROP_UINT32("elf-machine", PREPPCIState, pci_dev.elf_machine,
@@ -423,11 +424,6 @@ static const TypeInfo raven_pcihost_info = {
     .instance_init = raven_pcihost_initfn,
     .class_init = raven_pcihost_class_init,
 };
+TYPE_INFO(raven_pcihost_info)
 
-static void raven_register_types(void)
-{
-    type_register_static(&raven_pcihost_info);
-    type_register_static(&raven_info);
-}
 
-type_init(raven_register_types)
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index b67cb9c29f..df0e50d1b9 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -261,6 +261,7 @@ static const TypeInfo q35_host_info = {
     .instance_init = q35_host_initfn,
     .class_init = q35_host_class_init,
 };
+TYPE_INFO(q35_host_info)
 
 /****************************************************************************
  * MCH D0:F0
@@ -706,11 +707,6 @@ static const TypeInfo mch_info = {
         { },
     },
 };
+TYPE_INFO(mch_info)
 
-static void q35_register(void)
-{
-    type_register_static(&mch_info);
-    type_register_static(&q35_host_info);
-}
 
-type_init(q35_register);
diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c
index 0cc68585f8..5a67f55a11 100644
--- a/hw/pci-host/sabre.c
+++ b/hw/pci-host/sabre.c
@@ -499,6 +499,7 @@ static const TypeInfo sabre_pci_info = {
         { },
     },
 };
+TYPE_INFO(sabre_pci_info)
 
 static char *sabre_ofw_unit_address(const SysBusDevice *dev)
 {
@@ -535,11 +536,6 @@ static const TypeInfo sabre_info = {
     .instance_init = sabre_init,
     .class_init    = sabre_class_init,
 };
+TYPE_INFO(sabre_info)
 
-static void sabre_register_types(void)
-{
-    type_register_static(&sabre_info);
-    type_register_static(&sabre_pci_info);
-}
 
-type_init(sabre_register_types)
diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index 1ed1072eeb..b1aa37101b 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -380,6 +380,7 @@ static const TypeInfo unin_main_pci_host_info = {
         { },
     },
 };
+TYPE_INFO(unin_main_pci_host_info)
 
 static void u3_agp_pci_host_class_init(ObjectClass *klass, void *data)
 {
@@ -408,6 +409,7 @@ static const TypeInfo u3_agp_pci_host_info = {
         { },
     },
 };
+TYPE_INFO(u3_agp_pci_host_info)
 
 static void unin_agp_pci_host_class_init(ObjectClass *klass, void *data)
 {
@@ -436,6 +438,7 @@ static const TypeInfo unin_agp_pci_host_info = {
         { },
     },
 };
+TYPE_INFO(unin_agp_pci_host_info)
 
 static void unin_internal_pci_host_class_init(ObjectClass *klass, void *data)
 {
@@ -464,6 +467,7 @@ static const TypeInfo unin_internal_pci_host_info = {
         { },
     },
 };
+TYPE_INFO(unin_internal_pci_host_info)
 
 static Property pci_unin_main_pci_host_props[] = {
     DEFINE_PROP_UINT32("ofw-addr", UNINHostState, ofw_addr, -1),
@@ -489,6 +493,7 @@ static const TypeInfo pci_unin_main_info = {
     .instance_init = pci_unin_main_init,
     .class_init    = pci_unin_main_class_init,
 };
+TYPE_INFO(pci_unin_main_info)
 
 static void pci_u3_agp_class_init(ObjectClass *klass, void *data)
 {
@@ -505,6 +510,7 @@ static const TypeInfo pci_u3_agp_info = {
     .instance_init = pci_u3_agp_init,
     .class_init    = pci_u3_agp_class_init,
 };
+TYPE_INFO(pci_u3_agp_info)
 
 static void pci_unin_agp_class_init(ObjectClass *klass, void *data)
 {
@@ -521,6 +527,7 @@ static const TypeInfo pci_unin_agp_info = {
     .instance_init = pci_unin_agp_init,
     .class_init    = pci_unin_agp_class_init,
 };
+TYPE_INFO(pci_unin_agp_info)
 
 static void pci_unin_internal_class_init(ObjectClass *klass, void *data)
 {
@@ -537,6 +544,7 @@ static const TypeInfo pci_unin_internal_info = {
     .instance_init = pci_unin_internal_init,
     .class_init    = pci_unin_internal_class_init,
 };
+TYPE_INFO(pci_unin_internal_info)
 
 /* UniN device */
 static void unin_write(void *opaque, hwaddr addr, uint64_t value,
@@ -592,20 +600,12 @@ static const TypeInfo unin_info = {
     .instance_init = unin_init,
     .class_init    = unin_class_init,
 };
+TYPE_INFO(unin_info)
 
 static void unin_register_types(void)
 {
-    type_register_static(&unin_main_pci_host_info);
-    type_register_static(&u3_agp_pci_host_info);
-    type_register_static(&unin_agp_pci_host_info);
-    type_register_static(&unin_internal_pci_host_info);
 
-    type_register_static(&pci_unin_main_info);
-    type_register_static(&pci_u3_agp_info);
-    type_register_static(&pci_unin_agp_info);
-    type_register_static(&pci_unin_internal_info);
 
-    type_register_static(&unin_info);
 }
 
 type_init(unin_register_types)
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index 7e4aa467a2..fd71ae8d19 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -494,6 +494,7 @@ static const TypeInfo versatile_pci_host_info = {
         { },
     },
 };
+TYPE_INFO(versatile_pci_host_info)
 
 static Property pci_vpb_properties[] = {
     DEFINE_PROP_UINT8("broken-irq-mapping", PCIVPBState, irq_mapping_prop,
@@ -518,6 +519,7 @@ static const TypeInfo pci_vpb_info = {
     .instance_init = pci_vpb_init,
     .class_init    = pci_vpb_class_init,
 };
+TYPE_INFO(pci_vpb_info)
 
 static void pci_realview_init(Object *obj)
 {
@@ -535,12 +537,6 @@ static const TypeInfo pci_realview_info = {
     .parent        = TYPE_VERSATILE_PCI,
     .instance_init = pci_realview_init,
 };
+TYPE_INFO(pci_realview_info)
 
-static void versatile_pci_register_types(void)
-{
-    type_register_static(&pci_vpb_info);
-    type_register_static(&pci_realview_info);
-    type_register_static(&versatile_pci_host_info);
-}
 
-type_init(versatile_pci_register_types)
diff --git a/hw/pci-host/xen_igd_pt.c b/hw/pci-host/xen_igd_pt.c
index d094b675d6..27e2e475c6 100644
--- a/hw/pci-host/xen_igd_pt.c
+++ b/hw/pci-host/xen_igd_pt.c
@@ -110,10 +110,6 @@ static const TypeInfo igd_passthrough_i440fx_info = {
     .instance_size = sizeof(PCII440FXState),
     .class_init    = igd_passthrough_i440fx_class_init,
 };
+TYPE_INFO(igd_passthrough_i440fx_info)
 
-static void igd_pt_i440fx_register_types(void)
-{
-    type_register_static(&igd_passthrough_i440fx_info);
-}
 
-type_init(igd_pt_i440fx_register_types)
diff --git a/hw/pci-host/xilinx-pcie.c b/hw/pci-host/xilinx-pcie.c
index 3b321421b6..896a0d7b22 100644
--- a/hw/pci-host/xilinx-pcie.c
+++ b/hw/pci-host/xilinx-pcie.c
@@ -185,6 +185,7 @@ static const TypeInfo xilinx_pcie_host_info = {
     .instance_init = xilinx_pcie_host_init,
     .class_init = xilinx_pcie_host_class_init,
 };
+TYPE_INFO(xilinx_pcie_host_info)
 
 static uint32_t xilinx_pcie_root_config_read(PCIDevice *d,
                                              uint32_t address, int len)
@@ -321,11 +322,6 @@ static const TypeInfo xilinx_pcie_root_info = {
         { }
     },
 };
+TYPE_INFO(xilinx_pcie_root_info)
 
-static void xilinx_pcie_register(void)
-{
-    type_register_static(&xilinx_pcie_root_info);
-    type_register_static(&xilinx_pcie_host_info);
-}
 
-type_init(xilinx_pcie_register)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index de0fae10ab..938a307b86 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -191,16 +191,19 @@ static const TypeInfo pci_bus_info = {
     .class_size = sizeof(PCIBusClass),
     .class_init = pci_bus_class_init,
 };
+TYPE_INFO(pci_bus_info)
 
 static const TypeInfo pcie_interface_info = {
     .name          = INTERFACE_PCIE_DEVICE,
     .parent        = TYPE_INTERFACE,
 };
+TYPE_INFO(pcie_interface_info)
 
 static const TypeInfo conventional_pci_interface_info = {
     .name          = INTERFACE_CONVENTIONAL_PCI_DEVICE,
     .parent        = TYPE_INTERFACE,
 };
+TYPE_INFO(conventional_pci_interface_info)
 
 static void pcie_bus_class_init(ObjectClass *klass, void *data)
 {
@@ -214,6 +217,7 @@ static const TypeInfo pcie_bus_info = {
     .parent = TYPE_PCI_BUS,
     .class_init = pcie_bus_class_init,
 };
+TYPE_INFO(pcie_bus_info)
 
 static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
 static void pci_update_mappings(PCIDevice *d);
@@ -2824,14 +2828,6 @@ static const TypeInfo pci_device_type_info = {
     .class_init = pci_device_class_init,
     .class_base_init = pci_device_class_base_init,
 };
+TYPE_INFO(pci_device_type_info)
 
-static void pci_register_types(void)
-{
-    type_register_static(&pci_bus_info);
-    type_register_static(&pcie_bus_info);
-    type_register_static(&conventional_pci_interface_info);
-    type_register_static(&pcie_interface_info);
-    type_register_static(&pci_device_type_info);
-}
 
-type_init(pci_register_types)
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 3789c17edc..622779a55c 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -473,10 +473,6 @@ static const TypeInfo pci_bridge_type_info = {
     .instance_size = sizeof(PCIBridge),
     .abstract = true,
 };
+TYPE_INFO(pci_bridge_type_info)
 
-static void pci_bridge_register_types(void)
-{
-    type_register_static(&pci_bridge_type_info);
-}
 
-type_init(pci_bridge_register_types)
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index 8ca5fadcbd..9348314164 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -240,10 +240,6 @@ static const TypeInfo pci_host_type_info = {
     .instance_size = sizeof(PCIHostState),
     .class_init = pci_host_class_init,
 };
+TYPE_INFO(pci_host_type_info)
 
-static void pci_host_register_types(void)
-{
-    type_register_static(&pci_host_type_info);
-}
 
-type_init(pci_host_register_types)
diff --git a/hw/pci/pcie_host.c b/hw/pci/pcie_host.c
index 3534006f99..5f0136694b 100644
--- a/hw/pci/pcie_host.c
+++ b/hw/pci/pcie_host.c
@@ -128,10 +128,6 @@ static const TypeInfo pcie_host_type_info = {
     .instance_size = sizeof(PCIExpressHost),
     .instance_init = pcie_host_init,
 };
+TYPE_INFO(pcie_host_type_info)
 
-static void pcie_host_register_types(void)
-{
-    type_register_static(&pcie_host_type_info);
-}
 
-type_init(pcie_host_register_types)
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index eb563ad435..dee5065217 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -143,6 +143,7 @@ static const TypeInfo pcie_port_type_info = {
     .abstract = true,
     .class_init = pcie_port_class_init,
 };
+TYPE_INFO(pcie_port_type_info)
 
 static Property pcie_slot_props[] = {
     DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
@@ -174,11 +175,6 @@ static const TypeInfo pcie_slot_type_info = {
         { }
     }
 };
+TYPE_INFO(pcie_slot_type_info)
 
-static void pcie_port_register_types(void)
-{
-    type_register_static(&pcie_port_type_info);
-    type_register_static(&pcie_slot_type_info);
-}
 
-type_init(pcie_port_register_types)
diff --git a/hw/pcmcia/pcmcia.c b/hw/pcmcia/pcmcia.c
index 03d13e7d67..c53a1ab47e 100644
--- a/hw/pcmcia/pcmcia.c
+++ b/hw/pcmcia/pcmcia.c
@@ -15,10 +15,6 @@ static const TypeInfo pcmcia_card_type_info = {
     .abstract = true,
     .class_size = sizeof(PCMCIACardClass),
 };
+TYPE_INFO(pcmcia_card_type_info)
 
-static void pcmcia_register_types(void)
-{
-    type_register_static(&pcmcia_card_type_info);
-}
 
-type_init(pcmcia_register_types)
diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c
index fcca7e571b..a755ae9116 100644
--- a/hw/pcmcia/pxa2xx.c
+++ b/hw/pcmcia/pxa2xx.c
@@ -254,10 +254,6 @@ static const TypeInfo pxa2xx_pcmcia_type_info = {
     .instance_size = sizeof(PXA2xxPCMCIAState),
     .instance_init = pxa2xx_pcmcia_initfn,
 };
+TYPE_INFO(pxa2xx_pcmcia_type_info)
 
-static void pxa2xx_pcmcia_register_types(void)
-{
-    type_register_static(&pxa2xx_pcmcia_type_info);
-}
 
-type_init(pxa2xx_pcmcia_register_types)
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index ab9884e315..2ddc55e5c5 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1147,6 +1147,7 @@ static const TypeInfo e500_ccsr_info = {
     .instance_size = sizeof(PPCE500CCSRState),
     .instance_init = e500_ccsr_initfn,
 };
+TYPE_INFO(e500_ccsr_info)
 
 static const TypeInfo ppce500_info = {
     .name          = TYPE_PPCE500_MACHINE,
@@ -1155,11 +1156,6 @@ static const TypeInfo ppce500_info = {
     .instance_size = sizeof(PPCE500MachineState),
     .class_size    = sizeof(PPCE500MachineClass),
 };
+TYPE_INFO(ppce500_info)
 
-static void e500_register_types(void)
-{
-    type_register_static(&e500_ccsr_info);
-    type_register_static(&ppce500_info);
-}
 
-type_init(e500_register_types)
diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index bddd5e7c48..711c2f04eb 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -110,9 +110,5 @@ static const TypeInfo e500plat_info = {
          { }
     }
 };
+TYPE_INFO(e500plat_info)
 
-static void e500plat_register_types(void)
-{
-    type_register_static(&e500plat_info);
-}
-type_init(e500plat_register_types)
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index e42bd7a626..0ce36a743f 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -645,10 +645,6 @@ static const TypeInfo core99_machine_info = {
         { }
     },
 };
+TYPE_INFO(core99_machine_info)
 
-static void mac_machine_register_types(void)
-{
-    type_register_static(&core99_machine_info);
-}
 
-type_init(mac_machine_register_types)
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 7aba040f1b..55e17988ca 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -454,10 +454,6 @@ static const TypeInfo ppc_heathrow_machine_info = {
         { }
     },
 };
+TYPE_INFO(ppc_heathrow_machine_info)
 
-static void ppc_heathrow_register_types(void)
-{
-    type_register_static(&ppc_heathrow_machine_info);
-}
 
-type_init(ppc_heathrow_register_types);
diff --git a/hw/ppc/mpc8544_guts.c b/hw/ppc/mpc8544_guts.c
index b96ea36f98..3a2a6f5f5d 100644
--- a/hw/ppc/mpc8544_guts.c
+++ b/hw/ppc/mpc8544_guts.c
@@ -133,10 +133,6 @@ static const TypeInfo mpc8544_guts_info = {
     .instance_size = sizeof(GutsState),
     .instance_init = mpc8544_guts_initfn,
 };
+TYPE_INFO(mpc8544_guts_info)
 
-static void mpc8544_guts_register_types(void)
-{
-    type_register_static(&mpc8544_guts_info);
-}
 
-type_init(mpc8544_guts_register_types)
diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
index 81177505f0..c9a0d0069d 100644
--- a/hw/ppc/mpc8544ds.c
+++ b/hw/ppc/mpc8544ds.c
@@ -65,10 +65,6 @@ static const TypeInfo mpc8544ds_info = {
     .parent        = TYPE_PPCE500_MACHINE,
     .class_init    = e500plat_machine_class_init,
 };
+TYPE_INFO(mpc8544ds_info)
 
-static void mpc8544ds_register_types(void)
-{
-    type_register_static(&mpc8544ds_info);
-}
 
-type_init(mpc8544ds_register_types)
diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index 4724ddf96c..06fbe76c5c 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -431,10 +431,6 @@ static const TypeInfo pnv_quad_info = {
     .instance_size = sizeof(PnvQuad),
     .class_init    = pnv_quad_class_init,
 };
+TYPE_INFO(pnv_quad_info)
 
-static void pnv_core_register_types(void)
-{
-    type_register_static(&pnv_quad_info);
-}
 
-type_init(pnv_core_register_types)
diff --git a/hw/ppc/pnv_homer.c b/hw/ppc/pnv_homer.c
index 9a262629b7..08d2d36722 100644
--- a/hw/ppc/pnv_homer.c
+++ b/hw/ppc/pnv_homer.c
@@ -188,6 +188,7 @@ static const TypeInfo pnv_homer_power8_type_info = {
     .instance_size = sizeof(PnvHomer),
     .class_init    = pnv_homer_power8_class_init,
 };
+TYPE_INFO(pnv_homer_power8_type_info)
 
 /* P9 Pstate table */
 
@@ -331,6 +332,7 @@ static const TypeInfo pnv_homer_power9_type_info = {
     .instance_size = sizeof(PnvHomer),
     .class_init    = pnv_homer_power9_class_init,
 };
+TYPE_INFO(pnv_homer_power9_type_info)
 
 static void pnv_homer_realize(DeviceState *dev, Error **errp)
 {
@@ -371,12 +373,6 @@ static const TypeInfo pnv_homer_type_info = {
     .class_size    = sizeof(PnvHomerClass),
     .abstract      = true,
 };
+TYPE_INFO(pnv_homer_type_info)
 
-static void pnv_homer_register_types(void)
-{
-    type_register_static(&pnv_homer_type_info);
-    type_register_static(&pnv_homer_power8_type_info);
-    type_register_static(&pnv_homer_power9_type_info);
-}
 
-type_init(pnv_homer_register_types);
diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index b5ffa48dac..d6fe6d1d25 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -653,6 +653,7 @@ static const TypeInfo pnv_lpc_power8_info = {
         { }
     }
 };
+TYPE_INFO(pnv_lpc_power8_info)
 
 static void pnv_lpc_power9_realize(DeviceState *dev, Error **errp)
 {
@@ -690,6 +691,7 @@ static const TypeInfo pnv_lpc_power9_info = {
     .instance_size = sizeof(PnvLpcController),
     .class_init    = pnv_lpc_power9_class_init,
 };
+TYPE_INFO(pnv_lpc_power9_info)
 
 static void pnv_lpc_power10_class_init(ObjectClass *klass, void *data)
 {
@@ -703,6 +705,7 @@ static const TypeInfo pnv_lpc_power10_info = {
     .parent        = TYPE_PNV9_LPC,
     .class_init    = pnv_lpc_power10_class_init,
 };
+TYPE_INFO(pnv_lpc_power10_info)
 
 static void pnv_lpc_realize(DeviceState *dev, Error **errp)
 {
@@ -772,16 +775,9 @@ static const TypeInfo pnv_lpc_info = {
     .class_size    = sizeof(PnvLpcClass),
     .abstract      = true,
 };
+TYPE_INFO(pnv_lpc_info)
 
-static void pnv_lpc_register_types(void)
-{
-    type_register_static(&pnv_lpc_info);
-    type_register_static(&pnv_lpc_power8_info);
-    type_register_static(&pnv_lpc_power9_info);
-    type_register_static(&pnv_lpc_power10_info);
-}
 
-type_init(pnv_lpc_register_types)
 
 /* If we don't use the built-in LPC interrupt deserializer, we need
  * to provide a set of qirqs for the ISA bus or things will go bad.
diff --git a/hw/ppc/pnv_occ.c b/hw/ppc/pnv_occ.c
index 5a716c256e..9fde6cde7d 100644
--- a/hw/ppc/pnv_occ.c
+++ b/hw/ppc/pnv_occ.c
@@ -177,6 +177,7 @@ static const TypeInfo pnv_occ_power8_type_info = {
     .instance_size = sizeof(PnvOCC),
     .class_init    = pnv_occ_power8_class_init,
 };
+TYPE_INFO(pnv_occ_power8_type_info)
 
 #define P9_OCB_OCI_OCCMISC              0x6080
 #define P9_OCB_OCI_OCCMISC_CLEAR        0x6081
@@ -248,6 +249,7 @@ static const TypeInfo pnv_occ_power9_type_info = {
     .instance_size = sizeof(PnvOCC),
     .class_init    = pnv_occ_power9_class_init,
 };
+TYPE_INFO(pnv_occ_power9_type_info)
 
 static void pnv_occ_realize(DeviceState *dev, Error **errp)
 {
@@ -291,12 +293,6 @@ static const TypeInfo pnv_occ_type_info = {
     .class_size    = sizeof(PnvOCCClass),
     .abstract      = true,
 };
+TYPE_INFO(pnv_occ_type_info)
 
-static void pnv_occ_register_types(void)
-{
-    type_register_static(&pnv_occ_type_info);
-    type_register_static(&pnv_occ_power8_type_info);
-    type_register_static(&pnv_occ_power9_type_info);
-}
 
-type_init(pnv_occ_register_types);
diff --git a/hw/ppc/pnv_pnor.c b/hw/ppc/pnv_pnor.c
index c365ee58b8..ab549a50ad 100644
--- a/hw/ppc/pnv_pnor.c
+++ b/hw/ppc/pnv_pnor.c
@@ -132,10 +132,6 @@ static const TypeInfo pnv_pnor_info = {
     .instance_size = sizeof(PnvPnor),
     .class_init    = pnv_pnor_class_init,
 };
+TYPE_INFO(pnv_pnor_info)
 
-static void pnv_pnor_register_types(void)
-{
-    type_register_static(&pnv_pnor_info);
-}
 
-type_init(pnv_pnor_register_types)
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 6a479cac53..80e5d5b7b1 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -589,6 +589,7 @@ static const TypeInfo pnv_psi_power8_info = {
     .instance_init = pnv_psi_power8_instance_init,
     .class_init    = pnv_psi_power8_class_init,
 };
+TYPE_INFO(pnv_psi_power8_info)
 
 
 /* Common registers */
@@ -898,6 +899,7 @@ static const TypeInfo pnv_psi_power9_info = {
             { },
     },
 };
+TYPE_INFO(pnv_psi_power9_info)
 
 static void pnv_psi_power10_class_init(ObjectClass *klass, void *data)
 {
@@ -918,6 +920,7 @@ static const TypeInfo pnv_psi_power10_info = {
     .parent        = TYPE_PNV9_PSI,
     .class_init    = pnv_psi_power10_class_init,
 };
+TYPE_INFO(pnv_psi_power10_info)
 
 static void pnv_psi_class_init(ObjectClass *klass, void *data)
 {
@@ -944,16 +947,9 @@ static const TypeInfo pnv_psi_info = {
         { }
     }
 };
+TYPE_INFO(pnv_psi_info)
 
-static void pnv_psi_register_types(void)
-{
-    type_register_static(&pnv_psi_info);
-    type_register_static(&pnv_psi_power8_info);
-    type_register_static(&pnv_psi_power9_info);
-    type_register_static(&pnv_psi_power10_info);
-}
 
-type_init(pnv_psi_register_types);
 
 void pnv_psi_pic_print_info(Pnv9Psi *psi9, Monitor *mon)
 {
diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index b681c72575..74f1e042c6 100644
--- a/hw/ppc/pnv_xscom.c
+++ b/hw/ppc/pnv_xscom.c
@@ -240,13 +240,9 @@ static const TypeInfo pnv_xscom_interface_info = {
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(PnvXScomInterfaceClass),
 };
+TYPE_INFO(pnv_xscom_interface_info)
 
-static void pnv_xscom_register_types(void)
-{
-    type_register_static(&pnv_xscom_interface_info);
-}
 
-type_init(pnv_xscom_register_types)
 
 typedef struct ForeachPopulateArgs {
     void *fdt;
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 6198ec1035..d86f8c5f11 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -319,6 +319,7 @@ static const TypeInfo ref405ep_type = {
     .parent = TYPE_MACHINE,
     .class_init = ref405ep_class_init,
 };
+TYPE_INFO(ref405ep_type)
 
 /*****************************************************************************/
 /* AMCC Taihu evaluation board */
@@ -550,11 +551,6 @@ static const TypeInfo taihu_type = {
     .parent = TYPE_MACHINE,
     .class_init = taihu_class_init,
 };
+TYPE_INFO(taihu_type)
 
-static void ppc405_machine_init(void)
-{
-    type_register_static(&ref405ep_type);
-    type_register_static(&taihu_type);
-}
 
-type_init(ppc405_machine_init)
diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index 2ee2d4f4fc..37feaa2f06 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -516,10 +516,6 @@ static const TypeInfo ppc440_pcix_info = {
     .instance_size = sizeof(PPC440PCIXState),
     .class_init    = ppc440_pcix_class_init,
 };
+TYPE_INFO(ppc440_pcix_info)
 
-static void ppc440_pcix_register_types(void)
-{
-    type_register_static(&ppc440_pcix_info);
-}
 
-type_init(ppc440_pcix_register_types)
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 38fc392438..c1167aa6da 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -1305,13 +1305,9 @@ static const TypeInfo ppc460ex_pcie_host_info = {
     .instance_size = sizeof(PPC460EXPCIEState),
     .class_init = ppc460ex_pcie_class_init,
 };
+TYPE_INFO(ppc460ex_pcie_host_info)
 
-static void ppc460ex_pcie_register(void)
-{
-    type_register_static(&ppc460ex_pcie_host_info);
-}
 
-type_init(ppc460ex_pcie_register)
 
 static void ppc460ex_pcie_register_dcrs(PPC460EXPCIEState *s, CPUPPCState *env)
 {
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 3ea47df71f..b22df26c70 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -366,6 +366,7 @@ static const TypeInfo ppc4xx_host_bridge_info = {
         { },
     },
 };
+TYPE_INFO(ppc4xx_host_bridge_info)
 
 static void ppc4xx_pcihost_class_init(ObjectClass *klass, void *data)
 {
@@ -381,11 +382,6 @@ static const TypeInfo ppc4xx_pcihost_info = {
     .instance_size = sizeof(PPC4xxPCIState),
     .class_init    = ppc4xx_pcihost_class_init,
 };
+TYPE_INFO(ppc4xx_pcihost_info)
 
-static void ppc4xx_pci_register_types(void)
-{
-    type_register_static(&ppc4xx_pcihost_info);
-    type_register_static(&ppc4xx_host_bridge_info);
-}
 
-type_init(ppc4xx_pci_register_types)
diff --git a/hw/ppc/ppce500_spin.c b/hw/ppc/ppce500_spin.c
index 66c1065db2..a5d13ec583 100644
--- a/hw/ppc/ppce500_spin.c
+++ b/hw/ppc/ppce500_spin.c
@@ -199,10 +199,6 @@ static const TypeInfo ppce500_spin_info = {
     .instance_init = ppce500_spin_initfn,
     .class_init    = ppce500_spin_class_init,
 };
+TYPE_INFO(ppce500_spin_info)
 
-static void ppce500_spin_register_types(void)
-{
-    type_register_static(&ppce500_spin_info);
-}
 
-type_init(ppce500_spin_register_types)
diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
index bbc51b6e9a..c326518509 100644
--- a/hw/ppc/prep_systemio.c
+++ b/hw/ppc/prep_systemio.c
@@ -298,10 +298,6 @@ static TypeInfo prep_systemio800_info = {
     .instance_size = sizeof(PrepSystemIoState),
     .class_init    = prep_systemio_class_initfn,
 };
+TYPE_INFO(prep_systemio800_info)
 
-static void prep_systemio_register_types(void)
-{
-    type_register_static(&prep_systemio800_info);
-}
 
-type_init(prep_systemio_register_types)
diff --git a/hw/ppc/rs6000_mc.c b/hw/ppc/rs6000_mc.c
index ce97365f5e..a5c32c8ed5 100644
--- a/hw/ppc/rs6000_mc.c
+++ b/hw/ppc/rs6000_mc.c
@@ -230,10 +230,6 @@ static const TypeInfo rs6000mc_info = {
     .instance_size = sizeof(RS6000MCState),
     .class_init    = rs6000mc_class_initfn,
 };
+TYPE_INFO(rs6000mc_info)
 
-static void rs6000mc_types(void)
-{
-    type_register_static(&rs6000mc_info);
-}
 
-type_init(rs6000mc_types)
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index dd2fa4826b..f4a949058c 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4553,6 +4553,7 @@ static const TypeInfo spapr_machine_info = {
         { }
     },
 };
+TYPE_INFO(spapr_machine_info)
 
 static void spapr_machine_latest_class_options(MachineClass *mc)
 {
@@ -5001,9 +5002,4 @@ static void spapr_machine_2_1_class_options(MachineClass *mc)
 }
 DEFINE_SPAPR_MACHINE(2_1, "2.1", false);
 
-static void spapr_machine_register_types(void)
-{
-    type_register_static(&spapr_machine_info);
-}
 
-type_init(spapr_machine_register_types)
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index fe998d8108..2c058a1eb2 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -742,6 +742,7 @@ static const TypeInfo spapr_dr_connector_info = {
     .class_init    = spapr_dr_connector_class_init,
     .abstract      = true,
 };
+TYPE_INFO(spapr_dr_connector_info)
 
 static const TypeInfo spapr_drc_physical_info = {
     .name          = TYPE_SPAPR_DRC_PHYSICAL,
@@ -750,6 +751,7 @@ static const TypeInfo spapr_drc_physical_info = {
     .class_init    = spapr_drc_physical_class_init,
     .abstract      = true,
 };
+TYPE_INFO(spapr_drc_physical_info)
 
 static const TypeInfo spapr_drc_logical_info = {
     .name          = TYPE_SPAPR_DRC_LOGICAL,
@@ -757,24 +759,28 @@ static const TypeInfo spapr_drc_logical_info = {
     .class_init    = spapr_drc_logical_class_init,
     .abstract      = true,
 };
+TYPE_INFO(spapr_drc_logical_info)
 
 static const TypeInfo spapr_drc_cpu_info = {
     .name          = TYPE_SPAPR_DRC_CPU,
     .parent        = TYPE_SPAPR_DRC_LOGICAL,
     .class_init    = spapr_drc_cpu_class_init,
 };
+TYPE_INFO(spapr_drc_cpu_info)
 
 static const TypeInfo spapr_drc_pci_info = {
     .name          = TYPE_SPAPR_DRC_PCI,
     .parent        = TYPE_SPAPR_DRC_PHYSICAL,
     .class_init    = spapr_drc_pci_class_init,
 };
+TYPE_INFO(spapr_drc_pci_info)
 
 static const TypeInfo spapr_drc_lmb_info = {
     .name          = TYPE_SPAPR_DRC_LMB,
     .parent        = TYPE_SPAPR_DRC_LOGICAL,
     .class_init    = spapr_drc_lmb_class_init,
 };
+TYPE_INFO(spapr_drc_lmb_info)
 
 static const TypeInfo spapr_drc_phb_info = {
     .name          = TYPE_SPAPR_DRC_PHB,
@@ -782,12 +788,14 @@ static const TypeInfo spapr_drc_phb_info = {
     .instance_size = sizeof(SpaprDrc),
     .class_init    = spapr_drc_phb_class_init,
 };
+TYPE_INFO(spapr_drc_phb_info)
 
 static const TypeInfo spapr_drc_pmem_info = {
     .name          = TYPE_SPAPR_DRC_PMEM,
     .parent        = TYPE_SPAPR_DRC_LOGICAL,
     .class_init    = spapr_drc_pmem_class_init,
 };
+TYPE_INFO(spapr_drc_pmem_info)
 
 /* helper functions for external users */
 
@@ -1252,14 +1260,6 @@ out:
 
 static void spapr_drc_register_types(void)
 {
-    type_register_static(&spapr_dr_connector_info);
-    type_register_static(&spapr_drc_physical_info);
-    type_register_static(&spapr_drc_logical_info);
-    type_register_static(&spapr_drc_cpu_info);
-    type_register_static(&spapr_drc_pci_info);
-    type_register_static(&spapr_drc_lmb_info);
-    type_register_static(&spapr_drc_phb_info);
-    type_register_static(&spapr_drc_pmem_info);
 
     spapr_rtas_register(RTAS_SET_INDICATOR, "set-indicator",
                         rtas_set_indicator);
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 0fecabc135..eb21773d69 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -686,6 +686,7 @@ static TypeInfo spapr_tce_table_info = {
     .instance_size = sizeof(SpaprTceTable),
     .class_init = spapr_tce_table_class_init,
 };
+TYPE_INFO(spapr_tce_table_info)
 
 static void spapr_iommu_memory_region_class_init(ObjectClass *klass, void *data)
 {
@@ -703,11 +704,6 @@ static const TypeInfo spapr_iommu_memory_region_info = {
     .name = TYPE_SPAPR_IOMMU_MEMORY_REGION,
     .class_init = spapr_iommu_memory_region_class_init,
 };
+TYPE_INFO(spapr_iommu_memory_region_info)
 
-static void register_types(void)
-{
-    type_register_static(&spapr_tce_table_info);
-    type_register_static(&spapr_iommu_memory_region_info);
-}
 
-type_init(register_types);
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 72bb938375..e0af0535c2 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -28,6 +28,7 @@ static const TypeInfo spapr_intc_info = {
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(SpaprInterruptControllerClass),
 };
+TYPE_INFO(spapr_intc_info)
 
 static void spapr_irq_msi_init(SpaprMachineState *spapr)
 {
@@ -591,9 +592,4 @@ SpaprIrq spapr_irq_xics_legacy = {
     .xive        = false,
 };
 
-static void spapr_irq_register_types(void)
-{
-    type_register_static(&spapr_intc_info);
-}
 
-type_init(spapr_irq_register_types)
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 0a418f1e67..83a7ed1895 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2241,6 +2241,7 @@ static const TypeInfo spapr_phb_info = {
         { }
     }
 };
+TYPE_INFO(spapr_phb_info)
 
 static void spapr_phb_pci_enumerate_bridge(PCIBus *bus, PCIDevice *pdev,
                                            void *opaque)
@@ -2457,12 +2458,7 @@ void spapr_pci_rtas_init(void)
                         rtas_ibm_slot_error_detail);
 }
 
-static void spapr_pci_register_types(void)
-{
-    type_register_static(&spapr_phb_info);
-}
 
-type_init(spapr_pci_register_types)
 
 static int spapr_switch_one_vga(DeviceState *dev, void *opaque)
 {
diff --git a/hw/ppc/spapr_rng.c b/hw/ppc/spapr_rng.c
index 85bf64d68e..f25a10d26a 100644
--- a/hw/ppc/spapr_rng.c
+++ b/hw/ppc/spapr_rng.c
@@ -156,9 +156,5 @@ static const TypeInfo spapr_rng_info = {
     .instance_init = spapr_rng_instance_init,
     .class_init    = spapr_rng_class_init,
 };
+TYPE_INFO(spapr_rng_info)
 
-static void spapr_rng_register_type(void)
-{
-    type_register_static(&spapr_rng_info);
-}
-type_init(spapr_rng_register_type)
diff --git a/hw/ppc/spapr_rtc.c b/hw/ppc/spapr_rtc.c
index 68cfc578a3..4761bc4c76 100644
--- a/hw/ppc/spapr_rtc.c
+++ b/hw/ppc/spapr_rtc.c
@@ -183,9 +183,5 @@ static const TypeInfo spapr_rtc_info = {
     .instance_size = sizeof(SpaprRtcState),
     .class_init    = spapr_rtc_class_init,
 };
+TYPE_INFO(spapr_rtc_info)
 
-static void spapr_rtc_register_types(void)
-{
-    type_register_static(&spapr_rtc_info);
-}
-type_init(spapr_rtc_register_types)
diff --git a/hw/ppc/spapr_tpm_proxy.c b/hw/ppc/spapr_tpm_proxy.c
index a01f81f9e0..a6e4d61cfb 100644
--- a/hw/ppc/spapr_tpm_proxy.c
+++ b/hw/ppc/spapr_tpm_proxy.c
@@ -168,10 +168,10 @@ static const TypeInfo spapr_tpm_proxy_info = {
     .instance_size = sizeof(SpaprTpmProxy),
     .class_init    = spapr_tpm_proxy_class_init,
 };
+TYPE_INFO(spapr_tpm_proxy_info)
 
 static void spapr_tpm_proxy_register_types(void)
 {
-    type_register_static(&spapr_tpm_proxy_info);
     spapr_register_hypercall(SVM_H_TPM_COMM, h_tpm_comm);
 }
 
diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index 731080d989..387f7f196c 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -65,6 +65,7 @@ static const TypeInfo spapr_vio_bus_info = {
     .class_init = spapr_vio_bus_class_init,
     .instance_size = sizeof(SpaprVioBus),
 };
+TYPE_INFO(spapr_vio_bus_info)
 
 SpaprVioDevice *spapr_vio_find_by_reg(SpaprVioBus *bus, uint32_t reg)
 {
@@ -613,6 +614,7 @@ static const TypeInfo spapr_vio_bridge_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .class_init    = spapr_vio_bridge_class_init,
 };
+TYPE_INFO(spapr_vio_bridge_info)
 
 const VMStateDescription vmstate_spapr_vio = {
     .name = "spapr_vio",
@@ -649,15 +651,9 @@ static const TypeInfo spapr_vio_type_info = {
     .class_size = sizeof(SpaprVioDeviceClass),
     .class_init = vio_spapr_device_class_init,
 };
+TYPE_INFO(spapr_vio_type_info)
 
-static void spapr_vio_register_types(void)
-{
-    type_register_static(&spapr_vio_bus_info);
-    type_register_static(&spapr_vio_bridge_info);
-    type_register_static(&spapr_vio_type_info);
-}
 
-type_init(spapr_vio_register_types)
 
 static int compare_reg(const void *p1, const void *p2)
 {
diff --git a/hw/rdma/rdma.c b/hw/rdma/rdma.c
index 7bec0d0d2c..969d21fa4d 100644
--- a/hw/rdma/rdma.c
+++ b/hw/rdma/rdma.c
@@ -21,10 +21,6 @@ static const TypeInfo rdma_hmp_info = {
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(RdmaProviderClass),
 };
+TYPE_INFO(rdma_hmp_info)
 
-static void rdma_register_types(void)
-{
-    type_register_static(&rdma_hmp_info);
-}
 
-type_init(rdma_register_types)
diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 77b1235a3f..c2ec005af9 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -707,10 +707,6 @@ static const TypeInfo pvrdma_info = {
         { }
     }
 };
+TYPE_INFO(pvrdma_info)
 
-static void register_types(void)
-{
-    type_register_static(&pvrdma_info);
-}
 
-type_init(register_types)
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 23ba3b4bfc..818764aa03 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -196,10 +196,6 @@ static const TypeInfo lowrisc_ibex_soc_type_info = {
     .instance_init = lowrisc_ibex_soc_init,
     .class_init = lowrisc_ibex_soc_class_init,
 };
+TYPE_INFO(lowrisc_ibex_soc_type_info)
 
-static void lowrisc_ibex_soc_register_types(void)
-{
-    type_register_static(&lowrisc_ibex_soc_type_info);
-}
 
-type_init(lowrisc_ibex_soc_register_types)
diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index f59fe52f0f..d2ce03c4e6 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -77,10 +77,6 @@ static const TypeInfo riscv_harts_info = {
     .instance_size = sizeof(RISCVHartArrayState),
     .class_init    = riscv_harts_class_init,
 };
+TYPE_INFO(riscv_harts_info)
 
-static void riscv_harts_register_types(void)
-{
-    type_register_static(&riscv_harts_info);
-}
 
-type_init(riscv_harts_register_types)
diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
index 669c21adc2..456a722de5 100644
--- a/hw/riscv/sifive_clint.c
+++ b/hw/riscv/sifive_clint.c
@@ -215,13 +215,9 @@ static const TypeInfo sifive_clint_info = {
     .instance_size = sizeof(SiFiveCLINTState),
     .class_init    = sifive_clint_class_init,
 };
+TYPE_INFO(sifive_clint_info)
 
-static void sifive_clint_register_types(void)
-{
-    type_register_static(&sifive_clint_info);
-}
 
-type_init(sifive_clint_register_types)
 
 
 /*
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 88b4524117..5750936ed1 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -161,13 +161,9 @@ static const TypeInfo sifive_e_machine_typeinfo = {
     .instance_init = sifive_e_machine_instance_init,
     .instance_size = sizeof(SiFiveEState),
 };
+TYPE_INFO(sifive_e_machine_typeinfo)
 
-static void sifive_e_machine_init_register_types(void)
-{
-    type_register_static(&sifive_e_machine_typeinfo);
-}
 
-type_init(sifive_e_machine_init_register_types)
 
 static void sifive_e_soc_init(Object *obj)
 {
@@ -276,10 +272,6 @@ static const TypeInfo sifive_e_soc_type_info = {
     .instance_init = sifive_e_soc_init,
     .class_init = sifive_e_soc_class_init,
 };
+TYPE_INFO(sifive_e_soc_type_info)
 
-static void sifive_e_soc_register_types(void)
-{
-    type_register_static(&sifive_e_soc_type_info);
-}
 
-type_init(sifive_e_soc_register_types)
diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c
index 17dfa74715..c32f469876 100644
--- a/hw/riscv/sifive_e_prci.c
+++ b/hw/riscv/sifive_e_prci.c
@@ -104,13 +104,9 @@ static const TypeInfo sifive_e_prci_info = {
     .instance_size = sizeof(SiFiveEPRCIState),
     .instance_init = sifive_e_prci_init,
 };
+TYPE_INFO(sifive_e_prci_info)
 
-static void sifive_e_prci_register_types(void)
-{
-    type_register_static(&sifive_e_prci_info);
-}
 
-type_init(sifive_e_prci_register_types)
 
 
 /*
diff --git a/hw/riscv/sifive_gpio.c b/hw/riscv/sifive_gpio.c
index aac6b44cac..25a47c7531 100644
--- a/hw/riscv/sifive_gpio.c
+++ b/hw/riscv/sifive_gpio.c
@@ -388,10 +388,6 @@ static const TypeInfo sifive_gpio_info = {
     .instance_size = sizeof(SIFIVEGPIOState),
     .class_init = sifive_gpio_class_init
 };
+TYPE_INFO(sifive_gpio_info)
 
-static void sifive_gpio_register_types(void)
-{
-    type_register_static(&sifive_gpio_info);
-}
 
-type_init(sifive_gpio_register_types)
diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index c20c192034..7235e13ebd 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -485,13 +485,9 @@ static const TypeInfo sifive_plic_info = {
     .instance_size = sizeof(SiFivePLICState),
     .class_init    = sifive_plic_class_init,
 };
+TYPE_INFO(sifive_plic_info)
 
-static void sifive_plic_register_types(void)
-{
-    type_register_static(&sifive_plic_info);
-}
 
-type_init(sifive_plic_register_types)
 
 /*
  * Create PLIC device.
diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
index 0c78fb2c93..d3c646cb69 100644
--- a/hw/riscv/sifive_test.c
+++ b/hw/riscv/sifive_test.c
@@ -79,13 +79,9 @@ static const TypeInfo sifive_test_info = {
     .instance_size = sizeof(SiFiveTestState),
     .instance_init = sifive_test_init,
 };
+TYPE_INFO(sifive_test_info)
 
-static void sifive_test_register_types(void)
-{
-    type_register_static(&sifive_test_info);
-}
 
-type_init(sifive_test_register_types)
 
 
 /*
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b0555a2f7a..3fd713be61 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -590,13 +590,9 @@ static const TypeInfo sifive_u_machine_typeinfo = {
     .instance_init = sifive_u_machine_instance_init,
     .instance_size = sizeof(SiFiveUState),
 };
+TYPE_INFO(sifive_u_machine_typeinfo)
 
-static void sifive_u_machine_init_register_types(void)
-{
-    type_register_static(&sifive_u_machine_typeinfo);
-}
 
-type_init(sifive_u_machine_init_register_types)
 
 static void sifive_u_soc_instance_init(Object *obj)
 {
@@ -779,10 +775,6 @@ static const TypeInfo sifive_u_soc_type_info = {
     .instance_init = sifive_u_soc_instance_init,
     .class_init = sifive_u_soc_class_init,
 };
+TYPE_INFO(sifive_u_soc_type_info)
 
-static void sifive_u_soc_register_types(void)
-{
-    type_register_static(&sifive_u_soc_type_info);
-}
 
-type_init(sifive_u_soc_register_types)
diff --git a/hw/riscv/sifive_u_otp.c b/hw/riscv/sifive_u_otp.c
index f6ecbaa2ca..145f98c25d 100644
--- a/hw/riscv/sifive_u_otp.c
+++ b/hw/riscv/sifive_u_otp.c
@@ -182,10 +182,6 @@ static const TypeInfo sifive_u_otp_info = {
     .instance_size = sizeof(SiFiveUOTPState),
     .class_init    = sifive_u_otp_class_init,
 };
+TYPE_INFO(sifive_u_otp_info)
 
-static void sifive_u_otp_register_types(void)
-{
-    type_register_static(&sifive_u_otp_info);
-}
 
-type_init(sifive_u_otp_register_types)
diff --git a/hw/riscv/sifive_u_prci.c b/hw/riscv/sifive_u_prci.c
index 4fa590c064..ebddf9c568 100644
--- a/hw/riscv/sifive_u_prci.c
+++ b/hw/riscv/sifive_u_prci.c
@@ -160,10 +160,6 @@ static const TypeInfo sifive_u_prci_info = {
     .instance_size = sizeof(SiFiveUPRCIState),
     .class_init    = sifive_u_prci_class_init,
 };
+TYPE_INFO(sifive_u_prci_info)
 
-static void sifive_u_prci_register_types(void)
-{
-    type_register_static(&sifive_u_prci_info);
-}
 
-type_init(sifive_u_prci_register_types)
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6e91cf129e..54f4cbf7a4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -630,10 +630,6 @@ static const TypeInfo virt_machine_typeinfo = {
     .instance_init = virt_machine_instance_init,
     .instance_size = sizeof(RISCVVirtState),
 };
+TYPE_INFO(virt_machine_typeinfo)
 
-static void virt_machine_init_register_types(void)
-{
-    type_register_static(&virt_machine_typeinfo);
-}
 
-type_init(virt_machine_init_register_types)
diff --git a/hw/rtc/allwinner-rtc.c b/hw/rtc/allwinner-rtc.c
index 5606a51d5c..0b07c24043 100644
--- a/hw/rtc/allwinner-rtc.c
+++ b/hw/rtc/allwinner-rtc.c
@@ -378,6 +378,7 @@ static const TypeInfo allwinner_rtc_info = {
     .class_size    = sizeof(AwRtcClass),
     .abstract      = true,
 };
+TYPE_INFO(allwinner_rtc_info)
 
 static const TypeInfo allwinner_rtc_sun4i_info = {
     .name          = TYPE_AW_RTC_SUN4I,
@@ -385,6 +386,7 @@ static const TypeInfo allwinner_rtc_sun4i_info = {
     .class_init    = allwinner_rtc_sun4i_class_init,
     .instance_init = allwinner_rtc_sun4i_init,
 };
+TYPE_INFO(allwinner_rtc_sun4i_info)
 
 static const TypeInfo allwinner_rtc_sun6i_info = {
     .name          = TYPE_AW_RTC_SUN6I,
@@ -392,6 +394,7 @@ static const TypeInfo allwinner_rtc_sun6i_info = {
     .class_init    = allwinner_rtc_sun6i_class_init,
     .instance_init = allwinner_rtc_sun6i_init,
 };
+TYPE_INFO(allwinner_rtc_sun6i_info)
 
 static const TypeInfo allwinner_rtc_sun7i_info = {
     .name          = TYPE_AW_RTC_SUN7I,
@@ -399,13 +402,6 @@ static const TypeInfo allwinner_rtc_sun7i_info = {
     .class_init    = allwinner_rtc_sun7i_class_init,
     .instance_init = allwinner_rtc_sun7i_init,
 };
+TYPE_INFO(allwinner_rtc_sun7i_info)
 
-static void allwinner_rtc_register(void)
-{
-    type_register_static(&allwinner_rtc_info);
-    type_register_static(&allwinner_rtc_sun4i_info);
-    type_register_static(&allwinner_rtc_sun6i_info);
-    type_register_static(&allwinner_rtc_sun7i_info);
-}
 
-type_init(allwinner_rtc_register)
diff --git a/hw/rtc/aspeed_rtc.c b/hw/rtc/aspeed_rtc.c
index 3ca1183558..e9d217d66b 100644
--- a/hw/rtc/aspeed_rtc.c
+++ b/hw/rtc/aspeed_rtc.c
@@ -172,10 +172,6 @@ static const TypeInfo aspeed_rtc_info = {
     .instance_size = sizeof(AspeedRtcState),
     .class_init    = aspeed_rtc_class_init,
 };
+TYPE_INFO(aspeed_rtc_info)
 
-static void aspeed_rtc_register_types(void)
-{
-    type_register_static(&aspeed_rtc_info);
-}
 
-type_init(aspeed_rtc_register_types)
diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 588a9ba9be..985d07f8f1 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -232,10 +232,6 @@ static const TypeInfo ds1338_info = {
     .instance_size = sizeof(DS1338State),
     .class_init    = ds1338_class_init,
 };
+TYPE_INFO(ds1338_info)
 
-static void ds1338_register_types(void)
-{
-    type_register_static(&ds1338_info);
-}
 
-type_init(ds1338_register_types)
diff --git a/hw/rtc/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
index f85483a07f..375f682f5d 100644
--- a/hw/rtc/exynos4210_rtc.c
+++ b/hw/rtc/exynos4210_rtc.c
@@ -599,10 +599,6 @@ static const TypeInfo exynos4210_rtc_info = {
     .instance_init = exynos4210_rtc_init,
     .class_init    = exynos4210_rtc_class_init,
 };
+TYPE_INFO(exynos4210_rtc_info)
 
-static void exynos4210_rtc_register_types(void)
-{
-    type_register_static(&exynos4210_rtc_info);
-}
 
-type_init(exynos4210_rtc_register_types)
diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
index 6ddd45cce0..1473761de1 100644
--- a/hw/rtc/goldfish_rtc.c
+++ b/hw/rtc/goldfish_rtc.c
@@ -287,10 +287,6 @@ static const TypeInfo goldfish_rtc_info = {
     .instance_size = sizeof(GoldfishRTCState),
     .class_init    = goldfish_rtc_class_init,
 };
+TYPE_INFO(goldfish_rtc_info)
 
-static void goldfish_rtc_register_types(void)
-{
-    type_register_static(&goldfish_rtc_info);
-}
 
-type_init(goldfish_rtc_register_types)
diff --git a/hw/rtc/m41t80.c b/hw/rtc/m41t80.c
index 914ecac8f4..8b44b70eba 100644
--- a/hw/rtc/m41t80.c
+++ b/hw/rtc/m41t80.c
@@ -110,10 +110,6 @@ static const TypeInfo m41t80_info = {
     .instance_size = sizeof(M41t80State),
     .class_init    = m41t80_class_init,
 };
+TYPE_INFO(m41t80_info)
 
-static void m41t80_register_types(void)
-{
-    type_register_static(&m41t80_info);
-}
 
-type_init(m41t80_register_types)
diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
index 50430b7a85..6e72e132e4 100644
--- a/hw/rtc/m48t59-isa.c
+++ b/hw/rtc/m48t59-isa.c
@@ -165,6 +165,7 @@ static const TypeInfo m48txx_isa_type_info = {
         { }
     }
 };
+TYPE_INFO(m48txx_isa_type_info)
 
 static void m48t59_isa_register_types(void)
 {
@@ -175,7 +176,6 @@ static void m48t59_isa_register_types(void)
     };
     int i;
 
-    type_register_static(&m48txx_isa_type_info);
 
     for (i = 0; i < ARRAY_SIZE(m48txx_isa_info); i++) {
         isa_type_info.name = m48txx_isa_info[i].bus_name;
diff --git a/hw/rtc/m48t59.c b/hw/rtc/m48t59.c
index b428a06045..1057e225d0 100644
--- a/hw/rtc/m48t59.c
+++ b/hw/rtc/m48t59.c
@@ -687,6 +687,7 @@ static const TypeInfo nvram_info = {
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(NvramClass),
 };
+TYPE_INFO(nvram_info)
 
 static const TypeInfo m48txx_sysbus_type_info = {
     .name = TYPE_M48TXX_SYS_BUS,
@@ -700,6 +701,7 @@ static const TypeInfo m48txx_sysbus_type_info = {
         { }
     }
 };
+TYPE_INFO(m48txx_sysbus_type_info)
 
 static void m48t59_register_types(void)
 {
@@ -710,8 +712,6 @@ static void m48t59_register_types(void)
     };
     int i;
 
-    type_register_static(&nvram_info);
-    type_register_static(&m48txx_sysbus_type_info);
 
     for (i = 0; i < ARRAY_SIZE(m48txx_sysbus_info); i++) {
         sysbus_type_info.name = m48txx_sysbus_info[i].bus_name;
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 7a38540cb9..336ebe03ff 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -1047,10 +1047,6 @@ static const TypeInfo mc146818rtc_info = {
     .instance_size = sizeof(RTCState),
     .class_init    = rtc_class_initfn,
 };
+TYPE_INFO(mc146818rtc_info)
 
-static void mc146818rtc_register_types(void)
-{
-    type_register_static(&mc146818rtc_info);
-}
 
-type_init(mc146818rtc_register_types)
diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index ae47f09635..9c702916ee 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -331,10 +331,6 @@ static const TypeInfo pl031_info = {
     .instance_init = pl031_init,
     .class_init    = pl031_class_init,
 };
+TYPE_INFO(pl031_info)
 
-static void pl031_register_types(void)
-{
-    type_register_static(&pl031_info);
-}
 
-type_init(pl031_register_types)
diff --git a/hw/rtc/sun4v-rtc.c b/hw/rtc/sun4v-rtc.c
index 52caea8654..8e242e8416 100644
--- a/hw/rtc/sun4v-rtc.c
+++ b/hw/rtc/sun4v-rtc.c
@@ -87,10 +87,6 @@ static const TypeInfo sun4v_rtc_info = {
     .instance_size = sizeof(Sun4vRtc),
     .class_init    = sun4v_rtc_class_init,
 };
+TYPE_INFO(sun4v_rtc_info)
 
-static void sun4v_rtc_register_types(void)
-{
-    type_register_static(&sun4v_rtc_info);
-}
 
-type_init(sun4v_rtc_register_types)
diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
index d0011be89e..782d77d6fc 100644
--- a/hw/rtc/twl92230.c
+++ b/hw/rtc/twl92230.c
@@ -888,10 +888,6 @@ static const TypeInfo twl92230_info = {
     .instance_size = sizeof(MenelausState),
     .class_init    = twl92230_class_init,
 };
+TYPE_INFO(twl92230_info)
 
-static void twl92230_register_types(void)
-{
-    type_register_static(&twl92230_info);
-}
 
-type_init(twl92230_register_types)
diff --git a/hw/rtc/xlnx-zynqmp-rtc.c b/hw/rtc/xlnx-zynqmp-rtc.c
index 2bcd14d779..5d130d4d6c 100644
--- a/hw/rtc/xlnx-zynqmp-rtc.c
+++ b/hw/rtc/xlnx-zynqmp-rtc.c
@@ -266,10 +266,6 @@ static const TypeInfo rtc_info = {
     .class_init    = rtc_class_init,
     .instance_init = rtc_init,
 };
+TYPE_INFO(rtc_info)
 
-static void rtc_register_types(void)
-{
-    type_register_static(&rtc_info);
-}
 
-type_init(rtc_register_types)
diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
index 821319eee6..9acbf36920 100644
--- a/hw/s390x/3270-ccw.c
+++ b/hw/s390x/3270-ccw.c
@@ -170,10 +170,6 @@ static const TypeInfo emulated_ccw_3270_info = {
     .class_size = sizeof(EmulatedCcw3270Class),
     .abstract = true,
 };
+TYPE_INFO(emulated_ccw_3270_info)
 
-static void emulated_ccw_register(void)
-{
-    type_register_static(&emulated_ccw_3270_info);
-}
 
-type_init(emulated_ccw_register)
diff --git a/hw/s390x/ap-bridge.c b/hw/s390x/ap-bridge.c
index 8bcf8ece9d..e6e1ff3310 100644
--- a/hw/s390x/ap-bridge.c
+++ b/hw/s390x/ap-bridge.c
@@ -37,6 +37,7 @@ static const TypeInfo ap_bus_info = {
     .instance_size = 0,
     .class_init = ap_bus_class_init,
 };
+TYPE_INFO(ap_bus_info)
 
 void s390_init_ap(void)
 {
@@ -80,11 +81,6 @@ static const TypeInfo ap_bridge_info = {
         { }
     }
 };
+TYPE_INFO(ap_bridge_info)
 
-static void ap_register(void)
-{
-    type_register_static(&ap_bridge_info);
-    type_register_static(&ap_bus_info);
-}
 
-type_init(ap_register)
diff --git a/hw/s390x/ap-device.c b/hw/s390x/ap-device.c
index fc0b41e937..0e82d9918c 100644
--- a/hw/s390x/ap-device.c
+++ b/hw/s390x/ap-device.c
@@ -28,10 +28,6 @@ static const TypeInfo ap_device_info = {
     .class_init = ap_class_init,
     .abstract = true,
 };
+TYPE_INFO(ap_device_info)
 
-static void ap_device_register(void)
-{
-    type_register_static(&ap_device_info);
-}
 
-type_init(ap_device_register)
diff --git a/hw/s390x/ccw-device.c b/hw/s390x/ccw-device.c
index c9707110e9..7484c2a5ca 100644
--- a/hw/s390x/ccw-device.c
+++ b/hw/s390x/ccw-device.c
@@ -79,10 +79,6 @@ static const TypeInfo ccw_device_info = {
     .class_init = ccw_device_class_init,
     .abstract = true,
 };
+TYPE_INFO(ccw_device_info)
 
-static void ccw_device_register(void)
-{
-    type_register_static(&ccw_device_info);
-}
 
-type_init(ccw_device_register)
diff --git a/hw/s390x/css-bridge.c b/hw/s390x/css-bridge.c
index 9d793d671e..2ebb07a181 100644
--- a/hw/s390x/css-bridge.c
+++ b/hw/s390x/css-bridge.c
@@ -93,6 +93,7 @@ static const TypeInfo virtual_css_bus_info = {
     .instance_size = sizeof(VirtualCssBus),
     .class_init = virtual_css_bus_class_init,
 };
+TYPE_INFO(virtual_css_bus_info)
 
 VirtualCssBus *virtual_css_bus_init(void)
 {
@@ -157,11 +158,6 @@ static const TypeInfo virtual_css_bridge_info = {
         { }
     }
 };
+TYPE_INFO(virtual_css_bridge_info)
 
-static void virtual_css_register(void)
-{
-    type_register_static(&virtual_css_bridge_info);
-    type_register_static(&virtual_css_bus_info);
-}
 
-type_init(virtual_css_register)
diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
index 645b4080c5..60b28fa720 100644
--- a/hw/s390x/event-facility.c
+++ b/hw/s390x/event-facility.c
@@ -333,6 +333,7 @@ static const TypeInfo sclp_events_bus_info = {
     .name = TYPE_SCLP_EVENTS_BUS,
     .parent = TYPE_BUS,
 };
+TYPE_INFO(sclp_events_bus_info)
 
 static void command_handler(SCLPEventFacility *ef, SCCB *sccb, uint64_t code)
 {
@@ -483,6 +484,7 @@ static const TypeInfo sclp_event_facility_info = {
     .class_init    = init_event_facility_class,
     .class_size    = sizeof(SCLPEventFacilityClass),
 };
+TYPE_INFO(sclp_event_facility_info)
 
 static void event_realize(DeviceState *qdev, Error **errp)
 {
@@ -514,15 +516,9 @@ static const TypeInfo sclp_event_type_info = {
     .class_size = sizeof(SCLPEventClass),
     .abstract = true,
 };
+TYPE_INFO(sclp_event_type_info)
 
-static void register_types(void)
-{
-    type_register_static(&sclp_events_bus_info);
-    type_register_static(&sclp_event_facility_info);
-    type_register_static(&sclp_event_type_info);
-}
 
-type_init(register_types)
 
 BusState *sclp_get_event_facility_bus(void)
 {
diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 3d2652d75a..89e89acd79 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -765,10 +765,6 @@ static const TypeInfo s390_ipl_info = {
     .name  = TYPE_S390_IPL,
     .instance_size  = sizeof(S390IPLState),
 };
+TYPE_INFO(s390_ipl_info)
 
-static void s390_ipl_register_types(void)
-{
-    type_register_static(&s390_ipl_info);
-}
 
-type_init(s390_ipl_register_types)
diff --git a/hw/s390x/s390-ccw.c b/hw/s390x/s390-ccw.c
index b497571863..24edbfcd2f 100644
--- a/hw/s390x/s390-ccw.c
+++ b/hw/s390x/s390-ccw.c
@@ -194,10 +194,6 @@ static const TypeInfo s390_ccw_info = {
     .class_init    = s390_ccw_class_init,
     .abstract      = true,
 };
+TYPE_INFO(s390_ccw_info)
 
-static void register_s390_ccw_type(void)
-{
-    type_register_static(&s390_ccw_info);
-}
 
-type_init(register_s390_ccw_type)
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 92146a2119..d4ca1c3c20 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1140,12 +1140,14 @@ static const TypeInfo s390_pcihost_info = {
         { }
     }
 };
+TYPE_INFO(s390_pcihost_info)
 
 static const TypeInfo s390_pcibus_info = {
     .name = TYPE_S390_PCI_BUS,
     .parent = TYPE_BUS,
     .instance_size = sizeof(S390PCIBus),
 };
+TYPE_INFO(s390_pcibus_info)
 
 static uint16_t s390_pci_generate_uid(S390pciState *s)
 {
@@ -1316,12 +1318,14 @@ static const TypeInfo s390_pci_device_info = {
     .instance_size = sizeof(S390PCIBusDevice),
     .class_init = s390_pci_device_class_init,
 };
+TYPE_INFO(s390_pci_device_info)
 
 static TypeInfo s390_pci_iommu_info = {
     .name = TYPE_S390_PCI_IOMMU,
     .parent = TYPE_OBJECT,
     .instance_size = sizeof(S390PCIIOMMU),
 };
+TYPE_INFO(s390_pci_iommu_info)
 
 static void s390_iommu_memory_region_class_init(ObjectClass *klass, void *data)
 {
@@ -1336,14 +1340,6 @@ static const TypeInfo s390_iommu_memory_region_info = {
     .name = TYPE_S390_IOMMU_MEMORY_REGION,
     .class_init = s390_iommu_memory_region_class_init,
 };
+TYPE_INFO(s390_iommu_memory_region_info)
 
-static void s390_pci_register_types(void)
-{
-    type_register_static(&s390_pcihost_info);
-    type_register_static(&s390_pcibus_info);
-    type_register_static(&s390_pci_device_info);
-    type_register_static(&s390_pci_iommu_info);
-    type_register_static(&s390_iommu_memory_region_info);
-}
 
-type_init(s390_pci_register_types)
diff --git a/hw/s390x/s390-skeys-kvm.c b/hw/s390x/s390-skeys-kvm.c
index 1c4d805ad8..eed05d265e 100644
--- a/hw/s390x/s390-skeys-kvm.c
+++ b/hw/s390x/s390-skeys-kvm.c
@@ -72,10 +72,6 @@ static const TypeInfo kvm_s390_skeys_info = {
     .class_init    = kvm_s390_skeys_class_init,
     .class_size    = sizeof(S390SKeysClass),
 };
+TYPE_INFO(kvm_s390_skeys_info)
 
-static void kvm_s390_skeys_register_types(void)
-{
-    type_register_static(&kvm_s390_skeys_info);
-}
 
-type_init(kvm_s390_skeys_register_types)
diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index db2f49cb27..0ac3b29520 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -251,6 +251,7 @@ static const TypeInfo qemu_s390_skeys_info = {
     .class_init    = qemu_s390_skeys_class_init,
     .class_size    = sizeof(S390SKeysClass),
 };
+TYPE_INFO(qemu_s390_skeys_info)
 
 static void s390_storage_keys_save(QEMUFile *f, void *opaque)
 {
@@ -421,11 +422,6 @@ static const TypeInfo s390_skeys_info = {
     .class_size    = sizeof(S390SKeysClass),
     .abstract = true,
 };
+TYPE_INFO(s390_skeys_info)
 
-static void qemu_s390_skeys_register_types(void)
-{
-    type_register_static(&s390_skeys_info);
-    type_register_static(&qemu_s390_skeys_info);
-}
 
-type_init(qemu_s390_skeys_register_types)
diff --git a/hw/s390x/s390-stattrib-kvm.c b/hw/s390x/s390-stattrib-kvm.c
index f89d8d9d16..d9eadfd8f7 100644
--- a/hw/s390x/s390-stattrib-kvm.c
+++ b/hw/s390x/s390-stattrib-kvm.c
@@ -187,10 +187,6 @@ static const TypeInfo kvm_s390_stattrib_info = {
     .class_init    = kvm_s390_stattrib_class_init,
     .class_size    = sizeof(S390StAttribClass),
 };
+TYPE_INFO(kvm_s390_stattrib_info)
 
-static void kvm_s390_stattrib_register_types(void)
-{
-    type_register_static(&kvm_s390_stattrib_info);
-}
 
-type_init(kvm_s390_stattrib_register_types)
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index 4441e1d331..394072e898 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -330,6 +330,7 @@ static const TypeInfo qemu_s390_stattrib_info = {
     .class_init    = qemu_s390_stattrib_class_init,
     .class_size    = sizeof(S390StAttribClass),
 };
+TYPE_INFO(qemu_s390_stattrib_info)
 
 /* Generic abstract object: */
 
@@ -401,11 +402,6 @@ static const TypeInfo s390_stattrib_info = {
     .class_size    = sizeof(S390StAttribClass),
     .abstract      = true,
 };
+TYPE_INFO(s390_stattrib_info)
 
-static void s390_stattrib_register_types(void)
-{
-    type_register_static(&s390_stattrib_info);
-    type_register_static(&qemu_s390_stattrib_info);
-}
 
-type_init(s390_stattrib_register_types)
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 3106bbea33..a8b28fb73d 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -765,6 +765,7 @@ static const TypeInfo ccw_machine_info = {
         { }
     },
 };
+TYPE_INFO(ccw_machine_info)
 
 bool css_migration_enabled(void)
 {
@@ -1066,9 +1067,4 @@ static void ccw_machine_2_4_class_options(MachineClass *mc)
 }
 DEFINE_CCW_MACHINE(2_4, "2.4", false);
 
-static void ccw_machine_register_types(void)
-{
-    type_register_static(&ccw_machine_info);
-}
 
-type_init(ccw_machine_register_types)
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index a0ce444b4b..35bc750d31 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -411,9 +411,5 @@ static TypeInfo sclp_info = {
     .class_init = sclp_class_init,
     .class_size = sizeof(SCLPDeviceClass),
 };
+TYPE_INFO(sclp_info)
 
-static void register_types(void)
-{
-    type_register_static(&sclp_info);
-}
-type_init(register_types);
diff --git a/hw/s390x/sclpcpu.c b/hw/s390x/sclpcpu.c
index 62806d3273..dd38d7ea4f 100644
--- a/hw/s390x/sclpcpu.c
+++ b/hw/s390x/sclpcpu.c
@@ -98,10 +98,6 @@ static const TypeInfo sclp_cpu_info = {
     .class_init    = cpu_class_init,
     .class_size    = sizeof(SCLPEventClass),
 };
+TYPE_INFO(sclp_cpu_info)
 
-static void sclp_cpu_register_types(void)
-{
-    type_register_static(&sclp_cpu_info);
-}
 
-type_init(sclp_cpu_register_types)
diff --git a/hw/s390x/sclpquiesce.c b/hw/s390x/sclpquiesce.c
index ce07b16884..5ec767f5bc 100644
--- a/hw/s390x/sclpquiesce.c
+++ b/hw/s390x/sclpquiesce.c
@@ -141,10 +141,6 @@ static const TypeInfo sclp_quiesce_info = {
     .class_init    = quiesce_class_init,
     .class_size    = sizeof(SCLPEventClass),
 };
+TYPE_INFO(sclp_quiesce_info)
 
-static void register_types(void)
-{
-    type_register_static(&sclp_quiesce_info);
-}
 
-type_init(register_types)
diff --git a/hw/s390x/tod-kvm.c b/hw/s390x/tod-kvm.c
index 6e21d83181..ce17950f2f 100644
--- a/hw/s390x/tod-kvm.c
+++ b/hw/s390x/tod-kvm.c
@@ -155,9 +155,5 @@ static TypeInfo kvm_s390_tod_info = {
     .class_init = kvm_s390_tod_class_init,
     .class_size = sizeof(S390TODClass),
 };
+TYPE_INFO(kvm_s390_tod_info)
 
-static void register_types(void)
-{
-    type_register_static(&kvm_s390_tod_info);
-}
-type_init(register_types);
diff --git a/hw/s390x/tod-qemu.c b/hw/s390x/tod-qemu.c
index e91b9590f5..bdc900be3c 100644
--- a/hw/s390x/tod-qemu.c
+++ b/hw/s390x/tod-qemu.c
@@ -81,9 +81,5 @@ static TypeInfo qemu_s390_tod_info = {
     .class_init = qemu_s390_tod_class_init,
     .class_size = sizeof(S390TODClass),
 };
+TYPE_INFO(qemu_s390_tod_info)
 
-static void register_types(void)
-{
-    type_register_static(&qemu_s390_tod_info);
-}
-type_init(register_types);
diff --git a/hw/s390x/tod.c b/hw/s390x/tod.c
index 3c2979175e..7b3b0b3205 100644
--- a/hw/s390x/tod.c
+++ b/hw/s390x/tod.c
@@ -124,9 +124,5 @@ static TypeInfo s390_tod_info = {
     .class_size = sizeof(S390TODClass),
     .abstract = true,
 };
+TYPE_INFO(s390_tod_info)
 
-static void register_types(void)
-{
-    type_register_static(&s390_tod_info);
-}
-type_init(register_types);
diff --git a/hw/s390x/vhost-vsock-ccw.c b/hw/s390x/vhost-vsock-ccw.c
index 0822ecca89..f30409bc19 100644
--- a/hw/s390x/vhost-vsock-ccw.c
+++ b/hw/s390x/vhost-vsock-ccw.c
@@ -52,10 +52,6 @@ static const TypeInfo vhost_vsock_ccw_info = {
     .instance_init = vhost_vsock_ccw_instance_init,
     .class_init    = vhost_vsock_ccw_class_init,
 };
+TYPE_INFO(vhost_vsock_ccw_info)
 
-static void vhost_vsock_ccw_register(void)
-{
-    type_register_static(&vhost_vsock_ccw_info);
-}
 
-type_init(vhost_vsock_ccw_register)
diff --git a/hw/s390x/virtio-ccw-9p.c b/hw/s390x/virtio-ccw-9p.c
index 88c8884fc5..dd8c451cc5 100644
--- a/hw/s390x/virtio-ccw-9p.c
+++ b/hw/s390x/virtio-ccw-9p.c
@@ -57,10 +57,6 @@ static const TypeInfo virtio_ccw_9p_info = {
     .instance_init = virtio_ccw_9p_instance_init,
     .class_init    = virtio_ccw_9p_class_init,
 };
+TYPE_INFO(virtio_ccw_9p_info)
 
-static void virtio_ccw_9p_register(void)
-{
-    type_register_static(&virtio_ccw_9p_info);
-}
 
-type_init(virtio_ccw_9p_register)
diff --git a/hw/s390x/virtio-ccw-balloon.c b/hw/s390x/virtio-ccw-balloon.c
index 4c7631a433..5e3acd91b2 100644
--- a/hw/s390x/virtio-ccw-balloon.c
+++ b/hw/s390x/virtio-ccw-balloon.c
@@ -62,10 +62,6 @@ static const TypeInfo virtio_ccw_balloon = {
     .instance_init = virtio_ccw_balloon_instance_init,
     .class_init    = virtio_ccw_balloon_class_init,
 };
+TYPE_INFO(virtio_ccw_balloon)
 
-static void virtio_ccw_balloon_register(void)
-{
-    type_register_static(&virtio_ccw_balloon);
-}
 
-type_init(virtio_ccw_balloon_register)
diff --git a/hw/s390x/virtio-ccw-blk.c b/hw/s390x/virtio-ccw-blk.c
index 2294ce1ce4..25cc528f34 100644
--- a/hw/s390x/virtio-ccw-blk.c
+++ b/hw/s390x/virtio-ccw-blk.c
@@ -59,10 +59,6 @@ static const TypeInfo virtio_ccw_blk = {
     .instance_init = virtio_ccw_blk_instance_init,
     .class_init    = virtio_ccw_blk_class_init,
 };
+TYPE_INFO(virtio_ccw_blk)
 
-static void virtio_ccw_blk_register(void)
-{
-    type_register_static(&virtio_ccw_blk);
-}
 
-type_init(virtio_ccw_blk_register)
diff --git a/hw/s390x/virtio-ccw-crypto.c b/hw/s390x/virtio-ccw-crypto.c
index 358c74fb4b..65e6ac1cf5 100644
--- a/hw/s390x/virtio-ccw-crypto.c
+++ b/hw/s390x/virtio-ccw-crypto.c
@@ -60,10 +60,6 @@ static const TypeInfo virtio_ccw_crypto = {
     .instance_init = virtio_ccw_crypto_instance_init,
     .class_init    = virtio_ccw_crypto_class_init,
 };
+TYPE_INFO(virtio_ccw_crypto)
 
-static void virtio_ccw_crypto_register(void)
-{
-    type_register_static(&virtio_ccw_crypto);
-}
 
-type_init(virtio_ccw_crypto_register)
diff --git a/hw/s390x/virtio-ccw-gpu.c b/hw/s390x/virtio-ccw-gpu.c
index c301e2586b..de63cb04e9 100644
--- a/hw/s390x/virtio-ccw-gpu.c
+++ b/hw/s390x/virtio-ccw-gpu.c
@@ -59,10 +59,6 @@ static const TypeInfo virtio_ccw_gpu = {
     .instance_init = virtio_ccw_gpu_instance_init,
     .class_init    = virtio_ccw_gpu_class_init,
 };
+TYPE_INFO(virtio_ccw_gpu)
 
-static void virtio_ccw_gpu_register(void)
-{
-    type_register_static(&virtio_ccw_gpu);
-}
 
-type_init(virtio_ccw_gpu_register)
diff --git a/hw/s390x/virtio-ccw-input.c b/hw/s390x/virtio-ccw-input.c
index 5601e25dee..42528ebd8a 100644
--- a/hw/s390x/virtio-ccw-input.c
+++ b/hw/s390x/virtio-ccw-input.c
@@ -78,6 +78,7 @@ static const TypeInfo virtio_ccw_input = {
     .class_init    = virtio_ccw_input_class_init,
     .abstract = true,
 };
+TYPE_INFO(virtio_ccw_input)
 
 static const TypeInfo virtio_ccw_input_hid = {
     .name          = TYPE_VIRTIO_INPUT_HID_CCW,
@@ -85,6 +86,7 @@ static const TypeInfo virtio_ccw_input_hid = {
     .instance_size = sizeof(VirtIOInputHIDCcw),
     .abstract = true,
 };
+TYPE_INFO(virtio_ccw_input_hid)
 
 static const TypeInfo virtio_ccw_keyboard = {
     .name          = TYPE_VIRTIO_KEYBOARD_CCW,
@@ -92,6 +94,7 @@ static const TypeInfo virtio_ccw_keyboard = {
     .instance_size = sizeof(VirtIOInputHIDCcw),
     .instance_init = virtio_ccw_keyboard_instance_init,
 };
+TYPE_INFO(virtio_ccw_keyboard)
 
 static const TypeInfo virtio_ccw_mouse = {
     .name          = TYPE_VIRTIO_MOUSE_CCW,
@@ -99,6 +102,7 @@ static const TypeInfo virtio_ccw_mouse = {
     .instance_size = sizeof(VirtIOInputHIDCcw),
     .instance_init = virtio_ccw_mouse_instance_init,
 };
+TYPE_INFO(virtio_ccw_mouse)
 
 static const TypeInfo virtio_ccw_tablet = {
     .name          = TYPE_VIRTIO_TABLET_CCW,
@@ -106,14 +110,6 @@ static const TypeInfo virtio_ccw_tablet = {
     .instance_size = sizeof(VirtIOInputHIDCcw),
     .instance_init = virtio_ccw_tablet_instance_init,
 };
+TYPE_INFO(virtio_ccw_tablet)
 
-static void virtio_ccw_input_register(void)
-{
-    type_register_static(&virtio_ccw_input);
-    type_register_static(&virtio_ccw_input_hid);
-    type_register_static(&virtio_ccw_keyboard);
-    type_register_static(&virtio_ccw_mouse);
-    type_register_static(&virtio_ccw_tablet);
-}
 
-type_init(virtio_ccw_input_register)
diff --git a/hw/s390x/virtio-ccw-net.c b/hw/s390x/virtio-ccw-net.c
index 3860d4e6ea..00bd695a9c 100644
--- a/hw/s390x/virtio-ccw-net.c
+++ b/hw/s390x/virtio-ccw-net.c
@@ -62,10 +62,6 @@ static const TypeInfo virtio_ccw_net = {
     .instance_init = virtio_ccw_net_instance_init,
     .class_init    = virtio_ccw_net_class_init,
 };
+TYPE_INFO(virtio_ccw_net)
 
-static void virtio_ccw_net_register(void)
-{
-    type_register_static(&virtio_ccw_net);
-}
 
-type_init(virtio_ccw_net_register)
diff --git a/hw/s390x/virtio-ccw-rng.c b/hw/s390x/virtio-ccw-rng.c
index 2e3a9da5e8..98cdba0d26 100644
--- a/hw/s390x/virtio-ccw-rng.c
+++ b/hw/s390x/virtio-ccw-rng.c
@@ -59,10 +59,6 @@ static const TypeInfo virtio_ccw_rng = {
     .instance_init = virtio_ccw_rng_instance_init,
     .class_init    = virtio_ccw_rng_class_init,
 };
+TYPE_INFO(virtio_ccw_rng)
 
-static void virtio_ccw_rng_register(void)
-{
-    type_register_static(&virtio_ccw_rng);
-}
 
-type_init(virtio_ccw_rng_register)
diff --git a/hw/s390x/virtio-ccw-scsi.c b/hw/s390x/virtio-ccw-scsi.c
index 6e4beef700..3ec7a35e53 100644
--- a/hw/s390x/virtio-ccw-scsi.c
+++ b/hw/s390x/virtio-ccw-scsi.c
@@ -69,6 +69,7 @@ static const TypeInfo virtio_ccw_scsi = {
     .instance_init = virtio_ccw_scsi_instance_init,
     .class_init    = virtio_ccw_scsi_class_init,
 };
+TYPE_INFO(virtio_ccw_scsi)
 
 #ifdef CONFIG_VHOST_SCSI
 
@@ -111,14 +112,13 @@ static const TypeInfo vhost_ccw_scsi = {
     .instance_init = vhost_ccw_scsi_instance_init,
     .class_init    = vhost_ccw_scsi_class_init,
 };
+TYPE_INFO(vhost_ccw_scsi)
 
 #endif
 
 static void virtio_ccw_scsi_register(void)
 {
-    type_register_static(&virtio_ccw_scsi);
 #ifdef CONFIG_VHOST_SCSI
-    type_register_static(&vhost_ccw_scsi);
 #endif
 }
 
diff --git a/hw/s390x/virtio-ccw-serial.c b/hw/s390x/virtio-ccw-serial.c
index 61958228d1..c821eb57b3 100644
--- a/hw/s390x/virtio-ccw-serial.c
+++ b/hw/s390x/virtio-ccw-serial.c
@@ -70,10 +70,6 @@ static const TypeInfo virtio_ccw_serial = {
     .instance_init = virtio_ccw_serial_instance_init,
     .class_init    = virtio_ccw_serial_class_init,
 };
+TYPE_INFO(virtio_ccw_serial)
 
-static void virtio_ccw_serial_register(void)
-{
-    type_register_static(&virtio_ccw_serial);
-}
 
-type_init(virtio_ccw_serial_register)
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 0e60270297..666e9768ed 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -1199,6 +1199,7 @@ static const TypeInfo virtio_ccw_device_info = {
     .class_size = sizeof(VirtIOCCWDeviceClass),
     .abstract = true,
 };
+TYPE_INFO(virtio_ccw_device_info)
 
 /* virtio-ccw-bus */
 
@@ -1239,11 +1240,6 @@ static const TypeInfo virtio_ccw_bus_info = {
     .instance_size = sizeof(VirtioCcwBusState),
     .class_init = virtio_ccw_bus_class_init,
 };
+TYPE_INFO(virtio_ccw_bus_info)
 
-static void virtio_ccw_register(void)
-{
-    type_register_static(&virtio_ccw_bus_info);
-    type_register_static(&virtio_ccw_device_info);
-}
 
-type_init(virtio_ccw_register)
diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 497a8d5901..0fa2e1cc45 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -407,6 +407,7 @@ static const TypeInfo esp_pci_info = {
         { },
     },
 };
+TYPE_INFO(esp_pci_info)
 
 typedef struct {
     PCIESPState pci;
@@ -526,11 +527,6 @@ static const TypeInfo dc390_info = {
     .instance_size = sizeof(DC390State),
     .class_init = dc390_class_init,
 };
+TYPE_INFO(dc390_info)
 
-static void esp_pci_register_types(void)
-{
-    type_register_static(&esp_pci_info);
-    type_register_static(&dc390_info);
-}
 
-type_init(esp_pci_register_types)
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 405f8b7cbc..735529089d 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -997,10 +997,6 @@ static const TypeInfo sysbus_esp_info = {
     .instance_size = sizeof(SysBusESPState),
     .class_init    = sysbus_esp_class_init,
 };
+TYPE_INFO(sysbus_esp_info)
 
-static void esp_register_types(void)
-{
-    type_register_static(&sysbus_esp_info);
-}
 
-type_init(esp_register_types)
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 63ff4181de..4c02f32182 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -2345,6 +2345,7 @@ static const TypeInfo lsi_info = {
         { },
     },
 };
+TYPE_INFO(lsi_info)
 
 static void lsi53c810_class_init(ObjectClass *klass, void *data)
 {
@@ -2358,14 +2359,9 @@ static TypeInfo lsi53c810_info = {
     .parent        = TYPE_LSI53C895A,
     .class_init    = lsi53c810_class_init,
 };
+TYPE_INFO(lsi53c810_info)
 
-static void lsi53c895a_register_types(void)
-{
-    type_register_static(&lsi_info);
-    type_register_static(&lsi53c810_info);
-}
 
-type_init(lsi53c895a_register_types)
 
 void lsi53c8xx_handle_legacy_cmdline(DeviceState *lsi_dev)
 {
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 390c2f2edb..eda0c22f03 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -2535,12 +2535,12 @@ static const TypeInfo megasas_info = {
     .class_size = sizeof(MegasasBaseClass),
     .abstract = true,
 };
+TYPE_INFO(megasas_info)
 
 static void megasas_register_types(void)
 {
     int i;
 
-    type_register_static(&megasas_info);
     for (i = 0; i < ARRAY_SIZE(megasas_devices); i++) {
         const MegasasInfo *info = &megasas_devices[i];
         TypeInfo type_info = {};
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index df65cc2223..06eccf3239 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -49,6 +49,7 @@ static const TypeInfo scsi_bus_info = {
         { }
     }
 };
+TYPE_INFO(scsi_bus_info)
 static int next_scsi_bus;
 
 static void scsi_device_realize(SCSIDevice *s, Error **errp)
@@ -1738,11 +1739,6 @@ static const TypeInfo scsi_device_type_info = {
     .class_init = scsi_device_class_init,
     .instance_init = scsi_dev_instance_init,
 };
+TYPE_INFO(scsi_device_type_info)
 
-static void scsi_register_types(void)
-{
-    type_register_static(&scsi_bus_info);
-    type_register_static(&scsi_device_type_info);
-}
 
-type_init(scsi_register_types)
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 8ce68a9dd6..f0777dd4ee 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2976,6 +2976,7 @@ static const TypeInfo scsi_disk_base_info = {
     .class_size    = sizeof(SCSIDiskClass),
     .abstract      = true,
 };
+TYPE_INFO(scsi_disk_base_info)
 
 #define DEFINE_SCSI_DISK_PROPERTIES()                                   \
     DEFINE_PROP_DRIVE_IOTHREAD("drive", SCSIDiskState, qdev.conf.blk),  \
@@ -3042,6 +3043,7 @@ static const TypeInfo scsi_hd_info = {
     .parent        = TYPE_SCSI_DISK_BASE,
     .class_init    = scsi_hd_class_initfn,
 };
+TYPE_INFO(scsi_hd_info)
 
 static Property scsi_cd_properties[] = {
     DEFINE_SCSI_DISK_PROPERTIES(),
@@ -3073,6 +3075,7 @@ static const TypeInfo scsi_cd_info = {
     .parent        = TYPE_SCSI_DISK_BASE,
     .class_init    = scsi_cd_class_initfn,
 };
+TYPE_INFO(scsi_cd_info)
 
 #ifdef __linux__
 static Property scsi_block_properties[] = {
@@ -3112,6 +3115,7 @@ static const TypeInfo scsi_block_info = {
     .parent        = TYPE_SCSI_DISK_BASE,
     .class_init    = scsi_block_class_initfn,
 };
+TYPE_INFO(scsi_block_info)
 #endif
 
 static Property scsi_disk_properties[] = {
@@ -3152,16 +3156,12 @@ static const TypeInfo scsi_disk_info = {
     .parent        = TYPE_SCSI_DISK_BASE,
     .class_init    = scsi_disk_class_initfn,
 };
+TYPE_INFO(scsi_disk_info)
 
 static void scsi_disk_register_types(void)
 {
-    type_register_static(&scsi_disk_base_info);
-    type_register_static(&scsi_hd_info);
-    type_register_static(&scsi_cd_info);
 #ifdef __linux__
-    type_register_static(&scsi_block_info);
 #endif
-    type_register_static(&scsi_disk_info);
 }
 
 type_init(scsi_disk_register_types)
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 86ed0a3822..dc7ca649de 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -778,12 +778,8 @@ static const TypeInfo scsi_generic_info = {
     .instance_size = sizeof(SCSIDevice),
     .class_init    = scsi_generic_class_initfn,
 };
+TYPE_INFO(scsi_generic_info)
 
-static void scsi_generic_register_types(void)
-{
-    type_register_static(&scsi_generic_info);
-}
 
-type_init(scsi_generic_register_types)
 
 #endif /* __linux__ */
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index d17dc03c73..10c64396d6 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -1290,10 +1290,6 @@ static const TypeInfo spapr_vscsi_info = {
     .instance_size = sizeof(VSCSIState),
     .class_init    = spapr_vscsi_class_init,
 };
+TYPE_INFO(spapr_vscsi_info)
 
-static void spapr_vscsi_register_types(void)
-{
-    type_register_static(&spapr_vscsi_info);
-}
 
-type_init(spapr_vscsi_register_types)
diff --git a/hw/scsi/vhost-scsi-common.c b/hw/scsi/vhost-scsi-common.c
index 8ec49d7fef..cd025155e8 100644
--- a/hw/scsi/vhost-scsi-common.c
+++ b/hw/scsi/vhost-scsi-common.c
@@ -135,10 +135,6 @@ static const TypeInfo vhost_scsi_common_info = {
     .instance_size = sizeof(VHostSCSICommon),
     .abstract = true,
 };
+TYPE_INFO(vhost_scsi_common_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&vhost_scsi_common_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 13b05af29b..2341e62744 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -323,10 +323,6 @@ static const TypeInfo vhost_scsi_info = {
         { }
     },
 };
+TYPE_INFO(vhost_scsi_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&vhost_scsi_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index f2e524438a..ef8f8f05d9 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -230,10 +230,6 @@ static const TypeInfo vhost_user_scsi_info = {
         { }
     },
 };
+TYPE_INFO(vhost_user_scsi_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&vhost_user_scsi_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index b49775269e..f8af093d88 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -1028,6 +1028,7 @@ static const TypeInfo virtio_scsi_common_info = {
     .abstract = true,
     .class_init = virtio_scsi_common_class_init,
 };
+TYPE_INFO(virtio_scsi_common_info)
 
 static const TypeInfo virtio_scsi_info = {
     .name = TYPE_VIRTIO_SCSI,
@@ -1039,11 +1040,6 @@ static const TypeInfo virtio_scsi_info = {
         { }
     }
 };
+TYPE_INFO(virtio_scsi_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_scsi_common_info);
-    type_register_static(&virtio_scsi_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index c071e0c7aa..796dbc14d6 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -1312,11 +1312,6 @@ static const TypeInfo pvscsi_info = {
         { }
     }
 };
+TYPE_INFO(pvscsi_info)
 
-static void
-pvscsi_register_types(void)
-{
-    type_register_static(&pvscsi_info);
-}
 
-type_init(pvscsi_register_types);
diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index f9eb92c09e..435be3ec5e 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -815,18 +815,21 @@ static TypeInfo allwinner_sdhost_info = {
     .class_size    = sizeof(AwSdHostClass),
     .abstract      = true,
 };
+TYPE_INFO(allwinner_sdhost_info)
 
 static const TypeInfo allwinner_sdhost_sun4i_info = {
     .name          = TYPE_AW_SDHOST_SUN4I,
     .parent        = TYPE_AW_SDHOST,
     .class_init    = allwinner_sdhost_sun4i_class_init,
 };
+TYPE_INFO(allwinner_sdhost_sun4i_info)
 
 static const TypeInfo allwinner_sdhost_sun5i_info = {
     .name          = TYPE_AW_SDHOST_SUN5I,
     .parent        = TYPE_AW_SDHOST,
     .class_init    = allwinner_sdhost_sun5i_class_init,
 };
+TYPE_INFO(allwinner_sdhost_sun5i_info)
 
 static const TypeInfo allwinner_sdhost_bus_info = {
     .name = TYPE_AW_SDHOST_BUS,
@@ -834,13 +837,6 @@ static const TypeInfo allwinner_sdhost_bus_info = {
     .instance_size = sizeof(SDBus),
     .class_init = allwinner_sdhost_bus_class_init,
 };
+TYPE_INFO(allwinner_sdhost_bus_info)
 
-static void allwinner_sdhost_register_types(void)
-{
-    type_register_static(&allwinner_sdhost_info);
-    type_register_static(&allwinner_sdhost_sun4i_info);
-    type_register_static(&allwinner_sdhost_sun5i_info);
-    type_register_static(&allwinner_sdhost_bus_info);
-}
 
-type_init(allwinner_sdhost_register_types)
diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index 22cafce0fb..fe080b9465 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -189,10 +189,6 @@ static TypeInfo aspeed_sdhci_info = {
     .instance_size = sizeof(AspeedSDHCIState),
     .class_init    = aspeed_sdhci_class_init,
 };
+TYPE_INFO(aspeed_sdhci_info)
 
-static void aspeed_sdhci_register_types(void)
-{
-    type_register_static(&aspeed_sdhci_info);
-}
 
-type_init(aspeed_sdhci_register_types)
diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
index 2c7a675a2d..8b7e600d92 100644
--- a/hw/sd/bcm2835_sdhost.c
+++ b/hw/sd/bcm2835_sdhost.c
@@ -441,17 +441,13 @@ static TypeInfo bcm2835_sdhost_info = {
     .class_init    = bcm2835_sdhost_class_init,
     .instance_init = bcm2835_sdhost_init,
 };
+TYPE_INFO(bcm2835_sdhost_info)
 
 static const TypeInfo bcm2835_sdhost_bus_info = {
     .name = TYPE_BCM2835_SDHOST_BUS,
     .parent = TYPE_SD_BUS,
     .instance_size = sizeof(SDBus),
 };
+TYPE_INFO(bcm2835_sdhost_bus_info)
 
-static void bcm2835_sdhost_register_types(void)
-{
-    type_register_static(&bcm2835_sdhost_info);
-    type_register_static(&bcm2835_sdhost_bus_info);
-}
 
-type_init(bcm2835_sdhost_register_types)
diff --git a/hw/sd/core.c b/hw/sd/core.c
index 957d116f1a..55e229920d 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -251,10 +251,6 @@ static const TypeInfo sd_bus_info = {
     .instance_size = sizeof(SDBus),
     .class_size = sizeof(SDBusClass),
 };
+TYPE_INFO(sd_bus_info)
 
-static void sd_bus_register_types(void)
-{
-    type_register_static(&sd_bus_info);
-}
 
-type_init(sd_bus_register_types)
diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 3a47b380dd..499dd48a3a 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -584,6 +584,7 @@ static const TypeInfo pxa2xx_mmci_info = {
     .instance_init = pxa2xx_mmci_instance_init,
     .class_init = pxa2xx_mmci_class_init,
 };
+TYPE_INFO(pxa2xx_mmci_info)
 
 static const TypeInfo pxa2xx_mmci_bus_info = {
     .name = TYPE_PXA2XX_MMCI_BUS,
@@ -591,11 +592,6 @@ static const TypeInfo pxa2xx_mmci_bus_info = {
     .instance_size = sizeof(SDBus),
     .class_init = pxa2xx_mmci_bus_class_init,
 };
+TYPE_INFO(pxa2xx_mmci_bus_info)
 
-static void pxa2xx_mmci_register_types(void)
-{
-    type_register_static(&pxa2xx_mmci_info);
-    type_register_static(&pxa2xx_mmci_bus_info);
-}
 
-type_init(pxa2xx_mmci_register_types)
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 483c4f1720..9b896922f8 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2212,10 +2212,6 @@ static const TypeInfo sd_info = {
     .instance_init = sd_instance_init,
     .instance_finalize = sd_instance_finalize,
 };
+TYPE_INFO(sd_info)
 
-static void sd_register_types(void)
-{
-    type_register_static(&sd_info);
-}
 
-type_init(sd_register_types)
diff --git a/hw/sd/sdhci-pci.c b/hw/sd/sdhci-pci.c
index c737c8b930..5d6f7ce25f 100644
--- a/hw/sd/sdhci-pci.c
+++ b/hw/sd/sdhci-pci.c
@@ -78,10 +78,6 @@ static const TypeInfo sdhci_pci_info = {
         { },
     },
 };
+TYPE_INFO(sdhci_pci_info)
 
-static void sdhci_pci_register_type(void)
-{
-    type_register_static(&sdhci_pci_info);
-}
 
-type_init(sdhci_pci_register_type)
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 1785d7e1f7..c57e336a73 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1484,6 +1484,7 @@ static const TypeInfo sdhci_sysbus_info = {
     .instance_finalize = sdhci_sysbus_finalize,
     .class_init = sdhci_sysbus_class_init,
 };
+TYPE_INFO(sdhci_sysbus_info)
 
 /* --- qdev bus master --- */
 
@@ -1501,6 +1502,7 @@ static const TypeInfo sdhci_bus_info = {
     .instance_size = sizeof(SDBus),
     .class_init = sdhci_bus_class_init,
 };
+TYPE_INFO(sdhci_bus_info)
 
 /* --- qdev i.MX eSDHC --- */
 
@@ -1746,6 +1748,7 @@ static const TypeInfo imx_usdhc_info = {
     .parent = TYPE_SYSBUS_SDHCI,
     .instance_init = imx_usdhc_init,
 };
+TYPE_INFO(imx_usdhc_info)
 
 /* --- qdev Samsung s3c --- */
 
@@ -1810,13 +1813,6 @@ static const TypeInfo sdhci_s3c_info = {
     .parent = TYPE_SYSBUS_SDHCI,
     .instance_init = sdhci_s3c_init,
 };
+TYPE_INFO(sdhci_s3c_info)
 
-static void sdhci_register_types(void)
-{
-    type_register_static(&sdhci_sysbus_info);
-    type_register_static(&sdhci_bus_info);
-    type_register_static(&imx_usdhc_info);
-    type_register_static(&sdhci_s3c_info);
-}
 
-type_init(sdhci_register_types)
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index a7ef9cb922..21b761e5d5 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -307,10 +307,6 @@ static const TypeInfo ssi_sd_info = {
     .instance_size = sizeof(ssi_sd_state),
     .class_init    = ssi_sd_class_init,
 };
+TYPE_INFO(ssi_sd_info)
 
-static void ssi_sd_register_types(void)
-{
-    type_register_static(&ssi_sd_info);
-}
 
-type_init(ssi_sd_register_types)
diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
index 0a3e86f949..b6f5a54781 100644
--- a/hw/sh4/sh_pci.c
+++ b/hw/sh4/sh_pci.c
@@ -180,6 +180,7 @@ static const TypeInfo sh_pci_host_info = {
         { },
     },
 };
+TYPE_INFO(sh_pci_host_info)
 
 static void sh_pci_device_class_init(ObjectClass *klass, void *data)
 {
@@ -194,11 +195,6 @@ static const TypeInfo sh_pci_device_info = {
     .instance_size = sizeof(SHPCIState),
     .class_init    = sh_pci_device_class_init,
 };
+TYPE_INFO(sh_pci_device_info)
 
-static void sh_pci_register_types(void)
-{
-    type_register_static(&sh_pci_device_info);
-    type_register_static(&sh_pci_host_info);
-}
 
-type_init(sh_pci_register_types)
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index cf7dfa4af5..d5553824bd 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -631,6 +631,7 @@ static const TypeInfo idreg_info = {
     .instance_size = sizeof(IDRegState),
     .class_init    = idreg_class_init,
 };
+TYPE_INFO(idreg_info)
 
 #define TYPE_TCX_AFX "tcx_afx"
 #define TCX_AFX(obj) OBJECT_CHECK(AFXState, (obj), TYPE_TCX_AFX)
@@ -684,6 +685,7 @@ static const TypeInfo afx_info = {
     .instance_size = sizeof(AFXState),
     .class_init    = afx_class_init,
 };
+TYPE_INFO(afx_info)
 
 #define TYPE_OPENPROM "openprom"
 #define OPENPROM(obj) OBJECT_CHECK(PROMState, (obj), TYPE_OPENPROM)
@@ -772,6 +774,7 @@ static const TypeInfo prom_info = {
     .instance_size = sizeof(PROMState),
     .class_init    = prom_class_init,
 };
+TYPE_INFO(prom_info)
 
 #define TYPE_SUN4M_MEMORY "memory"
 #define SUN4M_RAM(obj) OBJECT_CHECK(RamDevice, (obj), TYPE_SUN4M_MEMORY)
@@ -815,6 +818,7 @@ static const TypeInfo ram_info = {
     .instance_init = ram_initfn,
     .class_init    = ram_class_init,
 };
+TYPE_INFO(ram_info)
 
 static void cpu_devinit(const char *cpu_type, unsigned int id,
                         uint64_t prom_addr, qemu_irq **cpu_irqs)
@@ -1420,6 +1424,7 @@ static const TypeInfo ss5_type = {
     .parent = TYPE_MACHINE,
     .class_init = ss5_class_init,
 };
+TYPE_INFO(ss5_type)
 
 static void ss10_class_init(ObjectClass *oc, void *data)
 {
@@ -1440,6 +1445,7 @@ static const TypeInfo ss10_type = {
     .parent = TYPE_MACHINE,
     .class_init = ss10_class_init,
 };
+TYPE_INFO(ss10_type)
 
 static void ss600mp_class_init(ObjectClass *oc, void *data)
 {
@@ -1460,6 +1466,7 @@ static const TypeInfo ss600mp_type = {
     .parent = TYPE_MACHINE,
     .class_init = ss600mp_class_init,
 };
+TYPE_INFO(ss600mp_type)
 
 static void ss20_class_init(ObjectClass *oc, void *data)
 {
@@ -1480,6 +1487,7 @@ static const TypeInfo ss20_type = {
     .parent = TYPE_MACHINE,
     .class_init = ss20_class_init,
 };
+TYPE_INFO(ss20_type)
 
 static void voyager_class_init(ObjectClass *oc, void *data)
 {
@@ -1499,6 +1507,7 @@ static const TypeInfo voyager_type = {
     .parent = TYPE_MACHINE,
     .class_init = voyager_class_init,
 };
+TYPE_INFO(voyager_type)
 
 static void ss_lx_class_init(ObjectClass *oc, void *data)
 {
@@ -1518,6 +1527,7 @@ static const TypeInfo ss_lx_type = {
     .parent = TYPE_MACHINE,
     .class_init = ss_lx_class_init,
 };
+TYPE_INFO(ss_lx_type)
 
 static void ss4_class_init(ObjectClass *oc, void *data)
 {
@@ -1537,6 +1547,7 @@ static const TypeInfo ss4_type = {
     .parent = TYPE_MACHINE,
     .class_init = ss4_class_init,
 };
+TYPE_INFO(ss4_type)
 
 static void scls_class_init(ObjectClass *oc, void *data)
 {
@@ -1556,6 +1567,7 @@ static const TypeInfo scls_type = {
     .parent = TYPE_MACHINE,
     .class_init = scls_class_init,
 };
+TYPE_INFO(scls_type)
 
 static void sbook_class_init(ObjectClass *oc, void *data)
 {
@@ -1575,23 +1587,11 @@ static const TypeInfo sbook_type = {
     .parent = TYPE_MACHINE,
     .class_init = sbook_class_init,
 };
+TYPE_INFO(sbook_type)
 
 static void sun4m_register_types(void)
 {
-    type_register_static(&idreg_info);
-    type_register_static(&afx_info);
-    type_register_static(&prom_info);
-    type_register_static(&ram_info);
-
-    type_register_static(&ss5_type);
-    type_register_static(&ss10_type);
-    type_register_static(&ss600mp_type);
-    type_register_static(&ss20_type);
-    type_register_static(&voyager_type);
-    type_register_static(&ss_lx_type);
-    type_register_static(&ss4_type);
-    type_register_static(&scls_type);
-    type_register_static(&sbook_type);
+
 }
 
 type_init(sun4m_register_types)
diff --git a/hw/sparc/sun4m_iommu.c b/hw/sparc/sun4m_iommu.c
index 71f5465249..ce19fe0488 100644
--- a/hw/sparc/sun4m_iommu.c
+++ b/hw/sparc/sun4m_iommu.c
@@ -389,6 +389,7 @@ static const TypeInfo iommu_info = {
     .instance_init = iommu_init,
     .class_init    = iommu_class_init,
 };
+TYPE_INFO(iommu_info)
 
 static void sun4m_iommu_memory_region_class_init(ObjectClass *klass, void *data)
 {
@@ -402,11 +403,6 @@ static const TypeInfo sun4m_iommu_memory_region_info = {
     .name = TYPE_SUN4M_IOMMU_MEMORY_REGION,
     .class_init = sun4m_iommu_memory_region_class_init,
 };
+TYPE_INFO(sun4m_iommu_memory_region_info)
 
-static void iommu_register_types(void)
-{
-    type_register_static(&iommu_info);
-    type_register_static(&sun4m_iommu_memory_region_info);
-}
 
-type_init(iommu_register_types)
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index a87d55f6bb..706bbafc38 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -174,10 +174,6 @@ static const TypeInfo niagara_type = {
     .parent = TYPE_MACHINE,
     .class_init = niagara_class_init,
 };
+TYPE_INFO(niagara_type)
 
-static void niagara_register_types(void)
-{
-    type_register_static(&niagara_type);
-}
 
-type_init(niagara_register_types)
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 37310b73e6..326e32b911 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -283,6 +283,7 @@ static const TypeInfo power_info = {
     .instance_size = sizeof(PowerDevice),
     .class_init    = power_class_init,
 };
+TYPE_INFO(power_info)
 
 static void ebus_isa_irq_handler(void *opaque, int n, int level)
 {
@@ -397,6 +398,7 @@ static const TypeInfo ebus_info = {
         { },
     },
 };
+TYPE_INFO(ebus_info)
 
 #define TYPE_OPENPROM "openprom"
 #define OPENPROM(obj) OBJECT_CHECK(PROMState, (obj), TYPE_OPENPROM)
@@ -484,6 +486,7 @@ static const TypeInfo prom_info = {
     .instance_size = sizeof(PROMState),
     .class_init    = prom_class_init,
 };
+TYPE_INFO(prom_info)
 
 
 #define TYPE_SUN4U_MEMORY "memory"
@@ -544,6 +547,7 @@ static const TypeInfo ram_info = {
     .instance_size = sizeof(RamDevice),
     .class_init    = ram_class_init,
 };
+TYPE_INFO(ram_info)
 
 static void sun4uv_init(MemoryRegion *address_space_mem,
                         MachineState *machine,
@@ -828,6 +832,7 @@ static const TypeInfo sun4u_type = {
         { }
     },
 };
+TYPE_INFO(sun4u_type)
 
 static void sun4v_class_init(ObjectClass *oc, void *data)
 {
@@ -847,16 +852,11 @@ static const TypeInfo sun4v_type = {
     .parent = TYPE_MACHINE,
     .class_init = sun4v_class_init,
 };
+TYPE_INFO(sun4v_type)
 
 static void sun4u_register_types(void)
 {
-    type_register_static(&power_info);
-    type_register_static(&ebus_info);
-    type_register_static(&prom_info);
-    type_register_static(&ram_info);
 
-    type_register_static(&sun4u_type);
-    type_register_static(&sun4v_type);
 }
 
 type_init(sun4u_register_types)
diff --git a/hw/sparc64/sun4u_iommu.c b/hw/sparc64/sun4u_iommu.c
index 9178277f82..25ed3d51c6 100644
--- a/hw/sparc64/sun4u_iommu.c
+++ b/hw/sparc64/sun4u_iommu.c
@@ -319,6 +319,7 @@ static const TypeInfo iommu_info = {
     .instance_init = iommu_init,
     .class_init    = iommu_class_init,
 };
+TYPE_INFO(iommu_info)
 
 static void sun4u_iommu_memory_region_class_init(ObjectClass *klass, void *data)
 {
@@ -332,11 +333,6 @@ static const TypeInfo sun4u_iommu_memory_region_info = {
     .name = TYPE_SUN4U_IOMMU_MEMORY_REGION,
     .class_init = sun4u_iommu_memory_region_class_init,
 };
+TYPE_INFO(sun4u_iommu_memory_region_info)
 
-static void iommu_register_types(void)
-{
-    type_register_static(&iommu_info);
-    type_register_static(&sun4u_iommu_memory_region_info);
-}
 
-type_init(iommu_register_types)
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 4fab1f5f85..a1f08cb7ee 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1447,12 +1447,12 @@ static const TypeInfo aspeed_smc_info = {
     .class_size     = sizeof(AspeedSMCClass),
     .abstract       = true,
 };
+TYPE_INFO(aspeed_smc_info)
 
 static void aspeed_smc_register_types(void)
 {
     int i;
 
-    type_register_static(&aspeed_smc_info);
     for (i = 0; i < ARRAY_SIZE(controllers); ++i) {
         TypeInfo ti = {
             .name       = controllers[i].name,
diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 7f703d8328..0d888b0ae5 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -450,10 +450,6 @@ static const TypeInfo imx_spi_info = {
     .instance_size = sizeof(IMXSPIState),
     .class_init    = imx_spi_class_init,
 };
+TYPE_INFO(imx_spi_info)
 
-static void imx_spi_register_types(void)
-{
-    type_register_static(&imx_spi_info);
-}
 
-type_init(imx_spi_register_types)
diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
index b2432c5a13..d49e79ac79 100644
--- a/hw/ssi/mss-spi.c
+++ b/hw/ssi/mss-spi.c
@@ -413,10 +413,6 @@ static const TypeInfo mss_spi_info = {
     .instance_size  = sizeof(MSSSpiState),
     .class_init     = mss_spi_class_init,
 };
+TYPE_INFO(mss_spi_info)
 
-static void mss_spi_register_types(void)
-{
-    type_register_static(&mss_spi_info);
-}
 
-type_init(mss_spi_register_types)
diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
index cade2e92a8..e8705c470c 100644
--- a/hw/ssi/pl022.c
+++ b/hw/ssi/pl022.c
@@ -307,10 +307,6 @@ static const TypeInfo pl022_info = {
     .instance_size = sizeof(PL022State),
     .class_init    = pl022_class_init,
 };
+TYPE_INFO(pl022_info)
 
-static void pl022_register_types(void)
-{
-    type_register_static(&pl022_info);
-}
 
-type_init(pl022_register_types)
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index a35d7ebb26..9461e57b8b 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -30,6 +30,7 @@ static const TypeInfo ssi_bus_info = {
     .parent = TYPE_BUS,
     .instance_size = sizeof(SSIBus),
 };
+TYPE_INFO(ssi_bus_info)
 
 static void ssi_cs_default(void *opaque, int n, int level)
 {
@@ -89,6 +90,7 @@ static const TypeInfo ssi_slave_info = {
     .class_size = sizeof(SSISlaveClass),
     .abstract = true,
 };
+TYPE_INFO(ssi_slave_info)
 
 bool ssi_realize_and_unref(DeviceState *dev, SSIBus *bus, Error **errp)
 {
@@ -136,10 +138,4 @@ const VMStateDescription vmstate_ssi_slave = {
     }
 };
 
-static void ssi_slave_register_types(void)
-{
-    type_register_static(&ssi_bus_info);
-    type_register_static(&ssi_slave_info);
-}
 
-type_init(ssi_slave_register_types)
diff --git a/hw/ssi/stm32f2xx_spi.c b/hw/ssi/stm32f2xx_spi.c
index cd6e8443db..7080454ce4 100644
--- a/hw/ssi/stm32f2xx_spi.c
+++ b/hw/ssi/stm32f2xx_spi.c
@@ -217,10 +217,6 @@ static const TypeInfo stm32f2xx_spi_info = {
     .instance_init = stm32f2xx_spi_init,
     .class_init    = stm32f2xx_spi_class_init,
 };
+TYPE_INFO(stm32f2xx_spi_info)
 
-static void stm32f2xx_spi_register_types(void)
-{
-    type_register_static(&stm32f2xx_spi_info);
-}
 
-type_init(stm32f2xx_spi_register_types)
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index 80d1488dc7..4f6f50e313 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -381,10 +381,6 @@ static const TypeInfo xilinx_spi_info = {
     .instance_size  = sizeof(XilinxSPI),
     .class_init     = xilinx_spi_class_init,
 };
+TYPE_INFO(xilinx_spi_info)
 
-static void xilinx_spi_register_types(void)
-{
-    type_register_static(&xilinx_spi_info);
-}
 
-type_init(xilinx_spi_register_types)
diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index b9371dbf8d..fbae9bc013 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1479,6 +1479,7 @@ static const TypeInfo xilinx_spips_info = {
     .class_init = xilinx_spips_class_init,
     .class_size = sizeof(XilinxSPIPSClass),
 };
+TYPE_INFO(xilinx_spips_info)
 
 static const TypeInfo xilinx_qspips_info = {
     .name  = TYPE_XILINX_QSPIPS,
@@ -1486,6 +1487,7 @@ static const TypeInfo xilinx_qspips_info = {
     .instance_size  = sizeof(XilinxQSPIPS),
     .class_init = xilinx_qspips_class_init,
 };
+TYPE_INFO(xilinx_qspips_info)
 
 static const TypeInfo xlnx_zynqmp_qspips_info = {
     .name  = TYPE_XLNX_ZYNQMP_QSPIPS,
@@ -1494,12 +1496,6 @@ static const TypeInfo xlnx_zynqmp_qspips_info = {
     .instance_init  = xlnx_zynqmp_qspips_init,
     .class_init = xlnx_zynqmp_qspips_class_init,
 };
+TYPE_INFO(xlnx_zynqmp_qspips_info)
 
-static void xilinx_spips_register_types(void)
-{
-    type_register_static(&xilinx_spips_info);
-    type_register_static(&xilinx_qspips_info);
-    type_register_static(&xlnx_zynqmp_qspips_info);
-}
 
-type_init(xilinx_spips_register_types)
diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 7233068a37..27d99c74b4 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -368,10 +368,6 @@ static const TypeInfo a9_gtimer_info = {
     .instance_size = sizeof(A9GTimerState),
     .class_init    = a9_gtimer_class_init,
 };
+TYPE_INFO(a9_gtimer_info)
 
-static void a9_gtimer_register_types(void)
-{
-    type_register_static(&a9_gtimer_info);
-}
 
-type_init(a9_gtimer_register_types)
diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
index f84fc0ea25..fcd3176656 100644
--- a/hw/timer/allwinner-a10-pit.c
+++ b/hw/timer/allwinner-a10-pit.c
@@ -296,10 +296,6 @@ static const TypeInfo a10_pit_info = {
     .instance_init = a10_pit_init,
     .class_init = a10_pit_class_init,
 };
+TYPE_INFO(a10_pit_info)
 
-static void a10_register_types(void)
-{
-    type_register_static(&a10_pit_info);
-}
 
-type_init(a10_register_types);
diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c
index be81b7a518..922b14c335 100644
--- a/hw/timer/altera_timer.c
+++ b/hw/timer/altera_timer.c
@@ -235,10 +235,6 @@ static const TypeInfo altera_timer_info = {
     .instance_init = altera_timer_init,
     .class_init    = altera_timer_class_init,
 };
+TYPE_INFO(altera_timer_info)
 
-static void altera_timer_register(void)
-{
-    type_register_static(&altera_timer_info);
-}
 
-type_init(altera_timer_register)
diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index cdfca3000b..9d37535bc2 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -322,10 +322,6 @@ static const TypeInfo arm_mptimer_info = {
     .instance_init = arm_mptimer_init,
     .class_init    = arm_mptimer_class_init,
 };
+TYPE_INFO(arm_mptimer_info)
 
-static void arm_mptimer_register_types(void)
-{
-    type_register_static(&arm_mptimer_info);
-}
 
-type_init(arm_mptimer_register_types)
diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 9607366d78..664c2d9bfc 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -385,6 +385,7 @@ static const TypeInfo icp_pit_info = {
     .instance_size = sizeof(icp_pit_state),
     .instance_init = icp_pit_init,
 };
+TYPE_INFO(icp_pit_info)
 
 static Property sp804_properties[] = {
     DEFINE_PROP_UINT32("freq0", SP804State, freq0, 1000000),
@@ -408,11 +409,6 @@ static const TypeInfo sp804_info = {
     .instance_init = sp804_init,
     .class_init    = sp804_class_init,
 };
+TYPE_INFO(sp804_info)
 
-static void arm_timer_register_types(void)
-{
-    type_register_static(&icp_pit_info);
-    type_register_static(&sp804_info);
-}
 
-type_init(arm_timer_register_types)
diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 74c58bcf24..9fc69a0e90 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -253,10 +253,6 @@ static const TypeInfo armv7m_systick_info = {
     .instance_size = sizeof(SysTickState),
     .class_init = systick_class_init,
 };
+TYPE_INFO(armv7m_systick_info)
 
-static void armv7m_systick_register_types(void)
-{
-    type_register_static(&armv7m_systick_info);
-}
 
-type_init(armv7m_systick_register_types)
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 42c47d2ce6..ca7a10dc33 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -696,6 +696,7 @@ static const TypeInfo aspeed_timer_info = {
     .class_size = sizeof(AspeedTimerClass),
     .abstract   = true,
 };
+TYPE_INFO(aspeed_timer_info)
 
 static void aspeed_2400_timer_class_init(ObjectClass *klass, void *data)
 {
@@ -712,6 +713,7 @@ static const TypeInfo aspeed_2400_timer_info = {
     .parent = TYPE_ASPEED_TIMER,
     .class_init = aspeed_2400_timer_class_init,
 };
+TYPE_INFO(aspeed_2400_timer_info)
 
 static void aspeed_2500_timer_class_init(ObjectClass *klass, void *data)
 {
@@ -728,6 +730,7 @@ static const TypeInfo aspeed_2500_timer_info = {
     .parent = TYPE_ASPEED_TIMER,
     .class_init = aspeed_2500_timer_class_init,
 };
+TYPE_INFO(aspeed_2500_timer_info)
 
 static void aspeed_2600_timer_class_init(ObjectClass *klass, void *data)
 {
@@ -744,13 +747,6 @@ static const TypeInfo aspeed_2600_timer_info = {
     .parent = TYPE_ASPEED_TIMER,
     .class_init = aspeed_2600_timer_class_init,
 };
+TYPE_INFO(aspeed_2600_timer_info)
 
-static void aspeed_timer_register_types(void)
-{
-    type_register_static(&aspeed_timer_info);
-    type_register_static(&aspeed_2400_timer_info);
-    type_register_static(&aspeed_2500_timer_info);
-    type_register_static(&aspeed_2600_timer_info);
-}
 
-type_init(aspeed_timer_register_types)
diff --git a/hw/timer/avr_timer16.c b/hw/timer/avr_timer16.c
index c48555da52..dfd940a0c5 100644
--- a/hw/timer/avr_timer16.c
+++ b/hw/timer/avr_timer16.c
@@ -612,10 +612,6 @@ static const TypeInfo avr_timer16_info = {
     .instance_init = avr_timer16_init,
     .class_init    = avr_timer16_class_init,
 };
+TYPE_INFO(avr_timer16_info)
 
-static void avr_timer16_register_types(void)
-{
-    type_register_static(&avr_timer16_info);
-}
 
-type_init(avr_timer16_register_types)
diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
index 3387a6214a..28a0c16637 100644
--- a/hw/timer/bcm2835_systmr.c
+++ b/hw/timer/bcm2835_systmr.c
@@ -154,10 +154,6 @@ static const TypeInfo bcm2835_systmr_info = {
     .instance_size = sizeof(BCM2835SystemTimerState),
     .class_init = bcm2835_systmr_class_init,
 };
+TYPE_INFO(bcm2835_systmr_info)
 
-static void bcm2835_systmr_register_types(void)
-{
-    type_register_static(&bcm2835_systmr_info);
-}
 
-type_init(bcm2835_systmr_register_types);
diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
index b0ba6b2bba..9ab120cf9c 100644
--- a/hw/timer/cadence_ttc.c
+++ b/hw/timer/cadence_ttc.c
@@ -494,10 +494,6 @@ static const TypeInfo cadence_ttc_info = {
     .instance_init = cadence_ttc_init,
     .class_init = cadence_ttc_class_init,
 };
+TYPE_INFO(cadence_ttc_info)
 
-static void cadence_ttc_register_types(void)
-{
-    type_register_static(&cadence_ttc_info);
-}
 
-type_init(cadence_ttc_register_types)
diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
index f6534241b9..57f959a040 100644
--- a/hw/timer/cmsdk-apb-dualtimer.c
+++ b/hw/timer/cmsdk-apb-dualtimer.c
@@ -520,10 +520,6 @@ static const TypeInfo cmsdk_apb_dualtimer_info = {
     .instance_init = cmsdk_apb_dualtimer_init,
     .class_init = cmsdk_apb_dualtimer_class_init,
 };
+TYPE_INFO(cmsdk_apb_dualtimer_info)
 
-static void cmsdk_apb_dualtimer_register_types(void)
-{
-    type_register_static(&cmsdk_apb_dualtimer_info);
-}
 
-type_init(cmsdk_apb_dualtimer_register_types);
diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index f85f1309f3..570e9beb29 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -270,10 +270,6 @@ static const TypeInfo cmsdk_apb_timer_info = {
     .instance_init = cmsdk_apb_timer_init,
     .class_init = cmsdk_apb_timer_class_init,
 };
+TYPE_INFO(cmsdk_apb_timer_info)
 
-static void cmsdk_apb_timer_register_types(void)
-{
-    type_register_static(&cmsdk_apb_timer_info);
-}
 
-type_init(cmsdk_apb_timer_register_types);
diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c
index 32612228da..6300add9d4 100644
--- a/hw/timer/digic-timer.c
+++ b/hw/timer/digic-timer.c
@@ -169,10 +169,6 @@ static const TypeInfo digic_timer_info = {
     .instance_init = digic_timer_init,
     .class_init = digic_timer_class_init,
 };
+TYPE_INFO(digic_timer_info)
 
-static void digic_timer_register_type(void)
-{
-    type_register_static(&digic_timer_info);
-}
 
-type_init(digic_timer_register_type)
diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index afe3d30a8e..77767a1beb 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -357,10 +357,6 @@ static const TypeInfo etraxfs_timer_info = {
     .instance_size = sizeof(ETRAXTimerState),
     .class_init    = etraxfs_timer_class_init,
 };
+TYPE_INFO(etraxfs_timer_info)
 
-static void etraxfs_timer_register_types(void)
-{
-    type_register_static(&etraxfs_timer_info);
-}
 
-type_init(etraxfs_timer_register_types)
diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 29a4b10676..077c820f3b 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1545,10 +1545,6 @@ static const TypeInfo exynos4210_mct_info = {
     .instance_init = exynos4210_mct_init,
     .class_init    = exynos4210_mct_class_init,
 };
+TYPE_INFO(exynos4210_mct_info)
 
-static void exynos4210_mct_register_types(void)
-{
-    type_register_static(&exynos4210_mct_info);
-}
 
-type_init(exynos4210_mct_register_types)
diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index 59a8c08db0..c71063f6b0 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -425,10 +425,6 @@ static const TypeInfo exynos4210_pwm_info = {
     .instance_init = exynos4210_pwm_init,
     .class_init    = exynos4210_pwm_class_init,
 };
+TYPE_INFO(exynos4210_pwm_info)
 
-static void exynos4210_pwm_register_types(void)
-{
-    type_register_static(&exynos4210_pwm_info);
-}
 
-type_init(exynos4210_pwm_register_types)
diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index eff0ee3491..d5bf6cb1f7 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -424,10 +424,6 @@ static const TypeInfo grlib_gptimer_info = {
     .instance_size = sizeof(GPTimerUnit),
     .class_init    = grlib_gptimer_class_init,
 };
+TYPE_INFO(grlib_gptimer_info)
 
-static void grlib_gptimer_register_types(void)
-{
-    type_register_static(&grlib_gptimer_info);
-}
 
-type_init(grlib_gptimer_register_types)
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 380acfa7c8..37f02c3c34 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -810,10 +810,6 @@ static const TypeInfo hpet_device_info = {
     .instance_init = hpet_init,
     .class_init    = hpet_device_class_init,
 };
+TYPE_INFO(hpet_device_info)
 
-static void hpet_register_types(void)
-{
-    type_register_static(&hpet_device_info);
-}
 
-type_init(hpet_register_types)
diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
index 29f62e5356..f20d3d53e2 100644
--- a/hw/timer/i8254.c
+++ b/hw/timer/i8254.c
@@ -374,10 +374,6 @@ static const TypeInfo pit_info = {
     .class_init    = pit_class_initfn,
     .class_size    = sizeof(PITClass),
 };
+TYPE_INFO(pit_info)
 
-static void pit_register_types(void)
-{
-    type_register_static(&pit_info);
-}
 
-type_init(pit_register_types)
diff --git a/hw/timer/i8254_common.c b/hw/timer/i8254_common.c
index 050875b497..dc8536f392 100644
--- a/hw/timer/i8254_common.c
+++ b/hw/timer/i8254_common.c
@@ -262,10 +262,6 @@ static const TypeInfo pit_common_type = {
     .class_init    = pit_common_class_init,
     .abstract      = true,
 };
+TYPE_INFO(pit_common_type)
 
-static void register_devices(void)
-{
-    type_register_static(&pit_common_type);
-}
 
-type_init(register_devices);
diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index ebd58254d1..a13cca7c4e 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -368,10 +368,6 @@ static const TypeInfo imx_epit_info = {
     .instance_size = sizeof(IMXEPITState),
     .class_init = imx_epit_class_init,
 };
+TYPE_INFO(imx_epit_info)
 
-static void imx_epit_register_types(void)
-{
-    type_register_static(&imx_epit_info);
-}
 
-type_init(imx_epit_register_types)
diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 5c0d9a269c..8d6805b464 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -553,31 +553,27 @@ static const TypeInfo imx25_gpt_info = {
     .instance_init = imx25_gpt_init,
     .class_init = imx_gpt_class_init,
 };
+TYPE_INFO(imx25_gpt_info)
 
 static const TypeInfo imx31_gpt_info = {
     .name = TYPE_IMX31_GPT,
     .parent = TYPE_IMX25_GPT,
     .instance_init = imx31_gpt_init,
 };
+TYPE_INFO(imx31_gpt_info)
 
 static const TypeInfo imx6_gpt_info = {
     .name = TYPE_IMX6_GPT,
     .parent = TYPE_IMX25_GPT,
     .instance_init = imx6_gpt_init,
 };
+TYPE_INFO(imx6_gpt_info)
 
 static const TypeInfo imx7_gpt_info = {
     .name = TYPE_IMX7_GPT,
     .parent = TYPE_IMX25_GPT,
     .instance_init = imx7_gpt_init,
 };
+TYPE_INFO(imx7_gpt_info)
 
-static void imx_gpt_register_types(void)
-{
-    type_register_static(&imx25_gpt_info);
-    type_register_static(&imx31_gpt_info);
-    type_register_static(&imx6_gpt_info);
-    type_register_static(&imx7_gpt_info);
-}
 
-type_init(imx_gpt_register_types)
diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c
index f703f407f5..929e8fee10 100644
--- a/hw/timer/lm32_timer.c
+++ b/hw/timer/lm32_timer.c
@@ -240,10 +240,6 @@ static const TypeInfo lm32_timer_info = {
     .instance_init = lm32_timer_init,
     .class_init    = lm32_timer_class_init,
 };
+TYPE_INFO(lm32_timer_info)
 
-static void lm32_timer_register_types(void)
-{
-    type_register_static(&lm32_timer_info);
-}
 
-type_init(lm32_timer_register_types)
diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
index 94389820b2..0e3787546a 100644
--- a/hw/timer/milkymist-sysctl.c
+++ b/hw/timer/milkymist-sysctl.c
@@ -353,10 +353,6 @@ static const TypeInfo milkymist_sysctl_info = {
     .instance_init = milkymist_sysctl_init,
     .class_init    = milkymist_sysctl_class_init,
 };
+TYPE_INFO(milkymist_sysctl_info)
 
-static void milkymist_sysctl_register_types(void)
-{
-    type_register_static(&milkymist_sysctl_info);
-}
 
-type_init(milkymist_sysctl_register_types)
diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
index 29943fd744..38976a4bca 100644
--- a/hw/timer/mss-timer.c
+++ b/hw/timer/mss-timer.c
@@ -289,10 +289,6 @@ static const TypeInfo mss_timer_info = {
     .instance_init = mss_timer_init,
     .class_init    = mss_timer_class_init,
 };
+TYPE_INFO(mss_timer_info)
 
-static void mss_timer_register_types(void)
-{
-    type_register_static(&mss_timer_info);
-}
 
-type_init(mss_timer_register_types)
diff --git a/hw/timer/nrf51_timer.c b/hw/timer/nrf51_timer.c
index 42be79c736..4cabc7e7d2 100644
--- a/hw/timer/nrf51_timer.c
+++ b/hw/timer/nrf51_timer.c
@@ -395,10 +395,6 @@ static const TypeInfo nrf51_timer_info = {
     .instance_init = nrf51_timer_init,
     .class_init = nrf51_timer_class_init
 };
+TYPE_INFO(nrf51_timer_info)
 
-static void nrf51_timer_register_types(void)
-{
-    type_register_static(&nrf51_timer_info);
-}
 
-type_init(nrf51_timer_register_types)
diff --git a/hw/timer/puv3_ost.c b/hw/timer/puv3_ost.c
index f76b0bb1ca..a9fff5b89f 100644
--- a/hw/timer/puv3_ost.c
+++ b/hw/timer/puv3_ost.c
@@ -156,10 +156,6 @@ static const TypeInfo puv3_ost_info = {
     .instance_size = sizeof(PUV3OSTState),
     .class_init = puv3_ost_class_init,
 };
+TYPE_INFO(puv3_ost_info)
 
-static void puv3_ost_register_type(void)
-{
-    type_register_static(&puv3_ost_info);
-}
 
-type_init(puv3_ost_register_type)
diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index 944c165889..46a315e6db 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -572,6 +572,7 @@ static const TypeInfo pxa25x_timer_dev_info = {
     .instance_size = sizeof(PXA2xxTimerInfo),
     .class_init    = pxa25x_timer_dev_class_init,
 };
+TYPE_INFO(pxa25x_timer_dev_info)
 
 static Property pxa27x_timer_dev_properties[] = {
     DEFINE_PROP_UINT32("freq", PXA2xxTimerInfo, freq, PXA27X_FREQ),
@@ -594,6 +595,7 @@ static const TypeInfo pxa27x_timer_dev_info = {
     .instance_size = sizeof(PXA2xxTimerInfo),
     .class_init    = pxa27x_timer_dev_class_init,
 };
+TYPE_INFO(pxa27x_timer_dev_info)
 
 static void pxa2xx_timer_class_init(ObjectClass *oc, void *data)
 {
@@ -611,12 +613,6 @@ static const TypeInfo pxa2xx_timer_type_info = {
     .abstract      = true,
     .class_init    = pxa2xx_timer_class_init,
 };
+TYPE_INFO(pxa2xx_timer_type_info)
 
-static void pxa2xx_timer_register_types(void)
-{
-    type_register_static(&pxa2xx_timer_type_info);
-    type_register_static(&pxa25x_timer_dev_info);
-    type_register_static(&pxa27x_timer_dev_info);
-}
 
-type_init(pxa2xx_timer_register_types)
diff --git a/hw/timer/renesas_cmt.c b/hw/timer/renesas_cmt.c
index 2e0fd21a36..92934f5cc5 100644
--- a/hw/timer/renesas_cmt.c
+++ b/hw/timer/renesas_cmt.c
@@ -274,10 +274,6 @@ static const TypeInfo rcmt_info = {
     .instance_init = rcmt_init,
     .class_init = rcmt_class_init,
 };
+TYPE_INFO(rcmt_info)
 
-static void rcmt_register_types(void)
-{
-    type_register_static(&rcmt_info);
-}
 
-type_init(rcmt_register_types)
diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
index 446f2eacdd..5be0c71497 100644
--- a/hw/timer/renesas_tmr.c
+++ b/hw/timer/renesas_tmr.c
@@ -468,10 +468,6 @@ static const TypeInfo rtmr_info = {
     .instance_init = rtmr_init,
     .class_init = rtmr_class_init,
 };
+TYPE_INFO(rtmr_info)
 
-static void rtmr_register_types(void)
-{
-    type_register_static(&rtmr_info);
-}
 
-type_init(rtmr_register_types)
diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index 4c5d65e391..36734c07e6 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -437,10 +437,6 @@ static const TypeInfo slavio_timer_info = {
     .instance_init = slavio_timer_init,
     .class_init    = slavio_timer_class_init,
 };
+TYPE_INFO(slavio_timer_info)
 
-static void slavio_timer_register_types(void)
-{
-    type_register_static(&slavio_timer_info);
-}
 
-type_init(slavio_timer_register_types)
diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
index ba8694dcd3..6cc466f2f3 100644
--- a/hw/timer/stm32f2xx_timer.c
+++ b/hw/timer/stm32f2xx_timer.c
@@ -338,10 +338,6 @@ static const TypeInfo stm32f2xx_timer_info = {
     .instance_init = stm32f2xx_timer_init,
     .class_init    = stm32f2xx_timer_class_init,
 };
+TYPE_INFO(stm32f2xx_timer_info)
 
-static void stm32f2xx_timer_register_types(void)
-{
-    type_register_static(&stm32f2xx_timer_info);
-}
 
-type_init(stm32f2xx_timer_register_types)
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 0190aa47d0..f14d4c14bb 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -263,10 +263,6 @@ static const TypeInfo xilinx_timer_info = {
     .instance_init = xilinx_timer_init,
     .class_init    = xilinx_timer_class_init,
 };
+TYPE_INFO(xilinx_timer_info)
 
-static void xilinx_timer_register_types(void)
-{
-    type_register_static(&xilinx_timer_info);
-}
 
-type_init(xilinx_timer_register_types)
diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index 60247295d4..788d05adc5 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -334,10 +334,6 @@ static const TypeInfo tpm_crb_info = {
         { }
     }
 };
+TYPE_INFO(tpm_crb_info)
 
-static void tpm_crb_register(void)
-{
-    type_register_static(&tpm_crb_info);
-}
 
-type_init(tpm_crb_register)
diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
index 8288ab0a15..7f83a8b3b2 100644
--- a/hw/tpm/tpm_spapr.c
+++ b/hw/tpm/tpm_spapr.c
@@ -423,10 +423,6 @@ static const TypeInfo tpm_spapr_info = {
         { }
     }
 };
+TYPE_INFO(tpm_spapr_info)
 
-static void tpm_spapr_register_types(void)
-{
-    type_register_static(&tpm_spapr_info);
-}
 
-type_init(tpm_spapr_register_types)
diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
index 5faf6231c0..3bb4ec10fa 100644
--- a/hw/tpm/tpm_tis_isa.c
+++ b/hw/tpm/tpm_tis_isa.c
@@ -162,10 +162,6 @@ static const TypeInfo tpm_tis_isa_info = {
         { }
     }
 };
+TYPE_INFO(tpm_tis_isa_info)
 
-static void tpm_tis_isa_register(void)
-{
-    type_register_static(&tpm_tis_isa_info);
-}
 
-type_init(tpm_tis_isa_register)
diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
index 4a3bc70625..2a63c68f22 100644
--- a/hw/tpm/tpm_tis_sysbus.c
+++ b/hw/tpm/tpm_tis_sysbus.c
@@ -151,10 +151,6 @@ static const TypeInfo tpm_tis_sysbus_info = {
         { }
     }
 };
+TYPE_INFO(tpm_tis_sysbus_info)
 
-static void tpm_tis_sysbus_register(void)
-{
-    type_register_static(&tpm_tis_sysbus_info);
-}
 
-type_init(tpm_tis_sysbus_register)
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index b17bda3b29..75c5dd5d27 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -47,6 +47,7 @@ static const TypeInfo usb_bus_info = {
         { }
     }
 };
+TYPE_INFO(usb_bus_info)
 
 static int next_usb_bus = 0;
 static QTAILQ_HEAD(, USBBus) busses = QTAILQ_HEAD_INITIALIZER(busses);
@@ -767,11 +768,6 @@ static const TypeInfo usb_device_type_info = {
     .class_size = sizeof(USBDeviceClass),
     .class_init = usb_device_class_init,
 };
+TYPE_INFO(usb_device_type_info)
 
-static void usb_register_types(void)
-{
-    type_register_static(&usb_bus_info);
-    type_register_static(&usb_device_type_info);
-}
 
-type_init(usb_register_types)
diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 7d6105ef34..e4647413c6 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -612,10 +612,6 @@ static const TypeInfo emulated_card_info = {
     .instance_size = sizeof(EmulatedState),
     .class_init    = emulated_class_initfn,
 };
+TYPE_INFO(emulated_card_info)
 
-static void ccid_card_emulated_register_types(void)
-{
-    type_register_static(&emulated_card_info);
-}
 
-type_init(ccid_card_emulated_register_types)
diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index bb325dbc4a..4a53ab2742 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -412,10 +412,6 @@ static const TypeInfo passthru_card_info = {
     .instance_size = sizeof(PassthruState),
     .class_init    = passthru_class_initfn,
 };
+TYPE_INFO(passthru_card_info)
 
-static void ccid_card_passthru_register_types(void)
-{
-    type_register_static(&passthru_card_info);
-}
 
-type_init(ccid_card_passthru_register_types)
diff --git a/hw/usb/chipidea.c b/hw/usb/chipidea.c
index 3dcd22ccba..ebf45f9a9c 100644
--- a/hw/usb/chipidea.c
+++ b/hw/usb/chipidea.c
@@ -169,9 +169,5 @@ static const TypeInfo chipidea_info = {
     .instance_init = chipidea_init,
     .class_init    = chipidea_class_init,
 };
+TYPE_INFO(chipidea_info)
 
-static void chipidea_register_type(void)
-{
-    type_register_static(&chipidea_info);
-}
-type_init(chipidea_register_type)
diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index 1371c44f48..eaef43d2b9 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -1019,10 +1019,10 @@ static const TypeInfo usb_audio_info = {
     .instance_size = sizeof(USBAudioState),
     .class_init    = usb_audio_class_init,
 };
+TYPE_INFO(usb_audio_info)
 
 static void usb_audio_register_types(void)
 {
-    type_register_static(&usb_audio_info);
     usb_legacy_register(TYPE_USB_AUDIO, "audio", NULL);
 }
 
diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
index 89f63b698b..30aff4499f 100644
--- a/hw/usb/dev-hid.c
+++ b/hw/usb/dev-hid.c
@@ -803,6 +803,7 @@ static const TypeInfo usb_hid_type_info = {
     .abstract = true,
     .class_init = usb_hid_class_initfn,
 };
+TYPE_INFO(usb_hid_type_info)
 
 static Property usb_tablet_properties[] = {
         DEFINE_PROP_UINT32("usb_version", USBHIDState, usb_version, 2),
@@ -828,6 +829,7 @@ static const TypeInfo usb_tablet_info = {
     .parent        = TYPE_USB_HID,
     .class_init    = usb_tablet_class_initfn,
 };
+TYPE_INFO(usb_tablet_info)
 
 static Property usb_mouse_properties[] = {
         DEFINE_PROP_UINT32("usb_version", USBHIDState, usb_version, 2),
@@ -851,6 +853,7 @@ static const TypeInfo usb_mouse_info = {
     .parent        = TYPE_USB_HID,
     .class_init    = usb_mouse_class_initfn,
 };
+TYPE_INFO(usb_mouse_info)
 
 static Property usb_keyboard_properties[] = {
         DEFINE_PROP_UINT32("usb_version", USBHIDState, usb_version, 2),
@@ -875,15 +878,12 @@ static const TypeInfo usb_keyboard_info = {
     .parent        = TYPE_USB_HID,
     .class_init    = usb_keyboard_class_initfn,
 };
+TYPE_INFO(usb_keyboard_info)
 
 static void usb_hid_register_types(void)
 {
-    type_register_static(&usb_hid_type_info);
-    type_register_static(&usb_tablet_info);
     usb_legacy_register("usb-tablet", "tablet", NULL);
-    type_register_static(&usb_mouse_info);
     usb_legacy_register("usb-mouse", "mouse", NULL);
-    type_register_static(&usb_keyboard_info);
     usb_legacy_register("usb-kbd", "keyboard", NULL);
 }
 
diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
index 5f19dd9fb5..f4193dfe85 100644
--- a/hw/usb/dev-hub.c
+++ b/hw/usb/dev-hub.c
@@ -695,10 +695,6 @@ static const TypeInfo hub_info = {
     .instance_size = sizeof(USBHubState),
     .class_init    = usb_hub_class_initfn,
 };
+TYPE_INFO(hub_info)
 
-static void usb_hub_register_types(void)
-{
-    type_register_static(&hub_info);
-}
 
-type_init(usb_hub_register_types)
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 15a2243101..2e42a799eb 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -2113,10 +2113,6 @@ static TypeInfo mtp_info = {
     .instance_size = sizeof(MTPState),
     .class_init    = usb_mtp_class_initfn,
 };
+TYPE_INFO(mtp_info)
 
-static void usb_mtp_register_types(void)
-{
-    type_register_static(&mtp_info);
-}
 
-type_init(usb_mtp_register_types)
diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index c69756709b..e5eb181d9e 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -1419,10 +1419,6 @@ static const TypeInfo net_info = {
     .class_init    = usb_net_class_initfn,
     .instance_init = usb_net_instance_init,
 };
+TYPE_INFO(net_info)
 
-static void usb_net_register_types(void)
-{
-    type_register_static(&net_info);
-}
 
-type_init(usb_net_register_types)
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index 7e50e3ba47..a6d85abd12 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -586,6 +586,7 @@ static const TypeInfo usb_serial_dev_type_info = {
     .abstract = true,
     .class_init = usb_serial_dev_class_init,
 };
+TYPE_INFO(usb_serial_dev_type_info)
 
 static void usb_serial_class_initfn(ObjectClass *klass, void *data)
 {
@@ -602,6 +603,7 @@ static const TypeInfo serial_info = {
     .parent        = TYPE_USB_SERIAL,
     .class_init    = usb_serial_class_initfn,
 };
+TYPE_INFO(serial_info)
 
 static Property braille_properties[] = {
     DEFINE_PROP_CHR("chardev", USBSerialState, cs),
@@ -623,12 +625,10 @@ static const TypeInfo braille_info = {
     .parent        = TYPE_USB_SERIAL,
     .class_init    = usb_braille_class_initfn,
 };
+TYPE_INFO(braille_info)
 
 static void usb_serial_register_types(void)
 {
-    type_register_static(&usb_serial_dev_type_info);
-    type_register_static(&serial_info);
-    type_register_static(&braille_info);
     usb_legacy_register("usb-braille", "braille", usb_braille_init);
 }
 
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index fcfe216594..a34aba700f 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -1180,6 +1180,7 @@ static const TypeInfo ccid_bus_info = {
     .parent = TYPE_BUS,
     .instance_size = sizeof(CCIDBus),
 };
+TYPE_INFO(ccid_bus_info)
 
 void ccid_card_send_apdu_to_guest(CCIDCardState *card,
                                   uint8_t *apdu, uint32_t len)
@@ -1466,6 +1467,7 @@ static const TypeInfo ccid_info = {
         { }
     }
 };
+TYPE_INFO(ccid_info)
 
 static void ccid_card_class_init(ObjectClass *klass, void *data)
 {
@@ -1484,12 +1486,10 @@ static const TypeInfo ccid_card_type_info = {
     .class_size = sizeof(CCIDCardClass),
     .class_init = ccid_card_class_init,
 };
+TYPE_INFO(ccid_card_type_info)
 
 static void ccid_register_types(void)
 {
-    type_register_static(&ccid_bus_info);
-    type_register_static(&ccid_card_type_info);
-    type_register_static(&ccid_info);
     usb_legacy_register(CCID_DEV_NAME, "ccid", NULL);
 }
 
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 405a4ccfe7..1b1b42016b 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -762,6 +762,7 @@ static const TypeInfo usb_storage_dev_type_info = {
     .abstract = true,
     .class_init = usb_msd_class_initfn_common,
 };
+TYPE_INFO(usb_storage_dev_type_info)
 
 static void usb_msd_instance_init(Object *obj)
 {
@@ -785,18 +786,13 @@ static const TypeInfo msd_info = {
     .class_init    = usb_msd_class_storage_initfn,
     .instance_init = usb_msd_instance_init,
 };
+TYPE_INFO(msd_info)
 
 static const TypeInfo bot_info = {
     .name          = "usb-bot",
     .parent        = TYPE_USB_STORAGE,
     .class_init    = usb_msd_class_bot_initfn,
 };
+TYPE_INFO(bot_info)
 
-static void usb_msd_register_types(void)
-{
-    type_register_static(&usb_storage_dev_type_info);
-    type_register_static(&msd_info);
-    type_register_static(&bot_info);
-}
 
-type_init(usb_msd_register_types)
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index a3a4d41c07..57f38da477 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -961,10 +961,6 @@ static const TypeInfo uas_info = {
     .instance_size = sizeof(UASDevice),
     .class_init    = usb_uas_class_initfn,
 };
+TYPE_INFO(uas_info)
 
-static void usb_uas_register_types(void)
-{
-    type_register_static(&uas_info);
-}
 
-type_init(usb_uas_register_types)
diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
index 8aba44b8bc..cb8f156f8f 100644
--- a/hw/usb/dev-wacom.c
+++ b/hw/usb/dev-wacom.c
@@ -378,10 +378,10 @@ static const TypeInfo wacom_info = {
     .instance_size = sizeof(USBWacomState),
     .class_init    = usb_wacom_class_init,
 };
+TYPE_INFO(wacom_info)
 
 static void usb_wacom_register_types(void)
 {
-    type_register_static(&wacom_info);
     usb_legacy_register(TYPE_USB_WACOM, "wacom-tablet", NULL);
 }
 
diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
index 97688d21bf..8a6b906e5f 100644
--- a/hw/usb/hcd-dwc2.c
+++ b/hw/usb/hcd-dwc2.c
@@ -1401,10 +1401,6 @@ static const TypeInfo dwc2_usb_type_info = {
     .class_size    = sizeof(DWC2Class),
     .class_init    = dwc2_class_init,
 };
+TYPE_INFO(dwc2_usb_type_info)
 
-static void dwc2_usb_register_types(void)
-{
-    type_register_static(&dwc2_usb_type_info);
-}
 
-type_init(dwc2_usb_register_types)
diff --git a/hw/usb/hcd-ehci-pci.c b/hw/usb/hcd-ehci-pci.c
index 4c37c8e227..6c97b8ceea 100644
--- a/hw/usb/hcd-ehci-pci.c
+++ b/hw/usb/hcd-ehci-pci.c
@@ -178,6 +178,7 @@ static const TypeInfo ehci_pci_type_info = {
         { },
     },
 };
+TYPE_INFO(ehci_pci_type_info)
 
 static void ehci_data_class_init(ObjectClass *klass, void *data)
 {
@@ -223,7 +224,6 @@ static void ehci_pci_register_types(void)
     };
     int i;
 
-    type_register_static(&ehci_pci_type_info);
 
     for (i = 0; i < ARRAY_SIZE(ehci_pci_info); i++) {
         ehci_type_info.name = ehci_pci_info[i].name;
diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index 3730736540..7419494528 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -98,6 +98,7 @@ static const TypeInfo ehci_type_info = {
     .class_init    = ehci_sysbus_class_init,
     .class_size    = sizeof(SysBusEHCIClass),
 };
+TYPE_INFO(ehci_type_info)
 
 static void ehci_platform_class_init(ObjectClass *oc, void *data)
 {
@@ -114,6 +115,7 @@ static const TypeInfo ehci_platform_type_info = {
     .parent        = TYPE_SYS_BUS_EHCI,
     .class_init    = ehci_platform_class_init,
 };
+TYPE_INFO(ehci_platform_type_info)
 
 static void ehci_exynos4210_class_init(ObjectClass *oc, void *data)
 {
@@ -130,6 +132,7 @@ static const TypeInfo ehci_exynos4210_type_info = {
     .parent        = TYPE_SYS_BUS_EHCI,
     .class_init    = ehci_exynos4210_class_init,
 };
+TYPE_INFO(ehci_exynos4210_type_info)
 
 static void ehci_aw_h3_class_init(ObjectClass *oc, void *data)
 {
@@ -146,6 +149,7 @@ static const TypeInfo ehci_aw_h3_type_info = {
     .parent        = TYPE_SYS_BUS_EHCI,
     .class_init    = ehci_aw_h3_class_init,
 };
+TYPE_INFO(ehci_aw_h3_type_info)
 
 static void ehci_tegra2_class_init(ObjectClass *oc, void *data)
 {
@@ -162,6 +166,7 @@ static const TypeInfo ehci_tegra2_type_info = {
     .parent        = TYPE_SYS_BUS_EHCI,
     .class_init    = ehci_tegra2_class_init,
 };
+TYPE_INFO(ehci_tegra2_type_info)
 
 static void ehci_ppc4xx_init(Object *o)
 {
@@ -186,6 +191,7 @@ static const TypeInfo ehci_ppc4xx_type_info = {
     .class_init    = ehci_ppc4xx_class_init,
     .instance_init = ehci_ppc4xx_init,
 };
+TYPE_INFO(ehci_ppc4xx_type_info)
 
 /*
  * Faraday FUSBH200 USB 2.0 EHCI
@@ -262,16 +268,6 @@ static const TypeInfo ehci_fusbh200_type_info = {
     .instance_init = fusbh200_ehci_init,
     .class_init    = fusbh200_ehci_class_init,
 };
+TYPE_INFO(ehci_fusbh200_type_info)
 
-static void ehci_sysbus_register_types(void)
-{
-    type_register_static(&ehci_type_info);
-    type_register_static(&ehci_platform_type_info);
-    type_register_static(&ehci_exynos4210_type_info);
-    type_register_static(&ehci_aw_h3_type_info);
-    type_register_static(&ehci_tegra2_type_info);
-    type_register_static(&ehci_ppc4xx_type_info);
-    type_register_static(&ehci_fusbh200_type_info);
-}
 
-type_init(ehci_sysbus_register_types)
diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
index a7fb1666af..aa461de292 100644
--- a/hw/usb/hcd-ohci-pci.c
+++ b/hw/usb/hcd-ohci-pci.c
@@ -155,10 +155,6 @@ static const TypeInfo ohci_pci_info = {
         { },
     },
 };
+TYPE_INFO(ohci_pci_info)
 
-static void ohci_pci_register_types(void)
-{
-    type_register_static(&ohci_pci_info);
-}
 
-type_init(ohci_pci_register_types)
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 1e6e85e86a..d69956e998 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1995,10 +1995,6 @@ static const TypeInfo ohci_sysbus_info = {
     .instance_size = sizeof(OHCISysBusState),
     .class_init    = ohci_sysbus_class_init,
 };
+TYPE_INFO(ohci_sysbus_info)
 
-static void ohci_register_types(void)
-{
-    type_register_static(&ohci_sysbus_info);
-}
 
-type_init(ohci_register_types)
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 37f7beb3fa..a30964ac2c 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -1333,6 +1333,7 @@ static const TypeInfo uhci_pci_type_info = {
         { },
     },
 };
+TYPE_INFO(uhci_pci_type_info)
 
 static void uhci_data_class_init(ObjectClass *klass, void *data)
 {
@@ -1432,7 +1433,6 @@ static void uhci_register_types(void)
     };
     int i;
 
-    type_register_static(&uhci_pci_type_info);
 
     for (i = 0; i < ARRAY_SIZE(uhci_info); i++) {
         uhci_type_info.name = uhci_info[i].name;
diff --git a/hw/usb/hcd-xhci-nec.c b/hw/usb/hcd-xhci-nec.c
index e6a5a22b6d..91e27b64e1 100644
--- a/hw/usb/hcd-xhci-nec.c
+++ b/hw/usb/hcd-xhci-nec.c
@@ -55,10 +55,6 @@ static const TypeInfo nec_xhci_info = {
     .parent        = TYPE_XHCI,
     .class_init    = nec_xhci_class_init,
 };
+TYPE_INFO(nec_xhci_info)
 
-static void nec_xhci_register_types(void)
-{
-    type_register_static(&nec_xhci_info);
-}
 
-type_init(nec_xhci_register_types)
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 67a18fe2b6..7d2d8f854e 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -3728,6 +3728,7 @@ static const TypeInfo xhci_info = {
         { }
     },
 };
+TYPE_INFO(xhci_info)
 
 static void qemu_xhci_class_init(ObjectClass *klass, void *data)
 {
@@ -3755,11 +3756,6 @@ static const TypeInfo qemu_xhci_info = {
     .class_init    = qemu_xhci_class_init,
     .instance_init = qemu_xhci_instance_init,
 };
+TYPE_INFO(qemu_xhci_info)
 
-static void xhci_register_types(void)
-{
-    type_register_static(&xhci_info);
-    type_register_static(&qemu_xhci_info);
-}
 
-type_init(xhci_register_types)
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index c474551d84..89d313e7e1 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1708,13 +1708,9 @@ static TypeInfo usb_host_dev_info = {
     .class_init    = usb_host_class_initfn,
     .instance_init = usb_host_instance_init,
 };
+TYPE_INFO(usb_host_dev_info)
 
-static void usb_host_register_types(void)
-{
-    type_register_static(&usb_host_dev_info);
-}
 
-type_init(usb_host_register_types)
 
 /* ------------------------------------------------------------------------ */
 
diff --git a/hw/usb/imx-usb-phy.c b/hw/usb/imx-usb-phy.c
index e705a03a1f..59ed520aae 100644
--- a/hw/usb/imx-usb-phy.c
+++ b/hw/usb/imx-usb-phy.c
@@ -216,10 +216,6 @@ static const TypeInfo imx_usbphy_info = {
     .instance_size = sizeof(IMXUSBPHYState),
     .class_init    = imx_usbphy_class_init,
 };
+TYPE_INFO(imx_usbphy_info)
 
-static void imx_usbphy_register_types(void)
-{
-    type_register_static(&imx_usbphy_info);
-}
 
-type_init(imx_usbphy_register_types)
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 417a60a2e6..b5c1e656bd 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -2605,10 +2605,6 @@ static const TypeInfo usbredir_dev_info = {
     .class_init    = usbredir_class_initfn,
     .instance_init = usbredir_instance_init,
 };
+TYPE_INFO(usbredir_dev_info)
 
-static void usbredir_register_types(void)
-{
-    type_register_static(&usbredir_dev_info);
-}
 
-type_init(usbredir_register_types)
diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
index 27eb28d3e4..fc1263fcd0 100644
--- a/hw/usb/tusb6010.c
+++ b/hw/usb/tusb6010.c
@@ -840,10 +840,6 @@ static const TypeInfo tusb6010_info = {
     .instance_size = sizeof(TUSBState),
     .class_init    = tusb6010_class_init,
 };
+TYPE_INFO(tusb6010_info)
 
-static void tusb6010_register_types(void)
-{
-    type_register_static(&tusb6010_info);
-}
 
-type_init(tusb6010_register_types)
diff --git a/hw/vfio/amd-xgbe.c b/hw/vfio/amd-xgbe.c
index 96bd608b8d..324fb4808e 100644
--- a/hw/vfio/amd-xgbe.c
+++ b/hw/vfio/amd-xgbe.c
@@ -52,10 +52,6 @@ static const TypeInfo vfio_amd_xgbe_dev_info = {
     .class_init = vfio_amd_xgbe_class_init,
     .class_size = sizeof(VFIOAmdXgbeDeviceClass),
 };
+TYPE_INFO(vfio_amd_xgbe_dev_info)
 
-static void register_amd_xgbe_dev_type(void)
-{
-    type_register_static(&vfio_amd_xgbe_dev_info);
-}
 
-type_init(register_amd_xgbe_dev_type)
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index b9330a8e6f..a45da2aa82 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -178,10 +178,6 @@ static const TypeInfo vfio_ap_info = {
     .instance_size = sizeof(VFIOAPDevice),
     .class_init = vfio_ap_class_init,
 };
+TYPE_INFO(vfio_ap_info)
 
-static void vfio_ap_type_init(void)
-{
-    type_register_static(&vfio_ap_info);
-}
 
-type_init(vfio_ap_type_init)
diff --git a/hw/vfio/calxeda-xgmac.c b/hw/vfio/calxeda-xgmac.c
index 87c382e736..da37db3837 100644
--- a/hw/vfio/calxeda-xgmac.c
+++ b/hw/vfio/calxeda-xgmac.c
@@ -52,10 +52,6 @@ static const TypeInfo vfio_calxeda_xgmac_dev_info = {
     .class_init = vfio_calxeda_xgmac_class_init,
     .class_size = sizeof(VFIOCalxedaXgmacDeviceClass),
 };
+TYPE_INFO(vfio_calxeda_xgmac_dev_info)
 
-static void register_calxeda_xgmac_dev_type(void)
-{
-    type_register_static(&vfio_calxeda_xgmac_dev_info);
-}
 
-type_init(register_calxeda_xgmac_dev_type)
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index ff7f369779..96488335ed 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -740,10 +740,6 @@ static const TypeInfo vfio_ccw_info = {
     .instance_size = sizeof(VFIOCCWDevice),
     .class_init = vfio_ccw_class_init,
 };
+TYPE_INFO(vfio_ccw_info)
 
-static void register_vfio_ccw_type(void)
-{
-    type_register_static(&vfio_ccw_info);
-}
 
-type_init(register_vfio_ccw_type)
diff --git a/hw/vfio/igd.c b/hw/vfio/igd.c
index 64e332746b..5a2aa3c06d 100644
--- a/hw/vfio/igd.c
+++ b/hw/vfio/igd.c
@@ -208,13 +208,9 @@ static TypeInfo vfio_pci_igd_lpc_bridge_info = {
         { },
     },
 };
+TYPE_INFO(vfio_pci_igd_lpc_bridge_info)
 
-static void vfio_pci_igd_register_types(void)
-{
-    type_register_static(&vfio_pci_igd_lpc_bridge_info);
-}
 
-type_init(vfio_pci_igd_register_types)
 
 static int vfio_pci_igd_lpc_init(VFIOPCIDevice *vdev,
                                  struct vfio_region_info *info)
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 3611dcd38b..a96821c86d 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3207,6 +3207,7 @@ static const TypeInfo vfio_pci_dev_info = {
         { }
     },
 };
+TYPE_INFO(vfio_pci_dev_info)
 
 static Property vfio_pci_dev_nohotplug_properties[] = {
     DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
@@ -3227,11 +3228,6 @@ static const TypeInfo vfio_pci_nohotplug_dev_info = {
     .instance_size = sizeof(VFIOPCIDevice),
     .class_init = vfio_pci_nohotplug_dev_class_init,
 };
+TYPE_INFO(vfio_pci_nohotplug_dev_info)
 
-static void register_vfio_pci_dev_type(void)
-{
-    type_register_static(&vfio_pci_dev_info);
-    type_register_static(&vfio_pci_nohotplug_dev_info);
-}
 
-type_init(register_vfio_pci_dev_type)
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index ac2cefc9b1..16688f040f 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -714,10 +714,6 @@ static const TypeInfo vfio_platform_dev_info = {
     .class_init = vfio_platform_class_init,
     .class_size = sizeof(VFIOPlatformDeviceClass),
 };
+TYPE_INFO(vfio_platform_dev_info)
 
-static void register_vfio_platform_dev_type(void)
-{
-    type_register_static(&vfio_platform_dev_info);
-}
 
-type_init(register_vfio_platform_dev_type)
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 1bc5d03a00..bc9165c2ad 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -301,10 +301,6 @@ static const TypeInfo vuf_info = {
     .instance_size = sizeof(VHostUserFS),
     .class_init = vuf_class_init,
 };
+TYPE_INFO(vuf_info)
 
-static void vuf_register_types(void)
-{
-    type_register_static(&vuf_info);
-}
 
-type_init(vuf_register_types)
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 3534a39d62..0e8f403bd5 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -172,10 +172,6 @@ static const TypeInfo vuv_info = {
     .instance_size = sizeof(VHostUserVSock),
     .class_init = vuv_class_init,
 };
+TYPE_INFO(vuv_info)
 
-static void vuv_register_types(void)
-{
-    type_register_static(&vuv_info);
-}
 
-type_init(vuv_register_types)
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 5b2ebf3496..33c356e67a 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -249,10 +249,6 @@ static const TypeInfo vhost_vsock_common_info = {
     .class_init = vhost_vsock_common_class_init,
     .abstract = true,
 };
+TYPE_INFO(vhost_vsock_common_info)
 
-static void vhost_vsock_common_register_types(void)
-{
-    type_register_static(&vhost_vsock_common_info);
-}
 
-type_init(vhost_vsock_common_register_types)
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index c8f0699b4f..dde39257e4 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -224,10 +224,6 @@ static const TypeInfo vhost_vsock_info = {
     .instance_size = sizeof(VHostVSock),
     .class_init = vhost_vsock_class_init,
 };
+TYPE_INFO(vhost_vsock_info)
 
-static void vhost_vsock_register_types(void)
-{
-    type_register_static(&vhost_vsock_info);
-}
 
-type_init(vhost_vsock_register_types)
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 22cb5df717..070f3e8364 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -1071,10 +1071,6 @@ static const TypeInfo virtio_balloon_info = {
     .instance_init = virtio_balloon_instance_init,
     .class_init = virtio_balloon_class_init,
 };
+TYPE_INFO(virtio_balloon_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_balloon_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index d6332d45c3..29d49173bd 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -335,10 +335,6 @@ static const TypeInfo virtio_bus_info = {
     .class_size = sizeof(VirtioBusClass),
     .class_init = virtio_bus_class_init
 };
+TYPE_INFO(virtio_bus_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_bus_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 6da12e315f..86c4076860 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -986,10 +986,6 @@ static const TypeInfo virtio_crypto_info = {
     .instance_init = virtio_crypto_instance_init,
     .class_init = virtio_crypto_class_init,
 };
+TYPE_INFO(virtio_crypto_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_crypto_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/virtio/virtio-input-pci.c b/hw/virtio/virtio-input-pci.c
index 74651a42ea..29c633b3d8 100644
--- a/hw/virtio/virtio-input-pci.c
+++ b/hw/virtio/virtio-input-pci.c
@@ -112,6 +112,7 @@ static const TypeInfo virtio_input_pci_info = {
     .class_init    = virtio_input_pci_class_init,
     .abstract      = true,
 };
+TYPE_INFO(virtio_input_pci_info)
 
 static const TypeInfo virtio_input_hid_pci_info = {
     .name          = TYPE_VIRTIO_INPUT_HID_PCI,
@@ -119,6 +120,7 @@ static const TypeInfo virtio_input_hid_pci_info = {
     .instance_size = sizeof(VirtIOInputHIDPCI),
     .abstract      = true,
 };
+TYPE_INFO(virtio_input_hid_pci_info)
 
 static const VirtioPCIDeviceTypeInfo virtio_keyboard_pci_info = {
     .generic_name  = TYPE_VIRTIO_KEYBOARD_PCI,
@@ -146,8 +148,6 @@ static const VirtioPCIDeviceTypeInfo virtio_tablet_pci_info = {
 static void virtio_pci_input_register(void)
 {
     /* Base types: */
-    type_register_static(&virtio_input_pci_info);
-    type_register_static(&virtio_input_hid_pci_info);
 
     /* Implementations: */
     virtio_pci_types_register(&virtio_keyboard_pci_info);
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 5d56865e56..ad7665dad3 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -984,17 +984,13 @@ static const TypeInfo virtio_iommu_info = {
     .instance_init = virtio_iommu_instance_init,
     .class_init = virtio_iommu_class_init,
 };
+TYPE_INFO(virtio_iommu_info)
 
 static const TypeInfo virtio_iommu_memory_region_info = {
     .parent = TYPE_IOMMU_MEMORY_REGION,
     .name = TYPE_VIRTIO_IOMMU_MEMORY_REGION,
     .class_init = virtio_iommu_memory_region_class_init,
 };
+TYPE_INFO(virtio_iommu_memory_region_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_iommu_info);
-    type_register_static(&virtio_iommu_memory_region_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 8fbec77ccc..c3d45c2173 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -862,10 +862,6 @@ static const TypeInfo virtio_mem_info = {
     .class_init = virtio_mem_class_init,
     .class_size = sizeof(VirtIOMEMClass),
 };
+TYPE_INFO(virtio_mem_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_mem_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index f12d1595aa..fddb3d8d15 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -721,6 +721,7 @@ static const TypeInfo virtio_mmio_info = {
     .instance_size = sizeof(VirtIOMMIOProxy),
     .class_init    = virtio_mmio_class_init,
 };
+TYPE_INFO(virtio_mmio_info)
 
 /* virtio-mmio-bus. */
 
@@ -790,11 +791,6 @@ static const TypeInfo virtio_mmio_bus_info = {
     .instance_size = sizeof(VirtioBusState),
     .class_init    = virtio_mmio_bus_class_init,
 };
+TYPE_INFO(virtio_mmio_bus_info)
 
-static void virtio_mmio_register_types(void)
-{
-    type_register_static(&virtio_mmio_bus_info);
-    type_register_static(&virtio_mmio_info);
-}
 
-type_init(virtio_mmio_register_types)
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index ccdf54e81c..a619acc264 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1940,6 +1940,7 @@ static const TypeInfo virtio_pci_info = {
     .class_size    = sizeof(VirtioPCIClass),
     .abstract      = true,
 };
+TYPE_INFO(virtio_pci_info)
 
 static Property virtio_pci_generic_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("disable-legacy", VirtIOPCIProxy, disable_legacy,
@@ -2103,12 +2104,11 @@ static const TypeInfo virtio_pci_bus_info = {
     .instance_size = sizeof(VirtioPCIBusState),
     .class_init    = virtio_pci_bus_class_init,
 };
+TYPE_INFO(virtio_pci_bus_info)
 
 static void virtio_pci_register_types(void)
 {
     /* Base types: */
-    type_register_static(&virtio_pci_bus_info);
-    type_register_static(&virtio_pci_info);
 }
 
 type_init(virtio_pci_register_types)
diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index 1e0c137497..f085a8687a 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -183,10 +183,6 @@ static TypeInfo virtio_pmem_info = {
     .class_init    = virtio_pmem_class_init,
     .instance_size = sizeof(VirtIOPMEM),
 };
+TYPE_INFO(virtio_pmem_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_pmem_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
index 2886c0ce2a..0606aea8dc 100644
--- a/hw/virtio/virtio-rng.c
+++ b/hw/virtio/virtio-rng.c
@@ -281,10 +281,6 @@ static const TypeInfo virtio_rng_info = {
     .instance_size = sizeof(VirtIORNG),
     .class_init = virtio_rng_class_init,
 };
+TYPE_INFO(virtio_rng_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_rng_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e983025217..e3788a037b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3853,10 +3853,6 @@ static const TypeInfo virtio_device_info = {
     .abstract = true,
     .class_size = sizeof(VirtioDeviceClass),
 };
+TYPE_INFO(virtio_device_info)
 
-static void virtio_register_types(void)
-{
-    type_register_static(&virtio_device_info);
-}
 
-type_init(virtio_register_types)
diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
index 5bbadadfa6..24cc0aa703 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -382,6 +382,7 @@ static const TypeInfo cmsdk_apb_watchdog_info = {
     .instance_init = cmsdk_apb_watchdog_init,
     .class_init = cmsdk_apb_watchdog_class_init,
 };
+TYPE_INFO(cmsdk_apb_watchdog_info)
 
 static void luminary_watchdog_init(Object *obj)
 {
@@ -396,11 +397,6 @@ static const TypeInfo luminary_watchdog_info = {
     .parent = TYPE_CMSDK_APB_WATCHDOG,
     .instance_init = luminary_watchdog_init
 };
+TYPE_INFO(luminary_watchdog_info)
 
-static void cmsdk_apb_watchdog_register_types(void)
-{
-    type_register_static(&cmsdk_apb_watchdog_info);
-    type_register_static(&luminary_watchdog_info);
-}
 
-type_init(cmsdk_apb_watchdog_register_types);
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 6352ba1b0e..b8a5cb8a55 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -282,6 +282,7 @@ static const TypeInfo aspeed_wdt_info = {
     .class_size    = sizeof(AspeedWDTClass),
     .abstract      = true,
 };
+TYPE_INFO(aspeed_wdt_info)
 
 static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
 {
@@ -301,6 +302,7 @@ static const TypeInfo aspeed_2400_wdt_info = {
     .instance_size = sizeof(AspeedWDTState),
     .class_init = aspeed_2400_wdt_class_init,
 };
+TYPE_INFO(aspeed_2400_wdt_info)
 
 static void aspeed_2500_wdt_reset_pulse(AspeedWDTState *s, uint32_t property)
 {
@@ -336,6 +338,7 @@ static const TypeInfo aspeed_2500_wdt_info = {
     .instance_size = sizeof(AspeedWDTState),
     .class_init = aspeed_2500_wdt_class_init,
 };
+TYPE_INFO(aspeed_2500_wdt_info)
 
 static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
 {
@@ -356,14 +359,11 @@ static const TypeInfo aspeed_2600_wdt_info = {
     .instance_size = sizeof(AspeedWDTState),
     .class_init = aspeed_2600_wdt_class_init,
 };
+TYPE_INFO(aspeed_2600_wdt_info)
 
 static void wdt_aspeed_register_types(void)
 {
     watchdog_add_model(&model);
-    type_register_static(&aspeed_wdt_info);
-    type_register_static(&aspeed_2400_wdt_info);
-    type_register_static(&aspeed_2500_wdt_info);
-    type_register_static(&aspeed_2600_wdt_info);
 }
 
 type_init(wdt_aspeed_register_types)
diff --git a/hw/watchdog/wdt_diag288.c b/hw/watchdog/wdt_diag288.c
index 71a945f0bd..fb32d70be6 100644
--- a/hw/watchdog/wdt_diag288.c
+++ b/hw/watchdog/wdt_diag288.c
@@ -137,11 +137,11 @@ static const TypeInfo wdt_diag288_info = {
     .instance_size  = sizeof(DIAG288State),
     .class_size = sizeof(DIAG288Class),
 };
+TYPE_INFO(wdt_diag288_info)
 
 static void wdt_diag288_register_types(void)
 {
     watchdog_add_model(&model);
-    type_register_static(&wdt_diag288_info);
 }
 
 type_init(wdt_diag288_register_types)
diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index 370cf92e85..989713fa4b 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -491,11 +491,11 @@ static const TypeInfo i6300esb_info = {
         { },
     },
 };
+TYPE_INFO(i6300esb_info)
 
 static void i6300esb_register_types(void)
 {
     watchdog_add_model(&model);
-    type_register_static(&i6300esb_info);
 }
 
 type_init(i6300esb_register_types)
diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
index 985944a84a..ead7d0dbbd 100644
--- a/hw/watchdog/wdt_ib700.c
+++ b/hw/watchdog/wdt_ib700.c
@@ -146,11 +146,11 @@ static const TypeInfo wdt_ib700_info = {
     .instance_size = sizeof(IB700State),
     .class_init    = wdt_ib700_class_init,
 };
+TYPE_INFO(wdt_ib700_info)
 
 static void wdt_ib700_register_types(void)
 {
     watchdog_add_model(&model);
-    type_register_static(&wdt_ib700_info);
 }
 
 type_init(wdt_ib700_register_types)
diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index a5fb76308f..0e71e54c02 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -290,6 +290,7 @@ static const TypeInfo imx2_wdt_info = {
     .instance_size = sizeof(IMX2WdtState),
     .class_init    = imx2_wdt_class_init,
 };
+TYPE_INFO(imx2_wdt_info)
 
 static WatchdogTimerModel model = {
     .wdt_name = "imx2-watchdog",
@@ -299,6 +300,5 @@ static WatchdogTimerModel model = {
 static void imx2_wdt_register_type(void)
 {
     watchdog_add_model(&model);
-    type_register_static(&imx2_wdt_info);
 }
 type_init(imx2_wdt_register_type)
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 9ce1c9540b..ff65360545 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -517,6 +517,7 @@ static const TypeInfo xen_bus_type_info = {
         { }
     },
 };
+TYPE_INFO(xen_bus_type_info)
 
 void xen_device_backend_printf(XenDevice *xendev, const char *key,
                                const char *fmt, ...)
@@ -1349,6 +1350,7 @@ static const TypeInfo xen_device_type_info = {
     .class_size = sizeof(XenDeviceClass),
     .class_init = xen_device_class_init,
 };
+TYPE_INFO(xen_device_type_info)
 
 typedef struct XenBridge {
     SysBusDevice busdev;
@@ -1361,15 +1363,9 @@ static const TypeInfo xen_bridge_type_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(XenBridge),
 };
+TYPE_INFO(xen_bridge_type_info)
 
-static void xen_register_types(void)
-{
-    type_register_static(&xen_bridge_type_info);
-    type_register_static(&xen_bus_type_info);
-    type_register_static(&xen_device_type_info);
-}
 
-type_init(xen_register_types)
 
 void xen_bus_init(void)
 {
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index b61a4855b7..2fdac398e1 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -797,6 +797,7 @@ static const TypeInfo xendev_type_info = {
     .class_init    = xendev_class_init,
     .instance_size = sizeof(struct XenLegacyDevice),
 };
+TYPE_INFO(xendev_type_info)
 
 static void xen_sysbus_class_init(ObjectClass *klass, void *data)
 {
@@ -814,6 +815,7 @@ static const TypeInfo xensysbus_info = {
         { }
     }
 };
+TYPE_INFO(xensysbus_info)
 
 static Property xen_sysdev_properties[] = {
     {/* end of property list */},
@@ -832,12 +834,6 @@ static const TypeInfo xensysdev_info = {
     .instance_size = sizeof(SysBusDevice),
     .class_init    = xen_sysdev_class_init,
 };
+TYPE_INFO(xensysdev_info)
 
-static void xenbe_register_types(void)
-{
-    type_register_static(&xensysbus_info);
-    type_register_static(&xensysdev_info);
-    type_register_static(&xendev_type_info);
-}
 
-type_init(xenbe_register_types)
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 6d359ee486..e6a860c76b 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -994,10 +994,6 @@ static const TypeInfo xen_pci_passthrough_info = {
         { },
     },
 };
+TYPE_INFO(xen_pci_passthrough_info)
 
-static void xen_pci_passthrough_register_types(void)
-{
-    type_register_static(&xen_pci_passthrough_info);
-}
 
-type_init(xen_pci_passthrough_register_types)
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 10de15855a..1a611e883b 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -614,6 +614,7 @@ static const TypeInfo xtfpga_lx60_type = {
     .parent = TYPE_MACHINE,
     .class_init = xtfpga_lx60_class_init,
 };
+TYPE_INFO(xtfpga_lx60_type)
 
 static void xtfpga_lx60_nommu_class_init(ObjectClass *oc, void *data)
 {
@@ -631,6 +632,7 @@ static const TypeInfo xtfpga_lx60_nommu_type = {
     .parent = TYPE_MACHINE,
     .class_init = xtfpga_lx60_nommu_class_init,
 };
+TYPE_INFO(xtfpga_lx60_nommu_type)
 
 static void xtfpga_lx200_class_init(ObjectClass *oc, void *data)
 {
@@ -648,6 +650,7 @@ static const TypeInfo xtfpga_lx200_type = {
     .parent = TYPE_MACHINE,
     .class_init = xtfpga_lx200_class_init,
 };
+TYPE_INFO(xtfpga_lx200_type)
 
 static void xtfpga_lx200_nommu_class_init(ObjectClass *oc, void *data)
 {
@@ -665,6 +668,7 @@ static const TypeInfo xtfpga_lx200_nommu_type = {
     .parent = TYPE_MACHINE,
     .class_init = xtfpga_lx200_nommu_class_init,
 };
+TYPE_INFO(xtfpga_lx200_nommu_type)
 
 static void xtfpga_ml605_class_init(ObjectClass *oc, void *data)
 {
@@ -682,6 +686,7 @@ static const TypeInfo xtfpga_ml605_type = {
     .parent = TYPE_MACHINE,
     .class_init = xtfpga_ml605_class_init,
 };
+TYPE_INFO(xtfpga_ml605_type)
 
 static void xtfpga_ml605_nommu_class_init(ObjectClass *oc, void *data)
 {
@@ -699,6 +704,7 @@ static const TypeInfo xtfpga_ml605_nommu_type = {
     .parent = TYPE_MACHINE,
     .class_init = xtfpga_ml605_nommu_class_init,
 };
+TYPE_INFO(xtfpga_ml605_nommu_type)
 
 static void xtfpga_kc705_class_init(ObjectClass *oc, void *data)
 {
@@ -716,6 +722,7 @@ static const TypeInfo xtfpga_kc705_type = {
     .parent = TYPE_MACHINE,
     .class_init = xtfpga_kc705_class_init,
 };
+TYPE_INFO(xtfpga_kc705_type)
 
 static void xtfpga_kc705_nommu_class_init(ObjectClass *oc, void *data)
 {
@@ -733,17 +740,6 @@ static const TypeInfo xtfpga_kc705_nommu_type = {
     .parent = TYPE_MACHINE,
     .class_init = xtfpga_kc705_nommu_class_init,
 };
+TYPE_INFO(xtfpga_kc705_nommu_type)
 
-static void xtfpga_machines_init(void)
-{
-    type_register_static(&xtfpga_lx60_type);
-    type_register_static(&xtfpga_lx200_type);
-    type_register_static(&xtfpga_ml605_type);
-    type_register_static(&xtfpga_kc705_type);
-    type_register_static(&xtfpga_lx60_nommu_type);
-    type_register_static(&xtfpga_lx200_nommu_type);
-    type_register_static(&xtfpga_ml605_nommu_type);
-    type_register_static(&xtfpga_kc705_nommu_type);
-}
 
-type_init(xtfpga_machines_init)
diff --git a/io/channel-buffer.c b/io/channel-buffer.c
index 5402e0cced..efc86f94a6 100644
--- a/io/channel-buffer.c
+++ b/io/channel-buffer.c
@@ -242,10 +242,6 @@ static const TypeInfo qio_channel_buffer_info = {
     .instance_finalize = qio_channel_buffer_finalize,
     .class_init = qio_channel_buffer_class_init,
 };
+TYPE_INFO(qio_channel_buffer_info)
 
-static void qio_channel_buffer_register_types(void)
-{
-    type_register_static(&qio_channel_buffer_info);
-}
 
-type_init(qio_channel_buffer_register_types);
diff --git a/io/channel-command.c b/io/channel-command.c
index 368dd62b7e..32382e2b91 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -383,10 +383,6 @@ static const TypeInfo qio_channel_command_info = {
     .instance_finalize = qio_channel_command_finalize,
     .class_init = qio_channel_command_class_init,
 };
+TYPE_INFO(qio_channel_command_info)
 
-static void qio_channel_command_register_types(void)
-{
-    type_register_static(&qio_channel_command_info);
-}
 
-type_init(qio_channel_command_register_types);
diff --git a/io/channel-file.c b/io/channel-file.c
index dac21f6012..335773edf0 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -225,10 +225,6 @@ static const TypeInfo qio_channel_file_info = {
     .instance_finalize = qio_channel_file_finalize,
     .class_init = qio_channel_file_class_init,
 };
+TYPE_INFO(qio_channel_file_info)
 
-static void qio_channel_file_register_types(void)
-{
-    type_register_static(&qio_channel_file_info);
-}
 
-type_init(qio_channel_file_register_types);
diff --git a/io/channel-socket.c b/io/channel-socket.c
index e1b4667087..e91b6b9756 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -797,10 +797,6 @@ static const TypeInfo qio_channel_socket_info = {
     .instance_finalize = qio_channel_socket_finalize,
     .class_init = qio_channel_socket_class_init,
 };
+TYPE_INFO(qio_channel_socket_info)
 
-static void qio_channel_socket_register_types(void)
-{
-    type_register_static(&qio_channel_socket_info);
-}
 
-type_init(qio_channel_socket_register_types);
diff --git a/io/channel-tls.c b/io/channel-tls.c
index 7ec8ceff2f..4c330ae540 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -423,10 +423,6 @@ static const TypeInfo qio_channel_tls_info = {
     .instance_finalize = qio_channel_tls_finalize,
     .class_init = qio_channel_tls_class_init,
 };
+TYPE_INFO(qio_channel_tls_info)
 
-static void qio_channel_tls_register_types(void)
-{
-    type_register_static(&qio_channel_tls_info);
-}
 
-type_init(qio_channel_tls_register_types);
diff --git a/io/channel-websock.c b/io/channel-websock.c
index 47a0e941d9..4b6ee3ddb8 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -1332,10 +1332,6 @@ static const TypeInfo qio_channel_websock_info = {
     .instance_finalize = qio_channel_websock_finalize,
     .class_init = qio_channel_websock_class_init,
 };
+TYPE_INFO(qio_channel_websock_info)
 
-static void qio_channel_websock_register_types(void)
-{
-    type_register_static(&qio_channel_websock_info);
-}
 
-type_init(qio_channel_websock_register_types);
diff --git a/io/channel.c b/io/channel.c
index e4376eb0bc..236fa1e343 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -539,12 +539,8 @@ static const TypeInfo qio_channel_info = {
     .abstract = true,
     .class_size = sizeof(QIOChannelClass),
 };
+TYPE_INFO(qio_channel_info)
 
 
-static void qio_channel_register_types(void)
-{
-    type_register_static(&qio_channel_info);
-}
 
 
-type_init(qio_channel_register_types);
diff --git a/io/dns-resolver.c b/io/dns-resolver.c
index 6ebe2a5650..2c79ea8949 100644
--- a/io/dns-resolver.c
+++ b/io/dns-resolver.c
@@ -269,12 +269,8 @@ static const TypeInfo qio_dns_resolver_info = {
     .instance_size = sizeof(QIODNSResolver),
     .class_size = sizeof(QIODNSResolverClass),
 };
+TYPE_INFO(qio_dns_resolver_info)
 
 
-static void qio_dns_resolver_register_types(void)
-{
-    type_register_static(&qio_dns_resolver_info);
-}
 
 
-type_init(qio_dns_resolver_register_types);
diff --git a/io/net-listener.c b/io/net-listener.c
index 5d8a226872..7b06b60ff0 100644
--- a/io/net-listener.c
+++ b/io/net-listener.c
@@ -309,12 +309,8 @@ static const TypeInfo qio_net_listener_info = {
     .instance_finalize = qio_net_listener_finalize,
     .class_size = sizeof(QIONetListenerClass),
 };
+TYPE_INFO(qio_net_listener_info)
 
 
-static void qio_net_listener_register_types(void)
-{
-    type_register_static(&qio_net_listener_info);
-}
 
 
-type_init(qio_net_listener_register_types);
diff --git a/iothread.c b/iothread.c
index 263ec6e5bc..c94d139e16 100644
--- a/iothread.c
+++ b/iothread.c
@@ -292,13 +292,9 @@ static const TypeInfo iothread_info = {
         {}
     },
 };
+TYPE_INFO(iothread_info)
 
-static void iothread_register_types(void)
-{
-    type_register_static(&iothread_info);
-}
 
-type_init(iothread_register_types)
 
 char *iothread_get_id(IOThread *iothread)
 {
diff --git a/migration/migration.c b/migration/migration.c
index dbd4afa1e8..561e2ae697 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3844,10 +3844,6 @@ static const TypeInfo migration_type = {
     .instance_init = migration_instance_init,
     .instance_finalize = migration_instance_finalize,
 };
+TYPE_INFO(migration_type)
 
-static void register_migration_types(void)
-{
-    type_register_static(&migration_type);
-}
 
-type_init(register_migration_types);
diff --git a/migration/rdma.c b/migration/rdma.c
index bea6532813..15ad985d26 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3942,13 +3942,9 @@ static const TypeInfo qio_channel_rdma_info = {
     .instance_finalize = qio_channel_rdma_finalize,
     .class_init = qio_channel_rdma_class_init,
 };
+TYPE_INFO(qio_channel_rdma_info)
 
-static void qio_channel_rdma_register_types(void)
-{
-    type_register_static(&qio_channel_rdma_info);
-}
 
-type_init(qio_channel_rdma_register_types);
 
 static QEMUFile *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
 {
diff --git a/net/can/can_core.c b/net/can/can_core.c
index 90f4d8576a..9e7228cb9d 100644
--- a/net/can/can_core.c
+++ b/net/can/can_core.c
@@ -131,10 +131,6 @@ static const TypeInfo can_bus_info = {
         { }
     }
 };
+TYPE_INFO(can_bus_info)
 
-static void can_bus_register_types(void)
-{
-    type_register_static(&can_bus_info);
-}
 
-type_init(can_bus_register_types);
diff --git a/net/can/can_host.c b/net/can/can_host.c
index be4547d913..8b57a40de6 100644
--- a/net/can/can_host.c
+++ b/net/can/can_host.c
@@ -104,10 +104,6 @@ static const TypeInfo can_host_info = {
         { }
     }
 };
+TYPE_INFO(can_host_info)
 
-static void can_host_register_types(void)
-{
-    type_register_static(&can_host_info);
-}
 
-type_init(can_host_register_types);
diff --git a/net/can/can_socketcan.c b/net/can/can_socketcan.c
index b7ef63ec0e..c083e92735 100644
--- a/net/can/can_socketcan.c
+++ b/net/can/can_socketcan.c
@@ -278,10 +278,6 @@ static const TypeInfo can_host_socketcan_info = {
     .instance_init = can_host_socketcan_instance_init,
     .class_init = can_host_socketcan_class_init,
 };
+TYPE_INFO(can_host_socketcan_info)
 
-static void can_host_register_types(void)
-{
-    type_register_static(&can_host_socketcan_info);
-}
 
-type_init(can_host_register_types);
diff --git a/net/colo-compare.c b/net/colo-compare.c
index 2c20de1537..b6f56fc915 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -1495,10 +1495,6 @@ static const TypeInfo colo_compare_info = {
         { }
     }
 };
+TYPE_INFO(colo_compare_info)
 
-static void register_types(void)
-{
-    type_register_static(&colo_compare_info);
-}
 
-type_init(register_types);
diff --git a/net/dump.c b/net/dump.c
index 11a737a4bc..ec9f20bea5 100644
--- a/net/dump.c
+++ b/net/dump.c
@@ -256,10 +256,6 @@ static const TypeInfo filter_dump_info = {
     .instance_finalize = filter_dump_instance_finalize,
     .instance_size = sizeof(NetFilterDumpState),
 };
+TYPE_INFO(filter_dump_info)
 
-static void filter_dump_register_types(void)
-{
-    type_register_static(&filter_dump_info);
-}
 
-type_init(filter_dump_register_types);
diff --git a/net/filter-buffer.c b/net/filter-buffer.c
index dfa211794b..9a6b8132ea 100644
--- a/net/filter-buffer.c
+++ b/net/filter-buffer.c
@@ -197,10 +197,6 @@ static const TypeInfo filter_buffer_info = {
     .instance_init = filter_buffer_init,
     .instance_size = sizeof(FilterBufferState),
 };
+TYPE_INFO(filter_buffer_info)
 
-static void register_types(void)
-{
-    type_register_static(&filter_buffer_info);
-}
 
-type_init(register_types);
diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index e9379ce248..09cb97332d 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -438,6 +438,7 @@ static const TypeInfo filter_redirector_info = {
     .instance_finalize = filter_redirector_fini,
     .instance_size = sizeof(MirrorState),
 };
+TYPE_INFO(filter_redirector_info)
 
 static const TypeInfo filter_mirror_info = {
     .name = TYPE_FILTER_MIRROR,
@@ -447,11 +448,6 @@ static const TypeInfo filter_mirror_info = {
     .instance_finalize = filter_mirror_fini,
     .instance_size = sizeof(MirrorState),
 };
+TYPE_INFO(filter_mirror_info)
 
-static void register_types(void)
-{
-    type_register_static(&filter_mirror_info);
-    type_register_static(&filter_redirector_info);
-}
 
-type_init(register_types);
diff --git a/net/filter-replay.c b/net/filter-replay.c
index 9dda193928..9f95ee305b 100644
--- a/net/filter-replay.c
+++ b/net/filter-replay.c
@@ -82,10 +82,6 @@ static const TypeInfo filter_replay_info = {
     .instance_finalize = filter_replay_instance_finalize,
     .instance_size = sizeof(NetFilterReplayState),
 };
+TYPE_INFO(filter_replay_info)
 
-static void filter_replay_register_types(void)
-{
-    type_register_static(&filter_replay_info);
-}
 
-type_init(filter_replay_register_types);
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index 1aaad101b6..891fa95264 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -433,10 +433,6 @@ static const TypeInfo colo_rewriter_info = {
     .instance_init = filter_rewriter_init,
     .instance_size = sizeof(RewriterState),
 };
+TYPE_INFO(colo_rewriter_info)
 
-static void register_types(void)
-{
-    type_register_static(&colo_rewriter_info);
-}
 
-type_init(register_types);
diff --git a/net/filter.c b/net/filter.c
index eac8ba1e9c..8dd47bead0 100644
--- a/net/filter.c
+++ b/net/filter.c
@@ -368,10 +368,6 @@ static const TypeInfo netfilter_info = {
         { }
     }
 };
+TYPE_INFO(netfilter_info)
 
-static void register_types(void)
-{
-    type_register_static(&netfilter_info);
-}
 
-type_init(register_types);
diff --git a/qom/container.c b/qom/container.c
index 455e8410c6..4c0f5fcce3 100644
--- a/qom/container.c
+++ b/qom/container.c
@@ -18,11 +18,8 @@ static const TypeInfo container_info = {
     .name          = "container",
     .parent        = TYPE_OBJECT,
 };
+TYPE_INFO(container_info)
 
-static void container_register_types(void)
-{
-    type_register_static(&container_info);
-}
 
 Object *container_get(Object *root, const char *path)
 {
@@ -49,4 +46,3 @@ Object *container_get(Object *root, const char *path)
 }
 
 
-type_init(container_register_types)
diff --git a/scsi/pr-manager-helper.c b/scsi/pr-manager-helper.c
index 5acccfb4e3..466f11f4c8 100644
--- a/scsi/pr-manager-helper.c
+++ b/scsi/pr-manager-helper.c
@@ -320,10 +320,6 @@ static const TypeInfo pr_manager_helper_info = {
     .instance_finalize = pr_manager_helper_instance_finalize,
     .class_init = pr_manager_helper_class_init,
 };
+TYPE_INFO(pr_manager_helper_info)
 
-static void pr_manager_helper_register_types(void)
-{
-    type_register_static(&pr_manager_helper_info);
-}
 
-type_init(pr_manager_helper_register_types);
diff --git a/scsi/pr-manager.c b/scsi/pr-manager.c
index 32b9287e68..f95f658b1c 100644
--- a/scsi/pr-manager.c
+++ b/scsi/pr-manager.c
@@ -83,6 +83,7 @@ static const TypeInfo pr_manager_info = {
         { }
     }
 };
+TYPE_INFO(pr_manager_info)
 
 PRManager *pr_manager_lookup(const char *id, Error **errp)
 {
@@ -108,11 +109,6 @@ PRManager *pr_manager_lookup(const char *id, Error **errp)
     return pr_mgr;
 }
 
-static void
-pr_manager_register_types(void)
-{
-    type_register_static(&pr_manager_info);
-}
 
 static int query_one_pr_manager(Object *object, void *opaque)
 {
@@ -148,4 +144,3 @@ PRManagerInfoList *qmp_query_pr_managers(Error **errp)
     return head;
 }
 
-type_init(pr_manager_register_types);
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 70b93104e8..48d7c668c9 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3231,6 +3231,7 @@ static const TypeInfo memory_region_info = {
     .instance_init      = memory_region_initfn,
     .instance_finalize  = memory_region_finalize,
 };
+TYPE_INFO(memory_region_info)
 
 static const TypeInfo iommu_memory_region_info = {
     .parent             = TYPE_MEMORY_REGION,
@@ -3240,11 +3241,6 @@ static const TypeInfo iommu_memory_region_info = {
     .instance_init      = iommu_memory_region_initfn,
     .abstract           = true,
 };
+TYPE_INFO(iommu_memory_region_info)
 
-static void memory_register_types(void)
-{
-    type_register_static(&memory_region_info);
-    type_register_static(&iommu_memory_region_info);
-}
 
-type_init(memory_register_types)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6b382fcd60..2a6c21af20 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2319,18 +2319,19 @@ static const TypeInfo arm_cpu_type_info = {
     .class_size = sizeof(ARMCPUClass),
     .class_init = arm_cpu_class_init,
 };
+TYPE_INFO(arm_cpu_type_info)
 
 static const TypeInfo idau_interface_type_info = {
     .name = TYPE_IDAU_INTERFACE,
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(IDAUInterfaceClass),
 };
+TYPE_INFO(idau_interface_type_info)
 
 static void arm_cpu_register_types(void)
 {
     const size_t cpu_count = ARRAY_SIZE(arm_cpus);
 
-    type_register_static(&arm_cpu_type_info);
 
 #ifdef CONFIG_KVM
     type_register_static(&host_arm_cpu_type_info);
@@ -2339,7 +2340,6 @@ static void arm_cpu_register_types(void)
     if (cpu_count) {
         size_t i;
 
-        type_register_static(&idau_interface_type_info);
         for (i = 0; i < cpu_count; ++i) {
             arm_cpu_register(&arm_cpus[i]);
         }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index dd696183df..33a2fa6125 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -831,12 +831,12 @@ static const TypeInfo aarch64_cpu_type_info = {
     .class_size = sizeof(AArch64CPUClass),
     .class_init = aarch64_cpu_class_init,
 };
+TYPE_INFO(aarch64_cpu_type_info)
 
 static void aarch64_cpu_register_types(void)
 {
     size_t i;
 
-    type_register_static(&aarch64_cpu_type_info);
 
     for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
         aarch64_cpu_register(&aarch64_cpus[i]);
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 71b6aca45d..c04b9c814d 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -167,10 +167,6 @@ static const TypeInfo hppa_cpu_type_info = {
     .class_size = sizeof(HPPACPUClass),
     .class_init = hppa_cpu_class_init,
 };
+TYPE_INFO(hppa_cpu_type_info)
 
-static void hppa_cpu_register_types(void)
-{
-    type_register_static(&hppa_cpu_type_info);
-}
 
-type_init(hppa_cpu_register_types)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 588f32e136..ce20b0dff0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4335,6 +4335,7 @@ static const TypeInfo max_x86_cpu_type_info = {
     .instance_init = max_x86_cpu_initfn,
     .class_init = max_x86_cpu_class_init,
 };
+TYPE_INFO(max_x86_cpu_type_info)
 
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
 static void host_x86_cpu_class_init(ObjectClass *oc, void *data)
@@ -4358,6 +4359,7 @@ static const TypeInfo host_x86_cpu_type_info = {
     .parent = X86_CPU_TYPE_NAME("max"),
     .class_init = host_x86_cpu_class_init,
 };
+TYPE_INFO(host_x86_cpu_type_info)
 
 #endif
 
@@ -7349,6 +7351,7 @@ static const TypeInfo x86_cpu_type_info = {
     .class_size = sizeof(X86CPUClass),
     .class_init = x86_cpu_common_class_init,
 };
+TYPE_INFO(x86_cpu_type_info)
 
 
 /* "base" CPU model, used by query-cpu-model-expansion */
@@ -7367,19 +7370,16 @@ static const TypeInfo x86_base_cpu_type_info = {
         .parent = TYPE_X86_CPU,
         .class_init = x86_cpu_base_class_init,
 };
+TYPE_INFO(x86_base_cpu_type_info)
 
 static void x86_cpu_register_types(void)
 {
     int i;
 
-    type_register_static(&x86_cpu_type_info);
     for (i = 0; i < ARRAY_SIZE(builtin_x86_defs); i++) {
         x86_register_cpudef_types(&builtin_x86_defs[i]);
     }
-    type_register_static(&max_x86_cpu_type_info);
-    type_register_static(&x86_base_cpu_type_info);
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-    type_register_static(&host_x86_cpu_type_info);
 #endif
 }
 
diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index c93bb23a44..377dfbf523 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -1141,10 +1141,6 @@ static const TypeInfo hax_accel_type = {
     .parent = TYPE_ACCEL,
     .class_init = hax_accel_class_init,
 };
+TYPE_INFO(hax_accel_type)
 
-static void hax_type_init(void)
-{
-    type_register_static(&hax_accel_type);
-}
 
-type_init(hax_type_init);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index d81f569aed..b82253e1d3 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -910,10 +910,6 @@ static const TypeInfo hvf_accel_type = {
     .parent = TYPE_ACCEL,
     .class_init = hvf_accel_class_init,
 };
+TYPE_INFO(hvf_accel_type)
 
-static void hvf_type_init(void)
-{
-    type_register_static(&hvf_accel_type);
-}
 
-type_init(hvf_type_init);
diff --git a/target/i386/sev.c b/target/i386/sev.c
index c3ecf86704..404762b68f 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -332,6 +332,7 @@ static const TypeInfo sev_guest_info = {
         { }
     }
 };
+TYPE_INFO(sev_guest_info)
 
 static SevGuestState *
 lookup_sev_guest_info(const char *id)
@@ -785,10 +786,4 @@ sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len)
     return 0;
 }
 
-static void
-sev_register_types(void)
-{
-    type_register_static(&sev_guest_info);
-}
 
-type_init(sev_register_types);
diff --git a/target/i386/whpx-all.c b/target/i386/whpx-all.c
index c78baac6df..64d8903e99 100644
--- a/target/i386/whpx-all.c
+++ b/target/i386/whpx-all.c
@@ -1608,11 +1608,8 @@ static const TypeInfo whpx_accel_type = {
     .parent = TYPE_ACCEL,
     .class_init = whpx_accel_class_init,
 };
+TYPE_INFO(whpx_accel_type)
 
-static void whpx_type_init(void)
-{
-    type_register_static(&whpx_accel_type);
-}
 
 bool init_whp_dispatch(void)
 {
@@ -1645,4 +1642,3 @@ error:
     return false;
 }
 
-type_init(whpx_type_init);
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 51e5c85b10..4e62a7cbcd 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -343,10 +343,6 @@ static const TypeInfo mb_cpu_type_info = {
     .class_size = sizeof(MicroBlazeCPUClass),
     .class_init = mb_cpu_class_init,
 };
+TYPE_INFO(mb_cpu_type_info)
 
-static void mb_cpu_register_types(void)
-{
-    type_register_static(&mb_cpu_type_info);
-}
 
-type_init(mb_cpu_register_types)
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index e86cd06548..b4482a8594 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -225,6 +225,7 @@ static const TypeInfo mips_cpu_type_info = {
     .class_size = sizeof(MIPSCPUClass),
     .class_init = mips_cpu_class_init,
 };
+TYPE_INFO(mips_cpu_type_info)
 
 static void mips_cpu_cpudef_class_init(ObjectClass *oc, void *data)
 {
@@ -250,7 +251,6 @@ static void mips_cpu_register_types(void)
 {
     int i;
 
-    type_register_static(&mips_cpu_type_info);
     for (i = 0; i < mips_defs_number; i++) {
         mips_register_cpudef_type(&mips_defs[i]);
     }
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 8f7011fcb9..2b9385ee84 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -216,10 +216,6 @@ static const TypeInfo nios2_cpu_type_info = {
     .class_size = sizeof(Nios2CPUClass),
     .class_init = nios2_cpu_class_init,
 };
+TYPE_INFO(nios2_cpu_type_info)
 
-static void nios2_cpu_register_types(void)
-{
-    type_register_static(&nios2_cpu_type_info);
-}
 
-type_init(nios2_cpu_register_types)
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 23ee17a701..455c528da0 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -210,16 +210,12 @@ static const TypeInfo rx_cpu_info = {
     .class_size = sizeof(RXCPUClass),
     .class_init = rx_cpu_class_init,
 };
+TYPE_INFO(rx_cpu_info)
 
 static const TypeInfo rx62n_rx_cpu_info = {
     .name = TYPE_RX62N_CPU,
     .parent = TYPE_RX_CPU,
 };
+TYPE_INFO(rx62n_rx_cpu_info)
 
-static void rx_cpu_register_types(void)
-{
-    type_register_static(&rx_cpu_info);
-    type_register_static(&rx62n_rx_cpu_info);
-}
 
-type_init(rx_cpu_register_types)
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 08eb674d22..bb48c652fa 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -523,10 +523,6 @@ static const TypeInfo s390_cpu_type_info = {
     .class_size = sizeof(S390CPUClass),
     .class_init = s390_cpu_class_init,
 };
+TYPE_INFO(s390_cpu_type_info)
 
-static void s390_cpu_register_types(void)
-{
-    type_register_static(&s390_cpu_type_info);
-}
 
-type_init(s390_cpu_register_types)
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index c2af226174..46aaad1f7e 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -1305,6 +1305,7 @@ static const TypeInfo qemu_s390_cpu_type_info = {
     .instance_finalize = s390_cpu_model_finalize,
     .class_init = s390_qemu_cpu_model_class_init,
 };
+TYPE_INFO(qemu_s390_cpu_type_info)
 
 static const TypeInfo max_s390_cpu_type_info = {
     .name = S390_CPU_TYPE_NAME("max"),
@@ -1313,6 +1314,7 @@ static const TypeInfo max_s390_cpu_type_info = {
     .instance_finalize = s390_cpu_model_finalize,
     .class_init = s390_max_cpu_model_class_init,
 };
+TYPE_INFO(max_s390_cpu_type_info)
 
 #ifdef CONFIG_KVM
 static const TypeInfo host_s390_cpu_type_info = {
@@ -1320,6 +1322,7 @@ static const TypeInfo host_s390_cpu_type_info = {
     .parent = S390_CPU_TYPE_NAME("max"),
     .class_init = s390_host_cpu_model_class_init,
 };
+TYPE_INFO(host_s390_cpu_type_info)
 #endif
 
 static void init_ignored_base_feat(void)
@@ -1395,10 +1398,7 @@ static void register_types(void)
         g_free(name);
     }
 
-    type_register_static(&qemu_s390_cpu_type_info);
-    type_register_static(&max_s390_cpu_type_info);
 #ifdef CONFIG_KVM
-    type_register_static(&host_s390_cpu_type_info);
 #endif
 }
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index cf21efd85f..aed0cafb13 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -897,6 +897,7 @@ static const TypeInfo sparc_cpu_type_info = {
     .class_size = sizeof(SPARCCPUClass),
     .class_init = sparc_cpu_class_init,
 };
+TYPE_INFO(sparc_cpu_type_info)
 
 static void sparc_cpu_cpudef_class_init(ObjectClass *oc, void *data)
 {
@@ -922,7 +923,6 @@ static void sparc_cpu_register_types(void)
 {
     int i;
 
-    type_register_static(&sparc_cpu_type_info);
     for (i = 0; i < ARRAY_SIZE(sparc_defs); i++) {
         sparc_register_cpudef_type(&sparc_defs[i]);
     }
diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
index 1fee87c094..93070229de 100644
--- a/target/tilegx/cpu.c
+++ b/target/tilegx/cpu.c
@@ -164,10 +164,6 @@ static const TypeInfo tilegx_cpu_type_info = {
     .class_size = sizeof(TileGXCPUClass),
     .class_init = tilegx_cpu_class_init,
 };
+TYPE_INFO(tilegx_cpu_type_info)
 
-static void tilegx_cpu_register_types(void)
-{
-    type_register_static(&tilegx_cpu_type_info);
-}
 
-type_init(tilegx_cpu_register_types)
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 82c2ee0679..666b8050f7 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -216,10 +216,6 @@ static const TypeInfo xtensa_cpu_type_info = {
     .class_size = sizeof(XtensaCPUClass),
     .class_init = xtensa_cpu_class_init,
 };
+TYPE_INFO(xtensa_cpu_type_info)
 
-static void xtensa_cpu_register_types(void)
-{
-    type_register_static(&xtensa_cpu_type_info);
-}
 
-type_init(xtensa_cpu_register_types)
diff --git a/ui/console.c b/ui/console.c
index 0579be792f..ae54bf6c1a 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2388,6 +2388,7 @@ static const TypeInfo qemu_console_info = {
     .instance_size = sizeof(QemuConsole),
     .class_size = sizeof(QemuConsoleClass),
 };
+TYPE_INFO(qemu_console_info)
 
 static void char_vc_class_init(ObjectClass *oc, void *data)
 {
@@ -2414,9 +2415,4 @@ void qemu_console_early_init(void)
     }
 }
 
-static void register_types(void)
-{
-    type_register_static(&qemu_console_info);
-}
 
-type_init(register_types);
diff --git a/ui/input-barrier.c b/ui/input-barrier.c
index 1cdf0c5f82..2082f5dd1e 100644
--- a/ui/input-barrier.c
+++ b/ui/input-barrier.c
@@ -741,10 +741,6 @@ static const TypeInfo input_barrier_info = {
         { }
     }
 };
+TYPE_INFO(input_barrier_info)
 
-static void register_types(void)
-{
-    type_register_static(&input_barrier_info);
-}
 
-type_init(register_types);
diff --git a/ui/input-linux.c b/ui/input-linux.c
index 4925ce1af1..3709800898 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -532,10 +532,6 @@ static const TypeInfo input_linux_info = {
         { }
     }
 };
+TYPE_INFO(input_linux_info)
 
-static void register_types(void)
-{
-    type_register_static(&input_linux_info);
-}
 
-type_init(register_types);
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 230a062d29..2be75cb593 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10966,6 +10966,7 @@ static const TypeInfo ppc_cpu_type_info = {
     .class_size = sizeof(PowerPCCPUClass),
     .class_init = ppc_cpu_class_init,
 };
+TYPE_INFO(ppc_cpu_type_info)
 
 #ifndef CONFIG_USER_ONLY
 static const TypeInfo ppc_vhyp_type_info = {
@@ -10973,13 +10974,12 @@ static const TypeInfo ppc_vhyp_type_info = {
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(PPCVirtualHypervisorClass),
 };
+TYPE_INFO(ppc_vhyp_type_info)
 #endif
 
 static void ppc_cpu_register_types(void)
 {
-    type_register_static(&ppc_cpu_type_info);
 #ifndef CONFIG_USER_ONLY
-    type_register_static(&ppc_vhyp_type_info);
 #endif
 }
 
-- 
2.26.2


