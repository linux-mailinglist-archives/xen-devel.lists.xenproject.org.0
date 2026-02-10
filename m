Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIf7CBMOi2l/PQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:53:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B2119D8F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:53:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226233.1532768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vplMT-0004lU-EZ; Tue, 10 Feb 2026 10:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226233.1532768; Tue, 10 Feb 2026 10:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vplMT-0004jn-Bq; Tue, 10 Feb 2026 10:52:53 +0000
Received: by outflank-mailman (input) for mailman id 1226233;
 Tue, 10 Feb 2026 10:52:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vplMS-0004jf-8L
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 10:52:52 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a522676b-066e-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 11:52:51 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-436e87589e8so1971499f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 02:52:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4362974b230sm37056571f8f.36.2026.02.10.02.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 02:52:50 -0800 (PST)
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
X-Inumbo-ID: a522676b-066e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770720771; x=1771325571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eJHKitDbZ1B8kzKIjRTpmb8+1aYuXto+6m6ltPFsdaA=;
        b=Jq1Fz/wgwMc8jbYcv5HMTV4DIwNX0sZUNSK1itQ4iVrIo0kHPNug2ZW/lOMjcApMyU
         w68ZpQPd/mzgHSpDzZzuTayJXdRffXvzc9nUe1S0AI2szGR4vtqQ0f2zAVaOJ/o5AsEY
         i1X0tKt+2SB5Ih8plYogqLCnzYWMbzZvPLkmGAiwSCH6mrYZZocMDafSVbmVAZf5yR/B
         OvRF//9FYrJKwQzT2ezWO7A8xoU6ZoWCmg+z6uhFQBrUxuLBgLS4+sq+amuD2yUkdBTz
         L+hXk4M75mOHR2AhKYnX8lEDDqk26HTFmSUXVle6aITcRIwNs7tC2PWG/DoZZWsQdqa+
         G8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770720771; x=1771325571;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJHKitDbZ1B8kzKIjRTpmb8+1aYuXto+6m6ltPFsdaA=;
        b=AwHMoQi8VYDKRrYmtXsiMjukN9xBq6khM2mcQ/9NIvWyILx7FwyS64pOyoMJ0MdfGH
         OCbR6r+FpMdfDqljkF6FX0r5CfPZBCWdPNqxNk/L3b0bU2zxcjgODVBfM8pEjAQ+SBjb
         6Cv7wS7j2083fGeZGS3okxF+nQ1knL/iCwoYd46xTDRlrevc4E9HzXMaHiQulMwMS2Ee
         hHctB4nTxmkTBcPuBbd+gBBwclBuvfj6iIjFWQGCDhe66S3Iofv1I89+TgyoGEKSMbnH
         I+BOVp2ByrbHYdfpznQDzsFeixXhP4B5REZPf/V1CMbQYunxvuBa+AZ5D17MYodjsSau
         BszQ==
X-Gm-Message-State: AOJu0YxfWi8x4ZWj3vAzpquerkCWOQSasr0QyuGC3i2H49q4pRnr2vbM
	f5KalVZhrZY8FfwtEzWxHZUVcNzKCtWTCrsG8aZ5Q2KupEjaHs1vq83XJ6k1RjEOR8v4OcGRhL7
	/Ga0=
X-Gm-Gg: AZuq6aLKzEMOULbzYrEV7XeA46L43TBC8N/vznCs1WHUM6SLXacHHR4qXSlf52y/1xB
	N/ZvBcCY/etC++H+OfH7hpRVtUzsSPRkBmqwqRzhyD5Fhfp5kjwwlZokytVyOa+PQh8AsuQFLdx
	sl3p0hmu20QDykSEVbT7DaJVUVigrU+eONW4oUFTrl6rNClfGzHvGTrFhE0surpxUoWdnfojpOc
	JO0AeqRvl6wYFwgIWQG5qGrpoKyUw2tvrVrJs3rXbHe81SyqHuyP5JL4/oZgvy9pomVLtI/7mCH
	imx3QbzNA7k+A/UqaJFcZyQ3mR4x2FEPds1qrdr6DRvV/wrr2SjJCPOqRyQElvurnKmyqv58ujG
	e0GnqQsfIbmLHm0Qp/E72m1l+GzyqmsBkik8HPMFQivY+f2dtBJ1DZCzPKNSb3BVh3V6u75Ipwm
	cf4vymbkoRNApGaXBIJW+2q3ebv0D8fcxZKQuTUslBk+usBNE5+pgTQV0LveVK04oEVylj0Kl/x
	EWKdwaoz43J63Y=
X-Received: by 2002:a05:6000:144f:b0:431:9dd:2cca with SMTP id ffacd0b85a97d-4377a503d26mr2412970f8f.7.1770720770561;
        Tue, 10 Feb 2026 02:52:50 -0800 (PST)
Message-ID: <ff4b58f6-cf9d-48c5-9440-3288e20a51d7@suse.com>
Date: Tue, 10 Feb 2026 11:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/5] x86/PCI: avoid re-evaluation of extended config space
 accessibility
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
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
In-Reply-To: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email,citrix.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 814B2119D8F
X-Rspamd-Action: no action

When, during boot, we have already correctly determined availability of
the MMCFG access method for a given bus range, there's then no need to
invoke pci_check_extcfg() again for every of the devices. This in
particular avoids ->ext_cfg to transiently indicate the wrong state.

Switch to using Xen style on lines being touched and immediately adjacent
ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4: Don't bypass mcfg_ioremap(cfg, idx, 0) in pci_mmcfg_arch_disable().
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
@@ -160,9 +161,10 @@ int pci_mmcfg_arch_enable(unsigned int i
     return 0;
 }
 
-void pci_mmcfg_arch_disable(unsigned int idx)
+int pci_mmcfg_arch_disable(unsigned int idx)
 {
     const typeof(pci_mmcfg_config[0]) *cfg = pci_mmcfg_virt[idx].cfg;
+    int ret = !pci_mmcfg_virt[idx].virt;
 
     pci_mmcfg_virt[idx].virt = NULL;
     /*
@@ -173,6 +175,8 @@ void pci_mmcfg_arch_disable(unsigned int
     mcfg_ioremap(cfg, idx, 0);
     printk(KERN_WARNING "PCI: Not using MCFG for segment %04x bus %02x-%02x\n",
            cfg->pci_segment, cfg->start_bus_number, cfg->end_bus_number);
+
+    return ret;
 }
 
 bool pci_mmcfg_decode(unsigned long mfn, unsigned int *seg, unsigned int *bdf)


