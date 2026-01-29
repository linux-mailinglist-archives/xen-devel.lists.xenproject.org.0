Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHr5Dzlce2nXEAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 14:10:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D93B046D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 14:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216448.1526404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlRmh-0005YS-6q; Thu, 29 Jan 2026 13:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216448.1526404; Thu, 29 Jan 2026 13:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlRmh-0005XM-1l; Thu, 29 Jan 2026 13:10:07 +0000
Received: by outflank-mailman (input) for mailman id 1216448;
 Thu, 29 Jan 2026 13:10:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlRmf-0005LI-I4
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 13:10:05 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d32ce607-fd13-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 14:10:03 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4801ea9bafdso4120375e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 05:10:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bfb59asm183476535e9.7.2026.01.29.05.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 05:10:03 -0800 (PST)
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
X-Inumbo-ID: d32ce607-fd13-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769692203; x=1770297003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gmIbWuEiblilxseM1vB5o3yWlIHmhzxF+tqb0Hhe36U=;
        b=PHDbP831jtwSknvsWqhq8keOFejbal+hFI6rKbYBaTKE2T2ZRNORE4b0oQrSwfG2yt
         ygtL+5fUg5DHHvLKPEwH2jXuUFtM+oSNUio/nLKUjrnjH5D+1VNV9YmcvIoP+wzRX9xE
         yQM6NOLeww1GLY2BCzHr0NXvkO7ypUXCCNUxos+ZnRY86ACPAa4XuHNNjE6da1gzsm2g
         MxbVutwHJ0u5D0/liNUdYSaxa1+2cU6Z78yfdo2nH3tc81SFE461keBJjxGUQL7oInE8
         +Kqo4y0exBvyhtxycTpr3827yfkkz/HCJOB3XfspU0G/Tj4Ek/hbZ3/YpyIKH7PvW6Qf
         P6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769692203; x=1770297003;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmIbWuEiblilxseM1vB5o3yWlIHmhzxF+tqb0Hhe36U=;
        b=tU1EA+QY0Gi+kW9wB22WBfBwBXZJJ7afEnpUbv1HLOWe1gIN7Q2HKfivtnXABw88Qg
         A04VS0UGVIlZ85U0oeA0joVsLcjYpnED02QETS1fpzxz6KeQhzG1PuUUEJEF1MX+Fw9M
         z4PXQbqPbjrVMkCdU93GC2vCKZQx/yrgiSKBqnvaVHGZQ8lhdPgjYKezzTo/rJE5BLfP
         Xbr8rnZJeqAndUoNDGHshPKhzGb92yfLOVH0EKyB9wQpOK6DIW6E6XBCkG8GR6Uq4sew
         vF+tHD+aNaOZBYZl/WvKNRuYBifhhgunPtLAsJ8KfmkUIpXq7kSq9vd4LaH3kb0fSjad
         yVzw==
X-Gm-Message-State: AOJu0YzfwSyUMsa7hKyOSPLjBxBPLoUzjoRBdEXYDHDlMgtX4pMrp4i0
	5+Gh22SOLE93NHl42y1GKcJHHy6nXbfIWdGkAnvk9hAybjRK7DWt5IK27t5WcW+ZSWbFHA7Zin7
	S7ls=
X-Gm-Gg: AZuq6aJ+upLtuEM/X85C1ZtKSTCDkXSlRIrficNRCuKmdWCUow5V1/MqWL+uDiwZj/h
	oF1zTUf86YjD9ymHSID0WA2XJ/z4irdT/RujbJKn9jX2rB9qDjErpv8nSvRPKUN+QSSHNYPSk3T
	mr1c14Uc5wUKFATMZ21vpTYl79Kaag0I6o/9R24FsIBmjWO6X1+DFXGOFIp8oIliky++Uw6I/qG
	6E5ZPXS15iQ+mGRU/efykQ+9+8m+36CQABxXV8zulH+QGQIvGKQUdXFw+ycUdoBX8YXucSDSclg
	c4MKvBArE9tDX1wccFvp4I5bcloOytJCkCF407zlDra5MEMunBic/3we1T2kn4Y43b4ti2dzwJQ
	AIP6diV2gRIR/eCGiQedbokFA+L2Trrm1opBelhKIJ8ppoyRPGhMmXeF1NFPnXc5pCg64ORxF45
	ibMcfWKenKTcNsR88nspq/IcktBnERC0jS7O7fZWug3vf/RPKpVA9ZaadiTX+IAJj/nBhGkL2HL
	o0=
X-Received: by 2002:a05:600c:4e8b:b0:480:4a4f:c366 with SMTP id 5b1f17b1804b1-48069c486e6mr97299665e9.20.1769692203387;
        Thu, 29 Jan 2026 05:10:03 -0800 (PST)
Message-ID: <a0b10d39-daae-4fc0-af42-a3794a96f9f5@suse.com>
Date: Thu, 29 Jan 2026 14:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 5/6] x86/PCI: avoid re-evaluation of extended config space
 accessibility
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
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
In-Reply-To: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 98D93B046D
X-Rspamd-Action: no action

When, during boot, we have already correctly determined availability of
the MMCFG access method for a given bus range, there's then no need to
invoke pci_check_extcfg() again for every of the devices. This in
particular avoids ->ext_cfg to transiently indicate the wrong state.

Switch to using Xen style on lines being touched and immediately adjacent
ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -528,6 +528,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         if ( !ret )
             ret = pci_segment_iterate(info.segment, physdev_check_pci_extcfg,
                                       &info);
+        else if ( ret > 0 ) /* Indication of "no change". */
+            ret = 0;
 
         if ( !ret && has_vpci(currd) && (info.flags & XEN_PCI_MMCFG_RESERVED) )
         {
--- a/xen/arch/x86/x86_64/mmconfig.h
+++ b/xen/arch/x86/x86_64/mmconfig.h
@@ -74,6 +74,6 @@ int pci_mmcfg_reserved(uint64_t address,
                        unsigned int flags);
 int pci_mmcfg_arch_init(void);
 int pci_mmcfg_arch_enable(unsigned int idx);
-void pci_mmcfg_arch_disable(unsigned int idx);
+int pci_mmcfg_arch_disable(unsigned int idx);
 
 #endif /* X86_64_MMCONFIG_H */
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -388,8 +388,9 @@ static bool __init pci_mmcfg_reject_brok
                (unsigned int)cfg->start_bus_number,
                (unsigned int)cfg->end_bus_number);
 
-        if (!is_mmconf_reserved(addr, size, i, cfg) ||
-            pci_mmcfg_arch_enable(i)) {
+        if ( !is_mmconf_reserved(addr, size, i, cfg) ||
+             pci_mmcfg_arch_enable(i) < 0 )
+        {
             pci_mmcfg_arch_disable(i);
             valid = 0;
         }
@@ -417,8 +418,8 @@ void __init acpi_mmcfg_init(void)
         unsigned int i;
 
         pci_mmcfg_arch_init();
-        for (i = 0; i < pci_mmcfg_config_num; ++i)
-            if (pci_mmcfg_arch_enable(i))
+        for ( i = 0; i < pci_mmcfg_config_num; ++i )
+            if ( pci_mmcfg_arch_enable(i) < 0 )
                 valid = 0;
     } else {
         acpi_table_parse(ACPI_SIG_MCFG, acpi_parse_mcfg);
@@ -458,10 +459,11 @@ int pci_mmcfg_reserved(uint64_t address,
                        segment, start_bus, end_bus, address, cfg->address);
                 return -EIO;
             }
-            if (flags & XEN_PCI_MMCFG_RESERVED)
+
+            if ( flags & XEN_PCI_MMCFG_RESERVED )
                 return pci_mmcfg_arch_enable(i);
-            pci_mmcfg_arch_disable(i);
-            return 0;
+
+            return pci_mmcfg_arch_disable(i);
         }
     }
 
--- a/xen/arch/x86/x86_64/mmconfig_64.c
+++ b/xen/arch/x86/x86_64/mmconfig_64.c
@@ -138,8 +138,9 @@ int pci_mmcfg_arch_enable(unsigned int i
     const typeof(pci_mmcfg_config[0]) *cfg = pci_mmcfg_virt[idx].cfg;
     unsigned long start_mfn, end_mfn;
 
-    if (pci_mmcfg_virt[idx].virt)
-        return 0;
+    if ( pci_mmcfg_virt[idx].virt )
+        return 1;
+
     pci_mmcfg_virt[idx].virt = mcfg_ioremap(cfg, idx, PAGE_HYPERVISOR_UC);
     if (!pci_mmcfg_virt[idx].virt) {
         printk(KERN_ERR "PCI: Cannot map MCFG aperture for segment %04x\n",
@@ -160,10 +161,13 @@ int pci_mmcfg_arch_enable(unsigned int i
     return 0;
 }
 
-void pci_mmcfg_arch_disable(unsigned int idx)
+int pci_mmcfg_arch_disable(unsigned int idx)
 {
     const typeof(pci_mmcfg_config[0]) *cfg = pci_mmcfg_virt[idx].cfg;
 
+    if ( !pci_mmcfg_virt[idx].virt )
+        return 1;
+
     pci_mmcfg_virt[idx].virt = NULL;
     /*
      * Don't use destroy_xen_mappings() here, or make sure that at least
@@ -173,6 +177,8 @@ void pci_mmcfg_arch_disable(unsigned int
     mcfg_ioremap(cfg, idx, 0);
     printk(KERN_WARNING "PCI: Not using MCFG for segment %04x bus %02x-%02x\n",
            cfg->pci_segment, cfg->start_bus_number, cfg->end_bus_number);
+
+    return 0;
 }
 
 bool pci_mmcfg_decode(unsigned long mfn, unsigned int *seg, unsigned int *bdf)


