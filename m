Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315F2855F02
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:19:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681521.1060355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYpV-00055Z-60; Thu, 15 Feb 2024 10:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681521.1060355; Thu, 15 Feb 2024 10:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYpV-00053L-1l; Thu, 15 Feb 2024 10:18:57 +0000
Received: by outflank-mailman (input) for mailman id 681521;
 Thu, 15 Feb 2024 10:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raYpT-0003nv-A1
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:18:55 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e90d39c-cbeb-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 11:18:53 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40fd72f7125so5788495e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:18:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs3-20020a056000070300b0033b45bdb2a1sm1361072wrb.4.2024.02.15.02.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:18:52 -0800 (PST)
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
X-Inumbo-ID: 9e90d39c-cbeb-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707992333; x=1708597133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9Q/98Bd60cvr5LoSwMJPfl73bySzka3cm2CynrCQTbw=;
        b=OBZAwYdd0Ifor+dYnfJXkpiymKgVy7HAny6JjBEg8G6ehLRaj2Llv5D420fvzrdmDo
         xMwcjn5zs3OcrOtTI9qS8jcUsOQvf/fBC3Gc4mxlpD76zk06AYYHCHHrchvbUsnGXrLM
         U8eGUEn0fDpvUl0PXB70eOoy2DI7nwDg8IriT6/ktpkKh9bYmmIQk879uWFsGi9sQ5uG
         AYuDFmIE4htCpRz+ZLvIZjBPQEZieOb27cRLT7mzbo1S6wio4OYj4rKdkImgkIfjyrF1
         YMMVVbB9y50tTCXkFtdnxjAEMfvIX6o3GpF40xaWz6uGWyI5PQB5iBLvmxkCn8OZ+ZDB
         DgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707992333; x=1708597133;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Q/98Bd60cvr5LoSwMJPfl73bySzka3cm2CynrCQTbw=;
        b=nXMCHCgwQhiPDnmOW31QKj26XtbnHKu1KUeIgawr3o39HDK305YGtAQcRgPcXxBpuy
         1wWfRwfwdIikPwC8HdrQ8auAHXx4SPHBPzrt7sjCydhDp++4KbspiCRE7XU2ZKgLnW19
         Z5GzuNamlpvc59qnhLDCCHmXLom3ccQoZdvVUzlI7a873pXcTIlpeTv6bF6CZKiEDp0p
         MFbBATAOtieuFoOxMETyIdQSR24WSNBp/buTS9N0/QN5eyR29IPfDbPd8b/f83989vMC
         d0z0NWALjoOHxI6PQWU/liQ9sFkNAOLfIe5H9rETZMl3KGvktZo/DglhOXpXb5Wky7mR
         f/ew==
X-Gm-Message-State: AOJu0Ywp/PGOAg3josftSm+LoCffIb1f37hVsDjAPHejKpKLD6uf1+0G
	S7zG5vbsao9VtqYXWRVaqxA7CazJmK3HM5gCTxwjpp+fldDoupmVatttWnXdAO7tgt4P/4tDsXo
	=
X-Google-Smtp-Source: AGHT+IETeTFl4XumyccwXgmsgDQE0YKt+uSSmDRwDjhG+soVHGC3zw23pHuAHdnqMQ5jXb+tByKWvg==
X-Received: by 2002:adf:f682:0:b0:33d:fb3:9021 with SMTP id v2-20020adff682000000b0033d0fb39021mr290463wrp.54.1707992332965;
        Thu, 15 Feb 2024 02:18:52 -0800 (PST)
Message-ID: <d63065bd-517b-4b6a-a554-7991bdabc3c2@suse.com>
Date: Thu, 15 Feb 2024 11:18:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 11/12] VT-d: drop flush_dev_iotlb parameter from IOTLB
 flush hook
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

All call sites pass it using the flag from the IOMMU which they also
pass.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -57,8 +57,7 @@ int __must_check cf_check vtd_flush_cont
     uint8_t function_mask, uint64_t type, bool flush_non_present_entry);
 int __must_check cf_check vtd_flush_iotlb_reg(
     struct vtd_iommu *iommu, uint16_t did, uint64_t addr,
-    unsigned int size_order, uint64_t type, bool flush_non_present_entry,
-    bool flush_dev_iotlb);
+    unsigned int size_order, uint64_t type, bool flush_non_present_entry);
 
 struct vtd_iommu *ioapic_to_iommu(unsigned int apic_id);
 struct vtd_iommu *hpet_to_iommu(unsigned int hpet_id);
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -566,8 +566,7 @@ static int __must_check iommu_flush_cont
 /* return value determine if we need a write buffer flush */
 int cf_check vtd_flush_iotlb_reg(
     struct vtd_iommu *iommu, uint16_t did, uint64_t addr,
-    unsigned int size_order, uint64_t type, bool flush_non_present_entry,
-    bool flush_dev_iotlb)
+    unsigned int size_order, uint64_t type, bool flush_non_present_entry)
 {
     int tlb_offset = ecap_iotlb_offset(iommu->ecap);
     uint64_t val = type | DMA_TLB_IVT;
@@ -632,7 +631,7 @@ static int __must_check iommu_flush_iotl
     vtd_ops_preamble_quirk(iommu);
 
     status = iommu->flush.iotlb(iommu, 0, 0, 0, DMA_TLB_GLOBAL_FLUSH,
-                                flush_non_present_entry, iommu->flush_dev_iotlb);
+                                flush_non_present_entry);
 
     /* undo platform specific errata workarounds */
     vtd_ops_postamble_quirk(iommu);
@@ -649,7 +648,7 @@ static int __must_check iommu_flush_iotl
     vtd_ops_preamble_quirk(iommu);
 
     status = iommu->flush.iotlb(iommu, did, 0, 0, DMA_TLB_DSI_FLUSH,
-                                flush_non_present_entry, iommu->flush_dev_iotlb);
+                                flush_non_present_entry);
 
     /* undo platform specific errata workarounds */
     vtd_ops_postamble_quirk(iommu);
@@ -675,7 +674,7 @@ static int __must_check iommu_flush_iotl
     vtd_ops_preamble_quirk(iommu);
 
     status = iommu->flush.iotlb(iommu, did, addr, order, DMA_TLB_PSI_FLUSH,
-                                flush_non_present_entry, iommu->flush_dev_iotlb);
+                                flush_non_present_entry);
 
     /* undo platform specific errata workarounds */
     vtd_ops_postamble_quirk(iommu);
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -502,8 +502,7 @@ struct vtd_iommu {
                                     bool non_present_entry_flush);
         int __must_check (*iotlb)(struct vtd_iommu *iommu, u16 did, u64 addr,
                                   unsigned int size_order, u64 type,
-                                  bool flush_non_present_entry,
-                                  bool flush_dev_iotlb);
+                                  bool flush_non_present_entry);
     } flush;
 
     struct list_head ats_devices;
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -452,7 +452,7 @@ static int __must_check cf_check flush_c
 
 static int __must_check cf_check flush_iotlb_qi(
     struct vtd_iommu *iommu, u16 did, u64 addr, unsigned int size_order,
-    u64 type, bool flush_non_present_entry, bool flush_dev_iotlb)
+    u64 type, bool flush_non_present_entry)
 {
     u8 dr = 0, dw = 0;
     int ret = 0, rc;
@@ -478,7 +478,7 @@ static int __must_check cf_check flush_i
     if ( !ret )
         ret = rc;
 
-    if ( flush_dev_iotlb )
+    if ( iommu->flush_dev_iotlb )
     {
         rc = dev_invalidate_iotlb(iommu, did, addr, size_order, type);
         if ( !ret )
@@ -573,8 +573,7 @@ static int cf_check vtd_flush_context_no
 
 static int cf_check vtd_flush_iotlb_noop(
     struct vtd_iommu *iommu, uint16_t did, uint64_t addr,
-    unsigned int size_order, uint64_t type, bool flush_non_present_entry,
-    bool flush_dev_iotlb)
+    unsigned int size_order, uint64_t type, bool flush_non_present_entry)
 {
     WARN();
     return -EIO;


