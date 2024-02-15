Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F30855F01
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:18:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681518.1060346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYpB-0004d6-Tj; Thu, 15 Feb 2024 10:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681518.1060346; Thu, 15 Feb 2024 10:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYpB-0004aq-Qe; Thu, 15 Feb 2024 10:18:37 +0000
Received: by outflank-mailman (input) for mailman id 681518;
 Thu, 15 Feb 2024 10:18:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raYpA-0003nv-4z
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:18:36 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9333dd1a-cbeb-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 11:18:34 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4121b1aad00so2221515e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:18:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs3-20020a056000070300b0033b45bdb2a1sm1361072wrb.4.2024.02.15.02.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:18:33 -0800 (PST)
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
X-Inumbo-ID: 9333dd1a-cbeb-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707992314; x=1708597114; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lLmg0pi++GhJOs1eVe+G5sBQYtePLzeMwHyGVwgdUjw=;
        b=ZiLqlKtiGeUelRY/XUEBDvqooZJV6xXkOPpklK6R+KtUO3PnhqzDxBOQGNdRykytRZ
         aAY/nqKgZV+qjngS14xYePUeDLGJFaQGm7NxesniwOqJ61Zc63HVECJQgSAcLajeXjph
         Iy4XzhwbAA2AOQX0XE+iBp+x6Bf/eMmUsVdiFPiTIBYxxnhQ5qpUtTesjVE5WxPe4lRe
         2gCMqXN7U02hvL6JxQevA3fiohY5EelVK29pGNpPqZCqWCLz0bwqlj3SMRACqYtGvOqV
         wV5/IttYZ0RY0ejbUHnodIx0bsf2rDXnqowOke5ni2k0s0iLxmpHMteKzZ/nQmJIuSXo
         5ekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707992314; x=1708597114;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLmg0pi++GhJOs1eVe+G5sBQYtePLzeMwHyGVwgdUjw=;
        b=gdbOziBznxE2lZhiftc4i4piCBvkhbhijfiPmKLIupnM8X13PxXjWM57Sc2tSFJOmU
         ijqEJzZ5GfN6eD99ne7XNrl5oPHtMA5fbDWFVjpH0HReJvvbHCdyo2XUCwvq/DHLm1wY
         nly7di4gcQHI0YCn8VPySz1cGSrz7PiPsvtkTdRAADr8yZD2qCOk9x73pIHaAvPDW2bC
         tqGLRBdD0gNi2S881/DM3s7tflQV90B3R6UdLUMvYUNjZU2FTzJXIa8W4DWcskwXr6l+
         SZ5CysQ0Ukm0QE2pYE6VlmZlUuavuKwpLubtGl3aPip1eLETbqKveMruTdxp2ZMY/aUh
         QTOQ==
X-Gm-Message-State: AOJu0YxtpAmDiDJMw6L4Yhv2R3+oO+DbWcwYLQgRXj9ehfyze/LK8KC0
	jUy2a+GU7afoUZuyPZ6Rkj2fq5ZECQWqsXa5udhwn+Yui4aFdJpf2HL8Es674bT2i79pT4vuuao
	=
X-Google-Smtp-Source: AGHT+IE2IMDkOamlYVi9ilGu+LX74qvQUe0kA2NJiX3civPx6gq8DwGohV9AMUXH4tiR9vyAQr20cQ==
X-Received: by 2002:a5d:51ce:0:b0:33c:eb37:470e with SMTP id n14-20020a5d51ce000000b0033ceb37470emr985627wrv.44.1707992313772;
        Thu, 15 Feb 2024 02:18:33 -0800 (PST)
Message-ID: <67bfa370-f4be-4f93-aa63-cbca7636a49c@suse.com>
Date: Thu, 15 Feb 2024 11:18:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 10/12] VT-d: move {,un}map_vtd_domain_page()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

..., thus allowing them to become static. There's nothing x86-specific
about these functions anyway.

Since only the "iommu_inclusive_mapping" parameter declaration would be
left in the file, move that as well. There's nothing VT-d specific about
it (anymore?): "dom0-iommu=map-inclusive" is similarly generic, and
documentation also doesn't say anything.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v2: doc adjustment.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1633,7 +1633,7 @@ Specify the timeout of the device IOTLB
 By default, the timeout is 1000 ms. When you see error 'Queue invalidate
 wait descriptor timed out', try increasing this value.
 
-### iommu_inclusive_mapping
+### iommu_inclusive_mapping (x86)
 > `= <boolean>`
 
 **WARNING: This command line option is deprecated, and superseded by
--- a/xen/drivers/passthrough/vtd/Makefile
+++ b/xen/drivers/passthrough/vtd/Makefile
@@ -1,5 +1,3 @@
-obj-$(CONFIG_X86) += x86/
-
 obj-y += iommu.o
 obj-y += dmar.o
 obj-y += utils.o
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -21,6 +21,7 @@
 #define _VTD_EXTERN_H_
 
 #include "dmar.h"
+#include <xen/domain_page.h>
 #include <xen/keyhandler.h>
 
 #define VTDPREFIX "[VT-D]"
@@ -67,8 +68,6 @@ struct acpi_rhsa_unit *drhd_to_rhsa(cons
 
 uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node);
 void free_pgtable_maddr(u64 maddr);
-void *map_vtd_domain_page(u64 maddr);
-void unmap_vtd_domain_page(const void *va);
 int domain_context_mapping_one(struct domain *domain, struct vtd_iommu *iommu,
                                uint8_t bus, uint8_t devfn,
                                const struct pci_dev *pdev, domid_t domid,
@@ -78,6 +77,16 @@ int domain_context_unmap_one(struct doma
 int cf_check intel_iommu_get_reserved_device_memory(
     iommu_grdm_t *func, void *ctxt);
 
+static inline void *map_vtd_domain_page(paddr_t maddr)
+{
+    return map_domain_page(_mfn(paddr_to_pfn(maddr)));
+}
+
+static inline void unmap_vtd_domain_page(const void *va)
+{
+    unmap_domain_page(va);
+}
+
 unsigned int cf_check io_apic_read_remap_rte(
     unsigned int apic, unsigned int reg);
 void cf_check io_apic_write_remap_rte(
--- a/xen/drivers/passthrough/vtd/x86/Makefile
+++ /dev/null
@@ -1 +0,0 @@
-obj-y += vtd.o
--- a/xen/drivers/passthrough/vtd/x86/vtd.c
+++ /dev/null
@@ -1,48 +0,0 @@
-/*
- * Copyright (c) 2008, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- *
- * Copyright (C) Allen Kay <allen.m.kay@intel.com>
- * Copyright (C) Weidong Han <weidong.han@intel.com>
- */
-
-#include <xen/param.h>
-#include <xen/sched.h>
-#include <xen/softirq.h>
-#include <xen/domain_page.h>
-#include <asm/paging.h>
-#include <xen/iommu.h>
-#include <xen/irq.h>
-#include <xen/numa.h>
-#include <asm/fixmap.h>
-#include "../iommu.h"
-#include "../dmar.h"
-#include "../vtd.h"
-#include "../extern.h"
-
-/*
- * iommu_inclusive_mapping: when set, all memory below 4GB is included in dom0
- * 1:1 iommu mappings except xen and unusable regions.
- */
-boolean_param("iommu_inclusive_mapping", iommu_hwdom_inclusive);
-
-void *map_vtd_domain_page(u64 maddr)
-{
-    return map_domain_page(_mfn(paddr_to_pfn(maddr)));
-}
-
-void unmap_vtd_domain_page(const void *va)
-{
-    unmap_domain_page(va);
-}
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -19,6 +19,7 @@
 #include <xen/paging.h>
 #include <xen/guest_access.h>
 #include <xen/event.h>
+#include <xen/param.h>
 #include <xen/softirq.h>
 #include <xen/vm_event.h>
 #include <xsm/xsm.h>
@@ -36,6 +37,12 @@ bool __initdata iommu_superpages = true;
 
 enum iommu_intremap __read_mostly iommu_intremap = iommu_intremap_full;
 
+/*
+ * iommu_inclusive_mapping: When set, all memory below 4GB is included in dom0
+ * 1:1 iommu mappings except xen and unusable regions.
+ */
+boolean_param("iommu_inclusive_mapping", iommu_hwdom_inclusive);
+
 #ifdef CONFIG_PV
 /* Possible unfiltered LAPIC/MSI messages from untrusted sources? */
 bool __read_mostly untrusted_msi;


