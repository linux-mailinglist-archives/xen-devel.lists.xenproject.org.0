Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE58417FC0
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 06:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195624.348671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTzR1-0004Ib-BG; Sat, 25 Sep 2021 04:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195624.348671; Sat, 25 Sep 2021 04:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTzR1-0004CW-5C; Sat, 25 Sep 2021 04:37:11 +0000
Received: by outflank-mailman (input) for mailman id 195624;
 Fri, 24 Sep 2021 19:40:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MekI=OO=gmail.com=this.is.a0lson@srs-us1.protection.inumbo.net>)
 id 1mTr3n-0003J8-TX
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 19:40:39 +0000
Received: from mail-qt1-x833.google.com (unknown [2607:f8b0:4864:20::833])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18a82e6f-e431-48f1-80ac-8f7083d24bae;
 Fri, 24 Sep 2021 19:40:36 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id r1so10488410qta.12
 for <xen-devel@lists.xenproject.org>; Fri, 24 Sep 2021 12:40:36 -0700 (PDT)
Received: from localhost.localdomain ([24.214.236.228])
 by smtp.gmail.com with ESMTPSA id s10sm6957971qko.134.2021.09.24.12.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 12:40:35 -0700 (PDT)
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
X-Inumbo-ID: 18a82e6f-e431-48f1-80ac-8f7083d24bae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9SjNRKk5NXPDvp5QWjMJFRC3W8sz2kqMr2/m/QyAXos=;
        b=YLnmy4MhxIOeh27w+2iaWtlqaOtNA/wco23lILFwUvPrqfxEVZy0SNBQbX/VHfRymH
         s4tTtNwIH8Yxq57mEcNQPanObde3berAZwimM28vsyBXtozOeKOlb+jKsBlO2n4541Fg
         0gO1qdBTraBk1fkjF8tBuLvUalMAJlD2yAXEg6UF0H96E0rV2dKz/OWI4HWIHIGh+1CL
         kwbzxUWI/ItfJxvij1nJMoTNb+juSXueFTRsjcEA89zbbIxbIzKlbKY7o4/hdU246Fb+
         keMjIEm+3tR+Vgp4+Y2C/xV8WfEhOMa5DhBkWajEu9vH71zayBeDSV0gF9Tq7L1bHkH8
         bJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9SjNRKk5NXPDvp5QWjMJFRC3W8sz2kqMr2/m/QyAXos=;
        b=Eo4pvajqSzrjJjVvByxT7hvFTI9cVpWK014DlfIcHqAGTKg+xs6tNJeSH4uCOXys0Y
         kCQbeJnsCq11oDehMNDGroPsGQie4Zg7d6ejSZpSz1f+QsQiD65Ml3sHak7oTEbeg7v0
         RUOmvQuvi30rNmMBY4LgACIxyvOUJoFdwWxxeENJDwHj4CPtOV608oyd5LNd8V3M6k88
         p6G8EFlUOuNSduCsQ1t8i3q0NP6bDQ1/b9Fm60v0T4aAxmZWDuIr6aOW4NvDZw91NrUN
         ZFU8fY+zatYqyLWMRU2IoGBhBdmP3CXx1Ci6vXsEgFaaxAK2ZsaWANlUV/UwkK59IOXZ
         YP7A==
X-Gm-Message-State: AOAM532GuLoFF9GMUfUApX5UWUo9MDDorimsvJHwzbuPfsxeNushz4kF
	B3sYmdzPYU4RbyH7HKxzRSaQC6HY4nqIaA==
X-Google-Smtp-Source: ABdhPJwaUDVJHuEB0YctSzsdaH5+ImJpcYhgb38pEzB5Qxbt6mMGgA1kElXucw2fyZqsS7ykji2mVg==
X-Received: by 2002:ac8:7143:: with SMTP id h3mr6216840qtp.242.1632512435684;
        Fri, 24 Sep 2021 12:40:35 -0700 (PDT)
From: Alex Olson <this.is.a0lson@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Alex Olson <this.is.a0lson@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Alex Olson <alex.olson@starlab.io>
Subject: [PATCH 1/1] x86: centralize default APIC id definition
Date: Fri, 24 Sep 2021 14:39:55 -0500
Message-Id: <85b59046315b8a84afa8538aacdea92b19200faa.1632512149.git.this.is.a0lson@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632512149.git.this.is.a0lson@gmail.com>
References: <cover.1632512149.git.this.is.a0lson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inspired by an earlier attempt by Chao Gao <chao.gao@intel.com>,
this revision aims to put the hypervisor in control of x86 APIC identifier
definition instead of hard-coding a formula in multiple places
(libxl, hvmloader, hypervisor).

This is intended as a first step toward exposing/altering CPU topology
seen by guests.

Changes:

- Add field to vlapic for holding default ID (on reset)

- add HVMOP_get_vcpu_topology_id hypercall so libxl (for PVH domains)
  can access APIC ids needed for ACPI table definition prior to domain start.

- For HVM guests, hvmloader now also uses the same hypercall.

- Make CPUID code use vlapic ID instead of hard-coded formula
  for runtime reporting to guests

Signed-off-by: Alex Olson <alex.olson@starlab.io>
---
 tools/firmware/hvmloader/Makefile      |  2 +-
 tools/firmware/hvmloader/config.h      |  1 -
 tools/firmware/hvmloader/hvmloader.c   |  3 +-
 tools/firmware/hvmloader/mp_tables.c   |  3 +-
 tools/firmware/hvmloader/smp.c         |  3 +-
 tools/firmware/hvmloader/topology.c    | 54 ++++++++++++++++++++++++++
 tools/firmware/hvmloader/topology.h    | 33 ++++++++++++++++
 tools/firmware/hvmloader/util.c        |  6 ++-
 tools/include/xenctrl.h                |  6 +++
 tools/libacpi/build.c                  |  4 +-
 tools/libacpi/libacpi.h                |  3 +-
 tools/libs/ctrl/xc_domain.c            | 27 +++++++++++++
 tools/libs/light/libxl_x86_acpi.c      |  9 ++++-
 xen/arch/x86/cpuid.c                   | 14 +++++--
 xen/arch/x86/hvm/hvm.c                 | 36 ++++++++++++++++-
 xen/arch/x86/hvm/vlapic.c              | 18 ++++++---
 xen/include/asm-x86/hvm/vlapic.h       |  4 +-
 xen/include/public/arch-x86/hvm/save.h |  1 +
 xen/include/public/hvm/hvm_op.h        | 17 ++++++++
 19 files changed, 222 insertions(+), 22 deletions(-)
 create mode 100644 tools/firmware/hvmloader/topology.c
 create mode 100644 tools/firmware/hvmloader/topology.h

diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index e980ce7c5f..158f62b4e6 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -29,7 +29,7 @@ CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__
 
 OBJS  = hvmloader.o mp_tables.o util.o smbios.o 
-OBJS += smp.o cacheattr.o xenbus.o vnuma.o
+OBJS += smp.o cacheattr.o xenbus.o vnuma.o topology.o
 OBJS += e820.o pci.o pir.o ctype.o
 OBJS += hvm_param.o
 OBJS += ovmf.o seabios.o
diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index 844120bc87..91d73c9086 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -50,7 +50,6 @@ extern uint8_t ioapic_version;
 #define IOAPIC_ID           0x01
 
 #define LAPIC_BASE_ADDRESS  0xfee00000
-#define LAPIC_ID(vcpu_id)   ((vcpu_id) * 2)
 
 #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index c58841e5b5..250e6779b1 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -25,6 +25,7 @@
 #include "pci_regs.h"
 #include "apic_regs.h"
 #include "vnuma.h"
+#include "topology.h"
 #include <acpi2_0.h>
 #include <xen/version.h>
 #include <xen/hvm/params.h>
@@ -225,7 +226,7 @@ static void apic_setup(void)
 
     /* 8259A ExtInts are delivered through IOAPIC pin 0 (Virtual Wire Mode). */
     ioapic_write(0x10, APIC_DM_EXTINT);
-    ioapic_write(0x11, SET_APIC_ID(LAPIC_ID(0)));
+    ioapic_write(0x11, SET_APIC_ID(get_topology_id(0)));
 }
 
 struct bios_info {
diff --git a/tools/firmware/hvmloader/mp_tables.c b/tools/firmware/hvmloader/mp_tables.c
index d207ecbf00..562961ca0b 100644
--- a/tools/firmware/hvmloader/mp_tables.c
+++ b/tools/firmware/hvmloader/mp_tables.c
@@ -29,6 +29,7 @@
 
 #include <stdint.h>
 #include "config.h"
+#include "topology.h"
 
 /* number of non-processor MP table entries */
 #define NR_NONPROC_ENTRIES     18
@@ -199,7 +200,7 @@ static void fill_mp_config_table(struct mp_config_table *mpct, int length)
 static void fill_mp_proc_entry(struct mp_proc_entry *mppe, int vcpu_id)
 {
     mppe->type = ENTRY_TYPE_PROCESSOR;
-    mppe->lapic_id = LAPIC_ID(vcpu_id);
+    mppe->lapic_id = get_topology_id(vcpu_id);
     mppe->lapic_version = 0x11;
     mppe->cpu_flags = CPU_FLAG_ENABLED;
     if ( vcpu_id == 0 )
diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
index 082b17f138..5091ff1f1f 100644
--- a/tools/firmware/hvmloader/smp.c
+++ b/tools/firmware/hvmloader/smp.c
@@ -22,6 +22,7 @@
 #include "util.h"
 #include "config.h"
 #include "apic_regs.h"
+#include "topology.h"
 
 #define AP_BOOT_EIP 0x1000
 extern char ap_boot_start[], ap_boot_end[];
@@ -86,7 +87,7 @@ static void lapic_wait_ready(void)
 
 static void boot_cpu(unsigned int cpu)
 {
-    unsigned int icr2 = SET_APIC_DEST_FIELD(LAPIC_ID(cpu));
+    unsigned int icr2 = SET_APIC_DEST_FIELD(get_topology_id(cpu));
 
     /* Initialise shared variables. */
     ap_cpuid = cpu;
diff --git a/tools/firmware/hvmloader/topology.c b/tools/firmware/hvmloader/topology.c
new file mode 100644
index 0000000000..f92bbb8b7a
--- /dev/null
+++ b/tools/firmware/hvmloader/topology.c
@@ -0,0 +1,54 @@
+/*
+ * topology.c: obtain vCPU topology from hypervisor
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY AUTHOR AND CONTRIBUTORS ``AS IS'' AND
+ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED.  IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
+ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
+ */
+
+#include "util.h"
+#include "hypercall.h"
+#include "topology.h"
+#include <xen/hvm/hvm_op.h>
+
+uint32_t get_topology_id(unsigned vcpu_id)
+{
+    int rc;
+    struct xen_vcpu_topology_id tid =
+        { .domid = DOMID_SELF, .vcpu_id = vcpu_id };
+
+    rc = hypercall_hvm_op(HVMOP_get_vcpu_topology_id, &tid);
+    if ( rc < 0 )
+    {
+        printf("Failed to retrieve cpu topology for vcpu=%u, rc = %d\n", vcpu_id, rc);
+        return 0xdeadbeef;
+    }
+    return tid.topology_id;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/firmware/hvmloader/topology.h b/tools/firmware/hvmloader/topology.h
new file mode 100644
index 0000000000..6e37051556
--- /dev/null
+++ b/tools/firmware/hvmloader/topology.h
@@ -0,0 +1,33 @@
+/******************************************************************************
+ * topology.h
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version 2
+ * as published by the Free Software Foundation; or, when distributed
+ * separately from the Linux kernel or incorporated into other
+ * software packages, subject to the following license:
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this source file (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy, modify,
+ * merge, publish, distribute, sublicense, and/or sell copies of the Software,
+ * and to permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+#ifndef __HVMLOADER_TOPOLOGY_H_
+#define __HVMLOADER_TOPOLOGY_H_
+
+uint32_t get_topology_id(unsigned vcpu_id);
+
+#endif /* __HVMLOADER_TOPOLOGY_H__ */
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 581b35e5cf..a5fe15d198 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -22,6 +22,7 @@
 #include "hypercall.h"
 #include "ctype.h"
 #include "vnuma.h"
+#include "topology.h"
 #include <acpi2_0.h>
 #include <libacpi.h>
 #include <stdint.h>
@@ -910,9 +911,9 @@ static void acpi_mem_free(struct acpi_ctxt *ctxt,
     /* ACPI builder currently doesn't free memory so this is just a stub */
 }
 
-static uint32_t acpi_lapic_id(unsigned cpu)
+static uint32_t acpi_lapic_id(unsigned cpu, void *arg)
 {
-    return LAPIC_ID(cpu);
+    return get_topology_id(cpu);
 }
 
 void hvmloader_acpi_build_tables(struct acpi_config *config,
@@ -943,6 +944,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
 
     config->lapic_base_address = LAPIC_BASE_ADDRESS;
     config->lapic_id = acpi_lapic_id;
+    config->lapic_id_arg = NULL;
     config->ioapic_base_address = ioapic_base_address;
     config->ioapic_id = IOAPIC_ID;
     config->pci_isa_irq_mask = PCI_ISA_IRQ_MASK; 
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index a3063998e0..c15a2bb0c8 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1262,6 +1262,12 @@ int xc_domain_set_memory_map(xc_interface *xch,
 int xc_get_machine_memory_map(xc_interface *xch,
                               struct e820entry entries[],
                               uint32_t max_entries);
+
+int xc_get_vcpu_topology_id(xc_interface *xch,
+                            uint32_t domid,
+                            unsigned int vcpu_id,
+                            uint32_t *topology_id);
+
 #endif
 
 int xc_reserved_device_memory_map(xc_interface *xch,
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index fe2db66a62..aa5e851172 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -156,7 +156,7 @@ static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
         lapic->length  = sizeof(*lapic);
         /* Processor ID must match processor-object IDs in the DSDT. */
         lapic->acpi_processor_id = i;
-        lapic->apic_id = config->lapic_id(i);
+        lapic->apic_id = config->lapic_id(i, config->lapic_id_arg);
         lapic->flags = (test_bit(i, hvminfo->vcpu_online)
                         ? ACPI_LOCAL_APIC_ENABLED : 0);
         lapic++;
@@ -244,7 +244,7 @@ static struct acpi_20_srat *construct_srat(struct acpi_ctxt *ctxt,
         processor->type     = ACPI_PROCESSOR_AFFINITY;
         processor->length   = sizeof(*processor);
         processor->domain   = config->numa.vcpu_to_vnode[i];
-        processor->apic_id  = config->lapic_id(i);
+        processor->apic_id  = config->lapic_id(i, config->lapic_id_arg);
         processor->flags    = ACPI_LOCAL_APIC_AFFIN_ENABLED;
         processor++;
     }
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index a2efd23b0b..c66d1f0ea1 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -91,7 +91,8 @@ struct acpi_config {
     unsigned long rsdp;
 
     /* x86-specific parameters */
-    uint32_t (*lapic_id)(unsigned cpu);
+    uint32_t (*lapic_id)(unsigned cpu, void *arg);
+    void     *lapic_id_arg;
     uint32_t lapic_base_address;
     uint32_t ioapic_base_address;
     uint16_t pci_isa_irq_mask;
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 23322b70b5..087196130c 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1506,6 +1506,33 @@ int xc_get_hvm_param(xc_interface *handle, uint32_t dom, int param, unsigned lon
     return 0;
 }
 
+
+#if defined (__i386__) || defined (__x86_64__)
+int xc_get_vcpu_topology_id(xc_interface *xch,
+                            uint32_t dom,
+                            unsigned int vcpu_id,
+                            uint32_t *topology_id)
+{
+    DECLARE_HYPERCALL_BUFFER(xen_vcpu_topology_id_t, arg);
+    int rc;
+
+    arg = xc_hypercall_buffer_alloc(xch, arg, sizeof(*arg));
+    if ( arg == NULL )
+        return -1;
+
+    arg->domid = dom;
+    arg->vcpu_id = vcpu_id;
+    arg->topology_id = 0xdeadbeef;
+
+    rc = xencall2(xch->xcall, __HYPERVISOR_hvm_op,
+                  HVMOP_get_vcpu_topology_id,
+                  HYPERCALL_BUFFER_AS_ARG(arg));
+    *topology_id = arg->topology_id;
+    xc_hypercall_buffer_free(xch, arg);
+    return rc;
+}
+#endif
+
 int xc_domain_setdebugging(xc_interface *xch,
                            uint32_t domid,
                            unsigned int enable)
diff --git a/tools/libs/light/libxl_x86_acpi.c b/tools/libs/light/libxl_x86_acpi.c
index 3eca1c7a9f..8e471f222f 100644
--- a/tools/libs/light/libxl_x86_acpi.c
+++ b/tools/libs/light/libxl_x86_acpi.c
@@ -79,9 +79,13 @@ static void acpi_mem_free(struct acpi_ctxt *ctxt,
 {
 }
 
-static uint32_t acpi_lapic_id(unsigned cpu)
+static uint32_t acpi_lapic_id(unsigned cpu, void *arg)
 {
-    return cpu * 2;
+    struct xc_dom_image *dom = (struct xc_dom_image *)arg;
+    uint32_t ret = 0xdeadbeef;
+    int rc;
+    rc = xc_get_vcpu_topology_id(dom->xch, dom->guest_domid, cpu, &ret);
+    return ret;
 }
 
 static int init_acpi_config(libxl__gc *gc, 
@@ -149,6 +153,7 @@ static int init_acpi_config(libxl__gc *gc,
 
     config->lapic_base_address = LAPIC_BASE_ADDRESS;
     config->lapic_id = acpi_lapic_id;
+    config->lapic_id_arg = dom;
     config->acpi_revision = 5;
 
     rc = 0;
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 2079a30ae4..cbed233726 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -867,8 +867,10 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     case 0x1:
         /* TODO: Rework topology logic. */
         res->b &= 0x00ffffffu;
-        if ( is_hvm_domain(d) )
-            res->b |= (v->vcpu_id * 2) << 24;
+
+#ifdef CONFIG_HVM
+        res->b |= vlapic_get_default_id(v) << 24;
+#endif
 
         /* TODO: Rework vPMU control in terms of toolstack choices. */
         if ( vpmu_available(v) &&
@@ -1049,7 +1051,13 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
             *(uint8_t *)&res->c = subleaf;
 
             /* Fix the x2APIC identifier. */
-            res->d = v->vcpu_id * 2;
+#ifdef CONFIG_HVM
+            res->d = vlapic_get_default_id(v);
+#endif
+        }
+        else
+        {
+            *res = EMPTY_LEAF;
         }
         break;
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7b48a1b925..e93ca8187d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1555,7 +1555,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
         goto fail1;
 
     /* NB: vlapic_init must be called before hvm_funcs.vcpu_initialise */
-    rc = vlapic_init(v);
+    rc = vlapic_init(v, v->vcpu_id * 2);
     if ( rc != 0 ) /* teardown: vlapic_destroy */
         goto fail2;
 
@@ -5084,6 +5084,40 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = current->hcall_compat ? compat_altp2m_op(arg) : do_altp2m_op(arg);
         break;
 
+    case HVMOP_get_vcpu_topology_id:
+    {
+        struct domain *d;
+        struct xen_vcpu_topology_id tid;
+
+        if ( copy_from_guest(&tid, arg, 1) )
+            return -EFAULT;
+
+        if (tid.domid != DOMID_SELF && !is_hardware_domain(current->domain))
+            return -EPERM;
+
+        if ( (d = rcu_lock_domain_by_any_id(tid.domid)) == NULL )
+            return -ESRCH;
+
+        if ( !is_hvm_domain(d))
+        {
+            rc = -EOPNOTSUPP;
+            goto get_cpu_topology_failed;
+        }
+
+        if ( tid.vcpu_id >= d->max_vcpus )
+        {
+            rc = -EINVAL;
+            goto get_cpu_topology_failed;
+        }
+        tid.topology_id = vlapic_get_default_id(d->vcpu[tid.vcpu_id]);
+
+        rc = copy_to_guest(arg, &tid, 1) ? -EFAULT : 0;
+
+ get_cpu_topology_failed:
+        rcu_unlock_domain(d);
+        break;
+    }
+
     default:
     {
         gdprintk(XENLOG_DEBUG, "Bad HVM op %ld.\n", op);
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 5e21fb4937..e65b1e8e94 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1068,12 +1068,18 @@ static const struct hvm_mmio_ops vlapic_mmio_ops = {
     .write = vlapic_mmio_write,
 };
 
+uint32_t vlapic_get_default_id(const struct vcpu *v)
+{
+    const struct vlapic *vlapic = vcpu_vlapic(v);
+    return vlapic->hw.default_id;
+}
+
 static void set_x2apic_id(struct vlapic *vlapic)
 {
-    u32 id = vlapic_vcpu(vlapic)->vcpu_id;
+    u32 id = vlapic->hw.default_id;
     u32 ldr = ((id & ~0xf) << 12) | (1 << (id & 0xf));
 
-    vlapic_set_reg(vlapic, APIC_ID, id * 2);
+    vlapic_set_reg(vlapic, APIC_ID, id);
     vlapic_set_reg(vlapic, APIC_LDR, ldr);
 }
 
@@ -1440,7 +1446,7 @@ void vlapic_reset(struct vlapic *vlapic)
     if ( v->vcpu_id == 0 )
         vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
 
-    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
+    vlapic_set_reg(vlapic, APIC_ID, vlapic->hw.default_id << 24);
     vlapic_do_init(vlapic);
 }
 
@@ -1508,7 +1514,7 @@ static void lapic_load_fixup(struct vlapic *vlapic)
          * here, but can be dropped as soon as it is found to conflict with
          * other (future) changes.
          */
-        if ( GET_xAPIC_ID(id) != vlapic_vcpu(vlapic)->vcpu_id * 2 ||
+        if ( GET_xAPIC_ID(id) != vlapic->hw.default_id ||
              id != SET_xAPIC_ID(GET_xAPIC_ID(id)) )
             printk(XENLOG_G_WARNING "%pv: bogus APIC ID %#x loaded\n",
                    vlapic_vcpu(vlapic), id);
@@ -1596,12 +1602,14 @@ HVM_REGISTER_SAVE_RESTORE(LAPIC, lapic_save_hidden,
 HVM_REGISTER_SAVE_RESTORE(LAPIC_REGS, lapic_save_regs,
                           lapic_load_regs, 1, HVMSR_PER_VCPU);
 
-int vlapic_init(struct vcpu *v)
+int vlapic_init(struct vcpu *v, uint32_t apic_id)
 {
     struct vlapic *vlapic = vcpu_vlapic(v);
 
     HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "%d", v->vcpu_id);
 
+    vlapic->hw.default_id = apic_id;
+
     if ( !has_vlapic(v->domain) )
     {
         vlapic->hw.disabled = VLAPIC_HW_DISABLED;
diff --git a/xen/include/asm-x86/hvm/vlapic.h b/xen/include/asm-x86/hvm/vlapic.h
index 8f908928c3..06c9c5cd7d 100644
--- a/xen/include/asm-x86/hvm/vlapic.h
+++ b/xen/include/asm-x86/hvm/vlapic.h
@@ -116,7 +116,7 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig);
 int vlapic_has_pending_irq(struct vcpu *v);
 int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool_t force_ack);
 
-int  vlapic_init(struct vcpu *v);
+int  vlapic_init(struct vcpu *v, uint32_t apic_id);
 void vlapic_destroy(struct vcpu *v);
 
 void vlapic_reset(struct vlapic *vlapic);
@@ -154,4 +154,6 @@ static inline void vlapic_sync_pir_to_irr(struct vcpu *v)
         alternative_vcall(hvm_funcs.sync_pir_to_irr, v);
 }
 
+uint32_t vlapic_get_default_id(const struct vcpu *v);
+
 #endif /* __ASM_X86_HVM_VLAPIC_H__ */
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 773a380bc2..f960257dbf 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -411,6 +411,7 @@ struct hvm_hw_lapic {
     uint32_t             disabled; /* VLAPIC_xx_DISABLED */
     uint32_t             timer_divisor;
     uint64_t             tdt_msr;
+    uint32_t             default_id;
 };
 
 DECLARE_HVM_SAVE_TYPE(LAPIC, 5, struct hvm_hw_lapic);
diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm_op.h
index 870ec52060..bf7872a4d1 100644
--- a/xen/include/public/hvm/hvm_op.h
+++ b/xen/include/public/hvm/hvm_op.h
@@ -183,6 +183,23 @@ struct xen_hvm_get_mem_type {
 typedef struct xen_hvm_get_mem_type xen_hvm_get_mem_type_t;
 DEFINE_XEN_GUEST_HANDLE(xen_hvm_get_mem_type_t);
 
+/*
+ * HVMOP_get_cpu_topology is used by guest to acquire vcpu topology from
+ * hypervisor.
+ */
+#define HVMOP_get_vcpu_topology_id     16
+
+struct xen_vcpu_topology_id {
+    /* IN */
+    domid_t domid;
+    uint32_t vcpu_id;
+
+    /* OUT */
+    uint32_t topology_id;
+};
+typedef struct xen_vcpu_topology_id xen_vcpu_topology_id_t;
+DEFINE_XEN_GUEST_HANDLE(xen_vcpu_topology_id_t);
+
 /* Following tools-only interfaces may change in future. */
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
 
-- 
2.25.1


