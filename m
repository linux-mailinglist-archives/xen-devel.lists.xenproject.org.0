Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E904A5BD813
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 01:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409015.651855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ1s-0004PB-0c; Mon, 19 Sep 2022 23:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409015.651855; Mon, 19 Sep 2022 23:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ1r-0004MI-TT; Mon, 19 Sep 2022 23:18:19 +0000
Received: by outflank-mailman (input) for mailman id 409015;
 Mon, 19 Sep 2022 23:18:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WN4B=ZW=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1oaQ1q-0004MC-Fu
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 23:18:18 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57b145ae-3871-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 01:18:17 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id y3so2237647ejc.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 16:18:17 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
 by smtp.gmail.com with ESMTPSA id
 rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 16:18:16 -0700 (PDT)
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
X-Inumbo-ID: 57b145ae-3871-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=/k4I9yFOQcmiC4x/pIxNVj/VFsZVkB/VTnKtzXV6Nqg=;
        b=HeU8zrtYBI/0x6nYhy30ykBOxV7FJFi9qix+CVX0GQ295jAdVYP99cwpVxn/2LzxCi
         ZP5HRKIK6CCkoV8ZYaMeoxr7Er2J7tkGFzoZESbBQa3Q/GPx3mVwKz2IoZNjt/UK7KTA
         +ihVNLs1B8kQsrWVCKS154FLqcTZ7LjxhE5wx61z1x9ykd/cnWa6+EObscXByUSrlnxu
         2p8uLD9vwG4GAwVM6hnJqUMiO5KALvwOqjrkAiOSaB7w+Ho12rSGreEd514XIyflj9qP
         8m6Uxp0tRrmxmCRjrG0e2Upp6UcGEKsXugZH9piZvYjMOtG1eklpjW88WsouvJFJCC5o
         ldSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=/k4I9yFOQcmiC4x/pIxNVj/VFsZVkB/VTnKtzXV6Nqg=;
        b=ryBU0CoayWhSaLUw5WJpGqofPokfVu2Sy5wCtM3gRttTnWrTV9cD3K1tXgz8RK2qPh
         3riV3ejTavhgBwPkfJfSRitKnsx+t+cCvawqi/M02zrkJbYd8+l9XQUfFp9AeyY5FWiw
         j611Cu7r/YraOPCorAE8FPcAwMpMtYNlbjeP9n/KFe51r3vcrEhr31zqM2ZSjnA1NfMb
         r+MhM6eNrWywwTcJTAFjf8m9ugut6AyR0ahCOhqB2Orpqq5yKyCA+fFauHxcMDmp1zPV
         CNF1mdkdrRv5ysuldAPkHbWNrZtPKQbe1euhEvwC8/ondlebk6KBofXilUG/3soRd0sE
         CL3g==
X-Gm-Message-State: ACrzQf2AHC6lC8es4aH+9v9d0Fnd/pdqwHzqYXoX+GAqQPt9NYpBKT0r
	0ABaujDSbi/C8OcnrA0J2rI=
X-Google-Smtp-Source: AMsMyM6qssf98dEArMM6jpNsUS/ykm1rQJXRhzB+Z5C5spX4oNAkXfl0aR9MWbXenJhowWfNIt1+Yg==
X-Received: by 2002:a17:907:2c62:b0:77a:e3ce:5ef0 with SMTP id ib2-20020a1709072c6200b0077ae3ce5ef0mr15170276ejc.553.1663629496806;
        Mon, 19 Sep 2022 16:18:16 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Bandan Das <bsd@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Sergio Lopez <slp@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Cameron Esfahani <dirty@apple.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Greg Kurz <groug@kaod.org>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Peter Xu <peterx@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	haxm-team@intel.com,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Helge Deller <deller@gmx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-riscv@nongnu.org,
	Stafford Horne <shorne@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Havard Skinnemoen <hskinnemoen@google.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Alexander Graf <agraf@csgraf.de>,
	Thomas Huth <thuth@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eric Farman <farman@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Alexander Bulekov <alxndr@bu.edu>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	xen-devel@lists.xenproject.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	John Snow <jsnow@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	kvm@vger.kernel.org,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Bin Meng <bin.meng@windriver.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Jason Wang <jasowang@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alistair Francis <alistair@alistair23.me>,
	Jason Herne <jjherne@linux.ibm.com>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/9] Deprecate sysbus_get_default() and get_system_memory() et. al
Date: Tue, 20 Sep 2022 01:17:11 +0200
Message-Id: <20220919231720.163121-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In address-spaces.h it can be read that get_system_memory() and=0D
get_system_io() are temporary interfaces which "should only be used tempora=
rily=0D
until a proper bus interface is available". This statement certainly extend=
s to=0D
the address_space_memory and address_space_io singletons. This series attem=
pts=0D
to stop further proliferation of their use by turning TYPE_SYSTEM_BUS into =
an=0D
object-oriented, "proper bus interface" inspired by PCIBus.=0D
=0D
While at it, also the main_system_bus singleton is turned into an attribute=
 of=0D
MachineState. Together, this resolves five singletons in total, making the=
=0D
ownership relations much more obvious which helps comprehension.=0D
=0D
The series is structured as follows: Patch 1 fixes a memory corruption issu=
e=0D
uncovered by running `make check` on the last but one patch of this series.=
=0D
Patches 2 and 3 turn the main_system_bus singleton into an attribute of=0D
MachineState which provides an alternative to sysbus_get_default(). Patches=
 4-7=0D
resolve the address space singletons and deprecate the legacy=0D
get_system_memory() et. al functions. Patch 8 attempts to optimize the new=
=0D
implementations of these legacy functions.=0D
=0D
Testing done:=0D
* make check (passes without any issues)=0D
* make check-avocado (no new issues seem to be introduced compared to maste=
r)=0D
=0D
Bernhard Beschow (9):=0D
  hw/riscv/sifive_e: Fix inheritance of SiFiveEState=0D
  exec/hwaddr.h: Add missing include=0D
  hw/core/sysbus: Resolve main_system_bus singleton=0D
  hw/ppc/spapr: Fix code style problems reported by checkpatch=0D
  exec/address-spaces: Wrap address space singletons into functions=0D
  target/loongarch/cpu: Remove unneeded include directive=0D
  hw/sysbus: Introduce dedicated struct SysBusState for TYPE_SYSTEM_BUS=0D
  softmmu/physmem: Let SysBusState absorb memory region and address=0D
    space singletons=0D
  exec/address-spaces: Inline legacy functions=0D
=0D
 accel/hvf/hvf-accel-ops.c            |  2 +-=0D
 accel/kvm/kvm-all.c                  | 12 +++----=0D
 hw/alpha/dp264.c                     |  4 +--=0D
 hw/alpha/typhoon.c                   |  4 +--=0D
 hw/arm/smmu-common.c                 |  4 +--=0D
 hw/arm/smmuv3.c                      | 14 ++++----=0D
 hw/arm/virt.c                        |  2 +-=0D
 hw/char/goldfish_tty.c               |  4 +--=0D
 hw/core/bus.c                        |  5 ++-=0D
 hw/core/loader.c                     |  2 +-=0D
 hw/core/machine.c                    |  3 ++=0D
 hw/core/sysbus.c                     | 24 ++++----------=0D
 hw/dma/pl330.c                       |  2 +-=0D
 hw/dma/rc4030.c                      |  2 +-=0D
 hw/dma/xlnx-zynq-devcfg.c            |  4 +--=0D
 hw/dma/xlnx_dpdma.c                  |  8 ++---=0D
 hw/hppa/machine.c                    |  4 +--=0D
 hw/hyperv/hyperv.c                   |  2 +-=0D
 hw/hyperv/vmbus.c                    |  2 +-=0D
 hw/i386/amd_iommu.c                  | 18 +++++-----=0D
 hw/i386/fw_cfg.c                     |  2 +-=0D
 hw/i386/intel_iommu.c                | 24 +++++++-------=0D
 hw/i386/microvm.c                    |  4 +--=0D
 hw/i386/pc.c                         |  2 +-=0D
 hw/i386/xen/xen-hvm.c                |  4 +--=0D
 hw/ide/ahci.c                        |  2 +-=0D
 hw/ide/macio.c                       | 10 +++---=0D
 hw/intc/apic.c                       |  2 +-=0D
 hw/intc/openpic_kvm.c                |  2 +-=0D
 hw/intc/pnv_xive.c                   |  6 ++--=0D
 hw/intc/pnv_xive2.c                  |  6 ++--=0D
 hw/intc/riscv_aplic.c                |  2 +-=0D
 hw/intc/spapr_xive.c                 |  2 +-=0D
 hw/intc/xive.c                       |  4 +--=0D
 hw/intc/xive2.c                      |  4 +--=0D
 hw/mips/jazz.c                       |  4 +--=0D
 hw/misc/lasi.c                       |  2 +-=0D
 hw/misc/macio/mac_dbdma.c            |  8 ++---=0D
 hw/net/ftgmac100.c                   | 16 ++++-----=0D
 hw/net/i82596.c                      | 24 +++++++-------=0D
 hw/net/imx_fec.c                     | 22 ++++++-------=0D
 hw/net/lasi_i82596.c                 |  2 +-=0D
 hw/net/npcm7xx_emc.c                 | 14 ++++----=0D
 hw/openrisc/boot.c                   |  2 +-=0D
 hw/pci-host/dino.c                   |  6 ++--=0D
 hw/pci-host/pnv_phb3.c               |  6 ++--=0D
 hw/pci-host/pnv_phb3_msi.c           |  6 ++--=0D
 hw/pci-host/pnv_phb4.c               | 10 +++---=0D
 hw/pci/pci.c                         |  2 +-=0D
 hw/ppc/pnv_psi.c                     |  2 +-=0D
 hw/ppc/spapr.c                       |  4 +--=0D
 hw/ppc/spapr_events.c                |  2 +-=0D
 hw/ppc/spapr_hcall.c                 |  4 +--=0D
 hw/ppc/spapr_iommu.c                 |  4 +--=0D
 hw/ppc/spapr_ovec.c                  |  8 ++---=0D
 hw/ppc/spapr_rtas.c                  |  2 +-=0D
 hw/remote/iommu.c                    |  2 +-=0D
 hw/remote/message.c                  |  4 +--=0D
 hw/remote/proxy-memory-listener.c    |  2 +-=0D
 hw/riscv/boot.c                      |  6 ++--=0D
 hw/riscv/sifive_e.c                  |  2 +-=0D
 hw/riscv/sifive_u.c                  |  2 +-=0D
 hw/riscv/virt.c                      |  2 +-=0D
 hw/s390x/css.c                       | 16 ++++-----=0D
 hw/s390x/ipl.h                       |  2 +-=0D
 hw/s390x/s390-pci-bus.c              |  4 +--=0D
 hw/s390x/s390-pci-inst.c             | 10 +++---=0D
 hw/s390x/s390-skeys.c                |  2 +-=0D
 hw/s390x/virtio-ccw.c                | 10 +++---=0D
 hw/sd/sdhci.c                        |  2 +-=0D
 hw/sh4/r2d.c                         |  4 +--=0D
 hw/sparc/sun4m.c                     |  2 +-=0D
 hw/sparc/sun4m_iommu.c               |  4 +--=0D
 hw/sparc64/sun4u_iommu.c             |  4 +--=0D
 hw/timer/hpet.c                      |  2 +-=0D
 hw/usb/hcd-ehci-pci.c                |  2 +-=0D
 hw/usb/hcd-ehci-sysbus.c             |  2 +-=0D
 hw/usb/hcd-ohci.c                    |  2 +-=0D
 hw/usb/hcd-xhci-sysbus.c             |  2 +-=0D
 hw/vfio/ap.c                         |  2 +-=0D
 hw/vfio/ccw.c                        |  2 +-=0D
 hw/vfio/common.c                     |  8 ++---=0D
 hw/vfio/platform.c                   |  2 +-=0D
 hw/virtio/vhost-vdpa.c               |  2 +-=0D
 hw/virtio/vhost.c                    |  2 +-=0D
 hw/virtio/virtio-bus.c               |  4 +--=0D
 hw/virtio/virtio-iommu.c             |  6 ++--=0D
 hw/virtio/virtio-pci.c               |  2 +-=0D
 hw/xen/xen_pt.c                      |  4 +--=0D
 include/exec/address-spaces.h        | 49 +++++++++++++++++++++++-----=0D
 include/exec/hwaddr.h                |  1 +=0D
 include/hw/boards.h                  |  2 ++=0D
 include/hw/elf_ops.h                 |  4 +--=0D
 include/hw/misc/macio/macio.h        |  2 +-=0D
 include/hw/ppc/spapr.h               |  6 ++--=0D
 include/hw/ppc/vof.h                 |  4 +--=0D
 include/hw/riscv/sifive_e.h          |  3 +-=0D
 include/hw/sysbus.h                  | 14 ++++++--=0D
 monitor/misc.c                       |  4 +--=0D
 softmmu/ioport.c                     | 12 +++----=0D
 softmmu/memory_mapping.c             |  2 +-=0D
 softmmu/physmem.c                    | 41 ++++++++---------------=0D
 target/arm/hvf/hvf.c                 |  4 +--=0D
 target/arm/kvm.c                     |  4 +--=0D
 target/avr/helper.c                  |  8 ++---=0D
 target/i386/hax/hax-all.c            |  2 +-=0D
 target/i386/hax/hax-mem.c            |  2 +-=0D
 target/i386/hvf/hvf.c                |  2 +-=0D
 target/i386/hvf/vmx.h                |  2 +-=0D
 target/i386/hvf/x86_mmu.c            |  6 ++--=0D
 target/i386/nvmm/nvmm-all.c          |  4 +--=0D
 target/i386/sev.c                    |  4 +--=0D
 target/i386/tcg/sysemu/misc_helper.c | 12 +++----=0D
 target/i386/whpx/whpx-all.c          |  4 +--=0D
 target/loongarch/cpu.h               |  1 -=0D
 target/s390x/diag.c                  |  2 +-=0D
 target/s390x/mmu_helper.c            |  2 +-=0D
 target/s390x/sigp.c                  |  2 +-=0D
 target/xtensa/dbg_helper.c           |  2 +-=0D
 tests/qtest/fuzz/generic_fuzz.c      |  4 +--=0D
 120 files changed, 355 insertions(+), 328 deletions(-)=0D
=0D
-- =0D
2.37.3=0D
=0D

