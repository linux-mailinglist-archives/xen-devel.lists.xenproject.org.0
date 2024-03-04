Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE0A86FAE5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 08:32:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688165.1072034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh2oC-0003xm-Rs; Mon, 04 Mar 2024 07:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688165.1072034; Mon, 04 Mar 2024 07:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh2oC-0003wJ-Ot; Mon, 04 Mar 2024 07:32:24 +0000
Received: by outflank-mailman (input) for mailman id 688165;
 Mon, 04 Mar 2024 07:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh2oB-0003w7-KK
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 07:32:23 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56793c90-d9f9-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 08:32:21 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a450615d1c4so171334466b.0
 for <xen-devel@lists.xenproject.org>; Sun, 03 Mar 2024 23:32:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 an19-20020a17090656d300b00a4536b32ae0sm991546ejc.30.2024.03.03.23.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 23:32:20 -0800 (PST)
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
X-Inumbo-ID: 56793c90-d9f9-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709537541; x=1710142341; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uao8jMabORIAFaIx1lr7Z9jLmX4PfQvpemPZ1siutL4=;
        b=gj4u38Usfr5QoCfRFzMzRypEyGHjaBM3ZGDTFbFq/QjLtRpmh4W65l4edRSbysh5Lm
         wk3PkiqDPrHCOeuAUpG0Jw1PrAYaxrF+ZoX+xE2fugdPfS78xVmJiWW9HR8UF0SnL28p
         VemCns2z/zrx6Q+Z7P0ykxwI4d7l7u4wvdLxayrZHyxFb2okirgJzLzKl7bT+aJ3bXS8
         CGONQqS9FDCPLYssnWiswCt6CCHdNsT8JE78LWiGoU7F3nR2M2Fnshyg2s7NFXxlqZU6
         SrVis4UspjDBI08B2E+lArpU+u4P43mXHPTny2kHLW8Kzobf3xVzT/uunP6rEEPJl3oT
         tHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709537541; x=1710142341;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uao8jMabORIAFaIx1lr7Z9jLmX4PfQvpemPZ1siutL4=;
        b=QmIB/y05emzh3PZ/4FxP1DZPDZKTgYptQ4x2uoso259Va5TvheygMO3+Nk3O6FlTPe
         eHBGw5gijCAxrArK2d8dwRC4HsYxbaPyQ/U6V0OBKXo5VTRikS8m0XmKlpUwXmZT4Z+V
         VYRaQRcGHEVZygBZQG1j0DR3K6gK6RJ7u7KxdvYPR8ALGaHAklye5PzEin10YZWCdgFp
         yoW4bFN2alNRE3iiwJ1q7d0s3AvccFC4FM6NWRqXAfzCvN7nv7EVTMewVqxVvU/0gfcN
         Xmb/2n0WHtql2Plw3mz1flUALtkX/Yzq405IiTZAdpIh/KQXiQd8P1b2nao5knkw/hSr
         gssg==
X-Gm-Message-State: AOJu0YxzENKQpdj6hDAMtONo/9vFIS9uwTtEFW5Of14oRDeJyq7Fes2B
	QXAA7Y0aDkyIivVVpxFPEDmvs1Q/LBF7rVKQfJ17scovXF+UGgoMESVuSQrCxXPBuQW5pEMWWC0
	=
X-Google-Smtp-Source: AGHT+IEcoARgmc5G5koCbat15gls+rTX1vPZP20RYOP87AnJ7G901KGg5EPH4WqN1CPAPDAEQ1Y7nA==
X-Received: by 2002:a17:906:cd01:b0:a44:3056:1ec1 with SMTP id oz1-20020a170906cd0100b00a4430561ec1mr6543060ejb.6.1709537541189;
        Sun, 03 Mar 2024 23:32:21 -0800 (PST)
Message-ID: <090d572c-5196-46b2-9d6b-741b7cb66d97@suse.com>
Date: Mon, 4 Mar 2024 08:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Neowutran <xen@neowutran.ovh>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] hvmloader/PCI: skip huge BARs in certain calculations
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

BARs of size 2Gb and up can't possibly fit below 4Gb: Both the bottom of
the lower 2Gb range and the top of the higher 2Gb range have special
purpose. Don't even have them influence whether to (perhaps) relocate
low RAM.

Reported-by: Neowutran <xen@neowutran.ovh>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If we wanted to fit e.g. multiple 1Gb BARs, it would likely be prudent
to similarly avoid low RAM relocation in the first place. Yet accounting
for things differently depending on how many large BARs there are would
require more intrusive code changes.

That said, I'm open to further lowering of the threshold. That'll
require different justification then, though.

--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -33,6 +33,13 @@ uint32_t pci_mem_start = HVM_BELOW_4G_MM
 const uint32_t pci_mem_end = RESERVED_MEMBASE;
 uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
 
+/*
+ * BARs larger than this value are put in 64-bit space unconditionally.  That
+ * is, such BARs also don't play into the determination of how big the lowmem
+ * MMIO hole needs to be.
+ */
+#define HUGE_BAR_THRESH GB(1)
+
 enum virtual_vga virtual_vga = VGA_none;
 unsigned long igd_opregion_pgbase = 0;
 
@@ -286,9 +293,11 @@ void pci_setup(void)
             bars[i].bar_reg = bar_reg;
             bars[i].bar_sz  = bar_sz;
 
-            if ( ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
-                  PCI_BASE_ADDRESS_SPACE_MEMORY) ||
-                 (bar_reg == PCI_ROM_ADDRESS) )
+            if ( is_64bar && bar_sz > HUGE_BAR_THRESH )
+                bar64_relocate = 1;
+            else if ( ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
+                       PCI_BASE_ADDRESS_SPACE_MEMORY) ||
+                      (bar_reg == PCI_ROM_ADDRESS) )
                 mmio_total += bar_sz;
 
             nr_bars++;
@@ -367,7 +376,7 @@ void pci_setup(void)
             pci_mem_start = hvm_info->low_mem_pgend << PAGE_SHIFT;
     }
 
-    if ( mmio_total > (pci_mem_end - pci_mem_start) )
+    if ( mmio_total > (pci_mem_end - pci_mem_start) || bar64_relocate )
     {
         printf("Low MMIO hole not large enough for all devices,"
                " relocating some BARs to 64-bit\n");
@@ -446,8 +455,9 @@ void pci_setup(void)
          *   the code here assumes it to be.)
          * Should either of those two conditions change, this code will break.
          */
-        using_64bar = bars[i].is_64bar && bar64_relocate
-            && (mmio_total > (mem_resource.max - mem_resource.base));
+        using_64bar = bars[i].is_64bar && bar64_relocate &&
+            (mmio_total > (mem_resource.max - mem_resource.base) ||
+             bar_sz > HUGE_BAR_THRESH);
         bar_data = pci_readl(devfn, bar_reg);
 
         if ( (bar_data & PCI_BASE_ADDRESS_SPACE) ==
@@ -467,7 +477,8 @@ void pci_setup(void)
                 resource = &mem_resource;
                 bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
             }
-            mmio_total -= bar_sz;
+            if ( bar_sz <= HUGE_BAR_THRESH )
+                mmio_total -= bar_sz;
         }
         else
         {

