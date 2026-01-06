Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72CDCF895E
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 14:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196094.1513967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7Pu-0004uH-Kf; Tue, 06 Jan 2026 13:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196094.1513967; Tue, 06 Jan 2026 13:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7Pu-0004s6-Hu; Tue, 06 Jan 2026 13:48:10 +0000
Received: by outflank-mailman (input) for mailman id 1196094;
 Tue, 06 Jan 2026 13:48:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd7Pt-0004MT-3F
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 13:48:09 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 557fc6dc-eb06-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 14:48:08 +0100 (CET)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa9so457392f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 05:48:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee5eesm4454297f8f.34.2026.01.06.05.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 05:48:07 -0800 (PST)
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
X-Inumbo-ID: 557fc6dc-eb06-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767707288; x=1768312088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JRm8agxN0LTD6ZCWwor27j6bp3Ta0t1F7caudO6/9MY=;
        b=dVmXSx4NqTJlAIOT800l6hvvirpS+dhJTVgLx5YEWw8ag8QmViP7g/XCXa31vH5iwI
         Q+xMOgx7G/HEMnjd14ENoNFxYfo+XIQBTZvCvS4IrnFOZHXnK5z9eU7zs4znTZKtSqCL
         TGiHkBXwmeZ5iSNpjW07TLeVEM9i4tZHeXauLbOd0YeK7ZGNUjiStrqKFtsul4zTyxIV
         pN18CUM1ZoFUuCaNeFzPWMM6/BJ+kb3XV9eJyPi/fcY5sjsnwnCeZREouvBZZJfd/RxL
         /a9KHJ6qbif06uV9MXGsLd3yTNDzHD0mPWgrs56flr7fao4byvDYw7aKsGXHnfI0G74p
         og6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707288; x=1768312088;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRm8agxN0LTD6ZCWwor27j6bp3Ta0t1F7caudO6/9MY=;
        b=aYHRt62MsqgqMxr2kfRpzw8c/BfkZksTx3Ljbr4gSWL+zx6PpT6d1s8ZFb1SavJnP/
         HJ6Y+vHVLjyVXOx/cQz/wIXvZPfXMhR5uhFEk6gHOZixscwQmUG5RrSkxDVG116Qxc/S
         dUo1a0XnYO9E0VejYC/RsFOikrf+JipLePR+MAH7JJUbGShNNKtSEQM6c3FNmM2khWQJ
         SQeRWo0XhUEF1yyfFMffPRgbfWtBVizHK2ARebGgZum/NXDAnx3FHOpMxHRICTqeHiL4
         VfcmrudIx1UeU17x2DVAVzyPluoVNARLbGK7A5N4fn7sP25kZ8aSvscxesKnGE0WdUV/
         l+nA==
X-Gm-Message-State: AOJu0YzzjdBZd18Za0XJzNOKbedmUoWP1AjZFnoTlN2L1mvl30hLDP2O
	0SzrrFl5AxY2+FDFyGK2aV/Sc/d7n3Jiogear1RdFWVRjkus/3QqUdDFwEcYERfQ1t6ohtl6UEU
	o7ZYcHA==
X-Gm-Gg: AY/fxX4LDd7KE2wz/XnTOoIo/k1CpxORr74WH+JKUm2DL67K+V8qnzZSXRunEw9Xt6E
	x1RTq6zYST94kDwQmWREkkWjEIXbtaDN8ChK2DXioJy4q+rKCOaZmjEJT5Y8g+SC36J3LzPKYLS
	0M5zfOj1fecHoVWw8zs3TnutQoOdbCSr4wKIITecxubyD9vd0hWNqncz/T0OrBCyCquy3a3yCzM
	93Xb2NvUcWEUGuuimwD7f7gMtaQh2RNE3WAg9Z4rxml5tgkBTRbhmfDPl/FfzIcPeLuK3Nebqvg
	ml/nlVRYymz+InOry2PjYHHzfNCQnT5y2ImRNvT0yzLX57jDudXLuJvKtk4JIXPShRSnbpeL+rL
	e9vPVlNdl6re46ZjEzvlauMtjzwTt/OmYtHnyO1j25AKKzXs4RrCZ82OZ9HlQkqfiJ4ZWhmGZgI
	O7kYfmybxRqRUzQfvbAmRRsSEgqkP7iOtePjLYh3bh4Je5cg2Xk800ALsetuBWX3kCFU3hP6hr2
	MTfvq3g6LEXBw==
X-Google-Smtp-Source: AGHT+IF5NIuhIpx1takip1N4KLIGJjCkAL8DY16vJhPkQkrMtPtzdKpQzQLZOUhptMqlSyR+Bod4jA==
X-Received: by 2002:a05:6000:2209:b0:430:fd84:317a with SMTP id ffacd0b85a97d-432bca50bcfmr4258704f8f.38.1767707288023;
        Tue, 06 Jan 2026 05:48:08 -0800 (PST)
Message-ID: <2ee53e39-997e-4bca-be57-ac51f75b471d@suse.com>
Date: Tue, 6 Jan 2026 14:48:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/6] PCI: pass pdev to pci_ats_{device,enabled}()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com>
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
In-Reply-To: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This not only brings both in sync with {en,dis}able_ats_device() but also
prepares for doing the same to pci_find_{,next_}ext_capability().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -285,7 +285,7 @@ void amd_iommu_flush_iotlb(u8 devfn, con
     if ( !ats_enabled )
         return;
 
-    if ( !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn) )
+    if ( !pci_ats_enabled(pdev) )
         return;
 
     iommu = find_iommu_for_device(pdev->sbdf);
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -121,7 +121,7 @@ static bool use_ats(
 {
     return !ivrs_dev->block_ats &&
            iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
-           pci_ats_device(iommu->sbdf.seg, pdev->bus, pdev->devfn);
+           pci_ats_device(pdev);
 }
 
 static int __must_check amd_iommu_setup_domain_device(
@@ -274,8 +274,7 @@ static int __must_check amd_iommu_setup_
 
     ASSERT(pcidevs_locked());
 
-    if ( use_ats(pdev, iommu, ivrs_dev) &&
-         !pci_ats_enabled(iommu->sbdf.seg, bus, pdev->devfn) )
+    if ( use_ats(pdev, iommu, ivrs_dev) && !pci_ats_enabled(pdev) )
     {
         if ( devfn == pdev->devfn )
             enable_ats_device(pdev, &iommu->ats_devices);
@@ -418,8 +417,7 @@ static void amd_iommu_disable_domain_dev
 
     ASSERT(pcidevs_locked());
 
-    if ( pci_ats_device(iommu->sbdf.seg, bus, pdev->devfn) &&
-         pci_ats_enabled(iommu->sbdf.seg, bus, pdev->devfn) )
+    if ( pci_ats_device(pdev) && pci_ats_enabled(pdev) )
         disable_ats_device(pdev);
 
     BUG_ON ( iommu->dev_table.buffer == NULL );
--- a/xen/drivers/passthrough/ats.h
+++ b/xen/drivers/passthrough/ats.h
@@ -27,27 +27,25 @@ extern bool ats_enabled;
 int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list);
 void disable_ats_device(struct pci_dev *pdev);
 
-static inline int pci_ats_enabled(int seg, int bus, int devfn)
+static inline int pci_ats_enabled(const struct pci_dev *pdev)
 {
     u32 value;
     int pos;
 
-    pos = pci_find_ext_capability(PCI_SBDF(seg, bus, devfn),
-                                  PCI_EXT_CAP_ID_ATS);
+    pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
     BUG_ON(!pos);
 
-    value = pci_conf_read16(PCI_SBDF(seg, bus, devfn), pos + ATS_REG_CTL);
+    value = pci_conf_read16(pdev->sbdf, pos + ATS_REG_CTL);
 
     return value & ATS_ENABLE;
 }
 
-static inline int pci_ats_device(int seg, int bus, int devfn)
+static inline int pci_ats_device(const struct pci_dev *pdev)
 {
     if ( !ats_enabled )
         return 0;
 
-    return pci_find_ext_capability(PCI_SBDF(seg, bus, devfn),
-                                   PCI_EXT_CAP_ID_ATS);
+    return pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
 }
 
 #endif /* DRIVERS__PASSTHROUGH__ATS_H */


