Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A83CF8949
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 14:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196086.1513958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7PQ-0004Sm-B3; Tue, 06 Jan 2026 13:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196086.1513958; Tue, 06 Jan 2026 13:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7PQ-0004Qn-6P; Tue, 06 Jan 2026 13:47:40 +0000
Received: by outflank-mailman (input) for mailman id 1196086;
 Tue, 06 Jan 2026 13:47:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd7PP-0004MT-8n
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 13:47:39 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 424d368c-eb06-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 14:47:36 +0100 (CET)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-431048c4068so598447f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 05:47:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee5eesm4452123f8f.34.2026.01.06.05.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 05:47:35 -0800 (PST)
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
X-Inumbo-ID: 424d368c-eb06-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767707256; x=1768312056; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BDLn8He9nK6XbJ/8V88KJti2+rZ0Z1f8Yos0AnCw0VA=;
        b=IMu9it5QrAlG/ynaM5vWLVt0djk+r8fJuMGnjOyAWOZjhntETUZ2i1PYdrZCGpcpSj
         tSes/WK92yUsCT2IHQeVnSgsnBpr2hFIk8kgBVPIHCkq7Cqmia0nYzqB70wGgKdi7u2k
         CPQDNmOkboOFgOzY1uL7kBXjlUSfmoea/XsEi/U8sCfeufXWkGet9klA22NGO8ueB2Eh
         lit9gCsbVye8SRIorfeyCwL/RObgLpz5AUAR+XJmPReKSGMMxz1DGDd/cyG2lUU8P6Gz
         1eveofkur4wEjwIBbex4tlb2Y3+rnnWf20gdUYt2QtXO5DYJKu2YM2bH2fZNltd1VUTS
         TYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707256; x=1768312056;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDLn8He9nK6XbJ/8V88KJti2+rZ0Z1f8Yos0AnCw0VA=;
        b=Az1ZXQAaDMTIxgV3TksvaUodBE4vCtDh3aLX5J7+MIiDmijJ/DZQRgtUTN6ihwATjA
         j+thELNJShwDF6F12oC0LLMqlnjxRyNe5qNIp7SCpFZgJ17ZPu8PVs4EYasbV1PyLOdK
         mOqK2QlYDqXU9NyvB8ObrWxIW3aDDOGU9FdfDyw37MqmJNFVumfePIlHBew69kkgrjV1
         jYYqrD6oSrC6i+s4siCHytQa6EnwLgFLZU9/L/fp8eUFGUEzkvmVD9PeH6956zWtzu9a
         ZSaBwHiE7yapDEOMPGD1i722cCt4CiHm62VlnZBeMSx+xOIRK2+QQTkABPbtiUWyNLsK
         Dt6g==
X-Gm-Message-State: AOJu0YyI5iJHymEtX8XV3Im1Mn2qUv2ouonDw1I2PNPtxRFYHQAbWKK0
	uqNO0MBPk7CiQ4xQnwPnEUdkwy7u5TfQe1G4q4TaLuH3wlFu9+9J7880JloEuRZUksbik80vwOI
	tDHgT2g==
X-Gm-Gg: AY/fxX7zZoE5VJ1m+t8rhT2Frq2wuRkxMFl3dIAorMSe+FBJDY3o4tTUYED3fbg1LLs
	+NMw05oFSb0RkpkhwhiqKcIpbqCj+aEsDIjAOoJZimeC1Tkh4ZH4YEYq2PDF/8ZSEP5VHmNOYZG
	7ByqonUUVenCqWlxD6c9OKPsDcgvom6Ms3tgOJ6cCz4YihiIEi/ZdDMoj9zOSX9UmyKD9t+3s0/
	vFajaGqgzNtTrnhEj6nHN60gnaWt9tSVyXPnRPrMObfqSWGoj6Q6tQsdMQVdqi9k6EqD3jorgSr
	uV3ViNt1OJkKRnq1J8KHxP0jigrNuvCWen6xlqj8ROpyTrvEUdH8vNMcxxuh1onj2cA/nztN5vm
	Et8WR0CsI+BQZ6dtm9+7BbnOR+GNUVnPDFKtyk/AMqZuD8izO/2EKcnsoCjoa1rxL9nArxnjJwy
	/23XUNwIPW5Eq9Dz2GRRmD/Ewr7wSMScQ2PyZJvspheIbh1NnFyoo+IEmh1XUZN3OdSzm44Ecuf
	NZClKcPP+oWAg==
X-Google-Smtp-Source: AGHT+IGR1qjdN0+d6S1aRQi9RMdKImof2Me0oRB/iSacgv1pCD0vvzys+mivEscXWKdH61/P37RRUQ==
X-Received: by 2002:a5d:4751:0:b0:430:2773:84d6 with SMTP id ffacd0b85a97d-432bcfc4e77mr2539572f8f.24.1767707255790;
        Tue, 06 Jan 2026 05:47:35 -0800 (PST)
Message-ID: <52eb1293-b5d4-4f7a-b53b-285e4dd274a5@suse.com>
Date: Tue, 6 Jan 2026 14:47:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/6] PCI: determine whether a device has extended config space
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

Legacy PCI devices don't have any extended config space. Reading any part
thereof may return all ones or other arbitrary data, e.g. in some cases
base config space contents repeatedly.

Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
determination of device type; in particular some comments are taken
verbatim from there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that alloc_pdev()'s switch doesn't handle DEV_TYPE_PCI2PCIe_BRIDGE at
all. Such bridges will therefore not have ->ext_cfg set (which is likely
wrong). Shouldn't we handle them like DEV_TYPE_LEGACY_PCI_BRIDGE (or
DEV_TYPE_PCI?) anyway (just like VT-d's set_msi_source_id() does)?

Linux also has CONFIG_PCI_QUIRKS, allowing to compile out the slightly
risky code (as reads may in principle have side effects). Should we gain
such, too?

--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -310,6 +310,41 @@ static void apply_quirks(struct pci_dev
              * from trying to size the BARs or add handlers to trap accesses.
              */
             pdev->ignore_bars = true;
+
+    if ( pdev->ext_cfg )
+    {
+        unsigned int pos;
+
+        /*
+         * PCI Express to PCI/PCI-X Bridge Specification, rev 1.0, 4.1.4 says
+         * that when forwarding a type1 configuration request the bridge must
+         * check that the extended register address field is zero.  The bridge
+         * is not permitted to forward the transactions and must handle it as
+         * an Unsupported Request.  Some bridges do not follow this rule and
+         * simply drop the extended register bits, resulting in the standard
+         * config space being aliased, every 256 bytes across the entire
+         * configuration space.  Test for this condition by comparing the first
+         * dword of each potential alias to the vendor/device ID.
+         * Known offenders:
+         *   ASM1083/1085 PCIe-to-PCI Reversible Bridge (1b21:1080, rev 01 & 03)
+         *   AMD/ATI SBx00 PCI to PCI Bridge (1002:4384, rev 40)
+         */
+        for ( pos = PCI_CFG_SPACE_SIZE;
+              pos < PCI_CFG_SPACE_EXP_SIZE; pos += PCI_CFG_SPACE_SIZE )
+        {
+            if ( pci_conf_read16(pdev->sbdf, pos) != vendor ||
+                 pci_conf_read16(pdev->sbdf, pos + 2) != device )
+                break;
+        }
+
+        if ( pos >= PCI_CFG_SPACE_EXP_SIZE )
+        {
+            printk(XENLOG_WARNING
+                   "%pp: extended config space aliases base one\n",
+                   &pdev->sbdf);
+            pdev->ext_cfg = false;
+        }
+    }
 }
 
 static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
@@ -351,6 +386,8 @@ static struct pci_dev *alloc_pdev(struct
         unsigned long flags;
 
         case DEV_TYPE_PCIe2PCI_BRIDGE:
+            pdev->ext_cfg = true;
+            fallthrough;
         case DEV_TYPE_LEGACY_PCI_BRIDGE:
             sec_bus = pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
             sub_bus = pci_conf_read8(pdev->sbdf, PCI_SUBORDINATE_BUS);
@@ -363,9 +400,19 @@ static struct pci_dev *alloc_pdev(struct
                 pseg->bus2bridge[sec_bus].devfn = devfn;
             }
             spin_unlock_irqrestore(&pseg->bus2bridge_lock, flags);
+
+            fallthrough;
+        case DEV_TYPE_PCI:
+            pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_PCIX);
+            if ( pos &&
+                 (pci_conf_read32(pdev->sbdf, pos + PCI_X_STATUS) &
+                  (PCI_X_STATUS_266MHZ | PCI_X_STATUS_533MHZ)) )
+                pdev->ext_cfg = true;
             break;
 
         case DEV_TYPE_PCIe_ENDPOINT:
+            pdev->ext_cfg = true;
+
             pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP);
             BUG_ON(!pos);
             cap = pci_conf_read16(pdev->sbdf, pos + PCI_EXP_DEVCAP);
@@ -409,9 +456,9 @@ static struct pci_dev *alloc_pdev(struct
             }
             break;
 
-        case DEV_TYPE_PCI:
         case DEV_TYPE_PCIe_BRIDGE:
         case DEV_TYPE_PCI_HOST_BRIDGE:
+            pdev->ext_cfg = true;
             break;
 
         default:
@@ -420,6 +467,19 @@ static struct pci_dev *alloc_pdev(struct
             break;
     }
 
+    if ( pdev->ext_cfg &&
+         /*
+          * Regular PCI devices have 256 bytes, but PCI-X 2 and PCI Express
+          * devices have 4096 bytes.  Even if the device is capable, that
+          * doesn't mean we can access it.  Maybe we don't have a way to
+          * generate extended config space accesses, or the device is behind a
+          * reverse Express bridge.  So we try reading the dword at
+          * PCI_CFG_SPACE_SIZE which must either be 0 or a valid extended
+          * capability header.
+          */
+         pci_conf_read32(pdev->sbdf, PCI_CFG_SPACE_SIZE) == 0xffffffffU )
+        pdev->ext_cfg = false;
+
     apply_quirks(pdev);
     check_pdev(pdev);
 
@@ -717,6 +777,11 @@ int pci_add_device(u16 seg, u8 bus, u8 d
 
                 list_add(&pdev->vf_list, &pf_pdev->vf_list);
             }
+
+            if ( !pdev->ext_cfg )
+                printk(XENLOG_WARNING
+                       "%pp: VF without extended config space?\n",
+                       &pdev->sbdf);
         }
     }
 
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -126,6 +126,9 @@ struct pci_dev {
 
     nodeid_t node; /* NUMA node */
 
+    /* Whether the device has extended config space. */
+    bool ext_cfg;
+
     /* Device to be quarantined, don't automatically re-assign to dom0 */
     bool quarantine;
 


