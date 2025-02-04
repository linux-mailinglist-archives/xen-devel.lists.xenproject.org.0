Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE987A2725F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:03:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881403.1291543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIaA-0004sE-N6; Tue, 04 Feb 2025 13:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881403.1291543; Tue, 04 Feb 2025 13:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIaA-0004pc-K0; Tue, 04 Feb 2025 13:03:14 +0000
Received: by outflank-mailman (input) for mailman id 881403;
 Tue, 04 Feb 2025 13:03:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfIa9-0004pU-84
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:03:13 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63a55c80-e2f8-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 14:03:12 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d932eac638so9961580a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 05:03:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7010f4d2asm715173466b.75.2025.02.04.05.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:03:11 -0800 (PST)
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
X-Inumbo-ID: 63a55c80-e2f8-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738674192; x=1739278992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DuLRsZHSFXvpAVO+A+d8XnA2F4BzksUCwYQK44B03Xw=;
        b=ZvZGu+fAFOmkEUTSmGWqopxOre39GZrdV7WnUw4KQdhkaMpOUjI2nLnlHA/+WXIUDq
         P5avcyB3rzyVYKRKN0V9d7Si5ksMCiWpt2UyePiICmBw4XfQPVD7U0fkVbBaLNOA3CjK
         wXOIYUG4iMff1xffS45OEwa/9vtGmUZaqvN/axGH9yhUFvq6WdnkyQa1qBGZxnlwWHAC
         Fx2Fp59RhGpbqOCcFqDWVFLKtxFBLRCq5tm2VL3S+61r+aktteRJWlyYO2Xpp+dDbbQp
         TYDcPsjFqUcj4IRZa9t6SyfjC2H+2uTpplBiz+wtIFghfdvivX84sdfohbHPyMrktwUv
         yYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674192; x=1739278992;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuLRsZHSFXvpAVO+A+d8XnA2F4BzksUCwYQK44B03Xw=;
        b=qmLSe47Clxwe4JmHpTC5qK+rLIZmfQMdim7basTOJSTcEFRGj/6brHn03y4GfCFPRH
         hJ8hC90MMQiJeq9E7lIULSFc4e6hLs0b+LilBomu+CusAD60vT0MNLgUTfhwRxM38fpF
         y6WG9tr3P1tfCD2xVsay26OB/Jio8NvWJJzHBQE17LpCRIhqIePewNOKCaD1o6aGQJPW
         O9/CHEaVU+ASqyQxUikhqG4+yNRAN4vLngF8CyiUZfPp5AqzeFD9Ecr3ywVuvprFpnqC
         DnZrkK3VM1v8iqGEuHwgVBttC+1vrlACKRAUnPzSFpKG0g79tuPq6GrfWkdv8gf6PJxW
         LK6g==
X-Gm-Message-State: AOJu0Yzfh8JnTj/b9eHL29h+Eh5jfwaiqeiL7cVaud5nbBiy4aDo5Wwr
	w1aYxPIUWZo67NsvKvcv+Co6YmVNuxHhL8wDCiYFSEwW6Q345yFlDg1MP/W96Edq1Dg0ly7npy0
	=
X-Gm-Gg: ASbGncvf9s4XXwQEXFGB0aOe0n+FL7It4SYlwKT3rY7We63QeDtvWNaDZ17EMPSPimy
	igBN3EUFJDzmkYTsq2tkOnbEjlKSAS6Bgaljt3u2lQlnupow/ub50iHKaaI96hpVs3RyQ3ris+n
	tC/udSDG6k5GJaZG3qI+DO9klV2tpdJh5JLaqeGlmM0B/Y9qGm5kLYPaoqp0WmKpwXXaP7pMnQN
	E5/yA0dR5VoNTqRQnzIet4zAoAXNoH/JUwXKpQ82/kCipf8zsppVtuwWNbxm0/WVoLEau6RIjns
	YjLagkQaj+SmRaVEVX4j7Q2a4PLl1ocmpnG5fz00vM8V4g5Pg37n3M5Biby716pnDSS8K5lJnnN
	2
X-Google-Smtp-Source: AGHT+IHMmASDxj9NeTpR1Uo77Fcxz0fXX3T1OvbTMqI5td72kbZ6cfHP51DzCcBmJ4zcOseQK5wSuA==
X-Received: by 2002:a17:907:7fa6:b0:ab6:b848:2ab with SMTP id a640c23a62f3a-ab6cfcdf2a3mr2659089466b.16.1738674191635;
        Tue, 04 Feb 2025 05:03:11 -0800 (PST)
Message-ID: <e1114d64-61f9-47b9-a1ed-33b526d40089@suse.com>
Date: Tue, 4 Feb 2025 14:03:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 for-4.20 2/4] radix-tree: introduce RADIX_TREE{,_INIT}()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
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
In-Reply-To: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... now that static initialization is possible. Use RADIX_TREE() for
pci_segments and ivrs_maps.

This then fixes an ordering issue on x86: With the call to
radix_tree_init(), acpi_mmcfg_init()'s invocation of pci_segments_init()
will zap the possible earlier introduction of segment 0 by
amd_iommu_detect_one_acpi()'s call to pci_ro_device(), and thus the
write-protection of the PCI devices representing AMD IOMMUs.

Fixes: 3950f2485bbc ("x86/x2APIC: defer probe until after IOMMU ACPI table parsing")
Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Sadly gcc below 5.x doesn't support compound literals in static
initializers (Clang 3.5 does). Hence the request in response to v2 has
to remain un-addressed.
---
v3: Extend description and add Fixes: tag.
v2: New.

--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -31,7 +31,7 @@ static struct tasklet amd_iommu_irq_task
 unsigned int __read_mostly amd_iommu_acpi_info;
 unsigned int __read_mostly ivrs_bdf_entries;
 u8 __read_mostly ivhd_type;
-static struct radix_tree_root ivrs_maps;
+static RADIX_TREE(ivrs_maps);
 LIST_HEAD_RO_AFTER_INIT(amd_iommu_head);
 bool iommuv2_enabled;
 
@@ -1408,7 +1408,6 @@ int __init amd_iommu_prepare(bool xt)
         goto error_out;
     ivrs_bdf_entries = rc;
 
-    radix_tree_init(&ivrs_maps);
     for_each_amd_iommu ( iommu )
     {
         rc = amd_iommu_prepare_one(iommu);
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -68,7 +68,7 @@ bool pcidevs_locked(void)
     return rspin_is_locked(&_pcidevs_lock);
 }
 
-static struct radix_tree_root pci_segments;
+static RADIX_TREE(pci_segments);
 
 static inline struct pci_seg *get_pseg(u16 seg)
 {
@@ -124,7 +124,6 @@ static int pci_segments_iterate(
 
 void __init pci_segments_init(void)
 {
-    radix_tree_init(&pci_segments);
     if ( !alloc_pseg(0) )
         panic("Could not initialize PCI segment 0\n");
 }
--- a/xen/include/xen/radix-tree.h
+++ b/xen/include/xen/radix-tree.h
@@ -72,6 +72,9 @@ struct radix_tree_root {
  *** radix-tree API starts here **
  */
 
+#define RADIX_TREE_INIT() {}
+#define RADIX_TREE(name) struct radix_tree_root name = RADIX_TREE_INIT()
+
 void radix_tree_init(struct radix_tree_root *root);
 
 void radix_tree_destroy(


