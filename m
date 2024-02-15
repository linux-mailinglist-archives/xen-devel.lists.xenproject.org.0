Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650E0855EFB
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681501.1060315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYnF-0002u8-2M; Thu, 15 Feb 2024 10:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681501.1060315; Thu, 15 Feb 2024 10:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYnE-0002sH-VP; Thu, 15 Feb 2024 10:16:36 +0000
Received: by outflank-mailman (input) for mailman id 681501;
 Thu, 15 Feb 2024 10:16:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raYnD-0001ZT-Rs
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:16:35 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c127b56-cbeb-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 11:16:35 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33b4e6972f6so277487f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:16:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs3-20020a056000070300b0033b45bdb2a1sm1361072wrb.4.2024.02.15.02.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:16:34 -0800 (PST)
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
X-Inumbo-ID: 4c127b56-cbeb-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707992194; x=1708596994; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XNeK3bYqgsZfsvAYZefEQLICnz9K9i5e8fWmt9YKjrw=;
        b=FAAFF1AcP2IY3bkknHl7wbK8GpMFJf2q1TRCaw7K1nvQcsoqWESng/m023h/HW+uU2
         dQ0B9JDHjNXoFVCS639eLWlj7v3w4sWTLTzyqLTbQlhHW7r/aUKP8x/uxFFcVMqvtkAL
         faCK0mdlou7aVzYxpGuPLLki3AzcWPLSIbK+JOuSIXaNNX7hdGBKuzaMmrB54kPC7lcQ
         HKGf14iar+ATuyfQJKdxlGlkqpE1XnchjvtjNA5XW8dRWna0D2Zb7E4UxCjSkfLyyDex
         1ZtmsyRwEt9WvsvmMpdqzmRbWMScVEANTB3N2lIEOFW7j62UOHxgSllR43rey7VeYZ+I
         Mo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707992194; x=1708596994;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNeK3bYqgsZfsvAYZefEQLICnz9K9i5e8fWmt9YKjrw=;
        b=tK3WkF4J0zxfoAWVzOG/hpVt/eM51oHjtY2g4/SPxLqx74wcsFpgo631e0kxDiI9UX
         EfRF/JbXpIoVG/d18iYoWLuKRW2fIeMADCWRRLC9eNLdQJP9XH0y8mLHPBdIADcZr66H
         tQS7VgwwdLvpIetrBeJloFJwTH2bCFWPA5/Y6j91Uocnh5enbg4etBxddpWvHPIGaTET
         bS+3+RqRWMB29cozqN3jisgFI+ope9Fcdd1RxwEC/oei0wPprTOAh7dtwX5rh1BYEycJ
         rfsmukQ7gj1Y9QwWQ16DoTdeu2miK1/bxjJJAqBjNQ1OyvN5tnvKrqfZgi3RQUvj6xUZ
         XOFA==
X-Gm-Message-State: AOJu0YzjP0SS6aNUWENzMoAP2YCiETQHMIT15kKwKTTQJ4DOL475wuk3
	zE9mEVVl9Q1NvXLQlmMOMfM8FqyIgWQ6qh0LTOC+hGXEiTgzoe/9qR2D5CWRniK8HU2DuePBeT4
	=
X-Google-Smtp-Source: AGHT+IEBToj/5jt4OtESG6EbViirEv991GlvJtBi+TFX2uxp33Hn+F84evlIFXdE+Q/+B48v8GDU0A==
X-Received: by 2002:a5d:6882:0:b0:33b:6d5e:7645 with SMTP id h2-20020a5d6882000000b0033b6d5e7645mr759086wru.38.1707992194487;
        Thu, 15 Feb 2024 02:16:34 -0800 (PST)
Message-ID: <bbb0e7cd-b5c9-4227-8f56-0d3e159ff7b2@suse.com>
Date: Thu, 15 Feb 2024 11:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 07/12] VT-d: replace find_ats_dev_drhd()
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

All callers only care about boolean outcome. For this there's no point
in allocating a duplicate of the respective DRHD structure; a simple
boolean suffices (which eventually may want to become a count, such that
the "any ATS devices assigned state" can also clear again). With that
boolean, remove respective parameters from internal helper functions
right away, as those have access to the flag through another parameter.
(While the corresponding hook can have the parameter dropped too then,
leave this for a separate change, to limit scope here.)

No functional effect intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v2: Re-base over new earlier patches.

--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -65,8 +65,6 @@ struct acpi_drhd_unit *ioapic_to_drhd(un
 struct acpi_drhd_unit *hpet_to_drhd(unsigned int hpet_id);
 struct acpi_rhsa_unit *drhd_to_rhsa(const struct acpi_drhd_unit *drhd);
 
-struct acpi_drhd_unit *find_ats_dev_drhd(struct vtd_iommu *iommu);
-
 int ats_device(const struct pci_dev *, const struct acpi_drhd_unit *);
 
 int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16 did,
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -624,8 +624,7 @@ int cf_check vtd_flush_iotlb_reg(
 }
 
 static int __must_check iommu_flush_iotlb_global(struct vtd_iommu *iommu,
-                                                 bool flush_non_present_entry,
-                                                 bool flush_dev_iotlb)
+                                                 bool flush_non_present_entry)
 {
     int status;
 
@@ -633,7 +632,7 @@ static int __must_check iommu_flush_iotl
     vtd_ops_preamble_quirk(iommu);
 
     status = iommu->flush.iotlb(iommu, 0, 0, 0, DMA_TLB_GLOBAL_FLUSH,
-                                flush_non_present_entry, flush_dev_iotlb);
+                                flush_non_present_entry, iommu->flush_dev_iotlb);
 
     /* undo platform specific errata workarounds */
     vtd_ops_postamble_quirk(iommu);
@@ -642,8 +641,7 @@ static int __must_check iommu_flush_iotl
 }
 
 static int __must_check iommu_flush_iotlb_dsi(struct vtd_iommu *iommu, u16 did,
-                                              bool flush_non_present_entry,
-                                              bool flush_dev_iotlb)
+                                              bool flush_non_present_entry)
 {
     int status;
 
@@ -651,7 +649,7 @@ static int __must_check iommu_flush_iotl
     vtd_ops_preamble_quirk(iommu);
 
     status = iommu->flush.iotlb(iommu, did, 0, 0, DMA_TLB_DSI_FLUSH,
-                                flush_non_present_entry, flush_dev_iotlb);
+                                flush_non_present_entry, iommu->flush_dev_iotlb);
 
     /* undo platform specific errata workarounds */
     vtd_ops_postamble_quirk(iommu);
@@ -661,26 +659,23 @@ static int __must_check iommu_flush_iotl
 
 static int __must_check iommu_flush_iotlb_psi(struct vtd_iommu *iommu, u16 did,
                                               u64 addr, unsigned int order,
-                                              bool flush_non_present_entry,
-                                              bool flush_dev_iotlb)
+                                              bool flush_non_present_entry)
 {
     int status;
 
     /* Fallback to domain selective flush if no PSI support */
     if ( !cap_pgsel_inv(iommu->cap) )
-        return iommu_flush_iotlb_dsi(iommu, did, flush_non_present_entry,
-                                     flush_dev_iotlb);
+        return iommu_flush_iotlb_dsi(iommu, did, flush_non_present_entry);
 
     /* Fallback to domain selective flush if size is too big */
     if ( order > cap_max_amask_val(iommu->cap) )
-        return iommu_flush_iotlb_dsi(iommu, did, flush_non_present_entry,
-                                     flush_dev_iotlb);
+        return iommu_flush_iotlb_dsi(iommu, did, flush_non_present_entry);
 
     /* apply platform specific errata workarounds */
     vtd_ops_preamble_quirk(iommu);
 
     status = iommu->flush.iotlb(iommu, did, addr, order, DMA_TLB_PSI_FLUSH,
-                                flush_non_present_entry, flush_dev_iotlb);
+                                flush_non_present_entry, iommu->flush_dev_iotlb);
 
     /* undo platform specific errata workarounds */
     vtd_ops_postamble_quirk(iommu);
@@ -692,7 +687,6 @@ static int __must_check iommu_flush_all(
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
-    bool flush_dev_iotlb;
     int rc = 0;
 
     flush_local(FLUSH_CACHE);
@@ -703,8 +697,7 @@ static int __must_check iommu_flush_all(
 
         iommu = drhd->iommu;
         context_rc = iommu_flush_context_global(iommu, 0);
-        flush_dev_iotlb = !!find_ats_dev_drhd(iommu);
-        iotlb_rc = iommu_flush_iotlb_global(iommu, 0, flush_dev_iotlb);
+        iotlb_rc = iommu_flush_iotlb_global(iommu, 0);
 
         /*
          * The current logic for returns:
@@ -734,7 +727,6 @@ static int __must_check cf_check iommu_f
     struct domain_iommu *hd = dom_iommu(d);
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
-    bool flush_dev_iotlb;
     int iommu_domid;
     int ret = 0;
 
@@ -762,21 +754,18 @@ static int __must_check cf_check iommu_f
         if ( !test_bit(iommu->index, hd->arch.vtd.iommu_bitmap) )
             continue;
 
-        flush_dev_iotlb = !!find_ats_dev_drhd(iommu);
         iommu_domid = get_iommu_did(d->domain_id, iommu, !d->is_dying);
         if ( iommu_domid == -1 )
             continue;
 
         if ( !page_count || (page_count & (page_count - 1)) ||
              dfn_eq(dfn, INVALID_DFN) || !IS_ALIGNED(dfn_x(dfn), page_count) )
-            rc = iommu_flush_iotlb_dsi(iommu, iommu_domid,
-                                       0, flush_dev_iotlb);
+            rc = iommu_flush_iotlb_dsi(iommu, iommu_domid, 0);
         else
             rc = iommu_flush_iotlb_psi(iommu, iommu_domid,
                                        dfn_to_daddr(dfn),
                                        get_order_from_pages(page_count),
-                                       !(flush_flags & IOMMU_FLUSHF_modified),
-                                       flush_dev_iotlb);
+                                       !(flush_flags & IOMMU_FLUSHF_modified));
 
         if ( rc > 0 )
             iommu_flush_write_buffer(iommu);
@@ -1488,7 +1477,6 @@ int domain_context_mapping_one(
     uint16_t seg = iommu->drhd->segment, prev_did = 0;
     struct domain *prev_dom = NULL;
     int rc, ret;
-    bool flush_dev_iotlb;
 
     if ( QUARANTINE_SKIP(domain, pgd_maddr) )
         return 0;
@@ -1637,8 +1625,7 @@ int domain_context_mapping_one(
 
     rc = iommu_flush_context_device(iommu, prev_did, PCI_BDF(bus, devfn),
                                     DMA_CCMD_MASK_NOBIT, !prev_dom);
-    flush_dev_iotlb = !!find_ats_dev_drhd(iommu);
-    ret = iommu_flush_iotlb_dsi(iommu, prev_did, !prev_dom, flush_dev_iotlb);
+    ret = iommu_flush_iotlb_dsi(iommu, prev_did, !prev_dom);
 
     /*
      * The current logic for returns:
@@ -1882,7 +1869,6 @@ int domain_context_unmap_one(
     struct context_entry *context, *context_entries;
     u64 maddr;
     int iommu_domid, rc, ret;
-    bool flush_dev_iotlb;
 
     ASSERT(pcidevs_locked());
     spin_lock(&iommu->lock);
@@ -1908,8 +1894,7 @@ int domain_context_unmap_one(
                                     PCI_BDF(bus, devfn),
                                     DMA_CCMD_MASK_NOBIT, 0);
 
-    flush_dev_iotlb = !!find_ats_dev_drhd(iommu);
-    ret = iommu_flush_iotlb_dsi(iommu, iommu_domid, 0, flush_dev_iotlb);
+    ret = iommu_flush_iotlb_dsi(iommu, iommu_domid, 0);
 
     /*
      * The current logic for returns:
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -484,6 +484,7 @@ struct vtd_iommu {
     spinlock_t register_lock; /* protect iommu register handling */
     u64 root_maddr; /* root entry machine address */
     nodeid_t node;
+    bool flush_dev_iotlb;
     struct msi_desc msi;
     struct acpi_drhd_unit *drhd;
 
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -28,22 +28,8 @@
 #include "../extern.h"
 #include "../../ats.h"
 
-static LIST_HEAD(ats_dev_drhd_units);
-
-struct acpi_drhd_unit *find_ats_dev_drhd(struct vtd_iommu *iommu)
-{
-    struct acpi_drhd_unit *drhd;
-    list_for_each_entry ( drhd, &ats_dev_drhd_units, list )
-    {
-        if ( drhd->iommu == iommu )
-            return drhd;
-    }
-    return NULL;
-}
-
 int ats_device(const struct pci_dev *pdev, const struct acpi_drhd_unit *drhd)
 {
-    struct acpi_drhd_unit *ats_drhd;
     unsigned int pos, expfl = 0;
     const struct acpi_satc_unit *satc;
 
@@ -66,17 +52,10 @@ int ats_device(const struct pci_dev *pde
     if ( opt_ats < 0 && (!satc || !satc->atc_required) )
         return 0;
 
-    ats_drhd = find_ats_dev_drhd(drhd->iommu);
     pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
+    if ( pos )
+        drhd->iommu->flush_dev_iotlb = true;
 
-    if ( pos && (ats_drhd == NULL) )
-    {
-        ats_drhd = xmalloc(struct acpi_drhd_unit);
-        if ( !ats_drhd )
-            return -ENOMEM;
-        *ats_drhd = *drhd;
-        list_add_tail(&ats_drhd->list, &ats_dev_drhd_units);
-    }
     return pos;
 }
 


