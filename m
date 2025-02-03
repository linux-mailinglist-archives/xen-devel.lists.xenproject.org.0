Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D372CA25FE1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:26:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880826.1290921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezHR-0007oQ-4F; Mon, 03 Feb 2025 16:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880826.1290921; Mon, 03 Feb 2025 16:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezHR-0007ml-06; Mon, 03 Feb 2025 16:26:37 +0000
Received: by outflank-mailman (input) for mailman id 880826;
 Mon, 03 Feb 2025 16:26:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tezHO-0006gZ-Vi
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:26:34 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a19343d9-e24b-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 17:26:33 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so778808266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:26:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ffd4dsm788590766b.91.2025.02.03.08.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:26:32 -0800 (PST)
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
X-Inumbo-ID: a19343d9-e24b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738599993; x=1739204793; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TEuTmXUbRXTC5UjEhqm1VFDs5Km68mP+ZKpWd/geRbg=;
        b=B3tr/+iZLI3S0WWXFo76NPEcpD8ov5PXkv+tZGeDYcq3QrOQwhIcxaS4JXTe2t30/B
         srvFKzjefXSHSomYHVp9Y0vwuE/NcIdCj2IHFETFP33M6oghEpUAGH45bFQGXkdgbmoF
         BLDOhAhK1CZ2G+dTzBODNBTMUSxppjl0BNZ0+v3uVVWUMC7EBy3kf7HJ/S4UZpsSY1j9
         SMl675P5ytHmpQCWw8EvJSh3zP7nKVkMLibXaMiPxwmWEQ3mPKPDIsyKlO70EU3sgdPc
         lBMcbhCwNJ1NMo/4/Tgr0BBonwJMTdbPMexO0IndE6Uo4a+f4j45tHsr5Q224ARE+BIw
         bP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599993; x=1739204793;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEuTmXUbRXTC5UjEhqm1VFDs5Km68mP+ZKpWd/geRbg=;
        b=SpRonOsjQhNr8v7QqlzROgV3BwMrq6UuIFbnIBal9WPyP+IzcrP4/U7Kn/SUIZa1ws
         EgpzDMnU9Xr+y9z356Ff8NmqmriYC7+keMvDj+QL3LdJ9XE/a6ekiLQ2kf2vgbAdnMNq
         PyUvM/qweI2myEnwdgUrokdRdOFLNH5qFuP24oD32B1Fqseiquw6lly4q6m3ZJOCK5F0
         F+i1BPL2vUL+FZHuSLik5Q3KcanzG1z5tnyRgARrQjkJmIBLPJTJXOeAuRx7e1/v4++i
         /xAtZ8+REeTiOXEQONhsTEn2YxZ2N549st7krdjFPZBnQbJkwtKAsYIkxtK6Zvy44T24
         IerQ==
X-Gm-Message-State: AOJu0YzyeihVYP/Osg/n5rslMI/JlKdK1OhDTVVrOzYhVkPpKnoRMOyS
	g8bwc/AAcGbtlKPrur23noing9Mo/fDC5fgkFMoEfSDQip7K34i/mzbBdQVKiA7c6xS10U3joDU
	=
X-Gm-Gg: ASbGncuNftIKwrcWOp9xiorx0goubLxZhOLn8vYPDdbf/ma2Q4lLfA3Dx+mUsham/HL
	r7W+NoeWAt0BKwyq9q5o1waS5kJmn7DMzDz3eznpIgLLQulggAxmQePxvP3PD66uf4cnzoO6H9X
	KaMPFqcobL8N8WEP5TTDZNYN0fzvIy3z7oCTuv6EKD4m1PLzoLiBlUKBo+zxqiccFblXN6hw00+
	JH7FZwiudfMawMuVbaOBaan61RLcNgl1miGXm9PNfZOpEZIn1RVFGPinwYEIdI/3LaHDWQPBxqh
	vu1m1Hx/jawqLEu4ehi4dZ1HFRz2ksF4IpSj+2CkUib2Z1vvSwi+ODxTBWI0vAdqd7TO6x8EXWM
	7
X-Google-Smtp-Source: AGHT+IHWi7Z9l3dnCLPj1jzcbh/OJN+CMCFy7IksIEAQ03jyH+hliuC/Z/DMEawFG6LVBNjdMrDv3w==
X-Received: by 2002:a17:907:2cc5:b0:aaf:74d6:6467 with SMTP id a640c23a62f3a-ab6cfe11f0cmr2475004066b.42.1738599992939;
        Mon, 03 Feb 2025 08:26:32 -0800 (PST)
Message-ID: <bd8d65e6-e887-4afe-8ff0-df86416fa869@suse.com>
Date: Mon, 3 Feb 2025 17:26:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.20? 5/6] radix-tree: introduce RADIX_TREE{,_INIT}()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
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
In-Reply-To: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... now that static initialization is possible. Use RADIX_TREE() for
pci_segments and ivrs_maps.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
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


