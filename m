Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4920855EF6
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:16:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681497.1060306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYmt-0002QF-Rc; Thu, 15 Feb 2024 10:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681497.1060306; Thu, 15 Feb 2024 10:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYmt-0002Nf-OD; Thu, 15 Feb 2024 10:16:15 +0000
Received: by outflank-mailman (input) for mailman id 681497;
 Thu, 15 Feb 2024 10:16:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raYmr-0001ZT-CG
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:16:13 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eb48278-cbeb-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 11:16:12 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d0d95e8133so8328621fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:16:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs3-20020a056000070300b0033b45bdb2a1sm1361072wrb.4.2024.02.15.02.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:16:11 -0800 (PST)
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
X-Inumbo-ID: 3eb48278-cbeb-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707992172; x=1708596972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pvYCja/S6ezysFDR56QyJhiQ4LakZ7EGAU+IRQcHkow=;
        b=E8F7ztVqfJzJ4XvJ5Ep2pMkHhXV/cb7Po+L6EML++7dr1c0HpG4Jqn+KkDnkQgtR6P
         4aUMYMNfDBn0bgUq2TvpSp/s7vZf+CkOVccOuR4p4KV7cSrh2yH+CBQBmiRa6P273hPF
         Td7yflXf89uoGWsir1x4zEMQe7W5udHa9SpQn6Mw+lL31W/ptNzwZ/3rHqbzk/tdfXLy
         UDA3hm7BshaHpUZ6MOzua0NdpLAWmcHBUxVd9nxu6T7FsuEK1jJii01lEPGKwjSjT8p7
         pyWc+FDR/c8C3jRKyXXT49YMSSt5uNQ5MywfsE6stm/OZpNDjL8m9Jf6u6JU8RuJmljY
         Pu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707992172; x=1708596972;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvYCja/S6ezysFDR56QyJhiQ4LakZ7EGAU+IRQcHkow=;
        b=Qrhfw8gk1TbGXJGEVVnYHX9fei6L7WS/2KmhPyDKa5rhAEVlpjNt9NbJ+B8IFlk+uc
         AJy9Rxaph6v56NLVYGg+t3p9uyDe7aLtU0ObSb2Dgh0CHXhTa9cFmsSVJg7IVUGFCdly
         y0kqATwHsx+8RgNioL1pW0dQ6D6VIGUsSIgNsbGUjTt+LkHGruXDu95Z6B1b8+DcQldi
         2uEDCLBmeifGluEeLa10QLgmHqS+VavdlNa0KDAGNUedqEM1xCnK/wJwZY6ztRxZ4Py7
         rYe12OdGCuFHp4sUER1SivF0z/DJITflIN7+KL91jK2UFfGW3poR3BB+hdt7zJKyZZ+5
         M7+w==
X-Gm-Message-State: AOJu0YyhunNqMy3wITLvUAMzumBu9SnK4WYXFeFFxLcm4oJfcrxVKx8y
	rfPqjlXsSw3xlSSf8h351P3sNDYvPGrapOjmtpGkSuVMl9TnuWY/jqX83SN2EGO4rZ5YHD7ZgHI
	=
X-Google-Smtp-Source: AGHT+IHaNfJ1XoIWuOA4FB8Cfvo2/hwJaB1FIeDk2PiK1bwBIgOwZw0rqaqNJdskZ8Y97NbZ1KnyeA==
X-Received: by 2002:a2e:a171:0:b0:2d0:a90b:e4e3 with SMTP id u17-20020a2ea171000000b002d0a90be4e3mr844303ljl.27.1707992172169;
        Thu, 15 Feb 2024 02:16:12 -0800 (PST)
Message-ID: <e98daa41-c6b6-4f4e-b41d-84006011068d@suse.com>
Date: Thu, 15 Feb 2024 11:16:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 06/12] VT-d: respect ACPI SATC's ATC_REQUIRED flag
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
Content-Transfer-Encoding: 7bit

When the flag is set, permit Dom0 to control the device (no worse than
what we had before and in line with other "best effort" behavior we use
when it comes to Dom0), but suppress passing through to DomU-s unless
ATS can actually be enabled for such devices (and was explicitly enabled
on the command line).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over new earlier patches.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -225,7 +225,11 @@ exceptions (watchdog NMIs and unexpected
 > Default: `false`
 
 Permits Xen to set up and use PCI Address Translation Services.  This is a
-performance optimisation for PCI Passthrough.
+performance optimisation for PCI Passthrough.  Note that firmware may indicate
+that certain devices need to have ATS enabled for proper operation. For such
+devices ATS will be enabled by default, unless the option is used in its
+negative form.  Such devices will still not be eligible for passing through to
+guests, unless the option is used in its positive form.
 
 **WARNING: Xen cannot currently safely use ATS because of its synchronous wait
 loops for Queued Invalidation completions.**
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -253,6 +253,24 @@ struct acpi_atsr_unit *acpi_find_matched
     return all_ports;
 }
 
+const struct acpi_satc_unit *acpi_find_matched_satc_unit(
+    const struct pci_dev *pdev)
+{
+    const struct acpi_satc_unit *satc;
+
+    list_for_each_entry ( satc, &acpi_satc_units, list )
+    {
+        if ( satc->segment != pdev->seg )
+            continue;
+
+        for ( unsigned int i = 0; i < satc->scope.devices_cnt; ++i )
+            if ( satc->scope.devices[i] == pdev->sbdf.bdf )
+                return satc;
+    }
+
+    return NULL;
+}
+
 struct acpi_rhsa_unit *drhd_to_rhsa(const struct acpi_drhd_unit *drhd)
 {
     struct acpi_rhsa_unit *rhsa;
--- a/xen/drivers/passthrough/vtd/dmar.h
+++ b/xen/drivers/passthrough/vtd/dmar.h
@@ -112,6 +112,8 @@ struct acpi_satc_unit {
 
 struct acpi_drhd_unit *acpi_find_matched_drhd_unit(const struct pci_dev *);
 struct acpi_atsr_unit *acpi_find_matched_atsr_unit(const struct pci_dev *);
+const struct acpi_satc_unit *acpi_find_matched_satc_unit(
+    const struct pci_dev *pdev);
 
 #define DMAR_TYPE 1
 #define RMRR_TYPE 2
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2364,6 +2364,26 @@ static int cf_check intel_iommu_add_devi
     if ( ret )
         dprintk(XENLOG_ERR VTDPREFIX, "%pd: context mapping failed\n",
                 pdev->domain);
+    else if ( !pdev->broken )
+    {
+        const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+        const struct acpi_satc_unit *satc = acpi_find_matched_satc_unit(pdev);
+
+        /*
+         * Prevent the device from getting assigned to an unprivileged domain
+         * when firmware indicates ATS is required, but ATS could not be enabled
+         * or was not explicitly enabled via command line option.
+         */
+        if ( satc && satc->atc_required &&
+             (!drhd || ats_device(pdev, drhd) <= 0 ||
+              !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn) ||
+              opt_ats < 0) )
+        {
+            printk(XENLOG_WARNING "ATS: %pp is not eligible for pass-through\n",
+                   &pdev->sbdf);
+            pdev->broken = true;
+        }
+    }
 
     return ret;
 }
@@ -2375,12 +2395,26 @@ static int cf_check intel_iommu_enable_d
 
     pci_vtd_quirk(pdev);
 
-    if ( ret <= 0 )
-        return ret;
+    if ( ret <= 0 ||
+         (ret = enable_ats_device(pdev, &drhd->iommu->ats_devices)) < 0 ||
+         opt_ats < 0 )
+    {
+        const struct acpi_satc_unit *satc = acpi_find_matched_satc_unit(pdev);
+
+        /*
+         * Besides in error cases also prevent the device from getting assigned
+         * to an unprivileged domain when firmware indicates ATS is required,
+         * but ATS use was not explicitly enabled via command line option.
+         */
+        if ( satc && satc->atc_required && !pdev->broken )
+        {
+            printk(XENLOG_WARNING "ATS: %pp is not eligible for pass-through\n",
+                   &pdev->sbdf);
+            pdev->broken = true;
+        }
+    }
 
-    ret = enable_ats_device(pdev, &drhd->iommu->ats_devices);
-
-    return ret >= 0 ? 0 : ret;
+    return ret <= 0 ? ret : 0;
 }
 
 static int cf_check intel_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -45,8 +45,9 @@ int ats_device(const struct pci_dev *pde
 {
     struct acpi_drhd_unit *ats_drhd;
     unsigned int pos, expfl = 0;
+    const struct acpi_satc_unit *satc;
 
-    if ( opt_ats <= 0 || !iommu_qinval )
+    if ( !opt_ats || !iommu_qinval )
         return 0;
 
     if ( !ecap_queued_inval(drhd->iommu->ecap) ||
@@ -61,6 +62,10 @@ int ats_device(const struct pci_dev *pde
          !acpi_find_matched_atsr_unit(pdev) )
         return 0;
 
+    satc = acpi_find_matched_satc_unit(pdev);
+    if ( opt_ats < 0 && (!satc || !satc->atc_required) )
+        return 0;
+
     ats_drhd = find_ats_dev_drhd(drhd->iommu);
     pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
 


