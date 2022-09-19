Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B645BD816
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 01:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409027.651910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ2O-0006e8-PK; Mon, 19 Sep 2022 23:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409027.651910; Mon, 19 Sep 2022 23:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ2O-0006ai-Io; Mon, 19 Sep 2022 23:18:52 +0000
Received: by outflank-mailman (input) for mailman id 409027;
 Mon, 19 Sep 2022 23:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WN4B=ZW=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1oaQ2M-0004MC-Ef
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 23:18:51 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69b98dd0-3871-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 01:18:47 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id sb3so2145415ejb.9
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 16:18:47 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
 by smtp.gmail.com with ESMTPSA id
 rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 16:18:46 -0700 (PDT)
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
X-Inumbo-ID: 69b98dd0-3871-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=HNjIuvBWBMHHLOqn5zrB7u7ljJXJuukzmTCa/ZFYEn8=;
        b=V71bgNCssvCAB/XbTauczuwnSjaL+/G4TKNv4iDWFIWJPxr7O9/AhfLHvxzLh9Mqkt
         fvSKUN53lb7jgdhb7HSWfVOKS/lFRNfHffwpej6A5d2iVNs+xZODYJf/RqrTpW+ZZJ9a
         EysGMSfZ/me806xSpju4zQf5DwceuvSsmwmeP83POftTvt/QuFzc2MizSBb4Sc2mhDgo
         C58kEU04vVLXx54hWUB2nFHKNLfnvAxPjK/2rguIYnGUYMhyRPuxlIe4hXDK7SDrzBel
         MyY87hnOjuTcamNCavVtRDgYBRJE51+ngd0TxJZ9vnNukwrhSgg4egOEEC8rDlSDNaw9
         Ua1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HNjIuvBWBMHHLOqn5zrB7u7ljJXJuukzmTCa/ZFYEn8=;
        b=QaKW0ll94UFLc9RRMcH4akaRm0XcdKsZNsoNtvg6xusGfubDAcI9jqSLE/sC4JS/en
         zclxXatGO7CF+sBsfJeZb+hbptRQqosBa/r+JKj1cUQ8IJ4XAASX0WqEBXHIRlEsRHFW
         z/SJCrof1wqo8GU8gS62yLTn60nHabJiAyirDhE0sZi3ShXcqFcm5UYfQ6U7x9NYgyGV
         GuxxjzR360a9Oz7P9opdbGpc3SfLHXqqRW8LGtWg2Qtmk9Mas7/MltAp+3tfaD32XzcJ
         eG/ftFr4gOINfwu3PZrX27XI8b231KDZ01jaMIdg802eB/b0JnUD2VQM8d+Nwiflec4X
         /p5g==
X-Gm-Message-State: ACrzQf00WqsyBcRWtcT1KoF0sp/EYV+CIVfWhHXhadMNZb4Sw32qTn6K
	5HCop3yt44V2xPxUEPnkg/I=
X-Google-Smtp-Source: AMsMyM7Wl4N4mGmDplitIMmO6Bj41ZDnFTXlF4w0czobjbTaz9kyJms96EaCzn9CqANbD0Vtcz5G2A==
X-Received: by 2002:a17:907:97d3:b0:780:5b1c:b45e with SMTP id js19-20020a17090797d300b007805b1cb45emr14558699ejc.251.1663629526555;
        Mon, 19 Sep 2022 16:18:46 -0700 (PDT)
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
Subject: [PATCH 5/9] exec/address-spaces: Wrap address space singletons into functions
Date: Tue, 20 Sep 2022 01:17:16 +0200
Message-Id: <20220919231720.163121-6-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919231720.163121-1-shentey@gmail.com>
References: <20220919231720.163121-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the next steps, these singletons will be resolved by turning them
into attributes of the system bus. The system bus is already accessible
via the global current_machine variable which will be made use of later
in the wrapper functions.

All changes have been performed with search-and-replace:
* s/&address_space_memory/get_address_space_memory()/
* s/&address_space_io/get_address_space_io()/
The only exceptions were exec/address-spaces.h and softmmu/physmem.c
which have been manually changed.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 accel/hvf/hvf-accel-ops.c            |  2 +-
 accel/kvm/kvm-all.c                  | 12 ++++++------
 hw/alpha/dp264.c                     |  4 ++--
 hw/alpha/typhoon.c                   |  4 ++--
 hw/arm/smmu-common.c                 |  4 ++--
 hw/arm/smmuv3.c                      | 14 +++++++-------
 hw/arm/virt.c                        |  2 +-
 hw/char/goldfish_tty.c               |  4 ++--
 hw/core/loader.c                     |  2 +-
 hw/dma/pl330.c                       |  2 +-
 hw/dma/rc4030.c                      |  2 +-
 hw/dma/xlnx-zynq-devcfg.c            |  4 ++--
 hw/dma/xlnx_dpdma.c                  |  8 ++++----
 hw/hppa/machine.c                    |  4 ++--
 hw/hyperv/hyperv.c                   |  2 +-
 hw/hyperv/vmbus.c                    |  2 +-
 hw/i386/amd_iommu.c                  | 18 +++++++++---------
 hw/i386/fw_cfg.c                     |  2 +-
 hw/i386/intel_iommu.c                | 24 ++++++++++++------------
 hw/i386/microvm.c                    |  4 ++--
 hw/i386/pc.c                         |  2 +-
 hw/i386/xen/xen-hvm.c                |  4 ++--
 hw/ide/ahci.c                        |  2 +-
 hw/ide/macio.c                       | 10 +++++-----
 hw/intc/apic.c                       |  2 +-
 hw/intc/openpic_kvm.c                |  2 +-
 hw/intc/pnv_xive.c                   |  6 +++---
 hw/intc/pnv_xive2.c                  |  6 +++---
 hw/intc/riscv_aplic.c                |  2 +-
 hw/intc/spapr_xive.c                 |  2 +-
 hw/intc/xive.c                       |  4 ++--
 hw/intc/xive2.c                      |  4 ++--
 hw/mips/jazz.c                       |  4 ++--
 hw/misc/lasi.c                       |  2 +-
 hw/misc/macio/mac_dbdma.c            |  8 ++++----
 hw/net/ftgmac100.c                   | 16 ++++++++--------
 hw/net/i82596.c                      | 24 ++++++++++++------------
 hw/net/imx_fec.c                     | 22 +++++++++++-----------
 hw/net/lasi_i82596.c                 |  2 +-
 hw/net/npcm7xx_emc.c                 | 14 +++++++-------
 hw/openrisc/boot.c                   |  2 +-
 hw/pci-host/dino.c                   |  6 +++---
 hw/pci-host/pnv_phb3.c               |  6 +++---
 hw/pci-host/pnv_phb3_msi.c           |  6 +++---
 hw/pci-host/pnv_phb4.c               | 10 +++++-----
 hw/pci/pci.c                         |  2 +-
 hw/ppc/pnv_psi.c                     |  2 +-
 hw/ppc/spapr.c                       |  4 ++--
 hw/ppc/spapr_events.c                |  2 +-
 hw/ppc/spapr_hcall.c                 |  4 ++--
 hw/ppc/spapr_iommu.c                 |  4 ++--
 hw/ppc/spapr_ovec.c                  |  8 ++++----
 hw/ppc/spapr_rtas.c                  |  2 +-
 hw/remote/iommu.c                    |  2 +-
 hw/remote/message.c                  |  4 ++--
 hw/remote/proxy-memory-listener.c    |  2 +-
 hw/riscv/boot.c                      |  6 +++---
 hw/riscv/sifive_e.c                  |  2 +-
 hw/riscv/sifive_u.c                  |  2 +-
 hw/riscv/virt.c                      |  2 +-
 hw/s390x/css.c                       | 16 ++++++++--------
 hw/s390x/ipl.h                       |  2 +-
 hw/s390x/s390-pci-bus.c              |  4 ++--
 hw/s390x/s390-pci-inst.c             | 10 +++++-----
 hw/s390x/s390-skeys.c                |  2 +-
 hw/s390x/virtio-ccw.c                | 10 +++++-----
 hw/sd/sdhci.c                        |  2 +-
 hw/sh4/r2d.c                         |  4 ++--
 hw/sparc/sun4m.c                     |  2 +-
 hw/sparc/sun4m_iommu.c               |  4 ++--
 hw/sparc64/sun4u_iommu.c             |  4 ++--
 hw/timer/hpet.c                      |  2 +-
 hw/usb/hcd-ehci-pci.c                |  2 +-
 hw/usb/hcd-ehci-sysbus.c             |  2 +-
 hw/usb/hcd-ohci.c                    |  2 +-
 hw/usb/hcd-xhci-sysbus.c             |  2 +-
 hw/vfio/ap.c                         |  2 +-
 hw/vfio/ccw.c                        |  2 +-
 hw/vfio/common.c                     |  8 ++++----
 hw/vfio/platform.c                   |  2 +-
 hw/virtio/vhost-vdpa.c               |  2 +-
 hw/virtio/vhost.c                    |  2 +-
 hw/virtio/virtio-bus.c               |  4 ++--
 hw/virtio/virtio-iommu.c             |  6 +++---
 hw/virtio/virtio-pci.c               |  2 +-
 hw/xen/xen_pt.c                      |  4 ++--
 include/exec/address-spaces.h        |  4 ++--
 include/hw/elf_ops.h                 |  4 ++--
 include/hw/ppc/spapr.h               |  5 +++--
 include/hw/ppc/vof.h                 |  4 ++--
 monitor/misc.c                       |  4 ++--
 softmmu/ioport.c                     | 12 ++++++------
 softmmu/memory_mapping.c             |  2 +-
 softmmu/physmem.c                    | 17 ++++++++++++++---
 target/arm/hvf/hvf.c                 |  4 ++--
 target/arm/kvm.c                     |  4 ++--
 target/avr/helper.c                  |  8 ++++----
 target/i386/hax/hax-all.c            |  2 +-
 target/i386/hax/hax-mem.c            |  2 +-
 target/i386/hvf/hvf.c                |  2 +-
 target/i386/hvf/vmx.h                |  2 +-
 target/i386/hvf/x86_mmu.c            |  6 +++---
 target/i386/nvmm/nvmm-all.c          |  4 ++--
 target/i386/sev.c                    |  4 ++--
 target/i386/tcg/sysemu/misc_helper.c | 12 ++++++------
 target/i386/whpx/whpx-all.c          |  4 ++--
 target/s390x/diag.c                  |  2 +-
 target/s390x/mmu_helper.c            |  2 +-
 target/s390x/sigp.c                  |  2 +-
 target/xtensa/dbg_helper.c           |  2 +-
 tests/qtest/fuzz/generic_fuzz.c      |  4 ++--
 111 files changed, 285 insertions(+), 273 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 24913ca9c4..62317ee005 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -335,7 +335,7 @@ static int hvf_accel_init(MachineState *ms)
     }
 
     hvf_state = s;
-    memory_listener_register(&hvf_memory_listener, &address_space_memory);
+    memory_listener_register(&hvf_memory_listener, get_address_space_memory());
 
     return hvf_arch_init();
 }
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 136c8eaed3..413b5a7fa9 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2639,13 +2639,13 @@ static int kvm_init(MachineState *ms)
     s->memory_listener.listener.coalesced_io_del = kvm_uncoalesce_mmio_region;
 
     kvm_memory_listener_register(s, &s->memory_listener,
-                                 &address_space_memory, 0, "kvm-memory");
+                                 get_address_space_memory(), 0, "kvm-memory");
     if (kvm_eventfds_allowed) {
         memory_listener_register(&kvm_io_listener,
-                                 &address_space_io);
+                                 get_address_space_io());
     }
     memory_listener_register(&kvm_coalesced_pio_listener,
-                             &address_space_io);
+                             get_address_space_io());
 
     s->many_ioeventfds = kvm_check_many_ioeventfds();
 
@@ -2694,7 +2694,7 @@ static void kvm_handle_io(uint16_t port, MemTxAttrs attrs, void *data, int direc
     uint8_t *ptr = data;
 
     for (i = 0; i < count; i++) {
-        address_space_rw(&address_space_io, port, attrs,
+        address_space_rw(get_address_space_io(), port, attrs,
                          ptr, size,
                          direction == KVM_EXIT_IO_OUT);
         ptr += size;
@@ -2745,7 +2745,7 @@ void kvm_flush_coalesced_mmio_buffer(void)
             ent = &ring->coalesced_mmio[ring->first];
 
             if (ent->pio == 1) {
-                address_space_write(&address_space_io, ent->phys_addr,
+                address_space_write(get_address_space_io(), ent->phys_addr,
                                     MEMTXATTRS_UNSPECIFIED, ent->data,
                                     ent->len);
             } else {
@@ -2955,7 +2955,7 @@ int kvm_cpu_exec(CPUState *cpu)
         case KVM_EXIT_MMIO:
             DPRINTF("handle_mmio\n");
             /* Called outside BQL */
-            address_space_rw(&address_space_memory,
+            address_space_rw(get_address_space_memory(),
                              run->mmio.phys_addr, attrs,
                              run->mmio.data,
                              run->mmio.len,
diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index f4349eba83..d55a807650 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -197,11 +197,11 @@ static void clipper_init(MachineState *machine)
             load_image_targphys(initrd_filename, initrd_base,
                                 ram_size - initrd_base);
 
-            address_space_stq(&address_space_memory, param_offset + 0x100,
+            address_space_stq(get_address_space_memory(), param_offset + 0x100,
                               initrd_base + 0xfffffc0000000000ULL,
                               MEMTXATTRS_UNSPECIFIED,
                               NULL);
-            address_space_stq(&address_space_memory, param_offset + 0x108,
+            address_space_stq(get_address_space_memory(), param_offset + 0x108,
                               initrd_size, MEMTXATTRS_UNSPECIFIED, NULL);
         }
     }
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index bd39c8ca86..45bd943f61 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -609,7 +609,7 @@ static const MemoryRegionOps pchip_ops = {
 static bool make_iommu_tlbe(hwaddr taddr, hwaddr mask, IOMMUTLBEntry *ret)
 {
     *ret = (IOMMUTLBEntry) {
-        .target_as = &address_space_memory,
+        .target_as = get_address_space_memory(),
         .translated_addr = taddr,
         .addr_mask = mask,
         .perm = IOMMU_RW,
@@ -621,7 +621,7 @@ static bool make_iommu_tlbe(hwaddr taddr, hwaddr mask, IOMMUTLBEntry *ret)
    translation, given the address of the PTE.  */
 static bool pte_translate(hwaddr pte_addr, IOMMUTLBEntry *ret)
 {
-    uint64_t pte = address_space_ldq(&address_space_memory, pte_addr,
+    uint64_t pte = address_space_ldq(get_address_space_memory(), pte_addr,
                                      MEMTXATTRS_UNSPECIFIED, NULL);
 
     /* Check valid bit.  */
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index e09b9c13b7..22207399a4 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -193,7 +193,7 @@ static int get_pte(dma_addr_t baseaddr, uint32_t index, uint64_t *pte,
     dma_addr_t addr = baseaddr + index * sizeof(*pte);
 
     /* TODO: guarantee 64-bit single-copy atomicity */
-    ret = dma_memory_read(&address_space_memory, addr, pte, sizeof(*pte),
+    ret = dma_memory_read(get_address_space_memory(), addr, pte, sizeof(*pte),
                           MEMTXATTRS_UNSPECIFIED);
 
     if (ret != MEMTX_OK) {
@@ -474,7 +474,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *n)
     IOMMUTLBEvent event;
 
     event.type = IOMMU_NOTIFIER_UNMAP;
-    event.entry.target_as = &address_space_memory;
+    event.entry.target_as = get_address_space_memory();
     event.entry.iova = n->start;
     event.entry.perm = IOMMU_NONE;
     event.entry.addr_mask = n->end - n->start;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index daa80e9c7b..3728aefef2 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -102,7 +102,7 @@ static inline MemTxResult queue_read(SMMUQueue *q, void *data)
 {
     dma_addr_t addr = Q_CONS_ENTRY(q);
 
-    return dma_memory_read(&address_space_memory, addr, data, q->entry_size,
+    return dma_memory_read(get_address_space_memory(), addr, data, q->entry_size,
                            MEMTXATTRS_UNSPECIFIED);
 }
 
@@ -111,7 +111,7 @@ static MemTxResult queue_write(SMMUQueue *q, void *data)
     dma_addr_t addr = Q_PROD_ENTRY(q);
     MemTxResult ret;
 
-    ret = dma_memory_write(&address_space_memory, addr, data, q->entry_size,
+    ret = dma_memory_write(get_address_space_memory(), addr, data, q->entry_size,
                            MEMTXATTRS_UNSPECIFIED);
     if (ret != MEMTX_OK) {
         return ret;
@@ -294,7 +294,7 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
 
     trace_smmuv3_get_ste(addr);
     /* TODO: guarantee 64-bit single-copy atomicity */
-    ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
+    ret = dma_memory_read(get_address_space_memory(), addr, buf, sizeof(*buf),
                           MEMTXATTRS_UNSPECIFIED);
     if (ret != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -316,7 +316,7 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
 
     trace_smmuv3_get_cd(addr);
     /* TODO: guarantee 64-bit single-copy atomicity */
-    ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
+    ret = dma_memory_read(get_address_space_memory(), addr, buf, sizeof(*buf),
                           MEMTXATTRS_UNSPECIFIED);
     if (ret != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -421,7 +421,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
         l2_ste_offset = sid & ((1 << s->sid_split) - 1);
         l1ptr = (dma_addr_t)(strtab_base + l1_ste_offset * sizeof(l1std));
         /* TODO: guarantee 64-bit single-copy atomicity */
-        ret = dma_memory_read(&address_space_memory, l1ptr, &l1std,
+        ret = dma_memory_read(get_address_space_memory(), l1ptr, &l1std,
                               sizeof(l1std), MEMTXATTRS_UNSPECIFIED);
         if (ret != MEMTX_OK) {
             qemu_log_mask(LOG_GUEST_ERROR,
@@ -649,7 +649,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     SMMUTransTableInfo *tt;
     SMMUTransCfg *cfg = NULL;
     IOMMUTLBEntry entry = {
-        .target_as = &address_space_memory,
+        .target_as = get_address_space_memory(),
         .iova = addr,
         .translated_addr = addr,
         .addr_mask = ~(hwaddr)0,
@@ -839,7 +839,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     }
 
     event.type = IOMMU_NOTIFIER_UNMAP;
-    event.entry.target_as = &address_space_memory;
+    event.entry.target_as = get_address_space_memory();
     event.entry.iova = iova;
     event.entry.addr_mask = num_pages * (1 << granule) - 1;
     event.entry.perm = IOMMU_NONE;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0961e053e5..350071f9a6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2259,7 +2259,7 @@ static void machvirt_init(MachineState *machine)
      */
     create_virtio_devices(vms);
 
-    vms->fw_cfg = create_fw_cfg(vms, &address_space_memory);
+    vms->fw_cfg = create_fw_cfg(vms, get_address_space_memory());
     rom_set_fw(vms->fw_cfg);
 
     create_platform_bus(vms);
diff --git a/hw/char/goldfish_tty.c b/hw/char/goldfish_tty.c
index 20b77885c1..649ec344c9 100644
--- a/hw/char/goldfish_tty.c
+++ b/hw/char/goldfish_tty.c
@@ -97,7 +97,7 @@ static void goldfish_tty_cmd(GoldfishTTYState *s, uint32_t cmd)
         while (len) {
             to_copy = MIN(GOLFISH_TTY_BUFFER_SIZE, len);
 
-            address_space_rw(&address_space_memory, ptr,
+            address_space_rw(get_address_space_memory(), ptr,
                              MEMTXATTRS_UNSPECIFIED, data_out, to_copy, 0);
             qemu_chr_fe_write_all(&s->chr, data_out, to_copy);
 
@@ -110,7 +110,7 @@ static void goldfish_tty_cmd(GoldfishTTYState *s, uint32_t cmd)
         ptr = s->data_ptr;
         while (len && !fifo8_is_empty(&s->rx_fifo)) {
             buf = (uint8_t *)fifo8_pop_buf(&s->rx_fifo, len, &to_copy);
-            address_space_rw(&address_space_memory, ptr,
+            address_space_rw(get_address_space_memory(), ptr,
                             MEMTXATTRS_UNSPECIFIED, buf, to_copy, 1);
 
             len -= to_copy;
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 0548830733..7713180a6f 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -930,7 +930,7 @@ static void rom_insert(Rom *rom)
 
     /* The user didn't specify an address space, this is the default */
     if (!rom->as) {
-        rom->as = &address_space_memory;
+        rom->as = get_address_space_memory();
     }
 
     rom->committed = false;
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 08e5938ec7..42c5812410 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1573,7 +1573,7 @@ static void pl330_realize(DeviceState *dev, Error **errp)
         return;
     } else if (s->mem_mr == get_system_memory()) {
         /* Avoid creating new AS for system memory. */
-        s->mem_as = &address_space_memory;
+        s->mem_as = get_address_space_memory();
     } else {
         s->mem_as = g_new0(AddressSpace, 1);
         address_space_init(s->mem_as, s->mem_mr,
diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index aa1d323a36..794cff786e 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -501,7 +501,7 @@ static IOMMUTLBEntry rc4030_dma_translate(IOMMUMemoryRegion *iommu, hwaddr addr,
 {
     rc4030State *s = container_of(iommu, rc4030State, dma_mr);
     IOMMUTLBEntry ret = {
-        .target_as = &address_space_memory,
+        .target_as = get_address_space_memory(),
         .iova = addr & ~(DMA_PAGESIZE - 1),
         .translated_addr = 0,
         .addr_mask = DMA_PAGESIZE - 1,
diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
index f5ad1a0d22..1132b55124 100644
--- a/hw/dma/xlnx-zynq-devcfg.c
+++ b/hw/dma/xlnx-zynq-devcfg.c
@@ -161,13 +161,13 @@ static void xlnx_zynq_devcfg_dma_go(XlnxZynqDevcfg *s)
             btt = MIN(btt, dmah->dest_len);
         }
         DB_PRINT("reading %x bytes from %x\n", btt, dmah->src_addr);
-        dma_memory_read(&address_space_memory, dmah->src_addr, buf, btt,
+        dma_memory_read(get_address_space_memory(), dmah->src_addr, buf, btt,
                         MEMTXATTRS_UNSPECIFIED);
         dmah->src_len -= btt;
         dmah->src_addr += btt;
         if (loopback && (dmah->src_len || dmah->dest_len)) {
             DB_PRINT("writing %x bytes from %x\n", btt, dmah->dest_addr);
-            dma_memory_write(&address_space_memory, dmah->dest_addr, buf, btt,
+            dma_memory_write(get_address_space_memory(), dmah->dest_addr, buf, btt,
                              MEMTXATTRS_UNSPECIFIED);
             dmah->dest_len -= btt;
             dmah->dest_addr += btt;
diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index dd66be5265..1f6d28cfd6 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -651,7 +651,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
             desc_addr = xlnx_dpdma_descriptor_next_address(s, channel);
         }
 
-        if (dma_memory_read(&address_space_memory, desc_addr, &desc,
+        if (dma_memory_read(get_address_space_memory(), desc_addr, &desc,
                             sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED)) {
             s->registers[DPDMA_EISR] |= ((1 << 1) << channel);
             xlnx_dpdma_update_irq(s);
@@ -705,7 +705,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
             if (xlnx_dpdma_desc_is_contiguous(&desc)) {
                 source_addr[0] = xlnx_dpdma_desc_get_source_address(&desc, 0);
                 while (transfer_len != 0) {
-                    if (dma_memory_read(&address_space_memory,
+                    if (dma_memory_read(get_address_space_memory(),
                                         source_addr[0],
                                         &s->data[channel][ptr],
                                         line_size,
@@ -734,7 +734,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
                     size_t fragment_len = DPDMA_FRAG_MAX_SZ
                                     - (source_addr[frag] % DPDMA_FRAG_MAX_SZ);
 
-                    if (dma_memory_read(&address_space_memory,
+                    if (dma_memory_read(get_address_space_memory(),
                                         source_addr[frag],
                                         &(s->data[channel][ptr]),
                                         fragment_len,
@@ -755,7 +755,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
             /* The descriptor need to be updated when it's completed. */
             DPRINTF("update the descriptor with the done flag set.\n");
             xlnx_dpdma_desc_set_done(&desc);
-            dma_memory_write(&address_space_memory, desc_addr, &desc,
+            dma_memory_write(get_address_space_memory(), desc_addr, &desc,
                              sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED);
         }
 
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index e53d5f0fa7..2f46704318 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -44,7 +44,7 @@ static void hppa_powerdown_req(Notifier *n, void *opaque)
     hwaddr soft_power_reg = HPA_POWER_BUTTON;
     uint32_t val;
 
-    val = ldl_be_phys(&address_space_memory, soft_power_reg);
+    val = ldl_be_phys(get_address_space_memory(), soft_power_reg);
     if ((val >> 8) == 0) {
         /* immediately shut down when under hardware control */
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
@@ -53,7 +53,7 @@ static void hppa_powerdown_req(Notifier *n, void *opaque)
 
     /* clear bit 31 to indicate that the power switch was pressed. */
     val &= ~1;
-    stl_be_phys(&address_space_memory, soft_power_reg, val);
+    stl_be_phys(get_address_space_memory(), soft_power_reg, val);
 }
 
 static Notifier hppa_system_powerdown_notifier = {
diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index 4a1b59cb9d..4f462d6b45 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -679,7 +679,7 @@ uint16_t hyperv_hcall_signal_event(uint64_t param, bool fast)
             return HV_STATUS_INVALID_ALIGNMENT;
         }
 
-        param = ldq_phys(&address_space_memory, addr);
+        param = ldq_phys(get_address_space_memory(), addr);
     }
 
     /*
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 30bc04e1c4..de58644db4 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -2298,7 +2298,7 @@ static void vmbus_dev_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    vdev->dma_as = &address_space_memory;
+    vdev->dma_as = get_address_space_memory();
 
     create_channels(vmbus, vdev, &err);
     if (err) {
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 725f69095b..4a87fb5745 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -159,7 +159,7 @@ static void amdvi_generate_msi_interrupt(AMDVIState *s)
 
     if (msi_enabled(&s->pci.dev)) {
         msg = msi_get_message(&s->pci.dev, 0);
-        address_space_stl_le(&address_space_memory, msg.address, msg.data,
+        address_space_stl_le(get_address_space_memory(), msg.address, msg.data,
                              attrs, NULL);
     }
 }
@@ -180,7 +180,7 @@ static void amdvi_log_event(AMDVIState *s, uint64_t *evt)
         return;
     }
 
-    if (dma_memory_write(&address_space_memory, s->evtlog + s->evtlog_tail,
+    if (dma_memory_write(get_address_space_memory(), s->evtlog + s->evtlog_tail,
                          evt, AMDVI_EVENT_LEN, MEMTXATTRS_UNSPECIFIED)) {
         trace_amdvi_evntlog_fail(s->evtlog, s->evtlog_tail);
     }
@@ -379,7 +379,7 @@ static void amdvi_completion_wait(AMDVIState *s, uint64_t *cmd)
                                    s->cmdbuf + s->cmdbuf_head);
     }
     if (extract64(cmd[0], 0, 1)) {
-        if (dma_memory_write(&address_space_memory, addr, &data,
+        if (dma_memory_write(get_address_space_memory(), addr, &data,
                              AMDVI_COMPLETION_DATA_SIZE,
                              MEMTXATTRS_UNSPECIFIED)) {
             trace_amdvi_completion_wait_fail(addr);
@@ -506,7 +506,7 @@ static void amdvi_cmdbuf_exec(AMDVIState *s)
 {
     uint64_t cmd[2];
 
-    if (dma_memory_read(&address_space_memory, s->cmdbuf + s->cmdbuf_head,
+    if (dma_memory_read(get_address_space_memory(), s->cmdbuf + s->cmdbuf_head,
                         cmd, AMDVI_COMMAND_SIZE, MEMTXATTRS_UNSPECIFIED)) {
         trace_amdvi_command_read_fail(s->cmdbuf, s->cmdbuf_head);
         amdvi_log_command_error(s, s->cmdbuf + s->cmdbuf_head);
@@ -840,7 +840,7 @@ static bool amdvi_get_dte(AMDVIState *s, int devid, uint64_t *entry)
 {
     uint32_t offset = devid * AMDVI_DEVTAB_ENTRY_SIZE;
 
-    if (dma_memory_read(&address_space_memory, s->devtab + offset, entry,
+    if (dma_memory_read(get_address_space_memory(), s->devtab + offset, entry,
                         AMDVI_DEVTAB_ENTRY_SIZE, MEMTXATTRS_UNSPECIFIED)) {
         trace_amdvi_dte_get_fail(s->devtab, offset);
         /* log error accessing dte */
@@ -886,7 +886,7 @@ static inline uint64_t amdvi_get_pte_entry(AMDVIState *s, uint64_t pte_addr,
 {
     uint64_t pte;
 
-    if (dma_memory_read(&address_space_memory, pte_addr,
+    if (dma_memory_read(get_address_space_memory(), pte_addr,
                         &pte, sizeof(pte), MEMTXATTRS_UNSPECIFIED)) {
         trace_amdvi_get_pte_hwerror(pte_addr);
         amdvi_log_pagetab_error(s, devid, pte_addr, 0);
@@ -1010,7 +1010,7 @@ static IOMMUTLBEntry amdvi_translate(IOMMUMemoryRegion *iommu, hwaddr addr,
     AMDVIAddressSpace *as = container_of(iommu, AMDVIAddressSpace, iommu);
     AMDVIState *s = as->iommu_state;
     IOMMUTLBEntry ret = {
-        .target_as = &address_space_memory,
+        .target_as = get_address_space_memory(),
         .iova = addr,
         .translated_addr = 0,
         .addr_mask = ~(hwaddr)0,
@@ -1050,7 +1050,7 @@ static int amdvi_get_irte(AMDVIState *s, MSIMessage *origin, uint64_t *dte,
 
     trace_amdvi_ir_irte(irte_root, offset);
 
-    if (dma_memory_read(&address_space_memory, irte_root + offset,
+    if (dma_memory_read(get_address_space_memory(), irte_root + offset,
                         irte, sizeof(*irte), MEMTXATTRS_UNSPECIFIED)) {
         trace_amdvi_ir_err("failed to get irte");
         return -AMDVI_IR_GET_IRTE;
@@ -1110,7 +1110,7 @@ static int amdvi_get_irte_ga(AMDVIState *s, MSIMessage *origin, uint64_t *dte,
     offset = (origin->data & AMDVI_IRTE_OFFSET) << 4;
     trace_amdvi_ir_irte(irte_root, offset);
 
-    if (dma_memory_read(&address_space_memory, irte_root + offset,
+    if (dma_memory_read(get_address_space_memory(), irte_root + offset,
                         irte, sizeof(*irte), MEMTXATTRS_UNSPECIFIED)) {
         trace_amdvi_ir_err("failed to get irte_ga");
         return -AMDVI_IR_GET_IRTE;
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index a283785a8d..4b9964c340 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -104,7 +104,7 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
     int nb_numa_nodes = ms->numa_state->num_nodes;
 
     fw_cfg = fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
-                                &address_space_memory);
+                                get_address_space_memory());
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, boot_cpus);
 
     /* FW_CFG_MAX_CPUS is a bit confusing/problematic on x86:
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 05d53a1aa9..c7c08de1ba 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -576,7 +576,7 @@ static int vtd_get_root_entry(IntelIOMMUState *s, uint8_t index,
     dma_addr_t addr;
 
     addr = s->root + index * sizeof(*re);
-    if (dma_memory_read(&address_space_memory, addr,
+    if (dma_memory_read(get_address_space_memory(), addr,
                         re, sizeof(*re), MEMTXATTRS_UNSPECIFIED)) {
         re->lo = 0;
         return -VTD_FR_ROOT_TABLE_INV;
@@ -610,7 +610,7 @@ static int vtd_get_context_entry_from_root(IntelIOMMUState *s,
     }
 
     addr = addr + index * ce_size;
-    if (dma_memory_read(&address_space_memory, addr,
+    if (dma_memory_read(get_address_space_memory(), addr,
                         ce, ce_size, MEMTXATTRS_UNSPECIFIED)) {
         return -VTD_FR_CONTEXT_TABLE_INV;
     }
@@ -647,7 +647,7 @@ static uint64_t vtd_get_slpte(dma_addr_t base_addr, uint32_t index)
 
     assert(index < VTD_SL_PT_ENTRY_NR);
 
-    if (dma_memory_read(&address_space_memory,
+    if (dma_memory_read(get_address_space_memory(),
                         base_addr + index * sizeof(slpte),
                         &slpte, sizeof(slpte), MEMTXATTRS_UNSPECIFIED)) {
         slpte = (uint64_t)-1;
@@ -713,7 +713,7 @@ static int vtd_get_pdire_from_pdir_table(dma_addr_t pasid_dir_base,
     index = VTD_PASID_DIR_INDEX(pasid);
     entry_size = VTD_PASID_DIR_ENTRY_SIZE;
     addr = pasid_dir_base + index * entry_size;
-    if (dma_memory_read(&address_space_memory, addr,
+    if (dma_memory_read(get_address_space_memory(), addr,
                         pdire, entry_size, MEMTXATTRS_UNSPECIFIED)) {
         return -VTD_FR_PASID_TABLE_INV;
     }
@@ -738,7 +738,7 @@ static int vtd_get_pe_in_pasid_leaf_table(IntelIOMMUState *s,
     index = VTD_PASID_TABLE_INDEX(pasid);
     entry_size = VTD_PASID_ENTRY_SIZE;
     addr = addr + index * entry_size;
-    if (dma_memory_read(&address_space_memory, addr,
+    if (dma_memory_read(get_address_space_memory(), addr,
                         pe, entry_size, MEMTXATTRS_UNSPECIFIED)) {
         return -VTD_FR_PASID_TABLE_INV;
     }
@@ -1281,7 +1281,7 @@ static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
              *
              * In either case, we send an IOTLB notification down.
              */
-            event.entry.target_as = &address_space_memory;
+            event.entry.target_as = get_address_space_memory();
             event.entry.iova = iova & subpage_mask;
             event.entry.perm = IOMMU_ACCESS_FLAG(read_cur, write_cur);
             event.entry.addr_mask = ~subpage_mask;
@@ -2049,7 +2049,7 @@ static void vtd_iotlb_page_invalidate_notify(IntelIOMMUState *s,
                 IOMMUTLBEvent event = {
                     .type = IOMMU_NOTIFIER_UNMAP,
                     .entry = {
-                        .target_as = &address_space_memory,
+                        .target_as = get_address_space_memory(),
                         .iova = addr,
                         .translated_addr = 0,
                         .addr_mask = size - 1,
@@ -2320,7 +2320,7 @@ static bool vtd_get_inv_desc(IntelIOMMUState *s,
     uint32_t dw = s->iq_dw ? 32 : 16;
     dma_addr_t addr = base_addr + offset * dw;
 
-    if (dma_memory_read(&address_space_memory, addr,
+    if (dma_memory_read(get_address_space_memory(), addr,
                         inv_desc, dw, MEMTXATTRS_UNSPECIFIED)) {
         error_report_once("Read INV DESC failed.");
         return false;
@@ -2354,7 +2354,7 @@ static bool vtd_process_wait_desc(IntelIOMMUState *s, VTDInvDesc *inv_desc)
         dma_addr_t status_addr = inv_desc->hi;
         trace_vtd_inv_desc_wait_sw(status_addr, status_data);
         status_data = cpu_to_le32(status_data);
-        if (dma_memory_write(&address_space_memory, status_addr,
+        if (dma_memory_write(get_address_space_memory(), status_addr,
                              &status_data, sizeof(status_data),
                              MEMTXATTRS_UNSPECIFIED)) {
             trace_vtd_inv_desc_wait_write_fail(inv_desc->hi, inv_desc->lo);
@@ -3016,7 +3016,7 @@ static IOMMUTLBEntry vtd_iommu_translate(IOMMUMemoryRegion *iommu, hwaddr addr,
     IntelIOMMUState *s = vtd_as->iommu_state;
     IOMMUTLBEntry iotlb = {
         /* We'll fill in the rest later. */
-        .target_as = &address_space_memory,
+        .target_as = get_address_space_memory(),
     };
     bool success;
 
@@ -3173,7 +3173,7 @@ static int vtd_irte_get(IntelIOMMUState *iommu, uint16_t index,
     }
 
     addr = iommu->intr_root + index * sizeof(*entry);
-    if (dma_memory_read(&address_space_memory, addr,
+    if (dma_memory_read(get_address_space_memory(), addr,
                         entry, sizeof(*entry), MEMTXATTRS_UNSPECIFIED)) {
         error_report_once("%s: read failed: ind=0x%x addr=0x%" PRIx64,
                           __func__, index, addr);
@@ -3543,7 +3543,7 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
         event.type = IOMMU_NOTIFIER_UNMAP;
         event.entry.iova = start;
         event.entry.addr_mask = mask;
-        event.entry.target_as = &address_space_memory;
+        event.entry.target_as = get_address_space_memory();
         event.entry.perm = IOMMU_NONE;
         /* This field is meaningless for unmap */
         event.entry.translated_addr = 0;
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 52cafa003d..b56a56fe16 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -318,7 +318,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     }
 
     fw_cfg = fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
-                                &address_space_memory);
+                                get_address_space_memory());
 
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, machine->smp.cpus);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, machine->smp.max_cpus);
@@ -342,7 +342,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     }
 
     x86ms->fw_cfg = fw_cfg;
-    x86ms->ioapic_as = &address_space_memory;
+    x86ms->ioapic_as = get_address_space_memory();
 }
 
 static gchar *microvm_get_mmio_cmdline(gchar *name, uint32_t virtio_irq_base)
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 566accf7e6..f48c630941 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1130,7 +1130,7 @@ void pc_memory_init(PCMachineState *pcms,
     x86ms->fw_cfg = fw_cfg;
 
     /* Init default IOAPIC address space */
-    x86ms->ioapic_as = &address_space_memory;
+    x86ms->ioapic_as = get_address_space_memory();
 
     /* Init ACPI memory hotplug IO base address */
     pcms->memhp_io_base = ACPI_MEMORY_HOTPLUG_BASE;
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index e4293d6d66..e38996a88f 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1491,11 +1491,11 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
     qemu_add_vm_change_state_handler(xen_hvm_change_state_handler, state);
 
     state->memory_listener = xen_memory_listener;
-    memory_listener_register(&state->memory_listener, &address_space_memory);
+    memory_listener_register(&state->memory_listener, get_address_space_memory());
     state->log_for_dirtybit = NULL;
 
     state->io_listener = xen_io_listener;
-    memory_listener_register(&state->io_listener, &address_space_io);
+    memory_listener_register(&state->io_listener, get_address_space_io());
 
     state->device_listener = xen_device_listener;
     QLIST_INIT(&state->dev_list);
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 7ce001cacd..ed294ae25b 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1789,7 +1789,7 @@ static void sysbus_ahci_realize(DeviceState *dev, Error **errp)
 {
     SysbusAHCIState *s = SYSBUS_AHCI(dev);
 
-    ahci_realize(&s->ahci, dev, &address_space_memory, s->num_ports);
+    ahci_realize(&s->ahci, dev, get_address_space_memory(), s->num_ports);
 }
 
 static Property sysbus_ahci_properties[] = {
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 1c15c37ec5..09979f40a3 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -96,7 +96,7 @@ static void pmac_ide_atapi_transfer_cb(void *opaque, int ret)
     if (s->lba == -1) {
         /* Non-block ATAPI transfer - just copy to RAM */
         s->io_buffer_size = MIN(s->io_buffer_size, io->len);
-        dma_memory_write(&address_space_memory, io->addr, s->io_buffer,
+        dma_memory_write(get_address_space_memory(), io->addr, s->io_buffer,
                          s->io_buffer_size, MEMTXATTRS_UNSPECIFIED);
         io->len = 0;
         ide_atapi_cmd_ok(s);
@@ -108,7 +108,7 @@ static void pmac_ide_atapi_transfer_cb(void *opaque, int ret)
     offset = ((int64_t)s->lba << 11) + s->io_buffer_index;
 
     qemu_sglist_init(&s->sg, DEVICE(m), io->len / MACIO_PAGE_SIZE + 1,
-                     &address_space_memory);
+                     get_address_space_memory());
     qemu_sglist_add(&s->sg, io->addr, io->len);
     s->io_buffer_size -= io->len;
     s->io_buffer_index += io->len;
@@ -119,7 +119,7 @@ static void pmac_ide_atapi_transfer_cb(void *opaque, int ret)
     return;
 
 done:
-    dma_memory_unmap(&address_space_memory, io->dma_mem, io->dma_len,
+    dma_memory_unmap(get_address_space_memory(), io->dma_mem, io->dma_len,
                      io->dir, io->dma_len);
 
     if (ret < 0) {
@@ -174,7 +174,7 @@ static void pmac_ide_transfer_cb(void *opaque, int ret)
     offset = (ide_get_sector(s) << 9) + s->io_buffer_index;
 
     qemu_sglist_init(&s->sg, DEVICE(m), io->len / MACIO_PAGE_SIZE + 1,
-                     &address_space_memory);
+                     get_address_space_memory());
     qemu_sglist_add(&s->sg, io->addr, io->len);
     s->io_buffer_size -= io->len;
     s->io_buffer_index += io->len;
@@ -202,7 +202,7 @@ static void pmac_ide_transfer_cb(void *opaque, int ret)
     return;
 
 done:
-    dma_memory_unmap(&address_space_memory, io->dma_mem, io->dma_len,
+    dma_memory_unmap(get_address_space_memory(), io->dma_mem, io->dma_len,
                      io->dir, io->dma_len);
 
     if (s->dma_cmd == IDE_DMA_READ || s->dma_cmd == IDE_DMA_WRITE) {
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 3df11c34d6..7eff017fce 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -123,7 +123,7 @@ static void apic_sync_vapic(APICCommonState *s, int sync_type)
         }
         vapic_state.irr = vector & 0xff;
 
-        address_space_write_rom(&address_space_memory,
+        address_space_write_rom(get_address_space_memory(),
                                 s->vapic_paddr + start,
                                 MEMTXATTRS_UNSPECIFIED,
                                 ((void *)&vapic_state) + start, length);
diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
index 557dd0c2bf..1e861793ef 100644
--- a/hw/intc/openpic_kvm.c
+++ b/hw/intc/openpic_kvm.c
@@ -235,7 +235,7 @@ static void kvm_openpic_realize(DeviceState *dev, Error **errp)
     opp->mem_listener.region_add = kvm_openpic_region_add;
     opp->mem_listener.region_del = kvm_openpic_region_del;
     opp->mem_listener.name = "openpic-kvm";
-    memory_listener_register(&opp->mem_listener, &address_space_memory);
+    memory_listener_register(&opp->mem_listener, get_address_space_memory());
 
     /* indicate pic capabilities */
     msi_nonbroken = true;
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index c7b75ed12e..c1066ff521 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -152,7 +152,7 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    if (ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
+    if (ldq_be_dma(get_address_space_memory(), vsd_addr, &vsd,
                     MEMTXATTRS_UNSPECIFIED)) {
         xive_error(xive, "VST: failed to access %s entry %x @0x%" PRIx64,
                    info->name, idx, vsd_addr);
@@ -180,7 +180,7 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
     /* Load the VSD we are looking for, if not already done */
     if (vsd_idx) {
         vsd_addr = vsd_addr + vsd_idx * XIVE_VSD_SIZE;
-        if (ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
+        if (ldq_be_dma(get_address_space_memory(), vsd_addr, &vsd,
                        MEMTXATTRS_UNSPECIFIED)) {
             xive_error(xive, "VST: failed to access %s entry %x @0x%"
                        PRIx64, info->name, vsd_idx, vsd_addr);
@@ -560,7 +560,7 @@ static uint64_t pnv_xive_vst_per_subpage(PnvXive *xive, uint32_t type)
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    if (ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
+    if (ldq_be_dma(get_address_space_memory(), vsd_addr, &vsd,
                    MEMTXATTRS_UNSPECIFIED)) {
         xive_error(xive, "VST: failed to access %s entry @0x%" PRIx64,
                    info->name, vsd_addr);
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index f22ce5ca59..1ae0660c36 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -159,7 +159,7 @@ static uint64_t pnv_xive2_vst_addr_indirect(PnvXive2 *xive, uint32_t type,
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECIFIED);
+    ldq_be_dma(get_address_space_memory(), vsd_addr, &vsd, MEMTXATTRS_UNSPECIFIED);
 
     if (!(vsd & VSD_ADDRESS_MASK)) {
         xive2_error(xive, "VST: invalid %s entry %x !?", info->name, idx);
@@ -180,7 +180,7 @@ static uint64_t pnv_xive2_vst_addr_indirect(PnvXive2 *xive, uint32_t type,
     /* Load the VSD we are looking for, if not already done */
     if (vsd_idx) {
         vsd_addr = vsd_addr + vsd_idx * XIVE_VSD_SIZE;
-        ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
+        ldq_be_dma(get_address_space_memory(), vsd_addr, &vsd,
                    MEMTXATTRS_UNSPECIFIED);
 
         if (!(vsd & VSD_ADDRESS_MASK)) {
@@ -2044,7 +2044,7 @@ static uint64_t pnv_xive2_vst_per_subpage(PnvXive2 *xive, uint32_t type)
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECIFIED);
+    ldq_be_dma(get_address_space_memory(), vsd_addr, &vsd, MEMTXATTRS_UNSPECIFIED);
 
     if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE2_DEBUG
diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index cfd007e629..31ca6da794 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -350,7 +350,7 @@ static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
     addr |= (uint64_t)(guest_idx & APLIC_xMSICFGADDR_PPN_HART(lhxs));
     addr <<= APLIC_xMSICFGADDR_PPN_SHIFT;
 
-    address_space_stl_le(&address_space_memory, addr,
+    address_space_stl_le(get_address_space_memory(), addr,
                          eiid, MEMTXATTRS_UNSPECIFIED, &result);
     if (result != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: MSI write failed for "
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index dc641cc604..987769a217 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -1708,7 +1708,7 @@ static target_ulong h_int_esb(PowerPCCPU *cpu,
     } else {
         mmio_addr = xive->vc_base + xive_source_esb_mgmt(xsrc, lisn) + offset;
 
-        if (dma_memory_rw(&address_space_memory, mmio_addr, &data, 8,
+        if (dma_memory_rw(get_address_space_memory(), mmio_addr, &data, 8,
                           (flags & SPAPR_XIVE_ESB_STORE),
                           MEMTXATTRS_UNSPECIFIED)) {
             qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to access ESB @0x%"
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index a986b96843..1333a3f7a1 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1294,7 +1294,7 @@ void xive_end_queue_pic_print_info(XiveEND *end, uint32_t width, Monitor *mon)
         uint64_t qaddr = qaddr_base + (qindex << 2);
         uint32_t qdata = -1;
 
-        if (dma_memory_read(&address_space_memory, qaddr,
+        if (dma_memory_read(get_address_space_memory(), qaddr,
                             &qdata, sizeof(qdata), MEMTXATTRS_UNSPECIFIED)) {
             qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to read EQ @0x%"
                           HWADDR_PRIx "\n", qaddr);
@@ -1359,7 +1359,7 @@ static void xive_end_enqueue(XiveEND *end, uint32_t data)
     uint32_t qdata = cpu_to_be32((qgen << 31) | (data & 0x7fffffff));
     uint32_t qentries = 1 << (qsize + 10);
 
-    if (dma_memory_write(&address_space_memory, qaddr,
+    if (dma_memory_write(get_address_space_memory(), qaddr,
                          &qdata, sizeof(qdata), MEMTXATTRS_UNSPECIFIED)) {
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to write END data @0x%"
                       HWADDR_PRIx "\n", qaddr);
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 4d9ff41956..58987e556c 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -58,7 +58,7 @@ void xive2_end_queue_pic_print_info(Xive2End *end, uint32_t width,
         uint64_t qaddr = qaddr_base + (qindex << 2);
         uint32_t qdata = -1;
 
-        if (dma_memory_read(&address_space_memory, qaddr, &qdata,
+        if (dma_memory_read(get_address_space_memory(), qaddr, &qdata,
                             sizeof(qdata), MEMTXATTRS_UNSPECIFIED)) {
             qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to read EQ @0x%"
                           HWADDR_PRIx "\n", qaddr);
@@ -149,7 +149,7 @@ static void xive2_end_enqueue(Xive2End *end, uint32_t data)
     uint32_t qdata = cpu_to_be32((qgen << 31) | (data & 0x7fffffff));
     uint32_t qentries = 1 << (qsize + 10);
 
-    if (dma_memory_write(&address_space_memory, qaddr, &qdata, sizeof(qdata),
+    if (dma_memory_write(get_address_space_memory(), qaddr, &qdata, sizeof(qdata),
                          MEMTXATTRS_UNSPECIFIED)) {
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to write END data @0x%"
                       HWADDR_PRIx "\n", qaddr);
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 6aefe9a61b..1a17bac510 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -70,7 +70,7 @@ static void main_cpu_reset(void *opaque)
 static uint64_t rtc_read(void *opaque, hwaddr addr, unsigned size)
 {
     uint8_t val;
-    address_space_read(&address_space_memory, 0x90000071,
+    address_space_read(get_address_space_memory(), 0x90000071,
                        MEMTXATTRS_UNSPECIFIED, &val, 1);
     return val;
 }
@@ -79,7 +79,7 @@ static void rtc_write(void *opaque, hwaddr addr,
                       uint64_t val, unsigned size)
 {
     uint8_t buf = val & 0xff;
-    address_space_write(&address_space_memory, 0x90000071,
+    address_space_write(get_address_space_memory(), 0x90000071,
                         MEMTXATTRS_UNSPECIFIED, &buf, 1);
 }
 
diff --git a/hw/misc/lasi.c b/hw/misc/lasi.c
index 23a7634a8c..c35b4bde0a 100644
--- a/hw/misc/lasi.c
+++ b/hw/misc/lasi.c
@@ -220,7 +220,7 @@ static void lasi_set_irq(void *opaque, int irq, int level)
             uint32_t iar = s->iar;
             s->irr |= bit;
             if ((s->icr & ICR_BUS_ERROR_BIT) == 0) {
-                stl_be_phys(&address_space_memory, iar & -32, iar & 31);
+                stl_be_phys(get_address_space_memory(), iar & -32, iar & 31);
             }
         }
     }
diff --git a/hw/misc/macio/mac_dbdma.c b/hw/misc/macio/mac_dbdma.c
index efcc02609f..cb7ef894a6 100644
--- a/hw/misc/macio/mac_dbdma.c
+++ b/hw/misc/macio/mac_dbdma.c
@@ -93,7 +93,7 @@ static void dbdma_cmdptr_load(DBDMA_channel *ch)
 {
     DBDMA_DPRINTFCH(ch, "dbdma_cmdptr_load 0x%08x\n",
                     ch->regs[DBDMA_CMDPTR_LO]);
-    dma_memory_read(&address_space_memory, ch->regs[DBDMA_CMDPTR_LO],
+    dma_memory_read(get_address_space_memory(), ch->regs[DBDMA_CMDPTR_LO],
                     &ch->current, sizeof(dbdma_cmd), MEMTXATTRS_UNSPECIFIED);
 }
 
@@ -103,7 +103,7 @@ static void dbdma_cmdptr_save(DBDMA_channel *ch)
                     ch->regs[DBDMA_CMDPTR_LO],
                     le16_to_cpu(ch->current.xfer_status),
                     le16_to_cpu(ch->current.res_count));
-    dma_memory_write(&address_space_memory, ch->regs[DBDMA_CMDPTR_LO],
+    dma_memory_write(get_address_space_memory(), ch->regs[DBDMA_CMDPTR_LO],
                      &ch->current, sizeof(dbdma_cmd), MEMTXATTRS_UNSPECIFIED);
 }
 
@@ -371,7 +371,7 @@ static void load_word(DBDMA_channel *ch, int key, uint32_t addr,
         return;
     }
 
-    dma_memory_read(&address_space_memory, addr, &current->cmd_dep, len,
+    dma_memory_read(get_address_space_memory(), addr, &current->cmd_dep, len,
                     MEMTXATTRS_UNSPECIFIED);
 
     if (conditional_wait(ch))
@@ -404,7 +404,7 @@ static void store_word(DBDMA_channel *ch, int key, uint32_t addr,
         return;
     }
 
-    dma_memory_write(&address_space_memory, addr, &current->cmd_dep, len,
+    dma_memory_write(get_address_space_memory(), addr, &current->cmd_dep, len,
                      MEMTXATTRS_UNSPECIFIED);
 
     if (conditional_wait(ch))
diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 83ef0a783e..53c464c2e5 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -453,7 +453,7 @@ static void do_phy_ctl(FTGMAC100State *s)
 
 static int ftgmac100_read_bd(FTGMAC100Desc *bd, dma_addr_t addr)
 {
-    if (dma_memory_read(&address_space_memory, addr,
+    if (dma_memory_read(get_address_space_memory(), addr,
                         bd, sizeof(*bd), MEMTXATTRS_UNSPECIFIED)) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to read descriptor @ 0x%"
                       HWADDR_PRIx "\n", __func__, addr);
@@ -474,7 +474,7 @@ static int ftgmac100_write_bd(FTGMAC100Desc *bd, dma_addr_t addr)
     lebd.des1 = cpu_to_le32(bd->des1);
     lebd.des2 = cpu_to_le32(bd->des2);
     lebd.des3 = cpu_to_le32(bd->des3);
-    if (dma_memory_write(&address_space_memory, addr,
+    if (dma_memory_write(get_address_space_memory(), addr,
                          &lebd, sizeof(lebd), MEMTXATTRS_UNSPECIFIED)) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to write descriptor @ 0x%"
                       HWADDR_PRIx "\n", __func__, addr);
@@ -556,7 +556,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
             len =  sizeof(s->frame) - frame_size;
         }
 
-        if (dma_memory_read(&address_space_memory, bd.des3,
+        if (dma_memory_read(get_address_space_memory(), bd.des3,
                             ptr, len, MEMTXATTRS_UNSPECIFIED)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to read packet @ 0x%x\n",
                           __func__, bd.des3);
@@ -1033,23 +1033,23 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
             bd.des1 = lduw_be_p(buf + 14) | FTGMAC100_RXDES1_VLANTAG_AVAIL;
 
             if (s->maccr & FTGMAC100_MACCR_RM_VLAN) {
-                dma_memory_write(&address_space_memory, buf_addr, buf, 12,
+                dma_memory_write(get_address_space_memory(), buf_addr, buf, 12,
                                  MEMTXATTRS_UNSPECIFIED);
-                dma_memory_write(&address_space_memory, buf_addr + 12,
+                dma_memory_write(get_address_space_memory(), buf_addr + 12,
                                  buf + 16, buf_len - 16,
                                  MEMTXATTRS_UNSPECIFIED);
             } else {
-                dma_memory_write(&address_space_memory, buf_addr, buf,
+                dma_memory_write(get_address_space_memory(), buf_addr, buf,
                                  buf_len, MEMTXATTRS_UNSPECIFIED);
             }
         } else {
             bd.des1 = 0;
-            dma_memory_write(&address_space_memory, buf_addr, buf, buf_len,
+            dma_memory_write(get_address_space_memory(), buf_addr, buf, buf_len,
                              MEMTXATTRS_UNSPECIFIED);
         }
         buf += buf_len;
         if (size < 4) {
-            dma_memory_write(&address_space_memory, buf_addr + buf_len,
+            dma_memory_write(get_address_space_memory(), buf_addr + buf_len,
                              crc_ptr, 4 - size, MEMTXATTRS_UNSPECIFIED);
             crc_ptr += 4 - size;
         }
diff --git a/hw/net/i82596.c b/hw/net/i82596.c
index ec21e2699a..b7b07b725a 100644
--- a/hw/net/i82596.c
+++ b/hw/net/i82596.c
@@ -88,28 +88,28 @@ enum commands {
 
 static uint8_t get_byte(uint32_t addr)
 {
-    return ldub_phys(&address_space_memory, addr);
+    return ldub_phys(get_address_space_memory(), addr);
 }
 
 static void set_byte(uint32_t addr, uint8_t c)
 {
-    return stb_phys(&address_space_memory, addr, c);
+    return stb_phys(get_address_space_memory(), addr, c);
 }
 
 static uint16_t get_uint16(uint32_t addr)
 {
-    return lduw_be_phys(&address_space_memory, addr);
+    return lduw_be_phys(get_address_space_memory(), addr);
 }
 
 static void set_uint16(uint32_t addr, uint16_t w)
 {
-    return stw_be_phys(&address_space_memory, addr, w);
+    return stw_be_phys(get_address_space_memory(), addr, w);
 }
 
 static uint32_t get_uint32(uint32_t addr)
 {
-    uint32_t lo = lduw_be_phys(&address_space_memory, addr);
-    uint32_t hi = lduw_be_phys(&address_space_memory, addr + 2);
+    uint32_t lo = lduw_be_phys(get_address_space_memory(), addr);
+    uint32_t hi = lduw_be_phys(get_address_space_memory(), addr + 2);
     return (hi << 16) | lo;
 }
 
@@ -150,7 +150,7 @@ static void i82596_transmit(I82596State *s, uint32_t addr)
 
         if (s->nic && len) {
             assert(len <= sizeof(s->tx_buffer));
-            address_space_read(&address_space_memory, tba,
+            address_space_read(get_address_space_memory(), tba,
                                MEMTXATTRS_UNSPECIFIED, s->tx_buffer, len);
             DBG(PRINT_PKTHDR("Send", &s->tx_buffer));
             DBG(printf("Sending %d bytes\n", len));
@@ -174,7 +174,7 @@ static void set_individual_address(I82596State *s, uint32_t addr)
 
     nc = qemu_get_queue(s->nic);
     m = s->conf.macaddr.a;
-    address_space_read(&address_space_memory, addr + 8,
+    address_space_read(get_address_space_memory(), addr + 8,
                        MEMTXATTRS_UNSPECIFIED, m, ETH_ALEN);
     qemu_format_nic_info_str(nc, m);
     trace_i82596_new_mac(nc->info_str);
@@ -192,7 +192,7 @@ static void set_multicast_list(I82596State *s, uint32_t addr)
     }
     for (i = 0; i < mc_count; i++) {
         uint8_t multicast_addr[ETH_ALEN];
-        address_space_read(&address_space_memory, addr + i * ETH_ALEN,
+        address_space_read(get_address_space_memory(), addr + i * ETH_ALEN,
                            MEMTXATTRS_UNSPECIFIED, multicast_addr, ETH_ALEN);
         DBG(printf("Add multicast entry " MAC_FMT "\n",
                     MAC_ARG(multicast_addr)));
@@ -261,7 +261,7 @@ static void command_loop(I82596State *s)
             byte_cnt = MAX(byte_cnt, 4);
             byte_cnt = MIN(byte_cnt, sizeof(s->config));
             /* copy byte_cnt max. */
-            address_space_read(&address_space_memory, s->cmd_p + 8,
+            address_space_read(get_address_space_memory(), s->cmd_p + 8,
                                MEMTXATTRS_UNSPECIFIED, s->config, byte_cnt);
             /* config byte according to page 35ff */
             s->config[2] &= 0x82; /* mask valid bits */
@@ -654,7 +654,7 @@ ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
                 /* Still some of the actual data buffer to transfer */
                 assert(bufsz >= bufcount);
                 bufsz -= bufcount;
-                address_space_write(&address_space_memory, rba,
+                address_space_write(get_address_space_memory(), rba,
                                     MEMTXATTRS_UNSPECIFIED, buf, bufcount);
                 rba += bufcount;
                 buf += bufcount;
@@ -663,7 +663,7 @@ ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
 
             /* Write as much of the CRC as fits */
             if (crccount > 0) {
-                address_space_write(&address_space_memory, rba,
+                address_space_write(get_address_space_memory(), rba,
                                     MEMTXATTRS_UNSPECIFIED, crc_ptr, crccount);
                 rba += crccount;
                 crc_ptr += crccount;
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 8c11b237de..d16ac730cf 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -387,7 +387,7 @@ static void imx_phy_write(IMXFECState *s, int reg, uint32_t val)
 
 static void imx_fec_read_bd(IMXFECBufDesc *bd, dma_addr_t addr)
 {
-    dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd),
+    dma_memory_read(get_address_space_memory(), addr, bd, sizeof(*bd),
                     MEMTXATTRS_UNSPECIFIED);
 
     trace_imx_fec_read_bd(addr, bd->flags, bd->length, bd->data);
@@ -395,13 +395,13 @@ static void imx_fec_read_bd(IMXFECBufDesc *bd, dma_addr_t addr)
 
 static void imx_fec_write_bd(IMXFECBufDesc *bd, dma_addr_t addr)
 {
-    dma_memory_write(&address_space_memory, addr, bd, sizeof(*bd),
+    dma_memory_write(get_address_space_memory(), addr, bd, sizeof(*bd),
                      MEMTXATTRS_UNSPECIFIED);
 }
 
 static void imx_enet_read_bd(IMXENETBufDesc *bd, dma_addr_t addr)
 {
-    dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd),
+    dma_memory_read(get_address_space_memory(), addr, bd, sizeof(*bd),
                     MEMTXATTRS_UNSPECIFIED);
 
     trace_imx_enet_read_bd(addr, bd->flags, bd->length, bd->data,
@@ -410,7 +410,7 @@ static void imx_enet_read_bd(IMXENETBufDesc *bd, dma_addr_t addr)
 
 static void imx_enet_write_bd(IMXENETBufDesc *bd, dma_addr_t addr)
 {
-    dma_memory_write(&address_space_memory, addr, bd, sizeof(*bd),
+    dma_memory_write(get_address_space_memory(), addr, bd, sizeof(*bd),
                      MEMTXATTRS_UNSPECIFIED);
 }
 
@@ -478,7 +478,7 @@ static void imx_fec_do_tx(IMXFECState *s)
             len = ENET_MAX_FRAME_SIZE - frame_size;
             s->regs[ENET_EIR] |= ENET_INT_BABT;
         }
-        dma_memory_read(&address_space_memory, bd.data, ptr, len,
+        dma_memory_read(get_address_space_memory(), bd.data, ptr, len,
                         MEMTXATTRS_UNSPECIFIED);
         ptr += len;
         frame_size += len;
@@ -560,7 +560,7 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
             len = ENET_MAX_FRAME_SIZE - frame_size;
             s->regs[ENET_EIR] |= ENET_INT_BABT;
         }
-        dma_memory_read(&address_space_memory, bd.data, ptr, len,
+        dma_memory_read(get_address_space_memory(), bd.data, ptr, len,
                         MEMTXATTRS_UNSPECIFIED);
         ptr += len;
         frame_size += len;
@@ -1109,11 +1109,11 @@ static ssize_t imx_fec_receive(NetClientState *nc, const uint8_t *buf,
             buf_len += size - 4;
         }
         buf_addr = bd.data;
-        dma_memory_write(&address_space_memory, buf_addr, buf, buf_len,
+        dma_memory_write(get_address_space_memory(), buf_addr, buf, buf_len,
                          MEMTXATTRS_UNSPECIFIED);
         buf += buf_len;
         if (size < 4) {
-            dma_memory_write(&address_space_memory, buf_addr + buf_len,
+            dma_memory_write(get_address_space_memory(), buf_addr + buf_len,
                              crc_ptr, 4 - size, MEMTXATTRS_UNSPECIFIED);
             crc_ptr += 4 - size;
         }
@@ -1217,7 +1217,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
              */
             const uint8_t zeros[2] = { 0 };
 
-            dma_memory_write(&address_space_memory, buf_addr, zeros,
+            dma_memory_write(get_address_space_memory(), buf_addr, zeros,
                              sizeof(zeros), MEMTXATTRS_UNSPECIFIED);
 
             buf_addr += sizeof(zeros);
@@ -1227,11 +1227,11 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
             shift16 = false;
         }
 
-        dma_memory_write(&address_space_memory, buf_addr, buf, buf_len,
+        dma_memory_write(get_address_space_memory(), buf_addr, buf, buf_len,
                          MEMTXATTRS_UNSPECIFIED);
         buf += buf_len;
         if (size < 4) {
-            dma_memory_write(&address_space_memory, buf_addr + buf_len,
+            dma_memory_write(get_address_space_memory(), buf_addr + buf_len,
                              crc_ptr, 4 - size, MEMTXATTRS_UNSPECIFIED);
             crc_ptr += 4 - size;
         }
diff --git a/hw/net/lasi_i82596.c b/hw/net/lasi_i82596.c
index e37f7fabe9..9df88f72d9 100644
--- a/hw/net/lasi_i82596.c
+++ b/hw/net/lasi_i82596.c
@@ -55,7 +55,7 @@ static void lasi_82596_mem_write(void *opaque, hwaddr addr,
          * Provided for SeaBIOS only. Write MAC of Network card to addr @val.
          * Needed for the PDC_LAN_STATION_ID_READ PDC call.
          */
-        address_space_write(&address_space_memory, val,
+        address_space_write(get_address_space_memory(), val,
                             MEMTXATTRS_UNSPECIFIED, d->state.conf.macaddr.a,
                             ETH_ALEN);
         break;
diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 7c86bb52e5..0ebe1eb1b1 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -199,7 +199,7 @@ static void emc_update_irq_from_reg_change(NPCM7xxEMCState *emc)
 
 static int emc_read_tx_desc(dma_addr_t addr, NPCM7xxEMCTxDesc *desc)
 {
-    if (dma_memory_read(&address_space_memory, addr, desc,
+    if (dma_memory_read(get_address_space_memory(), addr, desc,
                         sizeof(*desc), MEMTXATTRS_UNSPECIFIED)) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read descriptor @ 0x%"
                       HWADDR_PRIx "\n", __func__, addr);
@@ -220,7 +220,7 @@ static int emc_write_tx_desc(const NPCM7xxEMCTxDesc *desc, dma_addr_t addr)
     le_desc.txbsa = cpu_to_le32(desc->txbsa);
     le_desc.status_and_length = cpu_to_le32(desc->status_and_length);
     le_desc.ntxdsa = cpu_to_le32(desc->ntxdsa);
-    if (dma_memory_write(&address_space_memory, addr, &le_desc,
+    if (dma_memory_write(get_address_space_memory(), addr, &le_desc,
                          sizeof(le_desc), MEMTXATTRS_UNSPECIFIED)) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to write descriptor @ 0x%"
                       HWADDR_PRIx "\n", __func__, addr);
@@ -231,7 +231,7 @@ static int emc_write_tx_desc(const NPCM7xxEMCTxDesc *desc, dma_addr_t addr)
 
 static int emc_read_rx_desc(dma_addr_t addr, NPCM7xxEMCRxDesc *desc)
 {
-    if (dma_memory_read(&address_space_memory, addr, desc,
+    if (dma_memory_read(get_address_space_memory(), addr, desc,
                         sizeof(*desc), MEMTXATTRS_UNSPECIFIED)) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read descriptor @ 0x%"
                       HWADDR_PRIx "\n", __func__, addr);
@@ -252,7 +252,7 @@ static int emc_write_rx_desc(const NPCM7xxEMCRxDesc *desc, dma_addr_t addr)
     le_desc.rxbsa = cpu_to_le32(desc->rxbsa);
     le_desc.reserved = cpu_to_le32(desc->reserved);
     le_desc.nrxdsa = cpu_to_le32(desc->nrxdsa);
-    if (dma_memory_write(&address_space_memory, addr, &le_desc,
+    if (dma_memory_write(get_address_space_memory(), addr, &le_desc,
                          sizeof(le_desc), MEMTXATTRS_UNSPECIFIED)) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to write descriptor @ 0x%"
                       HWADDR_PRIx "\n", __func__, addr);
@@ -367,7 +367,7 @@ static void emc_try_send_next_packet(NPCM7xxEMCState *emc)
         buf = malloced_buf;
     }
 
-    if (dma_memory_read(&address_space_memory, next_buf_addr, buf,
+    if (dma_memory_read(get_address_space_memory(), next_buf_addr, buf,
                         length, MEMTXATTRS_UNSPECIFIED)) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read packet @ 0x%x\n",
                       __func__, next_buf_addr);
@@ -553,10 +553,10 @@ static ssize_t emc_receive(NetClientState *nc, const uint8_t *buf, size_t len1)
 
     buf_addr = rx_desc.rxbsa;
     emc->regs[REG_CRXBSA] = buf_addr;
-    if (dma_memory_write(&address_space_memory, buf_addr, buf,
+    if (dma_memory_write(get_address_space_memory(), buf_addr, buf,
                          len, MEMTXATTRS_UNSPECIFIED) ||
         (!(emc->regs[REG_MCMDR] & REG_MCMDR_SPCRC) &&
-         dma_memory_write(&address_space_memory, buf_addr + len,
+         dma_memory_write(get_address_space_memory(), buf_addr + len,
                           crc_ptr, 4, MEMTXATTRS_UNSPECIFIED))) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bus error writing packet\n",
                       __func__);
diff --git a/hw/openrisc/boot.c b/hw/openrisc/boot.c
index 128ccbcba2..50a70c01f7 100644
--- a/hw/openrisc/boot.c
+++ b/hw/openrisc/boot.c
@@ -110,7 +110,7 @@ uint32_t openrisc_load_fdt(void *fdt, hwaddr load_start,
     qemu_fdt_dumpdtb(fdt, fdtsize);
 
     rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
-                          &address_space_memory);
+                          get_address_space_memory());
 
     return fdt_addr;
 }
diff --git a/hw/pci-host/dino.c b/hw/pci-host/dino.c
index f257c24e64..3aa1081ff0 100644
--- a/hw/pci-host/dino.c
+++ b/hw/pci-host/dino.c
@@ -104,7 +104,7 @@ static MemTxResult dino_chip_read_with_attrs(void *opaque, hwaddr addr,
     switch (addr) {
     case DINO_PCI_IO_DATA ... DINO_PCI_IO_DATA + 3:
         /* Read from PCI IO space. */
-        io = &address_space_io;
+        io = get_address_space_io();
         ioaddr = phb->config_reg + (addr & 3);
         switch (size) {
         case 1:
@@ -199,7 +199,7 @@ static MemTxResult dino_chip_write_with_attrs(void *opaque, hwaddr addr,
     switch (addr) {
     case DINO_IO_DATA ... DINO_PCI_IO_DATA + 3:
         /* Write into PCI IO space.  */
-        io = &address_space_io;
+        io = get_address_space_io();
         ioaddr = phb->config_reg + (addr & 3);
         switch (size) {
         case 1:
@@ -382,7 +382,7 @@ static void dino_set_irq(void *opaque, int irq, int level)
         s->ilr = old_ilr | bit;
         if (ena & s->imr) {
             uint32_t iar = (ena & s->icr ? s->iar1 : s->iar0);
-            stl_be_phys(&address_space_memory, iar & -32, iar & 31);
+            stl_be_phys(get_address_space_memory(), iar & -32, iar & 31);
         }
     } else {
         s->ilr = old_ilr & ~bit;
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index af8575c007..d495a929b5 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -716,7 +716,7 @@ static bool pnv_phb3_resolve_pe(PnvPhb3DMASpace *ds)
     bus_num = pci_bus_num(ds->bus);
     addr = rtt & PHB_RTT_BASE_ADDRESS_MASK;
     addr += 2 * ((bus_num << 8) | ds->devfn);
-    if (dma_memory_read(&address_space_memory, addr, &rte,
+    if (dma_memory_read(get_address_space_memory(), addr, &rte,
                         sizeof(rte), MEMTXATTRS_UNSPECIFIED)) {
         phb3_error(ds->phb, "Failed to read RTT entry at 0x%"PRIx64, addr);
         /* Set error bits ? fence ? ... */
@@ -797,7 +797,7 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds, hwaddr addr,
 
             /* Grab the TCE address */
             taddr = base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) << 3);
-            if (dma_memory_read(&address_space_memory, taddr, &tce,
+            if (dma_memory_read(get_address_space_memory(), taddr, &tce,
                                 sizeof(tce), MEMTXATTRS_UNSPECIFIED)) {
                 phb3_error(phb, "Failed to read TCE at 0x%"PRIx64, taddr);
                 return;
@@ -843,7 +843,7 @@ static IOMMUTLBEntry pnv_phb3_translate_iommu(IOMMUMemoryRegion *iommu,
     int tve_sel;
     uint64_t tve, cfg;
     IOMMUTLBEntry ret = {
-        .target_as = &address_space_memory,
+        .target_as = get_address_space_memory(),
         .iova = addr,
         .translated_addr = 0,
         .addr_mask = ~(hwaddr)0,
diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
index 2f4112907b..120009d1dc 100644
--- a/hw/pci-host/pnv_phb3_msi.c
+++ b/hw/pci-host/pnv_phb3_msi.c
@@ -52,7 +52,7 @@ static bool phb3_msi_read_ive(PnvPHB3 *phb, int srcno, uint64_t *out_ive)
         return false;
     }
 
-    if (dma_memory_read(&address_space_memory, ive_addr,
+    if (dma_memory_read(get_address_space_memory(), ive_addr,
                         &ive, sizeof(ive), MEMTXATTRS_UNSPECIFIED)) {
         qemu_log_mask(LOG_GUEST_ERROR, "Failed to read IVE at 0x%" PRIx64,
                       ive_addr);
@@ -73,7 +73,7 @@ static void phb3_msi_set_p(Phb3MsiState *msi, int srcno, uint8_t gen)
         return;
     }
 
-    if (dma_memory_write(&address_space_memory, ive_addr + 4,
+    if (dma_memory_write(get_address_space_memory(), ive_addr + 4,
                          &p, 1, MEMTXATTRS_UNSPECIFIED)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "Failed to write IVE (set P) at 0x%" PRIx64, ive_addr);
@@ -90,7 +90,7 @@ static void phb3_msi_set_q(Phb3MsiState *msi, int srcno)
         return;
     }
 
-    if (dma_memory_write(&address_space_memory, ive_addr + 5,
+    if (dma_memory_write(get_address_space_memory(), ive_addr + 5,
                          &q, 1, MEMTXATTRS_UNSPECIFIED)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "Failed to write IVE (set Q) at 0x%" PRIx64, ive_addr);
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 824e1a73fb..42959a5b23 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1192,7 +1192,7 @@ static bool pnv_phb4_resolve_pe(PnvPhb4DMASpace *ds)
     bus_num = pci_bus_num(ds->bus);
     addr = rtt & PHB_RTT_BASE_ADDRESS_MASK;
     addr += 2 * PCI_BUILD_BDF(bus_num, ds->devfn);
-    if (dma_memory_read(&address_space_memory, addr, &rte,
+    if (dma_memory_read(get_address_space_memory(), addr, &rte,
                         sizeof(rte), MEMTXATTRS_UNSPECIFIED)) {
         phb_error(ds->phb, "Failed to read RTT entry at 0x%"PRIx64, addr);
         /* Set error bits ? fence ? ... */
@@ -1264,7 +1264,7 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpace *ds, hwaddr addr,
 
             /* Grab the TCE address */
             taddr = base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) << 3);
-            if (dma_memory_read(&address_space_memory, taddr, &tce,
+            if (dma_memory_read(get_address_space_memory(), taddr, &tce,
                                 sizeof(tce), MEMTXATTRS_UNSPECIFIED)) {
                 phb_error(ds->phb, "Failed to read TCE at 0x%"PRIx64, taddr);
                 return;
@@ -1310,7 +1310,7 @@ static IOMMUTLBEntry pnv_phb4_translate_iommu(IOMMUMemoryRegion *iommu,
     int tve_sel;
     uint64_t tve, cfg;
     IOMMUTLBEntry ret = {
-        .target_as = &address_space_memory,
+        .target_as = get_address_space_memory(),
         .iova = addr,
         .translated_addr = 0,
         .addr_mask = ~(hwaddr)0,
@@ -1633,7 +1633,7 @@ static void pnv_phb4_xive_notify_abt(PnvPHB4 *phb, uint32_t srcno,
 
     trace_pnv_phb4_xive_notify_ic(addr, data);
 
-    address_space_stq_be(&address_space_memory, addr, data,
+    address_space_stq_be(get_address_space_memory(), addr, data,
                          MEMTXATTRS_UNSPECIFIED, &result);
     if (result != MEMTX_OK) {
         phb_error(phb, "trigger failed @%"HWADDR_PRIx "\n", addr);
@@ -1655,7 +1655,7 @@ static void pnv_phb4_xive_notify_ic(PnvPHB4 *phb, uint32_t srcno,
 
     trace_pnv_phb4_xive_notify_ic(notif_port, data);
 
-    address_space_stq_be(&address_space_memory, notif_port, data,
+    address_space_stq_be(get_address_space_memory(), notif_port, data,
                          MEMTXATTRS_UNSPECIFIED, &result);
     if (result != MEMTX_OK) {
         phb_error(phb, "trigger failed @%"HWADDR_PRIx "\n", notif_port);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2f450f6a72..8a28d55e7a 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2829,7 +2829,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
     if (!pci_bus_bypass_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
         return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
     }
-    return &address_space_memory;
+    return get_address_space_memory();
 }
 
 void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque)
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 98045ed3d2..981cb8417d 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -662,7 +662,7 @@ static void pnv_psi_notify(XiveNotifier *xf, uint32_t srcno, bool pq_checked)
         return;
     }
 
-    address_space_stq_be(&address_space_memory, notify_addr, data,
+    address_space_stq_be(get_address_space_memory(), notify_addr, data,
                          MEMTXATTRS_UNSPECIFIED, &result);
     if (result != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: trigger failed @%"
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index fb790b61e4..92598f6cce 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3450,8 +3450,8 @@ void spapr_do_system_reset_on_cpu(CPUState *cs, run_on_cpu_data arg)
         }
 
         addr = rtas_addr + RTAS_ERROR_LOG_MAX + cs->cpu_index * sizeof(uint64_t)*2;
-        stq_be_phys(&address_space_memory, addr, env->gpr[3]);
-        stq_be_phys(&address_space_memory, addr + sizeof(uint64_t), 0);
+        stq_be_phys(get_address_space_memory(), addr, env->gpr[3]);
+        stq_be_phys(get_address_space_memory(), addr + sizeof(uint64_t), 0);
         env->gpr[3] = addr;
     }
     ppc_cpu_do_system_reset(cs);
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 4508e40814..eb9776f123 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -853,7 +853,7 @@ static void spapr_mce_dispatch_elog(SpaprMachineState *spapr, PowerPCCPU *cpu,
      */
     spapr->fwnmi_machine_check_interlock = cpu->vcpu_id;
 
-    stq_be_phys(&address_space_memory, rtas_addr + RTAS_ERROR_LOG_OFFSET,
+    stq_be_phys(get_address_space_memory(), rtas_addr + RTAS_ERROR_LOG_OFFSET,
                 env->gpr[3]);
     cpu_physical_memory_write(rtas_addr + RTAS_ERROR_LOG_OFFSET +
                               sizeof(env->gpr[3]), &log, sizeof(log));
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index a8d4a6bcf0..5296225d95 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1055,8 +1055,8 @@ static uint32_t cas_check_pvr(PowerPCCPU *cpu, uint32_t max_compat,
     for (i = 0; i < 512; ++i) {
         uint32_t pvr, pvr_mask;
 
-        pvr_mask = ldl_be_phys(&address_space_memory, *addr);
-        pvr = ldl_be_phys(&address_space_memory, *addr + 4);
+        pvr_mask = ldl_be_phys(get_address_space_memory(), *addr);
+        pvr = ldl_be_phys(get_address_space_memory(), *addr + 4);
         *addr += 8;
 
         if (~pvr_mask & pvr) {
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 63e34d457a..7917d81db0 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -118,7 +118,7 @@ static IOMMUTLBEntry spapr_tce_translate_iommu(IOMMUMemoryRegion *iommu,
     SpaprTceTable *tcet = container_of(iommu, SpaprTceTable, iommu);
     uint64_t tce;
     IOMMUTLBEntry ret = {
-        .target_as = &address_space_memory,
+        .target_as = get_address_space_memory(),
         .iova = 0,
         .translated_addr = 0,
         .addr_mask = ~(hwaddr)0,
@@ -462,7 +462,7 @@ static target_ulong put_tce_emu(SpaprTceTable *tcet, target_ulong ioba,
 
     tcet->table[index] = tce;
 
-    event.entry.target_as = &address_space_memory,
+    event.entry.target_as = get_address_space_memory(),
     event.entry.iova = (ioba - tcet->bus_offset) & page_mask;
     event.entry.translated_addr = tce & page_mask;
     event.entry.addr_mask = ~page_mask;
diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
index b2567caa5c..07cfe3ab6b 100644
--- a/hw/ppc/spapr_ovec.c
+++ b/hw/ppc/spapr_ovec.c
@@ -163,14 +163,14 @@ static target_ulong vector_addr(target_ulong table_addr, int vector)
     uint16_t vector_count, vector_len;
     int i;
 
-    vector_count = ldub_phys(&address_space_memory, table_addr) + 1;
+    vector_count = ldub_phys(get_address_space_memory(), table_addr) + 1;
     if (vector > vector_count) {
         return 0;
     }
     table_addr++; /* skip nr option vectors */
 
     for (i = 0; i < vector - 1; i++) {
-        vector_len = ldub_phys(&address_space_memory, table_addr) + 1;
+        vector_len = ldub_phys(get_address_space_memory(), table_addr) + 1;
         table_addr += vector_len + 1; /* bit-vector + length byte */
     }
     return table_addr;
@@ -192,12 +192,12 @@ SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int vector)
         return NULL;
     }
 
-    vector_len = ldub_phys(&address_space_memory, addr++) + 1;
+    vector_len = ldub_phys(get_address_space_memory(), addr++) + 1;
     g_assert(vector_len <= OV_MAXBYTES);
     ov = spapr_ovec_new();
 
     for (i = 0; i < vector_len; i++) {
-        uint8_t entry = ldub_phys(&address_space_memory, addr + i);
+        uint8_t entry = ldub_phys(get_address_space_memory(), addr + i);
         if (entry) {
             trace_spapr_ovec_parse_vector(vector, i + 1, vector_len, entry);
             guest_byte_to_bitmap(entry, ov->bitmap, i * BITS_PER_BYTE);
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index d58b65e88f..17c01adfd4 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -259,7 +259,7 @@ static inline int sysparm_st(target_ulong addr, target_ulong len,
     if (len < 2) {
         return RTAS_OUT_SYSPARM_PARAM_ERROR;
     }
-    stw_be_phys(&address_space_memory, phys, vallen);
+    stw_be_phys(get_address_space_memory(), phys, vallen);
     cpu_physical_memory_write(phys + 2, val, MIN(len - 2, vallen));
     return RTAS_OUT_SUCCESS;
 }
diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
index fd723d91f3..d13fe3744f 100644
--- a/hw/remote/iommu.c
+++ b/hw/remote/iommu.c
@@ -67,7 +67,7 @@ void remote_iommu_unplug_dev(PCIDevice *pci_dev)
     AddressSpace *as = pci_device_iommu_address_space(pci_dev);
     RemoteIommuElem *elem = NULL;
 
-    if (as == &address_space_memory) {
+    if (as == get_address_space_memory()) {
         return;
     }
 
diff --git a/hw/remote/message.c b/hw/remote/message.c
index 50f6bf2d49..792104bb2c 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -143,7 +143,7 @@ static void process_bar_write(QIOChannel *ioc, MPQemuMsg *msg, Error **errp)
     ERRP_GUARD();
     BarAccessMsg *bar_access = &msg->data.bar_access;
     AddressSpace *as =
-        bar_access->memory ? &address_space_memory : &address_space_io;
+        bar_access->memory ? get_address_space_memory() : get_address_space_io();
     MPQemuMsg ret = { 0 };
     MemTxResult res;
     uint64_t val;
@@ -184,7 +184,7 @@ static void process_bar_read(QIOChannel *ioc, MPQemuMsg *msg, Error **errp)
     MemTxResult res;
     uint64_t val = 0;
 
-    as = bar_access->memory ? &address_space_memory : &address_space_io;
+    as = bar_access->memory ? get_address_space_memory() : get_address_space_io();
 
     if (!is_power_of_2(bar_access->size) ||
        (bar_access->size > sizeof(uint64_t))) {
diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
index eb9918fe72..e357fb9abf 100644
--- a/hw/remote/proxy-memory-listener.c
+++ b/hw/remote/proxy-memory-listener.c
@@ -222,5 +222,5 @@ void proxy_memory_listener_configure(ProxyMemoryListener *proxy_listener,
     proxy_listener->listener.name = "proxy";
 
     memory_listener_register(&proxy_listener->listener,
-                             &address_space_memory);
+                             get_address_space_memory());
 }
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 1ae7596873..381b5251b7 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -240,7 +240,7 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
     qemu_fdt_dumpdtb(fdt, fdtsize);
 
     rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
-                          &address_space_memory);
+                          get_address_space_memory());
 
     return fdt_addr;
 }
@@ -279,7 +279,7 @@ void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
 
     rom_add_blob_fixed_as("mrom.finfo", &dinfo, dinfo_len,
                            rom_base + reset_vec_size,
-                           &address_space_memory);
+                           get_address_space_memory());
 }
 
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
@@ -323,7 +323,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
         reset_vec[i] = cpu_to_le32(reset_vec[i]);
     }
     rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
-                          rom_base, &address_space_memory);
+                          rom_base, get_address_space_memory());
     riscv_rom_copy_firmware_info(machine, rom_base, rom_size, sizeof(reset_vec),
                                  kernel_entry);
 }
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index d65d2fd869..085a95725b 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -111,7 +111,7 @@ static void sifive_e_machine_init(MachineState *machine)
         reset_vec[i] = cpu_to_le32(reset_vec[i]);
     }
     rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
-                          memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
+                          memmap[SIFIVE_E_DEV_MROM].base, get_address_space_memory());
 
     if (machine->kernel_filename) {
         riscv_load_kernel(machine->kernel_filename,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e4c814a3ea..97109d1781 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -664,7 +664,7 @@ static void sifive_u_machine_init(MachineState *machine)
         reset_vec[i] = cpu_to_le32(reset_vec[i]);
     }
     rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
-                          memmap[SIFIVE_U_DEV_MROM].base, &address_space_memory);
+                          memmap[SIFIVE_U_DEV_MROM].base, get_address_space_memory());
 
     riscv_rom_copy_firmware_info(machine, memmap[SIFIVE_U_DEV_MROM].base,
                                  memmap[SIFIVE_U_DEV_MROM].size,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index befa9d2c26..bca9313a46 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1118,7 +1118,7 @@ static FWCfgState *create_fw_cfg(const MachineState *mc)
     FWCfgState *fw_cfg;
 
     fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
-                                  &address_space_memory);
+                                  get_address_space_memory());
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)mc->smp.cpus);
 
     return fw_cfg;
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 7d9523f811..2b8148c05e 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -830,7 +830,7 @@ static int ccw_dstream_rw_noflags(CcwDataStream *cds, void *buff, int len,
         goto incr;
     }
     if (!cds->do_skip) {
-        ret = address_space_rw(&address_space_memory, cds->cda,
+        ret = address_space_rw(get_address_space_memory(), cds->cda,
                                MEMTXATTRS_UNSPECIFIED, buff, len, op);
     } else {
         ret = MEMTX_OK;
@@ -872,7 +872,7 @@ static inline int ida_read_next_idaw(CcwDataStream *cds)
         if (idaw_addr & 0x07 || !cds_ccw_addrs_ok(idaw_addr, 0, ccw_fmt1)) {
             return -EINVAL; /* channel program check */
         }
-        ret = address_space_read(&address_space_memory, idaw_addr,
+        ret = address_space_read(get_address_space_memory(), idaw_addr,
                                  MEMTXATTRS_UNSPECIFIED, &idaw.fmt2,
                                  sizeof(idaw.fmt2));
         cds->cda = be64_to_cpu(idaw.fmt2);
@@ -881,7 +881,7 @@ static inline int ida_read_next_idaw(CcwDataStream *cds)
         if (idaw_addr & 0x03 || !cds_ccw_addrs_ok(idaw_addr, 0, ccw_fmt1)) {
             return -EINVAL; /* channel program check */
         }
-        ret = address_space_read(&address_space_memory, idaw_addr,
+        ret = address_space_read(get_address_space_memory(), idaw_addr,
                                  MEMTXATTRS_UNSPECIFIED, &idaw.fmt1,
                                  sizeof(idaw.fmt1));
         cds->cda = be64_to_cpu(idaw.fmt1);
@@ -932,7 +932,7 @@ static int ccw_dstream_rw_ida(CcwDataStream *cds, void *buff, int len,
         iter_len = MIN(len, cont_left);
         if (op != CDS_OP_A) {
             if (!cds->do_skip) {
-                ret = address_space_rw(&address_space_memory, cds->cda,
+                ret = address_space_rw(get_address_space_memory(), cds->cda,
                                        MEMTXATTRS_UNSPECIFIED, buff, iter_len,
                                        op);
             } else {
@@ -1578,12 +1578,12 @@ static void css_update_chnmon(SubchDev *sch)
         /* Format 1, per-subchannel area. */
         uint32_t count;
 
-        count = address_space_ldl(&address_space_memory,
+        count = address_space_ldl(get_address_space_memory(),
                                   sch->curr_status.mba,
                                   MEMTXATTRS_UNSPECIFIED,
                                   NULL);
         count++;
-        address_space_stl(&address_space_memory, sch->curr_status.mba, count,
+        address_space_stl(get_address_space_memory(), sch->curr_status.mba, count,
                           MEMTXATTRS_UNSPECIFIED, NULL);
     } else {
         /* Format 0, global area. */
@@ -1591,12 +1591,12 @@ static void css_update_chnmon(SubchDev *sch)
         uint16_t count;
 
         offset = sch->curr_status.pmcw.mbi << 5;
-        count = address_space_lduw(&address_space_memory,
+        count = address_space_lduw(get_address_space_memory(),
                                    channel_subsys.chnmon_area + offset,
                                    MEMTXATTRS_UNSPECIFIED,
                                    NULL);
         count++;
-        address_space_stw(&address_space_memory,
+        address_space_stw(get_address_space_memory(),
                           channel_subsys.chnmon_area + offset, count,
                           MEMTXATTRS_UNSPECIFIED, NULL);
     }
diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
index dfc6dfd89c..da3c02d0e4 100644
--- a/hw/s390x/ipl.h
+++ b/hw/s390x/ipl.h
@@ -251,7 +251,7 @@ static inline bool ipl_valid_pv_header(IplParameterBlock *iplb)
             return false;
         }
 
-        if (!address_space_access_valid(&address_space_memory,
+        if (!address_space_access_valid(get_address_space_memory(),
                                         ipib_pv->pv_header_addr,
                                         ipib_pv->pv_header_len,
                                         false,
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 4b2bdd94b3..a6174b9659 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -447,7 +447,7 @@ static uint64_t table_translate(S390IOTLBEntry *entry, uint64_t to, int8_t ett,
     uint16_t err = 0;
 
     tx = get_table_index(entry->iova, ett);
-    te = address_space_ldq(&address_space_memory, to + tx * sizeof(uint64_t),
+    te = address_space_ldq(get_address_space_memory(), to + tx * sizeof(uint64_t),
                            MEMTXATTRS_UNSPECIFIED, NULL);
 
     if (!te) {
@@ -529,7 +529,7 @@ static IOMMUTLBEntry s390_translate_iommu(IOMMUMemoryRegion *mr, hwaddr addr,
     uint64_t iova = addr & TARGET_PAGE_MASK;
     uint16_t error = 0;
     IOMMUTLBEntry ret = {
-        .target_as = &address_space_memory,
+        .target_as = get_address_space_memory(),
         .iova = 0,
         .translated_addr = 0,
         .addr_mask = ~(hwaddr)0,
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 6d400d4147..3e6951d27e 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -610,7 +610,7 @@ static uint32_t s390_pci_update_iotlb(S390PCIIOMMU *iommu,
     IOMMUTLBEvent event = {
         .type = entry->perm ? IOMMU_NOTIFIER_MAP : IOMMU_NOTIFIER_UNMAP,
         .entry = {
-            .target_as = &address_space_memory,
+            .target_as = get_address_space_memory(),
             .iova = entry->iova,
             .translated_addr = entry->translated_addr,
             .perm = entry->perm,
@@ -976,22 +976,22 @@ static int fmb_do_update(S390PCIBusDevice *pbdev, int offset, uint64_t val,
 
     switch (len) {
     case 8:
-        address_space_stq_be(&address_space_memory, dst, val,
+        address_space_stq_be(get_address_space_memory(), dst, val,
                              MEMTXATTRS_UNSPECIFIED,
                              &ret);
         break;
     case 4:
-        address_space_stl_be(&address_space_memory, dst, val,
+        address_space_stl_be(get_address_space_memory(), dst, val,
                              MEMTXATTRS_UNSPECIFIED,
                              &ret);
         break;
     case 2:
-        address_space_stw_be(&address_space_memory, dst, val,
+        address_space_stw_be(get_address_space_memory(), dst, val,
                              MEMTXATTRS_UNSPECIFIED,
                              &ret);
         break;
     case 1:
-        address_space_stb(&address_space_memory, dst, val,
+        address_space_stb(get_address_space_memory(), dst, val,
                           MEMTXATTRS_UNSPECIFIED,
                           &ret);
         break;
diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 5024faf411..aed7759f1a 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -87,7 +87,7 @@ void hmp_info_skeys(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    if (!address_space_access_valid(&address_space_memory,
+    if (!address_space_access_valid(get_address_space_memory(),
                                     addr & TARGET_PAGE_MASK, TARGET_PAGE_SIZE,
                                     false, MEMTXATTRS_UNSPECIFIED)) {
         monitor_printf(mon, "Error: The given address is not valid\n");
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index e33e5207ab..502b87bb13 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -506,7 +506,7 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
         if (!ccw.cda) {
             ret = -EFAULT;
         } else {
-            address_space_stb(&address_space_memory, ccw.cda, vdev->status,
+            address_space_stb(get_address_space_memory(), ccw.cda, vdev->status,
                                         MEMTXATTRS_UNSPECIFIED, NULL);
             sch->curr_status.scsw.count = ccw.count - sizeof(vdev->status);
             ret = 0;
@@ -893,12 +893,12 @@ static void virtio_ccw_notify(DeviceState *d, uint16_t vector)
             }
         } else {
             assert(vector < NR_CLASSIC_INDICATOR_BITS);
-            indicators = address_space_ldq(&address_space_memory,
+            indicators = address_space_ldq(get_address_space_memory(),
                                            dev->indicators->addr,
                                            MEMTXATTRS_UNSPECIFIED,
                                            NULL);
             indicators |= 1ULL << vector;
-            address_space_stq(&address_space_memory, dev->indicators->addr,
+            address_space_stq(get_address_space_memory(), dev->indicators->addr,
                               indicators, MEMTXATTRS_UNSPECIFIED, NULL);
             css_conditional_io_interrupt(sch);
         }
@@ -906,12 +906,12 @@ static void virtio_ccw_notify(DeviceState *d, uint16_t vector)
         if (!dev->indicators2) {
             return;
         }
-        indicators = address_space_ldq(&address_space_memory,
+        indicators = address_space_ldq(get_address_space_memory(),
                                        dev->indicators2->addr,
                                        MEMTXATTRS_UNSPECIFIED,
                                        NULL);
         indicators |= 1ULL;
-        address_space_stq(&address_space_memory, dev->indicators2->addr,
+        address_space_stq(get_address_space_memory(), dev->indicators2->addr,
                           indicators, MEMTXATTRS_UNSPECIFIED, NULL);
         css_conditional_io_interrupt(sch);
     }
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 0e5e988927..cfcb59246b 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1519,7 +1519,7 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error **errp)
         address_space_init(s->dma_as, s->dma_mr, "sdhci-dma");
     } else {
         /* use system_memory() if property "dma" not set */
-        s->dma_as = &address_space_memory;
+        s->dma_as = get_address_space_memory();
     }
 
     sysbus_init_irq(sbd, &s->irq);
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 39fc4f19d9..6ff1357493 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -330,9 +330,9 @@ static void r2d_init(MachineState *machine)
         }
 
         /* initialization which should be done by firmware */
-        address_space_stl(&address_space_memory, SH7750_BCR1, 1 << 3,
+        address_space_stl(get_address_space_memory(), SH7750_BCR1, 1 << 3,
                           MEMTXATTRS_UNSPECIFIED, NULL); /* cs3 SDRAM */
-        address_space_stw(&address_space_memory, SH7750_BCR2, 3 << (3 * 2),
+        address_space_stw(get_address_space_memory(), SH7750_BCR2, 3 << (3 * 2),
                           MEMTXATTRS_UNSPECIFIED, NULL); /* cs3 32bit */
         /* Start from P2 area */
         reset_info->vector = (SDRAM_BASE + LINUX_LOAD_OFFSET) | 0xa0000000;
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index d9288326d6..d3e315884d 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -560,7 +560,7 @@ static void idreg_init(hwaddr addr)
     sysbus_realize_and_unref(s, &error_fatal);
 
     sysbus_mmio_map(s, 0, addr);
-    address_space_write_rom(&address_space_memory, addr,
+    address_space_write_rom(get_address_space_memory(), addr,
                             MEMTXATTRS_UNSPECIFIED,
                             idreg_data, sizeof(idreg_data));
 }
diff --git a/hw/sparc/sun4m_iommu.c b/hw/sparc/sun4m_iommu.c
index 71f5465249..9783942172 100644
--- a/hw/sparc/sun4m_iommu.c
+++ b/hw/sparc/sun4m_iommu.c
@@ -254,7 +254,7 @@ static uint32_t iommu_page_get_flags(IOMMUState *s, hwaddr addr)
     iopte = s->regs[IOMMU_BASE] << 4;
     addr &= ~s->iostart;
     iopte += (addr >> (IOMMU_PAGE_SHIFT - 2)) & ~3;
-    ret = address_space_ldl_be(&address_space_memory, iopte,
+    ret = address_space_ldl_be(get_address_space_memory(), iopte,
                                MEMTXATTRS_UNSPECIFIED, NULL);
     trace_sun4m_iommu_page_get_flags(pa, iopte, ret);
     return ret;
@@ -294,7 +294,7 @@ static IOMMUTLBEntry sun4m_translate_iommu(IOMMUMemoryRegion *iommu,
     int is_write = (flags & IOMMU_WO) ? 1 : 0;
     uint32_t pte;
     IOMMUTLBEntry ret = {
-        .target_as = &address_space_memory,
+        .target_as = get_address_space_memory(),
         .iova = 0,
         .translated_addr = 0,
         .addr_mask = ~(hwaddr)0,
diff --git a/hw/sparc64/sun4u_iommu.c b/hw/sparc64/sun4u_iommu.c
index 1c1dca712e..1059d8a3c8 100644
--- a/hw/sparc64/sun4u_iommu.c
+++ b/hw/sparc64/sun4u_iommu.c
@@ -81,7 +81,7 @@ static IOMMUTLBEntry sun4u_translate_iommu(IOMMUMemoryRegion *iommu,
     uint64_t tte;
     uint32_t tsbsize;
     IOMMUTLBEntry ret = {
-        .target_as = &address_space_memory,
+        .target_as = get_address_space_memory(),
         .iova = 0,
         .translated_addr = 0,
         .addr_mask = ~(hwaddr)0,
@@ -156,7 +156,7 @@ static IOMMUTLBEntry sun4u_translate_iommu(IOMMUMemoryRegion *iommu,
         }
     }
 
-    tte = address_space_ldq_be(&address_space_memory, baseaddr + offset,
+    tte = address_space_ldq_be(get_address_space_memory(), baseaddr + offset,
                                MEMTXATTRS_UNSPECIFIED, NULL);
 
     if (!(tte & IOMMU_TTE_DATA_V)) {
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 9520471be2..7e67432cb7 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -208,7 +208,7 @@ static void update_irq(struct HPETTimer *timer, int set)
             qemu_irq_lower(s->irqs[route]);
         }
     } else if (timer_fsb_route(timer)) {
-        address_space_stl_le(&address_space_memory, timer->fsb >> 32,
+        address_space_stl_le(get_address_space_memory(), timer->fsb >> 32,
                              timer->fsb & 0xffffffff, MEMTXATTRS_UNSPECIFIED,
                              NULL);
     } else if (timer->config & HPET_TN_TYPE_LEVEL) {
diff --git a/hw/usb/hcd-ehci-pci.c b/hw/usb/hcd-ehci-pci.c
index 4c37c8e227..f73a7b56df 100644
--- a/hw/usb/hcd-ehci-pci.c
+++ b/hw/usb/hcd-ehci-pci.c
@@ -132,7 +132,7 @@ static void usb_ehci_pci_write_config(PCIDevice *dev, uint32_t addr,
         return;
     }
     busmaster = pci_get_word(dev->config + PCI_COMMAND) & PCI_COMMAND_MASTER;
-    i->ehci.as = busmaster ? pci_get_address_space(dev) : &address_space_memory;
+    i->ehci.as = busmaster ? pci_get_address_space(dev) : get_address_space_memory();
 }
 
 static Property ehci_pci_properties[] = {
diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index a12e218848..b44ad07d52 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -68,7 +68,7 @@ static void ehci_sysbus_init(Object *obj)
     s->opregbase = sec->opregbase;
     s->portscbase = sec->portscbase;
     s->portnr = sec->portnr;
-    s->as = &address_space_memory;
+    s->as = get_address_space_memory();
 
     usb_ehci_init(s, DEVICE(obj));
     sysbus_init_mmio(d, &s->mem);
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 895b29fb86..b6db6b2e5a 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1901,7 +1901,7 @@ static void ohci_realize_pxa(DeviceState *dev, Error **errp)
 
     usb_ohci_init(&s->ohci, dev, s->num_ports, s->dma_offset,
                   s->masterbus, s->firstport,
-                  &address_space_memory, ohci_sysbus_die, &err);
+                  get_address_space_memory(), ohci_sysbus_die, &err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index a14e438196..1ca6f00bd4 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -47,7 +47,7 @@ static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
         s->xhci.as =  g_malloc0(sizeof(AddressSpace));
         address_space_init(s->xhci.as, s->xhci.dma_mr, NULL);
     } else {
-        s->xhci.as = &address_space_memory;
+        s->xhci.as = get_address_space_memory();
     }
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->xhci.mem);
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index e0dd561e85..f22e81bde3 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -81,7 +81,7 @@ static VFIOGroup *vfio_ap_get_group(VFIOAPDevice *vapdev, Error **errp)
 
     g_free(group_path);
 
-    return vfio_get_group(groupid, &address_space_memory, errp);
+    return vfio_get_group(groupid, get_address_space_memory(), errp);
 }
 
 static void vfio_ap_realize(DeviceState *dev, Error **errp)
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 0354737666..da147fe507 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -650,7 +650,7 @@ static VFIOGroup *vfio_ccw_get_group(S390CCWDevice *cdev, Error **errp)
         return NULL;
     }
 
-    return vfio_get_group(groupid, &address_space_memory, errp);
+    return vfio_get_group(groupid, get_address_space_memory(), errp);
 }
 
 static void vfio_ccw_realize(DeviceState *dev, Error **errp)
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ace9562a9b..860d8220a7 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -588,7 +588,7 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
      * this IOMMU to its immediate target.  We need to translate
      * it the rest of the way through to memory.
      */
-    mr = address_space_translate(&address_space_memory,
+    mr = address_space_translate(get_address_space_memory(),
                                  iotlb->translated_addr,
                                  &xlat, &len, writable,
                                  MEMTXATTRS_UNSPECIFIED);
@@ -671,7 +671,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     trace_vfio_iommu_map_notify(iotlb->perm == IOMMU_NONE ? "UNMAP" : "MAP",
                                 iova, iova + iotlb->addr_mask);
 
-    if (iotlb->target_as != &address_space_memory) {
+    if (iotlb->target_as != get_address_space_memory()) {
         error_report("Wrong target AS \"%s\", only system memory is allowed",
                      iotlb->target_as->name ? iotlb->target_as->name : "none");
         return;
@@ -1352,7 +1352,7 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 
     trace_vfio_iommu_map_dirty_notify(iova, iova + iotlb->addr_mask);
 
-    if (iotlb->target_as != &address_space_memory) {
+    if (iotlb->target_as != get_address_space_memory()) {
         error_report("Wrong target AS \"%s\", only system memory is allowed",
                      iotlb->target_as->name ? iotlb->target_as->name : "none");
         return;
@@ -2158,7 +2158,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
             container->prereg_listener = vfio_prereg_listener;
 
             memory_listener_register(&container->prereg_listener,
-                                     &address_space_memory);
+                                     get_address_space_memory());
             if (container->error) {
                 memory_listener_unregister(&container->prereg_listener);
                 ret = -1;
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 5af73f9287..7137e5c7f3 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -577,7 +577,7 @@ static int vfio_base_device_init(VFIODevice *vbasedev, Error **errp)
 
     trace_vfio_platform_base_device_init(vbasedev->name, groupid);
 
-    group = vfio_get_group(groupid, &address_space_memory, errp);
+    group = vfio_get_group(groupid, get_address_space_memory(), errp);
     if (!group) {
         return -ENOENT;
     }
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 7468e44b87..269ccab876 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1115,7 +1115,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     }
 
     if (started) {
-        memory_listener_register(&v->listener, &address_space_memory);
+        memory_listener_register(&v->listener, get_address_space_memory());
         return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
     } else {
         vhost_vdpa_reset_device(dev);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index f758f177bb..57cbe08a6c 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1449,7 +1449,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     hdev->log_size = 0;
     hdev->log_enabled = false;
     hdev->started = false;
-    memory_listener_register(&hdev->memory_listener, &address_space_memory);
+    memory_listener_register(&hdev->memory_listener, get_address_space_memory());
     QLIST_INSERT_HEAD(&vhost_devices, hdev, entry);
 
     if (used_memslots > hdev->vhost_ops->vhost_backend_memslots_limit(hdev)) {
diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index 896feb37a1..8cac66b85a 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -78,7 +78,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
         return;
     }
 
-    vdev->dma_as = &address_space_memory;
+    vdev->dma_as = get_address_space_memory();
     if (has_iommu) {
         vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
         /*
@@ -89,7 +89,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
         virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
         if (klass->get_dma_as) {
             vdev->dma_as = klass->get_dma_as(qbus->parent);
-            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
+            if (!vdev_has_iommu && vdev->dma_as != get_address_space_memory()) {
                 error_setg(errp,
                        "iommu_platform=true is not supported by the device");
                 return;
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 62e07ec2e4..e93323c584 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -240,7 +240,7 @@ static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr virt_start,
                                   paddr, perm);
 
     event.type = IOMMU_NOTIFIER_MAP;
-    event.entry.target_as = &address_space_memory;
+    event.entry.target_as = get_address_space_memory();
     event.entry.perm = perm;
     event.entry.translated_addr = paddr;
 
@@ -259,7 +259,7 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
     trace_virtio_iommu_notify_unmap(mr->parent_obj.name, virt_start, virt_end);
 
     event.type = IOMMU_NOTIFIER_UNMAP;
-    event.entry.target_as = &address_space_memory;
+    event.entry.target_as = get_address_space_memory();
     event.entry.perm = IOMMU_NONE;
     event.entry.translated_addr = 0;
 
@@ -859,7 +859,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     interval.high = addr + 1;
 
     IOMMUTLBEntry entry = {
-        .target_as = &address_space_memory,
+        .target_as = get_address_space_memory(),
         .iova = addr,
         .translated_addr = addr,
         .addr_mask = (1 << ctz32(s->config.page_size_mask)) - 1,
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index a50c5a57d7..dc2165eb59 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1134,7 +1134,7 @@ static bool virtio_pci_iommu_enabled(DeviceState *d)
     PCIDevice *dev = &proxy->pci_dev;
     AddressSpace *dma_as = pci_device_iommu_address_space(dev);
 
-    if (dma_as == &address_space_memory) {
+    if (dma_as == get_address_space_memory()) {
         return false;
     }
 
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 0ec7e52183..d3dfd1e818 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -913,8 +913,8 @@ out:
         }
     }
 
-    memory_listener_register(&s->memory_listener, &address_space_memory);
-    memory_listener_register(&s->io_listener, &address_space_io);
+    memory_listener_register(&s->memory_listener, get_address_space_memory());
+    memory_listener_register(&s->io_listener, get_address_space_io());
     s->listener_set = true;
     XEN_PT_LOG(d,
                "Real physical device %02x:%02x.%d registered successfully\n",
diff --git a/include/exec/address-spaces.h b/include/exec/address-spaces.h
index db8bfa9a92..d5c8cbd718 100644
--- a/include/exec/address-spaces.h
+++ b/include/exec/address-spaces.h
@@ -33,8 +33,8 @@ MemoryRegion *get_system_memory(void);
  */
 MemoryRegion *get_system_io(void);
 
-extern AddressSpace address_space_memory;
-extern AddressSpace address_space_io;
+AddressSpace *get_address_space_memory(void);
+AddressSpace *get_address_space_io(void);
 
 #endif
 
diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 7c3b1d0f6c..f4a6469d39 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -549,7 +549,7 @@ static ssize_t glue(load_elf, SZ)(const char *name, int fd,
                 } else {
                     MemTxResult res;
 
-                    res = address_space_write(as ? as : &address_space_memory,
+                    res = address_space_write(as ? as : get_address_space_memory(),
                                               addr, MEMTXATTRS_UNSPECIFIED,
                                               data, file_size);
                     if (res != MEMTX_OK) {
@@ -560,7 +560,7 @@ static ssize_t glue(load_elf, SZ)(const char *name, int fd,
                      * from file
                      */
                     if (file_size < mem_size) {
-                        res = address_space_set(as ? as : &address_space_memory,
+                        res = address_space_set(as ? as : get_address_space_memory(),
                                                 addr + file_size, 0,
                                                 mem_size - file_size,
                                                 MEMTXATTRS_UNSPECIFIED);
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 04a95669ab..24e2692a4d 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -848,7 +848,7 @@ static inline uint64_t ppc64_phys_to_real(uint64_t addr)
 
 static inline uint32_t rtas_ld(target_ulong phys, int n)
 {
-    return ldl_be_phys(&address_space_memory,
+    return ldl_be_phys(get_address_space_memory(),
                        ppc64_phys_to_real(phys + 4 * n));
 }
 
@@ -859,7 +859,8 @@ static inline uint64_t rtas_ldq(target_ulong phys, int n)
 
 static inline void rtas_st(target_ulong phys, int n, uint32_t val)
 {
-    stl_be_phys(&address_space_memory, ppc64_phys_to_real(phys + 4 * n), val);
+    stl_be_phys(get_address_space_memory(), ppc64_phys_to_real(phys + 4 * n),
+                val);
 }
 
 typedef void (*spapr_rtas_fn)(PowerPCCPU *cpu, SpaprMachineState *sm,
diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
index f8c0effcaf..c65a88413b 100644
--- a/include/hw/ppc/vof.h
+++ b/include/hw/ppc/vof.h
@@ -54,10 +54,10 @@ struct VofMachineIfClass {
 #define VOF_STACK_SIZE       0x8000
 
 #define VOF_MEM_READ(pa, buf, size) \
-    address_space_read(&address_space_memory, \
+    address_space_read(get_address_space_memory(), \
     (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
 #define VOF_MEM_WRITE(pa, buf, size) \
-    address_space_write(&address_space_memory, \
+    address_space_write(get_address_space_memory(), \
     (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
 
 #define PROM_ERROR          (~0U)
diff --git a/monitor/misc.c b/monitor/misc.c
index 6436a8786b..4f79e59fc0 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -579,7 +579,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
         if (l > line_size)
             l = line_size;
         if (is_physical) {
-            AddressSpace *as = cs ? cs->as : &address_space_memory;
+            AddressSpace *as = cs ? cs->as : get_address_space_memory();
             MemTxResult r = address_space_read(as, addr,
                                                MEMTXATTRS_UNSPECIFIED, buf, l);
             if (r != MEMTX_OK) {
@@ -821,7 +821,7 @@ static void hmp_sum(Monitor *mon, const QDict *qdict)
 
     sum = 0;
     for(addr = start; addr < (start + size); addr++) {
-        uint8_t val = address_space_ldub(&address_space_memory, addr,
+        uint8_t val = address_space_ldub(get_address_space_memory(), addr,
                                          MEMTXATTRS_UNSPECIFIED, NULL);
         /* BSD sum algorithm ('sum' Unix command) */
         sum = (sum >> 1) | (sum << 15);
diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index cb8adb0b93..f47ca28214 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -57,7 +57,7 @@ const MemoryRegionOps unassigned_io_ops = {
 void cpu_outb(uint32_t addr, uint8_t val)
 {
     trace_cpu_out(addr, 'b', val);
-    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
+    address_space_write(get_address_space_io(), addr, MEMTXATTRS_UNSPECIFIED,
                         &val, 1);
 }
 
@@ -67,7 +67,7 @@ void cpu_outw(uint32_t addr, uint16_t val)
 
     trace_cpu_out(addr, 'w', val);
     stw_p(buf, val);
-    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
+    address_space_write(get_address_space_io(), addr, MEMTXATTRS_UNSPECIFIED,
                         buf, 2);
 }
 
@@ -77,7 +77,7 @@ void cpu_outl(uint32_t addr, uint32_t val)
 
     trace_cpu_out(addr, 'l', val);
     stl_p(buf, val);
-    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
+    address_space_write(get_address_space_io(), addr, MEMTXATTRS_UNSPECIFIED,
                         buf, 4);
 }
 
@@ -85,7 +85,7 @@ uint8_t cpu_inb(uint32_t addr)
 {
     uint8_t val;
 
-    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
+    address_space_read(get_address_space_io(), addr, MEMTXATTRS_UNSPECIFIED,
                        &val, 1);
     trace_cpu_in(addr, 'b', val);
     return val;
@@ -96,7 +96,7 @@ uint16_t cpu_inw(uint32_t addr)
     uint8_t buf[2];
     uint16_t val;
 
-    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED, buf, 2);
+    address_space_read(get_address_space_io(), addr, MEMTXATTRS_UNSPECIFIED, buf, 2);
     val = lduw_p(buf);
     trace_cpu_in(addr, 'w', val);
     return val;
@@ -107,7 +107,7 @@ uint32_t cpu_inl(uint32_t addr)
     uint8_t buf[4];
     uint32_t val;
 
-    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED, buf, 4);
+    address_space_read(get_address_space_io(), addr, MEMTXATTRS_UNSPECIFIED, buf, 4);
     val = ldl_p(buf);
     trace_cpu_in(addr, 'l', val);
     return val;
diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index f6f0a829fd..9a74e4415e 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -287,7 +287,7 @@ void guest_phys_blocks_append(GuestPhysBlockList *list)
 
     g.list = list;
     g.listener.region_add = &guest_phys_blocks_region_add;
-    memory_listener_register(&g.listener, &address_space_memory);
+    memory_listener_register(&g.listener, get_address_space_memory());
     memory_listener_unregister(&g.listener);
 }
 
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 56e03e07b5..0ac920d446 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -89,8 +89,8 @@ RAMList ram_list = { .blocks = QLIST_HEAD_INITIALIZER(ram_list.blocks) };
 static MemoryRegion *system_memory;
 static MemoryRegion *system_io;
 
-AddressSpace address_space_io;
-AddressSpace address_space_memory;
+static AddressSpace address_space_io;
+static AddressSpace address_space_memory;
 
 static MemoryRegion io_mem_unassigned;
 
@@ -2690,6 +2690,16 @@ MemoryRegion *get_system_io(void)
     return system_io;
 }
 
+AddressSpace *get_address_space_memory(void)
+{
+    return &address_space_memory;
+}
+
+AddressSpace *get_address_space_io(void)
+{
+    return &address_space_io;
+}
+
 static void invalidate_and_set_dirty(MemoryRegion *mr, hwaddr addr,
                                      hwaddr length)
 {
@@ -3319,7 +3329,8 @@ void *cpu_physical_memory_map(hwaddr addr,
 void cpu_physical_memory_unmap(void *buffer, hwaddr len,
                                bool is_write, hwaddr access_len)
 {
-    return address_space_unmap(&address_space_memory, buffer, len, is_write, access_len);
+    return address_space_unmap(&address_space_memory, buffer, len,
+                               is_write, access_len);
 }
 
 #define ARG1_DECL                AddressSpace *as
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 060aa0ccf4..10401c7dc5 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1231,11 +1231,11 @@ int hvf_vcpu_exec(CPUState *cpu)
 
         if (iswrite) {
             val = hvf_get_reg(cpu, srt);
-            address_space_write(&address_space_memory,
+            address_space_write(get_address_space_memory(),
                                 hvf_exit->exception.physical_address,
                                 MEMTXATTRS_UNSPECIFIED, &val, len);
         } else {
-            address_space_read(&address_space_memory,
+            address_space_read(get_address_space_memory(),
                                hvf_exit->exception.physical_address,
                                MEMTXATTRS_UNSPECIFIED, &val, len);
             hvf_set_reg(cpu, srt, val);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e5c1bd50d2..c7d4ad7efc 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -393,7 +393,7 @@ void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
     }
 
     if (QSLIST_EMPTY(&kvm_devices_head)) {
-        memory_listener_register(&devlistener, &address_space_memory);
+        memory_listener_register(&devlistener, get_address_space_memory());
         qemu_add_machine_init_done_notifier(&notify);
     }
     kd = g_new0(KVMDevice, 1);
@@ -1004,7 +1004,7 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
     MemoryRegionSection mrs;
     MemoryRegion *mr;
 
-    if (as == &address_space_memory) {
+    if (as == get_address_space_memory()) {
         return 0;
     }
 
diff --git a/target/avr/helper.c b/target/avr/helper.c
index 156dde4e92..c43e2e78eb 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -244,7 +244,7 @@ target_ulong helper_inb(CPUAVRState *env, uint32_t port)
         break;
     default:
         /* not a special register, pass to normal memory access */
-        data = address_space_ldub(&address_space_memory,
+        data = address_space_ldub(get_address_space_memory(),
                                   OFFSET_IO_REGISTERS + port,
                                   MEMTXATTRS_UNSPECIFIED, NULL);
     }
@@ -303,7 +303,7 @@ void helper_outb(CPUAVRState *env, uint32_t port, uint32_t data)
         break;
     default:
         /* not a special register, pass to normal memory access */
-        address_space_stb(&address_space_memory, OFFSET_IO_REGISTERS + port,
+        address_space_stb(get_address_space_memory(), OFFSET_IO_REGISTERS + port,
                           data, MEMTXATTRS_UNSPECIFIED, NULL);
     }
 }
@@ -326,7 +326,7 @@ target_ulong helper_fullrd(CPUAVRState *env, uint32_t addr)
         data = helper_inb(env, addr - NUMBER_OF_CPU_REGISTERS);
     } else {
         /* memory */
-        data = address_space_ldub(&address_space_memory, OFFSET_DATA + addr,
+        data = address_space_ldub(get_address_space_memory(), OFFSET_DATA + addr,
                                   MEMTXATTRS_UNSPECIFIED, NULL);
     }
     return data;
@@ -353,7 +353,7 @@ void helper_fullwr(CPUAVRState *env, uint32_t data, uint32_t addr)
         helper_outb(env, addr - NUMBER_OF_CPU_REGISTERS, data);
     } else {
         /* memory */
-        address_space_stb(&address_space_memory, OFFSET_DATA + addr, data,
+        address_space_stb(get_address_space_memory(), OFFSET_DATA + addr, data,
                           MEMTXATTRS_UNSPECIFIED, NULL);
     }
 }
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index b185ee8de4..07a8d242e9 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -393,7 +393,7 @@ static int hax_handle_io(CPUArchState *env, uint32_t df, uint16_t port,
         ptr = buffer + size * count - size;
     }
     for (i = 0; i < count; i++) {
-        address_space_rw(&address_space_io, port, attrs,
+        address_space_rw(get_address_space_io(), port, attrs,
                          ptr, size, direction == HAX_EXIT_IO_OUT);
         if (!df) {
             ptr += size;
diff --git a/target/i386/hax/hax-mem.c b/target/i386/hax/hax-mem.c
index 05dbe8cce3..e5a1b14a76 100644
--- a/target/i386/hax/hax-mem.c
+++ b/target/i386/hax/hax-mem.c
@@ -319,5 +319,5 @@ static struct RAMBlockNotifier hax_ram_notifier = {
 void hax_memory_init(void)
 {
     ram_block_notifier_add(&hax_ram_notifier);
-    memory_listener_register(&hax_memory_listener, &address_space_memory);
+    memory_listener_register(&hax_memory_listener, get_address_space_memory());
 }
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 8d2248bb3f..ba7749cc34 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -106,7 +106,7 @@ void hvf_handle_io(CPUArchState *env, uint16_t port, void *buffer,
     uint8_t *ptr = buffer;
 
     for (i = 0; i < count; i++) {
-        address_space_rw(&address_space_io, port, MEMTXATTRS_UNSPECIFIED,
+        address_space_rw(get_address_space_io(), port, MEMTXATTRS_UNSPECIFIED,
                          ptr, size,
                          direction);
         ptr += size;
diff --git a/target/i386/hvf/vmx.h b/target/i386/hvf/vmx.h
index fcd9a95e5b..4781ec4b04 100644
--- a/target/i386/hvf/vmx.h
+++ b/target/i386/hvf/vmx.h
@@ -130,7 +130,7 @@ static inline void macvm_set_cr0(hv_vcpuid_t vcpu, uint64_t cr0)
 
     if ((cr0 & CR0_PG_MASK) && (rvmcs(vcpu, VMCS_GUEST_CR4) & CR4_PAE_MASK) &&
         !(efer & MSR_EFER_LME)) {
-        address_space_read(&address_space_memory,
+        address_space_read(get_address_space_memory(),
                            rvmcs(vcpu, VMCS_GUEST_CR3) & ~0x1f,
                            MEMTXATTRS_UNSPECIFIED, pdpte, 32);
         /* Only set PDPTE when appropriate. */
diff --git a/target/i386/hvf/x86_mmu.c b/target/i386/hvf/x86_mmu.c
index 96d117567e..52ea629fcd 100644
--- a/target/i386/hvf/x86_mmu.c
+++ b/target/i386/hvf/x86_mmu.c
@@ -86,7 +86,7 @@ static bool get_pt_entry(struct CPUState *cpu, struct gpt_translation *pt,
     }
 
     index = gpt_entry(pt->gva, level, pae);
-    address_space_read(&address_space_memory, gpa + index * pte_size(pae),
+    address_space_read(get_address_space_memory(), gpa + index * pte_size(pae),
                        MEMTXATTRS_UNSPECIFIED, &pte, pte_size(pae));
 
     pt->pte[level - 1] = pte;
@@ -236,7 +236,7 @@ void vmx_write_mem(struct CPUState *cpu, target_ulong gva, void *data, int bytes
         if (!mmu_gva_to_gpa(cpu, gva, &gpa)) {
             VM_PANIC_EX("%s: mmu_gva_to_gpa %llx failed\n", __func__, gva);
         } else {
-            address_space_write(&address_space_memory, gpa,
+            address_space_write(get_address_space_memory(), gpa,
                                 MEMTXATTRS_UNSPECIFIED, data, copy);
         }
 
@@ -257,7 +257,7 @@ void vmx_read_mem(struct CPUState *cpu, void *data, target_ulong gva, int bytes)
         if (!mmu_gva_to_gpa(cpu, gva, &gpa)) {
             VM_PANIC_EX("%s: mmu_gva_to_gpa %llx failed\n", __func__, gva);
         }
-        address_space_read(&address_space_memory, gpa, MEMTXATTRS_UNSPECIFIED,
+        address_space_read(get_address_space_memory(), gpa, MEMTXATTRS_UNSPECIFIED,
                            data, copy);
 
         bytes -= copy;
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index b75738ee9c..faecbd634c 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -505,7 +505,7 @@ nvmm_io_callback(struct nvmm_io *io)
     MemTxAttrs attrs = { 0 };
     int ret;
 
-    ret = address_space_rw(&address_space_io, io->port, attrs, io->data,
+    ret = address_space_rw(get_address_space_io(), io->port, attrs, io->data,
         io->size, !io->in);
     if (ret != MEMTX_OK) {
         error_report("NVMM: I/O Transaction Failed "
@@ -1198,7 +1198,7 @@ nvmm_accel_init(MachineState *ms)
         return -err;
     }
 
-    memory_listener_register(&nvmm_memory_listener, &address_space_memory);
+    memory_listener_register(&nvmm_memory_listener, get_address_space_memory());
     ram_block_notifier_add(&nvmm_ram_notifier);
 
     printf("NetBSD Virtual Machine Monitor accelerator is operational\n");
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 32f7dbac4e..c9b5b2fbb9 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -1336,7 +1336,7 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
      * Populate the hashes table in the guest's memory at the OVMF-designated
      * area for the SEV hashes table
      */
-    padded_ht = address_space_map(&address_space_memory, area->base,
+    padded_ht = address_space_map(get_address_space_memory(), area->base,
                                   &mapped_len, true, attrs);
     if (!padded_ht || mapped_len != sizeof(*padded_ht)) {
         error_setg(errp, "SEV: cannot map hashes table guest memory area");
@@ -1366,7 +1366,7 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
         ret = false;
     }
 
-    address_space_unmap(&address_space_memory, padded_ht,
+    address_space_unmap(get_address_space_memory(), padded_ht,
                         mapped_len, true, mapped_len);
 
     return ret;
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 1328aa656f..d5f5ca7321 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -28,37 +28,37 @@
 
 void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
 {
-    address_space_stb(&address_space_io, port, data,
+    address_space_stb(get_address_space_io(), port, data,
                       cpu_get_mem_attrs(env), NULL);
 }
 
 target_ulong helper_inb(CPUX86State *env, uint32_t port)
 {
-    return address_space_ldub(&address_space_io, port,
+    return address_space_ldub(get_address_space_io(), port,
                               cpu_get_mem_attrs(env), NULL);
 }
 
 void helper_outw(CPUX86State *env, uint32_t port, uint32_t data)
 {
-    address_space_stw(&address_space_io, port, data,
+    address_space_stw(get_address_space_io(), port, data,
                       cpu_get_mem_attrs(env), NULL);
 }
 
 target_ulong helper_inw(CPUX86State *env, uint32_t port)
 {
-    return address_space_lduw(&address_space_io, port,
+    return address_space_lduw(get_address_space_io(), port,
                               cpu_get_mem_attrs(env), NULL);
 }
 
 void helper_outl(CPUX86State *env, uint32_t port, uint32_t data)
 {
-    address_space_stl(&address_space_io, port, data,
+    address_space_stl(get_address_space_io(), port, data,
                       cpu_get_mem_attrs(env), NULL);
 }
 
 target_ulong helper_inl(CPUX86State *env, uint32_t port)
 {
-    return address_space_ldl(&address_space_io, port,
+    return address_space_ldl(get_address_space_io(), port,
                              cpu_get_mem_attrs(env), NULL);
 }
 
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index b22a3314b4..3a08a96136 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -792,7 +792,7 @@ static HRESULT CALLBACK whpx_emu_ioport_callback(
     WHV_EMULATOR_IO_ACCESS_INFO *IoAccess)
 {
     MemTxAttrs attrs = { 0 };
-    address_space_rw(&address_space_io, IoAccess->Port, attrs,
+    address_space_rw(get_address_space_io(), IoAccess->Port, attrs,
                      &IoAccess->Data, IoAccess->AccessSize,
                      IoAccess->Direction);
     return S_OK;
@@ -2435,7 +2435,7 @@ static MemoryListener whpx_memory_listener = {
 
 static void whpx_memory_init(void)
 {
-    memory_listener_register(&whpx_memory_listener, &address_space_memory);
+    memory_listener_register(&whpx_memory_listener, get_address_space_memory());
 }
 
 /*
diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index 76b01dcd68..110ed26609 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -62,7 +62,7 @@ static int diag308_parm_check(CPUS390XState *env, uint64_t r1, uint64_t addr,
         s390_program_interrupt(env, PGM_SPECIFICATION, ra);
         return -1;
     }
-    if (!address_space_access_valid(&address_space_memory, addr,
+    if (!address_space_access_valid(get_address_space_memory(), addr,
                                     sizeof(IplParameterBlock), write,
                                     MEMTXATTRS_UNSPECIFIED)) {
         s390_program_interrupt(env, PGM_ADDRESSING, ra);
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index b04b57c235..1ff04c140e 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -96,7 +96,7 @@ target_ulong mmu_real2abs(CPUS390XState *env, target_ulong raddr)
 
 bool mmu_absolute_addr_valid(target_ulong addr, bool is_write)
 {
-    return address_space_access_valid(&address_space_memory,
+    return address_space_access_valid(get_address_space_memory(),
                                       addr & TARGET_PAGE_MASK,
                                       TARGET_PAGE_SIZE, is_write,
                                       MEMTXATTRS_UNSPECIFIED);
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index 9dd977349a..056b5da588 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -280,7 +280,7 @@ static void sigp_set_prefix(CPUState *cs, run_on_cpu_data arg)
 
     cpu_synchronize_state(cs);
 
-    if (!address_space_access_valid(&address_space_memory, addr,
+    if (!address_space_access_valid(get_address_space_memory(), addr,
                                     sizeof(struct LowCore), false,
                                     MEMTXATTRS_UNSPECIFIED)) {
         set_sigp_status(si, SIGP_STAT_INVALID_PARAMETER);
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index ce2a820c60..dbce96b8c7 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -42,7 +42,7 @@ static void tb_invalidate_virtual_addr(CPUXtensaState *env, uint32_t vaddr)
     int ret = xtensa_get_physical_addr(env, false, vaddr, 2, 0,
                                        &paddr, &page_size, &access);
     if (ret == 0) {
-        tb_invalidate_phys_addr(&address_space_memory, paddr,
+        tb_invalidate_phys_addr(get_address_space_memory(), paddr,
                                 MEMTXATTRS_UNSPECIFIED);
     }
 }
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index afc1d20355..c539627b85 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -325,14 +325,14 @@ static bool get_pio_address(address_range *result,
      * up fuzzing a completely different MemoryRegion/Device. Therefore, check
      * that the address here is within the PIO space limits.
      */
-    bool found = get_io_address(result, &address_space_io, index, offset);
+    bool found = get_io_address(result, get_address_space_io(), index, offset);
     return result->addr <= 0xFFFF ? found : false;
 }
 
 static bool get_mmio_address(address_range *result,
                              uint8_t index, uint32_t offset)
 {
-    return get_io_address(result, &address_space_memory, index, offset);
+    return get_io_address(result, get_address_space_memory(), index, offset);
 }
 
 static void op_in(QTestState *s, const unsigned char * data, size_t len)
-- 
2.37.3


