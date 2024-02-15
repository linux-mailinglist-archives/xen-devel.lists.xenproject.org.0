Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A4855EFF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:18:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681508.1060326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYoJ-0003W3-Ap; Thu, 15 Feb 2024 10:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681508.1060326; Thu, 15 Feb 2024 10:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYoJ-0003UQ-7m; Thu, 15 Feb 2024 10:17:43 +0000
Received: by outflank-mailman (input) for mailman id 681508;
 Thu, 15 Feb 2024 10:17:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raYoH-0003UC-P1
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:17:41 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72f11edc-cbeb-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 11:17:40 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d0f7585d89so7928721fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:17:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs3-20020a056000070300b0033b45bdb2a1sm1361072wrb.4.2024.02.15.02.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:17:39 -0800 (PST)
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
X-Inumbo-ID: 72f11edc-cbeb-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707992260; x=1708597060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S2x+PfdcoJsKEcm0haAnCx/jYnp6JxJ2K1CdYjIZgsY=;
        b=Dg+PeYY4g7ZFSrD2W2hUwW5aXV8YhLSoQlPeN8H6B9opyo1Cl3DtFKjDHpfU6Saxzd
         8hkWxWcf7s1zyiep8ZHAj9wvy3ArN16M8xMtgQdISuvo51mImOncpNqx/QXP4UPRbfil
         YSRzOcbP04x36MXUgs5KQyq/gItiQr5LUNTaIri2TRMp3LSKxpsKSjBmR1sSnwvhheSR
         lap1LGUc9cguEJx+i+845aybJpsigz4+Yh5NFya0ie+i78mkUdEBqcZWHQLEYAUz16Rg
         bp8XXwmsUIYExaZXoSkoHYJ+X2wc45Su/SqfUyu7gw2Pl8FbS6otl03nb8eaEfK6My/B
         fijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707992260; x=1708597060;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2x+PfdcoJsKEcm0haAnCx/jYnp6JxJ2K1CdYjIZgsY=;
        b=d37m98UOpBrnHA19aTO/2DtI/54axGbNpAryAEvJ4gKz140A46gXDua709ioxlB8SJ
         FjXUdMeCbv10UfULxZ9zjGQ4YLTcYqaQEsov9WR5tq3JLvG+d6DU47d1uOEvCzN86Tt5
         PUFE4s4wlJ87sNsFz4k6z2I4/hGuqSeIlgSyF7wj1OSBU1mfrKYFEYtYdTRiBvmP2faS
         Vtzglhpy0t4sio3rwyYkTiFVxCad0C/rsMB/AYUG2FgROJJYCxOf/bgxhpP5jytITkST
         xCIdTTNvjOWkHik4rbABBwMxPELfSaz4p3k0dj0MXWuGiEgZtOSN5jMQ2AnDHeV6PQwZ
         /3mg==
X-Gm-Message-State: AOJu0YwapNt3GckduHgtvxViUTpU45ySNnXW3lJZ3w+bt80t8tE8BmLB
	wKJGMs0FtAqltrYuGH1ayZOYZMRKld18k3YjRIq+7bvptTWIV7hzrfhPjeSCB13T/YFEFFdeT/Q
	=
X-Google-Smtp-Source: AGHT+IF2ihrYWltASVeLsOU7+3qM+8Hfay8U7bH1prne8Az8dp65xgQ56op0n2UWrhK6Bm6HsDI41w==
X-Received: by 2002:a2e:9e10:0:b0:2d1:10cf:e887 with SMTP id e16-20020a2e9e10000000b002d110cfe887mr1135113ljk.29.1707992259760;
        Thu, 15 Feb 2024 02:17:39 -0800 (PST)
Message-ID: <0a30cf57-93ca-4ae8-a125-48c155f1f5a5@suse.com>
Date: Thu, 15 Feb 2024 11:17:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 08/12] VT-d: move ats_device() to the sole file it's used
 from
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

..., thus allowing it to become static, and thus reducing scope overlap
between it and pci_ats_device(). There's nothing x86-specific about this
function anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -65,8 +65,6 @@ struct acpi_drhd_unit *ioapic_to_drhd(un
 struct acpi_drhd_unit *hpet_to_drhd(unsigned int hpet_id);
 struct acpi_rhsa_unit *drhd_to_rhsa(const struct acpi_drhd_unit *drhd);
 
-int ats_device(const struct pci_dev *, const struct acpi_drhd_unit *);
-
 int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16 did,
                          u64 addr, unsigned int size_order, u64 type);
 
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1455,6 +1455,38 @@ static void __hwdom_init cf_check intel_
     }
 }
 
+static int ats_device(const struct pci_dev *pdev,
+                      const struct acpi_drhd_unit *drhd)
+{
+    unsigned int pos, expfl = 0;
+    const struct acpi_satc_unit *satc;
+
+    if ( !opt_ats || !iommu_qinval )
+        return 0;
+
+    if ( !ecap_queued_inval(drhd->iommu->ecap) ||
+         !ecap_dev_iotlb(drhd->iommu->ecap) )
+        return 0;
+
+    pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP);
+    if ( pos )
+        expfl = pci_conf_read16(pdev->sbdf, pos + PCI_EXP_FLAGS);
+
+    if ( MASK_EXTR(expfl, PCI_EXP_FLAGS_TYPE) != PCI_EXP_TYPE_RC_END &&
+         !acpi_find_matched_atsr_unit(pdev) )
+        return 0;
+
+    satc = acpi_find_matched_satc_unit(pdev);
+    if ( opt_ats < 0 && (!satc || !satc->atc_required) )
+        return 0;
+
+    pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
+    if ( pos )
+        drhd->iommu->flush_dev_iotlb = true;
+
+    return pos;
+}
+
 /*
  * This function returns
  * - a negative errno value upon error,
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -28,37 +28,6 @@
 #include "../extern.h"
 #include "../../ats.h"
 
-int ats_device(const struct pci_dev *pdev, const struct acpi_drhd_unit *drhd)
-{
-    unsigned int pos, expfl = 0;
-    const struct acpi_satc_unit *satc;
-
-    if ( !opt_ats || !iommu_qinval )
-        return 0;
-
-    if ( !ecap_queued_inval(drhd->iommu->ecap) ||
-         !ecap_dev_iotlb(drhd->iommu->ecap) )
-        return 0;
-
-    pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP);
-    if ( pos )
-        expfl = pci_conf_read16(pdev->sbdf, pos + PCI_EXP_FLAGS);
-
-    if ( MASK_EXTR(expfl, PCI_EXP_FLAGS_TYPE) != PCI_EXP_TYPE_RC_END &&
-         !acpi_find_matched_atsr_unit(pdev) )
-        return 0;
-
-    satc = acpi_find_matched_satc_unit(pdev);
-    if ( opt_ats < 0 && (!satc || !satc->atc_required) )
-        return 0;
-
-    pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
-    if ( pos )
-        drhd->iommu->flush_dev_iotlb = true;
-
-    return pos;
-}
-
 static bool device_in_domain(const struct vtd_iommu *iommu,
                              const struct pci_dev *pdev, uint16_t did)
 {


