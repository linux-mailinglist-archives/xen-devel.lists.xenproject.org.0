Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8661849C55
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:56:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676092.1051936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzRr-0006Xt-VD; Mon, 05 Feb 2024 13:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676092.1051936; Mon, 05 Feb 2024 13:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzRr-0006Td-Rn; Mon, 05 Feb 2024 13:55:47 +0000
Received: by outflank-mailman (input) for mailman id 676092;
 Mon, 05 Feb 2024 13:55:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWzRq-0006TN-A8
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:55:46 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 414c2133-c42e-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 14:55:44 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40fdc63f4feso6434175e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:55:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b0040efc268713sm8570104wmb.26.2024.02.05.05.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:55:43 -0800 (PST)
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
X-Inumbo-ID: 414c2133-c42e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707141343; x=1707746143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fiaRUGgpUjwp5AtuY8peqqWBSdls0Fsu1GdGBsfM0J0=;
        b=eVJT46VGTA5zY0j+N+7lUTSfJEJF5N+ILVOdLtfG798NGdusdZoAy8oyMSKpX6mX3V
         /U4gXWgR5y6DMljAdaJ6Az1ok8sIyIyPnc3MakSYaZkGbUHybmKFxXcFdfGTJb1KmfyD
         DUn6t/QYzGt55h8d1fDxFdBwyV+AZ94ZKwgjQ/7htqvvgCwNOHde3SMUzflJD69BUbHd
         rLB50gEXvr317eUGb6LXLPubG4aoTsE/2lcrdhqOF2eTta6SUG+27PAs1qbHgLGvIeoz
         pANfG3QrmVgPCVAIPNR88ydgTMfG+/w9ayV+LCiEMZLV7vgEYYw4pikNYdCME8Xm2660
         L5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707141343; x=1707746143;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiaRUGgpUjwp5AtuY8peqqWBSdls0Fsu1GdGBsfM0J0=;
        b=qKvG+U+a6fYqLioPudPRDTq5D8d5XyInf6fFHhkWcTpofYKoE12TpRxJ9ammanz+Z8
         Si7h8LRjF5LzZBh3EgfMTeYzpFCw6YwWzJNMFWwRQ5W1K1T5WPvE8oEJ41Y7JlIqDLHF
         cyoOTZMTYpewrNVPqTH+wnPCIOgafBwg0PL54HZmu19cv8dT08WsmmM26qMZz0kLPTF0
         ElfeMsO2dk2VIqv9fH3gifIL+Shk5uRn2aiwnueQ/dITtzH4Jj3e43FM2pYlsEQM98Hc
         XzxAE89yR1vZGQT7FXiI6wKzZn7Kj3jA53mSTnlv2vrIsZJ2IBP88/zCTNLm7eFwlBeS
         i2fQ==
X-Gm-Message-State: AOJu0YxFiEiaf9fIiljPkqntHCVQ5dXnn3qX2cC7a5SQVIrOnDTaq+A0
	IOMJbtHDO2PF94RlhZUkJghA/mJfxUIW8EPY36/iOSdJWKUWjyVK109sjXk1ZKFNxifBluxlMFo
	=
X-Google-Smtp-Source: AGHT+IEORSTwgdGzj2v6A6YK92N93MbcF4KbXz8hjo3fgBIdt/R1+qwm6YYcycVcpUYAr3uRdJSWWw==
X-Received: by 2002:a05:600c:468a:b0:40f:ddfb:8c63 with SMTP id p10-20020a05600c468a00b0040fddfb8c63mr925331wmo.14.1707141343544;
        Mon, 05 Feb 2024 05:55:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWNBHAB6Fq63DmwP5Jnjt2xj3vsjpWCfO13NCh26JGNny+nQbAl/7wbKI2lKWrAo7ls4iR5fWVA/Aushpl52rZqsqqvB7mshRL8KOonoXrYWPQwDDOu17Oy8/aLXiFzSA6m7dtUM5sdbO5rLsRk
Message-ID: <467d24e1-8ed3-4dda-a334-70ff747bf94b@suse.com>
Date: Mon, 5 Feb 2024 14:55:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/7] IOMMU: rename and re-type ats_enabled
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
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

Make the variable a tristate, with (as done elsewhere) a negative value
meaning "default". Since all use sites need looking at, also rename it
to match our usual "opt_*" pattern. While touching it, also move it to
.data.ro_after_init.

The only place it retains boolean nature is pci_ats_device(), for now.

In AMD code re-order conditionals to have the config space accesses
after (cheaper) flag checks.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In domain_context_mapping_one() I'm a little puzzled that translation
type is selected based on only IOMMU and global properties, i.e. not
taking the device itself into account.

--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -282,7 +282,7 @@ void amd_iommu_flush_iotlb(u8 devfn, con
     struct amd_iommu *iommu;
     unsigned int req_id, queueid, maxpend;
 
-    if ( !ats_enabled )
+    if ( opt_ats <= 0 )
         return;
 
     if ( !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn) )
@@ -340,7 +340,7 @@ static void _amd_iommu_flush_pages(struc
         flush_command_buffer(iommu, 0);
     }
 
-    if ( ats_enabled )
+    if ( opt_ats > 0 )
     {
         amd_iommu_flush_all_iotlbs(d, daddr, order);
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -185,10 +185,11 @@ static int __must_check amd_iommu_setup_
         dte->ex = ivrs_dev->dte_allow_exclusion;
         dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
 
-        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
+        if ( opt_ats > 0 &&
              !ivrs_dev->block_ats &&
-             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
-            dte->i = ats_enabled;
+             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
+             pci_ats_device(iommu->seg, bus, pdev->devfn) )
+            dte->i = true;
 
         spin_unlock_irqrestore(&iommu->lock, flags);
 
@@ -248,10 +249,11 @@ static int __must_check amd_iommu_setup_
         ASSERT(dte->sys_mgt == MASK_EXTR(ivrs_dev->device_flags,
                                          ACPI_IVHD_SYSTEM_MGMT));
 
-        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
+        if ( opt_ats > 0 &&
              !ivrs_dev->block_ats &&
-             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
-            ASSERT(dte->i == ats_enabled);
+             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
+             pci_ats_device(iommu->seg, bus, pdev->devfn) )
+            ASSERT(dte->i);
 
         spin_unlock_irqrestore(&iommu->lock, flags);
 
@@ -268,9 +270,10 @@ static int __must_check amd_iommu_setup_
 
     ASSERT(pcidevs_locked());
 
-    if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
+    if ( opt_ats > 0 &&
          !ivrs_dev->block_ats &&
          iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
+         pci_ats_device(iommu->seg, bus, pdev->devfn) &&
          !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
     {
         if ( devfn == pdev->devfn )
--- a/xen/drivers/passthrough/ats.c
+++ b/xen/drivers/passthrough/ats.c
@@ -18,8 +18,8 @@
 #include <xen/pci_regs.h>
 #include "ats.h"
 
-bool __read_mostly ats_enabled;
-boolean_param("ats", ats_enabled);
+int8_t __ro_after_init opt_ats = -1;
+boolean_param("ats", opt_ats);
 
 int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list)
 {
--- a/xen/drivers/passthrough/ats.h
+++ b/xen/drivers/passthrough/ats.h
@@ -22,7 +22,7 @@
 #define ATS_QUEUE_DEPTH_MASK     0x1f
 #define ATS_ENABLE               (1<<15)
 
-extern bool ats_enabled;
+extern int8_t opt_ats;
 
 int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list);
 void disable_ats_device(struct pci_dev *pdev);
@@ -43,7 +43,7 @@ static inline int pci_ats_enabled(int se
 
 static inline int pci_ats_device(int seg, int bus, int devfn)
 {
-    if ( !ats_enabled )
+    if ( !opt_ats )
         return 0;
 
     return pci_find_ext_capability(PCI_SBDF(seg, bus, devfn),
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1543,7 +1543,7 @@ int domain_context_mapping_one(
         }
 
         context_set_address_root(lctxt, root);
-        if ( ats_enabled && ecap_dev_iotlb(iommu->ecap) )
+        if ( opt_ats > 0 && ecap_dev_iotlb(iommu->ecap) )
             context_set_translation_type(lctxt, CONTEXT_TT_DEV_IOTLB);
         else
             context_set_translation_type(lctxt, CONTEXT_TT_MULTI_LEVEL);
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -46,7 +46,7 @@ int ats_device(const struct pci_dev *pde
     struct acpi_drhd_unit *ats_drhd;
     int pos;
 
-    if ( !ats_enabled || !iommu_qinval )
+    if ( opt_ats <= 0 || !iommu_qinval )
         return 0;
 
     if ( !ecap_queued_inval(drhd->iommu->ecap) ||


