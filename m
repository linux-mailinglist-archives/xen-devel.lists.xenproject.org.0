Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2739CF8968
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 14:48:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196105.1513978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7QP-0005R7-TG; Tue, 06 Jan 2026 13:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196105.1513978; Tue, 06 Jan 2026 13:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7QP-0005OK-QB; Tue, 06 Jan 2026 13:48:41 +0000
Received: by outflank-mailman (input) for mailman id 1196105;
 Tue, 06 Jan 2026 13:48:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd7QO-0004MT-0o
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 13:48:40 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67bb659a-eb06-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 14:48:39 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-430f5ecaa08so433731f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 05:48:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dabcbsm4276299f8f.7.2026.01.06.05.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 05:48:38 -0800 (PST)
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
X-Inumbo-ID: 67bb659a-eb06-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767707319; x=1768312119; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ltpDchFjsfTzbthj3P9NFlV6ik3WXNe5NU0TTv/FNnM=;
        b=JJwofQooSi5Wf97O/1lDBaDM5LpLRaSpkF/jNV0lnxi+91wKRvHgTbziFWfnVoDROw
         mawGqpnVOZQc+SWjy8kj5wBXvpHBmDcicsvDCgUtmIkc7pPMx8Z8tiz7u9EI0kR492Jd
         arcbSCtzpzxH42/9Jm8HlIpCJCDHpQPkQQHtisJ4h3Ze7IjaJw/kFft5f4812m9YzazS
         VZYWC+fZrWHW8wlqUYdb9JZzXUZ53rPAvpnlnASKS4KBm/z7Td7aftpgVZm0Lrf4JPWF
         6VKtaRwsBu8GWMDk2nnTjhv1MK7VO24OdSVr6gYSB8/ohL9mrM5sNsWOkYJd8k1HOXy6
         3qAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707319; x=1768312119;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltpDchFjsfTzbthj3P9NFlV6ik3WXNe5NU0TTv/FNnM=;
        b=R99vdiNRtlQBsI2NdZ++70rTEVYkCkYaVWc06XVx77yKztw8Lrf7kxxg3rbwlGbc7g
         uwhrlCdmrDiqj1mk6e748UaKWevWqMpbhT5ldWQ+Xlxxlcth8Bl9oDPMXzTnB3yLxfZm
         csSMt2BZNK0uqH8DuQ12l3BNLuuZrtppvyFLRFFIBhqRv4b8wFRuxk9Use3symkqaso6
         3/uchiSUyNOqO1E/rJgRB9I4m7jnuuUMnAc37QxSNAgLnY85/G/lz4dOwTFQs05zdCaa
         zwUSIVK6E0Slmi4pZkpM8LPHc2EjRvE8JiWIcDfs0WGi9W3GKCoEmvSZSuCKI2fTkEj2
         2hNw==
X-Gm-Message-State: AOJu0YziQhj4uRcOoB6LYtueIu4d3yaz+4qsVwZl0VItEmRH0fKJoXXo
	xjlldGGPzIlRtQs2e79WyHn/62WRnyI6vu4yy5YHwMaZ5NK3Mwx6tKojLGntQFuiwOwaGWQpwqz
	qY2je7g==
X-Gm-Gg: AY/fxX61ioS7GITmI70hIJo088sPYC2hFXD/eI7bqx34hvN4cofcTM+/gmkBL/m7Kny
	KngaAz0uXLWc69uguD/fnfeFaufn8UgSvv3N/Vt3lTLzA2Bwcc+DpKJW4V2hkSkl+UJWAd9iF2t
	xK140EPSne2zeLtqlhzwHiEIC1a4zet6C+kj0I5RHWoA5uq2kigaJP8SiJGL5XnRO7O8J1X3l2q
	NcU12Yjur4VO7b41zVJsOW4U8zt9UgCRVFaqd3kDHJjHCcd3yJx8cA5flX6i/9nxy3PLD9hP1yP
	IRTHYHs+fFxQJxavjOCuyvylyI4T6JIcNSJOtbm5xl6ty+djS6fCxF1LkZrHyhRY6MfBi5GIoxP
	cW1G/BKHhpe7pyOvSiOrhtayEhQMHX0/4MrMiIBzwQfnq4vDFIu3aG02GJjMX6Vbwa8bY8EA8nh
	q5JeYaOP9Ib4x7c2faxS/3NdKN9ODhNdkJOeMOdiTJWkCKUKmbDBob5eZdDSa9DJMEm4WBKt+TL
	YHmuhvpugZTiQ==
X-Google-Smtp-Source: AGHT+IEbTX6zUm9ZKzRIj6MT6mo69QEiGCv+eHFQBB8LGf+XX7nLFSeR09wIaS9BTPIlmI6WqzHeNg==
X-Received: by 2002:a05:6000:40e1:b0:432:5bf9:cf15 with SMTP id ffacd0b85a97d-432bca2cc68mr4245371f8f.5.1767707318683;
        Tue, 06 Jan 2026 05:48:38 -0800 (PST)
Message-ID: <c7e18657-97fa-4fc6-bbea-826b7c64b86a@suse.com>
Date: Tue, 6 Jan 2026 14:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/6] x86/MSI: pass pdev to read_pci_mem_bar()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
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

This not only reduces the number of parameters and local variables, but
also prepares for doing the same to pci_find_{,next_}ext_capability().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -662,11 +662,11 @@ static int msi_capability_init(struct pc
     return 0;
 }
 
-static uint64_t read_pci_mem_bar(pci_sbdf_t sbdf, uint8_t bir, int vf,
-                                 const struct pf_info *pf_info)
+static uint64_t read_pci_mem_bar(const struct pci_dev *pdev, uint8_t bir,
+                                 int vf)
 {
-    uint16_t seg = sbdf.seg;
-    uint8_t bus = sbdf.bus, slot = sbdf.dev, func = sbdf.fn;
+    uint16_t seg = pdev->sbdf.seg;
+    uint8_t bus = pdev->sbdf.bus, slot = pdev->sbdf.dev, func = pdev->sbdf.fn;
     u8 limit;
     u32 addr, base = PCI_BASE_ADDRESS_0;
     u64 disp = 0;
@@ -676,20 +676,18 @@ static uint64_t read_pci_mem_bar(pci_sbd
         unsigned int pos;
         uint16_t ctrl, num_vf, offset, stride;
 
-        ASSERT(pf_info);
-
-        pos = pci_find_ext_capability(sbdf, PCI_EXT_CAP_ID_SRIOV);
-        ctrl = pci_conf_read16(sbdf, pos + PCI_SRIOV_CTRL);
-        num_vf = pci_conf_read16(sbdf, pos + PCI_SRIOV_NUM_VF);
-        offset = pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_OFFSET);
-        stride = pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_STRIDE);
+        pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
+        ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
+        num_vf = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_NUM_VF);
+        offset = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_OFFSET);
+        stride = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_STRIDE);
 
         if ( !pos ||
              !(ctrl & PCI_SRIOV_CTRL_VFE) ||
              !(ctrl & PCI_SRIOV_CTRL_MSE) ||
              !num_vf || !offset || (num_vf > 1 && !stride) ||
              bir >= PCI_SRIOV_NUM_BARS ||
-             !pf_info->vf_rlen[bir] )
+             !pdev->physfn.vf_rlen[bir] )
             return 0;
         base = pos + PCI_SRIOV_BAR;
         vf -= PCI_BDF(bus, slot, func) + offset;
@@ -703,8 +701,8 @@ static uint64_t read_pci_mem_bar(pci_sbd
         }
         if ( vf >= num_vf )
             return 0;
-        BUILD_BUG_ON(ARRAY_SIZE(pf_info->vf_rlen) != PCI_SRIOV_NUM_BARS);
-        disp = vf * pf_info->vf_rlen[bir];
+        BUILD_BUG_ON(ARRAY_SIZE(pdev->physfn.vf_rlen) != PCI_SRIOV_NUM_BARS);
+        disp = vf * pdev->physfn.vf_rlen[bir];
         limit = PCI_SRIOV_NUM_BARS;
     }
     else switch ( pci_conf_read8(PCI_SBDF(seg, bus, slot, func),
@@ -759,10 +757,6 @@ static int msix_capability_init(struct p
     u16 control;
     u64 table_paddr;
     u32 table_offset;
-    u16 seg = dev->seg;
-    u8 bus = dev->bus;
-    u8 slot = PCI_SLOT(dev->devfn);
-    u8 func = PCI_FUNC(dev->devfn);
     bool maskall = msix->host_maskall, zap_on_error = false;
     unsigned int pos = dev->msix_pos;
 
@@ -809,32 +803,20 @@ static int msix_capability_init(struct p
           (is_hardware_domain(current->domain) &&
            (dev->domain == current->domain || dev->domain == dom_io))) )
     {
-        unsigned int bir = table_offset & PCI_MSIX_BIRMASK, pbus, pslot, pfunc;
-        int vf;
+        unsigned int bir = table_offset & PCI_MSIX_BIRMASK;
+        int vf = -1;
+        const struct pci_dev *pf_dev = dev;
         paddr_t pba_paddr;
         unsigned int pba_offset;
-        const struct pf_info *pf_info;
 
-        if ( !dev->info.is_virtfn )
-        {
-            pbus = bus;
-            pslot = slot;
-            pfunc = func;
-            vf = -1;
-            pf_info = NULL;
-        }
-        else
+        if ( dev->info.is_virtfn )
         {
-            pbus = dev->info.physfn.bus;
-            pslot = PCI_SLOT(dev->info.physfn.devfn);
-            pfunc = PCI_FUNC(dev->info.physfn.devfn);
             vf = dev->sbdf.bdf;
             ASSERT(dev->pf_pdev);
-            pf_info = &dev->pf_pdev->physfn;
+            pf_dev = dev->pf_pdev;
         }
 
-        table_paddr = read_pci_mem_bar(PCI_SBDF(seg, pbus, pslot, pfunc), bir,
-                                       vf, pf_info);
+        table_paddr = read_pci_mem_bar(pf_dev, bir, vf);
         WARN_ON(msi && msi->table_base != table_paddr);
         if ( !table_paddr )
         {
@@ -857,8 +839,7 @@ static int msix_capability_init(struct p
 
         pba_offset = pci_conf_read32(dev->sbdf, msix_pba_offset_reg(pos));
         bir = (u8)(pba_offset & PCI_MSIX_BIRMASK);
-        pba_paddr = read_pci_mem_bar(PCI_SBDF(seg, pbus, pslot, pfunc), bir, vf,
-                                     pf_info);
+        pba_paddr = read_pci_mem_bar(pf_dev, bir, vf);
         WARN_ON(!pba_paddr);
         pba_paddr += pba_offset & ~PCI_MSIX_BIRMASK;
 


