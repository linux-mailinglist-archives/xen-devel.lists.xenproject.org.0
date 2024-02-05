Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1652D849C66
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676102.1051975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzTK-00009n-4C; Mon, 05 Feb 2024 13:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676102.1051975; Mon, 05 Feb 2024 13:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzTK-00006A-0L; Mon, 05 Feb 2024 13:57:18 +0000
Received: by outflank-mailman (input) for mailman id 676102;
 Mon, 05 Feb 2024 13:57:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWzTH-0007Qa-Ti
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:57:15 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76e9b37f-c42e-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 14:57:13 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40fdf2b69b2so446095e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:57:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b0040efc268713sm8570104wmb.26.2024.02.05.05.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:57:12 -0800 (PST)
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
X-Inumbo-ID: 76e9b37f-c42e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707141433; x=1707746233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DHe5MlAMnMR5U49EdLt7+W2yJjwbBdMvr2wcdgX2lS0=;
        b=fyV/cFrHngTlCj+uR2CxjhBlYSRV/IEM41P20GaIY5wW1EWG9B5tAg4auH+0YG2n87
         sT+s2rTvArlnL0LPte5gK0P7s0o0pSu/7bNZTxm1UEH1tdMzF0s7RYxGztr9nJ1i61GH
         lKvXctNW/3StCwSWrHiRMKANxS1sbJ+L6mqApy9Achih9n/JlsPckcaxh7IooHOr3glm
         mgeniiqNdQcGumZoWTxh4L8jKPAm2fsvgQ91LCzLPNGeothzZfcKA8gOTz7iQ8+Cbg2o
         XAEo1Z2Gpfq9W3/VK2vR/5Wq/FyNAXrikCuscOlmcRUrvOIfEEFDqoAmq5Sy778Lumx6
         EW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707141433; x=1707746233;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHe5MlAMnMR5U49EdLt7+W2yJjwbBdMvr2wcdgX2lS0=;
        b=IFAIXc9cyZ5x2K8oVAaRngunMtyrDaeiLPRnaKMqjvaZ8VK9xZCyLs2sCTs559JI7l
         ot8oNWhb11nlriQyzbWlo66MTwv97l+jSqKXFUFrIb1AZVOMpDXJ2OE0vTBjyPvWht6m
         wFu1Er5nujtq0tzsgFLVIbIl6SjRcfgpVZM/uVhhovC/Nwu3eiA1A9wqvRI2+1dokPak
         pCnozKEUiqLDT4PkJr9F/WzuKzrk2LX7J+A4F1v5j55bFs9Tp4qcC07d7xSO04xQl1GP
         A323n+sCNbJsW5O3+ivkeA0KxlORnxq+O/o5gOzw5hgNKhAuUDUwTFyAEhbvPrCDUjn7
         TC1A==
X-Gm-Message-State: AOJu0Yx7E2AdnMK7eF+Pirnwl0/EaMSYNDSQu60pj3wg1hbW+XvwLsn8
	vvgy44dwi7KGAL4923rskji1vFVY8hcj+Lp2MHCSndiXJ4BPWdUg9ZUS/0q+ZRa2B/f2+frpIrE
	=
X-Google-Smtp-Source: AGHT+IEiEcXe2SY92ZwEiLXKnHjQdViDe4WS5m9kWAg3gy+3vDjt0e9/mdD9dVZaDQxIMCIYa3lxgw==
X-Received: by 2002:a05:600c:35cc:b0:40f:cb0d:4de6 with SMTP id r12-20020a05600c35cc00b0040fcb0d4de6mr4305258wmq.5.1707141433377;
        Mon, 05 Feb 2024 05:57:13 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUWUpE7oHc1i8YvDQQ4BMXPfmqOMeZNLennM73+mNklHfyTKYKaeVh+FZWhQBu/doKHY9RsZDtY+30D0ODfyE6tQXPLUUCYocw1xiYc03pJy0KX
Message-ID: <0d14f148-32e0-4dac-b5e8-3230adfc5f9d@suse.com>
Date: Mon, 5 Feb 2024 14:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/7] VT-d: move dev_invalidate_iotlb() to the sole file it's
 used from
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
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
In-Reply-To: <25506838-b818-4686-8c16-3a198338af44@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

..., thus allowing it and qinval_device_iotlb_sync() to become static.
There's nothing x86-specific about the function anyway. While moving,
adjust types to better match ./CODING_STYLE (albeit use of fixed-width
types for parameters is retained to limit the effective change).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -65,12 +65,6 @@ struct acpi_drhd_unit *ioapic_to_drhd(un
 struct acpi_drhd_unit *hpet_to_drhd(unsigned int hpet_id);
 struct acpi_rhsa_unit *drhd_to_rhsa(const struct acpi_drhd_unit *drhd);
 
-int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16 did,
-                         u64 addr, unsigned int size_order, u64 type);
-
-int __must_check qinval_device_iotlb_sync(struct vtd_iommu *iommu,
-                                          struct pci_dev *pdev,
-                                          u16 did, u16 size, u64 addr);
 
 uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node);
 void free_pgtable_maddr(u64 maddr);
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -251,8 +251,9 @@ static int __must_check dev_invalidate_s
     return rc;
 }
 
-int qinval_device_iotlb_sync(struct vtd_iommu *iommu, struct pci_dev *pdev,
-                             u16 did, u16 size, u64 addr)
+static int qinval_device_iotlb_sync(struct vtd_iommu *iommu,
+                                    struct pci_dev *pdev, uint16_t did,
+                                    uint16_t size, paddr_t addr)
 {
     unsigned long flags;
     unsigned int index;
@@ -282,6 +283,101 @@ int qinval_device_iotlb_sync(struct vtd_
     return dev_invalidate_sync(iommu, pdev, did);
 }
 
+static bool device_in_domain(const struct vtd_iommu *iommu,
+                             const struct pci_dev *pdev, uint16_t did)
+{
+    struct root_entry *root_entry;
+    struct context_entry *ctxt_entry = NULL;
+    unsigned int tt;
+    bool found = false;
+
+    if ( unlikely(!iommu->root_maddr) )
+    {
+        ASSERT_UNREACHABLE();
+        return false;
+    }
+
+    root_entry = map_vtd_domain_page(iommu->root_maddr);
+    if ( !root_present(root_entry[pdev->bus]) )
+        goto out;
+
+    ctxt_entry = map_vtd_domain_page(root_entry[pdev->bus].val);
+    if ( context_domain_id(ctxt_entry[pdev->devfn]) != did )
+        goto out;
+
+    tt = context_translation_type(ctxt_entry[pdev->devfn]);
+    if ( tt != CONTEXT_TT_DEV_IOTLB )
+        goto out;
+
+    found = true;
+ out:
+    if ( root_entry )
+        unmap_vtd_domain_page(root_entry);
+
+    if ( ctxt_entry )
+        unmap_vtd_domain_page(ctxt_entry);
+
+    return found;
+}
+
+static int dev_invalidate_iotlb(struct vtd_iommu *iommu, uint16_t did,
+                                paddr_t addr, unsigned int size_order,
+                                uint64_t type)
+{
+    struct pci_dev *pdev, *temp;
+    int ret = 0;
+
+    if ( !ecap_dev_iotlb(iommu->ecap) )
+        return ret;
+
+    list_for_each_entry_safe( pdev, temp, &iommu->ats_devices, ats.list )
+    {
+        bool sbit;
+        int rc = 0;
+
+        switch ( type )
+        {
+        case DMA_TLB_DSI_FLUSH:
+            if ( !device_in_domain(iommu, pdev, did) )
+                break;
+            /* fall through if DSI condition met */
+        case DMA_TLB_GLOBAL_FLUSH:
+            /* invalidate all translations: sbit=1,bit_63=0,bit[62:12]=1 */
+            sbit = 1;
+            addr = (~0UL << PAGE_SHIFT_4K) & 0x7FFFFFFFFFFFFFFF;
+            rc = qinval_device_iotlb_sync(iommu, pdev, did, sbit, addr);
+            break;
+        case DMA_TLB_PSI_FLUSH:
+            if ( !device_in_domain(iommu, pdev, did) )
+                break;
+
+            /* if size <= 4K, set sbit = 0, else set sbit = 1 */
+            sbit = size_order ? 1 : 0;
+
+            /* clear lower bits */
+            addr &= ~0UL << PAGE_SHIFT_4K;
+
+            /* if sbit == 1, zero out size_order bit and set lower bits to 1 */
+            if ( sbit )
+            {
+                addr &= ~((u64)PAGE_SIZE_4K << (size_order - 1));
+                addr |= (((u64)1 << (size_order - 1)) - 1) << PAGE_SHIFT_4K;
+            }
+
+            rc = qinval_device_iotlb_sync(iommu, pdev, did, sbit, addr);
+            break;
+        default:
+            dprintk(XENLOG_WARNING VTDPREFIX, "invalid vt-d flush type\n");
+            return -EOPNOTSUPP;
+        }
+
+        if ( !ret )
+            ret = rc;
+    }
+
+    return ret;
+}
+
 static int __must_check queue_invalidate_iec_sync(struct vtd_iommu *iommu,
                                                   u8 granu, u8 im, u16 iidx)
 {
--- a/xen/drivers/passthrough/vtd/x86/Makefile
+++ b/xen/drivers/passthrough/vtd/x86/Makefile
@@ -1,2 +1 @@
-obj-y += ats.o
 obj-y += vtd.o
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ /dev/null
@@ -1,123 +0,0 @@
-/*
- * Copyright (c) 2006, Intel Corporation.
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
- * Author: Allen Kay <allen.m.kay@intel.com>
- */
-
-#include <xen/sched.h>
-#include <xen/iommu.h>
-#include <xen/time.h>
-#include <xen/pci.h>
-#include <xen/pci_regs.h>
-#include <asm/msi.h>
-#include "../iommu.h"
-#include "../dmar.h"
-#include "../vtd.h"
-#include "../extern.h"
-#include "../../ats.h"
-
-static bool device_in_domain(const struct vtd_iommu *iommu,
-                             const struct pci_dev *pdev, uint16_t did)
-{
-    struct root_entry *root_entry;
-    struct context_entry *ctxt_entry = NULL;
-    unsigned int tt;
-    bool found = false;
-
-    if ( unlikely(!iommu->root_maddr) )
-    {
-        ASSERT_UNREACHABLE();
-        return false;
-    }
-
-    root_entry = map_vtd_domain_page(iommu->root_maddr);
-    if ( !root_present(root_entry[pdev->bus]) )
-        goto out;
-
-    ctxt_entry = map_vtd_domain_page(root_entry[pdev->bus].val);
-    if ( context_domain_id(ctxt_entry[pdev->devfn]) != did )
-        goto out;
-
-    tt = context_translation_type(ctxt_entry[pdev->devfn]);
-    if ( tt != CONTEXT_TT_DEV_IOTLB )
-        goto out;
-
-    found = true;
-out:
-    if ( root_entry )
-        unmap_vtd_domain_page(root_entry);
-
-    if ( ctxt_entry )
-        unmap_vtd_domain_page(ctxt_entry);
-
-    return found;
-}
-
-int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16 did,
-    u64 addr, unsigned int size_order, u64 type)
-{
-    struct pci_dev *pdev, *temp;
-    int ret = 0;
-
-    if ( !ecap_dev_iotlb(iommu->ecap) )
-        return ret;
-
-    list_for_each_entry_safe( pdev, temp, &iommu->ats_devices, ats.list )
-    {
-        bool sbit;
-        int rc = 0;
-
-        switch ( type )
-        {
-        case DMA_TLB_DSI_FLUSH:
-            if ( !device_in_domain(iommu, pdev, did) )
-                break;
-            /* fall through if DSI condition met */
-        case DMA_TLB_GLOBAL_FLUSH:
-            /* invalidate all translations: sbit=1,bit_63=0,bit[62:12]=1 */
-            sbit = 1;
-            addr = (~0UL << PAGE_SHIFT_4K) & 0x7FFFFFFFFFFFFFFF;
-            rc = qinval_device_iotlb_sync(iommu, pdev, did, sbit, addr);
-            break;
-        case DMA_TLB_PSI_FLUSH:
-            if ( !device_in_domain(iommu, pdev, did) )
-                break;
-
-            /* if size <= 4K, set sbit = 0, else set sbit = 1 */
-            sbit = size_order ? 1 : 0;
-
-            /* clear lower bits */
-            addr &= ~0UL << PAGE_SHIFT_4K;
-
-            /* if sbit == 1, zero out size_order bit and set lower bits to 1 */
-            if ( sbit )
-            {
-                addr &= ~((u64)PAGE_SIZE_4K << (size_order - 1));
-                addr |= (((u64)1 << (size_order - 1)) - 1) << PAGE_SHIFT_4K;
-            }
-
-            rc = qinval_device_iotlb_sync(iommu, pdev, did, sbit, addr);
-            break;
-        default:
-            dprintk(XENLOG_WARNING VTDPREFIX, "invalid vt-d flush type\n");
-            return -EOPNOTSUPP;
-        }
-
-        if ( !ret )
-            ret = rc;
-    }
-
-    return ret;
-}


