Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 406F6849C63
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676101.1051966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzT1-00082d-Qz; Mon, 05 Feb 2024 13:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676101.1051966; Mon, 05 Feb 2024 13:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzT1-0007ze-Ny; Mon, 05 Feb 2024 13:56:59 +0000
Received: by outflank-mailman (input) for mailman id 676101;
 Mon, 05 Feb 2024 13:56:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWzT0-0007Qa-8F
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:56:58 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c801d7b-c42e-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 14:56:56 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40fb3b5893eso36544255e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:56:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b0040efc268713sm8570104wmb.26.2024.02.05.05.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:56:55 -0800 (PST)
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
X-Inumbo-ID: 6c801d7b-c42e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707141416; x=1707746216; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xeo9DHqLhyAKD6WkqcE7ZsPzOC6r3GO9FyNnjBbVjWg=;
        b=U0imfmc5NLC1819iyKXKi/sCwqF0YaJNGnuIbbCeE+srnjJuV5lv6Pekbiu4YIWowJ
         Z11HT6JwI9KMkM2M57r60g6z7+Uc+PVEQGu1KdPj2s8EAhCYxR5siK5jdCvt/3L/xBIy
         2bOknoJLQ4bIjtBhVnAyFKIq9+bv6ybiwCQuwyt0rRsNXkpdHNgl08wD4hWJyyGHFnWC
         8oPSuafUKrBM6jaNng9iVjZf9U5ht3EmbyqelIHZSYrQpSdqWrU50WurKFB9a2A3qJbi
         WKO5lYShbETp23lMHyVvCmEHGcMHla7CLVyx5q/ttmCLmSkFRQWJIpqHL0DoMPJSnF1T
         vS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707141416; x=1707746216;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xeo9DHqLhyAKD6WkqcE7ZsPzOC6r3GO9FyNnjBbVjWg=;
        b=kVNvKgQhmJsYrHqKi5TZdnUeUowYN2eQGrFCFE/HQrsjlhyYMFhFqGznLLUOzcRv+/
         8ROtuSpNsl+O0O/9QNFoJvGrWzhPh/i5nYUFiDL5Wdk3CTiXGsHwrX+owb0+Ki3ashBr
         XFD5/9tc5YxkEZPLO+lo0ON94XNO7cK7Nn5VATxssHDaKIHBAinVCXoJ+HAgZ2jq5N6Q
         /QhuGqnTnWINftVUNIxL6/ViO3kYqAB+tRGwxsBn59MfmiAdS0Ep2/IclaKVbp04t7GD
         vriVboUBnwA6CnHUmxvDoqnMrrQRgR4wsNk8Yyrr+Tc1GEWbBhCdMjp3V6F7LL2++GXa
         x2zA==
X-Gm-Message-State: AOJu0YwMUmBZb2YaPKh1SLIqeLIbTY+lZtILPEUhkoQwrCLjlZv82SaN
	Dng7fouzKED0DllACdTM8uxKMftXp8/hV9ff2E5HuxoblFC+wWy6eWLB62O47gwBB6E1aEZ/0MQ
	=
X-Google-Smtp-Source: AGHT+IFh4g3nSQAwzF4QQsuBLBhkW4JIZ4T2NTiGOlKNdj81gjIVBNg1B7egKsB3lrK01voNNtbn3A==
X-Received: by 2002:a05:600c:548f:b0:40f:ba0b:16b3 with SMTP id iv15-20020a05600c548f00b0040fba0b16b3mr5246317wmb.2.1707141415954;
        Mon, 05 Feb 2024 05:56:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVaYke9c25HWtuApe/uvtGvV7vnZoOn1fWG9SS7v5zvQJe4TjNQdcTy+WCDdN2AZwlDQI3m5PG7dztrGpLLB8lzp+OFQ6BnqY1plG2UMeiRw9NT
Message-ID: <c6d803ba-9478-4ab0-9ab6-a9af94808682@suse.com>
Date: Mon, 5 Feb 2024 14:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/7] VT-d: move ats_device() to the sole file it's used from
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

..., thus allowing it to become static, and thus reducing scope overlap
between it and pci_ats_device(). There's nothing x86-specific about this
function anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -1455,6 +1455,33 @@ static void __hwdom_init cf_check intel_
     }
 }
 
+static int ats_device(const struct pci_dev *pdev,
+                      const struct acpi_drhd_unit *drhd)
+{
+    const struct acpi_satc_unit *satc;
+    int pos;
+
+    if ( !opt_ats || !iommu_qinval )
+        return 0;
+
+    if ( !ecap_queued_inval(drhd->iommu->ecap) ||
+         !ecap_dev_iotlb(drhd->iommu->ecap) )
+        return 0;
+
+    if ( !acpi_find_matched_atsr_unit(pdev) )
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
@@ -28,32 +28,6 @@
 #include "../extern.h"
 #include "../../ats.h"
 
-int ats_device(const struct pci_dev *pdev, const struct acpi_drhd_unit *drhd)
-{
-    const struct acpi_satc_unit *satc;
-    int pos;
-
-    if ( !opt_ats || !iommu_qinval )
-        return 0;
-
-    if ( !ecap_queued_inval(drhd->iommu->ecap) ||
-         !ecap_dev_iotlb(drhd->iommu->ecap) )
-        return 0;
-
-    if ( !acpi_find_matched_atsr_unit(pdev) )
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


