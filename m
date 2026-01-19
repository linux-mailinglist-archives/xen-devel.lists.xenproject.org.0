Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B23D3ACAE
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 15:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208139.1520382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhqWu-0000jw-Ok; Mon, 19 Jan 2026 14:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208139.1520382; Mon, 19 Jan 2026 14:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhqWu-0000hE-LS; Mon, 19 Jan 2026 14:46:56 +0000
Received: by outflank-mailman (input) for mailman id 1208139;
 Mon, 19 Jan 2026 14:46:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhqWt-0000Ek-5y
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 14:46:55 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2770eaa-f545-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 15:46:54 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-43284ed32a0so2439382f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 06:46:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996cf42sm23755497f8f.20.2026.01.19.06.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 06:46:53 -0800 (PST)
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
X-Inumbo-ID: b2770eaa-f545-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768834014; x=1769438814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+dUkXgiK2DH2wyqqSUw4eWQiqTgrfXkQw7d9LrW88Ck=;
        b=OvivTaFxonCBinYv5MWrG0oEcMTfSuD8J4n6yNBHe2MjAyYkgn6sgPMUtpb1oNeC3P
         8yxOF1hpt/NN5Ap5NlTbBCQhCKTxD3Oxn/Dj6UE/KdsxZsLqvt/DtkrP4Q5RHQIrOgvu
         7zw/MrKITyD+Q8jljQM4YMSLvuSwTYkJdhp6qtMnBp+CnY6MIu/EsSG2ALDf2oLsGnKW
         l2YenEFdj6FyHQcH9GW6OB6HxyioJUPbxNo+G+spnvlyJy3YLJbLGePAGD0robpsj2fy
         GPS2ckPWmOF1ITJkX7OPuop8VvX9Cp4I9JF3w6ILE2dTYNzGSGHyASGNllPYuoWCFkxD
         JvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768834014; x=1769438814;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dUkXgiK2DH2wyqqSUw4eWQiqTgrfXkQw7d9LrW88Ck=;
        b=lB1+HJiTIF8X70yrGkbypIxMjL4TnCF/RNA1hnbqRPjfBN1iU6k3RGmvsgfW8sIXrG
         X8wy0av+WN3DIwKmJ5QBd345eCXY2ehNkpsZl2FiwmHzpo2NZxvzN3nLrn4yx6KW3NYZ
         4WHJNfVTMbkwX0vIiFKxyGanCdtaxhPePVmlznSCNarakZttSA/SJNWGAjzV6JEHmyOE
         bphKNpSleoXwP4jdAZ+WAMBJFLxdPTLuh4/jtg6o3dBRFpughCAqLzdeb/fSUesJ6Utn
         DXg+SRabaHyeRbR1OMWGBU4UMv5r/Jw88HaIq0bFAwgxh9v3xnr5P8xczCM3NcRAhTyr
         S6VQ==
X-Gm-Message-State: AOJu0Yxp2XPrrXRQkjChAuKIvuJlvvwVyfyzapqJQGv83/fhuVCZKRv2
	P/jrpam86WCzTHXtEbwl10+FLg0Ew/4G6vO5ci2IEwYcITp+NCJy9IlFqkscTDNOl4u0518t0aK
	oqQ6CcQ==
X-Gm-Gg: AZuq6aIHi8C7KkU4f5cLP7NMJdvgx47ix2fPF9u0/bCNqO/6pF+vy0GYHdbmucMwSpc
	y4Ritdeu5x1dY7PvlLsRalykeWAEi9puCnCReuKC0hEhPU30Tr8i+jn/lvCEgmbOhzeoSh6HjM4
	QVQX/o7MtFn7M1nR4o5k5jB6GoOte14Z/jnVstkoiZe15Y+j5lutK4PGb5UPV6g7H/ieRie+Cj3
	qePPFfx63tXj7z+HBVwbMambcfxLKlQpiIMvmT89nf+puRylWw6HXTfR5Rx1lJPQz9BUNPneU0g
	iY2/oxYgZwpW3Nbon2Toj8Y7HYEYjwRrR3SfjLR80qCjjEwv1auvu7NT2bxnp+KDddMGJA+Zj6p
	kHM/6Gp+QEs4HGZaGObDE+yJk9Yixs1A82EoiL9ls7gx3mb0+gC/pRNdlC4JlpXA/h2D2BcUIMC
	J/si3rXQ8sYVD3LZ8n+DVHWxKJofAN7W/i4nXz8YaoHokq41SYNoJRxs+bJUzn1adklhIcUvE1H
	+s=
X-Received: by 2002:a5d:5f94:0:b0:431:1d4:3a8a with SMTP id ffacd0b85a97d-43569972d22mr13740605f8f.7.1768834013906;
        Mon, 19 Jan 2026 06:46:53 -0800 (PST)
Message-ID: <edb5eeb2-2cb2-4614-a042-7788fbb345c7@suse.com>
Date: Mon, 19 Jan 2026 15:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/4] PCI: determine whether a device has extended config
 space
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
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
In-Reply-To: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
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
Should we skip re-evaluation when pci_mmcfg_arch_enable() takes its early
exit path?

The warning near the bottom of pci_check_extcfg() may be issued multiple
times for a single device now. Should we try to avoid that?

Note that no vPCI adjustments are done here, but they're going to be
needed: Whatever requires extended capabilities will need re-
evaluating / newly establishing / tearing down in case an invocation of
PHYSDEVOP_pci_mmcfg_reserved alters global state.

Linux also has CONFIG_PCI_QUIRKS, allowing to compile out the slightly
risky code (as reads may in principle have side effects). Should we gain
such, too?
---
v2: Major re-work to also check upon PHYSDEVOP_pci_mmcfg_reserved
    invocation.

--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -22,6 +22,8 @@ int physdev_map_pirq(struct domain *d, i
                      struct msi_info *msi);
 int physdev_unmap_pirq(struct domain *d, int pirq);
 
+int cf_check physdev_check_pci_extcfg(struct pci_dev *pdev, void *arg);
+
 #include "x86_64/mmconfig.h"
 
 #ifndef COMPAT
@@ -160,6 +162,17 @@ int physdev_unmap_pirq(struct domain *d,
 
     return ret;
 }
+
+int cf_check physdev_check_pci_extcfg(struct pci_dev *pdev, void *arg)
+{
+    const struct physdev_pci_mmcfg_reserved *info = arg;
+
+    ASSERT(pdev->seg == info->segment);
+    if ( pdev->bus >= info->start_bus && pdev->bus <= info->end_bus )
+        pci_check_extcfg(pdev);
+
+    return 0;
+}
 #endif /* COMPAT */
 
 ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
@@ -511,6 +524,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
 
         ret = pci_mmcfg_reserved(info.address, info.segment,
                                  info.start_bus, info.end_bus, info.flags);
+
+        if ( !ret )
+            ret = pci_segment_iterate(info.segment, physdev_check_pci_extcfg,
+                                      &info);
+
         if ( !ret && has_vpci(currd) && (info.flags & XEN_PCI_MMCFG_RESERVED) )
         {
             /*
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -422,6 +422,9 @@ static struct pci_dev *alloc_pdev(struct
     }
 
     apply_quirks(pdev);
+
+    pci_check_extcfg(pdev);
+
     check_pdev(pdev);
 
     return pdev;
@@ -718,6 +721,11 @@ int pci_add_device(u16 seg, u8 bus, u8 d
 
                 list_add(&pdev->vf_list, &pf_pdev->vf_list);
             }
+
+            if ( !pdev->ext_cfg )
+                printk(XENLOG_WARNING
+                       "%pp: VF without extended config space?\n",
+                       &pdev->sbdf);
         }
     }
 
@@ -1041,6 +1049,75 @@ enum pdev_type pdev_type(u16 seg, u8 bus
     return pos ? DEV_TYPE_PCIe_ENDPOINT : DEV_TYPE_PCI;
 }
 
+void pci_check_extcfg(struct pci_dev *pdev)
+{
+    unsigned int pos, sig;
+
+    pdev->ext_cfg = false;
+
+    switch ( pdev->type )
+    {
+    case DEV_TYPE_PCIe_ENDPOINT:
+    case DEV_TYPE_PCIe_BRIDGE:
+    case DEV_TYPE_PCI_HOST_BRIDGE:
+    case DEV_TYPE_PCIe2PCI_BRIDGE:
+    case DEV_TYPE_PCI2PCIe_BRIDGE:
+        break;
+
+    case DEV_TYPE_LEGACY_PCI_BRIDGE:
+    case DEV_TYPE_PCI:
+        pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_PCIX);
+        if ( !pos ||
+             !(pci_conf_read32(pdev->sbdf, pos + PCI_X_STATUS) &
+               (PCI_X_STATUS_266MHZ | PCI_X_STATUS_533MHZ)) )
+            return;
+        break;
+
+    default:
+        return;
+    }
+
+    /*
+     * Regular PCI devices have 256 bytes, but PCI-X 2 and PCI Express devices
+     * have 4096 bytes.  Even if the device is capable, that doesn't mean we
+     * can access it.  Maybe we don't have a way to generate extended config
+     * space accesses, or the device is behind a reverse Express bridge.  So
+     * we try reading the dword at PCI_CFG_SPACE_SIZE which must either be 0
+     * or a valid extended capability header.
+     */
+    if ( pci_conf_read32(pdev->sbdf, PCI_CFG_SPACE_SIZE) == 0xffffffffU )
+        return;
+
+    /*
+     * PCI Express to PCI/PCI-X Bridge Specification, rev 1.0, 4.1.4 says that
+     * when forwarding a type1 configuration request the bridge must check
+     * that the extended register address field is zero.  The bridge is not
+     * permitted to forward the transactions and must handle it as an
+     * Unsupported Request.  Some bridges do not follow this rule and simply
+     * drop the extended register bits, resulting in the standard config space
+     * being aliased, every 256 bytes across the entire configuration space.
+     * Test for this condition by comparing the first dword of each potential
+     * alias to the vendor/device ID.
+     * Known offenders:
+     *   ASM1083/1085 PCIe-to-PCI Reversible Bridge (1b21:1080, rev 01 & 03)
+     *   AMD/ATI SBx00 PCI to PCI Bridge (1002:4384, rev 40)
+     */
+    sig = pci_conf_read32(pdev->sbdf, PCI_VENDOR_ID);
+    for ( pos = PCI_CFG_SPACE_SIZE;
+          pos < PCI_CFG_SPACE_EXP_SIZE; pos += PCI_CFG_SPACE_SIZE )
+        if ( pci_conf_read32(pdev->sbdf, pos) != sig )
+            break;
+
+    if ( pos >= PCI_CFG_SPACE_EXP_SIZE )
+    {
+        printk(XENLOG_WARNING "%pp: extended config space aliases base one\n",
+               &pdev->sbdf);
+        return;
+    }
+
+    pdev->ext_cfg = true;
+}
+
 /*
  * find the upstream PCIe-to-PCI/PCIX bridge or PCI legacy bridge
  * return 0: the device is integrated PCI device or PCIe
@@ -1841,6 +1918,29 @@ int pci_iterate_devices(int (*handler)(s
     return pci_segments_iterate(iterate_all, &iter) ?: iter.rc;
 }
 
+/* Iterate a single PCI segment, with locking but without preemption. */
+int pci_segment_iterate(unsigned int segment,
+                        int (*handler)(struct pci_dev *pdev, void *arg),
+                        void *arg)
+{
+    struct pci_seg *seg = get_pseg(segment);
+    struct segment_iter iter = {
+        .handler = handler,
+        .arg = arg,
+    };
+
+    if ( !seg )
+        return -ENODEV;
+
+    pcidevs_lock();
+
+    iter.rc = iterate_all(seg, &iter) ?: iter.rc;
+
+    pcidevs_unlock();
+
+    return iter.rc;
+}
+
 /*
  * Local variables:
  * mode: C
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -126,6 +126,9 @@ struct pci_dev {
 
     nodeid_t node; /* NUMA node */
 
+    /* Whether the device has (accessible) extended config space. */
+    bool ext_cfg;
+
     /* Device to be quarantined, don't automatically re-assign to dom0 */
     bool quarantine;
 
@@ -242,6 +245,11 @@ void pci_check_disable_device(u16 seg, u
 int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
                         void *arg);
 
+/* Iterate a single PCI segment, with locking but without preemption. */
+int pci_segment_iterate(unsigned int segment,
+                        int (*handler)(struct pci_dev *pdev, void *arg),
+                        void *arg);
+
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg);
 uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg);
 uint32_t pci_conf_read32(pci_sbdf_t sbdf, unsigned int reg);
@@ -260,6 +268,7 @@ unsigned int pci_find_next_cap_ttl(pci_s
                                    unsigned int *ttl);
 unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
                                unsigned int cap);
+void pci_check_extcfg(struct pci_dev *pdev);
 unsigned int pci_find_ext_capability(const struct pci_dev *pdev,
                                      unsigned int cap);
 unsigned int pci_find_next_ext_capability(const struct pci_dev *pdev,


