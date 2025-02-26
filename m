Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64CAA45D55
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 12:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896424.1305124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnFkB-0002ap-08; Wed, 26 Feb 2025 11:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896424.1305124; Wed, 26 Feb 2025 11:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnFkA-0002YM-Tm; Wed, 26 Feb 2025 11:38:26 +0000
Received: by outflank-mailman (input) for mailman id 896424;
 Wed, 26 Feb 2025 11:38:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnFkA-0002YG-3z
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 11:38:26 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f319340-f436-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 12:38:24 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so3839442f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 03:38:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd88300bsm5375151f8f.54.2025.02.26.03.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 03:38:22 -0800 (PST)
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
X-Inumbo-ID: 2f319340-f436-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740569902; x=1741174702; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pqpj6UdFfHar8VEB8+aonRsFTPEQFKR2ng3snPw90Xs=;
        b=O/Epv40Idklbmj2R3GoXAsY8uihJ4fL90OQM+6XrIG5DE6GpwvieKWAaex+jIDFiQg
         zDQZbdYMKObmH0SoKOmJqn38JT5O/aJeFsHo3IH4xSyitLY6H1XQzbe+Fpz4RKTJKmmO
         2l+qT4xVKTKzN8LOuws8LChkjO+0pSvmnbVamgWX7W+zWd/PzHQ6Piqd5UKzON6Ntyfl
         02eDJCQ8avCddwYuFEscspk4j3NkyrkzyDq+T9mhpek5JsHl4Voo0mQJZ0qPdHVJYdjA
         587arH8s4cJNmyMeF1yUw5c88uMJoWlJZa933sbOMCOJSIR2g6Zd0HOyfeILm5fg0DRu
         akcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740569902; x=1741174702;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pqpj6UdFfHar8VEB8+aonRsFTPEQFKR2ng3snPw90Xs=;
        b=vzj+NQjXrKddPnr4D4Il2XoJEtiAgPZt0PXZcD0ktXcKeP//Ne0G9xZQD3uApl7O9A
         C0yGlQPkv9+wemumPHUWwGGjenFWXFRcaV06OGs7G3Jii5Px6QEx8Bm4aaKhLZkcKgo3
         Sfib3exBU7uB4W+CO5ZEHJKc2SllkXRIDTcrIweAked+tzlxj/sND77vaj2pvWX6RnLh
         lOY5mskCtApKEbpxYtO0c70i+cDhBbpdsatUP98xVXiCUCHfs6WW4xjfPhjIUw2Y2QzM
         JZwx57mN4zhJymxZxd+kiz8xku/xyabdU8eLnD2Xj7PbtGY44IoYsfGU+GQeI99ck5yF
         4Cvg==
X-Gm-Message-State: AOJu0YxIjSZDp8D9WGGCPlhdSmQmmZEKQT2GoKrumbFwWs3FumXL+Vtb
	mxtXO1EMsSnEXmoqzO81ixqEhe0YvHGdzu50Qt4ojIQRnBq7JwOd+NHww05qLD0S0kA+Gk37kgM
	=
X-Gm-Gg: ASbGncsHzHJ5hesMbP49IuiH6LR1qU6xHfWZbjGRwRoMSyfEcySC34JgpIsL8vZi3tU
	cdd0t/i1uUWu9pURD5oKMRT6ggP5zUNh78/wuiZS+IJZTx58smGhDr4gQOV7RMWJhGAybUrXKxL
	OdgoyWa+JsJqZZPMt0dOszh5rywtV/RuX3J1A4BAMTZyysiqj1HRhEKpyFdmqO1B8EM6XcOAXyR
	DaT7f/ebuYi9f+SooGzmSzcY4cr9NN3t7hd0L2feiARmm7NHHVAjpxbBOi9C0p5trRjY8nHTPMa
	xdKrsZ6fn+iqRa3aK+UTZaIRg4kSadx28DWHrtJKYtyXZTOiQfc3rLPoMhuh87CjPjFjKAHAynb
	QNl/owVtPUQ0=
X-Google-Smtp-Source: AGHT+IFHGc1NuRmx97qbI1CvQSOt0gGnTNBljFJeCLGSVpmVx0/TdQL6uUMEmfxYVGnn9zhF1m5syg==
X-Received: by 2002:adf:ed49:0:b0:38f:483f:8319 with SMTP id ffacd0b85a97d-390d4f9cfb7mr2108864f8f.51.1740569902491;
        Wed, 26 Feb 2025 03:38:22 -0800 (PST)
Message-ID: <4ada4343-c65b-456d-b0c2-9ae59937aaff@suse.com>
Date: Wed, 26 Feb 2025 12:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] PCI: drop pci_segments_init()
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

Have callers invoke pci_add_segment() directly instead: With radix tree
initialization moved out of the function, its name isn't quite
describing anymore what it actually does.

On x86 move the logic into __start_xen() itself, to reduce the risk of
re-introducing ordering issues like the one which was addressed by
26fe09e34566 ("radix-tree: introduce RADIX_TREE{,_INIT}()").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is entirely optional and up for discussion. There certainly also is
an argument towards keeping the function. Otoh on Arm there is the still
open question whether segment 0 really is kind of special there (as it
is on x86, largely for historical reasons), or whether the code can be
dropped there altogether.
---
v4: Move x86 logic into __start_xen() itself.
v3: Adjust description to account for and re-base over dropped earlier
    patch.
v2: New.

--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -88,7 +88,8 @@ static int __init pci_init(void)
     if ( !pci_passthrough_enabled )
         return 0;
 
-    pci_segments_init();
+    if ( pci_add_segment(0) )
+        panic("Could not initialize PCI segment 0\n");
 
     if ( acpi_disabled )
         return dt_pci_init();
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -402,8 +402,6 @@ void __init acpi_mmcfg_init(void)
 {
     bool valid = true;
 
-    pci_segments_init();
-
     /* MMCONFIG disabled */
     if ((pci_probe & PCI_PROBE_MMCONF) == 0)
         return;
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1898,6 +1898,13 @@ void asmlinkage __init noreturn __start_
     setup_system_domains();
 
     /*
+     * Ahead of any ACPI table parsing make sure we have control structures
+     * for PCI segment 0.
+     */
+    if ( pci_add_segment(0) )
+        panic("Could not initialize PCI segment 0\n");
+
+    /*
      * IOMMU-related ACPI table parsing has to happen before APIC probing, for
      * check_x2apic_preenabled() to be able to observe respective findings, in
      * particular iommu_intremap having got turned off.
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -127,12 +127,6 @@ static int pci_segments_iterate(
     return rc;
 }
 
-void __init pci_segments_init(void)
-{
-    if ( !alloc_pseg(0) )
-        panic("Could not initialize PCI segment 0\n");
-}
-
 int __init pci_add_segment(u16 seg)
 {
     return alloc_pseg(seg) ? 0 : -ENOMEM;
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -219,7 +219,6 @@ void setup_hwdom_pci_devices(struct doma
                              int (*handler)(uint8_t devfn,
                                             struct pci_dev *pdev));
 int pci_release_devices(struct domain *d);
-void pci_segments_init(void);
 int pci_add_segment(u16 seg);
 const unsigned long *pci_get_ro_map(u16 seg);
 int pci_add_device(u16 seg, u8 bus, u8 devfn,

