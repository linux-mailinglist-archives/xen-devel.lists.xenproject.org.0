Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B609F1582
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 20:10:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857116.1269548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMB3V-00075C-1d; Fri, 13 Dec 2024 19:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857116.1269548; Fri, 13 Dec 2024 19:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMB3U-000734-TV; Fri, 13 Dec 2024 19:10:28 +0000
Received: by outflank-mailman (input) for mailman id 857116;
 Fri, 13 Dec 2024 19:10:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I5eD=TG=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tMB3S-0005GA-Tr
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 19:10:26 +0000
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [2607:f8b0:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e89ac4e4-b985-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 20:10:26 +0100 (CET)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-71e1158fe3eso975036a34.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 11:10:26 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71e4834da91sm29697a34.18.2024.12.13.11.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:10:24 -0800 (PST)
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
X-Inumbo-ID: e89ac4e4-b985-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734117025; x=1734721825; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1hIg4oc5GY14Zd4SHmDtJmfPLkCBWu0upl9dxEz8/g=;
        b=oGGZ+6mTqbfoTTn/dhGDIh0fDtYPuuGgbzI0MpEyq9S6aMsJX5/sZ6EEeXgnrgZD85
         tHwXlP/1D/tnC8KK+vh7ioghvHmN4Q/mK/Nn0VI2gfhWzxX5jjdN0YlznwkfM2nl9qdN
         abNJkUWtV4rODq1OdFTH9K3vU9Az+fo8RyV7nV9v7rtcZBC2B/G7HyIEhTyvVHTPgKlJ
         vb3J0ryq0B15zU3c7gVtjq7donV91jBhln0tubHSmVzC4MWp7oJziKgoQAd62wuu69Ez
         eXYyMD6oaIW2z/1LRmNfeUzdna+ihpm2qBI943wfGPDFP/I/yRgXFeSbmTajPSUt1CTy
         hExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734117025; x=1734721825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1hIg4oc5GY14Zd4SHmDtJmfPLkCBWu0upl9dxEz8/g=;
        b=xNZBgTulc94x2PBX/DqC3ksZrVU7fo0FND4vX6p+lnxVEtWmQhKzuD3TbV4tNrLBfn
         d+MWcBFA1j8/6kbHpYdz/RckCqI1JBewc7oSoVPK9Ipf/mfWu5+ZFMnMrAMcgbQQJ/UJ
         cyluw9TW/m8pHzx1afrvHjV5hX8CGpB6cEZmkq8i5R00CnBYaFmz1OaWJaUZn9ZfRtEo
         SwUMPa4rbRf7UrQZhGZv/9qiydOXcPN6BO0F7+XzczFCk9oKGRXi6Ul0lOffhPFqgC35
         p1JBXLlqZwTdD552WffmWOWhodg3VL1Uvzct84eGWFLGr6KU6QMFEmiwzrjvglOsMZOI
         yDUg==
X-Forwarded-Encrypted: i=1; AJvYcCWGPHSUF0zYDT/Rq+1JSoKB8W9v6x5D+2CFLRjczG6D8TGNZICgRX5uRxjORSt0puYRfLQGW+ovl+A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvMV6vRnMh0aZeHCq7WX97nlw8Blwh5RMy7bVK53tz2S/xuCnz
	ncZ3HLghbr0rZ8IlrfzMAYSIBijX4tYrZo+bUTFUn8kR4RolBleIq8mkvrUOMC8=
X-Gm-Gg: ASbGnct2w8/566jzGdUNEs0ZMJxexXF2uPcg0/8iXnhr14PGTrFTsrHFYS/FGky2WOe
	EWROICWBZeYgy1jrwXVoLy4+ay5nw92cWD19ypOxICID9bSoEntZnL0XjETPpmT4e+JCNClygqX
	Sl9V5hd2X5N/2y/d3WRe2T47SfAzWTInMs6tfMN2BFU8KOy3z4RlKjEO5eY+gv6xpAR63glQjwM
	hbcRKA7NJhAjd86bZy+Hgedr2m9we+KQ3db8u05DFOYCuDxRVS+zj+nYkRo+lK4
X-Google-Smtp-Source: AGHT+IHwfk+yWhygf0MTMKyExMm9RZrHBdGyaRiigL/H+X/LC3MhVRZSqRde0AcS403E+WEtKhsmHQ==
X-Received: by 2002:a05:6830:700f:b0:71d:ffa2:d34d with SMTP id 46e09a7af769-71e3b879bbbmr2283286a34.16.1734117025113;
        Fri, 13 Dec 2024 11:10:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Jason Wang <jasowang@redhat.com>,
	Yi Liu <yi.l.liu@intel.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 29/71] hw/i386: Constify all Property
Date: Fri, 13 Dec 2024 13:07:03 -0600
Message-ID: <20241213190750.2513964-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213190750.2513964-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/i386/amd_iommu.c        | 2 +-
 hw/i386/intel_iommu.c      | 2 +-
 hw/i386/kvm/clock.c        | 2 +-
 hw/i386/kvm/i8254.c        | 2 +-
 hw/i386/kvm/ioapic.c       | 2 +-
 hw/i386/sgx-epc.c          | 2 +-
 hw/i386/vmmouse.c          | 2 +-
 hw/i386/vmport.c           | 2 +-
 hw/i386/x86-iommu.c        | 2 +-
 hw/i386/xen/xen_pvdevice.c | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index af0f4da1f6..ca3e62a244 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1668,7 +1668,7 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     amdvi_init(s);
 }
 
-static Property amdvi_properties[] = {
+static const Property amdvi_properties[] = {
     DEFINE_PROP_BOOL("xtsup", AMDVIState, xtsup, false),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 4c0d1d7d47..a5b268342f 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3404,7 +3404,7 @@ static const MemoryRegionOps vtd_mem_ops = {
     },
 };
 
-static Property vtd_properties[] = {
+static const Property vtd_properties[] = {
     DEFINE_PROP_UINT32("version", IntelIOMMUState, version, 0),
     DEFINE_PROP_ON_OFF_AUTO("eim", IntelIOMMUState, intr_eim,
                             ON_OFF_AUTO_AUTO),
diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index 40aa9a32c3..71150ed2e0 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -305,7 +305,7 @@ static const VMStateDescription kvmclock_vmsd = {
     }
 };
 
-static Property kvmclock_properties[] = {
+static const Property kvmclock_properties[] = {
     DEFINE_PROP_BOOL("x-mach-use-reliable-get-clock", KVMClockState,
                       mach_use_reliable_get_clock, true),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
index baa4b39582..2933d3f458 100644
--- a/hw/i386/kvm/i8254.c
+++ b/hw/i386/kvm/i8254.c
@@ -287,7 +287,7 @@ static void kvm_pit_realizefn(DeviceState *dev, Error **errp)
     kpc->parent_realize(dev, errp);
 }
 
-static Property kvm_pit_properties[] = {
+static const Property kvm_pit_properties[] = {
     DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", KVMPITState,
                                lost_tick_policy, LOST_TICK_POLICY_DELAY),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index 2907b08164..217ff43b98 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -133,7 +133,7 @@ static void kvm_ioapic_realize(DeviceState *dev, Error **errp)
     qdev_init_gpio_in(dev, kvm_ioapic_set_irq, IOAPIC_NUM_PINS);
 }
 
-static Property kvm_ioapic_properties[] = {
+static const Property kvm_ioapic_properties[] = {
     DEFINE_PROP_UINT32("gsi_base", KVMIOAPICState, kvm_gsi_base, 0),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index d664829d35..c232e825e0 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -19,7 +19,7 @@
 #include "target/i386/cpu.h"
 #include "exec/address-spaces.h"
 
-static Property sgx_epc_properties[] = {
+static const Property sgx_epc_properties[] = {
     DEFINE_PROP_UINT64(SGX_EPC_ADDR_PROP, SGXEPCDevice, addr, 0),
     DEFINE_PROP_UINT32(SGX_EPC_NUMA_NODE_PROP, SGXEPCDevice, node, 0),
     DEFINE_PROP_LINK(SGX_EPC_MEMDEV_PROP, SGXEPCDevice, hostmem,
diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index 76130cd46d..da9c35c1ec 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -317,7 +317,7 @@ static void vmmouse_realizefn(DeviceState *dev, Error **errp)
     vmport_register(VMPORT_CMD_VMMOUSE_DATA, vmmouse_ioport_read, s);
 }
 
-static Property vmmouse_properties[] = {
+static const Property vmmouse_properties[] = {
     DEFINE_PROP_LINK("i8042", VMMouseState, i8042, TYPE_I8042, ISAKBDState *),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index 7cc75dbc6d..cab6e72089 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -252,7 +252,7 @@ static void vmport_realizefn(DeviceState *dev, Error **errp)
     }
 }
 
-static Property vmport_properties[] = {
+static const Property vmport_properties[] = {
     /* Used to enforce compatibility for migration */
     DEFINE_PROP_BIT("x-read-set-eax", VMPortState, compat_flags,
                     VMPORT_COMPAT_READ_SET_EAX_BIT, true),
diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
index 60af896225..155f6262ea 100644
--- a/hw/i386/x86-iommu.c
+++ b/hw/i386/x86-iommu.c
@@ -125,7 +125,7 @@ static void x86_iommu_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static Property x86_iommu_properties[] = {
+static const Property x86_iommu_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("intremap", X86IOMMUState,
                             intr_supported, ON_OFF_AUTO_AUTO),
     DEFINE_PROP_BOOL("device-iotlb", X86IOMMUState, dt_supported, false),
diff --git a/hw/i386/xen/xen_pvdevice.c b/hw/i386/xen/xen_pvdevice.c
index ed621531d8..e71483e6e3 100644
--- a/hw/i386/xen/xen_pvdevice.c
+++ b/hw/i386/xen/xen_pvdevice.c
@@ -115,7 +115,7 @@ static void xen_pv_realize(PCIDevice *pci_dev, Error **errp)
                      &d->mmio);
 }
 
-static Property xen_pv_props[] = {
+static const Property xen_pv_props[] = {
     DEFINE_PROP_UINT16("vendor-id", XenPVDevice, vendor_id, PCI_VENDOR_ID_XEN),
     DEFINE_PROP_UINT16("device-id", XenPVDevice, device_id, 0xffff),
     DEFINE_PROP_UINT8("revision", XenPVDevice, revision, 0x01),
-- 
2.43.0


