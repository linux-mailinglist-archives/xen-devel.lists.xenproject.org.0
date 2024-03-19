Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA40387FED4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 14:28:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695378.1085081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZVo-0008AJ-Bx; Tue, 19 Mar 2024 13:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695378.1085081; Tue, 19 Mar 2024 13:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZVo-000875-8Z; Tue, 19 Mar 2024 13:28:16 +0000
Received: by outflank-mailman (input) for mailman id 695378;
 Tue, 19 Mar 2024 13:28:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmZVn-00086x-AU
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 13:28:15 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 893e7e7b-e5f4-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 14:28:13 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a467d8efe78so591257966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 06:28:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bw9-20020a170906c1c900b00a4668970f74sm6127780ejb.108.2024.03.19.06.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 06:28:12 -0700 (PDT)
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
X-Inumbo-ID: 893e7e7b-e5f4-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710854893; x=1711459693; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kCUKBUd/0z/5BlQq1KKRdv2GUHOSaXTPvWFHMRtn9I=;
        b=FPBZCg4fIj5nOi4z0dVv0Cp6qQUKH9u6G16vdWgcTiI9jpSA9JeMIyKDRcZ5P0X4oA
         3/n99iBGdr2+8kVALBOVcDqNZAvfh4zCbVmq7vfR2sVqUirBmGCQnUo1to2c/YtRvwF4
         54RUvMaRYpKHiDB373O4BBiDpqRbtHchSD0OgYco1rgI/SERA1fKpkYK87ldH8vtNYM5
         anFJ0e8mkF6dVJJRaDNLeMuiSZ3pyeSy88E2ZIniX0Mb4OD9xe7ii6EJOeK/Fcwu5otG
         6cv7t5aGERpqHUaf0QFgDij6bKQkc2BN3fJ50UX5DRP1wyg0ZqU7G5+GnMn//fy6D0xL
         6T4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854893; x=1711459693;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4kCUKBUd/0z/5BlQq1KKRdv2GUHOSaXTPvWFHMRtn9I=;
        b=PpAO2ZAKs63t0jihT2S0arenqEV9x90hXtFB2oE0tXXC7vSx90our1wVukLPcnEuwf
         Ivx6O9fibNQJSPHykPlwJ66dOvgVnJps/SCy/ZIWWlF8mVqiu+uTj8pV2VhCFjZALrd2
         tY9TdjU5jGyC0FbuFJIlBSGrYcw2z8tO2uy/HDuC5w4tJBc3qYmdoIAxvqPBFfN3GUYo
         BE/wHR9gTB0gK7g95LNIJ77rlzL5BL1WCJ6uwrKhPXcx+s2gSuFmg4NSiSQaj5R/oc3L
         J+58hoNPNEJxlYOrQIFep9ASKUefAtbGXFqAytrFFgmt8JMcbDKeTN3JirtvGWeHAkC2
         MIcw==
X-Gm-Message-State: AOJu0Yy63Q5t9Xloq5mILjLOpKKewO/0R5lQ+SaIgmNenm0KG04xkx95
	QBmGTL2UD4neccru3xD02GzM7uhdrUgxPCGvmhyFaQabxZ1fTvIQrHnUCdnN1rumSouBn5U9Zr4
	=
X-Google-Smtp-Source: AGHT+IEKnsWavcdNmR9AUft1uEnvaVZWVHc0F+GYZCB0NWkPeSViP2P0cUMy448ihJ2hYkyGXYFu+Q==
X-Received: by 2002:a17:906:ddb:b0:a46:4d16:439b with SMTP id p27-20020a1709060ddb00b00a464d16439bmr1972392eji.43.1710854892808;
        Tue, 19 Mar 2024 06:28:12 -0700 (PDT)
Message-ID: <5eb98372-2992-4a93-846c-4e325c41af98@suse.com>
Date: Tue, 19 Mar 2024 14:28:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] AMD/IOMMU: drop remaining guest-IOMMU bits too
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

With a02174c6c885 ("amd/iommu: clean up unused guest iommu related
functions") having removed the sole place where d->g_iommu would be set
to non-NULL, guest_iommu_add_ppr_log() will unconditionally bail the
latest from its 2nd if(). With it dropped, all other stuff in the file
is unused, too. Delete iommu_guest.c altogether.

Further delete struct guest{_buffer,_dev_table,_iommu{,_msi}} as well as
struct mmio_reg for being unused with the unused g_iommu also dropped
from struct arch_iommu.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wasn't sure how far to further go with removing the body of
parse_ppr_log_entry(), or perhaps even the entire function, and then
further up to all PPR logging code. Hence why for now I've merely
commented out the function call into the file being deleted (which of
course Misra isn't going to like). Thoughts / suggestions?

I further wonder whether set_iommu_guest_translation_control() should
have been invoked independent of guest-IOMMU actually being enabled. IOW
that may want purging, too. Along these lines iommuv2_enabled may also
want dropping, for not having any consumer left. Much like has_viommu()
and then also {XEN_,}X86_EMU_IOMMU, i.e. going as far as affecting the
public interface.

--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -52,7 +52,6 @@ struct arch_iommu
         struct {
             unsigned int paging_mode;
             struct page_info *root_table;
-            struct guest_iommu *g_iommu;
         } amd;
     };
 };
--- a/xen/drivers/passthrough/amd/Makefile
+++ b/xen/drivers/passthrough/amd/Makefile
@@ -5,4 +5,3 @@ obj-y += pci_amd_iommu.o
 obj-bin-y += iommu_acpi.init.o
 obj-y += iommu_intr.o
 obj-y += iommu_cmd.o
-obj-$(CONFIG_HVM) += iommu_guest.o
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -145,57 +145,6 @@ int iterate_ivrs_entries(int (*handler)(
                                         struct ivrs_mappings *map,
                                         uint16_t bdf));
 
-/* iommu tables in guest space */
-struct mmio_reg {
-    uint32_t    lo;
-    uint32_t    hi;
-};
-
-struct guest_dev_table {
-    struct mmio_reg         reg_base;
-    uint32_t                size;
-};
-
-struct guest_buffer {
-    struct mmio_reg         reg_base;
-    struct mmio_reg         reg_tail;
-    struct mmio_reg         reg_head;
-    uint32_t                size;
-};
-
-struct guest_iommu_msi {
-    uint8_t                 vector;
-    uint8_t                 dest;
-    uint8_t                 dest_mode;
-    uint8_t                 delivery_mode;
-    uint8_t                 trig_mode;
-};
-
-/* virtual IOMMU structure */
-struct guest_iommu {
-
-    struct domain          *domain;
-    spinlock_t              lock;
-    bool                    enabled;
-
-    struct guest_dev_table  dev_table;
-    struct guest_buffer     cmd_buffer;
-    struct guest_buffer     event_log;
-    struct guest_buffer     ppr_log;
-
-    struct tasklet          cmd_buffer_tasklet;
-
-    uint64_t                mmio_base;             /* MMIO base address */
-
-    /* MMIO regs */
-    union amd_iommu_control reg_ctrl;              /* MMIO offset 0018h */
-    struct mmio_reg         reg_status;            /* MMIO offset 2020h */
-    union amd_iommu_ext_features reg_ext_feature;  /* MMIO offset 0030h */
-
-    /* guest interrupt settings */
-    struct guest_iommu_msi  msi;
-};
-
 extern bool iommuv2_enabled;
 
 struct acpi_ivrs_hardware;
@@ -344,13 +293,6 @@ void cf_check amd_iommu_resume(void);
 int __must_check cf_check amd_iommu_suspend(void);
 void cf_check amd_iommu_crash_shutdown(void);
 
-/* guest iommu support */
-#ifdef CONFIG_HVM
-void guest_iommu_add_ppr_log(struct domain *d, uint32_t entry[]);
-#else
-static inline void guest_iommu_add_ppr_log(struct domain *d, uint32_t entry[]) {}
-#endif
-
 static inline u32 get_field_from_reg_u32(u32 reg_value, u32 mask, u32 shift)
 {
     u32 field;
--- a/xen/drivers/passthrough/amd/iommu_guest.c
+++ /dev/null
@@ -1,120 +0,0 @@
-/*
- * Copyright (C) 2011 Advanced Micro Devices, Inc.
- * Author: Wei Wang <wei.wang2@amd.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include <asm/p2m.h>
-
-#include "iommu.h"
-
-#define reg_to_u64(reg) (((uint64_t)reg.hi << 32) | reg.lo )
-
-static uint16_t get_guest_bdf(struct domain *d, uint16_t machine_bdf)
-{
-    return machine_bdf;
-}
-
-static inline struct guest_iommu *domain_iommu(struct domain *d)
-{
-    return dom_iommu(d)->arch.amd.g_iommu;
-}
-
-static unsigned long get_gfn_from_base_reg(uint64_t base_raw)
-{
-    base_raw &= PADDR_MASK;
-    ASSERT ( base_raw != 0 );
-    return base_raw >> PAGE_SHIFT;
-}
-
-static void guest_iommu_deliver_msi(struct domain *d)
-{
-    uint8_t vector, dest, dest_mode, delivery_mode, trig_mode;
-    struct guest_iommu *iommu = domain_iommu(d);
-
-    vector = iommu->msi.vector;
-    dest = iommu->msi.dest;
-    dest_mode = iommu->msi.dest_mode;
-    delivery_mode = iommu->msi.delivery_mode;
-    trig_mode = iommu->msi.trig_mode;
-
-    vmsi_deliver(d, vector, dest, dest_mode, delivery_mode, trig_mode);
-}
-
-static unsigned long guest_iommu_get_table_mfn(struct domain *d,
-                                               uint64_t base_raw,
-                                               unsigned int pos)
-{
-    unsigned long idx, gfn, mfn;
-    p2m_type_t p2mt;
-
-    gfn = get_gfn_from_base_reg(base_raw);
-    idx = pos >> PAGE_SHIFT;
-
-    mfn = mfn_x(get_gfn(d, gfn + idx, &p2mt));
-    put_gfn(d, gfn);
-
-    return mfn;
-}
-
-void guest_iommu_add_ppr_log(struct domain *d, u32 entry[])
-{
-    uint16_t gdev_id;
-    unsigned long mfn, tail, head;
-    ppr_entry_t *log;
-    struct guest_iommu *iommu;
-
-    if ( !is_hvm_domain(d) )
-        return;
-
-    iommu = domain_iommu(d);
-    if ( !iommu )
-        return;
-
-    tail = iommu->ppr_log.reg_tail.lo;
-    head = iommu->ppr_log.reg_head.lo;
-
-    if ( tail >= iommu->ppr_log.size || head >= iommu->ppr_log.size )
-    {
-        AMD_IOMMU_DEBUG("Error: guest iommu ppr log overflows\n");
-        iommu->enabled = 0;
-        return;
-    }
-
-    mfn = guest_iommu_get_table_mfn(d, reg_to_u64(iommu->ppr_log.reg_base),
-                                    tail);
-    ASSERT(mfn_valid(_mfn(mfn)));
-
-    log = map_domain_page(_mfn(mfn)) + (tail & ~PAGE_MASK);
-
-    /* Convert physical device id back into virtual device id */
-    gdev_id = get_guest_bdf(d, iommu_get_devid_from_cmd(entry[0]));
-    iommu_set_devid_to_cmd(&entry[0], gdev_id);
-
-    memcpy(log, entry, sizeof(ppr_entry_t));
-
-    /* Now shift ppr log tail pointer */
-    tail += sizeof(ppr_entry_t);
-    if ( tail >= iommu->ppr_log.size )
-    {
-        tail = 0;
-        iommu->reg_status.lo |= IOMMU_STATUS_PPR_LOG_OVERFLOW;
-    }
-
-    iommu->ppr_log.reg_tail.lo = tail;
-    unmap_domain_page(log);
-
-    guest_iommu_deliver_msi(d);
-}
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -646,7 +646,7 @@ static void cf_check parse_ppr_log_entry
     pcidevs_unlock();
 
     if ( pdev )
-        guest_iommu_add_ppr_log(pdev->domain, entry);
+        /* guest_iommu_add_ppr_log(pdev->domain, entry) */;
 }
 
 static void iommu_check_ppr_log(struct amd_iommu *iommu)

