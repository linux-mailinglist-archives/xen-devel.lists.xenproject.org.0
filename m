Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90871849C5A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:56:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676094.1051945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzSL-000716-77; Mon, 05 Feb 2024 13:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676094.1051945; Mon, 05 Feb 2024 13:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzSL-0006yk-46; Mon, 05 Feb 2024 13:56:17 +0000
Received: by outflank-mailman (input) for mailman id 676094;
 Mon, 05 Feb 2024 13:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWzSK-0005z2-EW
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:56:16 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53ff4ee0-c42e-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 14:56:15 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40fdc63f4feso6439345e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:56:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b0040efc268713sm8570104wmb.26.2024.02.05.05.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:56:14 -0800 (PST)
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
X-Inumbo-ID: 53ff4ee0-c42e-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707141375; x=1707746175; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f3H4Ur0/gJhZeUF8ayz9NPkqLMEexvZyofs8rqJKkAY=;
        b=bnk6Ne5TkNLQlBI/EGNGIGMrB5XCMSXlaXx22raY7a4IrIFUVjhLevhHDdQycULtPk
         IrSRqXifhqn+NPcoeRWCzIMLXiV92mu5XmW44eeAPv4EbMKDQ1939kvRzIzR5NwPOsC/
         L4p58qwUOHRzCLbf8ltHvvUfC6PMRavRVGFsWz6O23LtjarWSlZ2Vx5NRWKbY7zVea0V
         RvUMbD6Oj4z9lzpIISwB4RM+dbKwYgBQdZh9RDa3YdyWpK2NtZHcQqIAtriMVQL1AcRA
         j3sc4h7pURDYTtoPiPSnsDMP67zGZb11bgvPnexBhMWU5kA9BpJHy6G7RrG01wjP0Gtk
         cmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707141375; x=1707746175;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3H4Ur0/gJhZeUF8ayz9NPkqLMEexvZyofs8rqJKkAY=;
        b=lMyYoMg/mEs4zKlpgb/ZzjN2+7tNhH6gpNoK++2MdrUuIs2EKM+7nchyIBfbfDlOk8
         kllICMOzINyzCwCoCmnxF3q8Q/t3HjYQanOE7H0Z4jn5NOisVMHg7ZVYZ2bItKHV1qRT
         02mhP9zbNZ1pSL7JkE+Bx5ZqUHiIPB8ggkRLBnpzkqjV0Yakbt6uH11ei5Tt7PSX/qfQ
         FPK1v6uYoHGKxfj5At8uL4fg1Sg4zFz1jPo5qLZpGgG6gnZVSSRQy0YOnqRXqo40PlSA
         w8XYl1UhFuwJgnnnSgCJq6JWOECNMNHUHZxLS+s9/5qfhH0787NAcmpls8A3wNpYZhzM
         ajjg==
X-Gm-Message-State: AOJu0YwMniZxxgNRlaWLZUQsTvCHHdCSK1s2eo73a7xd9N0rK2PHOS6O
	7VkYKlY5rxgAGbkrNofPqXCeY6yJfUwIRvP6PoIItPi5bYkkFXI2iEGF9NQwYwfu80q904B93Wo
	=
X-Google-Smtp-Source: AGHT+IHKs0cihTxNqeV8nuhiv1fHgALzE+NMfvV0hATXeqzhpcrCBAjxfZRCmqp2eFQgxjF23ijOOg==
X-Received: by 2002:a05:600c:3583:b0:40e:bfbf:f368 with SMTP id p3-20020a05600c358300b0040ebfbff368mr5255342wmq.2.1707141375004;
        Mon, 05 Feb 2024 05:56:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUdLl+7bK14Slxd41prmGWLqlG/OLqz6/Vf8MXC/p7KCgrx7cXUy6+eZgWOqDWZdfbp3o7Qsc8XLekPoLOzpEICNsAlr8BUdGVvywCVVBMC9Ynf
Message-ID: <72496fb7-8835-4d45-bd92-7e7d612861c7@suse.com>
Date: Mon, 5 Feb 2024 14:56:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/7] VT-d: respect ACPI SATC's ATC_REQUIRED flag
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

When the flag is set, permit Dom0 to control the device (no worse than
what we had before and in line with other "best effort" behavior we use
when it comes to Dom0), but suppress passing through to DomU-s unless
ATS can actually be enabled for such devices.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Is ats_device() using acpi_find_matched_atsr_unit() unconditionally
actually correct? Shouldn't that check be skipped for root complex
integrated devices?

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -225,7 +225,10 @@ exceptions (watchdog NMIs and unexpected
 > Default: `false`
 
 Permits Xen to set up and use PCI Address Translation Services.  This is a
-performance optimisation for PCI Passthrough.
+performance optimisation for PCI Passthrough.  Note that firmware may indicate
+that certain devices need to have ATS enabled for proper operation. For such
+devices ATS will be enabled by default, unless the option is used in its
+negative form.
 
 **WARNING: Xen cannot currently safely use ATS because of its synchronous wait
 loops for Queued Invalidation completions.**
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -254,6 +254,24 @@ struct acpi_atsr_unit *acpi_find_matched
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
@@ -109,6 +109,8 @@ struct acpi_satc_unit {
 
 struct acpi_drhd_unit *acpi_find_matched_drhd_unit(const struct pci_dev *);
 struct acpi_atsr_unit *acpi_find_matched_atsr_unit(const struct pci_dev *);
+const struct acpi_satc_unit *acpi_find_matched_satc_unit(
+    const struct pci_dev *pdev);
 
 #define DMAR_TYPE 1
 #define RMRR_TYPE 2
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2364,6 +2364,25 @@ static int cf_check intel_iommu_add_devi
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
+         * (e.g. because of being suppressed via command line option).
+         */
+        if ( satc && satc->atc_required &&
+             (!drhd || ats_device(pdev, drhd) <= 0 ||
+              !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn)) )
+        {
+            printk(XENLOG_WARNING "ATS: %pp is not eligible for pass-through\n",
+                   &pdev->sbdf);
+            pdev->broken = true;
+        }
+    }
 
     return ret;
 }
@@ -2375,12 +2394,27 @@ static int cf_check intel_iommu_enable_d
 
     pci_vtd_quirk(pdev);
 
-    if ( ret <= 0 )
-        return ret;
+    if ( ret <= 0 ||
+         (ret = enable_ats_device(pdev, &drhd->iommu->ats_devices)) < 0 )
+    {
+        const struct acpi_satc_unit *satc = acpi_find_matched_satc_unit(pdev);
+
+        /*
+         * Prevent the device from getting assigned to an unprivileged domain
+         * when firmware indicates ATS is required, but ATS use was disabled
+         * via command line option.
+         */
+        if ( satc && satc->atc_required && !pdev->broken )
+        {
+            printk(XENLOG_WARNING "ATS: %pp is not eligible for pass-through\n",
+                   &pdev->sbdf);
+            pdev->broken = true;
+        }
 
-    ret = enable_ats_device(pdev, &drhd->iommu->ats_devices);
+        return ret;
+    }
 
-    return ret >= 0 ? 0 : ret;
+    return 0;
 }
 
 static int cf_check intel_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -44,9 +44,10 @@ struct acpi_drhd_unit *find_ats_dev_drhd
 int ats_device(const struct pci_dev *pdev, const struct acpi_drhd_unit *drhd)
 {
     struct acpi_drhd_unit *ats_drhd;
+    const struct acpi_satc_unit *satc;
     int pos;
 
-    if ( opt_ats <= 0 || !iommu_qinval )
+    if ( !opt_ats || !iommu_qinval )
         return 0;
 
     if ( !ecap_queued_inval(drhd->iommu->ecap) ||
@@ -56,6 +57,10 @@ int ats_device(const struct pci_dev *pde
     if ( !acpi_find_matched_atsr_unit(pdev) )
         return 0;
 
+    satc = acpi_find_matched_satc_unit(pdev);
+    if ( opt_ats < 0 && (!satc || !satc->atc_required) )
+        return 0;
+
     ats_drhd = find_ats_dev_drhd(drhd->iommu);
     pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
 


