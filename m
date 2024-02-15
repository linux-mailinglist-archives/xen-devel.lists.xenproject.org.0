Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306D9855EE7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:13:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681472.1060255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYkE-00089i-Ds; Thu, 15 Feb 2024 10:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681472.1060255; Thu, 15 Feb 2024 10:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYkE-00087D-B5; Thu, 15 Feb 2024 10:13:30 +0000
Received: by outflank-mailman (input) for mailman id 681472;
 Thu, 15 Feb 2024 10:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raYkC-000877-Q4
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:13:28 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbd172f2-cbea-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 11:13:26 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4121a8635a2so2697005e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:13:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs3-20020a056000070300b0033b45bdb2a1sm1361072wrb.4.2024.02.15.02.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:13:25 -0800 (PST)
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
X-Inumbo-ID: dbd172f2-cbea-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707992006; x=1708596806; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kaaCGUPluoRwbjKkcfJEfltfLrIYbRueMH6UyOi+fqA=;
        b=Vd3Xrg6XndVs6UwuGMJ67Hvv+h71ufP30hEAK6md2Wh2UZwJ5e+YCH/Vh6r9sG2Rhp
         Tjx+GMdJB/tfjBDyXHvihrrbjMrQ9kNqdN8pHZBD9EEPrI9YA1THblFP0K2vHO+DX9op
         g9FnP1fJjpxjvZIviNucrvkiWyJo53DWFD2sq4jhs53P2FVEMGWOXWMbHCV5TFoxeYht
         FmPBBMmR/tNIr7eoeFXDP8UrsDUmaFbyF+tY4VjfUDQm7qfmOQZOBycR5d7nH31iOyrM
         OI+EDygncUH0MWjagC9oJGEu5dYh/6n7RK7ipG4X9R8AOHxVa9QBT20WeS/iuXONWnoa
         lGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707992006; x=1708596806;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaaCGUPluoRwbjKkcfJEfltfLrIYbRueMH6UyOi+fqA=;
        b=wIECJdEa3hGjD+qNbjoyCG0ghokd0vjLxdQHsWtkMVsy3oW/DzgH/xxiM6RVjPkix9
         7vys7T0Pdoq7oN1dJT5mRgdUE1Vwx2ku7ji1Ve//OgJlCbIJG6n7iL2evWAJ2Xw/NHPN
         1wsonEHJXhqsdIK3k4gGbxGkMww60fToa0b5rxd15auqTAa4W6A1kA/sq6sbc5S3BoPz
         iJVx5S2HsOOagtnaJfV9L/DkgulQPDHSh+cPIVYC1nkJpGouDgjw6p7PyRUCR1R6dubN
         VU3QHD3v3nLbBmeetP/iF/fb60jroBzEudv/L2dx4d5NqujFUaiyuCQnqGCAmtJfhGOk
         6B+A==
X-Gm-Message-State: AOJu0YyLrzkVAUD5xN9zhLaZZ/uemxqtVvchyN3SY+QeWQ6zwONIw/ot
	GoeOgbQsQ4DzU7Ryl62BUlsHIl10t+EETGu66zYQ+95QTZaP6q/wPVnXMbExKDTnz6hvPGsD/GI
	=
X-Google-Smtp-Source: AGHT+IH1qlDa3iBjsRLyla193sMpUv7aYmnrfSROwwzh0LTnvgsw6UdyGbNpFEs8UsZtldmOTZ0/kQ==
X-Received: by 2002:a05:600c:34c1:b0:411:c25d:703b with SMTP id d1-20020a05600c34c100b00411c25d703bmr1072716wmq.16.1707992006185;
        Thu, 15 Feb 2024 02:13:26 -0800 (PST)
Message-ID: <3686dae7-e005-47b5-9235-14208a68eec5@suse.com>
Date: Thu, 15 Feb 2024 11:13:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 01/12] VT-d: correct ATS checking for root complex
 integrated devices
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
Content-Language: en-US
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

Spec version 4.1 says

"The ATSR structures identifies PCI Express Root-Ports supporting
 Address Translation Services (ATS) transactions. Software must enable
 ATS on endpoint devices behind a Root Port only if the Root Port is
 reported as supporting ATS transactions."

Clearly root complex integrated devices aren't "behind root ports",
matching my observation on a SapphireRapids system having an ATS-
capable root complex integrated device. Hence for such devices we
shouldn't try to locate a corresponding ATSR.

Since both pci_find_ext_capability() and pci_find_cap_offset() return
"unsigned int", change "pos" to that type at the same time.

Fixes: 903b93211f56 ("[VTD] laying the ground work for ATS")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -44,7 +44,7 @@ struct acpi_drhd_unit *find_ats_dev_drhd
 int ats_device(const struct pci_dev *pdev, const struct acpi_drhd_unit *drhd)
 {
     struct acpi_drhd_unit *ats_drhd;
-    int pos;
+    unsigned int pos, expfl = 0;
 
     if ( !ats_enabled || !iommu_qinval )
         return 0;
@@ -53,7 +53,12 @@ int ats_device(const struct pci_dev *pde
          !ecap_dev_iotlb(drhd->iommu->ecap) )
         return 0;
 
-    if ( !acpi_find_matched_atsr_unit(pdev) )
+    pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP);
+    if ( pos )
+        expfl = pci_conf_read16(pdev->sbdf, pos + PCI_EXP_FLAGS);
+
+    if ( MASK_EXTR(expfl, PCI_EXP_FLAGS_TYPE) != PCI_EXP_TYPE_RC_END &&
+         !acpi_find_matched_atsr_unit(pdev) )
         return 0;
 
     ats_drhd = find_ats_dev_drhd(drhd->iommu);


