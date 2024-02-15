Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 331BB855EEF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:15:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681488.1060285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYlx-0001Im-83; Thu, 15 Feb 2024 10:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681488.1060285; Thu, 15 Feb 2024 10:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYlx-0001HI-5F; Thu, 15 Feb 2024 10:15:17 +0000
Received: by outflank-mailman (input) for mailman id 681488;
 Thu, 15 Feb 2024 10:15:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raYlv-0001H1-GX
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:15:15 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b66a041-cbeb-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 11:15:13 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33cf7812777so360866f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:15:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs3-20020a056000070300b0033b45bdb2a1sm1361072wrb.4.2024.02.15.02.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:15:12 -0800 (PST)
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
X-Inumbo-ID: 1b66a041-cbeb-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707992113; x=1708596913; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0wmyC+dd48xUA9r3hY+U4fMTTXevckC3qoc0ZYZfRhM=;
        b=USz6MfuGjH/VMGz2zKdeerjYyC7kDh6JwBzQ8044JHn24DXU7ohqZOKuvoza72pRKK
         3chya4b/n7xptNoAKF/z4kUG8xFmOaAlplD4YAfoJKC6BFOCRYJcgbo2o272oSZnhbQr
         qS0gDHtiu/pHHMO+APqHLEKFZH71ItpC5qvE7BpK7B44ZvxwvDW1WRwXMvYAV2KfKBHg
         wpdrlLWDSP9T2xPhFsYyyPCHEmCEt8Q7u5vmInI2WRN5SqUdYImGaZThgJsDXNR5XXLa
         1AuzbQ9cJ6K+PGv57YjikhDCzWqHueERg+mIOI/rWLkKqDOGMCYWuqyby4jEjjoVZf4F
         rsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707992113; x=1708596913;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wmyC+dd48xUA9r3hY+U4fMTTXevckC3qoc0ZYZfRhM=;
        b=dqyULo5DNb3HClvNF64EoSsWJAhpWf32uAShRYag+7JpzdOxdsZ0vEQQC3uPWIPgNM
         CbpElsY7l63JcsVdYu3+oREOB+0flFrEJXDo84BB6mheWTYtAOy3gRCiqELoSQGAKCJ1
         7ovLXb3bUV9K8TEEOcrF2b8Y0qGck4VE6N5jWPTv7Ng0C23nS+Eyi7CIBN1vFGEtDxCq
         gHiKTpEp/Ux+uoNNOZS7hbmyyqoDu1KThtPSvLbDqSaikvEwMSlJQhreu8VHLqXyvzPY
         FnmSqqy6pb+bJQboCNBLaRhozx8wKE2IRLO2YcRmx2jDRnT7iH4CWGwomhGA32z/12be
         bOOQ==
X-Gm-Message-State: AOJu0Yxm4mFGcrrFcNWRFHuNZw7Xnia1V5Fj3CpJfRI5TKxa6/dJuLzj
	LhrvrrguA4xeAfqmYD+62uZtX42CvS6ciqpmQoS++irJde8VArTk48YJLCTfCTOgw81gzgyuL7M
	=
X-Google-Smtp-Source: AGHT+IGyu8WOKpuuNtyzo0ztbULmjaz0cTNntwvaxaHRhmZlM8/A6Elcft8I2B1XFnN9DAfe5SK+/Q==
X-Received: by 2002:a5d:4a4f:0:b0:33b:5087:c913 with SMTP id v15-20020a5d4a4f000000b0033b5087c913mr1055855wrs.54.1707992112857;
        Thu, 15 Feb 2024 02:15:12 -0800 (PST)
Message-ID: <bd89275f-915a-4925-afbb-494133bb6e65@suse.com>
Date: Thu, 15 Feb 2024 11:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 04/12] AMD/IOMMU: add helper to check whether ATS is to be
 used for a device
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
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

The same set of conditions is used in three places, requiring to be kept
in sync. Introduce a helper to centralize these checks.

To allow all parameters of the new helper be pointer-to-const,
iommu_has_cap() also needs its 1st parameter to be constified. Beyond
that further "modernize" that function.

Requested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -404,9 +404,9 @@ static inline void __free_amd_iommu_tabl
     free_xenheap_pages(table, order);
 }
 
-static inline int iommu_has_cap(struct amd_iommu *iommu, uint32_t bit)
+static inline bool iommu_has_cap(const struct amd_iommu *iommu, unsigned int bit)
 {
-    return !!(iommu->cap.header & (1u << bit));
+    return iommu->cap.header & (1u << bit);
 }
 
 /* access device id field from iommu cmd */
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -114,6 +114,16 @@ static bool any_pdev_behind_iommu(const
     return false;
 }
 
+static bool use_ats(
+    const struct pci_dev *pdev,
+    const struct amd_iommu *iommu,
+    const struct ivrs_mappings *ivrs_dev)
+{
+    return !ivrs_dev->block_ats &&
+           iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
+           pci_ats_device(iommu->seg, pdev->bus, pdev->devfn);
+}
+
 static int __must_check amd_iommu_setup_domain_device(
     struct domain *domain, struct amd_iommu *iommu,
     uint8_t devfn, struct pci_dev *pdev)
@@ -185,9 +195,7 @@ static int __must_check amd_iommu_setup_
         dte->ex = ivrs_dev->dte_allow_exclusion;
         dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
 
-        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
-             !ivrs_dev->block_ats &&
-             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
+        if ( use_ats(pdev, iommu, ivrs_dev) )
             dte->i = ats_enabled;
 
         spin_unlock_irqrestore(&iommu->lock, flags);
@@ -248,9 +256,7 @@ static int __must_check amd_iommu_setup_
         ASSERT(dte->sys_mgt == MASK_EXTR(ivrs_dev->device_flags,
                                          ACPI_IVHD_SYSTEM_MGMT));
 
-        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
-             !ivrs_dev->block_ats &&
-             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
+        if ( use_ats(pdev, iommu, ivrs_dev) )
             ASSERT(dte->i == ats_enabled);
 
         spin_unlock_irqrestore(&iommu->lock, flags);
@@ -268,9 +274,7 @@ static int __must_check amd_iommu_setup_
 
     ASSERT(pcidevs_locked());
 
-    if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
-         !ivrs_dev->block_ats &&
-         iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
+    if ( use_ats(pdev, iommu, ivrs_dev) &&
          !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
     {
         if ( devfn == pdev->devfn )


